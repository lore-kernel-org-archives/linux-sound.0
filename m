Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011016.outbound.protection.outlook.com [40.107.74.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 381171F5617
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762821076; cv=fail; b=uZJ2NsLauTjygPRcE4IiDLGoFmSM+NwX1VjwAiytGhn1tmywFt5uAAa44ytdat9GnkejkixPuIoIBhwU2WiAFW9WCP2e5y7LrMLDYCNHf1jktTWEt9Sf12fnaEKtsZ/YDiLg1emTR1aMmCfOTM6hWpw5Kke0kn06f5a03zWFPXI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762821076; c=relaxed/simple;
	bh=n2y58wp29Ws8cNKWW091nW6dfpOTIogc5uAN3YTDRU8=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=pcTK+9aqrObEQtZ1wE/izTdbFirj6RUNC8vLKY5TGl0E0Up/sVbKFpCKJv+HLMKgo+bh5ngbgdZP+xY/FSjN6b2xbcC1PpO+QScwdW7XrkMfh6FLz1qPTRSZoGOZgAX3QU33NYr77K+kGIWVhmqIySPyCKEF40P3XNuLMLr4plY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Rd30fjVj; arc=fail smtp.client-ip=40.107.74.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Rd30fjVj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PaQ606mHodnG7xzDSAOFkGiKEhkYZNEIbKN/yD00OMXAKAQ2rXxT4TJy3qnjoi8gY3XVVViKJvPs8znL+GSsd3LGccAmZiNUEhF9Zaq6tngOrm+UrEf82NfqsT3Q93RONPcnEYnOUZDAS/Du74abkbByRw81Jjrg6VKzr2VxrJIakvFlHADnn1m/oBRRjdkdYG1oix+t6PrAWTsXSEVwMFyIcO3dEAl7l6MjWcantOcS5Wvk1hoF+BDDCJy5OO56+g75sg4Lc/tuyNH/ssEeA0WTcPLRZt1N9t0Y+wm3Ze3jFvWLg/PP1IU3casqfuauVrKEFxW/m/5UjHIpUdwQsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7pswuf/v+a140hoU0d9XewVUUghcow7nK5RJKEoVX+k=;
 b=FcNt36KWtrs/tnjm4c9vdImSK7BQICpYQCgDcTSRMq7wbPgmAAwxfSEE1tmaeQ3lSg3BSlGgAJN9ABPbxtEufPGNE0rElHqdmqdYgdnU+xF4k7K0O+iVRdpQOxts+Rr9tTgYnbaTC9GFh1Bl6MEnZtMxz63kQT8dY/NU9GzqTLoQhxazjfHScP5a81JsMSjQRDAxpz6isN2drZ1N4sRUrKJo1zGwZ7TUF4K4i1DTT9zFF2Dmi35sn1F4nf2ZnH7yvNZjfa4xSgFPflSmaA+fyvOwltsG5n269P6wTBcaU/oeb/hYA01Cpuq9OFBOctUbRi7vvm9HMdn+eQQjK7IYhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7pswuf/v+a140hoU0d9XewVUUghcow7nK5RJKEoVX+k=;
 b=Rd30fjVjxoGcL4eSO1BOh8DU1jBb4pO0h6JVQSJQyGHSbwxsLALy3z2Horki2NX0oLB1qkaGIqzMVXSUZFo39PzIhxmf531GfTvppS2AQ1IbL5IulZ0kr7u3HD4E+kz4xcR2x08F1GNVCAiV1tistlgM1OUT4ZuiWdlsh2uly94=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB9810.jpnprd01.prod.outlook.com
 (2603:1096:400:222::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:31:11 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:31:11 +0000
Message-ID: <87bjl9xve8.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 200/292] ASoC: intel: avs: es8336: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:31:11 +0000
X-ClientProxiedBy: TYCP301CA0060.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:384::9) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB9810:EE_
X-MS-Office365-Filtering-Correlation-Id: ea583ec7-9f53-497f-b154-08de20b99d4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iNgCR6v3Fk5xi7SqhdSeiG2AoJxpaIQZdpSmyqFF0TMxDQ/NjKu3i9yPrb8o?=
 =?us-ascii?Q?ZUrW1UspUEhhLnE+JDexKOxruDJGt6f+MlmgG7ldmwkfLatZz8vQR1YVJ5rn?=
 =?us-ascii?Q?oL0bbmGCTd9k75jGRkrbOFtwpWTytvzWNCTfCmnievdA4nK/5zI04IFGgaBN?=
 =?us-ascii?Q?Nd6lVjJKRca4jvFr31g1pHsY01c77FoUhR0Bo7Qmok4mOujNuTx8g++xwRVP?=
 =?us-ascii?Q?3xFTf2p7lrpUQVB0V9iqhDnYVQ07UfdikHI/9Pp3wGv4Yg+G613T02RoTlQR?=
 =?us-ascii?Q?yGhKyM3XBhyzhRRsaw8vduihP/6a+p9kqPoRAco/I0+I6Jy+3A9YzdREe/Hh?=
 =?us-ascii?Q?CZ3AoVl8TLR3zM2keqJhNtAkSN+hN0C0HLM7n4zdA8EIUQF+/JMEfQZM76Kj?=
 =?us-ascii?Q?jp0dngGClGGhUnfcf1kWBKW+T8ZKE2RbfeS6Rpur3vvEFNHoYxUeG/N0kNqV?=
 =?us-ascii?Q?Vd/Yx7hP8q5BxmdsTZMF6DUW4K5VVMnzskGdsomqew4FLM78Mt2XDOyQj6Rp?=
 =?us-ascii?Q?MKnrNrsqph6Ju20S0124sV6LLA+EYUdfDd+xsdwiBmoN8yReAvYAoQxxN8H2?=
 =?us-ascii?Q?MikzjbbSh8LiDX7Fx8RuLPBipKhfx8CMtbbQ1/TeG1uvlYUaLenNuoEounJ9?=
 =?us-ascii?Q?o7VdHT9tEL620IJLe0LVA0cwqgnMyM2ggKX/i8PY3zdUOBngFo6/KvouWGb0?=
 =?us-ascii?Q?dhxbIz88s7RQLBxHoJxOb0i7+726s3yxyXoqGzghTYwKwGQ+GFertnFkYeHn?=
 =?us-ascii?Q?1VImCpKWdbT3PCDT9bDI1RVXmeTkEg4vW+dh12fjJApOlJiomdDzxlNcHuM8?=
 =?us-ascii?Q?BhCTZSMq5WjPLMcP2Putx2eq7mhQNGQRvpkIxzhM2kZEeH4O3wvN3aGin7Of?=
 =?us-ascii?Q?1Gm35SYxcB75vN9UyAckZwcO7xrXeF/UM6ec5H1SGJzr89jMYIcz/Xriq9qG?=
 =?us-ascii?Q?EgSLwz2BAeGXSE0b5KI/NrpPMp5tkFY1Zot9N0Ue0OxA+Mpzg2GAvVO56pHh?=
 =?us-ascii?Q?iJxBC+JnMtA3lipKPJNQUSxUkS2zTJjzJXzO3iqoz/zYlzsJBa9+g3u7ywE2?=
 =?us-ascii?Q?7ZYJb9E4tsjkom1V3XwFbSr6C7qOiA/vBeestohEvR07JdrkJr/Ec6PkCTAB?=
 =?us-ascii?Q?L3iAj3P47YAsRLTDUrClay8phT+SW5LuIX4GOsme13GOAoPzKgs/Cv3kPKGB?=
 =?us-ascii?Q?NXnmHyQ81mxLQ7Srpri5qUkklGTmV/GxjEYbXSdZTC/qJd2saCXJtNNb9JcW?=
 =?us-ascii?Q?Wj4qXO2DdCfytwyoLN+29rrRGEmHvgLc/UkMZNYAdzc9Eu2A3dhw0eQomTVD?=
 =?us-ascii?Q?l6Y+GlE4qfTdX78kMlZN9lLImhmdUSwoG8YwxUACRXCFB5/Dz/nOvAljFjKf?=
 =?us-ascii?Q?+zv4U+hOaBZZkBKNtM9kyTw2V0EaMLh6n/YBxV3JwwzfarEHbujHI+z8yTkC?=
 =?us-ascii?Q?J07PA9q8XWyAY8aZAp+ShN86nSfepi57TFbOnwYPo7gTnWHb9j8Kd+Mj+jR7?=
 =?us-ascii?Q?dH7sELLmoXQM94Xr6DBUBCy5j1mnJT0VaKAp?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ouR53ibVoxW45Xdkc7XzGkfsqJX2xZtoebb30FAfVXMxkbDD1LKkmUHjBH7d?=
 =?us-ascii?Q?O6RfP+Lday/4234CllQc/hRRb+Eqbylf0kTis1k/JMpcNCDcWkpp6BnixQvi?=
 =?us-ascii?Q?oEvF5DKIAXwgjYY1sfv7GZuyUUNSPyY0OdtsOrlmfKigRaj8gmDQT0C81udv?=
 =?us-ascii?Q?xZ7leupA/ZaKLO9gdeV7wo5FqVE3K4DoruBAL+IayOgFAusckaLcbKGjXWKd?=
 =?us-ascii?Q?ZLBDyWFMPH9YIVtwvBHvAfgfN/pC6OQRjcUxd0AL23lEnhbnIbMONj+D38RN?=
 =?us-ascii?Q?JYYGviMMpNaD9PkZ69xJjGMarhheUrz0sSEnZowSpHa5oQQXB9YAbsTdGyEj?=
 =?us-ascii?Q?ac6Ie7QaGwEhVKcOclgOFNIaKGzAiQPAwES/NLgpZZL90wZ9vu7Z9iNYmIih?=
 =?us-ascii?Q?U85uVhmkbATVq4z4CXFgsPj3noF2vIeOlGgU5ZIB8kwnRFnEUrLn1w0NCCqA?=
 =?us-ascii?Q?AHS1XGBX9iJl7uDHIA86hCMlZcYDJHrV4KRJ/6k0GWV2QWIXrU8nNqy/0YQM?=
 =?us-ascii?Q?mB+o021inzlWxPnRL22x2g6npX3jooAPKnrx11ipXAad0ArPbaa5qApTGfkJ?=
 =?us-ascii?Q?Q7YMwuu87CvfeGBwv6a50NaprwTEgpiDe3oW3qSLnzuhRUEqaqGE2L59yaEh?=
 =?us-ascii?Q?TbawoUlmtFo3l1Rq5FNSsrlhyioMFL5yhFnEkZ1CuwtHL56Rv25cYBE1YgXX?=
 =?us-ascii?Q?xz4g584waxYgn6jKGtL52VujRgOL813XZUXrA5AIaUgB5RMTymy7GotKjOen?=
 =?us-ascii?Q?iVdkqO2Q3A4sgqtWI5PlpMZ/VurQVUe8o6OWKoIMXly7TjukCt7IlqNTnOwk?=
 =?us-ascii?Q?8My5nwA/NZSQRK9xTNRtfnK0HCXpddyzZuFJzV2Wpgi6A7spD4OCkulluj17?=
 =?us-ascii?Q?jl+qq6jxgSSSOb7Am2My5cmb5UvXO/XsfybMFvcO0sjQ2fimzHYdWOlVDUag?=
 =?us-ascii?Q?SE6rACR5Ou50vinuGifkn+YhYujKnCZS68dnMCw8qlZlACHNLZI5FnD1nZk7?=
 =?us-ascii?Q?zzUcSQ9I0vOfihEbfLiA3CewMTzeeYkmvqBRJ/pY2QTQQhmV8iKVq8uQWqQQ?=
 =?us-ascii?Q?3ZTTrkOCXVXFKlKSOUddwqBWgMT1UQqdzm4VXggGgadZJXYj/m+GOI+QO1B0?=
 =?us-ascii?Q?mkrzaDyPOGK/aa5K8SLvNArv8JdswaK7Onv9rt23MjcxF4V27+ubNNG5ijsa?=
 =?us-ascii?Q?7CQsLrjokX5U3kfzxFea7r/MO38JB5rD1G+Wm4ws1w3H/RB+ZNqVcnpd2cN/?=
 =?us-ascii?Q?MQP9IrmefkrwURHdtoXEoZKvyWIgOl8MulFKu465mpi5fXaluvU1TyYtXdf1?=
 =?us-ascii?Q?DPeB9Zygn0Y1XzeYQuxd4a4+nUrKrjV883CrKxPHHrFeKZSgYg05cKEapTnZ?=
 =?us-ascii?Q?WWO8yQuG4Xm7GnhUySnWyyFPA1fdyHsE6OAhw2Cr1Hh3zsqFQ6gXi5CzYB92?=
 =?us-ascii?Q?/+4bARTzmSwrg77kCnwjivskvrdMhBI9KopwFPKrchLEbIS/FD6WE8VPOAqp?=
 =?us-ascii?Q?zTR87ImFvslGHG5jtGRJ7vL2PrNWwK8Dz7pfx0TvCOPWqTqDmJYQgxQeI6d0?=
 =?us-ascii?Q?H3Y+Nkdqb2E2LB8w9g2Vz1qpxhNqZUJleIlPoxe5RXBnut61A8q8cW3rvlmp?=
 =?us-ascii?Q?fAE+aonRujOIK1ipxtlxEoI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea583ec7-9f53-497f-b154-08de20b99d4d
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:31:11.5129
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QY5nUMc6Js/pAlAjoODZzEiA5AqWO72igeaQchCL7WEByHAoUizhkgz6jiE4iDExx+60Ffes8WtUvtmIhieSSi+lPOYqrtQ9JjhfIohazZrbiYkju6+Z0G45LU8T5S6a
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
 sound/soc/intel/avs/boards/es8336.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/avs/boards/es8336.c b/sound/soc/intel/avs/boards/es8336.c
