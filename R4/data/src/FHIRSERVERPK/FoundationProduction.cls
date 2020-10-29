/// Code to generate FHIR R4 Production
Class FHIRSERVERPKG.FoundationProduction Extends Ens.Production [ Not ProcedureBlock ]
{

XData ProductionDefinition
{
<Production Name="FHIRSERVERPKG.FoundationProduction" LogGeneralTraceEvents="false">
  <Description></Description>
  <ActorPoolSize>1</ActorPoolSize>
  <Item Name="HS.FHIRServer.Interop.Service" Category="Demo" ClassName="HS.FHIRServer.Interop.Service" PoolSize="0" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="AlertOnError">1</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="HS.FHIRServer.Interop.Operation" Category="Demo" ClassName="HS.FHIRServer.Interop.Operation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="TraceOperations">*FULL*</Setting>
  </Item>
  <Item Name="HS.FHIR.DTL.Util.HC.SDA3.FHIR.Process" Category="Demo" ClassName="HS.FHIR.DTL.Util.HC.SDA3.FHIR.Process" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="TargetConfigName">HS.FHIRServer.Interop.Operation</Setting>
    <Setting Target="Host" Name="FHIRMetadataSet">HL7v40 / Base HL7 Metadata for FHIR R4 (4.0.1)</Setting>
    <Setting Target="Host" Name="FHIREndpoint">/csp/healthshare/fhirserver/fhir/r4</Setting>
    <Setting Target="Host" Name="TraceOperations">*FULL*</Setting>
    <Setting Target="Host" Name="FormatFHIROutput">1</Setting>
    <Setting Target="Host" Name="FullTransactionResponse">0</Setting>
  </Item>
  <Item Name="HS.Util.Trace.Operations" Category="Demo" ClassName="HS.Util.Trace.Operations" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="Demo.FHIR.HL7ToFHIRRequestBPL" Category="Demo" ClassName="Demo.FHIR.HL7ToFHIRRequestBPL" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="RuleLogging">a</Setting>
  </Item>
  <Item Name="EnsLib.HL7.Service.FileService" Category="" ClassName="EnsLib.HL7.Service.FileService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="MessageSchemaCategory">2.3.1</Setting>
    <Setting Target="Adapter" Name="FilePath">/home/project/shared/samples-integration-FHIR/R4/In</Setting>
    <Setting Target="Adapter" Name="FileSpec">*</Setting>
    <Setting Target="Host" Name="TargetConfigNames">Demo.FHIR.HL7ToFHIRRequestBPL</Setting>
  </Item>
</Production>
}

}
