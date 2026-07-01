Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83AF53BED08
	for <linux-sound@vger.kernel.org>; Wed,  1 Jul 2026 09:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782898571; cv=fail; b=FMlNaUM1Ax6ly3mJOXH+t1ZMfuA7bhIlpsmRHDXiOd+Ana1OHtpeLspmbt8SyQXLQlJElLBQ49fKM2bsVhcFlKRG2SrguTmx1/PCr3su14/3Av7mD4KWrf+j4hFgdfARmOxbcfMm8LsGyN3iuLK6ovqGcup0plAyDWQ4AtnyUZE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782898571; c=relaxed/simple;
	bh=xZJejbwAQHjFqMgTYBzaDzSIiYsKpvVJSV+PXsD8Lhg=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Lfh0dZV2Yn+A3D1ivxkyuCHGtFANB7JVmNH1HwMff280dmXVCcQHYJVxI5k2c/AwpfsJhe92k0bFv6AhRNDbBa6qlgAfJu3P4WWwoxT6qknhxrsmvqWRx3Z/lTh++5oXx28A0KlXqgs6GTmbEmhFaiGhlXGR1v36PxZYehRFT/g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lwxe6a6V; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lwxe6a6V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782898570; x=1814434570;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=xZJejbwAQHjFqMgTYBzaDzSIiYsKpvVJSV+PXsD8Lhg=;
  b=Lwxe6a6Vaz4SRqIZDVSSc2X2iwfgjjjNKNZ+ZriZZ1JaujFs1XsGt/AC
   3zUdC50fOjKyfZKwsg8yS8/JjXtYU7/LxN0BWxN0CgTFMq/9DSC02hMt4
   JAk7XPu3kPDj/MT2uFvWKH5OJfPcdWm9N/v/OXTEgvMZ4C6w6yDWbbcjn
   rFSEHEmnMwI9xhiAKEMSLhR/8Nu+T2CQ/eQj6trtxykBkcWhHXiset62H
   YTEgO+pFvpa3E7xM8BAKjjB6k9GRJ+Z3nnPbIwoCoEypK97L6uQy0gQnx
   Q0H+p+V0x43Azmvs75WM7ekz/JJGMHdk5RNrCbGYrXCJhkrCHo0ips9FC
   w==;
X-CSE-ConnectionGUID: USXbaAJ2QMKJbcSwdgIomA==
X-CSE-MsgGUID: OWiuVAN9QGGabj6lke3z3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11833"; a="87460944"
X-IronPort-AV: E=Sophos;i="6.24,235,1774335600"; 
   d="scan'208";a="87460944"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 02:36:09 -0700
X-CSE-ConnectionGUID: bNxIv1OjRzunK61WJuG/CA==
X-CSE-MsgGUID: O5ZaERaSShqMvjjN9lnFTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,235,1774335600"; 
   d="scan'208";a="248058019"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 02:36:08 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 1 Jul 2026 02:36:07 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 1 Jul 2026 02:36:07 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.29) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 1 Jul 2026 02:36:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AgnJNxRj87epPGXp+znHCM2FDgz8X75qLRnWsCWMjwJzo/SuvV35rIIUHJItWketUqmoBZbXfXqALFf9BOMn0LE4m784IJDZD77vatTPBa5GJts8UbJy48t3g3I7O90O62SSKKc0ZCbiZoVRM6Ny1lTHDQgcSfNrwx+NT+kagdGI3PXP7wRUSiBlP62xHDdsckGGgRiRr5fkH7hzia55QRKcs7q3JlMaOkjmI5mCYAZpoWXneWe73d8meihK6gnHT5snZIoYeKTD8njPpFxnY0Biu+ArnhygKFPF9Mb98l+dPYp3Zw65zGashXsw7a2I53YYIQOZmGafzuTaC9iRUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WRF0C4+jnejEvzMJ+h2/xxjF0Wl4CEKwfo/2Jugqj8s=;
 b=RFGaXjZk5LrHnNKn88ZEkd8pSe41yIiOGigYj2ID8Byuc0I408A/IhrdtVMedn0zOTOs6VEVOX4rrSgkV3vti/mCugdMpgS1yiZvPKUXvv1c5b/Ojd2iVHJo7+tSe5OEn/YYO8hMrPmQCW0ybuID/AiqxPJg5ZBW8bdlb7y+PvVz0p8DyAtI+wcjpujEeetJqmDLeO71cdq3vBklFoTuj3EtUKsXCKjpLNUH/0Nl3L+l/9XAl+ov7QY8pzSpK79u6omv/MbwI9IZ/oDs7TmItkon3dPli1jdtc8a++yW2QIqSbJnQw3p77OTOCNNrlMY5r4U0DH9yioiwdK/v+U7QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6967.namprd11.prod.outlook.com (2603:10b6:806:2bb::15)
 by PH7PR11MB5885.namprd11.prod.outlook.com (2603:10b6:510:134::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Wed, 1 Jul
 2026 09:35:57 +0000
Received: from SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4]) by SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4%3]) with mapi id 15.21.0159.018; Wed, 1 Jul 2026
 09:35:57 +0000
