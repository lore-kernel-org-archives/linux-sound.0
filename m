Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7757D3FBEDF;
	Mon, 11 May 2026 14:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778508680; cv=fail; b=VWuOqTwPRDttcmc4ZwaqNbFUvZea4BrC41d/5NuVKBBY0CUJfPxAGHNTwIVVtsKi2NbYSISs9N9ddsv7yHwUbu388pdRDLPPsHvJJoivyV03vLtLevqt+AvsN6WYZPEOJDTYkZIC/gB5vjrutXigWcGnePj9fEEAqMCQ5AA+y9A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778508680; c=relaxed/simple;
	bh=w4p+MW1jNi97iXgWslrIL5a/WOtc2WfXkfkSlzS15tU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N7PX5xOAuBZX3w+oZQaeywzHrcnliWk8U+YlsrA+Jx0sIssb7J5czm0fS9F1mkgeG7Iwr3mfxq5fjTkX0pup+E/swUsPsiqzEke4/h5+srZjFyN588AN5v97XVXjX1WSUfQKmmRBqlX5PYvZEvAcb5mDZIH8jAx+W1XwSB9Xmso=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=SG+/hX09; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=d934TT4Q; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="SG+/hX09";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="d934TT4Q"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B5uSGB3470159;
	Mon, 11 May 2026 09:10:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=Z/jlIzVC/LvVdDfNLltYKonno54PKrDOq23chbP1cqg=; b=
	SG+/hX09vMyG6wtQgqinADi/E7w8B8JPl6rl3ikEZ7P/8CdIqRstSni9ETe3a6m8
	u1xkIp8DWRjZRlEFLHRtjWapV/Oj4uEpxwzfGZvmteygijuVV2aOcBJNKiIuTwwC
	2+c572b9wNbCVwX0B6De3BOXwOeGDRqFgB1Y2lgmCNAAlmBk6xHat+jgh3vlSKA/
	zEl/RwjxHPsqsWxoFYqkhHb5LpOaotxmgxo5lVJSkjp7uavRqxGaqqv52skOkTlQ
	tASj4z8vakgs6DxnOjziJvOjrmEaHp5oMVmANK4fWfc7TLy5DK956K/B+j3iks3/
	hgTBwneAbfnJMQ+i9a0sAg==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11023080.outbound.protection.outlook.com [40.93.196.80])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4e22b0t3u1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 11 May 2026 09:10:43 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qupy6G9GQ5TNROk5dLquGrJDc7eRBZgfXCElFkqz4ZDQsnokinQpXaZCnxppdRinxrvXk7XJB258JA/bweOqKC7nIrKQLbLXoPm9tryIBJKBJBH8TxDdjiihIxKmhuZqOg+04AKnnNFbloCsvdrOT7zI2h+54DBcRWvnKAaeHi8UQzImSordJsE2MkNErWLHPUGpUu3UG3SYHzOIv/eWJ9uB61NpQY0EhuqB2bJaXqpq5oqm6TbVTiP7lENS+qPzKEceoIY3EEk/zMbEC4/VnLdCl1YKVdFC0wWeYITvcIySdize4efagCceovT448Q5ubDITLOguFO+kX5HarKSeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z/jlIzVC/LvVdDfNLltYKonno54PKrDOq23chbP1cqg=;
 b=O48YT3h8+TRwCGyRRT/WCXIbE/+8Dx3t7artbWtpTOY/Ylm/7ciBsb768jOF8ou86VCqg79xvKrKAq0XQdJi2TA/9nANTj/vt02cD2yyEDn/QiLOEKZqaQGCDd6RdX10Kk+DcJJziXcKL2DZ/fTlMBWgj0LDrv5d9a75kskpS69j6BI0icxxvHYFkbyHK/JtsJ4WM74vxkNim/IU2vv9LhxOd1mkYIs6hbUI4xNF0bp53mtTLjIbRvc7z1mQEV1lK4EFqUKt892ZK4EWm8tC5kAQiRHRm3Gw5h3Vz8MEa2adaszqqkUAufIq13VWqRdt/8FEkQDuERScaHugkvqZMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z/jlIzVC/LvVdDfNLltYKonno54PKrDOq23chbP1cqg=;
 b=d934TT4QULooIJUA2JEcqlglxKTkT9j1ooHsQ/hCB2IqtJO+4wEabGS/7rjaQCJNOlo0KIO5l/27EXhpQ2dx2pOBh1hqI5S/TDTF+5JD4B89lH+3dEw9kLw56lriJhJ24PsP91VCIhm0yXVtXi2AIgxKDNklCfvRy0KITubYo8Q=
