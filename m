Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011054.outbound.protection.outlook.com [40.107.74.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9196D3BB131
	for <linux-sound@vger.kernel.org>; Mon, 31 Aug 2026 06:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788158339; cv=fail; b=Xwgg1NXujik/QLZFAPbRS2iJ8Tcv+onFF8fQuS34+xegtRuOzdHfCJ2SJ7aDJp3Eq3yOd0rMVl04rQMZOkANcOpCzNAFhWegF1GW/7k+nQKHpkEfFZr2qm1OkQkHj0hNceb8zvP/ngYEVlmrrg9RSGxR6fm0gbvYQKEUhcRUpIk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788158339; c=relaxed/simple;
	bh=I7V0iAAJTHzHppN61UpJAa5m3rfYwYoNGOet8wY4pJU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=HMDnxYg0Hs83TJiJ11zUAm4q7J5tgDTee7KWkdfKZeoC0OPEc2ZF5MBmjpGSbicDX/5ujF8ppjtnKfSFZThjAF1dMW4CFq8Wv9KYRUPh5d0koHWZhNXt7So3rKwnYLh0AOqcjO8qRbi2Qbxlla44pviXkYQmobnxiAY/vZ41zE0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=nSrW2V9v; arc=fail smtp.client-ip=40.107.74.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="nSrW2V9v"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=URfukpm/nPNKjOIEGz2MVIwRYeF6591tJ6Biex44ezJvYt6EW1UNIVV6K3Vqr/DCBReT2lyG8HK9V3Ltd2URzQzB8ATzO7ovZNhthbFT5+laVn05Q+49gqE6/nikINlTJMkKcjBlF5xe1NDBCxJDk7sdwLEsric9wZvXf+M4DMCrk3pATEFrIMYm23CSsEma471AquYYrxuVwkXzbMQKBY23DbkNkLMvoyPSji40JFSHHaKS/EKhEKlVF1X85vJx8jI0SaPgW6uqJPGqN9soRkVilbB8Z8jPfaB6LGHNY9YVnIsZ3FJKVLFzxpOVn/2lEXxmw4CCFm4BhYv9ETa03Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DgRUqFFqiCEgghSHHi1HCODhbT3Dy9X3PpjlS6mxqdI=;
 b=Ky5w2TQwZbKyqhuDDpKP6aBquDcg2sMXfqIcglk8Pa+404njS569EqYYx7BDX03+R+bk/PtKMkUmyHLsY7qxrCdEgNycPw6V8PL2cFsbXFoeRpmPzvGpn+qiRk9aZ7cQfSyTUVyq5lyzPUiCnyCV/jpZHzTFk5elurW7biSEgNW4EF0Q34xYvRZ+rGgUk1vLgDlgj7h1nwmGX2fFGa4k+Vr/elqDnEpdXNXWEbrcZDEEfvw5sIBL5o+ykbYuFhQkx+NK4Jh1o9FRlJ9QeLja+tq9a0rfoVBIWimYJRJid9KJoYioBXv1+HJpLfzn3sVpL5y2zaioVr6daztfD55h7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DgRUqFFqiCEgghSHHi1HCODhbT3Dy9X3PpjlS6mxqdI=;
 b=nSrW2V9vSmcjs7ARiBlROqv4zrNFqF5pet98ldxQGxam/Jk/zUdy8Gnjah45oumEAileeL/7fpeC3mruk71gRjfbYqGvcG77h9xIKGyXkM1IJGnGpys2xYOB52VkbtY2PRKK3oKZoAIECCL4J9z9oGQi7KJfYgF/YkabPCmf5ks=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10) by TY3PR01MB11005.jpnprd01.prod.outlook.com
 (2603:1096:400:3ad::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 06:38:55 +0000
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b]) by TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b%6]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 06:38:55 +0000
Message-ID: <87ik4qssjl.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 14/14] ASoC: soc-dai: move snd_soc_dai_{set/get}_stream() to soc-dai.c
To: Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Vinod Koul <vkoul@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <8733vuu75t.wl-kuninori.morimoto.gx@renesas.com>
References: <8733vuu75t.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 31 Aug 2026 06:38:55 +0000
X-ClientProxiedBy: TYCP286CA0165.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:383::11) To TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB16474:EE_|TY3PR01MB11005:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c2f13fb-a752-4eaa-408d-08df072a8769
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|52116014|376014|22082099003|18002099003|56012099006|10067099003|6133799003|5023799004|11063799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	kY7S4Q7ajA4IzgQd6odMgDwp/ioWXvB7pycv0ublkwboYW0q8dFnnAmb17AOt67zppx9dqj9WPX3DTYsVIyG6sC38maBkmCZE215PGC9zijXnI9mOPotslvcBl//v0QBAVnirHTRFKnYlZ+GfWsJSed+WcTofVlLuuLOQMD+zlhKKtqYNGfgPIec7MeVV7xyEDGkKe3HFM6Y+FdLsTcgqBvB+lnIj7Aq+BW+7bE0eZM0fuPHWswAOv6T28yVgVbF/HcdxQS+vy1+6aKotxonE5xHyw3WWPuMLqwIiCev2W3XrWl/RdQU5sWeRBXJFTG4JqKVe/CRvHNv0QFR8yV2meD8ZfEbsSLRQ1myeVamQi7SeVa9WrywaK0AEGYDbZcfIkD1UEP+O/lXzpF7HmTbVYrnDJAyQI3FfAWWA2R0JTG2dW7wNw0nWnhg2ipABu2NQqN7c09zc8c+OKRmbVXtXG8xb0nvTY/pKsBPSewoa5MkoSRsMgK5Y9BO6ry7NuqIs1TEFyu5ZLRhVzoTNzEPZf0BidLb3Ovq+jj3UX1hR071zAbkpisSSeD67ELHaCcVVeufiJenMPwiL0fdDLrW4hL83QuEOC/qLoyBTXBGdchZL1IfuhZ5YhZWP8IoB1tYcwQIlW/m1B76LnXrALj8oj8tE2Rl/IGBXS+mvNZedHX2b6FTsdbOWWIh2vu5bmFRwuIaSebr/EHr9F+KsZ+Ey4UgYDqu79AGU3+5si0YL6o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB16474.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(52116014)(376014)(22082099003)(18002099003)(56012099006)(10067099003)(6133799003)(5023799004)(11063799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xJ4OPKrBl7VUC95/oVu2br1Q3Wkmj/wT9XktitXcCC/buDTfgqux7dc8+jZK?=
 =?us-ascii?Q?s2rJopZ8F+dwa73Rlg1k2aSGFItsJVE8A/sHVmi3OBl+58I67Wzyduvd9US3?=
 =?us-ascii?Q?wImoT2AlKpYJ/EUBLfiXRXk5Vlc+Bwl71TysucPmGEZSRaHxjyq4wVsw3QdM?=
 =?us-ascii?Q?cMIpsaIvyLDN/fyjQdnU57uXjxlt5n7mjhHZLxtDUBElDgv5qC3i1wjmjKyS?=
 =?us-ascii?Q?E3wzgksI9gw9cfQ0Beu20l56c5LfAcZzZGbF3enREL5TBxfJLGyDaMTUpo1K?=
 =?us-ascii?Q?y3t4dH51cqI6gO21dX4cSpDM9jb8y8njfD7AkSrPK+tJWJtYc615bkpcdPwa?=
 =?us-ascii?Q?fzMbjr3QFafVL9VQeBCqelEBwVF6hXFZSOnmFoU7wRnxOTK0/1ngbglBWcfu?=
 =?us-ascii?Q?SbdDxY4chhKCm9ki5gVZWXqKLyQOSuFSNXyHCOPecCw7WWZOnmhVWaI/g7HE?=
 =?us-ascii?Q?/7Mu/+NODDsnq3dRNsT2Zi+oQJIMlCKJDNxrukhX0OSZfb65DxK4aRfpKRHv?=
 =?us-ascii?Q?siqL8H8fn916jUGbHI4ukhJ043BBf6igdFNXy7Sd9Ocd3apyhOddth5kvl3M?=
 =?us-ascii?Q?0CWlFPHOZK0fm+ubA1xRU6fgB3Jwur+UJCCTvM8OUhvKfygeHktmd4oecmfk?=
 =?us-ascii?Q?xr2UeBfeh7wFjpjmVFxQazMg3xzOxX/1uACK5vAJ0jplS+j+sE+5s6pT6WtY?=
 =?us-ascii?Q?wo4ZGhqLvg4G3tamiC/8X0qguk4dFPhU10CCva1Ih6VsJ3PHLzBBDlNKbJzY?=
 =?us-ascii?Q?RtsKXVZmF1iQ7bOE0kZOoqE1OHKfAaH4mjk/BHGNX1nCIhLHaFANVKNPYsxh?=
 =?us-ascii?Q?amQ4MMKGthA7ACIqgXy1/SSlEhYlj8vXXTlkFU8AM7KGizpisPtH2hN1+pVb?=
 =?us-ascii?Q?FmorSRWYXfroMb8XM/O3s5OgDPWTDCGD4b76PdzrXdvwPlyXpls9CeRzWKit?=
 =?us-ascii?Q?qstoEGFxNi4JlcshBxarkRwbrIKcox+3fKntfxS9Qui/jvNjxxm/SZolSuxe?=
 =?us-ascii?Q?/ihrOU1WIWtWEyUTKsvVimso/H907JJrsucJmyv2OhLn7Dck7GtdBLK8/bbt?=
 =?us-ascii?Q?dIz42vB3reWb3TzYs4krdFjb+0679Gsid/GyQEXXj53JgmWymVX+gm5AQR7b?=
 =?us-ascii?Q?WrZdHrJlfUF1cST7udlzkvzreZhl88HDKtWeMJ4rxBRFmGGEv7mjAgVc35c8?=
 =?us-ascii?Q?BbmN43Ki3bHovRJ1ZdW5N/+R5D1YPWvMZNS27SUj5VMbw0TV1TdnTp66b3Co?=
 =?us-ascii?Q?IhR/zyHeddZtJZzrjxYYoOrMtK1lkBJu45HbyPuerlW1Q3SKYGhPXp9xp2av?=
 =?us-ascii?Q?hVSI8e/9zr8mubqEzuDA0Cbo2U247eDD/EhC3te4cvGya4pF/2nOg44SJ8Ey?=
 =?us-ascii?Q?L98xHFE3WKjdkjWKn1Bxta25DlmJe/eYXaY2Yy4ET9Ok71gj1Nyt01bwfUJr?=
 =?us-ascii?Q?uJg2Ky52N0ReiGkdxYgCaNh5QFVbYXvQgTj916tjFBr9r0DQYdiTSRhiUlFE?=
 =?us-ascii?Q?/ZeUg2CvXwP+LAEsX56Cv92lqRk4GJ7eCgPgq2plQaHsRkqYKPur+WgVOOIO?=
 =?us-ascii?Q?YNmXa38rPs7nlbpDCN8qwfi0YNWcApzO6siZ+wrMUXs3EN0sAReTswUHItgb?=
 =?us-ascii?Q?TdH6fIle7UhciE5Sc87tsGmTptGQNaAQVjcThq1tuBj+SEkAjjBQewkDJ4aX?=
 =?us-ascii?Q?OtWd2eAHjGlav3vtCiT4BluBdXz+3C3CfJ3fj+/Z3Q0qBdG78JldXaorH2R+?=
 =?us-ascii?Q?j/EHlHqHOwV8HNCxL/qGWHgBIFSf4ry+DCbF1JDkl9AzmI80tnuf?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c2f13fb-a752-4eaa-408d-08df072a8769
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB16474.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 06:38:55.2587
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dxBKQNuMlYDrynSp0W/vAVsUx+7WewjtFQMZlRpmua1Cg8bH+5zaKbSZeA9fofACAjT2qcPele5Py/6qFPt/qpbax7nWJJTetYaA2Fh35DrV3GlAT13APBzrduAaE3g1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11005

