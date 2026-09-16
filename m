Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B1747044F
	for <linux-sound@vger.kernel.org>; Wed, 16 Sep 2026 08:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789547404; cv=fail; b=ipyAvk2TeXOJi/1pKBphCuCp83oqZAqTkRI73KNRVuOBgRgUUOkFT+s/SPy0GxaR+8PunMnxNP93+wBiKjvB+1abWYKXfmKijDWJq7MPYwLsn91iJbnDrZj0cL/1gcEk0DOQGu8pW8BOH/udL6EmM4CdC0ohyNKP+WLMltDUtkQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789547404; c=relaxed/simple;
	bh=4atOOEW0b9sQZYzn5EcWZv6nphNajk4zg8inQa89nWw=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=NxbSmSyw4iEDyU6As73AT28wjWH75OkhcG3Ov6L6Wy86NOl+d/AOPemx6IUwx0iYvLvKJcGPODWT2MymqDe9h545nvy4GgxyjSM+ugB4/BONeBTKbj+8tSRnYINggzfAGEuYDaW4am7gaYLzPez9WNjbc2gsp/T8xB5oycFblXw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LzI9/Byn; arc=fail smtp.client-ip=192.198.163.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LzI9/Byn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789547402; x=1821083402;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=4atOOEW0b9sQZYzn5EcWZv6nphNajk4zg8inQa89nWw=;
  b=LzI9/BynfuNFmceK4Xq+gbKzqVzD5P5HQt232ATui5BTvxrfRFEbIazq
   OrAVv+7LiOlHnzq26CUO/qiaEnwoDT1ytH7QLFVfjJQPfbDBaYsNhgMAM
   9c6YQnvsp2bKTmLNpbkANQhXm9wtlBG+8+uLF1DwdW1eFzTGNNfA9aGCS
   NUeXKdJh8Bz2ZEd9ZxWTjpAy6krPnC+4jvDRLOHmkcbW9kkdpO5aTdfXI
   NKV7LuGdh/lY3SsQKEAZv8Cz0U8BigYEIggqTDpOzBaAR6dfVHxqiV4WD
   5nsUCvNTdhxKx4HEKmw8YMp1DIELas+ZvFgfCmZteduCa4oMXvk1AQIlz
   Q==;
X-CSE-ConnectionGUID: OjtjM3vpRvm1KljyB5+vRQ==
X-CSE-MsgGUID: ojauKiUFQy6xH5jDW+rYMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="429610"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="429610"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 01:30:01 -0700
X-CSE-ConnectionGUID: cdNSM/8OQdytOVpAPNRYhw==
X-CSE-MsgGUID: 2B+Kq7euS/uU9l0a7yvDOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="1496512"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa012.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 01:30:01 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 01:30:00 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 16 Sep 2026 01:30:00 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.22) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 01:30:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nwYWHiB7TZkEaLyan6h/IVNYhMInjlxywJMZztn6122ciyUGSIhghLvjiHZap1zQpNP1QESlKqxsGpszYEnv4XEaH1MK4Mzfm1ZeUsb4/xESQtH2Eh/qhRH/uaKbBArhmDGptVQM5TDxU/5tSRY+DTHV6DZVzifgxH0D7GvXpt5enbPfrLseH0YFcMAHlimToaOKFCokXhiRBPJ5M5+syJwuVNPnt6pLLigqer/p7ksxgWlVfow/kW9/aqQiCXBDCFNFhVWICgI3upL8bavUHTKUmxWEqMdp7utHrCLjpXIqrTGyIg8UF5q5Fl1Kg/7iA8pvChc5cTpXxT0RAwaCJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dnChXxoJuccxcZ2hTz7F4PcOwn2QORTxb9NmwH915AI=;
 b=e6TAD0DWZYwP24yvNNwq0EA0FuP9HTjP4yacE90A+g1RPMeq940XUAihQhRg4/VDyzlMgvSjcUnvL4jA1Cgt/gY6ElQgsSMB2tvL75C+UG2+S+FBuPVbDvH1V7mzjKBTH5TQMRtXv3TQB1UMFu5I6RNQcwVIFWf23lSY1Kn2M5HALPr6jVsFzVhCKdWWzKNCQS6VFyfVHgjwvgsn5MpaTVesJcIqHP81MK6PEffk0WuRHFaq6yTS657FyIamwYDcdCm5BUMUcWRfR+HrO/x4CgZbJSqTQgjQfvWs+mranXRPgwKnTwsMDwydl47lbexmxMRhkUbATfcZwJSG+jOMlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6006.namprd11.prod.outlook.com (2603:10b6:510:1e1::13)
 by LV4PPFA6EB48437.namprd11.prod.outlook.com (2603:10b6:40f:fc02::22c) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Wed, 16 Sep
 2026 08:29:54 +0000
