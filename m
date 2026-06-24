Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A09F397E8B;
	Wed, 24 Jun 2026 08:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782291287; cv=fail; b=RQTqjLoIwaSx6YUpbwzGgXZKU0Si1q2P6AANC/pE7FvRgG0uWXhaFxYlUs8wIEUqMXhwD6fApjxohkX1muUKh6cjDnPS5iemCAz6WxKSW8Q2CNFXAFH0ftfkkLQLO2MFE2TAcf2X+I2HjZY9Y++T5jTvo14dWKwDJDKD2G9rMRI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782291287; c=relaxed/simple;
	bh=d7IeEYdCl08YrzFdLODeanWp5DyyXz39COZleFEVZS0=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=a8KVut7AmDOS5z2Ybibubjuz4Nt/L0yS3yuGqqd3rimfiIN7UyYfRqFm03hZUoQ9+yB7gURl8adJJsLqisH+KgbHWjCreEbvZRBbtQ/Bwn13xlfWhGZWMSJQf4cTCNn3FU2FF+chcE8eTlwchBHhZDewXQRzYn4nL9d1WgMGYTQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gyON9qaI; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gyON9qaI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782291286; x=1813827286;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=d7IeEYdCl08YrzFdLODeanWp5DyyXz39COZleFEVZS0=;
  b=gyON9qaIJ0Vp3kWxbH9+c3QqEMZxfL+RGgw/zzcmXSYPJ5FrMO0qSzis
   xbZS7UQCsHpumbP/5FAXgNjKzIQMk2tbXzmUWUIC/+9OZ2gC5u/LEEAfr
   /8dOiJbr0oJS/jnJbGbxw8YFeQLwow2k7EOlDBtx4t5XOqcjDxyXqqyOQ
   G1T0+/SNPgLUv+kTgIhqz5oYus6fEWZxHhZqGVo6rTNHY7NRtq0sAUmsm
   YycYj4nO2QXlvUWxjN8kD5KJqHceyj7NRTEhQBLdHPDhWH36nENtjx1hn
   oNhElRtuuz3ACaGlrvHxklkvMl6kc+ByzJd/+s6UPqdbk5P56JT/ot7ZB
   Q==;
X-CSE-ConnectionGUID: 02/ZliWRRs+beODq80D9BQ==
X-CSE-MsgGUID: /s5ueSjAS9GzlGd5TuhipQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="108596423"
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; 
   d="scan'208";a="108596423"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2026 01:54:45 -0700
X-CSE-ConnectionGUID: mlHroEHWRreX3qmuRIrdpA==
X-CSE-MsgGUID: DALiQd3IROqS2f07c9nbTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; 
   d="scan'208";a="247416150"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2026 01:54:45 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 24 Jun 2026 01:54:45 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 24 Jun 2026 01:54:45 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.67) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 24 Jun 2026 01:54:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MG8ZFqrfRSxZ7Rq3jH1o6YiS7dN+MMBuIGoujKHCnv/RC7LZWsEJoc/HeZFAMWg0iR8Ll1ZpiAbhasUF45jPeMKnUmN4met0k2QoVbe7BiFeSaQkHbjNBF7NU26GqFZ7mm/zNyA4H8jzMTJKHdAAT8jK9JzFNJPeSgWyzgd0Q4omQ8SMoCtljiZWTm+AMve5ApEhhC8K++NzhqwcN5iQ1mpYJb5TsSLNapTHsI/sztV2IBaPhv8bIVj/eEMLyAVbBsBnO7QwuLuuYMf8Ne0gegwWS1dO8Pw2RtntiekkCR5xc8ESA+Y019lRhhSd9CObIRGT8OnZobxaI38NXgMb5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pBe2VveU8Z6BtOY10WVx3zxCafb8Twchbg7uwk5AAys=;
 b=bgvClB80DymRSZxu14O/a6WOEcE85PxTM/FJx9VEFtBUjaQZj++1M3rDYd7DmjcujmRjmtQTsKDlyyeHj42KFGbV7zeNURCS6h4/AxlHAruhWleAsWvJAbAAMZVbTHExfwlBB8RxeOxcTQzvUntxkhqPyD0RdD+0eiVB5xNMXEOH8rVdVoAmwOLSHpZWeca2e+ZM+CAXzf5PfmU/sJJ7pj6Sni7KIbHQIB6BuLw6+WDTN0W6QygBj/W/3GYIGL8Z3xCiWA4Y0APGCwK0VmwSJWRprXexhNNfxltnrH/2JNLoMEice2clYG5G/s/Zi1lTQ/XC+chaC09tF/QVwRVjCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6967.namprd11.prod.outlook.com (2603:10b6:806:2bb::15)
 by CY8PR11MB6937.namprd11.prod.outlook.com (2603:10b6:930:5b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Wed, 24 Jun
 2026 08:54:42 +0000
Received: from SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4]) by SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4%3]) with mapi id 15.21.0159.013; Wed, 24 Jun 2026
 08:54:42 +0000
