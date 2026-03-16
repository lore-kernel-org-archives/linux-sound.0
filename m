Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011065.outbound.protection.outlook.com [52.101.125.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BA141C84DE
	for <linux-sound@vger.kernel.org>; Mon, 16 Mar 2026 04:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773637090; cv=fail; b=cmlxFIWkgpYK9sZ1O89YM1X51JOpKnTQ3PSwHnB7qD6zs9ityccf0YmNsKWI6XHnrLKvPMfIeDp9fPsrK5d6F6TLUf5f/5Rutn/bkHi4w+6umvrdOx+hPmkeUxHO9aHlI7aRyEYExxx0Yr38WjZKQcN4/qxuJUb5/rZRCbHFxlc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773637090; c=relaxed/simple;
	bh=E0RgMCn3uvDVZnF76Hr1ZBIPZ1lWlASPq0gi81S1T6A=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=SDlq6joSWahqEPQx/RAXX0L9I58apsD2gvFUWvboxaZR0Rv8QK+50nXW1Q66tJiqbtsc/IwBt9SgsxA4G4LbABijVD+jBCRs8Q9iOByMiSqbjWomFb+1O7pV5DlGv/0gzSowDHd0VP7QENmjbSJVZQSP42qRj+UvG7a6017+DR4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=lm9zPi2e; arc=fail smtp.client-ip=52.101.125.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="lm9zPi2e"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XSPfEHV3BLGx8qrHmrHsN7Li7DUdWaCRqif83/RwWR6eUuaz4Jxuz9rC+JetGtOKFMXeyx/eZQ413nRlkcygQu0dv6A7REdeg37Pu73V9aQIIR6siQspRqJ7EgRCOYvkbNFw0BwF7E7+6fv2ubKwiDn7JWTc+OqBhiols52tyLvvEs/UdeKS8kEletHu2gZhelp1soQpDEWFNBBh84YX0r/EQ/cm9n+PyJxs6bax6jpLvlQBMOxg7HF8g/RfLNOAa5j8EsV4toHVQ0Qnn9qIr0C4Un/lfSY5T391+KGiGXp5MqYPSQI7+2tGx8bmMijUYPff9p5w7LZF8hu/pAuPHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9HFqMsKFBOBBpjAmR4IvUeL/RKiUW9fQb/fXGjd8wCk=;
 b=siEPtXyjsqsUHhgHLjyBNk0d3XAna8HovckdvONAjIOJ7XZOl1R6gQFTM/FuxIDRPcZKFdFu7ucrCZXHY//zo/bimXNhRz5ihNZekcfvek+eJXKCwC6OrbdGMKb46DkcOVdR52Iu5ouSxw/2+36DXHTo84WrsId9QpvRYwpjzAmcZM052RCx8Qza7xNUbPpQboFqyqzS8hzNgCunnR4B9AgFDzl41rBLHq7j7HkH1pvP7mB3EABh3dkNiHylruqEbWsbFpRIhNByGA9zwuVNlldsxFR9ZY354qLtP3Y1235Rad8urCOjCaSrY6J7i8KKJymSlm+/vdkIAPL0fk1scw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9HFqMsKFBOBBpjAmR4IvUeL/RKiUW9fQb/fXGjd8wCk=;
 b=lm9zPi2e5qmMzuLzU0SViH5yV4nqdT5zZGBZk3FsSjztKD7H/o5uy8mda2yTgFs7OpTmkzEU2LMntcPN7ZLkRWFJkJGdSzmoi5fbPwty2TtyFi69kLd+UZRXPnG3nOGllDl4cOLHdMmZzjxVP/lNLMcxs9REJcrwKtVW/kw4zn4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com (2603:1096:400:ff::13)
 by TYRPR01MB12984.jpnprd01.prod.outlook.com (2603:1096:405:1ca::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.21; Mon, 16 Mar
 2026 04:57:35 +0000
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9]) by TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9%7]) with mapi id 15.20.9700.021; Mon, 16 Mar 2026
 04:57:55 +0000
Message-ID: <871phkjrqc.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Subject: Re: [PATCH 22/29] ASoC: sof: name back to pcm_new()/pcm_free()
In-Reply-To: <abdX-nFZbDInZxXH@sirena.co.uk>
References: <87v7fcp10x.wl-kuninori.morimoto.gx@renesas.com>
	<87zf4onmdi.wl-kuninori.morimoto.gx@renesas.com>
	<abdX-nFZbDInZxXH@sirena.co.uk>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 16 Mar 2026 04:57:55 +0000
