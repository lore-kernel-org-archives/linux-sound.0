Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC82A41
	for <linux-sound@vger.kernel.org>; Fri, 12 Sep 2025 10:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757673327; cv=fail; b=PCIAa7IaqsswCPnffAmHfzwwq6di0GhM6WaCFg5rTWYzYd/8qLLDTY1Qgl9tlutUrUlMlJ1YfvZ3hcdhq5kQkzuFLzKlS3knFwBMpyaJH+LgtKq2h5kTXPYcp9v/+OAYugQSj6FqctL4glYGB+TVZFk8hDeh49PdSyCZP4Gm2nE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757673327; c=relaxed/simple;
	bh=kYU+AMfboZ3yxbjyMtUAruZRUK66xnaacMRlurvuf70=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GfuMmp06PORZHWoCA8ORRzQ/tgkEuF4x4hrPMol9Jl+vvv8fgaMGgqyZcWXQG7tg5cwUn+ouP2UsOPZL40mZc5l8sELq1J4iiEg92s0mFwrVXr30L5+FnzUwS2rqobnoJRAIuWsOP8EOk9C/AsdKyyO9khWT6QKP6FTVizqDhk8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=S1z2ZkWo; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=fxjwqYSv; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="S1z2ZkWo";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="fxjwqYSv"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58C4oDtA1137784;
	Fri, 12 Sep 2025 05:35:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=wgJtT+SL2N5SaqiUMBhCYkuzDO8oHV2cXB/8l5QViGo=; b=
	S1z2ZkWoIn9MmXwKcn4OIRTRB9Hu+UagYBI28deXwuINMxbfJOnXoGtx5ckc1YHj
	xvL2IUdpt/VffGg2DMiF/YyGSD0vK+CaDkijAE/WvqUJAJJsISQTMkI61ai+IN8N
	GVHW7Pnd4U2fGP8pU6pIaq+5/rdlGrl3J3Dqws+OXvdDwY3FRcEdfgOq4sZHhRAM
	/xEoDzWDtSBuO0KtuwO07pxwjC+wTjHxdIj93HaonNun3/LpkGWicSR3vP4RxUfC
	xWyn8TiSHxv+aLKAQ+mk8Z2JGRJUX54o2Cmg+YeZFo5IyDv2qcVnJI5qDgg/2nOZ
	PwFowbKyDkcWcQx+CHMAsQ==
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12on2124.outbound.protection.outlook.com [40.107.243.124])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 492q6tcph6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 12 Sep 2025 05:35:16 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ydzc2lXcO4S30u+h4grDi+wocOXxn6ggIB0A/IjPNzfs62uCN1ilNCcph8BnXdzKHcWu8y/KSlS6XTmVp+kNReci/hsNihQeWy1CwBn10UfsU6d21taIuSr4pa4zZNlXIYWLG7kcjRqY6WlfI69FZKutg8W0ImfcyoFAx7kNTTowyiZrI5koab4jQBYfjaBJaC4KuAcJSr0C0gMRiEJCNj2DlAJq6cs9XppwF6s3O/uZ1G8HphonuXTTYjpqL0VrVcRP7/7xbyfg1uh5GCEkYreHLlgz0+pcqXTibULn+ZyU2hDihwpa2hQeJfxFJZXG5lKiTNcukB3eahC24YPmKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wgJtT+SL2N5SaqiUMBhCYkuzDO8oHV2cXB/8l5QViGo=;
 b=fi6gUs5c7JQ+heXBNT1LcruPolTLcCVd4AwMHVQ+0DaI+SouWhLPMSJTDdmTmSi2YS5igbdpgCEMajLlTep6ifAXOE6ceORRIA1H5JNlckvpSAMamLZrFMpjySB6n+VSIGQIQrL+sEX9V052Bq5KvZ+eWcGih025jNYr3VzCcY9t6lLOM4Horw9evamPaXuFySUzvgnc/DBWYj+In0zGsJHDCt5LxtvGMAr+FNO7MAC+Ii+zX6NqegiGIuDW8EKXONuQpd6PAXtu095YbZ6irH+nG8IDnU+tgU6T71P+76bCkJU3d/HKIL8wlTPBzF1K3FbuIvmQXX134TVwJlufnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wgJtT+SL2N5SaqiUMBhCYkuzDO8oHV2cXB/8l5QViGo=;
 b=fxjwqYSvBb+ldBQvJ1YMjnwYr5j+Hi1dsqCROowU7lLqrwQc9R4yc9ooL/nTK4m++i6YaLnuAg/wwEszrfyoujtVvLelVJsLerW9rkpf/sfKKAkJSsuJm2t/yAK/Rxy2Hb3GpvWQIiXs8UCccMc8V2PFd09nKqpc7LnY02oa6C0=
