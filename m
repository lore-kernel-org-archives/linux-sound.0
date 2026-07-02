Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011011.outbound.protection.outlook.com [40.107.74.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9D2D632
	for <linux-sound@vger.kernel.org>; Thu,  2 Jul 2026 01:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782956692; cv=fail; b=ChxlkKiCD4eU75zcFlWd6CZ4tIFuwxA1bPd9aodDrAJJiFnS3MO9vMDymoo0vNkNqEfrn3VDR1WS128wUo/Sxa7HZ0WczThSc4IkJNJbxyXNhp3fYGqzszqws0mb+ovcz7oPQhoBFmyGPdT0xK828GWIXlVJDxWLzWU0zth1BLc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782956692; c=relaxed/simple;
	bh=pgUwAP9LRzLVkG47UGPsz0n5jGhJGijXVRtDor6vt5k=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=opUKzk4uqU0EwzzGecJ5wwd4HbdAtij/UIRlHubv85TRE9CYpYYPB00DFb//AFwTb7Ijn+Jpp7m15bVHAkgvYbUpDnr444jF/g2PbHFun0t48NhWlsb7gpxpP8JGk1lK5g43v+CHAcEYW309JCSnw9x8+lIDz4c6PyRMqsc+YGo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=gJVTkYbv; arc=fail smtp.client-ip=40.107.74.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="gJVTkYbv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E51l2dFtousM8WJZJoaSQWmlgpj8BuiXLqxMVz64jvcPLt469O6+e61C17SyJuZce1mH9Oy5ne7K3g7HAesBjxzvZG4vkJYBCoFu9ax+XaUExQRinH4mpfFLRUoNPf4E00QpVhf91evgZaysVrIyxfkCFr/7KLaPFnNubkSC5kAdfEPgNG1th8iG6vu3LiMmionMqs8pvZZm13d3hbRdec4lrshUSFwBOj2Mc4RxJwLRsRLOM41fGmWWDjAMR+Q7vvY7kGHH7fDbSmp3l9tsnbijqDaWh7xyyOZm01b86Kq6KP31x2sLtVHi3/JkMyXYXcTVBvMQkkPUO7iFI01URQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2DLFNSIF9PRoy3PK5Pa6VfOJT2NVRlbEMzUPmbAly/s=;
 b=Oi46FqQTqCpTLvEi2wo2z1J6W9xFnFQiiQFG0DPsXXYcsyFSiKqR8nyi6knMHCVEd0GL4imBcWzSIroSSciyxmBrXXKdfCmM9VbTRwAXLRbpBU53A5YI5Zdi63hLYMZyoqcSYXxqEXVBKerwycldGi/BPWXge5UqbXyrl7Sm4kL/CMb2PS16jDm7oH8LbK7OTrDJ35Zs0PgvVyFh1uBYZei/itVyAxNMoxIPZAJg9V2V27xQz8Rj1rBXGx48XWEEcwMjTM+zmgyEE9YFiYfCw+1II7sZXX2jwptj8zdYIsZu2VJlqbk3Beo6wBXENZBkehjNAgCwORftbrXWiZg45Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2DLFNSIF9PRoy3PK5Pa6VfOJT2NVRlbEMzUPmbAly/s=;
 b=gJVTkYbvfXAdCqUCEKhPqlRQUmk+WG8GoIR4U4SXV2c0LIdAXKbgOM9Xcw1g2Ul0o6lhKtJYXSNqY+SSZbSEM/EQlK5IcNZFHZNXmlk/oe769xfkL/QZ3fX75TAkMbKooI/Ffn52BgVaObXT7HrGNBTnsvJG4pl6r/JEFabH5hU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OSRPR01MB11811.jpnprd01.prod.outlook.com (2603:1096:604:235::9)
 by TYRPR01MB15951.jpnprd01.prod.outlook.com (2603:1096:405:2cc::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.9; Thu, 2 Jul 2026
 01:44:49 +0000
Received: from OSRPR01MB11811.jpnprd01.prod.outlook.com
 ([fe80::a2c7:5e53:c133:d834]) by OSRPR01MB11811.jpnprd01.prod.outlook.com
 ([fe80::a2c7:5e53:c133:d834%5]) with mapi id 15.21.0181.008; Thu, 2 Jul 2026
 01:44:48 +0000
Message-ID: <87fr22xizz.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 02/12] ASoC: simple-card: merge extra method into simple_parse_of()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87ik6yxj0t.wl-kuninori.morimoto.gx@renesas.com>
References: <87ik6yxj0t.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 2 Jul 2026 01:44:48 +0000
X-ClientProxiedBy: TYCP301CA0047.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:384::11) To OSRPR01MB11811.jpnprd01.prod.outlook.com
 (2603:1096:604:235::9)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSRPR01MB11811:EE_|TYRPR01MB15951:EE_
