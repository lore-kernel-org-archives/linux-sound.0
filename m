Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010006.outbound.protection.outlook.com [52.101.228.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C0EB382
	for <linux-sound@vger.kernel.org>; Tue, 10 Dec 2024 00:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733789169; cv=fail; b=NVLf0lUixeKhmZ+DzbMFYlEVQOfJmzO8G/tfz1gVRlZM7fiYzX3hH31bdMptWg8/2jVsFVyDVDWClfLgGnGbUTiE02ZCEgFvajbORl0iIZmZrSAL3xjabhOYPkvRnyRhNqAgxRPRDAdxmYGsjRCkdCsaa0shAdmbUznDiF4u3d0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733789169; c=relaxed/simple;
	bh=Deu2Y7hztrglggMyKEKXHzpCWJG1D/iMVbZnt44HBVw=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=KDX0CDHxciWApzkyrLzWGPNm1rarKUkMrqxKaYDlInBSq7yopxM1GR099z3b28tMEu85MUv1dXZ8WQ9DW+/HGXEJbWE55JiCWolfeTGeRstOhaijHgyaYpkjYQAbd1dqBJ55EB7xEBCKhcERT1CGEm7S2pXJ2tJ7OassDEOil/A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=c2XIhJf8; arc=fail smtp.client-ip=52.101.228.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="c2XIhJf8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P1OaRwKBA1llArxgHcITKVEJS6mcmrmLpsRw5grR/f4JvZd3U7nPxfM1K9xEhENTT39e7lnG91Ttondgr8DY6E/D8Yb3lcBJyXjONLNgaU1hYi4Cg6NIF1KL9bO5aaHmCmcZbM7vQ+YFkv08htzPdrrv+lGzFcfrx6O7tl0vLL2wqaBxslphN3oyCWq7RL1LrhHDJcvpexUiNw7YElCkTWuPJbGgQWCxLTrTFO/h7bVI9gsVY7k+4qx46KbyzgOSan99+Qbed04AWgvmSSnKH6eg8Nhk6s+BidskC6I5LsNaGx7CJZG1fM/F0Q/fqGNWxCnfwl6NRL9xG2yC01rkqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5WSiXxnJPu2oDt7+kzeGr4UV9SbBxJbqbD+9r3ioaIg=;
 b=cjPIEnPkN7Q+6gpzn9D22ctEIalp9SiSPDgDrj8DhyYSz5Mce14BiYRuPSZdOSW9wvFUjAEVqAfdUqoB17N8iYqGD1KQ8JDOJ6Rr+BsOXq9Ev7JPwAphgI7F/5wZzUSciTVQN5PTbOa5dANpx5QgWj8zlmcWtmRIqfb6LG897j67EF65fXIYLpWeKt/F975KBWesrSeL12Pj/wLdQf7lFMYQdRWcXN94SSuT0/n9t7rtZsQdWeYMoFKI+i/6BjOJWlMxCFO3lrC33OhzTdeXmhZx7mjINJoh/0pDqIc4x+swtss2epYpHD26qxqHrEl5mSSvIGN92huyFerhIMtgcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5WSiXxnJPu2oDt7+kzeGr4UV9SbBxJbqbD+9r3ioaIg=;
 b=c2XIhJf8BV+xU80nO4sF58/fTB8Eaa4ndMJudALKfP8FoXBPhiSTDWUImDjM67FhWMFJIsi6Y8R46r+UBZ6wSDomlku1eDqaHs4eU6CkVGle+UPj9hE+fR1c6e93Yyyj3pdC7Yq9wbaK0nnCoKCWnRsYp90Zd6y38dM8bkdFC2s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB7131.jpnprd01.prod.outlook.com
 (2603:1096:604:11b::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Tue, 10 Dec
 2024 00:06:01 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8230.016; Tue, 10 Dec 2024
 00:06:01 +0000
Message-ID: <87seqwjtav.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: =?ISO-8859-1?Q?=22Nuno_S=E1=22?= <nuno.sa@analog.com>,
	=?ISO-8859-1?Q?=22Uwe_Kleine-K=F6nig=22?= <u.kleine-koenig@baylibre.com>,
	Daniel Mack <daniel@zonque.org>,	David Rhodes <david.rhodes@cirrus.com>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,	Jaroslav Kysela
 <perex@perex.cz>,	Lars-Peter Clausen <lars@metafoo.de>,	Liam Girdwood
 <lgirdwood@gmail.com>,	Luca Ceresoli <luca.ceresoli@bootlin.com>,	Mark
 Brown <broonie@kernel.org>,	Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,	Robert Jarzmik
 <robert.jarzmik@free.fr>,	"Takashi\ Iwai"
 <tiwai@suse.com>,<alsa-devel@alsa-project.org>,
 <linux-rpi-kernel@lists.infradead.org>,<linux-sound@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>
Subject: Re: [PATCH 00/17] ASoC: remove snd_soc_dai_set_tristate()
In-Reply-To: <Z1a99HJuL04nWuqx@opensource.cirrus.com>
References: <87wmg9mhkk.wl-kuninori.morimoto.gx@renesas.com>
	<Z1a99HJuL04nWuqx@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 10 Dec 2024 00:06:00 +0000
X-ClientProxiedBy: TY2PR04CA0011.apcprd04.prod.outlook.com
 (2603:1096:404:f6::23) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB7131:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b8b2046-7a68-4010-39d8-08dd18ae6e3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|52116014|376014|38350700014|41080700001;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?chbEEaC08PgnxOrGtssGQypvdu0hXFfH/0fGUQLrR3W9kFxRbeiUykV9jj4h?=
 =?us-ascii?Q?zhHow6ChmoSaYDAfwMV5bvMY5RX5a5FNrlcSqYOwrF30HBoTkLwa51kH6sJ3?=
 =?us-ascii?Q?4QsD+DtpfNtoahmTt7kA6PmC8y13a9qYXaUbxVWuoty3mEXqzOda0Bii2P9r?=
 =?us-ascii?Q?CQGtxhSluACKJL45rMxlpFNg16+So4/u8ZovwY+sagy7ITiae+4D0eyGLiT9?=
 =?us-ascii?Q?gz1kWwDu0DDJd8eLgjEHUV5G5iR1hBN+Xf+Ta7ANYGSIkrnXo5rjJ4e3M9Rb?=
 =?us-ascii?Q?yTUv8zKlCu11vXaC8offuASTZW7/3P5wHLaxH4+gUK3D07KNLfLD4elvIhue?=
 =?us-ascii?Q?/ek6/MPCRFL/l9K3TrXlRME+/V+X0LjW99/kjAW+J3ho9yiLJHyRG8jhkGHF?=
 =?us-ascii?Q?Xzc6pVIeP91yEkKW8e3xoyMsZRJPv16O43byCthm35tJIYUrhU4HZdaONNQ6?=
 =?us-ascii?Q?OyIEq97iLQwXVMHwKe+4XU3G6mkeOPgheMRlRqXzppoobgn3IkwPzLP3M7h/?=
 =?us-ascii?Q?/bzuHE67YJN7WZya+EWD9WFtJiSc7v9K+97b8Tzvf1hoYEqTJgPugsneTjKh?=
 =?us-ascii?Q?WDmKmO4gtbnJiAGo5Q4rSbr5jQbDUglFCwPdRWibNjeXHM1q+KUS4RIjhdAw?=
 =?us-ascii?Q?nxoh6AMcS1ykaaaoEwtFgrAPV8+JzYc35MoUig0GJhzZ54Mfc6gLr3KansK/?=
 =?us-ascii?Q?z/c9PX1tZucNWweS1bxnJmdS/JF092zK8E06wHLwEDZ3/WpHGsRHVYfkJ09a?=
 =?us-ascii?Q?cYECFE2R1n9jx+svA3numlUtcNL94aeeoY4B1LKSJh8LnW7jIO5DdNu2SWwZ?=
 =?us-ascii?Q?9GrWkx8LGN5O6ievdGZmA5dsDC0q/+K61x79PjT/L3fyZWbBOSc49GIxF/XQ?=
 =?us-ascii?Q?sbJtmDuKJccaB9aBKkEhD0NgNineNeRceP3CLgJAlC+3E0hCtudZwoiMNnRJ?=
 =?us-ascii?Q?vTNPgpFNvStZv7Dm483xqTXqc9Y394kMZq/6UK+9kfl7vrPYYPOB+i1B601A?=
 =?us-ascii?Q?xAKpMBEj7BKEm+nSEXTKuqDC/RGMN67bm5fmiHVM13SU/Sy8TFQvseeVZuTN?=
 =?us-ascii?Q?ud7Twzu1Jz7cBgHx9VdBvkFm2JLXZQ8U1uzi8gbzrqWcolu+LsknSmW4oLwE?=
 =?us-ascii?Q?fYQU62mK0zQPapBqBbNUw3iULzN7pGaVZEkcKIPguBJtTW0rflKX0E/h4Ha5?=
 =?us-ascii?Q?z55vd5DRb0OMWFQupD2LzYHrFmM9RD3Lihe+8Ef/Fm/KDJ84SzJ5GvcJ1r1+?=
 =?us-ascii?Q?qZMt6uAedA2kZb4PdEySDQdnuf5VJLOcjvS1Bwucz7AxAkEotzIms0hcWKX9?=
 =?us-ascii?Q?JHlI9oyClAJOWbkiq5PXUnj5K8W42KuvLvuDKHPft6iWUGR24J9y0TJBDjMe?=
 =?us-ascii?Q?qz+PD/QhO/56UKeYLWRpRUk9UQhreyGxgEkFGzyTe9A7+FLXI/UB/OvL54+K?=
 =?us-ascii?Q?FA/jRixmZgI/99vCTtwaPtAdCPAMMJpB?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(52116014)(376014)(38350700014)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?e8K9HUY2esdaAqlVzyoVWoAP8ZQaTKmUtwv+F5C10vjKQ9Gc4iQqy16IvYlw?=
 =?us-ascii?Q?7SHErqG2qQO6VBoPtlh8Ttx435DY508CvsgreqU79IZhSyFjy67p9Lr8p19z?=
 =?us-ascii?Q?mIJIgolnAFfODiM5TZfxArkuj53nqBy+MMq0EsoaCJt9ZdlKKOdr5vLcTOaM?=
 =?us-ascii?Q?tPhQ0HQKbg8eZZ9rEJNm4QZZKCH8FevLIQSDh7RFALsMIIaZGVkGfjfUh0n4?=
 =?us-ascii?Q?z/uVNJspCJdmOK7xjPk/P/BXeOQXwtnZbIB34Sb+jIRWtLRTplR7dm2SpIvE?=
 =?us-ascii?Q?UIY1C1PJED2YK4D8/MI6TQe+QxlEc1U6z3tSH6cw1j5H8ldycjzIJN59Usvr?=
 =?us-ascii?Q?RfEPksRDPHX5WMQuvhdl0m8OR1sn4Dl6dEIYb52OEQKlAJzLl8A4MPMl4mXL?=
 =?us-ascii?Q?QQz5EceZLzNr3OzOq4dwt5WD4SEeCCF2oPb6u0Id0u48ltRIgdNCAg/f3Bzq?=
 =?us-ascii?Q?jP01EUZNk7UNEfEXqgBnk7xGeojBD7x5HNCoSJW/kCYGglTu4pkC3qwj1B4G?=
 =?us-ascii?Q?iqNtXSJTQ9cgul/I6qFY7fTY1XAPI8oM19wFjwl7vLYD7QAB1DWGp4q5Szaj?=
 =?us-ascii?Q?KlYiLVIhRgqmeqmbeZrYL+Uhjn/m71sX7sBxWlrvDjt2B+Du5n+EBNix+U2a?=
 =?us-ascii?Q?Kw3hgMoDuQn9GklCXceXPTsX+j5l090appkRlDjs8jvD4TTG8xcra8aqjcON?=
 =?us-ascii?Q?HebYn0bNMeBhynpLLHyuBm4YGo1AyhF87VYQgqGA4Ycg4s0QTK8GMCN9yPZt?=
 =?us-ascii?Q?/KYcykaRk+viDxt0yidxcWYTRTSpfwiX+hAUnFl+q+I5WYfemdXydX5ypXuE?=
 =?us-ascii?Q?gc3L4XdpE+K//k2ebsi9X7S6q56tmftch8EHWiDsZx8Q54MdC0hHXlAhjM5N?=
 =?us-ascii?Q?0yEqLSP2nlKcMpPzkLuIN2s6FCX9YC1cviB7671wv6FNJowFGUD+tz0dlZhZ?=
 =?us-ascii?Q?4SGSYId6yiYxAS0OCya8Qq9Yh6rw/4qMxqHyqDN+owDSrSMJVYYFBcNrRCG6?=
 =?us-ascii?Q?R0s/fQY36QMeZwi7c+f1bon8o6Yk/N0S9GdI3iHbRGM5tZJdA3xjiDuGU/Ac?=
 =?us-ascii?Q?1veJtLQQwmvPn6Nm8g54iiMRw2nKVDpLi7WriRPnbPo8bPmOTbKEjBHBC6d4?=
 =?us-ascii?Q?dABksDJtL7UMFP2g7dmT7Ymyy0xjfhcypI4PqsfVfmHYZpod31SqyoGUAB9z?=
 =?us-ascii?Q?3S8uAURALHNH64JpeH+9WFVEu1ovFk1BfnlhyYRMBTPqdkh8b57CdepBZn9J?=
 =?us-ascii?Q?CrV5K5UCOoVYJebbw9snMUnkCT8T+43wY5KP0cP9l08bMTK9j3/8I8UuqlwX?=
 =?us-ascii?Q?LdLZEkZflKUih39fIc3V1BmVwIKICMUjBuL9pMacHAJtAjOP2O4KEuVJoP/t?=
 =?us-ascii?Q?Z4Dg5shrQ/AcPc5lz9e44Cs0eyJPAioCTZ5PCEO2224TZoZKzGQfoLTfzsqn?=
 =?us-ascii?Q?kCbpksec/ggl/OmefEfTUA0Z0+BvT3Q9YHiXqdEWRkk+MfRBXivcaaytGjNb?=
 =?us-ascii?Q?b0jdtBZv3ZzmxdkMDwTrPEcboroxBKSgYWLF45RzEUL8U1kxN7UY2tuUNtTR?=
 =?us-ascii?Q?NytOjReEmcmQLIwP9T+jT/peplE3qQyBprw+C5y7xqkM2X45VmpGf6Xi08af?=
 =?us-ascii?Q?QXdvF/LL4IqgxdEMNFyM8PU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b8b2046-7a68-4010-39d8-08dd18ae6e3a
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2024 00:06:01.0636
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7N15fCk0xG9NNUr76iEpkDFpaKoiSc7cMl/UQQm//5ctNCQbW+oZR0lkzQHXYdNwrowQyyHqXPjWqt1EUgWvGJICZCQREgv1WuY3d1xETXBKuJRRn79110y1PXL2TOOO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB7131


Hi Charles

> > snd_soc_dai_set_tristate() has added in v2.6.27 (2008/Oct) by this commit
> > 
> > 	8c6529dbf881303920a415c2d14a500218661949
> > 	("ALSA: asoc: core - add Digital Audio Interface (DAI) control functions.")
> > 
> > But it has never been used during this 16 years.
> > Let's remove it.
> 
> We have definitely used it in out of tree code for some phones in
> our times. Whilst I don't feel super strongly, I would say it seems
> like fairly reasonable functionality and it does no harm, so I
> would vote to keep it.

Ah, out of tree...
OK, I have no strong opinion if there is a user. let's keep it


Thank you for your help !!

Best regards
---
Kuninori Morimoto
