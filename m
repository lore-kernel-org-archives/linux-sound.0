Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011030.outbound.protection.outlook.com [52.101.125.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2377118A6CF
	for <linux-sound@vger.kernel.org>; Sun, 26 Jul 2026 23:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785106844; cv=fail; b=Q4BSHADtfk5/lt47xssCFc7cHgaVTVOzKGYkoT7eQbmZNSpHRvKVSrf2vg3s6txN3yg2M9cj6OZvyvc5/hx8WvDtps/LMIgnlK8hmOQOrgmlWmLkMp/8bsFhnLmeY2sxkr/b5Fgi6ryBmQrql6fCuSUdGO8KxSHJffSWQblf7DA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785106844; c=relaxed/simple;
	bh=D1AZXtabSn2vOvfL0fuqg6NU4sD95knKOBVyZffpHxA=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Tp1wWsD2+O1xM4mqNpeZYMMCxX/5FeORGdYe9z9eRz/sQ+u/hpZVfFSYKf7Kp2yDA59zFTKUxiT5M0H4HvAbyilioRGGAA2ohK+9iLjPVh9ADBvEV0vB61UW65fsfmTjqtZ+Fa/YdBILO14HptcjWpdMy6fmwy9gfcmzrQMm8eE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=QDBqiy6B; arc=fail smtp.client-ip=52.101.125.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="QDBqiy6B"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g8mNrqGlPyGMYudMoxHRiPZZpy5PRqo04cX6QjYbcTlAe2CxxH08sVajfDluvoLi8TBbCQbdAQgWDM53IdvlEILRD+0j9ZOyQzT7Bf6mRNb/IZGNa/poEZf0gQCa4thXKDfTfbOMFeEniIimi9OqJ4YSFFYCV4Z9+xAc0OlASd4LPma8l5aSir+jK6d5S4J6BEevQ1JV/KwUc9Z8yky3WVg25jVVBwXr4/J1rjO7664GrosBhmO5xS1vhfUudX8E7rhlvARVBysnoWlqdhcoIhjrMKwhfYkDqvpAFzljRVMARslAM8p4CRgAQS/zYhMrGuDwh268tBVz2TDpZS+Niw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZrvlhkVmvJm93EUN7gyjN7SY/wmB6AMj+1gls/3Y054=;
 b=GDHalmJOTqMPo+xySj9T5mojmr5Fcja21RDMTzHwHJYfAtK5cR1qvbnfgIooGw4lnppruN6U5LoN9G+g3+fDXBJj14s1Y+YesHz8w6hcp8t2OlVgvIBSztrFPD2+9gMvgW1tsBnJqlyJHdp/3oLV5TE27VrFRgDKb60FtW1xxSolJtpeAwdLdAep8Coj9lFJs7QeZWndfq1mkJe1Hh6Ng+sKEVeIrMzzrP15fM27zZQC6xcwMOwfY4pGokIbMxm/SYFyI/Opz5B0/QdTgh/TgLlcnDhp5Nzu5z6TqikHdPS3NOL+MiZVMEusShFnx6DrRpM202xS84cwha6T96E7ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZrvlhkVmvJm93EUN7gyjN7SY/wmB6AMj+1gls/3Y054=;
 b=QDBqiy6BzL3sozXBwpk64Lc39eYq7/J+RqwuB7UpJsiJ1FaFnxnfhULIKjgCfU7XE4zHXRtDJfDNAPd3X/htlNZwWZTwTbq9hhZ4p3Ya874DiSDZ8EGTlmtX0feLSxEiDaJURZuN2ndW8PtJZT5aCB7FlcSGMG+UE/kywfilzxU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OSRPR01MB11725.jpnprd01.prod.outlook.com (2603:1096:604:232::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Sun, 26 Jul
 2026 23:00:38 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0245.012; Sun, 26 Jul 2026
 23:00:27 +0000
Message-ID: <87wluhbbli.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: Xiubo Li <Xiubo.Lee@gmail.com>,
	Takashi Iwai <tiwai@suse.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Linux-ALSA <linux-sound@vger.kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Lars-Peter <lars@metafoo.de>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Fabio Estevam <festevam@gmail.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH v4 01/12] ASoC: soc-component: move soc_component_field_shift()
In-Reply-To: <amNjHDwmGHqAWh56@sirena.co.uk>
References: <87qzkxjg53.wl-kuninori.morimoto.gx@renesas.com>
	<87pl0hjg4g.wl-kuninori.morimoto.gx@renesas.com>
	<d2670363-bbfc-479b-a214-62aec13dde7b@intel.com>
	<b0e44e5d-7649-40ed-8f17-e61b654c1733@sirena.org.uk>
	<87ecgutxhe.wl-kuninori.morimoto.gx@renesas.com>
	<amNjHDwmGHqAWh56@sirena.co.uk>
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Sun, 26 Jul 2026 23:00:27 +0000
X-ClientProxiedBy: TY4P301CA0029.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:2be::12) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OSRPR01MB11725:EE_
X-MS-Office365-Filtering-Correlation-Id: 9dff1c27-bd5f-4bb2-2140-08deeb69af37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|52116014|7416014|366016|56012099006|4143699003|11063799006|10067099003|22082099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	xQ8CNk+5KvQDlLBXMsJ7BppOueeberQjkwrHinB7Ibrq9YSIzJF2yeR5GCegcA4aqXTnwbYEI0Y4tw/3hvh0M5f88BcuomPq3RseNWt62fShZhLEJrZvSX1d4DvtbJgQGAGxAFC0R+eFV0/SyCNUGmMkpvKn8qFsK9c68NAXdStHllM98OlS31WvpV9PtQ1UNXvYSXn2bqcvBydKOX+hUWi0rzTd/MAdgunfwT0fRZJ9Zw4lSzGQcvf2czYTf+NWpTOXwLt1uWi10JeKZZazc7Dl4D3P4w9pGCDaxbgAuVgcjJ7OI2jFbfxsKrfIjMK/QEhUgi7b9dJIx2L9HY4jJdU/TlqsDbouMkVTZJTD+1kQ4iIDt7rXBZGzDevTPvVrFXDF1IL2s67wx0uSxjfUV9KPq9kl56rKdSXV5MQqw5hNypI1SMct0yZ5MQtU1OfB8pM0Xnkgn1QC9OXpnXnoYa+Cn+Lyk35dGsjm0YFnkPBQeVS86R3+st8PqHqVOi00/V3E3fYAxWleyJ+kcV+I9/VO9DXutP7dnrb+eJLsD5jhKBz9ll1Jj3hSftlQpXM4eaf2Z8vBQuTUjuxXsYfwoO4onRgqhP8xStzGDn17L/Lud/dYszXIFviJcd1KXgB3yed6Qf26KLpP4T4ygeuaV0C1vgNewehrEvO723cic0vYA0xSh1wZDMUqs1tP2to0XUfJO8rcQUKN4GZLuhVczQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(52116014)(7416014)(366016)(56012099006)(4143699003)(11063799006)(10067099003)(22082099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6YPqLSlH8MmctRH0jLZU2vv0sziVGhZw65zfC66mZ1WkTbowclb31vqOI1C2?=
 =?us-ascii?Q?zefOj5Yt4sA0+uEBYYEDHyP2L26gzwmtiP15TBEXsvaOXWERpp17AR9vYN3y?=
 =?us-ascii?Q?nOOI23KNrT7b3PZQYz3VdnKOXsu9YeqJ6H0a6XqumwLrBPkRYkZ1UHnNZom4?=
 =?us-ascii?Q?jbNdRXaGKEx5q6UuvrArmFoFDg6hhS99NMoj+za9TdDdSSEAJ2kE4ZluQSbU?=
 =?us-ascii?Q?Yx6umQH0AtEXM0OhypVCdM3Txcwg5ztdJpjeMpX++Osq2nfB9C1o22AV9ICl?=
 =?us-ascii?Q?VzzOM335WKWwXFiiwkiNf5ewOWtWnhUDH/FT/MlsrMtZrV4OS+3a8GuzJK+n?=
 =?us-ascii?Q?hqt7WX54x1vnDlwbbcC8c80ajpjnj1meUrXKItiZa/b7Hd+jXVtiR6iPMIge?=
 =?us-ascii?Q?JexwZ05mUYmRMNiF6N+n+/sFPEEUnve64eIrIcOjJpI1VqZU9LWEQlDzpF6w?=
 =?us-ascii?Q?Kp9Ghzh1WwBTLmYvlfBkAztJUWuL4x36KbyicjOWfyCSjAgIIiGrcHvM35NH?=
 =?us-ascii?Q?zVZUeCxbzoadWITOYOu9kXqmR49G1gIIfOgaG2a+TBPxVaoYh0lkFPX+mZec?=
 =?us-ascii?Q?D/5X2sqECcasB2zUP4MRVU+aEE5tM6ycRo8/G6WSugkfOM5pGDxXdA+dAELU?=
 =?us-ascii?Q?71c7mm+Z7DHcAmhFa1Wdn2q/PHg64ZS1wzTUoZ+dnC9V57mNZhKqIfx5BAPm?=
 =?us-ascii?Q?35yMh+qakIhB5eFtPyZa9KkaeUbJLNCG5CM94Ckceg0yQ8PjqanYO53wIx8z?=
 =?us-ascii?Q?c+99UBXTf4lVF5//hsg4Y9AyyIrum6fS2tFJDeMj7OKmqn/803NNeHuSreQ0?=
 =?us-ascii?Q?0B6iig9wWNeLEZeyBSWRHP1EJQjOVCDrGEMYaYWO7w4C9S7mnyb7r8DrN0UX?=
 =?us-ascii?Q?2kWE+FgvseLZbxk5eC6lKbWcb4PhzLQX4njuu+5f/KPwD3i4o+zJqKmJPP6t?=
 =?us-ascii?Q?ZKM+8Zpi+eXDJdXP2jJ0nh/weYYhauguseoVpPxnD1/JL8B00NaxPcoR+Yqy?=
 =?us-ascii?Q?PoC369XiFbCUMg2YKJA7+Iu+vStGwfZz1J5xhSL4oskCJ0rmMJXs3HvRr4gn?=
 =?us-ascii?Q?awFfmrmRSDZiAcE7fnUU7/Uy/bEl2ZB5TB6ldtvEXVJqObLhnmxXZUCUCtCO?=
 =?us-ascii?Q?7gYj1Yduh7oWquTCfVyWg5bA/w6sZ4qkV5wBLMlA6FgixDebX4+AA+ZNLahb?=
 =?us-ascii?Q?iibYCwYtKYiwPz4MNP08tdhk9cP2/FCbVbHXhrb+EAHqjCCT2bUBafEPhtfZ?=
 =?us-ascii?Q?m1OMPwIOlIz3od8hyzZvZ78fczWkgpIWDnJmB9bkFQN+d291GFVFItVBbX11?=
 =?us-ascii?Q?T78giWj8kqor3b2HbKtf0kGoaVhSPZel1SataGEKpJ64v3F7cPjBr+655PNP?=
 =?us-ascii?Q?9DUUsuLMnIpJgIgnAmpJgxKE0ZUyEXBFUvC9CDJBb3eYtDK2tj/BxVGxOLHr?=
 =?us-ascii?Q?9JkOtwOrpEdSoDAgVUDm5KVHpQHAvyePyLtpimVOtMATf4ZGT2uyZBUjKord?=
 =?us-ascii?Q?0qhaKGz1gLjQEPEgr20J5eRza7hLvnLfqJFeCuWJE6UFx+dvMiwh/6kh34xw?=
 =?us-ascii?Q?jepyeBIrOPH+J58bSNFpftCLXrRNZVyvls7TCwKVcr93hiJGPNGSF+3JsSgO?=
 =?us-ascii?Q?CkrtKZ16GFQXun0bT5wRJBY6x8Xd+/izjthmgAbhdhh+dH+h02WqVu5SiDwR?=
 =?us-ascii?Q?UK/y1mX7ile2H8mbacjbS8iVn4n0DlDLZDRE7S2uS7C4YKLTZmq4ESiIrZ+0?=
 =?us-ascii?Q?JQC8g+HI7ypVqC1sjWDYci1WLql+un0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dff1c27-bd5f-4bb2-2140-08deeb69af37
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2026 23:00:27.8279
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8DTOOkpZ1IJpmowAvnbwY0Oe1VVvXQnRYcS2PNRvbfCo9iIOpb1rzkkNcEwa44ZUmxbXqkAbnMBxST4fM90cApkTyacFEf2KFJZ5lT6RxJB9RTtEauI008dBknTr0GEJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSRPR01MB11725


Hi Mark

> > I'm not sure this is correct, but my rule is that the tag is added
> > follow along in chronological order, like below.
> 
> > 	- Reported-by / Suggested-by
> > 	- Signed-off-by
> > 	- Acked-by / Tested-by / Reviewed-by
> 
> > Thank you for your help !!
> 
> Generally you add any tags that you collect from other people
> immediately before your own signoff, that means if I gather tags for a
> patch you posted I'll put the tags between your signoff and mine but if
> you collect them they'd usually go before your signoff.

Oh, really ?
I didn't know that. OK will do since next time.


Thank you for your help !!

Best regards
---
Kuninori Morimoto