X-ClientProxiedBy: TYCP286CA0191.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:382::16) To TYYPR01MB7976.jpnprd01.prod.outlook.com
 (2603:1096:400:ff::13)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB7976:EE_|TYRPR01MB12984:EE_
X-MS-Office365-Filtering-Correlation-Id: ad9be5d2-06d8-4ceb-cbaf-08de831895fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ce9VJXFu84KZnvmvKGnYgtzmSxxDDMyYewCyp360IeEsABad5moU0pGu3pvBvD2D/cRGM0FuM+zPVUtfjy/GkoBKSDR8Fhtu365WHDdwHBf0hszQHz0Hueerin7RYYGWALa56uSUKVEzWwYpwYKyqI68DBum8sCnyTT52PJFnMYCXTwqFPB25ZW+Za16N1SJ713Z1GkQRxJvo6m2hTChBwLBlb+OQtSV+gJyf5lgTWxSPkpKc6xAe0HJ2rtiF+k1pK2SGk3JgGBpwGldQNzz9Bqpx+ljhMwTC4OvhBJ1rEvbPeZEpAYRF/fV3sgv2TnUEciON+18qlQ37RH2vEYD+Ad0gz4u6Og3xdEp4+Ez3Hi/f4o4GBrJBiXrYLtsGk1b5oVpX9Z5ovc7eAet68u3D4ilgg90ycmLvXVuo1wQp5G+tDeOH1+4DpuYUod8pY0JPs0CuiPWYsBAnEqM/RBgp3fjGU9qMovOBZVAgQYOLZGzPCSy64SDTESta7PXM0y+zfSzZqRf+LdWY5oo/jPCPCuzg7R56w2pQHbClHuBfxeQuZJXBnp0CTzmJaAU+7Oebafak7l4bKrqCnvPm/66jnJwFNYfNNowF6llUsoET25k4YK17lbGJmEiOOR/6xFmfmbSlGAaP4euZE6HA/cN1G/pJ6fiydYWcQtPGn8lJnxkntp4t4sW7D6/34478O5KISR6xIXBiJDNvT+FW2lq4LRtHdP4jg9E23T3oBjkutOJsn3bC6PvOLd93/HMVBip8T1gbX+7LVVuPI8NjhbnyOnxhZqvKkOwchfz6aZIah4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7976.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vpY34O9dpSvdjkIOlt2OfvpP2oexuyg9EXQHFRyMOmKgOxPfO6XPKa9ky33V?=
 =?us-ascii?Q?MF3i0//V4C0MFWTZz9FdUQgsyY3u9ZFNFPdDxMutTXAHhWkpJ49HxdThEu7a?=
 =?us-ascii?Q?an73Fl2e5APRhsDRP39kTNygccmZIQSsToJHVQpScaJ/pfHrOswPqvLKGm48?=
 =?us-ascii?Q?CVTIG2Ph8jjEfTkEegtLEYTm6DPVEPwY5+NXnNuKPm8kyYhQPh92QpziuSLC?=
 =?us-ascii?Q?3rzBnyKwy+ELn4eUvuKrMpq3guZCGbh+ytRBF6uaFKjPBRhc1eJ0CUbREG89?=
 =?us-ascii?Q?5uIXCcCNzRzCSUdm3av5+zZwTLJaz/d8a1t+O1UqQawiCpmxF3xKc6m4+bXn?=
 =?us-ascii?Q?xo1zs+Yb1AGZp3fa47Yd+icSXYN0TS2/TYbE4qWrkIR9zIzrAkbDgr+dhN+3?=
 =?us-ascii?Q?9q/vG7/3oKr7tiEaEpOKTFXw5ZBB0CTlgtMSd0yaczEdf01teKdRtNv6gUxJ?=
 =?us-ascii?Q?aF3u6DD93eHWtgfNrQCku8VIhWok26GQgjviUjL3AgYwSD+3/zqlLj2xuwtA?=
 =?us-ascii?Q?c8Ma49iYRd9tWXjARO9EzkfJtLar86bm/vAtWlY5OifODo/vCm2zUTbwjDt5?=
 =?us-ascii?Q?iB5oBa+4yfriZIiXtAE/PQnRUsu297VdLP7JQNVCXm5GLOoQ97ysft9NPKay?=
 =?us-ascii?Q?JEaF6CGWko7gaD95Ivcol/QMRpdU0I7pDOU3kMv0txr+GxTLI2KXyAFuH0U9?=
 =?us-ascii?Q?+ka1sQsW2sERlUOJ0+bmLn6i4HtjbPIZerLkFn5TL5cJ5X7e84PtftQ5b7eW?=
 =?us-ascii?Q?Ov5mH/2HFnz4aqAnGqFJPzuCGgTKuq6SbrnQ8ZCqgRrUOVIMJejUb87E0j9v?=
 =?us-ascii?Q?R4wGbadUBN1/zHfhGBWCaRiUdFMFC+oKbEvRnyaQuGHO9jlauCGshKIMAvod?=
 =?us-ascii?Q?RWOqSfdoHDqqp3zdgrLZ6Pf2ncM1MTJhkhNU59qRpSBzn777SNLrW725F4r9?=
 =?us-ascii?Q?+hrgr48BxFJQRv2MqpbLvLkmRXJYJt/8IL771cDor/CDljPFs8Oh2pAokCTj?=
 =?us-ascii?Q?tr6Qj9n8OOTlSYrCLu7nuX+3uEXqKEMzZio5PCqhpre0D5hdDWSp4TfWMDjY?=
 =?us-ascii?Q?YzVkoRLnvBkdO/LphPhOK5pzn8p4ediJXVLOrfExoOMDJiWPFIyDp/CDuk58?=
 =?us-ascii?Q?6C6yw3IUJWK7kHCl1Xsmh3f2nKXw59GUv7MWa2/v2cFFXqATcExSLEXeRhNx?=
 =?us-ascii?Q?tGoLZbD28LK1RlLxgO0HChm+M5h5+BvBf7u/m4uFFut/ILwuzxCvQDk6VLoD?=
 =?us-ascii?Q?vjl4PK3tSdbkZfQ1TMIAPVBl5C7zOHzXm3/l/Unk24YBAfOlpQJA/cesniBw?=
 =?us-ascii?Q?BMnBCfD79qT6m59Bly4Dmke73xzbT1hvtT4IJYzdQBrCG27J4nqHgJQAygwS?=
 =?us-ascii?Q?/xjGpOW9JQPcDvZVV8CNJ0h4+qKgg6716KnQrvySGGLD5hLbHqcwXqaiTmtH?=
 =?us-ascii?Q?HaF2h/RaiQcCN2jLJjqhQg50vLMJr5tAsnSK4m7RhZ9B45Lxr9WiDKr9gRfe?=
 =?us-ascii?Q?6gpoYotgbcIw/EBtW2iU9jGEM6AR3jI8caLZIEUCc4x+Pzr9+CJ+J/VRbS0V?=
 =?us-ascii?Q?wYZCzZ+CIslhaqyjlySRbYrngfH/XyoUftU6e1rfkTHebQNW3PyMHB6pQ25w?=
 =?us-ascii?Q?OckCtC/4KjPvVGZGHBOFhN9Ny/MHCVvhe5Dj/uHhEYYu80NXQSRQBScLm/L0?=
 =?us-ascii?Q?4uIk/3qH5qEWQs7QEn9dcEN0Znwx0yrcj+I6Sv7+hYj18q6+xxJUStindd1w?=
 =?us-ascii?Q?CCDSRfqf+uCW2/e0aaRTQZqFC2jjOZzF81JkVODtRXdSlzu5/aR5?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad9be5d2-06d8-4ceb-cbaf-08de831895fa
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7976.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 04:57:55.3237
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HVTUHUf8pa8Vct0ijLNi+ptIZhfAk3VJ4y8u9jFdKe2nJUHFc5TZkH5hpp+z6rxRdiPfpM3zDzw6in87QPEC/wwHfal4QsYSWb/vlWgdBTDY+tc8PCqeRZPjcj01+wyi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12984


Hi Mark

> > We have been used pcm_new()/pcm_free(), but switched to
> > pcm_construct()/pcm_destruct() to use extra parameters [1].
> > 
> > pcm_new()/free() had been removed [2], but each drivers are still
> > using such function naming. Let's name back to pcm_new()/pcm_free()
> > again.
> 
> This needs a rebase onto current for-7.1.

Thank you.
I have posted v2 patch-set.


Thank you for your help !!

Best regards
---
Kuninori Morimoto
