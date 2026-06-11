Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A8B6356772;
	Thu, 11 Jun 2026 19:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781204688; cv=fail; b=M0mtRK+H1Wl5g/g1KmPEv2VRcEoHmsKnmoJRgISImly1FVNjNYV0CJ3/W9DMRhVPRJpy/5qEiS6R8zdkj0wkXwFCHOebEBBFQ7pKGnsyFtE/4bGuQTGsbfU/GYBTZkh1wBroh/W5ZTkgY0+5KeS7cQDnq+LTv+pWixK6aukSgL4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781204688; c=relaxed/simple;
	bh=XAV5tuBiF9MMwMPCT3tDLqhwvDHlIQamsh61Lkzp+o0=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=KTFZ5aGKRIomw65scWWSkOz5AOoTjGxo+/9AWCgfbQoTRnNrjbVvX9bzElF+8iCDmm8HOUkaxCQyThc/cilPSehmFRXbDjRq8y/pAX6Lz245B2NDB4aIHzW22dNg/ARFtSm2LdlPmg0v7Xpfv7dMv44evABha8ccj4Tv+CpXVAk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fFfqc4ff; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fFfqc4ff"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781204687; x=1812740687;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=XAV5tuBiF9MMwMPCT3tDLqhwvDHlIQamsh61Lkzp+o0=;
  b=fFfqc4ffXYR2iOYQcx0rIKlu37wO0O0lgvgFzucutziT7vGPn1gGe2WN
   n5kUxM19FDOP5ST14OGUJ6yykMbTlomdvnk2ldHzFLx1zPjPdnmYVv+nX
   tkwJzjpjHjtnL/M2Lnz4RuBaLNCdm5SFv4TP5BaiQCeCmG2Mhqvbw5/aM
   YX9OOGxAqwuc1+Pag12ND6uBfcD7PXioZJvUnpmwfiquQx7A77A4Jc4Bf
   1FkO35qoXc5ObxqnIgQssXrzM1nJExA7+Ta7EddkboHr59r21yFpDznsB
   jMv145/IynPj5SPJdctqkjGiMHcdcEliUwHH0Rwy0/8m2IcmGzJty/2yK
   Q==;
