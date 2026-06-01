Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F782345CAA
	for <linux-sound@vger.kernel.org>; Mon,  1 Jun 2026 20:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780344177; cv=fail; b=G7E+XUAz4pQy7DPtcgWAg42w//2K6dNqmwR6MMlKJZm64iZbwAN534Gmr+I50IiD/Rt9a4zoQMVglkz0Lr3vLJPzeE4A5Kjx+clkyRQKV9PySHpxGiNtKfKZ+qPxfHkPq7GeSEa7Cl5iTzdpmXo4PE4xIVJ4VWWwdcW6KgFPvt8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780344177; c=relaxed/simple;
	bh=BTkisQTnYajdkKLKGxh1TqLjASMaEMrWOFJm3E4ynRQ=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=TONGoNOMzJ4mFjR+JDg5tH8tlR7vsiBNeedAoKXVlrSMdQ/qaQnW7tMxP0tQe/cVIPpGGxqd9xPDxzZcZlWOTBUoEDnlks99kqupMGmI0fWiRGZd8t6PBl2f7GckkC7XvE5l/UhKrtps2gSx14VZ+8FFSEiJUhu5UL6J6ki1j8k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EYTsJyhQ; arc=fail smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EYTsJyhQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780344177; x=1811880177;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=BTkisQTnYajdkKLKGxh1TqLjASMaEMrWOFJm3E4ynRQ=;
  b=EYTsJyhQaA9Ay0EfuxGntuPjGEyTqkmw9a46qrIWf0Q1CG8Z4BzbBpgR
   bBPV+lEWzCbbsmmd+D+qwiHcGp1Ht4JL25Bhdtsf+xOy3v6irO+mpIR3s
   f25+unxYN/M8yymEmuKszjdSzRFXhSC8NaoWsmpBezno6gGHAA6V/Wz9s
   l8YZxcJl0nVQXot9QOhGEiJrR4DYRWpNVZfg3lwqEVjgBlRgHncwTOPNo
   d1by1GYVgra6Pw4RnWVqiqR9aP2eeH7zDS9fIZTOG2t0PMEHEHs/3Fq8W
   1Mv00q5RMhBM+iSrzcBmuBO2lwwivKMGrg84kK1/RfO7ncJ2zp4YacQwc
   g==;
X-CSE-ConnectionGUID: OrTnK81WRRWRHoVk6z31Kg==
X-CSE-MsgGUID: 8bxGUc7NTUaKv5JxF8pJYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="85000520"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="85000520"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 13:02:56 -0700
X-CSE-ConnectionGUID: NnznWeDwTL+NCa677OKDew==
X-CSE-MsgGUID: CjgSshL6S2un3zHpbU4A0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="240679067"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 13:02:55 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 1 Jun 2026 13:02:54 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 1 Jun 2026 13:02:54 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.29) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 1 Jun 2026 13:02:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XVoXXGztIQV4HQKeC/kC6MekmQuujz8iv/Rgsp2jI5DAFhuLh96+t0IXVS/nItzDPB1U7xyfXZ9X1qdqJrXPJdQ1+n/Jv9oOhZCkCvfXU9BQPv/uZtVd0u+DpLfA7RDrKdhCH0LpFtPKo+wrGKi8sgJN51wCIi/hkX1f6n+3Ko/IlyxSMBLrxv5KM4lAsPVbC5TczG5+EhaKtRoDlTcxzPdZe417aScgPDmCOGne9jDtLT/oAGX7NuwmPVNDcu5JPRruLe7NpCAZ7yq7Cud5x/OPK8ZOdr0dAO5dwTdZXRdks99L22L/VbvwE1skyomuVpjI5YCMuw8woySFGknAhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6sCU+4LluW8xEQ5evJYlOf+PA8ceqw8OCJOj4wB0XUs=;
 b=rrGyCwnabD0dQI1Zggr/IjqeZEWiXLWpW2ea6C/GD9UAnNKs0o5A6L/mmr844YU3wxcBpIlZ+mznUBcSw838OhrqbtiWj9pVy2Np4DobEr4n8ogl4h8Hgn7E8Nd+IL/HKXj34+7fEBikTeVZC+PdLmxrvRX9xcG2yhYUFj8yJxcr6LNC/jRKDZyo6Ei83yPf+lsDP17EHEGqJiqRKOj762ibs1TX46Uss8JIqteMeQQrBzFV2WgNV27Kyg1Y7tgl7O5x9rqrUY8qXrd1eBH0IpbnlHE4BbU7s5m4jrJ3CLwlICzx4XO9uCVXr9vpKye00KjvmcZv2TbQJdGnDM9txw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6967.namprd11.prod.outlook.com (2603:10b6:806:2bb::15)
 by SA2PR11MB5097.namprd11.prod.outlook.com (2603:10b6:806:11a::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Mon, 1 Jun 2026
 20:02:50 +0000
Received: from SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4]) by SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4%4]) with mapi id 15.21.0071.015; Mon, 1 Jun 2026
 20:02:48 +0000
