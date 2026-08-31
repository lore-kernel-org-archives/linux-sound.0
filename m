Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D1ED429CD2
	for <linux-sound@vger.kernel.org>; Mon, 31 Aug 2026 13:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788182981; cv=fail; b=WQFluBGvhQplFsUOPARMRrzn88020MNqATXBiegHQIAaDL93Pbn1etoTPOryPp8gAtfyv1xYbFtKwl2OVo1VKUBaAD1ZmhFXvpxjcWwTYySKQ59PgkBULtXjt3hIFIM0/EeIlwVs7c4aOyxfb1YP/2S/QVl1e+YTXaziKQulirQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788182981; c=relaxed/simple;
	bh=EW0GahtbWFSc/TMgfAmDqqr9bOtlmpIh8Ym4Bfqbg/8=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=UDa9RhzGzx6if6tzST78W6EVObwhJYd5Yd8RRVbIsind+oXJvbxWKUXfw/p/Wt7d4yQcc+3w1dzWI7GEI57V/dYrQghdfE5ms9y2/mS8pqL+Q4gu/hFw9mGgB7+ej8l45YGaGInjV9qK2tP7iWAifssnQLpIYugqVCzzJHGD+YQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZSIyMY77; arc=fail smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZSIyMY77"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788182980; x=1819718980;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=EW0GahtbWFSc/TMgfAmDqqr9bOtlmpIh8Ym4Bfqbg/8=;
  b=ZSIyMY77BDP/2czBNqrmFDoIsSRmWVffqwNUfg1YMxk75faj8VKPI4bF
   uWrdW59cxn1blGY381p15k6/fR8f2do/dP45sAsGqCa7UGWJfDqwJ95+a
   HgZkdSpnvxQ1lckwk2NDdvfcGHbvp16YjbB+iUzpfUJjbH0VcuONW2pRQ
   LBY9nrwJq2zoS3pTkeeLZ0/Cbw9W107ciNFUtiCAJQS6N+kpriX/TeJUw
   FmkG21YmwO1yuKVyG7ImfvXOn4RRbJmoLLiJsQKnL4W6P1BGm8vzSFUyC
   dcDfKIEeT5Al7gXCqiDD/2sd8aV0AZTFdtdf3Y+Vf/O37tkRlqKNnMfLD
   Q==;
X-CSE-ConnectionGUID: iP/vMvSzQGmgQ256lajnLw==
X-CSE-MsgGUID: B3cFZWp1Q1SRe3Ojdx1Q8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="99940399"
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="99940399"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 06:29:39 -0700
X-CSE-ConnectionGUID: 5K7q3B6JSQe8VH48eV4Eeg==
X-CSE-MsgGUID: UDo6pdCbRwilX1DxbPPywg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="272309823"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 06:29:39 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 31 Aug 2026 06:29:38 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 31 Aug 2026 06:29:38 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.31) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 31 Aug 2026 06:29:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=geyaU2dvhEosZZbJ+l5mKA4XjY1sB7m5txLRqjOFVywEiDlvRqXAVZ67sKsyqux5GgBt+JiSn0f10PtNmSsWKAvdh+Kf/KXeakjJaWQD13FvaNEVyFGTFPybFxbgIibxatRg41kjHy6694s1Aa/MQHg3j9fRapjQek0qA/OKuyZrmImwGboJ3eC2a54x7PRX8WwZZk2t2AGYHyoyp1e47OlwNcIRJNTVs1f7/7RRTg7oNHIGiYv2QKSZ9cTyz0cy+vnfsfvArczPDNdHzLAfkIUT/LKUzQ9hClRXJ1oHn/nPeAw11SYGgKa8SIh/92gT3RrMtEivNqm+3llBiXwTYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bzDCpMuGVHLUrqIUbxRIu9vFKmo0a+pdD26UzJopXYk=;
 b=RCw2KWAVpancsCdXCaZ/ldyMwe/gH691uqHziDGvutv//sEmU78YZVvzoT7VHWVYsOCqqdUatZIeXQnjInQ6N9Sec8fpZ6vR8GwrW1oHA+QIFlZRYH5fXP2gdtFYxenZ11yed0E4bTx62O6tPeQMDQW02q0OjWQlGxRKRQh4ggKdHDpmglAjuJFvED7gvhlpdlQPs/xTu4kNwlqQ/rDkA6nN9sOVR8huVHZB/6Q/p0Bt9q7/6MoM9BDaFIyTFlblW9sMB2Ly8Bj/XtRPfky/AGO+CVvKGk53xQDG/ZRaoe8vfofF2XDUwApzqn7DYO+BUhfWVgPp3Z346dU9gDf7GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6006.namprd11.prod.outlook.com (2603:10b6:510:1e1::13)
 by BN9PR11MB5228.namprd11.prod.outlook.com (2603:10b6:408:135::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 13:29:36 +0000
Received: from PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd]) by PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd%5]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 13:29:36 +0000
Message-ID: <b4de8ebb-63c2-4f31-b456-8aa97ac6bb6b@intel.com>
Date: Mon, 31 Aug 2026 15:29:30 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/11] ALSA/ASoC: Intel: avs: HDAudio bus and general
 fixes
