Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010027.outbound.protection.outlook.com [52.101.228.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCDD0175A89
	for <linux-sound@vger.kernel.org>; Tue,  9 Jun 2026 00:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780964598; cv=fail; b=HAD7e35rYIecP+ARyGaZ3dwq6eKWpYS/SnnuI+YXfvXUAIcxMkYFOLGLceIxgChB4Il6cWW2k1xZfQD4CadHWzg5hjTidUKurin1J7khP42o84ncWOiloOakhCSJ/Qqz8on38SeV55hM6B+zFUGrFuAV12EenttyUAN4MyoKggI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780964598; c=relaxed/simple;
	bh=o95hX6zC/K2U+xac2F9h3Nb6UjDwtJE2ynQBA8hF0ks=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=ihFzdOkkXea2dPHm3KY0IYHPFtWpI4n/iPZKGPuh/9Il9YyZNO7Q+o24mqzE3+aHDBHqKty22li59WnGlsiQp2fy5CL83DSujVZYzcydWuU6Y+5w+ox56svYTV77IgK0BohNfB9vQ9gYfN3KQVuGLqRDompejnRufDOaWe+uvPo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=mbFRwcev; arc=fail smtp.client-ip=52.101.228.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="mbFRwcev"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d/d3Jp8HA1z6ekc8lG+mTcDn5Olj6hBbnLiwWNSNZH4CkfJHGn0z/e6lCIOs73JaI+P1dNZyHEZ6n7rf/4I4MmM5nTJgdxRWO8sGXtHR5qC0WfKm3nOtdDhPwXEiFlS8GyzoYrMhE/fHPfnIT7UzTVAyWMIdcC0jELbgFZHyYUafaNjzHSgUw8OR9thxBJ6bhy4stVhxOm8IyQuCZSGYk15iFc5jFNjg814eBz1nM093uydr79hBy1UFVuvKp6I9/HoMyYQ01kEtd96hpe292q03ZRcsya5TxYcWi9dN/gbwxbZYSJybB5YLdgk5X1SLpA17baKp9Bh+ltGlml5e7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fmm5IhVMcuz+kTgpF8NCyEBXrztq7TaFDFcwPX32DY0=;
 b=vfTBi6gMJ46sF0ivYhoiA5NZQFpqB2cv7l5ffEfijLkETXIdGzyFBKS658RS2tuFeaJakZWKi4cSMkvX1Sc+XAIo3+zBVpZ7IU9nh6NGkxX64TvAUooJ9A+Jy6bTa100y6vaUPmUK6+RCPXC4lOAgPPcQxdCHmmOIMyRr2mkXTU70AaOVOS6cZoN42aPmE/mdertlp3HmzUB3vVjpcxOqXy0yD+biR16ZJk3pnwhsGbWM8O5u7V37kjG5V9tbMTBodAI0tbv5xePH1ok0St46PAHxaG6yVJRe/Mm9lxK2jNMwM2hQK7DFLtXdPrKLf0REXpbuKI4mFo11exTptFsCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fmm5IhVMcuz+kTgpF8NCyEBXrztq7TaFDFcwPX32DY0=;
 b=mbFRwcevoj5+9mF6jc5iMuxkxzeSPesHpdy+wWiSXnz8/sLa+aw+FjX6hZHbkX19T7rK51LHMl562ACLZQXOq0f1QTxk7l+kuNh/Zq7X+qBcegHfsAQ/eiV8waFGZWH6YfLJSa2BK0m7RzWJujbo9pdF8WEPaZDAIXWqraNl2nk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OSRPR01MB11811.jpnprd01.prod.outlook.com (2603:1096:604:235::9)
 by TYYPR01MB12760.jpnprd01.prod.outlook.com (2603:1096:405:15e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Tue, 9 Jun 2026
 00:23:15 +0000
Received: from OSRPR01MB11811.jpnprd01.prod.outlook.com
 ([fe80::a2c7:5e53:c133:d834]) by OSRPR01MB11811.jpnprd01.prod.outlook.com
 ([fe80::a2c7:5e53:c133:d834%3]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 00:23:14 +0000
Message-ID: <87pl2036kt.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 4/9] ASoC: codecs: peb2466: don't use array if single pattern
To: Baojun Xu <baojun.xu@ti.com>,	Geert Uytterhoeven
 <geert+renesas@glider.be>,	Herve Codina <herve.codina@bootlin.com>,
	Jaroslav Kysela <perex@perex.cz>,	Kevin Lu <kevin-lu@ti.com>,	Liam Girdwood
 <lgirdwood@gmail.com>,	linux-sound@vger.kernel.org,	Mark Brown
 <broonie@kernel.org>,	Sen Wang <sen@ti.com>,	Shenghao Ding
 <shenghao-ding@ti.com>,	Support Opensource
 <support.opensource@diasemi.com>,	Takashi Iwai <tiwai@suse.com>,
	=?ISO-8859-1?Q?=22Uwe_Kleine-K=F6nig_=28The_Capable_Hub=29=22?=
 <u.kleine-koenig@baylibre.com>
In-Reply-To: <87v7bs36m0.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7bs36m0.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 9 Jun 2026 00:23:14 +0000
X-ClientProxiedBy: OSTP286CA0080.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:227::20) To OSRPR01MB11811.jpnprd01.prod.outlook.com
 (2603:1096:604:235::9)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSRPR01MB11811:EE_|TYYPR01MB12760:EE_
X-MS-Office365-Filtering-Correlation-Id: 730ee420-ad72-48ef-9ee9-08dec5bd4c05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|7416014|366016|22082099003|18002099003|38350700014|921020|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	uUmM+mQEfwU+5pXLOmU9c/bCoPsCb0wEzfwsqre5pgolWZS/d475gpqr5v2q21X647NsNB0K+ivUJiLVts+O04Hozc2FlwG5IIjFaoHi1tD1B3QzaWvUk7jZ/qrboN6dvs3/DfCqRwQ2a0hFhBQ1P5lID8sb/hMAdq8fKs8dhIGy9lo6ctfTrDBFkxs5awj6dG7Ctk8/kGrTYlXKQSdEQ206x8gq5JNRfSotIRGCnwUT2HWF/yr3rbQanA8aJLdTnMMxRbzeEqwCj1neR42/zJ6OOP8/q1NrIsZUEPU8KaoSjbqVKzoSPfBQAv81URc3M9mco846UugU0Id/dT56nz/bEWB3zuwtJA/kAq9Jn6kKx1VuThFQYYvv5nW3/kiFlg0792QfcOWZt3M8NnONgypmSaf9uZbVm9SadqCvoG0aT5YouSF1a58BIDbzm0OIgpaqQuROR8aRc4lpnpRPxuwWpeHBsQJJhKYTSVZCTx+Q8dz+EO+ix97X6H/OfarASolMHsRqeYGv4GkgcAWtrDF99a0PshJH49yg8RVVSWzY9ToCvZ+1FwlGrr8UNzwwLwLe4cauQH6avLM+r8SUArbNktDA3Gq8Q6U2eq5p5QZv4fS0SJk4EsNvUi8wP4ixfusWxOW1u+3ROY6ynfZ8WS/U0JSB8f02PLadNBwXra29Wx2Jiphc6YxoTQCw9jXx+P0P0pPsGbuJfx/NkR7hmhrnOFmq9u0yKgX3cZJvJFrtmzOpvIdda7Zz/DZm04hxTo1nOYVR3r5RI5mR04STqg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSRPR01MB11811.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(366016)(22082099003)(18002099003)(38350700014)(921020)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7isvVY55IWPvHPJjrPIFgP4pGEKO+Aa0GsuHTINfed9d8+zPhZBZ3F37TL+M?=
 =?us-ascii?Q?Pv5h7TDBu2AGSgGVKGLeLWsg6ZStjtSS91cJsNjaKe8ELFW/x1mU3KNfhUzp?=
 =?us-ascii?Q?KFnLBOVkFX9oSibZWeQAbfhVDMq3IvJrN31eOW1LHUtZVXbYVjMjOqktyYwO?=
 =?us-ascii?Q?zxnrosLlqeGctDLK3vuCqrAdiNhefbhWRDMaGiwkuI4MCp2BtGAEiccRhH9O?=
 =?us-ascii?Q?0K3wY8RwqYQpiBiDIgSIv338T5KZcAbZMt/hjLj2ZZ2+zb/Tybym8gUPzjev?=
 =?us-ascii?Q?jfuz5AVYIlKe4pQ373j+IUvDgv711w0pStA497Kc9qwrBzFPabvkE85sydYY?=
 =?us-ascii?Q?fJcJ/VwTuagjcXvKn7PAB+pGIzkP3vNVZkvf708FXwamCGjM/32FnwXldL8O?=
 =?us-ascii?Q?E4OYF56r8MyfYHdKeBtqb3mku4FTQ7c+fDQM0JASrqPZWyMeY6RIj2JY8gBM?=
 =?us-ascii?Q?VpMvj/GIxmoxf1Cn9csai+d9Vg+ka080mpOEgJ1yI+tUyudpDtoODFNJfXj2?=
 =?us-ascii?Q?XNeW0A7Baf2HG+EjXPUwNcBQocBXSfDBZNgu0e0DfmhI/nEYPzElUtasqTGS?=
 =?us-ascii?Q?7YVgnaXkLp1g/SUoy8bBa8xZTgk0mjPtpCe3oorAfC5b2MCZWIz1f97ZMR56?=
 =?us-ascii?Q?TsCxdVbgRYvHyBNR0u2H1VcbbHPdW6tzYTu09LuIgC+oqJ++wW4pxRDtVxQH?=
 =?us-ascii?Q?QsBWNo4eC0YuUHaiKE2i3GJKUrq9pFBj377AC8Oln8kgBu406S9Ub4697ntv?=
 =?us-ascii?Q?4z+GePl4cqT4htDAXqttNY68oFV2yjORkcA5LPG4+1lw2pljxmTUHbcKFRte?=
 =?us-ascii?Q?0s0E11mrVKvKEsqN2cz3hSaNnJK5kJ3xUldQNxY0rNkTW2/cwAPqRSooxEcA?=
 =?us-ascii?Q?brU01BvMLPLgwPOhTE3sZXYLMcVyX3GmewGRehTJivQTlp5c5N/fWXx43CKQ?=
 =?us-ascii?Q?6XO0h11uwY+BVSB5A2dR7V27LzkY51Joud93dxBtoEX4cJOXQlBAWc6GtatC?=
 =?us-ascii?Q?2HHpHKB6uwOx+Q1LNlS1HlG0O081wM/2VJIZDDZ1wJjG4neOu5PBa9HNHGAo?=
 =?us-ascii?Q?mSpd1vUkpyJNknK/D98hAOA3aRVSz2xLezaMsyuHJ+HuaLzopeFpqqG9AgXN?=
 =?us-ascii?Q?hiEqZl7hUhQFC9TPofPUSOgFzdwfWCfdwlQzkQAlmRjszkoXXQjE+3QOWZPS?=
 =?us-ascii?Q?0EoWjiAal2kPHneXIerVRMmyGms0bWGBGByeaH2OKbqYdOSi+8so3goE8+wz?=
 =?us-ascii?Q?E6D2zi78NCS7JN3TX5BeCv4Gg48c5FKfKjjFwMcj93lN9chUykqJ4vwQXtkM?=
 =?us-ascii?Q?aTsVwgHLHxS8zDfIn85SrkE1MXnE+fRMOtyPP71gWwUijQYVKkVCDf0O2oBh?=
 =?us-ascii?Q?wPkDvu7Gy3g0C10q6ypl97nBJLTFlJ13rUpkyrEECMOyj64PWBozo938WNUG?=
 =?us-ascii?Q?hRdE0o91zPe3xSHWGQL/ASrpa083Zpbr7iw2ND7TifyuZwhfoJjJdibBJBPy?=
 =?us-ascii?Q?RW7WlAidVoza8qE2GCBWdvNDRQMa2zXm+vFVv6Y9ekq7Fo5gKadxMSBIrIE/?=
 =?us-ascii?Q?JV9akA862UHt+vLc6XkcnP0H8Qiw+MLnu6tEcrl9rXwXJRJbdNVUIA5npM9m?=
 =?us-ascii?Q?XzSM8cpuEYbSEwtVMWQyJCbXwsiAM1Vr88M35UJmMhIMLScFgQJkSWjsbPH/?=
 =?us-ascii?Q?5DT9Tz3GLlPqpWVLRnqToJRY9B6eT3H7ALQBRXbN+L9NvXZiuuQiyFmfUW4O?=
 =?us-ascii?Q?GLqeVN6BQsGuIjpAWnsbmSAurueu+9g9th1V9mwkYy+VQ63amiuy?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 730ee420-ad72-48ef-9ee9-08dec5bd4c05
X-MS-Exchange-CrossTenant-AuthSource: OSRPR01MB11811.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 00:23:14.9329
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WqnaDZUjrVJmuX5dpD9NEHtV5P8SOM13ShmcSnJ3EnyfQhBDhdNp7ZHPSO6/JGIKEeDn/ooNrwVPjdRiGTJ00kL+hOciOXIKAYtLNfagxuXmgffOAPPVxg/V71K84vTG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12760

Because it is confusable during debugging ASoC FW update, tidyup
auto format style not to use array if single pattern case.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/peb2466.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/peb2466.c b/sound/soc/codecs/peb2466.c
index 2d5163c15d0d1..2d71d204d8fa2 100644
--- a/sound/soc/codecs/peb2466.c
+++ b/sound/soc/codecs/peb2466.c
@@ -817,18 +817,17 @@ static int peb2466_dai_startup(struct snd_pcm_substream *substream,
 					  &peb2466_sample_bits_constr);
 }
 
-static const u64 peb2466_dai_formats[] = {
+static const u64 peb2466_dai_formats =
 	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
-	SND_SOC_POSSIBLE_DAIFMT_DSP_B,
-};
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B;
 
 static const struct snd_soc_dai_ops peb2466_dai_ops = {
 	.startup = peb2466_dai_startup,
 	.hw_params = peb2466_dai_hw_params,
 	.set_tdm_slot = peb2466_dai_set_tdm_slot,
 	.set_fmt = peb2466_dai_set_fmt,
-	.auto_selectable_formats     = peb2466_dai_formats,
-	.num_auto_selectable_formats = ARRAY_SIZE(peb2466_dai_formats),
+	.auto_selectable_formats     = &peb2466_dai_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver peb2466_dai_driver = {
-- 
2.53.0

