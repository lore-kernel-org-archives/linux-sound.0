Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011060.outbound.protection.outlook.com [40.107.74.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C1237C113
	for <linux-sound@vger.kernel.org>; Mon,  6 Jul 2026 02:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783303373; cv=fail; b=AqiYRc6bH8cE6m00i136pUBB5cMIbQ+YrdhYxW3z0yDSvyx2AbALXJEgn/n4pTWTPt3N5Hr7QdDI7hGU9fZ7RRl3jL57JiiJ03+8H9LjgkLpET/w2dD7NpGI4CMXhKiCCDqUoVIFZQso2OgAtxv+FIHTysYoY2X9E5TdjsYUbhg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783303373; c=relaxed/simple;
	bh=aEIgLtflMFHqtlk1VVnCy7zGhxlpleem8Rgi7CFFycA=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=R/cgngAR/TaMI5M3csJrHV4FyltditwNkwv06AJlCvCM880+CHIHxI64BwZaaJL0hUS6ZjFRPreP7GPyuL91v/u732BD0PfHZMJdcDpsSlD7l0M4zKFFFTnzOWPbm2sVLV8vozwmh6VUTgHK8mwVLtpO/pTuruLdTXJQtAZwmd4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=guplqDuB; arc=fail smtp.client-ip=40.107.74.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="guplqDuB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H8JsYNoYe6keh5EWvaEB0sj7GCkdCA7vTAz9l91X/L1NZwdL34CJiNjRKW3pVnGw5zuwGV7HWSIGuIwF14G0QRsmBe7e6mAMs/YLhjrfVXt4dauzx4e6+LWTaVCk8dv46Sle/27q+22Q1bIUzmJyGGTZfd2ctWf8oQCciDHj8txz7hhUz/u59uG2UNs4B2JhXEHkrDGjFM4oT/iNxTcwue62qdQ+cH294w6/b8EbAn5MzRCvV2iAut11WiVa7BnPQMPzXh682qIYBWZEO2OO9KMutUlGCFSwaARTge/kaL6ZJUKWXFBu96H/zRuI2Ek2RPvFAkpqMqU6H+lDoW0uow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gcmfnBS3EH3c1W9KsY/0IxFi5222mO4wuJJvAqrw1xA=;
 b=kB+R2QmWBkfpvrbFcIMQFcb0Tu9GzaRBGoSWcZeIpBxRK9VJZmJqrBSe8cCyMx9sBaCp+6Gswp04cn7/v/rSwP2jabZAU1dDsOJQCORQJyzp1EacEfQ2TnWeSLzVjnvi1ZT+F+H+eBnQcQgsN2XWocUoaiZ/V7gcSvkFqzhMEx5Kb1YJxSmccSl6zo9C82SMi+z4fnZkpWiqHgwGQQk3I3xXwYbEco9sIzxAE3dvAj7OIvZ9RZehscwrSMIPmvApnt4sNAu6TxQ4aC/+c3CKXTR+bsnJtdX1oOb+46qEnDu6/dLZbUpQGolwU4Lq8olMDWEh3tfjt6a0m08i2YhGmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gcmfnBS3EH3c1W9KsY/0IxFi5222mO4wuJJvAqrw1xA=;
 b=guplqDuB00/WNgakyotpuP0uerjRSFcGz0zW0rva5rcgwMvCKtzRrS0wnVBv9XekMO5me+NpSTOK1EjNKYd3IzCHyHYSaUifSxnfnutASCK0v8nMcZlm75K5LWydtj5aCD9cjJ6q8lCW9Shb+U+bwkgZdWNwCNAYjRYqUQ1OleQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TY4PR01MB14075.jpnprd01.prod.outlook.com (2603:1096:405:20d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Mon, 6 Jul
 2026 02:02:49 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0181.010; Mon, 6 Jul 2026
 02:02:49 +0000
Message-ID: <87mrw4c1tj.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 09/12] ASoC: soc-generic-dmaengine-pcm: use snd_soc_register_component()
To: Bard Liao <yung-chuan.liao@linux.intel.com>,
	bui duc phuc <phucduc.bui@gmail.com>,
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
In-Reply-To: <87zf04c1w5.wl-kuninori.morimoto.gx@renesas.com>
References: <87zf04c1w5.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 6 Jul 2026 02:02:49 +0000
X-ClientProxiedBy: TYCP286CA0057.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b5::20) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TY4PR01MB14075:EE_
X-MS-Office365-Filtering-Correlation-Id: 46c2aff3-9bc2-4153-18d0-08dedb02ae35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|52116014|23010399003|1800799024|38350700014|921020|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	RuT/jmxE3KB1vT7nd9HrwFXMdlLQTXp7Xqqjty37wEYSuJxOBzQJ7MEw2bbJMYwVpie5Gy+//61PEYN32c6lJoxeaWcaVpddSYSV0pQpW+h69dKpeVfSsjaqPzRx9jLGo2N7wAcmM13/T5+YXgJy3fZDr72AxQMXAwrcliVJ+MuOGSnMa4VTs50sVrApiOZlWju4oznq4PMKE1HJ5Vq+vg75XDYZIJySh+8NHLLCMeZfEZWbgAqIjKZ/YH9yUIm9aCyCEKw0pspFlMqU2rErMzvN+fzYN2TfJ18uQtc1mBtAzLwtsaQf+9iW6SiLwtmWQQfX/Mrr+shpzk4GW8YbSzeOg8p2mYN8rvyJTg4REPsDG5wGxbPoJLLCMHUNdw3PeD/d5AzIPFK4qsNV0Opl8sArfRbhSTuPh0GKVY6nUHvjHrPT8WRH0Xp4nSHCoGDcOtUQdNNHbWybWe3Ews4/NKORAQg3K/wHAsHPiCdPIHXST9OYdoy2xY2JBJzo8cjDNTlPN5hPuS7ExsPbrV2RPRvAJr7jehtr5b/SsBD3jHyJJY57NgGkOuk12FUZwYv1rD2sjhfX7zV7BQH/EoVbxidkylCDy6W5v5pDtZaqqk7FDINRysEwUMZ0ivUyf1KBllmzZ41DsHEaBaykGrVSiLZOsha5bASTcpfuSQUTs371wagTjBmOvnTvmFm0dApUx9jUDZa+FKROw2DOJZHIPeeqD8m/lzumaoKmiRs2Y1epM2ryBLgiAE4610BjcfYW
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(23010399003)(1800799024)(38350700014)(921020)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bO/r9k/11TYr/gE0nkfFTqHnYRJ1Sra3p5JhTEoM2PJCc8HDFkXmuSdNMDFR?=
 =?us-ascii?Q?yljJ+2id4Dkva7AvSdNQTtkdsr+jlEeGYKcT+stJHVnI0SxOF+xqVRR7ByMh?=
 =?us-ascii?Q?cmyyXiuG3g74x8h8Q8Jt37XWFApHQStqZZGAx9L6zB4rO1E0TOgAGYcesxY6?=
 =?us-ascii?Q?miXR8TEClOPPe9e5qKI5iO0SO49VGd+T1gCxHmwaSmVqwn3fsyiONnKaGHdt?=
 =?us-ascii?Q?37sU3R6AUeTuNe2+fLv2/1aica3oA2lXVzDzrvEGW3bpCoLzOSpdT8JriQGx?=
 =?us-ascii?Q?8Qf2iWKC4727UeGas01hioFO/VlAcS9XzsrG8RBgEoOvIKTBZ+dTNi/QMOrK?=
 =?us-ascii?Q?alFVJ1uAWgBIYKLU2tq3VczRik2WGmRF0j6sjxPGNyWHc6dpc7xog06iie8V?=
 =?us-ascii?Q?zGPZk5QgKLwVsVL/TN5/wRVAXukdlElBkKrMLboRbwKbIf4CHIoKtBwGTEmP?=
 =?us-ascii?Q?qYUCEFMSq7lwwYM1Js2wduRhf2y2z8WtaKjpr6wlw/YRtJ9S6jzGuotqpUrH?=
 =?us-ascii?Q?Wy+cZcnizRwq/exSvWvmE6eD3RzB07ybWRCCE+lUDohfzbfHBU6GZumSC3KT?=
 =?us-ascii?Q?EXU2AxNEBnvBVhPonceDo4Yxb8oLkKDQqXzG7o+30MUB+Up7PGJvkzf61MDU?=
 =?us-ascii?Q?U1pDI/Pgx1RqiZpOl2o3L+WkaGaBb8662Ntn1VRidpIzC4DWjXZYROWXs4Kx?=
 =?us-ascii?Q?yGc/4POGI61x/6ReEqGu7WXOlmuLHlyLfqoA3qqBJO4HLDyZZUgxmJ6xa6w+?=
 =?us-ascii?Q?SBtfHsm6BSNPRvkh/gDyf8+GLKTKplNWg8PDcgb1X91kivG51RWMST0YUAH5?=
 =?us-ascii?Q?tviFri/IlIAhYCFOYggnuv2PoL+lONQ4A6oRCf1c3ruYWb2FFoqQi3MC3+Xg?=
 =?us-ascii?Q?M4XLq6/yy5RXMVKlEOHcp4R/Kj13ZsvByJ0+h6SX6RjTWxb3PkggjGf9o+pd?=
 =?us-ascii?Q?R2IjAGNrSHoajvego8b5ObF+MU9ocq2XWrpBVptMJxs6wgrpgGUoAY+fOxv7?=
 =?us-ascii?Q?zgny7+V6hA2RQwgaVmyElFgXO1m71FV41qRkoO1S6PEqnER2B4zIxoChp/Ih?=
 =?us-ascii?Q?iAQhoOHyjsPxun3qaWH5gSyKB98n5C4qDhNixGxq78s2Pbjgaf2BvM6r6nzv?=
 =?us-ascii?Q?UDhIJprC99USXFPMawORWSPxO2fzdSL/XqOTnr0pKzVOVE1qjiRJ3giwfi5V?=
 =?us-ascii?Q?XBj69uzY6LAFixhUKNtqbR2YwahGHZKTc76yti0bhplu8/K+UenFLcmKnEDM?=
 =?us-ascii?Q?KC3MlnY4pFiSb+N4dWpeviksF0hKyntftK0wS3jNyua8PziWZ1IBNSshp0Ol?=
 =?us-ascii?Q?BEVokomDC8O4waNvYaqLdQ7xeaw4WtatT6xl2HAoyfe76rnGkDiA51D7a5mh?=
 =?us-ascii?Q?pzfUd6rT/dZ9RDzGYBwHoNNQflZpl4QXV5sb6GwDuol4F5PpeJzDsrJPjDO1?=
 =?us-ascii?Q?JKtlE4fzMW5hczO1Gks3skKHLyseHEGWhacPqfhJX+HnoxmKzpmnxUlWUF22?=
 =?us-ascii?Q?F6GFjd7kXVBnHyfCxdSzEY7gHyOhOt/FbJYNBRLL2T7MjoASqCCTa6PcL78F?=
 =?us-ascii?Q?eK+qiw9THotVMRi79aV7PacsEFrKiZNKoHrewFH9iP5C8l1OU2eshQPTuSmf?=
 =?us-ascii?Q?JlFArr6Cc+gqws6LOHhs8lLvr6xkiaj1oXVUx2hWGSu8sJYvyQ89A7vz9a65?=
 =?us-ascii?Q?smFR5fUgQKv4p32ATDp2cUCxidSnDy6fiEUDgWy+C6hcSVhjRoeDlJiP0Lpl?=
 =?us-ascii?Q?pedm2BFuYVei5YH1SRN62XibNZ4YF2c4TzcYZTxSMkLihhrB5pA5?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46c2aff3-9bc2-4153-18d0-08dedb02ae35
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 02:02:49.4113
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c7OD/3c4wJQGHj42THvBWvvV2vElc+OkBSCuEFr7qHlWWP54YDrxMSkh5e+/4qOoSvteMUwDneI+93jDAGmAozKaldJCWOFqB7DlYwiWfgtZsVhpDtGC2fed7bojYxIK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB14075

it is calling snd_soc_component_initialize() / snd_soc_add_component().
We can now use snd_soc_register_component() instead.

It is using container_of() to get dmaengine_pcm from component, but
will not be able to use it when capsuling has done.
We can now use snd_soc_component_to_priv() instead.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
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

