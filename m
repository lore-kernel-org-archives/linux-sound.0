Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F82A1F2380
	for <linux-sound@vger.kernel.org>; Wed, 13 May 2026 21:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778706077; cv=fail; b=KeMB4H7UTfsxu4vWCdhleu+4ymvMLmdCu2h5jCc1esV8RaZeQVTWZtbCZ0KaAsowVOp64LUDugjhlsyzc+BEmVI3gcj3FQ/vlThT5Aa5dxls2+j+SaKcYnZXC0418F8Hlfkm7Qdt4LkttAw2NjrKZxSYjAGNbBg+Di6bVQ97nnY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778706077; c=relaxed/simple;
	bh=NqA8+25Uc0kX59L9f7FiZSHBOg8DGsWpqqmKTKMnEdk=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=AD5lNGZANkDavn4MymJZztFa3xWdkIXMH1auMkbNpWycO/ND15+Noe/OQvfj8s6gvUvFHqEkgqfrc5MGD9jemvc7yFXHDv6zG8dWBpm7rldW6yEWpO93n7t/LDtVrexDvAm2J0deN5DZAGP6MuMZnnDUEs75yRf1Ubcy8P/HKyg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HTazELTq; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HTazELTq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778706075; x=1810242075;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=NqA8+25Uc0kX59L9f7FiZSHBOg8DGsWpqqmKTKMnEdk=;
  b=HTazELTqphKiZxZrv8aBt1vz2pmWMEYMvwHfiJR0JtfwC8wd/l5VQQip
   OWhYBn4TXuNV4yvWx+e80y/fYpfKWuhFgOaovspIPBh9+XdYGm/Ks58rs
   EbWdLlUvADmsVglM8cCFaBxb35jWaIUPqyl9/9oQxsMu5TOBOzU4tUjOz
   0MNNQHbT75/T7kV/WorGv7SYlourJJDMmQPPf18XGXnb1zj5mnmisDSg+
   WuMZIP5SayNUTJ9U3jViKIegyKF337ux92i34KzLQMmC8gEnjvIQYJ0BI
   2dXz8hhjGD2273hKILgfyIEyopaosxTMQarxyH9EoljcInBs0ggkIUDgF
   A==;
X-CSE-ConnectionGUID: 3uy8hDTFQ5yP0MpsZZaV/A==
X-CSE-MsgGUID: skYIEVxJT/KDOh3rouPX+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="105102095"
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="105102095"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 14:01:15 -0700
X-CSE-ConnectionGUID: 2HVpVUYKT1Sw/uyyeat2Qw==
X-CSE-MsgGUID: 4lk9qEeiTpal1GG6fXUYwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="243178323"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 14:01:15 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 13 May 2026 14:01:14 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 13 May 2026 14:01:14 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.1) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 13 May 2026 14:01:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AzxiZQ3retx06KysOIik4uWkrUCEHE1DnWBkKeGfRkZPON+gTSEBNMA7g8Cx92jklYyQXE6kVEm/NVojg/d0ugkQFm1j8oeEzKTNe/Iqvu0yQZJhfNRHnSMr7fQyopIUc81qiWGqwEKOvmFsvdqcZOPyC6K+g188WtnTcNUIKvcHdqevMCla06CHYPKbPrjyi4lfHUzezDyK4BLL6BdbKlTuGZZhrMWsp6qn24y58KDB1ltlRZDAC7TO/J9AzT7zIsBopwwo+7RCCMXQmI+ZKs9ft2sIB2WGfB6VulKpPG5xFVcimO4MtCOGHx6/UNJ9mbeOHK+YL08JTBoczC0F3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kjXLq3MNBXX+vzLt5ELss3yiaHm/5dKZxx5vRyaepqA=;
 b=cIdTYbN9Y89aVxrvO0er0eACiN1kN3jOoILLK0t78qS6UlMevY6vDJQ2oSdhrkzpDj5ujNirannNbBQClRV0E+zbaZwSGaEmFKXFn/rpgbGQbwL5DkB2fcgWg+ZseIbnqdsSTJz9iRDOy4wQOPag3JPAnS1Rkm9BWgJQ+9BUswa6fx0Zmn05AwLkoH4lCoSyI809UXmjdNG+/AzLL6gEPd3EOym9DA/yBoPyECAFfwR2fqt47LDHotPfypPAxd9FV9Gc4XXAsKh64aXjfZSxAGx3+0rgRysw3oZ6bFlDnpkNHkaCOKbv/F6oeyQbma4/SaZh9PZ2AeIyYDKiH5lhmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6967.namprd11.prod.outlook.com (2603:10b6:806:2bb::15)
 by IA1PR11MB6242.namprd11.prod.outlook.com (2603:10b6:208:3e8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 21:01:06 +0000
Received: from SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4]) by SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4%4]) with mapi id 15.20.9891.008; Wed, 13 May 2026
 21:01:06 +0000
