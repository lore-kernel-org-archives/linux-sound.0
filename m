Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010001.outbound.protection.outlook.com [52.101.228.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21BAE321420
	for <linux-sound@vger.kernel.org>; Fri, 18 Sep 2026 01:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789695912; cv=fail; b=GTbdLraSmE+y5GwtCf1OfLr1PzYb02+gJi0V+s9CXkLEa9uuqkJ/qvE7vlNyxERT5WP2BcEkI43gNGdOZ+qf1ijx1URvWY/TteDKJCZprs26E0A4KIsgO9xka0rIYFiN/P+nE6t0l63s4V8/ZILUGGLSaTJWPo2OK0VH3i93hn4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789695912; c=relaxed/simple;
	bh=ERl85OoSFbHzlfGmzZBAzL1ZIabeTbZWLSYA0tAGQDM=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=bpr6eNwByWa1JfoRMZb+AdNPoP7tAu9DSsNsHVCi9b7CVXorxeoFvJKs6SvI7Tzc3mM1UtnBgPXdozN8ifwvg2PZF/ewdvhFduKxcuVHdOlumd74YhcjEACo/4hMgRx+lDXAggq34gMwvJHGFOIlIVszvL3FzTZMlnDEZm2MGV8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=HKgh9dQv; arc=fail smtp.client-ip=52.101.228.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="HKgh9dQv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fdmts+GLCNxAioTHBTu9o0QWSMpy8sJ/UOqaMsoH5F21ka//d2C5DjzFrTTyViSM03e7UAx4ebqCODwXmTXTpPJW4rjv9U3twvHV+efKw4n/jbMpMhRc7cJeOrpXP4IzUJ2TKiGtPSj/AzW5afBW70z18obkfX1MVKNSPDqgOl9Q9WncGzyW3WGAvjXPO0IilPEYUjhHWmwkkVhpV/pR5jvAC1KjgN21Ar4SvoYuiiROa21+q3DwErFGDXgpUnJ7ccMG6V9AnoozCv9HrO62WIIM1JhQvIMNNRrCCzFbhlzTDnICfKi2AmsUFPK4X00Ss9HSQRnWrxLu6EzCDWIb4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x6X0h1XOHzzW8U5/FaWOQFhSwxzCLwem98EASMKjUbQ=;
 b=iGLZ5BxcTEAV1UzVqXzJr/Wt+sZs5SSmbLC9s9hydFfFXPlI2gtsS2loSu1V6brcT1STSEUWku6TvrjOiwDUuRvJFJIpGUoGWEuhLLBadEeZBhscNBYnBY1C2LYRRBXHmfnyHP8PozVmxNiJT7dKS7LXPrsb5kSOyVE8IznzSWOD+8BaiEJQcJxbBE1V+lEHYudGNdTD6cGuio3Ku1GKcpKIscVE5L+TM9pgbCEmNtCYPLZ/Lzl5ZGvwlVX9nGldupSQCtWoJrSWbOoX30rSwNcjByeOxf2lAwfSUeYiLwLEpYxXhMeNdZHVSRXc2wFEQeotFZo3vinDDKnv5ptUdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x6X0h1XOHzzW8U5/FaWOQFhSwxzCLwem98EASMKjUbQ=;
 b=HKgh9dQvHIsVZDR8Cj7HZcvJAZ4W42InHQRubRyCx7GZ7hW/HiGlMAGv8A7baAlpZfIHIMvrG5024hGkhyISF2f6YtTWJTKz/RO8p/v+1K07mHnl10ADOXdo5jAEMcZn4nEdkpPpRt2DwpLlObqdCzqp6qHXiygxbkCr32Aghb8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12) by TYCPR01MB7459.jpnprd01.prod.outlook.com
 (2603:1096:400:f6::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 01:45:07 +0000
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45]) by TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45%6]) with mapi id 15.21.0428.011; Fri, 18 Sep 2026
 01:45:07 +0000
