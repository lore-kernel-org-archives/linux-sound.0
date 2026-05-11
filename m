Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F9463FBEAA;
	Mon, 11 May 2026 14:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778508682; cv=fail; b=USBlgz3evzxkllsu03SxbpfuTF0IZqEXOKJ5u0gapsYLOTa1VbrVFqOoZDuF956n2SeIKeigpsz2LhiXEsOtyoZwhj3ky5/7Xw4tFysvA70na0GwLRfNJeUI70TLOdVv6w9M9+tmwOcKR+TmJWWgMaBvKbp2o3HUNG5khoMBEK0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778508682; c=relaxed/simple;
	bh=5rKsY5MN8cMhOY00rivGp55QG9Vh+YmiEfx9+Xm4fcU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=E3m5GmdYP1QUP1iSPP5P+4hXg3M5OayGekNIZ0noZrBTSC/1TuOqC8xq2U22Ef3ZGlDQmo81czCYVIDqxpDJUdsQMgzg1L9AXG9W15uyADTVoG5gHsbYY6UJtVDo1D1wk0looUxy+8uQmnhJss7HJj7/MpwVWZK3LufleaEqEXY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=ZrSG8fIj; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=EaSnjCir; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="ZrSG8fIj";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="EaSnjCir"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B5tU0P3468705;
	Mon, 11 May 2026 09:10:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=iOP4/WZ912b9C/nOy3A4pNUrXSMNYf1QvYXmg4PqCDQ=; b=
	ZrSG8fIjL872x6IgEMsYwGm/GDMnxvE2b9zfWocIhnSb35Hw7qp9NB68szMCUt89
	Wcv75U/T3/XfaprE3oEnmto7WU0s+3mJwxVufYzaE+kP19CgCWZtGqQMIQVLSOAY
	nK2fSuShccuKccbtTKs5AoGpt3P25AZL9OXn3aS6UNXiQr7SNMUNLGATItNzAmrE
	xvKmjyOfHIj1NWeBzEbT/nmar7vUONLISP0JEF+gEjyliQV43AlRKwzI0US2CFNb
	+CS/Ys7sC0UmqzNV1oMd9vdJS+B2V5C3gW642rliUvd5KMiF0Bg3ks+py/Wg/G0d
	JFR9bbbeGMERzTz7Bhjs0Q==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11022128.outbound.protection.outlook.com [40.107.209.128])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4e22b0t3tq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 11 May 2026 09:10:39 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sny67JiJSQ7Fp2Lya2oDzqfIJ89OqnPHwIhIxlMPZhyLy5r6/tbV8BR7Fd58UNm6bsRr+tUScKcGsS9p4c3l1jZtIcSWXfG8a8x2u6Pfhaqfch9xXtqdgTFyOfwWOWk0EXEPjIj1yCgMJaeC9Z9dHHRagE2UuIVo844GiRlvHyIdpUxcTZgXEsFbJOO9x3scuH3eCUZX9PHljIEpaAYOZ2X3lyY0gHvff8bGQ2ZcL7JTQDpbd3uXf8lBVIfmHZvH9vSsRHGdkdhX7edFcdFailTkDMN+F5sNPOM4ZmhL6jGdRQexvhtjhHEhCeSbuy/vGCineRELfKy+RArZV4+i1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iOP4/WZ912b9C/nOy3A4pNUrXSMNYf1QvYXmg4PqCDQ=;
 b=kfvHa/DrgsC1jRHUQ4DW1J/G+t7pJd4uOVQdQo5lNBchVaqxYABhwdNx7ALyeSJwtRT1eWcnGw2xias8ylckGsKerlOnFf7fvG87cBm4pgYCCsVZx9fV+j7ifOLDRidT0BIe1d2k6I+vXqgJY2p1RQMZCl7D5jn5zSgsJo9b8gxrBpiJJk8FwNfu9pkm9RC4azEigxIq1XCBKKT0UDwZ1DNizCL5vcehTqWL0u4s4cMsJ5xeosppiO90djLAYOjVIc/IeNanESCl4cWJ45c5+SfDzJhvrwvyVFXLDHRmOzzKOt/tkvbBO8nIY0o3Q3wAmWNllVj11ondaR8FrMf4JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iOP4/WZ912b9C/nOy3A4pNUrXSMNYf1QvYXmg4PqCDQ=;
 b=EaSnjCirxtBDp508P39Rh4igHFBZ4xg3xEYz79sQWsexK/+jF1KfogMmTsdTSZ78S9PKFLepb+nfz8+egEFqQYvqhpFUJ3KfKYqdeHmE6RyY8+/JhjAkeLU5MX1qyNXJhJm6YYxPUMww0vtPxDSJLGquXnnGn7shUFlZQI5WCJ8=
