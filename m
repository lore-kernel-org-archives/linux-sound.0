Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011032.outbound.protection.outlook.com [40.107.74.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA2418472
	for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 00:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789430738; cv=fail; b=SK/ZySkcQsF8cO5r668PIP6RCiDH/8xTIY1psljvDyFd5aytWLh/NVp4FYzJURmscUL7d01rYnIMWzdOrNLlNQ+vaBJXhRiTLrd//gaqRktqLfC5Q0OLPMQTUKmCCUTFEXLQLwq6FcEU+WLAHJ1jDmiF+Qxh7edPL2fhB7rMnOA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789430738; c=relaxed/simple;
	bh=axxxvYbrTEq0Ye8TiVq8KRk9iFeafnzciP3OTDfIzOw=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=lbYqL90yCXRe3rX96oOjCqKxXf7zLX5Q4mm8Gfl++HF1ePWJ7b/0fZT4Z8KZwKcSMZn/Ak9AExwXN9LjGaVvoZDF/vrmNY+fji2yMHVjlu56LwNRo6qHFk4lqKR/DlMktLYJqVOZWSK8HK9KeG99IgSZtojrFayXGs9k1H+1pgs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=SmqNnlOr; arc=fail smtp.client-ip=40.107.74.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="SmqNnlOr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZvbhMq1Hf6Pff0Co3WvaKYMcVwB3Nm0s4velDEpealyFPXTkRQSNqUSr4d+vQqTCU4Fp8yokPaDVOGaBPIGZyO3k0vrVU+QpSDp7gB2SLANSb74eQgYZ/6hUB56QUZZGKKiYvohlzwDin3Vhnq6Y8LfvTsCWlUpqtQAgdhWZkxAoggFg2ijxRCGCP97BSMbP8GdAhxuKY9mzWKaRegeYsFdEGlIJHhwMmwllCtTGithV2+xK05vjUG6UyZRUtTva0Hmj4oA0bwkvWb4Nhl+QP8HJqTXirNq4dFcH/U6VBHZE86YvqgUkh30xUEGJaA36O4b0s2/p1GQFmiLFvvcMkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yEGGJSU9zFZML9ccDU6gZlv99ad/QutePs6RUSrWNxE=;
 b=ACwJQR8hhm08R33bKjxm1Y8b+PFY52zG3u8AHNCCn4YaP6/kVVhlw0K4j8wt6fjME7CbZ8d+ZltaMVRJryKpL5i44In8+s7rjHRd890EEOsJyZKrbTI3cI0wP0CTX5IwmS9hwnjJYeKmwx+COGBaWXuYK6oxmwiJJvjVVKjDu6a6eobhx1mpkqfem5v47kJpYlePP988rEju4Wh6wwJgSSQAI8MRuv2VeJUaqCi+VrMvdSMqSi8Bl+jldFVo29pZWSNMIisLFbFs5yRV9bwvbb/FCJXgQzqO6SlXloNeTFtjTuawkaw5f7D758zEaCJR7trWhE5igwNYMZZcl9vKjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yEGGJSU9zFZML9ccDU6gZlv99ad/QutePs6RUSrWNxE=;
 b=SmqNnlOrnctxJKz08cI8+3mfeH+PgIMLSbmze3Vj9dXbc8Aj5xbReKjHxV3AchsQ1aC4JMdouDEJHmVZ4XqKQt/k+chjhb2CZ9C6ZXVRaH7ssMQHwnVthN3/fuvEfHKM4FfMIg9vbN++tg3qnZL1WbeRgQ7VSymNSJ+AWhxDwyA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12) by TYCPR01MB9671.jpnprd01.prod.outlook.com
 (2603:1096:400:209::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Tue, 15 Sep
 2026 00:05:34 +0000
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45]) by TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45%6]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 00:05:34 +0000
Message-ID: <87ecevs7jm.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Subject: Re: [PATCH 00/10] ASoC: add new DAI functions
In-Reply-To: <aqf4n4Fcl_4Fe-x3@sirena.co.uk>
References: <87qziwliaj.wl-kuninori.morimoto.gx@renesas.com>
	<aqf4n4Fcl_4Fe-x3@sirena.co.uk>
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 15 Sep 2026 00:05:33 +0000
X-ClientProxiedBy: TYCP286CA0333.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38e::19) To TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB14118:EE_|TYCPR01MB9671:EE_
X-MS-Office365-Filtering-Correlation-Id: 366dd3af-0e15-426a-4966-08df12bd101f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|52116014|376014|11063799006|4143699003|6133799003|56012099006|10067099003|22082099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	I6jzUxCxpkqNAYSEhPL35NrPqXi9NVaTQ9eiNDh8w88/TwLnuo+vTRQiSwewHqsIyJ4O6A7npEDywiv0VMRUA1zl0XuOD6xR048VOa+KpykKRXuSVLjbVM/RHqHmv+GovLriuttlREdmH5HzT/bh2j6HCKoMhwiW4zFSTnfpI1o9MsM9TDUAfPvmzqVYPLnH3uITULTUyXwvQ0fANj+F/SLr+bwbc/fGoeGrmWITfXtE8Ve1tVz3wwCBcd4zfrnI1v+2WB6lq4OHzKzkdO4Z5uUCTf4ZtfdeyoOkFBnm6UjljHL+EohhRm97Gk1Hf0iUz4u5caRNZ5UvHIT5oTs6D6ovbWskO8oT6ComVNzXEaxTooltq1aB8+V8Gl1m+oni1o7Ld1jhyG1GFUvLLXdvBiUlet2uegpDXxTLOkTVxmmFvDmJRY2fpgjbOgTC8Bi/O6CyfZQPviHd9j9vNXqeABy0JDGBwO6o3OFBS19vw8FckLxjP8WHtWW3Xj+SuV8pQ+dhfaxjDB8b13klouGzK/CMuSWvs0K7Ioye3tUAfQ18NU6mcgv1covKR4XoPHX1FFE+Bw1M8+1TSwsEUUtmfaomDgQIt/hHo6ibMYn2I7umUj/ByBXNzythu9L3LovQSE1yWqd367AQsGboiTRVr8+Zlmuk42KcB1w9H8e4b6O1j319K7RAWmddLrIkEGcCCaXIE6mY+x8Uthd7fPJtvZfszfrBMweJhS/aO1TQ+08=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB14118.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(52116014)(376014)(11063799006)(4143699003)(6133799003)(56012099006)(10067099003)(22082099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?55Ox2HalvZ7LV2f11TrzPCuMFq/jsJhmvu+YSTtH520c4ZFQhq11Cs3NU8f4?=
 =?us-ascii?Q?E7MGqtKEoE25YMxT+R6xoIUBXQ9OfZOPJz7IGTKD2LR7mJciT61HmX47C+G1?=
 =?us-ascii?Q?3VPz2fQvao332hUjt7IdojSAGjY2+27gCxr9T7MlemLR53iXgax1up07ZGjU?=
 =?us-ascii?Q?jSVuAaeG16N+g1KxTdjRzGl+RhiCE5r+l1nuyVNJ4lb1msMkBTtc3u7aJwUy?=
 =?us-ascii?Q?56p7C04bYaNr/tQDt0aZ2Tqjf/kWotT+XUnmaZn0tYK1zf5ltRyjUF9pklli?=
 =?us-ascii?Q?tDnnV2HexidkK73r3psQVFpm242exuLgDRxp1ONkVYjA4hzaiPG6UNG/2vAJ?=
 =?us-ascii?Q?9Rbkz8RnJAGcFdEX/h9rSHv/VAMAihD+jgG7r++Jwha3Fc0B7zeKsZ/jcW6y?=
 =?us-ascii?Q?1ESmuBeGdIMeYSB+GgAEeEtTXljxgYIEMiWPEVad2z82fObIFbQrpLAj9UrH?=
 =?us-ascii?Q?Y95uYiyV8Re5Cdk00jo67IIWyFJtZS3MBGIzXlS6m+Az6uqlxHQoDUUWZTy/?=
 =?us-ascii?Q?NqIMntSRnBlXeeqQqgEs5iQvNWE53tSg6zsfYf6Y5jhfRo8VIOvlZua7PS1p?=
 =?us-ascii?Q?RrV8q9yE48g/Op35CwacVhbxtImff1poIt40bb6x0vJFu7vgDlxbIVMDRjW+?=
 =?us-ascii?Q?FDSrSAxYJp3MNf+ctzyWcTVxoex5vHm5y9iswWp4T5hVBlvitNV5t2VuPF57?=
 =?us-ascii?Q?6kIVshDUvoklwAYyNLcQg0IZ2kJ4yCuoKn6ZOfc/wsSaNXScSzkQOEcK361u?=
 =?us-ascii?Q?Fawkl/5jLWLfX2g+bfO6X2ZGQBrE0VtXrDZqUiIhAkoj9H9yCeg6OJbEycyR?=
 =?us-ascii?Q?URzgeIFTnkaA/fNfm3DSGmHpjVyedfEYpgzYt2Wt2WwzJ939m0afhYXlR3Hu?=
 =?us-ascii?Q?thSg103fNpEyl1WsMIJfk8mzShOsD/O/99iTNmAm/aYDH/KFg6nrgw8lgKIa?=
 =?us-ascii?Q?/Kv0PvygGx06ZAVZZ6CSuHKAxsHoCL4ub69mBKByZxUlusAWIFKL+Tm4Wqg1?=
 =?us-ascii?Q?Oi6duxuWWZlzXA2xSBx6TtAS7mPSq9J8j9fzRd+E6XEin/h9T+9eEeLD5wut?=
 =?us-ascii?Q?8kgfOnxNXQYAR1yfOL6hJuuxsv/8yIXYom401iu0sDEvfATlCbbgtm4t1BbZ?=
 =?us-ascii?Q?za35N/hFOwI2tyoSsWW78bmwcX23kDNQrEgQ3bu8yvTZhbirVDj2ymM+iHLc?=
 =?us-ascii?Q?5iWO+JwpG7gPBahlBtJoWkkE8AbWfVJBas/8HTogQdYCIeA5HldxX2NdbmEc?=
 =?us-ascii?Q?J8TK/oiLq0uk4vSHxl5lv7Wc0b3j2uiS74bN9nkDrkWJilXeAeUqd1TxIcNN?=
 =?us-ascii?Q?lK4BdYOgHvHQRucV0Fu10QsvBR3TTC9kTYkZvGc7t+aODDpRC86hC5QV8jRI?=
 =?us-ascii?Q?es8+E3+K5Vk8b2zUXFv1aNYeaMsaa4PTSezyEXg/tl098h35eFqHPPHcgKNr?=
 =?us-ascii?Q?eyl08bUdeKNv9y3VK3C7L6cyyczIBY1HFAzpwLaMAlNlZcYmFUVXzDjG4v9d?=
 =?us-ascii?Q?m9oHCEwNxcXSreZP8V2b4Xk67eyZKKcn4kOrapVpwC6SxNcMBtBr71wCfgzr?=
 =?us-ascii?Q?Io1JtjDcKSdDb05/vFwhdGK81uEGPkIGgj/NjSKaUd3oR5lnS/dpWRrmgPUb?=
 =?us-ascii?Q?1dF2jwTZUFxUAU/DWYwbegBhLfFkniP2UXt97qeu8Va8AiBOHWN/hkFRXP3L?=
 =?us-ascii?Q?L5/19y7dAT3QNB0PHMPgzFwdmIRcqSXkFFLhatXM2DyvTrdjdLLFsOMirzUP?=
 =?us-ascii?Q?cIt4QBDdj52VQD3zzQOv40V3GFUIT0i67Kk4lPtGI7Vnd92D/xvu?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 366dd3af-0e15-426a-4966-08df12bd101f
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB14118.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 00:05:33.9798
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gt2GwvK6N6oZp+ltpAR6+sfuvbsYqLCOOfHT9Nq/YJO8NU0rU2LJ6YZ+w5+QVt/6wwtNMjeiznrC5okv4OQ402ZbZ4qmMxmFNAoDrNSn2OWJKP13cjTT/Wp2IEwJfUlI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9671


Hi Mark

> > This patch-set just adds new functions, but no user for now.
> > All user will use them at (A) timing.
> 
> There are a couple of users updated:
> 
> >  sound/soc/mediatek/mt8188/mt8188-dai-pcm.c  |  5 +-
> >  sound/soc/mediatek/mt8195/mt8195-dai-pcm.c  |  5 +-
> >  sound/soc/mediatek/mt8365/mt8365-dai-dmic.c | 10 ++-
> >  sound/soc/mediatek/mt8365/mt8365-dai-pcm.c  |  4 +-
> >  sound/soc/sdca/sdca_asoc.c                  |  4 +-

Ah, yes indeed.

If it has small number of users, it do add and use in 1 patch.
I believe I have added each driver's maintainer/reviewer on that patch

Thank you for your help !!

Best regards
---
Kuninori Morimoto
