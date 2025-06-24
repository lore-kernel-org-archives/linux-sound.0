Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D1B291C26
	for <linux-sound@vger.kernel.org>; Tue, 24 Jun 2025 12:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750768161; cv=fail; b=PuigRmRSCdi6jZHRhJpB2NUKwoEJGMh9dgytCOC4KY4PfAVjiA4E3LHBSJBHR9kjoBvxddjcddm9dhsbGSEIfUVW7JPxm2NYdD3WMoB7LjzOMiwpkiMQd6rcdIzDBL5qUiH5jEdFHEr4BEMZPRmdKmEr05c79znx6zwHZ97+ZOw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750768161; c=relaxed/simple;
	bh=hgHlhj6EXicLFPWPuuNfzKMMWIiYV4zeIMFJ6UWcP5Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bRNIYWcg94I9goHnClTmbPtQDigtH9DqghtrYlTXbGuiScBNzm8fAzcdnMxaY8wHB8OPRKYGckp5fGhQq2oT1P0L430bN5BZo19OIUOooxme8n7/vkA4t47af46kdR9HxyxJr8PgvwW30FxYOn+psH7+tZnuwiWvd+wubhQaM6A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=BThd9ubX; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=jHIAoLg1; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="BThd9ubX";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="jHIAoLg1"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55O5ho4Y027202;
	Tue, 24 Jun 2025 07:28:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=BuRxkFKxJSeDmqSTdgMIXIVwJsPhNd5LwJk6x3z9gao=; b=
	BThd9ubXYW+3WudTTHdCN4DY1Jun9xLh4h8Y3rGSYOXr6Je76PRSidtnHTUTDTbt
	AiEWIgrhBSfaV84vbZhgihSBfZ+kG/wdBRzfjxnxEMSv/YdUP4OtKAW/upZIJY4D
	cDupsTPlBDyH//N58fuE/YZNquAaqmQkn9P0BYVSAEHdlZ0A3ETdK6nNDGsTtb/Q
	XwMgovD0MghN4Rj+4gjJ98wwQ6gcLfpvCMBKvkbhN00PVa0bIrRGYXzP9W/2ycPM
	S0wU3h3PbTexLZxGcKuIPCZ9PsoGTOJaWGzS18yDfL0OawksRV62uiOJBCfKq9bG
	fAertPBFHI1mw5UZr48Ucg==
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12on2120.outbound.protection.outlook.com [40.107.243.120])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 47e5tyu4jy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Jun 2025 07:28:55 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iwmHn1XBHc3GtNah4SrcQT+hLQQz54Mttv4Cdhsyosshl1OqiKpn0MyOV1YbEFoMDAYm71B7UuKR91u+dXZGe+9KOl2XqfYfLQITfEIiFgHvmphuBd6WDZ2cJ4RDskdLOZEf+bw7tANPEVtbabjUtL59HDUzbGMKPofRhonPhCp98yZpYzqvPEdovJT4iJfF61lBX0hJoYJD2qIm2HBSxvyCF8ApbSo/GX+igab5+CQhb4goyS79TLTMoWBbw/jj7kKq6joCkdbt089s98T/S4JvywMU2JhxDKUMxw1BmF+3oTOoYiZeukU1tzqZXpb7io1qcuLwJdk+8GTNqhbwyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BuRxkFKxJSeDmqSTdgMIXIVwJsPhNd5LwJk6x3z9gao=;
 b=OGB+17cRyC+D7fOvDVwO1gYJ4ZfA/uP5mAojPNVZ2cj5292Z7h70AuRi9jTcs8QtB7oq5pAhSNMbPRUaIEtoSZcgOrlQQ1MEqRfN9ASf8cwVcjFKQdWPZ6XuovbGBKLgvSzfuoPsGrqK7KLvkpQmU6rTGsg0BHAatcD5nX9EbekhCn34EFX47yM9bcmEg+nMUL56hIbR2sUrXua8T1PeuLq89a2GIuKOtRQbowr2vlLLiecDrNtFeGAbmkRGRWnUFfs3pMuyeka/6pT1XLSYiba5CwvIrJU3ymEVcNOHHxckL889b62ip8I6zPBChQ3fgnjrK5SoPCfrSnAqZZxldQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BuRxkFKxJSeDmqSTdgMIXIVwJsPhNd5LwJk6x3z9gao=;
 b=jHIAoLg1545PQa6SPhecO2Rt0IAWVT52tQ+3CsivcrulopXhdwrQzlUJ6zBZKBgJXC1uKkzlcWJxFRBv0IWuT+ygPLZY97BhUwCagO+oxE3CmU3+uh9KhY9LExXv4klA9gF5PBHGSM0beWtYiEwYAD6flvHjiR/Jo+8nyUJZCec=
