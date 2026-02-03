Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011015.outbound.protection.outlook.com [52.101.125.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64FB33BB57
	for <linux-sound@vger.kernel.org>; Tue,  3 Feb 2026 06:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770100059; cv=fail; b=UWDKq/zEaNhzI1FrJhL4DlSOySjEWMQmM/W/VszW5skPhrcZf1kXz5POZZPZgsL+TXmTV4qi7yTXHR/Q814jp5OkuU8wNeXcSJvnfXpDmL/nQVIiJ5NtO/07KNM4bnoto+WVvp6XWa2TdsUULMe09o8gkutRpcdpVHVGS1572m8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770100059; c=relaxed/simple;
	bh=yUX3rOtWwbaSBEMy6BRcN71BrHYKBtDqUrm0tHAu1R8=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=F8BYZ44LHp+8HCI1yBhnrrCnxD+w+17QOLjC6odaeMYVcV9+wpyvTJ9cckdmrQRLTBp2IKJ/ANYo7WIGVfMYAClPTlQTy9onhw5DYuF1O0tUqAQbpBmPIefV2/QF/rYQ9OtcFw4OQhKEJzlFDz+oH4Ej9FxwLu+ABRvIc1G29SQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=oQmqKOB+; arc=fail smtp.client-ip=52.101.125.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="oQmqKOB+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AKKq2a+kcYJBv/LAddutS4IYnpQ00mpBfrRTuTmxUaQYngqrSDmebAVUaQdnVVzSumWLWe83UfGb0QVktSmEs5bUoiWR5Hk5ZvhvkRWtD2LC3fa7ak3wpqJwSEHIvOOiI2gyTWYAfmmm+ZtVcpp1cKojC+htCs8+YnkO9oabK56heO28oCHgPjmaTuJB+SEvKQYQT8M2oweqQmD60c6OyxjLPCsk9+sTikqnznO2OUi566i686HWB/FMBLHeAgjO8F/aMI5fd0z7WKV+8+aba2o67+UTQwFtIacKx8nI+bqo2+oXAqfil35fxSns16oY8ltBcLNkKkYvz3S0cbpfhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qi2FmNmG5+CZr5raH+21KQdfVEpHIbCRVEaYpTPlIkw=;
 b=E0lbnk7Gg9offJ02ULkxhpCfSw0FTlazefXfQSoULQlwymhkmdTypInMAx6ShCBUIXDWqScRCe/bPOu/0CiZMBy3N5tPiDciOzSVrQjq/RzWuMBNEYcKTvKX0pN5mQdZLXPypaiuqSW3TSGFDiT6Ban3aSron5DIsq9+LEIEEdhjL8uCQUJvR4KshwNsLP7HXkALkoq1S9Gl3PWodkgzT69qYFSe8NC89Eec6FMPS0mVXrEHR2STj21kKoq6o1jM0ePg4Wx61F9QkkyxkVAjvG3VIYxK7t3jnsjBOxF6GWmen1zJQWGyPuXV9Y2NqOkLNDuBaqW8EbUe3BgWCfxung==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qi2FmNmG5+CZr5raH+21KQdfVEpHIbCRVEaYpTPlIkw=;
 b=oQmqKOB+TDkA0Mir9vpAjX3ld7tlUfni/ERM2Rl5TEY/+Qj7FYwDpnbkJUVDImV5dxqT44cI3YhcEdPBGnGRu2jjYeEfRa06KRZe+cGvnlb9JSWN531T5ewNwIq4bLZr4s3TM3QGBuHl26EFEmLt8BiORlwolI/PnqjfUfHjTBk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB13067.jpnprd01.prod.outlook.com (2603:1096:405:1bf::6)
 by TY3PR01MB11243.jpnprd01.prod.outlook.com (2603:1096:400:3d7::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 06:27:34 +0000
Received: from TYYPR01MB13067.jpnprd01.prod.outlook.com
 ([fe80::dac1:6ae:15b:67ee]) by TYYPR01MB13067.jpnprd01.prod.outlook.com
 ([fe80::dac1:6ae:15b:67ee%4]) with mapi id 15.20.9564.016; Tue, 3 Feb 2026
 06:27:34 +0000
Message-ID: <87zf5q1gve.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <linux-sound@vger.kernel.org>,
	Lars-Peter <lars@metafoo.de>
Subject: Re: ASoC: soc-pcm2.c ?
In-Reply-To: <aX4D1VodQ8Ksrad6@sirena.co.uk>
References: <87pl6wub81.wl-kuninori.morimoto.gx@renesas.com>
	<aX4D1VodQ8Ksrad6@sirena.co.uk>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 3 Feb 2026 06:27:33 +0000
X-ClientProxiedBy: TY4PR01CA0100.jpnprd01.prod.outlook.com
 (2603:1096:405:378::6) To TYYPR01MB13067.jpnprd01.prod.outlook.com
 (2603:1096:405:1bf::6)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB13067:EE_|TY3PR01MB11243:EE_
X-MS-Office365-Filtering-Correlation-Id: 41378de8-77a9-42c1-0386-08de62ed50f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PevZ6wvq62BPc6/w6nFuCBaFY+yLxpzYv1r3IUVAHfvdVtnEHhF2xRifSl46?=
 =?us-ascii?Q?VLsNdBPN0L7pbBfEiM4E5Y0YyF1We5eq0wtcXA1DMXiUWO2PHZPVzLtWPKig?=
 =?us-ascii?Q?mxH1TCgjEYJ1jUxymrcGSvptXpa6sBmNYMzF1LVsjXdem5u7x6qdn3PL6VYY?=
 =?us-ascii?Q?ON6r87R0+mBwxt0RGXzVKBRS0R/Qy7LoVol/32UPcQ9uiRupOliDOifhZF7i?=
 =?us-ascii?Q?7KaStRu44RW38VA2j/c8+v1f4P5CUEbGsTlrQJ/rZgtDCSxL07Tak4x/ECdb?=
 =?us-ascii?Q?0tZK5iWV+K4CaLNZQk08iLaarAKA205xdyYYwdtjSUDi+8OXyEuHBG0BZ0J5?=
 =?us-ascii?Q?lTWQp4PjTt/dO3IYDLdMbyjettqfuZIEl+4a6XNNrfYL1cJqby12Z5iwqeZa?=
 =?us-ascii?Q?bKNCWE7rEq+8204bdUMWbBtP9O1xiIfUsTNsjbSUQ+2EG56GE0AbISjqWZEl?=
 =?us-ascii?Q?uaGXUmGTOvpWjD3zWVAcESbOgPMIifyiRrsrbtEpzoz612Y5MX9FlJbQqdep?=
 =?us-ascii?Q?N3FWP+jZEY4p+p1bXU26rOITzOkOlRW1lpQl0g9UdzSbmPflzsWUqU7T6V0z?=
 =?us-ascii?Q?Lgkd3eqijfotYDA4GVdA4yvWKx3XJWvkjxtq2zzE8BwTY4ebSCgLVG3/Rm0u?=
 =?us-ascii?Q?vMY++uzYrwu5QfbPghLydfLLqQsIbTmnoVl18ilOR+L6FlyrbXNtkw2JUBr9?=
 =?us-ascii?Q?2772cHdXZZ5zZasPsga02H19KC2Pl6PvaYgW2x6/Be6fW+IZl3wo/wEdlukJ?=
 =?us-ascii?Q?7QofUhQPRcpOJY0hxmeHfOlbF3Kl32y0/sMcQEa336irmq9dbAlSCS0mMDLS?=
 =?us-ascii?Q?YqiSYO5yqMYRg+qjL+46q6K5WgiPiYxOeNT4aKBRa8xNrRkurLNBn/2aGtr1?=
 =?us-ascii?Q?nKyoZ7gsuGFlu6RDRrKgXhXqcxkY5rlaEBDO07/IuG5cv4TF2sjsJ7r/Vh1q?=
 =?us-ascii?Q?bEC56IHtfdrt3mzjR4my12vSr9tN3w4EwL7sVnHIwgXzjGCsp/7gpVBozH9E?=
 =?us-ascii?Q?eqi8sMdGiu1gJhMo/nLsdtHCLiN7WFWFqI6QEqxo5NMZsFcioPR9A+pSbnj6?=
 =?us-ascii?Q?lYnr3vaMC+P8wilLPBNNjNWbo1M/2NanZPwa9hkdgkbu9Tf4A86h+Jo/Rfao?=
 =?us-ascii?Q?Ruh0yEejoVHRqW8pZXGjXt6kBfhkgw4MUjon4BrL1EftEq3fflcK6n29p7LX?=
 =?us-ascii?Q?J+QUx/V/wivHzTg0Ict4brroN+Ymb6AKgvuQYoHvi1dfbqBBrwwhWsRey3Fq?=
 =?us-ascii?Q?PCvynz431HaerzEwYq7HN7VSc3TEVQv7DNrZTzHcyyHSpFB+ClDXYcN03HUW?=
 =?us-ascii?Q?igcbb21qMI94mnTRZgOGgGhFGZKYVaHBD8JgN0o1sSfoaEYUL8Sk3gvfve9T?=
 =?us-ascii?Q?AiBCAI9TN2rJmS3lC0BgCKdy5PDERcXx6oBIKyGECxtJbOXqWD7LpDz/gUXM?=
 =?us-ascii?Q?cjGyYisjwbhxLEqhTY1vBd3VOGPzYHVoViFt6bOy20p0TjDs5foH9tY5JF5W?=
 =?us-ascii?Q?LFF3KYfpp5DiPNgwuG0whkoMTh8LB7aLUMpOlpVgM1SfICHzKWi1Isi/TAjo?=
 =?us-ascii?Q?gnaHPQBCv4BjtPil5V+1Ug92MWeIXgbMEjIm6+K0RdxuOMMUujoII0T1W2KN?=
 =?us-ascii?Q?kRdJfgEJzYzgF9c6Qa5habA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB13067.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vboCscUtesTAMEZDnDADPItsocVYetRi5Gm91J4EbeXTbyjhJ57sB++HIuV8?=
 =?us-ascii?Q?Uq2gSSQGShvOtlTWJvPbn5lEbTkWXOdYbBiLDhFFRhAbaYO1SUQ0WfeIgpQK?=
 =?us-ascii?Q?JYskLxt1jIAGoWn9Q2jWktJ8FO13dysxfZLuP+LqtjxoU/edbJEB2NU2wCxN?=
 =?us-ascii?Q?KQjC0UfT/7CuBTNLEsW3dX6F1SC8Cw8Rcb9MnpWKbAYHiCJg6evMESu6hC6V?=
 =?us-ascii?Q?y9F8cLGq92bAhyMobNJ+LDyBb61avlCkgbupfdxbXFbZInlxK8ZNDBQqlQkf?=
 =?us-ascii?Q?5gyV4+2qv9ZSeOPq0o7EsH9A86nVXQUZKki2ZLVX7wHVSeaETdLnSBrqmmaA?=
 =?us-ascii?Q?qC3OxP55JAGw/uE7UJ159OF+lNHkhZQJP1PF7YV1+A5JxeiInRvwsIqxhpCs?=
 =?us-ascii?Q?OF3OusnjBBRSFoIYvode8BNdcm0gVPN6JUYoezMQbFFW8ZvYjQIpR+6xsbWj?=
 =?us-ascii?Q?k6i90jR7ipM3+ibxfLOuvu7Zl9IEhiks/QRaIHaX+N7mWAE0cXtWsPws/KNo?=
 =?us-ascii?Q?G5O2b7FsflGHYMevntuGOIn3227XQd//IylLAuPuMrpoufgCYcSIyF9UPWJ+?=
 =?us-ascii?Q?iEGdn1nWMAHpblMKDt/ROIAFr6YttajHNQLqtWSHNpX6skI3mu2AviMArci+?=
 =?us-ascii?Q?P6tlDjIUkW4/sU00eUFsjUGxZrOgbUE9Ovhj2Kx87J3uwh7lZKNk/qV3WQq0?=
 =?us-ascii?Q?2rLbWTQgRLIkYUfA9W3zWsDfjBgoAUOOLUfgX4RrrkS8fxlAtIYW6q5Fw7s3?=
 =?us-ascii?Q?JZ26xqo0lSA8U50cAsx7gglkinnE3DCE8yDTh1cZpl2KKiUVjAwQry35asRZ?=
 =?us-ascii?Q?jsa2BmHHLkQKbx71eEdBlA9uD3srXJTCUBgutcEwxrMK+1L0vCjbRo2n+KvD?=
 =?us-ascii?Q?u39d38Dp8hDy4NPmamElAheSBmi6tHlp8VZu/8Atyyae9jtFKMY5EkzuAhbK?=
 =?us-ascii?Q?N+uW56AKAq1wJ8YVFgLeb1oJCdy5sP/X8+EjGOF3bLg/QyQQMwV1M032/Kqn?=
 =?us-ascii?Q?aq0G65ePgH7sFDLcqzyDOF5Kyjbw6R75aegCGVoRsuJEk8yngcvUmFKCuluE?=
 =?us-ascii?Q?AWJo55moP/9+REiIwfITC8Qm+orNqNPJD+rvl8ZV5jD/VecEMQ7fMaWX88l6?=
 =?us-ascii?Q?pYNe/MZYgc7HYIA1Ov/tBPPlLfPwm3bFpNU372xgSZf0GtFLuUw3YiDHEFoF?=
 =?us-ascii?Q?2hoBGPkeiy0Ir+c6n6mERpwhlSfZYYHIQFaE79YLHCe8vW966WuU+ppQlY3R?=
 =?us-ascii?Q?LoFhOoDe8iZ/T8kPXJGPquIndpVQrdifX/j08M2j9G0Q4+iQn3OshxuHq2vb?=
 =?us-ascii?Q?MUfUEO+fbO01ZgZ6gOeRjooB4UwnGtdHzaFCyDyVztszxc831jpGhUtqHrgA?=
 =?us-ascii?Q?aU8DS80p6+IzeauE0u5Eydet/Y2QEdg4nIm/7hXgdWU1ljEO2T5omCACHiY/?=
 =?us-ascii?Q?QiG5+ptRP13vwCkjchfKHnolxSSlnmydAc9144c6+K1sfL6Rc2eC3abmeYlo?=
 =?us-ascii?Q?QnrD9N1155xmbh6jj6OE8bkVZ2tM8rjt8ewVEtrcXNRWlaD3m1RnWnlBzIkY?=
 =?us-ascii?Q?dPPc75o61cdxGTik/lT3x8GqVzQxSVCqw8Np/LijKM3XG9SafLcgLNFZ+kG+?=
 =?us-ascii?Q?/y3S/1SoN8jFaY4pDlXLlEshxUHRYwoBwqsXmgVfYqIl1mcGGVqXZ2MT90Wa?=
 =?us-ascii?Q?8pvOQd0fH0fXL2S8pHGBas/3FoR1HErp4Zi6fv9AgS+qv95sJi5x/luXfxw8?=
 =?us-ascii?Q?ytn1Beb9zCp3oIQ2Nd7NCz99Br3avk6aRs97coxWxsY0pm1R1CcN?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41378de8-77a9-42c1-0386-08de62ed50f7
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB13067.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 06:27:33.9657
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lUtbIU9rY2a9pq9SJ8OuYFrzgzBrDWRqpT9fAM5YXIjsDzi8y7A81w25n02Emc8DGqzSm7UyN5YpdSAAorBviKFM6Ha2zHl+Svkd7v5jJQAGP7uVwU5WIaeOfjr/8o1D
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11243


Hi Mark

> > (A)	  soc-pcm.c
> > (B)	+ soc-pcm2.c
> > 	  ...
> > 	  audio-graph-card2.c
> > (C)	+ audio-graph-card3.c
> 
> > All existing drivers uses existing soc-pcm.c (A). Nothing changed.
> > And create new soc-pcm2.c (B) and new card driver, for example
> > audio-graph-card3.c (C).
> > audio-graph-card3 (C) user only can access to soc-pcm2 (B).
> 
> > In this case, existing user will get zero damage from new soc-pcm2.c (B).
> > We can just remove (B) and (C) file in worst case, it is easy to rollback.
> > But what do you think ?
> 
> So, as we disucssed in person on the one hand this is obviously not an
> ideal way of doing things but I think in this case there's so much
> fragility with the current code that it's difficult to do anything
> safely which makes this much more viable.  It minimises disruption to
> users of the existing code so we get much less stress all round,
> hopefully in the long term people will convert to this code and we can
> retire the old things.

Thanks.
Yes, (B) should not have any effect to existing (A) envailonment, should
keep independent from it. If this premise is maintained, we can do anything
on new soc-pcm2 (B).

> Well, the big issue is that it's sort of partially using DAPM but DAPM
> doesn't have full awareness of the system including none of things like
> SRC.

So we want to expand it or create new one.
DAPM is using "string match" method to check path/routing, but I want to
use pointer style for it.

> I'm not sure I'd go that far.  The trouble with setting a default path
> and volume is working out what a suitable setting is for a given piece
> of hardware - the really common case where this is a problem is that
> many headphone drivers can also be line outputs but the volume levels
> needed for the two are vastly different.  That's why we currently just
> go with hardware defaults for everything, it avoids trying to code in
> settings for a specific system.  It's clearly not ideally helpful for
> users but it's a lot easier for them to fix problems with UCM than it is
> for them to fix problems using the kernel.
> 
> But that said once the code has a better understanding of how things are
> wired up prehaps we can have some algorithm that can try to guess a good
> default, possibly something people enable optionally.

OK. I think default routing / volume is set by Card instead of CPU/Codec,
because it depends on Board, not chip.

I have mentioned that I want to reduce amixer settings, but it doesn't
mean soc-pcm2 doesn't allow to use it.

Whether having default volume or not should not mandatory, should be just
option. We want to have flexible framework, like some board want to use same
style as before (= setup full routing etc via amixer), and/or some board want
to have default routing/volumes, etc.


> The graph is generally fixed, where there's anything changing it's
> usually just something being plugged into a port, but there's systems
> where the routing can be more dynamic.  For a really simple example a
> tablet might flip left and right speakers depending on which way up it's
> being held.  You could do that in software with a DSP but you could also
> do it through routing in the hardware (and depending on how the DSP
> looks it might look more like hardware to the host computer...).  You
> also get things like routing around some effects blocks depending on use
> case, just turning the effect on or off might mean the effect is still
> causing latency so instead it's disabled by not routing the audio to the
> IP at all.
> 
> My impression is that the systems that need to do dynamic routing beyond
> just turning on and off some paths are getting less common but they do
> still exist, and older hardware tends to stick around for a long time at
> lower price points (eg, you'll see what was once a cutting edge CODEC on
> a board with a low end SoC because these days the packaging it uses is
> much more easy to assemble).

Ah, OK
It should allow that graph itself can be updated runtime.
And, I think amixer still can work for dynamic routing ?
These can be good example for test case, I think.

> I think that's a good place to start TBH - it's pretty much what we have
> for DAPM with the DAPM lock.  We can always go back and rework things to
> make the locking finer grained but hopefully that's not needed, we just
> don't need to do things that take the lock for long enough or often
> enough that people get worried about contention.

Thanks.
Let's start with big lock, first.

> Yes, being able to work on this without needing some specific hardware
> would be great - it's one of the big drawbacks with DPCM and one of the
> things that make it fragile.  If we can get a good development and
> testing setup that allows people to do work without needing to worry so
> much about what other hardware will be impacted that would be a massive
> win.

Nice to know

> > I have indicated many random topics, but these are just my idea.
> > My motivation is I want to cleanup ASoC framework, but can't on soc-pcm,
> > especially around DPCM. There is no guarantee I can create soc-pcm2, but
> > have interesting. But what do you think ?
> 
> I'm super greatful that you want to spend time tackling these things,
> I think this is heading in roughly the right direction.

I'm busy for a while, but want to do this this year.
I can enjoy this :)

I think the initial design is very important for soc-pcm2.
So I will not care about detail things first (= sampling rate, channels,
etc,...), but focus about graph / routing thinks. I think this is the
main part for it.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