Message-ID: <87fqz7jpst.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 7/9] ASoC: soc-dai: add snd_soc_dai_{set/to}_priv()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>, Charles Keepax <ckeepax@opensource.cirrus.com>, Maciej Strozek <mstrozek@opensource.cirrus.com>, Bard Liao <yung-chuan.liao@linux.intel.com>, Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Alvin Sipraga <alvin.sipraga@analog.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87pkybjq02.wl-kuninori.morimoto.gx@renesas.com>
References: <87pkybjq02.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2026 01:45:07 +0000
X-ClientProxiedBy: TYCPR01CA0202.jpnprd01.prod.outlook.com
 (2603:1096:405:7a::15) To TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB14118:EE_|TYCPR01MB7459:EE_
X-MS-Office365-Filtering-Correlation-Id: d3c0030b-0e73-4851-e9a6-08df152677b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|52116014|376014|10067099003|11063799006|3023799007|22082099003|56012099006|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	D1fLF2Zt52kjJRyUsu31C63438n/ZyPVfEgZis+FuekM7WHs6qOV7DQb/+0UCju8QC4aQ4OTg+K/BAkKie1CPuxtCPlt85XhAPrzX9tOgpOYf2RMhoaYkWZcuuNc4LLweCzxde2silbxzILcOAaXt6eZxs+YEm+Si9B7IYGmgj066NLJ6DXyRVlF1bXMfN2GatBh9rhU1eOfbyUu56BBIwKn764tBf2GvttKCgPM/lPKEbiGrwA/fkXrtpx0LqiKmSWgPHsHcFUwR9JuDRgVZfCng1OVSX+hPxytT51cr0foH7QL6eNmTdqpW1E8rwZlel32+8M3hCCE52eF0KEOvQKCgwCKpiphpUheeKF+SHGLvDef4TWAkxDFpj5IjX/rDX2b0q220DpWgcbiIyC+9P/CaHfx9u+ubra9Zd++JF2f5Ojon+G6fcXHHRIEOSLLIBnZv2UAvhQrSKmmNZVEhoa71tZDqRdp3KCLauipz3wnVlGy/VxMfJ69Kh2caXY392m80BY40XJEODyvxR29OCJtJdSJ6R+1egzHPRQrwKXN1VoAvXXpEP5G8NQd6oeEwuux84NLscNxlMKYznvTmK5YeYRj+duCqM+4eWjuMQKYBG5S28sSqiBIx59YgyZRX7ExdpHTPXz0JOzrlLHoxI7XOCbD9pgp42nHdclGs9axIxkiadR5MsUrP8HFhLjLPu8efOo5SoofBFGnfjBio2VmrGXIxpkHgCZOnqO/t7o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB14118.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(52116014)(376014)(10067099003)(11063799006)(3023799007)(22082099003)(56012099006)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-2?Q?iK4g+LyHTHb51mIrOGOu04pix0XZnuHXXDbaZO9sVFkMkN2DTi5JGdfZtJ?=
 =?iso-8859-2?Q?w1jndEIJRGZ7bovx0GYABjUeEP6bsrVnHJB03Cu/1cGDHSl0Y7AoRtRTYg?=
 =?iso-8859-2?Q?9SL64ED60C4qfB7iFifTEc7TSfvZYhb4phwzQF0zYDU26pmaxoSL7xPx3W?=
 =?iso-8859-2?Q?dxjRN8H080osZnGKt8y5VKKyYK2BGxB+9EfnOHx4mHidE92IufmsvGrh/v?=
 =?iso-8859-2?Q?qpbj+IK1PJ5fZRifcuVS+tRQSLj6F1m8xYwqc/6CqBNHE1ENkThKQXdJXI?=
 =?iso-8859-2?Q?1dFGFvVjIzc1kLUT0WawF6hqC093gqI8FEbBkmp+oL5ep0sCvRi3SbY0LQ?=
 =?iso-8859-2?Q?dvGleC/APwF4SZA+dkWgLTm0BM/69hujg62fKle8jiELVV2qYnLpc3Ok0c?=
 =?iso-8859-2?Q?pcSc+pqhh/2AacDhV3OPzWtjM++sigrXrOKGucAQggHfa2HJyWmq0RPea7?=
 =?iso-8859-2?Q?3Ws1ZOS04WYkcf7zOCBv5tNZ82o5Mx8UpvO0v8KvFOZWtRwta+C+5V/ze2?=
 =?iso-8859-2?Q?BrV5fH6JWjsNz2qIyUTelfa0ZQNO/QacTxW9luZl0dwIJ1VnW7H+16ktMi?=
 =?iso-8859-2?Q?vV9aWqOANzPaWJ6a2RQ5XcAy5W1hQ5q4wcPp2Mkrpr9+TYU4+4httySxmk?=
 =?iso-8859-2?Q?0rG5Fm2hRV14vfg54j4qeRdJMzNO+cOaYYwAuvl/wkiaSiuMDIuvSs/fL6?=
 =?iso-8859-2?Q?FA8jYexXldJE05CQnzSE/FNRdSZT5/ybVrsD9QyjEfjvKrTQ/3frgN/sX1?=
 =?iso-8859-2?Q?hC6wVHyvQqKlEQf+CAzqhkN/J1qMG4EnhSphIpM5ATdQneRttsMPHk6JCq?=
 =?iso-8859-2?Q?Rp5LT6Ik8tmjtRHlMH3UcpeZtgwMw1uWNpITBNEdpWGqkEfNqxo9wCYbNh?=
 =?iso-8859-2?Q?nzARiQwhtNayUFY/cBZWI/Wgp3qifiGJ8roa14bk1v8/v21qOjwJ+k2nOa?=
 =?iso-8859-2?Q?pXrWNDDTg4je84qBKJmZZsPFxIj24yZctwN4fEY6xvm3nQAfO0BdooKQx4?=
 =?iso-8859-2?Q?nobJ7aKmeL18GrWGpTNMteiSYXz5fg0YRTe1GsJDYx9o3qyIKvp5nkywKK?=
 =?iso-8859-2?Q?6YOEECE1T1yOtjEO1OMrNitPSprdnKcpLVg3mBLAmtvbsNeiNvf0zB3cju?=
 =?iso-8859-2?Q?+pSz3rajz8+/NY0Oa1bECVaEWyP/mXIdiF2i84qnBdWEInVqeREb+MixYO?=
 =?iso-8859-2?Q?v+EOAy7Hpm4I/A2aVFaiXnrXz0DNBYDZX08+Z0CzT0pePJCL98P+ln5VQY?=
 =?iso-8859-2?Q?Nm6SLeM/07+5UY+XGmwBrXynDMbr2BHfxP1epUlsv9raH5kx41J4E2qCYk?=
 =?iso-8859-2?Q?ud+NxKlF8ekCZEGYxGlOryvM6wk8DYRjeBXTyjTBy7tTEoqiE6UhalqRWv?=
 =?iso-8859-2?Q?XIHXXUzbxypM7XXUb6TJ7iK/+Z9hbCxbj4ugcFfefAiKL94qgF8ItqpTKF?=
 =?iso-8859-2?Q?WdfTCpZZ9B/K9AEKc8NqJwHS381rwDA6GL2arMOSET1in46tiDX0smTuWw?=
 =?iso-8859-2?Q?Lz7aO7+AixrSZPrdX++jzkPhEaXVijixxPRzhOGoAmYDCsquzqkk/7nVjY?=
 =?iso-8859-2?Q?cCO4gCANqQXfIbASnuHTWT7zd6+uJEOT2KVGgwSPNHbqgprE3IgF/rD+6o?=
 =?iso-8859-2?Q?tmQswGQ42bGoTKQAgbWd/6M+87dx/GaZUugUgaaaJS3qUD8Wk4uUMnrqbF?=
 =?iso-8859-2?Q?isjN8KWq3n35iJcBgOIY9W5JjjvY4khzDsbiWdvXXPFFJ3uwIY2bM/PHCn?=
 =?iso-8859-2?Q?5KjX+p0QAtbaTx0viWSFFqDdME/twi+ZNcsNGctXRRb3QYOy5RBubcqFZk?=
 =?iso-8859-2?Q?UFhjBml29Ew+GR0UJRDk8DIrwK4HOI4OSYiXyMY68IzcGeuRatrs?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3c0030b-0e73-4851-e9a6-08df152677b1
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB14118.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 01:45:07.2636
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cWHU/U2Dnct9Wyd6BRjyx9E7+188g+Kj1My9o+xcQiEAlKKCjguVqqKmO3CygoSU5na/+1tjQbozQvp/lcq3XdV5ASs2YES7kIY8QNHUOhDo4d2hliikEtKgFxxg5HBN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7459