X-CSE-ConnectionGUID: 40XRKXpnRMGdXbf+FF7t+w==
X-CSE-MsgGUID: CX3ehORsQSqiXA1mbmXAiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="92710763"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="92710763"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 12:04:47 -0700
X-CSE-ConnectionGUID: Ue9GflBmRIGuuaFLs8RbuQ==
X-CSE-MsgGUID: itpzlWhLQZ2lR460yUzWSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="276766087"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 12:04:46 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 11 Jun 2026 12:04:46 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 11 Jun 2026 12:04:46 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.61) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 11 Jun 2026 12:04:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dg+RyAJzniXLmQ2mfKvuvTOmlB7Jvv+EZ5qqcJAyt/mwd1Y/7bh5UOi49fFlPLdbXBzUHMf8QDQ8gU3T23+WzpoG50yDS6wP70l/69akardYaiMMW0aTzP91RD1DxyEocKSBGR1z5P5UiaBe9zZlWioKNnlhw9DZwcDwRKk/TxR/PwT2LkXIUcrW+wgr089MKPKRvzYZo3L6H0xNKAI1CfBvJrzCbPpAIO/FnMBNSoPxM+dss9kABFK7seZM5GHcfKKXC76tQrqMaPTIYM8qi2lLJdkm9mHKLpQkfKdQL/AJ2yySZxWyzXjbtBHAXM1Ki/rXUlk2ZfKIXXYY3NbULg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pblzg/8hyGs0FMyRjQFa5JIwGGKAyPEFvx3yqQXRiA4=;
 b=KJutO+wlYLfCNew9dF0mvVvVbXPdlYdZeZL05nLvldaB+82s3r6j8r1zwSHqz5rT8y79CAqd5Nq8WfxMGG/mHgEiimRgkMcmB2e+RTGEdPxyML1qL6fG2wzea6Bpsig5JjuiOJ1sAFV2mnB7/f4XbUCdUnt4dUuD1x8J/DMNuY46ghQhcQhBDQo4dd3KgzfBiPtboS5445MyzmhUzsoDAS1x+zMkpIaA+5OUYJmoMtltSrMy6uf988M5UYg2yo9jPmMx1qKTniRY/rniYOk6baboTe7t8WEAwVa3UnF5LzSfCiXgLwziWeo+mP8ZWNJCahHYEiu/driZG8zQGwexuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6978.namprd11.prod.outlook.com (2603:10b6:510:206::12)
 by IA0PR11MB8303.namprd11.prod.outlook.com (2603:10b6:208:487::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.11; Thu, 11 Jun
 2026 19:04:38 +0000
Received: from PH7PR11MB6978.namprd11.prod.outlook.com
 ([fe80::f60e:1044:67d7:d8fc]) by PH7PR11MB6978.namprd11.prod.outlook.com
 ([fe80::f60e:1044:67d7:d8fc%5]) with mapi id 15.21.0092.011; Thu, 11 Jun 2026
 19:04:36 +0000
Message-ID: <3f7bcbc2-cf0d-4bb5-88ce-fadb8816c6f5@intel.com>
Date: Thu, 11 Jun 2026 21:04:28 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/20] ASoC: Intel: Use guard() for mutex & spin locks
To: <phucduc.bui@gmail.com>
CC: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Peter
 Ujfalusi" <peter.ujfalusi@linux.intel.com>, Bard Liao
	<yung-chuan.liao@linux.intel.com>, Kai Vehmanen
	<kai.vehmanen@linux.intel.com>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.dev>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>, "Liam
 Girdwood" <liam.r.girdwood@linux.intel.com>
References: <20260611115901.80438-1-phucduc.bui@gmail.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20260611115901.80438-1-phucduc.bui@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR06CA0185.eurprd06.prod.outlook.com
 (2603:10a6:803:c8::42) To PH7PR11MB6978.namprd11.prod.outlook.com
 (2603:10b6:510:206::12)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6978:EE_|IA0PR11MB8303:EE_
