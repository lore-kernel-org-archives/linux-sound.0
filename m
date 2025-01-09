Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B215521764D
	for <linux-sound@vger.kernel.org>; Thu,  9 Jan 2025 14:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736433735; cv=fail; b=E9ROXDrcXKdl0eqO4MkLTMZGxSjfsljFQU3NYnq9UPsW4kH2hxkHpGj7GJojNv5Y3yZ7teXD4xzkQD0hQfyieZx9ADyWuFDvXQR9SRGuoakFtCAVYMi3/XQAe1nKcymniyZG9MZ6LXtmtw6Vq+3IYDO/I4Yy8eEtz+yJRH9nlFM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736433735; c=relaxed/simple;
	bh=2w5LsW5Smg44QjzgYe73lmojvfhUetFUCKjryZk8e2Q=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=uJx4je2USJ+Ueyv+OgXo5gllP0+Vnft9F1Ecu/+0l41+WvY3k2zOJ+BDJmxjAaEaFO9FWm/t3emZADcqLjEsFisTuzWtwuZRsi4HzMEEVYJTIoyjVN9RBeR4yrzAxBzKhhb0Y+AaxqYkzxJZyAVPIoGsY06J6W1vrroLqFihCeo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UWTOjnvI; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UWTOjnvI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736433734; x=1767969734;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=2w5LsW5Smg44QjzgYe73lmojvfhUetFUCKjryZk8e2Q=;
  b=UWTOjnvIX9y2+Frf1DhtGZS2qPwRSuTsQ1l9ArL8Ubg8LcMdJ2OLhbR3
   ddM98OYXz5DUskVHxNeWiuMC+21HfnF/fsWveW6E+p+eI6lp13sOihU0f
   Z98KD4NwoiHccMyxjxEoezz+3JqExfaGaaKIncAd2qdFP/lXNbaFCHalS
   B3c2TLkxIDHHa5bZF0dJkuzdePbedknjBkP45enOYR+rRymWQnEEg9fwa
   LDiQIdCIoBgtsskDk1EqdxwoPdwYHefPRYjtdTUDeJFf/2HJqQXBwX7m6
   dG2ZQ3SGJv3bDUDCG6I4zgRnQmDsJzQ81wnjlW6NuvtBAkuVxfFwvMP+x
   A==;
X-CSE-ConnectionGUID: Kd7wZnIDTjui5d76Lc+yTQ==
X-CSE-MsgGUID: Owl8yC2QQAugFahytQC52w==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="40640598"
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; 
   d="scan'208";a="40640598"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 06:42:13 -0800
X-CSE-ConnectionGUID: gdjfSJOeQ26HuQ1Noot7nA==
X-CSE-MsgGUID: GplAqZZeT0m9rgcBvQREMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; 
   d="scan'208";a="103220826"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 09 Jan 2025 06:42:12 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 9 Jan 2025 06:42:12 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 9 Jan 2025 06:42:12 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.49) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 9 Jan 2025 06:42:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=blF1ZfkCrDihV/AZAxtguRZ+0a+whOg/dvgX1naXdpgpUpJEKhjxrXQ6t7VooD3f0y6SIMTWhrEvH/va5nOBQhqUuZEDNIhmHoXWqT1u/nnY/Cko96BQ4L10XmJ3zj5O72PKjHJJNyA1s/ZhWRTVp3LEvHR2x0O45+8XkEpnfdeiLk+jrtAOc0CgVIG9QcLy6mkZfIi8ksqHOtmtRv9WvGJdFU9AmLn7AjhUSI5YBNPZHqY+u4vbaKXR0NGQ0GYxZTm4TnZFieLxUf1e/kVxmsTGKEVhCM/UaHcNA9isbvQGg3fwSh96QCE4Vr7ESYev8ZmuDDZorpAzUdujtMjm+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k59Nwy4ju20h1Y3GN/deq5KYI106oCY5Yv1OyGeID7Y=;
 b=iCQWLPK3dwSm1MsebAKzr9m2H0qhdGn910ckYUkt5bqHfvUrFeEcM6M4OrU4INcTyzIziCi056qrH12KRFvfE0MM08V81FusZzccYqTldtrFHXLiBoHd2JzS2/I/YPojEnE9Q2pBPA+8i9TFuoof0y5mNemm6MRzTUP9QJ68JTA/7Am4B4Vi+j6EvHwAhgbfGn7rCm9W45XRaDpNq8spdw1iD5KkEZ7NHh4gl7T+ujP2+h8TG8Hee3AYgwhnbLgleNy0aniM+z3kh5cmzWy9aYvcos6l57CBwU1BTPUKowTREwodoFDaV4toWDGPd/3TtT0DD41XuRsc6KIHPjsQkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 SJ0PR11MB5087.namprd11.prod.outlook.com (2603:10b6:a03:2ad::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.12; Thu, 9 Jan
 2025 14:42:04 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cd01:59f6:b0f8:c832]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cd01:59f6:b0f8:c832%5]) with mapi id 15.20.8335.011; Thu, 9 Jan 2025
 14:42:04 +0000
