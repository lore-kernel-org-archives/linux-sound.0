Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C36161E521A
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 16:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752165329; cv=fail; b=KXMBHyI4uqKLUIXyR4aFXUtMTfZcIsAZnDThjX7nws0a7u/kEn9tz74QFWbYaKMkjGzMDX1eYed/FHT7XAKtxg1CAjLVLI9Z+aqeVs56sMDs064Zu4iXFS0t/K5mqk7PwEbfXWe2sPlkeV5eUEU5Ee9XiRV/mGAWxzMVzJCCHO0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752165329; c=relaxed/simple;
	bh=Y6+IlZFBplQrKM+dB/lwrZHqZCGLsz+6jPaKjmPLTuA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lgY/QqObbS7zOG8zUjtMIyoqMC+GagDptOwQrVqLlLuqXLlaZ3Jh82tfROv4oMdPwNnrJEYFT+DAF+DidRj+L1GvAqGtD549UxidsEgcao/wymZ/hH8BGUv/CFBZ8pfUBkbYypio4GLGgD5quFoIuQXAFsuAhAZsFfcfrRjlc8E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=ivugEeOk; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=ROB+VfNH; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="ivugEeOk";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="ROB+VfNH"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56A4wXGo028232;
	Thu, 10 Jul 2025 11:34:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=NKxxFXypmfKPHL8a5yid+FhFISQNTMi9AB3op3fdhfQ=; b=
	ivugEeOkOF6XoQoLV2TBPLFeZp/Zcu4bOIZ6Q4uTTfa2fJVgupW4Mh/msZoBj2og
	WY7gjU5Bue+5971RbsofwJY+fiCMqDl1djYIN9JfnIujK3VjNZ5/YDaq6BwLcGpK
	hhfd+avFVQ3R6PX5xbgUukpDMwYRwr0pg3FXVFeWbIHs/xvdyag09YNdeBOUoRFw
	h1b5Xxt5ffht/imp9ZbpyQCF/2+drz6AEv1qxAZUtjx/Py82NiSQplRRu2hGWocx
	Ks4Njb3u4yFFelGLahzsg+ELGLiNXli1ECsknTm1nkTv980amRZ0f0hMJ8wP2Eev
	XMWJzIYDb9U4PFCjmpJMxg==
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2129.outbound.protection.outlook.com [40.107.220.129])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 47sev6c111-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Jul 2025 11:34:43 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wcvl/mM3OpxjLE4C5WrY5SuQG8/RiI21WVfvuq3PnEYpIwsw8v3K6MrcIJd0c8ZnNOuzWePv5PqPpscyoglM3UhQWJV4I5aEu77LVPh2drX4D2LBVsHGyvokjuUMCyQP9C2pXYyCyMLMcBY7JvAhYqBj+W1TFOp5u227/iw+RNm7KQSOxa2kzUABB/v37EM8dvd33MghWaYRsfjiotTQcTBoc3Ht06VOYv9y/hjboKRbIo/ge3/Jzfr2sqxic49VSdPL4ON0u3F4MemHnNdZT4/fWmCyEQ4ZE7rZGm/VtwlOv15CCQJ6lyI6XHTzM3MWrrMf2iVyCE9qzMzagw/vFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NKxxFXypmfKPHL8a5yid+FhFISQNTMi9AB3op3fdhfQ=;
 b=bbE8hPWBhAVMJWbi36rIILd+nBxAP1NFow2Dr6uUFdMAxX65FjnYEvgtT3YpbyA9PyoaJ+7vSL0Bdkb4qTEDAJpzB7Lc43ujpAPGXofIe4obKE1OAAe/LbT/EqquSl6bNqSdyoYhfwTLigTLtNnazq+CLqSNQYeAjj7qZ1WN0UPMQBBuWDm4BGx2obGZHAaZ3UUDnVq74b+uK3s8fejPy8ihdAQY7kBI4GI5N/hJFTgPncgBB4QhUkC/5mDxzrwaIojPG095PsO6nmprT9Ndg5FBrWRTAux5nUQqOf/lRnb2zWSeA/5mEn+smi1J2J/MJTU8e2vkj35OynEGszG3JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NKxxFXypmfKPHL8a5yid+FhFISQNTMi9AB3op3fdhfQ=;
 b=ROB+VfNHBXOD1rvdYK4I/a9lKsF4m1Bv/GB1ZGAA2pFOsaJ2BPAqw/2lvM0lwo7DTBlrsZKpXCbgN6JDoyYGaBOpEOM154or4+ZLiDtayk4fqn6BbS79kmOG4B/Le5UKVDDgOE1Tg5PTF4krVIV35cFjf8/2l7F6SZwEl0aWaSk=
