Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE06827A92D
	for <linux-sound@vger.kernel.org>; Fri, 26 Jun 2026 08:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782462763; cv=fail; b=A5ezMUuiRv5cju1pNHu8NpwU2yczCkjQ1LRb/72kBU2YCjIbq1F+3xVVimhfkEVepu3smyaszIa1A+nXHfcuijhiwkH+0eSgIb1NJf6oOTNmrR2BXIk6KmTRQ3lmmuOFTfnEDqqZJIiANhP/IJUXders+k6nNNorsAeCctnL9wk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782462763; c=relaxed/simple;
	bh=d/KNntz/sBTpIiM/qE/Yrnc5UJ/9rLOQD6eo8LAbOxk=;
	h=Message-ID:Date:Subject:To:References:CC:From:In-Reply-To:
	 Content-Type:MIME-Version; b=MVCCVhc0xzkbGVWdF4R4YoZrM4R02Oa+PAHinmNNiuANRDw/Lfp59+rZL4cI1Vzk35ZZKqoLjjqFucti2hLXx1K7xYvqQ5nSiKnqsnRzl9ezinipUfG4z8h/fBT8g3voUGO86kB6ZFzB4DKe0wClP0af4TP5fuhKPemRpP0SfKs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d81gpgZv; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d81gpgZv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782462761; x=1813998761;
  h=message-id:date:subject:to:references:cc:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=d/KNntz/sBTpIiM/qE/Yrnc5UJ/9rLOQD6eo8LAbOxk=;
  b=d81gpgZvRqzorcx8FGLqCon23RL6jK72pjdzt6rkjpGT7RVP6pwXEPn4
   rxeX13VrlnmyxatwdjWl4UOJ85KWUQJOjrfKS49WlUAgeFTwOR+y69Pqk
   MfVnXFOHNYRVl9FnkJ87GumWrrDvpfByB/Kbn/MKiq65uwhfaMytY46kB
   9Yy2KC0lywZUJkYlpflIwCcjVBvYU0iV7P9UU9o6Bw46nK39HVWHTtVSl
   ieN9M4bksdxC6xp/Nr5sfb9aH4B8kUl1ky/oUqN2PtpYINO8FlVDIxToD
   YCWyoiOOiUvl78DA1xYf3T8FrXnQnPpBEeZz1ITDc/1uQ0OD1cX//2dZo
   w==;
X-CSE-ConnectionGUID: u3N17JlcQa6z2KlfVBu75w==
X-CSE-MsgGUID: 77XeWQJKSiqd5rDQCxh2uQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11828"; a="83134851"
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; 
   d="scan'208";a="83134851"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2026 01:32:40 -0700
X-CSE-ConnectionGUID: sBRhfrajRDS83lvdlRLfGQ==
X-CSE-MsgGUID: 8eIKbgy7T4OJJVI8CXMeGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; 
   d="scan'208";a="253189125"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2026 01:32:40 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 26 Jun 2026 01:32:39 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 26 Jun 2026 01:32:39 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.70) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 26 Jun 2026 01:32:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SzTpVnzxLNMP6jERY3jBAyaejF7ABZaV3IB7RDug9RMD3Z1j8BiIMkEAfWgCTg6MRY5Wi8BVOcA8gh36BDbNj4ZItJPlSUP6ajOsLIyTXcqpZM+6/8G6N/4fmuDaC5+gYOV8QZEikKfcZSw//Wfi7DFW5K/P/TbscuY4sn9aLu2LkEXgiqNNih1/H39eoBECnmXcPJyR+BPQYW0IuK70/hrurogC4xb1rkY6WkoE6QhJviEHcN+q6wCYxTF/7K/slhAoH87nn84QNYCIArUY7HFZJg/2siCreH2+6NwH1tMqyaupj0nE5Cn/uGGZD/pFjYis1tgma4gn2o2MDPkaEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TJs8uCtXZ3uACzjKd8VjLVALjCTCsaqNcartshZ0GVw=;
 b=cOjSREAlENfto86cetyGCrC/CWYg/WcPbxBCBOa2a6JyIjL1+3n2cQCFNX3zTWnkVdx1+dXq4UHsUO0TQ1IkGYbcSrNVjfAbupbdcngXW3VUx3bch/GKO6PuImZuqnTnpE9WNPa5TthBsfnLNm6loGWcM2kNYj1C5NUxnUM3iQ5FJHWxQCmANBML9RLslBW8MzBA6uU/NHGtP6GwkjNi1wlyw9/FcOJKAUmIQgb+P16uzRaGq4Vm7cwnra5aezcuRqFS8bPee648tFGJCDzhgT4UgkObevb52yP9fF9kJkr+/NSwbkuEuRV5540UB+EHZbBCUZvWWF3S7Mdkf5QQXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6967.namprd11.prod.outlook.com (2603:10b6:806:2bb::15)
 by DM4PR11MB6432.namprd11.prod.outlook.com (2603:10b6:8:ba::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.17; Fri, 26 Jun 2026 08:32:33 +0000
Received: from SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4]) by SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4%3]) with mapi id 15.21.0159.015; Fri, 26 Jun 2026
 08:32:33 +0000
