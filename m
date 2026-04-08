Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF5B38E5CE;
	Wed,  8 Apr 2026 08:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775635666; cv=fail; b=ufh2btv2maMllzlitN7gbbt93xH1iOkaYgatXA5F4PtLkXplCOv5W34TRtFVErZ0BQE8UyCtgkaQb2UXWgSW8YiIGGbgKALyoh615f0S0CBo0DVh01vFjqQcLl8/tV4R4d3hLkZuCklE8t8DMMss9XWdqcbhjGjW/F9T8NIgGh8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775635666; c=relaxed/simple;
	bh=9LzSxN8FaQORLbPC0awQpn0neO2TEFsgtbKnG3xpw3c=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=czVcamJOuYbb4iA6zx+F0NEv9m8hdowwKykAeD1KFGDxy3oxlePKkxHDXBPP7XePvZNT5UAUmrNt/3fjdwRRGkp9Pah9Hx1YuzD5SGG9l7P0d2d+aaK3gGKcQzGjU+igVgyp52wKqM/IPkQSnC2krfq77tMmrwBeZ4/8FJpOnik=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jZ2lMOVr; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jZ2lMOVr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775635665; x=1807171665;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=9LzSxN8FaQORLbPC0awQpn0neO2TEFsgtbKnG3xpw3c=;
  b=jZ2lMOVrJAkxLTob5tFIozjq0Fn5E4Ce7o1YGdFUiQcIz01uw1x3qeFu
   zRSS9FOFBLx4t0Puk4GvA8FZ8yqjiGPQlkIyUil0sMrbvc9XfqEJvTTo7
   0fAb+kuw+whXHYeYKSL6SB2UgsRnc6TSdEc5DDKFKlrkPkybRUDpX3FcV
   qzF4Ac1YOOnb1/iByRhMCG9MfqgmCeVmFoWyRpfGAkT5aLmiODWZgH1n8
   RJtHQGFsj1IB2j4nx/UgBmToDU9mW1wUHiAXMLhwgNszdy+psPTUUBIdA
   chpp/YJxv1eIJH0FeYo+GQ3gyvmVBeAFUMw+O6emSnaJPSdWCCVtwj8xF
   g==;
X-CSE-ConnectionGUID: qetbEgjVQkeAngS95wcosQ==
X-CSE-MsgGUID: 8pbGuZhpTBqgrjwvt9vQIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="87310677"
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; 
   d="scan'208";a="87310677"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 01:07:44 -0700
X-CSE-ConnectionGUID: LvRPKLX+TC2KrOi02sWVbA==
X-CSE-MsgGUID: DuhrIUv4SwSTqZEDazRnUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; 
   d="scan'208";a="233353647"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 01:07:43 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 8 Apr 2026 01:07:43 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 8 Apr 2026 01:07:43 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.5) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 8 Apr 2026 01:07:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=heaEQIWV6VrVzFHufNkCDWPhojMP+bvyk6kMOrlVVxncXWUw2XrIL0cI1VE/AVXLYVvl4KptZezHPZzzwfGDxUEXgkV/h1rmie3bMZdoSML5OIz8NA2OrGvd+EuXLpRpBJyjMOyiwSqlb7RfJzeM+yk9XaMtomAYiKSy5+Jhn8bOTNyrtnAQqihUKAHnnQYHLH103DqKGK8gx4RdTJkHnE7uDQhnwKth24K1p8uSJ1QLScq4FFIh77pfJ1Q2a6Vk+se2NaLSOeovvGl7X/FMfw+7v87hQGi1l++QBS7OFKJusEDHm3iHCqEwetv8FrnJfemV+nXvdXwZm0ZaNYQcoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EcXt0bA46hJljT/FI8JvEbGfMRefmicSDj/vwMOQ9LQ=;
 b=gIzz/EXbWjOZn9eeEkBz++i/rn0o1dwii3+B96e6w6mYqLi5PJdDO1SbsW4TDfyha0qyTIbMyz18oqBFM7WE5SxsClLal1SgDd8TgVj2L0L3lcDV2p0ptaS57pifjlldbyuR2gbf1DhT+KibkPNZ2Q/9odwUUgZji7mc8g57btexW/VC4DBNtrRspmhzBkB7+iOeHpdcbvOapxmQlqY3gbPSwPTFNTL8m44vGdQnrCDwftKrvKIzx4YBx5k1dEg+Uioi6ahlDYzcKVeN13RuYCR8Gjok905th7Gb5mm8n9VDjCZBS0sXVN6NdFpkeFrGuvesUHE7/iOi4g3hy1lzaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6967.namprd11.prod.outlook.com (2603:10b6:806:2bb::15)
 by DM6PR11MB4755.namprd11.prod.outlook.com (2603:10b6:5:2ae::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Wed, 8 Apr
 2026 08:07:36 +0000
Received: from SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4]) by SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4%4]) with mapi id 15.20.9769.020; Wed, 8 Apr 2026
 08:07:36 +0000
