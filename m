Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B2D9395AF2;
	Tue, 12 May 2026 10:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778581919; cv=fail; b=rMjFXgFtOwaV3/7GDUbT4IBkgJx7a4bULYqAJZWiDSeLIeYfqNZujoaoBuME+lBdShaXzVNvIvXJWoTTy53a++jI8EdkH093v3Rk2cZRWXwtSPG/c5Ff4FZTP50IjZOGAPtWtwkMjrp3NQw0R6aQ8Nk2leW9vL53lIxzMcYlb9Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778581919; c=relaxed/simple;
	bh=pa/YH1HiYPAyTe0dXB3xpSPnCRmwFe/T2MeBA2Dzp3k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=b5b/SSEBP2CSgT6CIGVr4ed6xjrbLXwTvnBjLZf4VqQQ9I7s/I1g7SxyOUa3eyWqbZxu4xwkEkIin+0lnm1hLcwuhzZjmuX1DPNY7ph0loycRTrf0B2LX08G3fqSBGzuSxmMbOO6Fsipu3d/eayVVgYR26MCHvJcyqdKsmKscTo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=k0ix9Rne; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=tQSTja3B; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="k0ix9Rne";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="tQSTja3B"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64C59jn4818502;
	Tue, 12 May 2026 05:31:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=fgQoFbicoCb9zaT2QY2vVN9ssH1/QNLU5cA+LVcTBhk=; b=
	k0ix9Rneg0apoZi3JH6OQEBqpHBvb3fHQCRsJUAtx2ZYaoFMLD8GQrRBGqIB+yxl
	Od6IkgxxLu1OPdA6PGleIhmWE5ErYfk80eNbrhW1MY4xBmcgc1RfaMINnyGN1qNe
	EhXbiW4CcDmgpRqQVzqm1/bsdvrZYFXA4yJFY2/D4lf8QvWuc3MqKGNNgcyDLX/z
	JgSrK7zorAHjvqAobPBH1m3dj1OLgH+2u4CEOe7WNBs6KNfxfIA2qX9EaFSO6a+e
	omV/1IVdK6K/XxfHBeU3catDc8axUnTVEhZ/kW5Uz5S6B4pIgI5FgabGAivZAmun
	pwTJIe5tIw9DPps7QRi5Xg==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11022116.outbound.protection.outlook.com [52.101.53.116])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4e3nvvgr3p-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 12 May 2026 05:31:13 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tXkwd1gB2qL8Pe4/bDqY17bdE5Q92/4LRLEAEutcDQZ8oNYYgRrJyqkp8kJ3JzvCUCZvVb5FJ3hl1/bGY8BFpulXkSLV4YhgSTfBxKT7BuJRV5MZNl8JxNvZE2WlvEQuFv7xGohpezuO4CTXCCBozvIk9q5fr3sqLyrGhSpjUtDVoiMhT8pp5j1nRmKtYFA/PrpnsnstALSzDuBfJriXIWsXDenNUkbrCh/6bbAru4i8kWj9czyS/t05h+C3FITL3BOp7AnOu8ylOD3vmyLXnMaV7mJlyiovvx7w4cLx00J29VIsgufvoEioEFc7b7L4IcSKjNBPi1MrTdWwlSewAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fgQoFbicoCb9zaT2QY2vVN9ssH1/QNLU5cA+LVcTBhk=;
 b=doSnQvDmN8Y5GHWvYNCPu0xUt7g4SpJ16Ja1ISnkR/mIQWgOGhEwGh79NSh9wscRpgep1CEfEILe2TkEHtdNBwy56vUAqFNcHP/WitToH9v7xkAGiQPyHe28g+/9EhlmJooTj4qJluQ0X1J7i0Zv8+Ev7Wgsj39lyWcXEPb3me2W4COlMCG9bxFg6VzLRDxSfurJwMiVN2HXq5psWlyROLqDdOjTqEHcYL6sxi3KURy94H6p841JCX33mdstsaBk9KKOigFqAxUcplLcWgw2fbZiPT49m7FdDMSF6xbqvWE82A8UTLS2eCSdCD2oOhOR+YfkA1Lj/XjIkWJHccs/uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fgQoFbicoCb9zaT2QY2vVN9ssH1/QNLU5cA+LVcTBhk=;
 b=tQSTja3BAAvLudk4Cb/IuOpvyntURnsOKdzz5efO69sMZd9vi7fmxk9YiJBcQ1Y7Q4ckaoZeGBnZDp7HiQfct5EzmiobvC/L6+RKFczX2ha4CqJ6nwdQZgYjmsdff4SF6xsXc12clfRZy8hZ/xgw7GNy1cWauVlWd5Jz8oJjit4=