Message-ID: <ad96abd2-dd6b-4fdd-8033-bda4e1389884@intel.com>
Date: Wed, 24 Jun 2026 10:54:37 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] ASoC: Intel: atom: Use guard() for locking
To: Bui Duc Phuc <phucduc.bui@gmail.com>
CC: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Peter
 Ujfalusi" <peter.ujfalusi@linux.intel.com>, Bard Liao
	<yung-chuan.liao@linux.intel.com>, Kai Vehmanen
	<kai.vehmanen@linux.intel.com>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.dev>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>, "Liam
 Girdwood" <liam.r.girdwood@linux.intel.com>
References: <20260623105721.25865-1-phucduc.bui@gmail.com>
 <20260623105721.25865-6-phucduc.bui@gmail.com>
 <b73445f3-899f-45f1-b450-8031044b5ff7@intel.com>
 <CAABR9nEWAcwTBet022zyDJPFVc55q4xZR7y8HNzc_x3WeCPtRA@mail.gmail.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <CAABR9nEWAcwTBet022zyDJPFVc55q4xZR7y8HNzc_x3WeCPtRA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0902CA0058.eurprd09.prod.outlook.com
 (2603:10a6:802:1::47) To SA1PR11MB6967.namprd11.prod.outlook.com
 (2603:10b6:806:2bb::15)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6967:EE_|CY8PR11MB6937:EE_
