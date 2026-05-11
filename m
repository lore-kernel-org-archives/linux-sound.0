Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8670B401484;
	Mon, 11 May 2026 14:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778508691; cv=fail; b=HKQLE4lvNVzreUH8Tinv9iREJc2P/EkKzC1S8kgBoPfDqrQCxK913+Gv5DPBFDkojR8nQb4gdObsyE2KS+iQ63c+9NDm1gxu+nQwYcBfc6IjKn8l1MtCKO/lNx/9DqsyBGfnZjW70JLQcViqdMV7Okv67Z8OkfU6P4D1VdSb7so=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778508691; c=relaxed/simple;
	bh=U6Bg1GLezVM4HzTQtbzzCaMRlvSf51JOg4g6ULkGqfc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=evZHNS76ETQ9hJhbsirenAKKUWBEu2EVFpJT0Lnvdga1XC56nQOM147Tk2jVczPrFLqyiEAvj9jLuXMYaFHB0Cpx4D7AH5n4BUvM3CL4dI/svdQBTY9G+fbSvhpGDChYozW7fp0g0/aJwzMJ/4SdsvBOW3BhqxWHopRQCoYwrg8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=mT6Iicer; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=QMF6xhDG; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="mT6Iicer";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="QMF6xhDG"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B5q0RG2674250;
	Mon, 11 May 2026 09:10:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=JdyW2fCjVjMjkXErJvcfNrftcTwLu7KyoeTpC9WzuPY=; b=
	mT6Iicers5f1NPvH0SpL+8bki9L6DzHuMB8kys9edHSOkyf/SRGuLvhk/ncWcmCk
	E2vZlSOKK/C/ASSxIrmUo16wMntiNIieqIjfueQr2iZGCsmCVW+jk9Z+M2Cfwm97
	zfvFejT/GCKCCKGhO2s6LolHU3jvop3ruC3WK97GHGAoI2CdyYJ2/k6ir4xO1D8j
	irgdKR50uAA3IdxysvOqCTO2ccPn/8JrwT8TeEy5+CEQI4h3XWCLYUNjXzm6ca1N
	Tz5aGumOouuMtnxoJXnDdXjtu1qlzOaZqBpeccKZtRkarfy3LnrmsQ8oxt96OwDV
	HXVQpSp1KzXS+jmL84SdyQ==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11022126.outbound.protection.outlook.com [52.101.43.126])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4e21bft8g0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 11 May 2026 09:10:49 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R8ZN8HaMvAdn8ftFj97zoZ3U/Bb91BodJtDTRxR72GFFw+M2NkLH0R/3L7hiHGCg8bXHrvJHk4UfXQPEVsWIwGqUTUqCPH5/Qs/85kfdAfOFkdMzS7O/6m9Or0R+zv1giPG5xYkxsdESBhHrQnSG9h7zbirZ8QLifIlJrClVHrFtNbIuetFyz80vVh0egFLW1reBvQrpjPZ40WS2YF2bo2RTgWu5wzmVRqVDPD0amVX49Ishr4c3h7m3QWIEzF9NqpuwF5eZZM27UnTJ8dXTk7uhHZNN/QqB7ICpSHlcDfSy4T5xk96B+KtRRRSQkHRSY0CerNGYH+z1aJd/BRyt3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JdyW2fCjVjMjkXErJvcfNrftcTwLu7KyoeTpC9WzuPY=;
 b=HnoMlOjro9ok5XL8IIb7zBbC4XRxOruXzdzNcXAjiYwZ/4gGLd5OKyhrXy6JrKSWQG7Ja/1qBN9FkCrMHILytXdHgTl7rFYvSZ5ZBa+wBRcCnT73fsEvPfxT5t2mUjxSgZ3VXSvvPHM/gM+5uZMtKW0rNNxulrpzq87Tuf8sJX6xeWNEW1QCn1t7t1Kz8L2Q+j7Ekt1cqDXu6ssiTpX47P1II3YgvgD97S/JMhG3mj2hUR+fyOM+mdE5jTacCirh4soFDET1HEPSOa3UE7AW0TlYLn57cmoBEFm5XooF3nzwJNB9Ft/eYTQlcU/Pw2cmA5XObPRwNI3MA0tt+a1pkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JdyW2fCjVjMjkXErJvcfNrftcTwLu7KyoeTpC9WzuPY=;
 b=QMF6xhDG4mfiWrGMKueffsPRXmfHdrM8V67eU+dI/R0e6c927MSkxsIgxgnKSRRI68s6neym1mQG0i0XFjAvq9mO0ynxDhHJoYTYaevPb0ZQqL7N/OQ9S5l2+JwZIToH70FIz812BloAhlK2VAaqvqt3DcQT5n6XnYK2zUTXlKo=
