Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011009.outbound.protection.outlook.com [52.101.125.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7609F222568
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762821212; cv=fail; b=ZukjEOq30Y5ggk5S113n+boLqPOuOyZPAPlEW4K1N/Gdzq/50azsJDVQxJ1pLHXI17KixvkeCWZ4I8h3H6MnO83GKSXv3YnmV8aqOXF6Xw8yFfhwI1NniUqtbIq+yTDzI/uooJx5jvLPgGTBTmZLYTK+tnPawEUKVGHgbId0bgU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762821212; c=relaxed/simple;
	bh=L9GLyEfDoN5wqgZPjLRc/3X2KZEU5LSeuK/G+DmFQ/Q=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=BZO66lSYpjmTMdkAOJtpBuCwtGgfUvBa9JkriwEuIyXcFVlgwjxFo3lHszCRIuvsLL5S55vCxIBGsRO1aoJ9Wk32P/Y9enWa/F0q3lTYZB5T7ACkBG1k7UdZ+hF8UAP8HMgELoQdXmFS0+dblARkIQlj9JMgwH1ir/eZtsU56Q8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=bUZO5JtW; arc=fail smtp.client-ip=52.101.125.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="bUZO5JtW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nd36QWXo4Ufx0IO95GbwhblXh1De3wVvNFJQdlPc5EkTBQdy7EW3vWDugeEKzek3KGQH8zs/0EcSTpdcJ1T5oVpiPbGNUp3/6wWg7siJFNDZgfj6VYuUf7fhXqI7y3uUUVd3lS191aN+V1ZbNGnWFixAceJY/A3UXJxktAEdF8/m5QMrLY2JYhMvIBBnzJZOm3qJw/M7mmTqEhSr+iw8Wb+4mFfcArX/rwizAAfSH4At/zfTXgegmG9Z4A5CEt/qPaDSKrEm7eYora1nV0go48DWbpGufBrmDhz3HFfMl6BRm8S4wKAgn7/RvEBlf4uFQNEv+dE7BJUoDgBmQc2FQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dpg+ZOxglNyy7LNIO+dlDScIcbsCzTGkonm6yj7hFkw=;
 b=q62SkUxwcIkvtS6U6JMY5P8EHxSDKVZ7fLv99ZyIUebMnJvtXEEeDXAqHCcSJ4pbq3xaLZi5Q+gpo2ufRwu56zsCGPnpjtXoewHsay+7eG9r/Cfzb34P2tou8ptW1Yz+EsTzYEHKVyRWg1thvTaflXpnbAEMQrSXtEkpVZ1mDEY2Y+7z1r6Dr/1k2nn/0OZZDadDfcFE+qBhHdNP5DcJWfj6Ma/PCnteGvVLBlu1kMeR0w/l1Y5UMtBtBwOKvC/lG8Utx/AndxFwmpU+Fps7HlmEMuXNFx0QyCo0Hki3/PZpOymTrtH3D1D02vPsx1ciEGOCY5QQ/OYMkstano2p2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dpg+ZOxglNyy7LNIO+dlDScIcbsCzTGkonm6yj7hFkw=;
 b=bUZO5JtWtYoAMLZMOcJb3qxFvePIt50MI22mbsKNulnR89ZZkxJ/hTRrJZepgfVABzEaZGDg4+RBySYNlF89NpXf5jVEJmve42Encwz72uQ/H8u7h5T9KkORVc/OV2vWpb1GShMmWMF7EisnM3iUdr8uAkRG9R8v9EqU2m5sTes=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB7149.jpnprd01.prod.outlook.com
 (2603:1096:604:137::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:33:28 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:33:28 +0000
Message-ID: <878qgdwgpz.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 227/292] ASoC: mediatek: mtk-dsp-sof-common: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:33:28 +0000
X-ClientProxiedBy: TYCP286CA0157.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:383::12) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB7149:EE_
X-MS-Office365-Filtering-Correlation-Id: 6207bd9f-5c41-48f6-df6d-08de20b9eef9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?h9x9PM7vFpv5/qYXQ0NZTHmUdp7G/4LRHWAaZOVOpmkl9Ybg1BeczgH255Ul?=
 =?us-ascii?Q?yqPKJ/E+OqVpc2/rYGzJ1Pd3JHDHa9IR3WryW2cH5zFsVfIils56XsPf5X8G?=
 =?us-ascii?Q?/V5OrmUveuNbB6/R2BvFsDR7EckwTVVp3myrLCrLve2evns+3PC8Lwv9UQud?=
 =?us-ascii?Q?JanVOMao5vLhN0w01s2+SElBe63rmB73v3gAJqwmMn4hsOwEheqDNqUXLrQB?=
 =?us-ascii?Q?89lwe6stF8l8elFGt6z96ybKdwgf2YNeYq/SXjKVpz85MrRjv7hAXHcUz7E9?=
 =?us-ascii?Q?oFl3r/UPXXqxZwzvfJfN4zc6r/LIqfFWrj17nyNhmztGPdGBvNK7Uewl+dX6?=
 =?us-ascii?Q?6Sti6vVzRpEfmcS2nbO668lhK/XIEh4mhmsn3qOFuSXzixBhR1D+wavfLiLs?=
 =?us-ascii?Q?+BpSYqlzEueSeiLUJY+waQ4raZ9+y4rZkEiJ/Z4FmnoNJUL2ajiQZQBHhTbO?=
 =?us-ascii?Q?zS/NJqO7OixCLKtYBgfPi+mtRoMoovzDZ/981t0+1vpypnmfb0tq7HILlIl3?=
 =?us-ascii?Q?nT082xAovjVZENHsTIu0FLMBgke9blxnXKIgnNbQLW9tzKOrCDPaRyDnIsSC?=
 =?us-ascii?Q?l8PPrVnrsDDzfE19PVA/0MxMLcRbXAmvNtAPiEpMHg3ZTqnVlhHnQuNJiU6U?=
 =?us-ascii?Q?vtfwduE6kxU46knXRRf6GCg0dcAZ9GmrRf/EeEKoC2p01p0Yyqnl4XoC7TZG?=
 =?us-ascii?Q?f9wAMY6W8mSwDZhFD5Oi44ldNWtqZgpk8/ll03QI8FdgKnnVRprF7LJmuyvx?=
 =?us-ascii?Q?jBtYDzBvYuI8gfTyJ0XEm789MnF0pzB8ecP1ZlFrfO4dXCun8g8ck+5oIurQ?=
 =?us-ascii?Q?7tD18srqc85uWx2sDavOZuUwqv8osb44ZlzWaVtt/c0z6Tji0pzWYAdnrG8n?=
 =?us-ascii?Q?uY+ISw3TijyvvPUKTte6lQ9Qp+cpExgs3RsxSnmiU4QqYuuw+Ybwex3ebgsh?=
 =?us-ascii?Q?5GtgL+ctyV2tOXjnUeC54RE9/yb3oYTWRO2liSHoGXTKCeDhCWuiuBQ3UREa?=
 =?us-ascii?Q?/HP7RH4xCUUuio3xhrQzAxDr7bi5a8tci5V/FZ1y7Nt1lUJ+c9pYSQpvYdB1?=
 =?us-ascii?Q?epnNGtHowbAllgLwjhQwQQR4iuS1+pb5gZqVobOlfb9Sg0g9aXnsHqAhUP5X?=
 =?us-ascii?Q?dBMQrSuR6sKv79UWfxRFNRRt227fILa2BGQowFLCsKwtxfEULKG11Iu8kIDk?=
 =?us-ascii?Q?pa2KH62eUTXFFYqLE87wYZ28CvJ3w3ljY5H6zRAWP2OVUdp8BcVPxXlFRAaz?=
 =?us-ascii?Q?g4lOsDBXtr00//ngeM0m+o/bll78ccYfz0t3onha+6JNqDMMyT1Weo5nyjW3?=
 =?us-ascii?Q?zjv270jQNKhmGlVIiVE+9gokfAeL8W1kl2YXNOPzdbh168C6WUi94cA8FmKO?=
 =?us-ascii?Q?n8eTgZnf8uk9jn4EszcEDZKXxgLvPZQUMHecNWvnLdg4b4PGX3pTyrMK9rIC?=
 =?us-ascii?Q?eiK8aAtyS8YQXfOyyTrI+ygiS8NV07GZtiWMXPhnBxdvkyokOITCvdQqzAi5?=
 =?us-ascii?Q?pLVUD+mEGkAxN3zK2PosVf+xGiDQgG48Onmo?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zGgWcXwXIleHCZCP/VIwV/ldFiwP50joSxw/gLSWrEmTuaTzPS6rGjaHmKwN?=
 =?us-ascii?Q?qxK36me8S3iuhIBvWiXLdd6DSWubsv6nVjuwV/rfHG54uC3RcwIyAm8clqmm?=
 =?us-ascii?Q?MBiarBxmaaTpKTXZ0moQeORU6R4LuQAckxjW2ioABkmAPvgHJDHnwOlyFty1?=
 =?us-ascii?Q?tkpQYymX43D38ysPG8voxnW0gAf+RAbcNOv7gV6k1A3mQELtGGAOThgAt3XQ?=
 =?us-ascii?Q?S9BkKdTu5yLZo5N5/ar+YJD7hbQxPPC82ChR4EYiVXrEsoVYunC+rpNJ1b2w?=
 =?us-ascii?Q?11F3z0yyGH3bcYcqNJ6hc9to0BED1DWZYZIq3aEuxQk211ArfUD831vuwVtz?=
 =?us-ascii?Q?vKpjTW68uxSAkJkomwEN5lpBnutJdI9i/xKkG7+krwExCCmxFZCMqjgVndYJ?=
 =?us-ascii?Q?d88mtZ/M5TLz7jZMcrggGaskvq4OXVw/Zolli0iIEyZTIkbUv+8Rq8EIMyur?=
 =?us-ascii?Q?HzCJSHVlztVkWzOtYg0ZZwqhQ8fbxX/XdU9VchXGQTb0s4VEAZl8yr4o6bIy?=
 =?us-ascii?Q?zJshSaTrL3QtsUooPju5k04bzqE0ZgmC721yxAJJABJ7tLa7hhmx2ZNQoeyM?=
 =?us-ascii?Q?cfJhrOc0Zxt/ttf9etvxU6CqZgs1Z20vM87v6kurI6ySPwrZYtXz5fI7CoNR?=
 =?us-ascii?Q?KLWUOTcwWitGlM7+T/l3AQ11AhLdWd4TZN7ruH0KEGun2jU0VobOy75FTowP?=
 =?us-ascii?Q?Wtz8QjpsXKyXaUF8GQx4aqObfIsTSx4yyXU0ri7HCNSPqBV3fCSQTN+6CbKe?=
 =?us-ascii?Q?PEJjqoX7cu7hNVv7K3YgAbCXQu3gjpmIVpzCCzg+M0XvdsMemM6T55dOhApN?=
 =?us-ascii?Q?B7KGpWoaXYv3lBTTWcvMGiiCuKsLVGWnzRD8R2Wh9NUyBYXMF6JuuSzTyWAK?=
 =?us-ascii?Q?5Xqayns/Qrer8Qlp1zciQWjK52Iscxy4N2uhS0rVrA0a0cYJzxKnAS/WTClZ?=
 =?us-ascii?Q?3TE3J4fSNbFhqXbNWMltmXs4EwCbqGHRKychuNXP4mqrFOBKxWNcz/ai6anB?=
 =?us-ascii?Q?ur2Gaz02o5ql44eOBVALK6W6XmwU7YZZXb8vh9W+M4v/EqTKIM4uQSMGHbXj?=
 =?us-ascii?Q?93ji0PwmxXUn7ABhzDGFryQk5DkroPkL4so08qxKaIrS6I5rOi55CZPySOCs?=
 =?us-ascii?Q?A/N95ze4TQx+GCrPSxu0Wkpr+YNlLJvtaxcoaRPUYnKksvjsl3K+2wv8xSJs?=
 =?us-ascii?Q?pQUwKYfluftgG6e4y8boBXLmEQ03Yv+a4URbHzHdg21u4Vj7BZkIQOMI906n?=
 =?us-ascii?Q?OaIAt11RV2bA8b8A6G9AJzr5cFO71SiTMNI6fHwc9pNJgamV7r87eTBB2g4R?=
 =?us-ascii?Q?K+78Cupe4rCemca2sone/L8ofqM/ot/E/E/PkEIG+Fw16j/YCC9cvBRNqhOD?=
 =?us-ascii?Q?d8q4JCT9icY2oQG2Hzwa4+z1OdGHusfMh23ruJNqzURitnSUN0B/dQI+D6mH?=
 =?us-ascii?Q?L4gOsNksh0UT9RT4i0yLEwySM5sZrN/+FHX3Zupk0LR51eH9ySduP7rn3Y4F?=
 =?us-ascii?Q?/a/wT/9b+A7+v05QMl7vGSpt1JzU/RBj50VRnHSV2yxMY+eoOWhoVWhC/s/T?=
 =?us-ascii?Q?XipfQxT6KSYu6mxtM3FrY1gbxD/D5AzlLjpYgEm0RUQbru5wjqV78P1g4iQo?=
 =?us-ascii?Q?7oNI29YtuoQqG1ezxjSf/F0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6207bd9f-5c41-48f6-df6d-08de20b9eef9
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:33:28.4918
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Znp+Ki3tUQsA0xkwmVUds6hWuuFApOyPcZTJeyn0YhVk0pP8yi41f9lmUnriUCySiMonUr3Ye2bnSNcUx/p0EEPt58yFw7W1KuTtM40BGPhB+nA/mrgZa7Y5OFa+UHb
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
 sound/soc/mediatek/common/mtk-dsp-sof-common.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/common/mtk-dsp-sof-common.c b/sound/soc/mediatek/common/mtk-dsp-sof-common.c