Received: from BYAPR06CA0003.namprd06.prod.outlook.com (2603:10b6:a03:d4::16)
 by CH9PR19MB9681.namprd19.prod.outlook.com (2603:10b6:610:2e1::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Mon, 11 May
 2026 14:10:37 +0000
Received: from MWH0EPF000C6184.namprd02.prod.outlook.com
 (2603:10b6:a03:d4:cafe::2d) by BYAPR06CA0003.outlook.office365.com
 (2603:10b6:a03:d4::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.23 via Frontend Transport; Mon,
 11 May 2026 14:10:36 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MWH0EPF000C6184.mail.protection.outlook.com (10.167.249.116) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.13
 via Frontend Transport; Mon, 11 May 2026 14:10:35 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 852D9406559;
	Mon, 11 May 2026 14:10:33 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 4A2C0822544;
	Mon, 11 May 2026 14:10:33 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org, vkoul@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        niranjan.hy@ti.com, shenghao-ding@ti.com, kevin-lu@ti.com,
        baojun.xu@ti.com, sen@ti.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v2 04/18] ASoC: max98363: Use new SoundWire enumeration helper
Date: Mon, 11 May 2026 15:10:15 +0100
Message-ID: <20260511141029.851125-5-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260511141029.851125-1-ckeepax@opensource.cirrus.com>
References: <20260511141029.851125-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6184:EE_|CH9PR19MB9681:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 37557aef-e689-4c77-45c5-08deaf671261
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|7416014|376014|36860700016|82310400026|3023799003|11063799003|56012099003|16102099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	s4Dgj5qIpGdJ/24O1Ymz5TgMWk+kLwmEvMxiC8IVVltU20wxh0O1rDo4MG+OYVniWrL5bkB02I+Jca+DJsJCdFIwMxeAqA7apLR1dH21I7A0IAAdSQPkBYyH4wyLzefJhexicMWAby6g26GnCeFCyT8kO81bXHmhZdDFJffQ8ULCW/ouRRBrvL64YeYdG8psi9dbH8I1xqGBKXR8mGQ1GXDfQCoKJv6CVP7nU6LlP2tEIfU0MXAlF0ISfneyI/Fk5yPsT42S1nTUsCOHAmx7IlU/M0X5Pv+dOLRju5neefPVGhUe6HTHiZnoRQl6Bw48s8+GPK+OFWZyqh6rfGX3FOZcHZyIqvMILGr0ZrkweOAeCQEvu2eXJpr+9XXN8SHIE22t+ZR16ah51Z6mCmKb43xlKnCbIXiX+IkdzpKKZoM6l4pIhLGPdkj3gNBugt3kiORtz9vNVX05HqtsjmEK/8DXtF8vTWcuphbK5zolpEBJITZvM3a20nPDNZ+JOg7qwnhCGDUDzJscV8zDzziAxSXsMaN/qgwYPFUx+vVk40Bfs0GplR6OJp4VYXJMj5U9b4Nx1vlSMjCvUhv3XZPjay4Ag0xKmpVWDcxwR2F4ybMVIiEVDBdWjjfYPGIuxeoKFSdfIqItH8NAC205V9tSRpbczPdFkXyrnjoUdot3quJtYALcFS9Ojt9BWJ1U00n11si98ZxsFiz//WiTxLGKpEkmoFuU43h/VnB9AAioaoU=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(7416014)(376014)(36860700016)(82310400026)(3023799003)(11063799003)(56012099003)(16102099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	XwJpSrBtHXQW2ry9PN6GGb2o6XqVPkyKwo+BiXb7ibCZ1WSJc+R5byZbqVO6vkbOGlML9/X/86STUHnOcRud73zheurCndp8TfkjeX2Iom17+ELHaqLrrWeO8pjBNrv0gcrvA0m2/JwTmbvDX+VQJ3t1gLdKoMy6rWFFAkGYAFKhBkyPEHGDfHqb53WOOaE0rlIWKplg76Q0hBKZ0aTiOa23IyiKeppu1LAX0QPL3E4d4XOLbmcV/FAAy5TX5KaRH3KrMY9v+GftELwdsE3C8vmNII+i52ZPwiYlbrCCnSE2a/LglTO1I9aF8UcwifsUz6Y9RsH8ViZwbcrN7FLNj3o055Nmwt7S3QEkinZGuq1tBoH0IW8kn1DIkYsDkHel7ZY3Ev+VOgPpTyFuaf5lwKig1H0ahYbkX/Z4jzQWLtJA8IqAz7A+cH7mnNzHkYbC
X-Exchange-RoutingPolicyChecked:
	XnDLntIsIfoPiZ2zEz8wg65N5oGwEQuu2M0omUbkAWReNm94Y+zVx/P9HCKMArreivG0aGwoC0jRby/knGXsQ4lIjdkQ3rLavyOaJipKhsFw/fTvYVCmH/1hYsNmdkY5rjyO10BmxQawkhD9F3E8AhJnB2PO74aDx0fZFLP4eizkPAj5kjT+6K5kQ54Cxqmlv7dGHuPdSx5eSHocPGqNd3PnZ7dirf2qHAVxKmYWzlgpUI6lDBp5iOLY4aRJNbD6qCP4Xnq64dO7KLQZwKLladATvIRa+PalHy6WX99nwCjt5jnYalUlQcmR7S48SvSxYqWQYkD2vPhqmFwkK7OnRw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 14:10:35.4790
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 37557aef-e689-4c77-45c5-08deaf671261
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MWH0EPF000C6184.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH9PR19MB9681
X-Proofpoint-GUID: Kf_WqZhduCAqjyQo_SqA1l2VvNcy9d9R
X-Proofpoint-ORIG-GUID: Kf_WqZhduCAqjyQo_SqA1l2VvNcy9d9R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDE1NyBTYWx0ZWRfX7gxCbSBthQDJ
 nhOqKgctCkBDnbiCVdGe9UiVdIo3jQYvhvXg2JMLsztR1MD72UKTZdPiIITDmJ3uCPHJtoGWBMZ
 /6xxyBA5JYBnqhqla/tyfLGquD00HOzIKQhHnnb/4hJ14u2RAEPMEIGT3HQ1kQ9gCtwosL0NU30
 wo9SZxDI1NKicXaU9F3wKwGV6wsqc1LLyZgMYhg/qIrlWYCOH2gYjH7j7ShDr0V4am1rPp1SOCd
 pBPj3zn1+lOnKhHORsOsa4PQB8zh7Huq+VxaCEf1otdEr2JeN08yrloKvlkIFOWV8CF4jG/WqFi
 LSlWrhe6jbO2rRwUPIiLzHtgp5AcIFcbRHnWXX8dS1KMkYLhA+OniTCFQ4g4vUppjXOqPluar0+
 X3iOy+b7n2Kja4BGUnBc7IdYYujRLjEaBHp1sX4qb8IYoExv5PrKF2nAJ++KVafzjX2iC+vQ9Hc
 ZMM9ntfJy17FUtLLwwA==
X-Authority-Analysis: v=2.4 cv=UdxhjqSN c=1 sm=1 tr=0 ts=6a01e360 cx=c_pps
 a=0+3OdmKon1akQe5K8yjQVw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=_kLIPOSdNJ7StitxxVsA:9
X-Proofpoint-Spam-Reason: safe

Update the driver to use the new core helper that waits for the device
to enumerate on SoundWire and be initialised by the SoundWire core.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v1.

 sound/soc/codecs/max98363.c | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/sound/soc/codecs/max98363.c b/sound/soc/codecs/max98363.c
index 25af78ab30d5c..099dc5bf6195f 100644
--- a/sound/soc/codecs/max98363.c
+++ b/sound/soc/codecs/max98363.c
@@ -90,24 +90,15 @@ static int max98363_resume(struct device *dev)
 {
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	struct max98363_priv *max98363 = dev_get_drvdata(dev);
-	unsigned long time;
+	int ret;
 
 	if (!max98363->first_hw_init)
 		return 0;
 
-	if (!slave->unattach_request)
-		goto regmap_sync;
-
-	time = wait_for_completion_timeout(&slave->initialization_complete,
-					   msecs_to_jiffies(MAX98363_PROBE_TIMEOUT));
-	if (!time) {
-		dev_err(dev, "Initialization not complete, timed out\n");
-		return -ETIMEDOUT;
-	}
-
-regmap_sync:
+	ret = sdw_slave_wait_for_init(slave, MAX98363_PROBE_TIMEOUT);
+	if (ret)
+		return ret;
 
-	slave->unattach_request = 0;
 	regcache_cache_only(max98363->regmap, false);
 	regcache_sync(max98363->regmap);
 
-- 
2.47.3

