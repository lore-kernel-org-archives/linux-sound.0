Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010021.outbound.protection.outlook.com [52.101.228.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA5731A81C
	for <linux-sound@vger.kernel.org>; Wed,  1 Jul 2026 23:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782947602; cv=fail; b=QMrNC4omnILW23niNwYC99AVSO1NCvFfczWgGpDcu2j6KWtUk/za6AnNOekf1q7aMNnrr1yHIKVW5q+B38x15EdIYo3nKBQmS2Yt6RsVqRFD9wkKQBvV9lstcTUoSM55jTR2RhZqOkWUrNDwNKVdMtG25ntp03A9pZrgNGnQAlk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782947602; c=relaxed/simple;
	bh=ZYHMBGl3pxaBCQ3yXocaQcG8J8smUHSQaTkjaOPKY2Y=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=JEXJXK0hXSNnKrTb5fAvRLsr5IDDTu3SRFhNRny7oSJQXJDno/7D4PnjzxeJKtTPCj+Cgpu6b23I5E3r8uxPQTbTS2GP8MtmtpiXfC6knWnO23YQ67Ng14Ovpf9sSpNeJK0vHO6GGvhHqg75RwEw5OV0CZf6zqs9Ju5uD2ucNiw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=a/XP00i3; arc=fail smtp.client-ip=52.101.228.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="a/XP00i3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CTdjoS4Wd20cQFrMsz4XW2pKDTGyENLJsl4z0qip7C9M4iRqCaYDnrDHiegA5xDDYTCsYf7o3WFnKfJhzzcP1k+LNLCmm7o88U+4F8mjQJrcPIhbT2YH2o70KAbsnGHpAyuthmLnzOHVlV+xYMvxtivctgpvRQneNBOPg1JrtNH7M+7/SyfcxovqbYAswGWD/48PQgLzPdVeF5sxIwei+GxvlBe4ZwnJQKgYNTxVeO/z+/C4Dkx/NzuJ2P6Cdvrhyl6Bxwl7JPOWC0sSuDZ4SGOvh1Gqw65yEey5Jz0mXh2yewuf7rA4HvmJMziYIheiw+R63keP6HoJZaZYdpccYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jw9D5mN80+y9x4Kf6Knj4nMs8cvRUXjqLZEBktpQ2b4=;
 b=aHYnvi4Mv/Jy9MGw71M1VfIQLLIkXYAxh7H9v3FEWXBbICryDpc1SueWNlhp9pkZPFamqLW/F4ULcVn2LUC2syzfV80cZvMJgGd9j0RjOlBmQ33jdiu8hYHzJEpxeT4npmhr0mgwV+JZW4rsINWGRzV0995ACCfDyfoUfGVnk4PmqyzSnEhzRZSm4V+At8E9NGK2UF0Hx9UwugpDE0tw8E9usKp1D4GxKIXGeZe3GmnsUdW8pmQMabYselxMOVKGfPnFFHWgbtNkb7hV5dF54baHjjdv3Q8XFS+K0rMOL3jIEiceR8phCGEklj19BbSCJ2dmtcWrJ3V7vohEYl9MUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jw9D5mN80+y9x4Kf6Knj4nMs8cvRUXjqLZEBktpQ2b4=;
 b=a/XP00i3vauw+I7GKCJ2INTn0VNwhclhsCzWDC/cwGxKkEo5ya7HjGRONnA6NSGh8VU/nkGFZWARrbayyTbe2lI7SFKZw7UVbbFaUkFzFRl5czjccNNREv6V4QnORE+Iuxv6BF570sEeIiwY++mXMcugBzykcNGSB/UTuVe78bg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OSRPR01MB11811.jpnprd01.prod.outlook.com (2603:1096:604:235::9)
 by TYCPR01MB8373.jpnprd01.prod.outlook.com (2603:1096:400:15f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Wed, 1 Jul
 2026 23:13:11 +0000
Received: from OSRPR01MB11811.jpnprd01.prod.outlook.com
 ([fe80::a2c7:5e53:c133:d834]) by OSRPR01MB11811.jpnprd01.prod.outlook.com
 ([fe80::a2c7:5e53:c133:d834%5]) with mapi id 15.21.0181.008; Wed, 1 Jul 2026
 23:13:11 +0000
Message-ID: <87y0fuxq0p.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
	Jaroslav Kysela
	<perex@perex.cz>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Liam Girdwood
	<lgirdwood@gmail.com>,
	<linux-sound@vger.kernel.org>,
	Mark Brown
	<broonie@kernel.org>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Takashi Iwai
	<tiwai@suse.com>
Subject: Re: [PATCH 3/5] ASoC: intel: avs: pcm: use component_name for Component name
In-Reply-To: <8e9229a7-f58c-4f9c-ba26-f4f12d91e279@intel.com>
References: <87fr29esth.wl-kuninori.morimoto.gx@renesas.com>
	<87bjcxessn.wl-kuninori.morimoto.gx@renesas.com>
	<8e9229a7-f58c-4f9c-ba26-f4f12d91e279@intel.com>
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 1 Jul 2026 23:13:11 +0000
X-ClientProxiedBy: TYWP286CA0014.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::20) To OSRPR01MB11811.jpnprd01.prod.outlook.com
 (2603:1096:604:235::9)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSRPR01MB11811:EE_|TYCPR01MB8373:EE_
X-MS-Office365-Filtering-Correlation-Id: a26d1013-0bde-401c-4189-08ded7c65200
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|23010399003|1800799024|366016|38350700014|18002099003|22082099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	OqFmkGuv35Oi+ESTwdulbI83BIIA0of1IGDqYDO+Itv2CathwUJPcnv8n2+RRzdt90P5t4v699l7oog7hT23nM8p/KTfoRTHuqdKwhIfEn47XUkvoyRvQhhsmQoBScBQpuXfTOIKCerE338mTIjirAN/w2OgoveT195HD+VrTK55BmHSI8Cq7GaC20KP6uionZATjyewvwSeHXA5GPdcKbBrA+/viT6673g8BIxUzWoT5DIAUPFpkA8SXh599h2Fv5J0du52enCpcLQGqYpwPyyJZoqWEhiTh1SPoRc85/uUJ2majuarTsu8674aIPghZNkzN/AZu5nJdhDw08JHXl5wIHAuwK67ch2TqXkhHYDWQ6GLNIws4QrrYXgpt3+t18nWhGG4pQ/libIzP21pLp0Ub/zF69igCFlFSsRmEKs1Co3fMcyfZzspI2bvG1l3azVTdZ5MIEnnTW2traBwdBDRQhpN6rsgk+XBJnArIVfpvy5Z/+AnXLPptB6x8jhu5qkxhDaFV2TZvb3MJmcrrSdmZpfRUy8QzOUnLQ2YxXHCvE1hpKHAAtHQCkq1/dEW8y41yK+EU1Uk+FjrAej1dMK8HJRrabokuxTaibC2wBud0wQkamndzu0dFyg5VUYSEYUJvHSH8HXCPn37QXrWWDwCCPhJwWW9IBWFXXnsPAwgdunk2fgdaxjRVwqj44/qJDKURXBZXLCyzmxVC06DCmKMPaZrIptwCtYvKdrHrwo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSRPR01MB11811.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(23010399003)(1800799024)(366016)(38350700014)(18002099003)(22082099003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LiVGdzi9QTsYY8dhNZ1VYSq9qQD5kcwbe2FCG5L5veulXvu5kpex8nYCb4na?=
 =?us-ascii?Q?ES2ODpcodzDSatiy7tAxsLhlDz/AlngU2fGTlmSvzBKePupjyfD4FNl0GOVE?=
 =?us-ascii?Q?WgjgyVepiQuzeFwBFpbV+XHuGBApmYbSuIy81/lY55mNdcnKN7ySaUoynv/+?=
 =?us-ascii?Q?b6edvvuyd6ua1Gla7P/1WdKkNwSgzl6QDg80v3jtftflRIhz24l/3i7wW6+j?=
 =?us-ascii?Q?Xt702/Icn0u/E/Ht8phe8Hmqxtgd7vnbveYtQroFDvbTpPgo5+EPqF9H3kIN?=
 =?us-ascii?Q?5dmaHVrhbltTp65jMUjhjd+IBI8KwLxO1k/1lJBncUin0I5Oq6EjFPr9/2zr?=
 =?us-ascii?Q?W5IhF7FaBQF9lSgySAevNAOurTTnOrdv4VQNQsaMyOliBYxWKcfhOUalJq+k?=
 =?us-ascii?Q?KAjSxaSHLqMpSeiwiZR5jWql+cykj8gZBvGy3S1l99xtsp76EBdBGBfPRr+E?=
 =?us-ascii?Q?8nV7LtRV9cVeByLaqXPjlQOAtuI6vN3NALxgRo0i6CWa/PDWMtlC8teKiZ3T?=
 =?us-ascii?Q?9WYA91Gxn8sXFAE02H/63yUjhuNcT7l1WtFjsnwRs6MvXFhw+jTAUFW+Ze8a?=
 =?us-ascii?Q?hNju56AWujIhW5SRHJ8yEpJ+kfEITSqMF/nlpSm/UHi2xKEiUHw84x4gp5JB?=
 =?us-ascii?Q?0FE3rlySXwwc7ai32BJsLXCfRVgn28qATWL0nBndIMPiVOUG9bZkk8m1IQ8Y?=
 =?us-ascii?Q?oQNKgoBTs82S8wrHo59e2sC8YX6qZjRkpVGAqTYiAurw9T7LNsUyJYZGyzgI?=
 =?us-ascii?Q?EeCNQncQqNO0Utx6lZTzmaVJyRLZ+cLuHpKzes3go6buLP7/xxfy1nPm1fq+?=
 =?us-ascii?Q?0aVso3BNjVBM7We0pR+ech/EDmzXEs+LonNzFAauVURL7arBPpZ0TBcngZO+?=
 =?us-ascii?Q?LcZoUTLUUr0ZG2TParJ99n4hyElV9MaOrDgoghQQDmKQk2crqbz158hCM5nz?=
 =?us-ascii?Q?irP2TWJ6OgOhY4VdOpj2h8c0aNh/WVsM73fcmZWFzRp2X9TMdxlYWtdw+IhZ?=
 =?us-ascii?Q?pCQZr0BJhKhPcgi0f9LE0HPVYPJ/BYyiNdDgU4cTwe1SjU617U2BAizvJn6L?=
 =?us-ascii?Q?ko28HURZnoPkmdBbbXEG9mDnWHcyVeoNqkLYC9sUzUCsGwLjCllheglOSFKT?=
 =?us-ascii?Q?OHYqtUfeUTLeJINfw8JD4A6jQXbNTFLlI8wb3syK2g2OIBDnv5Xq+pC1D0oQ?=
 =?us-ascii?Q?g1Yd8z7rLbD3g1O3no35yrysdsOg4O5lnM2q1GMd2wlrCULxqdf1lXjXMtrt?=
 =?us-ascii?Q?Wa+BRgreLEZX3I5nQxkwhUJYZGx2by9gAAhWMYa+W/burzUO5qB9kIjdfvoy?=
 =?us-ascii?Q?H8C+5Fmm925Gn1Ea/jJirN6fsY628fmsymP45baSpOjJwEUhmryNi3EKE4Cq?=
 =?us-ascii?Q?J/3LWPVOMONLr6lcKKHgNGSE8yxqTSB0WaVu9U5W7SxYxfJJK2OstYPUBzvf?=
 =?us-ascii?Q?MUduZrNahrNKeST0ZD0TAYlAQzblZIVKMHSF82KobJdulVRQwpIHCXFZUKt1?=
 =?us-ascii?Q?oPdblxAHwViitu1/a8r960gbGqOYupIturkCDG/rRTb+PVoXpmXUVU6JUhgs?=
 =?us-ascii?Q?GP/VB+6EUX1NiXefHcheYNJKveNAfcq65/jOaT+0Lyq+g2DfbV6hfHsm7QnY?=
 =?us-ascii?Q?peNiP1gDBx3psbfqLS3Tx2+tHqIPlurgp7LS6ux5XDwKIc5VJLEPLuUBMoKM?=
 =?us-ascii?Q?l6nEjPCKSZGVN8PwNuKvk2Rl33ZebD2JYtPM9aqLCMQLxGuBO5V/i26tkUfW?=
 =?us-ascii?Q?bBZf8kpbNtlxKYkwVJrhQ5Rl1+AmoYC/WJtA4FZkIjUMdyvWI/As?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a26d1013-0bde-401c-4189-08ded7c65200
X-MS-Exchange-CrossTenant-AuthSource: OSRPR01MB11811.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 23:13:11.3923
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1TH2R9LjeR3ZOgjQ0j3PsGwuBLzLDYwya7IIe4TXq1pzZTC32nxCM7iuFuKO28LeAeNs6NQHSCgB56F5z3c1gmYrfu/EOJqZwaIlm05buJOYejPs7dX1n6C5qcv08lom
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8373


Hi Cezary

> Unfortunately, things are not that easy.  You're modifying member of a 
> staticly-declared component driver.
> That's a no.
> 
> After taking look at it again, I'm even further away from agreeing to 
> the idea:
> 
> - components should be populated dynamically as their description may or 
> may not differ between instances
> - component-drivers can be left static as they describe behavior and the 
> behavior operates on (component) pointers
> 
> With the proposed changes, instead of assigning memory for the driver 
> once (for avs, once per interface type), we are going to do that each 
> and every time new component pops up?  1:1 relation between components 
> and component-drivers heralds bad design.  Plus a waste of memory.

Yes, actually it is one of my concern.
So, maybe remove name from driver, but add it as parameter on register() ?
like this

	ret = snd_soc_register_component(..., driver, ..., "myname");

The driver which needs own component name is not so many, it is easy to
adjust to it.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
