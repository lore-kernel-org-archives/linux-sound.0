Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3969C3D330D
	for <linux-sound@vger.kernel.org>; Wed, 25 Feb 2026 14:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772028149; cv=fail; b=KAXCp3NX265b22DNCrMUgOD/SJ312zlBHjt97Q6q+Shd8hVsfJVY9JHBPK/KQZYtdWcak1MLhF6qlLxn2jNKALyQ4tSwa3DRJxugYTc3254ALByCX6EcWPtqcXpNkNfZC7o77Q8QbQuCr38rk+rtvhoQsKJyP5fIqFui5GI2eV8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772028149; c=relaxed/simple;
	bh=KVEKkQFzSPjNQJhx6q6UwR/EOZIuo6IOZi4+J8sc8Xo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K6lgz/LeN/F/6H7waBe7JaXuLuyFzwlHlWPErof7mTF+/OedAeMDJNNbeRL4yNPbs+AA8HazbFo7KvbCQXp2ep50JwKZPo5Sq3mJ/gL34GXfJjxrB+RkLPTYTz9ZTPa4ZC2LBZnzAxcdT9ixXiqpw7qTgi6Q940dk5gGV9RhlL0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=ns7UAAQC; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=vpkS+ASX; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="ns7UAAQC";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="vpkS+ASX"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61P4Tn1s2226559;
	Wed, 25 Feb 2026 08:01:26 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=OcxhHlX9sCVxPadjxoV7F+xWj9eEQg4DSYmqV/wui/Q=; b=
	ns7UAAQC19+I/TU9rOR7OAzKMTocjC3Hx7dMef13g3NK0NPKSwvlX3Ufuzo5Wp0Q
	f+cyUUPoijewYtM1/NKVzl8HY9+sZxIT2x1mBZZmI0rcme+TWPNZiN55mG2GRJKF
	DvFOvjIvswuWJsCqiHcmNxGsvp9CRDtsgEryiRFqpuw+aM+vlIgD0vfzgusSdlmZ
	apWd5uKW0g26GLyK1x29jcr66ebvm7SUGTsbQz5rXZmENLWWIBvHCQhdCiaq/HrR
	BDPIrtZct4AyOUV/1mVyiBPXcWy50IS13XYges8EfNdf1zNmcQ2MfGedw8fPgw7U
	pJE/elet2iRSIMP5z1arcQ==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11020118.outbound.protection.outlook.com [52.101.201.118])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4cfa0j4e6j-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 25 Feb 2026 08:01:26 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XpnsVLP7W8EpmzFN09DJDuDQRezsmZsm8ut0yBj3ROfvuuR28OHaT3+lzFKRozHQK6cbDrW12glhByGSuQ9JWifjIrBGK6FLeJaEKf080HrcA/n5c756s5g75YsWZik+HbDvGi2OUUAdcVfeCqtzuRgBTnnizM9BUHjVKMOPSsv8RiZl2O3RFT/WYJqBzZPx+Dj6leIjHH9k+PxpapaoyBjIDTpaOaaedkZOtPfqNmGHdfG63g/YphUY7VpPOMLPY6mhENI+yLn5o/GCSnRQfrK9pFYalHNAxZS3FJKTKWYy52lswDqNkTqY/GI/3qtFSVhHA4JCCri3kFxxa1PEUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OcxhHlX9sCVxPadjxoV7F+xWj9eEQg4DSYmqV/wui/Q=;
 b=S09v/3Au+0FBb0+GdyqbJ6zcNXpqyVzosi6s1Ff+j9zLK1z0mgOqzZRAgoF1u9oUxFM8/QBNwAnq0vsdQvK+Mdd2lJMsJgZNREMlYFeTQCGNvo6jE7EupN0MOdRnGiOEo5TfLYjHP9KC76+KVJaKGfD7jB6/pdZX3P0LAIHy9SMaKrV/rtApWeika3ITuy3Kvp1MeFx/VuUg61g8OcKMrCqED0Hx1XcYC2YT5Ff5kt38PdS3ojhSjTnm0ATOjIR2FNgUJ8yFZ6sK8o5JqrBy487j836XhfLYGPscfd9gE5Yzu1hnZ4+rnHcHfPjOJo2/aWH845pTmmLaQjqoK+tRDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OcxhHlX9sCVxPadjxoV7F+xWj9eEQg4DSYmqV/wui/Q=;
 b=vpkS+ASXvQVJCzcmGCmK3XO1sE7SOTG1fkNqJ2lvziBZWzkMe3gdH3hHsuwzAA1B5FOQiLMvvSCot8LwjzkFl8uUdpRLb9vxPunaLiL+soZV5wWN/LMaNe1TDxiWRCXQUL/DvjdrhyfFPRhCz698mv8fnCnMqJkRouFaOLllSWo=
