Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB594071EF;
	Mon, 29 Jun 2026 13:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782739525; cv=fail; b=YgvXjg9+oqh+i912KjLamJ9WTD9EyIMPCw0kJHLRtAytieysTy8aE7gOybTIzMKlHcNSgXwIrZyYI1+s/NImqBrBxW2X+nSwp9UP5HQmvlM5FcNtsn5QbsTF31dR8im670TF9/dqVstR64pVRcXvF/IY24q+dxuKttZnEQmzSsA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782739525; c=relaxed/simple;
	bh=1DH5EEGqNDmDXcrTR0G6Ooyx63di0G+1w0BqzqkaB7E=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=QvEztlLQFfdE+Nd22CCrrMQudyerCnqtFLgZk1ZnnRJ7Du1m1U2HJeIgOLLKMtoGAbrsocKpYVam/w94ajL7Tb0UYXMkKGFcOoLsEFdxeaT+NtAhitoXlJ2uwpJ3A3zdsdP4MrkZDgbldQ3QXol0n9zFaqCmwCAPFGyfmcqZ5fw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e/LGATp7; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e/LGATp7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782739523; x=1814275523;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=1DH5EEGqNDmDXcrTR0G6Ooyx63di0G+1w0BqzqkaB7E=;
  b=e/LGATp7R6Vo8qlEwnjEo2pA6y3Fp0RNiWuvHMcJOX6wWD7AQPJY1rZL
   F2O6hXKERo7cKyhjJwjcGn+CAoKsiU+4/H9vRGPxnJ6AfbztVvgacJJXw
   UaxfE6LhU+7FlezkqnFVEOkm3PvrDi4F34v3XSXtRngGB36LRj8M08T+R
   6qgADQj3WV8blAwyb+BplbXOySlUgOdmrRViF6gcYUlHBrhNCuIa08rtq
   J2Y/9psUuwwFeCiYCj7DGBADbH3YE7A7cImka4sQ7xN8CW2XkBSFMmkgJ
   F0qtRrT6jsa5+vEwXeF6q+gzWXANFMhj+s5sPpWxgyXWAK6GdrSKv8VDH
   A==;
X-CSE-ConnectionGUID: nrzxl+xNTzGW4oWkY8nWNA==
X-CSE-MsgGUID: ArMHdQQ1SxiwjjBt2du1eg==
X-IronPort-AV: E=McAfee;i="6800,10657,11831"; a="94084766"
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="94084766"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 06:25:23 -0700
X-CSE-ConnectionGUID: r2yYTtYlS663oKEkHSVt1Q==
X-CSE-MsgGUID: VdyF7YF2Rzmpm+vrzPFnZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="253861385"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 06:25:22 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 29 Jun 2026 06:25:21 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 29 Jun 2026 06:25:21 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.45) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 29 Jun 2026 06:25:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GUVrW0372REOcDfWNV4E0g5xeYfzmJd/5N7Qozc/Se9AFdZ6BNzPc1nE+nVuWBEOAXjvd9sRuHutiGP+tVx0WwgnS1KdUJGNFCem6FodOTllPtMQ+m3+nxUguox3a+hy5JdFYYtYbQ0gEdnUpe67L/zV1/cXJQRTa/h7FtxfJm3uip7sy0AUo33iafgkxI3J1BL61j0dwIgkVEseCGsbddzBw6OyG3s3Buq30kTcDB27dGXwD0f7uZrTkNU917tNiigYrv2QNE48JebK/2gkfp08ikRHPYJHAcuNaqsaBJQWA6I4JanKSknaoMIvTVx1tKGmgPBnDgLjck5870wfog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kke8FhYJ5pxdDRQ1kE9NgQPpRvcUNpcCOm1e/jYdAUc=;
 b=abkWfEczChqWQcu7CHsvQu2rVPMH+e0Be7bZqR60wg+8BDKyxk9x5S9cQELTtJXqMZn/DWHF9wiKYz0j4seKGCmQpK8c/7mLotYCBWrSx+r9J6N3oOBCglyLWhR2QtBqDOotzf66kincpQACqZfPYtd4E9PUEkfD42porUBScW5mWPk9V9fF3yJTtYDes/zJJzeyDdnNDvlSH+jMGC1uozCSvWLNQq22tVkH+gbJBrcIHbyc9l97HTDD8pE/l8yXZ20qdct0/Af0HVtGEhIQ8yMP1smO9yACeS4now5CZNeoNOc5Z5Kg7YSqV7O3SRYlhgIzE28Mfb4ujWS+lGnx/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6967.namprd11.prod.outlook.com (2603:10b6:806:2bb::15)
 by PH0PR11MB5901.namprd11.prod.outlook.com (2603:10b6:510:143::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.16; Mon, 29 Jun
 2026 13:25:09 +0000
Received: from SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4]) by SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4%3]) with mapi id 15.21.0159.018; Mon, 29 Jun 2026
 13:25:08 +0000
