Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010023.outbound.protection.outlook.com [52.101.228.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE82F3A7F4B
	for <linux-sound@vger.kernel.org>; Tue, 16 Jun 2026 22:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781650258; cv=fail; b=MPTcZbxh7fcrIEnLR5PfG3of9R1zV1meUV27DRfvqz69d1aHZYr6fJ77eKX4MaLIPDms/IBU2h0Laa+A4Q/BMWxPn0GukjMk6gYL5EXo+JydloK+E35sItzmOKlwdq92SbG5HQS0fftW2Gutb1EZfywVzRaV41OUuU9JCTxEjK4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781650258; c=relaxed/simple;
	bh=HT+ccMkAJEC6CwGf/B5Qa1uBpPFiwZbTlUxxF3Ycvqg=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=jajIeQCHh2rYjlQIoyd3FCwYHQmOBWqXB0kmHNGCukxtp0DXM+4kcReiqJlxErOjKkjz/IWFTTK0TDbux83m8OOYGyLuW5q8aUuwnBa68Xzw6f1A0V9XSrB7WbXdCae18Bu0/95nLjrC4arlRvau8N2xg7D9qqgv5ZgwQybKN94=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=R0UJq8bU; arc=fail smtp.client-ip=52.101.228.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="R0UJq8bU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k6hLSAe9uBeUNIJmUrm5kk5UC27odh5Zl7Pi84ZFMPni5Qwsc1k/kYrIt6kJVpKGaJOVundG4ZoZ5000zEq2WQ4MtHAo5mgxtvX345FnA1i50pA+s+twrEOu6XhypiwtYSxcdUo6X0utYb3e++y1V4X2RO29ROpzLdOUSEIDf/3YyQox61JEvCElcjNPIuzUDeUfTgKV+R2DGU6/9ogaKxKdeQzCzHAXKicP3fTDUAA+OPkwK8LI3Z1KUgT5PLFXwjuZFF/vy+IFwJ9EDlPbSht7+xt6wRLKlbBrXrImYPhEZfF/H8It0QN9fLk5bWrNh0uJWb+CLzTulb/mfd7hBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HT+ccMkAJEC6CwGf/B5Qa1uBpPFiwZbTlUxxF3Ycvqg=;
 b=VyGoUoHJDXdNS68geQJGUto5djqxbAZIezpb9ypXadpuADsucgBHHKkM7zl+xUl68H6YcR3KDc9mBehY9U1quGfr0zFXNOyNLBebgIzWlUwBLD5Z3EE+FSG9TxF8wcMI5Hf8rR2cvRq0mh+71CmrQ8HadLHNwj37GuOVSx8jirgzqK/v5TWUBpSIIrTlIa0JgV2metOMllypHPysT5wdQd34iOxQ9SBUEYpmYTdafB/U5XYIG0N2u1Nnj0MsLZHTNNpDCfStkAwc11JXFks+LF/6cb7kwqCZA37v84iRucNpyT2VP1U4kIEJnM5qt3vBrXwZAvVGQ0C8slDVcelwJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HT+ccMkAJEC6CwGf/B5Qa1uBpPFiwZbTlUxxF3Ycvqg=;
 b=R0UJq8bUoxrzPOupYlm0O4CWK73j1lx1mjHdsMQsVWMhlNLqzUrh4lD9i7DDOeOQglBWU6dLBdIjtd8/9N+zNGf5aA8F8/pp2Nwox213z6iqxUc99BEzUvwD9zYLUEUMmrZYGevNlIXyRp2aug8Dn8Q3WGhZjLjOYFeHTyMHzXs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYWPR01MB11935.jpnprd01.prod.outlook.com (2603:1096:400:403::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 22:50:54 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0139.009; Tue, 16 Jun 2026
 22:50:53 +0000
Message-ID: <87y0ge14ms.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Alvin =?ISO-8859-2?Q?=A9ipraga?= <alvin@pqrs.dk>
Cc: Baojun Xu <baojun.xu@ti.com>,	Geert Uytterhoeven
 <geert+renesas@glider.be>,	Herve Codina <herve.codina@bootlin.com>,
	Jaroslav Kysela <perex@perex.cz>,	Kevin Lu <kevin-lu@ti.com>,	Liam Girdwood
 <lgirdwood@gmail.com>,	linux-sound@vger.kernel.org,	Mark Brown
 <broonie@kernel.org>,	Sen Wang <sen@ti.com>,	Shenghao Ding
 <shenghao-ding@ti.com>,	Support Opensource
 <support.opensource@diasemi.com>,	Takashi Iwai <tiwai@suse.com>,
	=?ISO-8859-1?Q?=22Uwe_Kleine-K=F6nig_=28The_Capable_Hub=29=22?=
 <u.kleine-koenig@baylibre.com>,	Alvin =?ISO-8859-2?Q?=A9ipraga?=
 <alvin.sipraga@analog.com>
Subject: Re: [PATCH v3 9/9] ASoC: audio-graph-card2: recommend to use auto select DAI format
In-Reply-To: <wcwjhkd4czypxcantb3mb7suo2vegpd4p24chi27hduongxjtw@mb3ee6rv24vs>
References: <87v7bs36m0.wl-kuninori.morimoto.gx@renesas.com>
	<87ik7s36k2.wl-kuninori.morimoto.gx@renesas.com>
	<dajhjm3tz6zug7dkdkqeis6bhxd6yxzxzyolmcbqaeer42ewut@czswsgsz5gok>
	<87qzm7mg6s.wl-kuninori.morimoto.gx@renesas.com>
	<wcwjhkd4czypxcantb3mb7suo2vegpd4p24chi27hduongxjtw@mb3ee6rv24vs>
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 16 Jun 2026 22:50:53 +0000
X-ClientProxiedBy: TYCP301CA0077.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7b::19) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYWPR01MB11935:EE_
X-MS-Office365-Filtering-Correlation-Id: ea239b18-001c-47a2-a495-08decbf9b837
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|23010399003|376014|52116014|1800799024|56012099006|4143699003|11063799006|22082099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	j1cvhaW445sEnyYncQ9KkDfHOxB6kjmzkE/i0BmQjo8hmgsTfeppVtQBhOWAiiS5sOZTFv/L1x0pBGbZGIwUXqgi4OZi385SBqev755ocl2Bc1JBMZ/Z3mSQaaQxHjTR5LY+sAYnxSHAZE4We78tlQxtq52SxbttKZKQE4za30l7TnPu8QQGWoCxjxpuhkHAkifdWVzk+b5iWqu6hzOsRi4u06pHFFqwa7Vqb8Ok/iUexvDPmbQKoNdwIf6vxGMVK5TifeETepTBuza7xwfOKQu5R0XMHCINvt4QnoqsJocGjJ/QFOSd+0p08Y+1VZ78+Rwuk7v8br5yB5Q+lYWclneTDYlmOAcbX5swk5OQ4OopUacwT8JIlUU9V/QT4UBmR6tigAiy2FgU8NdQ34Ctdg0Q1ZD6Wr1rGRMNnZ2hbNfw3UKXs3y4tcS4wEY7BwQ9La04w0sZrv2HxSTeA1Gn/0qlcsAw/fcqZyOyOynEv2wAD5kF8CBtvexJCM6IBrC6Y+ryZW0ubesvY1O5Or8ZW+EcJERo2+EWLIszRFHa0SEMvvd1dm/g3fBUHwu6G2Ya5AxKMuPdSNkDYRyg62WV5iiBHaEh2Ce9g8r+qKUV/FlHBnVrbc4LetbqgbEjtLwSzEgKVi+jTuYxvnBDp5wEFWGKa4/az2p42Yd/mSHigYHqtbKyJ6VEVIl191gsqa0h5Y/iTdErcYm3l4eMOdQ51sT+oEaOV7dFHuEFOlNTMkHU78+i9GIH8HeONaab6oyA
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(23010399003)(376014)(52116014)(1800799024)(56012099006)(4143699003)(11063799006)(22082099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JVF9D7G895hjgBVJ9X8r1FjdtcH4ipZQbmpye6oIrk+Eyjs+UKUwr+bmBfoO?=
 =?us-ascii?Q?U78gc2z1J4JCqWlFILM35dDFhFqbfgfI3lLYcoGDnV9bgGcjqq8XJcuEF9mb?=
 =?us-ascii?Q?LZ0SbMQOdXWW0uAja1I7R1TFYRmlFR5Kzd/raNOx1ad664iz4fbITlcrnu5Y?=
 =?us-ascii?Q?zmd05qTIv6T6z0c/S8h2ftABMlve6OCMUp95+m90fVhlINuTkBcFG0sp45Cy?=
 =?us-ascii?Q?TOKJAmaZcv/iS0C6D++sPvKobbFvOUxrbdAOpa8nMn3YAA4Y1LkKeBUb00u5?=
 =?us-ascii?Q?mXJogVmzitbZrbtQjgbOrV7pAwv0SoY4NWLpTGm/K8hEYpneWz1hOG+zXPQz?=
 =?us-ascii?Q?hGmMO5y57h0ry/f6JH3+hfH6o4Q2fAMxFR89mdOFFTVO4YMLfbjkcjDR444w?=
 =?us-ascii?Q?jbLwLROJQT0x3ON20HdkcGSr7QwD4gY5OtJMAlqk37lm+u0W0QXrXcq5kT9q?=
 =?us-ascii?Q?FrgFna4DJIv1i8rs9bI7rTvMBtgwY9bAOvtFvVqjhKm2+BGQK4KNiSs7Wn0z?=
 =?us-ascii?Q?JtOEXspZQd4U2QSxYU2FTBwLvwlI6EqpLp8LVv1lPdusshaHJOa8vX+A0mrN?=
 =?us-ascii?Q?dYseD7KgdaLxNjRI+Ne5npaOUoEe3/v+JUnddnNaWIDYD1XzF681Z4e0rlmc?=
 =?us-ascii?Q?4DRKzd9BdjnOscdQ89udZCq7LXiPrVD+iRrjJVRZceGbz61OeBdFVL128959?=
 =?us-ascii?Q?n4/AOpipYePPOx/cI9lFr/zKXIpsr4W9CzE4X2phbKPkpgEmI4hWrB9yrKIZ?=
 =?us-ascii?Q?OO3xiXihEqafi4Jf3Hm05nzeiYiq3wkhB0hsQi5IWriOIGwdyBN7vVP69nX8?=
 =?us-ascii?Q?4/HPzS5Ois54Lb77KmsXhDe5lDyrc+v/IYaBRJYiLOcKIs4tklNljDfFscnm?=
 =?us-ascii?Q?UM122z3TGcIubWGgQHPActIRVp9Gol5HB74NRIc6Ko4k/mAcGh/KwfwQuKav?=
 =?us-ascii?Q?8Danyh/iUT4P1m2OrkeebsqSwCBFpRL6PkMP4I3OGhOopZuGCAgt/PFkEvBF?=
 =?us-ascii?Q?E/Agz8BrctQw3eO7JpmNQd4WzkjqO8eUxkcaYST7CiE+b7Jv6sRI4mUzgB1G?=
 =?us-ascii?Q?yA/pUJazNO6veJSfcOY0DLKFDVIxlow7C6K4aXsKlsht8yyQ7AN1sSsI7u/Z?=
 =?us-ascii?Q?KU95kQiZ9LIaVVxQq9nxusbYF3Zx135KHH+cam9KTF8cEjeGd2Fk7RfelsjV?=
 =?us-ascii?Q?CBKc07GX9kyB/wrVdAnSgAUg+Je9gw6/iOWYD8Zf0WQvorUqP0ht4ENKQ9PL?=
 =?us-ascii?Q?gebi6t9vdTlRcKiLs4qnJRM6OaJP0se8KIafHS+U2o7ULpD9qhzTONcBXIKB?=
 =?us-ascii?Q?DJwtdP3MglGLEwgXl+q6+qz7bJVUNLw+X/ZlwBFJUUOMCBi+mMZm9knW8Zr2?=
 =?us-ascii?Q?MQz9iGVM6amWo40OH9SaIQcSwihNvScxbsO1v9Nd/n4KAfhhZM0rQEy2nexf?=
 =?us-ascii?Q?fJiFUqiwTFXRDty66E61jPZHCnoMJg+KbopD+OiL0atupynlVQgS+O+Uv2uL?=
 =?us-ascii?Q?QtX0/N/j01RShg4kXyy4Qx+t/yFa4c+V2f6b8TvBo+RE1EanDQ3BWQ+BM0xo?=
 =?us-ascii?Q?P3REWhW+DKv6Poc+qHTY5jOaJRcoM7p/CUV0amQKGmezgxy/gnMCXsQ+7c0G?=
 =?us-ascii?Q?rJK2VsmymM5z9dlcW53OXG+Qwlq9J5KjHmKRpPcX1mbqLhmIjN33BDTzTZJp?=
 =?us-ascii?Q?21+l6+RRwlGfmK6jSKCc0Jl565FePRPVNuJoPun8BT0ufCfxwJKzfKXUbwmT?=
 =?us-ascii?Q?mLGgY2j6ViYNXGHAxda4nwvvCPofeHU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea239b18-001c-47a2-a495-08decbf9b837
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 22:50:53.2696
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cm/pvbAvo7n7im3BMdEl10tsTZqXTroIpLol07HqAIcG/xkNJZ4vi7/AcjUUnA90/yckav16J4UZaR5Mygd4RiQqrH6Ju9E7lzTd5ojug9BjF+jTGEq55niuf3sRXRar
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11935


Hi Alvin

Thank you for your feedback

> My point here is that maybe "best effort" auto select actually makes a
> bad choice, since DAI_FORMAT_I2S with >2 channel might lead to different
> HW implementations on either side of the link.
(snip)
> My point here is that for DPCM, auto format selection seems not to
> work. I hope the example is clear.
(snip)
> It's for this reason that I think the warning is too strict. There are
> "normal" setups where the user cannot avoid setting the DAI format in
> the DT. Something to consider.

Ah, indeed current implementation indicates warning if DT has format settings.
Thank you for pointing it.
Agree to remove it. Can you do it ? or do you want me to do it ?
I think it helps for DPCM user too ?

Thank you for your help !!

Best regards
---
Kuninori Morimoto
