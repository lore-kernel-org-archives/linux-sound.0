Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477F3232456
	for <linux-sound@vger.kernel.org>; Tue, 14 Jan 2025 18:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736879104; cv=fail; b=gasWgLjX5i5gAWxxhXByFtbtWuOTu6047Gt7fZ0JKbfWXZnIz1gFkRj+q9rvE0kUIOJEQwcnOhESvJNtVXskhseC2OlozMZ7EOkGOkITkXMDbcHXxEdxjiLAk/AnXN9NiQNWCM2GRJ6FWIJov2jgldZ32177vmhgR72lzmP3Eas=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736879104; c=relaxed/simple;
	bh=tO1hRi2ceJKnXxYQ9oV2cVTRSOgHrFbpqDHee7Z7V50=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=cvGRHp+tnAiZAPqH+Ia7SM2Tp84SWNrTg+370ZxMDSLVe6RleptOb92Uazpdk8JUAipDJHtYtBMoo4yoRCcWZCNJV6JoB9jAuXkaH/qe4wXY/Er2B53Fj0M0GgVHgTnROknXjIryU8ez1/Lt8rMJW1Bih8q3czSjJahuuL1ZlVw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QF1hum5B; arc=fail smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QF1hum5B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736879102; x=1768415102;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=tO1hRi2ceJKnXxYQ9oV2cVTRSOgHrFbpqDHee7Z7V50=;
  b=QF1hum5BO3X3I6j7aJ7xjPHdcg2YtwnYNPyv27eEQs6xatCO3hSSs6JA
   RLGDwXsle4apgLasFFOrDizpFsqDODwrsZWtqGltG2tmzAdPOuBeiaZ5z
   a6e0grDrEgEoIvFDsPee5EYVlXAgVCytEepiMZqbcwc7XjI4D0KcBJFKq
   +nlZxLw+52erU/TzBFx1aHy/r6GlVu4zAHFEuxf9RWdWAlU7HqBQ4JLlT
   ppgZX4wgA16Voc5vTwRUXKdvnsO1quR8HHtxAjPypdcykd0yhx9MJYYuC
   2IvR/KiLSyevo+mejchJEfIB6ADcjme5NRgXJWJLnMQFtj9Gue8a1Y1lE
   g==;
X-CSE-ConnectionGUID: kABsm7k4Rv67SolJAmTp4A==
X-CSE-MsgGUID: yg5qW1IgQnqsMXLe3M6ZTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="48600217"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="48600217"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2025 10:25:02 -0800
X-CSE-ConnectionGUID: 6cgMyILMStudH9WXRkCK/Q==
X-CSE-MsgGUID: 8N4SG0X9T6azkNcBL3V/9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="109865218"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 14 Jan 2025 10:25:01 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 14 Jan 2025 10:25:01 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 14 Jan 2025 10:25:01 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.42) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 14 Jan 2025 10:25:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JYOcyIHmcTDsGOKRS8psv8mPPZlx/5jpjiGQR99XEHRWnn5VDmazPMfhUaRaRDVHhTrnvhOj6WwV3+OU7+sfdq1fXxuBYt8NSerJ8Z3djBDj1h+GmDPgRLDB77wYvJReh8XeqAi9eMMeT3fE6K3QV3UkHEgxgYH8vGQ23mpkX3K4GV34pfSIcRj1JlcuXtxkcAHRPGpmumFOM/Ao4eA931Z/GNZxefxcK7Ep2EzeKJD1SpqN09AfgVbS5ztji95iUYyKUWzs9H1siAlly0j4sxlR+wZ+ZOgndPc61C2FlQVEl4ZiH3cfxXSuaZOWXHSTml+UJM/o8tvqxWKRjDrlWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hXBr8OqQectcmAGrD7RLWPv0Iqv+dgGZ6I0Sc1RipLw=;
 b=Lh0XJpnRRP97aXqgszyOxKoUFZtKIzF2sXSN4VwJ9rjdTqJS79mFcoQbnoeYEoZzkbH0+hbhRCmB5TdCEaI2+rAPcmGghPyh/yNFz9bAZRgfw+4+xkjpPu2FS8KgQ1XEiKcyaWOCdIrn1/btnN+FD1nxy+USPsmGw0wW8pzLpNd0/5NpdgrVuwj1ADU7nndnQOPnw7vb+cvohlgFvFFiyN/F3BOhIN5EaDqnRdRvApPvl8LEc9/VJVB6kTgHmEoS+R7yQCkY0uoLcrxVYDim0fYdgEVUvEbmTEydsDJHJ43TSAEvq3GcW3a0qaX2lajl3VC+6LXJdJJ0+qpOTbBWfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 DS0PR11MB8020.namprd11.prod.outlook.com (2603:10b6:8:114::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8335.18; Tue, 14 Jan 2025 18:24:59 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cd01:59f6:b0f8:c832]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cd01:59f6:b0f8:c832%5]) with mapi id 15.20.8335.015; Tue, 14 Jan 2025
 18:24:59 +0000
