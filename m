Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D901625B088;
	Tue, 11 Aug 2026 13:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786454488; cv=fail; b=V3ptRxEEFSfk3RiyUKOXKueQnt3VXedvbBrUXhZdA+4be39ssZWq8B4lW8Q+bR7AYmX4HiOsbgTubRyaBTlwnUKoILGCiJKH4HpUUaKBLTolRnEfHCuBNTtCjQ70F4SWFCfZJdwPcEGDXbwKHDidB/FkLDE9zc3RCei0/8SuF/k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786454488; c=relaxed/simple;
	bh=FfjknyOH9/fN45QIjJLKaf9MeF4SO5t2iIEhGRSUp78=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Y0SqhrlOhY1Jc1OTRYeg+QayJF6e0wGlOJ+le+t2oIdxISuUXBx5hk1psj/8Z3n7QZi1avIvjB9XI3xLAFLxOi0hV7YAbFELjLqAdVXiI5t4dkXzsO4v+zQyMcJlV+iPIz18qsRgBOVqqTE9etZiudxggzNeBrU3ClQ9Mecf4pk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dEjbJ9VV; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dEjbJ9VV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786454487; x=1817990487;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=FfjknyOH9/fN45QIjJLKaf9MeF4SO5t2iIEhGRSUp78=;
  b=dEjbJ9VVwpgxEWq5tobcG7M4yBSuiL92Ly4Q4MI6I8gP7DQOvLf0gl4i
   IA8Z1Ae38pd2Q70eHAhxqKme9HPNT4CLHxW88lDm5nolXWFn0XGJ/r56F
   6m6sTm/V/J+9uViFcLCfrnPi3ya/7zMugVZmzeRWp20xLk2RuGf7livLz
   Z8PxbakwVwbr0wt+8InX7qaoPQz+JpWzotNvFi7NSYVHlvbHRuRjLNFUj
   0BOmPliQ4MJo5wGK48YvTWyAfd4VbjS0UpE+Hh0upo6PdVqJtMluQn7n6
   HnaWMqwqyuHr9Sn91OjKr6+NANEUzs67P5Ua3kVIB/lFE+88bkMciApgk
   A==;
X-CSE-ConnectionGUID: PF2gYNCPSFmdWBakdMSaHg==
X-CSE-MsgGUID: cwprRljTTXm/y+bRgdvgJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11871"; a="109774372"
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; 
   d="scan'208";a="109774372"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2026 06:21:27 -0700
X-CSE-ConnectionGUID: dkv0NfyXTpWlIRa42BkZFQ==
X-CSE-MsgGUID: C6QUJwUDQ8ahTnccFlrv9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; 
   d="scan'208";a="293273884"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2026 06:21:27 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 11 Aug 2026 06:21:25 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 11 Aug 2026 06:21:25 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.59) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 11 Aug 2026 06:21:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yXpsfluajNL1ipK020cHUPWKBRUZopGeR0fMuSyO86oNlSEiFitHrBe3VHZKzR+ppmf5WqAdPpc/WJ5EWytghuwrOHK3LmtCdolxQ6WBbPuQa4SxUCgT50WVDdwl3qARwZUKVtrOZAORfnk9bNaHRyviCnum65IQrlAoPLYtmByUnXu3Ofh5qEqcSICnNM3a4lqUNpQb80sB8sZRSqF5T+t7My5aitbZs33VbHagydYWWEVinLFh+rkCjeUIeTdvKyxYJkDTlQ+d5BiZ/Cp+jHvS5uv6GQhWIcfD5lrm/ECHxC6jOuEdvFrxuL3gHaPZLmLWyBxx2gK+QlnOJH2kXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fyx1rFFMx2yrYAPDaNjz5GLkgEQA4RFDvE/3fVUoZYY=;
 b=WaxVRVsssZxpm4xrrpJ/4by9aeFa0KGuolLLox+egmzIIZPfXldX6h8d1kJwYAVJ2mWYmNFtv7bd2FEVX+TEyWJocmXUV8Bh3ygQ4EVelKnt/pEPt4Y8WUt5y7OXAfXIaTpij4zvpyBJLL1FEJhK1njrVFxGzmbOGRhPLBk3E7MWcoyNQRUBi0pKr7eD/3lpGhblCiYA3jIeP86hFG9cGQtIdQc81wv7iZp+stOiT05vW3snvNf8itkJTfz6vznXjddHy36AvnxGoOe3CSp59lZJXUoKEpgVPiOjzIyGGmArwSIWDstllV5RHfKOq066XDILvyoLegc6g8+3J9vfsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6006.namprd11.prod.outlook.com (2603:10b6:510:1e1::13)
 by PH0PR11MB7658.namprd11.prod.outlook.com (2603:10b6:510:28d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Tue, 11 Aug
 2026 13:21:15 +0000
Received: from PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd]) by PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd%5]) with mapi id 15.21.0292.024; Tue, 11 Aug 2026
 13:21:15 +0000
