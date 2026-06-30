Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 249813C4B82
	for <linux-sound@vger.kernel.org>; Tue, 30 Jun 2026 19:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782849100; cv=fail; b=g+iGY8faEyR4QAoqLYbr8stz4YBYOqxxi6fHxmG35vOrYMsiJq3eE23e5N+CWQs+588PVJhu/9Q5/U1n+2com4LOmkl4YMjzvfYrRYMIJQXF/7Uf86Uv88YYIxIQArnHWFeeuXX83Mle5HA4lnJFXjTx+g55Q+LTtOt2k/+Ljn8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782849100; c=relaxed/simple;
	bh=82s3NrQ7Qp09wvyRc0wtPIy7RDY115NKOuDgrZnh1fI=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=BXo2/NkKBdwyupLN0J29YKbQs1Kw3nq3xpRq7bgB5L2PL1AqYSYWh76N1+hsI0tcejUos1Pe6S0mbQ8o559qL0uHzgIYDRhhah66ETyvZe++vd8A2rGqfhRP4BPxhZ1Br+t9/q+M0COcy1YdMWmUhDnjFrQBaLXMNokK3TiNoAc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Shcph2ba; arc=fail smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Shcph2ba"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782849098; x=1814385098;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=82s3NrQ7Qp09wvyRc0wtPIy7RDY115NKOuDgrZnh1fI=;
  b=Shcph2ba688CtoYpNua3TVFlKObrlvXF/uW0CTCOs87hB/TROkv+j3OZ
   1I9wlm7txOipYZc49OcCzXMxIOF1yIGn8wZlqjjRru+DfcjvQya+sqU+8
   6tBxAuzW+JL1yRv9mM/6ZxAA4dyWKrIRRg9i05anjDBDEjOigTKRw9a89
   CDvQGZDfc/MX+5j3vYZWTJ5YY2S+X7Q/KU3AllD6tebv0EMQ916JJCdyh
   mYG9fkqbsgUrpwKR7kBhDP/9MnrzMU57yaCNHIop8/AvuKFKgot53Vxwa
   IVk2AFw619q1gVdwUrDj6rVlp/L+GTyBdqPoMhSJEgK7zwTm5b5ItAQUo
   Q==;
X-CSE-ConnectionGUID: v4rvq0vmQTuKUJWaahp8GA==
X-CSE-MsgGUID: yEF2KHDdQ62yAhHVPcDcYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11833"; a="83570580"
X-IronPort-AV: E=Sophos;i="6.24,234,1774335600"; 
   d="scan'208";a="83570580"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 12:51:38 -0700
X-CSE-ConnectionGUID: uj946W9IQmCvKAKor3tBiA==
X-CSE-MsgGUID: xXO8KGNYTY6RrYJyN2dSQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,234,1774335600"; 
   d="scan'208";a="247887024"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 12:51:37 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 30 Jun 2026 12:51:37 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 30 Jun 2026 12:51:37 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.26) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 30 Jun 2026 12:51:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aTKQx36cZmmKUVql00f/kyXZobRwYR/rxIex1rNBpmMggwy4vEtkcHmdxjwXJLhXxzU4IXZeiaRkjPRU2kCXeRm/JztXEJQ5TjC+l7T8tFsHiXpnRc4c5vTPtimbvx5J1olLnMtVeUkn8XDOv9axeXJNZjVnvior6gYCLwdw8zzujj6XQaG/JUkll02Ds0bN0NRiS+FEppIAD4uJzuoekvr4PIJroUafAs4QcfaOAR1N1YJXQxIrfAPS308m882rcP2hM5+4vCtHknti4OvnVjBui/8gqnZKY76E/B7aIgeIGYPvbCidIWlC3NkTMP5u9D4mTG/fockAbS2PTm/8sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ywFlv+nPIJVkDc5+QwyTFJhKD8gfrKp5kRf2cDGM9vE=;
 b=Nm+jRkYyHG2kQwP1vwZ9vmHgorz0vH9EkZUrHWXkjTt10XQhFlHw9/LIvumINiEF/Np9DSXEAER7hjEfCbhEYDFg5YA5wdOFLk7T6fjzFX+YMQ5lI+cYAhYcBuA6ScYnf16SEr3OjQwI38qTW8f7t9RoeiMwWiiCMHHYqS+dkw3inMCdCOjYg0EQX68N1K1+dmVUq2808ssWAWTzJBLjexxxsIYpVGM6Ufi4qSKGGpRgBVYovG+ysAkD+CZ7qwtQELZtCLf2DvTodugy248Dn9X1sPLM0ipfizEg4H2QM2at8alGV7XaCsV0qEjYSncSm0Joi+CFAESQtMqV1cRmmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6967.namprd11.prod.outlook.com (2603:10b6:806:2bb::15)
 by PH0PR11MB5127.namprd11.prod.outlook.com (2603:10b6:510:3c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 19:51:35 +0000
Received: from SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4]) by SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4%3]) with mapi id 15.21.0159.018; Tue, 30 Jun 2026
 19:51:35 +0000
