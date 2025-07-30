Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 197C34C62
	for <linux-sound@vger.kernel.org>; Wed, 30 Jul 2025 12:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753878785; cv=fail; b=EbCL3mBvDKOSiiKieoKxKirBSc1g/k5mtrBsFPW4w/4Sg5B7uLvp9FCSn+jgdG+O+L5uBkpf3dLdzaWjsnJMOgKeqoT9ndSWQrbEpZxDBiaic25GLXLRFljHVLySYSCPLW7qugW0aePnjQ/FfDiz01Hj7XMJAv7xQkZvPC9VzAU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753878785; c=relaxed/simple;
	bh=fv+lDpL2ANaKPFpAve+vGfVpj3zXfie6G5YHXO5fpAU=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Wjw2DA9C+9sYEq6LsaKj2wJPyTCJyFNat0VY1w5BMVR+g00Nc2uWjfEFFBT6BPI0Daonx+ZmkPpAsBmC3Egtsrg++bRFQgXGLovhK+Hwu2hgawlHQvGeW94LkEkUEkDWxn/OiyOZWqxB16MNqq4B2IdBHzMsDOorF0wV3C6S18E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PS+gp370; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PS+gp370"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753878785; x=1785414785;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=fv+lDpL2ANaKPFpAve+vGfVpj3zXfie6G5YHXO5fpAU=;
  b=PS+gp370+b5P8/v7t/3O7RwJaDpkTYDvjm6c5jIOFlYeirCXOJLXCCH/
   i5/E0co33l415mH7d0NFhi/n5boRJzQUtXlLebZYSyBTp3DYrjmfyQGT7
   c2seLuEXBnJx8X06QOvOg2rmhAuQrfgSGfpkM6N1NaBofmL/iMD/0ieTu
   Wtp44tXrxbVxenpKL0IPq6dIp7GSx4rVu0drHBz5b1WOlgKJBpJGVEb5k
   oXQEKs5tsXVy+zTh7PkSziLwAK5Mk4NSLnsy4ZLDeaNTN71jxMdGHe/N/
   dX99wiFZ23h1m5S6uwp75N2rNJciydnJvoGGoGlpmEg8M/hDga+OIQoe+
   A==;
X-CSE-ConnectionGUID: D3mnrKkKRTSVYp/Vb9gSUg==
X-CSE-MsgGUID: hgS8KmLMQQaakAnf1EfBtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="56323937"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="56323937"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2025 05:33:04 -0700
X-CSE-ConnectionGUID: LX+kQ64+TGK813HP4sGdXQ==
X-CSE-MsgGUID: GadhzS7eSFijpTj1Fvx0fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="167462138"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2025 05:33:04 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 30 Jul 2025 05:33:03 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 30 Jul 2025 05:33:03 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.89) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 30 Jul 2025 05:33:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RXkXovsTFoyjE5eBsqcM/H9UZ5Zg9uCnae+7CzAjOYOj+gP7Wa34EDXJxGP45t4NCcFZ9JbRzMNJ1/CqjHTCGA+XUxPm7q+wBIDVIAzvVoLUkXTiLS8S9PMbHLT/SASDwqDqkufbxebdxpHGQY9vZ0t+/HUWcLBphQGIzk+04JY6d6VfpF8MjeD1qu5R7a2ifO17PJrwbvqfJRR3KZQrjD28akVp7k/78yNF1kwoTwRuuxi5yXkSjm5L4LT3lPzHcJdsqsg3L8zYGKxrUbVIic4WRks0m49+zvFNYJIxxiozqBJqLA1lEX3hnd1A7iWBP1VPo5RIlGRfBp+n4etWlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U8mqm77zPlkekj7khogZuouEKAabsm8u4HjZeViDmrs=;
 b=L1vvr+noDu3x3JlhFgPGRB0gALwNBbDwRtIAG8LluOFiX3gmxV+z0zxo3ysBYSJJ/DeuHZHJGbFUZ9qEcpu9RF6HyEopgAULEQ1tflfS5BMiuophL5HWTwwwRy7w7oXnSX3CeE5GIo255Zm6sJiZ+k4/NLMSTEG60sdaING4pjFbTwI93lLO+oUb/lGo8slRx781xNs8DzBh9YxVN7PqrbpBlmJ18UzMfvYbt01CE8fDAbJkueQq1POBs1ByOnoasj7EsSIvZSWhspqrxiWTNQpAwLSjWeryjZkIw+99o4+oR2Jj6BV8hq3FD/GrQ4KewEMTGsBbyZ2TVqptlYo2Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8283.namprd11.prod.outlook.com (2603:10b6:806:26c::16)
 by SJ5PPF7CF5FEA5F.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::838) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.22; Wed, 30 Jul
 2025 12:33:01 +0000
