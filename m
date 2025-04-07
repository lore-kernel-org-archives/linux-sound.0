Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8A677DA7F
	for <linux-sound@vger.kernel.org>; Mon,  7 Apr 2025 09:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744019183; cv=fail; b=dUKF6FE7br4EbB8iBdz357vyv6dJglHwKaguNj5ox9WmIEdGOaWQcJkIS7Zn1AeytU68RuaAiM1Ao+LJXLKidasZgRHYFa+mvG9yKy+ra4k3ja7tlNXSxbV2Q2TesfeY4q+Q5PtBGcI+CskngmXpgakfs1xNi7ctn7YSRWiIETA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744019183; c=relaxed/simple;
	bh=6UQ3jJ5dNf5TkgydhCzh8yCY8s3rEyvwppUZzU52WYg=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Lh8Ocq5FVzablIrFSfWKKm3Dge4N4PMHTX7xfQkH0HxBtdMgsbdcjUwe3tRaG6jKwzhp+hfVuCqplhYH0QYocTx6WqpIT/ugVrqu7RmDi1zhqlvtfQ6YlvUKxtKxlLIkxk4MFstbM3n+XxW6JeBgSdzIZlrdd5gzqBTMWv0Ql3A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YEEKazyg; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YEEKazyg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744019182; x=1775555182;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=6UQ3jJ5dNf5TkgydhCzh8yCY8s3rEyvwppUZzU52WYg=;
  b=YEEKazygXgyVoLeXk9n+SfuzbjqCCq/xq0Lm2tchaASX1Fb4kccOGcje
   FSX3+8F6zTWkmAx5iMj2WIvnJwWSaqnitX82+0g6x1ov/kW+Y7eMzTAtQ
   vZfOZHpoFOY4Ik7R31R4ybNLUfDS4RXh+mCPSpmxtEXGTARezRzftDTly
   hAlPHK+cWz/7+Eq02XaXYw1S7uYe7NHur5JKOIJ4L9pgnsGB14WTfHnD+
   j2dg8Hd8zWgdKi5iKRU1bzC9Ub7rcbpo5vyGW9AFym44aTidLCunVNHnw
   P5Ujb8sl7QfKgBpBHh0p1aKs0FClcKl/hDAuosUpYvFJ6kLSHuFLrvMXn
   Q==;
X-CSE-ConnectionGUID: ANLF2Z1vSX2NaWhy8ZCyjg==
X-CSE-MsgGUID: jicTrV7BSWmGJKBmsfFW6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="70767210"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="70767210"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 02:46:20 -0700
X-CSE-ConnectionGUID: geczYHH4T5qdWA8/B8TOFg==
X-CSE-MsgGUID: UKeLlKJETFKgAX99STCO2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="133112866"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 02:46:20 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Mon, 7 Apr 2025 02:46:19 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 7 Apr 2025 02:46:19 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 7 Apr 2025 02:46:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QtoAlLiogHIvO0nE9whlNzJhkznbEzRZuvOvjWa08BmTeOHMtDvnRHNrGyUNoEkOHtSklj5jLh46tmD6gMS/hNsUn0cTsfRKzD7wMqe3IzrQiXuXcUSKC3Q2nbwuVKpH2NIFaG+Q8NBidBoeqTZNFu94iNfDbH4BUCu8y40OaJfkSe7TIcZQ6ZNn5Ea98wkdUWuNJfI9tYQuo8fTjksqq/on5ygW+wb8nHXbAs8A0iLCfGkH9IH8p0NtosT4WzU7S2zHbCOeVdXTh9rVcHbERszdSfAvExEldcDiLMUv5+4UR2DtsR0bEfKtNwpWNM2opUR0+wvrBntgIDZAupsRaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vkkNBEU1PWaEjn5RHtJJ2R4blgSP1tH58JO4kVdJHQY=;
 b=q+gJPjw8zeNO2RyZntw/3VU1Pp1J/cocBsrNm8aGQ8TVUaWeds81zEQKXerlAVSgMogqCZrvvhf5Ctcs5il8P425doOYHYquytH444ZO/X0LXE6oy8HH8RruEnaCW7RDvAITzkZ2kRwTaJYDS3nmeeo9wjbbV2gSbPqO4piZPxLbvpuUrNuPjOfbEvl/wKPwjoA4TTcRD8Kuu0kks2++kKykZc/o+wYRCSr6LRa0C8RbUH9NolLGQeYmISnipGdb9oamtFAe0sK0C/MAm7GBIycxbrd0ttOtE+q0od1Zh3vSAS2bSZRsheEab1FdeuzOWN86i68iBg6j54VfjgCCBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 PH7PR11MB6772.namprd11.prod.outlook.com (2603:10b6:510:1b6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Mon, 7 Apr
 2025 09:45:47 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cd01:59f6:b0f8:c832]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cd01:59f6:b0f8:c832%6]) with mapi id 15.20.8606.033; Mon, 7 Apr 2025
 09:45:47 +0000
