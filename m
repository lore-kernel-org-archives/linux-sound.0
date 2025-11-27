Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 916B02D59FA
	for <linux-sound@vger.kernel.org>; Thu, 27 Nov 2025 16:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764261350; cv=fail; b=cZ+AuoJiizutLxv0xsMK/nUAQnD30+AnUwLOvs++dEcA3+X5WHSpriUsKt9I1GntCJpl94vr6gfv7meGpRvbCGLGn9x1jShu7Gh3a2b0znmOIeaioEGW9mQS9K8fceu+aStqgAVMSRJi+pv2m8LXJ2Odu1F49CfWeAt/GtWTh4c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764261350; c=relaxed/simple;
	bh=mMDmnOjWCeu5++uc/GIfJhfMP7OE1tdQJ+t31YBTKEc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=tyguE6zybuODjAx4ONfNbtu+uZzCn5+d5UbMRgGkb3fQeNfXR5FXB42fHPgMVQsjs1q0lnrfzQxkmU7DfwwI30EEiuX6O1CVMadyTyS+0RpVPJfitn9sq29RyBQQd5sisBJ7yjAjARAE4AQJLVOvofeh560dCkRRiJf3AgG5xv8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=LH4Zutso; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=bE/r6vwW; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="LH4Zutso";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="bE/r6vwW"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AR5Kub1620267;
	Thu, 27 Nov 2025 10:34:35 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=d8utA1CyTwk3CQZe
	8TcgHkRx+HJiTLj+KNGQWyZNm/U=; b=LH4Zutsop4h5Mwu9xZq1AV75qDzsw0yv
	tExWaO81LdUe4wHZZvNevPqFAB7ye4VZhBnx+zV9DZOJU7A/wew9IZCiMTvIp2sF
	YeguhcrEYxXUH9ft8Nutd6Z8pTGeHEQLAwFCloudsrg9ZlxEYXrrNeLlFZL4cQY+
	GGdZ8baUZu0SSvAlRBsGZg5Hc2cpeCIj6jBgr0cpL7Rn2jkn0TUNHa9r6dsMe+UU
	mK1SbCAHRlO/o/2UkYELjk3nekdLcs1EtZuWJ76P9DkizS7/ncmAUSO7BAcA7apf
	1lLp17nAhMm5P124v3wYAdcWQ/GM60+gQXc2fAozEb0iL3i0i+jaEg==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11020100.outbound.protection.outlook.com [52.101.193.100])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4anjvwtem0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 27 Nov 2025 10:34:35 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=opY6KHigtWNL1hABOskpXcT/+vQkdMN6pIj/HnbW11B9CEzi360aH6Wr/Pt/t6hXNf5/JOULU7+b3JEPQIwhL2isLxdZNIdfD0eFAzRKZTDULcq1HQ5624dIX7TwGN7xpH5qGeLYBkvB9Pj9Wgpt+ogpQbng5HoEIMJOHm+6YjaXIdArrBaajC4gvRdNcORkN9YiCW6W7unasq/ffwMCMGbp7Rda67rLNc0FqcctQZH/PeNw+DxpDwAZ/PKXsAeSGRaBDnyCBLBCd7slMCjo3y8oG0OOT3GKSdmryTe3Zo6qss7GQCaiC1/fpRJeq8/cKzbkVBOxm7B/E/EWoxedTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d8utA1CyTwk3CQZe8TcgHkRx+HJiTLj+KNGQWyZNm/U=;
 b=Yt4oURt6zyFztxtQRF/nDoWdjrI1okzkypEu/kptDIACojyAOXtf0xS1BdirIe/bg0ezq56OWK+cpFrGYGHtnP/Z9Bofb7KhHGphw1WnEDcKnl64lTyONZPh1ptsvTiG5l0BAsfOG55F5ZH+69iA3SEpWDWbVc5BdrXbNHSK5MTYStOJihWJwgaxm692dsxjs62q7UwiEhxGGoQ0ljkYxFRvEaz9XBGsb50uNW5oQvP6DnUNyrb0OgA7+LZfufalFOV2iOWxFi6mX3DLf6OPjImBkn0BeCTCcZtZzTKEOcYoS/ACZW4os/NrM9l5F7AN2v9K83T1ddrpfb4O2N+nkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d8utA1CyTwk3CQZe8TcgHkRx+HJiTLj+KNGQWyZNm/U=;
 b=bE/r6vwWowOPytTUUYGkElqVmP2L0KcUsFyE/cp1NpsRtW60PRfe4VG4DHqDvEm9q9rzDOKBc92vBeI5Lj1NQlb8vAJ9nF00qsHkNo0xIHHXwIwtzNNEjUfaVn40t4pAHPyagddHJEuJGwPV+CuRVciTJUEoq3hlIda0nN92ly0=