Received: from PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd]) by PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd%6]) with mapi id 15.21.0406.007; Wed, 16 Sep 2026
 08:29:54 +0000
Message-ID: <0f1397fb-4ec8-4644-8fea-717f57354b25@intel.com>
Date: Wed, 16 Sep 2026 10:29:49 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ALSA: hda: Allow for codec model selection with module
 param
To: Takashi Iwai <tiwai@suse.de>
CC: <tiwai@suse.com>, <broonie@kernel.org>, <perex@perex.cz>,
	<amade@asmblr.net>, <linux-sound@vger.kernel.org>
References: <20260914102253.2969724-1-cezary.rojewski@intel.com>
 <87bj9zom8l.wl-tiwai@suse.de>
 <9e17f127-ecaa-407f-96ec-0993e9c1ee83@intel.com>
 <87tsnrn5oe.wl-tiwai@suse.de>
 <1d146db5-f4ff-4a5b-a1d9-181ee6d8ceac@intel.com>
 <87a4pin4v2.wl-tiwai@suse.de>
 <36644426-3302-47da-a720-f353c307348b@intel.com>
 <87ik46lcz6.wl-tiwai@suse.de>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <87ik46lcz6.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIVP296CA0038.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:356::15) To PH7PR11MB6006.namprd11.prod.outlook.com
 (2603:10b6:510:1e1::13)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6006:EE_|LV4PPFA6EB48437:EE_
