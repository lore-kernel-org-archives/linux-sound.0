Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011033.outbound.protection.outlook.com [40.107.74.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 354AA3C5845
	for <linux-sound@vger.kernel.org>; Fri, 26 Jun 2026 05:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782452565; cv=fail; b=mtPP+olAGnFd4G03thnfqIbAF5sI1HHl21R/aPhtQRieCTkwfzeIb5C7KTU6HSpPdSCLbawCSbr0hHTRQbyigtLNfYILeqyNhDRY5/cRv/uqp7srC0GzeP+LdRm8KNsHXb6Kc5MiuaERYNX9GTTy9hh3kqerLil+VQXiaQI92Fg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782452565; c=relaxed/simple;
	bh=I1g9w/XIulk5tGUHE8ulm6KWSf2djGhMQZFLom/JQBI=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=W6LQ8P8k4/QMO56d0TXQSzM9zECjbbrgMEtHwtPsnsKP81f/tidhcjETk5PcFrQXj30CiEvvJHTdFcpanx5tihsOXgmJ+uxdEq68ua/cglheOMabAtuVnwnaPUVjOibCmY69qRozG70XKhdrjYTdCnt8vMsEI1T6GTpTDHtJV3k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Q3gzZ9jh; arc=fail smtp.client-ip=40.107.74.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Q3gzZ9jh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l1WG32WewSMrldQF4xo4/m1W5ozWwPHxpA9Iw27BSITqape/OkX1W0T57XJCPd3ynBrfEh/hYwZSi0bKu5oCDkLYynpN6uNmu6Obnt8gj4v0wXV++SPF3fhs1DeoCabmbBW6s80HPh1MOCDO06iDG8l931rgsdSKfgm43hQJudQRsiCS9UwJEjoCSP1sl01JKfnzilzamFoKBH/4p0UHlV10rdHqbDY0HTaLTUJvhCBQFtrFlNsh3ZmlUBlshWOw7XJvt3r/WXDHKwgdTIHD1GD0MYSYwzu+63uz8w0MPlGoYqHROhPj5sRtuEfsm7ITZ29vAoBAVATrjNAtp+LU6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uGuXfhPf02BCldGSITgb1bOun7rH7mMgzYEGcx0X0tc=;
 b=V1tp4eI6LYA/lM///8cB+XzvtPFGqutD8qW1tlBzw1whg1ukrwOZanWKs+4GxRj8/CqXf4381xmb4dU06h57ycNfqbooz1B6jB+jclFMvp82YiP4XbTBAvHSHJBvPWq+bQJvT+9+eTfNy8EOHwFUmGHj9TzdwELveYcBoAp7ESeYwPtgIn+zYL01b9C9hcw/9/JYfqfZrEfq8HCbOekGkb26QVr7kpned56r1bUocFl7rPorc7vmMZze+ivUts7InPfD/YGSXOGLt+yiGb/oJpq2wxk5NzQPhscajk0uZgmf/e+ylPwrSOznYJEwWDGg1r8ONw0P+XkKY8zCbIv4rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uGuXfhPf02BCldGSITgb1bOun7rH7mMgzYEGcx0X0tc=;
 b=Q3gzZ9jhFa2t/Ux8lhQrvEwl0Cc/JMzWi1aWPbnPsGhSUmX1M5ObnVdbgvLbkrM8i88dwmVv9RNCeWsJSmlh3RUBRZ9YkhVPU8E2lkK7rfOViLqr8tWneYxtqvGPLL9PPy01qJai92Py4j9oPQES5fbGKfgH376W34vT9Eht3VY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYCPR01MB6606.jpnprd01.prod.outlook.com (2603:1096:400:ac::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.17; Fri, 26 Jun
 2026 05:42:39 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0159.015; Fri, 26 Jun 2026
 05:42:39 +0000
Message-ID: <87o6gxeu2m.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 1/2] ASoC: sof: nocodec: tidyup sof_nocodec_bes_setup()
To: Bard Liao <yung-chuan.liao@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Takashi Iwai <tiwai@suse.com>
In-Reply-To: <87pl1deu34.wl-kuninori.morimoto.gx@renesas.com>
References: <87pl1deu34.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 26 Jun 2026 05:42:33 +0000
X-ClientProxiedBy: DUZPR01CA0035.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:468::13) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYCPR01MB6606:EE_
X-MS-Office365-Filtering-Correlation-Id: 23750bdd-f37d-4da5-6062-08ded345bc28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|23010399003|56012099006|11063799006|22082099003|18002099003|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	wj7hZcpaSATaxhoY+iOe3Y/GC60pwXz92JWDPJZYUeufKVG5BpUwj3k74xmSQgzLcy8p/+Jrsem71Za7mDG1xZFvFiT45R3QYxuqSpBqTPy/ESFqBHs6tx7EH4SbOEvOSr/pYufEJ6nD8ftktnr5m6v8dQi+hhBaSbpIcI+lL4KZ9JinqMGu0HK0UusLsb+04iwjPvqbpd7oPL5IUrSebhSc2rPQ3hxbgGIeRFXgTFqdDWjP67/xSUB5LUNcCgFYrI3M3OHR5/ak625/yU4iTWY5QCDT366K1nsr6jhvu2uNJNRZkbGtD25EXVgZBf5kkO7XI/rVl+IeaOO4JBpXd+/GtMb5XD271rC8Ognkckjqyc7KigPBpFbUJ8gMwXwMqKKKVvMOGjrdT3joSeu+qHn4nD3nFgEa5ZKSWZ3sXkDRECF08jFUoolDMkDvD578X6PjZFEMtY6uxz00c/Hr+5Q2JPy3W9lKjLfJwaU+/oepWcJfWFz1QmlxWB80TbYf4BfaqFjZd6agITJZHq66cGd1Pp6UFaYu4xqVeeppKm8a8eEk052ZN/G1yhx9VOxRymJsDb/gbKt7Dyevty8uwVLfr0ohBTluRdtO1nHtJcQyKbTvdQrPobMALxPLSsdr35+xCWMz558q2Dpy8TfmQviSEI7PGgqcIPF3YvlpYngHMIDqFqo3iV17hkR873DxEjyXvAi6/Vrhb8cwXLwPPn+BRC/NOKuyQKmRtQg5Oynk0gb4SibL9BBEEMZeOpQu
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(23010399003)(56012099006)(11063799006)(22082099003)(18002099003)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8NdMQHF3GBoKFZiLuJoLuXYYBq6CR8ZFXsz0ZNAAJ4eycXH6Zjs5bljvC60o?=
 =?us-ascii?Q?lEJh3q/g9gFxmTwprxMuN5Em1fOc0oY09Jnrrmz2u+GbUEH2zwqWeVEKZEV5?=
 =?us-ascii?Q?MlCNp9OeR17fPD8r8CDYoFkYVpOP2LBv/1CUlKNJNYUvXmGSKsguJnh5uz1F?=
 =?us-ascii?Q?14KkW4znObAsorK9EwsMXNRLCqen1VrVt8bo1Rkqa6O4+UML2b3zbREuW98T?=
 =?us-ascii?Q?1fyMq9vfxxMEi6oDWBe6qfHOHmEVDc7tT2LJJ5HLXj1x2N7YiK/n8PT5KyOg?=
 =?us-ascii?Q?kGfv2of7VXyGwqD5J25FSm1XYKFMuGOgEqnyOFHI9uxE0phVd/JGYGfOuH9A?=
 =?us-ascii?Q?nSeDAZ8goZbY2b4mD+C+j8oEhNnP9a7jDnUTUgAsVfovm4WSSnPyo3g/JsLZ?=
 =?us-ascii?Q?6YXBkCxeL1JmZiA9u1B3Bxq/4KckwcUqfWByyEHbUlPxGDZ6exxXXMiksIl7?=
 =?us-ascii?Q?KhVS9tCOa2/VTjPb+quRBrwtv/67aiTImrKclg2rJ9a0COkyDGW5K1396PD3?=
 =?us-ascii?Q?x4ty0QPfuJZGv/o9Pvwci19hKHwO2mzd8NxhfxS2zq3/JnH+q3h2axsOFFkh?=
 =?us-ascii?Q?JofYhP+el4AJI7O0TgRo4WsXsJLzEJ4NC8xvp/ta5NjzzDmrcOBwtv5NgC+F?=
 =?us-ascii?Q?CMwKWjlraOijRu27NGMMd92D9pamtVoOZIDrApx/F7IjMTxUmDUo/w5JKqNZ?=
 =?us-ascii?Q?u7ZVJUW1CLUK1eGctX63J6hoR2p+DOLrC2BG+BxPz3q22nTqEoGxn8pRB30g?=
 =?us-ascii?Q?PR6TpE4awzZcDbey4Ehwfxzetkgr2TEtMXI+/zcE5kgx/q2NwfYWMsebeRvr?=
 =?us-ascii?Q?cNpL+se0LJ+0LPS9YOP+0eU8VsypitBIhmR/en9y69/PuWrAq8ZAWGoI7q88?=
 =?us-ascii?Q?NCa5+RlGlPDpohcyMGR1nFDO1qMr7fbiOd0ZouWPVq+M/orM4hBDNumehe51?=
 =?us-ascii?Q?WKxZBSbB0xVPCM7bJUj9Zemw0RlP0rdx2853dmPaDzwG1Uv3ZwnjNxdyANmW?=
 =?us-ascii?Q?lVc4I5cnt4Kd8QVJgAP3KnZXZ5erf2HhfBy1StScIZz355AjjTr3T3cehiFz?=
 =?us-ascii?Q?4ExPcYlu30P/hB+8NxnMz8iXgsQ6IgXqu02qq1DDfEmXS5HeuBxjPRz6Y48E?=
 =?us-ascii?Q?/FuGiluK5+/9JqpQz9vNQIXsJC0uwER1hwphA9e+mXmvKXXaDEas6GnDdayx?=
 =?us-ascii?Q?DDtB8f8I0VeDFl+1bjg17P5Kzo/rqMK90gPi4nPTHJUp7DPiPpzAxnKI6iph?=
 =?us-ascii?Q?osoXWaLdh4lS7ugZNMoaddaOg6Q2B2WOz4kY7wbF/+3CJfDnc/Kg1/wGfjPT?=
 =?us-ascii?Q?zssVITos2jVJMfi3G6/jiHC6DVAg1Wdgx62I8/6c8sazFQn9DnYSwc5DRg7x?=
 =?us-ascii?Q?NUi0+TAu0+gKC8gEDnOhSZ1/MMbNLINKk8F0aosqKPKyjIKuXAStBhObB4Dn?=
 =?us-ascii?Q?0I+L6+129JxQ/LkHMA1V1PqHotXyTMdqu/pA52Q6M/sr7ZxW0NGc0rPjzNx9?=
 =?us-ascii?Q?kMzkBc44bUzFMVidvEjXnqBtbJZeE8yKb6Qas1IrarnP5D8Iy7nReDC5rmlh?=
 =?us-ascii?Q?gY9lTIiorAPmZcJ6jP3+4OJQiIRLkIigvuUyv/er1XhGyfHuHnANdMvYTdWp?=
 =?us-ascii?Q?u0KuyBfAPyE6cVIfBN9eOHSJ+rXiSK17i0JyjnGedo32l3t3vff4n3iSeGvI?=
 =?us-ascii?Q?JVsQ/tT1n17/P4hslRFwlNNQwCZ3OoYeTSo65xqhdvDoSywkvbq/N+0A4joO?=
 =?us-ascii?Q?EcQr8pPmLnGHCUwOKfGHHXi5qMQu5vqnUKyKTqney6kxxMqnBu3G?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23750bdd-f37d-4da5-6062-08ded345bc28
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 05:42:39.7221
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yy5ZvtJen8rz3wOmYTCormT1gbGwreaR+Eor6H6eCTKPlCtcx8WK+ouvOBKxahNnS74u3o9Hasj2WrFQiIz+jgdq4Yw9lkP2a+ZKb3HSOfBq1/1Jl+bIwO93qLyYIWKo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6606