X-MS-Office365-Filtering-Correlation-Id: e87d42c9-e31f-4779-3df0-08ded7db807d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|23010399003|366016|38350700014|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	5vsjlK7XIiTsxDILjSkMQJcj5V7NTnK/mA6rJzu3j3brVviC6lzcvN/6bJjy5Xi0qqQuO3b876qE7pIXwsN1lnntbaHRMIYM7cnkddacyLCNQJr6auiEV8z0a5B14NDJgDHh/RDoPIs/gsO/hdf5qk07XhDocHj3OtldwRyz+xlrTV27fSISPklpMiRK+B7vORZ8PFzVbgTU6Z2wmQ06CxuKnb+oowEv7WA+9/ZVdWyVzIxBCcMKMRL2pgp9+q5UAPOl3OIUYIPnBvOgXF4TYoRhjsXfjSWhaxBo/6DBx5SvEaPG1Yslzix0pL775TgP6R5KvYnhCdH9Br+l6iqnG7sIVW3jOmcH660sCPlXj2GF5fBrso1vj7HZkQmmSPvTI0lkn2dq+n2mxQT3+mcwxlZx8K2yBspSfhskRHDC3Z+6xZWvd3eW8BcEXUmIlTqRropFT+oQe6b2wHAAUiUt75fYQu20cLaJF9zLR7SqlvmEp9I3ZyV8ad3jujrXBd4tbF4PXveLfU/cMdQkwDwVRq/oBPiIPxnofcDaAThaSiama851YP+KHEQGoeNBjgzybdnjdr7zSO2uHd7Vbk4GNq8a6z9gKwCCf1M1iKI3G82GapOUh7MYn19pcBbDwcU7eIgrO5jihsOy9VlPzYq21hRgj1oH+PdWwHPFhMp9GTnVv/Uq1z9rosKBCcGbPLxYCkPZrgITspXRmZh8Yr7EE8rypMprl+avLCSFLpVgbvU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSRPR01MB11811.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(23010399003)(366016)(38350700014)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?av5BfZrc7MOGIIb+BtocWeAq8fz8CM8WIDxcjM5nF0ZiRFrNpkBhE4y6Y+rf?=
 =?us-ascii?Q?ei9mVzDD7tK7vmT1iB+D/ZcLDpXI583DqjutKleWpm5Ud8zfBkszze2YdyTS?=
 =?us-ascii?Q?ZUHy0M61SZbqoMV156SKnABltnV4xSWkyOzn4Qqz4jcF8GiSlqhRj+vIExnQ?=
 =?us-ascii?Q?Wmi7KngYmtUCak1CDEaA9yEj/+NbfBjyOBMkgp5SaHsblHtGJ+WHI3RX621R?=
 =?us-ascii?Q?HvJEE/kHw05fsUIj7mvbJ33w9d8UKzNS3ib40eHOONyUFws5LXv7Bi59y4rd?=
 =?us-ascii?Q?ptSFGb/skKcoxefWo5Mg6aAVL47eXmVWA5bgFpPcVP7GpbZZ1I8KIGCIjXVE?=
 =?us-ascii?Q?ym+jke+RSXMGYrzhqClt9t4zIR0P/Frq54uQsWI3sGpDH2jIfGJbB6+5moVU?=
 =?us-ascii?Q?BnRzqqemOa8cn8xYKQmj1qfDyB9V/Dx0p5uQBifKIiNIdmqBFva9GsByrfY8?=
 =?us-ascii?Q?2wrLj5Qj/gz2dlJV5ufcQrz44QiAcCfKmtTWfeJLvMnkx49baGJQdOO/Vn/S?=
 =?us-ascii?Q?H1cd4XP4Wq8PtqpPsNUrdUAUVo0sBW8XAJ87C3fnWSfY9ssjEYB0Okbu7LO1?=
 =?us-ascii?Q?8CfDUtVD3RifjXhcF88exPf1WWJOoCrxnLZcKq3fIs+7a77xIUhsrqFlwGyH?=
 =?us-ascii?Q?boKszqRSeky6gObACElBX6q3wdRzhVvwbmsCmkN9YH6e5kAy89gEuQWqMmqM?=
 =?us-ascii?Q?dlh3N9ohjo0/ct55AqfsReGAM6fVWerC3Jk4bJFkIKeQy+BkfzlWcVpyn+bo?=
 =?us-ascii?Q?XY6cIDv8kBaqbinm0oWdH3Q+Lt4x+tB5C89tYmFC7n/PHERvrbGg/S1hBAvE?=
 =?us-ascii?Q?ZqmbhGZe0sUt9kthMiMREjccBC/dzO+tcKX7fBKzOqMuv95IocQItb7iCXxw?=
 =?us-ascii?Q?LZ45A0g6iMRueV9RT5zUy9Owr5U0HK/flUD1s7xHm+QnI9Dpjy5wUHMvEGZC?=
 =?us-ascii?Q?tmAS47PifdctPCpHVQMEwPkzp7gFD1/682JuU62jSH5tDkKzdLX9inxvC0et?=
 =?us-ascii?Q?j/k9amMHkNBYnQZ3SmFtrhbZS24dMDA0cjtaAKQO1NRSoBOyVknFlw20mExp?=
 =?us-ascii?Q?J8iw4v1qi2FIXZKUtELroignwKFf3mHyjzT8uBYPSoJKzFdN50e54vNayjnk?=
 =?us-ascii?Q?T+mw/39nO847oD1DvpytZ9iURtnLC1sZ0Ol7KW8jOTgGcWLeppNLAXt+afcJ?=
 =?us-ascii?Q?y26AO394ZtwtPtd3/0fZExohgSPbKW4NqlcXbeJUGHHHPwFkuQ3B8Pzuh3wZ?=
 =?us-ascii?Q?WRiR/LQe2A0BUfEBYe2x1bEupr726qrOgoxlPQOX+pnvk8Mk6argUfgxXl3/?=
 =?us-ascii?Q?XePUTJySh6QMZtDnRm5WWtGfdyrZdQ+Jyb1Q/cfOe60JN7QpeP7EG61oeY0C?=
 =?us-ascii?Q?uHO+R34PiTNIfTE+i3IIwfSXlHYR1GX+OdzQsXQIMMECcG2pOWAvY90H3bSa?=
 =?us-ascii?Q?KloCZCsMZLczKTKche8ovznYQfHc+5SVpSGFsILnsGd7+RB7W45yYG88cJsE?=
 =?us-ascii?Q?3Ug37zFmCK4OwhGZ/jT94JVkQucdXYF8fnsQmx1Tn1TJB4MvCaSsd6iHPBtC?=
 =?us-ascii?Q?wJzDplh/rsNo/clVQi8Xti7to7SJeKmFeYJa5wkenbSoL+UUWhxwdO0paDHK?=
 =?us-ascii?Q?cB2IS1kDK2wdyyey40B8p66/6BgHS8dBhxAPh76ev8phajywwnj5xiuqU5s6?=
 =?us-ascii?Q?oCSRUmhttiCy5IZI6pMv3X9s8JYoFVQy5RIeGpOz/7JobmSADfzbpXin5xay?=
 =?us-ascii?Q?aHl8q/JKRtbfKbsEwm5lrA4W35piF4fGf9wDipsGeFN7SUOpcL+t?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e87d42c9-e31f-4779-3df0-08ded7db807d
