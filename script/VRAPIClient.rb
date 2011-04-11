#!/usr/bin/env ruby

module VRAPI

endpoint_url = ARGV.shift
obj = VRAPIPortType.new(endpoint_url)

# run ruby with -d to see SOAP wiredumps.
obj.wiredump_dev = STDERR if $DEBUG

# SYNOPSIS
#   addListMember(args)
#
# ARGS
#   args            AddListMemberArgs - {http://api.verticalresponse.com/1.0/VRAPI.xsd}addListMemberArgs
#
# RETURNS
#   result          ListMember - {http://api.verticalresponse.com/1.0/VRAPI.xsd}ListMember
#
args = nil
puts obj.addListMember(args)

# SYNOPSIS
#   appendFileToList(args)
#
# ARGS
#   args            AppendFileToListArgs - {http://api.verticalresponse.com/1.0/VRAPI.xsd}appendFileToListArgs
#
# RETURNS
#   result          AppendFileToListResult - {http://api.verticalresponse.com/1.0/VRAPI.xsd}appendFileToListResult
#
args = nil
puts obj.appendFileToList(args)

# SYNOPSIS
#   appendFileToListBackground(args)
#
# ARGS
#   args            AppendFileToListArgs - {http://api.verticalresponse.com/1.0/VRAPI.xsd}appendFileToListArgs
#
# RETURNS
#   background_task_id Int - {http://www.w3.org/2001/XMLSchema}int
#
args = nil
puts obj.appendFileToListBackground(args)

# SYNOPSIS
#   appendTemplateCampaignModule(args)
#
# ARGS
#   args            AppendTemplateCampaignModuleArgs - {http://api.verticalresponse.com/1.0/VRAPI.xsd}appendTemplateCampaignModuleArgs
#
# RETURNS
#   result          Boolean - {http://www.w3.org/2001/XMLSchema}boolean
#
args = nil
puts obj.appendTemplateCampaignModule(args)

# SYNOPSIS
#   calculateCampaignAudience(args)
#
# ARGS
#   args            CalculateCampaignAudienceArgs - {http://api.verticalresponse.com/1.0/VRAPI.xsd}calculateCampaignAudienceArgs
#
# RETURNS
#   result          CalculateCampaignAudienceResult - {http://api.verticalresponse.com/1.0/VRAPI.xsd}calculateCampaignAudienceResult
#
args = nil
puts obj.calculateCampaignAudience(args)

# SYNOPSIS
#   canCallMethod(args)
#
# ARGS
#   args            CanCallMethodArgs - {http://api.verticalresponse.com/1.0/VRAPI.xsd}canCallMethodArgs
#
# RETURNS
#   result          Boolean - {http://www.w3.org/2001/XMLSchema}boolean
#
args = nil
puts obj.canCallMethod(args)

# SYNOPSIS
#   compileCampaignRecipientResults(args)
#
# ARGS
#   args            CompileCampaignRecipientResultsArgs - {http://api.verticalresponse.com/1.0/VRAPI.xsd}compileCampaignRecipientResultsArgs
#
# RETURNS
#   result          CompileCampaignRecipientResultsResult - {http://api.verticalresponse.com/1.0/VRAPI.xsd}compileCampaignRecipientResultsResult
#
args = nil
puts obj.compileCampaignRecipientResults(args)

# SYNOPSIS
#   compileCampaignRecipientResultsBackground(args)
#
# ARGS
#   args            CompileCampaignRecipientResultsArgs - {http://api.verticalresponse.com/1.0/VRAPI.xsd}compileCampaignRecipientResultsArgs
#
# RETURNS
#   background_task_id Int - {http://www.w3.org/2001/XMLSchema}int
#
args = nil
puts obj.compileCampaignRecipientResultsBackground(args)

# SYNOPSIS
#   compileSegmentationQuery(args)
#
# ARGS
#   args            CompileSegmentationQueryArgs - {http://api.verticalresponse.com/1.0/VRAPI.xsd}compileSegmentationQueryArgs
#
# RETURNS
#   result          ArrayOfList - {http://api.verticalresponse.com/1.0/VRAPI.xsd}ArrayOfList
#
args = nil
puts obj.compileSegmentationQuery(args)

# SYNOPSIS
#   compileSegmentationQueryBackground(args)
#
# ARGS
#   args            CompileSegmentationQueryArgs - {http://api.verticalresponse.com/1.0/VRAPI.xsd}compileSegmentationQueryArgs
#
# RETURNS
#   result          Boolean - {http://www.w3.org/2001/XMLSchema}boolean
#
args = nil
puts obj.compileSegmentationQueryBackground(args)

