Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0B54C6EED;
	Tue, 12 May 2026 10:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778580876; cv=fail; b=GLbyg6wiiS5vPiy9heragGsQFCXHt8LixpPsTBip07Nll+Yaqq/6gcujl1qDqtPPL1hMy3QpJ3xzrr9PsdBhCS5kdIjFhq9cwIaZTQ1YnVwuXd5oZFHHXRStMx7LgekNPQbXbTRO81nC2b401Qbr7Wv3lqcxvx0tfS9ZQ8BlRs0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778580876; c=relaxed/simple;
	bh=TUyHdFpmyBGEsZ42hO8Bn8YW6x6SIzxO4sZhGg1jiCQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pdY1fbO6g5Kozj15TRFS+HXtXlz4tOHGXXfupr3jrW+OeCvkNEZAoeXuyr/ATUEGrB4m7/tZFHsN/B2ibToWR1kKTcOfDA2rzrXWZ9oiBvYqggShuWD7ARsZxPJfxL22qq28zJKuiCYEwo7mDsg+yKPZrrVCIOLX5M3VZ+e+BiI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=iPUGcVHT; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=FLNBMN0r; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="iPUGcVHT";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="FLNBMN0r"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64BK8R2x4113712;
	Tue, 12 May 2026 05:14:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=hu3Wj+1z5VEHyVb9q0VfwsmqlI0aFcDH1X/60pNfJ2w=; b=
	iPUGcVHTCrcS1uhwHAr//2sYcpdy4n2rpNztKlrOXX1os+o1wMOJSHv7VdsmdH8/
	vkfPB8d3zn3ac28h7T9AxAFPJC5wq47yBnK09Ztxqbk+lNxvsyAuqaA5EdodZpGm
	aiHTUajmX+pxqyvmWL7vgG2udLnjJ6or4K7lpPzyCmGpiJTt794D9+HE/uUDWNJN
	SU07Uxr9QH8YsVEiimMRb2miTnqhhR2yEYIP5pdwnanwhmXJKIN1t6XoJN/UkxL0
	xZrNQGVw3yYSPwwWuT0Abw75aBI8U3S1VTpzzdEdi5rBAOKWu+J8xEANoYW3RNhK
	k/gsOq3wnvhvpX/GGinYww==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11020088.outbound.protection.outlook.com [40.93.198.88])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4e3nvvgq6k-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 12 May 2026 05:13:59 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p8G6YkdEftgJYNdESABORahAvHz6B+Pvb/zHlIE4ViCfx67/T6ACyZ8HrATD98pWxryiKmXnnQKZuRPTMLXv/PCiP/cbdn2pW+zOgpkV4dUMCijO0TtEF9dy6pedwNc7sSyjQLr52u2Wslimc+i6gHGDszBAvNJEW81l4h5slBbc5n0MvtK5p9p+eI/gIy8MSSwe8CMHRL8RxuaNz8xNDSdjtzvEv+r9C1OdFUP0LXLxSY0v3+2Xz6u9cQ9dq8r+ox7riWbli8jgY83apQ5z3MugSFpX4ek69VwcRs9rxdtLenxQ4e6AcyWmfEFEdbWgqTmW585pobum7z6fGGzRtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hu3Wj+1z5VEHyVb9q0VfwsmqlI0aFcDH1X/60pNfJ2w=;
 b=lJ6oE55LhoYf2xzjxOm1+nRjXCfjo9P4Tws9h+M0nQ/MdGlWg8Lw7M4xgW7ssQ1IHhj+PmUfDHokCffcwapai5fVhJJlfLfEyfUe6YVOaayPU5LfbGOL11rqyxn0nJyfKARqSqUGcjmN0jd2KdzaWgBBkAuyqn83t9xvvpeemV2cHXuwUWjuE9qipdBPxArPE3nmURb4KSwlVWSpt/V8AD2ADYu77a84yGgueun32PWXY+VlkmVSRkwjfDP30/jc34tLdt0Vb/rGeKbZvMG5WC3IPwuCEe/gjLqOst6HQUWwipXx86Bt6FFw8bpmVzkw3nb0Kvhh+fXuosJwILxrCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hu3Wj+1z5VEHyVb9q0VfwsmqlI0aFcDH1X/60pNfJ2w=;
 b=FLNBMN0rcaYA/xeT5uwgNkBgTo8nQuTXSCW3ONFZu+4R4PWEe1hXMSmK+Qv0vWjRFmZgYLbO1J1I/AHlCnYfG4EqMNRWRKYTMtYw6cbhLFxhV7h5KjdyQqzT79TEcMUKFiGIdMjfzZ5cGZ5xkfGIRIvjNTvg+YcMku5fwU9MF60=
