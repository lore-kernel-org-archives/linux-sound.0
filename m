Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9703293B5D
	for <linux-sound@vger.kernel.org>; Mon, 12 May 2025 12:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747053793; cv=fail; b=H3HjXwRCqN8OLrQnd435IeNgLN8DTC4oZKGFdJlRlT/GLfRp78t9VaKvNmnfdLFAe85aU0mg9LY8VX2efbRkxC9G6o3Q+fIKYqflUBmrbv7RWRXUwc1KJxTJcxcsxEq01mwddqr9LAku/ATH9iiJCcXje5SL7UOj9FVmvkDhDG4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747053793; c=relaxed/simple;
	bh=BBdqtiCCR6sZ5+JoMhaGvbvTAc/ttp5gPZdvbAOrniw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=M5vSSAvLfAjcxKVGs8VLw3t00z0E6rh31TRDlj+RMfn6YO1LxRUz7gKmolY6xjCOWdCWsg0nyyp1dYT/x8YMfMoOvv5JoHDXff2Jl5yGihRbjNkGT76aAiTrch3r/kRMZLbwyIZrbgFXfg7N9YWXQWgMKWIr53skycVMJriXmYw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=JxhBKRg2; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=GzeW8IPc; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="JxhBKRg2";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="GzeW8IPc"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54C6H5TS014403;
	Mon, 12 May 2025 07:42:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=2qGv4OcDmn9UwSMX/SMsNhL5UKhkEncTprxsl7bcx84=; b=
	JxhBKRg2ybE2LaDHXilIK0c4zEw0ZRdq2lghfMwGJywwxXW9gK9Jacp4ooZBa58n
	xwBGO1YlvFoGLAJvS17T/5lJjarodfzm/5eK+rX32iPASzD68/knRPlgBgAhmlOK
	TdfxY+4XCgKboI2eG+PtU7UBftdLpuifiqm1oRKvgZTRXKpQPaNow0aH7r3VJHjq
	ShT1CDGSk2HJ7bXzJDv1NyVoTMTFLs9VXUSTOfuZjOPxdLt7k7lphvlC4HRbLC+x
	9MlnkUUTUHv+hknsbQZvLQT5SZ5XohuMs2OVqUIb3446DopGyANPxB3MBVsv0U4+
	vNR32HBZa1SeRz/iaSIBhQ==
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2043.outbound.protection.outlook.com [104.47.55.43])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 46j37ga8n2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 May 2025 07:42:47 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t9DVO0dU7i6UfSA/v6ZdDhLDiqaSBOHU4N+ACwueS5r/WC5dQEBD9b7C6RYRq+HwFHqe2GEaf0G9Ctj2YWy1e34Lw7ZQrEFAtyNsNqOSj1lhYI9q0esFwrPtibYxX9kCy3qRceOJkZUH0vu/LH6xMB+v2PUYwHo3ln/swb4yjNnaAC2HKFpHLg2szKMxNbLfwLu0leYO10mrK0Sb2tD/Acy0CFZdy+HFJGehb4F7kGet9rMhESlPElhJynI9IuCR8Urbm3XNaYkb2XcYO7gHTf5/5V3IhB0EQgTCdE0/ZQzNvVGy8me4FurPFvCZTpLJ961HR+fS7I1LaWjRd5C09Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2qGv4OcDmn9UwSMX/SMsNhL5UKhkEncTprxsl7bcx84=;
 b=xXNzsBOSNeIBFHih+ItntRi+UGZvgi74p9j/+EVVp5nT80ArfzjWWnVXe4jXItDptpIn+ndu7gzTubHALciP1/DqPyVdv3Kw7nT37VZJ37Si3Ug5+E1F4XTUoqceiHFbwoNrTojAOdVBQjmBG2C4OHkHIq9oa7Pu00czWUfeMDjIBliihSW52sq4oSahk7MA7/DnKLPZpBbQmvz/R35obZ37lc3U1gbgTVB7OFn4aILO+Xoe1qpq4/ELx5Rn27v5SFlbV+6LHlH3iJZSM9kQOUJDyanCGLl0uP8WG4CqyaHLo8ypZickdHonuQnhHFa23uI4y6raEYiTFxy/0PuTFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2qGv4OcDmn9UwSMX/SMsNhL5UKhkEncTprxsl7bcx84=;
 b=GzeW8IPcoFpYWHeQ60RGIEXk7ZMEfOZAE1+lu4W1Uog5wZN8ASvS6bh3CYuAKLLwXFFbWDptptlluhxpvf1qloJ2PJ+57HnPB/1mygb9PaTtFRZF38EH3m6IkIVVdMAVsUfdI92Ki3kcwxr9GrssKUeNex/VTfQkbSEVm0tnUVs=