# SYNOPSIS
#   createEmailCampaign(args)
#
# ARGS
#   args            CreateEmailCampaignArgs - {http://api.verticalresponse.com/1.0/VRAPI.xsd}createEmailCampaignArgs
#
# RETURNS
#   result          Int - {http://www.w3.org/2001/XMLSchema}int
#
args = nil
puts obj.createEmailCampaign(args)

# SYNOPSIS
#   createFile(args)
#
# ARGS
#   args            CreateFileArgs - {http://api.verticalresponse.com/1.0/VRAPI.xsd}createFileArgs
#
# RETURNS
#   result          Boolean - {http://www.w3.org/2001/XMLSchema}boolean
#
args = nil
puts obj.createFile(args)

# SYNOPSIS
#   createList(args)
#
# ARGS
#   args            CreateListArgs - {http://api.verticalresponse.com/1.0/VRAPI.xsd}createListArgs
#
# RETURNS
#   list_id         Int - {http://www.w3.org/2001/XMLSchema}int
#
args = nil
puts obj.createList(args)

# SYNOPSIS
#   createOptinForm(args)
#
# ARGS
#   args            CreateOptinFormArgs - {http://api.verticalresponse.com/1.0/VRAPI.xsd}createOptinFormArgs
#
# RETURNS
#   optin_form_id   Int - {http://www.w3.org/2001/XMLSchema}int
#
args = nil
puts obj.createOptinForm(args)

# SYNOPSIS
#   createSegmentationQuery(args)
#
# ARGS
#   args            CreateSegmentationQueryArgs - {http://api.verticalresponse.com/1.0/VRAPI.xsd}createSegmentationQueryArgs
#
# RETURNS
#   query_id        Int - {http://www.w3.org/2001/XMLSchema}int
#
args = nil
puts obj.createSegmentationQuery(args)

# SYNOPSIS
#   createSfList(args)
#
# ARGS
#   args            CreateSfListArgs - {http://api.verticalresponse.com/1.0/VRAPI.xsd}createSfListArgs
#
# RETURNS
#   result          AppendFileToListResult - {http://api.verticalresponse.com/1.0/VRAPI.xsd}appendFileToListResult
#
args = nil
puts obj.createSfList(args)

# SYNOPSIS
#   deleteCampaign(args)
#
# ARGS
#   args            DeleteCampaignArgs - {http://api.verticalresponse.com/1.0/VRAPI.xsd}deleteCampaignArgs
#
# RETURNS
#   result          Boolean - {http://www.w3.org/2001/XMLSchema}boolean
#
args = nil
puts obj.deleteCampaign(args)

# SYNOPSIS
#   deleteFile(args)
#
# ARGS
#   args            DeleteFileArgs - {http://api.verticalresponse.com/1.0/VRAPI.xsd}deleteFileArgs
#
# RETURNS
#   result          Boolean - {http://www.w3.org/2001/XMLSchema}boolean
#
args = nil
puts obj.deleteFile(args)

# SYNOPSIS
#   deleteList(args)
#
# ARGS
#   args            DeleteListArgs - {http://api.verticalresponse.com/1.0/VRAPI.xsd}deleteListArgs
#
# RETURNS
#   result          Boolean - {http://www.w3.org/2001/XMLSchema}boolean
#
args = nil
puts obj.deleteList(args)

# SYNOPSIS
#   deleteListMember(args)
#
# ARGS
#   args            DeleteListMemberArgs - {http://api.verticalresponse.com/1.0/VRAPI.xsd}deleteListMemberArgs
#
# RETURNS
#   result          Boolean - {http://www.w3.org/2001/XMLSchema}boolean
#
args = nil
puts obj.deleteListMember(args)

# SYNOPSIS
#   deleteSegmentationQuery(args)
#
# ARGS
#   args            DeleteSegmentationQueryArgs - {http://api.verticalresponse.com/1.0/VRAPI.xsd}deleteSegmentationQueryArgs
#
# RETURNS
#   result          Boolean - {http://www.w3.org/2001/XMLSchema}boolean
#
args = nil
puts obj.deleteSegmentationQuery(args)

