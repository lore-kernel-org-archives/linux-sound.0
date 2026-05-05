Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42FD54949FE;
	Tue,  5 May 2026 16:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777999750; cv=fail; b=SJ82r8V/ASSHEIIma6cHZ8JFlOLM05VjnZqd5YXyNOe8BNYhSKwAVXaXk2M9m1pXAkTD+I33kfUASO4tYHWSm8vMMfLqYNfQ3ESSMru0eqlQfBAq0AN6WEXqVWTzoyRLHbBd/T48UmPGCltnSOkrQ49PJ3bbC839VWTSlu/FdiQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777999750; c=relaxed/simple;
	bh=/15u1Dciz6/tYgi3HLHc3XfDpJ6pnySJPe47YABXzww=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kVMBv6Wfn4YoM95peO90+OAD9uOuLOAgrOPWPKzUqKnnoOjuKn99TM5nxpNuNqR5LcMaJUNuG3gRWt6Dx/noG9fzAlajPmdyYvhSb2AL+yHSO8EYPKHyeAI8NbSr+Q3Pi+bsTySIu38jIjKB4XbIGv7ydYu6swoZa1MmP1xVcXI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=gXo8ZnRv; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=tEFxpqvc; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="gXo8ZnRv";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="tEFxpqvc"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6454H2UK472333;
	Tue, 5 May 2026 11:48:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=+s1VD9cNbZlMQ/on1ehLiKQi8oCjrA2FHNeD0fT1SM4=; b=
	gXo8ZnRvQbMituKDRfQ2nCrg/T2hdAnWMB7LOY1QKd++OteyqNtcFv4J63tMjt9t
	3pX8dKPkUWM7YFOE3uIDH6eSiMJzBol04sERwSXAum6nN5+WU2vPcJNfD5G//Gt2
	fpm93sL/BoSU+xf7ji9U+4DpPvSvWIVZl5QapBGKighT3MXsQc924HTHh78gB2Br
	ONVeRTsYJv2ub3Dvem9cO+FfW0aFj0ALmAnyibmTCh3aIISfp+7MRzXp+KvXf4hf
	sOlL61NDnGmfi+bwIe4SWkMmlOIm4Wj4Z3k+WNms427BEHn6lkZ1i8M0m7tZipLI
	+oLRKOdjIyow+u2SFdp6cQ==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11020080.outbound.protection.outlook.com [52.101.46.80])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4dwdpk45ve-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 05 May 2026 11:48:23 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L+X2MAPoEJndHU38PF0w3NlNSfC5EK/JyyOQGrJj+Tsl8R0aRSKDec1o/rTjIaeATuvSBrzrHh+Xh/SBI1Mms91dwD4ofvsPkfwYdsNJXb2yzn6JJJ1bvvdqEdP9+AE0XsUTadOY2batzBGoSZchBk1hNTJKNj52gaYGhXpKNFu4biSGE3uBrljM7LoetLxhajjyTow9isKcIhRlgTUSDYgIPWYEwFpYuCNofJNPEUK2QBWLP45UjFwPvj9NCx/4fIYILRTryEaiXjnodUyZZLw4+wPOXm6Yw6dULT/MW5CLyRAYDFJLd3cTj8bAamXg3aGR24+BxwKmSzgkz3yzYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+s1VD9cNbZlMQ/on1ehLiKQi8oCjrA2FHNeD0fT1SM4=;
 b=AUMEk0iXrb9uGACIlG1+KEZz5vm5F/HrcQham0PmXzH1hDNPEqS212NXeCHDoeODNTtdkoLey3h8YSuhD6LRkTcx4TzGXccFmlp6riwp/MdZYODF+nOvoCXi1aRJ5jEKZ3MI9iNAOTmsj+57tJIfDiKPGV1Gu7bb+O3ArDb+c8Y8JIPGHIMvxxaBU5nKlvqjwlHM+wgdfEq/OEjmXD02QEczTHVxTcmR7NJYeSmWCBY2laruKNumasv4c0nJvIomqBkOTJMoc2hkeSY2Xb2+Vj0yosXVuPuUlmhjPv4YffCXdA82KVrxZ3q5sSOZyIRMLMZ1QTyFveZlmOiAHwdimg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+s1VD9cNbZlMQ/on1ehLiKQi8oCjrA2FHNeD0fT1SM4=;
 b=tEFxpqvc+M5LieKSQrV+vnW298aGz5yL8BhaUU4syCGJ4gQE8m3HYtwQ949swXm3SbY992qZkCavm6kcmPV/qRlBcPjm3QlAw1HSOXrraiDkVTB7aJIvgfWa6vtqlHpsHirPrQU7EM46B5M5+FpZ0XrZtvLQTTYn9CdxSlUgo7o=