X-MS-Office365-Filtering-Correlation-Id: 00f9771e-984f-4008-fffe-08ded1ce3b71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|7416014|1800799024|23010399003|18002099003|22082099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: 1utzDDEk5oao8UuyKdBVXPrZGobqpnvsRIC1v9p+KPvsqTvfrSkL+bZVPTDXdN3As9wPdpS5AP0RT0usw4+6TJ4Y9LU4k+83cK51S9QaIdz5alV274lCfN53KsQbCQHITSLadPzTVxIydKRa9HQ/mHH8+AJu0/xpDEo33eT+SVrO5IWmHgyck12rWyTTb/kcG+OVH8PNRTpRXjYCouqaXQoT0sIpohGy5a/UMqmN1dMgYBgUEL/Zj6M82PQwf0savwXnA6q6sJHVbG7xYtN98pqQ8arudhqdTdxr0WK3Z4SUcUO1Mr+y5vdWhVvePZfpGf142EY8TVA6PGJKQL9qh8Uz2lcXrTuiyMPNh8Ratz3ZES7P6ltu/uQ1c51+U9tgZe3NA0eoI58TV5TFUvYmgEilOtdrQMF89vaCwOil9UQJ2dPR/wWAe6qaLO1g8N7LJG90f+6MwVyFHNB0uFOgeHkJv2/LiOJaq75RUxsOIZVDFBo9EQjepy9+5V/+Rb6ebF9K13WHjxXKOgSIE22J6h1JR5GvStXcS1LEVed9bZADX3BPtG36YKCWy+w+4eUXB3qU3zPbr04urxwo3pHWzqao0Y4L2xU+R8cm09pHWh7hVoSxL4CQ05j5Yl0CUtH9/0lIjquIagnWKJIqIYDN8dg0mtXFyBeYhhxXvpy6+2k=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB6967.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024)(23010399003)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MVRJWGxUVTlIY2ZNRWw2Y285Vm5VQWZiVUx0d0ZMQmxhMUQ4cU5CZi9BQ3RP?=
 =?utf-8?B?TGc4NWFrWEQ3bzROREl4SGJLWXlUN0o3NTErSUVtbzB1alZEOHNCemhPeHhH?=
 =?utf-8?B?QWxQMWRjU0x4cFBNMUpmQy94S2VlOG5yY2wxeHFDSVZORXg2VVFuMmtNVWNs?=
 =?utf-8?B?dmdKQ3ZEODZLV3pNbDNRMzk4cmpzZjQ0ZU14aE0xNFFhdnQyeWdERi9NV29z?=
 =?utf-8?B?MnBQWUQya1pGeHpoK0h4dnlaMmpQTnhWKzRYSUxOMDJHOEcvNm1vV0NCcEhm?=
 =?utf-8?B?TUtMU0lvN2w0NlhDOGpkRGNibVhabWJvYSt0VDR4Uk5HV0F3VzFYUHkzZFFV?=
 =?utf-8?B?NXpUaXRqMlFuMFRFMitDK2JueFQ1NndnOWIxeVd2TDZCODREMkF5bjZ0TXlw?=
 =?utf-8?B?eUtwaWkwUU5DUFhxVTQ4YjlIZUNwN0dBWnZWc3JzS0FSL0wwR1pjaVU3eHdI?=
 =?utf-8?B?SEZUNjZpeUw4T2hoN2kwWWEvZmNWYTdJUGw5SGlFd3RpYU9zaktLUnBmdGdp?=
 =?utf-8?B?WjMxZ3pQK1lrRTh4MFJjc2Vnb1pFR0ZXNlIyRzNQTjlleE5xZFBKNUo3SDZB?=
 =?utf-8?B?UDJYSVpCcFpYZndKcWxVOWljTTFwMklBdlh0ZjVsbG5kSnlmZFJpUmtXMUxP?=
 =?utf-8?B?NDVqeDl3Z3k5SjlncDFRTmNlR2NhRmlWNWp6S3d3ZndmRFp1NklyK01Ha0Yz?=
 =?utf-8?B?WXYrbTZtUFJHSHB0c0tRYWlQNGQvM094dzBrWms5N3Q4M3MzRjRpMnRhZ0VF?=
 =?utf-8?B?eXRKUnU3dS9xMnd1eU16OFcrLzJwa0hyZW0vdlRWV2hqYWxYUis0emppRHhs?=
 =?utf-8?B?N2poUFZMTmJFLytwa3Rzb0pyVG5WL3FWOFpRTW83WmNXK2FTdG9mTU1vaWd3?=
 =?utf-8?B?ZVVBSStBU1ljS20vTXlKalBMeENabGlHeGF5YzR1RVZuWnZSZkJ4M0twaWJ2?=
 =?utf-8?B?ZFRZYzA1UWtPT1ZiK01WeEhoMndHcUN3VjlkOFBGaUlDM3l0bzM0Y0wzQ0hI?=
 =?utf-8?B?bTdJUUE3SFJwMVZQaDZJaW1Rd0x0UjVSU2dPVEhyeGpSejFtVVQzUkduQkhn?=
 =?utf-8?B?aitUaFRRREdadFVZMENoQlBKbzREZEdHbWVyTmY4M0RXMlQ0aFZMRXRrNmQ5?=
 =?utf-8?B?SVl3YnFPakhEdXZEZnYzd0dMS2JSVFpCUFVzaTliK3hSbXp5b0d6WUlMSXpt?=
 =?utf-8?B?N25iQU5veXhpSEVycnRxUHF1cU1tdXh3cDBERmMzZkNuMUgzaEVkMnduNmVY?=
 =?utf-8?B?Zlk3VWl0NzdTdnZjYnRacFk0blBEaW4vMm52b2k1MGRtdWw3eGhUbW5XVDlP?=
 =?utf-8?B?czc0WWp2azBHVzFueHhMSm1YR0EvK3FkRjdxNktQLzlxMWNpbTc3MmNsenFi?=
 =?utf-8?B?MWpLVVVaK0E1aVcwR0pQNStXTFFGVFMrNm5uei9vRFllZ1VjTkVJNXhISm9X?=
 =?utf-8?B?MnRsUk9NbE9oTXYwL3hDR2JLcE5QLzF5TGYyUmpldlM3VzlFZDVFL0hMUzBP?=
 =?utf-8?B?bEx4S3NEajVVR1VzY2tNT3NHdzM3c3YzNTFFbnd5azZGS3pXRE1kblRSZmJt?=
 =?utf-8?B?TVh6NmtJcWU4NmhqYk9WdHNvSlRBWHoxdDVJcGVWejJGS25ZWGZaVDBwa3Ft?=
 =?utf-8?B?RVBueXdJaUxWSlM0c3FxVkNhN2JqTkVHWU1VNXZMNW01TkprMXhnZ1lmRTh0?=
 =?utf-8?B?RVdCTFM5RGFPL3daT0xCREkwOXdnYjJsUjBrNUhjQnhiK1FWS1ZMcG9aWWZj?=
 =?utf-8?B?VmZiQWM0a0kvdmM2SlEybERlSGo5UzQ4eGVIaVFGVG9YMENINTd2YTdDOThL?=
 =?utf-8?B?bkl6WXNrd3NDOGxpQnNDNWwveGYzemE5R2dWeWJjbUgrSW4xNW9zaE9Neks3?=
 =?utf-8?B?dk5rdHVLSFdRZVZoS0krZ0ZQVUNDcGJvT1U1ZGpoajNkWUd1VXFDTmtPZWIx?=
 =?utf-8?B?ZWVFOS9OYkV5alJyK1c1NW1ySlZuUk8xbWdDa2Vad0E0RnlwZ28vSjVOYTdp?=
 =?utf-8?B?NVBSb1U0cjljU0VJbHg4a09GdlBBcWQ3UUVwcGxNbnF5VFF5N1h6TDZOcUtr?=
 =?utf-8?B?eE85SVppQlJ2MzdyL29hNlVza0E0bFQ0QS9yYUZjenh3bGw0cG5wZll5eHl0?=
 =?utf-8?B?WDIxbnIvNExvekptdWQvQ0tDRkN3V2tsRnREV0Z2cmZBTFMxajFqUmliRlRB?=
 =?utf-8?B?Yk83cHZCT24vUEdaRzFuVGFDdStjc3RwOTJCS0M3WWdVRmhia3ZFU2pRRW9L?=
 =?utf-8?B?THVqZnJPNVNFYmtOQzlXTFhSVG1YYVlxS1gydWVUY2hCeGNLNmhhT2ppYzhR?=
 =?utf-8?B?WEN1THZSRnVXMlAwUElodmV2QW5uTDBXcndwVzAzQ2pCNE5PRVVzK2FYYkhV?=
 =?utf-8?Q?gNTsVOb4yATaGVGM=3D?=