Message-ID: <08462a39-61e2-4125-957e-9454751b011e@intel.com>
Date: Wed, 8 Apr 2026 10:07:30 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: nau8325: Add software reset during probe
To: Neo Chang <YLCHANG2@nuvoton.com>
CC: <perex@perex.cz>, <tiwai@suse.com>,
	<krzysztof.kozlowski@oss.qualcomm.com>, <dan.carpenter@linaro.org>,
	<linux-kernel@vger.kernel.org>, <alsa-devel@alsa-project.org>,
	<neo.chang70@gmail.com>, <kchsu0@nuvoton.com>, <broonie@kernel.org>,
	<lgirdwood@gmail.com>, <linux-sound@vger.kernel.org>
References: <20260408052639.187149-1-YLCHANG2@nuvoton.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20260408052639.187149-1-YLCHANG2@nuvoton.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR09CA0183.eurprd09.prod.outlook.com
 (2603:10a6:800:120::37) To SA1PR11MB6967.namprd11.prod.outlook.com
 (2603:10b6:806:2bb::15)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6967:EE_|DM6PR11MB4755:EE_
X-MS-Office365-Filtering-Correlation-Id: 73715c04-f677-4abc-afc6-08de9545e516
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: U+LPJoy3Kmb4nSOM1r4ORvRcFcRTDrcqm4KgvCo30obazLvI7gBJkoXDBkhn8zlNLZp+BpvbALv3alRwI5v8OokEixTDMZtABBw6tastEXAXoaW03bJjfYIbjp2PfBnO7qavMLmucqNj0W5CFCh4orIwRnYmf6NKROKp3GGafpzYDEsv3M/fwEdeEQkhZVcr0eITtV5kZTqlrG/L2FbV9EPzDGeTf5sWZrGyImCzcPL+z3/rsXRvzsCWBWY3ldzeKniVHEj67B353tk/ZqZ6dw5yeVtBgQogCT33YdWwyvmbOHUHxsh0neSkELBtz7WAsXEsjMKphn2eiZU0tRKfWn8EJsLBp+1drQUo80OocwbOruMJniHzCnNMQZT0KvasWXKVSR1ndIY8TJtCtJDznQk4G10qdncVtQ1REI1PIJLZawdQXYm4H5lic2UmDjEXsWLqTgP8rGEnjQoi9jIMx6Ymwrt2qVqfUINg22Dfr1R5PBftfftLEsNDD77NlMCWPcV7lgNzSEbg8vTrYanZeCNavGk4o71qC08cIA7I5LJEFeCSNqpWxTFnA5uGP1qfpIXCYJ2qZ0K9AX2MpNZBaiqcCHTnaJKx7a1/xqWeqQWhON+5dty3MPhDOVeltL5RErjSZYimke+xr9SOgjrpRcX6uef1gUW+Hd6Uj6SZXxZD7EJ3HiQJ9pdzvtXgnEm25/+lLSeHTTN1RxGu9ImPkTEO5lBS21wjHDeHKwPi6qc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB6967.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aEVjZiszMzVIT0k4WHNrTmIwNFZMeTNCTHNBK3U2WFIxbWRVMGltUzRhcmVI?=
 =?utf-8?B?UXZTcVdFMFZ6S1JTTUNsZTlPeTh6OWE4c3YvN2Z4UzVXY1BpNnhpa2t2bk54?=
 =?utf-8?B?U3QyZkV1a3V2UnhBdkhNZXMvSTk1YktZVHMzeTN4U21lcnNLdVlhMFZLM1Ev?=
 =?utf-8?B?cHlwMmRVMDV3NHR0b2N6Vjdud3ZkWVRNamhlVGhsVzNKOUxRZTA4cXIrcncw?=
 =?utf-8?B?WFUrbDlZNllQTXVDNi9GdFVrV0E3QnRkZkhPbkNMU05KaFNNVGoyRkpscUlK?=
 =?utf-8?B?RDAvdEhHVm50S2FYM1lIYUtMT0k3c1hwUDQvK0ExZTd4Vk92Tk13T1pGcFZp?=
 =?utf-8?B?NUxsdnQ2QmlYc3pZeWtVKzZPU0gyS1lhQkdZSERDM3Y3Yk1udXRHWjN1MnU0?=
 =?utf-8?B?SkJTZUNMSWtNZExwbGJMMkp0QjdEQytWVllJUDVqZml1YWk1R1JFYzlubTJv?=
 =?utf-8?B?czBmbkZhbkh1QjRFbzRBVEZUd2ZzbTdic2NKYXhyUWhpcVRWVEMwMkxQS25Y?=
 =?utf-8?B?U3JKdEdaUXZYY2cwMEJ3aHNiRW51aTlRY2NkS0ZzK2hkTmNpTzhNVFpXVncw?=
 =?utf-8?B?cXRTOGZxNmtPTzhtM2o4bVBxUzhnR3hEaHM5cEFVNUEwRlFwMXk0Z205M3RZ?=
 =?utf-8?B?azVZbDc3dkkzOU5YS1R1MXhOMGxTTzJLbUs1RTVRYUlNOUNZNUN6a0pSZ1JY?=
 =?utf-8?B?Z2lhS3NJMUxZbDhUM1RLamdUeEpBREpwcmtoMzNCV2Q1U1FtSFVUOEp3VGx1?=
 =?utf-8?B?TTh4eXFkNThld1FTNUdGbmFvMVU4UjNCUDFjWm9TL1ZXZEhYVXlyZzRNVng4?=
 =?utf-8?B?cTI5Z3RiVXpyRTB3dEtYTWZScksxMERBVFVoTXArRU9KVzNnU0tDd3JEVU1X?=
 =?utf-8?B?OHk0Tll0eEg4aEZlZHF3TW5EcWxxVmFJR0w0MEt5ZE52OTl4M3EyN1VJMExC?=
 =?utf-8?B?alBHMFFOeFdOdDkzNlJaRis2cncyQkJVUXMwUmJUVlNrYkhwZzZJbEtrWGQr?=
 =?utf-8?B?c2xOdFZnaGR6ejNUbmpNRjJjdG5Id1NWbUwzTE4zMk8xb0tma2x3Uk5QNXg0?=
 =?utf-8?B?MlI1TkZqcTlRZDd0b1hBY2Roa3ZQWlQxdGhkSGorMERPVzNkSU0rckJDb0FG?=
 =?utf-8?B?MjF3UGZ0eEZDZHhiMVFxZDhRWTBMYXVxWFBsK3RYejBWbzhPcnlJMktLNWJR?=
 =?utf-8?B?b2RFemFacUd3aG4yTTNidjNlQUgwRmdKYm1IdXp1NVMrRGlEOVZxMVQvd3dZ?=
 =?utf-8?B?b3cva20vRHh3cldqM3dQL2NjNEU5a1FzaGhkUUdJOHNPYVNuYUpKeDlyMExl?=
 =?utf-8?B?ZzN3eFRJbzlVa1NvVDZsWEV5akpyT0FzR25KamN6YzQ0R0FkbTVkclY3QXVw?=
 =?utf-8?B?b3diTjJCcm5nZFBuOGM5cFF6TWNpVjREc2MzVFZsaXVtbndhc1Q5MGJiN0du?=
 =?utf-8?B?V2J2VUNHS1ZNZ1VnMm8wQmNvZWpQbUhEb1VFbXFMTE1YNGlCZml1NU1DTG00?=
 =?utf-8?B?OXZVTksxRGpGbGM1cmR3djA2OUtOZ0RSRDNHVkgrbGNHWFpwUVdmVEFkMHJk?=
 =?utf-8?B?eEhnMXBpZ01HeXZSQnRBU2FYYUtqSWF0aUxVVE1mc3lONlh6Q3F1Wk1MdFFL?=
 =?utf-8?B?OHF4cVZpa2NOQjlobzl3eEJQaWFPbXVRZGRzUm5Xd0REWERFMjRFam9XdVdt?=
 =?utf-8?B?SlY2dTA1MHVveFBuSG5GaXhwOWFpTnhpcGV6Z1BpQ2c3SWg2b0Z3RGpJdFpF?=
 =?utf-8?B?L2NTaFJKQko3aGo0MzBPODFrK1JvUjdBWkRYVXRNbm01REFaelN3THZHWlEy?=
 =?utf-8?B?dXVuTDA3WnhmVTJJNlZOandGYklSQmsyV3Y2YWx5UWFDV2JvYkh0eTBocjV3?=
 =?utf-8?B?b0pGWlBNLzNDSEZ0UXBiUFgvNVVpQmxlOFV1OWhISERzVTErNGpHeCtQV3Y4?=
 =?utf-8?B?S3N3L2V2blllR0Voek9Id0I2SURxNjJMVWl4NFBEbTNCeGY3QnNmL2UwT2hl?=
 =?utf-8?B?MXh6WUYxSWxEOG5ON1pBNzQyN0cwQmlpaUJSZ1lBSmhTaEVKMU0vc3oxa254?=
 =?utf-8?B?YjYxd2pJM2VENHgxd0JEeitDMEZZcnhmdWtIT29vMzkySzBld3FqeS85M2tU?=
 =?utf-8?B?WW83RjZlNzloS25CSUViaUV3THF4RzlDZmQ2WjQ0MFFtOXpLNHNER2tVWmc3?=
 =?utf-8?B?aHF0V09WcGRJckNNOEE0VkNvMitSWW5MMFl4cEQ2WURVQzBoMFc3OHU2MFJN?=
 =?utf-8?B?UEhJMnB0RFQ0c25ZVjdsTS9rblJESElFbGhHNzFhK3hQZk4wSWJiVEppTEpC?=
 =?utf-8?B?WmpHWjFrUkxDajdRblFwdkIrOUdFSGFxQktySkVEU1NRWG4vYkdRQkVOdmJk?=
 =?utf-8?Q?GBDd2IdRsnc4VKFo=3D?=
