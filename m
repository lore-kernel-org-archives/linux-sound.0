Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD15A2773E5
	for <linux-sound@vger.kernel.org>; Mon, 20 Oct 2025 15:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760975754; cv=fail; b=O+963cNQ04CJ443F/+a75lcEmL1UsDagOY7+Wejog94Ce9qR3lwiSdd1m27Pz9ZFZzR3syAq8vrtPXRj6kppf4CQeJOcmn6yd6d7qaXIxbM6KwBmhxxQ21UChJl52J7oxI1cCcVaUZ8K7OwbWb4N4xhjRdUZCU7jyo28F8h9DdM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760975754; c=relaxed/simple;
	bh=uqt7LipyxrJ0URvZELNat/xII3ref1U4bJCsOxSQw/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=l3z8XlDAHeWSJRgPoZG8kogrBxb7fi973PE8wznrgVOE3VOQ68rsST3K10yEUGTF+7fWNnMhdhSs8qtN+7UY8fdn+hiuJNxHaxORZ0khyhtB0qs8dweMeC3EDsO0h2z0oj3BFIeYTqfi2RXd3JOwWvR2X+nxLk5AqqPKQrYPUlk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=OWRQa+3u; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=0BztxYwm; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="OWRQa+3u";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="0BztxYwm"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59KEAb4G941361;
	Mon, 20 Oct 2025 10:55:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=dbT+ZkWiXGG2Jd4k
	9ImUCF9WJ11E9U1X3d8g2dUYxmg=; b=OWRQa+3uKnQJK5hCMTli6Ud5TD2DtNAJ
	k+VfqlOtbjYYhgnAHV8Hgyzfh2seZHUuBatzzgVRjbiDMJ7I/HO/xiau29fY0iv2
	3sQ8mNgIB5+shGhVJtcpJ1QkXZXQFS5cdzwdalSlWpyZ7uyPrbGqPO/3GITw8o4O
	BkDYhYfs0Nvopo5DBdVXAZRBXoXgknp3OnQ9TpMRSYL1eLIW7RaijA06WlGTecbJ
	EKvXtEKPPrT2Fc4oEncT9djPkPwQX7w/SJxeYVZjWBfCWcLDuqhOH1O4Io+ndtNO
	F/s6oulcX0UQM0XhZ+a439TKvw4VUq07rY67NygqGnyriEDLhLqDMg==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11022099.outbound.protection.outlook.com [40.107.209.99])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 49v7aj2aee-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 20 Oct 2025 10:55:22 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gI09LBNa51P9QzwvzBq4G5FQlaWDLfAGTg85f40WmaNQl6ylYmwd2PvfTSeBtBaBRJUt4NAgJjmgRvZ4GUoNNQMd0Vm2RPCMKLAQ5M0SYSsFYQQwmlbI7ZPGtXnPuN2A0cE9fuDH63b1eJfPiIwPCVvbgemli08I3grlzWCprRiIaJNHm2upmzrRFmPx0DH1BlbggXxMH7paukWAchzQuOmfyToJM8n6XC7Lkf91eLAPMHzCK7RM4sOl/PrxHgyPibX3THsB+9Cg/hKUqNFrX/yu7GWfx709FZ57HJRpJvscw7rs230g6SyB/vO42K8fynkmoYxOGTjReSisIc7hAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dbT+ZkWiXGG2Jd4k9ImUCF9WJ11E9U1X3d8g2dUYxmg=;
 b=DQYVSRrLL0U7RI8E4mQvHz15WfHo38z/53LGt/le7UQ3gLJt4Wy9VCusDTSzR9+timvWZ4mERzcJJvvU+BBT9FciDBod1PF1+TOi3QsRNhlL7TiM6gX4G5mAPiM9New4oRoEXuSWjhBaTrAcXJ9ZjpiwMxlIWYWw5A9rCnPDEFocioiUrYMpbLByrsVIEH3639m/wuMqd4gTJpIy79AgVYwnq97PbBTgVJArnWN08BFIsu0gvL8n29Re1UG0QchkmPEj7d7uJQbk5rWQ+t2d15Kqk54exe5j110CwcKL5LCxOcyRJ1Y1DPEdqH6TiESf+0gtt4R1hyxcrCZFXAXPlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dbT+ZkWiXGG2Jd4k9ImUCF9WJ11E9U1X3d8g2dUYxmg=;
 b=0BztxYwmb4llEkJPueEphj+iZUat/67SWRpsoh5vD8bzryic7dfnyAOZd2iEocaLahN1lY1J79dLTq01kFqh27I3/2jaPOARjwaqX3wJ/GwCUj/fKfn+XdOJoDwS9tL1u/LuzP+iSBI+yABJ+B3oNiPSshQ3ZvxuO4uQXlI8ies=