Message-ID: <e0a41c2a-3fa1-44d8-afda-71e21d210db8@intel.com>
Date: Mon, 29 Jun 2026 15:25:01 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] ASoC: Intel: Convert locking to
 guard()/scoped_guard()
To: Bui Duc Phuc <phucduc.bui@gmail.com>
CC: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Peter
 Ujfalusi" <peter.ujfalusi@linux.intel.com>, Bard Liao
	<yung-chuan.liao@linux.intel.com>, Kai Vehmanen
	<kai.vehmanen@linux.intel.com>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.dev>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>, "Liam
 Girdwood" <liam.r.girdwood@linux.intel.com>
References: <20260626082904.32344-1-phucduc.bui@gmail.com>
 <0b095ccb-5208-4813-959d-e82480bda50d@intel.com>
 <CAABR9nGtu83T-_riRpbndPyqbhxQpNrcXU-avy2m1VC-H4_AZg@mail.gmail.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <CAABR9nGtu83T-_riRpbndPyqbhxQpNrcXU-avy2m1VC-H4_AZg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1P291CA0012.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::9) To SA1PR11MB6967.namprd11.prod.outlook.com
 (2603:10b6:806:2bb::15)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6967:EE_|PH0PR11MB5901:EE_
X-MS-Office365-Filtering-Correlation-Id: 5839521b-d009-4bd9-1a2a-08ded5e1d681
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|23010399003|7416014|366016|22082099003|18002099003|3023799007|4143699003|11063799006|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info: 51mPb8rkMQym3NuQofQMw5V/WDQSwvoONYxP9OQSRui6fP0oODVbXgyi/zM1rIpt4LIbDKxNPfhmXMHQv13z3M07qyt4p739YkvXri/0VjRRLjNTIcS2me+9ChwOnoBGSEXuJsESXKG+gLbLAbjlPzUjgtMPSw8JIntGww0hIWCjl8rV5mojmD8GKP/WD4WA+yPIw/F780ZrJaG5LFb3ItU1sPMHAI+PuGn1Gbl2ydRd3do3oy0AAe0EM2/phiOWCsYoJDLMeV3jhE/2Q3nr38/IdB4mCoCa3HTVjXTc0+Bng5Paa/sgGIOU1Dda70uWyK+aYDVK9gmb9Jk1hK7BCO5vy5q8qnGQ8+DwO4TG7dzij8JJFF/hWwCXdujTW2KKQn3k2WXsymUgRvTtgkj2x4c2KyCebKJgNUMsJ6+/sltObdwliOHtPlXnZgJUmzFdDmLAr9c546c+0f6Uz0sicaC+7RnFz2Q7OM1rsEPAzaAt7qnRBN1inwUGPFSLLvqWR3nn6asTWB/3r/0+TJUAe98n0qL3KvykblD0nzLbFxQd9Z93Mtpr1sXM+/E+sNAxX+XXe2Dd1xoEf2lvQHGgJVNzZYLVduD2jeIJjYQkfudBwBxgAPtQo0OtDYYEVg1fGlTzD+5Shsg3Z7catunlRPyjP2xuK3XHerkduX52/sA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB6967.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(7416014)(366016)(22082099003)(18002099003)(3023799007)(4143699003)(11063799006)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aDlsa29PUUFGK2p2OVdHSVlIcHpkeUl2US9PUW5uemlMVmMzVTZVdk1ORHcy?=
 =?utf-8?B?ZVlvOElaUHZwVldINlpJUkJZdEY2YnNVVlZOR0tOTjRONVJnVDV5cXhGZVBj?=
 =?utf-8?B?UDIrS25oS2ZDMzVTUk45WExYRlozc1JIVERxblo4MzVGR0ZtbFdZL2pKOUxC?=
 =?utf-8?B?YlovWjR2azc5Z2E1ZlAyY0RWaVJ3bnpmaW5uNjU2ZWgySVo5N2ZDK3R0OTNY?=
 =?utf-8?B?WkpQUkZGaG5rNUwvREljcG5kMUhzR1JzRUpZc0c1dXBUOUJhemJxSm5pR05m?=
 =?utf-8?B?TFJiZjR4MkpkRnRGYUVuSDF3UFNrUHZ5V24vVXliazRDZ1g0V1ZmcngxVVpR?=
 =?utf-8?B?c1ZEeERrSTZFV1VGV3M2K1RTTjJiMS9VOHJId3lvUnM3NWk1TmFrNk9OcklG?=
 =?utf-8?B?Tnd4Z29xZ281L1R3VHluc2FuR20yWHJ0Si9vd3Jsei84Y0xhbzMweW1ROU9z?=
 =?utf-8?B?aWxBdHRWbktvaDNuMS8vbGVhZmQ3aUZRZHY2eTBwaUx6emcvN3NCbmhueElw?=
 =?utf-8?B?TVBTNDlhajhhY0hlM3VqeHA3ZHVQTWRkZ2hvMEdNR2lTeTBkUnRMSVRXTkh3?=
 =?utf-8?B?SUZhR3RNOTRwdGRlNFdTMENkS0ovbzdJY29YUkgySXVLMTFvdFVrcE5HOEoz?=
 =?utf-8?B?bnNLS09ENXhROFF6WXlTcXRrNTI1bENzRDE1Y05TK1ZXd0pTREdpMWFUWHdz?=
 =?utf-8?B?T1EzeEV3OTRodldTZ2czTmVhMU93WmF3cnEzSzN3M1orUjNYdyswVzRIalpT?=
 =?utf-8?B?RlAwV1FDL2ZkQllmc0N0TytCRGtBUmd5M09HRk1zcG5HNmIxRmJPZTgrZVUv?=
 =?utf-8?B?d2QyUkN0Mjk1eUl6L0JYMFlWQWYwZTcveXdSeXc0UWZhVm5FQU9tZjFySHBS?=
 =?utf-8?B?V0t0YmlKQ0FyYmRIM2R2d1JYM0lXM2t1TVNBR3ZwbCs4a24rOTllbXVBSm5o?=
 =?utf-8?B?QU96S3p1Q0pFY1RUOFZZOW8zYkFRTkg5bkNSWTBrR2k1L3dsS0xLbFlZTGhk?=
 =?utf-8?B?L0dETDdXN3R4Uk91L2p5NjlaRzN3emgwMFNpaUk5dnpCR2ZDRWJaWjdrZzdy?=
 =?utf-8?B?ZFYwb2NudkczYTh6M0lBM1VnbWZDM3NFVkN0TEEvYXJMRzhhVVFXWXd3Njlu?=
 =?utf-8?B?M3N4bjZiWlBNYUQwVmtvY0ZCbHZlb2h0OUYyS2NzOEU5VGlLQ2Q0aVZhY3lC?=
 =?utf-8?B?QVN4czRCeUhyMU5aZkxUbDFSV3RQY1pTRitiUFUvc0liZis1N0Z0cmNvOXFt?=
 =?utf-8?B?Ymd3QktQRktaUTJIMG9jY0pFbDJQS2d2a01qd1J6TmlET1NBcldYeEpTWUFZ?=
 =?utf-8?B?Ty8xSTM2K1JMMW1UQWpOaGcycTN3YmcybElmeXRZNElXTGh5MVZ1b3pnMytZ?=
 =?utf-8?B?OHVFOWQ3Q2U1SEc3cmw1OHZ1WERIT1U4NW50SGlmQmZIYmh4cUNXQzFhUUtz?=
 =?utf-8?B?ZytycmcrREx2RWgvQWhaZ0hnQkdBeWZEZnVpZUpEeUZlRkkxVXJLTU9lTE9R?=
 =?utf-8?B?UGVyeVU3a3EwcFJ2YzZ6dmxKWHlVdEIrdFFvYmFXRFNqM0kyZUhpeEE4WHJ3?=
 =?utf-8?B?ZFc1MkhVbFIwMjFmVXkrTFdqV1JPeTFaZExjRllTVWtuQXozSUNFa1JCUlNH?=
 =?utf-8?B?bE9TRk52bGRjSWFoUjVaOEx4MkdSb1UrdW1HaUh3Q3hvdy82N0VBMzlVWXBj?=
 =?utf-8?B?Wml3dHIwRi9ORUZnbGt2b29oL3JBUnorQmxJQVl2eXZTMDFmZnJnOXZ3cnZi?=
 =?utf-8?B?Rk9HdCtmOUNLTHI2Q1Jlcm1wMUdLWVBFbUJBTUtNcTliWHBla3djWTNBNzV6?=
 =?utf-8?B?NzgwakFRTVphZ21kUzhrcXJudkNYSUpaODYya0lObG9Jb0dmN0lMcG1KUE9n?=
 =?utf-8?B?SzRNdGM5NmYwTDlJT3ZRZjNKZ0ZhemU2RjNkTWgySjB6US9YNm1TL1A2U0hy?=
 =?utf-8?B?Rnh1NTExTFExOSt5aTAwdUxjTW4yNTM1S3g0L25iamR1dGxCbFVFUzJTTUdj?=
 =?utf-8?B?RGREMlpGZEM1dnRRN3VtYUEvQ3ZTWFlKRll4VTlBdzlheUdJL001NmprVmxK?=
 =?utf-8?B?VDlBZGhkUTJadVNKSTdWMC82bTdrT0k0bkVwbVdHUDl0eFN1QXRZWDFVLzkv?=
 =?utf-8?B?TTJCclQrVkFaZ0REbmFURDg2WjlNaUJZajJpT2s4ZEdsVWhDVGY4NVdUbm8r?=
 =?utf-8?B?dEJOTVNlSlFhNy84ZHRqcjllOTdyS2NoSGQ2Zm42MWtoWDV3akNBMVg1QVo5?=
 =?utf-8?B?U0VQaDZ6Q2pvNXZrUE0wSisrRDFJMEtrZGFHVFJRTVI2QjUyWUxMbTFSUHdo?=
 =?utf-8?B?TzhLTUpQaHl3NUxic29RaDF3NlJIbUhCSEtTY0hBOHlFVjBzSzYwOUdoMFdX?=
 =?utf-8?Q?T5wslikRqWGXwfoA=3D?=
