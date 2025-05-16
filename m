Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FB6D242D67
	for <linux-sound@vger.kernel.org>; Fri, 16 May 2025 13:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747401034; cv=fail; b=uKqAOC7Q3aytlhZTnhs/u6Y4JSbXES6rhDRAzeavcG9PjggTReP1gOTa5LSuKri3HwKtxWw4FLzyCaXNawucaSBAgAMi4RXg8KimoEPj5JFvfrjMC6wpz7jzssHIz4yrb7is7PCqmg8Jfqlk7hh3xGMbz7YeobTa4YdipPuc/I4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747401034; c=relaxed/simple;
	bh=dh6uYkiKjj46nzQ2SJBoNIUFUP/7tjeF0Y6grMx3Jgg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Pm36gbPlPxWLyFZWaEM0i8WrvgOdtRH/qJfpfvA25637XJM5oKauMri6Cp77fObiMa4J71x6d5tzyWQGltJXSBixVK9yVIa/qbw2PDCD5B8/j6qi/7wwQmWUHxbsnPfVHoGjrgHgtIKDWuoGXcI0xV9JFWF2lko4gfGNFxz1m1s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Dynr5SIE; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=abhj2mbV; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Dynr5SIE";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="abhj2mbV"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54GAc0lh008217;
	Fri, 16 May 2025 08:10:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=vYINhFxJMqiUqkcs9aHpXLAGG8tGCOcgU7LvDORA+00=; b=
	Dynr5SIETuuSaNPrCWSunti4/KO2EmHiim3YS7JJdShsEaNrsdJVjL7o12TA5rNK
	rb0zf2j1idSX47Buic26Ro/UEOxpX1tOVCLO8v5bfRW0kiiRBCpBUiv9Jvnr7keC
	xlSbR+WJTlbluxIVvT1Ms59KAkVWitwbSLvO2gciyvhjCLrP8jKccj0BqIs/beyx
	9kxW86YZE6esJKEdRRiFNudLz4A+0SjJZxicM8tqSkzm8xHEpKuEYQ4wu6nn4rgg
	LJi3POB38AYCnivEipjbnlNQSq5EGvJgnPrSec5+pqT+WEypsLPff8HJSkS/SV2G
	L+jaDiMHBQ5scYTHwStMiw==
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2175.outbound.protection.outlook.com [104.47.58.175])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 46mbdrcpte-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 May 2025 08:10:19 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ev5GISgCJdSinj+vl5OPFpLbzWey5yihgHE1qJFAT10RtM8ifc+vcHOAZukUKhoRCNzq+OOr6E2BiLoIObNtn5ra0fpjdyA3zUM06jygEV7dQxvSNsm6vD6m/UHJmbLlLHR4BSPG+WoDu9CCV0k/uuYezD4sam/m/9LLkZZWrn9d+P7b5zpvq91m8fzRlVFLxxgR5alz32B6QC2aqnQZMJ7zrQ6u2Zqsl2zjD67It/s3pOKYFhJSHjlW3zRO4kDbVtxgrxOz52UiloTAKQl3QaqBUhrHmquEeRJC1jvyZ7XlRp5fpZXw1FamtYmY8oIqPcOziS9svsme78hfLEjeIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vYINhFxJMqiUqkcs9aHpXLAGG8tGCOcgU7LvDORA+00=;
 b=BSH42QMzmROfHM2hEF5cLnNQfC5uXajWVxDaU1cbfjkJSQW3kLA5FrQElqoDw2sMJ3HzQ1u4ZkPv3OFq1LJsxo3vdOv49nindg1t5FTybvqkN3LZhbR43l4CsWiuIMkfvxIeC1EYYJQxNg0bnt2MWXXvQuN1mF26kIBKNVLLf4i/IomU+Ki2BSBKSA4c/tem1cpZZ7Kr5P31siThftLU7jzIVCRI6ukKNOWr5gY4zoKH++qFkiIerFfTQcKVvG8QHKd/6bL5XiG8ZVf/ydhZrMqvxv0jRBwglqu+Ak1pgD4orDUyemEOi4AHitR4mGeOq1MQNvZW36q0RxUQ5e/aYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vYINhFxJMqiUqkcs9aHpXLAGG8tGCOcgU7LvDORA+00=;
 b=abhj2mbVEktSSSzRmMuFsZzMOE/h+pIjjp+5YgEPGb2SlEU517kWGc77Llbg0jqf4UDQbKkGSmXkxgrJz+a14WJRqMX3nxjSLVV5lKRC8b40nnTh2EEp70FQ6zmlJNAW5utHxWvxHzxJcqgk/Ny846QROVX9LvKFuoMGwtcogbQ=
