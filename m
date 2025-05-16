Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DFDF242D6C
	for <linux-sound@vger.kernel.org>; Fri, 16 May 2025 13:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747401043; cv=fail; b=Jq34HAqkYiYfKMcQ3DFGjD9wVxk7PJLBcmvpCfXogl8H2CKG4i8YYuK0P/V72Zq8p+0ODc7tXfelEMDRWSX6kwq0X8m516uT3h8xc1OBREpR2MPZvWkTM227uCtWTx5jc7lsQNxlFyOXx5cLN7d12ZMu2U+psuAs5Jsf7wCM0vo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747401043; c=relaxed/simple;
	bh=Ez7sykOk5hlDhuenvRuXYI29EXl+mluofIoeY8BEUX4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=caG6n2bENiT21u8Pk+BcwDG/RGi9ev8NQO4D0xadYibb/nYTMU/cuZl6Vo1haukq6foIMz2akd3Zc8obCe8FlVOANOC8icopUIXza3xY0w/YZY20LB5M3k/AtdoHgfxG7NCXerBIaTOS/1n8Kxi/VukUtXU/bp1o8istXYq3zkU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=f3F5Jghc; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=Ptti2+5M; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="f3F5Jghc";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="Ptti2+5M"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54G4TKtH003653;
	Fri, 16 May 2025 08:10:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=UtuSuwvBBTCih0SJ
	bmxfkWDbbf3gpD7+HQGG+lAJtzg=; b=f3F5JghcG2j9UaS1DbFOf82H55ughCda
	Ui3RcAz2J4/Ii7Hp5Eptkb3NtBm9dzE5APb1ApUjY2EfBGckYcywF5lyPAzYmomy
	VXdVQRSk00yKHpblAjsRIjLOUhYqUCx2LY+skvmGz3U8zBL55NNkRoQ4ljhR/NCN
	gnytITpJ/gH9XIUk4O+OUqK+HxFcPBq7vsSs3LESk7hB9yJ/q1EfBawjlkER04OC
	JlmkOwCiZY6KPzJD6g1c12JjfEmXsYZXHRTClXJCcBR9UgWVqL+t6nyKVcdm3I0z
	XWV2p60lg2qEPHBNgheHHH34SgQ4hsip9YxKwRhyyaHGKXn0ef8z/w==
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2041.outbound.protection.outlook.com [104.47.70.41])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 46mbe5cttx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 May 2025 08:10:28 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BuI93ykXAh+ticRUl535GCyjvLexyTl7oiMh6PBR+wlbsJvlt1J/HaiYa++RB7kDcCfbB8B0SVucp/Ow+22ny8ZweFIbxA+0z7FPJQLjMgS6l61L5FO5QzTArIioq7dylfoW8qaJ9u/AzR/rlHQslXDSbACtBWNaLa9jkBGb940zfO+1+quol3xu5NTw1BYHW8Lke/DjL242dgDp0xcUZ67wnC7NBAEchIUYzmJroCGn640YJFgylFJhfMUaIgHw5wWaxLBxvACOYkp+bDMxSqL0rcMd5wU8DwjUYB1XwpEDg3nAFmRnwFfSvCyBqEd1umobgBqnbM5HptIc+EDnFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UtuSuwvBBTCih0SJbmxfkWDbbf3gpD7+HQGG+lAJtzg=;
 b=vDQDQK/gcQB6qPSu1PqSM8vttE7EE+nZJIUp5muaG71j+oQg2s6xKdtyDyQPvHG8Zg/z78zqLMNqusGcjXB4M5ACkYrwp8rvc0s7hhNLrPdb644BBf8J12PM4Zq6tIt+2UThRV5kow8X8qfxAkyjp0ChyqIH07PaC3Z0/ONkKbSM9kVyXnQkFbdH+BJvU9OkNnoSF1A+KSUobDi1g1/lqnd4jyNzm3BrgAH6NycLhwikdHgCWDR9muR40y8IFMVb5r47VULdmu3S+jS3v5nrN7iuI0HDHAdVXY/Xmvku8WSu8Y2swG7oZHuAyQW92TBfIXQVXyuw1zj5tMnl2RRFPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UtuSuwvBBTCih0SJbmxfkWDbbf3gpD7+HQGG+lAJtzg=;
 b=Ptti2+5Myx5FyaIwFidHHXu82xbJLkZYFfdWtx8hh3Tf1BJVRmi3OVjl0F/HxKW9BZYoJsUEkGKibzNf697ZY8VRyEwtLBodNQ8zRiT5LsL1jo0j1Zj2Is3miC5ie3jueQMfBuZjACLvqc6GV1ABjEuw/lRff/FExasHQGO0KGY=
