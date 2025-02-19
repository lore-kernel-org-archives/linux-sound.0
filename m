Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010036.outbound.protection.outlook.com [52.101.229.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 318BD2862AF
	for <linux-sound@vger.kernel.org>; Wed, 19 Feb 2025 01:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739927967; cv=fail; b=bMx/epZfyV4XJpLduZAOuxO60K75uX8DIaHvnBLy41d5RIaznclLhq8AgBrcjVpgrAGr9SOZ35QyU9XOjpInoscUC9jVdoKnZ2IdCoIVymDX5tuUOrsJAf1hvsij6FBh4OpssR5QeoWYfQt8tjcyBM6SdL+tqQQVLfygGGIXbr0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739927967; c=relaxed/simple;
	bh=XEpc1whDEi1WD/QCC+FC4fmrpMYMcll8hTOZqMZVrqY=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=aNl5XyeFvgMpR8kHMDPHzmsTUDfbSm7XtXbvEAUL9UT5qUICFPixYND/oeNSM6xwj/8q/tdk3yr37WES/csUxemy94lSasPocxANmF5hBj+VnFE2GcqfLWMm58DXSVrx0EG9yMq1PtspFETz/6ETnfT8+v2DAHu/x6/yaFEXEaU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=XQGKicRU; arc=fail smtp.client-ip=52.101.229.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="XQGKicRU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T3IM9EcFWz3Tc/c52VKBUdhU5ZkH9JvkkeYN0ZjZUQevjxGRACNUYL/mEIEJSmzPq9zXVgvqldHd1Y/rEXM218blDm7kj6x9u5J+CtL0JvrslOkLYTehw/WfbbCY1brVSKibgzhBKexChEEzRixSKRXuZNfb0ZudqnAxDf+WTe2Xl5lEUkA+j1dxCGyO1OpuATCJSqMxI3rshzZBGfrLK6x66lUtW5LlIB5Gvx8xlGfFgN4ek8s2izbXRknRu+ThYnf95GfSsb2lmfU6z1uX8cYuxvs0uG7NLg5UqSfTGN2JOBo/kyPjX7DEK2deTL5c7HcVPUToNpRr9Qbp+FNYqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NHcui69reIA2hVu9l1PDn+/vZpQtViiwLO9v/MG4rQU=;
 b=ZUOL0KbDdkrn7M0wcehhQ5csefbGSd7AfZN1bLL2aXILsQrx6RR9VH4QX9bVFnpo0ZrS+GuQ9IBNuxZeFXis5TDxvYwTJV4MFungKk1PipLdjcK0fILENmarxyxKv3b68NZ16dgrHIo3XeTi0e7PCBU2REVjEtmZqFiCLwK5pFsUI7kfQ62CiHUEFNvOd4DnVeekRWDMGFJ5SEAPFlp1DypL52EomiTUSoLcacLliIMH3TaJRobGlTEPcttOSnbk6jqSzl6QJs+/jIyPYQHxAsOU4SPKHQgHknwTMZa5gjNnrIlrewfLeNCYjyJBj1NAVNWg8eMhn08smynK8VPGjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NHcui69reIA2hVu9l1PDn+/vZpQtViiwLO9v/MG4rQU=;
 b=XQGKicRUWFt9ZSinTDktj/DHrqdAVmd+wmfyP/TR4S7vkKTxmH0pj5U9CbhW4tN3IcRgIHKirCtUxSjejYZXAkP8QatfHSbyDAndemabKIehHL5jJtsSdLrKxUWWl9zsfow4ZaP2pOjoJhfdsbXTCkOTRgkx2qhrFvxhzPAW4jU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB8705.jpnprd01.prod.outlook.com
 (2603:1096:400:189::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.20; Wed, 19 Feb
 2025 01:19:10 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8466.013; Wed, 19 Feb 2025
 01:19:10 +0000
Message-ID: <87ikp6vii9.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [RFC] ASoC: Documentation: DPCM: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87jz9mviis.wl-kuninori.morimoto.gx@renesas.com>
References: <87jz9mviis.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 19 Feb 2025 01:19:10 +0000
X-ClientProxiedBy: TY2PR0101CA0027.apcprd01.prod.exchangelabs.com
 (2603:1096:404:8000::13) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB8705:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a7f4477-e0db-4f68-cc75-08dd50836a0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LXxcdOWF9ZLBuqiayppl7HUhnOLZfy/OCwJvplgQadcCtNpaZ6RplP6FHSz+?=
 =?us-ascii?Q?X7oELdaIsNFFAD9t0HaJlQeQH2G23S8Ka+WKy5GYC5838slzsfFRYLOQ+B7b?=
 =?us-ascii?Q?EfFuvjsBEdmh8ZjEvuLz7vg/atY7s2Hg7Pr3xEJaERusoRQ2Q/VfYEIaLhFa?=
 =?us-ascii?Q?jPTrWua8jKAisj510Ir0yuFIaCb3QZJAEUQ+fMoZbpItxC/EUtIfyaRdYbRZ?=
 =?us-ascii?Q?EPyUXU7hL3JzGELapFcQO9/EFwa86dA/tH2mIXjAHWTAFxY0QWjBIgUbXYdq?=
 =?us-ascii?Q?dJNVSE6hBG2IKRaHG46NFtYVDAE8oh9jSOWGTIhgsPehOTQvAcIzF42joVZB?=
 =?us-ascii?Q?TntxDsaQRrs39XLeF9NbJNsmSWmURBbp5yWo49Qgl2dslsmfQlQRM+xnttgI?=
 =?us-ascii?Q?+OeZtMf5HwrUCyLf44DIEIfoSLVCpXYhHL2DvlqiP1InSPnIepRA+WuqdH4f?=
 =?us-ascii?Q?v5OfI1xdLDdyLJJkKooD1voZxoJGXvkXyIkzHn49O4sr9rcZF8ZByHegBP4X?=
 =?us-ascii?Q?oKxWewYX1mVR+80rMYhEPc9hlXaasTxZencjBl+J/Nk7Jx7JxGOAgB2T0YUW?=
 =?us-ascii?Q?rxWJUC8DPMpJ0FRF9YDocJzGTOvb6/LlHw/cvQtAcLX1lzeflX1IQbcXOw4w?=
 =?us-ascii?Q?CLBV1vfi7nKv2KxSWGi8DqX7o1BkloAenu9w8P9x4rmFZhy2ILl4E19e3j4W?=
 =?us-ascii?Q?lL+5aAyvXF7/UFkxSJG4Y8798JWWRsyESs7vzCAUIwtnS4UCAHo66yJ5U7wh?=
 =?us-ascii?Q?xneAj/yu+eMSTRvt47ln04fO7/pLo7R4srVNye+j63mME7qHdCCF/VnFZgwB?=
 =?us-ascii?Q?x3nVEZ0sVWK+BKs7WrcMVlj2yf6SbJDOI9Q9eBT9F+6faP3B3JD92Hh6Xpkz?=
 =?us-ascii?Q?hLfI0rXFkJcr6RZymdgZWz6o8xTmLy3OR46U8xiB305a/oLgjq14dXkBLW6n?=
 =?us-ascii?Q?RJ0ca9TablnCBC880XEw59VqyMz0YICxbUt8h11/7runXcYB1wklm6ARGn5Y?=
 =?us-ascii?Q?Ifb2pU7FNVq2dTSTYyjPaFyOOZ0TszWIbEUXcVyfH8VB4rssXVEUemV3C4yF?=
 =?us-ascii?Q?ZZr4yY4VwglEVduoh/zoEakqM4Cktv2GAmtKbsZFPG4JB0ELaQtVI+efHxCJ?=
 =?us-ascii?Q?mdOEqhsTnPrBs/i6QMN3qf/Bnz+kzsuWYaWpO2lg7Wgo7Cmw4Y9VCKsC8Wng?=
 =?us-ascii?Q?Se6hGCYBhRy8aqojbwgNwecN4mhwDGvzcplugcgGrPCTciQMPeDE715CfAiZ?=
 =?us-ascii?Q?M6RB2bg220KTi3S6C733CUe1ptv4WfHj2wgnkzXL59HiEUawpe09iJgHldCI?=
 =?us-ascii?Q?b5whncn9/MzAQTpUf08QbLgyyZqUpPp1ZFUNFnjA9RlbSOas4qJiJ8muNnXY?=
 =?us-ascii?Q?wSwQpCMGcSIxmiUPsWKZ89zyTZxFtBYtLnPuaxNqnaAPfXMWIjcuAfksEgps?=
 =?us-ascii?Q?+eKq7kpWLM8Vab96u0vdNa56xZ6zPKST?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?k+IVrnTqy0ZgugAtPKm0FBJ2bFRHK82Hh3Mh2cwrJBGJ8Fxd27KoJHRPcTR5?=
 =?us-ascii?Q?fdy3OYpoKoLa4sr87TfoLUCp+iVhNZtrXl9rQnfJqgRp1IGPd00Ok3ztxQlU?=
 =?us-ascii?Q?Q1DRPp9pscH798PjQrOGenEv5bWwBuqPu00fmwF6IClh0+pZE6MpQQ4Xt9/I?=
 =?us-ascii?Q?WrmI9YPSYUwaYG0jBLVijWR1EvNFVNFMv0GkBNMec8RqbayshzQBsbVFAiz1?=
 =?us-ascii?Q?ZjgwqOG+rZzFCmvVjlDsWNoVh+SkZnV54rc97cuHlwcq0CWJZNz6B5KtS2yp?=
 =?us-ascii?Q?Ob3F+yiQ6IhiTXo09rcmokyCevwc/6vsGSwUXtK3HSftcDibdkMLAydxGuv5?=
 =?us-ascii?Q?gTl2kQ3tiShCb6EVwSYnPqEjwpjqDVdhMuJ9iH/o8w//JPmz+LMdM0JerCye?=
 =?us-ascii?Q?YL6fFyus8DarrUcXGiv9KmaA+8+7Q3Xpn6wcke/H6GVnwVibXmope7NWZesh?=
 =?us-ascii?Q?zE1fBSA/AP4oy2Uqtm6lAA/HPAx5Xs5MuR2gO0RLt+odOrl2OML1DK7UUfTO?=
 =?us-ascii?Q?Qy36OerWr0Qw5ezc2NJIvNNGRfLYV9+QIi3AbGhoXN0mcbcidbd58ei6hcoK?=
 =?us-ascii?Q?9tuNJHp3Ie8uj4ETBeCvFEw1xeN0efvo/PWmU5KSoBSGCeWQu8kunxBQRuEy?=
 =?us-ascii?Q?9zcp1nJQCD0cthmclVBqAfQKB4ap9n3mY719NNh9zY+3psN6HgSaw2NezePZ?=
 =?us-ascii?Q?Chi+o+ByoGTRvj83Slbw2NUMyyzQCSeyEeinfBEdkMRqtyFp8TrQAC10gLsg?=
 =?us-ascii?Q?w2mc/llPc+gexTp4/XbOMxRvnu1Pnp8eFEVytS7DW3m7HIC42Go7MJZQhFd1?=
 =?us-ascii?Q?q5XAPR4gxcKKQG3kfNuhS7xo1fd/2kxx3HgvrUyVI9ZktUTa0Ax3+/A1b0BW?=
 =?us-ascii?Q?YZx2yiEEUHZ8oN/EqOcygMfpB06XqrG3pE0NVv7p6bTKwHdyMgkdYDuQ6ich?=
 =?us-ascii?Q?l0pnF4eKaAWeGHL555w2RIm52UjXkE6jtgZ8lMWmnFKf6XpwyqdLdJTAX7BO?=
 =?us-ascii?Q?k4ib+sqGNX8tR3HEuKg8MuaUW7zV2lf1YO6iJwWJWVjkf1A4FNNzBGngDYhF?=
 =?us-ascii?Q?+5k10Sgp7icIhKkYWeqs9WObbTMyJjq5kZKINbZoc5IQknnkNxbkiUHR5AbA?=
 =?us-ascii?Q?r3sJrM8nzNBnzbXX+Q3j1o6xzu/WSRID/1a25oRyK0fw7a4ARnhnWrRtLLJ1?=
 =?us-ascii?Q?VGXG30lfkq0o4bPrnU1FyaAynRIrIUNghm8PqCr4Y/Ru2QfykUolMRuV303T?=
 =?us-ascii?Q?YyT3G9sq3Fuj0DBVQleN/pBw+np0TU6OWJTHyEmIRngUTB2qyvzmI5vnvTXK?=
 =?us-ascii?Q?0+VQNp6P4pgcPbsgAADtaattybcyMVgy80Qr1GLSHEX2FNjzekUyV3gmg1Y+?=
 =?us-ascii?Q?726Sk3LLmKqfAtRj0pnB7N3EGWzmO88KUleqxFh+bgcDu8q5D8P+HnaHgbv+?=
 =?us-ascii?Q?Bhz0HSFZtLAMlmwEDgMgzB797WRJyIrlVxiHIFAK13emRx3zvpMZ4teugCT2?=
 =?us-ascii?Q?qxecB3dPdZyplSoaBxo8k0gp9TnuQ0tKShAjS9dZzhtZTNNIy/KmEQzPDlOq?=
 =?us-ascii?Q?y27z4/tLk8xdvv8h4lHcXHVnUbFsGsw6dy1iRx1V8WWfho0Bhpd64U7KWx7a?=
 =?us-ascii?Q?xRI6581zIW1OvctZFPVytc8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a7f4477-e0db-4f68-cc75-08dd50836a0b
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2025 01:19:10.7628
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e6Pc/0aEdaASXy0oa0gfqAyb9Gxo8/KuFc3aBceNWp74Roh56UQ9J0f4m0bZosXz8/YPbmTIrhI1kIDJsa/T3OBosJ5+QLwAJWRORcnLRg7kRaMstbSQqeIeY4syvaD0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8705

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 Documentation/sound/soc/dpcm.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/sound/soc/dpcm.rst b/Documentation/sound/soc/dpcm.rst
index 02419a6f82132..a12636552f502 100644
--- a/Documentation/sound/soc/dpcm.rst
+++ b/Documentation/sound/soc/dpcm.rst
@@ -362,7 +362,7 @@ The machine driver sets some additional parameters to the DAI link i.e.
 		.codec_dai_name = "modem-aif1",
 		.codec_name = "modem",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
-				| SND_SOC_DAIFMT_CBM_CFM,
+				| SND_SOC_DAIFMT_CBP_CFP,
 		.c2c_params = &dai_params,
 		.num_c2c_params = 1,
 	}
-- 
2.43.0