Received: from BYAPR06CA0009.namprd06.prod.outlook.com (2603:10b6:a03:d4::22)
 by CO1PR19MB5016.namprd19.prod.outlook.com (2603:10b6:303:d6::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.12; Mon, 20 Oct
 2025 15:55:19 +0000
Received: from MWH0EPF000971E4.namprd02.prod.outlook.com
 (2603:10b6:a03:d4:cafe::41) by BYAPR06CA0009.outlook.office365.com
 (2603:10b6:a03:d4::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.17 via Frontend Transport; Mon,
 20 Oct 2025 15:55:19 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MWH0EPF000971E4.mail.protection.outlook.com (10.167.243.72) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.7
 via Frontend Transport; Mon, 20 Oct 2025 15:55:18 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 20BCC406547;
	Mon, 20 Oct 2025 15:55:17 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 07C95820244;
	Mon, 20 Oct 2025 15:55:17 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        peter.ujfalusi@linux.intel.com, shumingf@realtek.com,
        lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v3 RESEND 00/19] Add SDCA UMP/FDL support
Date: Mon, 20 Oct 2025 16:54:53 +0100
Message-ID: <20251020155512.353774-1-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E4:EE_|CO1PR19MB5016:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 3f2cb890-5446-40b9-08c7-08de0ff11193
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2btwvVnWKS79NW5KXAbTG3su3BFiFmP0p3gaN8YNO1ME7eOMP4UksSciVpKr?=
 =?us-ascii?Q?I3UmwHxcjZcrN41VbiAhNHbPt3izQO3pX4FlRKGT3bVgK+40Y9vsWvi7SicS?=
 =?us-ascii?Q?YpZtrxqbJx9GmoThWeCFl87CTEChjZLqGmwHj0c1Cju2pI76NETzldXUkw7E?=
 =?us-ascii?Q?maSvLh9d9iQBZCLierCAxv1p1azsl3fNK7rFhIY7UQ/9gV7wvlqi+OKYKhtA?=
 =?us-ascii?Q?VPKSFRpkHibrd/XJx2fjo86zRWROvcdGXRfUFWNSn3zd+QjD2ryIpxGhnYiU?=
 =?us-ascii?Q?n81/BeI7QBUteUglKWZaIFG37YLARGTpMkoznPH77M+flbzC2bJmb2ZPteCQ?=
 =?us-ascii?Q?QSc/8vkiaH41+stxJfSqHLRDVuA5Bx8a4mm6awmI1kpOaYHHWkZME0ZIPzeC?=
 =?us-ascii?Q?AxJ+itV4Hf0PxDX7Tr96ZyMOWkUAFnkHJmuJLmw38O4S0DD5UjVZYd+Sh1mh?=
 =?us-ascii?Q?CC4s6WrRQYq4/jU4PR5DcexJrYyu0U4saZJ9T/rR6WeVKUrFrPJ6F8mBSGtd?=
 =?us-ascii?Q?DlOQgXPFPVvIdsmY+Nir9yfS99QBo6iYGD3RQQpOn+6RH9f3JkfX6RUH7Wtc?=
 =?us-ascii?Q?buNVg2khuaCsqeRuUnWzr5yatOBS47lwvcyVD5BrM5tFotJd+hXTjI3PmZ0/?=
 =?us-ascii?Q?4LUKp2gHDEzzcFJTszcZcuAbRarAmfUVQDBzM+iIcUDqszlFaQeR+yTP0PwY?=
 =?us-ascii?Q?YBjuFtZ7qz5RTyJlOYJfC9xb3oN+Qsj1cH9HAb8V8MzM5XwBoD9hFciBcOeB?=
 =?us-ascii?Q?ODZrlAUPVURV1O5JE25+H2+TGLcAtmhtqyVc9TOo6WwKO3+bMRWpuWkciV5+?=
 =?us-ascii?Q?rSaAEVrPLx/JCxST+1OQ2FXmJTZjNVHuuzXr641Gxzx/AeRklZmKwWUwQ47Z?=
 =?us-ascii?Q?PDQ5eA4PK6shPoKY8c5xa4C49Pcu/AiUVIDQGNRHLofKGiAWXkuoKKRjyqZc?=
 =?us-ascii?Q?yE/1EozHgPQNF730p2i8UtpEAQtKVx8SgsvRpetxjPE3rYEhLsdWL2Y/idCk?=
 =?us-ascii?Q?25QYJFsi6NJepbryJgj8K7lIYcgVfhaDeAqiLloNAO1ZKZPjFFx75QgThgeG?=
 =?us-ascii?Q?czc+ABkEIMHufvPp3dlulFPivPzAE62R+h5nGnspGoUqjF/NUQ3+Fat2pDE1?=
 =?us-ascii?Q?iSXhKjTBudPAmtPJesb12tXPzaue8UH2EU+Sy83TMmBuqOChlsOjbgSg9mX4?=
 =?us-ascii?Q?0KgDrxBmGlJj1jvygCR/rH6n3EiIt4QUBjbvhwqEDRS9L4Ap7Xe2EarZfucE?=
 =?us-ascii?Q?Wzs0/FafubHJ1SRSOz9sS+ASLxyxcwyVl4ERxcteViGtX4sbWV2JGmBCULoO?=
 =?us-ascii?Q?Gbmqzoh/R8tl4tTGgct9666O9ayh6xntObT7PTgfqJkbQZD4PMeSvoWCXM3A?=
 =?us-ascii?Q?u15rI64CMFFSyNsjs1H4zz5p82DuTG0+cwEOAzFraZPrcFBe/9w1ZqtyF50z?=
 =?us-ascii?Q?9Myg9Qek1p35Nd5imjuR27LxcUn5vkM0qpAeZramuqYy8ZsbDqqeks9J48Rz?=
 =?us-ascii?Q?a1yhlbX4m+78xTP1UzVPqv8LRt4jKJxY/q6s/pK9MN2haQ0cYdzptg/9FKNk?=
 =?us-ascii?Q?i9yheuHinOgN86Q6zfc=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 15:55:18.6291
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f2cb890-5446-40b9-08c7-08de0ff11193
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MWH0EPF000971E4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR19MB5016
X-Proofpoint-ORIG-GUID: FP8p-JP8-GGPtjPbF_ZbhgPHAhEQS0cX
X-Proofpoint-GUID: FP8p-JP8-GGPtjPbF_ZbhgPHAhEQS0cX
X-Authority-Analysis: v=2.4 cv=bdNmkePB c=1 sm=1 tr=0 ts=68f65b6a cx=c_pps
 a=TyCWzW9CAQ5Ogo61w8w6wA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=x6icFKpwvdMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=NX2PRUKTKYJzq1xaoV8A:9
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIwMDEzMSBTYWx0ZWRfXwQW3tyMo50+C
 wRJ3O6BFGympzOKwewLHa/HgsLdA3hYEac6ZEXlwWwEhcmmCJ6rvKznadXZ/jGKkVYZrvXrZiza
 NMXMjl3h9/bFRuwIBso3e2Ouonxi56R56v+NJtiAAGK8sYhCXLeKGMHb1JpH7aPhT87huaBze/a
 Q8IggSXB+vkzrwBlZQNM3hmLSK7z2zP/UX9r000JmcHOKUhUH/wQtrg7zdzt1gGHZgZs0Z+bXF8
 SDNCDZUoAgi+s/w+EBfpIX8juVnyLkkuD+0X6oh8xL0Ebt7kml+CHeH6GaDglHL8QpFS3l0AeDk
 +GX/sxOwy413S2Zl45sVxAeD7VaJGTRp+X9lilrIlGMDW0VQavaRGeIC/6cXA0aoJGCYldeY7zW
 OmXgb/gOAzvuoIlrrTLvLcMqoT/X2g==
X-Proofpoint-Spam-Reason: safe

Next installment of the SDCA changes, hopefully the next series after
this should be the full class driver. It is worth noting this series has
a build dependency on a patch working its way through the PM/ACPI tree:

commit ac46f5b6c661 ("ACPICA: Add SoundWire File Table (SWFT)
signature")
git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git

But we can probably worry about that later, as normally there is a
reasonable amount of review on these SDCA series'.

This series broadly breaks down into 3 chunks, first there are several
changes to remove the assumption that the struct device used for SDCA
purposes represents the SoundWire slave. This is because the SDCA class
driver will be made of an auxiliary driver for each SDCA Function, thus
the SoundWire slave will be on the parent device for each individual
driver. Then there are patches to add support for UMP/FDL. And then
finally since the rest of the HID support is there and UMP was the last 
missing part required a small patch to add a function to allow reporting
of HID events from SDCA devices.

Thanks,
Charles

Changes since v2:
 - Add mutex to lock between UMP timeout work and IRQ handlers
 - Clean up UMP timeout work after FDL fails
 - Use IRQ number rather than a boolean to track used IRQs
 - Reduce FDL retries to 6
 - Check disk size of firmwares
 - Reset on more FDL failure paths
 - Reorder volatile control check by entity

Changes since v1:
 - Add timeout for UMP buffer transfers
 - Add function reset
 - Parse XU properties from DisCo
 - Rename entity_xu library to FDL
 - Add a limit to the number of times it will try the FDL process
 - Rename soundwire device pointers to sdev to distinguish from Function
   devices pointers

Charles Keepax (16):
  ASoC: SDCA: Rename SoundWire struct device variables
  regmap: sdw-mbq: Don't assume the regmap device is the SoundWire slave
  ASoC: SDCA: Add manual PM runtime gets to IRQ handlers
  ASoC: SDCA: Pass SoundWire slave to HID
  ASoC: SDCA: Pass device register map from IRQ alloc to handlers
  ASoC: SDCA: Update externally_requested flag to cover all requests
  ASoC: SDCA: Factor out a helper to find SDCA IRQ data
  ASoC: SDCA: Rely less on the ASoC component in IRQ handling
  ASoC: SDCA: Force some SDCA Controls to be volatile
  ASoC: SDCA: Parse XU Entity properties
  ASoC: SDCA: Parse Function Reset max delay
  ASoC: SDCA: Add UMP buffer helper functions
  ASoC: SDCA: Add completion for FDL start and stop
  ASoC: SDCA: Add UMP timeout handling for FDL
  ASoC: SDCA: Add early IRQ handling
  ASoC: SDCA: Add HID button IRQ

Maciej Strozek (3):
  ASoC: SDCA: Add SDCA FDL data parsing
  ASoC: SDCA: Add FDL library for XU entities
  ASoC: SDCA: Add FDL-specific IRQ processing

 drivers/base/regmap/regmap-sdw-mbq.c |  23 +-
 include/linux/regmap.h               |  21 +-
 include/sound/sdca.h                 |   5 +
 include/sound/sdca_fdl.h             |  75 ++++
 include/sound/sdca_function.h        | 119 ++++++-
 include/sound/sdca_hid.h             |  21 +-
 include/sound/sdca_interrupts.h      |  19 +-
 include/sound/sdca_ump.h             |  50 +++
 sound/soc/codecs/rt722-sdca-sdw.c    |   4 +-
 sound/soc/sdca/Kconfig               |   8 +
 sound/soc/sdca/Makefile              |   4 +-
 sound/soc/sdca/sdca_device.c         |  20 ++
 sound/soc/sdca/sdca_fdl.c            | 499 +++++++++++++++++++++++++++
 sound/soc/sdca/sdca_functions.c      | 212 +++++++++++-
 sound/soc/sdca/sdca_hid.c            |  58 +++-
 sound/soc/sdca/sdca_interrupts.c     | 271 ++++++++++++---
 sound/soc/sdca/sdca_regmap.c         |   9 +-
 sound/soc/sdca/sdca_ump.c            | 262 ++++++++++++++
 18 files changed, 1573 insertions(+), 107 deletions(-)
 create mode 100644 include/sound/sdca_fdl.h
 create mode 100644 include/sound/sdca_ump.h
 create mode 100644 sound/soc/sdca/sdca_fdl.c
 create mode 100644 sound/soc/sdca/sdca_ump.c

-- 
2.47.3

