Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 920593AC0CE;
	Mon, 30 Mar 2026 08:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774859235; cv=fail; b=Ybu7G57Vzwy+ywwyYhDgxJPEx/v3Fv7mGklZVWYAoQTEIRjhWyhcd0FBhJIv/WxjBQUKkFqqrzfY8Eg66DTvmh0u2hg5/P0FEiOA+onuoqAFpX1ZskQpz/rzTpjWkCtk6AzvC9EtNuMgVeWNXOPOwNYX97yZEj7HO1tWBTETKpM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774859235; c=relaxed/simple;
	bh=a6hfeyMk4+f1kJgzcBW1xeOb3SjyUH/st6zlc+1v3lE=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=FIKdFoW40UlcywzovQI4FT91kbs3/qniOwIm74cf732CNrSC83JHcTGb3HONeqv5lQElEIC9TFuXQAGoU7vCaJtWx6ruZqpGVK/knCWckA11r1MDeZXVove1vCzqiNe45gMLwLn1Ev71Gao/RWejw4Z92vST9vgT84hYdHZz4t8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l1UX1Rik; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l1UX1Rik"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774859234; x=1806395234;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=a6hfeyMk4+f1kJgzcBW1xeOb3SjyUH/st6zlc+1v3lE=;
  b=l1UX1Rikg585r1bc1VFbJCC3Hunn80SHuncEqlq1Fo6kmoBEpOzlJN0C
   YfH26nnAYwvadaO2Xt8R0IgMrVIC3suPcwzCkWVNIrf5Fn5EGFgSLYYDH
   isFf0A4rt5RoB9A1iFzyopgy7X5JhVzsLJ4v4D/6ujjjdYJqi5gwBLLDE
   Q67LLqooPul4dLNoMnaUr5hAkKtl79HUAxhViFP9Lqmk6DrBceW6lryMW
   YFgUKrbDS6XnoLRVas8pZ0gRjMxhs0djqWafoyh/T/Awz2nPHod0aI71Y
   YX2TVghw+AvEPaLhvpqeOEjIiqwM6FKJ2q48aBHcGUF2YwKODTzza/ia9
   Q==;
X-CSE-ConnectionGUID: g2cFDVvaTd6Wzh1zYIdVJQ==
X-CSE-MsgGUID: opVnc+UBTaSNFK0mWpS+UQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="86918287"
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; 
   d="scan'208";a="86918287"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 01:27:13 -0700
X-CSE-ConnectionGUID: GetmuWDpRuaLpwr/ZgsCpA==
X-CSE-MsgGUID: pTaYh2YHTm2AQ6IVeaq86Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; 
   d="scan'208";a="230454147"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 01:27:11 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 30 Mar 2026 01:27:08 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 30 Mar 2026 01:27:08 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.65) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 30 Mar 2026 01:27:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hio3PfqcjDgefy4K+ff372jvOaiwTt8OAwPYZ0Ay6bRasUZUlTRMX4ZbP2Pvw6bttu6Vk1PFJ3pmMMD4QqZeyGVYC9TeW/TZsLyX1h72U+Jr9yaPu/bkzo41Fkpxb/9Hssjg8DVE9LoiYwJ59M/QbcFUZksK4fymRa40yTo89bCfIPwEJh/E8HRQYCF15ONcfNkvuFUOBxJGsjdVcJYIcRXTGSUpujcd9FiBRK7/q9tv46MRsDJpoRswF/JVBhjd48v2TBe8fAYvW2on1tZHjURZztlm7BFKX522mLgeHhcGkfyDJ2wB0NnzyaMempS1y4adTFjWaS4LfK2JjJDBkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JtvTii5jduGprHi9CwxxnZKmCCqWr8Q45o/53XnUfsM=;
 b=N7bzxUSqKKGKh1WEGQ5nft8sjbAlgWNFGqXSBLGqJfDbi4BdJF9b62Zno78Et6ZPKHrfUGChLQMexAYT4ZswxljFZ8ucwwe9G3OauoQ4qLPvGRi2XkJz/Pj+0rx7TwX508btmB/86XRQO4wL6weHOC89Ud0ZuUhXVuUYE8hj19pkwxmF69UKZZ/OozQ7cLel/ubByfU5q5s6bVkq2+RlpbyKI+BnV44gW99Ptd8gnv/0nu8evPdr2wLF5H8SBD40NWO6wRUW7BYwEZSxTjnMdlVOszkxcjX+zOXKYXj4Kw0A6T1fD6e/W9/O23tJoVMvwE//FQlhYuzQavET8pW3Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8283.namprd11.prod.outlook.com (2603:10b6:806:26c::16)
 by SJ1PR11MB6081.namprd11.prod.outlook.com (2603:10b6:a03:48c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.14; Mon, 30 Mar
 2026 08:27:05 +0000
Received: from SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::d18f:6b38:584a:214]) by SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::d18f:6b38:584a:214%6]) with mapi id 15.20.9769.004; Mon, 30 Mar 2026
 08:27:05 +0000
