Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7CBD2566
	for <linux-sound@vger.kernel.org>; Tue,  8 Oct 2024 09:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728379207; cv=fail; b=I3UfPqO2nwSdEks2lfS8dA/1AxMBjQwUs347L10sEVzS1EpXSmvk/nhi5MKkW8ZlLHiOoJMVMIs9QYKcDolpDW+cChuANtMRFMS+Mb2TJSsQGoKICJ6rpbA8oJmbczqjM9t+ySZ3CauMAD20ZloK6R5TnSDXKwcXpR6IkJVZMt4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728379207; c=relaxed/simple;
	bh=siJt19cw+d6pO0T2/RgdhYw1qLwx5fmD/Y8hlW1QDHg=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=TSn03T/kZwfkfs8lUj+4OuqIcWBbfC/hCzxfLeTlAe7Hpv9K54ZvOs9/x4DWv/AU/ZCZtMx3CqNVWQRqRIot0Pv5U2egZ069oAF6dOIi87Fp23gYWBqPh/H6mw6x67EGRbXaJ7J4mCfgCouKLTCXdzRfZu0kQPPjQk60BgucpUI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OsZyf/Z6; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OsZyf/Z6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728379205; x=1759915205;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=siJt19cw+d6pO0T2/RgdhYw1qLwx5fmD/Y8hlW1QDHg=;
  b=OsZyf/Z6DG5xIDcxLGIP905t3/R9zNyPT0Ebu1eKgRBKlkCUTj16QUvc
   WvHx0k8Z87jkvgZdnfQFEYngAtk36OTpceYrDjUSeE+b/YfiIngh3f51K
   I2dpojOJYHfOzez6q2WQUCJlH2En5zLKgfPie7m6GgpeLHdtTFNY9qvPR
   8cPJzjrjw07nUYPL0VREERjlKmzFlEgk6JCvYZIByh4SLEvSvkpHuG6Uy
   lO5ifdYIzD4pRT/DJfzom/rwV8wSIwrLL/q0x51eHuApdNTVdcLVHMa5d
   9OVm3DOD97J5pVBpBuHxt6YYd48Uv7kKXxEdpZYp10QCqBwH5ijLh8Omi
   A==;
X-CSE-ConnectionGUID: SsLcbYl8SomJS4Iz0cmxFw==
X-CSE-MsgGUID: GlAAtXCtScioDYLUr3aOHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="38952107"
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; 
   d="scan'208";a="38952107"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2024 02:20:03 -0700
X-CSE-ConnectionGUID: NXYw/XcEQyyQxHaxc2U+mA==
X-CSE-MsgGUID: InJmF+LHS6yUvYFftU1CHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; 
   d="scan'208";a="80372907"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 08 Oct 2024 02:20:02 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 8 Oct 2024 02:20:01 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 8 Oct 2024 02:20:01 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 8 Oct 2024 02:20:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T8jFgzrjBr5Bp6GkFGBBjk7VNNS65193gztSUcVklY6NOqy3GbrbcI7IRLjgPju2D9alTKLwcvV5cm3Bwjyv+pGZyXmKY1JbDwicY+YRqDHlrPNVdlw/2bBJhL4A/QfzTRy4kCOZetZUh5yWoJIF/BzpPQIuSZYK+uiRp6CNYBpx9Yy66TDxNuBmPgWGR68epbaf1AUY+IijpmnEx8Qd2KLBg3xaieACT3aFY3Bc+p3pcx6t9Ftt86T5Uog09gfkmDjEzHtikaMv2+rsJbzi84PoWfvScTo+SUbrcGHdkWfaDT+SZuB74pgO7X0hgH3gX7UBmvhavBqvyaJc5/+DQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tts741GgWxYXeGIKtg4ll7LKk/A+KbEyH2znbrnvrc8=;
 b=ZbOYbu1mclVHDifQf8ycUNsgOmdW1Sdb2hPOOfTZ1LwwDYNmsmuhPRAL1RTGj1TNIGr4UEKBWZZU9EfRJsGkVh8/k1pZPmMps+SKwQj0Wqh7JCZ0WO6NWFTGMsdoGnA0Hmcruql+/Ng+jEvNdD/DJPqSichIUsCb4w+P/3i23S4UnYsPSghZd/jxZtKDIoZnEViN+ovqZyR7apqHzGjdXggb3X7UHsp5mIgNiIymbO/f997/urp+quRc81XOfpfGb5BjLpF0u0o/035YPY6WPgTwSYH5edjqusXzKKMJf2QJE2x3ZmAmRKowdpM9InBwZumgkOMsMB2/aJLOShG5MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 CH3PR11MB7722.namprd11.prod.outlook.com (2603:10b6:610:122::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Tue, 8 Oct
 2024 09:19:59 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cd01:59f6:b0f8:c832]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cd01:59f6:b0f8:c832%6]) with mapi id 15.20.8026.020; Tue, 8 Oct 2024
 09:19:59 +0000
