Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE2863C7690;
	Thu,  2 Jul 2026 09:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782984284; cv=fail; b=sS4KnHKtpsy4+7JbSPaMDMsL5Xg18PEsJSWB8oTp/yqb4viVqcyTLRzeX/KXH6fk9OGNWLa5uwpPyumxsiE3yIqORZXapd5yTL3FYF2wJpIS+1FelOqSS1rWfWErNYh685Q6zv6EFRs2UMwtj1CrGfXRyu+hWtWqTIE+tNFswEs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782984284; c=relaxed/simple;
	bh=3jn6MGVPGsJ3PWrmzSuGGOKME7b4cHMQ5eLetPmIxEQ=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=JvmsxUjbaTop1rn8nQAQjeegrC7oAn1VGG7YcZj1e6QLkyHFcKPDqwETd0+ItPmBASiMCk/XFdYRV8ZkRgW1Fx2N6pcUhhQvbU5qDG8JtXCSTfWV///rVK3HajtMCLXSArs9g1iWj6sYQDJVblZyWRNZYRfyE4qAcLbw5VcY5CY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LFn8wD08; arc=fail smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LFn8wD08"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782984282; x=1814520282;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=3jn6MGVPGsJ3PWrmzSuGGOKME7b4cHMQ5eLetPmIxEQ=;
  b=LFn8wD08sHVspfL4VogV9Qqh7fsCyrMmEdCmmti98RgJybM2QGoNkdKm
   v0LimDZ1/DkEdeBXjO/pmT40qcmulwYusTuN9KZp4UPN6GqsIE64S2BAN
   pGGS+6BXu278/w51HTlqIrvTEMnqZUfLJZHlFOS7bKi2aVwBc8Ef9jMp8
   fEJE3x+P5r7EvPHZlpwHhVqcioE0ii9amsooeRtjG3RfwxVxpepqTYxO6
   Q0ydwI9Ay6meQ/roFhJwUKtGL3WSnSDNynEmmZJuKB0jHgV40WjRlJ2FJ
   hJ17ObXL270BXvJgFI6vvLw7kJYgl50Xv7XebSlJWlnvCuNqIIsEi0DRE
   g==;
X-CSE-ConnectionGUID: LmIRD84NRhKATOfc3M9Gug==
X-CSE-MsgGUID: NSOMZ4w2RC204+dzm9IQgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="94333061"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="94333061"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 02:24:41 -0700
X-CSE-ConnectionGUID: zeNnQqaiQT+S0eKzEtq4pA==
X-CSE-MsgGUID: Bi6r8c3hTPGZ/MWBsoqMqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="250157836"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 02:24:41 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 2 Jul 2026 02:24:40 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 2 Jul 2026 02:24:40 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.42)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 2 Jul 2026 02:24:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xHBOmaVDcsAVX+wUhFiEPM6OUTTZz6Ll5Y4753C3l83S5jB4KUWqHAT9AP0XoJNAHaKxUPtZervGVZsVUmHmDOy4kNbP/7yjSypu7NArLS15NX8nDDjlAaln1R29DAcnKjxXmW1j+L73AO+hY2BK5rOswldrDGORKuoJEXGXaU0ldQh3Rv1H7IOyUKFkbPiP8CR1JxOQoaILM1wETT00E6ajpc6Gq2fT29tLIAHDy4qe57TXNJs7pZiJgLBwrpLY6bbxCsaLBV1jQmcxSJ55MWLzyGx7uwrJYGMVg3FhnaBUYGGaCDN4usJ4NxmsnGtnGxsyWbk1pF6ZryyZavXyuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WyqEucLhfP7WYngFtGGCq7CbaqWzbDjDx50iGWOu2Jc=;
 b=YE9ws1tTcB8w0PvlgPJZwSQjOSqwcWDwJhe0SyIk+jfAVdqbqPscggWP8+TGxWKnik7VQYQUkN1x+zX5w0BV+qCB3RkKbxULYaqobv9pW0hmQMHLP5xgkXCgB/+xGHtvAtUtrzPLYROlWHg8oEiGboERQJSc28h2O75asTcmSShX2zQshNkLQRWkY5YdW2RYSIr6E9+uu4S9VPPEx43MJ/awvH4KkVgDKV7fHSTxEjiB8agYa+2t2yBwRAixzoP1aIxeEd2qcFJVqO08MeNJCcHImD6xeTeFiC6UZh5eUBpKK5bTY+galAI4Z6USyE/cnEtmdo08vZSc7z0Tj/o+aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6967.namprd11.prod.outlook.com (2603:10b6:806:2bb::15)
 by PH8PR11MB9746.namprd11.prod.outlook.com (2603:10b6:510:3a4::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Thu, 2 Jul 2026
 09:24:34 +0000
Received: from SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4]) by SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4%3]) with mapi id 15.21.0181.008; Thu, 2 Jul 2026
 09:24:33 +0000
