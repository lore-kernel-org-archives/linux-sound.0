Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 373C8494A0A;
	Tue,  5 May 2026 16:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777999748; cv=fail; b=ME6G3ltPkmxAd8pkD/yGPUMLob6oKmO+BgeTC6flLKwn/WilzY5Jfro9xXS3Oupz3HT6mIpsPIjWw8JKq7HrHEESs0pJJHNVieIbU/FJGD74YT+DHi3SXYbehBf3fQYWy1ngFKsQwvoe9DIcGDseNWSP7f1MaIPL0IAKloqGANs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777999748; c=relaxed/simple;
	bh=YtC+NLg/t6lPVfOdbpRgy04x0R0Rv/gz4u7+GTkh0KA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C0jF7GzqheygDny9cpQlb8KfCh7EV145+exVPLkruk3Adcn3wZJp/BHXVMMZ+h+OphWiL01QxSq88+0oB02VsVWYojbGfB4mVUd6tv2aFotVPJAY7gmIiDZHMeRgdMvhp8PB/HCUv4H6P2tp1uMSlDMaYgm9nsMj/IZ/dGZyWiM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=IDazX0oT; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=SF8xw7sX; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="IDazX0oT";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="SF8xw7sX"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 645478YL455970;
	Tue, 5 May 2026 11:48:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=cvmPfAZTt6KeF53aB9CkQ7TSPU36v4ub/MEglp9hbhU=; b=
	IDazX0oTQbux2xuIoC4ZKI+m0WiCYR1OR1wqxHv/E+aAiLQj+x6iCfrgDImXq9qH
	0zZvoiZU6kV092xRtc+8WNiwpY6+kX56Uu0F/nnb6cYVJytlLaH9ue9w2RKPMGGy
	OZFwIs7sBB5/DPfuDWTTtSfEQtba9hv4YzHdgDzxUtXzAGXgfZ8DwMsYj9Hzpo5n
	GHk8VAbZJOiSsHP2HzqclWG36oLnBWVpA5P35k3G+0oJYLOtUj6Jc1Xft5WCeJdp
	vJ9pKJ1XurWpUtrXbPNItYQIbGrpPXJ1fz548CBq/nwrWDE26MDSlSc3naaefSo3
	sRqkFKJfYDYwvIuzWQrHbQ==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11021135.outbound.protection.outlook.com [40.93.194.135])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4dwdpk45v5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 05 May 2026 11:48:20 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VNEbHtEVKADa03u/ZH9YzvRtQ17qH2Iun1Zv/3bpLHm1lHmtpcn7pbmXtWQr4RkeL5st1RM4JIzvoOog+RTviiEc9qmrvBs1XB/dOx74kpu7toyfjsvq8ky2PadrDu4+IdU3eIMuq6F8k5VlAZqUJCpNvX0AxBXtpjSWRlmSost5hHuR4afh2c+67fNTVLCl31iLhWcEDUGvrjQOWzdlga/+2MjeuzArejU1UPFVwGzcG4/JFnpCgQIUxhzBNs14BOrL9D4a46Nyp1W2mov1gI6BwIIzj3rRwme1VeyXiDi/i9b7PdeXCGanhz9aJsvI2WztnEuUoHn9EIppPXI17w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cvmPfAZTt6KeF53aB9CkQ7TSPU36v4ub/MEglp9hbhU=;
 b=kHT5bCyNLXT8vx5ilOWwQXtaIPwvnTCCq1Xje5xHXAXGK5rDH/5FcMyMHDt0fVWM0Oi630gnej/Z67XfTBASMGv7ExDUwGfPLV2489DZt92vyHVv39RT4aHeM1v9HgKMm5/iqkAN3uVtpyh4DGLOhJnHlOcz8VO/WGb7cwtGwO0DRnafNfx5UmNFJnxkM7qyQVwTPRXHgbM1sZn4QUpAZafBQXq83g832UAHAt17GaBhFNmbb0+CW6UfY7RIMECQEsyMuS336jFoqH9JXLgvFCzUJN1UleAv6q2MPpgPs1xsCT+Vs3eEo2igiQQWd8IVCq4mSghEAvu15OlUcALj0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cvmPfAZTt6KeF53aB9CkQ7TSPU36v4ub/MEglp9hbhU=;
 b=SF8xw7sXD05993xXCr8n3h4rokgtvc4KBuh6J4ArhTDvmCQlkQ+oQKGUC15FdnPOcUeczrONxJ9mCnJ50p4Q21mtgnYxMIQkH+1tKrvjKrxh0wuQQe/u321Pkks8XkO0FX1Tn3y7rz7Aq9VrsnBpe4ej7yFbTFOwuV2cjKNc4kg=