Received: from SJ0PR03CA0340.namprd03.prod.outlook.com (2603:10b6:a03:39c::15)
 by CH3PR19MB8332.namprd19.prod.outlook.com (2603:10b6:610:1c7::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 10:31:08 +0000
Received: from CO1PEPF000066EA.namprd05.prod.outlook.com
 (2603:10b6:a03:39c:cafe::bf) by SJ0PR03CA0340.outlook.office365.com
 (2603:10b6:a03:39c::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.11 via Frontend Transport; Tue,
 12 May 2026 10:31:07 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CO1PEPF000066EA.mail.protection.outlook.com (10.167.249.5) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.13
 via Frontend Transport; Tue, 12 May 2026 10:31:07 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id A9468406564;
	Tue, 12 May 2026 10:31:02 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 711C382254D;
	Tue, 12 May 2026 10:31:02 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org, vkoul@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        niranjan.hy@ti.com, shenghao-ding@ti.com, kevin-lu@ti.com,
        baojun.xu@ti.com, sen@ti.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v4 14/18] ASoC: rt1316: Use new SoundWire enumeration helper
Date: Tue, 12 May 2026 11:30:18 +0100
Message-ID: <20260512103022.1154645-15-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260512103022.1154645-1-ckeepax@opensource.cirrus.com>
References: <20260512103022.1154645-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066EA:EE_|CH3PR19MB8332:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: bf711d95-a72f-4cd7-7319-08deb011940d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|7416014|376014|61400799027|11063799003|22082099003|56012099003|16102099003|18002099003|3023799003;
X-Microsoft-Antispam-Message-Info:
	UwMJPacOUkGmCs/Fpi2bsvkCGrsGcbo+ZXbnVsJwo3glI8uybRfYqn/Ve0UzdXmofk6iZS9i3xWY0iVq8VkIuDQMckiu8X9OM2fzocc76ih3rV/2mwf4FdqDk0rngCnKDyDb0sCvTJOJ/15hrVDMA2h3d6tXCgzFNjicOqgpsPXwcEvF0wNAlKBI5P0fE1/TceuhS47uK2NGDmAxOmJct9+ymcBeFH4nObbj4s2dNA0mVqhc4n3lZapHu7rN2gdC2bCc0EPtxkdm3Qb4KTtp3bQlpULX+dwcgd9DCV71MCiAwXPL53B09kac0aZWIdneTZ6IHOoahtwJpGnKqm1Bm7bflopBgNDMFZzAVdfnGFQu8AtrNB8a55S7BBfQ2L+AMNZcvGTCatBijsXQ5UPyLFDXG5UmQV6JY+JsUEfPW8Y0AdkAKnbZZ8nBjlqjzjpyVGOjeA7aXjUsMTNUJaKrz9ibuekWzAbqhwoF7InfYbdwcDI4BiILSnn2DLopxwWCVT7BbskEtxWg+5GB/X5wgs4/eGOR7QBjfbutTlosj4ChrQ5UD+oYDHntSOQslRSKzZP/iTj/2QF3/A9wmcZmo9BmUeu9/TcStdVRXAHwmayCyI6jtzV2HwMUH5QUZqqaLhj9t6SFwpmQidpt2Vwf5NQOxzUhhnahjWSNWmbyjyp2IMIDK34YeYhrjX5+dBnMeyhGh4JV8kZmv100hLyw7KwogLrFYq61KMPzdyIerEI=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(7416014)(376014)(61400799027)(11063799003)(22082099003)(56012099003)(16102099003)(18002099003)(3023799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	CsfLds5sXJBnSu2MjS5DhynR+VeGs94T3F0uEVl+8urwolk7x5DBPgXWl3rqMgR43QqlWipBBWts2KOC+bwNxtYS15Sp1jyMkLZuQS31zPVLovPzBl6eeQ/752/glHXT5buatrPcC20bl1BvXIbgXdERlo8OkfXHR/D9l1OirsS4HlRFpkSxBt8Mh9Kf03qwZPUf6WTALNo/ikRe3em/2nEMf56xVdQXjkEboOEmh8im221TjuxzztL4BIohX6H7zhN/Jykqy51xJoREM7muHoKbuF02XeaSHL9JegxeAHzRgNmme1q8AEExe+QKaZ0AjLNx4saRxurK2Y5t0AfK4FCRTos0x+gMa9at4HsQthlj6stnAEFrmD+A8ZvhB0qDAEyDhO/+Zd+d5Xlc2MMCE6VCGuXbdn98ICSq6Dv9fdS2KPUi2H9H9DVHRl+nhgyQ
X-Exchange-RoutingPolicyChecked:
	JaLcWLVOaluCq/aWZHC6fhyQWCCskc6r4JGN1seQwngxg+0y2+9viRai7fECbI/jySarBOTxONOBib2jVmMuv9v7aY39l6gpdO+iIa+xN+lHpLu5i+qFvZvkUfBbERcVbbjG5XHJ4h0+SMZrl7bSfM//tHQ1MhVPuhmTikVCnwE2kwHaGCxAScm2nQuX1mI1Sxyj6+NOUwU+0bOzFV8OFjJ3idNJ93qlUcHSuB6XLfuDYXRI7UJGlBULd9/KwHBfk0NVyRIae9En8ZD+DQ0/yzqI8nlDX5EPLjZ4qnjwcghGWzjZM/8/tCL9MUsYuId568z+GSWm21qX/5t+9d3Eiw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 10:31:07.4871
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bf711d95-a72f-4cd7-7319-08deb011940d
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CO1PEPF000066EA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR19MB8332
X-Proofpoint-ORIG-GUID: uVXNkUZ5GAELmZ2cxNWAIY96oqx2fqwP
X-Authority-Analysis: v=2.4 cv=CdY4Irrl c=1 sm=1 tr=0 ts=6a030171 cx=c_pps
 a=h/8ALIBrt28BaDiQtk0qcA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=_kLIPOSdNJ7StitxxVsA:9
X-Proofpoint-GUID: uVXNkUZ5GAELmZ2cxNWAIY96oqx2fqwP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDEwOCBTYWx0ZWRfX7bDLasL2vfwQ
 dFLyn790QvfSB7i6p1n37s79ERu3aimpYRlBdds2rzTRdiHB1GzcPb1WINmXr0dh69ifMkHiVAo
 uGoO1ofSpmvk0ULoczIfXNbjueHCsJ3vuDd6YnnmkD6WgnOVqGPnlZPQPBMiCGONGxc6ws1h+Ep
 ndI+WTJh8Uele16LDBGt/kK79oxN+SdiJaHz+NYUTo6a1yVMSDDrEEfheJ/UHBuvG73cRo9ntWb
 Q98dgj21bM3tk0A+6MpTVyczTuDXKislR8QiqAANMX65whXuQXSJ+hFaBNDfIpNc3JjefPjd9Jv
 nTbRagLtmm6F8Ks9lfavvuuyiSYqLtrK9Hz9NUWL8pbElm/03TAsXvxhLvxl4ibrsR9lv4+SnvY
 eJtJH7FVk32/uPLLSMAMVgPWBptubk4ozPaFtQ+J8zrRJO+CoxFQLPFaMVbITybRLoSKX49as71
 43QturhPGiqFo5OSHZA==
X-Proofpoint-Spam-Reason: safe

Update the driver to use the new core helper that waits for the device
to enumerate on SoundWire and be initialised by the SoundWire core.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v3.

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