DAI parameter will be capsuled soon, will be not enable to access from
soc-dai.h. Move it to soc-dai.c

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-dai.h | 42 ++---------------------------------------
 sound/soc/soc-dai.c     | 41 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 43 insertions(+), 40 deletions(-)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index e7d86c97da75f..7e64e049d71d5 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -551,46 +551,8 @@ static inline void *snd_soc_dai_get_drvdata(struct snd_soc_dai *dai)
 	return dev_get_drvdata(dai->dev);
 }
 
-/**
- * snd_soc_dai_set_stream() - Configures a DAI for stream operation
- * @dai: DAI
- * @stream: STREAM (opaque structure depending on DAI type)
- * @direction: Stream direction(Playback/Capture)
- * Some subsystems, such as SoundWire, don't have a notion of direction and we reuse
- * the ASoC stream direction to configure sink/source ports.
- * Playback maps to source ports and Capture for sink ports.
- *
- * This should be invoked with NULL to clear the stream set previously.
- * Returns 0 on success, a negative error code otherwise.
- */
-static inline int snd_soc_dai_set_stream(struct snd_soc_dai *dai,
-					 void *stream, int direction)
-{
-	if (dai->driver->ops->set_stream)
-		return dai->driver->ops->set_stream(dai, stream, direction);
-	else
-		return -ENOTSUPP;
-}
-
-/**
- * snd_soc_dai_get_stream() - Retrieves stream from DAI
- * @dai: DAI
- * @direction: Stream direction(Playback/Capture)
- *
- * This routine only retrieves that was previously configured
- * with snd_soc_dai_get_stream()
- *
- * Returns pointer to stream or an ERR_PTR value, e.g.
- * ERR_PTR(-ENOTSUPP) if callback is not supported;
- */
-static inline void *snd_soc_dai_get_stream(struct snd_soc_dai *dai,
-					   int direction)
-{
-	if (dai->driver->ops->get_stream)
-		return dai->driver->ops->get_stream(dai, direction);
-	else
-		return ERR_PTR(-ENOTSUPP);
-}
+int snd_soc_dai_set_stream(struct snd_soc_dai *dai, void *stream, int direction);
+void *snd_soc_dai_get_stream(struct snd_soc_dai *dai, int direction);
 
 struct snd_soc_dai *snd_soc_dai_register(struct snd_soc_component *component,
 					 struct snd_soc_dai_driver *dai_drv,
diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index 77fd457a94f69..83d030e14bb0b 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -1124,6 +1124,47 @@ unsigned int snd_soc_dai_stream_active(const struct snd_soc_dai *dai, int stream
 }
 EXPORT_SYMBOL_GPL(snd_soc_dai_stream_active);
 
+/**
+ * snd_soc_dai_set_stream() - Configures a DAI for stream operation
+ * @dai: DAI
+ * @stream: STREAM (opaque structure depending on DAI type)
+ * @direction: Stream direction(Playback/Capture)
+ * Some subsystems, such as SoundWire, don't have a notion of direction and we reuse
+ * the ASoC stream direction to configure sink/source ports.
+ * Playback maps to source ports and Capture for sink ports.
+ *
+ * This should be invoked with NULL to clear the stream set previously.
+ * Returns 0 on success, a negative error code otherwise.
+ */
+int snd_soc_dai_set_stream(struct snd_soc_dai *dai, void *stream, int direction)
+{
+	if (dai->driver->ops->set_stream)
+		return dai->driver->ops->set_stream(dai, stream, direction);
+	else
+		return -ENOTSUPP;
+}
+EXPORT_SYMBOL_GPL(snd_soc_dai_set_stream);
+
+/**
+ * snd_soc_dai_get_stream() - Retrieves stream from DAI
+ * @dai: DAI
+ * @direction: Stream direction(Playback/Capture)
+ *
+ * This routine only retrieves that was previously configured
+ * with snd_soc_dai_get_stream()
+ *
+ * Returns pointer to stream or an ERR_PTR value, e.g.
+ * ERR_PTR(-ENOTSUPP) if callback is not supported;
+ */
+void *snd_soc_dai_get_stream(struct snd_soc_dai *dai, int direction)
+{
+	if (dai->driver->ops->get_stream)
+		return dai->driver->ops->get_stream(dai, direction);
+	else
+		return ERR_PTR(-ENOTSUPP);
+}
+EXPORT_SYMBOL_GPL(snd_soc_dai_get_stream);
+
 void snd_soc_dai_unregister(struct snd_soc_dai *dai)
 {
 	lockdep_assert_held(&client_mutex);
-- 
2.53.0

