Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA0DA36CE12
	for <linux-sound@vger.kernel.org>; Fri,  5 Sep 2025 14:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757082724; cv=fail; b=mLjOvduD9pj1BE6Zg+5fZ+s3WM2fxE8lLdKp6dBXo1nw/Bi7uibSjz9MynaF/zDkxjM77qSvXWQMuhCKsOuTne3GaevOb9w7507b2ETvEZuxOKZ05gHTT6ucXTYn7lmnBkrWdK19Isr6QTvmFUKp4+7HiO9zX/azWLz24UfyOTk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757082724; c=relaxed/simple;
	bh=TW7jGZT/8NAA80z31W7k8Tf3WfwK6d08eDIUMUN+/0o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D3s1ueUbBQXaduYOaZls71+AWzz0KB80NTzvm9aqh8+gl80ynVLvHj/SCnHJPYXt0jQtB9M7fj/YJcUA3Z5jCPwalotcg0N0FnULqYBPr8w8o7uGoYT10H8FtlYCMkcD2GxyO9HO/PXOMhyYiWr0NEvpF4izvAEsALt97WJqo+k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=URutkdjh; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=vsjIsZpI; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="URutkdjh";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="vsjIsZpI"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58550DJp1324090;
	Fri, 5 Sep 2025 09:31:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=yZDnaWjRcNsd8s/fESIXcPTScCIYGzM1wKlYvm9Gjww=; b=
	URutkdjhRqsE5rZFjyUgZOOkCdJ76+5IOpSFrUBP9HAjjTKy3HKKVJeff++I0nkm
	pwc18TIzo6LJORwWb01GCHFjEzGd+1MOpZYLhWqWZ/YWfdcf5PHdc0oGrJxg8upI
	/0rgafklBUj2PttGcUqbcTWSoj9qCBiqRLc3DusSkFzl/CRk9QOOud+0GsU9PFuC
	oDMvLPGNWZz+A0wu6WyJ7x9H1mskNNdtR0a8KJagBoiI0aDufVy9ojsuXyq16HVl
	zzTdohqu3hZeVuU7rvYhafb6b0tutSHmgnUPXp05FgZisIZJWv2yN4DtjSknaePZ
	SS2oqdbEfiFhYmNsjFmGdw==
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11hn2245.outbound.protection.outlook.com [52.100.172.245])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 48vensfsvx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 05 Sep 2025 09:31:41 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SKr8thy7jPPLvpKuL6Pim2wUrptba9upJGLn/Qbt3fxyk32IdwqhTSDH98s0CoT6cK6Dh7AVJ2nLG21mDk8FsL6sOxG31yuwPmK9E6uMI/42fCFzYuk0JKk5yQPhAULrvZRLsv9CujwPNTJNvTv4T6+69aiyxXcQj1mnvXvTE4lS4/EncH4vEPuU9WK072h2dh+r8drqTkz2MDCg7dgQ1XYKnNvaIeMjdrAw7SBIRIE4R7D4IDaog52UpNbyHnk/usPV5LEews9jCvCn025Bn3h2jixX20sEOgt1mGlQr9mvih+5wajvZTBeKrphSPlrKtYv3WMwTZt/YpwI9PenDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yZDnaWjRcNsd8s/fESIXcPTScCIYGzM1wKlYvm9Gjww=;
 b=tTq6lovdGiduErG47TTBYbvpA6o5mBcsLKjUfD5hoE0cVk/xQro6VwRS1k9MjuKfdEJQGYOr0OoY+0jQPomWule1BkS55u2fQghALAxCMx3/+u4qyIzwl0UmTxjTPg4Qmo/bkAT8J2OeSQHv3YfRw2N3m0Zaf26o1In5FWetoVIj9Et7YoRRnV4SIddWepgyMTimOyCvRcVnR1E2xQp8draWU3dIFCwd1FVS10pH1AFxPpdmLw8bnNrvvDqOeBlpuZFosRNH6SsPGTVmWH6FmczWHVZWS6tos3/vEEoEfw3b364l8YQhwDRdiJszQTUwepcMCksOniiS2QaqMc0vFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yZDnaWjRcNsd8s/fESIXcPTScCIYGzM1wKlYvm9Gjww=;
 b=vsjIsZpIwJjCL9Y2kK0FUF80yu0lNwC7S3zKZ5tL4AINSNfHsc9orALy4omgalXrK+QDUXiNkgnQGxQbmyvSKLkhkluOX6VDtyiPsAs8H7pNJ71digxRvjg6I6E6kRoK2dPJ1nD5CO0nCxmT0ctOJzQ8N5aqWrtz6gEAJZuBiXo=
