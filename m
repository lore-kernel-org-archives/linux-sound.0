Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00779292B4B
	for <linux-sound@vger.kernel.org>; Tue, 24 Feb 2026 15:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771947380; cv=fail; b=PPfPXYQo/wLJUNndQRFxe9QFUAJkIqkQf2zXrjH1bsUcwsrhoWINMTk+7/z2E+r1/epwYs1V24AicWw9em/QGQiWbnsj4Krq4waDNMrR5QolihAMdbJVINR2juvmjhdzwcxVTPmccRsm27FEaDwPy+SO+P7+h6fPyKj2XMOgppM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771947380; c=relaxed/simple;
	bh=S5bamzlR+FJnL591VAZGOl0St38uhaKUQUoD5DOi7EA=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Iey89HG2FGzrZrRsbewyQ5OLGX29S3DdEZ2ycKSAHgWHiuNvjvB6Ht1CDhgiSLeO6rVH1KvBHU2fX2cjB35K9VUO0z6tZ0jMEnxlmtS4gSdSsnOWgsICsgetRxI0XZSfL7rnslBtWa6lFIttIjs+TfUTzOeuCFqPEnd+WJrhhn8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aM1s0mQi; arc=fail smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aM1s0mQi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771947379; x=1803483379;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=S5bamzlR+FJnL591VAZGOl0St38uhaKUQUoD5DOi7EA=;
  b=aM1s0mQiTn0wNDuxgdxTm0VB8+bLcYoz7oC3GIpewdcrSufjm0/HkDBb
   gUxb5iWZXR4MfSnj2WKNoQwjlMYOT9StcH3TKzHvI0F/oNgsWKcfdo4Cs
   HLKTDqGztpY2RlXVgEPV9tmRkhY7Rg1PDQIBa6rDGXKDysWSD+Kmuhp7c
   +l4MteFvcrRNvgexbS4jho9j/UdI6Lhi6e7hjtfO1Yiqmx1EFm4QClj3D
   Lstay6KR1J4esAGu3DE58NgHef1i58pO1+clIO5XvdDyW8qTWRAWfN8M/
   CHpJc7dp3Itw77Ki51/WBxgEYFjBrH6KtRshjtAP/ulJEturAbGnJD2M0
   w==;
X-CSE-ConnectionGUID: bvsVMZWhTIqJXFXRKeVwEA==
X-CSE-MsgGUID: 9On+pBcGTqCAxykSV4EbcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="72841216"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; 
   d="scan'208";a="72841216"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 07:36:19 -0800
X-CSE-ConnectionGUID: G/85emo0TnmX7oSSy8BTdA==
X-CSE-MsgGUID: +nCdbya1Q+6XS74ZnrNHNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; 
   d="scan'208";a="220051114"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 07:36:18 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 24 Feb 2026 07:36:18 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 24 Feb 2026 07:36:18 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.4) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 24 Feb 2026 07:36:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AqZL3OGScC8ofsNdZJ9MpEPcEipA8nPeSVX/crzd/YFLFGYDyw30QYFbqvtPAlFLaGxTpaUWXb9pPkk0TiIiE3NtxsXeccCZKg4VInkXtEuLyUMAOsS3clPIkn1P1ikRsjwTO1UQf74jCNy5V5CE4AojZqy9EVv6Bn4SMTvvKDVR9aK4t/Osca73JmSKHYeE6mD8gzcEVcsiZjuX5j0Yb6RjlaKP1Yx8eGCrunAyFgSnYxs49eLtPM4pIQ17RIseebxpr47trPhJedB/rwmqqQJvyXaRbyLo1Bnn60E366Ll+M5nHIX12ax+P5xMElnIwrzVGvY9J/pfaeuLMxkvFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F4PimZNjzobId9yAd3Qx72PC2o3tGt0nopNlgqCE5Gs=;
 b=EbpKdgjS69drv8MBRNaXFswIfBDkcZlFKEKwTrNXH2e7jCc5Delaxy0oKsuEfteflNf5+WZexuL1sulv4gA8vunxBTD3/zjuj1AwQqHf1Agz1tCs4+tNCqWA64Pg+DLYptGK7soWF73nBX1MA3/yKbFggaLzReJvSYAzmh0z9+j2Xnw7+k0Xs5ts7XwS2iXZk7wfKSlDgwbhp0wwlHqs+uqIH056QAE2OR0f+FAcD6ZScEnmolnIsGBQRVWm5mHGrjz6WI7q9/VF9ogxWlU88wT5W927XYYycGB+s7kxEPOlte+81J/6lyZb8Q7yH1v0pKnylFEEzOeeb7bRiqJ38Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8283.namprd11.prod.outlook.com (2603:10b6:806:26c::16)
 by PH7PR11MB8122.namprd11.prod.outlook.com (2603:10b6:510:235::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 15:36:15 +0000
Received: from SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::d18f:6b38:584a:214]) by SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::d18f:6b38:584a:214%4]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 15:36:14 +0000
Message-ID: <f52654e3-c116-4690-8e1f-de01207d9d51@intel.com>
Date: Tue, 24 Feb 2026 16:36:07 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] ALSA: control: Verify put() result when in debug mode
To: Jaroslav Kysela <perex@perex.cz>, <tiwai@suse.com>
CC: <broonie@kernel.org>, <amade@asmblr.net>,
	<kuninori.morimoto.gx@renesas.com>, <linux-sound@vger.kernel.org>
