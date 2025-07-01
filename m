Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011027.outbound.protection.outlook.com [40.107.74.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A4878F66
	for <linux-sound@vger.kernel.org>; Tue,  1 Jul 2025 00:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751328690; cv=fail; b=ZE+2zuhvbmtrUzuPDAHXe91bSjGx/zIfrfvtiLm0OpmxHve+afivlJmlfUPXcdtz0o5B4Iq5FuUV/3SarTCh3wYpHn0XsJs2Xwwa/zLuktKotd1qHy/v+egGHQlWFOJpeho2umQDuu0whI/t/PHvHlaXdjFXr6xiCISq85sVsjU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751328690; c=relaxed/simple;
	bh=/YtYDC+BJWg4flyk6nbe5ZeEAi4UcWYRSrHtdN6MeH0=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=BURt/qd+nEu0xRtqyp98kt4m2LQJuphgNeBj49LiS2twbAFRs9fVBrvnctL02QCWgQi7jFUImeqIrgN/OVVvHJFZx/rx95llkvhzIi/A4/UnINNdghW4BIZyDaaTCTnjAiAuoqkX64Vl7EJPaDpzbB+drDmLfUpdl2fIIUo3Bi8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=QRu0CYE8; arc=fail smtp.client-ip=40.107.74.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="QRu0CYE8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZvNxNlofumKlJN6TmSB6R6JBtpex6BKKa1Gx5pxgER7IRS4Z+UHJqbwqkMsVClW0zYMy8KN3rmcdZuMeVC9gDWkGs0d8Yg6pNDH61yL5RWUxQk19pz558shDbo7ld6lKzo9yLUGRAvcrkREVtCdhypUgLsHqZo2QKVmV+izCJc/SxQLiBg203CQ2Y21FWJrbS1p9dm6oEZFMkgm8pSSEI4jj9HomgstHvECN/aGyw00T4/Kbp1ZwomOrnSIEKkv80zh8jFFabo/fAY8JFiXWaWVQfhdbAAtCDos4QNt1Tq5OJkP4OCopDG/AL9mAZEFR+xgOXIUKdJLRo5eEI8okDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zFTVdDwJIzm3tL7N2fBCQU3fIp3vGmrxfB8kp/uwoHU=;
 b=hliyvjbfDB1nOtcLG2uu7UiryRRHKOmdu5+3SeeL0WJ8QXTNAcTDEZhUHJ4AZAWZe1vvVgM2vjFth/lE8QvjMhmKj2j1FXPZUGLhnqNnd9JLiXX5Z1iNIYb73i2eqzHFyNFe2JLpVVuvNbIeuue6TV9ImuR/bFVhNTn8WhPgFQqF1TUjy2AC+QnlgT34VGJ4qfZfdbbdll2SnDWxOH4yMhiOj8pnJ24J6rQxcyxqeWxRSxyOnZOLbKXCGbXA/ZZlvR36EcSXm0PhBmgQ5b3gQa52QNUa4DKTGvtiqtK7MrFzAyaRKo/xTZ7CKkhRErg9qEPtvkj4WeiUiSdfLS8rNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zFTVdDwJIzm3tL7N2fBCQU3fIp3vGmrxfB8kp/uwoHU=;
 b=QRu0CYE81CuTcrbyk7E7WvO/gRshS4nBUilMei8huyD+sJVgDQD6R0DN9+46hppZQPaySf+YQHMXEWPLOll6n5595B1BgQtIz/Ruyn6aBlSTpEfWkKtHSH1Gl71qr6QiDyG75ZrBMJK9upXeTLlaQsBM6tZ6npt1PbkkuCIpVlQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB9770.jpnprd01.prod.outlook.com
 (2603:1096:604:1ec::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.29; Tue, 1 Jul
 2025 00:11:24 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8880.021; Tue, 1 Jul 2025
 00:11:23 +0000
Message-ID: <87ikkchis6.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 11/11] ASoC: soc-dapm: add prefix on soc_dapm_dev_attrs
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87y0t8hiue.wl-kuninori.morimoto.gx@renesas.com>
References: <87y0t8hiue.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 1 Jul 2025 00:11:23 +0000
X-ClientProxiedBy: TYCP286CA0209.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:385::12) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB9770:EE_
X-MS-Office365-Filtering-Correlation-Id: ad0fce1f-cee0-4566-a06b-08ddb833d072
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?abUaOC2yuqhXReaa2rxbaqrxsMWZBAry7pbJjhSBraU8kKG2YmaIVxdY6f03?=
 =?us-ascii?Q?htrVA99jSTgP4IaSq6KEXPmwe59xwl70KktXD8PsXJarJMCGlb+x9Vj3GZ26?=
 =?us-ascii?Q?K3UUdJeaqLv0B0rXl3pYDlG3HiBoh3yWQS1CSQNRERXyBK16mIqYgPqwrw0N?=
 =?us-ascii?Q?uLdeC+BDMoHRmN/OqKFkUh+OVbVCyhUPUh3q+cgshAHi5y7vBokj5e2qtx/i?=
 =?us-ascii?Q?stfIWWE6OQKj7+4I+CNOCoM2ZqBlTaNHC2WQ7OxR5pDOGW3HKo2ZMI/Or78i?=
 =?us-ascii?Q?OLhNhf3yhG+0rzRFPxAC5gc1Nfm/EMI0f1a/rBWD7TP6fs7kGoPqaHI+X0Z0?=
 =?us-ascii?Q?5dL40sa3oP7teXW3e2OIDI79xFdDIjMUlHbDPDRnws426PbGiI8dcx7ur3tA?=
 =?us-ascii?Q?iaAw/DaSvqlEwA3grruho5ODSvVLMc3rprvaGwhp4nL09AtEHdoyZb17WBIC?=
 =?us-ascii?Q?Cd9D30PeajxoO1+2KsLgEf58XPWP+lhtm086GLBglOOTC7Us56y4nTEoQplg?=
 =?us-ascii?Q?VQLCcYiYEB4HnzFpszysOsDQ+qYMQmCs6uEuPOBN23YCFowdMuW2i25mc/M/?=
 =?us-ascii?Q?03zi+WGpshKo4xnIS2yMSrgr5rFG+AfyelUDiN7Nbp4VfgkuiEzzHixYoWD5?=
 =?us-ascii?Q?T2xoaFTR1lkw/4RQ5qn5NXZrk0ist7NdU5zIg9aSS1qR/TLwHfvoNXEnn+/r?=
 =?us-ascii?Q?zO7lkKYpXVlypzLqHPxb7OkXib32UhGBwuaELDpenJVWfvS9TFGYmG02X2U8?=
 =?us-ascii?Q?sEfyyzXp2Iep9/y94tJ7nIveMsmLNT2+1w/rkeYOaoC+JXLvqqRIdYy/AeTk?=
 =?us-ascii?Q?KIDkx0JWOP1J14Me8tFku6Ry7I+oxTr/2wSbjwpV3c8f+pk1tMjunr/nsdHa?=
 =?us-ascii?Q?vsmbc3yBHotUkGUfHPQA4ZKtr8D57AwBeQMVKCiDPYJEgm1qWcxSB/w9xgFG?=
 =?us-ascii?Q?bqz3wo9c8igVyUqfmQEFgSGMjcrlHctrZg4VqNN0aGuUvdAADWchh8EOLokr?=
 =?us-ascii?Q?QbQR1ecruwPVsis8tJZurxqeSL01SR1KgKr7eUOK8OroCXZu0AitHB3A1Wlm?=
 =?us-ascii?Q?wSJwbUe7l9F4gxtbWzgB8cdn7s85B6jFtoliXrpa+T5/X3oLE1TSsJwT52OE?=
 =?us-ascii?Q?qWnrGNAGVfEOmF0Q9S3psndbenDPllpPI/nqinuzzN7kWholCPzbI0dtWBZr?=
 =?us-ascii?Q?QBsAoReTjNSVcJ2hO23pnvZTbblU1xMX/jBgDeBHLnoiyrGzlIXbkhe9n6oj?=
 =?us-ascii?Q?zQD6VBxGYCO6mP/m0rR+kaKgO0Kf0hvxEItqpJJbxh0hppTRh0p7Sjwx/pEB?=
 =?us-ascii?Q?e+J6WXvLbbM8MP2Y9fOBy9HpLlyVFqLSW1THP2WpPFQ00H1Lmu92ZwR4ngcV?=
 =?us-ascii?Q?mMQgZ5vIgGq0b7ZXghXpKB0T+nxb1wxTxh/VfSlSdxj9v+F39vOnJga2hN9E?=
 =?us-ascii?Q?8O8rIVAfMRSfKTG8K3iKvIW3hW7kcSxVMAv1GcSnUR33O57Nyazs2g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hq4F2a9WIiLaeV6B91fFuEhzFO3Qm1b8xYrXvb/1SU5YKjtg8NN3GFl3XW/h?=
 =?us-ascii?Q?Oz0fEHDFcsfAoPPxA/2hblPCD9ioKCXryDdjWLXLXL2dZHLim67bcuC3Ue6E?=
 =?us-ascii?Q?WvjXtId+t2Psjv7BKT2dmD8f+duijtEyIx0Dz1Z0Qb7NSQJXolPcDPSSt5cn?=
 =?us-ascii?Q?6T9byF8Z/f14/ABEjIbpWHM8OPNi6SeKJNaj1e6QhMaeUF6UdhC5kqB8iVht?=
 =?us-ascii?Q?L3ckygpLnIXhlYOIAmjoiIFieb9YMUGpkRXFjXuleRntvEL1ViLWcIGf7Ppa?=
 =?us-ascii?Q?x47v9JzRE1Y6gHkUoi6tV+Za+cvBu/oG72rIYn37LhoNsbAcceIa114VL0Gi?=
 =?us-ascii?Q?D9T8+x25o3GOULl70MNf25OHxs5niUweeGdh0XO7aBQGrxz+tGbHgUaYqzfA?=
 =?us-ascii?Q?o/wetZdF2j236IhHf2WqP9/w5BFDYwtPJ+D8wetZTXkcfhBFJTBYVxUuEMjq?=
 =?us-ascii?Q?QdrLzVhjwZw0avYaRAk1zygxJMEAR75chmvZunPpg2dcxfx0+vJLiNU1JlRF?=
 =?us-ascii?Q?c1nL5T00PbMo1rJYUm88TPFHTuS7I6TcPBKVRI6C2x1rr11Pau8D8qyk5KEy?=
 =?us-ascii?Q?rtBI1/eO7rfjLP2tsgJRPSx3WWOUpgHeFcpbTR1q6hR8RuQrWhGFwaTcFXC7?=
 =?us-ascii?Q?WBdLOehLdquO4l6qtPLpikwHIzyLVWE61sFMKWAEGnTjLiQ3otFGpY4NP1QS?=
 =?us-ascii?Q?TMi/Tg9rdxGrKO5wR7zahwtYcdIXt2iPFCQC28oKjY4AnWASV7DAEC5v3HT3?=
 =?us-ascii?Q?bBqrLmkMjpqht4N+gCmKoRSwjnbB0TEj/uuNwUmaYav6A49U9mWejFrk4xpT?=
 =?us-ascii?Q?HaFyQnnBf3BeNMJx6EyaQRhJYDkuGLoUpFm6S/SFUNfmig45kMjoU7rECpDn?=
 =?us-ascii?Q?66ei/dGvP83L3N0ev0+2owV0XP8bog4w1uSGXG2ah3osEqOHo339cGoyQnRQ?=
 =?us-ascii?Q?i2JOw76z1oJ+FB8ds6O+gsqWNIe2jSW+i0pyv5N0+4X/m4tfV5FAw1/bZZDr?=
 =?us-ascii?Q?KecaNHSFxkUxUniGIYh7mFulMwOmCs4aQvlosFpOj+dTq5ifVkJblwnY69Rx?=
 =?us-ascii?Q?l+cuKtI0CFMBLzYgg37Q8ilP7TCafAlaYJk4NyW+eFudGjHQx1AqKUdLmhnY?=
 =?us-ascii?Q?hIBxOK3GJD8hyV19hcIwgJyMloaFhyMPvyHTrEn1ig465MIbDhNm9k00H7yR?=
 =?us-ascii?Q?Tm7VqI1uAahKJGsmrX5yZ/MqW4CmZNAFOy81HF+UobCleeQzmpoxIXxDu8Hj?=
 =?us-ascii?Q?O6VS4RRmSWgWi8gZtsBrfmbbFrDYQms0WjEegk1PsqdHDA3CBDvTXLEi4U8T?=
 =?us-ascii?Q?LEpY0pcwLmlpBiIOF2mspw7jaHBMsNUga+BfzuDmEhk0JQb+J3ZcVPDbo8PB?=
 =?us-ascii?Q?KBuWQssDy3flzrlqpP+Zi3rXD2hfi9aGnRgPY+G0IbJTbyILsWdoRweDBqGJ?=
 =?us-ascii?Q?OhUH7TI+MsyTENRFCFTq6QO/i2VWDaveKYmvSpW98WDXONaIJIrEV9OZpspN?=
 =?us-ascii?Q?khLQlEMxpYTkU6O7Fh5srEa7NCTx3Qam5BB5XdE4qQBnCrozQFpMjMh886dF?=
 =?us-ascii?Q?Gs2BmRCO/ycsQw6k8oiXKJB5kcEBiC6d2yrd9mIGu1hH6QzxLE58eeM7Qehs?=
 =?us-ascii?Q?egESat9FKNCJnOmZz8PUPyI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad0fce1f-cee0-4566-a06b-08ddb833d072
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 00:11:23.8835
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FT5RXTMxBemIcFCDT9IQEFjwgSlxJj6EUCgpZdwEGoNe4seHMx8Qxflz6Sdi6YdkVjeFzT/vh+Zt/VoR0EyUzNQqqgAzyuJVpSAMTz/tTEapJUfoJFBo0jHMvj2mgtog
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9770

