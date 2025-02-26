Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010049.outbound.protection.outlook.com [52.101.229.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 480522702D1
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 23:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740611479; cv=fail; b=OabxuJVfg7u+6V0EgeT3j4eJxtBQT/1bbclSDqka3qNEL334IdrLKwQ5Km73VxPM/yrCCpkAMQ+i0Mh87OVjKK8+aYN+R7naNv98VfWolxTggFF2bZIUo5cu88J2adfNrCTS74Clr6ifslQw5BPyhkBB1NHtsGufs9MvKtoq/7s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740611479; c=relaxed/simple;
	bh=PbIg1i/l8mT8OfXG7Zb1oCGW2uqjVBEcK91gc3kSRkM=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=nQYCZI/aguMhrEqaew3aJYcc4GgAt/9vvAUOdbJyBixeMv5OUSVgxgkdAZag0m65M1o/ek+qz7TW/IX6hm0Zb6GO/p4mwUxojteW9lknVJFzp3OTZq2r55TFvTyuanMKMB6QvfFtpx9RLe8h9+q/6gslFILDoJo9qcol08vt0BI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=BxLwzlpD; arc=fail smtp.client-ip=52.101.229.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="BxLwzlpD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EbnXlp+y6FrSYrHCZytdKgwqJRTRcOiPQ0eCVqGuPuSrSQKAgQJpcDDR94KO2HIl+yJDkH8JNrxzynNvoaYO5nZkap6loz6WoUgxzCXk/skq91uwug3jko4Zdv1jYq3xSQQcPBBKwhCzFF3Wzn1Zjw22KvNRWR8ni1SAx5BeFzGXaemxitFTMk+DNC0NCEIq4iNeAsIxksdBM+NtOt6SG23O606NA6pJFwYxYrkTkpH4/QE3t2wCMiUkanjqzhtV44BWITUuxl44Jha1yAGMXZzWOK2ka2nAE69bltF7jfCBA3z75Fc+v0/0CUC4Kd+ahUS+HBJH6v1eRZMwtdiN0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iWJ+sVuPc9eJyit6E1Nabr8wm55u7zKWACXIm1AkGH4=;
 b=LT7ifu9F8Y8FBNX3JjvfCDRWBrSMnNHFMxQD9ZAFKB9As5FghgCPW5YGrRCIohhKQkEQnSu4BVYti8N3NCPCGLNH2BM0UMdec8IEChVbWGTFwfI21JUG99+MxnJaKaB7JRh8vJrnpV4L5a6SHB8vEtUgBYS7waiUFze1gw5Cq8dS3fTAEs6xp2Cjd5tV23zE0T7moGfqEZ2JZhy6qi2Sw7rawWlykd85wxXuL1EVKyypuMVs32ID5yGDSp1mnbGSCIiGXM8r7E5D7h/P5cSpKOFMryXgKkxlikvlR/Qz2spGOIWWFAkrIGqSOMnclMbBuMTXk+pgdBhGMoKcEODKUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iWJ+sVuPc9eJyit6E1Nabr8wm55u7zKWACXIm1AkGH4=;
 b=BxLwzlpDIDfraVYnNb0yBDiy1Xd7sh1dICTQOUfkYuSPmmNY+qePOiWWpMsd7AiajjyhvcHqyjj1/DUSxpGlF5Pe9qDdgbPDErN8/p6wlP+1/zmgT+iqfLloXAccGvLeYdw3VLJUZIkko9EkwsqOOIgrolRypTHgWiaOE1nN+aU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYYPR01MB15051.jpnprd01.prod.outlook.com
 (2603:1096:405:1a4::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.21; Wed, 26 Feb
 2025 23:11:13 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 23:11:13 +0000
Message-ID: <87h64gqp2n.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	Thuan Nguyen <thuan.nguyen-hong@banvien.com.vn>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 3/3] ASoC: hdmi-codec: use DAI ID and Name for ELD entry
In-Reply-To: <742390ec-7272-4fc7-9fe9-865ff5247c79@sirena.org.uk>
References: <87frk16wxt.wl-kuninori.morimoto.gx@renesas.com>
	<87bjup6wx3.wl-kuninori.morimoto.gx@renesas.com>
	<742390ec-7272-4fc7-9fe9-865ff5247c79@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 23:11:13 +0000
X-ClientProxiedBy: TY2PR02CA0034.apcprd02.prod.outlook.com
 (2603:1096:404:a6::22) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYYPR01MB15051:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d86b176-3c8f-4480-7e37-08dd56badd4c
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|52116014|366016|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?i2NVa0ALuCYYgXeAsHh7AZ6bhvyNzTPkgCjnfBXGXTXtOE1zjSCgJ+UtMSw/?=
 =?us-ascii?Q?UJcbuVttAZC0QDfka9iyp5n26xcK0B9am2kUK8KJjFNpZXCOK3U407G1h+X7?=
 =?us-ascii?Q?z7ErR1Oi4zlptTGdXmZwh/x3+S7Gtn3jm13Pw34ZnIKQzlyVaxvJ2FlWedJI?=
 =?us-ascii?Q?PexfZC8Bswf9ucocWSaFX2Defqg6r4WfwM85OOEOd0C9Uokn1wRD16xXlsoR?=
 =?us-ascii?Q?mTZUJ+biOkpryMuI3PNHp+ATaP/YXXnvuDY3qJ5TuzKwP44Me8N9EL4FBQoM?=
 =?us-ascii?Q?NQfOMyC5rDgTZ8GuzRKZs5IG3x91v25BQW6JEUfnjDnVPYRXK2bnIDx5KjCv?=
 =?us-ascii?Q?wKXpv2Wmq9FeN7wOkdd33FiCSwqxquUiJgWMUsglYsAFTdS9VioqtavFxtqB?=
 =?us-ascii?Q?Sn54IP8zWV6NHilWns3uG03V2Ur8xqc6Yw1QEUuen0JX+ydclM7esAtT5/zx?=
 =?us-ascii?Q?YZrdBEtyMP91cq20Ea27CG5tBOrIShhn6IkmSab5+5DhWWEQ6isrmHIkTtdS?=
 =?us-ascii?Q?/60TldeWK9M9SJyoTO7aXWBoxogMeJQfF1R9BNRnfbngeMuMUNSY9nn2YEdP?=
 =?us-ascii?Q?DC6u8pQXZNHhaiKKkIeaphHrH2ofoFgDI7weyNAEPFk8ThqTXjJ6saCIrOSa?=
 =?us-ascii?Q?4Y75GsqE9NhN6RKOSObQKGUpFglU8FadPrHRvorR3cqHbtshwW+F1RJFCKgD?=
 =?us-ascii?Q?Ye/k+71yxqE8mGaQ4P6QDhZyU1CYrARmDEAok6Gk2LlWJlbNQk+ov0R5blAy?=
 =?us-ascii?Q?YwUTx0CX1FydNffP6ezMvRIJkFk1bIGLEFPjq0Uh1uROt4GLEj5bWMqRlmWg?=
 =?us-ascii?Q?hE2gg92gCTa7r2ZsGdIFrLUjoT9SYs0hWKKx4dSpRiZ/c12pEEgD5sLpB0Qz?=
 =?us-ascii?Q?QqSD7BPubqY5s26VQjhp2gaDZYmXLYMMb6azpqWFRFZYEqIzq/SAj267ox6z?=
 =?us-ascii?Q?FXqzfSUjhKHTxJsuf0Y4XSH37U4VJ3WE2zjhmOEluYwmZpNID3h9O7LzmFgf?=
 =?us-ascii?Q?P8f4ISi8SRQOik5WO4VbS8ZzgUjOdsqZQRqMyCIqoq5Ttk2VglBAvBN71WGO?=
 =?us-ascii?Q?mdwB6FYjcmz0DnmmoXh3sSI78WZ+4iteuFdoOT3j3AFQUnaxO3w5k5ICKLCC?=
 =?us-ascii?Q?jxty2ZBqj//vVMudK54maQAbwENn8SalBqsKXFOPcxFQMrXefNsGOwNL1WLG?=
 =?us-ascii?Q?Hfy9esGNdtSFYfP8WpnpC2ISlAQpA6rrd2oyXTwTh508VfWriJYNTEgSKjvm?=
 =?us-ascii?Q?zT0c1DXKIesj2wzRvPZrp5HAfIbpcPOzNh16hplHRQyl1qfUNks3BXM96gSK?=
 =?us-ascii?Q?NlTtj2LeuVhrxaS3UhboRz+zEee4Ll/xLaPv91UhFDEg/RTYn8P1+3TONjK9?=
 =?us-ascii?Q?UdVw6FyRdxPRDJW/H6519Ne6xgoDhlxJxJutNGU5VV2pxDH5MU8O4ZdRQxlN?=
 =?us-ascii?Q?u/j5k3u4+ERb8+Hi5Rru1GOo6dejum4E?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?gV0y+Bdq0vlM+aS1IVkayWJ3s3DELR9lPosD/A4Vr4BwTPBlKpgHdtFthThG?=
 =?us-ascii?Q?v6zFo1cfVakkaPfk59MGUsm9jDZci3Sll+89C4BUbVatu6QlzLbVb7XCykMe?=
 =?us-ascii?Q?GZ5y0h3lDA19cmtt0ZUzJ/MnEaekr6WmlfwV4ho3viK0xKtcsRSyXKkBSV5y?=
 =?us-ascii?Q?tLrH5lPejSYVQP4RAwhDjjlyT5ufCBBTy3hzb5R17haIeG/XaGmWsAdAVbEq?=
 =?us-ascii?Q?/G7KvfArCIuUJqpVOdYsXfjBJFXbshGwzUfFRmKmku1z8MZmcGIV5fiGhjQ1?=
 =?us-ascii?Q?vTeBHxtlpM5ms+NBsXSxQukcKbiW1VCroy/nhUeXlTnF8kmrME+aWqnyOlTI?=
 =?us-ascii?Q?M2QxbvJNWVzu6jLo4X80WTEFZmArWjitj1HJO0m8FHjQXLTo9q58uqUJARdI?=
 =?us-ascii?Q?vmqY/YQlHp/x0Svmwp6/4JhqI3SBoZmMVRvMnkdfbbOEEFDr3Waud3sH8ZJX?=
 =?us-ascii?Q?TvV5jgHr8+bUw1boZiYtgogI3GD7HCHXtmpjXiRmv3iHpZD4wAQotFHNDa5w?=
 =?us-ascii?Q?MSAFnhJDxum3kDMdRZwE1vWeyIZJ+uQbzqxesSRci5SHn8Va34sbS1PBXZGS?=
 =?us-ascii?Q?OebrAgpJ+jT7Aj88SuyGLrDeGK+TeJUhfLZg9M1EthixmKx2g3QokwfBKmi1?=
 =?us-ascii?Q?DPwM6mKdLNLKp0jFQsa3cc73n09IbpwqDWLHQ/LeAkwm8eza3wC+ZSKRj4Da?=
 =?us-ascii?Q?8MvIDYu4AAK28UHdg6o3nybPuZTJBsnh8VO4QNTuRtXotde8ZhOgAGCWUcg1?=
 =?us-ascii?Q?5HrvZyxZeDNdt02QvpuVjFFeepli3nE7SmjhvFz9EY/9Gcvi7XXNzvLY4pAu?=
 =?us-ascii?Q?kzEQMOWy3htdEdtYMYD/R8NPLvoiLQnDvPKCpExD9suo9kU/khGTYiakDZe3?=
 =?us-ascii?Q?AD4oeNsBktJvBubuoCMRpHIcc7xS6Qfi2zYIg8iVFngMlzlr5daZEjyFCMSa?=
 =?us-ascii?Q?AqTChChw+zGjVXjq9INMgQKlcfMGX1wDLY+c1z/rIEQD416ZKZ1AewjXw1xA?=
 =?us-ascii?Q?oE2EAK30AVlNoisAJDm72351Tqtc4XkxoDhnQzr7N+6VnAKaxweBGzsboSFR?=
 =?us-ascii?Q?exzL4HBgwP3jF8ODSjqSaA9Cjw5unW2MeWAZGOpeiE32LHKbsRqTJITkw9hQ?=
 =?us-ascii?Q?2nw0EbIEWJNOluz8zhAiRVBu058QqGXuHAXZt7FtVquxbjpQl44JzTQpu6Q6?=
 =?us-ascii?Q?4Q+u2Y5ng6mrThm/d5AOpFUSRHbZ5A738pNMMaAtpvUavVk7pQX5Boj7iK6o?=
 =?us-ascii?Q?tiiCcUVqqCij5kIuykexU7m+Rhq5ApOdIi34QmWu+LxZ6Fm72SDt/+YBlNNa?=
 =?us-ascii?Q?MMC0ffgPVzsuPqQ2LSU2P7zCfAtD0G6Wp6Zuv9MUd6JKdkFTLIDsoxE4VPP/?=
 =?us-ascii?Q?g0XGr5D2+tm2bNsjZzOP6HuwV9diZrq3eHJPpq4quve4jZzZHPx2gWwdQ6aG?=
 =?us-ascii?Q?p40M/YhcSwW0zU2w2CZ9NEJGSXX9+loIXc4hayP1xmv0PPm6X+ZTZgT+ptdp?=
 =?us-ascii?Q?H/iUOT+oTHqrkg0ZQhqX/I+YNUDJgxFEGm8JIMZ8HWLaPDSqacdZV6TFpv+V?=
 =?us-ascii?Q?JXzwdYQKd1mVljVn81n6vxHktSElmg0iq/6GYVn7rfLvVKzjQh0GR3X1xeiv?=
 =?us-ascii?Q?FeYIYMIFwE8MKO+8YfaWHsc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d86b176-3c8f-4480-7e37-08dd56badd4c
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 23:11:13.4748
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F+LE/9hrN+yuYu/hzuvQsLVZDyNOC1ri0DzTZo5u5JkJIX1RcmgSqwrIjlW6NkEYoEWjWJNOICA/mWJbXDqK/GORy4j9iJpn0CTOp6FzIAFjTHiQoPMEhUy6J3DYjeKb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB15051


Hi Mark, Takashi

> > commit 0ecd24a6d8b2 ("ASoC: hdmi-codec: dump ELD through procfs") adds
> > "eld#%d" entry for sound proc. It is using DAI ID. But it is possible to
> > have duplicate DAI ID on same Sound Card. In such case, we will get below
> > error. To avoid duplicate entry name, use RTD ID instead of DAI ID.
> 
> Acked-by: Mark Brown <broonie@kernel.org>
> 
> Given that this doesn't depend on the first two patches it'd probably
> have been better sent separately, especially since it needs to get
> merged via a separate tree.

OK, thanks. Will do

# I noticed that the Subject was not matched, and the patch is missing
# Fixes tag. I will post it as v2 patch, soon


Thank you for your help !!

Best regards
---
Kuninori Morimoto
