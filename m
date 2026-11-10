Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.229.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794288216;
	b=rIlS8yUP4vB4lXtzgyOdIhEfpIx/Wnu77yqDZ8RHX0RRuUqgQ63U9GFJ8oJ7B+DPEJsK
	 TI9idgFoJ+bk9tGqoD4iwdDZBYOicnt1x3OA4NqJBZ5ZMZiHEzMfO2SgweXyd6E2wLvm0
	 4rVJMxQkJ1gj5PzeVVCDkBOlPS0UGgtwX0HLT2WWHUb9CT/R/IHhJDvHRP4fkGfknuRY8
	 XO84Qx38Dj8JHsWdqyIRxHsja50RM8dUqz+VRDyu/QxykMBXNoWcIJ50EseCMfw6wy0DP
	 vTijmw0sNAk7OFZJSLKxvvxw0WGlu0P7QpabUUzgbUiP05IXMG4AU/6vX6inXzwcgVw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794288216;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:From:
	 Subject:User-Agent:To:Cc:In-Reply-To:References:Content-Type:Date:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=WIUQGPRBdAwrNcshhOKCNucPxNqDyzbsg8l/iSfJbXg=;
	b=ZlpvuBdSDUbXuTmBeiy25fgfqCgF2ceEKQPvybKpqHbFjY97j/zPuFx2bEhOqWqGrhkJ
	 d9u4FpWfMB7z4+ZL9RhLi5H6jBPrmb1xPSnxX7KQlIVjBjGLGzMe/mmF1391x6D+CkrXx
	 VrKrJKeuKkYusEJ87l27hkR2hbU0n9u42KcDpaGhjKaU0CK0uejSotYa+tPyfoNyiL6qG
	 2o5Qqs8HDSj/BN8iFeZ0OLOp0WhDo3nLX6Z6njYtccmajQO+6RqYCf3tAaijms5/hnw8y
	 P9LIBOwNsINO2BjRGLkXvfmrmS5Ayu14hhy3CdqeXvWk+S5veZewy4xZUWk2Z8uMsNA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=VGyqKt6H;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.229.50
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010050.outbound.protection.outlook.com [52.101.229.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 241B7606A32E
	for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 05:23:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 241B7606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=VGyqKt6H
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gr5xNGVC4bKt/qdFy11iVnjn7fpckjRlxVtfeL1Vu94AxO5CxZPiE8/I8iEBGp+jP8sFX0hMwua4VDONrzBlQo8EOCUS4x/jU5c9sNP3vUTaNztRCZ+CbPK0VfXe6AfDP2yTRSBK32lpuPlfDPcyHQk9mgE2hpEAOSfPcu2IYFCYwmceqnl0LFXAx7zFkHsO8WaFwk6SXkeF+H0GUjxvPJpNaOyXMMw4BfuIqMv+YVnxGb/PPTNFuC6MaEt9KHwdCkYuVmvhUbqfAVhB2XifMAguP1Wswli412J/yUHyMcjDEVwxiQrJR43zIJlgH3SmKuROGSXnpDPC4Ml8U5hzFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WIUQGPRBdAwrNcshhOKCNucPxNqDyzbsg8l/iSfJbXg=;
 b=uq+mB68Hf5099h63Sxh26zeI2KtyX9F7L9bxM8VanItf29/BCG3ju9NhvMtKO3qOnXy3WJhKjGsnFOYqsyUWwp5tP9vG1C/WAFVSIXG7osUAdgegTQS5XF2UugSSgr7Am126DaQujhnELZpe5jp2u5fmKzgLkKkXUo/qKzhL0M25lqZwWp+ZjWsEgs3UXyeUUANngApF5t9bjL91R4Xp7Gmu1KuGbmN0SNSshBlnokBGAsg3e8LO33OupGH3cYuYnBec4YGH9QJwDlO7SEQ2Go/pWXnzdld3RUMlLdJiJS8tN2iPRte73IoEIjMmjIN/y5YWRZU1shkt5ExUgT6CZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WIUQGPRBdAwrNcshhOKCNucPxNqDyzbsg8l/iSfJbXg=;
 b=VGyqKt6Hqdtfv6vlOoXPV6M7fjUZH7QcrHWOTp1Oac/tBkT7aumzdEVGqmXdC1jremRNaDuT7QjPD+S1AFyWJujR78oj1wPr3kcMosg5cCxWx2Tz/ffMWspWukwFaRGm3FoZg2X0EaQlbPzFKTaanOSph93YkmQM7cOxsZpLeAI=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com (2603:1096:405:27d::8)
 by OSCPR01MB12483.jpnprd01.prod.outlook.com (2603:1096:604:32b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Tue, 10 Nov
 2026 05:23:34 +0000
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d]) by TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d%6]) with mapi id 15.21.0592.012; Tue, 10 Nov 2026
 05:23:34 +0000
