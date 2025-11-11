Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010010.outbound.protection.outlook.com [52.101.229.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 718B71EA7EC
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820992; cv=fail; b=RJPjDiXOmcThwFFBApIwwiFU9XhLXMb7HtYpzffbj9kglh1IkPavO/cpP2k75+FGsbAKimFnD1MxU3aOyW3aIiy3P61X339s1DkAEREBuCGqGsO9hYPQRzKSuXWwyIyXvVbNn1++bMTPS3e7/GeLu1S6gsgc2Xf2dYowKwCMLJM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820992; c=relaxed/simple;
	bh=th1k2GPTwA1bmjhzJVyvDhWMdeKFcwtCX325eOH3QUo=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=dUo6CQOUHftvB9ibW33f2Qwyg2MLL8ViuG7BleyHTimC3LEwHZ7pIVf5s4kYvqbzvyYAtuVIR32o2sZyz3xRidkywALX9sPt4uNfTg41ipp/Xybgpr+x44Zgrs5zKihNZcBo6lDh+7Knzq+1GI9E/BjnyOQLqB1ZxqEM9g+7wqY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=YLGlcRb3; arc=fail smtp.client-ip=52.101.229.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="YLGlcRb3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fe0t7gJ8P98EGfjlPkVyI0JOkSzPLAUuuMc3+nz4ftv8KOLRTa6rJsRCxEgwTDFmDhEASBaCVJCYXnMKsHUHB93S2aiMdgPlX1FkZMMKZNe5Ic+BkclXKREc78QcijYXF9Kua5Z6zBJA31Wpx0i+0o+yULbSN1tg3J1kVevgZq5dIDSDZFCzMLDxi11RgiTVM90EFEX1JoFn+r9otbp1Zic9khNimxtXkC7sBQqZgJvvGWbZaF1M/jzrA449mRulv+DKHfhtFsDp72RTAG6f8a2xvMSFOkj29c6oA9bTy99uyMEfNK3ZonnEGTHJnm1zdx7MIaAWDGyi3ntOTugL8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uuTvMeCCXHZPTM29FvNfIa83Ahp9GskgF6NA4IiuBeA=;
 b=aRVBTaN0+YhOL/1hNBbjxVCWkNdH/KxKcgf96QGqOKzCy3U/l5/or+nSM6shBEYQkhUDx9vSbswP+lrPfnBA/O3qarCfYIOp9fRDr28P233D9aqa/P3DiiqrHSU1rzXBbqbJSYfE01G2/ZXByRqXakr3/eAjLlaA0b0Ebl5oTkv9y4T1X2wDSH2LVn8TZ6fTp8wkf5/3Z5vx2FZxA1swFlt8IVe5iiutomyExMtnzqZGonqHC2wwW/j9vMYX9hLavwzSiXgENyb22f0oLwseDDXXeOYveE//Wb9uUF2iDJnI4WrlaPCL2q8jIqSebXq3SdEm5L9FK4H1LLfj8A4fRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uuTvMeCCXHZPTM29FvNfIa83Ahp9GskgF6NA4IiuBeA=;
 b=YLGlcRb3I7d6SFs7Kh9Be4FL/yvDvmmvTqdZf6D2HdKcpc5PM+Zf8lskOzeFp+Roy6TjJUMWtPXzR6xRrGhgYyzwzKKbu+F+pr7+1xaXAPftmoA60fxQXGeC6XG0AZ1VrfQ9HReGs99cc3hCVdgfRIAPvkt6ZSuNJ5bapsOfmz0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYYPR01MB16440.jpnprd01.prod.outlook.com
 (2603:1096:405:147::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.11; Tue, 11 Nov
 2025 00:29:48 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:29:48 +0000
Message-ID: <87346lza0z.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 181/292] ASoC: codecs: wm8990: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:29:48 +0000
X-ClientProxiedBy: TYCP286CA0185.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:382::20) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYYPR01MB16440:EE_
X-MS-Office365-Filtering-Correlation-Id: d4096263-c6d2-4f2d-f8e1-08de20b96bf1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3GBbb367SjB/dkN6LiqmzfLuat164VDwWJu5eeCx5wmrud5BCZ3QoUM/dtFq?=
 =?us-ascii?Q?kcgtWp4kW/Ycd5tI84LjQdOcN/p5gqpOOWEdbDZGFK1U8CJGJQs5ilELgeU9?=
 =?us-ascii?Q?A7qtNIgXK1XfveAGqMhmuclUymWdCkdccGpv8oHD3h7Bo/KeBm87RboyziV6?=
 =?us-ascii?Q?wJFDX72CJNfnyTJEQESJLewPVxLdp+dm6/h/wtKXVafH/76kht6iFVtQNBKi?=
 =?us-ascii?Q?pPLgWl4iUM3ypcNrBaa/lmQ4ACdcbXWzLa6U8B8KDrJhlnyKu/NouLc8/yR0?=
 =?us-ascii?Q?/nP3ZeVKdRHuGbKaU8l3zN+Pl6TNccMFIsR+zBYQE6OpvwVn8Vi7oRLNJrbH?=
 =?us-ascii?Q?KsBkcCyEKqcZClQ1Is/Hv5goeeHrdxvPK/Fs6CEnsdxbBr5PmpKIpMDp0qhr?=
 =?us-ascii?Q?MHifMc553cz/o84HsPIOE9BVYVg5j61mqzoLktXByDTYKXGk+tB7O/A6xsGC?=
 =?us-ascii?Q?bXY2fwvdHgCCyxX1yHyeSVtmYss+q3Ll/MrYKRtX8HFTjQpqv4eiMUfLqs53?=
 =?us-ascii?Q?4E9MIgb355O7aawhxK5vsFY7Y/2nOkVr+xC4nQzVmTgrSRTTsx+bQyw7Pw12?=
 =?us-ascii?Q?pCAJcRmG0lePF+Olf4UagQ5tDurFRy3D+QPU8i9YFj37qwcLyzQkzsY2fcwp?=
 =?us-ascii?Q?d5lRZTyMZgSet79nRK2XdbL1nBKx+BRjQEMt4sEpGXmBpEKch9+Aunk/2q5t?=
 =?us-ascii?Q?HrGZ6WMuK7309vEkK//ZvZsnQot1eJ9Cl51WGmm0+BTiESmvwlczy6NTOQla?=
 =?us-ascii?Q?2PUgp0WRiEEDuR0CVzNd+kr991P7hXn6fufWD5IkSef0AI+VyokWDfIrcKGD?=
 =?us-ascii?Q?VWT1T0R7Y9G3VtgixVf2AnzBTHLdGyOvWW3CLdvDHG6qGdxzne29vNyx9TkJ?=
 =?us-ascii?Q?FLBrateOKKGsbbQ4rjUfGttcbeQYA4VG4fOS2zAX2myISc2AAsk1X39eIodi?=
 =?us-ascii?Q?jZfc6Zj39a/txEx1Z0eBt4ntV1eGN+ndRt7th2N7u9DvyS0dsEOTbyAVKYbl?=
 =?us-ascii?Q?e7SzJoQoymaVJFIchmjQ2n+DH335LreqFCnqlmHQaDAXecfwY/Pp9O7vT4sD?=
 =?us-ascii?Q?a+BJH6UERqm1SatmZn8TaRlZ4a+sNKacBgSHour7WuxbwQKIGAqCpn4HJnxI?=
 =?us-ascii?Q?D4quKHf5p56B68DL9G38lve1X7P12kKZxXDI5Q+tvBr/5Blmw9ggeMr93oax?=
 =?us-ascii?Q?+PRPhZr87gvZKJmlLQjI5lWz8INVJMetUbVDT4XEnowVP+HLsOZfMCaWmwRX?=
 =?us-ascii?Q?7ZWz2kdpq2F8mc/j+QQbFdTHgE4oS8VGFlT2fttRvvz9sgM0qkW8DW3YwhtP?=
 =?us-ascii?Q?VFPvyQnTCpzUtKu15CJvmTilym91nSVMJihyh3qYC0/HksR98fqqsx78B7to?=
 =?us-ascii?Q?KeIFJpoqSYM6jbH6Tey27ReHbc+sKBueWNVCkPdKVJnvSqh7Z/xuBGXNE7+P?=
 =?us-ascii?Q?RGY4LbebU6b/4BDEudEsINgPq/t2pv1lrNi5yzA7P38m/YqBiXWyaW0IBtuz?=
 =?us-ascii?Q?E5xLtMM90CAHWNfwntenaAca4Pp+X8JMmETt?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?S4drjzpPjvfCx6AySvze9oEAM0Jui4eJlVpIdz8CUL6tKwiu4aiKArz56Kqm?=
 =?us-ascii?Q?HNX78q1YO52ifGSzMwB4/cSBBlvn7P2P8Dwl5WTyoEEQaVBHyiICa93qdSS7?=
 =?us-ascii?Q?8IW8fWwQHpoYeOR9mpfHyq+QWm64FPQ2iQOtq7zjESyrFCo2vsh+J34bgtp7?=
 =?us-ascii?Q?5jsTUz+tgLribp8gerOUhQS7QmIaeKrbsCqmn+YcHAcvawEldyAKUAzY5nBW?=
 =?us-ascii?Q?AjAp9lJXYyHEeVU3AeaGacLlh/bRMdG4BXyM8akoCI3HBOX38NACEa5GsN+w?=
 =?us-ascii?Q?Uo0DFBDhA5cKn2vUYQ9tNBNzS5lq/sO3PiJK90Pr5fUP9tujdMcE3KYFyHud?=
 =?us-ascii?Q?oPbfpmelNyqGuGZhb9Lj39/CzbThy1xbLVoDopjpwHA+61SQHX5LmOdTDcOU?=
 =?us-ascii?Q?hYRbDzPmveux5vfdQDvQX6gYVAzK3RBm9GBpU6fuP9+DC2P+KpHgF2muiLZt?=
 =?us-ascii?Q?5iUOvSr+x+J5NiBMyteNCJRpx4FRhjbEMgKO/HR1+LVyIpOKnlfxtVZoGtOT?=
 =?us-ascii?Q?KEA0sm3dgwy9abUfMTw/+uLWSdRWrX54hgdVmVmE5vaN8VWlyOKiKrF4F70K?=
 =?us-ascii?Q?IdLuS0Ui7OA5zI8k5BFebRxSttkAZQUzDYvslcRcdQknL7dGnm8LzFVCMiaD?=
 =?us-ascii?Q?qbiCuzFM2JGabPHV3xzIjNVkQ57qS7VA8laR/tCIhcAoFblgQJ7gDehMjZiB?=
 =?us-ascii?Q?u12qb2gSoc+FjOrHNEm3nmuFM3jbcszli2zBZIGQhcv4z02sQPYsAl4Sji1n?=
 =?us-ascii?Q?+HnXNTA/0CgiNwGK6zHHqkMU4aV48RV/+njf3rWtD47wqUwXctb43oAQAICl?=
 =?us-ascii?Q?nFJVmnnCa1a8aqqAHJkNwx2XEXptk1XbbB1nUS2kgGo5lUwatyYOtQg6qkT0?=
 =?us-ascii?Q?w/zcAibW8KuI/YBXFHtRohvOBTYf30DguIuRsX4OYM+ZXLKLQ0SBtfYfpZkv?=
 =?us-ascii?Q?j1o1XrbqMxTgNbAd98g0QrG6+xtrSZeOT71FVIVV6Nj9sSAlLXzb/4QhKyP0?=
 =?us-ascii?Q?1zZ2aVozlPnA9EAq5+Q3nmpS2jiZbLmxN7ARcGz7ZiebPMpGT5lfNY30Xi+W?=
 =?us-ascii?Q?kcS5/7Eu8Z8bp6uHbUHRsV8B9505379N9qV8paz8tKzfae7vOObUrXPGXfeu?=
 =?us-ascii?Q?c2YdMeR5S0jZdWU4GVq529czY7S8vsvjUCivKRzgq9p1u4hRrcS32PTBI3dE?=
 =?us-ascii?Q?sxH1edximwJyWLsldbD/TDil15YIaNhGX/G9c18i/BtwCHgU2j27i/Pm7ZcY?=
 =?us-ascii?Q?Hgqff0yYKN0ixbOFjKB+D5UUsBFRo024AFAvK/DUTxRc+VJ2eG6NP5aU2e64?=
 =?us-ascii?Q?6VPUAI/dUABEYX9BR4TcYz5J7slZdvw74BZ3DHM2yxc4ur8lqInsJHqWIG/s?=
 =?us-ascii?Q?lrXclV44/roDZ33PDHh9cdD9noFLc7I0RCQqOqKRVHw3YfK6mGmPg425OOhY?=
 =?us-ascii?Q?zZY6GfrfdV1fvxax5Krd1MJ3tybSFtPotbgs3b29G6amcKnUJLbU9kOw6OfM?=
 =?us-ascii?Q?aK7HUOx66ohSSxuqYlv58mE+GLP3cOACj3ZRd+ZDtLZARGAF0bnqgzopz6Sh?=
 =?us-ascii?Q?Nn6aKGx/b7fo2vvDBdJvHvRZhTtA6BmmnfOrFsIQhMPn2esu2bBay2evnUPW?=
 =?us-ascii?Q?8M0b8gAzv7NQdsWcm3zOWwc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4096263-c6d2-4f2d-f8e1-08de20b96bf1
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:29:48.6262
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 95juolukpqRUo6ZTiA8TkVdf/Iq5cuz9j45oxWSyQo+9C3Zaysh/0ntOj4D9zH1e1B0DAZ25aNzxiVEJUb4+CWs4vIvXHHUbnzVyJFkMxUQSAM0w086Z663aqlXVymRC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB16440