# SYNOPSIS
#   deleteTemplateCampaignModule(args)
#
# ARGS
#   args            DeleteTemplateCampaignModuleArgs - {http://api.verticalresponse.com/1.0/VRAPI.xsd}deleteTemplateCampaignModuleArgs
#
# RETURNS
#   result          Boolean - {http://www.w3.org/2001/XMLSchema}boolean
#
args = nil
puts obj.deleteTemplateCampaignModule(args)

# SYNOPSIS
#   downloadCampaignRecipientResults(args)
#
# ARGS
#   args            DownloadCampaignRecipientResultsArgs - {http://api.verticalresponse.com/1.0/VRAPI.xsd}downloadCampaignRecipientResultsArgs
#
# RETURNS
#   result          DownloadCampaignRecipientResultsResult - {http://api.verticalresponse.com/1.0/VRAPI.xsd}downloadCampaignRecipientResultsResult
#
args = nil
puts obj.downloadCampaignRecipientResults(args)

# SYNOPSIS
#   downloadCampaignRecipientResultsBackground(args)
#
# ARGS
#   args            DownloadCampaignRecipientResultsArgs - {http://api.verticalresponse.com/1.0/VRAPI.xsd}downloadCampaignRecipientResultsArgs
#
# RETURNS
#   background_task_id Int - {http://www.w3.org/2001/XMLSchema}int
#
args = nil
puts obj.downloadCampaignRecipientResultsBackground(args)

# SYNOPSIS
#   downloadCompanyUnsubscribesAndBounces(args)
#
# ARGS
#   args            DownloadCompanyUnsubscribesAndBouncesArgs - {http://api.verticalresponse.com/1.0/VRAPI.xsd}downloadCompanyUnsubscribesAndBouncesArgs
#
# RETURNS
#   result          DownloadCompanyUnsubscribesAndBouncesResult - {http://api.verticalresponse.com/1.0/VRAPI.xsd}downloadCompanyUnsubscribesAndBouncesResult
#
args = nil
puts obj.downloadCompanyUnsubscribesAndBounces(args)

# SYNOPSIS
#   downloadList(args)
#
# ARGS
#   args            DownloadListArgs - {http://api.verticalresponse.com/1.0/VRAPI.xsd}downloadListArgs
#
# RETURNS
#   result          DownloadListResult - {http://api.verticalresponse.com/1.0/VRAPI.xsd}downloadListResult
#
args = nil
puts obj.downloadList(args)

# SYNOPSIS
#   downloadListBackground(args)
#
# ARGS
#   args            DownloadListArgs - {http://api.verticalresponse.com/1.0/VRAPI.xsd}downloadListArgs
#
# RETURNS
#   background_task_id Int - {http://www.w3.org/2001/XMLSchema}int
#
args = nil
puts obj.downloadListBackground(args)

# SYNOPSIS
#   editCompany(args)
#
# ARGS
#   args            EditCompanyArgs - {http://api.verticalresponse.com/1.0/VRAPI.xsd}editCompanyArgs
#
# RETURNS
#   result          Boolean - {http://www.w3.org/2001/XMLSchema}boolean
#
args = nil
puts obj.editCompany(args)

# SYNOPSIS
#   editListAttribute(args)
#
# ARGS
#   args            EditListAttributeArgs - {http://api.verticalresponse.com/1.0/VRAPI.xsd}editListAttributeArgs
#
# RETURNS
#   result          Boolean - {http://www.w3.org/2001/XMLSchema}boolean
#
args = nil
puts obj.editListAttribute(args)

# SYNOPSIS
#   editListMember(args)
#
# ARGS
#   args            EditListMemberArgs - {http://api.verticalresponse.com/1.0/VRAPI.xsd}editListMemberArgs
#
# RETURNS
#   result          ListMember - {http://api.verticalresponse.com/1.0/VRAPI.xsd}ListMember
#
args = nil
puts obj.editListMember(args)

# SYNOPSIS
#   editListMembers(args)
#
# ARGS
#   args            EditListMembersArgs - {http://api.verticalresponse.com/1.0/VRAPI.xsd}editListMembersArgs
#
# RETURNS
#   result          Boolean - {http://www.w3.org/2001/XMLSchema}boolean
#
args = nil
puts obj.editListMembers(args)

# SYNOPSIS
#   editSegmentationQuery(args)
#
# ARGS
#   args            EditSegmentationQueryArgs - {http://api.verticalresponse.com/1.0/VRAPI.xsd}editSegmentationQueryArgs
#
# RETURNS
#   result          Boolean - {http://www.w3.org/2001/XMLSchema}boolean
#
args = nil
puts obj.editSegmentationQuery(args)

