Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4235318EFDE
	for <linux-sound@vger.kernel.org>; Wed, 29 Jan 2025 09:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738143541; cv=fail; b=RbthBeP9WZYgW1W2/H5eyrkBauBIWbP05wRVf49EEQJBnslxYU5CUWN8NUMqxRQeIFnJhRoJ+UNU/Kmtyplh1ZhguAo6qXaxp7zUZZ5DlJ+poHUh6TX3pXs6TY9L/l1ayx/Sev+AI+4KFkU8AdGVhH4Y6qcRCvbANcPYUKod+eA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738143541; c=relaxed/simple;
	bh=Uqu6PwAyKY12FO2zVCoLvdetyrp32t9hphHJMeyDBWA=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=EoLONvdwnKczwCtffW8t6RqngNGSYKXpGne104RG9sHbmT1pYehO+cPejRMbRQa3WHCdUgX2p481k3DPxyjJCymy24qEVPRpwBEM7Zuanp+6TWtl8mTtSmQpnMWEUftafXR0V7PwPHqcqtAvv5IfglUfhghUyfLwvFn/LFethg8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GS8JlPMA; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GS8JlPMA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738143539; x=1769679539;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Uqu6PwAyKY12FO2zVCoLvdetyrp32t9hphHJMeyDBWA=;
  b=GS8JlPMAglVgI0fIgNjYx4icb9sMI646nA2MTwfv3Ili1JpoxghaO1OB
   y2fwlCjwnQjeicgn/7rck91Ig81cwm1gyZ+QYndy04fwuBScYK6ud365b
   fBx/Ie1JukKZSQ1r2g4AAunDnVnYzN/zcq2HdV+oWuPbAOdXmRpY0PyDx
   xOD29NVYShcML9CfQsokEBA+N+3MhOqMGkUqmHYkG4qinKGw4GAWKDtqW
   O3b1el9+VsNoc7CiJINvl8KSQCkllDKMZwbvrVlNKiTLbWoo1kTr0acZW
   RDG3WfHU4ikQxepWCvF/0UCWLueMQ5GwbXQBokzuevZtbbl/MDodK+cic
   A==;
X-CSE-ConnectionGUID: BKwVTHMiSpCRJgHiEjLYoQ==
X-CSE-MsgGUID: yBx0yfIFRjOqMv5vK8DT6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="64009087"
X-IronPort-AV: E=Sophos;i="6.13,243,1732608000"; 
   d="scan'208";a="64009087"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2025 01:25:57 -0800
X-CSE-ConnectionGUID: dbUZsMX0Q6W3D4bgSBlrtw==
X-CSE-MsgGUID: OmEFYv1NRXu8YhIyKPh9Bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,243,1732608000"; 
   d="scan'208";a="109516041"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 29 Jan 2025 01:25:56 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 29 Jan 2025 01:25:56 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 29 Jan 2025 01:25:56 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 29 Jan 2025 01:25:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xYGYaA+ODCFi4SvDrfo5OYIw5qc1RaMsrCpI5/pTTjfn4ss3ZZEvG5s2t2ktczgYlQ2/zymhVNAa/ow9FeXK4i6BgG/6z9Egnvt1ODpbSt75XsMpM6854GJ1L7Pk8MlqRkBTapWgr8CvoWN8i0m9flyoaEHVEQj96757PuDhka9eKF5GnObCZlDzQFPXJ+ODGxUU53feQOhwz2BOINpQSB1p7fjs/3gC8HYKFeyuHETbgu16aUxTNb+8y7gVN9sw+Mzldoqn98wIRq2BsuMNdDJe582fQT08/KehS585Y5EZ8GRpxpvwtaDCvqvFaR6YH4RbhdAGsSqVmSPFaOheXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rMuIA2jKZk9txp76uKEITiLKks0xER2oljZyBuVmE5w=;
 b=YLwhjJ2HqKl/Y/W5pnrk+68U8ZkkqBL0Ut9m6vd9BqSXamTzxioJe56LAJPHiCdtOjousC1WShr1fWqNjyTYYQ9wi09MER5RSz1028YQT8AwRe7IHI9KnnixRAqAz1/genKcJgmgtLEibztCsnIFItMKwAwvJxyWRjpPVr791tmOHMV/GXyfVlikqSUpRZSfy/gg2E/RkHc6nCk4j4CWTn5lppdpJxwZ/ptQR4KFknisYloELmX/DQGzb7rfQXgV6veLkdiMtrqrZ2h1DBke7uBcLeynjlaNlHrmdiWdFGqW8+aW6NMsLXm8dk/aUQdLxYsH8Z94M2r4kiNrTwaMHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 SA1PR11MB7040.namprd11.prod.outlook.com (2603:10b6:806:2b7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.17; Wed, 29 Jan
 2025 09:25:54 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cd01:59f6:b0f8:c832]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cd01:59f6:b0f8:c832%5]) with mapi id 15.20.8398.014; Wed, 29 Jan 2025
 09:25:54 +0000
