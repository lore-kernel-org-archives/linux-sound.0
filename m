Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE1AE18EFD4
	for <linux-sound@vger.kernel.org>; Fri,  4 Apr 2025 11:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743765924; cv=fail; b=VQyslVBpJShqTL4sPnsfhcUw+q6gnZc9DniYOZ/vdY5fbPF4K5lm7ikJbHu0b2b9QxKoeK+GNF8rUE/nWehL436gtFJ/aGrJ0cXEOHt1ElrGnWxKCIORzEgsaXq7inRcnyJdgMHuw8AKS1Mg3A4MzQ34UtZw5yYPCJWyOLSfMHo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743765924; c=relaxed/simple;
	bh=wblNbfUu0fDEFfOTQ7phQsaBbsLRtGRjkjn+Hyyoyzs=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=kTbLHgpSghgs0u+NC+2Fs10WDxZ3YdPz4yeEpH3kIVRE3p9ffk/Iymem+WEQlcZzcW4IYq/kmHy+2FF7HUzCzQNu6QrbpDTzTJNHDMpv4RdWdY2JMj2z34fzvnWs+1FLORkwgRxKNUF20UuFPfNdXXnLOiUBKzdiudTWhzxB42k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ionH6/au; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ionH6/au"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743765922; x=1775301922;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=wblNbfUu0fDEFfOTQ7phQsaBbsLRtGRjkjn+Hyyoyzs=;
  b=ionH6/audpVK/d1IeIpfxSZ54S7aqD84vfmQs4okRZmWxNZ7zxctaFxS
   9serVysvvoRb8GrpUis4M+r7paSzmJEYXi64+T/wtZQ3bBPHuwcwjfODb
   kzF2l6+6rbBv4gXs5fVKFwvEOGt2dtQri8AVZJ73wTsygqYj2O6LQ9caI
   XA0+Vr+ipg6kzpiPVZVZ/X0i2cn0XPdHUW5+b7oyxwXa+HuESoXJmA0H9
   8J0SK/8J46WpdYtzN8kd3LXLkLsee/WvP6iXnQSK0pqwBHzzzGR142jDB
   cectmLXaeiI5fs16IrHb+aI+F6XyPgPAY0/ydVCsHjKWQwTx4kIm1N03w
   Q==;
X-CSE-ConnectionGUID: HCrF7RP1QFG8mIzyzZRffw==
X-CSE-MsgGUID: BbCq1s6eTOikQndQ1HA2+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="45220034"
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; 
   d="scan'208";a="45220034"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 04:25:21 -0700
X-CSE-ConnectionGUID: JP3sK7HqQdCQ8B4EZ3y7sA==
X-CSE-MsgGUID: oMh0hk1SQ2O3Es+lg5jA+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; 
   d="scan'208";a="127813280"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 04 Apr 2025 04:25:21 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 4 Apr 2025 04:25:20 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 4 Apr 2025 04:25:20 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 4 Apr 2025 04:25:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PnyULQscefGaz4yt+H8ZEHmfBr/t+T6Vzcbj7zf77xYg/am9QpaxhwdOLIe/73mhF6R6fdf0DhDIlwTSBK9SoU5Lb2qYafosWswbzZ36td/Qhp2/+kD4r97eFxkzuc975zUogwC7Q/l2Lcz+FUu/JZIC3Fk4p89B2WLc0NosZjSmEmJNqkkESPeP3O3pMvC5cwacv2fHAkr5H27IQQJG6hfS9dh0f5WHjF8n5fc7S2EnWeXo9/2UKYrCe295DrxIo1Q2XsAftgCPiDbarmA52J9kMdQDP8zz0Fp0rUaVlsD9na9eUGuXTh/GWlu1RPDCtRP1s/m+/lPB5Exphg0IRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/RwzgDEV9IfheS6GzcWFJefwCnCmv10gNvhk0TzLnew=;
 b=J7RlArz8JCXlZjjvJxBovcd9JjsymFaTYSybibTmmLwbVNa+2tdkXO/ID7ouCjFP37WIbdymJkPHgqFs8mNcdiLgmUsBAaF0J6Fk+Qd8NuE10nOM75U7hzca23z0WlebcQT9eAJbd4SmbTHa29yxhOr89h5TeXf7dmQi3C7P7MDGrFWHczwNtxqmJyfxKfUlcuopXSrkll2vWNn0G5yPhLSfAJsN+3Zv+LLEVEYWOmNwt4U9MaHVVIb/j7Dq/mjWXVpt3pm17OzDUmYDIFiHagJrB4Uy6f6LvWB6IGajVESZQ3ePKExXfQ3ZRpu+ou6xTAjPS5hPwAayGIP7fXt4yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 PH7PR11MB7499.namprd11.prod.outlook.com (2603:10b6:510:278::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 4 Apr
 2025 11:25:18 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cd01:59f6:b0f8:c832]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cd01:59f6:b0f8:c832%4]) with mapi id 15.20.8583.041; Fri, 4 Apr 2025
 11:25:18 +0000
