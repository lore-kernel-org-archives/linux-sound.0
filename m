Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63E9D2E8B6B;
	Mon,  2 Mar 2026 12:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772452996; cv=fail; b=k3fn/eJJznEfYDkutoEWSltgCirvDNMtu3GLPQG7LIpsTwwAAFIHfaLM9nQib6jcM7wUQ21O/hp7cb+i33CisRAKS18dbXn0ouPKHonN3GUH5ScO0WXKzUlpAcPo50uNXze8yxx07ZDcDyGq1b4wZu10T/1+shDT8Lew90B+OjA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772452996; c=relaxed/simple;
	bh=Sbc81DluPJPFqnn6p+eIzhxHiY2H2gPh5RHkfL3Fm9I=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=HBr7X3fq4EBFh36rzxCuJEJre+81vFN72wDrn1yF91PYGSH0oz+tru9EEzDzcSiU2So6XNEKpKSdEbEOlEmMyPRSY8Di35AzO9IOaG/0NRvkB4UOlWWVhwummvhjD6A3QrUm4r0TY7hUWR+0qT4b1nrFNvnGrunQGQaQdLjnWYA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YkMo+Fvp; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YkMo+Fvp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772452995; x=1803988995;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Sbc81DluPJPFqnn6p+eIzhxHiY2H2gPh5RHkfL3Fm9I=;
  b=YkMo+FvpVLRg/ncubYJd6P6iNtwplA9zrYz5Lfkqdry03doiPFBYfi7q
   vAL2ckGXbXGW9DkGhdujKJOaEjQmMRniSj6dtzQBOup3OFAazwqKSHo7w
   vziGvoEjOKTwPmaepfaWxLwP7kCPHq6VnB64Jf61ejLHsprdyN67gMzhm
   cypoE/PUyECnBb7W1cSNrnDa+6m9bMFzC6dtOaMGRRcl33D1r5o22Vut/
   asV1grsM5VjcVxhV8LaelDcAjbyvkcnv1xehBh0xtlvTMiBtqS1iS1//u
   CZKH+M3KSx6YSZgZn0yfsu2UGwC0ASQPe6pihtVGJ22f68kU/NKofe+/J
   w==;
X-CSE-ConnectionGUID: yGRbhf1xQZSClpbWSi1uPg==
X-CSE-MsgGUID: B+prRyx2RpeisGvQuhaHbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11716"; a="73496758"
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; 
   d="scan'208";a="73496758"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 04:03:14 -0800
X-CSE-ConnectionGUID: tqYcyuTKQXuCGVNDE1am0w==
X-CSE-MsgGUID: MxMeL1/aQlCsxvDHxOT0kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; 
   d="scan'208";a="240649275"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 04:03:14 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 2 Mar 2026 04:03:13 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 2 Mar 2026 04:03:13 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.59) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 2 Mar 2026 04:03:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nbDsYDDoHbC5hAHkeYnRuEm+uA9c7tir64HnLbyrrzXgfwN4hX97NmbfC1fgsMsp5bY3mKB0zfdp+6w76vG0puW9rHZkd4YRwkaZPNsngrqiCHmJ9ufBxZAmx/EgYcpbbkC0RERZHI5DfySo625e/EGubZmTw3nc3wwhawszbQCjetz4IAsu+sYzqlBMmKGdLQ2ykKQOGW8xyLVDzuhJ8+RnNqPqUJNArHMKtmrZpmAA3ZKLAQ/x87/+m9UB/U7AtY3P+5BRgnIQGPIOVq/4/LLvocIsZ7hjh/+VkimZRG+9JLi1KIlfE/PZBEnEIBtW9pWQCwln05IfVRx5CE4L1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ytgfc/zy1gHl/tITxbr5YzfSvixbfOg0rEn3omsZ8rw=;
 b=pSB6TP7t06o+S+upeQf6pxoF2GOfbSj/6Qm5n+kuvB7OPON4QWW087GkxQ+A0c9TyOaia2Nu06aRqUJprUagQi9nTjEhUc1sUiqr0Oa6ikv9LoPpVk9/M0KoafQFKDDw4jfQxPy8DGYVeTUoVbEL+PM7DS4Zx7ofJmBPJPgKakY+2s4I7ZP+cqPPKkvdMOKilgJqsMlwDifYicSloZ6jgAg7tUEkBjwb2n9JU/kzXCJerLXrXJeHItyg7t4S+R8Dmz6UZd463sHgfXJAOibJdudTzjH13/qDQtBio4QwNkBlBZxpuPp1NDPAdNLpSvXjoz0kdsdNdQRRov3Y9PUSgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8283.namprd11.prod.outlook.com (2603:10b6:806:26c::16)
 by SA1PR11MB8351.namprd11.prod.outlook.com (2603:10b6:806:384::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Mon, 2 Mar
 2026 12:03:10 +0000
Received: from SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::d18f:6b38:584a:214]) by SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::d18f:6b38:584a:214%6]) with mapi id 15.20.9654.015; Mon, 2 Mar 2026
 12:03:10 +0000