Message-ID: <811c03ef-03a2-44a3-969b-5a2d55f2f876@intel.com>
Date: Wed, 29 Jan 2025 10:25:50 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: core: Change device numbering
To: Jaroslav Kysela <perex@perex.cz>, =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
	<amadeuszx.slawinski@linux.intel.com>, Takashi Iwai <tiwai@suse.com>, "Mark
 Brown" <broonie@kernel.org>
CC: <linux-sound@vger.kernel.org>
References: <20250127144445.2739017-1-amadeuszx.slawinski@linux.intel.com>
 <f8f2b8f9-527e-486d-ae83-34abd13ef968@linux.intel.com>
 <6fcbc9d3-93d4-4485-9f9f-5bef61476ef3@perex.cz>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <6fcbc9d3-93d4-4485-9f9f-5bef61476ef3@perex.cz>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0015.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::20) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|SA1PR11MB7040:EE_
X-MS-Office365-Filtering-Correlation-Id: a0a22655-f91a-494d-5489-08dd4046edf7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bHdKTTZRK083NFNaVlBhV0ZZdjRIODBxMUhoYlppdGw4enE0Kzh6N0pycENT?=
 =?utf-8?B?aC96Nk94TTJZVGdzRGlDRGwvNnN4S2ZrSTBqanVlYVNJUysyQ212Y2FOK2ZR?=
 =?utf-8?B?Z1QyOTZNYnF2RG9jYnkrN2Raay8zZTM1WG5iRWx5QWFRL3VSOVp2WlQvRXhT?=
 =?utf-8?B?a2doZnNYa0JRMnNyeVYrRXNRczdDalFhbUdhZEhuTmdTT1BRSzZCZGxzb3Iv?=
 =?utf-8?B?Si9FcDBsMEh5eVQxY0hsQXE5V2dIUUpGNGNFMG9EU2NOdUtGcmdvdzQrdElG?=
 =?utf-8?B?QTZmUEJaaFR1WG1qRGx4TlZEaURzaHFrVXBpbTM1Q1BEcFc4TWt1Qm5QSDZ2?=
 =?utf-8?B?RVFXSU53dXpoS1JkMlRvcTBVSDdqSFJqeCt4dlFGT01GbC8vUVhjZStIaVQ0?=
 =?utf-8?B?akJna29TaEhTT3hQQkxzMFdsa0lNdTMxSWkvcUp2QXhiNVl0eGEzWFRBUTBO?=
 =?utf-8?B?aUczVTQ1UDU4T1ArV0ExMzdsRGRaZzNDR2Nwdmg5S0k1a1RCSENkN2NDNXdM?=
 =?utf-8?B?YXZYQ2w4YVFmc1AwbExTMCtYU3dqRldDbFppVlNPalVxUThGYXN3RTF1elhh?=
 =?utf-8?B?MkI4YTdHQVBlSWN1b1JvRjFNTkxPVmQzLzRqTktwNkJFbFhkWS82RkZma0g3?=
 =?utf-8?B?djd0T1UrVTZhVmlNVnpWMHVDT1FiUTdsOVltbVJ2RUROTnNycnpFQnp3MWI4?=
 =?utf-8?B?Wk9lYVlXL2xRLzVaa1lha0xPb1EyeDZUblN1SEVwYkVldll2WEgxOFphZlB4?=
 =?utf-8?B?QkhKS2I5T3kvcmU3SVE0NFpDT1pjUG9lWWNneEtaa1oyUzNsUmFqQWlMRTJR?=
 =?utf-8?B?Q0wrM0ZtWXBpK3dEMzVqK3dZdWtMd2xMZ0VwZlM5R3M1YmRXdkVYY3dzQnMy?=
 =?utf-8?B?SVFuZUVKMGg4ZVVKb3JtSzFUWDJVTUJZTVQ5c041MkxDN3h5UWp2ZnZaVXM1?=
 =?utf-8?B?K0VYWEN0TVluc1BRWVlNYXhIT09vTXZPcnBnemZzWWx3UktWL0dzTkorY09S?=
 =?utf-8?B?TzY4c2hlcFdIV3l2YmRiOUlQYWZGSlFVUHRlb21UN0tZLzhQc3REaFZiR2E5?=
 =?utf-8?B?WkM4a1hybDMvZjh2K2wzWjloVG5NdkZxR2hlQ0xOM3Z6dFc5bllFb043bDdN?=
 =?utf-8?B?WUJxV25SZHhWakx5dXlZYUt0aWZWaEplWDhMUHVYVTZqR2paMkd1MHFQTGxt?=
 =?utf-8?B?ZVZ3VzR4c1VJS21qMVF5N3N6cEZsWHhZUnBTcUp5ZlR6MWVrc0svYXRFcVRU?=
 =?utf-8?B?V2paUnMyREM4cjN6QmtUNGh2dzQwOUoya2tQay9rY3NqUlpLT09RRDhjVG9T?=
 =?utf-8?B?VTZZVnhBeGQrdSsxNTVydHh6YWZ0RGJLRzRHUXNXWEJJOGRSQi9pM2RNdGp2?=
 =?utf-8?B?ZjRPMXNqM1ZCcmtKNmhYSDk0UEhUcGVoYkIvVHovN1M4L2RQOGF5NFk3WW9K?=
 =?utf-8?B?cVZ2RHc4Mi8xaHppS200VmVUZDBrZFdlUzF2VEIzeUxsWlp0akIvOGJiSEMw?=
 =?utf-8?B?MDVOVW4rcFk1KzdKc2ltdmswNVZ4dnNrWDl6dVNnTVhhd1g4MTJOT0srYVE4?=
 =?utf-8?B?RTd4RXFHbmpWL1p4THdPWjltVkMwa3NmZVhoNXAvcWcwYkdURERlcVFRQUlP?=
 =?utf-8?B?Yk5NRXJMMVRSN1p0SjFuSUd6Z29CcDBaY2hlbkg4cS81SzhQdnMvQUVVcTVU?=
 =?utf-8?B?dkxqcXdMMTRRNU9HeXBHVW1McU5iRldUeCtZRXlXNUsxNy9SV1ZKNklnRUlm?=
 =?utf-8?B?clRheGFqZUt3L3duM2owMlpOSm9IOURmemJYc1NMc21UYzNtM3VaS0pYWmFM?=
 =?utf-8?B?Z3NjOFB4RnhEMGZ6c3hpNFRCb3Z6MU8xWkpMT2wyODRkd2RSajE4TEpjWnZB?=
 =?utf-8?Q?NvMpD8kmkFtbu?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6375.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a2VSQnlIdjNhSjhxV0RhcmdMTllEUGNSS2U5YVZnVGxWMUVKNmMwZmxHZFFJ?=
 =?utf-8?B?dkJ1Z1VhQVB0V3pZK1RtSEx6Tjg2NjQweHRUUkY1amREajVJN2tzaC9wZkNq?=
 =?utf-8?B?VHVRN3hjdWpla3ZVYmk1bHUwMjdJUlJHK1NXL2tQV2R0MHRNdzBDZzBtclRh?=
 =?utf-8?B?VzRVc3pHV0wwTUQxMGFSWG94b2xwSGJPZ3hXVEJKSUVHb2pteFNkazZ1Q1BV?=
 =?utf-8?B?ZmdmNzM3TWIvV29YeXRremgzejZhWUorb0Z5eTJodElQUUpRRndadm83blZC?=
 =?utf-8?B?dXMzVk1pU3FyY2RBQ2VZbEpvQkZLdVp0MEVnby90ZnlBWTN6SjhTQnVXSGQx?=
 =?utf-8?B?em4wdUFPaDQ2MlZOOWhtTlV3M1ljby84aFZDajZEK0lNckdYa25UQXY1alB4?=
 =?utf-8?B?MkZRYmdQT0hzODFDbnZCK1lUWjV3UTRpdnJYQ2V6Mk92MTIzc2lSMWhQRHlE?=
 =?utf-8?B?aUxuZUw2bTg0MS95RjVuakJndEV2czBnQXpUZjY3WnkxYXZsbDBaTnJOdjRD?=
 =?utf-8?B?ZmczczlsMDZjY0NlZXFFTm5YNVl5TGdrTFhyQWxXU3JEYmYwWkRqcG1MZzZE?=
 =?utf-8?B?dmtWZFJXZFlvWitKM3daSDVtQ3FBNHB6dTI3MXo5ZkQxMk5aZjdWZ1Fja28x?=
 =?utf-8?B?TnU4SDFBTGVSZWhXdlJaMGcyQ2RWMTdxbXhJR0M0NnU3aHFPbGovRGFlYjRW?=
 =?utf-8?B?V24wRFJuT1NrSHhmZzltanZyMURBNXJ4YjFtTG9Eay9ETFFCcWtYVCtnbkFP?=
 =?utf-8?B?L281QTZPN09tczlMUWZmSjhQRThGeVpaR3QvbGh0S2hvMEt1SjdONnovVUZF?=
 =?utf-8?B?K1lqT2dCcDNCVDdHTnFOWU1EVExyejNzaXVYdWVJaHQ3c0tQTXM4WW1TKzJP?=
 =?utf-8?B?Y1JYbWJWOWZJSnB2UkFML0RpVzAzaEU1bmV1dU1rZUp6SEpRdkNlblBha0hp?=
 =?utf-8?B?eFBYSDRad3JWQVB5OFJNRXJMYnhCcnNkZzMvQlFTSGF4UC9tRjdtNjhueDAr?=
 =?utf-8?B?dXJ6eXNoNnQ5NlVZYm4wNmdLRTI2R0JUdUQzKytDSkdiVVpOUG5pWnA5ODdW?=
 =?utf-8?B?amQ1SUVmbXBJcGZYUTN0OTNXWXl0LzR0NHd5R2cwUTZSeXVTWTFPMUs5WGJs?=
 =?utf-8?B?YXZDaVJOcWdMRXlQSXU2Y3l1VnowTEx2eFR0ZUR3dTVWQ2dibHNNOWRTOWx2?=
 =?utf-8?B?RmRrSllEWlpmMnN3WnZOTjBZWWV1cmZkTGFWcXRpRXJkNkhPSHN2ZVkzRUtJ?=
 =?utf-8?B?KzVFU3dFTkxkckgxTVo4eTQ5aUdvR2UzcXpkbmd0NHVuNWZoaGR6NzR2Ly9M?=
 =?utf-8?B?a2l4WERpc1FTT1VlNlp3UVhVUFB1c1ZWd3RZaGs5SCtFdE4vOVF6QWxNeFVw?=
 =?utf-8?B?NWhiaUVXSGt0VTN2UGhOMW51WUNHNnM2WVNoZ2pZd3YrbDJHWXZyeENTclpU?=
 =?utf-8?B?cUx2WGpCUXpabzBGbnNBRGo2bWlRY00zVnBIbWlTbDBYazliOHZIeFR3a012?=
 =?utf-8?B?VUpiZjVORk0yenNOMWNKSVZua2tLRlY2S1pwMGw5YjM0Q2NkRkRObnUzNVd4?=
 =?utf-8?B?N3hPaC93UGtiSTBkU3dNcVcvakVkRHRlSEEzaVAxZDJoRW5iWE14N1BFYllL?=
 =?utf-8?B?K2dYdjNwVm5VeWN2blZjOEE2K1RuSldIUFN3VDZtWkN4bHpKZEszdmpibmpO?=
 =?utf-8?B?NnhUVXBIM1grWklDcWdVT3lrM1NIa0x5a3ZFbGdTYk1adWZGT1BjSTl1cUVt?=
 =?utf-8?B?SW1Ma3VHczdhc2grSGtQUWg5dllxOEZaeTRSa05Ra21LeHVJZWN1YWpMZEha?=
 =?utf-8?B?cnZ3T0xKM1VBVElaY1JrWjRFOGo2dzRPY0xyTk41VlZPYlBxNTJuLzhDYkNa?=
 =?utf-8?B?U29taFNlelVWZnd6SEZhdWRpeGwwZmhNUFVjU0N6SHNJQjJKNE5JVUVycTRU?=
 =?utf-8?B?UEhGOHgwOTZncFVmZEJmK3g2S0VyakJ5bTFLbFo0Q25xbFcxZTNKVm5OSjZa?=
 =?utf-8?B?WVpBUGlZMUh2bS9NeEtQQU9UWWgySE9Ec0h1Smc0bTVkanRpd1VwdUlFT2FL?=
 =?utf-8?B?d0YyaEc5OFZIZXBxSUU3SU1paWVyVGlWYkZXRDV1Zy9CbkhCL29EZ0o5V2NX?=
 =?utf-8?B?MWg2eGVxOVVzU2FKWjRySncxMWdTb0w1Z2x6WUljUzlzdVhyMTlzb3JsUzhy?=
 =?utf-8?B?UXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a0a22655-f91a-494d-5489-08dd4046edf7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2025 09:25:54.1772
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z5J9xk2XIFTsqU8wPxJRWf5PMRp1182fnMT8Gh2Db1ILRxNPqzX/oNh2XsKzdYKJUtKcq0UOFkgsRp/8JyOYFn53IRDJ+WbSNDWHl3/upGc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7040
X-OriginatorOrg: intel.com

