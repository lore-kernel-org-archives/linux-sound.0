Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53FA028FFF4
	for <linux-sound@vger.kernel.org>; Fri, 11 Apr 2025 09:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744362441; cv=fail; b=UZuEkFQXF8jBkGKkHmfxpF4GxcTc7LJTodB01ra+i+p4yEeSLlKMKnNNwQcxo8vz4lPLnZoOHYP+3dPzY7WoXFINjaSoVOOPfPzZ4N4MOa4eiqDEgR+7wzTbYWHuqfb5HZbKPKMAxsh+CKUQKrYa/azB3TQaSnKc8rZ4nnBUirg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744362441; c=relaxed/simple;
	bh=mlN+lg0I/X2EuiXe5qlBIHq27j24ThiFb/LJt2HS6TU=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=isbJRTI/rJkkk6BP0k4oGEQ/ju3M+vn+hJKqzuBsbuJboASJZ0KRXeSNHtHgzNkUVvoHZc6KisWOA+FPGb1gNoUzDkE30uZK1vWtcFlNrysBjTNcFGQlAxxGxzj/idYp2+/P0QYsBSlLSezeI6F/T3lv+xa94U2StHQs0Shup9s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dgmTau8v; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dgmTau8v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744362439; x=1775898439;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=mlN+lg0I/X2EuiXe5qlBIHq27j24ThiFb/LJt2HS6TU=;
  b=dgmTau8vET1U6WL5JzhvAFhmKnMcZxRM01gSpLBzuJWxtf3Xr68al0VN
   Ap/rw/ZBiKnZhDBQJ7euT5HAyAQk4AULWmb8FPvAwCi36LA6RIifeuAFq
   SeDnKkBhtb2TaIxMlUTap9VOPzYbCoPDb1sq+XpeUGTVqdcZfSBEsZwj5
   9EH3GkzDnT+Y+IZfrxBXKXIElRqiNMfKqJgSbbau7d+ze8Yo9Xn3yFNCG
   kF2HuzSuK+LzKmluBWkmr6eqZpcLB09ldIchG/bTT9S+aVwBbybi41Rt1
   GZhAy7UysaCHQ/vbq8up38P4ttdrRhpaTHui+x/234GfdXSm1dUnjWqO/
   w==;
X-CSE-ConnectionGUID: 9huZhBhzRXmrmtNQXMms4g==
X-CSE-MsgGUID: lwHAxoTOSPuPH5KR/Hfqeg==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="45922416"
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; 
   d="scan'208";a="45922416"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 02:07:16 -0700
X-CSE-ConnectionGUID: S0DHFF9/S+6zYgkQZGxUMQ==
X-CSE-MsgGUID: WCi2SVwgTRCWUuyATTTAiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; 
   d="scan'208";a="129704802"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 02:07:16 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 11 Apr 2025 02:07:15 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 11 Apr 2025 02:07:15 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 11 Apr 2025 02:07:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t2vZMWEoX805gu0jBAyBWtrby2XxJNfLWLL+EgXUWmWV8zpyrXlRCMGVSQBxM4VG2b2+6x5cdN0wDtNXZFHNnj8pk1HvEwUYcwFQ4LWvPXjQ6I5cyQWBQEcbMkJZ85Wg3oSFXGw42U0v9sEqr18RXxgbJJO28ywmNUjPhhMGbe4uBmMLt5HG3MwhCkJAcedh6rrCJ6V5u3Bdq3bes7TJvGCAJR5TRppZmRKcwP8nzME7h0RuT3xCR0cVj1NJQjKVRwkyrkwifSznk8d3yxqR/pcZJlGVk8/w+gnXpNEMknZ3PbeAWyUKkVeTPNcBf/3szZxfz2K+i2c1yXnJJQ8R4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GDKewnVbdYUXe6EwCnavUm2+dCE1pynvZZPig0RvCF8=;
 b=MtEfdhsd2JSS2fFcfriRgwjXhw3PIVJU4CXPKQH2wXkcC1Yng2lSOR7ZU90e36RWW++Qzyv9pi89yT/3IIqn8GbFVa7uN3i+ASPm54VkLMKpccoPDVEMc+ToZ9XW7f7vEP5pU2Rs6TPFTCLRds7AlRwHDDlWOh27Y/CrR5CDmcQW+Xv7XzEWh09dS/KgnLmZ8fXZ0AA7trFVDcZE5L3/ms3HX/ALey2qnCp89PbIYJBPfrO3o9YB868RyPgDVeKuYb0m57LkaV/+m54zEMEFbAi3DRcVntTmyTHC8Ta2gecYgTG0osiisMY2XYTsYq9emBD63LPZq7Nrzc1PwD4Psw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 PH0PR11MB4806.namprd11.prod.outlook.com (2603:10b6:510:31::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8632.27; Fri, 11 Apr 2025 09:07:12 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cd01:59f6:b0f8:c832]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cd01:59f6:b0f8:c832%6]) with mapi id 15.20.8606.035; Fri, 11 Apr 2025
 09:07:11 +0000
