Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F42B28ECE0
	for <linux-sound@vger.kernel.org>; Tue, 24 Jun 2025 12:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750768166; cv=fail; b=eJucC5EK7x/XITRfXxcKgNFlZVotzGlaGrC+wnkQ4dhQCrF/gN9sam2mYJXPxD52nr4ks5BeIjPg5vUakuvb4Btp2VT2lvoGnLkSDJtpIWI6j1JxtzxDJbfE7zybXfoVvsmQ6J8aKJcLwsGl4w9NYOPEXo5Z8VllIrszT8DdBuE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750768166; c=relaxed/simple;
	bh=7K4dJRwnnfe4sAYjqrjwwJMfx93qzsjo2K+WluKotIg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VVouazzSoSdcQH13t/ar4w0SbJ7WgRMhex/r+j8Hi6di5yIoukijxanGCRBx7M1+jIOayx0SiwiXQmdQOS21JhI0zB1cYhS1USy0vSCMT6Vm1x9ADAHN7A3UXaCUV6LcgcUNthQkaK6FpUA8MAZhDjgyWfA4j8vTytGjD32zpXo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=dlUbyT0z; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=zfXRplIO; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="dlUbyT0z";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="zfXRplIO"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55O6gKQ5006784;
	Tue, 24 Jun 2025 07:28:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=IlLDSENhln9aiKvgWC/MtknsoG1jSg5gK4RqRu1C9UI=; b=
	dlUbyT0zf/uR3MzhdAgR9vOwddbJR7k8rwOgr/oB0VsYW31Ez1QIGRTOPFDYyLB4
	Otu0ToTeQ1nKuzR1vbut2gVM0BAAD63flNWctxW0r1tcle+zM4+IE3v725i+Gle9
	mq+fj8Ps/dXkE1RDQEdlo0Kikl2GAz3pGwM4IvTTs5YQjNMWDOTZ3Oa2X19YzKSV
	RZ5WtWjZApnW9YzJWqzNTpvgN6/3Tkb/cSyURbnEIh194Vxg/zzKV5JFNSUy+Yh/
	iPcrvrN8btAMfWJD2cxXWCKIXvtnEyNeIRuXZd+OAhW53ZWhCLHCpSB1SbVVVGJR
	DXIIfRnP66zZu7YoYe8h7A==
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04on2139.outbound.protection.outlook.com [40.107.101.139])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 47enk9jpph-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Jun 2025 07:28:58 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uqMhTisjvja8VITreoNUz6ss1RH3zLSL0P+x4KMq6Wyx/s4Av2jRslAmqla8qLB6w/mcbTiHA13cqF7pujWyMZk5UzKWC1Ped0RzIERSJJWn2a4MiNzX8g99rGz6LDqvsAJUjFhSM6Q+UwQrkOcxbQ2IMsuD80eLQ1F1adHP6NiAf5WeDAlwH9T2TJQg9wm62rtOTtbnZs7wdFDGeeMqEFb3WQ5dc0Ln3LoB/cKtSuYb/Q2dYIPk8dANRRQfWxcMJo16koeqpargG84zJh7IjoglkssrJ3+W9cbmuvdooFLhRTg9p8E8hKIKqFhIJx6RKszgYuNd8mOAMtiuLiII0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IlLDSENhln9aiKvgWC/MtknsoG1jSg5gK4RqRu1C9UI=;
 b=L50GWHhdoCk3EbDcuj3nptx1we0jJ0DMdHhnuJXXiaqJ9MTP3/qs7YtWilHEmHb6ONrM5SdbwZDAy7Wesm2n8MCdmqw+TSOjrLlZjPfuow6RVIjomcdvVkt55c08o9BzHS/sFrhhh1RhNyg6/WzicRHLJY/fQ2HGlJo6CHIz+ASpByhB4URaeq4Uv5mytmHqQ/l2c1XshuBueYZdb+xAHyLSaRClrLdmhxGJnhWu9y/BSlui2KC+O35Svyamc90aH/4cM8ZUWN7Kim62mgfxyR6cBUk021LTiwVJlqbVlzUVFhjA1MqyMEFwNS3e49DgCbBCuUHL3fPn1kOKY5+L7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IlLDSENhln9aiKvgWC/MtknsoG1jSg5gK4RqRu1C9UI=;
 b=zfXRplIOVivvol0nl0w4B/EEkZszW+rBPjexRfY1/wkegNtTXWiOvW4TsfTq0jbAPw5/1BjEJ78nVg110/waHSFO7pf/YSHuDXjBadihUXIk8qXQzgEGrH9hGHeU0sio7OmDoSJOu2gBuYNgE9add9Rxe/NxKOOgFpDu6ldfkTM=