Message-ID: <afcacc1c-a8be-4685-8c1c-dcb650663e70@intel.com>
Date: Tue, 8 Oct 2024 11:19:48 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: Intel: avs: Update stream status in a separate
 thread
To: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
	<amadeuszx.slawinski@linux.intel.com>, Mark Brown <broonie@kernel.org>
CC: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
	<linux-sound@vger.kernel.org>, =?UTF-8?Q?=C5=81ukasz_Majczak?=
	<lma@chromium.org>
References: <20241008083758.756578-1-amadeuszx.slawinski@linux.intel.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20241008083758.756578-1-amadeuszx.slawinski@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TL2P290CA0028.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:3::10) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|CH3PR11MB7722:EE_
X-MS-Office365-Filtering-Correlation-Id: fc5185d0-cbb6-47c1-26ee-08dce77a61b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Slh5TXJlTDR6cWt4NnE0YjFaZ0EyTWRMZlAwNFZJbGVkTG9aLyttRHVMSCsx?=
 =?utf-8?B?VjVkbzRrYTZYUEordjZnUzI4d0xYeUkyMmJjUjYva1FMbGkrcU1VeVQ0MnFJ?=
 =?utf-8?B?VjA3WEh3cDJ2Wnh2azNKM0kyMHlBR3JQRnFhTGVHajA2NDVVb2dudXJXaUtz?=
 =?utf-8?B?aHBsQXo3MU9uQ3FReVYzc0lWK0R1eFJMOXdwWXRuT2sxMnQwaEVjMDBQelF2?=
 =?utf-8?B?YTdNNk9LbmpQNSttMytQRE9DZGZBR0V0b1lEekw4U3p2QUk5NXdNaGNmdkho?=
 =?utf-8?B?S2pzMHB6TEZtWHlyWFlpVEdHQW9Pci9kMmVrYU9TaSs3ZUFIQkRrcit0TkJu?=
 =?utf-8?B?SW5oM01TUGZNa2VUcjdkWXRKcFdvSTBxNU9wUUFpYW9mNXRuaHpXV2craVV2?=
 =?utf-8?B?SDM5Q1dkY1Vac2lueFRKVzVNMTI0RHhGZDlwalJaWkg2ZjU2L0J1aVRSbmMr?=
 =?utf-8?B?STZXL2wxZU5LS2dtYnduVnZ6VG5PUEh1aVNQckpUc1B5L2pOc01PYVBYdTBD?=
 =?utf-8?B?bVVFZFZiTlpLNm14ZGhZVlNMVnhTTUNiSEhJSExqZE1JOENBbUxXbjJnU0FF?=
 =?utf-8?B?cEhjR1NtcUVMam1kbWRnU2V5cnh5K2l3ZGNYbldsWnpJVi9DZzJNZjNPNFZH?=
 =?utf-8?B?dlZQQUtlV1JCVGdqdFdvWStMb25IZGtkSGZaTXB3aDQxMDhKbzFOVUJ2T0ph?=
 =?utf-8?B?dWlrWWNEQ05hbVhsWXFZQklON241cVpyOEZWSVlWREdFN3JVOEdPaWExeS8r?=
 =?utf-8?B?ZmxFY1NXL2o5RXc3bzlVb0dZUm9kUFdyVzlmRnBRN081UndPNWh0VDdvc1BV?=
 =?utf-8?B?TVh2dm9lRlp1bi9nT1lteHZ0Yy8zdTRmSGJYeURSZWEwaWJlVVdZRnlqU21O?=
 =?utf-8?B?Uk0xRnFmNzA1cXp0ZXVEQWNwY3NvN3ZRV2J1RmM5cXFxaTc1c2xNQisydEtq?=
 =?utf-8?B?UWM2bHp5RTFJdVNSS3VsWS9TSDJmWkE3UmlMdkk3SG1oZGtYZWdRMDFzbkRm?=
 =?utf-8?B?WHNjTEdjdlM4VnllaWtCNEpUODRlNVRwN0NJbmpMcWM1U2k2U2hQcWsyZWR5?=
 =?utf-8?B?YWxIRGcvc1VhemlISkN2Ky8ybmp3eEkwdUpETFA0M3o0bUhsdStMU2wrYkpm?=
 =?utf-8?B?cWdRazNxUEJFeVBXZW0zU2l0SWFmNmFacUJWdTBReFRrOWpMcDRCZ1NBRVVu?=
 =?utf-8?B?eWVEY3pCd2JpU0JPdlZJNGdpM3JOeXpnaFo3RS9xZ2N1amFXdkFXdTZVaExP?=
 =?utf-8?B?Qnc4aGd5Z1JKWGZ5R1ZsQXdnd2tGaUVIVmFpcjIwU2RjYWVnUWZkUUUrK0o2?=
 =?utf-8?B?N1VJVUhkRmxpTURDdXRSVFNMUTgyY1ZIY0cxRW5YM3VIVFZ1SlRTaWJZQzNM?=
 =?utf-8?B?VDA5dEZLOS94TWtld1BuVWxjQmd3eDF0MEwzODFkeEpKbFpmSXFlUGhpOXBN?=
 =?utf-8?B?MXZpUFlPdU9iNlNEUGRYWG9yRStsejh1KzFDT3ZLdnFHcmxJcmZTMDdRRGV5?=
 =?utf-8?B?OWgvZEdBUGdrVzdtY2RlRUdJQXI0N2V6ekNwMXVSdXFncm9Id29laC9TS05L?=
 =?utf-8?B?N1hBT0ZpUlNVVzgyY1BkTGsyTUNKV0h0K0FvN3dOTnA3RkN3aVE3ektDV3A5?=
 =?utf-8?B?WUJjOXNUbWhIb1N2bE42cXppbTgxWjNQUFpMZ252b0I0bXlLYjhZUjY0ejFH?=
 =?utf-8?B?Z1k0ZDhwSEwvZHZLZDFlUy9oeS9uVHM4emFNYm5MLy9hMDJVdXRzeWxBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6375.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y2VaNU84OUxReXdkN1pxcVRoc0dLczdXNEhHMytDYjlyOXc4S0F3alZRK1ky?=
 =?utf-8?B?OTRTazJSYno1MHhwTHFGeUMrUUk0OVlhOVRnQ1FRUkNTRDRMNGJ2QW42bGxV?=
 =?utf-8?B?QVgrY1Q2YXJGdUg2ckwxVXViR201aXhtTGZKVStSV04rdmQ0dEw0S0UrUzY4?=
 =?utf-8?B?M2NwSmNnUC8zWDR2UzhDb3VhcEJTeWw2TXlDRTNaeUFjVVhINHlnMDlpWmhi?=
 =?utf-8?B?VnVoV09nVDBSWnA2ODVuOXVmRGtiampJWTNvbU9CTkZCaURZczZLWXJYK1V4?=
 =?utf-8?B?K0tVWURiUDhUS3JCTERTQnAwTjhpTWk1Unp6VkF5WHlTczVicWZMU0R0QkpR?=
 =?utf-8?B?ZlR3LzdCejROWkxxTXR6LzEybVdaN3cycGJ3QkQybjY0QXRGWWltbjhSeGt4?=
 =?utf-8?B?YUU4ZXg3eWNTeWQyc01pSnUvNHZMaXgvb1JDditGdkZXSEF3aFBYRGRjQmpU?=
 =?utf-8?B?ODFVSXFnM3lsRkdkcFdWWDBhZUtMVlpoczU4WU5rbjBLd3NPMjcvTG80c2p6?=
 =?utf-8?B?ZlY5RlBRSjQ2YVg0Qlg0Wi9yUGdDVlpYVXh1Wm5LV2JMck9DNWNKOTN3ai9k?=
 =?utf-8?B?SitGM1pDeFI2WTI3cy82OFlKNklkT2Z6N2VQSHhJZlg3UmtzYVk3NVkxbStu?=
 =?utf-8?B?cCs5OFg0cnFvTWtGN1ZtUDh1ODE5VlA5MlpLUTl6anFqcTIzcFJGOUs3b05L?=
 =?utf-8?B?S3NaMlVXS29JN0RGMmJwaDNFOFpSQzFnQ2JSQkxtdjVVblRvWVlXMm9odWE4?=
 =?utf-8?B?QXpHSlB3b2hnTnpLa0piQ2MvaXBJSzBMbUU4bjZqbHp2dE8zL0xVWUlxa0x4?=
 =?utf-8?B?bzQ1dnFvSEVlbmlnSGxzZEpsSVdWbkxrMSs3MHNRYUR6RHM1RWdycVBqSEFD?=
 =?utf-8?B?RkxNREszY0xSb1FFcDdtaXJUZmpob3dzd09xTEpLalYwWWZGNXpPbXJlMUta?=
 =?utf-8?B?NXZIRnpuUjhGejZwQWhIbUFtSW05d2w4cnlTSkY3ajVwRzgwNVNiSW9aNGZj?=
 =?utf-8?B?aXNzSitiVUpYUjZMTXlNZjd0WFFvdVZVb1dUc1MzUzZhWWIvREVnYkQ2RGtG?=
 =?utf-8?B?bEVmdEpuUzJDQ2JHbmxLT3dOK2RWbkFMdEhEK1pBQ3BnR01PU1RTWUxpUWh0?=
 =?utf-8?B?dFpOQWhLSDVkTUhCU2xGSXY1WjI1REZOZGtUOTRGSWNLMkpSeERHYm52RnBM?=
 =?utf-8?B?a3IrVVBEVmR1QXNaK2RnTWxTQndlSldyWWtQUGV4TGR0UTJkQzBmb2lrZFBL?=
 =?utf-8?B?N2VuanJzZEVIT0JIcHNKbkFpTHF6T3V1c0ZjTkc2bmcyNnY4OWlBazFFTDhh?=
 =?utf-8?B?aTJEeEYza0JwOFVHSll4bkpZTlRwSVlwNHNSMFExWkR1L1lrRzdrd2FRbksw?=
 =?utf-8?B?VDNyQU5namFwVU1KRFJNeTN0YzZIZnFJb2I1WlZOYXBCQlFIMWp5SWpML2p3?=
 =?utf-8?B?SG8xbVhBdmltWmNBSFJnbDEvb2dsQ0kza3NGdVQ1YkNHUTNJWU1seTQ3VWh0?=
 =?utf-8?B?WGp5bEhPTGtad0pwODlJWVcvbm5xajlsa2xRTEp6eWFMbDJLWitKdGc2THpL?=
 =?utf-8?B?VGk4bUsxWUdjSm9HUVpEV2FSMXRxUTNkVm1kVEMyL25jQXFTWFpDY1pXY3g1?=
 =?utf-8?B?UWUxUmRrVW1LT1pnMndxTkFNTnJLOXZReXJURGUrN0JxT0dzbHJEZWtMTk53?=
 =?utf-8?B?NzhjR1FWZ0NwWTRFZjdXN0FtVnZNV3VLbmRTa2FkdGkvaUZBaGF0alFQY0Rz?=
 =?utf-8?B?ejZRd2toWXhjdk85dXZib2ZkczZEdkJyTDEyVUZhV2p3U0ZidkJKWC9CMHRB?=
 =?utf-8?B?cXVIdkpLTEJYb05PK2JDdWNEcjBtejE2eisweWpuZXRNajBmbkl1T1hOMXZ0?=
 =?utf-8?B?RVYyaG5zUENUb2xwTUZnTE5FaFdRa1hTbGR3Y2tjajBpcUVHVExEcVcvQWhv?=
 =?utf-8?B?RUd5azFRUHp6eFN3MHdBSHZxbnFEbmJvMExBN3dtaVF5RU00akdubWZRNklI?=
 =?utf-8?B?Sm9OMncyZkNmOFZOL2lQWWUzZk9ISzV0TEQ1K3ZnZlpEVmx2UkE1MUFURTRN?=
 =?utf-8?B?U0oxb1dOY05XZkRMa1BiUDRBMnd6T0JaYjN5SEVCVWNrWFI4c1lReGNnVHJk?=
 =?utf-8?B?cENjZlNXSXRTeG9vQlFSbXRZUEVpY1kwRVZqZ2tnUlN2WW1VejJWeFFVY1V2?=
 =?utf-8?B?RlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fc5185d0-cbb6-47c1-26ee-08dce77a61b5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 09:19:59.3285
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p4edHwKXpw2Bo7R//2Y8aZFqLbWiEpFw/ZmqWLS1zntCgOqoeAY6NIoloVcq+i72YGYqwq7yatnqUVXb+i47cX4ttJoGE01T4jD3Jex3aq8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7722
X-OriginatorOrg: intel.com

