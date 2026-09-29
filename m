Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010051.outbound.protection.outlook.com [52.101.228.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA0AA3E411D
	for <linux-sound@vger.kernel.org>; Tue, 29 Sep 2026 05:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790659800; cv=fail; b=DU6kSg4fQwt1jaZoIdMojqdseKuRcFNjwmJG2B/Wbc7R2+Pdoh9X0BdSK6z9miIu9eoUse6FhLKPNDLw9vAeM8VWpjD9xlKGhrsUWYVZKtl1W6ZNKvpU7DYF+Z3Op9D/orGFEGtFrUoq1htBsEqTBGbbnhk0p+zAKszUb5mjewI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790659800; c=relaxed/simple;
	bh=Dvb97OS/YAAWoly7NqfNPrmG9/UGocIm7/PiFPYO69g=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=fM2tHbOqOCSMSlHpPDl1ZV0pOPjslNjuoTzvUAo0Q/HybZEobF+2RrMGGh3NvtddxgK0v2F34j1sGK5fxp4T3STFLgB82hNRKbFbEKUILX66hXKd1qOnUdPlqWeSmfMxDj1xAR0f3ktXdxIvKcSAIYpOEMDSmey/i9w+YM/kEc8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=VWt1VF6t; arc=fail smtp.client-ip=52.101.228.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="VWt1VF6t"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U2dV5Gf07Js1uz0xe7V5qDqsc2Zf5oOAS0DsqJBKE5BHCbtWIpitLpBp/8EiBmzhsvdXcRLfuRp4dKfpE7VdR/93nUCPMCs7H4Ybo4UYrrm6fQAKSLvlK7PY0cjctyCvi6nZhjzRoQjd1lIm/EKucITKQKQA7+GMrSaKmSJdsaam3YLQqbVA1kXCwkepRzfeETEzU1HcDmTA7bbSl01i3X4iqPfVVL+cJpKJ7ZohuZpkS2Pc5XlrhSdqK6wRrLle+ioUo8IupX94lcQuMZzmFajUSIZPoKQyf2eVqQyUA8lIxNtUre+g/bJcJzynIyalbltsR/wSU+SN2+k3ghqNxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lqfeGxYuFtz9M9Ea8Ph6D2NjoDwD0Bwhfzt7Q/FVuus=;
 b=cZZlc6YVG+95c/r3ekH2T+j/g7ytJAxfAvSbJEyYPzVOKC1WLMLMnO4nu8ymD9gvMKavkoL4vBhNkWcmvCqTAheDORLcQcMcZG5XPDXBTc97Ye0AtmAo72jbX1DwkzsL7GO4QEp0IcIS4SYPUskJ88FGQ16ly2YTAmUWOX86wxbQiYpPZJnI6MBK1zXDysYIXVRmQ7T0Kk1fWGUaaxc9+2vkkb5wHNYr4QQ1LMhlTpm7lQQhvNYWcrjs6+L5XUyVcMz0Pdm0OpJcWEdYPg7LqAmUkYxb5j7DWjh5nDHGujA2+WZsHXBeCryCFOl8GZBaOTC+LfN/LgQ9ELUCvD0Q1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lqfeGxYuFtz9M9Ea8Ph6D2NjoDwD0Bwhfzt7Q/FVuus=;
 b=VWt1VF6t5qaDZz/IWYLMZwnBz8oZLBBFyzcEZF9qajIaOH4IAD44gD0/1H8kcMBP+5++iLvZ+Jauk/DlBuotf1maGkhxaMgKM1IvOLiirUQM/rlaXCOGdMMqzANOoGyq7oWfYP+16/GV9spBWPq0re92bg3t8eCMWLuiHa1Y/xs=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12) by OS3PR01MB8890.jpnprd01.prod.outlook.com
 (2603:1096:604:153::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 05:29:56 +0000
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45]) by TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45%6]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 05:29:55 +0000
Message-ID: <87ik3oeib0.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 05/14] ASoC: soc-component: move soc_component_to_node() to soc-component.c
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87pkxweibu.wl-kuninori.morimoto.gx@renesas.com>
References: <87pkxweibu.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 29 Sep 2026 05:29:55 +0000
X-ClientProxiedBy: TY6P286CA0019.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:3b9::14) To TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB14118:EE_|OS3PR01MB8890:EE_
X-MS-Office365-Filtering-Correlation-Id: 80ac00f8-f1ce-45f2-3c2a-08df1deab1cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|52116014|376014|366016|38350700014|11063799006|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	r5QJWgE2YKvrSWQ6hbAhvuMVJFXvFCmMrOkolrCA4XY5mFBUfyaFcxQmOSt9G3Zi02y9XIxz6e+JLwRuKrC8PM99h4pn70vZRY9bMNNtxOn1pwc27q4kLdEDjB2ZzgcPXoT5PVqWwQRyTVqi1RExxI7niREy4Ss+LA2rURKths9lcq57EfU1cyJj1kqGUK+PWxLTZwDPoclLzs0I82tP2nZq3AUxPLIkUAMaL9Ep2B+Z6gzCiJZbvVqjQf7R9ji+3OAMHzfVAM6ALVFLHJM862TzxIkp40REWqZJWzZRgB/tGuEVYgF/AnlaT1AYQSYzjPHZ2yT+S6UrQpM9HkT1VNCUr9uT6A3/zXBoglxQxd67BuG6ABEoo/G2pmuXzXkkRerVzOsr02glcH8VbKFWesG/QtU1x+WSk9SYOexEhL1YGDfMEUYkEWxeN9KGg9JJ6bDYlnEsYJEf+FwEUwZe8FEr52ov3MDhWBLZuIXuL9gem+ArhOnRiDte1B3wqRbpgGLZZO5Zp0hg6dzjMwS9FVqlDAN0Mbs4H+zm8m7K7Nr7r5cPvzZ27F2V8O2UR7bTKex6NhjSq3aiePHe+H/PVFNEXuj5kp1PmLpoLySFP/psIESbG+ughIVf8ndbJDwQucd8QwufFrIJx+XLBL3qhXyYSZqARRea9Ci5jCf17Qp6+1EeronhPz1ek2TDGQ831u5Me4tChLi0c4FO66fTJbW7qjTWRBzk/ksbxU5sb+4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB14118.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(52116014)(376014)(366016)(38350700014)(11063799006)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9HCoP0ntrOecLKLQyW6cTUDtc87xfJr6X9OgBWkUCWbM4EmV5rVWGe3XFBax?=
 =?us-ascii?Q?5vLcHb4/igmwzh5FKYTm2SqRl7+rI00SP0oMrIEHGbY5l/AcyLJOt/mWhqOs?=
 =?us-ascii?Q?NiSCIdqEufYYlFELqw87NNhWX6l5wxtgIpZui0WPu/+n4J9kXq1OldQHDXtk?=
 =?us-ascii?Q?IbZ/WUVkJE8sHBPySwlBD3DZVLg/Uo3bGXpAJgqQ+aZ4bPHj8BytIzgZnvhO?=
 =?us-ascii?Q?JxZ10nN1CuZAPv8Whh9sMRGnfslh1s4l3b0e6N6nHlQBQLGerinFlmueu/rN?=
 =?us-ascii?Q?AQ2eO07N0mFcmV4SifTGB8tsNGT52qF+LVduVdD8Sx17Xun+v/U4e1z2PCdw?=
 =?us-ascii?Q?Iy3UjPkLUxdx1L/b0G0OarWlDie6AyYBoaZMx0AqzCvTVqyoHCp4b1/DUEwM?=
 =?us-ascii?Q?toeEmYPRrOPpbQNFo85uLKNCiBO0p02DIrbO3J6wTSk57C+cpH5o1Nc8Ozd7?=
 =?us-ascii?Q?/vJ580sraJmOgzN32rWOgUp93c2DiWAQoic2PWNRY+DoJ4Iur0zzFZwek2aR?=
 =?us-ascii?Q?IlRI0dcMaWHL36p3Fx9WDS/m+1dJzVY6ovVLXDCyc9znz02TOSXoR6H4/0/+?=
 =?us-ascii?Q?wGEEzY/smQXm+c7L+5TvYQlqwmTjujeLNWkIx4yfv9bcPlzUcgSSCZt8/7CT?=
 =?us-ascii?Q?n/zQzqnLg2TOd0daRUWyDfTZgs8Ar6rM4KLd9nHtGNi5NaRDWM+m6Fv+qVSZ?=
 =?us-ascii?Q?4N3FcKynniPma3VVjzAWtpo19ckOu81gCrKBlA3HPTiqJp4kfpx2Zp3IW25a?=
 =?us-ascii?Q?e5vNrfwfwpa3VlICnwXgZ0GJntYq0SiT2O28nOQJqbSt7y6eeiRQX41ezmJs?=
 =?us-ascii?Q?j3S3QZ6lWcvPk1zrE0JNja9BPQUvbQ/UX04plzWsjqdejOcCjq+Oc1+8TFmr?=
 =?us-ascii?Q?k42cVE2Oa+XNcL5VKX1Ifv+Uj6toBUr5d1qDqb8REVHJ1AgZ8A/9XQhGZbwo?=
 =?us-ascii?Q?cmPhFI3vX3Kfm77dXq8TCKOzpBFFoy2nxh0l4xnipj93dcfO3gMzMFBW6tcL?=
 =?us-ascii?Q?g5Vt+axuoZV9tC+AsW+MT09c+NyjUq/VLoe0rpvcazPsCRYga1IZgz+fQvFc?=
 =?us-ascii?Q?CtUFeH3L4RfGGT6ppCJ12Cg06B1jTmnDXmeaPjBCWgDMQ9nj8bjHfObPBWdv?=
 =?us-ascii?Q?1u1/iNIJfZ/rbE3ryFKhCzBBysXswlPn+XLKQpVbl92TfJ/JPfPywCvIIEMw?=
 =?us-ascii?Q?EOuMW5dtPbd2gBs2XrdsyN0wbdaNrYXR5r0dIPxbc0s3DsA74pOgKSeSACBH?=
 =?us-ascii?Q?L3n2ZV+sb7IUmqFpG5xK9GWEz4xGDERUKRIa6QG5K/5pg84R7IpBH30djVt9?=
 =?us-ascii?Q?AsyzXCdzS2keHhTyM2Na1d5J3yyZLyeSy/0JKGWOohjt59JxChvfXZdD+gZf?=
 =?us-ascii?Q?eTDAXgliL8Jwk05GUYxFUSY4E09Izz0hmnqeVr3czRwcWo0kDDk0Got5w8il?=
 =?us-ascii?Q?+i/4DVdTnF2f9W3V2KDHL7fA1PblQD7f8kPmJEY/xv/uUDIPpNNFW8XmpIHl?=
 =?us-ascii?Q?Z0y6+dPsJFuOAArzDZGZo+D/KcLjVXHgJFiK6BVWPq6xFlSlN/qh0jIOxFDV?=
 =?us-ascii?Q?xgC+P57eHzIvdfyRRgh+XjD4zAt8709od833+d5PWgRegJ336optK486aveW?=
 =?us-ascii?Q?v75dx9vmMDqn/S/47/FKb/HKoftgZRllR2zz5KYMoC2jqsSso/kfg1zoLqh6?=
 =?us-ascii?Q?YnkwbcrFj9t+iv6eZcQtoMNq+XAK5YqQ1EQNHtZTSEo2VjE0snA9QwG3rsxN?=
 =?us-ascii?Q?flpkvppSsVVWaOuEz8KJZ5VzHywKNIokL618QQPEwAHw52Q5jtwD?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80ac00f8-f1ce-45f2-3c2a-08df1deab1cb
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB14118.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 05:29:55.3668
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /+1fuacpYSesVhuePcNeuTq+OYFfzidYLVOQb9sp/ev2gSaB0xzAkUwgP3PVZdhiADjeS243UGifh3Zpkoa7SUzTFBe/VG6TR9G8o31iNfL30b/RlTlTeBPnTnfmy5gZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8890

