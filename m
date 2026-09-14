Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F57F47F791
	for <linux-sound@vger.kernel.org>; Mon, 14 Sep 2026 16:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789403373; cv=fail; b=HQhvBjvyhlxuqpHhrJ2DPyeSIlF5qvz7u/vzN44NjyRS1nlvPKDc6sUhFD7jacogCkTqWmEWwJB7wxyFyus5daSWpuw3cUdeQkSlyKwPBnO8vdrRry8OAMM1+qs7cAfjOdURqB/aHUC332PwCI3Bf/bvUmlV+B66XGWLew5I7LU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789403373; c=relaxed/simple;
	bh=kFfEVpiCO5Sk2s2r/suedvIMyLQn32vEUYzZpcNKi3w=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=B1ZNBWM3A9Jb2dsS9vj9ZLbn8k32tvdVVcyWIn9woPe3ShQKq7e4pjtaAYtCs2KeAAPDsYzCiRv4G1i9ecY5GkmFSjnIe7A0vjWnHbGsv4UYwHuoUZt4n0kEYq07lSUiaYgm64eSfqkBH7/TUhbfbPKwHMer4ioGrNW7rmokb+k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k5+9eNDk; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k5+9eNDk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789403371; x=1820939371;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=kFfEVpiCO5Sk2s2r/suedvIMyLQn32vEUYzZpcNKi3w=;
  b=k5+9eNDkBZiX0sbmabAvfM4N7zFT9zpxAjiYXe8Xbwkm9YdWwp571taH
   uWjf5B349tfVHG87BymotsuYi9BynwrluJcLzH6NMI6HpdGw/zFvljeo6
   hrDvmTo8qQOnFX0HsAkiXSXzNdsU0qVSfVUrP3sIXGxRlF8OwHpyD4owp
   1rma1/kzKmMkdrTo9IbM0Vt1PxVvz5Iw96Pv91ETaslYr1PD3/96nApKD
   ujiw9AMGu2LkqQ6CPnhb7q0F1B3z+vJcxOmxhtlbXufoQ0Q1NuVZHSZe5
   4oJH6Vfeqr79uT8mCRBKXR0Ji8BXW7zyfZfdmLb960pxaVN9b5jAHQ4kR
   Q==;
X-CSE-ConnectionGUID: k/xDQmdtSU2FQUa3ong+hw==
X-CSE-MsgGUID: MwMXouLbQzC8ZWvbBgQVGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100422523"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="100422523"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 09:29:30 -0700
X-CSE-ConnectionGUID: J3K7UPLVScqA9OcfiBU3ew==
X-CSE-MsgGUID: DxVSbyaPQC2vrgum3a6/iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="310957059"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 09:29:30 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 09:29:29 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 14 Sep 2026 09:29:29 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.71) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 09:29:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uY2jJ4axteQh6NxYzmYbFM8Nki7y74sdp8rySkEqg5DcmY6n1K2ZJdxEAlBSS5PU2DipepR/8JD1GDFfqftrtB/xgr2OEVI8VwvWSQa0GW5vD/qAlcu9sIJR3OSuFhVpIsXDj1ZD9QOCPSolLT2WRsQhtXzO00S96UwTVylg8USRrR/YR2IoPsSnrYp0FnIMoFMva/qrHGgUYiW77ySiPYI2XUG/5W/FoV3i5des+5StBmZaZjXROnLm7PAL4TsWZNsiCceHgl+bNGX2ktIXSx6+GfY1QRpjaLE0DMwcjM1RrEaSVcPrcVxKQgYpSmeBFGN1GEuYdLRPfZVcW1uWRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BDgxtMIquAtWc1+v6zJ15TkW1+esBXp6XPwdtn0QI2Q=;
 b=tzn4CMoZMTdfuOUoEunSzhtlgjYUR7JJSZjQNPGf0KCYXufzO6n1QwLO2X+7V9rmsE/UE4jkwSs5yq8FubxKoZ3HLAgS8KjqPIKlZNQ2fWHd0Oeact9Ca85dylRWtPGlaZqASLhuCVqhRq3CSsxcQb0Zmjfa8V8HnMmN2okySdz/6UotHCK/h5RIpV2PqBhkXmmpk4VhA/6hD/5p1MzgCK5OD5XvFir334HaQH7IvnNHFUtFJJEMC/9/nr+TLJtfDR7XVoUNGBuP7Kld2gwG0vzfjXLtH8N7dvPcZUpYAN3kZon3v7MiouHL4eVB8SIEtRUQQV5a6PaegcgrfAmwfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6006.namprd11.prod.outlook.com (2603:10b6:510:1e1::13)
 by PH7PR11MB7569.namprd11.prod.outlook.com (2603:10b6:510:273::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 16:29:24 +0000
Received: from PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd]) by PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd%6]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 16:29:24 +0000
Message-ID: <9e17f127-ecaa-407f-96ec-0993e9c1ee83@intel.com>
Date: Mon, 14 Sep 2026 18:29:19 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ALSA: hda: Allow for codec model selection with module
 param