Message-ID: <3d40845f-e0cf-4a4e-b759-9f6b0fc7e3f8@intel.com>
Date: Fri, 4 Apr 2025 13:25:14 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] lib/string_helpers: Introduce parse_int_array()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: <broonie@kernel.org>, <tiwai@suse.com>, <perex@perex.cz>,
	<amadeuszx.slawinski@linux.intel.com>, <linux-sound@vger.kernel.org>,
	<hdegoede@redhat.com>
References: <20250404090337.3564117-1-cezary.rojewski@intel.com>
 <20250404090337.3564117-2-cezary.rojewski@intel.com>
 <Z--9IwA15IymHTiI@smile.fi.intel.com> <Z--9S6NtDEjvjlyZ@smile.fi.intel.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <Z--9S6NtDEjvjlyZ@smile.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P195CA0044.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:5a::33) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|PH7PR11MB7499:EE_
X-MS-Office365-Filtering-Correlation-Id: 58312d2d-dad0-40e7-6512-08dd736b6131
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZUZQbUZRSkU2R1RhVi9hR2RCV0x4WFVlN2JVNXBYM1B4VWZmR1IvYUZrdVF6?=
 =?utf-8?B?eVNGSm1ESWgrc3UxUVQveHI4V051aUkxK0tGU1k0eFp2VVBuMzFlTTFpVFpa?=
 =?utf-8?B?WVprQXI0c09UYm9FNUdUZkRtbjhUbjU0dzhpRHV6dmdQbGZpK1JYd1VEdXVk?=
 =?utf-8?B?YjlHeXlRN0pJTDBYekZISGx0bHgzdkxKbDZ5Q3pFMVVyRm5mTzViSlVUNzRB?=
 =?utf-8?B?a0NldFFDSXU4ZTVYTnd1ck5EbkxkdVk5ZE9DWUJTK2JRU3RBUWtYMTFYZ2ZK?=
 =?utf-8?B?djhyT3NGQ2Nuajc5MDkxU0xtWFd4V2t2R2FxTExVM1FsNU1CakQxQyt4cW9l?=
 =?utf-8?B?ZE80SXUyM2FkTjNGSnlucXJsbVdISVFibk8vWGxFWFRoUTdSUC9kNFVGQ1Y2?=
 =?utf-8?B?SGFvRVBHaDZDdFFaeVd3dS9ZNWVMdjcyMERoN2lNdUt6a0VKWWpTVWxyVWNV?=
 =?utf-8?B?S2FRWUZQWGdHdEpGU2MySDJvMEVlZTNYVXVrckhNU2FxYzEyekVhV0tYbjQ3?=
 =?utf-8?B?Mk1IV0Nyd2xzbXczUTRvZ3c0SE9sNzhBSi9SM3RpNlBwaDIzdWcwaDJmeHJ4?=
 =?utf-8?B?QThudTROWFU5eURrZ0hLRHVMUGU1ZXlqL0FueDdSaTBObnN2TUUyVkVOOHhM?=
 =?utf-8?B?UWN0eWdHWENWVTQ2QUYrSWY0NGdaR2dVaHVmelBscHFISHFGMXB5dDNaUjY3?=
 =?utf-8?B?dGczaU1RWndzR3pqc3dUTjVyRi9paUkxaXlsZmRhQnRITGI0QlRGY3hFWkVm?=
 =?utf-8?B?azl1MVdHQzNOVW5xTzNvY0FQa3lyVkE2QVNoOU1VdG5oUmpJNmgycU03ejBa?=
 =?utf-8?B?a1BoZW80b3FkMWlZSXBjM2tobkhRRFFFQ2NrL1lwWEZNb1R6S0YxaUNBSFNC?=
 =?utf-8?B?NjVaL0JDQW54cTlGK1lpUkpPLzdrdk5kS0JJbHZ1SW0wRSsyQno5Yk9FT0g1?=
 =?utf-8?B?NnB5YmNrY0R4TEpOV1dvTFFUVkxpMEVaUC8waDZMYlI0U0kvVlVlQlRhS1hj?=
 =?utf-8?B?MVVTVFlBNnprR3N2V0pNcllGRmwya0pCSXlFOXYzZU44STdISGxjeUZLdkov?=
 =?utf-8?B?bHpuZUNqajNIWmhIcXFNZ3d6OHoxemZIK2NjbXJrbnM5R25IMHQ5SnZ4ZmN3?=
 =?utf-8?B?aVVJV21HR2MwQ05VMUY1VWJHVWpndkltMWI3ekd6R2FYZmk3RGU1VUdGMDkz?=
 =?utf-8?B?bEFkQzc2WWlMOUdQMHc2T29samRseVVRYk1ENGdIYjdCQXVpcVNQb1FsUjFz?=
 =?utf-8?B?clFxL09ZdnJlZy83cWg2TkxFR1BsaElyQkIxOWNOVTE5d3J4bE9JSW1rby9C?=
 =?utf-8?B?bGU1VzlLdXJTai8xVU1DczY5b0tvRVVmRzNWSzR5ckEzK2VkZVorV1h6TEkv?=
 =?utf-8?B?T3JLWENWdzQ0aGI2VHFXa3F4N2JnRjZpSGQzdjBxREdoK2gyczYvMnJ6Rm81?=
 =?utf-8?B?L1p4VFJFVm5GQ2wrVk5nOGxkZkpvbisyeU9sZXdsM28xbk9qd1VoWTg3VVlO?=
 =?utf-8?B?MEQxVHFudGF0dDYyQUJ2MkxMSk9rZDBQVWhCT1BwSzE0bG5SdjRZaHIvZmlD?=
 =?utf-8?B?Z3A5M3o3RG0xb0VXY0gxdXJHQ2Q5ZDdGY1RCUGVGVG1aQWNRWlB0dFN3MHJO?=
 =?utf-8?B?REJuN1Z1OWRJOG13R2xWRTRnZUtsT0gzaGxWbnZzV0FaUk9ycEN1QzFEYzZ5?=
 =?utf-8?B?UmpEOEsvRWJJVVlocnpOSVhPYjljWUVmaldOOENZUnZjeHNFdkFuekdUa2dH?=
 =?utf-8?B?TlJpR2NUa1BwVzVuUEhtc1d6dWtGc2htY2VoTDJOQkxtYXE4ZHg4SUJVNjdH?=
 =?utf-8?B?STl1dGwwTXlpQTgvTTUvM0FuNzFBNU0rV01DaEZhRG5GdmEyMEdZMzQwOUg5?=
 =?utf-8?Q?RS2KWUOEAr0YL?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6375.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TXg2dGxmMzJJQzN0dmExNGlrZ0RVbXorRjFYb3hqaktUWjJTNWdCY0gvWHBw?=
 =?utf-8?B?Q3RDNlF2d1FQTG5FYVo1TnJnKzdGRnNGNHB4U0NsaFhUVnR1a0Y3b2dZMERo?=
 =?utf-8?B?MGRVNWxjaW5OMjNvc0g0cnJQZjRyK2tyNW8wc2V3aFhsb084RUl6VVMvdUhS?=
 =?utf-8?B?T2RIcndIbExLUldndzlneGUwdDdBTnZITnJ2NzVKWEhrUGZ6bGhVYUpOUDMw?=
 =?utf-8?B?bVc0YUFWVkMySG1mVUwrTjR3N2cvUm5ZMmZBbm5tTDRJRVh5dlhMUkJ0bWxM?=
 =?utf-8?B?QnFXOVdXNHo5STVib3lpeU9FV25tYlFKQ09COEEvd1JDclowSHFyOHBqY3c1?=
 =?utf-8?B?OENaRWorL3ZYU1BuU04zdGdFcHVNdWF1NnZtODNkVzVQMnJmbkJOR1ZBQkRx?=
 =?utf-8?B?cWR0RnRWekV0YS9BR2dFL1JSUTljMHZUSWVJMmhqSURRcG45aWE3UVZVaU00?=
 =?utf-8?B?RVdOWVc5K0YrUkdzYkVRZ2VhYUxZa0kzclRkeGZkZHo2bEROTW1FVFZyYUVS?=
 =?utf-8?B?WWM4NFlEYVV6WWgvYXJ0Tm9xMzZLcjRDd1o4T0R2Wjh5TytVMWNVOGdjVUdR?=
 =?utf-8?B?ZnY1VXRoMU9SRFdiTXVZRGcxaU9sMWhTcnhkelArZXdQa1VtcWZtWllYRFhU?=
 =?utf-8?B?MGhsZ1czV0lHVkVPeFIyWEVQZXgweTk0Lzc0ZnBsZkNUS0ZReitWV1h4RTBp?=
 =?utf-8?B?TmNsQXgrb1QvVVpYa0JYblAvTHkyMnQrYzFSWnZ5Z2NUMlFzOGFjYWlzOFpp?=
 =?utf-8?B?NW9wN0FJSXFidXExNldTTWVsVnJudXV6aWR2TmRrRTdxSXNob25MTHFnU0pu?=
 =?utf-8?B?emFJM3Y4OEM5bTFQQnZaSUlpQmVPNi9seDJPWnVJUjRmU2hzY2J4Y2lvR0Rq?=
 =?utf-8?B?M3h0YzBWL3p6b1V4NXhheFlJaGt0U0lLcHhMU1hKMXZGK1lmeVNWZnBVbmRB?=
 =?utf-8?B?VmdCa24zeGRtVnBpQThhenEySEVqNk53alViK2dQVlVYZHBLbXdYWnB1clYx?=
 =?utf-8?B?SDRLMmtXNXUyd2FnbUdjdWc2R1pZSkc1UTQ5cjlwNUg3WTZhZFlCOWQrZjNW?=
 =?utf-8?B?NW9rMVgvdjdyd1Q2YjdJTkRWenc5R3RmMUQ1R3RQaWZmcy9POEJCRlI0dkM0?=
 =?utf-8?B?V29ybzl5T0VRWHo4b3Y2bloyVFZzTWJSZ2xWcWJZKzhlLzZXKzhCNDN4Ync0?=
 =?utf-8?B?ZU4xWVV1aElsV0tTbUV0Ky9nQWh4b29IOFR6RkNpMXp4MHArNitIa2VPdmEr?=
 =?utf-8?B?S2RnN3ZLWEkyVmFqZlVic1ZJNldwOWVBQmE4aXFWTjY3YUJmZUljMVBjcXN3?=
 =?utf-8?B?eVhyYlhKay9ERFdDMEYzQWxVOThBZDJaY1doQklaZ3R3YzVHK2o3MmIzekdh?=
 =?utf-8?B?c1BobU4wOEkzQUcvN2kwQXJ2RTdiSTEwaUljUGNuRmZGek92SGpadjJVdWtG?=
 =?utf-8?B?Yk8xeXREdU9pYTg0K2xDNkFQdDU0clp2ajBNVU9mc1YwVkhhYjIyWjd5b0px?=
 =?utf-8?B?UlYySG4wWHRmZFJZSnl0VmcyT1MzNy9haWtuQ2paZDBWMDRwdStxaUZKbjll?=
 =?utf-8?B?aEw3QkI3WkZ1V21zc2xaRVlmVFdod1QwMG1vRTFHUVNUWURvODE3cENtME5a?=
 =?utf-8?B?b1EzWFB0RzNHdDMxb1JVcFAwUVRHK3hqbVpKRUY4akIxY01OV29iN3dYV1Zv?=
 =?utf-8?B?ZEowTkl4UjQvNGNiZ2UvQmMySDdFVTQ1N1ZUTnJqUE01SUhwdEdjcEd1U0hG?=
 =?utf-8?B?WFpRaDlrakRZekEyd0QyZlpxc3Iza0pmUjMxRi9MMHd6c0w1UDU2SS9WYnVl?=
 =?utf-8?B?elRzSzlYMi82MTBKNGdzSVpQMm1rYTBRWFFQbHhjc1lFN21JMGJuYjEzKzE1?=
 =?utf-8?B?MjhPN2NkMnM4SHYydjVXMzloYUdva3dNWDY2OTdqbVNqOUZrb1B3eURSNThB?=
 =?utf-8?B?QndURTY3YTh4bjNiN1dLM3ZodWZidVJLUHAyU2FlSWJFbkNXWG0xWncyYmdk?=
 =?utf-8?B?VDdrMlhaNkE3YldkL2U3K2ZSRkZ1ZUl6THhXV2dIOWJoczBEcmIyZUhuSDZ0?=
 =?utf-8?B?WXZZMjloZjdrbE9jZHRhdmFaQ0M1cDlhc1p3VVdLeDlsNzhMVmc2dmgrNk5B?=
 =?utf-8?B?WWF2eHdmY3o2aDRoa0xLWWozekhFcHpBSTkrY01PTnZrR1hJNjBPeDRmMkNy?=
 =?utf-8?B?V3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 58312d2d-dad0-40e7-6512-08dd736b6131
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2025 11:25:18.8076
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9Fg10Y0QzH9jSVc61yoDOpBSfCF4Xe2oM9xIuFP5GeMHbH78zvO6zyQih6Ar4BY3Lx9XbMXUTCPvsbl5eed34baoUDpjPCLBYIjXllZFubE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7499
X-OriginatorOrg: intel.com

On 2025-04-04 1:06 PM, Andy Shevchenko wrote:
> On Fri, Apr 04, 2025 at 02:06:11PM +0300, Andy Shevchenko wrote:
>> On Fri, Apr 04, 2025 at 11:03:30AM +0200, Cezary Rojewski wrote:
>>> Existing parse_inte_array_user() works with __user buffers only.
>>> Separate array parsing from __user bits so the functionality can be
>>> utilized with kernel buffers too.
>>
>> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>>
>> But do we have a user for this? I believe we don't accept code without a user.
> 
> Okay, this patch 1 out of 8... Next time Cc people at least to the cover letter
> where it will be visible.
> 

My apologies.

The idea was to add the Cc: tag so you are always pinged when something 
happens to the string_helper change while simultaneously adding 
--cc=Andy when doing git send-email for the entire series. I did forget 
about the latter :(