It has only 1 card (= sof_nocodec_card). No need to use parameter
to get it.

Current code makes old style / new style conversion difficult.
To make future conversions easier to understand, this patch clean up the
code a little. but no functional change.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/sof/nocodec.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/nocodec.c b/sound/soc/sof/nocodec.c
index 11a95dba3c9cf..d0db80a46966f 100644
--- a/sound/soc/sof/nocodec.c
+++ b/sound/soc/sof/nocodec.c
@@ -21,8 +21,9 @@ static struct snd_soc_card sof_nocodec_card = {
 static int sof_nocodec_bes_setup(struct device *dev,
 				 struct snd_soc_dai_driver *drv,
 				 struct snd_soc_dai_link *links,
-				 int link_num, struct snd_soc_card *card)
+				 int link_num)
 {
+	struct snd_soc_card *card = &sof_nocodec_card;
 	struct snd_soc_dai_link_component *dlc;
 	int i;
 
@@ -78,7 +79,7 @@ static int sof_nocodec_setup(struct device *dev,
 	if (!links)
 		return -ENOMEM;
 
-	return sof_nocodec_bes_setup(dev, dai_drivers, links, num_dai_drivers, &sof_nocodec_card);
+	return sof_nocodec_bes_setup(dev, dai_drivers, links, num_dai_drivers);
 }
 
 static int sof_nocodec_probe(struct platform_device *pdev)
-- 
2.53.0

