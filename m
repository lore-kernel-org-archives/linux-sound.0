Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B51852D542E
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 10:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752141971; cv=fail; b=AxVRm+/1CsFtTaiLQvdoBihkgvtSWn13joKjMAxpYRnCGNtWIg444+KGHz88f3gHH8uWRO5J3V4cLVSyDyAnAJk7mxipD2RO7rK3mLL8WUyRI7b9AW2EZYcYy+bNEGTrjkPYUiCPnPsdDOTLBblSQesHSV5GSiDwsh/4D9ZgLOs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752141971; c=relaxed/simple;
	bh=+gukj16Xxe8ftrlTFW0ToyJrQew9pnFO9xC8fBhBSjo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RcKKMqpNXroJQKUvHhGmLna+/LwZ9hGFR4KDNNgZd4DtCkR9QPaTKyHpuvpRviJj6voRnhlDLH128JN11tJHX5nSk2Hm6UtQPcUgkQIgFRrna2bmMspS4yqx0CmwC5YphYvR6KER6Pc34SExA0mEEf8Hh6AfHWzDokwDgfEwtlo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=NDFWA3kd; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=ozMnloB+; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="NDFWA3kd";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="ozMnloB+"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56A4wXtW028232;
	Thu, 10 Jul 2025 05:05:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=wMUq6nNiYr8qJZC55k4as+MofMJlT9oXDJrMUOfIgrI=; b=
	NDFWA3kdQaY06yRXScdcSWTMpboZ7rknlKcjahDIWLsP1FNnkmDpEqimatAenLYr
	gIhQauzH+A3E9nZRGyeRGwRhKckGHLvLJwlB7Nnc5VBpFjNVqmaPe5dPnVOAxbbO
	WOdvzvzYRrsNfL1A56DO8H9BR3igF/ZZyAwQNiHuH6G6lhdoKpfB5BjAxa7ilTMb
	H1wfD6VUap3gxmtwtj5RvBKz4ONWk8mHMJtnTSqMK0dYDD/99QIOXktfRIFGsk0k
	D16Dt9BzIJNh3N35Gr7CjiUWVvFO9N33nwyerXdTMFHdHVmVjoDFaAx8z1lFU9fi
	PdeTStvtmQCTRIm06L3oAA==
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2111.outbound.protection.outlook.com [40.107.220.111])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 47sev6b6hk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Jul 2025 05:05:45 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FWD3Nj1J/UAGpu4ZDc10YRAWUE2Y3BCxY3olRthAXL2zaHTuRndriwErIzD+405y0kcge2RtA8JjL/tTHqiomCw+ZBSSfA85zcr+aplAmIc/M0qTM1s164ImvT6mD+aIqO8XQmgL4F3YawCANS6L969Q+33JeGAdwoLgzr3jqFrVc6F37W9haOgEkmXo2IMBQ3GQeDbn06ucGR4jp5mg3EjTJEXq27srEuztknaTN0ad58ur3lqBLmX1OQmjxh1QosOqoHE2zvRMKw3x37DMB1E3i13Ir1S+FaAqWad08ehYuO78qNQmgPuTxmrrd0WEMoPe/4AJjVVakPKUzdGJRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wMUq6nNiYr8qJZC55k4as+MofMJlT9oXDJrMUOfIgrI=;
 b=swSaJHmXyu5TZ6EesdsJLuvW+RqxN0hRUj8WHDp+9B7vkrGStnmi2JpSZGLtfuZd1t7wRyx6Cdxmqz8qLOIrTFtJ2Fu7kKhcjEiZGFVANjJhDe2xZL99i89eACO9zsW7lH1H4kWDf3q0GKzVerBZGpv/yio75orPAXhDvpMMME+81H86uMzqZjNc4Fz/an0/OXdKZaueI64JXDT0+N4FRV1uiKEqmS7cTWu4tcmSq4X8HiCPgYC8660W/OTAxxlC0ei/40HXZpVWAAs0aOmCgUN/Va126t4k3MgpClFhfG/hYd8/ri8fFNUexf0SaUfTW95DzwJ10RIabKfXl+Ojeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wMUq6nNiYr8qJZC55k4as+MofMJlT9oXDJrMUOfIgrI=;
 b=ozMnloB+5L0RdsXlSf5kZIDDjKqSNLvGxUVFCMjgOZjjFIYfHeBX2VMDu+5IezDzMU3dUwE+7f9aAEOAvLwXiNel+HJFs7GqBUACzuI7Bk4pjyYvAolJLEQXmwJ+DunLAzbdBklE0mkjAmgprIzzjROSa8lsJul3fpr0C2an2iA=