Received: from BN0PR03CA0059.namprd03.prod.outlook.com (2603:10b6:408:e7::34)
 by SN7PR19MB6638.namprd19.prod.outlook.com (2603:10b6:806:26a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Mon, 12 May
 2025 12:42:43 +0000
Received: from BL02EPF0001A0FE.namprd03.prod.outlook.com
 (2603:10b6:408:e7:cafe::34) by BN0PR03CA0059.outlook.office365.com
 (2603:10b6:408:e7::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.23 via Frontend Transport; Mon,
 12 May 2025 12:42:43 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL02EPF0001A0FE.mail.protection.outlook.com (10.167.242.105) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.18
 via Frontend Transport; Mon, 12 May 2025 12:42:42 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id F072A40654A;
	Mon, 12 May 2025 12:42:40 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id DB771820270;
	Mon, 12 May 2025 12:42:40 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        peter.ujfalusi@linux.intel.com, pierre-louis.bossart@linux.dev,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v5 2/6] ASoC: SDCA: Move allocation of PDE delays array
Date: Mon, 12 May 2025 13:42:36 +0100
Message-Id: <20250512124240.799509-3-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250512124240.799509-1-ckeepax@opensource.cirrus.com>
References: <20250512124240.799509-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FE:EE_|SN7PR19MB6638:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 15c820dd-ff90-4ef1-f559-08dd91527ce8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|61400799027|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rDA45Gzw1qh5PRV/EPyahEEn6XS+MwyKbUq/GgvS0e7fK9VBOKte/jaAiHY+?=
 =?us-ascii?Q?EkR3JSQLpj2Jy2tioaDN5tOWG8YEOdQCtYxOF4ti9VeG1V9xD8Y9O5CLu3uE?=
 =?us-ascii?Q?eH8Nc8IQHRqzTyuI7pZ5tl/3FySrpiy2SUitpEVlbSMmV1fSYj3JXqrbBU0J?=
 =?us-ascii?Q?Z7kLznCX5QB2ttRV28nuQRDKpg+CDchAgpQw8FTUXvDkfIflHJ1n/nv98xs0?=
 =?us-ascii?Q?i2QtvXNqw0Rx4TcLzpo2b9wTtgYNoAt2M8TOXjHcr6IKYHoJdrUEgCbLT6Nh?=
 =?us-ascii?Q?2ceS949jZIMUTQR9oCHUO4dYzxDxRLW6ViDvKiqyXYxzkK4u6aHg4tBxIdY+?=
 =?us-ascii?Q?sQ34fX/siuzY1PtFC+6EwCXqwJLzAOS2vn1CKrihm8K2PV5ZV9u/pLbWdHtt?=
 =?us-ascii?Q?87lj0lkIhGxp+j4bpMFGV+V8JFPs1rCQpWyyW4uiy9gefKQVrpXGw4kdxKDW?=
 =?us-ascii?Q?S6GzbuTYQcezBzrB6cGlqDp+1Rxf8JCOOAtYDIoDeyfLTo+rRUtZfjiMA6ff?=
 =?us-ascii?Q?6Tn9uFjN0SNv+88q9Xu1HfDH9JZ6i+uDVAOlIfDEVhRlgRsuAHpu8fbd7GtM?=
 =?us-ascii?Q?e8kcmYRpUi3wvRP9h/1v9l50PBzh0kPakEj6DwiXCk2+rfOeN4koUMuT1iJ3?=
 =?us-ascii?Q?xpJcgM+mgz5BVx/WwdfUw3rws/0nS+Uho8nsdLnYuLEKwCfjFywru2cjemng?=
 =?us-ascii?Q?e9rtGYPBb91VHsZr+alSf8SZTcT1mQjNqx7RzhXwG7Cb0DP+V81XLQC9RJfQ?=
 =?us-ascii?Q?m+yvbvCPlytRGrUMyqnQ+HtOXJOcGHAyv0N6QwVjRSj5EER8WJty+7INVgyL?=
 =?us-ascii?Q?YUowgrLecpFvsRLZVxlJafknvBDZbHHNae7/UtYGJHkxBrSxV7anc+MggUTF?=
 =?us-ascii?Q?xemqFq5QgeQ9kTUrlAudQlsgkygs9r3IyHMvwpSWbdFxI6i/XIvJO6QPChZg?=
 =?us-ascii?Q?0psZE99VuTT/cWcO4irTrtqAU5qVhDJ3D6/KkNV+PTFJxvuT2iJeLsh0IaBk?=
 =?us-ascii?Q?rDRkJ3PHJbN2VYkGh0zdUV43bB3IwdWfltw+6ezDZGuOrLDl1laBEKtKLLe0?=
 =?us-ascii?Q?nr9MuwGNkfnxi9EXciVFYxGveAPmAalr85q4ZHaTQBFFnfjUwzkYD/ryThlB?=
 =?us-ascii?Q?FdgQBfqqqGDQkoDz8iQl0rj4/mFV0v7J6m8LJvPmNolcdW9vEI5OVGUELNNd?=
 =?us-ascii?Q?eIPOACdygh+OOHZLRTozKLw0rX+d9j9TAIwdfKgh5KD5BOK+mntOD6V1jdEr?=
 =?us-ascii?Q?cS/3nYU2TgOUnWso4+Tg92g6fW0E2R83+DKh6xXKJ/q2U8GP12fHcJSCem1C?=
 =?us-ascii?Q?rZk30/4wig/TBnSwTPD/b+3MhDLdTWevmvJjcQ+9YtnDmmbi8WHdL4bVBMeK?=
 =?us-ascii?Q?3TJqMj8nbR5AOk8gOUC1Klj4nTpxpBoeBku2CM/i8YqLN/f92w74TGu1Tfuf?=
 =?us-ascii?Q?8WXtLHZA7ZWuE1ocbThY6Nla37IWdGEfYPxO5HgDbwmfJuFiwMltcvpoe/tj?=
 =?us-ascii?Q?G0V9BO7YG9djOk0GzDBT9zWpauBMIGB7vgQD?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(61400799027)(82310400026)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 12:42:42.3406
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 15c820dd-ff90-4ef1-f559-08dd91527ce8
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A0FE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR19MB6638
X-Proofpoint-GUID: hx8x4CzYO9CrCdjtEN38FYR8htceNxJv
X-Authority-Analysis: v=2.4 cv=BOazrEQG c=1 sm=1 tr=0 ts=6821ecc7 cx=c_pps a=2TzYObwzRp/N0knVItohZg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=dt9VzEwgFbYA:10 a=s63m1ICgrNkA:10
 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8 a=lMW7R4D7PrprYJh-GsMA:9 a=BGLuxUZjE2igh1l4FkT-:22
X-Proofpoint-ORIG-GUID: hx8x4CzYO9CrCdjtEN38FYR8htceNxJv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEyMDEzMiBTYWx0ZWRfX+KxGXDqH7drj cXJYdvVJOyCvS/DfI2i18hxVfT6Q2uZe4X/f4t/FWOS07lZNts0JJlPD4xKYg8EgE0NI0SwHyPo RwmUmlUmrxeBMWCybUmihzSdpKg3H4TYwGXc+9pE8tWQR0KjIT64VytTc9NDHMKh6tJPNlXsHYt
 xAku2fM+fqNlNMwkEBoX06giTRbcGVcnfa2y6cK65Xx5RIgc8GQ5QiGrDoOIf+zzJGFjiKtUeFi 4SCuOp4hCrWwAC5SnrJoXUUx7gKhgpqN4XDDW5WGUuSG9UsUcKN+4wdiXfTvUTR014bH7Wd/Jsc RLG9r4piruLa+QjPEPV7Os5SqMqLgMk3OedBgcRlsHSqoUEzq3V6OtzzhjahVenLVCFRYlJWbL+
 brFAwxi9R2Uypwhm140gndfNy1QAi3FapH3lk2hrMMcVl6xVyKHstckPZMAStY8mGXey6cWf
X-Proofpoint-Spam-Reason: safe

Move the allocation of the PDE delays array until after the size has
been adjusted, this saves an additional division and simplifies the
code slightly.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v4.

 sound/soc/sdca/sdca_functions.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)
