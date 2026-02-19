Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26D4C2E973F
	for <linux-sound@vger.kernel.org>; Thu, 19 Feb 2026 17:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771520772; cv=fail; b=QVfktHRA2s0jRJv/RN7OcIePNpNs6l2siCIwIKIXVUa1Yt/O4cJsVhLDO8Ev6nohA9YihlqO3Txquz7qbLTMF5MR17/WbB8lzYck0rLMQdaDBrdlIgFTqPrFwIQkhYqLTeJy+CX5LLsrkJKh0vUKrWNsDpY9le3PeTE4vbreVdc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771520772; c=relaxed/simple;
	bh=THw4OKAfPO4cfnVdkF9r7zTEM7QgprtWVW7bYUx6KKg=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=q4p5zAT2BTIwF+T1bWSwHlW/BcqDW9EtxPlHTqRI2Kp26WcuvZwqlua9wjQgC0VNxAHOWPVLJYyVIRSX16sF/bmD1SL33f2Pgb4qkmdpDhKCw+Qd+1+1hrEkLTdNfHPoApegF1l+zseaAe90b3V3S+iye8Q8bXUydswuD5xmRgM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MSJxRUuR; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MSJxRUuR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771520770; x=1803056770;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=THw4OKAfPO4cfnVdkF9r7zTEM7QgprtWVW7bYUx6KKg=;
  b=MSJxRUuRKKadQivva17OMFZPpzzd+Dj/YrBiBtxy6ewXTN9i1dTa5Iou
   DexhFEp7+fU7Sp6uBf7qpr9jVJkpv+yHeELml9LHVqd6tagZ4NVo1ElHb
   PVWu0x5x/N0yL/l4n8iPdhtOMRqTpI46wyuAlcYzRTV57JI+jj7OIDUOi
   0gnsKbHcDQi7K6e7i0eZVCtzzxCR1UIgKQJf8lUeLVacMdsdDIDhRbpOP
   PQVaDE82Ig8ouq15NVqUKYXlgZwNm169fyeUXMLGTIIgHtXH0emnv96q4
   caZkVSFgzGnrwvxt9YhWfuUKufUgNWYEOntjPKyzk/ojQ0jhel13c7AoA
   A==;
X-CSE-ConnectionGUID: XAhOFu70Sw+eZpqJh3yZrw==
X-CSE-MsgGUID: UgzYt1pVRnq0lV62svAQ8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="82937197"
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; 
   d="scan'208";a="82937197"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2026 09:06:10 -0800
X-CSE-ConnectionGUID: J/S3IAhIQou3yo8S3ST2Tw==
X-CSE-MsgGUID: 4/KcfRm+Qr2FdZseE5L4sA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; 
   d="scan'208";a="237564501"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2026 09:06:10 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 19 Feb 2026 09:06:09 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 19 Feb 2026 09:06:09 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.42) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 19 Feb 2026 09:06:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PpexeYMmlHeYdb/J8SqePERqmkf62UN4rSSkq/KA/r/xYb88nqFCvbIBEzLW8lxabKD9IYRa8ssO970xAZuOuL5rBhRooTfEwAdo45vj593S42nctznzcHtx0xI4AXF2V0ocxFaHOXJdUkULL+kp3ACqm47E1CuDchPmo6F3dGIvWmCmA/0pU2PoeMw+JZFQn3wBSnqQmCGO+/9pkraoW7V+zHGrCFqDD7eqd5RzGtrOMxEkPGL3mIV8N/KpKXd+CQ+tqRgjoa45SwpYDWKsg5xy8IAZVYskcg4lqz5e5wld56/5cmKhG+JEPciLGT4CNXW+vPZTaLOqCBoZxmwRVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=insO2/fXOoZCT0Tppd1Ig53GgAaXueW5PAUK9FuLPnE=;
 b=qyYPGqXq1kwwA5V7Xyp80h5wsdZWKg0HX9TVpKsXHYQrR0u0Nck6CSXnjLaA5jvSGpKw9OoNeITnY6ixU1p+z5MRvcbgJ6Wp+XpMK8XHkQI4GuhnJ5A5krEOLRLHfuIw3XN+l3vtCKaFR37snsoUNTMHztTLVaiO91Hew6LlMv1M4tLfpLqXv+udG1ILzpr1Tzo/PIGnbn3LY1tfFlHNx2eV4Y4XR8OMSdXDGdf5v+ktHP/dnoWEdU93hxCop14WiznrLqyqt5cw+QUA/qEsyBgJ30z8wdYWQvqi+d1TDSPo4zcF/h2PeoB7Xfnty1xtSIAX6dd0PHuuCivRdPzGQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8283.namprd11.prod.outlook.com (2603:10b6:806:26c::16)
 by PH7PR11MB8453.namprd11.prod.outlook.com (2603:10b6:510:308::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Thu, 19 Feb
 2026 17:06:02 +0000
Received: from SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::d18f:6b38:584a:214]) by SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::d18f:6b38:584a:214%4]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 17:06:01 +0000
Message-ID: <b9f5071d-dc20-40df-847a-d8ff0ade2f5d@intel.com>
Date: Thu, 19 Feb 2026 18:05:56 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] ALSA: control: Verify put() result when in debug mode
To: Takashi Iwai <tiwai@suse.de>
CC: <tiwai@suse.com>, <broonie@kernel.org>, <perex@perex.cz>,
	<amade@asmblr.net>, <linux-sound@vger.kernel.org>,
	<kuninori.morimoto.gx@renesas.com>