DAI parameter will be capsuled soon, will be not enable to access from
each drivers. DAI priv has been mainly referred from SoundWire driver.
Let's add snd_soc_dai_{set/to}_priv() for it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Reviewed-by: Alvin =A9ipraga <alvin.sipraga@analog.com>
---
 include/sound/soc-dai.h    |  2 ++
 sound/soc/sdca/sdca_asoc.c |  4 ++--
 sound/soc/soc-dai.c        | 12 ++++++++++++
 3 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index fc23221766b63..be4781b619891 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -566,6 +566,8 @@ struct list_head *snd_soc_dai_to_list(struct snd_soc_da=
i *dai);
 unsigned int snd_soc_dai_get_symmetric_rate(struct snd_soc_dai *dai);
 unsigned int snd_soc_dai_get_symmetric_channels(struct snd_soc_dai *dai);
 unsigned int snd_soc_dai_get_symmetric_sample_bits(struct snd_soc_dai *dai=
);
+void snd_soc_dai_set_priv(struct snd_soc_dai *dai, void *priv);
+void *snd_soc_dai_to_priv(struct snd_soc_dai *dai);
=20
 /* REMOVE ME */
 #define snd_soc_dai_get_pcm_stream			snd_soc_dai_pcm_stream_get
diff --git a/sound/soc/sdca/sdca_asoc.c b/sound/soc/sdca/sdca_asoc.c
index ce2e7c2707657..ccc579f878ff1 100644
--- a/sound/soc/sdca/sdca_asoc.c
+++ b/sound/soc/sdca/sdca_asoc.c
@@ -1507,7 +1507,7 @@ int sdca_asoc_set_constraints(struct device *dev, str=
uct regmap *regmap,
 		return ret;
 	}
