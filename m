Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FCE82C15B4
	for <linux-sound@vger.kernel.org>; Mon, 27 Oct 2025 14:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761576194; cv=fail; b=S5G+sCmBDrmIpL3BV2yNU2TrSTovVcvv3YT5jMOiDY0XM9bT1ADmXkfjnyq9bBlewNDNjQIoedOjDVwqdrN9Yj2oDN+VhPALhxq5yZdJcEUDWacguaw5+pQcmDtc1Q0xwnuNGnpXpOHPPwpE/GqzzmgaB90M8mZqw8zaotWkheg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761576194; c=relaxed/simple;
	bh=AdkVCGJ4BKW4DkNmPHhKmKlEMMYdGl7tghaUjJqLMDc=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=pAcG5GJLPEoohrZfJxPbZtKXsIQth6xdSR+eZjaMbONVQGYcRiWcouPluePY+wRfBgq30Too/ECOcM5iYgTh6kfMuzbiyurDLozctit6kWUSnbl/KSjkheMDnbaPZLzyTuIe9yXomYgeaq5Dc+DHALbZukya4RL92S5PQ6uBOjo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k2ubrSAk; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k2ubrSAk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761576193; x=1793112193;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=AdkVCGJ4BKW4DkNmPHhKmKlEMMYdGl7tghaUjJqLMDc=;
  b=k2ubrSAkC4Yl9zbabpQPjB06n9HbPqJrwCuOQN/NdjjSfmlBGgvImo+J
   jUpany9hFATE6xr1JSpwnBGaWOdN87SMu0xnNg/ntTpMNHnKEJRtxvJH0
   3fCfcCBI1ApZ0cy1Vu4zyhVMSssEI9Rv+pMOXxgalr0ycJjU4QnmN2fE5
   yeexlxb4xBSgkF9dmbIqrBy/2vvNYnsoc1IN/7VHIouaJAlPnhjevULo2
   bB0i09K4kQP55hAB/oQCyEQU42TD3ICOp8RCyh1yRHNVVOH0CUc6zD/RA
   y2KiMVGdF0mn7yztFitn7ZKqggK42sXvJRfTk3wO665+Y3L/JGcHuVBRi
   g==;
X-CSE-ConnectionGUID: o/LGZSeeQ76ZJyfOHIW+qQ==
X-CSE-MsgGUID: WlAqoLpHSLmztdr/gs/QDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="67299867"
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; 
   d="scan'208";a="67299867"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 07:43:11 -0700
X-CSE-ConnectionGUID: +JNj/S9rQlSmIAka/FhU6w==
X-CSE-MsgGUID: A/rMIXLZSCyXbmpBT8lsSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; 
   d="scan'208";a="184757566"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 07:43:11 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 07:43:10 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 27 Oct 2025 07:43:10 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.41) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 07:43:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kPDzNncnG5sORYIHYT6TlcnyVHnPk9tIY2eRmeaxKfInAgtLtA4PvOcILI5BZXYxO0IT9jKf/cxzpZN0QPf9TsMwz46KPtvCrvuawy+7z6R8Rsb+Ww3GBus0QQfci3Vrb/fbRLvercCDi1qb7x43FWh37rf6JmV3TwkbCRC7xngfpF4Bu/2SUv49uaXPDSusl1O0qZpiGTfD5FE5+OBXwN866w86WIc2Ja31zUx5SueVJq2J3NnGqpHNQJfPo3oKL2NjTO9d1kto1h6fIVASvTjChyGK4syH0E7tSro5JdngLf5c8OLz85tK4fcl7EHzOccA97b2cmuMJp/A4e3pzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uj9TBEToO2Ny0QQ2A/KqqtxebhvidGtSil+9ZZRk8PU=;
 b=rhMQ3SFfkdoGvzh6qib5Bbk76QiONKP6vVEDeb/XAFgtk4bhn7JZddRwp7+NCNa+kcLn9KmPXFxeJ8LCmztiDOUO8IEUbfGUWQwNERhhmp5PSZQZgkAi57SY3AVIDiRlrVzW8rUM8017s4yjt31ghb+Y/3RWn5v5zqJtrb78+tGIaTKlo4Af+WjfDPV3C/Qve77aJ0sia2mkdTUydO13xN0WojNXfpmZRv1vaRRaPtgKX5cQHQdbn0G/hpvmYWkqV2hJYJDWt9yZowlrHVO+IVB5eNB7068A2adZskCnCMWMo7R41WEqIhRA4g8+MIv3xMiWspRE1JAOP8eryYCAOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8283.namprd11.prod.outlook.com (2603:10b6:806:26c::16)
 by CY5PR11MB6091.namprd11.prod.outlook.com (2603:10b6:930:2d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.17; Mon, 27 Oct
 2025 14:43:07 +0000
Received: from SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::3:e0a:87af:d4b6]) by SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::3:e0a:87af:d4b6%6]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 14:43:07 +0000
Message-ID: <dd089b21-571c-41e2-bcea-d666ee7af882@intel.com>
Date: Mon, 27 Oct 2025 15:43:01 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] ASoC: Intel: avs: Set of streaming fixes
To: Mark Brown <broonie@kernel.org>
CC: <tiwai@suse.com>, <perex@perex.cz>, <amadeusz.slawinski@gmail.com>,
	<linux-sound@vger.kernel.org>
