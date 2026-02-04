Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010068.outbound.protection.outlook.com [52.101.229.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A4B32BE630
	for <linux-sound@vger.kernel.org>; Wed,  4 Feb 2026 07:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770190129; cv=fail; b=ireQoFD6Q5eeTxhOptPrIyfz58aE8U2tCfFzSoKfZct5v47NizpTw8Yt/qJ+F31gV7aCauBHPiIvh3Bpt2I2QGXRsR8ozoqf95QjUOPevKH8hMPSIYarBsnbFt/MM4J8UZDp6H0yOvBGGdk9TvM1/6WmmrZOI4zO4gsU2mFKQBw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770190129; c=relaxed/simple;
	bh=AsVCdBuADaJYCeneO8Dr1eJAEO/3Np35fXcRlBu0z3A=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=OThRlrXTiuTi2sGZVIMp/51Rl/k7ObzgZbXgnt5ZPenJq+4bF+7gMlIUiSW5EIlmCKGSxNyPwUnR0qyUMbebJ3AD2Qdub1UgUF8qUW6vFP1gv32I/ik9a2lPDcjApkNGSTV1lJKe42tuz2HcMDLXUSNZhcUjyDkwJxDGxxlW89o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=gdRHFseA; arc=fail smtp.client-ip=52.101.229.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="gdRHFseA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LCA2QtE7u/4kz/DaMbt/YketI7dqHO/dTVHxDe6yEbcFwtgNXM+waX22vSA5chiN1OeytCxtdK1vw78m5UVzF9YDWB0Tq5dTRVgjmP4wlyGTq3jKd8I99GVcM4CzDaoBVeY+IX1q3eRMdcVTv7ICpcqXglTTkp3uvinkfRc4khIaKQfpaoAuht94guFbxCYD65oZnW0adUrt5UubXMdprz1tjTWcDC+lnxTSiiZYqbDNKFTu01i++s5crAtA71EUoPX0QiFQgGEddeAT5ETDVkayLPjBvqkqvKmbG3wWqHHWmM8+mow0uUsqSdC5XMfwhJlr7v5oQTCHiwllnTLQRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qBEMf8Cpavrf6yfdPK1voV/HUINLhZIFHJI4B2f6bz0=;
 b=OZpasH86ZFZrHBapOOaxlNUvfQElrVT5seFaKfb7xSc7orwqtMOyXMKKwX1mUClV9arUQT2L4XJMWEgoSJhifDe8L2aQ1qvCh09IIGkQZzqmyDIK2sbcx0XTY15XPmrvcce7Y6wQHgTh6cifRxYVkHFshpYE8u+UPVXbuVCe9jxXstsoFYMQu+OZBLbdzjM9T7hN4IqqdJ9Kp0+My5NXQ46i64NlE4ppfqysG1JQEAyBlzg5OMIw4QIDcYbi0O+qctkgfwUXC7MvA5z8Ten8zJQwExa9D20I7kpklXFz0Zv2MjIIuk1vf6xM1pvyM2yxUJDWE/IVGUnXNDYRCqnmpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qBEMf8Cpavrf6yfdPK1voV/HUINLhZIFHJI4B2f6bz0=;
 b=gdRHFseAQQPv34H7VP+TX7/9gIWtGshvMz4/vt2bTokKs7i71agLq0cxLYkAIuwim0BBur7yFIAtAlshQeg4CjBD23JrerSBvOMc61quHeoV8r8FdBJNjougNmPr2q4K1hLR+Sa1NDkPige5Odm0nV5dVPVLeE9K/MQNRAE8iPk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB13067.jpnprd01.prod.outlook.com (2603:1096:405:1bf::6)
 by TY3PR01MB11640.jpnprd01.prod.outlook.com (2603:1096:400:373::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Wed, 4 Feb
 2026 07:28:46 +0000
Received: from TYYPR01MB13067.jpnprd01.prod.outlook.com
 ([fe80::dac1:6ae:15b:67ee]) by TYYPR01MB13067.jpnprd01.prod.outlook.com
 ([fe80::dac1:6ae:15b:67ee%4]) with mapi id 15.20.9564.016; Wed, 4 Feb 2026
 07:28:46 +0000
Message-ID: <87y0l9ezm9.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: =?ISO-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: Mark Brown <broonie@kernel.org>,
	Linux-ALSA <linux-sound@vger.kernel.org>,
	Lars-Peter <lars@metafoo.de>
Subject: Re: ASoC: soc-pcm2.c ?
In-Reply-To: <12dddaf7-6834-4ddd-9578-6d4347def868@linux.intel.com>
References: <87pl6wub81.wl-kuninori.morimoto.gx@renesas.com>
	<5bf2a9bc-6b38-4d75-9f97-be9b65b09d21@linux.intel.com>
	<12dddaf7-6834-4ddd-9578-6d4347def868@linux.intel.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 4 Feb 2026 07:28:46 +0000
X-ClientProxiedBy: TYCPR01CA0124.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::10) To TYYPR01MB13067.jpnprd01.prod.outlook.com
 (2603:1096:405:1bf::6)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB13067:EE_|TY3PR01MB11640:EE_
X-MS-Office365-Filtering-Correlation-Id: 33bfa1eb-db7a-4adf-276a-08de63bf0855
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7eFD/jLKzl3LsC+xwyQ+EOSJy3ClITGRzwbqUxkyY077K8KY2dE3ELJ/E6QL?=
 =?us-ascii?Q?P4MNm2IAx57M+lRs5Vl2NpYq3NG1dLUM4YROjs9W8DRL23mUhu6DHNxtRAdI?=
 =?us-ascii?Q?iusIslHQum2mTYCMYqeRFrR6pek/HmjnTNQliuDRInOqT9IIgDHSUibwmw6s?=
 =?us-ascii?Q?/t4PbO0B7HQkfMdQYTjSvvtioVROgrJe8iSdUOu+4yZW2h2wrYXPZ+cqzam1?=
 =?us-ascii?Q?RJlShNYJq/Yb22V0aTU5dpNsJX7uOZ/w8PQ1rPLLcHQhxlKvDOFvcr9p0y4z?=
 =?us-ascii?Q?bBDWp4eQ3pFoNZR55CIUl5Y4TWx2jO3jwc388Q8vM3MFg6gRwogfPcJdoM1t?=
 =?us-ascii?Q?7JXp2l5NiE+Os1UYnNWBS3iR7hFwky6tFqFsGtmvTXPhymW08KCalzGMAI4B?=
 =?us-ascii?Q?uzPC+zLgBkE2MCvHhcFKNUBwed1XaV2AQiuW3uwP1YD8xnFLbOE5GYfhv5XU?=
 =?us-ascii?Q?NqBAaavmky99tHjAKOhW9RLnIjxbNAV0LwJTU+EQCi/i+/BbVAP6/xIl2O1q?=
 =?us-ascii?Q?WyjyWjiNGctVjpTdx4bFA25JFVLpDABRikfpk2565F8gZQUv2EBxB7on7Y6d?=
 =?us-ascii?Q?mEB2BbBwxqwpgQIi/d6lo3Mm9pMndK6s6lV8FrlrpfHzm4FpIOxHz/nZmtii?=
 =?us-ascii?Q?EzME/IvQdW8cQYlk22XD+Lso81ZFkANL8WmvggDK0eDpfu1RFB7dC9YdVM5t?=
 =?us-ascii?Q?hg9yj9rXWrt7iyEPlSHtqes3mYtJZpISDrjBUkqWi33szWQKxpQkFpmj/NVC?=
 =?us-ascii?Q?BsPPP1/KVxJOi8iKSx00IVhsolqe81NpSvLBkSVi1gqythp4h7mQ8zSPrnEn?=
 =?us-ascii?Q?SQylCPEPiaMrOiIwh+M+0YX/t4V4kablHX3puRUYojzlsKQQDSkbh7p89Xsy?=
 =?us-ascii?Q?rfWayinxXbjErqSQOL97dHsa7g+JXCLvjkQnQgr5bthZAzalNo5D2rBgJgyc?=
 =?us-ascii?Q?arpiZCn6eMRj5DwIoJ1OpQQQbJrL0ySl5ZCnOcmeNUebnu0SmnKqLZ41sOHS?=
 =?us-ascii?Q?XPiAnbSYYsY1yS0nGnXu1uaVEYJBd0ZUv/u4TY4iYTYGuKrZ9B5ZCgQRZtMn?=
 =?us-ascii?Q?puvEZTsLiCLZCm3P90jDY5RlwACdPwrwVU+3REvUatT64Ex8f9/F/hgijB0a?=
 =?us-ascii?Q?ioqFWmWFepHIkxf1X3rQ5ZZPXsZhkGPNNQVyRoi9781+td2XQDxIy5iicj4o?=
 =?us-ascii?Q?pcLuBbqYpD7aPvfNN4mOwUHZ4hiLdbJ4puuCnA48BVgSEFxCOiVKKcm0+3Km?=
 =?us-ascii?Q?xP1ODPttqsahQOhoS6+hjdOkA4BiECjcKiZWNcJUH8StH/RZdEvVsJE8/fMe?=
 =?us-ascii?Q?ERF/kdcHBhPqsupUb5k9na31G1ex62DPXffQa+XgA2q23vp+sJnp8M+Rg0CR?=
 =?us-ascii?Q?Dj1E19NQsWjMvX8JRg9qB2mwEHJwRuiJ9riD7zZasjdSCm6pkEb6bJDmHmqw?=
 =?us-ascii?Q?XWIismDdUoZrkhRPFTZpe1QgNavG9wxfO70lRJKqfiIFMtm/3lWToUvjuJ+o?=
 =?us-ascii?Q?Hto4BHUbZNtaU3VpXiT94zS7H9NFE16THsq3ZjXDBWJUoKRGRwREqaC2SypX?=
 =?us-ascii?Q?KStcJG+IEIFVdZUddhGj/NhMTFC4smo0eI8KyhwWN7IEboCnotcpaBAtrUwN?=
 =?us-ascii?Q?q2XLPPc6FAgOiXRcpWW9J08=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB13067.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jlNNAf8tJO32Zd7AqO9QSkI5AbN2c6zFGwf88KM5gp5Wk9nGxHhuy7o5hxz7?=
 =?us-ascii?Q?Euncyh1hYnI7BEq3XmOET34jDY5rI1tdSLgDFdJ4nEdS919EcOHA+9ad+XQ6?=
 =?us-ascii?Q?R3M6174Xh0lvc2E1U8Y5fZxFe+Jf9CZztmT5n7XXoyPXd0Qmm5dp7VVAr9PR?=
 =?us-ascii?Q?/XQ07qyhZQ5CqquZ0N/hapWLvDB1OGII1oPMbNr9LqmM5X5uO3Nx7prqCH3o?=
 =?us-ascii?Q?BwLJs/0vATT4mpGosfeM2GGVY7kjg7vptXnzXMx5Jy84MhPxMAgmPN1C+c+7?=
 =?us-ascii?Q?XZWnCc5roo7+OjSN2GJ504ussdi1uiuQVJHWQZGcv/9UmmRFBQtyLhpuvpPF?=
 =?us-ascii?Q?t+5A5nMgq0ye7Z/s829YfhbsB/o79sVgG2OQeG7yIxS+6otMY2G7IeSnmGTu?=
 =?us-ascii?Q?nmwp7UvUzWwy46ggf/T+vdSluaxvjO/wqTiwcq9DT+IcNZ3+V4jzDwfamUEX?=
 =?us-ascii?Q?n40aw973o34CGLlrtwrDd89m9TS8eXCNTqTMKtNCEobrPxj6td1N1UmJqrpI?=
 =?us-ascii?Q?kX4tv6ddGKp3Z9TPUia5i/kTYelThoE8qfJh6iawQvpiio6nhndMG38ROi2F?=
 =?us-ascii?Q?Gp5LZYj1/K7NLELEeXRNWDU71ox3iEBfRKNphHMTqyUcBZb8kvAJh1v+SAI1?=
 =?us-ascii?Q?sl/3zgKkggXBP4lqkyv9JtQo3aCNvQcXQS59/sTP/H+SxvlJB98VRJQ3NbzB?=
 =?us-ascii?Q?jKwjazzunU4PNcBJUbwBkOdHoSaLT7gKkx+t7eh95k45Z77WYEG1EetinetW?=
 =?us-ascii?Q?yGNRp6WuBKTfGFozKjpQ97z8XrMUqvHLTPZkE1phMNBMfpsmLWEzZVZ/mVKe?=
 =?us-ascii?Q?YW6mJw0hO5tmp5i11eoV8UwUbZ3LL0+7XMPxA1mKFe3rKGf7mwoxNKvUd//u?=
 =?us-ascii?Q?OA67m5VrGEZGkp35PdBZUx4+2KddBxpiNf+Q68XvLLBRmZnjOWlAd0+6D4P0?=
 =?us-ascii?Q?2fmXbRWiErNdvpc31SjJtrcvvmbjFeMMT8NoKf3jWWx2RR1QTg5Ipj7D6v5k?=
 =?us-ascii?Q?S0qxHC7LKKkLV76TfYfRLExpC0f7ehnJ28Wey6sw/YqMq4F/Xvm1IP8IAZJG?=
 =?us-ascii?Q?43dNC7R3QPJppYX6z57+rfeRp4i4x+IBT0sELURPU840IkTBThMdi8hZeUqU?=
 =?us-ascii?Q?wbp6rRA7BYHnAOycq3uSSmdZJCA7OHiOLCNSj9revhYMyuR8WZfLOJOMb2O1?=
 =?us-ascii?Q?q7Z+MB4Blt4QtnjtcDxElYbDO+zJUnmKL+eCBZ1Kx6+opCuQRTCOM25E6oxU?=
 =?us-ascii?Q?pXeyuUpJhcUZtZfzupq4feFWgVLqc2+hBoRmHsFp4lS3SiF+cb4Kb6ja1ciY?=
 =?us-ascii?Q?9vVu2xPMwG9GzHO+rULDddpXJfIqrKkTEek8Cyp6dnIjfIWNdl3bGqnwjDrz?=
 =?us-ascii?Q?bBIvz0zXKLq16qiaJqHn26HqfqgqZjRX0uNLoGMoLN9hxJJsMZaeFMr1Sz9P?=
 =?us-ascii?Q?LrnzYec8uXsosf+icM582uPQ/OX7ramAU5PpBk3Y92j1jly539uYIJOolzcN?=
 =?us-ascii?Q?1740Jy+bbrP5Lw4QnfAOoB0D9A3howELH1D5Vs7YZO/uimGY7JSQkuDpWzUb?=
 =?us-ascii?Q?EiI9ma+rKlQNhC7fE2+LjqujGoeHW/j15cUSVxUT1h/7nMT92Dr6kz/iwJKP?=
 =?us-ascii?Q?Vx5H+7+Uow6Uw1APAOj1Qosnr3JwY+TqzQ9x4Ow723M66fmFAg1zrF/bfojh?=
 =?us-ascii?Q?hkUKYK8TTea27PyRmyoKnURv/hQ/0Sbd/fBqrora8wO8z5KgPg5lHj2S4g1+?=
 =?us-ascii?Q?AGRnQVZgf0m52pBdrz6u3d+DPQd5W9ttFP5G0ihXKD1VcmnTrA14?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33bfa1eb-db7a-4adf-276a-08de63bf0855
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB13067.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 07:28:46.4421
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JyPdkR/is+t0HPAY+ey97bY+g8/SPpp4PAPCK2Z4B7IwUHER+s6JPLTU569NZTTkRMB7/cYJoD8oywdZC6W/ovcn7WsRmpwhqSq6KttQpVWGzg/dvkZORyl5woK1/XV7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11640


Hi Peter

Thank you for your feedback

> For me, current DPCM looks like forcefully expanded functionality.
> I think support modern Sound HW on current DPCM is not impossible, but
> unique implementation is required on each vendor driver side.
(snip)
> I'm not sure what you mean by this, but since there are several codec
> vendors and they produce different codecs, they do need to have
> different drivers. Some needs more complex, some simpler and DAPM
> provides the functionality for the developers to not care about the
> things that are generic (sequencing, path finding, register/bit flips, etc).

Hmm ?
I   was indicating DPCM
you are indicating DAPM ?

> I'm not sure if I read this right, but the proposal is to create a
> parallel and incompatible susbsystem?

Yes
Because update existing soc-pcm without damage seems impossile.

> How would existing codec drivers be used in there?

Maybe reused, maybe not. Nothing is decided yet.
That is the reason why I'm sending this kind of mail.

> This is why we have UCM, users should not need to know anything about
> these controls, they should be able to say that I want to play audio to
> headset and UCM will take care of the mixer changes.

Please consider about non PC user case, too.
I have mentioned about this topic in other mail. Please check it.

> You cannot realistically do this, would you change all codec driver and
> reduce their number of controls?

As I mentioned on previous mail, I have no plan to update existing drivers
for pcm2. Maybe small update might be happen, though

> We could have several gain controls in a path, one main and then
> separate ones per outputs/inputs, you cannot really remove these, you
> cannot just control volume. What would you do if you play to two outputs
> at the same time which shares one main gain control and gain on each
> output? How to make only output 1 louder w/o changing output 2?

Sorry, my explanation was not clear for you. I never indicate to remove all
settings. I have mentioned was like this

	    [A]----[C]--[D]----[E] -->
	--> [B]-+/          \+-[F] -->
	                    \+-[G]

In current ASoC, it uses default settings. for example above case,
we need to setup routing for [C] and [D], otherwise there is no sound.

Here, normal user who don't use advanced userland (= can't use UCM), need
to get its datasheet and its board schematic. And investigate connections
and amixer list, etc, etc, etc...

