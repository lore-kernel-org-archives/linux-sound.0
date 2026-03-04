Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010047.outbound.protection.outlook.com [52.101.229.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEB6C37F8B1
	for <linux-sound@vger.kernel.org>; Wed,  4 Mar 2026 06:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772605388; cv=fail; b=iWDWBGdOxBcy+yyExGa/0Qd/SZfs+DgFojI5Gf/dMmZPinelChcIUzQ6ObxUcaFUSvmkR2rKKrEBBXIiLqCr+7mLxU0f+RDVCUfRBYil9mEzYWCvhb2wjBvxVweTkd32YPUZ9vsQshWL7Uy9h3fHCcmmTLHcgU+UlPeAYARALUw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772605388; c=relaxed/simple;
	bh=6W+J/wEUWJ8dqB4LFDkRGEzA8QRHYPKR8pdYHIZytfQ=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=hcgdjPDKYQISQlRvKIRCFKIJ1P1IBpJkxucOhYVuz1RDIm2+hYiMh6+mX2Z2gJbmbBBt4g+YQRtoC1VaIg3NkYnJ6mb5Fgz4BzfDV+poZHT2qkUOpS6Nl4M36qLERsq9zckiOV1AOolAuvVyZ0hqnQ57jQ4+PiJp/2QnPXhaFWI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=mfyZ7hI1; arc=fail smtp.client-ip=52.101.229.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="mfyZ7hI1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M7uiXrR+auHBmxJOXKwNRPTPJ5Raa5pggUABQgxjtVA/MA1yUm51l2gqDten0CrNYjDV0cBIIYaSTY0gdLCysW97Oismm6lRAAD7yQD7lVCnaKwfRzmd/yjrn2gRzqGoZ89Gnn8fZqfcUwdEnWRDqG6WOE5Y0ZirX/l4WmOK+eB2mT2/yprTTwBYlGhka7tGSVheA4Fuft/nPYyjj3ZUJ6Y+o0d1yGY/6QuXvC0Ev/4ksifDM4o0fk95W481630DwKZpGiPRKerF5KoRc3tDVRAXv9HsN7Wg4FGjv+j9hzc1xJfBEemmvaasJ4RLiScoqu/dZeff4Egn/EP6CMShpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hFeVdmM9MODQ6TFl5Mf1bWYblmLHI4svJmGkLc2qkMQ=;
 b=VweE1u9XvAzpkiC+fG7Xb/1vYl4bV1CSHCrgsnBnFY7AtSbMXSILHG6ck0hW3bpAasLAhfVtqvoGJJATM9tT6MwotfX3t8qZWKPMpOVk02p9zJ8zRvRvW/E6etE1xrX9nz2KP6lFpQOtECTYOYR7OgRFxIcuPuOw1UAgfIRGzDTWEGbO2/1DssizkT+g0F56z152jFPyecFODogHflwCZspXsNKubL53K4/hNIm9HOevJGI3vxOVcFUdATKh+CSdy/HGlE4dl7NKtn7r5OUH7n2qvJjmJmURhvQ3/Tm0/sOGs9uR3uEdAu1QQzW+POBsaRQsbEe606YoWh3omk0jxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hFeVdmM9MODQ6TFl5Mf1bWYblmLHI4svJmGkLc2qkMQ=;
 b=mfyZ7hI1Mio0xGs5456YUbS110D6488233aXQaMZqcE4DYN/Vb3wAeS/VflDLdmF7kxQmncjZgrpC+VUEitMSGJI80ZCWGZ/bfrQ0j73TBj6+o7IXFhCW9jMaEgLTX3n0XY8iCywzuThvBwu2sxtkfo/uukmiqfL8pGTlLgl1ok=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com (2603:1096:400:ff::13)
 by OS3PR01MB9755.jpnprd01.prod.outlook.com (2603:1096:604:1ed::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Wed, 4 Mar
 2026 06:23:05 +0000
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9]) by TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9%7]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 06:23:05 +0000
Message-ID: <87jyvsp0zb.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 08/29] ASoC: codecs: rt5xxx-spi: name back to pcm_new()/pcm_free()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7fcp10x.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7fcp10x.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 4 Mar 2026 06:23:04 +0000
X-ClientProxiedBy: OS0P286CA0114.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:169::11) To TYYPR01MB7976.jpnprd01.prod.outlook.com
 (2603:1096:400:ff::13)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB7976:EE_|OS3PR01MB9755:EE_
