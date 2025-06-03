Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D0D2288CB
	for <linux-sound@vger.kernel.org>; Tue,  3 Jun 2025 11:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748948600; cv=fail; b=qXytd6TgmVkqOyeubNsi0dSh09GnAEbjLHJgCmxvwtkwhWf+wX2oKMZAxKwTHW5hcUlcnvuHhKpIOoTAGBpmX9AgCFX6DCLJmiDN6JVezMAE8i9fN/mdG1cGL4P1Q0mE6auMeIsAjakmg8Y7MNlrX2tHDUdmiTi74XlDvPElxdA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748948600; c=relaxed/simple;
	bh=oi6jVgpeeyrg/bkhCY4awWPFqryOihVdWQSqWzpZV3Q=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=BwzclunhPjom11QNG4ICZ8/809iUC6M24QLPHoLp8Jhx2bHP/QdWLIQA87RfEABUtl5bD9KvttEOIQvhLY6X9NyO7e3+qQMe86I0FsIKCV02iel3s3a1zl+5mjtWR3FQfYDUuYpKN9o7yWjPYCE6Eq8EXdk085m29+NI77GGztI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BU0pAAc9; arc=fail smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BU0pAAc9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748948599; x=1780484599;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=oi6jVgpeeyrg/bkhCY4awWPFqryOihVdWQSqWzpZV3Q=;
  b=BU0pAAc9wUnQ535s+x6yq/N5t6d8f62Pmnm89AFmcOJjTEJWxFgyAj/V
   usi0/VHFwQFOf9E6vcquwHeo5U8prx+6C5jzdMz6pFFqG1LQ4HrHzKcip
   mo0mzuNUsxCbGXNuQUQgymGuNBPpKOV8N+IHLzdeiMErEpN2cjBPo5HIf
   p3NCtcme5+fsjEaMy7ozur3WKPQQLA+Hcm2ScJuixs2QmMe6ehk1WDp8M
   qVe4iRDWmRmWNWq3dYhahqRTcoWczo8xXxHpP8gcEyokNZiRqLN5wbji5
   w0wuf6FLOCS0+F4L5UguVhJFwITpuKrhoh3tCceRydrIOd2i3Mf7hOXdf
   w==;
X-CSE-ConnectionGUID: Ls5jaJh+StmVDylZzPH3ig==
X-CSE-MsgGUID: JNlj98M3R0qSsIIOhRtvOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="61603164"
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; 
   d="scan'208";a="61603164"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2025 04:03:15 -0700
X-CSE-ConnectionGUID: WKOOQ9poRH2tZcX0O8Uu5g==
X-CSE-MsgGUID: PPI+1Q+yT3e9hrKIvXBX8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; 
   d="scan'208";a="145798627"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2025 04:03:14 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 3 Jun 2025 04:03:13 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 3 Jun 2025 04:03:13 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.84) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 3 Jun 2025 04:03:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bSKA/lNOmQMu0U7K8IYsVIGPrxHGEv1IPmdHP4OiaOnSRhAV58sDZwIp0emBsWwLOTgsPU5+bYupaL3kYIufEYGFqy1tjNApvd0RE9LNn8DofwT8uPIOq9xBfvJbUoYpoYJNKa3wHx6CeOeLHwFMN6pUDeGpPIPzIBn4NundyRY1RN95Yf40FuvqCBcphv5VeVs6YBl+PZET+Q81Kq+wUPBUi9lAgkPRx4MrLNVN+EiMVLUnoQzfW/QhUXuClfNa2i7t3nZr0tq/uAJfzO2+a+QmJt7ScnP36bLjzQ8ciNk+5sPivFfcGq0MkABFwVmZTnsdNJU5OHZ6iZfW1629Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i3tcgj0p2rc80RkxkeCdlv7VmufsfBXfYI3M72dW5dY=;
 b=lpJFwE5IpiICEO8NQPdjP+vglkqAA82r2eO02c+UmnyuM6HQBAqmUBskfiIW5/KgeDL0lRqOBelZF9TjAhYCgwenWI5HPTAtuJboocgMERmLL+fR6YPH2nP4cU/uglTMordQK41k4ClQU/IHBNPx+tiis8gJiY7Y5bzvK2DffaHfyMPmwEpWkqzv/AAEFs6qkN6NHW12Rg9Hz/e5Zm2p7qKh4baNTZNFZf9b4LdwZb41SpQpCzwzYBqQA1Q83HAB539X3gns5W3vNRFHau6+s7W4nOMQvdR92Lar/t8SUWuJbL2Nuq3ix24gBzEULtfktmv76h+FZvp2D+V8sbz8Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8283.namprd11.prod.outlook.com (2603:10b6:806:26c::16)
 by PH0PR11MB5109.namprd11.prod.outlook.com (2603:10b6:510:3e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Tue, 3 Jun
 2025 11:03:11 +0000
Received: from SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::3:e0a:87af:d4b6]) by SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::3:e0a:87af:d4b6%6]) with mapi id 15.20.8792.034; Tue, 3 Jun 2025
 11:03:11 +0000