To: Takashi Iwai <tiwai@suse.de>
CC: <tiwai@suse.com>, <broonie@kernel.org>, <perex@perex.cz>,
	<amade@asmblr.net>, <linux-sound@vger.kernel.org>
References: <20260914102253.2969724-1-cezary.rojewski@intel.com>
 <87bj9zom8l.wl-tiwai@suse.de>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <87bj9zom8l.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIVP296CA0114.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:358::7) To PH7PR11MB6006.namprd11.prod.outlook.com
 (2603:10b6:510:1e1::13)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6006:EE_|PH7PR11MB7569:EE_
X-MS-Office365-Filtering-Correlation-Id: 291e34b9-d18f-4951-9b7f-08df127d56b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|6133799003|56012099006|11063799006|5023799004|4143699003|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info: lIF9UckAjaFtKlMqM0fGmbOBH4WKprwm+1+gT69w9xuJxHlQqmPX5jHNtNNEgHxpwcXoVuVm5DUPhnybz5o99UMKgcfKmIJ3zZqm8rPssktfV4kB/E/7sJCZuJWNuhk64VZH6eD4Vdf0fVD4hDPF+Hwcd1bDwM0HaoGHftK6Zav1qEImKcd6T0j9+ykRGFbjxXKMOoC5dYhsm7N0HkAo0G7NekB7yh1Omy0lYJl1gXGcF29XiLS77j3BwNEABKlS843WekhXq2Tfw5jbXZ62eSnIcr7zy7EDPtX34qpmKBjbkR3PuuzdtWDgXOA61A8l8Iy3E6pxonRF3JqMG+oMxwFAJEzpXmk9+en+rz34YhC/rN65oNktxh5qwX5WPzquQ230KdaPu7A8N/AW61YnWNEwIT2ATkkjLKpnNMdte5vfU4Dda4X1du7G6VQxUOT+hlYaN4Iej26wl0Ngs/p4hKLNtAPNw7xVDMzZMq4YWdW4sgncUuHCFY4qTJd+G9zwABxgbzH1nqdT2JGUCaUk3LCzQSHfu0CeG+TwQiEfbNvaDFIf5qG1BEVA3pAparY5z57yHxYmHmHfOj6DF8giCMfqpCKk8UNJX9wtafiDmOFJnvntGPAOARHR0NK6aa8r
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(6133799003)(56012099006)(11063799006)(5023799004)(4143699003)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SGVsT3JzcS9TVlZsVW5NTUZVZzFzeklSK243KytQZ3VRaC9vWk5kN0tHR3V1?=
 =?utf-8?B?dUR6ZXUzaDhZd3dJRmZ0UHphRmRDWldMeXlNMThIMkZocmxPUjFPMnhUeE5a?=
 =?utf-8?B?QzZrcFhjQ2xiVkVERmFKWVA2NTlmZnZTWUZhVkZ1VG9FcUxXTzVsaTRDWkhX?=
 =?utf-8?B?VzVxbmFNVHZFOUdndVlybDRIM2FQQk9nbWhmQnNGaXNIT0R1eGpUMGFWTVhG?=
 =?utf-8?B?RWlwbHpkbnI1WjlqUHlBZ21rOE5qbEZsemlWSEtGUlFTMjNuVXdJV25aU3JO?=
 =?utf-8?B?OFpsNkdMcXI1L2JPK21OTDNuQVk1cHlLVUxwM3VJcHZOdTZmSVFjTEd0TlVk?=
 =?utf-8?B?WmxTNkJlc0o3dGxyZ3F0SkxQRkFTQjRIZDlKKzg0dHMvLzFHN3VSbE1BY2ZD?=
 =?utf-8?B?QWZRTmZDVGVvTEI1OTRDNTVlZzNWbm9DT0t6WHU5b0RBd2l2YlJ2WXY0dEUr?=
 =?utf-8?B?UDU2RWpERVpmTmFRQUxIakJLOVRNblZ3d3Rmb3k5VkMySnBmdXp3YjAzYStF?=
 =?utf-8?B?ZzZTcms4b1hvcEhxN2paTjIycUdDWWNLdXNBVTRBUUJTRlpDdFVFVDJzSTQz?=
 =?utf-8?B?clRMOGMrWWFFcDUxYUFhTWtzTnRPY3d3ZWhsWk1SNDUzdlNPbmVkSDJCWHZE?=
 =?utf-8?B?bkdnMi9QNVNIOVJGSkc1U01xWnkzSWJkWUw3Wk9CaFp1OEZlMXA2dUxtY2ww?=
 =?utf-8?B?anE0d0FBMmxUQnFoWFF3V1RpY1E1V0VMYWtVSWc4WjV6dlpadURaNXNQNDV4?=
 =?utf-8?B?R2RLMW1pK2hzM2dZM01IQUlESkxGejJTbnl6Z2tXV0E3L3FyTEFCT3F2bWNl?=
 =?utf-8?B?aHZML0liWWN3THFMbjBTRGwwS3VMQlF4KzRsVzIzTEN0Q0FqV2RPVGVuN0FN?=
 =?utf-8?B?ckJRZWFveVhjRWdpSTh6MzVIZHVydWwrWlQ4Qnh2RWVPWDFHRGd6NlhUSmRU?=
 =?utf-8?B?YVNZeC8wNlkxSzZQSExoYW01aVFvZzR6MjQ0UzBYZU9EYnhaZWdyTGRvbldB?=
 =?utf-8?B?QXJKMTY0Nk5KSHowVVBlVC9ObTBtQmFjcWQxL2k1akhXSDJrcUx0Q1NmQWhM?=
 =?utf-8?B?blEyZE8ybWJhODJaczJxMzBxMUVxdHljdXZYZENMN1BrdFg1dWU4N0xmR2hk?=
 =?utf-8?B?ZUFHTHJONG4vVno4SUJCNVh3UTQrNm1UVnFlSjIydGNrOGVBNFhvWDhtTDRO?=
 =?utf-8?B?dWpIU0JqQTM0TWNWS1JqNWI1SnBKc05Udyt5Z2l2UG8zNUtYUW9kM1Fiamlt?=
 =?utf-8?B?SU5QL1ZiTlZIOVI5YUpQdXFOWlc3TGNIZzVSNG9NTzAzS0Zac1hjY1NvTFBx?=
 =?utf-8?B?TU9KRVhIM3ptMFhtd3gwV0pCT2pMN3N5ZE5aTFU3eUdJTjZnRk5HcjJ5VTNm?=
 =?utf-8?B?SkJQTEFKNGVEcU5nM1NDcDRkeEZqY2RITXlxTHhXb2dlSVZlUjdUbmk4VEhE?=
 =?utf-8?B?TnNOejhXeUVJcmo5cVZpS1FhNnZ4ZlZWQVR3ajJHOTY1alA3U21OWVZ6N2NW?=
 =?utf-8?B?amIrbk5GdW1CMmxGME1YdFRsNWJVMlhpSzcxbGtxRmlJa0VyUTNzS2NVRmlQ?=
 =?utf-8?B?SzIyeG9pWmJaRG5NZlJ6OWUzVGpMZGdVMnFtYUpmV1BjVVM1SU9nWkUxdUpH?=
 =?utf-8?B?Y1BoYis5eENrY2V0a3pFL0RsdXVjeWloMGRKSDFXMnBGOHJ3WE9NdFB0M1kx?=
 =?utf-8?B?VlpwVjB1VGd4VGhqTWdnZTZlN2dNUjFXM0kvcTJOelpVTERSWXQxbVJTTFN2?=
 =?utf-8?B?T2xmTkxGVVFiSnl0SzcxUVJqY3BhQ1lkdlVEcDladm9ZdWFJYmJsK2RabUR1?=
 =?utf-8?B?U0pFTURSbDFwUE9hWDFBOHFIQitGUFQwUnU0M1RkODJ2NldQTjBxLzZBR09O?=
 =?utf-8?B?eTRsangxUUVxOHFrOGx0a1AvZUkvRGJSMXlqSXZSckFpVy9WNEdPU2ttQk51?=
 =?utf-8?B?NW5xZ1ZtSHI1RFlFLzArNFhzNUlyU1N2YytxM2t0SmVndlJEMXlrbXdXdXFy?=
 =?utf-8?B?eXNObU1FOEdPTVNURnBEM1NtZWpUSmVBamQ0eEE4STg2UFBvUGxJdG5wZHoy?=
 =?utf-8?B?dnBIc0xWb0hrTDhMWENVd2tGeFI5UHJLR3dYT1hBTndHVEJJeENxVi8rMXZl?=
 =?utf-8?B?OU12bTVLYnJDdFpBeVZvWTMxYjYwMjdzSWU3dGJvLzdCUzg1dm1xN3lNYWRl?=
 =?utf-8?B?NjNRL3k5WW5tTEFXVVBrME5yUHd4SmF2YmN3U3JsQ0t0dThhVXRuT3BjVy9p?=
 =?utf-8?B?OXJmYTVjNHBUU1dPc3hGZVkzY1k1enlZSmFSdXhrUlk3VDBJYnlQV2QzWmVj?=
 =?utf-8?B?QXlCVm53VjdiaVhmL0VoYitZNnd6Y0JKdWswYnRiNk8xRFA0L0dLUGxTWmdC?=
 =?utf-8?Q?PpwwVTZbUdHBdBaQ=3D?=