# SYNOPSIS
#   editUser(args)
#
# ARGS
#   args            EditUserArgs - {http://api.verticalresponse.com/1.0/VRAPI.xsd}editUserArgs
#
# RETURNS
#   result          Boolean - {http://www.w3.org/2001/XMLSchema}boolean
#
args = nil
puts obj.editUser(args)

# SYNOPSIS
#   emptyTrash(args)
#
# ARGS
#   args            EmptyTrashArgs - {http://api.verticalresponse.com/1.0/VRAPI.xsd}emptyTrashArgs
#
# RETURNS
#   result          Boolean - {http://www.w3.org/2001/XMLSchema}boolean
#
args = nil
puts obj.emptyTrash(args)

# SYNOPSIS
#   enumerateEmailCampaigns(args)
#
# ARGS
#   args            EnumerateEmailCampaignsArgs - {http://api.verticalresponse.com/1.0/VRAPI.xsd}enumerateEmailCampaignsArgs
#
# RETURNS
#   result          ArrayOfEmailCampaign - {http://api.verticalresponse.com/1.0/VRAPI.xsd}ArrayOfEmailCampaign
#
args = nil
puts obj.enumerateEmailCampaigns(args)

# SYNOPSIS
#   enumerateFiles(args)
#
# ARGS
#   args            EnumerateFilesArgs - {http://api.verticalresponse.com/1.0/VRAPI.xsd}enumerateFilesArgs
#
# RETURNS
#   result          ArrayOfFileSpec - {http://api.verticalresponse.com/1.0/VRAPI.xsd}ArrayOfFileSpec
#
args = nil
puts obj.enumerateFiles(args)

# SYNOPSIS
#   enumerateLists(args)
#
# ARGS
#   args            EnumerateListsArgs - {http://api.verticalresponse.com/1.0/VRAPI.xsd}enumerateListsArgs
#
# RETURNS
#   result          ArrayOfList - {http://api.verticalresponse.com/1.0/VRAPI.xsd}ArrayOfList
#
args = nil
puts obj.enumerateLists(args)

# SYNOPSIS
#   enumerateSegmentationQueries(args)
#
# ARGS
#   args            EnumerateSegmentationQueriesArgs - {http://api.verticalresponse.com/1.0/VRAPI.xsd}enumerateSegmentationQueriesArgs
#
# RETURNS
#   result          ArrayOfSegmentationQuery - {http://api.verticalresponse.com/1.0/VRAPI.xsd}ArrayOfSegmentationQuery
#
args = nil
puts obj.enumerateSegmentationQueries(args)

# SYNOPSIS
#   eraseListMembers(args)
#
# ARGS
#   args            EraseListMembersArgs - {http://api.verticalresponse.com/1.0/VRAPI.xsd}eraseListMembersArgs
#
# RETURNS
#   result          Boolean - {http://www.w3.org/2001/XMLSchema}boolean
#
args = nil
puts obj.eraseListMembers(args)

# SYNOPSIS
#   fetchAppendFileToListBackgroundResult(args)
#
# ARGS
#   args            FetchBackgroundResultArgs - {http://api.verticalresponse.com/1.0/VRAPI.xsd}fetchBackgroundResultArgs
#
# RETURNS
#   result          AppendFileToListResult - {http://api.verticalresponse.com/1.0/VRAPI.xsd}appendFileToListResult
#
args = nil
puts obj.fetchAppendFileToListBackgroundResult(args)

# SYNOPSIS
#   fetchCompileCampaignRecipientResultsBackgroundResult(args)
#
# ARGS
#   args            FetchBackgroundResultArgs - {http://api.verticalresponse.com/1.0/VRAPI.xsd}fetchBackgroundResultArgs
#
# RETURNS
#   result          CompileCampaignRecipientResultsResult - {http://api.verticalresponse.com/1.0/VRAPI.xsd}compileCampaignRecipientResultsResult
#
args = nil
puts obj.fetchCompileCampaignRecipientResultsBackgroundResult(args)

# SYNOPSIS
#   fetchDownloadCampaignRecipientResultsBackgroundResult(args)
#
# ARGS
#   args            FetchBackgroundResultArgs - {http://api.verticalresponse.com/1.0/VRAPI.xsd}fetchBackgroundResultArgs
#
# RETURNS
#   result          DownloadCampaignRecipientResultsResult - {http://api.verticalresponse.com/1.0/VRAPI.xsd}downloadCampaignRecipientResultsResult
#
args = nil
puts obj.fetchDownloadCampaignRecipientResultsBackgroundResult(args)

