Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C8923A7581;
	Mon, 30 Mar 2026 08:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774859643; cv=fail; b=s/5cNhsYsqWmwyOM4gxKwwzSYscD39uWIbPqW2iOhg/ui7RNlgbJHR498rc+Zk4zWYlMjT416pg8XryZBTq9Bys2hRyFOe2cwnyCY3CeUAnc3grU9ftDZN5MIZuJBA7kW+EbokV78I36/19YMkSKVjvpaSqcO+8N1deHVAFEkBg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774859643; c=relaxed/simple;
	bh=kAAC+T74Vh4yHlIXLX4sHRyUWLoZDsdh7/zaFKh2Uto=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=q1MV3PKVOnKNRINpWtqByaGbrjubq+QJgKI7lp5RjVn7Xdm/j3kWeoS5pmm7YyaBoJq/guMuC9ADNIjwE+WKAQWDDjrhVHvzGTUHN4S+dGBLP499bXTBl8Yur2e3EK2i0JcBbDK2/z8zt3xnbwN0+CUqBM2AJCTnI/ZOAyOyqzQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Al+gp78u; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Al+gp78u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774859642; x=1806395642;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=kAAC+T74Vh4yHlIXLX4sHRyUWLoZDsdh7/zaFKh2Uto=;
  b=Al+gp78uV9GsoPDoLG9wvGXRVhjn60Yyc6yIvJhavB75mgYm43MCaAe/
   +Y1iJW51sAGxP2BqE5Bvnj40s37lq7SEFp6oYiKBrTgqgyGuCoZLnJz+9
   jkDe8zR1+fFU5OFgyEUq7jYlLLC090+rPkmRrHXEY9lE32GKgZ162e4Fq
   DkvCG4xCYPefR+P5lZWCp8PEUb14n4V9FbIYrnQWUzGUVLuWrz5BqAc/W
   I8V/NZHQzqN9v+wq4MvJoMuSPmDZsNLY896s6EQxQ7B5BkO0rsh6JfB2g
   0P7DqcUkIfNonu63Y2PgiuDOvuuc/Sm5q9WBmOWqvtyXddTLEJuwbxiSG
   A==;
X-CSE-ConnectionGUID: 8B18bxA1TjSZR6idk68Y1g==
X-CSE-MsgGUID: YeYGH74nQhGH22z1GrdeZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="79748258"
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; 
   d="scan'208";a="79748258"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 01:34:01 -0700
X-CSE-ConnectionGUID: SM+xJ/uMT1uamAwCZoQJFg==
X-CSE-MsgGUID: ELRkIgg2TrSYGXyfsZqycg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; 
   d="scan'208";a="230054049"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 01:34:01 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 30 Mar 2026 01:34:00 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 30 Mar 2026 01:34:00 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.51) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 30 Mar 2026 01:34:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i+9jpEzGIoNTtSob8NWFJOqdXwkLQDDxgHORV+YOH+zfnxUIK3tudSDozE18vI6f7VIdsS/ivHdTNrFVvrlQPi/MroVDStR98lPZEHZmXjnaW1i9YLj2Ms2pOW29Y5r29EgrewGFl+y14aXc4Mif1cQXGOTe/2BwooiOKVJLF+079oO3bpkj11ndOcyBN7bwajZ98jI4dpNImvgrCKokduZ9qtqrzB4Pneh2pilfzLitvIcthRmskY2fMbREoF1jpjbtCX9Q2R+SzcJLWsUO5jKFI1ZDL7ecW32+REYevQg3dGHhsR5gq/ZWNo4Rrog67zjU0edFAJ/l1eWsDa3tbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GlWraN8ADEXkiZ/zl74wNhqGOims2wXxHF+PMxUw46s=;
 b=Ihx41KesYpU8P8ASJ8o4kFg5bMEYlPtrXM/TtTj7cl8nTMMfSmuJM53dGCLMqPp/vBQ1ILJry0/zvW9yibDL/hLhmJFNxpiA3GlEjH/aK+fzt+v4dOih1kJPB2ufMHSCeXBdpTashZnwMD2zA+nBk5eC8zdG8KyQBFY8jKiGzP29fYNVgp3mxT4sK4Bv1rG6r4yTTei1xFp7a3O4N+T0jL8Do8awIHT9pb5LfHRC6JW4jdfsnqW6GvGBUg5ISdoKd2XGY5dnubuKBqvpPGFXi5rPtjTmQ95zUTYQW0e8qwuisSuuJvinhwQPzmh0FdhGIN0dBkGLj5wULyYESUHV8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8283.namprd11.prod.outlook.com (2603:10b6:806:26c::16)
 by CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Mon, 30 Mar
 2026 08:33:57 +0000
