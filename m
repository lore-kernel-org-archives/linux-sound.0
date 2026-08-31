Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010044.outbound.protection.outlook.com [52.101.229.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37FEA3C4555
	for <linux-sound@vger.kernel.org>; Mon, 31 Aug 2026 05:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788152917; cv=fail; b=EJvhLOIHo+/Zn+fhRDaOecHmzaQK7BLb9+ubKyBcAokD5OzjYNtY6BJcqEmunsA5ECuEDJXCOxl+sf5Jq9IZBIo+43DaxC1GTkwHJADPHn9ls7sCL2czaC/8PiNMj5cnyHNv2B7BU7GoDJtxzMdjFlSr4lrngAZUaAcrWMSRkNM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788152917; c=relaxed/simple;
	bh=/J9qsfjMKy6pb8cJVAQb0Eg3zNJG0IoqyQnpuIyZmqg=;
	h=Message-ID:To:Cc:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=ovpjrUt5Dm3asCFbDOQLghmuf3BkaPTpsOgUjg0dZuqz5sfk/yuzj//DnyjPW3/pbhNhmBRNtF/T/4wqM77RVPNuYRYG5tJ3aS2CcQctaUUt4eOvaQG9WkHuJ9BjXbQcFDNeR2APVyW65eoln/JmjdQyKjW8rdksgDw9bNtDPwk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=lJ3tQ5+J; arc=fail smtp.client-ip=52.101.229.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="lJ3tQ5+J"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cZpR8yvRvIMtjq3ee9grUNS9Eg3Bh/tMiKlazE7pdnUalefC19/npz+T56p6BYJGNr9hIXYwQGHnDg8HJRui9yXdswKQHoN6JSvFEk8UUMPMezJWnTV4wUoGBLEZ65NDfdvj/VVb6FRjVIOkLDer3/iqMRL8th5OsU7zhVLV3DH7YCoj6fQxOsiL+kCiZzMyyjg5jG5zmFzjPGa5wuEXSyANNn4bARq1N+0WyNSpftVGwyiqTJzlJ+yCo4IaEqxUR/Do94nEqqDGZ3/Y/I9QoRf6MX3gvHOrHSSGtBbEtc5Q7pwhtJUSAplPz2Qt9pGmeIuFxDrAsK8B7RHtY3vWzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KtgF3wKryQbgFZF/1JcFow9SbhD5RVSl2QkmgDeM65Q=;
 b=CL04Q8dePUwDhBhdKJxPU2jLyYNUV0FKM83svJ87EGp2RADogJ9aCV6yDR1rNywmwVu/RzEg03VuKGbjRiVggF6xTgXFmSQwdvHFtla4tPb8pyfyYf023DR3bfQpX2rh50uoutXlhlrw4DByYdpxy6ruo8PjgNqGRZ7tNkyuvCbXODbFT8V60c+vXX7Fwtsm6qkhCGXBRV5VUCXyoQzGAB7uTUEDjHqzqTUrkt8LoTy0V7LBryapov6JreWOyg4a2hXBysQWCpFJrXbs8TZgZW2xG7gSdGmpUfeN0AIkueLpbAkiL4y/0QK07fFHClX1fvV0xLMmXjITpP7slZMrlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KtgF3wKryQbgFZF/1JcFow9SbhD5RVSl2QkmgDeM65Q=;
 b=lJ3tQ5+JR92rXN0V/Wipxw7PKNVAjstUZ5Mz92ky7aob6CwapXjEfdmT1ZuHDWXyWFpGU7xYzpSn7mbqYmAPT3fx/hLi6g3/c9EO3UNuMwyoa9N6KOuIjYhHn58eIvOqwVbskwzRH3Jffc9DUIU9jtrKsP2RMwIHowpMQ1Iq3sc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10) by TY5PR01MB18382.jpnprd01.prod.outlook.com
 (2603:1096:405:3e5::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 05:08:34 +0000
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b]) by TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b%6]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 05:08:34 +0000
Message-ID: <87qzjeubam.wl-kuninori.morimoto.gx@renesas.com>
To: =?ISO-8859-1?Q?=22C=E1ssio_Gabriel=22?=
 <cassiogabrielcontato@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Liam
 Girdwood <lgirdwood@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: "=?ISO-8859-1?Q?C=E1ssio?= Gabriel" <cassiogabrielcontato@gmail.com>,
 linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 23/39] ASoC: codecs: rk33*: use .auto_selectable_formats