Received: from CH0PR03CA0395.namprd03.prod.outlook.com (2603:10b6:610:11b::12)
 by BY3PR19MB4835.namprd19.prod.outlook.com (2603:10b6:a03:368::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.14; Thu, 27 Nov
 2025 16:34:32 +0000
Received: from CH2PEPF00000140.namprd02.prod.outlook.com
 (2603:10b6:610:11b:cafe::ac) by CH0PR03CA0395.outlook.office365.com
 (2603:10b6:610:11b::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.15 via Frontend Transport; Thu,
 27 Nov 2025 16:34:22 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH2PEPF00000140.mail.protection.outlook.com (10.167.244.72) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.7
 via Frontend Transport; Thu, 27 Nov 2025 16:34:31 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 0BD0C406541;
	Thu, 27 Nov 2025 16:34:30 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id F267082024D;
	Thu, 27 Nov 2025 16:34:29 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        lgirdwood@gmail.com, peter.ujfalusi@linux.intel.com,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH 0/7] Add support for cs42l45 into the Intel machine driver
Date: Thu, 27 Nov 2025 16:34:19 +0000
Message-ID: <20251127163426.2500633-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000140:EE_|BY3PR19MB4835:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 9471f801-aa00-49dc-8253-08de2dd2d767
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|61400799027|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?g7ndPHVzanNOSzWdJVBsr5KxzEaOyJR0mWVLy090Y1ye5G0KBahKUS4zwgyv?=
 =?us-ascii?Q?OjlhI/tW7sWE1TKokWZxxCXDbKW7MFa/anFFa2a9dUzQMHPYYnpMvn3TmDbG?=
 =?us-ascii?Q?ovu8TmQKMPjmN58TYUihFrKoGHRK8d6/HD7yPcmBRkDkOH8pahy64Lxlu64j?=
 =?us-ascii?Q?X5L9ZlMEGnbxn43JZ42oTKfQRadcoNyNH4gIWL9siPH7mjqNAE2zRfoQGkUo?=
 =?us-ascii?Q?KvfdBE9vVeeOneSB+rq3LdrU0KFRyj5U1l/2012C7SWPMp2AKGo17jQHM8rT?=
 =?us-ascii?Q?AnfUCy3b98nqpLNJiEX1aonhtue9UvSPMyMUE0fCjg+ZlPkMSFXSSAAip54B?=
 =?us-ascii?Q?eVl0kcXxfgTDwJL0++OqDprQlv5OquEPS+kq+LXmSsHPvDBiwWiv5pEzbEX3?=
 =?us-ascii?Q?Sgi2DL87uX+gpIJ5gsd5/57OC0BlITgz3AIHYLIb5R6egODxtUYfjja+Z8vJ?=
 =?us-ascii?Q?krCmelhS9ZJ1dR8CUt20bVdcOFx/sWRs5hjZpdQlsrTsOMrm0+aIU58Hg56v?=
 =?us-ascii?Q?EkfNyeNqigz9h5EXQaEhVGyFMxBPlpAiO6PQBoJLcOl+z0zH9+jNVkiLz7Yl?=
 =?us-ascii?Q?9SknxkQ20SJlc6OP79d43xjDDolnSB/YD/qoI1lbJNCarTBLB4+yPTx+rrXc?=
 =?us-ascii?Q?RfGdBHNEOtbcCikpjCsLe5ayWmHnOJJPeLLM+n+tZQ6D/LHCbOUYXcnsawMp?=
 =?us-ascii?Q?EJACELLIMNpsIPzF+bICBqa2p93jeNmsVwXjB2gehyGvpTbOPqO0NYE/cgXQ?=
 =?us-ascii?Q?e4oDDsIHfwJnj358lS+gnCUZAGrzfUdnmpYkI8LwMLHtnVUjKMQU+r/eMzBv?=
 =?us-ascii?Q?wCvt/R5NMXA3aPGbESBPT8PvNP+XWA1+f4hiK/HjXXjJho3k/5Ykkcl5TD+e?=
 =?us-ascii?Q?EmDiyYQ8jby8pDVkBUcX17PwIGraMm9jsGvuCEHEXx4MlVtXOc+nAm2PMtw4?=
 =?us-ascii?Q?pJIvXL4VoLPjnmmJnq46wqTtRGpDGoSgPOlXMQyrfdtDmPe1QSzqT2oOEMpj?=
 =?us-ascii?Q?34eLxxEPbN7ZyNt3Nib8QXwhx/guDFtSTc3sRc8buTat/BIE1uMErtGL2Fdn?=
 =?us-ascii?Q?L76UtQRIZMgmg1lLc+tbrLXgcuVVxYlQRkQidNBVU+H2gB091e7Jh5p19jAx?=
 =?us-ascii?Q?K3UKhzqc3Djc0Dg607MnV+IfEPXDw5qimXzLXiJ49KkwsDkoLh28RNeQhkLm?=
 =?us-ascii?Q?e5TtJOVAFSMM6GtP/pIhJg/FObZlUUj4sxWm/CG6B0b0/NyZf37O/Sbky+4a?=
 =?us-ascii?Q?yDGPXqJHNpOYmZcfjw9UJmMkmORl6CB89CKwC9RoWXFFnwneN6Uupx+gxzkl?=
 =?us-ascii?Q?7+OzI58a/yhXTPfmm8Tl+xci4Pf0gcFQaXIloaHxUS7CS0SQe4ggXSUwbR9G?=
 =?us-ascii?Q?EO4hTe3acm76GWKEQPJ4dAjglp4b32xrQZFY0vmWRuJ9W6/foIG7esjEMC2K?=
 =?us-ascii?Q?7G3KtkcNl1+m+mUpNH8ioS887PF+r1ipuHk0t2mE8Yf2EzAc/GG6SyLsjoW7?=
 =?us-ascii?Q?BpOgElTr0QxzMhDCxQGdDGaY7AJ4AEi8L+nzXvQsccnNR2IIs452MCGmocyj?=
 =?us-ascii?Q?n5uvXHuFKJ9NL1OXqv4=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(61400799027)(82310400026)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 16:34:31.0803
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9471f801-aa00-49dc-8253-08de2dd2d767
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH2PEPF00000140.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY3PR19MB4835
X-Proofpoint-ORIG-GUID: TZw1UQUoZ9KLC6muko-Hmm53BU1fEIj1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI3MDEyNCBTYWx0ZWRfX2Q/XeW1klXr4
 xVAjLOkISCpAJXuPs6JYc4mKeRC2QcpoxV4+yS0VGJEYRQuGfdXcTbt4QouO+kaEHcp3jvsNE/V
 OOAkVxpnZR7GBUl5sQSn0D90Aa4RUQnb5q61+grfAoV7Nv0XLLaxehQwOmQXulz5hOR9fKYSzA1
 VP9l5AS3bqBkkICCaIO4kwXIEpwSBh9lleYysGcXg7WcbB5veBHd68CHaKYeS1hvr9Vfl8ZyItf
 MGWEwy5Q/8T5SO1PhvCbY5fuIwAga0pMeqtVL6K0BkiFi1XPWD0v0+GvVnR5QqkiMBtufI184wD
 lSqupNoCtAPI5q4aqkpYRgfpHR4IMaU2+pFL9I8YlhrjrrDFqlGHqxDcXE/4KKd1B9oQEXFkC8p
 fkKf2qwQLCkj+F7jQardarirlIaWqg==
X-Authority-Analysis: v=2.4 cv=Vvouwu2n c=1 sm=1 tr=0 ts=69287d9b cx=c_pps
 a=bmymNe+n8fG9O7CF6YQ1pg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EzF5j4uWC4oZY3lGkncA:9
X-Proofpoint-GUID: TZw1UQUoZ9KLC6muko-Hmm53BU1fEIj1
X-Proofpoint-Spam-Reason: safe

Now that the full class driver is in place we can add support to the
Intel machine driver for Cirrus's new SDCA audio CODEC the cs42l45. This
makes some minor tweaks to the machine driver itself to support SDCA
devices, and then adds the necessary tables etc. to define the device.

Note, this series shouldn't have any dependencies on the other series of
improvements to the class driver that is already on the list. So either
can be merged first.

Thanks,
Charles

Charles Keepax (7):
  ASoC: SDCA: Align mute controls to ALSA expectations
  ASoC: SDCA: Add terminal type into input/output widget name
  ASoC: sdw_utils: Add codec_conf for every DAI
  ASoC: sdw_utils: Move codec_name to dai info
  ASoC: intel: sof_sdw: Add ability to have auxiliary devices
  ASoC: sdw_utils: Add cs42l45 support functions
  ASoC: intel: sof_sdw: Add codec_info for cs42l45

 include/sound/sdca_function.h           |  4 +-
 include/sound/soc_sdw_utils.h           | 17 ++++-
 sound/soc/amd/acp/acp-sdw-legacy-mach.c | 19 +++--
 sound/soc/amd/acp/acp-sdw-sof-mach.c    | 12 +++-
 sound/soc/intel/boards/sof_sdw.c        | 21 ++++--
 sound/soc/sdca/sdca_asoc.c              | 51 ++-----------
 sound/soc/sdca/sdca_functions.c         | 56 ++++++++++++++-
 sound/soc/sdw_utils/Makefile            |  1 +
 sound/soc/sdw_utils/soc_sdw_cs42l45.c   | 80 +++++++++++++++++++++
 sound/soc/sdw_utils/soc_sdw_utils.c     | 95 +++++++++++++++++++------
 10 files changed, 275 insertions(+), 81 deletions(-)
 create mode 100644 sound/soc/sdw_utils/soc_sdw_cs42l45.c

-- 
2.47.3

