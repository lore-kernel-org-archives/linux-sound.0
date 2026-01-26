Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010031.outbound.protection.outlook.com [52.101.229.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5466F279917
	for <linux-sound@vger.kernel.org>; Mon, 26 Jan 2026 06:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769409717; cv=fail; b=oRhk3tu5I8wPTAZKfKbkvvrgktxojlNyN/ZR9Lgw/1ZTARIim52hr59crIFfdlKV9MjyCc8DIDpJ9tOrhZ5AbEYS2yM4mfbKrvpn2NamxoXJDeYlqTbmONv/Ug+gKaOGt08y67j7P6f/NMelcc53UyugC2UXVq9viUZ9q/qAruk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769409717; c=relaxed/simple;
	bh=VxCT8JN0aATBKrlaoti+jSBnfJZDId3FYInAd0F5Ejc=;
	h=Message-ID:From:To:Cc:Subject:Content-Type:Date:MIME-Version; b=fdO/HX1/yQBbQfPBWwRoROHUkwZi+np4d6oh/6hTPHc4cXKYodOoDL4/s2RhuMLs69+smWPpISWsqjuWa38CTMyEIlCwUhC4IOV13W5+SYM59jWtJrqHGWmeZh5GYCALQL0VETGS8sRbA25diRroCTYcnsfW/ABLbncLOPDsXBM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=DuOKZMwY; arc=fail smtp.client-ip=52.101.229.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="DuOKZMwY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KkPgv9gEmmTYEXqlOGyzkei3U/LKueYPrMnbyP/B9LI4OTIH+OZi6pSU/3alqfghxcfltyNGXz5LlbSvYnvo0naTCiMg+iZSXoHred7Wq8K+n6OTxcVsStSTuL8Z+EJKpFQQaMzHsyGi25+AASF5jF0eI8P4nW+lD0rM5x7yJXjblog2LnR5EpOfzrpGIYptA6WGzT58Mm93Pf+Yaad6StmFms98Zrhiighn81IW4pFZid9lQ0tjvJIgZ2xpFnpGdGuZQLOSb9FqirSyUxTtKQ+Y6uVwFw43XVtOZay//v8bZ8LGlqhUZAmVIsZYjnyJfHRhXBGOnE18uDG44usR2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6ElVXLOHoDBREYDIPY/XaeXpeUpFB5BCY7/Qsw4MEQY=;
 b=iZ60t0CVAsErQdeKtVGSe5ccLbdJXFAMqWrIpoCAufUBs/AtrBV5dDnq4Sz1xWtmlWKyVxnDz+biQNzqi9BILM/E97lZ0oL4L3uf9OIVZVed8iVa5nDSthhEAPiDB6TLerIs4QV2xhULA4B3zpqk8lLqnEBCD0yGUTFY7U5inIFoNfOU2RijdiMcJSoC5G7LaxwB5Sg8OgK36ppvqK4By0aOl6mqoyXXKLNsxPxWmf6lGpys2TMtwXTVJ6b+aVSa6ANiVzKDWup/FemTzkjD0lcKjfDXxRWEKXzlWwukQasot4wNAZtLWSJiv+lLE805y7nRW4falH1AMW4bw/XTSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ElVXLOHoDBREYDIPY/XaeXpeUpFB5BCY7/Qsw4MEQY=;
 b=DuOKZMwYydXOopfErMZQcJwuJjwNaZhhPZgtgP8pzZnTc7WM9RUAtwboHvz6mgUPB9ks5HxQil9FlnJY98mkirrK/EK16j2np6MilAZcWoeXdQSz8+qukcPb84q0gAzHhDokpn5nPkAW3S6XnyFz/KF6mu4wBsfzlrcq7TUDxpE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB13067.jpnprd01.prod.outlook.com (2603:1096:405:1bf::6)
 by TY3PR01MB10387.jpnprd01.prod.outlook.com (2603:1096:400:253::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Mon, 26 Jan
 2026 06:41:51 +0000
Received: from TYYPR01MB13067.jpnprd01.prod.outlook.com
 ([fe80::dac1:6ae:15b:67ee]) by TYYPR01MB13067.jpnprd01.prod.outlook.com
 ([fe80::dac1:6ae:15b:67ee%4]) with mapi id 15.20.9542.010; Mon, 26 Jan 2026
 06:41:50 +0000
Message-ID: <87pl6wub81.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <linux-sound@vger.kernel.org>,
	Lars-Peter <lars@metafoo.de>
Subject: ASoC: soc-pcm2.c ?
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 26 Jan 2026 06:41:50 +0000
X-ClientProxiedBy: TY4PR01CA0038.jpnprd01.prod.outlook.com
 (2603:1096:405:2bd::11) To TYYPR01MB13067.jpnprd01.prod.outlook.com
 (2603:1096:405:1bf::6)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB13067:EE_|TY3PR01MB10387:EE_
X-MS-Office365-Filtering-Correlation-Id: 24706954-75d2-49bf-9d50-08de5ca5fc68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?37pudCau9P5tuqXnA18iV5w+oafmCGCd28h4C0rL74GT/IyF7zfII90Rm3pN?=
 =?us-ascii?Q?PnHr9UyVVm8Wfv1OC7bgn8YbOw8fKZZ6T/k6y4BNanhBgJYNXmaYT31Tkqi6?=
 =?us-ascii?Q?rekZDbtX+AbDWMUyTB/iF/wC7xfuqiOmhTv2A1Ivhu0wXntO88LsPpbg1XK6?=
 =?us-ascii?Q?eTH/4KR1yMPz5uFbhSYkzfb906varVETLXAfHymMcJwJ0oqaMuRC/CAI+hZK?=
 =?us-ascii?Q?CaStNYzqpbGhsOtYWIKIE5FmIcVnh0pOilD7p/yo0s3A/qRmYlac7ZAUBUhM?=
 =?us-ascii?Q?TqrIaXXoEq1dgYDahPa+42bhJ6fNmKVEEuhEWy6U5cPQDKg4sfTN+xTSpCDH?=
 =?us-ascii?Q?s5LstparRg+jGm0fQxTFonX25PzqLj1nOGdi6Whi8OcSYqUdusTlTHIaz8Qo?=
 =?us-ascii?Q?FLxCGb3A3mCc09c762frDhoWGnGIQsDoSc6LAFUMoZik4e/BlsI3FuKB5iSh?=
 =?us-ascii?Q?gY9YVKm7QqnUptn/KEqfbLelxyy5yySumsVk+73mfxWjparWCBuOYoSBXFjV?=
 =?us-ascii?Q?1GOe9cOG2WFTcR49cwFyzANpMjQs69gE+akm7K/o8+xDc9rnlTpvXXUdIcgO?=
 =?us-ascii?Q?iGpcILBGYqIYzWf/1T97su7DpYzvy82bYyvx1O8Ivawrv4f8IYhdVYBg2JQu?=
 =?us-ascii?Q?o8iAy3+psC0kHXoBTqwAyKWU16fe1hePwMh9q9f+fKGt60k2X9yW6/mBIE8p?=
 =?us-ascii?Q?2dIQQYyw58c0UT0jUtGYOD9yHy4j1XTivcLjCp+4Bd22CTeHBBT8DVdbBHCx?=
 =?us-ascii?Q?rFIqbu2Q1AAbLp56TYq989D8bXpitvj8s9DJSurAM40IHi2vhpWTKbX4VG9b?=
 =?us-ascii?Q?g1AS1TGf9Ri3rhQeLUB8+N7soPlEaLLw9sVc8Pb3QdPzTWTgiGuBJOhGl5Ij?=
 =?us-ascii?Q?biOuq1U6C7Rnm3YRm3wxtPk2LbiJ/TqpAZJEf4QxEHfAN05Zjr7yashw1vg/?=
 =?us-ascii?Q?fX3zAlppMCNwZSlFwxLTryx25x7sUhlI47YxAIYlFDAVy6pv2B34pa6ZY2GJ?=
 =?us-ascii?Q?Krf5YEZguUET+wP4mj20kJ24+P+aZaOmTMW1YSg8b4jUOj4TvHtVba5Q/1zg?=
 =?us-ascii?Q?C5Ca8L+e2tRPMJF2rEKtmvNCfcb0BUgnQlyO8kv+WcKRw1HITUVJwR7wXyeH?=
 =?us-ascii?Q?XLom/8LKr+7mh/z7KT9HKcLQHRTuosWxi3ExOxYLPx25FYnQfXvU2dBDdo7L?=
 =?us-ascii?Q?ebUiUu9Ua5L3qGBx+Eb5I4VJ3N+zCm5JYEY28IFgYL0Z9qaU8lpzXS+2Rw7T?=
 =?us-ascii?Q?pFdWo2/q5cGjzK2CBnuuHAmPN1hlvvDmkLI+OMeKjAPx1xFCKadr2UaSicNL?=
 =?us-ascii?Q?0ZeHOVIeUS7uZchZbTl/qN1ak2k4Ca0cUWSeZvkKRPBS9qRYxrMW8Piwgv0C?=
 =?us-ascii?Q?bNFFCJsuAgGKlIVjsGAQ/1HciAUsGR38B8cox7QI8/ZdPGSRPmGMMX2PAd+J?=
 =?us-ascii?Q?0AA1hiVdYSuvDMKpHKmI/XHp5qrfWfbymStEWXP2THCaxTPvWWZqvsiJZE8u?=
 =?us-ascii?Q?9OfZv50UgyohL5xDNm8xRmizeUmh+I5iTI/iSssRV2cRzhjaBkcUOaoLt7i+?=
 =?us-ascii?Q?zf05FmR6PlWHV064HPIVvbJL7omRS4k4nPo5523KpRMeTuZs4uCrp3QxrpNL?=
 =?us-ascii?Q?SoTnWXCkrw0bxrKwvyTp5hY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB13067.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VaATKYfbBXBxy8NkZu7GZh6LlD1QnRfC8eoVebJMrZD+aF3f0NWGsTwcUCQF?=
 =?us-ascii?Q?+cjvtYdqbc3WlauBMRiJmFLfTmltS4pAr11VgFhqMvzKS0/0qxnu31c7LHCO?=
 =?us-ascii?Q?JEjIquDzdZy4TnPDOjxSJD/g8ghj4zhuVv9kGR+eYxbP5ioluAMVocoMrIKo?=
 =?us-ascii?Q?6LC7xpGlQxv8UuUNxKd31sea38Tj8cod+b2ZXwk4OMqVqdEyXDFmAoJJ5zPe?=
 =?us-ascii?Q?Wob6vO4khnvu73qeCq32xJDQ4faivHl1H19/QusVKpyS7tZAZaF6yDfF4Icq?=
 =?us-ascii?Q?OJ5DeLLpEhsZyOQK4v5CMg8ssLMLC9kyYiG4C6hKjUH8HiI+9iaMi0TL9qVM?=
 =?us-ascii?Q?IWUwKoON+p7dD7WBUOqWWTTJaNKsKtD7WpjoSolrMl+3PwRqmCW6xPBA0ysB?=
 =?us-ascii?Q?ho+UxCBOy0ob4zVfF9MWOEcFtggkfvGNctgMRCPYrfgiXLVX+GW5dKWcQzMg?=
 =?us-ascii?Q?PaKuYZ3+jeCy7j6cDINL4pxsAIfKSjWNJEUSuw1ziPf+vDS2h4G0Vb4U77O+?=
 =?us-ascii?Q?/CwrY/AB6H6Cq0cg9d+6YAC/1GVlqnz6MLvDRO7h+R7DEMhEi/5KF9tGPWz5?=
 =?us-ascii?Q?bOzrYi48Ng5dm3lq3zI0rcpg8g42a9tCjyR0hwKU24CfFBzO1Qd0kj+M5mvO?=
 =?us-ascii?Q?cxtl/+0NPlvCSxqGUcRlxzF72ccoq3G8MN3gn4DF7qhnLu6Rz5Ad0YOLcKaJ?=
 =?us-ascii?Q?OxH5O8FlamHH5xkwBFCN2V2FTLrD5apU1ObfO1SbdIOap89L6KRYmXH4UR/8?=
 =?us-ascii?Q?XwQlVcs5Q28dRrcc3QI+/svU3j5xy3/Spax2WymD0Nvi37gwODJQugxJwMNK?=
 =?us-ascii?Q?XZ+eA3IV7VoHzpSBMzJ/2tu4S9DBWM4jMEBz2dhFDzlo9fvnwUzQanAoad6a?=
 =?us-ascii?Q?zczN+ESfM3YvyvlIuU0QY7uj+zDae52cCjqKOekaemfsshk/DN50pYoS9XI9?=
 =?us-ascii?Q?FoWi5zYS6x0TMf/bl38AoUG68SqobF2CBCZIaaxZCnXjL+AiRkWag8GFZKu/?=
 =?us-ascii?Q?WicGMhL+LMU6DlisJ8Y75ddkZFHnrhJ+sas4tjFTJslsfunwOdYTjZvHx2kP?=
 =?us-ascii?Q?iC4MRl2MPeuSUIs6RK8DV0r9Wyan1xh3t4WJCcxiqbILjgv58PC0e+6mN7wH?=
 =?us-ascii?Q?uAfz82EPp1rlXu2ydSRISjRViBCcxpmG4qQ6W202C6Cse4ZWqjhbOWp6lXPT?=
 =?us-ascii?Q?UAgfqEHS617Hp0ncmRP2XsJLsu4L7ru/oH3sjZbe0nTy27c5jicbkuWwpgWd?=
 =?us-ascii?Q?IbQZXUBhsSk00kXlhJHFvgJL8LQa81n7fx5/B6NF0GRFdEFbu6mKPyxnjOzI?=
 =?us-ascii?Q?22An7r0eW+tzZ73th7wgevHu6fmZMnK2B5g8BjFRKvgAalkB9dt5L2TvsaFb?=
 =?us-ascii?Q?t7uFnPmuK774w1zreZPzuPO9FoUDOymF+gsivXbCmUxqL6BhNnC2vLbV0VlL?=
 =?us-ascii?Q?IAm6ks7zP0kRfZG1AsyKBu+5rrJEh4iAcZ0BNoIN70ys5ernieZwbMxqT7/M?=
 =?us-ascii?Q?TyUPxIRhjZHyvUi/5EYAAfUim9PdPcb3B6Y7eH2aU/NPu7lDlFrkV4RIxjJh?=
 =?us-ascii?Q?Y9OlDd6ZHgMeEnIgeQ7hrrLW1aMaMZg9jX51vKw3sTd2618QsatpSmYoxdMH?=
 =?us-ascii?Q?QbSuq0qOH6ahe6kHLEWazHD+WQzNcLRlyvusthJhIBdp4Wy+ydKs+evhufH0?=
 =?us-ascii?Q?sCPjkehmiQc4drvHA+6zoRzBqeBg22jUNRxbyRNILYNNgGHkqJ628j9bSJbF?=
 =?us-ascii?Q?uOzTMp+DhsZuaKID7CDKD2RkMZwTBwoQ2ua1wOiTWquvJN29pb3o?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24706954-75d2-49bf-9d50-08de5ca5fc68
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB13067.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 06:41:50.8581
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iWwDmJNJ7p7TGs6dxrTaPh0/WpahRN27zM91fdZ54832MZ6WhO7yuFpM0XhOKH3Fsxy5MAU/y8zgQ9rtvAdcVeMhvq6AOXPjlxGcQogOYY3iSukzasqkYbFxlBQNb1n7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10387


Hi ASoC ML

I have been cleanuping ASoC framework.
I have started it after seeing Lars-Peter's presentation at ELC-E (almost
15 years ago ?). It was for updating ASoC framework.
I have very agrred his idea, but I worried that it will be very difficult.
Because in my opinion, controlling complex HW by complex SW is inpossible,
and ASoC framwork was very complex. So I started to cleanup framework to
help him.

I want to keep cleanuping, but one of the file which I can't cleanup is
soc-pcm.c, especially around DPCM. I know how to use it, but I still can't
undersand how it is working. I have talked it with Mark at OSS-Japan last
year, and he had same/similar opinion.

For me, current DPCM looks like forcefully expanded functionality.
I think support modern Sound HW on current DPCM is not impossible, but
unique implementation is required on each vendor driver side.

I think keeping cleanup/update current soc-pcm.c, and makes it more modern
style is impossible or very difficult, and/or it may become irreversible code
in worst case.

So may I suggest to create new soc-pcm2.c, like below ?

(A)	  soc-pcm.c
(B)	+ soc-pcm2.c
	  ...
	  audio-graph-card2.c
(C)	+ audio-graph-card3.c

All existing drivers uses existing soc-pcm.c (A). Nothing changed.
And create new soc-pcm2.c (B) and new card driver, for example
audio-graph-card3.c (C).
audio-graph-card3 (C) user only can access to soc-pcm2 (B).

In this case, existing user will get zero damage from new soc-pcm2.c (B).
We can just remove (B) and (C) file in worst case, it is easy to rollback.
But what do you think ?

In my understanding, current DPCM searches path and power via DAPM in
runtime. Because of it, the code become very complex. We would like to have
more simple style in soc-pcm2.

OTOH, we need to call amixer to use Codec, like this

	> amixer set "Mixin PGA" on
	> amixer set "Mixin PGA" 50%
	> amixer set "ADC" on
	> amixer set "ADC" 80%
	> amixer set "Aux" on
	> amixer set "Aux" 80%
	> amixer set "Mixin Left Aux Left" on
	> amixer set "Mixin Right Aux Right" on
	> amixer set "Mic 1" on
	> amixer set "Mic 1" 80%
	> amixer set "Mixin Left Mic 1" on
	> amixer set "Mixin Right Mic 1" on

This means, user need to understand Codec circuit and/or board schematic.
Even if the path setting was correct, we can't get basinc sound without
each volume settings, because default value is zero settings. We need to
setup both "path" and "volumes" to use Codec.

But it is not realistic premise IMO. I don't think *all* user understand
it by themself. I think user don't need to care detail of HW. It should be
handled by Kernel (= Kernel developer), not user, at least basic path and
volume settings.
At least, default path and default volume should be set by default without
any settings from user, I think.

So I want to reduce amixer use case as much as possible somehow.
Not zero, but volume control or some kind of feature
(= for example "noise cancel") ON/OFF only, etc.


I'm now thinking for soc-pcm2 is that we can use "graph" and "routing" ?
Here "graph" means, physical HW connections, like below

	+---- CPU ----------+    +----- Codec -------+
	|                   |    |                   |
    -->	| [A]--+-[C]-+--[D] | -- | [a]--+-[b]-+--[c] | ->
    -->	| [B]-/             |    |             \-[d] | ->
	+-------------------+    +-------------------+

This is very simple graph image.
[C] is Mixer
[b] is selector
Others are some kind of features.

And "routing" is for example

	1: [A]-[C]-[D]-[a]-[b]-[c]
	2: [A]-[C]-[D]-[a]-[b]-[d]
	3: [B]-[C]-[D]-[a]-[b]-[c]
	4: [B]-[C]-[D]-[a]-[b]-[d]

In Codec, each [x] connections are handled by DAPM, in my understanding,
but we don't have such code for CPU side today.
I think DAPM is for "Power Management", but is same as "routing".
I think we can expand it or create similar system for CPU too ?

Anyway, both "graph" and "routing" are fixed, not changed after boot.
No need to search path in runtime in this idea. So no need to call amixer
(for path setting. It wil be setup from inside kernel, etc).
Above "graph" is good match to modern Sound HW ?

In this case, device number = path, like this

	> aplay -D hw:0,1 // path 1:
	> aplay -D hw:0,2 // path 2:
	...

It will just fail if some path can't work in the same time,
for example above 1 vs 2.
Good point is that no runtime search is needed (= can be simple code),
Bad point is that number of "routing" can be explosion, but it is very
rare cases ?


Sound HW/system is very complex, and ASoC allows .trigger and .hw_param
etc in the same time. So we need to have many locks (for each modules, for
routing, etc). Because of this, current ASoC has tons of locks, and need
complex lockdep ?

I know this is not so good idea, but how about to have only one lock, like
"graph lock" ? This is just opinion, but having one large lock is not so
good idea, but better than very complex and un-controllable code.
I don't think .trigger and .hw_param are called frequently in the same time...
Yes, maybe realtime side can be problem though...

I think we can use existing Codec driver as-is in soc-pcm2, but, CPU driver
needs to be re-maked (?), especially DPCM user. But not sure...

If I create soc-pcm2.c, I will create sample CPU driver and its sample DTSI
file, like ${LINUX}/sound/sbboc/generic/audio-graph-card2-custom-sample1.dtsi.
People can easily try/test it by just including it in your DTSI file.
No HW / no implementation is needed for testing. And I think it can be good
sample code to create new CPU driver ?

I have indicated many random topics, but these are just my idea.
My motivation is I want to cleanup ASoC framework, but can't on soc-pcm,
especially around DPCM. There is no guarantee I can create soc-pcm2, but
have interesting. But what do you think ?

Thank you for your help !!

Best regards
---
Kuninori Morimoto