Received: from BN9PR03CA0734.namprd03.prod.outlook.com (2603:10b6:408:110::19)
 by DM6PR19MB4076.namprd19.prod.outlook.com (2603:10b6:5:24d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Mon, 11 May
 2026 14:10:38 +0000
Received: from BN3PEPF0000B373.namprd21.prod.outlook.com
 (2603:10b6:408:110:cafe::3f) by BN9PR03CA0734.outlook.office365.com
 (2603:10b6:408:110::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.23 via Frontend Transport; Mon,
 11 May 2026 14:10:38 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN3PEPF0000B373.mail.protection.outlook.com (10.167.243.170) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.3 via
 Frontend Transport; Mon, 11 May 2026 14:10:37 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 9BB9B406563;
	Mon, 11 May 2026 14:10:33 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 6C928822550;
	Mon, 11 May 2026 14:10:33 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org, vkoul@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        niranjan.hy@ti.com, shenghao-ding@ti.com, kevin-lu@ti.com,
        baojun.xu@ti.com, sen@ti.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v2 13/18] ASoC: rt1308: Use new SoundWire enumeration helper
Date: Mon, 11 May 2026 15:10:24 +0100
Message-ID: <20260511141029.851125-14-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B373:EE_|DM6PR19MB4076:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 571e8350-5d94-417b-c9b2-08deaf6713d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|376014|7416014|36860700016|82310400026|16102099003|18002099003|3023799003|11063799003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	aVJ39VO9jGcim2Emh7eS5ubQ7f81aXOuZXzzCZj67iaJ5Pt/wUGDQ07cGDWcM3Zh3BJslJN6OTG/tWx3EaXtizQkg3wHqdEXoo2+vtvGGnNXGDzDBENiSzkykQxYkzjhjAffVKdKuUgvU4KxfB0O83P7EsMcnUy3Jf0FmEj3ep2BnfQU2vLh3WiUH9mt878HjHe0n7PvPtIVp3UotlTiPYItax68cXAB0+XeE4bFgHMzNFDq8OE05W1EK4J1FyCm45sUARmfc4BWXWM2F9e6OMtQTehidx94TwPiNXS5IQe3gtzsl+AttepYkx4wOCyO032XhN0lQobYj3Lfht+8z+pjFccGASL1WMEn3bFQBUvLn7TVyVJa69+HC7cpSpopCf7EXIfmtWtWCDmPtNyI7gbGP6ejKON9F9h1dAH7sKLwxD8ja8BrR2wcZ9eIr2Kxv37ji3IJKWbAZ9LD7dAx5pdsQQ6mVYTeeJ5AOxgDIgm/WJMIxNuBeSoXJLe0hmXftzxp0q6epnNj5dZil0+Y5LlwXJd/vYu6QtOVZE1hF3Gb4QmCkY4KisOyZJNZzrUdPbnqbRzP6UiXDBG8Uno+hqCZDVRuNisSMsMp8NKArbx6l4iQQzPJQimAJ7Gu8vO9YGCnCg5DKfLrwtJHSPBdNtyKWbCOAiWhK7VsT8u4atpqhXFM24OP14Dkwzq8ph9YbHlWWRR+JHVWKq0eMB7YRJRhBIrvGaN0rY8q0DD8whY=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(376014)(7416014)(36860700016)(82310400026)(16102099003)(18002099003)(3023799003)(11063799003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	v001nJihZg3hVl46M+wNSyP0DljiMa93tZeXM8j+I+AUDOCGf2yCDLHDOZzDPuaTsJUOXN73nhkailiDPUmWngNf8Of1VN1oe7F+iGkDboFSNN2EWB07qulx3hdKusj7JKuzLEetSwRTuK85r3ZCNLaCXCSJahfLe0tEz/dXjT8OtUac4MSm6qos/RkRyiaEvEYiUueJB44qipSf25o17iJ7l64Rcg+PNS4MWwM6or+6pM6h65mo38dzswWpqaID/wXwha2VQK2CPBDggt5aeMEWxkp8KwDzLpQeHDjPAAd5opn/MMGxMCMFhRjhIJVwr6Z7AzpOlBLOH5HQnb3LgvCBRbS+/dbFBcD49rbYcTuuu+wc+IxenOccS+3oSGtFc4cmZN6VkNqeAMQQ5G15WTtzflE/ZZBrjjVc66EjHXm1AmljjsR2S5v22E/aNaDa
X-Exchange-RoutingPolicyChecked:
	ZS3d/ZjoHZwbeuu4Qdjm9+R/EbHikFCBi1z2WkH4k+C7QyOJPLTWz09LSOaZhsPN3arFiuxDXq3wq/ZkwD2mm443l/m7/RJEk136VLqQ/MCAVXx9sDKFsjK19bBMp/oqQUFVDssod828N07z7UxR7JSFMh50OsiO5wiT0Y2WAOzECFGcyUTe/rvWdOCcOTmQG8L8zaVwuwOvkoU7pDXfpMdjqK3hmPgvqs+VQuGNqp+lkTLxJN1aIq7mIRjTnRVeA51zrbZ16uixyDq6wiu2Ebt07En/Oto5bV/vA9cZitIW0fkPfAwib8oDezs3Ysf07cJlwVJXXGLOe0cERshnAg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 14:10:37.9909
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 571e8350-5d94-417b-c9b2-08deaf6713d0
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN3PEPF0000B373.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR19MB4076
X-Proofpoint-GUID: 9D5f1ZTMTXyj5n1pAISsOy2fYbr7vfzS
X-Proofpoint-ORIG-GUID: 9D5f1ZTMTXyj5n1pAISsOy2fYbr7vfzS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDE1NyBTYWx0ZWRfX7VFkbEYJQTmU
 huESiinc+u7vchLrvnly7Ag+RH1bK9CfOC5ygW+UTYwsaEKaDvycsXg5VGsl1IMLxAL+lEbmQwq
 YILUGjVgJwb+YRT95b58iYElXW8giMEjEkkPbJ2mGY4SQNxnTrXQlZ/ee3lfzl1VbioNXCLXKhZ
 f83NKZoqy8GlFgpxpH3sytYAOqZbIXLq19rvxDlwr+qVG7oOHfzbQi4Fj6GDIS47Y0R77NYEG7W
 GBkHE1/akkUKXvDA8yU/2jXzlVd7MtyrcBCPGsUL3FcHpt26IzDfpxWILl8UvvoBA/Cw97KYWTB
 HqRKa91HELzsn9jRkZnsAOpWwM7PSCXYdyLw6E8uwU1p0CM2y80Og4G+ku8veKcFFb7k+nN/Iuf
 umhvzqoIq3rhtnRS6CPIjly1UhhsB0d9nWWsUVhAO5zMpw1i+cnd0hKpfw9k7flENqs4MNyDROj
 goeSif8wIEpv04uP8KA==
X-Authority-Analysis: v=2.4 cv=UdxhjqSN c=1 sm=1 tr=0 ts=6a01e363 cx=c_pps
 a=/NegMjZZPAh+U+cVAxWD2g==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
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

 sound/soc/codecs/rt1308-sdw.c | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/sound/soc/codecs/rt1308-sdw.c b/sound/soc/codecs/rt1308-sdw.c
index e077d096bc239..39e06a3a75609 100644
--- a/sound/soc/codecs/rt1308-sdw.c
+++ b/sound/soc/codecs/rt1308-sdw.c
@@ -768,25 +768,15 @@ static int rt1308_dev_resume(struct device *dev)
 {
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	struct rt1308_sdw_priv *rt1308 = dev_get_drvdata(dev);
-	unsigned long time;
+	int ret;
 
 	if (!rt1308->first_hw_init)
 		return 0;
 
-	if (!slave->unattach_request)
-		goto regmap_sync;
-
-	time = wait_for_completion_timeout(&slave->initialization_complete,
-				msecs_to_jiffies(RT1308_PROBE_TIMEOUT));
-	if (!time) {
-		dev_err(&slave->dev, "Initialization not complete, timed out\n");
-		sdw_show_ping_status(slave->bus, true);
-
-		return -ETIMEDOUT;
-	}
+	ret = sdw_slave_wait_for_init(slave, RT1308_PROBE_TIMEOUT);
+	if (ret)
+		return ret;
 
-regmap_sync:
-	slave->unattach_request = 0;
 	regcache_cache_only(rt1308->regmap, false);
 	regcache_sync_region(rt1308->regmap, 0xc000, 0xcfff);
 
-- 
2.47.3

