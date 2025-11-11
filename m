Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010070.outbound.protection.outlook.com [52.101.228.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08E4233140
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762821353; cv=fail; b=XZfwHOcJVnDkfaN4OpF3cPYrdwER6Ux4IIoLs8Y4fjHkElgt7l3qYZzHr7ux5bc8DpvdNZlkYJbbbq9zV1GvqdGnO7m7OK71L1Leh+oedf85MzcxF63JJG2fo2zFSAuIzH5A6bKf9xs1nvczQjXe+e6s+nm0gAsvdrep+qnqWRw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762821353; c=relaxed/simple;
	bh=MSHUv5QC8QPi5Ve4M8+pfV59Xl8ozhaT5W7SnWs9JwA=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=L9lyvKmHXKu7MWBDLokP6N5pWB7tLtXHKs9O5/cTF8/ws/wgl4yeN89nbj41q2Rj5Xjsj8s0A5a5EKQJ17JJTpj7ZdQOAwgQqKawM7zQdRY6J7Z+qAVfh0S956ojLM10BccoXA9M/llDSEsPFK/Ka/K8ql0gGt3pmfIrqx7DYBQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=oszcYqc1; arc=fail smtp.client-ip=52.101.228.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="oszcYqc1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ku0YRiPC/04NtRdvckpPzhvlohrJJhMRNF+lILhupyIkGKTJg61KVJCojHnRgO9Y7oYmsRCMaYH1jmSGpTc07Yk4UJds7U5wFo5QcEjx03jiA0KUlQgxRvkjuWr9x0lnHtK0oTmtWkNwWxTuF1qVD4wBapCbq8xu/XoRws7KMQT0ZgkCUlu2sqCMqy0KpSVIrWU6MtBLNx6meUfWLEoH+d56ypugg7CmLZu9lS2lkLQVs16Mbsl2N2HD3LOq0/ISsFroshYOWFBvpmsVSMz6yJvDYCVmmfKD3HvHVZMHjcUaFVbzdZqXQqSoYCC2tM1lOaIkCXBcIa6Z9uOo1WghgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YtNrUElbzithB3nemdDuEI8bvDaaY6NlzwQJ44MxZ6E=;
 b=UfDjz5N4eXH3yjxA50naEHA8lsf4UzxcH00i3nNqSpaV3Tl/eYVqhMFWTYuZA9jsTeEPtL+A34uutj6VoC5UQL0o3IYCakDizu8vF4vjmXAN/KuqWnnIqc6eX+qJ+AyEARCfc+0m+3VOLB+QG9OdUUkeIXK+CfJ9147g7guG6uD1YzOd8EpQ1Y1BphQdw+jqQgtt8QOlB9J5k3Txi67MpXSMUh7AH6TSZfNLJ6MxnWiOelEn4lLZl0WKymCmdtFlJhQehS71PPlP0ua0XFaNHqr8o4VxKYE3catHRRr2RYije0K80lF47+/YDRxhmyoH8ZyY2GNaNKLX5+a4XEtwWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YtNrUElbzithB3nemdDuEI8bvDaaY6NlzwQJ44MxZ6E=;
 b=oszcYqc1TMek2WwuO5hfTkjVyc5QbGEW2JTMgh5rMTnC1l7zoR+Pz0N6oE8fNgZKQ37LlcH6y7lgcrBFouyH7E5g52PHn8+niPDA6VY/l9dkC0QhViHX7AgQHEuNvl5xSsFiq+z7SbA9Io8k3lov4tCnyKB/aDqCA9307ZsU61o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB15789.jpnprd01.prod.outlook.com
 (2603:1096:405:2c6::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:35:49 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:35:49 +0000
Message-ID: <87o6p9tnh8.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 266/292] ASoC: sdw_utils: soc_sdw_rt_amp: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:35:48 +0000
X-ClientProxiedBy: TYCP286CA0290.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c8::7) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB15789:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b0ad58a-924e-4aea-1b8a-08de20ba42b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?o3AiGBtTTfAiPw7+GZTIfxUCJsAA1+Qxi4JLTmeZMDqYa9ETDyavRTP/wWu6?=
 =?us-ascii?Q?JlVy0o/eGsVD3L2oJKkQITRIsUCTdl8U63IFVRdiicj9UDDeXNv04E8Xyf5e?=
 =?us-ascii?Q?cDYsYpE6Rre+y6f2rXbTOV9srODQJx4WNV66lGPHYMZ0W1QT3V+3OOLx2RIU?=
 =?us-ascii?Q?BeZ6xY1K84sfwlGC5m63vuvNfDcs4MR/TXjOahBNy7zaY0dM5mCduMEAqkWw?=
 =?us-ascii?Q?DWDhc4gYd7jw6LYWIUuLDqz+Q42a75O60QQAwgGMh3wcg0o1MLAYTRo+roI/?=
 =?us-ascii?Q?0r2jPwqDoPCk3V8eujpfgz+ySFC1fgy1Wl45t5TRKgq0Ii302R/ij8AA6dYu?=
 =?us-ascii?Q?HNEN7zGgDUUzJsGUEQd87BIAJnd9YB1WPyoWvxkcFaiEXE2UCXBJfCh+t0uv?=
 =?us-ascii?Q?vsPgRTDEju6uvIatc7uRTEbnTgdz/3rl5jSddv31EE8FSCrwI3knuywnbtk1?=
 =?us-ascii?Q?UL6Ft/CkK21vd2Ts560fZjKi09JhBDrMScbd3H7eAAhzilsKXSVR09eCbYSG?=
 =?us-ascii?Q?fqQ0OnTbptPHAiZN4sXFJtnZlGPXd4MNUHqN5z1pc75g8m4j+pNuE10Hvwa5?=
 =?us-ascii?Q?azeYE+7CHxe7j1x9u2kJR/Gb+dWu5lQijbZySKTCCYvH8QGmsRBWM1R1nEb3?=
 =?us-ascii?Q?JBFW/rA9RQGLGACbITbwuDwSw1uhURx9b27buav1YUWD9v0V2Og52O9Kxzyo?=
 =?us-ascii?Q?ExM3nODi8p6McY7shjPP3OjG3+pYYnDNHu1dQ19ww46nWZ9eo1EmGhUDXsX5?=
 =?us-ascii?Q?kiP6dzdBzvL9nPqk6OI2gAtgmB8PRkO8r3CPpaUx1d4KSzP6uG3FvWduQSKq?=
 =?us-ascii?Q?bf28FM6bmnnsWlHkX+rvyhiPwu4hc/PcLgtesiNp8lP3ByPIfJaPbGw1zaYe?=
 =?us-ascii?Q?HtwRXN3B5NkA8RA0YUSTO7K7FSoLZXSXlsVC5hN/P6osdzDo974UBuKoLv9O?=
 =?us-ascii?Q?RGHYVW5x7hPhX6PUG0jHAOjwqI2aMUjNug858GUG4zWQd0TkaUxYYrskMHOW?=
 =?us-ascii?Q?wCYhZZIWTiKcgHEG2dwGflXNP7/LCgVP0LbBahGGOBSvLG3iK/81hDBBUGnC?=
 =?us-ascii?Q?rGfFz1ngRMbXwwpQh6jzy+UerkdPs7gnK+EXPJhLdVFb4k3Eazwi3zv+uDrC?=
 =?us-ascii?Q?+pLYNZcJSzzyhSJ9V53/BIQPp4Ft1ZOBr/ojbH+DsRO3dFJRmASNd6ynRoMH?=
 =?us-ascii?Q?s8Q2anF1DlmQ3cY0txgF5VvLA99zpK8USxHH++IYIBKgAmo2PiFCzj1Aqm5p?=
 =?us-ascii?Q?6ps6IUC92Ud++t0k3veYz3GSF9ksmOesFy3q8XXEMxvuKtk7NCx42VsHODkQ?=
 =?us-ascii?Q?1zhlc9KL5xEUlfhgKb8y6NWAO/lykFbkAcrVnOjr1MB50byV09UrAc0XELCL?=
 =?us-ascii?Q?dNXiODI58oiqTDODD6PXYYdz8kba569supGERtSMmkyXuYnq/OsZAeyUKwVa?=
 =?us-ascii?Q?EEVQw/hJp12EL2KFiB0tBCcfTppdGzhHCvgCRcFbrPlcjqhk2scSKmgNJhCb?=
 =?us-ascii?Q?Om6RK18i88Pr98cnSWlmEuzVq8NGo6j0fCDL?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PcY3kN0SX9QPdcS38M2TwH0oBviD8snZCy/gfQKe14KG9jnAU4d1SF9bsgSq?=
 =?us-ascii?Q?vownkI5ObAw4d1blGAFwzlumvwyzosrgFJHibCrb/gN7yV5cJHa5JuyheJGc?=
 =?us-ascii?Q?eUvycb4lXDiK8LATuErQsaR3Nud5EJk9F6hvhVVJibnYywzouzsLiymHfs6F?=
 =?us-ascii?Q?awmv8C/uwE29iu6ORT62Ii0pkYIKHgcpf1T+vEq3qX8FmPUhz4Gtp+rk6eXl?=
 =?us-ascii?Q?2dfz4u0VitkV14NF75b+yDEhh+gPVW9iwy7uRCaWPooaXpT9fSaK2brNczI7?=
 =?us-ascii?Q?QNwPttmzUtdjBmeqSb70ShVYj1cSRWEM4YefxjP5ZcwvinvWDgVKf2I1xhju?=
 =?us-ascii?Q?QPEE23eceAY5jyOhzKWBNSzdgvGXF7VwPQr0cSvyhX3+ghY6QxvZR+kfB3VX?=
 =?us-ascii?Q?0BHrl25XXF2fOG7pJSP65xLidVUOEY5u0X5GU4aLjJ5+1XhgoLIL5rHmvLSW?=
 =?us-ascii?Q?+dkKuerbETRzstKfSx4IvHVRg9vNR8eYMQoko4sGwRYEO/XgUrVguPRm9QMV?=
 =?us-ascii?Q?bcHgPE13/r6m4yrqxoRrUfMsdtexglKY7T7Expk8QPIAn7JtTLX6owD2Nelh?=
 =?us-ascii?Q?v67ja7+l6lYc6QI9pBGcUaZ1MEk+MVHSlydzt1ePjcWkpA17j7IZIpz2f9jr?=
 =?us-ascii?Q?kMr9gAwfRNstEIamtTHzIzGhDp1ZqpefFNefKcAQh/W7ru3NZCMOnXUeNCZg?=
 =?us-ascii?Q?p5Pkt1yz21LvgJT/9RNU+oq2ZX/geu1IEz1NGNPEMzS2Qkzgye/ShO0YsaQT?=
 =?us-ascii?Q?C9/B1DQOlAEu9Nru60B2BmKu3RyCUclbAbchDHTE2PMndIgmK6c7cMAd5812?=
 =?us-ascii?Q?nKrC0RSCwmuATVAG+YTdFMjq6DQ/m4pk3nztWrVqT2q1k/pmLz+Q2j8dVE+v?=
 =?us-ascii?Q?wd+3QkNqZI/nXwslNbcHYaFtGSUzfyRJvFHWAVMCJQ3vEwVuYyzAMb85Xaj4?=
 =?us-ascii?Q?d4kWuxCreE3plArSbPTFOHZFqnui+na14KqGG1NGh+Y1wyzJTNzcRLE9vMWR?=
 =?us-ascii?Q?fyW68tMn5Wsk+DZaWgq84KxIf0Rhkw1HHCI2CncWLg2fa5cVpDK8bpakBgop?=
 =?us-ascii?Q?excDDsvuqea2O+DvwOHqQmNHIkBnhCvhdgbXSB32dsl/pBOXsZno1Me42a9t?=
 =?us-ascii?Q?V3JoJlSPwUYDNU4HX/yMEYYlKRqSwv9jjQd39L7yYr4sJDvlFcERDdf4QPpS?=
 =?us-ascii?Q?U4swiZTmg8mIVr830NL+utJNS5NITc/OzWguJpBtNlxumnKi+HwvVwvqi6Gn?=
 =?us-ascii?Q?XmQSj7pLfHUoGSJjFIpXarWqJo1J8d85gi8eGYAYs479pp9zn/HR7cCLGT4f?=
 =?us-ascii?Q?/db8WaVu5DMI1LqU48uuzqzmB/asmGlgQ4sALyHoGh0ZQYBdYTr4Q2bER7PO?=
 =?us-ascii?Q?y5Cv9FZhKhVu3xL66YBe0E18zecnq8SimkHAiu6xhiyPK+rvS0G9hs742UeI?=
 =?us-ascii?Q?ZPcJ/dzo3xxKs9tljbqcx3kUnzat09WyArPYQFPpRuKwiwhMZ4GB2SIBjHux?=
 =?us-ascii?Q?dkVeJ5UjbMjRpCTrFYEDKEUlORshl96M7RJA4gDv/RD51oYddrGmGNREf9Mm?=
 =?us-ascii?Q?GOlVq9HhQFRKhmQ8Ox3HFwUhr+DTkZ9hINwLfgUls7naJuZQUsv33w5Ns91I?=
 =?us-ascii?Q?cvaKQGXbGQyB3OOn3QJ1wRU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b0ad58a-924e-4aea-1b8a-08de20ba42b8
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:35:48.9816
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0aqJe53I/RMvufkWJWpuS34tK0OiwHSN9je+7ZI0fQtGylbz9nscwQ2Odt8+rGD1dMYKIUo9AkfECGjW4IUtBxJtprY4lh0hZRHrVmXgQiYwpDuHuPcyFZL/irGzdSwz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB15789

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
 sound/soc/sdw_utils/soc_sdw_rt_amp.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sdw_utils/soc_sdw_rt_amp.c b/sound/soc/sdw_utils/soc_sdw_rt_amp.c
