Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011010.outbound.protection.outlook.com [40.107.74.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4564922AE5D
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762821255; cv=fail; b=F/deNlnY25qP1KCWqByjHa2yWl7Vm8DDGJtuoMQVOpyHriqwGEY/dnoRRQkVM0tDekH1U1V2LhdqA6CzDHBL8dM3mkd1SH0uweaRV2xcQkpTJ5YyEpHL7+SpCskvv9wSgWxXJTR/7w2yS0aqiVcv6k8EgiObvHgkjN+BZSh3dsE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762821255; c=relaxed/simple;
	bh=+ZAD+bpAO0wtHaQs3NxuR1YEEsbDiiB5aAdlWk7UoFQ=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=pTPzdK/Yv0T0F97iOLftujBsYBK+IoIaXf8Vs1q3MdTZebqc7vPzK3nT7xNYhYfYXA6yEF7A/1UgdOm9uKvygpKZLddUuV7spw5pD15BO5aGTTHvV7kykcb6muOuhN6bGlOWmx6SfQ3q1DbnHamQRHDsKvN89TH437g6LjH2qlI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=E2nJMvyn; arc=fail smtp.client-ip=40.107.74.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="E2nJMvyn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WnDHbimEFWcYsyM4aunPuN3yzLumCIEBZP3vNykO5hpoA4cXYOFIAcubsuj97jBGQOb62DmuVTwMFpkZh09hWUCdWMNsAe47vuI4qq03/F6TIy/0IHWidM9O2UWK40DAL2Qssid7z9gsBtjnC+NMpRDIopgVX6clL0fTxEchrHWfM+HEz6PsLrh+TFhDHPpeGYKTv2PPaz9CLEky+mXKAV2AveWkaSyO7L+RtqcuY1HR9V1PQswWo/WaQaQVo/xf+CMJemZ/ipA8tTZ2PgYGU5riHO6J0VIXFXo8JSOLFovIE2hFSHylDg0w4vWjhHitWEL3bRpXhS+jEFREZLZ6HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F8xvz7G74eEiavQTSgciw2UgioaE3sbzhd4yKMCAmlM=;
 b=ldP9fTJCA4Z1eBlKBrOQYVZkY6qv8O6FP85zlR4j8MO1C/bQFlWgh9TqvJicJFiagmaxMumTzQsCjBsfEvsZor80m6rAugT9Swa8nPZDIBxFt+PYHlz1INQUsDNDbG7E8NsXm6vYricgeJ6lyYsYNa7k/AsxEWw8V0O31fKMS/csQlGl+iv6/NadYvyZaONqpsMOUPAynw6w0DoMlHPZ/u7ooRkAZoflbYOjuRGTGAFjcfY7F1gpUg+4HZ18/yMD8fbqy9cAcVU3OJERljKvC8YVJp5zR3Y3m1OCDpPFOUAj6kwgcj7PfoVYSmsOed75Hii1lH2PNz92G2UiS1/Ycg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F8xvz7G74eEiavQTSgciw2UgioaE3sbzhd4yKMCAmlM=;
 b=E2nJMvynvuJlU/o7S4caGm5Olay7yu20pqg/zRqWWaeH9rF0Pdrmu/T2yutM8JboRtHDYJ3NIO79bxk1wKDX2556+NLLdvgUzKwgDdl26uV7PGUKaQbbFGoY5h3UHhWTTquA41uiQs8Ku0CRqe3Gu0OPJWz3xQtqm+nGz/UuBMs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYYPR01MB12531.jpnprd01.prod.outlook.com
 (2603:1096:405:19c::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Tue, 11 Nov
 2025 00:34:07 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:34:07 +0000
Message-ID: <87seelv24g.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 238/292] ASoC: meson: g12a-tohdmitx: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:34:07 +0000
X-ClientProxiedBy: TY4PR01CA0124.jpnprd01.prod.outlook.com
 (2603:1096:405:379::6) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYYPR01MB12531:EE_
X-MS-Office365-Filtering-Correlation-Id: e191f0c9-4326-4640-6942-08de20ba064e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iBrrMXWaH/v+jaxSOkYppXN7qh+yrw5V7dV/4TvgTma0cnlEv3FJl2bks5jK?=
 =?us-ascii?Q?Z1lXooVqRdMCfcWWdAZ2GR8Ztas/5MeeiV7DdmMnVmshAy4zWkk2iwCaTXe4?=
 =?us-ascii?Q?vPghpmQoLa7AhXW3X+mBB9jnTMxE6wlMAUzolX8Al+E0fgp12R/+5FMdKjP6?=
 =?us-ascii?Q?OOZHR/C2mxduVDwVx+wj7mv4SWJY1+huNcHv1DOTz08VCEIhtlPKrPa3he0W?=
 =?us-ascii?Q?Gov8d6uQn8SjEqpWyY5+XpBjf16qZntMjL3VLGgpZ770iy3xNKKdiZpNREir?=
 =?us-ascii?Q?U/mxGoUgSnH4ZGX4VOD4p+4i7WlyLta6BwjaR38bPuGTTkgBql/gXZZ2LKgr?=
 =?us-ascii?Q?trhFtwIr6+wQFipgRzheDbV1tdYB7BAzvyX/b8IHE62RVX+UZSQMO01e16KI?=
 =?us-ascii?Q?DB5d6ikf3XUFBAHCBLUlQ6ndv2nrymsbeI9scTi9GBKoKtt640754bQ06rRo?=
 =?us-ascii?Q?52uEDLP0XNu+dlRphhprFMP+jepf4YKsFWKglfM2cj8RQfO7z8eGPU5gKy+e?=
 =?us-ascii?Q?ASnN1E6iudHSD+jwwn4S7wxDf6PsQbUl2ZhZJO++5wW9SSP7xR+Lge7O7sQS?=
 =?us-ascii?Q?isudbSSWbEdPqEDvFzLweBzaVR965c079odXslOCMf/8HgmKPrgzgMjsHdXn?=
 =?us-ascii?Q?ChGfJWPEsAX7b7COPpq2quMh4ANMRYqyYAKllIlql5IaUitAOUl1x+yks1rv?=
 =?us-ascii?Q?0SQDphsD+HSQ5vsutOB4i5EjAk+yAvFjZ72NebuCx7zZCP4SKoxQfnFpFQ76?=
 =?us-ascii?Q?hthKgdVlOh8pfOnMuxZ+sojllR29XJf9Z9FRkJIuE5AwUCpXzfJT3RbC7nTa?=
 =?us-ascii?Q?WHfA0tVhUrTmrZGLjeHcnDzVR65eVe3tn8TGsWUdri4aaVrCOMsJWY7cAFeN?=
 =?us-ascii?Q?cuEAB+sUGkIaXlZbFTwgnEdH2B31W/OsO0viw5/j+9OatyGPAO8vU4JLtxq+?=
 =?us-ascii?Q?nCkwhb7RP8rkat7b2di6yxHxLojX1eOJYtVc/ySCBL6CBWMOEcHNaF+qZxK5?=
 =?us-ascii?Q?GhwcZsyXINUJDhYnpNaGBNkQ1YLM/flNYOmrujHD63QlrsCL9yRTuUfZF9Lq?=
 =?us-ascii?Q?9oiU63tUj+elO/eRVD/xGkKzQh+UnO8ZWo8lUsRmzrlOOIYNPZgwyyulptja?=
 =?us-ascii?Q?fLJ9qjxfZbKzhVzB6TLlY8tbI763v8XJsP7ounr/XCzuaS6mHCz4djAIuI5y?=
 =?us-ascii?Q?Z2u4SV2+PVZ4jgExYjfGxRa0ysEZ61Z1t/dHKN3/dHLlaS6SHVDWlxkNwMJw?=
 =?us-ascii?Q?cOk6kJ1+yQIirtT7kLpww8yhMd1uHFldk6euE8h34NOs8z3kXQJdZrhoDtcB?=
 =?us-ascii?Q?sWE948ugZo9VP2CwZv3OlcCal4sxy9HBVuViXWJWz7fvjV7DG/apb9nNYGEI?=
 =?us-ascii?Q?88xwsqFTNNHUuYRx7OdTD49YzgHn1aGya99bHPdH3WlIqxRLQDA3oqFqW6Bh?=
 =?us-ascii?Q?RSSHA3j+U5CQTtbpe7rUT+x+c85TXE/ATt4UCFvoAsgI+awgYxEaP58Xu60z?=
 =?us-ascii?Q?EUqNcleqbp/boavcoTB1nGz/pXv+HW56Q1dM?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?eQLqH9am2C4ApYGvOq2X+kyDba5PJlVjMA75f/sUWrLfeSIaXoglDtLGaj6I?=
 =?us-ascii?Q?gNlsJfqgtLSPdHpXGR6LYOs8tjwmp6pSvX/o9xSKwc9mnIQhIRU7+r5qnIYz?=
 =?us-ascii?Q?nRUjD5WKIhYb3I6a4I3TR8oxUobHRB4CK1vv9OkZznMO12jOLOI77aGgXl0o?=
 =?us-ascii?Q?5DPjWr4PBn2YTYEsBTkmj2hZp2smF4Cp46/N8bBprvfV2gqtD+bRrWZeFN8g?=
 =?us-ascii?Q?YO0/CDvj0wmsKL0Oh9KKD7JvV/chUXA0B9fo7M6VweC20iErmK7b2ozDBR1v?=
 =?us-ascii?Q?6XkaKUPTa+/x9yA/IW4nGFieunlA5/o68AxCNrBUHV1Pw5QRpxirlfcWwHnw?=
 =?us-ascii?Q?CB7ZDlPPQRsp9KQpBxbnojsDA949y2tdvFjdHURHkcbPwHSp+bWkAtLfjGJM?=
 =?us-ascii?Q?rfxF6aTb8C7eW8ycLeN3mmgXg2/dDXcC6jOmqsRn7ZzPFL1L8G8DZwCWcfUC?=
 =?us-ascii?Q?bFUW8SofjCRciXOKFhbweCF4rF9yMFf10Y9eM4dSnE2BQo+TF+F8XB06J0A2?=
 =?us-ascii?Q?BP1oglFAZyH8sqKBc+mheM4ljhkU+miU6jUKNAvmS8OcEebMkDLRGzRxYz8H?=
 =?us-ascii?Q?xr2v4NyyTboI4JD1BUeFeblponAtcCA/4neww662MJXgXtfPcXLgt2X6cy9V?=
 =?us-ascii?Q?VZtY+FDNZlS5cLY+ITHEDOl9S7L8achyw4vAIaEgZmXmXN1w2gTVuuSaAm70?=
 =?us-ascii?Q?jER8IJPnnPnlO+QmmgDWuHvtlAo6yDF+KckHgO4oxvS9M1GqS+jmDd5w+QNd?=
 =?us-ascii?Q?MAaCXFaxWZKjtZLgDU/70H3AhTL99W0C/fj9ykZwqHzezUxlIkIJtltbWDLZ?=
 =?us-ascii?Q?FztKfjJ7a0ts5IB/6mnwYeYaNzPXNrMGKtzUPNWWM4kuPgu7xPAkhZqZfC1X?=
 =?us-ascii?Q?Gdzo5xL6HPSnTtagQ/M9DUnc/DRG9yUaT4lsF1vuIVmFkvVFXwoB70/HlOxv?=
 =?us-ascii?Q?4Ozz2GPxp99brdtkELNENxCG58o+0zNBRYeVIyNkQAwJswmBTiMEkubjri+W?=
 =?us-ascii?Q?z7gARx5A5Ytk+ksb8aOIev6DUXHK1B5KL7gGDyqdWvqmnPNrOnbY4U4NEVx3?=
 =?us-ascii?Q?GGihWxiFM2p0xShkwaIVJdI4OoYmKM5t8YHi1vPYvQCduQ6YOS30RLYoqWAa?=
 =?us-ascii?Q?/RSRAfOcDmIAaKLbj0aHsLjkz/+5yeZfxaksTQHIRCcCvPbivVVt0RYAtEeN?=
 =?us-ascii?Q?80fc+OECLYh9On+K/uzS+Y1fgfdPDXhPPCMUwioQY2jj03UuKpEI8sAUXooc?=
 =?us-ascii?Q?BdAzoVQEjoqkNAEucKB3L3YnWeW1i4UcBU83uzeggyMkXfFADYLBFhamF9HC?=
 =?us-ascii?Q?ViBelzCj90tFLkOCgKcbdoQ+ZxlEaaPmJQGFu+zlv9L6anl/N6tdsdwzrDHC?=
 =?us-ascii?Q?sf1VHw6LaUhiFrlslT1oNlckEBPutd9LXDSfsE61tQ1jP7AHos43qF8B+WBO?=
 =?us-ascii?Q?YQaf+smVCb3/oREEaSXn5AaqKkx0EprckcelEMQXZ/DYHchQE8qjFx8JfxDD?=
 =?us-ascii?Q?0yvtGBRwUl2pa7kABfrMiUL0qJKBE6KYwth0ZcBLUEgFSuhLeMVr0S2N+Qcb?=
 =?us-ascii?Q?LfLrn7l4kSnLT+Kj+kJkzx7BTLcBjKh2MWRFzfr/Yhk9jg8ajRIL7kk6iT1t?=
 =?us-ascii?Q?3Hst2Pe7y+/f6uvvWzjHt6Q=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e191f0c9-4326-4640-6942-08de20ba064e
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:34:07.6178
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OHAVpjMZU0aqhQBEv+EZfdNGEV+qaZ9A9nKDfd2veEmOyA6+b3D2UArjy42d2U8AWdWvMMNTGIrbU+dbBt75ixEvfus0hCOP9c0tuwfmIoXmbtL6ZgztX6eRQaNy0AoJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12531

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
 sound/soc/meson/g12a-tohdmitx.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/sound/soc/meson/g12a-tohdmitx.c b/sound/soc/meson/g12a-tohdmitx.c
index b92434125face..d541ca4acfaf3 100644
--- a/sound/soc/meson/g12a-tohdmitx.c
+++ b/sound/soc/meson/g12a-tohdmitx.c
@@ -38,10 +38,8 @@ static const char * const g12a_tohdmitx_i2s_mux_texts[] = {
 static int g12a_tohdmitx_i2s_mux_put_enum(struct snd_kcontrol *kcontrol,
 				   struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component =
-		snd_soc_dapm_kcontrol_component(kcontrol);
-	struct snd_soc_dapm_context *dapm =
-		snd_soc_dapm_kcontrol_dapm(kcontrol);
+	struct snd_soc_component *component = snd_soc_dapm_kcontrol_to_component(kcontrol);
+	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_to_dapm(kcontrol);
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
 	unsigned int mux, changed;
 
@@ -89,10 +87,8 @@ static const char * const g12a_tohdmitx_spdif_mux_texts[] = {
 static int g12a_tohdmitx_spdif_mux_put_enum(struct snd_kcontrol *kcontrol,
 					    struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component =
-		snd_soc_dapm_kcontrol_component(kcontrol);
-	struct snd_soc_dapm_context *dapm =
-		snd_soc_dapm_kcontrol_dapm(kcontrol);
+	struct snd_soc_component *component = snd_soc_dapm_kcontrol_to_component(kcontrol);
+	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_to_dapm(kcontrol);
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
 	unsigned int mux, changed;
 
-- 
2.43.0

