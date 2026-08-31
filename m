Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010044.outbound.protection.outlook.com [52.101.228.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58FF53BB131
	for <linux-sound@vger.kernel.org>; Mon, 31 Aug 2026 06:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788158331; cv=fail; b=h7umhDqp1PwN7JcGIQNNrSWMsBwLJA4WgvWBtl16+gczeii2UsDrXpihVFFYXO6v6h5j/Mp72csWLHw8qUHUeL0LM11iaL1Icor26qSm7s9mvly9F/eJivwo5RhKzKvJjGJHckqYMHRX0rbhPyEiwELdfS7nXjbnVaw+RXFvi6I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788158331; c=relaxed/simple;
	bh=cq2LA5PgWazMwBoRpS2toCp1JO9SHD99N3Ja95GqWDo=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=JsBtha2VCTMNM6mPB3DWVMW1cJd+6odZjV2iscl6HLT9UuMKzWIpENuHi8pJ8YC1Mq6HvK5k77lOT1S9GgJQ6DpATv5YyxU4s2n7g0+8AtBN5A1VwvX54Y6y1V8Wqi9IgNnk3XJv9JzUQzyAOHZHD/IBij2JzTHan9ZpJ5bnKNg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=E5qSK+6R; arc=fail smtp.client-ip=52.101.228.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="E5qSK+6R"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h+D1dbIXayMpVCoo5iPoXjoHt8fRFFvP2nVFBmvEN4fCBlXrXe9atYeoZ+UJrp//TaBlbFJoCuupiLpSUYRP5bqblOWbSY0mEENuoEw72R0idAjlFENFFDWJ1LBHcgGpKjitFYE7rBPTJzLfLqZaIPfYDLRLcRT55OwQ34XLq6+Tku65i7eId9sPmYl7ESblcJ+H8k7jeOsFi06bFLxMIZGKh5olbjMY2MXAAOemmWJGn3t6IZvEtGq0pW6+Jk7etkB9+00pan9f3t8fo/DwxKMbeU7oQ+EfirMFJ94/zrpqKNQcOnBFTZodp22vM7Uwt1jusNR7iRCfhwLPYf9fVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kmsr2oUnRb3k27H828/RHmXcAT/d3+Ytve43PbSXq/8=;
 b=LMsGnEjBg2m9dk1hxHzSUwiP/pCS5hGu9u80Y83G6iVAv/sfuihalu65ZXdSezGN10PK+8vkOfujcmYH0pSUtdUU3Hw8J+dGjQYyahdgrEHKG2ZHZ+JKiP/V5UrCgO4be8YMg0owJ0si5QhAVyIvXLesUA9oqAtjdqmfZZHvaxcFELhs52qhi4TpMlhTV4BzPgJX5wG7WFlYIs8JcPCszwFqYyqBLhB0COz0c9R243C9TNMb2S2YL4/NccegYvP68553HIZm3XudPHqv49Jnv+QnmeCreoL7qMoJm8rRYIFgDqpWdsh/t1tUACZ8MvcUyQJXWeUdXr0ch/pZOVUAsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kmsr2oUnRb3k27H828/RHmXcAT/d3+Ytve43PbSXq/8=;
 b=E5qSK+6RbY+U+BS83SRe7hQyjlFOKFD/Sb8kDusukY+MYHm+9XUbd9mrIg/xt5Ul9qH1v0fCHi9ptYg7MGd1GGHAQ6g3AJ+5I8M6a5aVymL0gnElaCnUHhxxnQpOe1kEvuw+NpUivjyne/wXIJuI7Dio0al3IZX0g6RPYm41qbk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10) by TY3PR01MB11005.jpnprd01.prod.outlook.com
 (2603:1096:400:3ad::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 06:38:47 +0000
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b]) by TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b%6]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 06:38:47 +0000
Message-ID: <87ld9mssjt.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 12/14] ASoC: soc-dai: move snd_soc_dai_tdm_mask_{get/set}() to soc-dai.c
To: Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Vinod Koul <vkoul@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <8733vuu75t.wl-kuninori.morimoto.gx@renesas.com>
References: <8733vuu75t.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 31 Aug 2026 06:38:47 +0000
X-ClientProxiedBy: TYCPR01CA0180.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::20) To TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB16474:EE_|TY3PR01MB11005:EE_
X-MS-Office365-Filtering-Correlation-Id: 974d0978-9cb5-48ba-3d62-08df072a82aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|52116014|376014|22082099003|18002099003|56012099006|10067099003|11063799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	4h4G0jwvwlro7XXj2NCgpUWeLSGcbw7IJZL4erY6AJiKWc7aH439QeO5E/05dLFO9Dbt8bLi/VslsG2v2ncYwBvs/s2dwi7a84kZ4WWWEuO8yEtODrGxEO3a591oPHn5a5dxnXKn8a4TmrR7ycVHZ4TJl5DvntCjXMSQ/8p70DgAPRGqhHju3p4TAI8G2ctAZcr9tmQMNk6xm2I4xKrdIKGwMKX7wGrapYFVk/K7GmsZ/cRLhuWR/zcVQKzcF0dZFO2NTg6VlyasDqydCMGQaQqBdrPJl23gZ3mrZfXYy59v0gKnLBR6FW+K/AKSsW4C/+WmHW1tGYYgn4RPT+qHrkY1EIAj6BGWoy3u0CunxunUXC6dBijkbenevyKRcOLjF/ZM/3BeOLjb0tn7aTLPAKmz4VYNEGahkgwz2IlHbN12KEmn74+h8aE+eT1Bthrz5gbdO8hvPklSv3fVifnNaMgjQefR8SwPTsdaPwBJaMFag9dSKsS13Eymokbh1091dMCR4Em7HoFgr0il150umpVhmEz22eDgNm69ndIxdiEpw2v3AVFXORQVKebnIYxolT16vgdIsGDhWpQE6Ka4FoV9l5tuG//OQQN2fsQVUO5i3k+OtrT1upbUVn6TAgkYhRxDnWlqQ5A7y7oXGFiYxjonnl5SEsjfTrHvTJjfSeuGcPlMk6mjSEhCCUJVIqa83HwT7VWuc4XM3kfir6XwZjIUDllWxWtuYYkw0WkWxXE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB16474.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(52116014)(376014)(22082099003)(18002099003)(56012099006)(10067099003)(11063799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5mWU6/fQVWtx/T/BY5g8wrGXI+CCnfZETEUbqkJq/loWkpnrcs/3H5wBcfIX?=
 =?us-ascii?Q?3uVlNroJkYyfYabCMl4wo10GQ+wtT7NeO/629/e1v4agnpzab0d40q4Un09J?=
 =?us-ascii?Q?cR0MZXBMTMlO6zW9V22U5j6MusgCOPGduFBVq1U0ZJ0gns3ufd9iGA0ND5QG?=
 =?us-ascii?Q?pbGzhbnJjgSKKrTG/OmDjItQTsiZCZZeM5X3CdPN+DrlLpKr+BB5h6AfwU3P?=
 =?us-ascii?Q?+auj6ocntGtsKoTJmB+6oY2ON4+d4OjFcYcet4x1q5x31Chq0VO9jGm5/6XE?=
 =?us-ascii?Q?si987KN8bkDVJWYjCckpCyrIJfDe1mvXL0ZgHLNMUB9PhDvF7blUgY+PaMK/?=
 =?us-ascii?Q?7TE1+dxvvgYYDadY0q/llrbS+WcIMG6wPULl+oXfijlDBLnhUd0aKmjNMYc+?=
 =?us-ascii?Q?UQj1tiiX9l4YdNlElo/puTn9GcE8zgeOuTu7xGPgxZOxLodXFmlCSDujwYzS?=
 =?us-ascii?Q?IZdhmlyFK7Sq3FRsCBkxtwnedbQfLdfeJkHSPtxo2f8ePj3b3L2SVreMWddH?=
 =?us-ascii?Q?hWsxwwQ4aN8UE3vtaXQYjtbzTAyexxwEQ1yZvwoXzTDCnz8eFfO7gnyGOQjs?=
 =?us-ascii?Q?KDQxh+YSTaYigxpUWGbsgFpS5ibi/ZgiRJzV8UhUPMnn2cpRJUGCOaW8dfYY?=
 =?us-ascii?Q?Y3uVwiHHLzZMk7Sp2F9/ZmZ8x76CKah+MSJPkYWFV73gcnsSR/P56I+AJFY/?=
 =?us-ascii?Q?d2CRM+HiRqnTfYNTE7E1rXv3yRAcvYwUnQjuANkuxLIw5A+zVET7c340EZZg?=
 =?us-ascii?Q?nHEqtW55C93vLBeSIQIZtiwmQ0BEmBJHPWGt3vNmnZI9xCYwAlT2F/xUovBE?=
 =?us-ascii?Q?zRLqyK1DqvIFTSKLuE5OpTrNV5JlK7WMqFGOzKhyzgq7Cw1Y2QTMG0u+X5xn?=
 =?us-ascii?Q?5I8/p7sTHIH2UNscSEJPBxLyYFppqc5vS2m9pvYLXjvIY9Skm4u3H3sX3aPm?=
 =?us-ascii?Q?6yWig3VG0doC8ptx1efkCo8qd+YRectZH4dYO/6PcxCcztuYQ7Wn9GiJLbka?=
 =?us-ascii?Q?9rFVdx7hXMkvCd0/4rgiJmVeNuzU1yRDS6IuQbmpmFc1eaoyftbJJnyFI39H?=
 =?us-ascii?Q?oIj0AaitAPaQaLHmTXZfcDUhEKs9iGHJWvXbdkb5/Yt5wBZEbfsrLWKnmFbz?=
 =?us-ascii?Q?cRAIE8GIgDwIgX0e8xiiF7WhADXvDIe/2WmoUnJw7vTNJnA7xSlHYxpcAg9/?=
 =?us-ascii?Q?P8sgrPxlaqkSG5AYigGM6IMKAGnZgffRp6wNyS/kicR7TlMolyC/XG1pVoka?=
 =?us-ascii?Q?15Pb3DjM0rpQ65IQ6lD+xASS8zl3AgK9wUeZj9Xd09BGjvelefESrctnlopW?=
 =?us-ascii?Q?fpTGmjC4c8DVWBRtrne/i41gmrbePXagEiauHnrRNunqgTPnBjKK2bdMzUmK?=
 =?us-ascii?Q?EMJKX5cqQS2AkxT+tMCo0rNnvHhqDS28LmHcfMLWfcWib5SK74SnXbIBS0Y9?=
 =?us-ascii?Q?k8btDvTJRujw51ZODrK0F/PG/ITFiCwjnDTN05uxx2Hz/z/VPxuR6NrVDXNq?=
 =?us-ascii?Q?zOj5MP4S7V9LZOKro0bJbL+NiYXkLQI5a+NY+9jccFkVsOXbmF67HZwkCgpt?=
 =?us-ascii?Q?v1++b+Q9OnWZLsOTFz83E0YFV+GRP1i7bTS1mEvwSZ1TFu6Kw0byM0wCRp44?=
 =?us-ascii?Q?eZ2BHCM9eWrEQosiEJfidKpnsgMGwlM9YtvTK5FPyD4OhH/ihTMhbJGmQcVh?=
 =?us-ascii?Q?AVeadG5O3UzjLZ3iCu54X8OKndpEW677KzPCF8CErKXj6xDzz2fQhAP5lsm8?=
 =?us-ascii?Q?ED+bzTNFk2doC9mNMVfRwyB9U/wxH2tF4Zeh+FRkZF20O0znl0o/?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 974d0978-9cb5-48ba-3d62-08df072a82aa
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB16474.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 06:38:47.3029
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pZ2IZN1r72Xduc6Ckrj5dcZW9XzoYyBNVcPYSEkvk3AdE1N3AjtzrIBPlUH/5fvM5KXLnDlW9ZX7gLNVikjk5B0YUHJNZWg7tuIY9tF72Lzsx6gn2N1u5TC2hgqwnTqA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11005

