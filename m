Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.135.77
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794488316;
	b=pyt/yYsidLU5u2O2Aj2GwQ7D01btjUhoTYDgaUNAzTRPNvv97j6VpcvSab+D3Wx9wP/i
	 RurydQc72gBl/WCf+tdalesqjqNjPJWhitHJC6WHeXa7PSPWc5oBJ75VFC/vM4zMwntbX
	 chbkuu/EhS+AybvT1Nf4xPe5o99nRSzkdzqToOwwwBXojdW7JOyadWOEbApnAWyBnOCU5
	 2rBhFKPRFbSYLhKnsjMacai+T0vRUDvoNMql3OFfdyzRSBnryDPONe91lH2bCaB5KYewO
	 D+JqoIyZh+SgvDE5AT3ts/+krJIsM3bBekKiFIdStjIZ8PEX3GSTZPo4G1HfWON6XPg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794488316;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZafvkWGvpMFH+Vqk72vw0hcvwowDIJ//nKQclnVlZS8=;
	b=07wdtFF3dl85nx+e+GoYjCWudkOK2TeHJqvGUoTOS1ZYf6WDMLbGS7PBQrOUTAmzuyfB
	 IgVv9HqFEj1iFA8gBrd61BhsITz2RjWwV9v6jHVrojOYQoPBMGRBN2iGts8rk9OkEccX/
	 U9MH7toyCZ+Zmtp+L+pbfNI06jT2PFvAl2YVm0D8USMk+/Ua7nVxbYm2BckmFTMEktub7
	 fpAaBsav9t8jTgqafWn0x9GfWjHNdup2QxQggpDkNdUuKJWAvj30GOxB0ERSz7ScK0sXp
	 NBGGUVJXl4oxp1v5pD7PXCd7jSZBIGsfqYli892cEfcBgxeX3ZFSprP3q5eCGQiR+BA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=analog.com;
	spf=pass smtp.mailfrom=analog.com;
	dkim=pass header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=VedfJVtf;
	dkim=pass header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=rd6CwU1Q;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.135.77
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99864606A31C
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 12:58:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99864606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=VedfJVtf;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=rd6CwU1Q
Received: from pps.filterd (m0516787.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACCZR8X1090870;
	Thu, 12 Nov 2026 07:58:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	DKIM; bh=ZafvkWGvpMFH+Vqk72vw0hcvwowDIJ//nKQclnVlZS8=; b=VedfJVt
	fybBOF1hWEGxpaszutsABBg5AZTfclPpN6I8PzOeebTcr1hXTiFpLSzz0/LHzDcn
	2KMm1iCK+3Wwep8OqtKoGzRF1avdyRoAANJ4A/o6ROkgeL6zoYvGZEz3CzkuPKDN
	m8wWai3Awg+oDyr77mnhlWP5wi2lyTV7TCoeEV+H3RUbXH+Jd8aC4jiJCRcZWHiN
	vSU49Ma0dQ+O51i7xgoLQDqPbmg6Omi5xFDHfOtngo3y5qxo6pUx6jggz9Rp1XtV
	IVJcrSbNZEtoYbAxCoyp7c9Aaysm33fVkPrniPiLPJGF/GGMyEyu2GQoFrpSgAkA
	e1tkCJVTT6NiEjQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=Zafvk
	WGvpMFH+Vqk72vw0hcvwowDIJ//nKQclnVlZS8=; b=rd6CwU1QBEPybxFOGUrIh
	ttg01pFwLQwjZbO8vsx1vsSn4zR9OddB/7AsTySQOJYKCqr/yDutls62VuNY3/cB
	70Ve5Oow/63efA06XlQfJi42LxiNsvmDj04j6Nsp+pJwn9JYH+/UtG9SffV104S0
	Ak1zL4G97piVfRUvVfKbs2PFpDNYov9rFXgtPzZWW3Vvl3+2BEpp6M8xThTNl3vx
	Dws2AqwEicR5b7MvmWoUMMJgJKkoExwl+H/Ct9WvlG7qPNK+PimI04Qeh+l8GKSb
	G3lzDarz/P8ZigCcXFpl1WgQ9vQdw4bc7GyCbOR0sgO9IdIX3PGyXNVMw4knX5tC
	A==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010063.outbound.protection.outlook.com [52.101.46.63])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4hvw1pddyw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 12 Nov 2026 07:58:25 -0500 (EST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G17ZbKvC+LDLeMlsR7pOzCmSAC5XGGN8cA4syOyB1VOFRLaUnfDXVJAQ5AVYtUQyIJUSp+56ai7IupfWlgkXQfTLl1irDctxfVb7HBDps+guNlSL0dUF17eGxpG/by3P16Z78GElaGfS1ayDUq9n8uDL6wRLrr3K0wME9aPupjw5FV/0Fx+n57ML+ozTqICuOk5NIeLQhG0hZo5Xm5Yax7O5gp1ibo0I6lSD1R0sld/Uv//4Tj+/0t88cKpy25yEd+DxOfb0APRQXatjYx3Dc9zJrXEO7OXEqbWDlMoIV+1NsOJQaTWAwj8HQiUw0b+7/s0ZEowgwbzJQCfTTOy4Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZafvkWGvpMFH+Vqk72vw0hcvwowDIJ//nKQclnVlZS8=;
 b=UWm88tOqi2a9+jG7i/9Awc5XXM9dxuiFKhTKtFjqnMNwsFrq7WpLAE4zBxkeoR6pGnNSZDSFMWCakB36355SRonm11YS/w1ZvPgj6FuD/+MKW3/TZH7V1S042qvCvt5aOM9X1qxIWsmRWuS3Zbxs9YdY59BF564FMbBefKQMrPeP6mfOTWpYoJTx8x6Q6UH1hNsDY1UE7UBdsbAUGKVQGqr6pK76+intlXngtz+npdjPBWE1yf5Pg14Vcdd0wZrZvPxLOmCzr3iot4xd1b8aoebAJtoTyha+xwnvIKY3qCSTeLXRR36rBc32b5z6FnYs4LRvTqU5GTrCtjeP5U7aig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analog.com;
Received: from BN9PR03MB5977.namprd03.prod.outlook.com (2603:10b6:408:132::11)
 by IA3PR03MB8476.namprd03.prod.outlook.com (2603:10b6:208:546::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Thu, 12 Nov
 2026 12:58:23 +0000
Received: from BN9PR03MB5977.namprd03.prod.outlook.com
 ([fe80::9687:b756:5de3:28f3]) by BN9PR03MB5977.namprd03.prod.outlook.com
 ([fe80::9687:b756:5de3:28f3%6]) with mapi id 15.21.0615.009; Thu, 12 Nov 2026
 12:58:23 +0000
Date: Thu, 12 Nov 2026 13:58:20 +0100
From: Alvin =?utf-8?Q?=C5=A0ipraga?= <alvin.sipraga@analog.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 04/27] ASoC: soc-component: rename
 snd_soc_component_regmap_cache_sync()
Message-ID: <avW34QMe1ZgB9UWn@analog.com>
References: <87zeve28ol.wl-kuninori.morimoto.gx@renesas.com>
 <87tslm28mf.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87tslm28mf.wl-kuninori.morimoto.gx@renesas.com>
X-ClientProxiedBy: MM0P280CA0111.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:9::24) To DM4PR03MB5981.namprd03.prod.outlook.com
 (2603:10b6:5:388::24)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR03MB5977:EE_|IA3PR03MB8476:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a7cad55-2d54-4cff-fc69-08df40bca26c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|10067099003|11063799006|4143699003|56012099006|261026121527099003|261021123027099003|261021121427099003|261102123227099003|261009223027099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	fpUrnqg8VXrGG/bAucl5rZ9RADIkkbCzcUPT/bHPBsKDScxRe0V51oD7wkUuDm6IDJ0XzeZdcpCztntDulAVWj8G7YaeEvE8rsqV0jOdHP5Hw5k/AGZhohKtY3DHkNHeL1IwtV8qzDMb87OIt33jiYkcPtceo9nsuN6ZahWOaw4sLsA4yEx0RVT7jUZRlG7VFUAa9gNgy2wMG4xdiDbxWpnrTmS7pVdEDcikrwHJY3ewLeCy80JOfq/gq3LaHq9KevPat0ZVaVAOhsPyP5Cf089zsYsEZ1BakPa1CBwWkVRd391uz0q2onmYc5c+r+p1bLZ2Mfh7PxUk9ijP5vuipWpYyVQnw7e6IV3DwRVQ5PQJAVCgDlx4VCS8th22AaOB2Xv/v2O/uRWKCoQ7MeNxWj9Syfunte6wPqFfD0/XwcQNiHbo9lWyfrDe26yzdV4vj7UehTEcwrMtiD7t4jxW7bZq1A7psbMp+8GhEHiGH3WzCaYzvwnNU6Lt5P7K+9Z2mBrF1jAkj4l78NJdeMwDWwBN74aL8kD0ZXRUwsLOAYqf4reqAA/89s6wkCpdNuK2fzf4bafadPiY9LRZMeREWjv/XT+ER3FAmQu+KhE6S7N3h+pXuhwd5bLawegMhzMSD5r+akCIKHyYsIoX6gTbprO8/ugJpwES7Txu5UlgoYU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR03MB5977.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(10067099003)(11063799006)(4143699003)(56012099006)(261026121527099003)(261021123027099003)(261021121427099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?THJROWlsQTVNQ28wQkltcVpzUXkwQ3JSTjZoNnE1UVVsTFpraThYQ0ZqQ2tQ?=
 =?utf-8?B?ekg0QnVya3M2SDRYUjhDNE9VQ055MjM2c3RKZ2VGckNTYmFFcG5vYUxVMzlV?=
 =?utf-8?B?eERLbWhRejM4K2cveUJJaFQ1NS9malJCTkgwYjd6R1pYV1cwaithY1hNQURE?=
 =?utf-8?B?dUZJZ3BCTVRHVVkxeFhybysyQU9PUm4zYjI3c0VScG9mbERuQURSS21tamlI?=
 =?utf-8?B?cGFNelhQYkRLSE4wd29hK2tKT0pkWkM4RlN5Z2x0M2NuenlnZTNnOStNSzhj?=
 =?utf-8?B?ZURtZEVqRHMweUE3aDRWUTlkQURhK0RSeHRnT0hYdkJCL1p1TnB2UUdWQlAr?=
 =?utf-8?B?cHBKbXdYQnpSUUdoSGQ5c01nQkZ1SFFIcVVpVWFOOFllWlYvTStRUktDOW9T?=
 =?utf-8?B?QVZiVDFweENtWnhtZzNlQkphL3B6NUQxTlBHUGoyM1krUFBYOWw5OEhqSzBk?=
 =?utf-8?B?c0g4VFlQS0dnMkpUWjIyUGhGUTc2RnZoMmNEVDc3OHZtS251YmxuZUNQZDdY?=
 =?utf-8?B?Q0dhNmVBc1JFaFZJcTlEbUFZK2xXYS8ycEwvbW1PbUdkNTZPV3BtaHAyWUha?=
 =?utf-8?B?ZlhLM3FtMjJ1SFdTYzlCRUVRT2dGNDhMemJnd3FzeXhuUU4yWnR4d0JwUHpW?=
 =?utf-8?B?aDJieXZUdWx0VzQ4dS84aHpmRXhNSzh0NWJ4NFh5UmNUYk9ienJUVjhFU0dE?=
 =?utf-8?B?WmlVWS8xdnFFUllQOE5qWUpPMUEzWDR5TVd4dnVvT205UlE5d01LeDhNdlNm?=
 =?utf-8?B?QzhuNDR0L2hBY0ErK1JBWUthSGU3WFlIWnRFRjVsaWtkcUxucjVSeTY1ZHcw?=
 =?utf-8?B?dUJKcmEwQ0JVZG5ZeURWVmhId1JqaFluMDZGOW1FYWY5RHJyYjM3dms4TVJO?=
 =?utf-8?B?Y3hvWEx3OHYwMDBGa2NKcTNCa1B2VFFyWVBxZ2RrUFBLaTR2NVliOEVBMnVK?=
 =?utf-8?B?T2R4SCsyZmZZZEFMZmhkMkFoYk1tQ0NBYzRNdlU3MU4wZlZRNXhzNTh0aGZU?=
 =?utf-8?B?MlgzQ3VmRGU4dXlzT1R0SlpIV21hZEVDWWNSYUtrNlNNaUxPSVhsdkpKNDFD?=
 =?utf-8?B?aTJnZ2M1TkQ5MUEyeFA0ZVBxbFI2UEJKQS9OU2VYUnJMb0lKVDdjU3QxbXdG?=
 =?utf-8?B?dXZxN3VmRVNLdkpuUUdhTEJKNVNuRW5jZklkaTlaWXM4R09kMGVxb2Y2Zjk1?=
 =?utf-8?B?c0ZURFlLc2ltNWhGWWkvbEtOWk51S1NIR21YWXRXRnZKSGxqYWxEd2ZQcGs1?=
 =?utf-8?B?WCt5aFJpUFhGMTI0Ukl1ay9IOWZTRm1HSzZhVkZnNmJ5WGJodDNVYVRWOTlK?=
 =?utf-8?B?SlNLcERleVB5Q2cxSDZTdXNHVXIxZEE5ZlpsMmViWlNQczhraSt3akRZd2ZH?=
 =?utf-8?B?S0I0cTJxMEVENzI0eWtvY0lUaXg2TEJIcjdzYWZ6ems3RGt6S1pXbytuWXU4?=
 =?utf-8?B?MEE4elAzNSt3Q3JlckNaR1laOW9ITWw2RmtyVk5wNnhtTm1rcmRMOEd0NDVl?=
 =?utf-8?B?NGIzR0E1UnZId1RHYlRWZENiaCsxbVdnVzVkcUcySlRCVXIwSEVEWDZlVXA2?=
 =?utf-8?B?djlyZVdGMnpJM1pTZ3ZzN0VveUx5QnVhZVhRZkkwQ3UveDZQejEyT2RtN3R2?=
 =?utf-8?B?ME9UM3ZkdFU0a29xTS9CcEpRZjhiUy96Q2ZBR0NkQStza0w1azBrYmI0cGNa?=
 =?utf-8?B?Z3JPN1AzVWM1bm9kSTFCK1Vhck9UOUlaZ0xXWlhOakZrQ3FTZlRSbFFsV01R?=
 =?utf-8?B?VUFSZm9jMzNCZHJJYmlHZDdLUzY5ekh1WTdQak1BL0pScDI2cWIxZUlDQUN3?=
 =?utf-8?B?amhLblZqZjUvWHFyL056d1B2d0huOTE5MDkySGM0S0UxSWhpODk0WVpHMWZS?=
 =?utf-8?B?Rmo2YkVhbTFsYW1RSG9lS29jNFRJY2V6S3RqQUlQVm9ZQWN4ZnlobExGdmRv?=
 =?utf-8?B?QkwzNnFEY2E4RHU0citXSEFiWnUvVE8rU3JzcFZURmFOWVpTM1ZjQVRuRFpD?=
 =?utf-8?B?ZVZFdW5zTmFSTEIzSm5pcnlwUTh1Zk9qVWFwL1FIWlpxeGdPWVkvcVZNaXRO?=
 =?utf-8?B?QkJGdHFSVWZIa2hidkNrRHR1bHVNVWEyQVBTNGtheDlySGJ5clYzZ0pqQ0Zp?=
 =?utf-8?B?L1pBQ2wxNE4vMjRwNTNONHdnUlJpUnBwanBlTHRqZWZERlRIeU4wNDBxa3JU?=
 =?utf-8?B?UllPVkU3RGtaU3VpeGNIYWkvMXVlZGt2RlZIS3kzcmJyT3RKWWgrbm1DWWdi?=
 =?utf-8?B?bkFJaHA1WTcvWHZiVjIrVG5WZUQ0QS9ia2dUcng3N0VFNGpBb0FQTzhFcUZy?=
 =?utf-8?B?YWI4dXhQZ3F4aGZTZWhnVEVaNGU1VGpncDFsZFhScTkxbnNYaDZKQT09?=
X-Exchange-RoutingPolicyChecked:
	bXKlGv8tgICyy8clc5ctfWYJ6KHYtLEcl9HsFzSP+DaSkm2lvIpFFkzyD3b9U+z4xVJysUtuxh4nqfgbYBT7EkjapXSviKF2hdjK3WKyabxz4uFNjuZi/NVWYtQtuXO1npRF5LnOV6seRtiQLwPq9Yt34hUPrWydxMFHWkZM+5ANtm8OmcO6nSDMYTQlAnrjb5vPtsH0WAFI1WFPrhkin1CwK8zLjvUoVrBkinqkfDgiF4WasM7EQj3L9p8XXcqZquCZkxZAGyJMht5+WES1y8cqdIW46Hlyii0sdmN2rA2dumP6yS5ICYV4AI88i+p1HaVymSb2zOt2w+vT4NSZqA==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a7cad55-2d54-4cff-fc69-08df40bca26c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR03MB5981.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 12:58:23.6835
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VtK7ycWDqse1M2gLdQRJJVPJKIm/1C7m9KnAcblQ8r6jUTXVL9krbfgpjp7GzPn5/FNSJDB7rwSIiLlGiAHc6CFU1ekdfXypItRREodKd1I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR03MB8476
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA1MSBTYWx0ZWRfX+b8iGmCW78Vl
 yFlcvYkww9+xGpY/MjdFqSJNkcZqz6YHC2KVa3a6QohFSDSdcNuhbIQrMV1GN90KpOoM2vLKIj7
 OKDeXgH5rzumhIePciWsBv35vBSCtu4aXJejoBiz/ExaKUmvcOeB
X-Authority-Analysis: v=2.4 cv=N468hG9B c=1 sm=1 tr=0 ts=6af5b7f1 cx=c_pps
 a=lvbo/KN+lEuTaduVXZ84Bg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=OmVn7CZJonkx5R5zMQLL:22
 a=yC-0_ovQAAAA:8 a=gAnH3GRIAAAA:8 a=6uJFC8Y6uvhcg7vrqDYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA1MSBTYWx0ZWRfX47XwAa2p7qVq
 9hbhSizAT0P9V0WBuebOlxnw5HwIC0JobBh3DDA3KDtzNS9MWv/uwg7x+RHtFVysS/lf/xVcyzW
 K1WnLGi4VszPMbLHmGdigxPUYEmoTyaHSk5ScFFV6qwJ+DuZ0RsuL98Dv47Or8rOBUz638eqO9C
 TAKdIjATFfkFFuqOdai04GIrtg/DIPybGeaeMQqaMI/fmVFCQuFPTSNPoDEwrtm45Ix3ePwAE50
 alvztlVpCehoFBo4rw4OX15Awc289IZubw3QeD9FFkwGOIdrEmCWLFJ12RT2CNqqyCZ2gigtwUq
 44okIOs+zJmrxAnbiO1raoFjbfqk9szfWgwKO49J+i76h122tcXzE0hyGhagwkb26YpNZ/uRbKF
 xyf8JRC1AB/wSFNFtcZDyUYW7579uUKea7XX6g0enZ/TojN7E9WQWhuzOyqHljwS/Wdj/eho5mK
 yfzOlrbqPfukaQcSE/w==
X-Proofpoint-GUID: 2idbZMAiCySNG2FzKJ2f6cxbldGU1Is2
X-Proofpoint-ORIG-GUID: 2idbZMAiCySNG2FzKJ2f6cxbldGU1Is2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120051

On Thu, Nov 12, 2026 at 12:31:20AM +0000, Kuninori Morimoto wrote:
> snd_soc_component_regmap_cache_sync() (A) calls regcache_sync() (B)
> 
> (A)	snd_soc_component_regmap_cache_sync()
> (B)			  reg    cache_sync()
> 
> Let's align the function name to original function.
> 
> There is no snd_soc_component_regmap_cache_sync() user yet
> (function name change will be happen later when all new functions were
> ready to use). Don't need to care re-rename the function name in macro.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Alvin Šipraga <alvin.sipraga@analog.com>

> ---
>  include/sound/soc-component.h | 4 ++--
>  sound/soc/soc-component.c     | 6 +++---
>  2 files changed, 5 insertions(+), 5 deletions(-)