In-Reply-To: <87o6eivpyd.wl-kuninori.morimoto.gx@renesas.com>
References: <87o6eivpyd.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 31 Aug 2026 05:08:33 +0000
X-ClientProxiedBy: TYCP286CA0225.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::13) To TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB16474:EE_|TY5PR01MB18382:EE_
X-MS-Office365-Filtering-Correlation-Id: 420be4c9-ebda-487c-04be-08df071de807
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|52116014|1800799024|366016|376014|22082099003|18002099003|56012099006|11063799006|10067099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	kVxzXm8WPNEMSGMMeYo54sMTZjXs9Z0vOfi1z9kG1WSqYoa5vYe0XfU9K6LCX5hxhnLBSZfUdoFb886ULvYNG1Tg3BI/6+CgVPa8FNTfbtu5JMDG1gvy/BniMHrHNh3VmVARWjV90uUnoVRfIm/wjsLng7pwVgeETLCFJtXjebNeL+BofeaePDnbhUEdv28WoYwC/lgLdJb9C74FfSV83XJ4WsJGoa81kOhjMC086z9vSsnO6yRR/F+UlrhQ9a3dzexw6imVtkhVXkixUnT6CZgd/93GNwzlh10cMHP0ayVyX5xG+CkD4JSgSUNU0A0mQplJOV3I4jMQy7Ct/SgropZK8iGw7zNBQgf1XYCg9pB5TRbSSuOXnb6FagPFR/0mDT3UdF7xt/RsIU1uh0RrY+PUH9zOM6drb01MgXiGDkdhkkHlzF3U8dhy1EuPl71WMR/lxlpMSbxjyFxJN62sWFiWufcpJCMibio0lP0sDeqKvGZIdYkd/p1rxvEgugXHDPP5hkoq8ujlCk/TLZtIZ4HOALNeOErWppt5y56b7CeLIM2P6UqLsbw6YFcgk8RasoGboiPbhVvgAA7l2zTo21PtWShn2sg34WbInRDT5DnynqnPKA8PR/vmLwWSl9l4clyp3U3xOuc7U57mAnmUrrQ3WLfVcI+MUAUovoUysbwJe9WJJ4O/Ien7WlzUnF/unEcCvEHA45ONxRLVlLUkJjzzklA42EEHUyEfLVyTpt8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB16474.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(52116014)(1800799024)(366016)(376014)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tSAO7E+uLCsM7cuRWS/nPGSUlarcgmeZuONC88Jq+9myY34/H7eKAaNU/4/H?=
 =?us-ascii?Q?5EWCS75uvDpkETa8czX35LnyNQLUPM4HEMV3OUyNtwP4x6D2MANN/mPOpbeN?=
 =?us-ascii?Q?vQyd2tVYVtZ56LNrS8AdZnBZfQegyHX/sJ767KwHpYBoOyi0cop4FfjX4U2e?=
 =?us-ascii?Q?b/I29XgHl5xW+TDnZztSxA8N9bR02HysSH56jkDwTKCGgPs0dcMzQuPePUsU?=
 =?us-ascii?Q?N8WcwkcrgLaTET09v23WERll4LBsvB43oSWGqWIkCRa3wwlzQeTzKC9veIQJ?=
 =?us-ascii?Q?yiNmwj/GUmQVl4g5iSlorXPetbplGNQ2qvZhBoybBC8qV10uNtTfu0YkIrai?=
 =?us-ascii?Q?e79m54Dpmvf72Sler94U8yUBdLFnR63y1OerKeSo+mATAG4/+D31x1ay0vDd?=
 =?us-ascii?Q?bN0YFf3zkevQ0NTyRiaU+f8FmYEVqUHhIfeHOJxefoAQkU2w6AI89dI61Fc0?=
 =?us-ascii?Q?avYNw+iHQiUmIdK2ocz7HBxvGf0ZbmaHN5vBATOaAW85JTAGMHz0IXh2TkoH?=
 =?us-ascii?Q?Iy111M2RAAX64CziWnGPAa1UFysMmRqIQiI9fbwohQ3K7UWknx5NI4wVuTk4?=
 =?us-ascii?Q?heukaZkD9ellHchirLTc5tlp1rbxDwQzrG9ezGQ4LcRF94hCzGP/c72nUFMU?=
 =?us-ascii?Q?8s9NqarVSvYvt76brJL1PMF0y9BPX49JL0nikah+1FnEO7wcoacAxhmlA8vV?=
 =?us-ascii?Q?V3TMd0TjxXkFbER+NwOQsDmPU8di5ZFg88bozxfIMx9Gw3mGTGptBTmmZiGF?=
 =?us-ascii?Q?6xaMmfP/6yiHAB3LRS34S4SP7F9ALwYeR9/lNVOtQCaCsdhDv7mWt43D5Md9?=
 =?us-ascii?Q?nAW+j1EKI7FTujg5R0ysxDogtQRbGDvDzI72Wj3ltbCVYnZDtI68Np/XL3Ah?=
 =?us-ascii?Q?kEfD35jEJxbsRnrbPUf7ARqhuShsGlB/kAXxykDLWydx74qDYywqkCwrFd9b?=
 =?us-ascii?Q?TlMrgj3hMfcBYP3BAmVKvliRBFdTO9W4uBexlK/HETfh5NpNMSsOwxK7MZMb?=
 =?us-ascii?Q?Gu0FbcUNT4Ubg2TtAPVBM31xqvLfYtNXx/61j9f92x/OrksqLuAmuiURZkkh?=
 =?us-ascii?Q?eYNU+aZP8tE1d+e3S1+PvB5moJFyAFhoKTAsP8MZximUU/exEw8CFl6tM96w?=
 =?us-ascii?Q?m+wWkZBEc42q/LnK6hC7SrcLRAMfCeUCUyen6d1iIC8bDMqLcP+jusfpBAeq?=
 =?us-ascii?Q?qyDHUjgYUdpFpIIJxthvgXWKqRX2uPO+kQrWAgCaTMwBdfGAGE/AlwjwCzmj?=
 =?us-ascii?Q?yXxVfTeZ6ekq85bCU0nbP+ve4X4c6TJEconqokAEzJ83gc6mGx/71StlBMyJ?=
 =?us-ascii?Q?Jww8s761NECUe2sxcm3QGn6L8FOYxKEDP9goruZmg8uVEPcqW0t2JPT/41jT?=
 =?us-ascii?Q?Xbl05ilL2XVF2lG++p5FdwB18swShJsS7xHRMTy0+vZArd+wx69mv7A7YAu9?=
 =?us-ascii?Q?71oDxRywzNfNvbAEnQj3MQ10Pv/zv0xg2CMi2TiRgO9/bXkkrOPYCAz2mURP?=
 =?us-ascii?Q?9UJ3bc664sf12YymdwJjdLDEC0JWEcCgNS/oJgT//LjTuCnYQXGrXXl/KX+1?=
 =?us-ascii?Q?nirznUz53w5H/LQGmc3Uxb+Qdk2r6kvg9cHd5kJSzqRRO4Fp8WfbtLyQ+EjO?=
 =?us-ascii?Q?u0gtrOoDiZCeeDcZ0yTUNBBKIv3/uF+iOz4GOEShSTyVlXdOyscd2aq+mqIE?=
 =?us-ascii?Q?DxHHpa/7x2/kM/6wmfTcvJEAKYv6W7lhIUL4mZmUWDMSLp5xbwflT89Yu8H3?=
 =?us-ascii?Q?u7f5ariiuaQAtuNY2qmXQg6ZnCkSeK/CGdyckRCJJcGSPfkW9uBO?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 420be4c9-ebda-487c-04be-08df071de807
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB16474.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 05:08:34.0871
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2am+UbuUyyRmmLrjWOty9WqdTZ3Ko/arxCACdHI/OX5wRkNWn+N1TDhvQSDASGTfYCY2x+DVDAht2UxA0tpZplH6Ykj272GsNUmNkxltqB0k/kNq6olT/Kv44UqQVL4o
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY5PR01MB18382

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/rk3308_codec.c | 11 +++++++++++
 sound/soc/codecs/rk3328_codec.c |  9 +++++++++
 2 files changed, 20 insertions(+)

