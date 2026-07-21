Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010002.outbound.protection.outlook.com [52.101.229.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584482641C6
	for <linux-sound@vger.kernel.org>; Tue, 21 Jul 2026 01:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784596661; cv=fail; b=QujApCMTTz2XEjSCuUtpRq2FTH68lDMvTuS+3RzU6/er/k3LUXQ+p8Vvyc1E/ceafgBe6NRHEzib7jqd5s3u/stiQjMvoJ1XQpmh+U87c1ccybYIbr1rfg4LxtbyXJBA7aKa+SdSJFDhXg4LpRvwbe/Nqb/ciFQ4LCHLJLlHdRs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784596661; c=relaxed/simple;
	bh=nS1+mIxL3akuiRV9kCHulwbSVZrcx5yI5pM77PQ3hUE=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=BYw5qeDiK9iA2Tkl6ujbJz5cjvzp0B2voOZCfvP5qpvgi+N28HHcbkG3PfHZ/BI0gC4OCvM1GUAYSz6KbYglj9LOE1+oqHmzXW7XBP6tk3Uugbpmz8EtgsggbnuqOKcmu5mgO17GX2uuYhL1UcGdYoCK7SwP2pNR6Vg+3ExNa00=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=lrOiDBrK; arc=fail smtp.client-ip=52.101.229.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="lrOiDBrK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EdifskBhu7ZPqAHAStkQR7sTY9R99x7gnwpSs+Dpy5QoAw1ispgheH45VRZyoZXZNlJNX2MPfqXkq51ehYEGxkGzQUfxRN8wuBQsMXcOXmu+55w+5N+fhxXM6xbnZtnNHHIeHfsZWIMUaJMKkMhRzUNcKEAGw66FFYvyQ8OFS8RNCO3+dfk8tLZvFpV4D+tkW0GiIuyhh129d7llqU3mTwrSBoQhnlaoNHMQcZdcVWf6CxBegMtI6x0hTOmmjhZka3st19mcYVb1yIVUIkqhIg2JfWJ+XhoiFOBu7/wu7JEB3mtHp99BCtVXO3cGYXfpE5HnTAS62mhoguE9ndGrBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YiLXnpP0dFHwec91SrWyM/p/d0y9JXXK8XdD7Bht8to=;
 b=L8+D+wjzHpEKh8DK7HfWcGcQQsw4223Jmnju646/FuLUAZ5a5Mb+7qjlwKcndNPajRy/7+tIGBxTb/cH0XsyR3OTFIZzjx8q1uxvJ7bd8fzpY0xZu+Rq9vQ33vDvNFHbXY/sf3cdYt8Z5lxwveA7/rovtHSNlBIMO2gE0Qx2xBX04gbfEfOZhacbV5UEYbk2l4XSLMEytPz7Y3OzxIpBxtgoaiCiMiH99JrVmectV41RwdMqhM/a6tvah0SpF8COcOsQkLjD69uVMe085zEFPiCBPssUcTX+wwqZtogQ5sbvUpVR3cRiDG7ho0c59ABFnSsnwsIF1StLtko3vgTYkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YiLXnpP0dFHwec91SrWyM/p/d0y9JXXK8XdD7Bht8to=;
 b=lrOiDBrKG7z9hy+nTgnSQe1dfs/FbHg+dgSZa8lFmF9g6e9Q9jlt2zKsX2l8G3NYkliHdCltqHs/eLMzWI3YELHaa4JmqcgA6tLZqzhwJr+HsYePadi3Zjqmt3rrn8z3Nw9hceeVwDV5VoMqGySRReRWO6WIkcu3ixEJ+xkiqH8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYCPR01MB10810.jpnprd01.prod.outlook.com (2603:1096:400:297::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 01:17:37 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 01:17:37 +0000
Message-ID: <87jyqpjg3z.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v4 05/12] ASoC: soc-component: add snd_soc_component_{set/to}_priv()
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
Date: Tue, 21 Jul 2026 01:17:37 +0000
X-ClientProxiedBy: TY4P286CA0098.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:369::6) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYCPR01MB10810:EE_
X-MS-Office365-Filtering-Correlation-Id: 4986e501-e76e-414e-89db-08dee6c5d9dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|52116014|376014|7416014|366016|921020|38350700014|22082099003|18002099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	eIqf7iix3zfkE/vJTCdZyyQzAEPEHH8N3QvVvgkRzj95KlW2hpi/iTBr1Xqaz8zdlG9RyG8RqAAVmAk/puyiwQ1BAb1BR8dTw3Rdj7020+84HqHKEgmRQmvi/DSLvVmL1reIzrpry1py80i/PLT66w+1JZU5Kioz5Lwp459wrttLVYsVtiDQvlYMMeDmNsDqeb922yrSNg9ugG5mjpER/mhw4U3Nbu78PIYUef+3hOOium1Ri7E6pmDXV2chBq8xT51FuydDvK+70F9ZljJLYaWq8xkoSjoqwbdp/zf0aNYpPPcwSGzODh9YXPjBwt0vWecjNQ4Zfps4k7+uBG+XUPrjIKlv8ZQpTPgXqBESBSHKyVcvloaqX/K42T5efUbVjuWo5nlG6br4B2ngi6tobVXKjz8u05kjWAs5ovAILdro9MczbSGBLitiMRaSmkT4Dpvp8VHp2XrkkfYzo2gOdMf/L87dZZZYj7MZvS8YPiO7wb9AlWRm2av/MADy4uCYCu0ec5oKcgyo5fcGvYN55XPJCP50fIya3MnffNwHMOL5yvsaB9bcNw2sRbeWuEAaLHhudOWmjycykhX9feyFuW9HmPjaHD/yTg4WRTP88YGuL3a7fZCBVYu8Ej6Wi0JynZhCMSVHVHJr78zvG2pg0Tx2VRwKn6G5PSo4ik+nMjaqK9GT134gU+vXBpDAQ5C9pOZgSXFZHToGi67ECnQznz4i8SPt7fCkjOkQUu6g/E4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(52116014)(376014)(7416014)(366016)(921020)(38350700014)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dln59WlDiKArznspUpOEQMVMZv5/LWB1D5sWDiJUeLTntCwiemYhQycXJvWD?=
 =?us-ascii?Q?Y4IIOdUCffSutfTgjqOpXZm4zuelW6rzbLeqQFLczQhNVHqDYS0UaY0PDV3T?=
 =?us-ascii?Q?4sgavU0cMlV0M1WvjeqXGz52i787Z2v2L8GJSHG4Nz1EASRyYL1Xxjc4W6Xs?=
 =?us-ascii?Q?qhsga3Z82KchlGXexKhizGnZXOI8SlLaSejyzs3bBtAs8p8klnknspCEW9JK?=
 =?us-ascii?Q?VJP14QLzC2AfUWZ1G1QuTNPHpaQsddDEnvy8K5SvBxHX8q+PcYV8zHwLaN00?=
 =?us-ascii?Q?g5K8s5RuuKcrdIkWQniCfEJFD/cwuptwyRjp9qIcw8upzP6LF4imoQMXzbWp?=
 =?us-ascii?Q?3vX8Dsh/PD8iTdzSaZRUvt6PyEaHjU7HTcIcEKL1C021tW5PNqa/kT+vNI++?=
 =?us-ascii?Q?j9BNDKE7exucCZzlChhOhVPfgjoEN7/7se+lrJTCEpxHjgvQ7ci9NjI0X8QZ?=
 =?us-ascii?Q?YkwaoK/A7uDxiiyVhSYc47ZusDgewqX29Lh9GMCmVvKZLAJ00OYlHDvocV3N?=
 =?us-ascii?Q?OWTKp5AYLAxXURyozdmImL80BAfuLnFTn0bh0Qd6fY40td0J18nPb35VrP5X?=
 =?us-ascii?Q?5hFYUB3j/ifPg17CgReku+bvSY7zCoJcSjXgBxBax8XI38Af5PeEtW0SC5/W?=
 =?us-ascii?Q?S+OWgk10oASXlYDfblJQxfe/3NI+/2s51Q3U58y/VnTjGUBzHPYMyPh6Ma6V?=
 =?us-ascii?Q?/+8A1qb2yQzf0SktxYvjgXgfrZZLbeXgf0n/ejdCseZ4twdlKhbSayWd8YuG?=
 =?us-ascii?Q?rLHCGazeEkTD4IJz6Btje1VsR3dYTrtwxh3cB6DfP4Mxb4Gudlqb2JDjEvS/?=
 =?us-ascii?Q?FLb8V9H4oSTgGlhXNEVGy7zj6xU8lSDxUgRdtgaoIpyBkZ6PvNLtfskAmVj2?=
 =?us-ascii?Q?x9sWDNQTG5dfeB5302ExHEdkSbley5EU4HK653fzxf3HZVroqITCqjD0y0sZ?=
 =?us-ascii?Q?xo0ZZgZNKD/GiV0MvfX6Ytw6FgxK4EUJJHy7ZtbyzX5eiT73cBtWEiSILpxk?=
 =?us-ascii?Q?4y5BeSBc5NvGPvio5L4v0qsA2coBaRuQdfZ/FbmX8zI+b3O0ABkn8stQI6xu?=
 =?us-ascii?Q?k5T0gavCc4PYrb3SJNgdjALK8ig93NmfOxCjC/fq/3Kqy3HoP3o9rAlXcWMq?=
 =?us-ascii?Q?jj0uu/1k/2NvyCMDxpAlyOryTux3m8mpSDQ7OH/NWJc0ZQ3fjyFNd0DpJPqh?=
 =?us-ascii?Q?ypiYjaSjsup+XCGrR7hjI2JzNpHxpn+HAx7KFQdEg0kI90vU1j9H2HjZzp7I?=
 =?us-ascii?Q?Kmhl1guLfLhtAPTmJQ/vw+QNIb2eG/wLn+G2dMCQ94WQcf+v99XAYONpgno3?=
 =?us-ascii?Q?eLAwJU2IV5iZCX3RqBViJZw67g+EaffOJWoli6osM6EW4OUOPggXqBZHGVS6?=
 =?us-ascii?Q?W+7BuJ9JUNWrHwdZRmVrkg8yclnGZIk/wu1wDGBz8iiGa7D+eU0eMwLQP7O9?=
 =?us-ascii?Q?wNfb/DwfhjwG2HTPtnzw+BBcXQEQsVgNVrdo0HCwDMTxtlJB+f125FJj5CEe?=
 =?us-ascii?Q?NW4uR/y8CbvKf1yw5KytX+GnRAxH9fEatMHw2fLN/5Mt8oYZCET7AAdNNjLw?=
 =?us-ascii?Q?BlpvxmG+4iv6Um+0F5hmgg23hDBXRe0M2BA1+N/LlZsnHphe3kqEB9Hg2dbz?=
 =?us-ascii?Q?zQfpg2KucJv0qNBO6Xu6ldfhAV1NA9V2iGNMu0Ng3KWcuITDnmlgM+NAFa6r?=
 =?us-ascii?Q?8W9tKxXHPNKWJ+3PRyUczBA9h/prGFvWfbhEZWR2DKJedh8uIIrQzyc6ayKt?=
 =?us-ascii?Q?EXsmnWoysk8I1A/Jdpt3dlZzZa8Y1QbxiFzKUHeCY0Ny13uD9p6O?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4986e501-e76e-414e-89db-08dee6c5d9dd
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 01:17:37.2486
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kp7YKtHkd3oKQMo07E7zTZ4AxzK6VlD9TFhH08aGhudiirUM9JNaiTgKEg0ilqfCOYRgpeWu0Z7/4891qNNFOi7mGMVx4va9SrIdPCHK9Hs+8dt0xiX7H35JRWZdRDnL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10810