X-Exchange-RoutingPolicyChecked: ntxVs8TckEpZbmLpfM7xrMvOIqHg6rORRLquRXNI5czgu0zHaAJIMdu5U8ujou4PAVhvyeTggx+XdC0K9QVvVK79r2HZ+wAWJIXbqtTTy1NWjlm/tSjzk1k1DgrJK03rbK5o82SFMV7v6CoBSfyVPll41x0WTr0OeVMjGcra3Bj5WsB5OOqiU6ocevarrDpLy9ZwIghyWe40Lir0Ih5NDh6XdGlySC4pr8VeqIdZvyMzRW5IB/jsIeO5hRpkOK9c6QGzXgYcU/qwzZCelL63RGk72krqFdimrycyTx0+U2BAQp6L2Zyx3D09MvqMZ9nG5HOZOv+ieF8MAHPBHGBqvw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5839521b-d009-4bd9-1a2a-08ded5e1d681
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6967.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 13:25:08.2540
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OM9cZofmPfSg6K0ZZRIji4SdQGaF7iSddObMLPMA49FQD56XLHd7sXS9BeuqO2JoYmlNHN8jeLV/7j1RjzrMgRIYL2ljVG1PMpBaYNnaE8E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5901
X-OriginatorOrg: intel.com

On 6/29/2026 3:03 PM, Bui Duc Phuc wrote:


