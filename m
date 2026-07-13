Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011012.outbound.protection.outlook.com [52.101.125.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 378D32CCC5
	for <linux-sound@vger.kernel.org>; Mon, 13 Jul 2026 00:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783902459; cv=fail; b=lHLjAYEl3ec0W7I/GHDK5RGhgnkJzWI7+3waZinb3mcyWxoDWglpXTbwy/LosMHQfFG/U+66a/KfoKsk6WnYcxU/Ixjm2pG5h2uvSOCyUb4j3I00X0mF+E/HAnNhY+0LyBUiAY2hcrMFmKoJ/Upvzqh7h6jCEF0FCbQOHDDUqwQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783902459; c=relaxed/simple;
	bh=jJzdf8gjBDWiyBQx9wVeHLboDs+bEgoqnYq+daQk8uk=;
	h=Message-ID:To:Cc:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=mOspgF+oq41fU3nd/eYRi+n5bEy9wvdryWAreDP4ZaCMh6Vn5ltrGua/FMEU6g1ez18ZYABW+FgTwt7Ibq+eOaOcVj8kPz33uN1zmJvzyoRvfXp9tWSTVeu9r7htKF4y4PF/pJsciuBGhUWvWCC9e+Ewo49tWoCMLSPtAy3HXVk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=dOUf4i+m; arc=fail smtp.client-ip=52.101.125.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="dOUf4i+m"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bVJwfdkWS5asuxDMSiyK4QW260s2HIyG48vfhIUkbExYTXxt4wfqBPV621/GJqoJ7KnTE0k7TMQSyILwSjpCKx7yvPto92DKwAZYCDiVyLamanQVydrtZJ4dsGNiEhAOzLnJY5CvwBFy4Y3D9iyHnEMrZe9gWWuUmtvA1QtRDWf/d+qC4L8abbpm2aCnrQTHzUJoKhls+9S/fHENwXihw6ozSDdXkktcUi13ef184KgTD+c3NlvBk2y7sijD4DCoMS7gnp8L1PWD970eLnzSN08OCVsLVLkKEPVEKUXeoCaAJdzzojwsPo7k49H4XEeKPm1TidZTpr3iutu8OGP0gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EBZep2jMVlcEftpafSb7XFwv14mYB3I3MyW05gPaUoY=;
 b=f+NrIV576XVjCf46xRMiBx2roSjuN5NJ2O9DIx0xqjSakDh0/bLmDo7UzD6SrfCNyzABa28eg51gRFoqlXeyhUb4rMTHRoIQ2FPOtsD336MiR1w9VGuW9oAMIHrRL/lpaciRp0K+Ex9UGuogFhrgoSuvMuz1WuLf9H4U303lpE4ViY6r7Lm3xFBDm1+D9tmlE0dfDCm6uCrXO0T1VECf0IAGjFhuqAIKKPkpAJiNhei9nSSiGus0rQ2WPCZNS/W+pkY+Gxw1xwFE8k/bbKncSY6aXOAZpBPUjgFZhomY6KnfEHZSzMRouW9Vol7wSZY8bc90MOQyP2Ml15Hx0PK5zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EBZep2jMVlcEftpafSb7XFwv14mYB3I3MyW05gPaUoY=;
 b=dOUf4i+mQ0BQjcPMP7qx8HjZ9ctwsSUq+PGsBWRQxhlRGjW29un6D+/642wWW5E0Aj7Mn2V1rtRzNfJoB0+XgAQ24cRvO8xVxqbsRP0rCmMNIpBBoywRy8xQ+4rWVY29SFHKkz06GyGpvHgvthvK2yUQQV6RDmrpZxyaW7xUwD4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OS9PR01MB13304.jpnprd01.prod.outlook.com (2603:1096:604:30d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.17; Mon, 13 Jul
 2026 00:27:32 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0202.014; Mon, 13 Jul 2026
 00:27:32 +0000
Message-ID: <87jyqz20p8.wl-kuninori.morimoto.gx@renesas.com>
To: =?ISO-8859-1?Q?=22C=E1ssio_Gabriel=22?=
 <cassiogabrielcontato@gmail.com>, Florian Fainelli
 <florian.fainelli@broadcom.com>, Jaroslav Kysela <perex@perex.cz>, Liam
 Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Takashi Iwai
 <tiwai@suse.com>
Cc: "=?ISO-8859-1?Q?C=E1ssio?= Gabriel" <cassiogabrielcontato@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 4/5] ASoC: bcm: use .auto_selectable_formats
In-Reply-To: <87pl0r20qo.wl-kuninori.morimoto.gx@renesas.com>
References: <87pl0r20qo.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 13 Jul 2026 00:27:32 +0000
X-ClientProxiedBy: TY6P301CA0025.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:3bf::7) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OS9PR01MB13304:EE_
X-MS-Office365-Filtering-Correlation-Id: ed3bb4c1-65b5-4b05-9660-08dee075876b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|7416014|52116014|1800799024|56012099006|11063799006|22082099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	zt0MMzJzsu2VZwwTn0iS74V2v+H7dyj0nIAE4umhJGtnfJ875slHyW23cBKMV1GlteTRWdCE0vQONTedFPS6EU6AkgfL0ir4aysdrNecU5ia8IY2dwMy1Rjp2VyhTJ6QxWY8nSIfxwniidCrB+3ME+O2zSgNQ+ZVLRGNjCJ4HXW2V2o51I/Hm4JLkR1TIkW7r8GYCzlfeZU3VUeBjk0t37mw2Cjs1XKM7Y6IEisw+On8JSQmCjqCSRdCKYDsPfY87fH4XptWutLdNYUh53O52XJcMOP1aV3fvwpstKEJ8zeM/hTuWVs0xXITxxvdJbeB8Jw/V87DNcI+PHf0VxP5Cg5JJAqSz9cmAxjs/1PisHK1bKCHzF0TRn7lSSGU65i88lX10RhNP0509aTOKFta3m9p70rpWXul2je5e6OiR+T9Prf8fVt88t/3NVU9SFwNQqxgIWnAq1vdPm5ZMdp+Xv/nY8YByERwpXQq7WyG5f5tyD440ynH2290+kPzm1r3zwFwHDauesJmCgFq7OmnVNrLaet74CDmxhrqULM/i+QzD7O6Se1sWp1a1zBOZOPJbjbRO6ugDaTW2pNTi04ruwUMJ/TfqfXtoZ8qaP92b4ovjTAXGz6PtcS1rybnLwkohKOu9nXlWzeXdPa/5nQtsiOcPRty68J0kw2Qak3M08vT1rO6J2mzWHZBiqHmfYvlXhzaFSfZAO2LJxuW3iULeg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(7416014)(52116014)(1800799024)(56012099006)(11063799006)(22082099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?u+QuGOMUa6dXCDPq9P4Lo9trlkay7V+cT8LQb6Ar7SaMHYLIQs/RR5t1ZIy/?=
 =?us-ascii?Q?MPB6R0xPJeUolLmoxdQIdHyBQ4ITrQla/+wrQd3PvwpwCzNQK1JHGNPl7pJR?=
 =?us-ascii?Q?I7jxt+nqzKhE3BbNbYfZ0VkyIYwm9yOw7IlmAC4wC8DzLMTRaRFeRjDxU+VL?=
 =?us-ascii?Q?2hKx/C30QMCYHzhn0F9Sennr1NcKvgVUwpVzt0xYTbWLYGa/BDyd21WndGJJ?=
 =?us-ascii?Q?O0rW1CpbBqpe0ojaiUMmRUuQhB+RxYxlM2CkpI1IitvJnpDYjzvwCI7NFlOg?=
 =?us-ascii?Q?LHMDjlRhGgsGyQ/TfLUbrPGnQnA6QxLyDEX2Ad2Ic6SZsGWaGbaEFazs7QSv?=
 =?us-ascii?Q?+SEPBMnUnKmpiXZjL5B6K8K5r9BWl9fnLuGuB6Mps8c0OiynGsqD23K7oTnO?=
 =?us-ascii?Q?2c6QBa/OfJ4Co+nWvLcLNi5Aa7PF8AapDICZZelHgdCIXxDIsNwOJ3MzHSB5?=
 =?us-ascii?Q?OqYb6mB2PGqhKyEtaJPo65V8kYcsp8etaFwhEZjUFff9LdRZZ0Tpadf3aQi8?=
 =?us-ascii?Q?pF/lvkYGRhkYM3dZV4Wp2Rehvsup0tv7livU/Bob+GfMyMX3RYTAMjNl0uEh?=
 =?us-ascii?Q?RD9aoeCWlk2dBtftgnsUR7b4bhMx1d0EUJo52DZr4kVw38pI8R8LDdj5p+7Z?=
 =?us-ascii?Q?CkbUbvxJxVVnqj25p820wO/H6/x9Hyf1z1SVeuachYVy3m9tQKFa8dmeKQ9f?=
 =?us-ascii?Q?Sr6+ScYWYRB5t3OesxSXoPeXn13hUdnt20xwAzskTnASBr5hJDxnnzO6uxOj?=
 =?us-ascii?Q?bllKqQaHPtZTqoNImBTn88nQW+Zq8KnIMySuwe3/LUEp45j+/9JaB8nPVR8r?=
 =?us-ascii?Q?pUq3OTPXhlaihtnBc9wgHeDn7Oe1bOlYZiadzBTM8rJ17T+aZ/TzcEsrvyeD?=
 =?us-ascii?Q?O2h5FjhJMVQjRLZLdf24tRYecVhKKXvKKIFidjZ4hSZGJrLaAWEvdAAIz6bk?=
 =?us-ascii?Q?ZYk5mooPOqlx8Xs5EWFFsGQKBsDQvXOLoljf/LGDeZtUcEN415wtwTfl6bR5?=
 =?us-ascii?Q?gGpUM83pWyrFi5uFoRM98GI8NRJqyhpRiY628wY9Itk6LpLaYvOnzDh49myA?=
 =?us-ascii?Q?GawnABGHFCWaD7wK3Qq2wmQoI6KJlTzjctIRHLdW3A5jIaYGNCbLOPdGK+tf?=
 =?us-ascii?Q?FyJtEnBJ8DVkFESDXHpKpOmVXr93Seg6vdKgNOdsFE0PoshOQeBQ5ded/gXn?=
 =?us-ascii?Q?wSWvIjzvx3259lkPgh6XI+ee6vCWtwcjP/umPAIWVsulwtE+NUYIYzbA/eg6?=
 =?us-ascii?Q?ok/yaZDXlMWCWuO4bUhOara0zvwYR6MBlurC3U8ETHmmjRMOpvjH0Fle2KHj?=
 =?us-ascii?Q?vEViPhGCspsyVoNyJovoQSuX7K+j6GAySujuGb636uoUvb9dlA1MfZgs1J0O?=
 =?us-ascii?Q?vQAHwsFCoagt6NWdGbqkUy7LfA9XbizkVPIgBYXfGIY8LLXsRi0baki/jId2?=
 =?us-ascii?Q?W/RjwF4oYNbRQNh1E4JOfocb3jixrzTXwJweZcKXODhYL5arZcf6bg4J0vWx?=
 =?us-ascii?Q?LrArFthzSpV+ZRgV+yb1KGWhjEOCXJRmM+ULBPPXYIbGZsyEjkH5Rn6NVHb/?=
 =?us-ascii?Q?izLdJbmY1hG/I20pG8qZiuUvqsZF4bODrJeoc3pQXsgEznDEDC35NSz6ytz9?=
 =?us-ascii?Q?fSvngJDhajkxn1ateXUOZWsX6A06NvXOfmKRyevNj0X+bauHPobJQNha/Y5I?=
 =?us-ascii?Q?CNgRNuQfsn2kJGv5iw07/JhugncmnpddcBq7PTe/SUKzys6bvZ55qNGdAg/Q?=
 =?us-ascii?Q?mrzFAtwG7YAQxN+1rQSEeq/fryPTdLI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed3bb4c1-65b5-4b05-9660-08dee075876b
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 00:27:32.2576
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KLXtO3+phTFRO1M9ok5pQnTPzCiswA2s3C5rdLoboQRn4QIh2CtbgkibVDhzQzNCBZ7xqsBv8ie5rnccN52KtLF6CvVcRuJN5sz+pM47sORVhWyTd4f12maJLwM8ILnV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB13304

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/bcm/bcm2835-i2s.c | 13 +++++++++++++
 sound/soc/bcm/cygnus-ssp.c  |  7 +++++++
 2 files changed, 20 insertions(+)

diff --git a/sound/soc/bcm/bcm2835-i2s.c b/sound/soc/bcm/bcm2835-i2s.c
index 87d2f06c2f53a..2089778282541 100644
--- a/sound/soc/bcm/bcm2835-i2s.c
+++ b/sound/soc/bcm/bcm2835-i2s.c
@@ -748,6 +748,17 @@ static int bcm2835_i2s_dai_probe(struct snd_soc_dai *dai)
 	return 0;
 }
 