Message-ID: <931c8739-e530-43e6-841f-1951a963fad1@intel.com>
Date: Tue, 11 Aug 2026 15:21:10 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] ASoC: samsung: pcm: Use dev_err_probe() for error
 handling
To: <phucduc.bui@gmail.com>
CC: <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Sylwester
 Nawrocki" <s.nawrocki@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>,
	"Mark Brown" <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi
 Iwai <tiwai@suse.com>
References: <20260811090550.38930-1-phucduc.bui@gmail.com>
 <20260811090550.38930-4-phucduc.bui@gmail.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20260811090550.38930-4-phucduc.bui@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2PEPF000008AB.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d8::645) To PH7PR11MB6006.namprd11.prod.outlook.com
 (2603:10b6:510:1e1::13)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6006:EE_|PH0PR11MB7658:EE_
X-MS-Office365-Filtering-Correlation-Id: 766db878-31d4-4a9b-725a-08def7ab6be0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|10067099003|4143699003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: XadT3zfy2kWbRQgVyaKT2H3oJapLbkzFEwPmhgcz+kr/Vyk5F+EeGQH+/CNbd30VgoSQkyKcWcX7TrS8uGG1ahcLc4BMTC5+xPM0s/I5mBDupHRGIKOd+Akbdl7ubCMc5v90tkFXnp/qdu/91dmWHgXqzVHDM+ZeURrPRRdOoG1NO2bBxyX5H0kobzxzv2PNGmyST+t9Lypl7fSe3ZFzhCOz8JFG01LMqgSgrwNU6Ex/QP29j/16YE8kFxFJHVEjY7Ek9s8SM6zau9cFjYw8jOs/lyE+Zn2dGNuETC3Fb4Qgj4OEQCsogbHCnnMsBlTDAqXbRetHNoc5siousCa0ZoplYoPgtfmdb7gukaJgwkBt8V3GKQKiypkSu917BODTxPGTXOSXHk7dagM5bO5Rt+j61igYkV7VhC6wL90BZS8ofbH6bIuwfRFqZ2NtqD7FFA1xBgTgCNenpimyg21r3rgANWGkVEASBBge5tUWLhikIcF77u0BbOLoX9W8tcv2rQPFF802unjfo9o4ChVrlE+QOfBxM/ZxNc5dFchPlTkgP3ea+BA68iyiNReAoC02LPJIYGPXCzQ8p79CpgAFzim6XROIi4ifmN/HGRzqXBq/9SY0uG5SIKJJfxFcm2XZ6YLS+eDq7epabP9yU2qURTWGVPEdaM4a/EnRHNXPHuQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(10067099003)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TFdKZjNwYTE3SWtjS3VvTWVTR2FOK21FRnFUSkR4Z0ZKVHdRbUorZ0FBSHJJ?=
 =?utf-8?B?OExCN0JUN0NRaU9kOTdwU2JIK2p6cm1nQU5XNU1id1VlckZaYVhPQzFZL29i?=
 =?utf-8?B?TmFUZzBWQWZlUUpVL2ovaUhzK2JqNnYrZ2xscU9QaDF1T2pRYWUzU2dVc2M3?=
 =?utf-8?B?b3dEMlhteXUzcHplVkVIbk5EN2h4QUVCaTRiR2NHNlpIM1BrckhicEhzaGt6?=
 =?utf-8?B?RHJTVVU0dEUvNnJuS1lWUzQ2S2pNTEVWQU5tZkttZlhVMFJHbzJYaytaOUxC?=
 =?utf-8?B?My9QWHNERnllZHoyNFNOamFSOWdTN20rSHFCTEVDMCtBbVlsNXRocnBBZjY1?=
 =?utf-8?B?Q21IYW1HTE1zclRqcjYwSjRCcTB3N2pqMEFlTEdwZWcyemg2R0djRDZ0QTZa?=
 =?utf-8?B?N2t2UnBVMExFUEk2aFN0RmhCSFl6U1lLL3RPcFVSR2VxZ1I1cVVYNjdqNEp4?=
 =?utf-8?B?VG9TQ3MrZjdTaDlySFhGT3h0M0s4Y0xuQml6UHlaODNkaEtRR3RRUnBIOWF1?=
 =?utf-8?B?M0lDZ2UvZEJ6STVXQjk2cHp6TU5YVTB4djFUWjZKdDdhUmhxOGRjZkhqL2d0?=
 =?utf-8?B?RzhUMUxSRlp6dWhOOGZCQUlob0Vzc0lDeEZhTWJaWXVqUm5BVWNaRGdvQmd2?=
 =?utf-8?B?dGRTcS9rY2IyZE5tTWN5eWtWdGJqRzJ5ak91dGNaK1dnZFBmbVNJMVVQNWhN?=
 =?utf-8?B?M1Q0K1JJTWcxcDhETEg2dE1yQjZlN0dzNFlFdXA3cUxqZEMzL0haQkQwTU00?=
 =?utf-8?B?WWE1alBkSHkvNVFYd1BQUkRTYmhkVDNiYzRxWFdjWFlGbmtVelRaOHZsT0dJ?=
 =?utf-8?B?SzVUUU5KVkFtM3Z3QUkrTXIzWHJZTEhTY1Q0dk9wdVE0dTgxT0JnSTdIYzVx?=
 =?utf-8?B?dkYwdG1nS0dvQUxMeGpsVHY4cklUdzdwcW45bjZITUs2OHNTZzBhakNSZkt4?=
 =?utf-8?B?Rllld1BCM0pFZjZTTCsvcVVIeUNSV0o1SjAraVhtWkFqOHJnREx0eHRpTVVV?=
 =?utf-8?B?bTBlOXFITlZ2ZEdqZW9rU3hEcGQwdGo0aUlOU0pjUkRBT1plMmRQU0dTci9x?=
 =?utf-8?B?eldnOVpGemN6aHpXU1lWcms4dlFjcnYrYjErV2lNUkpKcTd4a0hXaU5NU21j?=
 =?utf-8?B?L2NzYXp6ZWk1cnVVU2pPSTNZYWhncHQzMU4vSEdtT1VObWhjUEp4cGZqcFpp?=
 =?utf-8?B?YXFJMTE3eTExcVFjNmxzUmN6SUxuWWlQaHRLRkZTSlpVd3c2YVA4M0JteE9n?=
 =?utf-8?B?bDBNQi8rb2k3TEZYTnFUOENIR0dYU1QwTDUxNG50bjlQLzVxNm94VmNoMmor?=
 =?utf-8?B?QUI5QW0vUW13bjdhTHIwRDAyRFVDTENSbVVPT2g5NktURGNZZ1dRTnk2bUhw?=
 =?utf-8?B?MnhrNlZ4QzMxSzIwTFZVNStacDRrcFhQblhiUG5rSzBCL3dzVXVSaEtwcjl0?=
 =?utf-8?B?K0YxdDV3cEVRc2hXbXIzcHRBNlJYQi9GQU9hR25EL20zdEhmK3M1eURQU2x5?=
 =?utf-8?B?cmN1TDlHbnp4R1ZmZDBMWVp1UkNqSFV2M0YzTGZZRDhZdGZVT3dMNjI2NzdB?=
 =?utf-8?B?Ti9HaHVENlQ1bVQ4NlNzRUxrMDM2cmgybjV4c0hsVmVIckl5cXFDNmpsS1Zi?=
 =?utf-8?B?K0VsU3gwR0lXZ3FYMGJYTmdVdlBUYXd5ems5RjVxVkRZSTM0S1l1VXhqQ1NY?=
 =?utf-8?B?V2FlVGlMZ3dZMEtId3pzVkszYTd6MXhQRFYvQjNaQndQbDdxZE94T1haWEVZ?=
 =?utf-8?B?OE5reFNZSC9tYVdJa1ljOVRuR3pud2pRano4bmJVUWtSaDNHbXRXYmpMYSsv?=
 =?utf-8?B?Vi9sUVAvNnYyTnA5cHNZWUg2cGYvZXhpV1lXSldFYStBd0tlTXdVRlhEQVNW?=
 =?utf-8?B?czNwQ1dNVHZuYXI4ZWJOczBFTldRdmVTRFZ2b1llTVRSUjEyM1hEd2tGZi81?=
 =?utf-8?B?TWE0NFJCa0RBT2NsS2kvSVlrTndKaGw3My9BUUsxOVA5TnBZZmdmTEtSbzNl?=
 =?utf-8?B?Q2VrTWU5dWEvSlBqY1cvcUVyVk4yZm1EbHVoKytBK2Vadmx4dVA3S2tPenNl?=
 =?utf-8?B?TTIrNTBKdTFTZDBZdXRxS3JqeXdRME5RQ3BKVzBDbVFVQVRNVlAxTENmWGVo?=
 =?utf-8?B?Q2xPVkRmVE5mTzZ0ZVJyd1RaOEhYYUVUMDNTaEx4OC9wVTVDa3BQdDNPMFRN?=
 =?utf-8?B?d3hvNVczU0ZxNXlPckVsRlJEWXR2YmtZa3NkaS9WRURNY01qUjhpZEFnMWUx?=
 =?utf-8?B?bmtDZ1lweVF0d0xnRGRHQVpOL1BWVnFCNDRnKzRUYmVVUWhiSGRDSTFCMVo1?=
 =?utf-8?B?TGFoeDJIY1hqZWJocXhtTURZTkxEcjJ2QzRIWFFkdjF2T0ZjckROdz09?=
