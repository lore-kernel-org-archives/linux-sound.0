Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010053.outbound.protection.outlook.com [52.101.228.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B1D168D0
	for <linux-sound@vger.kernel.org>; Tue,  1 Oct 2024 01:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727746938; cv=fail; b=Wt0jqOY4Is2DP/x1Kame2Bnn1skEvhtImiWuUatSapXmlSCwT/qf/UPO9X6cEX/wmCeiar0sL24ekc8IeBErVX7dQV7UpqSTX11pBOcZtKxTv9U1Z5qGgcHrM7+FsziUmN4GbXwwkaDsMm0KHr+diOikSoMEpgoeEdv7IPIGz7I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727746938; c=relaxed/simple;
	bh=E2yDpIlOSLWRfFqKIwjn0CpIv0hlhF4TPKa1jkCNfFU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=dIrZhWuOM5xPZHm+a4H3g2P02Btk0NxZEMFdNRpehCYQaOREmgcxOv4E2L001LdpXDZrhWRR4XsaHXgGWALZ21U6GGWtf2WK4kW4QeQBKxsh/HawSAbk4zEJiGUwdJz2lLRECrMlrUUZTmvBfyhLYD93tfKbF75vhmN+mhA2IXg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=gL/R4sts; arc=fail smtp.client-ip=52.101.228.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="gL/R4sts"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aHgWW3WoPvnJ7HwAoewaF+9j7VhbeQF1QT/7+kZyezYaKtCSVZ7MMvxMcEBNiAM/Yy1kmVFCcygzApPKdOmXgcwozGwpcoPPPWZucZDMBZwNWynxo45aEMJBR3sx+kcsaIahlH8r0vd2Ngr9Gz6/5KwfqMMDKWnhPrd+KUitat4B/R/qwAW3gbwZ4bZ+xVzXS4HvU0KsFLbNaJzCpOzHjPqZMS34IV1b0gizCpgGEST3oJFrfvQ5ved02V5+9rTTLl/CgJ2PP3ABrN5p/mGBZqcLZh3dIaSUxY+EsuMAuLV3fD8KkeW4zEw/QpuNdAvJmkAFaMuIZCqtCdHTYoUxhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9e1RMc/IHEAH/sNqylWLLExISaQ39k5QeQNP3WHzdVQ=;
 b=m/kkjyGcNw/NXmnbFU/cic6VsMwfalllizC/Rd33FhMzOCXNP8ZzYjIFKLz2atyanSG1w9Mp7BityH1QZGiSmcDcuiqXE60flG/+Puv+/z2gjBaJf6E1Cjq9G0TVG4bIU67UlXDmhg5/O45OUw1eSy6wTYsFxQMtIlcIkEsfiPSNTm92eSKyNBAM7Hymn+e9+NF1zui3Fh7bNjz4N6Av1kJogDrB8prGnyVxSiECgpCUvPCwxHg5+IGQjgY3aClRnkgQ0tbz92DvNwMADvvoT4ufe74izZB4GArX7Outzv0nVrTAg4TIZqH5ItIg+W464z1Eq+tMpDTV75kc/vhv7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9e1RMc/IHEAH/sNqylWLLExISaQ39k5QeQNP3WHzdVQ=;
 b=gL/R4stsCaYPsY/G6iIUHNUIjb/wPcRm4U9j087WgnjzDFyP0JSL3l1AC8egG3kOtHyqmmQHhttBCo6UJOSgk9QUVYqpXb/qUgmgMKKLRb2ZZO1K6JXah0QhBHO7nkCTe229GxVIC2L8kkw248yfEKzAsiUFVOYEGbcg66k0N+U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB6629.jpnprd01.prod.outlook.com
 (2603:1096:604:fd::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.27; Tue, 1 Oct
 2024 01:42:15 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8005.026; Tue, 1 Oct 2024
 01:42:15 +0000
Message-ID: <87ikucvbt5.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 11/13] ASoC: soc-pcm: remove dpcm_xxx flags
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
In-Reply-To: <87y138vbv7.wl-kuninori.morimoto.gx@renesas.com>
References: <87y138vbv7.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 1 Oct 2024 01:42:15 +0000
X-ClientProxiedBy: TY2PR06CA0008.apcprd06.prod.outlook.com
 (2603:1096:404:42::20) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB6629:EE_
X-MS-Office365-Filtering-Correlation-Id: 85a5daef-c0f1-4d0b-c63c-08dce1ba46f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0QynNM8C1n49eBqCwe8vnm/601QDjm1xlJ7a8MNqEuXKkHxZdVWPbsMvcD6c?=
 =?us-ascii?Q?fypPDCil4/bJ+dH0D4QOwKf21e0XkTyli92jf2KYVhz2/B/BSHGhVhXzrfmB?=
 =?us-ascii?Q?kT2Zhs2x2XpKMTQw4oU4Qpa7g9SuY+leIvkeYbwpQYJRNNpzE4vcW4qHMNjs?=
 =?us-ascii?Q?JhbqdCo+LnqK7bn91Cs+bBJ9gIMjnNMArGGfeKLF9VFfP3LVO256wouEG98z?=
 =?us-ascii?Q?3zc8NYGWMpeSJPsRXjYoyxKCeBTnUFE19zQGsL9eIeAm3CV6kcZY7q52/vEE?=
 =?us-ascii?Q?zjhpJ9kBhlaf+oNE2srKOMa7x+waqUGB2/UaVD+R/i5F4l+NO2nXhjhi5F82?=
 =?us-ascii?Q?NTutzteVpMe6Mf+H1fJoiIJQX7EziACreizLzaydytV0STInEYreCV2qapXQ?=
 =?us-ascii?Q?hWI0Vq9+1dmjbu9QazHmwO7i8GM7dbsSXHjTpExzPKu2RAphtFskaNSr1uBA?=
 =?us-ascii?Q?ZKt6GYnSWS3C+VAkErytYmkMosUbwxqEOSqRccYo9KzPtnV/KjMekgnjrd0u?=
 =?us-ascii?Q?qQRGGvLHmoPZmxF0iFZTxjAh59vJI2ZCkNIgU6Jgq0/ZMbySMGX+ZQURwbJm?=
 =?us-ascii?Q?ZaBSD6zB9fHdQjTu51A6/QoRJhq4eh5efJnFDE+Q4jlzRojVVvC0ydd9uKdA?=
 =?us-ascii?Q?lB9eHYanASV8S7J37ICn1E98NuD2oaQii6B9/UaDmWDjGykRpTfVVtfE2RiT?=
 =?us-ascii?Q?JW1cYdWqSSJi6E00BQ37mW+Osu3NXsUfE+qjFSl6V2ntDk9JfUzoyC8kxcz1?=
 =?us-ascii?Q?51iSKs8le/IsS6zrLKp9emVxP1GwkCX8VOI7RSn7JxK4a2eYr4c2BMnkASBL?=
 =?us-ascii?Q?uBBCf36d9I+V+dmMqo6Qaqd7zvnzrAbJo4KtHfrhYtqgRUJw2uXRE1leEJ/i?=
 =?us-ascii?Q?k4HFrNwKRS2Nb2JCfx442WeywYO9QH+lEhnERIOwjlGnQiCcSFutOjQmw75b?=
 =?us-ascii?Q?Czmf2WI2G8NWR8Y70VPol9hCezeoQgttRjIEIfG6cz+gNnGziEl2enVIYtHc?=
 =?us-ascii?Q?dPYG9Q+L9nXFaK7IRAST4wNNC8sCr1CY87Fk9Oskpn0js8i/Oi4fI5kobF4j?=
 =?us-ascii?Q?zL++Mq3lbfHlqqB+Re0NiU7tyY2dE9mIo82vmdkScMFAmRwD8eX3+6QXJp2X?=
 =?us-ascii?Q?URwA2K8a9c6/ZxEUWhxo135uiGxgn6amUxU6CeWIMEIgmkEviWNW2OOx1VHr?=
 =?us-ascii?Q?waH32emZqpfhrlAGnz95miZ4IwlqLCQMEd4++N0DEqnVaTQn0+NtmV0CRCAe?=
 =?us-ascii?Q?6Th9+/0U6i2ahbb8XOs+PHfNphr1QOdMUJ6sZaUApmdg4tPQ32bUd8gcjAm+?=
 =?us-ascii?Q?3KuEBdHTIXqnzetBs0XCAfF3QBCJQLVdZPjxxgFL3UV20w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9tpx2zIAa+6juQM90FXO+wzggsJhpOpCiSKch61EofJrNTUSDpy59LRZfdpp?=
 =?us-ascii?Q?qpsA2Cv3WbqOiG9HPnToPScxX9uYyrtqJtdiRlHNVy1tVgAeccSKn7s0ClOn?=
 =?us-ascii?Q?08Xs2uaIQRsBmToba+jUozlJZ/Y2f8BtsTIzIRY4/Gcg0gLIwrVRMd2Y7/bU?=
 =?us-ascii?Q?gkq9GhNxtJX1Sq1ISm6tongPgDTyq9C9MXJyRgi66orVU0DxMZpji0B/UQ4D?=
 =?us-ascii?Q?8mCVmUz1WZrlndb7XeTM1Q8li2RDbXsgVTRTQBCre83vq3MyQr1cN/WfaUoQ?=
 =?us-ascii?Q?qtERdYG0to9rWBY1qiFNU9AaHjHWcWDkIAAA0EjovCwJtiH10eUNweQ9VwBE?=
 =?us-ascii?Q?tygmQOXONlWccyeb3y0ig7uDPAV/bPooTTyoVwgYD+vCqQsEY7GKuh26KimW?=
 =?us-ascii?Q?D+8kWmcwaA8DrzqfPc6gRdpJStHhWtFKe3wdo0zq0A1lukbV5xXfXwndfh1h?=
 =?us-ascii?Q?E2Uv18LLBheAHQ4ma2iwY8VQgtFT8Pphb/b+pkDA67tQCXvoKVrjP/E2JLAl?=
 =?us-ascii?Q?51/qi359+galxxIJZs6MUB6Hso0uf98+ep3xrmyZV7XAqnx77f6pZ6uzEMFB?=
 =?us-ascii?Q?daARqKfR/h2DPmcCFDvrcKc65nzEIwvoKJzz6+GIM5VcurcpQwVJTfY9ZJZC?=
 =?us-ascii?Q?kWMUR8iIU9L7G6vGLkaakZIi9gvL81Rmh4TUfYDB+xO5Vzec6uoVrvwhcHyk?=
 =?us-ascii?Q?UiQiLVZE7IziafL2i5dGym7zNrqqSGO2hNT68PYHFo4fR9FEeJQdPdsnA4NC?=
 =?us-ascii?Q?k9dqPfmVd316PIYcO/xClfYwWuRb2IomnsXyrUNI1r5tnJtwTo9fQfHS81eD?=
 =?us-ascii?Q?a05Ati74ar5kpJheqwj40jqcBqpkGXkelBJy2NxNVbKswEzh2KS8r5+Z3dYw?=
 =?us-ascii?Q?PkQ8Sq/A8WXIrZcIwG8mFG6eQoGh9EwIQWSIRtFlAwykwJ7YNkgnKb0O8mXy?=
 =?us-ascii?Q?dlJTCwe+Q0gL8wegpl7No27ZAM8M3s3dTGyAeojaCfLFsS1QkFFvumx5G1i0?=
 =?us-ascii?Q?0a2bP0iPBpLTqD61nSAYxqk6VbwUdO4/yleCBz2KrFQuBKaqv9+6rwMctT23?=
 =?us-ascii?Q?oKp0vOdsB2EYsQhZnAfbA6htBU8XA5u6F0aFEsWQmhLrYCOJ6vAUpZLg8GvG?=
 =?us-ascii?Q?7lrR46faZ7wmMhMR4STZAhtNlrSiEwKe2Km1Aqivd7qESIBHW6W4gnzfVVPJ?=
 =?us-ascii?Q?u9JdPnKb5u2z/Z3LYvberDHsVR8revJPqo5gGL/MU2e+aVanSmyVHAvWuY7w?=
 =?us-ascii?Q?/3B5+jfnVWGaATY/DBiH1nw5VzTOgiW+FFXUd6WnIqbvb2JdGjchcNCY/Ukp?=
 =?us-ascii?Q?qRgbWg9HfcT0Wqdnm9phioLjAHolzNQMsKCedZ0Ees4CMtdr5tdT0m5529uV?=
 =?us-ascii?Q?PBBPNGxd+roPVa0BU/Ng2zyK3c6i8L6HKyTIUEYvM9rwa4xjEdTxilJc8NWs?=
 =?us-ascii?Q?kW+1+t+hz9vGMIIc0/F3MEz2cVm3jZN+fbB522p8dao/rt+jOEMb0t6+u6ju?=
 =?us-ascii?Q?DtnRQT+mgaKi4jleNtiIzsZPO0lULPfXDekK7vrFqwqkCUMKF2mnsEtvZHB4?=
 =?us-ascii?Q?kAhzVnD1ASisYlSXJq1YvII6Kbpl8JdT7Qb3IKdGWd84pHJzvu8qycTxj8wN?=
 =?us-ascii?Q?iq7WA8St28clcSJWou40aag=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85a5daef-c0f1-4d0b-c63c-08dce1ba46f6
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2024 01:42:15.1668
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WON1eWN/VM6sk5MnsTwIH73oS5rVJfQIV6vDs590nPPWIrlYKAHoP7Y2JVXJ0EGR+E48iaMCx5f+NbAHUdQsk6gXQeDYAyJY1I478e+9ohIwyUgPPNtMiOzlWT0QmHxQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB6629

dpcm_xxx flags are no longer needed. Let's remove it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc.h |  5 -----
 sound/soc/soc-pcm.c | 33 ---------------------------------
 2 files changed, 38 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index e6e359c1a2ac..123a0140a23c 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -815,11 +815,6 @@ struct snd_soc_dai_link {
 	/* This DAI link can route to other DAI links at runtime (Frontend)*/
 	unsigned int dynamic:1;
 
-	/* REMOVE ME */
-	/* DPCM capture and Playback support */
-	unsigned int dpcm_capture:1;
-	unsigned int dpcm_playback:1;
-
 	/* DPCM used FE & BE merged format */
 	unsigned int dpcm_merged_format:1;
 	/* DPCM used FE & BE merged channel */
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 7a59121fc323..27810f6f8630 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -2860,39 +2860,6 @@ static int soc_get_playback_capture(struct snd_soc_pcm_runtime *rtd,
 				has_capture = 1;
 		}
 
-		/*
-		 * REMOVE ME
-		 *
-		 * dpcm_xxx flag will be removed soon, Indicates warning if dpcm_xxx flag was used
-		 * as availability limitation
-		 */
-		if (has_playback && has_capture) {
-			if ( dai_link->dpcm_playback &&
-			    !dai_link->dpcm_capture  &&
-			    !dai_link->playback_only) {
-				dev_warn(rtd->card->dev,
-					 "both playback/capture are available,"
-					 " but not using playback_only flag (%s)\n",
-					 dai_link->stream_name);
-				dev_warn(rtd->card->dev,
-					 "dpcm_playback/capture are no longer needed,"
-					 " please use playback/capture_only instead\n");
-				has_capture = 0;
-			}
-
-			if (!dai_link->dpcm_playback &&
-			     dai_link->dpcm_capture  &&
-			    !dai_link->capture_only) {
-				dev_warn(rtd->card->dev,
-					 "both playback/capture are available,"
-					 " but not using capture_only flag (%s)\n",
-					 dai_link->stream_name);
-				dev_warn(rtd->card->dev,
-					 "dpcm_playback/capture are no longer needed,"
-					 " please use playback/capture_only instead\n");
-				has_playback = 0;
-			}
-		}
 	} else {
 		struct snd_soc_dai *codec_dai;
 
-- 
2.43.0

