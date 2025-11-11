Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011047.outbound.protection.outlook.com [40.107.74.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF0B1A2545
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820729; cv=fail; b=TkTKL4r/D3HXNd5HVKCoUa4bpx8McuXBTueXoBe0U3XnpL/P+Y6E6F3vpjCGU9KyJf4co1ckopVhbC/dKqfdZSlFczAL0tuPYzvyQadW5ziqBHJSoO9JAVuK3WT1HxmNPTuqdKJDfqQw0f27SGIRUKVonsNdpupHJc6qG22UabQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820729; c=relaxed/simple;
	bh=MvNNGiuOlkchGPJC+opCOvIHDzknCnNHilNNQV+aYJ0=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=najeGlsOpg+VI3fKBvPXIIJTJZ2WGzzXi7+OEJPIyvZSB1PJsboehAhgjxZcpoFUyys1cfQC0XXOIo0kuK6TZQdo3ANPCLTa3mmh9dQmgLkgMqZxUOvUcq1x3Uyh0y3GdV6hsfw76xi9dtprhRRI18Ypi2iPmndgJ942kMCsyEY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=UwJVnyO8; arc=fail smtp.client-ip=40.107.74.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="UwJVnyO8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qlKjWkS93BZxJ6OBUIELo220gARJ1lYGnMWK/afy/8ge+gC2aiVRO9pqdZrSdagkjaIUo1BU6E1kjbUAiCTRLAACb8Zu8g3Kbx2oyxDHE7XI06koRdmZglWWErawekZZPRwS902+j950CdQ+xrR1DbAvUgz7POZ0OBV0YBOJtvksf+R/1+1u0sklMtOKlYUOTb4RlMraPq/VDT0KXh7pX+GpK8lVI/XHTpq/o9x1mUOOGmS5zMMev80gIf1I4FuGIyewmBA13Ea3pbo1dRTUBZTdyykryw+PpH/xak+RHOgXZU8CHgUqxUeUGDdIDoD5riEW2lD8ZaU+9niLPpUaHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e5pBgHFxjP2EzrDNU33qbID6CDJ1JcP/L9o+rpqoiyo=;
 b=LfiFk6l5A5UHfgbY6OhEY0iMEKzZoTP0PoekqnkuTe34MGeGRGERfo4Ejm7Ht79xcR7AcNIBu71qNE4w0FK74R57Rh7kD6vvgzs/5zd5uRIIGLtT6x/OYm4nXrYHTO5AkEQtNcl7kQj20goJnXuEUaPEv23eB4vy/spCqRmGxddaFU5Wk8nF1qN0eVp2cNv8kVlMBfv5MQH+b+YXrcaDUGbYL/RChyJ2TM2mnGXn1nBlnL8zZSK0jRIvlD1Q50qSa6iV4VePPgx1o6LNNo7kdj+/6tbiSWYBpFNdB4SG93QdU6StB94mDmj+W6ghjNA/QmQ/dQMYYj6JfLW3PuWMpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e5pBgHFxjP2EzrDNU33qbID6CDJ1JcP/L9o+rpqoiyo=;
 b=UwJVnyO86gsSuLTkU21VUvVRtDwDcaxHhfCLI1+0oNfzzbaygzIXKbfBo9yYR2Z0aA5TT1YcBUGQTMwshSHai+nch2ZAdL3sUZ1zjr3IFKk+bm3djSIuFNQwIPUgoiSO+jNL2RPP2TYxS2WbHtBPfUrc2DXBLChB7r1U0lAEPH0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSCPR01MB14439.jpnprd01.prod.outlook.com
 (2603:1096:604:3a6::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:25:26 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:25:25 +0000
Message-ID: <87qzu52z63.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 114/292] ASoC: codecs: rt5668: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:25:24 +0000
X-ClientProxiedBy: TY4P286CA0080.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:36d::12) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSCPR01MB14439:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ceabed4-0537-4c44-4877-08de20b8ceb5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xCVa6vzTO2GVMaRPekCJqaiwfm9xV2s/aDAMqwwuCxBjUmS8hxlEo2uZetHP?=
 =?us-ascii?Q?RAMkGQEU3kRJin7DYzxz7I/9K1iHrHrZ1Sj8eI6MF2OKX8YNqZyo2ON46HfP?=
 =?us-ascii?Q?XRdxYnkgSX7JMe8hfizuTdIibW+x0tLIkeUfS4J4TkCBP0r3UPRRSAVLSlls?=
 =?us-ascii?Q?6aM4OgFbIghIuLCuxQHNLczcKQGpkbgDjqhX3SDFNubtOl02NE2KIxBH9d3R?=
 =?us-ascii?Q?oqr7hbWZYcc/XdHnGB9qawGFXL9M5aApBbhLilOLNUM5xdQphzIPUKHzcKBW?=
 =?us-ascii?Q?Fwz4GUEAw81XnFf6oVkqTtIJOjZs4Jp3wdDj+5lJlM5vuPk2nrJqnMFVuwh5?=
 =?us-ascii?Q?5PL3hEDEBuJbS7pwL/2rs/kGSlou6aLIlwykpchaI98WntwWv51QbCT55DhW?=
 =?us-ascii?Q?qOpSLoSVYFmlKyYF6TgyKIPPAYHTgjUZsDe5UfMm3v6Se/evyTU3BGe9uURN?=
 =?us-ascii?Q?KbAb5s6sJ/wI7guApk2VAfZj+5HwuLi7ss273YTOaWfUBxE3wILUuK+ktKYR?=
 =?us-ascii?Q?iM9PJnS0bA8ri/3wpGhL5RA3S/SOsiRUamdyroipgH4YERDIfCfnVVMNhqQf?=
 =?us-ascii?Q?YPw8hlq2pq7Qgy2rOS0jF/R8IWhEdOdpDvbaBnBbKg+N1b5eY9V7ZenuQ5yA?=
 =?us-ascii?Q?AsUKwZv7rjE+xoYMiVXTDYoq3BBb/J1lT5H57SjptDdjb60q+1t7L/meSaig?=
 =?us-ascii?Q?dTzEsSfiRAJWo76cPyXRlHaX78LHFV5fkg+RmuBTl1vDAGzv7AcHWKtouxL/?=
 =?us-ascii?Q?HPmoRYKe47iDHQncvuiF9yNXgIbwPZZ8mqOzpU8hDhgstvVdP7nqczQ5ah4h?=
 =?us-ascii?Q?4JweATXAPK7Rsd7zQu/ZH4pHTbPecyIycJ/LqDDqQ5LHmjlV3425ldRwfE0g?=
 =?us-ascii?Q?cLhaff4I6MyupXXEQg3MqGW9oqIJkDAluVAt05f7jnbh3bmuESFr4GKrhGX6?=
 =?us-ascii?Q?0XMx3ciDOMVr98Zgzr96WP73PYD3GcRJjNOOcJkgxbSV3TGNWUwUIGtXiWVp?=
 =?us-ascii?Q?5rJh7LnCjYcQIYcF2uza2b/pS/x1/Dr2UY3s7acpFgFzVn7PHKFliIExOPop?=
 =?us-ascii?Q?HD+gxyoatKdDnJFh/3MMGoibZ+F8E5LwzP3ART5PRn8MaMoLaiHbGcrBRwuN?=
 =?us-ascii?Q?8U5dOPp6VQ47qAhrkMBA37oBf5bbGG/pFevc4F/oEfpxGZRMxVBIIpQv3dfB?=
 =?us-ascii?Q?RtMz+TKKxltbMmkRkPNClI0GTx7GtshFHZQIZGcaaVi4h/5C3ESmDsBfvA8R?=
 =?us-ascii?Q?zT2Zk1rUIrD+KHXj6xW2gUciWt4StivzABzTqvjbzRryKW6MiG00fdYEUSaf?=
 =?us-ascii?Q?PNojRAk6dhu2QwcmAIr1gR5ss7NR42pT7VxN4nQDVTTorhBJepPKrYZ+EI6o?=
 =?us-ascii?Q?NyKJR9JL+LGa7Yc3AsdjOP138CcjGeU2/3B8Rg1cay8nsNlhIhpECS0NuMVT?=
 =?us-ascii?Q?SKYLPtc6wMNineQrpYpamJMbFRiNt/YddB6tH+lTZGj4G1wSsmH0Mmq+6Y7e?=
 =?us-ascii?Q?MuTtW7vP0r5r1B+8K3q6RXp7N6I6xvbRaZXq?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?teiMkrbYKWdl/lPijrXjTu/om2Oa8VOoOEzSOfq4c8lvAh1b19Ny4fruOC42?=
 =?us-ascii?Q?8vOZm38K6q2mgdqLljWreCU0+12Y13yfywg6TTAG042FQKYAwkANBK2PZnl7?=
 =?us-ascii?Q?nZUclsX4VIqMr8I4dYgjyjrj9+pNqvE21nyx2I86whc8LjPamMjV3KWkUugo?=
 =?us-ascii?Q?4e9E6/R2p8urKIrEZNdgjVjI3mQnUSXw2/owSVbpPAVhNHeZL3XiP/oBe9t5?=
 =?us-ascii?Q?OsIT6qXr7moJryqiGa9BJw++ogWKbDZdWRAsiTQQgYOtdMurkwF9xx01+pJ4?=
 =?us-ascii?Q?qk2B/qdFM5w9P1I22Xkz9rGXmy0I702UMreM/jNuq1VKqftiIB/VpFAggmpO?=
 =?us-ascii?Q?xd5bUXjOdvGObOXgNzARcibCOevI4ViolYHQ50p81tDsYz/yaIZaWHhvES7g?=
 =?us-ascii?Q?a5hOy9AaNhyqvP1uPW81iZiIH6C+C33ml66FwGXwYc/xt8Bmv051/LvYPNTZ?=
 =?us-ascii?Q?U6u/1CGY6nQZkhCOM9jEUyJq66dQXN8iRdH3FSPojmqyBHr6U6bUc9akcJaA?=
 =?us-ascii?Q?sV3DA84B6929pHaiaRjDAd0FAUmknBIdsaQMiWeFGlCaXI+s+jkv8AckFY6i?=
 =?us-ascii?Q?U2FonZCraBMilUbQQOi6vPDc0mbxLigc/+Z4v2IuuucyOrloGgv74c51qbUk?=
 =?us-ascii?Q?6dnqxC0qFML5GRg660/bU2H8XnmbbXuz2wTM6Cu5rIt49CDvp5x5axfMp33B?=
 =?us-ascii?Q?G5Fi0tk8MlTFux4c+lCUtyIUcq3WUJIWZ6B6j5MeiSrdkdAHp4RS/TUd4gMq?=
 =?us-ascii?Q?62mlLqOJGd+DlKJX+2Hj6DIurxibYWfgL9Q92dA9eNV0qnkzTbo3NiGAQoys?=
 =?us-ascii?Q?kUOPzwHWnLTEUmDRdL65oNdN3czBSCM2JxBRmNF9zOP+gQmA7mGdZ3q/BxbB?=
 =?us-ascii?Q?K8IMNGpH/0pDcRJA7zP6Rl3lZgiYQXOuOngV5YueLykDL5HrbupPe/fJIu51?=
 =?us-ascii?Q?PyHPvG+iUYiB1lc6TikmqH8xeOfrf5gurXKzZcxO+ccLMPSONykMuseFfxvV?=
 =?us-ascii?Q?TvPnx1grJTKA/wuI7JcmUcf/9yd7AmQ1tkDJrM4S1atJTB/q1/+wmSomCtYl?=
 =?us-ascii?Q?dTXpZBlfOpW/dBptVcm7rrDdtwcbZC+0FUuKCrbofC/4MFL0LDBG3S60RKpk?=
 =?us-ascii?Q?kyQCi2HWyCviVpq5aqBPoN7+v2ooWf6KaE8mALv7ObTELt4WMAfz9XGFCZAf?=
 =?us-ascii?Q?wu80ltaveeonVqOZMTqE/Bcdt+GzIyL5Qr52NfNA76kBlnWxR5pm31cOk2PV?=
 =?us-ascii?Q?W0JRhAPKzFyqm6z5TaoLNG4s54X44Ws1olT/87Z11EBbZPohRxcwln4vLI/X?=
 =?us-ascii?Q?gfjrDfjv7ChEyTCJ86HU7kHhEtGg+kkXnbZVm1Cxdifg9VIc4ZXzAZ4ZHsJJ?=
 =?us-ascii?Q?YvdcGQvcWVToRbpOxQDk+n6oe6y/Lz9gidrwYg+xPd7X+GltIMaolsXqJ9d4?=
 =?us-ascii?Q?TExTfxz+jTMoCg/PbpQBX11jQmIquF6SirVCj09MVmIam8WiAxaJykdeczX9?=
 =?us-ascii?Q?kf6+NxcinEeVeHLiqqhwyWhsNPPK/7Kus+DeWJfPVaTJOYJxpL3XC2hCt9gu?=
 =?us-ascii?Q?SVR1lU3QilMKzC0wMRpnaub29flpU+rCroz4tNlo33pHQBzn0+vJ539pftbq?=
 =?us-ascii?Q?irofAnhu81wF9TXlUaB6RCw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ceabed4-0537-4c44-4877-08de20b8ceb5
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:25:25.8531
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q2R5FRjJpA52LRTKUDl+0gXqw/n2REIOSvkyp1T1nq6PbCHs37cFAkfgyy5v82VMXjChy0Eq5yRNjlw3pnhR8XgYMx3jMJqAvEbOg4lgoPugrowtze7EjlDpLvcnSbTT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB14439

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
 sound/soc/codecs/rt5668.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt5668.c b/sound/soc/codecs/rt5668.c
index 8442dd09cfafe..5fcdb50d5184a 100644
--- a/sound/soc/codecs/rt5668.c
+++ b/sound/soc/codecs/rt5668.c
@@ -853,8 +853,7 @@ static int rt5668_headset_detect(struct snd_soc_component *component,
 		int jack_insert)
 {
 	struct rt5668_priv *rt5668 = snd_soc_component_get_drvdata(component);
-	struct snd_soc_dapm_context *dapm =
-		snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	unsigned int val, count;
 
 	if (jack_insert) {
-- 
2.43.0

