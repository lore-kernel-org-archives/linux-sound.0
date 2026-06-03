Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 479F0403EB0
	for <linux-sound@vger.kernel.org>; Wed,  3 Jun 2026 08:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780474930; cv=fail; b=JqKahi0KpJYLWrRikdBOzB0qM5Q5eXfGIQ1D+WX5gO+5e3AmvfnGwbqZzCFY2FQ0KOKnHC5IngR8iXYkyypUYznQRQ1lIACGpYUMz324JhoEUbtCR1V5N/GAimARKEnw9wwq+CTJUPrz3UUspGWLjrMzhtQ8IRuUDyn2nXYk25w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780474930; c=relaxed/simple;
	bh=8Hyze73Rkw8UuLGm4k0mQj7xuqxfG1E8QrxdmxXPTaQ=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=AUasn99mTzx42X95bjtrxB4sVsu2CKT9vXUeVvh7sBaL4JlbTrTynW+nuDgCX+VuPA3hXBUKaPZsN6pA+3oAA6LhcIHMxT8me0tUiAI+TVGNZrZzhvNgppDdGVKEs/iPB5NMuP+4IXCgARD+92STFDzC5UpsyV1ZNsOUumt0UfM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HyMyGjSc; arc=fail smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HyMyGjSc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780474929; x=1812010929;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=8Hyze73Rkw8UuLGm4k0mQj7xuqxfG1E8QrxdmxXPTaQ=;
  b=HyMyGjScWdWQPRmIbiH7YBH/JUG7+M5W3mw1EtyqSKwTjCORrKxorOtx
   YkdwQXsFyjghXo6YAb1QgwGBH74TjJG4vP2oA23ol1ujY+90hIMvy51IR
   BM6HG8pd6KKSzqjSkgC6eq4EW4l4dk36feqf+uZARuIvXKEj/2T9gQLwb
   z2NbNOByg5EnqZ8o2HG6l3GBOJ0oyIQacVCNFAmojitKynogNsNqKyzmA
   ZHdfFoGNAwvhY5oIe9yEeaFA+LPmcm1q9vkYWbEg6vOI3cb3dKZ+y/cKB
   icne4GYRrRwkkmO/F3eehIRa6mluYciEae8xJBSlqEPSbHOr7cSERwxDd
   g==;
X-CSE-ConnectionGUID: PyU2nYjwQbOtKj/uDUsYYg==
X-CSE-MsgGUID: yD5/BXOQQu6YIHw0V/5a/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="81305794"
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="81305794"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 01:22:08 -0700
X-CSE-ConnectionGUID: 4llE1FXzSueBXVysz6ov2g==
X-CSE-MsgGUID: RP1O245zRZy4BK7dLZ4ADg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="239989789"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 01:22:08 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 3 Jun 2026 01:22:08 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 3 Jun 2026 01:22:08 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.50) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 3 Jun 2026 01:22:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BUwNnG2GXLJ6bza4eyEWzGFJ2Gx7SbbbPj/uU85W14xMLwx9EHsZ8J3VhjkkGz20Gmy8v6byk6YV/VzqVPvD+ai8tquEh0SIPuSGrhqyt+39LuP3LJFCNrKgbDcfOYEf/CtvMZAdR0kM1J+aiym4qxTjHwdvYobgPiqUJEfD9gKJO6ysl14JBPcikL7BXIZR5I+ghIWDc3I9XctyDzR5lkpJg1u3FZg4jEG6Ncl/5eTL6VMRvmGCEE/QQfhB83VDZXKPEQqPaSdV9IeM64XsMXm4zBLR+mi5N5YvI+EmgnB4zMxDMn6moV7Eh3412IvG7CMfHqS0Qj0pA0RwO25sHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WZwuhwyMIzgEgAbc+l45HMoow+NtwZ/ppXPc70OfEYw=;
 b=FjyZ/iUbhqz1UiMdV6xyXzbCFtJ5WZ1x3LyiVtWJFPOsSDsoAyfbDLCHZFIpOlqtFVqP7Tq0+5yRpGoukcw7h9HsNrla8GAlUcr5qM76kEtzK36PecSrYvRQ/KOprnzxF/xyEGGxe7BG6p2ApPn5j5it1P8K4xTAEPRFzrlDhZLnejGN1keA0yuUygZPWGDC1XBZ0aFZO2Au8OHfgIMR6bZYCxmrRP5IvXA2vkTLieTC/eTEIJ+kSjYGmSoaLj/yKNAJbFpnIPbqf9cEtiH/bc/rCQet/np3kEHPWDxunzwPWi6bkk6OKENRMvCIh3nWPMA9KgKpIFDqQqHu0Lqi3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6967.namprd11.prod.outlook.com (2603:10b6:806:2bb::15)
 by DM3PPF96964A2A1.namprd11.prod.outlook.com (2603:10b6:f:fc00::f3b) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 08:22:06 +0000