struct snd_soc_component will be capsuled soon, its member will not be
able to access from non soc-component.c.

Move soc_component_to_node() to soc-component.c

It renames function name
-	soc_component_to_node()
+	snd_soc_component_to_node()

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-component.c | 11 +++++++++++
 sound/soc/soc-core.c      | 18 +++---------------
 sound/soc/soc-internal.h  |  6 ++++++
 3 files changed, 20 insertions(+), 15 deletions(-)

diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index 6077d07f873f5..11acf0d42213f 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -1295,3 +1295,14 @@ int snd_soc_pcm_component_ack(struct snd_pcm_substream *substream)
 
 	return 0;
 }
+
+struct device_node *snd_soc_component_to_node(struct snd_soc_component *component)
+{
+	struct device_node *of_node;
+
+	of_node = component->dev->of_node;
+	if (!of_node && component->dev->parent)
+		of_node = component->dev->parent->of_node;
+
+	return of_node;
+}
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index b54706dbb527a..59a8f44e249a3 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -771,18 +771,6 @@ static void soc_resume_init(struct snd_soc_card *card)
 static inline void soc_resume_init(struct snd_soc_card *card) { }
 #endif
 
-static struct device_node
-*soc_component_to_node(struct snd_soc_component *component)
-{
-	struct device_node *of_node;
-
-	of_node = component->dev->of_node;
-	if (!of_node && component->dev->parent)
-		of_node = component->dev->parent->of_node;
-
-	return of_node;
-}
-
 struct of_phandle_args *snd_soc_copy_dai_args(struct device *dev,
 					      const struct of_phandle_args *args)
 {
@@ -815,7 +803,7 @@ static int snd_soc_is_matching_component(
 		return 0;
 	}
 
-	component_of_node = soc_component_to_node(component);
+	component_of_node = snd_soc_component_to_node(component);
 
 	if (dlc->of_node && component_of_node != dlc->of_node)
 		return 0;
@@ -1339,7 +1327,7 @@ static int soc_init_pcm_runtime(struct snd_soc_card *card,
 static void soc_set_name_prefix(struct snd_soc_card *card,
 				struct snd_soc_component *component)
 {
-	struct device_node *of_node = soc_component_to_node(component);
+	struct device_node *of_node = snd_soc_component_to_node(component);
 	const char *str;
 	int ret, i;
 
@@ -3275,7 +3263,7 @@ int snd_soc_get_dlc(const struct of_phandle_args *args, struct snd_soc_dai_link_
 	guard(mutex)(&client_mutex);
 
 	for_each_component(pos) {
-		struct device_node *component_of_node = soc_component_to_node(pos);
+		struct device_node *component_of_node = snd_soc_component_to_node(pos);
 
 		if (component_of_node != args->np || !pos->num_dai)
 			continue;
diff --git a/sound/soc/soc-internal.h b/sound/soc/soc-internal.h
index 31559918355f8..a08e6e8ef17f3 100644
--- a/sound/soc/soc-internal.h
+++ b/sound/soc/soc-internal.h
@@ -36,4 +36,10 @@ struct clk *snd_soc_dai_get_bclk(struct snd_soc_dai *dai);
 unsigned int snd_soc_dai_get_bclk_ratio(struct snd_soc_dai *dai);
 void snd_soc_dai_active_update(struct snd_soc_dai *dai, int stream, int action);
 
+/*
+ * In soc-component
+ */
+struct device_node *snd_soc_component_to_node(struct snd_soc_component *component);
+
+
 #endif /* __SOC_INTERNAL_H */
-- 
2.53.0

