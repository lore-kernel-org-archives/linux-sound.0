Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D27C2FFDFC
	for <linux-sound@vger.kernel.org>; Wed, 12 Aug 2026 07:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786519657; cv=fail; b=FioOmGdAKeGpE4COW9UgjiY1P2Lar2dzC92PtLfaj1Pf8BoQ9YIIwKL0bV2m8FBB1dKGwxZsNU0GZ6OfAj51QRxE8lzWglB7c6P6YGVTUnWcu+wEJS/7xeM6kAI3u0JWzft622Eby1j4BLFh4Gy7tVgDsTO40dluQvDo6ipQM+o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786519657; c=relaxed/simple;
	bh=JP9PEAOTPpWdHyUQZp8TZg/qNoH0cQr5CebftY+HYdU=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=YTzbLYK8sv0kfO+3IBE3ZhEIIG87EkToRL3EMGU4bIRuholwr42OLwXBXXGzgniuy4vBJRvtPiNeHjD77PaIk/DJn1wT+mkgTEPanS46/IqZ2B7OC3x5XCrZQvi7l7Eridf5owyEJ9hr/abDGbPFSnHXnDHWZBOGExOCmh+sAkg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HBZAdOgR; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HBZAdOgR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786519657; x=1818055657;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=JP9PEAOTPpWdHyUQZp8TZg/qNoH0cQr5CebftY+HYdU=;
  b=HBZAdOgREKmP5PuB+Ha0FuALeSGlJHkbQBF4dK9LvT2uE18JouDNzSFE
   wH384GsHN8gpAydzlPDj1nDSXT/Oi7iH67iimoLQJnZl9VkBiTYz0Oney
   2J5C84veE38wutYm5k2UJxsJcisxZVoQu2C81Cb8lfX75XnRtenUQvogj
   CUED1g+7gUfV4wpO+qgZYthR5VPBohyAasOhvro64VOdoerGSWRjqC7AV
   MeyvkSJbGGlka51GcbxJkPANKmpPeSFotHthYqDs6MhPCQW+gSDElJkac
   qa+POMt92hFZbfQyEp2t5z59L1xYo9CYQ0pALk2BXKD9RGDHZkcwTw0UM
   A==;
X-CSE-ConnectionGUID: koSDPVURS+ye0BczbJ2j1w==
X-CSE-MsgGUID: AWbkbMPgRbWJigOg5o2Urg==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="87276878"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; 
   d="scan'208";a="87276878"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 00:27:36 -0700
X-CSE-ConnectionGUID: ZCc7VHdVQLqMzH6TPWOiOA==
X-CSE-MsgGUID: jo/7m2KUTj6nmH1xH0OpBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; 
   d="scan'208";a="267824299"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 00:27:36 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 12 Aug 2026 00:27:35 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 12 Aug 2026 00:27:35 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.46) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 12 Aug 2026 00:27:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yVNW/+zXqqH4UCQrWExl1QAnTRWGYQOW4SbRZ/VlYoEvI6fvkNV/aH+HVLqhCdLV8jw0StCgyE5FoHK8kkruXa7ME1TJYzb4QPg4mFp5VhveKPZMvpLQ1oO9FQkOmPgky8DgwDrirelmIKv1h4FkIayZJfNHIJUgNHao+bl0/VFSGRS4DbP3APRckfkBRCGCx9Z7jU7iR29UMPgw6LtXdGBRfvOqaGv7AatJVPQCEUdWQ1Ky81ZqFmrDvSDrXkVQiGI4mTAAz01nIWPtQfnLl82EtDNQ7UI05gz1kMrXHaBrhoX2WWmLAgvGK7U/cP4agJa+cPuCDNqkgDI8z2xRNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AuEdWQRkcuZZdltggvGY7mVzzUjWmvPV0I1f12z2IEM=;
 b=J5RRG6fc6c0W3TtkkEWCLQP+ASkKbaM7w74e791VOyyHEjDthOLLabeWa+/SUASh0f4INk63l/OjpxAqdodTxcgbWNM/qQ5Z0PhN4NWfr5FVFMweUFTmFudNoor22lbgzwmCzJodc5P1aoVq1VFXVHx0c/AOs4A+1+1k0kllvL14bN4JjhPO4l4FCs4pwKD2WBFox/lEIB/qPpDcdeBKaPvko5x4bmb8/RQYX5sz1IrIokV9jhlEpgZ/7l2e+DuuFVANeM05p0dqeEZp+lmcwfNmMTYEXIoMxC67IIoIkUdSzggmrShlUlBVPectnpzFhUVWWe6TrWjeGDG9noRn2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6006.namprd11.prod.outlook.com (2603:10b6:510:1e1::13)
 by DM6PR11MB4513.namprd11.prod.outlook.com (2603:10b6:5:2a2::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Wed, 12 Aug
 2026 07:27:28 +0000
Received: from PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd]) by PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd%5]) with mapi id 15.21.0292.024; Wed, 12 Aug 2026
 07:27:28 +0000