On 2025-01-27 3:54 PM, Jaroslav Kysela wrote:
> On 27. 01. 25 15:45, Amadeusz Sławiński wrote:
>> On 1/27/2025 3:44 PM, Amadeusz Sławiński wrote:
>>> Currently ASoC cards when enumerating create CPUs rtds first and CODECs
>>> rtds second. This causes device number on cards to not start from 0, but
>>> from number of present CPUs. During that it does count number of rtds
>>> and uses it as device number visible in userspace.
>>>
>>> This patch changes device visible to userspace, when listing cards:
>>>
>>> Before:
>>> card 0: hdaudioB0D0 [hdaudioB0D0], device 1: HDAudio Analog (*) []
>>> card 1: hdaudioB0D2 [hdaudioB0D2], device 1: HDMI1 (*) []
>>> card 1: hdaudioB0D2 [hdaudioB0D2], device 2: HDMI2 (*) []
>>> card 1: hdaudioB0D2 [hdaudioB0D2], device 3: HDMI3 (*) []
>>>
>>> After:
>>> card 0: hdaudioB0D0 [hdaudioB0D0], device 0: HDAudio Analog (*) []
>>> card 1: hdaudioB0D2 [hdaudioB0D2], device 0: HDMI1 (*) []
>>> card 1: hdaudioB0D2 [hdaudioB0D2], device 1: HDMI2 (*) []
>>> card 1: hdaudioB0D2 [hdaudioB0D2], device 2: HDMI3 (*) []
>>>
>>> It is done by skipping back end devices and only counting front end
>>> ones.
>>>
>>> Now there are few concerns I have:
>>> - while rtd->id is not used much, few drivers seem to be using it as
>>>     index into a table, above may break this use (although
>>>     "include/sound/simple_card_utils.h: * the ID stored in rtd->id 
>>> may not be a valid array index."
>>>     suggests that maybe it is a bad idea anyway, but I'm not sure how
>>>     generic that comment is)
>>> - this will break user scripts, with hardcoded device IDs
>>> - this will also break some UCMs with hardcoded IDs
>>>
>>> Now my main question is, if such patch would even be considered?
>>> Perhaps device IDs are not considered as "stable" interface and can be
>>> changed and my above worries are unnecessary.
>>>
>>> Patch is a result of discussion from:
>>> https://github.com/alsa-project/alsa-ucm-conf/pull/499
>>> and as such I may consider others ways of fixing the problem.
>>
>> And it should've been RFC in topic... :( Sorry about that.
> 
> Looking to UCM configs, most of ASoC cards have PCM devices starting 
> from zero. So this id is not used for all ASoC cards.

Most of the ASoC does not utilize topology and there is no strict 
guideline: initialize FE first, BE last. What Amadeusz proposes is to 
skip BEs when counting the 'devices' for the userspace as these are not 
touchable by them anyway. I believe this is a good direction and does 
not limit one's action when playing with the ASoC-topology feature.

> Also, a bit off-topic, but the driver name (hdaudioB?D?) for this 
> particular driver should be corrected, too. It should be like 'hda-avs- 
> dsp' or so. If I am not wrong, the SST driver name was 'hda-dsp'.

We had a discussion or two within the team and yes, we do agree that a 
more user-friendly pattern should be provided. Currently card names are 
mostly based on machine board device (platform_device) name. There is no 
strong technical argument for that - the development was/is simply 
focused on bringing new functionality and we did not prioritize the card 
naming.

The task touches all interfaces though, not just HDA. We would like to 
streamline or fix the naming for all the interfaces. This time we will 
specifically request a review for that : )


Kind regards,
Czarek