Received: from SJ0PR03CA0364.namprd03.prod.outlook.com (2603:10b6:a03:3a1::9)
 by SN7PR19MB6609.namprd19.prod.outlook.com (2603:10b6:806:273::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.20; Thu, 10 Jul
 2025 16:34:31 +0000
Received: from CO1PEPF000066E8.namprd05.prod.outlook.com
 (2603:10b6:a03:3a1:cafe::9e) by SJ0PR03CA0364.outlook.office365.com
 (2603:10b6:a03:3a1::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.22 via Frontend Transport; Thu,
 10 Jul 2025 16:34:31 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CO1PEPF000066E8.mail.protection.outlook.com (10.167.249.6) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.22
 via Frontend Transport; Thu, 10 Jul 2025 16:34:29 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 74EC540654F;
	Thu, 10 Jul 2025 16:34:28 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 5AD27820257;
	Thu, 10 Jul 2025 16:34:28 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        arnd@kernel.org, patches@opensource.cirrus.com,
        linux-sound@vger.kernel.org
Subject: [PATCH 2/2] ASoC: SDCA: Pull HID and IRQ into the primary SDCA module
Date: Thu, 10 Jul 2025 17:34:24 +0100
Message-Id: <20250710163424.1158958-3-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250710163424.1158958-1-ckeepax@opensource.cirrus.com>
References: <20250710163424.1158958-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066E8:EE_|SN7PR19MB6609:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 908a11b4-5df6-4921-389c-08ddbfcfa4d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?oltMzJ4vR3ogq0o9UGSZGKo64u+FRdkQyEvx7ey8BUfM9whUfxR5g8uI3Swc?=
 =?us-ascii?Q?rsU6ypO3ng/jOOzQEGqb3cCjTmjRmLQYS5zfErwzAHbSne/tTgxKTaPHXyV4?=
 =?us-ascii?Q?cLLUAPeH62TNReXI8igEdUlLzvavUOoap46a2P5pJwnWpnIx1f/mS8FqxNzU?=
 =?us-ascii?Q?RT3cUCXblieflNaRfJpyHCUsf147jhKjXp207sQDuJrCVAJTJZmZR71u2RJx?=
 =?us-ascii?Q?lpoCBDY/PQ0gcUEU39poTE+uO7HqjmOvievUnkcJ9Arp2UYpueN1vAWB++hw?=
 =?us-ascii?Q?tXp8vLqZiKaluqgo5O8np7kF+zd7mq9AnOxYii7DEn1WBS8BlZz7ZVYraU0i?=
 =?us-ascii?Q?rtiLd456CWj8YZL84m835i8Lkbjt6lJCIoV/gLJ+2JQxqYr6UR7lDUtH+z/a?=
 =?us-ascii?Q?blCq/sEYxmJZkmwm+5keevi3jtEy9JzMReRQQ1m5sOLAQy5zfTNY1z+ez2sE?=
 =?us-ascii?Q?BTdoB6CFEw8UZmi0nlr5meAWPdvhxRWezlq64meXGTPLiCSe/KbSiTMuv6Rj?=
 =?us-ascii?Q?vjpYSRQuYiVusCSW7ZX0LGDyrQVEZYV8c+lW8BjfVat9xIZVNpngKImFQPMc?=
 =?us-ascii?Q?EkIZUO5LcPa9i7bxSPBaQtKse8K2b05zldmO+yBKHr5sBaYQOOSmkrD/w/DY?=
 =?us-ascii?Q?vl5l34wjUjbs7b+s0tJP8Dhhea+yJL9xeAoCgTUWNdtUbW/R5ztEKkkUKhZP?=
 =?us-ascii?Q?ZHtCEmnYXRWhnr1TUCM2lJ2yIOUSPmgf9pziorSTHMMHE7ei4Uw2ual8Ylsk?=
 =?us-ascii?Q?sQOdBe4jtT3MFmmTPtSTrQezJ+A/pBu5QCr8BXjx4GNE+0wzoAcvAbpNw6xV?=
 =?us-ascii?Q?5+cbk+wExXoAcxaFWcsbYUGigIrpskYSv1c6ZgSQB6gRYIC3crT0Q/2heigb?=
 =?us-ascii?Q?ZDyjMDRK0Jr9+OWLrVtSuaVF/gqgRQc44Cja8Js8otL5m2hAtTgiDOyUSID4?=
 =?us-ascii?Q?h2pTv7Fu7KokLfpK1VIh9soCQdyErJq0VDhEUYH5KQecSMELl+7GdTrmg3+8?=
 =?us-ascii?Q?2ygI7XbJBBzx9yIQ4h5eSwxT6WZaaLmHm6VyDheW05aoNiZhoxNSHQuM2av8?=
 =?us-ascii?Q?aIkpS/BGPEDw17k6+dRdtGXVjbT3x1uymxhkL2W8plAfq0m2PlHLtQQY/6gd?=
 =?us-ascii?Q?3pCB12sNOIP6Sr3RBD9Y7cUXIssfV+a8wULmRLDjD4HMHSCbKOoG8oFQqBEV?=
 =?us-ascii?Q?X5wra4vZgenpFjaF5Ht+e9EUsafruyiDWMSzAQn4G4F5C61eD09ISIQrnM3L?=
 =?us-ascii?Q?CinktxMjrmqW2NjK/qmQvSXTW8mjMmgnrVfcjAC7J3lwVJApfkMgVYra1T4s?=
 =?us-ascii?Q?TfwQukHFKUlfjSdb0qykxgQsUaa1y4+mdtPJUtNn8um3JUZ2u7vIirMxDX3/?=
 =?us-ascii?Q?dnxkqxo8c66zZaW5BjRK05s2KG54gY/eHniubRTtuTlGlt5Tk09jlSAHO/tJ?=
 =?us-ascii?Q?7fe5hQXD2VuS4KfKmHCECzwJtA9sSyfY3FLVArIhxUo/7odxpsFR926y7A9Y?=
 =?us-ascii?Q?mrB1OgEfeIk220lXDSPDgPmw0dlEi/cuDLPD?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(61400799027)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 16:34:29.7908
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 908a11b4-5df6-4921-389c-08ddbfcfa4d7
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066E8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR19MB6609
X-Authority-Analysis: v=2.4 cv=Zb8dNtVA c=1 sm=1 tr=0 ts=686feba3 cx=c_pps a=pn3uJ1cN8NZYWFnaW73RRg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=Wb1JkmetP80A:10
 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8 a=PnvNH41lCDOGRys4nAIA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEwMDE0MSBTYWx0ZWRfX4WPkTAsFcb+m nFFmlUG0SzA+d4cViubcGA3yFJQVVJsnPCd3OQnfntQqSM8qscC0m9zKZhOIRBB/uuboa7L5lCH wndMdvTmMDcPgXclnh3dKmhqhqvOJVYZ5rgL7KVDmHc8saEoRNsbY028o5ruRa7xJxbWmH9SvCX
 n8ELkTLwF7k0UeQGeutmBrWiKvdyKu+Pa+H75J5vOUXw2WPkBPXLM+IU2v+//FCpLhAqIwyeqe1 YZcB5p/oQWVnZsiLsg4ISr4EWobSEiJVXNaTtCNAdt4KA2ThsQR11VdwpUqHL3ck6wuCNvgdDwG IOTzsMsJ/1T7Ghmrydck+haNUjWnjsd3Z1xUwHb03OjzuV0YhgLTaUOlYqYP0IFsy5eyQ/sqEOy
 5a3tfZegE3TKt7MJUPy++WJWVKDjxT2+a9Sq6kgArQ5Gc37pAn65Wwuzt9Z1XrSfwHXHvmGL
X-Proofpoint-ORIG-GUID: SSKr_DnghZDGjgWIr9ofpzCVFSxJ4c1w
X-Proofpoint-GUID: SSKr_DnghZDGjgWIr9ofpzCVFSxJ4c1w
X-Proofpoint-Spam-Reason: safe

If the HID or the IRQ are selected as options they will always require
loading alongside the main SDCA module. Since it will never be possible
to run without them the value of keeping them as separate modules is
fairly limited. Pull them into the main SDCA module to simplify things
still further.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/sdca/Makefile          | 10 ++++------
 sound/soc/sdca/sdca_functions.c  |  1 -
 sound/soc/sdca/sdca_hid.c        |  2 +-
 sound/soc/sdca/sdca_interrupts.c |  8 ++++----
 4 files changed, 9 insertions(+), 12 deletions(-)

diff --git a/sound/soc/sdca/Makefile b/sound/soc/sdca/Makefile
index 58a8f3ef3feb..08f87eb6746d 100644
--- a/sound/soc/sdca/Makefile
+++ b/sound/soc/sdca/Makefile
@@ -1,13 +1,11 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
 snd-soc-sdca-y := sdca_functions.o sdca_device.o sdca_regmap.o sdca_asoc.o
-snd-soc-sdca-hid-y := sdca_hid.o
-snd-soc-sdca-irq-y := sdca_interrupts.o
-
-obj-$(CONFIG_SND_SOC_SDCA) += snd-soc-sdca.o
 ifdef CONFIG_SND_SOC_SDCA_HID
-obj-$(CONFIG_SND_SOC_SDCA) += snd-soc-sdca-hid.o
+snd-soc-sdca-y += sdca_hid.o
 endif
 ifdef CONFIG_SND_SOC_SDCA_IRQ
-obj-$(CONFIG_SND_SOC_SDCA) += snd-soc-sdca-irq.o
+snd-soc-sdca-y += sdca_interrupts.o
 endif
+
+obj-$(CONFIG_SND_SOC_SDCA) += snd-soc-sdca.o
diff --git a/sound/soc/sdca/sdca_functions.c b/sound/soc/sdca/sdca_functions.c
index c34f3bf62983..be09b7a34102 100644
--- a/sound/soc/sdca/sdca_functions.c
+++ b/sound/soc/sdca/sdca_functions.c
@@ -1943,4 +1943,3 @@ EXPORT_SYMBOL_NS(sdca_parse_function, "SND_SOC_SDCA");
 
 MODULE_LICENSE("Dual BSD/GPL");
 MODULE_DESCRIPTION("SDCA library");
-MODULE_IMPORT_NS("SND_SOC_SDCA_HID");
diff --git a/sound/soc/sdca/sdca_hid.c b/sound/soc/sdca/sdca_hid.c
index b227ad94d08f..2224ade59aff 100644
--- a/sound/soc/sdca/sdca_hid.c
+++ b/sound/soc/sdca/sdca_hid.c
@@ -121,7 +121,7 @@ int sdca_add_hid_device(struct device *dev, struct sdca_entity *entity)
 
 	return 0;
 }
-EXPORT_SYMBOL_NS(sdca_add_hid_device, "SND_SOC_SDCA_HID");
+EXPORT_SYMBOL_NS(sdca_add_hid_device, "SND_SOC_SDCA");
 
 MODULE_LICENSE("Dual BSD/GPL");
 MODULE_DESCRIPTION("SDCA HID library");
diff --git a/sound/soc/sdca/sdca_interrupts.c b/sound/soc/sdca/sdca_interrupts.c
index edb045c7ebb0..2f85fcc6e544 100644
--- a/sound/soc/sdca/sdca_interrupts.c
+++ b/sound/soc/sdca/sdca_interrupts.c
@@ -279,7 +279,7 @@ int sdca_irq_request(struct device *dev, struct sdca_interrupt_info *info,
 
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(sdca_irq_request, "SND_SOC_SDCA_IRQ");
+EXPORT_SYMBOL_NS_GPL(sdca_irq_request, "SND_SOC_SDCA");
 
 /**
  * sdca_irq_data_populate - Populate common interrupt data
@@ -313,7 +313,7 @@ int sdca_irq_data_populate(struct snd_soc_component *component,
 
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(sdca_irq_data_populate, "SND_SOC_SDCA_IRQ");
+EXPORT_SYMBOL_NS_GPL(sdca_irq_data_populate, "SND_SOC_SDCA");
 
 /**
  * sdca_irq_populate - Request all the individual IRQs for an SDCA Function
@@ -393,7 +393,7 @@ int sdca_irq_populate(struct sdca_function_data *function,
 
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(sdca_irq_populate, "SND_SOC_SDCA_IRQ");
+EXPORT_SYMBOL_NS_GPL(sdca_irq_populate, "SND_SOC_SDCA");
 
 /**
  * sdca_irq_allocate - allocate an SDCA interrupt structure for a device
@@ -433,7 +433,7 @@ struct sdca_interrupt_info *sdca_irq_allocate(struct device *dev,
 
 	return info;
 }
-EXPORT_SYMBOL_NS_GPL(sdca_irq_allocate, "SND_SOC_SDCA_IRQ");
+EXPORT_SYMBOL_NS_GPL(sdca_irq_allocate, "SND_SOC_SDCA");
 
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("SDCA IRQ library");
-- 
2.39.5

