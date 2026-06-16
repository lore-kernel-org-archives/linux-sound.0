Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010007.outbound.protection.outlook.com [52.101.228.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BEC7264614
	for <linux-sound@vger.kernel.org>; Tue, 16 Jun 2026 01:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781573009; cv=fail; b=jrRo7qVH39B5g7C8Dpj3YtQ8QTloZbmgBmTt22rv+Ro/BJel/qc0Tg1IvEQcVgr7pSGUGZ8q6gxI1T3gJR4wmJvoH8SaXW4WLD4EtQddLUioPtn4wdJ4/Aub0B+p8uTckBSC4vu+M6CeH1OlmkhXL2rOkOrxIE+FceSxIyw5glA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781573009; c=relaxed/simple;
	bh=+TZ7BR7DrWeA9Mi2hiAWmd3w7cJTbGjLu1jHp5Whv4M=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=LNGBLBK6gWuyCEMTs4NHPUhjFCiuefgl9qIzvcNiIRYn4BAfGOxsXRbBnlQXcxZKmQFS6ysIZXAJaP18pRKqjONGXecQRc/ZIRGf7NBzLqEZRm+nwAoVO30HwenIdxJkpA6eVp9CYYr/OAOpyZovtLviPzAkyS57aDxzxm3Fg1U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=BNRZ8rYb; arc=fail smtp.client-ip=52.101.228.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="BNRZ8rYb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CRM6fYnsrnzg5RcOuBbRlNvBo+0hOtgso+9yv3GP5Ca1sR8Sq1ZfpaWUfOBom/h/TOTn8FEybx5SkKmTYaTtk0xJTFpPbCNvl+UChwWFFXqu0iNyljLgHH/jNfjZHDZy8IatykovqfBbQsOHZIytzx5tyfj+s+UUV6YC4sMUcwrLJU59yqkh4tsDQpsx+wIKe640CgUb80Gor7J2R7yVz+1nrpmUoylccgtnUr9wIamQOCuikSjrGXboMkeLKDg0ZtqhuT7Fs6LIM6bdUNcXpAyHR7x2y+9pwGUImPU1ciBpnO2Jpt+aURLMWvYzLuHQnIYwa3mxoagNuHgFZ/nUTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+TZ7BR7DrWeA9Mi2hiAWmd3w7cJTbGjLu1jHp5Whv4M=;
 b=MFLlTUongSlb+sJxD08LxZaxp6wHQ79KrcOFTu38PzWtHNVgB8uajXq5yYC8KgUyl0lsNkDUBIUwc1aiLdBtgmPwlWfCidd0bOpfQ2JsGdS9UqJz1rHdtnxeWf8u17rPo6WeAdAcA+srPZglW3YfYXutPfw1z51Xuaeq5LRzNK/fx7PE7I0Aax8O8eWPVIkpLOwfNYbbTDAigpimcMiXwx5RcWA24nkjGxvffXBXIOtVyyRgAmbuzfROhMJeutxJhYWbr3e+NbNZbkuyLR5ov+xGzRNiSnfoszVxyGYhHZ7efAunHgqbpPAuVl8LUucWfs16cgTi/HMMfpZnRxW82Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+TZ7BR7DrWeA9Mi2hiAWmd3w7cJTbGjLu1jHp5Whv4M=;
 b=BNRZ8rYbg0xkL1XZuNCyBagcg6CHGwA7K0zb89v0CnmZddX34yenMw+A4b3MrPsJFkuCAlyo9rgJ3XUQByFHq8QH4aeTKpCRxvNrXYEpMrLuZrcaNf9sGJN9vBf51VamTNYaGOeP0NGSnctrSbbGhPWe0Ah5gQm5PQ4mY73k4NA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OS3PR01MB9978.jpnprd01.prod.outlook.com (2603:1096:604:1e7::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 01:23:24 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 01:23:24 +0000
Message-ID: <87qzm7mg6s.wl-kuninori.morimoto.gx@renesas.com>
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
In-Reply-To: <dajhjm3tz6zug7dkdkqeis6bhxd6yxzxzyolmcbqaeer42ewut@czswsgsz5gok>
References: <87v7bs36m0.wl-kuninori.morimoto.gx@renesas.com>
	<87ik7s36k2.wl-kuninori.morimoto.gx@renesas.com>
	<dajhjm3tz6zug7dkdkqeis6bhxd6yxzxzyolmcbqaeer42ewut@czswsgsz5gok>
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 16 Jun 2026 01:23:23 +0000
X-ClientProxiedBy: TYCPR01CA0111.jpnprd01.prod.outlook.com
 (2603:1096:405:4::27) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OS3PR01MB9978:EE_
X-MS-Office365-Filtering-Correlation-Id: 1684fe88-8215-425b-5725-08decb45dc12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|52116014|23010399003|38350700014|22082099003|18002099003|4143699003|5023799004|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	megD0LOesD4cgoPTGuLga7wOeU/UwEhvkZ+DmnOdgc94DaU8e6S5KPjoh8wHW+0tUlorR8Uh2gct1W/sKQbgCVR9rpZaFlegaBgh0zveMI706sl8XNVO6tDBB7FIgtZbxuwI1pAEHriJ8dk2OGuZHgtsFXa3VEbLCnlc1elD0gFYGRyiuEsqf02uTHM7AFn+e8tNeHWkIUsI3QjjxRy5Aj6O3Y+lBEJ2gOz7U9w5C8iqwf5ikmG3tLjpV5qBb1X0kqXUtAW0UNF87yYApjA5QyRWf/sNPlJ2h2RsiYsoeaQdyzEuKPKh1KfXoIDLLSBRX/h7ro8E8cmt5ak/vb7Ol3238/2+bguh6eeNbin6GfUgsEEBeCJFJzX+NvcIxbKeXFFUeaPBYjY2qQfOVrAy8iw61UqId3u/OhV6x6ocilLpK+K1fd77GfL2z2dM1ZuVajLHR29ocF4onKCK5dMtTKXzbcl5gr18vIbVw/ZwqeS3WEwPPpP6X1TAO+LPYDXamyI9eDDYE8dbbx6rJUshzR74hebLzMaliHNoF42K6Zm9ubTrysIgBP6eJp2e/6may6B3/211zqmEr6vER7njMTtp4CfFkv29szCiiOy7qr2Iplh7924KS2eNRIxnrf0lk3tCAgkeeY6Fw1CSRS/T3llRgHqL9e5P/e+ZwgDmtHXqPCqlXT/LOBsGOu5j3SdVXT7PyN5OP4UeFzkrP6Br/0CBBig2Na8qVT6aqxppJ9gIH1MRR6khy1aDNYzKKPdy
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(52116014)(23010399003)(38350700014)(22082099003)(18002099003)(4143699003)(5023799004)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cyTqfkycQ7ybnz99JDlO0L7RGyCt6btXKHTgGh+XC5o0fumDEquKnkreGH46?=
 =?us-ascii?Q?2bheK6gdd5O8660A0YDBA53D8HnUUWDVY+8ygXOd4UdPQ1doa4Jd+pR52BnV?=
 =?us-ascii?Q?GvvbhFWGkk7cpq8K+VOwzEChfWen+unhhr46bV6vXkas5CKuGN+DL615GO7D?=
 =?us-ascii?Q?oHu0mXh7zt68xUgK4h1Ad15SiCMD7S+mdRt/44q1zs8de0ROEkwSupEI9RAf?=
 =?us-ascii?Q?+GTMmOZ/s7NiQC7cV8DBGbKX2nL0vnSKN1/TtbyqTns/EYIYbTCGIxINsXGs?=
 =?us-ascii?Q?lbp+q70/v7AKakz76rXzaooArmC5iZMDNL2DGM1RU+6d5M8SivgAF69GS4tJ?=
 =?us-ascii?Q?+h2KcYQhB5bGRr7m5mJMv3ijBGlyFDtcaMlAWjoKwvZ8NNSkxiCBXQgu1yr4?=
 =?us-ascii?Q?s9cBuA8eNRGMtGaE0blyP6SVUwWDArQj6vXg7KkvdP8tI+zxR8BGy7mHMICP?=
 =?us-ascii?Q?pfXrXKq9Ds+sAtEWbAN6SbNOhI65tH/9Scm3ZjiD/vS8L1jXt6P/Imrtne1X?=
 =?us-ascii?Q?6+/7MTKhQk4+ypaTLWFuh+penXqv5jwNd+zZFhSO2CGEZop2+FFYToEEV/Ua?=
 =?us-ascii?Q?SwqC4cI5MUty4OpAGb5K6uQQec/el3k41u57SrgQrvCUtOHOj2LJgbYLDZlQ?=
 =?us-ascii?Q?iU4UkuVy8/NFUcMisiC6mvsp9OqVopBCDHbZgWttZ5dsxuIqz9aOpsiiTWFg?=
 =?us-ascii?Q?x3IVPySd8oNfi9QxR7vOqahWYJedJd56+pvjNOmmrGk6nBJU1CnVBT2Pe7/f?=
 =?us-ascii?Q?sKvRhl22OHGASmM7B8BZ76/WmeMhqrIofZzWp+ESP604AVk78Sl6GHWR+v/b?=
 =?us-ascii?Q?B6l+Q9Egg+W+r5ThMr+jdf17H8hlOaq/WNudQcDxmhnlNGnvfUo2zbe/byjK?=
 =?us-ascii?Q?bfWitKsZC9kiD/+j5yM0wFEqD6+xz0bRtZ1u9KaS+93TVvJhb8xUurEwWAYs?=
 =?us-ascii?Q?OiKKf6oY0lOlusZYdW//5RBx4qAS0DjNJ3sRZhEOgmiig1skT3KQAcNXL7fA?=
 =?us-ascii?Q?UH/0pEvf77CkxjgVHI0tdzxs5zkOmRr/44ixaz0cwN20RegKXHV77HXbqJko?=
 =?us-ascii?Q?tXgAIWNu8LNkbP/AMHGulp2vfmQgx1J0cY6JDt/XK/fkh75J/L7+hhIro7Gb?=
 =?us-ascii?Q?lAwMx24CO2ebTMI60TV84Wlzh1Ksm8cl5gHozYFbDznwcn8UBLhUVduXkLpg?=
 =?us-ascii?Q?QuiVqCwSkuZwXBEuUvLImFVBUZYBf5FrYqXUTv1zM8C4Bqc2qoSHKp55AYlQ?=
 =?us-ascii?Q?i/F9CrjtJ4hvf2Bbd58iqjZCvHa4u+j/+wh0uCFgPh+ZTxFY7AJFKGnnBihP?=
 =?us-ascii?Q?tESMRcVIdPr2rPlCQULhH3d2Lw2gmgPTOuQy8fcl2nOypDrvsywgSQCJf8jj?=
 =?us-ascii?Q?sVpkmVeudmSBNL55yuo7PGGqmU46hGpB8nGXWzjvdsOmAPbrKFyuRkUQZ2Er?=
 =?us-ascii?Q?72ZU6HsbUFdH5+szm3jLwInM2d9e/yQageIkcXbtvEDZPZL1G5nkLpUzDfAj?=
 =?us-ascii?Q?6PFrTUvrg4tcTtfZ+X7o2BqOkUdCSK/4M2Ctj9Up0P3VcqngwWenhtcmNZAh?=
 =?us-ascii?Q?JHDw6VLW0lns07CPNeTPb/QNVsjeiAIYGHxaM+sc8LBegKtkDCUKmIESUkVT?=
 =?us-ascii?Q?UrdK70OslyKtl2UmfwfUWF12PyNwytQEjeEkBpzqGrGJ5HkW+872jtaEhpGd?=
 =?us-ascii?Q?8WTGkC6ESsYOKUa8EgakFw4F+wtjvHoM6glTKFRIoyr+SFVEytiTJGzUnnKn?=
 =?us-ascii?Q?pphsjj4X0BDKEZNtDM+ItuQHakFxksc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1684fe88-8215-425b-5725-08decb45dc12
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 01:23:24.0899
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nu6GeGwpWo0vgY66JFRDF2T6VHwnYAstecmGGU4HIxRuKBDqB8OhMC0N+AcKg7omVL0ScmftExn5yLsIwOghEbbkLcxyWrdzx5PSwIXtcURDbmQ1st7wG9Q9VF7ANcPP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9978


Hi Alvin

Thank you for your question

> 1. What happens if CPU and codec both support e.g. DSP_A and I2S as
> well-tested first priority formats? AFAIU I2S is only well-defined for
> 2-channel stereo. But for the TDM (>2 channel) use case, will auto
> select choose I2S, when actually we should have used DSP_A?

Auto format can have priority. But if DSP_A and I2S are set as same
priority, DSP_A will be selected first.
It doesn't care about channel numbers etc, just checking CPU/Codec
format only.
Please see soc_dai_convert_possiblefmt_to_daifmt() to know how it was
selected.

> 2. Regarding the warning: for DPCM use-case, I was always setting the
> DAI format on both the FE and BE links. Now I assume this will
> unconditionally warn?

Your concern is about dummy DAI ?
dummy DAI will have auto format settings too.
(But, it should be included in 1st patch-set, but I have forgot to include
it..., Will post for -rcX).

So there is no concern about DPCM case, but is this clear answer for you ?

> 3. I can also see it being annoying that the sound card warns me just
> because the CPU or codec driver I'm using does not (correctly?) specify
> .auto_selectable_formats. Maybe it is hard for someone to send a patch
> if he doesn't know a lot about the third-party hardware.

I will post 2nd auto format patch-set, and all existing driver will
have auto format settings by it. So, v7.2 will have warns, but v7.3 should
be no warn. Unfortunately it is patch accepted timing issue.

Actually, I have no big opinion about sound card warning.
I just thought it might be a good to indication.
If it is annoying for people, I have no objection to remove it ;)

> 4. Last, just a comment: In my previous company we always used either I2S or
> DSP_A by convention, depending on if it is 2-channel stereo or TDM
> respectively. Both me and the hardware engineers would rely on this
> knowledge when debugging digital audio signals with an oscilloscope for
> example. While I agree in spirit that the DAI format is a SW setting and
> might not belong in the device tree, in practice I'm not sure the
> hardware engineers would completely agree. Hardware can also be buggy
> and forcing a format in the sound card is needed to make things work.

Yeah

If you know that it can't use some format for some reasons, it's better to
set it as lower priority, or disable from automatic selection.

And more, if the best format can't be automatically selected based on the
CPU / Codec combination, you can use previous selection method as-is.

If CPU/Codec drivers has auto select settings, *basic* format will be
automatically selected. But it is not necessarily the *best*.
In most cases, I hope it is sufficient.

Unfortunately, auto format can't help all best cases. So I need to say it
is "better than nothing".

> It's just a warning so it's not a big deal. But I can see myself
> patching this warning s/warn/dbg/ if I kept seeing it, for the reasons
> stated above. Especially because I'm a big fan of audio-graph-card2 and
> use it all the time :-)

Hehe :)
I'm happy to know that there is audio-graph-card2 user :)

Thank you for your help !!

Best regards
---
Kuninori Morimoto
