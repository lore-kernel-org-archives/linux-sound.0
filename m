Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2062.outbound.protection.outlook.com [40.107.113.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A5387EF0C
	for <linux-sound@vger.kernel.org>; Fri, 26 Apr 2024 04:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714104034; cv=fail; b=J6cBVay0ZRnoMZN0JdM3ZeVwnCvkETCDSzHKaZm05aCv3mvpYAMErT7u2U9k1PRJQaQdQmqtFwNcv+ZawMfYd4O2PqwrszM0CznhE93I2hyDhaugqpTshvcF1T7znQFjjZpP3aT9fzU/kFjm6skGwopo77nptZ/R6XY4Dx8imEI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714104034; c=relaxed/simple;
	bh=CoSXKgHJAFBdPrkKKmoWOkyqBx0944L6Lyke2FLH4lE=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=ZA614Gmnbdy/Nikn/+cyduyD2cxGGfJjJtVm/F4SNihCQEqu1R5kk8JjV48KJDO5v1bOVSSK2Oew8YQEmhvzoLjPg8Xx3P/EAIFUpha7mBsH/iKzbHrITmtLvkPS5IqCukBBkDWQrbY+WDL8Xgz7/l16F6ErNxCXDucwAjRbyIY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=SMITJkgb; arc=fail smtp.client-ip=40.107.113.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="SMITJkgb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=evanl2Yl08NxUruhlK70WfH9m7LYTEmMGhDWyHsEyXJgyy/bwMioOyztTSw/Q83MJPePNOLmsi4cz/2qbzk4ufAB9pygAao4yN7ab3FUJza0QHD6wyDx6lUzWPOTtCBTRIsKHSIWQPx99uQYCuu8DvD5j280OYSmrfOFA0zgp+Gmk18z+B6sE56ZURs8riqOVa/HOJk2q6Infv7h01Kauvj0vWWO/4yZkkE9bsX85jqygY6mDaYPtm8dVQoPGsVAGVMS2W+E4YahHwdMB+9ww/iHFxyEJEiRZokWJsl5c2Do08bxQs9bmV2YvLGrrcUVjsOPlVDq9j8Kj0ZevOWryw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w0pBOa8+wUVu/b5pwywJoVeOI/snIAlZ3vb4Obr1rRs=;
 b=az+mZntfoKlWTT4Skfa/4qgkuRo+cOB9WvP+9lsJjlfJ9+5e384zo6I+tiPOg4rjUhgMtQpw8Z5pcnoeAheXmmMH0KZbgG92d9TKsf30KEKtzEFX3XCZ3G/tJ1L8e2sJQYSKyPosvYj0kgdB1WK6vHMqISqU6XbI8a3X8pKeyArrTJzcA0lhKW/c43F+051HMkdizD0CQOnIsFpL9b1Fi1m3N9Vr/2UUYqbglAubBImtp/jPIi5giP71toDGF5P7Fcfue0g8BZUaoxBreklIr+qJ+wmVTdC8z9FviGSjpcymB0XIhwSIdlV+TC+OkJsy30Th65GsTEgjqbEVPZdr7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w0pBOa8+wUVu/b5pwywJoVeOI/snIAlZ3vb4Obr1rRs=;
 b=SMITJkgbtj35oGNruUYoDwdnMXNGtyTzEyTymXlTx3dHkfKirZZ2N5j+3c9UHhwTyW+pBtOS2MDmGkWtU4Ay0P9byu6z28K+BeNR2wpBCggGovbDt3LO+QDk/yDRuTJvfhhPX4g+SpYtQOXYbjHcp4p4unAh/YXxeLhH9BtRbgE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB9522.jpnprd01.prod.outlook.com
 (2603:1096:400:192::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.25; Fri, 26 Apr
 2024 04:00:28 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b%7]) with mapi id 15.20.7519.021; Fri, 26 Apr 2024
 04:00:28 +0000
