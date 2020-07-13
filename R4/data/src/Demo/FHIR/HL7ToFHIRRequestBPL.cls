/// This BPL converts HL7 data to FHIR
Class Demo.FHIR.HL7ToFHIRRequestBPL Extends Ens.BusinessProcessBPL
{

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='EnsLib.HL7.Message' response='Ens.Response' height='2000' width='2000' >
<context>
<property name='SDAContext' type='Ens.StreamContainer' instantiate='0' />
<property name='PatientMRN' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='50' />
</parameters>
</property>
</context>
<sequence xend='200' yend='550' >
<code name='Obtain MRN from HL7' xpos='200' ypos='250' >
<![CDATA[  if (request.DocTypeName="ADT_A01"){
    set context.PatientMRN = request.GetValueAt("PID:PatientID.IDNumber")
  }
  if (request.DocTypeName="ORU_R01") {
    $$$LOGINFO("Inside ORU")
    set context.PatientMRN = request.GetValueAt("PIDgrpgrp(1).PIDgrp.PID:PatientID.IDNumber")
  }]]>
</code>
<code name='Map HL7 to SDA' xpos='200' ypos='350' >
<![CDATA[  do ##class(HS.Gateway.HL7.HL7ToSDA3).GetSDA(request,.SDAContext)
  set context.SDAContext = SDAContext
  $$$LOGINFO("PatientMRN: "_context.PatientMRN)]]>
</code>
<call name='Map SDA to FHIR' target='HS.FHIR.DTL.Util.HC.SDA3.FHIR.Process' async='0' xpos='200' ypos='450' >
<annotation><![CDATA[Call HS.FHIR.DTL.Util.HC.SDA3.FHIR.Process]]></annotation>
<request type='HS.Message.XMLMessage' >
<assign property="callrequest.ContentStream" value="context.SDAContext" action="set" />
<assign property="callrequest.AdditionalInfo" value="context.PatientMRN" action="set" key="&quot;PatientResourceId&quot;" />
</request>
<response type='Ens.Response' />
</call>
</sequence>
</process>
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