+static const u64 bcm2835_selectable_formats =
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
 static const struct snd_soc_dai_ops bcm2835_i2s_dai_ops = {
 	.probe		= bcm2835_i2s_dai_probe,
 	.startup	= bcm2835_i2s_startup,
@@ -758,6 +769,8 @@ static const struct snd_soc_dai_ops bcm2835_i2s_dai_ops = {
 	.set_fmt	= bcm2835_i2s_set_dai_fmt,
 	.set_bclk_ratio	= bcm2835_i2s_set_dai_bclk_ratio,
 	.set_tdm_slot	= bcm2835_i2s_set_dai_tdm_slot,
+	.auto_selectable_formats	= &bcm2835_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver bcm2835_i2s_dai = {
diff --git a/sound/soc/bcm/cygnus-ssp.c b/sound/soc/bcm/cygnus-ssp.c
index 47706ae0a31f0..753021789a522 100644
--- a/sound/soc/bcm/cygnus-ssp.c
+++ b/sound/soc/bcm/cygnus-ssp.c
@@ -1133,6 +1133,11 @@ static int cygnus_ssp_resume(struct snd_soc_component *component)
 #define cygnus_ssp_resume  NULL
 #endif
 
+static const u64 cygnus_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B;
+
 static const struct snd_soc_dai_ops cygnus_ssp_dai_ops = {
 	.startup	= cygnus_ssp_startup,
 	.shutdown	= cygnus_ssp_shutdown,
@@ -1141,6 +1146,8 @@ static const struct snd_soc_dai_ops cygnus_ssp_dai_ops = {
 	.set_fmt	= cygnus_ssp_set_fmt,
 	.set_sysclk	= cygnus_ssp_set_sysclk,
 	.set_tdm_slot	= cygnus_set_dai_tdm_slot,
+	.auto_selectable_formats	= &cygnus_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static const struct snd_soc_dai_ops cygnus_spdif_dai_ops = {
-- 
2.53.0