Message-ID: <7932c58b-b6fa-40c3-8967-7710d84f9667@intel.com>
Date: Mon, 2 Mar 2026 13:03:04 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] ASoC: Intel: cht_yogabook: Add driver for Lenovo
 Yoga Book tablets
To: Yauhen Kharuzhy <jekhor@gmail.com>
CC: <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Hans de
 Goede" <hansg@kernel.org>, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Bard Liao
	<yung-chuan.liao@linux.intel.com>, Ranjani Sridharan
	<ranjani.sridharan@linux.intel.com>, Kai Vehmanen
	<kai.vehmanen@linux.intel.com>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.dev>, Mark Brown <broonie@kernel.org>
References: <20260301-asoc-yogabook-v2-v2-0-adcc7ed40985@gmail.com>
 <20260301-asoc-yogabook-v2-v2-3-adcc7ed40985@gmail.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20260301-asoc-yogabook-v2-v2-3-adcc7ed40985@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0295.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:8a::18) To SN7PR11MB8283.namprd11.prod.outlook.com
 (2603:10b6:806:26c::16)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8283:EE_|SA1PR11MB8351:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cb824d1-f5ad-4e07-1287-08de7853ac23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: XYSXtXMJ/iaJAGO14o63EpJ5sKNRoEqObTf4p7wvRf6iRFXzBYUaOwr/+Sh1t9pZNXSH5eOCgHKetLvVIgWKFOVNKjZe9RwwJPwwHLlv5ViaHUSO5Tn8mFn+GiD7dpHtW9TVXu3i4YQ3MNPlA+8Uh63AD+2LFpK0LN+ViedVpMHdP7asffJYoe0LG22hNSQQj4IYSVdWK62jt70iz/+yNGSPX5fsAo+Yew538xv9sqoKHD72ZT3Bv0bS5SFK4B/gcvlvJwMQSwyRGMi/J/MpNDrp8dCWnHEyz2lk+KoO/o9SU0KT6qcmaEgU35yDASJ2Pdwd3hHgp5M4FbIzuioJ9UEqr8a6MPZNbTnn+yFbmb+Cj2iKsWfVOGZ3Yl3Bz3ZYzWmzSpP8WezUqXd3PcW/0dGgTSsG/uxTXFI7e4s2iMOJgciKG91ZOzU0QKIqVRGppwK9s7pMk6MiRFT+ZKgXpVylKKaGfY4L3vySRE9rQ3OPrIQwr/l3DNQ0pdR5rPKQCwrX7uGZW0CQEQ6Z4r9XB9ccLWKwKKSEmETDjA3EdUoeR3+DcKdlfkUL+tE6XlH1zdGmtUSL04KJMNYdL+FiH7L+PA6jOK0zqMrhdhoaJ3AwGY6r5+vRqtOZgzBe5QgoALwYbaqsUHg/8lY5mLUNsTXqvippNT4ZGLR0advoywIjq+sIcRrec9IEBsFeVRWc8SzPsRufsNVP0t0ATXIpdHS69RRdUEzt9a7ABySdO0j6iu2kihA1shu5dsTV+W8x
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB8283.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aDZncW05VTl2cUllUDIrYzVNbVNtbUw3U3lGMXI5WTdvZnoxQ1BnczdBeU5U?=
 =?utf-8?B?Mkk0MlY5WlptclYrQlNrM1U5MGJ6RGZTRE5lVG9BMTBRamphbDMxRE5SYUxY?=
 =?utf-8?B?ZUVQKzBzQWhqdzlKL1hNajNCNjZ4eXBtZHhyaUNwU3VheC9oM3o0NGhsT1RX?=
 =?utf-8?B?VnFDZDFvNkY0YWhNVjAxQmJDd1Baelh0WUt2b3B6NlFtK1hCUk1hUmIrOS9J?=
 =?utf-8?B?SDV6NlBFY3hRSDM2YXluUng1TUdtMWZFWEV3clJxQ0pCVFY4N1FSbWlNR0Ni?=
 =?utf-8?B?N0FHaitsTnMvQTUzRU05SDByY1c3U1BLUmNOODdBcmpEdzU0UElxTDhPRFBJ?=
 =?utf-8?B?YjM3WUQ0SnFPeFpHdWY0YVozTE5ZVS8xSnJicDlIQ0NhQ3pyanBGZnc4bzdx?=
 =?utf-8?B?bzU1WGxiQ0kzYzNNTWRNR3Q4TE9yVWVvSGlMSlRtbE5qUjNKUlNTOEVGSzRt?=
 =?utf-8?B?OVM4UmlmdHV4SG0wL0FPQVdzQ1VIUURwVGlmenVNcXhFaDRUdnpBZ0Q5WDJO?=
 =?utf-8?B?Q1htOUU1a3d2VXY1V21uMms1dlVWbUJGVU0rNVpzRWIrM3IyM2ZIU21EeVdH?=
 =?utf-8?B?cnlTVmQyVVpWT25iekY0ZTlJN05BOWpGcDFhZzNLSUtlVG5YUURMNFFtdGhB?=
 =?utf-8?B?YS8vTnNIdVpNM2xiZmd6TjBEU3hZZUptTlRJVVFYMm5uMnpOOFVBNUxLcWF2?=
 =?utf-8?B?Sm4xbXdIWW5BMVJnZThKQnh5SmZSdjIvR3hacE9xTFpmNTkwbEZNUWF2blcv?=
 =?utf-8?B?VmZsZVNkWW9MRGtLT2cvRkQ3bXpjT1BIaW5yMHpMR21kY25SSmp2TktteEZn?=
 =?utf-8?B?LzhhS1puRTlVMlZQUFI4UlpDbGEzRmN3YVpBMFVRYUJlUDFIZjlITVFVdVhK?=
 =?utf-8?B?Sk0xV0d1cE5NTXRqUXhMbkJFaFk2TUdPYjNsRlR5QjB5QW9pMEFJVzNmb05C?=
 =?utf-8?B?aStkQTJ6N2wwejFhNGFXOXkvSWV2Z1FQMHYrOUFaUGpHV2ZSSTZUZ212cnM1?=
 =?utf-8?B?b1IwalBUa2VpamhwemQxY0Qzbnp0QjNuSkFPemUwU0pzZUpUTFZ0eElNQnlx?=
 =?utf-8?B?dFJyM21TZ2NKNXIyeU1RS05XSzFaU2NxZElYaW1QSXRSelBMeHVRTWttcGsv?=
 =?utf-8?B?RzdGTTNBZk1LQ0RFNWhCcXdSQkdiN3h5Sm5STmR3d3pyRjZoS05aKzdkd0Nr?=
 =?utf-8?B?WTNQUUVyQ0tydUMxTlI5d3lTenpsSDFxRHV1Y3RHOHY1a0k2YWs4NkxPK0sr?=
 =?utf-8?B?OXEwbDA4S09KSUJUS291VkJ5SGF1WUVjQ29NSHc4Q3ZaRnptV1h2RWNVRVZ1?=
 =?utf-8?B?UnJUOVN1a2JKZmJFcWZ4SGhWc04xUFA5WC8vSWlKQUJMQWx5aEgrYk56NzI4?=
 =?utf-8?B?SWFZWnVKdTJqR3V5UjhyL1VjTHE5TE4ybnlKMkNpU3g0VWw0R1hMR2drT3ZR?=
 =?utf-8?B?WkdLNmFmb2dSOHU2Z3ZKaldIeEswNjBmUXBuU3hERnlpdm1xL0M2dWtVT0ZB?=
 =?utf-8?B?bkVucWJtK0s2YS82YWJNdFUrS1VkWjNJQmtGWEFpWXhkVkthaU9uVXpTWlhs?=
 =?utf-8?B?Q01Ga2pmc1I4c0VCbk83aVhtN2J6UW1zZWgvM0lOakNxZDhHMlBUajFhK0Fv?=
 =?utf-8?B?Vk8rTjBBYzBzSkFKTlMyaWJ0cUg2YjB3ZzR3b2VYdFN0bXVudWhXUE1TdFRD?=
 =?utf-8?B?N3RJMktMeUczMkZMMEdBS3hyeUszRWIxODVZalk0a1pjcmdDM24ybTFwc2M2?=
 =?utf-8?B?U1lITEtPdDlhUmFuNEpJbHMwVEZNa2Yxb2cwczczM2hEUEUzVkYvSjdPaFcv?=
 =?utf-8?B?VjhiMzBIOGRqbGtBZmRKN3AxVi9wTGJjK28xb3BpREU4TXMwRENidWxOSGN4?=
 =?utf-8?B?MVZpaGxic3hvVzFmUXduUzZqWHZwS2doSlRVbFU2bnhuMFdYRGdjNFlnTlhD?=
 =?utf-8?B?SjNZSXlkRUk1dzYzUE9lSWV5enpabm9mMmRkR1RHUDZGaWQzOENJd1hmMldN?=
 =?utf-8?B?YnUwSEVKRSs2U3RkWnhQU3RUMFdUbXdGamp1QVFhblB4Y0pwL2hYVk44anVs?=
 =?utf-8?B?MkxYc0x0VkFIQWhLZVpqbmFHbTJONCtNUzY2VVVCaVFsazFNb0VHaHA0aWRJ?=
 =?utf-8?B?T0tLcVJ4cmhaZWVFTDkvZzZBNWFLSUZFZ1FOMFBBaXA5SXQ3MjFkZmpmMEpD?=
 =?utf-8?B?cWFHWXM1SW5Ebk8yT281NXErRWd0TDdpZUV6T2hFZkdJR2JhTlMvcW5mZS9L?=
 =?utf-8?B?U0w2THRiRzdiQVhVMmxBS2daSHYyVE45cExyTGxvMWp2b2ppbi9MeGI0U05p?=
 =?utf-8?B?ZzExRUlYY1hCZ3pEV3d6V0JzblBNQ3JoMndEY2JaWCtZdjBSMUdRck1td1p1?=
 =?utf-8?Q?JFNM5t8woxem09eQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cb824d1-f5ad-4e07-1287-08de7853ac23
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8283.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 12:03:10.1244
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HCJzWY1fHNt7kMcCAPqf6FRozmXhzGM5pMhcShUWPI4bYhAUbIAwUlvRbBW23Kmon7VTOl0UZBvWkWkIb5atFmrQqPEdqZsqMRMZBZsvsoE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8351
X-OriginatorOrg: intel.com