Received: from BN9PR03CA0146.namprd03.prod.outlook.com (2603:10b6:408:fe::31)
 by CY8PR19MB7177.namprd19.prod.outlook.com (2603:10b6:930:90::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 10:13:55 +0000
Received: from BN2PEPF000055DC.namprd21.prod.outlook.com
 (2603:10b6:408:fe:cafe::ce) by BN9PR03CA0146.outlook.office365.com
 (2603:10b6:408:fe::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.23 via Frontend Transport; Tue,
 12 May 2026 10:13:55 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN2PEPF000055DC.mail.protection.outlook.com (10.167.245.6) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.3 via
 Frontend Transport; Tue, 12 May 2026 10:13:54 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id C302840655C;
	Tue, 12 May 2026 10:13:51 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id A6DF8822550;
	Tue, 12 May 2026 10:13:51 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org, vkoul@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        niranjan.hy@ti.com, shenghao-ding@ti.com, kevin-lu@ti.com,
        baojun.xu@ti.com, sen@ti.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v3 06/18] ASoC: rt700: Use new SoundWire enumeration helper
Date: Tue, 12 May 2026 11:13:36 +0100
Message-ID: <20260512101348.1138044-7-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DC:EE_|CY8PR19MB7177:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 1a2e56ca-92df-4129-8519-08deb00f2c8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|7416014|376014|36860700016|82310400026|3023799003|11063799003|56012099003|16102099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	m3vrYuLcHAZFHKL616iwh9xkbBKSFwcu/jSGA7YUM2xjd5HdLbpgMI39bNkKSAt+XzAKKpC0o7i1qKfkXEVpfIqoKaiSJAfjau0BIBIfThThmLbFJUYxHVC5uAO1Uur/l/p1UuoQ3X9uaUtwp6c2bFsqdTx26au+yLOSdhn8qmsAXy2295tuswa1tCs49kKjsX2ndYcmtzOsb3nUdyDjlcyRCgmKiaQBhH5jUpKycem9uDSk4B+x0y/PxQn/daIHdKZcGQGPRFVjPhCa7s3V/ZLvWm/9y3oe6YIs6WpbiNTG1bNLd5jVtVYiPSaC/vivCYi6G622U4LYbIxuDgQ4cPNHH6n/5JbZkt9aHqCFcIgnO/Fqr55yUDgeyM08DxcM7gtCUfwWRvULuT0nlsy0i1mlOR39Oji/5jwcuysNT235IrUDXGcSTDxkGC6WlTZJLvtJQyDXHWezg7YSd5fBx/eKlssYVPH5qP3wFAaGuPND0mgX+MKFNQRrAbIs+mDfjraFS8bkEZavfnqHHf9A1eKnnAGqFz+A1TMfP9rmqK3oZnDz93R9DGfbPvWkJ3cWwA5WA29qrV+7vJf9I1Yep/8Fw/ICf6UtA4Vu31W+CQGi3QAakZajz5NSl6Zu02d3DXV1n8Fevdy/QG4IMG5j6WMBwG8mUfqlHjysHqitgJvfnvb8zbDfcjTFk//O2Da752z+hat1mp5OQSiX8Ygy31144a9BfX3MdR+SSjo/vb4=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(7416014)(376014)(36860700016)(82310400026)(3023799003)(11063799003)(56012099003)(16102099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Ao/7o6MPQMWeH8gjSBGXIlCwOw6r1VlOTad9PB2SB8clkX/6yc9H6oMkhtgRX1fH5HHrZrqaBF7/WR7InY1PByATQRGKddPKsKhfrtao0Py8ENtbGKbg2B0k5WWJoe8zUUtUo3hHRYHSiwgr4FJyhIzs/0bwXUkEa3FWwKyAxEKFJxYCHdf9FTz/4m/kiptqSJiT49MhOf+Okh0hMnPfMwbggJp93bHwy6f4fW6EtgB/8p3DH7Tq8YZyBlg4jgRRwXDvhzdvVcgXjG+BWA3vQBe77b1cKU5QWt3e0d6gA7fkrkpvyz2yBRDkDrj4+F5wSD9VkADvIMXYv2RkzNk+e5PoEHuc/Ayvo4W3DiMkyMCM2jw+KLoYEsnWzjyxPJ+QT6jD/Ht4nvZb5EbbtzwejbUfvPoGhdl9+oR1uMIAnWBiz66a/4Ynti1CRITB+0DQ
X-Exchange-RoutingPolicyChecked:
	lI0phuAmjyKslbcnzGBuKd6dYvfPXz8VTyFfEs60rEvRlz8gEZQ3HIgnx/+RGh6k1erk82UeSHcnpXVYePcA5rQMTQ0El+SZdvcUd4aczmp1p/Dj7kQusypFZJZO1AWjaiDu5wzutKNwT4MXJf8/X31JGBubnQ6JUWi78Djs4kfhIBGdDq5IuvSxPm60ob10ObDRpIcO1fNmCYnwnwj9E7v4JTCQopqjDO62LRcirT4UctGcWfi+RVBDxUJWdhzsTuiSc7ifsiZal2AE+1FXGTQCimNSn5RVUCYGQ1kw0azb2UW93jzY6Hwdz/HKQ44lzNfgdbcuEGlb6v1zm2VpBA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 10:13:54.9601
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a2e56ca-92df-4129-8519-08deb00f2c8e
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN2PEPF000055DC.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR19MB7177
X-Proofpoint-ORIG-GUID: 1qNAoTaU459phrgFAWioaSGDe4XIkhS5
X-Authority-Analysis: v=2.4 cv=CdY4Irrl c=1 sm=1 tr=0 ts=6a02fd67 cx=c_pps
 a=B4HvfKsIdAoZ9ZdT5gFWvw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=_kLIPOSdNJ7StitxxVsA:9
X-Proofpoint-GUID: 1qNAoTaU459phrgFAWioaSGDe4XIkhS5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDEwNSBTYWx0ZWRfXzA+f5CQWeE5v
 UtzZRw2yJxZFPHuWk+GaUNoy4JMc6xsfjZ5xJWd++KjcQzPP0S82dyrEkhrhh5UYLr9VgxD4Hdv
 51Vw9eB5jiesNtlU+Jtkm0gi9UK/bEcTRDOVtNbO+eU4QhGi98fVNDXelIKC1h9jxZQoN9sx26j
 lcfeg9Iqqj3hbggH5WFbrCosmwhvZwNFsZpoWruoyozvk2NG04bQRoHBfnsqedPL0Bzw+cR3Y/r
 KAjtJyimbzJ6jXayF0CbSVjdYEnifaLIs66u3jgjbVNSwcWzr5U0ndHLVzx2vgtqI1of2I95TJm
 +hmEcI9dXCV3JsrdYdwl7fUPgpoD4TX3kQz7vTmHY0TCvICyvym/Rg+gWS4tF/Wcg1VJb63bKiS
 KKGn7jf92sP2gCQe5Jt0DQYqZS816+xxz21Cqu3ip4QrXnFVXyL/0fjOXr1/K1KioBIAlf3IE9N
 6K2uBgiS37N/O7Iz73w==
X-Proofpoint-Spam-Reason: safe

Update the driver to use the new core helper that waits for the device
to enumerate on SoundWire and be initialised by the SoundWire core.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v2.

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