# SYNOPSIS
#   fetchDownloadListBackgroundResult(args)
#
# ARGS
#   args            FetchBackgroundResultArgs - {http://api.verticalresponse.com/1.0/VRAPI.xsd}fetchBackgroundResultArgs
#
# RETURNS
#   result          DownloadListResult - {http://api.verticalresponse.com/1.0/VRAPI.xsd}downloadListResult
#
args = nil
puts obj.fetchDownloadListBackgroundResult(args)

# SYNOPSIS
#   fetchRunSegmentationQueryBackgroundResult(args)
#
# ARGS
#   args            FetchBackgroundResultArgs - {http://api.verticalresponse.com/1.0/VRAPI.xsd}fetchBackgroundResultArgs
#
# RETURNS
#   result_size     Int - {http://www.w3.org/2001/XMLSchema}int
#
args = nil
puts obj.fetchRunSegmentationQueryBackgroundResult(args)

# SYNOPSIS
#   getBackgroundTaskStatus(args)
#
# ARGS
#   args            GetBackgroundTaskStatusArgs - {http://api.verticalresponse.com/1.0/VRAPI.xsd}getBackgroundTaskStatusArgs
#
# RETURNS
#   result          BackgroundTaskStatus - {http://api.verticalresponse.com/1.0/VRAPI.xsd}BackgroundTaskStatus
#
args = nil
puts obj.getBackgroundTaskStatus(args)

# SYNOPSIS
#   getCampaignDomainCount(args)
#
# ARGS
#   args            GetCampaignDomainCountArgs - {http://api.verticalresponse.com/1.0/VRAPI.xsd}getCampaignDomainCountArgs
#
# RETURNS
#   result          GetCampaignDomainCountResult - {http://api.verticalresponse.com/1.0/VRAPI.xsd}getCampaignDomainCountResult
#
args = nil
puts obj.getCampaignDomainCount(args)

# SYNOPSIS
#   getCompany(args)
#
# ARGS
#   args            GetCompanyArgs - {http://api.verticalresponse.com/1.0/VRAPI.xsd}getCompanyArgs
#
# RETURNS
#   result          Company - {http://api.verticalresponse.com/1.0/VRAPI.xsd}Company
#
args = nil
puts obj.getCompany(args)

# SYNOPSIS
#   getCompanySummary(args)
#
# ARGS
#   args            GetCompanySummaryArgs - {http://api.verticalresponse.com/1.0/VRAPI.xsd}getCompanySummaryArgs
#
# RETURNS
#   result          NVDictionary - {http://api.verticalresponse.com/1.0/VRAPI.xsd}NVDictionary
#
args = nil
puts obj.getCompanySummary(args)

# SYNOPSIS
#   getEmailCampaignDeclineHistory(args)
#
# ARGS
#   args            GetEmailCampaignDeclineHistoryArgs - {http://api.verticalresponse.com/1.0/VRAPI.xsd}getEmailCampaignDeclineHistoryArgs
#
# RETURNS
#   result          ArrayOfEmailCampaignDecline - {http://api.verticalresponse.com/1.0/VRAPI.xsd}ArrayOfEmailCampaignDecline
#
args = nil
puts obj.getEmailCampaignDeclineHistory(args)

# SYNOPSIS
#   getEmailCampaignResponseHistograms(args)
#
# ARGS
#   args            GetEmailCampaignResponseHistogramsArgs - {http://api.verticalresponse.com/1.0/VRAPI.xsd}getEmailCampaignResponseHistogramsArgs
#
# RETURNS
#   result          ArrayOfEmailCampaignResponseHistogram - {http://api.verticalresponse.com/1.0/VRAPI.xsd}ArrayOfEmailCampaignResponseHistogram
#
args = nil
puts obj.getEmailCampaignResponseHistograms(args)

# SYNOPSIS
#   getEmailCampaignStats(args)
#
# ARGS
#   args            GetEmailCampaignStatsArgs - {http://api.verticalresponse.com/1.0/VRAPI.xsd}getEmailCampaignStatsArgs
#
# RETURNS
#   result          EmailCampaignStats - {http://api.verticalresponse.com/1.0/VRAPI.xsd}EmailCampaignStats
#
args = nil
puts obj.getEmailCampaignStats(args)

