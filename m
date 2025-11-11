Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011071.outbound.protection.outlook.com [40.107.74.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D45CC220F3E
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762821140; cv=fail; b=V01uYMJPcHPElU5gG2nDJ8xegOerVFk7DFLAX2OYHVdLBAwXfyYtjUuMWtcHX5hTjfL8NiIwQrdnEeDKVzqFKU9oieEy+9Vvus4Oqxh9oS4JB3EDCFF9JcjRdv7vod5PaD+QfL6bIlv+59CjFZSCmH7PGSnM6ei2mbpuZnLqHDQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762821140; c=relaxed/simple;
	bh=3k7Th5f85SyNwf0oJYG48+A+4KeONnnW2z4dM3laB6w=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=JpxVTAG5VVM143UMT6THdhPw9mogKzdwJef99GkbUhNEY/hVFj2YyLis8rEkSgE5qXlKAJqSTMqakSXnVkdzM51ZLxe6MkmPfBBK1jxr9kbqhIBJ3p0zgWpIavbDHoVRkP8TYfrySePsxkuwzXlCN6gDN09jRTAZcANamC8pswI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=TRfwOyFP; arc=fail smtp.client-ip=40.107.74.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="TRfwOyFP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jeLRappFU31f5zhVI8wW6TYWEa3BPLTstqthG89uw49fMlWNKSUJK0isLKPEZf7UBB+r+TlcbWYe9Kdkxz4chMF6WMuKZZPxlCVOxpfbgvtipX67C+ijqMU34MHuARujhwXCH4EviUZVpDPfOynJN8STl9w7BNc9+xKQXb4mC1HNf4kWDJUWzc3YbMSiVk2H8X5WF+s/yKyZd/suUzdtSO6B5t9Qz0jqlg331+7u89ekdUEMJzkIb/9TRLEitgeZ0CfPcxjP+aqlN7dyjPOad9gQtwglXArGCGcxP7XBTYBpw5p8BxmglR48yyctkcH9Vk14KkdkhRCjvVj5dttkcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eO6sNDrjm1uMx76GNbir8hsPW6Wx/1/HVBXJyT9eovs=;
 b=gvW1v+OFQREyqLiaq67Sg3GV4qoPEBr1P5OwN76chiLDucHJZZICFRwRX1E+IWSfe/lttKmVswUxfA31RNJTrg9HQrI4SmM+G2O/k7nK0K1fk9zgs2HRP/XjfIO7kjoLo+NHRzwf+AEFZEOWyTgGKTcB5eidbeGsfC4kU8ep/rXewSjkE7BF8x04/5XaDKQQ2akijdHD4aO0NpHXLF4FKaQFMrJsOE3w4Z69PNOk80RWsbJ7NYfLHBA7NQIT5XUwU01Cpuz2Csv8foq9/SY/35eM/umvbISWHPk4rKEJOlP9WkpvnQq6L9u4GASWjfkFwreq4sVjzcek0s/U9YZxmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eO6sNDrjm1uMx76GNbir8hsPW6Wx/1/HVBXJyT9eovs=;
 b=TRfwOyFPsTxB+DcBxo/WLwEA7g3XeXWrG9VGdddeOdnBFI6cP6HyzEP6jeoJizRx7Bt6EIAy6rvVTHLA5+gIQPjLq8zh4fbc99bQrz1+G5TQGdakbxSwZUSwuwuemeU0+K11wXud3CvHzV63zSQesoYb2v5p+bmJZxbvWsOjkfs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB9810.jpnprd01.prod.outlook.com
 (2603:1096:400:222::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:32:16 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:32:16 +0000
Message-ID: <87zf8twgs0.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 208/292] ASoC: intel: boards: bytcht_cx2072x: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:32:15 +0000
X-ClientProxiedBy: TYCPR01CA0155.jpnprd01.prod.outlook.com
 (2603:1096:400:2b1::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB9810:EE_
X-MS-Office365-Filtering-Correlation-Id: 03add58b-034b-4e64-31df-08de20b9c3cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wG07+Jy/IJUGvy6qJBKRCdMK+/ZrM6o2drprH4Er7mhIOZz5e0+0Eyj8Mj2Y?=
 =?us-ascii?Q?bsMuQwX2nB3Raclwpgb+X6ZmtTrDsV2BXUImrR12J81VcwMiSrC3/Sj5Diqc?=
 =?us-ascii?Q?pTeG28MMzLG33Ec8DrI87/xBY2Y4i4GjEo+QS5YDmzoOddkvX/lJkEDvvqHo?=
 =?us-ascii?Q?uz7WsancikdBSxXViZX+3dvalBpItcUpqllIgt20I+oq3peyQXMZ6FL1/MMB?=
 =?us-ascii?Q?itzRNSbx4TcC4ZbgIHbSCFwOcYwPZcGm2r4yJ75tjOf63XXb/4kz9/60deeL?=
 =?us-ascii?Q?jpXNLRm0YTxbyfGrUBLrTSKZtbreY3lRD971xKGq3Hs4Vp45m5hgy9Jh87Er?=
 =?us-ascii?Q?5hSShiHR6X6di9a/jQBDvzqN47o0F9XASjpd2rOFaMZF4XhXVLwq8koDXMOe?=
 =?us-ascii?Q?zJpInPmZJz+6AgqXnGBgUr52BQ/hpoP29aHlbGoWhl6T9iAkBiWhZIp3rTUs?=
 =?us-ascii?Q?1y8at8xsJFi1P4dLI2Tedb4X42Y9JhShHqejOd97viAxUjkf7LVImDnUmu+3?=
 =?us-ascii?Q?8v5c6Nhha0IlxYhktriUq50vDJCkWcbnf4UY0QyGQB837ONdl1uKrWQ5cG5P?=
 =?us-ascii?Q?MVWXtWP/OfvoPp1OXI+qTTLJ2/LyEl2NvC90MrOdzI/QplFkgbtawgEq5z+u?=
 =?us-ascii?Q?drqepZ1e1AO9kP2gWUDE5rAytiF0OM97clhKKNPcm5L34X/3xhvvmQ5smeiJ?=
 =?us-ascii?Q?hMkLTcFbWM1ZeSCTwTb/Ro4rxdGDOxpMMy32w5cWQEaRqp3XHBvoKTdagcPu?=
 =?us-ascii?Q?vDcwneEps/WgKfGHOA2Chm61nkEpvNBVThkZsdut8LHILg3uNJZxf/MQFyKn?=
 =?us-ascii?Q?MgyvfTN/FIGwwAZWlQvOxw2uivB/EXhwXUObA85LHlPZT7I+KK6BGllwEpRm?=
 =?us-ascii?Q?E/HAawC0vdTbUUfP73TpGWcwDLVd6O4aV0QyoMqlHpxx8aInN0TzxaYlcCES?=
 =?us-ascii?Q?jkGxKZp2uvMF1o3QhDt+g6fKXmte58AsHkEkT1RGZYe8ic8P9TYddNJbmdTA?=
 =?us-ascii?Q?VbIKZ1AVoTFrr95lFUMUSKpPrIaCttiO0X/ftukWEQ4ALyfcdlDh5ka3VmtB?=
 =?us-ascii?Q?DDme5QkyGPnWPHHKpadb/Cqlm1Ewu04/h8UEp8IT/WwrmDHkQK+DNgheDPyq?=
 =?us-ascii?Q?57G3+a7+IlQImigk5bM/BTu8d+VA5l7SKc8G6nn+FQcjXnUzl7ByEhezVlyJ?=
 =?us-ascii?Q?tiaikwpTGJKFg/7EHnlfT90g011l349OU4KOz3UdI7zbTICrVojNremIMpcB?=
 =?us-ascii?Q?df17gs/tMDU1NCK6Z0IrvsN06kFO5awX2f3xLjiKosHKlp0vE/kEK0shXnzY?=
 =?us-ascii?Q?+2wX/xWuU7EZ5KOEG1GPKcTWCyKTWmud7YxdDkWhnB3knkFrn3PYk/0fYjYr?=
 =?us-ascii?Q?ikOIujbuVIUIfKgzZEZC7Pma43Uuup2JruE/+pKcBjbQxXyLEEVLF8WhBH0K?=
 =?us-ascii?Q?TycsPKN9zH9ofW5MAXeQFRBBLLMdenNQx9sbRuP5QjOvvGpVD60/tlJ0KinA?=
 =?us-ascii?Q?nY8yR6EZYzzcp/K6v/CkRfOrq2I3ICtljF26?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6cAvN1gcdygWG9LjloEUIrTd732r9Q2wtNfjlBBb8Lpj3i1y5dp7Wr/L6V3y?=
 =?us-ascii?Q?4irxUPnC5jQkR9RWWd4cZox4kRINTmaATbIxSLDVRwORJqN43E9DB1xN2FQy?=
 =?us-ascii?Q?XwejSEVtdemtXRYUbsHNbdXwX8czPfQ4UF4ftInVJyb1YQ899jB+r/QiWY3l?=
 =?us-ascii?Q?kFX40yL2arrWX6EVRXV536016Hs6ExBLrCRfeGp9TsV1x7UXcKShO5eF4Hfc?=
 =?us-ascii?Q?nHuzKfm5nDk4mt9TxfTnejkc7Og3lG49YtvL80uVB2PlO81WH0215Ie9nWKk?=
 =?us-ascii?Q?QBtqKB0jrHmR8qt6vanIKQq0APH5HHLlzjHHtnANa0WG8lmbMY3TWx+Sdvs6?=
 =?us-ascii?Q?cV2G+q6vyY+0GqNrWiHthUTgF22p3GBK8uYeGzuir0ZKqkbin54mihP0dS4c?=
 =?us-ascii?Q?v9CyXtz+6+XR4xZgoQQLb3h2NVKQBixCSRJ2AYW41iDRQ77ZYdM2h+zJ3ii2?=
 =?us-ascii?Q?gzJaSi9KmkuEyriLn1VDb19VYwP5XW5jpFnHbg6owEFmopfwkheq+P3TaBq2?=
 =?us-ascii?Q?IP+ryW4HyolyzvaeMq99SPTqW57qZYoSeELpyNTTbPUkzQshKbnySXxlmLBJ?=
 =?us-ascii?Q?iuvW57KT1wmMcAkwFXRvov1kJnv5SNg1glJRS4cX9/Uc8eRG0RPgQ+2Mk8N0?=
 =?us-ascii?Q?bosfIRrfQedYdxNf+HmrWpF2/JNliWW3/vbMqEHIeStXVTjFIdDAcUXP1VDl?=
 =?us-ascii?Q?50E5PlYSOAxZvBwGOTE3CBamqhbbRwLwwnu1K/JnFc7Uj381P+P4N/Ashb6g?=
 =?us-ascii?Q?THfgqSdOodb5ioNzE5a9ivif0c2rNa4tuIW+2dQO6spH0qyPaaHWZrmZt3xK?=
 =?us-ascii?Q?//aY5V273vRAr9eDVxLNBKvDI+n+a0hIz5WzoX18B4pIPjsuSphJlNihCala?=
 =?us-ascii?Q?it6s+jrMuDGvV8XUgU6UWm21BjC6wThr1dhmAk5R1VitMqtea8jpSxYUqTse?=
 =?us-ascii?Q?cNvC5Lbd+9ARhCPBgFriH1nC8u7CH6XhYoa6hCblM2WrbnNRc3XG5CXrUd0K?=
 =?us-ascii?Q?H9GpRkXgVgEb85KQ+jNhod11Yg9+P0YmDggFH0MGPWQ7zNUjnUFAv7EMwnIE?=
 =?us-ascii?Q?074+KzeCL6CXnruFyYrjEYwLIo0ucBtKbZ9/IoXTz7iynhe7K72Hu5Of5uOV?=
 =?us-ascii?Q?IaLPyKeaSkuWL2KxE6NiKtTCDRbYs9vsDBFtFopX5mUAt3Lo0W0eciTjqlqo?=
 =?us-ascii?Q?DDqHy5/QN3LP50aK7D1unlFCWzSl6QFhcgcQLa5g2Uzj9LCfGafWIBnMV9ml?=
 =?us-ascii?Q?ZPFOBm2iPwLccAq7yTsYenoCqYFkMpzbd5uWgXVjUZMJjdpogne9yy6h8hEk?=
 =?us-ascii?Q?iCKbZG79z1nbw/DEi0l2pkDseMfWB4bOEsFcxtNS5a88JXf+r00ifgb9rBgl?=
 =?us-ascii?Q?Q87sjk7oJaOuLgjeNTknQnz3b8HXOZY1cG/TagQbgFWp0STbT0uD9JyvMiO4?=
 =?us-ascii?Q?r/VQJxWgO0LZa1uiTwqek8S36Q3qamxhbRKgeJY2DH2VVNFUyCZ5suPdWl2h?=
 =?us-ascii?Q?yyjr+ZPKLRKepPUm/QawAfhav/T/tqzGmvbTz/81CQxBsmpR+WIiR2a3OuJr?=
 =?us-ascii?Q?oVLK7A5hRBA1Udlgv+qzc7DUCty+ud8g7NQe+J15jy/bP9JSvwNAJkrfVbvO?=
 =?us-ascii?Q?Qz41DSQcL5Xwje5R0X7nr+U=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03add58b-034b-4e64-31df-08de20b9c3cb
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:32:16.0266
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oRGPhZ8Pz8bWcIQaa7BhiDjLh9Lpn3NmmSlZTlKEOy9o5suEN8kd5ArSJuUwp+5aFhjyubePfiZKXk9rBbUVASq0Y9H7Cs9txW5hhxBCR8OngVSgvWY5tffWF0JcTCKM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB9810

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
 sound/soc/intel/boards/bytcht_cx2072x.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/boards/bytcht_cx2072x.c b/sound/soc/intel/boards/bytcht_cx2072x.c
index 27b63a853a48e..0a7e6d2e37cb0 100644
--- a/sound/soc/intel/boards/bytcht_cx2072x.c
+++ b/sound/soc/intel/boards/bytcht_cx2072x.c
@@ -70,6 +70,7 @@ static const struct acpi_gpio_mapping byt_cht_cx2072x_acpi_gpios[] = {
 static int byt_cht_cx2072x_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
+	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
 	struct snd_soc_component *codec = snd_soc_rtd_to_codec(rtd, 0)->component;
 	int ret;
 
@@ -77,7 +78,7 @@ static int byt_cht_cx2072x_init(struct snd_soc_pcm_runtime *rtd)
 					   byt_cht_cx2072x_acpi_gpios))
 		dev_warn(rtd->dev, "Unable to add GPIO mapping table\n");
 
-	card->dapm.idle_bias = false;
+	snd_soc_dapm_set_idle_bias(dapm, false);
 
 	/* set the default PLL rate, the clock is handled by the codec driver */
 	ret = snd_soc_dai_set_sysclk(snd_soc_rtd_to_codec(rtd, 0), CX2072X_MCLK_EXTERNAL_PLL,
-- 
2.43.0

