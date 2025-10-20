Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEE342773CA
	for <linux-sound@vger.kernel.org>; Mon, 20 Oct 2025 15:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760975755; cv=fail; b=iMHbUnf16pTbyp7NFpuWm4Tc/CeOzMM4IczdVG/dO3i1vWebO1IWJ+sHmgCylqv+TNUQdLqjt3y/Dg/3NgxQP2eVTLsXKTeaDguqtmqvgjWLOFX4OxiNU3pX9I7ODMobW5XzAYJwUoDhhbJWt4I4bl2sUltxkoAHEfzZRmSRcVc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760975755; c=relaxed/simple;
	bh=cGFJgYE2T3P5r9d1LdElxzcsaGLfx37KWTMPxGtw8AA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XhJjn4zSWUvWbi+pwPlFtqOSWmSg9t01YHwrDCoH/t49hgo7yWX3TPg43VmzzFnQpZGU6haYTNxkf5D1UDJP+YPojD3Rp70tXFOGAKBCkF8Uab4+ScaxbCbNHOWWtT16TyEhbIxDqGIYa5lVfVIZH+q9C4UuC0GB8wQBPk/M7uk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=N5ShmGzz; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=ZGhOMWiu; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="N5ShmGzz";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="ZGhOMWiu"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59KEAYE23744736;
	Mon, 20 Oct 2025 10:55:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=YR0kGFnAXQ0xhQ62Our+smTi234Ks/vlKxvf8Ri5Rs4=; b=
	N5ShmGzzTP5gpD78o6NmFc7I1Szu78aoWVHT3a7HrOBc9edvs9Sjp4tSqSK1UWn3
	sGYu82Z56bb5H+EXmJUpnykhC24iBOrTTrsUyMGUKPp/UT4+OW5h8wl4ec69VF7C
	HCN8J5yWpq+FNN7aAnRDH5PU9zdpMIPrtV1Z80vNQiKTJ3em1WY4S0u0FUcbIcs3
	p+mgwnh60qwAM4UzmZOJAHsW64a0xe3Czunh7jU/U/sufpeoBzf/PJWwIPly+CnJ
	RfIBntqLUEsZigSomO07WOxndeqBrkJNmbbog92QtJy0x2Ui0DdrW8j8mvQG6EIk
	PDoHMWqzWapjDlBVFBp6XA==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11022127.outbound.protection.outlook.com [40.93.195.127])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 49wnc4r8df-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 20 Oct 2025 10:55:26 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kw/y7oUr0JWDGv+/r8IH6ikjFgp1pVsYzz5kJxN+uOOZCDvg1NffspUiRW25Kmz9xC26J+1iliBpU7svOVgEZK8vKVXmySx7Bsv2/JNGmP3aX0srzLi6sWpf9VbvjLHnvL+vN7RLQvFKI6evDvsAA4SuHMqNUa/xOY9aN41JwB4ngPpk1u4OQ8lCGXaCOeKcddpXPmhBjb6PV8x3654x36T7JjDUWeztBsI7o1bI8RrITNw35ThlzFHIPBIBpIn6uNjWLkHgYKCobt8YL5jKaxb+Y/QuTGCbcpa3A+BLJIcpnm9xfSJzFxAJrbA/LIfgRoalj9wMJNFyzdnN5qwqfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YR0kGFnAXQ0xhQ62Our+smTi234Ks/vlKxvf8Ri5Rs4=;
 b=ffsQuu59JaOrBGsJYn5wOwzqXgnyKzqOPBo+9XxLADMKP9a7CA9t68KoTM6D2mq/2odZL9pZ3dOcy2F6pgin8T1fOhX0azDgwgMyYWmaRq71OBcMZSVdeJ+r4lp08arHoZxZux67iV2el5+MIyQhY4ui2T7eyD50D5RoASUjHJDO7V5mZ7lBInIYDKfPOcCj2EHyZ7CoWKMiMNON9yedg9PKdM4J5DT/xlxQBUPgR9AQzO37UgpRZfhyaSeK1903fncziCBq4xEHzqtB4rnOGc0gZKRsIZPCyG82rbk4bLNyUFD86sc2LkM1vBdNjXKhS7CIxZ5fhPSs8346tC43Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YR0kGFnAXQ0xhQ62Our+smTi234Ks/vlKxvf8Ri5Rs4=;
 b=ZGhOMWiuRYVihYzY6nYJd4qgtBNnLmJ7k2rIk2vCZIUvIM2/nGUOvYrE/EEUv3OEXv2cq092PstZONEv43Vg/uiBLYTYZ4ZGOByiTEUKkefEfLkIY08TysPknF1xTQ6rHkKUfit4QiShkfaGrQtxMtLpxcK5GmJzYemExEf+8SQ=