struct snd_soc_component will be capsuled soon, its member will not be
able to access from non soc-component.c.

Basically, each drivers are using dev_{set/get}_drvdata() to set own data,
but it is not enough. Let's add .priv.

Add snd_soc_component_{set/to}_priv() to access priv.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 include/sound/soc-component.h |  6 ++++++
 sound/soc/soc-component.c     | 12 ++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index 61aa6523f2f75..f00a6a809b169 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -252,6 +252,9 @@ struct snd_soc_component {
 	void *mark_pm;
 
 	struct dentry *debugfs_root;
+
+	/* Component private data */
+	void *priv;
 };
 
 #define for_each_component_dais(component, dai)\
@@ -287,6 +290,9 @@ struct snd_soc_component *snd_soc_component_alloc(struct device *dev);
 void snd_soc_component_set_name(struct snd_soc_component *component, const char *name);
 const char *snd_soc_component_name(struct snd_soc_component *component);
 
+void snd_soc_component_set_priv(struct snd_soc_component *component, void *priv);
+void *snd_soc_component_to_priv(struct snd_soc_component *component);
+
 void snd_soc_component_set_aux(struct snd_soc_component *component,
 			       struct snd_soc_aux_dev *aux);
 int snd_soc_component_init(struct snd_soc_component *component);
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index 625714293fbb4..dc00891b64cdc 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -54,6 +54,18 @@ const char *snd_soc_component_name(struct snd_soc_component *component)
 }
 EXPORT_SYMBOL_GPL(snd_soc_component_name);
 
+void snd_soc_component_set_priv(struct snd_soc_component *component, void *priv)
+{
+	component->priv = priv;
+}
+EXPORT_SYMBOL_GPL(snd_soc_component_set_priv);
+
+void *snd_soc_component_to_priv(struct snd_soc_component *component)
+{
+	return component->priv;
+}
+EXPORT_SYMBOL_GPL(snd_soc_component_to_priv);
+
 /*
  * We might want to check substream by using list.
  * In such case, we can update these macros.
-- 
2.53.0