X-Exchange-RoutingPolicyChecked: JOaVrspsCUY6SJYzKTrKxHOdVbeEU1xLzY6KjfajaSNGQdD1Aqe1Z8GZ0PTXpOFxhaKPPttkSOU5VO+6w1vBS0G9lC2Q3c/XDSARKIvC79k9ykbQyv9aVlPMrzxs9IK2BuGNANHVfapA/meTkFBgEUTENppXubM6nFLsaf/KkCvGVTtUmjOqZGXDKzzv+o2UuQ8ZUoaP00mIMKwXABjhmX2BNdlDzHTagMczsen5R5deTjYGaE5vWVBzMsYvQxKSQngyLHY7p8ZUsucZ1vBB7v/YWAKIfhrTWtq1gDNPCeMnuazVmh74UZLNav5dk/tHHNJAOxgJNXy7MdZroib1gA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 291e34b9-d18f-4951-9b7f-08df127d56b7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 16:29:24.8180
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VuUaRvUSfn2ZoaT3o1yJ3VgPg3SSHCRX+pnD9duBvMvZ5ag39ubf4hv9fC9u5Nj/PL2Z5eBr8jEW+5rFerD7QCWALCCwqYZJ0sBK2IIj5/c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7569
X-OriginatorOrg: intel.com

