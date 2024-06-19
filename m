Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2062.outbound.protection.outlook.com [40.107.113.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 915CFEDB
	for <linux-sound@vger.kernel.org>; Wed, 19 Jun 2024 00:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718755663; cv=fail; b=jZhsBvoIldl9vXuA0GMKluQpIsEME5jSnHyKzvvY5MMl8IyPAhDuY5/KEHC8R1iO7dreg123yjDZafATD7v43GO8l99TjuLajwUWKUqxozS+XpE6/HA5Totmgi2NSYjQeGr+GRzzI3FPj7k95XAX0S4AcUpkYMe92/sPrqCYG6A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718755663; c=relaxed/simple;
	bh=jT16dLn7Iv+ts9vSiZA2/8Yfb9pbx20fIl2Yx65pYYc=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=m0of+7QxSbkWsfCYaJSAoPJik5GtkrTmolcWzpWVW/A8/bARxVRqKgvyDK/pgwSWkZW6szRgZHTNekkGBC58JFLbyBIphQWM//Tva5JAooXGxAYpKTID2ycCAydDGK/RU/oxfskiSrHtnlJfDuqhVxH+78uA65EQxGEYw9tXCGA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=XhrSnhHY; arc=fail smtp.client-ip=40.107.113.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="XhrSnhHY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UZ32VbgaDdj+d6tV3k1Kg+kZYXFQ/YdZL7Wa+hO5Cd+e8Pgy4+7eQxcwLTOTkWObRDUuydmDbL3rZY5Obdk2HWiLDqVuFWOkyTP1I2//Ip/Kpph1zJCXoTFTzB5he0rkebT7rfBrgwNlLcbw78ivzjV+tC8mnaCMnoIGaoKGzow3HvIYuUSgZohAT70+57DvgB571Emo2XK0rmzpwRf6vP8lnREEh7PAejDyyKGqMqMnKJ/sBWCEvfzOUM4A7EqjRMxpnzqTWpiMIMBggmp1vpPKbUAkBq+cya8iUh8AwUx0Bkyyregb911W/DL+a2jIw8wv859QtFwNEKy5N9wkUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tpYIo+AnsjWXPE+3hh9yVKGmE/OhIkk1ft61WDAbd4o=;
 b=jWGWvGARKVZBKgGTm6Ym0jQEtvj0MNLnzRNZqROPe5DcoPVsWM5XbPSOYk3JU/6FLu9jr9xQAF1ZJJx5nWKvoB3BAISib2eWRVaf0onnn1DuLYtu1QyRU5E2WZqMwJPkTKfn/5WQAICAMWYk7jH9ByWilGLfI+gljdklvMQALw6CLVyntlTeRusMJIb0DuGVj9EIIB8KquKbFEWUbSrlXQ1Zo2ph9ONX3oktMVEVwKhyVwDQ4uzpE9twEag/tL9ltNu5cJXOxMzZuFkVm8YLSDHqhdDQwbDKPNjN0/CCFq6T0vDAxCUQEO+iOVsy2Xp4F/kKhuGp50lpmIJUPN4SAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tpYIo+AnsjWXPE+3hh9yVKGmE/OhIkk1ft61WDAbd4o=;
 b=XhrSnhHYhe/KCmblYhScqlJWr8XaP4zak70kCxC/dsAim/noOXrtEIBolwLonL8G39hXXDhlTJQmRvrNddPOBAXI7DbC+SXtZjUsZbBAAWazMOKeXvMbqI7rANEqH4OY5SnoxUPUmUUilAuOvokjCmmUl6VN0xBX5qXHBoHjITQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB7131.jpnprd01.prod.outlook.com
 (2603:1096:604:11b::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.19; Wed, 19 Jun
 2024 00:07:37 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7677.030; Wed, 19 Jun 2024
 00:07:37 +0000
Message-ID: <87sex9x0af.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Subject: Re: [PATCH v5 0/4] ASoC: grace time for DPCM cleanup
In-Reply-To: <6bf6adc9-9620-4ace-97c9-7de0cedd7d07@sirena.org.uk>
References: <87bk4oqerx.wl-kuninori.morimoto.gx@renesas.com>
	<6bf6adc9-9620-4ace-97c9-7de0cedd7d07@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 19 Jun 2024 00:07:37 +0000
X-ClientProxiedBy: TY2PR01CA0018.jpnprd01.prod.outlook.com
 (2603:1096:404:a::30) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB7131:EE_
X-MS-Office365-Filtering-Correlation-Id: f1e06de8-2965-405e-632f-08dc8ff3d3dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230037|1800799021|366013|52116011|376011|38350700011;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?r1rjhixM4yiDraaHozk/aWT7NTVL3oiAI6OmC44cRpgplgkQgfhnLBVe2I6S?=
 =?us-ascii?Q?XSkbXMl9xTKwGSqEv75iL2d59XCBT77q/+nnMyBv3n+xnBR8+UsADz1OlmEH?=
 =?us-ascii?Q?GzS3PheG7kT0cYUOSupJUN0N6DLWFJUpRT0fPqcgv8w4yGQ+OJCykuTj7gTi?=
 =?us-ascii?Q?YYllkpl2+k56ag93owmNFcRvlzXoyF5NcanOoyv1veNB5Shd2safyHk3FRbp?=
 =?us-ascii?Q?MwwHpUpUXc7eTZilYdR50oUEI1IGpL3+zOa2Rz8D2gTrEZomH1UlKDy48rbN?=
 =?us-ascii?Q?s95RXQgNRHE3IizE+rKw8Sbpoma+FmyZi8HqX8Cwcx549YHwGqEX2IcoIQOF?=
 =?us-ascii?Q?j2vMQGKXAaDObhyGshz7XrB+1vKbkB95FYOay6mHQyxosT8NSOG2J/QpA1am?=
 =?us-ascii?Q?qJyaUw2G6hIhFJpslFS+sOL45pk6Evh4lZh5pXCfsrW874T0Cj5g0u164bpO?=
 =?us-ascii?Q?aKlAbMmDVWa1eaAxTww8ZoAkDJr5PdhF4k6BNLoqWS7iYDA8V1SZ6YZW5Uug?=
 =?us-ascii?Q?VawTnfoX9cNfr3MkblnxVA2pzDvS7NVpcoll3tT8QZULr/fm9CpvE6SVkIUj?=
 =?us-ascii?Q?ohpo+IdCDBV9a+KBhi/WXQDNix3Py94D8QHzPVHXv32Lozj+5eKlImyd73nV?=
 =?us-ascii?Q?nNF6jOM4n4BO0TUfPaKV+jl6XN5wyLvEIiKL+k/MHbkti9F2tGr8Esn2se20?=
 =?us-ascii?Q?wNT9VExsXZ5cvJcdznN6eU1b30IgjOCuS7z13HsvxCOK5MS8TaLQ+XJ47TKD?=
 =?us-ascii?Q?oRVyzXOBeoVst/jymDG88fqXifVU3bMYI8GheFB41b5LM5n0gHDKY+k2+dAz?=
 =?us-ascii?Q?E28TcCLOddSdi+B8A8veV5ruI5wFwIPI4ZqVqanWR5j2VkD5Rie/9LhghSSI?=
 =?us-ascii?Q?I6PFNIEQANF7eUbJV2eZR71TeKRc81M0Wp7HLO/TI1e5x1tiwx3nbGw7JEtN?=
 =?us-ascii?Q?C2LEYdIwQe+1AZGmzEqYnBElAigyi44LDPTs2MyaNBrmXZMDHXaSURULhccg?=
 =?us-ascii?Q?dqtXercxTMoxI9T/XtoWA5aZEZGpxv+VJYWvNnmdk7+enYDSygqCqnmESYAH?=
 =?us-ascii?Q?mNHu3n0BRMCW5y0ooLTKK1bJVVw4MEl4ChJzfombYrm5UAEPY5tSVlmOaRgM?=
 =?us-ascii?Q?7HpvfhqRl4SMyR3W91w/c6/Cc7eV08f6JMtWK4migoCSCjGDs4y5d/eJkbQ7?=
 =?us-ascii?Q?K7vS1dwIMwjxc5msKlBjDlAtBjfsiEGp/hno4LwwrqTdowV9tjpr+wFN1+De?=
 =?us-ascii?Q?F2oFc7Sm6x3SnVzIEaNqM6MRFjggV8fEqwhsFxVgJqDYiyxaFxV22KLLlaNY?=
 =?us-ascii?Q?SC+T75nfixH/EvR9PAzctZgCx2krGnSmhtG2k4kUlYmkewXOZ4FTcYkC7x+J?=
 =?us-ascii?Q?NV2IQi4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(1800799021)(366013)(52116011)(376011)(38350700011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Sh9BgfK3ELvt/lDowNZ2n0sNRhtKtXWmBjpzOiZaOAUnK/R8HF0BAF3Zolqw?=
 =?us-ascii?Q?7RbIjcosBCCE47knxgtXxboLBNXtRM08L9bXTIjrRVFIByO4+9V8Wjm0qmBt?=
 =?us-ascii?Q?y4iw84lx1gx08tk4iGTO4pt0HHWqa2eGRhZlG2TrMas4SiG7vKmJJsanwHBZ?=
 =?us-ascii?Q?caFAFBeS4dowedpzEAx1zwKEh6+cE8byfvbWYbsmctyiPJ+iqoDJzPVrzNJi?=
 =?us-ascii?Q?Yw3ke4HVE5Og00B/1xmgW/dx3QdZG241XNgA8qgoAvRhR2lEHR+mJFXxOuHx?=
 =?us-ascii?Q?18zK+1/I/nXYWLfW6yjqGnbXtO48ssjPc6xml4VxjNsaFoQyR9Bl9Vjub166?=
 =?us-ascii?Q?6Gf39VOnmmr//4DyMOojuI89BMMShAcV2ThwkX4TiAi4V+gvd5in+7O3ikAa?=
 =?us-ascii?Q?UZkraiVB4Wrp1+KvouOxSj+lX1HtvW2azawVXWEyHfJmXbojaKaGdKrIKGsG?=
 =?us-ascii?Q?MhSy+9zbErVOpEI2k1Qb49Eaba1T4s8jjf+9Tsx4kThXium09FLZrxC7bMUC?=
 =?us-ascii?Q?A/n5fvBf1eN9/DzOLBbAt26vZomWZrFdpsTpabn98ysv0PZ7D+16K14sB+9F?=
 =?us-ascii?Q?74YZS7qhduA1KKpLZUCvSN9Q6pBq1mo8xF6kIOWGEolVFZAjGBaqK6rhHfe1?=
 =?us-ascii?Q?Q7vq1nUgDNAyobUHO+gE05/mkR3oXUdOvyQVodaoXUimRqaSpplKW8Zknwab?=
 =?us-ascii?Q?lZ6vwOZSyICMhzYEdHa1RdWDPHmuH+ddjXlYHOaDiW0/sxYG/MD6RLnqDwyJ?=
 =?us-ascii?Q?w2j6UC2r+K40qUcx17S9X1I1aRGSsg0IlnmyNz0gqpKFEIS2H7VTAae2m/EO?=
 =?us-ascii?Q?qm5qRkF5GaW2deLKu5FXHGS0FQlw2ciptb6nAXKlsmcgQIbOAzv+JxStySVY?=
 =?us-ascii?Q?Db7wHXLNZU6g1ta8UGbvH/SDWomzZvBx02/A0Ulbq0tWSVbQMOKMn4UuzIan?=
 =?us-ascii?Q?FtSexPGsuXP2pKSXqqBgE1CMy/sQ92NSCFTHW9rN2f3oXpoXXVweMPyeHlpO?=
 =?us-ascii?Q?uTou7E9S6uuQTJ+rref5Ch0ZYHSqsQ5rdyJ4Qpih5zxyf5a9ccpuNZDk3Te4?=
 =?us-ascii?Q?hPIhY4NeCRNh38UhnkWlTvDY05fjSF9tDMRCIJwn93Mg6bJ1mtOAUH+yufYn?=
 =?us-ascii?Q?xJjGaZ8hfi7f9OvYVJVMolazcxG4h6L9jOaXj3IDcIYdWz66L5dzbhT00uoX?=
 =?us-ascii?Q?81AOZuyPjb1k7kqXWi8wuvIDBaAfK1vgpUmguXTxz6f2dsLJB4YeXdPWiYH2?=
 =?us-ascii?Q?IXvbBP2Z7Tf//XEI6dCAkzNE5MPrtth5kC6pkqvjJ2KuMZp1AlX1xBqpDJO/?=
 =?us-ascii?Q?yxMXFYCecyoxWe5vC6bHUNVpF5ehA/Y4fwngcew8pDgp3uBTftSo9mBkSYqG?=
 =?us-ascii?Q?GSstjYiSKgQskRFQrg826gV/p3YGJjWmIc1CtiNZhRJRL5EVzvwh8GFWLH0Z?=
 =?us-ascii?Q?X6EI1Iu9eTZvU6zjHWs6I1kexEnksS8DrFZ8rEEaMxqGHBO13/IErTsY0RK6?=
 =?us-ascii?Q?h6oBZDs6/hvRvTXB3Zp86ID5A0zw6EiX4prP5f3LfnQZ80TM/HXq60+Wvu1t?=
 =?us-ascii?Q?8Y3FcXbEqz5frRMV+FsURvSbuthlJ7t+WUm1SUZ3qHJeKso//5bKTUhNn55R?=
 =?us-ascii?Q?402qXkzAHmsvfozcXgwcLZY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1e06de8-2965-405e-632f-08dc8ff3d3dd
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2024 00:07:37.6560
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KiL+A7OccZ9UAwoXSbqOVnf52pvOgfnJRFvPyyE4e+vX95j1EfKRWyuNox6RPVAfuxVoBovuho4Z05c17Xjs6rP6ICFPksYdTuNZoeQD+xfot4/b4+QHkV0rF3t3q0ia
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB7131


Hi Mark

> > As we discussed in [1], we don't need to use dpcm_playback/capture flag,
> > so we remove it. But we have been using it for 10 years, some driver might
> > get damage. The most likely case is that the device/driver can use both
> > playback/capture, but have only one flag, and not using xxx_only flag.
> > [1/3] patch indicates warning in such case.
> 
> This doesn't apply against current code, please check and resend (it's
> simple-card and audio-graph-card2 that conflict).

Hmm ? I didn't get conflict on latest branch ?
I'm using this commit

	595265c92668cbdbd9f299c49907734d468c12e9
	("ASoC: Constify DAI ops auto_selectable_formats")

Anyway, I will post v6 patch.

Thank you for your help !!
Best regards
---
Kuninori Morimoto