And more, as you mentioned, let's think about for example [B] [C] [E] needs
to setup volume. If normal user could setup routing connection, like
[B][C][D][E], he still get zero sound, because it is using 0 volume as
HW default. So he will think that the routing was still not good, and will
change the correct routing settings.

This is not realistic. Please note that not all user can use advanced
userland, and not all Linux users are PC user.

But in above case, input of [C] is only [B], and maybe almost all user try
to uses [E] as 1st for example. In this case, we want to have default
routing settings for [C] [D] (without UCM), and default volume for
[B] [C] [E]. This is under Card driver developer's design.
In this case normal user can get sound from [E] without any settings.

This doesn't mean pcm2 removes all settings. User or UCM can setup
(= overwrite) routing of [D], and volume of [B] [C] [E], same as before.
No need to setup [C], because it is fixed route.
And it will not appear on amixer list.

Please check also my other mail, today.

> Codec drivers rely on DAPM + soc-pcm callbacks, how can they be re-used
> in a different susbystem?

Why pcm2 can't call it ? 

> We use ASoC on non OF machines as well, I understand that the current
> users will not be affected, but having a parallel ecosystem sounds a bit
> scary proposal for ASoC to move forward?

Existing system will not be removed, and will not get damage/effect from
pcm2. And, I will never forcing you to use pcm2.
If you don't like it, you just ignore it and use pcm1, same as today.

We can just remove pcm2 code if it failed. It has zero effect to pcm1 user.
This means, existing pcm1 user will get zero damage/effect from pcm2
anyway whether it succeed or failed.

If pcm2 was failed, nothing is changed.
If pcm2 was succeed, you will get +1 option.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