References: <20251027110106.3157415-1-cezary.rojewski@intel.com>
 <37a7a6a1-6180-489d-9309-2d576822b4e2@sirena.org.uk>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <37a7a6a1-6180-489d-9309-2d576822b4e2@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR04CA0132.eurprd04.prod.outlook.com
 (2603:10a6:803:f0::30) To SN7PR11MB8283.namprd11.prod.outlook.com
 (2603:10b6:806:26c::16)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8283:EE_|CY5PR11MB6091:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a69997a-d094-49e2-8d8b-08de15672474
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QU0rb3FyMy94ZlBucStQWmtSUnMxcWhUdmhIdnpzUkZ4aFJ5V2h6Rk1XVkpW?=
 =?utf-8?B?dkE0WWdRdzg4U2NzNUJaT2svZ2pwUnBGRjR0UTVXZDJ1cWVjcUZkQkFWRUlQ?=
 =?utf-8?B?Z1VaYjAwRUNscjZQK2RsNGFYSmYvYWJFYkR5ckRReDJtZks1NmExaXJaNkxn?=
 =?utf-8?B?eDBzSUcxZWNWc0grYXRRL0lxQmRWc0JHUU5CUFV1TDJRMW5ZTXg0Q0xvMFM0?=
 =?utf-8?B?bWZtVU9aMVB1K0ZDUGZMTW5xNHpEM2JHbFZYT0E0SkhPMEgrcFgxQm1raWZR?=
 =?utf-8?B?RzJXdFc0MEZ5a0VxQys2MDJRMTNRSVhFeFJtSVlIcUcvYmdySm05amU2eFo1?=
 =?utf-8?B?NHdsbVBsV21ybDBzc2prMEFIQjFHcmpoNnRKK3FkaUlabjNERGVIemZsMEt3?=
 =?utf-8?B?RmhCeVdmV3ArL0VabTJNNlVMU1ZHSVJCR2tibjZsOXVzdnROYWVUaVpYdjBp?=
 =?utf-8?B?eGJtSVNMSzkyd2NTM255TUNIRUVMNzROa1BYTnI0Z0dyajJmUUV4eit0Mmtr?=
 =?utf-8?B?bHhjMDR5QmVKWEZsMjZmUDVlaE9oa2NHSVZmc0k0Y3dMNk9KZElLQ0FLVzlC?=
 =?utf-8?B?TnpPdVBnSXdDOGordGdHNDJBenFjeXRlL0Fyc0hReUtlemM4eUVvUkV3OG43?=
 =?utf-8?B?N1RrRlBqTzdZN09hZFQxc1RqVEVpZWJXM3Y2ZkFWMHU5bWJ0Y2h2ZWY2eFVD?=
 =?utf-8?B?a0UwTFZzMzVEMklQTElNT3BXcjVjaTZlY29YYVUvNW9uVkZScXR0OVJrSnZi?=
 =?utf-8?B?UkFEMS9nMWdSNnVtcUVoT1BWM2dUcytCK2psOGpybTMwWmJkWGdFYXFIR0lY?=
 =?utf-8?B?eXNKdDFuRk1YMERwSE1RSC82NUErZUgxNm4vbTRqR3liSVZPYU5KRGtjemda?=
 =?utf-8?B?K3k1ZTJGeXBGRS85SFdZdlBxSFZ5c2hZMitrSzdCT0dxUlNEd2JkSHo3U2tn?=
 =?utf-8?B?QVRJMkhqMFI3ajBwZ3diVCtKS1RqT2FiYUxKeDJ3dmVrN0FVL2ViYmFhbnhD?=
 =?utf-8?B?OTF5SEVoRzVhTVhpa3p4MDFnb0ZDQVAzdUgrT3pUZmd6TS84QkZEZllkOERU?=
 =?utf-8?B?TUxlRjkwelNBWlh3Q2x0TVR1NVp4eStQQUI1YU00YmF5NWhBSVlrcUZDUmhQ?=
 =?utf-8?B?QTFoMVlId2d0VDNOVXV2b1ZqOG9tN29YcDZLRUNpV2Z0WEROdVFDZy9XV2Js?=
 =?utf-8?B?YjYzKzNwV29JaHUzY1dGNmlwRUg2MkdGbm5jVHBNZUlXYXhQK292OGpDY2pV?=
 =?utf-8?B?bXQ1QWF0R2tJTHJkSUUyUndZVkZydk5oMTduNDZ4OUFlamV5TkhXZFIxSTlr?=
 =?utf-8?B?WUR3bFJIYWFSY3F4Sko3RFJVVDdJQkF4aE41TUNlT1FpMUpwbE1Rb1dBaEpQ?=
 =?utf-8?B?b0JvNCtiSG52RmxoV3pCTHFKNElMK3JiU2drM3YrV3RBNzA2dWhPM1dWaEJl?=
 =?utf-8?B?Y1hUTW1wcEJEVUh0VEhsa3lPdjZ2eVNUcDJ2Q0NFaXV3N1pwMThtRCtJakVH?=
 =?utf-8?B?OWRtTWcwTEJ4ZDdlNit0eUZrRXZQaCsxWG9BSzl2bTJVdEF4WWlZdVpmY0lG?=
 =?utf-8?B?THZ2Z1pZdlBoZFRLT205RElwUWFQRXVQdDVMU200YXY1aWNJYWlWVklQZCtp?=
 =?utf-8?B?cTZVbHp5KzhzektMRVplQ0dka3ppQ084YW14T0kvZ09XYy9JUlp5UjM1bFNa?=
 =?utf-8?B?WEM3VjI2Y1FPb3M0SDZDLy94aWd3cTF5WVhCeHk0RDNNRTlsbit1RWRKZlA2?=
 =?utf-8?B?UUFPMmY1NjdqTTROdDFYeHM5a3BzM0M3N3daTlUxVm1SdEtwbUxweUhQM2pm?=
 =?utf-8?B?bzNwZTBXSklCRmliNkEwczRzb0xobzd4cjFycWNOTzIxQ09meXRLWThZZW5Z?=
 =?utf-8?B?dlp4ck5QN0I3RmFEdkhtcW1kNXE4dnFvaWsxT3hrUEUybkxPYzYvK0RVRXdk?=
 =?utf-8?Q?Pbn5aAwazZm/+2S69lJMPcktzMMLE7xw?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB8283.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Qk92Uk9rU2tXWnQyckFTLy9QMGl1R0pHZG03c3ZBcE4rSDBpMWpUMXpPM0JW?=
 =?utf-8?B?YlBMTUJ6dDZMZ0tNN2Fhc0VPeVR6KytuL2xKRjAyRU1qVDlwVGpaRW1MbzlC?=
 =?utf-8?B?dVQ2K3l3cE0xTDBCQ21PRlNxTng1dDVHekdYVzNFbEw2ZVhjQUpsR0ErcHFP?=
 =?utf-8?B?Y3YyK1ZGdnFLY2d5UThlR2ZkT3FqRnFCYytIZEVhcEpQTU5jL0xlclByampE?=
 =?utf-8?B?WmttTnNSYTczSFdaZE9xdlJBV1J4STN5SzlHNng1dUd0cm05aC9vWEJHWHl0?=
 =?utf-8?B?WWtGS1lNY3Vmb0hPbjAwTzlDUWYzdWFzeE56T1YwNUZVc1c1ckl0SUxxZFJB?=
 =?utf-8?B?RHFkWk1zOWFBaWJBUEFNWE9NU3ZVK05qdUlWS2JRMVVrZWtDVVJUWFVITWcw?=
 =?utf-8?B?emNyUCtyVWtlNS9qdFlkSjVRWDlBMmJYMUloOXg5a3hNSFZCSzgzMnRhaUtT?=
 =?utf-8?B?b1R2aGlmb21DWmUxZlZVK20rcjNGUnlYZS9Ea3F5SzZFaDQ3VW1oWFp3UE12?=
 =?utf-8?B?SEVnVEFCbWNCK3Nxdks0QVY4eWdacEhlNi9mbkl2d0xJVHQzZHc5YUNlMnp1?=
 =?utf-8?B?MXJzRkFhUW5wNC9Gend2bkZZaTl1WEkwODhybktCam5oY3RtTUoyZEpRcWxh?=
 =?utf-8?B?d0FLMEo3Y0hwbmNFNzhUR2JYeklHYnJwcXlQdmFVdFBLLzdIdkR5TkxyNExD?=
 =?utf-8?B?N1ZlZjVlUHJoTE13UGRwQlUvTEFjUElCekcyclY2bXRZMmdRdWtaTElZUEFs?=
 =?utf-8?B?QzM1SFZsM0EyQm00SmN4NnBDcjRMU3c1ZFNNQ2dUQ1FvYUluekcwalR3NWI1?=
 =?utf-8?B?VzR6djVDb3pJUUt1bjNkUWVncjVUTE00YTZZb0gvbHl2UlQ5K3QxTmZUL1N2?=
 =?utf-8?B?UThqUFdWZDRTSTZzN1E2ZFFpc0ZtZkFLc1c5SThOSkduOUVIVGVJdURsMGZq?=
 =?utf-8?B?aGFZenhIemlIV1NKaTUvWU5MUzVJS2MvNTczTG1jK1JCNmxUekNlclZFUkxS?=
 =?utf-8?B?eGlacjRRUitzTG14SXlHOWVWOUVVMDkxU2srbUwvTWtLZVFtSmdmaEN6SHd0?=
 =?utf-8?B?RlprUUZHak5EdTFWWWxmYVZnaTdjWFBsclNjSDZJemlOeEZoVWxpSFhVTmlC?=
 =?utf-8?B?S0RONHpHdVpZTHFWZkg0WkFweHArbHZhcEVCN050ZUJBQ3hZUXB1V3YwUVht?=
 =?utf-8?B?a3RIQ3AwUzBqQ1JxSjFsZXFWOUZpWDBsU2JXeHhKUWw2NHQ3RnRsK1J6T3ZL?=
 =?utf-8?B?NW1YSmN4SWEyb1lBV0UrWndLSVBWcHRCdUJJOWdFdzhRVktxcnlqMFFPTlVy?=
 =?utf-8?B?dXUxMDFBcGwwT0RlTjZsYyt5N0ZndlVNSTZUWGZBWTI4M1gyNHZyMmMvb1d5?=
 =?utf-8?B?RmxUQjFDVGNYRThHZU54RGUzQ1NSejR1QW5DYk5NQUtmNnRFaEFBaWhoZG5U?=
 =?utf-8?B?MXZHdTJIK1piMkRFK05KbWZPaWJ2ai9rQk9EWEJFWmpVbms2SVNBeHJNT2R1?=
 =?utf-8?B?MVVwNnhtdmhKU3hFWGFSaXlBZ3publlnQmh5ZUdFNGQrSzkwMzRrWDNRallr?=
 =?utf-8?B?bDVXbkN1SUN2dUwwTWhpK1MwTi90K0Y5Q1pFYTFtQWg5RmJ2bHJ4TWgzUjhH?=
 =?utf-8?B?c0UyQW11MVd5UGhEUzA4WHFqNjFGTU9pN3NPK2crNlpvdGFMa2g3aGtXUTg3?=
 =?utf-8?B?ZDFvMFBvSkNJOC9EQVBxUlVLa3U1U25DR0t5ZFMrNTB1aEV6OTlFcWtNVFds?=
 =?utf-8?B?d2wxVkd6ZUlsbmFRTE01QlpJT2pObkMzZHlXYmlMUWNwZmZSeWhuTUxqay93?=
 =?utf-8?B?K0hKRWpDU0xGNlZlVzRzeDBjNGdJdkhRU3AvUVZiU2RCTG1WR2JMdGZmUnhG?=
 =?utf-8?B?VFE3ZlFDNy9nVFo5d0tOSVZ5MkVZODJvQURseU9tVHpYWit1Z2JsTGpXRHgw?=
 =?utf-8?B?NUwrUFY4ZW5kMkRjcmlZcHlTWXZGKzgvL0F3V3o4bHhibWd4a2Y3QjlzTDI4?=
 =?utf-8?B?bXE2cE80cW42Mm00ODRUdC9LUWZKd3pobUg0TEZmYmhmT2M3SGxhbTlmdnFV?=
 =?utf-8?B?eU1SaXhLN01kVUtRUkhVMzNzQ2g1OVNrSW9mVEY5OWwrc21TT3N4TGM1RHhR?=
 =?utf-8?B?N3o5NnVFa1BobmxsZjNoRWdGNTQ0YUtteHBIbjgwWTMvWjRGYnlxMDhxam1D?=
 =?utf-8?B?OXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a69997a-d094-49e2-8d8b-08de15672474
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8283.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 14:43:07.4611
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YdwCJCL85DYiIm1AXSZeEhH/BFYmSEdfnT0+wPdA+DQNTaZFS01uhClq4AI/DlAzoMFWCAaxYHmliDGia+OkNxx1JJ0lKVTJITH8MO7CUd8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6091
X-OriginatorOrg: intel.com

On 2025-10-27 1:44 PM, Mark Brown wrote:
> On Mon, Oct 27, 2025 at 12:01:03PM +0100, Cezary Rojewski wrote:
>> Small set of patches two of which fix problems observed during shutdown
>> and XRUN scenarios for PCM streaming. These ensure HDAudio HOST stream
>> is reset and re-setup during XRUNs and synchronize avs_dai_fe_shutdown()
>> and period-elapsed work (thread) so that no slab-use-after-free panics
>> occur.
> 
> Sorry, this had already made it to the end of my CI pipeline before you
> resent - could you send an incremental patch please?


To be honest, I don't mind either of versions being merged. The 
incremental 'fix' is here to silence a warning reported by sparse. 
However, the codec->format is used by apps with snd_pcm_format_t anyway 
despite documentation (more like a comment really) suggesting otherwise.

Let's leave it as it's right now, in sound/for-next of yours.

Kind regards,
Czarek
