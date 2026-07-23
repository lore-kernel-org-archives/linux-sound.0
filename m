Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E71F43712D;
	Thu, 23 Jul 2026 10:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784802937; cv=fail; b=XbKt7UwZY42/2/tG6pWcfY2zVGL9+Lm8tVUpCfktEcWl9YHv/UyiR3uavVgVQhV1xfx8ZBCYjEuDCuVXLqH4V+8+7Kz6Ux2Gj0x/NZGbefFLeO8Zm3yeyWygSPA6W8aOm4VkpvO2OawortAccvCRD9qDON/dbK0tHBv6MpWiVps=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784802937; c=relaxed/simple;
	bh=+MWzZT6RbuNqUYgql+SZbGdztouphm7nalHBs16bQpY=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=OLgn/Wr3zEDn2ig2rA//ZYmUmK8HL3FJTa+5t6ETZpA7RVV9xPyVuvmM4agQYBeoCKJePMV/kX5ImqlldfaPxyKqxsW+d8aI5wBFo1Os9JGdcIw00m9upXOzXhVPHwvqwKNNrjBeQk3b6f2eo9EMPY0uv+DS6KeoMMF/rTdS5gs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DPTfzg0Z; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DPTfzg0Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784802934; x=1816338934;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=+MWzZT6RbuNqUYgql+SZbGdztouphm7nalHBs16bQpY=;
  b=DPTfzg0ZWhYnSXc0cEh9BQLRcij+NelkSRwjQ/ewQmUsbdurNVRJnUHO
   0cORLMPWwwtLocdtHgQGeKPofHIK+g41GQZ6/UVAvhFZMOHkonXByAXHl
   G9ebIIS0TZiYoAu5bMf6DfC3lCxxxp+3oX1+P4hCQHds0MURl9U3hjU3g
   waYrFn5cSvR8WnEHlagHSjM1VjBdlZh5UAgXtKV126IzLY4JUK3mvrmoo
   /6itmpbcw2eO+KaMMPrP9u2g6R4LsNbMgc2tuEbXCpDKxAB3TOY3YU/xF
   vn2Bw7UuugmXnBKY4OLFbR3GjWKXRanEM1YT6by6zmqamCdCzA5PL5kFE
   g==;
X-CSE-ConnectionGUID: tUAI1ttHQhaKWBN0gIOwXw==
X-CSE-MsgGUID: iNi97jbVSjWrk6pcLO7kXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="96971955"
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; 
   d="scan'208";a="96971955"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2026 03:35:33 -0700
X-CSE-ConnectionGUID: sEIbL4WSQ82nxDDauLLJZw==
X-CSE-MsgGUID: ekY9hlk8SxGLz364MbXOlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; 
   d="scan'208";a="262682190"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2026 03:35:32 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 23 Jul 2026 03:35:31 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 23 Jul 2026 03:35:31 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.4) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 23 Jul 2026 03:35:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uOCfqFTiK/HfQGClfnjY6HrFtKWHB15vLwCO2Zd7Zk3uIa25h6wr5gcDYGQdJDJPA4wa5XkJ/wpKJ8UfpvXpoRQGJB39sLq0O0Puia8FXuwnb4S60anYmdD1vOJxYUieR/AvwDLdrXgf8mEShOf0O9MjbTFsX7efbw6oKQcpsVE05FCvmltBr42FBscO+mqcmPfDDz4PVIdz72rB16JyQ1wNyMk9vV+WEbKl5SAKSada6klmxUWZVnfq4O6f1x6vCq+dUUXlKSeFmRx//LM0LrqcWCR38uRdKxjooyXW7Rhvm79THkRVoPFn/xZ4WvUlt4/ErIi62gvi/FT10x5v2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IKYu9ICZ6CLbT2BgkoPVUNOIqfVB38OaW8P2UANVK0g=;
 b=JZEr57AhmXVt6sAfxPLQQ+cE2fN9C9Z2tc5CODJ+4K4rzEapfeGwrtPDUnWwA+nK/yisMx8z6Toxy78Y60LYje4sHYwe81+qL2OAmYgY6PKBwWP4x4fl19uDstQOi/1zG36kt8ihgqo65R7/foWW6HSKLxRJoOVvKAmup9lUdj6KZvkvtKB2LcvRt5PkzxuY2HGNshTcg240G92VWSosN71z1QnU/ArjqHXoca62kP7t1bq8leeh3ViQC8VmNorGA5pP4CUyabmQqGAFCNj0C5w/06/WY4jPRq3JJ46PU38KE4VFufIy7pmFroiZQOynHtfUajaC8zZ5p6kSzS6xlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6967.namprd11.prod.outlook.com (2603:10b6:806:2bb::15)
 by CY5PR11MB6319.namprd11.prod.outlook.com (2603:10b6:930:3d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 10:35:22 +0000
Received: from SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4]) by SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4%3]) with mapi id 15.21.0245.009; Thu, 23 Jul 2026
 10:35:22 +0000