Message-ID: <87o79whixw.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Mark Brown <broonie@kernel.org>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v3 01/23] ASoC: soc-pcm: cleanup soc_get_playback_capture()
In-Reply-To: <87v845gee1.wl-kuninori.morimoto.gx@renesas.com>
References: <87h6fz8g3u.wl-kuninori.morimoto.gx@renesas.com>
	<87frvj8g2v.wl-kuninori.morimoto.gx@renesas.com>
	<a1f63065-6d8a-404f-b4be-331d829f802f@linux.intel.com>
	<87ttjytayy.wl-kuninori.morimoto.gx@renesas.com>
	<92054f87-dded-4b66-8108-8b2a10909883@linux.intel.com>
	<87edaym2cg.wl-kuninori.morimoto.gx@renesas.com>
	<93294e52-97e5-4441-a849-867429da6573@linux.intel.com>
	<87h6fsisn8.wl-kuninori.morimoto.gx@renesas.com>
	<87plueovm1.wl-kuninori.morimoto.gx@renesas.com>
	<f65efc7b-d268-4b39-8665-5c4fe8e3ca1a@linux.intel.com>
	<bdf31350-1f99-4588-8d6d-f4b9c8bad96f@linux.intel.com>
	<87v845gee1.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 26 Apr 2024 04:00:28 +0000
