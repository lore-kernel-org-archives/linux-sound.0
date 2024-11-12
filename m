Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011032.outbound.protection.outlook.com [40.107.74.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A93420370F
	for <linux-sound@vger.kernel.org>; Tue, 12 Nov 2024 01:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731375014; cv=fail; b=rGhObWYNdW23wI2hCEyVz6lk30vaE6OiyLgLeJpIAKyy6TOysN5t8u3zuqfEnc6hO6vrpZkp4ko05ssioTf7gXOqIhuvW+U5QD4n/BW+x8UnTCx0YPccph8/W5xftQ2rAq0lz+6eNlU2khjVbUTnY9QX6ckORKQeaxqUgcFK+nw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731375014; c=relaxed/simple;
	bh=RQ6OZmdz2aA63+WG1xdr+kPG0mmEVQp/uLUmNKXKp2U=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=K5qZ3UW/Muyah/T+fp91CvUAWWjL7acCpzQUeeFbS6ZR/t9Xl6F91m5iEm0r7TGwI8WJw989aiwtF2BfaW0pyLUQbP3TrxOdn1uIfplERM0on7V0J3MSqSmVXOWiPaZthm45hozqdm0nqtYD+WHzSPBXKXX1Fk7ZLLSTB05BWok=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=BnzWHUjG; arc=fail smtp.client-ip=40.107.74.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="BnzWHUjG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yFg6jU/wmjBLVjcmbpr3iTv0csOT/WdDDCLsXjlll3VYSJa8BKZC4pWrV8V6pOX2nigQktwqjgIHzq9VsnneJoz5zJ6P8roCmFT5qGLtcVfdqIzNoeJKhL4jeQNrJiI0AJH48sQgChIp6dJ6JiXAvbZ/jsHYY138Mv5Ti2snA7yt5VApdOSULV9Qa4Ih+I2Ph1dulN1upZZ+75MoIv0lc6mnOqIpVmJdsqDGKymJDo7WJPVOuv08WOdoz9i/qEcU5jxrsNpGCvA7Qy4MOAQVsgRkMIoyhayo4eZeV9bsQqlE9PeQbEqLwYJ+IUx76tt1h6Rahlb4tKIOOT1pSHoD2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FJqiaVuCNG/TvT3ayUjd6A3OswwhUHRCXNF24UBsYvw=;
 b=xUrurLe4m08Bc3ALK/LgfT1dcNjDZ1dlWi32B+SLRhGfW49qsuwYIgwRd8nyVcCqG1J9HWOKNZfIeyx/L4a2LqS/50HJY+L5LhBzl1/OTqTxjP3UkSSd1ZfzI9sQwNIr/A5CZo2jOC3Qz4rvVhINilTT8qSrJihpbk8aeg3S+MDsZ8ntGG3xnZPzfc7x2KwA6XJJAPzoXZYB1t4A1ZtesLMIhapLnZtjc9pFtdZilim7cSanncptaRhuIAeVLLYdzPU2doWyMkg+o0SkOlj058FzonimgX90gcs14AA32Ipo5HzIbYfrZE5QPQXtfJ29ifwIe6p6FWa41BoosugjDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FJqiaVuCNG/TvT3ayUjd6A3OswwhUHRCXNF24UBsYvw=;
 b=BnzWHUjG+WGmUo51sQJvbbbnk3KGAKBY0ysWfKTG8TynVXMMaib+EevPxIRyeLJnM4spTzKvSIliXUoJygQurItgGLFqhpGSyqzejHBEqXFSMjnB4hIgNj3DedkdzzTXpOkPfXnSQtvXpxLonX3e2l0Ck8yCksU5I1xF/UfM2mQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB6111.jpnprd01.prod.outlook.com
 (2603:1096:400:4c::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Tue, 12 Nov
 2024 01:30:06 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%7]) with mapi id 15.20.8137.027; Tue, 12 Nov 2024
 01:30:06 +0000
