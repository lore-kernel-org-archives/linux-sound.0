Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B252F6180
	for <linux-sound@vger.kernel.org>; Thu, 25 Sep 2025 10:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758797664; cv=fail; b=DKT06NaA6m3O9XjRxYfBQmXdOpW4IbW7DeTH/v02hxbBZPrR4yHccyVh08Wao/dHzvN5tC6jFvEWhCFlSAm0+OqbvHAgjcuuXsahk1qJGsS/Fvutnve3NSnNUo+Z0dPBalhrefsGEmaONk4S+K90SsC0QN8UZfjoiIk925xKEZQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758797664; c=relaxed/simple;
	bh=u+aQx3Q6eYEXODKXZ8Dkqxbsi7ObceKw7h2sc7OQiv0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g/DPLu3bDzWBRtNtsqFiArGpKrb6Cg4UDsPUBtp/2nh13KYccQ2ZjHveq9gQf2Kcj03Hc7Y06uBS4re3R9o4FmNfGGlLk2UVlQh/FJvIEj8DxAXsZi+Ax2JTlbt0lLedR51kvLeWIkLJguX1kYEj11E+ahd/sxdO68dIqapoouQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=j8mpaVeq; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=X7FHLVbG; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="j8mpaVeq";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="X7FHLVbG"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58P4PF6j2026617;
	Thu, 25 Sep 2025 05:53:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=qa4I7/eCwbr+SWnVE5cuyOaddKDSntMa4a3pSPoTaMI=; b=
	j8mpaVeqOoHhZXkNrfKVAXioHzPowfbu/PKK2Ck3kZC+dkgdS6bcSPfbyilKil3v
	0w3u2mZ7m0VU+CzI7MQpZE9c9XO4t76p4+7/jfrTv/UNNsakb6tj29ngjjVZrlKv
	k1acS5VqHjZ2BB3HMJhr2uxa/6QCPzEbfWL2KjxFVYUc6uTAy9rQSQcFXeBa/zNg
	Y+WNyUC3BdMM6cB4IPWRy8IJFaM+d3OXGtCEm6X5qdyQPwhADuhRDwUxhgOI4ZY+
	ePHV5ilsYnzUAB9yAi2PdzJEadsQWbzPiUEQMzz6uFSdRFGzKw+TvHDivliADvxL
	6bTWUcZojmzucoJmEylzJw==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11021102.outbound.protection.outlook.com [52.101.52.102])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 49cvharf6g-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 25 Sep 2025 05:53:56 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bi+udidstYh8mIksEJO+V6wtnYeg139ixvU+MpB9Zmt8uIRh99yz/6rNHMCxMYIgbCihK7jPktZyinFS4+Qqb3QNUwJ3uUqjIVC2i4ZzBYTR7Fx/gDGjN8f+NKcM1vPvH735ZI1XKchWPfBb+3TSdHwb1s3dzWqWbr+ZjY+BOAd6PBzKWcCjapz4EZd6MqJHBIVlfC3l3eAqz4ordgcIGV7PK98A3YMTofsZ02OHXuXnrsTSs1PwTqyuN6mV/SSr2n6HKvAdxuSRqw4M62APHHz8mA1rMOmBV4Pk5Em7fyHoLAOXa+LIVmxnvmcXaBVWLKRGoiHp5Kp7G2oxYmEKwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qa4I7/eCwbr+SWnVE5cuyOaddKDSntMa4a3pSPoTaMI=;
 b=x8SWsW8brz42+GKhIxKELD/Jk2OyLK9oB2ddXNK7kgokX0L0laRoAvoKzHZT4Y/sWWxxj2Rpq5CWOReqEos6Km/1n0wjMA0EAOsSmH9xWwKSZQ7iE4JdFrrdvDbf42xRFh7ZIzQYp3dnEjUkqPScws8HKSQwtsK9BcgtE37H+smN439CUx5HtC5TYp9ITtVcUPvg5qa9rSyn75I0udmEsx5L5Xfx6/aNd3Pmaw32ZP8Bcjkp1yAthlHZSXt7HJYyHLlcGyIvAZAElo1BlKHyKhafkCzeWFO91Eymfv7Odxw0MMSI/bmQlnwQZTXW9EXHAoBUFv2Ox4LWhnUvSC0HQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qa4I7/eCwbr+SWnVE5cuyOaddKDSntMa4a3pSPoTaMI=;
 b=X7FHLVbGVQCB99cIso+G9EJ4ojdfHy2J4sp+JR2d3GDq6A/cD6nk7DrA75sxXt2F7qWF9xqEaCWxSDlYyRuWHQsULJgX8V9jp8fOz/WOVhEaWERKWm4iq/MIr8uEY8hjYMHsl3BkB8v2h/abCUeghkmnuxR705nhyt11fo2Ys1k=