Message-ID: <6fac7db7-fa22-4ac1-a83e-6ed4d3ea9026@intel.com>
Date: Mon, 1 Jun 2026 22:02:42 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] ASoC: Intel: catpt: Replace RAM-helpers with
 resource_xxx()
To: Mark Brown <broonie@kernel.org>
CC: <tiwai@suse.com>, <perex@perex.cz>, <amade@asmblr.net>,
	<linux-sound@vger.kernel.org>, <andriy.shevchenko@linux.intel.com>
References: <20260601141031.1606847-1-cezary.rojewski@intel.com>
 <20260601141031.1606847-3-cezary.rojewski@intel.com>
 <be625272-9daf-4d38-a7df-875f89b30f69@sirena.org.uk>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <be625272-9daf-4d38-a7df-875f89b30f69@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA3PEPF00000526.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d8::67a) To SA1PR11MB6967.namprd11.prod.outlook.com
 (2603:10b6:806:2bb::15)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6967:EE_|SA2PR11MB5097:EE_
X-MS-Office365-Filtering-Correlation-Id: 082a1ff5-504e-4c4e-cb9b-08dec018c103
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|18002099003|22082099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: zaXMQ4bDzvMmYTNx7EExlLiMOdmNYs8hgSsfWjBX6xNJGwnRFCDsE42kJRRkCOp5thjiW0fRyTFeVy+0XJNEA1uV5dAphcpuDTm3bBNHShA7T+rCMrm5EYDSXyevfp3kqyAtDnCbhOwXtivsMQ+W6qk4MZ8HMNw2WE4WXiOCaU28R6S4zWA8Pkmb59ster4Hm4zZ4OkiObs/opTm4ThY62JA/gwZjWKD7WcB36K04LxFaxVcLWwzllqbY3gFxe28bWktGI4kRek5x1e7li7kKWnlX2HovcOVKh3RWFcPV6bngbHY9cqjKM4/yYFEgNfvPDC+Lgs0MeDK0HpctqHqedO3TLlgRG9E7CxckExUSgswjZ77fGCnmqdWk5L5O5Oze3pF8HqEcjVcyxIDC6I1HIREy6q29zxvOL7ZWjlsWqht2+rG7DD1UFYiq27n7Jn9zkFkTVuEaESutkBMCP3qOWue0Z+v8Om0zbHpiOSCuCNLtuezLxRlZqjfiuj2U3DcyYLhKuUIhLi+c0hX6NEaSobRjnx6wCfgegua/5/N9DNDnA/CRTv03pHY2uNacEAqS4mZIBVMmEIXOgrXovdg2VYxQKfISSwNDTzuUycJRaSoeXi0euGiCAkHSI7M2OPOpYHxlHMObSrvuGMnyzzCrHGTeRdZOl/hhizHODxDTqxGECHy5HuTq2yLzpzukxqP
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB6967.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RndVdUF4TTRhT1hhZzJwZWk2UndoNURVQXMyR0lGQktUMUtFMmdmZXRTcVVV?=
 =?utf-8?B?Q2QxWFRMZ0FINEZqQkZRdXlWZWtLLytmWTNyRzFJQitTL3ZuUnNWWFpaSSti?=
 =?utf-8?B?TEZQMUV2UmU3MzJnSmRCRmxZeTgxb1dDa3RyeS80UkgyY0hnS2Erd3pMemJx?=
 =?utf-8?B?Qi9BZkpPZlVEUkdUNlh0OHJrVVoyMUhNaDg5b2prcGpEWmdYUnVpQjNoZEF1?=
 =?utf-8?B?S2lyK0dnQ3VEQVlQak12bXBPNWZmSnhhdTRpUjFCb3MwV2hXTWYxb1l4elRI?=
 =?utf-8?B?WkNQR2RCa3UwYmlWZUl3Y0luSDhMZGkrZCtPNTZSYzJrVTBndlZTMUhPR3FX?=
 =?utf-8?B?eEY2RUpsYnk3Y2dXYjM2K3oxMzZpMEVydWlQMFNJQm9pcHU3b1JjVUVadFRv?=
 =?utf-8?B?bjROL0lkcWFJWHNkUFVGZFZsaGJwYXZsZzk3RW9tNi90ckFacTk3L0d3aVds?=
 =?utf-8?B?T2hRKzJkellQdUp2OGZ5WWViekk5NkpmdDltejIvRGYvOUdsbDJieTBnQ0oz?=
 =?utf-8?B?bmNucDZ3UnhTMVhFZThDZGpTcEVzbFFJM3JDYUttU2ZrYVJHSWc0SEVhck1P?=
 =?utf-8?B?MlVlaHdpNHNtcUFiM1p2MkJiZzVTeXg0dGxGcS9ISFFnd2VORkxVYlRkbVlP?=
 =?utf-8?B?NnkzaTQrU1RYcXgvbGRYd3BpSG1qRjIwYmNSbVZ5dzZpTUl4eUhUSVg2UXc5?=
 =?utf-8?B?am04eEpPQWQvb1BJQklYdTJTaDBaNGdFanlEVmhERHRKNXhCclFrTmtVSmVP?=
 =?utf-8?B?c1R3MzVNS3NhU2JWYm1CZzVYdnF5RGtiY0xxRjhXQ1pwZTFQMllOZ2ZLOXlm?=
 =?utf-8?B?MituL2kwcFBzWFI4MFBGc1RQM29xM2VSVkhEOXROU0VCQkVROGZLWlNrQ3A3?=
 =?utf-8?B?YjFTaXZzOCtKcHBsM1NSNUxxT2J1aVpTRmgxakxVQlFSaHdOcXZyQ0ZaQW5L?=
 =?utf-8?B?S2tpUXU2YzVhdytGWVUveHVQMEdoUXIvaEVjYnNBYkwxcmN6ZmkwMzZrSjlK?=
 =?utf-8?B?MDN2SkRFd3pPUno0S1RMT1o2S090MUlWcXkybUdFalFCQ3ZselQ4VEVWUWNn?=
 =?utf-8?B?S2RqellxRkd5NnZxbEc1bVNZNTNiZTlLSEdCVUxJS3ZRZ05PN0E2emxtM0xZ?=
 =?utf-8?B?dG9qTGxLWUhzSy9PYlZSWnMxUnQ1aXBUQmNOM2JUd2lYU0d3dzk2ZktLOW5J?=
 =?utf-8?B?c2lxdGFWZDlMQkx3aU9iaWxOUzlnV1JLcGFPd2JpT0g3d1Z0b3Q5aG5hSE55?=
 =?utf-8?B?V2k5Sm5tcGlCandFRDQ4OUVvQUlPaURHYTFOd1hiK2dWMDNaNEVlK0JUYUFs?=
 =?utf-8?B?YWtheklrclIrSEtCYURDcElMUGdiNC84TE02SnJZeERDQ0swb1gycmlzRnlY?=
 =?utf-8?B?MStwRjlXK28wVHlRck0xVzZoVzJ5V2wyQmRiWG9wVmZ3eERuTmlsc2UyTWJ0?=
 =?utf-8?B?aU1hbUJOdUY4VHA4bDMwOVBabVFiVSt4Tjh4b1pjLzYrZXNmeUUwcVJjTmdu?=
 =?utf-8?B?dVZLTHZLR01HZUdxL0ZFdkp4U2xMSnBIRFY4YVdYY0ltYTBzNUl5Q0hYVkQ0?=
 =?utf-8?B?U01qN0ozOVphdnhHZTdscDF1blpGR2dKeVk4NVVIbVowMVRKMTVOeWtHeHBI?=
 =?utf-8?B?QzF3bmFYUlMySzh1VmFuUDU0S1Z6WmtsS2RDb0ZDMXJtM2pzSjk1UjZOK3U4?=
 =?utf-8?B?dkRnZVpxQ2k4NjkrYVFxTjRhOWZlektPNHl6K0VBUndIN0lQSjEraHVmVE1h?=
 =?utf-8?B?QTllZS9Fc1lpNW1JdS9rU1Yxb2l2bzlqWjJJKzdWSkhTSDM5allMUzlYc0dv?=
 =?utf-8?B?SGlzbUpYNjJjd3hZdGxNZW1WMlFWS1RSSTcwZ1U0RTBoZjJpT0l1Mmc1R3F1?=
 =?utf-8?B?VEFLVHU5eml1SUZLdjRBNnF1cE1UT2lLcFUyRGNyRUpCdnNXOHg4SjdBaGQ5?=
 =?utf-8?B?azJvTHMvcFovd1FkNTJBNDZsNUJ3Sy9wWE5GaGFTOUV4STN0Umg3dFRFcndI?=
 =?utf-8?B?OHZwZVg5dUFWdGpGRTh3eTJaL1gxTTM4eUVpdWROc09UUWdESVRLQU1zU1lQ?=
 =?utf-8?B?RXlCbjdOUlByVDUyb2dwMjB4Q1VudThBcnNza0xOUFFRVXM3TGhmOHU2enlQ?=
 =?utf-8?B?eERzZkJDL0xWWDBheUdHVEx1QXFxRHg0UmkyN1IwSlBreHZyUlJGcU50L0pl?=
 =?utf-8?B?bFFTWVd1M2twb1VOS3d2dm9QdXRsbjFiZUlrdHRTTmdYSnpneVIzL3hEdUJD?=
 =?utf-8?B?Z3Y1TkJmU3NFSlJQY3FVVlVVYnloNEZNckhWYVFvcitpQlUvVjR2QXdqcGMy?=
 =?utf-8?B?bU9Xa1lIaTZXZzhMNW5aOTFNVFZKdnpOTEdIS2ViM2IrNkxadlVTaEU5dDZJ?=
 =?utf-8?Q?4SKaV+38nw6fvmwo=3D?=
