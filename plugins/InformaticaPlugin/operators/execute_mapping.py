from airflow.models import BaseOperator
from airflow import utils as airflow_utils, AirflowException

from execution import runMapping


class ExecuteMapping(BaseOperator):

    @airflow_utils.apply_defaults
    def __init__(self, application_name, mapping_name, **kwargs):
        self.application_name = application_name
        self.mapping_name = mapping_name
        super(ExecuteMapping, self).__init__(
            **kwargs)

    def execute(self, context):
        print("dag: " + self.dag.full_filepath)
        print("dag_id: " + self.dag_id)
        print("task_type: " + self.task_type)
        print("task id: " + self.task_id)
        print("application_name: " + self.application_name)
        print("mapping_name: " + self.mapping_name)
        arguments = [
            "-a",
            self.application_name,
            "-m",
            self.mapping_name,
            # TODO: the others to be added
        ]
        infa = runMapping.ExecuteInformaticaMapping(arguments, False)
        result = infa.runit(infa.arguments)
        if result.rc != 0:
            raise AirflowException("RunMapping failed.")