Received: from MN2PR14CA0010.namprd14.prod.outlook.com (2603:10b6:208:23e::15)
 by BY5PR19MB4034.namprd19.prod.outlook.com (2603:10b6:a03:22b::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Fri, 5 Sep
 2025 14:31:34 +0000
Received: from BN3PEPF0000B072.namprd04.prod.outlook.com
 (2603:10b6:208:23e:cafe::fe) by MN2PR14CA0010.outlook.office365.com
 (2603:10b6:208:23e::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.27 via Frontend Transport; Fri,
 5 Sep 2025 14:31:33 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN3PEPF0000B072.mail.protection.outlook.com (10.167.243.117) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.14
 via Frontend Transport; Fri, 5 Sep 2025 14:31:33 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 10180406563;
	Fri,  5 Sep 2025 14:31:28 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id F362B820247;
	Fri,  5 Sep 2025 14:31:27 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: rafael@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 14/15] ASoC: SDCA: Add early IRQ handling
Date: Fri,  5 Sep 2025 15:31:22 +0100
Message-ID: <20250905143123.3038716-15-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250905143123.3038716-1-ckeepax@opensource.cirrus.com>
References: <20250905143123.3038716-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B072:EE_|BY5PR19MB4034:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 11d7725f-7720-415b-a067-08ddec88e999
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|34020700016|36860700013|61400799027|12100799063;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iuQ0jgYL3hVwmu+OGlR31vFHmcS1jd1HojxnquFQy6xOs3h2PJ2dGT/AXO60?=
 =?us-ascii?Q?Vqk8pmAp1zx3PoIw2LjmAfpYVn/hPoA+LlHDzI47ZAnZ80HzK/8F7ai8bdWK?=
 =?us-ascii?Q?WFglHL/Vk4cHG5kaJhGxS9TKHsEneWgSigfH3P/DKc+UpI7uOQjRwBbdBR4J?=
 =?us-ascii?Q?mv4xDo/4vVZzOoVQJbfTh5H0e9I4KtP0HRWmAk+qpK9sduN8axg+2NaAoaJi?=
 =?us-ascii?Q?KS4ZwqsZcx/0cyjPG4bmTP240ZAoCChEGNigsMnoJGZwgxqiGHWzOQHROGZE?=
 =?us-ascii?Q?MVJ3TZnbs0TAsA7yHnJHraoHk3HDdVN/LHLOKw8FUzKqa/J/C5qNHJ2V9+pC?=
 =?us-ascii?Q?aMiABojciB4ZGzQxn8O8A9avKZPqYQyWsdmZrSVzgcaJrDWFcrLFrMbZmM84?=
 =?us-ascii?Q?56QSJSA6zFSE7NoyxGlPJSVuibrSi8IugwBnvTSwyiQLag1BNwL+aSgZDLcz?=
 =?us-ascii?Q?1fHoMTkR1HnuWvlHdZHf40IcCOrLpbeLE4nHy7pF/ex1cNAEQ1lCpItqqQnR?=
 =?us-ascii?Q?T5/v8M2c0JiwmCAgYKFsioocjzy//JftTIsu4G6WR+L3zjSkakUxqBPhjrdj?=
 =?us-ascii?Q?T9WbtIY7BZb5cTZKduLEHxPyrLs85TS6+08wor+nZGN85PGMGa8Pw1abrYN+?=
 =?us-ascii?Q?bbG7Zi7Cstkv7E4L+Alqe2G53yupXXAuetWHJGaN/OjyFeiSTT3vocV2FY9I?=
 =?us-ascii?Q?6e1sq1Am7UZelzPWsEiJj5rq2ZPkyAigcH0U1HjpW+l0lgLTp1wP+LMSarkP?=
 =?us-ascii?Q?CVUYqN8h7mP8LmpGNIoPlCnrrzQ/dkgd/8kbUg4x3rMjlWLYjb8eu6Dh6vb3?=
 =?us-ascii?Q?3IO9csVUTPP6YWrXDgKNNcxJqHFEhiISSNCae/tHlB9ghtMylOST78fV8oE5?=
 =?us-ascii?Q?vLNK6qzRax0/eDfacgqCwQGc5JLIxuiDpSOnviXunf+XCqaRtREYuIJwSGFZ?=
 =?us-ascii?Q?XQ9cRGiA4UhaZEvd99TuewL9oXKmyrClWa4TjcPitOyfD5u/kn2tJLrMoqqJ?=
 =?us-ascii?Q?lBZHhys+t0PwSCdHioqDWBrtuG9TWwkSayoDt6s4PbSG7RPEKqOuU/xE8dOY?=
 =?us-ascii?Q?Fbg9084K2BIKYAqgI3yYgSy8JctvKhhE50y3OwQo3+aRvOayXWM5Kx9Ft7WN?=
 =?us-ascii?Q?RiqpCeh+AOJ+xYBv5eZJeVbZIStrilbQ/kQiNewuBeN0ZDLhkE4Qfuo78E1Z?=
 =?us-ascii?Q?j3Z1CCicrjh6h1UmuaQY5Hq+kbeiAOZiCILD35WUMBInU5z1iiNx1VvI2HFa?=
 =?us-ascii?Q?I03roH2Y5LWKQLV1Bc+1MuFGl16ebi0yvt4hEJ57iSnjSC9Gr25eV+luuNG0?=
 =?us-ascii?Q?iscU7+FEoRcvhyMP5uW5PirzDJfW44cofLUFqdpntXM4aldwfkANfDVfnFWs?=
 =?us-ascii?Q?f7Ka6PZ4LAX55faM3cwW8JmJ4erjTNmFuDK3OiFCI5HTAToTWEylSakETZtp?=
 =?us-ascii?Q?PokGfglLVqQUeN2t7wXHnQpLZF1Ryq0nGw0a31Q4+lyNP1RrEixTsnT6g4yq?=
 =?us-ascii?Q?+5GpAd8hiSpUiM7vgZiKyvqUME5ebd4SJs4M?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(34020700016)(36860700013)(61400799027)(12100799063);DIR:OUT;SFP:1501;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2025 14:31:33.3195
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 11d7725f-7720-415b-a067-08ddec88e999
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN3PEPF0000B072.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR19MB4034
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA1MDE0MiBTYWx0ZWRfX2FLcW3OrwXM2
 sSmiO+agSSWKa0pTGXsYQ55byI/SOoEl5/tP43xjQGncwVLWrH4Jvz710hPvg0IYxf3JmsGpRbX
 W8x+XvclxUCBXz5Zgxk80Z2UxM4CMd3jwcZzEyrA3Of+TukmFZrAseQ7o1C7G8tcKSvq6bqM10W
 9pA8kqUnct4UQpLa0nhj3hyce9daXXUGXfdbdxWqrwW+CIXWtMJaeJ7PeatHD54uiB8fAdMEfEY
 HiKHLy3hgNCGD+3GDBf2rKHZdeSHHBPUaUbjJ+y6rU/k8tpzq9rOq9BNX6EGeSAsHrcHMog+l5X
 Kl0Gufc5B70aXAnGZZaFt2Bi4tFfiTrcRAsxcdfxtEysMFLY/7g4JJ5chwUWb0=
X-Authority-Analysis: v=2.4 cv=BY/Y0qt2 c=1 sm=1 tr=0 ts=68baf44d cx=c_pps
 a=eOh0UBsq4qXvgX0MRtdEHQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8
 a=QVwGPAhPMYaFeXMKfhcA:9 a=jZz-an6Pvt0H8_Yc_ROU:22
X-Proofpoint-GUID: 4Az8V5XYFi9FPteQYAa42Iunno478eOO
X-Proofpoint-ORIG-GUID: 4Az8V5XYFi9FPteQYAa42Iunno478eOO
X-Proofpoint-Spam-Reason: safe

Some IRQs (FDL) require processing before the primary soundcard is
brought up, as the downloaded files could be firmware required for
operation of the audio functions of the device. Add a new helper
function which registers the required IRQs.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 include/sound/sdca_interrupts.h  |  3 ++
 sound/soc/sdca/sdca_interrupts.c | 71 ++++++++++++++++++++++++++++++++
 2 files changed, 74 insertions(+)

diff --git a/include/sound/sdca_interrupts.h b/include/sound/sdca_interrupts.h
index 4c347fdce1658..d2843f88d783d 100644
--- a/include/sound/sdca_interrupts.h
+++ b/include/sound/sdca_interrupts.h
@@ -75,6 +75,9 @@ int sdca_irq_data_populate(struct device *dev, struct regmap *function_regmap,
 			   struct sdca_entity *entity,
 			   struct sdca_control *control,
 			   struct sdca_interrupt *interrupt);
+int sdca_irq_populate_early(struct device *dev, struct regmap *function_regmap,
+			    struct sdca_function_data *function,
+			    struct sdca_interrupt_info *info);
 int sdca_irq_populate(struct sdca_function_data *function,
 		      struct snd_soc_component *component,
 		      struct sdca_interrupt_info *info);
diff --git a/sound/soc/sdca/sdca_interrupts.c b/sound/soc/sdca/sdca_interrupts.c
index c199b5a4f0d2e..ed2a06a1b719f 100644
--- a/sound/soc/sdca/sdca_interrupts.c
+++ b/sound/soc/sdca/sdca_interrupts.c
@@ -396,6 +396,77 @@ static struct sdca_interrupt *get_interrupt_data(struct device *dev, int irq,
 	return &info->irqs[irq];
 }
 
+/**
+ * sdca_irq_populate_early - process pre-audio card IRQ registrations
+ * @dev: Device pointer for SDCA Function.
+ * @regmap: Regmap pointer for the SDCA Function.
+ * @function: Pointer to the SDCA Function.
+ * @info: Pointer to the SDCA interrupt info for this device.
+ *
+ * This is intended to be used as part of the Function boot process. It
+ * can be called before the soundcard is registered (ie. doesn't depend
+ * on component) and will register the FDL interrupts.
+ *
+ * Return: Zero on success, and a negative error code on failure.
+ */
+int sdca_irq_populate_early(struct device *dev, struct regmap *regmap,
+			    struct sdca_function_data *function,
+			    struct sdca_interrupt_info *info)
+{
+	int i, j;
+
+	guard(mutex)(&info->irq_lock);
+
+	for (i = 0; i < function->num_entities; i++) {
+		struct sdca_entity *entity = &function->entities[i];
+
+		for (j = 0; j < entity->num_controls; j++) {
+			struct sdca_control *control = &entity->controls[j];
+			int irq = control->interrupt_position;
+			struct sdca_interrupt *interrupt;
+			int ret;
+
+			interrupt = get_interrupt_data(dev, irq, info);
+			if (IS_ERR(interrupt))
+				return PTR_ERR(interrupt);
+			else if (!interrupt)
+				continue;
+
+			switch (entity->type) {
+			case SDCA_ENTITY_TYPE_XU:
+				if (control->sel != SDCA_CTL_XU_FDL_CURRENTOWNER)
+					break;
+
+				ret = sdca_irq_data_populate(dev, regmap, NULL,
+							     function, entity,
+							     control, interrupt);
+				if (ret)
+					return ret;
+
+				ret = sdca_fdl_alloc_state(interrupt);
+				if (ret)
+					return ret;
+
+				ret = sdca_irq_request_locked(dev, info, irq,
+							      interrupt->name,
+							      fdl_owner_handler,
+							      interrupt);
+				if (ret) {
+					dev_err(dev, "failed to request irq %s: %d\n",
+						interrupt->name, ret);
+					return ret;
+				}
+				break;
+			default:
+				break;
+			}
+		}
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(sdca_irq_populate_early, "SND_SOC_SDCA");
+
 /**
  * sdca_irq_populate - Request all the individual IRQs for an SDCA Function
  * @function: Pointer to the SDCA Function.
-- 
2.47.2