Received: from SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::d18f:6b38:584a:214]) by SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::d18f:6b38:584a:214%6]) with mapi id 15.20.9769.004; Mon, 30 Mar 2026
 08:33:57 +0000
Message-ID: <8ee3c081-cb33-4d6a-94c4-6c7fc1ba734c@intel.com>
Date: Mon, 30 Mar 2026 10:33:50 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] ASoC: Intel: cht_bsw_rt5672: Fix MCLK leak in
 platform_clock_control
To: <aravindanilraj0702@gmail.com>
CC: <liam.r.girdwood@linux.intel.com>, <peter.ujfalusi@linux.intel.com>,
	<yung-chuan.liao@linux.intel.com>, <ranjani.sridharan@linux.intel.com>,
	<kai.vehmanen@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<perex@perex.cz>, <tiwai@suse.com>, <linux-kernel@vger.kernel.org>,
	<broonie@kernel.org>, <linux-sound@vger.kernel.org>
References: <20260328052556.434191-1-aravindanilraj0702@gmail.com>
 <20260328052556.434191-4-aravindanilraj0702@gmail.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20260328052556.434191-4-aravindanilraj0702@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0253.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:8b::12) To SN7PR11MB8283.namprd11.prod.outlook.com
 (2603:10b6:806:26c::16)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8283:EE_|CY8PR11MB7828:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d95e73d-ed64-42af-08f0-08de8e37158e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: p69UnshXQLX3Z/c+Yq5NsfVsPSqMUyYNGkOVbX6NkXpeSaqi7aVlgIZ8/55s3PkF+PvGsYi5B51F/SvrPyH08uLich3/arO6i9tSnalojZZDpEbvzOwskwAbhpMt64jXsbe3w8u0PTdRlayECV0aPQ7CVV3KETAxUgwG2xu1GTvj/xUXBD/ESkD49a6nBTXZj4gNZFgC7oShRF/L0QYkIjWtcrG3BNQedh3NRNP6z2Ul1S9h9aCcIOBrRqGWrixqjTVrsf4UQLuhBD26h4VvP3iK4FbRM1BRumFBlh0/RO3Mr3pqrGMPqhw74QXGrJ4WZvp7HyYElbLVrbL71Wbi5lrl0VOgp7sybF61Y/pRxfHG3mWnWhmv0W6NfJGEk7HxWxzgb8tLvSuKO2K7fxdHXhLJOsnCBdR9LbKvRizjOfr8qhchhX2nolVM3wKYsVnnFicwpwJ5ZDbxjOrsNr9P75qqor57ieFPeNs4oTuv2L1p0oyqusrk0UnvG+Vk+TMzyChnGr+ZikdIWQfsIuKrNVh/h59kBDPq6Two0agWePSbOzUQTDOFh+srAS18ccmDXgQ8F2hROVsXqAeEpvSKkCJxeB/e4nVbB70S/Kim4j9UOGPI0f1tJZJYmiNKvfUL7/Uppz3CqZE1kHKu6p9nRC4XhXgzGJcvb2AUwm/faRUEpNcfnTQCBy7QmnsuFLjKW178nqNGwgAT59RbKhWGsKYaWYACB6z0lO+mmnZNTaA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB8283.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NTFZTzMxdWVHTG5zOU1Mc2lIcFE3ampmWFk5N3JCdndMK0xsb011KzY3MVNm?=
 =?utf-8?B?NlkxS2l4WEJxRlFFVElCMjBNeXpzSmZobjFwaG1xK3hiZ1RxeGZZVEhTL0VK?=
 =?utf-8?B?b0E4R25wK3B5N1VtQkNBdS80b2h0dFlrc2JYY0pYamRoNGtraGdBbFJjdG1C?=
 =?utf-8?B?bVkzRnllNWpCMXpYbFFESmpnMjRBeFpwcGwxUWNOYmJqUzZabjhRVW52UUtN?=
 =?utf-8?B?ME9Hdk1HSFVCcUk4VG41YUdjVStFTGJ0RmFDRGVUbTZQM0hYVGMyZlFWVitC?=
 =?utf-8?B?RXZXSjk4UDhlcy84Q2FFOXBJSmlZam9RR2pCcUJPU3VlSGZoVHJVL1FVK21U?=
 =?utf-8?B?SUVxSVRIOVhSdnVEdzJTa2s2cGl2MnhqSC9xQUt4VE9jZkNZVkg4K29xRm1i?=
 =?utf-8?B?VEhuSUhTZVY3UWV4Tm94MmlxNEJFZHdaa0o4d00rYW1sNFJGWDhrdGNKWkF0?=
 =?utf-8?B?WDdXMWh1TTFzWEFBOFg1d3hQUms1SEM1cTY5d1ZSUlJwbk9nNHZsNk9iTmdj?=
 =?utf-8?B?T1JUVm9OVHRkbVdyTzU2a0VhYlExdzQ5K3BIKzBRQ0VXWDlLU0U0SGtFRUs3?=
 =?utf-8?B?ZjVnbUNtQVpKMHBoRlZrOGRXR2tqMzc1dWJDOGR6cDhydWNnekFNUFRoS1pi?=
 =?utf-8?B?eVNNSW5zTThVUmFwZnYyWDM3RkQ1eDVGdnBJTk82eUt2R3ZnNVYxWEZGOGJO?=
 =?utf-8?B?NnkycklmVUQzcUU5YUczQUIxOG96a1JWYnAwZlR0M0xXRE5BejY3UkNhcG1x?=
 =?utf-8?B?ZStubWVvUzNpWXg1Qy9Xd0VaZkVyd2owbk04cEVlWTllQ0NuSGF3WGRGcnEr?=
 =?utf-8?B?OGNNUE8yRFJPQ0ZVeHU2Y0RXd3d6a09zeDJ4amxpRjlvVVNTWE9xOXdrbjF0?=
 =?utf-8?B?cEFxZFZhcWRKQ2hSbnNJN21OQjJ3enZJMVZSdzJrVGZxaW9zUnREMkRMSWZx?=
 =?utf-8?B?dUdSa2RScHVXNHY0cHh3NFQyRmRlZGNKUThaSERFcVgrTDFpckJyOHVRZmpZ?=
 =?utf-8?B?Vy9yL1FVczdVODVOVTNmQkhiYjBtd2NoemVmWmRWMUNLZnlUNFFYTjkxYzhV?=
 =?utf-8?B?MHViZ2xBQkhBeDlpVmYwbk9qNlVGanNHbVEyRkIxZEFIMkNXUkRoYzVMME5R?=
 =?utf-8?B?ODZYVWlEc0E3VHk2ZERxeGdmYVBIbjB4cHhtaFAvcU5BQWVJQVlMSWRYSEY0?=
 =?utf-8?B?UTFIb3JlUmVTQ3BiblFwbWd3S0ZMZUxvSmVlZ2gzSFIzOHkwL05HSW5EYmo2?=
 =?utf-8?B?RE1CR2IzSC82czI4Z1d5WmtmNTErM2dlWUNwV3B0OWorbi9pdzFrbGZCR3Ju?=
 =?utf-8?B?dk1mdkRweUpnZzdQNkFrbS9EdUxvdmVrTVpOaFdqeDNuOHFhaHpmSnJuSHFl?=
 =?utf-8?B?d3NmWHVQNWpUUVc0VjZUdjNHbUw5QXlqYnFsQzFnWWJiTWsvYmxKUTB0dXdE?=
 =?utf-8?B?TnRoWmU3em1YWi8xZTlkb2dwVXlVeVBwY1lKREZjRVR4VmltY2VmY21QUnFM?=
 =?utf-8?B?Qkk5cDQxVE5pZUZySDZKZnd3dXRWYzRZZkR3YU9wRTdKTmtnN0tNL0pTYmFW?=
 =?utf-8?B?UzNvTWlHY0dmSm8vc0JJYjRUVHpTcXh1T1lTVzFVYTJ6OVVhdUd0S1FzQ1Nx?=
 =?utf-8?B?dXhrYlR4QjNpTnJ0Q0puaUpTby9qeWwxdUx2QkNnK013Q1V2dFlYeTdkR2pn?=
 =?utf-8?B?cjZ6MnpUcm5nYTU4UXo5SnI5RWt0SnBCL1pzZG05UzNvSXZNRU1iWVY0a00v?=
 =?utf-8?B?Tm85NHJQcmlWYUVMcUdvbElhWXJST1dMaHVBM0FsNGpnUDlWYXRURC9lQ0d6?=
 =?utf-8?B?TVFQNElqRmc3NW5xNWpXN2xLc3JTSE9pWXNnT3l5Tlo1WWphVSt6emRteElY?=
 =?utf-8?B?WE42cG1JN2ZvekxOYll5a1VHR2o2OU9lYWZ1SlI3aVB1UDE3QzVVeFpmWDQ2?=
 =?utf-8?B?UXF4cDBkU2RrR3lhL0dFNFc0U0FOek00OC9Ld0o5TFRadjlqSkhSWnJpZ09G?=
 =?utf-8?B?QnZ3MDEyL3ZGeFNhY0pKNzNTZTBlMUJYeitUUFg3emNNYXo4WEdzQnR4Sjh6?=
 =?utf-8?B?SGJZSXE5cTB4QkdyL2pSeHNJZEtselJJZldYVE9sNGJuQ1RrQXVmcXlJMm5r?=
 =?utf-8?B?Tnl2dXRBREtPa0hxTEZsc1hzNnhlQ1VzRTU2Y1BtMlhwTUZEL3dpVUVrTmRu?=
 =?utf-8?B?ZVR0QVphU2d4RDBiamdWanQzZzJab2lNZktXVXNlTUxuTmlLd3hXeWRZdlJv?=
 =?utf-8?B?cFl3ZlVzbDFacFVmbDlsU0Jvak53R1dIdG1JVGw2TEtaMUE1MWF1d2pjVXRG?=
 =?utf-8?B?Ums4a2VMbUlBMGIvUEQ4RWNlc0VwMzJvdjd0enVDTkpkRkRGREdnbm9SMlJs?=
 =?utf-8?Q?9eNmppce/Myyv0HE=3D?=