DAI parameter will be capsuled soon, will be not enable to access from
soc-dai.h. Move it to soc-dai.c

It renames function name
	snd_soc_dai_tdm_mask_get() -> snd_soc_dai_stream_tdm_mask_get()
	snd_soc_dai_tdm_mask_set() -> snd_soc_dai_stream_tdm_mask_set()

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-dai.h | 15 ++++-----------
 sound/soc/soc-dai.c     | 12 ++++++++++++
 2 files changed, 16 insertions(+), 11 deletions(-)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index c75b41b773ba0..b50368ca6cbfc 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -535,17 +535,8 @@ static inline void snd_soc_dai_stream_dma_data_set_s(struct snd_soc_dai *dai, st
 	int :				snd_soc_dai_stream_dma_data_set_i,	\
 	struct snd_pcm_substream * :	snd_soc_dai_stream_dma_data_set_s)(dai, x, data)
 
-static inline unsigned int snd_soc_dai_tdm_mask_get(const struct snd_soc_dai *dai,
-						    int stream)
-{
-	return dai->stream[stream].tdm_mask;
-}
-
-static inline void snd_soc_dai_tdm_mask_set(struct snd_soc_dai *dai, int stream,
-					    unsigned int tdm_mask)
-{
-	dai->stream[stream].tdm_mask = tdm_mask;
-}
+unsigned int snd_soc_dai_stream_tdm_mask_get(const struct snd_soc_dai *dai, int stream);
+void snd_soc_dai_stream_tdm_mask_set(struct snd_soc_dai *dai, int stream, unsigned int tdm_mask);
 
 static inline unsigned int snd_soc_dai_stream_active(const struct snd_soc_dai *dai,
 						     int stream)