On 2026-03-01 10:33 PM, Yauhen Kharuzhy wrote:
> Add a new ASoC machine driver for Lenovo Yoga Book Intel Cherry
> Trail-based tablets (YB1-X90F/L, YB1-X91F/L models).
> 
> This platform uses a Realtek ALC5677 codec accompanied by a TS3A227E jack
> configuration detection IC.
> 
> The driver is based on the cht_bsw_rt5672.c mainline driver and the driver
> from the vendor's Android kernel [1].
> 
> There are no other known Cherry Trail platforms using an RT5677 codec, so
> the driver is named 'cht_yogabook', and some device-specific tricks are
> hardcoded, such as jack events and additional GPIOs controlling the
> speaker amplifier.

I'd switch to more specific naming. From the Intel-maintainer point of 
view, it's easier to navigate between configurations when 
<platform>-<codec> naming is in use. TBH, we do not see "yogabook", we 
configuration composed of Cherrytrail-based device and rt5677 I2C codec.

For the entire driver:
- fix alignments
- fix char-per-line limit, submission rules expect 100c-per-line limit

Below additional comments.

> 
> [1] https://github.com/deadman96385/android_kernel_lenovo_yeti/blob/master/sound/soc/intel/board/cht_bl_dpcm_rt5677.c
> 
> Signed-off-by: Yauhen Kharuzhy <jekhor@gmail.com>