Message-ID: <aac11007-b2c4-452f-9b5d-798d20f675a8@intel.com>
Date: Thu, 2 Jul 2026 11:24:27 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ALSA: control: Drop redundant stream_open() return check
To: <phucduc.bui@gmail.com>
CC: <cassiogabrielcontato@gmail.com>, Kees Cook <kees@kernel.org>, Mark Brown
	<broonie@kernel.org>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Jaroslav Kysela <perex@perex.cz>, "Takashi
 Iwai" <tiwai@suse.com>
References: <20260702044635.29808-1-phucduc.bui@gmail.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20260702044635.29808-1-phucduc.bui@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIVP296CA0056.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:353::6) To SA1PR11MB6967.namprd11.prod.outlook.com
 (2603:10b6:806:2bb::15)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6967:EE_|PH8PR11MB9746:EE_
X-MS-Office365-Filtering-Correlation-Id: 1da2d818-4af2-40a9-7c11-08ded81bb9eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|7136999003|11062099010|22082099003|18002099003|11063799006|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info: hpAf/C4QOfixqOf+in9YHrMGLov9onh6a5bxC9LfNT1wzm6EMjZUsefbMwVVHbK+0t1RAbvGIhvazKmrCTDgfPKzEBOI/ccsmAb+M6zbpAc0B7c/yJpbL19F+b+eJ7wY/OHhHFBgHnEbcFmlxYNnxKi8mwOfUMAXYCt7E6JviK8SbKENnHk9MfoXaFZNLPXwsHTp/NPVW8AWMnCQuAGHHcADC1+yjoVD+ZxQ8E78aE1jc9t4nWV1MxZVvq3Q+K2I9nNo58T0GxP71Vxh2L9uH9PhRFwkweQLL5paV4FXwqr20EBsBoOFYGdHbSVRb0ymppekb7JDJ0Tgp2SpcMfY11p9x3P2tryIwJOB3aZRJbaxOu22eBdiRPdhGeaHXDKT43fBWcaAr6gJ6hj3USzHTZiGc9f9zkGM7SRtgZGfczdAZYVNQiCXT1HqggP6itG/rBcF4ebY7+K24zm2VbyTRVplLb+IhnhToHD/MdNX/BvHStsUW09+rleU5ufzY5QNZrAeaLgjHb2I/2iGAxqQAYmgJQvU8C6FxiTqv4uV5ErKBxmUe+9KNKTaS0Ekok6fqWdCMGm8lVzwephYJjU6atifN34oc48RcjrZ9r/nNl9wfL18pj1WAD3XypgxAVX8kQqOJQGo2Mu10d0ItNOmX0NlH0xDvsXf+mOvuoceDKI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB6967.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(7136999003)(11062099010)(22082099003)(18002099003)(11063799006)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QmltbXVrYWp2V1pQcGRKWTRvVmFaZ1hvQVFnblBXcmNwZktza25RM2htWStr?=
 =?utf-8?B?RVlJU24vQUZFeHBDQ3dJcEhGYlVGZ0FudEo0d0FuSHBHMGJOdE12Q09QSVhh?=
 =?utf-8?B?bG10UnBNd0VXREJJS2RNK3hlWDBNaGp4UHBJZVo5dmpmUG5tVUpieGx1ZDNx?=
 =?utf-8?B?bmdjWWh6TjVXdFJ2MjdxRWxwa203RkNJUms1QVV1Mlpwek5BdDNHVHVCR1A3?=
 =?utf-8?B?UHg0TGxNaUJ2MmxnQUNPSXhlUTlObXdjRGlCMXJIUHdkOUV6enN5Vm5zaHNw?=
 =?utf-8?B?cld4ZnVFWUozOFNBdHBmbnN0WWpVK3lwc0pSNGIrNlBqOVo2YmNCTGxxbTJk?=
 =?utf-8?B?N3VCR0xNNURTQzhFd2xaRHFsMkhJSTNTUDhzNVVHK1AwNjZMblVFcWJMUnZv?=
 =?utf-8?B?VTJFNm9nMDBxa0RJdXdyNzdwQVRoZldGMnJtNHhSVnRPeWRLUFVYdEJOcm1R?=
 =?utf-8?B?MHVuOStCcUE3R3FXTDBDSWFkMGlrd0lvM0RpMVNHVVRhNVQ1bFJ3dzlNM0dY?=
 =?utf-8?B?ZUdJT1UwSlpJNk1iNzhsN1duc2pyaUxQNU9ld2RvRlVldDRaNWt1aGJWRlll?=
 =?utf-8?B?MnE2cXNGa0pHYUNZRW1ZOGdlakRWMm5ZZnFTaHRSUmZkV0hNNTNEeFREdDVQ?=
 =?utf-8?B?RjdYQnJhUUJnZzA5amJBRHBEeGJPMk81bUlmTXc3RmQxR3ZBYzFjSTZwRDZy?=
 =?utf-8?B?U24vS2JyWVFVeXpXaEhhMlp3N0VTZXRNalZWN01XdVNmSitHT3FGYkpLYVJj?=
 =?utf-8?B?RTdoeEpsMXFQdm0yS0RSeUFFbHNVdHU4MjlKUHdoL1BlRlF4SjNSSmh3VHJ6?=
 =?utf-8?B?S2FJc2l3QW04MVp5ZnJpWVNWU0lUQ1lkR2hkYVhHQUROc3RyUUN5cjY4a1BU?=
 =?utf-8?B?WVpJVTExU1FYeVV0b2FMc09VYkIxRnR0VXZqbEozSEV0eTJnMlMxam1MYmRI?=
 =?utf-8?B?WnVUVHFoRXNuWXUwY0VZb1NuTUZncUh4VVJBQjJVY0VwMzlmMnZWTjRYWnFL?=
 =?utf-8?B?V2pjL1VEUW83ajJteXB4VjU5Sk5wZ0FZTDZNSVpzaXplVW9sS1FLRHJXUVcv?=
 =?utf-8?B?N0VKblF1dWU3cHFFOVJvWUJkbzBPYjB5cHp4VFpDU2c5ektKbnlyWE9DUjJN?=
 =?utf-8?B?MlQ5TFJBYWFaSXJabm9BLzJTVm94Z05jdHFndFJCd1dlaTN1NkwwYUk0YVdk?=
 =?utf-8?B?VHNhdUtuaHk5YmZablJvV3EzUVJGVitKV1ZwOGpMME5URnJJcXowZW91bEEr?=
 =?utf-8?B?VHhwNFFDZkFiS1l1emU3RHNZTEVRNDdDSHhFV2E4UURPMGF0OHJpRnhoWVZ3?=
 =?utf-8?B?T3lkTWJkbG9ERmFKR2Q4aG81QU13ckVvZElWZVBHUUU3MXA4SzBlMlY0bzVJ?=
 =?utf-8?B?Wk1jeWJnMU1PZ1NuUnFGdzZkNDVGcjg4eXZEdktNZ3NZTUM1cnR3Ymh1S2c1?=
 =?utf-8?B?elY4RWhaQXhTZXQ3ZHBNeGJ0QzV5aGM1bHBQTDFPaWtDbTR4ZjM2eVlHa2Iw?=
 =?utf-8?B?NWFyV3NFSDA1MFRxaUZ3ZVBrQlkxWkhVaHNkSkNpdWdWaEcrMGYxTVZCWitw?=
 =?utf-8?B?aGM3M3lMYU9uQ0JSMXR4QUNpclBOYUc4elFiTmRNeUwzMVBLUzlYR2E1Mzdo?=
 =?utf-8?B?Q1MwSkN5MDNOaTVCUWxSbit6TTdCcjBhbjlXNENEVnZkZDNiZXJXWEY1MVM2?=
 =?utf-8?B?RXo0THYvaXJtdUw3RTVFU3l3NVFSMHhMN1gvZkMzZDR1M2JHeGxaS04vL01D?=
 =?utf-8?B?MWIxL3lDVGRXbzJ2ZUhDdXNuM25zTHFYNEJuNyt0UEdpeG8vblhaM1pRL0Fa?=
 =?utf-8?B?aDRjTXUvV3R4bWhRQWZjZEdxcXZRRE1GSDhMYXp3WTB6U2tyOCtQL21SSnhV?=
 =?utf-8?B?bm80K29YTlZBdmw0ZFJVb0JlbFo1VVp2MmEva0FvVnQ0YS85NFlmcTBKNmhM?=
 =?utf-8?B?cE42SnBZYjBZVFZaL1N2ZWg4RndEelo3RkRKZ0U2VDdDQXM3UWxZV2gvNkxH?=
 =?utf-8?B?ZnAvQk84b2ZoQ0lqbDhYWlJZQVVUclAySVJyb2gwK2JraTRyWUs2djJkS2dq?=
 =?utf-8?B?bkVVWndMOTJhWHNGSVB4Um5DY2hnODdjVSsxNCtTY21tYTdESktiTUZVVHNh?=
 =?utf-8?B?WVFPWVpQN3VBaE9qT0c4TjZEN2lTRXYzSndGZ3dQVDRGSlFzNnF2T1BUSFpG?=
 =?utf-8?B?MmF2cmwybmtlRlFhTlFVVUlSa3JjNFR1bkpvZXh5Z2dzY2oyUWNkeFZxMTdG?=
 =?utf-8?B?Ymp5M3psQ0s4RmNIQUxCSnZWMnVoNWhLMkIrNzdxVFVxbXM2NFpFeTc1MUZw?=
 =?utf-8?B?MTlFcGhiTkxXZnVOak5zT1RpVDBKUTlQU0Y0T1pIaWhKVXA3dVlVbXRnOENM?=
 =?utf-8?Q?wm/qQ6+RkvMGUzTc=3D?=
