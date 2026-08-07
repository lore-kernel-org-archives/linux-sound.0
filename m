Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011037.outbound.protection.outlook.com [40.107.74.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BECE1CD2C
	for <linux-sound@vger.kernel.org>; Fri,  7 Aug 2026 00:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786063982; cv=fail; b=RhXa3KOWdEViNvYwwJcmHO9B6UK3TnJnkXmCizBY4Br2wUSjOI2T256vPuOYQW2+/vtlIX7VE8+szUBPWj32eFuNr82JPUHeHxOmsbu+x5lLfH8GV5J7CN6d3fFO1mu3imqaeI4AYcQcnOqK7w4kuKr6nGaOrllJetyxIt+bX+g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786063982; c=relaxed/simple;
	bh=pHhz/BYz0VrYI/fbjslyo/a0X6rfPXPqLiO5df50oa8=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Ivf4fOK8BbaHtkEIKDOJp4ypLNC8dzBt7AELjCeFdK2jR+vTViRTXSVgjs6Q3/IQnlofLNap/shJ7zpn/0kCkCTStvRDG7fZUrPj+NPuL2Z9FhTg8b7JmzeqV1nzvr60t5qeOtTqkAJa7OXbNmjRT0vlzKol2FvGhY88oGmFF0k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=A+REKJEb; arc=fail smtp.client-ip=40.107.74.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="A+REKJEb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SiuowAmyjUr7u6Rllud+pNxt+QKeQlQkJ6j8pnMR/YNphneDNR2452/HXjPXdQAwPxWnU848POxJVIyuMt5aKXgS9UY6Tx+luhxDhgbUtouenMF2ez7Si2cN4YcguLP6dhOkgG61wmgGlJBWFbGit9sjzSL6Xo2j02xA0THr8/nS7EwI1NeuywRs/aMlFcyc+7X8OLGiDk19oKkb4c8CbX/qyDZP1P+7qJCZUrEQdASelcA6KxllmaBsGztNSJHsz7xeg2ayGlkZmbzIQisalJrKbxXXdjF6P5KeWlP3eQDnKLWc1n0P2XNKZU4k2fTsg6DQom4TM5JNludROAi4Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dEHxJk0Sack3s7Z4Uv70lRVAYC04dSMnhJTRU3Ex34Q=;
 b=boFeOdCgVjJxbGMpOyNPOOCU0JdgcjQTZThzG23hPtPaoV4450eUExXzSQfMSvJw9laqlJnAMsGMHVIqnZZQ6/eRZJiHBcH/gmpj0TcV34BX7ksKbO+i6OBUY6TjVSmOLPMCjH2OXDoctAcwU8jM5zFBvscKoiGmMmTWo/O0N0IxPygJrSvbqOMopZY5AZBUmQBLFSv+ryYx3S2RDoxj9ARFt+0sWI2nOa9HWPSGvm6+OqJsz/LKkZABUDJ5GjeAqaaFhvUkSOzyj8wNs13spX1EpnVwdJGdq4KbdX3Sa1It/Akr04gkScRPUbQUq6jDdqbWZCnKQb6w51cH6AnKgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dEHxJk0Sack3s7Z4Uv70lRVAYC04dSMnhJTRU3Ex34Q=;
 b=A+REKJEbc6PiO6Yx10mkKvaYnVERcJ7K2bq+3+/C/BqNS3CKB6JJWecyzOr3t6o63iN21Ndk0uE9GAnOKK1GLbpoSrRY2ezSLNgbn3UEEqTupJpp0pNLSMY1ckiCn+KUWJt3ec3sKa/YUTKENSauJ9k1OarZ1Gcv1v725Gqm/HE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYTPR01MB11044.jpnprd01.prod.outlook.com (2603:1096:400:3a1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Fri, 7 Aug
 2026 00:52:56 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0292.022; Fri, 7 Aug 2026
 00:52:56 +0000
Message-ID: <874ih6vjiw.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Lars-Peter Clausen <lars@metafoo.de>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 =?ISO-8859-1?Q?=22Nuno_S=C3=A1=22?= <nuno.sa@analog.com>, Takashi Iwai
 <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH v2 02/44] ASoC: codecs: ad1*: use .auto_selectable_formats
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
In-Reply-To: <877bm2vjjn.wl-kuninori.morimoto.gx@renesas.com>
References: <877bm2vjjn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Date: Fri, 7 Aug 2026 00:52:56 +0000
X-ClientProxiedBy: TYCP286CA0332.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38e::18) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYTPR01MB11044:EE_
X-MS-Office365-Filtering-Correlation-Id: 62139d49-5fa0-4e01-8c46-08def41e3821
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|23010399003|376014|1800799024|366016|38350700014|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	9nmeyz8Rec+Am0sU5x1vVPHffUBRJrunxZ/yFsJL7smxR8xvABdNAUjXii+5/t30jJnth6gi7euzS+wj6G0QHp0B+xPmYkkRbbGiV56245rl1Vjaz3cCk/+FO/cBpSGN/URul+XBrV8rP340M8piqKyLLWBVWj7sLUMp/o55DuXJCDi4W8lVKZuVLC2NwJC6VCWGpompJVN5a4Oy/6BTtVfIC1PzRV2nC3OqbWGTia7LOLpc1eFXDeoTKwHoYfLeAKnzn/e2w8668DckxU1ltBvXtV7OH+7Fw0GFUIiY7ZypdPV9tkUzLEEciTEvj7Bz04VvpiTDucSNIx+jBC/BxIP/0br9ShnuUe+awtxrB5U4bQQzuPqbjxBdCtSuHkJHl3nrnaSy6O5RvEkf5YBNR0IvCwxlwUy3YU2aB0rdvwxnMeA+J6it6m5or+pC2JbC7QVTXmt0LlN2ngpsS7LPnErAIiNFUI+tY+bB3pNpHWkdtSjPLkC4KF6zzDAcgtvDteugnv7kuma12pxiXPrCQjdfl0xT4hw8K6nUZ0BJvXa4/tIyjut6lkdxcKRxT30YMXF1HvA5XTU8qJF74M2UW4yiGEmdn2omRXg2XFc+ZUNXOW159FlHoFtaRw8MF6AgGX56iRvMUxvg6+yld7YY5J51rgiBpUXhMLSOuUdk5sXyUSdY+PXqCB3Hk6lnbS31yqHR87DmLZqCjd+MNQgzig0Fmkc3iTl9TvYNFkUrB5s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(23010399003)(376014)(1800799024)(366016)(38350700014)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?1FVqFT4BnUQBHw4kOvqZl1mlPbDDmE267UNXLrfLNOB/uJ6nq4pWNUJjdE?=
 =?iso-8859-1?Q?qY/iMJxCrUjEcOT8SO5mTw82MNeOlKFeo4aXPSw5o1z98q77k2APUnDgPX?=
 =?iso-8859-1?Q?tVVcDRjX6drm+SKRYC0dyHDaKtXxMxXvfDsG6rW9cnMZYFxScxrKBEpF6R?=
 =?iso-8859-1?Q?/hJDXFtRRr38axshIxoHxM0t+IlNy4Y8Qqyc6E3RHTUVoEylVsuEJBUbgO?=
 =?iso-8859-1?Q?m3nbFbfUsW1jHRjDoVhLB33HEtpVtMcqU69MTFwZCUS5qOhlxZNPUtTWey?=
 =?iso-8859-1?Q?AzKn33DDtlAaYFukzS76vDwSklC0ZMpVymze29k051h9J7jgIq1fmYMP/q?=
 =?iso-8859-1?Q?qXATbML+JwEqaJeLMsNYZLyvncpkS8607YtfL0GWJ3FSXDGkoyuz/qSkfM?=
 =?iso-8859-1?Q?uKIfoMqRSNhVQz5T/Ywh+0cfpBOrTWfyH1cTD3JH5PXK6nk5QzdpDaWeT0?=
 =?iso-8859-1?Q?b4XQiWASd2Kkacu2wh7iUeg/ca9vKFfdngftjQf4xfDiSQHoHH426FxKrB?=
 =?iso-8859-1?Q?5zF6k3+BiUyORw3vXtvsbwBPMYv01HfySclY1RkAD0AenWbodMvKLqzcuL?=
 =?iso-8859-1?Q?9oPVjAa4txPfJdtiSRXAQ2+izCKiqNR16/ykbnLfdOe9A/5J2Rwji9cm3t?=
 =?iso-8859-1?Q?fkhKCbJdoDkkrmTkGMmHWQFuFsRn04zJvpc5yv//hZQhBsSoURravk3sY6?=
 =?iso-8859-1?Q?AZUbzk40mSKyXr3SJlO618dLOQomb7EuLVBjucpgPnQDWzxZmc2ne68mYh?=
 =?iso-8859-1?Q?59b2pQMlE+RYjCre4wBFHlsGW/CBIlUXVgThLsLJrY9lZg3C+yAJdkCXov?=
 =?iso-8859-1?Q?pSov3+xAXmqAIyQPsmFYdR2uNVudWpEFzuPPCl4G+9H+TvSUhKPBrudtWu?=
 =?iso-8859-1?Q?t6tgeJvW6I5jDyZ8fZuygF+gw7wrqQjRsns5jEEh2RH38clD74eGvyZyhE?=
 =?iso-8859-1?Q?I2HkaxBXbc5Y7l5g9dSU9VW6osuSoSBmTUurqUzh8YmyDGfCawAAuvu8gQ?=
 =?iso-8859-1?Q?HG/Zz5zryZ8Tiae4YyOoz62qZNTyhIFTaSrTJsbsOGZI7XDXPz7g8LYcqC?=
 =?iso-8859-1?Q?vrSF/2UcJAs+nZbf6nzITcelSxAvJSL8OU43Ciz33lKxf0uRa+Isxvc1gs?=
 =?iso-8859-1?Q?ssO4kLKbJ/z1l9Yw7ae5/I4wwaUsXcCRN4xcUGdY8ktEXDlISalc5NLDvQ?=
 =?iso-8859-1?Q?Pv552inW0/qE88qeZsD/WzqvUpAZySjdiPe+LrxZkUvd0vXzd/rJbK5Xkj?=
 =?iso-8859-1?Q?GCQNTN7/5w237pESa8X+uUPuEON4V1lBlkHG+yphjkKuN4HD0fCAkTX4ek?=
 =?iso-8859-1?Q?Oy4kC4gx2GQNjP0wa+T7fKeJ4PGdIF47lLsmVEBWxqzitvutM8Da5yYAXq?=
 =?iso-8859-1?Q?aVzjiJpEEWpzBj/Cl4qQMDra6GfuJbJ5xrjE/7/oDaBw2FBp8HLIj+ytVf?=
 =?iso-8859-1?Q?27MVHed6cs7cm9zWleWw0fFE00p73PPeEgKZN9QCS+PmNio86L3B0JsnQ2?=
 =?iso-8859-1?Q?p1fQIicc2mpau8ov6X9HD97LKjfFSj8N8N1OOfU6j/AM4ugZKdsA0VXNP/?=
 =?iso-8859-1?Q?S/gWHiJh6QDIttoJ47438klZs9k2QuA/P+vyd25a1ZpThpCzAYvdGw9cdJ?=
 =?iso-8859-1?Q?c+o9cjUugbmKF8XvjW/3LQGCsaoHjpK4dBHcueQgDI00xO6WMteN95i4HR?=
 =?iso-8859-1?Q?R9csizewOhExGGGHldqDZhXg0mWhExmhZ2VHixgVS0Bcl+2gq1y+brMCw/?=
 =?iso-8859-1?Q?3jCW9dTYdwCg79xy52om2nnNadHQFtWjNrKysk0BmG/5ZrK9kgJPwVOg61?=
 =?iso-8859-1?Q?AvPm92LbGWOKzHHqI2Sm2f4emQC+Mcs=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62139d49-5fa0-4e01-8c46-08def41e3821
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 00:52:56.2510
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3wjURNXjU4/t6qVT8J5muIc+4Erm9k5+4i4WfsSuoFQ4uSHTUsPcaaa5UHPzwdMRplUkiZ9UG0HTstM50ARnPS9X80/ddxXd8GU694nXu1x8c2AlhzkY8TUmwUbI6wiF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYTPR01MB11044