Received: from SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::3:e0a:87af:d4b6]) by SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::3:e0a:87af:d4b6%6]) with mapi id 15.20.8964.025; Wed, 30 Jul 2025
 12:33:01 +0000
Message-ID: <dd7d3108-8a5d-4e79-9853-725942649db9@intel.com>
Date: Wed, 30 Jul 2025 14:32:55 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ASoC: Intel: avs: Synchronize happy and error paths
 in PCI probe
To: Mark Brown <broonie@kernel.org>
CC: <tiwai@suse.com>, <perex@perex.cz>, <amadeuszx.slawinski@linux.intel.com>,
	<linux-sound@vger.kernel.org>
References: <20250729114229.309472-1-cezary.rojewski@intel.com>
 <20250729114229.309472-2-cezary.rojewski@intel.com>
 <9af2c2ca-103f-4f2e-afab-1fea5a2160a5@sirena.org.uk>
 <179e32a8-b20b-40ab-8663-2a793a96993b@intel.com>
 <23104b50-974c-47e5-a79d-07dadb2bb3ce@sirena.org.uk>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <23104b50-974c-47e5-a79d-07dadb2bb3ce@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA0P291CA0024.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::26) To SN7PR11MB8283.namprd11.prod.outlook.com
 (2603:10b6:806:26c::16)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8283:EE_|SJ5PPF7CF5FEA5F:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ad755c0-cbe6-422e-9f58-08ddcf6538e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y3ZBT3BmZDMyWGVQNlpiQkhhb1FwUUN4cWI2WnpqVUJRa3lMV00wcEhTNkhO?=
 =?utf-8?B?aWMxZFJCMGRwd0xGeERyNThxemZjdEc5Y2dlOTJQK2NaY0orUTZQTnVxaXRW?=
 =?utf-8?B?dEJ2bytxamJVTDVpV09VaU5rWDFmS2JDMHc0Y0xxcHk5UFIxK1RkcG10S3lX?=
 =?utf-8?B?NzR4K3NJYVByR3c4b2ZYWi9RZVhlSmRRcmlFVlRJcGZYSHI5NkN1VFNEMnV3?=
 =?utf-8?B?dnRoU2ZGb1lidmFxYTI3TFBQWmV6UmZwTlJCNmxGNkVSb3lUYUJHOFlKTTU4?=
 =?utf-8?B?c1FvVjhrZURFdGFlaWdwMzB2QWRMTDEyMXVCeS9sWUQ5dlh2NlVJQTl6Y2E3?=
 =?utf-8?B?WnB6Ri9hODNtd0VEcm0yK1MyUWpuSXFkaUtKZnZ2Tm1IYk91d3hTSmRzV2Vt?=
 =?utf-8?B?aURvRDE4MHB0VkwzdHUwVXI4ZDljZVpXY1JCYXluYkZXWVJhT0ZzNVdTSHhG?=
 =?utf-8?B?Nm5CWlliVDJTOEtXWTBOeG9mNEY1Snd5ZkZ0RXM0ZHFlT1FuWkJIREkvYnhp?=
 =?utf-8?B?azVuVlE4OGtHdXU5SGZRTnFGWkJNNHFqMmRNZU9qMzhlS2RCTHhQazkrUXNx?=
 =?utf-8?B?bi90Q21NNmcybisrOHRJTTZiRFNzZzdSNHJhQ1ljSHg4cEczZUgxV2FKMHNC?=
 =?utf-8?B?OU5RNW9TTTZsZXBFY3lEenR5UGtlcGRaVEdUd1VMN2Uvb0RXM2dsWTIwQTBN?=
 =?utf-8?B?d055T1FGUWwzNG1penNCdGxjT0NFZ0hHRGdZd3lDd3RiUENCd0lNQWdBenNX?=
 =?utf-8?B?TUUwcXJwTDBCRTV5Wi9UZk54M3ArQkJzck9ObTJURHdXSlVGQUo1R0VyZXVY?=
 =?utf-8?B?YWgwd0Y0cVQ3MHBIU0pSTjV3dzM5bi9BdlpvckdvWS9GZk9SbU5IaE5vNWpw?=
 =?utf-8?B?WWthMzdDaXFpWXFuUWx6OHZXU2h2Syt2YmkzYTNONG51Ukdxdm5HVm9XVmxn?=
 =?utf-8?B?L2RNVnFXcTJpbUlmU0dScis0T0Y5U3NQYlIxR2VyVzNabTlXQS9Oek53VWZm?=
 =?utf-8?B?dDNZMnJlNkUrYVFZZTVHSU9aNmhpNHNIZDhqcmwxU01ITFdiNDZkdVhCYzVB?=
 =?utf-8?B?NnEwRzFHc3NJUE1ON05ZMDBabVoyOHNjZkJLUTFSbklrYUdvdFgweEFOTWE0?=
 =?utf-8?B?SU5acXRNVFpUVkgwclNKOGdBajVPU0dPa0NXNERrcXZvMnNaZXBteVNSNnNq?=
 =?utf-8?B?eUFUVFQwWk5tcHRKZUNZZnRBc2toenVaTFNaWmFlbUhpZGFVUlhUT0dlTzZF?=
 =?utf-8?B?M3h3c0lkVW5tcnQyZk4xVERabndjSzF5QUVrUzVYTDdSblVCUHZ4ZUJLSUdk?=
 =?utf-8?B?cVJ1UlpUMTlmcGlIWWNKQVFoNnJxUzlvWTNTWUpwNCtWdFJxL2M5ZG9YSVU5?=
 =?utf-8?B?NXlHbGZFTnZuTmJTSk0xNGl5TGxTQWU0azNiNURzTTRrK1FwaE1qbHZnTFVC?=
 =?utf-8?B?Ny9lWnk0YkdoU2Fra3Q0RmR5VEtCd3VSRnhXNERIakxMVlNNOFBsUVd1SDR0?=
 =?utf-8?B?TURvVS83dE5MYnFRWGpLa1NvcGpxaXU3Qnp4ODZGRTJmMllYbGJrU2syRk9y?=
 =?utf-8?B?alZXNXhSb1d5NWJyUkw0MFpHZ2lhUXhiMXRWSm1TY05jTTZHaCtXV3I5TEw2?=
 =?utf-8?B?YnZVQlMrUGpLcU9MMldreGRKSjduaitCSjBURHQ4ZWhna290QlpGWXA5TnZD?=
 =?utf-8?B?dTB6UjJzU0UxK1FnOHpqZFl0SXV5S3prSG9xT09Ca0c0MnozK3VMV1RjU28z?=
 =?utf-8?B?TUZXaGZReHhCMHhvUEdNeFFSYngrTFJ3dStUVkhIYit3a0pleXl5Wkc4MCtP?=
 =?utf-8?B?SGYrM1V1dE04YzVCcFFTVGI1Z1cweUtKOTBERkJvWFNMb1FTR2JEOWtod01B?=
 =?utf-8?B?OTFBb20rNEcwdk5OMm5RMnNVQko5YktaZStLa0dIdHpXZU9PaVRFTUoycHY5?=
 =?utf-8?Q?sSt6/Qeu2dU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB8283.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TmdzOGNraDZiRHJ5UnhzQVhnMStZMVE4Sm9Nb2xwckx1R0FWb0lQU2U5cTdK?=
 =?utf-8?B?U0RYN0pPbytjbnpreUdDNjViMVcrR2xEUmYxTWFLL1RYMUJqaHZMdFpoL1pI?=
 =?utf-8?B?My9Kbk03T3NtbWhvWFk5THZCbUplcnJwVjFTNTNWdGFwNXFpK3RaVE1ibElm?=
 =?utf-8?B?aUM5dVlMeFhFZ3ZjcTZuUFNROFRZRzc3Y0hWUGFwVDdSTXZnRGlwaUd0Kzhp?=
 =?utf-8?B?bE8vaDVGKzN5UUdBVk5YNDExem1CVFJOaHpHZ1JvejhNaDJ2NHErV2c0c1hN?=
 =?utf-8?B?WENBS1V0S0Y1OUxOMGQwN2hsQU5wU0wzYTlLNVZCa0srOGlzQVdoWlJ3VGRk?=
 =?utf-8?B?Q3dSU2tsckJZaUpUMjJyWG9YM24zcThNRXhJMTJWRHQ1S1QzUjJjNU1oSVA2?=
 =?utf-8?B?SmY3ZUpyL3gzcGdiTThRNExtLzdFakk1dHI3UmVHTmdFMmt1NEpQVWhvdnB1?=
 =?utf-8?B?ci9rYlpWaUd4YmhYL2gyQUllWHJ0eDFxdzk3R1VCSHB0a0VjV0dmRGlmdnUr?=
 =?utf-8?B?WjNLUWFPOXQ1Q25uN29HbFNvUlUvVURHcHkyd3h4MGVXMUI1eEt1QUdOUi8r?=
 =?utf-8?B?TnY2aW4zQ1p1cEkzWmJJa1YrTU1uRTJncnVlWUlJNjArd1dRVGRyUHhuYjhF?=
 =?utf-8?B?UGUxRXBRcWR3N2xINEYwQXlHNEZHRUZFcVgxdnFhSC9kckhNb2VJV0gyS3lj?=
 =?utf-8?B?V3lqY1E1MU9QZy9JbExDRWsyR05udDBTUGthOUUyYm55bkpQb0ZiUFNxeWFX?=
 =?utf-8?B?b01MR3JuRWlybmVRUkI4MVU0TWM1VTRZQkM0SmNueHZoMG9uN2xvckErSzB1?=
 =?utf-8?B?bDZSNDBMdEdIRmRjQ3A4QmNnYnVXK0NWeENldmFwVVUyNWk4UW5FTllwRmRa?=
 =?utf-8?B?eTVVWDRKdjJpVHphSTk3RnFUUzRIODFuU0o3M25DMnlpczBWK08vemVWRlgv?=
 =?utf-8?B?ZWxrVkw4bEY3ZlJ3bjVhQmJCcGZEUHM0OXNiK2R5T1JVUGZ2TWJUMTgzV01Z?=
 =?utf-8?B?bWFaMGNqakxwWUpES3lLcUhTNi9YTTYvWkZwUEhKcVcxczZzNUV2MXdnYmdp?=
 =?utf-8?B?ZG5NcHcxcXZiYXovUkFxV0x0aWMzOCtQRGs2bW9vUWt0VDJ6d0owUmRZNm1v?=
 =?utf-8?B?L3RXQWFaQXhiSlNDdnUzNDZOZExKd1Btdi9WL3hqdXdMdFhYZ0tQSzNHaVQy?=
 =?utf-8?B?d2ZidFBkcjRYYmJzWmhsK3VJUThXclVlV0t3dFNkY0t1MUtWMkN3RXhSZFBC?=
 =?utf-8?B?UythWC9iUnVxTjdjaWVMcm5DSDZwM3ZXU21pdW8zRXFsZm9lME9XS3hqeWll?=
 =?utf-8?B?UGJpNXlaVHUxbVdVSE1XVHdJMWFJdk5KRXpHZVJRbnA5TVZUN0liR0VOcFY3?=
 =?utf-8?B?UkdFWFRVYWlsd2FPMWp4Zm1MQ2x1dDR1U1JXN2VkZEN5c2NKUjJFRkZTQkVY?=
 =?utf-8?B?bDRTcEhBUXgzQTZ4UFlpZkhEdENTb09kaU5uek5BZ3V0R213RXlDT3RlQzk2?=
 =?utf-8?B?YTNxamppSGt0ZXhwR1JNTlIrblNyR3ljaGRmRGNhZHdwTUFQMytIUmV0Ujhw?=
 =?utf-8?B?VUJLd0dxSFJWZjdIRGNUcGszcXpvVEZxWWhvQ1A1TGZwZDdFWmpzeGF1d3NB?=
 =?utf-8?B?dUR1YkcwN2dTRVI0b0dxUTJ2b2RtZ0FydkI0WVVRVmNBQ0dLU1lwZmZwV3cw?=
 =?utf-8?B?S1BFU1pJd1N4Vk1PNTAwZndnSmd3L3BpUUsxbjg0S0J1RFN4bkxIU21qVFVN?=
 =?utf-8?B?S0l5Z3NIaHRWdlo1UXV6QUs1ZUhMMm1KZkZtaUwwYVlwUlV2TUxjcHZCTjdJ?=
 =?utf-8?B?b3pndWFjSVZnVDZQNjZPOW5ibURkVVFIc3V4cTQweWhSbytCSURGZnJPWG5i?=
 =?utf-8?B?ZlZ1aDZMazlQNkZVKzV4b0R0d1F0UmUyUEtjSjRma0ZtTG01V0poNkFISnow?=
 =?utf-8?B?WVVNb3BlRHV6QW1BTGNiMWZkUEYvTWdXOWp1dTBMMC9rb2JUd1djN21BdEE5?=
 =?utf-8?B?MXVOMWI4NmYxekJscFJrR2FubDh3MEpSZHR0RkxDbGVXTUJVYkZHK2YrZ2hs?=
 =?utf-8?B?OUdQZWYxb2pSWkZRdHdNN3RKQkYrbWZxeWQwY1JNT3YzRmlERTJqaEthOXM3?=
 =?utf-8?B?WEphSld3eTdMcnQ0OHhONGI4RXl2OEt0KzI0c1NBa3B6b0U2TVJZM29CVVhY?=
 =?utf-8?B?bUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ad755c0-cbe6-422e-9f58-08ddcf6538e2
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8283.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2025 12:33:01.2117
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cNIpWwn3Ckh/S1FB0cXkynH5oDl6BLKj8F7xR+YBLPKHFY1B4jIGD62+fYr/bh7U43yz4Dah6TZBEqto3aQZ1d5PyvuZrVtoHcZ1IB0v0gg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF7CF5FEA5F
X-OriginatorOrg: intel.com

On 2025-07-29 3:32 PM, Mark Brown wrote:
> On Tue, Jul 29, 2025 at 02:49:18PM +0200, Cezary Rojewski wrote:
> 
>> happy path:
>> 	pci_alloc_irq_vectors();
>> 	pci_request_irq(bus);
>> 	pci_request_irq(adev);
>> 	pci_set_master();
> 
>> error path:
>> 	pci_clear_master(pci);
>> 	pci_free_irq(pci, 0, adev);
>> 	pci_free_irq(pci, 0, bus);
>> 	pci_free_irq_vectors(pci);
> 
>> Is there anything wrong with the approach before I send v2?
> 
> Unless there's some issue with having master disabled but interrupts
> disabled that should be fine.

After your comments, I've investigated the drivers/ code and it seems 
it's more common to put pci_set_master() early in the probe() rather 
than at the end of it. That may trigger an update to avs/ and would 
render this very patch redundant.

Because of that, I've decided to drop this patch. Will re-iterate on the 
subject but don't want to block the followup patch.

Good review Mark!
