Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011048.outbound.protection.outlook.com [40.107.74.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 663413749F2
	for <linux-sound@vger.kernel.org>; Tue,  4 Aug 2026 00:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785804087; cv=fail; b=j4awc+BXYSNQEUMsM+efi43fTiWXbvXbUmVY+tOfd/Nzv5X5i497z92JhlWgbrd569t/7w4scVWOdbAn0w5cnwBOBsXSw3FkJH5Q13lfXIbjA/FGxYTnKvv5fjAQQ4dQLUUoiAtvJbL8Dh33LiC3UCg3kiXXib4azi7Zf37Mb+k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785804087; c=relaxed/simple;
	bh=G6NocX+ssn0A3sg+fmwtnG70HLwVNJ9RHCT5jP9pyeQ=;
	h=Message-ID:To:Cc:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=XwllxYFqwPFpt+T2uExEBQXEd48MtwCWbt3QvyDEWM8oI+W6lg127cCXOv0sBBMn49lImu8CkKSUZISfL51in6uhs3q0S+PchKMCE+CerRAB64hFcMVMR6kEpYzCQKxEBs4EpLG3WP2T4HQWp8K/wHmDJU+L+e/4nR4rAhRZiEA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=oSbm45OJ; arc=fail smtp.client-ip=40.107.74.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="oSbm45OJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jJY2IU6pgoKcgT/D10/Ecjy+qWkL8MYOHKn/2c7I0vFXCjG8oRoi9TOkX1f+fU/AwRJBeEZfLNy7pLgrdTSXFrNQLnI33w75DycDWFD0FMnQYwTMmlKkci6Li6zhMjkdTtGDc/pkyk8eZOktDJgtwGPcHszj3uH7WcZFlxmN8JvjrL5Y+1FQctCO5RtSgdvGrZ+8vEFJKfadbmfhF5eT7nqx7GCNkegWs27i+ptaX+wDp+mKjtbaHqOJYkk0i4HMGwtpCDcXruCjdm5ZE6MN6fXPXMGzlUC4hEhucx3Q4ZMT043xvH6k1HiMlAC1pmK1EWjhcUvOafXtG95xXz99ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rb/3JR63T0653L/OoSTj7XwbR2VkT7Dsun1USRKF0Oc=;
 b=pws4LMXyGEniuQImRQDQJK6ZSbVFFR6KraJY0zH0BaRd/c9wWbVFWSdgRDewFaaZWMzGbqN3Je/QYNEFPxbYIIFsZk0wWxvd36NplVOFQPOmKNe2bM7dpksi68OfWzU/oEHLbDIxXB/GfBb5a8e8JMeMyRvLdf8t0XHdu2gdKYnQ7lu4Q91xi/cu6GfRkLDjoTNssozPzLLEs8mJ8JMQqS6hd95+Rv2pROUOu3wQFHYpU0zn+KNTpW5dqLgwMJ9+ZXqHNbkEx3JulcxOu/IWjDfbXw1urf0WlrrGZ9+qAGAbKGamGjlCWSoORhRBVjVe1Wlt+O0DZ14Cfq2xULaOMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rb/3JR63T0653L/OoSTj7XwbR2VkT7Dsun1USRKF0Oc=;
 b=oSbm45OJzr0z46+AkHNx4ap6gKCZfSvXZLhp8I8EHSxp3z29PnO3nxGgu19FlfDJZb+m9KeOWfNtMYO/AFO87xScCz189ycAHe5TGbn/PUrVmEHtHg6BY5Py4BRt4J0nHZWXcv8+F0IEdMGSo4A6jjnYqE9JN9yqgPsIVGOreqA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYRPR01MB15651.jpnprd01.prod.outlook.com (2603:1096:405:285::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 00:41:24 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0270.017; Tue, 4 Aug 2026
 00:41:24 +0000
Message-ID: <87wlu6wwcs.wl-kuninori.morimoto.gx@renesas.com>
To: Benson Leung <bleung@chromium.org>, Cheng-Yi Chiang <cychiang@chromium.org>, Guenter Roeck <groeck@chromium.org>, Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>, Tzung-Bi Shih <tzungbi@kernel.org>
Cc: linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 11/44] ASoC: codecs: cros_ec_codec: use .auto_selectable_formats
In-Reply-To: <87cxvyyazi.wl-kuninori.morimoto.gx@renesas.com>
References: <87cxvyyazi.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 4 Aug 2026 00:41:23 +0000
X-ClientProxiedBy: TYCPR01CA0167.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::7) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYRPR01MB15651:EE_
X-MS-Office365-Filtering-Correlation-Id: 387f0308-aa82-48fe-0718-08def1c11c62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|23010399003|38350700014|18002099003|22082099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	ePPStLcwWMYffnKwCDyUPZ1BBuxagUntQYq/nS8Bcen2kENtPDiTr2KmIAbwtE/ZM5NX1M4r3ZfjtcBj+R6RcA/TcpBoqVVzEVrQ6q4qjGJ1/wUA6jO65NL4466NdKAnZ2qBHvyvW6zEIPcb/6vyPENHUT2ZssC4t8ZNsaiz3vj2T0rl7WqY97mpFMa2PaqebkJdNjv+V8zG953AFs9WmAhHCK2NELD/QwdmniOkBosQvkIWxdT45fPaeJNmagCkxxawsIiTZGmXmGzoBCgs1n5GWSyA4yHWPvj52BGi1e3GoL3n+LtrtPDDhRHbVk5RrwS6Tp9XHKEVa1TtVy/xDoVOUjfuTwoKVaerzPWCl0rNxvCZBRkVMesD89dNJTG6Mi3psgkOftodDQ8ekCyRXXf80M5in5CXDUjnfBdYWmA6GKfF2gDngv23Fevw0WIOrM1EZy2CC0rmhTtZZbbLFvTxLtXJ5VgMcCnykZOsGqavrYG5wcL4kI+n7H1MTjpd/aK22f+mNTlstCWcClnUWUbaOj0gp2Prkxnrq+WA5xWz+mpsfm9igMEzpXu1QlBy5jAmBtQjfQ/olE1ijV5lS0CTpwgK7V3eKFEohHugYIqV7FCSqTMyowNhh1IUj0baHzzSuJH2lfFFCfVjyzGDR1+RMm1ZMkQqm+sBbnhNk6hjdZU6s00CpYeXD8HymGJ2BNHWCWl6UmymO66ZSP8KVqWncJGyNj9xtQMNwokDdnI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(23010399003)(38350700014)(18002099003)(22082099003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1IsE791n/T5xDAm00B1bGNwNJHskjlM0geFWSXYh0sH1QoZPC7MXx+GEwNml?=
 =?us-ascii?Q?tCoMvo3Qzje1PSTIKI335WIfv56Ld/K0OYt/zYHcyEeC4evu/OtVMZGhbhrH?=
 =?us-ascii?Q?ppprimeOYrhK3PuDyg7/WRYnZ9OOSpFnUReC2keMWMqtskNlzuzxVJ4Rwtm8?=
 =?us-ascii?Q?H7k3Mcz77Ag9Lur6DybHpDd3nwygLw0ZDV3n4IVNc+gsLQsixrghngz/WBpl?=
 =?us-ascii?Q?vXpagH76LvuMUnRnsDle7TENnabLzl8Qumkn/ytzcreRw8fHC6jLjPlO0Pdn?=
 =?us-ascii?Q?0rATqyMSjrWCAvXOih7Ngx5qo2nV3GQ3yLPNUsPCOg0Uu9E4Ol2KWbNA3aq9?=
 =?us-ascii?Q?ZknrcKnAEqHclBpGmjDtABROsQVX2SmqJmzHaCT2h71C2gVyU70537Fe0ajX?=
 =?us-ascii?Q?nhYusxAkQ68StTIiSrbyfTY62yee5WS0upWCPDb/0XCutswlTXhWyPNROXtG?=
 =?us-ascii?Q?0fOmBU8VyTmPjfwCH6G8YYqnuW/FJxyGWc/D9+J4ifYC+x17cm41cH1Z9zT9?=
 =?us-ascii?Q?1ImSAoMkNE+uSVtv56KzR2D4OyZFGO0J2CUI6WUaN/cIpm48H2AgHXMIfgDG?=
 =?us-ascii?Q?IKqjAK43IzpPNVij0BmLmxhmosoHVXAoyEcqnra9h97ce0znBNya5HszuPus?=
 =?us-ascii?Q?PWGseem15MuhTFZDYnKjYCD0RNYEeqZvkOwxosOozCk8KHFoRdwbnwbjvzB7?=
 =?us-ascii?Q?5/JL4SeVV9MlAh48H6Z+HcU4jEKmFliTGNTtlmbAFvlyGt9xY2Xi+mR8/YPE?=
 =?us-ascii?Q?pLqn/o8zBWjn4sNHUMmuvmQamd5zJcAsqfVWpwX484oZSb7w66V4HtVhwNi5?=
 =?us-ascii?Q?ZbiL6g/VixSXY3+NxU4GMpTxLxkiLwKSIY85hIxx8JD935NC1FnFMRaMrKnn?=
 =?us-ascii?Q?eJflEAq3t7x07mhkfeUNmy6A0hXARHwwTna25HjD8txq02ZAp1eImImk765b?=
 =?us-ascii?Q?JfNaUgfdPq1BQ+3b+qcmbGbxb0FASLcVKk2as5QVX+wyyCGkhsn09X5TTQmu?=
 =?us-ascii?Q?DFY3nq3reLWNvx5sk/9xStn8VxuRiKKJcBqbEUXb15CNoNE/Hg708xJm7teW?=
 =?us-ascii?Q?SamBW58FncetAKl3TShGQWNSuNmEudJOIjUGwoyAiDadoJGtYLml7enypya+?=
 =?us-ascii?Q?Iz88Kui4637HGUaOo3+2SrKbS+fyOvsp9M53HbMwZrSxcm+LU921J0i8qMH5?=
 =?us-ascii?Q?EoUshkV/fUBAk8zFC0h2LI/P6MpdJTRxWhfXbEUSD+kwb87FEL4WbavT5m+e?=
 =?us-ascii?Q?pZKqAB5cBROOwqJMplaRUiVLuc9kW+eA1cPDsz4sJs6/hWGMy9pEv9l/J5XI?=
 =?us-ascii?Q?3SdW6PkwZGRtoa9/lpUqU0/BNSCul03UDtwi64X8LQPKCpoLtObPJupRhgQA?=
 =?us-ascii?Q?+Z16mY8e0zfsjkoHxsrIc/pwA9HO3U3pG1jxJs2M8jKMbdQ8jV7VSyLYMNaT?=
 =?us-ascii?Q?hq0jlIrC4N19dADV9K6X7f8P+NMLtq87hgH097uSo4PsGFe3MpaTFdHiB4kJ?=
 =?us-ascii?Q?fvvRsJklq+tE52xemsTJypArVJ+T/jeiKqSWL+pVY3dWsc9poH9XCiVLlNTv?=
 =?us-ascii?Q?kgqO1C3Rf17TjCL9qmx5kq2Ekvtp9Sq82NP4uEASyf/U8/MYZnISdSLv/NYi?=
 =?us-ascii?Q?LUtRNZCvumdJnAlwfTCThwxHDZeSk7x3zuZc3nAYcfpfxucdkPt33cHQlP/k?=
 =?us-ascii?Q?l4Db1Vjrwrw4X0kEwreqyz39ChFc4q81jAACBHu8Rwb9PSbwGyqJqSnx1wv7?=
 =?us-ascii?Q?dTWDHBnwfC7MStU+ujZgRFkE8S98Ifsm92lh9uH6oYoLmnwCk4EM?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 387f0308-aa82-48fe-0718-08def1c11c62
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 00:41:24.1911
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2QEp6q0ZC2un3o35uOwdraPtbxcx3MWEwVf8dK1E0EcYjPXAihh30otPYsvetjb1Hlm4hBeNJ20s8pfT9e9GTtFmbznJE7CEEul654y7Nri08X1BEMXn+95M3NlCR5Qy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB15651

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/cros_ec_codec.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/codecs/cros_ec_codec.c b/sound/soc/codecs/cros_ec_codec.c
index fd2d5d7f92769..1148e37e29cee 100644
--- a/sound/soc/codecs/cros_ec_codec.c
+++ b/sound/soc/codecs/cros_ec_codec.c
@@ -320,10 +320,18 @@ static int i2s_rx_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 				    (uint8_t *)&p, sizeof(p), NULL, 0);
 }
 
+static const u64 i2s_rx_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF;
+
 static const struct snd_soc_dai_ops i2s_rx_dai_ops = {
 	.hw_params = i2s_rx_hw_params,
 	.set_fmt = i2s_rx_set_fmt,
 	.set_bclk_ratio = i2s_rx_set_bclk_ratio,
+	.auto_selectable_formats = &i2s_rx_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static int i2s_rx_event(struct snd_soc_dapm_widget *w,
-- 
2.53.0

