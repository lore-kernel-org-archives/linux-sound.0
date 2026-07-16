Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010064.outbound.protection.outlook.com [52.101.229.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01BD83EA66
	for <linux-sound@vger.kernel.org>; Thu, 16 Jul 2026 03:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784171867; cv=fail; b=VuSKy6/Io+KMInfL45FAp33MzKz4w5cCZH4sbinCMJZWe8zTrHTSD0E9Fy2wzW2Wm3YFPj4XC5xYO8W+5YShfvaZjt6tos1+q11JdtkCjD3lXvdCOE0cKiA6IMbnCGDBute3ACFpLBBKJyC1bOhbX1Lm0ue6p3kPBiK1NtmG9Zc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784171867; c=relaxed/simple;
	bh=8N3jkfMawZYRAYR4sKdgspTOdaYnAsdCH3r5gid4OWQ=;
	h=Message-ID:From:Subject:To:Cc:Content-Type:Date:MIME-Version; b=BqG0MNVpsDJMf1sPdUgg15obJZEt0hTP096dkfkqz7P8wvAe1A5N0cmdO8NjLFKM8Zdbemu2TzlWLkFvjiRXHuow6LP0C4CG+BCQX3dRWXqkSH8AGw94UB98hiDtv+5YkrZRKRc+9GWGmyF/7sgfXiCsbFxnCqohMokE5It+SjU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=eAq1iQU0; arc=fail smtp.client-ip=52.101.229.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="eAq1iQU0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l9iYV70ATpptxgPQp682aC1fGsJ3fo0cqTLKcteSWxDp/dIVY2433ahVMN4WeR1Hr6O9hmv+jlm6lTFQ+yyv7XnvHP5ch7o0rKxSHMtt/6gC26taEhUgmnyOT0y7i1/BYZdj69+nqqnvtWNLKITfugicAeg6UUDGQcF8Yrl03ZEoVoADZEcDsR0SkYZTRGe+1/G96eWT+JL9+JFB3Tj64BOTcNpP9c1htuWzXmjYPXESZEAHeU+sGgLJhDP30pvkWSOMvkEre5mPzT50BCVlYQub5chD4BMrS7pIWVdXUPPF1Qj5EEyI07SddeViD7MI3W+E4/4DMvZ4iqcEAuEXvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wQienMWcjlLHHKy7bICfV917zpW6iGmTWHWr20/R3Q4=;
 b=dotIS4XZIksJ94lhhXprSywiNEWaGQP/+C6WEOVChW8YE+E3r6Cc0g5mmqMWfrYSpZPvuIYEnve4SBHv5pzqtREQoNrFNGTSZBTniouwidDHJMYqF6gcH0UF4A4hYCI5+qu9bu9xwGV156bDZzjcVe8Af9eJebEgjf/CRc98Hkpd1DIoM7gNRvF/TzJbdIeHiKSdJHJRuVs6yV0OaK1/twMfiVlg5A1ydzjvTY9JGTYIOYiI9l3h/j4ZHrJaIB6QhBV+vzcUweg7Ecrnvaf4Z35l3WCLQTYVxzLsCLNAkNeSNj8XtAybhEN/lzLJVwvM150D2821hHH3dKp400fvHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wQienMWcjlLHHKy7bICfV917zpW6iGmTWHWr20/R3Q4=;
 b=eAq1iQU0U1DFTGkdBR17SyG7BE6kCyQ+JLhCWMs1aBVmzs9vkEwECLi+XAY4oh94EVdmqmgcjTBEZ2CDrne334gT7ynko5FsmZakAzgvnu0xhRfC9zup1ElS5bog9V47rhaS8rYuxhv5Zch2XXrbPu///bufJKYOh3aHp5wEmCg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OSZPR01MB6752.jpnprd01.prod.outlook.com (2603:1096:604:135::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Thu, 16 Jul
 2026 03:17:41 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0223.008; Thu, 16 Jul 2026
 03:17:40 +0000
Message-ID: <87ech34o8b.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2] ASoC: generic: Card name parsing should be called after xxx_for_each_link()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 16 Jul 2026 03:17:40 +0000
X-ClientProxiedBy: TY4P301CA0013.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:26f::19) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OSZPR01MB6752:EE_
X-MS-Office365-Filtering-Correlation-Id: 4da0a6f2-c4e1-4229-d9de-08dee2e8cb7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|52116014|376014|366016|10067099003|38350700014|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	qEilyyfsXxvNJbNpGnl2O3FGd033jc+G+DDXsURD61LDbEz7fFt7Q0niJoA/aTAgUuvitEtanIpX6sI7pXfX5Fuwdt/gYPE5R7UhOW9duq1hZbIZJglx1Q2Sqoazky43o5emj/wSnjg+OnPBFyUg7XD11GKikFgR7kBG/gV+J48t/sLbyys2p7HMZKjFOkeC4PxooslBgw+1QsUwim7rdOcRaz/lW1pGe5LoeNsFZh07bi3erqxI3ZicAdNCduYkjNLgqiobORYfownyzK6oxsGDQD2oTSzAY/9muWzO1M5X+Yt0d97S08KE9s644X3MSD4z6DosvVm/vKwVwQNfQFFW+UsujYJXVAFCW+oLUmlBmG4HUHx2zPwUfxFuXTwnbrF2YDxazCb8XD66rwNXQ8LaOwxvSXJSMU72aDefkNw8jwD0UhSZsVCO3ffMWa4iOZ7mRdl7sPVm6NJ2Pgdy7FF/u1x+SyojB0W7hLKfiD7qlkb7wW+hGNXuVITgUBPa7JJN7YZSv1a8Cb6mPStkcsr4iNLw5F1G0pokOS39uUgg7Aze4ipaz1Z2361VaMG/Dmk5wE7Qtrq2jbQ2K86E8ryU3fhyYcUwjGRda70I+qYL359Y/nfipiujqnuoluo1HXLABq9+x5NzDX2ALtjGfVjliY2B1DA3XbyO3T9nekvTUs/ndJ9yTzTlgUTX38VVhchuYMkLPr2b3Cl1uz7J3K3bdtm8DuMZBkP16Q9lJQ8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(52116014)(376014)(366016)(10067099003)(38350700014)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yPcMv4DlAeoCuimA1XqAz6xoI6/mi1yChr1Mv4Q6r4sCITf7LtdtlzIBe5Io?=
 =?us-ascii?Q?DaaXTVhUGtaZK9CuhAnQ7+kEg3Dgwk2MQ2CWYdYZVq+J+4Sg6gmzJY2qU2tz?=
 =?us-ascii?Q?8vCU+16ltYP1BjmgaAyQKU3O6C967p4We1OUNt/XBWcUhypSRHgf1unR+fjK?=
 =?us-ascii?Q?AWhm1SH3MKbcQWdimp/fxuxHzBkvui4X1EgJ/b3fCf9oDrf/yRl49IWF866R?=
 =?us-ascii?Q?iSQ8zCdmiq6urXh11xD6OsWGNg+zJmcJgaPxEWFh1oVnl6iiD0SyGYduSsIC?=
 =?us-ascii?Q?lI8JuHoEgzzeorOZGO+Af2Gk6g7Vb93nmNiWwVYlfmtIzLbEzCoOm+J3mkCh?=
 =?us-ascii?Q?JrO0Wpd1Knpa1amq5R/3gS59VTTqSr8z/2u2cJxa8kLKLXHYi7XPzDH/exy+?=
 =?us-ascii?Q?MnNAhgRsWWgMXAl0C8op9zr6kBsMba8z4vUGV6T7XrYwtPRldtF/+S0rH65I?=
 =?us-ascii?Q?xme7eBAg9ORZ2dPgvfBNWgSamirnqciKRa4Vk+O7dK5SM4J/7F8Xwc6+bUe1?=
 =?us-ascii?Q?nS/JdJY9mfOsoMgl95ESQXtdFrP8WIs7ZFHJ0VtHEgIwmRikf0Q3H1DMzFk2?=
 =?us-ascii?Q?iArco7AEZNRn4HztzobcvcZFWt6gMZKkrS/XaG2ESlxifulLpQUNfNkJG8l/?=
 =?us-ascii?Q?l3b6ed8Pcwc3NgCED4P0zqtSWZyyAHDi4ciXF60sCdacKx2gvRWI9F0x8PMO?=
 =?us-ascii?Q?XdWLLhULJ5+1gSm4s8dqjY3F3pxnTTsyYr0sFHXUv9I1Z+MdV6q5D2qGl3MK?=
 =?us-ascii?Q?qfgZIsN0DSNQy6m+uRgnxWZsJ2vwjgWqu9ibvubt14530FnkPlR0NdV7U2Vs?=
 =?us-ascii?Q?3W1G40HcLE7PT+A5suyitiLwCC1TsasoSJUPDQxMo+L1YaB2RoaxaSQnYItR?=
 =?us-ascii?Q?+z/9uZ5cccK6n6SQWVdBiu6Ul/TNZZX9uyouXT23HuOioEvREKzjrAesVxW2?=
 =?us-ascii?Q?crtRUDQFw5DZ/bON6S8B1aYWOTymSxY5anSWDS9wza9OEhPQtjqVEFdRWTrm?=
 =?us-ascii?Q?V4Chbu67lMurYKermtaMnQB71Vr2foFxaIz3/aeIqMp8xzsJinv5EsFajipX?=
 =?us-ascii?Q?3QetVmwlqR6WNRYs+yoluTVu7zEDtvAl8lNnfNJPzuJ67cZrMGwM5F5voKeo?=
 =?us-ascii?Q?Ob1ZZZwO98L7r9Wq7+jHkjblBs4PtG1OmGKB5GWheab536T1rPFAX6xxO+A5?=
 =?us-ascii?Q?4G/S9xmupKOudIxp8YIwE7h9hS2yuEbP0Q8J6gpTzkt7i9gy1i8jsoJUZHad?=
 =?us-ascii?Q?PkENYRmVhoeUZ3jQwt3N8gN8bd8SmYcIdZMbri/gwYxT/rghIsdTGZsyNZGg?=
 =?us-ascii?Q?yi7hiCMgBQjDtMRn189I9VERSl6nrKZcBiesMXTdk/doIrfEVvq2C+VXU03j?=
 =?us-ascii?Q?OLarlEa64nz/pwmJdfGyEmmStQZTu/TlNur0Dhuea9LyIQ+MGXR+85LCAyJ8?=
 =?us-ascii?Q?YUseTETRuMDOXN2AyMnvYcmYkGcU179Gjq8rHtXfyvp0qCMCn/ao7Ia+axg1?=
 =?us-ascii?Q?tQqhEoz44TzAbS3HRuDcWQY7VzMR3QwcbU/t5ZYqxPMkn0BH4tD9Y3kBUnEh?=
 =?us-ascii?Q?nlbN91l3NCFL3BGrFHMMAKTA4tdhFl3MeN/KKJRamitDdtLxrTjQrGMio/5z?=
 =?us-ascii?Q?XHjM8W5rCde4pzoA7wGoYaS0Mcmejz8MdzC0FUdRbRRdc46ToTVHSj5MPTov?=
 =?us-ascii?Q?6E/QaOJMVX/ox/RYmcZSslZ3XV7ppHC+B1HYQtZCtQ9aImYlIZc0wp4ZNuNU?=
 =?us-ascii?Q?9oCPmmivWcEbkVArSMvyjxopRH7e9jBWP8I8eaqBMos1Dc/fYIyx?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4da0a6f2-c4e1-4229-d9de-08dee2e8cb7c
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 03:17:40.8233
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UHA67ui7clzHC06bPXYKwix2v4TWM3tkOockHdqT9GyHvlV363bC1CUC762nwYp9/Be1xjPJ4GK0XnfFoTvCubO7MgcdsF2GnrcdHHG3INut4sbLoolGWb/H6X4npLRf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB6752

