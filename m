Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6279E30C608
	for <linux-sound@vger.kernel.org>; Thu,  2 Jul 2026 19:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783020764; cv=fail; b=uCwSMlA2LewdUBE3gWj7jfHlJEhqJ9m8SxWA/BHRRDnlGHLzXoinX/SdyjbL+lEeGYxi9TTh0T0xxmNls0ToJJskaRWlupcPzfkM75kKdDMbBmPqO0/teivIu8x6RepKZSqV/7N57Ex1CNWhYuc/H4U5d6ALk68cXW5c4rEVhc8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783020764; c=relaxed/simple;
	bh=mPEt+i1686bJgUAcxdz+XrmymlNRUtsbkOr44uzUawo=;
	h=Message-ID:Date:Subject:To:References:CC:From:In-Reply-To:
	 Content-Type:MIME-Version; b=BiQh9sk6aRoaQpMpe3tk7+qhqOWdIFJBJk9/+eg0IwHwzFTHUEYvUzVsIR2Ka/dU32PVCElIHW8dFD93y83D+O4Ef8HzCiwNb/3KmoKUkYdBYN5UAYWaD8RDpORv5lPxsi5eU46XO0KrBVVcF7wZWAEsD+d7oQHBykjhdjfNptM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R8agyhpT; arc=fail smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R8agyhpT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783020763; x=1814556763;
  h=message-id:date:subject:to:references:cc:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=mPEt+i1686bJgUAcxdz+XrmymlNRUtsbkOr44uzUawo=;
  b=R8agyhpTCAhJz+mxFgU2rPtspDuwbxg05EZ17jq/o/MBjG0oAKosb6UL
   Be6ulw/NRnrxP87ZJ/PhjmWn9D2R5BBv7VN9XOD1Xt8zM3TcFSKSm3ev4
   HbluLI5AlCwMF7n5F+9nLwqlzaTYFre8mYsJubnUjHVURH2kgav7DRG03
   28nIi4yRRXnS2pfrIDfCiSsWe5Bfy0NE0VEBZh7jIGks08AlakF2bJKHG
   0ZcCnxY2oYofzCC6/+qe3OCs+jf/Ze6Olc+4RBnG0jH5DlQGcbezGMNaR
   bwLjN0WLl4JIVGx0+qX+bizp42fjhSQlDitXHhgcqj+9T131l5kPligYB
   Q==;
X-CSE-ConnectionGUID: oYcu1I+kR9ucLhiXuV/DgQ==
X-CSE-MsgGUID: 15aNuYZRSBeUTRLfyFET1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="83909323"
X-IronPort-AV: E=Sophos;i="6.25,144,1779174000"; 
   d="scan'208";a="83909323"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 12:32:42 -0700