...


> diff --git a/sound/soc/intel/boards/Makefile b/sound/soc/intel/boards/Makefile
> index 25a1a9066cbf..58bd6029545b 100644
> --- a/sound/soc/intel/boards/Makefile
> +++ b/sound/soc/intel/boards/Makefile
> @@ -15,6 +15,7 @@ snd-soc-sst-cht-bsw-nau8824-y := cht_bsw_nau8824.o
>   snd-soc-sst-byt-cht-cx2072x-y := bytcht_cx2072x.o
>   snd-soc-sst-byt-cht-da7213-y := bytcht_da7213.o
>   snd-soc-sst-byt-cht-es8316-y := bytcht_es8316.o
> +snd-soc-sst-cht-yogabook-objs := cht_yogabook.o

Let's follow recommendation from Takashi [1]. Suffix "-objs" is obsolete.

[1]: https://lore.kernel.org/all/20240507155540.24815-13-tiwai@suse.de/

>   snd-soc-sst-byt-cht-nocodec-y := bytcht_nocodec.o
>   snd-soc-sof_rt5682-y := sof_rt5682.o
>   snd-soc-sof_cs42l42-y := sof_cs42l42.o
> @@ -47,6 +48,7 @@ obj-$(CONFIG_SND_SOC_INTEL_CHT_BSW_NAU8824_MACH) += snd-soc-sst-cht-bsw-nau8824.
>   obj-$(CONFIG_SND_SOC_INTEL_BYT_CHT_CX2072X_MACH) += snd-soc-sst-byt-cht-cx2072x.o
>   obj-$(CONFIG_SND_SOC_INTEL_BYT_CHT_DA7213_MACH) += snd-soc-sst-byt-cht-da7213.o
>   obj-$(CONFIG_SND_SOC_INTEL_BYT_CHT_ES8316_MACH) += snd-soc-sst-byt-cht-es8316.o
> +obj-$(CONFIG_SND_SOC_INTEL_CHT_YOGABOOK_MACH) += snd-soc-sst-cht-yogabook.o
>   obj-$(CONFIG_SND_SOC_INTEL_BYT_CHT_NOCODEC_MACH) += snd-soc-sst-byt-cht-nocodec.o
>   obj-$(CONFIG_SND_SOC_INTEL_SKL_HDA_DSP_GENERIC_MACH) += snd-soc-skl_hda_dsp.o
>   obj-$(CONFIG_SND_SOC_INTEL_EHL_RT5660_MACH) += snd-soc-ehl-rt5660.o
> diff --git a/sound/soc/intel/boards/cht_yogabook.c b/sound/soc/intel/boards/cht_yogabook.c
> new file mode 100644
> index 000000000000..9d945cad5660
> --- /dev/null
> +++ b/sound/soc/intel/boards/cht_yogabook.c
> @@ -0,0 +1,551 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + *  cht_yogabook.c - ASoc Machine driver for Lenovo Yoga Book YB1-X90/X91
> + *  tablets, based on Intel Cherrytrail platform with RT5677 codec.
> + *
> + *  Copyright (C) 2026 Yauhen Kharuzhy <jekhor@gmail.com>
> + *
> + *  Based on cht_bsw_rt5672.c:
> + *  Copyright (C) 2014 Intel Corp
> + *  Author: Subhransu S. Prusty <subhransu.s.prusty@intel.com>
> + *          Mengdong Lin <mengdong.lin@intel.com>
> + *
> + *  And based on the cht_bl_dpcm_rt5677.c from the Lenovo's Android kernel:
> + *  Copyright (C) 2014 Intel Corp
> + *  Author: Mythri P K <mythri.p.k@intel.com>