This patch converts below functions.

dapm->dev					-> snd_soc_dapm_to_dev()
dapm->card					-> snd_soc_dapm_to_card()
dapm->component					-> snd_soc_dapm_to_component()

dapm_kcontrol_get_value()			-> snd_soc_dapm_kcontrol_get_value()

snd_soc_component_enable_pin()			-> snd_soc_dapm_enable_pin()
snd_soc_component_enable_pin_unlocked()		-> snd_soc_dapm_enable_pin_unlocked()
snd_soc_component_disable_pin()			-> snd_soc_dapm_disable_pin()
snd_soc_component_disable_pin_unlocked()	-> snd_soc_dapm_disable_pin_unlocked()
snd_soc_component_nc_pin()			-> snd_soc_dapm_nc_pin()
snd_soc_component_nc_pin_unlocked()		-> snd_soc_dapm_nc_pin_unlocked()
snd_soc_component_get_pin_status()		-> snd_soc_dapm_get_pin_status()
snd_soc_component_force_enable_pin()		-> snd_soc_dapm_force_enable_pin()
snd_soc_component_force_enable_pin_unlocked()	-> snd_soc_dapm_force_enable_pin_unlocked()
snd_soc_component_force_bias_level()		-> snd_soc_dapm_force_bias_level()
snd_soc_component_get_bias_level()		-> snd_soc_dapm_get_bias_level()
snd_soc_component_init_bias_level()		-> snd_soc_dapm_init_bias_level()
snd_soc_component_get_dapm()			-> snd_soc_component_to_dapm()

