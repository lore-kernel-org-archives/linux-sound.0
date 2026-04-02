Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3EDD3A6B8D;
	Thu,  2 Apr 2026 08:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775117517; cv=fail; b=IEF15kM7RJmzkTh4yETkIbbzEysUfqYQMvgLXkKriqcWWqfnHWRuakuBMUCY78wzD4D7hitBrdDG5gZJX+XExsXmIi5l+dpgzS/Ye7RuBLIMzZW1Us9pIyZuA90SgmGd7kIcdYoOjFMJuTMNR0Uqdrq8i8HZtlC4NWRtbJWwDsQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775117517; c=relaxed/simple;
	bh=WYXTihnTBCMr2P9LSH3UIfaXqhQXz4eqJ6iHfO/vO3M=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=grt+08DyehR5rCPHFif8UHArkWIffpEKeYz+2yXCQAe0euPVxh3RP4E0I6dH1CALj4bo1F1VT+xHMsjkd1Y3re8bodTYaUUyewX3jrPM69a80qrZXWd9XP/Z4VYaJK0Ll0WCWUrg8JHBMvCEUZ1W4HFt13sTQSng2DzrSYp57Ds=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aImYVZLi; arc=fail smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aImYVZLi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775117505; x=1806653505;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=WYXTihnTBCMr2P9LSH3UIfaXqhQXz4eqJ6iHfO/vO3M=;
  b=aImYVZLi43ZJPxvrzjea17v/nQcmiYKPRagrFNZQ+xNtu0OmgwG31hy6
   UF81hPJQ+jal5dtZaMZ5sed6BylyMn2Fc17rMl7qFmVLKH151+F0lraNn
   mOXCZLdw85b/iyjrvk34Vcl7qM9myuvPWhYymCSgBYAYNxBHYeucHH5xk
   d8qpSBipP2U7M4/f6mBcPLhytosc+MlDW20ZZsaZS/EGcHeHYEMVEaqtG
   Z5XydmRRzVx3X+qRWU1BYxBLdSanBLsmTy88XGBqjfG0JLrWDjbpNZAlY
   JFuaDTv0dWw7ibLEZXyQfezgM/kBc4zk3BC0Ne5iiDmhbRDpy32YQ1KGQ
   Q==;
X-CSE-ConnectionGUID: qWjIGfiLTg2avMbR13bxEA==
X-CSE-MsgGUID: Y0QGxFJBRjiJGc226D1BmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="87565579"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="87565579"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 01:11:39 -0700
X-CSE-ConnectionGUID: 5h9tRrPgT+mLphkD35bVTw==
X-CSE-MsgGUID: VPazqkdvRDOv7ZWx8YWJsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="223637877"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 01:11:38 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 2 Apr 2026 01:11:38 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 2 Apr 2026 01:11:38 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.44) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 2 Apr 2026 01:11:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UhTOqOoKaWGG2jF/7Q+bEg9DT4EfeieH2LZDsyoyFW4jVqhQiMtbLofTiWtNm0u7cCY1RRwAjw3TzY/+HBPQnum4ZJA5eqMVoK1mMUq3Plie1YnnR7mxZGIVH/kTDXMiY7x35BYIdzlYZ/aZUQ1W7RKBAi4kMOzGEjkx4ZaiADJv1duNG9BN1uF1Y83DxpKz977gASyEXRol3dbhswLlexyCH/8+7jn1YIIVp+jjnHnFjQfHl6p1LXfWHziCFiJfDgOJVWuoc7RvjgSYrbgdFrn506fg9l64UBoNOqszLVIEn1cMOjNmj9QjkByggDsdVdrgxhJvPe+aZzNNr13BGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TNX+R+8t7DsA0Bl81unLw01ywXjnBmOrJvXMjKh74zY=;
 b=L0+pzRt/CJNJvkWkm9I/mLWfryU6DZ416LEukStq/qTFxJO2IW/eDY0S5iYbyAwfgba2U/Ylh1n+oLfmpskyTreXa7j0KyXl9k8VGXQrwA4V6DJXXXw2tBknJ/0icROjpnmny4P7BLuQhKqhIGAReuYUWpxtw+AS/sRNJ4pirI4cQLq9sjrIMnECxaGOMC+8QgNluaNS/ExulTMrpPVaasz/hMKnCtaOl3SQwOy4rRGFi0ihZ1cuTVyn5MeCuZS7wM68QxIMeVMBhr4ENE5a5zCqxy//+t3FIVByIuD8XW2NXbZG0JK+jbzUMBhK4IhVSF+UQTcqd5ib9C6ASlNWqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8283.namprd11.prod.outlook.com (2603:10b6:806:26c::16)
 by PH7PR11MB6380.namprd11.prod.outlook.com (2603:10b6:510:1f8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Thu, 2 Apr
 2026 08:11:35 +0000
Received: from SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::d18f:6b38:584a:214]) by SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::d18f:6b38:584a:214%6]) with mapi id 15.20.9769.014; Thu, 2 Apr 2026
 08:11:34 +0000