References: <20260223144937.524019-1-cezary.rojewski@intel.com>
 <4f8a3505-8c6a-46bd-ad03-0ceeab4f89b5@perex.cz>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <4f8a3505-8c6a-46bd-ad03-0ceeab4f89b5@perex.cz>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR0102CA0073.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:15::14) To SN7PR11MB8283.namprd11.prod.outlook.com
 (2603:10b6:806:26c::16)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8283:EE_|PH7PR11MB8122:EE_
X-MS-Office365-Filtering-Correlation-Id: 506062c8-5713-4d8c-d9a4-08de73ba7130
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c3pKS3c2NWNySUxBNkFKZkl1TW8zZ0Irb3h6aTQ3TXdJM2t4UUNzc0llbjJK?=
 =?utf-8?B?YzQydlFNVkIrUTlkYjBQWXIwNUxnUzMyQ04rOE1laXh4MXB3a3o5OFZTenFE?=
 =?utf-8?B?WXFmQy9zVDI2dGRNNFhuNTJZeEVyYTBTSjRTVzdFdUhQdUxRRzljTUFFQmsr?=
 =?utf-8?B?OWkzVE02bVRxTEhYN3BZZVNybjlsc2JXaTI4TmpzZVA1NTdxS1U4TE41MkE2?=
 =?utf-8?B?RS9sT0Z5K1pkMFl4cXJMMURZUmtia2JyRVo1OUc3VCt1Q0hkZmZGQ2RyWW1t?=
 =?utf-8?B?S3B3V2dlMFlMSlhsVS91VmRCcm5rN1RxRnNqVnRYRDUxTlFyT0ZpVktjWDFN?=
 =?utf-8?B?ZTc0S0tRQk1aNHlkYndCMFMvL0F0RzhJRmFMaG5XYVozR053Y0NVNmhERUl5?=
 =?utf-8?B?ZmhkckNSVE84anlXRDFlVWRxQzhJdTl3Q0hjcUFIcG11dzhrZmE4V0xDSDRM?=
 =?utf-8?B?MWdERE5UMG9IQmlQQUtYYUdmU3l6bUFvQnNoZE82RXVnV3lReENZT0ZCSFV0?=
 =?utf-8?B?ZEljYTdENEM4bGF6N1oraDZHV2dOZFJFbEV6S0luRmtFaE1lODljTUtwcXdY?=
 =?utf-8?B?b2tlaDdhQ2VSYWMrYTZzQ05aVUZ6QStYYjZ1VTdaTU83ajc4aVFIQ0hQbGwy?=
 =?utf-8?B?akFRcDRyeWpQRVhPckwzTVlud3lDNEY3Nm1CamJOY1d3Y1RMSGlWc3E3Znhy?=
 =?utf-8?B?QkRlbnN0b0tGZGEyVm9QTldhWkc2RURYU2x4b0FZd21uVHRoUWpFL0pUb2Ux?=
 =?utf-8?B?cVNOeC8wMm1UNmRVcVZxcG04ZkNwcFBsSUFFbnJIaU9KbHJKeTg5SmRBdlVq?=
 =?utf-8?B?emJwdEE4R1grRm85Y2xaSytXcEs5RFBUVzFOQ1phUFo1R1VOS2EwcU0vTGtH?=
 =?utf-8?B?SXQyZE11MTFJTTcvOFBvemRFV2VaaVFnQkM4VnlVL0x6NkdqT2pUS00yZ1lo?=
 =?utf-8?B?cXNQenZ6RDYzb29CNzY4R1VCdDM0NFFSaXZMbmdsbEUxaVM4S3czN3N5Q0p3?=
 =?utf-8?B?ZEIzNGROelRVRGVFL05Ka21RVTVScUQwM0FXVFU2S0JET3BWWXNma1FTTWNs?=
 =?utf-8?B?ZzV6L2xRdGxzNWFIZVZxZVo0Q01JYkw1NWxkQW1LWGJFMGlyaUNuNnNVU0Fs?=
 =?utf-8?B?OTNhZ0ppbTJnMzhkN01DdzhNeTdnaitxblFkV044TEpiQWZUVUxURzV5dDRn?=
 =?utf-8?B?RThWNHNTSFI3em9Cd0o0NVVXTlZoNlNZT3BTbzNXMkNQT0wrWHorcWxWa3A2?=
 =?utf-8?B?TXA2WVpjaWdIL3ErUHVpSGtPUHJ2KzJHWVoyYndKekJWbFpURDgyYnQ3WGpZ?=
 =?utf-8?B?bG93T1p6YTNySEF5WlB1aGVQaWhDNmVBeExQMFhGNG4ra3lLRjN1Y3d4RXdE?=
 =?utf-8?B?R0NRZytGZ2VIdmx0VnVHVzljL0hKVFcrMnRuVHpkYjN2Ym1JaXVreVdpZkFG?=
 =?utf-8?B?K3ZDYzBTWGdycURKNkJpblBuZnkzYXB2T3lJVHAyaHNYanZydHU4eWtuV2Ja?=
 =?utf-8?B?dzd6MUdhUUlSRXhKQWdwNmk2WWE0V1E3Y0J1TTAyVlQwbFNQN3hlZCs3VzRW?=
 =?utf-8?B?MUhBdXhrTU5MYndrTkprVCs4VVpwUlUyRkd2Z1BhY1RGamZISTVXaEJBNUU0?=
 =?utf-8?B?ZjZtS096eDE0bHdpNTNWc3NxMk5tTWN1aEdlUk01eDIyVk9OdEdNWStqb2lF?=
 =?utf-8?B?WFQ5RVJiSkg3K28rK040VWVma0cxR3ZJNWdlYXJBdU5yMlBZK1lTeU9qODFY?=
 =?utf-8?B?YVdYZllQRDQ0UzQ5bFVKcEpyUEYrRXlQMDE4azE1U2h2dHhVL1FEckNXamtq?=
 =?utf-8?B?ZUJHa29GUzJLN3REd0ZIU1MwTkkvRmd0MnZ5WkxDQzM1aEpzUDdYallqRjRF?=
 =?utf-8?B?YlN1RkFlUWljcFhQUDdrRmlOOUJiUVgraG9mdkR2d0U5Z2hZR1ZrbStOWHBm?=
 =?utf-8?B?SGtodkozdVVFQW8rU25Xamx6OGdkTzhFcThCOFcxN2pOWUpVdHFSbTMvK0VB?=
 =?utf-8?B?ZEN1dW95SmRwOEk4WkZ4YkdNekVUakxTR0RvUmR1MUh3OFFKanFyYkN1Q3VW?=
 =?utf-8?B?ZG9ZamdTWXRGU1kyRUViWndPekFSY2IrNVpmbnd2anZJTGtFVWw3aDhhTUZj?=
 =?utf-8?Q?mxps=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB8283.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eitML0pYWERyT0ZKUHRuaXpqakgxeVpnN3VtV3R3SE5WRDEzMjgxd1NBSXlX?=
 =?utf-8?B?ZGdlbENwSGlOUGYrbmc2TUIvbmc4UlZ2RUNBdmtMazVGc0oyU3B0QmxJOFdn?=
 =?utf-8?B?TVJMb291Q3FXVW1PcWVMVUpVWXJFL2hUYnc1YUxjOU9UdWlibnV3b0pPNU5Z?=
 =?utf-8?B?MzVINnUyVmJ1RmhHYTNZSjU4Zi94SHBjZlRyL3dSMVNaS1VtK08rWHlrTkg5?=
 =?utf-8?B?MUg2Y1NOREcyMFJRU081bWZEY2pVTHV5TDhLWmF2S1MyaUEvcjlkVVFQVkgx?=
 =?utf-8?B?clJzRGowUHAxUmFlcmxPME55aUQwUDBoMjRPSU5Fc2dFa01nZUl1OGRKc0V6?=
 =?utf-8?B?dlJUTERoY3R6YmRYK3JIOHl5RXhWSEY1KzhlWDBEQ2U0YTlzRkxsLzFtZ0Ew?=
 =?utf-8?B?cEtTeW1UMGp2S2gydDdLbU1ISnl5ajJsMzUyQkJ5QjhtaFZBQ1NDM29uNUI4?=
 =?utf-8?B?dGNRcDg5VVBZWkZnb0dwVnhGa0lZUlArTk02WnlmUzFSeCsrVUU4eHNQS2ox?=
 =?utf-8?B?clRqWHBPQXhpdjFWK3hXREdWNGEwQjR2ZzV4Y0YxcHdQSHEwdXd5UlhGK1dU?=
 =?utf-8?B?WEU3UzFML0NNblo4bndvdG43Y1hNd1VlSEwyZzdCSFlGdUk2VlR5b01NRFhr?=
 =?utf-8?B?cmNTZkx2NU5EWkMrYnVFZXJOWE90U2ZTR1lpSFFXaTZWREtQeU5oSmRva20w?=
 =?utf-8?B?dExZc1BHbFM3cWJGRWd2RVJsNlpSSDhmVnhnSzlhNFd0TVM3RDNFS1dVa05Z?=
 =?utf-8?B?STlZaFVoNEpkSklNZTVhZzB4Slo2MmJ4MVR3am5ZcCtKenFZK25VbUNONVMz?=
 =?utf-8?B?b0VDWk04VzBZc1kwUWpPcjBLNHNnKzRRajk4RjBLMVdKODFZYkRlR0hjcXYx?=
 =?utf-8?B?bmtLZFBnR2RFeDF1RWxaMXcyZUp6UFFwdXZ3bWhhZFhqaVQzL3d0Ym5Vemh5?=
 =?utf-8?B?bWhhWTI0cDJJd0p1STJqaC9YdG5saVVnSTk1UEtaTkFPenc5WU5zSENvUGtz?=
 =?utf-8?B?dVluUVlsaGM1OFNsZ0F4MSs1RlRlTVhjNFo4U3ZHMHZZNUxGemhRTTRuS3Bt?=
 =?utf-8?B?TUczMm5rUlBFMW9EV1VNSWVPNXRncEY4ZDEzMC9MellSckNLay9GMUh5OFlI?=
 =?utf-8?B?T3JtL1pGSHNhMUdZcnRja3hjSjRxUjVsYk9FQWFhZnc4aGM1U3FJUldHMHpB?=
 =?utf-8?B?eUhLQnJjdWw4VlFQdEJpWnphTEprbEFGQ1k0MjQyQjNpS3NPbUtHZzdoYUc4?=
 =?utf-8?B?QTd3MGw1M2FqNG54MTlmMUIwb2hiSWZFbzYvWkZqSWpYMytNd0Q0V09sMGRN?=
 =?utf-8?B?anA3MkxiOGQvL0VUZ0EyM2U0OU5QSXFOZ1ErbExCVktJaWtJQkJSeWtDM0RZ?=
 =?utf-8?B?MGpiYWxSdFpmRitlcEY5Qk9jM0RiZDNYamlMNURkZ0tBQXRSZTdJTmZuajQ1?=
 =?utf-8?B?OTBDS29VeE9Ic1U5S2RETGZCRlkrR0lJOGxuOTltemV5REE3RU9HVGZaZ2Fq?=
 =?utf-8?B?RmhsR3JKTWkyYXRxeG5sUHRjRExTeGhVRCsweWdUZys1N2huQkpkZGE2REpK?=
 =?utf-8?B?NDJmRHBLL1hmWllpakhvZ2tKM3lJVHRSdm0vanArU3Jlbm1BSVU0aVdaaHNR?=
 =?utf-8?B?MklyQkRubSt4YlJnUFVQVjNwTlZTdUZIeSttMTJBZno0Wjd4UzNKR0E5MXlS?=
 =?utf-8?B?Y0FkdUtXaVFCbG1Za3cwWjBkWm9EbDNYOXY3dWRhZTBGRmNFQ2pZNWFPbW0z?=
 =?utf-8?B?UVBGNjYxOFNRb2p4STFHVWtZMkxTRXBxMFNPVVNHd2RoeklpZjNtd0paVnJr?=
 =?utf-8?B?QW1aZEpBSnJZK0dPVXBsVWtGUUlEYk9mS1dBSnRpSWV2VjRFaGtMTCt4b0Vw?=
 =?utf-8?B?RlZKUDA3KzNXS1RWK3lQTUkwUmJ5L3l0WGozQW5UZWdOZis1WmpkUzZTU2JD?=
 =?utf-8?B?YTJTOENpVGM2M0duRUVGL3Vpb2pCK1RVRnRjbm52SElDRE12bHBKeWZrT1dk?=
 =?utf-8?B?OVhNRGsxVFV1NGt0bnpjQ09ZNFJnN2pBRFpieWE3Z0xaS1RrYVFPY2tSM0Qv?=
 =?utf-8?B?dGF2enV5QThwQlphcGRPTE9LYU1pZWxkL2hRKzFBU3F1R0s5Y1NZVThJT1JX?=
 =?utf-8?B?WjJnUkYxMDhSR1ZQSk9hUkNYTlRsSm1aNlN4NlVnRyt4NDJOaUNGTGJWQ1hq?=
 =?utf-8?B?b0JEMVRQK0IzdVNWdmdGbG5Vb0svSDVPTnF0MjdSZ043czJWOG9UVlRMUDls?=
 =?utf-8?B?NkgwOVhyV1RldDJzeExVSnp3eldLcUJHWmltYkVnUERpNURyczI2L3hIbkQ4?=
 =?utf-8?B?S295T1I0NmRGV1ZudEI5NExPMEVBZ3MyN1VUVzluaDRVSEphYVFNVkpMTENm?=
 =?utf-8?Q?ka1vTC8JQwZUK17o=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 506062c8-5713-4d8c-d9a4-08de73ba7130
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8283.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 15:36:14.0721
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RZE0SEZ5oNU22LmAOH7kGDKd+3SPvJ3JxvisbX8DETelecfWGSwb5rEch22T5pPm2w/S0gcnHPaJTTROkDaLijBeF91kCm/i1pDVtR5k1Lc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8122
X-OriginatorOrg: intel.com