Received: from SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4]) by SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4%4]) with mapi id 15.21.0071.015; Wed, 3 Jun 2026
 08:22:06 +0000
Message-ID: <7dcbfb06-2212-40d8-9e6a-c03635be01e8@intel.com>
Date: Wed, 3 Jun 2026 10:22:02 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] ASoC: Intel: catpt: Simplify catpt_stream_find()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: <broonie@kernel.org>, <tiwai@suse.com>, <perex@perex.cz>,
	<amade@asmblr.net>, <linux-sound@vger.kernel.org>
References: <20260602081350.1752773-1-cezary.rojewski@intel.com>
 <20260602081350.1752773-5-cezary.rojewski@intel.com>
 <ah-AeU24nP-nMK4o@ashevche-desk.local>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <ah-AeU24nP-nMK4o@ashevche-desk.local>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2PEPF000008A5.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d8::64a) To SA1PR11MB6967.namprd11.prod.outlook.com
 (2603:10b6:806:2bb::15)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6967:EE_|DM3PPF96964A2A1:EE_
X-MS-Office365-Filtering-Correlation-Id: 72d23064-1003-47a8-8378-08dec1493276
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|18002099003|22082099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: V9cwcay/hFBs3aUA9TzxfcvbQUHiWI6l4UlWM2Mj0xfmjrK7yeHWuaddHT5SW+eBBOE8qS4oLehHdCCFZncBJUpMp7jGnKd1H8jfFW/X0XaoVaXA1yz9dj1wKqijkSON2tTcQ5rx0NrNdp0wCNILLyx5HXxCsUaRgK25abHg7btoVSrmspq4ia426tVpG96IZfI6jnrDgJZcutSOR2gKsJ1nL2p6cuyPBHwJxIXmoPWv+GgFj8BaoOTKKhQMQ/1VpAXB4TkDhnpbKXz9EtW3j/oIN0aK8ME59O0Xm1WuKCYTsHBLlKYEEjIT9fxCdfyGXlGFsmxV2KhiVPZIWcDDiJm+PKN1USa/ietZuxEVP/cNmbQc9lZMOoOGNC92FkK7SF0iDCyel/JQQ3isw853Qd0tw7Besv49bfP53CQx5lCCqrC+mgDKquxk2LQ23zL64Yc1BJeJ+5oTOvwIIcURYN0xaNxT1dxX6HVnTvO7B5vwojO8eXxVKDiXa5ojN5R3ROFT1fzF3HzJEefGJKWmK6CGDyMcd4QZN5mkZB1DZPvDITchN5ts9LkAuwXUnPOKGSgNZ/GndMvWcs+My+inz/+O3snGWTx/IAapTW8SbQigJFPW2APDbmqHHN5b32XvtIRW9pTWSGrxsHWtiUnQXY5eY++7FxvBiqFUTR8SwNLLbWbJHLsWNoghgSI990tU
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB6967.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Yko2aFZZcldUcTFMYzBXUWh4UVpHdUx4NG9PU20rbUp1dmVhZTYyM09rdkRy?=
 =?utf-8?B?bmNLUXlCNFgxTDJDdDVZOUtYQ3ZnUEVxYVNmL01rSXhQaENnM1RIRkEzSU54?=
 =?utf-8?B?cjFZUUVjMDdmbTlFRG1Ta2pqbFdHL3hUSFVobWxrSFdXSktUZXN4VXRHTEI1?=
 =?utf-8?B?NTBpcFZDNEg3NEpaNzVlRkl0RnArdGl5dE1kWDRxTGxaT2UrejgyNTBYc0pD?=
 =?utf-8?B?T2g5UkE0SG4wMXNmdFAxTm1WamROS3FwZkxvK1lQQkMyZUVXajl1WGFoa3ky?=
 =?utf-8?B?QVhiM1dkMjBpZGtRTXpUR0tqNkhUV3VGM2VwbFBYQlN6dnZEZXVNcU5SMHFH?=
 =?utf-8?B?d09paGtuVTdncVhNaUV3a24vUVFYWTd2OGxtYW5iM1gzU1hQNG9YTWFVakM3?=
 =?utf-8?B?Y1o4QlpMUjFSbUNrL0RDUUM1QnNrOHVKSXI5VWVrek93MUpicmI3QkdGZHNP?=
 =?utf-8?B?WUk4UDZZUzI1My9xZFBWS1d6UUpiWkdmeEhSR0xmVFE1NGtuVzR5OUt2UWNn?=
 =?utf-8?B?VkNBVmhvMjFuc3Rkc2hXMmV1Y0owdjBqWmhGOC9sSWVBM3lzZXNXaGdFcVdN?=
 =?utf-8?B?NTBZbG1nVm0zYlFJL3hmZU9OUCttZ21mblYxK2hiS0p0TkF2T2NNNEdwbGhH?=
 =?utf-8?B?Myt4QUdrRUpCT0R1NkJZZFhsNWRQTlRBb2hvTHQzZk1FTTFoRlh5akdoelM3?=
 =?utf-8?B?eUZpcHNFSUJTTENHTy9jSVVzTjVlb1R1bmJWMHNLSXprRk91ZWtpSGpGRjds?=
 =?utf-8?B?ck84SmFFSnIzbDliZ29WNlZadGJsSFhDdkllb3ptaTFjbHZrUTJlMmxaUmRS?=
 =?utf-8?B?WDZsODg4c0RONlZlV0swdC9CWXFPcGhNS1RkdDQ4dkM0WlBzNW9pUGZLbkd2?=
 =?utf-8?B?Mm1vSXl5bE1KNDZRZDh4ZVhkbUpDSU5WaTBuOWN0eFgyY1hURXc2RVlnN3Fv?=
 =?utf-8?B?UDI0dStwamxrdENxb3h3ZDYrZVJCb1daQTdQeDJVMy9tRDdTSGcwL1h4akt6?=
 =?utf-8?B?VkpvcFUzY2FFUmwzVGpRVDh1K09SRzJtdTVXLzFEZEhqYTVaN0poQnNWZWpw?=
 =?utf-8?B?OHF4eEVjU1lTSlN5TFZzbk1ObEN5MlA1Q2wya1phZTRpT2NHMVBVZnJkSkw0?=
 =?utf-8?B?WFJBTmFCYWtDUFdTd3FkRTd1czVxNXgza3IwUTkzeWsxUkVLZ1N6ZlZBeHJH?=
 =?utf-8?B?ellTTUhReTVrRm0wUjl4OGVZTG1yNmlKdHlrOHFhSTZUKzN1OTRyVWlROGhk?=
 =?utf-8?B?US9lOUhPSmI3b09BOGRqMHZmdzlyVkRoZW5KNEQwdzdmTWNmQ1NVZ0hWbG9T?=
 =?utf-8?B?WGsrRGx5dGE5NkpiZm9tMXdRY25GelV3WG9TVUdHNjFlQjdOM1VnL0NQa1ZV?=
 =?utf-8?B?VFY2cVp1d1UzVmtGQW9Xd2cvNVRMZ0dycEFwS0FjZ2NyT2thUnJDOXpNbkxv?=
 =?utf-8?B?V3krTDNDWmVRdEwvdkFiTkRIVnVtZVRkdDRxck9oWnNZUTJ2QlgzblQvT24x?=
 =?utf-8?B?b2tqZVh5aWNxTzRNeGZJVnVjYUZiTlVMZm1NSE9kS1ZLWWgwVGptYWV5RDh6?=
 =?utf-8?B?L0NUbWVzZ0s1TVQvSnh3V1lLOVlXOUdxc01jZmhNY01HaXFEQUY4cjdVeGR3?=
 =?utf-8?B?NVdRMjdTWU1NMzEwVUhHQ3BOT1BKOFhEaDl5VkhkZG9yamQvNU01aVlBVFA5?=
 =?utf-8?B?UXorL0R3U2JLQjdoQUdsU3lMQzBDK3ZScjFNVFVkaTgwN3dzUXh3LzhxaXJa?=
 =?utf-8?B?Q0hvQnRDS3FmazRDVXRyNXl1MVVQN2Y3UHgrdGRKcDY0M3BZUFJOL0p5YUhv?=
 =?utf-8?B?ZHpNWWMzNHFJQTA1eERINjR5elFvUkVQUHFYVFc4b2FmNFVsT1BERXhOMXo5?=
 =?utf-8?B?L0Rrc0RjeTVyNFNRNTNrV0d0Rm5Ya1FmWnFPcWZKZXFCR25Pd2hlK0FuY3hY?=
 =?utf-8?B?Vk01VEh3RkozZ0pLYTdmWGJqdktSK1lGK3hGajd6LzcwVVl2NVE3TWczcWFG?=
 =?utf-8?B?eGNxdGpXSCtycy9DTjJ3cXM4VHBEbCtCWVRteTk2cmVlSU8wek9xZ0hwak12?=
 =?utf-8?B?bUt6cWxoT00vQ0lUWmhwRDJXZ1ViUEFOcTRPTi91TnVrN2VrQnZJaXZNeEpj?=
 =?utf-8?B?eC9kc2J3MXNWU1B0MmE0eGJaTjJuNGhlTjZXalpIeTJ1Z2Y4ZkVWRmdGSkR1?=
 =?utf-8?B?NlVuRzFxY0NrV2IyYkJpanZsRmRjUHNrY3VVRy9qS3J5ZjM1ZlpSNmV5Z3lK?=
 =?utf-8?B?VFR1Z2RCVWUwS3ZQQmU0K28wYlNacVhWODZDRnNBczd1NmNDa1hNS1JJRkxz?=
 =?utf-8?B?RXk5UWt5N2ZJbnd0RzU0ZlYzajFtSDlGZnhxM3RVVS85STh5QWpZdnh3WG9O?=
 =?utf-8?Q?K+GKo1qOzb2+81Yc=3D?=
