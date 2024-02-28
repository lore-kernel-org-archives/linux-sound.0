Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2066.outbound.protection.outlook.com [40.107.114.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6FC413D2E3
	for <linux-sound@vger.kernel.org>; Wed, 28 Feb 2024 23:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709163399; cv=fail; b=IkuGKVOZw4iWYBfKqtkblwumCWiy4XufVSJLAtOG8EUXJWrs858zLZqCdnj8h05lajsaM7Uu547vXk3pR0+J5oxVsbjJ3h2NlSfpel0f9hLEKiifSBQZsgB2hSzvUF8Msoi824Y/zIsrDg6ug/2Z8MnZVmLSmYIifQIWiYzWBE4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709163399; c=relaxed/simple;
	bh=JIdeuykp8spZpmY03T2gdHc1biS3P9t/d+zDi2nXpEs=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=awoOkmc/Kzm7wtJJx3Kgsymg67+5EBwdZXFOHQmNgt4LVS8PjVa9v8zENX7FcZd7jFGmXO5weGBpT9++7+31TW6BkxHp4SB1UMVrLQwcteLuYD1GsX+2SQl1Rk9DwKeENT/A4P+vfqZXLMeBtF4qfBglmehgIgYRXqHPGqMeoFc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=HQCG5zx/; arc=fail smtp.client-ip=40.107.114.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="HQCG5zx/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W5zsuF6MkcZfyAmDspCKUe5SbeCn4C8R88aRiGNgsQTdmDk8amkz/it1WkprHe66r8qLcHO2Wh/qaN73SZSa0nqY/RdLfSJoQcZx6FDa50VrrjZUNq7cVmKMB4/P33Lwr9GGsL5QQEK5XTKZ+yMr+XHe/bLgTCmQEBJiWRj5hcYf3p9UGqVkQeR93cCcoi6siH4TuHwSiJN2mIDHhHytoV4XUCb48/DffRWRUCeToyHq0T0nXMr9QWWpx4p4ggzxXO7a/K2gsYv7HfGV1dVNhMAM0OF+bjyXt2G/U4Pkh2Z+XxP6ymPEnW09rOQayqFhFgtLYfHeDBC1VSDF2pR7FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KdHFE9j8d/M+DMeMrrmXVrp9KOzcUa54QrSoYRSyfag=;
 b=ZPI1FJmwLJqsgPuF7CQ8ctUE06YVaxx+4Te85G/BHI+u0rjMA4bTREH970I7X/El4kZg2x0mG7a35KFj5c/2dDgN/1kJbGSRSkq22hzc16445+UiSFlOVP82Xr8zGg5V28y3bwD/zVLG1fHJLbbYYiavCvrfWHOLouOILjuby7kjBVEMQlXBMnQLj1318U4jKHo19wssqqbbzWT2f26b6kYz62WW3tajG9slTMvXwE48mdcAZJSNpygIayth7gESXDdaqDC7b2c6ucUBCoyeOCTd3esdAZJKylpk4I31N50mNoGeW8xooN1RbPypRxMNu3P/txNc3Fiv93lLrjCI+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KdHFE9j8d/M+DMeMrrmXVrp9KOzcUa54QrSoYRSyfag=;
 b=HQCG5zx/0sJW0dKKjRKYyZ/Yq1AiV4C3JQa2BkAArBWSUVYmRYgdxpo0d8G0eJD12vn7VXQQlK5RHjqLuJ47X3MQlppi2Y/L1Kn1xp9Mshplmt9XHGdW9ifnN6vJbJ/1t+1VDGi792vdv2r7fxIgLLRCRnWL0kMxfp3ZmsBIT1k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYBPR01MB5437.jpnprd01.prod.outlook.com
 (2603:1096:404:802c::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.27; Wed, 28 Feb
 2024 23:36:32 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::1934:4a38:d599:33a2]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::1934:4a38:d599:33a2%5]) with mapi id 15.20.7316.035; Wed, 28 Feb 2024
 23:36:32 +0000
Message-ID: <874jds88lb.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Eugeniu Rosca <erosca@de.adit-jv.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Takashi Iwai
	<tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown
	<broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	<linux-sound@vger.kernel.org>,
	Pierre-Louis Bossart
	<pierre-louis.bossart@linux.intel.com>,
	Charles Keepax
	<ckeepax@opensource.cirrus.com>,
	Vincenzo De Michele
	<vincenzo.michele@davinci.de>,
	Dean Jenkins <dean.jenkins@siemens.com>,
	Andreas Pape <Andreas.Pape4@bosch.com>,
	Yeswanth Rayapati
	<yeswanth.rayapati@in.bosch.com>,
	Eugeniu Rosca <eugeniu.rosca@bosch.com>,
	Eugeniu Rosca
	<roscaeugeniu@gmail.com>
