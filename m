Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011013.outbound.protection.outlook.com [40.107.74.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B260E13959D
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820429; cv=fail; b=hiGON8qSH69NnH9i82dx3zRKUTtpmeoByS6WYvd9wGMAt2f7u4BHiaQf460N9FGVZm5upsjFZyFvFu3c1xbW4VHXv3858cfPAxlAUYpCxIMSwTHm38umcoaLxAiAqJuh17klFS+RwPfE+/QhYr8vhnK4juBUIzU+vPjONlgHKXY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820429; c=relaxed/simple;
	bh=ywgsjFRqN55KBVbLiIIkp3h/F5pUKlHs1eKzuK0Bi8Q=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=P5Fs2hkvyByiBwpYVtBEMEwzkD1Q1jhpSVFAeFA3IKDAfpK3VvxRZ0mOcUt4v5WI+m2I+BE18kqdPw9O8qcndIciO66LrXS5MDimLBp7H5YotgzLjsxkwzrxkwh9u52ipKlP53sjfzVQf6D5Ts4veFZfqzkcuBvHO16An8O16Aw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=NwMKcyds; arc=fail smtp.client-ip=40.107.74.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="NwMKcyds"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ycfEdECAEtQHXepTjJS/NDM1/WBBnLEuF7MvpQ5KjOvcbvf6/P6s5yvjU47ZMPwwXEbg/uLo01oekoG35fnbGJJ6U2VAUN6lPB1PioJoqj44oz8COHVdyE7O3PATrVBajBNst/gpKoX8nfAx43ZY4O1mQc5+JvqRPa+QFakUwLUksQHskuVmKQGfdZ6Gq7Dil2vruxn4nvPdlDwjV1IKMDvRMddApCutBELiXjBywmFVSwKRZWSRB9pEwL0jw4QImyb+smjL+oIBmlLF1CWZHEwPhTQsQ3mXv/TgSD7hZccfnr7iFT45XvCSOFWSvWsC/YN2vFKZ0ZtwOH4nxhDQ9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=676Be28KSx53kvYmZ+j5/udoCMwDxYAWbKT1xSM/vjc=;
 b=IRqqKa8b9YsxSSrdpXkoxwXkQeREFAu5wtwB9OZIfakjmBEHWzoxvUCq3iRF4eYEK9PR1w2KNTtxDXWDKgzO/4T5jRTdHrmL+uuIVZk0cZhTOwMG+I4XZ+rtgc0Be03JiX+n2lrQ7XvN10BjhyHM783FQx+JIOTAQHKiDwmNTjShmIT1raYFcJGNRQelSmdogCKmBKiRBcXkC+abH1V0aaNvjOi+u8X1h7rsqsTR44MutE7LVxSczoeRNx06ed/hJdwWWdhYzQ897W0AqPT8zRuew8uroqIpDkurR+dK8TV12c9BlszkFW3dhYW8EFThLD8UlstC1ky75Hx+2dlMqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=676Be28KSx53kvYmZ+j5/udoCMwDxYAWbKT1xSM/vjc=;
 b=NwMKcydsmGfbi5ev8/qEiG5/hFvfTPmKM8IPtaNKp88uO+pg2UOD3CTp9Qv7BIlFGHGldQi/hTLqmBMOJmoU4mRdck0PkU64T6aqDqb/AWkljKl3FDG1l5+fK+50QYIESHBMh/rDtvAqQ8dfUpyitEBkOjt5ni+U9d2nuN6F/MM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB6994.jpnprd01.prod.outlook.com
 (2603:1096:400:bd::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:20:25 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:20:25 +0000
Message-ID: <87zf8t773q.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 033/292] ASoC: codecs: cs35l45: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:20:25 +0000
X-ClientProxiedBy: TY4P286CA0089.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:369::11) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB6994:EE_
X-MS-Office365-Filtering-Correlation-Id: 63d897fc-e2b4-4225-da59-08de20b81c7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ieH7QcLlTeLOKPDRwpZXoCu5UG6GOMl8o90zvynvDLTAeCAWqkCaMXAVyMoo?=
 =?us-ascii?Q?NKOY9ZbAsI9NoIJck265sJZHyGZcE7ORYfVANIO1Io7N0h5ivK4fnAL8xLNU?=
 =?us-ascii?Q?IGEMzaq23fCxiVKaw/W/cJthNJn4TzOqg8jl4Nf/wzxcMm1ZQmfsTVMMnmh8?=
 =?us-ascii?Q?12k7MwgkhpwiOTXvL/ND6E65tX8XrWOVUjV3N5ikuJzKdw+20yoVsdcydvvl?=
 =?us-ascii?Q?e7LU1/C7/yTTbnXz1Tkm46HNQxJ9BtNnSYeoA7vT1IHDgEQI9HjZmMTsfuVx?=
 =?us-ascii?Q?5SgRTx0TP/5RUSTynA4pvIe0fTlemPZlrfwOo9OG2eQ+AndUHpOZKzyI1c2X?=
 =?us-ascii?Q?PZxQdfovtmbiAIBm0toWUGk11CGAMC1As7RGsPU68QVginZvE+UMrXozKqUB?=
 =?us-ascii?Q?QgyPQgWroIRe8TrEJ46Wxxxt8cqJ/rel+6B4YltrqnYQ8PcRykhpT5NZJVIi?=
 =?us-ascii?Q?pZGMLkoYIext84A4gkv86fQfG0Wx4RXnnXvyNR5od/ARFzL9jjk2hUZUcvY8?=
 =?us-ascii?Q?jUJsQGdB1zK0vnWoL/WuRifW6cTAkssdQsb1GnNXxcTtX9HmjwLXUjvi4VWV?=
 =?us-ascii?Q?QV4kBTGsF3J9opGAJj9GW4wzn9Rj5YzgGy5RE7WWVzBhGvtcPopFDhAkf1GB?=
 =?us-ascii?Q?njjZ9oHIReK2Hx06lpbhChd2Y6bUAEor74Tix5KE7DkbmjPLlw6F1KQVCb9P?=
 =?us-ascii?Q?SFsFXVk6B3PTKeZtmss0SQwQhgGwJnCW/IhrX0i1InbOORQXXrcJaQvHJ6Wz?=
 =?us-ascii?Q?xq6zsX+VB2037H4gzJ1TRUxTzVj1WDydOYmo8lkP0I0GJix/kisE846N1LQG?=
 =?us-ascii?Q?2MqfOG/w/sA04/K0BBgxZOtLIL7mcwfBya1zT3PR9/+DvuhDCeJsEcs8UUmD?=
 =?us-ascii?Q?YXt6squ3vqlAWHOqaWekdb8CbQP50MzJh64wrWrCvHOKtfAnu11c5mm4fdtg?=
 =?us-ascii?Q?evr3QnIeFUH7n6xvAJuHTtuAsMIFnSL65tgJHS67nP9Cc6PPEj0Gpf4DNYdh?=
 =?us-ascii?Q?QrDEIdgLq4xAboC6LyVzqB6Wrz+jsLS8LXIv2jNwD7jAaO3hn8FvHDGp+q6w?=
 =?us-ascii?Q?Py4AIlVDx9HzajCYQploUQBCabxuyS5LuGIe02sKqT+YRUTS5xeVI4E/gXJ+?=
 =?us-ascii?Q?sJi7gnmOiImGZ62BUEGZjmCgzbwy7keqOU5Zx5y7nvC7ZzfCS+INlr9WHCa7?=
 =?us-ascii?Q?t1enNr7BniWQE6j+hQRhElyPc7V2VBDzd86lRttXfzEnJOhabWQEZ4u/vEG6?=
 =?us-ascii?Q?zNG8o2ikDndA0TC/qYlzEfDO3asI+x2EAxbTv8lpVKObgpZhSIz+RebM9hN1?=
 =?us-ascii?Q?Skl/MnSCrvfApdAXUZoWgzj4QL6FsmtE2M+D+veP7wtm8EZjEN4gQC15nKtR?=
 =?us-ascii?Q?vpqEsSkxt6XgoBG2PGWdfXhGeclWsVRyjvlBMDjBUjrtCJxosR34wFn9qRLo?=
 =?us-ascii?Q?r65DaPPSEYv7U2pPb97ALJ9UYPFvhSzR5SvKLzYZVgs+9MvUZ3VdgU1sO7t7?=
 =?us-ascii?Q?bGPbVCU/IbfrginBaJGVUy4/bVu3FOsDcMxK?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4vCikA+ekWAyJbIEcxY7FAvByF5hdnGe8QdAiI4qxFSTZ38jC8TaawFIywW4?=
 =?us-ascii?Q?jzJ/XzfTv3vhtqqgjWyTOqcBrqYd+3ggnBsMdn9CuZsqWt18qC+mi2ZDJBfR?=
 =?us-ascii?Q?gJBamZcAlNpekzsxWEuFNBeg8x0V+9pB69CeSOS6YzjGGX47k6EwmMX0wztR?=
 =?us-ascii?Q?USSnRbaLv2GrOq+NpS7zOUn0GOLKDcPFsa2S1+jCEBFyWLG1fAfz2JcjGaEQ?=
 =?us-ascii?Q?XCAgbEEWlh/jPMRboDNv7QPvt3VLFkW2F+LqjYUVE9K3xupTJOt2S/F7X8mo?=
 =?us-ascii?Q?5iFfGB99stoX5HUfF1nLQf+HQ4QVBP8Q1pB1vc++YtqK3dMjZrFlo5551qze?=
 =?us-ascii?Q?eoKDBq0XQ3YZhcSiRC/XTfjamU68UsC+XxDKfJ9sh/fne8gh2lysBRhcS89M?=
 =?us-ascii?Q?AFW7njpO8FLZeHaktTTJkGQ391k7Hu9lT+m6GJQmBayVlonA44npDlva7lYj?=
 =?us-ascii?Q?oXUkvfnEJyBbOewxCiwYaDrrc3Zjxl88REucT9BNkWAxtaJAC0S/XlwkR8h5?=
 =?us-ascii?Q?aa6lBxuTMK2/aD+TMYn/AjkN7ELqlidAJ2mQuxp223uJ8nd7pyq1Pi4ElOAn?=
 =?us-ascii?Q?M3GbDA/MW6n8YXmlpSRWGC5w+1zt9wLhhdMSqBSN5+5lFCf6V8KkSCdzjSrF?=
 =?us-ascii?Q?Dou6R9qBb9Jl3zbjaWW+1ZWgHsIgFGtYAhnVLP3cscR9y3u92R2CG0Yg/qXJ?=
 =?us-ascii?Q?Bs2pw3Wjhthes78/Lghrp2UDln/alCHJUaqxOHzIl+PGsd37sBh5CxDw3cM1?=
 =?us-ascii?Q?YM43VDlhSdnaN2Wvrk40E1CdHGtJIe6X/88x29RRSc0RUf71DpyV+pwie7yL?=
 =?us-ascii?Q?nvM3Uvbtpjm9hGJDqOAk8t9IToIInzZn52Rcfd7RgUJ7QRPwrjKwzGmhXsri?=
 =?us-ascii?Q?XfwaQSITdEXCD/oIDRjdlPoGe6PNM9vb7Z6um4FgXOCmlJxDFvhL0X59rF3u?=
 =?us-ascii?Q?nXr1CSvrVOzbGBiDZEQhxaktVDa9r+72G3AG/VDyWrfIY4ddkWm24uurzT0v?=
 =?us-ascii?Q?RTSgFBWNtcDPDBS7iaocgstpuNF6/OMcyRULE6ZxBNP1oL0EeJ8UdUldiz2P?=
 =?us-ascii?Q?V7kfhqoXV2o/JMPn3PbdDEWR8uYl2wqwSZ+KSPeb2Mf8+prodHkVdaNVV0+6?=
 =?us-ascii?Q?l/b0PbHDCuvd5A3CSTTxMHyZ8UQRnExULKc518PXtfvJWp0Zw0rUQDd3PZWi?=
 =?us-ascii?Q?uzCVWyydPpc0NmVLgsGaffem5LMBPUYq+CvlMqa0jO9mcVqces/HES2kfY1F?=
 =?us-ascii?Q?IM9IL7G0jLEBckveMgon68kfDCXLaq/5qWLF26Ma/Ajr1wgunIf804S3TDUs?=
 =?us-ascii?Q?WxcVEQikdOVsssOpBzUb6zJcIeDgwyRwI+V6PBr2Dzko420ThT9QixGsKoJ6?=
 =?us-ascii?Q?S5FNuVeEeCWHumuFvKsXv/ZtDN/OBLMKQlk+sojbOr6VGG9B6qRppRxi3M/0?=
 =?us-ascii?Q?E1KFdTqFdKdqcAC7jWYD6txh0U0fKEnDI/h9teGZwXVX8UOYant7NIiCzuIj?=
 =?us-ascii?Q?wzRKH6crtY12qTuGoBjoGjJDQjDRW01IvYCZ9ND2SqNJxT7p30aTJWO8JEzW?=
 =?us-ascii?Q?YNFvqjmySIcgmEf85SMOleInuN6udFrYVIVvRIv8cDDo7yTMii8r5/l4gccA?=
 =?us-ascii?Q?lSMbRjD0BnxWEj4RZduIY+c=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63d897fc-e2b4-4225-da59-08de20b81c7e
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:20:25.8395
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xyocCwCQIGLf38F+TV79RtTmvUmqYh9a7PM5oRMxWOH8UA2M2iazPea7JNsDPUz8wa5yEr1FHXktcRzYYv+lx33eWFPVGm/oNlG6n2ufcKOzxgyTM0gBvfflhdz6PwWT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6994

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
 sound/soc/codecs/cs35l45.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/cs35l45.c b/sound/soc/codecs/cs35l45.c
