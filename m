Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 099A718873E
	for <linux-sound@vger.kernel.org>; Thu,  9 Jan 2025 17:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736442854; cv=fail; b=A8h62zfbiFG+hQa4ZT2TZZkChdbmNazNjcPvMXlmvGs6dtaEOci/HkNAsOPjIiXc8aqFm8AGFM2R7/OiDVE0aYnv/x/W8+TzXArdmzwHSU5mZdcHwAevjCkal5+8x4p6nN2JCh5F9IQFtMyY3MVYlTH+wMCljRZEWB8cp9gpEJ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736442854; c=relaxed/simple;
	bh=4L0UNuXe511cCoklmHqD4aRC0/cE3E8Kyge8Ceal0/s=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=fxUOaQN76ipnTn0zzv5dM2xhaNn3lpVUEKRpCl0j27qEneA+ycsYRx9OCjLqf+XtI7cjm204YmXMXT+CkyyNNwKRZOV6sm8Q9j+YO5JVXJiTW1v/L3I72ebBu97b6ljrBClHdLBT8DWDtgyk6xnDyl71torxb5fB2S2xGb5ffUQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EFjp4+M2; arc=fail smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EFjp4+M2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736442853; x=1767978853;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=4L0UNuXe511cCoklmHqD4aRC0/cE3E8Kyge8Ceal0/s=;
  b=EFjp4+M22bOc9uvekubRxilXPPMkh9fmPEK6Q02OKTY11UtEPGnIEBPF
   LNLbF5wKMbAIDH9+kCyJUOEb58kVuZtt93/ny/RXgZP90V+NUNQRnZLcu
   rp0f4qtyTQ/YMJx8xHuFoOSe9FeLoJTKHBEq6g1vMbeR6FlJqI11zVoxu
   SSgMY4718XEkG3cpweeFKwixizWiSX9CSa/t860gQIK/Z2MxqmKwCvJ53
   p0kjD+Id8+UIYJDWM8TcGxHQOLAsqyfz6CxILZVwFVx2Dsm0Fqe8LbP//
   O6kG95l9I2/QgdgWldP0JIhOcAoau0Awoo6KPzdnjxDbjQdxI9whVsjSk
   A==;
X-CSE-ConnectionGUID: 5XOwPQMtS8eDRthlvY1Iqw==
X-CSE-MsgGUID: 0tBvivmpQ9u0fXfilj+kPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="47296009"
X-IronPort-AV: E=Sophos;i="6.12,302,1728975600"; 
   d="scan'208";a="47296009"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 09:14:12 -0800
X-CSE-ConnectionGUID: Owe0wDA2RGqOn/ViZKp6AQ==
X-CSE-MsgGUID: Oqy3hUXpSHqsj6M0xOSI6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,302,1728975600"; 
   d="scan'208";a="103273918"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 09 Jan 2025 09:14:12 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 9 Jan 2025 09:14:11 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 9 Jan 2025 09:14:11 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 9 Jan 2025 09:14:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PhVdDGcX2SmKs1+socCXzPMnlk6zbMi5Szpx3GciDQ8z0Bekw4AX087VRWN8DIH4OTjdCjPG1t+ezzxVkfJbGgd5wnjls4RGcTsFdJjGPCY0EYjaMWRjhD+8pk327jrkx2JS7kNTgAJ+ZLg4kKQKA/+Ech+Wj/jVwa+c0gpsNyEe4ZX8eyteOhnUBTnxYjMxYhzyYJyJEX2TRtURbhYvqTySI7br66JN5sPFfj5H7j49bbdBbH6TNHFW94eY42VhRs43E5muCdI7S2W4c/4Xd184Up8VBOp6z0d08LeUgK+iKt6tHCGtGE1vMy11m0Z8jeKLT7UsttOaV5xer1xNNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wLcijNx6k3QQ2V57XHYHy3Mwh7Hi05HtKG575e3EyhQ=;
 b=Ndq7Wqt05Ip7jfAhJlcjqkibAGFocKmSBHkHfP87y4Xq4RbdmSU9eh8YSUerxtIe1NlAlgx1HFqzF2n/GjTV0Z0dXwdGzzgb007hxxsRhj6Ezy0XqhIPgJ5OnpI0boCKmJMYVs1Ze6lo/1FWjV0phm5AnLOFo1xUZEcrBEcyfQVc5+j4wOMrrsNSjcDxUQ4EZnjAxfGV/+48swtLJ7hcU070CyblIIHS+/FomPnh/AMJ90oHfjyOjDfUqEsElJfz80yGcIAOcBQrncya8IVrNORMdHM/j9wt6LYfGTLBvNoBuXOnGlHFa64DEuNwDs7y+dFaLDhAvzWTT06rF7OoEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 MN0PR11MB5961.namprd11.prod.outlook.com (2603:10b6:208:381::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.11; Thu, 9 Jan
 2025 17:13:26 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cd01:59f6:b0f8:c832]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cd01:59f6:b0f8:c832%5]) with mapi id 15.20.8335.011; Thu, 9 Jan 2025
 17:13:25 +0000
