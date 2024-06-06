Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2052.outbound.protection.outlook.com [40.107.113.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B02623BF
	for <linux-sound@vger.kernel.org>; Thu,  6 Jun 2024 04:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717647428; cv=fail; b=UZ1ff8nO7G66Wc7aPMuwabBK+Aum0NKXTqVfdqP3DIKug2MdnbExU/TgOp2MYXQp3wAtvHyZsCc/NzEGqTbZOUbRZPTy9/36D0sLz6JqpqNFpwKzOpsK4qc++8Uo4lMtk7QBIhqQf1w7abRkXXMoRJNsS6T/ezE82P7Digqb6hw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717647428; c=relaxed/simple;
	bh=tHRlyIlHHkpgNbAMubwkbdjmvwbylfan164LyiLIQz8=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=cK0Um4FiOtH4tS9DH/9jx51DgPtIIwaMYxPvQk5KO1AUL+895NjKAyIV3HMZVz927YIo5hOjVM3Av3c4AbThmxrIfLfSsum1oUv7QmwUMaymtawanPIPji+GyxaGk+sj8lMJj9+PBuwP3uHyFoS2OVVxzxOpkvES0NvyKWVDMfQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=CCsSBIC4; arc=fail smtp.client-ip=40.107.113.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="CCsSBIC4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jZAWk2OOGZDXREQ+ZldHgeFBTqAj3i+im8aT1aAl07j1Z3t0ski1MsWMJUf/JJK8OUcaFKTmZiHXp5hR/PgMkQG/FLVmRVE1hvZFLNhJIXDxatkaIkECTYpIicYJkeCs+clhB0t6OX017qYt+U0s4ofhQ2SIWKFhofPuh1iLnZEFf6lGYN5CFr5FvOUR7dC7GVsYwynMr1MZwfJgldkMNV5O88b7DVD2+ga5G6c6K8ZGLrCAqzQIMp1he8ftodtLnUYPQmVQn9DLW4MDqGWrsJWBgF5PrxMe1IvV9IkFN7vvE0CKhJF0KNQcrwWK9E2nyw2xgYqxKO/xGgFxsJW0HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oy/qzehGX7IpM6obv6Jrd3aHc9EjC0ha4Tseehxes3A=;
 b=Cn5+HIH8d0j3rnVtNhekoKUumD3myFUbYT1gpNTod4dDSSUn8+1GajwZFYEt2zKd/SI8Z1Xuf/8wU4TM4u18RhSApgLmWbbHpeVr6ZFMvJSYwgML2o5W8K6spjWIrTcRM30pj4XyBdAz9ZwAvWZQBKMAX4Nqyur4CXZdR3iMkFrygVf/bwb6jVY3MBN+TpmMu3J2P+iN3rho2UgPJLM5aab8r92LlLjuE81Rhapwb33ASCpPgFFQNXZ1qlTxOfAUM2wIPvtA70A+tiRNZS4ilkIj49E/CbxEy/jq3RRbZSVRzTQorE6yFEjKTiD/HFL6ypQN2DtZeSf+dVrUTk/2Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oy/qzehGX7IpM6obv6Jrd3aHc9EjC0ha4Tseehxes3A=;
 b=CCsSBIC4di6vOfvpDMexnPvodMn/Cr59dByZFdyHyXSjMjyzGbLGWluG8QKff1QGNB6TnNHBbOmLxBKEq/dhIvwTjsAepLDmyzsKcAVUzPUgLmLySZrVmA6JF2/jlOYG1OIsLtngqlRihPAWf77roYsSZTTjENmqnoj4SQwzaUw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYAPR01MB5611.jpnprd01.prod.outlook.com
 (2603:1096:404:8052::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.33; Thu, 6 Jun
 2024 04:17:02 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7633.033; Thu, 6 Jun 2024
 04:17:02 +0000
Message-ID: <87bk4ehfia.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Subject: Re: About snd_soc_dai_set_fmt()
In-Reply-To: <CAA+D8AMoZ-DEBN0=5AjP8WRT95ztJDg_peoYFyZ_eTk1o0XxOg@mail.gmail.com>
References: <CAA+D8AMoZ-DEBN0=5AjP8WRT95ztJDg_peoYFyZ_eTk1o0XxOg@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 6 Jun 2024 04:17:01 +0000
X-ClientProxiedBy: TY2PR02CA0006.apcprd02.prod.outlook.com
 (2603:1096:404:56::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYAPR01MB5611:EE_
X-MS-Office365-Filtering-Correlation-Id: 88fc8b98-db3e-4107-bc5f-08dc85df83fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|366007|376005|1800799015|52116005|38350700005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yy/ffqCz6qorLs/u6htX8aGyUa53yqxagenNQ3siPwqaZE81lSW0v+/ptrXm?=
 =?us-ascii?Q?UQz4LgsGbcX4YU7UBSePyNyai8ETtemXyMSKeHrzgMX/rZqT9DETr4ExBmoL?=
 =?us-ascii?Q?Fa+YJ/ROzJl9qm59EPIY9ebuhK5pius8ksSxIQ9sSJYV3tVP+eYoFawt5HXr?=
 =?us-ascii?Q?YRrH+340xoqjh0Z7J6opu7RWGx1yV1CaNHLgyFa02bCnQf3dBva6vot9IfGx?=
 =?us-ascii?Q?c5zoXVBOJdk4Wh/0DYMIq0tZRmQfAcORww3nNCPbvCMhfqhPM+TNHMqd8oMp?=
 =?us-ascii?Q?Po63WGazgkeqPOjf+/faXPQGHpMcNG9EiKvSN5dAkhdM8BWdW+s2Tw3xPnAB?=
 =?us-ascii?Q?USuz2K1Y9JifDkGMWrSXbRr62cVFq3u1sdZTU7zhuB6XYj1qfIBDErrdEADB?=
 =?us-ascii?Q?GbrEFtJrf3JTu9n79w/dLi0kQP7JOHpEDQ/ohfsME4cZajAV41MNoF7gZo+V?=
 =?us-ascii?Q?GkiTu+O4RNcxbU8wA9RopWR5bJ+UfVVVa+y6hzB/yjuGQDL9alJVMu3TzQNT?=
 =?us-ascii?Q?mQzBoe/XayFRpVEG+vSVvmu/XftogloGmOdbcVmDOzjrJx98pvtAFu9HM+RX?=
 =?us-ascii?Q?mygrSU5xkwdORgDTZJpFzFxZyF92etgTNM+2npFbIRCfFmiOadBhuBZZbk0y?=
 =?us-ascii?Q?LrJshaRd0XasCA7oEYHxp+Nn2FFK/MFbVACENt32LBEoOg+DW2ORn1CujQwi?=
 =?us-ascii?Q?PiJE+RykU6yQ/gQqWsWXwBnQydw1k3l9JlGTFp4JN261XvZv9WeGDnjn23op?=
 =?us-ascii?Q?wZ/u5D1LBTWq32szkUWK3b/d1ZotlF61vNyriqT3pwWfPLdb1NSgWKARbr5e?=
 =?us-ascii?Q?U0oYBHMW6D6Cuo1tYlz4p1zZGu1c0/cYfteeS2vJGVfqNHCLyjgUIGwYxeo3?=
 =?us-ascii?Q?Z7C3r3Vteo1C0u11P+lm1V1qI3c6iWkaGAryr6ZUk5DM9Lz4KuQX5o4z5SFr?=
 =?us-ascii?Q?sE1OVwtCaWwG3QIbYJ6MmmgOxr9sQxN0fQSr1hZaUWJBjT/ldzQYtVx2Sd92?=
 =?us-ascii?Q?Uw/j1ezV/GqNmrQ9icisgFZlQpPJJGGBl2ySAqlhvIyFafHDSAlHr7GTKiI7?=
 =?us-ascii?Q?nSizAWqu/spqWmwMFRtcIjfAKlP5FObiZzz7rfcRY0L9d/vaKPe7mWuQITng?=
 =?us-ascii?Q?C8yZ5V4VdT07VpFbx70+cJpQjuAHuuDNjhNoXYj/vndqzdmRsSl0isDfgy0w?=
 =?us-ascii?Q?ATwm3upYbN/IhDjGmMirzSGAx1Z7Zp/I0sDtX7Bv2cMSCgR/mAuXI0ZUifAN?=
 =?us-ascii?Q?BWT94WlXOwBIpRfoNwzZGHUnG5iOo1GsXIb0CTEX+3nS/mBcLzLuydY59pWD?=
 =?us-ascii?Q?J95QoiPhDJLDUGwgymTHAT/p+MycxPe5R2O1O+Fwn4QvGS3gXQUcaUCGguKt?=
 =?us-ascii?Q?AEtr8yU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(52116005)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kywsH9tup/zHkeE3nsuKHDH+VRob2NuZ/sVH8wrscwQ9GUzBUnafFhE3lgP1?=
 =?us-ascii?Q?H+jp5glbBhj0YGlL4Z+18KMyXAK7LFo2cprQuKhwJXWRULI6HdVPf8FxijDH?=
 =?us-ascii?Q?DKS/EPCAgjoKSFR1Xx6Cfxkp5bM9HzAQdD4/OPSDEqRVsLbQ15RYjRGsCmfc?=
 =?us-ascii?Q?aKJ0HWQWePEJmnDQTqV2L/LzCQGCvVEkdVlBpiElZBWkOxzxP1xGk42AitkL?=
 =?us-ascii?Q?PMQH/ZuqUCNVaIgHLJxrbgRusdTsytNtW4gWx6FLtqX8Dr5tBChuK9Kb4vl7?=
 =?us-ascii?Q?VoA1Iz1RcP86SrnP/iBwCYIl9YTkfJKRuqZSxR4Ek9advcF7FuUQ4Wz0zJRC?=
 =?us-ascii?Q?fki7te59yereiYvOybz8r3s1mVGJ8emfDfoxzmTdoODiA3fPqJ4U+zKxZ2bL?=
 =?us-ascii?Q?lw31J0Z2f5NtR25PE2LTqY9BvhsKZ6UHTuL+JnBqWHEI6onau0DDEMjF5sXw?=
 =?us-ascii?Q?LpQNMsOxj4rzeOsgBHVir9gOhQHLvAPFo1WLDWreRxMjrP6nMtlWVAkE+W7G?=
 =?us-ascii?Q?z/7w6W5ADyJjQ1bFmq4/hmleKUvq8sjXQ9KMS7ajw0c/v4GyI0e31y4DHWKB?=
 =?us-ascii?Q?f0DPwRh4NOLRHSYC7awQmiSppfHKkXpU+wVcL+nACibWVZ7IF3K2OSn9IB10?=
 =?us-ascii?Q?82GF53s3xxmhtHd+ZQtI0Qr2GoFeWzajEadTZD5VqThtMCNDnyFw55UpPkst?=
 =?us-ascii?Q?5tbWIgkukDGavBx0SZOq2a6cuBGlb1JTH6CiAYjJ8/47fVii8WNk1ZE25XmU?=
 =?us-ascii?Q?VKHFvkArWmJR0VqObXvZijl4HnEwwiCSRvyQu1hWxbDODc26R+2yGsU52e+o?=
 =?us-ascii?Q?X12xg6I8x2V7dBRY3fTbPwRdIB4N0ZSHWvEjlRtJ+xCDBokkGspCBcpnNszN?=
 =?us-ascii?Q?5ciu+mrWtQYQMbqU8T9cWukmllY/D5enOVs/ivI/4plgGHWRvTdgRaK4RnRS?=
 =?us-ascii?Q?IDCgNerrtVY6YzHOG3T9AnnASixVURrU77s5tDdecjCM/sIrP6obWrIRCY3+?=
 =?us-ascii?Q?xZO9wUqFmxh1OE9W9O8uXYZU1TrEnLYUEBgIIj5F4GIZVcvrl9uNkkYiSauM?=
 =?us-ascii?Q?g7ixpUfQTfnFwBlm7db9JqdcZwHFqLIe1sHHek1R2CTvJoe1uH3BGPc8K8wY?=
 =?us-ascii?Q?qOu16lHPBiD9WHuKK0OjsoY5xTEhH0LZzK6KsOtf3RmAkR+F6r/n/d9ICVvE?=
 =?us-ascii?Q?pIQ/241eQjpao9Ed/zAtMfIWqAmQvRpZZ2s2GltqUj78lsgUiqWPJuH+WxAm?=
 =?us-ascii?Q?/dke/rb38vf72bXqU7dqJTTHWDmomACOZ/xMaViJqLu9Lh3S43HmoI7DmmR9?=
 =?us-ascii?Q?3R5FfrLCQER+aiD+Phn6zXu2vKwSWdYFiLpBhZGNZQm1nG/iUb+4A8DPvswd?=
 =?us-ascii?Q?JtI+i/yKtuyjxJU2JyXjyt7Re33JBsXQXi3UkTqllRtQp1V6A08DZY6PptjH?=
 =?us-ascii?Q?Dam7e1TkHjUxoaTm85ZNZ5TOcXWHNZ/9Ba2oOfp5fputb3JiwjtvJNW3oO2D?=
 =?us-ascii?Q?62H/pf8MTOn5Zz5YOyWS93OMKYnAG4addESRD7hsv72sAzm3WL4E2/afpj26?=
 =?us-ascii?Q?bAECk1cNUgPCWgkEK/xCUmTMFAIogYk20ryZffX5tk/ok78B3FvKrKQI0/as?=
 =?us-ascii?Q?V1juUq+4jTYf4oboCMndW8M=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88fc8b98-db3e-4107-bc5f-08dc85df83fb
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2024 04:17:01.9364
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ar78fXpqTqe4Oz+ebg9xmiPoKJ8LxH3ISYtiTpxnzX7nFDtKPDPF9MXPHpTRvlBYMszled8kG4X0/xT8ah+6hRXgLBtGFUZlYfkfQV4jzgIqsw1uDSEnhiWgAj+ngXUc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5611


Hi

> Some use cases require that the format of transmitter and receiver
> are different. Shall we define a new .set_fmt_xxx() function to support
> setting fmt for transmitter and receiver separately?

Not for format, but we already have the DAI that Playback/Capture are not
sync. In such case, we can have 2 DAIs, 1 is for Playback, and 1 is for Capture.

So, maybe you use similar idea, like below ?
Playback/Capture have different .set_fmt function.

	struct snd_soc_dai_ops dac_ops = {
		.set_fmt = dac_set_dai_fmt,
		...
	};

	struct snd_soc_dai_ops adc_ops = {
		.set_fmt = adc_set_dai_fmt,
	};

	static struct snd_soc_dai_driver my_dais[] = {
	{
		.name = "my DAC",
		.playback = {
			...
			.formats = DAC_FORMAT,
		},
		.ops = &dac_ops
	},
	{
		.name = "my ADC",
		.capture = {
			...
			.formats = ADC_FORMAT
		},
		.ops = &adc_ops
	}};


Thank you for your help !!
Best regards
---
Kuninori Morimoto