Not sure about the boiler plate here. Mentioning people is OK but the 
emails are all obsolete. Such information does not help anyone. Perhaps 
"based on XYZ" is enough.

> + */
> +
> +#include <linux/clk.h>
> +#include <linux/dmi.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/gpio/machine.h>
> +#include <linux/i2c.h>
> +#include <linux/input.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +#include <sound/jack.h>
> +#include <sound/pcm.h>
> +#include <sound/pcm_params.h>
> +#include <sound/soc-acpi.h>
> +#include <sound/soc.h>
> +#include "../../codecs/rt5677.h"
> +#include "../../codecs/ts3a227e.h"
> +#include "../atom/sst-atom-controls.h"
> +
> +#define RT5677_I2C_DEFAULT	"i2c-rt5677"
> +
> +/* The platform clock #3 outputs 19.2Mhz clock to codec as I2S MCLK */
> +#define CHT_PLAT_CLK_3_HZ	19200000
> +#define CHT_CODEC_DAI		"rt5677-aif1"
> +
> +struct cht_yb_private {
> +	char codec_name[SND_ACPI_I2C_ID_LEN];
> +	struct snd_soc_jack jack;
> +	struct clk *mclk;
> +	struct gpio_desc *gpio_spk_en1;
> +	struct gpio_desc *gpio_spk_en2;
> +	struct gpio_desc *gpio_hp_en;
> +};
> +
> +static int cht_yb_platform_clock_control(struct snd_soc_dapm_widget *w,
> +					 struct snd_kcontrol *k, int  event)

Please replace 'k' with 'kctl' for the entire file.