Message-ID: <fefd793a-3625-41a1-9fa1-ddd6cbbf3612@intel.com>
Date: Fri, 11 Apr 2025 11:07:06 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] ASoC: soc-component: use dapm->component instead of
 container_of()
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Bard Liao" <yung-chuan.liao@linux.intel.com>, Jaroslav Kysela
	<perex@perex.cz>, "Kai Vehmanen" <kai.vehmanen@linux.intel.com>, Kiseok Jo
	<kiseok.jo@irondevice.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
	<broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, "Peter
 Ujfalusi" <peter.ujfalusi@linux.intel.com>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.dev>, Ranjani Sridharan
	<ranjani.sridharan@linux.intel.com>, Takashi Iwai <tiwai@suse.com>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>, Benjamin Bara
	<benjamin.bara@skidata.com>, <linux-sound@vger.kernel.org>
References: <87plhm9h5q.wl-kuninori.morimoto.gx@renesas.com>
 <87o6x69h4y.wl-kuninori.morimoto.gx@renesas.com>
 <921a38aa-8a75-4561-b505-14961d9e20b5@intel.com>
 <871pu0na09.wl-kuninori.morimoto.gx@renesas.com>
 <8734efh2s8.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <8734efh2s8.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0005.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::11) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|PH0PR11MB4806:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fa57141-0c1b-4b5f-2935-08dd78d83ea9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cEgwYzFKZGxJQllKRGhrVEZMU2VyOE85RnBxMG9CemFLT1haTjZ1NTlDYTNj?=
 =?utf-8?B?ZkhPRzgyVjlQOTVUOU4xeTAzMXlZS1QxTVMyRlFLem1MRlJpbzdpeG85MHMw?=
 =?utf-8?B?MjZCa3hmVFlJdlBXTS9yVjYvZDhJQ2xjei82MFhWY1I4c25ZSDNtMzFqWEFZ?=
 =?utf-8?B?SzVTbEdhdTJPN05IRmlobWMrUFlsUmdvTHZZQWN3MHoyOTNhMGNLZS9taUFI?=
 =?utf-8?B?WDVwNExoYW9McE5ZUmRBem9UTWZVSFUvTHBsVzUweWdWb1p5d2JOT1RkZkQw?=
 =?utf-8?B?RkVpdVhWc202NksrZXZlRnhxc1p4UFVVaWFUdnNURkxxWVVkQ3dBSjMyeUU3?=
 =?utf-8?B?TGhZSW1oYzRZUTFQWk93bUVXdzY4a0Evb05nQTZOZHBQVXkvZTJRa3RwN2N3?=
 =?utf-8?B?NU8rSk96cFZ0Q1BHK1c3dDJSekNFRmdFMlVsajh2dU1mcUJpazJ2UDF5eGhs?=
 =?utf-8?B?Y0pWTXVheVVjL3M1aEtUS3BuMWpmT2JEaVFQR2h4TFZuNnBoTEtPT2JKY1BD?=
 =?utf-8?B?TGEwamdCbXZTN1VTRitqeFhtZEtBT1pONlhoZ25jVEZvczJXb1h2blE4TERi?=
 =?utf-8?B?bGZIaEloWnEvVjBrTC84eCt6VUZEYStXQzh1UVFYS0lVZUR0YjBCT09TT2pD?=
 =?utf-8?B?MTBTeEhLL1RPeXFpMWlCWWZXRVZ1SWV4VjBwVHVPUE45bkJFNmViWjJTOEpR?=
 =?utf-8?B?NFJpRWxjcC9iSVhrRFBjbVRnY1NNOXA5Uk1SajFaa3d3NFVycnRUTTlGYlo1?=
 =?utf-8?B?bVhVdXdJdnRQSkJ0K2kxSEplWDBRQStLcFNHYjlNQkJWQlpFdWViU0VtYnhk?=
 =?utf-8?B?ekg1N09ISHlLMmRMUHFQQ29WZ3FaS1ZUNE5aSVVCWDdFYk1PM1dUUUNmZ1ho?=
 =?utf-8?B?K01vSnRNZ1BPbFFHOThONUNDTDhCd2d0dGRzek9iMDArRksyNEJkVnFQUGZ4?=
 =?utf-8?B?S1hiQkZxSlYvL2pSU2VWMmhUK2JKc09VVm9kZXZ0aDJTelZtdUxPQ0E4WktL?=
 =?utf-8?B?bmFvckM4Q2hpSzh6OWphd2NTdVFvRHI1aHJPVnZDTDM3QmxMbENock03QzYz?=
 =?utf-8?B?dWxOOVM3ZmI2NzRlbmdNVmFNamUxcmVIWndKTWhLeWY2ditLTHVYcGhneTlJ?=
 =?utf-8?B?VVMwMXhLQU1jZ25MUksxdlRNVk9LQzR0bmx4UnVublRTaDZJK0NGUmxOaGxW?=
 =?utf-8?B?bW0vZWJVRFE1aVVOV2ZwTGhxR2RVdnJ3Z0VheTdIRzdUcUJwZ2pTRUJlVXZ1?=
 =?utf-8?B?ajZBZkNSY0FyRGUvQVo2ekp1ME9KSTg2eUFCb0ZvWlM0YzluZ3NjUG5wZjhs?=
 =?utf-8?B?L2xDWEdpajh6YmFCWVoyWm9JNFZvL0Ftd0lZSDR4Vnd4Uk1JOGlpRVM3dmlv?=
 =?utf-8?B?M294ZzRzbU13Vk9ReGZVcUN5dkpLQnVuMFFsbU9HaklUbHRjZGd3WXJneVFG?=
 =?utf-8?B?dFU1L0V3VFN0OXNnZnJvSkcyU1ZoVFRPekNBcTBUS3ZIN21sWTV0cDJNSHg5?=
 =?utf-8?B?TUdqYUVxQjlWbGJzRTBxdURrZDY2Wkpwd0hyTFR4a2tFenZIQjRqOW05S0lL?=
 =?utf-8?B?d3JGaXdhMGVDRkxCMEFBUkZEbzJjb1JWQTRWdkJ0TXJaT3MxWGVlWU42bnNj?=
 =?utf-8?B?d0ZESGhwMU1QMW9JcEpXb2d3MEhDZTlrSFM0eFJqT3V5UTJMY0NVK3NrS1p6?=
 =?utf-8?B?c3VVSlFsdDZZamUzS1VFazNIYmptSUlaVmJDWmxOUEVESmVRc1BJRGhEbDc5?=
 =?utf-8?B?aWlWcS83dVhQUUx3RWZ1NjNkNVd2cHV4eGVGbWZsMU12SGlrd0MrcExIbk1m?=
 =?utf-8?B?TUxURU5KK0JhdWNEaTUvVGIvTWJBakVVOEwxSzBiZEx4SFRhUTJVaEwvVXBH?=
 =?utf-8?B?NmYvK2NWaE9YM2cyMDNJMUNtZERVeEhyVldGaDE5d1RTTlE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6375.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QnpRVWxEOG1zem5mUmg4c1RUaW9SMVBPMWxHMmhrWHdEVUNKakExREhlNVBH?=
 =?utf-8?B?U25mRDh6RyszY2Z3TmtxdEsyU21rUFgxUk4zZFdvNWdYTEJWT0ZWVXBaaWMr?=
 =?utf-8?B?djdUZWZqa2dQUkNMSytoMXphcDZPa0dYc1V5cGI0bW5Mcm50Y24zalBnaWxR?=
 =?utf-8?B?Sm8xalJTaGNPZGFDNFZmVnJwY3NwSlRadlkzcXF3dDJDRWtjT081T0J1Yi9x?=
 =?utf-8?B?c2RTSXk2a3gvT0JQOTBqaWN1bW84VitIWTVkYWNLSHpnMlp4bWhzSUFVS3dZ?=
 =?utf-8?B?TXBPWld5cS92VlpabHk3OE5PTWwrNEFNWmdWaG15R09Zd1BpWnF1bGx4QkN4?=
 =?utf-8?B?eElxUE5nVy9QM0NoWlZSUVNBTDJUbHdHeTA3aTJjWDJScmh4aVUyMGhRZXlS?=
 =?utf-8?B?dk9aV0JqRDZXQXhKaGQ0UHMzdytXUFNzNFJmRGttS1FzN1pHcHVxU2hITVJU?=
 =?utf-8?B?U3lZTnl1M3lLcEJ6aS9ld0xYR0JMTzl2bjFhZVo3Rk40YWtkcDBMZWFhaWwv?=
 =?utf-8?B?UUZBdmppbEs0VEZtT1lkWC9EOERHVHRZbnBhUXl6dEZYMFl5TWEyS0w0TDJj?=
 =?utf-8?B?M1BsWk15ZFd2WTRmWGxwaWtPUS9YZmtBNzI1OUJPNnNVOTRFcm55R0w3N3lp?=
 =?utf-8?B?SElIZTdPTytESWN2SGVUaUF0bW5MMHpmeENTYTN6MllFQXRTVXlucEZTeElT?=
 =?utf-8?B?RXJXc3U4c01iT2I4aXRJa2h0YkgzZGMwWDFQdklHSXAvVmIxdHNUVWZRN1RU?=
 =?utf-8?B?cGp1UUlxQS80REpyc1lBMFlTOEJEOG1wNFljU2gyNk1YUUJsZHJpbHRhQURE?=
 =?utf-8?B?YzVIRFhzQ1YweUczaEpoZk9CandXUUFJZG1TMkw4ZDgxb1Q4bFRtdGlOTU1r?=
 =?utf-8?B?d2QyeEh3Wkpqa1dUdGVlbm5YWWZub1IycUdMUmsrNCs2b0NlbnA4N2h2RFZz?=
 =?utf-8?B?aVcyNXFrUFFEdW1YaGtSQWFUeERqWTd0SmZuUW4xZ3gyR1M3cGw5dHZQcmtI?=
 =?utf-8?B?ZlNIYnkrTzBRUVc1enlTdS94WFowVVQrNG83ZDNmcHFMMkxQNjAraGN5WmNv?=
 =?utf-8?B?QkhTT3NuaU5ZaWc5dkRFV3ZZUVJiNFRyL0FJbFY5bjhEVVpyZll3aFlzYkRC?=
 =?utf-8?B?Tzc0aGFuUmJMejFQMnN2cmE0TzkxSVkvZ0pXNlpRQldQSDFXNXoxMm9ZeW5O?=
 =?utf-8?B?dURBS0RwRkJvRmcvN2Y2bFhjWmk4VkZPMUc4MUNFMmNtM09oNUp4ZmZuZ1FO?=
 =?utf-8?B?SXJnM0g4UUQ4WXRHMEwvalRnMFJMNzdXUkg4RzRtbUtWVUJsKzVPMlNRd0J0?=
 =?utf-8?B?UFdsTzFGNE5KY0NDcDdjWDZ3WFhvbVFpTkNHcWRTalF2azUxVkoxbFZGWGFj?=
 =?utf-8?B?cUQ4Rk1NY2RLMUFselNUcDM2M21jRVBwM1R1YmQzL2xoQTRJU3FYYTNwK3ZD?=
 =?utf-8?B?V2xKcXZ3Zkdvd3BpL1FTL0FnNmVZQ0RFbW5ZV1Yrci9YYWYyMmorWGh1di9E?=
 =?utf-8?B?Mm1ydzJXNUNwMDVIT1ZtY1FoU2xMWmNIUm02TGJOMXNQRzNlYit0eEJhWFJt?=
 =?utf-8?B?SnpHOUhDNGVPclc4N2pwZ2dYaUV0bDFUNzJtWmY1S0k1Zmg2VFcyN25sd1Ix?=
 =?utf-8?B?cENZNHBoNVQyVWQ5cmdtc2s3QVZxRTFJWnlOYytJQSt2cXkyN2hTWGUxdEU5?=
 =?utf-8?B?ZmltL3lLaTQyYnpRNFFQZG00WDR1a3MwNUVsVTFNRGhVdDJOMWhIZGc1cmts?=
 =?utf-8?B?SmR2NStScWUzNG81a3JZbEx6RGhrUllDN082aWRsNlFubjNEeklON1hpak1K?=
 =?utf-8?B?MzBobGcrK2ZFRE9wamlXNW4rOUVrWWJEeUVjamZlbHl6VDdDWFgxVjV6RFNJ?=
 =?utf-8?B?NWNLd1RERXBtUFdjdHkxVkRyVzlaWnp3NTdoYkRJeHh4RG15aFBEWXhHZ0E2?=
 =?utf-8?B?cUNPczdxOXpYazg0WUdxVmY2SjRERFlMV3Y5bzR6ZWNqZmJCWGg0T2Q5OE1J?=
 =?utf-8?B?UElRWEsySnd4ZWg3NU5OWXBiVkU3WlZaMk5VRGxxSlRQMGpGZ0hUcmpRNENz?=
 =?utf-8?B?b2Nyb2RiVm1MSlJtRkR6VjVua2ljRDBDMjhIcFY1cHF4a08wMHJneFJkejRH?=
 =?utf-8?B?dFJYN0NSS2xGTVVTQUJadzJSUERMRnI5UE4yc2ZOS2x3aEYzRHdodUpOL3Ft?=
 =?utf-8?B?NWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fa57141-0c1b-4b5f-2935-08dd78d83ea9
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 09:07:11.8335
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ar5pyqhBxWkqDZcFvGdxo9P2YN8qS5DzmmbWhvbbVd+vyDE2FKlkyOzZ51vGt3/92c3XmfY2RqVHGD/C9I8O9I7QODCO+RCbV/PmHYq4YgQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4806
X-OriginatorOrg: intel.com

