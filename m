Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010067.outbound.protection.outlook.com [52.101.229.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33ABD258CE5
	for <linux-sound@vger.kernel.org>; Fri,  7 Aug 2026 00:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786064224; cv=fail; b=Mhp2pmM7VbTpsR9B1wNsabW8FWWmVjilxXZIEg3ZBSmYZj1rjPy3X8+jsZY+89qOx9WnVhejnItQRby0mz63zj392+2JhQoJUAo/r5EWEDGUqUXEP7HlnhM6XK0MOAgCaapYt+dVTDaN4ZsF7TO4LGRH0PPKMz4r714ahxWRLE8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786064224; c=relaxed/simple;
	bh=xwUki7q0CJMRhbukk2QarkGoiooFlp7jO9Log8x7qZY=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=d6jcV/PK7irdV8EJoAltBidQoQbbmOzgrKFwRTAmFvtvzU/PzV58yPw9uGqJbVuWafWwr4K5vj7YBL7s/rrfrYhkspx/laFP/KSUEWnCBQCWaInkVf/d2PrNcICECE8OB9KbcDFdUHkPYoyvPlzZkad1RsInYTvNtc/KoBSiZU8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=A2D/pVDn; arc=fail smtp.client-ip=52.101.229.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="A2D/pVDn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KVscE3iVCvLwPWrD8qd2ZXzHWLHOxmm6VwEJFcdX4e9JSDfxYKhl+8Z98+r3hSmV7MT8j56quHka0HJBywFKZ9eslas/UGDKbimzeCUKB+rpMb3b6F2v/bJPp19Kn3mUwFaGL5gOSeBkAk2Onl8HO++BMY0JJHysyiLHAL+z3r5VpivBo1V+QdDDraEEwGDnXvIhkxYbQUMD3MuuUiCREgsQAfy4ocI2IqUxxhM4fslsmyS1NhrgWiIiY1c+DsBOTMlJjmS5Q4nMFe1BAMcBmCdmh4WiGieL6mvVqfsbDHtb9g+Xhr67lTYzXhatflGe7yvamwiZTsWZuVebqRf1PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SypYu/CYd9ozTpWLISOOV8ylhFrMbqx/eVAp0ol8418=;
 b=RwoQYtpFmSsAwtTncikfadF19ThpqMymCcpbwW/J5yn9R8gq87Z++gD/GYO9KCevtYL4koVn2VSAOpVN/nKB6ghV92Cvxx78L0nEGO6CpEidwv1GmQYBVHryM2xTxr5SE1bncNvrxL3roI4eM08pu2aRGLDASTGNKQeo1EOu4EKBmBP1HuxFZkCBxqj9Uyk4mHKxiKQAeQEJKhvA5sHyLCdm/iy/aMFeHqiDj165YFyB21zK+rpPUdmQQATzjaYNFfvxxAakANGaNRpFZp/qIz9to+fVMd2CnIH/6jkACHVtYn8KqLdXEV0e8FyP2Mc4QsMYk32RBXUtu8fPL+6jpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SypYu/CYd9ozTpWLISOOV8ylhFrMbqx/eVAp0ol8418=;
 b=A2D/pVDniFnfMxxhw3vf1tfUuSd7DqPRxH2Yd9IDQhsmogck5zrI4fDFkuhbZ4NFkH3cUFud12oNl6j1WOpAJDI5TSOJOpyAWCUKFd/zzL/XYJ1EGCFgGxA1WHr+VUfktPdLgbqA7+Ikzf7JwUPylzOApq08gtolxeblhEUAODw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYCPR01MB6638.jpnprd01.prod.outlook.com (2603:1096:400:9b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Fri, 7 Aug
 2026 00:57:01 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0292.022; Fri, 7 Aug 2026
 00:57:00 +0000
Message-ID: <87ldaisq78.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Steven Eckhoff <steven.eckhoff.opensource@gmail.com>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH v2 40/44] ASoC: codecs: tscs454: use .auto_selectable_formats
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
In-Reply-To: <877bm2vjjn.wl-kuninori.morimoto.gx@renesas.com>
References: <877bm2vjjn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 7 Aug 2026 00:57:00 +0000
X-ClientProxiedBy: TYCP286CA0301.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38b::17) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYCPR01MB6638:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e555ab5-7a9f-4c10-49d8-08def41ec9a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|23010399003|366016|1800799024|38350700014|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	qrllU9A9HtQWu2FOKqYdFXRh6nX7bnClYyn+eBgZAbKLf/30+c12/eiiGOyichJo2/gAXu9GuayJJhWQmym7SufOEmxWByshXH/BJl6VVZbMINCPbBeEyX1jUtnbmmt6GgyUtjr/82bj1EKew06aISZGivnukhvbbox4ZD1CCDsyTcZ3JuAdwb7H/WNONLorsBOvPbsv7U0YWPNW9O+vuD9a/VIwru/51JgouZBXaZbgEPSSX6TL+dsviHizs0qpBPKRZFreviS8OHdMooLELjSsJ4TiQh0TNGwht4HQXuHo6wDbfd5qRqqVSTIdRVRVO8/3btq3g9fVH2gqjXxBTONXUL+M06b860XoLLWsAvQbGRyB9qBYC4rItasF78MgNmirnoHdbsof/jd8Ik9pnpOhkqpF+o5qyKsxyU/izTDGYYEGKnrj9ValIZZtjGPVdO2IEFoa7hBcyQfxuZP/y2At5RXlsHNFF+5tOY6nRBaaC9GGwoS/qb9VIpRmdDsEBv1Pmnv1HkRFDK2vj/79uVyVy/8fQ6pLXIpvRdcUVUx9U782OTihF47vZKZ9GDKIk58goUQEO8aztzZOagr7Fi/jo/ZYxyoYYN9jploGVR0+RI/OAVmGeKRB5FzxMw87vOiixHTI/Ye15gklRO72roUpexD/ImGrPBB1o0Jb19cSb8JtsBJyWcYmXLdvMcEUnNq2HSqIYQuwa8133MErZwgg3qbn/V3CaDl4OLR6jsI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(23010399003)(366016)(1800799024)(38350700014)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?W1Y+nA7zRlz7PG69bPYFN3LLChiFzGAwEnmtAl4uxH4xbdmGKMxKQwkQyYKk?=
 =?us-ascii?Q?2BMNWVlC7RHdNvG95ZEtj5esv09GQFFZozvge6//qPiBn3aQCk8vp4kwYVlK?=
 =?us-ascii?Q?SH5FqDt4apDH6/D2CsGletavbO3sKgBlUkX43uZNKMj9t4oXmtVvPBOtQqdi?=
 =?us-ascii?Q?ptFoDoKpGAzRuBvftACm6A7mlbNYpu1IBhiMScbs2UP4p0/d/YxaEyteMub8?=
 =?us-ascii?Q?FYAz9jXG6F+44bsSbbReElAHIoLelH8Kg0xAPgyjzo2zl54CLkLf9pB80WEz?=
 =?us-ascii?Q?tByNTHgTvhjPa6d9/8XS86FsAPt5S/RFd+T2RZYZphlEk7yYlJSZz7+WpSZa?=
 =?us-ascii?Q?75foLfY3MRqCbqTeqiSWvi9EqKX27+d1RIg6j+u9GROFCFcxhhyMDIxIHTcI?=
 =?us-ascii?Q?73zqwpI6cDgb/FRYJ6p3fGbLE8PCLjrSMUCcNNpbGUbUF34pCk0XOTlWvkXp?=
 =?us-ascii?Q?nXvWT9RNVYvXLkNaS4XdUxNaAqFnRgrB+p7/UNCKlYBVl/edaHtEKoHawuH5?=
 =?us-ascii?Q?biPAL5rtxnp4b7cTyMN+MvV8QUk9w5N6SnWKAlVwp5toXJRzzfsijdgpcz3Z?=
 =?us-ascii?Q?FpPUKbJG/mSbx5s4oELOlDcj/08oj4bSYGEt4H/T52pFaBLXmtxawSBP9NkC?=
 =?us-ascii?Q?uQuKQzjulSoXfGH1XrBgQV8mWcMTEKWRjdmuIZj3BV1rq7aILtut5LZ6rS22?=
 =?us-ascii?Q?JbBzTy0JOir1PLFTlJGY//Js3AQqfBsGkA/8c7LzQl/ZzvzqBFtkenqsFHnX?=
 =?us-ascii?Q?24qwnVc3xUOdgQmH9kFN5AoIWlN/RHoWcm0xO9lI0lIf3szkDo+FxxbL4F9/?=
 =?us-ascii?Q?PGHuR85Rm8jeqFDQbOQmu+Em37ulbotHlUOY2ERTLqjGwReaH34k8eisUrzA?=
 =?us-ascii?Q?uDzJRVZzW2cBprFxPoZrrSLCa33LLmfpD3iyZny4j+8hRaOISf9+2rOl9hN3?=
 =?us-ascii?Q?LnBkRyTLnE8OyNQGfgNWESstT5XkKj2zpxIDMFDNqR2MvD0Tb95EgxQThEex?=
 =?us-ascii?Q?q91gKpyymtKeBrCHrZekREGFEAV1EXgHv8U/CrP4qUWNFAyyucaAowipOYAI?=
 =?us-ascii?Q?UY9U6ebRHtkcWaDKPNK3l6nJ8dpZz5aQ2fKqkY9gBu2NHL3T7nD5pLvg9oco?=
 =?us-ascii?Q?XUseBQxVvub1Avd92B6Axu2g4LH4lg2ca92FZwxSVrL426YtFd61UAmc5Jk/?=
 =?us-ascii?Q?z8ifznTeLQC+yDP3CmyD09U93KNXmmsQkvX/FCU5ZTsBu7ye0vu6rho35rSO?=
 =?us-ascii?Q?gdjUml/z8mdDyiXkdR0e66ainJDS0xxeUFDXrX9JaEwR46QbYerZnSYJRjqG?=
 =?us-ascii?Q?H0UYYZOGCXjcKCswMIaSSDCc7EtgnEpZhgItgqntCq/QIMISfwztxRFcrwEs?=
 =?us-ascii?Q?AB/BVzbOxi1NxQvsAs33tu+1Vb7qJgEoh7DxYR2YZak6sEF1Yqdvv0WNonN3?=
 =?us-ascii?Q?sIuFIY6iPNwyNYL3HAOQM/qDxkaunIQftU6XleYK1AnXVrQzAmB91XMbayg6?=
 =?us-ascii?Q?4+DksKDjKHoqy2/Prm4E03TSADyGrt1AZ91tjYbjZyk2QM/HZBvm3esYW65E?=
 =?us-ascii?Q?Ub+MuFYvsznZ7geafTmiet9DIyTWruJMTrzf0g8od8NwSPHgRAxDsCJZPH8h?=
 =?us-ascii?Q?daN6AU5GnKu6JznXW/3zFj4yHZnzQy8xMf8OaDmwPihK6iSO4+g1DbcfgFRo?=
 =?us-ascii?Q?61n5aGRR/GkIMXKgQt1p56jdK60Xj8ziJnlhukfuAUudiyFuPoeP85oDeTd8?=
 =?us-ascii?Q?oK9yadlXBgQY3x2eluTLWECvDNd+gg0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e555ab5-7a9f-4c10-49d8-08def41ec9a7
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 00:57:00.4077
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HWMGYnp8tP3BmHiMjUxDdxVccOlxCAQ8y7MQnNwOMh5cVVPrYr6CoGaimae6NIevoB2vuhl45oCvwzHuanzn78PHCQu4PrDk96wtYUpaNKXeycS4D/9SodSB9ptA4eFv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6638

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/tscs454.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/sound/soc/codecs/tscs454.c b/sound/soc/codecs/tscs454.c
index b70c9d931e1eb..e772dd39a849c 100644
--- a/sound/soc/codecs/tscs454.c
+++ b/sound/soc/codecs/tscs454.c
@@ -3233,6 +3233,17 @@ static int tscs454_prepare(struct snd_pcm_substream *substream,
 	return 0;
 }
 
+static const u64 tscs454_selectable_formats =
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
 static struct snd_soc_dai_ops const tscs454_dai1_ops = {
 	.set_sysclk	= tscs454_set_sysclk,
 	.set_bclk_ratio = tscs454_set_bclk_ratio,
@@ -3241,6 +3252,8 @@ static struct snd_soc_dai_ops const tscs454_dai1_ops = {
 	.hw_params	= tscs454_hw_params,
 	.hw_free	= tscs454_hw_free,
 	.prepare	= tscs454_prepare,
+	.auto_selectable_formats	= &tscs454_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_ops const tscs454_dai23_ops = {
@@ -3251,6 +3264,8 @@ static struct snd_soc_dai_ops const tscs454_dai23_ops = {
 	.hw_params	= tscs454_hw_params,
 	.hw_free	= tscs454_hw_free,
 	.prepare	= tscs454_prepare,
+	.auto_selectable_formats	= &tscs454_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static int tscs454_probe(struct snd_soc_component *component)
-- 
2.53.0