X-CSE-ConnectionGUID: irEPVw6TSWOo0YsCybJCig==
X-CSE-MsgGUID: fnVjjXsCQfCFUoOYGpNGWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,144,1779174000"; 
   d="scan'208";a="291064975"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 12:32:43 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 2 Jul 2026 12:32:42 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 2 Jul 2026 12:32:42 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.3) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 2 Jul 2026 12:32:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sDKTlD/Exi1fr5U6rVhjCQQfNKs3/UuNGpqWQRWrYl8CU0Ba73pnbYJ5HijR54JwFsieAXlijS6zXNFYUx6N5Aux/SHzwaCFC/v1V2qazfmIyGMcRHEkqiOO8Y2EL94KJzkS9Lfo3VQDewxmQnGmwbT9M8luZNpMKCOoAMzm1P454nU6vT11WRH6VV178e4Y7bBjH85HhCkB6jeCIl2R6aQ+wEFbe9RS5XBuY4PJD2flRjyOH6NO/rnifrbUiEuBbHpu/6q9jtxCw933ux20xhb+sGmLVL/VLsfFYnjopOw9jttvXYj7kWTMDLcO7AzIemNPbb6BcFnxxyk9cLmxrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+6Dsm300mUROkLgvMhet8e3Epc58maUNc27Hk+9RO40=;
 b=MozALyXFr40+4lurNTCiSuRZnl6UiGv8+xjDxPlpYLC049bVlOxWrlfqC/cxQKWcMT0/6yDnX3zWN2ZvZiiAvgK8oQ3ATCwj3fU5cYDlsVmfCqkuuYztAwtaLQFWnXqPW8Rf1VklMVfSpFn87clykTzs46voNZnUbUS26HHhk5vGKcoCMMzcC1EQpfA1+clPfusxVhPqSl7Lk3kGoH8aqWdSckCPcZcH8VeXU+MkB5uA773yh1t1tgfvw2wk7rnnqZ0OfFMEBV0TQot8JbnWS/qzjqPU43QmhLqEcty+TWD/nd2SumuSeaapwIRGAOKOPBQqUNOFn7s+HJWxfUlNpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6967.namprd11.prod.outlook.com (2603:10b6:806:2bb::15)
 by SJ2PR11MB7645.namprd11.prod.outlook.com (2603:10b6:a03:4c6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.17; Thu, 2 Jul
 2026 19:32:38 +0000
Received: from SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4]) by SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4%3]) with mapi id 15.21.0181.008; Thu, 2 Jul 2026
 19:32:38 +0000
Message-ID: <64647845-8af2-4feb-812c-7c63e8bb1484@intel.com>
Date: Thu, 2 Jul 2026 21:32:30 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] ASoC: intel: avs: use
 snd_soc_component_register_with_name()
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: <87v7ayxk3s.wl-kuninori.morimoto.gx@renesas.com>
 <87qzlmxk2u.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
CC: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
	<amadeuszx.slawinski@linux.intel.com>, Bard Liao
	<yung-chuan.liao@linux.intel.com>, bui duc phuc <phucduc.bui@gmail.com>,
	Fabio Estevam <festevam@gmail.com>, Jaroslav Kysela <perex@perex.cz>, "Kai
 Vehmanen" <kai.vehmanen@linux.intel.com>, Lars-Peter Clausen
	<lars@metafoo.de>, Liam Girdwood <lgirdwood@gmail.com>,
	<linux-sound@vger.kernel.org>, Mark Brown <broonie@kernel.org>, Nicolin Chen
	<nicoleotsuka@gmail.com>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Shengjiu Wang
	<shengjiu.wang@gmail.com>, Takashi Iwai <tiwai@suse.com>, Xiubo Li
	<Xiubo.Lee@gmail.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <87qzlmxk2u.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIUP296CA0152.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:34c::13) To SA1PR11MB6967.namprd11.prod.outlook.com
 (2603:10b6:806:2bb::15)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6967:EE_|SJ2PR11MB7645:EE_
