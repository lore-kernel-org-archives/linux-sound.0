Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010009.outbound.protection.outlook.com [52.101.228.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1649F3C4555
	for <linux-sound@vger.kernel.org>; Mon, 31 Aug 2026 05:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788152937; cv=fail; b=vEokaw8P0/BQwDXyfqDem4cLnhMoSCtSlMmEq3H9Ku0JIRC7gaGdUFH30CbV+K7OvPBQ/vo9JHok4dBNvd1UkJSd1yNgtidMe0vux3Dgm7iiTOjyXb4VUXmHN4SCzExmZx/ERXnJcrNOL8BZLyFvUgrpkWORGLY9zulQ4AOSOAA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788152937; c=relaxed/simple;
	bh=EXg2MKj4Vexzh2skE8nIHgZxwDwtOqiFTLchjKabKiY=;
	h=Message-ID:To:Cc:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=LS+v7+o4kWjy3kKG6Zp7oHltF8tj/GdmQ69fiqZdnT8nCwIuIUUniCuvJTQ/Or4bgH0GtGmTVayCwCzENoJcm7RYL4jTEr1WXjyILYfJf9pyjAfMaji3mr8QKddCkScpYHdpkMu0g063l7WM487dXK4z8SFqMRWjIA9mohhFmVk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Y+/kxc4z; arc=fail smtp.client-ip=52.101.228.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Y+/kxc4z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nRCvFSeTYVWlXE1ifA41KK/ggIRt28I0dV2QizyjhHa5NXWJpq8FtiiIEJQBkt7KlA4Rr9yab1HKS2+OxLhy42eUwBggqOe13I6N2zF1vC2gweTNtJBe2bYvCa4AWxS19e0taTXohsplX1XtaMRqTHvWOccMyydVVzi6xHk7fdpdKyr0xpqhD6fJWor5+uoERMj8P7zdephIjWyGEVAfk42UkeLd00Ssn0X8sKzX48j993MiuUBtXJvKPffUoGk9k9n3G04E8r4QOP1B77nxiQ6COULy2Xy3YCw/TUXJXvocArv7DsPDHAY1Uceqcoak+/YSAOMJ1CrJ3jJoxbOQRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CrXUcXMVwQrP0CtfwNJ4YzFVj2CaGyH0SSdrza1RLws=;
 b=Nibu8M2rg9SuKkIrsf/0tUUs8wcuuEuxRAq+kyuEeeHDFkW33mbOhBammyxAaHsNrkiDmESvltzlVokyEYriqDlkQePYqtU2eV0Yva0OOEFrqo7bQadjDl/bJCNQCVHIrrNzhu7a0Efq78iAjbtnOfTJv2gkXxa+SILYBEgxL1RK/X7SLmWajBBd5SAdagimxJlh7Ecv7x19bVLkfhAk1hjqAJujaS1DJv0vi2MULykQNWIR6bcDYyv/nPi5R6cGF5wt43AgpPv3MddL4N6FypQ+1uJND1z7UnXApcms4IKQAYGjxQ23PBq0z9qvHl4tSED//zb/6zFg7Kxv+ttNrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CrXUcXMVwQrP0CtfwNJ4YzFVj2CaGyH0SSdrza1RLws=;
 b=Y+/kxc4zi2PuSEbkcfkFSA+cqe+pzAIVTcWELsEmDC1e0S9e0iLLHt9e8B22olXVaRIju+g45zXuqH8UM7Cbk8NdnIftevzqoxJVNeBehkC6au0RqQIeWziAsHbkvRN3f/NgFElnlNJtFzyTwueVy5/nhQXE01r6SwPTiBHUQsU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10) by TY5PR01MB18382.jpnprd01.prod.outlook.com
 (2603:1096:405:3e5::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 05:08:54 +0000
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b]) by TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b%6]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 05:08:54 +0000
Message-ID: <87jyp6uba2.wl-kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Kiseok Jo <kiseok.jo@irondevice.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 28/39] ASoC: codecs: sma130*: use .auto_selectable_formats
In-Reply-To: <87o6eivpyd.wl-kuninori.morimoto.gx@renesas.com>
References: <87o6eivpyd.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 31 Aug 2026 05:08:54 +0000
X-ClientProxiedBy: TYCP286CA0336.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38e::7) To TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB16474:EE_|TY5PR01MB18382:EE_
X-MS-Office365-Filtering-Correlation-Id: e59f4780-0851-4895-6ecc-08df071df419
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|52116014|1800799024|366016|376014|22082099003|18002099003|56012099006|11063799006|10067099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	IHfskx7o7baSOgxtrYvMofyxABydT9EHHhX1/eqpkfFzgCcMa4BA1cDdgBcCMDNgKWbsFG2k2x9NNdfgAjiYiBrLdXW6K2pwaBSYY6T0b4u2wQ1kjetu6KGSHoGxqrH+qsxG6G5zzI2NqzrkFjkDfP0Hxby1aebP2MnjIcdKJckTR8IiMaYVbBQ9r5TKvnygslmyWx71s2vjhqrG52Z1nfqr1f36jdf6a3KXf+qL+yWVDL7yBkBREtB+1ZSk1Eu9DKzFwYnomFAry6L0jYlxAlCxeZzmImOvgXCNvpJgOS7uVIjVXZ6fHhffO4ZD+60zjPMdvxyeNjvaFI8Gf6MKI69AEvxbtQvoU7kZJXG5Tnoj7XtcT6JswKQoHIsRUgXsYwJkhr74ULR4RkVnHQ0lon96asn3LokHXqPSoDkSO0KDoXW9F6kFxB3oMLzYgkYsvbSww1451FRfca4msY5gUf4TRc5GHKpm+Y1zom9pJK6v89AilucsObDwR8B2Jqx1iGTK9fDfxFUO0CLauuGxkZs8+LJ0fDRMJnZpj92lGCqnaJ7qCE02ac860bZWvcnmZRx0oexgxnxtgMKnTxJyDGSZP98f8NxaeWII8fAU8vFkq1bFfZ8fLa/9CUJjCv2GGtT5FVUEjHOk9lG9qUsYOSVZ+0aCTGXr+Yfq2yoLMhqRcln4LC2S8eeRmEFO8pCaIPmFR4kDL8NBQjgcs5saWFW+LgXCaNJf62QeIsnGNcg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB16474.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(52116014)(1800799024)(366016)(376014)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jBmqeo5NruMZkYA8auugZuS55VhNgguUbokWy6/W0VIDRyrN+6uds03X0FZQ?=
 =?us-ascii?Q?wIKdriWr+fvsSQ8lnmLR171f0nFRA0JBoMT/EaDBXt/2bYZfsyKgv0uc1aA0?=
 =?us-ascii?Q?ZOP0zKpRtoXS4A7NCg0+M3cZFIR/y44eAI/+kTjKScv7E28wT7epHj/21n1G?=
 =?us-ascii?Q?RR/xPwnXyRIYT0OuhPJgdivcBmlfmOMjGKVBpyk+PaRfSFe1+EPomCTV1b4z?=
 =?us-ascii?Q?cdIrO4q3q93v5bXb4ml76MHQ/ezxdrF7NVcRoCmzG8Q2axMgsIjXtPT7Pg3R?=
 =?us-ascii?Q?Mjpl9x1QVMDuLU7iM4WRIAsSLa7VfRQvgFmCo/jNznnKgBccUH4qEvthLWgY?=
 =?us-ascii?Q?XnWX2zkePVgwT76CWowO+K3up+qNlqSVQ0AWGJq6K49CtCGTpt1HuAtdr96w?=
 =?us-ascii?Q?DPaklicj3o1/YBMer5pW9s3XOyi2BR7ti6MyQenTLhM5b490VEt0kT19ibsX?=
 =?us-ascii?Q?LiCYgiyvpU1LJq3WnXxp13mvSoJxQoSWfb9XlOXGIrQF2deqoUw04NBu4ube?=
 =?us-ascii?Q?shDY6SNOlzJdngcFLjTVdP/8gHBmIxxK6lkpmANV0PwnwCvtptrWrQJvaVuZ?=
 =?us-ascii?Q?dTUIv8Bk4PpC2G7ExO8qINSlO1flYWgUwSDP86krFMT+98aaZn6nWY+5wRK9?=
 =?us-ascii?Q?WGa90PfdjkUiRhphHYOU21qWTNsIjPZWc8zsdoMcrd4k+H2BUoiMVCqJEGHP?=
 =?us-ascii?Q?vOXRQt+NxhtVA/TGwYeNcuVfaqnn5CdFgRhlgi68c2PAQgLNpnJvFUHla4OC?=
 =?us-ascii?Q?JXdggYnQMGqyN6LICP7XZ8XAlCuyaZQfeox4rnWRYwc6Gchn7TBI6K6+V8mg?=
 =?us-ascii?Q?mbFMK2nn2o3MC/VdA0xjX05wx8kfouLM7HT13zsF9i/d4zSTounRmUFxNCx2?=
 =?us-ascii?Q?qv6xO8mskIdoXGqS2frVYJtW5FVcgYQzRkUWc5pzjInuAdR2b/to3Kw6DzMX?=
 =?us-ascii?Q?XIGvGQ9q93VNG076XsejO2wQx4bWEFBW0YBI6cxkEe9EDH22AnTUO8EzSm/l?=
 =?us-ascii?Q?wrrOM3OPQZ3pzW9PBkNFqCgf+OtxtXpPZ3ahayqd5PjcFoZuNKjla2bGHDZZ?=
 =?us-ascii?Q?XKhlm+0hZJ6o1ZwOYmOEpFUgli3Lg8PVPevEAO8j92/p1mkIhHikgZNV5JXV?=
 =?us-ascii?Q?KQZqpWEwpnPEQvipWMDyORpXCun1sXiUVsHktwrTEIma5PMcfTjSpIIBU5Kd?=
 =?us-ascii?Q?Se/o/Pf5qIgz4PfTW8KMGIwSt/D4TBn3Q2YtbVSsNSElK4rQeOqQq5SZQmPm?=
 =?us-ascii?Q?9DULVVrlPVAmhDp8nH+GVt9qSvHefoh721WtwZyKaEQxHCGMkv5y7H+iIdDT?=
 =?us-ascii?Q?2M+wwgQYHRDLgv7wkNbhils/MGidFYqbvdDVDXiCaYhgxEtnSE0ja0AI5rBp?=
 =?us-ascii?Q?GhgCTT4uTTV1fo2HdL4DU/AHiL79NC/kD86oVgut3oHiUb/1m2JO8Pit9Y0F?=
 =?us-ascii?Q?xb4oMabrmLdTUgqgV8/2lkm+IzYpu7vv+RpgD8tIQFj6FLQWbBTWJQbitZBL?=
 =?us-ascii?Q?KuLqpwU/Od0puqaIkcE85z6XpJ5vhxlLdi41Jtatj6n/fhErGVjEPr1Vmatr?=
 =?us-ascii?Q?t+GOI52fLpPPpl8NG8T7b8xfRi/4u47j3nYln+tGZg8JC1OJftqjl83/I4V8?=
 =?us-ascii?Q?fWE12S2PlYkx6f19xEtvJT7H5QF2hYCzTo9p89p619xxel6V73crBOzoeMJd?=
 =?us-ascii?Q?3t9Ne3ABOax3dIW7Kq/ewyRKDLVUiq8mc8T2TpFktgukYxL/KcJkldqD56EB?=
 =?us-ascii?Q?E9ctDRTXaltyyJVduyL3ElrmOqyzQc5JFWoJLgZoKC6EjarYUGDA?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e59f4780-0851-4895-6ecc-08df071df419
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB16474.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 05:08:54.1375
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ayiyaV6lSAGMypSnKbRl7khDVSNxF0CdQyt7k3HNx//N7tYmZh5l3ZSshF+ZjScGWKqI02RuCrZ72Y1rmYCWCh60Yef77RUoaVn5CB5ziI27QOx7TAexz/MsjKKq4Iy9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY5PR01MB18382

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
index adb369a29b9d3..ac55bf6f927b5 100644
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