@@ -627,6 +618,8 @@ void snd_soc_dai_unregister(struct snd_soc_dai *dai);
 #define snd_soc_dai_dma_data_set_capture(dai,  data)	snd_soc_dai_stream_dma_data_set(dai, SNDRV_PCM_STREAM_CAPTURE,  data)
 #define snd_soc_dai_set_dma_data			snd_soc_dai_stream_dma_data_set
 #define snd_soc_dai_dma_data_set			snd_soc_dai_stream_dma_data_set
+#define snd_soc_dai_tdm_mask_get			snd_soc_dai_stream_tdm_mask_get
+#define snd_soc_dai_tdm_mask_set			snd_soc_dai_stream_tdm_mask_set
 static inline void snd_soc_dai_init_dma_data(struct snd_soc_dai *dai, void *playback, void *capture)
 {
 	snd_soc_dai_stream_dma_data_set_playback(dai, playback);
diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index 8e3d8e056a771..125f2103a907f 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -1105,6 +1105,18 @@ void snd_soc_dai_stream_dma_data_set_i(struct snd_soc_dai *dai, int stream, void
 }
 EXPORT_SYMBOL_GPL(snd_soc_dai_stream_dma_data_set_i);
 
+unsigned int snd_soc_dai_stream_tdm_mask_get(const struct snd_soc_dai *dai, int stream)
+{
+	return dai->stream[stream].tdm_mask;
+}
+EXPORT_SYMBOL_GPL(snd_soc_dai_stream_tdm_mask_get);
+
+void snd_soc_dai_stream_tdm_mask_set(struct snd_soc_dai *dai, int stream, unsigned int tdm_mask)
+{
+	dai->stream[stream].tdm_mask = tdm_mask;
+}
+EXPORT_SYMBOL_GPL(snd_soc_dai_stream_tdm_mask_set);
+
 void snd_soc_dai_unregister(struct snd_soc_dai *dai)
 {
 	lockdep_assert_held(&client_mutex);
-- 
2.53.0