Received: from BL1PR13CA0027.namprd13.prod.outlook.com (2603:10b6:208:256::32)
 by LV5PR19MB9180.namprd19.prod.outlook.com (2603:10b6:408:300::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.15; Tue, 24 Jun
 2025 12:28:50 +0000
Received: from BL6PEPF0002256F.namprd02.prod.outlook.com
 (2603:10b6:208:256:cafe::70) by BL1PR13CA0027.outlook.office365.com
 (2603:10b6:208:256::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.17 via Frontend Transport; Tue,
 24 Jun 2025 12:28:50 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL6PEPF0002256F.mail.protection.outlook.com (10.167.249.37) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.14
 via Frontend Transport; Tue, 24 Jun 2025 12:28:49 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 9F0E2406552;
	Tue, 24 Jun 2025 12:28:48 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 818DD82026B;
	Tue, 24 Jun 2025 12:28:48 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        patches@opensource.cirrus.com, linux-sound@vger.kernel.org
Subject: [PATCH v3 4/7] ASoC: SDCA: Minor selected/detected mode control fixups
Date: Tue, 24 Jun 2025 13:28:41 +0100
Message-Id: <20250624122844.2761627-5-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0002256F:EE_|LV5PR19MB9180:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 58a2562d-df71-4501-a1d7-08ddb31aac75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|61400799027|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jvEmWTYiLVJklDesaJlKhGeaXoBQ0BFWjKtNi59CyWTzDv/KtIcfAke7IeZe?=
 =?us-ascii?Q?p+b9NzhRiGmsSQzkmLuk9L0p4nXEBTSiEyayZJDt1+Rl0Be6BY3mFIZH4V9h?=
 =?us-ascii?Q?jV5dR6tGR9SxEbjxauGXIi/qg5fME0iSNnPz3BWFc4TrjSKPwKwUmP18O9wj?=
 =?us-ascii?Q?oRGnyO9nsJ4UhYsl7YA/Z35jDrRKGF+P5OjOd3wcRVdEeshvuN6us8c/PfPE?=
 =?us-ascii?Q?T/6vjyNiEna8fcAOmeImR3i/B/YpOvaqeOeRexvq7CwGsofA6UMnkibpbAMC?=
 =?us-ascii?Q?91dq9nQHJeqGptZ5OxrQsPlTYrP3pRIwsHBfqGjUIzPwFN7VB6Qlj2WKAfTp?=
 =?us-ascii?Q?FaOoXH2YQErNcAnGJyNQZbUtDKGjdW9S3iizSFmH5uEXfWvtSfuUFux7lIpw?=
 =?us-ascii?Q?yt0cVRKH/PqLdpY3LIc6CiWw99+YmAM3Tb9jyzedtyCWhnk1p6COxJ+GLwhj?=
 =?us-ascii?Q?Qvi0B3vJWm1mYEWAq4FId6oNuI6EY80TwjFu9WHxW35cejuV/pyoTjzWpQyg?=
 =?us-ascii?Q?O2lU616rBPUu9NQgbpoAZkvOC+StdykRfipycE49Ix3fDyDowXaMZnUHbMG3?=
 =?us-ascii?Q?a8GMA1gUXJkImN6OqS7ch6PkId/4XnrOGf+LsrywS5x1760RXJ4YYqxpq/kL?=
 =?us-ascii?Q?vLtnXp1VNPuDxXUo1/stTFeK2+SUS4yBRaYQdM22lEgGZZ2YCkYyy2m96kEP?=
 =?us-ascii?Q?x3LZSLk85H6c2zjW8hAaFIaM4+jKeUoMYAniY9pkT8J8578Mh7nc1hpq2NMh?=
 =?us-ascii?Q?0q5SZ1Z1Nryb+oSnPPi+WPCI/nWZ7eySM44GWC2g/hRxCrJE8FeUU6gevxvy?=
 =?us-ascii?Q?qzB+/BMq6xbfL+pl8q3XcwzxwWZ2yIlo5J9ySYDCXuDv9tQEjvTUGnNDed6M?=
 =?us-ascii?Q?A2xGoWAL815oKLdU3/qf61OkrhWbdsi5DHoKs6tNj8Fuy8VYkwVkp3HGSDSd?=
 =?us-ascii?Q?7fW+XOlgMF9rP2tEAX3ND+m4mW6Sv+ra9bTrHTPujwjrb++kqI/nLu7ml91M?=
 =?us-ascii?Q?Q1Q7YljoFutX//al8tt7HqoR279SOOnxZZzAVI+cBHo/BnUhFx1qzXiFG1LS?=
 =?us-ascii?Q?CKmabOEY3z91l/SLX4ERRZdOGSWSeghgsltiAaOoccr4Hl/LXMUwBg+DpN7F?=
 =?us-ascii?Q?IXfdn5mcGtlzjevZn3asRYdECfKYV31tvQp1nnzcATA61gJ/+jTHVHPvsJlz?=
 =?us-ascii?Q?fYt/L/ApHbLXGWjyH4GF8I1RSeMSSo6i0rWpZuwvoTbimmoFu7odmNWCUsBZ?=
 =?us-ascii?Q?Z9iuNogaEQ4zJj/6yE4I0abceHrd7ydnsMdWoDNALmRi7s1i/MMquVkJYl+f?=
 =?us-ascii?Q?/buyjWwh7A7VU2Jk2AZ+JFrlR/GdJA6Hzwm3MZu3ZWBzCP9KDiCyjNRHDw5J?=
 =?us-ascii?Q?8dtg++82QIfnAckE2H/eP3hstD8Gz5D6sLJhUWZup4ByPLiA5PnAjQFH8Tn4?=
 =?us-ascii?Q?baxSMAaxEB/33SpET/oDS868GYbVVaILqAYN8zMMK+bvj/MKD5WMqqw18wFq?=
 =?us-ascii?Q?DE7YmAGUXl1Fltm/LgImYXin84EaVLESEw1p?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(61400799027)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 12:28:49.8303
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 58a2562d-df71-4501-a1d7-08ddb31aac75
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0002256F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV5PR19MB9180
X-Proofpoint-GUID: 1fa7U0eYPdHf1kIMflJYz7g3EhuR6XQL
X-Proofpoint-ORIG-GUID: 1fa7U0eYPdHf1kIMflJYz7g3EhuR6XQL
X-Authority-Analysis: v=2.4 cv=P9E6hjAu c=1 sm=1 tr=0 ts=685a9a07 cx=c_pps a=wtUI8voyWtOXyETVCHvJRg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=6IFa9wvqVegA:10
 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=QyXUC8HyAAAA:8 a=w1d2syhTAAAA:8 a=PIROGRAch6tWaaTk4LYA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDEwNSBTYWx0ZWRfX+eOfTEx3wkyk 1aTQDPBgDdWyF+bBFNLDNM0igzErN4cB+PciVlYCSfUUnB55lIuLGyH9BMPKbW/0e36jhbh50fk wCoZeWAbL9Hem1f8FFoejNRkC6jWHV1i7+7vbQIXin2OGDWYYOGd+S5B4yqZJLSNTZBh29mKl+5
 2Q+Qj6v+3sn9Ep+QqF6/BFOjw3a8F+IOi1zEIN+wIrOatDT4ge/3AG0HSbSzWt2wBG1QPAWb6vV BSBLYKgBxPH6FI1znfnQh9zTBA0EUkUi9yn59zofda/Q4IpqZe+GLFNY0xORYNli5QrmDc7sdFx uRKxUv90kXZzRB/FmNl/M+ATC7LcKG6GacA7fLRjepeKEURUy7Jr73jf3utHnk7PVoxYxNLcyBW
 gV0GK8SGTnPmHK75YlYSvI3yQs7cGwT9YxUi7+HzUXQ7+X1h+dGy+Xd9r+M0FXi1AuD3Eg9y
X-Proofpoint-Spam-Reason: safe

Make the names a slightly better match for the specification and add
some constants for the values rather than hard coding.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No change since v2.

 include/sound/sdca_function.h | 9 +++++++++
 sound/soc/sdca/sdca_asoc.c    | 8 ++++----
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/include/sound/sdca_function.h b/include/sound/sdca_function.h
index 856b0f40ce5eb..4b278513597e5 100644
--- a/include/sound/sdca_function.h
+++ b/include/sound/sdca_function.h
@@ -319,6 +319,15 @@ enum sdca_selected_mode_range {
 	SDCA_SELECTED_MODE_NCOLS			= 2,
 };
 
+/**
+ * enum sdca_detected_mode_values - Predefined GE Detected Mode values
+ */
+enum sdca_detected_mode_values {
+	SDCA_DETECTED_MODE_JACK_UNPLUGGED		= 0,
+	SDCA_DETECTED_MODE_JACK_UNKNOWN			= 1,
+	SDCA_DETECTED_MODE_DETECTION_IN_PROGRESS	= 2,
+};
+
 /**
  * enum sdca_spe_controls - SDCA Controls for Security & Privacy Unit
  *
diff --git a/sound/soc/sdca/sdca_asoc.c b/sound/soc/sdca/sdca_asoc.c
index 83911dab73ae2..dd7b19083c85f 100644
--- a/sound/soc/sdca/sdca_asoc.c
+++ b/sound/soc/sdca/sdca_asoc.c
@@ -246,12 +246,12 @@ static int entity_early_parse_ge(struct device *dev,
 	if (!values)
 		return -ENOMEM;
 
-	texts[0] = "No Jack";
+	texts[0] = "Jack Unplugged";
 	texts[1] = "Jack Unknown";
 	texts[2] = "Detection in Progress";
-	values[0] = 0;
-	values[1] = 1;
-	values[2] = 2;
+	values[0] = SDCA_DETECTED_MODE_JACK_UNPLUGGED;
+	values[1] = SDCA_DETECTED_MODE_JACK_UNKNOWN;
+	values[2] = SDCA_DETECTED_MODE_DETECTION_IN_PROGRESS;
 	for (i = 0; i < range->rows; i++) {
 		enum sdca_terminal_type type;
 
-- 
2.39.5

