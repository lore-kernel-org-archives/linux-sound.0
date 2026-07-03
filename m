Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9682B148850
	for <linux-sound@vger.kernel.org>; Fri,  3 Jul 2026 08:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783066607; cv=fail; b=obuPQxv+2rnwQ4aTvPK0p/OgfTxzz2T0Ewigap4VxagvZ0eMb+s6ErwojeGV48glfxd/Vq9e+igxJJrv+4tLA6T/uBu+VpVsJYC33WKvBSGTRCO4oBX1c33iFd3D3AVykvwXu6qaCU5VUattVlBsNEyvTpRd4wRSg3e8nCyDgSw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783066607; c=relaxed/simple;
	bh=WDLut/8Lw4SWrQgZhhAVpOtkPQ3JXClpoF5LThh8mS8=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=GZkGVMbmsvcfOc35Bc4lcZOdwzWqsv43Gl9gbuhLaToHHzrtbw7Lh2I1Q3pNFZISdX1cCnZlxs7SDpgBWXjXsz3dM/umVCq8YyXI/SCidtJYnibsg4h/2w1X8hTBfjMxcfn/TvuaAGcEKqucUeBvVgOQxFhHEbiytGzDMMuPjFA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JNIYyhBG; arc=fail smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JNIYyhBG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783066606; x=1814602606;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=WDLut/8Lw4SWrQgZhhAVpOtkPQ3JXClpoF5LThh8mS8=;
  b=JNIYyhBGO26ta3H/c55NRaw/VODos+KRg7fNQF4ENhIsIwGB9vYXXGqw
   EKqFmh2SYPLirTdLiSCO+v71EQlhKeSuJFD5u+BJb/1oXTs9XtaF3F5qt
   15g3oVDaKsv4cca41iTxtM8+NqgstpEcmkmWSohYH20IHUSOAghO8QlH2
   5gTaHuYxbs7PUuQOnm2rXlI9lacdsiXiUVQcVx5KGI2UV4GDTvCH5JaHD
   YMVdB7RCIiv5dM12SmvJHxlWJkuAh0KfqcDbGw7APdYuo5k1ZQHBJ7OuY
   YQPdWHt9udRtMvKnFUTG6b6FTE5xN1py8WeiwAQfvI+e1gi/f872lAFo1
   g==;
X-CSE-ConnectionGUID: EGERFH61S0CHiOMFYnd9tw==
X-CSE-MsgGUID: BAETg6UvQKOLT0kBaG6h9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="82805571"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="82805571"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 01:16:45 -0700
X-CSE-ConnectionGUID: T5rfC+8IRpaqIV9Xvlhg6w==
X-CSE-MsgGUID: ywRAGDTSRZSU+SNkbkzpUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="256946586"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 01:16:45 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 01:16:44 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 3 Jul 2026 01:16:44 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.18) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 01:16:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qmevPUeHe16jPfSAPHznLFlj28dw1+jkMaIBvzkxYsB2JJ/+WAAGKwi+ZwQQDz6PXHOsu8E4adlgMMTorHwWjaNCCXHWrLu0UutKnPFPkCQsuhqFFexYQqkiI6JbRkgdEcLTM+oHlag7rl9oJMqIUHgVCElAXxD1JJycPAhRf9TK97HFPYWvv4UAM3NB6k3Ia/2L0iRxu42inP1NhnUlQhZXWQKEIReI9ojY19p3ERIEDTSW6vfPG/SzLQGbdCH9bkJwOcOIs7q3EKW1VUhkmTvsRPw8DU2lwFdC3PLmnpHRd4CmXd6sSwreK9jQS7DZnkJNCpnHC0fwBu1ZVtMd/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l4QtOjABRuXlZX7ks6HW7Cup2joPnhh6yo2sUzjGe9Q=;
 b=n7LBrHyA6M8RNq4jnrbEe75BfEe4joYBEo+yE+A22hto2Ae42/nenOK037T5y6XS1SCz8WM2vV03jcTdYrkQSG1ct6deEo/MOgerQ+VlYBk//mAeYmlzhn69x9iMf34/W0NYDgBdL0WLJ1g1kDp17n4UO8HsuoR2MA/mw84yygoUhANMTgeW8k3mfLk9+1iAS5Cge2YWNZy2RgyXPFkWcVB6XJIhriYRspQONfUJUpge+QDZYRXeEdfLU3ZH/LE/c6i7LA7aslSYxiFhdbp1Bx469imoFugQbW4n/6YdHye0fRfXyoYfKJljKNoJ5i2Qf65T8DFREJIVlrwzrunJQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6967.namprd11.prod.outlook.com (2603:10b6:806:2bb::15)
 by DM3PR11MB8716.namprd11.prod.outlook.com (2603:10b6:0:43::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Fri, 3 Jul
 2026 08:16:37 +0000
Received: from SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4]) by SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4%3]) with mapi id 15.21.0181.008; Fri, 3 Jul 2026
 08:16:37 +0000