Message-ID: <959b6684-8d56-46f0-b614-f6457af09cdb@intel.com>
Date: Wed, 13 May 2026 23:01:00 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ASoC: soc-core: add soc_rebind_card()
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
CC: <linux-sound@vger.kernel.org>, Mark Brown <broonie@kernel.org>
References: <87zf245bc3.wl-kuninori.morimoto.gx@renesas.com>
 <87y0ho5bbf.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: "Rojewski, Cezary" <cezary.rojewski@intel.com>
In-Reply-To: <87y0ho5bbf.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR07CA0134.eurprd07.prod.outlook.com
 (2603:10a6:802:16::21) To SA1PR11MB6967.namprd11.prod.outlook.com
 (2603:10b6:806:2bb::15)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6967:EE_|IA1PR11MB6242:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b399d2c-ecd7-4310-6c98-08deb132bfaf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|11063799003|4143699003|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: g/5Bg8REeQAl05xaZglOaZDJEOjKMpB4XpUCioGkbVO9sJ6ntkEF6TEUStDPjxGtu1/p4hZqZ+/CeYaXLEtyiG0y6HZl6udAQM1POLWgsvo4wLXa/NejrPBHLsDAGodEsEN4nY2VUhx+RzaT70hq1E2X3+Rbh866RbWiR+wHnfocJIGdUB+Mrn6JUuE0OcWevZxWv/yN2IA63L1ZYuXINBQKm77u3rOlSFCutF5Mg9B1y7qreZbmWnheXTCmCKmtpRkHtMFrAoarQi4M3/09wa+VRELaOZupvzSA9JfaR2IM+36LjW1zCKdI8bxXtWA358eY76kFL9U4Vc/ZbMuuDQG5sa9I7gA8RMsrFL7v0FCjXzGQ10R1SL8vFaz/9p7OTdw2X+BnL4H/noMzsN9rSOVsfiKN6tm5Ez2z2Q2BL9fMvohmcDUj8hi0BMbyG2FttDwFti8vTHuJO3lgPi3YOBZl5QnnmGxI+acnlm2DULuDtNviVQtWwJg2KKNdDz6vOzA4MxStgZZljhV68i8tz/WoRSMGv/EQUoumLy6KYI+kYtSXNtv06zMQuhfFhI/82QlW+wdIJMofPfOnHB+45OZRlQu/w43w0u1DIJaLSNmOwczDNGo/OnydoEVX9aDKUy3fekqW75CDZMg/2Pmyu3v4htehWTpAx/gbS1NM3FZa29Jm6A4Cp0OZRTrFbn0Q
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB6967.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(11063799003)(4143699003)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TTFrWFZCVTBPaUU5cVh0a252M0dZRVhvL2hBaDVOMUVzRHFZcVRrcE1TTWI1?=
 =?utf-8?B?V0V0MFNOZDlpTXFvRlpOV0oxQXhINXpLNkJYc3FYWkNzOVBkMW1wUEI0Q0dw?=
 =?utf-8?B?SVRiRE0rTGNaT3dsSVJnUTFPVDFvbHRxYUgxWFN0QlpXNmF1U1kzRXVYeVMw?=
 =?utf-8?B?eTBiQVIwczkzZUNCRHZuZnRqTDZScU1OZjVIOWpCSHhHNEJqOWZXcDRDblNx?=
 =?utf-8?B?NzNVNTB3N1diVGhYS29NSDVWMGx0UHA1R1ZTY3lyNVNpM21VNHVzSVN0YmIz?=
 =?utf-8?B?bnI1cEVpSnIvdmRYSmxaVEtEclljdlYwUDBCWE82RXk0bzF6VFYyVEhUY0dk?=
 =?utf-8?B?ekF4VDdqaUFrdjZMMVdVYUFXSWorM1hybytNai9KaXVKMm9BUlgrbkNYTkdl?=
 =?utf-8?B?TjY5VENSMUgvT015OE9FOC9iN1A1VmhONUVGWDBISDN3RWkwQitvWGQ1VCsx?=
 =?utf-8?B?bGEwLzQyNzltUm41L01hRU1LRnoyZ1pDaWVwS010T3BSL2Y2dXdTdERQTnlP?=
 =?utf-8?B?QlBJblFDZVEvaG5ta3FCVEhoY3FNeGpyalpBbFhjaXRyMG0rMUt4VzFYUHc2?=
 =?utf-8?B?SHZ5ck9iTlRBZDd6WFhpWnk4ay9ER2VhK2hLQVJ1a3JHUU9zMWpTeDVmNjFG?=
 =?utf-8?B?WTAycUExdHk0RXZjMkZ4T2Q4anh1ZlZiRVBQZStKdlMya2wrMDVpL042T0J3?=
 =?utf-8?B?TnJQcVhYbU9nSkR2ZFBaZ3lOR09ueG5IVGpqVytmL1hBUlpkT3FIU1FvMEhu?=
 =?utf-8?B?YkFrZ0JhZGE1NmJQaEVSSnR0THl5TjBLYUM1TVdyOGwvK3ZNSENiOGJHd3lT?=
 =?utf-8?B?Y3RBTzc3U1J1U0hTbHZxUyswc2pRS3Qvc2kvalpsRVg0UnQxNk05VU9PNEtr?=
 =?utf-8?B?UEhuR2FUUzZLNERETEQwRWgrZml1SVZtY1VObitzejRPb2NmTGRnd2RldGww?=
 =?utf-8?B?Q0VtempnK0k5NVBlbFZjdVhTRXQvcDhqUHZEWXdyOG1iVTRKQ2tEa1EzRHoz?=
 =?utf-8?B?ZlIxc09rcnQ0TkxNV1NjNzJxdnhHWU5saUcwbnJZN2tXRnFLWTUrWVY1SGEx?=
 =?utf-8?B?cVZ3dVBCMTJaK3hHOFNCYmsvNFdBRjFWN2QvZ3RidnhHRDdIeVpCN2hEeUxz?=
 =?utf-8?B?Nk8xbzJiV3phSWVHM2hXeEtEb1FQMEtyUUpOWkFhbnBvUHBZYnBRS002Zk5t?=
 =?utf-8?B?c0pLWU1JWnpBckpObDZpbTAwbGZFeFFCYWhZakRueVBQMkNrK1RSeTlqeW5S?=
 =?utf-8?B?MTlBeUZrdTVvSUNrWW04NXh5SW5DTDZCeEYwblF4SFRiT0Z5dlFobVlPT3E0?=
 =?utf-8?B?dmhnZWpOKyszUUZaSkJxQjlhN0pnMUI3WGlYSEI1WVFDTzN3REh0MjkrdnVT?=
 =?utf-8?B?Q2xLNktpQlI2YTF0ZTYxeUJmdVJKVXpIY2kydjRRZnlCMU4zbFNTZU9UM3pQ?=
 =?utf-8?B?UGxYaG1PcXhIbm5uWldodmxOZTM0dUhHbHRzeXFLZ29UZXNMOU1qMmdERjRV?=
 =?utf-8?B?QzNnSGtDVlh4OThuRG8yMHB5UUpuTXhVdlRaQ3BrMUx4ekZWTzhMaktEOVps?=
 =?utf-8?B?ZTlqUXdvbG1wc3MxRnFUa0pSMFRrdTZITGhSai83cncvcCt5T3QvMFZXM0ll?=
 =?utf-8?B?cElFUlZyRG54WmpQc0lZWlBMTXp5VTlOUmNKQ0lacTd1b1dxSnQxYnBpaXZK?=
 =?utf-8?B?Ly85OWRvTkdqbFh5K2VHV0YrVlVrYXpEVFZ1dnRmSkZ5elNFVms4YWp3N04w?=
 =?utf-8?B?Wm1QeFFFUjl2U28vNUg1WmRUQ09QQlhYRlBGMGJQVGFnRkxmT3QxaUhIRHVt?=
 =?utf-8?B?TmJpOEcxVFZ2VXl4bHNuOXVJWnEyY3VGWVJUbUpEa1BmZWhHQ3oyQXI0ZHJx?=
 =?utf-8?B?M0RnSTJ3aGpUbkNqcjVHb2llV0ZXWkIvR1ZoSlh0aDNUbzhRT0tzY1lndDlG?=
 =?utf-8?B?a2RDT2hjSWhxajNPTHhqOVl0a0QxTHh1Rm1BV3phQ0ZFZGc3enRubGFRQlBt?=
 =?utf-8?B?L0F1VWJIMW5wZkFQUkQxcGpYdHBtZnVQeWp3SkE5eEFsRk9WbjVyRk0vVThZ?=
 =?utf-8?B?QnNvRHNBRFQ3am9tVFo1MEkxUEE5eUMrZEN5dFlQZWpmdUhkcE53NHBWWG96?=
 =?utf-8?B?azJhaUVabHNxYzM2R0JIOUx5bTJGZktRN1gyMEI1cFNQVzIzQ2EwbnhQeitl?=
 =?utf-8?B?VllDM0tRMG5IUDdRR3JpSFFwRnB2K0F2Q3dRMllMWC91aVRUNU03QWhhWmpU?=
 =?utf-8?B?K2xOSGNzMWJmMUc2ekxzUEpuSitJRjlERlU1bURwb3J0c211akdSUlZaOHA5?=
 =?utf-8?B?aUt6b00vcjZvSVlOb0JEU1l2YlFsU1lkb3JVLzNQazlvUEhpSi9YSUlNSmM1?=
 =?utf-8?Q?Y0qN2FGb0H8/bsu4=3D?=