index eb2b40894e3f2..301cfb3cf15b8 100644
--- a/sound/soc/intel/avs/boards/es8336.c
+++ b/sound/soc/intel/avs/boards/es8336.c
@@ -38,7 +38,7 @@ static const struct acpi_gpio_mapping speaker_gpios[] = {
 static int avs_es8336_speaker_power_event(struct snd_soc_dapm_widget *w,
 					  struct snd_kcontrol *kcontrol, int event)
 {
-	struct snd_soc_card *card = w->dapm->card;
+	struct snd_soc_card *card = snd_soc_dapm_to_card(w->dapm);
 	struct avs_card_drvdata *data;
 	bool speaker_en;
 
@@ -101,6 +101,7 @@ static int avs_es8336_codec_init(struct snd_soc_pcm_runtime *runtime)
 	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(runtime, 0);
 	struct snd_soc_component *component = codec_dai->component;
 	struct snd_soc_card *card = runtime->card;
+	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
 	struct snd_soc_jack_pin *pins;
 	struct avs_card_drvdata *data;
 	struct gpio_desc *gpiod;
@@ -132,7 +133,7 @@ static int avs_es8336_codec_init(struct snd_soc_pcm_runtime *runtime)
 	snd_jack_set_key(data->jack.jack, SND_JACK_BTN_0, KEY_PLAYPAUSE);
 	snd_soc_component_set_jack(component, &data->jack, NULL);
 
-	card->dapm.idle_bias = false;
+	snd_soc_dapm_set_idle_bias(dapm, false);
 
 	return 0;
 }
-- 
2.43.0

