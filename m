Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010063.outbound.protection.outlook.com [52.101.229.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90ACA149E17
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820477; cv=fail; b=rKKpVt8B2JpTHvNNqWmfaYZ3pYMB/3t+DxJdfRvfsev/YFmNtBYZFb0oXYqP5BKy7hp/l0eLZU5fsRaq5K2MHcxWafhRCsyx5sH18E2o/X42ezgnHgaRcqu45LAssX0fJyI/ba/IF97dLkdQQqYJVlCREmz/qlUf20I2FDVOD1U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820477; c=relaxed/simple;
	bh=YlwikmvET/x6swSZcw4CIAh59/kM1tcQNXglXA557HQ=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=M3jkFZ+oZUCLeMB1GtgpSZg9xutUu+4fmIbHfRGW2vMBr1YKKBP/zb4g312sxFZnq9onvqYUxLaiwPvT42gKLWlH/KzCjxnx6Pz+ESlcs+0m1td3l/hSKp3U6dtZEWP76IGjUFE8J0/f9U6N4w3qdi3EmuqOmFG/T/mAW6DsVp8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ORhNhTpo; arc=fail smtp.client-ip=52.101.229.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ORhNhTpo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qDUsJ0bZJwQMCJNaV/MjWftyalW/ttbGdkTRjfvXLSlEJonNaqRd611JYG0Ua9UTq7MaEC2uZBsypE7m4OqiAFTeCy0r8AFin8ORSe2NPLUEMq4URANQCcUlLBaIbE09zrht4DrD5Bv0tl3jPnWMjJ8acHhiA51TRaXUV/0o5BYtQfNfp6lb2AmR1IU3/PutlWkDIC9GWfCHl/rS5JwYq5KN+a3nY5VyuTMSf5J0thLO8wNNM1v7hC4pXCHBAzSQgp6rpvj5rU6nO4OuGQhIMG7a124Pq7eDOqXA53vOlk/GI753PsEqnuQEZkDhSlwUoZ3b8NZIFgdYEk2XVg5JeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vPcuM5uF9nTKKfoXxT5UL1iMWEBRSb/IgQuJkcP44Cw=;
 b=s9SXSJGuhP0naCMBTAml6WAmPiKctodg8NOUgeI8KdIbS8AQrVcPyesBZHsRb47bqKXuLEUKfx9HjqwIIxL6eFsFYlTkKLE/89TUa4Bm+qUzA4O5qSN8uAlrawJZn8yTXS+fpIIF1I1uWJ5XI4MCysFtNK/f1RkPxzv4SNWpWgskjGs1VGa/azJuhJ9pQ88i45O5AV2WcG2IFrhOMU3z6qfgPJ+QLgyrUkEtFe+o1tNiNCx5j4qRT0f+abI/lQ1etgD6nxnZnZa29CYfYk0Nj7Zb0hgXZ2KkcIK9uEATC1kWIflHzLJ0ll+iZYB2uGcvXMv5XV+J1yRAfji/osmgzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vPcuM5uF9nTKKfoXxT5UL1iMWEBRSb/IgQuJkcP44Cw=;
 b=ORhNhTpoozMfAtKp2wzIjfOy7w64jWK+vyPjcrgWVWzMmKp4iPb5Qwo3I8YntFa0snf5vzSnRN1w3YZ22nA7lw8rbwSURN7KwVopX+rdx09Iibu1z05IvU4pawiDkQ9lBviBZno9MetTWXXEt+8ixGp2rkz9qHv03Lt1ivgpdZ4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS7PR01MB14361.jpnprd01.prod.outlook.com
 (2603:1096:604:38b::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:21:13 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:21:13 +0000
Message-ID: <87h5v1772e.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 046/292] ASoC: codecs: cs47l85: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:21:13 +0000
X-ClientProxiedBy: TY4P301CA0047.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36b::10) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS7PR01MB14361:EE_
X-MS-Office365-Filtering-Correlation-Id: 81f7b285-8660-4a15-d5b6-08de20b83919
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kwB3/0d3zVD087utO9F8xMSLUp+f9HtpXzDJnNT8K7e5ETeCiqlzrESGp4BB?=
 =?us-ascii?Q?Mmz1uUNg238gS/XwH9uPeniWgxBc64+z9QCWPkCTLxMMa55OvyXXkv/+gizI?=
 =?us-ascii?Q?UYpjlZLYWrqgan3hIc/Yi/Da4jy3ZCF3qMm4zV96mR29O6mFuqP9/DFY/qK4?=
 =?us-ascii?Q?RhoZ3S67N4ekTwnX7b/mu5JPg7TcawvkY2PTZ1+sG9W93ffaSFSscSTixo/k?=
 =?us-ascii?Q?zJh93W0WGMIGCBjZX/vzNW/GB/bY0zFBqyIubKxUbRTuoRFpBBrV5lxoHMo6?=
 =?us-ascii?Q?FHV4KP6coKtDdXaimCX4hlOhGCuWjof1wjbuHTyKAK2WIQxSmpcF1b5vnCEw?=
 =?us-ascii?Q?MC5/SvWWLvUZWq8eU/a04VAXm3fkau6q2FEatZAMLGjTSAnXt1tjSNNAP8vC?=
 =?us-ascii?Q?kPItBR+XJqpoHvG5X7xM2PpGQyUJToqQjAAHcK4IldRovD8YhphDWZQbqhfO?=
 =?us-ascii?Q?NcuNSNawdoXZHeUvVGrIjBNT5N30Vw7+G9cbT0CA0Rckyha9pCggGxrfQi4H?=
 =?us-ascii?Q?vPqsdXiht/X+FYFT/31XK86tEtyIA6DsBEYTI8y48yHoEHa5co6tTBNp0kmV?=
 =?us-ascii?Q?LTXzLJFqwfcGsH/4QoNIMh4nWDl4vITMAUhUA2duMqc80wONzCf14np7FYrt?=
 =?us-ascii?Q?vkZGtcjot1dFZ4GNsaqBhFzmfzZNXeg1A/pt+5Jgos65qakQwLLcC2fHd9x/?=
 =?us-ascii?Q?FXLU4So6jvgmuHtWY7rVeOkUKE8oiVqgtPetEUfzmfrOb4E1rjWrFN3MiwoR?=
 =?us-ascii?Q?7t+TqkZ1rsE3XEafGlPk5de2ghAnAF0ldhB9+OHxxgxAJH/r+IGitU3pMIqx?=
 =?us-ascii?Q?zg39DGKYR/8cI0S+kjRZpM4uIkxUqk2B8Dk7TYMnJ2FHQVQ+yTzGE4I3sI8+?=
 =?us-ascii?Q?D3L6XzENd3OyAPynUstpPRKI3oCsbJpBcXge0/Qq8lgqngBj6S0VRzkP7jy0?=
 =?us-ascii?Q?r7PEqKNqnzvO2MYkc06bom64g6j6y+rf2C2Q50RCdfp4JflccGNivFRKuLge?=
 =?us-ascii?Q?8yhv6+lEw2trPh1b3YckG4yPSNjeKab15gqiqjodqzCVQjUxoD5L3qHJzGlA?=
 =?us-ascii?Q?EQ3l0x3YgBLTdQa/6ZMl5rSW8u+cyyblpimbwf4JBaumZUzRfW9aQG3nbmdd?=
 =?us-ascii?Q?cyB1/CmfpJsHVtZIItciv99HNmqqZvq8mQ0RIHzm5oFvkAyexKD5Hgx1MVm6?=
 =?us-ascii?Q?2xYDRuqE7JPFuVsCZGYCa2+hyxeLJY1qTOFjN5SDcmXUORGfaK9WcXuQ3JcY?=
 =?us-ascii?Q?kf0X+zYMdUmd47MzSaHjU58iuXV8/c1aWxRzgYWzbdGPoU5JS9wG3m2h1jQF?=
 =?us-ascii?Q?45YntrjGJZL44Rm5sdZR3vD59uNxvZpZylb1EO7s3RfetKao1HpGql027p/n?=
 =?us-ascii?Q?ycsmtsnh2alQ4BFA6XoQx7cEVef3OBIA9G17pWTuHVLT563ukvzn1VJk5zRD?=
 =?us-ascii?Q?iFRk9qVMqWj8TEnQYUUrXOeodxqIJ1g5aeC3kS70x36xtHIzOoej/kR7Q+72?=
 =?us-ascii?Q?RtmXvGAJDBbz1YfooDvtMLMb9ne2Jmhzpgbh?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WPsucNE2MwzRWw9rI96/SAQetti2G3kEB47GiIWwTDdZD0gjFVzLoAX/BsTG?=
 =?us-ascii?Q?j4joDxRL0u3n1daL2nlH6CQ8nX/0xv+UAZOhCQ8ivmow4ypiTKib6afo2S4i?=
 =?us-ascii?Q?gcaSlPaZNO/w53Gcad9lUxj4P2GRLRTFYRXtYbe4nylFyt+xQK/haM8n7TxR?=
 =?us-ascii?Q?XlhMvj1GiYA7zcgOQGpuTwxwZNhbhdEh2gvKErdQUtXrI4y2b6+B2QNr/nBl?=
 =?us-ascii?Q?sEgJSy3q0Euhi2ZHMGyMryW6S4xY8Q9hUZW5pOJSFl+HFr2fIYv1vCS7KXqY?=
 =?us-ascii?Q?ItV322K8Ou81IDPa42VeDfY3cWeOSgfqB/DTvRS4pRO0cwfaWl3k7RHEqQZq?=
 =?us-ascii?Q?JqU2shK9x8Rzf4pQDOBynk+L80YvJUDuLGUCK9WZltySyTyXAz/weE3Npx9p?=
 =?us-ascii?Q?8zLkKMAdXiBt+x+HN33XNPgo4UiX3RA/tk9dHg9dhq/dcAsiTci3A5UDbkxc?=
 =?us-ascii?Q?HtwXxI7Jl8TKmFiekfh9gIDKTRhpTKgrJzP1fR0atI18TEokVsIVm6/SDm66?=
 =?us-ascii?Q?YR1eS9oBKm9p9ZR1badaMsxkKhd6BSlNl/CiBDF2HVaRcedFjnMkilzOTFhK?=
 =?us-ascii?Q?gHiS61lGcfNmPUePD3AYmJ5OCX4e6dE7CYUejfxbbWOgQEqHlhiGAPARKLYA?=
 =?us-ascii?Q?rAf5hswfS4j+4rzzeYruoxGYueovbgi1E5i/v3CIUYhB5gy05Lw9pxoAHiNK?=
 =?us-ascii?Q?dQuA9WE9TAx1mFcbegnCtWZFAha4FtShSZXchYDqnkhgWSmv1Kia095UekW+?=
 =?us-ascii?Q?pjsrczbrWB5y5eN2OJ/MziawlyCZumm4jgRjIzLOLxWmU6hmB7HyOnEoTAFj?=
 =?us-ascii?Q?18HnCOa+aVwNmKqaGG7Idg/MGHI0kXTDuwhEa/TcOpwSctZBDfrWJ4d9yOQl?=
 =?us-ascii?Q?I+sB0Cnap/SVEfgNfX1YwBgGkx1LZCFAHHK00KniU7anemqqpis2J5T+Om1A?=
 =?us-ascii?Q?qBauJGDFTyncBed377x90Bhz2+9LQDfgFsIEIi/ppPc87R6Qc2gQ+KpIoIjo?=
 =?us-ascii?Q?tmMsD5RYDdbA45Hhed0t5gZG9fWK7+8Bdg8q8Fb2bexw7rZNakRbrcjx8q0M?=
 =?us-ascii?Q?xq1agtaU7rqTXPjJ0rywJg1mYdae2KxRKbFY+c/Wg53yKgXPojYfKsrV+9U3?=
 =?us-ascii?Q?YBAogr5C51mEBqxRQoSXD4o7/YDv19zy+LwMX3ktnYTCcY7sIYiu14AtF390?=
 =?us-ascii?Q?stiiHMKl2RupX2Z/E2DRk4PX66OlJyNse3tu+WHbeU3X07IJHuCbXseQFN47?=
 =?us-ascii?Q?+zJU7A+5H3DZ0heR2iMr52lLh5qkIVEK9KcF0/q0z1HNtYRL+4l7AamEZs0w?=
 =?us-ascii?Q?0XfTbg7qFC/ZOu8TODeWgfmkw8OkrzjrWvjsiifihKVAYQaUDYESD7gMcGkE?=
 =?us-ascii?Q?I0wWVykh0pSp35EVbrSRf7JOn+prU6N2Tpkql5Q62gHgslUdmCZXm46zW/sj?=
 =?us-ascii?Q?qlnf9+oCqgsOROeXBcbd2fM6T+HcLayD8ZqNixeah4VKnVKLlq1sBfqk4QM0?=
 =?us-ascii?Q?Ya52znNoko6knFj1Wkypo7bx5acrHL7gKWR8OjhIWDFaspbgxsc0E7U5lFgL?=
 =?us-ascii?Q?nG3LVtyu7w78tUrfymwzpsZsQo5Va9gznWd91X+812RlMc3OMKo0V4jp8IPw?=
 =?us-ascii?Q?22YcAhgv3X0poq6il+zy4qM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81f7b285-8660-4a15-d5b6-08de20b83919
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:21:13.8402
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q5qfg8wPFdHEmVjDVTESv8Tf9RKbBRHujRA4vFpm60A6XJiLdj4ainPNcwZksjbHJcAJSoKRzIKgWmenuwoifVMjaM4DxOXEvQn3zQ/lR9WBR2RonEkjSr4wfDJa2COR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB14361

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
 sound/soc/codecs/cs47l85.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/cs47l85.c b/sound/soc/codecs/cs47l85.c
