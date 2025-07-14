Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 964B51EC014
	for <linux-sound@vger.kernel.org>; Mon, 14 Jul 2025 09:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752483874; cv=fail; b=HQnDySUbtp2fpw+sanMvrHXNzFtrzDpTaFN59rxeucTi4ljmE+c7DEuZyoUAQSvqy7oNLUDhotCOiAarg5vkdSiX/3RPEPz6SLTWpXuqLqepH6DS5TVZhI0/BTabOBz5wjtFDx1wJlVB0sZqK0F6VG+6uAMWP+CLy3X/aBA228w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752483874; c=relaxed/simple;
	bh=xwlfcmNF/sesglwwCbDHXes1yaQvUirCaxjBeD7SqII=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ittCoMWF6GueoGAN1oYKNQJhMpAsoREr5HvM2TbFfpM6FEl3J9hGXbIt8qrv7KPSwwxGKI8IRBxSe9g/ZiUa32NHEprYd4QinMJgEpR4p+g/sC6xfGPbAAx0DzBiNvI+fyHFuQZO86h9zAIwA9OiugB98EGT6l4xUZpyxfNmYJg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gRSFQp6G; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gRSFQp6G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752483860; x=1784019860;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=xwlfcmNF/sesglwwCbDHXes1yaQvUirCaxjBeD7SqII=;
  b=gRSFQp6Gg6akbRZFpSd+JXQvVIDxzW9k7HuDX2figVf+Y4iqhR+RHK7U
   jcq7Pw7KaRgl5Dr/Q5eygT1Ok7paL9LStGfR85IPqBbqiPCfoTc/AO1q8
   khkND7s4DzRgP7BQnrv8FDCZgQi+SmOsT63apbCW3r72ne3BH7FrIswiw
   i7pQ0/JK43BD9yAnohMLfa7tJ7WxNFPLATvowwM3qxYepYipj2OqwSbZ6
   qWw1F/m3LLAPznS0Y36pch46qDx2EUWo2Hg6llEhFwsCir89dMx7LWD+1
   HO+n702vQZT5rfE6ShuGCiCgPapWZ9luMZYyQXxaG8XJM6dmIq/KH92Zu
   A==;
X-CSE-ConnectionGUID: PWR9wysuS7CcLwJlnlwVwQ==
X-CSE-MsgGUID: IsdPm+vSQ+SyHuMr1LSm7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="54796562"
X-IronPort-AV: E=Sophos;i="6.16,310,1744095600"; 
   d="scan'208";a="54796562"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2025 02:03:59 -0700
X-CSE-ConnectionGUID: p/KSMgYyTC+Cjfv73C0anA==
X-CSE-MsgGUID: JVtNYUx2TcyRvaTPgZmFuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,310,1744095600"; 
   d="scan'208";a="156971993"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2025 02:03:59 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 14 Jul 2025 02:03:58 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 14 Jul 2025 02:03:58 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.53) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 14 Jul 2025 02:03:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xb1CkPeKVj3CQpRP9vwD3X9jjytJhunOSIQW74x0Gk2IMmWeQrijusTVArjrg901mglT95wa7++W7qmwa/hDcNVXx/1ZQFMeKbN+lIzgtfOQ6Co7NizoU8GxCySN0Q/xKYroQlcDpAwQHvlkm5/7phvxq5tvxZDJSFgZ+HRx1KvZ3VvCkft5rXu9rcZXLb9sLas+7B0NVvXb3V5ckbOeB3r9Cv+oeOgEbaSKG5x1OmektsSK1BP7uqeKWpQZeyy5aOxzWGye/UotZbjlJy07e/Yd40jFO0FAEeJxs/hMim6+dwPafyCr8SEzYns48LVHp7OvpAV6jl3rwK512vLSPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sz0T1UDZFP4gguBowj7DjV85x6fm5L56u3Ig+4wt/tA=;
 b=GdZmBgpzXavORb8K64JE8Z4MwvoNGk0KLl1J1pfvb8fGJr2HbmoL2+2fKMixkKCujzjxjRGa8HUj0JEVIJ0G5+aPkTEbwWjcPqJtHIc5CwvOeoZ4eqFtKqzJ66vu1cAm6+wNQFRwNAl8bs2Z/ocGWyrxnOUQ9El1z1dBmNmdVUknz17ieg3k2Y8Jff4TW4ZSre/8XiWZaQqUIv8/rPO0ltzKOktMDwQut1hDQ505SV5EBgdwrRq/ICtxVoODtJpqGQDKVxFLX+dxMcC8OUTIZpi4WhC6ZvkEp5Qkeq83Xh95OLbHEWUDz2a10TlrjERxOkJgk5OWe5VPnBBRnkhTTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8283.namprd11.prod.outlook.com (2603:10b6:806:26c::16)
 by PH8PR11MB7023.namprd11.prod.outlook.com (2603:10b6:510:221::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.28; Mon, 14 Jul
 2025 09:03:02 +0000
Received: from SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::3:e0a:87af:d4b6]) by SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::3:e0a:87af:d4b6%6]) with mapi id 15.20.8835.027; Mon, 14 Jul 2025
 09:03:02 +0000
Message-ID: <e339ed83-aa9f-4749-b46e-e03bc7eb0ad4@intel.com>
Date: Mon, 14 Jul 2025 11:02:56 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/27] ALSA: hda: Split Realtek HD-audio codec driver
To: Takashi Iwai <tiwai@suse.de>, <linux-sound@vger.kernel.org>
CC: Richard Fitzgerald <rf@opensource.cirrus.com>, Kailang
	<kailang@realtek.com>, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	=?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
	<amadeuszx.slawinski@linux.intel.com>, <patches@opensource.cirrus.com>,
	Baojun Xu <baojun.xu@ti.com>, bo liu <bo.liu@senarytech.com>
References: <20250709160434.1859-1-tiwai@suse.de>
 <20250709160434.1859-8-tiwai@suse.de>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20250709160434.1859-8-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0034.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::7) To SN7PR11MB8283.namprd11.prod.outlook.com
 (2603:10b6:806:26c::16)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8283:EE_|PH8PR11MB7023:EE_
X-MS-Office365-Filtering-Correlation-Id: ab147cce-edfc-4d5e-2e5c-08ddc2b53ca9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MkhORmFUaWx0MDY3RENiSWd2SS9LNmZ3SWxZcVc0ekJQTWNEU2VrczdEZTdh?=
 =?utf-8?B?N0NBWjk1VU1kZWdlcmN3Wk51d1l5cUNxR082SkdGK3hSNHVHeGNPVzl4OTdv?=
 =?utf-8?B?MGN4Y01Icmc3UWFGK1lvUzhZY0ZPTTUvaVdLL0svVDBCOXBOTG1rY0NxM3po?=
 =?utf-8?B?V0lzdkNrVTJtd2lBVUxMQjhLNzNhMTkwdEFOT3RYL09CVXMvdldkNFY1S3Er?=
 =?utf-8?B?K2MwVE5Pa252RHV3ejh6WkR2TTZ6QytGVkdsRGxINkRDbXQ2d1MyT3NyTGRN?=
 =?utf-8?B?c213YmsvV2NTZGQycjh4TndRbkQyaGdjZlhsaUU2Tnk4Nkw0V0svZ2QvcXFC?=
 =?utf-8?B?Tjl4eHdmL2g3cXJ6bmQ3Z0VKRGVPMmY5TSt1dHlBMU9WQVA2TTlCTENMa2VG?=
 =?utf-8?B?WElML3lhdExtZENHb2pRRldmSFVOOXVIdUxwV2wyL09EVTFENWM2MGVkQlJu?=
 =?utf-8?B?QTNkWDBNZlZUbVA4eVQwL0FxbXVqTXFwRVNsRE1DYjFEUGlSS0gxeXJEeEx2?=
 =?utf-8?B?MS9UWEVMVmUxb2FiZDkwUHBvWHNyUW1NQXNuT09NbHc4djVYQUtzcTdMUUhj?=
 =?utf-8?B?bTRDc2ZxNGVGOFAzcTNFdTV5Rk1sMnBLTlhEb2RCZTBIOVFZSVNlK2pXNkt1?=
 =?utf-8?B?SzVPdWhsWXJmWk11VEhtVE5PYlBMb1pPSDFXZ3RCeEk1TDUzWmR0MnNaUVph?=
 =?utf-8?B?QXZBK1poY0tNQ09qUGg1ZG5xQ0VOUTJKUDZBWVVBbE8vMjN2S2h4T3oyNlQ4?=
 =?utf-8?B?eENEeWNQc1FYOWJSVUdJSmU0SVBOY1BCbVlPZHVyMDd6YzI5QWNOZDZ0WUIv?=
 =?utf-8?B?bVE2b3dMNElLaWxQS3RpS2FKU3pidElXS2VUZVFSZXBCNFpGRisxeUF5MVI0?=
 =?utf-8?B?cnpTK00wd01mNXFRcW43YkF1TzdMODBCNUhxV0tCZFRDengvSFRTZ3BZU20x?=
 =?utf-8?B?SE0vQmczOW1IcmZlZ0kyNEowUUVsbVlJTGRYK1BrSWkzSlpvOUJQUEpPUGZl?=
 =?utf-8?B?SkpqL2UvWUZKb2djOXRmUnJaTnRLMWhoNHd4QjVvWFVNdHRNdVdzbFZQeXF4?=
 =?utf-8?B?LzBWL2lIZFZGSmlRZGFCRjZ0SVFaL3doV2c4V3lvM25UWkkvYlpPdHB1UWZH?=
 =?utf-8?B?TklFcVk4NUlsY1pXTDFFalFEMDVQYklSeUg3RE13S3kzMDFZOHBNVVYwYTUw?=
 =?utf-8?B?aWFOL2hhNUExSGd0dVdERDltQk5tc3hDaHN6Rys5MlRvL3pwdVhOc3pDZ2lP?=
 =?utf-8?B?R1plK0FMYWJ1TTJNRHZTOU1vNHNLZDczNWRLU1l2Tk9XQmlwdWY1eXBqMUZE?=
 =?utf-8?B?NHR4R0R6RktPeGVuOC9BTmVCeEVpTnQ3YXlUZGdIY1ZUQlVTaTBwL2c4dXln?=
 =?utf-8?B?VlFIVUVKODFqazBOYkJEN0cyYXBhVGU2YTJycUNXRDVYTms5Y1Nzd1k0UGJV?=
 =?utf-8?B?engyQTVzS1JVTWJBMFloU2VVRTU5NmxMVFZmMENHLzBQeGpVaWpsMDJiYUhu?=
 =?utf-8?B?WDF1eE14U2tOZC9yNk9ZYjJHdklPaDVYZDNoc2NhSGRVNks3TExtR1ZpMDRh?=
 =?utf-8?B?QXpqaGdMSlhQQk9NVFZEVnlFZmgyNVZvSWYvY3VzcE9ndkF0TUhueEp3dFQx?=
 =?utf-8?B?ZDc0d2EzeFpWUmxDR1JSaEFHUExZQ0Y5czg2STBBR2RsZUpiZ0Z4VE85UzBj?=
 =?utf-8?B?TnMwblBoTVBRL3A3b0VOaitVZ3RiWE9yVWxTT2VLWFAwQjFLemVKSUxjSGhr?=
 =?utf-8?B?VWF3S2FWRklIalREMkZhY21BSlUxbTdLUHVqVzB3YjA3UVlvYXZJMXdwQ2FQ?=
 =?utf-8?B?K2s4VEwxWjdTTU9HcTRIU2lWUDY5K1JUbjBLeFEvb3lVaUVXRjhKN1pJb2Fh?=
 =?utf-8?B?VExyRVBDRXdZd3RmbHlpRDRuWjMwVW85cEZVdDQ1SVE1NHpwTUxMbFNkN0Ey?=
 =?utf-8?Q?g1Yyw0rgOe0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB8283.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V2lxaE5oV3dwRVJSeE1yRUpTb29KRGdEMnBXM1I5Um5SM0pUNzN0bHdDK0k5?=
 =?utf-8?B?WXVUMC9BQVZxdUtINktTTnVZQ24xNjJWb2dWV2tYNkdiSGNQTCs0Q0xTWWhB?=
 =?utf-8?B?VFJIR0hsVCsvVitVRXJ6NFU1eFczMTlTRDA1ZmJmbnl5Qkk4TTljL0ZGWGJs?=
 =?utf-8?B?NW5jajJxWXhxTTlkenp5OFNPM3lHVy9yMlZvOHNzbWFKN1NzOGZodmdKMk95?=
 =?utf-8?B?cVlKODVpK1E1dGFWOU40R1Q3VDZUanFGZUVGTll0WUNESW1Ec2hlQzBJUnlE?=
 =?utf-8?B?NUtyREMvaEVlY2hFeFZROElnSmZseFlmdU5yMFZiN3FnUjQxb2Q0VEptVDVM?=
 =?utf-8?B?TUFlL1hUWm9PY2hmMmhTYjByL0V5UUpZRTh0Y1JWUm1vOWZ1TnZxUDFQYVA3?=
 =?utf-8?B?Nkd4cTZlWUtyb2tpS2pFM3BQbEhTRFBrbmJYVUoza0NyZzZWVXRDM2E1bjd4?=
 =?utf-8?B?bHJnSWpaWXBRdzVqY0lyVkI2MW9oMFZIa1pQZEFYaU0wMGlmVGU2bzRMQ0dk?=
 =?utf-8?B?KzVsUFgwdXB1ZXNYTTBxbFZidlBmK0VXWTVNL3Q5V093TDJWV1FiaytKWUho?=
 =?utf-8?B?VStvUjRvN0poQkF1czhXZjdrSTZzUnRrV3pkelhsYzdKYk85TmUwOEREVFBG?=
 =?utf-8?B?T2RTZXMxVWEvWTQySkVyN0FISUNMRTdONGJPbW5vZ2hmRUEzWWlleDJQRDBT?=
 =?utf-8?B?MVdXYVo4Z3BHajEyeHVHMFg5azRTTmtXSDNxL2hPZkFTdk5Ya3BCUjc5ME9u?=
 =?utf-8?B?Mmt5dlVEZnIyT0w4VEd4cFdzRHZ3cFdHQUVocWJDdkIyU3Aza3RaRFNKVkFZ?=
 =?utf-8?B?YkZaUTRRNzZLQjFodWhxM2NRM0FHMENiQnNLS0Q5cVB6UnpVb2pvdWx6d0wv?=
 =?utf-8?B?V2dYNFJ3RnI3RTNOVHpxMW0zYnJ3N0VEV1BkVHBtZVkwNG93WjBjKzMreGFG?=
 =?utf-8?B?S1dJM0k3NzQzNkZnNjJzanNyRXBSK01EZW4rOTlrSUozTm1sbUxBUEtqaXZR?=
 =?utf-8?B?ckNFcW5xVDczMEZYUzJUeTQ2VzM2eWdSck9kc09CemlxY0U1MGY5YUsrNXQ4?=
 =?utf-8?B?YTlpcW9QK3VKcGdOaWdLOHc1L1hSNnVGSGkvVVU4bXRLTGpPOEJublU1QjRx?=
 =?utf-8?B?bm9CRXFQdGR6Wm1qU0IvSUVhanZ4Q0xISDlhaFQrRnhSenBIYkVUaDlXdy9T?=
 =?utf-8?B?ODFkcWpwS1FabSt5Q0MrdWxTVjJYNEpNWFdBNjV2clpDZS8xc3ROVmZXWHUr?=
 =?utf-8?B?L201dGh6RVlqWThYd0tOTmtiS2FvSkw4SXpFeHl5M3pTanJwNlYxb2tsVGFl?=
 =?utf-8?B?dW9JL0cyZDVCaHlJNWw3WVFudCtSam0zOGFIR3hiZis5N244L2RFQWdqS2NS?=
 =?utf-8?B?NlZISktGaGpYWW1LeVpGVWVMenpWM0QrbGt6cldRblRMczUwK2wyNnJrYWdE?=
 =?utf-8?B?NUN6ZVRuTW9PdFUzaXlneEJIRzl0WG5VM254MWJ5cnpDTy9yZjE0dVZhU0xz?=
 =?utf-8?B?MG1mcG1yZUV5clFWcXJUakRjR21KVGFRYVJramovT1BWaUgvZUhjRUVCbDZW?=
 =?utf-8?B?UlY0LzVqNEc3Qmw0aWZDdk9ONHhHVWF4Qjc2WXRLUHpRVXBsTFMrc1FINGdp?=
 =?utf-8?B?M1NkcEhYd3JZSkNVVWFmc212b0hVc1VjUGdlZVppNnpzc3MyUlovOHk3b0hM?=
 =?utf-8?B?RDg5R0xWVTErSUJIS0w4YWRUWjd0VDZxdEQ4R0RvNGpxaFkzZExiWktJRFFy?=
 =?utf-8?B?OHYrMkxNZnpabXZwdTBUZU13MXd0c2p2MUxPVzJXbGJuYUJZWkpieUNKSklh?=
 =?utf-8?B?S2F3L2ZCeVN4enZOOUprYUtoMTJjVi8rejByaGwzRmRGNExsV1owUjR6U21H?=
 =?utf-8?B?UHhXcHlhWHAxWFZtRllnOVRRUTY3V0xqNklxTjVDb2FmU05VVDcxYUVHelgx?=
 =?utf-8?B?V3FyVWtqQkxKQldyVWpubi9mbHlWWHFFckU4WG1XbzNOUE9Wb1YzcWlkTkRa?=
 =?utf-8?B?K3g1aE9zcGNYQnVhamVEZTBEZGQzQzhYZGxSdWdiM3BiRUEvSUp5QUkrTE5K?=
 =?utf-8?B?MHJZWDRVenlzcUF4QjlXaW1Tbm1OTTVBcUQ1WDkyd3pSSUpPVm5EQW4vR0ZR?=
 =?utf-8?B?YVlUK1l4VU9JU29rcTRQRk1qUWNGUUdGNXNHNTZRZVlBekVrNHRGcE4wZmUv?=
 =?utf-8?B?d2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ab147cce-edfc-4d5e-2e5c-08ddc2b53ca9
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8283.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2025 09:03:02.5993
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uW2EZ7ZHsww/2KojwhTtTvdrGy/RNjaBtzesRtdLtnDsdM2LkkMtlqlr+IjF00+001SBZDjZBN5kSUGEbSjtbI/Po17UaC5RLMuL1gmauI8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7023
X-OriginatorOrg: intel.com



On 2025-07-09 6:04 PM, Takashi Iwai wrote:
> The snd-hda-codec-realtek driver supports many different codec models
> and accumulated lots of quirks.  Now let's split it to multiple
> modules per probe function, i.e. for ALC260, ALC262, ALC269, etc.
> 
> The common code and quirks are provided by the common library module,
> snd-hda-codec-realtek-lib now.  One drawback of this action is that
> many symbols have to be exported.  But they are limited with
> SND_HDA_CODEC_REALTEK namespace, at least.
> 
> This patch tries to be idiomatic and doesn't try to rewrite the
> existing code.  We can move the codec model-specific code into each
> codec driver later.

Thank you for mentioning this.

> 
> The HD-audio sub-codec component binding is currently specific to
> ALC269, hence the management is moved into alc269.c.
> After that, alc_free() became identical with snd_hda_gen_free(), and
> it's replaced as a macro just to call snd_hda_gen_free().
> 

That's some outstanding work right there, Takashi. Given the commit 
message above, any refactoring shall be left for later. My only comment 
is related to: sound/hda/codecs/realtek/realtek.c :)
Perhaps 'common.c/h' ?

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>

> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>   sound/hda/codecs/Kconfig                      |   14 +-
>   sound/hda/codecs/Makefile                     |    5 +-
>   sound/hda/codecs/realtek/Kconfig              |   90 +
>   sound/hda/codecs/realtek/Makefile             |   26 +
>   sound/hda/codecs/realtek/alc260.c             |  276 +
>   sound/hda/codecs/realtek/alc262.c             |  199 +
>   sound/hda/codecs/realtek/alc268.c             |  176 +
>   .../codecs/{realtek.c => realtek/alc269.c}    | 5727 +----------------
>   sound/hda/codecs/realtek/alc662.c             | 1102 ++++
>   sound/hda/codecs/realtek/alc680.c             |   53 +
>   sound/hda/codecs/realtek/alc861.c             |  149 +
>   sound/hda/codecs/realtek/alc861vd.c           |  123 +
>   sound/hda/codecs/realtek/alc880.c             |  497 ++
>   sound/hda/codecs/realtek/alc882.c             |  847 +++
>   sound/hda/codecs/realtek/realtek.c            | 2314 +++++++
>   sound/hda/codecs/realtek/realtek.h            |  302 +
>   16 files changed, 6191 insertions(+), 5709 deletions(-)
>   create mode 100644 sound/hda/codecs/realtek/Kconfig
>   create mode 100644 sound/hda/codecs/realtek/Makefile
>   create mode 100644 sound/hda/codecs/realtek/alc260.c
>   create mode 100644 sound/hda/codecs/realtek/alc262.c
>   create mode 100644 sound/hda/codecs/realtek/alc268.c
>   rename sound/hda/codecs/{realtek.c => realtek/alc269.c} (64%)
>   create mode 100644 sound/hda/codecs/realtek/alc662.c
>   create mode 100644 sound/hda/codecs/realtek/alc680.c
>   create mode 100644 sound/hda/codecs/realtek/alc861.c
>   create mode 100644 sound/hda/codecs/realtek/alc861vd.c
>   create mode 100644 sound/hda/codecs/realtek/alc880.c
>   create mode 100644 sound/hda/codecs/realtek/alc882.c
>   create mode 100644 sound/hda/codecs/realtek/realtek.c
>   create mode 100644 sound/hda/codecs/realtek/realtek.h
> 
> diff --git a/sound/hda/codecs/Kconfig b/sound/hda/codecs/Kconfig
> index bac19a664be0..0bb675ab84fe 100644
> --- a/sound/hda/codecs/Kconfig
> +++ b/sound/hda/codecs/Kconfig
> @@ -4,19 +4,6 @@ if SND_HDA
>   config SND_HDA_GENERIC_LEDS
>          bool
>   
> -config SND_HDA_CODEC_REALTEK
> -	tristate "Build Realtek HD-audio codec support"
> -	depends on INPUT
> -	select SND_HDA_GENERIC
> -	select SND_HDA_GENERIC_LEDS
> -	select SND_HDA_SCODEC_COMPONENT
> -	help
> -	  Say Y or M here to include Realtek HD-audio codec support in
> -	  snd-hda-intel driver, such as ALC880.
> -
> -comment "Set to Y if you want auto-loading the codec driver"
> -	depends on SND_HDA=y && SND_HDA_CODEC_REALTEK=m
> -
>   config SND_HDA_CODEC_ANALOG
>   	tristate "Build Analog Devices HD-audio codec support"
>   	select SND_HDA_GENERIC
> @@ -162,6 +149,7 @@ config SND_HDA_INTEL_HDMI_SILENT_STREAM
>   	  This feature can impact power consumption as resources
>   	  are kept reserved both at transmitter and receiver.
>   
> +source "sound/hda/codecs/realtek/Kconfig"
>   source "sound/hda/codecs/cirrus/Kconfig"
>   source "sound/hda/codecs/side-codecs/Kconfig"
>   
> diff --git a/sound/hda/codecs/Makefile b/sound/hda/codecs/Makefile
> index 205cd1373b42..14e5041aa4f0 100644
> --- a/sound/hda/codecs/Makefile
> +++ b/sound/hda/codecs/Makefile
> @@ -2,30 +2,31 @@
>   subdir-ccflags-y += -I$(src)/../common
>   
>   snd-hda-codec-generic-y :=	generic.o
> +snd-hda-codec-cmedia-y :=	cmedia.o
>   snd-hda-codec-analog-y :=	analog.o
>   snd-hda-codec-ca0110-y :=	ca0110.o
>   snd-hda-codec-ca0132-y :=	ca0132.o
>   snd-hda-codec-cmedia-y :=	cmedia.o
>   snd-hda-codec-conexant-y :=	conexant.o
>   snd-hda-codec-idt-y :=		sigmatel.o
> -snd-hda-codec-realtek-y :=	realtek.o
>   snd-hda-codec-senarytech-y :=	senarytech.o
>   snd-hda-codec-si3054-y :=	si3054.o
>   snd-hda-codec-via-y :=		via.o
>   
>   obj-y += cirrus/
>   obj-y += hdmi/
> +obj-y += realtek/
>   obj-y += side-codecs/
>   
>   # codec drivers
>   obj-$(CONFIG_SND_HDA_GENERIC) += snd-hda-codec-generic.o
> +obj-$(CONFIG_SND_HDA_CODEC_CMEDIA) += snd-hda-codec-cmedia.o
>   obj-$(CONFIG_SND_HDA_CODEC_ANALOG) += snd-hda-codec-analog.o
>   obj-$(CONFIG_SND_HDA_CODEC_CA0110) += snd-hda-codec-ca0110.o
>   obj-$(CONFIG_SND_HDA_CODEC_CA0132) += snd-hda-codec-ca0132.o
>   obj-$(CONFIG_SND_HDA_CODEC_CMEDIA) += snd-hda-codec-cmedia.o
>   obj-$(CONFIG_SND_HDA_CODEC_CONEXANT) += snd-hda-codec-conexant.o
>   obj-$(CONFIG_SND_HDA_CODEC_SIGMATEL) += snd-hda-codec-idt.o
> -obj-$(CONFIG_SND_HDA_CODEC_REALTEK) += snd-hda-codec-realtek.o
>   obj-$(CONFIG_SND_HDA_CODEC_SENARYTECH) += snd-hda-codec-senarytech.o
>   obj-$(CONFIG_SND_HDA_CODEC_SI3054) += snd-hda-codec-si3054.o
>   obj-$(CONFIG_SND_HDA_CODEC_VIA) += snd-hda-codec-via.o
> diff --git a/sound/hda/codecs/realtek/Kconfig b/sound/hda/codecs/realtek/Kconfig
> new file mode 100644
> index 000000000000..4b3ab28203b4
> --- /dev/null
> +++ b/sound/hda/codecs/realtek/Kconfig
> @@ -0,0 +1,90 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +menuconfig SND_HDA_CODEC_REALTEK
> +	bool "Realtek HD-audio codec support"
> +
> +if SND_HDA_CODEC_REALTEK
> +
> +config SND_HDA_CODEC_REALTEK_LIB
> +	tristate
> +	select SND_HDA_GENERIC
> +	select SND_HDA_GENERIC_LEDS
> +	select SND_HDA_SCODEC_COMPONENT
> +
> +config SND_HDA_CODEC_ALC260
> +	tristate "Build Realtek ALC260 HD-audio codec support"
> +	depends on INPUT
> +	select SND_HDA_CODEC_REALTEK_LIB
> +	help
> +	  Say Y or M here to include Realtek ALC260 HD-audio codec support
> +
> +config SND_HDA_CODEC_ALC262
> +	tristate "Build Realtek ALC262 HD-audio codec support"
> +	depends on INPUT
> +	select SND_HDA_CODEC_REALTEK_LIB
> +	help
> +	  Say Y or M here to include Realtek ALC262 HD-audio codec support
> +
> +config SND_HDA_CODEC_ALC268
> +	tristate "Build Realtek ALC268 HD-audio codec support"
> +	depends on INPUT
> +	select SND_HDA_CODEC_REALTEK_LIB
> +	help
> +	  Say Y or M here to include Realtek ALC268 and compatible HD-audio
> +	  codec support
> +
> +config SND_HDA_CODEC_ALC269
> +	tristate "Build Realtek ALC269 HD-audio codecs support"
> +	depends on INPUT
> +	select SND_HDA_CODEC_REALTEK_LIB
> +	help
> +	  Say Y or M here to include Realtek ALC269 and compatible HD-audio
> +	  codec support
> +
> +config SND_HDA_CODEC_ALC662
> +	tristate "Build Realtek ALC662 HD-audio codecs support"
> +	depends on INPUT
> +	select SND_HDA_CODEC_REALTEK_LIB
> +	help
> +	  Say Y or M here to include Realtek ALC662 and compatible HD-audio
> +	  codec support
> +
> +config SND_HDA_CODEC_ALC680
> +	tristate "Build Realtek ALC680 HD-audio codecs support"
> +	depends on INPUT
> +	select SND_HDA_CODEC_REALTEK_LIB
> +	help
> +	  Say Y or M here to include Realtek ALC680 HD-audio codec support
> +
> +config SND_HDA_CODEC_ALC861
> +	tristate "Build Realtek ALC861 HD-audio codecs support"
> +	depends on INPUT
> +	select SND_HDA_CODEC_REALTEK_LIB
> +	help
> +	  Say Y or M here to include Realtek ALC861 HD-audio codec support
> +
> +config SND_HDA_CODEC_ALC861VD
> +	tristate "Build Realtek ALC861-VD HD-audio codecs support"
> +	depends on INPUT
> +	select SND_HDA_CODEC_REALTEK_LIB
> +	help
> +	  Say Y or M here to include Realtek ALC861-VD HD-audio codec support
> +
> +config SND_HDA_CODEC_ALC880
> +	tristate "Build Realtek ALC880 HD-audio codecs support"
> +	depends on INPUT
> +	select SND_HDA_CODEC_REALTEK_LIB
> +	help
> +	  Say Y or M here to include Realtek ALC880 HD-audio codec support
> +
> +config SND_HDA_CODEC_ALC882
> +	tristate "Build Realtek ALC882 HD-audio codecs support"
> +	depends on INPUT
> +	select SND_HDA_CODEC_REALTEK_LIB
> +	help
> +	  Say Y or M here to include Realtek ALC882 and compatible HD-audio
> +	  codec support
> +
> +endif
> +
> +
> diff --git a/sound/hda/codecs/realtek/Makefile b/sound/hda/codecs/realtek/Makefile
> new file mode 100644
> index 000000000000..c6ee4e526a40
> --- /dev/null
> +++ b/sound/hda/codecs/realtek/Makefile
> @@ -0,0 +1,26 @@
> +# SPDX-License-Identifier: GPL-2.0
> +subdir-ccflags-y += -I$(src)/../../common
> +
> +snd-hda-codec-realtek-lib-y :=	realtek.o
> +snd-hda-codec-alc260-y :=	alc260.o
> +snd-hda-codec-alc262-y :=	alc262.o
> +snd-hda-codec-alc268-y :=	alc268.o
> +snd-hda-codec-alc269-y :=	alc269.o
> +snd-hda-codec-alc662-y :=	alc662.o
> +snd-hda-codec-alc680-y :=	alc680.o
> +snd-hda-codec-alc861-y :=	alc861.o
> +snd-hda-codec-alc861vd-y :=	alc861vd.o
> +snd-hda-codec-alc880-y :=	alc880.o
> +snd-hda-codec-alc882-y :=	alc882.o
> +
> +obj-$(CONFIG_SND_HDA_CODEC_REALTEK_LIB) += snd-hda-codec-realtek-lib.o
> +obj-$(CONFIG_SND_HDA_CODEC_ALC260) += snd-hda-codec-alc260.o
> +obj-$(CONFIG_SND_HDA_CODEC_ALC262) += snd-hda-codec-alc262.o
> +obj-$(CONFIG_SND_HDA_CODEC_ALC268) += snd-hda-codec-alc268.o
> +obj-$(CONFIG_SND_HDA_CODEC_ALC269) += snd-hda-codec-alc269.o
> +obj-$(CONFIG_SND_HDA_CODEC_ALC662) += snd-hda-codec-alc662.o
> +obj-$(CONFIG_SND_HDA_CODEC_ALC680) += snd-hda-codec-alc680.o
> +obj-$(CONFIG_SND_HDA_CODEC_ALC861) += snd-hda-codec-alc861.o
> +obj-$(CONFIG_SND_HDA_CODEC_ALC861VD) += snd-hda-codec-alc861vd.o
> +obj-$(CONFIG_SND_HDA_CODEC_ALC880) += snd-hda-codec-alc880.o
> +obj-$(CONFIG_SND_HDA_CODEC_ALC882) += snd-hda-codec-alc882.o
> diff --git a/sound/hda/codecs/realtek/alc260.c b/sound/hda/codecs/realtek/alc260.c
> new file mode 100644
> index 000000000000..ebe20eaec58a
> --- /dev/null
> +++ b/sound/hda/codecs/realtek/alc260.c
> @@ -0,0 +1,276 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +//
> +// Realtek ALC260 codec
> +//
> +
> +#include <linux/init.h>
> +#include <linux/module.h>
> +#include "realtek.h"
> +
> +static int alc260_parse_auto_config(struct hda_codec *codec)
> +{
> +	static const hda_nid_t alc260_ignore[] = { 0x17, 0 };
> +	static const hda_nid_t alc260_ssids[] = { 0x10, 0x15, 0x0f, 0 };
> +	return alc_parse_auto_config(codec, alc260_ignore, alc260_ssids);
> +}
> +
> +/*
> + * Pin config fixes
> + */
> +enum {
> +	ALC260_FIXUP_HP_DC5750,
> +	ALC260_FIXUP_HP_PIN_0F,
> +	ALC260_FIXUP_COEF,
> +	ALC260_FIXUP_GPIO1,
> +	ALC260_FIXUP_GPIO1_TOGGLE,
> +	ALC260_FIXUP_REPLACER,
> +	ALC260_FIXUP_HP_B1900,
> +	ALC260_FIXUP_KN1,
> +	ALC260_FIXUP_FSC_S7020,
> +	ALC260_FIXUP_FSC_S7020_JWSE,
> +	ALC260_FIXUP_VAIO_PINS,
> +};
> +
> +static void alc260_gpio1_automute(struct hda_codec *codec)
> +{
> +	struct alc_spec *spec = codec->spec;
> +
> +	alc_update_gpio_data(codec, 0x01, spec->gen.hp_jack_present);
> +}
> +
> +static void alc260_fixup_gpio1_toggle(struct hda_codec *codec,
> +				      const struct hda_fixup *fix, int action)
> +{
> +	struct alc_spec *spec = codec->spec;
> +	if (action == HDA_FIXUP_ACT_PROBE) {
> +		/* although the machine has only one output pin, we need to
> +		 * toggle GPIO1 according to the jack state
> +		 */
> +		spec->gen.automute_hook = alc260_gpio1_automute;
> +		spec->gen.detect_hp = 1;
> +		spec->gen.automute_speaker = 1;
> +		spec->gen.autocfg.hp_pins[0] = 0x0f; /* copy it for automute */
> +		snd_hda_jack_detect_enable_callback(codec, 0x0f,
> +						    snd_hda_gen_hp_automute);
> +		alc_setup_gpio(codec, 0x01);
> +	}
> +}
> +
> +static void alc260_fixup_kn1(struct hda_codec *codec,
> +			     const struct hda_fixup *fix, int action)
> +{
> +	struct alc_spec *spec = codec->spec;
> +	static const struct hda_pintbl pincfgs[] = {
> +		{ 0x0f, 0x02214000 }, /* HP/speaker */
> +		{ 0x12, 0x90a60160 }, /* int mic */
> +		{ 0x13, 0x02a19000 }, /* ext mic */
> +		{ 0x18, 0x01446000 }, /* SPDIF out */
> +		/* disable bogus I/O pins */
> +		{ 0x10, 0x411111f0 },
> +		{ 0x11, 0x411111f0 },
> +		{ 0x14, 0x411111f0 },
> +		{ 0x15, 0x411111f0 },
> +		{ 0x16, 0x411111f0 },
> +		{ 0x17, 0x411111f0 },
> +		{ 0x19, 0x411111f0 },
> +		{ }
> +	};
> +
> +	switch (action) {
> +	case HDA_FIXUP_ACT_PRE_PROBE:
> +		snd_hda_apply_pincfgs(codec, pincfgs);
> +		spec->init_amp = ALC_INIT_NONE;
> +		break;
> +	}
> +}
> +
> +static void alc260_fixup_fsc_s7020(struct hda_codec *codec,
> +				   const struct hda_fixup *fix, int action)
> +{
> +	struct alc_spec *spec = codec->spec;
> +	if (action == HDA_FIXUP_ACT_PRE_PROBE)
> +		spec->init_amp = ALC_INIT_NONE;
> +}
> +
> +static void alc260_fixup_fsc_s7020_jwse(struct hda_codec *codec,
> +				   const struct hda_fixup *fix, int action)
> +{
> +	struct alc_spec *spec = codec->spec;
> +	if (action == HDA_FIXUP_ACT_PRE_PROBE) {
> +		spec->gen.add_jack_modes = 1;
> +		spec->gen.hp_mic = 1;
> +	}
> +}
> +
> +static const struct hda_fixup alc260_fixups[] = {
> +	[ALC260_FIXUP_HP_DC5750] = {
> +		.type = HDA_FIXUP_PINS,
> +		.v.pins = (const struct hda_pintbl[]) {
> +			{ 0x11, 0x90130110 }, /* speaker */
> +			{ }
> +		}
> +	},
> +	[ALC260_FIXUP_HP_PIN_0F] = {
> +		.type = HDA_FIXUP_PINS,
> +		.v.pins = (const struct hda_pintbl[]) {
> +			{ 0x0f, 0x01214000 }, /* HP */
> +			{ }
> +		}
> +	},
> +	[ALC260_FIXUP_COEF] = {
> +		.type = HDA_FIXUP_VERBS,
> +		.v.verbs = (const struct hda_verb[]) {
> +			{ 0x1a, AC_VERB_SET_COEF_INDEX, 0x07 },
> +			{ 0x1a, AC_VERB_SET_PROC_COEF,  0x3040 },
> +			{ }
> +		},
> +	},
> +	[ALC260_FIXUP_GPIO1] = {
> +		.type = HDA_FIXUP_FUNC,
> +		.v.func = alc_fixup_gpio1,
> +	},
> +	[ALC260_FIXUP_GPIO1_TOGGLE] = {
> +		.type = HDA_FIXUP_FUNC,
> +		.v.func = alc260_fixup_gpio1_toggle,
> +		.chained = true,
> +		.chain_id = ALC260_FIXUP_HP_PIN_0F,
> +	},
> +	[ALC260_FIXUP_REPLACER] = {
> +		.type = HDA_FIXUP_VERBS,
> +		.v.verbs = (const struct hda_verb[]) {
> +			{ 0x1a, AC_VERB_SET_COEF_INDEX, 0x07 },
> +			{ 0x1a, AC_VERB_SET_PROC_COEF,  0x3050 },
> +			{ }
> +		},
> +		.chained = true,
> +		.chain_id = ALC260_FIXUP_GPIO1_TOGGLE,
> +	},
> +	[ALC260_FIXUP_HP_B1900] = {
> +		.type = HDA_FIXUP_FUNC,
> +		.v.func = alc260_fixup_gpio1_toggle,
> +		.chained = true,
> +		.chain_id = ALC260_FIXUP_COEF,
> +	},
> +	[ALC260_FIXUP_KN1] = {
> +		.type = HDA_FIXUP_FUNC,
> +		.v.func = alc260_fixup_kn1,
> +	},
> +	[ALC260_FIXUP_FSC_S7020] = {
> +		.type = HDA_FIXUP_FUNC,
> +		.v.func = alc260_fixup_fsc_s7020,
> +	},
> +	[ALC260_FIXUP_FSC_S7020_JWSE] = {
> +		.type = HDA_FIXUP_FUNC,
> +		.v.func = alc260_fixup_fsc_s7020_jwse,
> +		.chained = true,
> +		.chain_id = ALC260_FIXUP_FSC_S7020,
> +	},
> +	[ALC260_FIXUP_VAIO_PINS] = {
> +		.type = HDA_FIXUP_PINS,
> +		.v.pins = (const struct hda_pintbl[]) {
> +			/* Pin configs are missing completely on some VAIOs */
> +			{ 0x0f, 0x01211020 },
> +			{ 0x10, 0x0001003f },
> +			{ 0x11, 0x411111f0 },
> +			{ 0x12, 0x01a15930 },
> +			{ 0x13, 0x411111f0 },
> +			{ 0x14, 0x411111f0 },
> +			{ 0x15, 0x411111f0 },
> +			{ 0x16, 0x411111f0 },
> +			{ 0x17, 0x411111f0 },
> +			{ 0x18, 0x411111f0 },
> +			{ 0x19, 0x411111f0 },
> +			{ }
> +		}
> +	},
> +};
> +
> +static const struct hda_quirk alc260_fixup_tbl[] = {
> +	SND_PCI_QUIRK(0x1025, 0x007b, "Acer C20x", ALC260_FIXUP_GPIO1),
> +	SND_PCI_QUIRK(0x1025, 0x007f, "Acer Aspire 9500", ALC260_FIXUP_COEF),
> +	SND_PCI_QUIRK(0x1025, 0x008f, "Acer", ALC260_FIXUP_GPIO1),
> +	SND_PCI_QUIRK(0x103c, 0x280a, "HP dc5750", ALC260_FIXUP_HP_DC5750),
> +	SND_PCI_QUIRK(0x103c, 0x30ba, "HP Presario B1900", ALC260_FIXUP_HP_B1900),
> +	SND_PCI_QUIRK(0x104d, 0x81bb, "Sony VAIO", ALC260_FIXUP_VAIO_PINS),
> +	SND_PCI_QUIRK(0x104d, 0x81e2, "Sony VAIO TX", ALC260_FIXUP_HP_PIN_0F),
> +	SND_PCI_QUIRK(0x10cf, 0x1326, "FSC LifeBook S7020", ALC260_FIXUP_FSC_S7020),
> +	SND_PCI_QUIRK(0x1509, 0x4540, "Favorit 100XS", ALC260_FIXUP_GPIO1),
> +	SND_PCI_QUIRK(0x152d, 0x0729, "Quanta KN1", ALC260_FIXUP_KN1),
> +	SND_PCI_QUIRK(0x161f, 0x2057, "Replacer 672V", ALC260_FIXUP_REPLACER),
> +	SND_PCI_QUIRK(0x1631, 0xc017, "PB V7900", ALC260_FIXUP_COEF),
> +	{}
> +};
> +
> +static const struct hda_model_fixup alc260_fixup_models[] = {
> +	{.id = ALC260_FIXUP_GPIO1, .name = "gpio1"},
> +	{.id = ALC260_FIXUP_COEF, .name = "coef"},
> +	{.id = ALC260_FIXUP_FSC_S7020, .name = "fujitsu"},
> +	{.id = ALC260_FIXUP_FSC_S7020_JWSE, .name = "fujitsu-jwse"},
> +	{}
> +};
> +
> +/*
> + */
> +static int patch_alc260(struct hda_codec *codec)
> +{
> +	struct alc_spec *spec;
> +	int err;
> +
> +	err = alc_alloc_spec(codec, 0x07);
> +	if (err < 0)
> +		return err;
> +
> +	spec = codec->spec;
> +	/* as quite a few machines require HP amp for speaker outputs,
> +	 * it's easier to enable it unconditionally; even if it's unneeded,
> +	 * it's almost harmless.
> +	 */
> +	spec->gen.prefer_hp_amp = 1;
> +	spec->gen.beep_nid = 0x01;
> +
> +	spec->shutup = alc_eapd_shutup;
> +
> +	alc_pre_init(codec);
> +
> +	snd_hda_pick_fixup(codec, alc260_fixup_models, alc260_fixup_tbl,
> +			   alc260_fixups);
> +	snd_hda_apply_fixup(codec, HDA_FIXUP_ACT_PRE_PROBE);
> +
> +	/* automatic parse from the BIOS config */
> +	err = alc260_parse_auto_config(codec);
> +	if (err < 0)
> +		goto error;
> +
> +	if (!spec->gen.no_analog) {
> +		err = set_beep_amp(spec, 0x07, 0x05, HDA_INPUT);
> +		if (err < 0)
> +			goto error;
> +	}
> +
> +	snd_hda_apply_fixup(codec, HDA_FIXUP_ACT_PROBE);
> +
> +	return 0;
> +
> + error:
> +	alc_free(codec);
> +	return err;
> +}
> +
> +/*
> + * driver entries
> + */
> +static const struct hda_device_id snd_hda_id_alc260[] = {
> +	HDA_CODEC_ENTRY(0x10ec0260, "ALC260", patch_alc260),
> +	{} /* terminator */
> +};
> +MODULE_DEVICE_TABLE(hdaudio, snd_hda_id_alc260);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("Realtek ALC260 HD-audio codec");
> +MODULE_IMPORT_NS("SND_HDA_CODEC_REALTEK");
> +
> +static struct hda_codec_driver alc260_driver = {
> +	.id = snd_hda_id_alc260,
> +};
> +
> +module_hda_codec_driver(alc260_driver);
> diff --git a/sound/hda/codecs/realtek/alc262.c b/sound/hda/codecs/realtek/alc262.c
> new file mode 100644
> index 000000000000..ffe61f447667
> --- /dev/null
> +++ b/sound/hda/codecs/realtek/alc262.c
> @@ -0,0 +1,199 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +//
> +// Realtek ALC262 codec
> +//
> +
> +#include <linux/init.h>
> +#include <linux/module.h>
> +#include "realtek.h"
> +
> +static int alc262_parse_auto_config(struct hda_codec *codec)
> +{
> +	static const hda_nid_t alc262_ignore[] = { 0x1d, 0 };
> +	static const hda_nid_t alc262_ssids[] = { 0x15, 0x1b, 0x14, 0 };
> +	return alc_parse_auto_config(codec, alc262_ignore, alc262_ssids);
> +}
> +
> +/*
> + * Pin config fixes
> + */
> +enum {
> +	ALC262_FIXUP_FSC_H270,
> +	ALC262_FIXUP_FSC_S7110,
> +	ALC262_FIXUP_HP_Z200,
> +	ALC262_FIXUP_TYAN,
> +	ALC262_FIXUP_LENOVO_3000,
> +	ALC262_FIXUP_BENQ,
> +	ALC262_FIXUP_BENQ_T31,
> +	ALC262_FIXUP_INV_DMIC,
> +	ALC262_FIXUP_INTEL_BAYLEYBAY,
> +};
> +
> +static const struct hda_fixup alc262_fixups[] = {
> +	[ALC262_FIXUP_FSC_H270] = {
> +		.type = HDA_FIXUP_PINS,
> +		.v.pins = (const struct hda_pintbl[]) {
> +			{ 0x14, 0x99130110 }, /* speaker */
> +			{ 0x15, 0x0221142f }, /* front HP */
> +			{ 0x1b, 0x0121141f }, /* rear HP */
> +			{ }
> +		}
> +	},
> +	[ALC262_FIXUP_FSC_S7110] = {
> +		.type = HDA_FIXUP_PINS,
> +		.v.pins = (const struct hda_pintbl[]) {
> +			{ 0x15, 0x90170110 }, /* speaker */
> +			{ }
> +		},
> +		.chained = true,
> +		.chain_id = ALC262_FIXUP_BENQ,
> +	},
> +	[ALC262_FIXUP_HP_Z200] = {
> +		.type = HDA_FIXUP_PINS,
> +		.v.pins = (const struct hda_pintbl[]) {
> +			{ 0x16, 0x99130120 }, /* internal speaker */
> +			{ }
> +		}
> +	},
> +	[ALC262_FIXUP_TYAN] = {
> +		.type = HDA_FIXUP_PINS,
> +		.v.pins = (const struct hda_pintbl[]) {
> +			{ 0x14, 0x1993e1f0 }, /* int AUX */
> +			{ }
> +		}
> +	},
> +	[ALC262_FIXUP_LENOVO_3000] = {
> +		.type = HDA_FIXUP_PINCTLS,
> +		.v.pins = (const struct hda_pintbl[]) {
> +			{ 0x19, PIN_VREF50 },
> +			{}
> +		},
> +		.chained = true,
> +		.chain_id = ALC262_FIXUP_BENQ,
> +	},
> +	[ALC262_FIXUP_BENQ] = {
> +		.type = HDA_FIXUP_VERBS,
> +		.v.verbs = (const struct hda_verb[]) {
> +			{ 0x20, AC_VERB_SET_COEF_INDEX, 0x07 },
> +			{ 0x20, AC_VERB_SET_PROC_COEF, 0x3070 },
> +			{}
> +		}
> +	},
> +	[ALC262_FIXUP_BENQ_T31] = {
> +		.type = HDA_FIXUP_VERBS,
> +		.v.verbs = (const struct hda_verb[]) {
> +			{ 0x20, AC_VERB_SET_COEF_INDEX, 0x07 },
> +			{ 0x20, AC_VERB_SET_PROC_COEF, 0x3050 },
> +			{}
> +		}
> +	},
> +	[ALC262_FIXUP_INV_DMIC] = {
> +		.type = HDA_FIXUP_FUNC,
> +		.v.func = alc_fixup_inv_dmic,
> +	},
> +	[ALC262_FIXUP_INTEL_BAYLEYBAY] = {
> +		.type = HDA_FIXUP_FUNC,
> +		.v.func = alc_fixup_no_depop_delay,
> +	},
> +};
> +
> +static const struct hda_quirk alc262_fixup_tbl[] = {
> +	SND_PCI_QUIRK(0x103c, 0x170b, "HP Z200", ALC262_FIXUP_HP_Z200),
> +	SND_PCI_QUIRK(0x10cf, 0x1397, "Fujitsu Lifebook S7110", ALC262_FIXUP_FSC_S7110),
> +	SND_PCI_QUIRK(0x10cf, 0x142d, "Fujitsu Lifebook E8410", ALC262_FIXUP_BENQ),
> +	SND_PCI_QUIRK(0x10f1, 0x2915, "Tyan Thunder n6650W", ALC262_FIXUP_TYAN),
> +	SND_PCI_QUIRK(0x1734, 0x1141, "FSC ESPRIMO U9210", ALC262_FIXUP_FSC_H270),
> +	SND_PCI_QUIRK(0x1734, 0x1147, "FSC Celsius H270", ALC262_FIXUP_FSC_H270),
> +	SND_PCI_QUIRK(0x17aa, 0x384e, "Lenovo 3000", ALC262_FIXUP_LENOVO_3000),
> +	SND_PCI_QUIRK(0x17ff, 0x0560, "Benq ED8", ALC262_FIXUP_BENQ),
> +	SND_PCI_QUIRK(0x17ff, 0x058d, "Benq T31-16", ALC262_FIXUP_BENQ_T31),
> +	SND_PCI_QUIRK(0x8086, 0x7270, "BayleyBay", ALC262_FIXUP_INTEL_BAYLEYBAY),
> +	{}
> +};
> +
> +static const struct hda_model_fixup alc262_fixup_models[] = {
> +	{.id = ALC262_FIXUP_INV_DMIC, .name = "inv-dmic"},
> +	{.id = ALC262_FIXUP_FSC_H270, .name = "fsc-h270"},
> +	{.id = ALC262_FIXUP_FSC_S7110, .name = "fsc-s7110"},
> +	{.id = ALC262_FIXUP_HP_Z200, .name = "hp-z200"},
> +	{.id = ALC262_FIXUP_TYAN, .name = "tyan"},
> +	{.id = ALC262_FIXUP_LENOVO_3000, .name = "lenovo-3000"},
> +	{.id = ALC262_FIXUP_BENQ, .name = "benq"},
> +	{.id = ALC262_FIXUP_BENQ_T31, .name = "benq-t31"},
> +	{.id = ALC262_FIXUP_INTEL_BAYLEYBAY, .name = "bayleybay"},
> +	{}
> +};
> +
> +/*
> + */
> +static int patch_alc262(struct hda_codec *codec)
> +{
> +	struct alc_spec *spec;
> +	int err;
> +
> +	err = alc_alloc_spec(codec, 0x0b);
> +	if (err < 0)
> +		return err;
> +
> +	spec = codec->spec;
> +	spec->gen.shared_mic_vref_pin = 0x18;
> +
> +	spec->shutup = alc_eapd_shutup;
> +
> +#if 0
> +	/* pshou 07/11/05  set a zero PCM sample to DAC when FIFO is
> +	 * under-run
> +	 */
> +	alc_update_coefex_idx(codec, 0x1a, 7, 0, 0x80);
> +#endif
> +	alc_fix_pll_init(codec, 0x20, 0x0a, 10);
> +
> +	alc_pre_init(codec);
> +
> +	snd_hda_pick_fixup(codec, alc262_fixup_models, alc262_fixup_tbl,
> +		       alc262_fixups);
> +	snd_hda_apply_fixup(codec, HDA_FIXUP_ACT_PRE_PROBE);
> +
> +	alc_auto_parse_customize_define(codec);
> +
> +	if (has_cdefine_beep(codec))
> +		spec->gen.beep_nid = 0x01;
> +
> +	/* automatic parse from the BIOS config */
> +	err = alc262_parse_auto_config(codec);
> +	if (err < 0)
> +		goto error;
> +
> +	if (!spec->gen.no_analog && spec->gen.beep_nid) {
> +		err = set_beep_amp(spec, 0x0b, 0x05, HDA_INPUT);
> +		if (err < 0)
> +			goto error;
> +	}
> +
> +	snd_hda_apply_fixup(codec, HDA_FIXUP_ACT_PROBE);
> +
> +	return 0;
> +
> + error:
> +	alc_free(codec);
> +	return err;
> +}
> +
> +/*
> + * driver entries
> + */
> +static const struct hda_device_id snd_hda_id_alc262[] = {
> +	HDA_CODEC_ENTRY(0x10ec0262, "ALC262", patch_alc262),
> +	{} /* terminator */
> +};
> +MODULE_DEVICE_TABLE(hdaudio, snd_hda_id_alc262);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("Realtek ALC262 HD-audio codec");
> +MODULE_IMPORT_NS("SND_HDA_CODEC_REALTEK");
> +
> +static struct hda_codec_driver alc262_driver = {
> +	.id = snd_hda_id_alc262,
> +};
> +
> +module_hda_codec_driver(alc262_driver);
> diff --git a/sound/hda/codecs/realtek/alc268.c b/sound/hda/codecs/realtek/alc268.c
> new file mode 100644
> index 000000000000..d018f9982feb
> --- /dev/null
> +++ b/sound/hda/codecs/realtek/alc268.c
> @@ -0,0 +1,176 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +
> +#include <linux/init.h>
> +#include <linux/module.h>
> +#include "realtek.h"
> +
> +/* bind Beep switches of both NID 0x0f and 0x10 */
> +static int alc268_beep_switch_put(struct snd_kcontrol *kcontrol,
> +				  struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct hda_codec *codec = snd_kcontrol_chip(kcontrol);
> +	unsigned long pval;
> +	int err;
> +
> +	mutex_lock(&codec->control_mutex);
> +	pval = kcontrol->private_value;
> +	kcontrol->private_value = (pval & ~0xff) | 0x0f;
> +	err = snd_hda_mixer_amp_switch_put(kcontrol, ucontrol);
> +	if (err >= 0) {
> +		kcontrol->private_value = (pval & ~0xff) | 0x10;
> +		err = snd_hda_mixer_amp_switch_put(kcontrol, ucontrol);
> +	}
> +	kcontrol->private_value = pval;
> +	mutex_unlock(&codec->control_mutex);
> +	return err;
> +}
> +
> +static const struct snd_kcontrol_new alc268_beep_mixer[] = {
> +	HDA_CODEC_VOLUME("Beep Playback Volume", 0x1d, 0x0, HDA_INPUT),
> +	{
> +		.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
> +		.name = "Beep Playback Switch",
> +		.subdevice = HDA_SUBDEV_AMP_FLAG,
> +		.info = snd_hda_mixer_amp_switch_info,
> +		.get = snd_hda_mixer_amp_switch_get,
> +		.put = alc268_beep_switch_put,
> +		.private_value = HDA_COMPOSE_AMP_VAL(0x0f, 3, 1, HDA_INPUT)
> +	},
> +};
> +
> +/* set PCBEEP vol = 0, mute connections */
> +static const struct hda_verb alc268_beep_init_verbs[] = {
> +	{0x1d, AC_VERB_SET_AMP_GAIN_MUTE, AMP_IN_UNMUTE(0)},
> +	{0x0f, AC_VERB_SET_AMP_GAIN_MUTE, AMP_IN_MUTE(1)},
> +	{0x10, AC_VERB_SET_AMP_GAIN_MUTE, AMP_IN_MUTE(1)},
> +	{ }
> +};
> +
> +enum {
> +	ALC268_FIXUP_INV_DMIC,
> +	ALC268_FIXUP_HP_EAPD,
> +	ALC268_FIXUP_SPDIF,
> +};
> +
> +static const struct hda_fixup alc268_fixups[] = {
> +	[ALC268_FIXUP_INV_DMIC] = {
> +		.type = HDA_FIXUP_FUNC,
> +		.v.func = alc_fixup_inv_dmic,
> +	},
> +	[ALC268_FIXUP_HP_EAPD] = {
> +		.type = HDA_FIXUP_VERBS,
> +		.v.verbs = (const struct hda_verb[]) {
> +			{0x15, AC_VERB_SET_EAPD_BTLENABLE, 0},
> +			{}
> +		}
> +	},
> +	[ALC268_FIXUP_SPDIF] = {
> +		.type = HDA_FIXUP_PINS,
> +		.v.pins = (const struct hda_pintbl[]) {
> +			{ 0x1e, 0x014b1180 }, /* enable SPDIF out */
> +			{}
> +		}
> +	},
> +};
> +
> +static const struct hda_model_fixup alc268_fixup_models[] = {
> +	{.id = ALC268_FIXUP_INV_DMIC, .name = "inv-dmic"},
> +	{.id = ALC268_FIXUP_HP_EAPD, .name = "hp-eapd"},
> +	{.id = ALC268_FIXUP_SPDIF, .name = "spdif"},
> +	{}
> +};
> +
> +static const struct hda_quirk alc268_fixup_tbl[] = {
> +	SND_PCI_QUIRK(0x1025, 0x0139, "Acer TravelMate 6293", ALC268_FIXUP_SPDIF),
> +	SND_PCI_QUIRK(0x1025, 0x015b, "Acer AOA 150 (ZG5)", ALC268_FIXUP_INV_DMIC),
> +	/* below is codec SSID since multiple Toshiba laptops have the
> +	 * same PCI SSID 1179:ff00
> +	 */
> +	SND_PCI_QUIRK(0x1179, 0xff06, "Toshiba P200", ALC268_FIXUP_HP_EAPD),
> +	{}
> +};
> +
> +/*
> + * BIOS auto configuration
> + */
> +static int alc268_parse_auto_config(struct hda_codec *codec)
> +{
> +	static const hda_nid_t alc268_ssids[] = { 0x15, 0x1b, 0x14, 0 };
> +	return alc_parse_auto_config(codec, NULL, alc268_ssids);
> +}
> +
> +/*
> + */
> +static int patch_alc268(struct hda_codec *codec)
> +{
> +	struct alc_spec *spec;
> +	int i, err;
> +
> +	/* ALC268 has no aa-loopback mixer */
> +	err = alc_alloc_spec(codec, 0);
> +	if (err < 0)
> +		return err;
> +
> +	spec = codec->spec;
> +	if (has_cdefine_beep(codec))
> +		spec->gen.beep_nid = 0x01;
> +
> +	spec->shutup = alc_eapd_shutup;
> +
> +	alc_pre_init(codec);
> +
> +	snd_hda_pick_fixup(codec, alc268_fixup_models, alc268_fixup_tbl, alc268_fixups);
> +	snd_hda_apply_fixup(codec, HDA_FIXUP_ACT_PRE_PROBE);
> +
> +	/* automatic parse from the BIOS config */
> +	err = alc268_parse_auto_config(codec);
> +	if (err < 0)
> +		goto error;
> +
> +	if (err > 0 && !spec->gen.no_analog &&
> +	    spec->gen.autocfg.speaker_pins[0] != 0x1d) {
> +		for (i = 0; i < ARRAY_SIZE(alc268_beep_mixer); i++) {
> +			if (!snd_hda_gen_add_kctl(&spec->gen, NULL,
> +						  &alc268_beep_mixer[i])) {
> +				err = -ENOMEM;
> +				goto error;
> +			}
> +		}
> +		snd_hda_add_verbs(codec, alc268_beep_init_verbs);
> +		if (!query_amp_caps(codec, 0x1d, HDA_INPUT))
> +			/* override the amp caps for beep generator */
> +			snd_hda_override_amp_caps(codec, 0x1d, HDA_INPUT,
> +					  (0x0c << AC_AMPCAP_OFFSET_SHIFT) |
> +					  (0x0c << AC_AMPCAP_NUM_STEPS_SHIFT) |
> +					  (0x07 << AC_AMPCAP_STEP_SIZE_SHIFT) |
> +					  (0 << AC_AMPCAP_MUTE_SHIFT));
> +	}
> +
> +	snd_hda_apply_fixup(codec, HDA_FIXUP_ACT_PROBE);
> +
> +	return 0;
> +
> + error:
> +	alc_free(codec);
> +	return err;
> +}
> +
> +/*
> + * driver entries
> + */
> +static const struct hda_device_id snd_hda_id_alc268[] = {
> +	HDA_CODEC_ENTRY(0x10ec0267, "ALC267", patch_alc268),
> +	HDA_CODEC_ENTRY(0x10ec0268, "ALC268", patch_alc268),
> +	{} /* terminator */
> +};
> +MODULE_DEVICE_TABLE(hdaudio, snd_hda_id_alc268);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("Realtek ALC267/268 HD-audio codec");
> +MODULE_IMPORT_NS("SND_HDA_CODEC_REALTEK");
> +
> +static struct hda_codec_driver alc268_driver = {
> +	.id = snd_hda_id_alc268,
> +};
> +
> +module_hda_codec_driver(alc268_driver);
> diff --git a/sound/hda/codecs/realtek.c b/sound/hda/codecs/realtek/alc269.c
> similarity index 64%
> rename from sound/hda/codecs/realtek.c
> rename to sound/hda/codecs/realtek/alc269.c
> index 9c86c7bd1a90..325ba08e2981 100644
> --- a/sound/hda/codecs/realtek.c
> +++ b/sound/hda/codecs/realtek/alc269.c
> @@ -1,3160 +1,15 @@
>   // SPDX-License-Identifier: GPL-2.0-or-later
> -/*
> - * Universal Interface for Intel High Definition Audio Codec
> - *
> - * HD audio interface patch for Realtek ALC codecs
> - *
> - * Copyright (c) 2004 Kailang Yang <kailang@realtek.com.tw>
> - *                    PeiSen Hou <pshou@realtek.com.tw>
> - *                    Takashi Iwai <tiwai@suse.de>
> - *                    Jonathan Woithe <jwoithe@just42.net>
> - */
> +//
> +// Realtek ALC269 and compatible codecs
> +//
>   
> -#include <linux/acpi.h>
> -#include <linux/cleanup.h>
>   #include <linux/init.h>
> -#include <linux/delay.h>
> -#include <linux/slab.h>
> -#include <linux/pci.h>
> -#include <linux/dmi.h>
>   #include <linux/module.h>
> -#include <linux/i2c.h>
> -#include <linux/input.h>
> -#include <linux/leds.h>
> -#include <linux/ctype.h>
> -#include <linux/spi/spi.h>
> -#include <sound/core.h>
> -#include <sound/jack.h>
> -#include <sound/hda_codec.h>
> -#include "hda_local.h"
> -#include "hda_auto_parser.h"
> -#include "hda_beep.h"
> -#include "hda_jack.h"
> -#include "generic.h"
> -#include "side-codecs/hda_component.h"
> +#include "realtek.h"
>   
>   /* keep halting ALC5505 DSP, for power saving */
>   #define HALT_REALTEK_ALC5505
>   
> -/* extra amp-initialization sequence types */
> -enum {
> -	ALC_INIT_UNDEFINED,
> -	ALC_INIT_NONE,
> -	ALC_INIT_DEFAULT,
> -};
> -
> -enum {
> -	ALC_HEADSET_MODE_UNKNOWN,
> -	ALC_HEADSET_MODE_UNPLUGGED,
> -	ALC_HEADSET_MODE_HEADSET,
> -	ALC_HEADSET_MODE_MIC,
> -	ALC_HEADSET_MODE_HEADPHONE,
> -};
> -
> -enum {
> -	ALC_HEADSET_TYPE_UNKNOWN,
> -	ALC_HEADSET_TYPE_CTIA,
> -	ALC_HEADSET_TYPE_OMTP,
> -};
> -
> -enum {
> -	ALC_KEY_MICMUTE_INDEX,
> -};
> -
> -struct alc_customize_define {
> -	unsigned int  sku_cfg;
> -	unsigned char port_connectivity;
> -	unsigned char check_sum;
> -	unsigned char customization;
> -	unsigned char external_amp;
> -	unsigned int  enable_pcbeep:1;
> -	unsigned int  platform_type:1;
> -	unsigned int  swap:1;
> -	unsigned int  override:1;
> -	unsigned int  fixup:1; /* Means that this sku is set by driver, not read from hw */
> -};
> -
> -struct alc_coef_led {
> -	unsigned int idx;
> -	unsigned int mask;
> -	unsigned int on;
> -	unsigned int off;
> -};
> -
> -struct alc_spec {
> -	struct hda_gen_spec gen; /* must be at head */
> -
> -	/* codec parameterization */
> -	struct alc_customize_define cdefine;
> -	unsigned int parse_flags; /* flag for snd_hda_parse_pin_defcfg() */
> -
> -	/* GPIO bits */
> -	unsigned int gpio_mask;
> -	unsigned int gpio_dir;
> -	unsigned int gpio_data;
> -	bool gpio_write_delay;	/* add a delay before writing gpio_data */
> -
> -	/* mute LED for HP laptops, see vref_mute_led_set() */
> -	int mute_led_polarity;
> -	int micmute_led_polarity;
> -	hda_nid_t mute_led_nid;
> -	hda_nid_t cap_mute_led_nid;
> -
> -	unsigned int gpio_mute_led_mask;
> -	unsigned int gpio_mic_led_mask;
> -	struct alc_coef_led mute_led_coef;
> -	struct alc_coef_led mic_led_coef;
> -	struct mutex coef_mutex;
> -
> -	hda_nid_t headset_mic_pin;
> -	hda_nid_t headphone_mic_pin;
> -	int current_headset_mode;
> -	int current_headset_type;
> -
> -	/* hooks */
> -	void (*init_hook)(struct hda_codec *codec);
> -	void (*power_hook)(struct hda_codec *codec);
> -	void (*shutup)(struct hda_codec *codec);
> -
> -	int init_amp;
> -	int codec_variant;	/* flag for other variants */
> -	unsigned int has_alc5505_dsp:1;
> -	unsigned int no_depop_delay:1;
> -	unsigned int done_hp_init:1;
> -	unsigned int no_shutup_pins:1;
> -	unsigned int ultra_low_power:1;
> -	unsigned int has_hs_key:1;
> -	unsigned int no_internal_mic_pin:1;
> -	unsigned int en_3kpull_low:1;
> -	int num_speaker_amps;
> -
> -	/* for PLL fix */
> -	hda_nid_t pll_nid;
> -	unsigned int pll_coef_idx, pll_coef_bit;
> -	unsigned int coef0;
> -	struct input_dev *kb_dev;
> -	u8 alc_mute_keycode_map[1];
> -
> -	/* component binding */
> -	struct hda_component_parent comps;
> -};
> -
> -/*
> - * COEF access helper functions
> - */
> -
> -static void coef_mutex_lock(struct hda_codec *codec)
> -{
> -	struct alc_spec *spec = codec->spec;
> -
> -	snd_hda_power_up_pm(codec);
> -	mutex_lock(&spec->coef_mutex);
> -}
> -
> -static void coef_mutex_unlock(struct hda_codec *codec)
> -{
> -	struct alc_spec *spec = codec->spec;
> -
> -	mutex_unlock(&spec->coef_mutex);
> -	snd_hda_power_down_pm(codec);
> -}
> -
> -static int __alc_read_coefex_idx(struct hda_codec *codec, hda_nid_t nid,
> -				 unsigned int coef_idx)
> -{
> -	unsigned int val;
> -
> -	snd_hda_codec_write(codec, nid, 0, AC_VERB_SET_COEF_INDEX, coef_idx);
> -	val = snd_hda_codec_read(codec, nid, 0, AC_VERB_GET_PROC_COEF, 0);
> -	return val;
> -}
> -
> -static int alc_read_coefex_idx(struct hda_codec *codec, hda_nid_t nid,
> -			       unsigned int coef_idx)
> -{
> -	unsigned int val;
> -
> -	coef_mutex_lock(codec);
> -	val = __alc_read_coefex_idx(codec, nid, coef_idx);
> -	coef_mutex_unlock(codec);
> -	return val;
> -}
> -
> -#define alc_read_coef_idx(codec, coef_idx) \
> -	alc_read_coefex_idx(codec, 0x20, coef_idx)
> -
> -static void __alc_write_coefex_idx(struct hda_codec *codec, hda_nid_t nid,
> -				   unsigned int coef_idx, unsigned int coef_val)
> -{
> -	snd_hda_codec_write(codec, nid, 0, AC_VERB_SET_COEF_INDEX, coef_idx);
> -	snd_hda_codec_write(codec, nid, 0, AC_VERB_SET_PROC_COEF, coef_val);
> -}
> -
> -static void alc_write_coefex_idx(struct hda_codec *codec, hda_nid_t nid,
> -				 unsigned int coef_idx, unsigned int coef_val)
> -{
> -	coef_mutex_lock(codec);
> -	__alc_write_coefex_idx(codec, nid, coef_idx, coef_val);
> -	coef_mutex_unlock(codec);
> -}
> -
> -#define alc_write_coef_idx(codec, coef_idx, coef_val) \
> -	alc_write_coefex_idx(codec, 0x20, coef_idx, coef_val)
> -
> -static void __alc_update_coefex_idx(struct hda_codec *codec, hda_nid_t nid,
> -				    unsigned int coef_idx, unsigned int mask,
> -				    unsigned int bits_set)
> -{
> -	unsigned int val = __alc_read_coefex_idx(codec, nid, coef_idx);
> -
> -	if (val != -1)
> -		__alc_write_coefex_idx(codec, nid, coef_idx,
> -				       (val & ~mask) | bits_set);
> -}
> -
> -static void alc_update_coefex_idx(struct hda_codec *codec, hda_nid_t nid,
> -				  unsigned int coef_idx, unsigned int mask,
> -				  unsigned int bits_set)
> -{
> -	coef_mutex_lock(codec);
> -	__alc_update_coefex_idx(codec, nid, coef_idx, mask, bits_set);
> -	coef_mutex_unlock(codec);
> -}
> -
> -#define alc_update_coef_idx(codec, coef_idx, mask, bits_set)	\
> -	alc_update_coefex_idx(codec, 0x20, coef_idx, mask, bits_set)
> -
> -/* a special bypass for COEF 0; read the cached value at the second time */
> -static unsigned int alc_get_coef0(struct hda_codec *codec)
> -{
> -	struct alc_spec *spec = codec->spec;
> -
> -	if (!spec->coef0)
> -		spec->coef0 = alc_read_coef_idx(codec, 0);
> -	return spec->coef0;
> -}
> -
> -/* coef writes/updates batch */
> -struct coef_fw {
> -	unsigned char nid;
> -	unsigned char idx;
> -	unsigned short mask;
> -	unsigned short val;
> -};
> -
> -#define UPDATE_COEFEX(_nid, _idx, _mask, _val) \
> -	{ .nid = (_nid), .idx = (_idx), .mask = (_mask), .val = (_val) }
> -#define WRITE_COEFEX(_nid, _idx, _val) UPDATE_COEFEX(_nid, _idx, -1, _val)
> -#define WRITE_COEF(_idx, _val) WRITE_COEFEX(0x20, _idx, _val)
> -#define UPDATE_COEF(_idx, _mask, _val) UPDATE_COEFEX(0x20, _idx, _mask, _val)
> -
> -static void alc_process_coef_fw(struct hda_codec *codec,
> -				const struct coef_fw *fw)
> -{
> -	coef_mutex_lock(codec);
> -	for (; fw->nid; fw++) {
> -		if (fw->mask == (unsigned short)-1)
> -			__alc_write_coefex_idx(codec, fw->nid, fw->idx, fw->val);
> -		else
> -			__alc_update_coefex_idx(codec, fw->nid, fw->idx,
> -						fw->mask, fw->val);
> -	}
> -	coef_mutex_unlock(codec);
> -}
> -
> -/*
> - * GPIO setup tables, used in initialization
> - */
> -
> -/* Enable GPIO mask and set output */
> -static void alc_setup_gpio(struct hda_codec *codec, unsigned int mask)
> -{
> -	struct alc_spec *spec = codec->spec;
> -
> -	spec->gpio_mask |= mask;
> -	spec->gpio_dir |= mask;
> -	spec->gpio_data |= mask;
> -}
> -
> -static void alc_write_gpio_data(struct hda_codec *codec)
> -{
> -	struct alc_spec *spec = codec->spec;
> -
> -	snd_hda_codec_write(codec, 0x01, 0, AC_VERB_SET_GPIO_DATA,
> -			    spec->gpio_data);
> -}
> -
> -static void alc_update_gpio_data(struct hda_codec *codec, unsigned int mask,
> -				 bool on)
> -{
> -	struct alc_spec *spec = codec->spec;
> -	unsigned int oldval = spec->gpio_data;
> -
> -	if (on)
> -		spec->gpio_data |= mask;
> -	else
> -		spec->gpio_data &= ~mask;
> -	if (oldval != spec->gpio_data)
> -		alc_write_gpio_data(codec);
> -}
> -
> -static void alc_write_gpio(struct hda_codec *codec)
> -{
> -	struct alc_spec *spec = codec->spec;
> -
> -	if (!spec->gpio_mask)
> -		return;
> -
> -	snd_hda_codec_write(codec, codec->core.afg, 0,
> -			    AC_VERB_SET_GPIO_MASK, spec->gpio_mask);
> -	snd_hda_codec_write(codec, codec->core.afg, 0,
> -			    AC_VERB_SET_GPIO_DIRECTION, spec->gpio_dir);
> -	if (spec->gpio_write_delay)
> -		msleep(1);
> -	alc_write_gpio_data(codec);
> -}
> -
> -static void alc_fixup_gpio(struct hda_codec *codec, int action,
> -			   unsigned int mask)
> -{
> -	if (action == HDA_FIXUP_ACT_PRE_PROBE)
> -		alc_setup_gpio(codec, mask);
> -}
> -
> -static void alc_fixup_gpio1(struct hda_codec *codec,
> -			    const struct hda_fixup *fix, int action)
> -{
> -	alc_fixup_gpio(codec, action, 0x01);
> -}
> -
> -static void alc_fixup_gpio2(struct hda_codec *codec,
> -			    const struct hda_fixup *fix, int action)
> -{
> -	alc_fixup_gpio(codec, action, 0x02);
> -}
> -
> -static void alc_fixup_gpio3(struct hda_codec *codec,
> -			    const struct hda_fixup *fix, int action)
> -{
> -	alc_fixup_gpio(codec, action, 0x03);
> -}
> -
> -static void alc_fixup_gpio4(struct hda_codec *codec,
> -			    const struct hda_fixup *fix, int action)
> -{
> -	alc_fixup_gpio(codec, action, 0x04);
> -}
> -
> -static void alc_fixup_micmute_led(struct hda_codec *codec,
> -				  const struct hda_fixup *fix, int action)
> -{
> -	if (action == HDA_FIXUP_ACT_PRE_PROBE)
> -		snd_hda_gen_add_micmute_led_cdev(codec, NULL);
> -}
> -
> -/*
> - * Fix hardware PLL issue
> - * On some codecs, the analog PLL gating control must be off while
> - * the default value is 1.
> - */
> -static void alc_fix_pll(struct hda_codec *codec)
> -{
> -	struct alc_spec *spec = codec->spec;
> -
> -	if (spec->pll_nid)
> -		alc_update_coefex_idx(codec, spec->pll_nid, spec->pll_coef_idx,
> -				      1 << spec->pll_coef_bit, 0);
> -}
> -
> -static void alc_fix_pll_init(struct hda_codec *codec, hda_nid_t nid,
> -			     unsigned int coef_idx, unsigned int coef_bit)
> -{
> -	struct alc_spec *spec = codec->spec;
> -	spec->pll_nid = nid;
> -	spec->pll_coef_idx = coef_idx;
> -	spec->pll_coef_bit = coef_bit;
> -	alc_fix_pll(codec);
> -}
> -
> -/* update the master volume per volume-knob's unsol event */
> -static void alc_update_knob_master(struct hda_codec *codec,
> -				   struct hda_jack_callback *jack)
> -{
> -	unsigned int val;
> -	struct snd_kcontrol *kctl;
> -	struct snd_ctl_elem_value *uctl;
> -
> -	kctl = snd_hda_find_mixer_ctl(codec, "Master Playback Volume");
> -	if (!kctl)
> -		return;
> -	uctl = kzalloc(sizeof(*uctl), GFP_KERNEL);
> -	if (!uctl)
> -		return;
> -	val = snd_hda_codec_read(codec, jack->nid, 0,
> -				 AC_VERB_GET_VOLUME_KNOB_CONTROL, 0);
> -	val &= HDA_AMP_VOLMASK;
> -	uctl->value.integer.value[0] = val;
> -	uctl->value.integer.value[1] = val;
> -	kctl->put(kctl, uctl);
> -	kfree(uctl);
> -}
> -
> -static void alc880_unsol_event(struct hda_codec *codec, unsigned int res)
> -{
> -	/* For some reason, the res given from ALC880 is broken.
> -	   Here we adjust it properly. */
> -	snd_hda_jack_unsol_event(codec, res >> 2);
> -}
> -
> -/* Change EAPD to verb control */
> -static void alc_fill_eapd_coef(struct hda_codec *codec)
> -{
> -	int coef;
> -
> -	coef = alc_get_coef0(codec);
> -
> -	switch (codec->core.vendor_id) {
> -	case 0x10ec0262:
> -		alc_update_coef_idx(codec, 0x7, 0, 1<<5);
> -		break;
> -	case 0x10ec0267:
> -	case 0x10ec0268:
> -		alc_update_coef_idx(codec, 0x7, 0, 1<<13);
> -		break;
> -	case 0x10ec0269:
> -		if ((coef & 0x00f0) == 0x0010)
> -			alc_update_coef_idx(codec, 0xd, 0, 1<<14);
> -		if ((coef & 0x00f0) == 0x0020)
> -			alc_update_coef_idx(codec, 0x4, 1<<15, 0);
> -		if ((coef & 0x00f0) == 0x0030)
> -			alc_update_coef_idx(codec, 0x10, 1<<9, 0);
> -		break;
> -	case 0x10ec0280:
> -	case 0x10ec0284:
> -	case 0x10ec0290:
> -	case 0x10ec0292:
> -		alc_update_coef_idx(codec, 0x4, 1<<15, 0);
> -		break;
> -	case 0x10ec0225:
> -	case 0x10ec0295:
> -	case 0x10ec0299:
> -		alc_update_coef_idx(codec, 0x67, 0xf000, 0x3000);
> -		fallthrough;
> -	case 0x10ec0215:
> -	case 0x10ec0236:
> -	case 0x10ec0245:
> -	case 0x10ec0256:
> -	case 0x10ec0257:
> -	case 0x10ec0285:
> -	case 0x10ec0289:
> -		alc_update_coef_idx(codec, 0x36, 1<<13, 0);
> -		fallthrough;
> -	case 0x10ec0230:
> -	case 0x10ec0233:
> -	case 0x10ec0235:
> -	case 0x10ec0255:
> -	case 0x19e58326:
> -	case 0x10ec0282:
> -	case 0x10ec0283:
> -	case 0x10ec0286:
> -	case 0x10ec0288:
> -	case 0x10ec0298:
> -	case 0x10ec0300:
> -		alc_update_coef_idx(codec, 0x10, 1<<9, 0);
> -		break;
> -	case 0x10ec0275:
> -		alc_update_coef_idx(codec, 0xe, 0, 1<<0);
> -		break;
> -	case 0x10ec0287:
> -		alc_update_coef_idx(codec, 0x10, 1<<9, 0);
> -		alc_write_coef_idx(codec, 0x8, 0x4ab7);
> -		break;
> -	case 0x10ec0293:
> -		alc_update_coef_idx(codec, 0xa, 1<<13, 0);
> -		break;
> -	case 0x10ec0234:
> -	case 0x10ec0274:
> -		alc_write_coef_idx(codec, 0x6e, 0x0c25);
> -		fallthrough;
> -	case 0x10ec0294:
> -	case 0x10ec0700:
> -	case 0x10ec0701:
> -	case 0x10ec0703:
> -	case 0x10ec0711:
> -		alc_update_coef_idx(codec, 0x10, 1<<15, 0);
> -		break;
> -	case 0x10ec0662:
> -		if ((coef & 0x00f0) == 0x0030)
> -			alc_update_coef_idx(codec, 0x4, 1<<10, 0); /* EAPD Ctrl */
> -		break;
> -	case 0x10ec0272:
> -	case 0x10ec0273:
> -	case 0x10ec0663:
> -	case 0x10ec0665:
> -	case 0x10ec0670:
> -	case 0x10ec0671:
> -	case 0x10ec0672:
> -		alc_update_coef_idx(codec, 0xd, 0, 1<<14); /* EAPD Ctrl */
> -		break;
> -	case 0x10ec0222:
> -	case 0x10ec0623:
> -		alc_update_coef_idx(codec, 0x19, 1<<13, 0);
> -		break;
> -	case 0x10ec0668:
> -		alc_update_coef_idx(codec, 0x7, 3<<13, 0);
> -		break;
> -	case 0x10ec0867:
> -		alc_update_coef_idx(codec, 0x4, 1<<10, 0);
> -		break;
> -	case 0x10ec0888:
> -		if ((coef & 0x00f0) == 0x0020 || (coef & 0x00f0) == 0x0030)
> -			alc_update_coef_idx(codec, 0x7, 1<<5, 0);
> -		break;
> -	case 0x10ec0892:
> -	case 0x10ec0897:
> -		alc_update_coef_idx(codec, 0x7, 1<<5, 0);
> -		break;
> -	case 0x10ec0899:
> -	case 0x10ec0900:
> -	case 0x10ec0b00:
> -	case 0x10ec1168:
> -	case 0x10ec1220:
> -		alc_update_coef_idx(codec, 0x7, 1<<1, 0);
> -		break;
> -	}
> -}
> -
> -/* additional initialization for ALC888 variants */
> -static void alc888_coef_init(struct hda_codec *codec)
> -{
> -	switch (alc_get_coef0(codec) & 0x00f0) {
> -	/* alc888-VA */
> -	case 0x00:
> -	/* alc888-VB */
> -	case 0x10:
> -		alc_update_coef_idx(codec, 7, 0, 0x2030); /* Turn EAPD to High */
> -		break;
> -	}
> -}
> -
> -/* turn on/off EAPD control (only if available) */
> -static void set_eapd(struct hda_codec *codec, hda_nid_t nid, int on)
> -{
> -	if (get_wcaps_type(get_wcaps(codec, nid)) != AC_WID_PIN)
> -		return;
> -	if (snd_hda_query_pin_caps(codec, nid) & AC_PINCAP_EAPD)
> -		snd_hda_codec_write(codec, nid, 0, AC_VERB_SET_EAPD_BTLENABLE,
> -				    on ? 2 : 0);
> -}
> -
> -/* turn on/off EAPD controls of the codec */
> -static void alc_auto_setup_eapd(struct hda_codec *codec, bool on)
> -{
> -	/* We currently only handle front, HP */
> -	static const hda_nid_t pins[] = {
> -		0x0f, 0x10, 0x14, 0x15, 0x17, 0
> -	};
> -	const hda_nid_t *p;
> -	for (p = pins; *p; p++)
> -		set_eapd(codec, *p, on);
> -}
> -
> -static int find_ext_mic_pin(struct hda_codec *codec);
> -
> -static void alc_headset_mic_no_shutup(struct hda_codec *codec)
> -{
> -	const struct hda_pincfg *pin;
> -	int mic_pin = find_ext_mic_pin(codec);
> -	int i;
> -
> -	/* don't shut up pins when unloading the driver; otherwise it breaks
> -	 * the default pin setup at the next load of the driver
> -	 */
> -	if (codec->bus->shutdown)
> -		return;
> -
> -	snd_array_for_each(&codec->init_pins, i, pin) {
> -		/* use read here for syncing after issuing each verb */
> -		if (pin->nid != mic_pin)
> -			snd_hda_codec_read(codec, pin->nid, 0,
> -					AC_VERB_SET_PIN_WIDGET_CONTROL, 0);
> -	}
> -
> -	codec->pins_shutup = 1;
> -}
> -
> -static void alc_shutup_pins(struct hda_codec *codec)
> -{
> -	struct alc_spec *spec = codec->spec;
> -
> -	if (spec->no_shutup_pins)
> -		return;
> -
> -	switch (codec->core.vendor_id) {
> -	case 0x10ec0236:
> -	case 0x10ec0256:
> -	case 0x10ec0257:
> -	case 0x19e58326:
> -	case 0x10ec0283:
> -	case 0x10ec0285:
> -	case 0x10ec0286:
> -	case 0x10ec0287:
> -	case 0x10ec0288:
> -	case 0x10ec0295:
> -	case 0x10ec0298:
> -		alc_headset_mic_no_shutup(codec);
> -		break;
> -	default:
> -		snd_hda_shutup_pins(codec);
> -		break;
> -	}
> -}
> -
> -/* generic shutup callback;
> - * just turning off EAPD and a little pause for avoiding pop-noise
> - */
> -static void alc_eapd_shutup(struct hda_codec *codec)
> -{
> -	struct alc_spec *spec = codec->spec;
> -
> -	alc_auto_setup_eapd(codec, false);
> -	if (!spec->no_depop_delay)
> -		msleep(200);
> -	alc_shutup_pins(codec);
> -}
> -
> -/* generic EAPD initialization */
> -static void alc_auto_init_amp(struct hda_codec *codec, int type)
> -{
> -	alc_auto_setup_eapd(codec, true);
> -	alc_write_gpio(codec);
> -	switch (type) {
> -	case ALC_INIT_DEFAULT:
> -		switch (codec->core.vendor_id) {
> -		case 0x10ec0260:
> -			alc_update_coefex_idx(codec, 0x1a, 7, 0, 0x2010);
> -			break;
> -		case 0x10ec0880:
> -		case 0x10ec0882:
> -		case 0x10ec0883:
> -		case 0x10ec0885:
> -			alc_update_coef_idx(codec, 7, 0, 0x2030);
> -			break;
> -		case 0x10ec0888:
> -			alc888_coef_init(codec);
> -			break;
> -		}
> -		break;
> -	}
> -}
> -
> -/* get a primary headphone pin if available */
> -static hda_nid_t alc_get_hp_pin(struct alc_spec *spec)
> -{
> -	if (spec->gen.autocfg.hp_pins[0])
> -		return spec->gen.autocfg.hp_pins[0];
> -	if (spec->gen.autocfg.line_out_type == AC_JACK_HP_OUT)
> -		return spec->gen.autocfg.line_out_pins[0];
> -	return 0;
> -}
> -
> -/*
> - * Realtek SSID verification
> - */
> -
> -/* Could be any non-zero and even value. When used as fixup, tells
> - * the driver to ignore any present sku defines.
> - */
> -#define ALC_FIXUP_SKU_IGNORE (2)
> -
> -static void alc_fixup_sku_ignore(struct hda_codec *codec,
> -				 const struct hda_fixup *fix, int action)
> -{
> -	struct alc_spec *spec = codec->spec;
> -	if (action == HDA_FIXUP_ACT_PRE_PROBE) {
> -		spec->cdefine.fixup = 1;
> -		spec->cdefine.sku_cfg = ALC_FIXUP_SKU_IGNORE;
> -	}
> -}
> -
> -static void alc_fixup_no_depop_delay(struct hda_codec *codec,
> -				    const struct hda_fixup *fix, int action)
> -{
> -	struct alc_spec *spec = codec->spec;
> -
> -	if (action == HDA_FIXUP_ACT_PROBE) {
> -		spec->no_depop_delay = 1;
> -		codec->depop_delay = 0;
> -	}
> -}
> -
> -static int alc_auto_parse_customize_define(struct hda_codec *codec)
> -{
> -	unsigned int ass, tmp, i;
> -	unsigned nid = 0;
> -	struct alc_spec *spec = codec->spec;
> -
> -	spec->cdefine.enable_pcbeep = 1; /* assume always enabled */
> -
> -	if (spec->cdefine.fixup) {
> -		ass = spec->cdefine.sku_cfg;
> -		if (ass == ALC_FIXUP_SKU_IGNORE)
> -			return -1;
> -		goto do_sku;
> -	}
> -
> -	if (!codec->bus->pci)
> -		return -1;
> -	ass = codec->core.subsystem_id & 0xffff;
> -	if (ass != codec->bus->pci->subsystem_device && (ass & 1))
> -		goto do_sku;
> -
> -	nid = 0x1d;
> -	if (codec->core.vendor_id == 0x10ec0260)
> -		nid = 0x17;
> -	ass = snd_hda_codec_get_pincfg(codec, nid);
> -
> -	if (!(ass & 1)) {
> -		codec_info(codec, "%s: SKU not ready 0x%08x\n",
> -			   codec->core.chip_name, ass);
> -		return -1;
> -	}
> -
> -	/* check sum */
> -	tmp = 0;
> -	for (i = 1; i < 16; i++) {
> -		if ((ass >> i) & 1)
> -			tmp++;
> -	}
> -	if (((ass >> 16) & 0xf) != tmp)
> -		return -1;
> -
> -	spec->cdefine.port_connectivity = ass >> 30;
> -	spec->cdefine.enable_pcbeep = (ass & 0x100000) >> 20;
> -	spec->cdefine.check_sum = (ass >> 16) & 0xf;
> -	spec->cdefine.customization = ass >> 8;
> -do_sku:
> -	spec->cdefine.sku_cfg = ass;
> -	spec->cdefine.external_amp = (ass & 0x38) >> 3;
> -	spec->cdefine.platform_type = (ass & 0x4) >> 2;
> -	spec->cdefine.swap = (ass & 0x2) >> 1;
> -	spec->cdefine.override = ass & 0x1;
> -
> -	codec_dbg(codec, "SKU: Nid=0x%x sku_cfg=0x%08x\n",
> -		   nid, spec->cdefine.sku_cfg);
> -	codec_dbg(codec, "SKU: port_connectivity=0x%x\n",
> -		   spec->cdefine.port_connectivity);
> -	codec_dbg(codec, "SKU: enable_pcbeep=0x%x\n", spec->cdefine.enable_pcbeep);
> -	codec_dbg(codec, "SKU: check_sum=0x%08x\n", spec->cdefine.check_sum);
> -	codec_dbg(codec, "SKU: customization=0x%08x\n", spec->cdefine.customization);
> -	codec_dbg(codec, "SKU: external_amp=0x%x\n", spec->cdefine.external_amp);
> -	codec_dbg(codec, "SKU: platform_type=0x%x\n", spec->cdefine.platform_type);
> -	codec_dbg(codec, "SKU: swap=0x%x\n", spec->cdefine.swap);
> -	codec_dbg(codec, "SKU: override=0x%x\n", spec->cdefine.override);
> -
> -	return 0;
> -}
> -
> -/* return the position of NID in the list, or -1 if not found */
> -static int find_idx_in_nid_list(hda_nid_t nid, const hda_nid_t *list, int nums)
> -{
> -	int i;
> -	for (i = 0; i < nums; i++)
> -		if (list[i] == nid)
> -			return i;
> -	return -1;
> -}
> -/* return true if the given NID is found in the list */
> -static bool found_in_nid_list(hda_nid_t nid, const hda_nid_t *list, int nums)
> -{
> -	return find_idx_in_nid_list(nid, list, nums) >= 0;
> -}
> -
> -/* check subsystem ID and set up device-specific initialization;
> - * return 1 if initialized, 0 if invalid SSID
> - */
> -/* 32-bit subsystem ID for BIOS loading in HD Audio codec.
> - *	31 ~ 16 :	Manufacture ID
> - *	15 ~ 8	:	SKU ID
> - *	7  ~ 0	:	Assembly ID
> - *	port-A --> pin 39/41, port-E --> pin 14/15, port-D --> pin 35/36
> - */
> -static int alc_subsystem_id(struct hda_codec *codec, const hda_nid_t *ports)
> -{
> -	unsigned int ass, tmp, i;
> -	unsigned nid;
> -	struct alc_spec *spec = codec->spec;
> -
> -	if (spec->cdefine.fixup) {
> -		ass = spec->cdefine.sku_cfg;
> -		if (ass == ALC_FIXUP_SKU_IGNORE)
> -			return 0;
> -		goto do_sku;
> -	}
> -
> -	ass = codec->core.subsystem_id & 0xffff;
> -	if (codec->bus->pci &&
> -	    ass != codec->bus->pci->subsystem_device && (ass & 1))
> -		goto do_sku;
> -
> -	/* invalid SSID, check the special NID pin defcfg instead */
> -	/*
> -	 * 31~30	: port connectivity
> -	 * 29~21	: reserve
> -	 * 20		: PCBEEP input
> -	 * 19~16	: Check sum (15:1)
> -	 * 15~1		: Custom
> -	 * 0		: override
> -	*/
> -	nid = 0x1d;
> -	if (codec->core.vendor_id == 0x10ec0260)
> -		nid = 0x17;
> -	ass = snd_hda_codec_get_pincfg(codec, nid);
> -	codec_dbg(codec,
> -		  "realtek: No valid SSID, checking pincfg 0x%08x for NID 0x%x\n",
> -		   ass, nid);
> -	if (!(ass & 1))
> -		return 0;
> -	if ((ass >> 30) != 1)	/* no physical connection */
> -		return 0;
> -
> -	/* check sum */
> -	tmp = 0;
> -	for (i = 1; i < 16; i++) {
> -		if ((ass >> i) & 1)
> -			tmp++;
> -	}
> -	if (((ass >> 16) & 0xf) != tmp)
> -		return 0;
> -do_sku:
> -	codec_dbg(codec, "realtek: Enabling init ASM_ID=0x%04x CODEC_ID=%08x\n",
> -		   ass & 0xffff, codec->core.vendor_id);
> -	/*
> -	 * 0 : override
> -	 * 1 :	Swap Jack
> -	 * 2 : 0 --> Desktop, 1 --> Laptop
> -	 * 3~5 : External Amplifier control
> -	 * 7~6 : Reserved
> -	*/
> -	tmp = (ass & 0x38) >> 3;	/* external Amp control */
> -	if (spec->init_amp == ALC_INIT_UNDEFINED) {
> -		switch (tmp) {
> -		case 1:
> -			alc_setup_gpio(codec, 0x01);
> -			break;
> -		case 3:
> -			alc_setup_gpio(codec, 0x02);
> -			break;
> -		case 7:
> -			alc_setup_gpio(codec, 0x04);
> -			break;
> -		case 5:
> -		default:
> -			spec->init_amp = ALC_INIT_DEFAULT;
> -			break;
> -		}
> -	}
> -
> -	/* is laptop or Desktop and enable the function "Mute internal speaker
> -	 * when the external headphone out jack is plugged"
> -	 */
> -	if (!(ass & 0x8000))
> -		return 1;
> -	/*
> -	 * 10~8 : Jack location
> -	 * 12~11: Headphone out -> 00: PortA, 01: PortE, 02: PortD, 03: Resvered
> -	 * 14~13: Resvered
> -	 * 15   : 1 --> enable the function "Mute internal speaker
> -	 *	        when the external headphone out jack is plugged"
> -	 */
> -	if (!alc_get_hp_pin(spec)) {
> -		hda_nid_t nid;
> -		tmp = (ass >> 11) & 0x3;	/* HP to chassis */
> -		nid = ports[tmp];
> -		if (found_in_nid_list(nid, spec->gen.autocfg.line_out_pins,
> -				      spec->gen.autocfg.line_outs))
> -			return 1;
> -		spec->gen.autocfg.hp_pins[0] = nid;
> -	}
> -	return 1;
> -}
> -
> -/* Check the validity of ALC subsystem-id
> - * ports contains an array of 4 pin NIDs for port-A, E, D and I */
> -static void alc_ssid_check(struct hda_codec *codec, const hda_nid_t *ports)
> -{
> -	if (!alc_subsystem_id(codec, ports)) {
> -		struct alc_spec *spec = codec->spec;
> -		if (spec->init_amp == ALC_INIT_UNDEFINED) {
> -			codec_dbg(codec,
> -				  "realtek: Enable default setup for auto mode as fallback\n");
> -			spec->init_amp = ALC_INIT_DEFAULT;
> -		}
> -	}
> -}
> -
> -/* inverted digital-mic */
> -static void alc_fixup_inv_dmic(struct hda_codec *codec,
> -			       const struct hda_fixup *fix, int action)
> -{
> -	struct alc_spec *spec = codec->spec;
> -
> -	spec->gen.inv_dmic_split = 1;
> -}
> -
> -
> -static int alc_build_controls(struct hda_codec *codec)
> -{
> -	int err;
> -
> -	err = snd_hda_gen_build_controls(codec);
> -	if (err < 0)
> -		return err;
> -
> -	snd_hda_apply_fixup(codec, HDA_FIXUP_ACT_BUILD);
> -	return 0;
> -}
> -
> -
> -/*
> - * Common callbacks
> - */
> -
> -static void alc_pre_init(struct hda_codec *codec)
> -{
> -	alc_fill_eapd_coef(codec);
> -}
> -
> -#define is_s3_resume(codec) \
> -	((codec)->core.dev.power.power_state.event == PM_EVENT_RESUME)
> -#define is_s4_resume(codec) \
> -	((codec)->core.dev.power.power_state.event == PM_EVENT_RESTORE)
> -#define is_s4_suspend(codec) \
> -	((codec)->core.dev.power.power_state.event == PM_EVENT_FREEZE)
> -
> -static int alc_init(struct hda_codec *codec)
> -{
> -	struct alc_spec *spec = codec->spec;
> -
> -	/* hibernation resume needs the full chip initialization */
> -	if (is_s4_resume(codec))
> -		alc_pre_init(codec);
> -
> -	if (spec->init_hook)
> -		spec->init_hook(codec);
> -
> -	spec->gen.skip_verbs = 1; /* applied in below */
> -	snd_hda_gen_init(codec);
> -	alc_fix_pll(codec);
> -	alc_auto_init_amp(codec, spec->init_amp);
> -	snd_hda_apply_verbs(codec); /* apply verbs here after own init */
> -
> -	snd_hda_apply_fixup(codec, HDA_FIXUP_ACT_INIT);
> -
> -	return 0;
> -}
> -
> -/* forward declaration */
> -static const struct component_master_ops comp_master_ops;
> -
> -static void alc_free(struct hda_codec *codec)
> -{
> -	struct alc_spec *spec = codec->spec;
> -
> -	if (spec)
> -		hda_component_manager_free(&spec->comps, &comp_master_ops);
> -
> -	snd_hda_gen_free(codec);
> -}
> -
> -static inline void alc_shutup(struct hda_codec *codec)
> -{
> -	struct alc_spec *spec = codec->spec;
> -
> -	if (!snd_hda_get_bool_hint(codec, "shutup"))
> -		return; /* disabled explicitly by hints */
> -
> -	if (spec && spec->shutup)
> -		spec->shutup(codec);
> -	else
> -		alc_shutup_pins(codec);
> -}
> -
> -static void alc_power_eapd(struct hda_codec *codec)
> -{
> -	alc_auto_setup_eapd(codec, false);
> -}
> -
> -static int alc_suspend(struct hda_codec *codec)
> -{
> -	struct alc_spec *spec = codec->spec;
> -	alc_shutup(codec);
> -	if (spec && spec->power_hook)
> -		spec->power_hook(codec);
> -	return 0;
> -}
> -
> -static int alc_resume(struct hda_codec *codec)
> -{
> -	struct alc_spec *spec = codec->spec;
> -
> -	if (!spec->no_depop_delay)
> -		msleep(150); /* to avoid pop noise */
> -	codec->patch_ops.init(codec);
> -	snd_hda_regmap_sync(codec);
> -	hda_call_check_power_status(codec, 0x01);
> -	return 0;
> -}
> -
> -/*
> - */
> -static const struct hda_codec_ops alc_patch_ops = {
> -	.build_controls = alc_build_controls,
> -	.build_pcms = snd_hda_gen_build_pcms,
> -	.init = alc_init,
> -	.free = alc_free,
> -	.unsol_event = snd_hda_jack_unsol_event,
> -	.resume = alc_resume,
> -	.suspend = alc_suspend,
> -	.check_power_status = snd_hda_gen_check_power_status,
> -};
> -
> -
> -#define alc_codec_rename(codec, name) snd_hda_codec_set_name(codec, name)
> -
> -/*
> - * Rename codecs appropriately from COEF value or subvendor id
> - */
> -struct alc_codec_rename_table {
> -	unsigned int vendor_id;
> -	unsigned short coef_mask;
> -	unsigned short coef_bits;
> -	const char *name;
> -};
> -
> -struct alc_codec_rename_pci_table {
> -	unsigned int codec_vendor_id;
> -	unsigned short pci_subvendor;
> -	unsigned short pci_subdevice;
> -	const char *name;
> -};
> -
> -static const struct alc_codec_rename_table rename_tbl[] = {
> -	{ 0x10ec0221, 0xf00f, 0x1003, "ALC231" },
> -	{ 0x10ec0269, 0xfff0, 0x3010, "ALC277" },
> -	{ 0x10ec0269, 0xf0f0, 0x2010, "ALC259" },
> -	{ 0x10ec0269, 0xf0f0, 0x3010, "ALC258" },
> -	{ 0x10ec0269, 0x00f0, 0x0010, "ALC269VB" },
> -	{ 0x10ec0269, 0xffff, 0xa023, "ALC259" },
> -	{ 0x10ec0269, 0xffff, 0x6023, "ALC281X" },
> -	{ 0x10ec0269, 0x00f0, 0x0020, "ALC269VC" },
> -	{ 0x10ec0269, 0x00f0, 0x0030, "ALC269VD" },
> -	{ 0x10ec0662, 0xffff, 0x4020, "ALC656" },
> -	{ 0x10ec0887, 0x00f0, 0x0030, "ALC887-VD" },
> -	{ 0x10ec0888, 0x00f0, 0x0030, "ALC888-VD" },
> -	{ 0x10ec0888, 0xf0f0, 0x3020, "ALC886" },
> -	{ 0x10ec0899, 0x2000, 0x2000, "ALC899" },
> -	{ 0x10ec0892, 0xffff, 0x8020, "ALC661" },
> -	{ 0x10ec0892, 0xffff, 0x8011, "ALC661" },
> -	{ 0x10ec0892, 0xffff, 0x4011, "ALC656" },
> -	{ } /* terminator */
> -};
> -
> -static const struct alc_codec_rename_pci_table rename_pci_tbl[] = {
> -	{ 0x10ec0280, 0x1028, 0, "ALC3220" },
> -	{ 0x10ec0282, 0x1028, 0, "ALC3221" },
> -	{ 0x10ec0283, 0x1028, 0, "ALC3223" },
> -	{ 0x10ec0288, 0x1028, 0, "ALC3263" },
> -	{ 0x10ec0292, 0x1028, 0, "ALC3226" },
> -	{ 0x10ec0293, 0x1028, 0, "ALC3235" },
> -	{ 0x10ec0255, 0x1028, 0, "ALC3234" },
> -	{ 0x10ec0668, 0x1028, 0, "ALC3661" },
> -	{ 0x10ec0275, 0x1028, 0, "ALC3260" },
> -	{ 0x10ec0899, 0x1028, 0, "ALC3861" },
> -	{ 0x10ec0298, 0x1028, 0, "ALC3266" },
> -	{ 0x10ec0236, 0x1028, 0, "ALC3204" },
> -	{ 0x10ec0256, 0x1028, 0, "ALC3246" },
> -	{ 0x10ec0225, 0x1028, 0, "ALC3253" },
> -	{ 0x10ec0295, 0x1028, 0, "ALC3254" },
> -	{ 0x10ec0299, 0x1028, 0, "ALC3271" },
> -	{ 0x10ec0670, 0x1025, 0, "ALC669X" },
> -	{ 0x10ec0676, 0x1025, 0, "ALC679X" },
> -	{ 0x10ec0282, 0x1043, 0, "ALC3229" },
> -	{ 0x10ec0233, 0x1043, 0, "ALC3236" },
> -	{ 0x10ec0280, 0x103c, 0, "ALC3228" },
> -	{ 0x10ec0282, 0x103c, 0, "ALC3227" },
> -	{ 0x10ec0286, 0x103c, 0, "ALC3242" },
> -	{ 0x10ec0290, 0x103c, 0, "ALC3241" },
> -	{ 0x10ec0668, 0x103c, 0, "ALC3662" },
> -	{ 0x10ec0283, 0x17aa, 0, "ALC3239" },
> -	{ 0x10ec0292, 0x17aa, 0, "ALC3232" },
> -	{ 0x10ec0257, 0x12f0, 0, "ALC3328" },
> -	{ } /* terminator */
> -};
> -
> -static int alc_codec_rename_from_preset(struct hda_codec *codec)
> -{
> -	const struct alc_codec_rename_table *p;
> -	const struct alc_codec_rename_pci_table *q;
> -
> -	for (p = rename_tbl; p->vendor_id; p++) {
> -		if (p->vendor_id != codec->core.vendor_id)
> -			continue;
> -		if ((alc_get_coef0(codec) & p->coef_mask) == p->coef_bits)
> -			return alc_codec_rename(codec, p->name);
> -	}
> -
> -	if (!codec->bus->pci)
> -		return 0;
> -	for (q = rename_pci_tbl; q->codec_vendor_id; q++) {
> -		if (q->codec_vendor_id != codec->core.vendor_id)
> -			continue;
> -		if (q->pci_subvendor != codec->bus->pci->subsystem_vendor)
> -			continue;
> -		if (!q->pci_subdevice ||
> -		    q->pci_subdevice == codec->bus->pci->subsystem_device)
> -			return alc_codec_rename(codec, q->name);
> -	}
> -
> -	return 0;
> -}
> -
> -
> -/*
> - * Digital-beep handlers
> - */
> -#ifdef CONFIG_SND_HDA_INPUT_BEEP
> -
> -/* additional beep mixers; private_value will be overwritten */
> -static const struct snd_kcontrol_new alc_beep_mixer[] = {
> -	HDA_CODEC_VOLUME("Beep Playback Volume", 0, 0, HDA_INPUT),
> -	HDA_CODEC_MUTE_BEEP("Beep Playback Switch", 0, 0, HDA_INPUT),
> -};
> -
> -/* set up and create beep controls */
> -static int set_beep_amp(struct alc_spec *spec, hda_nid_t nid,
> -			int idx, int dir)
> -{
> -	struct snd_kcontrol_new *knew;
> -	unsigned int beep_amp = HDA_COMPOSE_AMP_VAL(nid, 3, idx, dir);
> -	int i;
> -
> -	for (i = 0; i < ARRAY_SIZE(alc_beep_mixer); i++) {
> -		knew = snd_hda_gen_add_kctl(&spec->gen, NULL,
> -					    &alc_beep_mixer[i]);
> -		if (!knew)
> -			return -ENOMEM;
> -		knew->private_value = beep_amp;
> -	}
> -	return 0;
> -}
> -
> -static const struct snd_pci_quirk beep_allow_list[] = {
> -	SND_PCI_QUIRK(0x1043, 0x103c, "ASUS", 1),
> -	SND_PCI_QUIRK(0x1043, 0x115d, "ASUS", 1),
> -	SND_PCI_QUIRK(0x1043, 0x829f, "ASUS", 1),
> -	SND_PCI_QUIRK(0x1043, 0x8376, "EeePC", 1),
> -	SND_PCI_QUIRK(0x1043, 0x83ce, "EeePC", 1),
> -	SND_PCI_QUIRK(0x1043, 0x831a, "EeePC", 1),
> -	SND_PCI_QUIRK(0x1043, 0x834a, "EeePC", 1),
> -	SND_PCI_QUIRK(0x1458, 0xa002, "GA-MA790X", 1),
> -	SND_PCI_QUIRK(0x8086, 0xd613, "Intel", 1),
> -	/* denylist -- no beep available */
> -	SND_PCI_QUIRK(0x17aa, 0x309e, "Lenovo ThinkCentre M73", 0),
> -	SND_PCI_QUIRK(0x17aa, 0x30a3, "Lenovo ThinkCentre M93", 0),
> -	{}
> -};
> -
> -static inline int has_cdefine_beep(struct hda_codec *codec)
> -{
> -	struct alc_spec *spec = codec->spec;
> -	const struct snd_pci_quirk *q;
> -	q = snd_pci_quirk_lookup(codec->bus->pci, beep_allow_list);
> -	if (q)
> -		return q->value;
> -	return spec->cdefine.enable_pcbeep;
> -}
> -#else
> -#define set_beep_amp(spec, nid, idx, dir)	0
> -#define has_cdefine_beep(codec)		0
> -#endif
> -
> -/* parse the BIOS configuration and set up the alc_spec */
> -/* return 1 if successful, 0 if the proper config is not found,
> - * or a negative error code
> - */
> -static int alc_parse_auto_config(struct hda_codec *codec,
> -				 const hda_nid_t *ignore_nids,
> -				 const hda_nid_t *ssid_nids)
> -{
> -	struct alc_spec *spec = codec->spec;
> -	struct auto_pin_cfg *cfg = &spec->gen.autocfg;
> -	int err;
> -
> -	err = snd_hda_parse_pin_defcfg(codec, cfg, ignore_nids,
> -				       spec->parse_flags);
> -	if (err < 0)
> -		return err;
> -
> -	if (ssid_nids)
> -		alc_ssid_check(codec, ssid_nids);
> -
> -	err = snd_hda_gen_parse_auto_config(codec, cfg);
> -	if (err < 0)
> -		return err;
> -
> -	return 1;
> -}
> -
> -/* common preparation job for alc_spec */
> -static int alc_alloc_spec(struct hda_codec *codec, hda_nid_t mixer_nid)
> -{
> -	struct alc_spec *spec = kzalloc(sizeof(*spec), GFP_KERNEL);
> -	int err;
> -
> -	if (!spec)
> -		return -ENOMEM;
> -	codec->spec = spec;
> -	snd_hda_gen_spec_init(&spec->gen);
> -	spec->gen.mixer_nid = mixer_nid;
> -	spec->gen.own_eapd_ctl = 1;
> -	codec->single_adc_amp = 1;
> -	/* FIXME: do we need this for all Realtek codec models? */
> -	codec->spdif_status_reset = 1;
> -	codec->forced_resume = 1;
> -	codec->patch_ops = alc_patch_ops;
> -	mutex_init(&spec->coef_mutex);
> -
> -	err = alc_codec_rename_from_preset(codec);
> -	if (err < 0) {
> -		kfree(spec);
> -		return err;
> -	}
> -	return 0;
> -}
> -
> -static int alc880_parse_auto_config(struct hda_codec *codec)
> -{
> -	static const hda_nid_t alc880_ignore[] = { 0x1d, 0 };
> -	static const hda_nid_t alc880_ssids[] = { 0x15, 0x1b, 0x14, 0 };
> -	return alc_parse_auto_config(codec, alc880_ignore, alc880_ssids);
> -}
> -
> -/*
> - * ALC880 fix-ups
> - */
> -enum {
> -	ALC880_FIXUP_GPIO1,
> -	ALC880_FIXUP_GPIO2,
> -	ALC880_FIXUP_MEDION_RIM,
> -	ALC880_FIXUP_LG,
> -	ALC880_FIXUP_LG_LW25,
> -	ALC880_FIXUP_W810,
> -	ALC880_FIXUP_EAPD_COEF,
> -	ALC880_FIXUP_TCL_S700,
> -	ALC880_FIXUP_VOL_KNOB,
> -	ALC880_FIXUP_FUJITSU,
> -	ALC880_FIXUP_F1734,
> -	ALC880_FIXUP_UNIWILL,
> -	ALC880_FIXUP_UNIWILL_DIG,
> -	ALC880_FIXUP_Z71V,
> -	ALC880_FIXUP_ASUS_W5A,
> -	ALC880_FIXUP_3ST_BASE,
> -	ALC880_FIXUP_3ST,
> -	ALC880_FIXUP_3ST_DIG,
> -	ALC880_FIXUP_5ST_BASE,
> -	ALC880_FIXUP_5ST,
> -	ALC880_FIXUP_5ST_DIG,
> -	ALC880_FIXUP_6ST_BASE,
> -	ALC880_FIXUP_6ST,
> -	ALC880_FIXUP_6ST_DIG,
> -	ALC880_FIXUP_6ST_AUTOMUTE,
> -};
> -
> -/* enable the volume-knob widget support on NID 0x21 */
> -static void alc880_fixup_vol_knob(struct hda_codec *codec,
> -				  const struct hda_fixup *fix, int action)
> -{
> -	if (action == HDA_FIXUP_ACT_PROBE)
> -		snd_hda_jack_detect_enable_callback(codec, 0x21,
> -						    alc_update_knob_master);
> -}
> -
> -static const struct hda_fixup alc880_fixups[] = {
> -	[ALC880_FIXUP_GPIO1] = {
> -		.type = HDA_FIXUP_FUNC,
> -		.v.func = alc_fixup_gpio1,
> -	},
> -	[ALC880_FIXUP_GPIO2] = {
> -		.type = HDA_FIXUP_FUNC,
> -		.v.func = alc_fixup_gpio2,
> -	},
> -	[ALC880_FIXUP_MEDION_RIM] = {
> -		.type = HDA_FIXUP_VERBS,
> -		.v.verbs = (const struct hda_verb[]) {
> -			{ 0x20, AC_VERB_SET_COEF_INDEX, 0x07 },
> -			{ 0x20, AC_VERB_SET_PROC_COEF,  0x3060 },
> -			{ }
> -		},
> -		.chained = true,
> -		.chain_id = ALC880_FIXUP_GPIO2,
> -	},
> -	[ALC880_FIXUP_LG] = {
> -		.type = HDA_FIXUP_PINS,
> -		.v.pins = (const struct hda_pintbl[]) {
> -			/* disable bogus unused pins */
> -			{ 0x16, 0x411111f0 },
> -			{ 0x18, 0x411111f0 },
> -			{ 0x1a, 0x411111f0 },
> -			{ }
> -		}
> -	},
> -	[ALC880_FIXUP_LG_LW25] = {
> -		.type = HDA_FIXUP_PINS,
> -		.v.pins = (const struct hda_pintbl[]) {
> -			{ 0x1a, 0x0181344f }, /* line-in */
> -			{ 0x1b, 0x0321403f }, /* headphone */
> -			{ }
> -		}
> -	},
> -	[ALC880_FIXUP_W810] = {
> -		.type = HDA_FIXUP_PINS,
> -		.v.pins = (const struct hda_pintbl[]) {
> -			/* disable bogus unused pins */
> -			{ 0x17, 0x411111f0 },
> -			{ }
> -		},
> -		.chained = true,
> -		.chain_id = ALC880_FIXUP_GPIO2,
> -	},
> -	[ALC880_FIXUP_EAPD_COEF] = {
> -		.type = HDA_FIXUP_VERBS,
> -		.v.verbs = (const struct hda_verb[]) {
> -			/* change to EAPD mode */
> -			{ 0x20, AC_VERB_SET_COEF_INDEX, 0x07 },
> -			{ 0x20, AC_VERB_SET_PROC_COEF,  0x3060 },
> -			{}
> -		},
> -	},
> -	[ALC880_FIXUP_TCL_S700] = {
> -		.type = HDA_FIXUP_VERBS,
> -		.v.verbs = (const struct hda_verb[]) {
> -			/* change to EAPD mode */
> -			{ 0x20, AC_VERB_SET_COEF_INDEX, 0x07 },
> -			{ 0x20, AC_VERB_SET_PROC_COEF,  0x3070 },
> -			{}
> -		},
> -		.chained = true,
> -		.chain_id = ALC880_FIXUP_GPIO2,
> -	},
> -	[ALC880_FIXUP_VOL_KNOB] = {
> -		.type = HDA_FIXUP_FUNC,
> -		.v.func = alc880_fixup_vol_knob,
> -	},
> -	[ALC880_FIXUP_FUJITSU] = {
> -		/* override all pins as BIOS on old Amilo is broken */
> -		.type = HDA_FIXUP_PINS,
> -		.v.pins = (const struct hda_pintbl[]) {
> -			{ 0x14, 0x0121401f }, /* HP */
> -			{ 0x15, 0x99030120 }, /* speaker */
> -			{ 0x16, 0x99030130 }, /* bass speaker */
> -			{ 0x17, 0x411111f0 }, /* N/A */
> -			{ 0x18, 0x411111f0 }, /* N/A */
> -			{ 0x19, 0x01a19950 }, /* mic-in */
> -			{ 0x1a, 0x411111f0 }, /* N/A */
> -			{ 0x1b, 0x411111f0 }, /* N/A */
> -			{ 0x1c, 0x411111f0 }, /* N/A */
> -			{ 0x1d, 0x411111f0 }, /* N/A */
> -			{ 0x1e, 0x01454140 }, /* SPDIF out */
> -			{ }
> -		},
> -		.chained = true,
> -		.chain_id = ALC880_FIXUP_VOL_KNOB,
> -	},
> -	[ALC880_FIXUP_F1734] = {
> -		/* almost compatible with FUJITSU, but no bass and SPDIF */
> -		.type = HDA_FIXUP_PINS,
> -		.v.pins = (const struct hda_pintbl[]) {
> -			{ 0x14, 0x0121401f }, /* HP */
> -			{ 0x15, 0x99030120 }, /* speaker */
> -			{ 0x16, 0x411111f0 }, /* N/A */
> -			{ 0x17, 0x411111f0 }, /* N/A */
> -			{ 0x18, 0x411111f0 }, /* N/A */
> -			{ 0x19, 0x01a19950 }, /* mic-in */
> -			{ 0x1a, 0x411111f0 }, /* N/A */
> -			{ 0x1b, 0x411111f0 }, /* N/A */
> -			{ 0x1c, 0x411111f0 }, /* N/A */
> -			{ 0x1d, 0x411111f0 }, /* N/A */
> -			{ 0x1e, 0x411111f0 }, /* N/A */
> -			{ }
> -		},
> -		.chained = true,
> -		.chain_id = ALC880_FIXUP_VOL_KNOB,
> -	},
> -	[ALC880_FIXUP_UNIWILL] = {
> -		/* need to fix HP and speaker pins to be parsed correctly */
> -		.type = HDA_FIXUP_PINS,
> -		.v.pins = (const struct hda_pintbl[]) {
> -			{ 0x14, 0x0121411f }, /* HP */
> -			{ 0x15, 0x99030120 }, /* speaker */
> -			{ 0x16, 0x99030130 }, /* bass speaker */
> -			{ }
> -		},
> -	},
> -	[ALC880_FIXUP_UNIWILL_DIG] = {
> -		.type = HDA_FIXUP_PINS,
> -		.v.pins = (const struct hda_pintbl[]) {
> -			/* disable bogus unused pins */
> -			{ 0x17, 0x411111f0 },
> -			{ 0x19, 0x411111f0 },
> -			{ 0x1b, 0x411111f0 },
> -			{ 0x1f, 0x411111f0 },
> -			{ }
> -		}
> -	},
> -	[ALC880_FIXUP_Z71V] = {
> -		.type = HDA_FIXUP_PINS,
> -		.v.pins = (const struct hda_pintbl[]) {
> -			/* set up the whole pins as BIOS is utterly broken */
> -			{ 0x14, 0x99030120 }, /* speaker */
> -			{ 0x15, 0x0121411f }, /* HP */
> -			{ 0x16, 0x411111f0 }, /* N/A */
> -			{ 0x17, 0x411111f0 }, /* N/A */
> -			{ 0x18, 0x01a19950 }, /* mic-in */
> -			{ 0x19, 0x411111f0 }, /* N/A */
> -			{ 0x1a, 0x01813031 }, /* line-in */
> -			{ 0x1b, 0x411111f0 }, /* N/A */
> -			{ 0x1c, 0x411111f0 }, /* N/A */
> -			{ 0x1d, 0x411111f0 }, /* N/A */
> -			{ 0x1e, 0x0144111e }, /* SPDIF */
> -			{ }
> -		}
> -	},
> -	[ALC880_FIXUP_ASUS_W5A] = {
> -		.type = HDA_FIXUP_PINS,
> -		.v.pins = (const struct hda_pintbl[]) {
> -			/* set up the whole pins as BIOS is utterly broken */
> -			{ 0x14, 0x0121411f }, /* HP */
> -			{ 0x15, 0x411111f0 }, /* N/A */
> -			{ 0x16, 0x411111f0 }, /* N/A */
> -			{ 0x17, 0x411111f0 }, /* N/A */
> -			{ 0x18, 0x90a60160 }, /* mic */
> -			{ 0x19, 0x411111f0 }, /* N/A */
> -			{ 0x1a, 0x411111f0 }, /* N/A */
> -			{ 0x1b, 0x411111f0 }, /* N/A */
> -			{ 0x1c, 0x411111f0 }, /* N/A */
> -			{ 0x1d, 0x411111f0 }, /* N/A */
> -			{ 0x1e, 0xb743111e }, /* SPDIF out */
> -			{ }
> -		},
> -		.chained = true,
> -		.chain_id = ALC880_FIXUP_GPIO1,
> -	},
> -	[ALC880_FIXUP_3ST_BASE] = {
> -		.type = HDA_FIXUP_PINS,
> -		.v.pins = (const struct hda_pintbl[]) {
> -			{ 0x14, 0x01014010 }, /* line-out */
> -			{ 0x15, 0x411111f0 }, /* N/A */
> -			{ 0x16, 0x411111f0 }, /* N/A */
> -			{ 0x17, 0x411111f0 }, /* N/A */
> -			{ 0x18, 0x01a19c30 }, /* mic-in */
> -			{ 0x19, 0x0121411f }, /* HP */
> -			{ 0x1a, 0x01813031 }, /* line-in */
> -			{ 0x1b, 0x02a19c40 }, /* front-mic */
> -			{ 0x1c, 0x411111f0 }, /* N/A */
> -			{ 0x1d, 0x411111f0 }, /* N/A */
> -			/* 0x1e is filled in below */
> -			{ 0x1f, 0x411111f0 }, /* N/A */
> -			{ }
> -		}
> -	},
> -	[ALC880_FIXUP_3ST] = {
> -		.type = HDA_FIXUP_PINS,
> -		.v.pins = (const struct hda_pintbl[]) {
> -			{ 0x1e, 0x411111f0 }, /* N/A */
> -			{ }
> -		},
> -		.chained = true,
> -		.chain_id = ALC880_FIXUP_3ST_BASE,
> -	},
> -	[ALC880_FIXUP_3ST_DIG] = {
> -		.type = HDA_FIXUP_PINS,
> -		.v.pins = (const struct hda_pintbl[]) {
> -			{ 0x1e, 0x0144111e }, /* SPDIF */
> -			{ }
> -		},
> -		.chained = true,
> -		.chain_id = ALC880_FIXUP_3ST_BASE,
> -	},
> -	[ALC880_FIXUP_5ST_BASE] = {
> -		.type = HDA_FIXUP_PINS,
> -		.v.pins = (const struct hda_pintbl[]) {
> -			{ 0x14, 0x01014010 }, /* front */
> -			{ 0x15, 0x411111f0 }, /* N/A */
> -			{ 0x16, 0x01011411 }, /* CLFE */
> -			{ 0x17, 0x01016412 }, /* surr */
> -			{ 0x18, 0x01a19c30 }, /* mic-in */
> -			{ 0x19, 0x0121411f }, /* HP */
> -			{ 0x1a, 0x01813031 }, /* line-in */
> -			{ 0x1b, 0x02a19c40 }, /* front-mic */
> -			{ 0x1c, 0x411111f0 }, /* N/A */
> -			{ 0x1d, 0x411111f0 }, /* N/A */
> -			/* 0x1e is filled in below */
> -			{ 0x1f, 0x411111f0 }, /* N/A */
> -			{ }
> -		}
> -	},
> -	[ALC880_FIXUP_5ST] = {
> -		.type = HDA_FIXUP_PINS,
> -		.v.pins = (const struct hda_pintbl[]) {
> -			{ 0x1e, 0x411111f0 }, /* N/A */
> -			{ }
> -		},
> -		.chained = true,
> -		.chain_id = ALC880_FIXUP_5ST_BASE,
> -	},
> -	[ALC880_FIXUP_5ST_DIG] = {
> -		.type = HDA_FIXUP_PINS,
> -		.v.pins = (const struct hda_pintbl[]) {
> -			{ 0x1e, 0x0144111e }, /* SPDIF */
> -			{ }
> -		},
> -		.chained = true,
> -		.chain_id = ALC880_FIXUP_5ST_BASE,
> -	},
> -	[ALC880_FIXUP_6ST_BASE] = {
> -		.type = HDA_FIXUP_PINS,
> -		.v.pins = (const struct hda_pintbl[]) {
> -			{ 0x14, 0x01014010 }, /* front */
> -			{ 0x15, 0x01016412 }, /* surr */
> -			{ 0x16, 0x01011411 }, /* CLFE */
> -			{ 0x17, 0x01012414 }, /* side */
> -			{ 0x18, 0x01a19c30 }, /* mic-in */
> -			{ 0x19, 0x02a19c40 }, /* front-mic */
> -			{ 0x1a, 0x01813031 }, /* line-in */
> -			{ 0x1b, 0x0121411f }, /* HP */
> -			{ 0x1c, 0x411111f0 }, /* N/A */
> -			{ 0x1d, 0x411111f0 }, /* N/A */
> -			/* 0x1e is filled in below */
> -			{ 0x1f, 0x411111f0 }, /* N/A */
> -			{ }
> -		}
> -	},
> -	[ALC880_FIXUP_6ST] = {
> -		.type = HDA_FIXUP_PINS,
> -		.v.pins = (const struct hda_pintbl[]) {
> -			{ 0x1e, 0x411111f0 }, /* N/A */
> -			{ }
> -		},
> -		.chained = true,
> -		.chain_id = ALC880_FIXUP_6ST_BASE,
> -	},
> -	[ALC880_FIXUP_6ST_DIG] = {
> -		.type = HDA_FIXUP_PINS,
> -		.v.pins = (const struct hda_pintbl[]) {
> -			{ 0x1e, 0x0144111e }, /* SPDIF */
> -			{ }
> -		},
> -		.chained = true,
> -		.chain_id = ALC880_FIXUP_6ST_BASE,
> -	},
> -	[ALC880_FIXUP_6ST_AUTOMUTE] = {
> -		.type = HDA_FIXUP_PINS,
> -		.v.pins = (const struct hda_pintbl[]) {
> -			{ 0x1b, 0x0121401f }, /* HP with jack detect */
> -			{ }
> -		},
> -		.chained_before = true,
> -		.chain_id = ALC880_FIXUP_6ST_BASE,
> -	},
> -};
> -
> -static const struct hda_quirk alc880_fixup_tbl[] = {
> -	SND_PCI_QUIRK(0x1019, 0x0f69, "Coeus G610P", ALC880_FIXUP_W810),
> -	SND_PCI_QUIRK(0x1043, 0x10c3, "ASUS W5A", ALC880_FIXUP_ASUS_W5A),
> -	SND_PCI_QUIRK(0x1043, 0x1964, "ASUS Z71V", ALC880_FIXUP_Z71V),
> -	SND_PCI_QUIRK_VENDOR(0x1043, "ASUS", ALC880_FIXUP_GPIO1),
> -	SND_PCI_QUIRK(0x147b, 0x1045, "ABit AA8XE", ALC880_FIXUP_6ST_AUTOMUTE),
> -	SND_PCI_QUIRK(0x1558, 0x5401, "Clevo GPIO2", ALC880_FIXUP_GPIO2),
> -	SND_PCI_QUIRK_VENDOR(0x1558, "Clevo", ALC880_FIXUP_EAPD_COEF),
> -	SND_PCI_QUIRK(0x1584, 0x9050, "Uniwill", ALC880_FIXUP_UNIWILL_DIG),
> -	SND_PCI_QUIRK(0x1584, 0x9054, "Uniwill", ALC880_FIXUP_F1734),
> -	SND_PCI_QUIRK(0x1584, 0x9070, "Uniwill", ALC880_FIXUP_UNIWILL),
> -	SND_PCI_QUIRK(0x1584, 0x9077, "Uniwill P53", ALC880_FIXUP_VOL_KNOB),
> -	SND_PCI_QUIRK(0x161f, 0x203d, "W810", ALC880_FIXUP_W810),
> -	SND_PCI_QUIRK(0x161f, 0x205d, "Medion Rim 2150", ALC880_FIXUP_MEDION_RIM),
> -	SND_PCI_QUIRK(0x1631, 0xe011, "PB 13201056", ALC880_FIXUP_6ST_AUTOMUTE),
> -	SND_PCI_QUIRK(0x1734, 0x107c, "FSC Amilo M1437", ALC880_FIXUP_FUJITSU),
> -	SND_PCI_QUIRK(0x1734, 0x1094, "FSC Amilo M1451G", ALC880_FIXUP_FUJITSU),
> -	SND_PCI_QUIRK(0x1734, 0x10ac, "FSC AMILO Xi 1526", ALC880_FIXUP_F1734),
> -	SND_PCI_QUIRK(0x1734, 0x10b0, "FSC Amilo Pi1556", ALC880_FIXUP_FUJITSU),
> -	SND_PCI_QUIRK(0x1854, 0x003b, "LG", ALC880_FIXUP_LG),
> -	SND_PCI_QUIRK(0x1854, 0x005f, "LG P1 Express", ALC880_FIXUP_LG),
> -	SND_PCI_QUIRK(0x1854, 0x0068, "LG w1", ALC880_FIXUP_LG),
> -	SND_PCI_QUIRK(0x1854, 0x0077, "LG LW25", ALC880_FIXUP_LG_LW25),
> -	SND_PCI_QUIRK(0x19db, 0x4188, "TCL S700", ALC880_FIXUP_TCL_S700),
> -
> -	/* Below is the copied entries from alc880_quirks.c.
> -	 * It's not quite sure whether BIOS sets the correct pin-config table
> -	 * on these machines, thus they are kept to be compatible with
> -	 * the old static quirks.  Once when it's confirmed to work without
> -	 * these overrides, it'd be better to remove.
> -	 */
> -	SND_PCI_QUIRK(0x1019, 0xa880, "ECS", ALC880_FIXUP_5ST_DIG),
> -	SND_PCI_QUIRK(0x1019, 0xa884, "Acer APFV", ALC880_FIXUP_6ST),
> -	SND_PCI_QUIRK(0x1025, 0x0070, "ULI", ALC880_FIXUP_3ST_DIG),
> -	SND_PCI_QUIRK(0x1025, 0x0077, "ULI", ALC880_FIXUP_6ST_DIG),
> -	SND_PCI_QUIRK(0x1025, 0x0078, "ULI", ALC880_FIXUP_6ST_DIG),
> -	SND_PCI_QUIRK(0x1025, 0x0087, "ULI", ALC880_FIXUP_6ST_DIG),
> -	SND_PCI_QUIRK(0x1025, 0xe309, "ULI", ALC880_FIXUP_3ST_DIG),
> -	SND_PCI_QUIRK(0x1025, 0xe310, "ULI", ALC880_FIXUP_3ST),
> -	SND_PCI_QUIRK(0x1039, 0x1234, NULL, ALC880_FIXUP_6ST_DIG),
> -	SND_PCI_QUIRK(0x104d, 0x81a0, "Sony", ALC880_FIXUP_3ST),
> -	SND_PCI_QUIRK(0x104d, 0x81d6, "Sony", ALC880_FIXUP_3ST),
> -	SND_PCI_QUIRK(0x107b, 0x3032, "Gateway", ALC880_FIXUP_5ST),
> -	SND_PCI_QUIRK(0x107b, 0x3033, "Gateway", ALC880_FIXUP_5ST),
> -	SND_PCI_QUIRK(0x107b, 0x4039, "Gateway", ALC880_FIXUP_5ST),
> -	SND_PCI_QUIRK(0x1297, 0xc790, "Shuttle ST20G5", ALC880_FIXUP_6ST_DIG),
> -	SND_PCI_QUIRK(0x1458, 0xa102, "Gigabyte K8", ALC880_FIXUP_6ST_DIG),
> -	SND_PCI_QUIRK(0x1462, 0x1150, "MSI", ALC880_FIXUP_6ST_DIG),
> -	SND_PCI_QUIRK(0x1509, 0x925d, "FIC P4M", ALC880_FIXUP_6ST_DIG),
> -	SND_PCI_QUIRK(0x1565, 0x8202, "Biostar", ALC880_FIXUP_5ST_DIG),
> -	SND_PCI_QUIRK(0x1695, 0x400d, "EPoX", ALC880_FIXUP_5ST_DIG),
> -	SND_PCI_QUIRK(0x1695, 0x4012, "EPox EP-5LDA", ALC880_FIXUP_5ST_DIG),
> -	SND_PCI_QUIRK(0x2668, 0x8086, NULL, ALC880_FIXUP_6ST_DIG), /* broken BIOS */
> -	SND_PCI_QUIRK(0x8086, 0x2668, NULL, ALC880_FIXUP_6ST_DIG),
> -	SND_PCI_QUIRK(0x8086, 0xa100, "Intel mobo", ALC880_FIXUP_5ST_DIG),
> -	SND_PCI_QUIRK(0x8086, 0xd400, "Intel mobo", ALC880_FIXUP_5ST_DIG),
> -	SND_PCI_QUIRK(0x8086, 0xd401, "Intel mobo", ALC880_FIXUP_5ST_DIG),
> -	SND_PCI_QUIRK(0x8086, 0xd402, "Intel mobo", ALC880_FIXUP_3ST_DIG),
> -	SND_PCI_QUIRK(0x8086, 0xe224, "Intel mobo", ALC880_FIXUP_5ST_DIG),
> -	SND_PCI_QUIRK(0x8086, 0xe305, "Intel mobo", ALC880_FIXUP_3ST_DIG),
> -	SND_PCI_QUIRK(0x8086, 0xe308, "Intel mobo", ALC880_FIXUP_3ST_DIG),
> -	SND_PCI_QUIRK(0x8086, 0xe400, "Intel mobo", ALC880_FIXUP_5ST_DIG),
> -	SND_PCI_QUIRK(0x8086, 0xe401, "Intel mobo", ALC880_FIXUP_5ST_DIG),
> -	SND_PCI_QUIRK(0x8086, 0xe402, "Intel mobo", ALC880_FIXUP_5ST_DIG),
> -	/* default Intel */
> -	SND_PCI_QUIRK_VENDOR(0x8086, "Intel mobo", ALC880_FIXUP_3ST),
> -	SND_PCI_QUIRK(0xa0a0, 0x0560, "AOpen i915GMm-HFS", ALC880_FIXUP_5ST_DIG),
> -	SND_PCI_QUIRK(0xe803, 0x1019, NULL, ALC880_FIXUP_6ST_DIG),
> -	{}
> -};
> -
> -static const struct hda_model_fixup alc880_fixup_models[] = {
> -	{.id = ALC880_FIXUP_3ST, .name = "3stack"},
> -	{.id = ALC880_FIXUP_3ST_DIG, .name = "3stack-digout"},
> -	{.id = ALC880_FIXUP_5ST, .name = "5stack"},
> -	{.id = ALC880_FIXUP_5ST_DIG, .name = "5stack-digout"},
> -	{.id = ALC880_FIXUP_6ST, .name = "6stack"},
> -	{.id = ALC880_FIXUP_6ST_DIG, .name = "6stack-digout"},
> -	{.id = ALC880_FIXUP_6ST_AUTOMUTE, .name = "6stack-automute"},
> -	{}
> -};
> -
> -
> -/*
> - * OK, here we have finally the patch for ALC880
> - */
> -static int patch_alc880(struct hda_codec *codec)
> -{
> -	struct alc_spec *spec;
> -	int err;
> -
> -	err = alc_alloc_spec(codec, 0x0b);
> -	if (err < 0)
> -		return err;
> -
> -	spec = codec->spec;
> -	spec->gen.need_dac_fix = 1;
> -	spec->gen.beep_nid = 0x01;
> -
> -	codec->patch_ops.unsol_event = alc880_unsol_event;
> -
> -	alc_pre_init(codec);
> -
> -	snd_hda_pick_fixup(codec, alc880_fixup_models, alc880_fixup_tbl,
> -		       alc880_fixups);
> -	snd_hda_apply_fixup(codec, HDA_FIXUP_ACT_PRE_PROBE);
> -
> -	/* automatic parse from the BIOS config */
> -	err = alc880_parse_auto_config(codec);
> -	if (err < 0)
> -		goto error;
> -
> -	if (!spec->gen.no_analog) {
> -		err = set_beep_amp(spec, 0x0b, 0x05, HDA_INPUT);
> -		if (err < 0)
> -			goto error;
> -	}
> -
> -	snd_hda_apply_fixup(codec, HDA_FIXUP_ACT_PROBE);
> -
> -	return 0;
> -
> - error:
> -	alc_free(codec);
> -	return err;
> -}
> -
> -
> -/*
> - * ALC260 support
> - */
> -static int alc260_parse_auto_config(struct hda_codec *codec)
> -{
> -	static const hda_nid_t alc260_ignore[] = { 0x17, 0 };
> -	static const hda_nid_t alc260_ssids[] = { 0x10, 0x15, 0x0f, 0 };
> -	return alc_parse_auto_config(codec, alc260_ignore, alc260_ssids);
> -}
> -
> -/*
> - * Pin config fixes
> - */
> -enum {
> -	ALC260_FIXUP_HP_DC5750,
> -	ALC260_FIXUP_HP_PIN_0F,
> -	ALC260_FIXUP_COEF,
> -	ALC260_FIXUP_GPIO1,
> -	ALC260_FIXUP_GPIO1_TOGGLE,
> -	ALC260_FIXUP_REPLACER,
> -	ALC260_FIXUP_HP_B1900,
> -	ALC260_FIXUP_KN1,
> -	ALC260_FIXUP_FSC_S7020,
> -	ALC260_FIXUP_FSC_S7020_JWSE,
> -	ALC260_FIXUP_VAIO_PINS,
> -};
> -
> -static void alc260_gpio1_automute(struct hda_codec *codec)
> -{
> -	struct alc_spec *spec = codec->spec;
> -
> -	alc_update_gpio_data(codec, 0x01, spec->gen.hp_jack_present);
> -}
> -
> -static void alc260_fixup_gpio1_toggle(struct hda_codec *codec,
> -				      const struct hda_fixup *fix, int action)
> -{
> -	struct alc_spec *spec = codec->spec;
> -	if (action == HDA_FIXUP_ACT_PROBE) {
> -		/* although the machine has only one output pin, we need to
> -		 * toggle GPIO1 according to the jack state
> -		 */
> -		spec->gen.automute_hook = alc260_gpio1_automute;
> -		spec->gen.detect_hp = 1;
> -		spec->gen.automute_speaker = 1;
> -		spec->gen.autocfg.hp_pins[0] = 0x0f; /* copy it for automute */
> -		snd_hda_jack_detect_enable_callback(codec, 0x0f,
> -						    snd_hda_gen_hp_automute);
> -		alc_setup_gpio(codec, 0x01);
> -	}
> -}
> -
> -static void alc260_fixup_kn1(struct hda_codec *codec,
> -			     const struct hda_fixup *fix, int action)
> -{
> -	struct alc_spec *spec = codec->spec;
> -	static const struct hda_pintbl pincfgs[] = {
> -		{ 0x0f, 0x02214000 }, /* HP/speaker */
> -		{ 0x12, 0x90a60160 }, /* int mic */
> -		{ 0x13, 0x02a19000 }, /* ext mic */
> -		{ 0x18, 0x01446000 }, /* SPDIF out */
> -		/* disable bogus I/O pins */
> -		{ 0x10, 0x411111f0 },
> -		{ 0x11, 0x411111f0 },
> -		{ 0x14, 0x411111f0 },
> -		{ 0x15, 0x411111f0 },
> -		{ 0x16, 0x411111f0 },
> -		{ 0x17, 0x411111f0 },
> -		{ 0x19, 0x411111f0 },
> -		{ }
> -	};
> -
> -	switch (action) {
> -	case HDA_FIXUP_ACT_PRE_PROBE:
> -		snd_hda_apply_pincfgs(codec, pincfgs);
> -		spec->init_amp = ALC_INIT_NONE;
> -		break;
> -	}
> -}
> -
> -static void alc260_fixup_fsc_s7020(struct hda_codec *codec,
> -				   const struct hda_fixup *fix, int action)
> -{
> -	struct alc_spec *spec = codec->spec;
> -	if (action == HDA_FIXUP_ACT_PRE_PROBE)
> -		spec->init_amp = ALC_INIT_NONE;
> -}
> -
> -static void alc260_fixup_fsc_s7020_jwse(struct hda_codec *codec,
> -				   const struct hda_fixup *fix, int action)
> -{
> -	struct alc_spec *spec = codec->spec;
> -	if (action == HDA_FIXUP_ACT_PRE_PROBE) {
> -		spec->gen.add_jack_modes = 1;
> -		spec->gen.hp_mic = 1;
> -	}
> -}
> -
> -static const struct hda_fixup alc260_fixups[] = {
> -	[ALC260_FIXUP_HP_DC5750] = {
> -		.type = HDA_FIXUP_PINS,
> -		.v.pins = (const struct hda_pintbl[]) {
> -			{ 0x11, 0x90130110 }, /* speaker */
> -			{ }
> -		}
> -	},
> -	[ALC260_FIXUP_HP_PIN_0F] = {
> -		.type = HDA_FIXUP_PINS,
> -		.v.pins = (const struct hda_pintbl[]) {
> -			{ 0x0f, 0x01214000 }, /* HP */
> -			{ }
> -		}
> -	},
> -	[ALC260_FIXUP_COEF] = {
> -		.type = HDA_FIXUP_VERBS,
> -		.v.verbs = (const struct hda_verb[]) {
> -			{ 0x1a, AC_VERB_SET_COEF_INDEX, 0x07 },
> -			{ 0x1a, AC_VERB_SET_PROC_COEF,  0x3040 },
> -			{ }
> -		},
> -	},
> -	[ALC260_FIXUP_GPIO1] = {
> -		.type = HDA_FIXUP_FUNC,
> -		.v.func = alc_fixup_gpio1,
> -	},
> -	[ALC260_FIXUP_GPIO1_TOGGLE] = {
> -		.type = HDA_FIXUP_FUNC,
> -		.v.func = alc260_fixup_gpio1_toggle,
> -		.chained = true,
> -		.chain_id = ALC260_FIXUP_HP_PIN_0F,
> -	},
> -	[ALC260_FIXUP_REPLACER] = {
> -		.type = HDA_FIXUP_VERBS,
> -		.v.verbs = (const struct hda_verb[]) {
> -			{ 0x1a, AC_VERB_SET_COEF_INDEX, 0x07 },
> -			{ 0x1a, AC_VERB_SET_PROC_COEF,  0x3050 },
> -			{ }
> -		},
> -		.chained = true,
> -		.chain_id = ALC260_FIXUP_GPIO1_TOGGLE,
> -	},
> -	[ALC260_FIXUP_HP_B1900] = {
> -		.type = HDA_FIXUP_FUNC,
> -		.v.func = alc260_fixup_gpio1_toggle,
> -		.chained = true,
> -		.chain_id = ALC260_FIXUP_COEF,
> -	},
> -	[ALC260_FIXUP_KN1] = {
> -		.type = HDA_FIXUP_FUNC,
> -		.v.func = alc260_fixup_kn1,
> -	},
> -	[ALC260_FIXUP_FSC_S7020] = {
> -		.type = HDA_FIXUP_FUNC,
> -		.v.func = alc260_fixup_fsc_s7020,
> -	},
> -	[ALC260_FIXUP_FSC_S7020_JWSE] = {
> -		.type = HDA_FIXUP_FUNC,
> -		.v.func = alc260_fixup_fsc_s7020_jwse,
> -		.chained = true,
> -		.chain_id = ALC260_FIXUP_FSC_S7020,
> -	},
> -	[ALC260_FIXUP_VAIO_PINS] = {
> -		.type = HDA_FIXUP_PINS,
> -		.v.pins = (const struct hda_pintbl[]) {
> -			/* Pin configs are missing completely on some VAIOs */
> -			{ 0x0f, 0x01211020 },
> -			{ 0x10, 0x0001003f },
> -			{ 0x11, 0x411111f0 },
> -			{ 0x12, 0x01a15930 },
> -			{ 0x13, 0x411111f0 },
> -			{ 0x14, 0x411111f0 },
> -			{ 0x15, 0x411111f0 },
> -			{ 0x16, 0x411111f0 },
> -			{ 0x17, 0x411111f0 },
> -			{ 0x18, 0x411111f0 },
> -			{ 0x19, 0x411111f0 },
> -			{ }
> -		}
> -	},
> -};
> -
> -static const struct hda_quirk alc260_fixup_tbl[] = {
> -	SND_PCI_QUIRK(0x1025, 0x007b, "Acer C20x", ALC260_FIXUP_GPIO1),
> -	SND_PCI_QUIRK(0x1025, 0x007f, "Acer Aspire 9500", ALC260_FIXUP_COEF),
> -	SND_PCI_QUIRK(0x1025, 0x008f, "Acer", ALC260_FIXUP_GPIO1),
> -	SND_PCI_QUIRK(0x103c, 0x280a, "HP dc5750", ALC260_FIXUP_HP_DC5750),
> -	SND_PCI_QUIRK(0x103c, 0x30ba, "HP Presario B1900", ALC260_FIXUP_HP_B1900),
> -	SND_PCI_QUIRK(0x104d, 0x81bb, "Sony VAIO", ALC260_FIXUP_VAIO_PINS),
> -	SND_PCI_QUIRK(0x104d, 0x81e2, "Sony VAIO TX", ALC260_FIXUP_HP_PIN_0F),
> -	SND_PCI_QUIRK(0x10cf, 0x1326, "FSC LifeBook S7020", ALC260_FIXUP_FSC_S7020),
> -	SND_PCI_QUIRK(0x1509, 0x4540, "Favorit 100XS", ALC260_FIXUP_GPIO1),
> -	SND_PCI_QUIRK(0x152d, 0x0729, "Quanta KN1", ALC260_FIXUP_KN1),
> -	SND_PCI_QUIRK(0x161f, 0x2057, "Replacer 672V", ALC260_FIXUP_REPLACER),
> -	SND_PCI_QUIRK(0x1631, 0xc017, "PB V7900", ALC260_FIXUP_COEF),
> -	{}
> -};
> -
> -static const struct hda_model_fixup alc260_fixup_models[] = {
> -	{.id = ALC260_FIXUP_GPIO1, .name = "gpio1"},
> -	{.id = ALC260_FIXUP_COEF, .name = "coef"},
> -	{.id = ALC260_FIXUP_FSC_S7020, .name = "fujitsu"},
> -	{.id = ALC260_FIXUP_FSC_S7020_JWSE, .name = "fujitsu-jwse"},
> -	{}
> -};
> -
> -/*
> - */
> -static int patch_alc260(struct hda_codec *codec)
> -{
> -	struct alc_spec *spec;
> -	int err;
> -
> -	err = alc_alloc_spec(codec, 0x07);
> -	if (err < 0)
> -		return err;
> -
> -	spec = codec->spec;
> -	/* as quite a few machines require HP amp for speaker outputs,
> -	 * it's easier to enable it unconditionally; even if it's unneeded,
> -	 * it's almost harmless.
> -	 */
> -	spec->gen.prefer_hp_amp = 1;
> -	spec->gen.beep_nid = 0x01;
> -
> -	spec->shutup = alc_eapd_shutup;
> -
> -	alc_pre_init(codec);
> -
> -	snd_hda_pick_fixup(codec, alc260_fixup_models, alc260_fixup_tbl,
> -			   alc260_fixups);
> -	snd_hda_apply_fixup(codec, HDA_FIXUP_ACT_PRE_PROBE);
> -
> -	/* automatic parse from the BIOS config */
> -	err = alc260_parse_auto_config(codec);
> -	if (err < 0)
> -		goto error;
> -
> -	if (!spec->gen.no_analog) {
> -		err = set_beep_amp(spec, 0x07, 0x05, HDA_INPUT);
> -		if (err < 0)
> -			goto error;
> -	}
> -
> -	snd_hda_apply_fixup(codec, HDA_FIXUP_ACT_PROBE);
> -
> -	return 0;
> -
> - error:
> -	alc_free(codec);
> -	return err;
> -}
> -
> -
> -/*
> - * ALC882/883/885/888/889 support
> - *
> - * ALC882 is almost identical with ALC880 but has cleaner and more flexible
> - * configuration.  Each pin widget can choose any input DACs and a mixer.
> - * Each ADC is connected from a mixer of all inputs.  This makes possible
> - * 6-channel independent captures.
> - *
> - * In addition, an independent DAC for the multi-playback (not used in this
> - * driver yet).
> - */
> -
> -/*
> - * Pin config fixes
> - */
> -enum {
> -	ALC882_FIXUP_ABIT_AW9D_MAX,
> -	ALC882_FIXUP_LENOVO_Y530,
> -	ALC882_FIXUP_PB_M5210,
> -	ALC882_FIXUP_ACER_ASPIRE_7736,
> -	ALC882_FIXUP_ASUS_W90V,
> -	ALC889_FIXUP_CD,
> -	ALC889_FIXUP_FRONT_HP_NO_PRESENCE,
> -	ALC889_FIXUP_VAIO_TT,
> -	ALC888_FIXUP_EEE1601,
> -	ALC886_FIXUP_EAPD,
> -	ALC882_FIXUP_EAPD,
> -	ALC883_FIXUP_EAPD,
> -	ALC883_FIXUP_ACER_EAPD,
> -	ALC882_FIXUP_GPIO1,
> -	ALC882_FIXUP_GPIO2,
> -	ALC882_FIXUP_GPIO3,
> -	ALC889_FIXUP_COEF,
> -	ALC882_FIXUP_ASUS_W2JC,
> -	ALC882_FIXUP_ACER_ASPIRE_4930G,
> -	ALC882_FIXUP_ACER_ASPIRE_8930G,
> -	ALC882_FIXUP_ASPIRE_8930G_VERBS,
> -	ALC885_FIXUP_MACPRO_GPIO,
> -	ALC889_FIXUP_DAC_ROUTE,
> -	ALC889_FIXUP_MBP_VREF,
> -	ALC889_FIXUP_IMAC91_VREF,
> -	ALC889_FIXUP_MBA11_VREF,
> -	ALC889_FIXUP_MBA21_VREF,
> -	ALC889_FIXUP_MP11_VREF,
> -	ALC889_FIXUP_MP41_VREF,
> -	ALC882_FIXUP_INV_DMIC,
> -	ALC882_FIXUP_NO_PRIMARY_HP,
> -	ALC887_FIXUP_ASUS_BASS,
> -	ALC887_FIXUP_BASS_CHMAP,
> -	ALC1220_FIXUP_GB_DUAL_CODECS,
> -	ALC1220_FIXUP_GB_X570,
> -	ALC1220_FIXUP_CLEVO_P950,
> -	ALC1220_FIXUP_CLEVO_PB51ED,
> -	ALC1220_FIXUP_CLEVO_PB51ED_PINS,
> -	ALC887_FIXUP_ASUS_AUDIO,
> -	ALC887_FIXUP_ASUS_HMIC,
> -	ALCS1200A_FIXUP_MIC_VREF,
> -	ALC888VD_FIXUP_MIC_100VREF,
> -};
> -
> -static void alc889_fixup_coef(struct hda_codec *codec,
> -			      const struct hda_fixup *fix, int action)
> -{
> -	if (action != HDA_FIXUP_ACT_INIT)
> -		return;
> -	alc_update_coef_idx(codec, 7, 0, 0x2030);
> -}
> -
> -/* set up GPIO at initialization */
> -static void alc885_fixup_macpro_gpio(struct hda_codec *codec,
> -				     const struct hda_fixup *fix, int action)
> -{
> -	struct alc_spec *spec = codec->spec;
> -
> -	spec->gpio_write_delay = true;
> -	alc_fixup_gpio3(codec, fix, action);
> -}
> -
> -/* Fix the connection of some pins for ALC889:
> - * At least, Acer Aspire 5935 shows the connections to DAC3/4 don't
> - * work correctly (bko#42740)
> - */
> -static void alc889_fixup_dac_route(struct hda_codec *codec,
> -				   const struct hda_fixup *fix, int action)
> -{
> -	if (action == HDA_FIXUP_ACT_PRE_PROBE) {
> -		/* fake the connections during parsing the tree */
> -		static const hda_nid_t conn1[] = { 0x0c, 0x0d };
> -		static const hda_nid_t conn2[] = { 0x0e, 0x0f };
> -		snd_hda_override_conn_list(codec, 0x14, ARRAY_SIZE(conn1), conn1);
> -		snd_hda_override_conn_list(codec, 0x15, ARRAY_SIZE(conn1), conn1);
> -		snd_hda_override_conn_list(codec, 0x18, ARRAY_SIZE(conn2), conn2);
> -		snd_hda_override_conn_list(codec, 0x1a, ARRAY_SIZE(conn2), conn2);
> -	} else if (action == HDA_FIXUP_ACT_PROBE) {
> -		/* restore the connections */
> -		static const hda_nid_t conn[] = { 0x0c, 0x0d, 0x0e, 0x0f, 0x26 };
> -		snd_hda_override_conn_list(codec, 0x14, ARRAY_SIZE(conn), conn);
> -		snd_hda_override_conn_list(codec, 0x15, ARRAY_SIZE(conn), conn);
> -		snd_hda_override_conn_list(codec, 0x18, ARRAY_SIZE(conn), conn);
> -		snd_hda_override_conn_list(codec, 0x1a, ARRAY_SIZE(conn), conn);
> -	}
> -}
> -
> -/* Set VREF on HP pin */
> -static void alc889_fixup_mbp_vref(struct hda_codec *codec,
> -				  const struct hda_fixup *fix, int action)
> -{
> -	static const hda_nid_t nids[] = { 0x14, 0x15, 0x19 };
> -	struct alc_spec *spec = codec->spec;
> -	int i;
> -
> -	if (action != HDA_FIXUP_ACT_INIT)
> -		return;
> -	for (i = 0; i < ARRAY_SIZE(nids); i++) {
> -		unsigned int val = snd_hda_codec_get_pincfg(codec, nids[i]);
> -		if (get_defcfg_device(val) != AC_JACK_HP_OUT)
> -			continue;
> -		val = snd_hda_codec_get_pin_target(codec, nids[i]);
> -		val |= AC_PINCTL_VREF_80;
> -		snd_hda_set_pin_ctl(codec, nids[i], val);
> -		spec->gen.keep_vref_in_automute = 1;
> -		break;
> -	}
> -}
> -
> -static void alc889_fixup_mac_pins(struct hda_codec *codec,
> -				  const hda_nid_t *nids, int num_nids)
> -{
> -	struct alc_spec *spec = codec->spec;
> -	int i;
> -
> -	for (i = 0; i < num_nids; i++) {
> -		unsigned int val;
> -		val = snd_hda_codec_get_pin_target(codec, nids[i]);
> -		val |= AC_PINCTL_VREF_50;
> -		snd_hda_set_pin_ctl(codec, nids[i], val);
> -	}
> -	spec->gen.keep_vref_in_automute = 1;
> -}
> -
> -/* Set VREF on speaker pins on imac91 */
> -static void alc889_fixup_imac91_vref(struct hda_codec *codec,
> -				     const struct hda_fixup *fix, int action)
> -{
> -	static const hda_nid_t nids[] = { 0x18, 0x1a };
> -
> -	if (action == HDA_FIXUP_ACT_INIT)
> -		alc889_fixup_mac_pins(codec, nids, ARRAY_SIZE(nids));
> -}
> -
> -/* Set VREF on speaker pins on mba11 */
> -static void alc889_fixup_mba11_vref(struct hda_codec *codec,
> -				    const struct hda_fixup *fix, int action)
> -{
> -	static const hda_nid_t nids[] = { 0x18 };
> -
> -	if (action == HDA_FIXUP_ACT_INIT)
> -		alc889_fixup_mac_pins(codec, nids, ARRAY_SIZE(nids));
> -}
> -
> -/* Set VREF on speaker pins on mba21 */
> -static void alc889_fixup_mba21_vref(struct hda_codec *codec,
> -				    const struct hda_fixup *fix, int action)
> -{
> -	static const hda_nid_t nids[] = { 0x18, 0x19 };
> -
> -	if (action == HDA_FIXUP_ACT_INIT)
> -		alc889_fixup_mac_pins(codec, nids, ARRAY_SIZE(nids));
> -}
> -
> -/* Don't take HP output as primary
> - * Strangely, the speaker output doesn't work on Vaio Z and some Vaio
> - * all-in-one desktop PCs (for example VGC-LN51JGB) through DAC 0x05
> - */
> -static void alc882_fixup_no_primary_hp(struct hda_codec *codec,
> -				       const struct hda_fixup *fix, int action)
> -{
> -	struct alc_spec *spec = codec->spec;
> -	if (action == HDA_FIXUP_ACT_PRE_PROBE) {
> -		spec->gen.no_primary_hp = 1;
> -		spec->gen.no_multi_io = 1;
> -	}
> -}
> -
> -static void alc_fixup_bass_chmap(struct hda_codec *codec,
> -				 const struct hda_fixup *fix, int action);
> -
> -/* For dual-codec configuration, we need to disable some features to avoid
> - * conflicts of kctls and PCM streams
> - */
> -static void alc_fixup_dual_codecs(struct hda_codec *codec,
> -				  const struct hda_fixup *fix, int action)
> -{
> -	struct alc_spec *spec = codec->spec;
> -
> -	if (action != HDA_FIXUP_ACT_PRE_PROBE)
> -		return;
> -	/* disable vmaster */
> -	spec->gen.suppress_vmaster = 1;
> -	/* auto-mute and auto-mic switch don't work with multiple codecs */
> -	spec->gen.suppress_auto_mute = 1;
> -	spec->gen.suppress_auto_mic = 1;
> -	/* disable aamix as well */
> -	spec->gen.mixer_nid = 0;
> -	/* add location prefix to avoid conflicts */
> -	codec->force_pin_prefix = 1;
> -}
> -
> -static void rename_ctl(struct hda_codec *codec, const char *oldname,
> -		       const char *newname)
> -{
> -	struct snd_kcontrol *kctl;
> -
> -	kctl = snd_hda_find_mixer_ctl(codec, oldname);
> -	if (kctl)
> -		snd_ctl_rename(codec->card, kctl, newname);
> -}
> -
> -static void alc1220_fixup_gb_dual_codecs(struct hda_codec *codec,
> -					 const struct hda_fixup *fix,
> -					 int action)
> -{
> -	alc_fixup_dual_codecs(codec, fix, action);
> -	switch (action) {
> -	case HDA_FIXUP_ACT_PRE_PROBE:
> -		/* override card longname to provide a unique UCM profile */
> -		strcpy(codec->card->longname, "HDAudio-Gigabyte-ALC1220DualCodecs");
> -		break;
> -	case HDA_FIXUP_ACT_BUILD:
> -		/* rename Capture controls depending on the codec */
> -		rename_ctl(codec, "Capture Volume",
> -			   codec->addr == 0 ?
> -			   "Rear-Panel Capture Volume" :
> -			   "Front-Panel Capture Volume");
> -		rename_ctl(codec, "Capture Switch",
> -			   codec->addr == 0 ?
> -			   "Rear-Panel Capture Switch" :
> -			   "Front-Panel Capture Switch");
> -		break;
> -	}
> -}
> -
> -static void alc1220_fixup_gb_x570(struct hda_codec *codec,
> -				     const struct hda_fixup *fix,
> -				     int action)
> -{
> -	static const hda_nid_t conn1[] = { 0x0c };
> -	static const struct coef_fw gb_x570_coefs[] = {
> -		WRITE_COEF(0x07, 0x03c0),
> -		WRITE_COEF(0x1a, 0x01c1),
> -		WRITE_COEF(0x1b, 0x0202),
> -		WRITE_COEF(0x43, 0x3005),
> -		{}
> -	};
> -
> -	switch (action) {
> -	case HDA_FIXUP_ACT_PRE_PROBE:
> -		snd_hda_override_conn_list(codec, 0x14, ARRAY_SIZE(conn1), conn1);
> -		snd_hda_override_conn_list(codec, 0x1b, ARRAY_SIZE(conn1), conn1);
> -		break;
> -	case HDA_FIXUP_ACT_INIT:
> -		alc_process_coef_fw(codec, gb_x570_coefs);
> -		break;
> -	}
> -}
> -
> -static void alc1220_fixup_clevo_p950(struct hda_codec *codec,
> -				     const struct hda_fixup *fix,
> -				     int action)
> -{
> -	static const hda_nid_t conn1[] = { 0x0c };
> -
> -	if (action != HDA_FIXUP_ACT_PRE_PROBE)
> -		return;
> -
> -	alc_update_coef_idx(codec, 0x7, 0, 0x3c3);
> -	/* We therefore want to make sure 0x14 (front headphone) and
> -	 * 0x1b (speakers) use the stereo DAC 0x02
> -	 */
> -	snd_hda_override_conn_list(codec, 0x14, ARRAY_SIZE(conn1), conn1);
> -	snd_hda_override_conn_list(codec, 0x1b, ARRAY_SIZE(conn1), conn1);
> -}
> -
> -static void alc_fixup_headset_mode_no_hp_mic(struct hda_codec *codec,
> -				const struct hda_fixup *fix, int action);
> -
> -static void alc1220_fixup_clevo_pb51ed(struct hda_codec *codec,
> -				     const struct hda_fixup *fix,
> -				     int action)
> -{
> -	alc1220_fixup_clevo_p950(codec, fix, action);
> -	alc_fixup_headset_mode_no_hp_mic(codec, fix, action);
> -}
> -
> -static void alc887_asus_hp_automute_hook(struct hda_codec *codec,
> -					 struct hda_jack_callback *jack)
> -{
> -	struct alc_spec *spec = codec->spec;
> -	unsigned int vref;
> -
> -	snd_hda_gen_hp_automute(codec, jack);
> -
> -	if (spec->gen.hp_jack_present)
> -		vref = AC_PINCTL_VREF_80;
> -	else
> -		vref = AC_PINCTL_VREF_HIZ;
> -	snd_hda_set_pin_ctl(codec, 0x19, PIN_HP | vref);
> -}
> -
> -static void alc887_fixup_asus_jack(struct hda_codec *codec,
> -				     const struct hda_fixup *fix, int action)
> -{
> -	struct alc_spec *spec = codec->spec;
> -	if (action != HDA_FIXUP_ACT_PROBE)
> -		return;
> -	snd_hda_set_pin_ctl_cache(codec, 0x1b, PIN_HP);
> -	spec->gen.hp_automute_hook = alc887_asus_hp_automute_hook;
> -}
> -
> -static const struct hda_fixup alc882_fixups[] = {
> -	[ALC882_FIXUP_ABIT_AW9D_MAX] = {
> -		.type = HDA_FIXUP_PINS,
> -		.v.pins = (const struct hda_pintbl[]) {
> -			{ 0x15, 0x01080104 }, /* side */
> -			{ 0x16, 0x01011012 }, /* rear */
> -			{ 0x17, 0x01016011 }, /* clfe */
> -			{ }
> -		}
> -	},
> -	[ALC882_FIXUP_LENOVO_Y530] = {
> -		.type = HDA_FIXUP_PINS,
> -		.v.pins = (const struct hda_pintbl[]) {
> -			{ 0x15, 0x99130112 }, /* rear int speakers */
> -			{ 0x16, 0x99130111 }, /* subwoofer */
> -			{ }
> -		}
> -	},
> -	[ALC882_FIXUP_PB_M5210] = {
> -		.type = HDA_FIXUP_PINCTLS,
> -		.v.pins = (const struct hda_pintbl[]) {
> -			{ 0x19, PIN_VREF50 },
> -			{}
> -		}
> -	},
> -	[ALC882_FIXUP_ACER_ASPIRE_7736] = {
> -		.type = HDA_FIXUP_FUNC,
> -		.v.func = alc_fixup_sku_ignore,
> -	},
> -	[ALC882_FIXUP_ASUS_W90V] = {
> -		.type = HDA_FIXUP_PINS,
> -		.v.pins = (const struct hda_pintbl[]) {
> -			{ 0x16, 0x99130110 }, /* fix sequence for CLFE */
> -			{ }
> -		}
> -	},
> -	[ALC889_FIXUP_CD] = {
> -		.type = HDA_FIXUP_PINS,
> -		.v.pins = (const struct hda_pintbl[]) {
> -			{ 0x1c, 0x993301f0 }, /* CD */
> -			{ }
> -		}
> -	},
> -	[ALC889_FIXUP_FRONT_HP_NO_PRESENCE] = {
> -		.type = HDA_FIXUP_PINS,
> -		.v.pins = (const struct hda_pintbl[]) {
> -			{ 0x1b, 0x02214120 }, /* Front HP jack is flaky, disable jack detect */
> -			{ }
> -		},
> -		.chained = true,
> -		.chain_id = ALC889_FIXUP_CD,
> -	},
> -	[ALC889_FIXUP_VAIO_TT] = {
> -		.type = HDA_FIXUP_PINS,
> -		.v.pins = (const struct hda_pintbl[]) {
> -			{ 0x17, 0x90170111 }, /* hidden surround speaker */
> -			{ }
> -		}
> -	},
> -	[ALC888_FIXUP_EEE1601] = {
> -		.type = HDA_FIXUP_VERBS,
> -		.v.verbs = (const struct hda_verb[]) {
> -			{ 0x20, AC_VERB_SET_COEF_INDEX, 0x0b },
> -			{ 0x20, AC_VERB_SET_PROC_COEF,  0x0838 },
> -			{ }
> -		}
> -	},
> -	[ALC886_FIXUP_EAPD] = {
> -		.type = HDA_FIXUP_VERBS,
> -		.v.verbs = (const struct hda_verb[]) {
> -			/* change to EAPD mode */
> -			{ 0x20, AC_VERB_SET_COEF_INDEX, 0x07 },
> -			{ 0x20, AC_VERB_SET_PROC_COEF, 0x0068 },
> -			{ }
> -		}
> -	},
> -	[ALC882_FIXUP_EAPD] = {
> -		.type = HDA_FIXUP_VERBS,
> -		.v.verbs = (const struct hda_verb[]) {
> -			/* change to EAPD mode */
> -			{ 0x20, AC_VERB_SET_COEF_INDEX, 0x07 },
> -			{ 0x20, AC_VERB_SET_PROC_COEF, 0x3060 },
> -			{ }
> -		}
> -	},
> -	[ALC883_FIXUP_EAPD] = {
> -		.type = HDA_FIXUP_VERBS,
> -		.v.verbs = (const struct hda_verb[]) {
> -			/* change to EAPD mode */
> -			{ 0x20, AC_VERB_SET_COEF_INDEX, 0x07 },
> -			{ 0x20, AC_VERB_SET_PROC_COEF, 0x3070 },
> -			{ }
> -		}
> -	},
> -	[ALC883_FIXUP_ACER_EAPD] = {
> -		.type = HDA_FIXUP_VERBS,
> -		.v.verbs = (const struct hda_verb[]) {
> -			/* eanable EAPD on Acer laptops */
> -			{ 0x20, AC_VERB_SET_COEF_INDEX, 0x07 },
> -			{ 0x20, AC_VERB_SET_PROC_COEF, 0x3050 },
> -			{ }
> -		}
> -	},
> -	[ALC882_FIXUP_GPIO1] = {
> -		.type = HDA_FIXUP_FUNC,
> -		.v.func = alc_fixup_gpio1,
> -	},
> -	[ALC882_FIXUP_GPIO2] = {
> -		.type = HDA_FIXUP_FUNC,
> -		.v.func = alc_fixup_gpio2,
> -	},
> -	[ALC882_FIXUP_GPIO3] = {
> -		.type = HDA_FIXUP_FUNC,
> -		.v.func = alc_fixup_gpio3,
> -	},
> -	[ALC882_FIXUP_ASUS_W2JC] = {
> -		.type = HDA_FIXUP_FUNC,
> -		.v.func = alc_fixup_gpio1,
> -		.chained = true,
> -		.chain_id = ALC882_FIXUP_EAPD,
> -	},
> -	[ALC889_FIXUP_COEF] = {
> -		.type = HDA_FIXUP_FUNC,
> -		.v.func = alc889_fixup_coef,
> -	},
> -	[ALC882_FIXUP_ACER_ASPIRE_4930G] = {
> -		.type = HDA_FIXUP_PINS,
> -		.v.pins = (const struct hda_pintbl[]) {
> -			{ 0x16, 0x99130111 }, /* CLFE speaker */
> -			{ 0x17, 0x99130112 }, /* surround speaker */
> -			{ }
> -		},
> -		.chained = true,
> -		.chain_id = ALC882_FIXUP_GPIO1,
> -	},
> -	[ALC882_FIXUP_ACER_ASPIRE_8930G] = {
> -		.type = HDA_FIXUP_PINS,
> -		.v.pins = (const struct hda_pintbl[]) {
> -			{ 0x16, 0x99130111 }, /* CLFE speaker */
> -			{ 0x1b, 0x99130112 }, /* surround speaker */
> -			{ }
> -		},
> -		.chained = true,
> -		.chain_id = ALC882_FIXUP_ASPIRE_8930G_VERBS,
> -	},
> -	[ALC882_FIXUP_ASPIRE_8930G_VERBS] = {
> -		/* additional init verbs for Acer Aspire 8930G */
> -		.type = HDA_FIXUP_VERBS,
> -		.v.verbs = (const struct hda_verb[]) {
> -			/* Enable all DACs */
> -			/* DAC DISABLE/MUTE 1? */
> -			/*  setting bits 1-5 disables DAC nids 0x02-0x06
> -			 *  apparently. Init=0x38 */
> -			{ 0x20, AC_VERB_SET_COEF_INDEX, 0x03 },
> -			{ 0x20, AC_VERB_SET_PROC_COEF, 0x0000 },
> -			/* DAC DISABLE/MUTE 2? */
> -			/*  some bit here disables the other DACs.
> -			 *  Init=0x4900 */
> -			{ 0x20, AC_VERB_SET_COEF_INDEX, 0x08 },
> -			{ 0x20, AC_VERB_SET_PROC_COEF, 0x0000 },
> -			/* DMIC fix
> -			 * This laptop has a stereo digital microphone.
> -			 * The mics are only 1cm apart which makes the stereo
> -			 * useless. However, either the mic or the ALC889
> -			 * makes the signal become a difference/sum signal
> -			 * instead of standard stereo, which is annoying.
> -			 * So instead we flip this bit which makes the
> -			 * codec replicate the sum signal to both channels,
> -			 * turning it into a normal mono mic.
> -			 */
> -			/* DMIC_CONTROL? Init value = 0x0001 */
> -			{ 0x20, AC_VERB_SET_COEF_INDEX, 0x0b },
> -			{ 0x20, AC_VERB_SET_PROC_COEF, 0x0003 },
> -			{ 0x20, AC_VERB_SET_COEF_INDEX, 0x07 },
> -			{ 0x20, AC_VERB_SET_PROC_COEF, 0x3050 },
> -			{ }
> -		},
> -		.chained = true,
> -		.chain_id = ALC882_FIXUP_GPIO1,
> -	},
> -	[ALC885_FIXUP_MACPRO_GPIO] = {
> -		.type = HDA_FIXUP_FUNC,
> -		.v.func = alc885_fixup_macpro_gpio,
> -	},
> -	[ALC889_FIXUP_DAC_ROUTE] = {
> -		.type = HDA_FIXUP_FUNC,
> -		.v.func = alc889_fixup_dac_route,
> -	},
> -	[ALC889_FIXUP_MBP_VREF] = {
> -		.type = HDA_FIXUP_FUNC,
> -		.v.func = alc889_fixup_mbp_vref,
> -		.chained = true,
> -		.chain_id = ALC882_FIXUP_GPIO1,
> -	},
> -	[ALC889_FIXUP_IMAC91_VREF] = {
> -		.type = HDA_FIXUP_FUNC,
> -		.v.func = alc889_fixup_imac91_vref,
> -		.chained = true,
> -		.chain_id = ALC882_FIXUP_GPIO1,
> -	},
> -	[ALC889_FIXUP_MBA11_VREF] = {
> -		.type = HDA_FIXUP_FUNC,
> -		.v.func = alc889_fixup_mba11_vref,
> -		.chained = true,
> -		.chain_id = ALC889_FIXUP_MBP_VREF,
> -	},
> -	[ALC889_FIXUP_MBA21_VREF] = {
> -		.type = HDA_FIXUP_FUNC,
> -		.v.func = alc889_fixup_mba21_vref,
> -		.chained = true,
> -		.chain_id = ALC889_FIXUP_MBP_VREF,
> -	},
> -	[ALC889_FIXUP_MP11_VREF] = {
> -		.type = HDA_FIXUP_FUNC,
> -		.v.func = alc889_fixup_mba11_vref,
> -		.chained = true,
> -		.chain_id = ALC885_FIXUP_MACPRO_GPIO,
> -	},
> -	[ALC889_FIXUP_MP41_VREF] = {
> -		.type = HDA_FIXUP_FUNC,
> -		.v.func = alc889_fixup_mbp_vref,
> -		.chained = true,
> -		.chain_id = ALC885_FIXUP_MACPRO_GPIO,
> -	},
> -	[ALC882_FIXUP_INV_DMIC] = {
> -		.type = HDA_FIXUP_FUNC,
> -		.v.func = alc_fixup_inv_dmic,
> -	},
> -	[ALC882_FIXUP_NO_PRIMARY_HP] = {
> -		.type = HDA_FIXUP_FUNC,
> -		.v.func = alc882_fixup_no_primary_hp,
> -	},
> -	[ALC887_FIXUP_ASUS_BASS] = {
> -		.type = HDA_FIXUP_PINS,
> -		.v.pins = (const struct hda_pintbl[]) {
> -			{0x16, 0x99130130}, /* bass speaker */
> -			{}
> -		},
> -		.chained = true,
> -		.chain_id = ALC887_FIXUP_BASS_CHMAP,
> -	},
> -	[ALC887_FIXUP_BASS_CHMAP] = {
> -		.type = HDA_FIXUP_FUNC,
> -		.v.func = alc_fixup_bass_chmap,
> -	},
> -	[ALC1220_FIXUP_GB_DUAL_CODECS] = {
> -		.type = HDA_FIXUP_FUNC,
> -		.v.func = alc1220_fixup_gb_dual_codecs,
> -	},
> -	[ALC1220_FIXUP_GB_X570] = {
> -		.type = HDA_FIXUP_FUNC,
> -		.v.func = alc1220_fixup_gb_x570,
> -	},
> -	[ALC1220_FIXUP_CLEVO_P950] = {
> -		.type = HDA_FIXUP_FUNC,
> -		.v.func = alc1220_fixup_clevo_p950,
> -	},
> -	[ALC1220_FIXUP_CLEVO_PB51ED] = {
> -		.type = HDA_FIXUP_FUNC,
> -		.v.func = alc1220_fixup_clevo_pb51ed,
> -	},
> -	[ALC1220_FIXUP_CLEVO_PB51ED_PINS] = {
> -		.type = HDA_FIXUP_PINS,
> -		.v.pins = (const struct hda_pintbl[]) {
> -			{ 0x19, 0x01a1913c }, /* use as headset mic, without its own jack detect */
> -			{}
> -		},
> -		.chained = true,
> -		.chain_id = ALC1220_FIXUP_CLEVO_PB51ED,
> -	},
> -	[ALC887_FIXUP_ASUS_AUDIO] = {
> -		.type = HDA_FIXUP_PINS,
> -		.v.pins = (const struct hda_pintbl[]) {
> -			{ 0x15, 0x02a14150 }, /* use as headset mic, without its own jack detect */
> -			{ 0x19, 0x22219420 },
> -			{}
> -		},
> -	},
> -	[ALC887_FIXUP_ASUS_HMIC] = {
> -		.type = HDA_FIXUP_FUNC,
> -		.v.func = alc887_fixup_asus_jack,
> -		.chained = true,
> -		.chain_id = ALC887_FIXUP_ASUS_AUDIO,
> -	},
> -	[ALCS1200A_FIXUP_MIC_VREF] = {
> -		.type = HDA_FIXUP_PINCTLS,
> -		.v.pins = (const struct hda_pintbl[]) {
> -			{ 0x18, PIN_VREF50 }, /* rear mic */
> -			{ 0x19, PIN_VREF50 }, /* front mic */
> -			{}
> -		}
> -	},
> -	[ALC888VD_FIXUP_MIC_100VREF] = {
> -		.type = HDA_FIXUP_PINCTLS,
> -		.v.pins = (const struct hda_pintbl[]) {
> -			{ 0x18, PIN_VREF100 }, /* headset mic */
> -			{}
> -		}
> -	},
> -};
> -
> -static const struct hda_quirk alc882_fixup_tbl[] = {
> -	SND_PCI_QUIRK(0x1025, 0x006c, "Acer Aspire 9810", ALC883_FIXUP_ACER_EAPD),
> -	SND_PCI_QUIRK(0x1025, 0x0090, "Acer Aspire", ALC883_FIXUP_ACER_EAPD),
> -	SND_PCI_QUIRK(0x1025, 0x0107, "Acer Aspire", ALC883_FIXUP_ACER_EAPD),
> -	SND_PCI_QUIRK(0x1025, 0x010a, "Acer Ferrari 5000", ALC883_FIXUP_ACER_EAPD),
> -	SND_PCI_QUIRK(0x1025, 0x0110, "Acer Aspire", ALC883_FIXUP_ACER_EAPD),
> -	SND_PCI_QUIRK(0x1025, 0x0112, "Acer Aspire 9303", ALC883_FIXUP_ACER_EAPD),
> -	SND_PCI_QUIRK(0x1025, 0x0121, "Acer Aspire 5920G", ALC883_FIXUP_ACER_EAPD),
> -	SND_PCI_QUIRK(0x1025, 0x013e, "Acer Aspire 4930G",
> -		      ALC882_FIXUP_ACER_ASPIRE_4930G),
> -	SND_PCI_QUIRK(0x1025, 0x013f, "Acer Aspire 5930G",
> -		      ALC882_FIXUP_ACER_ASPIRE_4930G),
> -	SND_PCI_QUIRK(0x1025, 0x0145, "Acer Aspire 8930G",
> -		      ALC882_FIXUP_ACER_ASPIRE_8930G),
> -	SND_PCI_QUIRK(0x1025, 0x0146, "Acer Aspire 6935G",
> -		      ALC882_FIXUP_ACER_ASPIRE_8930G),
> -	SND_PCI_QUIRK(0x1025, 0x0142, "Acer Aspire 7730G",
> -		      ALC882_FIXUP_ACER_ASPIRE_4930G),
> -	SND_PCI_QUIRK(0x1025, 0x0155, "Packard-Bell M5120", ALC882_FIXUP_PB_M5210),
> -	SND_PCI_QUIRK(0x1025, 0x015e, "Acer Aspire 6930G",
> -		      ALC882_FIXUP_ACER_ASPIRE_4930G),
> -	SND_PCI_QUIRK(0x1025, 0x0166, "Acer Aspire 6530G",
> -		      ALC882_FIXUP_ACER_ASPIRE_4930G),
> -	SND_PCI_QUIRK(0x1025, 0x021e, "Acer Aspire 5739G",
> -		      ALC882_FIXUP_ACER_ASPIRE_4930G),
> -	SND_PCI_QUIRK(0x1025, 0x0259, "Acer Aspire 5935", ALC889_FIXUP_DAC_ROUTE),
> -	SND_PCI_QUIRK(0x1025, 0x026b, "Acer Aspire 8940G", ALC882_FIXUP_ACER_ASPIRE_8930G),
> -	SND_PCI_QUIRK(0x1025, 0x0296, "Acer Aspire 7736z", ALC882_FIXUP_ACER_ASPIRE_7736),
> -	SND_PCI_QUIRK(0x1043, 0x13c2, "Asus A7M", ALC882_FIXUP_EAPD),
> -	SND_PCI_QUIRK(0x1043, 0x1873, "ASUS W90V", ALC882_FIXUP_ASUS_W90V),
> -	SND_PCI_QUIRK(0x1043, 0x1971, "Asus W2JC", ALC882_FIXUP_ASUS_W2JC),
> -	SND_PCI_QUIRK(0x1043, 0x2390, "Asus D700SA", ALC887_FIXUP_ASUS_HMIC),
> -	SND_PCI_QUIRK(0x1043, 0x835f, "Asus Eee 1601", ALC888_FIXUP_EEE1601),
> -	SND_PCI_QUIRK(0x1043, 0x84bc, "ASUS ET2700", ALC887_FIXUP_ASUS_BASS),
> -	SND_PCI_QUIRK(0x1043, 0x8691, "ASUS ROG Ranger VIII", ALC882_FIXUP_GPIO3),
> -	SND_PCI_QUIRK(0x1043, 0x8797, "ASUS TUF B550M-PLUS", ALCS1200A_FIXUP_MIC_VREF),
> -	SND_PCI_QUIRK(0x104d, 0x9043, "Sony Vaio VGC-LN51JGB", ALC882_FIXUP_NO_PRIMARY_HP),
> -	SND_PCI_QUIRK(0x104d, 0x9044, "Sony VAIO AiO", ALC882_FIXUP_NO_PRIMARY_HP),
> -	SND_PCI_QUIRK(0x104d, 0x9047, "Sony Vaio TT", ALC889_FIXUP_VAIO_TT),
> -	SND_PCI_QUIRK(0x104d, 0x905a, "Sony Vaio Z", ALC882_FIXUP_NO_PRIMARY_HP),
> -	SND_PCI_QUIRK(0x104d, 0x9060, "Sony Vaio VPCL14M1R", ALC882_FIXUP_NO_PRIMARY_HP),
> -
> -	/* All Apple entries are in codec SSIDs */
> -	SND_PCI_QUIRK(0x106b, 0x00a0, "MacBookPro 3,1", ALC889_FIXUP_MBP_VREF),
> -	SND_PCI_QUIRK(0x106b, 0x00a1, "Macbook", ALC889_FIXUP_MBP_VREF),
> -	SND_PCI_QUIRK(0x106b, 0x00a4, "MacbookPro 4,1", ALC889_FIXUP_MBP_VREF),
> -	SND_PCI_QUIRK(0x106b, 0x0c00, "Mac Pro", ALC889_FIXUP_MP11_VREF),
> -	SND_PCI_QUIRK(0x106b, 0x1000, "iMac 24", ALC885_FIXUP_MACPRO_GPIO),
> -	SND_PCI_QUIRK(0x106b, 0x2800, "AppleTV", ALC885_FIXUP_MACPRO_GPIO),
> -	SND_PCI_QUIRK(0x106b, 0x2c00, "MacbookPro rev3", ALC889_FIXUP_MBP_VREF),
> -	SND_PCI_QUIRK(0x106b, 0x3000, "iMac", ALC889_FIXUP_MBP_VREF),
> -	SND_PCI_QUIRK(0x106b, 0x3200, "iMac 7,1 Aluminum", ALC882_FIXUP_EAPD),
> -	SND_PCI_QUIRK(0x106b, 0x3400, "MacBookAir 1,1", ALC889_FIXUP_MBA11_VREF),
> -	SND_PCI_QUIRK(0x106b, 0x3500, "MacBookAir 2,1", ALC889_FIXUP_MBA21_VREF),
> -	SND_PCI_QUIRK(0x106b, 0x3600, "Macbook 3,1", ALC889_FIXUP_MBP_VREF),
> -	SND_PCI_QUIRK(0x106b, 0x3800, "MacbookPro 4,1", ALC889_FIXUP_MBP_VREF),
> -	SND_PCI_QUIRK(0x106b, 0x3e00, "iMac 24 Aluminum", ALC885_FIXUP_MACPRO_GPIO),
> -	SND_PCI_QUIRK(0x106b, 0x3f00, "Macbook 5,1", ALC889_FIXUP_IMAC91_VREF),
> -	SND_PCI_QUIRK(0x106b, 0x4000, "MacbookPro 5,1", ALC889_FIXUP_IMAC91_VREF),
> -	SND_PCI_QUIRK(0x106b, 0x4100, "Macmini 3,1", ALC889_FIXUP_IMAC91_VREF),
> -	SND_PCI_QUIRK(0x106b, 0x4200, "Mac Pro 4,1/5,1", ALC889_FIXUP_MP41_VREF),
> -	SND_PCI_QUIRK(0x106b, 0x4300, "iMac 9,1", ALC889_FIXUP_IMAC91_VREF),
> -	SND_PCI_QUIRK(0x106b, 0x4600, "MacbookPro 5,2", ALC889_FIXUP_IMAC91_VREF),
> -	SND_PCI_QUIRK(0x106b, 0x4900, "iMac 9,1 Aluminum", ALC889_FIXUP_IMAC91_VREF),
> -	SND_PCI_QUIRK(0x106b, 0x4a00, "Macbook 5,2", ALC889_FIXUP_MBA11_VREF),
> -
> -	SND_PCI_QUIRK(0x1071, 0x8258, "Evesham Voyaeger", ALC882_FIXUP_EAPD),
> -	SND_PCI_QUIRK(0x10ec, 0x12d8, "iBase Elo Touch", ALC888VD_FIXUP_MIC_100VREF),
> -	SND_PCI_QUIRK(0x13fe, 0x1009, "Advantech MIT-W101", ALC886_FIXUP_EAPD),
> -	SND_PCI_QUIRK(0x1458, 0xa002, "Gigabyte EP45-DS3/Z87X-UD3H", ALC889_FIXUP_FRONT_HP_NO_PRESENCE),
> -	SND_PCI_QUIRK(0x1458, 0xa0b8, "Gigabyte AZ370-Gaming", ALC1220_FIXUP_GB_DUAL_CODECS),
> -	SND_PCI_QUIRK(0x1458, 0xa0cd, "Gigabyte X570 Aorus Master", ALC1220_FIXUP_GB_X570),
> -	SND_PCI_QUIRK(0x1458, 0xa0ce, "Gigabyte X570 Aorus Xtreme", ALC1220_FIXUP_GB_X570),
> -	SND_PCI_QUIRK(0x1458, 0xa0d5, "Gigabyte X570S Aorus Master", ALC1220_FIXUP_GB_X570),
> -	SND_PCI_QUIRK(0x1462, 0x11f7, "MSI-GE63", ALC1220_FIXUP_CLEVO_P950),
> -	SND_PCI_QUIRK(0x1462, 0x1228, "MSI-GP63", ALC1220_FIXUP_CLEVO_P950),
> -	SND_PCI_QUIRK(0x1462, 0x1229, "MSI-GP73", ALC1220_FIXUP_CLEVO_P950),
> -	SND_PCI_QUIRK(0x1462, 0x1275, "MSI-GL63", ALC1220_FIXUP_CLEVO_P950),
> -	SND_PCI_QUIRK(0x1462, 0x1276, "MSI-GL73", ALC1220_FIXUP_CLEVO_P950),
> -	SND_PCI_QUIRK(0x1462, 0x1293, "MSI-GP65", ALC1220_FIXUP_CLEVO_P950),
> -	SND_PCI_QUIRK(0x1462, 0x7350, "MSI-7350", ALC889_FIXUP_CD),
> -	SND_PCI_QUIRK(0x1462, 0xcc34, "MSI Godlike X570", ALC1220_FIXUP_GB_DUAL_CODECS),
> -	SND_PCI_QUIRK(0x1462, 0xda57, "MSI Z270-Gaming", ALC1220_FIXUP_GB_DUAL_CODECS),
> -	SND_PCI_QUIRK_VENDOR(0x1462, "MSI", ALC882_FIXUP_GPIO3),
> -	SND_PCI_QUIRK(0x147b, 0x107a, "Abit AW9D-MAX", ALC882_FIXUP_ABIT_AW9D_MAX),
> -	SND_PCI_QUIRK(0x1558, 0x3702, "Clevo X370SN[VW]", ALC1220_FIXUP_CLEVO_PB51ED_PINS),
> -	SND_PCI_QUIRK(0x1558, 0x50d3, "Clevo PC50[ER][CDF]", ALC1220_FIXUP_CLEVO_PB51ED_PINS),
> -	SND_PCI_QUIRK(0x1558, 0x5802, "Clevo X58[05]WN[RST]", ALC1220_FIXUP_CLEVO_PB51ED_PINS),
> -	SND_PCI_QUIRK(0x1558, 0x65d1, "Clevo PB51[ER][CDF]", ALC1220_FIXUP_CLEVO_PB51ED_PINS),
> -	SND_PCI_QUIRK(0x1558, 0x65d2, "Clevo PB51R[CDF]", ALC1220_FIXUP_CLEVO_PB51ED_PINS),
> -	SND_PCI_QUIRK(0x1558, 0x65e1, "Clevo PB51[ED][DF]", ALC1220_FIXUP_CLEVO_PB51ED_PINS),
> -	SND_PCI_QUIRK(0x1558, 0x65e5, "Clevo PC50D[PRS](?:-D|-G)?", ALC1220_FIXUP_CLEVO_PB51ED_PINS),
> -	SND_PCI_QUIRK(0x1558, 0x65f1, "Clevo PC50HS", ALC1220_FIXUP_CLEVO_PB51ED_PINS),
> -	SND_PCI_QUIRK(0x1558, 0x65f5, "Clevo PD50PN[NRT]", ALC1220_FIXUP_CLEVO_PB51ED_PINS),
> -	SND_PCI_QUIRK(0x1558, 0x66a2, "Clevo PE60RNE", ALC1220_FIXUP_CLEVO_PB51ED_PINS),
> -	SND_PCI_QUIRK(0x1558, 0x66a6, "Clevo PE60SN[CDE]-[GS]", ALC1220_FIXUP_CLEVO_PB51ED_PINS),
> -	SND_PCI_QUIRK(0x1558, 0x67d1, "Clevo PB71[ER][CDF]", ALC1220_FIXUP_CLEVO_PB51ED_PINS),
> -	SND_PCI_QUIRK(0x1558, 0x67e1, "Clevo PB71[DE][CDF]", ALC1220_FIXUP_CLEVO_PB51ED_PINS),
> -	SND_PCI_QUIRK(0x1558, 0x67e5, "Clevo PC70D[PRS](?:-D|-G)?", ALC1220_FIXUP_CLEVO_PB51ED_PINS),
> -	SND_PCI_QUIRK(0x1558, 0x67f1, "Clevo PC70H[PRS]", ALC1220_FIXUP_CLEVO_PB51ED_PINS),
> -	SND_PCI_QUIRK(0x1558, 0x67f5, "Clevo PD70PN[NRT]", ALC1220_FIXUP_CLEVO_PB51ED_PINS),
> -	SND_PCI_QUIRK(0x1558, 0x70d1, "Clevo PC70[ER][CDF]", ALC1220_FIXUP_CLEVO_PB51ED_PINS),
> -	SND_PCI_QUIRK(0x1558, 0x7714, "Clevo X170SM", ALC1220_FIXUP_CLEVO_PB51ED_PINS),
> -	SND_PCI_QUIRK(0x1558, 0x7715, "Clevo X170KM-G", ALC1220_FIXUP_CLEVO_PB51ED),
> -	SND_PCI_QUIRK(0x1558, 0x9501, "Clevo P950HR", ALC1220_FIXUP_CLEVO_P950),
> -	SND_PCI_QUIRK(0x1558, 0x9506, "Clevo P955HQ", ALC1220_FIXUP_CLEVO_P950),
> -	SND_PCI_QUIRK(0x1558, 0x950a, "Clevo P955H[PR]", ALC1220_FIXUP_CLEVO_P950),
> -	SND_PCI_QUIRK(0x1558, 0x95e1, "Clevo P95xER", ALC1220_FIXUP_CLEVO_P950),
> -	SND_PCI_QUIRK(0x1558, 0x95e2, "Clevo P950ER", ALC1220_FIXUP_CLEVO_P950),
> -	SND_PCI_QUIRK(0x1558, 0x95e3, "Clevo P955[ER]T", ALC1220_FIXUP_CLEVO_P950),
> -	SND_PCI_QUIRK(0x1558, 0x95e4, "Clevo P955ER", ALC1220_FIXUP_CLEVO_P950),
> -	SND_PCI_QUIRK(0x1558, 0x95e5, "Clevo P955EE6", ALC1220_FIXUP_CLEVO_P950),
> -	SND_PCI_QUIRK(0x1558, 0x95e6, "Clevo P950R[CDF]", ALC1220_FIXUP_CLEVO_P950),
> -	SND_PCI_QUIRK(0x1558, 0x96e1, "Clevo P960[ER][CDFN]-K", ALC1220_FIXUP_CLEVO_P950),
> -	SND_PCI_QUIRK(0x1558, 0x97e1, "Clevo P970[ER][CDFN]", ALC1220_FIXUP_CLEVO_P950),
> -	SND_PCI_QUIRK(0x1558, 0x97e2, "Clevo P970RC-M", ALC1220_FIXUP_CLEVO_P950),
> -	SND_PCI_QUIRK(0x1558, 0xd502, "Clevo PD50SNE", ALC1220_FIXUP_CLEVO_PB51ED_PINS),
> -	SND_PCI_QUIRK_VENDOR(0x1558, "Clevo laptop", ALC882_FIXUP_EAPD),
> -	SND_PCI_QUIRK(0x161f, 0x2054, "Medion laptop", ALC883_FIXUP_EAPD),
> -	SND_PCI_QUIRK(0x17aa, 0x3a0d, "Lenovo Y530", ALC882_FIXUP_LENOVO_Y530),
> -	SND_PCI_QUIRK(0x8086, 0x0022, "DX58SO", ALC889_FIXUP_COEF),
> -	{}
> -};
> -
> -static const struct hda_model_fixup alc882_fixup_models[] = {
> -	{.id = ALC882_FIXUP_ABIT_AW9D_MAX, .name = "abit-aw9d"},
> -	{.id = ALC882_FIXUP_LENOVO_Y530, .name = "lenovo-y530"},
> -	{.id = ALC882_FIXUP_ACER_ASPIRE_7736, .name = "acer-aspire-7736"},
> -	{.id = ALC882_FIXUP_ASUS_W90V, .name = "asus-w90v"},
> -	{.id = ALC889_FIXUP_CD, .name = "cd"},
> -	{.id = ALC889_FIXUP_FRONT_HP_NO_PRESENCE, .name = "no-front-hp"},
> -	{.id = ALC889_FIXUP_VAIO_TT, .name = "vaio-tt"},
> -	{.id = ALC888_FIXUP_EEE1601, .name = "eee1601"},
> -	{.id = ALC882_FIXUP_EAPD, .name = "alc882-eapd"},
> -	{.id = ALC883_FIXUP_EAPD, .name = "alc883-eapd"},
> -	{.id = ALC882_FIXUP_GPIO1, .name = "gpio1"},
> -	{.id = ALC882_FIXUP_GPIO2, .name = "gpio2"},
> -	{.id = ALC882_FIXUP_GPIO3, .name = "gpio3"},
> -	{.id = ALC889_FIXUP_COEF, .name = "alc889-coef"},
> -	{.id = ALC882_FIXUP_ASUS_W2JC, .name = "asus-w2jc"},
> -	{.id = ALC882_FIXUP_ACER_ASPIRE_4930G, .name = "acer-aspire-4930g"},
> -	{.id = ALC882_FIXUP_ACER_ASPIRE_8930G, .name = "acer-aspire-8930g"},
> -	{.id = ALC883_FIXUP_ACER_EAPD, .name = "acer-aspire"},
> -	{.id = ALC885_FIXUP_MACPRO_GPIO, .name = "macpro-gpio"},
> -	{.id = ALC889_FIXUP_DAC_ROUTE, .name = "dac-route"},
> -	{.id = ALC889_FIXUP_MBP_VREF, .name = "mbp-vref"},
> -	{.id = ALC889_FIXUP_IMAC91_VREF, .name = "imac91-vref"},
> -	{.id = ALC889_FIXUP_MBA11_VREF, .name = "mba11-vref"},
> -	{.id = ALC889_FIXUP_MBA21_VREF, .name = "mba21-vref"},
> -	{.id = ALC889_FIXUP_MP11_VREF, .name = "mp11-vref"},
> -	{.id = ALC889_FIXUP_MP41_VREF, .name = "mp41-vref"},
> -	{.id = ALC882_FIXUP_INV_DMIC, .name = "inv-dmic"},
> -	{.id = ALC882_FIXUP_NO_PRIMARY_HP, .name = "no-primary-hp"},
> -	{.id = ALC887_FIXUP_ASUS_BASS, .name = "asus-bass"},
> -	{.id = ALC1220_FIXUP_GB_DUAL_CODECS, .name = "dual-codecs"},
> -	{.id = ALC1220_FIXUP_GB_X570, .name = "gb-x570"},
> -	{.id = ALC1220_FIXUP_CLEVO_P950, .name = "clevo-p950"},
> -	{}
> -};
> -
> -static const struct snd_hda_pin_quirk alc882_pin_fixup_tbl[] = {
> -	SND_HDA_PIN_QUIRK(0x10ec1220, 0x1043, "ASUS", ALC1220_FIXUP_CLEVO_P950,
> -		{0x14, 0x01014010},
> -		{0x15, 0x01011012},
> -		{0x16, 0x01016011},
> -		{0x18, 0x01a19040},
> -		{0x19, 0x02a19050},
> -		{0x1a, 0x0181304f},
> -		{0x1b, 0x0221401f},
> -		{0x1e, 0x01456130}),
> -	SND_HDA_PIN_QUIRK(0x10ec1220, 0x1462, "MS-7C35", ALC1220_FIXUP_CLEVO_P950,
> -		{0x14, 0x01015010},
> -		{0x15, 0x01011012},
> -		{0x16, 0x01011011},
> -		{0x18, 0x01a11040},
> -		{0x19, 0x02a19050},
> -		{0x1a, 0x0181104f},
> -		{0x1b, 0x0221401f},
> -		{0x1e, 0x01451130}),
> -	{}
> -};
> -
> -/*
> - * BIOS auto configuration
> - */
> -/* almost identical with ALC880 parser... */
> -static int alc882_parse_auto_config(struct hda_codec *codec)
> -{
> -	static const hda_nid_t alc882_ignore[] = { 0x1d, 0 };
> -	static const hda_nid_t alc882_ssids[] = { 0x15, 0x1b, 0x14, 0 };
> -	return alc_parse_auto_config(codec, alc882_ignore, alc882_ssids);
> -}
> -
> -/*
> - */
> -static int patch_alc882(struct hda_codec *codec)
> -{
> -	struct alc_spec *spec;
> -	int err;
> -
> -	err = alc_alloc_spec(codec, 0x0b);
> -	if (err < 0)
> -		return err;
> -
> -	spec = codec->spec;
> -
> -	switch (codec->core.vendor_id) {
> -	case 0x10ec0882:
> -	case 0x10ec0885:
> -	case 0x10ec0900:
> -	case 0x10ec0b00:
> -	case 0x10ec1220:
> -		break;
> -	default:
> -		/* ALC883 and variants */
> -		alc_fix_pll_init(codec, 0x20, 0x0a, 10);
> -		break;
> -	}
> -
> -	alc_pre_init(codec);
> -
> -	snd_hda_pick_fixup(codec, alc882_fixup_models, alc882_fixup_tbl,
> -		       alc882_fixups);
> -	snd_hda_pick_pin_fixup(codec, alc882_pin_fixup_tbl, alc882_fixups, true);
> -	snd_hda_apply_fixup(codec, HDA_FIXUP_ACT_PRE_PROBE);
> -
> -	alc_auto_parse_customize_define(codec);
> -
> -	if (has_cdefine_beep(codec))
> -		spec->gen.beep_nid = 0x01;
> -
> -	/* automatic parse from the BIOS config */
> -	err = alc882_parse_auto_config(codec);
> -	if (err < 0)
> -		goto error;
> -
> -	if (!spec->gen.no_analog && spec->gen.beep_nid) {
> -		err = set_beep_amp(spec, 0x0b, 0x05, HDA_INPUT);
> -		if (err < 0)
> -			goto error;
> -	}
> -
> -	snd_hda_apply_fixup(codec, HDA_FIXUP_ACT_PROBE);
> -
> -	return 0;
> -
> - error:
> -	alc_free(codec);
> -	return err;
> -}
> -
> -
> -/*
> - * ALC262 support
> - */
> -static int alc262_parse_auto_config(struct hda_codec *codec)
> -{
> -	static const hda_nid_t alc262_ignore[] = { 0x1d, 0 };
> -	static const hda_nid_t alc262_ssids[] = { 0x15, 0x1b, 0x14, 0 };
> -	return alc_parse_auto_config(codec, alc262_ignore, alc262_ssids);
> -}
> -
> -/*
> - * Pin config fixes
> - */
> -enum {
> -	ALC262_FIXUP_FSC_H270,
> -	ALC262_FIXUP_FSC_S7110,
> -	ALC262_FIXUP_HP_Z200,
> -	ALC262_FIXUP_TYAN,
> -	ALC262_FIXUP_LENOVO_3000,
> -	ALC262_FIXUP_BENQ,
> -	ALC262_FIXUP_BENQ_T31,
> -	ALC262_FIXUP_INV_DMIC,
> -	ALC262_FIXUP_INTEL_BAYLEYBAY,
> -};
> -
> -static const struct hda_fixup alc262_fixups[] = {
> -	[ALC262_FIXUP_FSC_H270] = {
> -		.type = HDA_FIXUP_PINS,
> -		.v.pins = (const struct hda_pintbl[]) {
> -			{ 0x14, 0x99130110 }, /* speaker */
> -			{ 0x15, 0x0221142f }, /* front HP */
> -			{ 0x1b, 0x0121141f }, /* rear HP */
> -			{ }
> -		}
> -	},
> -	[ALC262_FIXUP_FSC_S7110] = {
> -		.type = HDA_FIXUP_PINS,
> -		.v.pins = (const struct hda_pintbl[]) {
> -			{ 0x15, 0x90170110 }, /* speaker */
> -			{ }
> -		},
> -		.chained = true,
> -		.chain_id = ALC262_FIXUP_BENQ,
> -	},
> -	[ALC262_FIXUP_HP_Z200] = {
> -		.type = HDA_FIXUP_PINS,
> -		.v.pins = (const struct hda_pintbl[]) {
> -			{ 0x16, 0x99130120 }, /* internal speaker */
> -			{ }
> -		}
> -	},
> -	[ALC262_FIXUP_TYAN] = {
> -		.type = HDA_FIXUP_PINS,
> -		.v.pins = (const struct hda_pintbl[]) {
> -			{ 0x14, 0x1993e1f0 }, /* int AUX */
> -			{ }
> -		}
> -	},
> -	[ALC262_FIXUP_LENOVO_3000] = {
> -		.type = HDA_FIXUP_PINCTLS,
> -		.v.pins = (const struct hda_pintbl[]) {
> -			{ 0x19, PIN_VREF50 },
> -			{}
> -		},
> -		.chained = true,
> -		.chain_id = ALC262_FIXUP_BENQ,
> -	},
> -	[ALC262_FIXUP_BENQ] = {
> -		.type = HDA_FIXUP_VERBS,
> -		.v.verbs = (const struct hda_verb[]) {
> -			{ 0x20, AC_VERB_SET_COEF_INDEX, 0x07 },
> -			{ 0x20, AC_VERB_SET_PROC_COEF, 0x3070 },
> -			{}
> -		}
> -	},
> -	[ALC262_FIXUP_BENQ_T31] = {
> -		.type = HDA_FIXUP_VERBS,
> -		.v.verbs = (const struct hda_verb[]) {
> -			{ 0x20, AC_VERB_SET_COEF_INDEX, 0x07 },
> -			{ 0x20, AC_VERB_SET_PROC_COEF, 0x3050 },
> -			{}
> -		}
> -	},
> -	[ALC262_FIXUP_INV_DMIC] = {
> -		.type = HDA_FIXUP_FUNC,
> -		.v.func = alc_fixup_inv_dmic,
> -	},
> -	[ALC262_FIXUP_INTEL_BAYLEYBAY] = {
> -		.type = HDA_FIXUP_FUNC,
> -		.v.func = alc_fixup_no_depop_delay,
> -	},
> -};
> -
> -static const struct hda_quirk alc262_fixup_tbl[] = {
> -	SND_PCI_QUIRK(0x103c, 0x170b, "HP Z200", ALC262_FIXUP_HP_Z200),
> -	SND_PCI_QUIRK(0x10cf, 0x1397, "Fujitsu Lifebook S7110", ALC262_FIXUP_FSC_S7110),
> -	SND_PCI_QUIRK(0x10cf, 0x142d, "Fujitsu Lifebook E8410", ALC262_FIXUP_BENQ),
> -	SND_PCI_QUIRK(0x10f1, 0x2915, "Tyan Thunder n6650W", ALC262_FIXUP_TYAN),
> -	SND_PCI_QUIRK(0x1734, 0x1141, "FSC ESPRIMO U9210", ALC262_FIXUP_FSC_H270),
> -	SND_PCI_QUIRK(0x1734, 0x1147, "FSC Celsius H270", ALC262_FIXUP_FSC_H270),
> -	SND_PCI_QUIRK(0x17aa, 0x384e, "Lenovo 3000", ALC262_FIXUP_LENOVO_3000),
> -	SND_PCI_QUIRK(0x17ff, 0x0560, "Benq ED8", ALC262_FIXUP_BENQ),
> -	SND_PCI_QUIRK(0x17ff, 0x058d, "Benq T31-16", ALC262_FIXUP_BENQ_T31),
> -	SND_PCI_QUIRK(0x8086, 0x7270, "BayleyBay", ALC262_FIXUP_INTEL_BAYLEYBAY),
> -	{}
> -};
> -
> -static const struct hda_model_fixup alc262_fixup_models[] = {
> -	{.id = ALC262_FIXUP_INV_DMIC, .name = "inv-dmic"},
> -	{.id = ALC262_FIXUP_FSC_H270, .name = "fsc-h270"},
> -	{.id = ALC262_FIXUP_FSC_S7110, .name = "fsc-s7110"},
> -	{.id = ALC262_FIXUP_HP_Z200, .name = "hp-z200"},
> -	{.id = ALC262_FIXUP_TYAN, .name = "tyan"},
> -	{.id = ALC262_FIXUP_LENOVO_3000, .name = "lenovo-3000"},
> -	{.id = ALC262_FIXUP_BENQ, .name = "benq"},
> -	{.id = ALC262_FIXUP_BENQ_T31, .name = "benq-t31"},
> -	{.id = ALC262_FIXUP_INTEL_BAYLEYBAY, .name = "bayleybay"},
> -	{}
> -};
> -
> -/*
> - */
> -static int patch_alc262(struct hda_codec *codec)
> -{
> -	struct alc_spec *spec;
> -	int err;
> -
> -	err = alc_alloc_spec(codec, 0x0b);
> -	if (err < 0)
> -		return err;
> -
> -	spec = codec->spec;
> -	spec->gen.shared_mic_vref_pin = 0x18;
> -
> -	spec->shutup = alc_eapd_shutup;
> -
> -#if 0
> -	/* pshou 07/11/05  set a zero PCM sample to DAC when FIFO is
> -	 * under-run
> -	 */
> -	alc_update_coefex_idx(codec, 0x1a, 7, 0, 0x80);
> -#endif
> -	alc_fix_pll_init(codec, 0x20, 0x0a, 10);
> -
> -	alc_pre_init(codec);
> -
> -	snd_hda_pick_fixup(codec, alc262_fixup_models, alc262_fixup_tbl,
> -		       alc262_fixups);
> -	snd_hda_apply_fixup(codec, HDA_FIXUP_ACT_PRE_PROBE);
> -
> -	alc_auto_parse_customize_define(codec);
> -
> -	if (has_cdefine_beep(codec))
> -		spec->gen.beep_nid = 0x01;
> -
> -	/* automatic parse from the BIOS config */
> -	err = alc262_parse_auto_config(codec);
> -	if (err < 0)
> -		goto error;
> -
> -	if (!spec->gen.no_analog && spec->gen.beep_nid) {
> -		err = set_beep_amp(spec, 0x0b, 0x05, HDA_INPUT);
> -		if (err < 0)
> -			goto error;
> -	}
> -
> -	snd_hda_apply_fixup(codec, HDA_FIXUP_ACT_PROBE);
> -
> -	return 0;
> -
> - error:
> -	alc_free(codec);
> -	return err;
> -}
> -
> -/*
> - *  ALC268
> - */
> -/* bind Beep switches of both NID 0x0f and 0x10 */
> -static int alc268_beep_switch_put(struct snd_kcontrol *kcontrol,
> -				  struct snd_ctl_elem_value *ucontrol)
> -{
> -	struct hda_codec *codec = snd_kcontrol_chip(kcontrol);
> -	unsigned long pval;
> -	int err;
> -
> -	mutex_lock(&codec->control_mutex);
> -	pval = kcontrol->private_value;
> -	kcontrol->private_value = (pval & ~0xff) | 0x0f;
> -	err = snd_hda_mixer_amp_switch_put(kcontrol, ucontrol);
> -	if (err >= 0) {
> -		kcontrol->private_value = (pval & ~0xff) | 0x10;
> -		err = snd_hda_mixer_amp_switch_put(kcontrol, ucontrol);
> -	}
> -	kcontrol->private_value = pval;
> -	mutex_unlock(&codec->control_mutex);
> -	return err;
> -}
> -
> -static const struct snd_kcontrol_new alc268_beep_mixer[] = {
> -	HDA_CODEC_VOLUME("Beep Playback Volume", 0x1d, 0x0, HDA_INPUT),
> -	{
> -		.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
> -		.name = "Beep Playback Switch",
> -		.subdevice = HDA_SUBDEV_AMP_FLAG,
> -		.info = snd_hda_mixer_amp_switch_info,
> -		.get = snd_hda_mixer_amp_switch_get,
> -		.put = alc268_beep_switch_put,
> -		.private_value = HDA_COMPOSE_AMP_VAL(0x0f, 3, 1, HDA_INPUT)
> -	},
> -};
> -
> -/* set PCBEEP vol = 0, mute connections */
> -static const struct hda_verb alc268_beep_init_verbs[] = {
> -	{0x1d, AC_VERB_SET_AMP_GAIN_MUTE, AMP_IN_UNMUTE(0)},
> -	{0x0f, AC_VERB_SET_AMP_GAIN_MUTE, AMP_IN_MUTE(1)},
> -	{0x10, AC_VERB_SET_AMP_GAIN_MUTE, AMP_IN_MUTE(1)},
> -	{ }
> -};
> -
> -enum {
> -	ALC268_FIXUP_INV_DMIC,
> -	ALC268_FIXUP_HP_EAPD,
> -	ALC268_FIXUP_SPDIF,
> -};
> -
> -static const struct hda_fixup alc268_fixups[] = {
> -	[ALC268_FIXUP_INV_DMIC] = {
> -		.type = HDA_FIXUP_FUNC,
> -		.v.func = alc_fixup_inv_dmic,
> -	},
> -	[ALC268_FIXUP_HP_EAPD] = {
> -		.type = HDA_FIXUP_VERBS,
> -		.v.verbs = (const struct hda_verb[]) {
> -			{0x15, AC_VERB_SET_EAPD_BTLENABLE, 0},
> -			{}
> -		}
> -	},
> -	[ALC268_FIXUP_SPDIF] = {
> -		.type = HDA_FIXUP_PINS,
> -		.v.pins = (const struct hda_pintbl[]) {
> -			{ 0x1e, 0x014b1180 }, /* enable SPDIF out */
> -			{}
> -		}
> -	},
> -};
> -
> -static const struct hda_model_fixup alc268_fixup_models[] = {
> -	{.id = ALC268_FIXUP_INV_DMIC, .name = "inv-dmic"},
> -	{.id = ALC268_FIXUP_HP_EAPD, .name = "hp-eapd"},
> -	{.id = ALC268_FIXUP_SPDIF, .name = "spdif"},
> -	{}
> -};
> -
> -static const struct hda_quirk alc268_fixup_tbl[] = {
> -	SND_PCI_QUIRK(0x1025, 0x0139, "Acer TravelMate 6293", ALC268_FIXUP_SPDIF),
> -	SND_PCI_QUIRK(0x1025, 0x015b, "Acer AOA 150 (ZG5)", ALC268_FIXUP_INV_DMIC),
> -	/* below is codec SSID since multiple Toshiba laptops have the
> -	 * same PCI SSID 1179:ff00
> -	 */
> -	SND_PCI_QUIRK(0x1179, 0xff06, "Toshiba P200", ALC268_FIXUP_HP_EAPD),
> -	{}
> -};
> -
> -/*
> - * BIOS auto configuration
> - */
> -static int alc268_parse_auto_config(struct hda_codec *codec)
> -{
> -	static const hda_nid_t alc268_ssids[] = { 0x15, 0x1b, 0x14, 0 };
> -	return alc_parse_auto_config(codec, NULL, alc268_ssids);
> -}
> -
> -/*
> - */
> -static int patch_alc268(struct hda_codec *codec)
> -{
> -	struct alc_spec *spec;
> -	int i, err;
> -
> -	/* ALC268 has no aa-loopback mixer */
> -	err = alc_alloc_spec(codec, 0);
> -	if (err < 0)
> -		return err;
> -
> -	spec = codec->spec;
> -	if (has_cdefine_beep(codec))
> -		spec->gen.beep_nid = 0x01;
> -
> -	spec->shutup = alc_eapd_shutup;
> -
> -	alc_pre_init(codec);
> -
> -	snd_hda_pick_fixup(codec, alc268_fixup_models, alc268_fixup_tbl, alc268_fixups);
> -	snd_hda_apply_fixup(codec, HDA_FIXUP_ACT_PRE_PROBE);
> -
> -	/* automatic parse from the BIOS config */
> -	err = alc268_parse_auto_config(codec);
> -	if (err < 0)
> -		goto error;
> -
> -	if (err > 0 && !spec->gen.no_analog &&
> -	    spec->gen.autocfg.speaker_pins[0] != 0x1d) {
> -		for (i = 0; i < ARRAY_SIZE(alc268_beep_mixer); i++) {
> -			if (!snd_hda_gen_add_kctl(&spec->gen, NULL,
> -						  &alc268_beep_mixer[i])) {
> -				err = -ENOMEM;
> -				goto error;
> -			}
> -		}
> -		snd_hda_add_verbs(codec, alc268_beep_init_verbs);
> -		if (!query_amp_caps(codec, 0x1d, HDA_INPUT))
> -			/* override the amp caps for beep generator */
> -			snd_hda_override_amp_caps(codec, 0x1d, HDA_INPUT,
> -					  (0x0c << AC_AMPCAP_OFFSET_SHIFT) |
> -					  (0x0c << AC_AMPCAP_NUM_STEPS_SHIFT) |
> -					  (0x07 << AC_AMPCAP_STEP_SIZE_SHIFT) |
> -					  (0 << AC_AMPCAP_MUTE_SHIFT));
> -	}
> -
> -	snd_hda_apply_fixup(codec, HDA_FIXUP_ACT_PROBE);
> -
> -	return 0;
> -
> - error:
> -	alc_free(codec);
> -	return err;
> -}
> -
> -/*
> - * ALC269
> - */
> -
>   static const struct hda_pcm_stream alc269_44k_pcm_analog_playback = {
>   	.rates = SNDRV_PCM_RATE_44100, /* fixed rate */
>   };
> @@ -4191,15 +1046,6 @@ static void alc269_fixup_hweq(struct hda_codec *codec,
>   		alc_update_coef_idx(codec, 0x1e, 0, 0x80);
>   }
>   
> -static void alc269_fixup_headset_mic(struct hda_codec *codec,
> -				       const struct hda_fixup *fix, int action)
> -{
> -	struct alc_spec *spec = codec->spec;
> -
> -	if (action == HDA_FIXUP_ACT_PRE_PROBE)
> -		spec->parse_flags |= HDA_PINCFG_HEADSET_MIC;
> -}
> -
>   static void alc271_fixup_dmic(struct hda_codec *codec,
>   			      const struct hda_fixup *fix, int action)
>   {
> @@ -4470,61 +1316,6 @@ static void alc269_fixup_hp_mute_led_mic3(struct hda_codec *codec,
>   	alc269_fixup_hp_mute_led_micx(codec, fix, action, 0x1b);
>   }
>   
> -/* update LED status via GPIO */
> -static void alc_update_gpio_led(struct hda_codec *codec, unsigned int mask,
> -				int polarity, bool enabled)
> -{
> -	if (polarity)
> -		enabled = !enabled;
> -	alc_update_gpio_data(codec, mask, !enabled); /* muted -> LED on */
> -}
> -
> -/* turn on/off mute LED via GPIO per vmaster hook */
> -static int gpio_mute_led_set(struct led_classdev *led_cdev,
> -			     enum led_brightness brightness)
> -{
> -	struct hda_codec *codec = dev_to_hda_codec(led_cdev->dev->parent);
> -	struct alc_spec *spec = codec->spec;
> -
> -	alc_update_gpio_led(codec, spec->gpio_mute_led_mask,
> -			    spec->mute_led_polarity, !brightness);
> -	return 0;
> -}
> -
> -/* turn on/off mic-mute LED via GPIO per capture hook */
> -static int micmute_led_set(struct led_classdev *led_cdev,
> -			   enum led_brightness brightness)
> -{
> -	struct hda_codec *codec = dev_to_hda_codec(led_cdev->dev->parent);
> -	struct alc_spec *spec = codec->spec;
> -
> -	alc_update_gpio_led(codec, spec->gpio_mic_led_mask,
> -			    spec->micmute_led_polarity, !brightness);
> -	return 0;
> -}
> -
> -/* setup mute and mic-mute GPIO bits, add hooks appropriately */
> -static void alc_fixup_hp_gpio_led(struct hda_codec *codec,
> -				  int action,
> -				  unsigned int mute_mask,
> -				  unsigned int micmute_mask)
> -{
> -	struct alc_spec *spec = codec->spec;
> -
> -	alc_fixup_gpio(codec, action, mute_mask | micmute_mask);
> -
> -	if (action != HDA_FIXUP_ACT_PRE_PROBE)
> -		return;
> -	if (mute_mask) {
> -		spec->gpio_mute_led_mask = mute_mask;
> -		snd_hda_gen_add_mute_led_cdev(codec, gpio_mute_led_set);
> -	}
> -	if (micmute_mask) {
> -		spec->gpio_mic_led_mask = micmute_mask;
> -		snd_hda_gen_add_micmute_led_cdev(codec, micmute_led_set);
> -	}
> -}
> -
>   static void alc236_fixup_hp_gpio_led(struct hda_codec *codec,
>   				const struct hda_fixup *fix, int action)
>   {
> @@ -5167,985 +1958,6 @@ static void alc233_fixup_lenovo_low_en_micmute_led(struct hda_codec *codec,
>   	alc233_fixup_lenovo_line2_mic_hotkey(codec, fix, action);
>   }
>   
> -static void alc_hp_mute_disable(struct hda_codec *codec, unsigned int delay)
> -{
> -	if (delay <= 0)
> -		delay = 75;
> -	snd_hda_codec_write(codec, 0x21, 0,
> -		    AC_VERB_SET_AMP_GAIN_MUTE, AMP_OUT_MUTE);
> -	msleep(delay);
> -	snd_hda_codec_write(codec, 0x21, 0,
> -		    AC_VERB_SET_PIN_WIDGET_CONTROL, 0x0);
> -	msleep(delay);
> -}
> -
> -static void alc_hp_enable_unmute(struct hda_codec *codec, unsigned int delay)
> -{
> -	if (delay <= 0)
> -		delay = 75;
> -	snd_hda_codec_write(codec, 0x21, 0,
> -		    AC_VERB_SET_PIN_WIDGET_CONTROL, PIN_OUT);
> -	msleep(delay);
> -	snd_hda_codec_write(codec, 0x21, 0,
> -		    AC_VERB_SET_AMP_GAIN_MUTE, AMP_OUT_UNMUTE);
> -	msleep(delay);
> -}
> -
> -static const struct coef_fw alc225_pre_hsmode[] = {
> -	UPDATE_COEF(0x4a, 1<<8, 0),
> -	UPDATE_COEFEX(0x57, 0x05, 1<<14, 0),
> -	UPDATE_COEF(0x63, 3<<14, 3<<14),
> -	UPDATE_COEF(0x4a, 3<<4, 2<<4),
> -	UPDATE_COEF(0x4a, 3<<10, 3<<10),
> -	UPDATE_COEF(0x45, 0x3f<<10, 0x34<<10),
> -	UPDATE_COEF(0x4a, 3<<10, 0),
> -	{}
> -};
> -
> -static void alc_headset_mode_unplugged(struct hda_codec *codec)
> -{
> -	struct alc_spec *spec = codec->spec;
> -	static const struct coef_fw coef0255[] = {
> -		WRITE_COEF(0x1b, 0x0c0b), /* LDO and MISC control */
> -		WRITE_COEF(0x45, 0xd089), /* UAJ function set to menual mode */
> -		UPDATE_COEFEX(0x57, 0x05, 1<<14, 0), /* Direct Drive HP Amp control(Set to verb control)*/
> -		WRITE_COEF(0x06, 0x6104), /* Set MIC2 Vref gate with HP */
> -		WRITE_COEFEX(0x57, 0x03, 0x8aa6), /* Direct Drive HP Amp control */
> -		{}
> -	};
> -	static const struct coef_fw coef0256[] = {
> -		WRITE_COEF(0x1b, 0x0c4b), /* LDO and MISC control */
> -		WRITE_COEF(0x45, 0xd089), /* UAJ function set to menual mode */
> -		WRITE_COEF(0x06, 0x6104), /* Set MIC2 Vref gate with HP */
> -		WRITE_COEFEX(0x57, 0x03, 0x09a3), /* Direct Drive HP Amp control */
> -		UPDATE_COEFEX(0x57, 0x05, 1<<14, 0), /* Direct Drive HP Amp control(Set to verb control)*/
> -		{}
> -	};
> -	static const struct coef_fw coef0233[] = {
> -		WRITE_COEF(0x1b, 0x0c0b),
> -		WRITE_COEF(0x45, 0xc429),
> -		UPDATE_COEF(0x35, 0x4000, 0),
> -		WRITE_COEF(0x06, 0x2104),
> -		WRITE_COEF(0x1a, 0x0001),
> -		WRITE_COEF(0x26, 0x0004),
> -		WRITE_COEF(0x32, 0x42a3),
> -		{}
> -	};
> -	static const struct coef_fw coef0288[] = {
> -		UPDATE_COEF(0x4f, 0xfcc0, 0xc400),
> -		UPDATE_COEF(0x50, 0x2000, 0x2000),
> -		UPDATE_COEF(0x56, 0x0006, 0x0006),
> -		UPDATE_COEF(0x66, 0x0008, 0),
> -		UPDATE_COEF(0x67, 0x2000, 0),
> -		{}
> -	};
> -	static const struct coef_fw coef0298[] = {
> -		UPDATE_COEF(0x19, 0x1300, 0x0300),
> -		{}
> -	};
> -	static const struct coef_fw coef0292[] = {
> -		WRITE_COEF(0x76, 0x000e),
> -		WRITE_COEF(0x6c, 0x2400),
> -		WRITE_COEF(0x18, 0x7308),
> -		WRITE_COEF(0x6b, 0xc429),
> -		{}
> -	};
> -	static const struct coef_fw coef0293[] = {
> -		UPDATE_COEF(0x10, 7<<8, 6<<8), /* SET Line1 JD to 0 */
> -		UPDATE_COEFEX(0x57, 0x05, 1<<15|1<<13, 0x0), /* SET charge pump by verb */
> -		UPDATE_COEFEX(0x57, 0x03, 1<<10, 1<<10), /* SET EN_OSW to 1 */
> -		UPDATE_COEF(0x1a, 1<<3, 1<<3), /* Combo JD gating with LINE1-VREFO */
> -		WRITE_COEF(0x45, 0xc429), /* Set to TRS type */
> -		UPDATE_COEF(0x4a, 0x000f, 0x000e), /* Combo Jack auto detect */
> -		{}
> -	};
> -	static const struct coef_fw coef0668[] = {
> -		WRITE_COEF(0x15, 0x0d40),
> -		WRITE_COEF(0xb7, 0x802b),
> -		{}
> -	};
> -	static const struct coef_fw coef0225[] = {
> -		UPDATE_COEF(0x63, 3<<14, 0),
> -		{}
> -	};
> -	static const struct coef_fw coef0274[] = {
> -		UPDATE_COEF(0x4a, 0x0100, 0),
> -		UPDATE_COEFEX(0x57, 0x05, 0x4000, 0),
> -		UPDATE_COEF(0x6b, 0xf000, 0x5000),
> -		UPDATE_COEF(0x4a, 0x0010, 0),
> -		UPDATE_COEF(0x4a, 0x0c00, 0x0c00),
> -		WRITE_COEF(0x45, 0x5289),
> -		UPDATE_COEF(0x4a, 0x0c00, 0),
> -		{}
> -	};
> -
> -	if (spec->no_internal_mic_pin) {
> -		alc_update_coef_idx(codec, 0x45, 0xf<<12 | 1<<10, 5<<12);
> -		return;
> -	}
> -
> -	switch (codec->core.vendor_id) {
> -	case 0x10ec0255:
> -		alc_process_coef_fw(codec, coef0255);
> -		break;
> -	case 0x10ec0230:
> -	case 0x10ec0236:
> -	case 0x10ec0256:
> -	case 0x19e58326:
> -		alc_hp_mute_disable(codec, 75);
> -		alc_process_coef_fw(codec, coef0256);
> -		break;
> -	case 0x10ec0234:
> -	case 0x10ec0274:
> -	case 0x10ec0294:
> -		alc_process_coef_fw(codec, coef0274);
> -		break;
> -	case 0x10ec0233:
> -	case 0x10ec0283:
> -		alc_process_coef_fw(codec, coef0233);
> -		break;
> -	case 0x10ec0286:
> -	case 0x10ec0288:
> -		alc_process_coef_fw(codec, coef0288);
> -		break;
> -	case 0x10ec0298:
> -		alc_process_coef_fw(codec, coef0298);
> -		alc_process_coef_fw(codec, coef0288);
> -		break;
> -	case 0x10ec0292:
> -		alc_process_coef_fw(codec, coef0292);
> -		break;
> -	case 0x10ec0293:
> -		alc_process_coef_fw(codec, coef0293);
> -		break;
> -	case 0x10ec0668:
> -		alc_process_coef_fw(codec, coef0668);
> -		break;
> -	case 0x10ec0215:
> -	case 0x10ec0225:
> -	case 0x10ec0285:
> -	case 0x10ec0295:
> -	case 0x10ec0289:
> -	case 0x10ec0299:
> -		alc_hp_mute_disable(codec, 75);
> -		alc_process_coef_fw(codec, alc225_pre_hsmode);
> -		alc_process_coef_fw(codec, coef0225);
> -		break;
> -	case 0x10ec0867:
> -		alc_update_coefex_idx(codec, 0x57, 0x5, 1<<14, 0);
> -		break;
> -	}
> -	codec_dbg(codec, "Headset jack set to unplugged mode.\n");
> -}
> -
> -
> -static void alc_headset_mode_mic_in(struct hda_codec *codec, hda_nid_t hp_pin,
> -				    hda_nid_t mic_pin)
> -{
> -	static const struct coef_fw coef0255[] = {
> -		WRITE_COEFEX(0x57, 0x03, 0x8aa6),
> -		WRITE_COEF(0x06, 0x6100), /* Set MIC2 Vref gate to normal */
> -		{}
> -	};
> -	static const struct coef_fw coef0256[] = {
> -		UPDATE_COEFEX(0x57, 0x05, 1<<14, 1<<14), /* Direct Drive HP Amp control(Set to verb control)*/
> -		WRITE_COEFEX(0x57, 0x03, 0x09a3),
> -		WRITE_COEF(0x06, 0x6100), /* Set MIC2 Vref gate to normal */
> -		{}
> -	};
> -	static const struct coef_fw coef0233[] = {
> -		UPDATE_COEF(0x35, 0, 1<<14),
> -		WRITE_COEF(0x06, 0x2100),
> -		WRITE_COEF(0x1a, 0x0021),
> -		WRITE_COEF(0x26, 0x008c),
> -		{}
> -	};
> -	static const struct coef_fw coef0288[] = {
> -		UPDATE_COEF(0x4f, 0x00c0, 0),
> -		UPDATE_COEF(0x50, 0x2000, 0),
> -		UPDATE_COEF(0x56, 0x0006, 0),
> -		UPDATE_COEF(0x4f, 0xfcc0, 0xc400),
> -		UPDATE_COEF(0x66, 0x0008, 0x0008),
> -		UPDATE_COEF(0x67, 0x2000, 0x2000),
> -		{}
> -	};
> -	static const struct coef_fw coef0292[] = {
> -		WRITE_COEF(0x19, 0xa208),
> -		WRITE_COEF(0x2e, 0xacf0),
> -		{}
> -	};
> -	static const struct coef_fw coef0293[] = {
> -		UPDATE_COEFEX(0x57, 0x05, 0, 1<<15|1<<13), /* SET charge pump by verb */
> -		UPDATE_COEFEX(0x57, 0x03, 1<<10, 0), /* SET EN_OSW to 0 */
> -		UPDATE_COEF(0x1a, 1<<3, 0), /* Combo JD gating without LINE1-VREFO */
> -		{}
> -	};
> -	static const struct coef_fw coef0688[] = {
> -		WRITE_COEF(0xb7, 0x802b),
> -		WRITE_COEF(0xb5, 0x1040),
> -		UPDATE_COEF(0xc3, 0, 1<<12),
> -		{}
> -	};
> -	static const struct coef_fw coef0225[] = {
> -		UPDATE_COEFEX(0x57, 0x05, 1<<14, 1<<14),
> -		UPDATE_COEF(0x4a, 3<<4, 2<<4),
> -		UPDATE_COEF(0x63, 3<<14, 0),
> -		{}
> -	};
> -	static const struct coef_fw coef0274[] = {
> -		UPDATE_COEFEX(0x57, 0x05, 0x4000, 0x4000),
> -		UPDATE_COEF(0x4a, 0x0010, 0),
> -		UPDATE_COEF(0x6b, 0xf000, 0),
> -		{}
> -	};
> -
> -	switch (codec->core.vendor_id) {
> -	case 0x10ec0255:
> -		alc_write_coef_idx(codec, 0x45, 0xc489);
> -		snd_hda_set_pin_ctl_cache(codec, hp_pin, 0);
> -		alc_process_coef_fw(codec, coef0255);
> -		snd_hda_set_pin_ctl_cache(codec, mic_pin, PIN_VREF50);
> -		break;
> -	case 0x10ec0230:
> -	case 0x10ec0236:
> -	case 0x10ec0256:
> -	case 0x19e58326:
> -		alc_write_coef_idx(codec, 0x45, 0xc489);
> -		snd_hda_set_pin_ctl_cache(codec, hp_pin, 0);
> -		alc_process_coef_fw(codec, coef0256);
> -		snd_hda_set_pin_ctl_cache(codec, mic_pin, PIN_VREF50);
> -		break;
> -	case 0x10ec0234:
> -	case 0x10ec0274:
> -	case 0x10ec0294:
> -		alc_write_coef_idx(codec, 0x45, 0x4689);
> -		snd_hda_set_pin_ctl_cache(codec, hp_pin, 0);
> -		alc_process_coef_fw(codec, coef0274);
> -		snd_hda_set_pin_ctl_cache(codec, mic_pin, PIN_VREF50);
> -		break;
> -	case 0x10ec0233:
> -	case 0x10ec0283:
> -		alc_write_coef_idx(codec, 0x45, 0xc429);
> -		snd_hda_set_pin_ctl_cache(codec, hp_pin, 0);
> -		alc_process_coef_fw(codec, coef0233);
> -		snd_hda_set_pin_ctl_cache(codec, mic_pin, PIN_VREF50);
> -		break;
> -	case 0x10ec0286:
> -	case 0x10ec0288:
> -	case 0x10ec0298:
> -		snd_hda_set_pin_ctl_cache(codec, hp_pin, 0);
> -		alc_process_coef_fw(codec, coef0288);
> -		snd_hda_set_pin_ctl_cache(codec, mic_pin, PIN_VREF50);
> -		break;
> -	case 0x10ec0292:
> -		snd_hda_set_pin_ctl_cache(codec, hp_pin, 0);
> -		alc_process_coef_fw(codec, coef0292);
> -		break;
> -	case 0x10ec0293:
> -		/* Set to TRS mode */
> -		alc_write_coef_idx(codec, 0x45, 0xc429);
> -		snd_hda_set_pin_ctl_cache(codec, hp_pin, 0);
> -		alc_process_coef_fw(codec, coef0293);
> -		snd_hda_set_pin_ctl_cache(codec, mic_pin, PIN_VREF50);
> -		break;
> -	case 0x10ec0867:
> -		alc_update_coefex_idx(codec, 0x57, 0x5, 0, 1<<14);
> -		fallthrough;
> -	case 0x10ec0221:
> -	case 0x10ec0662:
> -		snd_hda_set_pin_ctl_cache(codec, hp_pin, 0);
> -		snd_hda_set_pin_ctl_cache(codec, mic_pin, PIN_VREF50);
> -		break;
> -	case 0x10ec0668:
> -		alc_write_coef_idx(codec, 0x11, 0x0001);
> -		snd_hda_set_pin_ctl_cache(codec, hp_pin, 0);
> -		alc_process_coef_fw(codec, coef0688);
> -		snd_hda_set_pin_ctl_cache(codec, mic_pin, PIN_VREF50);
> -		break;
> -	case 0x10ec0215:
> -	case 0x10ec0225:
> -	case 0x10ec0285:
> -	case 0x10ec0295:
> -	case 0x10ec0289:
> -	case 0x10ec0299:
> -		alc_process_coef_fw(codec, alc225_pre_hsmode);
> -		alc_update_coef_idx(codec, 0x45, 0x3f<<10, 0x31<<10);
> -		snd_hda_set_pin_ctl_cache(codec, hp_pin, 0);
> -		alc_process_coef_fw(codec, coef0225);
> -		snd_hda_set_pin_ctl_cache(codec, mic_pin, PIN_VREF50);
> -		break;
> -	}
> -	codec_dbg(codec, "Headset jack set to mic-in mode.\n");
> -}
> -
> -static void alc_headset_mode_default(struct hda_codec *codec)
> -{
> -	static const struct coef_fw coef0225[] = {
> -		UPDATE_COEF(0x45, 0x3f<<10, 0x30<<10),
> -		UPDATE_COEF(0x45, 0x3f<<10, 0x31<<10),
> -		UPDATE_COEF(0x49, 3<<8, 0<<8),
> -		UPDATE_COEF(0x4a, 3<<4, 3<<4),
> -		UPDATE_COEF(0x63, 3<<14, 0),
> -		UPDATE_COEF(0x67, 0xf000, 0x3000),
> -		{}
> -	};
> -	static const struct coef_fw coef0255[] = {
> -		WRITE_COEF(0x45, 0xc089),
> -		WRITE_COEF(0x45, 0xc489),
> -		WRITE_COEFEX(0x57, 0x03, 0x8ea6),
> -		WRITE_COEF(0x49, 0x0049),
> -		{}
> -	};
> -	static const struct coef_fw coef0256[] = {
> -		WRITE_COEF(0x45, 0xc489),
> -		WRITE_COEFEX(0x57, 0x03, 0x0da3),
> -		WRITE_COEF(0x49, 0x0049),
> -		UPDATE_COEFEX(0x57, 0x05, 1<<14, 0), /* Direct Drive HP Amp control(Set to verb control)*/
> -		WRITE_COEF(0x06, 0x6100),
> -		{}
> -	};
> -	static const struct coef_fw coef0233[] = {
> -		WRITE_COEF(0x06, 0x2100),
> -		WRITE_COEF(0x32, 0x4ea3),
> -		{}
> -	};
> -	static const struct coef_fw coef0288[] = {
> -		UPDATE_COEF(0x4f, 0xfcc0, 0xc400), /* Set to TRS type */
> -		UPDATE_COEF(0x50, 0x2000, 0x2000),
> -		UPDATE_COEF(0x56, 0x0006, 0x0006),
> -		UPDATE_COEF(0x66, 0x0008, 0),
> -		UPDATE_COEF(0x67, 0x2000, 0),
> -		{}
> -	};
> -	static const struct coef_fw coef0292[] = {
> -		WRITE_COEF(0x76, 0x000e),
> -		WRITE_COEF(0x6c, 0x2400),
> -		WRITE_COEF(0x6b, 0xc429),
> -		WRITE_COEF(0x18, 0x7308),
> -		{}
> -	};
> -	static const struct coef_fw coef0293[] = {
> -		UPDATE_COEF(0x4a, 0x000f, 0x000e), /* Combo Jack auto detect */
> -		WRITE_COEF(0x45, 0xC429), /* Set to TRS type */
> -		UPDATE_COEF(0x1a, 1<<3, 0), /* Combo JD gating without LINE1-VREFO */
> -		{}
> -	};
> -	static const struct coef_fw coef0688[] = {
> -		WRITE_COEF(0x11, 0x0041),
> -		WRITE_COEF(0x15, 0x0d40),
> -		WRITE_COEF(0xb7, 0x802b),
> -		{}
> -	};
> -	static const struct coef_fw coef0274[] = {
> -		WRITE_COEF(0x45, 0x4289),
> -		UPDATE_COEF(0x4a, 0x0010, 0x0010),
> -		UPDATE_COEF(0x6b, 0x0f00, 0),
> -		UPDATE_COEF(0x49, 0x0300, 0x0300),
> -		{}
> -	};
> -
> -	switch (codec->core.vendor_id) {
> -	case 0x10ec0215:
> -	case 0x10ec0225:
> -	case 0x10ec0285:
> -	case 0x10ec0295:
> -	case 0x10ec0289:
> -	case 0x10ec0299:
> -		alc_process_coef_fw(codec, alc225_pre_hsmode);
> -		alc_process_coef_fw(codec, coef0225);
> -		alc_hp_enable_unmute(codec, 75);
> -		break;
> -	case 0x10ec0255:
> -		alc_process_coef_fw(codec, coef0255);
> -		break;
> -	case 0x10ec0230:
> -	case 0x10ec0236:
> -	case 0x10ec0256:
> -	case 0x19e58326:
> -		alc_write_coef_idx(codec, 0x1b, 0x0e4b);
> -		alc_write_coef_idx(codec, 0x45, 0xc089);
> -		msleep(50);
> -		alc_process_coef_fw(codec, coef0256);
> -		alc_hp_enable_unmute(codec, 75);
> -		break;
> -	case 0x10ec0234:
> -	case 0x10ec0274:
> -	case 0x10ec0294:
> -		alc_process_coef_fw(codec, coef0274);
> -		break;
> -	case 0x10ec0233:
> -	case 0x10ec0283:
> -		alc_process_coef_fw(codec, coef0233);
> -		break;
> -	case 0x10ec0286:
> -	case 0x10ec0288:
> -	case 0x10ec0298:
> -		alc_process_coef_fw(codec, coef0288);
> -		break;
> -	case 0x10ec0292:
> -		alc_process_coef_fw(codec, coef0292);
> -		break;
> -	case 0x10ec0293:
> -		alc_process_coef_fw(codec, coef0293);
> -		break;
> -	case 0x10ec0668:
> -		alc_process_coef_fw(codec, coef0688);
> -		break;
> -	case 0x10ec0867:
> -		alc_update_coefex_idx(codec, 0x57, 0x5, 1<<14, 0);
> -		break;
> -	}
> -	codec_dbg(codec, "Headset jack set to headphone (default) mode.\n");
> -}
> -
> -/* Iphone type */
> -static void alc_headset_mode_ctia(struct hda_codec *codec)
> -{
> -	int val;
> -
> -	static const struct coef_fw coef0255[] = {
> -		WRITE_COEF(0x45, 0xd489), /* Set to CTIA type */
> -		WRITE_COEF(0x1b, 0x0c2b),
> -		WRITE_COEFEX(0x57, 0x03, 0x8ea6),
> -		{}
> -	};
> -	static const struct coef_fw coef0256[] = {
> -		WRITE_COEF(0x45, 0xd489), /* Set to CTIA type */
> -		WRITE_COEF(0x1b, 0x0e6b),
> -		{}
> -	};
> -	static const struct coef_fw coef0233[] = {
> -		WRITE_COEF(0x45, 0xd429),
> -		WRITE_COEF(0x1b, 0x0c2b),
> -		WRITE_COEF(0x32, 0x4ea3),
> -		{}
> -	};
> -	static const struct coef_fw coef0288[] = {
> -		UPDATE_COEF(0x50, 0x2000, 0x2000),
> -		UPDATE_COEF(0x56, 0x0006, 0x0006),
> -		UPDATE_COEF(0x66, 0x0008, 0),
> -		UPDATE_COEF(0x67, 0x2000, 0),
> -		{}
> -	};
> -	static const struct coef_fw coef0292[] = {
> -		WRITE_COEF(0x6b, 0xd429),
> -		WRITE_COEF(0x76, 0x0008),
> -		WRITE_COEF(0x18, 0x7388),
> -		{}
> -	};
> -	static const struct coef_fw coef0293[] = {
> -		WRITE_COEF(0x45, 0xd429), /* Set to ctia type */
> -		UPDATE_COEF(0x10, 7<<8, 7<<8), /* SET Line1 JD to 1 */
> -		{}
> -	};
> -	static const struct coef_fw coef0688[] = {
> -		WRITE_COEF(0x11, 0x0001),
> -		WRITE_COEF(0x15, 0x0d60),
> -		WRITE_COEF(0xc3, 0x0000),
> -		{}
> -	};
> -	static const struct coef_fw coef0225_1[] = {
> -		UPDATE_COEF(0x45, 0x3f<<10, 0x35<<10),
> -		UPDATE_COEF(0x63, 3<<14, 2<<14),
> -		{}
> -	};
> -	static const struct coef_fw coef0225_2[] = {
> -		UPDATE_COEF(0x45, 0x3f<<10, 0x35<<10),
> -		UPDATE_COEF(0x63, 3<<14, 1<<14),
> -		{}
> -	};
> -
> -	switch (codec->core.vendor_id) {
> -	case 0x10ec0255:
> -		alc_process_coef_fw(codec, coef0255);
> -		break;
> -	case 0x10ec0230:
> -	case 0x10ec0236:
> -	case 0x10ec0256:
> -	case 0x19e58326:
> -		alc_process_coef_fw(codec, coef0256);
> -		alc_hp_enable_unmute(codec, 75);
> -		break;
> -	case 0x10ec0234:
> -	case 0x10ec0274:
> -	case 0x10ec0294:
> -		alc_write_coef_idx(codec, 0x45, 0xd689);
> -		break;
> -	case 0x10ec0233:
> -	case 0x10ec0283:
> -		alc_process_coef_fw(codec, coef0233);
> -		break;
> -	case 0x10ec0298:
> -		val = alc_read_coef_idx(codec, 0x50);
> -		if (val & (1 << 12)) {
> -			alc_update_coef_idx(codec, 0x8e, 0x0070, 0x0020);
> -			alc_update_coef_idx(codec, 0x4f, 0xfcc0, 0xd400);
> -			msleep(300);
> -		} else {
> -			alc_update_coef_idx(codec, 0x8e, 0x0070, 0x0010);
> -			alc_update_coef_idx(codec, 0x4f, 0xfcc0, 0xd400);
> -			msleep(300);
> -		}
> -		break;
> -	case 0x10ec0286:
> -	case 0x10ec0288:
> -		alc_update_coef_idx(codec, 0x4f, 0xfcc0, 0xd400);
> -		msleep(300);
> -		alc_process_coef_fw(codec, coef0288);
> -		break;
> -	case 0x10ec0292:
> -		alc_process_coef_fw(codec, coef0292);
> -		break;
> -	case 0x10ec0293:
> -		alc_process_coef_fw(codec, coef0293);
> -		break;
> -	case 0x10ec0668:
> -		alc_process_coef_fw(codec, coef0688);
> -		break;
> -	case 0x10ec0215:
> -	case 0x10ec0225:
> -	case 0x10ec0285:
> -	case 0x10ec0295:
> -	case 0x10ec0289:
> -	case 0x10ec0299:
> -		val = alc_read_coef_idx(codec, 0x45);
> -		if (val & (1 << 9))
> -			alc_process_coef_fw(codec, coef0225_2);
> -		else
> -			alc_process_coef_fw(codec, coef0225_1);
> -		alc_hp_enable_unmute(codec, 75);
> -		break;
> -	case 0x10ec0867:
> -		alc_update_coefex_idx(codec, 0x57, 0x5, 1<<14, 0);
> -		break;
> -	}
> -	codec_dbg(codec, "Headset jack set to iPhone-style headset mode.\n");
> -}
> -
> -/* Nokia type */
> -static void alc_headset_mode_omtp(struct hda_codec *codec)
> -{
> -	static const struct coef_fw coef0255[] = {
> -		WRITE_COEF(0x45, 0xe489), /* Set to OMTP Type */
> -		WRITE_COEF(0x1b, 0x0c2b),
> -		WRITE_COEFEX(0x57, 0x03, 0x8ea6),
> -		{}
> -	};
> -	static const struct coef_fw coef0256[] = {
> -		WRITE_COEF(0x45, 0xe489), /* Set to OMTP Type */
> -		WRITE_COEF(0x1b, 0x0e6b),
> -		{}
> -	};
> -	static const struct coef_fw coef0233[] = {
> -		WRITE_COEF(0x45, 0xe429),
> -		WRITE_COEF(0x1b, 0x0c2b),
> -		WRITE_COEF(0x32, 0x4ea3),
> -		{}
> -	};
> -	static const struct coef_fw coef0288[] = {
> -		UPDATE_COEF(0x50, 0x2000, 0x2000),
> -		UPDATE_COEF(0x56, 0x0006, 0x0006),
> -		UPDATE_COEF(0x66, 0x0008, 0),
> -		UPDATE_COEF(0x67, 0x2000, 0),
> -		{}
> -	};
> -	static const struct coef_fw coef0292[] = {
> -		WRITE_COEF(0x6b, 0xe429),
> -		WRITE_COEF(0x76, 0x0008),
> -		WRITE_COEF(0x18, 0x7388),
> -		{}
> -	};
> -	static const struct coef_fw coef0293[] = {
> -		WRITE_COEF(0x45, 0xe429), /* Set to omtp type */
> -		UPDATE_COEF(0x10, 7<<8, 7<<8), /* SET Line1 JD to 1 */
> -		{}
> -	};
> -	static const struct coef_fw coef0688[] = {
> -		WRITE_COEF(0x11, 0x0001),
> -		WRITE_COEF(0x15, 0x0d50),
> -		WRITE_COEF(0xc3, 0x0000),
> -		{}
> -	};
> -	static const struct coef_fw coef0225[] = {
> -		UPDATE_COEF(0x45, 0x3f<<10, 0x39<<10),
> -		UPDATE_COEF(0x63, 3<<14, 2<<14),
> -		{}
> -	};
> -
> -	switch (codec->core.vendor_id) {
> -	case 0x10ec0255:
> -		alc_process_coef_fw(codec, coef0255);
> -		break;
> -	case 0x10ec0230:
> -	case 0x10ec0236:
> -	case 0x10ec0256:
> -	case 0x19e58326:
> -		alc_process_coef_fw(codec, coef0256);
> -		alc_hp_enable_unmute(codec, 75);
> -		break;
> -	case 0x10ec0234:
> -	case 0x10ec0274:
> -	case 0x10ec0294:
> -		alc_write_coef_idx(codec, 0x45, 0xe689);
> -		break;
> -	case 0x10ec0233:
> -	case 0x10ec0283:
> -		alc_process_coef_fw(codec, coef0233);
> -		break;
> -	case 0x10ec0298:
> -		alc_update_coef_idx(codec, 0x8e, 0x0070, 0x0010);/* Headset output enable */
> -		alc_update_coef_idx(codec, 0x4f, 0xfcc0, 0xe400);
> -		msleep(300);
> -		break;
> -	case 0x10ec0286:
> -	case 0x10ec0288:
> -		alc_update_coef_idx(codec, 0x4f, 0xfcc0, 0xe400);
> -		msleep(300);
> -		alc_process_coef_fw(codec, coef0288);
> -		break;
> -	case 0x10ec0292:
> -		alc_process_coef_fw(codec, coef0292);
> -		break;
> -	case 0x10ec0293:
> -		alc_process_coef_fw(codec, coef0293);
> -		break;
> -	case 0x10ec0668:
> -		alc_process_coef_fw(codec, coef0688);
> -		break;
> -	case 0x10ec0215:
> -	case 0x10ec0225:
> -	case 0x10ec0285:
> -	case 0x10ec0295:
> -	case 0x10ec0289:
> -	case 0x10ec0299:
> -		alc_process_coef_fw(codec, coef0225);
> -		alc_hp_enable_unmute(codec, 75);
> -		break;
> -	}
> -	codec_dbg(codec, "Headset jack set to Nokia-style headset mode.\n");
> -}
> -
> -static void alc_determine_headset_type(struct hda_codec *codec)
> -{
> -	int val;
> -	bool is_ctia = false;
> -	struct alc_spec *spec = codec->spec;
> -	static const struct coef_fw coef0255[] = {
> -		WRITE_COEF(0x45, 0xd089), /* combo jack auto switch control(Check type)*/
> -		WRITE_COEF(0x49, 0x0149), /* combo jack auto switch control(Vref
> - conteol) */
> -		{}
> -	};
> -	static const struct coef_fw coef0288[] = {
> -		UPDATE_COEF(0x4f, 0xfcc0, 0xd400), /* Check Type */
> -		{}
> -	};
> -	static const struct coef_fw coef0298[] = {
> -		UPDATE_COEF(0x50, 0x2000, 0x2000),
> -		UPDATE_COEF(0x56, 0x0006, 0x0006),
> -		UPDATE_COEF(0x66, 0x0008, 0),
> -		UPDATE_COEF(0x67, 0x2000, 0),
> -		UPDATE_COEF(0x19, 0x1300, 0x1300),
> -		{}
> -	};
> -	static const struct coef_fw coef0293[] = {
> -		UPDATE_COEF(0x4a, 0x000f, 0x0008), /* Combo Jack auto detect */
> -		WRITE_COEF(0x45, 0xD429), /* Set to ctia type */
> -		{}
> -	};
> -	static const struct coef_fw coef0688[] = {
> -		WRITE_COEF(0x11, 0x0001),
> -		WRITE_COEF(0xb7, 0x802b),
> -		WRITE_COEF(0x15, 0x0d60),
> -		WRITE_COEF(0xc3, 0x0c00),
> -		{}
> -	};
> -	static const struct coef_fw coef0274[] = {
> -		UPDATE_COEF(0x4a, 0x0010, 0),
> -		UPDATE_COEF(0x4a, 0x8000, 0),
> -		WRITE_COEF(0x45, 0xd289),
> -		UPDATE_COEF(0x49, 0x0300, 0x0300),
> -		{}
> -	};
> -
> -	if (spec->no_internal_mic_pin) {
> -		alc_update_coef_idx(codec, 0x45, 0xf<<12 | 1<<10, 5<<12);
> -		return;
> -	}
> -
> -	switch (codec->core.vendor_id) {
> -	case 0x10ec0255:
> -		alc_process_coef_fw(codec, coef0255);
> -		msleep(300);
> -		val = alc_read_coef_idx(codec, 0x46);
> -		is_ctia = (val & 0x0070) == 0x0070;
> -		break;
> -	case 0x10ec0230:
> -	case 0x10ec0236:
> -	case 0x10ec0256:
> -	case 0x19e58326:
> -		alc_write_coef_idx(codec, 0x1b, 0x0e4b);
> -		alc_write_coef_idx(codec, 0x06, 0x6104);
> -		alc_write_coefex_idx(codec, 0x57, 0x3, 0x09a3);
> -
> -		alc_process_coef_fw(codec, coef0255);
> -		msleep(300);
> -		val = alc_read_coef_idx(codec, 0x46);
> -		is_ctia = (val & 0x0070) == 0x0070;
> -		if (!is_ctia) {
> -			alc_write_coef_idx(codec, 0x45, 0xe089);
> -			msleep(100);
> -			val = alc_read_coef_idx(codec, 0x46);
> -			if ((val & 0x0070) == 0x0070)
> -				is_ctia = false;
> -			else
> -				is_ctia = true;
> -		}
> -		alc_write_coefex_idx(codec, 0x57, 0x3, 0x0da3);
> -		alc_update_coefex_idx(codec, 0x57, 0x5, 1<<14, 0);
> -		break;
> -	case 0x10ec0234:
> -	case 0x10ec0274:
> -	case 0x10ec0294:
> -		alc_process_coef_fw(codec, coef0274);
> -		msleep(850);
> -		val = alc_read_coef_idx(codec, 0x46);
> -		is_ctia = (val & 0x00f0) == 0x00f0;
> -		break;
> -	case 0x10ec0233:
> -	case 0x10ec0283:
> -		alc_write_coef_idx(codec, 0x45, 0xd029);
> -		msleep(300);
> -		val = alc_read_coef_idx(codec, 0x46);
> -		is_ctia = (val & 0x0070) == 0x0070;
> -		break;
> -	case 0x10ec0298:
> -		snd_hda_codec_write(codec, 0x21, 0,
> -			    AC_VERB_SET_AMP_GAIN_MUTE, AMP_OUT_MUTE);
> -		msleep(100);
> -		snd_hda_codec_write(codec, 0x21, 0,
> -			    AC_VERB_SET_PIN_WIDGET_CONTROL, 0x0);
> -		msleep(200);
> -
> -		val = alc_read_coef_idx(codec, 0x50);
> -		if (val & (1 << 12)) {
> -			alc_update_coef_idx(codec, 0x8e, 0x0070, 0x0020);
> -			alc_process_coef_fw(codec, coef0288);
> -			msleep(350);
> -			val = alc_read_coef_idx(codec, 0x50);
> -			is_ctia = (val & 0x0070) == 0x0070;
> -		} else {
> -			alc_update_coef_idx(codec, 0x8e, 0x0070, 0x0010);
> -			alc_process_coef_fw(codec, coef0288);
> -			msleep(350);
> -			val = alc_read_coef_idx(codec, 0x50);
> -			is_ctia = (val & 0x0070) == 0x0070;
> -		}
> -		alc_process_coef_fw(codec, coef0298);
> -		snd_hda_codec_write(codec, 0x21, 0,
> -			    AC_VERB_SET_PIN_WIDGET_CONTROL, PIN_HP);
> -		msleep(75);
> -		snd_hda_codec_write(codec, 0x21, 0,
> -			    AC_VERB_SET_AMP_GAIN_MUTE, AMP_OUT_UNMUTE);
> -		break;
> -	case 0x10ec0286:
> -	case 0x10ec0288:
> -		alc_process_coef_fw(codec, coef0288);
> -		msleep(350);
> -		val = alc_read_coef_idx(codec, 0x50);
> -		is_ctia = (val & 0x0070) == 0x0070;
> -		break;
> -	case 0x10ec0292:
> -		alc_write_coef_idx(codec, 0x6b, 0xd429);
> -		msleep(300);
> -		val = alc_read_coef_idx(codec, 0x6c);
> -		is_ctia = (val & 0x001c) == 0x001c;
> -		break;
> -	case 0x10ec0293:
> -		alc_process_coef_fw(codec, coef0293);
> -		msleep(300);
> -		val = alc_read_coef_idx(codec, 0x46);
> -		is_ctia = (val & 0x0070) == 0x0070;
> -		break;
> -	case 0x10ec0668:
> -		alc_process_coef_fw(codec, coef0688);
> -		msleep(300);
> -		val = alc_read_coef_idx(codec, 0xbe);
> -		is_ctia = (val & 0x1c02) == 0x1c02;
> -		break;
> -	case 0x10ec0215:
> -	case 0x10ec0225:
> -	case 0x10ec0285:
> -	case 0x10ec0295:
> -	case 0x10ec0289:
> -	case 0x10ec0299:
> -		alc_process_coef_fw(codec, alc225_pre_hsmode);
> -		alc_update_coef_idx(codec, 0x67, 0xf000, 0x1000);
> -		val = alc_read_coef_idx(codec, 0x45);
> -		if (val & (1 << 9)) {
> -			alc_update_coef_idx(codec, 0x45, 0x3f<<10, 0x34<<10);
> -			alc_update_coef_idx(codec, 0x49, 3<<8, 2<<8);
> -			msleep(800);
> -			val = alc_read_coef_idx(codec, 0x46);
> -			is_ctia = (val & 0x00f0) == 0x00f0;
> -		} else {
> -			alc_update_coef_idx(codec, 0x45, 0x3f<<10, 0x34<<10);
> -			alc_update_coef_idx(codec, 0x49, 3<<8, 1<<8);
> -			msleep(800);
> -			val = alc_read_coef_idx(codec, 0x46);
> -			is_ctia = (val & 0x00f0) == 0x00f0;
> -		}
> -		if (!is_ctia) {
> -			alc_update_coef_idx(codec, 0x45, 0x3f<<10, 0x38<<10);
> -			alc_update_coef_idx(codec, 0x49, 3<<8, 1<<8);
> -			msleep(100);
> -			val = alc_read_coef_idx(codec, 0x46);
> -			if ((val & 0x00f0) == 0x00f0)
> -				is_ctia = false;
> -			else
> -				is_ctia = true;
> -		}
> -		alc_update_coef_idx(codec, 0x4a, 7<<6, 7<<6);
> -		alc_update_coef_idx(codec, 0x4a, 3<<4, 3<<4);
> -		alc_update_coef_idx(codec, 0x67, 0xf000, 0x3000);
> -		break;
> -	case 0x10ec0867:
> -		is_ctia = true;
> -		break;
> -	}
> -
> -	codec_dbg(codec, "Headset jack detected iPhone-style headset: %s\n",
> -		  str_yes_no(is_ctia));
> -	spec->current_headset_type = is_ctia ? ALC_HEADSET_TYPE_CTIA : ALC_HEADSET_TYPE_OMTP;
> -}
> -
> -static void alc_update_headset_mode(struct hda_codec *codec)
> -{
> -	struct alc_spec *spec = codec->spec;
> -
> -	hda_nid_t mux_pin = spec->gen.imux_pins[spec->gen.cur_mux[0]];
> -	hda_nid_t hp_pin = alc_get_hp_pin(spec);
> -
> -	int new_headset_mode;
> -
> -	if (!snd_hda_jack_detect(codec, hp_pin))
> -		new_headset_mode = ALC_HEADSET_MODE_UNPLUGGED;
> -	else if (mux_pin == spec->headset_mic_pin)
> -		new_headset_mode = ALC_HEADSET_MODE_HEADSET;
> -	else if (mux_pin == spec->headphone_mic_pin)
> -		new_headset_mode = ALC_HEADSET_MODE_MIC;
> -	else
> -		new_headset_mode = ALC_HEADSET_MODE_HEADPHONE;
> -
> -	if (new_headset_mode == spec->current_headset_mode) {
> -		snd_hda_gen_update_outputs(codec);
> -		return;
> -	}
> -
> -	switch (new_headset_mode) {
> -	case ALC_HEADSET_MODE_UNPLUGGED:
> -		alc_headset_mode_unplugged(codec);
> -		spec->current_headset_mode = ALC_HEADSET_MODE_UNKNOWN;
> -		spec->current_headset_type = ALC_HEADSET_TYPE_UNKNOWN;
> -		spec->gen.hp_jack_present = false;
> -		break;
> -	case ALC_HEADSET_MODE_HEADSET:
> -		if (spec->current_headset_type == ALC_HEADSET_TYPE_UNKNOWN)
> -			alc_determine_headset_type(codec);
> -		if (spec->current_headset_type == ALC_HEADSET_TYPE_CTIA)
> -			alc_headset_mode_ctia(codec);
> -		else if (spec->current_headset_type == ALC_HEADSET_TYPE_OMTP)
> -			alc_headset_mode_omtp(codec);
> -		spec->gen.hp_jack_present = true;
> -		break;
> -	case ALC_HEADSET_MODE_MIC:
> -		alc_headset_mode_mic_in(codec, hp_pin, spec->headphone_mic_pin);
> -		spec->gen.hp_jack_present = false;
> -		break;
> -	case ALC_HEADSET_MODE_HEADPHONE:
> -		alc_headset_mode_default(codec);
> -		spec->gen.hp_jack_present = true;
> -		break;
> -	}
> -	if (new_headset_mode != ALC_HEADSET_MODE_MIC) {
> -		snd_hda_set_pin_ctl_cache(codec, hp_pin,
> -					  AC_PINCTL_OUT_EN | AC_PINCTL_HP_EN);
> -		if (spec->headphone_mic_pin && spec->headphone_mic_pin != hp_pin)
> -			snd_hda_set_pin_ctl_cache(codec, spec->headphone_mic_pin,
> -						  PIN_VREFHIZ);
> -	}
> -	spec->current_headset_mode = new_headset_mode;
> -
> -	snd_hda_gen_update_outputs(codec);
> -}
> -
> -static void alc_update_headset_mode_hook(struct hda_codec *codec,
> -					 struct snd_kcontrol *kcontrol,
> -					 struct snd_ctl_elem_value *ucontrol)
> -{
> -	alc_update_headset_mode(codec);
> -}
> -
> -static void alc_update_headset_jack_cb(struct hda_codec *codec,
> -				       struct hda_jack_callback *jack)
> -{
> -	snd_hda_gen_hp_automute(codec, jack);
> -	alc_update_headset_mode(codec);
> -}
> -
> -static void alc_probe_headset_mode(struct hda_codec *codec)
> -{
> -	int i;
> -	struct alc_spec *spec = codec->spec;
> -	struct auto_pin_cfg *cfg = &spec->gen.autocfg;
> -
> -	/* Find mic pins */
> -	for (i = 0; i < cfg->num_inputs; i++) {
> -		if (cfg->inputs[i].is_headset_mic && !spec->headset_mic_pin)
> -			spec->headset_mic_pin = cfg->inputs[i].pin;
> -		if (cfg->inputs[i].is_headphone_mic && !spec->headphone_mic_pin)
> -			spec->headphone_mic_pin = cfg->inputs[i].pin;
> -	}
> -
> -	WARN_ON(spec->gen.cap_sync_hook);
> -	spec->gen.cap_sync_hook = alc_update_headset_mode_hook;
> -	spec->gen.automute_hook = alc_update_headset_mode;
> -	spec->gen.hp_automute_hook = alc_update_headset_jack_cb;
> -}
> -
> -static void alc_fixup_headset_mode(struct hda_codec *codec,
> -				const struct hda_fixup *fix, int action)
> -{
> -	struct alc_spec *spec = codec->spec;
> -
> -	switch (action) {
> -	case HDA_FIXUP_ACT_PRE_PROBE:
> -		spec->parse_flags |= HDA_PINCFG_HEADSET_MIC | HDA_PINCFG_HEADPHONE_MIC;
> -		break;
> -	case HDA_FIXUP_ACT_PROBE:
> -		alc_probe_headset_mode(codec);
> -		break;
> -	case HDA_FIXUP_ACT_INIT:
> -		if (is_s3_resume(codec) || is_s4_resume(codec)) {
> -			spec->current_headset_mode = ALC_HEADSET_MODE_UNKNOWN;
> -			spec->current_headset_type = ALC_HEADSET_TYPE_UNKNOWN;
> -		}
> -		alc_update_headset_mode(codec);
> -		break;
> -	}
> -}
> -
> -static void alc_fixup_headset_mode_no_hp_mic(struct hda_codec *codec,
> -				const struct hda_fixup *fix, int action)
> -{
> -	if (action == HDA_FIXUP_ACT_PRE_PROBE) {
> -		struct alc_spec *spec = codec->spec;
> -		spec->parse_flags |= HDA_PINCFG_HEADSET_MIC;
> -	}
> -	else
> -		alc_fixup_headset_mode(codec, fix, action);
> -}
> -
>   static void alc255_set_default_jack_type(struct hda_codec *codec)
>   {
>   	/* Set to iphone type */
> @@ -6223,15 +2035,6 @@ static void alc_fixup_headset_mode_dell_alc288(struct hda_codec *codec,
>   	}
>   }
>   
> -static void alc_fixup_auto_mute_via_amp(struct hda_codec *codec,
> -					const struct hda_fixup *fix, int action)
> -{
> -	if (action == HDA_FIXUP_ACT_PRE_PROBE) {
> -		struct alc_spec *spec = codec->spec;
> -		spec->gen.auto_mute_via_amp = 1;
> -	}
> -}
> -
>   static void alc_fixup_no_shutup(struct hda_codec *codec,
>   				const struct hda_fixup *fix, int action)
>   {
> @@ -6241,16 +2044,6 @@ static void alc_fixup_no_shutup(struct hda_codec *codec,
>   	}
>   }
>   
> -static void alc_fixup_disable_aamix(struct hda_codec *codec,
> -				    const struct hda_fixup *fix, int action)
> -{
> -	if (action == HDA_FIXUP_ACT_PRE_PROBE) {
> -		struct alc_spec *spec = codec->spec;
> -		/* Disable AA-loopback as it causes white noise */
> -		spec->gen.mixer_nid = 0;
> -	}
> -}
> -
>   /* fixup for Thinkpad docks: add dock pins, avoid HP parser fixup */
>   static void alc_fixup_tpt440_dock(struct hda_codec *codec,
>   				  const struct hda_fixup *fix, int action)
> @@ -6321,94 +2114,6 @@ static void alc295_fixup_asus_dacs(struct hda_codec *codec,
>   		spec->gen.preferred_dacs = preferred_pairs;
>   }
>   
> -static void alc_shutup_dell_xps13(struct hda_codec *codec)
> -{
> -	struct alc_spec *spec = codec->spec;
> -	int hp_pin = alc_get_hp_pin(spec);
> -
> -	/* Prevent pop noises when headphones are plugged in */
> -	snd_hda_codec_write(codec, hp_pin, 0,
> -			    AC_VERB_SET_AMP_GAIN_MUTE, AMP_OUT_MUTE);
> -	msleep(20);
> -}
> -
> -static void alc_fixup_dell_xps13(struct hda_codec *codec,
> -				const struct hda_fixup *fix, int action)
> -{
> -	struct alc_spec *spec = codec->spec;
> -	struct hda_input_mux *imux = &spec->gen.input_mux;
> -	int i;
> -
> -	switch (action) {
> -	case HDA_FIXUP_ACT_PRE_PROBE:
> -		/* mic pin 0x19 must be initialized with Vref Hi-Z, otherwise
> -		 * it causes a click noise at start up
> -		 */
> -		snd_hda_codec_set_pin_target(codec, 0x19, PIN_VREFHIZ);
> -		spec->shutup = alc_shutup_dell_xps13;
> -		break;
> -	case HDA_FIXUP_ACT_PROBE:
> -		/* Make the internal mic the default input source. */
> -		for (i = 0; i < imux->num_items; i++) {
> -			if (spec->gen.imux_pins[i] == 0x12) {
> -				spec->gen.cur_mux[0] = i;
> -				break;
> -			}
> -		}
> -		break;
> -	}
> -}
> -
> -static void alc_fixup_headset_mode_alc662(struct hda_codec *codec,
> -				const struct hda_fixup *fix, int action)
> -{
> -	struct alc_spec *spec = codec->spec;
> -
> -	if (action == HDA_FIXUP_ACT_PRE_PROBE) {
> -		spec->parse_flags |= HDA_PINCFG_HEADSET_MIC;
> -		spec->gen.hp_mic = 1; /* Mic-in is same pin as headphone */
> -
> -		/* Disable boost for mic-in permanently. (This code is only called
> -		   from quirks that guarantee that the headphone is at NID 0x1b.) */
> -		snd_hda_codec_write(codec, 0x1b, 0, AC_VERB_SET_AMP_GAIN_MUTE, 0x7000);
> -		snd_hda_override_wcaps(codec, 0x1b, get_wcaps(codec, 0x1b) & ~AC_WCAP_IN_AMP);
> -	} else
> -		alc_fixup_headset_mode(codec, fix, action);
> -}
> -
> -static void alc_fixup_headset_mode_alc668(struct hda_codec *codec,
> -				const struct hda_fixup *fix, int action)
> -{
> -	if (action == HDA_FIXUP_ACT_PRE_PROBE) {
> -		alc_write_coef_idx(codec, 0xc4, 0x8000);
> -		alc_update_coef_idx(codec, 0xc2, ~0xfe, 0);
> -		snd_hda_set_pin_ctl_cache(codec, 0x18, 0);
> -	}
> -	alc_fixup_headset_mode(codec, fix, action);
> -}
> -
> -/* Returns the nid of the external mic input pin, or 0 if it cannot be found. */
> -static int find_ext_mic_pin(struct hda_codec *codec)
> -{
> -	struct alc_spec *spec = codec->spec;
> -	struct auto_pin_cfg *cfg = &spec->gen.autocfg;
> -	hda_nid_t nid;
> -	unsigned int defcfg;
> -	int i;
> -
> -	for (i = 0; i < cfg->num_inputs; i++) {
> -		if (cfg->inputs[i].type != AUTO_PIN_MIC)
> -			continue;
> -		nid = cfg->inputs[i].pin;
> -		defcfg = snd_hda_codec_get_pincfg(codec, nid);
> -		if (snd_hda_get_input_pin_attr(defcfg) == INPUT_PIN_ATTR_INT)
> -			continue;
> -		return nid;
> -	}
> -
> -	return 0;
> -}
> -
>   static void alc271_hp_gate_mic_jack(struct hda_codec *codec,
>   				    const struct hda_fixup *fix,
>   				    int action)
> @@ -6416,7 +2121,7 @@ static void alc271_hp_gate_mic_jack(struct hda_codec *codec,
>   	struct alc_spec *spec = codec->spec;
>   
>   	if (action == HDA_FIXUP_ACT_PROBE) {
> -		int mic_pin = find_ext_mic_pin(codec);
> +		int mic_pin = alc_find_ext_mic_pin(codec);
>   		int hp_pin = alc_get_hp_pin(spec);
>   
>   		if (snd_BUG_ON(!mic_pin || !hp_pin))
> @@ -6694,30 +2399,6 @@ static void alc285_fixup_thinkpad_x1_gen7(struct hda_codec *codec,
>   	}
>   }
>   
> -static void alc233_alc662_fixup_lenovo_dual_codecs(struct hda_codec *codec,
> -					 const struct hda_fixup *fix,
> -					 int action)
> -{
> -	alc_fixup_dual_codecs(codec, fix, action);
> -	switch (action) {
> -	case HDA_FIXUP_ACT_PRE_PROBE:
> -		/* override card longname to provide a unique UCM profile */
> -		strcpy(codec->card->longname, "HDAudio-Lenovo-DualCodecs");
> -		break;
> -	case HDA_FIXUP_ACT_BUILD:
> -		/* rename Capture controls depending on the codec */
> -		rename_ctl(codec, "Capture Volume",
> -			   codec->addr == 0 ?
> -			   "Rear-Panel Capture Volume" :
> -			   "Front-Panel Capture Volume");
> -		rename_ctl(codec, "Capture Switch",
> -			   codec->addr == 0 ?
> -			   "Rear-Panel Capture Switch" :
> -			   "Front-Panel Capture Switch");
> -		break;
> -	}
> -}
> -
>   static void alc225_fixup_s3_pop_noise(struct hda_codec *codec,
>   				      const struct hda_fixup *fix, int action)
>   {
> @@ -7120,7 +2801,7 @@ static void alc285_fixup_hp_beep(struct hda_codec *codec,
>   }
>   
>   /* for hda_fixup_thinkpad_acpi() */
> -#include "helpers/thinkpad.c"
> +#include "../helpers/thinkpad.c"
>   
>   static void alc_fixup_thinkpad_acpi(struct hda_codec *codec,
>   				    const struct hda_fixup *fix, int action)
> @@ -7130,7 +2811,7 @@ static void alc_fixup_thinkpad_acpi(struct hda_codec *codec,
>   }
>   
>   /* for hda_fixup_ideapad_acpi() */
> -#include "helpers/ideapad_hotkey_led.c"
> +#include "../helpers/ideapad_hotkey_led.c"
>   
>   static void alc_fixup_ideapad_acpi(struct hda_codec *codec,
>   				   const struct hda_fixup *fix, int action)
> @@ -7362,10 +3043,10 @@ static void alc256_fixup_acer_sfg16_micmute_led(struct hda_codec *codec,
>   
>   
>   /* for alc295_fixup_hp_top_speakers */
> -#include "helpers/hp_x360.c"
> +#include "../helpers/hp_x360.c"
>   
>   /* for alc285_fixup_ideapad_s740_coef() */
> -#include "helpers/ideapad_s740.c"
> +#include "../helpers/ideapad_s740.c"
>   
>   static const struct coef_fw alc256_fixup_set_coef_defaults_coefs[] = {
>   	WRITE_COEF(0x10, 0x0020), WRITE_COEF(0x24, 0x0000),
> @@ -7567,9 +3248,10 @@ static void alc287_fixup_bind_dacs(struct hda_codec *codec,
>   					0x0); /* Make sure 0x14 was disable */
>   	}
>   }
> +
>   /* Fix none verb table of Headset Mic pin */
> -static void alc_fixup_headset_mic(struct hda_codec *codec,
> -				   const struct hda_fixup *fix, int action)
> +static void alc2xx_fixup_headset_mic(struct hda_codec *codec,
> +				     const struct hda_fixup *fix, int action)
>   {
>   	struct alc_spec *spec = codec->spec;
>   	static const struct hda_pintbl pincfgs[] = {
> @@ -8164,7 +3846,7 @@ static const struct hda_fixup alc269_fixups[] = {
>   	},
>   	[ALC269_FIXUP_HEADSET_MIC] = {
>   		.type = HDA_FIXUP_FUNC,
> -		.v.func = alc269_fixup_headset_mic,
> +		.v.func = alc_fixup_headset_mic,
>   	},
>   	[ALC269_FIXUP_QUANTA_MUTE] = {
>   		.type = HDA_FIXUP_FUNC,
> @@ -10324,7 +6006,7 @@ static const struct hda_fixup alc269_fixups[] = {
>   	},
>   	[ALC2XX_FIXUP_HEADSET_MIC] = {
>   		.type = HDA_FIXUP_FUNC,
> -		.v.func = alc_fixup_headset_mic,
> +		.v.func = alc2xx_fixup_headset_mic,
>   	},
>   	[ALC289_FIXUP_DELL_CS35L41_SPI_2] = {
>   		.type = HDA_FIXUP_FUNC,
> @@ -12159,6 +7841,16 @@ static void alc269_fill_coef(struct hda_codec *codec)
>   	alc_update_coef_idx(codec, 0x4, 0, 1<<11);
>   }
>   
> +static void alc269_free(struct hda_codec *codec)
> +{
> +	struct alc_spec *spec = codec->spec;
> +
> +	if (spec)
> +		hda_component_manager_free(&spec->comps, &comp_master_ops);
> +
> +	alc_free(codec);
> +}
> +
>   /*
>    */
>   static int patch_alc269(struct hda_codec *codec)
> @@ -12177,6 +7869,7 @@ static int patch_alc269(struct hda_codec *codec)
>   
>   	codec->patch_ops.suspend = alc269_suspend;
>   	codec->patch_ops.resume = alc269_resume;
> +	codec->patch_ops.free = alc269_free;
>   	spec->shutup = alc_default_shutup;
>   	spec->init_hook = alc_default_init;
>   
> @@ -12379,1327 +8072,9 @@ static int patch_alc269(struct hda_codec *codec)
>   }
>   
>   /*
> - * ALC861
> + * driver entries
>    */
> -
> -static int alc861_parse_auto_config(struct hda_codec *codec)
> -{
> -	static const hda_nid_t alc861_ignore[] = { 0x1d, 0 };
> -	static const hda_nid_t alc861_ssids[] = { 0x0e, 0x0f, 0x0b, 0 };
> -	return alc_parse_auto_config(codec, alc861_ignore, alc861_ssids);
> -}
> -
> -/* Pin config fixes */
> -enum {
> -	ALC861_FIXUP_FSC_AMILO_PI1505,
> -	ALC861_FIXUP_AMP_VREF_0F,
> -	ALC861_FIXUP_NO_JACK_DETECT,
> -	ALC861_FIXUP_ASUS_A6RP,
> -	ALC660_FIXUP_ASUS_W7J,
> -};
> -
> -/* On some laptops, VREF of pin 0x0f is abused for controlling the main amp */
> -static void alc861_fixup_asus_amp_vref_0f(struct hda_codec *codec,
> -			const struct hda_fixup *fix, int action)
> -{
> -	struct alc_spec *spec = codec->spec;
> -	unsigned int val;
> -
> -	if (action != HDA_FIXUP_ACT_INIT)
> -		return;
> -	val = snd_hda_codec_get_pin_target(codec, 0x0f);
> -	if (!(val & (AC_PINCTL_IN_EN | AC_PINCTL_OUT_EN)))
> -		val |= AC_PINCTL_IN_EN;
> -	val |= AC_PINCTL_VREF_50;
> -	snd_hda_set_pin_ctl(codec, 0x0f, val);
> -	spec->gen.keep_vref_in_automute = 1;
> -}
> -
> -/* suppress the jack-detection */
> -static void alc_fixup_no_jack_detect(struct hda_codec *codec,
> -				     const struct hda_fixup *fix, int action)
> -{
> -	if (action == HDA_FIXUP_ACT_PRE_PROBE)
> -		codec->no_jack_detect = 1;
> -}
> -
> -static const struct hda_fixup alc861_fixups[] = {
> -	[ALC861_FIXUP_FSC_AMILO_PI1505] = {
> -		.type = HDA_FIXUP_PINS,
> -		.v.pins = (const struct hda_pintbl[]) {
> -			{ 0x0b, 0x0221101f }, /* HP */
> -			{ 0x0f, 0x90170310 }, /* speaker */
> -			{ }
> -		}
> -	},
> -	[ALC861_FIXUP_AMP_VREF_0F] = {
> -		.type = HDA_FIXUP_FUNC,
> -		.v.func = alc861_fixup_asus_amp_vref_0f,
> -	},
> -	[ALC861_FIXUP_NO_JACK_DETECT] = {
> -		.type = HDA_FIXUP_FUNC,
> -		.v.func = alc_fixup_no_jack_detect,
> -	},
> -	[ALC861_FIXUP_ASUS_A6RP] = {
> -		.type = HDA_FIXUP_FUNC,
> -		.v.func = alc861_fixup_asus_amp_vref_0f,
> -		.chained = true,
> -		.chain_id = ALC861_FIXUP_NO_JACK_DETECT,
> -	},
> -	[ALC660_FIXUP_ASUS_W7J] = {
> -		.type = HDA_FIXUP_VERBS,
> -		.v.verbs = (const struct hda_verb[]) {
> -			/* ASUS W7J needs a magic pin setup on unused NID 0x10
> -			 * for enabling outputs
> -			 */
> -			{0x10, AC_VERB_SET_PIN_WIDGET_CONTROL, 0x24},
> -			{ }
> -		},
> -	}
> -};
> -
> -static const struct hda_quirk alc861_fixup_tbl[] = {
> -	SND_PCI_QUIRK(0x1043, 0x1253, "ASUS W7J", ALC660_FIXUP_ASUS_W7J),
> -	SND_PCI_QUIRK(0x1043, 0x1263, "ASUS Z35HL", ALC660_FIXUP_ASUS_W7J),
> -	SND_PCI_QUIRK(0x1043, 0x1393, "ASUS A6Rp", ALC861_FIXUP_ASUS_A6RP),
> -	SND_PCI_QUIRK_VENDOR(0x1043, "ASUS laptop", ALC861_FIXUP_AMP_VREF_0F),
> -	SND_PCI_QUIRK(0x1462, 0x7254, "HP DX2200", ALC861_FIXUP_NO_JACK_DETECT),
> -	SND_PCI_QUIRK_VENDOR(0x1584, "Haier/Uniwill", ALC861_FIXUP_AMP_VREF_0F),
> -	SND_PCI_QUIRK(0x1734, 0x10c7, "FSC Amilo Pi1505", ALC861_FIXUP_FSC_AMILO_PI1505),
> -	{}
> -};
> -
> -/*
> - */
> -static int patch_alc861(struct hda_codec *codec)
> -{
> -	struct alc_spec *spec;
> -	int err;
> -
> -	err = alc_alloc_spec(codec, 0x15);
> -	if (err < 0)
> -		return err;
> -
> -	spec = codec->spec;
> -	if (has_cdefine_beep(codec))
> -		spec->gen.beep_nid = 0x23;
> -
> -	spec->power_hook = alc_power_eapd;
> -
> -	alc_pre_init(codec);
> -
> -	snd_hda_pick_fixup(codec, NULL, alc861_fixup_tbl, alc861_fixups);
> -	snd_hda_apply_fixup(codec, HDA_FIXUP_ACT_PRE_PROBE);
> -
> -	/* automatic parse from the BIOS config */
> -	err = alc861_parse_auto_config(codec);
> -	if (err < 0)
> -		goto error;
> -
> -	if (!spec->gen.no_analog) {
> -		err = set_beep_amp(spec, 0x23, 0, HDA_OUTPUT);
> -		if (err < 0)
> -			goto error;
> -	}
> -
> -	snd_hda_apply_fixup(codec, HDA_FIXUP_ACT_PROBE);
> -
> -	return 0;
> -
> - error:
> -	alc_free(codec);
> -	return err;
> -}
> -
> -/*
> - * ALC861-VD support
> - *
> - * Based on ALC882
> - *
> - * In addition, an independent DAC
> - */
> -static int alc861vd_parse_auto_config(struct hda_codec *codec)
> -{
> -	static const hda_nid_t alc861vd_ignore[] = { 0x1d, 0 };
> -	static const hda_nid_t alc861vd_ssids[] = { 0x15, 0x1b, 0x14, 0 };
> -	return alc_parse_auto_config(codec, alc861vd_ignore, alc861vd_ssids);
> -}
> -
> -enum {
> -	ALC660VD_FIX_ASUS_GPIO1,
> -	ALC861VD_FIX_DALLAS,
> -};
> -
> -/* exclude VREF80 */
> -static void alc861vd_fixup_dallas(struct hda_codec *codec,
> -				  const struct hda_fixup *fix, int action)
> -{
> -	if (action == HDA_FIXUP_ACT_PRE_PROBE) {
> -		snd_hda_override_pin_caps(codec, 0x18, 0x00000734);
> -		snd_hda_override_pin_caps(codec, 0x19, 0x0000073c);
> -	}
> -}
> -
> -/* reset GPIO1 */
> -static void alc660vd_fixup_asus_gpio1(struct hda_codec *codec,
> -				      const struct hda_fixup *fix, int action)
> -{
> -	struct alc_spec *spec = codec->spec;
> -
> -	if (action == HDA_FIXUP_ACT_PRE_PROBE)
> -		spec->gpio_mask |= 0x02;
> -	alc_fixup_gpio(codec, action, 0x01);
> -}
> -
> -static const struct hda_fixup alc861vd_fixups[] = {
> -	[ALC660VD_FIX_ASUS_GPIO1] = {
> -		.type = HDA_FIXUP_FUNC,
> -		.v.func = alc660vd_fixup_asus_gpio1,
> -	},
> -	[ALC861VD_FIX_DALLAS] = {
> -		.type = HDA_FIXUP_FUNC,
> -		.v.func = alc861vd_fixup_dallas,
> -	},
> -};
> -
> -static const struct hda_quirk alc861vd_fixup_tbl[] = {
> -	SND_PCI_QUIRK(0x103c, 0x30bf, "HP TX1000", ALC861VD_FIX_DALLAS),
> -	SND_PCI_QUIRK(0x1043, 0x1339, "ASUS A7-K", ALC660VD_FIX_ASUS_GPIO1),
> -	SND_PCI_QUIRK(0x1179, 0xff31, "Toshiba L30-149", ALC861VD_FIX_DALLAS),
> -	{}
> -};
> -
> -/*
> - */
> -static int patch_alc861vd(struct hda_codec *codec)
> -{
> -	struct alc_spec *spec;
> -	int err;
> -
> -	err = alc_alloc_spec(codec, 0x0b);
> -	if (err < 0)
> -		return err;
> -
> -	spec = codec->spec;
> -	if (has_cdefine_beep(codec))
> -		spec->gen.beep_nid = 0x23;
> -
> -	spec->shutup = alc_eapd_shutup;
> -
> -	alc_pre_init(codec);
> -
> -	snd_hda_pick_fixup(codec, NULL, alc861vd_fixup_tbl, alc861vd_fixups);
> -	snd_hda_apply_fixup(codec, HDA_FIXUP_ACT_PRE_PROBE);
> -
> -	/* automatic parse from the BIOS config */
> -	err = alc861vd_parse_auto_config(codec);
> -	if (err < 0)
> -		goto error;
> -
> -	if (!spec->gen.no_analog) {
> -		err = set_beep_amp(spec, 0x0b, 0x05, HDA_INPUT);
> -		if (err < 0)
> -			goto error;
> -	}
> -
> -	snd_hda_apply_fixup(codec, HDA_FIXUP_ACT_PROBE);
> -
> -	return 0;
> -
> - error:
> -	alc_free(codec);
> -	return err;
> -}
> -
> -/*
> - * ALC662 support
> - *
> - * ALC662 is almost identical with ALC880 but has cleaner and more flexible
> - * configuration.  Each pin widget can choose any input DACs and a mixer.
> - * Each ADC is connected from a mixer of all inputs.  This makes possible
> - * 6-channel independent captures.
> - *
> - * In addition, an independent DAC for the multi-playback (not used in this
> - * driver yet).
> - */
> -
> -/*
> - * BIOS auto configuration
> - */
> -
> -static int alc662_parse_auto_config(struct hda_codec *codec)
> -{
> -	static const hda_nid_t alc662_ignore[] = { 0x1d, 0 };
> -	static const hda_nid_t alc663_ssids[] = { 0x15, 0x1b, 0x14, 0x21 };
> -	static const hda_nid_t alc662_ssids[] = { 0x15, 0x1b, 0x14, 0 };
> -	const hda_nid_t *ssids;
> -
> -	if (codec->core.vendor_id == 0x10ec0272 || codec->core.vendor_id == 0x10ec0663 ||
> -	    codec->core.vendor_id == 0x10ec0665 || codec->core.vendor_id == 0x10ec0670 ||
> -	    codec->core.vendor_id == 0x10ec0671)
> -		ssids = alc663_ssids;
> -	else
> -		ssids = alc662_ssids;
> -	return alc_parse_auto_config(codec, alc662_ignore, ssids);
> -}
> -
> -static void alc272_fixup_mario(struct hda_codec *codec,
> -			       const struct hda_fixup *fix, int action)
> -{
> -	if (action != HDA_FIXUP_ACT_PRE_PROBE)
> -		return;
> -	if (snd_hda_override_amp_caps(codec, 0x2, HDA_OUTPUT,
> -				      (0x3b << AC_AMPCAP_OFFSET_SHIFT) |
> -				      (0x3b << AC_AMPCAP_NUM_STEPS_SHIFT) |
> -				      (0x03 << AC_AMPCAP_STEP_SIZE_SHIFT) |
> -				      (0 << AC_AMPCAP_MUTE_SHIFT)))
> -		codec_warn(codec, "failed to override amp caps for NID 0x2\n");
> -}
> -
> -static const struct snd_pcm_chmap_elem asus_pcm_2_1_chmaps[] = {
> -	{ .channels = 2,
> -	  .map = { SNDRV_CHMAP_FL, SNDRV_CHMAP_FR } },
> -	{ .channels = 4,
> -	  .map = { SNDRV_CHMAP_FL, SNDRV_CHMAP_FR,
> -		   SNDRV_CHMAP_NA, SNDRV_CHMAP_LFE } }, /* LFE only on right */
> -	{ }
> -};
> -
> -/* override the 2.1 chmap */
> -static void alc_fixup_bass_chmap(struct hda_codec *codec,
> -				    const struct hda_fixup *fix, int action)
> -{
> -	if (action == HDA_FIXUP_ACT_BUILD) {
> -		struct alc_spec *spec = codec->spec;
> -		spec->gen.pcm_rec[0]->stream[0].chmap = asus_pcm_2_1_chmaps;
> -	}
> -}
> -
> -/* avoid D3 for keeping GPIO up */
> -static unsigned int gpio_led_power_filter(struct hda_codec *codec,
> -					  hda_nid_t nid,
> -					  unsigned int power_state)
> -{
> -	struct alc_spec *spec = codec->spec;
> -	if (nid == codec->core.afg && power_state == AC_PWRST_D3 && spec->gpio_data)
> -		return AC_PWRST_D0;
> -	return power_state;
> -}
> -
> -static void alc662_fixup_led_gpio1(struct hda_codec *codec,
> -				   const struct hda_fixup *fix, int action)
> -{
> -	struct alc_spec *spec = codec->spec;
> -
> -	alc_fixup_hp_gpio_led(codec, action, 0x01, 0);
> -	if (action == HDA_FIXUP_ACT_PRE_PROBE) {
> -		spec->mute_led_polarity = 1;
> -		codec->power_filter = gpio_led_power_filter;
> -	}
> -}
> -
> -static void alc662_usi_automute_hook(struct hda_codec *codec,
> -					 struct hda_jack_callback *jack)
> -{
> -	struct alc_spec *spec = codec->spec;
> -	int vref;
> -	msleep(200);
> -	snd_hda_gen_hp_automute(codec, jack);
> -
> -	vref = spec->gen.hp_jack_present ? PIN_VREF80 : 0;
> -	msleep(100);
> -	snd_hda_codec_write(codec, 0x19, 0, AC_VERB_SET_PIN_WIDGET_CONTROL,
> -			    vref);
> -}
> -
> -static void alc662_fixup_usi_headset_mic(struct hda_codec *codec,
> -				     const struct hda_fixup *fix, int action)
> -{
> -	struct alc_spec *spec = codec->spec;
> -	if (action == HDA_FIXUP_ACT_PRE_PROBE) {
> -		spec->parse_flags |= HDA_PINCFG_HEADSET_MIC;
> -		spec->gen.hp_automute_hook = alc662_usi_automute_hook;
> -	}
> -}
> -
> -static void alc662_aspire_ethos_mute_speakers(struct hda_codec *codec,
> -					struct hda_jack_callback *cb)
> -{
> -	/* surround speakers at 0x1b already get muted automatically when
> -	 * headphones are plugged in, but we have to mute/unmute the remaining
> -	 * channels manually:
> -	 * 0x15 - front left/front right
> -	 * 0x18 - front center/ LFE
> -	 */
> -	if (snd_hda_jack_detect_state(codec, 0x1b) == HDA_JACK_PRESENT) {
> -		snd_hda_set_pin_ctl_cache(codec, 0x15, 0);
> -		snd_hda_set_pin_ctl_cache(codec, 0x18, 0);
> -	} else {
> -		snd_hda_set_pin_ctl_cache(codec, 0x15, PIN_OUT);
> -		snd_hda_set_pin_ctl_cache(codec, 0x18, PIN_OUT);
> -	}
> -}
> -
> -static void alc662_fixup_aspire_ethos_hp(struct hda_codec *codec,
> -					const struct hda_fixup *fix, int action)
> -{
> -    /* Pin 0x1b: shared headphones jack and surround speakers */
> -	if (!is_jack_detectable(codec, 0x1b))
> -		return;
> -
> -	switch (action) {
> -	case HDA_FIXUP_ACT_PRE_PROBE:
> -		snd_hda_jack_detect_enable_callback(codec, 0x1b,
> -				alc662_aspire_ethos_mute_speakers);
> -		/* subwoofer needs an extra GPIO setting to become audible */
> -		alc_setup_gpio(codec, 0x02);
> -		break;
> -	case HDA_FIXUP_ACT_INIT:
> -		/* Make sure to start in a correct state, i.e. if
> -		 * headphones have been plugged in before powering up the system
> -		 */
> -		alc662_aspire_ethos_mute_speakers(codec, NULL);
> -		break;
> -	}
> -}
> -
> -static void alc671_fixup_hp_headset_mic2(struct hda_codec *codec,
> -					     const struct hda_fixup *fix, int action)
> -{
> -	struct alc_spec *spec = codec->spec;
> -
> -	static const struct hda_pintbl pincfgs[] = {
> -		{ 0x19, 0x02a11040 }, /* use as headset mic, with its own jack detect */
> -		{ 0x1b, 0x0181304f },
> -		{ }
> -	};
> -
> -	switch (action) {
> -	case HDA_FIXUP_ACT_PRE_PROBE:
> -		spec->gen.mixer_nid = 0;
> -		spec->parse_flags |= HDA_PINCFG_HEADSET_MIC;
> -		snd_hda_apply_pincfgs(codec, pincfgs);
> -		break;
> -	case HDA_FIXUP_ACT_INIT:
> -		alc_write_coef_idx(codec, 0x19, 0xa054);
> -		break;
> -	}
> -}
> -
> -static void alc897_hp_automute_hook(struct hda_codec *codec,
> -					 struct hda_jack_callback *jack)
> -{
> -	struct alc_spec *spec = codec->spec;
> -	int vref;
> -
> -	snd_hda_gen_hp_automute(codec, jack);
> -	vref = spec->gen.hp_jack_present ? (PIN_HP | AC_PINCTL_VREF_100) : PIN_HP;
> -	snd_hda_set_pin_ctl(codec, 0x1b, vref);
> -}
> -
> -static void alc897_fixup_lenovo_headset_mic(struct hda_codec *codec,
> -				     const struct hda_fixup *fix, int action)
> -{
> -	struct alc_spec *spec = codec->spec;
> -	if (action == HDA_FIXUP_ACT_PRE_PROBE) {
> -		spec->gen.hp_automute_hook = alc897_hp_automute_hook;
> -		spec->no_shutup_pins = 1;
> -	}
> -	if (action == HDA_FIXUP_ACT_PROBE) {
> -		snd_hda_set_pin_ctl_cache(codec, 0x1a, PIN_IN | AC_PINCTL_VREF_100);
> -	}
> -}
> -
> -static void alc897_fixup_lenovo_headset_mode(struct hda_codec *codec,
> -				     const struct hda_fixup *fix, int action)
> -{
> -	struct alc_spec *spec = codec->spec;
> -
> -	if (action == HDA_FIXUP_ACT_PRE_PROBE) {
> -		spec->parse_flags |= HDA_PINCFG_HEADSET_MIC;
> -		spec->gen.hp_automute_hook = alc897_hp_automute_hook;
> -	}
> -}
> -
> -static const struct coef_fw alc668_coefs[] = {
> -	WRITE_COEF(0x01, 0xbebe), WRITE_COEF(0x02, 0xaaaa), WRITE_COEF(0x03,    0x0),
> -	WRITE_COEF(0x04, 0x0180), WRITE_COEF(0x06,    0x0), WRITE_COEF(0x07, 0x0f80),
> -	WRITE_COEF(0x08, 0x0031), WRITE_COEF(0x0a, 0x0060), WRITE_COEF(0x0b,    0x0),
> -	WRITE_COEF(0x0c, 0x7cf7), WRITE_COEF(0x0d, 0x1080), WRITE_COEF(0x0e, 0x7f7f),
> -	WRITE_COEF(0x0f, 0xcccc), WRITE_COEF(0x10, 0xddcc), WRITE_COEF(0x11, 0x0001),
> -	WRITE_COEF(0x13,    0x0), WRITE_COEF(0x14, 0x2aa0), WRITE_COEF(0x17, 0xa940),
> -	WRITE_COEF(0x19,    0x0), WRITE_COEF(0x1a,    0x0), WRITE_COEF(0x1b,    0x0),
> -	WRITE_COEF(0x1c,    0x0), WRITE_COEF(0x1d,    0x0), WRITE_COEF(0x1e, 0x7418),
> -	WRITE_COEF(0x1f, 0x0804), WRITE_COEF(0x20, 0x4200), WRITE_COEF(0x21, 0x0468),
> -	WRITE_COEF(0x22, 0x8ccc), WRITE_COEF(0x23, 0x0250), WRITE_COEF(0x24, 0x7418),
> -	WRITE_COEF(0x27,    0x0), WRITE_COEF(0x28, 0x8ccc), WRITE_COEF(0x2a, 0xff00),
> -	WRITE_COEF(0x2b, 0x8000), WRITE_COEF(0xa7, 0xff00), WRITE_COEF(0xa8, 0x8000),
> -	WRITE_COEF(0xaa, 0x2e17), WRITE_COEF(0xab, 0xa0c0), WRITE_COEF(0xac,    0x0),
> -	WRITE_COEF(0xad,    0x0), WRITE_COEF(0xae, 0x2ac6), WRITE_COEF(0xaf, 0xa480),
> -	WRITE_COEF(0xb0,    0x0), WRITE_COEF(0xb1,    0x0), WRITE_COEF(0xb2,    0x0),
> -	WRITE_COEF(0xb3,    0x0), WRITE_COEF(0xb4,    0x0), WRITE_COEF(0xb5, 0x1040),
> -	WRITE_COEF(0xb6, 0xd697), WRITE_COEF(0xb7, 0x902b), WRITE_COEF(0xb8, 0xd697),
> -	WRITE_COEF(0xb9, 0x902b), WRITE_COEF(0xba, 0xb8ba), WRITE_COEF(0xbb, 0xaaab),
> -	WRITE_COEF(0xbc, 0xaaaf), WRITE_COEF(0xbd, 0x6aaa), WRITE_COEF(0xbe, 0x1c02),
> -	WRITE_COEF(0xc0, 0x00ff), WRITE_COEF(0xc1, 0x0fa6),
> -	{}
> -};
> -
> -static void alc668_restore_default_value(struct hda_codec *codec)
> -{
> -	alc_process_coef_fw(codec, alc668_coefs);
> -}
> -
> -enum {
> -	ALC662_FIXUP_ASPIRE,
> -	ALC662_FIXUP_LED_GPIO1,
> -	ALC662_FIXUP_IDEAPAD,
> -	ALC272_FIXUP_MARIO,
> -	ALC662_FIXUP_CZC_ET26,
> -	ALC662_FIXUP_CZC_P10T,
> -	ALC662_FIXUP_SKU_IGNORE,
> -	ALC662_FIXUP_HP_RP5800,
> -	ALC662_FIXUP_ASUS_MODE1,
> -	ALC662_FIXUP_ASUS_MODE2,
> -	ALC662_FIXUP_ASUS_MODE3,
> -	ALC662_FIXUP_ASUS_MODE4,
> -	ALC662_FIXUP_ASUS_MODE5,
> -	ALC662_FIXUP_ASUS_MODE6,
> -	ALC662_FIXUP_ASUS_MODE7,
> -	ALC662_FIXUP_ASUS_MODE8,
> -	ALC662_FIXUP_NO_JACK_DETECT,
> -	ALC662_FIXUP_ZOTAC_Z68,
> -	ALC662_FIXUP_INV_DMIC,
> -	ALC662_FIXUP_DELL_MIC_NO_PRESENCE,
> -	ALC668_FIXUP_DELL_MIC_NO_PRESENCE,
> -	ALC662_FIXUP_HEADSET_MODE,
> -	ALC668_FIXUP_HEADSET_MODE,
> -	ALC662_FIXUP_BASS_MODE4_CHMAP,
> -	ALC662_FIXUP_BASS_16,
> -	ALC662_FIXUP_BASS_1A,
> -	ALC662_FIXUP_BASS_CHMAP,
> -	ALC668_FIXUP_AUTO_MUTE,
> -	ALC668_FIXUP_DELL_DISABLE_AAMIX,
> -	ALC668_FIXUP_DELL_XPS13,
> -	ALC662_FIXUP_ASUS_Nx50,
> -	ALC668_FIXUP_ASUS_Nx51_HEADSET_MODE,
> -	ALC668_FIXUP_ASUS_Nx51,
> -	ALC668_FIXUP_MIC_COEF,
> -	ALC668_FIXUP_ASUS_G751,
> -	ALC891_FIXUP_HEADSET_MODE,
> -	ALC891_FIXUP_DELL_MIC_NO_PRESENCE,
> -	ALC662_FIXUP_ACER_VERITON,
> -	ALC892_FIXUP_ASROCK_MOBO,
> -	ALC662_FIXUP_USI_FUNC,
> -	ALC662_FIXUP_USI_HEADSET_MODE,
> -	ALC662_FIXUP_LENOVO_MULTI_CODECS,
> -	ALC669_FIXUP_ACER_ASPIRE_ETHOS,
> -	ALC669_FIXUP_ACER_ASPIRE_ETHOS_HEADSET,
> -	ALC671_FIXUP_HP_HEADSET_MIC2,
> -	ALC662_FIXUP_ACER_X2660G_HEADSET_MODE,
> -	ALC662_FIXUP_ACER_NITRO_HEADSET_MODE,
> -	ALC668_FIXUP_ASUS_NO_HEADSET_MIC,
> -	ALC668_FIXUP_HEADSET_MIC,
> -	ALC668_FIXUP_MIC_DET_COEF,
> -	ALC897_FIXUP_LENOVO_HEADSET_MIC,
> -	ALC897_FIXUP_HEADSET_MIC_PIN,
> -	ALC897_FIXUP_HP_HSMIC_VERB,
> -	ALC897_FIXUP_LENOVO_HEADSET_MODE,
> -	ALC897_FIXUP_HEADSET_MIC_PIN2,
> -	ALC897_FIXUP_UNIS_H3C_X500S,
> -	ALC897_FIXUP_HEADSET_MIC_PIN3,
> -};
> -
> -static const struct hda_fixup alc662_fixups[] = {
> -	[ALC662_FIXUP_ASPIRE] = {
> -		.type = HDA_FIXUP_PINS,
> -		.v.pins = (const struct hda_pintbl[]) {
> -			{ 0x15, 0x99130112 }, /* subwoofer */
> -			{ }
> -		}
> -	},
> -	[ALC662_FIXUP_LED_GPIO1] = {
> -		.type = HDA_FIXUP_FUNC,
> -		.v.func = alc662_fixup_led_gpio1,
> -	},
> -	[ALC662_FIXUP_IDEAPAD] = {
> -		.type = HDA_FIXUP_PINS,
> -		.v.pins = (const struct hda_pintbl[]) {
> -			{ 0x17, 0x99130112 }, /* subwoofer */
> -			{ }
> -		},
> -		.chained = true,
> -		.chain_id = ALC662_FIXUP_LED_GPIO1,
> -	},
> -	[ALC272_FIXUP_MARIO] = {
> -		.type = HDA_FIXUP_FUNC,
> -		.v.func = alc272_fixup_mario,
> -	},
> -	[ALC662_FIXUP_CZC_ET26] = {
> -		.type = HDA_FIXUP_PINS,
> -		.v.pins = (const struct hda_pintbl[]) {
> -			{0x12, 0x403cc000},
> -			{0x14, 0x90170110}, /* speaker */
> -			{0x15, 0x411111f0},
> -			{0x16, 0x411111f0},
> -			{0x18, 0x01a19030}, /* mic */
> -			{0x19, 0x90a7013f}, /* int-mic */
> -			{0x1a, 0x01014020},
> -			{0x1b, 0x0121401f},
> -			{0x1c, 0x411111f0},
> -			{0x1d, 0x411111f0},
> -			{0x1e, 0x40478e35},
> -			{}
> -		},
> -		.chained = true,
> -		.chain_id = ALC662_FIXUP_SKU_IGNORE
> -	},
> -	[ALC662_FIXUP_CZC_P10T] = {
> -		.type = HDA_FIXUP_VERBS,
> -		.v.verbs = (const struct hda_verb[]) {
> -			{0x14, AC_VERB_SET_EAPD_BTLENABLE, 0},
> -			{}
> -		}
> -	},
> -	[ALC662_FIXUP_SKU_IGNORE] = {
> -		.type = HDA_FIXUP_FUNC,
> -		.v.func = alc_fixup_sku_ignore,
> -	},
> -	[ALC662_FIXUP_HP_RP5800] = {
> -		.type = HDA_FIXUP_PINS,
> -		.v.pins = (const struct hda_pintbl[]) {
> -			{ 0x14, 0x0221201f }, /* HP out */
> -			{ }
> -		},
> -		.chained = true,
> -		.chain_id = ALC662_FIXUP_SKU_IGNORE
> -	},
> -	[ALC662_FIXUP_ASUS_MODE1] = {
> -		.type = HDA_FIXUP_PINS,
> -		.v.pins = (const struct hda_pintbl[]) {
> -			{ 0x14, 0x99130110 }, /* speaker */
> -			{ 0x18, 0x01a19c20 }, /* mic */
> -			{ 0x19, 0x99a3092f }, /* int-mic */
> -			{ 0x21, 0x0121401f }, /* HP out */
> -			{ }
> -		},
> -		.chained = true,
> -		.chain_id = ALC662_FIXUP_SKU_IGNORE
> -	},
> -	[ALC662_FIXUP_ASUS_MODE2] = {
> -		.type = HDA_FIXUP_PINS,
> -		.v.pins = (const struct hda_pintbl[]) {
> -			{ 0x14, 0x99130110 }, /* speaker */
> -			{ 0x18, 0x01a19820 }, /* mic */
> -			{ 0x19, 0x99a3092f }, /* int-mic */
> -			{ 0x1b, 0x0121401f }, /* HP out */
> -			{ }
> -		},
> -		.chained = true,
> -		.chain_id = ALC662_FIXUP_SKU_IGNORE
> -	},
> -	[ALC662_FIXUP_ASUS_MODE3] = {
> -		.type = HDA_FIXUP_PINS,
> -		.v.pins = (const struct hda_pintbl[]) {
> -			{ 0x14, 0x99130110 }, /* speaker */
> -			{ 0x15, 0x0121441f }, /* HP */
> -			{ 0x18, 0x01a19840 }, /* mic */
> -			{ 0x19, 0x99a3094f }, /* int-mic */
> -			{ 0x21, 0x01211420 }, /* HP2 */
> -			{ }
> -		},
> -		.chained = true,
> -		.chain_id = ALC662_FIXUP_SKU_IGNORE
> -	},
> -	[ALC662_FIXUP_ASUS_MODE4] = {
> -		.type = HDA_FIXUP_PINS,
> -		.v.pins = (const struct hda_pintbl[]) {
> -			{ 0x14, 0x99130110 }, /* speaker */
> -			{ 0x16, 0x99130111 }, /* speaker */
> -			{ 0x18, 0x01a19840 }, /* mic */
> -			{ 0x19, 0x99a3094f }, /* int-mic */
> -			{ 0x21, 0x0121441f }, /* HP */
> -			{ }
> -		},
> -		.chained = true,
> -		.chain_id = ALC662_FIXUP_SKU_IGNORE
> -	},
> -	[ALC662_FIXUP_ASUS_MODE5] = {
> -		.type = HDA_FIXUP_PINS,
> -		.v.pins = (const struct hda_pintbl[]) {
> -			{ 0x14, 0x99130110 }, /* speaker */
> -			{ 0x15, 0x0121441f }, /* HP */
> -			{ 0x16, 0x99130111 }, /* speaker */
> -			{ 0x18, 0x01a19840 }, /* mic */
> -			{ 0x19, 0x99a3094f }, /* int-mic */
> -			{ }
> -		},
> -		.chained = true,
> -		.chain_id = ALC662_FIXUP_SKU_IGNORE
> -	},
> -	[ALC662_FIXUP_ASUS_MODE6] = {
> -		.type = HDA_FIXUP_PINS,
> -		.v.pins = (const struct hda_pintbl[]) {
> -			{ 0x14, 0x99130110 }, /* speaker */
> -			{ 0x15, 0x01211420 }, /* HP2 */
> -			{ 0x18, 0x01a19840 }, /* mic */
> -			{ 0x19, 0x99a3094f }, /* int-mic */
> -			{ 0x1b, 0x0121441f }, /* HP */
> -			{ }
> -		},
> -		.chained = true,
> -		.chain_id = ALC662_FIXUP_SKU_IGNORE
> -	},
> -	[ALC662_FIXUP_ASUS_MODE7] = {
> -		.type = HDA_FIXUP_PINS,
> -		.v.pins = (const struct hda_pintbl[]) {
> -			{ 0x14, 0x99130110 }, /* speaker */
> -			{ 0x17, 0x99130111 }, /* speaker */
> -			{ 0x18, 0x01a19840 }, /* mic */
> -			{ 0x19, 0x99a3094f }, /* int-mic */
> -			{ 0x1b, 0x01214020 }, /* HP */
> -			{ 0x21, 0x0121401f }, /* HP */
> -			{ }
> -		},
> -		.chained = true,
> -		.chain_id = ALC662_FIXUP_SKU_IGNORE
> -	},
> -	[ALC662_FIXUP_ASUS_MODE8] = {
> -		.type = HDA_FIXUP_PINS,
> -		.v.pins = (const struct hda_pintbl[]) {
> -			{ 0x14, 0x99130110 }, /* speaker */
> -			{ 0x12, 0x99a30970 }, /* int-mic */
> -			{ 0x15, 0x01214020 }, /* HP */
> -			{ 0x17, 0x99130111 }, /* speaker */
> -			{ 0x18, 0x01a19840 }, /* mic */
> -			{ 0x21, 0x0121401f }, /* HP */
> -			{ }
> -		},
> -		.chained = true,
> -		.chain_id = ALC662_FIXUP_SKU_IGNORE
> -	},
> -	[ALC662_FIXUP_NO_JACK_DETECT] = {
> -		.type = HDA_FIXUP_FUNC,
> -		.v.func = alc_fixup_no_jack_detect,
> -	},
> -	[ALC662_FIXUP_ZOTAC_Z68] = {
> -		.type = HDA_FIXUP_PINS,
> -		.v.pins = (const struct hda_pintbl[]) {
> -			{ 0x1b, 0x02214020 }, /* Front HP */
> -			{ }
> -		}
> -	},
> -	[ALC662_FIXUP_INV_DMIC] = {
> -		.type = HDA_FIXUP_FUNC,
> -		.v.func = alc_fixup_inv_dmic,
> -	},
> -	[ALC668_FIXUP_DELL_XPS13] = {
> -		.type = HDA_FIXUP_FUNC,
> -		.v.func = alc_fixup_dell_xps13,
> -		.chained = true,
> -		.chain_id = ALC668_FIXUP_DELL_DISABLE_AAMIX
> -	},
> -	[ALC668_FIXUP_DELL_DISABLE_AAMIX] = {
> -		.type = HDA_FIXUP_FUNC,
> -		.v.func = alc_fixup_disable_aamix,
> -		.chained = true,
> -		.chain_id = ALC668_FIXUP_DELL_MIC_NO_PRESENCE
> -	},
> -	[ALC668_FIXUP_AUTO_MUTE] = {
> -		.type = HDA_FIXUP_FUNC,
> -		.v.func = alc_fixup_auto_mute_via_amp,
> -		.chained = true,
> -		.chain_id = ALC668_FIXUP_DELL_MIC_NO_PRESENCE
> -	},
> -	[ALC662_FIXUP_DELL_MIC_NO_PRESENCE] = {
> -		.type = HDA_FIXUP_PINS,
> -		.v.pins = (const struct hda_pintbl[]) {
> -			{ 0x19, 0x03a1113c }, /* use as headset mic, without its own jack detect */
> -			/* headphone mic by setting pin control of 0x1b (headphone out) to in + vref_50 */
> -			{ }
> -		},
> -		.chained = true,
> -		.chain_id = ALC662_FIXUP_HEADSET_MODE
> -	},
> -	[ALC662_FIXUP_HEADSET_MODE] = {
> -		.type = HDA_FIXUP_FUNC,
> -		.v.func = alc_fixup_headset_mode_alc662,
> -	},
> -	[ALC668_FIXUP_DELL_MIC_NO_PRESENCE] = {
> -		.type = HDA_FIXUP_PINS,
> -		.v.pins = (const struct hda_pintbl[]) {
> -			{ 0x19, 0x03a1913d }, /* use as headphone mic, without its own jack detect */
> -			{ 0x1b, 0x03a1113c }, /* use as headset mic, without its own jack detect */
> -			{ }
> -		},
> -		.chained = true,
> -		.chain_id = ALC668_FIXUP_HEADSET_MODE
> -	},
> -	[ALC668_FIXUP_HEADSET_MODE] = {
> -		.type = HDA_FIXUP_FUNC,
> -		.v.func = alc_fixup_headset_mode_alc668,
> -	},
> -	[ALC662_FIXUP_BASS_MODE4_CHMAP] = {
> -		.type = HDA_FIXUP_FUNC,
> -		.v.func = alc_fixup_bass_chmap,
> -		.chained = true,
> -		.chain_id = ALC662_FIXUP_ASUS_MODE4
> -	},
> -	[ALC662_FIXUP_BASS_16] = {
> -		.type = HDA_FIXUP_PINS,
> -		.v.pins = (const struct hda_pintbl[]) {
> -			{0x16, 0x80106111}, /* bass speaker */
> -			{}
> -		},
> -		.chained = true,
> -		.chain_id = ALC662_FIXUP_BASS_CHMAP,
> -	},
> -	[ALC662_FIXUP_BASS_1A] = {
> -		.type = HDA_FIXUP_PINS,
> -		.v.pins = (const struct hda_pintbl[]) {
> -			{0x1a, 0x80106111}, /* bass speaker */
> -			{}
> -		},
> -		.chained = true,
> -		.chain_id = ALC662_FIXUP_BASS_CHMAP,
> -	},
> -	[ALC662_FIXUP_BASS_CHMAP] = {
> -		.type = HDA_FIXUP_FUNC,
> -		.v.func = alc_fixup_bass_chmap,
> -	},
> -	[ALC662_FIXUP_ASUS_Nx50] = {
> -		.type = HDA_FIXUP_FUNC,
> -		.v.func = alc_fixup_auto_mute_via_amp,
> -		.chained = true,
> -		.chain_id = ALC662_FIXUP_BASS_1A
> -	},
> -	[ALC668_FIXUP_ASUS_Nx51_HEADSET_MODE] = {
> -		.type = HDA_FIXUP_FUNC,
> -		.v.func = alc_fixup_headset_mode_alc668,
> -		.chain_id = ALC662_FIXUP_BASS_CHMAP
> -	},
> -	[ALC668_FIXUP_ASUS_Nx51] = {
> -		.type = HDA_FIXUP_PINS,
> -		.v.pins = (const struct hda_pintbl[]) {
> -			{ 0x19, 0x03a1913d }, /* use as headphone mic, without its own jack detect */
> -			{ 0x1a, 0x90170151 }, /* bass speaker */
> -			{ 0x1b, 0x03a1113c }, /* use as headset mic, without its own jack detect */
> -			{}
> -		},
> -		.chained = true,
> -		.chain_id = ALC668_FIXUP_ASUS_Nx51_HEADSET_MODE,
> -	},
> -	[ALC668_FIXUP_MIC_COEF] = {
> -		.type = HDA_FIXUP_VERBS,
> -		.v.verbs = (const struct hda_verb[]) {
> -			{ 0x20, AC_VERB_SET_COEF_INDEX, 0xc3 },
> -			{ 0x20, AC_VERB_SET_PROC_COEF, 0x4000 },
> -			{}
> -		},
> -	},
> -	[ALC668_FIXUP_ASUS_G751] = {
> -		.type = HDA_FIXUP_PINS,
> -		.v.pins = (const struct hda_pintbl[]) {
> -			{ 0x16, 0x0421101f }, /* HP */
> -			{}
> -		},
> -		.chained = true,
> -		.chain_id = ALC668_FIXUP_MIC_COEF
> -	},
> -	[ALC891_FIXUP_HEADSET_MODE] = {
> -		.type = HDA_FIXUP_FUNC,
> -		.v.func = alc_fixup_headset_mode,
> -	},
> -	[ALC891_FIXUP_DELL_MIC_NO_PRESENCE] = {
> -		.type = HDA_FIXUP_PINS,
> -		.v.pins = (const struct hda_pintbl[]) {
> -			{ 0x19, 0x03a1913d }, /* use as headphone mic, without its own jack detect */
> -			{ 0x1b, 0x03a1113c }, /* use as headset mic, without its own jack detect */
> -			{ }
> -		},
> -		.chained = true,
> -		.chain_id = ALC891_FIXUP_HEADSET_MODE
> -	},
> -	[ALC662_FIXUP_ACER_VERITON] = {
> -		.type = HDA_FIXUP_PINS,
> -		.v.pins = (const struct hda_pintbl[]) {
> -			{ 0x15, 0x50170120 }, /* no internal speaker */
> -			{ }
> -		}
> -	},
> -	[ALC892_FIXUP_ASROCK_MOBO] = {
> -		.type = HDA_FIXUP_PINS,
> -		.v.pins = (const struct hda_pintbl[]) {
> -			{ 0x15, 0x40f000f0 }, /* disabled */
> -			{ 0x16, 0x40f000f0 }, /* disabled */
> -			{ }
> -		}
> -	},
> -	[ALC662_FIXUP_USI_FUNC] = {
> -		.type = HDA_FIXUP_FUNC,
> -		.v.func = alc662_fixup_usi_headset_mic,
> -	},
> -	[ALC662_FIXUP_USI_HEADSET_MODE] = {
> -		.type = HDA_FIXUP_PINS,
> -		.v.pins = (const struct hda_pintbl[]) {
> -			{ 0x19, 0x02a1913c }, /* use as headset mic, without its own jack detect */
> -			{ 0x18, 0x01a1903d },
> -			{ }
> -		},
> -		.chained = true,
> -		.chain_id = ALC662_FIXUP_USI_FUNC
> -	},
> -	[ALC662_FIXUP_LENOVO_MULTI_CODECS] = {
> -		.type = HDA_FIXUP_FUNC,
> -		.v.func = alc233_alc662_fixup_lenovo_dual_codecs,
> -	},
> -	[ALC669_FIXUP_ACER_ASPIRE_ETHOS_HEADSET] = {
> -		.type = HDA_FIXUP_FUNC,
> -		.v.func = alc662_fixup_aspire_ethos_hp,
> -	},
> -	[ALC669_FIXUP_ACER_ASPIRE_ETHOS] = {
> -		.type = HDA_FIXUP_PINS,
> -		.v.pins = (const struct hda_pintbl[]) {
> -			{ 0x15, 0x92130110 }, /* front speakers */
> -			{ 0x18, 0x99130111 }, /* center/subwoofer */
> -			{ 0x1b, 0x11130012 }, /* surround plus jack for HP */
> -			{ }
> -		},
> -		.chained = true,
> -		.chain_id = ALC669_FIXUP_ACER_ASPIRE_ETHOS_HEADSET
> -	},
> -	[ALC671_FIXUP_HP_HEADSET_MIC2] = {
> -		.type = HDA_FIXUP_FUNC,
> -		.v.func = alc671_fixup_hp_headset_mic2,
> -	},
> -	[ALC662_FIXUP_ACER_X2660G_HEADSET_MODE] = {
> -		.type = HDA_FIXUP_PINS,
> -		.v.pins = (const struct hda_pintbl[]) {
> -			{ 0x1a, 0x02a1113c }, /* use as headset mic, without its own jack detect */
> -			{ }
> -		},
> -		.chained = true,
> -		.chain_id = ALC662_FIXUP_USI_FUNC
> -	},
> -	[ALC662_FIXUP_ACER_NITRO_HEADSET_MODE] = {
> -		.type = HDA_FIXUP_PINS,
> -		.v.pins = (const struct hda_pintbl[]) {
> -			{ 0x1a, 0x01a11140 }, /* use as headset mic, without its own jack detect */
> -			{ 0x1b, 0x0221144f },
> -			{ }
> -		},
> -		.chained = true,
> -		.chain_id = ALC662_FIXUP_USI_FUNC
> -	},
> -	[ALC668_FIXUP_ASUS_NO_HEADSET_MIC] = {
> -		.type = HDA_FIXUP_PINS,
> -		.v.pins = (const struct hda_pintbl[]) {
> -			{ 0x1b, 0x04a1112c },
> -			{ }
> -		},
> -		.chained = true,
> -		.chain_id = ALC668_FIXUP_HEADSET_MIC
> -	},
> -	[ALC668_FIXUP_HEADSET_MIC] = {
> -		.type = HDA_FIXUP_FUNC,
> -		.v.func = alc269_fixup_headset_mic,
> -		.chained = true,
> -		.chain_id = ALC668_FIXUP_MIC_DET_COEF
> -	},
> -	[ALC668_FIXUP_MIC_DET_COEF] = {
> -		.type = HDA_FIXUP_VERBS,
> -		.v.verbs = (const struct hda_verb[]) {
> -			{ 0x20, AC_VERB_SET_COEF_INDEX, 0x15 },
> -			{ 0x20, AC_VERB_SET_PROC_COEF, 0x0d60 },
> -			{}
> -		},
> -	},
> -	[ALC897_FIXUP_LENOVO_HEADSET_MIC] = {
> -		.type = HDA_FIXUP_FUNC,
> -		.v.func = alc897_fixup_lenovo_headset_mic,
> -	},
> -	[ALC897_FIXUP_HEADSET_MIC_PIN] = {
> -		.type = HDA_FIXUP_PINS,
> -		.v.pins = (const struct hda_pintbl[]) {
> -			{ 0x1a, 0x03a11050 },
> -			{ }
> -		},
> -		.chained = true,
> -		.chain_id = ALC897_FIXUP_LENOVO_HEADSET_MIC
> -	},
> -	[ALC897_FIXUP_HP_HSMIC_VERB] = {
> -		.type = HDA_FIXUP_PINS,
> -		.v.pins = (const struct hda_pintbl[]) {
> -			{ 0x19, 0x01a1913c }, /* use as headset mic, without its own jack detect */
> -			{ }
> -		},
> -	},
> -	[ALC897_FIXUP_LENOVO_HEADSET_MODE] = {
> -		.type = HDA_FIXUP_FUNC,
> -		.v.func = alc897_fixup_lenovo_headset_mode,
> -	},
> -	[ALC897_FIXUP_HEADSET_MIC_PIN2] = {
> -		.type = HDA_FIXUP_PINS,
> -		.v.pins = (const struct hda_pintbl[]) {
> -			{ 0x1a, 0x01a11140 }, /* use as headset mic, without its own jack detect */
> -			{ }
> -		},
> -		.chained = true,
> -		.chain_id = ALC897_FIXUP_LENOVO_HEADSET_MODE
> -	},
> -	[ALC897_FIXUP_UNIS_H3C_X500S] = {
> -		.type = HDA_FIXUP_VERBS,
> -		.v.verbs = (const struct hda_verb[]) {
> -			{ 0x14, AC_VERB_SET_EAPD_BTLENABLE, 0 },
> -			{}
> -		},
> -	},
> -	[ALC897_FIXUP_HEADSET_MIC_PIN3] = {
> -		.type = HDA_FIXUP_PINS,
> -		.v.pins = (const struct hda_pintbl[]) {
> -			{ 0x19, 0x03a11050 }, /* use as headset mic */
> -			{ }
> -		},
> -	},
> -};
> -
> -static const struct hda_quirk alc662_fixup_tbl[] = {
> -	SND_PCI_QUIRK(0x1019, 0x9087, "ECS", ALC662_FIXUP_ASUS_MODE2),
> -	SND_PCI_QUIRK(0x1019, 0x9859, "JP-IK LEAP W502", ALC897_FIXUP_HEADSET_MIC_PIN3),
> -	SND_PCI_QUIRK(0x1025, 0x022f, "Acer Aspire One", ALC662_FIXUP_INV_DMIC),
> -	SND_PCI_QUIRK(0x1025, 0x0241, "Packard Bell DOTS", ALC662_FIXUP_INV_DMIC),
> -	SND_PCI_QUIRK(0x1025, 0x0308, "Acer Aspire 8942G", ALC662_FIXUP_ASPIRE),
> -	SND_PCI_QUIRK(0x1025, 0x031c, "Gateway NV79", ALC662_FIXUP_SKU_IGNORE),
> -	SND_PCI_QUIRK(0x1025, 0x0349, "eMachines eM250", ALC662_FIXUP_INV_DMIC),
> -	SND_PCI_QUIRK(0x1025, 0x034a, "Gateway LT27", ALC662_FIXUP_INV_DMIC),
> -	SND_PCI_QUIRK(0x1025, 0x038b, "Acer Aspire 8943G", ALC662_FIXUP_ASPIRE),
> -	SND_PCI_QUIRK(0x1025, 0x0566, "Acer Aspire Ethos 8951G", ALC669_FIXUP_ACER_ASPIRE_ETHOS),
> -	SND_PCI_QUIRK(0x1025, 0x123c, "Acer Nitro N50-600", ALC662_FIXUP_ACER_NITRO_HEADSET_MODE),
> -	SND_PCI_QUIRK(0x1025, 0x124e, "Acer 2660G", ALC662_FIXUP_ACER_X2660G_HEADSET_MODE),
> -	SND_PCI_QUIRK(0x1028, 0x05d8, "Dell", ALC668_FIXUP_DELL_MIC_NO_PRESENCE),
> -	SND_PCI_QUIRK(0x1028, 0x05db, "Dell", ALC668_FIXUP_DELL_MIC_NO_PRESENCE),
> -	SND_PCI_QUIRK(0x1028, 0x05fe, "Dell XPS 15", ALC668_FIXUP_DELL_XPS13),
> -	SND_PCI_QUIRK(0x1028, 0x060a, "Dell XPS 13", ALC668_FIXUP_DELL_XPS13),
> -	SND_PCI_QUIRK(0x1028, 0x060d, "Dell M3800", ALC668_FIXUP_DELL_XPS13),
> -	SND_PCI_QUIRK(0x1028, 0x0625, "Dell", ALC668_FIXUP_DELL_MIC_NO_PRESENCE),
> -	SND_PCI_QUIRK(0x1028, 0x0626, "Dell", ALC668_FIXUP_DELL_MIC_NO_PRESENCE),
> -	SND_PCI_QUIRK(0x1028, 0x0696, "Dell", ALC668_FIXUP_DELL_MIC_NO_PRESENCE),
> -	SND_PCI_QUIRK(0x1028, 0x0698, "Dell", ALC668_FIXUP_DELL_MIC_NO_PRESENCE),
> -	SND_PCI_QUIRK(0x1028, 0x069f, "Dell", ALC668_FIXUP_DELL_MIC_NO_PRESENCE),
> -	SND_PCI_QUIRK(0x103c, 0x1632, "HP RP5800", ALC662_FIXUP_HP_RP5800),
> -	SND_PCI_QUIRK(0x103c, 0x870c, "HP", ALC897_FIXUP_HP_HSMIC_VERB),
> -	SND_PCI_QUIRK(0x103c, 0x8719, "HP", ALC897_FIXUP_HP_HSMIC_VERB),
> -	SND_PCI_QUIRK(0x103c, 0x872b, "HP", ALC897_FIXUP_HP_HSMIC_VERB),
> -	SND_PCI_QUIRK(0x103c, 0x873e, "HP", ALC671_FIXUP_HP_HEADSET_MIC2),
> -	SND_PCI_QUIRK(0x103c, 0x8768, "HP Slim Desktop S01", ALC671_FIXUP_HP_HEADSET_MIC2),
> -	SND_PCI_QUIRK(0x103c, 0x877e, "HP 288 Pro G6", ALC671_FIXUP_HP_HEADSET_MIC2),
> -	SND_PCI_QUIRK(0x103c, 0x885f, "HP 288 Pro G8", ALC671_FIXUP_HP_HEADSET_MIC2),
> -	SND_PCI_QUIRK(0x1043, 0x1080, "Asus UX501VW", ALC668_FIXUP_HEADSET_MODE),
> -	SND_PCI_QUIRK(0x1043, 0x11cd, "Asus N550", ALC662_FIXUP_ASUS_Nx50),
> -	SND_PCI_QUIRK(0x1043, 0x129d, "Asus N750", ALC662_FIXUP_ASUS_Nx50),
> -	SND_PCI_QUIRK(0x1043, 0x12ff, "ASUS G751", ALC668_FIXUP_ASUS_G751),
> -	SND_PCI_QUIRK(0x1043, 0x13df, "Asus N550JX", ALC662_FIXUP_BASS_1A),
> -	SND_PCI_QUIRK(0x1043, 0x1477, "ASUS N56VZ", ALC662_FIXUP_BASS_MODE4_CHMAP),
> -	SND_PCI_QUIRK(0x1043, 0x15a7, "ASUS UX51VZH", ALC662_FIXUP_BASS_16),
> -	SND_PCI_QUIRK(0x1043, 0x177d, "ASUS N551", ALC668_FIXUP_ASUS_Nx51),
> -	SND_PCI_QUIRK(0x1043, 0x17bd, "ASUS N751", ALC668_FIXUP_ASUS_Nx51),
> -	SND_PCI_QUIRK(0x1043, 0x185d, "ASUS G551JW", ALC668_FIXUP_ASUS_NO_HEADSET_MIC),
> -	SND_PCI_QUIRK(0x1043, 0x1963, "ASUS X71SL", ALC662_FIXUP_ASUS_MODE8),
> -	SND_PCI_QUIRK(0x1043, 0x1b73, "ASUS N55SF", ALC662_FIXUP_BASS_16),
> -	SND_PCI_QUIRK(0x1043, 0x1bf3, "ASUS N76VZ", ALC662_FIXUP_BASS_MODE4_CHMAP),
> -	SND_PCI_QUIRK(0x1043, 0x8469, "ASUS mobo", ALC662_FIXUP_NO_JACK_DETECT),
> -	SND_PCI_QUIRK(0x105b, 0x0cd6, "Foxconn", ALC662_FIXUP_ASUS_MODE2),
> -	SND_PCI_QUIRK(0x144d, 0xc051, "Samsung R720", ALC662_FIXUP_IDEAPAD),
> -	SND_PCI_QUIRK(0x14cd, 0x5003, "USI", ALC662_FIXUP_USI_HEADSET_MODE),
> -	SND_PCI_QUIRK(0x17aa, 0x1036, "Lenovo P520", ALC662_FIXUP_LENOVO_MULTI_CODECS),
> -	SND_PCI_QUIRK(0x17aa, 0x1057, "Lenovo P360", ALC897_FIXUP_HEADSET_MIC_PIN),
> -	SND_PCI_QUIRK(0x17aa, 0x1064, "Lenovo P3 Tower", ALC897_FIXUP_HEADSET_MIC_PIN),
> -	SND_PCI_QUIRK(0x17aa, 0x32ca, "Lenovo ThinkCentre M80", ALC897_FIXUP_HEADSET_MIC_PIN),
> -	SND_PCI_QUIRK(0x17aa, 0x32cb, "Lenovo ThinkCentre M70", ALC897_FIXUP_HEADSET_MIC_PIN),
> -	SND_PCI_QUIRK(0x17aa, 0x32cf, "Lenovo ThinkCentre M950", ALC897_FIXUP_HEADSET_MIC_PIN),
> -	SND_PCI_QUIRK(0x17aa, 0x32f7, "Lenovo ThinkCentre M90", ALC897_FIXUP_HEADSET_MIC_PIN),
> -	SND_PCI_QUIRK(0x17aa, 0x3321, "Lenovo ThinkCentre M70 Gen4", ALC897_FIXUP_HEADSET_MIC_PIN),
> -	SND_PCI_QUIRK(0x17aa, 0x331b, "Lenovo ThinkCentre M90 Gen4", ALC897_FIXUP_HEADSET_MIC_PIN),
> -	SND_PCI_QUIRK(0x17aa, 0x3364, "Lenovo ThinkCentre M90 Gen5", ALC897_FIXUP_HEADSET_MIC_PIN),
> -	SND_PCI_QUIRK(0x17aa, 0x3742, "Lenovo TianYi510Pro-14IOB", ALC897_FIXUP_HEADSET_MIC_PIN2),
> -	SND_PCI_QUIRK(0x17aa, 0x38af, "Lenovo Ideapad Y550P", ALC662_FIXUP_IDEAPAD),
> -	SND_PCI_QUIRK(0x17aa, 0x3a0d, "Lenovo Ideapad Y550", ALC662_FIXUP_IDEAPAD),
> -	SND_PCI_QUIRK(0x1849, 0x5892, "ASRock B150M", ALC892_FIXUP_ASROCK_MOBO),
> -	SND_PCI_QUIRK(0x19da, 0xa130, "Zotac Z68", ALC662_FIXUP_ZOTAC_Z68),
> -	SND_PCI_QUIRK(0x1b0a, 0x01b8, "ACER Veriton", ALC662_FIXUP_ACER_VERITON),
> -	SND_PCI_QUIRK(0x1b35, 0x1234, "CZC ET26", ALC662_FIXUP_CZC_ET26),
> -	SND_PCI_QUIRK(0x1b35, 0x2206, "CZC P10T", ALC662_FIXUP_CZC_P10T),
> -	SND_PCI_QUIRK(0x1c6c, 0x1239, "Compaq N14JP6-V2", ALC897_FIXUP_HP_HSMIC_VERB),
> -
> -#if 0
> -	/* Below is a quirk table taken from the old code.
> -	 * Basically the device should work as is without the fixup table.
> -	 * If BIOS doesn't give a proper info, enable the corresponding
> -	 * fixup entry.
> -	 */
> -	SND_PCI_QUIRK(0x1043, 0x1000, "ASUS N50Vm", ALC662_FIXUP_ASUS_MODE1),
> -	SND_PCI_QUIRK(0x1043, 0x1092, "ASUS NB", ALC662_FIXUP_ASUS_MODE3),
> -	SND_PCI_QUIRK(0x1043, 0x1173, "ASUS K73Jn", ALC662_FIXUP_ASUS_MODE1),
> -	SND_PCI_QUIRK(0x1043, 0x11c3, "ASUS M70V", ALC662_FIXUP_ASUS_MODE3),
> -	SND_PCI_QUIRK(0x1043, 0x11d3, "ASUS NB", ALC662_FIXUP_ASUS_MODE1),
> -	SND_PCI_QUIRK(0x1043, 0x11f3, "ASUS NB", ALC662_FIXUP_ASUS_MODE2),
> -	SND_PCI_QUIRK(0x1043, 0x1203, "ASUS NB", ALC662_FIXUP_ASUS_MODE1),
> -	SND_PCI_QUIRK(0x1043, 0x1303, "ASUS G60J", ALC662_FIXUP_ASUS_MODE1),
> -	SND_PCI_QUIRK(0x1043, 0x1333, "ASUS G60Jx", ALC662_FIXUP_ASUS_MODE1),
> -	SND_PCI_QUIRK(0x1043, 0x1339, "ASUS NB", ALC662_FIXUP_ASUS_MODE2),
> -	SND_PCI_QUIRK(0x1043, 0x13e3, "ASUS N71JA", ALC662_FIXUP_ASUS_MODE7),
> -	SND_PCI_QUIRK(0x1043, 0x1463, "ASUS N71", ALC662_FIXUP_ASUS_MODE7),
> -	SND_PCI_QUIRK(0x1043, 0x14d3, "ASUS G72", ALC662_FIXUP_ASUS_MODE8),
> -	SND_PCI_QUIRK(0x1043, 0x1563, "ASUS N90", ALC662_FIXUP_ASUS_MODE3),
> -	SND_PCI_QUIRK(0x1043, 0x15d3, "ASUS N50SF F50SF", ALC662_FIXUP_ASUS_MODE1),
> -	SND_PCI_QUIRK(0x1043, 0x16c3, "ASUS NB", ALC662_FIXUP_ASUS_MODE2),
> -	SND_PCI_QUIRK(0x1043, 0x16f3, "ASUS K40C K50C", ALC662_FIXUP_ASUS_MODE2),
> -	SND_PCI_QUIRK(0x1043, 0x1733, "ASUS N81De", ALC662_FIXUP_ASUS_MODE1),
> -	SND_PCI_QUIRK(0x1043, 0x1753, "ASUS NB", ALC662_FIXUP_ASUS_MODE2),
> -	SND_PCI_QUIRK(0x1043, 0x1763, "ASUS NB", ALC662_FIXUP_ASUS_MODE6),
> -	SND_PCI_QUIRK(0x1043, 0x1765, "ASUS NB", ALC662_FIXUP_ASUS_MODE6),
> -	SND_PCI_QUIRK(0x1043, 0x1783, "ASUS NB", ALC662_FIXUP_ASUS_MODE2),
> -	SND_PCI_QUIRK(0x1043, 0x1793, "ASUS F50GX", ALC662_FIXUP_ASUS_MODE1),
> -	SND_PCI_QUIRK(0x1043, 0x17b3, "ASUS F70SL", ALC662_FIXUP_ASUS_MODE3),
> -	SND_PCI_QUIRK(0x1043, 0x17f3, "ASUS X58LE", ALC662_FIXUP_ASUS_MODE2),
> -	SND_PCI_QUIRK(0x1043, 0x1813, "ASUS NB", ALC662_FIXUP_ASUS_MODE2),
> -	SND_PCI_QUIRK(0x1043, 0x1823, "ASUS NB", ALC662_FIXUP_ASUS_MODE5),
> -	SND_PCI_QUIRK(0x1043, 0x1833, "ASUS NB", ALC662_FIXUP_ASUS_MODE6),
> -	SND_PCI_QUIRK(0x1043, 0x1843, "ASUS NB", ALC662_FIXUP_ASUS_MODE2),
> -	SND_PCI_QUIRK(0x1043, 0x1853, "ASUS F50Z", ALC662_FIXUP_ASUS_MODE1),
> -	SND_PCI_QUIRK(0x1043, 0x1864, "ASUS NB", ALC662_FIXUP_ASUS_MODE2),
> -	SND_PCI_QUIRK(0x1043, 0x1876, "ASUS NB", ALC662_FIXUP_ASUS_MODE2),
> -	SND_PCI_QUIRK(0x1043, 0x1893, "ASUS M50Vm", ALC662_FIXUP_ASUS_MODE3),
> -	SND_PCI_QUIRK(0x1043, 0x1894, "ASUS X55", ALC662_FIXUP_ASUS_MODE3),
> -	SND_PCI_QUIRK(0x1043, 0x18b3, "ASUS N80Vc", ALC662_FIXUP_ASUS_MODE1),
> -	SND_PCI_QUIRK(0x1043, 0x18c3, "ASUS VX5", ALC662_FIXUP_ASUS_MODE1),
> -	SND_PCI_QUIRK(0x1043, 0x18d3, "ASUS N81Te", ALC662_FIXUP_ASUS_MODE1),
> -	SND_PCI_QUIRK(0x1043, 0x18f3, "ASUS N505Tp", ALC662_FIXUP_ASUS_MODE1),
> -	SND_PCI_QUIRK(0x1043, 0x1903, "ASUS F5GL", ALC662_FIXUP_ASUS_MODE1),
> -	SND_PCI_QUIRK(0x1043, 0x1913, "ASUS NB", ALC662_FIXUP_ASUS_MODE2),
> -	SND_PCI_QUIRK(0x1043, 0x1933, "ASUS F80Q", ALC662_FIXUP_ASUS_MODE2),
> -	SND_PCI_QUIRK(0x1043, 0x1943, "ASUS Vx3V", ALC662_FIXUP_ASUS_MODE1),
> -	SND_PCI_QUIRK(0x1043, 0x1953, "ASUS NB", ALC662_FIXUP_ASUS_MODE1),
> -	SND_PCI_QUIRK(0x1043, 0x1963, "ASUS X71C", ALC662_FIXUP_ASUS_MODE3),
> -	SND_PCI_QUIRK(0x1043, 0x1983, "ASUS N5051A", ALC662_FIXUP_ASUS_MODE1),
> -	SND_PCI_QUIRK(0x1043, 0x1993, "ASUS N20", ALC662_FIXUP_ASUS_MODE1),
> -	SND_PCI_QUIRK(0x1043, 0x19b3, "ASUS F7Z", ALC662_FIXUP_ASUS_MODE1),
> -	SND_PCI_QUIRK(0x1043, 0x19c3, "ASUS F5Z/F6x", ALC662_FIXUP_ASUS_MODE2),
> -	SND_PCI_QUIRK(0x1043, 0x19e3, "ASUS NB", ALC662_FIXUP_ASUS_MODE1),
> -	SND_PCI_QUIRK(0x1043, 0x19f3, "ASUS NB", ALC662_FIXUP_ASUS_MODE4),
> -#endif
> -	{}
> -};
> -
> -static const struct hda_model_fixup alc662_fixup_models[] = {
> -	{.id = ALC662_FIXUP_ASPIRE, .name = "aspire"},
> -	{.id = ALC662_FIXUP_IDEAPAD, .name = "ideapad"},
> -	{.id = ALC272_FIXUP_MARIO, .name = "mario"},
> -	{.id = ALC662_FIXUP_HP_RP5800, .name = "hp-rp5800"},
> -	{.id = ALC662_FIXUP_ASUS_MODE1, .name = "asus-mode1"},
> -	{.id = ALC662_FIXUP_ASUS_MODE2, .name = "asus-mode2"},
> -	{.id = ALC662_FIXUP_ASUS_MODE3, .name = "asus-mode3"},
> -	{.id = ALC662_FIXUP_ASUS_MODE4, .name = "asus-mode4"},
> -	{.id = ALC662_FIXUP_ASUS_MODE5, .name = "asus-mode5"},
> -	{.id = ALC662_FIXUP_ASUS_MODE6, .name = "asus-mode6"},
> -	{.id = ALC662_FIXUP_ASUS_MODE7, .name = "asus-mode7"},
> -	{.id = ALC662_FIXUP_ASUS_MODE8, .name = "asus-mode8"},
> -	{.id = ALC662_FIXUP_ZOTAC_Z68, .name = "zotac-z68"},
> -	{.id = ALC662_FIXUP_INV_DMIC, .name = "inv-dmic"},
> -	{.id = ALC662_FIXUP_DELL_MIC_NO_PRESENCE, .name = "alc662-headset-multi"},
> -	{.id = ALC668_FIXUP_DELL_MIC_NO_PRESENCE, .name = "dell-headset-multi"},
> -	{.id = ALC662_FIXUP_HEADSET_MODE, .name = "alc662-headset"},
> -	{.id = ALC668_FIXUP_HEADSET_MODE, .name = "alc668-headset"},
> -	{.id = ALC662_FIXUP_BASS_16, .name = "bass16"},
> -	{.id = ALC662_FIXUP_BASS_1A, .name = "bass1a"},
> -	{.id = ALC668_FIXUP_AUTO_MUTE, .name = "automute"},
> -	{.id = ALC668_FIXUP_DELL_XPS13, .name = "dell-xps13"},
> -	{.id = ALC662_FIXUP_ASUS_Nx50, .name = "asus-nx50"},
> -	{.id = ALC668_FIXUP_ASUS_Nx51, .name = "asus-nx51"},
> -	{.id = ALC668_FIXUP_ASUS_G751, .name = "asus-g751"},
> -	{.id = ALC891_FIXUP_HEADSET_MODE, .name = "alc891-headset"},
> -	{.id = ALC891_FIXUP_DELL_MIC_NO_PRESENCE, .name = "alc891-headset-multi"},
> -	{.id = ALC662_FIXUP_ACER_VERITON, .name = "acer-veriton"},
> -	{.id = ALC892_FIXUP_ASROCK_MOBO, .name = "asrock-mobo"},
> -	{.id = ALC662_FIXUP_USI_HEADSET_MODE, .name = "usi-headset"},
> -	{.id = ALC662_FIXUP_LENOVO_MULTI_CODECS, .name = "dual-codecs"},
> -	{.id = ALC669_FIXUP_ACER_ASPIRE_ETHOS, .name = "aspire-ethos"},
> -	{.id = ALC897_FIXUP_UNIS_H3C_X500S, .name = "unis-h3c-x500s"},
> -	{}
> -};
> -
> -static const struct snd_hda_pin_quirk alc662_pin_fixup_tbl[] = {
> -	SND_HDA_PIN_QUIRK(0x10ec0867, 0x1028, "Dell", ALC891_FIXUP_DELL_MIC_NO_PRESENCE,
> -		{0x17, 0x02211010},
> -		{0x18, 0x01a19030},
> -		{0x1a, 0x01813040},
> -		{0x21, 0x01014020}),
> -	SND_HDA_PIN_QUIRK(0x10ec0867, 0x1028, "Dell", ALC891_FIXUP_DELL_MIC_NO_PRESENCE,
> -		{0x16, 0x01813030},
> -		{0x17, 0x02211010},
> -		{0x18, 0x01a19040},
> -		{0x21, 0x01014020}),
> -	SND_HDA_PIN_QUIRK(0x10ec0662, 0x1028, "Dell", ALC662_FIXUP_DELL_MIC_NO_PRESENCE,
> -		{0x14, 0x01014010},
> -		{0x18, 0x01a19020},
> -		{0x1a, 0x0181302f},
> -		{0x1b, 0x0221401f}),
> -	SND_HDA_PIN_QUIRK(0x10ec0668, 0x1028, "Dell", ALC668_FIXUP_AUTO_MUTE,
> -		{0x12, 0x99a30130},
> -		{0x14, 0x90170110},
> -		{0x15, 0x0321101f},
> -		{0x16, 0x03011020}),
> -	SND_HDA_PIN_QUIRK(0x10ec0668, 0x1028, "Dell", ALC668_FIXUP_AUTO_MUTE,
> -		{0x12, 0x99a30140},
> -		{0x14, 0x90170110},
> -		{0x15, 0x0321101f},
> -		{0x16, 0x03011020}),
> -	SND_HDA_PIN_QUIRK(0x10ec0668, 0x1028, "Dell", ALC668_FIXUP_AUTO_MUTE,
> -		{0x12, 0x99a30150},
> -		{0x14, 0x90170110},
> -		{0x15, 0x0321101f},
> -		{0x16, 0x03011020}),
> -	SND_HDA_PIN_QUIRK(0x10ec0668, 0x1028, "Dell", ALC668_FIXUP_AUTO_MUTE,
> -		{0x14, 0x90170110},
> -		{0x15, 0x0321101f},
> -		{0x16, 0x03011020}),
> -	SND_HDA_PIN_QUIRK(0x10ec0668, 0x1028, "Dell XPS 15", ALC668_FIXUP_AUTO_MUTE,
> -		{0x12, 0x90a60130},
> -		{0x14, 0x90170110},
> -		{0x15, 0x0321101f}),
> -	SND_HDA_PIN_QUIRK(0x10ec0671, 0x103c, "HP cPC", ALC671_FIXUP_HP_HEADSET_MIC2,
> -		{0x14, 0x01014010},
> -		{0x17, 0x90170150},
> -		{0x19, 0x02a11060},
> -		{0x1b, 0x01813030},
> -		{0x21, 0x02211020}),
> -	SND_HDA_PIN_QUIRK(0x10ec0671, 0x103c, "HP cPC", ALC671_FIXUP_HP_HEADSET_MIC2,
> -		{0x14, 0x01014010},
> -		{0x18, 0x01a19040},
> -		{0x1b, 0x01813030},
> -		{0x21, 0x02211020}),
> -	SND_HDA_PIN_QUIRK(0x10ec0671, 0x103c, "HP cPC", ALC671_FIXUP_HP_HEADSET_MIC2,
> -		{0x14, 0x01014020},
> -		{0x17, 0x90170110},
> -		{0x18, 0x01a19050},
> -		{0x1b, 0x01813040},
> -		{0x21, 0x02211030}),
> -	{}
> -};
> -
> -/*
> - */
> -static int patch_alc662(struct hda_codec *codec)
> -{
> -	struct alc_spec *spec;
> -	int err;
> -
> -	err = alc_alloc_spec(codec, 0x0b);
> -	if (err < 0)
> -		return err;
> -
> -	spec = codec->spec;
> -
> -	spec->shutup = alc_eapd_shutup;
> -
> -	/* handle multiple HPs as is */
> -	spec->parse_flags = HDA_PINCFG_NO_HP_FIXUP;
> -
> -	alc_fix_pll_init(codec, 0x20, 0x04, 15);
> -
> -	switch (codec->core.vendor_id) {
> -	case 0x10ec0668:
> -		spec->init_hook = alc668_restore_default_value;
> -		break;
> -	}
> -
> -	alc_pre_init(codec);
> -
> -	snd_hda_pick_fixup(codec, alc662_fixup_models,
> -		       alc662_fixup_tbl, alc662_fixups);
> -	snd_hda_pick_pin_fixup(codec, alc662_pin_fixup_tbl, alc662_fixups, true);
> -	snd_hda_apply_fixup(codec, HDA_FIXUP_ACT_PRE_PROBE);
> -
> -	alc_auto_parse_customize_define(codec);
> -
> -	if (has_cdefine_beep(codec))
> -		spec->gen.beep_nid = 0x01;
> -
> -	if ((alc_get_coef0(codec) & (1 << 14)) &&
> -	    codec->bus->pci && codec->bus->pci->subsystem_vendor == 0x1025 &&
> -	    spec->cdefine.platform_type == 1) {
> -		err = alc_codec_rename(codec, "ALC272X");
> -		if (err < 0)
> -			goto error;
> -	}
> -
> -	/* automatic parse from the BIOS config */
> -	err = alc662_parse_auto_config(codec);
> -	if (err < 0)
> -		goto error;
> -
> -	if (!spec->gen.no_analog && spec->gen.beep_nid) {
> -		switch (codec->core.vendor_id) {
> -		case 0x10ec0662:
> -			err = set_beep_amp(spec, 0x0b, 0x05, HDA_INPUT);
> -			break;
> -		case 0x10ec0272:
> -		case 0x10ec0663:
> -		case 0x10ec0665:
> -		case 0x10ec0668:
> -			err = set_beep_amp(spec, 0x0b, 0x04, HDA_INPUT);
> -			break;
> -		case 0x10ec0273:
> -			err = set_beep_amp(spec, 0x0b, 0x03, HDA_INPUT);
> -			break;
> -		}
> -		if (err < 0)
> -			goto error;
> -	}
> -
> -	snd_hda_apply_fixup(codec, HDA_FIXUP_ACT_PROBE);
> -
> -	return 0;
> -
> - error:
> -	alc_free(codec);
> -	return err;
> -}
> -
> -/*
> - * ALC680 support
> - */
> -
> -static int alc680_parse_auto_config(struct hda_codec *codec)
> -{
> -	return alc_parse_auto_config(codec, NULL, NULL);
> -}
> -
> -/*
> - */
> -static int patch_alc680(struct hda_codec *codec)
> -{
> -	int err;
> -
> -	/* ALC680 has no aa-loopback mixer */
> -	err = alc_alloc_spec(codec, 0);
> -	if (err < 0)
> -		return err;
> -
> -	/* automatic parse from the BIOS config */
> -	err = alc680_parse_auto_config(codec);
> -	if (err < 0) {
> -		alc_free(codec);
> -		return err;
> -	}
> -
> -	return 0;
> -}
> -
> -/*
> - * patch entries
> - */
> -static const struct hda_device_id snd_hda_id_realtek[] = {
> +static const struct hda_device_id snd_hda_id_alc269[] = {
>   	HDA_CODEC_ENTRY(0x10ec0215, "ALC215", patch_alc269),
>   	HDA_CODEC_ENTRY(0x10ec0221, "ALC221", patch_alc269),
>   	HDA_CODEC_ENTRY(0x10ec0222, "ALC222", patch_alc269),
> @@ -13714,13 +8089,8 @@ static const struct hda_device_id snd_hda_id_realtek[] = {
>   	HDA_CODEC_ENTRY(0x10ec0255, "ALC255", patch_alc269),
>   	HDA_CODEC_ENTRY(0x10ec0256, "ALC256", patch_alc269),
>   	HDA_CODEC_ENTRY(0x10ec0257, "ALC257", patch_alc269),
> -	HDA_CODEC_ENTRY(0x10ec0260, "ALC260", patch_alc260),
> -	HDA_CODEC_ENTRY(0x10ec0262, "ALC262", patch_alc262),
> -	HDA_CODEC_ENTRY(0x10ec0267, "ALC267", patch_alc268),
> -	HDA_CODEC_ENTRY(0x10ec0268, "ALC268", patch_alc268),
>   	HDA_CODEC_ENTRY(0x10ec0269, "ALC269", patch_alc269),
>   	HDA_CODEC_ENTRY(0x10ec0270, "ALC270", patch_alc269),
> -	HDA_CODEC_ENTRY(0x10ec0272, "ALC272", patch_alc662),
>   	HDA_CODEC_ENTRY(0x10ec0274, "ALC274", patch_alc269),
>   	HDA_CODEC_ENTRY(0x10ec0275, "ALC275", patch_alc269),
>   	HDA_CODEC_ENTRY(0x10ec0276, "ALC276", patch_alc269),
> @@ -13742,53 +8112,22 @@ static const struct hda_device_id snd_hda_id_realtek[] = {
>   	HDA_CODEC_ENTRY(0x10ec0299, "ALC299", patch_alc269),
>   	HDA_CODEC_ENTRY(0x10ec0300, "ALC300", patch_alc269),
>   	HDA_CODEC_ENTRY(0x10ec0623, "ALC623", patch_alc269),
> -	HDA_CODEC_REV_ENTRY(0x10ec0861, 0x100340, "ALC660", patch_alc861),
> -	HDA_CODEC_ENTRY(0x10ec0660, "ALC660-VD", patch_alc861vd),
> -	HDA_CODEC_ENTRY(0x10ec0861, "ALC861", patch_alc861),
> -	HDA_CODEC_ENTRY(0x10ec0862, "ALC861-VD", patch_alc861vd),
> -	HDA_CODEC_REV_ENTRY(0x10ec0662, 0x100002, "ALC662 rev2", patch_alc882),
> -	HDA_CODEC_REV_ENTRY(0x10ec0662, 0x100101, "ALC662 rev1", patch_alc662),
> -	HDA_CODEC_REV_ENTRY(0x10ec0662, 0x100300, "ALC662 rev3", patch_alc662),
> -	HDA_CODEC_ENTRY(0x10ec0663, "ALC663", patch_alc662),
> -	HDA_CODEC_ENTRY(0x10ec0665, "ALC665", patch_alc662),
> -	HDA_CODEC_ENTRY(0x10ec0667, "ALC667", patch_alc662),
> -	HDA_CODEC_ENTRY(0x10ec0668, "ALC668", patch_alc662),
> -	HDA_CODEC_ENTRY(0x10ec0670, "ALC670", patch_alc662),
> -	HDA_CODEC_ENTRY(0x10ec0671, "ALC671", patch_alc662),
> -	HDA_CODEC_ENTRY(0x10ec0680, "ALC680", patch_alc680),
>   	HDA_CODEC_ENTRY(0x10ec0700, "ALC700", patch_alc269),
>   	HDA_CODEC_ENTRY(0x10ec0701, "ALC701", patch_alc269),
>   	HDA_CODEC_ENTRY(0x10ec0703, "ALC703", patch_alc269),
>   	HDA_CODEC_ENTRY(0x10ec0711, "ALC711", patch_alc269),
> -	HDA_CODEC_ENTRY(0x10ec0867, "ALC891", patch_alc662),
> -	HDA_CODEC_ENTRY(0x10ec0880, "ALC880", patch_alc880),
> -	HDA_CODEC_ENTRY(0x10ec0882, "ALC882", patch_alc882),
> -	HDA_CODEC_ENTRY(0x10ec0883, "ALC883", patch_alc882),
> -	HDA_CODEC_REV_ENTRY(0x10ec0885, 0x100101, "ALC889A", patch_alc882),
> -	HDA_CODEC_REV_ENTRY(0x10ec0885, 0x100103, "ALC889A", patch_alc882),
> -	HDA_CODEC_ENTRY(0x10ec0885, "ALC885", patch_alc882),
> -	HDA_CODEC_ENTRY(0x10ec0887, "ALC887", patch_alc882),
> -	HDA_CODEC_REV_ENTRY(0x10ec0888, 0x100101, "ALC1200", patch_alc882),
> -	HDA_CODEC_ENTRY(0x10ec0888, "ALC888", patch_alc882),
> -	HDA_CODEC_ENTRY(0x10ec0889, "ALC889", patch_alc882),
> -	HDA_CODEC_ENTRY(0x10ec0892, "ALC892", patch_alc662),
> -	HDA_CODEC_ENTRY(0x10ec0897, "ALC897", patch_alc662),
> -	HDA_CODEC_ENTRY(0x10ec0899, "ALC898", patch_alc882),
> -	HDA_CODEC_ENTRY(0x10ec0900, "ALC1150", patch_alc882),
> -	HDA_CODEC_ENTRY(0x10ec0b00, "ALCS1200A", patch_alc882),
> -	HDA_CODEC_ENTRY(0x10ec1168, "ALC1220", patch_alc882),
> -	HDA_CODEC_ENTRY(0x10ec1220, "ALC1220", patch_alc882),
>   	HDA_CODEC_ENTRY(0x19e58326, "HW8326", patch_alc269),
>   	{} /* terminator */
>   };
> -MODULE_DEVICE_TABLE(hdaudio, snd_hda_id_realtek);
> +MODULE_DEVICE_TABLE(hdaudio, snd_hda_id_alc269);
>   
>   MODULE_LICENSE("GPL");
> -MODULE_DESCRIPTION("Realtek HD-audio codec");
> +MODULE_DESCRIPTION("Realtek ALC269 and compatible HD-audio codecs");
> +MODULE_IMPORT_NS("SND_HDA_CODEC_REALTEK");
>   MODULE_IMPORT_NS("SND_HDA_SCODEC_COMPONENT");
>   
> -static struct hda_codec_driver realtek_driver = {
> -	.id = snd_hda_id_realtek,
> +static struct hda_codec_driver alc269_driver = {
> +	.id = snd_hda_id_alc269,
>   };
>   
> -module_hda_codec_driver(realtek_driver);
> +module_hda_codec_driver(alc269_driver);
> diff --git a/sound/hda/codecs/realtek/alc662.c b/sound/hda/codecs/realtek/alc662.c
> new file mode 100644
> index 000000000000..94e4a313e5e2
> --- /dev/null
> +++ b/sound/hda/codecs/realtek/alc662.c
> @@ -0,0 +1,1102 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +//
> +// Realtek ALC662 and compatible codecs
> +//
> +
> +#include <linux/init.h>
> +#include <linux/module.h>
> +#include "realtek.h"
> +
> +/*
> + * ALC662 support
> + *
> + * ALC662 is almost identical with ALC880 but has cleaner and more flexible
> + * configuration.  Each pin widget can choose any input DACs and a mixer.
> + * Each ADC is connected from a mixer of all inputs.  This makes possible
> + * 6-channel independent captures.
> + *
> + * In addition, an independent DAC for the multi-playback (not used in this
> + * driver yet).
> + */
> +
> +/*
> + * BIOS auto configuration
> + */
> +
> +static int alc662_parse_auto_config(struct hda_codec *codec)
> +{
> +	static const hda_nid_t alc662_ignore[] = { 0x1d, 0 };
> +	static const hda_nid_t alc663_ssids[] = { 0x15, 0x1b, 0x14, 0x21 };
> +	static const hda_nid_t alc662_ssids[] = { 0x15, 0x1b, 0x14, 0 };
> +	const hda_nid_t *ssids;
> +
> +	if (codec->core.vendor_id == 0x10ec0272 || codec->core.vendor_id == 0x10ec0663 ||
> +	    codec->core.vendor_id == 0x10ec0665 || codec->core.vendor_id == 0x10ec0670 ||
> +	    codec->core.vendor_id == 0x10ec0671)
> +		ssids = alc663_ssids;
> +	else
> +		ssids = alc662_ssids;
> +	return alc_parse_auto_config(codec, alc662_ignore, ssids);
> +}
> +
> +static void alc272_fixup_mario(struct hda_codec *codec,
> +			       const struct hda_fixup *fix, int action)
> +{
> +	if (action != HDA_FIXUP_ACT_PRE_PROBE)
> +		return;
> +	if (snd_hda_override_amp_caps(codec, 0x2, HDA_OUTPUT,
> +				      (0x3b << AC_AMPCAP_OFFSET_SHIFT) |
> +				      (0x3b << AC_AMPCAP_NUM_STEPS_SHIFT) |
> +				      (0x03 << AC_AMPCAP_STEP_SIZE_SHIFT) |
> +				      (0 << AC_AMPCAP_MUTE_SHIFT)))
> +		codec_warn(codec, "failed to override amp caps for NID 0x2\n");
> +}
> +
> +/* avoid D3 for keeping GPIO up */
> +static unsigned int gpio_led_power_filter(struct hda_codec *codec,
> +					  hda_nid_t nid,
> +					  unsigned int power_state)
> +{
> +	struct alc_spec *spec = codec->spec;
> +	if (nid == codec->core.afg && power_state == AC_PWRST_D3 && spec->gpio_data)
> +		return AC_PWRST_D0;
> +	return power_state;
> +}
> +
> +static void alc662_fixup_led_gpio1(struct hda_codec *codec,
> +				   const struct hda_fixup *fix, int action)
> +{
> +	struct alc_spec *spec = codec->spec;
> +
> +	alc_fixup_hp_gpio_led(codec, action, 0x01, 0);
> +	if (action == HDA_FIXUP_ACT_PRE_PROBE) {
> +		spec->mute_led_polarity = 1;
> +		codec->power_filter = gpio_led_power_filter;
> +	}
> +}
> +
> +static void alc662_usi_automute_hook(struct hda_codec *codec,
> +					 struct hda_jack_callback *jack)
> +{
> +	struct alc_spec *spec = codec->spec;
> +	int vref;
> +	msleep(200);
> +	snd_hda_gen_hp_automute(codec, jack);
> +
> +	vref = spec->gen.hp_jack_present ? PIN_VREF80 : 0;
> +	msleep(100);
> +	snd_hda_codec_write(codec, 0x19, 0, AC_VERB_SET_PIN_WIDGET_CONTROL,
> +			    vref);
> +}
> +
> +static void alc662_fixup_usi_headset_mic(struct hda_codec *codec,
> +				     const struct hda_fixup *fix, int action)
> +{
> +	struct alc_spec *spec = codec->spec;
> +	if (action == HDA_FIXUP_ACT_PRE_PROBE) {
> +		spec->parse_flags |= HDA_PINCFG_HEADSET_MIC;
> +		spec->gen.hp_automute_hook = alc662_usi_automute_hook;
> +	}
> +}
> +
> +static void alc662_aspire_ethos_mute_speakers(struct hda_codec *codec,
> +					struct hda_jack_callback *cb)
> +{
> +	/* surround speakers at 0x1b already get muted automatically when
> +	 * headphones are plugged in, but we have to mute/unmute the remaining
> +	 * channels manually:
> +	 * 0x15 - front left/front right
> +	 * 0x18 - front center/ LFE
> +	 */
> +	if (snd_hda_jack_detect_state(codec, 0x1b) == HDA_JACK_PRESENT) {
> +		snd_hda_set_pin_ctl_cache(codec, 0x15, 0);
> +		snd_hda_set_pin_ctl_cache(codec, 0x18, 0);
> +	} else {
> +		snd_hda_set_pin_ctl_cache(codec, 0x15, PIN_OUT);
> +		snd_hda_set_pin_ctl_cache(codec, 0x18, PIN_OUT);
> +	}
> +}
> +
> +static void alc662_fixup_aspire_ethos_hp(struct hda_codec *codec,
> +					const struct hda_fixup *fix, int action)
> +{
> +    /* Pin 0x1b: shared headphones jack and surround speakers */
> +	if (!is_jack_detectable(codec, 0x1b))
> +		return;
> +
> +	switch (action) {
> +	case HDA_FIXUP_ACT_PRE_PROBE:
> +		snd_hda_jack_detect_enable_callback(codec, 0x1b,
> +				alc662_aspire_ethos_mute_speakers);
> +		/* subwoofer needs an extra GPIO setting to become audible */
> +		alc_setup_gpio(codec, 0x02);
> +		break;
> +	case HDA_FIXUP_ACT_INIT:
> +		/* Make sure to start in a correct state, i.e. if
> +		 * headphones have been plugged in before powering up the system
> +		 */
> +		alc662_aspire_ethos_mute_speakers(codec, NULL);
> +		break;
> +	}
> +}
> +
> +static void alc671_fixup_hp_headset_mic2(struct hda_codec *codec,
> +					     const struct hda_fixup *fix, int action)
> +{
> +	struct alc_spec *spec = codec->spec;
> +
> +	static const struct hda_pintbl pincfgs[] = {
> +		{ 0x19, 0x02a11040 }, /* use as headset mic, with its own jack detect */
> +		{ 0x1b, 0x0181304f },
> +		{ }
> +	};
> +
> +	switch (action) {
> +	case HDA_FIXUP_ACT_PRE_PROBE:
> +		spec->gen.mixer_nid = 0;
> +		spec->parse_flags |= HDA_PINCFG_HEADSET_MIC;
> +		snd_hda_apply_pincfgs(codec, pincfgs);
> +		break;
> +	case HDA_FIXUP_ACT_INIT:
> +		alc_write_coef_idx(codec, 0x19, 0xa054);
> +		break;
> +	}
> +}
> +
> +static void alc897_hp_automute_hook(struct hda_codec *codec,
> +					 struct hda_jack_callback *jack)
> +{
> +	struct alc_spec *spec = codec->spec;
> +	int vref;
> +
> +	snd_hda_gen_hp_automute(codec, jack);
> +	vref = spec->gen.hp_jack_present ? (PIN_HP | AC_PINCTL_VREF_100) : PIN_HP;
> +	snd_hda_set_pin_ctl(codec, 0x1b, vref);
> +}
> +
> +static void alc897_fixup_lenovo_headset_mic(struct hda_codec *codec,
> +				     const struct hda_fixup *fix, int action)
> +{
> +	struct alc_spec *spec = codec->spec;
> +	if (action == HDA_FIXUP_ACT_PRE_PROBE) {
> +		spec->gen.hp_automute_hook = alc897_hp_automute_hook;
> +		spec->no_shutup_pins = 1;
> +	}
> +	if (action == HDA_FIXUP_ACT_PROBE) {
> +		snd_hda_set_pin_ctl_cache(codec, 0x1a, PIN_IN | AC_PINCTL_VREF_100);
> +	}
> +}
> +
> +static void alc897_fixup_lenovo_headset_mode(struct hda_codec *codec,
> +				     const struct hda_fixup *fix, int action)
> +{
> +	struct alc_spec *spec = codec->spec;
> +
> +	if (action == HDA_FIXUP_ACT_PRE_PROBE) {
> +		spec->parse_flags |= HDA_PINCFG_HEADSET_MIC;
> +		spec->gen.hp_automute_hook = alc897_hp_automute_hook;
> +	}
> +}
> +
> +static const struct coef_fw alc668_coefs[] = {
> +	WRITE_COEF(0x01, 0xbebe), WRITE_COEF(0x02, 0xaaaa), WRITE_COEF(0x03,    0x0),
> +	WRITE_COEF(0x04, 0x0180), WRITE_COEF(0x06,    0x0), WRITE_COEF(0x07, 0x0f80),
> +	WRITE_COEF(0x08, 0x0031), WRITE_COEF(0x0a, 0x0060), WRITE_COEF(0x0b,    0x0),
> +	WRITE_COEF(0x0c, 0x7cf7), WRITE_COEF(0x0d, 0x1080), WRITE_COEF(0x0e, 0x7f7f),
> +	WRITE_COEF(0x0f, 0xcccc), WRITE_COEF(0x10, 0xddcc), WRITE_COEF(0x11, 0x0001),
> +	WRITE_COEF(0x13,    0x0), WRITE_COEF(0x14, 0x2aa0), WRITE_COEF(0x17, 0xa940),
> +	WRITE_COEF(0x19,    0x0), WRITE_COEF(0x1a,    0x0), WRITE_COEF(0x1b,    0x0),
> +	WRITE_COEF(0x1c,    0x0), WRITE_COEF(0x1d,    0x0), WRITE_COEF(0x1e, 0x7418),
> +	WRITE_COEF(0x1f, 0x0804), WRITE_COEF(0x20, 0x4200), WRITE_COEF(0x21, 0x0468),
> +	WRITE_COEF(0x22, 0x8ccc), WRITE_COEF(0x23, 0x0250), WRITE_COEF(0x24, 0x7418),
> +	WRITE_COEF(0x27,    0x0), WRITE_COEF(0x28, 0x8ccc), WRITE_COEF(0x2a, 0xff00),
> +	WRITE_COEF(0x2b, 0x8000), WRITE_COEF(0xa7, 0xff00), WRITE_COEF(0xa8, 0x8000),
> +	WRITE_COEF(0xaa, 0x2e17), WRITE_COEF(0xab, 0xa0c0), WRITE_COEF(0xac,    0x0),
> +	WRITE_COEF(0xad,    0x0), WRITE_COEF(0xae, 0x2ac6), WRITE_COEF(0xaf, 0xa480),
> +	WRITE_COEF(0xb0,    0x0), WRITE_COEF(0xb1,    0x0), WRITE_COEF(0xb2,    0x0),
> +	WRITE_COEF(0xb3,    0x0), WRITE_COEF(0xb4,    0x0), WRITE_COEF(0xb5, 0x1040),
> +	WRITE_COEF(0xb6, 0xd697), WRITE_COEF(0xb7, 0x902b), WRITE_COEF(0xb8, 0xd697),
> +	WRITE_COEF(0xb9, 0x902b), WRITE_COEF(0xba, 0xb8ba), WRITE_COEF(0xbb, 0xaaab),
> +	WRITE_COEF(0xbc, 0xaaaf), WRITE_COEF(0xbd, 0x6aaa), WRITE_COEF(0xbe, 0x1c02),
> +	WRITE_COEF(0xc0, 0x00ff), WRITE_COEF(0xc1, 0x0fa6),
> +	{}
> +};
> +
> +static void alc668_restore_default_value(struct hda_codec *codec)
> +{
> +	alc_process_coef_fw(codec, alc668_coefs);
> +}
> +
> +static void alc_fixup_headset_mode_alc662(struct hda_codec *codec,
> +				const struct hda_fixup *fix, int action)
> +{
> +	struct alc_spec *spec = codec->spec;
> +
> +	if (action == HDA_FIXUP_ACT_PRE_PROBE) {
> +		spec->parse_flags |= HDA_PINCFG_HEADSET_MIC;
> +		spec->gen.hp_mic = 1; /* Mic-in is same pin as headphone */
> +
> +		/* Disable boost for mic-in permanently. (This code is only called
> +		   from quirks that guarantee that the headphone is at NID 0x1b.) */
> +		snd_hda_codec_write(codec, 0x1b, 0, AC_VERB_SET_AMP_GAIN_MUTE, 0x7000);
> +		snd_hda_override_wcaps(codec, 0x1b, get_wcaps(codec, 0x1b) & ~AC_WCAP_IN_AMP);
> +	} else
> +		alc_fixup_headset_mode(codec, fix, action);
> +}
> +
> +static void alc_fixup_headset_mode_alc668(struct hda_codec *codec,
> +				const struct hda_fixup *fix, int action)
> +{
> +	if (action == HDA_FIXUP_ACT_PRE_PROBE) {
> +		alc_write_coef_idx(codec, 0xc4, 0x8000);
> +		alc_update_coef_idx(codec, 0xc2, ~0xfe, 0);
> +		snd_hda_set_pin_ctl_cache(codec, 0x18, 0);
> +	}
> +	alc_fixup_headset_mode(codec, fix, action);
> +}
> +
> +enum {
> +	ALC662_FIXUP_ASPIRE,
> +	ALC662_FIXUP_LED_GPIO1,
> +	ALC662_FIXUP_IDEAPAD,
> +	ALC272_FIXUP_MARIO,
> +	ALC662_FIXUP_CZC_ET26,
> +	ALC662_FIXUP_CZC_P10T,
> +	ALC662_FIXUP_SKU_IGNORE,
> +	ALC662_FIXUP_HP_RP5800,
> +	ALC662_FIXUP_ASUS_MODE1,
> +	ALC662_FIXUP_ASUS_MODE2,
> +	ALC662_FIXUP_ASUS_MODE3,
> +	ALC662_FIXUP_ASUS_MODE4,
> +	ALC662_FIXUP_ASUS_MODE5,
> +	ALC662_FIXUP_ASUS_MODE6,
> +	ALC662_FIXUP_ASUS_MODE7,
> +	ALC662_FIXUP_ASUS_MODE8,
> +	ALC662_FIXUP_NO_JACK_DETECT,
> +	ALC662_FIXUP_ZOTAC_Z68,
> +	ALC662_FIXUP_INV_DMIC,
> +	ALC662_FIXUP_DELL_MIC_NO_PRESENCE,
> +	ALC668_FIXUP_DELL_MIC_NO_PRESENCE,
> +	ALC662_FIXUP_HEADSET_MODE,
> +	ALC668_FIXUP_HEADSET_MODE,
> +	ALC662_FIXUP_BASS_MODE4_CHMAP,
> +	ALC662_FIXUP_BASS_16,
> +	ALC662_FIXUP_BASS_1A,
> +	ALC662_FIXUP_BASS_CHMAP,
> +	ALC668_FIXUP_AUTO_MUTE,
> +	ALC668_FIXUP_DELL_DISABLE_AAMIX,
> +	ALC668_FIXUP_DELL_XPS13,
> +	ALC662_FIXUP_ASUS_Nx50,
> +	ALC668_FIXUP_ASUS_Nx51_HEADSET_MODE,
> +	ALC668_FIXUP_ASUS_Nx51,
> +	ALC668_FIXUP_MIC_COEF,
> +	ALC668_FIXUP_ASUS_G751,
> +	ALC891_FIXUP_HEADSET_MODE,
> +	ALC891_FIXUP_DELL_MIC_NO_PRESENCE,
> +	ALC662_FIXUP_ACER_VERITON,
> +	ALC892_FIXUP_ASROCK_MOBO,
> +	ALC662_FIXUP_USI_FUNC,
> +	ALC662_FIXUP_USI_HEADSET_MODE,
> +	ALC662_FIXUP_LENOVO_MULTI_CODECS,
> +	ALC669_FIXUP_ACER_ASPIRE_ETHOS,
> +	ALC669_FIXUP_ACER_ASPIRE_ETHOS_HEADSET,
> +	ALC671_FIXUP_HP_HEADSET_MIC2,
> +	ALC662_FIXUP_ACER_X2660G_HEADSET_MODE,
> +	ALC662_FIXUP_ACER_NITRO_HEADSET_MODE,
> +	ALC668_FIXUP_ASUS_NO_HEADSET_MIC,
> +	ALC668_FIXUP_HEADSET_MIC,
> +	ALC668_FIXUP_MIC_DET_COEF,
> +	ALC897_FIXUP_LENOVO_HEADSET_MIC,
> +	ALC897_FIXUP_HEADSET_MIC_PIN,
> +	ALC897_FIXUP_HP_HSMIC_VERB,
> +	ALC897_FIXUP_LENOVO_HEADSET_MODE,
> +	ALC897_FIXUP_HEADSET_MIC_PIN2,
> +	ALC897_FIXUP_UNIS_H3C_X500S,
> +	ALC897_FIXUP_HEADSET_MIC_PIN3,
> +};
> +
> +static const struct hda_fixup alc662_fixups[] = {
> +	[ALC662_FIXUP_ASPIRE] = {
> +		.type = HDA_FIXUP_PINS,
> +		.v.pins = (const struct hda_pintbl[]) {
> +			{ 0x15, 0x99130112 }, /* subwoofer */
> +			{ }
> +		}
> +	},
> +	[ALC662_FIXUP_LED_GPIO1] = {
> +		.type = HDA_FIXUP_FUNC,
> +		.v.func = alc662_fixup_led_gpio1,
> +	},
> +	[ALC662_FIXUP_IDEAPAD] = {
> +		.type = HDA_FIXUP_PINS,
> +		.v.pins = (const struct hda_pintbl[]) {
> +			{ 0x17, 0x99130112 }, /* subwoofer */
> +			{ }
> +		},
> +		.chained = true,
> +		.chain_id = ALC662_FIXUP_LED_GPIO1,
> +	},
> +	[ALC272_FIXUP_MARIO] = {
> +		.type = HDA_FIXUP_FUNC,
> +		.v.func = alc272_fixup_mario,
> +	},
> +	[ALC662_FIXUP_CZC_ET26] = {
> +		.type = HDA_FIXUP_PINS,
> +		.v.pins = (const struct hda_pintbl[]) {
> +			{0x12, 0x403cc000},
> +			{0x14, 0x90170110}, /* speaker */
> +			{0x15, 0x411111f0},
> +			{0x16, 0x411111f0},
> +			{0x18, 0x01a19030}, /* mic */
> +			{0x19, 0x90a7013f}, /* int-mic */
> +			{0x1a, 0x01014020},
> +			{0x1b, 0x0121401f},
> +			{0x1c, 0x411111f0},
> +			{0x1d, 0x411111f0},
> +			{0x1e, 0x40478e35},
> +			{}
> +		},
> +		.chained = true,
> +		.chain_id = ALC662_FIXUP_SKU_IGNORE
> +	},
> +	[ALC662_FIXUP_CZC_P10T] = {
> +		.type = HDA_FIXUP_VERBS,
> +		.v.verbs = (const struct hda_verb[]) {
> +			{0x14, AC_VERB_SET_EAPD_BTLENABLE, 0},
> +			{}
> +		}
> +	},
> +	[ALC662_FIXUP_SKU_IGNORE] = {
> +		.type = HDA_FIXUP_FUNC,
> +		.v.func = alc_fixup_sku_ignore,
> +	},
> +	[ALC662_FIXUP_HP_RP5800] = {
> +		.type = HDA_FIXUP_PINS,
> +		.v.pins = (const struct hda_pintbl[]) {
> +			{ 0x14, 0x0221201f }, /* HP out */
> +			{ }
> +		},
> +		.chained = true,
> +		.chain_id = ALC662_FIXUP_SKU_IGNORE
> +	},
> +	[ALC662_FIXUP_ASUS_MODE1] = {
> +		.type = HDA_FIXUP_PINS,
> +		.v.pins = (const struct hda_pintbl[]) {
> +			{ 0x14, 0x99130110 }, /* speaker */
> +			{ 0x18, 0x01a19c20 }, /* mic */
> +			{ 0x19, 0x99a3092f }, /* int-mic */
> +			{ 0x21, 0x0121401f }, /* HP out */
> +			{ }
> +		},
> +		.chained = true,
> +		.chain_id = ALC662_FIXUP_SKU_IGNORE
> +	},
> +	[ALC662_FIXUP_ASUS_MODE2] = {
> +		.type = HDA_FIXUP_PINS,
> +		.v.pins = (const struct hda_pintbl[]) {
> +			{ 0x14, 0x99130110 }, /* speaker */
> +			{ 0x18, 0x01a19820 }, /* mic */
> +			{ 0x19, 0x99a3092f }, /* int-mic */
> +			{ 0x1b, 0x0121401f }, /* HP out */
> +			{ }
> +		},
> +		.chained = true,
> +		.chain_id = ALC662_FIXUP_SKU_IGNORE
> +	},
> +	[ALC662_FIXUP_ASUS_MODE3] = {
> +		.type = HDA_FIXUP_PINS,
> +		.v.pins = (const struct hda_pintbl[]) {
> +			{ 0x14, 0x99130110 }, /* speaker */
> +			{ 0x15, 0x0121441f }, /* HP */
> +			{ 0x18, 0x01a19840 }, /* mic */
> +			{ 0x19, 0x99a3094f }, /* int-mic */
> +			{ 0x21, 0x01211420 }, /* HP2 */
> +			{ }
> +		},
> +		.chained = true,
> +		.chain_id = ALC662_FIXUP_SKU_IGNORE
> +	},
> +	[ALC662_FIXUP_ASUS_MODE4] = {
> +		.type = HDA_FIXUP_PINS,
> +		.v.pins = (const struct hda_pintbl[]) {
> +			{ 0x14, 0x99130110 }, /* speaker */
> +			{ 0x16, 0x99130111 }, /* speaker */
> +			{ 0x18, 0x01a19840 }, /* mic */
> +			{ 0x19, 0x99a3094f }, /* int-mic */
> +			{ 0x21, 0x0121441f }, /* HP */
> +			{ }
> +		},
> +		.chained = true,
> +		.chain_id = ALC662_FIXUP_SKU_IGNORE
> +	},
> +	[ALC662_FIXUP_ASUS_MODE5] = {
> +		.type = HDA_FIXUP_PINS,
> +		.v.pins = (const struct hda_pintbl[]) {
> +			{ 0x14, 0x99130110 }, /* speaker */
> +			{ 0x15, 0x0121441f }, /* HP */
> +			{ 0x16, 0x99130111 }, /* speaker */
> +			{ 0x18, 0x01a19840 }, /* mic */
> +			{ 0x19, 0x99a3094f }, /* int-mic */
> +			{ }
> +		},
> +		.chained = true,
> +		.chain_id = ALC662_FIXUP_SKU_IGNORE
> +	},
> +	[ALC662_FIXUP_ASUS_MODE6] = {
> +		.type = HDA_FIXUP_PINS,
> +		.v.pins = (const struct hda_pintbl[]) {
> +			{ 0x14, 0x99130110 }, /* speaker */
> +			{ 0x15, 0x01211420 }, /* HP2 */
> +			{ 0x18, 0x01a19840 }, /* mic */
> +			{ 0x19, 0x99a3094f }, /* int-mic */
> +			{ 0x1b, 0x0121441f }, /* HP */
> +			{ }
> +		},
> +		.chained = true,
> +		.chain_id = ALC662_FIXUP_SKU_IGNORE
> +	},
> +	[ALC662_FIXUP_ASUS_MODE7] = {
> +		.type = HDA_FIXUP_PINS,
> +		.v.pins = (const struct hda_pintbl[]) {
> +			{ 0x14, 0x99130110 }, /* speaker */
> +			{ 0x17, 0x99130111 }, /* speaker */
> +			{ 0x18, 0x01a19840 }, /* mic */
> +			{ 0x19, 0x99a3094f }, /* int-mic */
> +			{ 0x1b, 0x01214020 }, /* HP */
> +			{ 0x21, 0x0121401f }, /* HP */
> +			{ }
> +		},
> +		.chained = true,
> +		.chain_id = ALC662_FIXUP_SKU_IGNORE
> +	},
> +	[ALC662_FIXUP_ASUS_MODE8] = {
> +		.type = HDA_FIXUP_PINS,
> +		.v.pins = (const struct hda_pintbl[]) {
> +			{ 0x14, 0x99130110 }, /* speaker */
> +			{ 0x12, 0x99a30970 }, /* int-mic */
> +			{ 0x15, 0x01214020 }, /* HP */
> +			{ 0x17, 0x99130111 }, /* speaker */
> +			{ 0x18, 0x01a19840 }, /* mic */
> +			{ 0x21, 0x0121401f }, /* HP */
> +			{ }
> +		},
> +		.chained = true,
> +		.chain_id = ALC662_FIXUP_SKU_IGNORE
> +	},
> +	[ALC662_FIXUP_NO_JACK_DETECT] = {
> +		.type = HDA_FIXUP_FUNC,
> +		.v.func = alc_fixup_no_jack_detect,
> +	},
> +	[ALC662_FIXUP_ZOTAC_Z68] = {
> +		.type = HDA_FIXUP_PINS,
> +		.v.pins = (const struct hda_pintbl[]) {
> +			{ 0x1b, 0x02214020 }, /* Front HP */
> +			{ }
> +		}
> +	},
> +	[ALC662_FIXUP_INV_DMIC] = {
> +		.type = HDA_FIXUP_FUNC,
> +		.v.func = alc_fixup_inv_dmic,
> +	},
> +	[ALC668_FIXUP_DELL_XPS13] = {
> +		.type = HDA_FIXUP_FUNC,
> +		.v.func = alc_fixup_dell_xps13,
> +		.chained = true,
> +		.chain_id = ALC668_FIXUP_DELL_DISABLE_AAMIX
> +	},
> +	[ALC668_FIXUP_DELL_DISABLE_AAMIX] = {
> +		.type = HDA_FIXUP_FUNC,
> +		.v.func = alc_fixup_disable_aamix,
> +		.chained = true,
> +		.chain_id = ALC668_FIXUP_DELL_MIC_NO_PRESENCE
> +	},
> +	[ALC668_FIXUP_AUTO_MUTE] = {
> +		.type = HDA_FIXUP_FUNC,
> +		.v.func = alc_fixup_auto_mute_via_amp,
> +		.chained = true,
> +		.chain_id = ALC668_FIXUP_DELL_MIC_NO_PRESENCE
> +	},
> +	[ALC662_FIXUP_DELL_MIC_NO_PRESENCE] = {
> +		.type = HDA_FIXUP_PINS,
> +		.v.pins = (const struct hda_pintbl[]) {
> +			{ 0x19, 0x03a1113c }, /* use as headset mic, without its own jack detect */
> +			/* headphone mic by setting pin control of 0x1b (headphone out) to in + vref_50 */
> +			{ }
> +		},
> +		.chained = true,
> +		.chain_id = ALC662_FIXUP_HEADSET_MODE
> +	},
> +	[ALC662_FIXUP_HEADSET_MODE] = {
> +		.type = HDA_FIXUP_FUNC,
> +		.v.func = alc_fixup_headset_mode_alc662,
> +	},
> +	[ALC668_FIXUP_DELL_MIC_NO_PRESENCE] = {
> +		.type = HDA_FIXUP_PINS,
> +		.v.pins = (const struct hda_pintbl[]) {
> +			{ 0x19, 0x03a1913d }, /* use as headphone mic, without its own jack detect */
> +			{ 0x1b, 0x03a1113c }, /* use as headset mic, without its own jack detect */
> +			{ }
> +		},
> +		.chained = true,
> +		.chain_id = ALC668_FIXUP_HEADSET_MODE
> +	},
> +	[ALC668_FIXUP_HEADSET_MODE] = {
> +		.type = HDA_FIXUP_FUNC,
> +		.v.func = alc_fixup_headset_mode_alc668,
> +	},
> +	[ALC662_FIXUP_BASS_MODE4_CHMAP] = {
> +		.type = HDA_FIXUP_FUNC,
> +		.v.func = alc_fixup_bass_chmap,
> +		.chained = true,
> +		.chain_id = ALC662_FIXUP_ASUS_MODE4
> +	},
> +	[ALC662_FIXUP_BASS_16] = {
> +		.type = HDA_FIXUP_PINS,
> +		.v.pins = (const struct hda_pintbl[]) {
> +			{0x16, 0x80106111}, /* bass speaker */
> +			{}
> +		},
> +		.chained = true,
> +		.chain_id = ALC662_FIXUP_BASS_CHMAP,
> +	},
> +	[ALC662_FIXUP_BASS_1A] = {
> +		.type = HDA_FIXUP_PINS,
> +		.v.pins = (const struct hda_pintbl[]) {
> +			{0x1a, 0x80106111}, /* bass speaker */
> +			{}
> +		},
> +		.chained = true,
> +		.chain_id = ALC662_FIXUP_BASS_CHMAP,
> +	},
> +	[ALC662_FIXUP_BASS_CHMAP] = {
> +		.type = HDA_FIXUP_FUNC,
> +		.v.func = alc_fixup_bass_chmap,
> +	},
> +	[ALC662_FIXUP_ASUS_Nx50] = {
> +		.type = HDA_FIXUP_FUNC,
> +		.v.func = alc_fixup_auto_mute_via_amp,
> +		.chained = true,
> +		.chain_id = ALC662_FIXUP_BASS_1A
> +	},
> +	[ALC668_FIXUP_ASUS_Nx51_HEADSET_MODE] = {
> +		.type = HDA_FIXUP_FUNC,
> +		.v.func = alc_fixup_headset_mode_alc668,
> +		.chain_id = ALC662_FIXUP_BASS_CHMAP
> +	},
> +	[ALC668_FIXUP_ASUS_Nx51] = {
> +		.type = HDA_FIXUP_PINS,
> +		.v.pins = (const struct hda_pintbl[]) {
> +			{ 0x19, 0x03a1913d }, /* use as headphone mic, without its own jack detect */
> +			{ 0x1a, 0x90170151 }, /* bass speaker */
> +			{ 0x1b, 0x03a1113c }, /* use as headset mic, without its own jack detect */
> +			{}
> +		},
> +		.chained = true,
> +		.chain_id = ALC668_FIXUP_ASUS_Nx51_HEADSET_MODE,
> +	},
> +	[ALC668_FIXUP_MIC_COEF] = {
> +		.type = HDA_FIXUP_VERBS,
> +		.v.verbs = (const struct hda_verb[]) {
> +			{ 0x20, AC_VERB_SET_COEF_INDEX, 0xc3 },
> +			{ 0x20, AC_VERB_SET_PROC_COEF, 0x4000 },
> +			{}
> +		},
> +	},
> +	[ALC668_FIXUP_ASUS_G751] = {
> +		.type = HDA_FIXUP_PINS,
> +		.v.pins = (const struct hda_pintbl[]) {
> +			{ 0x16, 0x0421101f }, /* HP */
> +			{}
> +		},
> +		.chained = true,
> +		.chain_id = ALC668_FIXUP_MIC_COEF
> +	},
> +	[ALC891_FIXUP_HEADSET_MODE] = {
> +		.type = HDA_FIXUP_FUNC,
> +		.v.func = alc_fixup_headset_mode,
> +	},
> +	[ALC891_FIXUP_DELL_MIC_NO_PRESENCE] = {
> +		.type = HDA_FIXUP_PINS,
> +		.v.pins = (const struct hda_pintbl[]) {
> +			{ 0x19, 0x03a1913d }, /* use as headphone mic, without its own jack detect */
> +			{ 0x1b, 0x03a1113c }, /* use as headset mic, without its own jack detect */
> +			{ }
> +		},
> +		.chained = true,
> +		.chain_id = ALC891_FIXUP_HEADSET_MODE
> +	},
> +	[ALC662_FIXUP_ACER_VERITON] = {
> +		.type = HDA_FIXUP_PINS,
> +		.v.pins = (const struct hda_pintbl[]) {
> +			{ 0x15, 0x50170120 }, /* no internal speaker */
> +			{ }
> +		}
> +	},
> +	[ALC892_FIXUP_ASROCK_MOBO] = {
> +		.type = HDA_FIXUP_PINS,
> +		.v.pins = (const struct hda_pintbl[]) {
> +			{ 0x15, 0x40f000f0 }, /* disabled */
> +			{ 0x16, 0x40f000f0 }, /* disabled */
> +			{ }
> +		}
> +	},
> +	[ALC662_FIXUP_USI_FUNC] = {
> +		.type = HDA_FIXUP_FUNC,
> +		.v.func = alc662_fixup_usi_headset_mic,
> +	},
> +	[ALC662_FIXUP_USI_HEADSET_MODE] = {
> +		.type = HDA_FIXUP_PINS,
> +		.v.pins = (const struct hda_pintbl[]) {
> +			{ 0x19, 0x02a1913c }, /* use as headset mic, without its own jack detect */
> +			{ 0x18, 0x01a1903d },
> +			{ }
> +		},
> +		.chained = true,
> +		.chain_id = ALC662_FIXUP_USI_FUNC
> +	},
> +	[ALC662_FIXUP_LENOVO_MULTI_CODECS] = {
> +		.type = HDA_FIXUP_FUNC,
> +		.v.func = alc233_alc662_fixup_lenovo_dual_codecs,
> +	},
> +	[ALC669_FIXUP_ACER_ASPIRE_ETHOS_HEADSET] = {
> +		.type = HDA_FIXUP_FUNC,
> +		.v.func = alc662_fixup_aspire_ethos_hp,
> +	},
> +	[ALC669_FIXUP_ACER_ASPIRE_ETHOS] = {
> +		.type = HDA_FIXUP_PINS,
> +		.v.pins = (const struct hda_pintbl[]) {
> +			{ 0x15, 0x92130110 }, /* front speakers */
> +			{ 0x18, 0x99130111 }, /* center/subwoofer */
> +			{ 0x1b, 0x11130012 }, /* surround plus jack for HP */
> +			{ }
> +		},
> +		.chained = true,
> +		.chain_id = ALC669_FIXUP_ACER_ASPIRE_ETHOS_HEADSET
> +	},
> +	[ALC671_FIXUP_HP_HEADSET_MIC2] = {
> +		.type = HDA_FIXUP_FUNC,
> +		.v.func = alc671_fixup_hp_headset_mic2,
> +	},
> +	[ALC662_FIXUP_ACER_X2660G_HEADSET_MODE] = {
> +		.type = HDA_FIXUP_PINS,
> +		.v.pins = (const struct hda_pintbl[]) {
> +			{ 0x1a, 0x02a1113c }, /* use as headset mic, without its own jack detect */
> +			{ }
> +		},
> +		.chained = true,
> +		.chain_id = ALC662_FIXUP_USI_FUNC
> +	},
> +	[ALC662_FIXUP_ACER_NITRO_HEADSET_MODE] = {
> +		.type = HDA_FIXUP_PINS,
> +		.v.pins = (const struct hda_pintbl[]) {
> +			{ 0x1a, 0x01a11140 }, /* use as headset mic, without its own jack detect */
> +			{ 0x1b, 0x0221144f },
> +			{ }
> +		},
> +		.chained = true,
> +		.chain_id = ALC662_FIXUP_USI_FUNC
> +	},
> +	[ALC668_FIXUP_ASUS_NO_HEADSET_MIC] = {
> +		.type = HDA_FIXUP_PINS,
> +		.v.pins = (const struct hda_pintbl[]) {
> +			{ 0x1b, 0x04a1112c },
> +			{ }
> +		},
> +		.chained = true,
> +		.chain_id = ALC668_FIXUP_HEADSET_MIC
> +	},
> +	[ALC668_FIXUP_HEADSET_MIC] = {
> +		.type = HDA_FIXUP_FUNC,
> +		.v.func = alc_fixup_headset_mic,
> +		.chained = true,
> +		.chain_id = ALC668_FIXUP_MIC_DET_COEF
> +	},
> +	[ALC668_FIXUP_MIC_DET_COEF] = {
> +		.type = HDA_FIXUP_VERBS,
> +		.v.verbs = (const struct hda_verb[]) {
> +			{ 0x20, AC_VERB_SET_COEF_INDEX, 0x15 },
> +			{ 0x20, AC_VERB_SET_PROC_COEF, 0x0d60 },
> +			{}
> +		},
> +	},
> +	[ALC897_FIXUP_LENOVO_HEADSET_MIC] = {
> +		.type = HDA_FIXUP_FUNC,
> +		.v.func = alc897_fixup_lenovo_headset_mic,
> +	},
> +	[ALC897_FIXUP_HEADSET_MIC_PIN] = {
> +		.type = HDA_FIXUP_PINS,
> +		.v.pins = (const struct hda_pintbl[]) {
> +			{ 0x1a, 0x03a11050 },
> +			{ }
> +		},
> +		.chained = true,
> +		.chain_id = ALC897_FIXUP_LENOVO_HEADSET_MIC
> +	},
> +	[ALC897_FIXUP_HP_HSMIC_VERB] = {
> +		.type = HDA_FIXUP_PINS,
> +		.v.pins = (const struct hda_pintbl[]) {
> +			{ 0x19, 0x01a1913c }, /* use as headset mic, without its own jack detect */
> +			{ }
> +		},
> +	},
> +	[ALC897_FIXUP_LENOVO_HEADSET_MODE] = {
> +		.type = HDA_FIXUP_FUNC,
> +		.v.func = alc897_fixup_lenovo_headset_mode,
> +	},
> +	[ALC897_FIXUP_HEADSET_MIC_PIN2] = {
> +		.type = HDA_FIXUP_PINS,
> +		.v.pins = (const struct hda_pintbl[]) {
> +			{ 0x1a, 0x01a11140 }, /* use as headset mic, without its own jack detect */
> +			{ }
> +		},
> +		.chained = true,
> +		.chain_id = ALC897_FIXUP_LENOVO_HEADSET_MODE
> +	},
> +	[ALC897_FIXUP_UNIS_H3C_X500S] = {
> +		.type = HDA_FIXUP_VERBS,
> +		.v.verbs = (const struct hda_verb[]) {
> +			{ 0x14, AC_VERB_SET_EAPD_BTLENABLE, 0 },
> +			{}
> +		},
> +	},
> +	[ALC897_FIXUP_HEADSET_MIC_PIN3] = {
> +		.type = HDA_FIXUP_PINS,
> +		.v.pins = (const struct hda_pintbl[]) {
> +			{ 0x19, 0x03a11050 }, /* use as headset mic */
> +			{ }
> +		},
> +	},
> +};
> +
> +static const struct hda_quirk alc662_fixup_tbl[] = {
> +	SND_PCI_QUIRK(0x1019, 0x9087, "ECS", ALC662_FIXUP_ASUS_MODE2),
> +	SND_PCI_QUIRK(0x1019, 0x9859, "JP-IK LEAP W502", ALC897_FIXUP_HEADSET_MIC_PIN3),
> +	SND_PCI_QUIRK(0x1025, 0x022f, "Acer Aspire One", ALC662_FIXUP_INV_DMIC),
> +	SND_PCI_QUIRK(0x1025, 0x0241, "Packard Bell DOTS", ALC662_FIXUP_INV_DMIC),
> +	SND_PCI_QUIRK(0x1025, 0x0308, "Acer Aspire 8942G", ALC662_FIXUP_ASPIRE),
> +	SND_PCI_QUIRK(0x1025, 0x031c, "Gateway NV79", ALC662_FIXUP_SKU_IGNORE),
> +	SND_PCI_QUIRK(0x1025, 0x0349, "eMachines eM250", ALC662_FIXUP_INV_DMIC),
> +	SND_PCI_QUIRK(0x1025, 0x034a, "Gateway LT27", ALC662_FIXUP_INV_DMIC),
> +	SND_PCI_QUIRK(0x1025, 0x038b, "Acer Aspire 8943G", ALC662_FIXUP_ASPIRE),
> +	SND_PCI_QUIRK(0x1025, 0x0566, "Acer Aspire Ethos 8951G", ALC669_FIXUP_ACER_ASPIRE_ETHOS),
> +	SND_PCI_QUIRK(0x1025, 0x123c, "Acer Nitro N50-600", ALC662_FIXUP_ACER_NITRO_HEADSET_MODE),
> +	SND_PCI_QUIRK(0x1025, 0x124e, "Acer 2660G", ALC662_FIXUP_ACER_X2660G_HEADSET_MODE),
> +	SND_PCI_QUIRK(0x1028, 0x05d8, "Dell", ALC668_FIXUP_DELL_MIC_NO_PRESENCE),
> +	SND_PCI_QUIRK(0x1028, 0x05db, "Dell", ALC668_FIXUP_DELL_MIC_NO_PRESENCE),
> +	SND_PCI_QUIRK(0x1028, 0x05fe, "Dell XPS 15", ALC668_FIXUP_DELL_XPS13),
> +	SND_PCI_QUIRK(0x1028, 0x060a, "Dell XPS 13", ALC668_FIXUP_DELL_XPS13),
> +	SND_PCI_QUIRK(0x1028, 0x060d, "Dell M3800", ALC668_FIXUP_DELL_XPS13),
> +	SND_PCI_QUIRK(0x1028, 0x0625, "Dell", ALC668_FIXUP_DELL_MIC_NO_PRESENCE),
> +	SND_PCI_QUIRK(0x1028, 0x0626, "Dell", ALC668_FIXUP_DELL_MIC_NO_PRESENCE),
> +	SND_PCI_QUIRK(0x1028, 0x0696, "Dell", ALC668_FIXUP_DELL_MIC_NO_PRESENCE),
> +	SND_PCI_QUIRK(0x1028, 0x0698, "Dell", ALC668_FIXUP_DELL_MIC_NO_PRESENCE),
> +	SND_PCI_QUIRK(0x1028, 0x069f, "Dell", ALC668_FIXUP_DELL_MIC_NO_PRESENCE),
> +	SND_PCI_QUIRK(0x103c, 0x1632, "HP RP5800", ALC662_FIXUP_HP_RP5800),
> +	SND_PCI_QUIRK(0x103c, 0x870c, "HP", ALC897_FIXUP_HP_HSMIC_VERB),
> +	SND_PCI_QUIRK(0x103c, 0x8719, "HP", ALC897_FIXUP_HP_HSMIC_VERB),
> +	SND_PCI_QUIRK(0x103c, 0x872b, "HP", ALC897_FIXUP_HP_HSMIC_VERB),
> +	SND_PCI_QUIRK(0x103c, 0x873e, "HP", ALC671_FIXUP_HP_HEADSET_MIC2),
> +	SND_PCI_QUIRK(0x103c, 0x8768, "HP Slim Desktop S01", ALC671_FIXUP_HP_HEADSET_MIC2),
> +	SND_PCI_QUIRK(0x103c, 0x877e, "HP 288 Pro G6", ALC671_FIXUP_HP_HEADSET_MIC2),
> +	SND_PCI_QUIRK(0x103c, 0x885f, "HP 288 Pro G8", ALC671_FIXUP_HP_HEADSET_MIC2),
> +	SND_PCI_QUIRK(0x1043, 0x1080, "Asus UX501VW", ALC668_FIXUP_HEADSET_MODE),
> +	SND_PCI_QUIRK(0x1043, 0x11cd, "Asus N550", ALC662_FIXUP_ASUS_Nx50),
> +	SND_PCI_QUIRK(0x1043, 0x129d, "Asus N750", ALC662_FIXUP_ASUS_Nx50),
> +	SND_PCI_QUIRK(0x1043, 0x12ff, "ASUS G751", ALC668_FIXUP_ASUS_G751),
> +	SND_PCI_QUIRK(0x1043, 0x13df, "Asus N550JX", ALC662_FIXUP_BASS_1A),
> +	SND_PCI_QUIRK(0x1043, 0x1477, "ASUS N56VZ", ALC662_FIXUP_BASS_MODE4_CHMAP),
> +	SND_PCI_QUIRK(0x1043, 0x15a7, "ASUS UX51VZH", ALC662_FIXUP_BASS_16),
> +	SND_PCI_QUIRK(0x1043, 0x177d, "ASUS N551", ALC668_FIXUP_ASUS_Nx51),
> +	SND_PCI_QUIRK(0x1043, 0x17bd, "ASUS N751", ALC668_FIXUP_ASUS_Nx51),
> +	SND_PCI_QUIRK(0x1043, 0x185d, "ASUS G551JW", ALC668_FIXUP_ASUS_NO_HEADSET_MIC),
> +	SND_PCI_QUIRK(0x1043, 0x1963, "ASUS X71SL", ALC662_FIXUP_ASUS_MODE8),
> +	SND_PCI_QUIRK(0x1043, 0x1b73, "ASUS N55SF", ALC662_FIXUP_BASS_16),
> +	SND_PCI_QUIRK(0x1043, 0x1bf3, "ASUS N76VZ", ALC662_FIXUP_BASS_MODE4_CHMAP),
> +	SND_PCI_QUIRK(0x1043, 0x8469, "ASUS mobo", ALC662_FIXUP_NO_JACK_DETECT),
> +	SND_PCI_QUIRK(0x105b, 0x0cd6, "Foxconn", ALC662_FIXUP_ASUS_MODE2),
> +	SND_PCI_QUIRK(0x144d, 0xc051, "Samsung R720", ALC662_FIXUP_IDEAPAD),
> +	SND_PCI_QUIRK(0x14cd, 0x5003, "USI", ALC662_FIXUP_USI_HEADSET_MODE),
> +	SND_PCI_QUIRK(0x17aa, 0x1036, "Lenovo P520", ALC662_FIXUP_LENOVO_MULTI_CODECS),
> +	SND_PCI_QUIRK(0x17aa, 0x1057, "Lenovo P360", ALC897_FIXUP_HEADSET_MIC_PIN),
> +	SND_PCI_QUIRK(0x17aa, 0x1064, "Lenovo P3 Tower", ALC897_FIXUP_HEADSET_MIC_PIN),
> +	SND_PCI_QUIRK(0x17aa, 0x32ca, "Lenovo ThinkCentre M80", ALC897_FIXUP_HEADSET_MIC_PIN),
> +	SND_PCI_QUIRK(0x17aa, 0x32cb, "Lenovo ThinkCentre M70", ALC897_FIXUP_HEADSET_MIC_PIN),
> +	SND_PCI_QUIRK(0x17aa, 0x32cf, "Lenovo ThinkCentre M950", ALC897_FIXUP_HEADSET_MIC_PIN),
> +	SND_PCI_QUIRK(0x17aa, 0x32f7, "Lenovo ThinkCentre M90", ALC897_FIXUP_HEADSET_MIC_PIN),
> +	SND_PCI_QUIRK(0x17aa, 0x3321, "Lenovo ThinkCentre M70 Gen4", ALC897_FIXUP_HEADSET_MIC_PIN),
> +	SND_PCI_QUIRK(0x17aa, 0x331b, "Lenovo ThinkCentre M90 Gen4", ALC897_FIXUP_HEADSET_MIC_PIN),
> +	SND_PCI_QUIRK(0x17aa, 0x3364, "Lenovo ThinkCentre M90 Gen5", ALC897_FIXUP_HEADSET_MIC_PIN),
> +	SND_PCI_QUIRK(0x17aa, 0x3742, "Lenovo TianYi510Pro-14IOB", ALC897_FIXUP_HEADSET_MIC_PIN2),
> +	SND_PCI_QUIRK(0x17aa, 0x38af, "Lenovo Ideapad Y550P", ALC662_FIXUP_IDEAPAD),
> +	SND_PCI_QUIRK(0x17aa, 0x3a0d, "Lenovo Ideapad Y550", ALC662_FIXUP_IDEAPAD),
> +	SND_PCI_QUIRK(0x1849, 0x5892, "ASRock B150M", ALC892_FIXUP_ASROCK_MOBO),
> +	SND_PCI_QUIRK(0x19da, 0xa130, "Zotac Z68", ALC662_FIXUP_ZOTAC_Z68),
> +	SND_PCI_QUIRK(0x1b0a, 0x01b8, "ACER Veriton", ALC662_FIXUP_ACER_VERITON),
> +	SND_PCI_QUIRK(0x1b35, 0x1234, "CZC ET26", ALC662_FIXUP_CZC_ET26),
> +	SND_PCI_QUIRK(0x1b35, 0x2206, "CZC P10T", ALC662_FIXUP_CZC_P10T),
> +	SND_PCI_QUIRK(0x1c6c, 0x1239, "Compaq N14JP6-V2", ALC897_FIXUP_HP_HSMIC_VERB),
> +
> +#if 0
> +	/* Below is a quirk table taken from the old code.
> +	 * Basically the device should work as is without the fixup table.
> +	 * If BIOS doesn't give a proper info, enable the corresponding
> +	 * fixup entry.
> +	 */
> +	SND_PCI_QUIRK(0x1043, 0x1000, "ASUS N50Vm", ALC662_FIXUP_ASUS_MODE1),
> +	SND_PCI_QUIRK(0x1043, 0x1092, "ASUS NB", ALC662_FIXUP_ASUS_MODE3),
> +	SND_PCI_QUIRK(0x1043, 0x1173, "ASUS K73Jn", ALC662_FIXUP_ASUS_MODE1),
> +	SND_PCI_QUIRK(0x1043, 0x11c3, "ASUS M70V", ALC662_FIXUP_ASUS_MODE3),
> +	SND_PCI_QUIRK(0x1043, 0x11d3, "ASUS NB", ALC662_FIXUP_ASUS_MODE1),
> +	SND_PCI_QUIRK(0x1043, 0x11f3, "ASUS NB", ALC662_FIXUP_ASUS_MODE2),
> +	SND_PCI_QUIRK(0x1043, 0x1203, "ASUS NB", ALC662_FIXUP_ASUS_MODE1),
> +	SND_PCI_QUIRK(0x1043, 0x1303, "ASUS G60J", ALC662_FIXUP_ASUS_MODE1),
> +	SND_PCI_QUIRK(0x1043, 0x1333, "ASUS G60Jx", ALC662_FIXUP_ASUS_MODE1),
> +	SND_PCI_QUIRK(0x1043, 0x1339, "ASUS NB", ALC662_FIXUP_ASUS_MODE2),
> +	SND_PCI_QUIRK(0x1043, 0x13e3, "ASUS N71JA", ALC662_FIXUP_ASUS_MODE7),
> +	SND_PCI_QUIRK(0x1043, 0x1463, "ASUS N71", ALC662_FIXUP_ASUS_MODE7),
> +	SND_PCI_QUIRK(0x1043, 0x14d3, "ASUS G72", ALC662_FIXUP_ASUS_MODE8),
> +	SND_PCI_QUIRK(0x1043, 0x1563, "ASUS N90", ALC662_FIXUP_ASUS_MODE3),
> +	SND_PCI_QUIRK(0x1043, 0x15d3, "ASUS N50SF F50SF", ALC662_FIXUP_ASUS_MODE1),
> +	SND_PCI_QUIRK(0x1043, 0x16c3, "ASUS NB", ALC662_FIXUP_ASUS_MODE2),
> +	SND_PCI_QUIRK(0x1043, 0x16f3, "ASUS K40C K50C", ALC662_FIXUP_ASUS_MODE2),
> +	SND_PCI_QUIRK(0x1043, 0x1733, "ASUS N81De", ALC662_FIXUP_ASUS_MODE1),
> +	SND_PCI_QUIRK(0x1043, 0x1753, "ASUS NB", ALC662_FIXUP_ASUS_MODE2),
> +	SND_PCI_QUIRK(0x1043, 0x1763, "ASUS NB", ALC662_FIXUP_ASUS_MODE6),
> +	SND_PCI_QUIRK(0x1043, 0x1765, "ASUS NB", ALC662_FIXUP_ASUS_MODE6),
> +	SND_PCI_QUIRK(0x1043, 0x1783, "ASUS NB", ALC662_FIXUP_ASUS_MODE2),
> +	SND_PCI_QUIRK(0x1043, 0x1793, "ASUS F50GX", ALC662_FIXUP_ASUS_MODE1),
> +	SND_PCI_QUIRK(0x1043, 0x17b3, "ASUS F70SL", ALC662_FIXUP_ASUS_MODE3),
> +	SND_PCI_QUIRK(0x1043, 0x17f3, "ASUS X58LE", ALC662_FIXUP_ASUS_MODE2),
> +	SND_PCI_QUIRK(0x1043, 0x1813, "ASUS NB", ALC662_FIXUP_ASUS_MODE2),
> +	SND_PCI_QUIRK(0x1043, 0x1823, "ASUS NB", ALC662_FIXUP_ASUS_MODE5),
> +	SND_PCI_QUIRK(0x1043, 0x1833, "ASUS NB", ALC662_FIXUP_ASUS_MODE6),
> +	SND_PCI_QUIRK(0x1043, 0x1843, "ASUS NB", ALC662_FIXUP_ASUS_MODE2),
> +	SND_PCI_QUIRK(0x1043, 0x1853, "ASUS F50Z", ALC662_FIXUP_ASUS_MODE1),
> +	SND_PCI_QUIRK(0x1043, 0x1864, "ASUS NB", ALC662_FIXUP_ASUS_MODE2),
> +	SND_PCI_QUIRK(0x1043, 0x1876, "ASUS NB", ALC662_FIXUP_ASUS_MODE2),
> +	SND_PCI_QUIRK(0x1043, 0x1893, "ASUS M50Vm", ALC662_FIXUP_ASUS_MODE3),
> +	SND_PCI_QUIRK(0x1043, 0x1894, "ASUS X55", ALC662_FIXUP_ASUS_MODE3),
> +	SND_PCI_QUIRK(0x1043, 0x18b3, "ASUS N80Vc", ALC662_FIXUP_ASUS_MODE1),
> +	SND_PCI_QUIRK(0x1043, 0x18c3, "ASUS VX5", ALC662_FIXUP_ASUS_MODE1),
> +	SND_PCI_QUIRK(0x1043, 0x18d3, "ASUS N81Te", ALC662_FIXUP_ASUS_MODE1),
> +	SND_PCI_QUIRK(0x1043, 0x18f3, "ASUS N505Tp", ALC662_FIXUP_ASUS_MODE1),
> +	SND_PCI_QUIRK(0x1043, 0x1903, "ASUS F5GL", ALC662_FIXUP_ASUS_MODE1),
> +	SND_PCI_QUIRK(0x1043, 0x1913, "ASUS NB", ALC662_FIXUP_ASUS_MODE2),
> +	SND_PCI_QUIRK(0x1043, 0x1933, "ASUS F80Q", ALC662_FIXUP_ASUS_MODE2),
> +	SND_PCI_QUIRK(0x1043, 0x1943, "ASUS Vx3V", ALC662_FIXUP_ASUS_MODE1),
> +	SND_PCI_QUIRK(0x1043, 0x1953, "ASUS NB", ALC662_FIXUP_ASUS_MODE1),
> +	SND_PCI_QUIRK(0x1043, 0x1963, "ASUS X71C", ALC662_FIXUP_ASUS_MODE3),
> +	SND_PCI_QUIRK(0x1043, 0x1983, "ASUS N5051A", ALC662_FIXUP_ASUS_MODE1),
> +	SND_PCI_QUIRK(0x1043, 0x1993, "ASUS N20", ALC662_FIXUP_ASUS_MODE1),
> +	SND_PCI_QUIRK(0x1043, 0x19b3, "ASUS F7Z", ALC662_FIXUP_ASUS_MODE1),
> +	SND_PCI_QUIRK(0x1043, 0x19c3, "ASUS F5Z/F6x", ALC662_FIXUP_ASUS_MODE2),
> +	SND_PCI_QUIRK(0x1043, 0x19e3, "ASUS NB", ALC662_FIXUP_ASUS_MODE1),
> +	SND_PCI_QUIRK(0x1043, 0x19f3, "ASUS NB", ALC662_FIXUP_ASUS_MODE4),
> +#endif
> +	{}
> +};
> +
> +static const struct hda_model_fixup alc662_fixup_models[] = {
> +	{.id = ALC662_FIXUP_ASPIRE, .name = "aspire"},
> +	{.id = ALC662_FIXUP_IDEAPAD, .name = "ideapad"},
> +	{.id = ALC272_FIXUP_MARIO, .name = "mario"},
> +	{.id = ALC662_FIXUP_HP_RP5800, .name = "hp-rp5800"},
> +	{.id = ALC662_FIXUP_ASUS_MODE1, .name = "asus-mode1"},
> +	{.id = ALC662_FIXUP_ASUS_MODE2, .name = "asus-mode2"},
> +	{.id = ALC662_FIXUP_ASUS_MODE3, .name = "asus-mode3"},
> +	{.id = ALC662_FIXUP_ASUS_MODE4, .name = "asus-mode4"},
> +	{.id = ALC662_FIXUP_ASUS_MODE5, .name = "asus-mode5"},
> +	{.id = ALC662_FIXUP_ASUS_MODE6, .name = "asus-mode6"},
> +	{.id = ALC662_FIXUP_ASUS_MODE7, .name = "asus-mode7"},
> +	{.id = ALC662_FIXUP_ASUS_MODE8, .name = "asus-mode8"},
> +	{.id = ALC662_FIXUP_ZOTAC_Z68, .name = "zotac-z68"},
> +	{.id = ALC662_FIXUP_INV_DMIC, .name = "inv-dmic"},
> +	{.id = ALC662_FIXUP_DELL_MIC_NO_PRESENCE, .name = "alc662-headset-multi"},
> +	{.id = ALC668_FIXUP_DELL_MIC_NO_PRESENCE, .name = "dell-headset-multi"},
> +	{.id = ALC662_FIXUP_HEADSET_MODE, .name = "alc662-headset"},
> +	{.id = ALC668_FIXUP_HEADSET_MODE, .name = "alc668-headset"},
> +	{.id = ALC662_FIXUP_BASS_16, .name = "bass16"},
> +	{.id = ALC662_FIXUP_BASS_1A, .name = "bass1a"},
> +	{.id = ALC668_FIXUP_AUTO_MUTE, .name = "automute"},
> +	{.id = ALC668_FIXUP_DELL_XPS13, .name = "dell-xps13"},
> +	{.id = ALC662_FIXUP_ASUS_Nx50, .name = "asus-nx50"},
> +	{.id = ALC668_FIXUP_ASUS_Nx51, .name = "asus-nx51"},
> +	{.id = ALC668_FIXUP_ASUS_G751, .name = "asus-g751"},
> +	{.id = ALC891_FIXUP_HEADSET_MODE, .name = "alc891-headset"},
> +	{.id = ALC891_FIXUP_DELL_MIC_NO_PRESENCE, .name = "alc891-headset-multi"},
> +	{.id = ALC662_FIXUP_ACER_VERITON, .name = "acer-veriton"},
> +	{.id = ALC892_FIXUP_ASROCK_MOBO, .name = "asrock-mobo"},
> +	{.id = ALC662_FIXUP_USI_HEADSET_MODE, .name = "usi-headset"},
> +	{.id = ALC662_FIXUP_LENOVO_MULTI_CODECS, .name = "dual-codecs"},
> +	{.id = ALC669_FIXUP_ACER_ASPIRE_ETHOS, .name = "aspire-ethos"},
> +	{.id = ALC897_FIXUP_UNIS_H3C_X500S, .name = "unis-h3c-x500s"},
> +	{}
> +};
> +
> +static const struct snd_hda_pin_quirk alc662_pin_fixup_tbl[] = {
> +	SND_HDA_PIN_QUIRK(0x10ec0867, 0x1028, "Dell", ALC891_FIXUP_DELL_MIC_NO_PRESENCE,
> +		{0x17, 0x02211010},
> +		{0x18, 0x01a19030},
> +		{0x1a, 0x01813040},
> +		{0x21, 0x01014020}),
> +	SND_HDA_PIN_QUIRK(0x10ec0867, 0x1028, "Dell", ALC891_FIXUP_DELL_MIC_NO_PRESENCE,
> +		{0x16, 0x01813030},
> +		{0x17, 0x02211010},
> +		{0x18, 0x01a19040},
> +		{0x21, 0x01014020}),
> +	SND_HDA_PIN_QUIRK(0x10ec0662, 0x1028, "Dell", ALC662_FIXUP_DELL_MIC_NO_PRESENCE,
> +		{0x14, 0x01014010},
> +		{0x18, 0x01a19020},
> +		{0x1a, 0x0181302f},
> +		{0x1b, 0x0221401f}),
> +	SND_HDA_PIN_QUIRK(0x10ec0668, 0x1028, "Dell", ALC668_FIXUP_AUTO_MUTE,
> +		{0x12, 0x99a30130},
> +		{0x14, 0x90170110},
> +		{0x15, 0x0321101f},
> +		{0x16, 0x03011020}),
> +	SND_HDA_PIN_QUIRK(0x10ec0668, 0x1028, "Dell", ALC668_FIXUP_AUTO_MUTE,
> +		{0x12, 0x99a30140},
> +		{0x14, 0x90170110},
> +		{0x15, 0x0321101f},
> +		{0x16, 0x03011020}),
> +	SND_HDA_PIN_QUIRK(0x10ec0668, 0x1028, "Dell", ALC668_FIXUP_AUTO_MUTE,
> +		{0x12, 0x99a30150},
> +		{0x14, 0x90170110},
> +		{0x15, 0x0321101f},
> +		{0x16, 0x03011020}),
> +	SND_HDA_PIN_QUIRK(0x10ec0668, 0x1028, "Dell", ALC668_FIXUP_AUTO_MUTE,
> +		{0x14, 0x90170110},
> +		{0x15, 0x0321101f},
> +		{0x16, 0x03011020}),
> +	SND_HDA_PIN_QUIRK(0x10ec0668, 0x1028, "Dell XPS 15", ALC668_FIXUP_AUTO_MUTE,
> +		{0x12, 0x90a60130},
> +		{0x14, 0x90170110},
> +		{0x15, 0x0321101f}),
> +	SND_HDA_PIN_QUIRK(0x10ec0671, 0x103c, "HP cPC", ALC671_FIXUP_HP_HEADSET_MIC2,
> +		{0x14, 0x01014010},
> +		{0x17, 0x90170150},
> +		{0x19, 0x02a11060},
> +		{0x1b, 0x01813030},
> +		{0x21, 0x02211020}),
> +	SND_HDA_PIN_QUIRK(0x10ec0671, 0x103c, "HP cPC", ALC671_FIXUP_HP_HEADSET_MIC2,
> +		{0x14, 0x01014010},
> +		{0x18, 0x01a19040},
> +		{0x1b, 0x01813030},
> +		{0x21, 0x02211020}),
> +	SND_HDA_PIN_QUIRK(0x10ec0671, 0x103c, "HP cPC", ALC671_FIXUP_HP_HEADSET_MIC2,
> +		{0x14, 0x01014020},
> +		{0x17, 0x90170110},
> +		{0x18, 0x01a19050},
> +		{0x1b, 0x01813040},
> +		{0x21, 0x02211030}),
> +	{}
> +};
> +
> +/*
> + */
> +static int patch_alc662(struct hda_codec *codec)
> +{
> +	struct alc_spec *spec;
> +	int err;
> +
> +	err = alc_alloc_spec(codec, 0x0b);
> +	if (err < 0)
> +		return err;
> +
> +	spec = codec->spec;
> +
> +	spec->shutup = alc_eapd_shutup;
> +
> +	/* handle multiple HPs as is */
> +	spec->parse_flags = HDA_PINCFG_NO_HP_FIXUP;
> +
> +	alc_fix_pll_init(codec, 0x20, 0x04, 15);
> +
> +	switch (codec->core.vendor_id) {
> +	case 0x10ec0668:
> +		spec->init_hook = alc668_restore_default_value;
> +		break;
> +	}
> +
> +	alc_pre_init(codec);
> +
> +	snd_hda_pick_fixup(codec, alc662_fixup_models,
> +		       alc662_fixup_tbl, alc662_fixups);
> +	snd_hda_pick_pin_fixup(codec, alc662_pin_fixup_tbl, alc662_fixups, true);
> +	snd_hda_apply_fixup(codec, HDA_FIXUP_ACT_PRE_PROBE);
> +
> +	alc_auto_parse_customize_define(codec);
> +
> +	if (has_cdefine_beep(codec))
> +		spec->gen.beep_nid = 0x01;
> +
> +	if ((alc_get_coef0(codec) & (1 << 14)) &&
> +	    codec->bus->pci && codec->bus->pci->subsystem_vendor == 0x1025 &&
> +	    spec->cdefine.platform_type == 1) {
> +		err = alc_codec_rename(codec, "ALC272X");
> +		if (err < 0)
> +			goto error;
> +	}
> +
> +	/* automatic parse from the BIOS config */
> +	err = alc662_parse_auto_config(codec);
> +	if (err < 0)
> +		goto error;
> +
> +	if (!spec->gen.no_analog && spec->gen.beep_nid) {
> +		switch (codec->core.vendor_id) {
> +		case 0x10ec0662:
> +			err = set_beep_amp(spec, 0x0b, 0x05, HDA_INPUT);
> +			break;
> +		case 0x10ec0272:
> +		case 0x10ec0663:
> +		case 0x10ec0665:
> +		case 0x10ec0668:
> +			err = set_beep_amp(spec, 0x0b, 0x04, HDA_INPUT);
> +			break;
> +		case 0x10ec0273:
> +			err = set_beep_amp(spec, 0x0b, 0x03, HDA_INPUT);
> +			break;
> +		}
> +		if (err < 0)
> +			goto error;
> +	}
> +
> +	snd_hda_apply_fixup(codec, HDA_FIXUP_ACT_PROBE);
> +
> +	return 0;
> +
> + error:
> +	alc_free(codec);
> +	return err;
> +}
> +
> +/*
> + * driver entries
> + */
> +static const struct hda_device_id snd_hda_id_alc662[] = {
> +	HDA_CODEC_ENTRY(0x10ec0272, "ALC272", patch_alc662),
> +	HDA_CODEC_REV_ENTRY(0x10ec0662, 0x100101, "ALC662 rev1", patch_alc662),
> +	HDA_CODEC_REV_ENTRY(0x10ec0662, 0x100300, "ALC662 rev3", patch_alc662),
> +	HDA_CODEC_ENTRY(0x10ec0663, "ALC663", patch_alc662),
> +	HDA_CODEC_ENTRY(0x10ec0665, "ALC665", patch_alc662),
> +	HDA_CODEC_ENTRY(0x10ec0667, "ALC667", patch_alc662),
> +	HDA_CODEC_ENTRY(0x10ec0668, "ALC668", patch_alc662),
> +	HDA_CODEC_ENTRY(0x10ec0670, "ALC670", patch_alc662),
> +	HDA_CODEC_ENTRY(0x10ec0671, "ALC671", patch_alc662),
> +	HDA_CODEC_ENTRY(0x10ec0867, "ALC891", patch_alc662),
> +	HDA_CODEC_ENTRY(0x10ec0892, "ALC892", patch_alc662),
> +	HDA_CODEC_ENTRY(0x10ec0897, "ALC897", patch_alc662),
> +	{} /* terminator */
> +};
> +MODULE_DEVICE_TABLE(hdaudio, snd_hda_id_alc662);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("Realtek ALC662 and compatible HD-audio codec");
> +MODULE_IMPORT_NS("SND_HDA_CODEC_REALTEK");
> +
> +static struct hda_codec_driver alc662_driver = {
> +	.id = snd_hda_id_alc662,
> +};
> +
> +module_hda_codec_driver(alc662_driver);
> diff --git a/sound/hda/codecs/realtek/alc680.c b/sound/hda/codecs/realtek/alc680.c
> new file mode 100644
> index 000000000000..baf19ee3bc2f
> --- /dev/null
> +++ b/sound/hda/codecs/realtek/alc680.c
> @@ -0,0 +1,53 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +//
> +// Realtek ALC680 codec
> +//
> +
> +#include <linux/init.h>
> +#include <linux/module.h>
> +#include "realtek.h"
> +
> +static int alc680_parse_auto_config(struct hda_codec *codec)
> +{
> +	return alc_parse_auto_config(codec, NULL, NULL);
> +}
> +
> +/*
> + */
> +static int patch_alc680(struct hda_codec *codec)
> +{
> +	int err;
> +
> +	/* ALC680 has no aa-loopback mixer */
> +	err = alc_alloc_spec(codec, 0);
> +	if (err < 0)
> +		return err;
> +
> +	/* automatic parse from the BIOS config */
> +	err = alc680_parse_auto_config(codec);
> +	if (err < 0) {
> +		alc_free(codec);
> +		return err;
> +	}
> +
> +	return 0;
> +}
> +
> +/*
> + * driver entries
> + */
> +static const struct hda_device_id snd_hda_id_alc680[] = {
> +	HDA_CODEC_ENTRY(0x10ec0680, "ALC680", patch_alc680),
> +	{} /* terminator */
> +};
> +MODULE_DEVICE_TABLE(hdaudio, snd_hda_id_alc680);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("Realtek ALC680 HD-audio codec");
> +MODULE_IMPORT_NS("SND_HDA_CODEC_REALTEK");
> +
> +static struct hda_codec_driver alc680_driver = {
> +	.id = snd_hda_id_alc680,
> +};
> +
> +module_hda_codec_driver(alc680_driver);
> diff --git a/sound/hda/codecs/realtek/alc861.c b/sound/hda/codecs/realtek/alc861.c
> new file mode 100644
> index 000000000000..0eb70b44dc05
> --- /dev/null
> +++ b/sound/hda/codecs/realtek/alc861.c
> @@ -0,0 +1,149 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +//
> +// Realtek ALC861 codec
> +//
> +
> +#include <linux/init.h>
> +#include <linux/module.h>
> +#include "realtek.h"
> +
> +static int alc861_parse_auto_config(struct hda_codec *codec)
> +{
> +	static const hda_nid_t alc861_ignore[] = { 0x1d, 0 };
> +	static const hda_nid_t alc861_ssids[] = { 0x0e, 0x0f, 0x0b, 0 };
> +	return alc_parse_auto_config(codec, alc861_ignore, alc861_ssids);
> +}
> +
> +/* Pin config fixes */
> +enum {
> +	ALC861_FIXUP_FSC_AMILO_PI1505,
> +	ALC861_FIXUP_AMP_VREF_0F,
> +	ALC861_FIXUP_NO_JACK_DETECT,
> +	ALC861_FIXUP_ASUS_A6RP,
> +	ALC660_FIXUP_ASUS_W7J,
> +};
> +
> +/* On some laptops, VREF of pin 0x0f is abused for controlling the main amp */
> +static void alc861_fixup_asus_amp_vref_0f(struct hda_codec *codec,
> +			const struct hda_fixup *fix, int action)
> +{
> +	struct alc_spec *spec = codec->spec;
> +	unsigned int val;
> +
> +	if (action != HDA_FIXUP_ACT_INIT)
> +		return;
> +	val = snd_hda_codec_get_pin_target(codec, 0x0f);
> +	if (!(val & (AC_PINCTL_IN_EN | AC_PINCTL_OUT_EN)))
> +		val |= AC_PINCTL_IN_EN;
> +	val |= AC_PINCTL_VREF_50;
> +	snd_hda_set_pin_ctl(codec, 0x0f, val);
> +	spec->gen.keep_vref_in_automute = 1;
> +}
> +
> +static const struct hda_fixup alc861_fixups[] = {
> +	[ALC861_FIXUP_FSC_AMILO_PI1505] = {
> +		.type = HDA_FIXUP_PINS,
> +		.v.pins = (const struct hda_pintbl[]) {
> +			{ 0x0b, 0x0221101f }, /* HP */
> +			{ 0x0f, 0x90170310 }, /* speaker */
> +			{ }
> +		}
> +	},
> +	[ALC861_FIXUP_AMP_VREF_0F] = {
> +		.type = HDA_FIXUP_FUNC,
> +		.v.func = alc861_fixup_asus_amp_vref_0f,
> +	},
> +	[ALC861_FIXUP_NO_JACK_DETECT] = {
> +		.type = HDA_FIXUP_FUNC,
> +		.v.func = alc_fixup_no_jack_detect,
> +	},
> +	[ALC861_FIXUP_ASUS_A6RP] = {
> +		.type = HDA_FIXUP_FUNC,
> +		.v.func = alc861_fixup_asus_amp_vref_0f,
> +		.chained = true,
> +		.chain_id = ALC861_FIXUP_NO_JACK_DETECT,
> +	},
> +	[ALC660_FIXUP_ASUS_W7J] = {
> +		.type = HDA_FIXUP_VERBS,
> +		.v.verbs = (const struct hda_verb[]) {
> +			/* ASUS W7J needs a magic pin setup on unused NID 0x10
> +			 * for enabling outputs
> +			 */
> +			{0x10, AC_VERB_SET_PIN_WIDGET_CONTROL, 0x24},
> +			{ }
> +		},
> +	}
> +};
> +
> +static const struct hda_quirk alc861_fixup_tbl[] = {
> +	SND_PCI_QUIRK(0x1043, 0x1253, "ASUS W7J", ALC660_FIXUP_ASUS_W7J),
> +	SND_PCI_QUIRK(0x1043, 0x1263, "ASUS Z35HL", ALC660_FIXUP_ASUS_W7J),
> +	SND_PCI_QUIRK(0x1043, 0x1393, "ASUS A6Rp", ALC861_FIXUP_ASUS_A6RP),
> +	SND_PCI_QUIRK_VENDOR(0x1043, "ASUS laptop", ALC861_FIXUP_AMP_VREF_0F),
> +	SND_PCI_QUIRK(0x1462, 0x7254, "HP DX2200", ALC861_FIXUP_NO_JACK_DETECT),
> +	SND_PCI_QUIRK_VENDOR(0x1584, "Haier/Uniwill", ALC861_FIXUP_AMP_VREF_0F),
> +	SND_PCI_QUIRK(0x1734, 0x10c7, "FSC Amilo Pi1505", ALC861_FIXUP_FSC_AMILO_PI1505),
> +	{}
> +};
> +
> +/*
> + */
> +static int patch_alc861(struct hda_codec *codec)
> +{
> +	struct alc_spec *spec;
> +	int err;
> +
> +	err = alc_alloc_spec(codec, 0x15);
> +	if (err < 0)
> +		return err;
> +
> +	spec = codec->spec;
> +	if (has_cdefine_beep(codec))
> +		spec->gen.beep_nid = 0x23;
> +
> +	spec->power_hook = alc_power_eapd;
> +
> +	alc_pre_init(codec);
> +
> +	snd_hda_pick_fixup(codec, NULL, alc861_fixup_tbl, alc861_fixups);
> +	snd_hda_apply_fixup(codec, HDA_FIXUP_ACT_PRE_PROBE);
> +
> +	/* automatic parse from the BIOS config */
> +	err = alc861_parse_auto_config(codec);
> +	if (err < 0)
> +		goto error;
> +
> +	if (!spec->gen.no_analog) {
> +		err = set_beep_amp(spec, 0x23, 0, HDA_OUTPUT);
> +		if (err < 0)
> +			goto error;
> +	}
> +
> +	snd_hda_apply_fixup(codec, HDA_FIXUP_ACT_PROBE);
> +
> +	return 0;
> +
> + error:
> +	alc_free(codec);
> +	return err;
> +}
> +
> +/*
> + * driver entries
> + */
> +static const struct hda_device_id snd_hda_id_alc861[] = {
> +	HDA_CODEC_REV_ENTRY(0x10ec0861, 0x100340, "ALC660", patch_alc861),
> +	HDA_CODEC_ENTRY(0x10ec0861, "ALC861", patch_alc861),
> +	{} /* terminator */
> +};
> +MODULE_DEVICE_TABLE(hdaudio, snd_hda_id_alc861);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("Realtek ALC861 HD-audio codec");
> +MODULE_IMPORT_NS("SND_HDA_CODEC_REALTEK");
> +
> +static struct hda_codec_driver alc861_driver = {
> +	.id = snd_hda_id_alc861,
> +};
> +
> +module_hda_codec_driver(alc861_driver);
> diff --git a/sound/hda/codecs/realtek/alc861vd.c b/sound/hda/codecs/realtek/alc861vd.c
> new file mode 100644
> index 000000000000..ebf274ad730b
> --- /dev/null
> +++ b/sound/hda/codecs/realtek/alc861vd.c
> @@ -0,0 +1,123 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +//
> +// Realtek ALC861-VD codec
> +// Based on ALC882
> +// In addition, an independent DAC
> +//
> +
> +#include <linux/init.h>
> +#include <linux/module.h>
> +#include "realtek.h"
> +
> +static int alc861vd_parse_auto_config(struct hda_codec *codec)
> +{
> +	static const hda_nid_t alc861vd_ignore[] = { 0x1d, 0 };
> +	static const hda_nid_t alc861vd_ssids[] = { 0x15, 0x1b, 0x14, 0 };
> +	return alc_parse_auto_config(codec, alc861vd_ignore, alc861vd_ssids);
> +}
> +
> +enum {
> +	ALC660VD_FIX_ASUS_GPIO1,
> +	ALC861VD_FIX_DALLAS,
> +};
> +
> +/* exclude VREF80 */
> +static void alc861vd_fixup_dallas(struct hda_codec *codec,
> +				  const struct hda_fixup *fix, int action)
> +{
> +	if (action == HDA_FIXUP_ACT_PRE_PROBE) {
> +		snd_hda_override_pin_caps(codec, 0x18, 0x00000734);
> +		snd_hda_override_pin_caps(codec, 0x19, 0x0000073c);
> +	}
> +}
> +
> +/* reset GPIO1 */
> +static void alc660vd_fixup_asus_gpio1(struct hda_codec *codec,
> +				      const struct hda_fixup *fix, int action)
> +{
> +	struct alc_spec *spec = codec->spec;
> +
> +	if (action == HDA_FIXUP_ACT_PRE_PROBE)
> +		spec->gpio_mask |= 0x02;
> +	alc_fixup_gpio(codec, action, 0x01);
> +}
> +
> +static const struct hda_fixup alc861vd_fixups[] = {
> +	[ALC660VD_FIX_ASUS_GPIO1] = {
> +		.type = HDA_FIXUP_FUNC,
> +		.v.func = alc660vd_fixup_asus_gpio1,
> +	},
> +	[ALC861VD_FIX_DALLAS] = {
> +		.type = HDA_FIXUP_FUNC,
> +		.v.func = alc861vd_fixup_dallas,
> +	},
> +};
> +
> +static const struct hda_quirk alc861vd_fixup_tbl[] = {
> +	SND_PCI_QUIRK(0x103c, 0x30bf, "HP TX1000", ALC861VD_FIX_DALLAS),
> +	SND_PCI_QUIRK(0x1043, 0x1339, "ASUS A7-K", ALC660VD_FIX_ASUS_GPIO1),
> +	SND_PCI_QUIRK(0x1179, 0xff31, "Toshiba L30-149", ALC861VD_FIX_DALLAS),
> +	{}
> +};
> +
> +/*
> + */
> +static int patch_alc861vd(struct hda_codec *codec)
> +{
> +	struct alc_spec *spec;
> +	int err;
> +
> +	err = alc_alloc_spec(codec, 0x0b);
> +	if (err < 0)
> +		return err;
> +
> +	spec = codec->spec;
> +	if (has_cdefine_beep(codec))
> +		spec->gen.beep_nid = 0x23;
> +
> +	spec->shutup = alc_eapd_shutup;
> +
> +	alc_pre_init(codec);
> +
> +	snd_hda_pick_fixup(codec, NULL, alc861vd_fixup_tbl, alc861vd_fixups);
> +	snd_hda_apply_fixup(codec, HDA_FIXUP_ACT_PRE_PROBE);
> +
> +	/* automatic parse from the BIOS config */
> +	err = alc861vd_parse_auto_config(codec);
> +	if (err < 0)
> +		goto error;
> +
> +	if (!spec->gen.no_analog) {
> +		err = set_beep_amp(spec, 0x0b, 0x05, HDA_INPUT);
> +		if (err < 0)
> +			goto error;
> +	}
> +
> +	snd_hda_apply_fixup(codec, HDA_FIXUP_ACT_PROBE);
> +
> +	return 0;
> +
> + error:
> +	alc_free(codec);
> +	return err;
> +}
> +
> +/*
> + * driver entries
> + */
> +static const struct hda_device_id snd_hda_id_alc861vd[] = {
> +	HDA_CODEC_ENTRY(0x10ec0660, "ALC660-VD", patch_alc861vd),
> +	HDA_CODEC_ENTRY(0x10ec0862, "ALC861-VD", patch_alc861vd),
> +	{} /* terminator */
> +};
> +MODULE_DEVICE_TABLE(hdaudio, snd_hda_id_alc861vd);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("Realtek ALC861-VD HD-audio codec");
> +MODULE_IMPORT_NS("SND_HDA_CODEC_REALTEK");
> +
> +static struct hda_codec_driver alc861vd_driver = {
> +	.id = snd_hda_id_alc861vd,
> +};
> +
> +module_hda_codec_driver(alc861vd_driver);
> diff --git a/sound/hda/codecs/realtek/alc880.c b/sound/hda/codecs/realtek/alc880.c
> new file mode 100644
> index 000000000000..2e828ab96dc5
> --- /dev/null
> +++ b/sound/hda/codecs/realtek/alc880.c
> @@ -0,0 +1,497 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +//
> +// Realtek ALC880 codec
> +//
> +
> +#include <linux/init.h>
> +#include <linux/module.h>
> +#include "realtek.h"
> +
> +static void alc880_unsol_event(struct hda_codec *codec, unsigned int res)
> +{
> +	/* For some reason, the res given from ALC880 is broken.
> +	   Here we adjust it properly. */
> +	snd_hda_jack_unsol_event(codec, res >> 2);
> +}
> +
> +static int alc880_parse_auto_config(struct hda_codec *codec)
> +{
> +	static const hda_nid_t alc880_ignore[] = { 0x1d, 0 };
> +	static const hda_nid_t alc880_ssids[] = { 0x15, 0x1b, 0x14, 0 };
> +	return alc_parse_auto_config(codec, alc880_ignore, alc880_ssids);
> +}
> +
> +/*
> + * ALC880 fix-ups
> + */
> +enum {
> +	ALC880_FIXUP_GPIO1,
> +	ALC880_FIXUP_GPIO2,
> +	ALC880_FIXUP_MEDION_RIM,
> +	ALC880_FIXUP_LG,
> +	ALC880_FIXUP_LG_LW25,
> +	ALC880_FIXUP_W810,
> +	ALC880_FIXUP_EAPD_COEF,
> +	ALC880_FIXUP_TCL_S700,
> +	ALC880_FIXUP_VOL_KNOB,
> +	ALC880_FIXUP_FUJITSU,
> +	ALC880_FIXUP_F1734,
> +	ALC880_FIXUP_UNIWILL,
> +	ALC880_FIXUP_UNIWILL_DIG,
> +	ALC880_FIXUP_Z71V,
> +	ALC880_FIXUP_ASUS_W5A,
> +	ALC880_FIXUP_3ST_BASE,
> +	ALC880_FIXUP_3ST,
> +	ALC880_FIXUP_3ST_DIG,
> +	ALC880_FIXUP_5ST_BASE,
> +	ALC880_FIXUP_5ST,
> +	ALC880_FIXUP_5ST_DIG,
> +	ALC880_FIXUP_6ST_BASE,
> +	ALC880_FIXUP_6ST,
> +	ALC880_FIXUP_6ST_DIG,
> +	ALC880_FIXUP_6ST_AUTOMUTE,
> +};
> +
> +/* enable the volume-knob widget support on NID 0x21 */
> +static void alc880_fixup_vol_knob(struct hda_codec *codec,
> +				  const struct hda_fixup *fix, int action)
> +{
> +	if (action == HDA_FIXUP_ACT_PROBE)
> +		snd_hda_jack_detect_enable_callback(codec, 0x21,
> +						    alc_update_knob_master);
> +}
> +
> +static const struct hda_fixup alc880_fixups[] = {
> +	[ALC880_FIXUP_GPIO1] = {
> +		.type = HDA_FIXUP_FUNC,
> +		.v.func = alc_fixup_gpio1,
> +	},
> +	[ALC880_FIXUP_GPIO2] = {
> +		.type = HDA_FIXUP_FUNC,
> +		.v.func = alc_fixup_gpio2,
> +	},
> +	[ALC880_FIXUP_MEDION_RIM] = {
> +		.type = HDA_FIXUP_VERBS,
> +		.v.verbs = (const struct hda_verb[]) {
> +			{ 0x20, AC_VERB_SET_COEF_INDEX, 0x07 },
> +			{ 0x20, AC_VERB_SET_PROC_COEF,  0x3060 },
> +			{ }
> +		},
> +		.chained = true,
> +		.chain_id = ALC880_FIXUP_GPIO2,
> +	},
> +	[ALC880_FIXUP_LG] = {
> +		.type = HDA_FIXUP_PINS,
> +		.v.pins = (const struct hda_pintbl[]) {
> +			/* disable bogus unused pins */
> +			{ 0x16, 0x411111f0 },
> +			{ 0x18, 0x411111f0 },
> +			{ 0x1a, 0x411111f0 },
> +			{ }
> +		}
> +	},
> +	[ALC880_FIXUP_LG_LW25] = {
> +		.type = HDA_FIXUP_PINS,
> +		.v.pins = (const struct hda_pintbl[]) {
> +			{ 0x1a, 0x0181344f }, /* line-in */
> +			{ 0x1b, 0x0321403f }, /* headphone */
> +			{ }
> +		}
> +	},
> +	[ALC880_FIXUP_W810] = {
> +		.type = HDA_FIXUP_PINS,
> +		.v.pins = (const struct hda_pintbl[]) {
> +			/* disable bogus unused pins */
> +			{ 0x17, 0x411111f0 },
> +			{ }
> +		},
> +		.chained = true,
> +		.chain_id = ALC880_FIXUP_GPIO2,
> +	},
> +	[ALC880_FIXUP_EAPD_COEF] = {
> +		.type = HDA_FIXUP_VERBS,
> +		.v.verbs = (const struct hda_verb[]) {
> +			/* change to EAPD mode */
> +			{ 0x20, AC_VERB_SET_COEF_INDEX, 0x07 },
> +			{ 0x20, AC_VERB_SET_PROC_COEF,  0x3060 },
> +			{}
> +		},
> +	},
> +	[ALC880_FIXUP_TCL_S700] = {
> +		.type = HDA_FIXUP_VERBS,
> +		.v.verbs = (const struct hda_verb[]) {
> +			/* change to EAPD mode */
> +			{ 0x20, AC_VERB_SET_COEF_INDEX, 0x07 },
> +			{ 0x20, AC_VERB_SET_PROC_COEF,  0x3070 },
> +			{}
> +		},
> +		.chained = true,
> +		.chain_id = ALC880_FIXUP_GPIO2,
> +	},
> +	[ALC880_FIXUP_VOL_KNOB] = {
> +		.type = HDA_FIXUP_FUNC,
> +		.v.func = alc880_fixup_vol_knob,
> +	},
> +	[ALC880_FIXUP_FUJITSU] = {
> +		/* override all pins as BIOS on old Amilo is broken */
> +		.type = HDA_FIXUP_PINS,
> +		.v.pins = (const struct hda_pintbl[]) {
> +			{ 0x14, 0x0121401f }, /* HP */
> +			{ 0x15, 0x99030120 }, /* speaker */
> +			{ 0x16, 0x99030130 }, /* bass speaker */
> +			{ 0x17, 0x411111f0 }, /* N/A */
> +			{ 0x18, 0x411111f0 }, /* N/A */
> +			{ 0x19, 0x01a19950 }, /* mic-in */
> +			{ 0x1a, 0x411111f0 }, /* N/A */
> +			{ 0x1b, 0x411111f0 }, /* N/A */
> +			{ 0x1c, 0x411111f0 }, /* N/A */
> +			{ 0x1d, 0x411111f0 }, /* N/A */
> +			{ 0x1e, 0x01454140 }, /* SPDIF out */
> +			{ }
> +		},
> +		.chained = true,
> +		.chain_id = ALC880_FIXUP_VOL_KNOB,
> +	},
> +	[ALC880_FIXUP_F1734] = {
> +		/* almost compatible with FUJITSU, but no bass and SPDIF */
> +		.type = HDA_FIXUP_PINS,
> +		.v.pins = (const struct hda_pintbl[]) {
> +			{ 0x14, 0x0121401f }, /* HP */
> +			{ 0x15, 0x99030120 }, /* speaker */
> +			{ 0x16, 0x411111f0 }, /* N/A */
> +			{ 0x17, 0x411111f0 }, /* N/A */
> +			{ 0x18, 0x411111f0 }, /* N/A */
> +			{ 0x19, 0x01a19950 }, /* mic-in */
> +			{ 0x1a, 0x411111f0 }, /* N/A */
> +			{ 0x1b, 0x411111f0 }, /* N/A */
> +			{ 0x1c, 0x411111f0 }, /* N/A */
> +			{ 0x1d, 0x411111f0 }, /* N/A */
> +			{ 0x1e, 0x411111f0 }, /* N/A */
> +			{ }
> +		},
> +		.chained = true,
> +		.chain_id = ALC880_FIXUP_VOL_KNOB,
> +	},
> +	[ALC880_FIXUP_UNIWILL] = {
> +		/* need to fix HP and speaker pins to be parsed correctly */
> +		.type = HDA_FIXUP_PINS,
> +		.v.pins = (const struct hda_pintbl[]) {
> +			{ 0x14, 0x0121411f }, /* HP */
> +			{ 0x15, 0x99030120 }, /* speaker */
> +			{ 0x16, 0x99030130 }, /* bass speaker */
> +			{ }
> +		},
> +	},
> +	[ALC880_FIXUP_UNIWILL_DIG] = {
> +		.type = HDA_FIXUP_PINS,
> +		.v.pins = (const struct hda_pintbl[]) {
> +			/* disable bogus unused pins */
> +			{ 0x17, 0x411111f0 },
> +			{ 0x19, 0x411111f0 },
> +			{ 0x1b, 0x411111f0 },
> +			{ 0x1f, 0x411111f0 },
> +			{ }
> +		}
> +	},
> +	[ALC880_FIXUP_Z71V] = {
> +		.type = HDA_FIXUP_PINS,
> +		.v.pins = (const struct hda_pintbl[]) {
> +			/* set up the whole pins as BIOS is utterly broken */
> +			{ 0x14, 0x99030120 }, /* speaker */
> +			{ 0x15, 0x0121411f }, /* HP */
> +			{ 0x16, 0x411111f0 }, /* N/A */
> +			{ 0x17, 0x411111f0 }, /* N/A */
> +			{ 0x18, 0x01a19950 }, /* mic-in */
> +			{ 0x19, 0x411111f0 }, /* N/A */
> +			{ 0x1a, 0x01813031 }, /* line-in */
> +			{ 0x1b, 0x411111f0 }, /* N/A */
> +			{ 0x1c, 0x411111f0 }, /* N/A */
> +			{ 0x1d, 0x411111f0 }, /* N/A */
> +			{ 0x1e, 0x0144111e }, /* SPDIF */
> +			{ }
> +		}
> +	},
> +	[ALC880_FIXUP_ASUS_W5A] = {
> +		.type = HDA_FIXUP_PINS,
> +		.v.pins = (const struct hda_pintbl[]) {
> +			/* set up the whole pins as BIOS is utterly broken */
> +			{ 0x14, 0x0121411f }, /* HP */
> +			{ 0x15, 0x411111f0 }, /* N/A */
> +			{ 0x16, 0x411111f0 }, /* N/A */
> +			{ 0x17, 0x411111f0 }, /* N/A */
> +			{ 0x18, 0x90a60160 }, /* mic */
> +			{ 0x19, 0x411111f0 }, /* N/A */
> +			{ 0x1a, 0x411111f0 }, /* N/A */
> +			{ 0x1b, 0x411111f0 }, /* N/A */
> +			{ 0x1c, 0x411111f0 }, /* N/A */
> +			{ 0x1d, 0x411111f0 }, /* N/A */
> +			{ 0x1e, 0xb743111e }, /* SPDIF out */
> +			{ }
> +		},
> +		.chained = true,
> +		.chain_id = ALC880_FIXUP_GPIO1,
> +	},
> +	[ALC880_FIXUP_3ST_BASE] = {
> +		.type = HDA_FIXUP_PINS,
> +		.v.pins = (const struct hda_pintbl[]) {
> +			{ 0x14, 0x01014010 }, /* line-out */
> +			{ 0x15, 0x411111f0 }, /* N/A */
> +			{ 0x16, 0x411111f0 }, /* N/A */
> +			{ 0x17, 0x411111f0 }, /* N/A */
> +			{ 0x18, 0x01a19c30 }, /* mic-in */
> +			{ 0x19, 0x0121411f }, /* HP */
> +			{ 0x1a, 0x01813031 }, /* line-in */
> +			{ 0x1b, 0x02a19c40 }, /* front-mic */
> +			{ 0x1c, 0x411111f0 }, /* N/A */
> +			{ 0x1d, 0x411111f0 }, /* N/A */
> +			/* 0x1e is filled in below */
> +			{ 0x1f, 0x411111f0 }, /* N/A */
> +			{ }
> +		}
> +	},
> +	[ALC880_FIXUP_3ST] = {
> +		.type = HDA_FIXUP_PINS,
> +		.v.pins = (const struct hda_pintbl[]) {
> +			{ 0x1e, 0x411111f0 }, /* N/A */
> +			{ }
> +		},
> +		.chained = true,
> +		.chain_id = ALC880_FIXUP_3ST_BASE,
> +	},
> +	[ALC880_FIXUP_3ST_DIG] = {
> +		.type = HDA_FIXUP_PINS,
> +		.v.pins = (const struct hda_pintbl[]) {
> +			{ 0x1e, 0x0144111e }, /* SPDIF */
> +			{ }
> +		},
> +		.chained = true,
> +		.chain_id = ALC880_FIXUP_3ST_BASE,
> +	},
> +	[ALC880_FIXUP_5ST_BASE] = {
> +		.type = HDA_FIXUP_PINS,
> +		.v.pins = (const struct hda_pintbl[]) {
> +			{ 0x14, 0x01014010 }, /* front */
> +			{ 0x15, 0x411111f0 }, /* N/A */
> +			{ 0x16, 0x01011411 }, /* CLFE */
> +			{ 0x17, 0x01016412 }, /* surr */
> +			{ 0x18, 0x01a19c30 }, /* mic-in */
> +			{ 0x19, 0x0121411f }, /* HP */
> +			{ 0x1a, 0x01813031 }, /* line-in */
> +			{ 0x1b, 0x02a19c40 }, /* front-mic */
> +			{ 0x1c, 0x411111f0 }, /* N/A */
> +			{ 0x1d, 0x411111f0 }, /* N/A */
> +			/* 0x1e is filled in below */
> +			{ 0x1f, 0x411111f0 }, /* N/A */
> +			{ }
> +		}
> +	},
> +	[ALC880_FIXUP_5ST] = {
> +		.type = HDA_FIXUP_PINS,
> +		.v.pins = (const struct hda_pintbl[]) {
> +			{ 0x1e, 0x411111f0 }, /* N/A */
> +			{ }
> +		},
> +		.chained = true,
> +		.chain_id = ALC880_FIXUP_5ST_BASE,
> +	},
> +	[ALC880_FIXUP_5ST_DIG] = {
> +		.type = HDA_FIXUP_PINS,
> +		.v.pins = (const struct hda_pintbl[]) {
> +			{ 0x1e, 0x0144111e }, /* SPDIF */
> +			{ }
> +		},
> +		.chained = true,
> +		.chain_id = ALC880_FIXUP_5ST_BASE,
> +	},
> +	[ALC880_FIXUP_6ST_BASE] = {
> +		.type = HDA_FIXUP_PINS,
> +		.v.pins = (const struct hda_pintbl[]) {
> +			{ 0x14, 0x01014010 }, /* front */
> +			{ 0x15, 0x01016412 }, /* surr */
> +			{ 0x16, 0x01011411 }, /* CLFE */
> +			{ 0x17, 0x01012414 }, /* side */
> +			{ 0x18, 0x01a19c30 }, /* mic-in */
> +			{ 0x19, 0x02a19c40 }, /* front-mic */
> +			{ 0x1a, 0x01813031 }, /* line-in */
> +			{ 0x1b, 0x0121411f }, /* HP */
> +			{ 0x1c, 0x411111f0 }, /* N/A */
> +			{ 0x1d, 0x411111f0 }, /* N/A */
> +			/* 0x1e is filled in below */
> +			{ 0x1f, 0x411111f0 }, /* N/A */
> +			{ }
> +		}
> +	},
> +	[ALC880_FIXUP_6ST] = {
> +		.type = HDA_FIXUP_PINS,
> +		.v.pins = (const struct hda_pintbl[]) {
> +			{ 0x1e, 0x411111f0 }, /* N/A */
> +			{ }
> +		},
> +		.chained = true,
> +		.chain_id = ALC880_FIXUP_6ST_BASE,
> +	},
> +	[ALC880_FIXUP_6ST_DIG] = {
> +		.type = HDA_FIXUP_PINS,
> +		.v.pins = (const struct hda_pintbl[]) {
> +			{ 0x1e, 0x0144111e }, /* SPDIF */
> +			{ }
> +		},
> +		.chained = true,
> +		.chain_id = ALC880_FIXUP_6ST_BASE,
> +	},
> +	[ALC880_FIXUP_6ST_AUTOMUTE] = {
> +		.type = HDA_FIXUP_PINS,
> +		.v.pins = (const struct hda_pintbl[]) {
> +			{ 0x1b, 0x0121401f }, /* HP with jack detect */
> +			{ }
> +		},
> +		.chained_before = true,
> +		.chain_id = ALC880_FIXUP_6ST_BASE,
> +	},
> +};
> +
> +static const struct hda_quirk alc880_fixup_tbl[] = {
> +	SND_PCI_QUIRK(0x1019, 0x0f69, "Coeus G610P", ALC880_FIXUP_W810),
> +	SND_PCI_QUIRK(0x1043, 0x10c3, "ASUS W5A", ALC880_FIXUP_ASUS_W5A),
> +	SND_PCI_QUIRK(0x1043, 0x1964, "ASUS Z71V", ALC880_FIXUP_Z71V),
> +	SND_PCI_QUIRK_VENDOR(0x1043, "ASUS", ALC880_FIXUP_GPIO1),
> +	SND_PCI_QUIRK(0x147b, 0x1045, "ABit AA8XE", ALC880_FIXUP_6ST_AUTOMUTE),
> +	SND_PCI_QUIRK(0x1558, 0x5401, "Clevo GPIO2", ALC880_FIXUP_GPIO2),
> +	SND_PCI_QUIRK_VENDOR(0x1558, "Clevo", ALC880_FIXUP_EAPD_COEF),
> +	SND_PCI_QUIRK(0x1584, 0x9050, "Uniwill", ALC880_FIXUP_UNIWILL_DIG),
> +	SND_PCI_QUIRK(0x1584, 0x9054, "Uniwill", ALC880_FIXUP_F1734),
> +	SND_PCI_QUIRK(0x1584, 0x9070, "Uniwill", ALC880_FIXUP_UNIWILL),
> +	SND_PCI_QUIRK(0x1584, 0x9077, "Uniwill P53", ALC880_FIXUP_VOL_KNOB),
> +	SND_PCI_QUIRK(0x161f, 0x203d, "W810", ALC880_FIXUP_W810),
> +	SND_PCI_QUIRK(0x161f, 0x205d, "Medion Rim 2150", ALC880_FIXUP_MEDION_RIM),
> +	SND_PCI_QUIRK(0x1631, 0xe011, "PB 13201056", ALC880_FIXUP_6ST_AUTOMUTE),
> +	SND_PCI_QUIRK(0x1734, 0x107c, "FSC Amilo M1437", ALC880_FIXUP_FUJITSU),
> +	SND_PCI_QUIRK(0x1734, 0x1094, "FSC Amilo M1451G", ALC880_FIXUP_FUJITSU),
> +	SND_PCI_QUIRK(0x1734, 0x10ac, "FSC AMILO Xi 1526", ALC880_FIXUP_F1734),
> +	SND_PCI_QUIRK(0x1734, 0x10b0, "FSC Amilo Pi1556", ALC880_FIXUP_FUJITSU),
> +	SND_PCI_QUIRK(0x1854, 0x003b, "LG", ALC880_FIXUP_LG),
> +	SND_PCI_QUIRK(0x1854, 0x005f, "LG P1 Express", ALC880_FIXUP_LG),
> +	SND_PCI_QUIRK(0x1854, 0x0068, "LG w1", ALC880_FIXUP_LG),
> +	SND_PCI_QUIRK(0x1854, 0x0077, "LG LW25", ALC880_FIXUP_LG_LW25),
> +	SND_PCI_QUIRK(0x19db, 0x4188, "TCL S700", ALC880_FIXUP_TCL_S700),
> +
> +	/* Below is the copied entries from alc880_quirks.c.
> +	 * It's not quite sure whether BIOS sets the correct pin-config table
> +	 * on these machines, thus they are kept to be compatible with
> +	 * the old static quirks.  Once when it's confirmed to work without
> +	 * these overrides, it'd be better to remove.
> +	 */
> +	SND_PCI_QUIRK(0x1019, 0xa880, "ECS", ALC880_FIXUP_5ST_DIG),
> +	SND_PCI_QUIRK(0x1019, 0xa884, "Acer APFV", ALC880_FIXUP_6ST),
> +	SND_PCI_QUIRK(0x1025, 0x0070, "ULI", ALC880_FIXUP_3ST_DIG),
> +	SND_PCI_QUIRK(0x1025, 0x0077, "ULI", ALC880_FIXUP_6ST_DIG),
> +	SND_PCI_QUIRK(0x1025, 0x0078, "ULI", ALC880_FIXUP_6ST_DIG),
> +	SND_PCI_QUIRK(0x1025, 0x0087, "ULI", ALC880_FIXUP_6ST_DIG),
> +	SND_PCI_QUIRK(0x1025, 0xe309, "ULI", ALC880_FIXUP_3ST_DIG),
> +	SND_PCI_QUIRK(0x1025, 0xe310, "ULI", ALC880_FIXUP_3ST),
> +	SND_PCI_QUIRK(0x1039, 0x1234, NULL, ALC880_FIXUP_6ST_DIG),
> +	SND_PCI_QUIRK(0x104d, 0x81a0, "Sony", ALC880_FIXUP_3ST),
> +	SND_PCI_QUIRK(0x104d, 0x81d6, "Sony", ALC880_FIXUP_3ST),
> +	SND_PCI_QUIRK(0x107b, 0x3032, "Gateway", ALC880_FIXUP_5ST),
> +	SND_PCI_QUIRK(0x107b, 0x3033, "Gateway", ALC880_FIXUP_5ST),
> +	SND_PCI_QUIRK(0x107b, 0x4039, "Gateway", ALC880_FIXUP_5ST),
> +	SND_PCI_QUIRK(0x1297, 0xc790, "Shuttle ST20G5", ALC880_FIXUP_6ST_DIG),
> +	SND_PCI_QUIRK(0x1458, 0xa102, "Gigabyte K8", ALC880_FIXUP_6ST_DIG),
> +	SND_PCI_QUIRK(0x1462, 0x1150, "MSI", ALC880_FIXUP_6ST_DIG),
> +	SND_PCI_QUIRK(0x1509, 0x925d, "FIC P4M", ALC880_FIXUP_6ST_DIG),
> +	SND_PCI_QUIRK(0x1565, 0x8202, "Biostar", ALC880_FIXUP_5ST_DIG),
> +	SND_PCI_QUIRK(0x1695, 0x400d, "EPoX", ALC880_FIXUP_5ST_DIG),
> +	SND_PCI_QUIRK(0x1695, 0x4012, "EPox EP-5LDA", ALC880_FIXUP_5ST_DIG),
> +	SND_PCI_QUIRK(0x2668, 0x8086, NULL, ALC880_FIXUP_6ST_DIG), /* broken BIOS */
> +	SND_PCI_QUIRK(0x8086, 0x2668, NULL, ALC880_FIXUP_6ST_DIG),
> +	SND_PCI_QUIRK(0x8086, 0xa100, "Intel mobo", ALC880_FIXUP_5ST_DIG),
> +	SND_PCI_QUIRK(0x8086, 0xd400, "Intel mobo", ALC880_FIXUP_5ST_DIG),
> +	SND_PCI_QUIRK(0x8086, 0xd401, "Intel mobo", ALC880_FIXUP_5ST_DIG),
> +	SND_PCI_QUIRK(0x8086, 0xd402, "Intel mobo", ALC880_FIXUP_3ST_DIG),
> +	SND_PCI_QUIRK(0x8086, 0xe224, "Intel mobo", ALC880_FIXUP_5ST_DIG),
> +	SND_PCI_QUIRK(0x8086, 0xe305, "Intel mobo", ALC880_FIXUP_3ST_DIG),
> +	SND_PCI_QUIRK(0x8086, 0xe308, "Intel mobo", ALC880_FIXUP_3ST_DIG),
> +	SND_PCI_QUIRK(0x8086, 0xe400, "Intel mobo", ALC880_FIXUP_5ST_DIG),
> +	SND_PCI_QUIRK(0x8086, 0xe401, "Intel mobo", ALC880_FIXUP_5ST_DIG),
> +	SND_PCI_QUIRK(0x8086, 0xe402, "Intel mobo", ALC880_FIXUP_5ST_DIG),
> +	/* default Intel */
> +	SND_PCI_QUIRK_VENDOR(0x8086, "Intel mobo", ALC880_FIXUP_3ST),
> +	SND_PCI_QUIRK(0xa0a0, 0x0560, "AOpen i915GMm-HFS", ALC880_FIXUP_5ST_DIG),
> +	SND_PCI_QUIRK(0xe803, 0x1019, NULL, ALC880_FIXUP_6ST_DIG),
> +	{}
> +};
> +
> +static const struct hda_model_fixup alc880_fixup_models[] = {
> +	{.id = ALC880_FIXUP_3ST, .name = "3stack"},
> +	{.id = ALC880_FIXUP_3ST_DIG, .name = "3stack-digout"},
> +	{.id = ALC880_FIXUP_5ST, .name = "5stack"},
> +	{.id = ALC880_FIXUP_5ST_DIG, .name = "5stack-digout"},
> +	{.id = ALC880_FIXUP_6ST, .name = "6stack"},
> +	{.id = ALC880_FIXUP_6ST_DIG, .name = "6stack-digout"},
> +	{.id = ALC880_FIXUP_6ST_AUTOMUTE, .name = "6stack-automute"},
> +	{}
> +};
> +
> +
> +/*
> + * OK, here we have finally the patch for ALC880
> + */
> +static int patch_alc880(struct hda_codec *codec)
> +{
> +	struct alc_spec *spec;
> +	int err;
> +
> +	err = alc_alloc_spec(codec, 0x0b);
> +	if (err < 0)
> +		return err;
> +
> +	spec = codec->spec;
> +	spec->gen.need_dac_fix = 1;
> +	spec->gen.beep_nid = 0x01;
> +
> +	codec->patch_ops.unsol_event = alc880_unsol_event;
> +
> +	alc_pre_init(codec);
> +
> +	snd_hda_pick_fixup(codec, alc880_fixup_models, alc880_fixup_tbl,
> +		       alc880_fixups);
> +	snd_hda_apply_fixup(codec, HDA_FIXUP_ACT_PRE_PROBE);
> +
> +	/* automatic parse from the BIOS config */
> +	err = alc880_parse_auto_config(codec);
> +	if (err < 0)
> +		goto error;
> +
> +	if (!spec->gen.no_analog) {
> +		err = set_beep_amp(spec, 0x0b, 0x05, HDA_INPUT);
> +		if (err < 0)
> +			goto error;
> +	}
> +
> +	snd_hda_apply_fixup(codec, HDA_FIXUP_ACT_PROBE);
> +
> +	return 0;
> +
> + error:
> +	alc_free(codec);
> +	return err;
> +}
> +
> +/*
> + * driver entries
> + */
> +static const struct hda_device_id snd_hda_id_alc880[] = {
> +	HDA_CODEC_ENTRY(0x10ec0880, "ALC880", patch_alc880),
> +	{} /* terminator */
> +};
> +MODULE_DEVICE_TABLE(hdaudio, snd_hda_id_alc880);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("Realtek ALC880 HD-audio codec");
> +MODULE_IMPORT_NS("SND_HDA_CODEC_REALTEK");
> +
> +static struct hda_codec_driver alc880_driver = {
> +	.id = snd_hda_id_alc880,
> +};
> +
> +module_hda_codec_driver(alc880_driver);
> diff --git a/sound/hda/codecs/realtek/alc882.c b/sound/hda/codecs/realtek/alc882.c
> new file mode 100644
> index 000000000000..6af2f7fcc6bb
> --- /dev/null
> +++ b/sound/hda/codecs/realtek/alc882.c
> @@ -0,0 +1,847 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +//
> +// Realtek ALC882/883/885/888/889 codec support
> +//
> +// ALC882 is almost identical with ALC880 but has cleaner and more flexible
> +// configuration.  Each pin widget can choose any input DACs and a mixer.
> +// Each ADC is connected from a mixer of all inputs.  This makes possible
> +// 6-channel independent captures.
> +//
> +// In addition, an independent DAC for the multi-playback (not used in this
> +// driver yet).
> +//
> +
> +#include <linux/init.h>
> +#include <linux/module.h>
> +#include "realtek.h"
> +
> +/*
> + * Pin config fixes
> + */
> +enum {
> +	ALC882_FIXUP_ABIT_AW9D_MAX,
> +	ALC882_FIXUP_LENOVO_Y530,
> +	ALC882_FIXUP_PB_M5210,
> +	ALC882_FIXUP_ACER_ASPIRE_7736,
> +	ALC882_FIXUP_ASUS_W90V,
> +	ALC889_FIXUP_CD,
> +	ALC889_FIXUP_FRONT_HP_NO_PRESENCE,
> +	ALC889_FIXUP_VAIO_TT,
> +	ALC888_FIXUP_EEE1601,
> +	ALC886_FIXUP_EAPD,
> +	ALC882_FIXUP_EAPD,
> +	ALC883_FIXUP_EAPD,
> +	ALC883_FIXUP_ACER_EAPD,
> +	ALC882_FIXUP_GPIO1,
> +	ALC882_FIXUP_GPIO2,
> +	ALC882_FIXUP_GPIO3,
> +	ALC889_FIXUP_COEF,
> +	ALC882_FIXUP_ASUS_W2JC,
> +	ALC882_FIXUP_ACER_ASPIRE_4930G,
> +	ALC882_FIXUP_ACER_ASPIRE_8930G,
> +	ALC882_FIXUP_ASPIRE_8930G_VERBS,
> +	ALC885_FIXUP_MACPRO_GPIO,
> +	ALC889_FIXUP_DAC_ROUTE,
> +	ALC889_FIXUP_MBP_VREF,
> +	ALC889_FIXUP_IMAC91_VREF,
> +	ALC889_FIXUP_MBA11_VREF,
> +	ALC889_FIXUP_MBA21_VREF,
> +	ALC889_FIXUP_MP11_VREF,
> +	ALC889_FIXUP_MP41_VREF,
> +	ALC882_FIXUP_INV_DMIC,
> +	ALC882_FIXUP_NO_PRIMARY_HP,
> +	ALC887_FIXUP_ASUS_BASS,
> +	ALC887_FIXUP_BASS_CHMAP,
> +	ALC1220_FIXUP_GB_DUAL_CODECS,
> +	ALC1220_FIXUP_GB_X570,
> +	ALC1220_FIXUP_CLEVO_P950,
> +	ALC1220_FIXUP_CLEVO_PB51ED,
> +	ALC1220_FIXUP_CLEVO_PB51ED_PINS,
> +	ALC887_FIXUP_ASUS_AUDIO,
> +	ALC887_FIXUP_ASUS_HMIC,
> +	ALCS1200A_FIXUP_MIC_VREF,
> +	ALC888VD_FIXUP_MIC_100VREF,
> +};
> +
> +static void alc889_fixup_coef(struct hda_codec *codec,
> +			      const struct hda_fixup *fix, int action)
> +{
> +	if (action != HDA_FIXUP_ACT_INIT)
> +		return;
> +	alc_update_coef_idx(codec, 7, 0, 0x2030);
> +}
> +
> +/* set up GPIO at initialization */
> +static void alc885_fixup_macpro_gpio(struct hda_codec *codec,
> +				     const struct hda_fixup *fix, int action)
> +{
> +	struct alc_spec *spec = codec->spec;
> +
> +	spec->gpio_write_delay = true;
> +	alc_fixup_gpio3(codec, fix, action);
> +}
> +
> +/* Fix the connection of some pins for ALC889:
> + * At least, Acer Aspire 5935 shows the connections to DAC3/4 don't
> + * work correctly (bko#42740)
> + */
> +static void alc889_fixup_dac_route(struct hda_codec *codec,
> +				   const struct hda_fixup *fix, int action)
> +{
> +	if (action == HDA_FIXUP_ACT_PRE_PROBE) {
> +		/* fake the connections during parsing the tree */
> +		static const hda_nid_t conn1[] = { 0x0c, 0x0d };
> +		static const hda_nid_t conn2[] = { 0x0e, 0x0f };
> +		snd_hda_override_conn_list(codec, 0x14, ARRAY_SIZE(conn1), conn1);
> +		snd_hda_override_conn_list(codec, 0x15, ARRAY_SIZE(conn1), conn1);
> +		snd_hda_override_conn_list(codec, 0x18, ARRAY_SIZE(conn2), conn2);
> +		snd_hda_override_conn_list(codec, 0x1a, ARRAY_SIZE(conn2), conn2);
> +	} else if (action == HDA_FIXUP_ACT_PROBE) {
> +		/* restore the connections */
> +		static const hda_nid_t conn[] = { 0x0c, 0x0d, 0x0e, 0x0f, 0x26 };
> +		snd_hda_override_conn_list(codec, 0x14, ARRAY_SIZE(conn), conn);
> +		snd_hda_override_conn_list(codec, 0x15, ARRAY_SIZE(conn), conn);
> +		snd_hda_override_conn_list(codec, 0x18, ARRAY_SIZE(conn), conn);
> +		snd_hda_override_conn_list(codec, 0x1a, ARRAY_SIZE(conn), conn);
> +	}
> +}
> +
> +/* Set VREF on HP pin */
> +static void alc889_fixup_mbp_vref(struct hda_codec *codec,
> +				  const struct hda_fixup *fix, int action)
> +{
> +	static const hda_nid_t nids[] = { 0x14, 0x15, 0x19 };
> +	struct alc_spec *spec = codec->spec;
> +	int i;
> +
> +	if (action != HDA_FIXUP_ACT_INIT)
> +		return;
> +	for (i = 0; i < ARRAY_SIZE(nids); i++) {
> +		unsigned int val = snd_hda_codec_get_pincfg(codec, nids[i]);
> +		if (get_defcfg_device(val) != AC_JACK_HP_OUT)
> +			continue;
> +		val = snd_hda_codec_get_pin_target(codec, nids[i]);
> +		val |= AC_PINCTL_VREF_80;
> +		snd_hda_set_pin_ctl(codec, nids[i], val);
> +		spec->gen.keep_vref_in_automute = 1;
> +		break;
> +	}
> +}
> +
> +static void alc889_fixup_mac_pins(struct hda_codec *codec,
> +				  const hda_nid_t *nids, int num_nids)
> +{
> +	struct alc_spec *spec = codec->spec;
> +	int i;
> +
> +	for (i = 0; i < num_nids; i++) {
> +		unsigned int val;
> +		val = snd_hda_codec_get_pin_target(codec, nids[i]);
> +		val |= AC_PINCTL_VREF_50;
> +		snd_hda_set_pin_ctl(codec, nids[i], val);
> +	}
> +	spec->gen.keep_vref_in_automute = 1;
> +}
> +
> +/* Set VREF on speaker pins on imac91 */
> +static void alc889_fixup_imac91_vref(struct hda_codec *codec,
> +				     const struct hda_fixup *fix, int action)
> +{
> +	static const hda_nid_t nids[] = { 0x18, 0x1a };
> +
> +	if (action == HDA_FIXUP_ACT_INIT)
> +		alc889_fixup_mac_pins(codec, nids, ARRAY_SIZE(nids));
> +}
> +
> +/* Set VREF on speaker pins on mba11 */
> +static void alc889_fixup_mba11_vref(struct hda_codec *codec,
> +				    const struct hda_fixup *fix, int action)
> +{
> +	static const hda_nid_t nids[] = { 0x18 };
> +
> +	if (action == HDA_FIXUP_ACT_INIT)
> +		alc889_fixup_mac_pins(codec, nids, ARRAY_SIZE(nids));
> +}
> +
> +/* Set VREF on speaker pins on mba21 */
> +static void alc889_fixup_mba21_vref(struct hda_codec *codec,
> +				    const struct hda_fixup *fix, int action)
> +{
> +	static const hda_nid_t nids[] = { 0x18, 0x19 };
> +
> +	if (action == HDA_FIXUP_ACT_INIT)
> +		alc889_fixup_mac_pins(codec, nids, ARRAY_SIZE(nids));
> +}
> +
> +/* Don't take HP output as primary
> + * Strangely, the speaker output doesn't work on Vaio Z and some Vaio
> + * all-in-one desktop PCs (for example VGC-LN51JGB) through DAC 0x05
> + */
> +static void alc882_fixup_no_primary_hp(struct hda_codec *codec,
> +				       const struct hda_fixup *fix, int action)
> +{
> +	struct alc_spec *spec = codec->spec;
> +	if (action == HDA_FIXUP_ACT_PRE_PROBE) {
> +		spec->gen.no_primary_hp = 1;
> +		spec->gen.no_multi_io = 1;
> +	}
> +}
> +
> +static void alc1220_fixup_gb_x570(struct hda_codec *codec,
> +				     const struct hda_fixup *fix,
> +				     int action)
> +{
> +	static const hda_nid_t conn1[] = { 0x0c };
> +	static const struct coef_fw gb_x570_coefs[] = {
> +		WRITE_COEF(0x07, 0x03c0),
> +		WRITE_COEF(0x1a, 0x01c1),
> +		WRITE_COEF(0x1b, 0x0202),
> +		WRITE_COEF(0x43, 0x3005),
> +		{}
> +	};
> +
> +	switch (action) {
> +	case HDA_FIXUP_ACT_PRE_PROBE:
> +		snd_hda_override_conn_list(codec, 0x14, ARRAY_SIZE(conn1), conn1);
> +		snd_hda_override_conn_list(codec, 0x1b, ARRAY_SIZE(conn1), conn1);
> +		break;
> +	case HDA_FIXUP_ACT_INIT:
> +		alc_process_coef_fw(codec, gb_x570_coefs);
> +		break;
> +	}
> +}
> +
> +static void alc1220_fixup_clevo_p950(struct hda_codec *codec,
> +				     const struct hda_fixup *fix,
> +				     int action)
> +{
> +	static const hda_nid_t conn1[] = { 0x0c };
> +
> +	if (action != HDA_FIXUP_ACT_PRE_PROBE)
> +		return;
> +
> +	alc_update_coef_idx(codec, 0x7, 0, 0x3c3);
> +	/* We therefore want to make sure 0x14 (front headphone) and
> +	 * 0x1b (speakers) use the stereo DAC 0x02
> +	 */
> +	snd_hda_override_conn_list(codec, 0x14, ARRAY_SIZE(conn1), conn1);
> +	snd_hda_override_conn_list(codec, 0x1b, ARRAY_SIZE(conn1), conn1);
> +}
> +
> +static void alc1220_fixup_clevo_pb51ed(struct hda_codec *codec,
> +				     const struct hda_fixup *fix,
> +				     int action)
> +{
> +	alc1220_fixup_clevo_p950(codec, fix, action);
> +	alc_fixup_headset_mode_no_hp_mic(codec, fix, action);
> +}
> +
> +static void alc887_asus_hp_automute_hook(struct hda_codec *codec,
> +					 struct hda_jack_callback *jack)
> +{
> +	struct alc_spec *spec = codec->spec;
> +	unsigned int vref;
> +
> +	snd_hda_gen_hp_automute(codec, jack);
> +
> +	if (spec->gen.hp_jack_present)
> +		vref = AC_PINCTL_VREF_80;
> +	else
> +		vref = AC_PINCTL_VREF_HIZ;
> +	snd_hda_set_pin_ctl(codec, 0x19, PIN_HP | vref);
> +}
> +
> +static void alc887_fixup_asus_jack(struct hda_codec *codec,
> +				     const struct hda_fixup *fix, int action)
> +{
> +	struct alc_spec *spec = codec->spec;
> +	if (action != HDA_FIXUP_ACT_PROBE)
> +		return;
> +	snd_hda_set_pin_ctl_cache(codec, 0x1b, PIN_HP);
> +	spec->gen.hp_automute_hook = alc887_asus_hp_automute_hook;
> +}
> +
> +static const struct hda_fixup alc882_fixups[] = {
> +	[ALC882_FIXUP_ABIT_AW9D_MAX] = {
> +		.type = HDA_FIXUP_PINS,
> +		.v.pins = (const struct hda_pintbl[]) {
> +			{ 0x15, 0x01080104 }, /* side */
> +			{ 0x16, 0x01011012 }, /* rear */
> +			{ 0x17, 0x01016011 }, /* clfe */
> +			{ }
> +		}
> +	},
> +	[ALC882_FIXUP_LENOVO_Y530] = {
> +		.type = HDA_FIXUP_PINS,
> +		.v.pins = (const struct hda_pintbl[]) {
> +			{ 0x15, 0x99130112 }, /* rear int speakers */
> +			{ 0x16, 0x99130111 }, /* subwoofer */
> +			{ }
> +		}
> +	},
> +	[ALC882_FIXUP_PB_M5210] = {
> +		.type = HDA_FIXUP_PINCTLS,
> +		.v.pins = (const struct hda_pintbl[]) {
> +			{ 0x19, PIN_VREF50 },
> +			{}
> +		}
> +	},
> +	[ALC882_FIXUP_ACER_ASPIRE_7736] = {
> +		.type = HDA_FIXUP_FUNC,
> +		.v.func = alc_fixup_sku_ignore,
> +	},
> +	[ALC882_FIXUP_ASUS_W90V] = {
> +		.type = HDA_FIXUP_PINS,
> +		.v.pins = (const struct hda_pintbl[]) {
> +			{ 0x16, 0x99130110 }, /* fix sequence for CLFE */
> +			{ }
> +		}
> +	},
> +	[ALC889_FIXUP_CD] = {
> +		.type = HDA_FIXUP_PINS,
> +		.v.pins = (const struct hda_pintbl[]) {
> +			{ 0x1c, 0x993301f0 }, /* CD */
> +			{ }
> +		}
> +	},
> +	[ALC889_FIXUP_FRONT_HP_NO_PRESENCE] = {
> +		.type = HDA_FIXUP_PINS,
> +		.v.pins = (const struct hda_pintbl[]) {
> +			{ 0x1b, 0x02214120 }, /* Front HP jack is flaky, disable jack detect */
> +			{ }
> +		},
> +		.chained = true,
> +		.chain_id = ALC889_FIXUP_CD,
> +	},
> +	[ALC889_FIXUP_VAIO_TT] = {
> +		.type = HDA_FIXUP_PINS,
> +		.v.pins = (const struct hda_pintbl[]) {
> +			{ 0x17, 0x90170111 }, /* hidden surround speaker */
> +			{ }
> +		}
> +	},
> +	[ALC888_FIXUP_EEE1601] = {
> +		.type = HDA_FIXUP_VERBS,
> +		.v.verbs = (const struct hda_verb[]) {
> +			{ 0x20, AC_VERB_SET_COEF_INDEX, 0x0b },
> +			{ 0x20, AC_VERB_SET_PROC_COEF,  0x0838 },
> +			{ }
> +		}
> +	},
> +	[ALC886_FIXUP_EAPD] = {
> +		.type = HDA_FIXUP_VERBS,
> +		.v.verbs = (const struct hda_verb[]) {
> +			/* change to EAPD mode */
> +			{ 0x20, AC_VERB_SET_COEF_INDEX, 0x07 },
> +			{ 0x20, AC_VERB_SET_PROC_COEF, 0x0068 },
> +			{ }
> +		}
> +	},
> +	[ALC882_FIXUP_EAPD] = {
> +		.type = HDA_FIXUP_VERBS,
> +		.v.verbs = (const struct hda_verb[]) {
> +			/* change to EAPD mode */
> +			{ 0x20, AC_VERB_SET_COEF_INDEX, 0x07 },
> +			{ 0x20, AC_VERB_SET_PROC_COEF, 0x3060 },
> +			{ }
> +		}
> +	},
> +	[ALC883_FIXUP_EAPD] = {
> +		.type = HDA_FIXUP_VERBS,
> +		.v.verbs = (const struct hda_verb[]) {
> +			/* change to EAPD mode */
> +			{ 0x20, AC_VERB_SET_COEF_INDEX, 0x07 },
> +			{ 0x20, AC_VERB_SET_PROC_COEF, 0x3070 },
> +			{ }
> +		}
> +	},
> +	[ALC883_FIXUP_ACER_EAPD] = {
> +		.type = HDA_FIXUP_VERBS,
> +		.v.verbs = (const struct hda_verb[]) {
> +			/* eanable EAPD on Acer laptops */
> +			{ 0x20, AC_VERB_SET_COEF_INDEX, 0x07 },
> +			{ 0x20, AC_VERB_SET_PROC_COEF, 0x3050 },
> +			{ }
> +		}
> +	},
> +	[ALC882_FIXUP_GPIO1] = {
> +		.type = HDA_FIXUP_FUNC,
> +		.v.func = alc_fixup_gpio1,
> +	},
> +	[ALC882_FIXUP_GPIO2] = {
> +		.type = HDA_FIXUP_FUNC,
> +		.v.func = alc_fixup_gpio2,
> +	},
> +	[ALC882_FIXUP_GPIO3] = {
> +		.type = HDA_FIXUP_FUNC,
> +		.v.func = alc_fixup_gpio3,
> +	},
> +	[ALC882_FIXUP_ASUS_W2JC] = {
> +		.type = HDA_FIXUP_FUNC,
> +		.v.func = alc_fixup_gpio1,
> +		.chained = true,
> +		.chain_id = ALC882_FIXUP_EAPD,
> +	},
> +	[ALC889_FIXUP_COEF] = {
> +		.type = HDA_FIXUP_FUNC,
> +		.v.func = alc889_fixup_coef,
> +	},
> +	[ALC882_FIXUP_ACER_ASPIRE_4930G] = {
> +		.type = HDA_FIXUP_PINS,
> +		.v.pins = (const struct hda_pintbl[]) {
> +			{ 0x16, 0x99130111 }, /* CLFE speaker */
> +			{ 0x17, 0x99130112 }, /* surround speaker */
> +			{ }
> +		},
> +		.chained = true,
> +		.chain_id = ALC882_FIXUP_GPIO1,
> +	},
> +	[ALC882_FIXUP_ACER_ASPIRE_8930G] = {
> +		.type = HDA_FIXUP_PINS,
> +		.v.pins = (const struct hda_pintbl[]) {
> +			{ 0x16, 0x99130111 }, /* CLFE speaker */
> +			{ 0x1b, 0x99130112 }, /* surround speaker */
> +			{ }
> +		},
> +		.chained = true,
> +		.chain_id = ALC882_FIXUP_ASPIRE_8930G_VERBS,
> +	},
> +	[ALC882_FIXUP_ASPIRE_8930G_VERBS] = {
> +		/* additional init verbs for Acer Aspire 8930G */
> +		.type = HDA_FIXUP_VERBS,
> +		.v.verbs = (const struct hda_verb[]) {
> +			/* Enable all DACs */
> +			/* DAC DISABLE/MUTE 1? */
> +			/*  setting bits 1-5 disables DAC nids 0x02-0x06
> +			 *  apparently. Init=0x38 */
> +			{ 0x20, AC_VERB_SET_COEF_INDEX, 0x03 },
> +			{ 0x20, AC_VERB_SET_PROC_COEF, 0x0000 },
> +			/* DAC DISABLE/MUTE 2? */
> +			/*  some bit here disables the other DACs.
> +			 *  Init=0x4900 */
> +			{ 0x20, AC_VERB_SET_COEF_INDEX, 0x08 },
> +			{ 0x20, AC_VERB_SET_PROC_COEF, 0x0000 },
> +			/* DMIC fix
> +			 * This laptop has a stereo digital microphone.
> +			 * The mics are only 1cm apart which makes the stereo
> +			 * useless. However, either the mic or the ALC889
> +			 * makes the signal become a difference/sum signal
> +			 * instead of standard stereo, which is annoying.
> +			 * So instead we flip this bit which makes the
> +			 * codec replicate the sum signal to both channels,
> +			 * turning it into a normal mono mic.
> +			 */
> +			/* DMIC_CONTROL? Init value = 0x0001 */
> +			{ 0x20, AC_VERB_SET_COEF_INDEX, 0x0b },
> +			{ 0x20, AC_VERB_SET_PROC_COEF, 0x0003 },
> +			{ 0x20, AC_VERB_SET_COEF_INDEX, 0x07 },
> +			{ 0x20, AC_VERB_SET_PROC_COEF, 0x3050 },
> +			{ }
> +		},
> +		.chained = true,
> +		.chain_id = ALC882_FIXUP_GPIO1,
> +	},
> +	[ALC885_FIXUP_MACPRO_GPIO] = {
> +		.type = HDA_FIXUP_FUNC,
> +		.v.func = alc885_fixup_macpro_gpio,
> +	},
> +	[ALC889_FIXUP_DAC_ROUTE] = {
> +		.type = HDA_FIXUP_FUNC,
> +		.v.func = alc889_fixup_dac_route,
> +	},
> +	[ALC889_FIXUP_MBP_VREF] = {
> +		.type = HDA_FIXUP_FUNC,
> +		.v.func = alc889_fixup_mbp_vref,
> +		.chained = true,
> +		.chain_id = ALC882_FIXUP_GPIO1,
> +	},
> +	[ALC889_FIXUP_IMAC91_VREF] = {
> +		.type = HDA_FIXUP_FUNC,
> +		.v.func = alc889_fixup_imac91_vref,
> +		.chained = true,
> +		.chain_id = ALC882_FIXUP_GPIO1,
> +	},
> +	[ALC889_FIXUP_MBA11_VREF] = {
> +		.type = HDA_FIXUP_FUNC,
> +		.v.func = alc889_fixup_mba11_vref,
> +		.chained = true,
> +		.chain_id = ALC889_FIXUP_MBP_VREF,
> +	},
> +	[ALC889_FIXUP_MBA21_VREF] = {
> +		.type = HDA_FIXUP_FUNC,
> +		.v.func = alc889_fixup_mba21_vref,
> +		.chained = true,
> +		.chain_id = ALC889_FIXUP_MBP_VREF,
> +	},
> +	[ALC889_FIXUP_MP11_VREF] = {
> +		.type = HDA_FIXUP_FUNC,
> +		.v.func = alc889_fixup_mba11_vref,
> +		.chained = true,
> +		.chain_id = ALC885_FIXUP_MACPRO_GPIO,
> +	},
> +	[ALC889_FIXUP_MP41_VREF] = {
> +		.type = HDA_FIXUP_FUNC,
> +		.v.func = alc889_fixup_mbp_vref,
> +		.chained = true,
> +		.chain_id = ALC885_FIXUP_MACPRO_GPIO,
> +	},
> +	[ALC882_FIXUP_INV_DMIC] = {
> +		.type = HDA_FIXUP_FUNC,
> +		.v.func = alc_fixup_inv_dmic,
> +	},
> +	[ALC882_FIXUP_NO_PRIMARY_HP] = {
> +		.type = HDA_FIXUP_FUNC,
> +		.v.func = alc882_fixup_no_primary_hp,
> +	},
> +	[ALC887_FIXUP_ASUS_BASS] = {
> +		.type = HDA_FIXUP_PINS,
> +		.v.pins = (const struct hda_pintbl[]) {
> +			{0x16, 0x99130130}, /* bass speaker */
> +			{}
> +		},
> +		.chained = true,
> +		.chain_id = ALC887_FIXUP_BASS_CHMAP,
> +	},
> +	[ALC887_FIXUP_BASS_CHMAP] = {
> +		.type = HDA_FIXUP_FUNC,
> +		.v.func = alc_fixup_bass_chmap,
> +	},
> +	[ALC1220_FIXUP_GB_DUAL_CODECS] = {
> +		.type = HDA_FIXUP_FUNC,
> +		.v.func = alc1220_fixup_gb_dual_codecs,
> +	},
> +	[ALC1220_FIXUP_GB_X570] = {
> +		.type = HDA_FIXUP_FUNC,
> +		.v.func = alc1220_fixup_gb_x570,
> +	},
> +	[ALC1220_FIXUP_CLEVO_P950] = {
> +		.type = HDA_FIXUP_FUNC,
> +		.v.func = alc1220_fixup_clevo_p950,
> +	},
> +	[ALC1220_FIXUP_CLEVO_PB51ED] = {
> +		.type = HDA_FIXUP_FUNC,
> +		.v.func = alc1220_fixup_clevo_pb51ed,
> +	},
> +	[ALC1220_FIXUP_CLEVO_PB51ED_PINS] = {
> +		.type = HDA_FIXUP_PINS,
> +		.v.pins = (const struct hda_pintbl[]) {
> +			{ 0x19, 0x01a1913c }, /* use as headset mic, without its own jack detect */
> +			{}
> +		},
> +		.chained = true,
> +		.chain_id = ALC1220_FIXUP_CLEVO_PB51ED,
> +	},
> +	[ALC887_FIXUP_ASUS_AUDIO] = {
> +		.type = HDA_FIXUP_PINS,
> +		.v.pins = (const struct hda_pintbl[]) {
> +			{ 0x15, 0x02a14150 }, /* use as headset mic, without its own jack detect */
> +			{ 0x19, 0x22219420 },
> +			{}
> +		},
> +	},
> +	[ALC887_FIXUP_ASUS_HMIC] = {
> +		.type = HDA_FIXUP_FUNC,
> +		.v.func = alc887_fixup_asus_jack,
> +		.chained = true,
> +		.chain_id = ALC887_FIXUP_ASUS_AUDIO,
> +	},
> +	[ALCS1200A_FIXUP_MIC_VREF] = {
> +		.type = HDA_FIXUP_PINCTLS,
> +		.v.pins = (const struct hda_pintbl[]) {
> +			{ 0x18, PIN_VREF50 }, /* rear mic */
> +			{ 0x19, PIN_VREF50 }, /* front mic */
> +			{}
> +		}
> +	},
> +	[ALC888VD_FIXUP_MIC_100VREF] = {
> +		.type = HDA_FIXUP_PINCTLS,
> +		.v.pins = (const struct hda_pintbl[]) {
> +			{ 0x18, PIN_VREF100 }, /* headset mic */
> +			{}
> +		}
> +	},
> +};
> +
> +static const struct hda_quirk alc882_fixup_tbl[] = {
> +	SND_PCI_QUIRK(0x1025, 0x006c, "Acer Aspire 9810", ALC883_FIXUP_ACER_EAPD),
> +	SND_PCI_QUIRK(0x1025, 0x0090, "Acer Aspire", ALC883_FIXUP_ACER_EAPD),
> +	SND_PCI_QUIRK(0x1025, 0x0107, "Acer Aspire", ALC883_FIXUP_ACER_EAPD),
> +	SND_PCI_QUIRK(0x1025, 0x010a, "Acer Ferrari 5000", ALC883_FIXUP_ACER_EAPD),
> +	SND_PCI_QUIRK(0x1025, 0x0110, "Acer Aspire", ALC883_FIXUP_ACER_EAPD),
> +	SND_PCI_QUIRK(0x1025, 0x0112, "Acer Aspire 9303", ALC883_FIXUP_ACER_EAPD),
> +	SND_PCI_QUIRK(0x1025, 0x0121, "Acer Aspire 5920G", ALC883_FIXUP_ACER_EAPD),
> +	SND_PCI_QUIRK(0x1025, 0x013e, "Acer Aspire 4930G",
> +		      ALC882_FIXUP_ACER_ASPIRE_4930G),
> +	SND_PCI_QUIRK(0x1025, 0x013f, "Acer Aspire 5930G",
> +		      ALC882_FIXUP_ACER_ASPIRE_4930G),
> +	SND_PCI_QUIRK(0x1025, 0x0145, "Acer Aspire 8930G",
> +		      ALC882_FIXUP_ACER_ASPIRE_8930G),
> +	SND_PCI_QUIRK(0x1025, 0x0146, "Acer Aspire 6935G",
> +		      ALC882_FIXUP_ACER_ASPIRE_8930G),
> +	SND_PCI_QUIRK(0x1025, 0x0142, "Acer Aspire 7730G",
> +		      ALC882_FIXUP_ACER_ASPIRE_4930G),
> +	SND_PCI_QUIRK(0x1025, 0x0155, "Packard-Bell M5120", ALC882_FIXUP_PB_M5210),
> +	SND_PCI_QUIRK(0x1025, 0x015e, "Acer Aspire 6930G",
> +		      ALC882_FIXUP_ACER_ASPIRE_4930G),
> +	SND_PCI_QUIRK(0x1025, 0x0166, "Acer Aspire 6530G",
> +		      ALC882_FIXUP_ACER_ASPIRE_4930G),
> +	SND_PCI_QUIRK(0x1025, 0x021e, "Acer Aspire 5739G",
> +		      ALC882_FIXUP_ACER_ASPIRE_4930G),
> +	SND_PCI_QUIRK(0x1025, 0x0259, "Acer Aspire 5935", ALC889_FIXUP_DAC_ROUTE),
> +	SND_PCI_QUIRK(0x1025, 0x026b, "Acer Aspire 8940G", ALC882_FIXUP_ACER_ASPIRE_8930G),
> +	SND_PCI_QUIRK(0x1025, 0x0296, "Acer Aspire 7736z", ALC882_FIXUP_ACER_ASPIRE_7736),
> +	SND_PCI_QUIRK(0x1043, 0x13c2, "Asus A7M", ALC882_FIXUP_EAPD),
> +	SND_PCI_QUIRK(0x1043, 0x1873, "ASUS W90V", ALC882_FIXUP_ASUS_W90V),
> +	SND_PCI_QUIRK(0x1043, 0x1971, "Asus W2JC", ALC882_FIXUP_ASUS_W2JC),
> +	SND_PCI_QUIRK(0x1043, 0x2390, "Asus D700SA", ALC887_FIXUP_ASUS_HMIC),
> +	SND_PCI_QUIRK(0x1043, 0x835f, "Asus Eee 1601", ALC888_FIXUP_EEE1601),
> +	SND_PCI_QUIRK(0x1043, 0x84bc, "ASUS ET2700", ALC887_FIXUP_ASUS_BASS),
> +	SND_PCI_QUIRK(0x1043, 0x8691, "ASUS ROG Ranger VIII", ALC882_FIXUP_GPIO3),
> +	SND_PCI_QUIRK(0x1043, 0x8797, "ASUS TUF B550M-PLUS", ALCS1200A_FIXUP_MIC_VREF),
> +	SND_PCI_QUIRK(0x104d, 0x9043, "Sony Vaio VGC-LN51JGB", ALC882_FIXUP_NO_PRIMARY_HP),
> +	SND_PCI_QUIRK(0x104d, 0x9044, "Sony VAIO AiO", ALC882_FIXUP_NO_PRIMARY_HP),
> +	SND_PCI_QUIRK(0x104d, 0x9047, "Sony Vaio TT", ALC889_FIXUP_VAIO_TT),
> +	SND_PCI_QUIRK(0x104d, 0x905a, "Sony Vaio Z", ALC882_FIXUP_NO_PRIMARY_HP),
> +	SND_PCI_QUIRK(0x104d, 0x9060, "Sony Vaio VPCL14M1R", ALC882_FIXUP_NO_PRIMARY_HP),
> +
> +	/* All Apple entries are in codec SSIDs */
> +	SND_PCI_QUIRK(0x106b, 0x00a0, "MacBookPro 3,1", ALC889_FIXUP_MBP_VREF),
> +	SND_PCI_QUIRK(0x106b, 0x00a1, "Macbook", ALC889_FIXUP_MBP_VREF),
> +	SND_PCI_QUIRK(0x106b, 0x00a4, "MacbookPro 4,1", ALC889_FIXUP_MBP_VREF),
> +	SND_PCI_QUIRK(0x106b, 0x0c00, "Mac Pro", ALC889_FIXUP_MP11_VREF),
> +	SND_PCI_QUIRK(0x106b, 0x1000, "iMac 24", ALC885_FIXUP_MACPRO_GPIO),
> +	SND_PCI_QUIRK(0x106b, 0x2800, "AppleTV", ALC885_FIXUP_MACPRO_GPIO),
> +	SND_PCI_QUIRK(0x106b, 0x2c00, "MacbookPro rev3", ALC889_FIXUP_MBP_VREF),
> +	SND_PCI_QUIRK(0x106b, 0x3000, "iMac", ALC889_FIXUP_MBP_VREF),
> +	SND_PCI_QUIRK(0x106b, 0x3200, "iMac 7,1 Aluminum", ALC882_FIXUP_EAPD),
> +	SND_PCI_QUIRK(0x106b, 0x3400, "MacBookAir 1,1", ALC889_FIXUP_MBA11_VREF),
> +	SND_PCI_QUIRK(0x106b, 0x3500, "MacBookAir 2,1", ALC889_FIXUP_MBA21_VREF),
> +	SND_PCI_QUIRK(0x106b, 0x3600, "Macbook 3,1", ALC889_FIXUP_MBP_VREF),
> +	SND_PCI_QUIRK(0x106b, 0x3800, "MacbookPro 4,1", ALC889_FIXUP_MBP_VREF),
> +	SND_PCI_QUIRK(0x106b, 0x3e00, "iMac 24 Aluminum", ALC885_FIXUP_MACPRO_GPIO),
> +	SND_PCI_QUIRK(0x106b, 0x3f00, "Macbook 5,1", ALC889_FIXUP_IMAC91_VREF),
> +	SND_PCI_QUIRK(0x106b, 0x4000, "MacbookPro 5,1", ALC889_FIXUP_IMAC91_VREF),
> +	SND_PCI_QUIRK(0x106b, 0x4100, "Macmini 3,1", ALC889_FIXUP_IMAC91_VREF),
> +	SND_PCI_QUIRK(0x106b, 0x4200, "Mac Pro 4,1/5,1", ALC889_FIXUP_MP41_VREF),
> +	SND_PCI_QUIRK(0x106b, 0x4300, "iMac 9,1", ALC889_FIXUP_IMAC91_VREF),
> +	SND_PCI_QUIRK(0x106b, 0x4600, "MacbookPro 5,2", ALC889_FIXUP_IMAC91_VREF),
> +	SND_PCI_QUIRK(0x106b, 0x4900, "iMac 9,1 Aluminum", ALC889_FIXUP_IMAC91_VREF),
> +	SND_PCI_QUIRK(0x106b, 0x4a00, "Macbook 5,2", ALC889_FIXUP_MBA11_VREF),
> +
> +	SND_PCI_QUIRK(0x1071, 0x8258, "Evesham Voyaeger", ALC882_FIXUP_EAPD),
> +	SND_PCI_QUIRK(0x10ec, 0x12d8, "iBase Elo Touch", ALC888VD_FIXUP_MIC_100VREF),
> +	SND_PCI_QUIRK(0x13fe, 0x1009, "Advantech MIT-W101", ALC886_FIXUP_EAPD),
> +	SND_PCI_QUIRK(0x1458, 0xa002, "Gigabyte EP45-DS3/Z87X-UD3H", ALC889_FIXUP_FRONT_HP_NO_PRESENCE),
> +	SND_PCI_QUIRK(0x1458, 0xa0b8, "Gigabyte AZ370-Gaming", ALC1220_FIXUP_GB_DUAL_CODECS),
> +	SND_PCI_QUIRK(0x1458, 0xa0cd, "Gigabyte X570 Aorus Master", ALC1220_FIXUP_GB_X570),
> +	SND_PCI_QUIRK(0x1458, 0xa0ce, "Gigabyte X570 Aorus Xtreme", ALC1220_FIXUP_GB_X570),
> +	SND_PCI_QUIRK(0x1458, 0xa0d5, "Gigabyte X570S Aorus Master", ALC1220_FIXUP_GB_X570),
> +	SND_PCI_QUIRK(0x1462, 0x11f7, "MSI-GE63", ALC1220_FIXUP_CLEVO_P950),
> +	SND_PCI_QUIRK(0x1462, 0x1228, "MSI-GP63", ALC1220_FIXUP_CLEVO_P950),
> +	SND_PCI_QUIRK(0x1462, 0x1229, "MSI-GP73", ALC1220_FIXUP_CLEVO_P950),
> +	SND_PCI_QUIRK(0x1462, 0x1275, "MSI-GL63", ALC1220_FIXUP_CLEVO_P950),
> +	SND_PCI_QUIRK(0x1462, 0x1276, "MSI-GL73", ALC1220_FIXUP_CLEVO_P950),
> +	SND_PCI_QUIRK(0x1462, 0x1293, "MSI-GP65", ALC1220_FIXUP_CLEVO_P950),
> +	SND_PCI_QUIRK(0x1462, 0x7350, "MSI-7350", ALC889_FIXUP_CD),
> +	SND_PCI_QUIRK(0x1462, 0xcc34, "MSI Godlike X570", ALC1220_FIXUP_GB_DUAL_CODECS),
> +	SND_PCI_QUIRK(0x1462, 0xda57, "MSI Z270-Gaming", ALC1220_FIXUP_GB_DUAL_CODECS),
> +	SND_PCI_QUIRK_VENDOR(0x1462, "MSI", ALC882_FIXUP_GPIO3),
> +	SND_PCI_QUIRK(0x147b, 0x107a, "Abit AW9D-MAX", ALC882_FIXUP_ABIT_AW9D_MAX),
> +	SND_PCI_QUIRK(0x1558, 0x3702, "Clevo X370SN[VW]", ALC1220_FIXUP_CLEVO_PB51ED_PINS),
> +	SND_PCI_QUIRK(0x1558, 0x50d3, "Clevo PC50[ER][CDF]", ALC1220_FIXUP_CLEVO_PB51ED_PINS),
> +	SND_PCI_QUIRK(0x1558, 0x5802, "Clevo X58[05]WN[RST]", ALC1220_FIXUP_CLEVO_PB51ED_PINS),
> +	SND_PCI_QUIRK(0x1558, 0x65d1, "Clevo PB51[ER][CDF]", ALC1220_FIXUP_CLEVO_PB51ED_PINS),
> +	SND_PCI_QUIRK(0x1558, 0x65d2, "Clevo PB51R[CDF]", ALC1220_FIXUP_CLEVO_PB51ED_PINS),
> +	SND_PCI_QUIRK(0x1558, 0x65e1, "Clevo PB51[ED][DF]", ALC1220_FIXUP_CLEVO_PB51ED_PINS),
> +	SND_PCI_QUIRK(0x1558, 0x65e5, "Clevo PC50D[PRS](?:-D|-G)?", ALC1220_FIXUP_CLEVO_PB51ED_PINS),
> +	SND_PCI_QUIRK(0x1558, 0x65f1, "Clevo PC50HS", ALC1220_FIXUP_CLEVO_PB51ED_PINS),
> +	SND_PCI_QUIRK(0x1558, 0x65f5, "Clevo PD50PN[NRT]", ALC1220_FIXUP_CLEVO_PB51ED_PINS),
> +	SND_PCI_QUIRK(0x1558, 0x66a2, "Clevo PE60RNE", ALC1220_FIXUP_CLEVO_PB51ED_PINS),
> +	SND_PCI_QUIRK(0x1558, 0x66a6, "Clevo PE60SN[CDE]-[GS]", ALC1220_FIXUP_CLEVO_PB51ED_PINS),
> +	SND_PCI_QUIRK(0x1558, 0x67d1, "Clevo PB71[ER][CDF]", ALC1220_FIXUP_CLEVO_PB51ED_PINS),
> +	SND_PCI_QUIRK(0x1558, 0x67e1, "Clevo PB71[DE][CDF]", ALC1220_FIXUP_CLEVO_PB51ED_PINS),
> +	SND_PCI_QUIRK(0x1558, 0x67e5, "Clevo PC70D[PRS](?:-D|-G)?", ALC1220_FIXUP_CLEVO_PB51ED_PINS),
> +	SND_PCI_QUIRK(0x1558, 0x67f1, "Clevo PC70H[PRS]", ALC1220_FIXUP_CLEVO_PB51ED_PINS),
> +	SND_PCI_QUIRK(0x1558, 0x67f5, "Clevo PD70PN[NRT]", ALC1220_FIXUP_CLEVO_PB51ED_PINS),
> +	SND_PCI_QUIRK(0x1558, 0x70d1, "Clevo PC70[ER][CDF]", ALC1220_FIXUP_CLEVO_PB51ED_PINS),
> +	SND_PCI_QUIRK(0x1558, 0x7714, "Clevo X170SM", ALC1220_FIXUP_CLEVO_PB51ED_PINS),
> +	SND_PCI_QUIRK(0x1558, 0x7715, "Clevo X170KM-G", ALC1220_FIXUP_CLEVO_PB51ED),
> +	SND_PCI_QUIRK(0x1558, 0x9501, "Clevo P950HR", ALC1220_FIXUP_CLEVO_P950),
> +	SND_PCI_QUIRK(0x1558, 0x9506, "Clevo P955HQ", ALC1220_FIXUP_CLEVO_P950),
> +	SND_PCI_QUIRK(0x1558, 0x950a, "Clevo P955H[PR]", ALC1220_FIXUP_CLEVO_P950),
> +	SND_PCI_QUIRK(0x1558, 0x95e1, "Clevo P95xER", ALC1220_FIXUP_CLEVO_P950),
> +	SND_PCI_QUIRK(0x1558, 0x95e2, "Clevo P950ER", ALC1220_FIXUP_CLEVO_P950),
> +	SND_PCI_QUIRK(0x1558, 0x95e3, "Clevo P955[ER]T", ALC1220_FIXUP_CLEVO_P950),
> +	SND_PCI_QUIRK(0x1558, 0x95e4, "Clevo P955ER", ALC1220_FIXUP_CLEVO_P950),
> +	SND_PCI_QUIRK(0x1558, 0x95e5, "Clevo P955EE6", ALC1220_FIXUP_CLEVO_P950),
> +	SND_PCI_QUIRK(0x1558, 0x95e6, "Clevo P950R[CDF]", ALC1220_FIXUP_CLEVO_P950),
> +	SND_PCI_QUIRK(0x1558, 0x96e1, "Clevo P960[ER][CDFN]-K", ALC1220_FIXUP_CLEVO_P950),
> +	SND_PCI_QUIRK(0x1558, 0x97e1, "Clevo P970[ER][CDFN]", ALC1220_FIXUP_CLEVO_P950),
> +	SND_PCI_QUIRK(0x1558, 0x97e2, "Clevo P970RC-M", ALC1220_FIXUP_CLEVO_P950),
> +	SND_PCI_QUIRK(0x1558, 0xd502, "Clevo PD50SNE", ALC1220_FIXUP_CLEVO_PB51ED_PINS),
> +	SND_PCI_QUIRK_VENDOR(0x1558, "Clevo laptop", ALC882_FIXUP_EAPD),
> +	SND_PCI_QUIRK(0x161f, 0x2054, "Medion laptop", ALC883_FIXUP_EAPD),
> +	SND_PCI_QUIRK(0x17aa, 0x3a0d, "Lenovo Y530", ALC882_FIXUP_LENOVO_Y530),
> +	SND_PCI_QUIRK(0x8086, 0x0022, "DX58SO", ALC889_FIXUP_COEF),
> +	{}
> +};
> +
> +static const struct hda_model_fixup alc882_fixup_models[] = {
> +	{.id = ALC882_FIXUP_ABIT_AW9D_MAX, .name = "abit-aw9d"},
> +	{.id = ALC882_FIXUP_LENOVO_Y530, .name = "lenovo-y530"},
> +	{.id = ALC882_FIXUP_ACER_ASPIRE_7736, .name = "acer-aspire-7736"},
> +	{.id = ALC882_FIXUP_ASUS_W90V, .name = "asus-w90v"},
> +	{.id = ALC889_FIXUP_CD, .name = "cd"},
> +	{.id = ALC889_FIXUP_FRONT_HP_NO_PRESENCE, .name = "no-front-hp"},
> +	{.id = ALC889_FIXUP_VAIO_TT, .name = "vaio-tt"},
> +	{.id = ALC888_FIXUP_EEE1601, .name = "eee1601"},
> +	{.id = ALC882_FIXUP_EAPD, .name = "alc882-eapd"},
> +	{.id = ALC883_FIXUP_EAPD, .name = "alc883-eapd"},
> +	{.id = ALC882_FIXUP_GPIO1, .name = "gpio1"},
> +	{.id = ALC882_FIXUP_GPIO2, .name = "gpio2"},
> +	{.id = ALC882_FIXUP_GPIO3, .name = "gpio3"},
> +	{.id = ALC889_FIXUP_COEF, .name = "alc889-coef"},
> +	{.id = ALC882_FIXUP_ASUS_W2JC, .name = "asus-w2jc"},
> +	{.id = ALC882_FIXUP_ACER_ASPIRE_4930G, .name = "acer-aspire-4930g"},
> +	{.id = ALC882_FIXUP_ACER_ASPIRE_8930G, .name = "acer-aspire-8930g"},
> +	{.id = ALC883_FIXUP_ACER_EAPD, .name = "acer-aspire"},
> +	{.id = ALC885_FIXUP_MACPRO_GPIO, .name = "macpro-gpio"},
> +	{.id = ALC889_FIXUP_DAC_ROUTE, .name = "dac-route"},
> +	{.id = ALC889_FIXUP_MBP_VREF, .name = "mbp-vref"},
> +	{.id = ALC889_FIXUP_IMAC91_VREF, .name = "imac91-vref"},
> +	{.id = ALC889_FIXUP_MBA11_VREF, .name = "mba11-vref"},
> +	{.id = ALC889_FIXUP_MBA21_VREF, .name = "mba21-vref"},
> +	{.id = ALC889_FIXUP_MP11_VREF, .name = "mp11-vref"},
> +	{.id = ALC889_FIXUP_MP41_VREF, .name = "mp41-vref"},
> +	{.id = ALC882_FIXUP_INV_DMIC, .name = "inv-dmic"},
> +	{.id = ALC882_FIXUP_NO_PRIMARY_HP, .name = "no-primary-hp"},
> +	{.id = ALC887_FIXUP_ASUS_BASS, .name = "asus-bass"},
> +	{.id = ALC1220_FIXUP_GB_DUAL_CODECS, .name = "dual-codecs"},
> +	{.id = ALC1220_FIXUP_GB_X570, .name = "gb-x570"},
> +	{.id = ALC1220_FIXUP_CLEVO_P950, .name = "clevo-p950"},
> +	{}
> +};
> +
> +static const struct snd_hda_pin_quirk alc882_pin_fixup_tbl[] = {
> +	SND_HDA_PIN_QUIRK(0x10ec1220, 0x1043, "ASUS", ALC1220_FIXUP_CLEVO_P950,
> +		{0x14, 0x01014010},
> +		{0x15, 0x01011012},
> +		{0x16, 0x01016011},
> +		{0x18, 0x01a19040},
> +		{0x19, 0x02a19050},
> +		{0x1a, 0x0181304f},
> +		{0x1b, 0x0221401f},
> +		{0x1e, 0x01456130}),
> +	SND_HDA_PIN_QUIRK(0x10ec1220, 0x1462, "MS-7C35", ALC1220_FIXUP_CLEVO_P950,
> +		{0x14, 0x01015010},
> +		{0x15, 0x01011012},
> +		{0x16, 0x01011011},
> +		{0x18, 0x01a11040},
> +		{0x19, 0x02a19050},
> +		{0x1a, 0x0181104f},
> +		{0x1b, 0x0221401f},
> +		{0x1e, 0x01451130}),
> +	{}
> +};
> +
> +/*
> + * BIOS auto configuration
> + */
> +/* almost identical with ALC880 parser... */
> +static int alc882_parse_auto_config(struct hda_codec *codec)
> +{
> +	static const hda_nid_t alc882_ignore[] = { 0x1d, 0 };
> +	static const hda_nid_t alc882_ssids[] = { 0x15, 0x1b, 0x14, 0 };
> +	return alc_parse_auto_config(codec, alc882_ignore, alc882_ssids);
> +}
> +
> +/*
> + */
> +static int patch_alc882(struct hda_codec *codec)
> +{
> +	struct alc_spec *spec;
> +	int err;
> +
> +	err = alc_alloc_spec(codec, 0x0b);
> +	if (err < 0)
> +		return err;
> +
> +	spec = codec->spec;
> +
> +	switch (codec->core.vendor_id) {
> +	case 0x10ec0882:
> +	case 0x10ec0885:
> +	case 0x10ec0900:
> +	case 0x10ec0b00:
> +	case 0x10ec1220:
> +		break;
> +	default:
> +		/* ALC883 and variants */
> +		alc_fix_pll_init(codec, 0x20, 0x0a, 10);
> +		break;
> +	}
> +
> +	alc_pre_init(codec);
> +
> +	snd_hda_pick_fixup(codec, alc882_fixup_models, alc882_fixup_tbl,
> +		       alc882_fixups);
> +	snd_hda_pick_pin_fixup(codec, alc882_pin_fixup_tbl, alc882_fixups, true);
> +	snd_hda_apply_fixup(codec, HDA_FIXUP_ACT_PRE_PROBE);
> +
> +	alc_auto_parse_customize_define(codec);
> +
> +	if (has_cdefine_beep(codec))
> +		spec->gen.beep_nid = 0x01;
> +
> +	/* automatic parse from the BIOS config */
> +	err = alc882_parse_auto_config(codec);
> +	if (err < 0)
> +		goto error;
> +
> +	if (!spec->gen.no_analog && spec->gen.beep_nid) {
> +		err = set_beep_amp(spec, 0x0b, 0x05, HDA_INPUT);
> +		if (err < 0)
> +			goto error;
> +	}
> +
> +	snd_hda_apply_fixup(codec, HDA_FIXUP_ACT_PROBE);
> +
> +	return 0;
> +
> + error:
> +	alc_free(codec);
> +	return err;
> +}
> +
> +/*
> + * driver entries
> + */
> +static const struct hda_device_id snd_hda_id_alc882[] = {
> +	HDA_CODEC_REV_ENTRY(0x10ec0662, 0x100002, "ALC662 rev2", patch_alc882),
> +	HDA_CODEC_ENTRY(0x10ec0882, "ALC882", patch_alc882),
> +	HDA_CODEC_ENTRY(0x10ec0883, "ALC883", patch_alc882),
> +	HDA_CODEC_REV_ENTRY(0x10ec0885, 0x100101, "ALC889A", patch_alc882),
> +	HDA_CODEC_REV_ENTRY(0x10ec0885, 0x100103, "ALC889A", patch_alc882),
> +	HDA_CODEC_ENTRY(0x10ec0885, "ALC885", patch_alc882),
> +	HDA_CODEC_ENTRY(0x10ec0887, "ALC887", patch_alc882),
> +	HDA_CODEC_REV_ENTRY(0x10ec0888, 0x100101, "ALC1200", patch_alc882),
> +	HDA_CODEC_ENTRY(0x10ec0888, "ALC888", patch_alc882),
> +	HDA_CODEC_ENTRY(0x10ec0889, "ALC889", patch_alc882),
> +	HDA_CODEC_ENTRY(0x10ec0899, "ALC898", patch_alc882),
> +	HDA_CODEC_ENTRY(0x10ec0900, "ALC1150", patch_alc882),
> +	HDA_CODEC_ENTRY(0x10ec0b00, "ALCS1200A", patch_alc882),
> +	HDA_CODEC_ENTRY(0x10ec1168, "ALC1220", patch_alc882),
> +	HDA_CODEC_ENTRY(0x10ec1220, "ALC1220", patch_alc882),
> +	{} /* terminator */
> +};
> +MODULE_DEVICE_TABLE(hdaudio, snd_hda_id_alc882);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("Realtek ALC882 and compatible HD-audio codecs");
> +MODULE_IMPORT_NS("SND_HDA_CODEC_REALTEK");
> +
> +static struct hda_codec_driver alc882_driver = {
> +	.id = snd_hda_id_alc882,
> +};
> +
> +module_hda_codec_driver(alc882_driver);
> diff --git a/sound/hda/codecs/realtek/realtek.c b/sound/hda/codecs/realtek/realtek.c
> new file mode 100644
> index 000000000000..4ab49e76c304
> --- /dev/null
> +++ b/sound/hda/codecs/realtek/realtek.c
> @@ -0,0 +1,2314 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +//
> +// Realtek HD-audio codec support code
> +//
> +
> +#include <linux/init.h>
> +#include <linux/module.h>
> +#include "realtek.h"
> +
> +/*
> + * COEF access helper functions
> + */
> +
> +static void coef_mutex_lock(struct hda_codec *codec)
> +{
> +	struct alc_spec *spec = codec->spec;
> +
> +	snd_hda_power_up_pm(codec);
> +	mutex_lock(&spec->coef_mutex);
> +}
> +
> +static void coef_mutex_unlock(struct hda_codec *codec)
> +{
> +	struct alc_spec *spec = codec->spec;
> +
> +	mutex_unlock(&spec->coef_mutex);
> +	snd_hda_power_down_pm(codec);
> +}
> +
> +static int __alc_read_coefex_idx(struct hda_codec *codec, hda_nid_t nid,
> +				 unsigned int coef_idx)
> +{
> +	unsigned int val;
> +
> +	snd_hda_codec_write(codec, nid, 0, AC_VERB_SET_COEF_INDEX, coef_idx);
> +	val = snd_hda_codec_read(codec, nid, 0, AC_VERB_GET_PROC_COEF, 0);
> +	return val;
> +}
> +
> +int alc_read_coefex_idx(struct hda_codec *codec, hda_nid_t nid,
> +			unsigned int coef_idx)
> +{
> +	unsigned int val;
> +
> +	coef_mutex_lock(codec);
> +	val = __alc_read_coefex_idx(codec, nid, coef_idx);
> +	coef_mutex_unlock(codec);
> +	return val;
> +}
> +EXPORT_SYMBOL_NS_GPL(alc_read_coefex_idx, "SND_HDA_CODEC_REALTEK");
> +
> +static void __alc_write_coefex_idx(struct hda_codec *codec, hda_nid_t nid,
> +				   unsigned int coef_idx, unsigned int coef_val)
> +{
> +	snd_hda_codec_write(codec, nid, 0, AC_VERB_SET_COEF_INDEX, coef_idx);
> +	snd_hda_codec_write(codec, nid, 0, AC_VERB_SET_PROC_COEF, coef_val);
> +}
> +
> +void alc_write_coefex_idx(struct hda_codec *codec, hda_nid_t nid,
> +			  unsigned int coef_idx, unsigned int coef_val)
> +{
> +	coef_mutex_lock(codec);
> +	__alc_write_coefex_idx(codec, nid, coef_idx, coef_val);
> +	coef_mutex_unlock(codec);
> +}
> +EXPORT_SYMBOL_NS_GPL(alc_write_coefex_idx, "SND_HDA_CODEC_REALTEK");
> +
> +static void __alc_update_coefex_idx(struct hda_codec *codec, hda_nid_t nid,
> +				    unsigned int coef_idx, unsigned int mask,
> +				    unsigned int bits_set)
> +{
> +	unsigned int val = __alc_read_coefex_idx(codec, nid, coef_idx);
> +
> +	if (val != -1)
> +		__alc_write_coefex_idx(codec, nid, coef_idx,
> +				       (val & ~mask) | bits_set);
> +}
> +
> +void alc_update_coefex_idx(struct hda_codec *codec, hda_nid_t nid,
> +			   unsigned int coef_idx, unsigned int mask,
> +			   unsigned int bits_set)
> +{
> +	coef_mutex_lock(codec);
> +	__alc_update_coefex_idx(codec, nid, coef_idx, mask, bits_set);
> +	coef_mutex_unlock(codec);
> +}
> +EXPORT_SYMBOL_NS_GPL(alc_update_coefex_idx, "SND_HDA_CODEC_REALTEK");
> +
> +/* a special bypass for COEF 0; read the cached value at the second time */
> +unsigned int alc_get_coef0(struct hda_codec *codec)
> +{
> +	struct alc_spec *spec = codec->spec;
> +
> +	if (!spec->coef0)
> +		spec->coef0 = alc_read_coef_idx(codec, 0);
> +	return spec->coef0;
> +}
> +EXPORT_SYMBOL_NS_GPL(alc_get_coef0, "SND_HDA_CODEC_REALTEK");
> +
> +void alc_process_coef_fw(struct hda_codec *codec, const struct coef_fw *fw)
> +{
> +	coef_mutex_lock(codec);
> +	for (; fw->nid; fw++) {
> +		if (fw->mask == (unsigned short)-1)
> +			__alc_write_coefex_idx(codec, fw->nid, fw->idx, fw->val);
> +		else
> +			__alc_update_coefex_idx(codec, fw->nid, fw->idx,
> +						fw->mask, fw->val);
> +	}
> +	coef_mutex_unlock(codec);
> +}
> +EXPORT_SYMBOL_NS_GPL(alc_process_coef_fw, "SND_HDA_CODEC_REALTEK");
> +
> +/*
> + * GPIO setup tables, used in initialization
> + */
> +
> +/* Enable GPIO mask and set output */
> +void alc_setup_gpio(struct hda_codec *codec, unsigned int mask)
> +{
> +	struct alc_spec *spec = codec->spec;
> +
> +	spec->gpio_mask |= mask;
> +	spec->gpio_dir |= mask;
> +	spec->gpio_data |= mask;
> +}
> +EXPORT_SYMBOL_NS_GPL(alc_setup_gpio, "SND_HDA_CODEC_REALTEK");
> +
> +void alc_write_gpio_data(struct hda_codec *codec)
> +{
> +	struct alc_spec *spec = codec->spec;
> +
> +	snd_hda_codec_write(codec, 0x01, 0, AC_VERB_SET_GPIO_DATA,
> +			    spec->gpio_data);
> +}
> +EXPORT_SYMBOL_NS_GPL(alc_write_gpio_data, "SND_HDA_CODEC_REALTEK");
> +
> +void alc_update_gpio_data(struct hda_codec *codec, unsigned int mask,
> +			  bool on)
> +{
> +	struct alc_spec *spec = codec->spec;
> +	unsigned int oldval = spec->gpio_data;
> +
> +	if (on)
> +		spec->gpio_data |= mask;
> +	else
> +		spec->gpio_data &= ~mask;
> +	if (oldval != spec->gpio_data)
> +		alc_write_gpio_data(codec);
> +}
> +EXPORT_SYMBOL_NS_GPL(alc_update_gpio_data, "SND_HDA_CODEC_REALTEK");
> +
> +void alc_write_gpio(struct hda_codec *codec)
> +{
> +	struct alc_spec *spec = codec->spec;
> +
> +	if (!spec->gpio_mask)
> +		return;
> +
> +	snd_hda_codec_write(codec, codec->core.afg, 0,
> +			    AC_VERB_SET_GPIO_MASK, spec->gpio_mask);
> +	snd_hda_codec_write(codec, codec->core.afg, 0,
> +			    AC_VERB_SET_GPIO_DIRECTION, spec->gpio_dir);
> +	if (spec->gpio_write_delay)
> +		msleep(1);
> +	alc_write_gpio_data(codec);
> +}
> +EXPORT_SYMBOL_NS_GPL(alc_write_gpio, "SND_HDA_CODEC_REALTEK");
> +
> +void alc_fixup_gpio(struct hda_codec *codec, int action, unsigned int mask)
> +{
> +	if (action == HDA_FIXUP_ACT_PRE_PROBE)
> +		alc_setup_gpio(codec, mask);
> +}
> +EXPORT_SYMBOL_NS_GPL(alc_fixup_gpio, "SND_HDA_CODEC_REALTEK");
> +
> +void alc_fixup_gpio1(struct hda_codec *codec,
> +		     const struct hda_fixup *fix, int action)
> +{
> +	alc_fixup_gpio(codec, action, 0x01);
> +}
> +EXPORT_SYMBOL_NS_GPL(alc_fixup_gpio1, "SND_HDA_CODEC_REALTEK");
> +
> +void alc_fixup_gpio2(struct hda_codec *codec,
> +		     const struct hda_fixup *fix, int action)
> +{
> +	alc_fixup_gpio(codec, action, 0x02);
> +}
> +EXPORT_SYMBOL_NS_GPL(alc_fixup_gpio2, "SND_HDA_CODEC_REALTEK");
> +
> +void alc_fixup_gpio3(struct hda_codec *codec,
> +		     const struct hda_fixup *fix, int action)
> +{
> +	alc_fixup_gpio(codec, action, 0x03);
> +}
> +EXPORT_SYMBOL_NS_GPL(alc_fixup_gpio3, "SND_HDA_CODEC_REALTEK");
> +
> +void alc_fixup_gpio4(struct hda_codec *codec,
> +		     const struct hda_fixup *fix, int action)
> +{
> +	alc_fixup_gpio(codec, action, 0x04);
> +}
> +EXPORT_SYMBOL_NS_GPL(alc_fixup_gpio4, "SND_HDA_CODEC_REALTEK");
> +
> +void alc_fixup_micmute_led(struct hda_codec *codec,
> +			   const struct hda_fixup *fix, int action)
> +{
> +	if (action == HDA_FIXUP_ACT_PRE_PROBE)
> +		snd_hda_gen_add_micmute_led_cdev(codec, NULL);
> +}
> +EXPORT_SYMBOL_NS_GPL(alc_fixup_micmute_led, "SND_HDA_CODEC_REALTEK");
> +
> +/*
> + * Fix hardware PLL issue
> + * On some codecs, the analog PLL gating control must be off while
> + * the default value is 1.
> + */
> +void alc_fix_pll(struct hda_codec *codec)
> +{
> +	struct alc_spec *spec = codec->spec;
> +
> +	if (spec->pll_nid)
> +		alc_update_coefex_idx(codec, spec->pll_nid, spec->pll_coef_idx,
> +				      1 << spec->pll_coef_bit, 0);
> +}
> +EXPORT_SYMBOL_NS_GPL(alc_fix_pll, "SND_HDA_CODEC_REALTEK");
> +
> +void alc_fix_pll_init(struct hda_codec *codec, hda_nid_t nid,
> +		      unsigned int coef_idx, unsigned int coef_bit)
> +{
> +	struct alc_spec *spec = codec->spec;
> +	spec->pll_nid = nid;
> +	spec->pll_coef_idx = coef_idx;
> +	spec->pll_coef_bit = coef_bit;
> +	alc_fix_pll(codec);
> +}
> +EXPORT_SYMBOL_NS_GPL(alc_fix_pll_init, "SND_HDA_CODEC_REALTEK");
> +
> +/* update the master volume per volume-knob's unsol event */
> +void alc_update_knob_master(struct hda_codec *codec,
> +			    struct hda_jack_callback *jack)
> +{
> +	unsigned int val;
> +	struct snd_kcontrol *kctl;
> +	struct snd_ctl_elem_value *uctl;
> +
> +	kctl = snd_hda_find_mixer_ctl(codec, "Master Playback Volume");
> +	if (!kctl)
> +		return;
> +	uctl = kzalloc(sizeof(*uctl), GFP_KERNEL);
> +	if (!uctl)
> +		return;
> +	val = snd_hda_codec_read(codec, jack->nid, 0,
> +				 AC_VERB_GET_VOLUME_KNOB_CONTROL, 0);
> +	val &= HDA_AMP_VOLMASK;
> +	uctl->value.integer.value[0] = val;
> +	uctl->value.integer.value[1] = val;
> +	kctl->put(kctl, uctl);
> +	kfree(uctl);
> +}
> +EXPORT_SYMBOL_NS_GPL(alc_update_knob_master, "SND_HDA_CODEC_REALTEK");
> +
> +/* Change EAPD to verb control */
> +void alc_fill_eapd_coef(struct hda_codec *codec)
> +{
> +	int coef;
> +
> +	coef = alc_get_coef0(codec);
> +
> +	switch (codec->core.vendor_id) {
> +	case 0x10ec0262:
> +		alc_update_coef_idx(codec, 0x7, 0, 1<<5);
> +		break;
> +	case 0x10ec0267:
> +	case 0x10ec0268:
> +		alc_update_coef_idx(codec, 0x7, 0, 1<<13);
> +		break;
> +	case 0x10ec0269:
> +		if ((coef & 0x00f0) == 0x0010)
> +			alc_update_coef_idx(codec, 0xd, 0, 1<<14);
> +		if ((coef & 0x00f0) == 0x0020)
> +			alc_update_coef_idx(codec, 0x4, 1<<15, 0);
> +		if ((coef & 0x00f0) == 0x0030)
> +			alc_update_coef_idx(codec, 0x10, 1<<9, 0);
> +		break;
> +	case 0x10ec0280:
> +	case 0x10ec0284:
> +	case 0x10ec0290:
> +	case 0x10ec0292:
> +		alc_update_coef_idx(codec, 0x4, 1<<15, 0);
> +		break;
> +	case 0x10ec0225:
> +	case 0x10ec0295:
> +	case 0x10ec0299:
> +		alc_update_coef_idx(codec, 0x67, 0xf000, 0x3000);
> +		fallthrough;
> +	case 0x10ec0215:
> +	case 0x10ec0236:
> +	case 0x10ec0245:
> +	case 0x10ec0256:
> +	case 0x10ec0257:
> +	case 0x10ec0285:
> +	case 0x10ec0289:
> +		alc_update_coef_idx(codec, 0x36, 1<<13, 0);
> +		fallthrough;
> +	case 0x10ec0230:
> +	case 0x10ec0233:
> +	case 0x10ec0235:
> +	case 0x10ec0255:
> +	case 0x19e58326:
> +	case 0x10ec0282:
> +	case 0x10ec0283:
> +	case 0x10ec0286:
> +	case 0x10ec0288:
> +	case 0x10ec0298:
> +	case 0x10ec0300:
> +		alc_update_coef_idx(codec, 0x10, 1<<9, 0);
> +		break;
> +	case 0x10ec0275:
> +		alc_update_coef_idx(codec, 0xe, 0, 1<<0);
> +		break;
> +	case 0x10ec0287:
> +		alc_update_coef_idx(codec, 0x10, 1<<9, 0);
> +		alc_write_coef_idx(codec, 0x8, 0x4ab7);
> +		break;
> +	case 0x10ec0293:
> +		alc_update_coef_idx(codec, 0xa, 1<<13, 0);
> +		break;
> +	case 0x10ec0234:
> +	case 0x10ec0274:
> +		alc_write_coef_idx(codec, 0x6e, 0x0c25);
> +		fallthrough;
> +	case 0x10ec0294:
> +	case 0x10ec0700:
> +	case 0x10ec0701:
> +	case 0x10ec0703:
> +	case 0x10ec0711:
> +		alc_update_coef_idx(codec, 0x10, 1<<15, 0);
> +		break;
> +	case 0x10ec0662:
> +		if ((coef & 0x00f0) == 0x0030)
> +			alc_update_coef_idx(codec, 0x4, 1<<10, 0); /* EAPD Ctrl */
> +		break;
> +	case 0x10ec0272:
> +	case 0x10ec0273:
> +	case 0x10ec0663:
> +	case 0x10ec0665:
> +	case 0x10ec0670:
> +	case 0x10ec0671:
> +	case 0x10ec0672:
> +		alc_update_coef_idx(codec, 0xd, 0, 1<<14); /* EAPD Ctrl */
> +		break;
> +	case 0x10ec0222:
> +	case 0x10ec0623:
> +		alc_update_coef_idx(codec, 0x19, 1<<13, 0);
> +		break;
> +	case 0x10ec0668:
> +		alc_update_coef_idx(codec, 0x7, 3<<13, 0);
> +		break;
> +	case 0x10ec0867:
> +		alc_update_coef_idx(codec, 0x4, 1<<10, 0);
> +		break;
> +	case 0x10ec0888:
> +		if ((coef & 0x00f0) == 0x0020 || (coef & 0x00f0) == 0x0030)
> +			alc_update_coef_idx(codec, 0x7, 1<<5, 0);
> +		break;
> +	case 0x10ec0892:
> +	case 0x10ec0897:
> +		alc_update_coef_idx(codec, 0x7, 1<<5, 0);
> +		break;
> +	case 0x10ec0899:
> +	case 0x10ec0900:
> +	case 0x10ec0b00:
> +	case 0x10ec1168:
> +	case 0x10ec1220:
> +		alc_update_coef_idx(codec, 0x7, 1<<1, 0);
> +		break;
> +	}
> +}
> +EXPORT_SYMBOL_NS_GPL(alc_fill_eapd_coef, "SND_HDA_CODEC_REALTEK");
> +
> +/* turn on/off EAPD control (only if available) */
> +static void set_eapd(struct hda_codec *codec, hda_nid_t nid, int on)
> +{
> +	if (get_wcaps_type(get_wcaps(codec, nid)) != AC_WID_PIN)
> +		return;
> +	if (snd_hda_query_pin_caps(codec, nid) & AC_PINCAP_EAPD)
> +		snd_hda_codec_write(codec, nid, 0, AC_VERB_SET_EAPD_BTLENABLE,
> +				    on ? 2 : 0);
> +}
> +
> +/* turn on/off EAPD controls of the codec */
> +void alc_auto_setup_eapd(struct hda_codec *codec, bool on)
> +{
> +	/* We currently only handle front, HP */
> +	static const hda_nid_t pins[] = {
> +		0x0f, 0x10, 0x14, 0x15, 0x17, 0
> +	};
> +	const hda_nid_t *p;
> +	for (p = pins; *p; p++)
> +		set_eapd(codec, *p, on);
> +}
> +EXPORT_SYMBOL_NS_GPL(alc_auto_setup_eapd, "SND_HDA_CODEC_REALTEK");
> +
> +/* Returns the nid of the external mic input pin, or 0 if it cannot be found. */
> +int alc_find_ext_mic_pin(struct hda_codec *codec)
> +{
> +	struct alc_spec *spec = codec->spec;
> +	struct auto_pin_cfg *cfg = &spec->gen.autocfg;
> +	hda_nid_t nid;
> +	unsigned int defcfg;
> +	int i;
> +
> +	for (i = 0; i < cfg->num_inputs; i++) {
> +		if (cfg->inputs[i].type != AUTO_PIN_MIC)
> +			continue;
> +		nid = cfg->inputs[i].pin;
> +		defcfg = snd_hda_codec_get_pincfg(codec, nid);
> +		if (snd_hda_get_input_pin_attr(defcfg) == INPUT_PIN_ATTR_INT)
> +			continue;
> +		return nid;
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_NS_GPL(alc_find_ext_mic_pin, "SND_HDA_CODEC_REALTEK");
> +
> +void alc_headset_mic_no_shutup(struct hda_codec *codec)
> +{
> +	const struct hda_pincfg *pin;
> +	int mic_pin = alc_find_ext_mic_pin(codec);
> +	int i;
> +
> +	/* don't shut up pins when unloading the driver; otherwise it breaks
> +	 * the default pin setup at the next load of the driver
> +	 */
> +	if (codec->bus->shutdown)
> +		return;
> +
> +	snd_array_for_each(&codec->init_pins, i, pin) {
> +		/* use read here for syncing after issuing each verb */
> +		if (pin->nid != mic_pin)
> +			snd_hda_codec_read(codec, pin->nid, 0,
> +					AC_VERB_SET_PIN_WIDGET_CONTROL, 0);
> +	}
> +
> +	codec->pins_shutup = 1;
> +}
> +EXPORT_SYMBOL_NS_GPL(alc_headset_mic_no_shutup, "SND_HDA_CODEC_REALTEK");
> +
> +void alc_shutup_pins(struct hda_codec *codec)
> +{
> +	struct alc_spec *spec = codec->spec;
> +
> +	if (spec->no_shutup_pins)
> +		return;
> +
> +	switch (codec->core.vendor_id) {
> +	case 0x10ec0236:
> +	case 0x10ec0256:
> +	case 0x10ec0257:
> +	case 0x19e58326:
> +	case 0x10ec0283:
> +	case 0x10ec0285:
> +	case 0x10ec0286:
> +	case 0x10ec0287:
> +	case 0x10ec0288:
> +	case 0x10ec0295:
> +	case 0x10ec0298:
> +		alc_headset_mic_no_shutup(codec);
> +		break;
> +	default:
> +		snd_hda_shutup_pins(codec);
> +		break;
> +	}
> +}
> +EXPORT_SYMBOL_NS_GPL(alc_shutup_pins, "SND_HDA_CODEC_REALTEK");
> +
> +/* generic shutup callback;
> + * just turning off EAPD and a little pause for avoiding pop-noise
> + */
> +void alc_eapd_shutup(struct hda_codec *codec)
> +{
> +	struct alc_spec *spec = codec->spec;
> +
> +	alc_auto_setup_eapd(codec, false);
> +	if (!spec->no_depop_delay)
> +		msleep(200);
> +	alc_shutup_pins(codec);
> +}
> +EXPORT_SYMBOL_NS_GPL(alc_eapd_shutup, "SND_HDA_CODEC_REALTEK");
> +
> +/* additional initialization for ALC888 variants */
> +static void alc888_coef_init(struct hda_codec *codec)
> +{
> +	switch (alc_get_coef0(codec) & 0x00f0) {
> +	/* alc888-VA */
> +	case 0x00:
> +	/* alc888-VB */
> +	case 0x10:
> +		alc_update_coef_idx(codec, 7, 0, 0x2030); /* Turn EAPD to High */
> +		break;
> +	}
> +}
> +
> +/* generic EAPD initialization */
> +void alc_auto_init_amp(struct hda_codec *codec, int type)
> +{
> +	alc_auto_setup_eapd(codec, true);
> +	alc_write_gpio(codec);
> +	switch (type) {
> +	case ALC_INIT_DEFAULT:
> +		switch (codec->core.vendor_id) {
> +		case 0x10ec0260:
> +			alc_update_coefex_idx(codec, 0x1a, 7, 0, 0x2010);
> +			break;
> +		case 0x10ec0880:
> +		case 0x10ec0882:
> +		case 0x10ec0883:
> +		case 0x10ec0885:
> +			alc_update_coef_idx(codec, 7, 0, 0x2030);
> +			break;
> +		case 0x10ec0888:
> +			alc888_coef_init(codec);
> +			break;
> +		}
> +		break;
> +	}
> +}
> +EXPORT_SYMBOL_NS_GPL(alc_auto_init_amp, "SND_HDA_CODEC_REALTEK");
> +
> +/* get a primary headphone pin if available */
> +hda_nid_t alc_get_hp_pin(struct alc_spec *spec)
> +{
> +	if (spec->gen.autocfg.hp_pins[0])
> +		return spec->gen.autocfg.hp_pins[0];
> +	if (spec->gen.autocfg.line_out_type == AC_JACK_HP_OUT)
> +		return spec->gen.autocfg.line_out_pins[0];
> +	return 0;
> +}
> +EXPORT_SYMBOL_NS_GPL(alc_get_hp_pin, "SND_HDA_CODEC_REALTEK");
> +
> +/*
> + * Realtek SSID verification
> + */
> +
> +/* Could be any non-zero and even value. When used as fixup, tells
> + * the driver to ignore any present sku defines.
> + */
> +#define ALC_FIXUP_SKU_IGNORE (2)
> +
> +void alc_fixup_sku_ignore(struct hda_codec *codec,
> +			  const struct hda_fixup *fix, int action)
> +{
> +	struct alc_spec *spec = codec->spec;
> +	if (action == HDA_FIXUP_ACT_PRE_PROBE) {
> +		spec->cdefine.fixup = 1;
> +		spec->cdefine.sku_cfg = ALC_FIXUP_SKU_IGNORE;
> +	}
> +}
> +EXPORT_SYMBOL_NS_GPL(alc_fixup_sku_ignore, "SND_HDA_CODEC_REALTEK");
> +
> +void alc_fixup_no_depop_delay(struct hda_codec *codec,
> +			      const struct hda_fixup *fix, int action)
> +{
> +	struct alc_spec *spec = codec->spec;
> +
> +	if (action == HDA_FIXUP_ACT_PROBE) {
> +		spec->no_depop_delay = 1;
> +		codec->depop_delay = 0;
> +	}
> +}
> +EXPORT_SYMBOL_NS_GPL(alc_fixup_no_depop_delay, "SND_HDA_CODEC_REALTEK");
> +
> +int alc_auto_parse_customize_define(struct hda_codec *codec)
> +{
> +	unsigned int ass, tmp, i;
> +	unsigned nid = 0;
> +	struct alc_spec *spec = codec->spec;
> +
> +	spec->cdefine.enable_pcbeep = 1; /* assume always enabled */
> +
> +	if (spec->cdefine.fixup) {
> +		ass = spec->cdefine.sku_cfg;
> +		if (ass == ALC_FIXUP_SKU_IGNORE)
> +			return -1;
> +		goto do_sku;
> +	}
> +
> +	if (!codec->bus->pci)
> +		return -1;
> +	ass = codec->core.subsystem_id & 0xffff;
> +	if (ass != codec->bus->pci->subsystem_device && (ass & 1))
> +		goto do_sku;
> +
> +	nid = 0x1d;
> +	if (codec->core.vendor_id == 0x10ec0260)
> +		nid = 0x17;
> +	ass = snd_hda_codec_get_pincfg(codec, nid);
> +
> +	if (!(ass & 1)) {
> +		codec_info(codec, "%s: SKU not ready 0x%08x\n",
> +			   codec->core.chip_name, ass);
> +		return -1;
> +	}
> +
> +	/* check sum */
> +	tmp = 0;
> +	for (i = 1; i < 16; i++) {
> +		if ((ass >> i) & 1)
> +			tmp++;
> +	}
> +	if (((ass >> 16) & 0xf) != tmp)
> +		return -1;
> +
> +	spec->cdefine.port_connectivity = ass >> 30;
> +	spec->cdefine.enable_pcbeep = (ass & 0x100000) >> 20;
> +	spec->cdefine.check_sum = (ass >> 16) & 0xf;
> +	spec->cdefine.customization = ass >> 8;
> +do_sku:
> +	spec->cdefine.sku_cfg = ass;
> +	spec->cdefine.external_amp = (ass & 0x38) >> 3;
> +	spec->cdefine.platform_type = (ass & 0x4) >> 2;
> +	spec->cdefine.swap = (ass & 0x2) >> 1;
> +	spec->cdefine.override = ass & 0x1;
> +
> +	codec_dbg(codec, "SKU: Nid=0x%x sku_cfg=0x%08x\n",
> +		   nid, spec->cdefine.sku_cfg);
> +	codec_dbg(codec, "SKU: port_connectivity=0x%x\n",
> +		   spec->cdefine.port_connectivity);
> +	codec_dbg(codec, "SKU: enable_pcbeep=0x%x\n", spec->cdefine.enable_pcbeep);
> +	codec_dbg(codec, "SKU: check_sum=0x%08x\n", spec->cdefine.check_sum);
> +	codec_dbg(codec, "SKU: customization=0x%08x\n", spec->cdefine.customization);
> +	codec_dbg(codec, "SKU: external_amp=0x%x\n", spec->cdefine.external_amp);
> +	codec_dbg(codec, "SKU: platform_type=0x%x\n", spec->cdefine.platform_type);
> +	codec_dbg(codec, "SKU: swap=0x%x\n", spec->cdefine.swap);
> +	codec_dbg(codec, "SKU: override=0x%x\n", spec->cdefine.override);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_NS_GPL(alc_auto_parse_customize_define, "SND_HDA_CODEC_REALTEK");
> +
> +/* return the position of NID in the list, or -1 if not found */
> +static int find_idx_in_nid_list(hda_nid_t nid, const hda_nid_t *list, int nums)
> +{
> +	int i;
> +	for (i = 0; i < nums; i++)
> +		if (list[i] == nid)
> +			return i;
> +	return -1;
> +}
> +/* return true if the given NID is found in the list */
> +static bool found_in_nid_list(hda_nid_t nid, const hda_nid_t *list, int nums)
> +{
> +	return find_idx_in_nid_list(nid, list, nums) >= 0;
> +}
> +
> +/* check subsystem ID and set up device-specific initialization;
> + * return 1 if initialized, 0 if invalid SSID
> + */
> +/* 32-bit subsystem ID for BIOS loading in HD Audio codec.
> + *	31 ~ 16 :	Manufacture ID
> + *	15 ~ 8	:	SKU ID
> + *	7  ~ 0	:	Assembly ID
> + *	port-A --> pin 39/41, port-E --> pin 14/15, port-D --> pin 35/36
> + */
> +int alc_subsystem_id(struct hda_codec *codec, const hda_nid_t *ports)
> +{
> +	unsigned int ass, tmp, i;
> +	unsigned nid;
> +	struct alc_spec *spec = codec->spec;
> +
> +	if (spec->cdefine.fixup) {
> +		ass = spec->cdefine.sku_cfg;
> +		if (ass == ALC_FIXUP_SKU_IGNORE)
> +			return 0;
> +		goto do_sku;
> +	}
> +
> +	ass = codec->core.subsystem_id & 0xffff;
> +	if (codec->bus->pci &&
> +	    ass != codec->bus->pci->subsystem_device && (ass & 1))
> +		goto do_sku;
> +
> +	/* invalid SSID, check the special NID pin defcfg instead */
> +	/*
> +	 * 31~30	: port connectivity
> +	 * 29~21	: reserve
> +	 * 20		: PCBEEP input
> +	 * 19~16	: Check sum (15:1)
> +	 * 15~1		: Custom
> +	 * 0		: override
> +	*/
> +	nid = 0x1d;
> +	if (codec->core.vendor_id == 0x10ec0260)
> +		nid = 0x17;
> +	ass = snd_hda_codec_get_pincfg(codec, nid);
> +	codec_dbg(codec,
> +		  "realtek: No valid SSID, checking pincfg 0x%08x for NID 0x%x\n",
> +		   ass, nid);
> +	if (!(ass & 1))
> +		return 0;
> +	if ((ass >> 30) != 1)	/* no physical connection */
> +		return 0;
> +
> +	/* check sum */
> +	tmp = 0;
> +	for (i = 1; i < 16; i++) {
> +		if ((ass >> i) & 1)
> +			tmp++;
> +	}
> +	if (((ass >> 16) & 0xf) != tmp)
> +		return 0;
> +do_sku:
> +	codec_dbg(codec, "realtek: Enabling init ASM_ID=0x%04x CODEC_ID=%08x\n",
> +		   ass & 0xffff, codec->core.vendor_id);
> +	/*
> +	 * 0 : override
> +	 * 1 :	Swap Jack
> +	 * 2 : 0 --> Desktop, 1 --> Laptop
> +	 * 3~5 : External Amplifier control
> +	 * 7~6 : Reserved
> +	*/
> +	tmp = (ass & 0x38) >> 3;	/* external Amp control */
> +	if (spec->init_amp == ALC_INIT_UNDEFINED) {
> +		switch (tmp) {
> +		case 1:
> +			alc_setup_gpio(codec, 0x01);
> +			break;
> +		case 3:
> +			alc_setup_gpio(codec, 0x02);
> +			break;
> +		case 7:
> +			alc_setup_gpio(codec, 0x04);
> +			break;
> +		case 5:
> +		default:
> +			spec->init_amp = ALC_INIT_DEFAULT;
> +			break;
> +		}
> +	}
> +
> +	/* is laptop or Desktop and enable the function "Mute internal speaker
> +	 * when the external headphone out jack is plugged"
> +	 */
> +	if (!(ass & 0x8000))
> +		return 1;
> +	/*
> +	 * 10~8 : Jack location
> +	 * 12~11: Headphone out -> 00: PortA, 01: PortE, 02: PortD, 03: Resvered
> +	 * 14~13: Resvered
> +	 * 15   : 1 --> enable the function "Mute internal speaker
> +	 *	        when the external headphone out jack is plugged"
> +	 */
> +	if (!alc_get_hp_pin(spec)) {
> +		hda_nid_t nid;
> +		tmp = (ass >> 11) & 0x3;	/* HP to chassis */
> +		nid = ports[tmp];
> +		if (found_in_nid_list(nid, spec->gen.autocfg.line_out_pins,
> +				      spec->gen.autocfg.line_outs))
> +			return 1;
> +		spec->gen.autocfg.hp_pins[0] = nid;
> +	}
> +	return 1;
> +}
> +EXPORT_SYMBOL_NS_GPL(alc_subsystem_id, "SND_HDA_CODEC_REALTEK");
> +
> +/* Check the validity of ALC subsystem-id
> + * ports contains an array of 4 pin NIDs for port-A, E, D and I */
> +void alc_ssid_check(struct hda_codec *codec, const hda_nid_t *ports)
> +{
> +	if (!alc_subsystem_id(codec, ports)) {
> +		struct alc_spec *spec = codec->spec;
> +		if (spec->init_amp == ALC_INIT_UNDEFINED) {
> +			codec_dbg(codec,
> +				  "realtek: Enable default setup for auto mode as fallback\n");
> +			spec->init_amp = ALC_INIT_DEFAULT;
> +		}
> +	}
> +}
> +EXPORT_SYMBOL_NS_GPL(alc_ssid_check, "SND_HDA_CODEC_REALTEK");
> +
> +/* inverted digital-mic */
> +void alc_fixup_inv_dmic(struct hda_codec *codec,
> +			const struct hda_fixup *fix, int action)
> +{
> +	struct alc_spec *spec = codec->spec;
> +
> +	spec->gen.inv_dmic_split = 1;
> +}
> +EXPORT_SYMBOL_NS_GPL(alc_fixup_inv_dmic, "SND_HDA_CODEC_REALTEK");
> +
> +int alc_build_controls(struct hda_codec *codec)
> +{
> +	int err;
> +
> +	err = snd_hda_gen_build_controls(codec);
> +	if (err < 0)
> +		return err;
> +
> +	snd_hda_apply_fixup(codec, HDA_FIXUP_ACT_BUILD);
> +	return 0;
> +}
> +EXPORT_SYMBOL_NS_GPL(alc_build_controls, "SND_HDA_CODEC_REALTEK");
> +
> +int alc_init(struct hda_codec *codec)
> +{
> +	struct alc_spec *spec = codec->spec;
> +
> +	/* hibernation resume needs the full chip initialization */
> +	if (is_s4_resume(codec))
> +		alc_pre_init(codec);
> +
> +	if (spec->init_hook)
> +		spec->init_hook(codec);
> +
> +	spec->gen.skip_verbs = 1; /* applied in below */
> +	snd_hda_gen_init(codec);
> +	alc_fix_pll(codec);
> +	alc_auto_init_amp(codec, spec->init_amp);
> +	snd_hda_apply_verbs(codec); /* apply verbs here after own init */
> +
> +	snd_hda_apply_fixup(codec, HDA_FIXUP_ACT_INIT);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_NS_GPL(alc_init, "SND_HDA_CODEC_REALTEK");
> +
> +void alc_shutup(struct hda_codec *codec)
> +{
> +	struct alc_spec *spec = codec->spec;
> +
> +	if (!snd_hda_get_bool_hint(codec, "shutup"))
> +		return; /* disabled explicitly by hints */
> +
> +	if (spec && spec->shutup)
> +		spec->shutup(codec);
> +	else
> +		alc_shutup_pins(codec);
> +}
> +EXPORT_SYMBOL_NS_GPL(alc_shutup, "SND_HDA_CODEC_REALTEK");
> +
> +void alc_power_eapd(struct hda_codec *codec)
> +{
> +	alc_auto_setup_eapd(codec, false);
> +}
> +EXPORT_SYMBOL_NS_GPL(alc_power_eapd, "SND_HDA_CODEC_REALTEK");
> +
> +int alc_suspend(struct hda_codec *codec)
> +{
> +	struct alc_spec *spec = codec->spec;
> +	alc_shutup(codec);
> +	if (spec && spec->power_hook)
> +		spec->power_hook(codec);
> +	return 0;
> +}
> +EXPORT_SYMBOL_NS_GPL(alc_suspend, "SND_HDA_CODEC_REALTEK");
> +
> +int alc_resume(struct hda_codec *codec)
> +{
> +	struct alc_spec *spec = codec->spec;
> +
> +	if (!spec->no_depop_delay)
> +		msleep(150); /* to avoid pop noise */
> +	codec->patch_ops.init(codec);
> +	snd_hda_regmap_sync(codec);
> +	hda_call_check_power_status(codec, 0x01);
> +	return 0;
> +}
> +EXPORT_SYMBOL_NS_GPL(alc_resume, "SND_HDA_CODEC_REALTEK");
> +
> +/*
> + */
> +const struct hda_codec_ops alc_patch_ops = {
> +	.build_controls = alc_build_controls,
> +	.build_pcms = snd_hda_gen_build_pcms,
> +	.init = alc_init,
> +	.free = alc_free,
> +	.unsol_event = snd_hda_jack_unsol_event,
> +	.resume = alc_resume,
> +	.suspend = alc_suspend,
> +	.check_power_status = snd_hda_gen_check_power_status,
> +};
> +EXPORT_SYMBOL_NS_GPL(alc_patch_ops, "SND_HDA_CODEC_REALTEK");
> +
> +/*
> + * Rename codecs appropriately from COEF value or subvendor id
> + */
> +struct alc_codec_rename_table {
> +	unsigned int vendor_id;
> +	unsigned short coef_mask;
> +	unsigned short coef_bits;
> +	const char *name;
> +};
> +
> +struct alc_codec_rename_pci_table {
> +	unsigned int codec_vendor_id;
> +	unsigned short pci_subvendor;
> +	unsigned short pci_subdevice;
> +	const char *name;
> +};
> +
> +static const struct alc_codec_rename_table rename_tbl[] = {
> +	{ 0x10ec0221, 0xf00f, 0x1003, "ALC231" },
> +	{ 0x10ec0269, 0xfff0, 0x3010, "ALC277" },
> +	{ 0x10ec0269, 0xf0f0, 0x2010, "ALC259" },
> +	{ 0x10ec0269, 0xf0f0, 0x3010, "ALC258" },
> +	{ 0x10ec0269, 0x00f0, 0x0010, "ALC269VB" },
> +	{ 0x10ec0269, 0xffff, 0xa023, "ALC259" },
> +	{ 0x10ec0269, 0xffff, 0x6023, "ALC281X" },
> +	{ 0x10ec0269, 0x00f0, 0x0020, "ALC269VC" },
> +	{ 0x10ec0269, 0x00f0, 0x0030, "ALC269VD" },
> +	{ 0x10ec0662, 0xffff, 0x4020, "ALC656" },
> +	{ 0x10ec0887, 0x00f0, 0x0030, "ALC887-VD" },
> +	{ 0x10ec0888, 0x00f0, 0x0030, "ALC888-VD" },
> +	{ 0x10ec0888, 0xf0f0, 0x3020, "ALC886" },
> +	{ 0x10ec0899, 0x2000, 0x2000, "ALC899" },
> +	{ 0x10ec0892, 0xffff, 0x8020, "ALC661" },
> +	{ 0x10ec0892, 0xffff, 0x8011, "ALC661" },
> +	{ 0x10ec0892, 0xffff, 0x4011, "ALC656" },
> +	{ } /* terminator */
> +};
> +
> +static const struct alc_codec_rename_pci_table rename_pci_tbl[] = {
> +	{ 0x10ec0280, 0x1028, 0, "ALC3220" },
> +	{ 0x10ec0282, 0x1028, 0, "ALC3221" },
> +	{ 0x10ec0283, 0x1028, 0, "ALC3223" },
> +	{ 0x10ec0288, 0x1028, 0, "ALC3263" },
> +	{ 0x10ec0292, 0x1028, 0, "ALC3226" },
> +	{ 0x10ec0293, 0x1028, 0, "ALC3235" },
> +	{ 0x10ec0255, 0x1028, 0, "ALC3234" },
> +	{ 0x10ec0668, 0x1028, 0, "ALC3661" },
> +	{ 0x10ec0275, 0x1028, 0, "ALC3260" },
> +	{ 0x10ec0899, 0x1028, 0, "ALC3861" },
> +	{ 0x10ec0298, 0x1028, 0, "ALC3266" },
> +	{ 0x10ec0236, 0x1028, 0, "ALC3204" },
> +	{ 0x10ec0256, 0x1028, 0, "ALC3246" },
> +	{ 0x10ec0225, 0x1028, 0, "ALC3253" },
> +	{ 0x10ec0295, 0x1028, 0, "ALC3254" },
> +	{ 0x10ec0299, 0x1028, 0, "ALC3271" },
> +	{ 0x10ec0670, 0x1025, 0, "ALC669X" },
> +	{ 0x10ec0676, 0x1025, 0, "ALC679X" },
> +	{ 0x10ec0282, 0x1043, 0, "ALC3229" },
> +	{ 0x10ec0233, 0x1043, 0, "ALC3236" },
> +	{ 0x10ec0280, 0x103c, 0, "ALC3228" },
> +	{ 0x10ec0282, 0x103c, 0, "ALC3227" },
> +	{ 0x10ec0286, 0x103c, 0, "ALC3242" },
> +	{ 0x10ec0290, 0x103c, 0, "ALC3241" },
> +	{ 0x10ec0668, 0x103c, 0, "ALC3662" },
> +	{ 0x10ec0283, 0x17aa, 0, "ALC3239" },
> +	{ 0x10ec0292, 0x17aa, 0, "ALC3232" },
> +	{ 0x10ec0257, 0x12f0, 0, "ALC3328" },
> +	{ } /* terminator */
> +};
> +
> +static int alc_codec_rename_from_preset(struct hda_codec *codec)
> +{
> +	const struct alc_codec_rename_table *p;
> +	const struct alc_codec_rename_pci_table *q;
> +
> +	for (p = rename_tbl; p->vendor_id; p++) {
> +		if (p->vendor_id != codec->core.vendor_id)
> +			continue;
> +		if ((alc_get_coef0(codec) & p->coef_mask) == p->coef_bits)
> +			return alc_codec_rename(codec, p->name);
> +	}
> +
> +	if (!codec->bus->pci)
> +		return 0;
> +	for (q = rename_pci_tbl; q->codec_vendor_id; q++) {
> +		if (q->codec_vendor_id != codec->core.vendor_id)
> +			continue;
> +		if (q->pci_subvendor != codec->bus->pci->subsystem_vendor)
> +			continue;
> +		if (!q->pci_subdevice ||
> +		    q->pci_subdevice == codec->bus->pci->subsystem_device)
> +			return alc_codec_rename(codec, q->name);
> +	}
> +
> +	return 0;
> +}
> +
> +/*
> + * Digital-beep handlers
> + */
> +#ifdef CONFIG_SND_HDA_INPUT_BEEP
> +
> +/* additional beep mixers; private_value will be overwritten */
> +static const struct snd_kcontrol_new alc_beep_mixer[] = {
> +	HDA_CODEC_VOLUME("Beep Playback Volume", 0, 0, HDA_INPUT),
> +	HDA_CODEC_MUTE_BEEP("Beep Playback Switch", 0, 0, HDA_INPUT),
> +};
> +
> +/* set up and create beep controls */
> +int alc_set_beep_amp(struct alc_spec *spec, hda_nid_t nid, int idx, int dir)
> +{
> +	struct snd_kcontrol_new *knew;
> +	unsigned int beep_amp = HDA_COMPOSE_AMP_VAL(nid, 3, idx, dir);
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(alc_beep_mixer); i++) {
> +		knew = snd_hda_gen_add_kctl(&spec->gen, NULL,
> +					    &alc_beep_mixer[i]);
> +		if (!knew)
> +			return -ENOMEM;
> +		knew->private_value = beep_amp;
> +	}
> +	return 0;
> +}
> +EXPORT_SYMBOL_NS_GPL(alc_set_beep_amp, "SND_HDA_CODEC_REALTEK");
> +
> +static const struct snd_pci_quirk beep_allow_list[] = {
> +	SND_PCI_QUIRK(0x1043, 0x103c, "ASUS", 1),
> +	SND_PCI_QUIRK(0x1043, 0x115d, "ASUS", 1),
> +	SND_PCI_QUIRK(0x1043, 0x829f, "ASUS", 1),
> +	SND_PCI_QUIRK(0x1043, 0x8376, "EeePC", 1),
> +	SND_PCI_QUIRK(0x1043, 0x83ce, "EeePC", 1),
> +	SND_PCI_QUIRK(0x1043, 0x831a, "EeePC", 1),
> +	SND_PCI_QUIRK(0x1043, 0x834a, "EeePC", 1),
> +	SND_PCI_QUIRK(0x1458, 0xa002, "GA-MA790X", 1),
> +	SND_PCI_QUIRK(0x8086, 0xd613, "Intel", 1),
> +	/* denylist -- no beep available */
> +	SND_PCI_QUIRK(0x17aa, 0x309e, "Lenovo ThinkCentre M73", 0),
> +	SND_PCI_QUIRK(0x17aa, 0x30a3, "Lenovo ThinkCentre M93", 0),
> +	{}
> +};
> +
> +int alc_has_cdefine_beep(struct hda_codec *codec)
> +{
> +	struct alc_spec *spec = codec->spec;
> +	const struct snd_pci_quirk *q;
> +	q = snd_pci_quirk_lookup(codec->bus->pci, beep_allow_list);
> +	if (q)
> +		return q->value;
> +	return spec->cdefine.enable_pcbeep;
> +}
> +EXPORT_SYMBOL_NS_GPL(alc_has_cdefine_beep, "SND_HDA_CODEC_REALTEK");
> +
> +#endif /* CONFIG_SND_HDA_INPUT_BEEP */
> +
> +/* parse the BIOS configuration and set up the alc_spec */
> +/* return 1 if successful, 0 if the proper config is not found,
> + * or a negative error code
> + */
> +int alc_parse_auto_config(struct hda_codec *codec,
> +			  const hda_nid_t *ignore_nids,
> +			  const hda_nid_t *ssid_nids)
> +{
> +	struct alc_spec *spec = codec->spec;
> +	struct auto_pin_cfg *cfg = &spec->gen.autocfg;
> +	int err;
> +
> +	err = snd_hda_parse_pin_defcfg(codec, cfg, ignore_nids,
> +				       spec->parse_flags);
> +	if (err < 0)
> +		return err;
> +
> +	if (ssid_nids)
> +		alc_ssid_check(codec, ssid_nids);
> +
> +	err = snd_hda_gen_parse_auto_config(codec, cfg);
> +	if (err < 0)
> +		return err;
> +
> +	return 1;
> +}
> +EXPORT_SYMBOL_NS_GPL(alc_parse_auto_config, "SND_HDA_CODEC_REALTEK");
> +
> +/* common preparation job for alc_spec */
> +int alc_alloc_spec(struct hda_codec *codec, hda_nid_t mixer_nid)
> +{
> +	struct alc_spec *spec = kzalloc(sizeof(*spec), GFP_KERNEL);
> +	int err;
> +
> +	if (!spec)
> +		return -ENOMEM;
> +	codec->spec = spec;
> +	snd_hda_gen_spec_init(&spec->gen);
> +	spec->gen.mixer_nid = mixer_nid;
> +	spec->gen.own_eapd_ctl = 1;
> +	codec->single_adc_amp = 1;
> +	/* FIXME: do we need this for all Realtek codec models? */
> +	codec->spdif_status_reset = 1;
> +	codec->forced_resume = 1;
> +	codec->patch_ops = alc_patch_ops;
> +	mutex_init(&spec->coef_mutex);
> +
> +	err = alc_codec_rename_from_preset(codec);
> +	if (err < 0) {
> +		kfree(spec);
> +		return err;
> +	}
> +	return 0;
> +}
> +EXPORT_SYMBOL_NS_GPL(alc_alloc_spec, "SND_HDA_CODEC_REALTEK");
> +
> +/* For dual-codec configuration, we need to disable some features to avoid
> + * conflicts of kctls and PCM streams
> + */
> +void alc_fixup_dual_codecs(struct hda_codec *codec,
> +			   const struct hda_fixup *fix, int action)
> +{
> +	struct alc_spec *spec = codec->spec;
> +
> +	if (action != HDA_FIXUP_ACT_PRE_PROBE)
> +		return;
> +	/* disable vmaster */
> +	spec->gen.suppress_vmaster = 1;
> +	/* auto-mute and auto-mic switch don't work with multiple codecs */
> +	spec->gen.suppress_auto_mute = 1;
> +	spec->gen.suppress_auto_mic = 1;
> +	/* disable aamix as well */
> +	spec->gen.mixer_nid = 0;
> +	/* add location prefix to avoid conflicts */
> +	codec->force_pin_prefix = 1;
> +}
> +EXPORT_SYMBOL_NS_GPL(alc_fixup_dual_codecs, "SND_HDA_CODEC_REALTEK");
> +
> +static const struct snd_pcm_chmap_elem asus_pcm_2_1_chmaps[] = {
> +	{ .channels = 2,
> +	  .map = { SNDRV_CHMAP_FL, SNDRV_CHMAP_FR } },
> +	{ .channels = 4,
> +	  .map = { SNDRV_CHMAP_FL, SNDRV_CHMAP_FR,
> +		   SNDRV_CHMAP_NA, SNDRV_CHMAP_LFE } }, /* LFE only on right */
> +	{ }
> +};
> +
> +/* override the 2.1 chmap */
> +void alc_fixup_bass_chmap(struct hda_codec *codec,
> +			  const struct hda_fixup *fix, int action)
> +{
> +	if (action == HDA_FIXUP_ACT_BUILD) {
> +		struct alc_spec *spec = codec->spec;
> +		spec->gen.pcm_rec[0]->stream[0].chmap = asus_pcm_2_1_chmaps;
> +	}
> +}
> +EXPORT_SYMBOL_NS_GPL(alc_fixup_bass_chmap, "SND_HDA_CODEC_REALTEK");
> +
> +/* exported as it's used by multiple codecs */
> +void alc1220_fixup_gb_dual_codecs(struct hda_codec *codec,
> +				  const struct hda_fixup *fix,
> +				  int action)
> +{
> +	alc_fixup_dual_codecs(codec, fix, action);
> +	switch (action) {
> +	case HDA_FIXUP_ACT_PRE_PROBE:
> +		/* override card longname to provide a unique UCM profile */
> +		strcpy(codec->card->longname, "HDAudio-Gigabyte-ALC1220DualCodecs");
> +		break;
> +	case HDA_FIXUP_ACT_BUILD:
> +		/* rename Capture controls depending on the codec */
> +		rename_ctl(codec, "Capture Volume",
> +			   codec->addr == 0 ?
> +			   "Rear-Panel Capture Volume" :
> +			   "Front-Panel Capture Volume");
> +		rename_ctl(codec, "Capture Switch",
> +			   codec->addr == 0 ?
> +			   "Rear-Panel Capture Switch" :
> +			   "Front-Panel Capture Switch");
> +		break;
> +	}
> +}
> +EXPORT_SYMBOL_NS_GPL(alc1220_fixup_gb_dual_codecs, "SND_HDA_CODEC_REALTEK");
> +
> +void alc233_alc662_fixup_lenovo_dual_codecs(struct hda_codec *codec,
> +					    const struct hda_fixup *fix,
> +					    int action)
> +{
> +	alc_fixup_dual_codecs(codec, fix, action);
> +	switch (action) {
> +	case HDA_FIXUP_ACT_PRE_PROBE:
> +		/* override card longname to provide a unique UCM profile */
> +		strcpy(codec->card->longname, "HDAudio-Lenovo-DualCodecs");
> +		break;
> +	case HDA_FIXUP_ACT_BUILD:
> +		/* rename Capture controls depending on the codec */
> +		rename_ctl(codec, "Capture Volume",
> +			   codec->addr == 0 ?
> +			   "Rear-Panel Capture Volume" :
> +			   "Front-Panel Capture Volume");
> +		rename_ctl(codec, "Capture Switch",
> +			   codec->addr == 0 ?
> +			   "Rear-Panel Capture Switch" :
> +			   "Front-Panel Capture Switch");
> +		break;
> +	}
> +}
> +EXPORT_SYMBOL_NS_GPL(alc233_alc662_fixup_lenovo_dual_codecs, "SND_HDA_CODEC_REALTEK");
> +
> +static void alc_shutup_dell_xps13(struct hda_codec *codec)
> +{
> +	struct alc_spec *spec = codec->spec;
> +	int hp_pin = alc_get_hp_pin(spec);
> +
> +	/* Prevent pop noises when headphones are plugged in */
> +	snd_hda_codec_write(codec, hp_pin, 0,
> +			    AC_VERB_SET_AMP_GAIN_MUTE, AMP_OUT_MUTE);
> +	msleep(20);
> +}
> +
> +void alc_fixup_dell_xps13(struct hda_codec *codec,
> +			  const struct hda_fixup *fix, int action)
> +{
> +	struct alc_spec *spec = codec->spec;
> +	struct hda_input_mux *imux = &spec->gen.input_mux;
> +	int i;
> +
> +	switch (action) {
> +	case HDA_FIXUP_ACT_PRE_PROBE:
> +		/* mic pin 0x19 must be initialized with Vref Hi-Z, otherwise
> +		 * it causes a click noise at start up
> +		 */
> +		snd_hda_codec_set_pin_target(codec, 0x19, PIN_VREFHIZ);
> +		spec->shutup = alc_shutup_dell_xps13;
> +		break;
> +	case HDA_FIXUP_ACT_PROBE:
> +		/* Make the internal mic the default input source. */
> +		for (i = 0; i < imux->num_items; i++) {
> +			if (spec->gen.imux_pins[i] == 0x12) {
> +				spec->gen.cur_mux[0] = i;
> +				break;
> +			}
> +		}
> +		break;
> +	}
> +}
> +EXPORT_SYMBOL_NS_GPL(alc_fixup_dell_xps13, "SND_HDA_CODEC_REALTEK");
> +
> +/*
> + * headset handling
> + */
> +
> +static void alc_hp_mute_disable(struct hda_codec *codec, unsigned int delay)
> +{
> +	if (delay <= 0)
> +		delay = 75;
> +	snd_hda_codec_write(codec, 0x21, 0,
> +		    AC_VERB_SET_AMP_GAIN_MUTE, AMP_OUT_MUTE);
> +	msleep(delay);
> +	snd_hda_codec_write(codec, 0x21, 0,
> +		    AC_VERB_SET_PIN_WIDGET_CONTROL, 0x0);
> +	msleep(delay);
> +}
> +
> +static void alc_hp_enable_unmute(struct hda_codec *codec, unsigned int delay)
> +{
> +	if (delay <= 0)
> +		delay = 75;
> +	snd_hda_codec_write(codec, 0x21, 0,
> +		    AC_VERB_SET_PIN_WIDGET_CONTROL, PIN_OUT);
> +	msleep(delay);
> +	snd_hda_codec_write(codec, 0x21, 0,
> +		    AC_VERB_SET_AMP_GAIN_MUTE, AMP_OUT_UNMUTE);
> +	msleep(delay);
> +}
> +
> +static const struct coef_fw alc225_pre_hsmode[] = {
> +	UPDATE_COEF(0x4a, 1<<8, 0),
> +	UPDATE_COEFEX(0x57, 0x05, 1<<14, 0),
> +	UPDATE_COEF(0x63, 3<<14, 3<<14),
> +	UPDATE_COEF(0x4a, 3<<4, 2<<4),
> +	UPDATE_COEF(0x4a, 3<<10, 3<<10),
> +	UPDATE_COEF(0x45, 0x3f<<10, 0x34<<10),
> +	UPDATE_COEF(0x4a, 3<<10, 0),
> +	{}
> +};
> +
> +static void alc_headset_mode_unplugged(struct hda_codec *codec)
> +{
> +	struct alc_spec *spec = codec->spec;
> +	static const struct coef_fw coef0255[] = {
> +		WRITE_COEF(0x1b, 0x0c0b), /* LDO and MISC control */
> +		WRITE_COEF(0x45, 0xd089), /* UAJ function set to menual mode */
> +		UPDATE_COEFEX(0x57, 0x05, 1<<14, 0), /* Direct Drive HP Amp control(Set to verb control)*/
> +		WRITE_COEF(0x06, 0x6104), /* Set MIC2 Vref gate with HP */
> +		WRITE_COEFEX(0x57, 0x03, 0x8aa6), /* Direct Drive HP Amp control */
> +		{}
> +	};
> +	static const struct coef_fw coef0256[] = {
> +		WRITE_COEF(0x1b, 0x0c4b), /* LDO and MISC control */
> +		WRITE_COEF(0x45, 0xd089), /* UAJ function set to menual mode */
> +		WRITE_COEF(0x06, 0x6104), /* Set MIC2 Vref gate with HP */
> +		WRITE_COEFEX(0x57, 0x03, 0x09a3), /* Direct Drive HP Amp control */
> +		UPDATE_COEFEX(0x57, 0x05, 1<<14, 0), /* Direct Drive HP Amp control(Set to verb control)*/
> +		{}
> +	};
> +	static const struct coef_fw coef0233[] = {
> +		WRITE_COEF(0x1b, 0x0c0b),
> +		WRITE_COEF(0x45, 0xc429),
> +		UPDATE_COEF(0x35, 0x4000, 0),
> +		WRITE_COEF(0x06, 0x2104),
> +		WRITE_COEF(0x1a, 0x0001),
> +		WRITE_COEF(0x26, 0x0004),
> +		WRITE_COEF(0x32, 0x42a3),
> +		{}
> +	};
> +	static const struct coef_fw coef0288[] = {
> +		UPDATE_COEF(0x4f, 0xfcc0, 0xc400),
> +		UPDATE_COEF(0x50, 0x2000, 0x2000),
> +		UPDATE_COEF(0x56, 0x0006, 0x0006),
> +		UPDATE_COEF(0x66, 0x0008, 0),
> +		UPDATE_COEF(0x67, 0x2000, 0),
> +		{}
> +	};
> +	static const struct coef_fw coef0298[] = {
> +		UPDATE_COEF(0x19, 0x1300, 0x0300),
> +		{}
> +	};
> +	static const struct coef_fw coef0292[] = {
> +		WRITE_COEF(0x76, 0x000e),
> +		WRITE_COEF(0x6c, 0x2400),
> +		WRITE_COEF(0x18, 0x7308),
> +		WRITE_COEF(0x6b, 0xc429),
> +		{}
> +	};
> +	static const struct coef_fw coef0293[] = {
> +		UPDATE_COEF(0x10, 7<<8, 6<<8), /* SET Line1 JD to 0 */
> +		UPDATE_COEFEX(0x57, 0x05, 1<<15|1<<13, 0x0), /* SET charge pump by verb */
> +		UPDATE_COEFEX(0x57, 0x03, 1<<10, 1<<10), /* SET EN_OSW to 1 */
> +		UPDATE_COEF(0x1a, 1<<3, 1<<3), /* Combo JD gating with LINE1-VREFO */
> +		WRITE_COEF(0x45, 0xc429), /* Set to TRS type */
> +		UPDATE_COEF(0x4a, 0x000f, 0x000e), /* Combo Jack auto detect */
> +		{}
> +	};
> +	static const struct coef_fw coef0668[] = {
> +		WRITE_COEF(0x15, 0x0d40),
> +		WRITE_COEF(0xb7, 0x802b),
> +		{}
> +	};
> +	static const struct coef_fw coef0225[] = {
> +		UPDATE_COEF(0x63, 3<<14, 0),
> +		{}
> +	};
> +	static const struct coef_fw coef0274[] = {
> +		UPDATE_COEF(0x4a, 0x0100, 0),
> +		UPDATE_COEFEX(0x57, 0x05, 0x4000, 0),
> +		UPDATE_COEF(0x6b, 0xf000, 0x5000),
> +		UPDATE_COEF(0x4a, 0x0010, 0),
> +		UPDATE_COEF(0x4a, 0x0c00, 0x0c00),
> +		WRITE_COEF(0x45, 0x5289),
> +		UPDATE_COEF(0x4a, 0x0c00, 0),
> +		{}
> +	};
> +
> +	if (spec->no_internal_mic_pin) {
> +		alc_update_coef_idx(codec, 0x45, 0xf<<12 | 1<<10, 5<<12);
> +		return;
> +	}
> +
> +	switch (codec->core.vendor_id) {
> +	case 0x10ec0255:
> +		alc_process_coef_fw(codec, coef0255);
> +		break;
> +	case 0x10ec0230:
> +	case 0x10ec0236:
> +	case 0x10ec0256:
> +	case 0x19e58326:
> +		alc_hp_mute_disable(codec, 75);
> +		alc_process_coef_fw(codec, coef0256);
> +		break;
> +	case 0x10ec0234:
> +	case 0x10ec0274:
> +	case 0x10ec0294:
> +		alc_process_coef_fw(codec, coef0274);
> +		break;
> +	case 0x10ec0233:
> +	case 0x10ec0283:
> +		alc_process_coef_fw(codec, coef0233);
> +		break;
> +	case 0x10ec0286:
> +	case 0x10ec0288:
> +		alc_process_coef_fw(codec, coef0288);
> +		break;
> +	case 0x10ec0298:
> +		alc_process_coef_fw(codec, coef0298);
> +		alc_process_coef_fw(codec, coef0288);
> +		break;
> +	case 0x10ec0292:
> +		alc_process_coef_fw(codec, coef0292);
> +		break;
> +	case 0x10ec0293:
> +		alc_process_coef_fw(codec, coef0293);
> +		break;
> +	case 0x10ec0668:
> +		alc_process_coef_fw(codec, coef0668);
> +		break;
> +	case 0x10ec0215:
> +	case 0x10ec0225:
> +	case 0x10ec0285:
> +	case 0x10ec0295:
> +	case 0x10ec0289:
> +	case 0x10ec0299:
> +		alc_hp_mute_disable(codec, 75);
> +		alc_process_coef_fw(codec, alc225_pre_hsmode);
> +		alc_process_coef_fw(codec, coef0225);
> +		break;
> +	case 0x10ec0867:
> +		alc_update_coefex_idx(codec, 0x57, 0x5, 1<<14, 0);
> +		break;
> +	}
> +	codec_dbg(codec, "Headset jack set to unplugged mode.\n");
> +}
> +
> +
> +static void alc_headset_mode_mic_in(struct hda_codec *codec, hda_nid_t hp_pin,
> +				    hda_nid_t mic_pin)
> +{
> +	static const struct coef_fw coef0255[] = {
> +		WRITE_COEFEX(0x57, 0x03, 0x8aa6),
> +		WRITE_COEF(0x06, 0x6100), /* Set MIC2 Vref gate to normal */
> +		{}
> +	};
> +	static const struct coef_fw coef0256[] = {
> +		UPDATE_COEFEX(0x57, 0x05, 1<<14, 1<<14), /* Direct Drive HP Amp control(Set to verb control)*/
> +		WRITE_COEFEX(0x57, 0x03, 0x09a3),
> +		WRITE_COEF(0x06, 0x6100), /* Set MIC2 Vref gate to normal */
> +		{}
> +	};
> +	static const struct coef_fw coef0233[] = {
> +		UPDATE_COEF(0x35, 0, 1<<14),
> +		WRITE_COEF(0x06, 0x2100),
> +		WRITE_COEF(0x1a, 0x0021),
> +		WRITE_COEF(0x26, 0x008c),
> +		{}
> +	};
> +	static const struct coef_fw coef0288[] = {
> +		UPDATE_COEF(0x4f, 0x00c0, 0),
> +		UPDATE_COEF(0x50, 0x2000, 0),
> +		UPDATE_COEF(0x56, 0x0006, 0),
> +		UPDATE_COEF(0x4f, 0xfcc0, 0xc400),
> +		UPDATE_COEF(0x66, 0x0008, 0x0008),
> +		UPDATE_COEF(0x67, 0x2000, 0x2000),
> +		{}
> +	};
> +	static const struct coef_fw coef0292[] = {
> +		WRITE_COEF(0x19, 0xa208),
> +		WRITE_COEF(0x2e, 0xacf0),
> +		{}
> +	};
> +	static const struct coef_fw coef0293[] = {
> +		UPDATE_COEFEX(0x57, 0x05, 0, 1<<15|1<<13), /* SET charge pump by verb */
> +		UPDATE_COEFEX(0x57, 0x03, 1<<10, 0), /* SET EN_OSW to 0 */
> +		UPDATE_COEF(0x1a, 1<<3, 0), /* Combo JD gating without LINE1-VREFO */
> +		{}
> +	};
> +	static const struct coef_fw coef0688[] = {
> +		WRITE_COEF(0xb7, 0x802b),
> +		WRITE_COEF(0xb5, 0x1040),
> +		UPDATE_COEF(0xc3, 0, 1<<12),
> +		{}
> +	};
> +	static const struct coef_fw coef0225[] = {
> +		UPDATE_COEFEX(0x57, 0x05, 1<<14, 1<<14),
> +		UPDATE_COEF(0x4a, 3<<4, 2<<4),
> +		UPDATE_COEF(0x63, 3<<14, 0),
> +		{}
> +	};
> +	static const struct coef_fw coef0274[] = {
> +		UPDATE_COEFEX(0x57, 0x05, 0x4000, 0x4000),
> +		UPDATE_COEF(0x4a, 0x0010, 0),
> +		UPDATE_COEF(0x6b, 0xf000, 0),
> +		{}
> +	};
> +
> +	switch (codec->core.vendor_id) {
> +	case 0x10ec0255:
> +		alc_write_coef_idx(codec, 0x45, 0xc489);
> +		snd_hda_set_pin_ctl_cache(codec, hp_pin, 0);
> +		alc_process_coef_fw(codec, coef0255);
> +		snd_hda_set_pin_ctl_cache(codec, mic_pin, PIN_VREF50);
> +		break;
> +	case 0x10ec0230:
> +	case 0x10ec0236:
> +	case 0x10ec0256:
> +	case 0x19e58326:
> +		alc_write_coef_idx(codec, 0x45, 0xc489);
> +		snd_hda_set_pin_ctl_cache(codec, hp_pin, 0);
> +		alc_process_coef_fw(codec, coef0256);
> +		snd_hda_set_pin_ctl_cache(codec, mic_pin, PIN_VREF50);
> +		break;
> +	case 0x10ec0234:
> +	case 0x10ec0274:
> +	case 0x10ec0294:
> +		alc_write_coef_idx(codec, 0x45, 0x4689);
> +		snd_hda_set_pin_ctl_cache(codec, hp_pin, 0);
> +		alc_process_coef_fw(codec, coef0274);
> +		snd_hda_set_pin_ctl_cache(codec, mic_pin, PIN_VREF50);
> +		break;
> +	case 0x10ec0233:
> +	case 0x10ec0283:
> +		alc_write_coef_idx(codec, 0x45, 0xc429);
> +		snd_hda_set_pin_ctl_cache(codec, hp_pin, 0);
> +		alc_process_coef_fw(codec, coef0233);
> +		snd_hda_set_pin_ctl_cache(codec, mic_pin, PIN_VREF50);
> +		break;
> +	case 0x10ec0286:
> +	case 0x10ec0288:
> +	case 0x10ec0298:
> +		snd_hda_set_pin_ctl_cache(codec, hp_pin, 0);
> +		alc_process_coef_fw(codec, coef0288);
> +		snd_hda_set_pin_ctl_cache(codec, mic_pin, PIN_VREF50);
> +		break;
> +	case 0x10ec0292:
> +		snd_hda_set_pin_ctl_cache(codec, hp_pin, 0);
> +		alc_process_coef_fw(codec, coef0292);
> +		break;
> +	case 0x10ec0293:
> +		/* Set to TRS mode */
> +		alc_write_coef_idx(codec, 0x45, 0xc429);
> +		snd_hda_set_pin_ctl_cache(codec, hp_pin, 0);
> +		alc_process_coef_fw(codec, coef0293);
> +		snd_hda_set_pin_ctl_cache(codec, mic_pin, PIN_VREF50);
> +		break;
> +	case 0x10ec0867:
> +		alc_update_coefex_idx(codec, 0x57, 0x5, 0, 1<<14);
> +		fallthrough;
> +	case 0x10ec0221:
> +	case 0x10ec0662:
> +		snd_hda_set_pin_ctl_cache(codec, hp_pin, 0);
> +		snd_hda_set_pin_ctl_cache(codec, mic_pin, PIN_VREF50);
> +		break;
> +	case 0x10ec0668:
> +		alc_write_coef_idx(codec, 0x11, 0x0001);
> +		snd_hda_set_pin_ctl_cache(codec, hp_pin, 0);
> +		alc_process_coef_fw(codec, coef0688);
> +		snd_hda_set_pin_ctl_cache(codec, mic_pin, PIN_VREF50);
> +		break;
> +	case 0x10ec0215:
> +	case 0x10ec0225:
> +	case 0x10ec0285:
> +	case 0x10ec0295:
> +	case 0x10ec0289:
> +	case 0x10ec0299:
> +		alc_process_coef_fw(codec, alc225_pre_hsmode);
> +		alc_update_coef_idx(codec, 0x45, 0x3f<<10, 0x31<<10);
> +		snd_hda_set_pin_ctl_cache(codec, hp_pin, 0);
> +		alc_process_coef_fw(codec, coef0225);
> +		snd_hda_set_pin_ctl_cache(codec, mic_pin, PIN_VREF50);
> +		break;
> +	}
> +	codec_dbg(codec, "Headset jack set to mic-in mode.\n");
> +}
> +
> +static void alc_headset_mode_default(struct hda_codec *codec)
> +{
> +	static const struct coef_fw coef0225[] = {
> +		UPDATE_COEF(0x45, 0x3f<<10, 0x30<<10),
> +		UPDATE_COEF(0x45, 0x3f<<10, 0x31<<10),
> +		UPDATE_COEF(0x49, 3<<8, 0<<8),
> +		UPDATE_COEF(0x4a, 3<<4, 3<<4),
> +		UPDATE_COEF(0x63, 3<<14, 0),
> +		UPDATE_COEF(0x67, 0xf000, 0x3000),
> +		{}
> +	};
> +	static const struct coef_fw coef0255[] = {
> +		WRITE_COEF(0x45, 0xc089),
> +		WRITE_COEF(0x45, 0xc489),
> +		WRITE_COEFEX(0x57, 0x03, 0x8ea6),
> +		WRITE_COEF(0x49, 0x0049),
> +		{}
> +	};
> +	static const struct coef_fw coef0256[] = {
> +		WRITE_COEF(0x45, 0xc489),
> +		WRITE_COEFEX(0x57, 0x03, 0x0da3),
> +		WRITE_COEF(0x49, 0x0049),
> +		UPDATE_COEFEX(0x57, 0x05, 1<<14, 0), /* Direct Drive HP Amp control(Set to verb control)*/
> +		WRITE_COEF(0x06, 0x6100),
> +		{}
> +	};
> +	static const struct coef_fw coef0233[] = {
> +		WRITE_COEF(0x06, 0x2100),
> +		WRITE_COEF(0x32, 0x4ea3),
> +		{}
> +	};
> +	static const struct coef_fw coef0288[] = {
> +		UPDATE_COEF(0x4f, 0xfcc0, 0xc400), /* Set to TRS type */
> +		UPDATE_COEF(0x50, 0x2000, 0x2000),
> +		UPDATE_COEF(0x56, 0x0006, 0x0006),
> +		UPDATE_COEF(0x66, 0x0008, 0),
> +		UPDATE_COEF(0x67, 0x2000, 0),
> +		{}
> +	};
> +	static const struct coef_fw coef0292[] = {
> +		WRITE_COEF(0x76, 0x000e),
> +		WRITE_COEF(0x6c, 0x2400),
> +		WRITE_COEF(0x6b, 0xc429),
> +		WRITE_COEF(0x18, 0x7308),
> +		{}
> +	};
> +	static const struct coef_fw coef0293[] = {
> +		UPDATE_COEF(0x4a, 0x000f, 0x000e), /* Combo Jack auto detect */
> +		WRITE_COEF(0x45, 0xC429), /* Set to TRS type */
> +		UPDATE_COEF(0x1a, 1<<3, 0), /* Combo JD gating without LINE1-VREFO */
> +		{}
> +	};
> +	static const struct coef_fw coef0688[] = {
> +		WRITE_COEF(0x11, 0x0041),
> +		WRITE_COEF(0x15, 0x0d40),
> +		WRITE_COEF(0xb7, 0x802b),
> +		{}
> +	};
> +	static const struct coef_fw coef0274[] = {
> +		WRITE_COEF(0x45, 0x4289),
> +		UPDATE_COEF(0x4a, 0x0010, 0x0010),
> +		UPDATE_COEF(0x6b, 0x0f00, 0),
> +		UPDATE_COEF(0x49, 0x0300, 0x0300),
> +		{}
> +	};
> +
> +	switch (codec->core.vendor_id) {
> +	case 0x10ec0215:
> +	case 0x10ec0225:
> +	case 0x10ec0285:
> +	case 0x10ec0295:
> +	case 0x10ec0289:
> +	case 0x10ec0299:
> +		alc_process_coef_fw(codec, alc225_pre_hsmode);
> +		alc_process_coef_fw(codec, coef0225);
> +		alc_hp_enable_unmute(codec, 75);
> +		break;
> +	case 0x10ec0255:
> +		alc_process_coef_fw(codec, coef0255);
> +		break;
> +	case 0x10ec0230:
> +	case 0x10ec0236:
> +	case 0x10ec0256:
> +	case 0x19e58326:
> +		alc_write_coef_idx(codec, 0x1b, 0x0e4b);
> +		alc_write_coef_idx(codec, 0x45, 0xc089);
> +		msleep(50);
> +		alc_process_coef_fw(codec, coef0256);
> +		alc_hp_enable_unmute(codec, 75);
> +		break;
> +	case 0x10ec0234:
> +	case 0x10ec0274:
> +	case 0x10ec0294:
> +		alc_process_coef_fw(codec, coef0274);
> +		break;
> +	case 0x10ec0233:
> +	case 0x10ec0283:
> +		alc_process_coef_fw(codec, coef0233);
> +		break;
> +	case 0x10ec0286:
> +	case 0x10ec0288:
> +	case 0x10ec0298:
> +		alc_process_coef_fw(codec, coef0288);
> +		break;
> +	case 0x10ec0292:
> +		alc_process_coef_fw(codec, coef0292);
> +		break;
> +	case 0x10ec0293:
> +		alc_process_coef_fw(codec, coef0293);
> +		break;
> +	case 0x10ec0668:
> +		alc_process_coef_fw(codec, coef0688);
> +		break;
> +	case 0x10ec0867:
> +		alc_update_coefex_idx(codec, 0x57, 0x5, 1<<14, 0);
> +		break;
> +	}
> +	codec_dbg(codec, "Headset jack set to headphone (default) mode.\n");
> +}
> +
> +/* Iphone type */
> +static void alc_headset_mode_ctia(struct hda_codec *codec)
> +{
> +	int val;
> +
> +	static const struct coef_fw coef0255[] = {
> +		WRITE_COEF(0x45, 0xd489), /* Set to CTIA type */
> +		WRITE_COEF(0x1b, 0x0c2b),
> +		WRITE_COEFEX(0x57, 0x03, 0x8ea6),
> +		{}
> +	};
> +	static const struct coef_fw coef0256[] = {
> +		WRITE_COEF(0x45, 0xd489), /* Set to CTIA type */
> +		WRITE_COEF(0x1b, 0x0e6b),
> +		{}
> +	};
> +	static const struct coef_fw coef0233[] = {
> +		WRITE_COEF(0x45, 0xd429),
> +		WRITE_COEF(0x1b, 0x0c2b),
> +		WRITE_COEF(0x32, 0x4ea3),
> +		{}
> +	};
> +	static const struct coef_fw coef0288[] = {
> +		UPDATE_COEF(0x50, 0x2000, 0x2000),
> +		UPDATE_COEF(0x56, 0x0006, 0x0006),
> +		UPDATE_COEF(0x66, 0x0008, 0),
> +		UPDATE_COEF(0x67, 0x2000, 0),
> +		{}
> +	};
> +	static const struct coef_fw coef0292[] = {
> +		WRITE_COEF(0x6b, 0xd429),
> +		WRITE_COEF(0x76, 0x0008),
> +		WRITE_COEF(0x18, 0x7388),
> +		{}
> +	};
> +	static const struct coef_fw coef0293[] = {
> +		WRITE_COEF(0x45, 0xd429), /* Set to ctia type */
> +		UPDATE_COEF(0x10, 7<<8, 7<<8), /* SET Line1 JD to 1 */
> +		{}
> +	};
> +	static const struct coef_fw coef0688[] = {
> +		WRITE_COEF(0x11, 0x0001),
> +		WRITE_COEF(0x15, 0x0d60),
> +		WRITE_COEF(0xc3, 0x0000),
> +		{}
> +	};
> +	static const struct coef_fw coef0225_1[] = {
> +		UPDATE_COEF(0x45, 0x3f<<10, 0x35<<10),
> +		UPDATE_COEF(0x63, 3<<14, 2<<14),
> +		{}
> +	};
> +	static const struct coef_fw coef0225_2[] = {
> +		UPDATE_COEF(0x45, 0x3f<<10, 0x35<<10),
> +		UPDATE_COEF(0x63, 3<<14, 1<<14),
> +		{}
> +	};
> +
> +	switch (codec->core.vendor_id) {
> +	case 0x10ec0255:
> +		alc_process_coef_fw(codec, coef0255);
> +		break;
> +	case 0x10ec0230:
> +	case 0x10ec0236:
> +	case 0x10ec0256:
> +	case 0x19e58326:
> +		alc_process_coef_fw(codec, coef0256);
> +		alc_hp_enable_unmute(codec, 75);
> +		break;
> +	case 0x10ec0234:
> +	case 0x10ec0274:
> +	case 0x10ec0294:
> +		alc_write_coef_idx(codec, 0x45, 0xd689);
> +		break;
> +	case 0x10ec0233:
> +	case 0x10ec0283:
> +		alc_process_coef_fw(codec, coef0233);
> +		break;
> +	case 0x10ec0298:
> +		val = alc_read_coef_idx(codec, 0x50);
> +		if (val & (1 << 12)) {
> +			alc_update_coef_idx(codec, 0x8e, 0x0070, 0x0020);
> +			alc_update_coef_idx(codec, 0x4f, 0xfcc0, 0xd400);
> +			msleep(300);
> +		} else {
> +			alc_update_coef_idx(codec, 0x8e, 0x0070, 0x0010);
> +			alc_update_coef_idx(codec, 0x4f, 0xfcc0, 0xd400);
> +			msleep(300);
> +		}
> +		break;
> +	case 0x10ec0286:
> +	case 0x10ec0288:
> +		alc_update_coef_idx(codec, 0x4f, 0xfcc0, 0xd400);
> +		msleep(300);
> +		alc_process_coef_fw(codec, coef0288);
> +		break;
> +	case 0x10ec0292:
> +		alc_process_coef_fw(codec, coef0292);
> +		break;
> +	case 0x10ec0293:
> +		alc_process_coef_fw(codec, coef0293);
> +		break;
> +	case 0x10ec0668:
> +		alc_process_coef_fw(codec, coef0688);
> +		break;
> +	case 0x10ec0215:
> +	case 0x10ec0225:
> +	case 0x10ec0285:
> +	case 0x10ec0295:
> +	case 0x10ec0289:
> +	case 0x10ec0299:
> +		val = alc_read_coef_idx(codec, 0x45);
> +		if (val & (1 << 9))
> +			alc_process_coef_fw(codec, coef0225_2);
> +		else
> +			alc_process_coef_fw(codec, coef0225_1);
> +		alc_hp_enable_unmute(codec, 75);
> +		break;
> +	case 0x10ec0867:
> +		alc_update_coefex_idx(codec, 0x57, 0x5, 1<<14, 0);
> +		break;
> +	}
> +	codec_dbg(codec, "Headset jack set to iPhone-style headset mode.\n");
> +}
> +
> +/* Nokia type */
> +static void alc_headset_mode_omtp(struct hda_codec *codec)
> +{
> +	static const struct coef_fw coef0255[] = {
> +		WRITE_COEF(0x45, 0xe489), /* Set to OMTP Type */
> +		WRITE_COEF(0x1b, 0x0c2b),
> +		WRITE_COEFEX(0x57, 0x03, 0x8ea6),
> +		{}
> +	};
> +	static const struct coef_fw coef0256[] = {
> +		WRITE_COEF(0x45, 0xe489), /* Set to OMTP Type */
> +		WRITE_COEF(0x1b, 0x0e6b),
> +		{}
> +	};
> +	static const struct coef_fw coef0233[] = {
> +		WRITE_COEF(0x45, 0xe429),
> +		WRITE_COEF(0x1b, 0x0c2b),
> +		WRITE_COEF(0x32, 0x4ea3),
> +		{}
> +	};
> +	static const struct coef_fw coef0288[] = {
> +		UPDATE_COEF(0x50, 0x2000, 0x2000),
> +		UPDATE_COEF(0x56, 0x0006, 0x0006),
> +		UPDATE_COEF(0x66, 0x0008, 0),
> +		UPDATE_COEF(0x67, 0x2000, 0),
> +		{}
> +	};
> +	static const struct coef_fw coef0292[] = {
> +		WRITE_COEF(0x6b, 0xe429),
> +		WRITE_COEF(0x76, 0x0008),
> +		WRITE_COEF(0x18, 0x7388),
> +		{}
> +	};
> +	static const struct coef_fw coef0293[] = {
> +		WRITE_COEF(0x45, 0xe429), /* Set to omtp type */
> +		UPDATE_COEF(0x10, 7<<8, 7<<8), /* SET Line1 JD to 1 */
> +		{}
> +	};
> +	static const struct coef_fw coef0688[] = {
> +		WRITE_COEF(0x11, 0x0001),
> +		WRITE_COEF(0x15, 0x0d50),
> +		WRITE_COEF(0xc3, 0x0000),
> +		{}
> +	};
> +	static const struct coef_fw coef0225[] = {
> +		UPDATE_COEF(0x45, 0x3f<<10, 0x39<<10),
> +		UPDATE_COEF(0x63, 3<<14, 2<<14),
> +		{}
> +	};
> +
> +	switch (codec->core.vendor_id) {
> +	case 0x10ec0255:
> +		alc_process_coef_fw(codec, coef0255);
> +		break;
> +	case 0x10ec0230:
> +	case 0x10ec0236:
> +	case 0x10ec0256:
> +	case 0x19e58326:
> +		alc_process_coef_fw(codec, coef0256);
> +		alc_hp_enable_unmute(codec, 75);
> +		break;
> +	case 0x10ec0234:
> +	case 0x10ec0274:
> +	case 0x10ec0294:
> +		alc_write_coef_idx(codec, 0x45, 0xe689);
> +		break;
> +	case 0x10ec0233:
> +	case 0x10ec0283:
> +		alc_process_coef_fw(codec, coef0233);
> +		break;
> +	case 0x10ec0298:
> +		alc_update_coef_idx(codec, 0x8e, 0x0070, 0x0010);/* Headset output enable */
> +		alc_update_coef_idx(codec, 0x4f, 0xfcc0, 0xe400);
> +		msleep(300);
> +		break;
> +	case 0x10ec0286:
> +	case 0x10ec0288:
> +		alc_update_coef_idx(codec, 0x4f, 0xfcc0, 0xe400);
> +		msleep(300);
> +		alc_process_coef_fw(codec, coef0288);
> +		break;
> +	case 0x10ec0292:
> +		alc_process_coef_fw(codec, coef0292);
> +		break;
> +	case 0x10ec0293:
> +		alc_process_coef_fw(codec, coef0293);
> +		break;
> +	case 0x10ec0668:
> +		alc_process_coef_fw(codec, coef0688);
> +		break;
> +	case 0x10ec0215:
> +	case 0x10ec0225:
> +	case 0x10ec0285:
> +	case 0x10ec0295:
> +	case 0x10ec0289:
> +	case 0x10ec0299:
> +		alc_process_coef_fw(codec, coef0225);
> +		alc_hp_enable_unmute(codec, 75);
> +		break;
> +	}
> +	codec_dbg(codec, "Headset jack set to Nokia-style headset mode.\n");
> +}
> +
> +static void alc_determine_headset_type(struct hda_codec *codec)
> +{
> +	int val;
> +	bool is_ctia = false;
> +	struct alc_spec *spec = codec->spec;
> +	static const struct coef_fw coef0255[] = {
> +		WRITE_COEF(0x45, 0xd089), /* combo jack auto switch control(Check type)*/
> +		WRITE_COEF(0x49, 0x0149), /* combo jack auto switch control(Vref
> + conteol) */
> +		{}
> +	};
> +	static const struct coef_fw coef0288[] = {
> +		UPDATE_COEF(0x4f, 0xfcc0, 0xd400), /* Check Type */
> +		{}
> +	};
> +	static const struct coef_fw coef0298[] = {
> +		UPDATE_COEF(0x50, 0x2000, 0x2000),
> +		UPDATE_COEF(0x56, 0x0006, 0x0006),
> +		UPDATE_COEF(0x66, 0x0008, 0),
> +		UPDATE_COEF(0x67, 0x2000, 0),
> +		UPDATE_COEF(0x19, 0x1300, 0x1300),
> +		{}
> +	};
> +	static const struct coef_fw coef0293[] = {
> +		UPDATE_COEF(0x4a, 0x000f, 0x0008), /* Combo Jack auto detect */
> +		WRITE_COEF(0x45, 0xD429), /* Set to ctia type */
> +		{}
> +	};
> +	static const struct coef_fw coef0688[] = {
> +		WRITE_COEF(0x11, 0x0001),
> +		WRITE_COEF(0xb7, 0x802b),
> +		WRITE_COEF(0x15, 0x0d60),
> +		WRITE_COEF(0xc3, 0x0c00),
> +		{}
> +	};
> +	static const struct coef_fw coef0274[] = {
> +		UPDATE_COEF(0x4a, 0x0010, 0),
> +		UPDATE_COEF(0x4a, 0x8000, 0),
> +		WRITE_COEF(0x45, 0xd289),
> +		UPDATE_COEF(0x49, 0x0300, 0x0300),
> +		{}
> +	};
> +
> +	if (spec->no_internal_mic_pin) {
> +		alc_update_coef_idx(codec, 0x45, 0xf<<12 | 1<<10, 5<<12);
> +		return;
> +	}
> +
> +	switch (codec->core.vendor_id) {
> +	case 0x10ec0255:
> +		alc_process_coef_fw(codec, coef0255);
> +		msleep(300);
> +		val = alc_read_coef_idx(codec, 0x46);
> +		is_ctia = (val & 0x0070) == 0x0070;
> +		break;
> +	case 0x10ec0230:
> +	case 0x10ec0236:
> +	case 0x10ec0256:
> +	case 0x19e58326:
> +		alc_write_coef_idx(codec, 0x1b, 0x0e4b);
> +		alc_write_coef_idx(codec, 0x06, 0x6104);
> +		alc_write_coefex_idx(codec, 0x57, 0x3, 0x09a3);
> +
> +		alc_process_coef_fw(codec, coef0255);
> +		msleep(300);
> +		val = alc_read_coef_idx(codec, 0x46);
> +		is_ctia = (val & 0x0070) == 0x0070;
> +		if (!is_ctia) {
> +			alc_write_coef_idx(codec, 0x45, 0xe089);
> +			msleep(100);
> +			val = alc_read_coef_idx(codec, 0x46);
> +			if ((val & 0x0070) == 0x0070)
> +				is_ctia = false;
> +			else
> +				is_ctia = true;
> +		}
> +		alc_write_coefex_idx(codec, 0x57, 0x3, 0x0da3);
> +		alc_update_coefex_idx(codec, 0x57, 0x5, 1<<14, 0);
> +		break;
> +	case 0x10ec0234:
> +	case 0x10ec0274:
> +	case 0x10ec0294:
> +		alc_process_coef_fw(codec, coef0274);
> +		msleep(850);
> +		val = alc_read_coef_idx(codec, 0x46);
> +		is_ctia = (val & 0x00f0) == 0x00f0;
> +		break;
> +	case 0x10ec0233:
> +	case 0x10ec0283:
> +		alc_write_coef_idx(codec, 0x45, 0xd029);
> +		msleep(300);
> +		val = alc_read_coef_idx(codec, 0x46);
> +		is_ctia = (val & 0x0070) == 0x0070;
> +		break;
> +	case 0x10ec0298:
> +		snd_hda_codec_write(codec, 0x21, 0,
> +			    AC_VERB_SET_AMP_GAIN_MUTE, AMP_OUT_MUTE);
> +		msleep(100);
> +		snd_hda_codec_write(codec, 0x21, 0,
> +			    AC_VERB_SET_PIN_WIDGET_CONTROL, 0x0);
> +		msleep(200);
> +
> +		val = alc_read_coef_idx(codec, 0x50);
> +		if (val & (1 << 12)) {
> +			alc_update_coef_idx(codec, 0x8e, 0x0070, 0x0020);
> +			alc_process_coef_fw(codec, coef0288);
> +			msleep(350);
> +			val = alc_read_coef_idx(codec, 0x50);
> +			is_ctia = (val & 0x0070) == 0x0070;
> +		} else {
> +			alc_update_coef_idx(codec, 0x8e, 0x0070, 0x0010);
> +			alc_process_coef_fw(codec, coef0288);
> +			msleep(350);
> +			val = alc_read_coef_idx(codec, 0x50);
> +			is_ctia = (val & 0x0070) == 0x0070;
> +		}
> +		alc_process_coef_fw(codec, coef0298);
> +		snd_hda_codec_write(codec, 0x21, 0,
> +			    AC_VERB_SET_PIN_WIDGET_CONTROL, PIN_HP);
> +		msleep(75);
> +		snd_hda_codec_write(codec, 0x21, 0,
> +			    AC_VERB_SET_AMP_GAIN_MUTE, AMP_OUT_UNMUTE);
> +		break;
> +	case 0x10ec0286:
> +	case 0x10ec0288:
> +		alc_process_coef_fw(codec, coef0288);
> +		msleep(350);
> +		val = alc_read_coef_idx(codec, 0x50);
> +		is_ctia = (val & 0x0070) == 0x0070;
> +		break;
> +	case 0x10ec0292:
> +		alc_write_coef_idx(codec, 0x6b, 0xd429);
> +		msleep(300);
> +		val = alc_read_coef_idx(codec, 0x6c);
> +		is_ctia = (val & 0x001c) == 0x001c;
> +		break;
> +	case 0x10ec0293:
> +		alc_process_coef_fw(codec, coef0293);
> +		msleep(300);
> +		val = alc_read_coef_idx(codec, 0x46);
> +		is_ctia = (val & 0x0070) == 0x0070;
> +		break;
> +	case 0x10ec0668:
> +		alc_process_coef_fw(codec, coef0688);
> +		msleep(300);
> +		val = alc_read_coef_idx(codec, 0xbe);
> +		is_ctia = (val & 0x1c02) == 0x1c02;
> +		break;
> +	case 0x10ec0215:
> +	case 0x10ec0225:
> +	case 0x10ec0285:
> +	case 0x10ec0295:
> +	case 0x10ec0289:
> +	case 0x10ec0299:
> +		alc_process_coef_fw(codec, alc225_pre_hsmode);
> +		alc_update_coef_idx(codec, 0x67, 0xf000, 0x1000);
> +		val = alc_read_coef_idx(codec, 0x45);
> +		if (val & (1 << 9)) {
> +			alc_update_coef_idx(codec, 0x45, 0x3f<<10, 0x34<<10);
> +			alc_update_coef_idx(codec, 0x49, 3<<8, 2<<8);
> +			msleep(800);
> +			val = alc_read_coef_idx(codec, 0x46);
> +			is_ctia = (val & 0x00f0) == 0x00f0;
> +		} else {
> +			alc_update_coef_idx(codec, 0x45, 0x3f<<10, 0x34<<10);
> +			alc_update_coef_idx(codec, 0x49, 3<<8, 1<<8);
> +			msleep(800);
> +			val = alc_read_coef_idx(codec, 0x46);
> +			is_ctia = (val & 0x00f0) == 0x00f0;
> +		}
> +		if (!is_ctia) {
> +			alc_update_coef_idx(codec, 0x45, 0x3f<<10, 0x38<<10);
> +			alc_update_coef_idx(codec, 0x49, 3<<8, 1<<8);
> +			msleep(100);
> +			val = alc_read_coef_idx(codec, 0x46);
> +			if ((val & 0x00f0) == 0x00f0)
> +				is_ctia = false;
> +			else
> +				is_ctia = true;
> +		}
> +		alc_update_coef_idx(codec, 0x4a, 7<<6, 7<<6);
> +		alc_update_coef_idx(codec, 0x4a, 3<<4, 3<<4);
> +		alc_update_coef_idx(codec, 0x67, 0xf000, 0x3000);
> +		break;
> +	case 0x10ec0867:
> +		is_ctia = true;
> +		break;
> +	}
> +
> +	codec_dbg(codec, "Headset jack detected iPhone-style headset: %s\n",
> +		  str_yes_no(is_ctia));
> +	spec->current_headset_type = is_ctia ? ALC_HEADSET_TYPE_CTIA : ALC_HEADSET_TYPE_OMTP;
> +}
> +
> +static void alc_update_headset_mode(struct hda_codec *codec)
> +{
> +	struct alc_spec *spec = codec->spec;
> +
> +	hda_nid_t mux_pin = spec->gen.imux_pins[spec->gen.cur_mux[0]];
> +	hda_nid_t hp_pin = alc_get_hp_pin(spec);
> +
> +	int new_headset_mode;
> +
> +	if (!snd_hda_jack_detect(codec, hp_pin))
> +		new_headset_mode = ALC_HEADSET_MODE_UNPLUGGED;
> +	else if (mux_pin == spec->headset_mic_pin)
> +		new_headset_mode = ALC_HEADSET_MODE_HEADSET;
> +	else if (mux_pin == spec->headphone_mic_pin)
> +		new_headset_mode = ALC_HEADSET_MODE_MIC;
> +	else
> +		new_headset_mode = ALC_HEADSET_MODE_HEADPHONE;
> +
> +	if (new_headset_mode == spec->current_headset_mode) {
> +		snd_hda_gen_update_outputs(codec);
> +		return;
> +	}
> +
> +	switch (new_headset_mode) {
> +	case ALC_HEADSET_MODE_UNPLUGGED:
> +		alc_headset_mode_unplugged(codec);
> +		spec->current_headset_mode = ALC_HEADSET_MODE_UNKNOWN;
> +		spec->current_headset_type = ALC_HEADSET_TYPE_UNKNOWN;
> +		spec->gen.hp_jack_present = false;
> +		break;
> +	case ALC_HEADSET_MODE_HEADSET:
> +		if (spec->current_headset_type == ALC_HEADSET_TYPE_UNKNOWN)
> +			alc_determine_headset_type(codec);
> +		if (spec->current_headset_type == ALC_HEADSET_TYPE_CTIA)
> +			alc_headset_mode_ctia(codec);
> +		else if (spec->current_headset_type == ALC_HEADSET_TYPE_OMTP)
> +			alc_headset_mode_omtp(codec);
> +		spec->gen.hp_jack_present = true;
> +		break;
> +	case ALC_HEADSET_MODE_MIC:
> +		alc_headset_mode_mic_in(codec, hp_pin, spec->headphone_mic_pin);
> +		spec->gen.hp_jack_present = false;
> +		break;
> +	case ALC_HEADSET_MODE_HEADPHONE:
> +		alc_headset_mode_default(codec);
> +		spec->gen.hp_jack_present = true;
> +		break;
> +	}
> +	if (new_headset_mode != ALC_HEADSET_MODE_MIC) {
> +		snd_hda_set_pin_ctl_cache(codec, hp_pin,
> +					  AC_PINCTL_OUT_EN | AC_PINCTL_HP_EN);
> +		if (spec->headphone_mic_pin && spec->headphone_mic_pin != hp_pin)
> +			snd_hda_set_pin_ctl_cache(codec, spec->headphone_mic_pin,
> +						  PIN_VREFHIZ);
> +	}
> +	spec->current_headset_mode = new_headset_mode;
> +
> +	snd_hda_gen_update_outputs(codec);
> +}
> +
> +static void alc_update_headset_mode_hook(struct hda_codec *codec,
> +					 struct snd_kcontrol *kcontrol,
> +					 struct snd_ctl_elem_value *ucontrol)
> +{
> +	alc_update_headset_mode(codec);
> +}
> +
> +void alc_update_headset_jack_cb(struct hda_codec *codec,
> +				struct hda_jack_callback *jack)
> +{
> +	snd_hda_gen_hp_automute(codec, jack);
> +	alc_update_headset_mode(codec);
> +}
> +EXPORT_SYMBOL_NS_GPL(alc_update_headset_jack_cb, "SND_HDA_CODEC_REALTEK");
> +
> +static void alc_probe_headset_mode(struct hda_codec *codec)
> +{
> +	int i;
> +	struct alc_spec *spec = codec->spec;
> +	struct auto_pin_cfg *cfg = &spec->gen.autocfg;
> +
> +	/* Find mic pins */
> +	for (i = 0; i < cfg->num_inputs; i++) {
> +		if (cfg->inputs[i].is_headset_mic && !spec->headset_mic_pin)
> +			spec->headset_mic_pin = cfg->inputs[i].pin;
> +		if (cfg->inputs[i].is_headphone_mic && !spec->headphone_mic_pin)
> +			spec->headphone_mic_pin = cfg->inputs[i].pin;
> +	}
> +
> +	WARN_ON(spec->gen.cap_sync_hook);
> +	spec->gen.cap_sync_hook = alc_update_headset_mode_hook;
> +	spec->gen.automute_hook = alc_update_headset_mode;
> +	spec->gen.hp_automute_hook = alc_update_headset_jack_cb;
> +}
> +
> +void alc_fixup_headset_mode(struct hda_codec *codec,
> +			    const struct hda_fixup *fix, int action)
> +{
> +	struct alc_spec *spec = codec->spec;
> +
> +	switch (action) {
> +	case HDA_FIXUP_ACT_PRE_PROBE:
> +		spec->parse_flags |= HDA_PINCFG_HEADSET_MIC | HDA_PINCFG_HEADPHONE_MIC;
> +		break;
> +	case HDA_FIXUP_ACT_PROBE:
> +		alc_probe_headset_mode(codec);
> +		break;
> +	case HDA_FIXUP_ACT_INIT:
> +		if (is_s3_resume(codec) || is_s4_resume(codec)) {
> +			spec->current_headset_mode = ALC_HEADSET_MODE_UNKNOWN;
> +			spec->current_headset_type = ALC_HEADSET_TYPE_UNKNOWN;
> +		}
> +		alc_update_headset_mode(codec);
> +		break;
> +	}
> +}
> +EXPORT_SYMBOL_NS_GPL(alc_fixup_headset_mode, "SND_HDA_CODEC_REALTEK");
> +
> +void alc_fixup_headset_mode_no_hp_mic(struct hda_codec *codec,
> +				      const struct hda_fixup *fix, int action)
> +{
> +	if (action == HDA_FIXUP_ACT_PRE_PROBE) {
> +		struct alc_spec *spec = codec->spec;
> +		spec->parse_flags |= HDA_PINCFG_HEADSET_MIC;
> +	}
> +	else
> +		alc_fixup_headset_mode(codec, fix, action);
> +}
> +EXPORT_SYMBOL_NS_GPL(alc_fixup_headset_mode_no_hp_mic, "SND_HDA_CODEC_REALTEK");
> +
> +void alc_fixup_headset_mic(struct hda_codec *codec,
> +			   const struct hda_fixup *fix, int action)
> +{
> +	struct alc_spec *spec = codec->spec;
> +
> +	if (action == HDA_FIXUP_ACT_PRE_PROBE)
> +		spec->parse_flags |= HDA_PINCFG_HEADSET_MIC;
> +}
> +EXPORT_SYMBOL_NS_GPL(alc_fixup_headset_mic, "SND_HDA_CODEC_REALTEK");
> +
> +/* update LED status via GPIO */
> +void alc_update_gpio_led(struct hda_codec *codec, unsigned int mask,
> +			 int polarity, bool enabled)
> +{
> +	if (polarity)
> +		enabled = !enabled;
> +	alc_update_gpio_data(codec, mask, !enabled); /* muted -> LED on */
> +}
> +EXPORT_SYMBOL_NS_GPL(alc_update_gpio_led, "SND_HDA_CODEC_REALTEK");
> +
> +/* turn on/off mic-mute LED via GPIO per capture hook */
> +static int micmute_led_set(struct led_classdev *led_cdev,
> +			   enum led_brightness brightness)
> +{
> +	struct hda_codec *codec = dev_to_hda_codec(led_cdev->dev->parent);
> +	struct alc_spec *spec = codec->spec;
> +
> +	alc_update_gpio_led(codec, spec->gpio_mic_led_mask,
> +			    spec->micmute_led_polarity, !brightness);
> +	return 0;
> +}
> +
> +/* turn on/off mute LED via GPIO per vmaster hook */
> +static int gpio_mute_led_set(struct led_classdev *led_cdev,
> +			     enum led_brightness brightness)
> +{
> +	struct hda_codec *codec = dev_to_hda_codec(led_cdev->dev->parent);
> +	struct alc_spec *spec = codec->spec;
> +
> +	alc_update_gpio_led(codec, spec->gpio_mute_led_mask,
> +			    spec->mute_led_polarity, !brightness);
> +	return 0;
> +}
> +
> +/* setup mute and mic-mute GPIO bits, add hooks appropriately */
> +void alc_fixup_hp_gpio_led(struct hda_codec *codec,
> +			   int action,
> +			   unsigned int mute_mask,
> +			   unsigned int micmute_mask)
> +{
> +	struct alc_spec *spec = codec->spec;
> +
> +	alc_fixup_gpio(codec, action, mute_mask | micmute_mask);
> +
> +	if (action != HDA_FIXUP_ACT_PRE_PROBE)
> +		return;
> +	if (mute_mask) {
> +		spec->gpio_mute_led_mask = mute_mask;
> +		snd_hda_gen_add_mute_led_cdev(codec, gpio_mute_led_set);
> +	}
> +	if (micmute_mask) {
> +		spec->gpio_mic_led_mask = micmute_mask;
> +		snd_hda_gen_add_micmute_led_cdev(codec, micmute_led_set);
> +	}
> +}
> +EXPORT_SYMBOL_NS_GPL(alc_fixup_hp_gpio_led, "SND_HDA_CODEC_REALTEK");
> +
> +/* suppress the jack-detection */
> +void alc_fixup_no_jack_detect(struct hda_codec *codec,
> +			      const struct hda_fixup *fix, int action)
> +{
> +	if (action == HDA_FIXUP_ACT_PRE_PROBE)
> +		codec->no_jack_detect = 1;
> +}
> +EXPORT_SYMBOL_NS_GPL(alc_fixup_no_jack_detect, "SND_HDA_CODEC_REALTEK");
> +
> +void alc_fixup_disable_aamix(struct hda_codec *codec,
> +			     const struct hda_fixup *fix, int action)
> +{
> +	if (action == HDA_FIXUP_ACT_PRE_PROBE) {
> +		struct alc_spec *spec = codec->spec;
> +		/* Disable AA-loopback as it causes white noise */
> +		spec->gen.mixer_nid = 0;
> +	}
> +}
> +EXPORT_SYMBOL_NS_GPL(alc_fixup_disable_aamix, "SND_HDA_CODEC_REALTEK");
> +
> +void alc_fixup_auto_mute_via_amp(struct hda_codec *codec,
> +				 const struct hda_fixup *fix, int action)
> +{
> +	if (action == HDA_FIXUP_ACT_PRE_PROBE) {
> +		struct alc_spec *spec = codec->spec;
> +		spec->gen.auto_mute_via_amp = 1;
> +	}
> +}
> +EXPORT_SYMBOL_NS_GPL(alc_fixup_auto_mute_via_amp, "SND_HDA_CODEC_REALTEK");
> +
> +MODULE_IMPORT_NS("SND_HDA_SCODEC_COMPONENT");
> +MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("Realtek HD-audio codec helper");
> diff --git a/sound/hda/codecs/realtek/realtek.h b/sound/hda/codecs/realtek/realtek.h
> new file mode 100644
> index 000000000000..ac142f2540e3
> --- /dev/null
> +++ b/sound/hda/codecs/realtek/realtek.h
> @@ -0,0 +1,302 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +//
> +// Realtek HD-audio codec support code
> +//
> +
> +#ifndef __HDA_REALTEK_H
> +#define __HDA_REALTEK_H
> +
> +#include <linux/acpi.h>
> +#include <linux/cleanup.h>
> +#include <linux/init.h>
> +#include <linux/delay.h>
> +#include <linux/slab.h>
> +#include <linux/pci.h>
> +#include <linux/dmi.h>
> +#include <linux/module.h>
> +#include <linux/i2c.h>
> +#include <linux/input.h>
> +#include <linux/leds.h>
> +#include <linux/ctype.h>
> +#include <linux/spi/spi.h>
> +#include <sound/core.h>
> +#include <sound/jack.h>
> +#include <sound/hda_codec.h>
> +#include "hda_local.h"
> +#include "hda_auto_parser.h"
> +#include "hda_beep.h"
> +#include "hda_jack.h"
> +#include "../generic.h"
> +#include "../side-codecs/hda_component.h"
> +
> +/* extra amp-initialization sequence types */
> +enum {
> +	ALC_INIT_UNDEFINED,
> +	ALC_INIT_NONE,
> +	ALC_INIT_DEFAULT,
> +};
> +
> +enum {
> +	ALC_HEADSET_MODE_UNKNOWN,
> +	ALC_HEADSET_MODE_UNPLUGGED,
> +	ALC_HEADSET_MODE_HEADSET,
> +	ALC_HEADSET_MODE_MIC,
> +	ALC_HEADSET_MODE_HEADPHONE,
> +};
> +
> +enum {
> +	ALC_HEADSET_TYPE_UNKNOWN,
> +	ALC_HEADSET_TYPE_CTIA,
> +	ALC_HEADSET_TYPE_OMTP,
> +};
> +
> +enum {
> +	ALC_KEY_MICMUTE_INDEX,
> +};
> +
> +struct alc_customize_define {
> +	unsigned int  sku_cfg;
> +	unsigned char port_connectivity;
> +	unsigned char check_sum;
> +	unsigned char customization;
> +	unsigned char external_amp;
> +	unsigned int  enable_pcbeep:1;
> +	unsigned int  platform_type:1;
> +	unsigned int  swap:1;
> +	unsigned int  override:1;
> +	unsigned int  fixup:1; /* Means that this sku is set by driver, not read from hw */
> +};
> +
> +struct alc_coef_led {
> +	unsigned int idx;
> +	unsigned int mask;
> +	unsigned int on;
> +	unsigned int off;
> +};
> +
> +struct alc_spec {
> +	struct hda_gen_spec gen; /* must be at head */
> +
> +	/* codec parameterization */
> +	struct alc_customize_define cdefine;
> +	unsigned int parse_flags; /* flag for snd_hda_parse_pin_defcfg() */
> +
> +	/* GPIO bits */
> +	unsigned int gpio_mask;
> +	unsigned int gpio_dir;
> +	unsigned int gpio_data;
> +	bool gpio_write_delay;	/* add a delay before writing gpio_data */
> +
> +	/* mute LED for HP laptops, see vref_mute_led_set() */
> +	int mute_led_polarity;
> +	int micmute_led_polarity;
> +	hda_nid_t mute_led_nid;
> +	hda_nid_t cap_mute_led_nid;
> +
> +	unsigned int gpio_mute_led_mask;
> +	unsigned int gpio_mic_led_mask;
> +	struct alc_coef_led mute_led_coef;
> +	struct alc_coef_led mic_led_coef;
> +	struct mutex coef_mutex;
> +
> +	hda_nid_t headset_mic_pin;
> +	hda_nid_t headphone_mic_pin;
> +	int current_headset_mode;
> +	int current_headset_type;
> +
> +	/* hooks */
> +	void (*init_hook)(struct hda_codec *codec);
> +	void (*power_hook)(struct hda_codec *codec);
> +	void (*shutup)(struct hda_codec *codec);
> +
> +	int init_amp;
> +	int codec_variant;	/* flag for other variants */
> +	unsigned int has_alc5505_dsp:1;
> +	unsigned int no_depop_delay:1;
> +	unsigned int done_hp_init:1;
> +	unsigned int no_shutup_pins:1;
> +	unsigned int ultra_low_power:1;
> +	unsigned int has_hs_key:1;
> +	unsigned int no_internal_mic_pin:1;
> +	unsigned int en_3kpull_low:1;
> +	int num_speaker_amps;
> +
> +	/* for PLL fix */
> +	hda_nid_t pll_nid;
> +	unsigned int pll_coef_idx, pll_coef_bit;
> +	unsigned int coef0;
> +	struct input_dev *kb_dev;
> +	u8 alc_mute_keycode_map[1];
> +
> +	/* component binding */
> +	struct hda_component_parent comps;
> +};
> +
> +int alc_read_coefex_idx(struct hda_codec *codec, hda_nid_t nid,
> +			unsigned int coef_idx);
> +void alc_write_coefex_idx(struct hda_codec *codec, hda_nid_t nid,
> +			  unsigned int coef_idx, unsigned int coef_val);
> +void alc_update_coefex_idx(struct hda_codec *codec, hda_nid_t nid,
> +			   unsigned int coef_idx, unsigned int mask,
> +			   unsigned int bits_set);
> +#define alc_read_coef_idx(codec, coef_idx) \
> +	alc_read_coefex_idx(codec, 0x20, coef_idx)
> +#define alc_write_coef_idx(codec, coef_idx, coef_val) \
> +	alc_write_coefex_idx(codec, 0x20, coef_idx, coef_val)
> +#define alc_update_coef_idx(codec, coef_idx, mask, bits_set)	\
> +	alc_update_coefex_idx(codec, 0x20, coef_idx, mask, bits_set)
> +
> +unsigned int alc_get_coef0(struct hda_codec *codec);
> +
> +/* coef writes/updates batch */
> +struct coef_fw {
> +	unsigned char nid;
> +	unsigned char idx;
> +	unsigned short mask;
> +	unsigned short val;
> +};
> +
> +#define UPDATE_COEFEX(_nid, _idx, _mask, _val) \
> +	{ .nid = (_nid), .idx = (_idx), .mask = (_mask), .val = (_val) }
> +#define WRITE_COEFEX(_nid, _idx, _val) UPDATE_COEFEX(_nid, _idx, -1, _val)
> +#define WRITE_COEF(_idx, _val) WRITE_COEFEX(0x20, _idx, _val)
> +#define UPDATE_COEF(_idx, _mask, _val) UPDATE_COEFEX(0x20, _idx, _mask, _val)
> +
> +void alc_process_coef_fw(struct hda_codec *codec, const struct coef_fw *fw);
> +
> +/*
> + * GPIO helpers
> + */
> +void alc_setup_gpio(struct hda_codec *codec, unsigned int mask);
> +void alc_write_gpio_data(struct hda_codec *codec);
> +void alc_update_gpio_data(struct hda_codec *codec, unsigned int mask,
> +			  bool on);
> +void alc_write_gpio(struct hda_codec *codec);
> +
> +/* common GPIO fixups */
> +void alc_fixup_gpio(struct hda_codec *codec, int action, unsigned int mask);
> +void alc_fixup_gpio1(struct hda_codec *codec,
> +		     const struct hda_fixup *fix, int action);
> +void alc_fixup_gpio2(struct hda_codec *codec,
> +		     const struct hda_fixup *fix, int action);
> +void alc_fixup_gpio3(struct hda_codec *codec,
> +		     const struct hda_fixup *fix, int action);
> +void alc_fixup_gpio4(struct hda_codec *codec,
> +		     const struct hda_fixup *fix, int action);
> +void alc_fixup_micmute_led(struct hda_codec *codec,
> +			   const struct hda_fixup *fix, int action);
> +
> +/*
> + * Common init code, callbacks and helpers
> + */
> +void alc_fix_pll(struct hda_codec *codec);
> +void alc_fix_pll_init(struct hda_codec *codec, hda_nid_t nid,
> +		      unsigned int coef_idx, unsigned int coef_bit);
> +void alc_fill_eapd_coef(struct hda_codec *codec);
> +void alc_auto_setup_eapd(struct hda_codec *codec, bool on);
> +
> +int alc_find_ext_mic_pin(struct hda_codec *codec);
> +void alc_headset_mic_no_shutup(struct hda_codec *codec);
> +void alc_shutup_pins(struct hda_codec *codec);
> +void alc_eapd_shutup(struct hda_codec *codec);
> +void alc_auto_init_amp(struct hda_codec *codec, int type);
> +hda_nid_t alc_get_hp_pin(struct alc_spec *spec);
> +int alc_auto_parse_customize_define(struct hda_codec *codec);
> +int alc_subsystem_id(struct hda_codec *codec, const hda_nid_t *ports);
> +void alc_ssid_check(struct hda_codec *codec, const hda_nid_t *ports);
> +int alc_build_controls(struct hda_codec *codec);
> +void alc_update_knob_master(struct hda_codec *codec,
> +			    struct hda_jack_callback *jack);
> +
> +static inline void alc_pre_init(struct hda_codec *codec)
> +{
> +	alc_fill_eapd_coef(codec);
> +}
> +
> +#define is_s3_resume(codec) \
> +	((codec)->core.dev.power.power_state.event == PM_EVENT_RESUME)
> +#define is_s4_resume(codec) \
> +	((codec)->core.dev.power.power_state.event == PM_EVENT_RESTORE)
> +#define is_s4_suspend(codec) \
> +	((codec)->core.dev.power.power_state.event == PM_EVENT_FREEZE)
> +
> +int alc_init(struct hda_codec *codec);
> +void alc_shutup(struct hda_codec *codec);
> +void alc_power_eapd(struct hda_codec *codec);
> +int alc_suspend(struct hda_codec *codec);
> +int alc_resume(struct hda_codec *codec);
> +
> +#define alc_free	snd_hda_gen_free
> +
> +int alc_parse_auto_config(struct hda_codec *codec,
> +			  const hda_nid_t *ignore_nids,
> +			  const hda_nid_t *ssid_nids);
> +int alc_alloc_spec(struct hda_codec *codec, hda_nid_t mixer_nid);
> +
> +extern const struct hda_codec_ops alc_patch_ops;
> +
> +#define alc_codec_rename(codec, name) snd_hda_codec_set_name(codec, name)
> +
> +#ifdef CONFIG_SND_HDA_INPUT_BEEP
> +int alc_set_beep_amp(struct alc_spec *spec, hda_nid_t nid, int idx, int dir);
> +int alc_has_cdefine_beep(struct hda_codec *codec);
> +#define set_beep_amp		alc_set_beep_amp
> +#define has_cdefine_beep	alc_has_cdefine_beep
> +#else
> +#define set_beep_amp(spec, nid, idx, dir)	0
> +#define has_cdefine_beep(codec)		0
> +#endif
> +
> +static inline void rename_ctl(struct hda_codec *codec, const char *oldname,
> +			      const char *newname)
> +{
> +	struct snd_kcontrol *kctl;
> +
> +	kctl = snd_hda_find_mixer_ctl(codec, oldname);
> +	if (kctl)
> +		snd_ctl_rename(codec->card, kctl, newname);
> +}
> +
> +/* Common fixups */
> +void alc_fixup_sku_ignore(struct hda_codec *codec,
> +			  const struct hda_fixup *fix, int action);
> +void alc_fixup_no_depop_delay(struct hda_codec *codec,
> +			      const struct hda_fixup *fix, int action);
> +void alc_fixup_inv_dmic(struct hda_codec *codec,
> +			const struct hda_fixup *fix, int action);
> +void alc_fixup_dual_codecs(struct hda_codec *codec,
> +			   const struct hda_fixup *fix, int action);
> +void alc_fixup_bass_chmap(struct hda_codec *codec,
> +			  const struct hda_fixup *fix, int action);
> +void alc_fixup_headset_mode(struct hda_codec *codec,
> +			    const struct hda_fixup *fix, int action);
> +void alc_fixup_headset_mode_no_hp_mic(struct hda_codec *codec,
> +				      const struct hda_fixup *fix, int action);
> +void alc_fixup_headset_mic(struct hda_codec *codec,
> +			   const struct hda_fixup *fix, int action);
> +void alc_update_headset_jack_cb(struct hda_codec *codec,
> +				struct hda_jack_callback *jack);
> +void alc_update_gpio_led(struct hda_codec *codec, unsigned int mask,
> +			 int polarity, bool enabled);
> +void alc_fixup_hp_gpio_led(struct hda_codec *codec,
> +			   int action,
> +			   unsigned int mute_mask,
> +			   unsigned int micmute_mask);
> +void alc_fixup_no_jack_detect(struct hda_codec *codec,
> +			      const struct hda_fixup *fix, int action);
> +void alc_fixup_disable_aamix(struct hda_codec *codec,
> +			     const struct hda_fixup *fix, int action);
> +void alc_fixup_auto_mute_via_amp(struct hda_codec *codec,
> +				 const struct hda_fixup *fix, int action);
> +
> +/* device-specific, but used by multiple codec drivers */
> +void alc1220_fixup_gb_dual_codecs(struct hda_codec *codec,
> +				  const struct hda_fixup *fix,
> +				  int action);
> +void alc233_alc662_fixup_lenovo_dual_codecs(struct hda_codec *codec,
> +					    const struct hda_fixup *fix,
> +					    int action);
> +void alc_fixup_dell_xps13(struct hda_codec *codec,
> +			  const struct hda_fixup *fix, int action);
> +
> +#endif /* __HDA_REALTEK_H */