X-MS-Office365-Filtering-Correlation-Id: 656ea825-aa9d-4018-c2a3-08ded870ad01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|7416014|22082099003|18002099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: 944+sFYzjIP5LHG1S2FodLQRUkbAgm0VLEX10HYw9J4Vj9T0u6JAu1UQwhkEUVENpL3oPH6L1c/6rpFL2+YoBbT09yL1ZRAeTFtyoT4xsol38B4d/yM7863lT4LFW4Ham0n1idUf1fHCZvW4P0TWRoohI9EYH1JHkCGqAgmOXlQAgvx+ESFTCzDTQwktn4SHSJ8kXfsBP1JkcMkBEtdP29Su0qeEjploQL7/Y2qQqfaSwrIEcM0tMVRYUty1xHn6K5wjxkKBFjFDdiFbnBbdQ/CY0m7zdK/9r2ex/y3Cy7DYzJWbtD5C8hcR1UFa1PflOfYIVdMVdZibwHi5tzOt3J6ph+mjAtOTcscX7e37sMyt82Fj4e+GXT/VNhsMdH2NXQb7mfEZvzNS+oREQjoCSW5+hFCytrw10xecq8qyqzISAUQuhHgdHyuTUo8zm1ISnE6tdWJjOZCXr1XZuxsnfULYM7iORmpttrRDBgLJE8RtWwUznLUuXHMcog7QCZO/8ogsJBIkJFsh126wQUpqRPD4NKK1oyb+vAQqJMURVuu9wudzDQ09PJ1xSYH04ADf9YBwkDpZwQmZhN8JqSduiMMm9ZTRz4ldMP2U4ecZn2ip4mxQSHslQOqx7+bYaZleKb7BoYM+YsC7pByOEgdvu20+Xu39UGG2zGuCpaD8qjU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB6967.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(7416014)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RkxBRnp1UkJlV2RjV0lsOTg0d3hQREVPQUo1OGxiYXo4TnBMY2VWUVVGN2ZS?=
 =?utf-8?B?SXc0ZjRiMmNJR1YwdE9vaUFGb1I5d0NBNVBzRXBWTFZKQkprTG9rZDU1YWov?=
 =?utf-8?B?SklpYU4vK2Y3SGwxRHg2bDU3dkZ4ejlXMXVzSjRCUkVVQmxiQlIvSXJmWDF1?=
 =?utf-8?B?VTFFdFNwUFRXWnFKYm9za1pKUnQ1b3JURXhXdGhPYmQrZ3dSUkxoaW1uYldW?=
 =?utf-8?B?c0lMelZyQlR4cHRnZ2ZveXRXR1dRYklSeEhCYkdzUlJCZlZzQitnSFExTjU5?=
 =?utf-8?B?Uk5LVHJRZlJjWExzR3ZkUVQ0V2VnR0ZYNjh6dGRSamNkUUhCRkRncGZiZmRY?=
 =?utf-8?B?V2QyQ3IrNzlCeFI2WHVWUW9XN1UxOEg1cDBDcUJyUnRzL0ZaeXN1eFZzaERT?=
 =?utf-8?B?Z3J3WkM4RFRLNVU5elNHUEN1ZkJHWVNJQUdRZjNEOTZKb0JtMTIyaHVJMWR3?=
 =?utf-8?B?d3JKTnlRdmpxV3l2SGdWS0gyUXRPQmtmL3grc080RlE3UkJaenNVYWpjcXRa?=
 =?utf-8?B?UzV6RzJuUThJWTBoZ29Ob0RLdXNqeUVHK050ZElXZHFkakhmL21TeUFJakNR?=
 =?utf-8?B?MEFpYVVJUFhoWStWMTJ4U1c0NU9KZ0k2WUNtclFrbU9lb21MV1dwc1NIQjBP?=
 =?utf-8?B?SmtGNzN6cjdJOFBqVXlxSzRaVVM0UzNhU2NiRjN0UjJsalEyN2FWVUduUkFt?=
 =?utf-8?B?RHdXeENhTW05bHBMMDFLUkpHR3FEbnJBRFlEYlFWSUxMV29xY3Y0eitmQVVR?=
 =?utf-8?B?VGQ1eXlXSlpRSSs5WWpkUS96U1hoUDRYWklaeldYOFdOOXArN2hCd1JPcGJ6?=
 =?utf-8?B?NnVLR2xhbWxSclhHYWpCK3JpMGYrK3B3L3RmZXJjaVBiajRSWDlTVVJ4Umtv?=
 =?utf-8?B?YkE2T3hzaWJ4NHJUWElwUTRyMndsc29Rd2lVWCtFYXhJeGNUTVY5VCtQTlg5?=
 =?utf-8?B?MXBzbzZna0NqYVdvdWxQbFkrZUNmN1ZBcU5lOWh2MDNmSkIyQ0F3d0dqZlNL?=
 =?utf-8?B?RHBSV2QwTHJyck5pOEZzS0wwSVdXbU12K0pYMEk4bzBCcktONUtVQWxvaHVn?=
 =?utf-8?B?ak1VVERmUklCWFpBeWtPRDdyLy9HVVlkd3A5TFNlMTVpdGJ3OXo0c1E5S1RU?=
 =?utf-8?B?MEN3YTRNeStxajJaRjJuNXZra3FLaWhZYTZ6eTFuQ0pkU25HQzlZZXBGK0lB?=
 =?utf-8?B?ODcxaTZsdytrWjJ5SlVlM0Q4MENocmdkK1ZZMlNRZDFzRmNHRlp0bWVMRWlZ?=
 =?utf-8?B?QldrM0NpeXk1dFBqbkw3QzVUVTlKWWxlZ1g0SjA0emd0VnAxZVA0bFIyOFVx?=
 =?utf-8?B?QUlXclVuWEFYOEUzM3lNSkZ0M2o3RFhoNkdkc25jTmVzVlFrcGhsY3QwaXRh?=
 =?utf-8?B?aHRzMy9SUXRkc2FVcVRoa1A4SHdTRFByTTBqK2JpVnkwSDR0M2wvOVQweFZn?=
 =?utf-8?B?Y0hLOGVDUXNJZVJSK3JZTDRCakpzN1Q4dDhNakpFMmNWWXdBQjZ4MllPSHY3?=
 =?utf-8?B?UzRxRGJWOVMxdmJFVGNoUDg1aHdCeFNId2QyUFl6LzFuWlJiRDlXeExFc29C?=
 =?utf-8?B?TGF1ZTBucnJOWXBPdVpwamZuakJXZW93MG8yUnphSFhYQ2dEb2dveXFnR3dP?=
 =?utf-8?B?UTI2N2MxNWUxaTlyOUJNOVR0KzdsMTE4THRLaGdGYzB2Njh6ZWNWTXFUQXdy?=
 =?utf-8?B?K28wTStpMDRLM1dYNWxWQ0ZNUzhQazRWMzRvcm5xTUdFa0x2dTdJZHF2YUhL?=
 =?utf-8?B?N1dLbHM3Z0RWUTMxajVtT3ZBYjJUcXRVTXNiTGVyRjJNeW1YSGxxbnVUYTJa?=
 =?utf-8?B?RUxpbnMrVTg4c3l3SkJ5NjNVR1NxV2EwOFYzS1dSc0F6MlFjZkIwRVpxNFBJ?=
 =?utf-8?B?RDMrYUpSbVMySDRqRmxrL1pETGpEWE4wTjVDRVgwUGswMWVVQjc3OWFOMnpr?=
 =?utf-8?B?cXJUaFRBSUZJT3JGMGlhYWQ3MTUxL2wralcxcjFuQStvRDRLbVAzckhFNmVh?=
 =?utf-8?B?Q0RIdWM0MisyQVdxQ3F0V1Zvdzl5Z0c2aTU5WHZkWDJzRU9FZzBlTGpYbDIw?=
 =?utf-8?B?eDROWHFMRDlmM0Z2K0RDbXRyRDJ3UEdpL0l1a2FYdmprbTlUS2hXUklrR1A1?=
 =?utf-8?B?ZVh1dWFqb1JJOXkzeHN0ZFRFVEd6U1NNMHd3QW9rZUNFTTExUUluM3pDc0Zm?=
 =?utf-8?B?VWdSNll0ZS9nbkhLNTNMR2didXl3dngyUU8xTWVuRk51cHRIUERSQkhwNXRO?=
 =?utf-8?B?a3JTSmpnTEZHOHp5SlpZR1hFK2dmQ3Y5ZUJCd0MwMFFGUFEydHd4OWRldmVX?=
 =?utf-8?B?K3ByVlgvTC85K2lqblpUSnhTRTdUOEd3czRSTU9kSEtpbUVjMzB5UT09?=