On 2024-10-08 10:37 AM, Amadeusz Sławiński wrote:
> Function snd_pcm_period_elapsed() is part of sequence servicing HDAudio
> stream IRQs. It's called under Global Interrupt Enable (GIE) disabled -
> no HDAudio interrupts will be raised. At the same time, the function may
> end up calling __snd_pcm_xrun() or snd_pcm_drain_done(). On the
> avs-driver side, this translates to IPCs and as GIE is disabled, these
> will never complete successfully.
> 
> Improve system stability by scheduling stream-IRQ handling in a separate
> thread.
> 
> Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>


Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>

> ---
>   sound/soc/intel/avs/core.c |  3 ++-
>   sound/soc/intel/avs/pcm.c  | 19 +++++++++++++++++++
>   sound/soc/intel/avs/pcm.h  | 16 ++++++++++++++++
>   3 files changed, 37 insertions(+), 1 deletion(-)
>   create mode 100644 sound/soc/intel/avs/pcm.h
> 
> diff --git a/sound/soc/intel/avs/core.c b/sound/soc/intel/avs/core.c
> index da7bac09acb4e..73d4bde9b2f78 100644
> --- a/sound/soc/intel/avs/core.c
> +++ b/sound/soc/intel/avs/core.c
> @@ -28,6 +28,7 @@
>   #include "avs.h"
>   #include "cldma.h"
>   #include "messages.h"
> +#include "pcm.h"
>   
>   static u32 pgctl_mask = AZX_PGCTL_LSRMD_MASK;
>   module_param(pgctl_mask, uint, 0444);
> @@ -247,7 +248,7 @@ static void hdac_stream_update_pos(struct hdac_stream *stream, u64 buffer_size)
>   static void hdac_update_stream(struct hdac_bus *bus, struct hdac_stream *stream)
>   {
>   	if (stream->substream) {
> -		snd_pcm_period_elapsed(stream->substream);
> +		avs_period_elapsed(stream->substream);
>   	} else if (stream->cstream) {
>   		u64 buffer_size = stream->cstream->runtime->buffer_size;
>   
> diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
> index afc0fc74cf941..4af8115803568 100644
> --- a/sound/soc/intel/avs/pcm.c
> +++ b/sound/soc/intel/avs/pcm.c
> @@ -16,6 +16,7 @@
>   #include <sound/soc-component.h>
>   #include "avs.h"
>   #include "path.h"
> +#include "pcm.h"
>   #include "topology.h"
>   #include "../../codecs/hda.h"
>   
> @@ -30,6 +31,7 @@ struct avs_dma_data {
>   		struct hdac_ext_stream *host_stream;
>   	};
>   
> +	struct work_struct period_elapsed_work;
>   	struct snd_pcm_substream *substream;
>   };
>   
> @@ -56,6 +58,22 @@ avs_dai_find_path_template(struct snd_soc_dai *dai, bool is_fe, int direction)
>   	return dw->priv;
>   }
>   
> +static void avs_period_elapsed_work(struct work_struct *work)
> +{
> +	struct avs_dma_data *data = container_of(work, struct avs_dma_data, period_elapsed_work);
> +
> +	snd_pcm_period_elapsed(data->substream);
> +}
> +
> +void avs_period_elapsed(struct snd_pcm_substream *substream)
> +{
> +	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
> +	struct snd_soc_dai *dai = snd_soc_rtd_to_cpu(rtd, 0);
> +	struct avs_dma_data *data = snd_soc_dai_get_dma_data(dai, substream);
> +
> +	schedule_work(&data->period_elapsed_work);
> +}
> +
>   static int avs_dai_startup(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
>   {
>   	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
> @@ -77,6 +95,7 @@ static int avs_dai_startup(struct snd_pcm_substream *substream, struct snd_soc_d
>   	data->substream = substream;
>   	data->template = template;
>   	data->adev = adev;
> +	INIT_WORK(&data->period_elapsed_work, avs_period_elapsed_work);
>   	snd_soc_dai_set_dma_data(dai, substream, data);
>   
>   	if (rtd->dai_link->ignore_suspend)
> diff --git a/sound/soc/intel/avs/pcm.h b/sound/soc/intel/avs/pcm.h
> new file mode 100644
> index 0000000000000..0f3615c903982
> --- /dev/null
> +++ b/sound/soc/intel/avs/pcm.h
> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright(c) 2024 Intel Corporation
> + *
> + * Authors: Cezary Rojewski <cezary.rojewski@intel.com>
> + *          Amadeusz Slawinski <amadeuszx.slawinski@linux.intel.com>
> + */
> +
> +#ifndef __SOUND_SOC_INTEL_AVS_PCM_H
> +#define __SOUND_SOC_INTEL_AVS_PCM_H
> +
> +#include <sound/pcm.h>
> +
> +void avs_period_elapsed(struct snd_pcm_substream *substream);
> +
> +#endif

For transparency, this short pcm.h header is not a mistake. The team 
intends to expand it with future changes so that it matches its internal 
equivalent. To avoid conflicts/code shuffling when pushing those 
changes, it is easier for us to define it up-front.

Czarek
