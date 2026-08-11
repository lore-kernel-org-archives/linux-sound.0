Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B2730AAB8;
	Tue, 11 Aug 2026 13:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786454199; cv=fail; b=nYXvim0bigUdp3JULdVzG1YDL+Hc6gCYcPspypo4bvEuSYU4oRdeiDvpKrwkGFbB1aPdXIBNh5InYsTny1mjjFsQrTa7SjIGuU7tarhP76P25BPRICpnxp+zkdqNlrwbvElBrZ2Q7nJ7947bWT4Tw4kQLd2b4khpiMAmJ1l/JE8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786454199; c=relaxed/simple;
	bh=fm2xSMvnxW6kjA7IHNryDGEliIh09yVm4qp/cVYlMoc=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ePNMIsmtGzcIoMKvwSjfFWGgecBvjHSEGvrNJCXEg0Ue12rNC8y1EJVR1aWvQtMyDX8vJKcnQr5C9CcUIJr1yRwDAXC9hz9lJibkJjTdd156rFvXZBEC7T9N3q0suSAUd94AqEa1FCBJjRL5CyfHqzMGsszmOEO+nbQutyMr7Xg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ku2+/PsY; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ku2+/PsY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786454198; x=1817990198;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=fm2xSMvnxW6kjA7IHNryDGEliIh09yVm4qp/cVYlMoc=;
  b=ku2+/PsY0JRyzlyTszRKdTRCUasX++/pzwTvSkDTJPL07XT8E3AECDXL
   2yfSDUdad13X+LeOYkMU2GVyXp+ctboUFf67qhwOaDSOqvIIH4wU35W6U
   UPfDpdFLCpNEVWtW1w0wlNm5SXJ8ZqFxGiknKbM+zar9uD42qilMIf0kW
   gaTyVrvcv9JXngwcd5eBVCbGYA5l+8QIpW6fQHY/Qzzf0ljQmAp6wo1pE
   q+xS2/yh2lTRsrC3rmND9izi7ln9MSFcEAOmOIg0NhSMvaBZhH2KfBF1/
   hFnIMj+os3nbKIlBpqolseRNaTWcDH47wrMu1sPA3pwUYOUKvzVXZwHBD
   Q==;
X-CSE-ConnectionGUID: aSCKFGybR0WPCUulxi4mzg==
X-CSE-MsgGUID: Rq+I1cWbRqOIj/05Dv0KIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11871"; a="89510842"
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; 
   d="scan'208";a="89510842"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2026 06:16:37 -0700
X-CSE-ConnectionGUID: RMBcsGLcQ8qegjIgF9fgJg==
X-CSE-MsgGUID: o/ujG/vgRyWr8oknXPcPKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; 
   d="scan'208";a="265337684"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2026 06:16:36 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 11 Aug 2026 06:16:35 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 11 Aug 2026 06:16:35 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.30) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 11 Aug 2026 06:16:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uL4XItjPlgIQn1owY6AsGb3euE4SlkQQPIYZBDWb6A3OdaKzghabUJsNVXtmnjxc6asvHla+1wNy0pURbcyrGPgkKUX51PHpFIDjwGrvMeXqFxJC8WxHcZBFYufdQ+OEqkRq9E7wR37KA82K2J3T5xyCxgmeZNmoLxRaeCq/dd4jnOH5KuKekBHQAWV82zAu7jUWK9LppM7o+H5NdzyVS7TI1sisui5M39z2r25qdmxjxf3J0R7MZLxUPBL/3vTDNFtZXAFwn/AHoE+9GiBBul3R9SKIc72ATUevlHfjyZBVJr/EX2EzfhLmmwEPtWhoQneqdlLg/kpBC3B2ajU0Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YJgSzJEQRriWG3LmOHOJ4lMEE6xg0dgmV4SKAje2ztg=;
 b=Y8GQIUtzn5mUHJoVOv0D03tOM4N1vwr3EcybMa8KewiynlygHTili+F5kFdXIUkIY65RsQnRMdmUj7IAbKxi7E0LpCDknP5TayNy9ek6AX2Y7CoxYpQy5JxNNetceRvC1B0hGfuhBlxKcIqHnndgQhhdUDKWhANuLwVaIW1SMdKl7HuxA6xN64Z77w6etw5euK2taD1FTRIHPIru9SORrRwVw9gQRNOblKLYKa8ZvvDpS+0XaCQbzMZNe5SkD3ecHL9fkGnl2MfFr7dQxrL4PMNtmm+6y1SGHgVCw5O6QPjzwcnh/4+M8He5LlaItL4xSRUIMPX2Hji3tS5CyZ7ZYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6006.namprd11.prod.outlook.com (2603:10b6:510:1e1::13)
 by DS7PR11MB9449.namprd11.prod.outlook.com (2603:10b6:8:266::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Tue, 11 Aug
 2026 13:16:33 +0000
Received: from PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd]) by PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd%5]) with mapi id 15.21.0292.024; Tue, 11 Aug 2026
 13:16:33 +0000