Received: from DM6PR13CA0030.namprd13.prod.outlook.com (2603:10b6:5:bc::43) by
 DM6PR19MB3865.namprd19.prod.outlook.com (2603:10b6:5:1::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8857.20; Tue, 24 Jun 2025 12:28:53 +0000
Received: from CH3PEPF00000012.namprd21.prod.outlook.com
 (2603:10b6:5:bc:cafe::67) by DM6PR13CA0030.outlook.office365.com
 (2603:10b6:5:bc::43) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.16 via Frontend Transport; Tue,
 24 Jun 2025 12:28:52 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH3PEPF00000012.mail.protection.outlook.com (10.167.244.117) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.1
 via Frontend Transport; Tue, 24 Jun 2025 12:28:52 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id A64F440655D;
	Tue, 24 Jun 2025 12:28:48 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 988EE822540;
	Tue, 24 Jun 2025 12:28:48 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        patches@opensource.cirrus.com, linux-sound@vger.kernel.org
Subject: [PATCH v3 7/7] ASoC: SDCA: Add some initial IRQ handlers
Date: Tue, 24 Jun 2025 13:28:44 +0100
Message-Id: <20250624122844.2761627-8-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250624122844.2761627-1-ckeepax@opensource.cirrus.com>
References: <20250624122844.2761627-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000012:EE_|DM6PR19MB3865:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 49a8e540-5294-4a5b-511a-08ddb31aadd3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|61400799027|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1/CR8kMw9q06g38qC7npLU/Ta7lnLrK0OnSYOMiVBvkbiLT/4a493oCj8Aog?=
 =?us-ascii?Q?pCt09xXmvYY2pukQK5PNhIbB6luAMG51m1Dg4I6swiQkLZEq65n4GPWTQAuy?=
 =?us-ascii?Q?deYFmZcPLyPuMEvmfp5jSiS9veGa+IkuH8RcipJdZXD4WrVL8gV/DYUM6xTS?=
 =?us-ascii?Q?16smejyrtg+XS6PWk5IN3kf/0jARJnZK5nHRGktH2U9+Xlxq45/19ml43J+q?=
 =?us-ascii?Q?dGORTuyYuTc9GTGoVMGw69nzk9gD63KmOWZirIscgg0Gjy7ivSw+oJ1jKa57?=
 =?us-ascii?Q?GgRYFim48axoh6BzlpFhiWOx7BJFAx9ELWCXCzJojz190YLdI3edKbpwyjt3?=
 =?us-ascii?Q?+dpBtlLWaBQGX2BZuf3E87T+5tOJ4Ztlpv2T74XukwwJJOcHdUJvB5Jj3jEr?=
 =?us-ascii?Q?Qj2Fh77h//7BXns6Ww6y8yGB0q2MoNrO3lpJkIiSvc+1+xD2XpFqNNc3wgu6?=
 =?us-ascii?Q?FQGa7RdDIebQKAd9oXy/bxTylsBwXKPBU7rqONKiud/538UxOgkxKEq0hHI+?=
 =?us-ascii?Q?yj6Ewcjy1BoF7eDZTGS0MMBc+cQVR/g42z78X/DRu+TfmNehQ6edZeL3WOaX?=
 =?us-ascii?Q?ScAa0V4npVxtRmDzRgtXEoOUJ6/XERSrOmBLRzCJtdtu/G769m+C7xxLffDD?=
 =?us-ascii?Q?rBlHplkZrgq62+bXuu4XxBfUmog1qEChIZbG7ceMWlwCPyTonUjXsT6npFWP?=
 =?us-ascii?Q?32ZW2mEK3p34/9a8EgsBcuUkPlUbh/rq1C7nn3j1ADAnvkhRqK83X2GrRhzP?=
 =?us-ascii?Q?eZdrAhIPS1a3jrvK5UzyUnbu0pcqY5P8Gd/XhUHQEZiGr5Zkho/a5e2JRgoQ?=
 =?us-ascii?Q?XssmKoTp13DeP2rBjYUuLrP94/GvBe5CP5yuIxuew7i3i0440QgcdEh23l74?=
 =?us-ascii?Q?ZAV/PUlY9AOfyGj6Q43pJk+qbc42OZUArRIrV1UcZYGtDKC4ambev+hp5zag?=
 =?us-ascii?Q?65FlcmtzjBJgSd/oxqqX4KXGQcogevcwh+4q8K8AtMsXVXW+jlOISVoW6Ale?=
 =?us-ascii?Q?V1v/TOnKRnZh19CJ9B8mTc3D1p/5qcLFX9/Kk8aD6NByOZZHnPD191ErJNu5?=
 =?us-ascii?Q?11OeYpCMAkqFSKaUwHp1lXsXNKYC6pQ5y13EEr+nDU04feD0GeScxGyVdQxk?=
 =?us-ascii?Q?jBFdFdzw/s284ACOymz6lH62PeitSDsRNtysUhWHl47FEt6ECDmASXYdqsYB?=
 =?us-ascii?Q?5O3b+IBhZW6dNZwMsgOdAMZDnhV0hu8VS0VhRGcohWowiBiECZXaEH3euhCB?=
 =?us-ascii?Q?yWRfVvHhDpM5jW7sXaU87iBFYbqGpxqj0Aod5Qgci2SZGihpyIlCNG/Qo4vo?=
 =?us-ascii?Q?1+nDtfaFu6efuAbYVtshTpJ1FQukTO1GlULZ3bJ7mdyI09t3vUFzHBGiGyCG?=
 =?us-ascii?Q?CTxR7T9SngFNeSf5aRpZv8MeUYhQPJ1SAnfhwyp1YZl0VxCUtVvLzTOu3EMi?=
 =?us-ascii?Q?/RrV7+BgfPbWM4o0MBtzjMJTs//YoAzK1oo5JvHyY0/ZYQKFbDXcYg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(376014)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 12:28:52.0940
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 49a8e540-5294-4a5b-511a-08ddb31aadd3
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000012.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR19MB3865
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDEwNSBTYWx0ZWRfX1xiD1rOkdKc7 EgOUK2aXrykHWKc0tRZZLignL3Wl+GujAyGm/FLkCXj0fJpRqQ/zVyA4UmBgso5tx7vhAXU6Wsj kybbnNto95RTP5EI9TFoJMWoUZCX2jlKdbtpoerN2JYpfhGdzk3+6Gz8S0TInWf+hjAsmit7yiu
 BwhpodBISJJpU29IHPuAp9doE5Hmg573DuuGSBY5C7vWfuekdZpF3mpjyH2rvXWkpLrg/51PwxX ATV9y1zwlt/fVXsEjfxDEryTl3ljmly3VicDQUEDUkmINdLWHFeqrlZn+g3I2dJkvTAASYDgPis Elx5PqYCGPxyk5DP57HHIMYj0g9qK8mYw4IaBVhp8jE7B7eeuEheCSZhmELu1gIInFRcjVRSEVe
 JU8BmEwcpD49fB8b/lEx38RexQZSnLJreCycANJJXH4X3udUmerzp3ltShGrpHjruZdIu/tm
X-Authority-Analysis: v=2.4 cv=da+A3WXe c=1 sm=1 tr=0 ts=685a9a0a cx=c_pps a=V5/NjU3NgidCWLUgAwmp6Q==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=6IFa9wvqVegA:10
 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=KJT-RnjOAAAA:8 a=QyXUC8HyAAAA:8 a=w1d2syhTAAAA:8 a=5lud2KN1Rdv909MgAGMA:9 a=HE_01F9_QflCRFonrIQr:22
X-Proofpoint-ORIG-GUID: PADynOzrtan4j_SBz5zoDqFF-nnTNelZ
X-Proofpoint-GUID: PADynOzrtan4j_SBz5zoDqFF-nnTNelZ
X-Proofpoint-Spam-Reason: safe

Add basic IRQ handlers for the function status and jack detection
interrupts.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No change since v2.

 include/sound/sdca_interrupts.h  |   3 +
 sound/soc/sdca/sdca_interrupts.c | 157 ++++++++++++++++++++++++++++++-
 2 files changed, 159 insertions(+), 1 deletion(-)

diff --git a/include/sound/sdca_interrupts.h b/include/sound/sdca_interrupts.h
index 4cda8b75bae0e..bbbc3ab27ebae 100644
--- a/include/sound/sdca_interrupts.h
+++ b/include/sound/sdca_interrupts.h
@@ -27,6 +27,7 @@ struct sdca_function_data;
  * @function: Pointer to the Function that the interrupt is associated with.
  * @entity: Pointer to the Entity that the interrupt is associated with.
  * @control: Pointer to the Control that the interrupt is associated with.
+ * @priv: Pointer to private data for use by the handler.
  * @externally_requested: Internal flag used to check if a client driver has
  * already requested the interrupt, for custom handling, allowing the core to
  * skip handling this interrupt.
@@ -39,6 +40,8 @@ struct sdca_interrupt {
 	struct sdca_entity *entity;
 	struct sdca_control *control;
 
+	void *priv;
+
 	bool externally_requested;
 };
 
diff --git a/sound/soc/sdca/sdca_interrupts.c b/sound/soc/sdca/sdca_interrupts.c
index 7272d11cb6d49..edb045c7ebb08 100644
--- a/sound/soc/sdca/sdca_interrupts.c
+++ b/sound/soc/sdca/sdca_interrupts.c
@@ -7,6 +7,7 @@
  * https://www.mipi.org/mipi-sdca-v1-0-download
  */
 
+#include <linux/bitmap.h>
 #include <linux/bits.h>
 #include <linux/cleanup.h>
 #include <linux/device.h>
@@ -18,6 +19,7 @@
 #include <sound/sdca_function.h>
 #include <sound/sdca_interrupts.h>
 #include <sound/soc-component.h>
+#include <sound/soc.h>
 
 #define IRQ_SDCA(number) REGMAP_IRQ_REG(number, ((number) / BITS_PER_BYTE), \
 					SDW_SCP_SDCA_INTMASK_SDCA_##number)
@@ -80,6 +82,143 @@ static irqreturn_t base_handler(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
+static irqreturn_t function_status_handler(int irq, void *data)
+{
+	struct sdca_interrupt *interrupt = data;
+	struct device *dev = interrupt->component->dev;
+	unsigned int reg, val;
+	unsigned long status;
+	unsigned int mask;
+	int ret;
+
+	reg = SDW_SDCA_CTL(interrupt->function->desc->adr, interrupt->entity->id,
+			   interrupt->control->sel, 0);
+
+	ret = regmap_read(interrupt->component->regmap, reg, &val);
+	if (ret < 0) {
+		dev_err(dev, "failed to read function status: %d\n", ret);
+		return IRQ_NONE;
+	}
+
+	dev_dbg(dev, "function status: %#x\n", val);
+
+	status = val;
+	for_each_set_bit(mask, &status, BITS_PER_BYTE) {
+		mask = 1 << mask;
+
+		switch (mask) {
+		case SDCA_CTL_ENTITY_0_FUNCTION_NEEDS_INITIALIZATION:
+			//FIXME: Add init writes
+			break;
+		case SDCA_CTL_ENTITY_0_FUNCTION_FAULT:
+			dev_err(dev, "function fault\n");
+			break;
+		case SDCA_CTL_ENTITY_0_UMP_SEQUENCE_FAULT:
+			dev_err(dev, "ump sequence fault\n");
+			break;
+		case SDCA_CTL_ENTITY_0_FUNCTION_BUSY:
+			dev_info(dev, "unexpected function busy\n");
+			break;
+		case SDCA_CTL_ENTITY_0_DEVICE_NEWLY_ATTACHED:
+		case SDCA_CTL_ENTITY_0_INTS_DISABLED_ABNORMALLY:
+		case SDCA_CTL_ENTITY_0_STREAMING_STOPPED_ABNORMALLY:
+		case SDCA_CTL_ENTITY_0_FUNCTION_HAS_BEEN_RESET:
+			break;
+		}
+	}
+
+	ret = regmap_write(interrupt->component->regmap, reg, val);
+	if (ret < 0) {
+		dev_err(dev, "failed to clear function status: %d\n", ret);
+		return IRQ_NONE;
+	}
+
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t detected_mode_handler(int irq, void *data)
+{
+	struct sdca_interrupt *interrupt = data;
+	struct snd_soc_component *component = interrupt->component;
+	struct device *dev = component->dev;
+	struct snd_soc_card *card = component->card;
+	struct rw_semaphore *rwsem = &card->snd_card->controls_rwsem;
+	struct snd_kcontrol *kctl = interrupt->priv;
+	struct snd_ctl_elem_value ucontrol;
+	struct soc_enum *soc_enum;
+	unsigned int reg, val;
+	int ret;
+
+	if (!kctl) {
+		const char *name __free(kfree) = kasprintf(GFP_KERNEL, "%s %s",
+							   interrupt->entity->label,
+							   SDCA_CTL_SELECTED_MODE_NAME);
+
+		if (!name)
+			return -ENOMEM;
+
+		kctl = snd_soc_component_get_kcontrol(component, name);
+		if (!kctl) {
+			dev_dbg(dev, "control not found: %s\n", name);
+			return IRQ_NONE;
+		}
+
+		interrupt->priv = kctl;
+	}
+
+	soc_enum = (struct soc_enum *)kctl->private_value;
+
+	reg = SDW_SDCA_CTL(interrupt->function->desc->adr, interrupt->entity->id,
+			   interrupt->control->sel, 0);
+
+	ret = regmap_read(component->regmap, reg, &val);
+	if (ret < 0) {
+		dev_err(dev, "failed to read detected mode: %d\n", ret);
+		return IRQ_NONE;
+	}
+
+	switch (val) {
+	case SDCA_DETECTED_MODE_DETECTION_IN_PROGRESS:
+	case SDCA_DETECTED_MODE_JACK_UNKNOWN:
+		reg = SDW_SDCA_CTL(interrupt->function->desc->adr,
+				   interrupt->entity->id,
+				   SDCA_CTL_GE_SELECTED_MODE, 0);
+
+		/*
+		 * Selected mode is not normally marked as volatile register
+		 * (RW), but here force a read from the hardware. If the
+		 * detected mode is unknown we need to see what the device
+		 * selected as a "safe" option.
+		 */
+		regcache_drop_region(component->regmap, reg, reg);
+
+		ret = regmap_read(component->regmap, reg, &val);
+		if (ret) {
+			dev_err(dev, "failed to re-check selected mode: %d\n", ret);
+			return IRQ_NONE;
+		}
+		break;
+	default:
+		break;
+	}
+
+	dev_dbg(dev, "%s: %#x\n", interrupt->name, val);
+
+	ucontrol.value.enumerated.item[0] = snd_soc_enum_val_to_item(soc_enum, val);
+
+	down_write(rwsem);
+	ret = kctl->put(kctl, &ucontrol);
+	up_write(rwsem);
+	if (ret < 0) {
+		dev_err(dev, "failed to update selected mode: %d\n", ret);
+		return IRQ_NONE;
+	}
+
+	snd_ctl_notify(card->snd_card, SNDRV_CTL_EVENT_MASK_VALUE, &kctl->id);
+
+	return IRQ_HANDLED;
+}
+
 static int sdca_irq_request_locked(struct device *dev,
 				   struct sdca_interrupt_info *info,
 				   int sdca_irq, const char *name,
@@ -202,6 +341,7 @@ int sdca_irq_populate(struct sdca_function_data *function,
 			struct sdca_control *control = &entity->controls[j];
 			int irq = control->interrupt_position;
 			struct sdca_interrupt *interrupt;
+			irq_handler_t handler;
 			const char *name;
 			int ret;
 
@@ -226,8 +366,23 @@ int sdca_irq_populate(struct sdca_function_data *function,
 			if (ret)
 				return ret;
 
+			handler = base_handler;
+
+			switch (entity->type) {
+			case SDCA_ENTITY_TYPE_ENTITY_0:
+				if (control->sel == SDCA_CTL_ENTITY_0_FUNCTION_STATUS)
+					handler = function_status_handler;
+				break;
+			case SDCA_ENTITY_TYPE_GE:
+				if (control->sel == SDCA_CTL_GE_DETECTED_MODE)
+					handler = detected_mode_handler;
+				break;
+			default:
+				break;
+			}
+
 			ret = sdca_irq_request_locked(dev, info, irq, interrupt->name,
-						      base_handler, interrupt);
+						      handler, interrupt);
 			if (ret) {
 				dev_err(dev, "failed to request irq %s: %d\n",
 					name, ret);
-- 
2.39.5