Message-ID: <2d0c42a2-f0f1-41e8-83e1-303f4211441f@intel.com>
Date: Thu, 9 Jan 2025 18:13:18 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] ALSA: hda: Transfer firmware in two chunks
To: Takashi Iwai <tiwai@suse.de>
CC: <tiwai@suse.com>, <linux-sound@vger.kernel.org>, <broonie@kernel.org>,
	<perex@perex.cz>, <amadeuszx.slawinski@linux.intel.com>
References: <20250109125204.3668961-1-cezary.rojewski@intel.com>
 <20250109125204.3668961-3-cezary.rojewski@intel.com>
 <87y0zk5ad5.wl-tiwai@suse.de>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <87y0zk5ad5.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR07CA0279.eurprd07.prod.outlook.com
 (2603:10a6:803:b4::46) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|MN0PR11MB5961:EE_
X-MS-Office365-Filtering-Correlation-Id: ba8f825a-9ed7-470c-6c6e-08dd30d0ed42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RGdlcTc0eFJhK1VOVUdaaEhTOVNCUzArY1NBVTlVUEh1VUJuczM5cnRWT09L?=
 =?utf-8?B?a1lJNzgreGRBZ3NnMWttTEdQaFR5RDU4QXVzQTNXaUY5SFB4OGNFTEExZFR5?=
 =?utf-8?B?OWFuUkF0M3Zsc1N5d3BXbVhNYXI3V3FTcXVoRGF5cXVkbXdDcDFlWXk0N0tP?=
 =?utf-8?B?VVBabnl0cFhBU2hVMW5kMEFhSWlHZXJ2Q0lCaWhwWnRsNlV2VEMrdGZVRlAz?=
 =?utf-8?B?YmJ3M1dkNk10UEFQSG5DbnhyMFVaQUV0L2NLdnh2Y3AyTC9FSVhpNi9BQThk?=
 =?utf-8?B?YTQvOWRySDVINjZpWkNjV01LekZYc2FDWGJ6UThpWkp6QzNjT3ZDbnN1aFhR?=
 =?utf-8?B?eGZabGlFYjlnUXE1R2ViejdoNUUwajJKRDY5cDRhNjV4a0xtbCthV29hc2Nx?=
 =?utf-8?B?bFNDL1RYbldKejF6YTNXTGNoR3IzS0Y4alg5THZuazAwaHU5SndQNTVxcCtX?=
 =?utf-8?B?bXE1N28vQW42UGF4YUtEV2w3b3VxdWJBNFQ2UXFKUEF3elJ0VmpQM0tUSG5S?=
 =?utf-8?B?dDNsWFF2NjRxTDBMODhlUE00ZmdYNGgyeVJWNHB4b0RSMldxRFFSUGg4MkdV?=
 =?utf-8?B?N1hNVm44U01zNVhkYkRScDFkU3QvbDd3d3hxdGdiOW9jSVRsQkR5Mjl3ODJv?=
 =?utf-8?B?SUIrZmltemZsdjcrMmlXVkNhTS9KQ25ibkpBWE9CTUZIVjZJOUxKY2prUDRQ?=
 =?utf-8?B?cWRHc3BTZk02WGZjVkN5dWZDWEVDYnhBUUFUOTM4ajRnRW5raWNuQWN4Q3Ay?=
 =?utf-8?B?MVRjbDJuTVV6U3NVWklGNDlnN3BGL0JLRHh2SkFwRkgrUFplTW84ZVNEL21l?=
 =?utf-8?B?ZmlJKzNvUE1Ba2VQZi9RUUhuMlA4WE5BaXA2OEpocW1kR3JOeDhTM3dIRVkx?=
 =?utf-8?B?S242QzZyWDU5T29INmg5MzVQVTNEZEI0Mm9ZK281M0xvT0FDb1NVVGRqaXBh?=
 =?utf-8?B?M3E2ZllYNXh5czlEWXNNb0ZZc1JJbWlldDZYaFVqR1lGNUdvcjF2YXZSUXZa?=
 =?utf-8?B?enp4TVMrd255bnJ4c2EyZ2piZU9SSnRkRmp5U1VpVWltaTg3UXV4VWNOOXlk?=
 =?utf-8?B?eCtjRTFuOUpxckZHYXo3QlFubXFPbDM5RWxRY2Iwd2xTWk96MWdTTjRURWdk?=
 =?utf-8?B?L3U4VWJNMEcxcVNVUkZnUWQ4a0twQnJxaHNCT1lxRWVsRXJVV3hOdWJ3cTZF?=
 =?utf-8?B?YjdPRDNQUmpxWEtNZ21IZW9OQ29qMHQrbDVodzVNaWlHL21Wb0lvRXU2SVJR?=
 =?utf-8?B?a09SYkNhb0FhZW5aUlEvenVRT21VNVlUckxkZVk0WU9IVU5RY0Q4NmsvTCtx?=
 =?utf-8?B?UmV3ZnlGVXRmOWdrU3d2d3pqclI5bTlneVJnYy9jdUk3LzR0QXdCbG5sREV0?=
 =?utf-8?B?d3hDVnVPYm01cWNaZDFRUWFZT0FGZnlMNHE1N3BWaGkxaW5CZ2JYUWU0L2pK?=
 =?utf-8?B?VCtVUXU5RGFxakk5Sk9OUDBoK3FOZzZsNkVmaEVYT1FoTzU2VnczaXNmVS9w?=
 =?utf-8?B?Q3BOS0loS1A0MHJXYkYxRUNaOW9MeTBDZWlZRzA0TEFCV2xUWENsOHhKeHJw?=
 =?utf-8?B?Z3BrS3BhMU9YaGpvclJpNkY3Y2c5M2ZQb3lSQ2ZsMlIrSVZlZHpPVk95cVh1?=
 =?utf-8?B?TjlkT0o3UGVYR0dRd01yM0VCd2tYb3ZUbVpjbFY0MnZOYXkzc1ZhVHI0dTJ6?=
 =?utf-8?B?Y3hkc3NZVWRxQ2R0VUdyZUsvT2JWa2Rsc3BLdnRoQW5rWHhyYmNOOFNEOU5h?=
 =?utf-8?B?Z2QxdG1iNzNuUklXbkdpaUQ4aHNSQlo3bTFkRE1QS2xsZGR6NEhCa2kzOVZX?=
 =?utf-8?B?dHpmN01wdlB0NjM0YU12blVsSzRnY3BuUmdIOTByR0dVTTY0Yk1TbERkMUVt?=
 =?utf-8?Q?ja+H8r5KPt4JW?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6375.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vng0NXBodVNuTTVwZWwwWjhpc0RnNWtrMW5GZ21xcHJDckc5N2hFMnNTcUs0?=
 =?utf-8?B?TU81MHdhVy9YelpQM2pibnkzcUNxU0RTY2lwSTJ1cSs0a1hheUxheUp0WVM5?=
 =?utf-8?B?bUxlSm13a0NVdlk3eG13c1hDSW53VDNIM1U4Wk1yUHlvL0MwMnZ6ckRIRmN3?=
 =?utf-8?B?cVRlREhCU0lYaXRoR3FVVEVWU3U5aEk4L2QyMG9YalVEaTFOeGFUaFc2TDJE?=
 =?utf-8?B?L29Wam9jZHpzd3EwbFJHNFpHN1BLRUNjaHBrNkRPdFhwaGFsekJJbE5nUzJG?=
 =?utf-8?B?Y1lla2NORFVYQlZld3NjUmdxSnFudHZYeURiMlBNQjU1Ni9zZTJrNW85eXI0?=
 =?utf-8?B?bVgwSnUrMmgwaHQ2dXlVbXVJaWw4eE1sMzNpa3BRUjJMbmF0OVUyRVRPbWdG?=
 =?utf-8?B?S3Jvc1hEN21uMmgyVWh3cGRDVEp3dkNQK1RHN2VKdFdQQmduQm1YT0NWUzJC?=
 =?utf-8?B?K3dTWHE3eXZaOGRMRGZrbHA0bGpMU3pORW1NSUV3QWZVamxSdFAyY3g0QlR5?=
 =?utf-8?B?M09aRFVWa2lGQlp6U1FKRkFwZWhZZGY4Ums4Z3V6SVdIMFo2MEFrbnlqcHRF?=
 =?utf-8?B?YnJleDlodW1nUnZwK1dZMnBCU0craHhBdzJuMlppWG5KaFNFSU9rWVpVUzlH?=
 =?utf-8?B?OWZTYTZCOTczdkcyZ3A0NlNyWnN1U0VGeDYyQ0dUVmh5N2JkMEM3Y2ZUTmtN?=
 =?utf-8?B?UFJROXhNMlJtQmROZ0NWbFhUeWQrYWVEV1V5UzBFZDVUQmV5eDdSb2E3ZHh5?=
 =?utf-8?B?MU9hWjJkckQ4MU5hTVVVSVhSdTVKSnlMWmhrN21OSFBRK1ZndXU1TEYvOElF?=
 =?utf-8?B?Q0FzN3pZbG1QeEdjOXZhYXZMb3o2UWxCSmxoNjhRenZ5b1kzRU92a1VhZCtQ?=
 =?utf-8?B?QkVIS25ObWN5dW80Tkp0dzB5VHRwbUZFYnpiRHpNRVE4NTdScFlaSXV6K1Nt?=
 =?utf-8?B?L0NCbzdFa0I3ejBaQU9TSmR3akFYQzV2dmRzVnI3NnFrbDFQb1hid09YUGxh?=
 =?utf-8?B?VVR2ZmZoMzZxdmdEZ01ocllEM0kzVjJtR1d0Y1lEVGpzaWltUzN2bVBxdWlO?=
 =?utf-8?B?QU5sa3diVG1CYUttMGxSV0x4ZW5VQ3ZSQ05CM1F1OUwxcG9SRHFCYVpuOERa?=
 =?utf-8?B?ek5mWm5oeVpJK1hBTm9lSmVpUEYvOEo4L1lLbC96WTFlRXdWYzBCMkErY3B2?=
 =?utf-8?B?bFBMSlUwS01YcXN3VGlxNnJ2U2I1VE9NYkNialF5K2lkWUFkSmVJYTU0NFM4?=
 =?utf-8?B?ZmE2NlRvUEVFS1JlRFdaLzV1QmlLTE03NytPaVo4Nno3eDdHclN5VExHSURm?=
 =?utf-8?B?N29zaWtLb0FWeVp1RzB2cXNJazV1T2NLYUR3ODg2QXhGSUh4K3h4UHFQTVQ2?=
 =?utf-8?B?Zy91K2REWVdLMGY2aDh6OGV2WDRqL25ZZ0tXZkVVVTl5YW1CcHBFSEh2YXhL?=
 =?utf-8?B?RjRjS0JJZm9sNlVRQ29TUHFOeXp5Z2F5YWZwZFJ0ZkJEcDdVbE5PS2pKWUh1?=
 =?utf-8?B?M0EzNjl2U0lxUkNFS2NVNFN5L3pCSHdhbzQ2enRoandzOXU1NHZvWFFDNjBk?=
 =?utf-8?B?SkNJWktuZ1ZnL3JrV3hqOEtrSzFHTjRKdEZvWTd0SkFtOURhTDJMeUNnSTN0?=
 =?utf-8?B?VDA5VFJCY0g5NVBxMUk2aGxvQUR3Ym1rNzVkTk5iQWRUblRlU3NiSVhpUW9H?=
 =?utf-8?B?WWIvbkpmRkU1R1d4Y1UreEUwNlhhZVM4emk5T2VqUFdKVkVwbXBKVjlnZXVT?=
 =?utf-8?B?QXIxQUxmb2V2cDVDRnQyT211dnV1WUxxRE8rYlFhaUVGUXVQdDJLd1R1RzFV?=
 =?utf-8?B?RElzM2F5ZmdreTNSbWR1RWIvbmRBd2lOOEFZVFhZbUZEWjh0Z0dMNmRCTWtC?=
 =?utf-8?B?N3NTSldRaldIQ0tzQk91UklUWDJHOUNiY1kzWFBSaGVNeWNndkxMV1pPMmFV?=
 =?utf-8?B?K3NFU01EaDNGdTFTeGVmUFdmTDZyM2N2OWVwZ1gxWWVqRTF1a1prRExuMWNL?=
 =?utf-8?B?T2UxeXQyV25kVUJ2eFNyOU8rcjZaSEZXcGRJV2dNclZCTmpiL3QrQ2dhSi9h?=
 =?utf-8?B?WFk3R2kzVU5jZ0JyREhnczhKUjJJUWsrNGliMStuc3BqV0JYMnBjNmVCNmxt?=
 =?utf-8?B?dGU1NU9UTG5hYzE2YjdOSzJxNFUzUzdJa3FhYlZ2dHNEQVRIOGtSSDg5MGI4?=
 =?utf-8?B?U0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ba8f825a-9ed7-470c-6c6e-08dd30d0ed42
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2025 17:13:25.0662
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CmXAZRPm8sImIFoivBCLH1DXNPzFs3lJyEfAvKUgsrm0gFGR6II94+cMx3+4LWblFgePuJKSiEhc2piCCIJrbvwvxqKR2vopPR1Nz+Z0JGI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB5961
X-OriginatorOrg: intel.com

