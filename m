Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010067.outbound.protection.outlook.com [52.101.229.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14BF3175A71
	for <linux-sound@vger.kernel.org>; Fri, 10 Apr 2026 03:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775790890; cv=fail; b=jWywYv/Wups4y2+pBefYDGjrsuZvDmDDMxlH7VdNjdFsczGJUMnYfwWBQcioRE08iJ65/XBGUztXi8DOKmZXPy5bYAJuvEZNQZYJH5KjtQjg12t8hJigmz96rL1NeBC4GdhfiVAojNt+hDW8+TotjzBreBM2xd7rcAfa2an3rHU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775790890; c=relaxed/simple;
	bh=whC8Xu4xFvHOQYpG/QlFl/jEuVeQzyOlhdeesOEhYGM=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Hhb9jFBW4ySWVyqISmwZfpysITlhwcEcNcjqtm4hPO88SGu6QcgPWNYQWzCdvMeR79nhKjbRJ92te92ZFyCq43+vsjSGsEo6dkZR/pg1mMVpYisYG8T1qTlLmoie+KQLF3lvwcOCdz9b7+dWkpmWhF8nOokb23o2UJeigevBOww=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=obEERLLX; arc=fail smtp.client-ip=52.101.229.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="obEERLLX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AyA1fpr0r+nunNX+3RF2VC0ojBtrl3lTaObP4VjCD6W0Nxv3i8FaU/Wmj4GY5+syyaqIAjUqX7zE4ABGpAYrYydSLRdiT7A37uQTFpsjNyfMp1LYUJU5B367AVSkOi+m3V1a0d1KY4PNHsy5GSbBYUcaK4w1NLumGxJKN69EmWQM/h8bTil8A/8Yeg9Fh1g2fCWiGXBeh2u/v1bzI1P9OPognqseZNN0rDAJFk608ZRArlhRxoTqRJOVssr4vtjZyJ3nfeAndCcWIOVuuXeY4YHdM5Yhh0jyLHkBnvISZZnil0bEZI4m2HsZ9TUuwKG41Vy0rOGB/expXdF+DCb0wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1jMc4y5XuAP6W2gWDU8TR8aAt5WYSSE8xZbUQjydpKc=;
 b=yB4tnVTsXrH038Ld1cqGJcjz20vAom7wcdzBvHnmA+9zQrLLtAk7BgzxqM3dn+DDPkz2my1YY9h3crwNu0pr3WU2zkxY4b8H0OUSuHalXeTWX/08xBqvsxfg2iyCl+s61l4GaVCkYwi1olMIK4tvtxvcliygKIGQkIVYX55XD7KcA6arxPv7V6tuALXHvyyTbykp/6bkm3oU+OBfATiLG6Oj5bQVgh7r/VZ6WXBg9Lx2kMbdLjyv2nHwMvtHvSqpjFbfiVe+f1qnf9OkBHgO5YbIGF9UVKiJWcxfJho47g7EHlejOkJGa8IWpoZBEuaHhMFRnnXGZiO/0mCNMYOcbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1jMc4y5XuAP6W2gWDU8TR8aAt5WYSSE8xZbUQjydpKc=;
 b=obEERLLX5C0gQRyeCZX1S3Sch702OOgrle2GOPucCWidGZx38MCD4QT7LP5lC2zZMT789ESUB/lj3m+GD5O6aI2P5+WsfMlRYLrKK2ZPtiQRyHeRiSvo4vQ38TxuJ7yEzOeEvRgEtj+7+UK5wr4MOZyUThTME1t4NaiaKpnHZh4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TY4PR01MB15021.jpnprd01.prod.outlook.com (2603:1096:405:25f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Fri, 10 Apr
 2026 03:14:44 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.20.9769.041; Fri, 10 Apr 2026
 03:14:44 +0000
Message-ID: <87o6jrecbh.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: =?ISO-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Jaroslav Kysela <perex@perex.cz>,	Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@gmail.com>,	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Subject: Re: [RFC][PATCH 0/3] ASoC: remove card->pop_time
In-Reply-To: <adf50GLs7me92fvV@sirena.co.uk>
References: <87h5pkda1r.wl-kuninori.morimoto.gx@renesas.com>
	<82c256e5-0af8-4ea3-ba5a-913a576b25cd@linux.intel.com>
	<adf50GLs7me92fvV@sirena.co.uk>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Date: Fri, 10 Apr 2026 03:14:42 +0000
X-ClientProxiedBy: OS0P286CA0128.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:16a::12) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TY4PR01MB15021:EE_
X-MS-Office365-Filtering-Correlation-Id: eadce6c7-ec2d-4cf4-e113-08de96af4fee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|52116014|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	BkbCeCyJqGuq1jKRlc4+KzH8rEHDascRFuoFRAP5vdkeDMFsVXe0/Di3f0SJzFx9UJN6T+vBipfutrZe4EfZ982WGgBC7+vry55+P8773DmdINnM7zG2VgWBSq5JgCjt8LwKX244E8R5XVAF7gG+W00FfcbFsm0RBF6eZqXL9fcddo+wdDVWfwsyaqVbGlGLBqhu79S9vmjCQ/XndJ5VCa7FNTkRvrGvkkYoXiJQ8ygcAgF6QibjjatNissOyPA9KW7gvLN7V/qg8GngVRK6nm2hVLJHvpfYZgsAc9pcd7XFgqx686H/5RVak2dP4AnSbYtnocJ7m9w37sK4qtVU7Ok629TinVgDSsPay3+M31APTA6UCBq/uyb4dPmFKSaszDf2pcknXIBAKsiLRTiOCBWeL/bhNFZcwd7JQ64tTiwOaXFXMzT8qdgXouQkHGPy+rduINalRfzBkV8rw3udY5HwWbugV/9PH3AsUfJfC27tiUgf1wQX4gFTfmgSfcrZs8XeWwjjU5KGZPpoKDy6ccKDVCGBQh1V6NqNCgOgqEbDNM0N8LYt9vYRD7vKkKurcZ3L/HXr5X0nmuRkuwPTxRXdLWU+B5aPCpWknzS+ZpuXQUNF1ZFlfhkW9M02wCD8RO5Wh6zMa8ufSAk6S2x/ZM/nP9UKu4PyHdmXEK7KpJixPxPbRY0L2k4j5TdK8rVUbquCz6JgXlGRyyyo3RVagIPCqeMhXEl0aqpAwG0yRKVEN8k7ub5vjim/RVEOlA6fGkWSZjJDY7pEzh14SRbAqZILk5G2jimPico3jpOZoQE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(52116014)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?BMSB/NmSKOKI9ZrNR9NWe3w8mHxHFshkxrV6tt4C+Igx3MlsqN/yxK3zLk?=
 =?iso-8859-1?Q?3hRy9gQl6KEuBQaKfljrK5/DmZPM7klm3c0DY7GbsCUmqt7S1Tkh6z/giS?=
 =?iso-8859-1?Q?wmQtIMTlkkLKaBcfllVxCwB5kU1Wj12E1pbT/sWA5akBlQIXKzCwnXSbfD?=
 =?iso-8859-1?Q?u8+wX3OlHYR3PcnQ1+92Nctf2UjPH0lpkN3Jl0lmAsxL/fwKI73fvv1yIy?=
 =?iso-8859-1?Q?MVVdwdu4wn5joPpZ+TqZQdtThlPxnFX35ILAm9xgjNemZkRLSyPgcj8jSv?=
 =?iso-8859-1?Q?/V9SVSDVCxnK92uSyJmSi7qXMKHgIAehAwwSxahjSQL2I+Q3+9C9eDAkfs?=
 =?iso-8859-1?Q?F/ozLe614fcoGV2BkSIXGjb2bQwFlSQtWUVEiAC7pjqQ/GAas8rCV+ZCw9?=
 =?iso-8859-1?Q?5SUgpW0VCpBTSldzN4GityaCpAOl+3dfePdG6w+5DSssXqyuY6KcVjXpqu?=
 =?iso-8859-1?Q?AlEHVpdatdUDCXzrftwNOBMRpioetUjmrkmrk1kzZrRjiByV56oIPU/hyg?=
 =?iso-8859-1?Q?kBbxxqNB1cxPLeSFQdPhTJt+X8SacBitjKCJh30avXGobYRGz2xm3irdE3?=
 =?iso-8859-1?Q?iLyrRppsDJDQ1m6i+nMEyr+B5+YfjMlSDulxhJ1GUFGkahVubKlO8K8A5b?=
 =?iso-8859-1?Q?fsL0uiv8KQ+1lYMhRZeIFg5dasGaHNSYYvaeDolAmXfiI1UJjAH07u/Wpt?=
 =?iso-8859-1?Q?5x2Ess3tEM2c8PMlJAtcDt1F6QE/Id0GUWPXz8Wz9hOUZTXHs8aXf9WWfY?=
 =?iso-8859-1?Q?9DINl68DZ+qoTxN5YHNWzHpH1jvDjgMsUxWpvJbGP5YRD1S4YRxpNIJg0g?=
 =?iso-8859-1?Q?i0oGHvHRC5Jc4tKZ7M9IBOu3HNlCKFal4P+F3RNhbRt+5hCjBGskWJb4ZS?=
 =?iso-8859-1?Q?u46h95NIsuarpflB+8pOWCFRtgErttNYY1yz49jhcM583FapaITjKxXY4j?=
 =?iso-8859-1?Q?8lBY/Tdrtw3+VZD5yBBu+QvgoWS50dbCtPGOs9Q54swcZ6XL6xUXB3PRs4?=
 =?iso-8859-1?Q?SQHAcxbB5xlFu8CUjLWEm/+V8l/UsSanakrrD++7Gpuoix/lGswi56ksQj?=
 =?iso-8859-1?Q?JQqBdjTVLZcekX6raMg0PD8mwOu8Fzm2CcVaghyTLCO5AtQkpM+EfNISOO?=
 =?iso-8859-1?Q?aW/a0Nc0bukU7Rg1aKNw8kJjm/icYWdthoWsCrQ6bkfogXYiMuFMuFGX/J?=
 =?iso-8859-1?Q?ZWD2qInn1FwQkokAxenQ/n+l2Mq5DRuaaH+jvRHzx9ArzCMAiFQMP6MXMM?=
 =?iso-8859-1?Q?PdA44tELR7F6rLz6omvmygTesQbuy5iXgT3Ym+6bibd0RFkfJmNY7AUOHS?=
 =?iso-8859-1?Q?xxo4rGL2lO+X7F0GifSdNypY3Eb4yiEcAKfVcCdIF/hHwvCd4UCehR/NDQ?=
 =?iso-8859-1?Q?te0rwbi7w1sfYJML/v1Hlpe6ad6YOumwpb2Rwo3whSLIjGKS+I6G3aX8NX?=
 =?iso-8859-1?Q?nmnkOdLf2pU068qcmPomk0T0wRIA1b372cXubIA3jh15yazpa/z6eQNKpA?=
 =?iso-8859-1?Q?hXblpgQ4fF2nNL/kSXvDwwVxoeOZclMF6Vf1oV/7a6dohPgDAgoci/2BaH?=
 =?iso-8859-1?Q?jZTLVFqA9PH9p64rzSaUFskE5sr97pMGRB+Uxew7wkC2Lmx3ONsz6avd1f?=
 =?iso-8859-1?Q?QS3wwCIU+WSCxM064o7X3bG27RZlNbykNrcrLVL6XAaxcGUthaJCeVRE8R?=
 =?iso-8859-1?Q?6+yQOh6LnHRnz7D476ssVG/iuasaQavV3LzkC7PvmcPgJeohxjPU0ttnlW?=
 =?iso-8859-1?Q?BlOqWv0G4c2Dczap43YpSMiT0pq2QwPI7RWhpNNOjokWab/2FB9c4Ul3w/?=
 =?iso-8859-1?Q?Ib6l36icmkicFVCve0dRDjKGSOof9fWnO6wbjMlAugYfRfa47ItT?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eadce6c7-ec2d-4cf4-e113-08de96af4fee
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 03:14:43.9434
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +Fuys4wNWT0T8Ypml7gO/URqB6Zo0DjimxlUzrS7OvEjA6rhsNpEWbDFaw3ohYHLo5/Kq3T0e3AxKILWNQ27h7aaBsmd4YbTUCx3uHfDHIcggGXwADebXrAUwOL4j1sq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB15021


Hi P=E9ter, Mark

Thank you for your review

> > The pop_time is an amazingly good tool to debug pop noise and is mostly
> > used via the debugfs.
> > You set the pop_time to non 0 and DAPM will 'slow down' and you can
> > identify the step which produces the pop.

Ah... OK, now I could understand the usage.

> Please, don't remove it!

OK. Thank you for clarify it !

> For Morimoto-san's purposes I think it's sufficient to just make it not
> card specific so we could just have a global control in debugfs that
> applies to all cards instead.  That's likely sufficient for debugging
> use?

Biggest my motivation is I want to capsuling snd_soc_card.
If we can move it to some where, for example dapm static / local, etc
(It seems it was before), it is very nice.

If OMAP1 was OK, maybe we can move pop_time from card to soc-dapm.c ?

Thank you for your help !!

Best regards
---
Kuninori Morimoto
