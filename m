Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011071.outbound.protection.outlook.com [52.101.125.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F13B02FE56F
	for <linux-sound@vger.kernel.org>; Thu,  3 Sep 2026 01:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788398065; cv=fail; b=Y+easTpaouEMPWu5WGy6jN941Fgas2JOh3veJvTgkx+FqsA38aC+0ZjYqxL4o3gp6aI4B9tfCrSvKrZKa4imup20L3yW4xZfIV3ryblkn6XmOhbcR5UCsDL4maXxi2L+poXnnt0+6gOCqSkpb8yBRkNeWnRdqvfLsnpViG4biHI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788398065; c=relaxed/simple;
	bh=BQH07ycsP+jOSdzhZf7M6jKmsqm2C0jfbtebWwhJTuA=;
	h=Message-ID:To:Cc:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=oXKevgOrOmhw9HOPN7ULtayv7ndusMx21F5akVLbzk8kyexcs8psSNopnnIDHB7Xq4acKE0IHp6wXuyn3VmS38pOC/FAKQEvKm7AXNOuqjkcz0Clg28SRwOWF9UxDhDJMcEit26mkssQWynAWvaLvFFv4PM3EjBOlVzq2hY6th8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=VoRWo8Qi; arc=fail smtp.client-ip=52.101.125.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="VoRWo8Qi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l9n3A399Y6BLR7oQORfHfQJAg3iVJQd2Wam4TeDIn7uCnxTOp3Ym46EYT0ZojFCjgVUuhe9AH8yyuBdMjKu976/O0AY0rzuR6jUE0bA2p15cPOSIxcI9e2/bBau3OQyBmbzEoFukE9ntK9YSORHn6PQKMGIhVFHNI3Xeor+Nsjz2pFnpSUKP9cAKJNMFLEQxN5BqY+CaXyYn87FvRpIy8/YyJfX1e3Ma5NtqfngTO76iaLYywznBlsH3Nr7qERw6qAvMr1+5sfqMkycAyqa+8I8glh2bHMWZy+TWbKkxAnM+sDP1oyWW6eO6dMuTZmLVS1v6Cw4AB8EVauZmrI5skw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5lCWxzs9LHVXkaGAkD3Yc+cVcnv5YkAZ5azfNepJ3Bk=;
 b=MT6QDPMoh8DfWkGu1s5oodnQ5GvabhEZccfaJZKFyc9MjkfW9sZLiOHDepDLGGvX1Vwej0YgGZdDMxspQHWdHO2BEoQ3V/5VnwRTk0+6oX+df5IHGQtUEEocGy9mify8RjxcqtuJJdJff9xgV+1ObORIxUjuBeG7dun+x2ryfAGRZWryvM91jJLvvM9wS0DYv+AcQ8H2vtS3S8FEJaqXRZGzoyLNPOf7erIfiB8TS1FOA4Zi40guhS0mvF/7IbDFXo5WD57BV/8HfCR4Q0iM6KRUN6Gj3LlhlHnYSpVbl5DepvVNYgP5nFTaFjhvYcM2LfueIe4A9oHdc/WO+BjufQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5lCWxzs9LHVXkaGAkD3Yc+cVcnv5YkAZ5azfNepJ3Bk=;
 b=VoRWo8QiHZeHpKCRBzhjfmlsRkunEUFEkbtLch1T23B6l84rppjUaPRFQSVyDGY87n11CgNo56ie/zEmbEtZAcl9S/8uEM8ZFDgNtlZr8y7vR5Ni2bGjPdoa1htVT4lrT7GS2VmqnuM4uQtvqD3D7MFoDliewLbbU/GnEgeyKpc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10) by TY4PR01MB17164.jpnprd01.prod.outlook.com
 (2603:1096:405:367::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 01:14:21 +0000
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b]) by TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b%6]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 01:14:21 +0000
Message-ID: <87fqzryw42.wl-kuninori.morimoto.gx@renesas.com>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 14/21] ASoC: sti: use .auto_selectable_formats
In-Reply-To: <87zexzyw5v.wl-kuninori.morimoto.gx@renesas.com>
References: <87zexzyw5v.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 3 Sep 2026 01:14:21 +0000
X-ClientProxiedBy: TYCPR01CA0173.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::11) To TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB16474:EE_|TY4PR01MB17164:EE_
X-MS-Office365-Filtering-Correlation-Id: 4abf7b24-b6e5-42b5-287f-08df0958af58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|23010399003|366016|38350700014|6133799003|56012099006|10067099003|18002099003|22082099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	5opMLsxtVk4KZHKdcBirhnI1fPtUuM1m9hZNZIPtU1Wr9e1cbeUg+6gBGSdUauShezyu9lj1G3OETtHbIes5urJWwnC4hCpPYGzGaPJNSigZrt/50X1W4CI3MKrbFrpNfPDgJFvFWjSdZnpE2hjs0CsbEP7PvAJ2cqu2wgxlfg6pbAxPBEGEepgLjIh56Xk65exHpy607+YDA+4nYYmT/WZuAXvHsQOj2+x/RyHH2ok+1HZjKDSLcrQyxwyM5Wi4An0FHqbNf3g/A2YvXjgxKmAqH7h5MxCDlLfABOK9KR7s4Rli1ZgOUMBULRc/WnOKaMw2nf1xt4x38+IkZXXPgHzNwZbzSKHL3uwflh10hD/BnazByvg48Iq7t4UeYF7kPtJKdBt26CcaGiLAKUmzgW4CH9JXkj02NjYm6hQcIEeJs0Xw3naZEmq+6qqAoLH4D27xHo9t14ASIH32bo+Mj68ojcy7lHwUziYjCNDBC8CdNDhjoDup4geofD7mYco1C0/2aNNTP5GQMNdS1UzbblY2k9j//el3VH0QyizIZI0qyy3AmZaPix+fuBjqMRZlWAkxvPhWQsxsPpCi+K5x5Ibf8zV1wtHdYfGmwbVaIdZDcZq486p15c9Hpk1CPiMudRIwCl1IoiC6holgVr3jRBlKw1ukRSKw1EtjXZZqnJYFTi63EjTVFSdUTEaXGVaCmcz2O9CgiuWpIipBbv8amCIXoQMhT0gcm6QY10f0wm0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB16474.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(23010399003)(366016)(38350700014)(6133799003)(56012099006)(10067099003)(18002099003)(22082099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SedlfNIVBmmIeA9whdwDdN5rQJjn0QlAVeG8V17WTdQTXh+XqkkjvPqQ7nrP?=
 =?us-ascii?Q?hOKusqUx8o9eVEXV0VtqvXardUG1kEk/anVe9bGQjpved1Et3qlye/JNJO84?=
 =?us-ascii?Q?5aPUeK+PmizYIjjAlls6/S/tI/uSUbGog/1YTqoGpHULxWfOFZWWWxRhiheC?=
 =?us-ascii?Q?gQJIVWHy+grhR0PsDvytaHQ9FGtRZ+SZsVFitNiM1Vh9LLYkpgPsrXz3rIZq?=
 =?us-ascii?Q?pG1S9j9U+TsxLj1dEYucWHiZS3k5TAKgTYCdBml/UB2DW2uswBBRntJPhLto?=
 =?us-ascii?Q?QtvCvyAJEaSc+9FQYKQZyqEtchs8fmRW1wMdMDLTkjC5mJ3Yt9yUEF6vvHxH?=
 =?us-ascii?Q?qCBlkSK2bNXTrCDJWyaaF32pXxyNb6STFtx55t6U+wOuK7mQ0n9WrE1v4NFW?=
 =?us-ascii?Q?E38QiVJFkprHpqzhgaQYnpmtLVngFXlFSuXRbwWfsYVRfo2I+7vY7RYby2PS?=
 =?us-ascii?Q?3PvY2BD5ewsYmhAVidNeDpabcf6OK91VFzKR/x69ZI2NCqhDpI4na8+KWATR?=
 =?us-ascii?Q?K6BCTvGDS/+PlO6VTiihZWfeaMaAtMVYQQhqrCxxdxP4NJo7zUsb18RSkhg7?=
 =?us-ascii?Q?Jq0bSIt85IxELRcSFMXzpTWDuirNcCOvifU4LY3n+bp4tSuBqsQObtMjwehx?=
 =?us-ascii?Q?QfZ+gNuqvDoSrOfE10inIcIP0RaFSXd0KxR+rjDOQSxrvIWXSHHD0fBUnNwt?=
 =?us-ascii?Q?wEEZtkqEYfR3ThaEJEpRzQ9FVl19c/9y/A66kMbeyJ0axGWIqwBIrLleYuTG?=
 =?us-ascii?Q?aPf29LGkShCML78sy8YUExlEJ5nvidIEIEr7JktTg6czaOjpxK1zW9Bsb++B?=
 =?us-ascii?Q?8HRJuYSFHlrH/82DboKJhZnqG3B8XJgA2niL/OXktW444qN8DwhOIbT14uIW?=
 =?us-ascii?Q?wXik7OBO7RcVZpYTN1Q4+IA8E4vQuF9BY+64ok4MVn2tAFW/sfgP//JPFyLO?=
 =?us-ascii?Q?ZfYs38k3iiGIc6aRGDdmE9mMwtOw03l5JzFzHpqNYANNVFUbPtTkJrX5lCwW?=
 =?us-ascii?Q?1tmu3PYGp1Cznr1NWugIrviCjx5EAgG3GL5gkT/Rduo/FCxa0ZSMtyUjG55D?=
 =?us-ascii?Q?FqiwV29hFjSKl0hhUJrwwxc7OKg0DfVkfNk20LiIV0CJptay+i/0oXEkhH40?=
 =?us-ascii?Q?/Xh4e68rnr1zJKjoKpzI/tP0Z9I5IaU2GHPsJDep9oZw73XvsE3X72Oy571C?=
 =?us-ascii?Q?FrPldkYH+lIQqw/l6MVf2la2wUXWhBgYj79zT/1kD1aLTuHhiX+6NkiuMlqf?=
 =?us-ascii?Q?zXGywnrfHcxG4PJojB4YJskeDy4hiSQxXbB+w6sypeMNo2MDEbsbgVAzPBH0?=
 =?us-ascii?Q?YBFLMtofQjyMTNQr9Ee9gLukLYyZT6zMI70DIiDkPUFLvahERiqVDfF8LyuK?=
 =?us-ascii?Q?p+v+2tAWdSvGcI4314MNhZTNxNzSBsMRNSIPOazGqekGz6xq5CwNAZjS5L7b?=
 =?us-ascii?Q?FPdkIdmclny1z9RAoou2P8UBlglT6NdisSTrfXfzeWFCVa1s5PeDmvrQz0Qy?=
 =?us-ascii?Q?28Ic4N4f7vqvFxJzYMq6wAdkefLe9S9Z57K92IyavT+bsQuylhmgmasYRtGO?=
 =?us-ascii?Q?xIzHGY0jVlytm55wQZpYBkpL4GezxFT95BfQ2S2ODFDjrTo3kvuWY+tWVBcV?=
 =?us-ascii?Q?rws7BNPiBKYrwlMYIaC7DbindrdEZWQp7/mc65yNdJ20tYtdKt2vkpeqmfn8?=
 =?us-ascii?Q?Gol0mb6kQgV5m3MxrIvCDC72Ugp5RQ5JDXfhFxfJEvS8zoyNaTzVs3yfRfJF?=
 =?us-ascii?Q?fcqYe+2S2GTLKhYaOi4/qParHabm5KudekKxLO1wYObO9haMA0YR?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4abf7b24-b6e5-42b5-287f-08df0958af58
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB16474.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 01:14:21.4831
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: afC5WhnFooANNb9XzphomOELkSE4rS5+u/8WoMvR6278dJj0jmb0Ii6OQwM1tpAfhNNeu/1SCcTQtXJ714cVphMFJDxeoiSANcj881IQ00mGyq6u4QTQ0BvOmH74JSij
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB17164

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/sti/uniperif_player.c | 29 ++++++++++++++++++++---------
 sound/soc/sti/uniperif_reader.c | 27 +++++++++++++++++++--------
 2 files changed, 39 insertions(+), 17 deletions(-)