X-Exchange-RoutingPolicyChecked: lZyFoeIjd3qQB+kdGpkdYXcE9oEFTlig9fmCFSY8zyqAXyw0T9zFYIIdD05PVVoHwtd8lCT+Z4sxi2i250O/KCipvIqwlO+vAeJqJMsM2jT4w4vgdW+DT8/RjTu+e6KEpDNjg475MQpgDK5rHTtE2/EW9ZFs04ADlN/zcAknNUqXOu0DBa/+iPN4vHcvbf+5eI/GPnR8Xyad2hFNliWrTwptiveCcHe7Le/5dP5mV1LH2PdYyJI6fBGdE0UX5jcB9iegaNHrw47bY0JjHKzgbsBiN+Y5yYGzHYqx2ch/hBGC3cHJKIv6+y3YkXiC6Uh3uVlXQfjI6zqUTtQ0b1BX4Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 73715c04-f677-4abc-afc6-08de9545e516
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6967.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 08:07:36.4377
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jnSbI51aE6s4M8Uq+XAPxV7/OjQpvH66RQeDuW+beQkBhqGNpKVnqDEiIxpIZXYxXFe5Ub19pqSnZJf3xxqO+qGxgFQI532oObn2yBJLrsk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4755
X-OriginatorOrg: intel.com

On 2026-04-08 7:26 AM, Neo Chang wrote:
> Currently, the driver only performs a hardware reset during the I2C probe
> sequence. To ensure all internal states of the codec are properly cleared
> without affecting the configuration registers, a software reset is also
> required.
> 
> According to the hardware specification, writing to the Software Reset
> register (R01) twice will reset all internal states safely.
> 
> This patch adds the nau8325_software_reset() function, executes it right
> after the hardware reset in the probe function, and marks the R01 register
> as writeable in the regmap configuration.

The first two paragraphs explain the situation, I'd say the third is 
redundant. Not a reason for a resend though, only something to consider.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
