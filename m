Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010068.outbound.protection.outlook.com [52.101.229.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45DE4238176;
	Thu, 12 Feb 2026 03:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770866035; cv=fail; b=AuI4/w1i3xsZhRiVInJBqUZ7fnYEasLzuGFlfG2B/Gz1OMZnhgNVpwyxI/FG/1vWO1egRV5y8DIDb8kSWD6BOoNKrv8cAom45/r9mk4YtHPxQIjn2sMHllPRxzuVk9YqueUAI/1XZb0imoKkvS4rL8x7HgL3N+ugLODnjkQjvgc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770866035; c=relaxed/simple;
	bh=I14ktn5BZo5+T85gYtQXE7yLkVLw9luMCI5iRwkUWl8=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=n/SGerdpk/PUP5DvOV4cRwkdpvetDT/+d9lx36w4t2AYmNCUlYmAIVMLBoiI7IwCnMAm7rPpeE0zLsXGYm8eWC/Reaskrj5B5ztkZ31QYvzf/P6/X9pN22N7i6jBSWePeY9mZqyE9XA8v3/apV541i6GVI0BOajVBCuD9rbWX/A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=m4Q5Kie7; arc=fail smtp.client-ip=52.101.229.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="m4Q5Kie7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w8PJ7X7PeIv2JwwlXCJ+KZQCe2NvZbeZn1faXIuV+eaEYEABmiRrLlKW3PDz1K19njMRpWwoAmdxa3EygL/oAFU/0Y49c5q6JLf/itE1wp1PaXeUaK+WUH1HwgSBA3HNBQ7eKJCW8Xmbn/oeVJkBF7+7oupBjBELHRw0Y+MGHBgNTvLsJrfBIjvjdxSPJmKLAFA3FW4wBAZY//vVDtCNIPQiy61sdb+eETyJfxcB+VmDMXkW5r24xbPfRqFzSIZIlkZJUoxpWEYcsd6xKii+YowFEezc0KVGCHPAmspcXtulnP+XyV+IMdtZnzm51eSs2h8z8IwRDXzN0+qE/W68fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BUEsn/CfR+WttCEdn9RyKklP8HW96xShpEhx7+RELws=;
 b=NFCFBOEhSGeqqcQKf7cVHojXhQtL3mytzOq5nHgTW3viNrK1dpQCqww1xsUjqJJRxQ+J+bNdL20al/XbAOhz6x6j3Axutg8l63auD0IOpOBPQCh9I9wRWM/RDOvtqa5Zszax52QRIqNJAP77HG+KMjmbpa/XwGuIg8fo6kNTN+JnUnMxVkLljsltNHIGOXonsTYITk7kvI3y2oALTFjcq2vo1c5Gam+rjAnvxrEdY9JCgTKC5M/1/VkTEanQuwdKE0Oeia1xuFCF7WsanxOHum7TXWSmQXjXHQxwYbTmmHBxRG+AFBKOrWZ7azQtWN3L8j4IDb929NvzMA6fUoN8vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BUEsn/CfR+WttCEdn9RyKklP8HW96xShpEhx7+RELws=;
 b=m4Q5Kie7iKLBd7Gmf1xjZ5Hza098Oqi5sNE91eTwl2OXXVfuwsGM6gZGtgFSf+NcyjjXQvkM+ev35/7uK9iB30O9YibRKZZieB+Q5l4y8JnQTX8NPl/I/1wMF89lQAD9TgRhZcbSI1EEu5QZqs/FvcCdzF6lgdvSfmD+BN5ij9w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB13067.jpnprd01.prod.outlook.com (2603:1096:405:1bf::6)
 by OSCPR01MB15895.jpnprd01.prod.outlook.com (2603:1096:604:3ee::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 03:13:48 +0000
Received: from TYYPR01MB13067.jpnprd01.prod.outlook.com
 ([fe80::dac1:6ae:15b:67ee]) by TYYPR01MB13067.jpnprd01.prod.outlook.com
 ([fe80::dac1:6ae:15b:67ee%4]) with mapi id 15.20.9611.008; Thu, 12 Feb 2026
 03:13:47 +0000
Message-ID: <87o6luu00l.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alexander.h@variscite.com,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>
Subject: Re: [PATCH v3] ASoC: simple-card-utils: add sysclk ordering support
In-Reply-To: <87y0kyu7iv.wl-kuninori.morimoto.gx@renesas.com>
References: <20260211112815.126734-1-stefano.r@variscite.com>
	<87y0kyu7iv.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 12 Feb 2026 03:13:47 +0000
X-ClientProxiedBy: TY4PR01CA0109.jpnprd01.prod.outlook.com
 (2603:1096:405:378::10) To TYYPR01MB13067.jpnprd01.prod.outlook.com
 (2603:1096:405:1bf::6)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB13067:EE_|OSCPR01MB15895:EE_
X-MS-Office365-Filtering-Correlation-Id: c2492ec6-0a5c-4f43-ed5c-08de69e4bcab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?eUlYNsBX5t0cBYQYhwnrAe8lveMnlcOVXyZZTprimQRcfcw7/SQetTYXHqqV?=
 =?us-ascii?Q?Ipkg1tNWiOns0phYXY+2uUj422Ls6vRs2t2ZqQT46EPtQ+QvS3MXWPGXzLqk?=
 =?us-ascii?Q?PfepVdBhIOw5sLJb9nNkMRzZDwj6455m6MWPfds4yPM1sL9EF583Q8qh3UAO?=
 =?us-ascii?Q?qeccFzfwp/lCn/gMVd8ZD4lnKaSBjtLV9z8P+feWGv0hSAbSfqyoumdbqHRb?=
 =?us-ascii?Q?Smh/gtxu5Xbv06ua1olmx9zxW8KBQ0phJ106/b4Kbi6GFR6EvX2fn45ArGR1?=
 =?us-ascii?Q?s5SY354s0w1VYZc4J9GYOIT2sO0CRfRESdkhmjeWc6IFOUsn8qO1WsQTnk5n?=
 =?us-ascii?Q?9IILvm/IJx8xaW9fkQM0zMv7yceNHiKPkmNnJlKpgA8kp/9FnQesPxY0UYCM?=
 =?us-ascii?Q?sUYNzc73Hkj5s75WrR3+gwW5N2DZVPdsWpWwx/DAGytzvHS9Ndu1hfRFSrFw?=
 =?us-ascii?Q?Haa86Zi5JLeXV8XyE6JZTrgxFu/puc6jLoit9btJZ0f39pwN8M3h1DbNMMz8?=
 =?us-ascii?Q?CxSsDWcPuQ51OAS61EjiRj3w3PqjMAdwgcqcUEPNQbb0t68nd55XxMHq3ogP?=
 =?us-ascii?Q?phCca4hcsSYXPEkplEmqiIT4do//WSgJ02Ohn5ic87Fz8FQhDq1duEdE77ik?=
 =?us-ascii?Q?EbZnMXXfQrw8ig6geYBqoAdvrkdXDivNny/SEj3sK1GxrdYebV1Og+MpEH+G?=
 =?us-ascii?Q?Y0M9teyiNqtQackK8EKwN1CRinywRoIjASTXu1JA30I48LL7g/8NBvmKfYcE?=
 =?us-ascii?Q?vUXDsdKP824TRjCLclMmv2Y2yufDmfr8vKCls4njXpR07LX0AAaYvk0LF6No?=
 =?us-ascii?Q?l5kZsHQ0dUGMqoficBXzn8Uui6d39OZAj4KH95LwTL6zOAnkxVEz7bHQujyK?=
 =?us-ascii?Q?vSkjf5iAfth6BWcvUcOLWH4mNG+7tbiWSeDs6eiqSHvm0tPPV++4LVrWA6xm?=
 =?us-ascii?Q?yVuOMlHJq1YEhJC9JzaXjKgkv4bKpc8A/1/+cu3Z3mytD0aqOydc3CzZetuQ?=
 =?us-ascii?Q?nHYZkRg6SCcN74F7y0FalIXbsPZRLNhwsTaFPpHPCVsyGFc6bRKN4yFB2Ves?=
 =?us-ascii?Q?HhPOSXgyPo3UhCSwZGhgLDP8mSKfiEFUDeA2BwxNagEjr4rgiExnL+V7Ohup?=
 =?us-ascii?Q?me8RCz68tFMOmVKibL7/FnSbLTGZ7NizifYBr3d7PBH5UPqBsYMAhkugL6Mb?=
 =?us-ascii?Q?X1D2p/+oks6Hyl2zPrl6tDDAL6ZkZG28APNFR/LhpwUnDR0y3tAQSWJNF5fO?=
 =?us-ascii?Q?a6hP703zFeFQ+q2UfYwciwsQnHXibiyAZ4cC42vF1C5c/OSKy4qiv/otAgQ7?=
 =?us-ascii?Q?7mp+ESPEs0ZqOKFM3iDKzWD15dg5ygwpJLU6GsOAzVahtIL1Ngblv/ZAAJV2?=
 =?us-ascii?Q?xKephKefn24NEQTeVSg+1DDACLcf3Pckid4rtnivI2GQKDOWNDwnm7SUcZRC?=
 =?us-ascii?Q?l2OsjHywZlqkq69qBzUtARjoyCZhIG0P3U+6LvYTCOG+zpmPbpcha0PiZqy0?=
 =?us-ascii?Q?iYs8KDpxa4iWUgKWsT8Cgv07In5pOYSbXyWQ3pkN4XAMQ5fSKCjWr0Ik3NIi?=
 =?us-ascii?Q?CXJlG0/C36uIsZM0EQfa4emFy2YpnNw3tVxPwDnnx766hhUoKzTgswCoIHTk?=
 =?us-ascii?Q?4nk28tQ4DkSgABpsTPuy3Hk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB13067.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?o2tf/epSKtPkegk02g2+CSI+cUNN2lve0lQZGQ4SvK+1B5546NY3iIaNjB88?=
 =?us-ascii?Q?npa96mQQ2EbhpmAouSOWtMBJ9pGA8vtnExsaUWIZ1kmZJx2n7ab105B0WcVQ?=
 =?us-ascii?Q?l8xj7jvoVLIhTLGMO9++68XFrEEbewOQos5x2p5E9VAYumcvD/wxisSelK8b?=
 =?us-ascii?Q?/cxWnbJujhgmCAYlSU81J97uK57XVQiJvyvXtOkRoCDSCkl8I9SGl7yQaiUu?=
 =?us-ascii?Q?Qx9LEBx5EUOBFqQMK0X0la+k3coSW6gkwLImcYIEkQqfD4n+zbga+7/OMoCw?=
 =?us-ascii?Q?Ey7tZg3DSaGMW4Sgqsy1z/LrlyUBdDdofx5l6dsIHlEaG5BzKQWQJJvyerJe?=
 =?us-ascii?Q?lJyA2FX2POfOXc8RNFfgggNeUiQIU9+25jQ/Y4J/Wl196bGAFIFKz7/0lzyz?=
 =?us-ascii?Q?0DFuexWTFwWQpep7391VDyP+VSfsWGb11meSsf+lM+dj/LYXMSwWn4+3/q8N?=
 =?us-ascii?Q?Ib11TQOE+CbUEUSXDfM2PBdwePWvCtvy+pnEHPliplwp7pZmLO4/cCFGURl/?=
 =?us-ascii?Q?29EgAtAgHaMhsJtEihaE/9Vq7yESas/lJ2N+0JhWDoIZVMRHJxD18iVSiDUW?=
 =?us-ascii?Q?OslLinWXOsFrT4AABD+uQZ2vc8D3kUYLAv0g4Xmsn/uLqXb9PttjpfeK0Y17?=
 =?us-ascii?Q?FTHBZaXwltM4UuK1QNp3CS71giaF8nQ9qWdtA+nL8foJopjUdtZCeQBGE8xs?=
 =?us-ascii?Q?1r227XStg6nmZVfAAqJMTmDnlzKw2EGgm3Dtwa5wJnaAD1AnA2mIs26Wu5+n?=
 =?us-ascii?Q?IV8k8tFYv++HCrIfpiwN7MlZVZHEK3SsWfyCbQGOFBf6+4onFIaW1cgS+rVp?=
 =?us-ascii?Q?K+HhwCG+DVhM8XoA1ty4mMnyr2cXh5S+kLvq7cRI3p5ReIN3KCvGGgAKggBt?=
 =?us-ascii?Q?uUL/hvAt3y4gBS1RKFpx2MuRGcrs9CDxk9jF5q1m3787drcjdWVLWJS7eZiy?=
 =?us-ascii?Q?YHzcPGSkI8PZ0TEhX1C3R86W/AIiXpPIbdoylxVGWr4IVfOQ9NDs282q2g+b?=
 =?us-ascii?Q?8PWy3vQ1yI2lb7gT+WqgTByGMGXYjRn1LOuI/p1NUiG8be5HUdXmvR2orsBB?=
 =?us-ascii?Q?yPkKwt+8LHM/Q29uSXfRn3cggvR8RSjT9v1lD1pYrx0oZtDllC3mFpBcNvl4?=
 =?us-ascii?Q?qzGS+QeBFjnQ7fBfUQmwbobnPY+t66qTrtmVcKgNq6ymTn0vaPo3WOxvirT0?=
 =?us-ascii?Q?U/Z8rm3NoICvfmSCGDWo99byXF4K7/bTHn9QC4lPR9BQXynlwRg55SwjHDF8?=
 =?us-ascii?Q?oA+RAFPTmOerC9/oTwazuQ5sTHm8ZkLBOs8UL88QVZ87r6S72zlwhlH0PDSU?=
 =?us-ascii?Q?kQmrQPuR/y9gdy0n0ZUJzVAfT1JjGvyYu+lrD/fyxM/a+ucy4k+Dspci3EXB?=
 =?us-ascii?Q?yb3v76aBGK112cfkN3JSRJYeVG363AFepaLl4FsTAk0aIwg/md9oZdT+R0ll?=
 =?us-ascii?Q?q/0X0HRJY9cbueNQOftjZLUfiFmjpzer09xmxcdTsGUu2JEg5OHCHUG1hdGT?=
 =?us-ascii?Q?rvM/IP8u8crFBrRWzMlRIGcMPvbbhaB/YIs4LpG7rHON6FaaUOsIObDjB37+?=
 =?us-ascii?Q?NW8MSHj0VCvE/Zs65AH5EwMA0OWBrDqmD+6DaIHxvVTlrpKI+78yP0DNVoxN?=
 =?us-ascii?Q?YzJEm0qXVsVCvoEbkaOR0cGShE6hGj3oqUETf/z4s0MQsQXg16FFsO6Xs2in?=
 =?us-ascii?Q?3M05cEmhep1E6+LM6jk8fCqYBmtkhmriLh9O4Xj0Cv6KJZnSRp4ivV73l2UF?=
 =?us-ascii?Q?VjD9ahD+hYGfTXArd7aRMsBnp273QqfzDav2WMg2kcnbOby/kdo/?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2492ec6-0a5c-4f43-ed5c-08de69e4bcab
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB13067.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 03:13:47.3602
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FS7v41Z5t60kl/R6XpOoncrUujP1kPafuwm1Nkr4mTlyJAY0+Vg5SpeNvTwzmxERAhyqfZZn53kpQMJv/84eCSWmxTe+ESO007GetlJ+Az3EhkIZwb+W0PeUodVwPWCN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB15895


Hi Stefano

> > When simple-audio-card programs sysclk for CPU and codec DAIs during
> > hw_params, the ordering of these calls may matter on some platforms.
> > 
> > Some CPU DAIs finalize or adjust the MCLK rate as part of their
> > set_sysclk() callback (for example by calling clk_set_rate()). If the
> > codec sysclk is configured before the CPU DAI applies the final MCLK
> > rate, the codec may configure its internal clocking based on a
> > non-final MCLK value.
> > 
> > Such situations can arise depending on the clock provider/consumer
> > relationship between the CPU DAI and the codec.
> > 
> > Introduce an explicit sysclk ordering enum in simple-card-utils and use
> > it to control the order of snd_soc_dai_set_sysclk() calls in the mclk-fs
> > handling path. The default behaviour remains unchanged (codec-first)
> > to avoid regressions.
> > 
> > Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
> > ---
> (snip)
> > +enum simple_util_sysclk_order {
> > +	SIMPLE_SYSCLK_ORDER_UNSPEC = 0,
> > +	SIMPLE_SYSCLK_ORDER_CODEC_FIRST,
> > +	SIMPLE_SYSCLK_ORDER_CPU_FIRST,
> > +};
> 
> I think UNSPEC is not needed ?
> 
> 	enum simple_util_sysclk_order {
> 		SIMPLE_SYSCLK_ORDER_CODEC_FIRST = 0,
> 		SIMPLE_SYSCLK_ORDER_CPU_FIRST,
> 	};
> 
> Do you set this "order" via custome driver if you want ot use CPU_FIRST ?

Or, not use flag, but check whether "clock master" ?

Thank you for your help !!

Best regards
---
Kuninori Morimoto