Message-ID: <7e24d284-9782-47d1-8209-bfc6595c5848@intel.com>
Date: Tue, 14 Jan 2025 19:24:54 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] ALSA: hda: Transfer firmware in two chunks
To: Takashi Iwai <tiwai@suse.de>
CC: <tiwai@suse.com>, <broonie@kernel.org>, <perex@perex.cz>,
	<amadeuszx.slawinski@linux.intel.com>, <linux-sound@vger.kernel.org>
References: <20250114125813.11567-1-cezary.rojewski@intel.com>
 <87ed15zgc3.wl-tiwai@suse.de>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <87ed15zgc3.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA0P291CA0022.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::22) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|DS0PR11MB8020:EE_
X-MS-Office365-Filtering-Correlation-Id: 12dfa601-5224-406a-d30d-08dd34c8c0fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?REFmbFhVcUJhTU1LZEhvTFFSTFRuZTVValIwRGxLREpxZDJvcGM1d0FidjdR?=
 =?utf-8?B?YjIwSThGNWh1UVJDVG95ZlR4MnFIeitydHUwdW8yaG1CM1pBd2dQTU1LZEw1?=
 =?utf-8?B?N1lTZ1IxdXQ4UXoxTER1a09PL3dTQnA3Zkx0S0s5M2h4K0RSQys3OVdyS3pp?=
 =?utf-8?B?V2gvUUVDYi9qY0dFYTJkaFYzWDErU0VXbUhETnR2Ylg1ZmJ1N3dSdGJLbWdr?=
 =?utf-8?B?YVBxc1h0NS9ObG5xaFZTcGdJTlQzb2dBbGJqQ3FGclpTS2ZKT3JnbzJPbTZs?=
 =?utf-8?B?THVqODlWUmc2dkU3WUNXLzRQSkd4Tkg2WVFLcGtLRTc5VzRnbnNOell4S0Jv?=
 =?utf-8?B?MmNQNFZaUFN4VnZlaXZPOUt3VE9BbWZrS1VYN2lUSUh3WURjeXRRVUxsLzg0?=
 =?utf-8?B?b0JqUDdBSkl6WXA0TkswRFgzUHRQaks3aWpuYkxLcVNMWk5qb3lxQ2orT2gy?=
 =?utf-8?B?bll1K2RHUmt4S1I2enk1cWJuZG05VjBjcjFKRFd6eTFuRG4wMCtQMmtZck56?=
 =?utf-8?B?VU5ISmlWWGxabTIxTnlhVG9iUis0SnJkNHhhb05VcFZiN1pHWkFBa0hGK05L?=
 =?utf-8?B?ZVU4NVF3bzRpNWNLQ2UzUVIxdjFYRytBcjBpMnVsM3FNWk04K1VMU2FtcTNT?=
 =?utf-8?B?REZIOU55Q1QwNXdpMzRwemlGUHBTYXlXSGYvMmZmckpwaU50eDJTL2NjRFg4?=
 =?utf-8?B?L2x5ZVhwK0tkZmpQY1dyaldESm0ya2NTRHVDRG9ZYVN6Z2V5Y2haem1uVUNz?=
 =?utf-8?B?RWVnOGUzbDBlRzJpR3JqNG1UMng0eUE0SEtuMU52eEFFS1lRSGFLR3NPZUZH?=
 =?utf-8?B?YkJqSDU0UXlkVDBaSm1TdVdFOTQyb0hUYUM0a1I5VHEyOTNuVHVnUE5xazhp?=
 =?utf-8?B?MlAxWFBTRjduVTB6T0M4M0xPZmpGSFpTUUpkaUVSaExCU25kYXlja2xIOHFx?=
 =?utf-8?B?Q29LUHBSQzZOd2g5WU5NWGRmVnlFWWwwcDhKR1hJQ1krcSsvcU9nRXVvRVVh?=
 =?utf-8?B?YW5vejUxSVlhWk5IQzRMTkU3cVMxU1Zrcmlid1kvMjNXaGRXMVZ4STAxSnpQ?=
 =?utf-8?B?RW5PV1JHa3hETVFtRUNoNGpjMjEzYmtFcjVwclRVYjFKTHNxNENLMFdxS0NQ?=
 =?utf-8?B?dmR2YkZna3p1WklBRzZMWGJVdXdYU1BsMUYrZGMwVzRacTZzMW5kZW5oYlo3?=
 =?utf-8?B?UWl6akhUaTZzWkRqSU96Tk9jYUNaZWExcDZraTR2MFZTdWpqd3ZuYnhtRkRJ?=
 =?utf-8?B?cGdjOFg5cXlCUldHeTNNSDRTZXV2TEVBdEVMY2lZUGRMMVBQd3JZbXp5dXVU?=
 =?utf-8?B?c0xSdDRaOHVrMEdyRG1vTEJLNUpDUG52dXlwQmRCS1lzb1lZa2pjNEM5MVNU?=
 =?utf-8?B?NUJROHhsV1lyaG14Q0U1bEhiZVd0djBIeGVHTVI2M3VlQzFYLzlpMTdYZjFL?=
 =?utf-8?B?VVJGVGtaTDExZlRZZlU1RnNzRlFoNmJGZ2xEcVMxZys2N1R2VEhVd1VueFYw?=
 =?utf-8?B?Zjh0S1dRLzJzOEhjRjU2Y0JZeVltYkZHeFpad2lLbEpvYkhjZndzQ1JlN1BK?=
 =?utf-8?B?NVNlaG0xYzBEWjNPa3VqL2MwdElTUEoxenhCZVVkamVCMmdNUEF0RFlwcUJu?=
 =?utf-8?B?cWM3MjRFWFlSSjRxc2ZUMTNZcE8vNGh3M3ZiUEcyTmFJUHpkZ0JUWTV6WlNt?=
 =?utf-8?B?azlncWRPTjJaaE1QYkFkd05ITmQwZ1E1SXl1UjIyczhsUCtLQ1M3ckh3Mlly?=
 =?utf-8?B?MkFPeTRYZ1YwVzlVa3pvOWg3a3lreXJLaGhYQU1RaGdYM2JjbGVEYm1kbFhQ?=
 =?utf-8?B?dGhLcVp2THpPeVAxM2EvVzFxY3FCdXdqYy95V21qR2hrUURGRnRTdUdCdkhr?=
 =?utf-8?Q?z+tmQ6ko/RKMe?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6375.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bnRDU1lTNjV1TXNhTFcrYlpNbFY4SGNlakVxY1hWVmQrMW1lb1Z4VllRbjFu?=
 =?utf-8?B?ZHhHKzFkZmhZWndobmhpdXNjdCtsbVZ2YmpyWURVN29aaFIxMXNuYmNienlv?=
 =?utf-8?B?aVUvR0FXL2duNUV0STZJNlU5cXBGNERtVlFDK3RGNVY4ZmZIWXkyTGF1Uld0?=
 =?utf-8?B?R0g1a3BPM3paZWRsaW5NMHYrMVk0VnFmZ2Z6YStjTFRwMG1SS3ZzV2dNTU1p?=
 =?utf-8?B?NGV3M05VSnk2NzNGbW1jYVNHTEtrNmxQWVZtUzA5NldLVlVXSm9aNHpvUmp6?=
 =?utf-8?B?RHZLbi9rc0dzdndHUHhvN29yRUhHVllxUnB4WVZNQVpGYlYrK2IreTdTUTMw?=
 =?utf-8?B?Q3JlWlpCcERZTEl5WVJleVhWdEdWdmtUSTluQjFldlhtRGtURGdvbGVoYTNX?=
 =?utf-8?B?c1BuYU5GczBNcHNwM0JreURhUFUrL0hYdjh4OUNDNTNGamRlcHNOSm5xTmN5?=
 =?utf-8?B?MlliZmIvTlFHN0V6SXRNN0FCOXZDVXpYK05xSjIzb2FuOGU0dVRnTVdGM2FT?=
 =?utf-8?B?VnMzQVB0a2E0blgyNVgzN3lJaHpwSEE0MzQ5RUdHNWd3NFFFeUJTMUZFdGg4?=
 =?utf-8?B?czF2bjZ0bG12L0RicnB0MzdQOEJqRGplOHF2T3dwMERGaG1ocGJQK2ZrVnNW?=
 =?utf-8?B?dXVLd2kxeFdZVHFvaktXV0ZJSWQ0TXlkMHlmYUttVGl6MDMyZXh4dThIUTMv?=
 =?utf-8?B?N24yaXJQQ0YwSzlxZE5wWSt2RzBmbFd1MFJQTzlvZlhWT2pTMFF1UXRpOWZo?=
 =?utf-8?B?dVB2eGZPZXRZdDZnNHFRNk1GeEZPcmxyNkF6NEFGSkRHc21YaG1pV3lqTFgx?=
 =?utf-8?B?UElhRytRNGdDQ1NNZndjeXBQOS9USUZ4UTFQMERLOVpDbHozWXhya2ZORWV3?=
 =?utf-8?B?eElxbmpoQUc3cjM4KytKNXZ1WW50NnZDSlBPVDNTL2o5bXNQbDRqa2dKTE1p?=
 =?utf-8?B?QU9LeG9md2gyMU9PK3gyNU16cDBNNXFCQXozaXhjZFNtS0hyNStIWHVPRktN?=
 =?utf-8?B?N3RuVHpnazhFMVd4RG1iZDJQdW9uRzcva2taR2Jacmt2Y1A5SkNtOG5ISVlF?=
 =?utf-8?B?TW1LcVRzR1FKOHNjdTdmRm1QWklVNVg2cXpYWHBOVFhXMmlQVEtwYUJLZjFW?=
 =?utf-8?B?TnRPaVExSng2V0d5ZExlRU1Wdmh3QmFwM1c0eUJNUitmMkFJYlBGQXFEaTZQ?=
 =?utf-8?B?WEk2UVZiTDhSeXhYYVBncjh2S0RxTGJ0YWN1bndnZDlLN1NuZHE2ZE5EK0Yr?=
 =?utf-8?B?dmZhR1dIZmpOU1RnUXhWYUtrTnQwZkNxNnJkNmZLc3JZYmJNank0SGlxT2pa?=
 =?utf-8?B?V2VyUGhDZFFnLzFUQ1EwTlBBbmZyZC82ODlhVTNXMEFzTC93RjRaL0NMYmdX?=
 =?utf-8?B?SFpONmpQMzRZM2JKSUg0SHljbDc4b3dwUi9PNUZ6MUppOHlWeVdCdDE4TU4r?=
 =?utf-8?B?Nk1OZ2p5eUtVNTE0ekk0T1lNc1U4RlhIemVaSm1MVEtrY0ZTYjVCR05GRGdW?=
 =?utf-8?B?c1JvZ2xwaTRCb0JSSUQwejVPVVltb0ZueWtOSS8zWTY2K1Z2bExicnFvOVdH?=
 =?utf-8?B?WGZKc01UMW9aRE9RazcyQmhpbkgwR2FlMXhwUzZDdW0reEkwcjgrU1F2aWhF?=
 =?utf-8?B?M3hjcUhwZG5CL1V1K2hiL0lWSUN3UFE1d0VjVjU3OEw1VkN6Uk41S0liYlFz?=
 =?utf-8?B?T2VZNWtGTDVwaVdYQks1Ym1tR3NXejNNYkNML2dQcE44U3o1d0tHTm5UNjFM?=
 =?utf-8?B?MkRaZ3Zic0JQREhWdjl1SmpsREYvVHZvc0hGMmx0cmE1L1pLQXJ2KzArUHh5?=
 =?utf-8?B?WW5id1FrRjlnYy9KRHUzdE9ZR1BaQkR1N3M0RndvOUZYMXk3VFpyencxZWNu?=
 =?utf-8?B?MUlXUW10NUlkbHl2YWo3Yk9oSEZWdTNLeEZuMDJxYUhsSWh0ZXR1bXgzc001?=
 =?utf-8?B?RlNVcmFzdEJpamtYVVQ5bkhLVTRlSjdSeVFGWVFCSm5vM0tGSUxhR1prUFFa?=
 =?utf-8?B?UktTVHN6a0RTS2ZVUGxpN05kak52UjZBeE0yWWlBWjlmYnpsMkp2YjNTT3V4?=
 =?utf-8?B?ZkxtcUxpUXJqaGxQMWVGdVJ2aXBZZVVkSzFuS1BJZHdFeWs2MnBYUysyeklU?=
 =?utf-8?B?bU5CYTRxVXpOWjVLb3ljbDJ3RU5sMDk3ckpFaFp0TWppa2RldDVoazZlQ0Q2?=
 =?utf-8?B?OHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 12dfa601-5224-406a-d30d-08dd34c8c0fa
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2025 18:24:59.4691
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z91I1H3pmceSSEOsCkcwCpg8MQAlJCHDSZgX7WwYHrWsAWp8TKQ9uHP5OegTWHt1L5MAEB5s0xGTFqDPQwuI10pUkSCliaTS7/RYD0G9fQQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8020
X-OriginatorOrg: intel.com

On 2025-01-14 2:15 PM, Takashi Iwai wrote:
> On Tue, 14 Jan 2025 13:58:13 +0100,
> Cezary Rojewski wrote:
>> --- a/include/sound/hdaudio.h
>> +++ b/include/sound/hdaudio.h
>> @@ -577,6 +577,8 @@ struct hdac_stream *snd_hdac_get_stream(struct hdac_bus *bus,
>>   
>>   int snd_hdac_stream_setup(struct hdac_stream *azx_dev, bool code_loading);
>>   void snd_hdac_stream_cleanup(struct hdac_stream *azx_dev);
>> +int snd_hdac_stream_setup_bdle(struct hdac_stream *azx_dev, struct snd_dma_buffer *dmab,
>> +			       struct snd_pcm_runtime *runtime);
> 
> Will you use this function by other driver in future?
> Otherwise it makes little sense to export this function.

While we do have some refactor-related plans for hdac_stream.c, I'm 
treating that as a separate subject and thus exporting the symbol should 
not be present here. Sending v4, thank you!

Czarek
