Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010058.outbound.protection.outlook.com [52.101.228.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF0812CD8B
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820336; cv=fail; b=U5Janj0QzeuROcV+g3w2/yblUh6+n85LOICxWWrBbp2mpkaYkwPIucOgICsjNd6+pFv/ivOtatLWqRCGNCnk59BRp/2LYm5nYazp4ofGNmObeplcQYHQkH/kUBxu2vIgSajQBfwARTajU/NopL3warFhc/YbnPCb7m9RbPuC6wM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820336; c=relaxed/simple;
	bh=1HKHxL97KW4iqRW3ikymlp1XKb8DaMTUgq+EFYBcOf0=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Xcaqpss0WpD0k7UKwWmCi1iwTjie4z4tFmzK2b/QT1K2ayuY/3KsPtRQzXM8cRFdqjLFgaA9IX8YNjbTUO21K+VctrLn+zqwvH3SpDHwEIAhdfnEnVruXcM+uQXNab8nH7ScCj4pUYE5yLhCk0bGcEWOdgA6qOZDtzxqEzOHRFU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=DJns1BQz; arc=fail smtp.client-ip=52.101.228.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="DJns1BQz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CfaFuw45xsvKNWJobY5EirWvqfZuTrgnthJN1m1RxZQQY73DfMvoyAPxLKH3Z8ol/yIeWQs8Fc+u+9i5Mldfdm6xxGG15WaQzonXgTNA1sIYMdIC9xRdDY5pM4jhRRSkZQQ7Sai4kQNLORiPZz0t2fTTT+q+ctoU14xZ7VMg4pI5HUlexicyTPGmF5jD4xZF7vCimI2zsACnvgxbWJE2fEEALyv9asWA47eRj2KAjz86y3qae3G+ktjNjkLpXWK9aLc4blJGeOENhW0QDIkD7PsrAGrqP8rdmhEeKu7ekX2memcUMoQeck+mRY5He5lSdcFS5XXGblVtSlX2EVxilw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9syQNuiiZRT4GE4tRhbaub7jE7tokkYKO68iXK9xL1M=;
 b=b9M/kTRI4qcskNWu7dsYbR4BeapH+6JIkoZFFxjxrMfmHAY+BklbYHVaUO6TgO29Tf42erhfQMpoXbCFLUfSq71clSRNM39JDXXP0a+LDrw0oDzP8eXk6UW9+79gF9nz9aX/jbwI3xVzt0rGGFiMJQcCOseSyCFaGIe68HunHfKTS8ZOkjA94nOemrsY9f9XmlKzoJgUlCopFYx2UOhLi+WaaFM2ayouDTOhu9gNjfO+Z/8kWeopzbEdPtXe/Jcz+uRI+MPpC4KivcTSdHszfyvDF7uYchgECGa8pU44BxAabOy4GFMu50GiYb8ErgHPuaJLqSO/AgJ2Bf6U09lK4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9syQNuiiZRT4GE4tRhbaub7jE7tokkYKO68iXK9xL1M=;
 b=DJns1BQzTVQzU7uEzXU/GvYmIJbN+qFU5nP3+3KN+/YU8URQg9oX4YHils51wZxgF2t+le+KOJZ6x+hqKMW4Nfs1llXFk86EGKDl7KqNksat+99i2X7cY4XF+g9XOEOPoGQktafeNtJ3b+3N4nBIYEwRmvlrGEmeKZhb5ZUE1YM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB14299.jpnprd01.prod.outlook.com
 (2603:1096:405:20d::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:18:52 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:18:52 +0000
Message-ID: <87fral8lqr.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 023/292] ASoC: codecs: ak4641: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:18:52 +0000
X-ClientProxiedBy: TYCP286CA0265.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB14299:EE_
X-MS-Office365-Filtering-Correlation-Id: ca1ee3a8-8e64-4ea3-6c0e-08de20b7e4fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RtPnY+vhFy23kBDWM8TwufDsW8YjHm9q1/faVTJqnFMQT5iLidNiv6/dK6r9?=
 =?us-ascii?Q?Fl0seWsd1jdaAfgDclSKM0XMoGk0ZJth9WnOpcnKOCgrr8MTLqrur9A05l2m?=
 =?us-ascii?Q?tqSVapUdKdjZcNsuxrf60mG3KhfgVDSUZWDgqQHOrtB8fyZVF/6lj1kCFrDq?=
 =?us-ascii?Q?/iOO+Onb4bQHbOWq43chFaGjr16ZvqIxAbE5cTnZCdUfto+3samynm9LPy1X?=
 =?us-ascii?Q?VwHI6y26VK0wQAkAGpjbh7qeRAfDEPCT8OcDqkDQOvCHlDGzXxU9g5iwQ07y?=
 =?us-ascii?Q?FLN5Oyx8yhPQiPO0Nz3ndfvVvPzxO+L14R7e0oihmufVrnnFRWS1GLme2psD?=
 =?us-ascii?Q?t8gkGCuAQoBRunAlhJYAHLbB/k982AYgte56v62nrD4xrO+AfbTA2wGf0Obh?=
 =?us-ascii?Q?o6FKQWNrKjRlainyTpzUsw6KL+UrIewHiNArOP0AXMXJvOYEWfY9Z+/RcSLr?=
 =?us-ascii?Q?rKfCR+h4Z/iYZISoNNASnRkHyHdomO9KfQXxT7UScRSckcXoffTCA459N0U/?=
 =?us-ascii?Q?ohzirdNH2wIcWmkEeX4mfa6ccTWkjIoYA0RMBCsBYcuHYggfA/mJ1BCG85u7?=
 =?us-ascii?Q?uAeqA7zhCbFxP+rWZWG9UtoY3FaMfm3jVRP28Q0Ib7mZfTMuXB/st87Csa9B?=
 =?us-ascii?Q?sBOeoo3vO84feHXqtyn4VIwsVxWYkUHaz/W9GAkZmOwFQ7BMoSKv0wF2OKNN?=
 =?us-ascii?Q?pG/onroJ3cty8+cAeaGnEIlpvYINstDLy+pKtevJRQEe/M1ubRHdGmUwOjwN?=
 =?us-ascii?Q?UHFIZic+EnuqC3ULSFdaWivnxbw8mrkAD82uq/UQKAwgnvxyBuzxL6wX00Xa?=
 =?us-ascii?Q?OpiuEe+uTro1DngcQPpLnPyCzxG1FFkcF08tzIwNWjLlMReEkkXZ/2qF/cwL?=
 =?us-ascii?Q?GHiO8Qp6wn8WJPUs6L96vObtgSx3Z9DbposS+04puZbHEwJz+neXYt8nmWaK?=
 =?us-ascii?Q?qpAAULmjaZSxw2IWhx5Nq0o/iYQNLhnAGL9LJygR/1KSAw5bNn5j6wUBbFIu?=
 =?us-ascii?Q?sFGRzo0BBJe0U5vM9sw8dMQTDmI/PFgC3Xlk8fbcAqikP4rvkVxw7JpaRpA2?=
 =?us-ascii?Q?yISqVLbLjTfmKEWpSyEhDyiCvcayWKzG62tj2IBcq9xO3GExOX8+wC7S0WAD?=
 =?us-ascii?Q?hTGrKWl3mg6n5pxyiCW2UsmYALxbSObHB9e8eqaRgyXwlC23syhoZvP6M+Ye?=
 =?us-ascii?Q?1HbANpaZeXPO/4FUiAhezZsA8jMRqX7dIUMKCzG4C57cUUMusYMQw64/Zki2?=
 =?us-ascii?Q?qoqKc4zVSREEftVr8VqP781OSWDxcRQMtdUw5pT1Mpd6cigt2OHPtQ+zyaiG?=
 =?us-ascii?Q?N8/SkvHgV1wc24j0xaTlciMA9BQMkxEN+TpePgAGMwLZ1m3ZGu7HFwkFmCR/?=
 =?us-ascii?Q?urx9xwlCxis1Ra0PnAsx55Q6O4SH3aIjIpFAXmQ3BCLQTMzMjCQWUiLQvwj9?=
 =?us-ascii?Q?3bLGZPv3R7sCNHy94zH/Gz9X/loTI29Y5r7FiY0glkIfazcy7WKdVEr58mR4?=
 =?us-ascii?Q?bbRk/m5w58N5VrPioBxgnMvtEbOK1LHW2DUJ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?J/hb7pA+XFj17o44fxOyryW657r/x0fWriXx6xwHpHveii8wxKGN7C8nl9XI?=
 =?us-ascii?Q?dIRWz3NpozZYJszPAsF6g352JAxzL8m7gK53kBryW032DetPvVyvBwhslsR6?=
 =?us-ascii?Q?HVe2vl+KV/pMiq+7WNpjyeGWNFpKg05dLlfkcnuQS71KyItbIlqYy2i9CZUY?=
 =?us-ascii?Q?83O0SyRLYy3eG5UALkCC2H/69JAyMvt/7GPqM9EAz/tdWND0Ec5LQMrfVH8+?=
 =?us-ascii?Q?zey/9RWmUUuRUsYYvy/gd6LrUY9zxas58r+WHx0WO8cC6gBAli76VsMfjlbD?=
 =?us-ascii?Q?P+bEFW7sZUQkmCG+XGlOMObnPQPwQPvUmysYUBy1Ags8sj4NTbwdBD4Q3Z8H?=
 =?us-ascii?Q?3mPyQWNJQ7+qMLZFt1EyWJignqXo+j7RmUI8W+44bajAl/XoVrjuGpy5655L?=
 =?us-ascii?Q?ITo6zsZJhKJ/tuoNyL2VEsTKLLlfsC+rHJdT+LKauzYSLkHXPfQasUalow5l?=
 =?us-ascii?Q?OneDwLiClNh/o8VVzwt7CKZbZhs5ndmQGDX7Szq0Akh1acBCvUoYeYCCuM5c?=
 =?us-ascii?Q?JzM/+giJKyoBUhLXdqygEJbnu1lY5WGk26/AYghSjCdOEt9hRy4mAOK0bXZR?=
 =?us-ascii?Q?lQgroTc+y7C3gNwgS6OH3HqiXNipMcIP4tfGdbDh8lPudRsoQiGwX+iw71E8?=
 =?us-ascii?Q?jyEjolh+R3ipy7C4ngN0L2aeiMpencvx3sX8vBKz8K7ZgYSI6PUPuTvjIxWL?=
 =?us-ascii?Q?Gf+Ipf+H1Dr3Dfvu0QRIsKy6aKw8z3UUdd9HAHyQ/zgUAzzifKtia/S6QRPJ?=
 =?us-ascii?Q?NGRvA2zy28i4Ib0HZMmhfnDpAVwWCxDJNoF+rCzp5uixS/V74Mf0c6qylcqR?=
 =?us-ascii?Q?oGlXe5eZrSIXp3WpVPliKli9uRgz3W+zW7O1WOi+lH02phS/qmAnKS42rYob?=
 =?us-ascii?Q?UKSw5rAF6GzBB5Pt/3B2Dx66UzHN0X8xIvEXWBt35Zf+5Gce5ID29RYTKACq?=
 =?us-ascii?Q?L70X8PuM19ADahpi8UoTCzR+ZNt26wsvrDgGVjcat+HC6fZGhPwSExBT43KD?=
 =?us-ascii?Q?5QLziiaWaI6dlGXa8zDLguBKYr4kpW8mLpcY/5FJM/vYpaZRy6EiX7zFjRUA?=
 =?us-ascii?Q?lGFUZ1TVw5gmkiD/1aIAsfwaksqZ/DExdCHMP1PzGROWowjSxVwngTD4PpVL?=
 =?us-ascii?Q?4Wv3u5BoKPBErldHS8fZOCp9LPmFEDOflvfbQPekr3eAh4BVcAt6G3dkcwXf?=
 =?us-ascii?Q?1f5n3BkMy1N+SL+QWliFIQsv8cUPeyz3zfTQLKu6yu62lslHkvgAK9zypEq+?=
 =?us-ascii?Q?TANJlWn2zKAT+rJtu4/HiHT3wBe/Xr3f4VoI4BvaumI7Yg22hw3NyEczpvZM?=
 =?us-ascii?Q?8c0PKCjJATxZTngN7emOHFbLtPtb8ze8Ve+C8ZhXgW28cTIuWbYO8dkVdFoF?=
 =?us-ascii?Q?CxCDQ6sMefi1SR98DDlJTss6Yydn/CucI6EDXw7VAb5tdlBETdwIgT5QoAyU?=
 =?us-ascii?Q?XdznLr2k5A4l+XRf0DOCX0PvzZJRbxdnC34u99l18kYFIP4apgI+/W3GcSAN?=
 =?us-ascii?Q?1oo3fihEV8GkJ0HahQpcwo8D7v9AhyWWU5VbUHaKHSn3rdEn3aVhaOl+pBJO?=
 =?us-ascii?Q?B5H87fi5x0WcTtS/vmxNgg7dh0YzED+IjTQbUtdDxhmc86V8ekdWcDbvIphF?=
 =?us-ascii?Q?KmoIQmQbCzxheFLFb4zZ4wY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca1ee3a8-8e64-4ea3-6c0e-08de20b7e4fc
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:18:52.7083
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p+Y/ROYJV/DdKI5doT2ZefRhHaeBayP2DT43QuR+TGqjah9VUKnFuYvq0j30euMMCGs0zR7UJcl1lWZIGE814B7/BgqKbzQhsEEg7qmNbJMHVySH+VWDEqZxx67aGWZ0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB14299

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
 sound/soc/codecs/ak4641.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/ak4641.c b/sound/soc/codecs/ak4641.c
index 53c5d3f50353f..9db8cdb26d33a 100644
--- a/sound/soc/codecs/ak4641.c
+++ b/sound/soc/codecs/ak4641.c
@@ -415,6 +415,7 @@ static int ak4641_mute(struct snd_soc_dai *dai, int mute, int direction)
 static int ak4641_set_bias_level(struct snd_soc_component *component,
 	enum snd_soc_bias_level level)
 {
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct ak4641_priv *ak4641 = snd_soc_component_get_drvdata(component);
 	struct ak4641_platform_data *pdata = component->dev->platform_data;
 	int ret;
@@ -429,7 +430,7 @@ static int ak4641_set_bias_level(struct snd_soc_component *component,
 		snd_soc_component_update_bits(component, AK4641_DAC, 0x20, 0x20);
 		break;
 	case SND_SOC_BIAS_STANDBY:
-		if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_OFF) {
+		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_OFF) {
 			if (pdata && gpio_is_valid(pdata->gpio_power))
 				gpio_set_value(pdata->gpio_power, 1);
 			mdelay(1);
-- 
2.43.0