To: Mark Brown <broonie@kernel.org>
CC: <tiwai@suse.com>, <perex@perex.cz>, <amade@asmblr.net>,
	<linux-sound@vger.kernel.org>
References: <20260831093615.1117987-1-cezary.rojewski@intel.com>
 <0ebd78e8-4f82-4721-986d-db0c0bb3d2b6@sirena.org.uk>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <0ebd78e8-4f82-4721-986d-db0c0bb3d2b6@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIUP296CA0135.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:34a::7) To PH7PR11MB6006.namprd11.prod.outlook.com
 (2603:10b6:510:1e1::13)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6006:EE_|BN9PR11MB5228:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b756b42-02b1-4b28-bcbe-08df0763e6b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|10067099003|4143699003|11063799006|6133799003|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: mztaL7gcNaWDv7rcgtPopcDQm1Uj/mWbQ4BatVY7CbgDyWx2srlgczgieGZECsxjhSNpz/fagxQWg7O2kIhaMwopRgUbLjC3+An41tSpxDH62EFFeMlr0iECJBoxFbkA9Jm6sBIf3SDy+5gqvlR3KlrGrzUgtlWMsWnOnxpBR6NIGTaw+c1FmMZFOpJLCSWjgOxHalEtsOPsDHRu3fRm8QScYYtareQms75+MWEBlqhPEkLjKTI6zsmrUYA3vtRlzoPjbXgYn2W7AXAixktFkcnoJTUtM7OZ/7QUrzcdOYULKarMuiNvU3o5xggmkBeoTeACxJestBWRkAxUaqriEPuID9bQ0LF99jl9JlrHzbCZfr25xaeRvDrZGDqmaPvsd1mg3CxmupSWbvwgpJL93Qsy8G+RNLDPzGjnAwKQw8PgEznqurZjbkiDbTe5Zm5dms+1eckmGXLu23ynLn1C4mtnf8us7NErdZUCi+YXDYV2PPM9yI3gxpQjCJr7xPPgA1sOf2V/CLKFqoasa9UOwEJycBmBXuZFbprr3P77hZRYLDhS+P8zEsWUZkxENu8uj9fgbKpLOCYlvRyGbpBxBHm83uKLwcFfD5t1nYW1XsY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(10067099003)(4143699003)(11063799006)(6133799003)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TjdTMi8wWCsvTEpnc3UvUVBCeElmVjdkMWV3ZUFBbHpiZGtsUUZyc2YraVM0?=
 =?utf-8?B?TkU0clpXbU5vWnRQalpCNEhYTUU1VnJpc0xOd2s1YVFZSmc2a20zV3JkbkFS?=
 =?utf-8?B?QlhRMU9sWkJpdjJuQUlhZEV4RGxTYkl4UnNyYnVkV2Z0cDdGTm5qUE1IM2oy?=
 =?utf-8?B?dFZoSG15Z2ZzcS9nUnJHVW16MVA5czF0bkV0NFFNRkVvejUxMlZIdWp1NUdJ?=
 =?utf-8?B?cEhnaktJc09WZWtGdFRXRWdCcVVpOERYOFlLNmR6Z1cweFA5MkJtSVJPT0tO?=
 =?utf-8?B?UU45VkdQZ1EyZit0SjIvaWk5NTZ0anl5S2FPVkV4VGhxaWpOSWNjQlllTlV0?=
 =?utf-8?B?NVJPQWVJcVI1U1RTZ0x2UWJ2ajg3V3ppSW0vUGVTSU85azF3LzBxMXRHZjlW?=
 =?utf-8?B?N2l6NVZ0dGpnbWZBZklLYmJVR1FrYW1yRFJjVGxEVkdWdjk0WWh6NVJhUXdj?=
 =?utf-8?B?NFhpWHZ5bnZ5RnRrNUF0dzRiRUx3OG1kMEhTcy82YnpnNWVwQlZRa3V2QjFE?=
 =?utf-8?B?TGFvdlZYb2Rzbk01WVlBRVN5UUtxSzkycnY0eCtpc1k4M0tZdzdJWkpJaG5Y?=
 =?utf-8?B?dVZjVGFlckh0aU05QURSdW92NzI4clhJZVA4dXVOUmd5NjNXcUFtSG4vaHFD?=
 =?utf-8?B?YWV3Rng1VmpOTzFrb1oraWM1cVgzM25WZnFoR2Q0R053Wm90M0hSS2F6Skl4?=
 =?utf-8?B?Nit2RmRuWUZUcnc3U1RGbUkwY3NXWXJwTHB1anpOQ25iU0F1Q3R5M2o1ZmpW?=
 =?utf-8?B?cWY3d1JZYVdDaEhCTmtOd2hiSVkrdEZSeEJweWk1QmJ3WDJwTDM2UVVrenU1?=
 =?utf-8?B?KyszSXdBV3dpS3hZOHBmalJKamJnRDdOM2ZLcFNCTVpEMWJhK056eXJDaFZu?=
 =?utf-8?B?V05sUEtMN0YvejhwanRITm5YRER3OUQ0bjJOMGxkRCtYSklySXY4OW5hN0JB?=
 =?utf-8?B?L2Q4SytLSFFzdXV0R3dHbldPUlJJQlZVL3dreHhDV250eU03OVVwZWwzcE94?=
 =?utf-8?B?a3o1T3Y0VUpNa1VvaUkyL2lZQzNKVkU2SVAzbW5OTW1JN0RCVk5tdUg1MDJ4?=
 =?utf-8?B?b25QKzEraEZ2ZVJ0R2cxbnJ4MkdjdER2TXFWYXBKQ21mZjc3bkF3T1ZwYU91?=
 =?utf-8?B?a2xzSUxNL0JDM0VRTlBpekE0STQ0aml0Z0RDTm02WUIvTWtxdkk0cjRXSWVa?=
 =?utf-8?B?aWJZOWRML04zVFZHRkE0QVArK0s5a2w3RUFWTE40YUVhS1VZMUpBRUx2SGxC?=
 =?utf-8?B?c29Bb29CTlV3d0VjcGlUWmdQUWMyaEtuT1VRRDR3WGFjQnRCRTU2UEhieXN3?=
 =?utf-8?B?UTI2Vi84TFhtN25TdXNYZEw5OUM0WDFXc1pzWGRseG5wZXIwOTNZeW93VFcx?=
 =?utf-8?B?clVBUGpCV2QvQS83d1NVMWFQbzU4NlpuSnljYmRqbWNJWGluaWJlRTIwaTY4?=
 =?utf-8?B?WGlyRzlSTmg0MEtSLzBvTEVxZzVlU1ZvaGlJNWd1cDVRQUdkQ0hSU2VZdXBX?=
 =?utf-8?B?bGdCVE1LNStMUXovNVdnak8rS2k1VmtITEtBVDdjTWNMaUZUZkVCNUViRkwz?=
 =?utf-8?B?R3FtZ0NIb2NRMVg0SGdpdFZvUzgrNk5zSzdjRVZicTY3emdRemZaMW05Y3Er?=
 =?utf-8?B?Zm5BWnJkRVd5UllBWXFNZFl1R3FaNHRoMzM4WVVMVk9oSVdOMHg1OUJWV3Z5?=
 =?utf-8?B?bE95cUVVRHNRaGZ3WTVxd04rY2wvZWRBN1F1WW03OFhOTURwVzQrbis3MnVE?=
 =?utf-8?B?cDBFYWpRWXhsZzZaRCtDT0IvMGRtVUs4aDhOTFRmc2dPVStNZjZwUzh0T1Z4?=
 =?utf-8?B?Zkc0RGJ2YVFqVW5hN0VqT2VUMjlWUDVuRlNuSUt1MGwzWEkrWnBTVk5rbGIv?=
 =?utf-8?B?WnFYSVREdTRnOVlvV0FwWmFLUW4vR2R2TUQzOVV6KzJWV0MrOHlYTnNiV3Nv?=
 =?utf-8?B?VGlEckwraWFZYUd4TzFiY2JocUoxTWhSYk9oWFNKK1BZWUlxZWN2MmtYUTlt?=
 =?utf-8?B?cEhuZytDd0pHdFRuRi95MHlhWlQrQ1RMOU5RSngyaHVVNHNHejROQ2tLRHlN?=
 =?utf-8?B?OGZwbXdodWI4S1pLOWt2c1oyem1Xbnovcmt5MlhGOTRFRXJ0bzFlWG1uemFa?=
 =?utf-8?B?RjFaM2tzOWZ2R3FLc2I1Nk1ibitRTDZ3NEVNZW9ZUTZNeW1XYTZ0V1RaSHd2?=
 =?utf-8?B?MFZ3aVBRcThzYU1ZdFVyQUowdEZZbkp5UDF1MUp2ME4rZWtCeGxkSlcvaGlk?=
 =?utf-8?B?V1JTVEVKNTFQREdyUFZWN2xJRUV6QVRPYitFWTdXVnRUd21VWkwzemluRHFR?=
 =?utf-8?B?dE1UV3BRQVhiK0lBT0Q4Mm80WmlqWDBmalRUZnZpbFZONWV1U0ZZeHZ2R2g4?=
 =?utf-8?Q?Euzy1asuwwAb92lQ=3D?=