Message-ID: <ea2b68d0-3280-483e-b42e-327851c319a8@intel.com>
Date: Thu, 9 Jan 2025 15:41:59 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] ALSA: hda: Fix compilation of snd_hdac_adsp_xxx()
 helpers
To: Takashi Iwai <tiwai@suse.de>, Jaroslav Kysela <perex@perex.cz>
CC: <tiwai@suse.com>, <linux-sound@vger.kernel.org>, <broonie@kernel.org>,
	<amadeuszx.slawinski@linux.intel.com>
References: <20250109125204.3668961-1-cezary.rojewski@intel.com>
 <20250109125204.3668961-2-cezary.rojewski@intel.com>
 <99e4c4cc-d380-44a1-b81b-92a20435bf5d@perex.cz> <87zfk05ass.wl-tiwai@suse.de>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <87zfk05ass.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR07CA0262.eurprd07.prod.outlook.com
 (2603:10a6:803:b4::29) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|SJ0PR11MB5087:EE_
X-MS-Office365-Filtering-Correlation-Id: 826e490e-5024-48ad-cc1c-08dd30bbc8c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SkJJeUdYUFdhcTZ5YUtNcFZKRElyRUhaSExCOGsxTU9xN0ZOTmptRkxRampS?=
 =?utf-8?B?RWF6THZ4ZnhEbjdpWXk4R3Q4cjFOTzVFNHpiMUtWczlvQkpRVVdKNFAxcTJ5?=
 =?utf-8?B?a3JaVHZ4ZVVLYXpSMzFTajJxMW1aNzVBRy9ibzFTZjJwUE56RXNucjUrZG9I?=
 =?utf-8?B?ajdseFdLalhrZjZManpQU3VrN1BpMzZIVStnZVVmMGhyZFNqdFF6YlNGa0Vt?=
 =?utf-8?B?R1ExbG44akUydjlXUDBZdUhtQ25EQnBvUTRxck1OdC9ObDJiNUlUNTMyQVVv?=
 =?utf-8?B?SmRSQXN0VS9XSWR4ZFdkWE54WGxIZTk5N3R4c21FdUpUVlB1NUsrWXpHNjlm?=
 =?utf-8?B?c0NaQ3N3SWczOC92bXRkZTRraHZiYVFmUFFjSG81dGlkM3VHRUZWRExWRkQx?=
 =?utf-8?B?M0pPZDYyY2gzRWFCelc4d2R1KzNKbjl1dXVTVHBuVTd1dnYvd1FhK3dNdG9j?=
 =?utf-8?B?TWg4ZFAzMFZLT00zd1dQMHhraWJNTURQWS9IQjdxM1dPVEVBRDRHTDdrNjRH?=
 =?utf-8?B?Q2grN1hTVnRmTTlqY2w0a05nNDVYUHdUdEhxc04rZHJIYkYyVVcwNmZHN1lq?=
 =?utf-8?B?UGR2T3QwZGszdDNpcFlGRCtlblo1TWd1eXRTUkNxRDI0Z25MQUE5N3lpU0lm?=
 =?utf-8?B?ckdRM2owQjNLQUhaQXErdWhQdWhkL1RZWEtkZ0lXSU04a2trSEtEQUxJTE1D?=
 =?utf-8?B?TTl6dDd3b2paVmNkYkdpS1JOdDl3M2xkcGcyR1c3TiszUVNSalBnVW50RTFF?=
 =?utf-8?B?VHdjYjlMWGNma3ZPWmVRMnpkbnpFRjRCWHBGd3RJYlRGZkMyR2xPR2lLa2dt?=
 =?utf-8?B?eVJIV0JjbFFGRDB5WnJGU3I5RDRLbjNHWm9PVzJyNVJjbnlJbFNYbWFHZEND?=
 =?utf-8?B?Wi95WWR0dWJGOWtubERlOFMrNTF1TUsvMjY3eDhNTzBJdVFzZ2MxNTRjWUFI?=
 =?utf-8?B?YXlYSGI2QzhqN2Jzc0VobC8yNjdtbTdoaHc0aTFTQ282SW96SEJaWTN3S1Iz?=
 =?utf-8?B?L0E0YnJqR09FQjVOanZCTEM3KzUzcVZvQTkrbkc5blpyNzRIdXZSelg0cjZV?=
 =?utf-8?B?NjJFNytGMzV6eG44RU9tVTlSeWNzc0UvSXUyN1Y1cGFmc2IvYnVJN3JaRzlz?=
 =?utf-8?B?RUpucmc5UTBaQ3BuUGg2SFpiQ0VwWWlaWUo2U0VqUDk2VWRjTmFlS3RIUkNv?=
 =?utf-8?B?cEJrbmZJak9SQXl4bUVVQjZTSEE4VlpWYjVZUW4zeTF1cTEzeG9kQUFLZmJV?=
 =?utf-8?B?enh2eXdoSWNOQ1FnNittWmFEWmZWeHpORVhuS3F4WDBwRGVrNkNjUEprSXJ4?=
 =?utf-8?B?N2pSdVBFM3pjeER6UVduWkc1ZmVuS3pvcXErY0pQZVBnbi85OGJ2Z001UEhF?=
 =?utf-8?B?RVV4VyszVVBkdU5Ga1J2OTVNbU1ycStNaXRpaXhuM2paTHBkOGZidDRZb2ZL?=
 =?utf-8?B?czk4L201NmFCRkFFQmxDRE1TZlRnYVNiQlZVbnUwWFFHK0FURy84blVmSTRT?=
 =?utf-8?B?TVhDbUE3NndxaWtZalRRL210MTVwanFzVDVxYXJiWGJaWTlxRTRoZG91Tk14?=
 =?utf-8?B?MnNNczhGMHVlY3Y3bXMwdG5ITDZFWHZDWUh6cE1SVnNKcncyeTEwcE5CNGts?=
 =?utf-8?B?R3VrdXk5dlBSaGwrenZYejNqLzE4aVFZTkxidFNDUFZ0d2ZDK1RZQWhmZ2dl?=
 =?utf-8?B?Z0pXS3BBcWNmZDdiR1N2MzkwalpvQ08wL0tSTFNHQ1FmS2hNT2RrMUh4Y3V1?=
 =?utf-8?B?ZGV1MjhWc0RtWTZsNmlZRHpwWVBrZEZNdUVLeVBPd1AvemtLSmVrNkFqM2tk?=
 =?utf-8?B?Y1RlT3M3SDl0VGgzRk41VXRTQ0xzY0t0UGx0c29kWDd0eGI0dS9WQXoxVk5K?=
 =?utf-8?Q?nYXS+MkLwuGYL?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6375.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V0JqRjNRenRWbVNpeStRYXZyWEpocTZ5RFN3c1JqOUNYTGk0NnZqa2hzenlr?=
 =?utf-8?B?SmZLb203VjMwU3lSbnU1RVduaFdmbzh3bjZOSGxUUkNXdXdsdEpjUGlUSW8v?=
 =?utf-8?B?YTFtSmFrKzU5amFHRVZoTitoV3A2d2Z2T2ppVVFybC9vRndzZDlrd25hSjgx?=
 =?utf-8?B?N2xlTFhuNDlWL1d4Wjd6K0JHK0s2ZHVyb0VJcG1jdC9FamNFUjlNZVA2cEJ0?=
 =?utf-8?B?bnJseWRXYWQ1ZVpjbzF3WnMyOFZRK1hxRkovVlZadktIYTc4M3NEUjhsdGZr?=
 =?utf-8?B?MzZJYjRadStuRS93bU9JK2NRYS9uMm5LeVNkTk0xSXNxT0pveWJWUnpBQzRE?=
 =?utf-8?B?RWYzYnZZOXpiSVduMnNUQWQyai8rT2gxQjVpdE9pajlYNDBkck1ETlQ5N0Nq?=
 =?utf-8?B?MjNDbHFxbFJ1RHNINTNoZ0FnSmZJZGJveUlGTmt3L2QyT0dVNkVubThHN2hT?=
 =?utf-8?B?OXJFVHMxYXEyMTdyQWwzK1dibGpmUm9wZE1zWHFVRHVKODJzWGR5d2tvN0hY?=
 =?utf-8?B?S095NWN0b3dUSDJhb2kyVUZ3Sk5Zbk9oT0pkUVVkQ3BlU2d3ZDN6OEQ5bjZZ?=
 =?utf-8?B?TGQ5RlRZSHJyVDdYbDJTUVBFSDBod3M0Y0d1MHRlNlU5am5HOTF3TVpZN0ZG?=
 =?utf-8?B?SmgxNEFqMWtVZXFweGE0WWM1ZUQzdnZUbEIzYUNJTkczclVpUmNhLzJkZHMv?=
 =?utf-8?B?N2VuWEtBazU3bGloUHZuWlZTdjBBUG5zTitmaXZMMCtQS3pEQzBlQXo0akNW?=
 =?utf-8?B?TzZzWDBlSzZVVDRRR2x2UnhYdDZkOE1oS1ZwSHdmWDYyWWtRY3cwdmVOWU01?=
 =?utf-8?B?SFNVMXZMOHo2Nmd5cVRpc1BjUWd3REc2RzhPNXE5QnVQcmRiVy9TRlk3Vk9U?=
 =?utf-8?B?WTBkdXR3bDZLc2NTTGx5SEUrakhwdnVjS1huamtHY09JWVdOV3dCN09namVs?=
 =?utf-8?B?eTBldk9KelUwbTJMUTUrRENEQ0REZUgwNVBPUTBoL21NSlpwaGY5Q0pIK3Qr?=
 =?utf-8?B?Z2pVM3NnWVh5eVlXQmh6Q2p4YjJsWEM2dWxRc1BmNExaQ0ZHd29POTZBSzRz?=
 =?utf-8?B?TVd0bUw5amI1bE5RYzR4WlZMOTJtcStpYmtHNWgyOURueE9lYkFaeUZIL1ox?=
 =?utf-8?B?R3Fmd21qQmlnWjEzbXFIWWx0bEZPSXZVK3MvMVVNYWcxWm5SQi91YzhldUVE?=
 =?utf-8?B?OG9lZnBwQy9BcXRRRmRyQ0pmb2EvRU1yTksybU9nUXRvdFMzZCt0L08vMEFn?=
 =?utf-8?B?M3VhVlh0eXIyQjN0RWpCc2hQOHVEYWY0T0I0SEF6OVN6SjhIdGkzcjlhZlJu?=
 =?utf-8?B?WTJBOWJ5WUtyVW9tSjJzamJQWVlMUXZ5ZE8wVllqYWMzaUJIWDZPVDM3aHRD?=
 =?utf-8?B?M3ZPUmt5OWltcUZxTmxmL3BVN0llc1pBa2hDK0RZK2Y0Ykh1S3BNWVlRVU1L?=
 =?utf-8?B?bThJMHplNnR5cDZYR01IRnRVS3ZEeXNldmVMSEZvM25CcVRtSjRyWS8vR0dP?=
 =?utf-8?B?S1RZSWN6YWFESFloN3NVbTlGNlZyY0lxNDNuQ0FQSHlmTVpNZktuSlhrVHd1?=
 =?utf-8?B?dHNxSXJYanV3YUU0MkxIeGt2enIyL3dqbkgrTnhXazBOYUxtL1ZNTkR1S2gx?=
 =?utf-8?B?S3ZheURsMlNuclR4Skhaam1FWERMdU5heDRhbTBWZmVVK0FXV3VIU053SHpO?=
 =?utf-8?B?d1cwdzNtU1JBUzNpYU1iT2l0YmVQbmNWZVR2OVFDTGNMMlJXRnpPNGFJczZp?=
 =?utf-8?B?K2R4dGJwbmtnNlpadnJjWE4rVnJpMzl4SEhIYSt3Nzk0dVdFTnFOdVR5YXFN?=
 =?utf-8?B?MGhwZFNOTzVycUNRNVd0N2lKSGpoSDRwbk04RHF0cldNTnJybHd5NkhtUzlE?=
 =?utf-8?B?TmNtVEdWZHlNQ3ZqWk5VK1hzYXFSeGprWjZaUmQ1clIya0FIQXhWR1VDcGQw?=
 =?utf-8?B?OXZjcWU2OTN3ekZtNklqQXRLTG04ZFV1b3hYcXFRckRodXpNVjFQNGN2RVRt?=
 =?utf-8?B?VFFyK2ZxbzlnZjJtT0JsWmc2MmV6S1FLNVBUSld0VTl1OEUzYnRTYXQwVGFu?=
 =?utf-8?B?ZnpudnZhTDRnT05kaEh6YjVSNllsR09CWmI3RnpyVTl3MjE5akNJUkxoeVJr?=
 =?utf-8?B?Q1BDRlNqSVBZdzRBd0gyV1RPUURwcStCcmN0Y0RpTTdTSzRzcXZHblJkdkgw?=
 =?utf-8?B?TFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 826e490e-5024-48ad-cc1c-08dd30bbc8c9
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2025 14:42:04.3059
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QgorROU0C55wnLMNv3P6qAqocmdFPfoCD8wVPlFKd/2w+Zwo1IW2zYASu0nrtRI9EPr5VuDBc48HtHX73YR2vXD96b7BJR/r9FlyoCUdvzE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5087
X-OriginatorOrg: intel.com