On 2026-02-24 2:21 PM, Jaroslav Kysela wrote:
> On 2/23/26 15:49, Cezary Rojewski wrote:
>> The put() operation is expected to return:
>> 1) 0 on success if no changes were made
>> 2) 1 on success if changes were made
>> 3) error code otherwise
>>
>> Currently 2) is usually ignored when writing control-operations. While
>> forcing compliance is not an option right now, make it easier for
>> developers to adhere to the expectations and notice problems by logging
>> them when CONFIG_SND_CTL_DEBUG is enabled.
>>
>> Due to large size of struct snd_ctl_elem_value, 'value_buf' is provided
>> as a reusable buffer for kctl->put() verification. This prevents
>> exhausting the stack when verifying the operation.
>>
>>> From user perspective, patch introduces a new trace/events category
>> 'snd_ctl' containing a single 'snd_ctl_put' event type. Log sample:
>>
>>    amixer-1107    [002] .....   9.553687: snd_ctl_put: success: 
>> expected=0, actual=0 for ctl numid=1, iface=MIXER, name='Master 
>> Playback Volume', card id=0
>>    amixer-1108    [003] .....   9.498897: snd_ctl_put: success: 
>> expected=1, actual=1 for ctl numid=1, iface=MIXER, name='Master 
>> Playback Volume', card id=0
>>    amixer-1111    [001] .....   9.882768: snd_ctl_put: success: 
>> expected=1, actual=1 for ctl numid=5, iface=MIXER, name='Loopback 
>> Mute', card id=0
>>    amixer-1114    [002] .....   9.212184: snd_ctl_put: fail: 
>> expected=1, actual=0 for ctl numid=5, iface=MIXER, name='Loopback 
>> Mute', card id=0
> 
> Index (and maybe device/subdevice) numbers are missing to get full 
> control identification to follow amixer. Also, "card id" is usually 
> referred to automatically or manually assigned ASCII card identifier/ 
> alias (like USB-audio or PCH). I would just use 'card=<number>' in 
> TP_printk.


If the message length isn't a problem, then I'm going to add all of them 
in v7.