> +{
> +	struct snd_soc_card *card = snd_soc_dapm_to_card(w->dapm);
> +	struct snd_soc_dai *codec_dai;
> +	struct cht_yb_private *ctx = snd_soc_card_get_drvdata(card);
> +	int ret;
> +
> +	codec_dai = snd_soc_card_get_codec_dai(card, CHT_CODEC_DAI);
> +	if (!codec_dai) {
> +		dev_err(card->dev,
> +			"Codec dai not found; Unable to set platform clock\n");
> +		return -EIO;
> +	}
> +
> +	if (SND_SOC_DAPM_EVENT_ON(event)) {
> +		if (ctx->mclk) {
> +			ret = clk_prepare_enable(ctx->mclk);
> +			if (ret < 0) {
> +				dev_err(card->dev,
> +					"could not configure MCLK state");
> +				return ret;
> +			}
> +		}
> +
> +		/* set codec PLL source to the 19.2MHz platform clock (MCLK) */
> +		ret = snd_soc_dai_set_pll(codec_dai, 0, RT5677_PLL1_S_MCLK,
> +					  CHT_PLAT_CLK_3_HZ, 48000 * 512);
> +		if (ret < 0) {
> +			dev_err(card->dev, "can't set codec pll: %d\n", ret);
> +			return ret;
> +		}
> +
> +		/* set codec sysclk source to PLL */
> +		ret = snd_soc_dai_set_sysclk(codec_dai, RT5677_SCLK_S_PLL1,
> +					     48000 * 512, SND_SOC_CLOCK_IN);
> +		if (ret < 0) {
> +			dev_err(card->dev, "can't set codec sysclk: %d\n", ret);
> +			return ret;
> +		}
> +	} else {
> +		/* Set codec sysclk source to its internal clock because codec
> +		 * PLL will be off when idle and MCLK will also be off by ACPI
> +		 * when codec is runtime suspended. Codec needs clock for jack
> +		 * detection and button press.
> +		 */
> +		snd_soc_dai_set_sysclk(codec_dai, RT5677_SCLK_S_RCCLK,
> +				       48000 * 512, SND_SOC_CLOCK_IN);
> +
> +		if (ctx->mclk)
> +			clk_disable_unprepare(ctx->mclk);
> +	}

The entire function is made of if-statement. I'd split this into:

xyz_platform_clock_control()
|_ xyz_platform_clock_enable()
|_ xyz_platform_clock_disable()


> +	return 0;
> +}
> +
> +static int cht_yb_hp_event(struct snd_soc_dapm_widget *w,
> +			   struct snd_kcontrol *k, int event)
> +{
> +	struct snd_soc_card *card = snd_soc_dapm_to_card(w->dapm);
> +	struct cht_yb_private *ctx = snd_soc_card_get_drvdata(card);
> +
> +	dev_dbg(card->dev, "HP event: %s\n",
> +		SND_SOC_DAPM_EVENT_ON(event) ? "ON" : "OFF");

These dev_dbg() can be dropped. Function tracer or DAPM events found 
within tracing/events are sufficient.

> +
> +	gpiod_set_value_cansleep(ctx->gpio_hp_en, SND_SOC_DAPM_EVENT_ON(event));
> +
> +	return 0;
> +}
> +
> +static int cht_yb_spk_event(struct snd_soc_dapm_widget *w,
> +			    struct snd_kcontrol *k, int event)
> +{
> +	struct snd_soc_card *card = snd_soc_dapm_to_card(w->dapm);
> +	struct cht_yb_private *ctx = snd_soc_card_get_drvdata(card);
> +
> +	dev_dbg(card->dev, "SPK event: %s\n",
> +		SND_SOC_DAPM_EVENT_ON(event) ? "ON" : "OFF");

Ditto.

> +
> +	gpiod_set_value_cansleep(ctx->gpio_spk_en1,
> +				 SND_SOC_DAPM_EVENT_ON(event));
> +	gpiod_set_value_cansleep(ctx->gpio_spk_en2,
> +				 SND_SOC_DAPM_EVENT_ON(event));
> +
> +	return 0;
> +}

...

