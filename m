Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011046.outbound.protection.outlook.com [52.101.125.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57469249E5
	for <linux-sound@vger.kernel.org>; Tue, 20 Jan 2026 00:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768868091; cv=fail; b=S1ATs+PRwTFKWrjO6EaDjUae+UDFfmeISkanG8kvpBnRkOe7HM3+69tlHVQXt9q+ixKs5B+u9af4ebk0JOhI/ODdL2XQfb86Y6JR5U951ofGiUqqqSS0GqU1zA7qhHmH64Gy+DJcvgl4hfpSgiXaslILIAf2T7kYjxULBhhIVEQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768868091; c=relaxed/simple;
	bh=tgLKSTx51n6IZ/jERhpirO4TSS0ZoVL3393EuZGebPU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=ZXA5lEqph4Vn/5wSbfgmmmMix5Be6fzUSLb1cGgGSLd/K41ilOrMdWaFI3QyBbH29CKoy293TLwDzel87dLpW4jXxKD41bAtRGcRVkqIztoEX4gnvdeDMN3tmS0VU8P/mv94XT8URQCPEqDW3KV0hr4UX2wozyRESZioS0QIG6E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=KtehdWJT; arc=fail smtp.client-ip=52.101.125.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="KtehdWJT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jucmkG76WxZ90xbPAmU8ziQe9OPqJgRATFO+QaAMFDQPuvh2zpYVp4iUdlBlq0DO7tWeHtD0mPpHGXeQVyF9G+nFaFppja++ZYadyXTJiMZOGVCZO/FPLM1g3yGqFA+7ZbjpvwgUt4SF/dM3xozSliVF26wDX8NIMpYzo5C0Xm91G/rdVAjjTM3hENNpoI6m5GG3FJZAHnAHKn1UZG3UMlDamMcQQXHyPdw4Z/xXb0ItUrmaMB2fyl8lR75a1RNEbOWQzh6G6ZG+bNQL9ULgZwxn7rgKEp5lM/L4gpJxi6jggJejcLo4aH/OxjPEHMStR8hI53IqsCUOAnzI9YUWug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eQgKpIIf6NCFnGdRIf0Ip/+jDDNxhZu3Al+JmMXmcLM=;
 b=KulV3+NaynFq5hpzxlA0XOYd8RdFRyvdAJeNDVplLbWvpeHG5crgV+4WazUROaJ6HqXxVeuexfwdEs/G2pxeqpsHVKfiuyyN+Wo18Pe4wn+X6oEglYOi4llZpEY5moLsuFzpQQlfxYCT5JqO2HuzRta5gqv8TIjn2SQcQUr+PSSpR+UHyvkfvQO8wewJRTO7am2dHToi9dkDn/O5NXBuuwwxc2OKyhtJHknZwq9YUp6lYmJWU8wlOH6Gsh4u1Gfgv21P6+bG5S1oCmoCyCu7nQL/AWwp5VYHX5Q5kiwktHxl9Qqha5CBMNV5pPE3fb/cwpcwzYbbwcL4f+XH+YuFCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eQgKpIIf6NCFnGdRIf0Ip/+jDDNxhZu3Al+JmMXmcLM=;
 b=KtehdWJTwRpdm5xQusEIjfqnHiQQ1m/HnG7TeKUqReXqYInCnW6XGHEa2isYQ2fYew07ntkEnmYJsmJzsl5ShBnuP/PDxfS5wtnfTIqduD9K7IwmtN4yfFB3zeDA8+PttMGqK9pwfE639/WexoducoacF/qI0GSHP+EtyCmHzeA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB13067.jpnprd01.prod.outlook.com (2603:1096:405:1bf::6)
 by TY3PR01MB11799.jpnprd01.prod.outlook.com (2603:1096:400:3dd::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 00:14:46 +0000
Received: from TYYPR01MB13067.jpnprd01.prod.outlook.com
 ([fe80::dac1:6ae:15b:67ee]) by TYYPR01MB13067.jpnprd01.prod.outlook.com
 ([fe80::dac1:6ae:15b:67ee%4]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 00:14:46 +0000
Message-ID: <87ikcxqgw9.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 5/8] ASoC: soc-dapm: remove dev from snd_soc_dapm_context()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87pl75qgxt.wl-kuninori.morimoto.gx@renesas.com>
References: <87pl75qgxt.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 20 Jan 2026 00:14:46 +0000
X-ClientProxiedBy: TYCP286CA0359.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:7c::13) To TYYPR01MB13067.jpnprd01.prod.outlook.com
 (2603:1096:405:1bf::6)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB13067:EE_|TY3PR01MB11799:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ef1c4b0-241b-41fd-073c-08de57b8eb45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vzJ8zGcMXvvWAv6u4JzN/fOo2HCfrdZyWfPZ9zOyzL5jJ4rbW5XypkUKDkDA?=
 =?us-ascii?Q?sEIf7kfsx35eySwSWaJU7nKdpXc2ORjJOZ2J3h7qsDKIkmyV4yroSu+8La6N?=
 =?us-ascii?Q?jbU7zGUriFjvsKOYvanFQaZuZOjMC3hUtzaFhbp55onfn+K6hXTEJAtMCav9?=
 =?us-ascii?Q?MzYH+aNKEY2q4c8MC6L19E8vkOBf6ljW+lcC0d0D+pmpFKxuLfDAmCm140jY?=
 =?us-ascii?Q?gFjZe4GSO+0sauptZtLuNmh7doAkWL+OAfdLj+GLmAb/wIZUVOoFYPtiqxYR?=
 =?us-ascii?Q?rwO9xg+vlLTvlL/c0wqDCa31ngyaSTrH5V3jsFkWRy62RE7BWmV57oCiOnTt?=
 =?us-ascii?Q?Z0avewD4Deq62WXtaFn6Pq8eqMT2cxJJ+dogWOCHy9BMz5w5Iofp12X1OtJ5?=
 =?us-ascii?Q?J1V5uJrkK/1wq9bWjtnEVjJfdD9mguF7ComA+eZfnwPkqyNda7xXcTK89P4U?=
 =?us-ascii?Q?AqxlAt8nc/GqUSmRg5PGcVYCfC7hbxTfjdY25dFPfERUftC+J+ORpFQZd+y0?=
 =?us-ascii?Q?BXfS6UkWsz1cdjQJ72Vp6PHuRtSf5yF8jfHbNB1fdVI6X2MMlY3GBTbr0bMk?=
 =?us-ascii?Q?W+kQeCBi2DFEbmbt9Pqq7mHo1UfmK9NgXUIeN//1PaynEb7ECh+tDHG+F+g+?=
 =?us-ascii?Q?di3mkDKO49eIlcn+TLo3RWxbQ8lUysG7Cwm2QN2rVIFnhsV9kArRlSwuRcEJ?=
 =?us-ascii?Q?Kz+IjOqeMpYTWuzhnaE0MU9qWY4ARun40bOyChUCikEOP0qcciETvaMGX+Ca?=
 =?us-ascii?Q?QUdxbNGTgY7ahTFWFcUl2oVk6qvlb10xRXdgSvRKISKcWEZi8/+uxFJOQODK?=
 =?us-ascii?Q?55tjA9Mpcf/MHaWLy5BLeAzeYficlTUKOhvZDQ3nDeyzL3quTXt+AH5JULA1?=
 =?us-ascii?Q?xymG/Xo/uvSo3Py7B7IgA/gU9dOx6zCmwqyRzT4niYlWalR7rcTS0m3ovNMC?=
 =?us-ascii?Q?pUYFl+o3Ds0Fx1h0G83CUSqLFnVBTpbT/xLqfUuLVDAMwH+ExU0/Kcl6A1iZ?=
 =?us-ascii?Q?kYcUmkUrFEwEZaBjo1mdShXq4qyBrTxZpyYfVyhJco3sh1bQbb1zna66rOMG?=
 =?us-ascii?Q?RQ/vylS22RUZIPU92MykBArXkrIPsSgVVzQrBTNq1Dk3eUYLVPH3K7ScA6w0?=
 =?us-ascii?Q?FVnf1vd8kv4h/N98/KA2AEb2w4XSm8YYWUGLU8667nOiuthG3CxioclXQthH?=
 =?us-ascii?Q?3khIcMyhG5gpoHCQjWvnOfTiGbaGAd0q5c2qPrmX/KX57HZqLid7bx5z2g7P?=
 =?us-ascii?Q?h4wskbJPaY89A7OvkB2AbffGKwQATHVQsS2DEdTYn+Evam1fc6kxV9sAR/Em?=
 =?us-ascii?Q?Gxm3IQvwsAVur1UcLBspEwURfQ7a5cU/aMPuVLS5AHLvo+azx4eloBPrrCRQ?=
 =?us-ascii?Q?lOfOBaOHinkleQpi6TIc76oVp1wYzdHgwHLRoMr7mh7sIoFyigDhkFIvUksp?=
 =?us-ascii?Q?g8kP7XIrP1fIl+dGYHUnHfQC8FR5T+zOMRQcsPN37QOOCisbluJLVCpb/HcK?=
 =?us-ascii?Q?oGTvVYzPZfhUJnWah3XgMgQVXNoehJDejB45Be51gFNlzWN6E4P3kkkRPq6Y?=
 =?us-ascii?Q?W1VoNjY2eaJ0rtEC/AcvlRSY8ZSZ5y9OD0oALPbV1JBXM9Bzmd7dr414eRzv?=
 =?us-ascii?Q?A6p6ixItKnRXDOSkLgTykDY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB13067.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7bR9/YuAGNac8buEednkK0ynyf/YXb7qnouXJUWZL2aBQNlJlXHjZccMeSrM?=
 =?us-ascii?Q?x8P5geepAudPJakcvCOMYoX3C9jxYr3Z6IlGx35eJJDC3B01CXiJhHDMvknS?=
 =?us-ascii?Q?7FtLgsXLQ79YvyNh9wanc5uZQMs7zudOvV/C3Q8UBvvXJOTS/zgODvUdfhjE?=
 =?us-ascii?Q?PjZkO0O4aUuulGax5RUQW7gfl1YaO38ajf+6PZjrGfHaE9+GoPMW4IHiFoZI?=
 =?us-ascii?Q?BkldEfCMTLBcf6YuXcz55d4GRg2jL9shyenRl/m+hYxUTcj/TLXsbMnwoKUu?=
 =?us-ascii?Q?JxD8KaGgSHnYR8S4r3oMjHUp8zHSHAUcgWuM88GZlTyKwdUTgnhT+khkd71L?=
 =?us-ascii?Q?exdVisbAjEziPmQ+5TF8vYRqtjowqiqZ1PwAKZZEr402eoSOxRqvxfjkBWuI?=
 =?us-ascii?Q?rSDoESbawH/DdZvITDoo1V6hh/8R8mKqSDj93bkskk3ubMht/WVFPGJM2R9x?=
 =?us-ascii?Q?UGUzgw3bJyFdRV3VMRrTNbI4xN0jth7EHw1JukvAaoMCIiR+3tB118ErFdQQ?=
 =?us-ascii?Q?EHfqZENK+EQ/QIfknmpfYjvv5lP93f05/BaHHqdEQlhXQMejqIcM1t0HoReu?=
 =?us-ascii?Q?r3j70NDvF3vqa4Xt3pyno7ML5kj1GW+eN5er6mTMOwuolYaLgMCiya6Ogac2?=
 =?us-ascii?Q?qcD20lAKevxb/GDFtTDk1yJfUf/8xxl8or6ncfFSCNzdGlhDJE80ntVdXhQp?=
 =?us-ascii?Q?YrERJLfG8CqlFVdeUdCEniDnKUs8qLMghXYNHlRHN37NR/Mka5+eOXwfGM1c?=
 =?us-ascii?Q?H7GDp8B2ld9QgJdUXDCYDj6BzXAmna5R4AoyXdiH5sMONfVR+iixte88TWDY?=
 =?us-ascii?Q?g6BPi6DpJELwttYHdcBzU8b7q1Wictj9Abi2MStmg6sSTQow21Fg3/KhcwHd?=
 =?us-ascii?Q?WMnW+njwr3PWCzqmRDdeBQtBhmbURi4uaJtL3E3mTIRqzTuV82od0qAueieC?=
 =?us-ascii?Q?sZOCZp4WtpkIUiWUMbBhEpLgL1HIGnL806B6ScbyCZ0xhac0+nDuM+QTpb2U?=
 =?us-ascii?Q?qFGm/XuIZsDXs96vcr2iuurpUogLe6vB2iLrab3hv7k/PJqfKksLvEaH1RF6?=
 =?us-ascii?Q?/U+I6LlUhUf9PSW8bY53SBLfreEUdi08mUFMwQfBMYg9gNZ0lUkGM5gNu/+w?=
 =?us-ascii?Q?PnlWY/oyDcMLwyvs3yjK6VNMPRSTAOzXI1f4qbd6YWrPHxQCVJ20WrilhIGG?=
 =?us-ascii?Q?+BftgCcKBFyTm5f1csCO7beLBUqh/GgdqfTKIiYKgHR/fTxW/lypx6Sj6Q6j?=
 =?us-ascii?Q?Ot4sdM5PRvrS87StQWzu0p294l2BpVp/aQPvAWm0fx4oPh8KzbPz8qsm1ogP?=
 =?us-ascii?Q?Zi321t3WdrjJoLLzv/vVf/zRxQfBNrEew39XeUpYUXQwt7ikNNwfABDPsT/T?=
 =?us-ascii?Q?Z/0kInVdRslJT380/GcxyYBv7qld1DyZaRJSF0YbDA3Nc6SB+jbSQn38g8AZ?=
 =?us-ascii?Q?qXWv/8zI5b1Zs/mWs8sg8IZMbwvgYlSKzITXl2ss8iGujoOpl4+60q/CKnpC?=
 =?us-ascii?Q?7i2wXasPUd/nWofgYP532dQ2xA9zPteNmCGW+QudlYxjNI9pWj5lGRXj6lXR?=
 =?us-ascii?Q?YnfSjXx72r3harvaPb55MNYJS3RNI4rHYVwAdFCplXN1x9FiKHrBa/mlliEu?=
 =?us-ascii?Q?xLInmag2sLjpbVtEJxCvXDFfBbplfOvazC0oo4+GqTuoqR4z0sTlg3NOD8I0?=
 =?us-ascii?Q?+P8FJj+mxBEvPyd/OEwSitpNY+3/EcvC617UmkywTUqofgUQROj1ZpFK6OOI?=
 =?us-ascii?Q?WZySU70IYnnvKBYq/ZTZL02MNrY89mEMStCXvypJ7tkkvSu1vpxi?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ef1c4b0-241b-41fd-073c-08de57b8eb45
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB13067.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 00:14:46.7495
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t9IObfjnZoXMfLeptzq5Ctrrc1its0GfjDQJIyK+9f4prDvwPkT2Yf1lHxQeLfuGtfPMVWnzAEUctGcUbsEKK6YbJQ5sXtE7nFMnTFse/LqzeRyfwhleIpiaFx/y66ou
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11799

We can get dev via snd_soc_dapm_to_dev(). Remove it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-dapm.h | 1 -
 sound/soc/soc-dapm.c     | 6 +-----
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/include/sound/soc-dapm.h b/include/sound/soc-dapm.h
index 7d3ba38260765..010d63db5436b 100644
--- a/include/sound/soc-dapm.h
+++ b/include/sound/soc-dapm.h
@@ -585,7 +585,6 @@ struct snd_soc_dapm_context {
 
 	bool idle_bias;				/* Use BIAS_OFF instead of STANDBY when false */
 
-	struct device *dev;			/* from parent - for debug */ /* REMOVE ME */
 	struct snd_soc_component *component;	/* parent component */
 	struct snd_soc_card *card;		/* parent card */
 
diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 4d920a59da3c4..4c2007c61ca14 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -4862,12 +4862,8 @@ void snd_soc_dapm_init(struct snd_soc_dapm_context *dapm,
 	dapm->component		= component;
 	dapm->bias_level	= SND_SOC_BIAS_OFF;
 
-	if (component) {
-		dapm->dev		= component->dev;
+	if (component)
 		dapm->idle_bias		= component->driver->idle_bias_on;
-	} else {
-		dapm->dev		= card->dev;
-	}
 
 	INIT_LIST_HEAD(&dapm->list);
 	/* see for_each_card_dapms */
-- 
2.43.0

