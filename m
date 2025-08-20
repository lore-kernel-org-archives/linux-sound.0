Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D6B032C32A
	for <linux-sound@vger.kernel.org>; Wed, 20 Aug 2025 16:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755707872; cv=fail; b=Q/Q9f+vhaD6AXfAwalK5hD5BOCkW0nifLOL10of4d/YVFavaTGImG3i2hrcRwEInRJ5rtSCW6EKw+PX0yyGD17LBzgn1sPpb1HggZpYfheatCbI6CVridY0DSvXopHkKltB/dns0sJPWwDlaiUnpJJA2Kyu9O++w6waS3IVHoAw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755707872; c=relaxed/simple;
	bh=AQAuf3xMlO45qrBUWoPF7/FCoUgejUKc8LuvSM22j6w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WEALmcxS0oVkG0WfkRIvq7Lct0PhKDzSsCC+YuUBoEfx0d2hfzddxwGYNhWql1j7VR1qdm/spbfk6BB5Ej/V6SZ+UzAJdf3ObDbju4wSDq+GKp24Q0iTmjT8LhNDYA6Z7/X3jPHaGFT8JNc317pNJHAGA+cmYH7onWM3kfpb7xY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=LBJPeUxq; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=awwTE+2i; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="LBJPeUxq";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="awwTE+2i"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 57KEZ8ar368910;
	Wed, 20 Aug 2025 11:37:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=xMuE21SllUkNzvErQ4KV7G7VRhX+K8NtCqOpB9Ld3a8=; b=
	LBJPeUxqE7b4AHm36VLDw3qT62CeRMRz4EgwOpUdTEnrH6aWwF8jsioj2/r84szT
	++3sHOnKa/VZ8eplSL21offyxC/NnDJ1SVrZSCTNpsmwZa2/MBy1zAttH3C78AQU
	tvDjLegnYNNrmM45wtGZ4WDM247v4icmnpjw4lMIYvnS/i9S/d5iPiul5WlbalrE
	PX4o38Hc6+CYxIfsz6gkWDbmhhEsaqkBI22D/WuIrR/sMGa4S2Be7tC4ddtXPd3j
	Hvqn2caQrNrE/AIGR9DHIjvBy6AWlEPjB/DC0qgZYIaGY3jMVw9cBdCZlooTY1j8
	ClI7odm0ElRGqR1h68bSvA==
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02on2110.outbound.protection.outlook.com [40.107.212.110])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 48myd99j29-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Aug 2025 11:37:26 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DaJbCqFUy5BvExooXE7KJR0esAnwWv4Mug0YudcY9MGjCFGI8yYAoVtpFRi0gIJsvCVhRlLh5phd6X4+iXMjdsnBmXIWk7lT0p3xxQw+DyCk0oWikgo70/wF3ncEpeUl8cJHPnufNNp2qG3hwzx5JFG0k/NhrI84PyC1Ucq7Hs/jGlXZc6apkY3ggIFccHgDTqe5zk13pe9pDICpVqxSR+jgy9P/j9t+bbGs1IJgp5eTfSdJKvnV6alGaTCfmC2pJ17GJVQ5gXXpCuhLf/Jr5EYAKTax+yWUyKtjAkmpbbFduHA1CLoGEdsx3ZWthoiB2qlsnRxUcm40ca7qx6V2rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xMuE21SllUkNzvErQ4KV7G7VRhX+K8NtCqOpB9Ld3a8=;
 b=NSMwpxAYsEai6je0UDm69euvRtHHqVzidd+DEe5N2ryXUJ3jwkBQw/WPw2ggmHwEDp+RjeBbPKLRaUtplOuQxRDPbwPr8NcCqtOHEnSapFAxA5buoJAx2OHU4ubU2G21Kw0+87sxAoq4I0t5MOLSy0zMGjkI1ReA+ESI065K8ziF9pWM32gq9T2dhqd1u0yaZYXiJBHgL5kITIU1I23bGXG2gzbEsHntykMaLq3jlPAJY464ucI2QeVPo4SNU+v/gRP1lavAfKPGt+SUK8S/NGh+cOAY8dLFJ7zbtXwZVicnVdJEn+/9/MhSuWkPPYJPLtLnKwO1E8jtpFymkxhW5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xMuE21SllUkNzvErQ4KV7G7VRhX+K8NtCqOpB9Ld3a8=;
 b=awwTE+2ibLW4gWUkeVDsF86OsjKoZkC4DVeW4eyCNQrwKCz1n6nfCNdNwU4llDXwT4TFiA76EW4mSeFHzEEJ5F9A530OH/Ki6WT6BjbIdu/e55KvKFFMCGXSURhumx4/Iw4qnW/1tBC/91RiFqEba9RvmxInUVdevSt4pCvAlv8=