Message-ID: <ff2412d2-8f3e-4238-a6cc-be643778e5b6@intel.com>
Date: Mon, 30 Mar 2026 10:26:59 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] ASoC: Intel: bytcr_rt5640: Fix MCLK leak on
 platform_clock_control error
To: <aravindanilraj0702@gmail.com>
CC: <liam.r.girdwood@linux.intel.com>, <peter.ujfalusi@linux.intel.com>,
	<yung-chuan.liao@linux.intel.com>, <ranjani.sridharan@linux.intel.com>,
	<kai.vehmanen@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<perex@perex.cz>, <tiwai@suse.com>, <linux-kernel@vger.kernel.org>,
	<broonie@kernel.org>, <linux-sound@vger.kernel.org>
References: <20260328052556.434191-1-aravindanilraj0702@gmail.com>
 <20260328052556.434191-2-aravindanilraj0702@gmail.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20260328052556.434191-2-aravindanilraj0702@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0102CA0025.eurprd01.prod.exchangelabs.com
 (2603:10a6:802::38) To SN7PR11MB8283.namprd11.prod.outlook.com
 (2603:10b6:806:26c::16)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8283:EE_|SJ1PR11MB6081:EE_
X-MS-Office365-Filtering-Correlation-Id: 97b5a350-3e8a-416d-d90c-08de8e362024
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: ctvQs/2n/nhWbs5fS1kpUPl5u6h2Ue0LbI31YbxF8IdmG3hHLRqU6Ps6BobCysbOGstsTOJfme/Ls3dGJb3AriQHaiYqicp9Cg0Lm70/T8l9vxfqv1UyP6ZY9gOW/XnolXxxrN3VbuSX1QOMthcWxAxfJLnc7bbxHSmAXNnbpsr68Sa1dRoWe5kSpTACcoolnfgPt8bx6NiZRvO/hL3PWW/DKp7gI+PhYJ/hP6bgEqpuOCqL7Zk8NhH2ALbuoF8xI5G36pyqG1wdn6AUSGViH25DycooAZON9HzPwpBAeWO0B8GBu4tW+Kq1iX72PzifJooItgzUDljLNn23B80ydV13LcBEJZNY0p2eSv0Dl+uBit7rIegaLgfzrOLleW6EDWUBJm/n1e6XzDwNz4oIDAsu/qHItPxcIaKxnLt8Ksf8Zjo0ASazcDH2UWOFsQ+4G5q7rueI6dkfDX0c2aY3HfNQMy2B7bDzTY8LTaJfstfpr22AjGXmq5vPKXfwDFrFHKy/DTR9RQ1w+XSCKZuwQGMDAVsS21gwDkm4Ro9Dd9pEs3q7j3jxBuZXQ/gcNkJsQttV+zvuXORvhVJFg3EznqVGh/pa0vDqvB0X5vVXJiZmC0b9tC6slPRPGlYwu6UddUl9BPQvLAE0xO4vH+a7+RnHx8QRq6i6A0566yWWHmKERJ5WNZspMUKiudsMjOdmkJyb9g5kitUpSqGyNrBhNHv6n568jel41oimeQ9sU9g=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB8283.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?alhTMUQ2YUkxa2FRNHZ6TnhXTCtLL29PbWZFRGhpRUlDS0dlTmRTa29ZK1Nh?=
 =?utf-8?B?WGZjZmU5eDZPSmtKcURCUkZlUVQ3OVBIclYzWU9COU9jb0VLcVdDNFJiaGZD?=
 =?utf-8?B?MFVZQlJpU3VZNHRZSHpObTZwYkRwQ3J3akNTZmRvaGdIdU1IQ2cya0pROVVI?=
 =?utf-8?B?TWt1WkcyYmtaMHkxdDBFT1VER0J2S1RvcE9ycjZtUU1kZzZtSFBMNm1kZmlt?=
 =?utf-8?B?S0QzZ2R1Z1lFaUdUdjNTMDlsKzNkKzdHekZKdHN6REhDc0MycTlvOFRVNThI?=
 =?utf-8?B?bXdpdnphYitSOUgwNFUxYTltdVp2bXhtWldSTFJLWkRhY3ZISUxLMjZmMGJn?=
 =?utf-8?B?VjdsSHJFZXg0Qnd6aFhuK1FNaHlZYTV6SWRZS3VjMGJXSGhtQmFRVHNRa0RG?=
 =?utf-8?B?NmxuclJLYUVZT3Q4V0wvRXNqbXM0bm9UYkdaQXJjai9OcDdzanExQzV1d2RG?=
 =?utf-8?B?aTNiaDhvR1lWU0k5TDF0Nmx5Q21qWEd0c1VENFNGQ09rMzZSQXhyQmI2WFFR?=
 =?utf-8?B?blZYZ3FjdUtkenlsWU1LZlhybk56REpoRkppZHVUL1RsK0RXa3FYcCtTbjFI?=
 =?utf-8?B?L0ZOQlpCTVBLWUpmRWVQM2RrZWM4a2ZpU091TlpCU2hrTURqRUJtSVR4bnU1?=
 =?utf-8?B?REYwVTkxb2piR2tDSDlRNi9pVnd4OWMxZFNoMTFiYWtjRWJodHRZOCthNjJK?=
 =?utf-8?B?NWx3ZzYvb2dDUmhNcllwMUNYWjhGUjVsVExwVHFkbUNPL1hrUTdXSHFsWC9j?=
 =?utf-8?B?eFJiL3hBdjNmdTR3Q29pd0VBOUJVR0tRam1lT01mbUdsRjFxQzJISVBiZm8v?=
 =?utf-8?B?SmZQZ0FiYzcxZzUvK3FJN1ZKTXQwYTJaekhwQng2WFl2d0RJeXdOcGQwVzR6?=
 =?utf-8?B?Y3htUDJQaHJwTWQ1ek56cXFoVGJOcTg2UllaWHo5NW1IblBkMmlGcHpRYTNH?=
 =?utf-8?B?VEZrNXJ0OTdZbkhUY1RQaTFxZ2VReWs4TzNZMStsRFBlSGlDd25HdEVpWGJm?=
 =?utf-8?B?QTNheUlMWHFISWp0T3hpbHZBOWErZnBGc2tXcTFPSnBwOUxSYXRhcVBqVVEz?=
 =?utf-8?B?bDZZK2JnQXY5N0pPWFpRd2pqZC9ZMGNINTZmdGhrVE1abnI2eGRtNkExOG1P?=
 =?utf-8?B?QnNHVmlTdXlvcFRzYmVVNUJhWGhyby9CYnMvb3N0OHhnTXRDTGF2SGJSQURo?=
 =?utf-8?B?dVlxbHEyYXNzOVVPeGpJNVBibkpEbmNGLzhXN0tsSHRkY0hMY3Q1RjNLNEwy?=
 =?utf-8?B?SFlDSXlkOFdldDFXb1hkNVpjYmFMSmlIS2UzTk9Ld0d2TDlEVEtvV21qMGVV?=
 =?utf-8?B?c3JHUFFWRDBoTTNIYzNTeTBUOW1RSVZUSEFoaHhLZUdVdVBidHI0M0tGYThl?=
 =?utf-8?B?K3h3eVpOaWQ1d1FyT2Y2R3BEbC92R0Z3VWhUdFNTTXFqU2F1ek13VlY0WmJJ?=
 =?utf-8?B?bGF1bUJNcWxzSk01WXdYMTdZdGQzODU4aW91K2tOejhLeXBOL3lPNmNodWNC?=
 =?utf-8?B?cnlqTHlUNEJCM0RUSlp2dmN2dW5BeGU4ZTZSUDJaWk5nNlQ5UnMxTDg0UzRm?=
 =?utf-8?B?SHlDNEltMHI1bjY2ODhJeTFKTWhKQUVpV21qcW5PZWwyVFFFVkRrVW1TbXJl?=
 =?utf-8?B?Y3ZmWkRreTZiSnU4dlh1UVJiY2pRTmY1a3lZcVhMbDYrZFZrSVk0MjJ0VVhE?=
 =?utf-8?B?L1BjejJnNHlxdmpQbUJ1c3MrUG9vQTVlVWZQTW1vUFVzcDV4ckE0TUNsZGF4?=
 =?utf-8?B?dTROWTlDR05SZ2hPNFJicEdLdGtPeE9nK2NySmM2NVBNbGY0d1hWY1lZby9q?=
 =?utf-8?B?Z1dSM3UxdStPVW9sUVVTdHltUTR4NHBzVFdBQWpPWW5aOW5HNzNUSmJlbE9D?=
 =?utf-8?B?MmhEN1dLTVR1L0lrdXF2ZUJtdVh0M3ZvQjlETUhGbElvN2p6bFg0azNYVTZG?=
 =?utf-8?B?K3NYUHNveEJod1NLMTMvTU1HcFN0akpERzFxcHVDS0J4Y2RnU0JxMk5tQkly?=
 =?utf-8?B?UENBTDE0YTNKMEs3NXV2SzE5NmFNRkd3a2kvUEFvNHAzMmRneS9GbW42NVNm?=
 =?utf-8?B?UkNxT0JnNmdlTUdyRnh4QkVXMHQvNm96WU52SEZNcXlleExDWXcvV1VMdlQ0?=
 =?utf-8?B?UHpTaVFzanVGY0d1TGhVbjRJSlhRWjJkSk9hT3E1S2xnTXlvRWZzQUhpL0tk?=
 =?utf-8?B?dkN4SG1WTllDNnZsMVhoaE5uNkdXUUFrdFJUcHkrTllxZXBYUTJST1pzaGo5?=
 =?utf-8?B?WUkrc2hmeU5YY01mb0pucXVtcWZqeXJEUGRrU2l3Y1AxbzFObzEzcXV1QmYy?=
 =?utf-8?B?czduZzFNM0pMSzk0OTRwS2prUjNzUnA2eWZLZjdBN2ZOYjFSTTNRNDFDTFJr?=
 =?utf-8?Q?Ulhwh+hPwDtOYkF0=3D?=
