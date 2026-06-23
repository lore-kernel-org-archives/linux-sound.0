Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 782A41C01;
	Tue, 23 Jun 2026 19:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782244613; cv=fail; b=TOc10T475l83W1e6dDgcrOgBgSmQ4BkMNAzACzTYzE3x6YWgvlHwyltQHyZLAgd2pFza7VS8jDNzC5t1lNhOMaED97i8SvlnBOYpo/JoGQaxzAkqRAKIJUJg4oiGd1TYQpGj25N3wcExKrMoAk08v+JbL13F/26nAjwSz/e4mAM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782244613; c=relaxed/simple;
	bh=BqaXX8a44UG/EPBFEC4aB8QJjqUMWKxEGSspkAGeS9I=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=H9lRV1R5dWNfCW3Qpq5sjeeshk84v1npElHuX/QARDXiBqBNrSLRgUqCc07lH/8lWkfOb0g4iQ+x6s2AOGmX5PevpxhxUQI8ksztEyDX3kMA21SOLJ/U+/oU1w2q92eXy2I68ibadyQ7RTnSb9G9Fvx6qvT4AZxPArZDTOa0pvA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WlyoHzYZ; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WlyoHzYZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782244612; x=1813780612;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=BqaXX8a44UG/EPBFEC4aB8QJjqUMWKxEGSspkAGeS9I=;
  b=WlyoHzYZhAfLqI84SiKL7E0KvkKZk+oSoSouiDdofDArXi+KAORwg7et
   YRt1BJo7WdWfad5YhJ6MqiSvha/rNyiB789kejVGaZ07M4tdyLaXvnY0N
   pykL7OvDMZ3QYcTG//+7Qi/xTFLS2twgk5AYHByPcrcOwDELw4DYCNSfq
   Nj6FyS7W5fbhflzpppgK7l/6Qal/TehSNGunu3soK+zZdvFOc5G8sh4Wp
   geXyyz6R4utviGoxf5jL7mmdsPLCB/CT0eJsbBZGyqLbQqMTXqr/TUtUQ
   xsU1Bsub0Q4iSz6LwQLOC0CzBUkE052FLwgYLp8oBI9l28PP1FEF//Wxo
   g==;
X-CSE-ConnectionGUID: NZt1jXZOQmSUFcmmhIwOiQ==
X-CSE-MsgGUID: JdUOJLZ6TuyHlEBhxRRXPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="82867353"
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; 
   d="scan'208";a="82867353"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 12:56:52 -0700
X-CSE-ConnectionGUID: EazqxqPSSvO+/sQRV46poA==
X-CSE-MsgGUID: VnwH8SZxTlaw5bl/huESzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; 
   d="scan'208";a="253485393"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 12:56:51 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 23 Jun 2026 12:56:51 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 23 Jun 2026 12:56:51 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.44) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 23 Jun 2026 12:56:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BRZiR98a324XzaaniRXXv44LrHBerKYOPqxensHUcPPPcvTTwpe/c/w0gZL9rAYZcgilXHkaHccSVhy4L+A0KWL+6KbhEkfS4VQr6jcon2lYi937E1X38VTXZxXflYu4Iqvd8DXmDTeZ31lNyUPqm9JEiwEBL91Q3TohWPKh1yBZGncA4xHdbglhrQ51nlRFCp/HjH+oplCFsN3+FHdaqyKicZ9RljGiysFsSeBLIryTH1l/66gsfr+09/sFqQCkNW/q3a7hjL7kSGtf7tLgld52EmaeUhdoq9bSpDq7tw3JXkjULqQ/2Frfi9VkwWGhsb3kYVQbbLT0Z+yt5LzjPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aPVaF52aLbv666myo4qgRvhtDAsDjlfAj2mg+fwY8LQ=;
 b=ZHQwXDqBSoDLZjqlpZE3LmNl1t9m9B8JojKKtjfpAc6vicqD++uqh9zOEknhklh/EoThjC0vbMt3sLtgdaubYm7CSgETiDxcSTNRR98FoyUTLKBAi96yubjsVws4r5t6MNUaiAAEU/p6q8FfqKaDIkcjv+56T/O3lNOH78uKMok3z7glQhysDq7X5tDb1NReDN+xB/vJhOnj6Gsdt0D4BcHXskgnVN1pXlOhZQL+TrfT9pV6gqN9XZ9vjAQX/JeOvcBgG/Zb9guC5sKW34Hve3RvjGKI/1iYrmzwuPsoaNjvksoUK0oa6T55kyhLEvLB73djib9SxbqnbiNiPatOWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6967.namprd11.prod.outlook.com (2603:10b6:806:2bb::15)
 by MN2PR11MB4758.namprd11.prod.outlook.com (2603:10b6:208:260::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Tue, 23 Jun
 2026 19:56:49 +0000
Received: from SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4]) by SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4%4]) with mapi id 15.21.0139.018; Tue, 23 Jun 2026
 19:56:48 +0000
