Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011044.outbound.protection.outlook.com [52.101.125.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ABCA1DF965
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820918; cv=fail; b=iEpkZ570XlAqlqVJXhxJCKbuapekIU+cgTRKAEihKhC9C0+StcWlh75FqzP0G7PT7trzG/E05Kd/yWmTi9JT4LRJIUhOrBHkkADG+Ti5AGrPI+7cEVekRdqyofXaB/ahffYkv9cJlTyvh6qQc3fqmg7FB6hoJ/MYtqmuN0vZyQI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820918; c=relaxed/simple;
	bh=6NmH0XGUEa/85I+RCVS5ALvvPF6pju/dzFzmL2g1qK4=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=lyPNH02/qQyDG646Xyg2IiTHtQVU+8WGNQDumhP2Oz7AW/mpVXqKXeMLZSQ0nxGEuCgs6+v40TbHKJsAK+5twZDhqVDbR8To/5q++W++43bq1s6qiMqy6rH7j+x0UC99TkShsD2vzc71jHHPYYKgRjIjXuQ4BrdAPWycWukVuAE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=TADPlorw; arc=fail smtp.client-ip=52.101.125.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="TADPlorw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h9LjJXj2O51WCIiLCvioIy2TYGeQcG1/xpQQ7C8hjBBQ09M4RMHrpP5bgzB+GJOYFunyH/+9MxAecQrpaP28tUqxoYv1plpW6IxdBAUAQPRfW9gxouQHMPIHbHYUgKXD/8h9gna4weEWt/7T/OgvgMKmJ9V+fEyyXuw53rITSbwCp7D8tL8hrYPJblGf1iP7ks8o8bOcJKN6Njc/0BA5absvObSVdE27pgwv4hCEMCyqaPHr1m6U9oVfaPTMy+J+T6ypwAAQVJ55uW17bTIWINfBhuteUniFbaknfUQ4X8knxr+x74XTXWs/+MdtFZkejzynMn8Pm7wJ4aFn6//zCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=re4DtUpvHbcl8dJAeEzEhq2P8QXNUICia+5Fx0qqUQ0=;
 b=ZUWvGemlCsUzK6pn2Avcyb/aCRHzpjn5VXr+JnUKmeV/XEHt2ZhzNxvHz22qZUI7K7oVmqxvINUf69fz0cipK/WFNcHZEu+aVlnOJsIstIN6JcM2QcSv61IFKBvbqBv8ldndwcNx6YXcUYYpisFEVoEVnHNR4zS4VGjg8kFODjbWNVrcSG7snXbWgUuAtaUoLasBQpHmBtJ81yETUno1uupYo0ZLs4/95FlPYsLg5/jnrH0aMMTAy1aSKdyzfezBBmdk55Sjj1XF7hnpMUZKexEu+eWXaHSumZKxkfdKt+u4rEP/Gggv1pk7Q0LbEvOdRJBLzhLaqJC9RBiJB/o94A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=re4DtUpvHbcl8dJAeEzEhq2P8QXNUICia+5Fx0qqUQ0=;
 b=TADPlorwP5U+Z7tXwIUjhlUnn1Bv7+lMBeFCV3JH+7/j4gU7h+b+73RZ2JWz8s31Xt+niqlO/tqEjW7jiF9/USQDZ08X2nKW3Y6W3LE+wDyERztsfdi8fW1VdmxNnhtalWkCWGcWkiBznmQOEu2earsolGQBbwgfR3fJsOgfhpc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB12798.jpnprd01.prod.outlook.com
 (2603:1096:405:1e9::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:28:34 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:28:34 +0000
Message-ID: <87wm3xza31.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 160/292] ASoC: codecs: wm8731: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:28:34 +0000
X-ClientProxiedBy: TY4PR01CA0005.jpnprd01.prod.outlook.com
 (2603:1096:405:26e::8) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB12798:EE_
X-MS-Office365-Filtering-Correlation-Id: 415d8ecf-d85d-473f-26fd-08de20b93fe7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fzHj7zPQ6P83RzK0jEJdMWfokO1RBnvWTxNjbMRbRyowiadD+YpPNoFE6A+P?=
 =?us-ascii?Q?BDFlX9JzuaDXRQCkAkWRWqhfIPHzMx8tfdVJ5zdGalt83qyt++byoEqHvTFy?=
 =?us-ascii?Q?LTZPhNtfH9TzYv5V8AG4NJmIf76nf37mYxry03AkaNKL+calPh+5Nqss2dNH?=
 =?us-ascii?Q?NLFtWM3iRW4Iuf1igZDsSXqYnfIk4USZGu7tY2tvdEUWhqnpE+asncPfi8JO?=
 =?us-ascii?Q?nrzvRaqOnvI3FWgFrmBGnyaoXArxJzN3hdhs8L7Qqfze58P39kWCZlU7troE?=
 =?us-ascii?Q?mX0DbdIzdWo0haQhWw0OgpRMw0XHoYn88NdrSTcfG7a15RHXeNiHX/FnMomu?=
 =?us-ascii?Q?o99AOTzL5F+xYOvMBcGS8E2AhyzO7zRo5Jo4sWymDWGXpv5zYqDZEl6jcbUg?=
 =?us-ascii?Q?fMf5H5b8SXl/SDoWSoRBjcF9A+yAWCkiYPL9YfD/F6B7IMonG/cGJfD/NQBm?=
 =?us-ascii?Q?Hcj9AKqvrXMRSC14smAknkYrujvDOFotpzA8WCxMtv4LN0Xny3S6JHnP+fit?=
 =?us-ascii?Q?HCbp6thFEqkKneTeabOV0VMKGnKBi4y1orui4KxN7XfyBpqIP1vB+KW1TNxZ?=
 =?us-ascii?Q?eRBtNJk7RuT5QdhXRHEYAydICW1ITxNbfuwB3LV4Ku8WqHZIk7fAX4m6klIo?=
 =?us-ascii?Q?hPPaYF8kAo3NdZUj5sv10IlOlsC8DJnadRs6fzEsszeWSJmOlz6q5yhQ5agh?=
 =?us-ascii?Q?jhf3CdxmehJ+0gsWfX3op+Q2RvfOhzpkpyaQV5c3+itGvN9W+ETjFJenlefn?=
 =?us-ascii?Q?aLO1+C6XLVVf9OwRdatwIj1ojJI+G5OoyJd2t3w0qExrmmybxGwgZdnRouya?=
 =?us-ascii?Q?7JIUzUyKoECzueGKQT6l3RuRrjl34rMxp/t73rA3qED/aGIvY03PEglakv9W?=
 =?us-ascii?Q?gTJfHW2BuR+kn3A1ltc1sABtz+hseqBCBNe7o+OxcZHxRSam6R+LbMWo1muC?=
 =?us-ascii?Q?Ss3fWuL5g4goEkx7k7KJi4K+XvdU9d8PJqBbzg9GHANWGmoSHDSYdfXCvL+X?=
 =?us-ascii?Q?codich4i95Hg6+c/1bfBZvTdL2vowDWB2ZMT+1qYSPby6POnen3GgJeu+QK9?=
 =?us-ascii?Q?wrNin/b+LJx0aIAPOLAyY8bLRp6ZKjXt27KX9qyhQkMx3XDoRXOAmPPsLScC?=
 =?us-ascii?Q?3X8Fk3Z9W0VIXqpwLxsDQZuHhCTwtwgtUFYDqkTcXpRzXw22onh1E1h2AzJ+?=
 =?us-ascii?Q?/u+VZxhhZMLF/lXKDTWFFxS1HQuF1pgVEFqIub32K1WHVYo6P6nXqRq7rvTd?=
 =?us-ascii?Q?IlcOWsUUWn3Dx9MQzKoJGaaEoU2QfvcG3YJT6z/IcQq826Er2pwWVfaSxl6W?=
 =?us-ascii?Q?P86c7hTWjAkpbPIEDomgjn6+SZvP6CiawbYJAutqcoqPJKivVulljfnLXQwM?=
 =?us-ascii?Q?FeeHbuWLGbiWYadv0b+mBjJkS8iP+O7q5yTn/lER3QAa2QUBUgKWnkzhxbmj?=
 =?us-ascii?Q?lf9Lmrb2VK47QtetXFNv79SFEBcIPS0wMZQ2jbL29xcRoBBs8ULK5rYuo8l3?=
 =?us-ascii?Q?iXtMDAWebQlGsEmkQAOFBts9yFJrCP2mO/GD?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vMbaK2jTMbd++dz/hzPENsYNub2Bir7PmPH8b8E5vFg1YgIPyJ1Uz2LRvKSD?=
 =?us-ascii?Q?m1PC23QyilAGC6ce4PsFxhlL5dnHZIB8UmANcTNtfLedNwTEK1dgPRb7iXqN?=
 =?us-ascii?Q?msvjcHN2q5NKTp7PJp2BVCNtyNxW5wP2TumGasfPw70vfcEU1PVth+jPykO+?=
 =?us-ascii?Q?b/XB9ZED98KOappmXAOGJKTKSnTPNrvXESUVkfPzGntCYT4ZVa+gmweTC0cJ?=
 =?us-ascii?Q?uG7InYmgQnUNpQvE3RbxZJnMi1EFNYZ/zTzomNinuuJG3JQ8t6Ev2RrKj0ki?=
 =?us-ascii?Q?i3TrbwRxUPOK/0Rg4PIQi+s+5YI4Rs/wAD69YzedYSJUmrLJPVvfuLBZsoNf?=
 =?us-ascii?Q?Hs5iWIZQDP4thpPtKgU9GNAQyeQ5WxREmJhSJIYAHtltvf0tv5bFIDax6TZm?=
 =?us-ascii?Q?MAzm3XLmFjOYJ4hRzmMV+EGGmkt2KDUzcq97A/3WrVmZXsFnLLrbHDHat9YK?=
 =?us-ascii?Q?fmfXnq7nY/2l5HGjKIM9TKqejDEvfmnzrW3xzSqmQBBqYF8V+kx3xeYKlKYk?=
 =?us-ascii?Q?yCk7DgatMdNCrShBW8h2OmadXbJmZVr7YFWU4/q3PDdy8amE+r+iH6gfK1Q0?=
 =?us-ascii?Q?QktAb7yiY6X/O+VnqXLV2I6eZKIxHDAkcNe1hYKVtEBTSV32h0Rgh9C3hVMu?=
 =?us-ascii?Q?WIN2o0rpQy1SBPiQ68heW7GjpVbsOlXBxXAKX/FDEqg0KKcHzuov8AHeH3mw?=
 =?us-ascii?Q?7VHEJ+Gj0Ph+N7LXIypDmv/K5m11itSwJWclT+cQlTapw6GcLG7lPcV+PMdm?=
 =?us-ascii?Q?GgNY/0iuwlzNyVfWg/CF4QsTtBNYnu2q1biTQeHr0vfaTMqc7kWfyfcVjHaK?=
 =?us-ascii?Q?dlPLFmnExc/spMvAKnKG6f/Prr6f7CLoiSLzY7xa4vWN1+MTn6DeFexpRW79?=
 =?us-ascii?Q?8j2xgCEicc26KjM/0+rLvJrCVl1jlWaK4199iOiY80qrykWie4wudmsnf/XZ?=
 =?us-ascii?Q?4jFy6zsuADDxEAv9UGX7YFjHNoMXCsqDxzybq0HJncEj+mwiy4ZoFvUsA5Jp?=
 =?us-ascii?Q?OgaFtppPtdz7ODUZ0NLyikCQ5fb2ovZ8f+PtU6KDGHhXgkZG4SYKoatR+Q+v?=
 =?us-ascii?Q?RlvRICU2p7yNqSAkqduj+jSkCxyhppY9SryObu/Luv8xkZ2o21YgKf1QDVlP?=
 =?us-ascii?Q?3Ecwxs07YiWPh2HwqESCleEBCSL+rkIQcYyJ47CC9x+n2lUkto/+8774LbMJ?=
 =?us-ascii?Q?kVaKhrvxqrCPVNVKQtNyKgQWf8LIZ1dA8xM8iAoDJEmCY1EVEkYek+WIEzhJ?=
 =?us-ascii?Q?iD6nqsJ+m321MRpC+gCyJjj+9e/9y6UOBBu2XgJsixi+8Mf7obYoUVWnJXK1?=
 =?us-ascii?Q?8KYPdkqhjRBx8XewSFYblhxkLFVmyecEENiE+krGU7OQcogfPNMzoOvxZ+f9?=
 =?us-ascii?Q?Dg52G2bfd0fsksqUFuS/nxA7bdztjs+UkDP3sMv+UFcftJGwP8XN6n7eWPRU?=
 =?us-ascii?Q?BXbCOtEjl/frfZcJlyezbiTvt8uD3VHAG5b7BIwnEuCa3rHfOAwqjL9SZpbk?=
 =?us-ascii?Q?tdGS99jlDbTHIi4AMY/F/ciHCSJD4+WgwhBqFv3Y53SqpmJbyoNwNZ/LLcVy?=
 =?us-ascii?Q?4gMVOqdrZcByQx4RWFbk3uFNTRwtvzNDWtKCYullGyVvkAMwx4dThF3BX0EM?=
 =?us-ascii?Q?RTrkvR0ftnZYbpGqVR2sgyw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 415d8ecf-d85d-473f-26fd-08de20b93fe7
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:28:34.7353
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e5BusWsGr0jbYfu9G4TkOTalmBekVNuL0wLlNn3+kaG+dbEElvO35RgbRpGqMWbpCAUlJT2sBIbw/A3nuQJBOFEsKBg/m3eKrw7SVQyUFVcgVmDi3UEfJAtTz9ktNY/2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB12798

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
 sound/soc/codecs/wm8731.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wm8731.c b/sound/soc/codecs/wm8731.c
index 0318dac1e5048..a03bbde5d8527 100644
--- a/sound/soc/codecs/wm8731.c
+++ b/sound/soc/codecs/wm8731.c
@@ -362,7 +362,7 @@ static int wm8731_set_dai_sysclk(struct snd_soc_dai *codec_dai,
 		int clk_id, unsigned int freq, int dir)
 {
 	struct snd_soc_component *component = codec_dai->component;
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct wm8731_priv *wm8731 = snd_soc_component_get_drvdata(component);
 
 	switch (clk_id) {
@@ -465,6 +465,7 @@ static int wm8731_set_bias_level(struct snd_soc_component *component,
 				 enum snd_soc_bias_level level)
 {
 	struct wm8731_priv *wm8731 = snd_soc_component_get_drvdata(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	int ret;
 	u16 reg;
 
@@ -479,7 +480,7 @@ static int wm8731_set_bias_level(struct snd_soc_component *component,
 	case SND_SOC_BIAS_PREPARE:
 		break;
 	case SND_SOC_BIAS_STANDBY:
-		if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_OFF) {
+		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_OFF) {
 			ret = regulator_bulk_enable(ARRAY_SIZE(wm8731->supplies),
 						    wm8731->supplies);
 			if (ret != 0)
-- 
2.43.0