X-Exchange-RoutingPolicyChecked: tg/P4bX74D/x0091b1FkEsg6XHL29nnXX3ojEgjr2t/DE4YUcpz/3MP5aEWPujqcW1USVfKS6GwTo6rDlCEpWNmvVF0dDf7omvRzHWh9sDoQouRu+FnZ7sHKzHks7jea2AzP+1ASDuAE6EPTVCrLlxnL5hVMpzA9iR5ol14pMl+8Y8/LNLX+eG1ZBpx/YpWTRbPZqDZ2TPzUdGFG7QJojb9IH9tYHbUVstKxEiR7olqTbaKGncrLXpe7H41gD50kJ9NBhQzWgneW3Ppg7rq/ifqMGbOlmlCKVf9Oc0jDyJBSlup2z+Ur1rjq5fpUSq96npDwC//YG+AZgX8kMOoWLw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 97b5a350-3e8a-416d-d90c-08de8e362024
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8283.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 08:27:05.4077
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5+cf6bpE2jIjVWpNYJWf7jVkL+DUStX0WWU7Xd/jaTarqPPxRYBxUghK2rOM+l/Zr2ICXSiLlbZ8ER7KX7H2BQK5yLo3WoHxKkB++z2aG8s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6081
X-OriginatorOrg: intel.com