Message-ID: <b73445f3-899f-45f1-b450-8031044b5ff7@intel.com>
Date: Tue, 23 Jun 2026 21:56:42 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] ASoC: Intel: atom: Use guard() for locking
To: <phucduc.bui@gmail.com>
CC: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Peter
 Ujfalusi" <peter.ujfalusi@linux.intel.com>, Bard Liao
	<yung-chuan.liao@linux.intel.com>, Kai Vehmanen
	<kai.vehmanen@linux.intel.com>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.dev>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>, "Liam
 Girdwood" <liam.r.girdwood@linux.intel.com>
References: <20260623105721.25865-1-phucduc.bui@gmail.com>
 <20260623105721.25865-6-phucduc.bui@gmail.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20260623105721.25865-6-phucduc.bui@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR06CA0223.eurprd06.prod.outlook.com
 (2603:10a6:802:2c::44) To SA1PR11MB6967.namprd11.prod.outlook.com
 (2603:10b6:806:2bb::15)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6967:EE_|MN2PR11MB4758:EE_
X-MS-Office365-Filtering-Correlation-Id: 95d2368a-f3c1-4110-c267-08ded1618f7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|23010399003|366016|18002099003|22082099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: KDv+NbpQmqH9It9TC4cDvlA5i4oiRZAsRHdJiE4vUKFLcUe0eHiDzCb+tf7qxUbmue1tsmSUlC5HaHLeDjAjtcCTDHGQaYwkZNs1Ge0+Im8360yfdFXOxGL8ZsCUT8qzY7PunuDf9+ELg63G7tXp5wIsIutPPx6DG4DyF3p3MOo5UpX6K1/jBgi3bYH6aKrpfZIZrmk24i3cYXYPyyrLZOc/aQBgxQyRQ4bysYaLphOVoBNvtVT3JWpWTV/djtkVLp4RpKaViT6As7n1KPipxJNh1yKnvuTWRUucJHo1tDZ2hbin1/TRlQHDjl+FpLvTk4Ko3hi0C8VqmH525CWEcnWMQKjiDpRktDIhlKJUfOrCtXMwBz+5tid/1ptm10YiKvtWWq7Sno6KLmKmnYMlLlb0n9iQC0Bf1Wjp8onjVEM9UAPicG+6roV1iNC0HLMNIOg4p/W8rg/GIpKXhR9xoUbxO4+whaCNv6tNGTymkBbD9ycqT55YxSNSL/5g9oTqGuImUIC5CXQEWjr6MmNBZe7s1H+Xj/jfZZ+Q5F1ulSPxGk9nkmS17M1MkF1bzr+iK4We1QRNFYtZc+JM3Pw2pY2HR2nDJrtwh5uIhXkXTjnhOKdmTiwc6NGeuWtubE5WHJoEY1Fj9KoIKwnQKiV9JZTPf7t8WWw0dbAJGFAGElU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB6967.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(23010399003)(366016)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OWdNZVpXbk9hL3N2bHRPU3IyekRZaWY4TnVESEdKR00ycXFHQm05MFlmQitZ?=
 =?utf-8?B?ZUJ6K0VManl6VVBjNXkxZitHZjBjYXFUbStxRUFoN3dDMlI4WjNkOXpabUNX?=
 =?utf-8?B?elpSUDh3RHRKWmxjK3Y4RnplRjl0dVdrZ25LaHF0aU9VL3ZaaWN5cUsxRys1?=
 =?utf-8?B?MytteXhhZUJDTDU4S2ZIV2xmclNSRTBIRnEyMFZNbS9GSDd5T3VzS0NhVUFS?=
 =?utf-8?B?NXZaT2NXYmhJQ1lWYkJRWFVKazgwbFR1c092cmN6NGMvYmdoekVZd1pEN3B4?=
 =?utf-8?B?N2xMNkFQK0xmTW9FUlVxMGxENklINTR0dzRIUjdQejQ3a00xTzNiQmk1eHF0?=
 =?utf-8?B?Rjh6M0FZS1RqWkJrb2dFNDZrR3I0UThONEs0eEZYeE9Pazl4R3hDaDhnVnpq?=
 =?utf-8?B?cDJNWXl2dEJjY3JGV3BEdHZJUU5WL3NWSGx4SEJPaDUraGJ6UVZOT21QeVZI?=
 =?utf-8?B?cFVFcng2aFJGUUpON2kxem1DaFowMld3Mk1aaFFjOSs1dUd5NUg1WmJMZk81?=
 =?utf-8?B?RURYakxtVkU5M3FoY3IxMXhGWUtDdVhvdHBiR0JPSFBSUlJPY1VTeFFhSVM2?=
 =?utf-8?B?Tk00VVg1bkxmS0VEOHd1T3BGU21qMWNQYjZMamFOYlFycThvVUQ1M3l6Vjg2?=
 =?utf-8?B?S3pES3dCdXIwQVlpa3dFVDhJRUJ1Y1JHQ1plUjROcW9VdTZTL3lFYytaaHNo?=
 =?utf-8?B?UDloaG5FdGI4dmJOVHRZc21zNzNTc1c2TUlzdEx1MitKdDFReUxDK3dmdWxQ?=
 =?utf-8?B?ZzI1TVR2dVpjYUw0cmFJNzI4ejErZGp0cmhsL245U05ndDBhamdKc3RLSERM?=
 =?utf-8?B?b09ZZmpJbXJiOFRud1I4dWlOR2t1bGFXcVVMb3BIVzQ3V2ZWTkw5eDAyVG1S?=
 =?utf-8?B?WHl4QWtYODVSWmRMMnM4Q2tTNFhxeG9zRlc4VVEvL0JkT2l6RU5PclorRHpt?=
 =?utf-8?B?Z1dGaUJJNFMvRjFTRnJLT2FPZjZYSy9Wd0ZLbDZpeTBIVTdTRWRBTHJSdmI0?=
 =?utf-8?B?MDh4OWVVb3dtVVJPQVo5K0ZzeWVYMEpjWGVrRk5qQVJhWUlWajNST28vN1c1?=
 =?utf-8?B?U1lwZnR2V3pUSXk3WXF3RnZjZmREd3ZCSkt1R29VSE1uWnVzYkgwM3BIcWpk?=
 =?utf-8?B?RHRxaWpHcGJUa0VpTE9JdEk0aU92ZVZzVzZBbFZkTVFISkQ4d3NxNGo3N04y?=
 =?utf-8?B?amFaMEhieWNZRXZIaVhLVjFjK05Pa1c5a1NLelJDbHFicVBOQmMrRmFzU2kv?=
 =?utf-8?B?emVIZkJmaTJvOGY4Mk1OUE9TT1JqYytkNUswYjBvY3YzS2xqSEZRMUxoNDdB?=
 =?utf-8?B?cXZ6WU04czE5eFRZNWhENHovL0ZSRjhUWFV4RmdNaDQ1K2EwdUtaNUd4aElm?=
 =?utf-8?B?OXJUOVBJM21wWjhmMFlidEEwV2Y2NVdaVi9wcWMvaWp2eVlreUQyQXhnU1lR?=
 =?utf-8?B?elBSWXRCQ05TNGQ4T3V5WTIyTTRTUUhOU2IvSmxWVi84L1RSd2RQY2hlTWF5?=
 =?utf-8?B?SnZQUmpXOGpZOXlLWWQwRGN0Y2Y2WDdZZERwUWRjWWVlVUlVMGtvQmQ2ZVBi?=
 =?utf-8?B?eE51bzVxQ3BvRldHVEI4R1NiMC9MOHpOT0t6ZzBWMWpFTDNVMmtWc1ZqMzRW?=
 =?utf-8?B?UGg0aUNyVmJtaXZYaXQxdGRGREhjMGNKbFBIYnl0V3ZLL3R3RUFuaTFzeXpw?=
 =?utf-8?B?bENkT2FZeTQveWw4b2RGcjZvcDVpeDVPdjcwWVhqOWlPWTd2N0hFS0VrVzcv?=
 =?utf-8?B?L3RvZTMrV0cxZ0VWam5WRFFHRmJBTW5mTTkyd3FFK1dCZzA0UFVtb1QvQlVI?=
 =?utf-8?B?Z1ZIaFJJeGFjT2JHQ3B6NzI2YUFJS1FtWlVWdlJUQXZTdlNtaU4yMmw5WDVC?=
 =?utf-8?B?eW5IeVI2NmVyM2tWaGRwUUc5bU9rdkEvR3Zvckp5MnhXSXVMYWh5dUNKYlhx?=
 =?utf-8?B?YlZCbEc2U0kyc2t1SGpWN3BIVkpWSXY4dFB1Q0Frcy9RSFJ1T1o4Z1YrOUpa?=
 =?utf-8?B?aE5PeGYyZHBDWXFKS0VtVFB1K3k4UFA3dW84RG03TFc3RmRMTUhFK21yNW82?=
 =?utf-8?B?c1J4aHQ3ZzJlU1F0L2RIV2lETVM3K1BpTGJGTm84ZzRQcWExVEFPcWpVTHRQ?=
 =?utf-8?B?aGJOUHN0MmhreWxKYUFkdU9vb0I0cWtUdlBjYW9FK2FabysranlHUVFDcWdK?=
 =?utf-8?B?d0R2NFhjQXVTNENMdThmeVhrMVVaWVlDRmhPNnBvQWp1UzFPVFJSNnVQb1FP?=
 =?utf-8?B?Y1h1Y0pIb29sbEEwcDcxMDhZRkUweHRGQU4zZE9TRlZIVU9QN3RoV2U2bEZS?=
 =?utf-8?B?V1dOV1JBemZwcFRmUTM0YkFIUmFaME9sNG9nZGdILy9YVUNPTm1xdlBGV1BW?=
 =?utf-8?Q?8Z6xDdRMsFkkIOwk=3D?=
