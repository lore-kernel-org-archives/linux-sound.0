Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC110222565
	for <linux-sound@vger.kernel.org>; Fri, 30 Jan 2026 15:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769785227; cv=fail; b=ACsJpH1Hxx/Fl8+npzpkau52BBHiD2R7AbPlG39//MPcNXSAbYOgubLIPrTr6Mq/DzSEl7wiGFpAm+sf5TgXKF7ILKw26SliYOaW5UpmgbZFN9VvMNwcgV0zHvb9aZifO9T48CrvZHANhEO1J/K+mCIr/UufSdEY9OoTY/hCrsI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769785227; c=relaxed/simple;
	bh=07IQeP+DOgfcjnx/Ba5OdqEf4bVZX/2YCG+KObBFPJY=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=t6Ndih6s8qZZPdKFvbt9/TpqO7TasOqieg3LYOMCS0+FT7ZvEJ6ZlU3unoCt7gTz2P1fpg3nymba3CyDEDndT3AxRMH2kYCxsk2cL7vYVaefBnI73rMIVtIzq/0cshWzhr9g70FfENF9Htj0A3YuFNjf0BlrtTfgCLIVg23Yp1c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W9DGcMfV; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W9DGcMfV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769785226; x=1801321226;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=07IQeP+DOgfcjnx/Ba5OdqEf4bVZX/2YCG+KObBFPJY=;
  b=W9DGcMfVzdwVqA4ddNDTgZt8yKdtw8QaJab/5PM5MmNj9Kv2jiPlHsd8
   0IToozLUR6ABrXujumoZyI8T1GaG75GGnKzSrJ6f5Cc12ZY0XimU1Yv5Q
   VuhJbJF6i1jk8abwrWrDfimB5h7gCOxj+sHglhejGT6on+xgcewRFn17D
   Kg/z9FeREdTrJBXLnskcGG+MP+dGlbwlfr45p1faOUYKscgCUcz3hLQdT
   ZkL7h3NUijxDBX4n1WMPXEEQM5trq7vPZTQEMSjFitLt4WEhRSYwTgVYQ
   2G3HQnZVB69LOpDJNGt/S0wgHgD337x7Sw7rWzCTI7n94TfSYrgdaGZVu
   A==;
X-CSE-ConnectionGUID: uHPxCBHASByL6rHR+opJjw==
X-CSE-MsgGUID: N2NiugNcTdersw0i0AVaNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="88609460"
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; 
   d="scan'208";a="88609460"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2026 07:00:23 -0800
X-CSE-ConnectionGUID: 5Ql8OPbGTtaMkHmAIOMSAQ==
X-CSE-MsgGUID: 1oiLWIr4S2uxNBi5XASMnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; 
   d="scan'208";a="208779772"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2026 07:00:22 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 30 Jan 2026 07:00:21 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 30 Jan 2026 07:00:21 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.9) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 30 Jan 2026 07:00:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FMSr9cDY8n+64NqOJynN85oTo+TWIn17Mtf1aEwEzfgWozWsXJEe2iVvD1EccTwlRWPilLLHr+92dMd+xK8hebOiCNYopcvYAwXDXoxS1aynWiB4MD/PvSjBwxo6hLbnv/KSy5G3mvGpE2eT4rj9yOW7Cdg8L1WA2gtSu3jy2FKBmCM8a0vrnvMV8pinZgo02gDFSqz3luQqoy4Ygh7EqACA/pCi3lVZ9I1yWSU+niuH9qkAJ7rNunwpHKL8z/XXgvvt6OYxkPQfJBz3gv84oRIdsLMzc/BR4QrSr3QlKsBbhgqH6y/qgQhcHw5P4m5zFtRlLKdjiKhM5LSUf8w5sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+8MpNt//qavRl0l1P2iQfE1g+hpDT+8X68t83jL9DhA=;
 b=fUv1iCv/l2KbmfsL6gcz/3PamXszozAv2HQIvc5KOML3SxtBxikkFJORWRnCLn48jS17qYnzPB36ggE7bUf4PrDWobgVHCIByp7fCuM0UrJqFt73UuSSqUiLuSSdw0s8suTYhbg0UTsWlV6J1Fi4OZpUzvOTnPAyQs+dGh+hiHQFo748lSSndtKSa/nR3FFiH0nAKrJ93W2WcS1vofESm6XB7VWtYPcMaxH1Km4V7GcCDNHuRfik0mcq5Oids/yeEkbc7uUAWyq9Idts3NuWaCVVhmXnEQGGNRB1x+5cdGGZU75U9jE+c2YswHNpopSlOqw4lwedN6l7TSj7LOb/9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8283.namprd11.prod.outlook.com (2603:10b6:806:26c::16)
 by IA1PR11MB6172.namprd11.prod.outlook.com (2603:10b6:208:3e8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Fri, 30 Jan
 2026 15:00:16 +0000
Received: from SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::d18f:6b38:584a:214]) by SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::d18f:6b38:584a:214%4]) with mapi id 15.20.9564.006; Fri, 30 Jan 2026
 15:00:16 +0000