On 2025-01-09 3:20 PM, Takashi Iwai wrote:
> On Thu, 09 Jan 2025 13:42:18 +0100,
> Jaroslav Kysela wrote:
>>
>> On 09. 01. 25 13:52, Cezary Rojewski wrote:
>>> The snd_hdac_adsp_xxx() wrap snd_hdac_reg_xxx() helpers to simplify
>>> register access for AudioDSP drivers e.g.: the avs-driver. Byte- and
>>> word-variants of said helps do not expand to bare readx/writex()
>>> operations but functions instead and, due to pointer type
>>> incompatibility, cause compilation to fail.
>>>
>>> As AudioDSP drivers e.g.: the avs-driver utilize struct hda_bus (and
>>> thus struct hdac_bus) as the base structure, add casts to address the
>>> problem.
>>>
>>> Fixes: c19bd02e9029 ("ALSA: hda: Add helper macros for DSP capable devices")
>>> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
>>> ---
>>>    include/sound/hdaudio_ext.h | 16 ++++++++--------
>>>    1 file changed, 8 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/include/sound/hdaudio_ext.h b/include/sound/hdaudio_ext.h
>>> index 957295364a5e..79a010dd0062 100644
>>> --- a/include/sound/hdaudio_ext.h
>>> +++ b/include/sound/hdaudio_ext.h
>>> @@ -120,21 +120,21 @@ int snd_hdac_ext_bus_link_put(struct hdac_bus *bus, struct hdac_ext_link *hlink)
>>>    void snd_hdac_ext_bus_link_power(struct hdac_device *codec, bool enable);
>>>      #define snd_hdac_adsp_writeb(chip, reg, value) \
>>> -	snd_hdac_reg_writeb(chip, (chip)->dsp_ba + (reg), value)
>>> +	snd_hdac_reg_writeb((struct hdac_bus *)(chip), (chip)->dsp_ba + (reg), value)
>>>    #define snd_hdac_adsp_readb(chip, reg) \
>>> -	snd_hdac_reg_readb(chip, (chip)->dsp_ba + (reg))
>>> +	snd_hdac_reg_readb((struct hdac_bus *)(chip), (chip)->dsp_ba + (reg))
>>>    #define snd_hdac_adsp_writew(chip, reg, value) \
>>> -	snd_hdac_reg_writew(chip, (chip)->dsp_ba + (reg), value)
>>> +	snd_hdac_reg_writew((struct hdac_bus *)(chip), (chip)->dsp_ba + (reg), value)
>>>    #define snd_hdac_adsp_readw(chip, reg) \
>>> -	snd_hdac_reg_readw(chip, (chip)->dsp_ba + (reg))
>>> +	snd_hdac_reg_readw((struct hdac_bus *)(chip), (chip)->dsp_ba + (reg))
>>>    #define snd_hdac_adsp_writel(chip, reg, value) \
>>> -	snd_hdac_reg_writel(chip, (chip)->dsp_ba + (reg), value)
>>> +	snd_hdac_reg_writel((struct hdac_bus *)(chip), (chip)->dsp_ba + (reg), value)
>>>    #define snd_hdac_adsp_readl(chip, reg) \
>>> -	snd_hdac_reg_readl(chip, (chip)->dsp_ba + (reg))
>>> +	snd_hdac_reg_readl((struct hdac_bus *)(chip), (chip)->dsp_ba + (reg))
>>>    #define snd_hdac_adsp_writeq(chip, reg, value) \
>>> -	snd_hdac_reg_writeq(chip, (chip)->dsp_ba + (reg), value)
>>> +	snd_hdac_reg_writeq((struct hdac_bus *)(chip), (chip)->dsp_ba + (reg), value)
>>>    #define snd_hdac_adsp_readq(chip, reg) \
>>> -	snd_hdac_reg_readq(chip, (chip)->dsp_ba + (reg))
>>> +	snd_hdac_reg_readq((struct hdac_bus *)(chip), (chip)->dsp_ba + (reg))
>>>      #define snd_hdac_adsp_updateb(chip, reg, mask, val) \
>>>    	snd_hdac_adsp_writeb(chip, reg, \
>>
>>
>> I'm not sure, if this change is wanted. The passed pointer validation
>> from the compiler side is lost with retyping.
>>
>> Perhaps, it would be better to create another set of defines for other
>> structure pointers.
> 
> Agreed.  The cast there secretly assumes the type punning and it hides
> potential bugs.
> 
> As those macros are used only by AVS for now, you can move to AVS
> locally and redefine for the more appropriate types, too.

Hi,

Thank you both for the constructive feedback. From what I understand, to 
fix the compilation issue, it is best to move the macros into local, 
sound/soc/intel/avs/ location, perhaps into the existing registers.h file?

Kind regards,
Czarek