Message-ID: <87r07hme75.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Subject: Re: [PATCH] ASoC: simple-card-utils: Unify clock direction by clk_direction
In-Reply-To: <874j4l9rwl.wl-kuninori.morimoto.gx@renesas.com>
References: <874j4l9rwl.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 12 Nov 2024 01:30:06 +0000
X-ClientProxiedBy: TYCP301CA0069.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7d::9) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB6111:EE_
X-MS-Office365-Filtering-Correlation-Id: d8c689aa-64c0-4eb7-5165-08dd02b989fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ONAIPLiaewu/OD6cuDoJQoufGlxFUr9YdXpGsqgVvVL5pQk2KyQMiAZwL84N?=
 =?us-ascii?Q?FsEH5bS30p4Xpyy5m5nHpOKjGATFAXahJklBoD2LeW1U2UYLkkWodphuAGr+?=
 =?us-ascii?Q?AJ90Ue5mlTpQozhFz7f5xdbl2NLSEiAUUrFdWiw/oLhMUh20IUQl20pXCp/z?=
 =?us-ascii?Q?rzdBNk00gB7m4Tld6fjkIMwl2yGNzByar8iNwo2tumn9SeoNyTEp/LOJZYJr?=
 =?us-ascii?Q?rzINN5ml8Uitgyiksl9f2+9CZciKh0xdnSXuM8s9+sCh8QCd38quIElmQv9e?=
 =?us-ascii?Q?/+fAazEQ1iVQHkuSwBrQrqyZbFQ2ieHA8etaJXkelu+hBwd6p4CEgxGDS1LT?=
 =?us-ascii?Q?utSc+MorFUjqKNqEQ3Ww59CfDVWeaytzmWIwG5y7qUvFCHqwOrNFyRuu9qhQ?=
 =?us-ascii?Q?CTvIfsgJFDLOpGdm2vESbx21UQpEue4O3Mvx6H6bypVViwXsrj0u4DCVLlH1?=
 =?us-ascii?Q?7PrH6Uo1F8+HZKPhV3huwcnFAnTWlev1DbSf4w9+KtB/s/lqkePo5ZzE9AUB?=
 =?us-ascii?Q?QlK8wSV5brv4ctoCNTyi4FWtrnUQMlK3GmjDO3MOrzkMANKmnelREl6+maFU?=
 =?us-ascii?Q?3NYXbGEFpU6ABXoQ5an0Dooq1y28x8GJTNnPz4V94Vq9xVxAx/WsqMbDyi/2?=
 =?us-ascii?Q?8MRJqpWFn3XkxBPlfj2j2bbH5Z1CRXjmvscAtaO92d2wCZqsD7SM6c062zSh?=
 =?us-ascii?Q?8B+HJPHt6LZDDrnrmMDo7cgt4OAvTtgoIXLqiai9vNcvBIEtvD4udrzdGiMl?=
 =?us-ascii?Q?iZVkMw2bK/emhG5NndYVVPonuxLjr2E1Qvb+JWNr6EjHaW666Xda8fSHDblR?=
 =?us-ascii?Q?IE+lGDmf6N5l3jN870DJ0S3L0UTySA1rd/fl6r8HZTkCew4zxMBwqLapRi0I?=
 =?us-ascii?Q?DcvnoKyH5bHvkJe8TLsiCiAzs8fnF1gvsqY69zq4abixP5be5pX0Kx0vsp/G?=
 =?us-ascii?Q?jsADg88OJtq3J9AUJeP2bqOXw+Tla7QqLKupvaBOlm/DFeg4yenRTuoHzgmL?=
 =?us-ascii?Q?MrMqs/ayDbeJV+EF/uydyz4GQ86Z3iz6qplU5xhU6un0Fdxw447k2QKyAw/Y?=
 =?us-ascii?Q?7hpbMPwm0jUCdr9+2D79tdzE4vzYBmsiZoSsKpDb0Vs/Msdi/pn6Ypia+ipn?=
 =?us-ascii?Q?yDX+iz8YOvCot7k1F5iyYPcjNF4R7eThJaI0WPGOSfDF+ronN9mv+8scnt+J?=
 =?us-ascii?Q?na/eEVIRV5dejlpsPqOWcCp/2Z8tdjHV/yFpWI50SVu0fl9yinSaLDSljiU0?=
 =?us-ascii?Q?ScbZdBZaZm19PNg6e/TY94/DCZmpPHN0IjIuIUXmZ3o2o6bPc7kQcFYuE3Nu?=
 =?us-ascii?Q?1Ws5037x1dHm4rRhGGz7586py/V+3SgAOW9ID/jrzu2Z2hmwW3rJ+wj3dljk?=
 =?us-ascii?Q?GY904Rk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pt5m16/Fbng4sCVZu68edwWHk5YCQRfSHtXS7DxLs/R/YYqUc1OETOBTHJA1?=
 =?us-ascii?Q?fATry5dB/kN+kZcfEFTbHa/NqdiNm8YbzmHPAnhFryHnodgmKdDSMFfHZaKs?=
 =?us-ascii?Q?lDSrJVljjBMRbKc/yhtaSoRnKccvfCQVbbfjCoLB9wXZ5/f7kdiUC1h7QWhu?=
 =?us-ascii?Q?DOZIaHcioVycKTD+YfGaxiDYoryQRaUXOfnrnjxt1uisZm2rxIcfRqmkWYcc?=
 =?us-ascii?Q?DOZOoqczcp3c+g3yHVK6l0IB+S6kx/IuaNp5AyX2Vpr1dI3eFATu+jd3o/Of?=
 =?us-ascii?Q?XY/ltdl9FB11pZKsoTj+aXO1K0hNWjZWbEVX7iec94hAhzF7rUqPTppaAoRi?=
 =?us-ascii?Q?2NdZqSySs3IasKZqudTwIiRdxC1IKzsE6FFanPjm6GTu1lGoEzaN6glfsihY?=
 =?us-ascii?Q?MkIh2jMOEpEMvJ4f8BuWm6JBo8F/R8Z4sE4cEeUwFePdoISISG/stN/VmqOA?=
 =?us-ascii?Q?/gEKo7tu30gzf4u4oWMICS/ZPNaAUkIEtLqfXEzoQgxnlmt7dj++o3OdxZHJ?=
 =?us-ascii?Q?x0Y1xk+8EwfFfOZir6hY1GvYnWJAW/dw/vFRUXIrgArH3d6TlNdgqOEzGI10?=
 =?us-ascii?Q?ze6VZLqZCLoxHZps3vdVut5TgcbGjPDzUlIToTGS6a8Mb6urgQymGZb/7X+9?=
 =?us-ascii?Q?PZ5l++jAPk7Xes2ITA23btmaZqr/Bso9YjYAdhLDIRT4yK0RMdD5ukEJ06kT?=
 =?us-ascii?Q?9h1FXieRIJRVywwL5Cjvtgvo1ehTMfqwRC6UOoBZbE3gZdx2MSpoTdcNEKry?=
 =?us-ascii?Q?5L7MMUmx/v7PtAzF6sXEw7UZVa5ZugpekDn2ftefBw3XaqWlbEERTSTLv0Jj?=
 =?us-ascii?Q?JuwnStr8yMVBpTFi5X3L0sE/wJll9Yw7xXfM+qnbqZ5jx7eSATRADUx6Myd/?=
 =?us-ascii?Q?ws061SUZqfwtLWrrOTQJlw0R9iijN+obEW5MaR4P8DUL/KqvvpxDj1ImLWoo?=
 =?us-ascii?Q?neVkqbxTFfCiFt4Dx/XUFRF422ugO+6qh0Kx5Ipwa5e2SGP6Rf/gtcEPwZFa?=
 =?us-ascii?Q?6MAZMaYIHMeSBQVTaA+2ATPRknRY52ET9z04tyfuFI22FlwpY8XqSehRUjQx?=
 =?us-ascii?Q?SeeJPguZuiLmxIRzql63xluRQT+MBVCnAJaxUhYozwpAGJHYtmSJIBhwieFN?=
 =?us-ascii?Q?2yKpTJXm576gSVGNzVuE7CLWz32M0viL/hgYlGhUML5yMJow9UHfuuYwkA26?=
 =?us-ascii?Q?ZCXaUCtFOSCmfBNmPZ12WVCaIsUCnkCguHIx9GRC/fSlM8630qMo8YaHKmb8?=
 =?us-ascii?Q?z6AQKYABXsII/eGL567m89qqNkd/jMEMsZVHa7eB1XlyISou5ldHPfH/3+F3?=
 =?us-ascii?Q?n1IvE5x6bR/BP8zFEtcHqTIQ+P0lWQ5XecLymwepsu2qaTu5kdzIWSHWaNG5?=
 =?us-ascii?Q?tDO+RE0ysUHwZ14aboxzF9kOCqYso70/RB4Ougx5pAFVVfRIVTh2omYAkq6k?=
 =?us-ascii?Q?x1Q/ZO81VxpMVGiVTfZdnmIQKB4Wvl5WqkuALn0yeDV5i/PF5MU/R8QX3L04?=
 =?us-ascii?Q?132nq803yDZoP4IaIy06zUTwXIMHSmoYNJTpEMbM5vON2CHwg2CpuCUxSIs0?=
 =?us-ascii?Q?ETd5k730kFHmF9e3FtXfXzbzaRVastQ/EMZNap4zK2iumQgwqxKUtLn22tBf?=
 =?us-ascii?Q?4KCHw0tnc9djM67xQSWZR8A=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8c689aa-64c0-4eb7-5165-08dd02b989fc
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2024 01:30:06.5117
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KyBqii4R4ORJXV3MJ6KnZv/z1m5qFlqLZAivf1IaIGWgjfp60Zji+7r2TXVtrZ+JQbBZ7l++9+Cff5uBtQNki0ZMJ2j6b8rMrCgeaP3C9CrOu4d5pOvN3i1rbPYIrwvt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6111


Hi Mark

> Original sample-card assumes SND_SOC_CLOCK_IN is used for
> snd_soc_dai_set_sysclk(), but someday, Codec uses SND_SOC_CLOCK_IN
> and CPU uses SND_SOC_CLOCK_OUT at hw_params(), and dai->clk_direction
> is used at simple_init_dai().
> 
> There is no uniformity today. Let's use dai->clk_direction for all cases.
> 
> Fortunately, almost all DAI doesn't care about "dir"
> (= SND_SOC_CLOCK_IN/OUT) in .set_sysclk callback function (which is called
> in snd_soc_dai_set_sysclk()), so this patch has no effect in such DAIs.
> 
> But this patch might breaks some existing Sound Card. Use
> "system-clock-direction-out" property if it needs to use SND_SOC_CLOCK_OUT
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
> Request to have Tested-by

I'm sorry. I notice this patch has bug.
Please drop this.


Thank you for your help !!

Best regards
---
Kuninori Morimoto