Message-ID: <dfb5efcd-6c9a-462d-85f7-e8fff3ded624@intel.com>
Date: Wed, 1 Jul 2026 11:35:52 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] ASoC: intel: use component_name for Component name
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
CC: Bard Liao <yung-chuan.liao@linux.intel.com>, Jaroslav Kysela
	<perex@perex.cz>, Kai Vehmanen <kai.vehmanen@linux.intel.com>, Liam Girdwood
	<lgirdwood@gmail.com>, <linux-sound@vger.kernel.org>, Mark Brown
	<broonie@kernel.org>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Takashi Iwai
	<tiwai@suse.com>
References: <87fr29esth.wl-kuninori.morimoto.gx@renesas.com>
 <d5e3fc22-8a17-4672-ba5f-167d8cab2aa8@intel.com>
 <87se66dyqp.wl-kuninori.morimoto.gx@renesas.com>
 <2965d6d5-6cf0-4fba-97a0-7a97861fbbaa@intel.com>
 <87o6grd4ol.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <87o6grd4ol.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR04CA0074.eurprd04.prod.outlook.com
 (2603:10a6:802:2::45) To SA1PR11MB6967.namprd11.prod.outlook.com
 (2603:10b6:806:2bb::15)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6967:EE_|PH7PR11MB5885:EE_