Received: from SJ0PR05CA0124.namprd05.prod.outlook.com (2603:10b6:a03:33d::9)
 by SJ0PR19MB4559.namprd19.prod.outlook.com (2603:10b6:a03:289::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Wed, 20 Aug
 2025 16:37:23 +0000
Received: from CY4PEPF0000EE37.namprd05.prod.outlook.com
 (2603:10b6:a03:33d:cafe::a) by SJ0PR05CA0124.outlook.office365.com
 (2603:10b6:a03:33d::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.13 via Frontend Transport; Wed,
 20 Aug 2025 16:37:23 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY4PEPF0000EE37.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.8
 via Frontend Transport; Wed, 20 Aug 2025 16:37:22 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 60E6940654B;
	Wed, 20 Aug 2025 16:37:21 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 4B34882024B;
	Wed, 20 Aug 2025 16:37:21 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 1/3] ASoC: SDCA: Fix return value in sdca_regmap_mbq_size()
Date: Wed, 20 Aug 2025 17:37:15 +0100
Message-ID: <20250820163717.1095846-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250820163717.1095846-1-ckeepax@opensource.cirrus.com>
References: <20250820163717.1095846-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE37:EE_|SJ0PR19MB4559:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 92e6186e-ba9d-457c-3414-08dde007d6e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6nJELF3QrUBRHPdrR1CDl+4Fz3CeYlRP6+ivjWS0s/DGxJyZtddcXCla5QFV?=
 =?us-ascii?Q?eG6kGIsAVrOzz2+9XUqstDe9oVDOL1UaLuHkQyzx9Ryyc1YCIDrwV9rU5r4X?=
 =?us-ascii?Q?ok5bGa94/j551XAVuzOpUj5YzoO3mVM58tVSEtFT4w5ZhuegKrfSDhEZ3C/a?=
 =?us-ascii?Q?vFQNEH42cFE2gTROPqI3eDcXMzDyQgWKV+l4tNjXC68cw5ON4I/LJ0CySetd?=
 =?us-ascii?Q?tWHSar3Q/99KL1xIVirwZpuYfC2mCFNJH5/rYuFsJ5sTQpMumiAy0pqup/qU?=
 =?us-ascii?Q?s175AXluiw0S2/L6eqalCMYCKeq67mGp1idIlbJBpQGk5OgOJdIxIE5QTCo0?=
 =?us-ascii?Q?PnYc4b9dBuxwLTiFd5Ho9VuSXTOM9B2GRW8o2lQMKYqrs+Y4njjDjXjEp8Ka?=
 =?us-ascii?Q?hujHDx6tgpCajrK4JKZh9wBy24lj3FjG/g0nRnVNn5l+QUoKehOeNuZfu3l1?=
 =?us-ascii?Q?LndNe5aHSUy19Ez+m4RnxnB6cKHUeUdlnSFo4U05UGh8CkreL1neI0ihvoal?=
 =?us-ascii?Q?8dW0Dg8sZwVHLgnbnTTe7D+JO/4WtN3nqQo1mAyEY6H4FiV7C0HHBTzfveJH?=
 =?us-ascii?Q?cbI68kw+vpc95KRLZ40yVC57lx8jXY7FXOKVb5fHUR4xzr9PUyrXODeqbaUk?=
 =?us-ascii?Q?Y5EfY0c81mfzJOMfHpqwYxL6oAlSPVGyAsYaDvUntGQ7KP2JsZg+SrIoU9fP?=
 =?us-ascii?Q?ZMkjHxZN3TaES1YzwrNMePF43u04OSNzcoEAifX1wG/M8zCKH4GqL/dc4nu5?=
 =?us-ascii?Q?dz2P+08yoE7fmX/ME6Gw4yPh9/EehhcoiqL/6ZI70hG6jmHJZ9aMTVdK/DUC?=
 =?us-ascii?Q?ocq++HdPDhUb+mQnZSUwo+KJED8QllxWo3HDIVz9Sv8NCJ6wjbse2qS6k2nG?=
 =?us-ascii?Q?WKijAdsp8d8Ar6TE/yWBdMQElz/Ws0eheM+ICvg69yFu8ziPfTaRb1yqYlPO?=
 =?us-ascii?Q?tr1+fqSmgL2QdnNkomJe9Ju7Txjw5OdCMW4kEtIVU7a4r0oU79P+Dz4+D3OF?=
 =?us-ascii?Q?cpewGPCa2LAaR2hqa2PbzfWh6Sbhiej5C1UNzQYU79IuqA0L4/qLngxT6c7s?=
 =?us-ascii?Q?TozjrdWOk62AjyTTArm9i/W+xT76VLIA3fZfkufHptwHQpLCZOeEuhYTRSOH?=
 =?us-ascii?Q?8GvAREnUddt8fN3YsR9ZW2CIgTQI49GaMI4CITMU7Hw7iVofgC5vTMd/qEkH?=
 =?us-ascii?Q?qAQZfWntqcag4X96pA9+VBs/4rhwOA+GbmMR+RqnqaRMPx3XwMH60D5xO8ui?=
 =?us-ascii?Q?n1S2ln8Q4ScPHefBkJqYwWZ/GVruYwthaCQrhdIh9XLG8ggg/knURK+Ftovw?=
 =?us-ascii?Q?n6/4een35aBz67W3ZN3bPy5EtHYy5zfc6kpf7bNmNNzuxZwWq+7yLddmkzxo?=
 =?us-ascii?Q?uRAzc0M0u1mUoCIeSEggBKUnkXtNJ+pF7N33dG1yiPmmyOLUDZ5yJ6LY4W0L?=
 =?us-ascii?Q?P4pwUxJ1YHRwnmMzcDXmPdRZ3KCAbOMI2MeeXfyNmW6GBDZ5PY631np95J6L?=
 =?us-ascii?Q?PRmnpb2AN4esuPZwEuMXJglTv03ueVlAkJfo?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2025 16:37:22.7916
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 92e6186e-ba9d-457c-3414-08dde007d6e0
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE37.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR19MB4559
X-Proofpoint-ORIG-GUID: YlD9oYWaKah8WykH_vDEnUSpxIHV_wvM
X-Proofpoint-GUID: YlD9oYWaKah8WykH_vDEnUSpxIHV_wvM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDE0NyBTYWx0ZWRfX/IC+0DfIz2X5
 S6Z29V/eFF4KjnvecRrYGekSJDOa7USokQcmR5tMUcim655mgBk/Bd9vCdHhTATD/1WYr/MYI/R
 Z/Lgq18mJXq9L1gz5eNU/HvEiPhSfQKJnlgngq+2/Doskuys1oJ4A35e11gfdR17Jlj2G/trRAu
 UjjJ0f6VQgTzliWcvxcjU5uJHZTfVQAmjqUJqf65RKrhsq22h+c5xzTt07vvUDorts2ZUP1R1zj
 u7VfM7Mj22ErFb522vVbdJBetwYTvnCMqxq4MTMERg8Nm1DuWUPMSFSZrkYoCSPua86bGEz+tPl
 kw7yM6uTuJT5vJGi+fRL9SX6387yLGHNLM0se7B1mcnL5iTzlL7lJxDxc+hlJFf45RPbY6Y36cg
 m7w8ut/gCCRGP8nntXcEAAiZGBTERQ==
X-Authority-Analysis: v=2.4 cv=WIwmnnsR c=1 sm=1 tr=0 ts=68a5f9c6 cx=c_pps
 a=L2FU3rW+KndAdfP65H3xYA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=2OwXVqhp2XgA:10 a=s63m1ICgrNkA:10
 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8 a=hgtlENK7A7ftM4Wnj6gA:9
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Reason: safe

The MBQ size function returns an integer representing the size of a
Control. Currently if the Control is not found the function will return
false which makes little sense. Correct this typo to return -EINVAL.

Fixes: e3f7caf74b79 ("ASoC: SDCA: Add generic regmap SDCA helpers")
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/sdca/sdca_regmap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sdca/sdca_regmap.c b/sound/soc/sdca/sdca_regmap.c
index 5cb3048ea8cf..72f893e00ff5 100644
--- a/sound/soc/sdca/sdca_regmap.c
+++ b/sound/soc/sdca/sdca_regmap.c
@@ -196,7 +196,7 @@ int sdca_regmap_mbq_size(struct sdca_function_data *function, unsigned int reg)
 
 	control = function_find_control(function, reg);
 	if (!control)
-		return false;
+		return -EINVAL;
 
 	return clamp_val(control->nbits / BITS_PER_BYTE, sizeof(u8), sizeof(u32));
 }
-- 
2.47.2