Message-ID: <7aa11565-9973-4742-9fdb-7c70b664cf3b@intel.com>
Date: Fri, 3 Jul 2026 10:16:32 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] ASoC: intel: use component_name for Component name
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
CC: Bard Liao <yung-chuan.liao@linux.intel.com>, Jaroslav Kysela
	<perex@perex.cz>, Kai Vehmanen <kai.vehmanen@linux.intel.com>, Liam Girdwood
	<lgirdwood@gmail.com>, <linux-sound@vger.kernel.org>, Mark Brown
	<broonie@kernel.org>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Takashi Iwai
	<tiwai@suse.com>
References: <87fr29esth.wl-kuninori.morimoto.gx@renesas.com>
 <d5e3fc22-8a17-4672-ba5f-167d8cab2aa8@intel.com>
 <87se66dyqp.wl-kuninori.morimoto.gx@renesas.com>
 <2965d6d5-6cf0-4fba-97a0-7a97861fbbaa@intel.com>
 <87o6grd4ol.wl-kuninori.morimoto.gx@renesas.com>
 <dfb5efcd-6c9a-462d-85f7-e8fff3ded624@intel.com>
 <87zf0axr11.wl-kuninori.morimoto.gx@renesas.com>
 <87wlvevtgo.wl-kuninori.morimoto.gx@renesas.com>
 <cf0cf8ba-f47d-40bb-8321-47a7054e2027@intel.com>
 <8733y16j82.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <8733y16j82.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIVP296CA0100.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:355::10) To SA1PR11MB6967.namprd11.prod.outlook.com
 (2603:10b6:806:2bb::15)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6967:EE_|DM3PR11MB8716:EE_
