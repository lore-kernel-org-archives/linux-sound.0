Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011064.outbound.protection.outlook.com [52.101.125.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8DFD221F00
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762821048; cv=fail; b=ZgzWTt4LdQ47e6ykwOgwQwUADv1D3FA3bc07vQq1KRW06K2HKvEm1x6Z/6BG++Q6ubLdMt/tPwkobGLX9X9SFB3HUu653SyEDVLxNFqF9BUlBJnxbDueA/b+nvCj+TEHWou+Wl2P+edNpyZ+AVFrFLCjWe6TX4hjvW7T9O4dg64=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762821048; c=relaxed/simple;
	bh=kmF6H0mzoEmq/9FVpAaxpuF4ftn2g3y7XcGbc1TP8dE=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=MXTOYJgpMx/9n8qSJuOxVH9KXwnV7pEKSPyAMeSGEnv1pgm7GAxKuX+pdeB1GJFOv2wY3dvfphoF/JNf/0R6jlf0ahmBNWhWeYQoT9Uj0b6LEIhPkE6HA8E8PHPKncaO6wR5ksDL6wXUtMQY4ixvRDokaqMMyAtR/68J8eP96B4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ADErrW73; arc=fail smtp.client-ip=52.101.125.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ADErrW73"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CVk1pBbuSjzBCpXX++N/t7K2y4JkYRhCCOgqFU4kwk+HHI6bBhBiin5yImvdMGQoh4oqiaYC/yxgCz4VQIZJeHqTCFIudtnnxETgPfmsvVGyiK6aeAVPpESs8GCFS80lewH9xfOX5ki7W0fzXdjNbLV/CtLo9zJxjVsRLzjchNt3AJZgSAd6IiRDCJHv51Vog2dKfFz9F+JVavbcfDJxsp+5bGwpIfuklDY5C+tK/yJY1vWBp22cF0/QiQkrlVQecWrRJNJmnpEHpAQwCCu1D6RLjX//0jhcKENKTUHE2XUVmOanip1w++hG5nSfHpYo6RTwzQZFcVkUAc6MJDRzUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WRx62jWFOuOkhxdJQ+e9h3ciWazNVeJquUaMJEwag90=;
 b=nmtbxL3EKY+8DFVW7TeohH+7ZQhQI0FRsp6Xi+TdTVz7pXyln/FvpFmUAg/9Ws055NVEw1m5ToOlWEkPd+QpRY3N2fOu2btV4hcnNMQWLHViYiGoMybQ9ZKhwNDzRSk7K9f9bGNt3cHe9iaLBaFgXseg/EbM2bOfTscuQuDuiexPqqL9L2rrglEkpn2Z2uzKzmAIiw/tbAPKM+7CWps8lFFj8zGZlkVKJR9z2EQW9WyPZpXoTURodxkTq4zi1/djAtXoE3JxQn80kp/tftK41AZFUeBePrF47bTypq9Owe8xyGEOZt3X1c0qttZ6sRF6mwv+/P3fyWZn2u4dihaJ+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WRx62jWFOuOkhxdJQ+e9h3ciWazNVeJquUaMJEwag90=;
 b=ADErrW73wo6MWEk8XBR1v/cl14Te1Kw1Q3VaysM4sFHTMq1QlhuwofDi69JFJxZoCHAD9uXOpHn6ZM2uGAZLSOQ1lANEcWPhYIMGfi0p4vVuaGNSLfwz+Shnn5JtP2wyN4TC/JUzlPzEBujie+5nfGYYkFyg+RKGQz21st9cZCQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYYPR01MB16440.jpnprd01.prod.outlook.com
 (2603:1096:405:147::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.11; Tue, 11 Nov
 2025 00:30:45 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:30:45 +0000
Message-ID: <87ldkdxvey.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 193/292] ASoC: codecs: wm_adsp: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:30:45 +0000
X-ClientProxiedBy: TY4PR01CA0056.jpnprd01.prod.outlook.com
 (2603:1096:405:372::15) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYYPR01MB16440:EE_
X-MS-Office365-Filtering-Correlation-Id: da6806dd-6f62-4964-b618-08de20b98dd2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?m7I2KLR44YyWXyZvPcucgfEaK0Gpj+5d6mFCp2NjelDytT0M8MbbBL1HgP13?=
 =?us-ascii?Q?FEFGGvW37GJBlB3P0EDSLfee/v1Hc09ChzVB+Cj2nQQxG2m2lb+3EoU5OOh/?=
 =?us-ascii?Q?Ps5ecfmXvRzHiWD+ZDxIbgXHmwJAzSkPYXBfJUE7Fgi4gHkwWBW/tCochuGq?=
 =?us-ascii?Q?V8g7vhZ8chzXWYOCh5LupfZwufgsIlP+SPZxOsqsfxvDA/Bu6RN6duiwa1B/?=
 =?us-ascii?Q?2DwMXXcWeqiJ/pobxwnYcXdqTzJCm27Jqfb2uRGYJsFiAe1IjpBAFX4xJNSS?=
 =?us-ascii?Q?ENFfKz6mVj9iDksUhr8A02waovlaRCffZ/RX3K4RnQbjDdzpiw7l1fS8Yavf?=
 =?us-ascii?Q?7eWzl+zNefpixznaexwUkjq+Hd+3uXHUp4sEhhSJE6yjFB2F8shcf/81y4B+?=
 =?us-ascii?Q?xYw6S38G7GB2jUjIcwXbimafpdR9uvW81B0HrEkU3zRN8LOoLLLRHx1JZYQq?=
 =?us-ascii?Q?Ll1tkN/57EcjeBQ41NS1nHOKhToGPoggEwhx658gS08A1HFd0IyTvLi8O8+U?=
 =?us-ascii?Q?JoRcANirVhvIB7priN6Ba7roS1VNRZnjBlDQ37NviXX7Ho/j0cBYrlaZ9YMI?=
 =?us-ascii?Q?+7POrdFj5fds6gOy2i0G+5oGRYS2CyM5xQMEMyhPuiAaw7NnjmhFIkgYK9I6?=
 =?us-ascii?Q?UQO+QRixUgigtieWjTTbCoxB/UCNJvj2OckxUC6lelNoHVm6TiIWoHNiZ9o/?=
 =?us-ascii?Q?TPDIfo3+lfJPErFh9BO+fleZLTtSaDGSVgULueB1yqH1wf2D3ibQjhYUdV7b?=
 =?us-ascii?Q?OHB0ca/+d4QCS1K2Ej/T5tWRex4Y79+OOINxwbjcAX8ZsrBMb6NDRAKyE92y?=
 =?us-ascii?Q?jzlOM52N6lM18iitNH2jD1vX/YHFqUY7QARyCsHhMn3OM6e4D3so4VitExuw?=
 =?us-ascii?Q?Fp3A39i4SUu6CWtUSW6vswHJwq+myeVQOjgRuE8wrB6ErHt/xcXUrACgB9In?=
 =?us-ascii?Q?yX7dpKvJ+nMGvuv7PB0xAiooQlzaDwgukGZUOR52rM4byv6KHgChuyLyhkgQ?=
 =?us-ascii?Q?3KskFQR8IcwUx9V2n0B6rghOyagmBBcAlsIiNBpXtFIcLVuhhDZRRS8jeldU?=
 =?us-ascii?Q?W57ZdI/b9b/Qtmd+09JVp/gtRuF4nS/trcc8xl9MOd3MLgvvY4XTi8gLdFNg?=
 =?us-ascii?Q?GK359skOIT0bEcG7A2cHex2OMYTQN7C6L9enB5H/v6fPenzBsIW7e9D3K/Vu?=
 =?us-ascii?Q?6WUny6oJ4k01VqA15JdG0oK3CdNNyHBa/lWpxIpVsM1hLYOXKqjR5DzEoy1e?=
 =?us-ascii?Q?BuW+3W6h5Gxy7d9P0ImufdPa9PJa7OnVp3gVlVSqdkEYFY2R5Prt2nWdgduG?=
 =?us-ascii?Q?wxNEXriaD1wJTCYnFP4em1DBz1VOTPd8njBX4qhV7zRvuJJacLBGOfK/L3JR?=
 =?us-ascii?Q?K4EQYCV5tADWEJj85gpd/y4hzfa0UJVHeSvZNMpDgitnYMWYkryZ+QZIFUeg?=
 =?us-ascii?Q?mHCyA11aqforekZaqaF4AVsQ9FW8tqNbpK3POi2hsIImjONBBqjw8x+UhOsw?=
 =?us-ascii?Q?PU2P2OoDHXyPHchNc29zhTfn2liivWwOdcYw?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iuORGINGaO8bFbVve2OIXNnKmjOoOViKW9ze9ZPIvvFoFepaGTav5M3sOBw0?=
 =?us-ascii?Q?7HwoZuQ5obV6Fc/V3YYAo+a6WlGOgUgAPQTMHQ3Du0b0zGzyR2gGcqwzOsy7?=
 =?us-ascii?Q?2cCze00V4e/6xsBQnCqXfFcKyJW9RP9eTmt1zMrfUwspvU8/EYyh84SZrWef?=
 =?us-ascii?Q?6HrQQdXZfZNmUyvWYHLxfPlbLPTIu+YZGP8wjth4+nQwzYoV8OSov+ie+enp?=
 =?us-ascii?Q?rFU26mflAkLgZcPDtzrwQmRX3PcQ6+N0jHigHfJGkVJmmG3JdNyvw1mD9Smt?=
 =?us-ascii?Q?Fjfl0yvMkeKdvXwSmFr5QgrkMCG6afh+GoKS90eJMlKv7AkYk0V76O96QjYF?=
 =?us-ascii?Q?ThcpWRmoyc3e15YV+GTPUDav6NDBW+LSkW/377nq0m90J4U/MJUlrJt/Ov5m?=
 =?us-ascii?Q?QI423Dis1drvytkqatW6DmSqVL7eawTWogviTCvSBLNSTASFCmuqS1YTK6rJ?=
 =?us-ascii?Q?/wpUSKfIyQFiN2q12dS2MqLYqiZtfRAFgB6Mm4xZ68wS57MnvMnEVLiXdjNE?=
 =?us-ascii?Q?O4CPmpbfpJGQi0IrpUH+JFbO39WertsCvOaarU+LLPoMw9FDXnuXt97Numrq?=
 =?us-ascii?Q?DoVVPt+f9XfIbB0Fk6L4VtPC8NIbTC/twyZMUe5a+pS0rq/DYRVSZwICtku/?=
 =?us-ascii?Q?lGXHCKsntgSVzm+ehMowuW5QpO0yerCHSp2A2TzakZfX4DLO5Yd++F6kzT2j?=
 =?us-ascii?Q?w0NnL94+7BQjQwpfHAcdLBJA792ISVRR/qJyscLRJMfvkx6Ol/G7QBZwsOfw?=
 =?us-ascii?Q?L727TOSuSEo0JbyK8fdF0ERVFJckW337vUa37+x4Dw8jT0cnAISf8XTT14VI?=
 =?us-ascii?Q?nv0eBIuJ12wEWyLBw3h4/UrT7Bj10t4njqTGy2ttDQ4y5dOU9EldyEfwdX5t?=
 =?us-ascii?Q?C5yTJcnb9Adv4uYeNi8UAO+3VcCYF91kc2ZE7YCUlZOcXTC/q1zWd+6teaAg?=
 =?us-ascii?Q?qvRwvg7ZTmGOFQPSLcevQ++i1HhLa9qS2dioOAbRdwcyVF4GWL34ac1Tjy2v?=
 =?us-ascii?Q?bbgfBX3fMGXA8NCrwsvePJc1CNjzch7Kpgg+pHgOX8vXouu3p/H2UOKp3huw?=
 =?us-ascii?Q?tlU4NcO9fsW7LhrliJBLUscTfhJgcp4HWZ6hY14Q+/qzjygu/3/Exj/XpkRe?=
 =?us-ascii?Q?5EtXjubPHpjV2X7iBPeti7qSzsVLXQMY2WxEwot6ON7FFrBMlSkJfLqMGTzk?=
 =?us-ascii?Q?YFDphSDP2IXgJJKaJvIPxCHosUcHtUBMS/EgD3s0GQojoL7Ln6g5OfGb2iyF?=
 =?us-ascii?Q?0pdsgQ6qZbh32V9wodwhutQPsBfroIiiULif3XBCbCcSStqs7HmsIxjUxMzy?=
 =?us-ascii?Q?+liQmxrWk4DwEgpotuZstkoGmqClTeeY4TIVKAoOl3x5hRKCeNDqEx+a7Du2?=
 =?us-ascii?Q?D72UN+SLkIkLx56pBkpK5cLlbG0q2Rpzi5XeMu3yZh5zjcpzdjxqVGVO5anh?=
 =?us-ascii?Q?hSqbof+uZszmexz25zquaPOMf62clao62vUTbeWb1GmJccst+nYv59LskJ3j?=
 =?us-ascii?Q?kvBStnpaK2s5iIAVUCI0tZWQ07uJzmWFIq084UGhU3a7rzvFaPh/bA30oTU1?=
 =?us-ascii?Q?c/ai+pfOiyIM14oDNnM7Asp3oigRVMZud9cnaOk/8shmZCib3AbkAAeHK+lZ?=
 =?us-ascii?Q?t7c42Re36r/IEilrksouNqk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da6806dd-6f62-4964-b618-08de20b98dd2
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:30:45.4633
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EaRcLFlUCRorLqseXFbOQGmtkvP8IfH9GKtlp3vTOhbGMGIW/Z9EsQWxySxe06qGo3sj22TC0vZ+o8ElGFSSA5iOkQvPbqM2lqkbfMXI2ZpXd3q63MBwM1yL//Bq/+b9
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
 sound/soc/codecs/wm_adsp.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
index b1b1459073af9..172dcdd7dbca0 100644
--- a/sound/soc/codecs/wm_adsp.c
+++ b/sound/soc/codecs/wm_adsp.c
@@ -953,7 +953,7 @@ int wm_adsp2_preloader_put(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct wm_adsp *dsps = snd_soc_component_get_drvdata(component);
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct soc_mixer_control *mc =
 		(struct soc_mixer_control *)kcontrol->private_value;
 	struct wm_adsp *dsp = &dsps[mc->shift - 1];
@@ -965,9 +965,9 @@ int wm_adsp2_preloader_put(struct snd_kcontrol *kcontrol,
 	snprintf(preload, ARRAY_SIZE(preload), "%s Preload", dsp->cs_dsp.name);
 
 	if (ucontrol->value.integer.value[0] || dsp->toggle_preload)
-		snd_soc_component_force_enable_pin(component, preload);
+		snd_soc_dapm_force_enable_pin(dapm, preload);
 	else
-		snd_soc_component_disable_pin(component, preload);
+		snd_soc_dapm_disable_pin(dapm, preload);
 
 	snd_soc_dapm_sync(dapm);
 
@@ -976,7 +976,7 @@ int wm_adsp2_preloader_put(struct snd_kcontrol *kcontrol,
 	dsp->preloaded = ucontrol->value.integer.value[0];
 
 	if (dsp->toggle_preload) {
-		snd_soc_component_disable_pin(component, preload);
+		snd_soc_dapm_disable_pin(dapm, preload);
 		snd_soc_dapm_sync(dapm);
 	}
 
@@ -1121,11 +1121,12 @@ EXPORT_SYMBOL_GPL(wm_adsp_event);
 
 int wm_adsp2_component_probe(struct wm_adsp *dsp, struct snd_soc_component *component)
 {
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	char preload[32];
 
 	if (!dsp->cs_dsp.no_core_startstop) {
 		snprintf(preload, ARRAY_SIZE(preload), "%s Preload", dsp->cs_dsp.name);
-		snd_soc_component_disable_pin(component, preload);
+		snd_soc_dapm_disable_pin(dapm, preload);
 	}
 
 	cs_dsp_init_debugfs(&dsp->cs_dsp, component->debugfs_root);
-- 
2.43.0

