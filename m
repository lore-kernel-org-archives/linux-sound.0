Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011035.outbound.protection.outlook.com [52.101.125.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E94FF30ACE9
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760415945; cv=fail; b=YpKoL9iN7HtVl2zEDFBYmfJhcUjlEz2MbSSOvRE8BTgWsPx7ncm33t6nVZyxG5mDeF8IJfkMZQBmbcRIY5wCHSXixlnTaQaDswYsICFlAVYnVqMmR70KFvvFc5/3xMDSnvNEMIj/7rvGqDxtHn6RBzZWUmE03jb+i9FqK38nNqc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760415945; c=relaxed/simple;
	bh=vIAJ0kdOuQmqe8fLb5MH5a6p5YfibbuXcanLlHLyoIM=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=sQjsY/x9X2MWiH/RXPo8Hspe/sS75vREIJ0lZtUlBD4LO72QlvznP/4cijJhl/zdFh3Lre0WbD4NCa/M8ZBFbonAcsa0gf3OeS44kfmh80oLCvxfCZgQmRMZ+JTPAYfw0rXxX1s+NI1mG+33qPnTp/pkxiKrs6XqaYjBaEsYDDQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=WceogSP2; arc=fail smtp.client-ip=52.101.125.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="WceogSP2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aaMJEcD+3RwQvU5HcKi4bX01OpaE5LGUgRiOpkFKfcBjvHCeD0yezalVyu88Z6Ouc49ICqT+cTLk7kwur0pVAp8EpkPsUdItm6af9RNLGy6kZKI2NKq0fzb3Y70CEUU6pWmAiVN4gDdyPFLdJKpOxNSy+adQYrPWAd8LWnnSgEjfDjYZOLw0nKVYIm0Jhqk/j+Pym+l03uuVy5Vw2eFFvvaZ7G0FOh4P+uvusE26+JnN0m6Vj11QEoMoMpKVu2euBm4pE5JixUrwcISWbQjRii+1julAVXVcsORkkfdLNJW/xb6D8eOaKLID0yFfaK/pJSBRQ/vyE/f9l+PnUyI/fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N76EIu9iqvKOyC/ry0QyYG3banU93Wvqb0DGyLBya+4=;
 b=XwIaC1ObFJFsyOmMdGjMOQYxwHwzSommvnEb+oRRqr4P+TuxvOwutGIoFryUf+U1EVVLCbnj/0bZ6M7lpbgsQ63k5Cr0uKhIavG2xEZfjsELYRz9aC/WSD5LCIeG4+1TjTb3PmFS2jyJFQd5NAbqMPG4eo/EI1IX6QbV2UI7OTAJsKEBG8eAuPKYYHdPPLE1agqnsHaTsDpqgq/PnBQOK3TI4r/C3N5SPJBCYZ5tZAyIYXs9Iu73ClyEMq0Pbdbfq5j3X5+mmPMPDL+b1UTZ54RVMNs3S4uJ/8fH50q8L36VOGqRvDRSS8zSV1ContjxFnvrfhpicLRORbYvKBUqug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N76EIu9iqvKOyC/ry0QyYG3banU93Wvqb0DGyLBya+4=;
 b=WceogSP2umkpLlddhUxzgcb8JwPcGesXE8OMIpu0ZOUQ5Kr6ux9tueUBNC6eOeqoo7iGnwkJcV1Ozm8Iag/vs2ScS2wc3zP5IyIu4tMKXkoxIYafCUiqjkXpxhu6PAZ8ZBg6OIgwkLpye6CBSeMv+Hfz/TZK7LdSDUKuVe5SRTk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB10584.jpnprd01.prod.outlook.com
 (2603:1096:400:29e::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:25:40 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:25:40 +0000
Message-ID: <87wm4ynm7v.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 099/139] ASoC: codecs: wcd939x: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:25:40 +0000
X-ClientProxiedBy: TYCPR01CA0183.jpnprd01.prod.outlook.com
 (2603:1096:400:2b0::19) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB10584:EE_
X-MS-Office365-Filtering-Correlation-Id: c20d51b1-b77f-4bc5-9633-08de0ad9bbc3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ohVUgPPPEflUpmzWEicsgPOiKMWHnwV0ZWBt5jUS5gxegkaxLHThI4OvRb62?=
 =?us-ascii?Q?56FwNVKQZylga/KCbsrmYisQGUcfbOCR2XJMuW36i4gyRGXaIDLnsOwLDLbp?=
 =?us-ascii?Q?59s4I6qAS3FBpBr8N26iWgvvleO33YZsdXEx6IsT9hMxNPhlsrahmr+lA6KA?=
 =?us-ascii?Q?sgfH9isOlAAXaMUoIcPIOdvXEQBhAiYhPAX3vmTLH6xrG/XAOMaUgN4/3WSe?=
 =?us-ascii?Q?3kHvjUpTSDKGNLyP1qt0gM7bF+35G9UL9PZpi6EIibecBptwGSQ/MAivRN1r?=
 =?us-ascii?Q?gvEMLODEJSQxmxUtdtNfwCgsWWkM/0n5DTFoK6T7Jc0UgtT7NCGQVMQfnr4U?=
 =?us-ascii?Q?RBzSpi+9cnWKhPWls+CTQ0d458p9FBElOx7P4XXVuszFPX2lGUeVHy2mYkGR?=
 =?us-ascii?Q?NS0dHgBxRZQ/FgxCaHWl75VPapPYDMuSPU1vOrO8K4OXY0UBToREfsF6fEut?=
 =?us-ascii?Q?9wODFvEMiP+lgBSeJFCCTsqKffWNZKsCPBQ0MofXKLzxd9k3UzQIW6zCazAx?=
 =?us-ascii?Q?cBbAfEqLmUvco8GsoTCbb317cg8IptjX0YFhU7Yg6jYjBd/SFMqAx27NC1vu?=
 =?us-ascii?Q?s5bTMqfUEE97mBrKrihxQ0npubOrmWiIJUz66b5tlEm92U+1/vB1jn7cJwtX?=
 =?us-ascii?Q?Q+8RrZ/7mDxmsX7RwjYrI+h38JiL43W2FvSct+RuQGAlvhV81y5r65wsrLUq?=
 =?us-ascii?Q?hQ70BRd7WWGwdBS+vutkR5pMjn9DwIJBHg6cbuojc9tQHkVFnLX1VA1gAejS?=
 =?us-ascii?Q?opqB0dFokHNe4S3ntBjOFDN/hPWJktqLty91V3IiYrGVVJcgGS2Ys0cwHlfz?=
 =?us-ascii?Q?VrQjNNWpa8NDAVE8ymtb0FADL0dyMeqrSvie9uqTzjDV/LNoZXLKqrj5zxuy?=
 =?us-ascii?Q?e2h8EHXeG+V4OOnY+N16oMfaO3kelEimSOpvlWwTkjvlctfy7DYvf1i0GaLr?=
 =?us-ascii?Q?YDcROkYA9CG82GmBuLE+8+51gYh+0EWC8yDv1Jdfnvw/TW5yvKAY2/+hsDWU?=
 =?us-ascii?Q?CSlgXeG66sKegVEymzZBKAEYZiv+S3e8krVhsFmb00h7ZB8R3fQxIMtUfhTB?=
 =?us-ascii?Q?BnBPrwA76hHsodx4obgKULMPDcc52YR8sb3ZaX1tYYa6jrvw8mzTTJvvGxmD?=
 =?us-ascii?Q?Uc7BzdFmhD46OVG8IG35GUs4Wsaeijgu05Klq1yYUQAZ9vf+NNnKcvkSi7LH?=
 =?us-ascii?Q?DOWusADT2bc6hNN3sfWD8GPWljxrATwnNDFilfBgSBS0UiA0YiAngnnAfkp5?=
 =?us-ascii?Q?wN4uosZ00IcZzACmJTNync3DauHQz/W3/BMWxgx0L9beHsDd3T4VWVOXOeSU?=
 =?us-ascii?Q?I684dgOghWqfvgEbW0R8YNLAi6+xXOgoVWIuqTivcjzzO2GM86JHGL59w7/W?=
 =?us-ascii?Q?WF9yns91hJ0BDcQuaGREwVBD0UO2ncRvWkMdu9a5fzjeOeQ1Yfv0gV97eLpJ?=
 =?us-ascii?Q?kr8D2oQ4NXs2RF1RpoSLaWWDkm4bRHtnfuYx1qsH2z8FjeGcp7xJT9Jk94kM?=
 =?us-ascii?Q?8nU0ss6LP/DfqgtA86cmThgj7xg/Nf9Acnep?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3rayqAQGhR3Q6MD8kU4glWp0DcoBx82xl+wwoYqUBqd4GVRFzcaxY1oxRgeQ?=
 =?us-ascii?Q?bUqq94OC5UczD00po/N9vEXMSqHbUBJvWSJPrvEaKP8NOvakeQetj8zYfdMI?=
 =?us-ascii?Q?/KQ2QpCzAHsk4OpBYcgZFI4V2s9/v357P7zr8ShrGTYkkzOvtcYRavKeRBUL?=
 =?us-ascii?Q?dPeVGz7zNZZnM3KPwQtShB9X3mB8c6JbEA2doJoui+2dRBGQBrjH/Qtr1Nuw?=
 =?us-ascii?Q?nDQq3slyMWjNvG2LFRoFE9EJbYvpscUEYoSRL+QQSbZ5yLIt8h0x8Bziof/x?=
 =?us-ascii?Q?JGRIX3ElDe2sNoiO6fEFYv4UC8zAmkd9YWRCdGHmQ5m5af1QOG7GDZD8W+l5?=
 =?us-ascii?Q?dLHl42Fn8jyh8+D3GaZLiMH8DNGQpvC1DILybniUJDGUeAziUZQ8DJ9Gm1l2?=
 =?us-ascii?Q?oE/2PWvWyRz4aN3+dUNQ98fxuKhyWtsttH4yrHYAL0lFTH7/ONE7QeEiaSlw?=
 =?us-ascii?Q?QPrGcXTmhlVjLB5n3hxqQL2Ju58GEtsgJoGo+O9WxAn4GzGb4EWQygroBFdL?=
 =?us-ascii?Q?wWNyFPPGddMyMto+vAgvbswtPgqwTIJRvi40lnIP3E+YQNjputRjUHSD2tny?=
 =?us-ascii?Q?SnTmZ7urznNXCG5zubQVbhnPnEs9D9MLrfN9ATAp8TxroZuKJZn7IukEuzbP?=
 =?us-ascii?Q?8fJo98EZe25oOIONUmmSmgzw/bpEeQctYFYJUKF4isJlP/PJMJIr+WvCXDf9?=
 =?us-ascii?Q?oKgiTdfpPvK4DfoouX3vab5Vzj8Ma6aUr6ekj7lNLe8eirXOMjTdosHkfGuY?=
 =?us-ascii?Q?rPH2LZaLVD7NcX86vaPTEbmCIcYEWXFj9BAh9OuKXguUTyGcM79WjXK1q0yv?=
 =?us-ascii?Q?15lsOe3lpIdkjFSopMznifDHm3QLFTov2pH4Ic5wy+17jkjgCD+Rh+6zW7HJ?=
 =?us-ascii?Q?hCDwVyPraugFmfouEWd91tSpzylMZjQ0mxbGiI08m0KAFmYVoWtBV/9CmEXw?=
 =?us-ascii?Q?YJB4hzGtHktHDaEbLbf8idKW8XEqjELrJHTTv1m35kO8w3cUazB+GIlSKkZq?=
 =?us-ascii?Q?aBMql4J7ZK473f7gLlH3GhrvS/4tYYYCYQA8wmrcoy/dYJLToIqrUNR9++S3?=
 =?us-ascii?Q?aqvfktzPb90MvPwxxrtnz6alCk0dvLkMM96MsPGCgR+Rk/Jsyx381etqy7/b?=
 =?us-ascii?Q?FItkq3evcKMu0ayct6tZjUEtXmSVRJ/o72T+at8dL9OHfQBKNWGRio9x5NLq?=
 =?us-ascii?Q?7U6IQvAL/l03maWg5rXWkdaO5eiob6Vlqdkj08vRnZ7SboIZyvBc0bgQAG8U?=
 =?us-ascii?Q?74/mdyO8c2nm30FPK4yao+4MBD3U5jzmRTVZ27vm9uiquMWDlmfQwBJmijm0?=
 =?us-ascii?Q?9QVioXZUyk0Fb2R6QJp/bICqybDkiyLt4A7Pumy+6LyCViCklEC/XZk/TzZH?=
 =?us-ascii?Q?QkwBY651wZ8Jn2i4g22+r/j0hVO3QRKX0bi01qbqOoJPr6kKoMa0h0eeoiTG?=
 =?us-ascii?Q?Wm9Ry6ayNLjDfChIlCoMfNEPecrn8q2eAT8uKle6xYaEvVLcoJ51Eq5VkSPK?=
 =?us-ascii?Q?vSHTkcb5Y73kvEgXVkeNvI8cLVLCwESDdvpIsElQbAHcmqCi4ILXvOUP7loX?=
 =?us-ascii?Q?7vDjB7ggn7apIAjYHmZbkZfcJk8O8ou+diEf/qKV/sj3NM0ZdMPLe9gGh5wW?=
 =?us-ascii?Q?EimN1+2C3pbEv7PxlDXdxms=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c20d51b1-b77f-4bc5-9633-08de0ad9bbc3
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:25:40.8578
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6spteqNFgpmDS3ys23t/OQv578NFS8obi9ABn23dC5cvdU86HpPT87qgCa8NXx7/qpPu4WGXG6RYj1jyg2RwHIOQllzSZFE/r/eknVMO4uVabKOe/mpTfo6CZENXV+kB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10584

We have very similar name functions (A)(B). Both gets component from
snd_kcontrol, but (A) is used in callback functions which is registered
through snd_soc_add_component_controls(), (B) is used through
snd_soc_dapm_new_widgets().

	(A) snd_soc_kcontrol_component()
	(B) snd_soc_dapm_kcontrol_component()

(B) is using very picky way to get component but using it is necessary in
ASoC. But (A) is just wrapper function to snd_kcontrol_chip(), and directly
using it without wrapper is very common way on ALSA.
To reduce confusions of similar function, let's use common way on (A).

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/wcd939x.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/wcd939x.c b/sound/soc/codecs/wcd939x.c
index e74e6f0131318..7c5dd04843842 100644
--- a/sound/soc/codecs/wcd939x.c
+++ b/sound/soc/codecs/wcd939x.c
@@ -1433,7 +1433,7 @@ static int wcd939x_codec_enable_micbias_pullup(struct snd_soc_dapm_widget *w,
 static int wcd939x_tx_mode_get(struct snd_kcontrol *kcontrol,
 			       struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct wcd939x_priv *wcd939x = snd_soc_component_get_drvdata(component);
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
 	int path = e->shift_l;
@@ -1446,7 +1446,7 @@ static int wcd939x_tx_mode_get(struct snd_kcontrol *kcontrol,
 static int wcd939x_tx_mode_put(struct snd_kcontrol *kcontrol,
 			       struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct wcd939x_priv *wcd939x = snd_soc_component_get_drvdata(component);
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
 	int path = e->shift_l;
@@ -1464,7 +1464,7 @@ static int wcd939x_tx_mode_put(struct snd_kcontrol *kcontrol,
 static int wcd939x_rx_hph_mode_get(struct snd_kcontrol *kcontrol,
 				   struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct wcd939x_priv *wcd939x = snd_soc_component_get_drvdata(component);
 
 	ucontrol->value.integer.value[0] = wcd939x->hph_mode;
@@ -1475,7 +1475,7 @@ static int wcd939x_rx_hph_mode_get(struct snd_kcontrol *kcontrol,
 static int wcd939x_rx_hph_mode_put(struct snd_kcontrol *kcontrol,
 				   struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct wcd939x_priv *wcd939x = snd_soc_component_get_drvdata(component);
 	u32 mode_val;
 
@@ -1520,7 +1520,7 @@ static int wcd939x_get_compander(struct snd_kcontrol *kcontrol,
 				 struct snd_ctl_elem_value *ucontrol)
 {
 	struct soc_mixer_control *mc = (struct soc_mixer_control *)(kcontrol->private_value);
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct wcd939x_priv *wcd939x = snd_soc_component_get_drvdata(component);
 
 	if (mc->shift)
@@ -1535,7 +1535,7 @@ static int wcd939x_set_compander(struct snd_kcontrol *kcontrol,
 				 struct snd_ctl_elem_value *ucontrol)
 {
 	struct soc_mixer_control *mc = (struct soc_mixer_control *)(kcontrol->private_value);
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct wcd939x_priv *wcd939x = snd_soc_component_get_drvdata(component);
 	struct wcd939x_sdw_priv *wcd = wcd939x->sdw_priv[AIF1_PB];
 	bool value = !!ucontrol->value.integer.value[0];
@@ -1557,7 +1557,7 @@ static int wcd939x_set_compander(struct snd_kcontrol *kcontrol,
 static int wcd939x_ldoh_get(struct snd_kcontrol *kcontrol,
 			    struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct wcd939x_priv *wcd939x = snd_soc_component_get_drvdata(component);
 
 	ucontrol->value.integer.value[0] = wcd939x->ldoh ? 1 : 0;
@@ -1568,7 +1568,7 @@ static int wcd939x_ldoh_get(struct snd_kcontrol *kcontrol,
 static int wcd939x_ldoh_put(struct snd_kcontrol *kcontrol,
 			    struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct wcd939x_priv *wcd939x = snd_soc_component_get_drvdata(component);
 
 	if (wcd939x->ldoh == !!ucontrol->value.integer.value[0])
@@ -1789,7 +1789,7 @@ static int wcd939x_get_swr_port(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
 	struct soc_mixer_control *mixer = (struct soc_mixer_control *)kcontrol->private_value;
-	struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *comp = snd_kcontrol_chip(kcontrol);
 	struct wcd939x_priv *wcd939x = snd_soc_component_get_drvdata(comp);
 	struct wcd939x_sdw_priv *wcd = wcd939x->sdw_priv[mixer->shift];
 	unsigned int portidx = wcd->ch_info[mixer->reg].port_num;
@@ -1816,7 +1816,7 @@ static int wcd939x_set_swr_port(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
 	struct soc_mixer_control *mixer = (struct soc_mixer_control *)kcontrol->private_value;
-	struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *comp = snd_kcontrol_chip(kcontrol);
 	struct wcd939x_priv *wcd939x = snd_soc_component_get_drvdata(comp);
 	struct wcd939x_sdw_priv *wcd = wcd939x->sdw_priv[mixer->shift];
 	unsigned int portidx = wcd->ch_info[mixer->reg].port_num;
@@ -2432,7 +2432,7 @@ static const struct wcd_mbhc_cb mbhc_cb = {
 static int wcd939x_get_hph_type(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct wcd939x_priv *wcd939x = snd_soc_component_get_drvdata(component);
 
 	ucontrol->value.integer.value[0] = wcd_mbhc_get_hph_type(wcd939x->wcd_mbhc);
@@ -2444,7 +2444,7 @@ static int wcd939x_hph_impedance_get(struct snd_kcontrol *kcontrol,
 				     struct snd_ctl_elem_value *ucontrol)
 {
 	struct soc_mixer_control *mc = (struct soc_mixer_control *)(kcontrol->private_value);
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct wcd939x_priv *wcd939x = snd_soc_component_get_drvdata(component);
 	bool hphr = mc->shift;
 	u32 zl, zr;
-- 
2.43.0