Received: from BL1PR13CA0416.namprd13.prod.outlook.com (2603:10b6:208:2c2::31)
 by LV9PR19MB9159.namprd19.prod.outlook.com (2603:10b6:408:2bc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 16:48:15 +0000
Received: from BL02EPF0001A101.namprd05.prod.outlook.com
 (2603:10b6:208:2c2:cafe::93) by BL1PR13CA0416.outlook.office365.com
 (2603:10b6:208:2c2::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.14 via Frontend Transport; Tue,
 5 May 2026 16:48:15 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL02EPF0001A101.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.9
 via Frontend Transport; Tue, 5 May 2026 16:48:14 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 4902F40655F;
	Tue,  5 May 2026 16:48:11 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id F33A4822545;
	Tue,  5 May 2026 16:48:10 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        shenghao-ding@ti.com, niranjan.hy@ti.com, kevin-lu@ti.com,
        baojun.xu@ti.com, sen@ti.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH 05/17] ASoC: rt700: Use new SoundWire enumeration helper
Date: Tue,  5 May 2026 17:47:55 +0100
Message-ID: <20260505164807.4108684-6-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A101:EE_|LV9PR19MB9159:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: d4d46df2-3546-4ac7-2b35-08deaac619f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|61400799027|82310400026|376014|7416014|56012099003|22082099003|16102099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	i93GfNal7Xa7mThWECbpM3Qo/OBatH1x/cjrd7lyIK7BZ2DvobUHhKawK3zz8dUBQKJAtDncoboqjriTISIOvgpbR6E3S2e5f/kJeU2JMHMcCBM6B4+Xjtpht8PqmWfZlAP2Oi8NR8OtnQkkS5HxFSH3Wy0bJKNNW7mkIxQ54M/hBltZBAH4eAKf+J+BwvyFzkt/TpfQRls8n42Slzaqbt229A5qv4mD15OEg/tS11TawnY8FZ/2xeH4FQR0XsRIP6kz6e5ZkRhWPGqPpKqHkLVp+NFhJWTrHutmiyShvg18nfc2zBP5G5547lIhJD9Cx+8xwEDHAjZFAxrq+PO9t/k2h50eqXkPdrJ7DwU3B2q2RsD8AELPrtuAa/tFFBZ2tlFFHnkox3BuhnyB7PrNC5D1n4JUm6Aq1HSLgCDccYN+fVeHZ+7/19XV+jYZ38RoUjiQ4Hmek6IX/8XIvp0X9GUkQCiE5g6skRy7TKuabYBondP5laMlJHpiH30x+3vU/RVaoHUV2NIvzndZmAT6FLtnwn4CzGb8fFytgAocx+bKZEWclX1FbZ8l+978C0iwalI01a9VFoCfmaS4jLI1Oy0E80whGW8OgBGhCWaPwF2asZsCAXEmf+hWq8DFg1ITqQagXk++NJckSsWAx0Y9jJkFWqVZbPPnuk/0iZdRaI4PpjAM31qALai/3odoTz5ubHyNvpcgxwV1L//QPoT2xemUTvsb1G74tWZwgytQt5Q=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(61400799027)(82310400026)(376014)(7416014)(56012099003)(22082099003)(16102099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	AWAnt3XzkUIOPDWoSxA/FwgwCWhQTlpAsPUpB4BufHgMmav5r5VXYV++TpuGAS9mqqGdFubHCcV62qialsk1WppS9/h/8rJ3VPTphA+Nu4huXQFglOV/6O9WOKNCKxedoirZuWJJZyjvRen3p+WSk9PrAibxmyDrIC64pNc0OfRH0YmO5hOkEJJyeHj0FuRYYUIn/7NE5LNNFZAm0FPNjPpSDePdGVkhqyRFwGQ4Wh33NucAatfwUh3AowpVNHtVpp7Mdk2louP/D/3GJsccqTMW1oqTNG+0KU0nu62vs/7M3qjgXX10wyv8ZqbrM0LADJoELm7PvhwYYPDZIiRheSZrYSqJlreKKFiOxfsYdO1MEcTB80294RtEaeNJOfw4RWqDK8nIAEtOXEvotRlU8XEsGgymBADpcI6T2DQ1b9KfNqwip6Zs5ATqB2vzBVqf
X-Exchange-RoutingPolicyChecked:
	RH8v32NjolLgPZQ0o2JPm8uptZGqdPQ+CnoF0242/iqo1bJ4Vy7bsq806HQQFfYvhGdIfvy5kLRxsu1F6a1J3UQzJKlXJNiwekEHYplH+Fg2ilkkRcaSfV1RqhtJip76Hz9VYkTB1iR/Bk5WHAfp0J8FZG6bw3TK/NhPd8oWk434nx10o+Hsy1EtQJTnrqmiasoDBq7AHbgG98xKuu5j7hJy7Aj3mkcMLAgvUzBteC8LOREms0DHky4GzdaKjofOtcHZtbdNi+zZ/IfSpRk7p9F+rRU7Dhl5Fw0JKRdUnpHnSBMm+PDKlLfVYPo72zEZRLr809GzGi2VTI9GN4dZAA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 16:48:14.6808
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d4d46df2-3546-4ac7-2b35-08deaac619f4
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL02EPF0001A101.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV9PR19MB9159
X-Proofpoint-GUID: FkiKAWC_3Sm--nxHK9U_dqIvCqh4mqqs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDE2MyBTYWx0ZWRfX4rgAw6KAisw3
 FgeFpO5eSCXY4OeV+1I7d1TABu/YOMfvfz6P0pllwEmc/4hPPJJ1gzDyPqssrPbR7Mlh+FauSoc
 k2FM5QSUcHX9pZKWUPHlaP22qCW5VXymKiOqnw7f9PXQXm9S4BR9noCjE0mgU7rQyVGxUAnXPaH
 hWsQzca6BctffHsLiq5XO1DPGT5W/1ky/GP+vCyJ4VQ7qVNJQ4p+uszyBYtiRbEJtSMiC/OZgsh
 896Ym5oGTYXf8spzj4qJ4GH89HrfrCbJNbkyJIwxoUls3aIIFsI5/GZQszPfzdc5qEPMVM1B/92
 ZOKf6hH9CgYWm7vPomvF1pcwWkfQZxV2/dSTyw76SakrETgW3lKkVkHhTc5Yuiw6fGKL9Db2jqN
 4AdXlhc7nRAK7pl3AUEUk2afq5tn2qLvN2iungNSVKFEOdp6h8iL9hr+68RV2OR8RyMOs++KtoV
 E+3TanYNJFOX4nx6aQQ==
X-Proofpoint-ORIG-GUID: FkiKAWC_3Sm--nxHK9U_dqIvCqh4mqqs
X-Authority-Analysis: v=2.4 cv=LZcMLDfi c=1 sm=1 tr=0 ts=69fa1f54 cx=c_pps
 a=BG1ReSSOw/mnHJn0Rn5Ghw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=_kLIPOSdNJ7StitxxVsA:9
X-Proofpoint-Spam-Reason: safe

Update the driver to use the new core helper that waits for the device
to enumerate on SoundWire and be initialised by the SoundWire core.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/rt700-sdw.c | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/sound/soc/codecs/rt700-sdw.c b/sound/soc/codecs/rt700-sdw.c
index 9ce36a66fae1d..30fcca210f051 100644
--- a/sound/soc/codecs/rt700-sdw.c
+++ b/sound/soc/codecs/rt700-sdw.c
@@ -522,25 +522,15 @@ static int rt700_dev_resume(struct device *dev)
 {
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	struct rt700_priv *rt700 = dev_get_drvdata(dev);
-	unsigned long time;
+	int ret;
 
 	if (!rt700->first_hw_init)
 		return 0;
 
-	if (!slave->unattach_request)
-		goto regmap_sync;
-
-	time = wait_for_completion_timeout(&slave->initialization_complete,
-				msecs_to_jiffies(RT700_PROBE_TIMEOUT));
-	if (!time) {
-		dev_err(&slave->dev, "Initialization not complete, timed out\n");
-		sdw_show_ping_status(slave->bus, true);
-
-		return -ETIMEDOUT;
-	}
+	ret = sdw_slave_wait_for_init(slave, RT700_PROBE_TIMEOUT);
+	if (ret)
+		return ret;
 
-regmap_sync:
-	slave->unattach_request = 0;
 	regcache_cache_only(rt700->regmap, false);
 	regcache_sync_region(rt700->regmap, 0x3000, 0x8fff);
 	regcache_sync_region(rt700->regmap, 0x752010, 0x75206b);
-- 
2.47.3