X-Exchange-RoutingPolicyChecked: ZlScSiVafhOHZJCbSnwGdDs4g3Eegvw6CoZKZnYQx8miO6Gog+t1johgVmy3juYlpLKafRzYmsK9/zOPdNGS5OfC+iUmB0TaWlHo+co3TU0/gZvUuHA5AXkol8E3VAR9kwCB3kqCvtSgduUMTQ/n7YXEMASwTNYHTVd6+bkuj2B8qNcVq3RvUFJLtGjJuRIaCF7ahvqezGbWlgEmNiu401toXXkTmSKflV00+1KVXl4KBXpRlmgWTnKLkPqU7rOezvF3lOzNkaQoIweL1DgQZ/xPJdKUU23OoJ9XyVfllBf/agdomQdAQm6rsmYs724wBj47MmtJll+cPxOrWNkJsg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 72d23064-1003-47a8-8378-08dec1493276
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6967.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 08:22:05.9423
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mPo41fMmnDx8JhPs2X4PLMc8z8VBnjVjYXDxCwthhVszLyzLkfBUElgsZ6tskWMMiW3OLqJ4kql+xSRUi3tCesLnusdVl2thLM4372IjitE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF96964A2A1
X-OriginatorOrg: intel.com

On 6/3/2026 3:16 AM, Andy Shevchenko wrote:
> On Tue, Jun 02, 2026 at 10:13:47AM +0200, Cezary Rojewski wrote:
>> Code line reduction and more transparent variable naming.
>> No functional changes.
> 
> ...
> 
>> +	list_for_each_entry(stream, &cdev->stream_list, node)
>> +		if (stream->info.stream_hw_id == stream_hw_id)
>> +			return stream;
> 
> Seems there is still no blank line here.

I've sent v2 before review of yours and decided to wait a day before 
sending v3.  Will do so within couple of minutes.

>> +	return NULL;
> 