> The only thing I'm still a bit concerned about is splitting the kfree
> and guard() changes into two patches.
> Since the guard() conversion is mainly there to eliminate the goto
> labels, testing them separately might
> introduce issues that wouldn't exist when both patches are applied together.

The CI is run for entire patchset.

> By the way, I'm curious about your CI. What kinds of tests does it cover?
> For example, can it detect regressions related to audio functionality
> only, or is it also able to validate
> audio quality? I imagine things that require someone to actually
> listen to the output would be difficult
> to automate.
Cannot share the details but I'm talking about actual long-term-support 
CI with large amount of corporate resources invested.  A lab, high 
number of physical setups with intention to cover every Intel's AudioDSP 
architecture version (starting from Haswell) and streaming-interface 
type (HDAudio, DMIC etc.).

All functional tests are fully automated - imitate every single scenario 
we do expose for our clients, regardless of the OS type.  While again, I 
cannot list the tests, the basics are quite simple - bucket the 
"functions" e.g.: system states (SXes), device states (DXes), 
multi-threading, clocking (the list goes on) and do: atomic test and 
then a combination for each feature from each bucket (if valid). 
Incomplete example for basic playback:

- 1x default endpoint pb before s3
- 1x default endpoint pb during s3
- 1x default endpoint pb after s3
- 1x default endpoint pb before s4
- 1x default endpoint pb during s4
- 1x default endpoint pb after s4

Wait, does that mean the tests go in thousands?  Yeah, several thousands.

However, without such investment, people like me would not be able to 
propose and provide reliable contributions for Intel and ASoC both.


Kind regards,
Czarek