X-MS-Office365-Filtering-Correlation-Id: e07a3c0f-c544-43ba-f27a-08df13ccaed2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|6133799003|18002099003|22082099003|10067099003|11063799006|56012099006|5023799004|4143699003;
X-Microsoft-Antispam-Message-Info: tiYB0o04gaRj5kAmJG1qdusT9lNNU9PFPRIolIDXPwRiTY3uhLKLGq+45yTgFplp19hE+ti1Bse8u08rN/0576wVqkP/MFBIjNJLXXzfOvv5voINjVh0+AePpkCTrwa6yU5LFgpoAMPVy2l78CbisaRqDQIHqLHuuyeroe1NP9XD6zxko9nhwhGg4xz2QJ6j8TwyemcYX6F2d0FeTq+NYWDlxbrXt1eUCLYS0+7MCVZihKIWU74lqXQYwv+ioYkaVX9FGh6WIlV2yj+RMFQrNKaGDq9ldBa1vzRythtefQenwrFQBmT0Uw9Qb1KGFO4FikbmdxjWuC/fuQ6Se/dxS5+SGRRB5qUgWyUJVUIZQpVYbGmkMuevZ5Wwi/sGoD52KB5YPxKjR8x5TsMrL04rbzjPawgFmDb9cnJBin0VOfEiA+ZzFvbqJ7HBpC1Rnsvo9Y0m8w7sFfxG1dfBQ++R3XH7SPMTdHlCi4tilk3tk+t7dhf80azHzyi0+kAsu9rVh89s533ta8hmFgua5qLQbnQRzNppR0JmkjUxnqCOwwOLf11IcDeAmkqJHo6/3FYYXlMDZbc7CHGw4chrfJtvFdNslWHv78IkLarfcxXhbV9bZk/DoLpUfPHwlc64eSVz
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(6133799003)(18002099003)(22082099003)(10067099003)(11063799006)(56012099006)(5023799004)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SkJXNFBMMjVlVEZhazZsbmVybEZaRGpVL0ZtOTArUUVZU3BqVFdwWTJnelY2?=
 =?utf-8?B?UjhnOWZBei9zdE1QbmtlME9NQkxydEpRQjk3LzVNWXY2aVN1SVdLZUhIT0Uv?=
 =?utf-8?B?bFFtYkxDZXpYbFNSTHVVMUN5TDZ3NjZFY2VVY09EZ2JKOUE0anV3Qm9hVXI3?=
 =?utf-8?B?U3c0UGJhOVF6VCtwS0Fsc1hQckp4bWVVM2d5dzJZMUxkZkcydzlrcVlWeHlT?=
 =?utf-8?B?WHQ3QlM1ODlOa1BsN3F2UGo0YmdJQWtEWXl1UGhIL3hIK3JDaDdkZTZ6ZW92?=
 =?utf-8?B?eDlWOTlHVVBkQzFjcXVPL3krMHhIbUpDTlB2SjVPVFQwdXlpaFk3SEtzcWJN?=
 =?utf-8?B?bFhoOU5PL1MrajJTajl1RW15c2FMRm94cGdXVzlTcWk0Z25uQUloTFJIOHBN?=
 =?utf-8?B?VVN1RVVwK1RtVjJmczJPK3pwM2p4dXZ3ZFNHV09JQnZ1ZjZiWUcrNTRUZlpM?=
 =?utf-8?B?SElNQ3dOTFExQjNTdVZBdVBuMzRLc0xqVHhjNlZJUWVoQjBXbnBmL2ZkYmNx?=
 =?utf-8?B?S1RJdGNGeDdHQ1BLR2FTTW5HL2k2dFpoUStGTVV0YlpNNzU4SisvZHkwblpw?=
 =?utf-8?B?OGlrZE01ZEg2QjlFZ3lOR0NoQmVMZXBmVnJzSDN4bFF4bzVMcnNQMzdDekU2?=
 =?utf-8?B?SE5HZko3enVhbWw4SUFrMGxKdHpkeDI0M3A1RDluaHg1NWh0akVOc3A2TVFI?=
 =?utf-8?B?RXhBeHl5b091ZGkxMVpjZHlaUENVTFBNM29OT2hGNGlaUVpHNExWNExKaEx4?=
 =?utf-8?B?WjA1V2syYXJzY25wREd4VXd0R0s4UVNyNWREWVMzMkcvWFpaaERoRkFSNzJS?=
 =?utf-8?B?djVYQkFqRWJkRWNFeXorbWRiZTl2TUMwSitsKzl1N3lVVjA1NXphUWc1SmZ6?=
 =?utf-8?B?NVlkcWdhS1FDNGJpZkFVM3NaTFVrR2RkWGJ6c1gyS2dGOU1jaXprU2x5b092?=
 =?utf-8?B?b3J0ZExaMENrcWp0YzEyeFdoYkxEUGREZ01ubWd0VUJIcDhuQnhmT2w4cS9t?=
 =?utf-8?B?cEF0T0hzTzhVNklONll1SndaaU9DZ2JrOVU1enVSYjN6MGwvaXRXUFpWdG1N?=
 =?utf-8?B?Zmg0bG5XMDF2bk5BWDJ0Q2J2MEkxRjV3cjFoTnZ1NHVkOU9sZHE5RWtiSXhK?=
 =?utf-8?B?SCs1QmVJK1Y4S05iRHg0Z2h1NE5ZYlRuWlR3ZUtLeWYxNzNkdGhlTTZ4cUM3?=
 =?utf-8?B?ZlkvL254UG9nUTMvalBMZEIvM05xQ05TU1BTUFYwZGpNdDZjQW5vcFh1NWRl?=
 =?utf-8?B?REEzeVJib3E3RjNxb3JMcWpuYitVN0JJVlMwS0w0U2FtNm8vVk10eGlLZG5T?=
 =?utf-8?B?Q3R5cnFMVkJtaHB2dlRyNmM2RjVaVHBHekgrU2FiV0pwVXFHdTkzY2FvOWNY?=
 =?utf-8?B?cjVjdWhFTEFKM00yY096ZGxaQktaa0swbUpCWi9RSXJEUVhoQzZvUmhnU05x?=
 =?utf-8?B?Zi9TZGFWcHZFZlhHZVE2Szd0bnhoYUN4cm1yZVFaSUpQQTJmR2NXdE9Da2Yw?=
 =?utf-8?B?RnZCejAvNks1aXJWSWQ0MmhUOXlvdUZHLzV6Ykp1U3ZsMGtSOEdIS3RqV0RY?=
 =?utf-8?B?WFFJQjZ2cnpWQmk0ZTh3aHVsaVpLRXhmVm1hZnhNdGxDWjRNbkV5U3JUVnJr?=
 =?utf-8?B?MXJBb09kVllyN1dKMnV2L3hEOVRmNlpoTnFTRDlGMXhsd0Zjblc0UVRwdWtG?=
 =?utf-8?B?aFkwN0ptTkNWTGNaZXBXNzBpYW5td1pWa0swZjF5TUkvYlJhWjhQODRnOVh1?=
 =?utf-8?B?TkNYcTJKN1QyTndYSXZvMkNCaDlsSnRkWHhXOXgzNWVGWFUxUW5ISU1hcnB4?=
 =?utf-8?B?bi9mbEl3QmxQY3dXUEtVeEJmR0R5UG04Z2VXUjZ4OHZqbWtNbkFIanhxMTZW?=
 =?utf-8?B?bUZXa3ZkdFduVm5YZDRBZWF3aGNrdFBxd2dweVcvTUhTMWtRSnRXTlBUZFJz?=
 =?utf-8?B?ZUNrL0haUjU5ZUhET0VQRmE2YkFzOHJRdjdiMlY2UU9SakV6aGZKUktjWE4x?=
 =?utf-8?B?anVUTCtKdnZkV3Mvc29xQWd6a2lSZy9lemF3TjB0c3dpT2xMeE5EeDlWTnFm?=
 =?utf-8?B?RTRQNHNpc2E5bm9NdVgwa2xCUmxUNEtxTnFMdHV1cEMycUtSdVJPemFIRUhu?=
 =?utf-8?B?czVZcW5DVndHaGg1MUFZMkhrc0JVenh0dGFOeEZ3MmpESVA4U3A0V0lhQmM3?=
 =?utf-8?B?cEtLbHNBTWFBNHBRcXlnc096dCt5bC9sRzlyYzcrZ0FlTkhjL0RPUkZ3cHJU?=
 =?utf-8?B?U1lybHpKU2FUZE1jVkkxSTVwZUkwd2k0M09OY1dIcmw5Y09LTUNETlpjQzA1?=
 =?utf-8?B?MGtDY1JYQzA0Q2RQRFA0RXUrREdvYTdnT3RFRE1LQWU2d3dqUHF3VFpoUVBC?=
 =?utf-8?Q?o/RNLQ6TNINgA74A=3D?=
