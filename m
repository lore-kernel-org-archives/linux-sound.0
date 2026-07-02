Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011052.outbound.protection.outlook.com [40.107.74.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68BBB2641C6
	for <linux-sound@vger.kernel.org>; Thu,  2 Jul 2026 01:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782955308; cv=fail; b=avy6kWTFaXd0rm+OqJoXHaLC2Iw5ftSmMLuhKzaInrPUu0TmamoO1CFoweVImRgvsTi6/7FnMtf6g+3m2T0PTU2ABzPNUNFnSUz+JU+S0IQyOJbLLUKkwi1u4q/j+w+npKq3sUAoWwgyRQ/ybFOBB0oDTmI1Wgnli0DMoSSPlxw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782955308; c=relaxed/simple;
	bh=DnsmYSGaRXLR2Ra/w3nOjdBWD+KpyUGb7e4EPzpxIpA=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Yg7GOqN8KO0iA89gp+ubyvLrSn9hSL6id4y3Yqsmovt3QlK9Boa2PMsshqNeagw9BN3I63MBXLoeIjq218ur72reBVoTJMQssBpc9wetM+f/haPSPLqH433C4lUwSw6puarSQ/m58xCa7EiP0nhREK+JITOK3cSDhAxGWnlbEsA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Q3ycnBpb; arc=fail smtp.client-ip=40.107.74.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Q3ycnBpb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QFphxvwO+iNe4mSAWTQpWlCD0X0ZNqReN7rYgjZu69ivZGltt06I5bFZfpJarXMOMCL3JGjnrWaRUTIgdv3WMBn0hELBtcAxrspXDN+XqR0jFwIxp0pSfP1kiC7JUijw+/cSWhnCw+9xb5eMiT1au0ri3N+ZLBqKy71rhEXyCIWXR3hkTPso0SWpJBe2Kn+14yc6+uoQe1tU0ZsDL71QjSdBhTqWr4DLHxXF8D/1hNjNqYR+xNU+J+qhU0483MQIUJzMtqpslXR1c3RgIE+9VgouSeTBs3v3sooZZrg1Lk8AXXsNklxyuecO7CVzRPq3PwwKmOzgpLDFxAv8HYa9Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E7zd3hFQ0I38fRPzFdx2pXv74r0gYtvD2G/JIrljXzw=;
 b=mZkgHvyDRR6DUS6reN+wFxNVivJBCufHVAZ0Vr44MGBOmrN4C41pcEPw3G/P8/Nwrnof+2d6WcLnYyfuXY9XfKSrvYkMjOA9C0vss7QMxSwRag6CR11ygUJPP7fYU3mxEtyPyImRIM/BxW6SBy6TC5l6+YjIFzaJWoIkaKUPfWrjEqRmVbCpcDXYHqXMubnFe8jxf29dSKBUEt23fnNbf01PoKBitxx5imeaSL66p8LSkwzUwPClTaK7yG2iQK6jQsF4jKLzVXO/ORLnNaxjg4+RCEgDeR1C+Io27B4KXiJgsC373UWxE5nNh6hyaX2DhrxY2uLzTmkGUmkAD9huXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E7zd3hFQ0I38fRPzFdx2pXv74r0gYtvD2G/JIrljXzw=;
 b=Q3ycnBpbW/bP/8VfDypOnGlZ6HFTXsCcLeQPS573KkqW1FLnYdHOWY2x9DH750wo5u237iY8B++7E1WSccr3HOatOSWRrJZMkjRc3y9dWsp9d63i6idD1IwWGTF0b7G7CooiOBB+c9//1kA1wjwVJLD7Ay9oLkqZCtEE9Lk+QAM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OSRPR01MB11811.jpnprd01.prod.outlook.com (2603:1096:604:235::9)
 by OSCPR01MB16080.jpnprd01.prod.outlook.com (2603:1096:604:3e6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Thu, 2 Jul 2026
 01:21:45 +0000
Received: from OSRPR01MB11811.jpnprd01.prod.outlook.com
 ([fe80::a2c7:5e53:c133:d834]) by OSRPR01MB11811.jpnprd01.prod.outlook.com
 ([fe80::a2c7:5e53:c133:d834%5]) with mapi id 15.21.0181.008; Thu, 2 Jul 2026
 01:21:45 +0000
Message-ID: <87mrwaxk2f.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 6/8] ASoC: soc-generic-dmaengine-pcm: use use snd_soc_component_register_with_name()
To: =?ISO-8859-2?Q?=22Amadeusz_S=B3awi=F1ski=22?=
 <amadeuszx.slawinski@linux.intel.com>,	Bard Liao
 <yung-chuan.liao@linux.intel.com>,	bui duc phuc <phucduc.bui@gmail.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,	Fabio Estevam
 <festevam@gmail.com>,	Jaroslav Kysela <perex@perex.cz>,	Kai Vehmanen
 <kai.vehmanen@linux.intel.com>,	Lars-Peter Clausen <lars@metafoo.de>,	Liam
 Girdwood <lgirdwood@gmail.com>,	linux-sound@vger.kernel.org,	Mark Brown
 <broonie@kernel.org>,	Nicolin Chen <nicoleotsuka@gmail.com>,	Peter Ujfalusi
 <peter.ujfalusi@linux.intel.com>,	Pierre-Louis Bossart
 <pierre-louis.bossart@linux.dev>,	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Takashi Iwai <tiwai@suse.com>,	Xiubo Li <Xiubo.Lee@gmail.com>
In-Reply-To: <87v7ayxk3s.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7ayxk3s.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 2 Jul 2026 01:21:44 +0000
X-ClientProxiedBy: TY4PR01CA0030.jpnprd01.prod.outlook.com
 (2603:1096:405:2bd::12) To OSRPR01MB11811.jpnprd01.prod.outlook.com
 (2603:1096:604:235::9)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSRPR01MB11811:EE_|OSCPR01MB16080:EE_
X-MS-Office365-Filtering-Correlation-Id: fd9b6c69-7e7e-4c0e-9c0d-08ded7d847b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|7416014|376014|52116014|56012099006|11063799006|22082099003|18002099003|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	pQJVxuxUc99VXcaNhDMi6XHCZk6V+O1TFMR0ZvNHmRP05+dqQgSShwJsNYA0pGx6QXAs6B4Wj07ALYWBzTrL+K2sgaRCJuyXZtBUDwWgIohNuDjHjbveZJArjI5PuHp2zIRG14+Ny3HK/K4a747J+KmpBvvN/Dk9+LzxKcs6VifDnmPNAWDEImdvqSg0oaJw63N/70exRACORiVlc355jJUGhg3CFDEUQW2oGYN3Na+1dKgR2fcjIbJgyESFwbFxsmRSsWXNPUrTlwfB3gitesjot/11Rv+gJ6h7WvnQpfP3D85uPGaME40/QKeP/UajVAGyMEaITMZShMj3mK7cCurBaPVDKaEMxltOzw5hsGArMrkT6mHoCbV9JktMKm+lGqXeE5jtuO2EIa+vVl00WJi3HdUz0g6TPBMJcLj0aw0Hk2HOhjcgPC+plZq1Exa89pNZekfBeTuj5MJXYgMqJzsD5wJrWUrBKHg+M568Fd0Mw5qRBjytSAAAMOE15Qs+E8GKF32oewDbC27mSOSeu6aMb+1uILMKdcfPkQ0ksY13B3WIgwm2QiDRXcZ/nju9nzwIcQyhsaQugd2UKX//eHe8wcNS9Yv8zMVwcdwC3CqU0pJyR9DrOxkdl5Xwa2K6C5X5h7dM3d+bdwTu7n2IhyP8PhRCycWvC/06A8FMwjm0FZRS4LKMWT/4GXmLzFLovJThcVTU5/GuSKaEpoTDHtiVzQ0Ly1t49T02fND8dOpnchgWhu9q/XuNnZn0Mkkz
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSRPR01MB11811.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(7416014)(376014)(52116014)(56012099006)(11063799006)(22082099003)(18002099003)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0hFKbnWVBh4TzCRjZPSTnCVdi1QjeD4Jz3mVPHgB8v/Z3XlmBAdANPaPC8Fc?=
 =?us-ascii?Q?zCXAAhQG3ZgzC9PmK+XFhGLvLxZVm8NDsvKoBhWagx2qtY55EN94qcwOLJrT?=
 =?us-ascii?Q?Xp35Kn6dcL31tFiLK53jWqPPI6jAC4Tgc16tUJEDYHpbiSdrCi4o2p9mtN+N?=
 =?us-ascii?Q?AVafK9ei3Tpuxkyt/Azp8LvpuTCNcknZNI3BSAzLib4/CpXlCuxoiEIsTNOe?=
 =?us-ascii?Q?W+fAmvf1qSt2Pdfs9TonYdL27kT8otBb+uy8v8AxeSeWvO/IxLeuzFgBNgD3?=
 =?us-ascii?Q?LYxcF7T3kisy12c91ZfM+zqV1oS024Kc4E5qfZGkoRj/5IdDsoE+Fubn2r88?=
 =?us-ascii?Q?zNWVakdvZVKvFWa5GkqAyVgV+19t1zaMMTAcQjIUsGGg/5csxCo37m9/MFnJ?=
 =?us-ascii?Q?O511+3MIE3wtHCVHhWoHNzXXRt98OGxiQ2DOilmNHYgGfVNo/f+4THE3XyLM?=
 =?us-ascii?Q?Xi6D0jSA/QkR5pN/Y0DH/BLx0/L3dzFyn4kcQBHpFnvaycHJjiEjrr+CAtHK?=
 =?us-ascii?Q?VSMG+hpwSomMhQvGktww3T+kZ+zLQgOCkZAoZV6oj5JS4ooDwmEXVcNI0C5K?=
 =?us-ascii?Q?yUKvGC7Oy1IY08NuWDne1t/Cls5LvjkSulKfuhLxQvGBmaV9wTQDz4mDZ7np?=
 =?us-ascii?Q?BTRDCWiyhKXyRK4lKpdFfFjvXbCWiLN8dXZFBO6LmqMSQP8+YF1KpGENiD2U?=
 =?us-ascii?Q?3XCfMTHo1DeaSJ4NgyXaMix+0bsgE6xfUx8e4M5jnFDHEGEML0yYHlMquxfR?=
 =?us-ascii?Q?z2lCkJHYvIf9L0nv/02BWS8ei9yZbH7YQVQJzdP9JPpaq43zx8hRNXPMbHRe?=
 =?us-ascii?Q?Hi8rez1j0QOeNPic4KJiaNhKQu1It3/yZGMX3yx4mR+0FZpy6umROUKfTlfc?=
 =?us-ascii?Q?DINt2d9sAGsk7bsRoHg+hg08pvvZVDGuProPgveWdpfH3iGiMYoQNPJ+kGB8?=
 =?us-ascii?Q?jeqZj/LFbt8lgWCk5FMNB4mmJ5CIFA/ACjHcgDTvkwbXnEQLNF9j5Cnuf1tP?=
 =?us-ascii?Q?MeEMP7J3EQVQKCxGo/+WLQU7q6O0W1ej1biR9S2RPdUWz/r9Ln7CgNN48PQw?=
 =?us-ascii?Q?cL/NGNGCkRqvHEzcxLQMGuMhLVc6p9/DS9XO1ebSytpQK+ZbM2lIzLblnHuU?=
 =?us-ascii?Q?ANuc/3ApKiuU3hfRPeAevs2kG4aNgJUc1M6YJh/VMRg5ie7SrNhU8J0vANhB?=
 =?us-ascii?Q?MNNcgY6U9jvUTxXD5dWtO5VeLHaarEt7yiLWPkh9WRf15kmdab/MuXPokDkF?=
 =?us-ascii?Q?pxPxuZmbk0kc4YBGNFb7WHIv7PoDgb61EYoJFIzolQk9Lsg+qUfrPZC4JF1l?=
 =?us-ascii?Q?joB0XWslogUzZTOHh0BzdzWlwJ69kZByMXD83+x3z+hNufHwLsFaVevyNFWr?=
 =?us-ascii?Q?vav80CmgGUP12fbFgLkWCsqkRvgnRTBWPVIea6PkLXvrt9MRuTDKSD47WO6u?=
 =?us-ascii?Q?2XeXTVakWG58v/1hbXoEz6FQYV2Y2t9xRJoz1oflbPLz//9oXuZKNwa/WgAN?=
 =?us-ascii?Q?skvLxuUm1JcAlE0PBas9vmfQlTWCQU8GZLf80pPSFWIRyXP3u8yxR2xG8yXC?=
 =?us-ascii?Q?wCnejkiliYmUzlkn6lQwf1Y9FWzeJ1A6WrxCOhyDQE/hVg0nSqsrtG5jMOPr?=
 =?us-ascii?Q?5gep8pQJMtDJyG2vXM+pEMHn3I2Rj5uw/g/31RAyDazIPQx1RWgZsSiihfy8?=
 =?us-ascii?Q?vnZRLPLOb/xxw4NnQdKBYEppiexkR5Vr5kcZs39DGaLJNKExQWixI7ekvfqX?=
 =?us-ascii?Q?Wn2T+fomdBJmpOgrIJQXw1ZcpD2QQcBHL7y4TipDpJtPlhQyd7c5?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd9b6c69-7e7e-4c0e-9c0d-08ded7d847b8
X-MS-Exchange-CrossTenant-AuthSource: OSRPR01MB11811.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 01:21:45.0682
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yD2azqAv5jPfkM1ZfBEZSO167ujJfc6CBO6JjcTzskpqlXVWsZLndzTJz0pSMM/cmlqEgpcuhvs0qPPjK/fEj2zfZaT9L46Am+fw1aZIcgFlywfJkt9GWCRQvsYY6qCj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB16080

Current soc-generic-dmaengine-pcm is calling snd_soc_component_initialize()
/ snd_soc_component_add(). Use snd_soc_component_register_with_name()
instead.

It is using container_of() to get pcm from component,
but we can now use snd_soc_component_to_priv() instead.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/dmaengine_pcm.h         |  6 ------
 sound/soc/fsl/fsl_asrc_dma.c          |  4 +++-
 sound/soc/soc-generic-dmaengine-pcm.c | 25 +++++++++++--------------
 3 files changed, 14 insertions(+), 21 deletions(-)

diff --git a/include/sound/dmaengine_pcm.h b/include/sound/dmaengine_pcm.h
index 9472f0a966a27..81422219ed390 100644
--- a/include/sound/dmaengine_pcm.h
+++ b/include/sound/dmaengine_pcm.h
@@ -175,12 +175,6 @@ int snd_dmaengine_pcm_prepare_slave_config(struct snd_pcm_substream *substream,
 struct dmaengine_pcm {
 	struct dma_chan *chan[SNDRV_PCM_STREAM_LAST + 1];
 	const struct snd_dmaengine_pcm_config *config;
-	struct snd_soc_component component;
 	unsigned int flags;
 };
-
-static inline struct dmaengine_pcm *soc_component_to_pcm(struct snd_soc_component *p)
-{
-	return container_of(p, struct dmaengine_pcm, component);
-}
 #endif
diff --git a/sound/soc/fsl/fsl_asrc_dma.c b/sound/soc/fsl/fsl_asrc_dma.c
index 38f2b7c63133a..2f662bdf14d07 100644
--- a/sound/soc/fsl/fsl_asrc_dma.c
+++ b/sound/soc/fsl/fsl_asrc_dma.c
@@ -219,7 +219,9 @@ static int fsl_asrc_dma_hw_params(struct snd_soc_component *component,
 	 */
 	component_be = snd_soc_lookup_component_nolocked(dev_be, SND_DMAENGINE_PCM_DRV_NAME);
 	if (component_be) {
-		be_chan = soc_component_to_pcm(component_be)->chan[substream->stream];
+		struct dmaengine_pcm *pcm = snd_soc_component_to_priv(component_be);
+
+		be_chan = pcm->chan[substream->stream];
 		tmp_chan = be_chan;
 	}
 	if (!tmp_chan) {
diff --git a/sound/soc/soc-generic-dmaengine-pcm.c b/sound/soc/soc-generic-dmaengine-pcm.c
index 467426d2b5e4e..23eba73d37388 100644
--- a/sound/soc/soc-generic-dmaengine-pcm.c
+++ b/sound/soc/soc-generic-dmaengine-pcm.c
@@ -77,7 +77,7 @@ static int dmaengine_pcm_hw_params(struct snd_soc_component *component,
 				   struct snd_pcm_substream *substream,
 				   struct snd_pcm_hw_params *params)
 {
-	struct dmaengine_pcm *pcm = soc_component_to_pcm(component);
+	struct dmaengine_pcm *pcm = snd_soc_component_to_priv(component);
 	struct dma_chan *chan = snd_dmaengine_pcm_get_chan(substream);
 	struct dma_slave_config slave_config;
 	int ret;
@@ -99,7 +99,7 @@ dmaengine_pcm_set_runtime_hwparams(struct snd_soc_component *component,
 				   struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
-	struct dmaengine_pcm *pcm = soc_component_to_pcm(component);
+	struct dmaengine_pcm *pcm = snd_soc_component_to_priv(component);
 	struct device *dma_dev = dmaengine_dma_dev(pcm, substream);
 	struct dma_chan *chan = pcm->chan[substream->stream];
 	struct snd_dmaengine_dai_dma_data *dma_data;
@@ -148,7 +148,7 @@ dmaengine_pcm_set_runtime_hwparams(struct snd_soc_component *component,
 static int dmaengine_pcm_open(struct snd_soc_component *component,
 			      struct snd_pcm_substream *substream)
 {
-	struct dmaengine_pcm *pcm = soc_component_to_pcm(component);
+	struct dmaengine_pcm *pcm = snd_soc_component_to_priv(component);
 	struct dma_chan *chan = pcm->chan[substream->stream];
 	int ret;
 
@@ -176,7 +176,7 @@ static struct dma_chan *dmaengine_pcm_compat_request_channel(
 	struct snd_soc_pcm_runtime *rtd,
 	struct snd_pcm_substream *substream)
 {
-	struct dmaengine_pcm *pcm = soc_component_to_pcm(component);
+	struct dmaengine_pcm *pcm = snd_soc_component_to_priv(component);
 	struct snd_dmaengine_dai_dma_data *dma_data;
 
 	if (rtd->dai_link->num_cpus > 1) {
@@ -219,7 +219,7 @@ static bool dmaengine_pcm_can_report_residue(struct device *dev,
 static int dmaengine_pcm_new(struct snd_soc_component *component,
 			     struct snd_soc_pcm_runtime *rtd)
 {
-	struct dmaengine_pcm *pcm = soc_component_to_pcm(component);
+	struct dmaengine_pcm *pcm = snd_soc_component_to_priv(component);
 	const struct snd_dmaengine_pcm_config *config = pcm->config;
 	struct device *dev = component->dev;
 	size_t prealloc_buffer_size;
@@ -279,7 +279,7 @@ static snd_pcm_uframes_t dmaengine_pcm_pointer(
 	struct snd_soc_component *component,
 	struct snd_pcm_substream *substream)
 {
-	struct dmaengine_pcm *pcm = soc_component_to_pcm(component);
+	struct dmaengine_pcm *pcm = snd_soc_component_to_priv(component);
 
 	if (pcm->flags & SND_DMAENGINE_PCM_FLAG_NO_RESIDUE)
 		return snd_dmaengine_pcm_pointer_no_residue(substream);
@@ -293,7 +293,7 @@ static int dmaengine_copy(struct snd_soc_component *component,
 			  struct iov_iter *iter, unsigned long bytes)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct dmaengine_pcm *pcm = soc_component_to_pcm(component);
+	struct dmaengine_pcm *pcm = snd_soc_component_to_priv(component);
 	int (*process)(struct snd_pcm_substream *substream,
 		       int channel, unsigned long hwoff,
 		       unsigned long bytes) = pcm->config->process;
@@ -437,6 +437,7 @@ int snd_dmaengine_pcm_register(struct device *dev,
 {
 	const struct snd_soc_component_driver *driver;
 	struct dmaengine_pcm *pcm;
+	const char *name = NULL;
 	int ret;
 
 	pcm = kzalloc_obj(*pcm);
@@ -449,7 +450,7 @@ int snd_dmaengine_pcm_register(struct device *dev,
 	pcm->flags = flags;
 
 	if (config->name)
-		pcm->component.name = config->name;
+		name = config->name;
 
 	ret = dmaengine_pcm_request_chan_of(pcm, dev, config);
 	if (ret)
@@ -460,11 +461,7 @@ int snd_dmaengine_pcm_register(struct device *dev,
 	else
 		driver = &dmaengine_pcm_component;
 
-	ret = snd_soc_component_initialize(&pcm->component, driver, dev);
-	if (ret)
-		goto err_free_dma;
-
-	ret = snd_soc_add_component(&pcm->component, NULL, 0);
+	ret = snd_soc_register_component_with_name(dev, name, driver, NULL, 0, pcm);
 	if (ret)
 		goto err_free_dma;
 
@@ -493,7 +490,7 @@ void snd_dmaengine_pcm_unregister(struct device *dev)
 	if (!component)
 		return;
 
-	pcm = soc_component_to_pcm(component);
+	pcm = snd_soc_component_to_priv(component);
 
 	snd_soc_unregister_component_by_driver(dev, component->driver);
 	dmaengine_pcm_release_chan(pcm);
-- 
2.53.0

