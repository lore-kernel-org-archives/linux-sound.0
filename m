Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011026.outbound.protection.outlook.com [40.107.74.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5796212B143
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820315; cv=fail; b=GE92I5gFT+Iviqx088qy1+hQQMKdbM3q5jsCqu+VExTxPtvUlCtHTs/0TdO9EfPcBCCJnDcoCDwyeb1aS68zIyh/7X89NJ7n8REVuqDX9nHN1msjxmls2q43vx6uKEjLHijruTVfFkhvRKJh1BrzezOZdDNUIm8Gd3j2ZF6qT1E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820315; c=relaxed/simple;
	bh=lvAC+LQD1IKn6yo9vVcuryFUPjEa419XgiXi34IHTwM=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=N5fQKOAqHtUARMqg/lfV+FAbLHHlLAngX3AP5Ag/mnyiC9KWfP+Sw2JYZ2hVLS/YgH21hKmHRUArZUskYig1mtryBvoDNgAFf3UHpeH+dhaQ3c/mHLaWIaRHqciPMysuygEvbOttxU88tDO5HuW7MQ636u5AI3Lf+jmKYkSyg3g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=P+F1q04w; arc=fail smtp.client-ip=40.107.74.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="P+F1q04w"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ELcdPu4VTxPb5A9AJv9uINT6r+ZoVKCHS6KifHp6963WxPycDDBasU4EhCHM7Grx4SvWXAaIJ9BYMR+mXLiQ7AHn7HFCPjxzn36wot6WW3qXDK3dxLpFwLVMuG8QwjGhZJQUhzsJ/BX5VGnw8CtYqT8nc0DIoH18yePp3ghYtc0bfnZrYUidR7RC4Qum1iJIsU6M0VI4gAvZia31MXmMT16E8NWi/icobgw10k04M+5BrSQcLke0oKRWCfJCqb7tC3pDnUV6RWc7BRDYXM7yfbn5rqnBm1VJCtPvYbCiXX1aKyqKs7ri9UhJJj3aqvJD14u8v54s1oUl7Rkv44eqJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x9pisRzQzkjrT3XmfAF5P4oDHbOY9T14EQL0K0n/PYo=;
 b=gbGba3LuJ9PC04VWWoO2FfknGhhslHA+z7Q5nZFGOroTQS0UvSH2PGj88+16I5fwjqZR2FLM7+0U5xKZJi2XG0Po95LyiR/kPhaXLrOexAiUbJIxjrqdjcxpI5B+lmNtOEzTW3Xqhxf3NliIc/G6YB8oD6Jbbkbt+s1x42bU/x+dlNEkH5nieEMKHSwfccNXOVenYwYxlKIDOEph0erEFUT+pNoYjWZ4pTMCrMoIVk15PtHP0aoGhkyjI5j64r7lzcQDKN3tN7tEIejc/P+7dUaLOFDhRYYp+VtDx2kJhqaP9ISQ+aTHAvHfPUw/v/PWx/2B13Pn3a9rVa5toqm6KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x9pisRzQzkjrT3XmfAF5P4oDHbOY9T14EQL0K0n/PYo=;
 b=P+F1q04wbhXSzuaVx8xCBkgb8NWB2O1NpFxbQUiv4fN/vB2Q/O8qjdE3d5fFJtMZ/ij8GYBHZ9yuUwhVWRf8uN2aQRk2yq9qOpf9PkUlmGUxz6Z9WDB/wNBK9iKLm9tBj0i/EGIeNk2nerSVP+4v2cpB8mpJDRS6q7igDE5LXtA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB14299.jpnprd01.prod.outlook.com
 (2603:1096:405:20d::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:18:31 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:18:31 +0000
Message-ID: <87ms4t8lrd.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 018/292] ASoC: codecs: adau1781: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:18:31 +0000
X-ClientProxiedBy: TYCPR01CA0149.jpnprd01.prod.outlook.com
 (2603:1096:400:2b7::9) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB14299:EE_
X-MS-Office365-Filtering-Correlation-Id: ed1cd561-f9dd-4a52-1481-08de20b7d83f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kQXUadujeel4/Gd3Tkal8TjPS25G4rrx5+0qEmPchIcZomTe6kSsnPHj46n1?=
 =?us-ascii?Q?+pjcUgBIyMIlWuKVl8vabZjILtmqMpFhD/R5q+ms34B8NLqiKIb09Rnpqg2w?=
 =?us-ascii?Q?1rAPVUSGRrCqaBStN5MolCGYdQc28cDt2a/I47C2ruusvraUiQBDjx+eUtQ/?=
 =?us-ascii?Q?/l4M+Q1GCV0ZUl7K9iNuYqYfto7JwU+nxJaPBLlr2m3ma5xGKsm3kTg2EAkt?=
 =?us-ascii?Q?EHsGz3OihszA5OSizMoDKIkjfmaJv4nCub7sTWtInsT+Y3hTDVNCSup8NiAv?=
 =?us-ascii?Q?tieSr7Q0eIFb7MP4wGmnRVNGn4cLgzslBv+KUfBNCkP/DSSPguoG8tiEQbD3?=
 =?us-ascii?Q?K/5e/YEnzHmQnMc8hWoB3pSnPAogUT0p+0E9Q8o+Lixe9rthKwhPAp7v610l?=
 =?us-ascii?Q?+BsvbHy3I+9ikXXwzMjhm1Ay6KFMen4cxqMmnfSe4ebLBxQG1d+N/02j+OLd?=
 =?us-ascii?Q?uKZE44ToAjVcN2KPi6R46hI0s/GeX9tOCBF5cwQ8IxUXqJlk0RIA3oH9FOr1?=
 =?us-ascii?Q?VL/6nat+WBtXZ0y8aVOZh2PA2s6RsbEhy4F9JrgRwX2FkeuXrG8cPf2uQTkx?=
 =?us-ascii?Q?PvxGusjf9OshqAOrUpGJFRDa3vxURz+rlhSDQj5VX4ZrJk/oLzbeFhI26sGf?=
 =?us-ascii?Q?megBGC1N5bG5XAC+mD8B8egA06oSwoz2ueBCmLF32nqwpCHKMhLkU83iBJYR?=
 =?us-ascii?Q?VY4AR0WVyC1EOKU8I+jGnxFO0mS2KsnTnB8Pj7WGY+eTstisDmusZEi2V6+K?=
 =?us-ascii?Q?SInDy/N8ZCJTMIcUnkHwCVaUhpR42OMCGQbm7AhNhJhlemS5xpqbeXfnFkgw?=
 =?us-ascii?Q?0xpeBk8IK8JZbI7+SN5yTHZ+raGgg+WUxzps9sYjUuWCCDunMSfRvLjYGxc4?=
 =?us-ascii?Q?9Z4Ub2laMaVpYNt4qTYZMFvzfuexNRFYo7wd2WKYUtA6S3IM6xgzH9RcoXPH?=
 =?us-ascii?Q?n3gdJx2Kv7Z0SgOUh0EgDxiINAqj9mlIBjYmAeKBLDd3r5NKKKxwIZtzOwVQ?=
 =?us-ascii?Q?XABrIL9ewrK0WFVAnLvODn30Pr0EEnp3dD7wOl0TnK68qj6sJzhLWk9mYVnV?=
 =?us-ascii?Q?xRcBPjSLg70I2wUHzkYUsiTTiDr1r1jbd+SfanybILCeZ5PL/GXWXOV8kq2m?=
 =?us-ascii?Q?PpdvdsGH42Lj0XfcEw/hNrqA/9dq0eWmexml+VE0kRcq6jTjNnWBpSlpGam3?=
 =?us-ascii?Q?gGWCZcTw+izBMAW5ryC9YogeXKMJQdglisFy2itTP2crikYrd+2MozjpG9BJ?=
 =?us-ascii?Q?xl00aQbhlsF5T3gjAPuXOUVNcIpfdhC2+4CofCy0oqHTdOZVODPciifHSBJV?=
 =?us-ascii?Q?7igWapjeN9oMGIEgERE+ngej6ReEw4U/b6CY0udeN5+M4fJdHKXUzcX6JCop?=
 =?us-ascii?Q?5ayfHsuv9QuZVj6685tkkIdnYL3xM1nNdQ3/zCyH1+e/6D8JiKCLG0TGBghn?=
 =?us-ascii?Q?63yBc/dDgdioUPh3TBydMf3Sbsbxv8LVyglRLSNhNSIo0/x+vTjwpTGoWOjy?=
 =?us-ascii?Q?OYhP7XA+DnoKwJTtQYbPlkheRI7VqP7d/twT?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kD6p7hWmIyrCYQI62grUTLfjrYhZ45bpIJcx2SNdzwP/pY9lQYBBWM97DZxH?=
 =?us-ascii?Q?JfbAz1mGTlwC7WUIAUz2Hyq/yHaz8wvieqPuBNN7FovVJWTA0lRL5wl7/ZGb?=
 =?us-ascii?Q?BRId01Q5rNU+5VRR58FHrUq2b5ifIAEnKJFBzw9TgeHWsxhOpSNxC/OG3KzM?=
 =?us-ascii?Q?u1MuVCwtWN5/IFQRUZsVbYn5uKXI7B9ZHco/xVnqWO1+gWQ3AXQbzvK/xY6J?=
 =?us-ascii?Q?5i9cOEp1CNBD8ICcjl5BOD19XuVzK+RKvhddDs0093bUghP9l/alNarKbafL?=
 =?us-ascii?Q?GajRRetd7Egxr+UgB5VKJUZSZNU6vzwicfpfGoAOV4mvnUXJ5eT65FfeyS3k?=
 =?us-ascii?Q?I1t6lY+1f1zx7un1g3g1LmCSmj41/Jionp0viKmEn82V4qDYAaHAK+mOwS+M?=
 =?us-ascii?Q?ZhjfiVLinWntPVjHdfpQe7UOvFCe6Yue+oQp5HjQVBdTTIrTc2KEHfK6+fYH?=
 =?us-ascii?Q?Qxt5kaW8qH62jxR5TI4d2tCojhHvVG3ptuQoC2KpwKtfoc6nRCcIcz1fXUh3?=
 =?us-ascii?Q?M6ULhdUEiHOlpMRdq3GiuHpcjPG0EA8vfEmnmLAyss+Q+6xuylH+VcP4famR?=
 =?us-ascii?Q?/KffYAOAln7LJNFBX3XHNeII/kiMabnql7tELfhl5pKvtNUlQNBr7oKfYe/3?=
 =?us-ascii?Q?EjJRIFOPP6cLwcYxrphKrDbCq2ke4BaScAUgR3hSv85D+MBAEvP7cKqRJhuE?=
 =?us-ascii?Q?hmFXmT9mwM38d4Bz/NKTSSrGdxA2rhpj2I5BR57SSgtMMq0KiHNHzukWC+kZ?=
 =?us-ascii?Q?A8jZWzgihhMMXuiqH4u4rfgxQwRtOTIbyX/SMiexmQseaBS12n8d8jrii80M?=
 =?us-ascii?Q?fWkkphza8xdDOzn53DirBUJpxwlujHrtcXdEXuMmlpx+iJT1OZRRtGHeycNp?=
 =?us-ascii?Q?RwqXwZAZ3UOZr+VoZDoxPvcePgAiotozhS3UwN9NmcvomAOf4sN5ef6E7R7L?=
 =?us-ascii?Q?6ArJTERPDmvT8/12l6uZPHPtluvCW9GlA2C+huSHv56WthWMsnhpuao0tDo/?=
 =?us-ascii?Q?uD/XwUs232C+vj+esCSdiYmP6FYV1kh/iVWRdxZ7sDLApK1wWArUuYDVUpJL?=
 =?us-ascii?Q?TuJqxSDeCU9y8xi6vFp0VzTdFpC9gshB8SEueS5z5DIOgKn0GTHPTxLCW9nu?=
 =?us-ascii?Q?RPPkZL8V/ZExrbgeVqsEB5UbOIaJB76P+/KMIXTH92bw7VQpHCl6LUDqjz1Y?=
 =?us-ascii?Q?jsi/afL8+bfVqVeOwOkntXei+xLeglnXhyctnAoUkIHwlkAomcFQu0RDqeu4?=
 =?us-ascii?Q?ZNJ4jU79IYESCsRcsuyFFqTcBjZBg5+STZOtwjTef2ZYJFAiAuQEv3B8uv5D?=
 =?us-ascii?Q?WsxIGgfBmSz5my7G4XsJ7r7xTx4Rvm4Olan/Rf8ErvhSlB9h5ZSBpL5aiV5n?=
 =?us-ascii?Q?rbymJiCu1rR6dvAV2KZssScUi4qx2oNIaWDkWf4j3fxNEnJNAzSnMZtAjktx?=
 =?us-ascii?Q?j4ry/YvQ3hMesCB6XtjSv9MFw3ul+36D06TpaHNCw1m+68BwyHU/LTt/h5gQ?=
 =?us-ascii?Q?4FLeVk0PtlUrPUyaAKCzxKAErPfpOXpCyjJfb8qa8Ep9kejimK/RBpta5grn?=
 =?us-ascii?Q?Ed1jgG42NOHNYbkNGBzoJHtJ+cHXm8JjTG5p5YfTP1ZvHbKzofZKk9aOSeyk?=
 =?us-ascii?Q?ds7jU4IKdq3Ba+/gvPfCIuw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed1cd561-f9dd-4a52-1481-08de20b7d83f
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:18:31.3924
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7n7QBuAoR9GJa6v+fxfideDl/X3nda3EDLm9VAxKV98B3gO/GF9OGXD4qSmD3gAJZbFZmOLvzJrWRI94lIrRi8Jqd96s0lJowTDSbb0P43FwNWg3We0qWOlcnpLtShVW
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
 sound/soc/codecs/adau1781.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/adau1781.c b/sound/soc/codecs/adau1781.c
index faad2f9f8dd2b..38cc0b6e41227 100644
--- a/sound/soc/codecs/adau1781.c
+++ b/sound/soc/codecs/adau1781.c
@@ -381,7 +381,7 @@ static int adau1781_set_input_mode(struct adau *adau, unsigned int reg,
 
 static int adau1781_component_probe(struct snd_soc_component *component)
 {
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct adau1781_platform_data *pdata = dev_get_platdata(component->dev);
 	struct adau *adau = snd_soc_component_get_drvdata(component);
 	int ret;
-- 
2.43.0