Received: from CH2PR12CA0030.namprd12.prod.outlook.com (2603:10b6:610:57::40)
 by DM4PR19MB5690.namprd19.prod.outlook.com (2603:10b6:8:5d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 16:48:17 +0000
Received: from DS3PEPF0000C381.namprd04.prod.outlook.com
 (2603:10b6:610:57:cafe::77) by CH2PR12CA0030.outlook.office365.com
 (2603:10b6:610:57::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.27 via Frontend Transport; Tue,
 5 May 2026 16:48:15 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS3PEPF0000C381.mail.protection.outlook.com (10.167.23.11) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.9
 via Frontend Transport; Tue, 5 May 2026 16:48:15 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 518AF406562;
	Tue,  5 May 2026 16:48:11 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 1BC1E822550;
	Tue,  5 May 2026 16:48:11 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        shenghao-ding@ti.com, niranjan.hy@ti.com, kevin-lu@ti.com,
        baojun.xu@ti.com, sen@ti.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH 13/17] ASoC: rt1316: Use new SoundWire enumeration helper
Date: Tue,  5 May 2026 17:48:03 +0100
Message-ID: <20260505164807.4108684-14-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260505164807.4108684-1-ckeepax@opensource.cirrus.com>
References: <20260505164807.4108684-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C381:EE_|DM4PR19MB5690:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: a61a07bf-a68f-41a3-3b45-08deaac61a41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|82310400026|7416014|61400799027|22082099003|16102099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	p+8/wtYysKvkKIsYuM3KlOc/Y72/8DwO1E9vPSbKcdQvJ2vGoRRocHIpMOZRCh5ItFLvJUj2jcER3AmbkLx6o5XX9FBFOvrQLAVe7J4g+TjZiMfA9mcBtUasR0XaTW3eLBNT70ZPc8V4J9vbUseSGEGemjjKKMmhbAohRaSHbHlnejMSe890zOUX6Wb/nfpuq7XpmQ97R9Vdd8Eh4c4KSgr0KISZk+zefXftXb7e5S4n1VWjd5e+oOwqwm0Uv/QPs4CR8JPAr4MBb4uSlG9ewBzR7JL2aLA8NKGf4FYZLTAx/eaiIo2Z9R+mghYCoA/qrDuteziJW9XS5BkdrIb/2tvWW/Te5igLNDuj0hIfx+d2OFL1oteaoOwA/v/dfoSd3mceoRLT5MMn+g+ef+8Bvx6Y08p2UDhwbVmebhnj4pQ0kBf+CV29jvYuEFhWb7Cb0POBOGc8XO3nltaEGwrCCMVq83PcB5uL4TQt2jx3LJF4CzTea3RviCG1ZeXbPsmFch9l6B6a0nQ3rW4E/Qq8nzzhS2bbzzVdPPCS8KVBxcUIrqBwQbHFA+hTqEESQJ7IrKq+8ieeRXYt4dHXFbSktY3CDwbcBTadwS0tnUUbLDybv2bQqnLHhdRme8FZTFj6rS3zhnD+8Q7ZQllisOZ4BzVAZwl0zEcvDW/qB2NIojItzQ3mlO3l0nVeBT5iEakIeFtDvGImvewjeBXaLHK/E+URVOhxQPz++csqO9p5eR4=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(7416014)(61400799027)(22082099003)(16102099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	itlsGA1lZb0wOo58DPCfLTtzeHxTIIJ9WSEOT7L3VBYLSh3bXqNfurgkbA7cEFx9E1B8txduvnOzq1SLzCWjQxmTGs4g52n4cXFxzYmWT7La/+xuFZVpzYg2X/4J/YMxdwY5CALAL7X5oYPVAmBYAVeXRsiT8wW6fjUq/KWpipm54ZG0m+Wkeg2XLKaf+gGjkN4MTo5WNToUC3whFSfJCrpaNQ6F3KSKbiU1Sdyu1dHv1bj5aZSjrz4E32ePxznd/v9ikXaSCquJmeUOgFjqkNjjoGdHWNpI+2bOtJnvB6cwRkt/heCbw9cXMPmSmiIiQUYmQJL82Pen/XGrJNr8aWwst65IsawM6CxThqTW2X9HG2dFfD1b/0nJfHJWH3bercDV9FBCy4IbOlq2pOfWcKflAdTlai9SZY3IfBvpyacde7K+dZQIogxUVFV3bIPJ
X-Exchange-RoutingPolicyChecked:
	AF0Wx2rx4sMTzZOrfMmQ8hpmdB+Oux0XxMf+oIA8dpdOr1Yfpi2jg9fOL+AyujIxQcm+Tx5a7WPUW/zYX0RSU/c+SZiwFK5F0Qp31+qsn4WN3s4L3mjdkljt0G4M+5cLZFH4JolvLAgTzUroFMQ+vSz5slP2oTAAbQWTlzY8fyK2EpGrXHCDu4xKHCth1hWJ3FkFHrYM9N1eRTlYSAiIoIgsQVbCCU0dRbOV5vGSlOR3Nl1YZr00d2fjskcNllc3kYl4+k4vg5D46aV4nz6ICxIJXJ6xTVAxDIrrv5HWbUsY3HTwZCLgx6EGXOe0QPFawuFFD2/WBcrHUWk5iISTWA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 16:48:15.1148
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a61a07bf-a68f-41a3-3b45-08deaac61a41
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS3PEPF0000C381.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR19MB5690
X-Proofpoint-GUID: JnFWG6Mzo3GsAaAlD7-K1LiuKDKVl_f-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDE2MyBTYWx0ZWRfX5FEmxWBlDWFa
 Y7C5hc1feqhBWm0baM8oMD9Goez0MBMpkzVD7UikwsY5WCU/y5YbNAcd5gUW24MbcKA8We6/jV/
 BhKJAVfwRRP+Ge4P0vLi6RSKRZRif9zUirUnFndEb93+mK89Ks9azOBhOAvZsntWbYz4fI7NmaX
 SUC3BmHablMYNvAxtIBD/z5Sgd82UgHWDZa+kDeUGggE6GmmhNCkU9rS+A6lx3SBWIAIeyAHU3C
 VIrJIFjOGyv4/DD6TV5m3lwh5rXtiBrls2R1nDwlvQKE7cH++pBxpoecq9D6b9Ij0vcOia26Fio
 W1rFUdhiGo5OMazBOD+TCvC5yxUHzXRYc8e9Ao6CILTt1VDfl1csjX8gdv0LCvhfwEBDhLEaT2q
 kCgAvYsjhhCT/inuppMY5gEXCckzjjX6+EqxPAX5SYH8ku/EY8/L4jPNq8C5QbKbCWpTb0TDnGE
 nYTdBW6b2H8TJb77s+A==
X-Proofpoint-ORIG-GUID: JnFWG6Mzo3GsAaAlD7-K1LiuKDKVl_f-
X-Authority-Analysis: v=2.4 cv=LZcMLDfi c=1 sm=1 tr=0 ts=69fa1f57 cx=c_pps
 a=mPoTjFGc+mEQF3C7Fih31Q==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=_kLIPOSdNJ7StitxxVsA:9
X-Proofpoint-Spam-Reason: safe

Update the driver to use the new core helper that waits for the device
to enumerate on SoundWire and be initialised by the SoundWire core.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/rt1316-sdw.c | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/sound/soc/codecs/rt1316-sdw.c b/sound/soc/codecs/rt1316-sdw.c
index 20fc1579eb9cf..1828fd9d5af6a 100644
--- a/sound/soc/codecs/rt1316-sdw.c
+++ b/sound/soc/codecs/rt1316-sdw.c
@@ -745,25 +745,15 @@ static int rt1316_dev_resume(struct device *dev)
 {
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	struct rt1316_sdw_priv *rt1316 = dev_get_drvdata(dev);
-	unsigned long time;
+	int ret;
 
 	if (!rt1316->first_hw_init)
 		return 0;
 
-	if (!slave->unattach_request)
-		goto regmap_sync;
-
-	time = wait_for_completion_timeout(&slave->initialization_complete,
-				msecs_to_jiffies(RT1316_PROBE_TIMEOUT));
-	if (!time) {
-		dev_err(&slave->dev, "%s: Initialization not complete, timed out\n", __func__);
-		sdw_show_ping_status(slave->bus, true);
-
-		return -ETIMEDOUT;
-	}
+	ret = sdw_slave_wait_for_init(slave, RT1316_PROBE_TIMEOUT);
+	if (ret)
+		return ret;
 
-regmap_sync:
-	slave->unattach_request = 0;
 	regcache_cache_only(rt1316->regmap, false);
 	regcache_sync(rt1316->regmap);
 
-- 
2.47.3