Message-ID: <877bilntt6.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 01/20] ASoC: soc-generic-dmaengine-pcm: move devm_snd_dmaengine_pcm_register()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <878q31nttj.wl-kuninori.morimoto.gx@renesas.com>
References: <878q31nttj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 10 Nov 2026 05:23:34 +0000
X-ClientProxiedBy: OS3P301CA0028.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:604:21f::19) To TYYPR01MB15175.jpnprd01.prod.outlook.com
 (2603:1096:405:27d::8)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB15175:EE_|OSCPR01MB12483:EE_
X-MS-Office365-Filtering-Correlation-Id: 35a296c4-b90d-4180-5215-08df3eeac3f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|52116014|366016|18002099003|22082099003|6133799003|10067099003|11063799006|261022105027099003|261102130727099003|261102123227099003|261028144727099003|261026121527099003|261009223027099003|261022075727099003|261026140227099003|56012099006|261021123027099003|261021121427099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	Wcg3O1n9YTch/OQcSQT6Haa8uYNEDqrGwlNVZBM3/3gU17Dpb7wsH/pkF983xUabXK98KQRLQ7NOxsJMzanfqx3LR785igjqIqBYqQGMNxBnL0q1sbGpfAIJhKgVMqsa0SnaAitao9QOfPaCcnh+EY5FY60wpbhEoEHNhaZYm33hbX9mphzkfvdg0yqU6GckOAJr0rArAmtVErKaYqCiC1H5Edt2o65m/Q6VbeLyQK9dxJbSSoHgO1UWwnU2ve5XDVpNLxxlJd/i6Zmwx6Oyb6yT6Wni5U3F8mbHGJ8eZD0a+wG5dPeQwh4xOxCD513Mzsq5/gs7GAfTQnPTxbAD7M8eyesLhUXLBwDrd7kAESDIROYJTgA9wn2kuHOUDll/mA5OEzGa1Lv1tn5unbcZQaJgaUBOVirYaxMJ8HD7e6qa+qs14KhWUKdBEcYHQhPC/AP2LyrfH6lujaEQpdnkzSU+qMD8kyQxVqRd9KkuflyWZg8ahEdG2zotaafxK1kt+B5MKHVRcwMSAzxzQnOt2Mbrle2Nqy2qZMbL5fn4A5rynDwWLty/UlD9bK/VR9E8yY3eYRjLHJ0Fa3kUDsY/jBZe58aB5IlrOhx6sQCE28dPMxELXBn2oFjIH/ByVKvUxQ76MlBMJWmwt59ztBNC8nINVc7D/MVV7kMCaMiuK17qiYPsjrU3FBM40Qe6/sYjCYCm1oNska/qXH5JoCAYNA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB15175.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(52116014)(366016)(18002099003)(22082099003)(6133799003)(10067099003)(11063799006)(261022105027099003)(261102130727099003)(261102123227099003)(261028144727099003)(261026121527099003)(261009223027099003)(261022075727099003)(261026140227099003)(56012099006)(261021123027099003)(261021121427099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+3uUvR4xEgprsN966PQVxHTXNWeKqQ+6/2dS5KI9r+iBzOxCeBCUMOQmr048?=
 =?us-ascii?Q?4Uc6Z217TfzTcFdDw7VIKOImOf3hvnKji+aUrPviZA5+OJJtGfGbsjWG5dX/?=
 =?us-ascii?Q?yEyr9eNUFfjwpgtJyp2hII2UX/11OQtFKG8qaJzFQWv8tvvjiDSN9nwwzX8y?=
 =?us-ascii?Q?1X8PlHLv/zYZG0Irk2e48IOny+4kc+ny39iX3eXekteCu9gDawH6R1Vkd3Li?=
 =?us-ascii?Q?qSkTa0HG3lrdh77Z1VWYQ8QWOMkRtb6j9r5pmJo+/Zlizk2MgfBwCbuoFdjE?=
 =?us-ascii?Q?2swEV/eIK5ePLEnl67BpPIap3ntsAaxoNwQy/Qmcl6Tg8kRAPk1C5Qmkremu?=
 =?us-ascii?Q?X2YTLso0zedQuKUzWZy+rRl9wNyCyAGp908/FTcSYlw9jOmLYodfaEPpfuE+?=
 =?us-ascii?Q?guu/XtEHKke1QjsuOE0qUp7yfMmNvfPIauGCSxUfnk8l5LK+cCa4CeogqGrN?=
 =?us-ascii?Q?2AV/AwOJIIn2EFdbWl5qB+GwPMlitX48q4UO5Hdhm5OslR2Qb8/p6IP9fbCw?=
 =?us-ascii?Q?1Y2DpjHrVh8mrvo8RI8PyPQQeC/+sa66vmvci5N74cT6Hh7LlBl064EVU16P?=
 =?us-ascii?Q?MzW39bSQUiDctUF5Xq8jHeZMlj9vvq4hPU1SmVneTKAeHVoaTmKtPmzuGxka?=
 =?us-ascii?Q?R9ZiALW80x5rRJel5Z3DOllBgFFV1bxKuufrvytRIeIWX2QsBWXW4hwjhelT?=
 =?us-ascii?Q?W+j1+OXIVpPsqH6HhDhplWvHZsKi0528u5hRiZTaZFaQMt1Plo4bb4wjMtnV?=
 =?us-ascii?Q?87jIPY/+6tJPyizNXB0hhKH6CPTURZkak1X74+rf0lIE5np1R2fXO5BOZL4K?=
 =?us-ascii?Q?LDQliK/nYqJTec+oeP8qvsDxdPFo5CvOSJguU44OuN9beKSq5H39PCgCDCwK?=
 =?us-ascii?Q?G/KURJ6RceqCraYMbLaNgLVHmDcEibTA/F9eQ5YUP7Caf089ArfRozGcrQU1?=
 =?us-ascii?Q?De8fqrNBIvwtPlMmtlcmddo2kAiX8Ob1QHFLr0Zl6iFa7Fp9kDM0J24a2yB+?=
 =?us-ascii?Q?EPiKXo2/x2nB7Mn6CjKzfH7XGkfDrnGVFRwPeSy5irUi7Md10fZQnDTDYm0G?=
 =?us-ascii?Q?YQQMm4soBIQIUmHVHggFj5wktIUYy+OZdkMkguF5RxKineDfO+VVHNJKQnTQ?=
 =?us-ascii?Q?vEnL1Lz3uNEnjMWXo7/vXKj83+45tBYiSLfETW/L54TeNdHP6Q/RltSzDcRr?=
 =?us-ascii?Q?6nVZCFizOaS9WMPCNmvwwIuy7cG0L+ICesCnQ7rRP7ahu02XOTo9DXNJEkMw?=
 =?us-ascii?Q?hj3/tpyyk9UWdzzlXky3b8i+kxzB/M9IqSXty6DqdkrakrYkNIvCyhUWFY8g?=
 =?us-ascii?Q?QE813ue++gURjTYQiddKTBKrHmE4SCeYbOuzTiTTBFQzNZCfgvxzQwD+mpta?=
 =?us-ascii?Q?LDJkDLewMxE82xzRTv3GVk22keMwdfK2nYQ7jHV3TofJymsCjeHuMaso3vJd?=
 =?us-ascii?Q?0kYNXgLx8anoY9uskumnQLpkZzWNk4j+iuxkZCfg6oxt95b5O7Yl8LRZS5GG?=
 =?us-ascii?Q?EiLiurO6W+RPPT/PFbLzgt8zi3+1/unFvYjtOtoO3ZPhTPSXtANfwW+338UB?=
 =?us-ascii?Q?aWnpnxHkMNikXrhK4SRTTXcB18G9Qp9dpj3fIT30Q+/qtjKUqbX/VnkBQbaq?=
 =?us-ascii?Q?PnYouuhn7bdfTPUyl8DIG95c9CxDEnHr875JFwbb91F6/ZNzsZUBOn4eF4ti?=
 =?us-ascii?Q?bX2/8aqscpfO+BBOeUvQOJeB3Wd3sLr1Ieisr/7ysqZ4nyASPzMccLFf++z1?=
 =?us-ascii?Q?fg9Kh05qAs6PrLwiSfJPQfpD8BtCb4s=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35a296c4-b90d-4180-5215-08df3eeac3f9
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB15175.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 05:23:34.2538
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xrytDN/yDZu/4U5akHgtVL9egGRR16s0gvigJfmowdYH0m3yYIIEOcuYjLLsRbcBI9nmGbkJH5/VRv1AzM5c5DJBfCCYlCkcfgz2jJHMLXcjKMU1KmNGavIba+ZWzKxU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB12483

We don't need to have dmaengine related function in soc-devres.c.
Let's move it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-devres.c                | 40 ---------------------------
 sound/soc/soc-generic-dmaengine-pcm.c | 36 ++++++++++++++++++++++++
 2 files changed, 36 insertions(+), 40 deletions(-)

diff --git a/sound/soc/soc-devres.c b/sound/soc/soc-devres.c
index 718165ba84ac8..ca6c29b54f6ab 100644
--- a/sound/soc/soc-devres.c
+++ b/sound/soc/soc-devres.c
@@ -63,43 +63,3 @@ int devm_snd_soc_register_card(struct device *dev, struct snd_soc_card *card)
 	return snd_soc_register_card(card);
 }
 EXPORT_SYMBOL_GPL(devm_snd_soc_register_card);
