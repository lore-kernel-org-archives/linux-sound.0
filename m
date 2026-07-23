Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011027.outbound.protection.outlook.com [52.101.125.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22262383C6B
	for <linux-sound@vger.kernel.org>; Thu, 23 Jul 2026 06:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784788479; cv=fail; b=On48lBgIgoIbYL/eOgTIc7PI3F0e5+ou5gqIeHjGefn2Ncnv5wxge+J+j6mwiw9rKonB+y0k94j8FU95ZQYB/ZrsjYWYbcPIzi8vLrPFTECjZI0jaWAqF6TRren0DNjtTYS7y5kBWDSGeEW0oiLazR142xmFgVJo/ncooG0F/KA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784788479; c=relaxed/simple;
	bh=nS1+mIxL3akuiRV9kCHulwbSVZrcx5yI5pM77PQ3hUE=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=nzZV7djXLnQH/s8vWy4+HzPPCe7u6Dnt5vFrk43KhrENEZG0GjFpdzkhIL26jjONFcc9ERqt4rMp/SdmwX9Sa31boKrzs6zLuIQuqHb1zq9QLrlILANK12tN26jalQFwce8rYbxxCLmZa5823Mr85Xj8Z1sBGP150xPFIGmHPJE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=BB4Qy2rV; arc=fail smtp.client-ip=52.101.125.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="BB4Qy2rV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rWMn+8hTMYXVYz2zPs3IDL9bCsMkkLso2jfx0Iss5ogOvniIeROInqgRI7SKBm6RQ/r9e5OFXknDlBVLvi1SYfdw/roU1GEN5bGOsT1kD4Ssm/9c6eMi7Pi8z1disJnFIAeTEfnBvmDY5wpa6o7FmMjk4gbB2WiS/+uVhMmdLYnDasnTi3Gzeqam7wTJN+CTcZc6pKT/0G38wFcombU8Hr3XPjNGnaSccLbDnzHhZMtd9EkCO6AszkiZSHTvEIetf0tdks2mRemd20YybuY6XPaVyEfB8uboAjJa1QZwPhVhLmZCv8cI0INeJr/DY9s5A+cfVIiwZbYYvybj6UmY/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YiLXnpP0dFHwec91SrWyM/p/d0y9JXXK8XdD7Bht8to=;
 b=ynqdBxJENV2MxnJVkt1n/1PFgews4lnJwe/nb3K+X1ubuZ8wUjqLFtIz8K8lVACGcyNdztS00/YCfz9KVogVYn42Ewaum/BfG5KAtajkv4qgZk1X1tDRjRx7dDClXAJ5uYrkumn16Cv14TscBewK/BPwiczwm/ULSj531GUSKz1TBP0bQsrZdiZ9se2FNBF6w3slkYm7k3Ev/yinU3JiHFoPpG7rgRQGc9Zhfq77mk4tShKf3i/Ehk4Axz06BfvKTGQqo3USm1Gw0qwq/3uSvHUEW9bVDpcn2jTeyIadVM01N7zg7hYvZ70RGSi81ao5dIhnJP5Mg1HQdTOYMHBcFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YiLXnpP0dFHwec91SrWyM/p/d0y9JXXK8XdD7Bht8to=;
 b=BB4Qy2rVl+HSauUsG0yCS3B6fTwdGGC+kvLSlyll82zddnUR5EWhrYVGk0dpmwG9Ub5b9qKcV5QbdOMYtQeuPo92KagPIuYF9UksHCRKuWiQwlzPfrisAI3eMudhqCIxM4FPrYKX0b4bHZ4VSW6gBp0NYRsPvUN8yhC/y8Fj83g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYYPR01MB7103.jpnprd01.prod.outlook.com (2603:1096:400:df::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 06:34:36 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0245.009; Thu, 23 Jul 2026
 06:34:35 +0000
Message-ID: <87qzkurz7o.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v5 05/12] ASoC: soc-component: add snd_soc_component_{set/to}_priv()
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
Date: Thu, 23 Jul 2026 06:34:35 +0000
X-ClientProxiedBy: TY4P286CA0002.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:26d::19) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYYPR01MB7103:EE_
X-MS-Office365-Filtering-Correlation-Id: 36bb498f-9d3a-4199-1618-08dee88476a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|52116014|7416014|38350700014|921020|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	LlXCFLL4nPA0z67PrGcx3I1nENrmhxne1sBlazp0BmbHlGZZvQ4NoJj9alPMA49T9F/LElkHj/NUc33H3fq7S/MBtvTzJsW/rPLyocC/vQI6S2GxJjR0Gd8zlGZ77oIqsMhLnlSd9xFIXPOpnskVSUa+LY9/dBMg02Ff9GKaYZFg6SXjbYgFDI7rBSnVFsW+eZZDqFTUoFwoBU5UIZmXe2ryFfgYBIL33XU4Cvlb+7tIlzDHe0BHJvge8MIxSpGsXW3ffXYWu6v2UbY+zGvhDuJOTOUuqmHgycTgz4LQqHMZqyqo0anvC+Bw9u8I/mHSB5PQkBgnC2YuSAVU80mCN67th+1QH5adPT9C5cKUTV/WKoBEjuKvLyE8FSrx93WxhqDNAwwSkSaD/dioR51EQD1SE8jWCoNYEYKKQAx001SpiHYd7zElEfaKkHgGzIbAhz5XOyYTY7puELh6UPaEvcI12688svBKeWWr8KHDhf5bseGLoLQL0RqQrw5hPhkoBb7uGwhzEzRiscBMFYJ09ZXIvvMSqzbaMSO/FR/m5GGaPmhbKboDNw0UnhEGyCgShGKkMo3NhzBdEXbcOUy3QRoGTvsUEQW0P8xsdsCUag/Bcdw/WqVWKwg1q9sAN1akr58JP4EHF1b3Kxd97pzKD0p1rdD5fSrBZ93StTZ2kqZN7swNJJ/EOh1QhANteGK+Ylsv2zxcvoq72Hvy1iS2+3Iz8oejF6Y3Ouh5wlskD1M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(52116014)(7416014)(38350700014)(921020)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JvfFKmbwK22m13ljqpgmbelXCbYYXwrSxT+Y4RLUVLUzEYHTm19MSm/wsNw9?=
 =?us-ascii?Q?5J6lTUJ3i8aBPi1GUEdrWToRQBum6Q0N/e2leKhhFC3TMeh+1zKkITObCcJ6?=
 =?us-ascii?Q?kMq3CV7jVLDhc3Qd4aB9qKxRF8vmCQuH71GVaxbE+wGggWr24ueLj7xGIyZJ?=
 =?us-ascii?Q?Cl2ZCnotCGNwi4tM27P92zvyn0VduvwDLjuxnPN3XRej+hiLNoCJRR9XrP+S?=
 =?us-ascii?Q?qpZdhMBIFJ5age06gawfzmkImo+Js3S+D4jJpIc6PZelBCalbUGM0z9xu56q?=
 =?us-ascii?Q?Xp0sWdcPuLfMfYfuzww3TrRS/u97HmKzIzuB+NPKQDCXQ6Mo+Ig12Od89V9Y?=
 =?us-ascii?Q?GWj7iM6AlEGWBTFQveWYWxkBFhA6YPxikG/rVq28cY84fDFGB00WnTa2ymUM?=
 =?us-ascii?Q?tsz6+WjokzkSC3fe6d8y0acyJ39m8MsPhLlfdUDWDsDdmIcxJK7jSyR7hZbu?=
 =?us-ascii?Q?dGRxe0WNOoFOvXFGrQGeTqNvH6SPUF3GxeKFu0I0QqpBK1sIoT5kwmznITb7?=
 =?us-ascii?Q?3ylBO/vEsVxfUjA5zsSP4hTQf5Rw+teHwXqZ+xLSxLerHCCfO6Z2kZmfvDXR?=
 =?us-ascii?Q?OAk8ACJOSqBnjmDr2gMHDO3CyqfQCs0dQC12LdvGnON1HFxNGXvfbe7L8X5O?=
 =?us-ascii?Q?92XmhpUlVLFphOqdk14QeRRa5a9HvSrt2ExNQ3xHVtCIq+vhnI1Wi6lI7RJT?=
 =?us-ascii?Q?SEbOno8Ad6GsTO/Lv5hHfRhCV23hnChBC32FPbFh2gvqBS82zXTCi1VtcKjr?=
 =?us-ascii?Q?Jaboxszx5BRtn+iQ3+d5YXLOXQPQqjVWm2LtWfbEFlfZeh/sxyckLzYRlGZz?=
 =?us-ascii?Q?9ujL6FgX2aH+ibS0CpaRhDq6ltKVNm4nHuoQXI++3WzJnRgL7bp7jBBemZYb?=
 =?us-ascii?Q?EUQS5E/MU8+za197W4P7K86CG6htTg+mHrf/DbGZS3JbSKiWGrrd0XwqSitC?=
 =?us-ascii?Q?SpUane1E/3lSHgShh9pBZ2fCi6wa62PtCG+FEOxXkos54X8hLJAKSA1C8s+r?=
 =?us-ascii?Q?JA4USLTj1MhoZLJ8g9HPmOCn6HrAsefJRXpNYEyDPn2x3DuGDFAMEmge5KOW?=
 =?us-ascii?Q?GdSg5OCcPben9GQDX82J/Ty3z+PNVB3Iw4+gzu6rYTNNT/uiDHNeHIs4po0q?=
 =?us-ascii?Q?833YFW+tlpelEUfLUFkuKYXNL8SSCZnoNk9lCwSBWhMPUwy4SK+q6lxCfCI1?=
 =?us-ascii?Q?uLCFoXyQ0hb2XM8yW7s2b3TxaRUKz/XNYJTkqvydSkMrWyL944qcALK4csqG?=
 =?us-ascii?Q?NRjxliQqYku3Ct5tFdLC9zVhYwxddYDReXhBPGLO7otbhtOVyZFRQE+A4n/A?=
 =?us-ascii?Q?CT3QhOiZb+KRwBgLPNo6NwWKvHJ7N8mVNtFwnyZBXpcjMI4YiP8UCEoibFNS?=
 =?us-ascii?Q?EuGY8t7DiBROpxakv6i5o6xbtd/waPMMgMepeC0KyjjDlHocElx6dPRvSdgs?=
 =?us-ascii?Q?aTiL6l3v/WS7kQoz++TEkmevJv1aoTnEyg/87qnMYnqATlI7CnC49hzUTDh8?=
 =?us-ascii?Q?p5p8XNnSQAKJ8RxB48Nj+o8PTnELuIZ6ASp2qr0RKzUkESstJKCTlDV9V5Xi?=
 =?us-ascii?Q?ipoD367Wfv5snvg+vIfA+wGoOmopywDkKsaHf/ZRzm6uUj9KtADcj1oR506H?=
 =?us-ascii?Q?Ys5+svbInLC1zKFsWUDItxwbuy4FTWB8757GLKuD8dR3Tz7ng6Yo+nhwNOjP?=
 =?us-ascii?Q?y7VShzf4EK9z7Et63dEKMgBzNPDc1houEZ4/oer8ed+giAt/us4FdczpsVl6?=
 =?us-ascii?Q?kcvlN5UuMAQlsPDlJJRwZwvrAuyE+8TTi+X5JMhhXYJpndY43HQk?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36bb498f-9d3a-4199-1618-08dee88476a1
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 06:34:35.8374
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +BVs+fVHv0yb9DBK9WSYV/0omEpMxseWbIaF2yKuMrL4LVqXYboGJgNXJ0w/VT+c39WtPu96jQjUSfIcRjD2LjFaHLrsbYfdaXj9sCbq6W1Bt5acgXV0CeA5Tubulch+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB7103

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