index d34f4e8c26d37..42fafb0b392c3 100644
--- a/sound/soc/codecs/cs47l85.c
+++ b/sound/soc/codecs/cs47l85.c
@@ -2497,6 +2497,7 @@ static irqreturn_t cs47l85_adsp2_irq(int irq, void *data)
 
 static int cs47l85_component_probe(struct snd_soc_component *component)
 {
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct cs47l85 *cs47l85 = snd_soc_component_get_drvdata(component);
 	struct madera *madera = cs47l85->core.madera;
 	int i, ret;
@@ -2504,7 +2505,7 @@ static int cs47l85_component_probe(struct snd_soc_component *component)
 	snd_soc_component_init_regmap(component, madera->regmap);
 
 	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = snd_soc_component_get_dapm(component);
+	madera->dapm = snd_soc_component_to_dapm(component);
 	mutex_unlock(&madera->dapm_ptr_lock);
 
 	ret = madera_init_inputs(component);
@@ -2516,7 +2517,7 @@ static int cs47l85_component_probe(struct snd_soc_component *component)
 	if (ret)
 		return ret;
 
-	snd_soc_component_disable_pin(component, "HAPTICS");
+	snd_soc_dapm_disable_pin(dapm, "HAPTICS");
 
 	ret = snd_soc_add_component_controls(component,
 					     madera_adsp_rate_controls,
-- 
2.43.0