Message-ID: <af0860aa-2060-454b-a5f6-241f760bbc61@intel.com>
Date: Thu, 23 Jul 2026 12:35:17 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: Intel: avs: da7219: Remove redundant DAI link name
 allocation
To: Linmao Li <lilinmao@kylinos.cn>
CC: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
	<amadeuszx.slawinski@linux.intel.com>, Liam Girdwood
	<liam.r.girdwood@linux.intel.com>, Peter Ujfalusi
	<peter.ujfalusi@linux.intel.com>, Bard Liao
	<yung-chuan.liao@linux.intel.com>, Kai Vehmanen
	<kai.vehmanen@linux.intel.com>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.dev>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>
References: <20260723093639.2364360-1-lilinmao@kylinos.cn>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20260723093639.2364360-1-lilinmao@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM9P193CA0030.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:21e::35) To SA1PR11MB6967.namprd11.prod.outlook.com
 (2603:10b6:806:2bb::15)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6967:EE_|CY5PR11MB6319:EE_
X-MS-Office365-Filtering-Correlation-Id: cb5cdc9a-b886-419e-762b-08dee8a6196d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|1800799024|7416014|376014|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: mr+v4nBAP4cKEOdgkhrtQWGbp/zp9xuWChQpOSUt9jengRfdv+ONSNQtFmJqBN2QaT8ickkqNPgnSq67SvCc7GoNNzq3UpVzVQhi08bsLc4lA/pRW+3AnHHhnog5ZCqSzA8T0i43RwhlRrD5+iYQ8+/eRTYoZxV8+/zlMn7UMpG1jjvn0tzdzI7a+7UeWffyRuTzxglW/Aw+Pl+S70d9H250N4PM1wFRpIRIGu7C+28ThlJh595JYPA6jYX9TTLyZu+YToJNjZQaKXoF3Hckpa/ij74SNw3En2aZyHPw9RC5IjWFaqHCrAeKp0D0EuNJvdULVWwsUE04lnmi2MNrahL3mjPGq5zLrsVzki4BZ1HmVi0l07p+LDMu7zCykE1QURFDUGQ6eFXAVYhNe+bJaqvHgT279JUW6gS3SE8ABZLLjAhgR/EVrYj1EfjjnC8GFBxeUr7mAMVOGw+YqhZAPOL56Z2S79tjRg6o8eLt+v12d46gn/AlWoytraiMv6aGsYR25xWV3CmQfb81rEFZLd1GkRJ0fjwt2ECPBjY8bA/G2c+HRIFCmXgZl/P/Q5yVEI7ga18vwdj/3AbzHJ+LOmVUcISqfh7fAorXXGbE1U/prFzb4m2Ha81+UcwTjMugpWomRWwqIvjS+CEv74eLDHB3GZDR38r8bRSzjcOFL6Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB6967.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(7416014)(376014)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V3BKRkxpMFNodnRFNGlNR3lFRUNKb2ZWTm1UYmplSzRyUnlrT2xpSFVITlYz?=
 =?utf-8?B?di9QdHA4Z0NTM05ZOFhzN1lpR0hWL3R0OHhZMk5PanpaaFloQm1IY2JjR241?=
 =?utf-8?B?YU0wNkh3dnMxTElvU1ZpUXB0TDRBU1hUcHg4bHRWdDdGY2VGc0N6ampBMVhS?=
 =?utf-8?B?ZXdqMStwUE80Y1BBZnlLRWxQNHVjZW41SWtwV2dTbVZsWkM2bWlETmVublYv?=
 =?utf-8?B?dTRTWjdkQitZNm55bWdvV3FQd2F4TTJJcEJVQ1hjTVJLOXNZR200aU9FcXdp?=
 =?utf-8?B?R0VhNlNNSGxIYno4c0NqL1ZTbkpibjNoVGZtckVBRjNSTDFJajR5ZFpNS2F6?=
 =?utf-8?B?czNwZ1JTSHVyZDdvcHJlY1pzRHd4MUYyOGx0TXVjYTN0Tm5CckN4UDE2NENj?=
 =?utf-8?B?ZWkxUEpYVzFNRGttaFAxVDhZTDJjN0YrNDRmTjBFTzg2SEQ1WTFoQ085Ky9X?=
 =?utf-8?B?ZVAyTm0zTm5OdWdhZXFQMTY5Z1JTd1RqUm8vS2oxRG0ybXd4aGVMNEZrMDN4?=
 =?utf-8?B?YlZwWTFsOGxMZkRTcDVBT2cxeDBkUkljZHlQcjRCYVhpU3FkU05NQ1Z2YlhR?=
 =?utf-8?B?NVBIeWhxR1NNVVRyck9HZnNNYU5wOWV2QnljNnJ2cThaTS9GcWgvRk9jUEJS?=
 =?utf-8?B?RFhrd3kxSHBka3pSQzBjMFJOZytVT0NSQm9nb3J6MTA5TVg3enRMRzZvS2t2?=
 =?utf-8?B?SmczUFMrc0lIa2orUTJIU3ZYQll3SDZKK2JpSEJmdXNQL0NYOEs5T0Fuc0Qv?=
 =?utf-8?B?UDJsemY3TWhVU3FTVi90b1d1cGFiVkZRdHh1QVpHTjQ0QXNrT28xV3RwbmtP?=
 =?utf-8?B?SnBTVGVINmowN2VBUVNDcldUY1NLRy9TWTlDQ1JhdmROcWswemdQOHpDMzVC?=
 =?utf-8?B?TVNMczBjVVM2TllJdUVYcGhjL3ExVWwrSWtjMmtQVVBWTlRwck5UOWJYbWNI?=
 =?utf-8?B?RG1PaTlGYTd0Y1FSNkVTd3ZtemNNajZTa3I4bVo0a1BkTXF3ekFVMGhRRmw5?=
 =?utf-8?B?SXRsNkxIMEozVmU0ejhocXRVdjNLOVdrckhvR2hmY2VRUFNTTTJXNzIyTkgv?=
 =?utf-8?B?MnZONG15NmtlSXRRVHkzNEROQUFvMXRMUFoveS9TYXd5NVVYMjFpTnRGZWRR?=
 =?utf-8?B?cXB4RG0yN3ZjL0crOC9oN0xid0lpQjBmN0F2amY5ZzhjendDZ29wT0lYbzI3?=
 =?utf-8?B?aTRBcWRXdGJDR09FZHBDYUQxcmhxN1N3S01RcjV1Q1c3TjJiVXJPZkR3LzRU?=
 =?utf-8?B?RlZOdzJTRWthWDBsRkJVSnhWaUxXRjdDK3ltT3IydnRBaS81M29Qd0RSWm9w?=
 =?utf-8?B?ZnQyU0RUQlUwc2lRMVVBd0JEdXFNbFdxTEdPQWcxRjFhVzJHMi9wZEorRWw1?=
 =?utf-8?B?KzRhMWx3Q1ZlZ0xKU3B5ZlU4bnhobTdrT3NOZDMwVCtzWldJclRqdnhGejRz?=
 =?utf-8?B?RVROS1M3ZHR2emtrMjAyY2xvVjFxeXo5U0NqaGMrRms1aWE0VXBMOXF3dCtF?=
 =?utf-8?B?c1FzRHZKcEt1enFkUjZxMEFEaXdnQ3p0NStYcFpPZ3lDeE9vMDNDVWdKNlNI?=
 =?utf-8?B?NU5jTjlHNTc5eTZwTHVKWHgwcVRvVUJieUxxM3lIVWdnTng2dWFaV01pOGpZ?=
 =?utf-8?B?NFdWTHhqL0U5ekZpanFrMHpSVis3STVrQjAzQTJ3N002NUg0a1Vaanh6UEt3?=
 =?utf-8?B?bnlsNHhSdFlJT0RLNVpiWlg5eHV6bEozSHREWWZTQk8vdFYrNHcxUlhrSDVj?=
 =?utf-8?B?QTZPcGVwVDJSMXhjVkQ1aFBCcE5GWlFKeWowSFBRRmJNaXc1RGxhWDUyNXFt?=
 =?utf-8?B?MVhkWjMvV2tnUXZXRVRNdlkyYzRDdk5xaTR5WlJXWXh0NzcycTZyQ2YvUVZl?=
 =?utf-8?B?YkxlUEJ5SytlVmNlU3F5ZlF6aGRhclVaZ3VoWVdhbzllTUplbnVxTkJzdFU1?=
 =?utf-8?B?WktPamFzMmExTVhHOGpEaXVoNHpmUzl2NGU4MFE2M3pmRE1UckVNZUhnR3Q5?=
 =?utf-8?B?ZmgyVTJHWjI0cytXZDJqNGtxN2JCcTNiYSs3L0QvandyV0hwU2tjdGdnMXd6?=
 =?utf-8?B?emcreDZLVlBha0dzZmhlU2xDZGtKM280dGhTR1ZlTUcySFliUVlYMkhjeEl0?=
 =?utf-8?B?UGlQQUdQeFNuWFUramlCMGFiUm5ETmFORC9WRFZtS3VRdm1jUlF5bG1WZU9q?=
 =?utf-8?B?cTNPbzFqQmNIZG82Rmc2dEhtc0lmNGEwRnVlb3VWaitlekd6b1ErQkJWTlpI?=
 =?utf-8?B?U0RVVnNzQitjcUdNZmpTNzRqa3dnSXRJQkhoa2p4NDd5Qm1WQ0dDbS91WHh1?=
 =?utf-8?B?eERxRnBIaEhtU2hFL3Q3VzBYcWlYelUvRHE3a2pFbVB5V01pSHpFeDQ3NFo4?=
 =?utf-8?Q?RERvYc+q5JcwMpEw=3D?=