Received: from PH7P220CA0171.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:33b::32)
 by BL1PR19MB6034.namprd19.prod.outlook.com (2603:10b6:208:39d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.15; Mon, 20 Oct
 2025 15:55:23 +0000
Received: from SN1PEPF000397B5.namprd05.prod.outlook.com
 (2603:10b6:510:33b:cafe::26) by PH7P220CA0171.outlook.office365.com
 (2603:10b6:510:33b::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.17 via Frontend Transport; Mon,
 20 Oct 2025 15:55:22 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF000397B5.mail.protection.outlook.com (10.167.248.59) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.7
 via Frontend Transport; Mon, 20 Oct 2025 15:55:22 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id AD978406578;
	Mon, 20 Oct 2025 15:55:17 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 9CF0A822540;
	Mon, 20 Oct 2025 15:55:17 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        peter.ujfalusi@linux.intel.com, shumingf@realtek.com,
        lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v3 RESEND 11/19] ASoC: SDCA: Parse Function Reset max delay
Date: Mon, 20 Oct 2025 16:55:04 +0100
Message-ID: <20251020155512.353774-12-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251020155512.353774-1-ckeepax@opensource.cirrus.com>
References: <20251020155512.353774-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B5:EE_|BL1PR19MB6034:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: a62e26ae-a8de-4db3-bbd6-08de0ff113ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|61400799027|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?M3g06wjvWpWTkXd2Uf6IA5dC72/QvafLe2MFHGSGouNLM/3tfYQXp/gk+Lcx?=
 =?us-ascii?Q?WYawn1C6l+/ud/uBPmqINeCIjAmCyo8/50sx88JdTfRHYitHF63tOMbfvSwu?=
 =?us-ascii?Q?SssjiOaq7ZbqnqF53parvaJIZNo/AlRNHK7SPGTYKkiDrvLN9T0NOGJVsHeG?=
 =?us-ascii?Q?3WbSONdtk0nGz6SVnOdTZnV6ELU6vdpUTfVUAlAE35z0xHOaG3vDIB2ttwT1?=
 =?us-ascii?Q?GL8Wurvr2cM5QG47hbOZo+kv27AUspBEeM4oN5PuIau+WMwNdsD5MOCV5iWG?=
 =?us-ascii?Q?/H19OMc5dzTAMQP4opjjrb3a6/gsXA3TpF0qcI7Cdc1GqX6NSj/uNtEsgcjK?=
 =?us-ascii?Q?djvY4LmsUOWXtNTSaHClUiXefm6G9mlkbJNPL04lpWQPD/jZbnMS0cTN1Zz5?=
 =?us-ascii?Q?ANvujc4CcHMISGrZPkqwNDvU7vkoNHWZMR/BWxo0wTi7RukEGxTMmCRp63A/?=
 =?us-ascii?Q?64aYoZ1ydC51fhLP2c/vvpuS3uUkHDSCsq1r7kEIBrlUzvmR32kPM9TGbp08?=
 =?us-ascii?Q?As9OBnZBtSbBedbj0DiNuuuCO7aly4lXmlFKfrAfBzryLIckd6cc6DZ9v9hC?=
 =?us-ascii?Q?n3uWLFax9CfVTZ02H8/3NTugufFVtXrnvcsc7DXJwGwGHboBUcWolP0Zb0GR?=
 =?us-ascii?Q?kWsIhJMhUAwCSy32pw3Kf7bxCleOz1HuxhKBPs1Xa1PfIfYyP0e3nrj51L9c?=
 =?us-ascii?Q?mbh1igCAuSzMnaB7wuBOeabxSAJ78e+4r+BR5MSyiOFgsqw28zlJXh0f19rr?=
 =?us-ascii?Q?PIsd75ZAH4eT8ETHl+6gSS03eD1mSjr6Q2Nspefar77wXAkESQ3gaPOAaIGA?=
 =?us-ascii?Q?ByPEwFWN0BOc9R2Dae6DMLTPxUAk+FO+IJLm7H8VSqYQjoPJxaQZRJ/R1l1G?=
 =?us-ascii?Q?CF+ScpOBC3zKJyhcKqnrII1kOFVxBe+3Ox93OV1e0/qdtxargUa+3d5BNGBm?=
 =?us-ascii?Q?+eNXSs2Axijp92+HcJXTUfa1E35iLy7tgAAnlyJKs1KLXGtsg3dSqhgp3aIu?=
 =?us-ascii?Q?bO6Nj86noUDnUoKxci7JZEJ4ZqhS22NIQkAIFua5wJyyO2zY1fmZr1VhVDPq?=
 =?us-ascii?Q?DY0JgpkdjdSH8mFV92CLwi5xq/ct4+UWuXKQLgzaK7qR0W4FdhqqoGgq2fYy?=
 =?us-ascii?Q?08M9Us/F+m1SglIdVizLGkcUBu7jAMzh6YHXTq+n+w/LzQm9FpuTgsumenXF?=
 =?us-ascii?Q?yi8RNeaC2JlOLm//cO0oizCNMqUk3Eo3toK1x9kATorEZ/6BRaEAiZtYyXWc?=
 =?us-ascii?Q?HVqJctySAt9golZPAtxt2coaY1QYlaQ1T2BxgnTOSdtVQd9AcBR38w4loo4o?=
 =?us-ascii?Q?eUrjAOAw68sqJGEFvFqv4YA6dJ7I86eIbI95pcgkPRek7BMg+48q686tO6BY?=
 =?us-ascii?Q?BYV7bEC4x9VZo9WDWjbZRsaa+CCL7vKAbHi6L1DzRwWf1DvoboTeZi/0efD8?=
 =?us-ascii?Q?9BSyaChL/8i5PxKUAmOdPoeYAvFuv8H5kLz7JxDAO4Q8MTsjha3ZBaDI6s1w?=
 =?us-ascii?Q?Y2zC0D4rbofPieSMRG66Yr44+xfIhwFenJuIbvF31M3NBPBoxknvgs7Ub8AJ?=
 =?us-ascii?Q?Z7HB5BgaOAO63pPJXKk=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(61400799027)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 15:55:22.2021
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a62e26ae-a8de-4db3-bbd6-08de0ff113ab
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SN1PEPF000397B5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR19MB6034
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIwMDEzMSBTYWx0ZWRfX7ytOk3H29dl9
 IS74uOteFN57eLFgNASFPKKhWMpGde0COkMXJ3ZZifHJdLEM7AsIbA/1v2ew9b28Bt90opDEACv
 5ejPhKOVORCVVHW4OT/ze9Y49ODFFCUKIm35KuljjKGe+mZQwnQLKLHQdfWOn5B2k4YiyqGxJDE
 64vSvhJmEhSe89zZT8M62G7z8QzVG5inI5PXMBPk2GxHfLWJ+9czKDdHaLSGSf+orYJbWGrycaA
 MEq9rZUh+WuAZ2H89WM/qq6Np+i6bVwiOSwneEzQ035y3iIKP0afXboP5M6T2aCbH+u4qiR/lVL
 yw23eJPqyIGmQFjZ5ZOHGvwb2CM7nFbRy2/9I1qQViV2KMWixLUW5aWaDqsEpveR1drzWjkLRI5
 k0r0ys47ZCcx3VJmono8zAT+jAmtqw==
X-Proofpoint-GUID: sQyQ7R-m5yDG_PwKIblW24KvSDvcOVx-
X-Proofpoint-ORIG-GUID: sQyQ7R-m5yDG_PwKIblW24KvSDvcOVx-
X-Authority-Analysis: v=2.4 cv=bf1mkePB c=1 sm=1 tr=0 ts=68f65b6e cx=c_pps
 a=4J2h7sJdpVYe1tCXGSmzzw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=x6icFKpwvdMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=QyXUC8HyAAAA:8 a=w1d2syhTAAAA:8
 a=OQzKDbBj9KY52EoSo_EA:9 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Reason: safe

Parse the DisCo property to get the timeout for a Function Reset.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v2.

 include/sound/sdca_function.h   |  3 +++
 sound/soc/sdca/sdca_functions.c | 10 ++++++++--
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/include/sound/sdca_function.h b/include/sound/sdca_function.h
index f2ce13162151d..2e988a30481c7 100644
--- a/include/sound/sdca_function.h
+++ b/include/sound/sdca_function.h
@@ -1323,6 +1323,8 @@ enum sdca_cluster_range {
  * @num_clusters: Number of Channel Clusters reported in this Function.
  * @busy_max_delay: Maximum Function busy delay in microseconds, before an
  * error should be reported.
+ * @reset_max_delay: Maximum Function reset delay in microseconds, before an
+ * error should be reported.
  */
 struct sdca_function_data {
 	struct sdca_function_desc *desc;
@@ -1335,6 +1337,7 @@ struct sdca_function_data {
 	int num_clusters;
 
 	unsigned int busy_max_delay;
+	unsigned int reset_max_delay;
 };
 
 static inline u32 sdca_range(struct sdca_control_range *range,
diff --git a/sound/soc/sdca/sdca_functions.c b/sound/soc/sdca/sdca_functions.c
index 2e66748462213..6602727c73f73 100644
--- a/sound/soc/sdca/sdca_functions.c
+++ b/sound/soc/sdca/sdca_functions.c
@@ -2033,8 +2033,14 @@ int sdca_parse_function(struct device *dev, struct sdw_slave *sdw,
 	if (!ret)
 		function->busy_max_delay = tmp;
 
-	dev_info(dev, "%pfwP: name %s delay %dus\n", function->desc->node,
-		 function->desc->name, function->busy_max_delay);
+	ret = fwnode_property_read_u32(function_desc->node,
+				       "mipi-sdca-function-reset-max-delay", &tmp);
+	if (!ret)
+		function->reset_max_delay = tmp;
+
+	dev_info(dev, "%pfwP: name %s busy delay %dus reset delay %dus\n",
+		 function->desc->node, function->desc->name,
+		 function->busy_max_delay, function->reset_max_delay);
 
 	ret = find_sdca_init_table(dev, function_desc->node, function);
 	if (ret)
-- 
2.47.3