X-MS-Office365-Filtering-Correlation-Id: e902b99b-8883-407d-4aac-08ded8db66f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|23010399003|5023799004|11063799006|4143699003|22082099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: pGOB3/czD/EM3MRjr8/0BWXrgZR7NFLjHW/l9bLtffBAmJpeBlVWOPVNTTSwWLhRi6BkTy1W3vntAlhi9K/5EkNPjpB2PfEtlacG+ZlEbMf4zPEK94r2StrT+69R0rfsVUAcLBRH6Xxd9Mwxzfm5s6xkNVqOeTtfCNNr/SKiWFJvPac+bvocB1wu+wlmcA2IZFm0ygrnm3lSeD4r1P9nm1+jOWbzz3GdoXD+DIRARpGpUlbahLo9WTBhTfQboMMwOLYIWXgg4p/DMosloza8l45Vu3Gm55htCTdqbXXT+Whn1TK/3kiyyrfgsI44nOy/kmx1Q+zJ0oS8Cppj6Ffaxuu8n81Vs2u5Sr3HGCmHFo0tD6eSYUEVUE+rGZB+GAjq+Z66cCElU2JQVCDnomar9b92U6lvyZeyPAyjohZDw57izfOCiOPDS5oBU81EZsNwCjjPf29FZUh/GOJjysAlrT7BK5FBoZ34y513bzhMAZcJEwdVpCC9opCH7X1toRprlJLh+wNJ5XClZzF4rL0Y4/oglwquEHv7no1+YBBT+YIMKZr2hcFfLZysQ8gkvM1l2pBG562l8waRCwjTv2W0NYPIes0NuWTasqrEz7vHaRm6xHLg1FcbvZ7rkpM8MUgDAl3JX6DMJnNb5i2t79X4HeFAOSJLTPVQZoHvDtk9ru8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB6967.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(23010399003)(5023799004)(11063799006)(4143699003)(22082099003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bndsYTZLWnp5Q1QxbFh1NUgrOVVVNXR6NXFQZ05OZVBWK3QzOHJqbmwzODVY?=
 =?utf-8?B?OGdpR1FSbWhrdGdzTVJtbHgvL3p3Ynh1aEhBWHZDL3A1USttdlBPMnpLNFBr?=
 =?utf-8?B?cEtQNWE1WHRTb0xhc3B0K2ROWC9iYndRM0JPcFdHM3pzYlN2VGxwWkJOdXNY?=
 =?utf-8?B?ZEd3UUdCUTVsMDJFOUJFOGx5Q2tIcVlGUit4NjNTN2RMM2swcyt0NzZ5OU1O?=
 =?utf-8?B?N0I2ZUora3REdkdnVC84czJMOGpqTHhBbFNSa2hjT1lxMCtod0lVMFF2YWRK?=
 =?utf-8?B?Q1NMR3ZWUEljUTN6QXQxWmNHZ29iVXVVSWhZaTlXRVZYb1NMOTRZVWdyQ1pG?=
 =?utf-8?B?WWhmQzA5ZjE5a1hFdFN4VStNQ3phZXJESXJuelV2VkpoWTlZdVdCZkhNQXZQ?=
 =?utf-8?B?Vmh6M3RFWnlYNmY0UURTMHFYVWRVVmlsdjhwRzhyT05DQnhKTmNWcWV2MFZG?=
 =?utf-8?B?bGcxdUdzcXF2QnY0a2d6dXBZY0V0UWpKbkc3SllBaXpSdENDbW9jMVRqcnMy?=
 =?utf-8?B?VE5TSU5YYjJBT0ZVRk5KWjd6YlJoVmdGbTlBQjV3aGxtb0lCdjJHQ3BXTVVP?=
 =?utf-8?B?cGtVTkU3MEdHekd5N1dkZzZPdnZSQUtWeFZTSDZtakQzRTIxd1hFWWgvbW5i?=
 =?utf-8?B?T3FrMnhkbXJyODk0L2Y4WUc4TFdlR09tcU05NU5SUCtidlhjL2hNMUlvS0x2?=
 =?utf-8?B?SVlXSm9WaWR6dkR0dFVFVXRWVHFtazc4K0NEcGVROGFhWjdDdlhLbkdtZ2Nu?=
 =?utf-8?B?bnlmblpzb0ZNN1pFbVdqbUxPblgrZlR6SjQzbkFpZUVFOEU3bFdac2duQ2RG?=
 =?utf-8?B?S2tDbjdVVTJHTzVhOG1EYUs5T09tT0l6eDIwZlVZQmR3WTB0V0tBdXFlN3ZF?=
 =?utf-8?B?NFo0eTJVWEhZR2oyNVYreThGWkh6T3IrTHM4TVptbDNSMWoyUzBGOFE1NzZQ?=
 =?utf-8?B?YjNhVWxrV0ZpeFlJb09FNGswOGp3NkZ6RnRwUXBsZnkyaXZNTC95SENHR2Ew?=
 =?utf-8?B?ZFBYa0JBY3d5dFUxK1kxNUYvOXRHWjJMNUZWU283dGM2RzIvSUpwWHVtVHRr?=
 =?utf-8?B?dmtwU3I0Snl6VGZNM3VpNTRuSjg4WTFIQTRkMkkvVnVjL0dURXNRdzdZTGZt?=
 =?utf-8?B?UUpRK2h1K1FXZCtwSklQMU5tQ1FUeWdUQUVHS2pJaXQ2TFhTcmthaEpoc01T?=
 =?utf-8?B?WkVnMVJzaG5OWDUxcGtFSHd3SkFNemNZaGs5Z0c1WCtLUVpJeGwyZEd4ak16?=
 =?utf-8?B?WTQwNzNydkV2NWVhNTVrNjZHTitrajQ4RWV6QVBUcmoyaU43R1NLSUREdnNh?=
 =?utf-8?B?Y25rM2gzdDNZTG4yNHNMY0NrK2xmQ0llSExyV0xMd1B0eFMvaEsrbHI4Ykl4?=
 =?utf-8?B?V08vQ0lJODQ2ckFQSDliM2ZjbkVnRmcyRGRaTHdwSk1FdEU1UHB6MGtGdVNo?=
 =?utf-8?B?d0lIbGc4Y0VPM1JYekZSVkpHMStobnA3UE56QVh4VEZmcWpVQ3F0cjlFQlJU?=
 =?utf-8?B?ZFhmK0x5dHpzWmNBdTMrL3NhRlBLOFlUN3prdHRYWStPYitPOHNjYm03QVk0?=
 =?utf-8?B?WjJxYVE3eUNRYXZqK1A4WnRVUnpwQ01ISS9ob3FuSjk3YVZJVlRvdTU5NUdB?=
 =?utf-8?B?UWZsSituMXEvMmpwZitva0dhZlNLV2taYTdaWCtYVEFtOHNyd2JHbTRjWExD?=
 =?utf-8?B?WXBoZzhnQXVYWnAwOFpUaUM1Mnk3TVFvNUR5RzlHM0hJZnErUjlJUHR1RHVF?=
 =?utf-8?B?N29DSWl3WHk5ZFR5L2FYSzEwZjBQbHZoeW9HUTdpb1pvVWNCK0lCQTRIN1Ri?=
 =?utf-8?B?QTdlY0lDVFhiT0d6UDhkMHh4dDE5bEdqbXVSc3ptMTI2Nkt1OGd5WGk2WXUz?=
 =?utf-8?B?R05UVkU2cWFZdUQ0VHlXVU0vM05IUHhNRXhHNlk5L2M0V3B5Y0l6ZW0yNTV3?=
 =?utf-8?B?aXl1ak9LTTlKRGdWZ0NodVNpcUNtUnBGTWM2SElpWVdaSlQwd2ZDMndGTElF?=
 =?utf-8?B?T2xlZjd5WmRya0VobTBYNjZqaDQrWVROMmRIVUsvOTczZzdTSFZzSVpONW9H?=
 =?utf-8?B?OU0zeDVwSmQrYXdkUlViNjJqYmJ6VjdCQmFNdzYxb09OSUN5TGV1Sjh2dWdY?=
 =?utf-8?B?WkdrNndGMkxDc0JwdEE0eXpYZUcyTUtMNk9kVmw4Vk9jRG1TZ3ZQQlllZkMy?=
 =?utf-8?B?dmpSeXM5bnkrT3YxWE9kVi84NG1xMFNRSGJlSDJFWWdIRVhpU0NHSUVYTEo4?=
 =?utf-8?B?WUhCbjdFSk1jTDRETUdsYldlTGc1L0YwVVlZTUQveTFLUHZqWG5vOTJHZW9B?=
 =?utf-8?B?VTVWZUlyVjlvcms3RnV6SHMzek5BWXBsTkQ4d3ZRaWFaazlvamg2S3JITG51?=
 =?utf-8?Q?MeL9NrAeoJKIYEtg=3D?=
X-Exchange-RoutingPolicyChecked: SGOGmoFutBKlgWS8GUHAXb15ZjSmHXpsukYDpRL3jVPwFMnGPXK6enbRFKbf9D68VJCwVNV64VznZyO9NJzBJFW6Gi+dVjrLrZFZ0RRT+lOG7mCucpiYRCpA2dYkJW6jsF3NDMC2s0wmcYB936AVilpycfYfwAVJ2sHJE8qulZcPEPAN9MhqMEh5071q0igp8Y8AqZHQEPuCUWRJXB3BjG/CDFmoo/cBmhVDhXfuK/xOFdUXLmvSeBaDvQHUvRXMIo0yBDA9/NOSkHiVzQy19dwYE5KGNVwrLXOagKQr2qouw4X7KeunFNecynpxD+7Zo3GhsppO5A5W46nbmlBTWA==
X-MS-Exchange-CrossTenant-Network-Message-Id: e902b99b-8883-407d-4aac-08ded8db66f0
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6967.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 08:16:37.2888
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +GT0z/7Bw47HUrUV69PDKMC386ph3JbbJRt/tL6/66gohpyRatd1YJlPqr3JlarmpIL1Vz8AhnRCUWCa2KtKKOnRl8DrwJx84X71vsuyPh0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8716
X-OriginatorOrg: intel.com

On 7/3/2026 1:54 AM, Kuninori Morimoto wrote:

>> Yes, that's why I've explicitly provided an example for component->name
>> earlier:
>>
>> 	snd_soc_component_name()
>> 	snd_soc_component_set_name()
> 
> OK.
> But 1 concern here is that if we use "set", we want to have "get".
> But I prefer to use snd_soc_component_name() (= not get).
> 
> This is just a naming balance. I want to use...
> 
> 	snd_soc_component_name()
> 	snd_soc_component_attach_name()
> 
Why? There 'get' is typically matched with 'put' in the Linux kernel 
whereas 'set' is often paired with '' (nothing) when talking about 
getter/setter context. One of the most widely used examples: dev_name(), 
dev_set_name().

I'd prefer to keep close to other, widely known headers.