Message-ID: <4177c8ce-41af-4264-b4e5-550d2a6fb785@intel.com>
Date: Mon, 7 Apr 2025 11:45:43 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/12] ASoC: Intel: avs: Add support for MTL-FCL platforms
To: "Girdwood, Liam R" <liam.r.girdwood@intel.com>
CC: "hdegoede@redhat.com" <hdegoede@redhat.com>, "broonie@kernel.org"
	<broonie@kernel.org>, "perex@perex.cz" <perex@perex.cz>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"amadeuszx.slawinski@linux.intel.com" <amadeuszx.slawinski@linux.intel.com>,
	"tiwai@suse.com" <tiwai@suse.com>
References: <20250404094953.3657679-1-cezary.rojewski@intel.com>
 <ce71ea6903d05c3b5312c9f534d83478e488729e.camel@intel.com>
 <abe40ed3-49fd-49d2-bb5f-42481898ecd4@intel.com>
 <b8fa998839daa544acf868e6260fce59f863cf5d.camel@intel.com>
 <01eecf3e-36a5-430b-8e2b-ef53edbcf703@intel.com>
 <0793b635e75ddffb3ebef1bc773f90b3be16b6fb.camel@intel.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <0793b635e75ddffb3ebef1bc773f90b3be16b6fb.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR07CA0158.eurprd07.prod.outlook.com
 (2603:10a6:802:16::45) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|PH7PR11MB6772:EE_