X-MS-Office365-Filtering-Correlation-Id: 53dca2aa-1052-416d-e4e8-08ded754278e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024|23010399003|22082099003|18002099003|56012099006|11063799006|6133799003|4143699003;
X-Microsoft-Antispam-Message-Info: /wjW/6E84eUsteH5RHsWIBqdHCIqyWmbM4Jnv2lpz3sPBbHwjffn23asGvC1yfBpAB71lG+uULiZC+0FgISavs/sAbzxt5iIFRP3v+GT7mmYhZuZjWKxWmU5+96n/3il+neFtiI2NnpXKugM+ZYBuqgThU8jYmCz14ARf2eQxf34OvtBftOCRZ3AIvIMD4lxJQ/6Ouz0Lv5Wa6rQIub0lpIshggCC8hL0KeJ9sSOBNCLzBBm2o5dNpSH8OgATTKzYMHACjqz7HVXZkZMK9N5aDYGnAQACamyMKSU3k+bU1efZnUhSYDeairv1z7X/mRfV7FhFk8lZYvvhorlqbe7CM1J851h+hWegRD5uqTJsvYZV5Zdq0eI2TPJ1JweG5t8wdGSB9Olqs6QJMJiYiVtpZX2RpzlLWdGWDnIb2zqBQJ2LQSLaLsowXSOPS788cBikgSdLXUiyBjQPlx7P/KCt+3S//l3Tm+jBqn9m7KdgFveMrUosFuOSSslmtu3AomA+IzeLVnsTPmHxLISnIQkcP8zpD1vo/cnEqnzWE8meKtJIkZE54zl+PqYD5LCm9sknD//qOLpVm29DyYMRM2A4gY0ZVJE/jtg724VaoqRvgoNmq5WxLhLE+siQTSw+lxp5LHFWtH7rBoRnwzStf9BlfxonOP9Dwnb/+01nA+JgAU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB6967.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(23010399003)(22082099003)(18002099003)(56012099006)(11063799006)(6133799003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U0lzRjFNYXdLUkx0UVBKbHh3TVVHSjIyQ2FTai80ZVNwN2M5NWNDMm93OTJx?=
 =?utf-8?B?eFU4NTYvVCtxQ1MrbFFCZlRkbFRnYXU4MytONGJvdVFQUHo2ZXBIUEpDNmZ6?=
 =?utf-8?B?THFYSzdBTXAreUd3VzQ0RFhsMmMzY0s4aFBjbGE1MTQ4d2FrcjhSREM5aGpl?=
 =?utf-8?B?OVo5VGNyZXVwTVBKWCtIUjMwWUh2Rlp4MjhScHFmczVZZDFRN2NqajI3eThX?=
 =?utf-8?B?Y1Y3bEg3SC9ZVzgrZ2NjdFpGOEZONm4vb21QVkdlVEl6OGc5SWYvNVp2Z1Vr?=
 =?utf-8?B?clQ1aHJ6OGpab2VMSHhwcDB6eUNXazA0THZ3Z1I0aGVHZUhUYjF0QjJma1pv?=
 =?utf-8?B?UTFrN3JsS1dRdU1TUjU3WUVqNFQ5TTRncE1GeDFxMFIxWXBteGRnQUI4SEhy?=
 =?utf-8?B?Q2NITWZMay9CVWJBWjh1VHQ3ZGZiS0x6amlKMDF1Z0JNeUhrZE1yVklRdzU5?=
 =?utf-8?B?TmoveW11TEc5TUcwMDQ5MU1URFVsNEFiSjRUaGpMVHp2NTBjV1pTSXpycWVL?=
 =?utf-8?B?VEo1aDZjUHMzWGJ1dDlSME5NNEVYZDhlV1pnOWhkUXh6VFZqZXJtV21TMVBL?=
 =?utf-8?B?cm1KcDBwME1PYWpsZHMwMlAwSTh0SitnWlBwRTVzcDBGM0wvcmx1YTFiUzVU?=
 =?utf-8?B?KzNFeGlEd2piV2RYVndTTEtGN1pMSmhyUVUvdG5zYm9wTnpLNk8xeUwrV1M1?=
 =?utf-8?B?UEhpSmpPMjBUc001L1JFUmxGaDk1ajJFbndaazIzSkFoajFQTkoreVFnUXp4?=
 =?utf-8?B?Q0M5RGVkTGhTNHFXV1BEcURmMEJvMlpUbFU2TTJRQzB2L2pPQnVxQmNWRTdi?=
 =?utf-8?B?clV6cFltTkpXWXRxS2RoemR6SXZzTjR0bkdsY0E4bHZhMG1oZUpUWVJpMCs5?=
 =?utf-8?B?bkdKcWM4Mll3cmRxd3ltd3hwaFM5bDBiQTNOWHQ2ZDdkMmtyditOUXlKTGFh?=
 =?utf-8?B?Uno0WUdDZVR2YUl4L2JqUGF6NVRIcVJQT3V5V3BYUWJ1VlRPNTJETm5JT2RC?=
 =?utf-8?B?cUtzVkhhVHZNS1JlTXE0cmxlQUtZekhTb0hOcHhtQ2NJakZQYzRWSWo0VU9z?=
 =?utf-8?B?TjRjTlJDWndMS0dUN0c3Vlo0MHZFaXlpbFF3cVJIVTVBVWRCZW9kU3hPMW03?=
 =?utf-8?B?WGhvcVFoMGRlN2Fvdk5RS2w0bzVhRFpKUjlteXBZUmVWMDNyNWZJdk02TGZ5?=
 =?utf-8?B?N0tUWTdoYWFHdS9WVE1saFo5RnZoVURQcytZSHJrS2c0bHhqaDRVYmg5YnNR?=
 =?utf-8?B?N0lPQllsbThQMGYva3FCMWRYOG5XS0x4Z2lsTFZLdk1tdk5yT214bnlORVVB?=
 =?utf-8?B?bnRCdzhBSHdCRHdTT25sV1JjUDRIQ1djclUxaWc4R3hUQnlYYzR3SzJNYTdC?=
 =?utf-8?B?SkNEbmZpdEdVUTlDYUhuVzhodDlPaGxPLzZ6NGxrOWw5Q1kzcFk1TzZ3SzBq?=
 =?utf-8?B?WFAxMnVNUHltK3ZRU0c4dDJocmYwcXcwMVozWSsyZ0lnV1AxS1VjSy9ybUtU?=
 =?utf-8?B?MzIyOWdQdGpZNWdPb0RwZjB2b0RoYnlRZmVnTUdPWmZsUWNzQnRYVW9hOXAx?=
 =?utf-8?B?THM3OUZZWUFITVl3MUhJV1M2UlA2bGJQTXdRTjVmTCtFem5iSmpTalU1bjlD?=
 =?utf-8?B?cU13UWVONENSOVJqMURNSFNNR1FRNHMwVWlNOW43OVU5WWFldHpROXBGMmxn?=
 =?utf-8?B?dVlSeXlUWmpxZSs1NUNLSGlsQ0dFeTMxTzZDbHpLUmpWVzdVaGRaV0Z2cVRJ?=
 =?utf-8?B?K2ttd29xZGM1bnNQdW1sZFdrSWJ0bUdMN3FPZjVjTDZhK0JrancvREhJcUxl?=
 =?utf-8?B?VDE0VlNoSmJoVGdRMVdYS1RNL3FiSnl6bVN4dk9xeXJPelM2Snk3VVhlTFNw?=
 =?utf-8?B?VWRST2ZFcHpROXdhSzdGdnVSeWtVakpFNndJc2JNYVZjUWVxdC84VVY0cjhh?=
 =?utf-8?B?ZUxRaVZsWit0U2JEU1RvQmJ5Z2RlcVh5WUJXR3BRM3JwaFpucE1Dbzk0eGE2?=
 =?utf-8?B?OGVNMjB6Y2dnNnA3OUFWb3huaTgxUW5RVlNrZnJjK1BhdEVmemN3NDJtcUVl?=
 =?utf-8?B?YnBCRWxOQWMySUlETE5sWlJQZVR3cGNWZllWdktJWGRUa0xnYnVwckVud0Vl?=
 =?utf-8?B?Mm4xdkIxVDh2QkNFb3FaUkMyWDlDRzZGRXo1V20vbk8wcVVkVWVMZzFDZTFY?=
 =?utf-8?B?a3QyZytlaWY4bXRlcjJnR1ZNWXFob2lHRFEwTy80NCtxL3FLbGJlRE5FTlBN?=
 =?utf-8?B?ZmlVY0hpRjdmaVQ4NkZQUTlsVzZ1cWxZZy9OWGVNN2Y1YUpxeVh0cDhPekc4?=
 =?utf-8?B?VjRsZ2gvLzU2ZDgwbkxiQnRBR1pWUCtHRy92QWRJQ0lPdDZjOVlWQTJ4OFIv?=
 =?utf-8?Q?JFkDMHhYkGT3VWXs=3D?=
