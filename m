Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011058.outbound.protection.outlook.com [40.107.74.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A26023BCE7
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762821425; cv=fail; b=QZutVtIOHCWZLPEqFeL2UU4icPsaMGJlCeOzfalxtJT7hp1yknYgnP7XLyd+7h4PrsdwBgCdGGNKDh3YT/zVdDcyTlf68ONPv1KO5BrwIM3+2pJ3swqsh1JrqB8WYcGaxgtIwiFSWXRlUTN5jiKc7XVidM9HmRbAaobm+r8D+Ps=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762821425; c=relaxed/simple;
	bh=C9B6xsH4WTuUVGn/WJWxbDMGq5gcjimqLIeIRA6EZfQ=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=jF1rwrfTgjI+KmVsUtnfWBG2f5dbnTf2uSXuanKECt1RNnFHsHYMxUS/SwzPd2NNpoTZ9cmbZD7uEuTuFUZr0CkLavRk28dw5D7lzq533hCh4d4kVQbRq/oKrQ33hp4XWZWpzNX+SFov06eeKmY1+J/Ka3AwTyQed3IPDkqwXAQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=guj+Ccb4; arc=fail smtp.client-ip=40.107.74.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="guj+Ccb4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NOvOID/XuUuYKn790ZoM2ahRiN33czhqk9ilk1S4mNYO/3z2b/UwBB/rKo6Gg92gfU4HZ6pyUjhKhB4mmyCvgmleQ/8QWibv+Ye3gd1Lhu5VQU/mICTICQonMXGK+qMNknFkIa8NGcooeg3sL6ebNe/9Ljxr88pXqg5JIH/omz6wo2YYWRZ4fPfV7qZBOE/CqwpCpkUyY8rBaOyRFRIGpvEmxNZeCvcI5IW8zEsBhiEnNUPqo5ZT75ovBunTN/zPt04BdTvj3r76Y7Z99wITzpADM/VUxBRFOGJwuBp4FPurgnm1Z2/xyFmiAuFsJWpwP5gEYhWYELaXNfv0VzR5+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=amNv8ztsXWm9RU8ViY6Lm96UaWkessnLxe8mfDjvHLU=;
 b=zLmFSWjLZKqCGAqroNSCYCEw1/jh749y7g/3haNO3Sq2Cw71Ks28pjo4OarQuKB6KwAIrg9NoNZLvhjpm+qCFwNO50ymnM/6BoEGhoh1QHyb2qgDh29YZVA+KwE8NyiUp5wHVsrYfb+HL3VWwxEsN2h61v6i4FJoexy1DOKR1/+iEWbuDpOewyVRdUmqR4KnVR31CGJeonry13U/LfQvLX9knBuDrroaG34GQYfajIW3j8JtLAWocTN7BHBWzm2fdl4zX2sfly9oId26AoJ0v7OHRyOQ9sovWo/v9Sn4/zPuRy1wFYBd5F2uApGfeEWv7rpIPCxVfAP1hphXFAyNgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=amNv8ztsXWm9RU8ViY6Lm96UaWkessnLxe8mfDjvHLU=;
 b=guj+Ccb40b8X4YEPkcUbWFrqtDtKEM2Ds2iZrEUlIw6K5v4qYmCGzPBllgxkX0nONl7wZ35WU1pFQ4XHmNknprYB4sKvWCByD3vLOJFsDmUQx2Wnfrk/kYdCg2+i8SOB3Y3OEEyQM/mEG1hzLfwy5GZ/b3vceghlQQs8QFAegVQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSCPR01MB16378.jpnprd01.prod.outlook.com
 (2603:1096:604:342::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.10; Tue, 11 Nov
 2025 00:36:58 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:36:58 +0000
Message-ID: <87y0ods8uu.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 284/292] ASoC: ti: ams-delta: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:36:57 +0000
X-ClientProxiedBy: TYCP286CA0280.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::8) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSCPR01MB16378:EE_
X-MS-Office365-Filtering-Correlation-Id: 317ae8fa-1b06-43fc-333a-08de20ba6be7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rGrbzzXcW94em5PTkK4eAYATo5Fv6DF84YYKRd+BxAuUK2u9pEXAgvmHXEol?=
 =?us-ascii?Q?kJ7VEln8pkgos3LfdbhaUuH7zYLbRzo2YCcWTUXOrtaJm1pPpsbxBheuSn6B?=
 =?us-ascii?Q?TCXctdA8B4egYjRQE4EVUDV2FQaSAY8RLlh8xCUolIHea3Thnrma3vuJ766c?=
 =?us-ascii?Q?ybWLhV/DLP198qU612BkpEfH7QVdK5b9T2Y1h5nELzRBBM7+sjZMVUT1zKP3?=
 =?us-ascii?Q?P0vjmL49DGkaE9VIBr95v0yfwMKQIP044Tl7o78VsAyFBrGALezalNGxt+8y?=
 =?us-ascii?Q?vT1CUMVNjm5yuxPsJG2jUk2ZxkEGTb0sgBpalpFPw/8Y5H2pNn42y91FTTXi?=
 =?us-ascii?Q?tDrwjgrF3o+Lzrg0WgUjqbih7QZHto+fD7HrLurqZofQSn+r/F+UUzxXob56?=
 =?us-ascii?Q?NiX5AzAxQkRmyKcgn/AIiUlipahtDUQ9fR64I5WQPlkCqWCF1wu5IrfKQqRX?=
 =?us-ascii?Q?3kkKEJM1eLRPrbPlPhDbtB8+kfEhNjY1fhskzI2RT7RAOENGgGBg53mJDAo5?=
 =?us-ascii?Q?nLcTmQUvEjdAAq+bHv/FHIlIItDL0nIJZZl2spIFvX3Doaj40/pKJN9Ks/rV?=
 =?us-ascii?Q?vIz4UuFONeumCNoK2/Mx2ZfHlOWzBDfeYS9Ykwt7oeJeON1c/inwCHNTHqSh?=
 =?us-ascii?Q?iIHc5+2EgRNjoDWtOeOc0Ky+Jv0j8dpYN9+MaCtGOMxz/JwTDf9fvWihQq0O?=
 =?us-ascii?Q?i8clPx+ZRQpKsTXzf2fGyZvGeBZGEq9H+rWw4JHnxCg+LsN4KnJzE+ogQhG4?=
 =?us-ascii?Q?lt91Qe62EzKxmYWcR13Zl4OoJuS2G9OXDDp5klt5ggOjiMr1Jm1S87w2fmNG?=
 =?us-ascii?Q?+FC6mtccOXesH0FiCmUcxOTjbgYvhfNxVvr1TNNJHce2yhwD3YlP+gP3F74o?=
 =?us-ascii?Q?HVRqkKeySrLQKewiPCJuzxbsl4b5L22cdxc1evXTff5APqIobm7DmRl6Yqfa?=
 =?us-ascii?Q?k32E1xaQ9PkU/YjG6emMI3qazZr1mUQtJOmOXQ/Y0n2T0IZbfMeMZHRUKdgi?=
 =?us-ascii?Q?YkyEg1mbcCR9O3Q20p9awpIzf2pb6nMVFPvn7ZCiFXj994ZD/PkAPwZEg/qO?=
 =?us-ascii?Q?4qwcRbCJoxCbzJ+8Lz4LpaJWHZ3PFqJAd7+bY1bzcFyQA1pR3RyAZU0KXFbw?=
 =?us-ascii?Q?mhuY9eojztZi0RtXAKPQytvI3iOvCwIwcV9PB683QFK1DZUSfDdZt0PBOnTs?=
 =?us-ascii?Q?bA+bgTuabOO4zXyRR9Vn8P7ytqR2F6pxLFf/od+vs352awtLHPrR9jI9FMHH?=
 =?us-ascii?Q?McWP9vyG9vnDlxY9VqvkT9jMwxjGRHpa9nbh1F2ZS49VbIi2UTv64XFOX/yL?=
 =?us-ascii?Q?CUiMJqmE1uqF1Od1gZm7jSKKrgXWyPfCnn1d36I1OyM2Hda6yo5zemyLHghi?=
 =?us-ascii?Q?AQTP4F8UJ9QLUSZIlmEfu2Egt74P/cYlz8e5Fgz3fkpvMhhO0dsLdhecfEN5?=
 =?us-ascii?Q?916anzsLPSvo0rRod8Ou91Xo4cVKGh/usBfu82ZKHNxuoK79n9Py+dyV+sv7?=
 =?us-ascii?Q?lYzoLhmVXZEo1MiLH37wlk0NDZkuR4fWybTC?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IApAfPv3bS1xFWnGkmuS7cJrQeFmgdnAlZCyKdl+1k9krwqN6a5IJTfoLdAS?=
 =?us-ascii?Q?C17MLnxUj7ceuc03eoe6muxp+jSYl0ye2scznl/JGJOYtH6hKAruNfls+VnY?=
 =?us-ascii?Q?gUQ/6srqKBTyWdzdU/i2Dx5INnrdc4kieqDwO0HOzE8qrXde/jeNMJoKYHHt?=
 =?us-ascii?Q?sV5Cb3eWKm3nASoGtFBLYi14f3MN9PXjMjnfV4JLwyzDyhaoW1w+o/MTIa4c?=
 =?us-ascii?Q?Apl7lqCDSC45+fcrphs+2HY7xW6BrU+LWf4A00CfwJ3YrSrkg8D9DjdYr8rK?=
 =?us-ascii?Q?XEXXDder2oA7tElTg7qfD/7vdtLtmqpQCL7p8OZFWjg+XBjREQ1ZFJoFG02G?=
 =?us-ascii?Q?a90XhRcPHKBg1T0aqzwC2aqY57hJeo8DdApTEu1y9VwKqNrlgx7ajFo/2WQS?=
 =?us-ascii?Q?UkGCyEZi+bRAXLAlk9d/LLtsvWdnGvyQLbgEm8CIqbaC5VDTnLYLHzuMwqF6?=
 =?us-ascii?Q?EYW9NToIbkDz9AjXtBdLiwLrcuvP6jsCh5VcWvQooBkoGkeg+Lq9nAG8PKt5?=
 =?us-ascii?Q?qp3sWvfMBxgheGjbQGDTBKWQvkhXOPsQ4ZCHEAKs8Aebv2QyjE2jJHb5P9dC?=
 =?us-ascii?Q?6i+YtQanX4zOng/QV1BHo3zfzhXQkbgfFk2s7/GYItZjQLZsGEgyj74PRdDH?=
 =?us-ascii?Q?aLRGwyBTSiSl+cSvI7/Fb4I72otIQBzMLg/CzzMwvsnTy6lF/VDRfDCnUnMU?=
 =?us-ascii?Q?2UuwrhPBdwXIQZPj8ZQ/djdpnZ6c1O5T49FSYG1kkp2beoVWWxlbOm75PlXb?=
 =?us-ascii?Q?WNPDOmJKxkXbDA90Y56Zix8N4+LaTV1yo9ETvw1I1J5SM5p9oLP7V72qEz9F?=
 =?us-ascii?Q?vLt3ahHBx9t8jAu4kUnLSdRO9gDEGb4rGptXqhNgvh4J2bjUk3wS71IWejod?=
 =?us-ascii?Q?K1knz09JpsfuelXYVKKCT6bPUwOTbDTb9sEEE8rgWevGrO/6vH8MSeYecjx4?=
 =?us-ascii?Q?mFoMxcW+nm7dyc5Kc6GW3WuEcHbhNllF3nyO9reOXn5142Qvokg0ohfQhFT6?=
 =?us-ascii?Q?Mocx4h1E0ZQzEIWQZ4/4G0dB19v39N35gkLqZqGLG7qLyOwltoioIaPdRsQg?=
 =?us-ascii?Q?5F2CPZp6E8Mz6e0l2no3ldfNH9CG4D06LC4VU9/YL6zW+l6WoVKFzcDRVFsF?=
 =?us-ascii?Q?VPO+5GYKR6iBe69coXPAsiW1fRoW5y+PtJJEOcEPZcMiV/WJJOKlTxijaxTT?=
 =?us-ascii?Q?Kv1VUR4++3ixNucBxuZzUxBGbVOSeoz910YG5Hj+p+C4973Td5vutpscJNQd?=
 =?us-ascii?Q?m+xJRGQzDZnbCx1fHhpSeThXheM7M/FMm137AvUCWUkKbA/djSUEQKssIzYZ?=
 =?us-ascii?Q?NO7UJ9g0OWg8SXqutfDpG37dDAs1yDAtOHICkMuhPCFX5DYGjXJBPcCzD/Y5?=
 =?us-ascii?Q?wfvA/fyf7Fi4uhUiHoTq47iXVbz8Lzz9OkprGSrEmiqwM22q1rAGIwop0I9G?=
 =?us-ascii?Q?5NifDwcLFqC6+HkPBCpuwKrlFYQzFh0TwWoQiuv2s2CMGsimfSN/c4ucPR1G?=
 =?us-ascii?Q?px6Mb1NWVvV0jUFJ77XCj9U3C5cr2+rFTqL6AFj9XNl9uFIkaJ3OLhexx2XN?=
 =?us-ascii?Q?bt0yINqte5LhJ1uox31br7Qvf4IoL7Yhk34B/ylPrfbWl2C9TBkJusDM0Pbi?=
 =?us-ascii?Q?5r+dyGQFDOCgk1D14iM0zrw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 317ae8fa-1b06-43fc-333a-08de20ba6be7
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:36:58.0557
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ukd/MkdLaMaEsfsj0Jz/PW83kJqUT5MxXLLhuQwzRBby30OBk2Q+Kiokx4rF4xyPMyG7LifLyWHz5/Wj16k/3ozK52irlBmiR9A7ZCOPuRhCx89yvLWEpMhKxUR0BVzR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB16378

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
 sound/soc/ti/ams-delta.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/ti/ams-delta.c b/sound/soc/ti/ams-delta.c