"tidyup simple_util_parse_xxx() in xxx_parse_of()" commit changed the
function call order. But simple_util_parse_card_name() should be called
after dai_link settings, because it might use dai_link->name as card->name.

Fixes: fa6222d5e121 ("ASoC: audio-graph-card2: tidyup simple_util_parse_xxx() in audio_graph2_parse_of()")
Fixes: b8081307f5c9 ("ASoC: audio-graph-card: tidyup simple_util_parse_xxx() in audio_graph_parse_of()")
Fixes: 27ecf4da5ad3 ("ASoC: simple-card: tidyup simple_util_parse_xxx() in simple_parse_of()")
Reported-by: Mark Brown <broonie@kernel.org>
Closes: https://lore.kernel.org/r/b81ebfa2-6a35-4ff0-9d04-b867233eda4d@sirena.org.uk
Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
Closes: https://lore.kernel.org/r/20260714103428.2318895-1-geert+renesas@glider.be
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v1 -> v2
	- Links: -> Closes: on git-log
	- setup DAI link first, setup options later

 sound/soc/generic/audio-graph-card.c  | 14 +++++++-------
 sound/soc/generic/audio-graph-card2.c | 10 +++++-----
 sound/soc/generic/simple-card.c       | 16 ++++++++--------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/sound/soc/generic/audio-graph-card.c b/sound/soc/generic/audio-graph-card.c
