Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011066.outbound.protection.outlook.com [52.101.125.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 116CD386579
	for <linux-sound@vger.kernel.org>; Tue,  4 Aug 2026 00:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785804206; cv=fail; b=QQiC4pJYS1wYf0a4S3HSI7XfwNQBdd9F5ZKtHFF3ifoLU1LGKkj0mqcDFrtQF5Oq5osRIBPUPm6jLT6B1nXsqjn1wy3v/9P9LWBVqGlG14u05IwNkW4RRUQdxfprul68pVDj9rCHCXMAEQMPft46wfJQpt8MpUb2U+YyFirCSMQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785804206; c=relaxed/simple;
	bh=eJFXvsofCrgP2IBmQ1Q8d9ThkXe3dbhTa2yFufhyNbY=;
	h=Message-ID:To:Cc:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=fK8/4D4Irpkx2hhi4boq9TqzAIEn8rQ4ku45LTN2XcBukWEg2tVIlrriwk0tL1aV1yLob3Ug7WJ/fY4W7nnOoDWxne1RAEm8NcejQa8g+crU3A+DdbyBhfJflCCBd33LgOVtav0imNqAOn+zcHAujGKOLgubohrBqQ+dARJSs4o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=XO/ORrMA; arc=fail smtp.client-ip=52.101.125.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="XO/ORrMA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=He0nasecHvuGLjhdaYHQ4CaiwteHywTmqhVvQv5hz9jQus4+6kfydhIZCIrbmAC13QEsIC0Tmq4D3dbf7xa601T2zZxtcJTL8ceMRYNPXl2GtgVGw8bElFqa67XbSiRcwCGyz7/iNu4B/DdDVGlRC6igsVYWaAEVEonZuDcRSpnuy/OSP0RKZtxDwEUBTS3A7aoC/O6OjhmBarnge1rOWs1aoBiFbMuFkrWmNtJJTHEFLzAkWWKrf3IQRWTd3YG58eho/VQTZSdEZ3GiiBN+f73yvM75cxVGybKz3BVM4R9L5HTZ6g5lFMfhZjnqTsUPeWQl5WpxD2Y4R+34yykBMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5083amhe9neqdGMK9b79ve2esRnINyN+QW1NY8Q0NN4=;
 b=YgATU7DDgVmheAtKZR0xdM0KduxKXKF+6L3ZfwlSrEu/xhYlC8x2awbLHy9dI4vw9X0gcORHY6y/bCRN2GWcOAczuiILTQsxe/3DGVMUoiF4dXFjh8/LepAqJg33RKQsy3mngov+uwjwKVtmkFwvcXmAy3+88YV6TdOWm+HuHlxjkXYfMKyVIsqOPmXZoGV9HvZMjpVHjqWfYdPaegw0FIzbWKVdi6rARufu2nKu3KRkUe8qUDBOQXvgQqMt3c/PbSzLLnjtTbZsfduAWMzUZ49Wgp6wTUCHpBv/hj3RajbW3N9DfYObpdmqNS9G8mEtZ6+/o5ya1Nzf1mB+g7VzhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5083amhe9neqdGMK9b79ve2esRnINyN+QW1NY8Q0NN4=;
 b=XO/ORrMA62bgKrwGifs1IR8aoL+9+rUg2NkN9GXCO4gkD92grGKn8ugP/NvEp1D0PP7cej+abI7cm1ODh3QOjdFde3wkw+y4On+JbAFawhkbOrMLlggTxIKhcj+3FqznVP83eXderOtfxpO3aLwVJnTqxdQiT46F9bd7Q45OUiw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYCPR01MB18168.jpnprd01.prod.outlook.com (2603:1096:405:3ee::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 00:43:23 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0270.017; Tue, 4 Aug 2026
 00:43:22 +0000
Message-ID: <871pceww9h.wl-kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Kiseok Jo <kiseok.jo@irondevice.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 33/44] ASoC: codecs: sma130*: use .auto_selectable_formats
In-Reply-To: <87cxvyyazi.wl-kuninori.morimoto.gx@renesas.com>
References: <87cxvyyazi.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 4 Aug 2026 00:43:22 +0000
X-ClientProxiedBy: TY6P301CA0028.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:3bf::18) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYCPR01MB18168:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e83578d-2249-4400-c773-08def1c162fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|23010399003|11063799006|56012099006|22082099003|18002099003|10067099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	Q0y8kwy50lePXro4ApDES9eK1ylMlnfa825Xbps32c29D+DRbYfMoRXvMjA2cxmjM/09Pn78yMxHZ+0X4Xjc9Vq6ouBN5zS1NQWO/xS1W4NcQdoE+X6Hzi5D2roO4QZxEz4ufNlkBJ4J7W+HVbl9pZDIqVVMT135lfHSYFMn9O6WhitCoZvRqYIhjp4KiSP7UGD0wTSoCze4TZ95XfUM48kfTlHB7NG+lPzq8TSWdc+2baf2gXS6/BKFWgoGAHks4JCpDwwAiI4t5qvgEV46+zpjb8BNQvCS85wK3AQZSFLlx8AcMDiZ26gz3hIFE6oopt+sw357vBLKi/UeNeyRkojyK4xKuXb8tvBsxH844kjt7EZ3lr5RlvmY7FOOPgKmK9wkc0DBREUNg9YR2kMJpzKmg/GTGNC3Ek+CGwIN17Ba2qHLkTJrGvyYhfmnC637qZZ4bG19o3ljXsjBxOyvmdnyu96O4lRmdjqGZaYzIjXHzy3SGCMaQk3gL77zCb4/LjYBV/M/EjMVJyq0q4EJV6SvDnqewn8vHHe78jHOIdaojRre3BhDx/0OhFxb2erWx9yCPk8wz1AjYXWAGYSndxHUmlObWX4vqXoTouZvUfHYtG/+hobPvwqH85RjHV7g/Vodjkpvvao7OvljvUyeIRY8GiAhhdKDgJEjQw7HdGntkQEv952HoviH0MVYtcYJ8yNxU0SKfG5joY/JccO+o/yXcbwNkIL4Yt6nxoB5S6M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(23010399003)(11063799006)(56012099006)(22082099003)(18002099003)(10067099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FB7mdXVVi57EbS23MvoUn2Y8EnL44LRz8h8YIG63ukkzvgK4siEznCaD43mw?=
 =?us-ascii?Q?DBhQvwkqa0uy95Mw2q5hzw8a2J0NoJtyUzhEfQehhtr30Z8x5Wb+oac0TV2Z?=
 =?us-ascii?Q?GC6XAk2h6r12OeIQWkaE8S4H2643sv/IL2cSeiRQbDvXcMDTeaJ5ERiIwwnI?=
 =?us-ascii?Q?kBw4xX5PmY66E8gzHzFxn5+UXU2B0MhNTyFWtbz7ymBzRMOBiuxokruqG63d?=
 =?us-ascii?Q?4PuR5s3TULcxGeegvzvfdZIT/pWYl5+o1FBu9M/qCU4APsw4YP2hXwXg0Ayd?=
 =?us-ascii?Q?V879o+ZptQNX62DB0xgBXy1XUbDL1KpIbVJSuMW8kBke+iR05WwAJM8KzAyx?=
 =?us-ascii?Q?WCgXctlWZOrD9maf1OPX0qvRPON7H9k99XopY9T7A7/S23bnD53X5391GhPL?=
 =?us-ascii?Q?1rknXXQbn9Y6NIMBDKcElsk1KEsM8YIZOPqq7z5SkZxAuLLgIB8Ng2AaXGeO?=
 =?us-ascii?Q?mrlyPdJm64msN1APj0T3qlqsTuGIz8ScGSGu2oJ6Fi7VUPInrQS9vzHpG/7q?=
 =?us-ascii?Q?1a/SuL/iM1o+iTa7o9OtJMrOefOdFYMKjuOxvPpJ/DIhpkKN7vMtUuMJwnWI?=
 =?us-ascii?Q?HDfnWtSkHcwGiV4EUJ2xKFiKvc16HcRj2tSw/Cx7dQ7x069FxsZCbh5qcyOw?=
 =?us-ascii?Q?0UZcMqAMavuSq03V55yODCvoTmN9EdJRkveXwfPy5m9SptzpVOZSfNWoad9S?=
 =?us-ascii?Q?aza4K9wQ6axZqn4DyUBP9x5DHK4xMuy6SYWtTDk9ecZBvzW7E/bpiEZ3QCqY?=
 =?us-ascii?Q?gMuDArN5i9wA7BGoYeOs2D/FynqUjlKje6xIrXrHUf9daDJEkIPS5guzqsu/?=
 =?us-ascii?Q?/4/eqInabgXPRlIEZ61PDvPxzvfviXRUyCM5lt3nFYqAjSziE5pLlOM2D+aB?=
 =?us-ascii?Q?xTPaOxoLuslDtRxiDbYrdJwOeLkhVlUpZ1Bm7FMqNrM6w7/j+q6QgPtp1pP/?=
 =?us-ascii?Q?40C+bd6sMeHq+5jEPCc920k0ZiLt2OMQNyc7jPsfjtWw2Z/ght9+ITZc5ccF?=
 =?us-ascii?Q?ZWRdCYi3cJJ36DcEis6xFQgKFLgY9Z2AcW2OASaim1FwCRQ/eT8xT8yGe9r2?=
 =?us-ascii?Q?YdxKUuuRTnmELqSYtdv7/Qsb4Q2goDlCrzAUIijxQchhXUXdV6bxFfAbh87s?=
 =?us-ascii?Q?YgPNocLGFq+uuwIjxtFynMOI8y7eX5OY5qVtK8TQLr6HTMyJTKQ+HTItE+u3?=
 =?us-ascii?Q?dcOdFsBt/Z1AEDnQCV85cI6pDuo7pqnA36m0Cj2EDGsfxWhVcHAfTAJ7oeTn?=
 =?us-ascii?Q?8+h2l7WcFxByQ/6jLb+DqejDGVRzFPw5nm/1cIKsjhzjqWJiZSwkMjhE8HDS?=
 =?us-ascii?Q?zKahtIX7IVQTyd/2A3rbN4wkTLAWk10hkmi8OKMMp5AgV6oVrDMg3AyZ5JfV?=
 =?us-ascii?Q?66tqmXyEaxon8dIPSmj+OUZ0x+fVyoyJ4eJO+Nvr/ZuitevRoQYYggnSTP7h?=
 =?us-ascii?Q?EEkuc+sMYr/PibGOS79XIYAAqYN9oXykls9wteUSKRkwqPceEc5eZZ2NjH60?=
 =?us-ascii?Q?zqsCRwAdnDvSBwLvbdIorQVCshSABWuVkCxRYSvdEFKB6krV/BXjm+QGKn1q?=
 =?us-ascii?Q?BKZby67qm9wTM6SXqUh0ZxIXL9U4tm4NEbDYO+FVxatOXCBbrkLZCvObe8ws?=
 =?us-ascii?Q?J1iGwUESWNp1heAdsBXHBx4sg6GbzkeORRbblK2kqvdCsJSAFK6e3QNZKTtj?=
 =?us-ascii?Q?OlrakTGPXvyy57gwqaLFEY0CGJixwYy68GTRQHoCL9U3dLptLCKpPH/EEVhx?=
 =?us-ascii?Q?qNsWYJR8oLbl5zN1LHjgLw0OwNlphUs=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e83578d-2249-4400-c773-08def1c162fb
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 00:43:22.6061
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cHZG6Wp/4SQonb8Df9tkFBkCkuD4TbKsSS/8Xm0UVwKnSfMUABHJnmtO8YP83eZBqDawKeoInTNci079Oz2r+t1k1DHWmCs0lCNrwM9FmsiOCRLQiRfS75b6iMnRjlfq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB18168

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/sma1303.c | 13 +++++++++++++
 sound/soc/codecs/sma1307.c | 13 +++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/sound/soc/codecs/sma1303.c b/sound/soc/codecs/sma1303.c
index 15758eb13f8c5..0bff325597143 100644
--- a/sound/soc/codecs/sma1303.c
+++ b/sound/soc/codecs/sma1303.c
@@ -1412,12 +1412,25 @@ static int sma1303_dai_set_tdm_slot(struct snd_soc_dai *dai,
 	return 0;
 }
 
+static const u64 sma1303_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops sma1303_dai_ops_amp = {
 	.set_sysclk = sma1303_dai_set_sysclk_amp,
 	.set_fmt = sma1303_dai_set_fmt_amp,
 	.hw_params = sma1303_dai_hw_params_amp,
 	.mute_stream = sma1303_dai_mute,
 	.set_tdm_slot = sma1303_dai_set_tdm_slot,
+	.auto_selectable_formats = &sma1303_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 #define SMA1303_RATES SNDRV_PCM_RATE_8000_192000
diff --git a/sound/soc/codecs/sma1307.c b/sound/soc/codecs/sma1307.c
index c52fe95b30c6a..eb87f728b165e 100644
--- a/sound/soc/codecs/sma1307.c
+++ b/sound/soc/codecs/sma1307.c
@@ -1552,12 +1552,25 @@ static int sma1307_dai_mute_stream(struct snd_soc_dai *dai, int mute,
 	return 0;
 }
 
+static const u64 sma1307_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops sma1307_dai_ops_amp = {
 	.hw_params = sma1307_dai_hw_params_amp,
 	.set_fmt = sma1307_dai_set_fmt_amp,
 	.set_sysclk = sma1307_dai_set_sysclk_amp,
 	.set_tdm_slot = sma1307_dai_set_tdm_slot,
 	.mute_stream = sma1307_dai_mute_stream,
+	.auto_selectable_formats	= &sma1307_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 #define SMA1307_RATES_PLAYBACK SNDRV_PCM_RATE_8000_96000
-- 
2.53.0