On 2025-01-09 3:29 PM, Takashi Iwai wrote:
> On Thu, 09 Jan 2025 13:52:03 +0100,
> Cezary Rojewski wrote:
>>
>> As per specification, SDxLVI shall be at least 1 i.e.: two chunks to
>> perform a valid transfer. This is true for the PCM transfer code but
>> not firmware-transfer one.
>>
>> Technical background:
>> - the LVI > 0 rule shall be obeyed in PCM transfer
>> - HW permits LVI == 0 when transfer is SW-controlled (SPIB)
>> - FW download is not a PCM transfer and is SW-controlled (SPIB)
>>
>> The above is the fundament which AudioDSP firmware loading functions
>> have been built upon and worked since 2016. The presented changes are to
>> align the loading flows and avoid rising more questions in the future.
>>
>> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
>> ---
>>   sound/hda/hdac_stream.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/sound/hda/hdac_stream.c b/sound/hda/hdac_stream.c
>> index 2670792f43b4..18d74a28a246 100644
>> --- a/sound/hda/hdac_stream.c
>> +++ b/sound/hda/hdac_stream.c
>> @@ -455,6 +455,7 @@ static int setup_bdle(struct hdac_bus *bus,
>>   		      struct hdac_stream *azx_dev, __le32 **bdlp,
>>   		      int ofs, int size, int with_ioc)
>>   {
>> +	u32 bdle_size = size / 2;
>>   	__le32 *bdl = *bdlp;
>>   
>>   	while (size > 0) {
>> @@ -469,7 +470,7 @@ static int setup_bdle(struct hdac_bus *bus,
>>   		bdl[0] = cpu_to_le32((u32)addr);
>>   		bdl[1] = cpu_to_le32(upper_32_bits(addr));
>>   		/* program the size field of the BDL entry */
>> -		chunk = snd_sgbuf_get_chunk_size(dmab, ofs, size);
>> +		chunk = snd_sgbuf_get_chunk_size(dmab, ofs, bdle_size);
>>   		/* one BDLE cannot cross 4K boundary on CTHDA chips */
>>   		if (bus->align_bdle_4k) {
>>   			u32 remain = 0x1000 - (ofs & 0xfff);
> 
> Note that we set up BDLE also for the fragment for pos_adj correction
> at the beginning of the buffer.  With your patch, this small BDLE
> would be split again.  I don't think it's the desired outcome.
> 
> The requirement is to have at least two BDL entries?

Indeed, that's the requirement.

SDxLVI of 0 translates to 1x BDL entry (BDLE), SDxLVI of 1 translates to 
2x BDLEs.  As the commit message explains, the existing code causes no 
known issues for the platforms available on the market but we want to be 
forward-compatible and avoid revisiting the subject in future.  To 
address this, the hardware team recommends to update the 
firmware-loading code to follow similar rules the PCM-transfer does.

In regard to pos_adj, the DSP-capable drivers e.g.: the avs-driver, do 
not utilize the bus->bdl_pos_adj field. To the best of my knowledge, 
it's always set to zero so all the conditional code that takes pos_adj 
into account is ignored.


Kind regards,
Czarek