index 73ea562ce52b3..4ab25295695c6 100644
--- a/sound/soc/generic/audio-graph-card.c
+++ b/sound/soc/generic/audio-graph-card.c
@@ -572,6 +572,13 @@ int audio_graph_parse_of(struct simple_util_priv *priv, struct device *dev)
 	if (ret < 0)
 		goto end;
 
+	memset(li, 0, sizeof(*li));
+	ret = graph_for_each_link(priv, li,
+				  graph_dai_link_of,
+				  graph_dai_link_of_dpcm);
+	if (ret < 0)
+		goto err;
+
 	priv->pa_gpio = devm_gpiod_get_optional(dev, "pa", GPIOD_OUT_LOW);
 	if (IS_ERR(priv->pa_gpio)) {
 		ret = PTR_ERR(priv->pa_gpio);
@@ -591,13 +598,6 @@ int audio_graph_parse_of(struct simple_util_priv *priv, struct device *dev)
 	if (ret < 0)
 		goto err;
 
-	memset(li, 0, sizeof(*li));
-	ret = graph_for_each_link(priv, li,
-				  graph_dai_link_of,
-				  graph_dai_link_of_dpcm);
-	if (ret < 0)
-		goto err;
-
 	snd_soc_card_set_drvdata(card, priv);
 
 	simple_util_debug_info(priv);
diff --git a/sound/soc/generic/audio-graph-card2.c b/sound/soc/generic/audio-graph-card2.c
index e3e92025b317a..9e48bb9a7c525 100644
--- a/sound/soc/generic/audio-graph-card2.c
+++ b/sound/soc/generic/audio-graph-card2.c
@@ -1329,6 +1329,11 @@ int audio_graph2_parse_of(struct simple_util_priv *priv, struct device *dev,
 	if (ret < 0)
 		goto end;
 
+	memset(li, 0, sizeof(*li));
+	ret = graph_for_each_link(priv, hooks, li, graph_link);
+	if (ret < 0)
+		goto err;
+
 	priv->pa_gpio = devm_gpiod_get_optional(dev, "pa", GPIOD_OUT_LOW);
 	if (IS_ERR(priv->pa_gpio)) {
 		ret = PTR_ERR(priv->pa_gpio);
@@ -1352,11 +1357,6 @@ int audio_graph2_parse_of(struct simple_util_priv *priv, struct device *dev,
 	if (ret < 0)
 		goto err;
 
-	memset(li, 0, sizeof(*li));
-	ret = graph_for_each_link(priv, hooks, li, graph_link);
-	if (ret < 0)
-		goto err;
-
 	snd_soc_card_set_drvdata(card, priv);
 
 	if ((hooks) && (hooks)->hook_post) {
diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
index abfbc9fd7c6d4..72fa7be0d3ff4 100644
--- a/sound/soc/generic/simple-card.c
+++ b/sound/soc/generic/simple-card.c
@@ -692,6 +692,14 @@ static int simple_parse_of(struct simple_util_priv *priv)
 	if (ret < 0)
 		goto end;
 
+	/* Single/Muti DAI link(s) & New style of DT node */
+	memset(li, 0, sizeof(*li));
+	ret = simple_for_each_link(priv, li,
+				   simple_dai_link_of,
+				   simple_dai_link_of_dpcm);
+	if (ret < 0)
+		goto err;
+
 	ret = simple_util_parse_widgets(priv, PREFIX);
 	if (ret < 0)
 		goto end;
@@ -712,14 +720,6 @@ static int simple_parse_of(struct simple_util_priv *priv)
 	if (ret < 0)
 		goto err;
 
-	/* Single/Muti DAI link(s) & New style of DT node */
-	memset(li, 0, sizeof(*li));
-	ret = simple_for_each_link(priv, li,
-				   simple_dai_link_of,
-				   simple_dai_link_of_dpcm);
-	if (ret < 0)
-		goto err;
-
 	ret = simple_populate_aux(priv);
 	if (ret < 0)
 		goto err;
-- 
2.53.0

