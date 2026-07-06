Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011001.outbound.protection.outlook.com [40.107.74.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45D1737BE95
	for <linux-sound@vger.kernel.org>; Mon,  6 Jul 2026 02:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783303362; cv=fail; b=bSM/G8urZnjOHqmIsQQPmPseQRYevRL129OX7XP+6B+7wGZYhL3Ad1VjI2EESf32nVJcOkxnY7B+aTsAkL3c6IkLY3mvF2X88PDV9FQi+cOGiM8WLSxUTFvsbb6aKfJrX97BEF2xQ3eIzFCVb9DLlSweGwprf9/DPqEnhW63DQ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783303362; c=relaxed/simple;
	bh=zUNe10yjP65iTe3INUqXhCCGJpOauYdVSYJfnWz6O7Q=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=juiwL7P729BXw+N+QOJOdh57srps/e5PpaTCoM2apKQAE1NpAScCq10svbw6PlkoCOmp7N4OTbuhHsLPkSuPdmDVbnXm3XPUdtUIAJP85SvQrmL2kksU0ow7HceHhiqmZv7xNwINyMmMJaBG6YSfJJYracr85cL/6wxFtf6nsNA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=NuoyY2DA; arc=fail smtp.client-ip=40.107.74.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="NuoyY2DA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u6jN1/IKCOw64c8uTyBseLccBBHbEvjX/yy+BS/4u9KWIB+SqgsEBv1DDvXt1nrEyu5MIhdJAxketvBLxbMLF9Z2ZWLwP5TeDXCsGqC2Z64dDwBFMnXkU+/DfHQdEbO+tHXUO02skkdnIsia50INsI7otj3Y6ZIdj5U4r0ihfZY0rs9aHsV+Q0DgP7ly2yeu0CX9cl/LYDGDh0kBXuTlfbkPIv40st5xXUkXnQy1/g5Cwk+K7rNVrA1wrHIMkgLeoUS/HTZMbKRkwKexhnDwqlgqu0d/kzhsdgoL1IemZiSzPGUaZCk+zT9jMsQeuTOPRehpHBesvJj9Y2PlOQxTug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gmEdz0V4Q+pBMZBYwjEhlUohwkq5kjO7Ar+/3vffbng=;
 b=T77vWqp9UDptvL422EdmnrEn6nvgHQq/Hy4z0cqe4rEXhdlaT4htjQeUKeumCmVHVeVFCRB9Nb2fwmlmC1ulG7p5Mu9CodmvrsCK8Hs3aVjWRUYVgRixIFZeMRWLq/4ZbIG9WkuvCPPhiRofP7jZfTxl5aa/aYcTqyu44ioKS/oFffPhltpQ5fMNJWLOwi0hq4ScqLioJv/pqjCmKXSvGqfchx+IayPx5u09RUcza9tdfBQKUT15nfLe2wPLMlsDKb8NT9+OSbtGPV01LNZYX1vL5WRVcGd8Qcth1nhedJRDVmafuql3/ZhNE6LFC1WfeP95UZskHi7pxkaKy7/Yvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gmEdz0V4Q+pBMZBYwjEhlUohwkq5kjO7Ar+/3vffbng=;
 b=NuoyY2DAKEFhDmQdO2VqSm02S9pwX7y3IwaChlTHKQUtCf3UA1zd5iLd975H/ObKnqe7emNjmsKV4Lz5G2ZwpdJ2HdPCOpWEWYOiMY1aQlprfVmINflp2zgtjI6o+dbjxUlRiFfjTkRYQHM7rb2P4SwjzE6WloHCVzLAHmxdSoM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TY4PR01MB14075.jpnprd01.prod.outlook.com (2603:1096:405:20d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Mon, 6 Jul
 2026 02:02:39 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0181.010; Mon, 6 Jul 2026
 02:02:38 +0000
Message-ID: <87qzlgc1tu.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 06/12] ASoC: intel: avs: use snd_soc_register_component()
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
Date: Mon, 6 Jul 2026 02:02:38 +0000
X-ClientProxiedBy: TY6P301CA0008.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:3be::16) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TY4PR01MB14075:EE_
X-MS-Office365-Filtering-Correlation-Id: 32104212-9a3a-473f-1f21-08dedb02a79b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|52116014|23010399003|1800799024|38350700014|921020|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	PbubGykdZiyAMvl3Tn07DjcOITxHnVTPWTif/0YeUei3G+tMDv9jvA/+pYhAzwuxG3gJdyWku1FhymIejZlo25SzJW/2SoU9gvR9g6qg3Gmh7pTJbgsRdcMKjK7RxqwqUD1hRzMbPHMYbyG+fVyPRMMG77g0b1KkfLCjy8apLN+twBvyly3oifdElnpd0RnjLlFPvHavELFOmGPMcYtZySmrLa2wx3RHuZ+HaVqBA6LaDvXq8JNwE6Gb9o8ITu3o1XvkkuWGnpcK1kjMI0t9fLJtZTyoWkk8suKqwdXiWttywGze8Toq9J7wghbPDDeo4Mns7+L2fSfiOlU1rO8FEG5kP/5KM8omRxrrXA2RL8gqiZ8ptyhT2An9a/HBbrAE2CyjYJ2BXBHtu+K9eipW8aIvUib2uBqW0vNm1rzFhBQC4cZzk94UZPrBMf5F0jVZYe9zG/dEqOwH7RmjNvVFTXLKicZrfiDYXZVfcMRjYLzP6xtCoSxQr+QiiB7b0ckAZptpac1fg61qrI9AUM7ESRLatSJZgKsHz85LZ6VXbIvo6cwBZVndJGvExGa9mjjkqnxxqUL7Re2YIPrh00+g+yM0lFJQftgzV1rMfpRDQHW11K2kbi62Q9+VaFpjMvCxG0JUEzvAI7juRXeIezWIwj+tbc+ObIMSf5jG1xp/KcG2CUDzqt19BeEZyrPhU6wMrWrF9dFVAbq9AMsBBbbv1cQcFlEtta9BqpUmGMTRwTA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(23010399003)(1800799024)(38350700014)(921020)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?K/YBQ1uvuJ8DNP8QPfLYAH8dP9/wjHah+7/1GTkgcstNK+TQBud9S4iuc1wE?=
 =?us-ascii?Q?wASseq0dKHwN5Z3hCsZX5xc3jQ4pEE11BYov7oZJKcb0zUk+fQcLpJXz/IMM?=
 =?us-ascii?Q?6FQo/ht97VRsP5bXmvrmR8fbb/t0FzvDsgTZK5oN7KaSkdiApNRFQLMGgswR?=
 =?us-ascii?Q?90IeDU7s714FvqJr5amBsOkFudLkmuX/+9Z3LHweTvrqxNb22t7KCf1mwapb?=
 =?us-ascii?Q?/gTGFCi5xwhdTjh/cjzkbslPk3FL1YBgYw5/Un1pS0TlNWAiQO49Zi1v/Rvg?=
 =?us-ascii?Q?EsH0lNgt97GBaSw+9RrCfEn3jqPMHXlSC6XFYBVCbsDGQzsK0UCarbLPE44K?=
 =?us-ascii?Q?3664FwNDA7bJQZq+ItB+6rIhnpUUvP4db3QkSFT7uGwn4Ffavaxgg2AlbqA4?=
 =?us-ascii?Q?7a4xjHeq1zNYhknofA6CjIJ+VfLT/IV/iw5ycuGny+RT8QVDhCYKiYDhhCGL?=
 =?us-ascii?Q?4s9ma2lq7NwVkCXj30Hid7sTffk7emuh1spbORdYMcI41oizEEW/9BC6lTbV?=
 =?us-ascii?Q?gpGrgCqtSgzSwCpFBG6vlsnJCKwqFcxghRgp/p0hzLRyOoylIjp+jKh25aJr?=
 =?us-ascii?Q?wGvJDVJwYvN9whibiiU/MiDzNn88hBSaLqUulVmTshVoUohABvw1auoYcqdP?=
 =?us-ascii?Q?jHFPEPKxCKajqeVu08ciI0h70o19yArJqsj8WzPWHK9BQ0RCNTIyrLz43AFa?=
 =?us-ascii?Q?n9zwCzipbIsyClVfveDw6qSQNlUDpNxj6HfRBmuxIYrwZV4GX+bSag3u/Hfl?=
 =?us-ascii?Q?1GWUJI4A68tUX8yZj0igygcRl7ZFafLCK/qV85SP4zd6Z4l5BvX7bHFAhZ3m?=
 =?us-ascii?Q?5LX7wGaNrZMawO0uLM8TrOR7y/I7QW1tFwVwWvluiq1Cm5m003GJvvyL7L/l?=
 =?us-ascii?Q?mmBUTaan7yUtzE63FCl3R/f5ptc0nG48LljK6/q+HtJOB3olSZGvEDBoBElN?=
 =?us-ascii?Q?5LyfFNkcMU1tAU+X7KxCMxEn2jCBKKBn1lbLcs5fzHuYP8t9YPY94k3npZNA?=
 =?us-ascii?Q?5M6MLXreuOuykjWxCwRnyCfI6kGD9hKtmDX/J/9Z6Xn+BdqMTRpu71VBLNWu?=
 =?us-ascii?Q?5qlRqnpMBV7RGeB24doriqmlTVdtrfwKHLvJtWgqD9/UNgFzEphuKilYABMw?=
 =?us-ascii?Q?mlt8cmTNakWdycsJhSZs3MbW//S2QJXgWi1LPvVMa6jRFHZMVTrfDHMMO+ek?=
 =?us-ascii?Q?r3yO3lrkRr8Fp59lAUYph+lMukKGLF2ggtBjf83XQSDVydupzD3cqVk5rOnX?=
 =?us-ascii?Q?3i01bQtM6H2Iv80m644HZomVfgLUk48KIzH810KQdyHFGG1xD7zQBFBv77wj?=
 =?us-ascii?Q?OdjM3iynY/KY+WYUoZAoozezHM9Us5EeMN5RGrXftBalZ8BByczfBoB+DJCV?=
 =?us-ascii?Q?scgQHizBRjBPZZDW/aJxlZS/PjCBLz2WZe2ZLsSYwN+H3CXLD1c4Dq79dioi?=
 =?us-ascii?Q?Enph3ymumTNntXlY+2ZXg+9W4b2VpuRwZ/Aw3w7hrC8WDbjBaSx1GqHIlD1F?=
 =?us-ascii?Q?mxR2+G2H8a0KnSqYhp5ZD7BMTq4FEKQDkj9JNMEgDwfHo7/pTM9Fc2l4icua?=
 =?us-ascii?Q?uzc6GXZE6bJQvpqAsCqtI1I5wEMyUd2N5FqprNoriESqo1UVIUTDAYik+VoY?=
 =?us-ascii?Q?0mKrZy8rl2Nbc5/8Qe6CNgzWAFzYUJI8meRNWTnwhRcA9q+9tlMTtiBCyJIy?=
 =?us-ascii?Q?apEwEpwBzwBc9tPGDvsNwZjJsT3I15pQ4F0p1s1hbBjQ/ng+ZnObtUtLwKw7?=
 =?us-ascii?Q?tqWiOyXZstScTMipzk39GkoUyaLCBHRRMqxqrPMznfsUPClFZZ1G?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32104212-9a3a-473f-1f21-08dedb02a79b
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 02:02:38.2825
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TH24GZKnXujNy7D5vuEyB5oIYJLYdTy70aDjlv7RFDDDouC5hzQnvfRHvzdLbUWlorAqCIBCEeGxcfUxa8PkGt6ryWFWyUpr462WbjLJ0OZB68h5U0Jt4Rr7CM9wdSJV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB14075

