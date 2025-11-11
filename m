Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011017.outbound.protection.outlook.com [52.101.125.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD3C221F00
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762821186; cv=fail; b=PGpwlltKLiSzpnsPA55QOShfBit8sxOlzTL/23HepNUym2qjkHrt7mvgn0BDGo7Pa02SyVXBY/w42KUkdIeawqYBh23iViRArobkzyKCrOqTL3iAfrSfxJS7VwkCgTPdf8fj2YwnLcB9hB3Rbu6JlErn5r4kzjYgPKJOil96CIE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762821186; c=relaxed/simple;
	bh=f5fxcAHCOfngKNGmSiBsWlZ5jQ7MwQGvW/CuJYPSDxE=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Y++85GzogI1pUh68wBQZhlbXZvNozleI9ysH2rRb7Y466hHXK5UdQC9wmjzp88zA4VRFE5RhfybEMguuO/1n3TsI5XQ+A6g8acstkflMs+KtlWXHZuB5m0Yeyo1ELsTUn6u9zvv3FBq7hp+JnOoiZpGWePgTwfd2NZS3IbZoKG0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=EBo442fr; arc=fail smtp.client-ip=52.101.125.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="EBo442fr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oxa/MSd2UdI8xxn9Rhurg8Xb55yYsPOrhLGjgAXAPdCYTILmsWYFpfwngXuEAU333Q3DK6Ok3Nnc/Q10C3Qiw6MqWNZqFH+S1kk/qPSe/EIEvw7ZyfJrv0rvEPMPA6yJDajm5JoJF2UxolyIuKnJBOGSnQom4PzjUBtAuQT0eFVSqnSfTtrEwLufYPkCj1SsIWI2AKU6bqHgCexrGaYQ6GmbY8S1x2S6NhOrYW7O1DO0K7kmX/XZLCh2vdSTEBetdURa9MU9jKOkqJQns43ntHaRvFEAiJIHkLE04upjjMrmdRbR2lZoiVX1pzNn9rET8aFrtkysIK7QS2AXIypoAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j0Exds90XB1lkXCraLSRmxZya/ZGepwMnY5dTv6jSj0=;
 b=pDl4bmHwZBO99C9bVBjWF8n7ctgPhTZLGGRrEsB8ElEaOO27ViRwRzCB/C0fdkXGA2h4jDYfR1W7yUc85oqecpVtmzn5uJzTGaP+znjHsvZsBYxlblhdLmrnJt28BDRadGY8JLsMmgaDLKaNrRW1Ob/xQ8YkY1YxOG/JKx6nn2uT/d2CfT6wHt1O2rdmTd67pdCopvZ4tIAj01G/WSvtbLcNQrRe+xlqIux96v915Q9NTxfgnT3FP6jK6XWXW9oNNCSjEB2AK4Ho41aiTyn4yJaDWS+hTBW/45rAHGolXsx7Pk2THxe59Asn6Oe4wAzpqPYdYKT2F7bp3lYRoo55RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j0Exds90XB1lkXCraLSRmxZya/ZGepwMnY5dTv6jSj0=;
 b=EBo442fry4pEOojJCQ+AI6I4/Ez9LBg/5mWl7Ak6CWNEYSDG2yvUVRu9bVC5T7wU969yjKdKdNm0rivmSi9d3N+Ki9qr4eei/PSGFvp9rbguI0B6eHih2VGTW63JoCuyMGJbV3NEodbEiYVVLsiE4vf/SyzSl36amWzok6maGw4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB7149.jpnprd01.prod.outlook.com
 (2603:1096:604:137::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:33:02 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:33:02 +0000
Message-ID: <87ikfhwgqq.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 220/292] ASoC: intel: boards: sof_maxim_common: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:33:01 +0000
X-ClientProxiedBy: TYCPR01CA0105.jpnprd01.prod.outlook.com
 (2603:1096:405:4::21) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB7149:EE_
X-MS-Office365-Filtering-Correlation-Id: 44d07cb6-39f5-417e-75e3-08de20b9df45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5rTWQmiPO4L84Bjq5OFLhxJ3XbtWcBaG4wTszbTDG+uhqSOfeBY3QAwDw7oz?=
 =?us-ascii?Q?Gd0/M9YunbrOS7HVyX6v7ptcQvlBGFtfyfV1qkRtE17ZY9VoqaeOzeHyGWKy?=
 =?us-ascii?Q?8ROw5dQqw4bgYJjEjMRhEYyriWqZrXvvnM0TtUhTbptOLcqgVaAJZ0N9A+d8?=
 =?us-ascii?Q?UOfcHhqEBpRYQlkx8wY8AZBFeeXDEy3Ut0pUKLndCtfXaRPgQIR8HugcB3Uv?=
 =?us-ascii?Q?UKabpVV9BOi4mixHfAc9q32hLLE+28UoVsYNsZ4dmg2/zBoOMWChoq/WaQF/?=
 =?us-ascii?Q?Capts9CzSkkoh3Vcuoj7j2YSnkThB9L7ygttxE7INtnBJG77WotNu8J6TGAM?=
 =?us-ascii?Q?I7e8+7i8v29NYcmAvFxYPQbkrJkRlEq00AxHDUQDzjuPjCDD2lJ31UxYLvmE?=
 =?us-ascii?Q?0fW3klzWEMj8/Oes2ffzVpzcTvd5Fa/7Ng5sU57paEg1UCkde8hDTsQXOKO6?=
 =?us-ascii?Q?ULc+FQuGpiDQp2KDcGQ6YaX8gSFgco1/UJQ5S+dBOwXuoXSxHwuiSO6ROA/u?=
 =?us-ascii?Q?tdmcgpE8Iko7zNXmYVyoOlRVEIJUDRSTUFsZYrsp4Ya6Paf7zqpdgoJU2tm/?=
 =?us-ascii?Q?hAGliC5O9gHGZbA/7XXnLsDAA7gvgtOzLubOtj91haLZmAzJL1U0xjrbKFW8?=
 =?us-ascii?Q?NRL17hJfsEyfRANEfpuFLZVM3Z3KZpAluNOu2NwwCrFplNSPuLEcuUxCmTZk?=
 =?us-ascii?Q?SDLE9Ka2gno39wV4xtlnTLgBq8ExiUOLhR3CdcmRprx9cM6ND9xcgV6/rTcH?=
 =?us-ascii?Q?wSCeCkVGnSeUGDysZQ9xR8oqXLZfwfa/CpIvWlvClPkOvkdgLzcPjvjKMYe3?=
 =?us-ascii?Q?kTy5Kwz1w219574An6zq8VkNxwx8i3EJGhck8RtV0hMa2YAY8Tj8txBLnq2i?=
 =?us-ascii?Q?yBXf/SU/kI2doi5/tKqXAc+XRYP7t3vVbmIUbo+IXfBwvv8G0lfRVWGKvPE8?=
 =?us-ascii?Q?W8Et+8XGoZiAQfhsCWS6ZwoRXEV4KtXefNjsYC4tDpcodsoC/5LZWoHVLtFu?=
 =?us-ascii?Q?d0K1FCzMKqI42RKQNbd05SVM73loVP47jaK/+6X5APskH8VpsRlCUY2bQZ2W?=
 =?us-ascii?Q?NKr/XP3Jcq7f7j1wqY/AX9owpGBD9KBaRO91LqmvZdAACTYuTzWsAJS9G6EV?=
 =?us-ascii?Q?5HcemJ9uvQJjKBY2Sy1MZTZadnFDXaJfQb2yocFWKn+1IluTLcX4kqK7G0gX?=
 =?us-ascii?Q?NL4UvOsT89aAq4BffatlMWlIOKjpK7MZxtXKVCLL0bmlrIfwOP/Mw0/ASR/6?=
 =?us-ascii?Q?kLRLPcqTDO0FIp3OG7dI4e2lPkuz5YHwaQWEoGaU4FBoG5lhMvCJtI608NlM?=
 =?us-ascii?Q?JunrTKeLGnTuIUMCppkKu4kvbvE8lwKucuVA4HoY4hRCUjYfFRQHfpJvoXd+?=
 =?us-ascii?Q?zsZPeCe9EQyohlQyp50L2Bi7WB9jl//7+uIGRyyZ80hf6bapjPMsfsYG54CE?=
 =?us-ascii?Q?R4+jiafn2kaQO29KJqLRXeAQ40LeqxEQeJWU+UUXuxO/13noQSvFu9VIdeLl?=
 =?us-ascii?Q?R/6iC3eFZD+Svcm+jjjrKQgtX1J2YRzEH4q6?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?W3jaAptxca8hEJsujLjKQM7O8aYmGppy36cmZ+6sYovhCm9qhUtj9mj2Q2Q/?=
 =?us-ascii?Q?13qvk2DHTRY+F1Ho2B+bUz3fXaUsSwHCLc4YEzvA5wjLtUU8pjg/XQ0uE7n0?=
 =?us-ascii?Q?8Jw2V2zgr3tZ+HeIVL2eVlORIz6ZfPtgigeTpcUjqYP4InOP47p6DNHaQ1KT?=
 =?us-ascii?Q?8guWt7DKRMKQoFf4sn5q0G8oZ3CRbwTMw5v8y3PkrLdhGsA7z8tIlahlZ7Jm?=
 =?us-ascii?Q?6jlJWlCzsKlF7KU3vVOHswFznhXpEa59aHB3hYJ/qHMn4UHiYbxcb3Txc8VF?=
 =?us-ascii?Q?ZXJpq2NogSUx1k4cxPQPxfosMasCEqCqTeZ54efq1VDUBe0JVqxSOfqNnUK5?=
 =?us-ascii?Q?jjS/lyeBjdzcpytDkutxa3hGapxiHBxWWNnl0Jbhn+X3orVKz/6kEIvYz+HQ?=
 =?us-ascii?Q?EVVOpAqHVFo+83rnNgLhF4jXhBc+duQQukQJnRYR6uCtAYF2/k4xUj60byLn?=
 =?us-ascii?Q?eVh7bEUUDnushXrBRPrq5orskvXA9UrD6dK7uK7IYcS3EASvNaDvyGhQ9fsk?=
 =?us-ascii?Q?7VcOXgSJOaVmz30q7kQ5+j2+pz9deWspf+9etAzdOKc32bR9ZJNQPAVHHezN?=
 =?us-ascii?Q?W+YT09ofS1dKl2RTTKDXBmqsAZu36sPWPZLyiTZQI4qH9jFeZEVZpER3P7b8?=
 =?us-ascii?Q?953o4gVspWZOaHlzS2MFmlHkvNFnnTf7f01+563gUcfNf/BuuTXUXCZWmSnH?=
 =?us-ascii?Q?YgZxZzbs3pym25llxE76f9o3e2r0UUXmplp9WOFx7T4oJRT1C2nJcvs24aze?=
 =?us-ascii?Q?PSAE/EpZL1Z39c5SJyzoUICemHZPicdvk4gUU3XVyDwXpqyrqSRBfLAO9NJD?=
 =?us-ascii?Q?8Oj6jFxAhdZaUx6lmAUFTfzOhJhsUbmd5I+GrSaHR3OHQ4ST4ct1AfHHrVL2?=
 =?us-ascii?Q?X8qmaLiqBV5UKjj4MVh7aJNkZ8sSeu2XOkHqOsvu+m/ArzrEWP1Ax9QwVzVE?=
 =?us-ascii?Q?Po7mpfpLRZa6xzg8fI9jUSSIMkpp8sxsIGfLN9HTpW7SVKJB7snjLtXcX/nF?=
 =?us-ascii?Q?4zvJesK4NyWS5Pxp7vR6Ba9qTUYh68URuPQaS3wkWjYfafuK6qq+f2CT1Fm8?=
 =?us-ascii?Q?icgVmpSP/eGbrHPI8DqwUbiylm+dN8c8nNU/E6+nGo/yLP2D5VoXjMQA3tFE?=
 =?us-ascii?Q?80f4NPO6UfN9mL7g9rM8I0/ggZH2snWr9l46HRbNiJN9DdMFXHjKqnxDo8UQ?=
 =?us-ascii?Q?MWIiWrUcnXlHWqH1zHWxNoGMvrxmdiY4kT7k0DcOeaQSYPdxIciw77zZJGFk?=
 =?us-ascii?Q?+c6X7gjiPO+zTvLzQBNJjOfjrQBcfMWrwJr6dhIA0ACDwQB61nuglM1UNEma?=
 =?us-ascii?Q?V5OHZ3Uker2DiMX3KJuohkCo9h1UTljvhuMhaWVJr5nVZWSCa+rBM90Su+sv?=
 =?us-ascii?Q?02xsW9oFNwa9j/KfRtsJCvY6eq9I1gSwZboosMJ7wP70WNUyA7hq/hlyxx3Q?=
 =?us-ascii?Q?1OiK5Hrjw+cK1ZytERCLaMKacFOBGQF/HW3X8qFzaUunFEuYRqkGi5yElJPr?=
 =?us-ascii?Q?gj3X2+5XE7HrOV6K9KCPnpQIIeCRCH6OPcsu4k/1gd87ateebaEHERuMhZdP?=
 =?us-ascii?Q?JvA6J7gSZs+NWKsizWztQ0AQt+6oEW8feE3WnYcelSITlv7OC9WretIwd/SY?=
 =?us-ascii?Q?suMr9ulfLldzPWcI9f4JM3I=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44d07cb6-39f5-417e-75e3-08de20b9df45
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:33:02.1708
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mo//X3zZ1Q0BeXjKe+p8wvrI7wDmRh1JG3vjh02rl8y3gdidZOf/znx5ydwggNkr0ZIu88qdOnH8VOhqDdSm21aUQGGlWGh+zHf2rgEiAaoARdjXelnQVqruEA0SCWe0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB7149

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
 sound/soc/intel/boards/sof_maxim_common.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/sound/soc/intel/boards/sof_maxim_common.c b/sound/soc/intel/boards/sof_maxim_common.c
index c98a67ae5e662..c3d0f697ff8de 100644
--- a/sound/soc/intel/boards/sof_maxim_common.c
+++ b/sound/soc/intel/boards/sof_maxim_common.c
@@ -201,8 +201,7 @@ static int max_98373_trigger(struct snd_pcm_substream *substream, int cmd)
 
 	cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	for_each_rtd_codec_dais(rtd, j, codec_dai) {
-		struct snd_soc_dapm_context *dapm =
-				snd_soc_component_get_dapm(cpu_dai->component);
+		struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(cpu_dai->component);
 		char pin_name[MAX_98373_PIN_NAME];
 
 		snprintf(pin_name, ARRAY_SIZE(pin_name), "%s Spk",
@@ -239,12 +238,13 @@ static const struct snd_soc_ops max_98373_ops = {
 static int max_98373_spk_codec_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
+	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
 	unsigned int num_codecs = get_num_codecs(MAX_98373_ACPI_HID);
 	int ret;
 
 	switch (num_codecs) {
 	case 2:
-		ret = snd_soc_dapm_new_controls(&card->dapm, maxim_2spk_widgets,
+		ret = snd_soc_dapm_new_controls(dapm, maxim_2spk_widgets,
 						ARRAY_SIZE(maxim_2spk_widgets));
 		if (ret) {
 			dev_err(rtd->dev, "fail to add max98373 widgets, ret %d\n",
@@ -260,7 +260,7 @@ static int max_98373_spk_codec_init(struct snd_soc_pcm_runtime *rtd)
 			return ret;
 		}
 
-		ret = snd_soc_dapm_add_routes(&card->dapm, max_98373_dapm_routes,
+		ret = snd_soc_dapm_add_routes(dapm, max_98373_dapm_routes,
 					      ARRAY_SIZE(max_98373_dapm_routes));
 		if (ret) {
 			dev_err(rtd->dev, "fail to add max98373 routes, ret %d\n",
@@ -416,13 +416,14 @@ static int max_98390_hw_params(struct snd_pcm_substream *substream,
 static int max_98390_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
+	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
 	unsigned int num_codecs = get_num_codecs(MAX_98390_ACPI_HID);
 	int ret;
 
 	switch (num_codecs) {
 	case 4:
 		/* add widgets/controls/dapm for tweeter speakers */
-		ret = snd_soc_dapm_new_controls(&card->dapm, max_98390_tt_dapm_widgets,
+		ret = snd_soc_dapm_new_controls(dapm, max_98390_tt_dapm_widgets,
 						ARRAY_SIZE(max_98390_tt_dapm_widgets));
 		if (ret) {
 			dev_err(rtd->dev, "unable to add tweeter dapm widgets, ret %d\n",
@@ -439,7 +440,7 @@ static int max_98390_init(struct snd_soc_pcm_runtime *rtd)
 			return ret;
 		}
 
-		ret = snd_soc_dapm_add_routes(&card->dapm, max_98390_tt_dapm_routes,
+		ret = snd_soc_dapm_add_routes(dapm, max_98390_tt_dapm_routes,
 					      ARRAY_SIZE(max_98390_tt_dapm_routes));
 		if (ret) {
 			dev_err(rtd->dev, "unable to add tweeter dapm routes, ret %d\n",
@@ -450,7 +451,7 @@ static int max_98390_init(struct snd_soc_pcm_runtime *rtd)
 		fallthrough;
 	case 2:
 		/* add regular speakers dapm route */
-		ret = snd_soc_dapm_new_controls(&card->dapm, maxim_2spk_widgets,
+		ret = snd_soc_dapm_new_controls(dapm, maxim_2spk_widgets,
 						ARRAY_SIZE(maxim_2spk_widgets));
 		if (ret) {
 			dev_err(rtd->dev, "fail to add max98390 woofer widgets, ret %d\n",
@@ -466,7 +467,7 @@ static int max_98390_init(struct snd_soc_pcm_runtime *rtd)
 			return ret;
 		}
 
-		ret = snd_soc_dapm_add_routes(&card->dapm, max_98390_dapm_routes,
+		ret = snd_soc_dapm_add_routes(dapm, max_98390_dapm_routes,
 					      ARRAY_SIZE(max_98390_dapm_routes));
 		if (ret) {
 			dev_err(rtd->dev, "unable to add dapm routes, ret %d\n",
@@ -564,9 +565,10 @@ static struct snd_soc_dai_link_component max_98360a_components[] = {
 static int max_98357a_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
+	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
 	int ret;
 
-	ret = snd_soc_dapm_new_controls(&card->dapm, max_98357a_dapm_widgets,
+	ret = snd_soc_dapm_new_controls(dapm, max_98357a_dapm_widgets,
 					ARRAY_SIZE(max_98357a_dapm_widgets));
 	if (ret) {
 		dev_err(rtd->dev, "unable to add dapm controls, ret %d\n", ret);
@@ -581,7 +583,7 @@ static int max_98357a_init(struct snd_soc_pcm_runtime *rtd)
 		return ret;
 	}
 
-	ret = snd_soc_dapm_add_routes(&card->dapm, max_98357a_dapm_routes,
+	ret = snd_soc_dapm_add_routes(dapm, max_98357a_dapm_routes,
 				      ARRAY_SIZE(max_98357a_dapm_routes));
 
 	if (ret)
-- 
2.43.0