Received: from SN6PR04CA0091.namprd04.prod.outlook.com (2603:10b6:805:f2::32)
 by CYXPR19MB8333.namprd19.prod.outlook.com (2603:10b6:930:d8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Thu, 25 Sep
 2025 10:53:52 +0000
Received: from SN1PEPF0002BA51.namprd03.prod.outlook.com
 (2603:10b6:805:f2:cafe::1e) by SN6PR04CA0091.outlook.office365.com
 (2603:10b6:805:f2::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9160.10 via Frontend Transport; Thu,
 25 Sep 2025 10:53:50 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF0002BA51.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9160.9
 via Frontend Transport; Thu, 25 Sep 2025 10:53:50 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 3233C406559;
	Thu, 25 Sep 2025 10:53:46 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 203FE820249;
	Thu, 25 Sep 2025 10:53:46 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: rafael@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v3 05/19] ASoC: SDCA: Pass device register map from IRQ alloc to handlers
Date: Thu, 25 Sep 2025 11:53:27 +0100
Message-ID: <20250925105341.194178-6-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250925105341.194178-1-ckeepax@opensource.cirrus.com>
References: <20250925105341.194178-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA51:EE_|CYXPR19MB8333:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: f943157c-2be6-4b2a-b7ba-08ddfc21cf93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8lI7DQSxyJ4ZWHtMqqhQVmHiHrxNSbpMzjDmivd4dpBluD+KS4lnHHzCh47A?=
 =?us-ascii?Q?1dlhG42xiF4/OQzmFIEMpBbHq7OqCiQjlYYJFIL9eBChpTX97v5aOLvoTn4J?=
 =?us-ascii?Q?+vFoD9qn3f+s5TB8WnjrReL2bSdTeSFTGmARHpOgb3MAU7KMY14jK3xM2kJr?=
 =?us-ascii?Q?37l/6OQLQ31sYUHCIhPFx/uN+Sv9Mam6j1LKMzF5mUx4+7l5MfTUn9KIqDZn?=
 =?us-ascii?Q?2YEq4SrpO/ppTFt1uo1msWs+ejdqbCso16x3BryMlF0yWHLqm+wzeCZaMHMI?=
 =?us-ascii?Q?Yt3Wl/R383DMpH+nnzZC3x4k2/9Rd7OizJenG4+aJINydp4/z9Zr91Uc/ZFf?=
 =?us-ascii?Q?g2ZK7JWvFNwUxuIrvAuG8cqd86u/TfVPw9KKppIOUaS0ZBIFMHOqpjojerQg?=
 =?us-ascii?Q?83NdwY3yuivBvXy5J5ENLvFkgveivXVVEyZFZKT/cM73OGKYaiju/r8CyNvn?=
 =?us-ascii?Q?SZJ+q5/MFzoS1mJECm+u4UpzSs4ZC9A3aeg4C1boOs6xeLfqfG7REuh3OKYk?=
 =?us-ascii?Q?qv2JGkIylqJZ9htd3zKOAQe0jCNvCWQUfm4VvBblTDV2ucxQGYgsff5q/2JC?=
 =?us-ascii?Q?Wn/6oXHoRqP9C8dW/8YakdLYEnZtXiH/SUlzA1DN0e30j1KQ6YAw6bdcjwOr?=
 =?us-ascii?Q?2A+MaAojny+UParWc/FhmP3zVDkcTOi11RJjMxbCgnT1heph2lQzOuI09KCE?=
 =?us-ascii?Q?0oKtck991wx1vVCrA+H+7xtHoTmEnXg2Wq7PTbQLOZn67CXYVvoqOQPB66be?=
 =?us-ascii?Q?2UwaBrzBqzWYGfvogiiAM1WNgEXxcCqJjkE218BNcXNpDvp287jgI0nTl21v?=
 =?us-ascii?Q?avRJKO6CGQnu4taRJzgfXUbWh9JNn9aWFUojK9pHRFOGmmHIytVrltRTkOvo?=
 =?us-ascii?Q?rQ8DU1OU4gjCFD4aXQpgVlBcSJjHAozFyRS0144KDHouLgrSKGE3qcydPP3y?=
 =?us-ascii?Q?3g5boxiV7gdXf7bPB/ZCScPurK49dxtZeNOk/qUVWrblplXIPcrAuOZjO90i?=
 =?us-ascii?Q?FvcMjnVYqzFxjbx0irYnnpox2kafqB+T1xkbWkTUNUuidtRi3ctJJS0k29Dq?=
 =?us-ascii?Q?Vs+KzHjuaP230JJQokTCLSIOLG5WLEmV50QXO207EPf9LauJM5bgKHZ4nDqQ?=
 =?us-ascii?Q?3bIRV20OdlVKbPMyr1vXaSRXYba0IW5CnPnUifuFlTqGpYlf/UgSJ4SVeBku?=
 =?us-ascii?Q?vn2rQQHiXDWss6v775DB9Tq93Sd/SSROxtTS7jX+DtdRmHDGjV22FWUk095C?=
 =?us-ascii?Q?00YwTaaeM6DN/AHPCAdwaZqsMZESekYsmSrvb58wEGFyPGUKwZ3ba6+SYMkX?=
 =?us-ascii?Q?P8u8pHTF4BxJVa9PGMF25a7ZqQENZD5KPxdCRSkGdm7uwC2BkD4polAUqkOj?=
 =?us-ascii?Q?jbynogtf6/kAu8BFvoivdEdC4CQXVaNsz5dKtRYcXnawvLSxt4f1jQ7nUyXx?=
 =?us-ascii?Q?EORSb/hnBonuxnpYycGyPeKLHSqJgi0ZEkHNhL0Oc9sLTBv5jDWXj+CYjKZ3?=
 =?us-ascii?Q?R36XKEsc4LoIAsM+y0ZWXrBrcl9JNe9BRPyL06Gt7H3s6PfNdN/O47hm/J3B?=
 =?us-ascii?Q?AH+g1V4apvaHbkNVgQg=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2025 10:53:50.0444
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f943157c-2be6-4b2a-b7ba-08ddfc21cf93
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SN1PEPF0002BA51.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR19MB8333
X-Proofpoint-GUID: z9CZRz89p7SGoML5MDeNZYIqxbFHIAoE
X-Proofpoint-ORIG-GUID: z9CZRz89p7SGoML5MDeNZYIqxbFHIAoE
X-Authority-Analysis: v=2.4 cv=dL+mmPZb c=1 sm=1 tr=0 ts=68d51f44 cx=c_pps
 a=DtwdgGxVrw5JanCww5rNYw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=QyXUC8HyAAAA:8
 a=w1d2syhTAAAA:8 a=38gYyO_Oba7BUjtA73QA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDEwMiBTYWx0ZWRfXyngGO2FZCDkP
 FeuZb/ID7soyVgxSpiLsDlRx7DZ2GOgQg9lpOgq68zWSIMlnfRb6IY0GoJ6EitdMeMXUP84fOWZ
 TwJpQGYtHgTFosV5tMYY3glCLJihrjWR7I3/XPN8Y6o8PWDtOyHgIOElxOYJsZ1LxE151UBa1bw
 Wt+EJiJAoufYlm4YMEkaGEYhLHjQvcMJW2bJ+hyBYXwucxwm8FeMTFcs9g8qo4bPE0m/6m87nX1
 hdHCRXeSkJd73OB1oHGjuILqhI9mhOAWmoC7cpiYBU6GRFRnpDRezJkJIqu7OLErmKrUC3zdBe3
 oCoblJecCMluTcxSLBPLRMRu00vMVbKOVJLv3oFC1SsnTol3qiwzDqhmLSYzcA=
X-Proofpoint-Spam-Reason: safe

Store a copy of the device register map in the structure for the IRQ
handlers. This will allow the individual IRQ handlers access to the
device level register map if required.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v2.

 include/sound/sdca_interrupts.h  | 2 ++
 sound/soc/sdca/sdca_interrupts.c | 5 ++++-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/include/sound/sdca_interrupts.h b/include/sound/sdca_interrupts.h
index bbbc3ab27ebae..d652c6e94ddcb 100644
--- a/include/sound/sdca_interrupts.h
+++ b/include/sound/sdca_interrupts.h
@@ -23,6 +23,7 @@ struct sdca_function_data;
 /**
  * struct sdca_interrupt - contains information about a single SDCA interrupt
  * @name: The name of the interrupt.
+ * @device_regmap: Pointer to the IRQ regmap.
  * @component: Pointer to the ASoC component owns the interrupt.
  * @function: Pointer to the Function that the interrupt is associated with.
  * @entity: Pointer to the Entity that the interrupt is associated with.
@@ -35,6 +36,7 @@ struct sdca_function_data;
 struct sdca_interrupt {
 	const char *name;
 
+	struct regmap *device_regmap;
 	struct snd_soc_component *component;
 	struct sdca_function_data *function;
 	struct sdca_entity *entity;
diff --git a/sound/soc/sdca/sdca_interrupts.c b/sound/soc/sdca/sdca_interrupts.c
index 9295d283be910..898069ceffe93 100644
--- a/sound/soc/sdca/sdca_interrupts.c
+++ b/sound/soc/sdca/sdca_interrupts.c
@@ -437,7 +437,7 @@ struct sdca_interrupt_info *sdca_irq_allocate(struct device *sdev,
 					      struct regmap *regmap, int irq)
 {
 	struct sdca_interrupt_info *info;
-	int ret;
+	int ret, i;
 
 	info = devm_kzalloc(sdev, sizeof(*info), GFP_KERNEL);
 	if (!info)
@@ -445,6 +445,9 @@ struct sdca_interrupt_info *sdca_irq_allocate(struct device *sdev,
 
 	info->irq_chip = sdca_irq_chip;
 
+	for (i = 0; i < ARRAY_SIZE(info->irqs); i++)
+		info->irqs[i].device_regmap = regmap;
+
 	ret = devm_mutex_init(sdev, &info->irq_lock);
 	if (ret)
 		return ERR_PTR(ret);
-- 
2.47.3