X-MS-Office365-Filtering-Correlation-Id: 6df33521-cbf3-4b82-c6c1-08dd75b8f967
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cnRKVWprQVFNcXlFUGJEOXdWQWpYYkNJWEZJdERCb3dBSWJEYlBwWTR4WHhn?=
 =?utf-8?B?dlZVQTlLRHJZVk5iT1kzaHU0bXlMOWNMbjc4WFFFT0VVVG9TZmFjdnJFcTlv?=
 =?utf-8?B?ckpQbFE5elFIN1YyRFpEYlJaUmttZTRiZ2Y1cUNnOTllcWowcnUrMG1VbUVD?=
 =?utf-8?B?WDBCQktJRllIeDE3ZlZCcXgzRXpPZUhBaC9vc0hScitMbkNobmxMNXVFNUtq?=
 =?utf-8?B?dTRIOS9DR0xwMWcxZUpCVjlEbFRObG5PZ293aFA5ZE4rS216VlJ3SDd1My9j?=
 =?utf-8?B?c2ZvNDNHVkwrRGFRdEtDMVAzZU1ZODBHMlN3RVlsa3J5ZHlDM2R2emNucXc5?=
 =?utf-8?B?ZTlXdXhrMUE1cU5ZYlRWVTVYejI4UEU1SW54ZnhaRXh0UTlCd3NuSHh0TTVB?=
 =?utf-8?B?UmhXS1JWRlpCNWJHKzVxK01mbjd4cVR3cENGVm9HSHN3OEN4dTZHTk1Td1Z2?=
 =?utf-8?B?Kzh2cnkwT25yTVh2QXR5cThCOGxscUhpSkI0RjhOb09KekhBVW1hNmR6MGJ2?=
 =?utf-8?B?d3F0dWdUUFpwQS9mdHBiVTlWWGtkU2FYQUpsVUYxVjZodDRKeDlodS8yN1ln?=
 =?utf-8?B?R09hQW5JVTJvZnV4NERFTGdNdkc2RDYrOURQV2FaM1A2OTkwV1RUQjZNY1lS?=
 =?utf-8?B?OGFPdllSYXVMNVMvTWU1SEtHWks2KzcxSHAwOXEvMzN4VkoyY1EyenMydkVK?=
 =?utf-8?B?VXc2T3hhVVF6TXpoS2kyT1ZSdjlWVzFzNTFaRW9Tc1kydklveVZ4M0oyTVJB?=
 =?utf-8?B?RjVIeEd1aU1XOVJ4MmJqcDVjZStGQTFodG5HVnZvZ25oSnBaSmRsTWJGVEJE?=
 =?utf-8?B?NFVYRVlwQWlpMWJlZzZjOW9lZVgyMW01NGhkdU85VWhMbzFoODBLMC9HU0Vl?=
 =?utf-8?B?bkd6eGJ2TEhld2U0T09lMmpYYnVMTFgyaU4wSEJRblExSGlFa1R3UDFRdnhu?=
 =?utf-8?B?Y2NMUVdzRlJ0WVY3K2tJMk54N3o5UWxFYTNtU1JGWHZRY0t6RTNaMURiYlBr?=
 =?utf-8?B?eUdQNDRIeW5MdVd4eE4wNGV2SG9ieFZaNXptdk9BQncycTdMNlRMZzh2NDdq?=
 =?utf-8?B?Nk9FUEZxLzQ2UkhjTFlmS1JINjFHdERxdGFJNHBNMkQvS3VwdUZrdElTMUtH?=
 =?utf-8?B?ektmbmhLVTJ5a3QvNEdjNS9DOXVEZTh4Ym5oVWdDcU5wUHYyMExBQ000WFlE?=
 =?utf-8?B?YUFlL0V3bzd6TXk5ckQ3UUxoNE1NUG9QRlV3ZXVoS1lGK3d4WHNrOUxqbklV?=
 =?utf-8?B?WUZwdVhwcTkzTzUyTlNFRW55TndGNmhmc2syaGQ5QkxOVXdzYVd2empYK2Fn?=
 =?utf-8?B?TVJxV1FMZ0tra3YvSHphSVJsd2hPK2xsc2xOMnZJVTA4MGpSYXBIN3FPeE1F?=
 =?utf-8?B?dkNqbmR3WG9BNldEQ1gvZkFMV2ZUSzZJZmNoUk1ab3lrbmVLSXlmcUlRZU5Q?=
 =?utf-8?B?MS9pRVdmZmNDQWkwcmFSNmZ2TWQ4M2VrWm8vKzhuU3VzWmphL1RTL25Fa1Yr?=
 =?utf-8?B?TjlFWVpEbDZlZUxYSG1MMFF3dWxMTEN1YkFuQ1JCek9wMGpPejdiV0Z5WHJz?=
 =?utf-8?B?ajc2WEZMUTg4dkM0Zld2UGtqSDVpWENMZlJTM09LWENMa2ZqYjhteEhpL3la?=
 =?utf-8?B?cThwUk9DN2txOUNJU0cyOGFRY3o0eitEdEVENnlydHZGeEttU1VaSGFteXcx?=
 =?utf-8?B?ODBYMUpjd2xkaWJJOTZwMEF4L0R1MW8vaE5DQ2trUFcrRmE2R0twWTdWY3hE?=
 =?utf-8?B?anBoaTdyNTBoUENOTlQyb2NoUjVhOFVpaldCQmtlckQxdkRuUDJVaFJkZ0Uw?=
 =?utf-8?B?aFhjeWlLdDdPaHdoMmw2aC9FTWtBZlV2cGI1SGZSb2xKY0wxeG1wM3VPQ3NH?=
 =?utf-8?Q?W91TjID998DNb?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6375.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TkRzZFVzRGFMWFBXV3ZHRnlDWE8rbHBFQVFVT05mSEJCY2JpVG1ZcEdONFA1?=
 =?utf-8?B?ZklSZ0U3ckY1N0dOWGtJSlh1dU4rVUFNWnBsSnlEVllhUm94WnZpYXpoOElu?=
 =?utf-8?B?eEhZdWxkOFozVWlnYWx1cVliRWlWSFJhR0w3cE1YOUZlZ3lDdzdrTGsxWnRq?=
 =?utf-8?B?U2VNN05hb1lxdkdhcU1nM3E1RjM1cmRkK2UvTEwwVHNJQklRUkxtV3FPclpZ?=
 =?utf-8?B?aVZyZDRJd0pJMXNaazhLSDJnVUZnVUFSSldJdlRBaGl4THlCb1NVeDA2TjhX?=
 =?utf-8?B?Qk9qVDM2VzFPTDd4OFRwdU52MFpiOUtDa002cFBROHcvbkxOWk9GQVRZWUti?=
 =?utf-8?B?NFlPVE5vKzVQOGxSSDJyR1RSMmRJbmVHbEw3R2NsQ2lYM2xuanZiRVFBZkho?=
 =?utf-8?B?S0pVVytoWmNYQjh2VWFsR3VHaTJSMDE1Ty9lZU90M3hxMUhEMjlWTHJsdjFl?=
 =?utf-8?B?bjd3aWw0Ky9OejlYQklwVmtnTFNYUG5ZdVhZbGdwb1FmbEZaZkFXcEtmOHdR?=
 =?utf-8?B?TkZKYU1YL21uV0RlYnBLQk5mUjZEeWVWY0QreGlETU5NenhiMjFVckgyOWlQ?=
 =?utf-8?B?cFdwTE9yRVliY3NDNjNTaElyakxva01pMFBoU29SL1VPTnV5NzFsb01jMStC?=
 =?utf-8?B?NHdFZDlxSE8zVXlSanpxcVVIVGZPS2N6cWxwNm5IZkY3WFhGdVdEL21wcGRY?=
 =?utf-8?B?bzBDY3YraFZSYUhSUnZweDVEeDZXaXZDTitzRFlXSk8wMThoS1FOcUNxQUkw?=
 =?utf-8?B?enNYRTBYajlLZjY0RmZvbUVhMUlRNkdMT0FzNktKTGg5THZDdi9meE5yemNX?=
 =?utf-8?B?WGdwOTJxcjJKaGFsTHpGc1FobE1wSXFvTHJFNk52RkpJVUgzNWlKRFdvVXB5?=
 =?utf-8?B?RVk1NDJFam5TYTJTek9tNy9BK1J6UkcvTEdlUWJUSXhGajVHb2dNYUNFK21V?=
 =?utf-8?B?Q1hQOEo0c0VRa2ZZMjdNZmdzbWswYzZWWnJhQmZFcG5EWWVHVWdwczhlb0hs?=
 =?utf-8?B?OVlSaGdYSm16QzR1WVI3ZjN0OHlob3RkMllKRVNNZDFUZXFMUVRFL2U4cTZn?=
 =?utf-8?B?Vzk0NVlBUElGTDdjSHRMQkRwMVZJZ2cyWVpvZ0hNaEM2OXRUcUUrbW8wZHhs?=
 =?utf-8?B?MVNqTkY4d004RXc4WHlOVjVWeGJ5OTR6M2llYUx3K0hvV3VwbTZNQlZSV3ov?=
 =?utf-8?B?bWF4Ry9xNENEWmxxS0MwOFFpaTdXWWhVclBWVTNZMTBTMHA4QWZPeGsydG8v?=
 =?utf-8?B?Q3d6K2U3VmlodnExck1ET0Q3MmJTVkh5OWJnTnpQL1NBc0lSSjRMYjcrcDFi?=
 =?utf-8?B?TzNMQStXN2N4VlhJaStJS0h6N1dwaklqdHNRRlRwYVFES0dtMXVQcDJGOG42?=
 =?utf-8?B?Ym1La3YxMjZFU3dtNEU3UGlDTWZ1VUJrTFFLdENQemtYWXhBclB5dGN5aWFO?=
 =?utf-8?B?bUM4V1F4L21DUVo0elIzSDVXQkMyS04vUDY2ZTZidHdTQ3o4SVd1dFpROUJI?=
 =?utf-8?B?cmtka0lVdVVhR3VTbHpqd2s3U0JLNnJQUzBlT3luSHNsMGlDdDhvT2t2RXdF?=
 =?utf-8?B?VXJKYStxMjhrZDgxblJudXh4ZmdOQTExTk5UY0ZqV2xWS3RIcDBRQ2E5aGRo?=
 =?utf-8?B?TGlzcFAraTlELzBzVER1c3V0dWxOYlFXVU1DSzJ1RE1QVDU2WHlCVTVSY2tM?=
 =?utf-8?B?bzZKRUtYdnM3Q0I0ckdOMi9tV1hQRTZGZkprNm9FaG1TUUxrWkZQbThlT3c4?=
 =?utf-8?B?WVZxZ0M5eHNYSmJoOWttTm1TQzdkR0gvNXFwRkM4RE5iT2RQZW45TWlFQ1NY?=
 =?utf-8?B?eWdUQ1JpcS9OVy9CamNnbUsyZzVZOHFDc3hyeHBnakpjaGR6eEhnSFVzMVhn?=
 =?utf-8?B?ZVI0aVFwZjNiOHlrNTVHd2pWM25uS1F4TGdRemJHU2x3aUxEN1Z6UVBQU0Nj?=
 =?utf-8?B?Y29nS0JDMlhMUjBZbHN2QjRmb2lXOUNLZGkxUXQ1UEVOQW8wckVJV1g0cmF2?=
 =?utf-8?B?SjdNY0dMRU9WamV2aXJXeklBQ1pWVFJ6bVVTR3dPUG15NkIzM0VscUZSMmps?=
 =?utf-8?B?MWVWaHpwQWQ4U1dQbEQ5NjQ5blZWQjlONnpwQmpzWGk4SWcrMHZGS0dqUis3?=
 =?utf-8?B?b1AzSmx0MzAzaEl5V0FPdEpWOWNUK3p4RTcrR25ZaUF2bHh6T3ZLOTFlOVNr?=
 =?utf-8?B?M3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6df33521-cbf3-4b82-c6c1-08dd75b8f967
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 09:45:47.6368
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W7+qxPsHPj297HLNJIRBfOvtecs8wSnLowjBkV0n2aYVjxXjUMI6sYmNcaCzeY1qXwr4Fnq21V8V4Gjv25hpxraPMwEA3rxjaNsi9J5+1T0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6772
X-OriginatorOrg: intel.com