On 9/14/2026 6:01 PM, Takashi Iwai wrote:
> On Mon, 14 Sep 2026 12:22:53 +0200,
> Cezary Rojewski wrote:
>>
>> Model selection allows for customization of codec behaviour and thus
>> dealing with various problems on very specific configurations. The
>> parameter already exists but is part of snd_hda_intel specifically.
>> Non-Intel HDAudio controllers and DSP-capable drivers cannot benefit
>> from it.
>>
>> The common place for all the bus drivers is snd_hda_codec. Add modelname
>> parameter there and honor it when initializing codec->modelname field.
>>
>> Link: https://github.com/thesofproject/linux/issues/5683
>> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
> 
> The handling of the model option is a very long-standing PITA.
> A few years ago, I proposed a change like:
>   https://mailman.alsa-project.org/pipermail/alsa-devel/2022-September/206631.html
> but it didn't reach to agreement.  So I'm not 100% sure whether adding
> here is the best choice, either.
Thank you for the link, Takashi.

IMHO patch presented here addresses the feedback. I too prefer
one-location-for-all approach. Also, I do believe having no option for
specifying the model is worse than choosing either of the approaches for
the model selection.

snd_hda_codec module is *everywhere* and given the param is an array, it
supports even very complicated scenarios when multiple HDAudio codecs
are engaged.

Kind regards,
Czarek
