Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66CDA2727FC;
	Mon, 23 Feb 2026 16:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771865019; cv=fail; b=DB5RBEP/eg77JIWkuRH7tH34a7fg5xvAYCchOJmsjVQUbFdbzVrncMb98vyeTpTPk/ewPGKnuPhl0wzbJJUn/mCdwNCdAiCv8ZwdT3QfVm33yDFVrZADL2N+cuRxFeVX8aV7/wRojDcTWeAv1WdjaJzgvxTIKf2GTfnrAYvUeH4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771865019; c=relaxed/simple;
	bh=HSrkPCOsjblT7tBg5ySgddQtBJ4HE4NUPPRQSDgNb6g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EDU9Ix6eA2jLrMP9SdF+x7yILEWncrOZX/OxEKBo8Ey9N99P8DCnpmfDYUqm8L4ejffWfvehks1gLvDTUMKzoeVbYJTNtFxhpPSKoyrqG5U4VSOAOnx6i6bk5BwMaci3Xzxipzps6zUeR16Lr4SOu5ezl3mo4/DaE07nD1abN+A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Dv+CUIi8; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=dvVaQUfI; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Dv+CUIi8";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="dvVaQUfI"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NF9Sw41991961;
	Mon, 23 Feb 2026 10:43:36 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=7WIunDRHcTgPjZJY2Udsyb0SDgK8baYfyQGj24aowK4=; b=
	Dv+CUIi88JeZVGtfW8Otgk3gQKO9kkmDoZz/BmmIbsYQJ/SM6KteFt7kJlYugm/c
	ABOjjvt2VG8FJhPg1izGiVDrz7GofqDrgHcuNXGR69CEw5AJQBUNnBUJOopu8YBX
	fCpY3Gv6M7VjviEdGPyiWeAtMm8j3BcsjMyjCovCvS62zBZuN/ian1AgrMO/kJsZ
	QXHxtlEDyG2O+nc2F8kn1MKrPGrbFIeFcK0sabTz/Ps3tPjhEvHAlih+OefCT45A
	xBiF1L9z8VzY27r/WnBV1SblLbXi08pWGGU2KNbqTSsawca5xrFOxT1izV6DzX2V
	eVB625621EAyEf2XtXggtw==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11020124.outbound.protection.outlook.com [52.101.46.124])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4cfb019t2g-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 23 Feb 2026 10:43:35 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QXFxYbDZ5FKTVWDUTb4HaXXoXu2NQtX9pQ+24bfYExdxPnTJRLW84iIKUcYieIy29UlkGLoV/YneIT25pD/PQYei2ie3ml2RMGadwBDajOTTyTK+bAVkk3vlOncrfQnwRh4ol7D0fua6rpdtd6UCnE1Lx3h9KzKlXTi6KrT3U5DNshlRGTDtnZNcD4UZJsuDCmMkJAn3m8fzOtL7GgFp2DQJ9oFkegbWlSK/xGwchOvKjiMqJp9ntQdkhX9neCip3mQri7kPx6sRv6EwAclmOnnTFPwOR1GB3RAcpV90I0b7V239ouX8I8D7Wj3Qc2xTfxwJJr72W/xPVaXB+cFEIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7WIunDRHcTgPjZJY2Udsyb0SDgK8baYfyQGj24aowK4=;
 b=NCqfHu7Z1AAgELSP1rzVa8KbQ9dWb0Ylc/zbICUpLP1bQAKfY7TaV+QzUhKTVSMV4RPvF5kjxcLb+FN4ELUZuk22jEDFslXbgm9uqgWGHf/TgTYR9s7qdHhO+v6+9RlKkxRZ28MyiORQFoxT/jZvOhz5Z1j3XtY8jDKcvQh3O7TLiRj5F3G/M9YjVFygGWmGZ7TIYnJJlDDDbDOgUQrEdA6B3euQ85rQUs7GhATtXJ1rajD9FJEXmxMD/0LNpQ3RZ8u8cf/6WsOZxHF8AoOBrgt3jQFQZC++oPtHsvx7GaigqMEHnIhhM83rXExY68DXlpyUN5cG2wWsM5t7YMiQjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7WIunDRHcTgPjZJY2Udsyb0SDgK8baYfyQGj24aowK4=;
 b=dvVaQUfIT3VgywYsphmxTbSiakj8f7fFsHKz6qZepCsm9gTnlr77vEiWoOuY3QBn/agWFGF09NXp8KUSFbQWq1mdkQF2NlqW1Frvpi7C66x+RIQTt1cfRop1o+UgOu3VH9gSEZMkcGvuWNiG9qiaV2v8338ZlEFq77a4OwIr45Y=