X-Exchange-RoutingPolicyChecked: vcnwUDcDBj0GaDlOP1yCY9aBAErXUgg9579CzUNlnn/Wimyj/3JkxnczCtl7FAdGJ+yOAlr/6X+t9IKpskEpRancUFJaOpDwebPkS0qiZMp/0HyYBTPHykD3+ojvltbWSmaJ9H/SXHUN20tp1LArSEOMipayDIWbp7qzdMD2qVBTVxHlvxyi/xTNzmvi5puGpx9G549iNWm027riiX9TiBE2Er8+0Ma1Q8NpoRsNiqswVRtigDQki8AYemTqcURXDdAT+KNMYFVVykKuw+IzoRguLpWoe5LN3ZWZe5rGflgKTGwlD+krYYenaWRk8rQJAcjvtu05mOAglpWOS45x2g==
X-MS-Exchange-CrossTenant-Network-Message-Id: e07a3c0f-c544-43ba-f27a-08df13ccaed2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 08:29:53.9494
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tYZMN8QY3LrsxlL94JEsG42VvtGcwKyNbRPvOVQml6P/ISK6RTwHUt9CJ3W8E1+uc1f/tY5hdATspoiDglaoMA9587FyMWBhaGwJj0PzZMM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV4PPFA6EB48437
X-OriginatorOrg: intel.com