# SYNOPSIS
#   getEmailCreditBalance(args)
#
# ARGS
#   args            GetEmailCreditBalanceArgs - {http://api.verticalresponse.com/1.0/VRAPI.xsd}getEmailCreditBalanceArgs
#
# RETURNS
#   result          Int - {http://www.w3.org/2001/XMLSchema}int
#
args = nil
puts obj.getEmailCreditBalance(args)

# SYNOPSIS
#   getListDomainCount(args)
#
# ARGS
#   args            GetListDomainCountArgs - {http://api.verticalresponse.com/1.0/VRAPI.xsd}getListDomainCountArgs
#
# RETURNS
#   result          GetListDomainCountResult - {http://api.verticalresponse.com/1.0/VRAPI.xsd}getListDomainCountResult
#
args = nil
puts obj.getListDomainCount(args)

# SYNOPSIS
#   getListMemberByAddressHash(args)
#
# ARGS
#   args            GetListMemberByAddressHashArgs - {http://api.verticalresponse.com/1.0/VRAPI.xsd}getListMemberByAddressHashArgs
#
# RETURNS
#   result          ListMember - {http://api.verticalresponse.com/1.0/VRAPI.xsd}ListMember
#
args = nil
puts obj.getListMemberByAddressHash(args)

# SYNOPSIS
#   getListMemberByEmailAddress(args)
#
# ARGS
#   args            GetListMemberByEmailAddressArgs - {http://api.verticalresponse.com/1.0/VRAPI.xsd}getListMemberByEmailAddressArgs
#
# RETURNS
#   result          ListMember - {http://api.verticalresponse.com/1.0/VRAPI.xsd}ListMember
#
args = nil
puts obj.getListMemberByEmailAddress(args)

# SYNOPSIS
#   getListMemberByHash(args)
#
# ARGS
#   args            GetListMemberByHashArgs - {http://api.verticalresponse.com/1.0/VRAPI.xsd}getListMemberByHashArgs
#
# RETURNS
#   result          ListMember - {http://api.verticalresponse.com/1.0/VRAPI.xsd}ListMember
#
args = nil
puts obj.getListMemberByHash(args)

# SYNOPSIS
#   getListMembers(args)
#
# ARGS
#   args            GetListMembersArgs - {http://api.verticalresponse.com/1.0/VRAPI.xsd}getListMembersArgs
#
# RETURNS
#   result          ArrayOfListMember - {http://api.verticalresponse.com/1.0/VRAPI.xsd}ArrayOfListMember
#
args = nil
puts obj.getListMembers(args)

# SYNOPSIS
#   getPricingStructure(args)
#
# ARGS
#   args            GetPricingStructureArgs - {http://api.verticalresponse.com/1.0/VRAPI.xsd}getPricingStructureArgs
#
# RETURNS
#   result          ArrayOfPricingStructureTier - {http://api.verticalresponse.com/1.0/VRAPI.xsd}ArrayOfPricingStructureTier
#
args = nil
puts obj.getPricingStructure(args)

# SYNOPSIS
#   getPurchaseQuotation(args)
#
# ARGS
#   args            GetPurchaseQuotationArgs - {http://api.verticalresponse.com/1.0/VRAPI.xsd}getPurchaseQuotationArgs
#
# RETURNS
#   result          GetPurchaseQuotationResult - {http://api.verticalresponse.com/1.0/VRAPI.xsd}getPurchaseQuotationResult
#
args = nil
puts obj.getPurchaseQuotation(args)

# SYNOPSIS
#   getUser(args)
#
# ARGS
#   args            GetUserArgs - {http://api.verticalresponse.com/1.0/VRAPI.xsd}getUserArgs
#
# RETURNS
#   result          User - {http://api.verticalresponse.com/1.0/VRAPI.xsd}User
#
args = nil
puts obj.getUser(args)

# SYNOPSIS
#   getUserByEmailAddress(args)
#
# ARGS
#   args            GetUserByEmailAddressArgs - {http://api.verticalresponse.com/1.0/VRAPI.xsd}getUserByEmailAddressArgs
#
# RETURNS
#   result          User - {http://api.verticalresponse.com/1.0/VRAPI.xsd}User
#
args = nil
puts obj.getUserByEmailAddress(args)

