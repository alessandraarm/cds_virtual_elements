@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: '###GENERATED Core Data Service Entity'
define root view entity ZR_PO_TBL_98
  as select from ZPO_TBL_98
{
  key po_num as PoNum,
  org as Org,
  vendor as Vendor,
  status as Status,
  type as Type,
  reason as Reason,
  refno as Refno,
  @Semantics.user.createdBy: true
  create_by as CreateBy,
  @Semantics.systemDateTime.createdAt: true
  created_date_time as CreatedDateTime,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  changed_date_time as ChangedDateTime,
  @Semantics.user.localInstanceLastChangedBy: true
  local_last_changed_by as LocalLastChangedBy
  
}
