Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011040.outbound.protection.outlook.com [40.107.74.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F9F8C11
	for <linux-sound@vger.kernel.org>; Wed,  5 Feb 2025 00:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738714592; cv=fail; b=WnRmALGcJLGHHNjWhGFWaJh92L2XNxbxfGINSh+Y4oVoZ+y5aHhXluXmyZwhfc7L3qGItkus5TNIXnJtLGKVlTdI4qtWhl0iIbRgGaUL05eH+S8vBWdeXBVVKhP58xnEhf9fGXD0z2shyRggWLeEp0cPiA84Fm9X5TszMr0P+vo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738714592; c=relaxed/simple;
	bh=KYIhKKl0Old86GMWkuqn0/Fbl98khVivX6HvMullBLQ=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=LHmWyUfnrZp12D+TJK31KYz4AGB/dHNb/6O6b3yIQbrKP2F0iMvlHQwgW/Ub0OHxjKUnKC7mH91gqRM6Dk/LBv0iixmRfUCI2oiZAd+OfmMxvAcUfdEMU356HlPIUMlGMbqaUyJg1BHQCAcJA5LTRIefivdT9+H1yUn2enWXQtY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=cKdy9xyk; arc=fail smtp.client-ip=40.107.74.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="cKdy9xyk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CFmq8SpWq/N0yae5EGr310UmQOaXPurT8wnGYfQNaUsjuCVznP5Y3VRvbynBN0JpfrMWUBLCm+mRw+qzhJl0P0osNjsIkR4DLOnU2YyIQYKzJFG/Q/O6zqNFinbGMTF7YvUcaIjsQQdrssFsyMV5WuCer7cuA/LxNDZLz55pmhTUbQLLkZT2npTjc93iXx7ajugiWEC1CeGHc3v8M4WAlLhH+GBn4ko9mCoAeQmiNnOElNBvdhDpv6fGw/9q88KtvmyLd7/ix/lFsJwGn0CB43bRQqM5JF/EPufj3TgeytZEimImAcx0DrhiPb/HDDUHrSZmq4f7sMkIfy6tGVziJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dMVXdCR/aUxJlyoN79BdkJK4FrGVoAKrvRvzDzt/foo=;
 b=rkW2ncsD6IJv8D9wYfH7DjERxtz7Ta0VSADnbc+5jNBdZUutsUHN/DqnlP8F+71mgdYNCjsiqGG1Qn2GZoFdurRbD9XKYCcn8COPIsJiZ6RVkuruJtleh+wiPbWPYd16yerOmCXFjh2v1q9Zdqn4aXWGzJxrKf1kKVhTUcIGhPSWPt3XSlUJPWKlxFW+0E9/z6963Q0TihKK8Kub9RzX2b3aGBe3wy+/y/GfAP+buAhhw2ZSAwHqBjzLE6TzDc2u47dAwuyPinK4P3D2FES1R2LzW6IXwvDioETWamshyygdgMHFLCTIakBlfYzahXVjnc4Id64IzEJrfPg6ybXOqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dMVXdCR/aUxJlyoN79BdkJK4FrGVoAKrvRvzDzt/foo=;
 b=cKdy9xykcoSEA8buxn1Cujvl90yVNYDWJIpaLCJUZgvWLrBOwO9vzpXwu9NJzv/79EKIlyFdI0SmRNNm4AUnYys04bExW132U4ZDTCc5RXWUnmHZEs27dSNyjO83jQ5Eaa/ybgVH0ejmRm1hutblqNrnjCvqIhfDIqryaEDnFNk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB12774.jpnprd01.prod.outlook.com
 (2603:1096:405:1b3::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.10; Wed, 5 Feb
 2025 00:16:27 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8422.009; Wed, 5 Feb 2025
 00:16:27 +0000
Message-ID: <87a5b12qlg.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 5/7] ASoC: simple-card-utils: use snd_soc_ret()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87h6592qq3.wl-kuninori.morimoto.gx@renesas.com>
References: <87h6592qq3.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 5 Feb 2025 00:16:27 +0000
X-ClientProxiedBy: TYAPR01CA0174.jpnprd01.prod.outlook.com
 (2603:1096:404:ba::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB12774:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ea2d9b9-6d1a-48e4-0b24-08dd457a556f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xCtJnaKyAwthTwtP+0hFYip7QYb0pFpPEkYGz6KD8umH5/OZmJjK9237Li30?=
 =?us-ascii?Q?MNJA7uXp2GGsDpirDKWTBU+wNgDScVmmsXnKNhqi3CIB5ufA4OWzMcOJE8Pi?=
 =?us-ascii?Q?IlXRzjbIfeUgo2dkIimKc2JaNSG81VqNpYXHBAxThqybyZdLOqAR/dvoJKaY?=
 =?us-ascii?Q?0tS0xyu7LYmtPtbp+GxOGph3dyqwXZk/aTv4iNP0SkYUWVEsY0HgR85hnSyV?=
 =?us-ascii?Q?gV863NLanMC9QI+eKtNZq8jO8FH7QKp1uU99wPfbaTtXG7oB7261L8sObzGp?=
 =?us-ascii?Q?5iYuIeMASrUyWL065/ZRPwtzBAEa7q7E8xhkUZAcrEeY/AWbTylV2mDtVU3N?=
 =?us-ascii?Q?WMYzpeFoGhXmY3CqKQM6OIXq4h/f6jnYP20dAwuu4l+FS6dlvDDYLfiTxjZp?=
 =?us-ascii?Q?zmrgLIrNGh52KpZtgxeGIq0H2pWAixKjyX/vutvGXWMo+ae+mHm1yvTU1IbC?=
 =?us-ascii?Q?2Qh0n9QDyq+GDH9vqN1NhckxpozWrP//JqEav5QFjauXbvHp0XvQOMsxbwvx?=
 =?us-ascii?Q?5wevS3oq0LwNz/ObBQPL/pHxDi9VKG4yq9Jr3IXOCw8f+J3dh9qSkW3nQ7/q?=
 =?us-ascii?Q?wE5V4ZUHQ3a0XRkN3/cVDPvhdgsdfKvDIUOtQJuzOlaad6dtdex5EP4Hcshk?=
 =?us-ascii?Q?MiGc5ZxoY8ec6yBEUqc27Tn0sKFE91C4AVRiwLKOaHFuFrzC8YN2pu0N6u0p?=
 =?us-ascii?Q?WuLdDTIJ0nKOGLfZjrEW4yGvGCGXQAxnKT5ncIHz+gGkbsYSHFN0FEPevaGn?=
 =?us-ascii?Q?755Az4D2LT8yuJYjJXwzdVP/lhWGk79dXvHRsKolUzR4AebfmymVRnMg4dWs?=
 =?us-ascii?Q?rAVCC/p3R/iCenWC0D/RSI8mozH4EMEOdgsYQNCfvyZeGHIHMmEoomRaZWPF?=
 =?us-ascii?Q?/x2Pfwm39qqWDmSJ/NhXZFJnpnn4d6MVUviTUeJPEKssnbJcdj4FuP0WlH2X?=
 =?us-ascii?Q?m+r/ZyX7Lqjf+hS60iKGopJ1CA15kOwWJilpKBlanMVhvChSApyUCy9Ckzmp?=
 =?us-ascii?Q?iOL3SBY+XadsRSvcMtFEmZyJ7IMTNwp8fxs8Y1R3Jd3GUjDJOKCSE2Y0MVK/?=
 =?us-ascii?Q?NaH6ve6cSYxKwKqVPufZv6nyhKB0viW6BpNgocVXCgRHHPumPhRPBV1o929I?=
 =?us-ascii?Q?3P1WJ+HoHGbO+POZH3CCQNrVcCsMYJlt8Xm86hWlr1BdGMQz1yr1dN6tcbmq?=
 =?us-ascii?Q?wVsgQKcRHmpFxcCZHy8pZKWZE2FU+jiNdelxKKfZGRpFMgJjugeFsAKWuITL?=
 =?us-ascii?Q?YH1uAP1kScrvfQW970wcjM9Yjlc1Ec3R5+/gt+sTtC3UKwEJ4nFmkXuAAe5Q?=
 =?us-ascii?Q?ZTyBssJZqHCQcSKB8XeK0M3KoCqYOjE0bFYEKVO0uTtP0Vx9XmFrGGR3Ec2a?=
 =?us-ascii?Q?WZuSnB9vShKI3iJ04+vfIWq3RkSgq4etHXaeddNq2tulpcLtIrJJDsFT/zp9?=
 =?us-ascii?Q?pq99YAFWSb3mm2kf56Yf+nhzmcEw50za?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?q2ERflCIckRrynDYKTVPbECV4cTR2FydNoJYbIPF3axtV5jWFTDdYmfXWM1m?=
 =?us-ascii?Q?DZ1QPtri01p1mbk+2qZbyMSSqqurv03IxunH3+sYnFewZkdZ1IycV5V0gSvO?=
 =?us-ascii?Q?7H4rpB4E0ozQdtKy1s+jLcIKAXQ4hOLkHNEYP0rErOsuMaYOelVmFlwVbBH4?=
 =?us-ascii?Q?4BAhhZEXzIuCLCUFxuTjCL9AYiu5WvakmczEqJg2Dl1XikYKICPhHT9yXJ8Q?=
 =?us-ascii?Q?QklYGPSzA/8ObvNHQkDS53FeU+TDNaaL8u7IkGgYl12XSOQfeAdfZD77vMGl?=
 =?us-ascii?Q?4CjM39UiC6P8L3bnXeprMclZIyMiqx5bwpAKdn2exbchSuvfo8JVwzdpc9bN?=
 =?us-ascii?Q?UDEz1dFhpLy5ILnADiggh/NaLVSZC83WZRyJtq47O4/l0BdlfdsNw5WqyrG5?=
 =?us-ascii?Q?y0rlwbTx9Q0dyiA/x1sTvZraBVhO40qFEBLq44BQVshKseIeWn3t3qKtPZk/?=
 =?us-ascii?Q?Kdsoqj/z5zwdQQ9s3AU0uTvxSs4u94Nm6Tb9GVSxVj/phk+bla4p7WlS/N0K?=
 =?us-ascii?Q?1g42HMsa4x/cZfxAjosx/NQnDSyazZfilUYEZ8wezbfLDvjHLyw7shFjqL64?=
 =?us-ascii?Q?w7Fc+zVypggaa8gYpxn4wqwfXYmYYUFX7rbq01PsaJQ80jYfM2DO2JTKyWsS?=
 =?us-ascii?Q?tgRYyXWlUOeYQwCLlUWGYXgKLqETgllbdt2Ymg5l26heeF8ALYNh8Tp/Iqpp?=
 =?us-ascii?Q?NhGJnXqgkVpxa2tsVy34Chmx4argXARrbcnqcxLJOosfRA3jCvQHxTcRWXbC?=
 =?us-ascii?Q?ZH17+I2hbgm/9i2GvDK5SxsAG90xnG1djndJSvNfkfEH7x16wXH9rQQQQGD0?=
 =?us-ascii?Q?AOhulXqiNLCOD1KumbrFjGd25dySmyqHaTqz0jZfgwIxwiPTLn67ZEjKG/q3?=
 =?us-ascii?Q?2tAjjql8vqX3GICi94F8KvlMZZGIcOaXdRYdROIZa20OPkqxfS+NdU1/ciUu?=
 =?us-ascii?Q?GsAsnFaZ4R/uPEPDvtLRXeQENzU5AeMKBqqgKsvVMW34nHkRqBBICdb/1bUa?=
 =?us-ascii?Q?mCX6DWp8dW6NaqqLVFn3ecxrbc+2KvMfzScexFSHhaEOs7FxXyQl+dLFmIzb?=
 =?us-ascii?Q?es4Lot03sAer6joB8cldG1CLTabYhUyTtPeUw3UWkNGF/6frGA4B647/h/5X?=
 =?us-ascii?Q?j0gSr5kmiVKqpwcUKVqw6ij50VgzbrWootmieqLh0g6oul3lfj7kebhLfxJo?=
 =?us-ascii?Q?CecAJor+ZUF0Lis1Oy86fUKTORoWsdg8lgSGxmJI9Ve4Y30/cD1sfmAZBxjO?=
 =?us-ascii?Q?s03mlnOBDiTgS1G3uOVIhHbTk3hTmVonrFFadkIhWwDJrZcwERv0VD6UvXPY?=
 =?us-ascii?Q?gkVQ9z/vRF827XrvN13SJHDGBryDwG5f/oA2FFAfa5dCMUkX8W+MoAum1Hq0?=
 =?us-ascii?Q?n2JkkfgMGSktiPeVxQZhuaR5YAYmhdoi7Wtn6esLwrPXSCXe1xlBrwBJRfnd?=
 =?us-ascii?Q?u3i955RqffRm5k70TUFu6foe4gbwiw6FaIWXp3se2H9+6HrPkkmk5AeuT5RV?=
 =?us-ascii?Q?dL6v+J6HVhIwEjm4tbXUJrkV4rW5tEsXgxZzeyPPd33ccN+Y7UDq+rRMKDpg?=
 =?us-ascii?Q?+MVfUIbHKxEQ19hgB67sO2gUl77BEJO7qJNeW5HsfemKjeXKRNM28XkuhaJk?=
 =?us-ascii?Q?STc/AWmn/TGikBj/2hHiGJc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ea2d9b9-6d1a-48e4-0b24-08dd457a556f
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2025 00:16:27.9019
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UNLY8RFBo3RXPz16kix0gbD3GKGMI9PnYu4SqjSWenj+SeYFQdnyOypaK7Hd1/15IOd1y57l0Fp6VZPzvoqQPAfHVQo3IujrXZbzvIF2GQcuWr9lMO72LBfNgw37onQA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12774

We can use snd_soc_ret() to indicate error message when return.
Let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/simple_card_utils.h     |   8 +-
 sound/soc/generic/audio-graph-card.c  |   6 +-
 sound/soc/generic/audio-graph-card2.c |  14 +--
 sound/soc/generic/simple-card-utils.c | 170 +++++++++++++++-----------
 sound/soc/generic/simple-card.c       |   4 +-
 5 files changed, 115 insertions(+), 87 deletions(-)

diff --git a/include/sound/simple_card_utils.h b/include/sound/simple_card_utils.h
index 892f70532363e..69a9c9c4d0e9c 100644
--- a/include/sound/simple_card_utils.h
+++ b/include/sound/simple_card_utils.h
@@ -142,14 +142,14 @@ int simple_util_parse_daifmt(struct device *dev,
 			     struct device_node *codec,
 			     char *prefix,
 			     unsigned int *retfmt);
-int simple_util_parse_tdm_width_map(struct device *dev, struct device_node *np,
+int simple_util_parse_tdm_width_map(struct simple_util_priv *priv, struct device_node *np,
 				    struct simple_util_dai *dai);
 
 __printf(3, 4)
-int simple_util_set_dailink_name(struct device *dev,
+int simple_util_set_dailink_name(struct simple_util_priv *priv,
 				 struct snd_soc_dai_link *dai_link,
 				 const char *fmt, ...);
-int simple_util_parse_card_name(struct snd_soc_card *card,
+int simple_util_parse_card_name(struct simple_util_priv *priv,
 				char *prefix);
 
 int simple_util_parse_clk(struct device *dev,
@@ -201,7 +201,7 @@ void simple_util_remove(struct platform_device *pdev);
 
 int graph_util_card_probe(struct snd_soc_card *card);
 int graph_util_is_ports0(struct device_node *port);
-int graph_util_parse_dai(struct device *dev, struct device_node *ep,
+int graph_util_parse_dai(struct simple_util_priv *priv, struct device_node *ep,
 			 struct snd_soc_dai_link_component *dlc, int *is_single_link);
 
 void graph_util_parse_link_direction(struct device_node *np,
diff --git a/sound/soc/generic/audio-graph-card.c b/sound/soc/generic/audio-graph-card.c
index 7c422535b01a2..bd7ebbec0fc9c 100644
--- a/sound/soc/generic/audio-graph-card.c
+++ b/sound/soc/generic/audio-graph-card.c
@@ -111,7 +111,7 @@ static int graph_parse_node(struct simple_util_priv *priv,
 		dai = simple_props_to_dai_codec(dai_props, 0);
 	}
 
-	ret = graph_util_parse_dai(dev, ep, dlc, cpu);
+	ret = graph_util_parse_dai(priv, ep, dlc, cpu);
 	if (ret < 0)
 		return ret;
 
@@ -183,7 +183,7 @@ static int graph_link_init(struct simple_util_priv *priv,
 	if (priv->ops)
 		dai_link->ops	= priv->ops;
 
-	return simple_util_set_dailink_name(dev, dai_link, name);
+	return simple_util_set_dailink_name(priv, dai_link, name);
 }
 
 static int graph_dai_link_of_dpcm(struct simple_util_priv *priv,
@@ -586,7 +586,7 @@ int audio_graph_parse_of(struct simple_util_priv *priv, struct device *dev)
 	if (ret < 0)
 		goto err;
 
-	ret = simple_util_parse_card_name(card, NULL);
+	ret = simple_util_parse_card_name(priv, NULL);
 	if (ret < 0)
 		goto err;
 
diff --git a/sound/soc/generic/audio-graph-card2.c b/sound/soc/generic/audio-graph-card2.c
index ee94b256b7707..945a16e6d6919 100644
--- a/sound/soc/generic/audio-graph-card2.c
+++ b/sound/soc/generic/audio-graph-card2.c
@@ -409,7 +409,7 @@ static int __graph_parse_node(struct simple_util_priv *priv,
 		dai = simple_props_to_dai_codec(dai_props, idx);
 	}
 
-	ret = graph_util_parse_dai(dev, ep, dlc, &is_single_links);
+	ret = graph_util_parse_dai(priv, ep, dlc, &is_single_links);
 	if (ret < 0)
 		return ret;
 
@@ -417,7 +417,7 @@ static int __graph_parse_node(struct simple_util_priv *priv,
 	if (ret < 0)
 		return ret;
 
-	ret = simple_util_parse_tdm_width_map(dev, ep, dai);
+	ret = simple_util_parse_tdm_width_map(priv, ep, dai);
 	if (ret < 0)
 		return ret;
 
@@ -443,22 +443,22 @@ static int __graph_parse_node(struct simple_util_priv *priv,
 		case GRAPH_NORMAL:
 			/* run is_cpu only. see audio_graph2_link_normal() */
 			if (is_cpu)
-				simple_util_set_dailink_name(dev, dai_link, "%s%s-%s%s",
+				simple_util_set_dailink_name(priv, dai_link, "%s%s-%s%s",
 							       cpus->dai_name,   cpu_multi,
 							     codecs->dai_name, codec_multi);
 			break;
 		case GRAPH_DPCM:
 			if (is_cpu)
-				simple_util_set_dailink_name(dev, dai_link, "fe.%pOFP.%s%s",
+				simple_util_set_dailink_name(priv, dai_link, "fe.%pOFP.%s%s",
 						cpus->of_node, cpus->dai_name, cpu_multi);
 			else
-				simple_util_set_dailink_name(dev, dai_link, "be.%pOFP.%s%s",
+				simple_util_set_dailink_name(priv, dai_link, "be.%pOFP.%s%s",
 						codecs->of_node, codecs->dai_name, codec_multi);
 			break;
 		case GRAPH_C2C:
 			/* run is_cpu only. see audio_graph2_link_c2c() */
 			if (is_cpu)
-				simple_util_set_dailink_name(dev, dai_link, "c2c.%s%s-%s%s",
+				simple_util_set_dailink_name(priv, dai_link, "c2c.%s%s-%s%s",
 							     cpus->dai_name,   cpu_multi,
 							     codecs->dai_name, codec_multi);
 			break;
@@ -1332,7 +1332,7 @@ int audio_graph2_parse_of(struct simple_util_priv *priv, struct device *dev,
 	if (ret < 0)
 		goto err;
 
-	ret = simple_util_parse_card_name(card, NULL);
+	ret = simple_util_parse_card_name(priv, NULL);
 	if (ret < 0)
 		goto err;
 
diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index c2445c5ccd84c..51e0e434514d1 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -15,6 +15,13 @@
 #include <sound/pcm_params.h>
 #include <sound/simple_card_utils.h>
 
+#define simple_ret(priv, ret) _simple_ret(priv, __func__, ret)
+static inline int _simple_ret(struct simple_util_priv *priv,
+			      const char *func, int ret)
+{
+	return snd_soc_ret(simple_priv_to_dev(priv), ret, "at %s()\n", func);
+}
+
 int simple_util_get_sample_fmt(struct simple_util_data *data)
 {
 	int i;
@@ -133,33 +140,42 @@ int simple_util_parse_daifmt(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(simple_util_parse_daifmt);
 
-int simple_util_parse_tdm_width_map(struct device *dev, struct device_node *np,
+int simple_util_parse_tdm_width_map(struct simple_util_priv *priv, struct device_node *np,
 				    struct simple_util_dai *dai)
 {
+	struct device *dev = simple_priv_to_dev(priv);
 	int n, i, ret;
 	u32 *p;
 
+	/*
+	 * NOTE
+	 *
+	 * Clang doesn't allow to use "goto end" before calling __free(),
+	 * because it bypasses the initialization. Use simple_ret() directly.
+	 */
+
 	n = of_property_count_elems_of_size(np, "dai-tdm-slot-width-map", sizeof(u32));
 	if (n <= 0)
 		return 0;
+
 	if (n % 3) {
 		dev_err(dev, "Invalid number of cells for dai-tdm-slot-width-map\n");
-		return -EINVAL;
+		return simple_ret(priv, -EINVAL); /* see NOTE */
 	}
 
+	ret = -ENOMEM;
 	dai->tdm_width_map = devm_kcalloc(dev, n, sizeof(*dai->tdm_width_map), GFP_KERNEL);
 	if (!dai->tdm_width_map)
-		return -ENOMEM;
+		return simple_ret(priv, ret); /* see NOTE */
 
-	u32 *array_values __free(kfree) = kcalloc(n, sizeof(*array_values),
-						  GFP_KERNEL);
+	u32 *array_values __free(kfree) = kcalloc(n, sizeof(*array_values), GFP_KERNEL);
 	if (!array_values)
-		return -ENOMEM;
+		goto end;
 
 	ret = of_property_read_u32_array(np, "dai-tdm-slot-width-map", array_values, n);
 	if (ret < 0) {
 		dev_err(dev, "Could not read dai-tdm-slot-width-map: %d\n", ret);
-		return ret;
+		goto end;
 	}
 
 	p = array_values;
@@ -170,15 +186,17 @@ int simple_util_parse_tdm_width_map(struct device *dev, struct device_node *np,
 	}
 
 	dai->n_tdm_widths = i;
-
-	return 0;
+	ret = 0;
+end:
+	return simple_ret(priv, ret);
 }
 EXPORT_SYMBOL_GPL(simple_util_parse_tdm_width_map);
 
-int simple_util_set_dailink_name(struct device *dev,
+int simple_util_set_dailink_name(struct simple_util_priv *priv,
 				 struct snd_soc_dai_link *dai_link,
 				 const char *fmt, ...)
 {
+	struct device *dev = simple_priv_to_dev(priv);
 	va_list ap;
 	char *name = NULL;
 	int ret = -ENOMEM;
@@ -194,13 +212,14 @@ int simple_util_set_dailink_name(struct device *dev,
 		dai_link->stream_name	= name;
 	}
 
-	return ret;
+	return simple_ret(priv, ret);
 }
 EXPORT_SYMBOL_GPL(simple_util_set_dailink_name);
 
-int simple_util_parse_card_name(struct snd_soc_card *card,
+int simple_util_parse_card_name(struct simple_util_priv *priv,
 				char *prefix)
 {
+	struct snd_soc_card *card = simple_priv_to_card(priv);
 	int ret;
 
 	if (!prefix)
@@ -214,13 +233,13 @@ int simple_util_parse_card_name(struct snd_soc_card *card,
 		snprintf(prop, sizeof(prop), "%sname", prefix);
 		ret = snd_soc_of_parse_card_name(card, prop);
 		if (ret < 0)
-			return ret;
+			goto end;
 	}
 
 	if (!card->name && card->dai_link)
 		card->name = card->dai_link->name;
-
-	return 0;
+end:
+	return simple_ret(priv, ret);
 }
 EXPORT_SYMBOL_GPL(simple_util_parse_card_name);
 
@@ -348,7 +367,8 @@ int simple_util_startup(struct snd_pcm_substream *substream)
 			break;
 		simple_clk_disable(dai);
 	}
-	return ret;
+
+	return simple_ret(priv, ret);
 }
 EXPORT_SYMBOL_GPL(simple_util_startup);
 
@@ -379,16 +399,19 @@ void simple_util_shutdown(struct snd_pcm_substream *substream)
 }
 EXPORT_SYMBOL_GPL(simple_util_shutdown);
 
-static int simple_set_clk_rate(struct device *dev,
-				    struct simple_util_dai *simple_dai,
-				    unsigned long rate)
+static int simple_set_clk_rate(struct simple_util_priv *priv,
+			       struct simple_util_dai *simple_dai,
+			       unsigned long rate)
 {
+	struct device *dev = simple_priv_to_dev(priv);
+	int ret = -EINVAL;
+
 	if (!simple_dai)
 		return 0;
 
 	if (simple_dai->clk_fixed && rate != simple_dai->sysclk) {
 		dev_err(dev, "dai %s invalid clock rate %lu\n", simple_dai->name, rate);
-		return -EINVAL;
+		goto end;
 	}
 
 	if (!simple_dai->clk)
@@ -397,12 +420,15 @@ static int simple_set_clk_rate(struct device *dev,
 	if (clk_get_rate(simple_dai->clk) == rate)
 		return 0;
 
-	return clk_set_rate(simple_dai->clk, rate);
+	ret = clk_set_rate(simple_dai->clk, rate);
+end:
+	return simple_ret(priv, ret);
 }
 
-static int simple_set_tdm(struct snd_soc_dai *dai,
-				struct simple_util_dai *simple_dai,
-				struct snd_pcm_hw_params *params)
+static int simple_set_tdm(struct simple_util_priv *priv,
+			  struct snd_soc_dai *dai,
+			  struct simple_util_dai *simple_dai,
+			  struct snd_pcm_hw_params *params)
 {
 	int sample_bits = params_width(params);
 	int slot_width, slot_count;
@@ -430,12 +456,8 @@ static int simple_set_tdm(struct snd_soc_dai *dai,
 				       simple_dai->rx_slot_mask,
 				       slot_count,
 				       slot_width);
-	if (ret && ret != -ENOTSUPP) {
-		dev_err(dai->dev, "simple-card: set_tdm_slot error: %d\n", ret);
-		return ret;
-	}
 
-	return 0;
+	return simple_ret(priv, ret);
 }
 
 int simple_util_hw_params(struct snd_pcm_substream *substream,
@@ -457,15 +479,15 @@ int simple_util_hw_params(struct snd_pcm_substream *substream,
 		mclk = params_rate(params) * mclk_fs;
 
 		for_each_prop_dai_codec(props, i, pdai) {
-			ret = simple_set_clk_rate(rtd->dev, pdai, mclk);
+			ret = simple_set_clk_rate(priv, pdai, mclk);
 			if (ret < 0)
-				return ret;
+				goto end;
 		}
 
 		for_each_prop_dai_cpu(props, i, pdai) {
-			ret = simple_set_clk_rate(rtd->dev, pdai, mclk);
+			ret = simple_set_clk_rate(priv, pdai, mclk);
 			if (ret < 0)
-				return ret;
+				goto end;
 		}
 
 		/* Ensure sysclk is set on all components in case any
@@ -476,39 +498,40 @@ int simple_util_hw_params(struct snd_pcm_substream *substream,
 			ret = snd_soc_component_set_sysclk(component, 0, 0,
 							   mclk, SND_SOC_CLOCK_IN);
 			if (ret && ret != -ENOTSUPP)
-				return ret;
+				goto end;
 		}
 
 		for_each_rtd_codec_dais(rtd, i, sdai) {
 			pdai = simple_props_to_dai_codec(props, i);
 			ret = snd_soc_dai_set_sysclk(sdai, 0, mclk, pdai->clk_direction);
 			if (ret && ret != -ENOTSUPP)
-				return ret;
+				goto end;
 		}
 
 		for_each_rtd_cpu_dais(rtd, i, sdai) {
 			pdai = simple_props_to_dai_cpu(props, i);
 			ret = snd_soc_dai_set_sysclk(sdai, 0, mclk, pdai->clk_direction);
 			if (ret && ret != -ENOTSUPP)
-				return ret;
+				goto end;
 		}
 	}
 
 	for_each_prop_dai_codec(props, i, pdai) {
 		sdai = snd_soc_rtd_to_codec(rtd, i);
-		ret = simple_set_tdm(sdai, pdai, params);
+		ret = simple_set_tdm(priv, sdai, pdai, params);
 		if (ret < 0)
-			return ret;
+			goto end;
 	}
 
 	for_each_prop_dai_cpu(props, i, pdai) {
 		sdai = snd_soc_rtd_to_cpu(rtd, i);
-		ret = simple_set_tdm(sdai, pdai, params);
+		ret = simple_set_tdm(priv, sdai, pdai, params);
 		if (ret < 0)
-			return ret;
+			goto end;
 	}
-
-	return 0;
+	ret = 0;
+end:
+	return simple_ret(priv, ret);
 }
 EXPORT_SYMBOL_GPL(simple_util_hw_params);
 
@@ -536,7 +559,8 @@ int simple_util_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 }
 EXPORT_SYMBOL_GPL(simple_util_be_hw_params_fixup);
 
-static int simple_init_dai(struct snd_soc_dai *dai, struct simple_util_dai *simple_dai)
+static int simple_init_dai(struct simple_util_priv *priv,
+			   struct snd_soc_dai *dai, struct simple_util_dai *simple_dai)
 {
 	int ret;
 
@@ -548,7 +572,7 @@ static int simple_init_dai(struct snd_soc_dai *dai, struct simple_util_dai *simp
 					     simple_dai->clk_direction);
 		if (ret && ret != -ENOTSUPP) {
 			dev_err(dai->dev, "simple-card: set_sysclk error\n");
-			return ret;
+			goto end;
 		}
 	}
 
@@ -560,11 +584,12 @@ static int simple_init_dai(struct snd_soc_dai *dai, struct simple_util_dai *simp
 					       simple_dai->slot_width);
 		if (ret && ret != -ENOTSUPP) {
 			dev_err(dai->dev, "simple-card: set_tdm_slot error\n");
-			return ret;
+			goto end;
 		}
 	}
-
-	return 0;
+	ret = 0;
+end:
+	return simple_ret(priv, ret);
 }
 
 static inline int simple_component_is_codec(struct snd_soc_component *component)
@@ -572,7 +597,8 @@ static inline int simple_component_is_codec(struct snd_soc_component *component)
 	return component->driver->endianness;
 }
 
-static int simple_init_for_codec2codec(struct snd_soc_pcm_runtime *rtd,
+static int simple_init_for_codec2codec(struct simple_util_priv *priv,
+				       struct snd_soc_pcm_runtime *rtd,
 				       struct simple_dai_props *dai_props)
 {
 	struct snd_soc_dai_link *dai_link = rtd->dai_link;
@@ -604,12 +630,13 @@ static int simple_init_for_codec2codec(struct snd_soc_pcm_runtime *rtd,
 
 	if (ret < 0) {
 		dev_err(rtd->dev, "simple-card: no valid dai_link params\n");
-		return ret;
+		goto end;
 	}
 
+	ret = -ENOMEM;
 	c2c_params = devm_kzalloc(rtd->dev, sizeof(*c2c_params), GFP_KERNEL);
 	if (!c2c_params)
-		return -ENOMEM;
+		goto end;
 
 	c2c_params->formats		= hw.formats;
 	c2c_params->rates		= hw.rates;
@@ -621,7 +648,9 @@ static int simple_init_for_codec2codec(struct snd_soc_pcm_runtime *rtd,
 	dai_link->c2c_params		= c2c_params;
 	dai_link->num_c2c_params	= 1;
 
-	return 0;
+	ret = 0;
+end:
+	return simple_ret(priv, ret);
 }
 
 int simple_util_dai_init(struct snd_soc_pcm_runtime *rtd)
@@ -632,21 +661,19 @@ int simple_util_dai_init(struct snd_soc_pcm_runtime *rtd)
 	int i, ret;
 
 	for_each_prop_dai_codec(props, i, dai) {
-		ret = simple_init_dai(snd_soc_rtd_to_codec(rtd, i), dai);
+		ret = simple_init_dai(priv, snd_soc_rtd_to_codec(rtd, i), dai);
 		if (ret < 0)
-			return ret;
+			goto end;
 	}
 	for_each_prop_dai_cpu(props, i, dai) {
-		ret = simple_init_dai(snd_soc_rtd_to_cpu(rtd, i), dai);
+		ret = simple_init_dai(priv, snd_soc_rtd_to_cpu(rtd, i), dai);
 		if (ret < 0)
-			return ret;
+			goto end;
 	}
 
-	ret = simple_init_for_codec2codec(rtd, props);
-	if (ret < 0)
-		return ret;
-
-	return 0;
+	ret = simple_init_for_codec2codec(priv, rtd, props);
+end:
+	return simple_ret(priv, ret);
 }
 EXPORT_SYMBOL_GPL(simple_util_dai_init);
 
@@ -831,7 +858,7 @@ int simple_util_init_aux_jacks(struct simple_util_priv *priv, char *prefix)
 	priv->aux_jacks = devm_kcalloc(card->dev, num,
 				       sizeof(struct snd_soc_jack), GFP_KERNEL);
 	if (!priv->aux_jacks)
-		return -ENOMEM;
+		return simple_ret(priv, -ENOMEM);
 
 	for_each_card_auxs(card, component) {
 		char id[128];
@@ -992,13 +1019,11 @@ int graph_util_card_probe(struct snd_soc_card *card)
 
 	ret = simple_util_init_hp(card, &priv->hp_jack, NULL);
 	if (ret < 0)
-		return ret;
+		goto end;
 
 	ret = simple_util_init_mic(card, &priv->mic_jack, NULL);
-	if (ret < 0)
-		return ret;
-
-	return 0;
+end:
+	return simple_ret(priv, ret);
 }
 EXPORT_SYMBOL_GPL(graph_util_card_probe);
 
@@ -1074,9 +1099,10 @@ static int graph_get_dai_id(struct device_node *ep)
 	return id;
 }
 
-int graph_util_parse_dai(struct device *dev, struct device_node *ep,
+int graph_util_parse_dai(struct simple_util_priv *priv, struct device_node *ep,
 			 struct snd_soc_dai_link_component *dlc, int *is_single_link)
 {
+	struct device *dev = simple_priv_to_dev(priv);
 	struct of_phandle_args args = {};
 	struct snd_soc_dai *dai;
 	int ret;
@@ -1092,11 +1118,12 @@ int graph_util_parse_dai(struct device *dev, struct device_node *ep,
 	args.np = ep;
 	dai = snd_soc_get_dai_via_args(&args);
 	if (dai) {
+		ret = -ENOMEM;
 		dlc->of_node  = node;
 		dlc->dai_name = snd_soc_dai_name_get(dai);
 		dlc->dai_args = snd_soc_copy_dai_args(dev, &args);
 		if (!dlc->dai_args)
-			return -ENOMEM;
+			goto end;
 
 		goto parse_dai_end;
 	}
@@ -1127,13 +1154,14 @@ int graph_util_parse_dai(struct device *dev, struct device_node *ep,
 	 */
 	ret = snd_soc_get_dlc(&args, dlc);
 	if (ret < 0)
-		return ret;
+		goto end;
 
 parse_dai_end:
 	if (is_single_link)
 		*is_single_link = of_graph_get_endpoint_count(node) == 1;
-
-	return 0;
+	ret = 0;
+end:
+	return simple_ret(priv, ret);
 }
 EXPORT_SYMBOL_GPL(graph_util_parse_dai);
 
diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
index 004fda4504c42..5af6d1b308f23 100644
--- a/sound/soc/generic/simple-card.c
+++ b/sound/soc/generic/simple-card.c
@@ -223,7 +223,7 @@ static int simple_link_init(struct simple_util_priv *priv,
 	dai_link->init			= simple_util_dai_init;
 	dai_link->ops			= &simple_ops;
 
-	ret = simple_util_set_dailink_name(dev, dai_link, name);
+	ret = simple_util_set_dailink_name(priv, dai_link, name);
 end:
 	return simple_ret(priv, ret);
 }
@@ -544,7 +544,7 @@ static int simple_parse_of(struct simple_util_priv *priv, struct link_info *li)
 	if (ret < 0)
 		goto end;
 
-	ret = simple_util_parse_card_name(card, PREFIX);
+	ret = simple_util_parse_card_name(priv, PREFIX);
 	if (ret < 0)
 		goto end;
 
-- 
2.43.0

