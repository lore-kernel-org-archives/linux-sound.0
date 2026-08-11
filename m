Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C53F28686;
	Tue, 11 Aug 2026 13:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786453872; cv=fail; b=h+jLxbrzxwkP1mdaF6LJJlpfhxGzqnabxH3jHSdiuI0Sqh4oAszZWT3nDJhoydy4ctoFAZNd2esbn91P7Z1LW/0wb1VXUSYswc9u9QHKvs3sWIrC8v6x3UJGDdfi6yYxLcaJ2xAtVnwgnY9iiyefDpLxQuZmJRLMefuKF5G8ocM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786453872; c=relaxed/simple;
	bh=Pk8rQPX7ny9fkk1Yah++x2qczMxoEupdcRYF2zO5AwI=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=tCsLfSkib3nKEHQ5DeF0R/850hHHlOXq9No4DStu6hk7PGKsyilPcN5PznWbyg/GFlpo9gCX9HDTQY2RZ0GoGfapQRbFrDhI2NSeK5Jk+hXvLp9pNesb10XtUFY5AAvSvlVXWibtfU1dyc4FLw4nF8QxNWHFwypWfpTP7zFAelk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iUv5MfuO; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iUv5MfuO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786453870; x=1817989870;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Pk8rQPX7ny9fkk1Yah++x2qczMxoEupdcRYF2zO5AwI=;
  b=iUv5MfuO+yCgbFBxRwHf1uno6JK5Jls6Dp6K+8hg3ilLvYGpKTcXq0bK
   dzZDNaK07G+q6yASgq/qKwfxB+S7+x+S4DVeIA5LA1SC/cJTfnOcwWbye
   KERkhfXAcTUyUQLbRzgM0luuNj0Usonrfa+o3IsrbMdn8XwfsuD6t0oXk
   B76GcMgSoVPiptRY9mnQvW/Z7scAdckjhGlIAaZZWIKkM4sdgYTRjM9P2
   5J0eh/zzohVbi/m9Ta3RrSXtsxFphuwFvfIkos+r6Xoq95i435BYOogy2
   q9RVQTViM8+yQDJRiJVQh4flPE450VyrI2s6cxAti/1LndqVQTSljM610
   Q==;
X-CSE-ConnectionGUID: zWuDCp3/SSKXhBnxbyjtdQ==
X-CSE-MsgGUID: OlzUD1d1Q6+SN1H/9Cmc/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11871"; a="89510179"
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; 
   d="scan'208";a="89510179"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2026 06:11:09 -0700
X-CSE-ConnectionGUID: N3jTZBG8QJSTxEwqy+mhQw==
X-CSE-MsgGUID: 5KLC3/j2RBqywsAfKCoeDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; 
   d="scan'208";a="286748324"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2026 06:11:09 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 11 Aug 2026 06:11:08 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 11 Aug 2026 06:11:08 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.55) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 11 Aug 2026 06:11:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FVvU6vUemk5ez0V2DIjOsM0i0rj9lpjzC2+mkFyu6trrnF4wvX6v79SFXRMzXq/wEC9uyHIxnRO4GShF5Aosx+fq+qdDsHnWPcZho3m8Vjw3LdFft2hWm+WMoxp4ie8T2+p3C1EBPttpyFE8I53kTLQFR9E7HFZEThkYkqG2MVEvmXyo2G4mfFpxE6YzkxviNSRYd/naq+icusBWo6PrNAF5UH4OtbspPulCC7CsebjdhA0pMxE/+2CQg11Sg7QWRigYPeoPSXUyQC8JH00I3Zh2hsgVKXBcxbPXRuiWMAE5fTGIfQLt2PF5KPnxlHI2b4uG6KtaI2/eQLn94nXjNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KQQF5yPGZ8FMGd+0wEygluMGF4MM8EOa3oqTBQbEgEE=;
 b=EO2CetPyvsTisXA6aUuLM+5e1xnRbt8c/x+elsl1GfT4X1T6IbPTu8xfRu3xvHVs9wryw9y0pc83P1HSEETxn5BANqrc+ENATRaj93alAq5T0QahShDNRaN6HXT8B/QPj12UYX0RTM2/S6COqbw6cSx7kaQIP/gJdZuU7zUIn9+E9DwWMv86Ox160JSQYE1hZPUz7RPFEmID13b6zL7zYhzvcjRlUSOliIoNYGvKwLm9VzDY2qktnoWHvE473uRtfH8A4IusxnjSH7bp+O8BO22MhpDvNWm+b3eclltQVn4gZ2Y+TF5/xotJfpk/0oZ35DIwrqe49TVk8WRzHO4n7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6006.namprd11.prod.outlook.com (2603:10b6:510:1e1::13)
 by IA1PR11MB6395.namprd11.prod.outlook.com (2603:10b6:208:3ac::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Tue, 11 Aug
 2026 13:11:01 +0000
Received: from PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd]) by PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd%5]) with mapi id 15.21.0292.024; Tue, 11 Aug 2026
 13:11:00 +0000