Received: from MW4PR02CA0010.namprd02.prod.outlook.com (2603:10b6:303:16d::8)
 by BL1PR19MB5868.namprd19.prod.outlook.com (2603:10b6:208:398::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Fri, 12 Sep
 2025 10:35:12 +0000
Received: from CY4PEPF0000E9D6.namprd05.prod.outlook.com
 (2603:10b6:303:16d:cafe::8e) by MW4PR02CA0010.outlook.office365.com
 (2603:10b6:303:16d::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.18 via Frontend Transport; Fri,
 12 Sep 2025 10:35:11 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY4PEPF0000E9D6.mail.protection.outlook.com (10.167.241.69) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.13
 via Frontend Transport; Fri, 12 Sep 2025 10:35:11 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 30D2C40655E;
	Fri, 12 Sep 2025 10:35:08 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 0EE4A82254D;
	Fri, 12 Sep 2025 10:35:08 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: rafael@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v2 08/19] ASoC: SDCA: Rely less on the ASoC component in IRQ handling
Date: Fri, 12 Sep 2025 11:34:53 +0100
Message-ID: <20250912103504.2679226-9-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250912103504.2679226-1-ckeepax@opensource.cirrus.com>
References: <20250912103504.2679226-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D6:EE_|BL1PR19MB5868:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 8105fcfb-8e4c-4ad7-7eb8-08ddf1e80d8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|61400799027|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cEqJntRl/YEU1Xy+HvBA4xB5DcKAGzWtZnLM4lz9Qv212tN3SUXo8E6eMTpA?=
 =?us-ascii?Q?T5qNDkhCIbJcxYMzEWlnTeou+Ie0ayYr8SNYYJEMUu5MngNio3NJbiKs6rjW?=
 =?us-ascii?Q?BEQYy9yVCu30FfuW+PqlR/PQ+UI1O4aI0SULgfgrNCxDTFhtu+1SFm+e4mIN?=
 =?us-ascii?Q?gRBq9vk2J8JNQiBc3L6utKzddgP2J50Pbe9zIRP+ifb52olRr8rt6Z2sNtUH?=
 =?us-ascii?Q?zT9uHjgQTnS6bOVJqyLJ3bq/0r9yGaQwXcB27FMvwgqqGjeJFTIE7P1UvKci?=
 =?us-ascii?Q?I36VTcvIHGZI+Y+6d5Q05uwR6eVNvrLsogCWhO7gLjG+PQNCkxtvOgpNc3Ri?=
 =?us-ascii?Q?/1TlgslBvc7Kn1BLmXCHwmBAGL0SimduszSeevxy0cucIpFfu7wqhqnIh1TL?=
 =?us-ascii?Q?3uYzsX6NRdaNZNn1kQq2tgASC5oCqR4RdhaX3sSaewkFktsLAt0Iopueq/3C?=
 =?us-ascii?Q?vXg+/Xog+jUqIIvkCSF4JlT6FuKwxcSmne/0+tKDcxQo5zGfk5TtlPtV0MVC?=
 =?us-ascii?Q?IHLyNeuYHp0+s4ils1VTku3L7xBqOs+IEWFNhpgTzaOJFU5ZZ2uGm9mcG0nb?=
 =?us-ascii?Q?nf/dMM+z4RevqF1QKXQSpssHsDbfqHfPw6MixvssSxSZiZM+BPI6YOT8nPKv?=
 =?us-ascii?Q?WI2sYTde1HqEtvlNS6e+c0BWNTIJef9AXuZu1KUZeVmFOUHSb5IANscwkhMV?=
 =?us-ascii?Q?2vdDVUsH4Qh0BD8yOstIF4uSmDQM7KkBTSavs/dR4I5dhbz9XNIQJ3t8NN5g?=
 =?us-ascii?Q?BYFKY4T/KNToIPkVjqmCk7vVhu7tZ6tijcD+yJ3VSHEMVVT8oB0fjbndgu0L?=
 =?us-ascii?Q?nmv18AzYk8xMHrEJ1o0JCSez5gcmYf1N2ISZg+eO/365Di7OgVMt+LR/PrNn?=
 =?us-ascii?Q?8h5Zp/fNIkMTpJ7TeoDjjODyIhe+BWnOccDrKB55aJ43aCN5+WQh7trNeQmq?=
 =?us-ascii?Q?svQOGdGLxRkaUZrRZHhQMobFo9EKP1zwrww0Za3exZ74FVxb63qJiaT4bPz/?=
 =?us-ascii?Q?xUwuPQRuGfro5ANBrhZ7gC49SygmglL7Pn4Xce+d+mMkHCiFeM99mC3f7uiR?=
 =?us-ascii?Q?4Kgc9xgYkX3tHeOTnkXK4PkmTrMAyFc+xYbU/Dd9qfKO98NyEMVGltSIBOys?=
 =?us-ascii?Q?wvQ6dEpH9RfHL7vLwminP1qGTtzwhck/xejVQkctE99qKYuT2H564NZT4eio?=
 =?us-ascii?Q?AoGrgKoezzlQnkZlXwlc4NQrpYAsXBkGfMiV9iOtFD14D52mFgc3JsUFBVSt?=
 =?us-ascii?Q?ST3KAnBY+lnwfOVNDXw9JfJpvR0R3PbqHSaHLvtHOWfMnd6JHFBS/2PNw622?=
 =?us-ascii?Q?hQBFDhed+KorE3JF9BVkko3U7SM5YNc7DEGuKwpgRna9duYbmi64Uy6Ijq6L?=
 =?us-ascii?Q?kuci2Su8uj6vs/dP6x1NzEqvkJV01IzSm3t0SQRV3NJWcd7JEiSq3kIA7+Ms?=
 =?us-ascii?Q?DU178b4bN2RRQjOJHXuTmwpgeRIECcdILpnRNSLDOAheyPqCsdbD3rzDq0w3?=
 =?us-ascii?Q?fqCsvvgMGVoRXME0BoV+RW+CbC1qMJXOUHtJ?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(376014)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2025 10:35:11.5387
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8105fcfb-8e4c-4ad7-7eb8-08ddf1e80d8a
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY4PEPF0000E9D6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR19MB5868
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEyMDA5OSBTYWx0ZWRfX41vF5kGhXwFR
 XYk1zY8XZb9mAO79LZTj73NfKcVo7wRGpBhjlAKqxwoqfv/ac5pqs1QsSaVp74HbEsxwwoIGCWF
 4spHGcdCRx+r3eVefzcbTewoXo0C89D5/r3ZQ1SPnRoLkXJNGbXIKTzyBZUNjKa82GeY/eCwigz
 +5vzbTRAh7ouau+MetcKOfwtWjUNkEvgVINU9jtpQrYkUAnIwXeM0MzPz6JdLRbR0oAM45yc3Qk
 0dTIWeKTNe4RsAk8qFYUa/+8BIrci7Ta6+a9m3dzkuudMuRFx8XqFHCE8JM2DstX0Kgu/Th2sBn
 AEsw0NZ99/Mm2w0f4/qbJVEEh3eKyBWdoyjEUI7kimzaRTGH1SYbM90+9lUeiI=
X-Proofpoint-GUID: KLnJpnZlxx4E_jeKEwBRgHvuMydkWW00
X-Authority-Analysis: v=2.4 cv=X71SKHTe c=1 sm=1 tr=0 ts=68c3f764 cx=c_pps
 a=IZO86lbbsIDzssvVtBV1Qg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8
 a=GWureWihaficcvGYEkcA:9
X-Proofpoint-ORIG-GUID: KLnJpnZlxx4E_jeKEwBRgHvuMydkWW00
X-Proofpoint-Spam-Reason: safe

In the future some IRQs (mostly the UMPs used during File
DownLoad) will need to run after the device has enumerated on the
bus but before the soundcard is actually constructed. As such
refactor more of the IRQ handling to use raw device and regmap
pointers, rather than accessing things through the component.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v1.

 include/sound/sdca_interrupts.h  |  7 +++++-
 sound/soc/sdca/sdca_interrupts.c | 37 +++++++++++++++++++++-----------
 2 files changed, 31 insertions(+), 13 deletions(-)

diff --git a/include/sound/sdca_interrupts.h b/include/sound/sdca_interrupts.h
index e2c1337d24e0..4c347fdce165 100644
--- a/include/sound/sdca_interrupts.h
+++ b/include/sound/sdca_interrupts.h
@@ -23,7 +23,9 @@ struct sdca_function_data;
 /**
  * struct sdca_interrupt - contains information about a single SDCA interrupt
  * @name: The name of the interrupt.
+ * @dev: Pointer to the Function device.
  * @device_regmap: Pointer to the IRQ regmap.
+ * @function_regmap: Pointer to the SDCA Function regmap.
  * @component: Pointer to the ASoC component owns the interrupt.
  * @function: Pointer to the Function that the interrupt is associated with.
  * @entity: Pointer to the Entity that the interrupt is associated with.
@@ -35,7 +37,9 @@ struct sdca_function_data;
 struct sdca_interrupt {
 	const char *name;
 
+	struct device *dev;
 	struct regmap *device_regmap;
+	struct regmap *function_regmap;
 	struct snd_soc_component *component;
 	struct sdca_function_data *function;
 	struct sdca_entity *entity;
@@ -65,7 +69,8 @@ struct sdca_interrupt_info {
 int sdca_irq_request(struct device *dev, struct sdca_interrupt_info *interrupt_info,
 		     int sdca_irq, const char *name, irq_handler_t handler,
 		     void *data);
-int sdca_irq_data_populate(struct snd_soc_component *component,
+int sdca_irq_data_populate(struct device *dev, struct regmap *function_regmap,
+			   struct snd_soc_component *component,
 			   struct sdca_function_data *function,
 			   struct sdca_entity *entity,
 			   struct sdca_control *control,
diff --git a/sound/soc/sdca/sdca_interrupts.c b/sound/soc/sdca/sdca_interrupts.c
index 9d24a75092e5..afb3a9476332 100644
--- a/sound/soc/sdca/sdca_interrupts.c
+++ b/sound/soc/sdca/sdca_interrupts.c
@@ -77,7 +77,7 @@ static const struct regmap_irq_chip sdca_irq_chip = {
 static irqreturn_t base_handler(int irq, void *data)
 {
 	struct sdca_interrupt *interrupt = data;
-	struct device *dev = interrupt->component->dev;
+	struct device *dev = interrupt->dev;
 
 	dev_info(dev, "%s irq without full handling\n", interrupt->name);
 
@@ -87,7 +87,7 @@ static irqreturn_t base_handler(int irq, void *data)
 static irqreturn_t function_status_handler(int irq, void *data)
 {
 	struct sdca_interrupt *interrupt = data;
-	struct device *dev = interrupt->component->dev;
+	struct device *dev = interrupt->dev;
 	irqreturn_t irqret = IRQ_NONE;
 	unsigned int reg, val;
 	unsigned long status;
@@ -103,7 +103,7 @@ static irqreturn_t function_status_handler(int irq, void *data)
 	reg = SDW_SDCA_CTL(interrupt->function->desc->adr, interrupt->entity->id,
 			   interrupt->control->sel, 0);
 
-	ret = regmap_read(interrupt->component->regmap, reg, &val);
+	ret = regmap_read(interrupt->function_regmap, reg, &val);
 	if (ret < 0) {
 		dev_err(dev, "failed to read function status: %d\n", ret);
 		goto error;
@@ -136,7 +136,7 @@ static irqreturn_t function_status_handler(int irq, void *data)
 		}
 	}
 
-	ret = regmap_write(interrupt->component->regmap, reg, val);
+	ret = regmap_write(interrupt->function_regmap, reg, val);
 	if (ret < 0) {
 		dev_err(dev, "failed to clear function status: %d\n", ret);
 		goto error;
@@ -151,8 +151,8 @@ static irqreturn_t function_status_handler(int irq, void *data)
 static irqreturn_t detected_mode_handler(int irq, void *data)
 {
 	struct sdca_interrupt *interrupt = data;
+	struct device *dev = interrupt->dev;
 	struct snd_soc_component *component = interrupt->component;
-	struct device *dev = component->dev;
 	struct snd_soc_card *card = component->card;
 	struct rw_semaphore *rwsem = &card->snd_card->controls_rwsem;
 	struct snd_kcontrol *kctl = interrupt->priv;
@@ -190,7 +190,7 @@ static irqreturn_t detected_mode_handler(int irq, void *data)
 	reg = SDW_SDCA_CTL(interrupt->function->desc->adr, interrupt->entity->id,
 			   interrupt->control->sel, 0);
 
-	ret = regmap_read(component->regmap, reg, &val);
+	ret = regmap_read(interrupt->function_regmap, reg, &val);
 	if (ret < 0) {
 		dev_err(dev, "failed to read detected mode: %d\n", ret);
 		goto error;
@@ -209,9 +209,9 @@ static irqreturn_t detected_mode_handler(int irq, void *data)
 		 * detected mode is unknown we need to see what the device
 		 * selected as a "safe" option.
 		 */
-		regcache_drop_region(component->regmap, reg, reg);
+		regcache_drop_region(interrupt->function_regmap, reg, reg);
 
-		ret = regmap_read(component->regmap, reg, &val);
+		ret = regmap_read(interrupt->function_regmap, reg, &val);
 		if (ret) {
 			dev_err(dev, "failed to re-check selected mode: %d\n", ret);
 			goto error;
@@ -309,6 +309,8 @@ EXPORT_SYMBOL_NS_GPL(sdca_irq_request, "SND_SOC_SDCA");
 
 /**
  * sdca_irq_data_populate - Populate common interrupt data
+ * @dev: Pointer to the Function device.
+ * @regmap: Pointer to the Function regmap.
  * @component: Pointer to the ASoC component for the Function.
  * @function: Pointer to the SDCA Function.
  * @entity: Pointer to the SDCA Entity.
@@ -317,21 +319,31 @@ EXPORT_SYMBOL_NS_GPL(sdca_irq_request, "SND_SOC_SDCA");
  *
  * Return: Zero on success, and a negative error code on failure.
  */
-int sdca_irq_data_populate(struct snd_soc_component *component,
+int sdca_irq_data_populate(struct device *dev, struct regmap *regmap,
+			   struct snd_soc_component *component,
 			   struct sdca_function_data *function,
 			   struct sdca_entity *entity,
 			   struct sdca_control *control,
 			   struct sdca_interrupt *interrupt)
 {
-	struct device *dev = component->dev;
 	const char *name;
 
+	if (!dev && component)
+		dev = component->dev;
+	if (!dev)
+		return -ENODEV;
+
 	name = devm_kasprintf(dev, GFP_KERNEL, "%s %s %s", function->desc->name,
 			      entity->label, control->label);
 	if (!name)
 		return -ENOMEM;
 
 	interrupt->name = name;
+	interrupt->dev = dev;
+	if (!regmap && component)
+		interrupt->function_regmap = component->regmap;
+	else
+		interrupt->function_regmap = regmap;
 	interrupt->component = component;
 	interrupt->function = function;
 	interrupt->entity = entity;
@@ -394,8 +406,9 @@ int sdca_irq_populate(struct sdca_function_data *function,
 			else if (!interrupt)
 				continue;
 
-			ret = sdca_irq_data_populate(component, function, entity,
-						     control, interrupt);
+			ret = sdca_irq_data_populate(dev, NULL, component,
+						     function, entity, control,
+						     interrupt);
 			if (ret)
 				return ret;
 
-- 
2.47.3