Message-ID: <43b4c6fe-1004-41aa-9943-f92a2efd4d4d@intel.com>
Date: Tue, 3 Jun 2025 13:03:06 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH 0/9] ASoC: Intel: avs: Set of functional fixes
To: Mark Brown <broonie@kernel.org>
CC: <tiwai@suse.com>, <perex@perex.cz>, <amadeuszx.slawinski@linux.intel.com>,
	<linux-sound@vger.kernel.org>
References: <20250530141025.2942936-1-cezary.rojewski@intel.com>
 <174888256446.96622.6929185418537717818.b4-ty@kernel.org>
 <64f38617-c8c1-43b2-947d-5182321d8f6f@intel.com>
 <b8f4cfcc-4cc1-41a0-befb-f069308005df@sirena.org.uk>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <b8f4cfcc-4cc1-41a0-befb-f069308005df@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR07CA0246.eurprd07.prod.outlook.com
 (2603:10a6:802:58::49) To SN7PR11MB8283.namprd11.prod.outlook.com
 (2603:10b6:806:26c::16)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8283:EE_|PH0PR11MB5109:EE_
X-MS-Office365-Filtering-Correlation-Id: d7c2e70d-be0b-48c2-8ae8-08dda28e3ac7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cnBrV0JhdVN0WWZGRThGNnlENEZCQ2lpRDh2aTVMS2d2SFRNL3p0WEhTN2N5?=
 =?utf-8?B?RFZSclNLdlVFSzhmdERXNTN6RytYMWZaY29Za0NPQ1B4blJnTWJ2MnlFZFg5?=
 =?utf-8?B?TEdXMXBXZXprUEg0WnVNQVhBZ2pFZnVVM1ZmSzNmYk5NOEdMSXVzV29PRklX?=
 =?utf-8?B?aFROM1JqNWhhQVRubjBMWW9xbGNIMG5FYWk3ZTIvZHl4czBZVmhES1JFMEZ0?=
 =?utf-8?B?TjVoK2Q4V0dUTis1cHhPdVY5MXA3eSt1bUhmQU1LMzlxSlBZWk5PRHZ6RWIz?=
 =?utf-8?B?V1lEdHZueDNyNlBJdGdDUkhLTVFUaXdmTTM4MWxRY2ZncWxYUFNQL1lXamlB?=
 =?utf-8?B?eDdjaVFwTGpuUkNDWWpydVBIOURSaVVMMGwxLzZsVzZ1SGRoaXZBQUpJTGpS?=
 =?utf-8?B?TDBEMXVmSStneHVyd2lqZWt2QnhsbTU5Q0ZQMGJhQVBMWkh2d01iSzMvT3hl?=
 =?utf-8?B?c3NVZnRTaUZiTXZncnN5Si9XOEVwRlphRHh0RmdxSm1LUkxsL3RiZFR1UzNo?=
 =?utf-8?B?T013Ukx1cnJiUE5zQzFGZmhzOTlwOCt0OTl1NkFBYnlpZEh5ZThtK1lxeTYy?=
 =?utf-8?B?KzR4WDZKTFlPSjN2eHZXeVU2R3ZlT2V1NVZSVk9WbjkrTzJFUkhFa2xjdWV2?=
 =?utf-8?B?eXZKZ3p4QTl1ekV2Zk56UitKY1M1QXk5VU9XcnhuNU85WCs3blNqM0hNQnhZ?=
 =?utf-8?B?bWMzRWRUNjNzbzhtWHFONGZ6VVFxRmdxWThMOE1ETG5rNFFLM3VxMWlCdFB2?=
 =?utf-8?B?N2N6OTRBWGtYb0s2YUtjcjh2T1pEcFpSeUtBbWdmQ1F4VHpMNHlZYTg0ZytH?=
 =?utf-8?B?QTQ2VkFhVHUvTEN5eWI0enpKbjR4eFlkWTA2MEFCK3FaSHUrdE1zL2k4NzJy?=
 =?utf-8?B?NjRxMk95a2g0VHBYNlhNY2puak9ORXFBdE5QMnZjTWFUSHNHbXpWZkRjakRS?=
 =?utf-8?B?UDd5NkdCQzErbUZ1R0tDRndBMVI0MVVqbCtDSmUyeWpBVEw1c3MzM2xkSHZh?=
 =?utf-8?B?MHpZNEdjTUZWeC9kSENOOThvdTBLU2pPWmhsVllXSWJzbmZMR2R0Q3dkSHNL?=
 =?utf-8?B?NlhJRmRnTlNOaUYrL2k0UnFHdnlEakxCTkszRi85SVdNTTNnbkdhZnNLVWZR?=
 =?utf-8?B?SjkwU0M0RnJwUXpRWFFUMUxmcVdMQTErbjJUZldabVd1UDg0SlhaODJXZGQw?=
 =?utf-8?B?Vm4raHQ0UXBadFRTSFpZbHYzQW9rUFZ6b1crM3JhT0FPUlQvMitOdm1Ib0tj?=
 =?utf-8?B?ZFp0MGNPbXY5RERGZVNIVzhObFNqRkc0UlRiSmZ5Z2wyUnM0bVZzSm1GbHF5?=
 =?utf-8?B?L2tOQm9DL3F4L2F5YnV3d0JkbUF1ZkdQWGJSbW43cXZpd3E3SEQ1STJ5cUhZ?=
 =?utf-8?B?Znk4Q0wvSE9JR3BQRi9CQzJqeVlPcVJPdGpyaDRMT1o0SWNNRGZSdTZKbFNn?=
 =?utf-8?B?QzQ4cEJaMDdoMVlJbFZyYi8wR2JjSWwvcFVTVUVKbkFtdStTZ21DRW00cklU?=
 =?utf-8?B?OThtNU9OWFF3c3dZUGlocjhKR1Foc1dJZnJvekljRmhMVXREMEpnNTdaaysr?=
 =?utf-8?B?WkxXZjhOcW50S0YvTUEwNzJRKzc0QTY5bEQwSHp0N0hnSWdZMlg2MUZGK2tZ?=
 =?utf-8?B?L1UyS296MzNUalJxYXNPTngzMnMwUkI0Y28renUvZHRhQUU1S1hZRDNBUWRY?=
 =?utf-8?B?ODRCNXBYNmp6cWhhYzJHN29xYzV6eUpNV1BEeHd6M2ZFc0JNSW1aQ1h5Rzhx?=
 =?utf-8?B?bURhTXZHaVNVam92UkFpSTJwd2kwK09STTk0VGtzSFZtc1ZUSHhVWFFjc2pU?=
 =?utf-8?B?UEMzR0ZMWkpZai80ZjEzRnlYMHE0d3FBNnB3bkQzNnF1RmtBWEdMRmR6dExK?=
 =?utf-8?B?RVhQVkVJSG5ocVdyR1BqblRtTCtMM1BMRWYreUlKTmE3MFE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB8283.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RVM1a3c0YTMyNGxVdkFJeXQ2Y0NkZmc4RHhQYm5qNHBuWEhCVXhBWldmcDJo?=
 =?utf-8?B?eXc4MzZoYWxyUHNiMnBLRkZIVzhpVS9ISzI5OG1KZ3pWYVRIRFQreWpIMXpE?=
 =?utf-8?B?a3dzL0RYVm53STRVa0FOb0lIUjh4MWlSd0t3U1paVVpVbDhBOHAxVTdKaWVm?=
 =?utf-8?B?Sis2NXFyWHlha3VFTzlpZ3hFK2xzZG1KaXRjWGxUWCtVNktzeFRHajZia2JY?=
 =?utf-8?B?VnU2TVNxa0xQa3NaMnIwWXpOOEFlS056MEZ5c1JDajJXMUhNK25MYS9HZEcy?=
 =?utf-8?B?ZXZKOElUcGgzSEc1a3hwNnJyVVZCWjQ2ZG5yYVcyUFZpb3cyOW1rU0NISUZx?=
 =?utf-8?B?dW5wb2dhbXlhbzJtMVpRY2dqcDYwQmRlWXdsNy9VRGpobHV5ZVpzcDR3MlFI?=
 =?utf-8?B?UC9nUG5yRm9zQXhqMTVmNjRTL0tPdnV1d0x6dzhYdkw2SHZZUDQ5VWlZd1Bv?=
 =?utf-8?B?RERwc1dKYUtFREJJQU8zQXpYQWg2eXVoWFFLVUJINXBaK080Y2RDVENwaDRr?=
 =?utf-8?B?RE53QUIzeS8vQ1kvZS9wTmlmVmE4Zk1ZVnkwWXhaeXdhbDVDOVhuWkE5WTg0?=
 =?utf-8?B?SExGdFlJdlZNMXJ4LzFreWFsN1V2ekVYamhURGNSVURjTXdaS0RKYTAvQU5D?=
 =?utf-8?B?U1NRUVAzcEpxa2ZXM2tTMDZNRGkzODllRk9BckVVTTgwaEJhdU8zeVRaa01h?=
 =?utf-8?B?K3d0VktGaHBsSXNUMERWL3dtbm9YMnJpeklTNTRadmRyL3FkZ28zbEhSOUxG?=
 =?utf-8?B?SzBSLzhyVGVNYkk0dGdLazNwaWxFRGhCSzg2NUt1RmlScE5nL3lqUnpUMEwx?=
 =?utf-8?B?dlFSRDFEczZFV3c1ZWlLRVZ1OWZraGY5dHFBNzdNeW1XSzkzdUQrSmJncnQ4?=
 =?utf-8?B?Vk9ndUgzQ2c1Y0xmNlYrVkhuVDE4S1Q2UDNHVnFXZlBYV2tpbkI2czFQazFu?=
 =?utf-8?B?QTZYcitHQU1Za1ViTmhCWERyS3VkMk9WaTgwaFQ3L09yTGtVVGtEeGtsdmxI?=
 =?utf-8?B?c1RPRU15Ung4MmphN0Vya2t2NFRUQzZoRUdwRkh3Rm8rc0w0RC9ZeGtadW1m?=
 =?utf-8?B?SVBoL0NZeTN6c2ZmWUs4UnZQNkNBc1l6KzlaYTV5dXVMaE9VbEs3SEZBWU9F?=
 =?utf-8?B?ZTBoZXpaZmF3UUpmNTFWTjlTWHA1a2hqYmpHYStqZGNzV2kzSjVhaEU3L3VP?=
 =?utf-8?B?b1B5M3FnTnBtdW9JYnJ0RlhzTjJ0QnVNdndGNnVLYnljc0ZwdlAwZzZ0WndL?=
 =?utf-8?B?UEMwRFc0bHNUSGl6Z1N3UzJVU2lrQm1jcVMxRHlOTzhxd2loNTlXOWsrSDJP?=
 =?utf-8?B?STdXK1k5TGZIRmlZc3UvWUtVV0g2WG9WUWx6OVNDM041ZmRYT05ZL2ZEVW84?=
 =?utf-8?B?YlZCSko0ZVpGTW9oY3dKVzU0SmNSbWExWis4c3hMRjZMeDB2ZnUvWlFoU0R4?=
 =?utf-8?B?NFlUSEE0MW9tb0tBYVZwSzIrc1FiQ1ZhVmFPWDVUQWErdGwwQlJIMlBHVXVW?=
 =?utf-8?B?SHVTaWFxZlpJK001TTZTRHcwRjREVGJMalhYYzNMZHFNck41R1RtWUxyQ0k3?=
 =?utf-8?B?V2RqRCtTMTNCd0VWNldOZ0twRWNwWEoxbU5lUUswUjEzc0tIamptZ28zTjRk?=
 =?utf-8?B?cUFST2V5RUJkdGo5c2R5UFZaYldWUGhlNkhJS2NTN3o1bWdFK214STNpS1lH?=
 =?utf-8?B?bDJtNCtud00vZHJlUzNsVzVyQUtSQnN4RUVjT2tqRVFabTdXZU84NDlmTWJN?=
 =?utf-8?B?cFJXR2FUNGNkenVvenEwSk5vNmh2dCtQenRiTWc1VFczZFhPSDM0b2xpNXhX?=
 =?utf-8?B?Uk13Q2hvSTlvcXFrbjdNaHNLYVJOMmkyN0NvRlZHR0t3Wm5MbkZ6OWlIMTBP?=
 =?utf-8?B?OHJ0R3JCNTl3ZWtRNFZobFBnaUdWSyt2TkxuZUQ1RHNZNWZxM2M3TCtFSTd0?=
 =?utf-8?B?VkdhcENRL3NrRjZFMzRXMFAzVG5OSEQya3ovOE9aYUdLbDhrckNoWFpwVVc0?=
 =?utf-8?B?bi9oeXEyYXJlR1dmSEUvM0k2V0dxUWl0ekxNZmh5L3RhUFhCNVR0eTJ5VmFT?=
 =?utf-8?B?SVdlMUNqR0ZibkJnS2U1M0ZVNlRPWHFSWnZFT2wrNllSdGcwVnA3eXR3SXlB?=
 =?utf-8?B?c1ZsQldlVmJ6SlV4aERJR0ZCY29XcW5PdjdpcWhsNTZCM0tlVGIyRkVzMzJs?=
 =?utf-8?B?VXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d7c2e70d-be0b-48c2-8ae8-08dda28e3ac7
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8283.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 11:03:11.4582
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j+BFw3FmtJvG97bJgmIImkt0zj7zETAI5qiU+K1f1n8FoPZE9w8FQiE2wNlKENTyzkQsJbkvCM+WmgtjmsOQVoqy2YV+giZIkY3r1AWkE0I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5109
X-OriginatorOrg: intel.com

On 2025-06-03 1:01 PM, Mark Brown wrote:
> On Tue, Jun 03, 2025 at 12:57:09PM +0200, Cezary Rojewski wrote:
> 
>> I've just checked broonie/sound/for-next and it seems the status of the
>> branch matches above - patch 8/9 is _missing_.
> 
>> At the same time, I do not see any reply with reasoning behind skipping the
>> patch. What can I do to help address that?
> 
> It was waiting for after the merge window, though largely a fat finger
> as I intended to skip patch 9 (adding string.h).


It's clear then. Thank you for a quick reply, Mark!