Received: from MN2PR07CA0027.namprd07.prod.outlook.com (2603:10b6:208:1a0::37)
 by DS7PR19MB6232.namprd19.prod.outlook.com (2603:10b6:8:98::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 16:43:32 +0000
Received: from BL6PEPF0001AB4E.namprd04.prod.outlook.com
 (2603:10b6:208:1a0:cafe::5b) by MN2PR07CA0027.outlook.office365.com
 (2603:10b6:208:1a0::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.21 via Frontend Transport; Mon,
 23 Feb 2026 16:43:31 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL6PEPF0001AB4E.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.12
 via Frontend Transport; Mon, 23 Feb 2026 16:43:31 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 039CE406541;
	Mon, 23 Feb 2026 16:43:30 +0000 (UTC)
Received: from [198.90.208.24] (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id F001F82024B;
	Mon, 23 Feb 2026 16:43:29 +0000 (UTC)
Message-ID: <df66f504-d8e3-49f9-ac2f-121a7beac1e4@opensource.cirrus.com>
Date: Mon, 23 Feb 2026 16:43:29 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] ASoC: codecs: wm_adsp: Allow wm_adsp to hibernate
 without stopping DSP
To: Stefan Binding <sbinding@opensource.cirrus.com>,
        Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
References: <20260223160614.754934-1-sbinding@opensource.cirrus.com>
 <20260223160614.754934-3-sbinding@opensource.cirrus.com>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20260223160614.754934-3-sbinding@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4E:EE_|DS7PR19MB6232:EE_
X-MS-Office365-Filtering-Correlation-Id: efb5318e-aa3a-4054-0e3f-08de72faadb3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|61400799027|54012099003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Njl6K1J0ZHVGNmI1NkdYOGZlYW1XYzNhck1XNEdIa0JXNHg1Vy9YZjhrM2Nl?=
 =?utf-8?B?a2l2REYwcHNieEZZUXd2RkIwcGdGNlk2RVh4YWJJMkVkSWt5WXdua1lBS3lM?=
 =?utf-8?B?NzNzbUxHbzJMSGNReVQ3dmFHOTdqMEpCT0RzVW1Jcm5YdVR0bldDUzhyV1VE?=
 =?utf-8?B?bGdaR2NVcjdxa0dGams5V2c3UGtSaWJoOHFzZ05qQmd4Y1JOODA5OG1KWkg2?=
 =?utf-8?B?S0JEd0pUaUpibWxpbXA1Q2VXVUx0OWdTcUJRQ1VXWHFKSzlCQjR5b0I4bXJ1?=
 =?utf-8?B?dTBsZGJBVzZYVER0WWkyY25aWTVDeCt6KzlWNmVQeVVrVVRLTkFTM3g0LzFk?=
 =?utf-8?B?emJ5N3Y2Zk9iZ2d1OU9KNkJFalFET0lPMjFXbVVhYzJhTkZkOUhVMkhKeE5Z?=
 =?utf-8?B?YjY1UHdvR0FOWlhsOHJtaFFpK21qWExnUXA4dkpnMFdlTWMyR1dMcXoyRkRx?=
 =?utf-8?B?cFZ3WFdtN0RScXlhM1puWkkwRytRam03Mk5kbmp2L09kUHZHSCtsTnlzMWQv?=
 =?utf-8?B?QU9GcytJblIwZmt0VzJlYThMRllXSFROa2NXOEw0YVpabHFnTXQwTHRVejRO?=
 =?utf-8?B?dTNETlQxSlU0bVNDZFVUS0dMOC9QbzdRNWY3cDdwRDEzSzhvTE5HT1ZVTUY1?=
 =?utf-8?B?dEFOTDBXWVRSenVYNFFwRTdFcmRZWng2aDZXSWxxV04yaGtKZG9FTE9TdCtz?=
 =?utf-8?B?bzlnM2hUaitUYitOaVN1UUdjS2hHdVU1VXZ2MHkvc2NObmZEeUdJMGpvNEVz?=
 =?utf-8?B?d0dYQ1d3L1NsOTk3aGFoYXFPYmN1YlUybElIcHg4NUNaZFVkeVFkdUVNMld1?=
 =?utf-8?B?U2dJMWVCNkhzTnJSNEhIRHNPbktGN1MwZDdYekRGcWlVcG8vdGpPT2JoKzVH?=
 =?utf-8?B?cnNldkpZZFBMVGNoZmFGSTlSQ3dlb3E5MlhRLzg1NTA1ODlybDZyTnlYWlRs?=
 =?utf-8?B?RDE3aXVqRUhJVTFGNDViUGpLbzFZSUcwL1N5aDhJQ2JDVE8vNmp6TVJJdEMz?=
 =?utf-8?B?cFdYL20xWE13WG9CR1Z0U0VDZDJJb0xNRm9XUmdJNnNneGdXOWFSd3pXek1n?=
 =?utf-8?B?dE82LzNRZHdBMmpHeDl4dlRzKzA2VjgyZzkyZ21kVHZpQlVsRVJ1MmYyZ3VE?=
 =?utf-8?B?YVFXak1zWHBmSGVmTlQ1ZzY0VkdHcjJlaFZJdjd1bWExSHpiVzgyZVdISkt0?=
 =?utf-8?B?Rmk0VmlUWEc1Q004aHJkTEpQeE4vaXc5QStVYW5TbDBZY1pCUlgxZnNIdjZN?=
 =?utf-8?B?bEFoSmYwN1ptMzJLL1BReEtzYUYvVUJ2Z0FTRDQ2dHdaQjBMNE9TbXhTcXRX?=
 =?utf-8?B?UGtQUmdOaWF1R2dsZ0syd1NURkg1bGM1U0NXWGNvZU1ybEJDR2NDOGpWcGt6?=
 =?utf-8?B?MmYwOEtKY1VuNWFDWE4yS3FEUGt4U1JhSy81SVpmYm9IZHlBeDZzblF1Q2Jn?=
 =?utf-8?B?Qm5sS2c4WmFKVEh3T1l5V0VqOE5wYU4zOUJNdEdwMVN4NnhPUFhoSy9Xblkw?=
 =?utf-8?B?R1oxNTJuck9YeS9KZzdDbVg5c01jU3ErcCtvQUpkQVBoNG50VEdKb1YvdEVn?=
 =?utf-8?B?M0RZNnhRellCWXVkeDYzQWcxS1VobENPU1BaZFJOZ3VVcE40T2VHNTZIbGdN?=
 =?utf-8?B?SDl6bnpnR1pIa3M3ZEk2WGROY3YxUUxnMS9MSEI3NkxDNVI4NFlGWm5NbDY1?=
 =?utf-8?B?S1c0VXlpUFJleXFUckxwT0VFZjZzODB6K3dGMWF2MEJUUVVBNUY5OVZ3NmdE?=
 =?utf-8?B?Z0pQYXRaWUFZYk00N3EwUFBKZVJxSlBvcllkb1lXZi9aUkFualRJaHgwNTMz?=
 =?utf-8?B?NlhkeHBrUkNsUVREb3JXa21ESzJrYWY3YVJpVDR3Q2ozNXZYY1liQlpBbzdq?=
 =?utf-8?B?VHhSL0lkODVhK3NqUGZMUE9yQXVXMUpNUVQzeEtoSVFiZ2haTEZJZU9Qak5n?=
 =?utf-8?B?NXE4bGVPSWtsSHNFZzJ1RE9WUklUczZlZk52S1VaampVUHcveWhiaE1DejRB?=
 =?utf-8?B?c1lVQzk4VGk4cmFTbUZ6RXFkN2ptZVYzVzMzZEFSblo2YnRiR2xGYUdiWlpK?=
 =?utf-8?B?eFZsbVlWZDBhQW9obXlBT3h5SE1GQTA4bFdkNEl6d0FBRGR1VEpqcm5heG5M?=
 =?utf-8?B?cjRCV3V4WEdIdVh6RllGcVZUTVJXTnA0K2tvc2t3UkFBY0M1YWZiK1NYNFpi?=
 =?utf-8?B?dGRoQXVhcy9GdlNZODAwd3RMWm5mZDNPWE92QlNweDNqR1ZmZHV3SDN6aisw?=
 =?utf-8?B?TURLY2RDK29jZktMTk91Z3JOeGR3PT0=?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(61400799027)(54012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	PPPtVIJAQQ2PcS5+p86DslrUIC3aRHxR7R6GYjr/OI1qxxyLukBeoGM15gqmkbvyYonJBKSNWTD3L2UJyroryBhJ+Le+DC+rsTvi4+U4EGAi0GL61deinHxYxN1sr6RhXTZ/sbW1WawFEfYGkYLMWRH2rLfnB9cvpTffUCS6+QyjJ53vdi639tl+wSI+fGbuJMhVeNHfpr5J1RQVpjaMppGZxYdTzc171AsByphp4Gu0T8CseNR7dDO+v7PQhH/8KnKtZp5qklq8plmCaj7ZP7RS/Zr4HW/POJsPbp//F9zsuUQwXI9wz1avqEjDX+C4lR+4a3DVaJe1htY8svnRZ2rVz0wATXb4SbYKBR34cvTy1des8zfLgr48arMxMGg29aOTlV0cbIolrqu0MxcfxDdRU2Ln3UMl0P9JeO/97gUAiw+8D27bk1NaO4rOp7QH
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 16:43:31.2716
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: efb5318e-aa3a-4054-0e3f-08de72faadb3
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL6PEPF0001AB4E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR19MB6232
X-Proofpoint-ORIG-GUID: ZV8h7sPqWJH7Sjv6XOqCNP2x_OwcnZzs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDE0MyBTYWx0ZWRfXy2f5RU63pV4g
 0uc1DDHPxyLB2vb0cUGrNyznmhobjemPxjtr9sQLguquH/KwBRoMHouLDac/TL1d60eSLmHCC3z
 oWEtZPj6574P+Tlp9ezW1jCq0lbOHWCj6/qbAQ6hCT5aAmgaOFSck8j87U+c/UerkvVekGfo07K
 pcM2quAfQb35Zwr67lCiDPd/YeCrZ7GtQkCNFwIWcOzxXxEXqT4unAuR5YbBkA5lUuV9bD6N5Sn
 VapzPOXNTxTwcgbRsIZj0C70sXVlvzIyFmyd44jAahRxJZEI9SWBAVZJCyLRxCu1hjNsUSanlkS
 a6bf24YHR7MLuTv5H2IEP44N/7AqAtzi0hGJww/FY9tMA/9WwTaQIsDtis3jKBo81rpAGF/5YFR
 kBQ+S2neqc5UvKdODQK/gFaC9nr6nqh9E/adWpyJ2ijbCHVFOHUBPlqr+8aHnwNWc1+up7z9An+
 OY5Jlw1A/u034dhQ1+A==
X-Authority-Analysis: v=2.4 cv=V99wEOni c=1 sm=1 tr=0 ts=699c83b7 cx=c_pps
 a=KzuZNAusUQo1wHVwqbxTLg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=iv1VcKUMefkX4nZKvdQA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
X-Proofpoint-GUID: ZV8h7sPqWJH7Sjv6XOqCNP2x_OwcnZzs
X-Proofpoint-Spam-Reason: safe

On 23/02/2026 4:05 pm, Stefan Binding wrote:
> Some parts do not stop the DSP core before runtime suspend, however,
> this leaves the DSP controls enabled and accessible whilst the part is
> suspended and the regmap is cache_only.
> 
> Add new APIs to allow for the DSP to hibernate when the part is
> suspended, and the DSP is not shut down.
> 
> Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
> ---
Reviewed-by: Richard Fitzgerald <rf@opensource.cirrus.com>