X-Exchange-RoutingPolicyChecked: lWJHQt2GFJZCStT4o7F59dwegnJhNl3En2eYILOfbc3ejTWXDmJk3GwD7WFcRewgrEVdToyzqCWM2A6yD5IPJcDfs6nDROHlwsxEFpTOoic46gKzFX3Kl+lPZZpG52kldwDF9BY5z3qNEgL3VVPUNZYclduW811+ZzcADcTt25uHUG/f1FbBnkzQ5bt4KT2o/unvHwse60bpX6BWECS1w5GXff+fWtQ5u/bdsgeiZ3B5bmICER5VawuwpBiqdclPnwj4ODsUZB4B8AjRXfLD5huqEAppu5+qof2Lla9XS87xKKLjfX2D9FxKUo1obnor8wmTGHBeiJ2FXXCOE4kY1g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 656ea825-aa9d-4018-c2a3-08ded870ad01
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6967.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 19:32:38.6895
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BNdCAa4CkzthzbmIJug74fimocsnXZMTzJjqbdPB6n7eC6lEEKlMHh6gFoUQfnoZRGGt/rBr478SU9RQyPDYDnJBAbfN2SiE3PjMwwEMX1o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7645
X-OriginatorOrg: intel.com

On 7/2/2026 3:21 AM, Kuninori Morimoto wrote:
> Current intel/avs is calling snd_soc_component_initialize() /
> snd_soc_component_add(). Use snd_soc_component_register_with_name()
> instead.
> 
> It is using container_of() to get kunit_soc_component from component,
> but we can now use snd_soc_component_to_priv() instead.