soc_dapm_dev_attrs is global variable. Let's add snd_soc_ prefix.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-dapm.h | 2 +-
 sound/soc/soc-core.c     | 2 +-
 sound/soc/soc-dapm.c     | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/sound/soc-dapm.h b/include/sound/soc-dapm.h
index be5ecc276562..0b5c7e6a90c8 100644
--- a/include/sound/soc-dapm.h
+++ b/include/sound/soc-dapm.h
@@ -685,7 +685,7 @@ int snd_soc_dapm_mux_update_power(struct snd_soc_dapm_context *dapm,
 		struct snd_soc_dapm_update *update);
 
 /* dapm sys fs - used by the core */
-extern struct attribute *soc_dapm_dev_attrs[];
+extern struct attribute *snd_soc_dapm_dev_attrs[];
 void snd_soc_dapm_debugfs_init(struct snd_soc_dapm_context *dapm, struct dentry *parent);
 
 /* dapm audio pin control and status */
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 31dd013dcf1d..37bc5867f81d 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -112,7 +112,7 @@ static umode_t soc_dev_attr_is_visible(struct kobject *kobj,
 }
 
 static const struct attribute_group soc_dapm_dev_group = {
-	.attrs = soc_dapm_dev_attrs,
+	.attrs = snd_soc_dapm_dev_attrs,
 	.is_visible = soc_dev_attr_is_visible,
 };
 
diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index e8bd83fb9ef4..b8a5875378c8 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -2715,7 +2715,7 @@ static ssize_t dapm_widget_show(struct device *dev,
 
 static DEVICE_ATTR_RO(dapm_widget);
 
-struct attribute *soc_dapm_dev_attrs[] = {
+struct attribute *snd_soc_dapm_dev_attrs[] = {
 	&dev_attr_dapm_widget.attr,
 	NULL
 };
-- 
2.43.0