Message-ID: <5491df9f-f531-40c6-9491-07241b0cc703@intel.com>
Date: Wed, 12 Aug 2026 09:27:21 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/14] ALSA: Drop __bitwise and __force prefix
To: Takashi Iwai <tiwai@suse.de>
CC: Fabio Estevam <festevam@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>,
	Mark Brown <broonie@kernel.org>, Nicolin Chen <nicoleotsuka@gmail.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
	<linux-sound@vger.kernel.org>
References: <20260812060557.80445-1-tiwai@suse.de>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20260812060557.80445-1-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI4PEPF0000014F.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:808:1::867) To PH7PR11MB6006.namprd11.prod.outlook.com
 (2603:10b6:510:1e1::13)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6006:EE_|DM6PR11MB4513:EE_
X-MS-Office365-Filtering-Correlation-Id: b7dd5b08-1ba6-4272-e497-08def8432992
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|6133799003|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: FA4CRR9XBc6FDoEhtbZuPYRq/vVr3i5oos0Mbcelslj2Dv7/KJFmSJC5RXXrIu6Yt4DC0fHnyRT3vGwjmG+Lf+/Vq1yoxKghnrNWjxOxR2NkxpuC/JVeBB8hjBla9PoqvxerYDPEXnpNe60UQf/8I5g91vtZK80aLgLEid+FJ0ZZnpMJHNH08kcSjowjw+OdkI2OrIOUyROrwRrpOIT2YZJ+LUuTQw45LeVcQJs1XgAcMJNO7jIOFrJyKOHheUunpPf5PQqrGLzRT7/7R34PiR2EQEq2K6nNsIyBXXrXHj/QZefVzFk+n+kvV1++MUzRSZFbv9xgDvgXIsIf94cLpSVOY7u35iRehycCYJxQFEPSBBUDDuUn8NvHE36Iuv1th9jHiehhCfRVtrVbALGtRlbnRaPCvufhEw3DUhSd4asGuSRH4S5Os+b/MaLl4r7AiVsZ2X7S1dYOSE4n5fz79F5nWw682ZXDBXtZRArbr0ajY4Ozu2KYx5Y2viiFgvhWz33T6WUK2qS6lBe2yKkZIIs+ghXOOwHoVBLbb1zzuFbxIVow2IV4UhX8OAd3gH9YEClVpSITB1hJlFB9TbBmPR39eQyFxP8F9aUMYwZvHKN/VhI2XwJuSR7nRI2+Fx2IA2RHkcCGFQO3a2/0S+kGNW+Xptiiyj1EwgcwskhicyY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(6133799003)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U3dEWTlhYnZwajVDRGdjVGxmTy9leUlOM2JjcHNwUlY2dVRuZWZZeksxRTh4?=
 =?utf-8?B?eDM0YktiaHlPd3FBaW9MYkxEc1o4YXRKYlJudzcxV2cwU216UVZjWi8vREJi?=
 =?utf-8?B?a29Vd0JOSEJKM2gvZHE2ZWM2MUZUOVAwNzNKY2RYdlovakhWeEFTV0FxZlpL?=
 =?utf-8?B?bEVtVitCUFhVd0l5bjhzNzFtWTlocENsY1JyRjg1ZmZ6OXdaQ3BpQkVyUUpr?=
 =?utf-8?B?WUNaeE5EQ1hScG5DdWs2T3Q4WU9QNG93YjZQZlBTZWJRT0lEY3B5WTZhbFpi?=
 =?utf-8?B?dE9KcE9WdFo2L3IwTW1GYTc0YWFRRkt3ZTU1aDJjcHIvUnhkeUFQUkh3VThs?=
 =?utf-8?B?anlpK3g2cVdTY3JKSVh6YmhCTEFQaGQwL1JTVmYvVUloREltZXE4ZGxXcXRv?=
 =?utf-8?B?ZStuTTdiUyttN2JGdlZVRkMvb1NJVDZCNWs2K05ONC94ZlhSemhVZEI3RmJI?=
 =?utf-8?B?c2FLd3VaTExOdE9qYlNiRGlRbitXMjVkeXkrYjVjbzB3WGNIWGtOeXlXQk0r?=
 =?utf-8?B?WDhPd01leGdUbXhGcjNXWjg3RENYQXgyMVVyUEF1SGx4WjB1QVhpM1E3RkRa?=
 =?utf-8?B?aXdENDZKNzFsVlo4aWtLb0R6UW1hTmkzSExiVGdNaUFnUXBvMEx2eDMvNGJI?=
 =?utf-8?B?TTdWR1R4SXdmVTdReDJtNjF6U21ocFIxYm5udE5oZ0JkS1U0SFM3Znc3dzV0?=
 =?utf-8?B?Y09MbERoc0Q5dzFCVXlNTURhSkp6UW01Y2pIdEFKa3RJSW9kZzhzQ1ZIN2pq?=
 =?utf-8?B?ZzgyKytuWjcwczF6a2tOVnFrTGFpdHlRZ2MvSUFjY1lZN2gvZ0g4aTl6NDZs?=
 =?utf-8?B?RWJ6WnlpWmdOMXoxd1hFUjNOUHNoQjJSbm51bE5JZ1N0VXNjOHpQN1V3V1l4?=
 =?utf-8?B?VlFKdnUwYUhBenQvdkRrd29sWlhWbFhvTjA2dllkekdQVUZaeXM5UllLazRt?=
 =?utf-8?B?SFhUK0wxakttTitrMkVMQjM4am1RL3d6ckk0bU9kRE9ZeklPVnEwTW91RENX?=
 =?utf-8?B?c0hMVUZlVjNGU0s1MExxcUc5bnF0VUlWWHRvVjRmNXhOayt4d0hvYW5VTHRT?=
 =?utf-8?B?RnFBME1wa0FoekcvOE9oYkpRa0NsWWlaK1h6ZFNkeW80NkVHMmJZc21tS2pk?=
 =?utf-8?B?YzBpak15cHlJVGdMaEJBMmZEdFhvTFdmQmdMK0pITHJmckFHd2JLOFRsQVVa?=
 =?utf-8?B?OEZKdXVFRFVERGNrZ20zTlczMjZ2UW9oNzQ1WURsejZOMlhMMlZnUk5MVEdo?=
 =?utf-8?B?QXZKR2VtZjg2M1lLM2cxWTN4RmtIL1BZWmQ2a2RRcHU0emJ2Njh4MUkwV0JN?=
 =?utf-8?B?K3hZK0pMT2V0YjBPK2RsaE02NXU4b1JQSXZCWERSUzVUenY2amVtZmE3VVor?=
 =?utf-8?B?VUVFS1BKQ3AzUk1uY1N2Q01oSDVWR1dRQmp1cGdNYUZNMnJ0RUJmVWgvb3Vp?=
 =?utf-8?B?S3pSZmMxQVZxS3RhVVBMdUhaVzM0bENCc25za0lkVlAzeDhYc0srMzArUEtr?=
 =?utf-8?B?ZFlvcU5WMXA5SVU1ekhJRHZNKzBnZFJyTDRTSStJN2NsS3JQdVpOVllJc0Yy?=
 =?utf-8?B?bFE4Smp0d0ZJUHRhcWhwV2V4YWVYVGQwRTJ3aytTWWxjY2tkSFF0WUhNVmdk?=
 =?utf-8?B?QVZLVFdnTFJUR0V3dDhJT3VnL3pSTVlJWEdZSjB2blJRNFQ5amhmbXZVZ2ZB?=
 =?utf-8?B?eUtvVGcvSTFObnJWaGpYNTU0c05rSGVqcDhwZnl2Nlc5dk5DRHlGcjhqSTU2?=
 =?utf-8?B?dEtQQ0dMeFFQRzVNQTkvQUR5QTRWUjdyT1duTXRiSTg2dWt6QlIwTnFDc0U5?=
 =?utf-8?B?ZmZQY0YrbHVldVBXZEZMRnZOOGNYeFhOY3J4UzBOcGIrWGNmVlNOeGxmNWV3?=
 =?utf-8?B?YitBTkhDTWNZWFpORmliZURuMGVkdmVaZkI1dTFMMHpTY0ZaZk4vSlNyTm92?=
 =?utf-8?B?cFB2ak1vaFJTaTlKWFN0ZmZjOWpZYnhzVXpiSWlYTTZUdWsvelZTUStGMHpX?=
 =?utf-8?B?alVvK1lZQ2pkSGJheWpWRE16YVE0MXZ3S2gvdmFtMVJxS0NDVm1ydlpWb3Fr?=
 =?utf-8?B?aTZPUE5OSS9nL2Vzd2tITnc3WUMyY0ErL20rTFBtUVJiV3dLeWltS2RUSk4x?=
 =?utf-8?B?ZDFVQW10Ymxxa3pnQWd1c0hodEhoVEtoODhiVG95emhzTVdZYWRGdWJ5NlB2?=
 =?utf-8?B?cUdLQTd4eE43bTBlMjR3cU54M2l5bnR6U3ZmTXZ3Q0sydHJVSUNVdDFLMFFl?=
 =?utf-8?B?RVdWYlhRdlErNDFURjVpOGVqLzBJTEdBeFQ0Q3hqVG5qYkFOdFQwbkhFK2x2?=
 =?utf-8?B?RnZPcU9Oakx6d3Awa2YwUG1TZ1dBWkRKdUo0SldLayt1ZEN4NHUvZz09?=