index 28f47e9607719..e33f114359804 100644
--- a/sound/soc/codecs/cs35l45.c
+++ b/sound/soc/codecs/cs35l45.c
@@ -214,7 +214,7 @@ static int cs35l45_amplifier_mode_put(struct snd_kcontrol *kcontrol,
 	struct cs35l45_private *cs35l45 =
 			snd_soc_component_get_drvdata(component);
 	struct snd_soc_dapm_context *dapm =
-			snd_soc_component_get_dapm(component);
+			snd_soc_component_to_dapm(component);
 	unsigned int amp_state;
 	int ret;
 
@@ -233,7 +233,7 @@ static int cs35l45_amplifier_mode_put(struct snd_kcontrol *kcontrol,
 
 	regmap_clear_bits(cs35l45->regmap, CS35L45_BLOCK_ENABLES,
 				  CS35L45_AMP_EN_MASK);
-	snd_soc_component_disable_pin_unlocked(component, "SPK");
+	snd_soc_dapm_disable_pin_unlocked(dapm, "SPK");
 	snd_soc_dapm_sync_unlocked(dapm);
 
 	if (ucontrol->value.integer.value[0] == AMP_MODE_SPK) {
@@ -287,7 +287,7 @@ static int cs35l45_amplifier_mode_put(struct snd_kcontrol *kcontrol,
 		regmap_set_bits(cs35l45->regmap, CS35L45_BLOCK_ENABLES,
 				CS35L45_AMP_EN_MASK);
 
-	snd_soc_component_enable_pin_unlocked(component, "SPK");
+	snd_soc_dapm_enable_pin_unlocked(dapm, "SPK");
 	snd_soc_dapm_sync_unlocked(dapm);
 	snd_soc_dapm_mutex_unlock(dapm);
 
-- 
2.43.0