Subject: Re: [PATCH] ASoC: rcar: adg: correct TIMSEL setting for SSI9
In-Reply-To: <20240228094506.GA1150007@lxhi-087>
References: <20240223163502.11619-1-erosca@de.adit-jv.com>
	<874jdww2oj.wl-kuninori.morimoto.gx@renesas.com>
	<20240227120725.GA1141156@lxhi-087>
	<878r35qypm.wl-kuninori.morimoto.gx@renesas.com>
	<20240228094506.GA1150007@lxhi-087>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 28 Feb 2024 23:36:32 +0000
X-ClientProxiedBy: TY2PR02CA0008.apcprd02.prod.outlook.com
 (2603:1096:404:56::20) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYBPR01MB5437:EE_
X-MS-Office365-Filtering-Correlation-Id: 187501da-9156-4c6a-2def-08dc38b6189a
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	T/3Bb1F22OYZwpR91/O2uskTRvMhVUm6MiNqs4tvJEDBV15EXAgHbY/nHfx10D5XljpErJgPep3jBe5ZTgQDAOcyGScEVkSqfgcPayYS8wD7SG8NNQXGNlK2+65k3bfm4NNCdhGRrqCda44Vo/ICHx9dAg0j0O0W24VJX2HxAfDu54cCL7fDWa/+7ZcDpLQnYRIF0tnpkR/fSObbyYoLkq7E5IWjvtFdk8T4rW6DefShESZw3Ro+GJOcaZLo6P6xL+SqvuBuWxv8vrgUQtjuCcZO07aH1zjkDyt+c1xZsAUBKGf7jWIYRArTqLO6xi42gWLW7tZ9ZqTTPJqu2jjpjXq2mPHBcqW1LirbEMhc3jvJ7fuGjnANXK7y1LqpCQBMUQ+1YUV+JoFtgNITMk0yFEfkCTetPhr6ozEADfBWBWzAGEY5+33l9ZtwtcyMDY+K99cn5cSMj5NzqonZcmcRY1PmfJTfe33YKSbCMsPIqEfs7aV04PbEN6/F2Odgwkp1g78Vsvv5YjzZFSt4gvOYbSkJCnZNltWOXiGOi+we3hBwMg/NHaLOdR1imrq69gOx2P0LDKcE8NcKTVVSBUBIQdMd/PxJRDTNwO5d+PBUGmx0pe/knK6hlXS0n5Cd+lVCotGX0wc5QoqYLdKf9S7XLL1lCWewlEyKbyDY5KEX9gC4KgRRvsS07oAatWqzLIUcRF6fr7EvFDzJhE2ABsVGwekCRhEOi+cw7Xyy7GZs5sI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?thqRTNahM3wM5cgl7VImFWhMOlBYoQFfYEq4y+tlgmreiCfqsnrauaZHZlOE?=
 =?us-ascii?Q?MbQVqHsxfzgR3DSUPlS44L3C3BsqtU+V97y0htMeRMKot7aSR8JhlvXjmxyV?=
 =?us-ascii?Q?/d6DZYo1Zi85V5U3Rdv6QY+cKqKarTPvpNGwWmBdCbbAqAMtf3EIBG9Nbd2C?=
 =?us-ascii?Q?q5hjF6jTxqs/aRMIF+gE0+gI8oSqQX0bx8InqBTEsnmUcbznPZ6PMf5blr11?=
 =?us-ascii?Q?AAJbiPraq/Oro8NN1W+J1xvJbuI+hEqAENVoLwn3ZCRlYL7T6gsPPNV1bDmN?=
 =?us-ascii?Q?lpqMCoJVqC3fVYGfNOhMJZcpQKmq6MhibpCmBbW6MECNBKtncu/4KZFSNg7j?=
 =?us-ascii?Q?J/sWlLTmzVxDSePPrBAAVkehjy7g/9/AAzeRDnGXGKSW4bm19XtYvVDenh4s?=
 =?us-ascii?Q?McA4N1WDbDIB0VZvmphO4traqDWjz53izfNVgPoHDGLJmkeJAR0QRE10wDOR?=
 =?us-ascii?Q?20/mi+SrlFqxxSMEnXCwKRv45k6vx8NynrSJCM0OiMhCPCWTE6A54uTwF1KS?=
 =?us-ascii?Q?TC6uPGxK+rGTTvWKvQtDRmAZSTbG6rk0c3JoNj8DsgZzpPZvYgHuRcgtzwQN?=
 =?us-ascii?Q?urvVQQIU/TsJNBmF3qQBu6/vi+o+2snBMRfm/TUG29NaGbLqCkmdDAFVNqpq?=
 =?us-ascii?Q?PjDy0m+Q+I11j/lRNY2gv+aeOKYt0SP9MNmQZ78qdp37Tx9MkqDC45Hgm9FK?=
 =?us-ascii?Q?BIxgaPHBzmh7+PXEgO3X5832HGNDbc+PI7fMmpq36OhJkdMQk7SR5F/22tgJ?=
 =?us-ascii?Q?LzYIUkwrGktJosv8yuB+B5L6PTbeCY3h+eHTr0fEwPRh2ZBxLMv88XGtOKWv?=
 =?us-ascii?Q?tZYaXnDI9Qs8f1F/qhN0Qhkceih2ZdEVLM6nY5DHnXrXiYBN6DYqe5MI/gBf?=
 =?us-ascii?Q?LPG1O/SB6VSqcHjoE+37YfnLCsew0+AwJILPZTfY9pjR1jKquP6FKL+vtV26?=
 =?us-ascii?Q?c7DlNiA4gRwwBAqR1Lwn7khpp33PiaaJCJYmXd3qAWSCDcZK5fF1WFoFqllP?=
 =?us-ascii?Q?PYmK/tP0BIAoCUu4/dZaNxTzSvsCuFybZbzcXWe7arrEfexMR6IH8LaYRh4K?=
 =?us-ascii?Q?HbEkOxhynETqDMrh07E6qLB2H9A9BecDEQ/wUJNKHM/pNBJb6MmhrMPakuaD?=
 =?us-ascii?Q?Mrz7qF3P3VrifI5iqhCOhIKQDBN4lCb3uuZgf2fPeugQ4G8s9raVWg1+5J8C?=
 =?us-ascii?Q?GPebeZYOnweDIuJ0bk5Kw6vvHU14/kkjPzp0IEPlE9CqVEz0Zy9MocClQv0o?=
 =?us-ascii?Q?lBjBwhQZOW/kBjb6hZ6NAEk4BGIdTLDL4ZiYehrh4Q7eie/HcPGLT8VY/3T7?=
 =?us-ascii?Q?ix9ChRhGphM9lu2mWgn41uMnqBYezeepnw+SLh7/vO95z2z+TeIzN1Hegjgn?=
 =?us-ascii?Q?yXC92YR7okYxiRuA1Hb9pUcQ+oFg0Vp8mpDOS5lq7GV/cvF5ixyDov5O7uOy?=
 =?us-ascii?Q?3mK7hw1pVY5zZUIpHE+QJBrAYm7KwAaVK1R2YnPvWhhdM233rHpoQB8RCPfl?=
 =?us-ascii?Q?++HjcC897xkpzHlKOTXHRp6BEAh/Bt5yRg4jWxV/9qZX71fMr4AyZJH/yfhu?=
 =?us-ascii?Q?PAFLzVpse36A6QMYqS6zlOhh5l4KW2kYt50gOTZhKbBx13JAn1kb+sIo2t2B?=
 =?us-ascii?Q?ZjobTY5F1lqTMU5mdMyyHlM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 187501da-9156-4c6a-2def-08dc38b6189a
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2024 23:36:32.8555
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3iEflk+mNjh9GSwNPXJEfIkD5LFbFzLwqI/DShWFD7F46mfeZeLLzSAM1Dp7SnntJAPJgxFmsraBEt0iFuUvyBOPAWOLrY2P+eKwEO8nLhyLo7Gj+h+zQEY+fNfzpGR3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYBPR01MB5437


