Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1113F4C77C0;
	Tue, 12 May 2026 10:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778580870; cv=fail; b=WliLgEA6cO9vhZ1y9haD2d0ok2AV0YMjJDLNBULTrFcOFWWcK4tg21ezYbp90ruU/zMoiCMIUJfNwK3DuhM56gBItX1aLbS1SUtiwpD+TwQCOQGED+kOikwozFvgWiuK7oAwT/IooCf7HJoo/GSQkjXxt451FmLh9aSoU8qJti0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778580870; c=relaxed/simple;
	bh=0wGAYm4UbB07at12QNTKUrSIZvORdtKJ2sku+xHNYS0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G7728FRJVmvUUuwPUDAzDo90/1g/rvM+XYBGPKjNSgSxZNGzAfY9xfTkBc8dVK6WvkoSU2kLXlo7qFl/crWyL/pLv7HdPw2J2Kw2ZsAGORQAp0HeiIAb+W0azUQQ6TZOoNPVaudSGUlqBd0FAR6UPE1biaSKUNzVfjP/8I+hlqE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=B3d2NgkC; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=xsKjJ7B0; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="B3d2NgkC";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="xsKjJ7B0"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64C5x1Gj900775;
	Tue, 12 May 2026 05:13:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=5ABhXb6gC25RjWlOxqF/AAC3nDIhiGeujZNa1mcqoh4=; b=
	B3d2NgkC33TYnoIaNr6IY8ZEb8GfZ8vSJ44yxRI4zt0jB7InREbnIPrgstbMiHlQ
	3++B0vCVs6/Y/AflT11Cg9W8vZLtRhNHHeXx9epGCuSAn+qrah1ol8KOPcRgDH+h
	0fb2tU5104lxOHm3HbjV6R/6ZXNiRAlUaoVGA0JmHxAWr1VGhJlkIrA7V/nHHKIQ
	Ls8iwwLto156rEs+okSxr07TOwPqS8dXv8pG88pzEz6U7pjzPEdnAZZXLXEdiTbt
	qoVsld5Z615LReDpsi6HhkV/NYx+0KBeBN4iMiqFW3fgNkNDsawtI0buvj7K6zE2
	KDiyQLC/rLPCMR/v94zOjg==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11022085.outbound.protection.outlook.com [52.101.53.85])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4e3nvvgq6j-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 12 May 2026 05:13:59 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xdu+L6GBB1f0CjZKUlNlllAU84iuUDV+xZsRl0Y6jTN1ccyyRBr+/N1i0x2szL/vg/lGZ/ElnXXcO2Vyy39+V0GiEWQyG980wAKGaFbdMdDS2x2gBR+beerx/YEkf6qJkQSKcywtT4K9QqyQNoBneSoRXSD96Hf2XHrA3PJj6idBsMF5kqDTS30Ke/HrZ8fJ+dsNX5l7l61vDP/80+7pkxH+FCWw6BA5vXbUo6Wjmrz+GRQ61K5Xc7ARLM4nXybqp7lu1KEouuKi5FTSB0wQrIhqnRNivboIYQPtbPi1CPeaou++P6AhQ3lZLgyg6K16AnEDYLw3c7bMW2CY81ho3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5ABhXb6gC25RjWlOxqF/AAC3nDIhiGeujZNa1mcqoh4=;
 b=x4C14acE5sb94LRh1Pj5ovk8FVLt2pdWGyuflDYqNDpiePSLhFig1ssz6LLzUxH5pUTJJeOEsYd5qP9mRtI+ydwgnUIr+oQpys08yN+j2yoaes2ySSYQ650PkAsRqT+9Ji5sM5ejsEi2ZPQxQXJJe2F/5QVEXeQHE6/gLSzpy9XfMg2vBCqgl69wWs2/NJw/hpMeEZguRja6WxAaLJ8BwaWxDxhYhsNDYZzRd5p7nem93s+2LvmRrcOrCbSHs7pmtryxd2mS6aNV2mXqIYG9vf9/AYWzmjbcpioJsvEY6+N+uUEGjKkA2dKH3yv1qy1t8twr63rdtyBtM0uKuL4hhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5ABhXb6gC25RjWlOxqF/AAC3nDIhiGeujZNa1mcqoh4=;
 b=xsKjJ7B0cklAbRN8nJw8cS27xSOs5jSRUQrAGeGQVaNti/UydHa3CdiFZx93G5RYwltDb9shTYrPM+6ejz21LLW1u7hlcKuik6ikMowfyIZr5C9R5GSWnqkfM/1e3BvD4YM/qboczKT2wfXi+4Nz/aRjixR99uID7g407Z8MMf4=
