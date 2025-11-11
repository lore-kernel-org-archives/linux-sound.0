Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011045.outbound.protection.outlook.com [52.101.125.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF2C1EA7EC
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820996; cv=fail; b=tqBhMFL/GWthrze8NSCUEWB8X+GLrtLZH91peg33i6XBaUrjcPOGvXPW4eqxbtlXXDRz8r7uNnxcJHDfQQTKYuJhDZ82S9pyiTsMcmHX2h/DNKCg1YvEHDCH1FQ8oIjl2tWiR9IYp3Yz0PW76/lb0bvKXX0YfdS0QTTHsIPQZ1A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820996; c=relaxed/simple;
	bh=0TJeeEsJinnRW/U5KDS75L6PiWnfuuyrprq+a1mHZqs=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=ZVb8yYJmd1NjjjgnSjcoQFpNZVnZpEPgIqghEGEECzLBHEpl/rZ/SjyiZ2UnMx5zrjvyJxVl4DX4JMyjGbwv0r7A6V5cijF3DT5fp3gd5JA/3INmLmEuOMBzV+Bez2CiCDwYdDom1WAzXpVJhfJRbmGLuJW5hlI0Xg5Be77XqcE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=YaARfXQ6; arc=fail smtp.client-ip=52.101.125.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="YaARfXQ6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GA5LUuMf9kcm07f1IlMzHkqDOLuWd/eVYJbSWM603DSAAi9jLg0Spj+IYjUPsqTYV+IR1duPtSAqeQabH/55W4JPKAXd64QwKsyFHOSCf5eAIuu7LdOzEJdKGyRHrrUeWRLfZHdkE1NSNN/13jx1Z0VwrVe9GRrnYxeF7TP6Jd82zNn4SadnXNyI93xU1MTJVTf7Jph4QDy9tmxc25QeuKf3wWFuNKimdWKc1SdcZBwMtu4Nxe75aA/Z2sOoQ38J7IilzoWV+0I/4occ2ucjohxnlAIeA8hY46N10veoAjc60rX6mhjcbGo0Qo3Syfi2DtzZqcDieWTh09rvgnuqww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7ZU6bAu1TLqrQ/urGIpbnYIMVlmfr+liw9Pn7HIxNCI=;
 b=Rm8ZPm6Qn2Gtzcz6+8rOmz0GuiSw8WTNZOjz46koIexcntC0xcJFTfcO1au/jSk3/C95VWRjXPjxUn1fOB6LkB9cv6W1jgHz5fA4WYUoXqxZZ7735dhwCRQ2TP38gv7QyqyZ40rkPaR5NFAo1SJYeMLa/QBLBp4scRoqO4zlBhCrOp7nOFGNcsJ5C7HrGtx1WGOCjN+1W6NSbNfNGkQbUJkh7H/45tNAxpHgPSbQlzrKuLfJNSM5u9KEdP55C4eX3SJ9GZl5/sEqVN/4U6H8VELUkJLOrPLqimHLxEwhGEWPWra9ssaLM2sRgi7+IpWMjAZ5es4N2LGLUbaQa3R/wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ZU6bAu1TLqrQ/urGIpbnYIMVlmfr+liw9Pn7HIxNCI=;
 b=YaARfXQ6B2XlBD2OaGrz76+jkoRR5fNuoufSZjQP3WNvg8myovEGcJXIh2fCKBmF5B7Sf6UrhQbzNzTQSiG6NoXgNdrHVX5qFcbdGC5vgSKXYEp5AJEhK3IjrCEirWxgy5KybB5+IeSVpyLA56jTUndye+WNjoknhQNAWUB8kmk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYYPR01MB16440.jpnprd01.prod.outlook.com
 (2603:1096:405:147::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.11; Tue, 11 Nov
 2025 00:29:52 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:29:52 +0000
Message-ID: <871pm5za0w.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 182/292] ASoC: codecs: wm8991: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:29:52 +0000
X-ClientProxiedBy: TYCPR01CA0175.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::15) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYYPR01MB16440:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bca693d-8466-43f4-a3c9-08de20b96e36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+y3LBqIf6QVzBFrVrPUdlm7OMFSSJknl9gG0o1ItEuLb44NzP6k/5zZtsNXm?=
 =?us-ascii?Q?D3//wmODvSwuc3OzhAZ3/1YGv0/NW/z9juuqA5r3kiHdm0lHZZqUksAWWUUm?=
 =?us-ascii?Q?CHGOoI9rSgz64Ft/WAQn21X2irWspwYrNxkLeeUfAUtLVLJUSsqcby6+GkPa?=
 =?us-ascii?Q?Va7AAjMl5Th6o0Ahv9y6lX0o8IUa54XSvFATFOMKCHt8fKLB3Z4BDBVAtdVY?=
 =?us-ascii?Q?HKICVXXWSpMUg/p/rq9p6B8bm0sz2AwwgFz9I3V6EqrDrL87WmTvK2EQPRby?=
 =?us-ascii?Q?2J/BKGofojsOuZ8tMK+auQH8cVyYg9B3fllKE0Mr24ugB5UDHWHkMz5bbFOn?=
 =?us-ascii?Q?PBsmE2LU8ss41Gj6ewyGDKbaE7xrqshok6x5vs/OG4rnfbtCUsW+gRcws0Y9?=
 =?us-ascii?Q?vAJ+/5z3a4G0QTAl3cvF8cG879GnWplN4VzQ8Fhe0yGAi9M1Hedif15fuqNM?=
 =?us-ascii?Q?JM5gosobykRL/ilLiZCsWkoDK5zTpKj3v/W6JW8Thop3YVA1Sox4UXQgJ/Q2?=
 =?us-ascii?Q?0Opn7Nz4ccfNCSJnoYsT7GmQXL0V04j2wUMvqRceHBO6CX7jwUs8TdcYE4uq?=
 =?us-ascii?Q?x2jTl67fwIErcQEMDQ9idVROnQ/n9oH9Knf0EU8Ow/lylPTussu7v2NQ7UpN?=
 =?us-ascii?Q?f/1b7gocOQ8rUpms4as6xRxz79VE0BkmuNYUiUchbK6Nt32KhVDdvzGoeFG6?=
 =?us-ascii?Q?803HPOvEahgK9k5UqvmYlDcwqHyJNspKzveX77829RawkQy4z66g6+1gHG7h?=
 =?us-ascii?Q?PjVt5jzOcaG4JUpIjQLrCFf4mNUycw18baLgWh7WtJIiYEsfS4jKIBuO3WuW?=
 =?us-ascii?Q?6jEu2TTe/c/CM1rjLVANAg/WsmXRx5WpduZaa9vsHPhf/ywdFulHuACbaIf8?=
 =?us-ascii?Q?Oyxsf0ez5iA2Biuv/24Z+DPxzzE+xrXnwxEZI98oye4Yfvp7PE23eUpzxvfd?=
 =?us-ascii?Q?Cf0fr6T7DMp8WL4OUNIDjPt9Nlx4EhCKJP/Ma0w0+OfCWTjewX9KZFVvTPjp?=
 =?us-ascii?Q?81+N+Y/1z3y0gL3dhIUBaXsPZ+ZHjJ70MefAojdgOba0NigCH9K+mpi+Ybm4?=
 =?us-ascii?Q?K0cu6h5wXNQQxoBPNOcjNrwrdsesW4+lo20SIamjxY3bYREs7KwQYfTyrJTz?=
 =?us-ascii?Q?9UEBCu8/WXP4lB8ht2OndlhecOEunZCAbGdI5RKcyhWlt5Sn1UHatpG9QvEf?=
 =?us-ascii?Q?yIrbc+ulXo6qrzRHX6VeavpiB/yS+iwbyMaTDJLpIvnKy7j8zd75R8o8/fJ7?=
 =?us-ascii?Q?jseOnlAKM5lP3uQQwyZJ7kCnKVlhaLgX8uclUVkXfUMZso4rKhbKcm9RqV98?=
 =?us-ascii?Q?gAF/HVhahyqPhMAZMszwdECMMKw0eKfNsDGnWMfZ3KwJ5X/Q4CO1HYNe46gD?=
 =?us-ascii?Q?Cz+oo2I4UCESvnZhsh/1alIbRVT6qiLuZ/EGC7UJHMng0jotcAAGBkuBzty4?=
 =?us-ascii?Q?wjThp+yWly0ufIjE9eBooVqTmxAfqtJ0b+S0Gfk24UwHsrWjyZEAlGszmhtd?=
 =?us-ascii?Q?VxJzhViJ5L++sezlP4miJotKzvDizL9irtfp?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XGj3TIXacVNV/fEqdXJfHfodLVcIjtH7eH05NDtE/miZxwMTq3iBsVdLVAyv?=
 =?us-ascii?Q?bPeRMNC9Vs1jAS6S9N+gImaHwtPcMa4+feGuK5S7aIM1MVGWOmCGz7NtPEV9?=
 =?us-ascii?Q?jdAJJr6hbhks6ihfW6Y43QVZ+seDXMvWMzORpglwJH/Tuut0UXwWT2qETw8F?=
 =?us-ascii?Q?GEqCURPxTUpKpG8CdtAa3HRFnbCecQPVTqtcP2tkZl1bEdQEweG4zL11b0ai?=
 =?us-ascii?Q?D9q50fxDXztIEgMa/G/q2ygWRpOK/qeSao9/KQmtRf38VXvu6i8tdHjcA1e3?=
 =?us-ascii?Q?helba2P3NKaMcQMzi1RbCAymepltIYJ22TSfDouj7Sm2Usil8GenbXQcXT2U?=
 =?us-ascii?Q?aFDU4aZxA5u0XU0ovYUU/88QkXiht2Hv+UF9iSU0lqgGF4o2lmTDwrxvyAKN?=
 =?us-ascii?Q?JqC3hhVpYnWCJxBeQ3tg0XW7Gpx2dJe5AEG9v69kYs4yJlzKGuO/iE8IovfC?=
 =?us-ascii?Q?IdDBuwRtG6qWXh8kX9zkpEFAMAfn15hrUaGszeQX1Dju+S0PaoniJCi8mYqW?=
 =?us-ascii?Q?YiT2Wo7q10Nf9gJ2tTYuL2j6vWeyfDZUXexH1L5X495JJcEn6n309SHK3/Rv?=
 =?us-ascii?Q?qVRBsO0Y94jrU2354ZkmZj6badbE2MPRlOXpDsTKOLNdI8nT7lqVVTEEmBAq?=
 =?us-ascii?Q?tKiYlaBR7s8BobK7gOuOQTv3KOnP+3R/rJqY4NjU7vhGldedIJIfjiFI2mjH?=
 =?us-ascii?Q?uZkrjfBgV0RY83iWnN2sCvAycAYLc+WrIEA3R3i27Mu9MI3t7oA+sw4HngcS?=
 =?us-ascii?Q?IrpqOb+t2w8kfrjOEANzYma7WGoCe9McqfwL3+GN9YVj1cUJ0WMioghPNoR0?=
 =?us-ascii?Q?pURSvw2d8CoUY98UmJqDQyi2jEyLLeEvNVQP4NCu34VjgYd12sGThYAyyBXg?=
 =?us-ascii?Q?nhztfLYOsKMW6NEvBLVnNQWLhKBjOaRfMsfuGJkKXi3bwdXVDkSU/8nUzOjq?=
 =?us-ascii?Q?2SR3+ygfmEbyYMGetllYa2Cy/3HIOtL8rKa2NhrrhG/0zHaRCNjg7Uuoz+5M?=
 =?us-ascii?Q?bpKay7KOTy+wR/ZYgKtOBR2j6fVmas85Jmw7J83lcDuA6CLCxx2K+RHcH2UA?=
 =?us-ascii?Q?8h/kuEC0y+LF1yuhrsgyIf4DYGgJfrqz+PVmgJAdJWhRqji1J8r08xVuPxJW?=
 =?us-ascii?Q?pZz3wvUSoQUW4YPpsaVhrUvtwr+CgYj9Z9Ch7msyvJ1j74xWcbLu4OJ6cOzh?=
 =?us-ascii?Q?XLQgcJGrLBk8L1M+xlt8hLwlgn8IQDebX6iKhfhH8B/70A+Le9DGFuzLMSIx?=
 =?us-ascii?Q?mBUyA5npPs0A7OnYMkKZeCshtEmc3GHWkwZ1UWf7GpFnsb9RQaxmFIQbTkmU?=
 =?us-ascii?Q?U7Z6/iOcXEbic35c0o11Uzv+DZ8c6la22+eTZF05TyaYVCEGLBsWhHTa6mSG?=
 =?us-ascii?Q?3gD4cOkEPbQgg2+fU0jyThPKe24760EvQrbtxpU0hiov4zcuWJo+yhAq9Utq?=
 =?us-ascii?Q?MojnRnF1jmKtT/i0Nj3d5t1auwJSHwWEey0EVwDWZ3QuVM0DsuQVhKdgRSaN?=
 =?us-ascii?Q?JZP1oJ2a3oFVk0BNw5lDDKONasmkyzQbZar1ysKElUGpMg3FoHm9RcRmksE5?=
 =?us-ascii?Q?KVLDS3R1aPodbHb3VhKyITz/D0UTpepsV7ycwjJ0L/dgXc5dBpm/1DhpFEcw?=
 =?us-ascii?Q?xHYmnqNEVQRHNEAbTYIgF2g=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bca693d-8466-43f4-a3c9-08de20b96e36
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:29:52.4732
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PlVh62zqekc5JvLieroH7sEVOpjBhfHrUIKetZdZnFFDgLwdzKf6vbGcamdNELQI4HKOxlPj5LGafXEuXSI7PvveIW32ajSKE0xok/5ZtsJoZrxqAz3or39xL+gs5QkY
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
 sound/soc/codecs/wm8991.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8991.c b/sound/soc/codecs/wm8991.c
index 0ab0a50340b1d..b8ed2a3e699b1 100644
--- a/sound/soc/codecs/wm8991.c
+++ b/sound/soc/codecs/wm8991.c
@@ -1081,6 +1081,7 @@ static int wm8991_set_bias_level(struct snd_soc_component *component,
 				 enum snd_soc_bias_level level)
 {
 	struct wm8991_priv *wm8991 = snd_soc_component_get_drvdata(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	u16 val;
 
 	switch (level) {
@@ -1095,7 +1096,7 @@ static int wm8991_set_bias_level(struct snd_soc_component *component,
 		break;
 
 	case SND_SOC_BIAS_STANDBY:
-		if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_OFF) {
+		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_OFF) {
 			regcache_sync(wm8991->regmap);
 			/* Enable all output discharge bits */
 			snd_soc_component_write(component, WM8991_ANTIPOP1, WM8991_DIS_LLINE |
-- 
2.43.0