Hi Eugeniu

> > > > +	/*
> > > > +	 * SSI8 is not connected to ADG.
> > > > +	 * Thus SSI9 is using 8
> > > > +	 */
> > > > +	if (id == 9)
> > > > +		ws = 8;
> > (snip)
> > > Quick/preliminary verification attempts showed that it might not be
> > > fully equivalent to the original patch
> > 
> > If it is indicating that above simple code doesn't care about
> > SSI8 error case, I don't think it needs to care about it.
> 
> A number of concerns have been raised internally, related to the fact
> that the "optimized/simplified" counter-proposal behaves differently
> depending on the value returned by rsnd_ssi_is_pin_sharing().
>
> While it may be clear for you that pin sharing is mandatory, it is not
> immediately obvious to the casual reader/contributor purely based on
> code review. From this particular viewpoint, I would rather vote in
> favor of the original patch authored by Andreas (Cc), since it makes
> things very clear and does not hide any dependencies/assumptions.

Hmm.. ?
Could you please indicate the sample case of differently behaves ?
For example, if xxx was xxx, original code behaves xxx, but simple
code behaves xxx, etc. I'm not sure what is your concern...
For me, original code is solving simple problems in complex ways
by using much memory.


Thank you for your help !!

Best regards
---
Renesas Electronics
Ph.D. Kuninori Morimoto