X-Exchange-RoutingPolicyChecked: kZF/hEJSy5NCvuaEpI+cJo50SZO3dehAEzi0dmZ8Sx1N0ngd6EYM/1IdzqRx2MSOJIADmc/VssrdGZqIDvG0xUM0YuQHCARawpP1KHzTmdlaCO+RyLdt+Ihr4Ec1zTYTxxIlXDlyvYOOkRsbRtAkOW7Ha/Wu9Rnb46yVilq5j3Bt3mE6lc4gdzRLUBzcAYr10uZGZSxxSM75tcyC1UnXYZEgxHq1VB/m9SlQqHTSoiiYuMR3NC6G/aNPamxwMd7SUFCNrnvGQb2Oz0pZxHrDuXWDPfA9r8kq65YTASNJTjul8NzaubnLKd+RIohbFxm/fi5Ow9hfmezIzx3lBcrrqw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 766db878-31d4-4a9b-725a-08def7ab6be0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 13:21:15.5432
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6lorlc//P6EG4NTUv/grsaO6q1Er1nB63+FAYIytWa0Oqv2ePmprSG3x7Sx121Y3XtNrJNa4Z3InaKKFTvcCKztngnAAkhN0ij8ADN1nR/c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7658
X-OriginatorOrg: intel.com

On 8/11/2026 11:05 AM, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Replace dev_err() with dev_err_probe() to prevent log spam when probe
> returns -EPROBE_DEFER.
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