X-Exchange-RoutingPolicyChecked: VcSvanqlZSwldjr/QixwN6UdEdQJ9cZREfB4ZDeEazHFn8GyOqp8dTtYgUVYwwfmqDTKCDdfZRq8Wv7dk+apQ+FjUpq319DFWOsxLkQtmWI4IJJGtc0ohlWGVXSvbkCVrzqlc8qc2xEjgYhhUBG3Bdd04n4gu7t5ouArMA9kcHstIzBENuIZ0ZCvNEKYr/edQ+BtHzWgHG2j5gw16B4gZE2A0h87pBAJOjztaKrR/wVUMDH8bDqqTTxyz+r7nyXhL60wDiOKoGbANM8uLdWD++xcPKJd7vljj8zzsEykn/n69gdUhyVC+YpPwVSGrHrSTa8eDrkQ8REiablwnvr4cg==
X-MS-Exchange-CrossTenant-Network-Message-Id: cb5cdc9a-b886-419e-762b-08dee8a6196d
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6967.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 10:35:22.4151
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mFfpv8LM0vaKMqM2W8+1gncpA4pL7BwA6/rm5ySpxjvh0VigyhVzWqOQkd6yBDpPVhpPScDskFpFVSG/aPRQ2PNN+dGMeW6Z5KQzbH3YlYs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6319
X-OriginatorOrg: intel.com