X-Exchange-RoutingPolicyChecked: QfivBC/sQnGcBnvFSNSVc3AGMd+PLMY/eKvU0IvRRSy6wmll3rAag8KMTfL02xEdfqu//VgyJQHMH/0uomxpUDQ7OjDXFtyOjBSZV0RZbYd4ggelr5hgekS9Rj9qd1cmFQv8zMC371fbkUBPO4EY77MBYZ9EIL2oD4uKzTGt1BYYkyr25SqKmrlTcB+8eVXfWNt8qdoGZaVJxF8yLQ7Vku51H3QD+uWinxmfyR33gw9CeiSEoPbl25jqj7tJLhzVq0kunuhHtL+RgFD/MsTs9Weh5tH7czCdH9ESnJbB6/3fShR977AhJebWffwFAsf921CflH0RTpOw3knSGRk4eQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 082a1ff5-504e-4c4e-cb9b-08dec018c103
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6967.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 20:02:48.8170
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 24sNyj5i6X+B2gWgmdm5ribPftqDAzlEIah65D93/FUKqN+clZIdQVBWoo65Pu9oFOiqrmR7g8CqCAs1NQ0zJZ/U21GxWDkugKOcNMSwGRQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5097
X-OriginatorOrg: intel.com

On 6/1/2026 8:57 PM, Mark Brown wrote:
> On Mon, Jun 01, 2026 at 04:10:26PM +0200, Cezary Rojewski wrote:
> 
>> -void catpt_sram_init(struct resource *sram, u32 start, u32 size)
>> -{
>> -	sram->start = start;
>> -	sram->end = start + size - 1;
>> -}
>> -
> 
> The prototype in the header could be cleaned up too.

Ack, thank you for spotting this out.
