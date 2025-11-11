Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010038.outbound.protection.outlook.com [52.101.228.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DC7317A2EA
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820540; cv=fail; b=I+k+nmHXXx3sVob6Yc9jIau5fSPFMpuUuWjNlXs1MzJ8baUXwRV1Ska3VST3myHE4wrwE6eyDCij7SsYYntx/GuqM/zKb/nep6UB3KL9dnq61V8BH51l0tgvRiint4sh+oLV6OPL2TKB0X7sEb+WGvkMGtIb10MtX4XL/rLoSEc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820540; c=relaxed/simple;
	bh=Sg2cAAnpojax48it1hAEIck8oAvFAztCXFi4t9J3O+A=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=i3Jb+C5GfRzlGr9JSXSgK5/lk6w+xDV2mNTkho116qjI07RI0fUR8Ay3OgIr140h7hgsixAiabyPEs1t6ku9L0LajAYJ0ULL+/Pr9gSpimQ2AqzMSZ3AnMVBeenxl27bagl2mzveC0ptn4CQP1uiqUH5OhWAAjPby8oW9ohxRxU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=YyZiwLCz; arc=fail smtp.client-ip=52.101.228.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="YyZiwLCz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZteDTHGcUemEukB4uocvPvPgOKvT+lX5sgScac+hu50DdsNN0bN6V7Ljd+MSyM+B2Xcngp7fHgMFkIDtHuB5x/Ck79DpjXjUVm815z26GcJOtkllExJIAP+tAolCNjGRoaMlU22RcDA3qWIV1oH67RP2FCnvPWjY1vvTdcUbU68XX2WCTjIJeJAfsaWIMLQX8h3SEz16v/Neq5OMmUviBKu/r9YT0hv6xXtmEP6IEnzhJLVNDW00Pi+noXSrrMGECQ+aboGDW8CdWsEI91fWXp/LkUI3YIihJF/BcU3ulB5ftV/5vUQoUS7eb2i98eHmjf6itoZaVw4dI89Ph0aENA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lhsIRUAk/awg2B44lCADuoLA2uFMEB3p1G0wH4rsGIY=;
 b=y616aXodZ5iFz4hbR6fXN4KxeKhHgwGftrhezlRg2a95FRY+l/Doj4NYQdpFmhoLymtTNeEQp2hLASsy6QgEdPLStyCGvc9sZk0yLFfVFIUhmAcWEQL+Bd1qpxRAWzLU9WWLrbs0bKNG/1Kle+ATZOAqClINvNE90LOeBdhe/wn/mxBIBAY6i+IR3JPMHl9pf3tL2ysIm6uGpjppeyNkzKXoYG92nLvDX1ASTJ6O09e/mEpLo4L/r7Fk0OvNZO2KwSqQNGp+835/jupGO5fJz2sHm4BMYrK1AlS7ItqaxZw8pG6WHnMIiOP79c7b355pBMhIBYYlN7onO4/BtFAhBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lhsIRUAk/awg2B44lCADuoLA2uFMEB3p1G0wH4rsGIY=;
 b=YyZiwLCzw8p0QVFTgCKFwfwcW/DyKH2Dq1nOMO2QFo9uO5AvIEkAM6SBBM8GW0luwoXMvVspLh2E/yRPquPTJ0o/Ae7RzLz/CcAqhfwE8QsAEE3AgeK0PqAUI85hQxbZh1pVHzvP95Drl+Mjf+GcO5hwpMZQ7/+6XiXP5Vfp0L0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSCPR01MB12802.jpnprd01.prod.outlook.com
 (2603:1096:604:33d::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:22:15 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:22:15 +0000
Message-ID: <87tsz15sg8.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 062/292] ASoC: codecs: es8316: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:22:15 +0000
X-ClientProxiedBy: TYCP286CA0259.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::7) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSCPR01MB12802:EE_
X-MS-Office365-Filtering-Correlation-Id: cac265e2-5ed5-4372-f9d7-08de20b85de5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bNYBKNsRYOtp9tFnUpalOOz8Xh63B+W2gxZyt5J36te+6I5Hy4yOe02TWbSj?=
 =?us-ascii?Q?yhNhR41jhxLN0Is0I+hEPLKjfgxhdX4+wlJ80KSMWRqAZegGGW6o3rT03LhO?=
 =?us-ascii?Q?iDLrWDcPBZkDhxE59gzrQu/o2/BWKFz/sPANSNBXp8HdP+jRGSARRQFv3uDd?=
 =?us-ascii?Q?UYkaC9jfv5gMv+MTi/RHx/N5gi/Mr5AmGNjgrGKgjzkwVySQDz/uzgeYq7LB?=
 =?us-ascii?Q?eBT5bG1bMbGf8gc1v3QER0t3jIek9JdlgFxOSFK1dyN92lTbSIWv38z3xLzz?=
 =?us-ascii?Q?4p7nKJWDg0uAGcq5NBpQ7EjAMfQ5v2LdMBPEpG0kFBUYE/bdjAo+dcPi4A3A?=
 =?us-ascii?Q?WRFp+tW7hgQgus7EmdmF6Op+RMHdKkgXBFsTQjMiRUAImzrtMp2/i1f/B2TM?=
 =?us-ascii?Q?TFsv39Bu5SwprsKFu9uZ741NDi1rr05IQadcBhc4qy6qform0Cmk9GgeE92G?=
 =?us-ascii?Q?lgP/S/p14i0O8iu4Sk32nTdFVcUV+JXMit+2fVyQtZ3WqsJrcfBiOcnLlV0g?=
 =?us-ascii?Q?UMBM3HkyzQdCxtilAzd06nq1DYqysAf2eeZw9UXRm0jmyN3WvN07XBzSkdX7?=
 =?us-ascii?Q?mIJNUilC5XYleEDH+guZIGPJYGW9JxejwzDeLWAv7M6qiPnJFbGGPyGmEPzf?=
 =?us-ascii?Q?bjPl3tXUf2HoR9uDnvBL6Pr2CO6emwsk8pxAdtBpJUl3Z7S7Y532T6Wx+cqV?=
 =?us-ascii?Q?XvngG4qf+wJxh/a6WlsMYuVe2IGXYRJME9iseqwtsYXdudaRbOdYh104k8Vf?=
 =?us-ascii?Q?CE++r2rpYolLB7nK/taggDpEQOxRS53Otg3LTGL+nAUkhOwklbhSgXBBsR+M?=
 =?us-ascii?Q?+8fJk7VD8ee2rEx+sPsaxYCWm/1fuXS1WNJ0kCSK4gLYzIDl4/5YHuy2ZXt3?=
 =?us-ascii?Q?K3J4/1TU26L3X9ec5jO/Rryh3Zk281f2KICSIWlMnzRwx7Z/sX2oy8XuqEvp?=
 =?us-ascii?Q?f6nbkVKJB51hMH3BAxXax+1UsuwiW9TILJWCdpJnbH6v7XZeJuwfhQWEhn+a?=
 =?us-ascii?Q?vesfC9sSx9ey3vQ4w22L2DzjBJflITd+ss9Z+WckRJRjrvHbgjvuEunK20pP?=
 =?us-ascii?Q?0CInre/jZfgSyaOtWyvSqQuNf1W0P+UJPznBxEfPAq+9DmGa6TRJrKxSUqtv?=
 =?us-ascii?Q?u7eeF57BTdNim8K9o03jNu5NJXgCeIfmSmqIzulfnf6OqYa5hHiFsjtkN4bk?=
 =?us-ascii?Q?f3Q6KMqC6tn0/WGgQilAEDScPRjPqH8SnhABQuybhlLomboX6KcRRS5KmHfg?=
 =?us-ascii?Q?uWEo+yxlaBnMHVvc0X46aVzHeVRI0BR3vDB1a07+hoCO7mSNahWzoaKk41Ia?=
 =?us-ascii?Q?sAzLe8G37ojYwlTgIedL6rlnzqCmaY8oJXKs9pGiykUcSWHSpLnRjITpVgOv?=
 =?us-ascii?Q?aTdv7z6rqqz+ysOFPRn2fS/gqddSGH9HxohUbf/gss7CEpDihfpzXCzvd2xf?=
 =?us-ascii?Q?c7HBeA0Z5/wEJeRxPU3OTG6A2p8EvPPFzFrjVT231Eqofp2OFo5HD2nJDj2g?=
 =?us-ascii?Q?kmnhngFpGAU6wHZ1tU58QdsJLayGsmxmiPzl?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rde30ADn4X+pGpJWWWlkLkiBSyZAMATrfrQBaKIU9M4xgNtmpitBrEEbB2VB?=
 =?us-ascii?Q?pY5TUqxIK13ibZTudmGCcwyl7z79nOj2yJcWGbX6tVd1IfpZ9ud3Tui/To8x?=
 =?us-ascii?Q?S4MAQJgY7TvdizTwwkevoYDMaD7Nd7GyLmBBo1gBIoqKujClKRckvlDB9H8n?=
 =?us-ascii?Q?Yv0thfpXvmQ5bXdRP3DQvpf2qaYV/ncpTTFDzr6CKmaohhvH8renxnZNJvBJ?=
 =?us-ascii?Q?BgW9VtnKCcGwgroEkbukrJ3TFZyU759Bzulw55+9PpmCko+EK5lOi6vY9cZr?=
 =?us-ascii?Q?9uqF6YCilqJsgwnxvw18VZBLuEtZa8YR12BHrfZc87y3T2dYi4wJs6NlRfYK?=
 =?us-ascii?Q?8YN8h7OE6EaD+4fh1bmVsF345t+7XSagGWaSHle8WFoJ7Ej0hp54XVK18ABZ?=
 =?us-ascii?Q?kp4MD0G/Zk5HbAqPk3M1BLPXI9eH/cmkElT4UxGA6afLY1aBMPCB0EHmKmi8?=
 =?us-ascii?Q?X6fhR/I+IO9px+7zjOaftViRztFsz1El8QpueDG7C+Wfuo/vb0b5XkLcssBe?=
 =?us-ascii?Q?pJqsxR1INVYv1OCAGstEd5PgjCSDjvP09R+tCzNvHyl1m0SjBpxCbgt3XGBZ?=
 =?us-ascii?Q?vwXHweKUEUdi6kLywZrBKPuEX8B6UY43OqHjMSCOBx2qtf4hYdb3YLyx8rFH?=
 =?us-ascii?Q?R9FIq9ueZCk0TVE9DTOWgC8G2r9vmpweyxvaETFWJBBNzEhPK8LrFZhG8Tgk?=
 =?us-ascii?Q?B7NFTZ5uBxZSXe0Ygaff5hOqveWg3eSrZ9ANe006fkzfTfX1IUj8jjpTPnkZ?=
 =?us-ascii?Q?YmZhCd4T4hMZBsuDp03QzbxLtSSXFuYbXoNB/YrG/tV8erP1aeOfRPVZ+aDO?=
 =?us-ascii?Q?9Kw1ni/kYgr6jjv9JVvMQSoxSYdNY68Gx1Pz8aUxlFmABn8tTRKEaHG4m2GQ?=
 =?us-ascii?Q?rwKwb3OM1yKNLafiY2U3RgrptrdU75KIednozcc12ucgy3MOpp8rwcqE9AsL?=
 =?us-ascii?Q?TOObxHOgcG60CSjKfwEloiFIo8DmdHeCtVnfwZH/0cIr3JKTsyfPw4M5qrZ4?=
 =?us-ascii?Q?yTicEMbdWSl2RCkj4lZEIgGG2j0pafn0WlOl/sJQZkOowQmsod00sGbGZ5Xq?=
 =?us-ascii?Q?DItbHclQNOdfE3viuLryICGMbkn5Qw5VZYSDG5s9K1GJtWx9n6zn1vw0sumR?=
 =?us-ascii?Q?V2oUGwD0b2EK5ftuyneL6AukTWt9m0Hp2K2BFCmloBYW6I2yHUFt3jlrgJc/?=
 =?us-ascii?Q?miAPY9X7+ki6YE8HnL/xdyHIqhqjtb7ltb2vlDzTD2xHvd0VdnVOEY1MldkP?=
 =?us-ascii?Q?rQTUESer1Ek31QiU7hMZcQuNj4nFuAsi+kGdVOAHgE4GBD/fh5THle7VmlGf?=
 =?us-ascii?Q?g5MDeo6BzBxO5b7qspjL7AOn+s1aDpIPn/HOHPiTmrIKblU1ptY06if3RTpu?=
 =?us-ascii?Q?6Hp/fEqeiBSL6Xv/ia5GwvfSoIYu00GKXCZP5tmGWHYdy94iWx1XOChnEEWR?=
 =?us-ascii?Q?oosnKXepJUexjRtlxsf4iA96nfvMl+N13y1VeWwNBzM3NhSLgNebOGuypYVr?=
 =?us-ascii?Q?yOZQO9HI39dmuiox09PAC9+nVrCtpF0v8ZKKRqx/aMvhLflsqC2AjJLSxpNo?=
 =?us-ascii?Q?MpcFrzHk5Mg4yF21RSMthD3asisxS4LpGdSNaasGPUCtorXHLNeRJ74S43Vo?=
 =?us-ascii?Q?YPFBgYPQSkEI6v9iPGF6Ijw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cac265e2-5ed5-4372-f9d7-08de20b85de5
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:22:15.5615
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bpgIxPhUlLZ4HJUCxOkNCAO2CVZpxC+KK0O3vPE/KRXCHC7wu2aqOZgUH5zh8XqOF/lK00HkgFElIJ33BH1C/39kTy/P7E0NbkYRXrI3LMg6XfL+SYXM7LYOJ5QrQgxO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB12802

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
 sound/soc/codecs/es8316.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/es8316.c b/sound/soc/codecs/es8316.c
index e7bd561a8f40d..9245c33700dee 100644
--- a/sound/soc/codecs/es8316.c
+++ b/sound/soc/codecs/es8316.c
@@ -590,7 +590,7 @@ static struct snd_soc_dai_driver es8316_dai = {
 static void es8316_enable_micbias_for_mic_gnd_short_detect(
 	struct snd_soc_component *component)
 {
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 
 	snd_soc_dapm_mutex_lock(dapm);
 	snd_soc_dapm_force_enable_pin_unlocked(dapm, "Bias");
@@ -605,7 +605,7 @@ static void es8316_enable_micbias_for_mic_gnd_short_detect(
 static void es8316_disable_micbias_for_mic_gnd_short_detect(
 	struct snd_soc_component *component)
 {
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 
 	snd_soc_dapm_mutex_lock(dapm);
 	snd_soc_dapm_disable_pin_unlocked(dapm, "Mic Bias");
-- 
2.43.0