-
-#ifdef CONFIG_SND_SOC_GENERIC_DMAENGINE_PCM
-
-static void devm_dmaengine_pcm_release(struct device *dev, void *res)
-{
-	snd_dmaengine_pcm_unregister(*(struct device **)res);
-}
-
-/**
- * devm_snd_dmaengine_pcm_register - resource managed dmaengine PCM registration
- * @dev: The parent device for the PCM device
- * @config: Platform specific PCM configuration
- * @flags: Platform specific quirks
- *
- * Register a dmaengine based PCM device with automatic unregistration when the
- * device is unregistered.
- */
-int devm_snd_dmaengine_pcm_register(struct device *dev,
-	const struct snd_dmaengine_pcm_config *config, unsigned int flags)
-{
-	struct device **ptr;
-	int ret;
-
-	ptr = devres_alloc(devm_dmaengine_pcm_release, sizeof(*ptr), GFP_KERNEL);
-	if (!ptr)
-		return -ENOMEM;
-
-	ret = snd_dmaengine_pcm_register(dev, config, flags);
-	if (ret == 0) {
-		*ptr = dev;
-		devres_add(dev, ptr);
-	} else {
-		devres_free(ptr);
-	}
-
-	return ret;
-}
-EXPORT_SYMBOL_GPL(devm_snd_dmaengine_pcm_register);
-
-#endif
diff --git a/sound/soc/soc-generic-dmaengine-pcm.c b/sound/soc/soc-generic-dmaengine-pcm.c
index c7523bae45af7..1ecf3feb2bed0 100644
--- a/sound/soc/soc-generic-dmaengine-pcm.c
+++ b/sound/soc/soc-generic-dmaengine-pcm.c
@@ -520,5 +520,41 @@ void snd_dmaengine_pcm_unregister(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(snd_dmaengine_pcm_unregister);
 
+static void devm_dmaengine_pcm_release(struct device *dev, void *res)
+{
+	snd_dmaengine_pcm_unregister(*(struct device **)res);
+}
+
+/**
+ * devm_snd_dmaengine_pcm_register - resource managed dmaengine PCM registration
+ * @dev: The parent device for the PCM device
+ * @config: Platform specific PCM configuration
+ * @flags: Platform specific quirks
+ *
+ * Register a dmaengine based PCM device with automatic unregistration when the
+ * device is unregistered.
+ */
+int devm_snd_dmaengine_pcm_register(struct device *dev,
+				const struct snd_dmaengine_pcm_config *config, unsigned int flags)
+{
+	struct device **ptr;
+	int ret;
+
+	ptr = devres_alloc(devm_dmaengine_pcm_release, sizeof(*ptr), GFP_KERNEL);
+	if (!ptr)
+		return -ENOMEM;
+
+	ret = snd_dmaengine_pcm_register(dev, config, flags);
+	if (ret == 0) {
+		*ptr = dev;
+		devres_add(dev, ptr);
+	} else {
+		devres_free(ptr);
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(devm_snd_dmaengine_pcm_register);
+
 MODULE_DESCRIPTION("ASoC helpers for generic PCM dmaengine API");
 MODULE_LICENSE("GPL");
-- 
2.53.0