X-MS-Office365-Filtering-Correlation-Id: 2394f9d2-b62d-44de-d373-08de79b67e9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	vDLWGnyDsLb1r0poGVnFVmUTtFKZiiRpCV4CGntc2YIYZoJD6+mMc5k7HRJmb+s98GDIVcfVmp92BbmHZ1wsti7b7Vs30CDSQnbGt0VZguHxkUCcMmG7SNc7SLgptpJbbL4KnL4PnGn+j8o95W5sKHj/WoXl813K4dj1/ZUWREsjei+eTCHEfJ+i8h0B8OwS97LxSIQNxJ+wx/mUobQgNmSOpFUv3RJlexRaNNOaFc5oBzF1DVofLFse+NOGjPvn7KL5e4R8BEoIsC8549+haL2/s/dzOE5B7kevGk+LwMN3YkH809hErwTbcWMIFBQ9yxm4O/GGvQYZsUIO32Gla4Rz3ODkc1nQtA2s00JPfIF2Mjp+rRFLpwJXmxp/dIY6uCUIGJU744Dh2YXV5I//TIJsZwOCxyz9Spb9Q0iOP7airBscHcxZ8Xj/m+gggyZG/2gQzQfqTzzeyTSOeMthDxCC3zBUq8/NpEmAdvwtiQh1y/f/1KRZCu84sBBGLigV8eA/kR7zaz39QxjCNrdRyRO+JRDhAvYKuigGBR9Zp6ccAg3WnQsVRyxqGJa6+ZjcOjCUGq/t7gps23c9tfnnkz7W6Bb/cqrwbssIO1gyimwODmoVb0KxYUnETUrhYsAy1oZ620l7Ts4afYDnaVnq2Zck+CjMLZZaL4oDxRhKQoJ5Kgdo9BPZ2p79gJuuOqU2EUyOMFvWmfjW2HZBS8Lo0p5pBNl93NWhvZH4OMVBGli+K5GpoUrFileYQPooOlJ3yscI8lIW6lQMosFKMyZW/FK+OqQqcj6iJzMb6x6zLw0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7976.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CBa42bY9bqXvs1n34WRZ7hmQwJ/6CZnoma/qmJHSHcJTVCtsJTSf1khUv3Lp?=
 =?us-ascii?Q?ZhGwSj5+Bf6F0NSQwVKR+FCJw0eM2c9fbnmKFO7mXSLkoQl+Cv5/Z+XQ7Ajj?=
 =?us-ascii?Q?ZBRb6iVzwmZ8veqeOwOP4kEvby/ZpeerWLfd8Vhl0CZ4OiKESxFMhoiBUUnq?=
 =?us-ascii?Q?WuW/YAWHIeZLb3xJiRiWUNaV6CKFNOWptMGVg+S0PfvvR7Txy+is7zxHbgS7?=
 =?us-ascii?Q?4SPxjUiungEZtHFI1oEK3GIcleFJERjQCJZWdxrvqG0clWeJLmbOOCu0OjKD?=
 =?us-ascii?Q?JryN5n9ZwsimNEhYwuQ0UP4CxD7IZujlc/YRy3z69EKWtUEq+aVkEKDIToYC?=
 =?us-ascii?Q?SzCGa1fKhirQn+2MiUis7OfC7WAsG5HpIBXkKi/lgLyrA6xLrPJDLGtAhpBb?=
 =?us-ascii?Q?OcwQNE8pgfYRgSJNH5sTrwmwHRMmTFkzD2I0EgxBvZjUOhFPijI3KWv1QfhO?=
 =?us-ascii?Q?niDDRHX88yjNNLn6ZGf5R8bXTRylQdNXRn+kCOY7rEioII5f4zNG+uRhyF8y?=
 =?us-ascii?Q?sIq1i/OBN3bHF/yPXd2bs19i2q1IraAEJ215+JGyUNWk/KHkY80ZzODjtZbr?=
 =?us-ascii?Q?0AIkUkiV00myCVsAealmJ0lm5xNWrc8I8N+tIqvaWDkRQ/Q7hScfjngTWiMQ?=
 =?us-ascii?Q?ogLuk4qMt/T0BffPVDm+9EVdorAmVNfCwbHjdvtrwA1DXKNJTiu5qNicRm6f?=
 =?us-ascii?Q?U0OkYjQY0bMVIprVmMZ3jqBIK9gLFJGvNIl2YwW9Gf/PY7uo8TFIZzxhCGbU?=
 =?us-ascii?Q?fpl+LJbmMRyEJzoSBlOQwIRhv0/MM+HHDbPJR8ASwre4UoA/H1kZUoFqV3F1?=
 =?us-ascii?Q?mbms/Lwl4t0/pYtmjOO8k7AUgIpSJEGG+EEqP2mkuD/wCLX4dTs+yPO1+M1C?=
 =?us-ascii?Q?TDAmmX0vkNEa0G10zGK+jk5Ifcq+HxLDQJkaozpifknxPT5qH1xK7ey7xYIL?=
 =?us-ascii?Q?cXAE0eIyJc6yM4heUaXB7jNP/KPa0r+LW4TIZlLKhLoNADXGs2KBUrtlyou6?=
 =?us-ascii?Q?EUNh9XDiO6vseBtq1/ykuUHTeFPowCYi5O59PT1eJ/RtmbAtQuEWJ1oX0EY2?=
 =?us-ascii?Q?6WPsTt5oZGqv0P0Ntdt51qXPyX9722GjMmdd14EP4zH1xV4TpJQjtbLbYnMh?=
 =?us-ascii?Q?zZPN63THdJSPrcg9f+00otMlPxcKBYR4hn0p3RmfLHlRBrN+lJuiXfPeZVIT?=
 =?us-ascii?Q?h+fzEkquCiTLUGdmwk3vFBTGtxhRtEyHAa6d8EbWpxdWO32rOhB4Ppa3qIUM?=
 =?us-ascii?Q?VHXAWKMqPpQygf/WL+4jC1+R1AXcXlUPhkQ05mvEBThQtiq4t+vyHRg02uTy?=
 =?us-ascii?Q?G9AGgqCCMSo2fmbwU11Qk5C6K11qt65uWGNaBOjnOwDOynuqfU0tY5ydLm/J?=
 =?us-ascii?Q?JX4kHYX0qLrFh4JS0Ggt87osuVFdfSTJco0Qw5KVAp5luhsG3UDMHDQnPAdz?=
 =?us-ascii?Q?QWdIFbkVQlDcnZ7MTEK6xLNcDyo0VcAf20TEpCtxtCS3rudofVuWojeo6PsU?=
 =?us-ascii?Q?+cu0dENm2QN5WdgZj4moJev60DR8pjx6csqrMFjZCagUfobB2wIv4JCYRvwf?=
 =?us-ascii?Q?JQuEosWLGVi25XberoghQ0IYZ5Mv28YolrPOVTFgFajcWsVZfI2bdmByHSxW?=
 =?us-ascii?Q?bNK15/o0Ou49u0OkcDKHS1pV6SnovjHfzfSFVNsIkE3mf6a46eI0yKNlY1yM?=
 =?us-ascii?Q?Kk3HjA3k2sdoA73fzk8v1FNMcDlL1US5K4NgjXJ7OCsOTgLA3flYYU2b6LkO?=
 =?us-ascii?Q?eQetV1+TvpAneFVL+QdZAnHMH5S7NDPfkn4SwsJKgt0yULSe/BNJ?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2394f9d2-b62d-44de-d373-08de79b67e9e
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7976.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 06:23:04.9445
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4KCNsDym/Qtz4hnSHZ5SKX7dnqxnfKMyBgrE9b/NyYWqsyOo/yJgub2nrnCvLBg5X+SDpSsxLt4TPtJdM6nXM5jlC1JF9nCEGhrMWdSCTJJkoYADjFQX0kOGaZgDQQLW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9755