snd_soc_dapm_kcontrol_component()		-> snd_soc_dapm_kcontrol_to_component()
snd_soc_dapm_kcontrol_widget()			-> snd_soc_dapm_kcontrol_to_widget()
snd_soc_dapm_kcontrol_dapm()			-> snd_soc_dapm_kcontrol_to_dapm()
snd_soc_dapm_np_pin()				-> snd_soc_dapm_disable_pin()

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/wm8990.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wm8990.c b/sound/soc/codecs/wm8990.c
index 081876f7c73ee..9f2b42025ec9f 100644
--- a/sound/soc/codecs/wm8990.c
+++ b/sound/soc/codecs/wm8990.c
@@ -1017,6 +1017,7 @@ static int wm8990_set_bias_level(struct snd_soc_component *component,
 	enum snd_soc_bias_level level)
 {
 	struct wm8990_priv *wm8990 = snd_soc_component_get_drvdata(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	int ret;
 
 	switch (level) {
@@ -1030,7 +1031,7 @@ static int wm8990_set_bias_level(struct snd_soc_component *component,
 		break;
 
 	case SND_SOC_BIAS_STANDBY:
-		if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_OFF) {
+		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_OFF) {
 			ret = regcache_sync(wm8990->regmap);
 			if (ret < 0) {
 				dev_err(component->dev, "Failed to sync cache: %d\n", ret);
@@ -1184,10 +1185,12 @@ static struct snd_soc_dai_driver wm8990_dai = {
  */
 static int wm8990_probe(struct snd_soc_component *component)
 {
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
+
 	wm8990_reset(component);
 
 	/* charge output caps */
-	snd_soc_component_force_bias_level(component, SND_SOC_BIAS_STANDBY);
+	snd_soc_dapm_force_bias_level(dapm, SND_SOC_BIAS_STANDBY);
 
 	snd_soc_component_update_bits(component, WM8990_AUDIO_INTERFACE_4,
 			    WM8990_ALRCGPIO1, WM8990_ALRCGPIO1);
-- 
2.43.0

