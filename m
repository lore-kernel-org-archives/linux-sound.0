Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011007.outbound.protection.outlook.com [40.107.74.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A260E37F8CA
	for <linux-sound@vger.kernel.org>; Tue,  4 Aug 2026 00:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785804106; cv=fail; b=Hb+KheNIIhaaoGTHENoaMdnvevozt4ztRPzuyUhpLLcx84vuf2BIMR7S9065cetq3Kf1rhuypY3rdORoi7yrBP7E2oREyrWBXimC+y3e7kwoOlKZpK2pnVTSsNjLiL88rxF+u/ITMS7qkrcebB0KdbljXPVomj9jUGawek4nemo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785804106; c=relaxed/simple;
	bh=g14Y1+0fk+OrMkAeb/kOh/PC+h6HB6Z7y4dxTVenS8I=;
	h=Message-ID:To:Cc:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=UPvA004rdH0LXFQMztV9Q6lzJi/GUqG7xwBpIU0WVUSlw0EVzPayLwQmZTZfKQr7QUsQg2UvuWpl9XAczRbtSI6VeCcyUNQFMbF1uVM6GnXRhY9cRdr+etImv6Jhaj7V1kE+968SShHeAxyQDY4bO0LWHEO+i15AC2lUJef/CxI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=TIknhV5u; arc=fail smtp.client-ip=40.107.74.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="TIknhV5u"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Muhh/ry+c5kyUdC6M2bBMk5HFvfIMHy5FY2wyS8vj+XFzA6heZfrepd7etcGW2t+OjqSEPazVVMpQ5vkbCAX2mAjI0h+edyy45IVeuy7CPLsa03Xd7GTu9BPjnG36gGJA6VJBQe3DYgTCbTERRsm8TCoJUPCoVi0crsKrV6+m5n5YdIH0yA3WP079A7Mh5JZsoabezmzGxJC6S3+TYJI9KID+cpf9+0BZgQCa0+qoT/zLMR51LsF96t10L0NvI5OkxcdXGlwOXVe/Jjr7FmCiZ/fwznpyfLC1Feo0tS3ywH+g7ll/pUL4WcG9u9C15OCtBFTqybGbxTB2JQd+586OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=949A0tNu46iBDO0TUUjAGQ3w7f8bIIxfbw8MtLdhaeQ=;
 b=q7Ss8ThoVd4EsQv5NB/1bP/M8xRXNZhCUq9Ap3YOseyPXvD8q0gWe0VJCyCkecQAjy+xtCZMoCbQUxXKmYz1zXM/wRc1WfyMaOCppTz0n6AkMbqcsov/mlZXnfIswtTAJjAzc65UxOBrXadCLF0rj3kOziAOVO15Vn+qTAYrAjowpV0Ctj6cMnIviXLP+wxlo8dvAQJpjdjJUvvoiVBGHaXBSuL92FlCn/jwhxQByQNFwjXt+YdLQnXQ7BCMmrfJl+5GgpS5V5b7ISKz7XIk9c20VtH3jJhYNA0bzqrxpEVGt3+9jebqdrEmyqkUlHqSR66pYJei/BGZy5szr7jogg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=949A0tNu46iBDO0TUUjAGQ3w7f8bIIxfbw8MtLdhaeQ=;
 b=TIknhV5uYKnD7yCR+mESJM7tkcSjlsj/hgh3/Wjv0cm31p1P+dqWoQgf5zBKmwr9AbtxK+hoPbTrHvXklf1nsEUxNY+RyXOAighf9m12o96DcciJMwipHGN2/UsGkNO19f4Risyv1kLN2aIYn1NOhOgNiE++MAhawnPyq2rKpvY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYRPR01MB15651.jpnprd01.prod.outlook.com (2603:1096:405:285::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 00:41:42 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0270.017; Tue, 4 Aug 2026
 00:41:42 +0000
Message-ID: <87qzkewwca.wl-kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 15/44] ASoC: codecs: cx2072x: use .auto_selectable_formats
In-Reply-To: <87cxvyyazi.wl-kuninori.morimoto.gx@renesas.com>
References: <87cxvyyazi.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 4 Aug 2026 00:41:42 +0000
X-ClientProxiedBy: TYCP286CA0030.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:263::20) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYRPR01MB15651:EE_
X-MS-Office365-Filtering-Correlation-Id: 7460a996-4ab4-4ff2-16b4-08def1c1272c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|23010399003|38350700014|18002099003|22082099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	QWMqvSaTAEVQUwOB6Gw5gOnDRNv5/fCt5dc3hAkK1Y/Jh+gc6h9rDGWIUTp+SolKGM/YiGAb4HzhuvuQ9mmVUhE1s24z9bn0u/VXuN8u8Wtqhd+ppOiF2o0UKo7Czf4w6a5HLZ3et47bqovrZfKv3bdCJ50Zcm7vd5gi71vhd75YAXVGshQ8RkSwfuzGAmI1oVVQ00g6ayUZpR6UfCHr9CTZWk9utjk3jhdUHVLjembszBbMHKSzsQDcCrol8ECB+5KChjtIU1Bz/MEomLxHqhtSMyCr6qS6rRIKCUWdc6HkwJ5vKzoPMiE2xGi2Juq7E7tYAJxJJYBfhN05wPRIiyyW3Tiy0sZOz7HzBEpahbJLXkH9uvmlbxY0D2m5Nwn7Jtw53VukLtief35hQplhuagMEpmwg36kLPoQ4dmiPM9A+57KQESxyx/kgLjOYepsfjQpMGuWsSl2dA74RQaywUu0AKRBkxk+VzSVUsBTZojwU2d2GxkW1ei+hMYCpjA78gDKLS06k004kAttkGcaIxE8zpJWudCQgBP84lxifC0w5y7DWS3fGn9FPqbPqbOxFvmJ1NNkEDTCCknr2GXbzgTb1vg5JUreYc+HdSXxK8zmNK9GCCzMnVCNlejIWxXbD3OOYFeyvbXkLSR79LeHZkWPd5C8yUcaS81s3YIfBQisc9Vt753mkisNZTfMNmSTqcda52f8ipf+dJNzvYxtbR4Xh7+sm0TTFMeASlrZvcI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(23010399003)(38350700014)(18002099003)(22082099003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?c+BAVIgsAPHOxEF9stqmtYVnf5SwvnNeUIvF9F9EpSFDnn9/AbPD2VQB5YVT?=
 =?us-ascii?Q?hxvOSdG729IwWJPkzcndqWWPIleLoK2KdjJxzSsTbemKarktDxf0SnKpV776?=
 =?us-ascii?Q?hoWKZbHl2DkHJrI3E9NnxszVqRbREA3lID3FpGA/kXG8j0Nz88pT4b03+KXu?=
 =?us-ascii?Q?p7Y8JDbgndaby1xEPD4xs7PHsD/aEhECaxJ7AxCvbWQcdJCcwKm2u/Ei0Wbl?=
 =?us-ascii?Q?SaK2XSWmkc/A76zw5Q6K3DZaYlI90aH7b1Q/Uq67MAuYtAkslokRV3f6RAnj?=
 =?us-ascii?Q?zTaiohBt+UZHaixai5LkLxZ7gu3n7s3hn0WZlUK2v25ibmZ7rc6BYMO82K2C?=
 =?us-ascii?Q?CCdisy7TvE4/l5UJbpmu/2y4OUkha2N1gFAfDUGn0XcgZT+4Ahtk6CudZPrZ?=
 =?us-ascii?Q?dKgkpO7XcAmWiC648I5gIyZBQ0uamAJoQtzxidSoqwSHGPWfkTHzQcALii4E?=
 =?us-ascii?Q?eNpweLnk4nsTKtQhgwyyWNIMTjYKVLMzWFehPh0fSErjcXSL7qIuNmqPJmNC?=
 =?us-ascii?Q?9NKztbAo3wSUulPBIo/BMM1O9AGhV4Ybr2SDTg6GUA86jtM8oFUB81Ml55bt?=
 =?us-ascii?Q?mONtft8TXCiciWAMpB76IJDTaQze4abSMtJDaROiIH9VdmwoYKOeJK61bevW?=
 =?us-ascii?Q?whuxChHMyBoRovSbTS8YG+O03Jggrm7nWVicfyd2bPWDC11qs1ZV+/vIKSbQ?=
 =?us-ascii?Q?quVAZO+ZppnbUi+6IPyYEibAgPdWoC8YBm3lC7c4FVRK0hagg7tL2CmzA72e?=
 =?us-ascii?Q?eg+hDVj+jscfdkls3ORAUY/+7cm9XbfEwTf84NqdFKjbTV9qfjkrCC1Z8lcd?=
 =?us-ascii?Q?smChVY/b8Bg8axPdVIA9MboYwTSL6emU6OHQl1pCBZIkFOpJYQpNbmo0GSmI?=
 =?us-ascii?Q?EDmxekmUMU7uBA4HORbjdXpPBwyi3UNyPXgbHBUmvn7QTjE9zjvYq14PoE78?=
 =?us-ascii?Q?p7TXnWURavYM3M+YeHkZ5tVAvGZ4GIWyf8XKcDdpyBtBYt0TBMm6Pfs7gkaR?=
 =?us-ascii?Q?8clhbhSbrl0HscxuA91vbbfQLWa/3jrhpB3miI+iHHGCIq+KN0nNFhZ2sLFD?=
 =?us-ascii?Q?Gs8U/fz1q4c+NsGHUFIMr3ABwBq+7/Lyax1J1wZSnz55NS+vupstVANWTo0I?=
 =?us-ascii?Q?tfAldIqCeC85soCdKZ1WV1BSUC3aY+OybdvOqIrXgGiaZcsoKBkRnmUz0egc?=
 =?us-ascii?Q?lpLSnjm52oIAppck0v6gz6tnx7eRDnwJ8skDWwFJJ6r/K5w+tFjo3FvclD5f?=
 =?us-ascii?Q?dy/1DUJ3uDAlOwMUs7Jqf2P0+55AclaEE+DuvuM1iI0RXHvhmVgix25Op9Ix?=
 =?us-ascii?Q?4nzOim6sGQ95jP3+0Q1X7FZI01XgyFKw5YSmxtKlE+EsuOaZ+9u/4ZjkKwwT?=
 =?us-ascii?Q?XFR3wZcAkVQE/83JN/f+spLNSRbSpfnHOBiOrlXGP8z86y6EaRxKO28Cq8Nl?=
 =?us-ascii?Q?d35KDLbpCvWZwx4sBOwbaGyU+e0O7faHyQCH3U1uW6KxUm8VBP39IsKw0E66?=
 =?us-ascii?Q?jhceAUb0YiwA//wI6a1HjkfjvL9FAc/mnWzSzM5C48Cid9/S6nQGgwYoOy1f?=
 =?us-ascii?Q?7wWFeSdAQ4P/6nILYLVM4PW8oLzejSuQgw+6gEyXKnshEHfBtNrEe9OoMSqJ?=
 =?us-ascii?Q?QTfD5iKA2szpntzDbJchCJJQ1i8NO4lsbwsrJNXB1NAnYS2cLGz6Yy794Pkb?=
 =?us-ascii?Q?VXsoAvbR6aNrI6ehEzWmu5M8jL6sxfR+J+kxmMf0YVNZbVcBvUylkmiHwQXE?=
 =?us-ascii?Q?G+sNRmM2YUIrlq0ccxKnckLR3BaFjDG2T6SMaNwttwwOW8noBYbr?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7460a996-4ab4-4ff2-16b4-08def1c1272c
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 00:41:42.2766
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r2+Rz6XspvLfolucfTjfgsJ6X/kgx+2Y5bhZfM9glKgcsUY4gXqK1zgWHnP4N51dYk2+zcjq0SYAYYAnTwuMRmanl/hpNVws/wB3N3zMmT45qFPkY4Oyf6r+ZNpnlozT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB15651

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/cx2072x.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/sound/soc/codecs/cx2072x.c b/sound/soc/codecs/cx2072x.c
index 908344ee58920..6e0de380e2108 100644
--- a/sound/soc/codecs/cx2072x.c
+++ b/sound/soc/codecs/cx2072x.c
@@ -1521,6 +1521,16 @@ static const struct snd_soc_component_driver soc_codec_driver_cx2072x = {
 	.endianness = 1,
 };
 
+
+static const u64 cx2072x_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 /*
  * DAI ops
  */
@@ -1529,6 +1539,8 @@ static const struct snd_soc_dai_ops cx2072x_dai_ops = {
 	.set_fmt = cx2072x_set_dai_fmt,
 	.hw_params = cx2072x_hw_params,
 	.set_bclk_ratio = cx2072x_set_dai_bclk_ratio,
+	.auto_selectable_formats        = &cx2072x_selectable_formats,
+	.num_auto_selectable_formats    = 1,
 };
 
 static int cx2072x_dsp_dai_probe(struct snd_soc_dai *dai)
-- 
2.53.0