References: <20260219094614.504459-1-cezary.rojewski@intel.com>
 <87y0kpqc4z.wl-tiwai@suse.de> <87wm09qc2y.wl-tiwai@suse.de>
 <2f5d09b7-6cbc-49d0-b1d8-52c48dfadc66@intel.com>
 <87v7ftqb4d.wl-tiwai@suse.de>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <87v7ftqb4d.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0102CA0082.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:15::23) To SN7PR11MB8283.namprd11.prod.outlook.com
 (2603:10b6:806:26c::16)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8283:EE_|PH7PR11MB8453:EE_
X-MS-Office365-Filtering-Correlation-Id: 1094d3ac-7325-4f80-04fe-08de6fd928b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bXRZVXd4QjYyOVVXajlSbGRJUEU4NExsS2xrT3JjYUphalozcHNoQk5xZ284?=
 =?utf-8?B?QW5tR1NFN1JJcVluNnp3TTdHRFFENzl1RXJETWxsV2VzdEkvbWd0LzhSbzJv?=
 =?utf-8?B?TVlxa2xQR3hGWmdXOUt0b0ZKUjRGNmVRY2xMdEJvYXIybkhGZlpzb0tDNmtv?=
 =?utf-8?B?cVQvV0Z1MWtHMjJSaVFNU3YyUlB1MHJrTjdzU01vTE1OVXRaeTg5cWc1aU1h?=
 =?utf-8?B?aFgrL0RZelduRFFFaEkwbVRTbUFJWVplSjZUOFVNYmNHQlFPdW1weFpxaG8v?=
 =?utf-8?B?TFd3ZkVjaGdNU1pwOHR4T2diVGtoRVV4S0dNM1VqbFczbXdWT2NHV2o3ZytD?=
 =?utf-8?B?L0p6SHR4Nkowbkx4WW1wMjRIQ3hyeVB0eEpucFR6VitpL3VwbkVJUUxJb3Fk?=
 =?utf-8?B?TmJmME9JcmdGY2hhckxEZDhDNm5sZ2FKYk9kdUowdEd0WjhSNzIzcVBBN2VC?=
 =?utf-8?B?Q2ZvQXZkbWhWK1B1UEh4L2xDakJIUFNndzJua2NkaDNtSUpzWksvVDc0K3VR?=
 =?utf-8?B?djN6UWNTbVJEOHBPT01FejdtQVg2WVQvTk12c2JYMTBFb0h0MEJlRjZLei9O?=
 =?utf-8?B?a2dHUHFlZksweGlMQVZ3TGYvZlloQis4KytuaE5mRXE2Q1FmSnRLTi96WEox?=
 =?utf-8?B?UEk1aDl4bjhadkRIaVVpdmk4RWcweFVUNW5kWE1sVXpYWFZzVm9DWDlDTHRz?=
 =?utf-8?B?UkFjaUp0UkFwSUw5WUhZVVdNbVlaT2l1Uk5KbVVpdkpmRVBDb2p0dDdZbkFx?=
 =?utf-8?B?OEM5cWZzWjM2MmRTREE4ZU9sMjJEK0c2NmlwSWNVVkVRODZ5MkNqeC9VcWE4?=
 =?utf-8?B?TEZxRGRQamppeVFJTks2SFF4S0VWZG1RbWt0bkt3MzY4UmlBMjdaSFZzWFVX?=
 =?utf-8?B?MnBVZi9FcTRFcm1FbVV0c2pJcER0TmJIUWV3VVlvN1dtSmlRYXZCdGQ4MkZO?=
 =?utf-8?B?RkRBK3JXNDQ0NkswQ2RlRSt1SkNoa0pCMHdaVjlPOTBIVmF0c1hzaWlKSFEr?=
 =?utf-8?B?ZFFvdGE3U0xjLyszVXJiWFVIWlZ4Q3RuUmRJWjhvZTJFSVp5eG5PZnFuOGhE?=
 =?utf-8?B?MG5wcTFhT2YwV0JqRUVweU9OSEJkT1VNNkMwejc2YnVrV21na2UvZHF4Vzkx?=
 =?utf-8?B?TnZIQ2FWeU1Qb0J3TjlPZnZsdnk1YWttNjduU205RnBsT1FTVHZFcmI4cUpL?=
 =?utf-8?B?NDlMUmFneS9QR1BwYzgwdVRjdUdYWkNOYm45NUNib25Qd25FYVVuZUZQblpn?=
 =?utf-8?B?Q1RSRElHTnhDdStKcm9sVVFPOGd5dDI0WmFqb1NQNSszbk5nZ21vZnBaK3NK?=
 =?utf-8?B?TVZuNnJ3cVRnVjloSFpYVkZodWgvOS9JSUswbHViZ2JRRWk0STRMdFVJTk8z?=
 =?utf-8?B?SzIxTE5MeTU5ckszbDBlZnU0THo1eVFtWUhrUkxGdUZMaWJjVGpTUTljSFBo?=
 =?utf-8?B?bGFrdy9RV3d4VXBLR1E2dnpMTWtJbFhIazB0cXVNU1M1K29OcmkwM3NiVWdi?=
 =?utf-8?B?cFpmRnFzVUZEcURlT2RvMjJveGlORjhaejAydmdqTTZaS2t1SngycDk5SDIz?=
 =?utf-8?B?a0VKY3pzMXIxdEhTSUdJME95bFNOYndXY2M2UllhYWwxU1YrUS9XejgzZndF?=
 =?utf-8?B?cUJSMzZYWTNKRzZiMmU5OU9IM25BejhZVUxtbmtpcFcrSE5NWGNQYUxKOVJy?=
 =?utf-8?B?MkdnRlhSR2ZiQW1sTnYzOTduOURzZFFvdjNuUmFSNFVBby80bFErMHcwcURv?=
 =?utf-8?B?dGg0RUswT2RDdFBWbG1qKzBGUzQyWHpHUDd6UjZ4OXZudytQTStzb1FMUGVQ?=
 =?utf-8?B?QkxvSnJUVFo4STNvRzc5T2FLOG5mNUhMTVVzRkVKL0w4b3QrZitlODVJcnpx?=
 =?utf-8?B?T0hJa1ZITVgzcjBHZzB6U29xeHdVNGNIYUxxOFA1dVBXRm9BMGhFazd3NXpV?=
 =?utf-8?B?SUxCd095SExDNDN0S2JHamZPem9zZGlYRitMajZqcld1cFZ5K0tOWjI0cmlE?=
 =?utf-8?B?WHdRZ3A1K2Ntd0o0N1dhbG16TVB0SXVtUXp6c1NEU2lmbG9yT0xBU2ZsYUdB?=
 =?utf-8?B?blpNZTdwckN4QndQS3hIL2hZRVVSdVl0TU44emoyWmNxS3Z0NUhMQ3Z6bjNy?=
 =?utf-8?Q?hnOs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB8283.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VUJSR1VoZkluOVBMTVFEcU04NWpvYzR2Wm4vV3ZxRmhFRVhZVnhzdUx4RURy?=
 =?utf-8?B?bU43U09EZU1hSTV5RmloZ01DRUdLSmRLVm1YamJOMVRKM0JLVVc0dUdnMUZT?=
 =?utf-8?B?QmRUZGVJSllsN3RVdVlmWFIzUGVqemg0V2QzU0t5bnp1eHgyL2x5Z1h6bFRH?=
 =?utf-8?B?TS9ZMzlkL25IUE9lVVRxQ1NkckxpdGhheE9jcFQxblNGdFFvZncxd0ZTblU4?=
 =?utf-8?B?WU9MV2U4Ryt4MGtldlVIV0c3THovZWQ1TzNPSGl3ZjNNc0JXOGx6VnRtZXRv?=
 =?utf-8?B?aXVqNjBQaE81TkZ3S3BJV1JXUFlZVnpsVEcwZzljaDBqRlJKK3RqWStMTlJl?=
 =?utf-8?B?K0lTV0U3VldpdlhXeVpoWjZBSnlQV2E2dlRaZEVCRVh5WUdBUncyUUxhUUxF?=
 =?utf-8?B?OUNLNUFPT2ZzeTcxUWw5SWp1U3RLSEZiT1NaM1V2Zzd1clVZcGJYNEpId21L?=
 =?utf-8?B?V3NIQy80dWhlOXY3MmdITGJHd1BXZHZmUElPcGdQU1BPRTRqVU1EbmRUalU3?=
 =?utf-8?B?UW1ldmQrQm9hWjVyRUk3RHA2RUVITUlWZmg3UXU2M3BrUFhzUGlqaW5sQVZU?=
 =?utf-8?B?Zk14T2pUTFFXZW94cjUyT0dVNE4xaWEwNGdpUDNGcHV4eVYzWFV6TXduYnZp?=
 =?utf-8?B?SlgxSVMvS1ZLYlh4Zkt2dVROVnZ1K0RrUDV0MEI0dC8wRS93SGVYaGpkVk5l?=
 =?utf-8?B?a2dkbUdTMkJpRWVHUkxwRkNzbWtGRnhZVW05ZSs0b0x1OTlieGZlWnVkemV0?=
 =?utf-8?B?YTR3UC8rVXN4dFNIK09YSUE2ZElYUFlucDhOQnBjSDZlS2ltTUVGbWRtWFcv?=
 =?utf-8?B?eWU5SDRXaUhPS3o0WlVDTEdmVFRCUkIzUW91YW9vZ3l2V0xCazRVb0VtWVRT?=
 =?utf-8?B?Q0t2NGVDdDZicVUzeld6dUlWc2QzRG1qb2pDSnBwZXZxRW5JYU9xTDdwemt6?=
 =?utf-8?B?RmN5NVNkZmgyRXBpa0RUa2oxd01XMS9BdVBXeHBlRlF3ZytxUXpFOTgxVWd6?=
 =?utf-8?B?MjRBaXozTGw2Sk9QNDdTNDhUT2lpZkQ0V0VhZDhSUjBicnpKc0VkU20rV09w?=
 =?utf-8?B?OWJYL0tKdUZtS0JSUXdvTGhJNk8yY2pEOWwxQVR4eC95RC9pTTNvdngrcGZk?=
 =?utf-8?B?R2R3VWU3eW1zMVl1SXN4VFVpZTk0dDd0NUMxMm11a2ppUWlFVW1zdTNmejVO?=
 =?utf-8?B?dTlVNkkxMzJObFh5R2NXQlBTUVpsRHpiWFJiQ3YyVVJ3VUNWcGdBai80VWFR?=
 =?utf-8?B?cU5TRjYySVFNdWw2bnpUa29XTE9ZbndQUXJqOG9JZDlRTlIvZmVpVDdNN1Qv?=
 =?utf-8?B?ampESGdLblhXd3NHT0RJYmh4bjhSZXFiS0E0SFdMVGw3ZDQvWUhVQTJISkRE?=
 =?utf-8?B?dDFCcjl1eVBaQytRU1Bsdk9LaHJhdHhhaERueldXZHZIcGVsTjJmbGx0UDQ2?=
 =?utf-8?B?UmU0b01RclRpbitMNndqdE9vcVc2NHNGMERmMUJTL1k5cnFqZ2hrWFNXS1hI?=
 =?utf-8?B?QnZzcGFuTk0xVlRyRUtNVmRQNDl6Ykw3TXdWQWUrR2dITjM5cCt3b2Zud3Y2?=
 =?utf-8?B?ajJabVQ5L3pJSjNqdFFHL0NrK2lxdFpZUHpVWEJyVmh0WEt0RmR4NWhVYkxY?=
 =?utf-8?B?dmNYMWY5WG84QmhPNW5UN2VlZjYxUktpT3NtYVlrZUNhUTZuZ2J2am1GMkdY?=
 =?utf-8?B?SXpOVUV5Q3FheGM5UVRrR3BlQjVnbnZ4dHQrakdpUFlwS3M1aDBCSXdMWlV4?=
 =?utf-8?B?dm54eTJRbk5aQkJLcXNYaGJReEZ4aDZMZzFNa0NFOXNNRWIzYnpYUVJCNmhR?=
 =?utf-8?B?anJHdXFUV2g5OTRCTUJxdXQvdXJQcE9SRzl2WjMxSytERUc2UlNKTDdPVmNR?=
 =?utf-8?B?STFqbS9MYkVsU3N3ZUhud1FoZExrVEFqYXkxeFBxMmc0NmU4Y0RUR1ZhdENy?=
 =?utf-8?B?elRwZVlIaUEzU0FJY1B0K05ITzJBS1Rsa25Oc2tTVWg1K21VZVVQSi9KQmtL?=
 =?utf-8?B?V3NwMGlVa0E0dFM4dHJRQlp1YkxINDk3aFh1UWV0Qmo3cnJzWFN1VkJBZWtq?=
 =?utf-8?B?dTN5MmFPbjFRZU5ZZnMwVUQxNllKZWlUdWZFc05uNE84S3FQbXNVWUVyYmRE?=
 =?utf-8?B?TjdHOVFvN3JlYlR4MUhEVHhFOU1NZVoxTkMzQ3dyeEo0TXdKMlg1VWMvNDFx?=
 =?utf-8?B?Y0RGdGRkM3BmREVmNFptb2RBanpkeWFDTTMxdGxBS1lzN0NicTNvOWRHbHM1?=
 =?utf-8?B?a2pUTU5VMmEva2RHeEVBby9zMVhZdFRCaXJQV2QyNzFSYzF4ZnZmdkRIMHBD?=
 =?utf-8?B?VGZoYjAxQ2ZZNCtkamptb2lKWHpvR3lPS0t0dWVzQzRKV3JnVVhwY1RNcXY3?=
 =?utf-8?Q?5S5ftMN0NyT292ys=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1094d3ac-7325-4f80-04fe-08de6fd928b4
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8283.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 17:06:01.7747
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kzz2WcIQbL0PmVfvbizv9qO7bHRIkVfRKYbjmiWC4yeYOTKGeXl2rFvzN35NOv4XRdGhAxyzC+wLVpacIBH6RXCkMxX7SDCuk7UMAUygztY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8453
X-OriginatorOrg: intel.com