X-MS-Exchange-CrossTenant-AuthSource: OSRPR01MB11811.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 01:44:48.8252
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4WB7DO6+dGumIHELUVW2dD03JlInh+mYTScNcdo0EXK5zHRitSUZlkzv2//NgtmYQc7fzjC2sugoQBIUYrdP5gSOR6WsPowUkxMx/XoZCgBzytIU1+vDDT9oREl8RTvZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB15951

Current simple_probe() calls many code before/after simple_parse_of().
This is because it had supported platform style probe, but is no longer
exist.

We can merge all into simple_parse_of(), same as Audio Graph Card/Cars2.
No functional change.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/generic/simple-card.c | 82 ++++++++++++++++-----------------
 1 file changed, 40 insertions(+), 42 deletions(-)

diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
index 456b7ebeb068f..20e6edd1d7d39 100644
--- a/sound/soc/generic/simple-card.c
+++ b/sound/soc/generic/simple-card.c
@@ -666,10 +666,31 @@ static int simple_soc_probe(struct snd_soc_card *card)
 	return simple_ret(priv, ret);
 }
 
-static int simple_parse_of(struct simple_util_priv *priv, struct link_info *li)
+static int simple_parse_of(struct simple_util_priv *priv)
 {
 	struct snd_soc_card *card = simple_priv_to_card(priv);
-	int ret;
+	struct device *dev = card->dev;
+	int ret = -EINVAL;
+
+	if (!dev)
+		goto end;
+
+	ret = -ENOMEM;
+	struct link_info *li __free(kfree) = kzalloc_obj(*li);
+	if (!li)
+		goto end;
+
+	ret = simple_get_dais_count(priv, li);
+	if (ret < 0)
+		goto end;
+
+	ret = -EINVAL;
+	if (!li->link)
+		goto end;
+
+	ret = simple_util_init_priv(priv, li);
+	if (ret < 0)
+		goto end;
 
 	ret = simple_util_parse_widgets(card, PREFIX);
 	if (ret < 0)
@@ -689,17 +710,30 @@ static int simple_parse_of(struct simple_util_priv *priv, struct link_info *li)
 				   simple_dai_link_of,
 				   simple_dai_link_of_dpcm);
 	if (ret < 0)