diff --git a/sound/soc/sti/uniperif_player.c b/sound/soc/sti/uniperif_player.c
index e4b9799ad9b2d..844ddcfc421a7 100644
--- a/sound/soc/sti/uniperif_player.c
+++ b/sound/soc/sti/uniperif_player.c
@@ -1028,16 +1028,27 @@ static int uni_player_parse_dt_audio_glue(struct platform_device *pdev,
 	return 0;
 }
 
+static const u64 uni_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops uni_player_dai_ops = {
-		.startup = uni_player_startup,
-		.shutdown = uni_player_shutdown,
-		.prepare = uni_player_prepare,
-		.probe = sti_uniperiph_dai_probe,
-		.trigger = uni_player_trigger,
-		.hw_params = sti_uniperiph_dai_hw_params,
-		.set_fmt = sti_uniperiph_dai_set_fmt,
-		.set_sysclk = uni_player_set_sysclk,
-		.set_tdm_slot = sti_uniperiph_set_tdm_slot
+	.startup			= uni_player_startup,
+	.shutdown			= uni_player_shutdown,
+	.prepare			= uni_player_prepare,
+	.probe				= sti_uniperiph_dai_probe,
+	.trigger			= uni_player_trigger,
+	.hw_params			= sti_uniperiph_dai_hw_params,
+	.set_fmt			= sti_uniperiph_dai_set_fmt,
+	.set_sysclk			= uni_player_set_sysclk,
+	.set_tdm_slot			= sti_uniperiph_set_tdm_slot,
+	.auto_selectable_formats	= &uni_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 int uni_player_init(struct platform_device *pdev,
diff --git a/sound/soc/sti/uniperif_reader.c b/sound/soc/sti/uniperif_reader.c
index 45d7613f595cc..d92fc1181483d 100644
--- a/sound/soc/sti/uniperif_reader.c
+++ b/sound/soc/sti/uniperif_reader.c
@@ -391,15 +391,26 @@ static void uni_reader_shutdown(struct snd_pcm_substream *substream,
 	reader->substream = NULL;
 }
 
+static const u64 uni_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops uni_reader_dai_ops = {
-		.startup = uni_reader_startup,
-		.shutdown = uni_reader_shutdown,
-		.prepare = uni_reader_prepare,
-		.probe = sti_uniperiph_dai_probe,
-		.trigger = uni_reader_trigger,
-		.hw_params = sti_uniperiph_dai_hw_params,
-		.set_fmt = sti_uniperiph_dai_set_fmt,
-		.set_tdm_slot = sti_uniperiph_set_tdm_slot
+	.startup			= uni_reader_startup,
+	.shutdown			= uni_reader_shutdown,
+	.prepare			= uni_reader_prepare,
+	.probe				= sti_uniperiph_dai_probe,
+	.trigger			= uni_reader_trigger,
+	.hw_params			= sti_uniperiph_dai_hw_params,
+	.set_fmt			= sti_uniperiph_dai_set_fmt,
+	.set_tdm_slot			= sti_uniperiph_set_tdm_slot,
+	.auto_selectable_formats	= &uni_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 int uni_reader_init(struct platform_device *pdev,
-- 
2.53.0