Message-ID: <cbceffb2-e573-4c4d-a81b-e6f368050c2b@intel.com>
Date: Tue, 11 Aug 2026 15:10:54 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] ASoC: samsung: aries_wm8994: Drop redundant probe
 error messages
To: <phucduc.bui@gmail.com>
CC: <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Sylwester
 Nawrocki" <s.nawrocki@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>,
	"Mark Brown" <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi
 Iwai <tiwai@suse.com>
References: <20260811090550.38930-1-phucduc.bui@gmail.com>
 <20260811090550.38930-3-phucduc.bui@gmail.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20260811090550.38930-3-phucduc.bui@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P194CA0029.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:803:3c::18) To PH7PR11MB6006.namprd11.prod.outlook.com
 (2603:10b6:510:1e1::13)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6006:EE_|IA1PR11MB6395:EE_
X-MS-Office365-Filtering-Correlation-Id: dd0d52cc-3330-446a-6965-08def7a9fd46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|22082099003|18002099003|4143699003|11063799006|6133799003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: M16OWWYgczbzkMixMiy6NPqFIzwY1V7C8Yzy3pka2XQ63QL8cORGCYI5nwgcUOWVUsolKDflMT84Nk82mc7j9zDilyhp5ZSQrKxYxojhiXyhgdlhr5PyDz+Ogyn9tRPd02TRODDY4R4tYSfbdmpfw7iDCNfcf+A8OA9WKWgwtJAUbIvsCuYE9gCYcxPCLTN3ejd0Y43cfJlJQuj2sDCOOBdmbdeMHnZQDr5qcLWHoQtNrdGpwVj3i6Fgm0KWBJFNZLw1jeN8ZthpbG+/XxzwS929sqX/AT4dHROK5tV/2g+iwa0QsoVChT7mRpL067XltTyObXjyaONp9N6fVty6pfQ67782m05kE4sPNfKVesouwb3EQGmRA71BafWIm8msxDQMsfspB7y0iVUyXxqha95ENeJySDuZd/YobANmM1t0nvEt6cWH0XYfHjUxUubC4hxjK2cA/rRHwKknHs5MErK6Kmbx52EA1ePoZYwkx/EXG5jBLPRxoug1INeqfBJqaqQ9j0AEJc5x7zgu46yiRkCPtcHmSdWmY7HIw8o3SPtppzP+MdDB/BXxvDK74+N0ZveS9SssOwn/Em4HRqUhe1RhIgQYYhQqeoipfm4GM8dyRx+4Ofpl7Lz2J4ggfb6s/uhLO6/cswwCDwO9gXAkqbbLnjZI6uDyWhqfwPg4Bcg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(22082099003)(18002099003)(4143699003)(11063799006)(6133799003)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SnpDOWllM3MxdGRiUFo3RHp0ZlYrb0Q3UmpwQzhuRjFCZVNnMXdUMGV2ZXhr?=
 =?utf-8?B?U0RiL01tazdRdmE3RVJoVlozWGR0SlhCRmw4UHJ4Zi9hSTJ4MUh2Vlk0amhr?=
 =?utf-8?B?Y3lISzNFanpKZjZVQUZDVi80WTFla0JWMlNzUEI5T0JCNTJBWTJ3ZEpoMU5C?=
 =?utf-8?B?aklPcXQyNlhjVE1MY0xVd25wczlEMGlzQTNSQWRjRnVkRmJiK1lnK3BkbWxJ?=
 =?utf-8?B?OGplQnlMWlIvZEdwbjR0M3AxblpLTTRJY1RLTWxCSlArcXhnU1QxNnZmWXFU?=
 =?utf-8?B?bzd2TUxWU1lxVUJSTStNUjVEOHpGVCtPK3FSWU1yL2dJYVFzSGpTMFhzRE1T?=
 =?utf-8?B?SjFCUkJVYVYvNFhQQzBPTVQreWQ1SlY0cDB4SHZ0VTIwb1dtY0QyRy9Bb2gw?=
 =?utf-8?B?YkFrb3ZzRHoxY2Z1RHhBQWkvYk81OVpxcEs0aDBsSmFzaWppNmI0RnRLbDRZ?=
 =?utf-8?B?UnBTSk5iTjdaYllTS1BQemNmS25RUHN3eERtYVFzWGRDaENGbWdjK2tpRGVJ?=
 =?utf-8?B?bVJYdkxzTW5QalByMXdSSXFaY2trSGVnaFdKYkNUQW5YZDRkTEtTYXRHZ2Rj?=
 =?utf-8?B?SWJaWG1HT0UzTEplOVVMU0lRMzhPb1lWRUZldzFYa2UvMXdwYnlra2c1OGsy?=
 =?utf-8?B?T1hPcFphZHVGSG9LVWpJZGpqQlhKYTNsM2JmQUt2YVdWVEF6bDNZSUxaQUxk?=
 =?utf-8?B?eUE0TkFBUk1PekxTT0pONUhXcG05UC92V3Awc2pZeW1sZHh5ZzhYR3VBNGM4?=
 =?utf-8?B?bTdjbG02Z2FhSENRV3dzNGN6azFIajJac3dtYnFTclFLUTIwOGk2cWhYYW1z?=
 =?utf-8?B?enhkQ05uMEg4VGRiTi9SZXdxZ2JWZnBYTTVGOXJyTmRveUlMdTZKZ1JnZTNX?=
 =?utf-8?B?cFg3TU9hSnkyOXNtUHJJdmloTFdaTzB4QWVWRTM5d0RjMlU1YVROdU5MZjM4?=
 =?utf-8?B?UGt6SEFwOEZVV1pnSmdGYUUrRUFBSnZuMkFJQTVRMWZLUkh5WVJ0UjZHVUk4?=
 =?utf-8?B?YmJIM0h0Q3NOVE1WWjBNblFKb1gvUEVxZ3pad0NHT3RpK3ZqdUI1UzRJeWpV?=
 =?utf-8?B?eUJZK044SnBsRFBkWGdwUVBYbW1GL1B2R0w4MVlwZEMrUzg4eUN1K3lUbHF6?=
 =?utf-8?B?K0FtYTdnRnBlMXpmVTU1aDl3cXFmTDN5ekZQci94cmRwQW1hRlFHaGpSSEdh?=
 =?utf-8?B?Z2RKck1nQ3h4eXR5aEIxNXUrbjNwcE96clpTZmkzYjZ0RXhjVXFTWmZUcmd5?=
 =?utf-8?B?YXNjV2VQdHZ5SVF2bmNrTGl1S0Yrb2JVNWxZcGlSbk9LOFVZdjM5eWRzalIy?=
 =?utf-8?B?TTdpbEJNK2dscit4ZHNraldDY2k0Qk9vNGJkWkZzOGd1ejh0MWFxQmNmaVl5?=
 =?utf-8?B?cFFpNy9UTUNtUE9RY1pnSVRHZitMY1BTNlQ3a3hCSW1kaEhjY0duQmJoSGQr?=
 =?utf-8?B?RmFxRUNqdWpyc2wrYW8wVTBHYlNZcWxtTVYyWnpjZUpBVzg2STU2bkNoVklj?=
 =?utf-8?B?cERlWmpBQ1VIc1ZTUGVhbExCS09FSGhid2ZkNkN0YkZudjFkMk1YRTYvRzZN?=
 =?utf-8?B?R2h1MmRHL3dvaFVOUGpSWTV1OW1hbjdEMXB1bmhXM0MyK0puUlZkZU41dnVS?=
 =?utf-8?B?R2pXM3BOMlBXNkFGbVE4Qm1sSWdVSC93SzhJOWhSekFGcVVJdVR1WlFvUUxO?=
 =?utf-8?B?MlI1blRmWldaVzNuL1o2TTR3eDl4NXc2ZTZSTkZTY1J4OTBBM3J5YjZYOGJV?=
 =?utf-8?B?eEZLNThuREMxbWdBdEQrQmNYYXZyZS84TTBYTjFHSHNoMFVCZW1DY1J0Tk9o?=
 =?utf-8?B?bjhsaktGajJibXgyQ0RVNzY0QXdWQ0Qxck5ZbEpNUUc2Z0hiQUxBd0pibmp0?=
 =?utf-8?B?QURMKzFUcDRBMTJHaldBN0NEdkViOCsvb0FTU3NUbUdnY1JGM1RKNTNMenRE?=
 =?utf-8?B?S3ZoYWlPUFV2MTVPL0xoRHMrcHRxYU5WNlgxVUE3QnEyc2NYTFJvdTVRRGJW?=
 =?utf-8?B?bkEvQ1VlTDVwRzJzK3ZOa3M4U3Q2RnU1UzMwOGp6ZGZ0OTdYY3EreVIwQ0dz?=
 =?utf-8?B?aUlzMFpDdXcvOGY3T0pnQ2lOZDdlcHhvS2FQc2QyWi9zc1JqYUJuNEtaQnhO?=
 =?utf-8?B?WG54VnRhUmtZSFA3V2tyZWEzVnJFN0NxMzBLY0UzUEkrdGZhL3RBdzRCWGpD?=
 =?utf-8?B?UGV4UWdVRm9Wd1libkFEamthaFZwKytBeXRET042eDhzYllJWW9WbFAyVVZC?=
 =?utf-8?B?bmlPYTk1aVdETE5OelNYbU1nblUwK0ZMWnJEaXk1Ly8xOWJINjdiZEJKT09O?=
 =?utf-8?B?aWRlYTRzcVJFc0JyclBhWmZFQ1k0VnJvbzVnZlRhb3k5MktVNWttRDUvV2dX?=
 =?utf-8?Q?zBjbjBHCvkPK9cqA=3D?=