=20
-	dai->priv =3D constraint;
+	snd_soc_dai_set_priv(dai, constraint);
=20
 	return 0;
 }
@@ -1523,7 +1523,7 @@ EXPORT_SYMBOL_NS(sdca_asoc_set_constraints, "SND_SOC_=
SDCA");
 void sdca_asoc_free_constraints(struct snd_pcm_substream *substream,
 				struct snd_soc_dai *dai)
 {
-	struct snd_pcm_hw_constraint_list *constraint =3D dai->priv;
+	struct snd_pcm_hw_constraint_list *constraint =3D snd_soc_dai_to_priv(dai=
);
=20
 	kfree(constraint);
 }
diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index 9787d7913c308..7412294eaea46 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -32,6 +32,18 @@ struct snd_soc_dai_driver *snd_soc_dai_to_driver(const s=
truct snd_soc_dai *dai)
 }
 EXPORT_SYMBOL_GPL(snd_soc_dai_to_driver);
=20
+void snd_soc_dai_set_priv(struct snd_soc_dai *dai, void *priv)
+{
+	dai->priv =3D priv;
+}
+EXPORT_SYMBOL_GPL(snd_soc_dai_set_priv);
+
+void *snd_soc_dai_to_priv(struct snd_soc_dai *dai)
+{
+	return dai->priv;
+}
+EXPORT_SYMBOL_GPL(snd_soc_dai_to_priv);
+
 struct snd_soc_dai *snd_soc_dai_from_list(struct list_head *list)
 {
 	return list_entry(list, struct snd_soc_dai, list);
--=20
2.53.0