It is calling snd_soc_component_initialize() / snd_soc_add_component().
We can now use snd_soc_register_component() instead.

It is using container_of() to get avs_soc_component from component, but
will not be able to use it when capsuling has done.
We can now use snd_soc_component_to_priv() instead.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/intel/avs/avs.h |  5 ++---
 sound/soc/intel/avs/ipc.c |  2 +-
 sound/soc/intel/avs/pcm.c | 18 +++++++++++++-----
 3 files changed, 16 insertions(+), 9 deletions(-)

diff --git a/sound/soc/intel/avs/avs.h b/sound/soc/intel/avs/avs.h
index 0f8ddd0e9e5f1..b4f9d66d55ad7 100644
--- a/sound/soc/intel/avs/avs.h
+++ b/sound/soc/intel/avs/avs.h
@@ -336,14 +336,13 @@ int avs_icl_load_basefw(struct avs_dev *adev, struct firmware *fw);
 /* Soc component members */
 
 struct avs_soc_component {
-	struct snd_soc_component base;
+	struct snd_soc_component *base;
 	struct avs_tplg *tplg;
 
 	struct list_head node;
 };
 
-#define to_avs_soc_component(comp) \
-	container_of(comp, struct avs_soc_component, base)
+#define to_avs_soc_component(comp) snd_soc_component_to_priv(comp)
 
 extern const struct snd_soc_dai_ops avs_dai_fe_ops;
 