X-Exchange-RoutingPolicyChecked: dq0sdQ/jwpA6Y39o0oW7Ybrv3lrwIkxmkoX0O5IuyjAAeWZFcmIkZ1t1G8E9hKnbpcxj1SLNjeyBrTGwgl0Mz77StIdHyMsP8WPXBxk8TwEY4oo01zp6kD8MvvDKHD31zlwZI2iBfwwxLdyzsnBBf9YxUe9qSQlGgn9GT4pdKZjVNUKXtGxCd52JU8KtOI57Q3mRypv1rl3gCU0Uc6V+gCCFelOUg4cbmuVwm69mdJeRoBeiJ3aLefw5A/e8evOabsRDrffIOV9BZcdc3kFJB8AbJRuuAXfqxOpG0n66udMoAg23VCrG887bVq/tIvFpTLLxSleOERC3fsp9nC1Ojg==
X-MS-Exchange-CrossTenant-Network-Message-Id: dd0d52cc-3330-446a-6965-08def7a9fd46
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 13:11:00.7383
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wHsml8sYS37bmNs2avUX+3LIvckNSo3BxneE8XdtkfsXbL7O9AO6moAnGsrXTf2X8OwwsKMWHHAFFZakwhSQd/flFmy0OE0uWRDFcWRwqoE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6395
X-OriginatorOrg: intel.com

On 8/11/2026 11:05 AM, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Remove the probe error messages to avoid duplicate error reporting,
> since the error is already reported by the called functions.

...

> @@ -671,10 +667,8 @@ static int aries_audio_probe(struct platform_device *pdev)
>   
>   	ret = devm_snd_soc_register_component(dev, &aries_component,
>   				aries_ext_dai, ARRAY_SIZE(aries_ext_dai));
> -	if (ret < 0) {
> -		dev_err(dev, "Failed to register component: %d\n", ret);
> +	if (ret < 0)
>   		goto out;
> -	}

To be fair, xxx_snd_soc_register_component(), both the devres and the 
non-devres equivalent do not report anything.  The 
component_initialize() and component_add() do though, most of the time.

>   
>   	ret = devm_snd_soc_register_card(dev, card);
>   	if (ret)