index 76ee24b8eee4a..4e9b08cb653d1 100644
--- a/sound/soc/sdw_utils/soc_sdw_rt_amp.c
+++ b/sound/soc/sdw_utils/soc_sdw_rt_amp.c
@@ -187,6 +187,7 @@ static const struct snd_soc_dapm_route *get_codec_name_and_route(struct snd_soc_
 int asoc_sdw_rt_amp_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
 {
 	struct snd_soc_card *card = rtd->card;
+	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
 	const struct snd_soc_dapm_route *rt_amp_map;
 	char codec_name[CODEC_NAME_SIZE];
 	struct snd_soc_dai *codec_dai;
@@ -197,9 +198,9 @@ int asoc_sdw_rt_amp_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc
 
 	for_each_rtd_codec_dais(rtd, i, codec_dai) {
 		if (strstr(codec_dai->component->name_prefix, "-1"))
-			ret = snd_soc_dapm_add_routes(&card->dapm, rt_amp_map, 2);
+			ret = snd_soc_dapm_add_routes(dapm, rt_amp_map, 2);
 		else if (strstr(codec_dai->component->name_prefix, "-2"))
-			ret = snd_soc_dapm_add_routes(&card->dapm, rt_amp_map + 2, 2);
+			ret = snd_soc_dapm_add_routes(dapm, rt_amp_map + 2, 2);
 	}
 
 	return ret;
-- 
2.43.0