On 7/23/2026 11:36 AM, Linmao Li wrote:
> avs_create_dai_link() assigns dl->name twice; the first devm_kasprintf()
> is immediately overwritten by the TDM-aware name. Drop the redundant
> first assignment.
> 
> Signed-off-by: Linmao Li <lilinmao@kylinos.cn>
> ---
>   sound/soc/intel/avs/boards/da7219.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/sound/soc/intel/avs/boards/da7219.c b/sound/soc/intel/avs/boards/da7219.c
> index 2b17abcbd2bc..6cc8a6618fa1 100644
> --- a/sound/soc/intel/avs/boards/da7219.c
> +++ b/sound/soc/intel/avs/boards/da7219.c
> @@ -175,7 +175,6 @@ static int avs_create_dai_link(struct device *dev, int ssp_port, int tdm_slot,
>   	if (!dl || !platform)
>   		return -ENOMEM;
>   
> -	dl->name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d-Codec", ssp_port);
>   	dl->name = devm_kasprintf(dev, GFP_KERNEL,
>   				  AVS_STRING_FMT("SSP", "-Codec", ssp_port, tdm_slot));
>   	dl->cpus = devm_kzalloc(dev, sizeof(*dl->cpus), GFP_KERNEL);

FWIW I've scanned the series [1] which introduced the issue. Looks like 
this is the only offending line. Thank you for addressing it:

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>


[1]: 
https://lore.kernel.org/all/20231012083514.492626-1-amadeuszx.slawinski@linux.intel.com/
