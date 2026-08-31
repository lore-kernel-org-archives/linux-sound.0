Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011062.outbound.protection.outlook.com [40.107.74.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3796D3BB131
	for <linux-sound@vger.kernel.org>; Mon, 31 Aug 2026 06:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788158335; cv=fail; b=TdMH0zZ2wCUAQPa//t9KgupK4YlD3/JH2votKOKTQC3oBC/Q7vUDNTbBLWSnB5YKoy4Gq876WZl6rELT3CPjYBJdVIec+qYR9nKBVseoeDjVzhX4Fwxv7hiH7sogT0ajWCBU8MsUrdD5oIlWkWd4+ktWjaRDSNk5u3zQobTndx0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788158335; c=relaxed/simple;
	bh=GSe3CaUjkocTAI0BTGptfk+1t4S10TL0adkX5ywha28=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=nxBqSI/GVBTM8PkKHhjHEywq5v+yd4GmJydziUOBtQfIzHtBRQc5++wj72ADHrODJ59D0SESrfu00l7C1Zb8n+kiEVdl2KM17Lvw9VeMW4FzGCh3O5lrIlKXQ8dA2BqMHdJWnIHL2q2jHe9xJ/judFDltLtutSY1lzAoX8rUFwg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ekyGeq1h; arc=fail smtp.client-ip=40.107.74.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ekyGeq1h"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=drdj661h+BmY6yCdjou2sHjf9CprZhb60rCudg0pS/nYfiNagLMcR6mWfB14XW49NX1UpCb8y0ofzA3QMJHPd4gIvN3FZcgGVhr0/66ECh4KqSFa6PqlB9ijP3khy9R9UzucG/ULIc7jl1NaGbUCUy5eA2bdlceFBjmxySsG49u2wg6/zsMVDL2Ia6jt5NTMBW7zBbpIDJfFHHySbxSDIl2K4P6hSLt4RLGhw3Wz+DC6wCb+GGjDrWInChJ4Xd9Bldt31MP/klh0/nklkMkUcEomyGzJg4OdjyS9zdOqW1bKbtfmlwWkAxIUlshhtdll4HgD3ndLNsR8fIFZlbrXaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tW/vJzyyLwPxy6yURGKMTm5whxDoKZlVNEKx5yQeCGg=;
 b=ugkbtxnlztXLy8vbxzzKK9iWaAmqoI2Ae6jG98zgCkNixWnQjnBg8VtdmRbudNejf0fG8MyzcngxYaTo/unsXHGXN+4n8RToF4cPfY2Vt+FaPSfN/MFBaf20JP/7fbex+xxGiMLo7n9HDT4KPygeEvWfhQp2DMhm3RmY+TRAGhc1rmk7sKBPkOfd1pTff0gfQqkghhlZZXbW4ZShk18DBmEA7MbX/gFo//i9IxJ9nO+j5b3IVkmr4smuROM24mHiV6WlsDD3NcTtNrI9PRt6u0VNNQ41nNTDLhSIoNq4XhoejKnuYzb/Hq0DqY8FANPxNM3OPdOp9XSe+V/LWftVSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tW/vJzyyLwPxy6yURGKMTm5whxDoKZlVNEKx5yQeCGg=;
 b=ekyGeq1hKqwNWyYTv5ENwEvDu9kJc4mD3ptpW8CJx3sQ0XZoMh0Cn5fB3jRKYosTpzgu7lNIgBqZLTLF/KmVG4wsbx8Qo7ymrPU7ECVB/ojLywES1P1P5QHDENo2r/dp9fj+43Ns5XgssKVwoEknqNuS5C+L4qamOj7cq8aTte4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10) by TY3PR01MB11005.jpnprd01.prod.outlook.com
 (2603:1096:400:3ad::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 06:38:51 +0000
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b]) by TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b%6]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 06:38:51 +0000
Message-ID: <87jyp6ssjo.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 13/14] ASoC: soc-dai: move snd_soc_dai_stream_active() to soc-dai.c
To: Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Vinod Koul <vkoul@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <8733vuu75t.wl-kuninori.morimoto.gx@renesas.com>
References: <8733vuu75t.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 31 Aug 2026 06:38:51 +0000
X-ClientProxiedBy: TYCP286CA0252.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:456::10) To TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB16474:EE_|TY3PR01MB11005:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b3e0dd2-6a63-4394-bfa1-08df072a854c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|52116014|376014|22082099003|18002099003|56012099006|10067099003|11063799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	odZxjwA1vUCXGBbPdjGp+cH81V6yy5/EyKAsyJD6vWHzugDUZKNCwR8SroPowexgkTwuLdK/Mdvjn58eR8B09/jQYgR2dk99XChFQ8/0N8+dI/EgRWfwjnu4gdA20yApOOuYOrgyYqOi15dui8SZUv/Zj+sRhWW9kWfW9j4kp4PVlbP2c+GcpsqEV+I7SUXjTlnIXXxZS/F1HftkSQhO8wqh54GmUElWCpkJ5oSYAAl4Skx1d2Uw0x/EHLHOWRSG3WhtJFOQfczn+BPYlX/uxDaWb26YoftboN9sEFh4168J7NQzGWdrzT1BpBkjG9dBChcPySlaFyBHxeb5PTKlqNAM5g2WA5SIarecrCPydB+KHnDtDWsvE/laK4lfGwG/ujypBVPksKgtoyzzDLCRkfT5tqGXTpOI0PcAbDWHj60VRa1Kw2378h01zJwwGtZE7U9di7mrzVaS9/i3VRA/UuaUaBuX/OAilqPSAlYfzx+1570o9rZ7yOQ862HWSZnZMpP5pD+uhz2BU24MGhjLdLfATxoX/anVHVbb4b94jGcNX1bZ+LbfdDa7RZYh1wunq9FmUNJ9OOzUrdZksFNPfM38U6VAmZV/tbVBe9/uF08vtGlQ70HwRtsyJxid7ri4VXP61DTmc3Ks1Thax0sqtOwZCEgDFRswxTnpGPO5LRtr/hlzLnRobj/bzvxHJDMoanh5nR9R8u7teSh/AR7S9iNEsIPXVsJz8TudcITWiQY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB16474.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(52116014)(376014)(22082099003)(18002099003)(56012099006)(10067099003)(11063799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AO2vw4CVUArhSpK8/POvRvGylABLtYn3EpOalvLvrxl1P2fwCZ9/fDI7ejvE?=
 =?us-ascii?Q?pfemix405xA9VEkljYkpba34/aUE5scL3/LF95vTusIl88Crnh8Cv3GnKldB?=
 =?us-ascii?Q?V/fNJxrn73Eb6kHIZa4d/Oe6c0Hy+mnwNl9/yMUpvBN+MrTigwF7LBlxNjLq?=
 =?us-ascii?Q?zzI4D1tq3X/42BWfgvHan4Rnvk9jevYJZ7ZC+bmxK/NHyggu0mZDqpGM0jni?=
 =?us-ascii?Q?j0uSBfMBXmk13yKzlVpsbdN7PvOILcV8I6zn5SCfA5Ve4P2Yz/ILCaEwRauu?=
 =?us-ascii?Q?dsMqRFCzCBG/fy0moHibTNVYPiRA6DVOo9TUwEnSAlABiqwbVlE7P+Ocua8H?=
 =?us-ascii?Q?q/rU7EdAFyZQ5wrlGH8ZD6RyoBlN66NDTP6tETrSS39biIJhwXYYxbNmQpHe?=
 =?us-ascii?Q?9JsH8NiZvJAV/ztB+1VpOAnQMaIJzGEmP183L2ObotnR3G/VuqbemWzqPXPy?=
 =?us-ascii?Q?vfA2mLJTeidFkbyLK9J79Pl9Govkpd5eUWvk2SwEd4UWZPnqs+oGcSHJG8Yc?=
 =?us-ascii?Q?zKa8/02v0fZ1bv6j8JM33jhKgHuuGALyZqjcGVkNf4GHAhBRlPWgTKE12Q/4?=
 =?us-ascii?Q?smmxL9FGzjIX3BLyrjY+pCmRSNePGupI71uJLmXzAW1VIhQI/31vQ+kB3kw3?=
 =?us-ascii?Q?yF3L7n5toxPPde7RDT9M4MW5XZuYuhKHPMJ6PSDEw9LaA8SLAr/KU59r0WxQ?=
 =?us-ascii?Q?e8dDjGBBHtjPkV9N9IYSDM5tvE7PCxR3bE7N2nXMTpvtS4dwhthKsqEITgns?=
 =?us-ascii?Q?bTHcPlRi1LKN0IUq3UJLmPfzywN1fTkA9nuDtxHTvxkTErxfGaT2qtZkwyYK?=
 =?us-ascii?Q?rSioI1QbR97yOm13/soBAegjLVSjeB0zTAAeMcTGi8M2PQiC8uPsX7/B1h2o?=
 =?us-ascii?Q?hlcGIHcbRnKztI3JlreNPBnYMSGwY1xpUdQrVmg38XXxd6Hk7c8hypDyx7M1?=
 =?us-ascii?Q?/dyDraE+EZ7woFbhJvToD8tpn1vjRFwIPYFc6Ou0DkE2LfOYlxOWVG4NmaBl?=
 =?us-ascii?Q?zi0tzUOAML0R/x+SK8D92ajEPuTcbQEWuX9Otip29REhZt9J0b/0TN+FVz9S?=
 =?us-ascii?Q?K5cm4onsTpRGFbTEbVQGLCPpRP7rtFlwQb4wKulqDPljQ3eQtYpH7Z6mv6e8?=
 =?us-ascii?Q?RO2NHH9S2OKDZHWZhiok3mlx47Ifrv3oBKb44b/o61yPHtj9ZauVoseNZEKk?=
 =?us-ascii?Q?IBkZ9Ot+KuDWuVse1Z+LclklRb8QAKFR3HCEplZ08ZNGvglJOU1kqxrUR08c?=
 =?us-ascii?Q?n8tmJgwsKL3wzXcztHaoXwzohnJik0Xc3cM/GWRTnULbAly4qHTTQlJcMM9X?=
 =?us-ascii?Q?FNDrEHgATWTkd0eYnmCi8pCJNDHuq6OwY3wK/iQ60vqcXdYBlPEbwW8+VbHy?=
 =?us-ascii?Q?Fsway67dPGjf9ceQXA7ufEdm5ennhtPDqGOoAesjRaT6BR426le8xLgwUhle?=
 =?us-ascii?Q?IDVBeBJed35ESqr9cC8ZecxbNsE8yM+blS40gqZVtSf4uEwEsmErV1gF71Vi?=
 =?us-ascii?Q?aWWq/+405ohgU04oM/LOSYr/+x+/uPZE7BIaGSieqswDKmHKQXQ268u9E1jR?=
 =?us-ascii?Q?PYcfbGfjYwOkGEFbBp5D4xRy7cvMLpxz0YEkG05BEx8h8Ew+BM4Z8MZx+A1a?=
 =?us-ascii?Q?of+W6Gx3dEfjWjRc0cdmQlkqNKLqwINRq1e9EEez+gMkJLh0nf2AZlR4HzpB?=
 =?us-ascii?Q?j3TT4BStLekgw2OS7H25dfJ0IK++0SZOXKoerY3sSeyotXoz/VXz3MCifDih?=
 =?us-ascii?Q?KFp9N5WQLLMp3c4/E/Ivf+HcWgoMU8sOggwuswaYKGyZRCIHcV3R?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b3e0dd2-6a63-4394-bfa1-08df072a854c
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB16474.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 06:38:51.7343
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EOL0HlvLyxRn3mShYLbbdSpdqYLn1qdMmc4IL7obDDjy8i17Gn9dvXWZkjmHZIB0ZR7aJS6QJqwdcmrt3xur2z1rO8rXGX27TPtA/KpitB84cIOTUWcfWwmYx/sf2vky
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11005

DAI parameter will be capsuled soon, will be not enable to access from
soc-dai.h. Move it to soc-dai.c

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-dai.h | 7 +------
 sound/soc/soc-dai.c     | 7 +++++++
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index b50368ca6cbfc..e7d86c97da75f 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -538,12 +538,7 @@ static inline void snd_soc_dai_stream_dma_data_set_s(struct snd_soc_dai *dai, st
 unsigned int snd_soc_dai_stream_tdm_mask_get(const struct snd_soc_dai *dai, int stream);
 void snd_soc_dai_stream_tdm_mask_set(struct snd_soc_dai *dai, int stream, unsigned int tdm_mask);
 
-static inline unsigned int snd_soc_dai_stream_active(const struct snd_soc_dai *dai,
-						     int stream)
-{
-	/* see snd_soc_dai_action() for setup */
-	return dai->stream[stream].active;
-}
+unsigned int snd_soc_dai_stream_active(const struct snd_soc_dai *dai, int stream);
 
 static inline void snd_soc_dai_set_drvdata(struct snd_soc_dai *dai,
 		void *data)
diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index 125f2103a907f..77fd457a94f69 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -1117,6 +1117,13 @@ void snd_soc_dai_stream_tdm_mask_set(struct snd_soc_dai *dai, int stream, unsign
 }
 EXPORT_SYMBOL_GPL(snd_soc_dai_stream_tdm_mask_set);
 
+unsigned int snd_soc_dai_stream_active(const struct snd_soc_dai *dai, int stream)
+{
+	/* see snd_soc_dai_action() for setup */
+	return dai->stream[stream].active;
+}
+EXPORT_SYMBOL_GPL(snd_soc_dai_stream_active);
+
 void snd_soc_dai_unregister(struct snd_soc_dai *dai)
 {
 	lockdep_assert_held(&client_mutex);
-- 
2.53.0