-		goto end;
+		goto err;
 
 	ret = simple_util_parse_card_name(priv, PREFIX);
 	if (ret < 0)
-		goto end;
+		goto err;
 
 	ret = simple_populate_aux(priv);
 	if (ret < 0)
-		goto end;
+		goto err;
 
 	ret = snd_soc_of_parse_aux_devs(card, PREFIX "aux-devs");
+	if (ret < 0)
+		goto err;
+
+	snd_soc_card_set_drvdata(card, priv);
+
+	simple_util_debug_info(priv);
+
+	ret = devm_snd_soc_register_card(dev, card);
+err:
+	if (ret < 0) {
+		simple_util_clean_reference(card);
+		return dev_err_probe(dev, ret, "parse error\n");
+	}
 end:
 	return simple_ret(priv, ret);
 }
@@ -709,7 +743,6 @@ static int simple_probe(struct platform_device *pdev)
 	struct simple_util_priv *priv;
 	struct device *dev = &pdev->dev;
 	struct snd_soc_card *card;
-	int ret;
 
 	/* Allocate the private data and the DAI link array */
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
@@ -722,42 +755,7 @@ static int simple_probe(struct platform_device *pdev)
 	card->probe		= simple_soc_probe;
 	card->driver_name       = "simple-card";
 
-	ret = -ENOMEM;
-	struct link_info *li __free(kfree) = kzalloc_obj(*li);
-	if (!li)
-		goto end;
-
-	ret = simple_get_dais_count(priv, li);
-	if (ret < 0)
-		goto end;
-
-	ret = -EINVAL;
-	if (!li->link)
-		goto end;
-
-	ret = simple_util_init_priv(priv, li);
-	if (ret < 0)
-		goto end;
-
-	ret = simple_parse_of(priv, li);
-	if (ret < 0) {
-		dev_err_probe(dev, ret, "parse error\n");
-		goto err;
-	}
-
-	snd_soc_card_set_drvdata(card, priv);
-
-	simple_util_debug_info(priv);
-
-	ret = devm_snd_soc_register_card(dev, card);
-	if (ret < 0)
-		goto err;
-
-	return 0;
-err:
-	simple_util_clean_reference(card);
-end:
-	return dev_err_probe(dev, ret, "parse error\n");
+	return simple_parse_of(priv);
 }
 
 static const struct of_device_id simple_of_match[] = {
-- 
2.53.0