# SYNOPSIS
#   launchEmailCampaign(args)
#
# ARGS
#   args            LaunchEmailCampaignArgs - {http://api.verticalresponse.com/1.0/VRAPI.xsd}launchEmailCampaignArgs
#
# RETURNS
#   args            LaunchEmailCampaignResult - {http://api.verticalresponse.com/1.0/VRAPI.xsd}launchEmailCampaignResult
#
args = nil
puts obj.launchEmailCampaign(args)

# SYNOPSIS
#   login(args)
#
# ARGS
#   args            LoginArgs - {http://api.verticalresponse.com/1.0/VRAPI.xsd}loginArgs
#
# RETURNS
#   sessionId       C_String - {http://www.w3.org/2001/XMLSchema}string
#
args = nil
puts obj.login(args)

# SYNOPSIS
#   moveFile(args)
#
# ARGS
#   args            MoveFileArgs - {http://api.verticalresponse.com/1.0/VRAPI.xsd}moveFileArgs
#
# RETURNS
#   result          Boolean - {http://www.w3.org/2001/XMLSchema}boolean
#
args = nil
puts obj.moveFile(args)

# SYNOPSIS
#   refresh(args)
#
# ARGS
#   args            RefreshArgs - {http://api.verticalresponse.com/1.0/VRAPI.xsd}refreshArgs
#
# RETURNS
#   result          Boolean - {http://www.w3.org/2001/XMLSchema}boolean
#
args = nil
puts obj.refresh(args)

# SYNOPSIS
#   renderCampaignContent(args)
#
# ARGS
#   args            RenderCampaignContentArgs - {http://api.verticalresponse.com/1.0/VRAPI.xsd}renderCampaignContentArgs
#
# RETURNS
#   result          RenderCampaignContentResult - {http://api.verticalresponse.com/1.0/VRAPI.xsd}renderCampaignContentResult
#
args = nil
puts obj.renderCampaignContent(args)

# SYNOPSIS
#   runSegmentationQuery(args)
#
# ARGS
#   args            RunSegmentationQueryArgs - {http://api.verticalresponse.com/1.0/VRAPI.xsd}runSegmentationQueryArgs
#
# RETURNS
#   result_size     Int - {http://www.w3.org/2001/XMLSchema}int
#
args = nil
puts obj.runSegmentationQuery(args)

# SYNOPSIS
#   runSegmentationQueryBackground(args)
#
# ARGS
#   args            RunSegmentationQueryArgs - {http://api.verticalresponse.com/1.0/VRAPI.xsd}runSegmentationQueryArgs
#
# RETURNS
#   background_task_id Int - {http://www.w3.org/2001/XMLSchema}int
#
args = nil
puts obj.runSegmentationQueryBackground(args)

# SYNOPSIS
#   searchListMembers(args)
#
# ARGS
#   args            SearchListMembersArgs - {http://api.verticalresponse.com/1.0/VRAPI.xsd}searchListMembersArgs
#
# RETURNS
#   result          ArrayOfListMember - {http://api.verticalresponse.com/1.0/VRAPI.xsd}ArrayOfListMember
#
args = nil
puts obj.searchListMembers(args)

# SYNOPSIS
#   sendEmailCampaignTest(args)
#
# ARGS
#   args            SendEmailCampaignTestArgs - {http://api.verticalresponse.com/1.0/VRAPI.xsd}sendEmailCampaignTestArgs
#
# RETURNS
#   args            SendEmailCampaignTestResult - {http://api.verticalresponse.com/1.0/VRAPI.xsd}sendEmailCampaignTestResult
#
args = nil
puts obj.sendEmailCampaignTest(args)

# SYNOPSIS
#   setCampaignLists(args)
#
# ARGS
#   args            SetCampaignListsArgs - {http://api.verticalresponse.com/1.0/VRAPI.xsd}setCampaignListsArgs
#
# RETURNS
#   result          Boolean - {http://www.w3.org/2001/XMLSchema}boolean
#
args = nil
puts obj.setCampaignLists(args)

# SYNOPSIS
#   setCustomListFields(args)
#
# ARGS
#   args            SetCustomListFieldsArgs - {http://api.verticalresponse.com/1.0/VRAPI.xsd}setCustomListFieldsArgs
#
# RETURNS
#   result          Boolean - {http://www.w3.org/2001/XMLSchema}boolean
#
args = nil
puts obj.setCustomListFields(args)

