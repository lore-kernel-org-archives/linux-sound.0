Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2064.outbound.protection.outlook.com [40.107.114.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CBE01CA9F;
	Thu, 27 Jun 2024 23:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719529703; cv=fail; b=CntVH3NrLoPRIExarJDMJmiV07yzhBaiamnN1cbZ4TaGO/97xCQWWQUYUxWsvVJmCgiixaS4cfHXS29Ju1QfQEeS8wxpJYu3r8KZRvcyAJklZLFfeV01C6Yu1BjI15/sl2Rorn2sXhliZY3glkEI0t4qJTJgEi5ANAtpiIE9rxc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719529703; c=relaxed/simple;
	bh=NeDzcQcC01LAX2Z3cJP1OV5cKl7WMjPGQ3RS3FxsITI=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=HRde4jcK0FbqUMD3Hd2CWDmR5HwPxViJa6Uk0svkuMbbaTZTQ1jFCZ+cLMTInyhQfhtKYFFIpwHcJbXknm8bHErzrMAHk+DJRKk96+z0UWM6x/5/0erKRTUmVoKVZjljA5nFJfhNVi76bhm5PFS47nXrd33kcHdyGvYmgx1ocrM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Jqgi7RMF; arc=fail smtp.client-ip=40.107.114.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Jqgi7RMF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VDqh/CuzwsFiNwYp8AooEloHvpiPmztYr7J8/ktRAL/mTsy8RiofM6hSu5xFAH1xNTBcxsnWEhklxXByZy78EFB27QZAI0H9wyGipn9QC+dL17YQxyncRulL0rDJMHF0wKfTOGhWO7alvel3EOaUiWC5W5NTHtdxxXcWprFyk8BXZadeKFypAYaIUNXaeh+tAbJUPORCxBwsBz8gNe4nyfy+1VHJK7CiN6XV4h3pXH+NMVEb2PhAZ3jZKYJDm+AaDi1l8vVZfcyjTRdcvV8ffWGmLRIC+1CucdvkcwGqA80lW7hfmnrSNX9gqBcETaEdfheb5RgPJw7nOBJXeIvWkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vk7vcziakJZ3QksFI/7ZBk5pPxO0IdgueCATAbHKUI0=;
 b=mmb4iYxDbT87prFw/rFYmIjYbWEZaK256IiRoW1AsMBjXV9tkEyQ06RIOCNCqsyMpsPj4aPcWqGqDCMpX+WvCyWZf333SrBCVFYtOzbr5EqaoSDo7gZMoX6GlRkkS5meRJTHeiZ1Z5NQJ/ZwE8n2NanQhPnr8Bk+EzHGZz/rs+aR+OsrOoqUQxwEPlA5tKgARrAVHS2VrPU6PzvrIRm/jOKoryKBFWjTflEMf0hfG+IIis2w5Jdi2WH9UnOT2xKmqH3cwnIDhSzt9Pa8YfzG90uenWfUvu9G1VszBMalo5kduz8DVCMpVbeMPdzbqOIDqsMBF2TsBpz98pv3amIENA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vk7vcziakJZ3QksFI/7ZBk5pPxO0IdgueCATAbHKUI0=;
 b=Jqgi7RMFkVat/TYWViQH/YfTsIxS/c3Cacv9ibCFjJIJpO+QZ5YE/9XLnscvqA+OCTyEfk8CDzVNe+0kJ3RB980uI7MZi4MqbzT614F+O8JXaiBYYSFj3Y7i1HJ8fnSdKukR3nZCBxyrBbtUbYB/3TtGtfLphvFySoMLL3GMiRc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB7264.jpnprd01.prod.outlook.com
 (2603:1096:604:149::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.26; Thu, 27 Jun
 2024 23:08:18 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7719.022; Thu, 27 Jun 2024
 23:08:18 +0000
Message-ID: <87tthe9e71.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Alexandre Belloni <aleandre.belloni@bootlin.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 2/2] ASoC: dt-bindings: simple-audio-mux: add mux-names property
In-Reply-To: <169aa3ed-8427-4832-b5e8-302a1ce0558e@sirena.org.uk>
References: <87bk3nqc0e.wl-kuninori.morimoto.gx@renesas.com>
	<878qyrqbyt.wl-kuninori.morimoto.gx@renesas.com>
	<c7bad597-84cc-445f-8446-398cb5e5005e@kernel.org>
	<169aa3ed-8427-4832-b5e8-302a1ce0558e@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 27 Jun 2024 23:08:18 +0000
X-ClientProxiedBy: TYCPR01CA0186.jpnprd01.prod.outlook.com
 (2603:1096:400:2b0::9) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB7264:EE_
X-MS-Office365-Filtering-Correlation-Id: 36556a6a-983f-487e-ab4e-08dc96fe083a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1Cy5CAuB7jGlT5CWu9buF+nzfMgONVb3BvZlMQ0WtKUt+qr6AN5Lo4LsWMvU?=
 =?us-ascii?Q?sdwKDzxJq01BME8jz1NWzatciZRzpCOAHQfhpd3JbooscLUHL3Fv5QEaXY4M?=
 =?us-ascii?Q?mTp8pptGNuUtjmXTzVLsl+pYlFj6wYT2tiKyHft9aSNmxvM5Jbsm6vypx++v?=
 =?us-ascii?Q?RabvNL3vXCXCRdL1B8ZN07t3LQeqJ2W5lfFEuUVlN7CCZWTaSZUX4HrztrgM?=
 =?us-ascii?Q?TD42EtKphndnDVhnUIqwl1CJ8HSKWqf6AWTfHp5VEYNCnuagLkXUFNlrmyAY?=
 =?us-ascii?Q?kryrO1SoH0Yt7sXbmHbTRkGxjayqWPpRdezMOeGORUDi900YsjZsXOfprxHu?=
 =?us-ascii?Q?/48++rjcSLR1f6SQpexs7uH4N2/SW61wzNx9htE1cCtIYedoJtNwH674xTny?=
 =?us-ascii?Q?aLmuNMbOYEDiUpU6ZpradEU0myl9AFQPpIzRivrUnDJ3H+ajLfjocP7anY+7?=
 =?us-ascii?Q?UHF7rSvFEvdl/KEz9ZKLQI8mQCPv3lb+MwFKCMZ/bHdX8Fv/2nIvRi8HCA3S?=
 =?us-ascii?Q?TwdRwOF2PoaUhlqttZ/rbcVEd19X98jpXNnZmNiHYo3wjia8BbjTE7/aSm76?=
 =?us-ascii?Q?4nfkCdw4VTHYbFw6X7DHw25dKkeW+K3s1TAoc7iZvG9R4ehsl5Fq3TXuoaK9?=
 =?us-ascii?Q?dHfFk04v5hau7SbkXlC0FiT0YeV0FMqfqLZA0FEIRGJH1V+VS5gctZkSkdKO?=
 =?us-ascii?Q?/30k5LOhMMtec7e/XYTESNnOpwmzFL3lsYnWOWY2syOqYXcIohHox5p+bfaj?=
 =?us-ascii?Q?6HZ53rknZfIMF1efpWMXDUGYvtbw71GD82qu+2+W8AgK7TKteikqI+oaAfgT?=
 =?us-ascii?Q?v+8cthIILZ6+2K+Tc6gxIG8L+nqcXHfG5LmmISRW90k17KQ2BzmO4wy37VVV?=
 =?us-ascii?Q?Hr3ajvvYq1RVJ+ppy7AWLlQBbzJnCwcgYNgy0E2CKNAqNYGiSph4dMmtH+dk?=
 =?us-ascii?Q?qBbDje/U4z5XR1YNzCS/PYqJLPP/GUMJsrqXXmXi3tvVxmHtMTQD0wyTM2wW?=
 =?us-ascii?Q?15pgHuW4bEDHy/dX1YcafNkwO/a5qkg1b8bhaTpE0KbVfMN5Vogun5NBICWU?=
 =?us-ascii?Q?aAqx1GetlNsnk0panExEc2/noWl44Yvuc3CSCkZ29zC83OGtHJfsvjBKUmYu?=
 =?us-ascii?Q?MMmUgpDXSxcMg7XkaNnWeVf/JgkYU+zAGcoGk6PbuNXu5a0eey8UyRDulc0J?=
 =?us-ascii?Q?32Ni1vLSptfgFt403hEW0+j39LZCNxjh0f2X9N8R79NwT6qudMJiNe4jcSbp?=
 =?us-ascii?Q?ES+k1okE4C1p9kPLETcfX5+JCr5olS7uQxD5e3oASQFVFZKDVFtTzhL1q/JK?=
 =?us-ascii?Q?HpGxdmdoZcCz4nvYAEQy4OkhuancCKh9gRn2brY3GDm/9cTWL9CgQHCXz2Rr?=
 =?us-ascii?Q?lZ7x70v1NSf+1Mmy9MNKUhpcOVHFVLEIBgocPRRHG+DQy+eZog=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4z84Hl6fGkxuDmgBDWgKhrqMC/NowAnI+XvooWRlnpkABIQcuInG1sTJoQNU?=
 =?us-ascii?Q?XDmby5g/Og/sBsRVpRC67H8SFmzJs4bTDTTC/WxccvTw92ba24i0CESr2yvo?=
 =?us-ascii?Q?CjUM2RiA2/vp2QiQRjhUdlxkhRcIVYfuV0ezFXmu3bvdcxXDSP5bEnZOgX5Q?=
 =?us-ascii?Q?bTZBtnZzDpeBhZTD/1ecODNTTYxSg041tnbVFxlLcfRXStsqU3t29D3wrGnF?=
 =?us-ascii?Q?ygp6vNavChQa3k/EQF4r2iGVUvnHmj0A8cra8SuhphgHbEKQN4doP3kwW6oS?=
 =?us-ascii?Q?MkIidEbWzwKXwMcg2fcelWaRbzNXdbN9Vju6i1S9Ib+2PjkDoLTmqHyUs2+J?=
 =?us-ascii?Q?/imx8rj+WuVdVu5ksWeHtTv1H+I/YUE+1lwxk/gXG2/iuguJrxPEh2A7Xv3L?=
 =?us-ascii?Q?Yr71wmrOgL2ta8nYTRx7c47AfzjqgtZ0EJc43fP+BJq1QGmHbEcakstYs6b6?=
 =?us-ascii?Q?NVjLg+Za3Y2lKE+PpX713TCpnBYCp1c4ZkxFch4p6rAXrfv9XnpmNgwWSn6f?=
 =?us-ascii?Q?w//9Ly7+BZIvfXboi69DAOf/QwmbCufMFp1VYQU6/lKmIMtRjE2Nt4a2MVu3?=
 =?us-ascii?Q?k2nim0AWo+AONhxrfmOTavT/LY/oN+owlB6WniJSh4RNy85hoiP9YMmUumge?=
 =?us-ascii?Q?+L1nSitmwFfS/Uc1LI0co2SpacYk+bNUerp8+muI6o2CKNhbrDXHttGEZnnv?=
 =?us-ascii?Q?ixga4mF6yLTCTmNGpy8+3EBUhSrPoN3cy0xy9EuEjTn1YNnp/rKncuCdsCY5?=
 =?us-ascii?Q?F0nTRLVHPcQUVrNPhnadkXQ6e5Pd+E8QKYeFlbfZ6qpXRUpzDPjRC5Q/qatD?=
 =?us-ascii?Q?RZX/OzreAXVoImkKHSv6loAhyP/em+ZvYW5sLCsrc22ubDdMtbjcQaKib8Lk?=
 =?us-ascii?Q?fHcS5PQyuaOM+9IAHZIq386bxEZ3sBnsLDknXjtLpVaczAvTkKUMkx5lwboU?=
 =?us-ascii?Q?Kyc+/ZSH+xvIXYD6tE9ImqcEFEWqIc9a2pGLBKRlayf6vkDab038aggLO2Fz?=
 =?us-ascii?Q?iT2tMZMl/H0h9sqBRx3RYFFVbaIDiyogX2yidIhWIajYssiIXadR+F4IKQpn?=
 =?us-ascii?Q?Guf2UQC2C9kd/Ul3cJ8bQbgMGA1t+pWFPDNJ3E8yZ0iTp4eRiu/bFIRHm8a4?=
 =?us-ascii?Q?/89I5jRc3xp/qlWybEfPQjGUqbZJOHCWS7BiD3VuI7Dx47zAxM5PJ3fAHkmu?=
 =?us-ascii?Q?TUYOaMahRcX+FN8YLDrm4RFmoXLoYYerpNMz+d7zqOAdQNG4RdufUdVwe+0u?=
 =?us-ascii?Q?TqwBJXf4LEY3C51gy2ey2pA7TkRva7jsp/jKRnlml/3PBYcDrKkO04P/0OBr?=
 =?us-ascii?Q?GuRe5V94/WXU7XhGv7zD0ynuGh95ZAwsulnv5ARVLr3Djgdms3HWKaO4ZxJY?=
 =?us-ascii?Q?KMpKbsDld3l7jKqNX7Ldv/lQMr6oyoKkuE3XDsCH+An7IInlnSx7kiZ+74Fn?=
 =?us-ascii?Q?pt70MW92IBhHuSbZG7nsiBCF0Mzo4pRoAS6G2mit5UeDOIUkSQsPrdyVEWOU?=
 =?us-ascii?Q?MU61DJsvvk/5ICu5VLuQTmLuupwVWc+urYJ17l1Pe+6qA0UcyJ1gTIQl30HS?=
 =?us-ascii?Q?qoUG83mBba9OzR/D9on0Ddp9Yk9KkuZTtXesgjW0Aec8TxIRvt0PCMuYD2Ol?=
 =?us-ascii?Q?ucQV7vqU1MAv/v/J3eyAiAA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36556a6a-983f-487e-ab4e-08dc96fe083a
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 23:08:18.4369
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bwiNCQvky34dwMcGZBOWCLjdhSqXuZLIGFAGwh22upluwOHBEXV4lRxLOa+fnSIH40d8XS0XmCjOI9WDPFFfhvKEtrG9J78nyYhOOE4xRjHsNYINCJYvVSIV/JEQV3ZN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB7264


Hi Krzysztof, Mark

> > > Current simple-audio-mux selects MUX by "Input 1" or "Input 2",
> > > it is not user friendly. Adds new "mux-names" property and enable to
> > > select MUX by own names.
> 
> > > +  mux-names:
> > > +    description: |
> > > +      Name of multiplexers. default is "Input 1", "Input 2"
> 
> > I have troubles with this binding... It seems driver expects only one
> > GPIO, but the binding allows any number. Similarly mux-names...
> 
> > Anyway, this does not look like hardware description but rather
> > configuration of driver. What's wrong with input 1 or mux 1 or whatever
> > is there for default?
> 
> I would expect that when this driver is deployed it would mainly be for
> selecting between things like microphone inputs that are defined and
> labelled as part of the system hardware design.  Using numbered inputs
> would *work* but it's not great for usability so I do see a use case for
> labels.  Possibly we could figure something out by walking the graph but
> that seems quite hard, possibly unreasonably so.

Thank you for explaning, Mark

I noticed that the property naming is not so good.
I will fix property name and git-log, and re-post v2.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
