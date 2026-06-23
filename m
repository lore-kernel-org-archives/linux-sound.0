Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D04161FFE;
	Tue, 23 Jun 2026 19:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782244029; cv=fail; b=OOCz5x6L2/Ii9HEQnfX0fusEua4K+Ii28XZydpZNai6DgQQpB5yAHV5htptEff77PUXSpWpJwp4ivccwK0AUaPTiJl7c1IYP/bLtMtqiAU3tUX0uKVzNBN2fYniz41aKMFtXUUbxsA8+Nk+ocYHmBlfyFDoadq1Q7L+LpcgVLX0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782244029; c=relaxed/simple;
	bh=JtYG6Z5HNmIzwfvYavtoHZjq+0DEiNnuSQzphmhmSns=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ofZ+DuWJMgdpcmeT+hZRW4bKDIiPVYtjlbacKR8GsUhlsx9zFb4t9nqBkvFMQUaPqLejm1nSVbYkSahH86F6GUI2f6w0eeQhAurQdA6t9NLhtHWOlm2lybj4/pPThX6/lsAAyT7jASC+CBT+O94jD/mHm1mRff9cX2QbjeLOM3Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fx0X+BXH; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fx0X+BXH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782244028; x=1813780028;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=JtYG6Z5HNmIzwfvYavtoHZjq+0DEiNnuSQzphmhmSns=;
  b=Fx0X+BXHM3oWC3E7RvcWxnEXi3ZqmKIg2lqBHcRffIPXA1vTXwRZB+RA
   phVGDzh/H8I7qRERCn1SnmpCRxLFbWgok29bQIFNKRG3iS0YBgq2vVHzr
   OI6X2f/teVEyhk3d6nOwADXM7tb+GhsjPClbV/8He/9979JgyDYVVRMJA
   HMrxwMuEmYGgXCVn/VZRwT9N3RrtGTI8UHUdk3L2FImMgUi7DzaIQDVI7
   K8AgwR4gx+MsKCe/Na0OXWakkWuCPVa4QDJq9SUGAZjCNXjC+HvXZutJG
   270b5X9Wxw4R46Rysu934ToUQqvgDtbO5+LUT12oDu/kAoZsbUvX/6wi1
   g==;
X-CSE-ConnectionGUID: nxG2AKoRS8mGldltX3oOkQ==
X-CSE-MsgGUID: OQzQPFTXSweIVuw3u2aiHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="94115986"
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; 
   d="scan'208";a="94115986"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 12:47:06 -0700
X-CSE-ConnectionGUID: DVP+qxGmS7iPA0L+cKRpxA==
X-CSE-MsgGUID: rDTmhiHrRsa9MAdfau1yUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; 
   d="scan'208";a="279780703"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 12:47:05 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 23 Jun 2026 12:47:04 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 23 Jun 2026 12:47:04 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.66) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 23 Jun 2026 12:47:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S+wZvD9wfMjzvhCvr+8QKA6Ddh5nBWwNMHROt4Zj7mYnJoRyJJYllci5FcfmsxHLc3pkZERyE/lZSHferO4r7n8BlxwV4tBjxOTmIRdj6ITgh2dDDhBy8YgadV1ujOiWuhheWN86sazqiTb+WHINF0qOs45bz4IJ+qGUeA0pY097jymAuvQvsTdwv2T+iPZox+Rz7v2sKzAIWzzIeahqjSbpsI+MguioGgyQfYYinrKB/kUgOprBmpPNynauC+0cSVIddum7s5WqY/G2/H30IWvNaJWlzWgCjxOZVyanLLk/2gengcTZ6ZpG2XpFayhMzx4PldcijWcOZSu3uX45LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T1sj2GbVKgKijxZSDUBZe9+Y6m0BnPDftYQihe4BTWQ=;
 b=dBBUhUvb6LrRlssilceuNMaet2HU6KA0BRUh2MtV6K7Y54EQBL32fe7QfJzo4sxdZA8O2JKdqDOHtz6jZhCvtur/fPqadGQ9SYqfEfSwI+U+2Ds67SSetPCZaV1TN6D59kO8VcnUZDreRAjdIHC8uVeYp4Q0lNu2OoITPvSKOOLAARdazkt66p3OrzVOuz3v1tkOI1MN5P2KAb5NPXXJw0zH+HXJ1WAPC+Pvc/tT2iURqfAUHpy7eBfou2jPqW+fFx2bAT84VUV9AGTF8UxNLQJpsHDScTfqzwIkoAaWbeUzEsCymowvE3DwX6Zf9rl7sBZvloL34TShB672fj1IJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6967.namprd11.prod.outlook.com (2603:10b6:806:2bb::15)
 by SA3PR11MB9464.namprd11.prod.outlook.com (2603:10b6:806:464::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Tue, 23 Jun
 2026 19:47:03 +0000
Received: from SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4]) by SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4%4]) with mapi id 15.21.0139.018; Tue, 23 Jun 2026
 19:47:03 +0000