diff --git a/sound/soc/intel/avs/ipc.c b/sound/soc/intel/avs/ipc.c
index 71e7997e52c2f..39b0de9831da1 100644
--- a/sound/soc/intel/avs/ipc.c
+++ b/sound/soc/intel/avs/ipc.c
@@ -106,7 +106,7 @@ static void avs_dsp_recovery(struct avs_dev *adev)
 			struct snd_soc_pcm_runtime *rtd;
 			struct snd_soc_card *card;
 
-			card = acomp->base.card;
+			card = acomp->base->card;
 			if (!card)
 				continue;
 
diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
index 797b9c9163b49..aca52f5dac2d4 100644
--- a/sound/soc/intel/avs/pcm.c
+++ b/sound/soc/intel/avs/pcm.c
@@ -958,7 +958,7 @@ static const struct file_operations topology_name_fops = {
 static int avs_component_load_libraries(struct avs_soc_component *acomp)
 {
 	struct avs_tplg *tplg = acomp->tplg;
-	struct avs_dev *adev = to_avs_dev(acomp->base.dev);
+	struct avs_dev *adev = to_avs_dev(acomp->base->dev);
 	int ret;
 
 	if (!tplg->num_libs)
@@ -1387,25 +1387,33 @@ int avs_register_component(struct device *dev, const char *name,
 			   struct snd_soc_dai_driver *cpu_dais, int num_cpu_dais)
 {
 	struct avs_soc_component *acomp;
+	const char *comp_name;
 	int ret;
 
 	acomp = devm_kzalloc(dev, sizeof(*acomp), GFP_KERNEL);
 	if (!acomp)
 		return -ENOMEM;
 
-	acomp->base.name = devm_kstrdup(dev, name, GFP_KERNEL);
-	if (!acomp->base.name)
+	acomp->base = snd_soc_component_alloc(dev);
+	if (acomp->base)
+		return -ENOMEM;
+
+	comp_name = devm_kstrdup(dev, name, GFP_KERNEL);
+	if (!comp_name)
 		return -ENOMEM;
 
 	INIT_LIST_HEAD(&acomp->node);
 
 	drv->use_dai_pcm_id = !obsolete_card_names;
 
-	ret = snd_soc_component_initialize(&acomp->base, drv, dev);
+	snd_soc_component_set_name(acomp->base, comp_name);
+	snd_soc_component_set_priv(acomp->base, acomp);
+
+	ret = snd_soc_register_component(acomp->base, drv, cpu_dais, num_cpu_dais);
 	if (ret < 0)
 		return ret;
 
-	return snd_soc_add_component(&acomp->base, cpu_dais, num_cpu_dais);
+	return 0;
 }
 
 static struct snd_soc_dai_driver dmic_cpu_dais[] = {
-- 
2.53.0