Received: from SJ0PR03CA0057.namprd03.prod.outlook.com (2603:10b6:a03:33e::32)
 by LV2PR19MB997359.namprd19.prod.outlook.com (2603:10b6:408:379::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Mon, 11 May
 2026 14:10:39 +0000
Received: from MWH0EPF000C6191.namprd02.prod.outlook.com
 (2603:10b6:a03:33e:cafe::34) by SJ0PR03CA0057.outlook.office365.com
 (2603:10b6:a03:33e::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.23 via Frontend Transport; Mon,
 11 May 2026 14:10:38 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MWH0EPF000C6191.mail.protection.outlook.com (10.167.249.106) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.13
 via Frontend Transport; Mon, 11 May 2026 14:10:38 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 9A63C406562;
	Mon, 11 May 2026 14:10:33 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 724D7822552;
	Mon, 11 May 2026 14:10:33 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org, vkoul@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        niranjan.hy@ti.com, shenghao-ding@ti.com, kevin-lu@ti.com,
        baojun.xu@ti.com, sen@ti.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v2 14/18] ASoC: rt1316: Use new SoundWire enumeration helper
Date: Mon, 11 May 2026 15:10:25 +0100
Message-ID: <20260511141029.851125-15-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6191:EE_|LV2PR19MB997359:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: f433082e-43ce-43f9-926e-08deaf67141e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|61400799027|7416014|376014|3023799003|11063799003|56012099003|22082099003|16102099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	z5HA16MT+wldTSBJbbOHaUlxpzqXx0w4HGHgCmOcBXN6MHdNs29uTBIv6J6zjp0agz+L5tybHseAC3Azf2MlA6sGDDIYezUTSZmzzwj7SDRy/vwedxvZlVXV00PV1Y2b7jxamDb/zU3Jx92307FXDISXTayCZ0VRqySPF0EPtU4hnaPizrAZdsaQ+JQVnL9MqwyOCoJzFxR+fovC5Si5yGMetpcovnSGDqQFH9CE0/vq0gqtwYe0ov79SyJ0EvfWD8JiH9oseYDvfVG3Fk3kdTbCCyChzfE+usNO/Jke9F4N23i6XD17FGMejTbeVMADuTgWDYtgUs4ln/Y5Q8qWBuQuU/CYxjICb2nsoGCUlretp+17q1ZSsNP+ccUcctjGyh9BN/vf4tMiW5enKLtvKkSjhccCcQbTQngktAbxODI2LzFKy9ePMkKTKHtSKOy7ukKjlEX1v4xNl615SRW36NkyUAQ67GldlpGf7wK+eUjFPe0uqmmHqZCehM5G/1cgSDK5Y2sI34M3dKiFazKVfTrgxD8JfiYq3J56081Z80FGlQbBsEHzqXq253QDDCAFDDT3gtxrlAExY2FXEwqbIFRr1G8zPJUvS522Pd2IYiwpPcCd7SuQob8aTzxArTHDw3VDcYV1EP9p03CP3j4Vhm6WGKDbwPypUMfwKtbqw5Vl0vBcilFXFPsegb7I5k6da4929MSO0p38fU2l1W6677Jff7l+RmM92V71nHE/VOQ=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(61400799027)(7416014)(376014)(3023799003)(11063799003)(56012099003)(22082099003)(16102099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	sLlPT8gqnFUzmgogZrJ/r6uMaDUMP4aDKM3VtVkOUnLso0UZ2W0O44nZJ0ej+M2f3w1Q7VKYJpYCCnAsgBJ/J58AibK4pYtjQKFz4dGiz/QwRKFTJ5iHxu4jZ6OSuwQPInl5ozL0PG9D3mvnJamCvNVgmLJGLhUvhpw37tdf4/KAYmoO9y53+Iyla/KCD76ylGwC/wwRUp8DBp3lbP7SkbYISMch4FGbAk90x8dqa5Isq3XuSecs0wFgzAujkapOvtSTgYW3hnJWsl+aKJz1shdb0en8L/zaD1t92NCgiGG4UdIyCuq4VPskWq4/f+wTE3WtLoSNV9P0M7j63MW/8VmzEPnVhEkZNLEzmPYj76bgFlGd8vJ/fLuwwV6odlVQCZJOLk4d9/pgfRIjz1jDJtqGYPh9rfQZBxDgmpocnfdUfUG4WyaxJIMNtIIN/MLO
X-Exchange-RoutingPolicyChecked:
	heOI4jCU8e09Wc20wEtV3UXD1bob8gSBn73QrfzhGFmk1KquoSyyqoIj7WSL/WCu4ne0wuvNcxuVRoGfxsPOvxxL1dHEeYgGO3M7djW2vAfZ/5MKiDDbjZgIHXt6G6It0pMHV0/ynoNLJaN86GX+4jcsRG9xbALSUieLQ6mppbx1X0hEjtfiKB7gCzYvzMoO5YLTsmAOTwEBBugZ8bod3XoAUtbl//UVU44PLH/X8pKdbqH1tPJxmcAszLY1hz+1fdDPG6cHRj7sU55e6hjitkTJ9oSJSdUrrSCoLLkFDKc6i71TJZSzd+8viTmVJWu2eLw7qKN5EsBaGW5XbHZCdg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 14:10:38.3979
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f433082e-43ce-43f9-926e-08deaf67141e
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MWH0EPF000C6191.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR19MB997359
X-Authority-Analysis: v=2.4 cv=DYsnbPtW c=1 sm=1 tr=0 ts=6a01e369 cx=c_pps
 a=WO81/b4ipP7ax+rFmsMjaA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=_kLIPOSdNJ7StitxxVsA:9
X-Proofpoint-GUID: FIUg3CQmuGKrey5tngZTgDviQmJMpZbu
X-Proofpoint-ORIG-GUID: FIUg3CQmuGKrey5tngZTgDviQmJMpZbu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDE1NyBTYWx0ZWRfXxxM2E6559ciT
 r1o0j2YsLnzQQzy6RMf665Rev++BlukjzsYwXuCpqYjkCugjDmxiL2GvmMop2wgowV9bMSKhmWJ
 gDsINyRdCc54Tyof7UtKavQOKM5MlCo9DZiDJs4iBU86eFI5UHtJumxtZSX39F7irKsXjIPg/AK
 LDlDl9uT8rwAjpqaSq685oop0EuwlTcpTm9xAPK940xV6pRSMb8mNLzGWv6xoP4IdjYdStK7UbL
 V9D6b1J5y+ZKytPrdFC7/xVezYeZ7D9hGH4PEXtkXtbRtX72tf9xZ5PqH2wfrK6d8F00Bbmbma0
 Cc1xJGl9IDe3D/hUJ4C3kH5Ixiq0aHpQcKs0HS8uUqZqJG/f9wny3AO8LMnNDyU526QF8L2MAnY
 ctmtSjiIYtRWEra5aET0Jw8EK/SoS+H19TWH0daH2/zBlnS/V/84WODfJJueL8+6RaW2+NGOD7o
 MfKxCq/Bc7S4c2eDTLg==
X-Proofpoint-Spam-Reason: safe

Update the driver to use the new core helper that waits for the device
to enumerate on SoundWire and be initialised by the SoundWire core.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v1.

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