On 2026-03-28 6:25 AM, aravindanilraj0702@gmail.com wrote:
> From: Aravind Anilraj <aravindanilraj0702@gmail.com>
> 
> If byt_rt5640_prepare_and_enable_pll1() fails, the function returns
> without calling clk_disable_unprepare() on priv->mclk, which was
> already enabled earlier in the same code path. Add the missing
> clk_disable_unprepare() call before returning the error.
> 
> Signed-off-by: Aravind Anilraj <aravindanilraj0702@gmail.com>
> ---
>   sound/soc/intel/boards/bytcr_rt5640.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
> index 103e0b445603..fce726a9c8c0 100644
> --- a/sound/soc/intel/boards/bytcr_rt5640.c
> +++ b/sound/soc/intel/boards/bytcr_rt5640.c
> @@ -304,6 +304,8 @@ static int platform_clock_control(struct snd_soc_dapm_widget *w,
>   
>   	if (ret < 0) {
>   		dev_err(card->dev, "can't set codec sysclk: %d\n", ret);
> +		if (SND_SOC_DAPM_EVENT_ON(event))
> +			clk_disable_unprepare(priv->mclk);

This if-statement complicates the situation unnecessarily.  Please do 
the check in scope of "if (SND_SOC_DAPM_EVENT_ON(event))" found earlier 
in this function.

>   		return ret;
>   	}
>   