Received: from CH2PR04CA0010.namprd04.prod.outlook.com (2603:10b6:610:52::20)
 by BL1PPFF8FE8C4FF.namprd19.prod.outlook.com (2603:10b6:20f:fc04::ee1) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Thu, 10 Jul
 2025 10:05:41 +0000
Received: from CH1PEPF0000AD83.namprd04.prod.outlook.com
 (2603:10b6:610:52:cafe::8c) by CH2PR04CA0010.outlook.office365.com
 (2603:10b6:610:52::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.22 via Frontend Transport; Thu,
 10 Jul 2025 10:05:41 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH1PEPF0000AD83.mail.protection.outlook.com (10.167.244.85) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.22
 via Frontend Transport; Thu, 10 Jul 2025 10:05:41 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 44D61406545;
	Thu, 10 Jul 2025 10:05:40 +0000 (UTC)
Received: from [198.90.208.24] (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 2BEAE820249;
	Thu, 10 Jul 2025 10:05:40 +0000 (UTC)
Message-ID: <1f2d7ab5-fe24-4830-b58c-f543565a6047@opensource.cirrus.com>
Date: Thu, 10 Jul 2025 11:05:39 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/27] ALSA: hda: Move codec drivers into sound/hda/codecs
 directory
To: Takashi Iwai <tiwai@suse.de>, linux-sound@vger.kernel.org
Cc: Kailang <kailang@realtek.com>,
        Kai Vehmanen
 <kai.vehmanen@linux.intel.com>,
        Cezary Rojewski <cezary.rojewski@intel.com>,
        =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>,
        patches@opensource.cirrus.com, Baojun Xu <baojun.xu@ti.com>,
        bo liu <bo.liu@senarytech.com>
References: <20250709160434.1859-1-tiwai@suse.de>
 <20250709160434.1859-7-tiwai@suse.de>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20250709160434.1859-7-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD83:EE_|BL1PPFF8FE8C4FF:EE_
X-MS-Office365-Filtering-Correlation-Id: effd1d09-25c1-4046-d6f6-08ddbf9953e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U1FNTzNFWG54NS9qdjNKUzhFUU1oekgxSXZFR0VXR2dDelhVVGJReEI5dTFZ?=
 =?utf-8?B?TXJZVjVEazdlVCswemxveE92WjVqdDVrVnBIUEdOU2lwdXYyNGJSakIzMnRk?=
 =?utf-8?B?V0tsOXYxSmxKQllBanA1RVMyRlBGcEZLTjkyc1ZzWlFqZmNuWkFJL256LzU4?=
 =?utf-8?B?SVltUjc3c1RSYW5iVjlMVnVFWWQ3WUx1bWhmMno2L05mWGdqTWMvRkc3Wngw?=
 =?utf-8?B?TUhLWnRzY0lEODZQWG56bW9MaXY3QWJhL0dmaDQ1Q0dWVUhVREdyeGFwaUhD?=
 =?utf-8?B?QTJ3RHhzeW5KQXhMWEYvOTI5cG8xN1BBZ2lnY2VZUWg0UENZZHVEaXZrbW9n?=
 =?utf-8?B?Rk9qM3piajhNOFVIZkxpclpGWFFVQkl1bjFYMmZWa2FkcVlTOGFGNmVQcEt5?=
 =?utf-8?B?NmNaaGM3SnJpOVRTeS9mUFlwT2ZKcEtJa1Z3dkpkaVU3d0ZsY29QUGJKTlNn?=
 =?utf-8?B?M25EMHl3VitWZHpVNVhoSldLT0RpNlVsSUVBKzMyc0ErdUlBRVZkNG5Nbk1W?=
 =?utf-8?B?TXFSbEYwaERiMVh3cWsrK2hzeUp0c0NHU0xPaEdZem1JWDljRzZ3MUd4cG5K?=
 =?utf-8?B?UnNzY1hJMjFER1dQSy9aUnVqR1VaODBkcE1XVzVCSmtRaXcwaXd0UU0ydXgz?=
 =?utf-8?B?Q1pjUjF6MktHOWZ4QzMrdFF0Ly96Wk9QQzJkdTJ3eG9xTDQ5KzhaTVlyM2Jr?=
 =?utf-8?B?QnJVVjVCWi9Oc0ZoQnFianMwN3lSY1ViL3djcDQ5a2tGNGNrN25hazVmNm9q?=
 =?utf-8?B?ZW5laE1DTC95cS81UEUwbC9JUzJvU2pRb1ErUTN0TWJ1VXVsWmtFcU5Ld3I1?=
 =?utf-8?B?anB4a0ZhUk9ZVHF1SmYvK3BDTGFkR3NxSmxhaUlxRGU0VzM0aC92aDJwWkpR?=
 =?utf-8?B?bEdrMFNpQVdFMW56SVFFRXplUFJHZ0dVRVQ5azVoVFpsV3Y3eHJVQ01vQXRK?=
 =?utf-8?B?QkJIdnFvQlZERGZJTURSbXFSeWJhVCs5NlZweFJYL0xDQ3Jpc3FVQ3VRWlZq?=
 =?utf-8?B?Y1RURVhPaEcvN3FKWlYyQXFXSzk0dkdLSjB1M3lXT1crSTYrN0xWS29GU3ZH?=
 =?utf-8?B?YWdvSWcrYXV5MUJENWZ0bWtuL1dOdExSN1FpZG8vT3paMmtkV05SK0pGdFFo?=
 =?utf-8?B?MzB6bkdlRnNVc2tBTGt5U2ZNNDlFelp0R3FHdDgzT1IrTi9BQjd6Z2dSM2Ex?=
 =?utf-8?B?WHptOFExSUpqck5sNGpkdytjSXJGR2RmR3RHOGdDWUJBTTMxeWhJNnVINC9I?=
 =?utf-8?B?Y1htYityQVFpeHhvbVo3OXhtUHQ2Q0xqTFNZeHE1WG1iVXZoZzdEOHFzZTlB?=
 =?utf-8?B?RzFRdVQwdW5UL0lsSGdud1R0YklhUTBVMzRHM2hiUTNoWWNkclUySzlOUDhZ?=
 =?utf-8?B?eVduSlAvNXplb2tSc29XY1lDaXBaSHR5aWZLQXFMOHVhS1pVNmdVNitoNDlP?=
 =?utf-8?B?QnJheDZrVHRZdlRPem1UZUM5cktQYTFEcWxCK2k3Z3hDaWZRU0lHakVFY1Vk?=
 =?utf-8?B?R0tuSGlCNGVva3ZGbzhDeWZWZnRnS2dIMXBCSFArUStWWEd1dFU3SWw4cm11?=
 =?utf-8?B?a0hFeTdVWmlSc1FHL0dwNEhMY0FwSGczQVFMNFRRL2syU2VPWFNGUTR2WHF6?=
 =?utf-8?B?YXNJdDQvaTlObCtjWnM5YkQ0dG1jayt3TzRzUjRRKzdjV0NicXo0MTkrVTd0?=
 =?utf-8?B?b1N3WXg0VDA0MElxYjBodlNTSGQyd1hIVlJ3QUFCVks3TDNaaklya0pIQ1RE?=
 =?utf-8?B?YWxMbW5oQ2JVei9OUDM2Qzd3anlPZUcydWZ6dFJqM0I2WndnK3JFUWtCc1N2?=
 =?utf-8?B?NTl2OFo1bEI4dFpIdm9zeEovSWNlbTZRQ05VSTUwVlBFeXZzRFRHUE1ENFhu?=
 =?utf-8?B?ZDlKTWMrUS9PVUNqdkZwWHdGN3h1YzBwNmVGTXBwb2lZQThzTTJ4elBaS093?=
 =?utf-8?B?RlJFaXgwOVZib1BKRzFERzJtQ2ljbFV1TisrQkN1dFpaZFlmWEVQTlJlY3Qy?=
 =?utf-8?B?MTJ5TzFuTkNSb3YzU0c4TjdCYUJ4WWNRV0FpQ1lteHZaellMcERWVlFQWkZv?=
 =?utf-8?Q?Vd73yD?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 10:05:41.2239
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: effd1d09-25c1-4046-d6f6-08ddbf9953e0
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD83.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PPFF8FE8C4FF
X-Authority-Analysis: v=2.4 cv=Zb8dNtVA c=1 sm=1 tr=0 ts=686f9079 cx=c_pps a=EAC/UdV2w3Vk3F7KeXBmxQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8 a=384q3Bda33hVut-HsgsA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEwMDA4NiBTYWx0ZWRfXyW1AgTPi+zCE LQsUKSA+NBco1YtMhKcoUQZWr8Q2uREMFCdqr315AuWFntCXvSohh45wkbo6008NxOIRY7PULjP 0nF0VXkupFZf5UkrOjoWSXTH/HRnNyQQBzwxXBPNyUeyZbg6T4Gl5hOpPSvCXF9ImKrarYAzMr6
 4oXCRZApo+rf3vMBbFH7Qytpgc3Z7G63dZpzr0zjLq2eT3m1IfEL+sjsYfWTxqcm+/hk/nmtieF +iebixJ1ZxGOQSeT6a0UEY5zI6Q6+6iEswf9EWTadQ0wnc8G9MZo61Vm++0mUvoz+pYQW0J/Ug0 u+poeylmSU9n1k0j3Pju9nROBzxAk8hkm4y2NNBXjjQ7uQdtHTZAeCyhzY28Q2dcN9QzYK7WvbL
 E+qIssqnVfIm9cikhFl33geUXCFjgbVkHW/VFxf4xmf3gwfyQGvyDTXOV/PyHIx9TQLvq2zW
X-Proofpoint-ORIG-GUID: N_nPxDI9CQj3OcIdVNsZbyClkK_5bowY
X-Proofpoint-GUID: N_nPxDI9CQj3OcIdVNsZbyClkK_5bowY
X-Proofpoint-Spam-Reason: safe

On 09/07/2025 5:04 pm, Takashi Iwai wrote:
> Now move the all remaining codec drivers from sound/pci/hda to
> sound/hda/codecs subdirectory.  Some drivers are put under the further
> vendor subdirectory, and the vendor helper code (*_helper.c) are put
> under helpers subdirectory.  Also the sub-codec drivers are moved under
> a different subdirectory, sound/hda/codecs/sub-codecs, for
> distinguishing from the main HD-audio codec drivers.
> 
> The prefix patch_ and hda_ as well as the suffix _helper are dropped
> from file names as they are mostly superfluous.
> 
> No functional changes but just file path shuffling.
> 
> Signed-off-by: Takashi Iwai <tiwai@suse.de>

For the Cirrus files:
Reviewed-by: Richard Fitzgerald <rf@opensource.cirrus.com>
