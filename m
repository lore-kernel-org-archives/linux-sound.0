Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011036.outbound.protection.outlook.com [52.101.125.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86AB61E3DDB
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820955; cv=fail; b=GEZ/w2sapUzaKb4h5qnd6dOw170/WPsB27RfqngXZy6Anx1yO0bqn9JObAvua2ievStAnuMpl3DyL4JWkyZeuNVVSs5gP2ocME8LDFL5z67NhYQ7BPIOM0p40SAoDlVohADFdcZMgKbXVdTxmTVSnReEszV8N85w4DXeq5rJM04=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820955; c=relaxed/simple;
	bh=6FzJWp4JplLUjWKIDaGO1Vl/XjkDrjJptgL0S/CIBfs=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=lZ0QlAPl80qdIqWk0HtSbdQxk6rvdtgMFiY8DmKJBSXMb0ZsCLgelOsiVWkeYsE0MGEGOc/XOCQoPQ5b///AjXHLE4EaCqzM8xY8dnjyThsCQbhn7sU7Ywt3iQ/WFCKaHOID0KW2z1NL+XBw7EWiDqDpoGiXP15n1XoZiwq7J8k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=VwlaIRJq; arc=fail smtp.client-ip=52.101.125.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="VwlaIRJq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gMpcPzM0iPvw4bsk4rAd64xhARWFWtqrOTiwje7kE1ij9o4zbrGUCJKFkHfSLdd6aRC9QYlgdSVXLJLGNA0WsgG++vTSZAgJdc1bSsulBjk3haxACxe7QYhXBHRW0dSwPAlkya0ItLBtd7eLo7iAj/PYEZN1adcql3LeMDZwrvAJyPNcH8es/0EUTyFTzxdkjAncOi6NAAKlX6/KvVm1JyVL1nyqnXvzWDLIeRXtb42LFkHnO/uc3+IKOvV2uz9Tni74OZzTa9sDOOZtvpFYYNCEGBbgEpPsKc5vGu9dnQTHUgjBCx9bWu9DBz9xoJOKALf45eHKY3V9d1qF6SzNkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aFqvYGCiqnnTYrqIupwbQebkgaDfpxwJPy1n1mCIzIU=;
 b=pxvx+otQs86mqk/no0DKrK56rRUs4E+AlP0jqRbv0YLG/we62sxDaWghvzi1F/Nc2dpeoVdKwgz9DbIp3CALQufhbuPRER1w6fiOcoybLTxJy8GEVjyRTPr7m37bFhD0ekBrtkRByCGA4w3E1/mF4kmmObAJMk+0v098g9xs/8fUItKnhWJBJEz9rABCL5FxJbV7gb2QclSqTRBOUURuknR4MvD4t/+m1ukHgOrx6rTd4CW/BS+yPbk5fo53/3nTvw3OGPrt1WRDXkypeo4WQFAWHUjZJ+8B1fb6aHMPXRAZUtrW9IWGiohCKb1ndqn597fYQXtMUS/OWM8ccGnSYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aFqvYGCiqnnTYrqIupwbQebkgaDfpxwJPy1n1mCIzIU=;
 b=VwlaIRJqzbjyuQEA9CSm2WK6NmQWqBZbopMhZfGuKm/X4nsWBUFQVEI+SWs9N+8StHrtabVI3zYPSo0QPZaEoU34qA/A1Qg9XQdrpyPgAQ4LVwoLT50vWt9qL1rHVLRa9tFzSSJvDlY3x6PTzfJcw/Qh8RMFVBfxCweEPaRdCeQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB11220.jpnprd01.prod.outlook.com
 (2603:1096:400:3d2::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:29:11 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:29:11 +0000
Message-ID: <87ikfhza20.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 170/292] ASoC: codecs: wm8940: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:29:11 +0000
X-ClientProxiedBy: TY4P301CA0031.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:2be::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB11220:EE_
X-MS-Office365-Filtering-Correlation-Id: cd3ed9cd-626d-4f99-3f45-08de20b955d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iuPUNVAKw+4tgwnYjgZ0JK0Stqbtgp2sUe2fSEYIyVLxKOzo6adru8EsPF48?=
 =?us-ascii?Q?3nfqJGhQxTZarFc+bEwV+xBnVLY26oL4yKH07cCAqshwlv946+S6l5LyXgpu?=
 =?us-ascii?Q?FvTLVUljBvvLuhzBAiyUmDMmXsXSYDTfbsAwitXlUSSWTMiD1WmEK6PkPJ14?=
 =?us-ascii?Q?pWgrhaFmf6Apl/KJX5v4auIMLSfWS083mDyluThVyb5nmZRElar5qXRl1YOf?=
 =?us-ascii?Q?2vhc0dm1E7I7Ox/BSGEkBUgyRUUourX4nUKhf+apAOta+rIod1c4xLgtW9yY?=
 =?us-ascii?Q?i3NTkojaicPy+qlmEuGBcBVxpuKfhjypIfhBfbdyZF/anoKsvAPs7yyN9iUp?=
 =?us-ascii?Q?UATYa/YHRRo9sSmL+orR4+0HpriI1G98vNz6TXqOJmuzqg7aUd99qbSL6saJ?=
 =?us-ascii?Q?eDAwZ2Bf/BK2cA8zORvhAfJhGnYhukKHz8xHTcLWcJnkf3fnPvvllrkfeTrK?=
 =?us-ascii?Q?pJhAN5vXyiufiRi7mPjBQkUAa7Nra2bwaaOKqPUyErENZzUlIqAwBiF6K3nd?=
 =?us-ascii?Q?WDtTQKBmOt//bSlflLe1Yc2a4saa04Wnk8uTdl0OjZZDSJ0WEGy6CA1KHSeM?=
 =?us-ascii?Q?VfdZjN6S9w4qCV3VP9J0x7ZRyiM2XOnow8svd1TdXDC6uxT+Uker7223T2Z9?=
 =?us-ascii?Q?YHlyhdCMkkd5FzedxZdQET0lnbf5Hd+byWz33G12Df80of+jFAmaB/NZV1Oc?=
 =?us-ascii?Q?hiKdHJAb58VqVDrM1d0NJN1P2uYEIvu8WYejkSV3cN2G3n0eqxqvW+SxFByu?=
 =?us-ascii?Q?/j9Vc3jF8Wc032TX8OC/RulQIxG2GCnnUcdJSqVBDGxm04o6K1SJOn8yLE0o?=
 =?us-ascii?Q?93owVCCyYnt+zH9C2Vo+SY4X4dV3g7Aq6g1KLyYI3N/VfVChNyp9kMYsknHn?=
 =?us-ascii?Q?P7p+gGx0FMLwNWGAQz3FWhN/9nb/E1/bZsZXTUUkw0R8qXPzeysOu3P9lOdw?=
 =?us-ascii?Q?RAi2HJAMcs64rj9Cyvsu9fnI7RIgY0RgXsC3gwzYbVjI+UdZV5lvDXaYKYZh?=
 =?us-ascii?Q?P+EuJNd/zq28xlcZQndHb8nFiJslXWaLqYWSneFO5PZ7kZ9VYmiusbAEuYBt?=
 =?us-ascii?Q?aX7fWhI4/VLMUjFBDHJ4B4BMgxJMbU+EOaIWPy4trzdu/EGYv3zefHUknu9k?=
 =?us-ascii?Q?qaP4pb8AI26r806qmmKjAozPuz5R4TNvCY2evU8NwGHZM78xYf1TnPP6tR3z?=
 =?us-ascii?Q?cNTU6ruSdA8AlLJ3td8RrlQfyclROvGUrSoRd8YL7OzhJqS6QU8RYQQa7kPc?=
 =?us-ascii?Q?MelMsvpI+h7i2d1l/f3RyKmH+QDQzlwILUprh2gr1Tln3z8uBI1elOhJZ9IK?=
 =?us-ascii?Q?1SLitep1XUrhLjuYH0G8Fba5WxZDlb5h5sxBaQgIeZXDed6fmrFtIUKjW5aD?=
 =?us-ascii?Q?K6pqSKEChgSOZeORlJH1RLxCossbagyn2yZBIxwzgxSJqsJVoAHUnWAjqO76?=
 =?us-ascii?Q?uqzn+OPtgsZ0xD8IbPgV/kKReV6nvGgZBAP8mrsb/MBEpeYHZMp3RTLfdmV1?=
 =?us-ascii?Q?lTsex+Pzjnm0xGp9TOqwIsOOhL6O0jHKnOKU?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pF7TrpcXxRT7KQg4/cRuYBQW6J/50Xlq3jjHiDjYbZD+Xk84xvSx1DyhGG7n?=
 =?us-ascii?Q?IIH6kul+s3NVSFf6dzSaYn5LjAaEAG0C1bh2qo7QXluPHNf6e/UIqv3HUGNp?=
 =?us-ascii?Q?lpoBKayvkxl1MQKOzI//7+tLZUgNsV+dMrHSt1dq6jigW++l3hJ0BOKADbGT?=
 =?us-ascii?Q?BafJGTxQZYB62qyrLK0kFCTqfn+Z6maoxmQJHGA5ybs2GWVvHSknp46W6q5c?=
 =?us-ascii?Q?JPWr3qhGYIYT7VJejqKmW5klX6xUe5cQYG3zyUp1+y6XRsxDHNYrPlmO5Tja?=
 =?us-ascii?Q?qj/CU8RryaRtroovQ8UPa+ZMMNRjClsrglb+wOr6EnohKO+Qt88Iqj+hItKT?=
 =?us-ascii?Q?tlStTqr5Zp5Q8bWemwOWsoK3fqbdOQNyRPuycgJwgdQVp9mNeXwJgtIZhilt?=
 =?us-ascii?Q?Z3EHvH9lOqh0w3w+LdS0PdgBGP43Zh32RKMu6qXPbfno+Vq3Mvt7BkWBVC3w?=
 =?us-ascii?Q?Yjv+W0PJg7DpOn0PIkv4QqGZi6ehEiCQtDYLArPQAqs1fPYNT/wtrnsU5myt?=
 =?us-ascii?Q?8tIvS3AzFIAbrJX7d8qkF7GFu6p2ev5ZkkIhCyswuQvFMRtUI4gTbcn1uetd?=
 =?us-ascii?Q?xo6GchLWiCC/q/dVWki3hyd0vtlFDCsGIJOgj31cDdBQEyFH6EJZTtjdxpmf?=
 =?us-ascii?Q?fUdItcJ+egz4tH/YHz2qUbS76rASWMsCPc8dS0MIAAnjxCVvf7YFdQ45dgdN?=
 =?us-ascii?Q?V8zd8ldYV527KXHYHAznbIuJFPHBaNYrqvE0BFeI/kX7l8UprPyjktXoLfKK?=
 =?us-ascii?Q?wAWrqmBby2VA92MVo0PfdGTKIL4xN9VqG6aStOR23sdf8m7fZRfgPdu9rh0k?=
 =?us-ascii?Q?8ZRe5LkM59NA8QxBPFCxdmFsyhCh/2XYh+YR5LAmps7ZuiubOZg8pjum78n2?=
 =?us-ascii?Q?NEwVw0HrpVcrQ8kqwxuA8x3YazPmCCeBJo7yMNUvxqzLL1BML94fZF4zaDmP?=
 =?us-ascii?Q?RyeoZahlkYaGdBqGRXdRo7ptV4bd1zedPvI7Gk/VHVkuZwObAywwmej9a8nQ?=
 =?us-ascii?Q?iaEndz9Zj96yfXfjFF18lwJbyWnQCtqqEWSa8BuV+0iBcEhq1/2afUHtRCHy?=
 =?us-ascii?Q?7+hJfYxYVDb5Pi4r9xSPvVAjDMqb/13vckg05zxQpN4VWpvuYhjagfcbAaYa?=
 =?us-ascii?Q?jjdbOaomtLXWfFStIVfQZzMqVo5vlr5XfXAlF84nHXS6RS9ctVWlpFsj0eaB?=
 =?us-ascii?Q?UgyXPIYjIOZpwG9SL/FtIZ/DTZgwjK8AxEpGpdHufzFr0h0jc35Omim2taFd?=
 =?us-ascii?Q?NEdRA4mgs6ff8VaLvoz+Ev/+HnULVWH5vPpa2aMPBpOMiXBzuccUCgY4/kmQ?=
 =?us-ascii?Q?+W7c6NlQw72ORFb0MUUBn47z+Tlupti95D2PvUx6QjY8hn601ibNxYGDR++z?=
 =?us-ascii?Q?G3DC7BXsN/y+lMnX07oYPIkjdmm4QcSm6m3NSZthqz09xdq635idGBvHDOoE?=
 =?us-ascii?Q?uwg1mCuYix+YG4JymfebWPtI9g0LFpjx+FcVQHwrm2QLqWcUPCxqdm/+aX3M?=
 =?us-ascii?Q?VH7TBf+VKGZcXfsZB0Ig7TNAoOur7FyUboXn/Mv9VdG5RT1gwMMh4fOGeeSt?=
 =?us-ascii?Q?4IXPCsjz573aCh+XmBEiSvvzHatcEPJtmoa8eHiOygoypChTDD+RYD4AlkM8?=
 =?us-ascii?Q?riO+br8FjTI0Ar2DjoNxcGI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd3ed9cd-626d-4f99-3f45-08de20b955d0
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:29:11.5082
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BovkNxxPYprkTe9Hha+KnnjIQ+MzZ08DkFMuiXgaEz1sEBlqBykQ4ZSgStT1IIynNQzLFROfqDKZ+kqUwS4VMWhwEGg/QdPMSqnc/24lHJ0Zj/eRW+zVXLbHzMClePlB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11220

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
 sound/soc/codecs/wm8940.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wm8940.c b/sound/soc/codecs/wm8940.c
index 94873ea630146..2f55d0c572a4f 100644
--- a/sound/soc/codecs/wm8940.c
+++ b/sound/soc/codecs/wm8940.c
@@ -476,6 +476,7 @@ static int wm8940_set_bias_level(struct snd_soc_component *component,
 				 enum snd_soc_bias_level level)
 {
 	struct wm8940_priv *wm8940 = snd_soc_component_get_drvdata(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	u16 val;
 	u16 pwr_reg = snd_soc_component_read(component, WM8940_POWER1) & 0x1F0;
 	int ret = 0;
@@ -498,7 +499,7 @@ static int wm8940_set_bias_level(struct snd_soc_component *component,
 		ret = snd_soc_component_write(component, WM8940_POWER1, pwr_reg | 0x1);
 		break;
 	case SND_SOC_BIAS_STANDBY:
-		if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_OFF) {
+		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_OFF) {
 			ret = regcache_sync(wm8940->regmap);
 			if (ret < 0) {
 				dev_err(component->dev, "Failed to sync cache: %d\n", ret);
@@ -761,6 +762,7 @@ static struct snd_soc_dai_driver wm8940_dai = {
 
 static int wm8940_probe(struct snd_soc_component *component)
 {
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct wm8940_setup_data *pdata = component->dev->platform_data;
 	int ret;
 	u16 reg;
@@ -782,7 +784,7 @@ static int wm8940_probe(struct snd_soc_component *component)
 		return ret;
 	}
 
-	snd_soc_component_force_bias_level(component, SND_SOC_BIAS_STANDBY);
+	snd_soc_dapm_force_bias_level(dapm, SND_SOC_BIAS_STANDBY);
 
 	ret = snd_soc_component_write(component, WM8940_POWER1, 0x180);
 	if (ret < 0)
-- 
2.43.0