Message-ID: <0180ffef-6096-4429-853f-e01ce89c748c@intel.com>
Date: Tue, 11 Aug 2026 15:16:27 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] ASoC: samsung: spdif: Drop redundant probe error
 messages
To: <phucduc.bui@gmail.com>
CC: <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Sylwester
 Nawrocki" <s.nawrocki@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>,
	"Mark Brown" <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi
 Iwai <tiwai@suse.com>
References: <20260811090550.38930-1-phucduc.bui@gmail.com>
 <20260811090550.38930-6-phucduc.bui@gmail.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20260811090550.38930-6-phucduc.bui@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR09CA0115.eurprd09.prod.outlook.com
 (2603:10a6:803:78::38) To PH7PR11MB6006.namprd11.prod.outlook.com
 (2603:10b6:510:1e1::13)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6006:EE_|DS7PR11MB9449:EE_
X-MS-Office365-Filtering-Correlation-Id: d07af940-0f50-4fc0-8983-08def7aac37c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|6133799003|10067099003|11063799006|4143699003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: t+iLyCXOjOQHOvSgk3GCvQ8vbAJ5jd2r4Ti9d7ixHrw0k2P/QCRDjryrWy4UNcWcfsCeOBoD0dbI8HZR8GMgRiwnc8ijVcPkt6bud7q/YIcUsxg8/5lie7kUeJLNY91v058CyLzzh/uIVE9qTVKogPjGxq8RlXb0i2TPyMmxF053WVy4AyYuOlJsN81oijdr1MtU75/0CErbNI7OldFl7WGtWjVCDGee9HfkWIFSqUgUONUI4kG34DONgiBAQGIaBVXMz5oBTZ5+9QDKGO9ZIpHqNLuUolHkNfA2DXUK/JLgZqzdwYRzZ1qmqr9v1vM7ITCVZA1x1WfsndFX9vytUP8E0UgzvjZna1kzLAeffR3zrZHoGfHUfztX4cXSXeBxd9DwpImGIeIbYvbRkQ0tkcqbxxJdQxZNWtLkqKEgD80tYUMwDKm1aHV6Bt5kxQ9a020dvppXL6O9cs729zsUGF3gB7OjJ4aDpLFIlcOKp5RdYQ0f5EscQ+T6AkUjda7e+Vvj/3vzwkYOJBllpdpaDRqyG2h+m1VjOzDqmrTYxLjOUhtLQfV2kgl03AhOQONLS+q3tE3M0nFfb1Z67rYVK9LiC1kWwXiu+I+xDRx4WrJADKfCaCnWzM/yiDsRNRZpvGkelwit4Ezz0YUuC5p2EkUrtrQozJvfuJsHe70QcNQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(6133799003)(10067099003)(11063799006)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bXN6RktReXdneEFvTGFPTXlnVU1HUVdoT0toLzVRZ1dObUgwUjRZMklId1Av?=
 =?utf-8?B?eTV6WmF3ekNVL1dqa3VXVDVOQXdoK003RlEwMi8yV0NtdTQ3SU9PUXl3UTJ0?=
 =?utf-8?B?L1VyTFJWby92SC80TUdaQ2tFa3l0NWlockJXd2lyeGNVT1pUc3NTakZHMkFi?=
 =?utf-8?B?TjNKeHE2Y0x4UTdyMndQNWNFY3ZiVDhna3QrWmNWQWF3ZGdhZXU5SlFiazVq?=
 =?utf-8?B?dS9YRDRSeEtscDVqaGFSdmNVRksvc2ZuSzlRKzdNZ1lSZGZBUngvZXFOdkdE?=
 =?utf-8?B?SWJ1R2pWTzBpd3ExYk44UkJkSmMyK2RPOTVFOU41cFR2MFNTNExLUG5lVDFr?=
 =?utf-8?B?NDdseWlCcDJzWHM4T2VSN2pIOGEyZGxxdDJyS0p4WHlJeVk0SlM2TXZFN0h3?=
 =?utf-8?B?c3h3RGNWUDZTaEJzVU9QbmZoYk9nUGhSdDJ0RnJ2YmhmYkNiTjJVVjlYcmc4?=
 =?utf-8?B?Y1VBcFF1YStmYnc4Ui9vbk4wL1FNQTR2WXBQazVGczkwUlV1cEpXbkNrZTZI?=
 =?utf-8?B?cUErK1ZxdUttWjlJOUFEQ2xWanF5cGlJTUY2Um1vNTEyZU4xM3BNTFkvUDAz?=
 =?utf-8?B?aHdKTHAyQ2ViRk53VlJNbHZqYSs1S1VTMXdxeTYwZndPeGdoNXJWSzEydzFE?=
 =?utf-8?B?djRha3Zuc0NCZ21aYmhkdk8wVEkxZFA2amVCRGt4U3I4UTZDb0xrZjkyTXpD?=
 =?utf-8?B?aHJuVUFISU9wRWI2bVp3T1ZKNFNuQmUwa1lsaWJjTDZQbEhuSmVYQ2RjRW5S?=
 =?utf-8?B?V0xZSlJyTG9LeHFhTFJWRzluU3doMmRWQjRJM2FMakJpWTUxUzlRR3plajB1?=
 =?utf-8?B?YUZXamUxdExHYXlOcUdRRWhSYTkwZjNQMUFaZGQwYmdLRVVwQXcxenJlT3hn?=
 =?utf-8?B?LzM3VkZOZVB0a1N1ZmJJcldCOVRmVXlXNDAzRFE5bEhMT2RjYlpQUlpnSUx1?=
 =?utf-8?B?Yk5xdFMydnphYUw4bHZvY2VuMW5wRGpSVHp6V2RQZzczdll0eUQ4R3dkdWZq?=
 =?utf-8?B?cmlCWFJ5WkI5T3h0TDEwMitNSUFCNm40YnZLREd0aTRUdnlzMkZ3Mi9xTWNv?=
 =?utf-8?B?RlYwZURZSERnZTd5K29Ua29OYVA2c0Zyb0MyMU1xN0Q4VHBGbWhDYVkweGpy?=
 =?utf-8?B?SmRvUnBPQ0FsN1RFaUhBQUVtZXVKM3dNOHA1VTh3R0JRazlMUEgrdzVjNnVS?=
 =?utf-8?B?anJuTW1KbUpRMUVGNWd6QUxaZUxiLzJQZU1HMXU2dkxuVXdNbG41bDF2T21v?=
 =?utf-8?B?b2xFSllEendMWkdwR1Y5R2NCQmpQTkN3U3JscS8yQkZZTEFpNmx3QVNXUUNy?=
 =?utf-8?B?cFJqeGhVZTdQYkFCa296d2RuQTROV1Zpb0d1dlpNOVl0c2ozWlBzNW1aN0NW?=
 =?utf-8?B?b1dnOVc5c2V5dWg3dnAwNDdBK0RKdWwzckhiTXYyRUVJREV3OGJWUU50QVQw?=
 =?utf-8?B?NVE0dm5NK2syc0lKcUUrMWo2VFJGQytLSUo4Qm53WFNtYlppOFpnRy9qTFFE?=
 =?utf-8?B?VmZIYlpuN2N1QzBVU2xzSW8wYnFIS2JVdnJwekd4aEFoYlRLUnU2V1diZkhh?=
 =?utf-8?B?clJuUy9yM3BKY2R1eVVCV1dzcXpkMUhtSEZ2Uks2RTVSeWhFY0svbFRHSE1R?=
 =?utf-8?B?VzArajVRdXdFVnowaGtDeHRPalJCeUxuWG1OTVVXQkdRQjJNRlFmSldCcDVU?=
 =?utf-8?B?elo0UC9SYzVUVnpOK2hoaVF4SE9YTk5QVHZwNkF3dm0xUExiMXVqT2JWUERV?=
 =?utf-8?B?TVIzWkhBN1RsenIwMDRCaHBBdC96cUt3cExqbkFWTEhLOWNweTczY0NjRnFq?=
 =?utf-8?B?Nk5zNWRhSG9BSytxYjZoV28wS0IzaHNoelk5MGE2UjhlTXpFT2VrT21lTm9s?=
 =?utf-8?B?SDdZajUwM0ZHVVFHUXdmQ29DYitMYk1aVnpzc2pnRmtPS1JrYXBYUXVjRm5Q?=
 =?utf-8?B?SEJESk9UdWZPYlB5cEV5eU9HOUh4L01Ua0hOMkxxRHB3bzNMOUs0b2NBclgz?=
 =?utf-8?B?eVFVcDA1ZU9xZHA5WjhQTE9YUEw4QkVtV3g3MDF1a2l6RWJkb3o0bE5yNTVa?=
 =?utf-8?B?WkZkc1NuUXI5QlUrcU9xR3VtR2FkQVpDSUlxR2VDeUpkZXJGNDcyVmNkSGN3?=
 =?utf-8?B?Ni9RSzJMMkhEd0E2TXpmd3pYeTd2T3J5WS9jWkJVM2QrYVJNd2RBN0ZRc3FF?=
 =?utf-8?B?KzlxWmdsZjNXeitqYVM3My9vOTZFcW9BWmEwVTczM2dkaHB2T2hHYWFkd05X?=
 =?utf-8?B?UU1yaVJhc2h3NktjSjhzWmpSNVM2SjBDdkhmeTRJRFdLSjlqOVpSV3lqdmpX?=
 =?utf-8?B?VW80b1BuUFNnWjZiNGVkZUxvQ3I5ejFrU2xuSEN3bTJkWVFLM3BSV2ZRckVU?=
 =?utf-8?Q?VTenumXEAzxjokUI=3D?=