X-ClientProxiedBy: TYCP286CA0246.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:456::12) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB9522:EE_
X-MS-Office365-Filtering-Correlation-Id: c97679a8-aa8a-4268-9d34-08dc65a568b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|1800799015|366007|52116005|376005|38350700005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3Ptv/YbZhPM9UQm7Jt13Znu+FpNidKNORoD0jXqeM4bNJfdnHe2I0VH5MQqf?=
 =?us-ascii?Q?5kSVrFLABCxRjPaX7uT8scsOYOdy26ggjZzKRcK+1QIZB+mPMlxtiAW/JxWa?=
 =?us-ascii?Q?SkC8yEJYB7yf6JAXRlmaC7Co8RyLklPprIqRpxzo4NOhL3kVot5+xA944dBc?=
 =?us-ascii?Q?9/oeyrxB9EA6H3cGyeb1sS54Tld/XJqAogI5BxEZ9LuLUu9XhjFplFPu+lf8?=
 =?us-ascii?Q?pxKsbI8Nx/KTei7TCAJT5M5kPISnzlMCqQON08CA9gJgneT7L6VwzzAOPS63?=
 =?us-ascii?Q?c6vTDcGbcyBpO5hwJhKf+p3M5zDYefx/qBHHv6/Tt/1KJC45OKZbGq/k3Uxh?=
 =?us-ascii?Q?/4kzS4ZaspEOAKxUqlk6GVu0wL7/mU3wtOnMpvNK2jsVQTMYP0C8tTwWeC6D?=
 =?us-ascii?Q?bxAE0N6SXUCkyULgKoG12QxiuWcwtvDOyLA7dNaJdejmK6VNe+ZGnYpBLypl?=
 =?us-ascii?Q?AUOaIfdakPUrc5VLkplzBsQsLeceREmFParzYJwJPWWZmBq3E9QTsOGSqRi3?=
 =?us-ascii?Q?N2Y+JZQDZqyi9U5wkm1IPaFoP/zftc4yK61ygIAbKpnOfdFS6miK3RxjefrH?=
 =?us-ascii?Q?U9s44rPq9Ukg3oqSPbxzDi5hbhcAiBONn9anZOvMitAT0Co7QhA5TNwxaY2R?=
 =?us-ascii?Q?iqm6C0uqDZqU3imzy0Q0jgM/0KhZKybxAS3L5qK3X2YA42JsehAhL+HVdR9W?=
 =?us-ascii?Q?XWd/pyoQfS8oNY4HDoDKERF6CTKdpnqGPcs/Deev2NBevQ08XMugergONtzj?=
 =?us-ascii?Q?WbJQR0H+yMFTnTD3+t0VjTSFMkMFgy4AgLYgmAjo2cY/zuSdq118Jbxy4u+A?=
 =?us-ascii?Q?15JDF7btEzTL1fl5yPLzjj/HAp6BEYBnOajRv/c7070zWSiJWbzlx4HcPeQw?=
 =?us-ascii?Q?NtfBKO4eHzsbjWGCzb3iaTFuZjYfvA7gzDI4KpPTEMI7mfUU0priYY3FzmHD?=
 =?us-ascii?Q?HhG792XDmriZbObA849vTI+s/sxmKlBGQYzW0Y5VMAuMpczmjijz0OaDaiYM?=
 =?us-ascii?Q?aEqUUPcNwQr/9iKywjV/fxGs+kj+MBaUw522c9yBodN2ffWst4JxRgrGhdGS?=
 =?us-ascii?Q?dutlVi0RgtG4SuAfrCG0pZc2FcRTgFeDasGu4Kd0gRhfVX+2r1IkD9pjf9EI?=
 =?us-ascii?Q?30s4vLyamFSt2Ulj4fkdIuWRDJ62YKnF7Ew/zGTKQAKVKkuQ+nUKkvSijAA7?=
 =?us-ascii?Q?iKWesLduT3OBMlltHC0elslOtjYLh0pm/vII2w5vBiP8kIsczFj4lB3Yqdhe?=
 =?us-ascii?Q?Z0thCqf51+UG3DG4BM9RuQTt/Ltp9yQ4pDjxkoNU7OEIGu8rWm99QVNQdYSz?=
 =?us-ascii?Q?KX/KQqDjfukzQsfK5br58BvxYH/a0OqrWgOEZCF6AdLS5Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(52116005)(376005)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/akWsCMEoqQFCty9mWRdWAy84T6b7YLf0vaOLrJhp76SK6wZj/8l6hV19RFk?=
 =?us-ascii?Q?dH1WinjMbYq8ddI831jefAWUmOf5RRKm7yHwi+aSXZgKa9JgkHy8NLDG0e5c?=
 =?us-ascii?Q?owFVAqlMSWi18FcWAS9EpePGewNC16L0AjLqbOp8Cu8oFPXNVlYLV1cU181M?=
 =?us-ascii?Q?oALDCjjVwEhV2pq40JJH6jAB+VbmIR70kyKowPaRViK+F3cClagy+Gy5Kh/y?=
 =?us-ascii?Q?k36xPUozmjWOyVLZXwJZsStt8/tal7W+CqbSRHHTTX9QQknjukYvizspM5P/?=
 =?us-ascii?Q?E1hiX2R6oFnbHLSJrACvrzB75aPnrJ0iZaNw+fedG24ICAsMwrH6ZhCn5lzW?=
 =?us-ascii?Q?vH7RCwbon9FvWgrgTR+46H07W+cfnc055io0gZTCGysK4ZiC//kV4cx/+WOB?=
 =?us-ascii?Q?iueqwLV/rZUB69VNuMrq2esBf5P3MsYYdHFNWVDEV18SR14C6IX6FO4N5VcP?=
 =?us-ascii?Q?uoL8UVpMSmRv+DvCXZTsooxypO69xHeBz9G0CCorKh0u7qFa738nORqOto2G?=
 =?us-ascii?Q?SURJoeYSK7rvCpqtSEoSkfUsnwHgNM6yLRbuHzf83619nGcBBxA5+zjsK+SQ?=
 =?us-ascii?Q?Wq6ktahRr9cCPaOwVrg68uLUDSBEQQ8tORKR/TfNawtIKfcHLkSOfHTxf1Do?=
 =?us-ascii?Q?L2wbAiSslY5S//AeIldbVsiJQmu9JVrqf6C1iodG6AsJ+rPkgD+6pCOtKJvT?=
 =?us-ascii?Q?68NMYgdB0jc8ddIDsgdOQdrZQ+4rWsWqeE0u75FHP9b4MNg6rZhwVkPrn60s?=
 =?us-ascii?Q?ieWIa/PWH3XtNEi+ojLxVk6scb3iMTCHCKuPrBYkFej3IcRkyf/LkdNhoC2O?=
 =?us-ascii?Q?TUpjLvBhdWq14srdex+IaB7mnJIYYakk/fs/jD/YnFyScApjYTYnw4C7gyzh?=
 =?us-ascii?Q?W3Y2qn/jwPgf/DJKxlui9373dLuor7y25H+zkUl0DjxYXRYxstlIy4MP3Yia?=
 =?us-ascii?Q?oCtSH0ephOvSzNV9mTFeBVgTytkLIvl7tF4/KMo+d3mCUfixBBsslOGBNGx0?=
 =?us-ascii?Q?RrVvpfLqoZHNQbXacL762PYWfTITDulRxlVoke1LwvnOavm2q0JPkp9TXt+V?=
 =?us-ascii?Q?rQUTYR9nqKv9tQMLUom40fYPl55pxyw6af7FazqF2gLXWWWelN/85z+P26P5?=
 =?us-ascii?Q?Z4it9kosVi0RFWCQ3NHGDD/bofrkzN/Ke7z8XZMkCO+hYnP5UjjBiwEMshpk?=
 =?us-ascii?Q?07dRLg+VTFoL802gjcGLe36w0HWOMRZVfetp0WyLJi+mpNhWPYBr8WrSYH82?=
 =?us-ascii?Q?d3SJsTteZfiRiJy1BzSslodV+4gqqJ5rZYJrB/xzpiHERo8rXZ5OFBqqSBGP?=
 =?us-ascii?Q?eM2K+Dz1AYj2sRP/36jswIKpXQ1CBlOTmDISnhiIjQsGjNFhUrsvvZMZSalH?=
 =?us-ascii?Q?01AjJW4O690ygdA25q1iy1hbB/2oru9flzAkqWBcCGFLxo9fdROUrIeP0h/A?=
 =?us-ascii?Q?1P7V03+2grY3PlCnZ9pzXT6bRGdD6TofHk9IF515V5ABAkNTr0wPGPeI5aBT?=
 =?us-ascii?Q?qJmza5yJd9cJgrzK1nkk2/+AxeCUMXet3+nspFb6zAiJSjeOLFdUpS0I6dKq?=
 =?us-ascii?Q?G9P01dtCImIXM0i2T7jApvjqS46qhqnhk79/Qb6Gy//rrxx5YdKmZeMDvqSd?=
 =?us-ascii?Q?/Cg4dUnHh22OUeAu3bSqb7I=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c97679a8-aa8a-4268-9d34-08dc65a568b2
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2024 04:00:28.1463
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e/4pDJAHrOiJEoKg5qiVzSneWIYPnZPPVOBnmMM6SUsh74fni7aCKSGEt9xVSBdwDb4F1nIi7WVkDs5WWezWga7yOGw50EAxIZCqKbcfYQKiEysD00s4Lwoy75jTUAww
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9522


Hi

> Step1
> 	dpcm_xxx flag will be "option flag" instead of "mandatory flag"
> 	for a while to keep compatibility and avoide confusion.
> 	But it will be removed in Step3. To indicate such things,
> 	it will have dev_warn() if dpcm_xxx flag was used. like below
> 
> 	if (rtd->dai_link->dynamic || rtd->dai_link->no_pcm) {
> 		has_playback = /* at least one of CPU DAI supports playback */
> 		has_capture  = ...
> 
> 		if (!playback && rtd->dai_link->dpcm_playback) {
> 			dev_warn(dev, "Playback is requested, but CPU doesn't support it\n")
> 			has_playback = 1;
> 		}
> 		...

I noticed that this Step is not needed, because all existing driver has
both dpcm_xxx and availability.
Instead, We want to have warning to indicate to use xxx_only flag if
dpcm_xxx was used as limit availability.

Thank you for your help !!

Best regards
---
Renesas Electronics
Ph.D. Kuninori Morimoto