X-Exchange-RoutingPolicyChecked: vGqbr0BNLgUc7gvMV5CzqRPk2EbBB1RwEE4Hj+malzDd0o4gg+ze+DPbW2cCULZYyrqRVMm/cl43rndPNs5Vceyh1aZCY4tc7XsHGQC4jkM9fOM60Xj2sCLHwmw/wrxTKI/Y7gHRd5ax/G3Sv7+MKkic+7eHxbqDCWT9CsEwMbFBdJSDK8gfn04ZCqMNzeqF1poY21IJZT2sbGK+qSWRkRg3DmvjIs/wedZO9CKJqx5fWqvRIkv2uPu1NFm0c7PwP4FIrCZMO7fuQwFsbMyN4E2dqu6LBGhjvobvqLDwOTAqMJ3wnPCLlB9sakbLyZos+ETFe7I921lnMlsNcXucIg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d95e73d-ed64-42af-08f0-08de8e37158e
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8283.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 08:33:57.1189
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7mGjqnmiApc2CrRjggSdpLHggGF4EkXCyWoQnJR0IGo2lAum5zIO/udtH65MQRH1t5HnWuqP4HJ+9UVIeP33lEoK57tqGAytOTmDRSPFyks=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7828
X-OriginatorOrg: intel.com

On 2026-03-28 6:25 AM, aravindanilraj0702@gmail.com wrote:
> From: Aravind Anilraj <aravindanilraj0702@gmail.com>
> 
> If snd_soc_dai_set_pll() or snd_soc_dai_set_sysclk() fail inside the
> EVENT_ON path, the function returns without calling
> clk_disable_unprepare() on ctx->mclk, which was already enabled earlier
> in the same code path. Add the missing clk_disable_unprepare() calls
> before returning the error.
> 
> Signed-off-by: Aravind Anilraj <aravindanilraj0702@gmail.com>