On 2026-02-19 11:30 AM, Takashi Iwai wrote:
> On Thu, 19 Feb 2026 11:15:41 +0100,
> Cezary Rojewski wrote:

...

>> In regard to the "trace system", not a fan of adding a new "system"
>> just for the sake of a single event.
> 
> Why not?  We may extend the tracing of controls, too, and it'll make
> easier to enable all tracepoints relevant either for PCM or control.
> 
>> If we are going that route, I'd
>> rather reword "snd_pcm" to "snd" or something similar. From sound-core
>> perspective, I believe there should be 1 directory for the events
>> declared in sound/core. The event-names are prefixed already, further
>> division looks redundant.
> 
> That'll be messy under /sys/kernel/debug/tracing/events/*; it'll
> become snd/applptr, snd/hwptr, etc.  So, if we want to consolidate
> into a single directory, we need to put "pcm_" prefix again to each.
> 
> Or maybe better to use subdirectories "snd/pcm" and "snd/ctl" instead.

Well, I'm taking example from existing directories e.g.: 
trace/events/power or trace/events/sched. TBH, trace/event/asoc fits 
here too - all of them just group events together. sched_kthread_xxx are 
in the same bucket as sched_process_xxx (as are plenty of others). The 
'name' alone is enough of a filter. I believe that until one reaches 
certain number of event-types, there is no reason to dilute the hierarchy.

However, looking at the subject from a high-level perspective, I think 
it isn't in the scope of this patch - I can align to any suggested 
pattern and we can work on the details in a dedicated series.


Kind regards,
Czakre