On 2025-04-11 4:04 AM, Kuninori Morimoto wrote:
> 
> Hi Cezary, again
> 
>>> I'd rather focus on 'struct snd_soc_dapm_context' exclusively. A valid
>>> pointer to this type is required for many functions found in
>>> include/sound/ yet the struct is more of framework-internal entity.
>>> Strict separation between dapm-context "for the framework" from
>>> dapm-context "for the user" would grant better readability benefits.
> 
> I have checked each drivers which is using struct snd_soc_dapm_context.
> It seems not only framework but many user drivers need to use/access to it.
> 
> So separation seems impossible, and dropping wrapper is maybe not good idea.
> But I can understand that it will be very longer code :)
> 
> 	x = dapm->component;
> 	x = snd_soc_dapm_to_component(dapm);
> 
> For me personally, wrapper function/macro is not so bad idea.
> It is much safer to use function/macro rather than touching them directly.
> 
> Anyway, I will try to keep current patch-set style.
> But any comment is very welcome.
> Thank you for your help !!


I see two replies, hope it's fine if I just reply to this one. I love 
the enthusiasm though :D

What I meant is that even the name of the type - 'dapm_context' - speaks 
of framework-internal stuff. The fields that define that struct also are 
not for the users (drivers) really. Perhaps there is a way to get rid of 
the dapm_context pointer entirely in the argument lists of public 
functions found in include/sound/. The pointer could be obtained e.g.: 
via container_of() by the framework's internal handler when needed.

Otherwise, I do not see real benefit of using 'x = 
snd_soc_dapm_to_component()' over 'x = dapm->component'. In my opinion 
there's no need to provide wrapper for every field we have. No hard 
blocks though.


Kind regards,
Czarek