X-Exchange-RoutingPolicyChecked: HPDuxvwbpWPjCJFnBPyLjckf9JTec/Uzmu5yITFzs2iFFXYZc2RlbbX1cpQaeFfJFGfVM0F7+9B+a26ZC5ngHyAt6ITahdAdnddDsLDBPNFpQjXTFqwDxsBeXBu0g77klqHNDRvQU47o6avrD0/EAcDKc2Tz+5bCftORZiygJr2m+/RqUSirAyCLQ/UjPan2kJME5ULIv1+XX9WX1rxGfCcg2hGcJ7g3WiQEE2jWAfSn5/NluBecNQTt76Zvm4qyROauaP5LggsQHJEu1v+ZgRxmkzgBEs1n2qbL9cXmF6TExk6rXqSXs51RGp21cE6AvyOTqBtJ+sxmX8kfehC43Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 53dca2aa-1052-416d-e4e8-08ded754278e
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6967.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 09:35:57.5586
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C9uP9rW5OBQluK3frTqJ2zbeQ5TvMXcDa9zaz+DlKK96Rh2o3nZBVKzUK0S7zIPNiw9xQnD17M/5ZCcfAVh+L6Mhjg3urJxs2R/RkIoDVhI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5885
X-OriginatorOrg: intel.com

On 7/1/2026 12:49 AM, Kuninori Morimoto wrote:

>>> But basically, I would like to capsuling DAI/Component/Card into each
>>> soc-dai/component/card.c. Because current ASoC is not capsuled,
>>> each driver can directly access to each members randomly.
>>
>> What do you mean by "access each members randomly" ?
> 
> We can access each members without restriction, like below.
> Because of this, there was a driver which is using the member a
> way other than intended.
> 
> 	component->aaa = aaa;
> 	component->bbb = bbb;
> 	component->ccc = ccc;

I see your point but that's very close to over-defensive programming. 
If a developer wants to break their driver/configuration, we can't stop 
them anyway, no matter how tight the API is.

Why over-defend?

>>> 	int snd_soc_register_component(...)
>>> 	{
>>> 		...
>>> (B)		component = devm_kzalloc(...);
>>> 		if (!component)
>>> 			return -ENOMEM;
>>>
>>> (X)		ret = snd_soc_component_initialize(...);
>>> 		...
>>> 	}
>> I hope you do not mean to privatize/drop the
>> snd_soc_component_initialize() and snd_soc_component_add().  These give
>> us a) flexibility and b) dd-alike API (the device-driver API).
> 
> Yes, my plan is makes them local function.
> 
> We have snd_soc_register_{dai/component/card}(), but only component
> has such style. The biggest reason is regsiter_component() allocs
> component inside, but initialize() assues component already had some
> member (->name, ->debugfs_prefix).
> 
> So, if user want to set own driver name, he need to
> 	- alloc component
> 	- call initialize()
> 	- call add()
> This flexibility is simply needed to set the name.
> But, I don't think it is strange that the *component_driver gives its
> name.
> 
> And more, if component capsuling has done, you can't directly alloc
> component.

Meaning with this you break a) flexibility b) alignment with dd API.

The flexibility is needed only for the name, _currently_.
It's not _only_ the soc-component which has such style, device-driver 
does too.


>> Moving on, does this mean we are getting dev_name()/dev_set_name() for
>> the component?
>>
>> 	snd_soc_component_name(comp)
>> 	snd_soc_component_set_name(comp, str)
> 
> ?
> You can set name via component_driver->name;
Asking about the getter part too.  How, after privatizing component 
_and_ component->name, one accesses the component's name?  Let's say 
from snd_soc_dai_hw_params() context.