X-Exchange-RoutingPolicyChecked: O+MsG9NZSbS9XT8usNjZSea0tRlTHUsbniWR3/e0pNAMLGP45Dk0uqnXzkHOxf2VYw8gF6+HL1aIdaHsqNVuvsuCV+GfZOa9IbjcGzhvI8E6cJfYZ4ZwvTVySSinI16r4ihkD9638229ezaO82UnFNsgbIhyvUl5O91nfr3cSr3czwYMlO52vfprPY5XVA9vgLfFCXlr912E+vkTn1yPD3DkiVtw0W122B1DAIBgfoD/11d0WNT2S6s4Si3047bWn3wVoIGjpizRE/srTZCVmpmndYj2iX0MN1sLql5/OUXNC0MmvQjFTuUWrWiIWDbFO9JmmxAGKldfFecobS60Gw==
X-MS-Exchange-CrossTenant-Network-Message-Id: d07af940-0f50-4fc0-8983-08def7aac37c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 13:16:33.0974
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UBtGZ6iY/UrXRA/1nbF5ZEcd66Hc9LbsHp1vShM29aNDVCzMYT6zqqDvVO/3JHM8XTQM3Yq6YENkO4UI7U2PlJcJBDrJHcXIF4NTcog82Qs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB9449
X-OriginatorOrg: intel.com

On 8/11/2026 11:05 AM, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Remove the probe error messages to avoid duplicate error reporting,
> since the error is already reported by the called functions.

...

> @@ -415,19 +415,15 @@ static int spdif_probe(struct platform_device *pdev)
>   
>   	ret = samsung_asoc_dma_platform_register(&pdev->dev, filter,
>   						 NULL, NULL, NULL);
> -	if (ret) {
> -		dev_err(&pdev->dev, "failed to register DMA: %d\n", ret);

Which function reports the dmaengine registration failure?

> +	if (ret)
>   		goto err2;
> -	}