index bca758dca2c9a..fd10616a08a06 100644
--- a/sound/soc/mediatek/common/mtk-dsp-sof-common.c
+++ b/sound/soc/mediatek/common/mtk-dsp-sof-common.c
@@ -139,6 +139,7 @@ static int mtk_sof_check_tplg_be_dai_link_fixup(struct snd_soc_pcm_runtime *rtd,
 
 int mtk_sof_card_late_probe(struct snd_soc_card *card)
 {
+	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
 	struct snd_soc_pcm_runtime *rtd;
 	struct snd_soc_component *sof_comp = NULL;
 	struct mtk_soc_card_data *soc_card_data =
@@ -204,13 +205,13 @@ int mtk_sof_card_late_probe(struct snd_soc_card *card)
 					snd_soc_dapm_widget_for_each_sink_path(widget, p) {
 						route.source = conn->sof_dma;
 						route.sink = p->sink->name;
-						snd_soc_dapm_add_routes(&card->dapm, &route, 1);
+						snd_soc_dapm_add_routes(dapm, &route, 1);
 					}
 				} else if (conn->stream_dir == SNDRV_PCM_STREAM_PLAYBACK && widget) {
 					snd_soc_dapm_widget_for_each_source_path(widget, p) {
 						route.source = p->source->name;
 						route.sink = conn->sof_dma;
-						snd_soc_dapm_add_routes(&card->dapm, &route, 1);
+						snd_soc_dapm_add_routes(dapm, &route, 1);
 					}
 				} else {
 					dev_err(cpu_dai->dev, "stream dir and widget not pair\n");
-- 
2.43.0