diff --git a/sound/soc/codecs/rk3308_codec.c b/sound/soc/codecs/rk3308_codec.c
index 60befe9d37f05..abed31ba660c8 100644
--- a/sound/soc/codecs/rk3308_codec.c
+++ b/sound/soc/codecs/rk3308_codec.c
@@ -679,9 +679,20 @@ static int rk3308_codec_hw_params(struct snd_pcm_substream *substream,
 		rk3308_codec_adc_dig_config(rk3308, params);
 }
 
+static const u64 rk3308_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops rk3308_codec_dai_ops = {
 	.hw_params = rk3308_codec_hw_params,
 	.set_fmt = rk3308_codec_set_dai_fmt,
+	.auto_selectable_formats = &rk3308_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver rk3308_codec_dai_driver = {
diff --git a/sound/soc/codecs/rk3328_codec.c b/sound/soc/codecs/rk3328_codec.c
index 5871b5a819757..c2798ee940593 100644
--- a/sound/soc/codecs/rk3328_codec.c
+++ b/sound/soc/codecs/rk3328_codec.c
@@ -312,12 +312,21 @@ static void rk3328_pcm_shutdown(struct snd_pcm_substream *substream,
 	rk3328_codec_close_playback(rk3328);
 }
 
+static const u64 rk3328_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B;
+
 static const struct snd_soc_dai_ops rk3328_dai_ops = {
 	.hw_params = rk3328_hw_params,
 	.set_fmt = rk3328_set_dai_fmt,
 	.mute_stream = rk3328_mute_stream,
 	.startup = rk3328_pcm_startup,
 	.shutdown = rk3328_pcm_shutdown,
+	.auto_selectable_formats = &rk3328_selectable_formats,
+	.num_auto_selectable_formats = 1,
 	.no_capture_mute = 1,
 };
 
-- 
2.53.0

