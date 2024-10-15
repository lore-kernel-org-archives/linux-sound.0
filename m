Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010029.outbound.protection.outlook.com [52.101.229.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC583433B9
	for <linux-sound@vger.kernel.org>; Tue, 15 Oct 2024 00:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728953781; cv=fail; b=CJte0XQvo+r9Q2oSf5PUOiqKXzLmOgGjE9znjvySTyebjigaodNB5NzSPAcMV7nLHhbYTOfQPVA2vliP1yxe+KN3y6bXWKZoxfdXHDWNXLPacSLgT2mAyLIMtfzr6FMRoETInlvdwXoqf7R+dXiJTKr/jzqMKcMbz2krM99P7Xs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728953781; c=relaxed/simple;
	bh=+3iOY++1gWaDouYT9bhhdLFKqUAA/eCCpStrVxpCZ78=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=cNPkLPWQkoKpuMeA3mh1cnH21DtogUPYKqV3Zao2wMe7khp2yKz4MMuqVqkeJs5YD5MxHvRSFDcVVbWfxN/ksjMfM5FKAuRYBeI6/IrdMiBcjonR1q24A4ToFetn64fzw/uQ/fQxJMSf+HN7B/WhDx/JoNLKra58BKptluNEp+w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=RZtWdKN5; arc=fail smtp.client-ip=52.101.229.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="RZtWdKN5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WuF2iEJDGPbfYCmKP3qRoU4RVEggjyhPEyuy+nO/GBegmzxB5Od1gt9IWx67hTDHHFDFSoW3LjmKs7TyynDlmckNUoRB/J+1T1eXZqfnRPSvcjL6IjhiNDwxu+uU+NdglROsRNSkvwuQrzFh+LNOY8w5Ohv2+qpGmX3gE13+cXhMLd3ADxt/MiicYNXixj7Ayt97V5DzFeZX4Ixa0Ddp9lFkBQutpomQGmyaZeE454j+7gdE/Ykh4pu0jSx5+NuukeGSm6DDXvegaP+it8X05unPPstN5HGzWDaa2QJ6O32uAHZaxNzJ1S+zyNSzsbxgKyHaEzxAATUYD2EJXmLqeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NMde+Gsewkg5yaN7cIsJHBgQ3crEs406DnvzH+HMtbk=;
 b=qPAT3H2eJrLlDU47cporxEucBODLCNFkf5mvSd1yH4I5v07Lm6Zbb5PlKCz0agbhwP319YOtHwLHrqfTsd/FmNIN1YrKQZpgopTLoxPClw85IlIrzudO2wS45lO/w7VNZKLa15lO6+fyLqGa7kEM+Aa2r/uT2ndNUZ44DM3aXCY9Gg4lzeabbv0TZ/ghBGtvWY3vjYScc5Bll5K8nSREBI6gpJA2vtri93sBRklzsUz/fTIk3PKfspFMddVCTf+QNqAzlRluCBUXI21YD30N7vA8v/TO41z0XNABFiYTzePC7MhpFSW+emUVNBRWy0XOzmBlQEytV16DyPvPIxPyOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NMde+Gsewkg5yaN7cIsJHBgQ3crEs406DnvzH+HMtbk=;
 b=RZtWdKN5sAMvNxU68+aSG6t1d65Q1qG7tssCMZb0Z5+Mw5TX9lDLH5UShtFd8kpoF0mxQG46IDlo/Y5FGH/xyk9+Lb7YcDyJd6+i8axzS3VQC7yxJE8FvB7++UZoTHiAH4NkNzW28o0r9COv8F5lUh29+ua4gQR2INOOHC1IzNE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS0PR01MB6130.jpnprd01.prod.outlook.com
 (2603:1096:604:cb::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.27; Tue, 15 Oct
 2024 00:56:17 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8048.020; Tue, 15 Oct 2024
 00:56:17 +0000
Message-ID: <87h69eqj4e.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v4 05/13] ASoC: samsung: remove dpcm_xxx flags
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
In-Reply-To: <87o73mqj5b.wl-kuninori.morimoto.gx@renesas.com>
References: <87o73mqj5b.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 15 Oct 2024 00:56:17 +0000
X-ClientProxiedBy: TYCP286CA0288.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c8::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS0PR01MB6130:EE_
X-MS-Office365-Filtering-Correlation-Id: fa7693ca-fd70-41df-68a2-08dcecb42d4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?A9KEuBCt6yLmh18TgzrEuOc9UO1YImEeZ3XAnK0OzTi3Wt5ZEQTPk+iXHwVN?=
 =?us-ascii?Q?pwNknHPAs9FEXUclslLQhTqEbNSj7EuxKXSbGCtWO3bT4/+QAIfKlobO4uHd?=
 =?us-ascii?Q?q+EEhEj2OAOgBsRLDve+jQ4ZCcA3SFoe6MRlDp3UkLQdrcqfAs4Kbx2g9BoF?=
 =?us-ascii?Q?i8bjqrdA4JI9hRZwT2x1DS5F7TfZGsY2FnFQ3AVU2rh6jbJ7yLm/pWIgjt/E?=
 =?us-ascii?Q?+0AKRvAzwt8VbPQ4SkSh3mE4dN65xFsNu2Ze4GnpyxawrKH0V5G+RBRglJ7O?=
 =?us-ascii?Q?ThXEihWy4+O29bTesOYhyCF3VCGKUloZG7mV+xiPB/HiHF2ZKBBcolwle1FU?=
 =?us-ascii?Q?ZIoF/1B0N/kCUfieg2vqZX8gx2/sho0ntEGOyMGE7V3uEf/6QVV/z4aT5IbZ?=
 =?us-ascii?Q?jwRWabMrrl+tcxsySHKVGvJvsmfhfaQ+mcLnQUYN8fA3uIA7sRAwskm0xt0b?=
 =?us-ascii?Q?8anfh6qSaR69euEIEnDcHhI98zlluZtXwD/iiSG1uhPmup+71jXdGlxs0bME?=
 =?us-ascii?Q?OabQwkgUf68ykUesEq1YYe0YCBAF2xBHAhlTptRa/J3z0p8fSLfzMckCDAhK?=
 =?us-ascii?Q?gWUwVqyrNCMvIfA3wzbsDtRCHcVOokn8DvfJs/XjHDvoW/oMwpGgEvwgsZvo?=
 =?us-ascii?Q?0E++S/3HdS5LVukh5WwCZRHTk432Y8otTLpgWHT7Ga8hZgQCKuSvRfUVKGgK?=
 =?us-ascii?Q?GP8YAuE2vAavNid4rDlrXmJRjamR4nWqj3ZFZSi6+uxanc+Ydv6qfnj6z4vL?=
 =?us-ascii?Q?SBypU/zq4Ko66+gRDqmRoInOQHWSArL540dENhNNGeldHwOXFvSOguwqHeMW?=
 =?us-ascii?Q?ztTLuTkNL/6oD/ok5+5UgXg6PUtbj+/TGEvr1zomgsZEhyOyPBVYfkANecbG?=
 =?us-ascii?Q?LLxdIY7dTYLiijZie7GUVkzkheEbiBp37+YScSdYNpfCS7SPPqkmAKNdfyAs?=
 =?us-ascii?Q?4hiLo6BN2gKz/JxUjmmZUAMpxPG/U3NbV4AKkLo1IP+/V/g+WxPanBd5v92L?=
 =?us-ascii?Q?0QVsbSVsEAdaEqxPO2ne/aXbWjwsPYTh9W1gP8qG1Yo+1/8+5WGE/nVwIS8O?=
 =?us-ascii?Q?daqqYC5KQC4qopKkOvs5BtiV2lqqb93aRKmBceeVFMuGf1UImsoSFcMyyV+A?=
 =?us-ascii?Q?hR3iQNvSJSFp7K1BGzA/amveR5vTt/iVHcIKjiRXeNJqSzXo51iPc8v8KFWL?=
 =?us-ascii?Q?pKq9YfkHoXm36t3DzZ8BtMSxp34kT9WGT/CltnPQF4CQJS0Df62BKCbYLG9W?=
 =?us-ascii?Q?M26W12OMwqMY6HlpPEueZOf5n6yFvrNP6A/ynSlx+Z+6Q0b8gl/L+PWcr/vU?=
 =?us-ascii?Q?21nBxyZmME/WG6qHbZ/NsQV9c2eZzDGumOOZBd6yVMjhUg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Q70bcvr6zEA899xWwj0J2w95rsVdr7IlC9Jdf5qGOau1RzWzoQVa5U7Z9VzT?=
 =?us-ascii?Q?XQ9y0XmxRaXln6mcDZO6R7xmx044nBqyXxNuOQ1Af4IjN6/tNYAZWP/MCpjw?=
 =?us-ascii?Q?enn5ntx23xcHwrvtOwSIZc8kukRJtAbyfB5OGds3Pq8TnDHHQR8lu4g7f6EX?=
 =?us-ascii?Q?O8ItjV6xQNr0roseu1DytwDVu1JVZUyRDLHDWRoRbabZDgOzjezxaQJISn8W?=
 =?us-ascii?Q?TyVcdey6+3ICNlFZc3q5xU/YsIfby7bfgQ1ROeZwSlx8pSimLgIzlLp0UE0p?=
 =?us-ascii?Q?etseoNTdQ8A45vqLa/ZIlBwz28/XvD2WVcYwqCiHIgt7nS+KzFhFY/w7yxjw?=
 =?us-ascii?Q?4t38uIPLteZ6E40w9cUY88nkGbx/MHEi0jSq4czJUdBVzKe5iZ0u8D5ZBgak?=
 =?us-ascii?Q?gaJ9O8EACnYx1fQEtAUYSiFLPBGxYkr+14mVee5RdAunEzP9itFwusN0xZJJ?=
 =?us-ascii?Q?Cu1iHhucFEiLbHsKo340A9U3z990DtOxd3lcqsUakNlga2M8iF4Shww+0heg?=
 =?us-ascii?Q?yplnYy+hQ3U2ilbZbV838nzd6iIxCU8AB/lxK5RQOm3ccWk+YcxO3A186D4A?=
 =?us-ascii?Q?fWZVWA9J4+HPYz8hBY9ijQuIy/DVbfE4X+Ivb4LAv0fCKSYm1nDT2NSQ253S?=
 =?us-ascii?Q?0hs/hz9n8FzoaxviJiY/WPU7wypxMX3M3ajrqeemd4Gf+nowJI0VtROMRfAn?=
 =?us-ascii?Q?SrEUDysFvivx6EAXersc5RioQJlyYmdoJ4IVXBCW6IOXJ9gIGKt8mXNr/OL7?=
 =?us-ascii?Q?golEJrMiE9EMg9hB9gzQC5GJo7ehrVZ3GmlSoOJf+nOEEaz5XO99EKwkjGPA?=
 =?us-ascii?Q?sEeROIavYUU1r/BJzJrBXFxLAE1E37A6K2REquASk289FUnOC6fykn1h+UEm?=
 =?us-ascii?Q?Sql2FiVZkNG9alXp9KirxTjLfCF8RVe8/DGe7QiKa27dd7/ad5PKaIQD5Pb/?=
 =?us-ascii?Q?dRaOmgH9frkNhMo7yXaOqDMFwnARALCYfyMonByLGbh+IBcJOyJ+sAWYlaRx?=
 =?us-ascii?Q?rTTaqB8fhES2SU1hr/rwyXJZdhd06Q3QwP00qrFgQgD2PJjhlO8+wPjpHcBo?=
 =?us-ascii?Q?6iFf6qQKGL6AZfQPJvuGvYT/ZhVsF+mvK7Z2U0TppxU59AafOz4O9eNQRLoc?=
 =?us-ascii?Q?qXgiVCs3gi6k5xdaovXoqHPhwe8NdPyi9OJjflFhXmMjYJtAHNPeq9zslDYT?=
 =?us-ascii?Q?MRs9t0hXQ+dGcx9JUxE5Rx5EUAXpEViiyc5yIcbw3w0Z+fEBgTHYuXD8uk0C?=
 =?us-ascii?Q?DtUfWETVQiwqtspqOuwrAR7xWM4Wwl8j+Kas4LVtE+69noYirV1jU946LFqx?=
 =?us-ascii?Q?XO6hGCvzWafXeej/Z88LGlInIC29CNSW22/cqbcGsV7K3BumcseFSMKZTFd/?=
 =?us-ascii?Q?2HimR+o9EvRc9jaqkoP89GK1rixfaP3z0eGmRZ2IzVYXbuIo7h8c/2eFC0kU?=
 =?us-ascii?Q?7ip4K2sKtYlPwPj0zeTg18wMJh6dyhUFKGmoaQPurA3L2e4N5QTdDAo/6oil?=
 =?us-ascii?Q?NMVb7exFJh2xj/4htHmQse4J35spNKoc9W+Ud/MTF/kaLb2IiojG4Qpcd21C?=
 =?us-ascii?Q?5dkukFNnTwI6AVDUJ4hrhDshUeR3EO155LE9Vx4GelTBwR05ec8yJmU/iQey?=
 =?us-ascii?Q?t52XxiWH+4varmnl4sh+FYs=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa7693ca-fd70-41df-68a2-08dcecb42d4c
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2024 00:56:17.8726
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cc57L+54OIhssMRYYB0Px4l+d19WjHkE/ly6Jl8eg55AJBJeQQUMJ8VB1DQ1yiZeHPcKo1e0A0/0RZz6DoWC/LXnvdf4j+K45koiZJMH7zLew1gYyM5mmq3F8FzSzv/T
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB6130

dpcm_xxx flags are no longer needed. It converts dpcm_xxx flag to
xxx_only if needed.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/samsung/odroid.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/samsung/odroid.c b/sound/soc/samsung/odroid.c
index ed865cc07e2ef..20e17d0610301 100644
--- a/sound/soc/samsung/odroid.c
+++ b/sound/soc/samsung/odroid.c
@@ -171,14 +171,14 @@ static struct snd_soc_dai_link odroid_card_dais[] = {
 		.name = "Primary",
 		.stream_name = "Primary",
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(primary),
 	}, {
 		/* BE <-> CODECs link */
 		.name = "I2S Mixer",
 		.ops = &odroid_card_be_ops,
 		.no_pcm = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
 				SND_SOC_DAIFMT_CBS_CFS,
 		SND_SOC_DAILINK_REG(mixer),
@@ -189,7 +189,7 @@ static struct snd_soc_dai_link odroid_card_dais[] = {
 		.name = "Secondary",
 		.stream_name = "Secondary",
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(secondary),
 	}
 };
@@ -278,8 +278,8 @@ static int odroid_audio_probe(struct platform_device *pdev)
 
 	/* Set capture capability only for boards with the MAX98090 CODEC */
 	if (codec_link->num_codecs > 1) {
-		card->dai_link[0].dpcm_capture = 1;
-		card->dai_link[1].dpcm_capture = 1;
+		card->dai_link[0].playback_only = 0;
+		card->dai_link[1].playback_only = 0;
 	}
 
 	priv->sclk_i2s = of_clk_get_by_name(cpu_dai, "i2s_opclk1");
-- 
2.43.0