Message-ID: <9045a819-950d-4598-b99b-fd7217de6e00@intel.com>
Date: Fri, 26 Jun 2026 10:32:27 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] ASoC: sdw_utils: tidyup
 asoc_sdw_parse_sdw_endpoints()
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: <87ldc1etyp.wl-kuninori.morimoto.gx@renesas.com>
 <87ik75etxw.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
CC: Bard Liao <yung-chuan.liao@linux.intel.com>, Jaroslav Kysela
	<perex@perex.cz>, Kai Vehmanen <kai.vehmanen@linux.intel.com>, Liam Girdwood
	<lgirdwood@gmail.com>, <linux-sound@vger.kernel.org>, Mark Brown
	<broonie@kernel.org>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Takashi Iwai
	<tiwai@suse.com>, Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <87ik75etxw.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0102CA0024.eurprd01.prod.exchangelabs.com
 (2603:10a6:802::37) To SA1PR11MB6967.namprd11.prod.outlook.com
 (2603:10b6:806:2bb::15)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6967:EE_|DM4PR11MB6432:EE_
X-MS-Office365-Filtering-Correlation-Id: ed4a74b7-2726-42b5-126f-08ded35d7800
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|23010399003|1800799024|4143699003|56012099006|11063799006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: xUqU/acjoE2z9xNn0RKCFMpkyN+vdSBccBMTCUCRq4NvaC6jVUgd+72/Sd88jJz+qSuFCLY4a3UKVcue5SRA5tPUlwbcnOyEGE4Apx0sbAzZP0xlk3eFPrV7sKdT4DkcXL2U4gvJwLAkHft9bMhKs/6mTzoX1muiTYpNM+ANh4PZLKzaMVp+c6y3anOkJgvEzWCi2KYhqaSrvKIXPiSrcpDn0jLXKEBsEDokznhWvHiJRsbLERIsHcIzRCpduG4KQlukMlxOG5t3BoefRWEk++Pvqad22ZwhH9hzWYXO46+4eSavgn+uqR8UASrwn16VP6Ksh8jc/5bhqJ9hC/C1T1cZ4mdWyT/8LVCi1rclMq/tSxVsX4udlT9gSkJ8KcFHQ6Q4wHh3yFBnPNzmp/vzT2p7HtcGS7D26ciX0wUEZ4ZXMMj/BVXvMFN/CEqA4ubEZlkq3qjN078/jKA5B6Q62X8o9jseXdONrZyr18iKhhXkxOUEFjaT6xnIInbibeBl838gBhWppjCAW8PEwahzNt2EpNHJf/I5dUvJZMKrovTnlbVLXpA2mvwVFt7s8ggHeNaPPNhAckhEsHn3w1itzJaEoPqWQ/pL1C8RvQfOndzR9xzqL53yGvHfPt9vfBG9B/a/pL9S6xlyklunMGHHtWOHhq4XrPMCBi+/asQCGxo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB6967.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(23010399003)(1800799024)(4143699003)(56012099006)(11063799006)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K1R6eG5ZdllnMGtoRC9YSWF2UUpJcVZyanJybFFGK0NYL2wwOHpyRWE1eFhY?=
 =?utf-8?B?cXRDdTM2K3dzYVN1bk5Gdnl3MHlYV25wV0JqT2taZ1g4ZFlmd0ZYM1hIMVBW?=
 =?utf-8?B?YVVoam1EUHREaFd3dDF6aGFmTEZLcFpLSEtiTVVjVXN6NE10WVVyQkFjMmpk?=
 =?utf-8?B?anQxYkdwSmo4WkVHNThGY3gzalZFTXdHcWhOc3Nwbm5tVzArcDhBayt6RWRy?=
 =?utf-8?B?UVltMFRxZmhyeGpZSllDVmhSelZsbklsZWV5ZndhRlcxclF6aDdQNUdXUGhr?=
 =?utf-8?B?REM4WHpqellqVVU2OTdQVThnNmYvYkhuajNwWjRZTzJqeGRRTGV6MFV3MTFB?=
 =?utf-8?B?MnhWUXJ0Q0tIaWFHMVZEdmx3ejU3ODErdHBmMEwxVGhiaWtqVlVhM0s5bmgw?=
 =?utf-8?B?WVNrbktVdW9rb0VzL0ppTTFWTUE1OENJTkNPQ2xTS2tzRHdjVXFqb0ZmREhZ?=
 =?utf-8?B?eENLYWoyK2E1QnVUei9ITEEwYkNrK2lQUlByU0l4R0VScTJqUmhUOUtiKzI4?=
 =?utf-8?B?UHhsVnNzWXVndzV0M3d6b1YxSWhvUkMzSWJRSVFNeUYzc005ajZpQy9lSjUv?=
 =?utf-8?B?ZWt4Y3Z1NTFOU1p2cTM3eWVoeVdqUzh5cVpJdmFOUWJyS3UyQTdkczNmbVds?=
 =?utf-8?B?UlowRTFVbXhHQmNNMEdyV0JqcVhvT3ZISzdTS09Bb1d6VFBwUEgrWGYzelNU?=
 =?utf-8?B?YXhaUm5pZ2RNMmpiNXJrTmZpS1RTbnZEUTlQNFk4S0ZFZnhYYTFIcWt6NUtT?=
 =?utf-8?B?NFVPN0JUZy9TUEJqTmFMbFNCQkFUSDN5dHpWYmw2Q0RQbE1yYUdIYkxKaEtN?=
 =?utf-8?B?M25wU0lvSm9iTWNDVTdYeld5OG9FMHBCNDNYbS9RSWZRc2pTMzJwWEVLOFUv?=
 =?utf-8?B?aHRuOCtNZjF5NFhtVnhBYVFBdWhFSlo4bFFsVVQyTVdUNEVsSjRjMTM2eVIw?=
 =?utf-8?B?WUIvWW9KR2F3dUoxREpRV1VyK1Z4QW9SQWl2UUFDUDEzSXN0T1hXdnJPVlQw?=
 =?utf-8?B?b09nN2FkZUpXdmxGbUNtbjQ2VFBMcVlLSlVGV0dyNUcybVVQT1k3cTRIMy95?=
 =?utf-8?B?TWVWMU5sbCtVcjkwMi9Ec3BKVERqOGFaWlliWDVzbUlOT0JTZmc0WVhYcE9r?=
 =?utf-8?B?bTZUU3hzL2ZTNUxhOFJLOG9CcHkxTXRvVk9jM3ZPd2FUeHZjc21rd2dNSjVR?=
 =?utf-8?B?MS9lQTc2RU5ZNDNOMUZzbXRpVHFmYTg5Zm15K2VZMGM2Ylh0UDNoVnZBTWxo?=
 =?utf-8?B?WkIyMlBCbHlsRHhSaEJNNFpRc0NKRVFvSXdibGNKdmVMYm5WZW0xWURHeHh3?=
 =?utf-8?B?YWJRbU91UktpWEJDM0ZxUWk5SlBReWFsSmlwaFZMT3FDKzVsdHU4Q0dNbTNz?=
 =?utf-8?B?N2tuUEJWTEhHQWxOMXlKdUUzZXUwNU92UzlLUEJMbWpEeHhVbHhSVnVKYkRX?=
 =?utf-8?B?azVoai9SUzN6Nk1MVVd0Z0tUYnY1NXpmd3l5MXVnNlBsKzRoekF2VWhHVzNL?=
 =?utf-8?B?MzV3NnoyZWRrNHZEbkRpWkJPZVBBaW1Ta1ZDLzBKZnExcFhCa2FLQWlYZjEv?=
 =?utf-8?B?Umd6UE0vMXJRY1BqMlhIWUIxMnl6NDBCZitFM3ZDUGNFWGlhV2Y5Q2pTVC9t?=
 =?utf-8?B?dzkvTThxMFdpQ0hsUUszTTVEZnZ5N2xxU2tSWUhtR04vTkVBTjZBMEo3ZENM?=
 =?utf-8?B?TGhkWnFjWmxsN2hXNVZSdm10RDZYWWVXVStucXlBb25JSjVYRWs3RWgxOVhD?=
 =?utf-8?B?b3cyaGhnbU9NMjBQTEkwQ0NBdW9wYmJFQ0M0YkpyMExvOGhnMWFPc0wxaWZJ?=
 =?utf-8?B?bTBIR3hKb0VTVzNoYkNRUjVMQnA0L2g3L3dLeTh1bkFzQWgydjJac3RWbjVB?=
 =?utf-8?B?VUE4REpmNXdjb21mL0hvUkFEOVJsenA0SW9hdlRDQjF0NWp2dGFkdTAyTGpl?=
 =?utf-8?B?WXFKNzEreThnMGliWURZQ2VIeTZua09ZdVdicXBaNWgxWi9PMVE0cVVjdlQz?=
 =?utf-8?B?Z1UraDU1SVlzbXdnb1hLeUplZGozMTdqK2tldldVODFrTFJWRDlzdC9GVVVT?=
 =?utf-8?B?elV2MllpQkhiL3pianA0RmhOVmRjcWJuM1kvcWc0NzR1WXpzNy9pSjd2REFG?=
 =?utf-8?B?V0w5aUFsTXR6dDdRcVRXeUY2SzdtRHBLQ2h4ayswOXdMaXV4cWxGVmdRTEhr?=
 =?utf-8?B?LzZWYWs4bmtnR0NBYWY0WXNWNVhIMlZXRExGeGpDOUNybEE5KzVNRTdWV0dp?=
 =?utf-8?B?NTJ2dS9uOXNkMisrSDdGVmtCKzdHc2xqRFp3cjhKT2hCV2xSTmQxeHpER3VT?=
 =?utf-8?B?ZjBZcWFOUnhYeGJkaUpHT1A5QjZHUzJJZEZCb0JOVlJLdU5PUjRMWHkvOFFr?=
 =?utf-8?Q?R/QTgaswN9rHoS/o=3D?=
