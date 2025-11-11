Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011067.outbound.protection.outlook.com [40.107.74.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE58A1DFDA1
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820914; cv=fail; b=RGUcVjy9LEOT+eapaEAS3NCE8Mtky7+SlxFcmsRxgb+VU5F+RD1toLRpes2hG+P0sBICnNuULarW2LVVzzh7e7J1V7e28P0tRGcZOQ3Ex+OG6F7r7WGhq8RFKqVj2nuFgwEo0uXrb76hav7gHHBtJsTdKd3eOoNhVFn5+xboDlQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820914; c=relaxed/simple;
	bh=VD1McHBIql06esgl2uoD5i2ASTsyJqJPlJBBZMh/IfI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=UdAKMrn40mQoTLI8r27Km6zww3XQnX/uT6Lrf5gqXcuV4vTAB68tRJ2HdX5MPrm/kJd/ruHYoUg2CrbaY8ec8M3dIpFY85tJ1kkPJYHC1co8qpE0nHut98WJ5pqpB1FAiFbGsXH1f+0O+FQgfAMrqQ+NpecFJKplHVnYNveddMo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=WQ2j2HbD; arc=fail smtp.client-ip=40.107.74.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="WQ2j2HbD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IKcJzcahURHcVksqyGhGnkgd3yS6c6b0p2vEeq2AmWpz1RrDOSzXzFc3vDj9EJCvixB2lpnTP+Vmd1QnCfywZlaEh9nks0dKHuhp8AwfcZB3FtOrIe4o/BEu4oYT9OA+uDXeYNocFYi2Kw/wgptGQ/heKfPSDOp4YPvR0OmpHZXsQH4CIZbD9m8C+AfQa2jwPBtRrzOTO1q9Q6K1nj9hAEW6f8/Jy83UJxumiTSz2WbvOYrpXKyDy5cZMovR6CBWLLj03MJtL8qcwZP+arK2Jq6//rJ9CoXuZUC8Qgo9NqKijHwAH696cjhww5XZLspuLXh9BJWc1zLQzQGdx4Rc9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hJs07yFiITPjeKTAwthm41wD0QJmAwJT9qWXhZK7Hec=;
 b=Lios7LGKiSAYmNCD/BV8n/8cfcYsT+l7N62eHcqtrEAThJ+V8iYYbItRhon7MvShDgBAalj0dEfTobBOxjpRiHlLdmH9nAYTtxiOB5ryFZBFkp8IsiWUGURN6MJT7S83RR3VPPevgN9TMTw7KH6NlDycS3tTfSqHpvZd/oE+0lcaCIyq1Kyuvonj78PUnPcNu+klkvuC8SZVqqmy0zMwNeCcLAtGMZfI/fHkjZ/hIKdCEggZ+m46KLi2BzpuiskyEziNyc/CATw82t6xPvVJ8sf7X2KoQ7ALQOs1OFSZfJXDiX3cSrPLcXtt7BqKmsbvmLwh28ndNusUdO+uCFUsJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hJs07yFiITPjeKTAwthm41wD0QJmAwJT9qWXhZK7Hec=;
 b=WQ2j2HbDWMrTzaDcMHvalgIYZZi4Vu0bsEyHTf40wI48Bnx/jR9W/uPhX4XRoWl8EuA51KWqRJPRjSFUNeGgSabTidrFQ1VQhOAFxafdTKeRV8YK61x2tt5760yAQU0/N3si2N8s0MoyJHApohcd5iEb62JSiot39lqI2tVLm3U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB12798.jpnprd01.prod.outlook.com
 (2603:1096:405:1e9::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:28:31 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:28:31 +0000
Message-ID: <87y0odza35.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 159/292] ASoC: codecs: wm8728: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:28:31 +0000
X-ClientProxiedBy: TYCP286CA0215.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::6) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB12798:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a370524-53a0-49e1-4281-08de20b93dcb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?e7sj0oTUQgvM1N/4WmqawAKzNT741b7ay8BJfTCY2NKX+/6Dovp0hOOEc2DR?=
 =?us-ascii?Q?0oiYYm6K7pSiEWbXkgi5QKWm8NwQ/fp28rcoOU82Zt1X/6tVuuOqROkTptxT?=
 =?us-ascii?Q?1kDC130YtwfcY+YKdKCFVQPBCbQPFU478t25afEFn4PJJCouh8cTOzYbwzyE?=
 =?us-ascii?Q?hVIA3aNUIuMAVVmOf37CSB5ohlBTcyDReKLOPAs89yBtOPe5p0Wn4WnJp/st?=
 =?us-ascii?Q?hQshfiyCNFSa673KrqfQGq96O+Lw5WMiQ000zwa8IaWfZRAuf4hqKNfLc8VS?=
 =?us-ascii?Q?G+R4LTxIADdUzzv1b4noqBKN3/2esooW8h3C1tG8qSV6uLcncpH7hetBTGzl?=
 =?us-ascii?Q?e9cmnR/L71tF5JPfvZaKMzpfNbxeah4uditWfI2G+vECjf+oiX50Se/Mn8Gu?=
 =?us-ascii?Q?1Gm6V0X8fQiBoHv4TvvJnSYV6ADBnzrcg9+ZVa6RoCA5jAOA7ChqEbpunyUE?=
 =?us-ascii?Q?65yzAQv3Y1DjXdIhBc5di+NkbVmYakreDPWVcfLx9xtNTbnTfapHBx2RXEMY?=
 =?us-ascii?Q?+T3+O6QFsdNThHd4ghYXGzuj/jvkO3dx4N4GSsRciMzaKwefxvY2g4fxbnrY?=
 =?us-ascii?Q?cCUG6iTcZSertQ/vAf4ZFzg90DWxXETbJL2y9RrmpjVHtDPZozrDc5zuO3xm?=
 =?us-ascii?Q?vX9y6zXGqqxo7iVs0+j12POPxAOxHJfcvlz6S7/v/7BnT8gFp9J3vIj/qbMk?=
 =?us-ascii?Q?XyaQYCN8inz+Yun0CnzDjtTiUrojjw9qWQFazZM7aga3zMjfg29jzX0hdHDU?=
 =?us-ascii?Q?Wh55UK9BYw9MR9w/Q0dj4fC9fc8kXnSBRPO9l+zgFTq5YlzAkdY+tqPn1pqc?=
 =?us-ascii?Q?k8D69ujMNdRVG2erhyuwiSLHy7KTv7shgJZhM6kM2MxMvNz7H/4ULi8OiX1L?=
 =?us-ascii?Q?82uw2mOxYTiNHCUeM6uCrq8WEvRFOsFr9Hjr+srl+eR4I+39Yhul2LQM8jBI?=
 =?us-ascii?Q?1VaWyieOEAf3BmVJrGOI7F4JjWixC32WuWz9/wlvFbKOnExOVQICq10TNJgb?=
 =?us-ascii?Q?nfMqzUbTfzhGSTrRYnjVmpvdZz3JM3HtTOfBUbYRzi1AdB3fO2Iw9BeLcjFe?=
 =?us-ascii?Q?QkWSkFsaySS3NIng3IzwZ2y/i0umadTtsgzvflZ64G7kLKRzXvVMQ9/3VAFC?=
 =?us-ascii?Q?RtJ1i/OEko3LWUSmn+RJUDyKGL6sXp+e6Dzi3ONyj3LRxrQMKjoDimznOdBC?=
 =?us-ascii?Q?siP/4g+soqmCWGgPHdRrNj08uSNOPQPc4Lrqm4Vkd1B2K1C7PjRixRDphm4L?=
 =?us-ascii?Q?S6L53CdgOp2og+PNobyC/dFdibF101q0bmCgZvj8fRDw6GLeb+y0s6p/zFws?=
 =?us-ascii?Q?K49uIXdOwAJlu4rX7sLKeluw1Mjjd8MfHYroawLFIp8GewsSV1Qr3UNRaXAn?=
 =?us-ascii?Q?9UPHH+hy1pFTIpymTc1kvFh5dlwgSYmnnS+i1H71UxEkfxI2IJr8m/wIct9P?=
 =?us-ascii?Q?mQn1MROfBxwddcXryiu3KKlZQpaohkXwF+ntsMMVlsasJSxQweH24gMqEQxT?=
 =?us-ascii?Q?bIv0Bq2k6y4tMPWzLj0Hmv+iIOe6m1604vWa?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?A2LV4x1L8DGiNdsgjnUNZ+eIcDHfTKVfLyckAZZqRnP9uFdT5Ngh/HKD2PaL?=
 =?us-ascii?Q?mU3we+hCjBff39xw8qC6XOQzgWUezhIiPg8Bpj9Li/Ep0/OnYKo/hUQHeSv2?=
 =?us-ascii?Q?DoF/DGddRmBZ0UTYy8MpYDSSqPAkeL2/uuOxcQGAUw8dVdUBG4SCUMT61/cQ?=
 =?us-ascii?Q?YXl6rbyE7ei6dUrlyBK4ioSScQDDIPyA5ruKKZpeFVCNpbzUSTK9LB7S5b2o?=
 =?us-ascii?Q?BTrHOvzee4erbftTBKLNp/ucbQ7ROZ5exLq/n0ipwidARc9ULmknBUpLXf+6?=
 =?us-ascii?Q?xKMwZ4m5zC7DeRxkqVa21EzsBWaecRWnMJt5fAdwK8P5JTN4R97XEdKyXo4V?=
 =?us-ascii?Q?PW+T7z6XmmTwFdiUuMUNvMpPQXwBhIb1SNOM9EU5QvAaLG73Iuhc5zZzqpAl?=
 =?us-ascii?Q?0tFpgMJEiiw+xzCRxu3QwXb3D5mC9mVRRBlUMIxW17Y7SGr/ce9XOPaTmXFt?=
 =?us-ascii?Q?KJZgLCZAB1Xutx6HY25neYC1NKevFVPluGEMOar1/DbQju9TvtxExXTd6kxd?=
 =?us-ascii?Q?bk6XwtIc1YxeWu/cXeFQ+vMjKPtsCk1SwWc9ItmskP448RzvcIdWLQqzJQRV?=
 =?us-ascii?Q?gz9bdlFQLUc/pbMeVNyt04hV6oXRRKqSUeZtTSPB4RMZC4sZj51mbXTzVqGJ?=
 =?us-ascii?Q?cCgKYWDg1rzZTg4ZJuT+C8adJ6q7WpQzeDxnZfKA8USVTDqaigoigt1FAmOO?=
 =?us-ascii?Q?1xltiU0Qbx4rYZNw87Wwyi31wrQmpbQmma5qgI6WYKP+pg2MdVbfCK+gse7O?=
 =?us-ascii?Q?/0Tg/d5LN05iyPw6iFAvkmD+my81VVd2vMP68LeWa8ydNUC1qDse5mTD2jb8?=
 =?us-ascii?Q?yVtyQf6PIzdssR4nhk6Xpvd6gxlld4WsPbDb/Ur+XlWFPBIkJLcCEU1nSJAQ?=
 =?us-ascii?Q?+b3Okr+FoTd8S8+FSSv3c/5aNFEVYBGnuqMvBHw6NPjCq9nDm/j2UvUz/Gwf?=
 =?us-ascii?Q?Y6aArsbm9S0dVJWDMBIqF3MWiR8sr9GxxzHDxFIDsCcACbo4v/3fODNNDf6W?=
 =?us-ascii?Q?Ki9wE3z2p6mmL6Hwp4OtU1fAg2zKvkK56B5uHY3d+1H0lwKCcUGqMgjNGLuq?=
 =?us-ascii?Q?ocVAmSrhI7uAjNMRlftfdQuXuL5zBnMt0vh+Su2VQeu5wThd09PUWSAd4LVS?=
 =?us-ascii?Q?Bp6JCNOlivo9XbS1zih5v/LW4xNvD8gFM3NN0+a3maHO/leilu6enr0pq2gN?=
 =?us-ascii?Q?yyHTIk3nOVcW5V3x0vVyHHb4D0XyTJUsQFiLXrr3LlEXckGUOTFd5DYTnSWS?=
 =?us-ascii?Q?2mmKbI9RY/NQqOcJ1+5hKpTUjB5fQppc6u/KDrZrCSq1ShcuF7BBjFq8jZkG?=
 =?us-ascii?Q?EFdz7js5lK09IaqiuHfeSQqDAKoHLn5l6lY/TTj7bg/boxCQQ7Ne7OteWtqT?=
 =?us-ascii?Q?GzTD0sElr8nBLMUcJmVW3psdFlPKaPt35ZcpZfB8DHLzBIBCa9pTSrkhGtoG?=
 =?us-ascii?Q?gor7+GjaFkLb64n/LdSHawT54ApvSD0O1onhkzNdPj+shJ/bNuzav7s3okSL?=
 =?us-ascii?Q?S6//T2/GLKlAcYDA+X0gnmEgq3YP2/YdQ1So8QxJ9kouk0b1aTCP6hx4HBrz?=
 =?us-ascii?Q?c4xYFGiB5hTAcHmnbzLnDltSUvN+5RX/sRMmEyypeogK3J7zJJlBHnmqX5ES?=
 =?us-ascii?Q?5Oa0Qklvp7pnNcHhPniEM/I=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a370524-53a0-49e1-4281-08de20b93dcb
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:28:31.2133
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QxMCeyPUn7VtYIWwN0TYPI3wD3dCZhoLQtwYjfu7KPg1ff0yFjQjyNeNEX48CpsL4/Peh9feNM72DNx1ZZkUiEMHXSHsK7q7vTJcMU9njW7/yF74VrcpZdb9bnpKhCVs
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
 sound/soc/codecs/wm8728.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8728.c b/sound/soc/codecs/wm8728.c
index ea0a588da40f3..4c1a80561f06f 100644
--- a/sound/soc/codecs/wm8728.c
+++ b/sound/soc/codecs/wm8728.c
@@ -161,13 +161,14 @@ static int wm8728_set_bias_level(struct snd_soc_component *component,
 				 enum snd_soc_bias_level level)
 {
 	struct wm8728_priv *wm8728 = snd_soc_component_get_drvdata(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	u16 reg;
 
 	switch (level) {
 	case SND_SOC_BIAS_ON:
 	case SND_SOC_BIAS_PREPARE:
 	case SND_SOC_BIAS_STANDBY:
-		if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_OFF) {
+		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_OFF) {
 			/* Power everything up... */
 			reg = snd_soc_component_read(component, WM8728_DACCTL);
 			snd_soc_component_write(component, WM8728_DACCTL, reg & ~0x4);
-- 
2.43.0