Received: from SJ0PR13CA0005.namprd13.prod.outlook.com (2603:10b6:a03:2c0::10)
 by BY1PR19MB7775.namprd19.prod.outlook.com (2603:10b6:a03:523::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Fri, 16 May
 2025 13:10:16 +0000
Received: from MWH0EPF000A6732.namprd04.prod.outlook.com
 (2603:10b6:a03:2c0:cafe::bd) by SJ0PR13CA0005.outlook.office365.com
 (2603:10b6:a03:2c0::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.19 via Frontend Transport; Fri,
 16 May 2025 13:10:16 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MWH0EPF000A6732.mail.protection.outlook.com (10.167.249.24) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.18
 via Frontend Transport; Fri, 16 May 2025 13:10:15 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 3E9D4406552;
	Fri, 16 May 2025 13:10:12 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 2B801822565;
	Fri, 16 May 2025 13:10:12 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v6 6/7] ASoC: SDCA: Create ALSA controls from DisCo
Date: Fri, 16 May 2025 14:10:10 +0100
Message-Id: <20250516131011.221310-7-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250516131011.221310-1-ckeepax@opensource.cirrus.com>
References: <20250516131011.221310-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6732:EE_|BY1PR19MB7775:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 8d380993-dc01-49ff-8857-08dd947b0017
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|61400799027|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?h8W4WZNY6DyL4aXsA7bC1Xi75rChMhSjLXwD5tK6I7ZfyURHTMhEP5/C8Vae?=
 =?us-ascii?Q?6TTtIC3S+zAf4XKnElRpAAxsKQypVUfDY0xJMCwViAhvaGgj2FFIphvNY3sm?=
 =?us-ascii?Q?5AMnaLRlNB5mXQM+20sPJHuNv/sMJhXcTqVnyW/B2sOffLgwmWrYvCpSUv/e?=
 =?us-ascii?Q?NCjevo8clpds3gwI8FjDb8q/EmxxbIOY8Z06T+tcJX6VpNgZusWrrhX3GQ40?=
 =?us-ascii?Q?lixnngKnabsRosRvueWE7g91EblfE+KX552BrpOg9W9gV0J7+2C7lYg39LBQ?=
 =?us-ascii?Q?V+lTcS7GPaAJTlPub85U8x+l+anlLnHp2UNrd1QsQYYgwBTrYgGrer1MBLjX?=
 =?us-ascii?Q?SbQS76oVCt8bkPsA/WLJ2D/ELz2xBM9Zxj2PsaWkBFThufMglJ7fnZHmOQpv?=
 =?us-ascii?Q?vLIzer/+NTBgzrvzOtkhzaOFz6N2VEppM9ytsaeopk9/OiO9fof+uYs5X1Yp?=
 =?us-ascii?Q?4gh76mTpTI5RpqHJXTlx43kD9/KrKXQgw/w+8wd0chozR8/wpcuVlw7YJW92?=
 =?us-ascii?Q?ka9cRqDWQnEMMlZ20qKxKuy/e2fMIhKrel3wTlMmjmZnxoy6wGmg851Ma3pn?=
 =?us-ascii?Q?MWYbmI57LpMjHUQtxkRRVY/SjcXRCoK98Y/ojEAWau/dC1mmAFBSTJnsbt+Y?=
 =?us-ascii?Q?HkrBHdFKwShRXfZBk7nShdP0uB/5rcCjj7A5gIBCde/b0tHRQ/my2RUN6Nnr?=
 =?us-ascii?Q?5oqP6aRE5CXw58JzUUAvGpFXpTZYpi4qNWRsXxZMc2C/s0686FZ92S0SFjru?=
 =?us-ascii?Q?PqEZtHUygCLvXPEhMZTtzXTzpMNCRRt3exyMmCcuJzzWtMB0mCSDTCTBPxV7?=
 =?us-ascii?Q?af1kZ66gTYn1eqS+OQP4PhK0s7TLAx3XlCZnqnTWchqhcDyUxPgKDGu7/5pP?=
 =?us-ascii?Q?k9Kdqz0i1NOwk/NGDUQdIpV08VYwwkGGP5WunDgwu8uVQXH0jlwnIVNi/pa0?=
 =?us-ascii?Q?/dHi4qYAdF4PK3LQOYEWzC7Wsk8NHkq1nZi3+XMFhgEMuIq4Icr2PBG8+ryn?=
 =?us-ascii?Q?2f4KCAVfOvwrBvUyrgHU6wOCmnbkB4eaFV6iBCgFGQjoaJpyAUkLAJeBrbye?=
 =?us-ascii?Q?RdUJwA0bb5WgyCLRS/B1iVPpmfCpjtwPJGYbbBof8bro8rAeiEAkmsfTTVSj?=
 =?us-ascii?Q?YUXFndaO1FEZLNm33aBr1TB+An0FE3hrBtmHwX9RexQXrc61TJYOtsnl0KjO?=
 =?us-ascii?Q?i144CQ2qmNwCFtq89ZvKtNrO7EiCBIRxGwAOudswS6M6hSLVTksGxo/boh+W?=
 =?us-ascii?Q?s5bI8CghTUOeQ3UmR7FDH/9q0zNzCptQmVOiPdRVpJGm7i8hKhr34h6TrqUs?=
 =?us-ascii?Q?RDpW3qgSuDoVpvQwUlBYvnBZqjTCnGX3nNRgvvXzpQCWXa+UqiQ0qhLtCeJS?=
 =?us-ascii?Q?44b/8QZox7ZGPss0iKCAiKS7OJdFmxrQ6Xm1J7HbdA7cayUMXqAIYrM6TGXj?=
 =?us-ascii?Q?FrU0saN5t9jbK8sfM527sIYMQdDfqOq7qiGBJz186R7scO2LOy/v5+LjjlGw?=
 =?us-ascii?Q?S7J6jhWdnPizm3Yj8iYcd8cdp/WmVkto7C3j?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(61400799027)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 13:10:15.6581
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d380993-dc01-49ff-8857-08dd947b0017
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000A6732.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR19MB7775
X-Proofpoint-ORIG-GUID: Mdxsql7ndHYHSVJbeyDRimItp-CHr9xg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDEyNyBTYWx0ZWRfX/ROuyJtqfjhK Eqt+lvokG5YcQOX/S1DkLdOJ0caW9yqdH+m2F2F8R9oBb4FTQe6XD7OPyJp9Q1vuoXWGcjvsX+H 8iwoyW7sQAwoNt5WJ/EYUIE9spxKT5f5cp4W88XriMrL0XMzCNM1116qZwrZRuzlxO3yByV8CtH
 x/seurfm5yYFkrMPlz0yJCI+LP3cD0lb8jmmCqgxbQmSkt3hH/eEKXGeW6WglU7yobOgrGRVebh xdlqJ/1rCjBoZVy0SgabWMt8V9HED5riIN7ObbfWn/kOud5qNmbwmYSLD2j9P84/DtrARfHiW+B RJwb9xsdygGyE2Wyf1GFAJ/s7kZrYHZpdG4qtuKbeJbnGnKETK1F5l9X/oStTSYXSzLIDqFjF3v
 v1dRKHdYaA7ZZnHcyP3JdL96+/rPN5Z2tnVuJNezNKdBJtKz+Uibw9Z5tnrQ/PQwjxWHLJYk
X-Proofpoint-GUID: Mdxsql7ndHYHSVJbeyDRimItp-CHr9xg
X-Authority-Analysis: v=2.4 cv=abNhnQot c=1 sm=1 tr=0 ts=6827393b cx=c_pps a=6L7f6dt9FWfToKUQdDsCmg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=dt9VzEwgFbYA:10 a=s63m1ICgrNkA:10
 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8 a=saw5k5suZ20VLMXOP5kA:9
X-Proofpoint-Spam-Reason: safe

Use the previously parsed DisCo information from ACPI to create the
ALSA controls required by an SDCA Function. This maps all User and
Application level SDCA Controls to ALSA controls. Typically controls
marked with those access levels are just volumes and mutes.

SDCA defines volume controls as an integer in 1/256ths of a dB and
then provides a mechanism to specify what values are valid (range
templates). Currently only a simple case of a single linear volume
range with a power of 2 step size is supported. This allows the code
to expose the volume control using a simple shift. This will need
expanded in the future, to support more complex ranges and probably
also some additional control types but this should be sufficient to
for a first pass.

For non-dataport terminal widgets also add a pin switch to allow
that endpoint to be turned on/off.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Changes since v5:
 - Generate read only ALSA controls where appropriate
 - Export ALSA controls for SDCA controls with fixed values
 - Clamp control values to range supported by ALSA
 - Force export of a control for DETECTED_MODE

 include/sound/sdca_asoc.h     |   6 +-
 include/sound/sdca_function.h |  10 ++
 sound/soc/sdca/sdca_asoc.c    | 256 +++++++++++++++++++++++++++++++++-
 3 files changed, 267 insertions(+), 5 deletions(-)

diff --git a/include/sound/sdca_asoc.h b/include/sound/sdca_asoc.h
index 414d461b6fc4a..d19e7e969283a 100644
--- a/include/sound/sdca_asoc.h
+++ b/include/sound/sdca_asoc.h
@@ -12,16 +12,20 @@
 
 struct device;
 struct sdca_function_data;
+struct snd_kcontrol_new;
 struct snd_soc_component_driver;
 struct snd_soc_dapm_route;
 struct snd_soc_dapm_widget;
 
 int sdca_asoc_count_component(struct device *dev, struct sdca_function_data *function,
-			      int *num_widgets, int *num_routes);
+			      int *num_widgets, int *num_routes, int *num_controls);
 
 int sdca_asoc_populate_dapm(struct device *dev, struct sdca_function_data *function,
 			    struct snd_soc_dapm_widget *widgets,
 			    struct snd_soc_dapm_route *routes);