X-Exchange-RoutingPolicyChecked: pBlpGvZOr7jQxCwz2OoAfDA6Htz31+TNle9kUI+k9T8bsb0LTxw7nsdIDmcGyvd6hO/vkRJiiU4GzZ+IUiEq2bqbeC7msBH813QUGXwI6mk7/74N1KJLtjtB54vTixr+lPPyq0FWVeyrJMKVkAOEsBNhAr6RSFH9+UQOqQdXrUQAjaseBLC16zLegKuUa2fjAg8PDMLxXlpy6q4tHPu1hI3eo60aAC8F1aEARozNA4Udf8iE/Fm4Wud8r3R+sPMvgfUgZ4M+F0tSdjlQ2fmvqrGQ6kL3wfXi6Ay0R90v/nyydQ46b5hRBpNJh+na+nqsum22ZEu+Q+y6vDFVTkeUqw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b756b42-02b1-4b28-bcbe-08df0763e6b5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 13:29:36.5467
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DTr0CyoAiDiUxVKujtP8LMBUM2/M7W0ITtC8k/HR0WGX5EMWi7BGiqCuXPrmmnf9ci6BMXkO5jQbZafGQBW2FOVGU6a6bPftSBk1EAQRb2k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5228
X-OriginatorOrg: intel.com

On 8/31/2026 2:14 PM, Mark Brown wrote:
> On Mon, Aug 31, 2026 at 11:36:04AM +0200, Cezary Rojewski wrote:
>> The first half of the patchset concentrates on the driver initialization
>> procedure - a number of steps do not clean up after themselves when they
>> fail.  This is for both, HDAudio bus (ext) and the DSP part (avs) and
>> targets following procedures:
> 
> This doesn't apply against current code, please check and resend.

Looks like I can drop the new patch - literally someone else made the
(almost) same change [1].

The goto-label is misleading though, s/error_posbuf/error_rb/ and
there's no need for the if-statement within the newly introduced
error-path but that's an entirely separate subject, not in the scope of
this one.


[1]: Link:
https://patch.msgid.link/tencent_8E5BBBD19D53B1EFCDB6E89F3B6246A70B06@qq.com