X-Exchange-RoutingPolicyChecked: fbaG3TbSrKvGrjpldrGItFzixGdcW6JnOU37CDFsbAxI3jXO4WinDIHPfLwzBZt1k6+GNv1CGiEXhCQ08c3MVMQ8YRZDIXUbjhgmlO7pm51c0WIcct6mgWqcYZD6Ji6DNcgt4X8gG9zvvPa4L2f0OiSnQGEgcYo5oIv5P0ZTvY3vVGTfSO5iKfXga2BJryNUuo56L/N2uWbwV0v5V+3OMtjwkCbLWa8L8yMCf894SNOUvWAkR/MUE6FIbBBXKQwxslLddlsXokFz5Wol230tx0fAu98wi7X90HthJCK2biG1mb7Yhm4dafDl+QAoEmGFIhnPlj5ucSgada0bM/vB4w==
X-MS-Exchange-CrossTenant-Network-Message-Id: b7dd5b08-1ba6-4272-e497-08def8432992
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 07:27:27.9914
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9w6x9tDdj/cXCuGqcPBuCXc6TdVL7AssOxcXnnQoPIwO33xQcKjRnDM/cUPnpTBKePiOWa7RzYTjKTuqYlDmHrEjCNeGyYbGP/EkV77W7MI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4513
X-OriginatorOrg: intel.com

On 8/12/2026 8:04 AM, Takashi Iwai wrote:
> Hi,
> 
> this is a series of cleanup patches to kill the infamous __bitwise and
> __force prefix usage for some PCM and control parameter types.
> They were added ages ago just for code safety, but its effect is quite
> limited, while the drawback is significant.  Let's drop them.
Thank you for cleaning this up. For the series:

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>


sidetopic: Had to review via web browser as only 2 patches (00 and 12) 
went through to my inbox for whatever reason.

Kind regards,
Czarek
