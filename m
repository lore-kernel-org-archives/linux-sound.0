Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010004.outbound.protection.outlook.com [52.101.228.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC3D32641C6
	for <linux-sound@vger.kernel.org>; Tue, 21 Jul 2026 01:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784596668; cv=fail; b=R+SF3Et7PSGmcSVFFRL3kwH4sFVaqnndfwO6ItKnN/w71qB8Dts7qMYV279vmfF2NFWTJIKQgQ5M+fiyMBG3b3yeYu/Zbu3sBKvXqxcav/ZqkVcBxu9tw4fJHV5OZiXvOaJlvkzi7cNrLaEgg/IX4q3feHx67zyCfgu/4cq8jy0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784596668; c=relaxed/simple;
	bh=j/B141PPVY0DJ9DzU2ipf/yBekWCLZIiR/PO1FTB2pc=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=rxHHSymSiPJZnEWa9HBTJOz+5TciksfKTipynl6GYHsQlCCO13cqrv4zhhz1Pa59YL29gseKYgFpmrePpuI54SHSm+FOJQDuV84meynl2c9oI1FrVeQA3tULGLXCI6sbrMo/rYzDVPVykn9sdw29tl1jQrzdKu1a1dCQxnESyWQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ZUshiRJo; arc=fail smtp.client-ip=52.101.228.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ZUshiRJo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=knrAZfcap4G+Ed0M3Nme6uszcvJfUV6NJ/USjHWMErG0pq9XyWObCUXhAFiAHoV25jwtbu4UJY7yLp7hYvphWZwIWy1cZX3B01OX8KPpnctntred9UmIClCN+SaH3JUNOlmuBEqZMWdue7ZgjyfBfHaSvecnVkPCTVQff39+6+uNDYkIzSJmR1eFl/nwajFfzTFziCAp0QX+wSPiLNWGk1JNCVAb1jiEUWXx70FI7TYfnJRxg8IxmjPYkyzDRONVcDA2k1KjGkhXjCkwe0cK52rKqcaesZ1uNRyA4tXXKritOwB9XI5Wcw5EyFolV2MGhPtmQwynABbPJHw5ww8+HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wj/8SvSH/+xhtsw+FbUmdO7ElGDrBh4ATuI41zIc6Dk=;
 b=dLuFCr5GibiD9zvOKyjnBk477BbyN57KZXZGqgWFFG0C+79vKKR2G5PSE6YRpgdCMOg/D+67J7Y/KOEh9cU3xaMdM8QJNT8pFq96nTVklrqaLh+vRMHz2kR4t1kBdRYOhV1lq1p5PAvsxcvuW30KGX5+2PvC18ThsRCEmqwVojWbZ1wkeige1fBgNRx04HRjb+6uPHtBZO6wnmlGo5/GjyKcyhKQX9FE0nQmgpKlkOe8YcxTbXnFTgMJYB3i1vPtaflCPK0h4+Eo/y06ApPDEtDPr09Gs/w7OoIutWkpTj0ew3tnVdX0UWKOHQrULFHYiaJCHMmXenBPjUi5ifc8Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wj/8SvSH/+xhtsw+FbUmdO7ElGDrBh4ATuI41zIc6Dk=;
 b=ZUshiRJoCx5YqLJKyeHmDytMxCG42Vz5hH/vn6caC5Z/BM3uXQHZ8fwxjBoehn3r+EDprtgufgQQEueQzWZ6hGYHmsJj0NdGlpXFKRS+5UxQEwELDtqGBoYEBZRXGAhLb6SNp1zYxpLCGlCKI3/sFdON6SkwMKGpty7oKvv7Y74=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYCPR01MB10810.jpnprd01.prod.outlook.com (2603:1096:400:297::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 01:17:43 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 01:17:42 +0000
Message-ID: <87ik69jg3t.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v4 06/12] ASoC: intel: avs: use snd_soc_register_component()
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
Date: Tue, 21 Jul 2026 01:17:42 +0000
X-ClientProxiedBy: TY4P301CA0039.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:2be::14) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYCPR01MB10810:EE_
X-MS-Office365-Filtering-Correlation-Id: 0af19dae-331a-479b-11a8-08dee6c5dd33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|52116014|376014|7416014|366016|921020|38350700014|22082099003|18002099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	JAYOIoDzkf4fSU4YNu0yIifMaOoKvgcgd6wSElgioTdAQeNu1HaKMDoMEAw+6C5Fklco6CEhwNTcjT1WV9Y53cCtnJnGgAwIkRQp93V/I1V1L8b7wfXiSGuQ27A0XLX6CMaPrbexybnPuMCM67kJ2UsakspTrUegjPjiXUHXcf0DfTsXvSjpXi4oWypSscMAlUQfZR23a+5NGqbNNt0K7zvO3yGCiJ0zrZgwkM33q8xTgIDODi3n4LMlILRWOvOp8gHHalQAvo8ArCLevJzaU/8ET4RQ3YTy5hTStPsm7LZu4bAWlh10cpYackYzqyJfEdxsFS0XcWXNFHNwJXxQJYRphSHUySNGAdCE/CvVMdIJvz8JaygqGqr2Aj+fSasL13YAnre6gZaOFbjV9cmm6sJ5LJe4imSEt9II6++SQS/sIPfDo8j5C+gvEVQC4YT+3gENnC9FknO9v7UvMrq97vmQ01oYNKcMh9aI2EtUFjoWWgNgIKyWQxrrZQvSF092WMD7Bil5aVP0uPASPv+ZzT2QaHkUVyT4ZiTPmkQyZEqOvlcPosTAaqtlLq/SXzmjQThzf2MEIE0tiMHeZ70Yq3N4gIEMNHDVdQpkZFLk8eTYkb30BdcD9Ikb55NafZ4lP9eW8C74y/Mq8N8ltbBOZql6e+zVRO7ELCf3jkDbxLxiSBRGp2ToWBDzs5tUkdcb8Er+Qx8nD3rW7FykDEVvUGBKEVCN2CupC8+sdrAV4+c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(52116014)(376014)(7416014)(366016)(921020)(38350700014)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AUv6zOVOYiFLICKxfewA5IHw+CL1bzuqMwyFUbxNJRBU2rinlX1rItq97fQa?=
 =?us-ascii?Q?nY/GUFudJCaY/i2qUQ6kecrWoVNB7j9fe/BI+WUpxtsoZxFU4QWqgYbeBn6j?=
 =?us-ascii?Q?WaFU2IL0E7DjFwz/QlsrA5xJQAgqZv29/JbCZquL+p2eEIOl7VeK/3IksWUK?=
 =?us-ascii?Q?eSY1WAzRHQ3QSHRdPka82yCr9CRGg6mSTdrJJ23bk7wqkvIX/HjuxBNgOFZ0?=
 =?us-ascii?Q?c4tEjTq+yeRnNUZYgRRyWgRwbbFXWJxQxkJV+LO2n3E7qssxmfU2DKSqqCmu?=
 =?us-ascii?Q?Eq8qHSsUPxkpBZL+DnoNT5HnhijHnms2PiWRIyfL/F/MP1XBXMi47w+pmxkO?=
 =?us-ascii?Q?qCQZNqKxOXyK0LRFoM9VIZyiArGDLkr1jfrhG8MUFVkC9R+hpg6hcClOZtnW?=
 =?us-ascii?Q?HEnAy2IbCCeFPTDiSDxCQ4ocNE2o1oepOvT90k3BP8mcOQ8wKCikccLoZBo5?=
 =?us-ascii?Q?SMgkaADRIbxr7N5JulJjTd+U1t7KAL3kbrr5zgHB4xgyT/PwWyFOmMTgH9Gn?=
 =?us-ascii?Q?eAfoApoDkngFL9p9AfyuD8nLCDHgKF1heGP4tG4qYQdtkQ3t3SU8XpjEMJMz?=
 =?us-ascii?Q?Dz36m22lMs//atVqLj2eiww7fuudjBqJvJcJHI/4ebAqOSh+IxOoPziMs9US?=
 =?us-ascii?Q?RGWcacdlOizEw/Bi2r8yRK1V2XPLIGv56z8NswzsCs3lx7t/sWeEego+rU8h?=
 =?us-ascii?Q?iVBGfxlYE1ZsVqsAcivsgauPkcsVd/mN6Rje43wMe6UPWMbs7bPPdjqi+3x/?=
 =?us-ascii?Q?OwjlLEsNIpCtGvBVXg1iYPtZHFZyOvLXWZJnNNdMPFaLQ00b6PCozsl9HZ9z?=
 =?us-ascii?Q?fljB0gOBZh1ro2n/s86BqwiJS1sYwDlBilPmRNQ9KPcpy3S+mjmpKGf/OMRS?=
 =?us-ascii?Q?reTSH8EDfPvO3Im7Aq0vPMax/VLkWLEwX//j45PeWpqLziUjwH4xOtOayMH3?=
 =?us-ascii?Q?PUshm+OHRUQnEROES/6hjcjVy65c4wh+3ucd0Go7W8mELnNN3oe2bZYI8Xc2?=
 =?us-ascii?Q?CCCt3ioj1Xj11xiNKGWFw8GqmVH8kBSzqjHP7h8ILns1tYiXdPV+OwZrPh9P?=
 =?us-ascii?Q?MwxfsHXSOwEF8DbjUBZz9uz5TOR//qTDNIdHgV3dxHYAHvYZFWLFk9vtNB2z?=
 =?us-ascii?Q?zv79mB3QkOveenu0Lysf1C5oVYBJvcq2gqoFGKEdUmNL+t23NG1drb0KIacc?=
 =?us-ascii?Q?jFI8ZRRjrZaRIRbOnO8CCr6xcN0/Vy6KNc/2mYu9xTyQ6cs3JtBjOgSCWp5u?=
 =?us-ascii?Q?H01ggTcHwhph9Kr9J3BbcIGl72DpQmQpu54yzLCW8GqQ3ybo4lY0pGrFRNdL?=
 =?us-ascii?Q?/5mZJy7CxzStQACtakDIosfmcTqsdMRo3Lc6lFaBdvi9t78YLhOj/7G8cd5Z?=
 =?us-ascii?Q?notOKx4KIdxOoyDcD+EQoPlbA1sbEqDN3pjX90do369V/GvFb6dcE/y888A/?=
 =?us-ascii?Q?CgWll0s0Rzv57X4YNCrqatzTN1Eda+naTvMQoM5FT52oytqO3VWLxqIdHUz8?=
 =?us-ascii?Q?ddAVA1iuS3QuUHNkZVSGCUJO1qutRud2tCpGmnwiTNdYHvqTog3N92ilAwx+?=
 =?us-ascii?Q?XxMxphYUx6ehClxQmldLLFVhHGaWYWN26L7i2a8FxvJHNcpT84JlmU0CNIp1?=
 =?us-ascii?Q?3ueqyImB+pxlSq4HNWxfKzUFvK8lASN4om1+FdDXB8ssrWGcDdNrMTV3zDoL?=
 =?us-ascii?Q?DsK3DTDqkFKrFMUvQWDnYHROxAWpjoFH3vSrF9V8FkmQdS9CqRcVsNIyCWiz?=
 =?us-ascii?Q?mnqt+fL9gFYP2dBng2CWVvXGcaILnSbQLAyWnxNlbZwLvvPDNped?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0af19dae-331a-479b-11a8-08dee6c5dd33
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 01:17:42.9214
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uhbU4tse2zO9tReggA96Vp7Ey1DxpIuq/o0MbgWi6i3iO1076NtUuEXKzDUUU2VAzwuPYGpSYI9xzyxUt3E8BpsMYB+T58duR2eE1pHGV/bpVVRXjEs949ECPTlar/RD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10810

It is calling snd_soc_component_initialize() / snd_soc_add_component().
We can now use snd_soc_register_component() instead.

It is using container_of() to get avs_soc_component from component, but
will not be able to use it when capsuling has done.
We can now use snd_soc_component_to_priv() instead.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/avs.h |  5 ++---
 sound/soc/intel/avs/ipc.c |  2 +-
 sound/soc/intel/avs/pcm.c | 18 +++++++++++-------
 3 files changed, 14 insertions(+), 11 deletions(-)

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
index 797b9c9163b49..cb0004e025b5c 100644
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
@@ -1387,25 +1387,29 @@ int avs_register_component(struct device *dev, const char *name,
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
-	if (ret < 0)
-		return ret;
+	snd_soc_component_set_name(acomp->base, comp_name);
+	snd_soc_component_set_priv(acomp->base, acomp);
 
-	return snd_soc_add_component(&acomp->base, cpu_dais, num_cpu_dais);
+	return snd_soc_register_component(acomp->base, drv, cpu_dais, num_cpu_dais);
 }
 
 static struct snd_soc_dai_driver dmic_cpu_dais[] = {
-- 
2.53.0