index 9b8cb80ec81aa..ba173d9fcba91 100644
--- a/sound/soc/ti/ams-delta.c
+++ b/sound/soc/ti/ams-delta.c
@@ -99,7 +99,7 @@ static int ams_delta_set_audio_mode(struct snd_kcontrol *kcontrol,
 					struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_soc_card *card = snd_kcontrol_chip(kcontrol);
-	struct snd_soc_dapm_context *dapm = &card->dapm;
+	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
 	struct soc_enum *control = (struct soc_enum *)kcontrol->private_value;
 	unsigned short pins;
 	int pin, changed = 0;
@@ -172,7 +172,7 @@ static int ams_delta_get_audio_mode(struct snd_kcontrol *kcontrol,
 					struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_soc_card *card = snd_kcontrol_chip(kcontrol);
-	struct snd_soc_dapm_context *dapm = &card->dapm;
+	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
 	unsigned short pins, mode;
 
 	pins = ((snd_soc_dapm_get_pin_status(dapm, "Mouthpiece") <<
@@ -313,7 +313,7 @@ static void cx81801_close(struct tty_struct *tty)
 
 	v253_ops.close(tty);
 
-	dapm = &component->card->dapm;
+	dapm = snd_soc_card_to_dapm(component->card);
 
 	/* Revert back to default audio input/output constellation */
 	snd_soc_dapm_mutex_lock(dapm);
@@ -462,7 +462,7 @@ static int ams_delta_cx20442_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	struct snd_soc_card *card = rtd->card;
-	struct snd_soc_dapm_context *dapm = &card->dapm;
+	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
 	int ret;
 	/* Codec is ready, now add/activate board specific controls */
 
-- 
2.43.0