On 9/15/2026 6:02 PM, Takashi Iwai wrote:

>>>>>>>> Model selection allows for customization of codec behaviour and thus
>>>>>>>> dealing with various problems on very specific configurations. The
>>>>>>>> parameter already exists but is part of snd_hda_intel specifically.
>>>>>>>> Non-Intel HDAudio controllers and DSP-capable drivers cannot benefit
>>>>>>>> from it.
>>>>>>>>
>>>>>>>> The common place for all the bus drivers is snd_hda_codec. Add modelname
>>>>>>>> parameter there and honor it when initializing codec->modelname field.
>>>>>>>>
>>>>>>>> Link: https://github.com/thesofproject/linux/issues/5683
>>>>>>>> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
>>>>>>>
>>>>>>> The handling of the model option is a very long-standing PITA.
>>>>>>> A few years ago, I proposed a change like:
>>>>>>>   https://mailman.alsa-project.org/pipermail/alsa-devel/2022-September/206631.html
>>>>>>> but it didn't reach to agreement.  So I'm not 100% sure whether adding
>>>>>>> here is the best choice, either.
>>>>>> Thank you for the link, Takashi.
>>>>>>
>>>>>> IMHO patch presented here addresses the feedback. I too prefer
>>>>>> one-location-for-all approach. Also, I do believe having no option for
>>>>>> specifying the model is worse than choosing either of the approaches for
>>>>>> the model selection.
>>>>>>
>>>>>> snd_hda_codec module is *everywhere* and given the param is an array, it
>>>>>> supports even very complicated scenarios when multiple HDAudio codecs
>>>>>> are engaged.
>>>>>
>>>>> The multi-codec is exactly the problem I've been seeing (of course in
>>>>> addition to the lack of the option in ASoC HD-audio).  You'll have to
>>>>> be very careful how to pass the option, and it can be even fragile.
>>>>> That's why I hesitated to take this...
>>>> By multi-codec I also meant scenarios where one has 2+ codecs from one
>>>> vendor e.g.: realtek. Having non-array param e.g.: for
>>>> snd_hda_codec_realtek would not suffice.
>>>
>>> But those 2+ codecs are for the single device, right?  (e.g. driving
>>> multiple channels with multiple codecs, but all of them are a single
>>> device for user.)
>>>
>>> In theory, it can be a hotplug device, and in that case, we may have
>>> two device configurations for multiple codecs of the same codec chip.
>>> But, that's an exception, and I wonder whether we should care for the
>>> model option that is mainly used for debugging or workaround.
>> On reference setups we do anything. 2+ standalone codecs on HDAudio bus
>> in our lab is not some kind of sorcery. Obviously right now we
>> workaround the kernel by applying a bunch of patches. But adding a
>> module param (of type array) covers both: any userspace and any
>> reference scenario.
> 
> Well, using an array itself isn't a big problem.  The codec module
> option could be an array, too.
> 
> The problem I've been seeing is, however, that it's cumbersome to pass
> the arrays correctly if there are multiple devices.  Currently it
> depends on the controller probe order, and that's often unintuitive
> for users.  This problem still remains with your proposed change --
> even more confusing because now there are multiple entries but
> digested differently (imagine a combination of hda-intel and SOF).
> 
> So, obviously, I haven't found any good solution yet...
snd_hda_codec is fetched with SND_HDA kconfig which is always on when
SND_HDA_CORE is selected - this is true for both DSP drivers, avs-driver
and the sof-driver as both depend on SND_HDA_EXT_CORE:

	SND_HDA <- SND_HDA_CORE <- SND_HDA_EXT_CORE

Depending on dsp_driver, not selected drivers will quit probe() early
before the code gets to model assignment part.

And thus I'm not sure what you meant by "combination of hda-intel and
SOF".  At the same time not quite sure about "controller probe order"
issue either - bus->modelname and codec's model are two different
things.  It's likely I've missed something and if so, I'd greatly
appreciate additional input.

Kind regards,
Czarek