X-Exchange-RoutingPolicyChecked: FT847ou+QERc3cMykgOCsksOZX5P3DY/96RK0hYiKKF66tuMocVNCxxdFNYGojg1lqCzGXHUQ0obS6mAYfYPcZ1ie7unbBD61hfFGsAdh3RIQ7COiTb47snxIJWoafFnTm4+3g+V7Lo1tmBP9rX1FIIoQaJ9buXNahUdQzyzZkwT1T0DB7NMbwmEISQ015TylZMYgAQ1Z4eDPIRUvqcSxBDkJhfK9Qz+qBcdCRpwOj713lS1NBXO2g+ZuDA45B4tpnTQsS2qU5KImT03WKOgvYDVKroRLBlEPPXdiYvssOtyKCZgsY9w2uYxy5lLVA68ZhYDwdfqKSHIvFKDlJ31Lw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 95d2368a-f3c1-4110-c267-08ded1618f7c
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6967.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 19:56:48.5393
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4eWGZ/zTUo6SM59wNh3NeVTVn37xAYBiW/7C1YE6NCdI4TNYWJGYvb8ZRvsFNe/YKt0Lq0Rqzay1TcmDR6o6iN/HbcJw80aUCUI2PWsVTsw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4758
X-OriginatorOrg: intel.com

On 6/23/2026 12:57 PM, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Clean up the code using guard() for spin & mutex locks.
> Merely code refactoring, and no behavior change.

The change looks good - just dropping by to mention that the cleanup.h 
is missing everywhere : )