Message-ID: <2d5852c1-f754-4b5a-8a01-962a4ba14b68@intel.com>
Date: Fri, 30 Jan 2026 16:00:10 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ALSA: control: Verify put() result when in debug mode
To: Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>
CC: <tiwai@suse.com>, <perex@perex.cz>, <amade@asmblr.net>,
	<kuninori.morimoto.gx@renesas.com>, <linux-sound@vger.kernel.org>
References: <20260130135541.115574-1-cezary.rojewski@intel.com>
 <60f477d0-ea1f-435a-bd8c-4e7e06a1802b@sirena.org.uk>
 <87ikcjxjgr.wl-tiwai@suse.de>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <87ikcjxjgr.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VE1PR03CA0003.eurprd03.prod.outlook.com
 (2603:10a6:802:a0::15) To SN7PR11MB8283.namprd11.prod.outlook.com
 (2603:10b6:806:26c::16)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8283:EE_|IA1PR11MB6172:EE_
X-MS-Office365-Filtering-Correlation-Id: 7688ec9f-6fc0-47bd-0834-08de601046fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Rjh6UWk4eEpwZG05bUNXSXNYcVN1YlNhR09IQ3podU93VXVseGpVY1IxTjhW?=
 =?utf-8?B?Njg3NWIvak5rWGNZTkgyWGNBTjVVUU1lVWxyZjM1Ync1eUJkK2NaRytkU1lk?=
 =?utf-8?B?c3JJTE9sdzBQaWZLaXVmU1ZLNXVBMGxGZzZnYjZRb2JyNm83MXhTaHh6ckVZ?=
 =?utf-8?B?R3FPNlpVanlydUJmRlNHZ1haS0RzVG9SQjM3VDNqUVVXcjN5S1BGUlEyMUlO?=
 =?utf-8?B?NGFIc2Rxa3Ava05FWHZhNWV0Ymo0Z2JoQ251aVR1ZVI5RnkrTXFhUU1yYVQ3?=
 =?utf-8?B?cEE2U3NhZ1VCd2dObmprUGpZelNGZGV3eFl5aTNmb2x0ZDZTdTEveW5tOENt?=
 =?utf-8?B?cVpKRHFNMGtYRHhPcUFlaE5uQUZ2UDg5Z1dFbVdrWVNEWXY0bHhlZVR4NlNM?=
 =?utf-8?B?N0xMVVh1RDRQK2ZoeWFGUXBENFFVcDJCV1Z1b1hzb3hzNjFCQ3ZyZXJkZnhN?=
 =?utf-8?B?VWo1S0xCVFF3VDZNYUk3em1Va1oxR29KcUwvQUkwS0tmTytDQWlsTTdLK0Uy?=
 =?utf-8?B?OExoZjlwaVlMWkVEWk03V08yTjR2R3V4RzV3bXpZUzExUC9HR0NzZm5VY1Ji?=
 =?utf-8?B?WlZwejIraG1RWlAyR1lLaGNGTnpTQXNkTVJEai9WUHpyU1BlRktXT0ltdi90?=
 =?utf-8?B?QkhIYk5Rdlo1UU01YzU5Q0ZlaWg4QUFVQTlEUXg4ZGZ6NjVEd3NNaGZkRjFl?=
 =?utf-8?B?OEZhT1ZLYmhlNzZITG56UWpwaWVHOGx6Z3dTNUsyL3NSejJPMnpDL01rOXZN?=
 =?utf-8?B?MThJeVVoYy80eVlKTlllam53a0gvM0d4VTNtcFIvUlB0MDQzUnZxOVhiR1Fo?=
 =?utf-8?B?U1hvSys2M3hkZTRxYkw3T29kSG5YeUlqa2R4VWFFVG53K0N4R0hNNERiT0Rm?=
 =?utf-8?B?N0E3a2ZDZkZNeUpmQ0FWQnV2dU5RYUwvcHpmbWk5WEJaYjBON0FiSnAzOFJC?=
 =?utf-8?B?cUxiMU9MYlM1RUZCV0ltT1VCMXB3Wm5yZlF4Q3lvdHNpb2RzSWZKS2dHMkhp?=
 =?utf-8?B?S2JnT3JwL01Md3hnaW1mYUFQUWpRSTg4QXg4bWV1ZnRON3lSeG9XdXVzcmQ3?=
 =?utf-8?B?d0VRNGozRGMwZ3hTbHJlY0ViTXMzMlNxN1RrWGhPK0ZOQmFrZUVFV044U3ky?=
 =?utf-8?B?bWtFa2xRYUdEazRMUHN5L1NsNTY1UFAwL1JEVnA1SnlJU3RzdW5aek1nLzgv?=
 =?utf-8?B?TkV5YWV2MnQ3SUhPM1h3SEdvT3JVZ2x4bEZIUHZ6UUozVmlJYjYwb2JPOTJ3?=
 =?utf-8?B?SlcxSHk4OExQOEhoSUl2dkNsQ1JzaEd2MG5GZVRKRWVzdi9sQk5BRzNxb0to?=
 =?utf-8?B?SzVnSzJ2R0pkaEtCQ1F6bmp1MEhtRVB1bDcwUEZuQTJ5eFB2cG5nV0Jxc2Fy?=
 =?utf-8?B?NUREM1dhTjZ3bnU1Tm04d2VTTEZCRElUVGhTL2FqTDh6YnNUb2pnQUdDYStI?=
 =?utf-8?B?Y0RtTWhETWpFRGtQS2hrLzlIeHB1RnZHdlVWOStHSnhVS1YranVSL213VW5C?=
 =?utf-8?B?N1pwUERvNlprd3FnSTRJSFUzcldhc0FDZ1BQeDFpNXFhbmFTOEx3WW5jNHEw?=
 =?utf-8?B?cFRqYjJzY3lielBaYXRaL2RKTmxEV3pwdWFNR29mcE1aVG82ekk1K2JWYS9I?=
 =?utf-8?B?d1dNUDdOMEIvbUVXRVdSOHpKWjVZSjg3dUNxYVV2MmMxUDVwR2RYWlE3dzRE?=
 =?utf-8?B?SGxuM2x1UGtyZEh2akIyN2psUjg4ZEhjM1orcWtDOTVRU2JWM0dxdkJURjh0?=
 =?utf-8?B?ZnFWaERSd3U1NzlHRTBCaTlGYmd1VllnL2ROVWs4YXo5bThheTM2SVpoMDdy?=
 =?utf-8?B?ejN5dlRrcGNQS3cvcXRvdVoxYnM0ZmoyU3o2VlJaOXJkOVAzbWlESnYycXFV?=
 =?utf-8?B?WFNJUXNlWXNYSkdjZ2ZUQlZDWmF3RUU4OS8zMVk5RVRPaUwvbDBVUnJVZDdZ?=
 =?utf-8?B?SG5Dak4xdWlNRWFyZW91clg0Rk1GRXQ0OVR6RGpGT3RsMG1rMDdRaHRvN0ov?=
 =?utf-8?B?cFZuK1Yxb296UlYwcWcvK0pJQjI0bDBRS0RSS3FKVFJ3UGZXZVRFY0R4V3hk?=
 =?utf-8?B?TkhhbG9rd2dJTS9pbDIxd2dYS2dDN2R6Zit0aVovY3lwWEZNOGR1RjZXbmt4?=
 =?utf-8?Q?rCTE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB8283.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OEVYQ0JtS2ZrR0E4L2JjYVNjY2Nia3ZpOE03OFplSE9iSFlQWGRmT0RMWnlx?=
 =?utf-8?B?UWp0ZWMwZFIzRnVVZnl5UHF1YXBpWHJJMDJua3dEKzJDSnk3dVhQY2llNVAx?=
 =?utf-8?B?Q0EzS2RQdnlqQnJ2R25FYS9UTXJoOCtXbnkwV2g1L0lTSUoyeUZDblFuZmlD?=
 =?utf-8?B?T2FwRUVrcVNyN3JyWnlpeG9aZi9DSUM0MitxMTlHb1pZcHcyQzlQRXN2dzFP?=
 =?utf-8?B?WHFIdlIxRmFjbkxydWJldGlsRTdtMkVIbW9IRVk3Vm11YUNhNTE0R1FyU09x?=
 =?utf-8?B?OEtrcllyQm1GbFlwRHpISHdZUzBRN2tObnhQQURrQVpiNzA0c3NxeUhJTHgv?=
 =?utf-8?B?cUZvUGM3Q1cyTU5rYzFvenQ1ZXVCUHh3ZUIwVzBQQlZUWHQvSHRnVlkvZVYz?=
 =?utf-8?B?RFNLdGMzcjdCaWt4RVBva1E4V0ZmSFZFc0trcTMwMjBtZ2Z3aWkwdFEvejg1?=
 =?utf-8?B?UVJ2OUdyOERMYW8wL21ZejhNby9lcVY3WjdsaXF1eUx2Q3MxU2cxcE1GYU9H?=
 =?utf-8?B?V0lNZjdVaGYzckN0Rms3L1VKSW1xRmRhak8vQ0RLanAvRi9ORDhob2xDNkcw?=
 =?utf-8?B?VDVUNmFaSzd1UEErYjhTN1h2UmpXS3YyNm44YzI3Rm9lbkErYS9KbjVPN0FW?=
 =?utf-8?B?R3E4S1ZIVEE0cVg0SFRyM3BvVElVYk4wb3JVYzhxS0dDOUNsOG81YXhFaVlT?=
 =?utf-8?B?RUIwMWt3R2lLMk1SVllEODA2KzR1aGwwOERtNnU5bStFeHJsRnFGbWdlSFJM?=
 =?utf-8?B?cVlabXd6bzI3bVZGOGMraUs1R0ZUV0ZaSlB0T2RsUjRGeTRvZ1FsUE0rRDNK?=
 =?utf-8?B?eTduRmJwclFRNDltZnptdyswZ1pPTFBKR1FweXJyUzIrcjJLZGlvN2dSL1c5?=
 =?utf-8?B?TlZ5MzZQLy9DbmZxcFhQVC8zVXBoeTV0TUxBeHJCd3ZtNXgrVnQzNnlqWXpl?=
 =?utf-8?B?R1VpMVZmczFoWThTODJ5S2FnZHZoZHdYS3Jia2YzdzBBRmhtMVNvT21vSGlx?=
 =?utf-8?B?UHBUTHkzY0Z4Q3FWMEEzbjV2TkMzdytOMHB6YkdGenhjQm0wOG5HNjVnZStI?=
 =?utf-8?B?RytvN09IM0x6YnRNQXBkUUJpUDRjZE9UTGVUdHJBNUZpZyt4eEpqNHhOeUtm?=
 =?utf-8?B?dmNuYTZPK3V5UE1NSXFLc2laWTk2NVdtcjlnZDBrSzdJYWsrdWJWUm5CSzVZ?=
 =?utf-8?B?c3E0TjdzbjRCYXVGNVVpU2hLbERFMGRZbUYvR0ZiRkEvR3JPa0ZHbzdacmpR?=
 =?utf-8?B?Vk5wZjQ1ZWQzdWVwYVJiU2ppeSt3T3F2L25EMUhjM0xiRVcybmlYTWNrY0Vn?=
 =?utf-8?B?SFRRRWpIalByNW1tTVNUL3orVWY4N0JYaVFCc3AwL3VMTFJVMkQza0NEUFJt?=
 =?utf-8?B?NXBJck1xWGE2U2k4U1NjQlFkUXJ4NlQ4QWpFM0kwdmhPY3ZJazIwS0wzZXc2?=
 =?utf-8?B?citmTmhhbVB1L056bnFWZEFQc2RoUVpOM0orYXh3M29SSXhBaE05cG92YTMx?=
 =?utf-8?B?YkFqcm5xTTMxTUJjYWw5Q1BkYk1SQTBXSVQ3ajh2elEzeE9Sdkl1SkVGZjVw?=
 =?utf-8?B?MFRMMDdORGpoUTNHb3MvLytpWTlnT05zK0x0b1A1ZnZrajhINWd1NWpVSkhP?=
 =?utf-8?B?bGpPN3pWOGJ1dzhwVjZhUHB5dGVTZm4rOUl2anVROTlOYU94a3VibFNOdlVM?=
 =?utf-8?B?MUxFZHFFRmg2emt4RXhOeVAvY3Z2aTBTejhReU85YXhqYWtreFVFNzRaMnhP?=
 =?utf-8?B?MnV2M2tmTUI3U2JOUTR1NldRZ1NTM1NMWFpIVmNYeUgvV0djQVd5aUtoc3VU?=
 =?utf-8?B?NG1kZXVsOXA5WFB1aXVrU0VIcTRHMm1hK29KSW9VU1RYNUhiTks5dUpZYXZ0?=
 =?utf-8?B?RXVITy9CQmpIOUdUQTFpMTc4QnVBUE9abXZJRURpOUlvUU1FTncvVUZBc3dM?=
 =?utf-8?B?QXVUUHExbmxZeGVlanh3ZU1US09VMUE4c3VGS1ViNWlqdElDT1B3bXNuQ1Q0?=
 =?utf-8?B?d09USjJMOXhYcDBlSUFVRkp3bFJtWlFGTUlVK3hnVVpIRTVMbW9Qb2xNTDhm?=
 =?utf-8?B?clpEeVBJT0VlMlUxNDVKLzJqd0FQenorZ1hsaEZIelJTOW1iSkpqYlNaTzQ0?=
 =?utf-8?B?WjhzWmkvWndMdUNWQlFpQWlUMG93KzA3QXdtRE1SdnVLQVpXNHNvNWN5Mk9j?=
 =?utf-8?B?VE9wY3ZaVDhMR2UyMU9JZm5hNTRPVHJvYi9JV2EwSUFUaFM4T1gvSkNDcXU1?=
 =?utf-8?B?SEtsTit0eS9oWXlIVVN2cWh5dXZLTG8vQXVIK1B2RURsbGRkcFViaEtKZGNE?=
 =?utf-8?B?VzVXNnNQVFR6bXl2VlJNNE5nN3lCMlF4V2VPUkpQTXl5ZXhxYXdUZmh5TWpl?=
 =?utf-8?Q?s6x8P+rFZFFWmhbw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7688ec9f-6fc0-47bd-0834-08de601046fe
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8283.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 15:00:16.4295
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ovX+JI9Ok1utufo9gUkUVz6bXnvKIX82+oFekFd0s9d+prdaLmXpVoc++l7TTYjIywN2ddLqQh4aNA9YQoJUQMTrtW7w5T8GTSktceK84nA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6172
X-OriginatorOrg: intel.com