There aren't any kunit_soc_component here.

> diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
> index 797b9c9163b49..3125284529530 100644
> --- a/sound/soc/intel/avs/pcm.c
> +++ b/sound/soc/intel/avs/pcm.c
> @@ -958,7 +958,7 @@ static const struct file_operations topology_name_fops = {
>   static int avs_component_load_libraries(struct avs_soc_component *acomp)
>   {
>   	struct avs_tplg *tplg = acomp->tplg;
> -	struct avs_dev *adev = to_avs_dev(acomp->base.dev);
> +	struct avs_dev *adev = to_avs_dev(acomp->base->dev);
>   	int ret;
>   
>   	if (!tplg->num_libs)
> @@ -1387,25 +1387,31 @@ int avs_register_component(struct device *dev, const char *name,
>   			   struct snd_soc_dai_driver *cpu_dais, int num_cpu_dais)
>   {
>   	struct avs_soc_component *acomp;
> +	const char *comp_name;
>   	int ret;
>   
>   	acomp = devm_kzalloc(dev, sizeof(*acomp), GFP_KERNEL);
>   	if (!acomp)
>   		return -ENOMEM;
>   
> -	acomp->base.name = devm_kstrdup(dev, name, GFP_KERNEL);
> -	if (!acomp->base.name)
> +	comp_name = devm_kstrdup(dev, name, GFP_KERNEL);
> +	if (!comp_name)
>   		return -ENOMEM;
>   
>   	INIT_LIST_HEAD(&acomp->node);
>   
>   	drv->use_dai_pcm_id = !obsolete_card_names;
>   
> -	ret = snd_soc_component_initialize(&acomp->base, drv, dev);
> +	ret = snd_soc_register_component_with_name(dev, comp_name, drv,
> +						   cpu_dais, num_cpu_dais, acomp);
>   	if (ret < 0)
>   		return ret;
>   
> -	return snd_soc_add_component(&acomp->base, cpu_dais, num_cpu_dais);
> +	acomp->base = snd_soc_lookup_component_by_name(comp_name);
> +	if (acomp->base)
> +		return -EINVAL;
> +
> +	return 0;

Registering a component and immediately performing a loop to find it 
(the very object we've just created/registered) looks off.  This is 
something we have to solve.  I admit, this won't happen within an hour, 
will think on it.

>   }
>   
>   static struct snd_soc_dai_driver dmic_cpu_dais[] = {