X-Exchange-RoutingPolicyChecked: T/k7Sjx3SmlXzwoVoSSQCTYE4QJJCC+qacpVNURySiN80UQtTP64qk/qzrzGNDJDYopn1vRIAoDC9od6t3IpQADj+aqwE5HV3A7D2vuBD74+AdFAAmcs+oZi8lyO02g9fTYJtyghMPoHUa3WWGOSGgYoo6JnjKH8rSXwfT0RV/Dn0AdBCRk5Gsdr/LHZyF81hKAYFjDPX69u5zK6dy+i2L+PL5N7X0e1aoifzVGV05W+majC174couYsN4Zuvyc+wNV9NNPET0VeFkKGAb6Yt75kLslkEEE4rO/RW7RYiq+YigoP2YA1Ipew9uvF7/N6UBzHPS3BB+YsCNGAfNMW6Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: ed4a74b7-2726-42b5-126f-08ded35d7800
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6967.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 08:32:33.2955
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UVbb5bFKGLmWigJ3gSwgBTMBpFT9WYWHn53bxizGnyQjECwG0KSMfNKJgbTQnNvm9xOrHfhujgl/8LtwL8wAKZs6IKtfS/gFoDD35qc4otI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6432
X-OriginatorOrg: intel.com

On 6/26/2026 7:45 AM, Kuninori Morimoto wrote:
> We can avoid to use *card. Tidyup it.
> 
> Current code makes old style / new style conversion difficult.
> To make future conversions easier to understand, this patch clean up the
> code a little. but no functional change.
LGTM

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>