> +static int cht_yb_codec_init(struct snd_soc_pcm_runtime *runtime)
> +{
> +	int ret = 0;

Move as last.

> +	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(runtime, 0);
> +	struct snd_soc_component *component = codec_dai->component;
> +	struct cht_yb_private *ctx = snd_soc_card_get_drvdata(runtime->card);
> +
> +	/* Enable codec ASRC function for Stereo DAC/Stereo1 ADC/DMIC/I2S1.
> +	 * The ASRC clock source is clk_i2s1_asrc.
> +	 */
> +	rt5677_sel_asrc_clk_src(component, RT5677_DA_STEREO_FILTER |
> +			RT5677_AD_STEREO1_FILTER | RT5677_I2S1_SOURCE,
> +			RT5677_CLK_SEL_I2S1_ASRC);
> +	/* Enable codec ASRC function for Mono ADC L.
> +	 * The ASRC clock source is clk_sys2_asrc.
> +	 */
> +	rt5677_sel_asrc_clk_src(component, RT5677_AD_MONO_L_FILTER,
> +				RT5677_CLK_SEL_SYS2);
> +
> +	ctx->gpio_spk_en1 = devm_gpiod_get(component->dev, "speaker-enable",
> +					   GPIOD_OUT_LOW);
> +	if (IS_ERR(ctx->gpio_spk_en1)) {
> +		dev_err(component->dev, "Can't find speaker enable GPIO\n");
> +		return PTR_ERR(ctx->gpio_spk_en1);
> +	}
> +
> +	ctx->gpio_spk_en2 = devm_gpiod_get(component->dev, "speaker-enable2",
> +					   GPIOD_OUT_LOW);
> +	if (IS_ERR(ctx->gpio_spk_en2)) {
> +		dev_err(component->dev, "Can't find speaker enable 2 GPIO\n");
> +		return PTR_ERR(ctx->gpio_spk_en2);
> +	}
> +
> +	ctx->gpio_hp_en = devm_gpiod_get(component->dev, "headphone-enable",
> +					 GPIOD_OUT_LOW);
> +	if (IS_ERR(ctx->gpio_hp_en)) {
> +		dev_err(component->dev, "Can't find headphone enable GPIO\n");

The messages here are misleading. "Can't find ..." when devm_gpiod_get() 
returns different IS_ERR() than -ENOENT is incorrect. I'd just state 
that XYZ operation failed and append the return code. Scales nicely into 
the future.

> +		return PTR_ERR(ctx->gpio_hp_en);
> +	}
> +
> +	if (ctx->mclk) {

If no-MCLK case even valid here? You're providing new driver for an 
older, specific configuration. Perhaps limiting the code to the actual 
(and only) user is the way to go?

> +		/*
> +		 * The firmware might enable the clock at
> +		 * boot (this information may or may not
> +		 * be reflected in the enable clock register).
> +		 * To change the rate we must disable the clock
> +		 * first to cover these cases. Due to common
> +		 * clock framework restrictions that do not allow
> +		 * to disable a clock that has not been enabled,
> +		 * we need to enable the clock first.
> +		 */
> +		ret = clk_prepare_enable(ctx->mclk);
> +		if (!ret)
> +			clk_disable_unprepare(ctx->mclk);
> +
> +		ret = clk_set_rate(ctx->mclk, CHT_PLAT_CLK_3_HZ);
> +
> +		if (ret) {
> +			dev_err(runtime->dev, "unable to set MCLK rate\n");
> +			return ret;
> +		}
> +	}
> +
> +	return 0;
> +}

...

> +#define SOF_CARD_NAME "cht yogabook"
> +#define SOF_DRIVER_NAME "SOF"
> +
> +#define CARD_NAME "cht-yogabook"
> +#define DRIVER_NAME NULL

Have you tested the driver with both, legacy -and- SOF firmware? If 
you're using just one of them, let's limit the driver to that one. 
Anything else can be part of a follow up series if there is a need to 
support multiple solutions. Otherwise we'd be merging code with no 
coverage and no user.