Received: from BL1PR13CA0290.namprd13.prod.outlook.com (2603:10b6:208:2bc::25)
 by SJ0PR19MB6776.namprd19.prod.outlook.com (2603:10b6:a03:485::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Fri, 16 May
 2025 13:10:14 +0000
Received: from BL02EPF0001A107.namprd05.prod.outlook.com
 (2603:10b6:208:2bc:cafe::db) by BL1PR13CA0290.outlook.office365.com
 (2603:10b6:208:2bc::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.16 via Frontend Transport; Fri,
 16 May 2025 13:10:13 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL02EPF0001A107.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.18
 via Frontend Transport; Fri, 16 May 2025 13:10:12 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id EEA9F406545;
	Fri, 16 May 2025 13:10:11 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id DCC37822563;
	Fri, 16 May 2025 13:10:11 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v6 0/7] Add DAPM/ASoC helpers to create SDCA drivers
Date: Fri, 16 May 2025 14:10:04 +0100
Message-Id: <20250516131011.221310-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A107:EE_|SJ0PR19MB6776:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: e65b1df0-e2be-4878-45bb-08dd947afe56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|61400799027|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dUK+dG5ZsCkByPaMn+kLPkO4d3smVhtiLKVeXwlnd/1Lne9W/SIN4gRX9/iM?=
 =?us-ascii?Q?kjdVNrFqudDxhnzhECQIsopMMlw314tUZ20pytmg0YByYZyTtE7Z7lgSXls3?=
 =?us-ascii?Q?KB/8yn0j2Wd5GMxcrvLUuJRmxwBQMKYjyED8dqG/20feRVPcKQthOsO9SKeW?=
 =?us-ascii?Q?gb40s8oDRzM36NvjZ/N0wYadBPi8bvG5VOz9UutW7Uz7v7z+xvt9R+8RZmlt?=
 =?us-ascii?Q?3Wn589lfrVBo2MX0kmtNh90oBIn3H0oDk2hoM8DuoDqovAeOkNvChjnGF2Ge?=
 =?us-ascii?Q?TnNbh+KtriEgXj5I4vJh7fNOCK7KME2qGLaon1Cti01OSabouiMlgCqzSQG3?=
 =?us-ascii?Q?wD1EAfYlmK094ngs0V4I9uWTRjcIidCsD4tdvZNjcDjhMfYRLTJKS6vh/khf?=
 =?us-ascii?Q?w18z/6tA3Yn5pg890cgUXrHctXmYPS7IVHJtSmrnDGl0otjwCMijUYu4HNQt?=
 =?us-ascii?Q?BkClaNC6oLx90oZAkdKy2mcMGQrwwCa4q4rimv9yH9Qw3iy246p+N0ped6K+?=
 =?us-ascii?Q?Jn1YQfUCB0I1Zrm6Xi4vsamSrlrhaH813NQ2lKx+rdbpfvLv6rAj7vjJxecj?=
 =?us-ascii?Q?BJIgA1bClxa+A7KVvQSa+EPBHfMvOJg7u6kUKqfGKSr3eV7DmcnUn1fA3NEG?=
 =?us-ascii?Q?FnlEvT+wNB2Qq0IFeFdcYbTKaNWJH2gZCDKGyimcg0goX1aP1AlEKPQT1OzI?=
 =?us-ascii?Q?/ehsh0XkKqqd/i6idDV9DbrC14zWLvk3pbqyzngks1S4AyQ8Cg2Yhmb6cx02?=
 =?us-ascii?Q?1J/Ehb1RRxJ24dmitVk5nOM7HJwUnPzUny7P7j+Wapq9gBnRGE3xcEYf2cxL?=
 =?us-ascii?Q?G4V16dypAlB44vbXEDjsQ0HWIvGk9P0wWnjp7vpitKzSLuKof9kzWHhvnnvt?=
 =?us-ascii?Q?gKnPaQw6NGW1c8reOrHkTSSEXeQsv1Ntl6KBb2++pZmDB+ApHGxwYYY03Fbw?=
 =?us-ascii?Q?TnqWwHeXEE1BY4OZWC78vdVohcHDrxtS89aF5WJzDBJQr3WTPuO50+KiqNm9?=
 =?us-ascii?Q?v3yOZEXIXizi6MB/S7Uisqj5XmlLv3NMRyE0rE+umKCUbLIsvTmrCdgs602I?=
 =?us-ascii?Q?dOtCF73DCp9O3fcxytybBt90Pv/vVt7o7c4YYsnDL09dZd7Obm4sPUqP03xs?=
 =?us-ascii?Q?DHBZUtKu2ky/YTayWxWqW/qdkE93DNbzUlpz3K8W40OEfovGo6sKvbxuJIhz?=
 =?us-ascii?Q?7ISKY1o42/dUYnv0UZnH9ixnqtmM1VByMTNWrxoviOp7PGXex89s2n7TcLxc?=
 =?us-ascii?Q?jwWxTBctzMjMV5s6dwHW4kAp7aQsSMOnNIObjXjmpguYWJieB+mxZaxLgesP?=
 =?us-ascii?Q?xstcxnuBQgUFOYW1llV94nVIypebJcOaudanBuebmDJi9Sr8vGP5VFYMi3yF?=
 =?us-ascii?Q?SpUQY7pPPYYsTYLLTetmLgZuBPxvEA2JuBoxYW4/fHsto2/BpUG7IQY/DnHP?=
 =?us-ascii?Q?PWZVJXb0LfaJbXTkVecOfahDULK7LJDOjG1TXQzSi4Wg6tiqSDBDbgjYVG+r?=
 =?us-ascii?Q?Yev03vbS883ARwqaxrz9p6zObojPwcDbUFTg?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(61400799027)(82310400026)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 13:10:12.8398
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e65b1df0-e2be-4878-45bb-08dd947afe56
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A107.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR19MB6776
X-Proofpoint-ORIG-GUID: HpOSyS_9lvVjsUwFrLOQWs1QZZmJp3ka
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDEyNyBTYWx0ZWRfX/TlmWwNBNZOH +L+qUbx8aiUpXb0cSU9dkOdGolQJdMfxyY766m3QWa41uxgKMzg76zL6f1zj4ia07ZHp9w54sm1 EHGXfGydBrqInyniKtHO+DoQSTnBb3BdrwRI3r2BFouYn/ZbOfvZgdqnNon8aNLh7DQGjZrp9KX
 OrUARPpnglslluKFpNZkIiCT2nx9W0rIrZIvgYAYS3l1v2XmlmCB7YHJKvaUEGxOEUwiwrPGOkX Fhk6uFqx8jxCMCQ/vytGUloAMGx0OU1AWOL66aWF9FFb1jbzT1kBACJcwHGLlRAN79/9uOfgyEX rcux74xS/0RI2LBjwNLSVefdb4M7a6/+WEoz7RKtZsCqdtCEGf0BPqmzfZZaycngQ7c58blins5
 c6EOrnLVJXJcVK/tLmMWMspu/Pat/dCFHd/owabFlaRm2sJjohemCQQ3/JnPVGpNxtB6h096
X-Authority-Analysis: v=2.4 cv=eqLfzppX c=1 sm=1 tr=0 ts=68273944 cx=c_pps a=ybfeQeV9t1qutTZukg5VSg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=dt9VzEwgFbYA:10 a=s63m1ICgrNkA:10
 a=RWc_ulEos4gA:10 a=NjlyEuKDYdZaDzFsdewA:9
X-Proofpoint-GUID: HpOSyS_9lvVjsUwFrLOQWs1QZZmJp3ka
X-Proofpoint-Spam-Reason: safe

Add helper functions to add DAPM widgets, routes, ALSA controls,
and DAI drivers, these will be used to create SDCA function device
drivers.

This series should provide most of the core functionality needed to
get a device registered and have a working DAPM graph within the
device. There are some features that still need additional work, these
are marked with FIXMEs in the code. The two main things are SDCA
Clock Muxes (not used in our devices and needs some ASoC core work),
and better support for more complex SDCA volume control definitions
(our parts have fairly simple volumes, and SDCA has a large amount of
flexibility in how the volume control is specified).

The next steps in the process are to add helpers for the DAI ops
themselves, some IRQ handling, and firmware download. And finally we
should be able to actually add the SDCA class driver itself.

Thanks,
Charles

Changes since v5:
 - Add small typo fixup patch.
 - Move and add some comments.
 - Switch from fixed poll time to fixed number of polls waiting for PDEs.
 - Generate read only ALSA controls where appropriate.
 - Export ALSA controls for SDCA controls with fixed values.
 - Clamp control values to range supported by ALSA.
 - Force export of a control for DETECTED_MODE.

Charles Keepax (7):
  ASoC: SDCA: Fix minor typo
  ASoC: SDCA: Remove regmap module macros
  ASoC: SDCA: Move allocation of PDE delays array
  ASoC: dapm: Add component level pin switches
  ASoC: SDCA: Create DAPM widgets and routes from DisCo
  ASoC: SDCA: Create ALSA controls from DisCo
  ASoC: SDCA: Create DAI drivers from DisCo

 include/sound/sdca_asoc.h       |   42 +
 include/sound/sdca_function.h   |   71 +-
 include/sound/soc-dapm.h        |    4 +
 sound/soc/sdca/Makefile         |    2 +-
 sound/soc/sdca/sdca_asoc.c      | 1311 +++++++++++++++++++++++++++++++
 sound/soc/sdca/sdca_functions.c |   10 +-
 sound/soc/sdca/sdca_regmap.c    |    3 -
 sound/soc/soc-dapm.c            |   84 +-
 8 files changed, 1502 insertions(+), 25 deletions(-)
 create mode 100644 include/sound/sdca_asoc.h
 create mode 100644 sound/soc/sdca/sdca_asoc.c

-- 
2.39.5