X-Exchange-RoutingPolicyChecked: Z3V4VnhpN24QerO6w3clOKBSaEt4Di6J39JoZJpZt5s1ByuCup+DC9j6+eF4L9k34FXz8mNNagLyfYDaE7gksLyRAe3mtAybFXW+ILZcOMU9wjJh/lbSXnfXrOw4t4uj4XrmGxXJqynve2KWqRd9ksHfZc0Tfah0FiEoQmeOc8xSrD6Nv32ivcCSXuWNUKf/uDnlTdxujsShr0XgqLWXFW4hz0Os3XQYZaOHOpeJBOGp5wAWJdjj8mL/3FbCpqJBi9L/W4XtpEDhMHphofdowXq7EOUphnrMj1hslgcKc5i6LzDs8nz2x8q1fb0pOSBBaol0OkSzwS4g5jErjreeNw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b399d2c-ecd7-4310-6c98-08deb132bfaf
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6967.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 21:01:05.8959
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wUPZFJ7mQT5Po+Y42LYRVEEWMxPMrMA0FW81qaPTvQ2n4wEl/jarp+SGFQSJhG/7+6FpEpHZtBf6/zmTlTikPFlwDW98AlrxwJKU1QVuox8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6242
X-OriginatorOrg: intel.com

On 5/13/2026 3:48 AM, Kuninori Morimoto wrote:
> snd_soc_add_component() try to rebind Card. Which can be done
> as Card function. Let's add soc_rebind_card() for it.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>   sound/soc/soc-core.c | 12 +++++++++---
>   1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
> index 691fd7fc5030d..ae8467d88978e 100644
> --- a/sound/soc/soc-core.c
> +++ b/sound/soc/soc-core.c
> @@ -2197,6 +2197,14 @@ static int call_soc_bind_card(struct snd_soc_card *card)
>   	return snd_soc_bind_card(card);
>   }
>   
> +static void soc_rebind_card(void)
> +{
> +	struct snd_soc_card *card, *c;
> +
> +	list_for_each_entry_safe(card, c, &unbind_card_list, list)
> +		call_soc_bind_card(card);
> +}
> +
>   /* probes a new socdev */
>   static int soc_probe(struct platform_device *pdev)
>   {
> @@ -2708,7 +2716,6 @@ int snd_soc_add_component(struct snd_soc_component *component,
>   			  struct snd_soc_dai_driver *dai_drv,
>   			  int num_dai)
>   {
> -	struct snd_soc_card *card, *c;
>   	int ret;
>   	int i;
>   	guard(mutex)(&client_mutex);
> @@ -2736,8 +2743,7 @@ int snd_soc_add_component(struct snd_soc_component *component,
>   	/* see for_each_component */
>   	list_add(&component->list, &component_list);
>   
> -	list_for_each_entry_safe(card, c, &unbind_card_list, list)
> -		call_soc_bind_card(card);
> +	soc_rebind_card();

The naming is off.  Clearly, we're not dealing with a card - many cards 
could be bound here.

As previous patches related to the subject removed the rebind_card() 
function, I'm not sure we want it back.  Perhaps a readable macro instead?

#define for_each_unbound_card(card, c)
	list_for_each_entry_safe(card, c, &unbind_card_list, list)

>   
>   err_cleanup:
>   	if (ret < 0)