# SYNOPSIS
#   setDisplayedListFields(args)
#
# ARGS
#   args            SetDisplayedListFieldsArgs - {http://api.verticalresponse.com/1.0/VRAPI.xsd}setDisplayedListFieldsArgs
#
# RETURNS
#   result          Boolean - {http://www.w3.org/2001/XMLSchema}boolean
#
args = nil
puts obj.setDisplayedListFields(args)

# SYNOPSIS
#   setEmailCampaignAttribute(args)
#
# ARGS
#   args            SetEmailCampaignAttributeArgs - {http://api.verticalresponse.com/1.0/VRAPI.xsd}setEmailCampaignAttributeArgs
#
# RETURNS
#   result          Boolean - {http://www.w3.org/2001/XMLSchema}boolean
#
args = nil
puts obj.setEmailCampaignAttribute(args)

# SYNOPSIS
#   setEmailCampaignContent(args)
#
# ARGS
#   args            SetEmailCampaignContentArgs - {http://api.verticalresponse.com/1.0/VRAPI.xsd}setEmailCampaignContentArgs
#
# RETURNS
#   result          Boolean - {http://www.w3.org/2001/XMLSchema}boolean
#
args = nil
puts obj.setEmailCampaignContent(args)

# SYNOPSIS
#   setIndexedListFields(args)
#
# ARGS
#   args            SetIndexedListFieldsArgs - {http://api.verticalresponse.com/1.0/VRAPI.xsd}setIndexedListFieldsArgs
#
# RETURNS
#   result          Boolean - {http://www.w3.org/2001/XMLSchema}boolean
#
args = nil
puts obj.setIndexedListFields(args)

# SYNOPSIS
#   setTemplateCampaignModule(args)
#
# ARGS
#   args            SetTemplateCampaignModuleArgs - {http://api.verticalresponse.com/1.0/VRAPI.xsd}setTemplateCampaignModuleArgs
#
# RETURNS
#   result          Boolean - {http://www.w3.org/2001/XMLSchema}boolean
#
args = nil
puts obj.setTemplateCampaignModule(args)

# SYNOPSIS
#   transferEmailCredits(args)
#
# ARGS
#   args            TransferEmailCreditsArgs - {http://api.verticalresponse.com/1.0/VRAPI.xsd}transferEmailCreditsArgs
#
# RETURNS
#   result          Boolean - {http://www.w3.org/2001/XMLSchema}boolean
#
args = nil
puts obj.transferEmailCredits(args)

# SYNOPSIS
#   undeleteCampaign(args)
#
# ARGS
#   args            UndeleteCampaignArgs - {http://api.verticalresponse.com/1.0/VRAPI.xsd}undeleteCampaignArgs
#
# RETURNS
#   result          Boolean - {http://www.w3.org/2001/XMLSchema}boolean
#
args = nil
puts obj.undeleteCampaign(args)

# SYNOPSIS
#   undeleteList(args)
#
# ARGS
#   args            UndeleteListArgs - {http://api.verticalresponse.com/1.0/VRAPI.xsd}undeleteListArgs
#
# RETURNS
#   result          Boolean - {http://www.w3.org/2001/XMLSchema}boolean
#
args = nil
puts obj.undeleteList(args)

# SYNOPSIS
#   undeleteSegmentationQuery(args)
#
# ARGS
#   args            UndeleteSegmentationQueryArgs - {http://api.verticalresponse.com/1.0/VRAPI.xsd}undeleteSegmentationQueryArgs
#
# RETURNS
#   result          Boolean - {http://www.w3.org/2001/XMLSchema}boolean
#
args = nil
puts obj.undeleteSegmentationQuery(args)

# SYNOPSIS
#   unlaunchEmailCampaign(args)
#
# ARGS
#   args            UnlaunchEmailCampaignArgs - {http://api.verticalresponse.com/1.0/VRAPI.xsd}unlaunchEmailCampaignArgs
#
# RETURNS
#   result          Boolean - {http://www.w3.org/2001/XMLSchema}boolean
#
args = nil
puts obj.unlaunchEmailCampaign(args)

# SYNOPSIS
#   validateStreetAddress(args)
#
# ARGS
#   args            ValidateStreetAddressArgs - {http://api.verticalresponse.com/1.0/VRAPI.xsd}validateStreetAddressArgs
#
# RETURNS
#   result          ValidateStreetAddressResult - {http://api.verticalresponse.com/1.0/VRAPI.xsd}validateStreetAddressResult
#
args = nil
puts obj.validateStreetAddress(args)




end