On 2025-04-07 11:36 AM, Girdwood, Liam R wrote:
> On Mon, 2025-04-07 at 10:04 +0200, Cezary Rojewski wrote:

>>>> FCL is a PTL-A, PTL-based platform. The driver is officially
>>>> supported
>>>> on the ACE architecture with clients utilizing it on
>>>> distributions
>>>> such
>>>> as Android and Yocto. As software needs little to no changes to
>>>> cover
>>>> PTL alone it is preferable to have clear division: ace1.0 <-
>>>> ace2.0
>>>> <-
>>>> ace3.0. The code is maintainable and readable this way.
>>>
>>> No argument with FCL or any non client devices.
>>
>> I see. So we're talking about pci_ids and their attached descriptors,
>> and _not_ removing the functional code that enables avs-driver on ACE
>> architecture?
> 
> Yes, lets not cause any confusion with duplicated IDs or product names
> across different drivers. Not removing any AVS code :)


Ack.

>>
>> The filenames/prefixes shall remain as-is given the driver's design -
>> platform that starts given arch, becomes its namesake.
>>
> 
> No issue if you want to rename any IP code filename to e.g. ACE2
> instead of LNL as this makes it obvious for anyone reading the code and
> you can add my  Ack to that if wanted.

I opted out of cavs15, cavs25, avs10 (just few examples but I bet the 
idea is visible) long time ago due to Pierre's feedback. Suggestion was: 
it is easier for the non-Intel people to understand the "architecture" 
concept for Intel AudioDSP if it's tied to platform name. As all the 
files within the avs/ folder follow that scheme now, I'm not keen going 
against that pattern now.

I can 3 commits adding mtl.c, lnl.c and ptl.c into a single commit, drop 
the pci_ids and their contexts so it aligns with your comment about 
leaving out the confusion. Does that suffice?

Kind regards,
Czarek