Message-ID: <2965d6d5-6cf0-4fba-97a0-7a97861fbbaa@intel.com>
Date: Tue, 30 Jun 2026 21:51:28 +0200
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
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <87se66dyqp.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIUP296CA0156.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:35d::6) To SA1PR11MB6967.namprd11.prod.outlook.com
 (2603:10b6:806:2bb::15)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6967:EE_|PH0PR11MB5127:EE_
X-MS-Office365-Filtering-Correlation-Id: fc1460d5-e1ae-45f4-df84-08ded6e0fd79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|23010399003|18002099003|6133799003|22082099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: adpR0cy9bvqUmu1lqDLHNyUZRBben7dit19SBvRz4FZexPcYPBF/8Bv0jj5Ls8uALfQys/e7rZ8/Q5/7VLo5YkFKf+HpcOj2Vr5DVDDp/7Yb4UnfnFd35mibr9IWBvbA2hlOKiAEq0/wxstqoGwfNYyfqKx7VH87y+RilaRxUDBqnv8t156sKXfocpBDpSXXOcuGhiLyM4jtC8Oc3IMO/b6dTyqL/LMYwdSXWis7DT5EC5gnlaFaG8pecsRZYuDQwW4MfQZFquDrrXF49RGLGoyE1LJnyPGeTwOOn5PvjZflt8QZFwLHsefvYjTJiUq6MdmYeEpogwMne2izHO3ZdqJ7MzySyY+tOg1rCLtgRCQ0BAcWXRLyiefr8JZumb0TNDUkbmXTEzPeoA7ujtWZKyeCG3fRtErXVpqq23Ft1TicgT5OJvB/L48W/Iq0QpJJrq1eMRoabg/UxqjbHM4h+JWN+aKeDyXh7pTBoOeOZnwB/fUm8XAAytnZcgiKOBwHoZzsQEwjh4BVWB7MkVH846dsCS70q9zMtFfDJxFrgzCRtqhmurpRdVb1XA8ilm2IHLYMiB5+wukRzNkIFBC97+wARBWxRoxUgk8xuYQ/fDj4T1+ziTZsDp/pnrE5PsT5hoBMdoVHLj4YzIpPmjiEfqwa4ar6fivp4NYVBwmJyKo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB6967.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(23010399003)(18002099003)(6133799003)(22082099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d3V2M3pKdmJ0a2Y4aVE1eHFTa2dvZ3RmNjA0YXJMRmdFTldMYUxVeTNqanhh?=
 =?utf-8?B?Mitkdzc5a2VJK1hONUwwSmtpWkxqc29ZQ29BT2ZiZm5MS1JFZllJR0h4WEpQ?=
 =?utf-8?B?aUE3bGMwenlvS2w2QjQ4OWlrSWd1UzJ4YVhrSzViajBRTGpMajFaditSc0Zh?=
 =?utf-8?B?ZlhQWnpKdTEvTkZ2b2VLdllyNy9tSm9jOStYVXE5U2VEc0ZQekdXNXI4Tm4v?=
 =?utf-8?B?aWlWdUdUY25SMmprdjZNbmJXWU10eUE2ZDRiKzk3VTA0SjR2RDJ6czQ4MDhr?=
 =?utf-8?B?YUQwWTN4cCtDTkIxdmlWN3JGSnAxRm9wdlRwUGtCVlFBUi9JVUQvTCtidlJn?=
 =?utf-8?B?elV4NW1hUVdhcW9sME4zd0lQOFI4bkVNVVhRU2Mxa1B2SFpEMGlDRHlsZXkz?=
 =?utf-8?B?QkNDek5ncnBuSVBaOEUvM1NlanhkODhsYXBrOU4zRWVUNVpSSmtTcFdIYWdy?=
 =?utf-8?B?S3F0STQ1SGVvOGdTNTU1TFdnYURQSGh6K2wzb3BKOFNZb2J0QVZvZUNPUWsz?=
 =?utf-8?B?M2xYTlFTUVdDUFovNTNtUkVDRHlxa1A2WE44Rkw2cjUrelVWT2Z4OEFMMFl0?=
 =?utf-8?B?L05NVFc5NC95L3VSbWpPeHZVUHkzcDk1RHFKcXhuN1BnRWV1bkVwYnZpZXFK?=
 =?utf-8?B?azdlblh0SlBnRERZUWRTVkpjbis1blA2R0ExUzhERGhxWFRUekFZT1hKeGN1?=
 =?utf-8?B?WnJJQWpGY2FkMDhUZEZUZ2VGNHpuSlNxQlYxdk5EeGdPZmV2NG5CMzBhNXI3?=
 =?utf-8?B?NnRxTTN4a1JrNmI2YTYrQWhmbjd6QTFhbXZ5N0orRmxUbVIrN3FzdDkxY0ha?=
 =?utf-8?B?TzFvWmxuYlZvSDVVa0ZNODBvWTlwMlg3ZlZsUHoyb2FHREk0akd4OC9TUXNr?=
 =?utf-8?B?QVZvcENMWmtTU3BtR3hXRjQxODNBY0xvZ3VrcjNDc2p0c1VoS1V1VG1sRCs1?=
 =?utf-8?B?am9NWCtpWVBWTlZBSDJLRjh4VFQyUStIUlpRWFN5Q21kZThjWCsvMjUvWUpS?=
 =?utf-8?B?S0hlNnVvOHJjU0ZrdWQwS3ZWcTlMOTZFUzlyS0hNOHZnMFpMOVJqUnBmckRS?=
 =?utf-8?B?NkhmMUU1YXNla2JYclZIOEpzVFhPRFRIbzA0Vi9xVnhxUitZbm54YlpjYU9T?=
 =?utf-8?B?UmtrTnlUN20xT0RBWGYrVXpGRFUveTVMNGJObGZDVVI3YTFmU2xpTkQ0cmRQ?=
 =?utf-8?B?clZmUW9pZGUySVR1VTFnbk5ySGNhMFVnODRpUXdDQlRGblU2cUZCNkJ5T2dO?=
 =?utf-8?B?RjcwQUprWEErekVBSjI4NFN4OHhiSzJjYTVla0I1R0hFUXNGNDUrSFNhMWJk?=
 =?utf-8?B?aW1pZGg1MUIrZXRSMWF6T09GZlBadTlUd1FBMTFxZnhiZ3dKU3l1TFFwdExw?=
 =?utf-8?B?UGNNMmNCd2E0Q2FxV09Xc1k5ZmpwdXJKK1pFNGo3Mnh3M0pFbEJFYXdhMWN4?=
 =?utf-8?B?d3QyRlVSaktUNW9MWXFwUjlHZWxOUE9IcnBRUjM1OWl2aXd4YXRpK3BEeFRJ?=
 =?utf-8?B?OHpjQStDbENidk9EMVFpTDhJb3loKzFuYzBFNmlvVkVscWVNUVhkcVNIQlAv?=
 =?utf-8?B?ZklZUGw2TnAyczBFNFBXLzFEZm5UZEZEbXVtN0FpTG12ZVNRYTFLWTJkT1dk?=
 =?utf-8?B?a2pMamd2akRCdC9aZWtyb0ZPQW9sYWdtRCtYU2tUZkZtUUdoZlpEWFFQcG9v?=
 =?utf-8?B?emRzcVV3b0xsKzFSb2tsbWVjR2ZNUFNyR3Q3endhbkswN3ZCQmpIb1BuRzFs?=
 =?utf-8?B?U1k2Q004Qk9OT3pLKytXcUl6KzZSUjFsbWt0MSs5VmVGWVM2cW5iMVpNNk40?=
 =?utf-8?B?Wm1abnNkT0g3a2p1aVgybFEyNDlUeTg2TU8rQ3pXUVNxN2ZYSVVxSjVkdzRK?=
 =?utf-8?B?cEk3MTA4RUJsWUovWU9YK05CeE0zZVgyYnV3bm5kMUVGUURsSEdNbThsdlFK?=
 =?utf-8?B?WGh3SUtsNGw0Y05Eb29SM2lBNGNuWG9mMlRTTHl3REZnc05GaENIbGt3SXVG?=
 =?utf-8?B?Z1hGZVlWUUJzejRHNE1yT0Vwdm5EZC80L0ovM0dFTGxabUViMWpVYWdob3Fu?=
 =?utf-8?B?UFpBTTVEeHpZckVyK1pmMGlsZitmVWRPNTczOUlwdEIzSUFVdDF4OHgrVERy?=
 =?utf-8?B?THhwbW9yallZc0hMamFEbStBbkQrQnJ6R25vWXNpVGgwTUxJVmZJaUJiRXlh?=
 =?utf-8?B?LzRTNzgzU2Z2SEtrOGYwMVd3SWRpaEZmVFU3NmNra0JjaHBSa1FwVlRNM2Fv?=
 =?utf-8?B?SkZxazRjN2dPcnBZU1B2SERaT3h0ajExWWo1amFRbEEyVVRIWW1qaDF1WmVO?=
 =?utf-8?B?ZTM0eU5GNEM4QTRSNFNDaDJjMFl0UjBiZFN3b0hoQTVYa0ZKMFBFNksyV2Ja?=
 =?utf-8?Q?w+1CjwN6FRHUmd/k=3D?=
X-Exchange-RoutingPolicyChecked: WMVdq+dyVOACjaLXwNZB45aEMCs+XPzWv22gtx1qDqfJlGpe0eqb3DoFNgIPviE20NPs/Yc5lvRU1ncXXpNSC97SRenoyeN/cZU1ghQJbf3C5KqKsA84RvZepG1HyPxYZq6rnmoxu74lw0hKt+oEhYoYRGLgLvV8XkxOr0h4Ul8Ooi4eMubQmDTksGG99ihRLpd2AAhT3V6/7i9n+FjStUuvfbTz+S5gP2llQ/pOxeU8FldMyRkV0UzCvVr/udvGRKUP41QVmcNNmHtH7I9fvcrc9mHERuwFzI3gkkVuG8AOqbeJgX8JNEIOBD5pgYSVEo7ZzaPXXfFHaP9PI0hnNA==
X-MS-Exchange-CrossTenant-Network-Message-Id: fc1460d5-e1ae-45f4-df84-08ded6e0fd79
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6967.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 19:51:34.9661
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j1tmYrUutkwGGS1851nX5bPCSeRTeNUrWm5mSeEBykJN2om/f29NpS1JonBtuiWvlgrRxwPDPXlKpTSQ+ifTrF/iVBjCjc7EgNMAOvnVACU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5127
X-OriginatorOrg: intel.com

On 6/29/2026 1:35 AM, Kuninori Morimoto wrote:

>> Does this mean you have a patchset or two that follow this one up?
>> Looking at this one alone, I'm not seeing why both ->driver_name and
>> ->component_name are added.
>>
>> The driver is supposed to define _behavior_ of the entity it _drives_.
>> Component's name is (typically) a static part of its description, not
>> its runtime behavior.  To keep the design nice and clean shouldn't we
>> leave driver->name and component->name alone?
> 
> It is difficult to clearly define what does "driver" means.
> But basically, I would like to capsuling DAI/Component/Card into each
> soc-dai/component/card.c. Because current ASoC is not capsuled,
> each driver can directly access to each members randomly.

What do you mean by "access each members randomly" ?

> Here, We need to separate the member which set via each driver and
> set via ASoC framework.
> The behavior and its name are set via driver, the others, like lock / link,
> and other necessary members which is needef for controlling ASoC are set
> via ASoC framework.
> 
> About component->name, in current implementation, it is set in
> snd_soc_component_initialize() (X) if default component->name was not set (A).
> But, if we capsuled the Component, people can't access to
> component->xxx because it will be capsuled.
> 
> (X)	int snd_soc_component_initialize(...)
> 	{
> 		...
> (A)		if (!component->name) {
> 			component->name = fmt_single_name(...);
> 			...
> 		}
> 		...
> 	}
> 
> And more, many drivers are basically using snd_soc_register_component()
> to register component. The component is alloced in this function (B).
> So, there is zero chance to set default component name for this
> function user. So this patch-set try to set it via driver.
> 
> 	int snd_soc_register_component(...)
> 	{
> 		...
> (B)		component = devm_kzalloc(...);
> 		if (!component)
> 			return -ENOMEM;
> 
> (X)		ret = snd_soc_component_initialize(...);
> 		...
> 	}
I hope you do not mean to privatize/drop the 
snd_soc_component_initialize() and snd_soc_component_add().  These give 
us a) flexibility and b) dd-alike API (the device-driver API).

It's easier to move between subsystems if their API patterns are 
similar.  At the same time, it's hard to predict "what comes next".  By 
splitting the registration into two steps (with all 3 functions being 
public symbols) the framework is more robust.

Moving on, does this mean we are getting dev_name()/dev_set_name() for 
the component?

	snd_soc_component_name(comp)
	snd_soc_component_set_name(comp, str)

Though the "snd_soc_" prefix we have everywhere in sound/soc/ scales 
poorly with 3+ arguments in the list.  But that's a tale for another 
patchset..


Kind regards,
Czarek