Received: from PH1PEPF00013307.namprd07.prod.outlook.com (2603:10b6:518:1::14)
 by LV0PR19MB9288.namprd19.prod.outlook.com (2603:10b6:408:321::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 10:13:57 +0000
Received: from SN1PEPF00036F3D.namprd05.prod.outlook.com
 (2a01:111:f403:f90f::2) by PH1PEPF00013307.outlook.office365.com
 (2603:1036:903:47::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.16 via Frontend Transport; Tue, 12
 May 2026 10:13:56 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF00036F3D.mail.protection.outlook.com (10.167.248.21) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.13
 via Frontend Transport; Tue, 12 May 2026 10:13:56 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id DC004406562;
	Tue, 12 May 2026 10:13:51 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id C74B6822550;
	Tue, 12 May 2026 10:13:51 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org, vkoul@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        niranjan.hy@ti.com, shenghao-ding@ti.com, kevin-lu@ti.com,
        baojun.xu@ti.com, sen@ti.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v3 12/18] ASoC: rt1017: Use new SoundWire enumeration helper
Date: Tue, 12 May 2026 11:13:42 +0100
Message-ID: <20260512101348.1138044-13-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260512101348.1138044-1-ckeepax@opensource.cirrus.com>
References: <20260512101348.1138044-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3D:EE_|LV0PR19MB9288:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: d140b10b-468b-42ed-e973-08deb00f2d40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|61400799027|376014|36860700016|82310400026|22082099003|18002099003|56012099003|16102099003|3023799003|11063799003;
X-Microsoft-Antispam-Message-Info:
	fTnKj35aG17X7oGMkk8x6UBVNFsbWqgtwZsYbKlcXmgfJyWjgLDnCiDB66Fbq0IqzQgjw/jwtp96yRsO9EaUhS/FQcBmTYYEK7zWAtsktCLgGP61wKsSk++uQUiGo47aNsZAV5P/64RrAiQ5aqTwW8qhwnYdVSpTJJlsh1DqrgluBSn6DoyTYgpyxxw57QMPed+HxvqotTxQ8xxo8QQ0F1wpowJ615MIcauDtyJANyuJUaab+t3NlY/EX6ubujcmSm1TfRS8PMaFDupEkaOF/ytCcSBNfN+8hdIB2ta4G2kV+xoXOF1xdbJIS0Y70sgQEuiZpcTP7vVtQOqkEz1hyR3VOSL6cjwA/XjWk4w1I+dtmCI9ayULSG4N5/0EpcW+ohgip7+inM05i2/Oqyl9I5TcPLA1kOwiMfBhFEFCua1YLQNZ1AttXFP5OAsGPpq1Q+Yfj6548BixMdRkzuqYvAkqOPnSzXZr1/YTzeegUu8Zj2UDnfFjMSEKLHy5LU1130ZevlbbXWGY6jlBnjytnjAwJx1QQATtr1r7P7hmau4CKrYLErMK6c7HuM0Lk07jZfAlT8V6czXhJqDVbAxlVcy8RmmBqFxOp26TzC2/IGEBy5G8k9Xzw2EcN7WAgKOf2mc4WChkZOPtZqYKGRBZRcwYpOBS3HtlEaWt9v2YI+YRU5Oyu0EqVE3TyiBOu7u0gK9MpixzV+y8fMPUW1fn7JEUSXIeqDm5FZM6DwT6USQ=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(61400799027)(376014)(36860700016)(82310400026)(22082099003)(18002099003)(56012099003)(16102099003)(3023799003)(11063799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	yBHj4MsmEBWYXfw0kuAFuIhweBzqoJDZyreTOpXoUI04yEyM05PvsVvdLho7wOq5XlvE56eDgeSz4l5MWtHlDy8poVD0y8tynnAUurZjpF+onSiiqDshjcGmvOCWO55r7H42j95Lm0UmwMoFRAmcnr0ox6YyGWsa8cxijRXxdps7E+B0iX3wXNtY6NOG/93QDJx7efg7i6oU7eRxwaxVgcE8Qpt4/uJ+SpD/KR4vU4yu80ORu/g1YlF2mfKqoSJJGq16IKD7jmk6ecnF1IJmNrrGeNN9TaYff3eG+SoiFd5QEt8pOPl7GPhaKhgXdz9Uy7543d8EmQFRQ3HyEZIgyrp4+JlpN+9fkni1OY1d39qcN9VM19YE7LMv3ZwvKAyZ0cS+GvaHNrimcVSeeYRfBNVGeYceFeflwjil5ipErqEQRo7N6myxPTVHBqMEubJe
X-Exchange-RoutingPolicyChecked:
	u49C3gB8ivI6vKQZ3y2GbSXi6+shtucbrE3FC2tcrQrJ1MckfFCdO/XQJlTsJTD03nkZhGqeGd+/RwtiQ6zKQGMPJ7GWTA08FDGZ+mxcJpx0NvL1jCoQHwJAiEfjhMHicDZI665NXF2QHQcpW41ih/F/EIBT7GrC/yREd+yzKDOHPvTkhsIzL/ALHmKhyKLqIb4Z/eCRMnmPpMTr32aBjNOsmpf5K3y/9FAH1rvbyMWridUzWEY2Xw6jocR3v8KGVjv2n1B6myNIDi/961MI6j0K34wvC/0wiK3GP6waTu0szRZSbuQmOGLoQqTOeDhOt3Drb4nc73YunO0S+bSwfw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 10:13:56.0659
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d140b10b-468b-42ed-e973-08deb00f2d40
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SN1PEPF00036F3D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR19MB9288
X-Proofpoint-ORIG-GUID: YfbTUYqYOcmpXBgaNV5iHaSg3Eco2CvN
X-Authority-Analysis: v=2.4 cv=CdY4Irrl c=1 sm=1 tr=0 ts=6a02fd67 cx=c_pps
 a=jgSDuZMfJWq5ef40Xplyjg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=IoCDlSAkw28XYy5mOB4A:9
X-Proofpoint-GUID: YfbTUYqYOcmpXBgaNV5iHaSg3Eco2CvN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDEwNSBTYWx0ZWRfX8I4yNmTCiBhU
 GqFq7ljj3dn94gtVypzjoeEB+gLuf66VXD4tRlZ5biPoNIi9q80MYF6+wx4BL4umNOu/Qtfg9TS
 +Loa2tvpjCuUrDnd5yhGfC0VJwKdH8KWH2m6fB3tucuwgXeyHGQpB+27bqRygawmW3oQ+S8DW1b
 II5UrhDJaO4r/JyczO2e7FkXf4q0S61FIFlSYVBTCJzeNmAkhLGlzGLdBf18XdpFfjp38evX2/1
 026YrlXtIFBoVN8rEG1tMzEJBMEqW8VbAP69FFf8iAaej0dMpXaIQ8uZgRC/idXTrVp4lbEZ0Ey
 /E4shgpm6rKMpeQeCqRDtaZsy1KzJW+/D664UA3nAT6tr2mlicdWikFJQkk35ZNyC4mz3CbhlGm
 xGtoZ0eDy+lZPK/dvaR9LGs/EwddRQsL+gEoCqmuWAbQoFSwRVn0AbEm4ZmgrxOwBzWy1n0qsw/
 USEq4VVnukoex3xJNVw==
X-Proofpoint-Spam-Reason: safe

Update the driver to use the new core helper that waits for the device
to enumerate on SoundWire and be initialised by the SoundWire core.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v2.

 sound/soc/codecs/rt1017-sdca-sdw.c | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/sound/soc/codecs/rt1017-sdca-sdw.c b/sound/soc/codecs/rt1017-sdca-sdw.c
index 148b36173a257..d62e8a2536767 100644
--- a/sound/soc/codecs/rt1017-sdca-sdw.c
+++ b/sound/soc/codecs/rt1017-sdca-sdw.c
@@ -773,25 +773,15 @@ static int rt1017_sdca_dev_resume(struct device *dev)
 {
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	struct rt1017_sdca_priv *rt1017 = dev_get_drvdata(dev);
-	unsigned long time;
+	int ret;
 
 	if (!rt1017->first_hw_init)
 		return 0;
 
-	if (!slave->unattach_request)
-		goto regmap_sync;
-
-	time = wait_for_completion_timeout(&slave->initialization_complete,
-				msecs_to_jiffies(RT1017_PROBE_TIMEOUT));
-	if (!time) {
-		dev_err(&slave->dev, "Initialization not complete, timed out\n");
-		sdw_show_ping_status(slave->bus, true);
-
-		return -ETIMEDOUT;
-	}
+	ret = sdw_slave_wait_for_init(slave, RT1017_PROBE_TIMEOUT);
+	if (ret)
+		return ret;
 
-regmap_sync:
-	slave->unattach_request = 0;
 	regcache_cache_only(rt1017->regmap, false);
 	regcache_sync(rt1017->regmap);
 
-- 
2.47.3