Message-ID: <5866d932-a09d-4fb5-88e5-f758baceb398@intel.com>
Date: Thu, 2 Apr 2026 10:11:28 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/4] ASoC: Intel: Fix MCLK leaks and clean up error
To: <aravindanilraj0702@gmail.com>
CC: <liam.r.girdwood@linux.intel.com>, <peter.ujfalusi@linux.intel.com>,
	<yung-chuan.liao@linux.intel.com>, <ranjani.sridharan@linux.intel.com>,
	<kai.vehmanen@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<perex@perex.cz>, <tiwai@suse.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>
References: <20260401220507.23557-1-aravindanilraj0702@gmail.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20260401220507.23557-1-aravindanilraj0702@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI4PEPF0000012D.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:808:1::8ab) To SN7PR11MB8283.namprd11.prod.outlook.com
 (2603:10b6:806:26c::16)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8283:EE_|PH7PR11MB6380:EE_
X-MS-Office365-Filtering-Correlation-Id: 99b7ad9c-e95d-4cd0-e295-08de908f7478
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: aS96ygBbvou6NtgokoLTxjyLceV+k/LyX9RoOOadya+KqUBO7X71Cnfz2p7luIW84iNQh5wlukPJ7NMszuGuhj7bmBipdXkw04sAfUfKjIwzBhUp2IVnMe8mTVVVx1r7DoPUEPiSEH0XoMUlyrDXt+f7TSfH56bsyhxfeyqvdODFyUgPeXhWbtT/I/SFgadhFQJwsb5+hxoXaYQs+L89S45npehkeqn82OD5cC0ib9EcJlzHpS32IZevAp6/ddA6mVRSoIoPLpSH1YlYfp2srbIEvIbVeL5cE37IXJ8Ws96Y66nek7xipd5qnKlXb2QXA6qEh5MUZOsWu6vVl9fu7va1y6v1vzCZ7ymsu4w/GbGrcgVN/kXWtc/8y8UNZw2DJj+2P7ouBr0csV8apOzO9pjS0SmCZW5xNq+2rObluyeZTc5tf/HY5fdngEs44Fexs4IPDyZ6g3QJQBMtr7zmlHS9vmwpw5jZQNED190ChUF/Vbs3j6gZ17rSDiwtYVekLspgHASOFb8FWqOqC5c/JIIL2xnrzrMVBMFdQ89wFi19dPv0DgTbExxgFxNEZ1ec23LiGLs7FRcDgMvgDgXTxOidRsEfLDX/Sma/x5UN8hvCVX3UgqWO7x4mwk59BToJrUNGvj0o5BMkS67/2Pnv7FtwGtXpwxaCUzp9LRlNYf7N1qWozqCb9TxB6+ij7u5rRk7s6VCcFX6bF10cZZrHBCzwWs9+c3ULa4Yl9q7fUH4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB8283.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eVFnVW5RR0xDZHdyRUpXdENSNmxqVnBORlY2d2o5YU1wMk1MQ0FUWG40ZFpB?=
 =?utf-8?B?WXVpYVJvbi93MTRoRE9wYlowN0RUMVI0NFU2S2NZSE9wZmUyWkFCc3huUkVY?=
 =?utf-8?B?WGd3V2xOcllQamFxbW1LSCtSNURwb1ROamtRYzJRNHhvWEtCNkhERG9sQm1Y?=
 =?utf-8?B?Zm5jZi9iUkdPYURrYVFMMVRhUlVRQit0dFdhMHhvUGNLMnIwZkVQT1I5dXpS?=
 =?utf-8?B?eVFqY0hpTmFuVFB1dnAzdWVQR0I4R0piTm5vTFp4cXgxSEdGdlpqVllhR1Q0?=
 =?utf-8?B?dHRMSnlqaEtsTURmY0pGU2wraHMxR0kwbURTZWtRWFVUcnh3SHFXNUJXZEox?=
 =?utf-8?B?QjhNZUhvK3orQmdYSEVRRCttRTg2OVZRU0dQNU43MFBPT2NYdVhmM3dwOEdU?=
 =?utf-8?B?eXZnaTlJSWhFcWdPdmlCN0U0ZEJTV2s3aVpndHZ2VmxsT2w4aUdKOTY3MFV6?=
 =?utf-8?B?V1huTCt5ckEzUitLS2YyNWwwSnpiS095cWF1OVgraHdVUzNFR0ZySHhrTjlv?=
 =?utf-8?B?SVB4M3dsOVpGSHpqNU4xU3Q1SmR0K3pndGtXbXZuL0hicWFiL3VlNnR4STlo?=
 =?utf-8?B?ckU1K1RpM29DZ1lhSFdMWmdab0dvM0orczcvUk9hZllZQ1lsSTROTU84dVN2?=
 =?utf-8?B?V1UzL3JBKzVnV3ZJU3R2VC9XK2ltTFJNUlFveC92QzNDdU5NNUhSZmlHS0R5?=
 =?utf-8?B?VFBFTG1nQ1RTV1ZET0MrUGpDbk9wTHl6MUU3bVM5eFNSaWRKYVk5UzhDYWFO?=
 =?utf-8?B?dmtYSGxvN0ZPUG9UUWNBejkxeTRoSkorN2EyRUhaT2NpYW1HRlFTTkRzZmNa?=
 =?utf-8?B?Szl1VmtiR05mMVN0YU5OWndoTk91cnViSEorTE5TZ2xNVmdHbTdCRi8vSVhy?=
 =?utf-8?B?cVUvOTl5d0hnUkllMC95Ylg0eXR4UnhNWTYzTVNBcHJ3dlN5eTVCS3B1NGFB?=
 =?utf-8?B?SEJjNHBrRHo3MXNXUFdRV012WFgyOXhBV0ZRV09FdFY3aFgyaEdZQ3NhNnZ2?=
 =?utf-8?B?bEdMTEtWaDNMNmJJTnBrNHNGTG5UMlQ3RUVKZnJrWlNrSWRKNmJibTRJMWRl?=
 =?utf-8?B?Tzk5cXp1MjNPVkQvMWNCS3FjNVFOQ0JodEJidGRMUnh2QStSZTcxdFBVV29i?=
 =?utf-8?B?NXl1WnJwRWxMU0xLaUFoYmxUTnR0S0pkUWtlODNZRHh4QXhxc2x3Qnh2ZFRM?=
 =?utf-8?B?OXJoeUVQNGJuMFJZTVlNWDIwNnlCdnI2VEFLbzhNRnFVTDIxZ1g5WTFIZHNI?=
 =?utf-8?B?UDNZQkxnVXVZc3VJWTBaQWNiUnFwZnhZek5XakVQaWpEbnllc25wdi9Oa2NJ?=
 =?utf-8?B?Q2FvdzRIcm05RUxWTHRneEJRK1ZvSGxXYmI5SldHQW1FTnJwdFBhbWlCOXVG?=
 =?utf-8?B?STRCRmRidDNEUVY3bUVMUUVGSXF0dVAwQm5CbHoyZUFLbVdVK0VuSzlpMm9R?=
 =?utf-8?B?ZVZ4QTRBcmVySFBvM0FEQzFsNjl1d2l0TmcyNVhDblJkYzk0VjN1S2wzLzNn?=
 =?utf-8?B?Ry9QMUw1WU1YVlZyZUVjUnlmeDFEMjNSVXdzR05iZVhlM2Q5OGFMNFV5OEJx?=
 =?utf-8?B?YUF5d1ZtL0JoSUJpUmJoRHdzdEQ2WlR2WmR4OThRbjQ2VWtPc1dCaGtBcnoy?=
 =?utf-8?B?SFkvSFh6T296U1lkdk1aeDlOTzNZWFBvSVljVU4rVC9tbXBSNDR5U1RNZExK?=
 =?utf-8?B?VVdZTkFKU2RrbXpoUkwrLzJhaElrc3VFUHhVTXZnVk9ZbUVjaGt5VERYa1dw?=
 =?utf-8?B?YkpnbE0ydURWVW9tYkhyc3FSUkpqcE04UmxNVE5Dc1k4YzVtdldjZzJTaVZ3?=
 =?utf-8?B?TDBwU3ZGdE9YQmVHVVIyYWhSUjlOOE9JdEljVzJzY0lCYW9Ha2hvaFFqcjVB?=
 =?utf-8?B?TzBVemppYm83VGlad1NUWVo5cWdrdVdQaTY1Z05sajJxcGhvMU5wQ1g3WG80?=
 =?utf-8?B?aTBFd0JKM2JwMHVXNXFGcWJLM21kL1RBY0YxRHNxWWFFSW1ZY0cxTms0eWEz?=
 =?utf-8?B?MlltS2JjUWxLWUJxNW5CejZTSjN5QkNZZU9QdFUxNzJYcmpFSERxQlNrbFFu?=
 =?utf-8?B?NW14MXhvcUlHNS85YUprcXROanZ1WjZOT0NycWNqUTNla0FiVkJjNDBuTkFl?=
 =?utf-8?B?U3NleGN4ZFJhM1ZPOHpFQlhZSm0yV3VjaW9zQnNyQzdHSTRhOExqeEZwbCtu?=
 =?utf-8?B?SnZuVUREMDVFQ25WZENWUG44VXl0OXBRaGRwbFVCVysxNmNITGNQYTY0SW5t?=
 =?utf-8?B?U0xaZDdzZzh5RitYdys0RGJKcS85dnBLK0I5ZXBpdlY0TDh6d2xpaHVhTDY3?=
 =?utf-8?B?Yi9pRis3OXk0ZWQxTFdTRjFNeStCaVhnc1RHdDQvbWxmSVdwc2ZnemxPcXJT?=
 =?utf-8?Q?ZnkqKOAB2bi2Y97c=3D?=
