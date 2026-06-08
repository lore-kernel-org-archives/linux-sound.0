Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010011.outbound.protection.outlook.com [52.101.229.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A59DEA59
	for <linux-sound@vger.kernel.org>; Mon,  8 Jun 2026 00:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780880289; cv=fail; b=I9P7Jilto9X8jpaIwJ6p9XmGNotm2Id0CLjfLG/iN9FZAcBdig7o+OfsdI3MVQ0vaf5fv6c7ps1wbEfnW866Z3N2ISO0Nien5cIC12jWb7QPfGcG741awaJm2fiQpSMVMZuewqbdiTth9Px+ac787RjELK6F/Z0BTvRPnBFuVo0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780880289; c=relaxed/simple;
	bh=r+3mUaTi0L7swTihvrY12ws9AHgWROdJdeiuu+J/9DE=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=UxroBEuNKoHwM3cdT9MmRMcyiDIw72Vxq2mhCT01J+euM1wXaLtWpfxpGTGKinss9/6cseB905SQjXJKeVvmCdtn1Cx9cJINv4RMBOt977qBtzunwoyQHtQm/pjgCGcae3cGtJRgGJKA6UfXwyUC4iAEuMteMrcWaLnzoLFMe+w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=eDqf2rBu; arc=fail smtp.client-ip=52.101.229.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="eDqf2rBu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E1EW+Wy4QvdZJWcsLsG5B0BWNEQ8S8gplwFCW+W4YnVsCJr8RL6Pm7R5hii3CEdDj8NZQ/61v1BPFiG/R4nsuHuimJha5iXv8iKouDl00WwJIDtJbXZ1mcDlmmfJ8s86Nbf9NAqmlLbICiCpxCjtAW6B9A5wIiFNnDLmKBuSNZH8nd2sSSyP9HwvEtVgTjJIvBW3UgPbkJ7Bl+v9+yxtaIh0/PVAfk/2Lrn0NgHNnQdJH40fMC0+oRamtfqiTILQff+Nlp+I0ZJ0KRYW/gBUzroCggIZ8PkkPQQSMsQDu8hKnLFeWSOmm5qSyznqjQP4H0CV9StQd0ufJNRIY9VlSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N5hgmOHOi+C3Na4pvJjzo25hQmKxfs7B1iGqaqAhwKA=;
 b=KWbAiw6BhJ/1I8yWGIIR92bGa3XCreanla9SnwsF8nDCtcg8Q/948dV/kLJGhaP6Mz1xzC9mdXilsE1S1ZxvYfT8swL7eiirebtydBsQ4h1xRZgahir2k4j0FUXrdhiSgIDe3/tmFncOB2mjSJtIDPINMJ5ahqlHcdhbXIzyOf73JEuBDJuiG0cuuvrlmgPJoWHLMHf2yR12xlHpEgNiZXa6u+zNVclBLL+imeMepG3IUgembqnDOQI6VkvQfV7iKqTW1VXzja3Fi5O22uZ27QidiRDMpYl/nNRiWwN/zxHEkmLErucao89kBs5gYpUUKdc6GzqLJuI2QzWpx7OgTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N5hgmOHOi+C3Na4pvJjzo25hQmKxfs7B1iGqaqAhwKA=;
 b=eDqf2rBurYdo0UHhEWQBUGfU4IQvmf1R+I8pBNMdD2ewuCVtG9xg9RUb4X5Jzdp3XuIb9A8GZyC2B3ug+nGogqeOklTGqw7ACeFHd/T1fybFJViw8/4Yr2fCqUjPgkiE+ubVSM0lwCxto0o6fSeTbCD93daidoUHewc2PKw1ifA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OSOPR01MB17966.jpnprd01.prod.outlook.com (2603:1096:604:478::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Mon, 8 Jun 2026
 00:58:07 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 00:58:07 +0000
Message-ID: <87pl21etlt.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 5/9] ASoC: codecs: ak4619: update auto select format
To: Baojun Xu <baojun.xu@ti.com>,	Geert Uytterhoeven
 <geert+renesas@glider.be>,	Herve Codina <herve.codina@bootlin.com>,
	Jaroslav Kysela <perex@perex.cz>,	Kevin Lu <kevin-lu@ti.com>,	Liam Girdwood
 <lgirdwood@gmail.com>,	linux-sound@vger.kernel.org,	Mark Brown
 <broonie@kernel.org>,	Sen Wang <sen@ti.com>,	Shenghao Ding
 <shenghao-ding@ti.com>,	Support Opensource
 <support.opensource@diasemi.com>,	Takashi Iwai <tiwai@suse.com>,
	=?ISO-8859-1?Q?=22Uwe_Kleine-K=F6nig_=28The_Capable_Hub=29=22?=
 <u.kleine-koenig@baylibre.com>
In-Reply-To: <87wlw9etne.wl-kuninori.morimoto.gx@renesas.com>
References: <87wlw9etne.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 8 Jun 2026 00:58:06 +0000
X-ClientProxiedBy: TYCP286CA0346.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:7c::14) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OSOPR01MB17966:EE_
X-MS-Office365-Filtering-Correlation-Id: 89005091-4d5b-4791-e112-08dec4f9007c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|52116014|376014|38350700014|921020|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	96hc8QCJ0dGWLdEFWE35/lpAyKKmM3/Yk9QBF47p/t5SP1oQhFzHwQmKwjHgTeO+OSQLuwxJxupSb4UA5BGonGQRTm76gIozyfGjmCx0+8Dg5+xHaTtc/GaCx0ZBcTk2gyE7theGL8OR0TiaPDBT/ZOX3C1t+LBLn33Bz7anwuZ86SmS+4fyGuDvSPCjdhxs5vflrvCEYhYN4mWghznCikh2Th2X+82ce14zTEsm0OLz2OKuIOcngVbHzOY0F0zntTVu4gDhgMtCz6tvuCrfY4W8SjN8LcsOgplHS1C8VBh67v0MoMxlhsxQ8mSlJoWXgB2G/xF2aeR8dfW4Fs/N3e8QezSRKg7ph8TXkJd4BSiAPoQLHXRbs0QXxCEM0ggZnGG+bVLgXglO3RtXcpvCDw9694Qu2eAEREmguGNN2tIb+aXAzVn/phuI1QoMXVkL5Jv3mq0KUXiYF+qNe3n/4SBkMVfct76SQeLFASIOx6AgdkMHIEIyxheajJ/nIDABanHvqhcrDzlvsDO24Nrg3Zmy2m+demv4WISP1hb/0PSpgUIi8SafmDXbvVhjPRHmVdsoF16k/Gax16lpFoOwQJVbes8s70yARO9Wv9Ki2Zmlflw7KK0R16ql6d5G+JhAKJR8W5oiZoAs+wa1JiV6hCz+jHGAvW7n5n3hhyimZbVviBvDQONmoEsGxnvq2c14JhjtNvbPlikhDBhzhLG6kAq9Skekh6nhUXwJSdOFbZEyhaiuiZzaUsbvUER7xoJ69eqCtkeQYFXD+QVNtx4qFA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(52116014)(376014)(38350700014)(921020)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?usT2tcincdqq7g88wWzMnZ9Wc5GxGv5x3zz+Mpi/X9abs/t1ncrLF7bG65po?=
 =?us-ascii?Q?eFYKfCZ86fOWuOcrifjcHz7sBbY2CzNGT5HGdNYOqAIH7IOwi9Uk2rWy7bzX?=
 =?us-ascii?Q?TysPVD7saK05CTaZxegw/DlcotNY07EqWUIehWfTsQA0nUE3EpPpwpZ8XqpR?=
 =?us-ascii?Q?+d4VLo9etUdz0zS0wnSejInMqvrhnIc56pMx1CilD7v7v9JRNFMOOLMHNfxl?=
 =?us-ascii?Q?446Zs51YiPijQPkHHuGGBGomvtsuKLkI+vZlDw6wYMv2S03nsKKpj3fxuKBC?=
 =?us-ascii?Q?PVsQ2u5ZvbQ7CV2F2YFUayDxcFaNf5ZFnJqAORRotBjTmP9nHA98QrxInDJT?=
 =?us-ascii?Q?PzcFleRRHC/BbdixgR8Qu75JAuYrhvlI3yVSmsZUsvnqWSmbfetZhs/bg3/r?=
 =?us-ascii?Q?5YrcKWCiothMf63E76ERmSwp06J0S8EvdkB4fvnerQHbzqgNL+Ibf1WulT6x?=
 =?us-ascii?Q?hrQ6zFLAx/H3DRk6sDWahu9+VXhpSzHsKGa9e/7xyr6ou6Rb/HYt679+CIq8?=
 =?us-ascii?Q?/WOAzGV6PSSvXuYalHErs35mKrLBclTFMS1khOAkfwon5xoI4XEn1OHpRB1s?=
 =?us-ascii?Q?+j1uS0tTq9JcODfaJOnUvVrHepzQTbPRu9E0ik4JoP6bZZCMDzm5PqwY8bnE?=
 =?us-ascii?Q?6E76aamkqpVl7903erSWuBF7kCj0pjTESy5vuK0IONRBO8/bPI7Rah7J7CXn?=
 =?us-ascii?Q?xiwYRtsblrVrGGX2hfAcak0EFTJtSp1GfrsTCuXkTmVaaoS2uxF4ErXtO0wz?=
 =?us-ascii?Q?tzTKy4j+CnkD/Kf2rU0AZkzkzkLfp0JtMh77UK6WQNZSCuJcQnT55fM5xb6x?=
 =?us-ascii?Q?4ZtcnM/avWMZDm+bCqK0/dBBDqDUTt3Ycm2pymGEdnbOf3pmKx3ILJq6aEPS?=
 =?us-ascii?Q?NksiMc7R2+vQI46clu1/UBiuTp6G07IAKCx9/gDu/4ETEVjYAaFHAl990EhM?=
 =?us-ascii?Q?z0r6AmbgHPlXO9FroLMTTDramwlNMPRiDL84d8nuKNVHlWolwiH5Y6HFkR7S?=
 =?us-ascii?Q?lUIgGoDuqmFuzxrcfXBIiCKIzq8Ev0DZCxIli+2vvCWlPtPp5I9jAS9A5ppF?=
 =?us-ascii?Q?pa52nxlkbXVJgmjeWNJvAiHyLzVZu76apgE/uXKVG+U3MIZjVjUKw36sVuB9?=
 =?us-ascii?Q?uJ+jq5RYiynN+lNpn9KZpGqoFM3qgnlA2eStz1F/pk1u7Y2BK8MJ7ImOvpPa?=
 =?us-ascii?Q?f/AYJCP7GnbAvgeGoO7hQp27EkicOpVIudiYauw/D7U6uFleaouz/4nYDN5O?=
 =?us-ascii?Q?e1J8XvfryRnVBARrdKG+XLriZY4drVyJUgQ37NqsIY/M/1B/rKc9E5OsBNFS?=
 =?us-ascii?Q?dhSujpqLwXgGoAriPROV+5AnfJSag8ZLf1XDhDsApVuDl5OqUqc6rNVhrN3E?=
 =?us-ascii?Q?hbsbm+WfcL6fgZo00vW3qQkZLwb6hqj4zmqe267QeChrwCkdeWPxHvJ3yEKp?=
 =?us-ascii?Q?g0DNFLDe5IngoIVXFEp96xmq35FJvPVzFiKTfdUmmADqHY6Glr12+PYied82?=
 =?us-ascii?Q?Cirg5Ek38F8oGzKo0Ds6b5nxehCdSbe0mjemC6P6abUMVYiRKwlJnuutuErk?=
 =?us-ascii?Q?KwE0cQqFAJJXzZ1l7OAlObc9wiS7GdZPyndrl58HPHKnSGYCTSLtiTecGxLo?=
 =?us-ascii?Q?8zDyjXFwZ+VMDQxrYr8htMuKnh17YodmFrSOvng25Zegnpwc9dFhvhQn6gxL?=
 =?us-ascii?Q?EVBliyp0jGnCbqAFOJAUOH9a8fMnDpJ2LgMAPzY6+SQPf+cMOiyY4UdtmImV?=
 =?us-ascii?Q?362sGDQGVQkP4kpVQbDiwRsdZ+apHR7KpMxgYLsqzkFFP5tG1TNH?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89005091-4d5b-4791-e112-08dec4f9007c
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 00:58:06.8857
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1x9nZHbjIkSRH5aFP8OO3cosLiJbX2Yj4USv/8xOLn9y5HophzW3Fv9MWaBSc9Me8oQwP+/iaT0HRcMo8/qf9aph87NGgcko+bpHd4iUXb9yV263mwOy4/Jiuf274pfY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSOPR01MB17966

Current auto select format start with the highest priority format and
gradually add lower priority formats one by one, and search matched
format. Like A+X -> A+B+X -> A+B+C+X+Y... (a)

But in this method, we can't handle format if HW has some kind of
patterns, like A+X or B+Y etc (b).

Current drivers are using (a) style, this patch switch to use (b) style.
This is needed before update auto select format method.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/ak4619.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/ak4619.c b/sound/soc/codecs/ak4619.c
index 192b0c3413968..d9c9f6b200284 100644
--- a/sound/soc/codecs/ak4619.c
+++ b/sound/soc/codecs/ak4619.c
@@ -783,6 +783,8 @@ static u64 ak4619_dai_formats[] = {
 	SND_SOC_POSSIBLE_DAIFMT_LEFT_J,
 
 	/* Second Priority */
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
 	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
 	SND_SOC_POSSIBLE_DAIFMT_DSP_B,
 };
-- 
2.53.0

