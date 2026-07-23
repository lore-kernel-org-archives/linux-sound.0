Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010007.outbound.protection.outlook.com [52.101.229.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CEBE3C8C77
	for <linux-sound@vger.kernel.org>; Thu, 23 Jul 2026 06:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784788495; cv=fail; b=n+OrO1ZijAQ3Yz1X7MmHo7JMn7EDkR8vMrwhftm2lNUWNX8gag+HvnhOiPZ7r4hMNBMnuLhsKV1v59RfjCptUSws3U33/H7GvZ0xTL3+u1BmVhkNJOu18hI2Zl6f5XOy7OEDZiCSlVve1rWpxLYkmCZj8h1syMI6RJYyDFeeSxo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784788495; c=relaxed/simple;
	bh=K6hRFVYQf4zRTMVfdwf4xUZ4wJRfpEsXICml5U9b5+8=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=IztyN7Aci8oPDGFb2ZwLIod/8QXXkMA6h6mteaQyJtQ/kq4JnvKkQMLbJZe/cXyG/EGzB9ingkwEjze4TfqxWI/kQjdf3syvVJ7YVLPAp9IT+D9lJvYxcMUASrnikxnhtHHY2XsZnxSVCguk6v5BQyKM/a4/FnZun0ebvRq2yTc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=gbbnqRgu; arc=fail smtp.client-ip=52.101.229.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="gbbnqRgu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pCJYaiaazC5zOevjuayvwxWjX8PYe8sc5nfzYHSejFBU+ikV4YwfsIT6KKRfBDAg5IZYLpuE8tYl41LtyfjYrc8gMBzUo9JE4phMl3aYesGagfrzz5mbc+/uKGfVppyAmWYP94WvMXkpQFQ3LabVknGfD4GITOQtAGIMfEFrS/Ef7KSUbdoUCVD3Y6p1+OqFo0xw9HETb4XdmTWywBnBJfNzXSKhKhStzhsk6mMG09UKrdJMf2WaAB3npnaQGlvr9Awrr6v++CWMWwyAsNJ/hzE9dcZkoFWXPQuq72uPIi7Y55LTE5OlxdUglNT9H7fVNBst2pxoqygT0CmC6HWNig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bdGrvPwP161jWETly7BtnCMOWjsALxTiU4ifIcZNeE0=;
 b=TiVP6qZl8ECA3oEDb355SdG74K2igl7DREqBg/u5iMIf0EYQ0FVMzfKY7emwsnUOxtJeUgxiaxKB40Kr+vby+ZZ1qzZjuDBXLZ6aohYZmKVRenVbDEctb2u4bfVlahvjn8RuBfXtahoM4h2LUj1BgEJaIpwO5IIfyO+tWGl4CuQAUmPoy1vaGfT57nk8syNewNjMtISoGaWYHVdr+HmEsLIXxw97YOWbNXnKM+T4t4Mawi7Z1RZRlNwOj4aAVljb44xtO3gQ59wLGfOGICkqWXJy0JqyIl4fszZ0TEe0TpVWGTdhBnlp75wM8jefXuJwo/uDmY3pB+MCTV+jfm3zrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bdGrvPwP161jWETly7BtnCMOWjsALxTiU4ifIcZNeE0=;
 b=gbbnqRgultQ+sY4H28ulIqUJB+b3BlAOrfwyePGUoSNTAVrkIYETMLCLuLF4W9e/JcnD/E/oynGTjXqw75sK67tcCqKqLV65fIEgjv4Xc/J2MFrDZmfkqGEXT/MIF1ifwiamGdjfaTqfk8Fn5XF1lC34jEiExnuEB4j3WHHwRgE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OS7PR01MB15042.jpnprd01.prod.outlook.com (2603:1096:604:38c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 06:34:50 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0245.009; Thu, 23 Jul 2026
 06:34:50 +0000
Message-ID: <87ldb2rz79.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v5 09/12] ASoC: soc-generic-dmaengine-pcm: use snd_soc_register_component()
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
In-Reply-To: <87y0f2rz8l.wl-kuninori.morimoto.gx@renesas.com>
References: <87y0f2rz8l.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 23 Jul 2026 06:34:50 +0000
X-ClientProxiedBy: TY4P286CA0007.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:26d::16) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OS7PR01MB15042:EE_
X-MS-Office365-Filtering-Correlation-Id: fe9be441-5c4b-48a0-f34d-08dee8847f5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|52116014|376014|7416014|921020|38350700014|11063799006|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	MTWnQvUY4/zQW3I2jJSqoYImNHlvI+mHYsi+BQDLgseYAZITUoHerXmiXP7S8LEvBnjuxREup0GNZPL1f3Nf+cRAZkapxFPfHwQ09hiob6cfKy+6j67RE1CzfYINO8IB7ei4rT/Nt/hT6h2PJ4gs9ASKDNuXjf2wQCFNGUNhWK0chhEGPIBAJX98ELSVnRtmaKGIts8pc8t8TfY8aVsFjGJH4kdhEyK3p87G36bgihoonVwhHw9iiLdwWagLOjnHoMx183ztMhB9Lse/hX+0qFIkd0L2ANfjcOetgEdILX0SXAFYkWLRAHtAaMz2PO1EDjLV8Se9gPZxUdpG/O+vat9+VwqijpSLZcdVuoZZ9keFBfo/jELqhKJL+Q5L5X4qEA9qO8RWq/uII9fw9y/8xBvkhcwRpgToNrYttmtg7N/TK6Wam9vPMi+KkTyAuoLcb7mQ8EDwjjPgkYjO2igW5wUEPkUpquNhaBStbKTQfjeutuMy5T28tspz8RgLBTnqrUv4AXA2Ru5ofYpQhA/QwjW1L0Z7NbhXwv5P4oz6oja9C7SfER0p637gGj7z6OsfMBrgxPTsDDQx9q31gNEfmLgbduSwFBLq7FY9XdFMQ0qMwcuIl+7o6lls0w+KGKmmr+bi9nJpOknFD/Sd9+lkQMwePXKpA6VD4/CdAGZ2ldM0Or3h9L5dxq3hi55QD/o1BshA7kvz75XRWfzhdG3BArYiqpcHjmrbNgU0hRNariyG7j6hzM1FyHImPElmB+6A
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(52116014)(376014)(7416014)(921020)(38350700014)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?L+QL3kxrUCbUCljPiyr7eEnJPvhN3U0gqL7ezfk3gsnMZa7Hv8HjIFXQOdnE?=
 =?us-ascii?Q?T1ypmIh09GFnkiEskWWPMORaGaDq/Au+F7sit4KSDRGMyoYTxDnVayoX9Ain?=
 =?us-ascii?Q?68eNDDn9iUJeRvx9Xw7Tmi1WfchmXmKFB/8bo9JEbJap0AXfaJ9eIuBw5VBp?=
 =?us-ascii?Q?6CULMYpNcMd5I5eZzwbDXiEH4XVWtWvOWqPM+MDc43I3L/rxfqypq0+nsZxQ?=
 =?us-ascii?Q?6oqcLg6q2rLaAHj+8CuSFg8BcwfZ+u4XQ4POBpI0ZPSIJ96W/hUT3G3SlSPw?=
 =?us-ascii?Q?7i53A2K3k4aBzGxUlmszyV08UFFk5WA0d/S7hrR2X9aZhhkdAMQWXcdiYl2A?=
 =?us-ascii?Q?FRAyZ+7syDsnqvLvjsC8HKOLL5YUUAdrSSIHj6cWW9CRVkOr6eMRumFLr4gq?=
 =?us-ascii?Q?nkLYvmgf+rwTNF9LQS8qgqbO+E9TU8/gBhNjiCgafZrMx/2E97NIZCyoBDhS?=
 =?us-ascii?Q?MNbGubJv8NF2/2OvYCAxclkXLTQT4yDic8s9ZGvAVHKdU81+qLIHCfoR3hRp?=
 =?us-ascii?Q?CDR2kmKv2Huvmnix+sTpVJi1UAA3bbo5aVG7dD2J8r7C0tfsajpSwqSqGAQT?=
 =?us-ascii?Q?T73zdA6D4Hi6lhxyiNe9OnhZunSCySrXqW/2/s80BBMqPG4jfR/d622x2jzL?=
 =?us-ascii?Q?4SMJwWPxRsjgkwN8R6C2H5CMtipaPsuiiESoxJ1dXVIz82qD4KAa60STxg7B?=
 =?us-ascii?Q?jOsK8svFUIbN9IhUAAGsspDM0GFoTdKYmjLU8TYPdUXfkhATMoL1YWXhoJMy?=
 =?us-ascii?Q?n2RopvX/tOwxCd6BrqNfYJSLYSV6VQQHEXroGEKKoRtOYAJK4or/Y+/Uqupa?=
 =?us-ascii?Q?2DmvXaZwivl8tGHvTWdV5yKqQLlePmvDdnG0yiM4Aq0gUMOW24JbPXKS0BTm?=
 =?us-ascii?Q?ydYcq0ytVKCQSZSZDidU0LoEM5ErIQjAkUD+m/kNDUoLi7/27RIC6XshG4RZ?=
 =?us-ascii?Q?5AYdxnXaHbkaQbUHW7qSLwEYKj8SechB2vo9T28dqdnpqacBkxOAMQhu+jCQ?=
 =?us-ascii?Q?OwKEKmWZWvSYkFwdco376vBxMrZmKJEDpsynpMXuV7e9f/y1Xnb4BAswDCxm?=
 =?us-ascii?Q?LQLZv3DsVt9sZGKCv5KaD2Z1mSJHlXkHpvbH0wY2ZsStb8y284OqbyoxuvY+?=
 =?us-ascii?Q?mvSXnn6tf9k1sD9smi7K/K/CY3opZTExmZxggaO9pEdd2+xzVq7Xccosl4Pt?=
 =?us-ascii?Q?oqipakLeTKA4p7enBY5qssWcbL5UQoPA6LQwu96cNY648s49qkFF5nmuJrwL?=
 =?us-ascii?Q?QCogUTGMf6GvkNaFlYNvZJ2TyA8ZO9JkshhpOd5u8IUggtk+i/PkEwVO0J/O?=
 =?us-ascii?Q?o0neWjzQm05QwsQHP8fa4+EgZUH7k/11rJ1NE8QmmG8VQdRj40RPwPnNGebK?=
 =?us-ascii?Q?Mtp+cJxMjRzUDxwbePc92zW6MctpQIahnybSV4QjKc2vHzrobY/0DLZ8mPQE?=
 =?us-ascii?Q?RDvDRqayeg/hQ1Wt4LNf1wPZn8HRWaSgRjSODoDEAHnutRCF7SxGCCPorZTQ?=
 =?us-ascii?Q?CKxkJ1rVSbbZCDSOl8mG1cKgIqX5VEkw3AmOumw79DR/AzvEAT0yTH8sQL9+?=
 =?us-ascii?Q?tnEABJLQiLiTy7SPNb6Rvz0mWuClTXXEPTphuD7DLwEpo3DHAUtAVM2NgRRV?=
 =?us-ascii?Q?vAo/LaTjzOuW6ytdzMrqpvkpxYzl5e14BaiaQZb4kDkfTvvQBBd4jJQGNvsn?=
 =?us-ascii?Q?5D+E31m/rEWHzmFbcUAr1X/m6FqyxtJotnqnfZNa167asRyymAzGDXohOXvt?=
 =?us-ascii?Q?c/3pYZhBFqpxZZi6hAWonZEwnuMBjUTB+Ob0l2W3lsuGYvgrn7WJ?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe9be441-5c4b-48a0-f34d-08dee8847f5c
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 06:34:50.4453
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CqWvsB0cQ/F3Z78+m3KDcC8u4EV09rzbD3bBZ/HQK1iffaCRuWLcw0/Trz+XY7Yz/A10usDp2WHaI95ixhCP740KAxz1EhcAcovUq3Xy7peGyn9YGzvJFHlFSEM63OQ9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB15042

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