We can use .auto_selectable_formats. Let's adds it.

Acked-by: Nuno S=E1 <nuno.sa@analog.com>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/ad1836.c |  6 ++++++
 sound/soc/codecs/ad193x.c | 10 ++++++++++
 2 files changed, 16 insertions(+)

diff --git a/sound/soc/codecs/ad1836.c b/sound/soc/codecs/ad1836.c
index 8afeadcaf8b09..dbea83bd49b69 100644
--- a/sound/soc/codecs/ad1836.c
+++ b/sound/soc/codecs/ad1836.c
@@ -193,9 +193,15 @@ static int ad1836_hw_params(struct snd_pcm_substream *=
substream,
 	return 0;
 }
=20
+static const u64 ad1836_selectable_formats =3D
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops ad1836_dai_ops =3D {
 	.hw_params =3D ad1836_hw_params,
 	.set_fmt =3D ad1836_set_dai_fmt,
+	.auto_selectable_formats =3D &ad1836_selectable_formats,
+	.num_auto_selectable_formats =3D 1,
 };
=20
 #define AD183X_DAI(_name, num_dacs, num_adcs) \
diff --git a/sound/soc/codecs/ad193x.c b/sound/soc/codecs/ad193x.c
index b93531c3a9a40..9841c779b1752 100644
--- a/sound/soc/codecs/ad193x.c
+++ b/sound/soc/codecs/ad193x.c
@@ -394,6 +394,14 @@ static int ad193x_startup(struct snd_pcm_substream *su=
bstream,
 				   &constr);
 }
=20
+static const u64 ad193x_selectable_formats =3D
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops ad193x_dai_ops =3D {
 	.startup =3D ad193x_startup,
 	.hw_params =3D ad193x_hw_params,
@@ -401,6 +409,8 @@ static const struct snd_soc_dai_ops ad193x_dai_ops =3D =
{
 	.set_tdm_slot =3D ad193x_set_tdm_slot,
 	.set_sysclk	=3D ad193x_set_dai_sysclk,
 	.set_fmt =3D ad193x_set_dai_fmt,
+	.auto_selectable_formats =3D &ad193x_selectable_formats,
+	.num_auto_selectable_formats =3D 1,
 	.no_capture_mute =3D 1,
 };
=20
--=20
2.53.0