+int sdca_asoc_populate_controls(struct device *dev,
+				struct sdca_function_data *function,
+				struct snd_kcontrol_new *kctl);
 
 int sdca_asoc_populate_component(struct device *dev,
 				 struct sdca_function_data *function,
diff --git a/include/sound/sdca_function.h b/include/sound/sdca_function.h
index 008e23882de88..2ecf0c3a5e033 100644
--- a/include/sound/sdca_function.h
+++ b/include/sound/sdca_function.h
@@ -206,6 +206,16 @@ enum sdca_fu_controls {
 	SDCA_CTL_FU_LATENCY				= 0x10,
 };
 
+/**
+ * enum sdca_volume_range - Column definitions for Q7.8dB volumes/gains
+ */
+enum sdca_volume_range {
+	SDCA_VOLUME_LINEAR_MIN				= 0,
+	SDCA_VOLUME_LINEAR_MAX				= 1,
+	SDCA_VOLUME_LINEAR_STEP				= 2,
+	SDCA_VOLUME_LINEAR_NCOLS			= 3,
+};
+
 /**
  * enum sdca_xu_controls - SDCA Controls for Extension Unit
  *
diff --git a/sound/soc/sdca/sdca_asoc.c b/sound/soc/sdca/sdca_asoc.c
index fe24c897def7b..bf8dbccde5263 100644
--- a/sound/soc/sdca/sdca_asoc.c
+++ b/sound/soc/sdca/sdca_asoc.c
@@ -11,7 +11,9 @@
 #include <linux/delay.h>
 #include <linux/dev_printk.h>
 #include <linux/device.h>
+#include <linux/minmax.h>
 #include <linux/module.h>
+#include <linux/overflow.h>
 #include <linux/soundwire/sdw_registers.h>
 #include <linux/string_helpers.h>
 #include <sound/control.h>
@@ -21,6 +23,7 @@
 #include <sound/soc.h>
 #include <sound/soc-component.h>
 #include <sound/soc-dapm.h>
+#include <sound/tlv.h>
 
 static struct sdca_control *selector_find_control(struct device *dev,
 						  struct sdca_entity *entity,
@@ -69,6 +72,24 @@ static struct sdca_control_range *selector_find_range(struct device *dev,
 	return control_find_range(dev, entity, control, cols, rows);
 }
 
+static bool exported_control(struct sdca_entity *entity, struct sdca_control *control)
+{
+	switch (SDCA_CTL_TYPE(entity->type, control->sel)) {
+	case SDCA_CTL_TYPE_S(GE, DETECTED_MODE):
+		return true;
+	default:
+		break;
+	}
+
+	return control->layers & (SDCA_ACCESS_LAYER_USER |
+				  SDCA_ACCESS_LAYER_APPLICATION);
+}
+
+static bool readonly_control(struct sdca_control *control)
+{
+	return control->has_fixed || control->mode == SDCA_ACCESS_MODE_RO;
+}
+
 /**
  * sdca_asoc_count_component - count the various component parts
  * @function: Pointer to the Function information.
@@ -76,6 +97,8 @@ static struct sdca_control_range *selector_find_range(struct device *dev,
  * required number of DAPM widgets for the Function.
  * @num_routes: Output integer pointer, will be filled with the
  * required number of DAPM routes for the Function.
+ * @num_controls: Output integer pointer, will be filled with the
+ * required number of ALSA controls for the Function.
  *
  * This function counts various things within the SDCA Function such
  * that the calling driver can allocate appropriate space before
@@ -84,12 +107,13 @@ static struct sdca_control_range *selector_find_range(struct device *dev,
  * Return: Returns zero on success, and a negative error code on failure.
  */
 int sdca_asoc_count_component(struct device *dev, struct sdca_function_data *function,
-			      int *num_widgets, int *num_routes)
+			      int *num_widgets, int *num_routes, int *num_controls)
 {
-	int i;
+	int i, j;
 
 	*num_widgets = function->num_entities - 1;
 	*num_routes = 0;
+	*num_controls = 0;
 
 	for (i = 0; i < function->num_entities - 1; i++) {
 		struct sdca_entity *entity = &function->entities[i];
@@ -100,6 +124,7 @@ int sdca_asoc_count_component(struct device *dev, struct sdca_function_data *fun
 		case SDCA_ENTITY_TYPE_OT:
 			*num_routes += !!entity->iot.clock;
 			*num_routes += !!entity->iot.is_dataport;
+			*num_controls += !entity->iot.is_dataport;
 			break;
 		case SDCA_ENTITY_TYPE_PDE:
 			*num_routes += entity->pde.num_managed;
@@ -113,6 +138,11 @@ int sdca_asoc_count_component(struct device *dev, struct sdca_function_data *fun
 
 		/* Add primary entity connections from DisCo */
 		*num_routes += entity->num_sources;
+
+		for (j = 0; j < entity->num_controls; j++) {
+			if (exported_control(entity, &entity->controls[j]))
+				(*num_controls)++;
+		}
 	}
 
 	return 0;
@@ -797,6 +827,212 @@ int sdca_asoc_populate_dapm(struct device *dev, struct sdca_function_data *funct
 }
 EXPORT_SYMBOL_NS(sdca_asoc_populate_dapm, "SND_SOC_SDCA");
 
+static int control_limit_kctl(struct device *dev,
+			      struct sdca_entity *entity,
+			      struct sdca_control *control,
+			      struct snd_kcontrol_new *kctl)
+{
+	struct soc_mixer_control *mc = (struct soc_mixer_control *)kctl->private_value;
+	struct sdca_control_range *range;
+	int min, max, step;
+	unsigned int *tlv;
+	int shift;
+
+	if (control->type != SDCA_CTL_DATATYPE_Q7P8DB)
+		return 0;
+
+	/*
+	 * FIXME: For now only handle the simple case of a single linear range
+	 */
+	range = control_find_range(dev, entity, control, SDCA_VOLUME_LINEAR_NCOLS, 1);
+	if (!range)
+		return -EINVAL;
+
+	min = sdca_range(range, SDCA_VOLUME_LINEAR_MIN, 0);
+	max = sdca_range(range, SDCA_VOLUME_LINEAR_MAX, 0);
+	step = sdca_range(range, SDCA_VOLUME_LINEAR_STEP, 0);
+
+	min = sign_extend32(min, control->nbits - 1);
+	max = sign_extend32(max, control->nbits - 1);
+
+	/*
+	 * FIXME: Only support power of 2 step sizes as this can be supported
+	 * by a simple shift.
+	 */
+	if (hweight32(step) != 1) {
+		dev_err(dev, "%s: %s: currently unsupported step size\n",
+			entity->label, control->label);
+		return -EINVAL;
+	}
+
+	/*
+	 * The SDCA volumes are in steps of 1/256th of a dB, a step down of
+	 * 64 (shift of 6) gives 1/4dB. 1/4dB is the smallest unit that is also
+	 * representable in the ALSA TLVs which are in 1/100ths of a dB.
+	 */
+	shift = max(ffs(step) - 1, 6);
+
+	tlv = devm_kcalloc(dev, 4, sizeof(*tlv), GFP_KERNEL);
+	if (!tlv)
+		return -ENOMEM;
+
+	tlv[0] = SNDRV_CTL_TLVT_DB_SCALE;
+	tlv[1] = 2 * sizeof(*tlv);
+	tlv[2] = (min * 100) >> 8;
+	tlv[3] = ((1 << shift) * 100) >> 8;
+
+	mc->min = min >> shift;
+	mc->max = max >> shift;
+	mc->shift = shift;
+	mc->rshift = shift;
+	mc->sign_bit = 15 - shift;
+
+	kctl->tlv.p = tlv;
+	kctl->access |= SNDRV_CTL_ELEM_ACCESS_TLV_READ;
+
+	return 0;
+}
+
+static int populate_control(struct device *dev,
+			    struct sdca_function_data *function,
+			    struct sdca_entity *entity,
+			    struct sdca_control *control,
+			    struct snd_kcontrol_new **kctl)
+{
+	const char *control_suffix = "";
+	const char *control_name;
+	struct soc_mixer_control *mc;
+	int index = 0;
+	int ret;
+	int cn;
+
+	if (!exported_control(entity, control))
+		return 0;
+
+	if (control->type == SDCA_CTL_DATATYPE_ONEBIT)
+		control_suffix = " Switch";
+
+	control_name = devm_kasprintf(dev, GFP_KERNEL, "%s %s%s", entity->label,
+				      control->label, control_suffix);
+	if (!control_name)
+		return -ENOMEM;
+
+	mc = devm_kmalloc(dev, sizeof(*mc), GFP_KERNEL);
+	if (!mc)
+		return -ENOMEM;
+
+	for_each_set_bit(cn, (unsigned long *)&control->cn_list,
+			 BITS_PER_TYPE(control->cn_list)) {
+		switch (index++) {
+		case 0:
+			mc->reg = SDW_SDCA_CTL(function->desc->adr, entity->id,
+					       control->sel, cn);
+			mc->rreg = mc->reg;
+			break;
+		case 1:
+			mc->rreg = SDW_SDCA_CTL(function->desc->adr, entity->id,
+						control->sel, cn);
+			break;
+		default:
+			dev_err(dev, "%s: %s: only mono/stereo controls supported\n",
+				entity->label, control->label);
+			return -EINVAL;
+		}
+	}
+
+	mc->min = 0;
+	mc->max = clamp((0x1ull << control->nbits) - 1, 0, type_max(mc->max));
+
+	(*kctl)->name = control_name;
+	(*kctl)->private_value = (unsigned long)mc;
+	(*kctl)->iface = SNDRV_CTL_ELEM_IFACE_MIXER;
+	(*kctl)->info = snd_soc_info_volsw;
+	(*kctl)->get = snd_soc_get_volsw;
+	(*kctl)->put = snd_soc_put_volsw;
+
+	if (readonly_control(control))
+		(*kctl)->access = SNDRV_CTL_ELEM_ACCESS_READ;
+	else
+		(*kctl)->access = SNDRV_CTL_ELEM_ACCESS_READWRITE;
+
+	ret = control_limit_kctl(dev, entity, control, *kctl);
+	if (ret)
+		return ret;
+
+	(*kctl)++;
+
+	return 0;
+}
+
+static int populate_pin_switch(struct device *dev,
+			       struct sdca_entity *entity,
+			       struct snd_kcontrol_new **kctl)
+{
+	const char *control_name;
+
+	control_name = devm_kasprintf(dev, GFP_KERNEL, "%s Switch", entity->label);
+	if (!control_name)
+		return -ENOMEM;
+
+	(*kctl)->name = control_name;
+	(*kctl)->private_value = (unsigned long)entity->label;
+	(*kctl)->iface = SNDRV_CTL_ELEM_IFACE_MIXER;
+	(*kctl)->info = snd_soc_dapm_info_pin_switch;
+	(*kctl)->get = snd_soc_dapm_get_component_pin_switch;
+	(*kctl)->put = snd_soc_dapm_put_component_pin_switch;
+	(*kctl)++;
+
+	return 0;
+}
+
+/**
+ * sdca_asoc_populate_controls - fill in an array of ALSA controls for a Function
+ * @dev: Pointer to the device against which allocations will be done.
+ * @function: Pointer to the Function information.
+ * @route: Array of ALSA controls to be populated.
+ *
+ * This function populates an array of ALSA controls from the DisCo
+ * information for a particular SDCA Function. Typically,
+ * snd_soc_asoc_count_component will be used to allocate an
+ * appropriately sized array before calling this function.
+ *
+ * Return: Returns zero on success, and a negative error code on failure.
+ */
+int sdca_asoc_populate_controls(struct device *dev,
+				struct sdca_function_data *function,
+				struct snd_kcontrol_new *kctl)
+{
+	int i, j;
+	int ret;
+
+	for (i = 0; i < function->num_entities; i++) {
+		struct sdca_entity *entity = &function->entities[i];
+
+		switch (entity->type) {
+		case SDCA_ENTITY_TYPE_IT:
+		case SDCA_ENTITY_TYPE_OT:
+			if (!entity->iot.is_dataport) {
+				ret = populate_pin_switch(dev, entity, &kctl);
+				if (ret)
+					return ret;
+			}
+			break;
+		default:
+			break;
+		}
+
+		for (j = 0; j < entity->num_controls; j++) {
+			ret = populate_control(dev, function, entity,
+					       &entity->controls[j], &kctl);
+			if (ret)
+				return ret;
+		}
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_NS(sdca_asoc_populate_controls, "SND_SOC_SDCA");
+
 /**
  * sdca_asoc_populate_component - fill in a component driver for a Function
  * @dev: Pointer to the device against which allocations will be done.
@@ -815,10 +1051,12 @@ int sdca_asoc_populate_component(struct device *dev,
 {
 	struct snd_soc_dapm_widget *widgets;
 	struct snd_soc_dapm_route *routes;
-	int num_widgets, num_routes;
+	struct snd_kcontrol_new *controls;
+	int num_widgets, num_routes, num_controls;
 	int ret;
 
-	ret = sdca_asoc_count_component(dev, function, &num_widgets, &num_routes);
+	ret = sdca_asoc_count_component(dev, function, &num_widgets, &num_routes,
+					&num_controls);
 	if (ret)
 		return ret;
 
@@ -830,14 +1068,24 @@ int sdca_asoc_populate_component(struct device *dev,
 	if (!routes)
 		return -ENOMEM;
 
+	controls = devm_kcalloc(dev, num_controls, sizeof(*controls), GFP_KERNEL);
+	if (!controls)
+		return -ENOMEM;
+
 	ret = sdca_asoc_populate_dapm(dev, function, widgets, routes);
 	if (ret)
 		return ret;
 
+	ret = sdca_asoc_populate_controls(dev, function, controls);
+	if (ret)
+		return ret;
+
 	component_drv->dapm_widgets = widgets;
 	component_drv->num_dapm_widgets = num_widgets;
 	component_drv->dapm_routes = routes;
 	component_drv->num_dapm_routes = num_routes;
+	component_drv->controls = controls;
+	component_drv->num_controls = num_controls;
 
 	return 0;
 }
-- 
2.39.5