Sidenote: Thanks to this review I realised that type: 'struct 
asoc_sdw_mc_private' holds both card and jack as.. fields.  The design 
seems off, the private context should never encompass the card.

Meh, now I'm not gonna unsee this for weeks.

> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>   include/sound/soc_sdw_utils.h           | 3 ++-
>   sound/soc/amd/acp/acp-sdw-legacy-mach.c | 2 +-
>   sound/soc/amd/acp/acp-sdw-sof-mach.c    | 2 +-
>   sound/soc/intel/boards/sof_sdw.c        | 2 +-
>   sound/soc/sdw_utils/soc_sdw_utils.c     | 5 ++---
>   5 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/include/sound/soc_sdw_utils.h b/include/sound/soc_sdw_utils.h
> index 443d63dc6ea37..9b28e9aef4f1d 100644
> --- a/include/sound/soc_sdw_utils.h
> +++ b/include/sound/soc_sdw_utils.h
> @@ -182,7 +182,8 @@ struct asoc_sdw_dailink *asoc_sdw_find_dailink(struct asoc_sdw_dailink *dailinks
>   					       const struct snd_soc_acpi_endpoint *new);
>   int asoc_sdw_get_dai_type(u32 type);
>   
> -int asoc_sdw_parse_sdw_endpoints(struct snd_soc_card *card,
> +int asoc_sdw_parse_sdw_endpoints(struct device *dev,
> +				 struct asoc_sdw_mc_private *ctx,
>   				 struct snd_soc_aux_dev *soc_aux,
>   				 struct asoc_sdw_dailink *soc_dais,
>   				 struct asoc_sdw_endpoint *soc_ends,
> diff --git a/sound/soc/amd/acp/acp-sdw-legacy-mach.c b/sound/soc/amd/acp/acp-sdw-legacy-mach.c
> index e8b6819cc4b45..9726a9d33ec6e 100644
> --- a/sound/soc/amd/acp/acp-sdw-legacy-mach.c
> +++ b/sound/soc/amd/acp/acp-sdw-legacy-mach.c
> @@ -432,7 +432,7 @@ static int soc_card_dai_links_create(struct snd_soc_card *card)
>   	if (!soc_aux)
>   		return -ENOMEM;
>   
> -	ret = asoc_sdw_parse_sdw_endpoints(card, soc_aux, soc_dais, soc_ends, &num_confs);
> +	ret = asoc_sdw_parse_sdw_endpoints(dev, ctx, soc_aux, soc_dais, soc_ends, &num_confs);
>   	if (ret < 0)
>   		return ret;
>   
> diff --git a/sound/soc/amd/acp/acp-sdw-sof-mach.c b/sound/soc/amd/acp/acp-sdw-sof-mach.c
> index a423853f3a97d..963ce6fd40122 100644
> --- a/sound/soc/amd/acp/acp-sdw-sof-mach.c
> +++ b/sound/soc/amd/acp/acp-sdw-sof-mach.c
> @@ -303,7 +303,7 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
>   	if (!sof_aux)
>   		return -ENOMEM;
>   
> -	ret = asoc_sdw_parse_sdw_endpoints(card, sof_aux, sof_dais, sof_ends, &num_devs);
> +	ret = asoc_sdw_parse_sdw_endpoints(dev, ctx, sof_aux, sof_dais, sof_ends, &num_devs);
>   	if (ret < 0)
>   		return ret;
>   
> diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
> index d43daf9b025df..24226a387cc2a 100644
> --- a/sound/soc/intel/boards/sof_sdw.c
> +++ b/sound/soc/intel/boards/sof_sdw.c
> @@ -1285,7 +1285,7 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
>   		goto err_dai;
>   	}
>   
> -	ret = asoc_sdw_parse_sdw_endpoints(card, sof_aux, sof_dais, sof_ends, &num_confs);
> +	ret = asoc_sdw_parse_sdw_endpoints(dev, ctx, sof_aux, sof_dais, sof_ends, &num_confs);
>   	if (ret < 0)
>   		goto err_end;
>   
> diff --git a/sound/soc/sdw_utils/soc_sdw_utils.c b/sound/soc/sdw_utils/soc_sdw_utils.c
> index 073f3f9205a73..dd2cc57059d6a 100644
> --- a/sound/soc/sdw_utils/soc_sdw_utils.c
> +++ b/sound/soc/sdw_utils/soc_sdw_utils.c
> @@ -1976,14 +1976,13 @@ static int is_sdca_endpoint_present(struct device *dev,
>   	return ret;
>   }
>   
> -int asoc_sdw_parse_sdw_endpoints(struct snd_soc_card *card,
> +int asoc_sdw_parse_sdw_endpoints(struct device *dev,
> +				 struct asoc_sdw_mc_private *ctx,
>   				 struct snd_soc_aux_dev *soc_aux,
>   				 struct asoc_sdw_dailink *soc_dais,
>   				 struct asoc_sdw_endpoint *soc_ends,
>   				 int *num_devs)
>   {
> -	struct device *dev = card->dev;
> -	struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
>   	struct snd_soc_acpi_mach *mach = dev_get_platdata(dev);
>   	struct snd_soc_acpi_mach_params *mach_params = &mach->mach_params;
>   	const struct snd_soc_acpi_link_adr *adr_link;