diff --git a/sound/soc/sdca/sdca_functions.c b/sound/soc/sdca/sdca_functions.c
index 493f390f087ad..64ac264438907 100644
--- a/sound/soc/sdca/sdca_functions.c
+++ b/sound/soc/sdca/sdca_functions.c
@@ -1105,12 +1105,6 @@ static int find_sdca_entity_pde(struct device *dev,
 		return -EINVAL;
 	}
 
-	/* There are 3 values per delay */
-	delays = devm_kcalloc(dev, num_delays / mult_delay,
-			      sizeof(*delays), GFP_KERNEL);
-	if (!delays)
-		return -ENOMEM;
-
 	delay_list = kcalloc(num_delays, sizeof(*delay_list), GFP_KERNEL);
 	if (!delay_list)
 		return -ENOMEM;
@@ -1121,6 +1115,10 @@ static int find_sdca_entity_pde(struct device *dev,
 
 	num_delays /= mult_delay;
 
+	delays = devm_kcalloc(dev, num_delays, sizeof(*delays), GFP_KERNEL);
+	if (!delays)
+		return -ENOMEM;
+
 	for (i = 0, j = 0; i < num_delays; i++) {
 		delays[i].from_ps = delay_list[j++];
 		delays[i].to_ps = delay_list[j++];
-- 
2.39.5