X-Exchange-RoutingPolicyChecked: IIBClvd1lEZXlrmho4MU69uoeTWe+yicIP1AvcAV6AzodLjOxW/KdPPpORdvicyABda64GHgQIjVk4MRMHXPlghDNQkhmVHN2aFXfFTxAQJ1qrVBDs2o4IkZxbPqygqRw50nxmiq27pOtiaorE+tL+U/Vn7rBScGuWVgMoCiypI6lJGkbzE+cKqbnw25ju0a4z5sWMY6nc1B/Ll0bOOsu6uYdcvW4juVKPeg3TvRbgeq5xzsU96SBQWaEQGtGJeQ2ufUZyYs1Xji46hJPyQ2n+FTVNk0mJaICCbxARgsRvYLfCC49R2TtZPkLt7NL6776BM1lyrb/FybPURbLlVL0A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1da2d818-4af2-40a9-7c11-08ded81bb9eb
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6967.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 09:24:33.5272
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OVIW7EIcwz9tor41EP1tFjNH1Ntu/QIoGg3vj7beEZhSFaFR9BDFWks6rUZqeXOHpIUPUfWpk3YWkX7tm2n2Lo5uWf38XNWP61M5aZSLaGI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB9746
X-OriginatorOrg: intel.com

On 7/2/2026 6:46 AM, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> The previous conversion from nonseekable_open() to stream_open() retained
> the existing error check.
> Since stream_open() always returns 0, remove the dead error handling path.
> 
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---
>   sound/core/control.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/sound/core/control.c b/sound/core/control.c
> index 7a8dc506221e..4cfb0be14c92 100644
> --- a/sound/core/control.c
> +++ b/sound/core/control.c
> @@ -56,8 +56,6 @@ static int snd_ctl_open(struct inode *inode, struct file *file)
>   	int i, err;
>   
>   	err = stream_open(inode, file);
> -	if (err < 0)
> -		return err;

This is a good catch Phuc!  Typically such conversions are discouraged 
as things may change in time but in stream_open() case its documentation 
clearly states: the function never fails.

While not drop the assignment altogether?

>   
>   	card = snd_lookup_minor_data(iminor(inode), SNDRV_DEVICE_TYPE_CONTROL);
>   	if (!card) {