Thank you for the fix.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>

> ---
>   sound/soc/intel/boards/cht_bsw_rt5672.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/intel/boards/cht_bsw_rt5672.c b/sound/soc/intel/boards/cht_bsw_rt5672.c
> index 359723f2700e..e5806dc16ff9 100644
> --- a/sound/soc/intel/boards/cht_bsw_rt5672.c
> +++ b/sound/soc/intel/boards/cht_bsw_rt5672.c
> @@ -67,7 +67,7 @@ static int platform_clock_control(struct snd_soc_dapm_widget *w,
>   			ret = clk_prepare_enable(ctx->mclk);
>   			if (ret < 0) {
>   				dev_err(card->dev,
> -					"could not configure MCLK state");
> +					"could not configure MCLK state\n");
>   				return ret;
>   			}
>   		}
> @@ -77,6 +77,7 @@ static int platform_clock_control(struct snd_soc_dapm_widget *w,
>   				CHT_PLAT_CLK_3_HZ, 48000 * 512);
>   		if (ret < 0) {
>   			dev_err(card->dev, "can't set codec pll: %d\n", ret);
> +			clk_disable_unprepare(ctx->mclk);
>   			return ret;
>   		}
>   
> @@ -85,6 +86,7 @@ static int platform_clock_control(struct snd_soc_dapm_widget *w,
>   			48000 * 512, SND_SOC_CLOCK_IN);
>   		if (ret < 0) {
>   			dev_err(card->dev, "can't set codec sysclk: %d\n", ret);
> +			clk_disable_unprepare(ctx->mclk);
>   			return ret;
>   		}
>   	} else {