Message-ID: <6461a163-e223-40c2-ac50-f238ecbd56c0@intel.com>
Date: Tue, 23 Jun 2026 21:46:57 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] ASoC: Intel: avs: Use guard() for locking
To: <phucduc.bui@gmail.com>
CC: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Peter
 Ujfalusi" <peter.ujfalusi@linux.intel.com>, Bard Liao
	<yung-chuan.liao@linux.intel.com>, Kai Vehmanen
	<kai.vehmanen@linux.intel.com>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.dev>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>, "Liam
 Girdwood" <liam.r.girdwood@linux.intel.com>
References: <20260623105721.25865-1-phucduc.bui@gmail.com>
 <20260623105721.25865-3-phucduc.bui@gmail.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20260623105721.25865-3-phucduc.bui@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR07CA0303.eurprd07.prod.outlook.com
 (2603:10a6:800:130::31) To SA1PR11MB6967.namprd11.prod.outlook.com
 (2603:10b6:806:2bb::15)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6967:EE_|SA3PR11MB9464:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b6fe417-442d-4c24-816e-08ded16032cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|23010399003|18002099003|4143699003|56012099006|11063799006|22082099003;
X-Microsoft-Antispam-Message-Info: IXXkoj6b49PJXOUKi29TYZAzX+uURh0zplmuv7A/8hSemtwDNd+lGGjDhV13s4T5py6An3EEi3+vqMdd+AEtyKBnbrHndGLe0z+saRtH/SZJ9ySfZS5zTqe0qQRj5qpIS7NfR/08/XDhaFpNF+zZqy4KAfxmCpcCAxVKF1XaR38Wjo0DtjoEQAJvP6juZL8m82uQ8b0QUSBN8YNRsxskk7sq5pD3JG26lvFLjTeuewDowN1neyXaQAlYomFytgb/E2wsVuYYkPDw1h73swg1AcmVMSrZV4kJvSbBuuxi4ik23rCE2CbdFeFBBT04I/aE5zfEy5oInQDJ1Kfx7fEwUj0EBKC73TljElzZbrMVvSn4JmJ7X3Q+Nz4IgEYQHokrCY4dwLmqHptOv5IVeoHk6oA+deSJVTgZnq+4+kH6uiUIuS5uU1t8HcjxI1Hl/xvlJWFTPQgDjhNs+l7BVixG47qxT0trh8Vw58cvo1b5YuZkJqoRlRfb5PAFQM3NJ+pq63ibEQXUmPd7z9xK4Le5mumPVFCSUVvji1fa+VuwHLHXx1pE9UqtIcrBtLYUBIRAh2/TemirAGVjCy4GjEMBA2V/vO3x2jgbuKtBGQdU8I3U6Y6ZX96boMIUisr0XubemF+cm8gkYuTBPRkTWDpbAvimAGMfUpChR/lesmH/NMA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB6967.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(23010399003)(18002099003)(4143699003)(56012099006)(11063799006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TmhTNGloTVY4TTFYRHpvSFZMMkdDOHVlQUpSUThNZUlUYWg4bmVWanBoZnlu?=
 =?utf-8?B?dVJmdGYwRlluWFp0MkFlNjR4Rmw5WjdvT2VPeGd3Y3ZQREwrcnBvOHEzeDFx?=
 =?utf-8?B?VkpEREV6d3prMHRxK29tN3MvZUUyYW51Q1EyR21BMnl3NmlZcXJUbWozVi8z?=
 =?utf-8?B?dTRQVG83Y2ZOSnNKK3JYQlVJMWs0ckphZC9mY3FyRlBWZE1FY0hVODBqM0dT?=
 =?utf-8?B?Q2tBeFZoZ0o4S0t4U1NKWWUrSnd4MWtldVZtRXBoMnU4ZXZRSFpTVUxSYzlt?=
 =?utf-8?B?SkJPSzFDUzc2R3ZrcmU4bFVoQSs0cG5pT01SWWNPOW14YkpzSkZQWi8veGww?=
 =?utf-8?B?eWFFLzcvZjl3UVRGOENZZ0V4L1JIc3pUcE03UlEyRlM2c2JjVmNQVSszcThi?=
 =?utf-8?B?dzlWRUdQZ3B6TjJYMXJETVd3K3R0SVc3VjZhWnRrWDY3NlpSVllVV3dSTjFM?=
 =?utf-8?B?RFBtblVqQjhXRGp4UWJsZDBtek5SaXQzVGtXL21ubGREQVU2ejFkSXRyVmdD?=
 =?utf-8?B?N1Q3a1ViVm5LNWlua0NSZUwzSVFwZzhLMTA0RWZ5cjlldjhKcWZnRUhtN081?=
 =?utf-8?B?ZUJVYUN3RUxkYkQ3c1Vhc3NpenN4a0pJUzB2dS84VENlenZvaTNhZmVBbVBr?=
 =?utf-8?B?SWdyaVNGYWJOU25XYXJIOWt5czVyajBNVkNEMzJkOHF5NXk2UzlrOTk3amNr?=
 =?utf-8?B?UWtCMC9lNmphWnQ2K1RaOCszOWZRY2t4bGx2T3d4SFVsNHhnekhIQUdtQkhk?=
 =?utf-8?B?dkNwNmw3bE5rcGNvTU1INnhzRmV0MHoyMnp1b1d3TlhDT0pNMGFCSDFaM3hh?=
 =?utf-8?B?SUVYQTdtOGtDRXVuNUxXcmJuaGRpNzF6UXNnak5FNUtSaFN3Z2NUYzQzTXhB?=
 =?utf-8?B?TENTVCtVVkxUVktTdzVTQVZveUd1MEliVHJZbWY1ZW5IanV3Uy9MTEhqKzg0?=
 =?utf-8?B?akgvcmI2aWw1eHZGTnBDQlVLUngraDFaWjhnV3lEV0QwWExWcXE0dXcveEkr?=
 =?utf-8?B?VElaWE03TzcwcWlpRTJhd2ZoNzRVR2F4TDNtK2lFWkltdy96ZTZCNnBTdU5L?=
 =?utf-8?B?RUhBM3FiRFRQaUJ6c2tlaFFuS28rSXBTbG04MWVpUjJQYVIxN0IyUzh3bDZn?=
 =?utf-8?B?U1FUY1krWU45T1ljRjJwcUx4b2xOT0UxY1F4Z1FQUHpOQ2hkOWg5c1F3eXdj?=
 =?utf-8?B?Mi9YYUhBR09PQkZ1a3B5c0E3RmxZUHlIR3NrRFV5TnIvdUJLc2Y0QlJYdG1s?=
 =?utf-8?B?TnJhdlZkNExvNnBDRTRrVmFjclU3SEM0dXNwSlBKR2lqbVZESFNuTUZwa09p?=
 =?utf-8?B?aVB5UTBwUjRRQllISllFTDA3bUNrNTFvOEpEZTFWY3RFdHcyUmY1Z09vM29a?=
 =?utf-8?B?WWJRL25tbmpxYmwxZzZqYWxJOUFVZUUzNG81VkxXdEwvYTNOemFoRFlOc3JK?=
 =?utf-8?B?azZFM2ZvVTlYVTRya2hCeUJQRE9XQ2JWbmxYVllaTFlEOEZNb0lTWDRObEVn?=
 =?utf-8?B?TTc0RmEyc1k3NlY3QlJLMmNGRHpZVVo1Q1FKNkdVeEVrcS9mSGNYdnlPTHZC?=
 =?utf-8?B?TWJIQnZlR09RTldzTnVnVTBLclFZZ3BPM2ZVaUh3SjNxbUFGOHFiYVdaSU1s?=
 =?utf-8?B?Nm91M0QyR0tIU2FkcEtuQ3JKODJUaVJrbXZ3OEdtQ3BDN2owN3ZlZThjQVly?=
 =?utf-8?B?QmxsOXNIK0RFdDBKZUxreEpUN1Z3WStjMVJkNmU2SlpuN1k2K2E1RG4yN2pV?=
 =?utf-8?B?eTk1M1lqQUN0clIwb2dnSSs0TUJuQmRrbkN4MFZ4ZkZYa1ljRS9RYTZQT3d5?=
 =?utf-8?B?MUdrb3lRVWZUSnBDaGJWb2RWZVBUY3cvdWg4R2M4UVJsTm1oMythZkU2ZTJn?=
 =?utf-8?B?dWZTb1hDbkpRcEVZSERvRzAzbDJGQ3BMK3dubTRCV0JPYjV3ejJ1UFA0Vm55?=
 =?utf-8?B?dmNYRnp6cjgyWmtOSDhJV1hRRTRUcFc3WXJUYmJ6V0Uvamd0eHkwU0hBLzJt?=
 =?utf-8?B?L21SV3ZLc0hTSDF0aEhyS3pibkg2R0x6aDZOUWIreG13OUgzY3BoVlBlSXJY?=
 =?utf-8?B?V0ZpMVgvWHI0K2psR0dZYjhGYmF2YjhVZzZCOUpxZ3hsOVpQTTF4WXJQOFF3?=
 =?utf-8?B?aXc5TXkvbWR5L3ZMSllDa0FyUUd4aUoxVmlSa0lEVUlYbTE4SEM5QnhNV3VU?=
 =?utf-8?B?SDZENE5yOStVRkRHWlU4S2oxbFM1UUR2MDlxU3J5NEZsRnJYSVBZR0x4MFY2?=
 =?utf-8?B?S2MrS2lUcXFyYTFyUTIwQklWMmlGYTk5VlJZQ1FBREpkRWpQQW8zV1lmdXRC?=
 =?utf-8?B?dS8wTGhNMHU0Q3Q2Y2xjQXVZWlk4ODhhNlp2UWQ1cFlXTmUvV3Nqd3cxSjJB?=
 =?utf-8?Q?CFFgSWaV00qpe1KE=3D?=
X-Exchange-RoutingPolicyChecked: ATD1ODL9rhrPyk1SBdA6IxnFFI+ucm6swH0zwWewfbw5pUfMWJ7StVsg2PHAuU/umvLCZRKrWH3SYmpTjIw65vXmv0DVq7EpmLkUp/m23D0g9GaBChrCXxlZuDkK3Xk/rSHliamoHp0FxUS+SzfJ5eOAMmefAcPG9NKolO2b9zABftE7HD2rmHx7G98eIWEA0V/H0H0ZLIXdX5nfJsF7tRT12DurxfQp+fxwDbnOS+0XV3y3AA4Y446zkvfpvXQPISciEAXHipyDOxeoQeqZrwNvsyUCECIB0j4KGozcqXxdjOpQraCaj1u9C7v3SbRLjfzREla8gNTbWUjTr/PZUw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b6fe417-442d-4c24-816e-08ded16032cc
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6967.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 19:47:03.4739
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ils92Hj8ROVwC9qMi6mXzgEtiB0dicFQvRxvBL6nzw6vmqKJ8/lF3eHVm8jUR5dNVCWe5lFwVseVy5NnXmlyY/jVMt2LUliAFOMC43Qtedw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB9464
X-OriginatorOrg: intel.com

On 6/23/2026 12:57 PM, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Clean up the code using guard() for spin & mutex locks.
> Merely code refactoring, and no behavior change.

Apart from one point below, looks good overall.  What bothers me is lack 
of includes - all these files are missing linux/cleanup.h header despite 
clearly using its members.

>   sound/soc/intel/avs/apl.c     |  7 ++-----
>   sound/soc/intel/avs/control.c |  7 ++-----
>   sound/soc/intel/avs/core.c    |  3 +--
>   sound/soc/intel/avs/debug.h   |  9 ++------
>   sound/soc/intel/avs/ipc.c     | 10 +++------
>   sound/soc/intel/avs/path.c    | 29 +++++++-------------------
>   sound/soc/intel/avs/utils.c   | 39 ++++++++++++-----------------------
>   7 files changed, 31 insertions(+), 73 deletions(-)

...

>   int avs_module_id_alloc(struct avs_dev *adev, u16 module_id)
>   {
>   	int ret, idx, max_id;
>   
> -	mutex_lock(&adev->modres_mutex);
> +	guard(mutex)(&adev->modres_mutex);
>   
>   	idx = avs_module_id_entry_index(adev, module_id);
>   	if (idx == -ENOENT) {
>   		dev_err(adev->dev, "invalid module id: %d", module_id);
> -		ret = -EINVAL;
> -		goto exit;
> +		return -EINVAL;
>   	}
>   	max_id = adev->mods_info->entries[idx].instance_max_count - 1;
>   	ret = ida_alloc_max(adev->mod_idas[idx], max_id, GFP_KERNEL);
> -exit:
> -	mutex_unlock(&adev->modres_mutex);
> +

Drop 'ret' entirely and just 'return ida_alloc_max()'.

>   	return ret;
>   }
