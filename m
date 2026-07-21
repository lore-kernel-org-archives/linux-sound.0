Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011024.outbound.protection.outlook.com [40.107.74.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF0C3F1AC4
	for <linux-sound@vger.kernel.org>; Tue, 21 Jul 2026 01:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784596683; cv=fail; b=XBaSLpbMOUn1InU7WoP3dfYWODQqgB3iqiBTGcZbHNCMCpkT0+6OP1o+WfY9tUKMQ/1i5CDPblRx6SgjBBKwJFA2mX5NubIwXSLmh0R6yL0fWzU6SInxYlmdJFwVGGNkbYTQK6zSK6xUrHo1Pd6Ype8yC0KWF1nIJnrahrAIk1I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784596683; c=relaxed/simple;
	bh=K6hRFVYQf4zRTMVfdwf4xUZ4wJRfpEsXICml5U9b5+8=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=QEbuPtZMFwhV/RAF7TLVLjDmd6wo1o24REeW1HPvNXEikuYUyKFPCtDX17AoPp+i/vKeS05zGCk/uctOwRac+E21sdErGFmuFkoNZTX1e2gNqvksMkzvb9bNLgSYj69Nb62sF3Kdv+CyI13w38NMwGa3tHnUWuBLWSSqhk3gAOU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=RAN/qrjX; arc=fail smtp.client-ip=40.107.74.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="RAN/qrjX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rsDE2BPzwonOdTLr09KjBXXAllm9hHFV2C5reCNPj9a4EczY4ZPR9cWgcyFArmr0vw38N6Yu4SPsM6nJHwV7Af814Nrp+CuYrnb0zEJ6/Rt1N2vmDXeKJ+AgbtDHZvVCkhq7/Wo/uRb7T6gctcViHgv+edbpeg4gAZ4neYfgjzNV7/BPjdcSIzE4yRAJAo9FUwVBMx6ADXBoUmZS0mOSaYu9Ywg/CslhaBdLAUQxKx6hD0xyMTFTSx0zPgsqCKtWMajHSuYE+Qj5hSuJXDEDxNHfIUDFLML4HT/XwBq/+SV7qMQsjrCqhku+GVT6Nv3aYYdlwTVrCLAUIAztX1IsNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bdGrvPwP161jWETly7BtnCMOWjsALxTiU4ifIcZNeE0=;
 b=RlHs7Lnwz0Gn72jPQHBWSHcCblP/R+KNz8Oc2b2B7+qjut15lrTWWt1/xbaTudPKzn8sKjie0VZiU1Fg/5N5pD9eEaEzHbg4o5L2CDewkUSnBl25BsR9WrslmZvXC/t4ZH8mPjtsJc7ORUc5Z2MslGsC+k7LITcGqxAigANdLgn5uK2oo6/84bfS/8D+rHodGB2ZRo7bF/eP2XbsSnE4DOGL5vd8JK2ybJ+Sgs0hzBWy4Kn2AtpU28Km3h8Nc8pI8wd1GSMM6qH5y7PlMZgyHegyzcXdFb+l3pAIQVZla4q3zIonuOkF01Gmf+6K5CivTAW/l/thWWTHL5bh+mSyvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bdGrvPwP161jWETly7BtnCMOWjsALxTiU4ifIcZNeE0=;
 b=RAN/qrjXu/t+/6t8ELB9BDFB4e6qbxN75d4SUhZmTCWNC3wW1OHP+v+88qiMkkjCLVyJqPnCym8nojjYYiAJq65hprEArQaxIB/6B6Ps+Kh5jnfm4BKwL/yBMYRte+fyMngS6IW3IvzZAXA/9HElYaCTGKQNuRF6b+SAL+DGlj0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYYPR01MB14135.jpnprd01.prod.outlook.com (2603:1096:405:211::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 01:17:56 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 01:17:56 +0000
Message-ID: <87ecgxjg3f.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v4 09/12] ASoC: soc-generic-dmaengine-pcm: use snd_soc_register_component()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Bard Liao <yung-chuan.liao@linux.intel.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Fabio Estevam <festevam@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Takashi Iwai <tiwai@suse.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87qzkxjg53.wl-kuninori.morimoto.gx@renesas.com>
References: <87qzkxjg53.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 21 Jul 2026 01:17:56 +0000
X-ClientProxiedBy: TYCP286CA0221.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::7) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYYPR01MB14135:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ba5f08e-0cd1-4c39-67c1-08dee6c5e568
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|23010399003|1800799024|921020|38350700014|22082099003|18002099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	rB4BJyh40rM7LA1tlqKuuP4ja7YCBNdOvSKsuQT0SL7LNXCqtDyDFPpjlorxfhgBUJX1euCwWL5iJVx8Kk7NN7ba2N/P87UFAbwNeuADKaHsHz4rFHLeJGnv5rEGkVDZQXYuEBQoRGc0MN4BuFD4bvrGfb0O+KguDmriJsZc1zQE/rNydZeSdAfgSEPsFSIUpUW/wYW4VnZIjXdEpCSy3pjjn6NBUNLdSCnrjgxQ88VW5M7JwZJAgahAWfsZ8oQOjorIAz8h0uIZfKli8rbPIBaeEEc+6bqW+eIjSIRInfOyP8zTnIDGB7Vgtoc7Jg3xqkj0Wx3WRLRelCqG1/oTVBEo+XOSm6wPX64Y7ypCcPYTi4HfxcQg5rmtTfI2NGqQt2K3h3fRsAS80k7pn4Nml7gciF+04usE94K66qfQfBIMzmRTvDshBol3MarrbN6HlxIno9w8O89LeaF8LmWLR8/ed0m5nCQIM9Yxht+7luiAq0eUCsf1YR0hV51LRNcOwdhQSy6aDCbBr+/Motu2uv+03wtjMp05c2jgBYP6M9JigUjionYKUbCzsZ0qFWq43awaIH0+Ikj8hiFg2zSW6so7EvGm6Jvs0QKCOL0X/LP29AniLDJlRRvs2p6CKGq34sgkxFHdfV10btvMbB9auOC7T77GrzqjYdiepXDysiiIav1fFr5/ouxMezpyGBejadpGz62wOL9HSUFpZdeMMqd7Hc62H1ElDzGd/dR51ygpSSZjI5lnwKzGGEpYogTk
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(23010399003)(1800799024)(921020)(38350700014)(22082099003)(18002099003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MAGuXMuzSkD37huZkLeR03oHQyvpXzFHYouzHRJY2h9/2xP77x76oxvloC7s?=
 =?us-ascii?Q?cKQZXOFTklw1WspX5CpN4QPGA0PyDLyC1ww6P6ERZgnKR9TCNRTcuH8P4Dp5?=
 =?us-ascii?Q?uYw2y0Fvw3iec1nlLmQjKWK61dEQR7C6+3AxlSc02RnajRwFYFrFGDj8M2LZ?=
 =?us-ascii?Q?taS4heqahbE+jO4WEYDQqsIjc0vJk/BObhJHMoKOnJNPpOcAM7mR+7cA8FSd?=
 =?us-ascii?Q?9AsRjtnpw01HCPqUvSYTK6fDtkyrVSiFMqbMaWtW9Os0Ym7+N8wWVMgWWu5K?=
 =?us-ascii?Q?YqEp1cDuE5fjGDdE4kmq1IDJtCZn3qWIQrVAJiApslsSS5ah+luJWY6B/ewK?=
 =?us-ascii?Q?SYdLDD8X5gKQu5D7QscT8exYUnJbWee88LnvwYS1/J/6knGt5EcU4DOWnQRS?=
 =?us-ascii?Q?tTn7qywIHWygaw0LbqjLH0CLindJlbAp02V1zD9BPU26HLUlm5OejKm2rtSS?=
 =?us-ascii?Q?zum95sRyShRaJG0o5omIpDGH7T1w16MDc1oTg+9UBXohIYNvcfYc5c1cZPFp?=
 =?us-ascii?Q?rfXJA0iVjLw76N6RH+JUGjf/EBTouN9m3aASCMFZ6iwWic4tWCHEDa4zQtJu?=
 =?us-ascii?Q?lCnyHF4hP8YKE/MPdlrf7vKc12AktP1yzRZVbRzl5CvpSE5+ECiK9ra768bX?=
 =?us-ascii?Q?52aaosRboSDqx5sTwiaVVY3VcSOZLKqysJApaK7azqAQW8TvsA0jGMg1BJrO?=
 =?us-ascii?Q?mB2R5LIOx0kU6zTA8NSdDZX1vfKosNw5fqwG+k4uctnwyt7HXMPDR43TL3d5?=
 =?us-ascii?Q?q5VPONHPfdX6Z49AL2lClkemwihifdVxcsyKtiTEB49bXqxUCzD+Tpjjnclm?=
 =?us-ascii?Q?2n8XdkmdSXHB+8tZvXUHkdNqrOfFeTw4uMbQdw5lVgLMMpZm7dg5t55WU17Y?=
 =?us-ascii?Q?8N9+uKt1eEt84W68zvyL+3HVKDZj1Jqlbquy02x7ON8IoG7WaqLA8kwXq0Ny?=
 =?us-ascii?Q?Yr0kB02SmbMnWXq2/+GrVo1CDy3goUJcV+g/+lm4a+znF+pRBG1RPNW14uxt?=
 =?us-ascii?Q?xlP0vKoPbgjqJieUME0cFDevxy3ndwLG70Ra07HBrF2vcz0hHbMuS2Kg8k7A?=
 =?us-ascii?Q?XkCYQ8O3wyGaboPCCZg0cXwgnDRuRezLZOYDW5iK5bpBPKMsh+tHl4qN71Ju?=
 =?us-ascii?Q?4McFW48CRWaXjvLSHK7DfFoYXnnSPLyyNVrrJBwc7ZCe54ezWL0MHiovGoQ4?=
 =?us-ascii?Q?HSRVU89hpHoHeWP/iXkAfJPxQ780NZPncAyqd7N7luuEaJsqL5vd6+ReBUSR?=
 =?us-ascii?Q?UUCpKQgLE4h2naxShak6/TQjAOnWU405NemM3hg77b95EmTmaQ6zePnDw6h8?=
 =?us-ascii?Q?o3JHlrRPL/ezaz/ecyICnS4ktIfPZN0UFQjNfpwqRSlFzDill+0CA1sC6Gk6?=
 =?us-ascii?Q?yXgknYOUWUirPc1KTEmJf8pbNC4KU50drVej4EGHumXwogPtHHSei7vTc9U9?=
 =?us-ascii?Q?M0OHyVK8hvyfYqdMllQyuTLWHd07NKk/kz0RenFQgMQmsOfqV7s7cnbXtO9S?=
 =?us-ascii?Q?AHAcNi4Ikkov/96tl5KIyAOwVFg5zhMDqwZp4iKqL2lHM0PvkVG2L/nIwFS+?=
 =?us-ascii?Q?6KQpBwx67h8OyWfgf7Ag71zgN1DBlcrj4kMA7ayPJdbe4g7r9X6aQAXN+b0I?=
 =?us-ascii?Q?RKdyLnmWA8am4uv6tx8nz7+k+6mXzGVq2U+/tQuyArzCVL+cGsYpJz48YbGj?=
 =?us-ascii?Q?i4JcPHukw+3AcFI6it7CrFQbqf68qIRaNRI86cFhHTUA9cm2z6lO2yQmHdi0?=
 =?us-ascii?Q?X5W19OYhRtdusKLCEsAhFM0VtBV/POCovpDavpzP8rnz6sk1q60y?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ba5f08e-0cd1-4c39-67c1-08dee6c5e568
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 01:17:56.7073
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VdGeJrok5FLj0VJRXSOotvANLZ2SxbV0hE6FWhf8y6+1S2tGP4Nd16zgeJn7K+8aNE6P8ZVc4jjlxVTGYLofQeLAhIXq3mnwJLe3G8C24mOGXwelbokwrvPuC0t9SB7y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB14135

it is calling snd_soc_component_initialize() / snd_soc_add_component().
We can now use snd_soc_register_component() instead.

It is using container_of() to get dmaengine_pcm from component, but
will not be able to use it when capsuling has done.
We can now use snd_soc_component_to_priv() instead.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 include/sound/dmaengine_pcm.h         |  6 ------
 sound/soc/fsl/fsl_asrc_dma.c          |  4 +++-
 sound/soc/soc-generic-dmaengine-pcm.c | 30 ++++++++++++++-------------
 3 files changed, 19 insertions(+), 21 deletions(-)

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
index 467426d2b5e4e..523674ce1ed27 100644
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
@@ -435,10 +435,15 @@ static const struct snd_dmaengine_pcm_config snd_dmaengine_pcm_default_config =
 int snd_dmaengine_pcm_register(struct device *dev,
 	const struct snd_dmaengine_pcm_config *config, unsigned int flags)
 {
+	struct snd_soc_component *component;
 	const struct snd_soc_component_driver *driver;
 	struct dmaengine_pcm *pcm;
 	int ret;
 
+	component = snd_soc_component_alloc(dev);
+	if (!component)
+		return -ENOMEM;
+
 	pcm = kzalloc_obj(*pcm);
 	if (!pcm)
 		return -ENOMEM;
@@ -449,7 +454,8 @@ int snd_dmaengine_pcm_register(struct device *dev,
 	pcm->flags = flags;
 
 	if (config->name)
-		pcm->component.name = config->name;
+		snd_soc_component_set_name(component, config->name);
+	snd_soc_component_set_priv(component, pcm);
 
 	ret = dmaengine_pcm_request_chan_of(pcm, dev, config);
 	if (ret)
@@ -460,11 +466,7 @@ int snd_dmaengine_pcm_register(struct device *dev,
 	else
 		driver = &dmaengine_pcm_component;
 
-	ret = snd_soc_component_initialize(&pcm->component, driver, dev);
-	if (ret)
-		goto err_free_dma;
-
-	ret = snd_soc_add_component(&pcm->component, NULL, 0);
+	ret = snd_soc_register_component(component, driver, NULL, 0);
 	if (ret)
 		goto err_free_dma;
 
@@ -493,7 +495,7 @@ void snd_dmaengine_pcm_unregister(struct device *dev)
 	if (!component)
 		return;
 
-	pcm = soc_component_to_pcm(component);
+	pcm = snd_soc_component_to_priv(component);
 
 	snd_soc_unregister_component_by_driver(dev, component->driver);
 	dmaengine_pcm_release_chan(pcm);
-- 
2.53.0

