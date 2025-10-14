Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010069.outbound.protection.outlook.com [52.101.229.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4554E3090FB
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760415684; cv=fail; b=PpDBXUmw9lCDzyAEWCXF8aU9c502raGh3UCTeTDdXZAhs1AsTd7vUhZsFcztvRff9Piw/YbFQeDs4Wc0St8dDldpcQLYmEDsYvj/gMJNS0NVMjxGJ3XMviFD78B00UMkD3kGAIkQop7YzoxUotPDay8RxLPlX7WhuJKjc2XY7ko=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760415684; c=relaxed/simple;
	bh=mCCmcaUSL3Qn06kbSP16QdM4vq/4RfscjG1msrJ0Vs8=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=hXS4fPAAfOblc56FlRia7zP7FlTH5h8SUGBsGb/yTiZ2x/43GgaJSIuoK9/pJkV9zsN6gxkSEAw3+/6x9AMfBuRtgheNs7uTIczyXTXpJu9zGuK/KFwoEKsmUsuY9p4wkSUl05WF/h3P1f7ffplb8ZW1+utS6OqO3yFzZsvxd1Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=oG/yj6P7; arc=fail smtp.client-ip=52.101.229.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="oG/yj6P7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EXfWucGKsUhwK1cvMF34UfLjhyALTM6fTUh9RaRALJMry9W6Rqgu2fdx6vqgXjzi2I9ja6Were3y6xLG3pqS+zWCw8BsFk7Eoq4h2DR/vj3qaKjCCFc4IrUs1eybktA/FD5eXayr3/Z4cICW90Xd4byB/f1+nWR2bfW4XvpkRng9Lwc5tLp1r1sBtPB4JB596Mj0lj5BhNBRVv+b3b0jVd2pQyqjNh3OyuvUS8s8wRs0wWdZElZOdO+YO/AA59w66CU9AFfHX3/7MLnO2t9Bk0a+tv/mtX9kfamaxMi1uVnjyZiFboiPb0wUbGaBuWDHuWvBIUhxcmxrZcQSsdHOgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1sHR4BDSNLunS8mB1EvH3OmYNchG9ivJVrXWVPpOwo4=;
 b=M6eICfEzxUJA02tGYW5NY4knWDA8xpt4wZYDhVDBa2OJrTVSy2fPsb2ri4YdgNxO98q1EuV8FpxviDUWD2bNibtkceChTTtIpOhwaxTZC3Hnl6pVB3Z/s8EQWskgkrbhFmeDre/xjMZnAJgosxpAQgFaQMh7nKaJ7XoxjqjGcX3G4/7OfjcjdXVri59qEAmymHQi4j9U7ALvUA5drB2Bc/Z77t7V7+Wf4mCfKyP/BzHe0XR+Tq50OiWgVVEJcCheqYCU2bKrjUOBAvyVh3eD2jj/ZKZF7h2ign5Nj/+oWYeNnLnq72MV1LiaAjr9j2gXdyZUz1LXZkeQfXf+Jr6ibw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1sHR4BDSNLunS8mB1EvH3OmYNchG9ivJVrXWVPpOwo4=;
 b=oG/yj6P7vzQGo53gcncyZeNVCciNtV5ZgL/NvMiv+EonO5fjKjT558NW508mwnwwe3i1LAGtNcbYLEkOmZzu1PylgI+69alo69BNhpLgLb8T4BoJBDduHZPEkpqHihkmeJ2hkp8ECQ8JaS9vdOreuQ/Gbp/EX+Uk4vKjxARuy34=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB12366.jpnprd01.prod.outlook.com
 (2603:1096:405:100::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:21:19 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:21:19 +0000
Message-ID: <87o6qaru4g.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 030/139] ASoC: codecs: cs530x: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:21:19 +0000
X-ClientProxiedBy: TYCP286CA0003.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::10) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB12366:EE_
X-MS-Office365-Filtering-Correlation-Id: ddf4c747-ed4b-4db8-3cec-08de0ad9202e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RSYnrI0fP4x2OFirvOKNkJfzNmlF5XPLaOVvPGHQ59R8MN+h7bRpoWiUpoxq?=
 =?us-ascii?Q?uySeeLCIiVr01uey2HqQqxg/ZyhYTzfrSwWoyKCfr/nBLpoQBKv74UupzrYP?=
 =?us-ascii?Q?s3EzP5+HTPn6YO7tkkKCX74lE6yvtY6vh7pHBdAtFoCN/CfntmnVI0iypXW6?=
 =?us-ascii?Q?nPHYU/Ck6n8MAFZen0w+FEldKB7a7/D/es1zgCNxZhcOlKuDzhS3mUFB84y7?=
 =?us-ascii?Q?WjK1asy0Nj+G7xFCyYrkmQW/e4IxcSkduguViXq3X85SR7u/m33cDsHGlFto?=
 =?us-ascii?Q?1tA8lC0ze2QddUTCiAHHa8Jzchjh02dAm2NdzlWNxjies7KDXYJoLjpkQRbr?=
 =?us-ascii?Q?82rpc1nYK5Fa76tZlIzPv/MOqqSzbIF8OX049hE5WGidRXd9foS4GGpoZ+u2?=
 =?us-ascii?Q?WS9lDA8QkS32zj0AkGK2JKD6C+ndgdKkKxtf6veW0nTbTiueV7aRTazWWpmD?=
 =?us-ascii?Q?Q5O0eSMRK9HV4VeXBzO2hYtngZq20SH435WFQv3LHUn1pAPWN4A2c4gFtuwe?=
 =?us-ascii?Q?coiVtzTdGxQlyOB5O6OtRHTME4Rr76jG6SFtQhCbxhpvb40fJfaSl+h3nfPs?=
 =?us-ascii?Q?BaQ6uP6UwyOWwmsegimJtMb5QIYvwP7u0Zw70X8M/UloNrlH4KrdHy9XjAM6?=
 =?us-ascii?Q?KwOcclpX7jitub2JCq3PI+rcMRJU+cdTX3Og2UG/gbgNVwxkYb7gowqPrPds?=
 =?us-ascii?Q?8xfeVx6TJCpzzXT5TDhXA78m3cLWG+rwfYwQFkkunaszqlhSbAfOI7bHkP5l?=
 =?us-ascii?Q?X7RtI2pumlmFMoVBN/Opdph+luVYX5r8gTky8kLEEqn16w2Y9V+nvRIDqHsD?=
 =?us-ascii?Q?KPawU3TpPMHWnThbQ4yV/V6tts3yUAZhKkBeQScyDeexBQSf31gZsvpHf3KE?=
 =?us-ascii?Q?P0dfboRQ1PtT1MbCUoch0F0f+z+VdFbmGDrs7luliSLtFL1JimYqO/JiVW+e?=
 =?us-ascii?Q?uqesy8HTWaxZ5fHJbmI8pl7CH98GqVMZeNzezvkFU26lCbkJL7160Teryn/G?=
 =?us-ascii?Q?NcuFec4//Pp1j2QcXlf6W2Q09UPM5wzS5H4fw+o37Ub+4N7e3PfF+zkVOqFu?=
 =?us-ascii?Q?oBiddHdSswHHH6FHq+EY/Ugp7i+LU6D1HzbIjNcs32NBDVS7HocI5NsD+AtQ?=
 =?us-ascii?Q?o6T9eq5ZRAZD++fOh3kibL9Pnm1yzD0WLl8F79ff0wiD3HQW0IFgGMclHF2m?=
 =?us-ascii?Q?ZFORx6aAPbMtoaL8kiu8BuIR5Ti3pm8hxbMqbLTKFSjqYft3UR3E3GF8v7jo?=
 =?us-ascii?Q?vE+XEKKR5IOaGMapWet+pEJITW7lkvtH7IQl9/BjQDzB1NPY8fl4qqCSAZEF?=
 =?us-ascii?Q?5AxdcTnFieI0BDYHoZEMeeeqi3Nu/yy5RwXDhNeN+TcxYkxxpibtWJSC79oh?=
 =?us-ascii?Q?dlZA4MrvLxSTosHM8v718tsYu5g4u/DKsUP73r4mwIELuEmmwZyW6gRXC/f9?=
 =?us-ascii?Q?XQRt9KjfOyaihAd4bwZhBL5389nCuUvpeINNTaeovW6hQBTXr0Za4y3Y0nsF?=
 =?us-ascii?Q?so0f0QIlvcHpjasptdVCLl3ThlZSuRL9iKyF?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2ttHLFDAKocu+J+HTUNhCJ9R0KVbvdwUd0KP3biQ8c7yfU5KSTiO9d5rcqDb?=
 =?us-ascii?Q?uOJ07s9ppNX8z7yQdUyuwDXuX7v4DeMymdXRATjnNvxcoehRCg6fmzPhM8dK?=
 =?us-ascii?Q?eUIbjxvg9RAk13jpPAayzv+21UOof5jeo5Itk5kk03JypZIKQPI+8T0CbJ7P?=
 =?us-ascii?Q?xnZpIQE2jj6PJjKUrzOCVWvaOdjqWTW971fom+g2ahaDjJ7QJk6xrSRdi3a0?=
 =?us-ascii?Q?Ool4GKt/LSdPt3FS3t6Y89eYIGmfdiAmi7H23jPQIM3SwD6rxHfuqOMs9Hki?=
 =?us-ascii?Q?STy9nz2TFS50uk/hjMiVTWIM69DCx0ZGt7hOFd07p/Rh8LT5i9dG12uj/Xku?=
 =?us-ascii?Q?ZOcXn11b2yjCGAgFf1l6EPacbcvi1nbFXDwgR5gUq0f2Z9JLQzoek/TF5Ukd?=
 =?us-ascii?Q?gRhH3lnEeefQQktBiqv4CP7UXaNIqEdWcZosqy4ddF5z2BaRCS6zlsn6WCPP?=
 =?us-ascii?Q?oc3L9L/7dqC+RCTcVZISv3hY2YHZLhwvJ9Tfyux0nJ6co10PVFcclLD6DVQ9?=
 =?us-ascii?Q?XhQDz2sbaqOz0/kPw4rTpTvVr+1FxWZJ3w3FMnF7oYIjVbqK8m4rVv3epGQp?=
 =?us-ascii?Q?nGGVjbUoSIq7cCAtG040bYjCFDToLlx59NyjPSmH5/gaKkfkSMGmi/XwrTQX?=
 =?us-ascii?Q?KuhDz3CC7OqI9ZqbiJhgB1ndKnYxHeGGg5XgkYxiyqCH/Bc3pn4AIE4xc3tP?=
 =?us-ascii?Q?CcFkNJAhd3Te8xAr+Rp75TD+Y57bljiKnPgRBWmG9QAed/47EjJZdpAu8XJ7?=
 =?us-ascii?Q?r4/VhUcBYRrmi15kSBAjz2JMQxcFsNlrxyloz1BsoRkpHUiVm48GPP+uqVTD?=
 =?us-ascii?Q?wWXymFa/vbG/a/4uPhenFxFwgIgH1f1OSaGYwzwRHJHvrshcTQi/ToFwfilB?=
 =?us-ascii?Q?ygOHvvWibWIa7jXI9Lwzj8Z7Uy/wWRkRipTfoyEXBjGj1M4jKrvBx8XP93o1?=
 =?us-ascii?Q?WT3vs9E31CVcaIRNPxT9y8D7jusCAelE0cX3eZUN7l/W+A60247nskLIG1by?=
 =?us-ascii?Q?ygdpqcFLaOyBZIsUm3fzqTfkFyowy83n8P5ZGGghgGOYKXzgLfpAxYG/7IpU?=
 =?us-ascii?Q?WNxYAzme9ANuDLEIQNqIIprb5Ve8Ik36KGI83yHzfgcl7xcOKulVl49Y01fg?=
 =?us-ascii?Q?7vHmFgWPNWOpoV1kHX5BvsujJTPWVseBnmmyz7Z2npCGrR/w1X5fV+4Thlq6?=
 =?us-ascii?Q?DTXBIh5nszpghz+T2sS5dQT7yc6qKDvYU7KwXtXN6RsTAa0awbyTWj0XHVgY?=
 =?us-ascii?Q?nV2ZetHBMIMQDq2RBja1p6PuBJ0Z2/giDNkDS66ZWHKNN2I0PY1gYIcuz5Ag?=
 =?us-ascii?Q?bo6KZWLpAzq7lXBuR522OVp6FI7YdE4aggIzJgQoB3nb9WOH8wBA4qV1FDf1?=
 =?us-ascii?Q?6JCYMB2oHKf/rDos43/aNemGTpv9v2IQBcaNFDV2DUZpO6rRroOpvjz99WCR?=
 =?us-ascii?Q?D7cgD9mZi8RsP9AiemlJBig9SjtqhI5WZ9yYO6ozeXJFWPSLSLcH2ISgCTUX?=
 =?us-ascii?Q?L3pCUcVrlPg0IKwkCMxztcWmQVDJkNVNVG0N+Sb/uai3VIyPIBfR0C7RRmkr?=
 =?us-ascii?Q?E6/PRwVyGuseM70pNpxaKyDqQ5fHNuQk8hHFQ1RkAhQ5Q87HV0ccZ7vFCxmq?=
 =?us-ascii?Q?+9ytTVZJ4RG3WctBkfTKrac=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ddf4c747-ed4b-4db8-3cec-08de0ad9202e
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:21:19.8605
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HeOJQJ4K+Ps2ofH458PZvOeTL7uG461Plr90bpG9g+yPbIZCx9MLCwVVdPO+5Bil50p6YSEplz3f+OphKx1awCfa1qZnsqp6c2/u0gbXbSWOJKCh+ylAUhmynysyATMS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12366

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
 sound/soc/codecs/cs530x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs530x.c b/sound/soc/codecs/cs530x.c
index b9eff240b9297..ed533ac9cd3e8 100644
--- a/sound/soc/codecs/cs530x.c
+++ b/sound/soc/codecs/cs530x.c
@@ -106,7 +106,7 @@ static bool cs530x_writeable_register(struct device *dev, unsigned int reg)
 static int cs530x_put_volsw_vu(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
 	struct cs530x_priv *cs530x = snd_soc_component_get_drvdata(component);
 	struct regmap *regmap = cs530x->regmap;
-- 
2.43.0