X-MS-Office365-Filtering-Correlation-Id: b7933094-0b7d-491a-6cf2-08dec7ec477a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|23010399003|11063799006|56012099006|18002099003|6133799003|22082099003;
X-Microsoft-Antispam-Message-Info: aoriFRj6dPqKMxSbOB25zgrs/Azl6tMJz7meeuiOYPIMDf6VKDRso5Oc1RQiQ0vSnrWPPZbbvGHg+ayAUyiuZEfqQ1+FK7bEmdYbZeEoUMT4syeeqXMQ3VrCCZHV0lP7yfGSLZ6fGRS5yGyBpcwicQrYeBJ8Rl7JgvIo5aEb+WWo3bgguJzYDdSJC4ndOzMwIRQNs97tJp6I8ZH146LlWLlvYG1/4CfFs4Q2Rzvlm6Nf6hh5zNBDthq6RsTxctG5pu/1WF4Tf5FgcnLGJNHju10quzPT74Mm4qyIwHrhcGwsjclLJ6RpPA5+dRmTp2lrQ1aLx1fyuhDOuM8x5K9oCG/WQIYe6dHBqXFaIBIq7O/NjLSflYsKMVNyg2LmnDcdVzvfZ5PQGMn+5rhRoMmiRsPBXHCIxXlbPwXEweh0olrGJX5JYjle5MJU/aafM1kN0FoH7SKoSlBpf9dDETBx77nrpFiSzAAf2b1kzJwPY3HfeQ7QeXLtSAd3KUH5rHsic0xTBGGXDNDGkUL8EeBSfoQRg86+bQ1SquhEJ5ePe1Czk4UC6KgE9kQh6BJ39tfGkANTtJzPuRvyM2scZSkXbqoCGUcGlC23b4o4+FQ4AtRUZ4GWTUBcYpMs1RR4QAiGe2LT6JuHLw8fMUHdIfCrjp5bClBGRPQfo8pzL6OFSBCbzci/+84cO1M9SEJLCFGHOXqxpAqEDGxqdFr/kNQD0A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6978.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(23010399003)(11063799006)(56012099006)(18002099003)(6133799003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d3B4OU9naU91eDNSalcrUWtEYThZZy9HVitXWWtHUmhhcGtVdjV2cFR4bTRC?=
 =?utf-8?B?aVRmdUZBT3hqYkhoVVZWQ0U5b2FMcmo2MnFhVTZ0SFdySjF6ZkNOY0ZzSUVs?=
 =?utf-8?B?c0VaaTBBdnFrenVQN2ZyNU4rSmhoMFVkdDNsVWRmNjNmUmlQUHExY25IRGUy?=
 =?utf-8?B?ZTVwbVlVZWxwVGZJSnZ2Tms2NG1YdUc4TUUxeFo1TjEwWFRGMmQ0MkVhMDl1?=
 =?utf-8?B?ay84SVVGTWFnaGdHUDMySy9uR1lZS0F3NWVmV2lZOGZYMVN4QXhZNFlzUFZJ?=
 =?utf-8?B?bFB1V2R5SGxjaURTYjNCS3BRTm11MkVuenRnekdabFh1NUJzUWRMOGxZM0Uz?=
 =?utf-8?B?SFhzaTN0NzNMcUJOLzFQSjNXWHZhZXdNQmFCek5KVUdYR2lUUXNTZVRGSDYz?=
 =?utf-8?B?b0VISU5RTE1wNCswQWNmZUxVMjZUWWM1MWZYSHAyQXN4T25nbWVVdmhLM1B1?=
 =?utf-8?B?bWYrVXFMa3cwYTR1SnlWcGRQczgrdzk5NWFnZUtsYVJBdHUxcmlncWVkYmNn?=
 =?utf-8?B?REVkRUVscmtvdWRYWUtHb3RrMVFoakwzOTRqWnB2cGgrVlJ0bXpRVWttcWxx?=
 =?utf-8?B?aGRBMm45VFRSaXVvWnM1aVlXTEJVNWpLdmRqajZPbnY2ekUydGxBeE5pMERX?=
 =?utf-8?B?eDU0TlZ6c2dtUUJSVFp3MFlneDhrdFo4anBlMzRnaFZadVNrcjdTM09oRk9x?=
 =?utf-8?B?UTdkMVR4dWZyU2xiK2U4REZ3YXArNFVnSEg0cjFrR1BQckZVTTFLcU1iaXZC?=
 =?utf-8?B?Ylc2UFRsb01ZL0ZycHZMaXZoV2tZSWdYM0JtelNtajVXbk9Hakt2NWJmSWQw?=
 =?utf-8?B?Z0lLaHNManFXQUZTUHEwZFVVR3NYRlVMdGdSWVRsL09uMkFhRGdBdUFlaTJk?=
 =?utf-8?B?dlRhdmtNZjZGUFQwLzJwRml5K0xVUTNzNGtUMDJlQVd5L3pQZzdvSVV2VHUv?=
 =?utf-8?B?eWdTc015dURuWXNTTHZJSEhnS2wrUzZCT0RZelZ0cXZzMHh2YjBXN2hha0tE?=
 =?utf-8?B?Wm9SaVNBWExJNmlxeUdOYlFHNS9hbFZCZy9HeXEyWGg4cjdVYnJFam9CSjBY?=
 =?utf-8?B?aEE5Q0JlUXhtcVhCenhSZXBnNG1tVXZaZkRiL1lidFArZ0ZaWkhEVHFBdGhE?=
 =?utf-8?B?dzVIRVRQZDl5QVQ0a0VDQ0ZKWEFRSUlleWlJSHhGUVB2d0VkcUdQbEQwd0JG?=
 =?utf-8?B?TVAzdW5qWm82Smk2eDZ5YTdVUDFlbU5jNzRJYXJBVG1OcGJEMHUxanR5K1dX?=
 =?utf-8?B?WVljUnRmRmpNOWJzeGRJNy8wKzRaMmFVbXJ5OVB4YWhtVHJXV2NjNlZCVHJS?=
 =?utf-8?B?Tnc1RWpvdzNGcjlRdjhjQnhtc0ZiU1I0dmdwRVloNjB3OHhTQlBzRW43Q0xm?=
 =?utf-8?B?bXR5bUtNTXUxWU1VaVhIUVhqcHVzOGRmTjdXZmRka3RwbWRNZHpQRW44RnF2?=
 =?utf-8?B?UVZkNm9TNmllNmhkaFRkb0hPa29oekZTbjdTYnB3MFVhNGo4UjQrNC93UC9o?=
 =?utf-8?B?Rm5zemRBdDR6MVI4SVRJd3NDM25mSW82RFhybjRqRHc1ajlCbjZKckJzbzlE?=
 =?utf-8?B?ME1lVlc0c2hZWjVNenZXd3JJaXpzazdFbTRyNDVMdXc4b2ZWYWR1KzRjNDh0?=
 =?utf-8?B?ZUdyZjFtMlBsSzFJcnl1RmdSTWFUY1VNSUx3MVVrUnlERzAvbGVtN3hTZXV4?=
 =?utf-8?B?T21BV08zQ2hpRXc0OEFGRE9nYzZYMXp5c2g5OFgrUHVhM01PaVhCdC9mMUov?=
 =?utf-8?B?UURRSU5UT2NFRDdId1NzMjM4LzJKUWZDUGNzVmtKQUkxZWUxSVlGdndLRzF6?=
 =?utf-8?B?WUl3cXFoVmluUk5MR0pjMTRHYWlhRTJ1TE84OFRpT29WdnZGek1TZG1wY1dL?=
 =?utf-8?B?K2x4b2h1cW1FQlRuUk1lZW5DZlNNWE16Nm83aFQyK3lLMElwN1I0TkVaNVQv?=
 =?utf-8?B?RHF0RVVLdDNvV3RYMkowVnlxSzFEYmVYamExVkdjc2l0R1pJNzZHZ3hienBI?=
 =?utf-8?B?S1l5alg4UDJuQ0RjY2FobFh6TVFUQnBPU1h0KzM3bC9vY0lhTDZ2UnJ1YndH?=
 =?utf-8?B?NTQwZHVCbDcvNC9LckljZTFrcmZPRmp6dXNLdlVKNDdrQUhUa1JvaW4zVk9D?=
 =?utf-8?B?M0hJdWtyd05DNmdvQlNyU2U5blludjcrcFhIdFc3LzRHbTV2dnlhb1cyVjFO?=
 =?utf-8?B?d0xxVEY0b2tmYXNsWmdVN2l1MEtQbjhhS3poMmVHeHlRVVNmbHRud0RWb3dL?=
 =?utf-8?B?dU9waDRmeHpIck8vS2hFS2hEa0ZoWGxCQmFpeldsanF0WlpwVXlKZmZDT1dS?=
 =?utf-8?B?UXJsdmRLL0JLbHNOaDZFWmpQcUhyNGhPUFFYMzIxUGpNRVJyaEx1dz09?=
X-Exchange-RoutingPolicyChecked: iR5JYbHz79vhxWXsegSPHk2cIED3sO+A0DfgldKE7a15BmX3mHniIu+7ad99oLX8CkystvmPKv1ObYtaRAbhRQwurhqglJ49uOadYy0DpYdWLOt5I2h04NW7hTI0sDbbXwgvyDClMqxYed37VQfif2oCVi+zISXGnEVFa3Gft1znZiidSdU5dFo58QxOcmYRQHUfV2wh72lqdI8//vmbDEPxl6kz6jUHvJlb4GnG+w79ZSMomxVQhw+4HKHKDGW6xw932wg1W27eFh7IYXClWYL5nDnFBWvLupenyDhnBe4UqzbgQarkj8uPakYrTE+sDCnW5iFgWIK1yMVG22I2mQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: b7933094-0b7d-491a-6cf2-08dec7ec477a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6978.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 19:04:36.2338
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QE8QA40M8k9MC1ao1PqU/LvSje1PfwEid0X4IV07aX4/1QL4rO0AutppnxQPuyeiu8ua94+eNNaF0VQtP0dJWvkxbjatGTl63VvOUlFhjXM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8303
X-OriginatorOrg: intel.com

On 6/11/2026 1:58 PM, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Hi all,
> 
> This series converts mutex and spinlock handling in Intel ASoC drivers
> to use guard()/scoped_guard() helpers.
> 
> Most patches are straightforward conversions. A few patches include
> small cleanup changes as part of the conversion process; these are
> documented in the individual commit messages. Overall, the series is
> intended to simplify the code and cleanup paths, with no behavioral
> changes to the affected functions.
> 
> The series has been compile-tested only.
> 
> Best regards,
> Phuc
> 
> bui duc phuc (20):
>    ASoC: Intel: catpt: ipc: Use guard() for mutex & spin locks
>    ASoC: Intel: catpt: dsp: Use guard() for mutex locks
>    ASoC: Intel: avs: utils: Use guard() for mutex locks
>    ASoC: Intel: avs: probes: Use guard() for spin locks
>    ASoC: Intel: avs: pcm: Use guard() for mutex & spin locks
>    ASoC: Intel: avs: path: Use guard() for mutex & spin locks
>    ASoC: Intel: avs: loader: Use guard() for mutex locks
>    ASoC: Intel: avs: ipc: Use guard() for mutex & spin locks
>    ASoC: Intel: avs: icl: Use guard() for spin locks
>    ASoC: Intel: avs: debugfs: Use guard() for spin locks
>    ASoC: Intel: avs: debug: Use guard() for spin locks
>    ASoC: Intel: avs: core: Use guard() for mutex & spin locks
>    ASoC: Intel: avs: control: Use guard() for spin locks
>    ASoC: Intel: avs: apl: Use guard() for spin locks
>    ASoC: Intel: atom: sst_stream: Use guard() for mutex locks
>    ASoC: Intel: atom: sst_pvt: Use guard() for mutex & spin locks
>    ASoC: Intel: atom: sst: Use guard() for spin locks
>    ASoC: Intel: atom: sst-atom-controls: Use guard() for mutex locks
>    ASoC: Intel: atom: sst-mfld-platform-pcm: Use guard() for mutex & spin
>      locks
>    ASoC: Intel: atom: sst_ipc: Use guard() for spin locks
Hi Phuc,

Recent changes took care of catpt-driver [1], so the first two patches 
can be dropped.  While I wanted to follow up with the avs-driver, I see 
no reason why I shouldn't let you do that instead.

Now on to the review - there is no need to be as granular as you're 
here.  Two drivers are being updated here: the avs-driver and the 
atom-driver (assuming the catpt-driver patches are already gone). 
Sending a patch per file creates unnecessary traffic, so let's limit the 
set to two changes.

Please use the following scopes for those:
	ASoC: Intel: avs:
	ASoC: Intel: atom:

Last but not least, your name and surname are not capitalized.  That's 
clearly not the case here, in the cover letter.  Please adjust.

[1]: 
https://lore.kernel.org/all/20260603085827.1964796-2-cezary.rojewski@intel.com/


Kind regards,
Czarek
