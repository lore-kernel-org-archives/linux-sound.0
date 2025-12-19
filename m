Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011063.outbound.protection.outlook.com [40.107.74.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 058A01DB54C
	for <linux-sound@vger.kernel.org>; Fri, 19 Dec 2025 00:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766105395; cv=fail; b=MDVO26iW2FehEiZPpK1UJh374rsbnf8cNPUN9t4ii9vQ5ntACkQfCMUI0hjOtzePyErN1UnRL3ocdJdLmw/FW3/tnosxn6UIvTcSsrzXkiOtTRMkYHyL4sJQOam+PPDk8MI4RTkG6e2r4eBQzAlaGs60lQDqdv6RVe9N4IGWE9w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766105395; c=relaxed/simple;
	bh=UP4/4chaW8hstcE2VAib3/UxJj5JADn3rqXlYnDcboE=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Pnw1xk3wjSoujThXuql3zeaAx0jbil+KxMxuONVXPXTvFVbWMV6VlIE6DP75HyWTxn8DE6CLk4vv0i8H4+lgP4z7ueQm4PALqFKDO1AaLzAYJ5UkINjvKTObHjQwa7phLKn2WEGkLhHuKeOCxgFN1VvP8F++VoPyPf7Heoe/o3w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=cIsTf5qx; arc=fail smtp.client-ip=40.107.74.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="cIsTf5qx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EloLVzZcAGSYIIwv8x0F8vY4NsHF14rJzhXWflHY/c+lUWe7RgywQ8JoJnLUSzU/K52Kvkv39Ov4koMLr5o/pMTGjd7R1TlwpCNMFAVBcQDzLBtltXmOgE8/bVv5/HwkVLunbPiDFMJxuqQfcRVHeCsj5Ghz4K8rjMM08SxuAEtR0F0vKaoG5lpcU5nZgB+klCfwAdHQM5wm70W8xh7OhWG3oT+VqqYmRKSnhVmMkPI4o1e/QEyEfPT2rIb0VZ9nfu0JIin8z8ArY7EoSW7YvTw8ur91wjh4hWS6lR0sIepIrGATxxIwydtwpjKn+WeSj5vnXn51rrwlO9wzov184g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gc1P1ajykeVLtiBC/mK9eVn4MBMUsvNG8tNQ52FLp+g=;
 b=qkiYE1Jrf/wJu6QsyiE2d+QVYY52vXK0yqk6pjnW+tuDcpF9+ioQMESycbNdzClmRhRhwXzOAM/M4BvMJNtPPTVc8begm2m30YMIta6vvRrHRxfxeV4ocNYtv2f4vHkNloKMnnVa7e3cTK9yfZGMqdxnlyCkNLxCOZnt4VE+WWdGJI1jfdDTnuuoNidmItZmVZXCXjJpGSjYRiS/0QVNu4sv+H6IvnNiCfkD765rkuwhHgM9ICgsFIZ3vpY3ijkyhFHOOWLvH0XUBHEIeftDJvlfLYMnbwklQtWH/Ek2xud7T3al/7RoG5ZYTgEQkMD5CdXfYBLJt7vFx4SRiB+Osw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gc1P1ajykeVLtiBC/mK9eVn4MBMUsvNG8tNQ52FLp+g=;
 b=cIsTf5qxh0eGVK7JqmiYQ9Wtb4jviBFC4ujnLpZp4RHe9DIS3IKVkC63UoYMoeLDmp5sYRNkmXhwYp+1epMQrgOSbRE2prkjT4chhZBdNfXImvVKty7HydY64fDvNrE2CYavR+sulXu10z8/GSrKnnObVD6FOwOHWEXIL3SwTz4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB7033.jpnprd01.prod.outlook.com
 (2603:1096:604:139::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.9; Fri, 19 Dec
 2025 00:49:49 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9434.009; Fri, 19 Dec 2025
 00:49:49 +0000
Message-ID: <873457z45u.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: Mark Brown <broonie@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	linux-sound@vger.kernel.org
Subject: Re: About component->card
In-Reply-To: <874ippecif.wl-tiwai@suse.de>
References: <87v7i5esrk.wl-kuninori.morimoto.gx@renesas.com>
	<874ippecif.wl-tiwai@suse.de>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 19 Dec 2025 00:49:49 +0000
X-ClientProxiedBy: TYCP286CA0368.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:79::19) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB7033:EE_
X-MS-Office365-Filtering-Correlation-Id: 82b176df-b288-4db8-acff-08de3e988365
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Z608xqeoE4zI/z4ZwWbSWBiW89OVSEGQxPHoK2ritG3pxQIo5DVJk/BOjn5z?=
 =?us-ascii?Q?R5HW4zvzhjAHKgt4cIiENwaxo8Ks5iBR3IW0P5w+gIJwI9FJdreHcS7lj75s?=
 =?us-ascii?Q?kJ7v0NCsCTnXwyUFyivqeIvRLjiruQ8IjoAvEJ123yQfjv+FvP/TIe+4W+gz?=
 =?us-ascii?Q?TlSrPOFMTWZHcvTz1Lr06Jgz3PiyDKfd5S4Dd3ZP5efNppm6lnBeaon9fh5x?=
 =?us-ascii?Q?4FAODvWxhzzChZg1ZRuEdFz/2ctHXIUSwI8OeqkdVf6sYpWlsrRlAHiOFjmE?=
 =?us-ascii?Q?Q6/Um/nkYlGbWBVZ1jvUohWAuV5olrSaDruyUU6kmDU6mMYqaiM/AR5Y205Q?=
 =?us-ascii?Q?8MLii0R1m2y36ovze+tRoCruPVNrxp2MkXooWidr3RlJ3LejdBiRipHeV+Jm?=
 =?us-ascii?Q?mO4AeoOWZB3xPkNSPekVhKtIHwbafmxNTUwEkHb/MHQfPD9LSmsRx3EKN0Y3?=
 =?us-ascii?Q?NxZcvhz0Rb0V6oXZLIKha6VY+dwKwK4+4pSoOxKCm8HWTRlsR+5mnAy+Vj7I?=
 =?us-ascii?Q?2D6OevcUK2P3VLhB5x0ul3RgKQcDYSnCeA+cSc+y6aj+RFeSnhTpiQ451GAu?=
 =?us-ascii?Q?KbOkhG1R8ZCQzBH6bRlzBroHBCcHNo6Z15fyMPdetfaVYnZi5WNMJawcQjrN?=
 =?us-ascii?Q?DSxV5UvtdSOUtjT1Jty74DUAPIIYQNr32RMii/LZkq2HMDpgCGW7CtDeAbkM?=
 =?us-ascii?Q?GcXC7zhzzieyGZHCZvAzNvF087cxvYFUDijcUq7m0e1okDKx07lx1G8+cJJL?=
 =?us-ascii?Q?cJ3u5sEo/TmDMxZmF0UFDKAZyTiHw+pfE5eTQmMaSVFChjRFt2fGtmgVG+cZ?=
 =?us-ascii?Q?wdE773Wb6AYKa06wD8MgzY7HQZG+yHG1R2BmZnm1p9akibuo7jDKHbG97uw4?=
 =?us-ascii?Q?ukWrpMMc+S2RBdY2t7OT5O9zq5R/jG6KE0Jo2uBHeefy1qrxSlgPik79rsZm?=
 =?us-ascii?Q?XMnEDzx6GYGYbluDjVGUE7a7mT1xvG+TEtN5TjvDK7ljFJqY5twhikALlOnd?=
 =?us-ascii?Q?MlFF4aFIj2Huz9q1p5OngnwmvVrtTUTXMLfInnbLXESLkJEkcj36XHSVnoJk?=
 =?us-ascii?Q?p5I6reA5Ln8YF+j10l5CKE6ipumW+9YrM6k0RA868RxkOBKkXN6xdKJx/FDr?=
 =?us-ascii?Q?LkYQlkoIlfBXP3iOg3swDiFnAL2u5C0cYZh2McjGu7hV1knmO6iqTj28Tugk?=
 =?us-ascii?Q?lfEIsksD7u2ni15npj6cr/us5LcfsEqHmZBMZDI0Dm44jMue7s7ql5B9Sxxh?=
 =?us-ascii?Q?0rg5T8irckQ5/EnGp7CSojUN2QPiDIksGra3o08+2QvGer4B2nBWCuxdJYfu?=
 =?us-ascii?Q?+gCGdSdbiHT1drWHqNfZSoxxSYObnAaGAT7ddiMknMlvqjo/ja2uclujanA0?=
 =?us-ascii?Q?LZCAniyMIIAzrBd9lxQ9TBdz2WmsOPerNF/RGdtTu0n60ha4P7UCCJjleZ5F?=
 =?us-ascii?Q?SKMHcAb/31AwQ3lm06voBi/3wJeWB46YsjlF0b/7feKLBTGg2QyDvhW8dMBn?=
 =?us-ascii?Q?zzN+oijqPoBIrN8eJYIZChfXB/nNnqaWbAh9?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1gFe0H+lHZ29mcLAtw7nHHgcFOSeIV/Dve0wwqqyPl8iePdk8hG3DKtGadYp?=
 =?us-ascii?Q?UjY4XVMprF43CDJ1aK3LWGuv4Nzk7OajNQgyub7FoHbZYt0gDYcfIgwAmjQv?=
 =?us-ascii?Q?TEW1IkAbvxXc6KV0PS18uT0fhBCeZVFo5nhCqngaU/e8H61tO3qTKuv+YaI9?=
 =?us-ascii?Q?N72J88FN15HDRQhAjK0s6HDJAILkGRJM6xHR/mBRJhpwqPks12DM9J81rTW9?=
 =?us-ascii?Q?JIsOYs9GFpIKX4oDoNItYcUwUqN7IrWvDe32lmY77p3Obtu1eNV9OJyUqlgK?=
 =?us-ascii?Q?XOQDZFlff6g983IQIyE4bveDO9lNNZizJNj9AtJLm2w98QNzZlZrAZYeSmBh?=
 =?us-ascii?Q?rKOob30w/+0bmpMWZFJoUGwon8LMXvok2mQgcK7/B2j7Z55eNkSS1RO/l5rp?=
 =?us-ascii?Q?EItOU5mUe9yXJoedov+uJhTOFkyhkGcttS1V8ZCOgeBNwQa9r1XschCmsSUE?=
 =?us-ascii?Q?lGmVTStt6/nXqt91gmromZkv95jqNvjy4y9AiRtIrpB9IUmjkwkAzVz0W1q+?=
 =?us-ascii?Q?IO6SiaR3ANA6Ih+AYNdnrvy/WXiOTMCIt7BEid/YUgxJAorsppctshXsEBC/?=
 =?us-ascii?Q?ahMdiC7AjC1+qeLJJuhFHtWCiXCECTOCvPaz/ZQRzup/4k9dnLHYcnH6j0yU?=
 =?us-ascii?Q?jBrKgfFAI92Q9/TaP9Qi3Jd4L+kh0ju8qIdWgBwYDG/C2OeUKDz5xdqy1da3?=
 =?us-ascii?Q?Fy8Jg+VCTk59ly3d1M6o7c4s7l1MKEBEw0vcEzpGz7HMVIrC03DTgScILscx?=
 =?us-ascii?Q?gcepuiITtZii9jZ/H+OImcmwhkE3XcdLSma5jDZG2Ckmf7AEtcIE02WbnuJ8?=
 =?us-ascii?Q?GcH00009ShpsuuqGAq7Hp035/K03svHHxfvdSoHswlGKJlZC3qov06gnDVtC?=
 =?us-ascii?Q?BdEn9hoKrZQRDCuGFTV5pAEFrYUMOWBeFPcLXrBrmEuZg8LiGrPNPB4i4PQQ?=
 =?us-ascii?Q?TkVytqpnsBB675gfLbqmkB5C2f710WxPoR/YbMT7aHu3upfu/hAGCOtQ1vzT?=
 =?us-ascii?Q?MRfmxYy620fDjOp6Nd9uj3qlZXI8/KR6EGdsImrjjhucrZKMXNebVSrZRNf5?=
 =?us-ascii?Q?BMon8mXErsl2QYOlBllT0Yj3SUCqJ0eHsmFB4Wk5rO4jFQ1yNQKxjTzjIOfw?=
 =?us-ascii?Q?/iTSCf6EA6dgHu9VPwMuIm6axKdY2C3/egC/8v1yt/Hwyqjc1UFRP6xlym5M?=
 =?us-ascii?Q?imKq3CCXsHm7PBt0CBngvO5s9Y3BMQL0KotfaDSOtcsmFUArB99RK1Sk4smx?=
 =?us-ascii?Q?2Hsljor+mUqsyNugw8GGKYneMrERQUf0AYXP+V4K88wscTxRcuIixGnBlS+K?=
 =?us-ascii?Q?ZB0A0WfL3W6sIHXRDOGOWtGI4wwDXGOX6w3Ta4veUQ0HXDKUMviQuXmLnQvi?=
 =?us-ascii?Q?NslNWkBUbRYCFrqoFXBbcpFSkq5Duw6UfHOrxz/1dlJnPfgM11GUTlIwsUwV?=
 =?us-ascii?Q?4UEvczNs10Sg2jb8yOZfFjOo0x9xPTu8fg+h4jIFMf75uEwMPhXe1+CTRnd9?=
 =?us-ascii?Q?tc/cYB3NFjMonytmcKPOvX05ehtHEBOjb3JoIQr2ozD7so3ficF0Ak/zn9Jo?=
 =?us-ascii?Q?AdKVslsPmOZXfzJbk4MNqrG5xdczMVKkQNoY+Ja3ZXr2lGj+BnJG4o+qwmjf?=
 =?us-ascii?Q?FNNJ1boPwscPXqK101xRt6k=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82b176df-b288-4db8-acff-08de3e988365
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 00:49:49.5107
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5CfioNXxC6Y2LAre/duFAioZ5oKrf7SV/Zzd7hX9Rv/76YxZXACHCOgTtWShKAWlL+pZZ/I+bx/WsvvojTZcj2/R7YIrYCYFJ3U0bKDW8aUwJs3CSp24wQC7Z7EUpk2Z
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB7033


Hi Takashi-san, all

Thank you for your feedback

> > 	+-- Basic Board ---------+
> > 	|+--------+      +------+|
> > 	|| CPU ch0| <--> |CodecA||
> > 	||     ch1| <-+  +------+|
> > 	|+--------+   |          |
> > 	+-------------|----------+
> > 	+-- expansion board -----+
> > 	|             |  +------+|
> > 	|             +->|CodecB||
> > 	|                +------+|
> > 	+------------------------+
(snip)
> > 	 +-driver------+
> > 	 |+-component-+|
> > 	+-card0-------------------------+
> > 	|||           || +-driver------+|
> > 	|||           || |+-component-+||
> > 	|||    ch0 dai|<=>|dai        |||
> > 	|||           || |+-----------+||
> > 	|||           || +-------------+|
> > 	+-------------------------------+
> > 	 ||           ||
> > 	+-card1-------------------------+
> > 	|||           || +-driver------+|
> > 	|||           || |+-component-+||
> > 	|||    ch1 dai|<=>|dai        |||
> > 	|||           || |+-----------+||
> > 	|||           || +-------------+|
> > 	+-------------------------------+
> > 	 |+-----------+|
> > 	 +-------------+
(snip)
> Well, managing multiple cards would lead to a complete mess of
> locking, I'm afraid.  And, conceptually the card is the top-level
> abstraction, so it'd be unnatural to go beyond that in the ASoC
> component.
> 
> Of course, we may use multiple cards, but its handling needs really a
> careful manner, so it won't be that trivial, especially if DPCM plays
> a role.

Thank you for your opinion, I don't want to do something without agreement.
Indeed ASoC locking is very complicated. I can agree about your concern.

One question. I can agree about "the card is the top-level abstraction",
but what does "it'd be unnatural to go beyond that in the ASoC component"
mean ?

Indeed there are practical concerns (= complicate locking), but apart from
that, above image itself is not so strange, but am I misunderstanding ?
(= It is one of the gap between "ideals" and "reality" of ASoC ?)

Thank you for your help !!

Best regards
---
Kuninori Morimoto