Received: from BN9PR03CA0197.namprd03.prod.outlook.com (2603:10b6:408:f9::22)
 by SA0PR19MB4427.namprd19.prod.outlook.com (2603:10b6:806:b5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Wed, 25 Feb
 2026 14:01:23 +0000
Received: from BN1PEPF00004688.namprd05.prod.outlook.com
 (2603:10b6:408:f9:cafe::e0) by BN9PR03CA0197.outlook.office365.com
 (2603:10b6:408:f9::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.21 via Frontend Transport; Wed,
 25 Feb 2026 14:01:23 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN1PEPF00004688.mail.protection.outlook.com (10.167.243.133) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.12
 via Frontend Transport; Wed, 25 Feb 2026 14:01:23 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 4AB1C406541;
	Wed, 25 Feb 2026 14:01:22 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 26C33820257;
	Wed, 25 Feb 2026 14:01:22 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v2 1/4] ASoC: SDCA: Add default value for mipi-sdca-function-reset-max-delay
Date: Wed, 25 Feb 2026 14:01:15 +0000
Message-ID: <20260225140118.402695-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260225140118.402695-1-ckeepax@opensource.cirrus.com>
References: <20260225140118.402695-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004688:EE_|SA0PR19MB4427:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 71e4c52d-b7ad-4ab3-3593-08de74765c3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|61400799027|376014|82310400026|54012099003;
X-Microsoft-Antispam-Message-Info:
	u0+tzigOEWugsjqPSMGDeA7+QEvgEEnCvQwFWa4IM4brvF0YmYd/oBzQs7FjnKe7XZroO5a+BuRNEE7dMovBktd/Ws2JpAVWzt26V2glceIs7oDXFx6SAKCCdm51siZPNW42Hrp0+wHGOIDHsINAsu1i7xS2N3wvrRImAKHBieexT3Gf3s6FH2DVAgfJkPwTitUXhPtKuyijnUZNRxHJ0ZGwElZ9/7t4zBwBa4wH6QJcdT2btCUUrWTSoQx/oqziqpnUoEuyos86DDrA0K49XWDOvPgmJlo5zhGXc5eljWYll/OxoRq3wiwRfDxEILYUrDy3OFcYUoHszuqmclrHQj3WxqLFIh4f4F5INg1nt6TkkPAV0UhcgEr5zvJ88V8Nl+Lf4guVNHxFx61Kpx0zWuQFmyfpI60M9nGHQhi+kCzf43GoVBkSG2dNEfHuEFqQz7pPeD7wibNSxacm9ncCunNZZzSnXQq2GunwWIF86BBAlo1hSTxts4/NXdeDbZKU1P2kRrnAx4LYGE/bEvS5vYSYp43SKH2sHCidN0DOevPwltdfaZP4OuZ+AUQTFGFjlOzBMxoqVVzZqC6DXAS+uBqe48dIsTzIZLZYDCiEE3tK5z8o313uuFsjD+O+iiJNT69MiiKEGU750E01G/M2Zl9O8hIZ2G2aAW7dfpZBsR/pLyOp/YfhKAhWy2ExLyVVSt2+hQDfQNSfhbhguAIrAJPxh+zTV6aTopnkPRqJbyJaBnxEo2QQ0qpkbgOwiwLncYQbLDyPE8mZmkZNOFkiJDT5XK5XjUiT1TkK3LLTfz/v275rcJeX7zbpnsRKS1PjgeiupfAAaeE4IqbT1ipkEA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(61400799027)(376014)(82310400026)(54012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	E+uTbw72L1gkr41YL/kiq2Y6J3Yv17rXeuS+iCwgFWIEVMtY12Op5xOrBt53Y9ql1omXLEaMBuWN3SHsuk53fy0Do+gPBraGxil/T7DxAPxFg3zQjMiOh3pTEasuz0KFIMMur2ulVw46X7wft+06EjtowEuRMJrdeAoDe0hzqqyOXlFNFnvyFx3gLP9yJhJenQ8rEgk7eULijtB2v1cGe4MHpnTNlOVtnVG0j9E4mCSkDbUSVufKf+rh6GRwso7nAcW7UQTef+0/4O0EWunS4UfjprCylDLp04DpZyYN4u7UiD+mFFuAK9U7f9ynSWkyToQ34fefDIW6Vq/rCLCuCoHaC5rS9dBNXhtTiCrAvXzvRJRGbVtmLmrdntZGP+n27Ac+PANFskgXB7Akn86PF4UPu24i1a3q0HneDextfME2J26o6Hcp3aBNfAyR6PKO
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 14:01:23.3400
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 71e4c52d-b7ad-4ab3-3593-08de74765c3b
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN1PEPF00004688.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR19MB4427
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDEzNCBTYWx0ZWRfX9Qv2voKdHRM1
 jOzcN5l/+5QINVRwBCx0PDXDSDJ0IIC5SfgjZ47RxmX1fLpWKjKdAekaRmGArZUW75sD2zQIu/w
 zDAwunDYkXEFtN7yEAj5jMI9bndabMyaW55FM5tMBDFwPIGJry8JLETj7FBO4Lk2J1fsHyJd3xD
 dsR+Mh4RoEeMO7Vu8+XTv1ITxhNbqz73L4xnB/NiM8HkQAhGB1m5RdiU8ArCyd2iiCSgYSMyUix
 INZ3jFCVwVxbTrEt+L+VdNLzmvrmTViwSdOgOXvJMAgl8J+XovFl80T9tuJ7MRBzF6zZzZGy6mo
 gyZeeMoZLw4VJTNWVeWotm5AAIgHczMbLSPFvM09fJsY0md/+wy9+1pVcNSPXPUMM6EdiOFavNo
 H4pXmkGSihliwFkfuaihX7cAzfcXjJ5Jwh+J3AunGL9A/0z4r0IzPI/PbcYW3BeNHaBONT8dGGI
 1PvU6Hhcab+dSc8Tmug==
X-Authority-Analysis: v=2.4 cv=Q/7fIo2a c=1 sm=1 tr=0 ts=699f00b6 cx=c_pps
 a=daxDSgogzWWW+9bXC0Fifg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=HzLeVaNsDn8A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=htvLyNKjiG02CUU49GAA:9
X-Proofpoint-GUID: RwWdElwYA0LBOe9sbvzM15BX4xBBwWSM
X-Proofpoint-ORIG-GUID: RwWdElwYA0LBOe9sbvzM15BX4xBBwWSM
X-Proofpoint-Spam-Reason: safe

Add a default value for the function reset timeout since version 1.0
of the SDCA specification doesn't actually include this property, it
was added later.

Fixes: 7b6be935e7ef ("ASoC: SDCA: Parse Function Reset max delay")
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v1.

 sound/soc/sdca/sdca_fdl.c       | 5 -----
 sound/soc/sdca/sdca_functions.c | 6 +++++-
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/sound/soc/sdca/sdca_fdl.c b/sound/soc/sdca/sdca_fdl.c
index 07892bc3a44e6..994821a6df617 100644
--- a/sound/soc/sdca/sdca_fdl.c
+++ b/sound/soc/sdca/sdca_fdl.c
@@ -46,11 +46,6 @@ int sdca_reset_function(struct device *dev, struct sdca_function_data *function,
 	if (ret) // Allowed for function reset to not be implemented
 		return 0;
 
-	if (!function->reset_max_delay) {
-		dev_err(dev, "No reset delay specified in DisCo\n");
-		return -EINVAL;
-	}
-
 	/*
 	 * Poll up to 16 times but no more than once per ms, these are just
 	 * arbitrarily selected values, so may be fine tuned in future.
diff --git a/sound/soc/sdca/sdca_functions.c b/sound/soc/sdca/sdca_functions.c
index 95b67bb904c31..a0aed95c76345 100644
--- a/sound/soc/sdca/sdca_functions.c
+++ b/sound/soc/sdca/sdca_functions.c
@@ -2167,8 +2167,12 @@ int sdca_parse_function(struct device *dev, struct sdw_slave *sdw,
 
 	ret = fwnode_property_read_u32(function_desc->node,
 				       "mipi-sdca-function-reset-max-delay", &tmp);
-	if (!ret)
+	if (ret || tmp == 0) {
+		dev_dbg(dev, "reset delay missing, defaulting to 100mS\n");
+		function->reset_max_delay = 100000;
+	} else {
 		function->reset_max_delay = tmp;
+	}
 
 	dev_dbg(dev, "%pfwP: name %s busy delay %dus reset delay %dus\n",
 		function->desc->node, function->desc->name,
-- 
2.47.3