On 2026-01-30 3:29 PM, Takashi Iwai wrote:
> On Fri, 30 Jan 2026 15:12:58 +0100,
> Mark Brown wrote:
>>> +	struct snd_ctl_elem_value original;
>>
>>> +	ret = kctl->get(kctl, &original);
>>> +	if (ret)
>>> +		return ret;
>>
>>> +	retcmp = memcmp(&original.value.bytes.data[0], &control->value.bytes.data[0],
>>> +			sizeof(original.value.bytes.data[0]));
>>> +	if (retcmp)
>>> +		retcmp = 1;
>>
>> original was just allocated from the stack so who knows what values it
>> had originally, and the get() is only going to write the part of the
>> value that has data since the normal get() path has a memset() in the
>> core.  Similarly with the new value coming in from userspace there's no
>> requirement for userspace to set anything that isn't part of the value
>> being written to any particular value.  This means we're liable to get
>> spurious mismatches.
> 
> Yes, and if I understand correctly, the above memcmpy() just compare
> the single byte from original and the result?  Then it'll lead to
> false-positive outputs.
> 
> We'll need to query the control info and check the relevant values
> for each info->type and count.

Wouldn't memset(0) as a preparation-step solve the issue? That is, each 
element - instance of struct snd_ctl_elem_value - has up to 512 bytes of 
data, regardless of type. Not seeing usefulness of ->info() here. 
Perhaps I'm missing something.

> 
> Also, better to name it snd_ctl_put_verify() instead of
> snd_ctl_write_verify(); it's an equivalent with snd_ctl_put() having
> an additional verification.

Guess the idea for the name is that the operation focuses solely on 
kctl->put(), not the "write" as a whole? Sounds good, will do in v2.