> +
> +static int snd_cht_yb_mc_probe(struct platform_device *pdev)
> +{
> +	int ret_val = 0;
> +	struct cht_yb_private *drv;

No. 'drv', short for 'driver', is not the right name for the private 
context. Typically 'priv' or 'data' is used.

> +	struct snd_soc_acpi_mach *mach = pdev->dev.platform_data;

dev_get_platdata(), no reason to avoid well-established APIs.

> +	const char *platform_name;
> +	struct acpi_device *adev;
> +	struct device *codec_dev;
> +	bool sof_parent;
> +	int i;
> +
> +	drv = devm_kzalloc(&pdev->dev, sizeof(*drv), GFP_KERNEL);
> +	if (!drv)
> +		return -ENOMEM;
> +
> +	strscpy(drv->codec_name, RT5677_I2C_DEFAULT);
> +
> +	/* fixup codec name based on HID if ACPI node is present */
> +	adev = acpi_dev_get_first_match_dev(mach->id, NULL, -1);
> +	if (adev) {
> +		snprintf(drv->codec_name, sizeof(drv->codec_name),
> +			 "i2c-%s", acpi_dev_name(adev));
> +		dev_info(&pdev->dev, "real codec name: %s\n", drv->codec_name);
> +
> +		put_device(&adev->dev);
> +		for (i = 0; i < ARRAY_SIZE(cht_yb_dailink); i++) {
> +			if (cht_yb_dailink[i].codecs->name &&
> +			    !strcmp(cht_yb_dailink[i].codecs->name,
> +				    RT5677_I2C_DEFAULT)) {
> +				cht_yb_dailink[i].codecs->name = drv->codec_name;
> +				break;
> +			}
> +		}
> +	}
> +
> +	codec_dev = bus_find_device_by_name(&i2c_bus_type, NULL,
> +					    drv->codec_name);
> +	if (!codec_dev)
> +		return -EPROBE_DEFER;
> +
> +	if (adev) {
> +		ret_val = devm_acpi_dev_add_driver_gpios(codec_dev,
> +							 cht_yb_gpios);
> +		if (ret_val)
> +			dev_warn(&pdev->dev,
> +				 "Unable to add GPIO mapping table: %d\n",
> +				 ret_val);
> +	}
> +
> +	/* override platform name, if required */
> +	snd_soc_card_cht_yb.dev = &pdev->dev;
> +	platform_name = mach->mach_params.platform;
> +
> +	ret_val = snd_soc_fixup_dai_links_platform_name(&snd_soc_card_cht_yb,
> +							platform_name);
> +	if (ret_val) {
> +		dev_err(&pdev->dev,
> +			"snd_soc_fixup_dai_links_platform_name failed: %d\n",
> +			ret_val);
> +		return ret_val;
> +	}
> +
> +	drv->mclk = devm_clk_get(&pdev->dev, "pmc_plt_clk_3");
> +	if (IS_ERR(drv->mclk)) {
> +		dev_err(&pdev->dev,
> +			"Failed to get MCLK from pmc_plt_clk_3: %ld\n",
> +			PTR_ERR(drv->mclk));
> +		return PTR_ERR(drv->mclk);
> +	}
> +	snd_soc_card_set_drvdata(&snd_soc_card_cht_yb, drv);
> +
> +	sof_parent = snd_soc_acpi_sof_parent(&pdev->dev);
> +
> +	/* set the card and driver name */
> +	if (sof_parent) {
> +		snd_soc_card_cht_yb.name = SOF_CARD_NAME;
> +		snd_soc_card_cht_yb.driver_name = SOF_DRIVER_NAME;
> +	} else {
> +		snd_soc_card_cht_yb.name = CARD_NAME;
> +		snd_soc_card_cht_yb.driver_name = DRIVER_NAME;
> +	}
> +
> +	/* register the soc card */
> +	snd_soc_card_cht_yb.dev = &pdev->dev;

I'd move away from static-card approach and dynamically allocate the 
object here, in the probe() function.

> +	ret_val = devm_snd_soc_register_card(&pdev->dev, &snd_soc_card_cht_yb);
> +	if (ret_val) {
> +		dev_err(&pdev->dev,
> +			"snd_soc_register_card failed %d\n", ret_val);
> +		return ret_val;
> +	}
> +	platform_set_drvdata(pdev, &snd_soc_card_cht_yb);

This seems bogus. The probe() found here is not the function that 
spawned the platform-device 'pdev' yet it attempts to manipulate 
device's private data. At the same time there is no 
platform_get_drvdata() anywhere. Unless there's a strong reason for the 
call, please drop the line.

> +
> +	return ret_val;
> +}
> +
> +static struct platform_driver snd_cht_yb_mc_driver = {
> +	.driver = {
> +		.name = "cht-yogabook",

It seems .pm assignment is missing. I see that the "base" is missing 
this too. Looks like a flaw, I'd assign snd_soc_pm_ops and re-test. The 
ops describe basic bring-up and tear-down procedures and I'm expecting 
them to notify us about any problems rather than harm the configuration.

> +	},
> +	.probe = snd_cht_yb_mc_probe,
> +};
> +
> +module_platform_driver(snd_cht_yb_mc_driver);
> +
> +MODULE_DESCRIPTION("Lenovo Yoga Book YB1-X9x machine driver");
> +MODULE_AUTHOR("Yauhen Kharuzhy");
> +MODULE_LICENSE("GPL v2");
> +MODULE_ALIAS("platform:cht-yogabook");
> 