We have been used pcm_new()/pcm_free(), but switched to
pcm_construct()/pcm_destruct() to use extra parameters [1].

pcm_new()/free() had been removed [2], but each drivers are still
using such function naming. Let's name back to pcm_new()/pcm_free()
again.

[1] commit c64bfc906600 ("ASoC: soc-core: add new pcm_construct/pcmdestruct")
[2] commit e9067bb50278 ("ASoC: soc-component: remove snd_pcm_ops from component driver")

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/rt5514-spi.c | 2 +-
 sound/soc/codecs/rt5677-spi.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt5514-spi.c b/sound/soc/codecs/rt5514-spi.c
index 54d84581ec475..199507d12841f 100644
--- a/sound/soc/codecs/rt5514-spi.c
+++ b/sound/soc/codecs/rt5514-spi.c
@@ -303,7 +303,7 @@ static const struct snd_soc_component_driver rt5514_spi_component = {
 	.hw_params		= rt5514_spi_hw_params,
 	.hw_free		= rt5514_spi_hw_free,
 	.pointer		= rt5514_spi_pcm_pointer,
-	.pcm_construct		= rt5514_spi_pcm_new,
+	.pcm_new		= rt5514_spi_pcm_new,
 	.legacy_dai_naming	= 1,
 };
 
diff --git a/sound/soc/codecs/rt5677-spi.c b/sound/soc/codecs/rt5677-spi.c
index 548180ec5762c..1bcafd5f44682 100644
--- a/sound/soc/codecs/rt5677-spi.c
+++ b/sound/soc/codecs/rt5677-spi.c
@@ -404,7 +404,7 @@ static const struct snd_soc_component_driver rt5677_spi_dai_component = {
 	.hw_free		= rt5677_spi_hw_free,
 	.prepare		= rt5677_spi_prepare,
 	.pointer		= rt5677_spi_pcm_pointer,
-	.pcm_construct		= rt5677_spi_pcm_new,
+	.pcm_new		= rt5677_spi_pcm_new,
 	.legacy_dai_naming	= 1,
 };
 
-- 
2.43.0