X-Exchange-RoutingPolicyChecked: pa3yuhFPOC697Anv+OfOgWcO58y2PUm39Az/Mlffd6CUTUE/OW/vfQs43D/x84sJ5W0ryX4QjyTS32JhjSGsTKXGJdFF1ccVNxET17DvTtyr3p+WPJefA7eTj2cD1M0ktvVHmTksRzT5368BSpQmHWUAozYRYsKWciqPU1zxQJSVXGVRVLZJ9Ay/XK0ej2tgeDF5DsgdaEstkGsx2ehYt/aIaDSq5faRXH63B1h+UWg2Q5lg/ovX3/OAHL5sk/yjGSQ4RqOk3L4T5Rt+JxjRKa3VfotUUWAa8UVtg9WpSLNXLMip2PeyvKxTAmEcejFyGiVDAk5HgthnQIhaUks50A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 00f9771e-984f-4008-fffe-08ded1ce3b71
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6967.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 08:54:42.6116
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x7YXKvMQNp6uyIh1PTz+k0KUWEq7sDdhW/pB4/ypZpYSnFmQAFte2dvNwnF+XUN3svUlIxnCYmcroivMW86kiZXbUi3ZbZq/oWwaQ/zdqXU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6937
X-OriginatorOrg: intel.com

On 6/24/2026 10:07 AM, Bui Duc Phuc wrote:
> Thanks for the review.
> 
>>> Clean up the code using guard() for spin & mutex locks.
>>> Merely code refactoring, and no behavior change.
>>
>> The change looks good - just dropping by to mention that the cleanup.h
>> is missing everywhere : )
> 
> I noticed that both spinlock.h and mutex.h already pull in cleanup.h,
> so the guard()/scoped_guard() macros are available without an explicit include.
> Could you clarify the reasoning for adding #include <linux/cleanup.h>
> explicitly here?

Follow the include-what-you-use (IWYU) approach.  While the approach 
could be tailored per-header, in general it makes any future job of 
cleaning up the headers easier.