X-Exchange-RoutingPolicyChecked: eIaWmvRBMXUKxlzKEjRZ1wPQs0A838sNoT+HbLOel85H6Ek75zN6jIjarnfIw/RlH8wwVVqnFnbrINdz8H7knHLeBMvsigpkwzkOFWiela3akVcWHkF0y2U+c0/n665ruJg5EEwAFtdb+TMPtVuJAgnEid/x2tIjVdPm8OOjNcF43ghNoSDBW2wT1VN5boSZ9Ayd5owmn0xi/8l5I1lduPPiykpvkrrBLdfOi4EQ6fMuqnLa0S6IucL0z7eG4mQmRGuzHCGGXlHsrSpCwouwrUiy+gFDQuGHr10LGQWmoEJiu2p/eNstmwPsgwQMmDTemr5vf8K7TNhLxtjGZXUqzQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 99b7ad9c-e95d-4cd0-e295-08de908f7478
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8283.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 08:11:34.4581
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /0WkArx//EedfsCnBizTYjWU75S4U2m1ree3WwM+PJ/6t/Sg+pqXlIJlVqt6wXEG4yKogeK9GUtGS99ppVGvvSHzYdOOfWM/1e0jOeFg56k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6380
X-OriginatorOrg: intel.com

On 2026-04-02 12:05 AM, aravindanilraj0702@gmail.com wrote:
> From: Aravind Anilraj <aravindanilraj0702@gmail.com>
> 
> This series fixes MCLK resource leaks in the platform_clock_control()
> implementations for bytcr_rt5640, bytcr_rt5651, and cht_bsw_rt5672.
> 
> In the SND_SOC_DAPM_EVENT_ON() path, clk_prepare_enable() is called to
> enable MCLK, but subsequent failures in codec clock configuration (eg:
> *_prepare_and_enable_pll1() or snd_soc_dai_set_sysclk()) return without
> disabling the clock, leaking a reference.
> 
> Patches 1-3 fix this by adding the missing clk_disable_unprepare() calls
> in the relevant error paths, ensuring proper symmetry between enable and
> disable operations within the EVENT_ON scope.
> 
> Patch 4 moves unrelated logging changes into a separate patch and
> standardizes error messages.
> 
> Changes in v6:
> Place cleanup logic within SND_SOC_DAPM_EVENT_ON() scope
> Avoid redundant condition checks in error paths
> Split logging changes into a separate patch
> Address review feedback from Mark Brown and Cezary Rojewski
> 
> Aravind Anilraj (4):
>    ASoC: Intel: bytcr_rt5640: Fix MCLK leak on platform_clock_control
>      error
>    ASoC: Intel: bytcr_rt5651: Fix MCLK leak on platform_clock_control
>      error
>    ASoC: Intel: cht_bsw_rt5672: Fix MCLK leak on platform_clock_control
>      error
>    ASoC: Intel: Standardize MCLK error logs across RT boards
> 
>   sound/soc/intel/boards/bytcr_rt5640.c   | 4 +++-
>   sound/soc/intel/boards/bytcr_rt5651.c   | 4 +++-
>   sound/soc/intel/boards/cht_bsw_rt5672.c | 6 +++++-
>   3 files changed, 11 insertions(+), 3 deletions(-)
> 

Thank you for the update. For the series:

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
