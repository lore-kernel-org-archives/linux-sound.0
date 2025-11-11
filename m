Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011059.outbound.protection.outlook.com [40.107.74.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 749AA238C07
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762821292; cv=fail; b=SV1w7Kz3riMAHTbWOxPED/Xup0jMH7as9vDwO4qYQ6DoiFHd0dQukQfdJVLkEy1h1SzKvLj6PMVSd/pejh/G3y8AqpSd6RDhAujOtt1M/PGWvMyuxsHdDgy7stgjuGNuD4F2tzl2nNMHC4D0uTKIE9pPEsfvMkJoqyb6BzZ//hY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762821292; c=relaxed/simple;
	bh=tjrA8iL0Z/vrpiCjzKQ0/49kMUPAxwjqDTr7guv6zVo=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=B8qTFbEA1JHMTqMlUvx1/Kb1tWIANoPSgc/HZsK3Bv7lFDWCvoEmAKxJ+m0HWb7Hp1v9GHTxBmdZiIINytwXSJP7+5xW7jwzSABoJyn3gOypVtkMKqdcJ82ggMLDItpQeumB/hDkFnfU5TEG8sJK1fU+ESESzUF/jytOCm+PF9Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ZjR4AVvk; arc=fail smtp.client-ip=40.107.74.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ZjR4AVvk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ai3oQyFMOWiNwzAXf1ocv1fXgVBACyeM2Tg5moCvd+bV6Fw56+LdKk+xba5NFbCxGQWC2cv9T7t6L9EwJrye6PrMIp10SjYa/Xy9QoQ3qeutDm/9O+H3efw3QULrOtsnwXnThnra46iiW6TY0Cy3zivD05qRVlHCascQIm5OnttNnc7ttMTSKg9fJw8ww/ewRsWpUL+xWfB5CNy+B28+JKvp3OzzZC6hZRNirUGqX2aNMvVlA8arF+Wbin47Idk32qPSzXs49yrhgKT9BqwSn4991EsKZcRSrlhPfKI+Jb/T9+wZzURC3JT0Oi5Zw0n6MrOvYVu8ifYWVpP4MGcSgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CSPpnoL+ZLUYhETboE9Y83CxRMcVSCrMMRVElQjoK2s=;
 b=w10xym1noMSpgaUwvAcwl5w8mphnPv7Q/OBfBhKKzMmkswcBr+fj0xoqUkEFVSdyouN6RRcHEQKXYenA5jsNgw6yeNnCEz3kbIv6gxdEs2tpI4nQ3XYhL+qhDx4nBSdbLji6lLlyT71DxzHBpicI1Ho5yraoZ+cfxDT/t52MZXtvnicwePxh75kCsSD9YfP2HjPiGF2Wd+Rx7SbrL8TFE8ZPCvHFVnYrzlt6nsOrdK7TN4sR3lQ6sbyv6EeXeD72iLw+57sq0mA2wS3aLxm0tOSjmOBQVlqAuIc8S3vojEnMNB8fnZisdhg3RSN3KbyacsZY/1ggxmZB1MB2xJRoCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CSPpnoL+ZLUYhETboE9Y83CxRMcVSCrMMRVElQjoK2s=;
 b=ZjR4AVvk9sXNgkkXg7oWraVFGIlMC7JyZcf0A6yhlefyXE5JJu7LCoiqdzy4bOeWW8MuY8ZYZred/hvCTzFVbcRcIM0z6fNp8qQFDpFTGgxYKksUiqknY89+5MUKkwpxqE9Y/59g/fSOwXGwyUoQygtuL6O4RR1894V/hSkGUH0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB14482.jpnprd01.prod.outlook.com
 (2603:1096:405:238::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:34:42 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:34:42 +0000
Message-ID: <87ecq5v23i.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 248/292] ASoC: samsung: bells: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:34:41 +0000
X-ClientProxiedBy: TYCP286CA0364.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:79::8) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB14482:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e796fbf-d9ae-4e09-42ea-08de20ba1aca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3sfkHSTJx1T8O3JAIY5UAnwmFnGtH4vSKqtbcIh+r28f2IgNV8pDX3kh6UNC?=
 =?us-ascii?Q?1lQrCDRF2OR7L1ze35nfPO+KOG+i/eVDDRh0UqT1r53VH9mdfDBjzJUvc3ij?=
 =?us-ascii?Q?2pFpIdbsMZW0qd4QtRVrgfsV9hmu5gJUdYA90XbiWNfmgNmjLzUixDnpVfM6?=
 =?us-ascii?Q?W85AZUI8It1sAdtmXGf/UKV/jPT9cyibdmeollIUYKvCx+J6QABDNqcf8vdr?=
 =?us-ascii?Q?laCQ5dGq4B3mlNpXPsrH4KQGMAgfFLG4yB5Zh8kZMh00wMYkAHOGwO4cKX/d?=
 =?us-ascii?Q?Pcz9FUqrytb2Q6VCgEhuKICdhQewD4VETTFon474J5KgG1nrIKaX4PfpQWd2?=
 =?us-ascii?Q?EPjmslP+YTefPgV+yxFe7bK6zB1ZzPvDSCA8baen3/Z5RLy4L7yxhAEONlko?=
 =?us-ascii?Q?mbq4ZCaXs+epHy5XJlTuU5hYLC3eYK95hC3zxLFXvvPC+XxRAC0Vx++saBik?=
 =?us-ascii?Q?6tKx4m3sP0PnUH1QzuKX8a9QqkEBMGtvZ5PlQAQspr56JfSPp2bH3p6RP73k?=
 =?us-ascii?Q?Qt2PVJY14vIaXMVwYs5wxVbdLU0RKLBxe4N7ZDipo0tElIZ+hlXuyNyHOR0p?=
 =?us-ascii?Q?+DlH3ZJ78Y1TcJgxZUIrz+UHM10gec3tCFpkEIrV8y2VeGni6JoPj3jx0hue?=
 =?us-ascii?Q?OwkhtorJJZI0IFgKnavmBUbbBdNy9ZgdSriqErIqLQ7mLtzKVtdI2FHOAFBH?=
 =?us-ascii?Q?qgftNQXyKwLo5ZAr4XhMjY6VzgQFJJBB000GpjXGfVdGE5LSTQrh7RJMBQsK?=
 =?us-ascii?Q?7G4zxPcQpASAuZQSsXl0/gS+Ecmyc6vWA7qQgck1YkdguXkMXb39dHoyUeQK?=
 =?us-ascii?Q?8j6J69b9bbiT+Mrn2YTXesuBllMX1MrM4dgt9jj/rbsTFCAeyv4OimtMga3F?=
 =?us-ascii?Q?jcbKzwN+W20wZoOHkkrshI16LHYSJXDXotqMxZ4qf2roOAMR1F31tphfnMSa?=
 =?us-ascii?Q?90CTZU17V95rpENfUKUNofn+qqrztTHfkWiocXxC7JSns0VLXj3JMZXNG06x?=
 =?us-ascii?Q?lYBMtwbpwSyjbNO42/77Zv14W2q/iFSXB6pXDlJxzgLZhZNFq7+QX22RtztJ?=
 =?us-ascii?Q?SZH0spAh5sgctYEsV/4MB/mfguplaNRiKmz9ZbwWGu4azQoI+l3zg/Nesd7I?=
 =?us-ascii?Q?jyCdlUHsw7+dSzSOG7W5Nyrz8Bk/tMT3SNfsa2LFtP6OEUEiexfzqe8hR2D4?=
 =?us-ascii?Q?9mXknG8X8M6udTU+Rs/OFxSJJHDtz8gg0ql2gNVIVEQg3Zup9fHG28bzLov2?=
 =?us-ascii?Q?nUR8tTdIRKH2uVMj/DRqpfRzqNWXMIHVvmLGJ5ubnCWQwFFWX9c2GPv+TKGh?=
 =?us-ascii?Q?3DCK+oVj+GH0QQvhCPEuC+4DABd+VYLGwKrpXKcyXCkVDPfOmfMWCigYela7?=
 =?us-ascii?Q?+YfC8yXSK2GU+0Q95iW2+Fu01Ci0j8Ctihd07gEbOXteGUmMdiV/dgoX20oZ?=
 =?us-ascii?Q?IavW+iVwRTgCPY86BGqzRHyF7d4XJ5CRvEKWNsxGpiJCFlQmijbOZOqKWRna?=
 =?us-ascii?Q?PKoNe5xzfJ+1FXC3AxqKFiKfNohpZF21LjMa?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BpvVNDW8UZAbH4ffS8g3JRiR7BZL0fYZtJ8nmbbA7Y0kmNFEYsR381MahINc?=
 =?us-ascii?Q?DXc88mPEg4PSuRRowJa5pmss3oozNKPiXKyJkMLOfajl/cCgtkhEYKbUl6yv?=
 =?us-ascii?Q?IOlTeKtHmr4cXVNanZb5SHB5aAY1KS0e5C6PmmTHarJmT2UcDqq9c3B2prSo?=
 =?us-ascii?Q?Dmt1C8YEMeW9rF1HlpCNP2S35S5XihpsX1G5vggnUiruBfgc8LIjzeq9EFkh?=
 =?us-ascii?Q?ZbpUZNdAy0ga7FbgQade3BpBbhZtVPwsWJPTHOVDXqpOmd9IJNXn7KrT6h6a?=
 =?us-ascii?Q?6Mt/2kv8wINWB70z5pNxUPEkJG52ntO2HuohnEFT/+5TqnkKSvk6JsPDEjzw?=
 =?us-ascii?Q?B/kxolk6v0mSwg1JbyW0axwcqAavQWbkjQkXIxGbVWY6bD3xfhvHKM9sBd5V?=
 =?us-ascii?Q?AKzXrXUN0DfGKLRDQ3M1qIjlwiBfwaef51LA2SY2IAET2XsXKqFoz6h/oT72?=
 =?us-ascii?Q?PCiXAfU9KslYD2FfRhoEZ6DragFn6Xxf7a7wCvcLJiCUC9cPUhIkL+v/3Vqu?=
 =?us-ascii?Q?h0FY+zyPQnAav5v0mbopmBcW07qROwDFJt12inLfqaB+m5Unk2EBQyZkst1M?=
 =?us-ascii?Q?28XTz4BOIYxudZLYl7YVlHthtfHCFLbZyXHvUz60JLbH9U2boI6Cohnb8C1n?=
 =?us-ascii?Q?kMAjHaVkXb9Iy/8Xnt+N9iAwL89ZC43G3wHTnyJaWQYulqN0KfDGrj9Tu4Xf?=
 =?us-ascii?Q?sLXV4tiJjYgstQPXbVPdiBOZfDGJxRobxfN/PRU57ZE8rtuGnoXA53H8TnHX?=
 =?us-ascii?Q?miJAwFKTqXtjxwA3aY06Fj1hl6GN02+EpnP08BRZeGeTaA3VDQ6LChX4Imke?=
 =?us-ascii?Q?FZNtJXV9LLJTvSbHb45xjl8sLWTxc9kU7gcqH8L+F9oDs/58IWOJRaQLXJaY?=
 =?us-ascii?Q?p3c6VICNMgY76OsecTP8mZKbBESg7Q4WRCrBZQz0C2Tpj872FAClpj3R3xYB?=
 =?us-ascii?Q?irnAuFksf8BDJ8/PDZ95f6RsW/S/RSDkYz9JaLim3mI5MwUcDeyjCTtCa3PS?=
 =?us-ascii?Q?FdM3MhpDhG0vS5X8RZ7rJ8m0vNOunjt1JKfL3KZRZ695ApF9o9LOnH/8ngwI?=
 =?us-ascii?Q?R8rv+/JnaUNuF6QAcA1/zfxXzp3WFFGh/CR/IjB7FZWDx9ta9PMWmmgjwYia?=
 =?us-ascii?Q?squEAG5s6cRQo5Cvoe6tpRLUQXVXq/uE66TUN7ih0RfD324vSoDgf0vh8Mvx?=
 =?us-ascii?Q?vqCLs7uc+b74YgkucBQBnVNJ0511JfXPHtM+hcn0DgEjYyz/zyr6+9AWAcOh?=
 =?us-ascii?Q?QjP5ZRzZ7WvPGraCYxJlJVkpOltM+K6OOfeUTPcCcNKcgQDMLSgzSVFlCjLJ?=
 =?us-ascii?Q?TomqHd5KCepF7Hl6zeF/OvTcKRQFvBD0v9q2Jr6OLgQ5eAbrOv7jK4XAIVdP?=
 =?us-ascii?Q?2pv4dxoCqR41YbZwzgoeHG1KApWuXTApvqx7CXg801YqjzpXRU+h6Ylxcw8w?=
 =?us-ascii?Q?gPHUzPuQNUagaEzmyAGm690FqnuKrxKeRu6KIe1F7J/LKhBmUWjnb4qjNUwL?=
 =?us-ascii?Q?0g4YOMBtrN1EprjbYEmAQZO3vIApFPJDFIAuzwwItkoe564hOb33CzvlXPRS?=
 =?us-ascii?Q?JXH0tkUBOuGweZJbsiWFxzHM0OL6XD4XbbaazQtwFG7af3hupHrvgXEmjbml?=
 =?us-ascii?Q?Vhp/9p3LXmKZ6kO8VScK8c0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e796fbf-d9ae-4e09-42ea-08de20ba1aca
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:34:41.9772
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qkNKfh1Hs7I4XfBA7NWyIF48f2EycGIbr6ZKasmvJsetPwmUfn9h+ihfTxTrsswrvz5XWDk0vcq9mPV5HDZYX60Y3gH0Qx+RwQE1g2JmmM7l6d+hDUyo0xIDaPJ+ghco
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB14482

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
 sound/soc/samsung/bells.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/samsung/bells.c b/sound/soc/samsung/bells.c
index 61ed5e69391a4..fc4963d3b99bf 100644
--- a/sound/soc/samsung/bells.c
+++ b/sound/soc/samsung/bells.c
@@ -62,12 +62,12 @@ static int bells_set_bias_level(struct snd_soc_card *card,
 	codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	component = codec_dai->component;
 
-	if (dapm->dev != codec_dai->dev)
+	if (snd_soc_dapm_to_dev(dapm) != codec_dai->dev)
 		return 0;
 
 	switch (level) {
 	case SND_SOC_BIAS_PREPARE:
-		if (dapm->bias_level != SND_SOC_BIAS_STANDBY)
+		if (snd_soc_dapm_get_bias_level(dapm) != SND_SOC_BIAS_STANDBY)
 			break;
 
 		ret = snd_soc_component_set_pll(component, WM5102_FLL1,
@@ -108,7 +108,7 @@ static int bells_set_bias_level_post(struct snd_soc_card *card,
 	codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	component = codec_dai->component;
 
-	if (dapm->dev != codec_dai->dev)
+	if (snd_soc_dapm_to_dev(dapm) != codec_dai->dev)
 		return 0;
 
 	switch (level) {
-- 
2.43.0

