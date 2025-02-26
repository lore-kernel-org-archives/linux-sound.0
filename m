Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D81F41E1E18
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 09:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740562962; cv=fail; b=cGQW2O7yt5ZI9F9WWAmKCs5SgTmOw2laSn6tDdtXOKWDTH1x3XAY5emRAa2vB1k6VcYdnzu2h+HXXruSInfCzKKJ5Iee8l2jNZXgUQX+T3pAw38mrZSiy3+NG0QKJowl79n1AHa926VmGTh/WLLucKQa5pPFSaJH/BOuofJL7qM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740562962; c=relaxed/simple;
	bh=ZxU15RjF4weCO5NJxyveEdhnxLOFWAM4zSzV6TydTqQ=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=kka0MFMi9eTm8xY6TGEQczUkbzkmR0faqBopJz/oFzTgqtjNREiaBg0QK5FDSyqm0E5OA8XFnWM3dTZHazfoMJKUZyncU0jkqhIX+XmNbUf7DyyKIHuueVRqD4V1TocVP244rMqJI7TLmvTQ9mk3zxVE4dYbN7NIY0GdTFsBh80=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OpaT3ofs; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OpaT3ofs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740562961; x=1772098961;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ZxU15RjF4weCO5NJxyveEdhnxLOFWAM4zSzV6TydTqQ=;
  b=OpaT3ofsuI6wOwV1fQrH8MJunqkI1LHXi8ka+5rjdTe2DY1bVTT+YoJp
   BlkaW1Lx4hCdZXXTsSoUObnoqBEo/MWQbgjKgQy3NdKJHmAXazAg3GUxS
   okqahwBzrr36R/jDzaEbwBATUAlF6ReXU1XfOljOP3r4oJ+IBE+DyF7OI
   /3Ll8iFlBdsRGyLjX+JyUonNmL+GDxB/7BenLsgPt6a/NjficrXXTYdHW
   Fyn8YLEHvuXwb+yhKx41dfRLY8bQo7MBK3dy5HZroQjnrEOx4WEeDC2kR
   z3YF7fV7LWK3snl4ZqlBUYCf+LHdlaOZiJx6xqYS7o9T6TyNS3Fm0Ob6j
   g==;
X-CSE-ConnectionGUID: 81GFiZoCQemNlA7wnRKYGg==
X-CSE-MsgGUID: Ziqt4QLoSN6g2nJRNiijeg==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="58936105"
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="58936105"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 01:42:39 -0800
X-CSE-ConnectionGUID: 9eDOO86eSTKfL8dGG+/XCw==
X-CSE-MsgGUID: m7VPpKWLTvi05zB7J9n+LQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="117574461"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 01:42:40 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Wed, 26 Feb 2025 01:42:38 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 26 Feb 2025 01:42:38 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 26 Feb 2025 01:42:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JB0oJ7zZh+XDeBKdzvH4O6InQ95/nyI/VqnOdNk4yZQ5Z8O2IKd43x53rL+20O6epRNw0wXvbYe8pc1OvX4JWkZZwD0iz25uZPg4vgrEYQTxm0jDkmDMiJnt4kHAQTA3HMtq8CokUTqpKkM3ZQqwAftxHCR3PAKZy/f+qI3hFmk4ChNEwRgMCpUs+Iyn9oMnlg3FnIb2q6OxP5k5FQJLBZ+nxTuD/HRUUA3xtLthgpAYAvxEbJbGq0ACNV6Dv1OB8wBE3QWfTd3DVVh0eHYzO6Q46cZwW6G0BPKbENTwHG0ihWiJ/VhmrpJ9aR1y+wZjpZsckvynSpGF1PFtFouScg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oR/Gq+7xkPxXzdD+zuq3EL8ATIG0kCTmEBBwmXuSjPs=;
 b=earAm+ZYFwTNy0ul5y2qp9SJ6cRfitM1sw3KgUZf3oflKwE8T1pCtMgNM/Ngve406GVmiPcohF7Nh1U0FpnqIESzbDklqbMscOn1Upt6vJ2pVR17nbhJ1cB3+NT07xNmzVn83IcCd9V9addfAAEtt+Etzmv3Qt9xVf5LLRcOu2Iy3cC4La9/yJCAEzWCD+A5ldWkV7VDc0ckH8CtGdiyWQepFNFNQduBbv+2qoGRzWtWXx0ITSRCJ7hmR2FioTGcC6YbzpUsbNngvlOxFydKQr5TPtyDqzv30lb55K7i/Q6PCKZ7QoX2JDPAFkBY21RwO00SRLaz+WQ3vz8WxVA4MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 DS7PR11MB7887.namprd11.prod.outlook.com (2603:10b6:8:e2::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8466.20; Wed, 26 Feb 2025 09:42:35 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cd01:59f6:b0f8:c832]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cd01:59f6:b0f8:c832%4]) with mapi id 15.20.8466.016; Wed, 26 Feb 2025
 09:42:35 +0000
Message-ID: <fcb19c07-9daf-4fa4-a856-5e8726a98873@intel.com>
Date: Wed, 26 Feb 2025 10:42:29 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 20/24] ASoC: codecs: rt1015p: Update definition of
 device_id tables
To: Oder Chiou <oder_chiou@realtek.com>, "broonie@kernel.org"
	<broonie@kernel.org>
CC: "tiwai@suse.com" <tiwai@suse.com>, "perex@perex.cz" <perex@perex.cz>,
	"amadeuszx.slawinski@linux.intel.com" <amadeuszx.slawinski@linux.intel.com>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>, "Flove(HsinFu)"
	<flove@realtek.com>, "andriy.shevchenko@linux.intel.com"
	<andriy.shevchenko@linux.intel.com>, =?UTF-8?B?U2h1bWluZyBb6IyD5pu46YqYXQ==?=
	<shumingf@realtek.com>, Jack Yu <jack.yu@realtek.com>,
	=?UTF-8?B?RGVyZWsgW+aWueW+t+e+qV0=?= <derek.fang@realtek.com>
References: <20250220112643.3813295-1-cezary.rojewski@intel.com>
 <20250220112643.3813295-21-cezary.rojewski@intel.com>
 <d1fe2ca16a7c4c9c90bdd5a8480ca497@realtek.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <d1fe2ca16a7c4c9c90bdd5a8480ca497@realtek.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MR1P264CA0114.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:50::21) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|DS7PR11MB7887:EE_
X-MS-Office365-Filtering-Correlation-Id: ab0f58a8-f7e1-451c-ddfe-08dd5649e650
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OVlSbHVPOFNLVmU1Y082T2UvczVKeWV1c20zOXhPUGVERmtYV2czbHM5bCs1?=
 =?utf-8?B?dkY3cVQwMzhHNExzdzRkL3VWWjFENGRaeGI4dk5rdXVqNEN0THBMaEM2ZHE2?=
 =?utf-8?B?YXVVNms0cXIxckhwSUNQRHlLSEovd2tQcGVBQTNnUE9JNURpckg4aldCTkQ4?=
 =?utf-8?B?dEw4RmljaVl0RUNPTGI4bUI5OFFrYXE5R0tqbnUzNGFyTWhwUHVIc0ZtZ284?=
 =?utf-8?B?UWhSOTVkMDc5eDdhaHFZRTVYWkVHMnZMSHNKU25hbUJPN1JYSHlNRnFIejhZ?=
 =?utf-8?B?aXc3Z05jVVNrL2ZQSEd5L1pLZENkWGZQREJsQ3RNN1JwRnIycXorMGFleCtC?=
 =?utf-8?B?OEpJZEROelpBTlhtdC9YOCtPd1dUbjg2VGVNRms3eHovL01RWHRXRERrR211?=
 =?utf-8?B?Tm8zMWJHUzJJU3k2SzNsZ3I1MTVSd1gxd3dnSnRDK09qdExWdEJQS0tWUWJI?=
 =?utf-8?B?Kys1aVlVeUhmZUUwUTZCMDQxTlZCZjdPdXNKWmxCUk1QdjBlaDhXMEZiYWRq?=
 =?utf-8?B?VGZ5M0JuNWpFSzZTamJYS25KNWlhN29YMVlTM0lDNTlwL0h1SFF0RTVPVjV1?=
 =?utf-8?B?OUdXSnc3am1VTTluQnEyd004U1RvbllLQlZabE85eGU5OGh0MTMxZ2s0SXNG?=
 =?utf-8?B?RjMxRkRnWlhySmF4SDYva1JFOXh1NDhrbTdMakxETk1veXlNKzh3QjRDbFBK?=
 =?utf-8?B?RmJLTU8wTFp5VVJNNFVVYWQrNUkyb0tQV2M1eS94bVJWNzhvWTNnNHJOUHg1?=
 =?utf-8?B?QVJoUHBoTzIwVy9FbE1vamdta0YreVFwNGo5cVVOem0ydEpBay9keVN4TE4w?=
 =?utf-8?B?MWpzOWFDdVdmQWhIZzNJa3R4ckIwLzJBbGRlVnNhVXRlL3VLVTJFVVpHQm1H?=
 =?utf-8?B?b1BRczlZMUFyS08zV3YxZnVWbEpKK3d4dlhlM09MK1RJaENRbTh5SG5KaEVu?=
 =?utf-8?B?ZXlQbi9OSWF1V2gydVRzOTllMHh5VllVVk1PandUKzArOUk4S0taNnc0ZWJT?=
 =?utf-8?B?eStuODdnaGozMGVFamhYMkdPWlNGaGNlR3EzMTVVRkFScEs5VkVDTklianZH?=
 =?utf-8?B?b0tqUE1xQk5lVkp5Y0tKSzZEZWQxVmdUYjVUKzJ3akFaM21WMFBlVjVJK1F4?=
 =?utf-8?B?R1k3bjlNcmZtSnJLYnpPZXRJcm9wN2g1YWthaFkwU0MxSytqdVVvM0RlSVBM?=
 =?utf-8?B?ckZEM092T2JQWU54NXNOdHg2Rno5dFh3QVlndHJlZXRyNHpEdmJMRDZscFR5?=
 =?utf-8?B?STdXMTRqWFZ2ZnlHRThLQVpvTmZFdFhXWFMrb3AvdWRyTjN2WlNYNWpyN3gv?=
 =?utf-8?B?Z0t1M0VTb1ZFMzUwZlgyTVhVdUJEUzNRM0VpUnI5bEZvUFA0czJwUHJHNFlu?=
 =?utf-8?B?YmNLL1Y4YUIwdUJ5VFdkalM5ODlQQ0w5dzNDdHNWa0orTXdELzlHcWE1azA4?=
 =?utf-8?B?YnhoclhvRE5MRVpMUEFoNHR2cGxyUExyQjlVYUNCaFhNaFg4ZkhFbnJ1TXZO?=
 =?utf-8?B?d3NJT2lZRjNGNTgrM3BydWFka3JGaWdxQ28yaCtDTFIzeVArclM4OG9USlk0?=
 =?utf-8?B?a25NVjBTQUVHMEg4UlVCTG5JdWxlOVNuUjFJMThwbkU4OTBGT0sxZlZZbHlZ?=
 =?utf-8?B?RGVLeUcreUFXMTBLUldWNHdCbDBEWGZnZ0J1NE51WnMyZUk4bjNBTVA1S0Rh?=
 =?utf-8?B?N2FldlozbVpYZVFCUFI4YWxXQnNnckF5ZjBOWkNkY2ZHQy9ZdkV0ZG9tTURQ?=
 =?utf-8?B?MmdEUEhobFEzSU1RQys2OXFPQXViRGNIQWJQVmUwSXdpWmZGTWxnK3BhNkZF?=
 =?utf-8?B?Q1J1NzFKWWdnWTk5amwxUkpFakFiZjM4TVMvUk1MK09DR1IwTjN0TUgwNGRy?=
 =?utf-8?Q?in2LrVN+aVVyB?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6375.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?elg3WkVFaUQ4ZG8vZ3JlK0FEMjVXRnRtNW5uQkw4dkZsUDh6emlZZTVlYmhO?=
 =?utf-8?B?QnBKYVIzSGJpVXlJck1QckFCR2RaYTlncDc1SWFFSUlEd1VGL1BLeU5pMTIw?=
 =?utf-8?B?Yk9zM2JtQ3hreHplWlN2dGt3YjRZWHBWa0dJS3hHK1hKUVRrWVplVVZrUmpK?=
 =?utf-8?B?cGZkVlcybDBPb3laN29JcEtxN1VUaVFDRktsN0VNU0JoU3d5TFRobEVGSzVP?=
 =?utf-8?B?WHRuSVZNK2RwYVhYbXdORzgrc25IcUJ3eHpmRXlzUi9TNjRBQW9UWXBsaTRn?=
 =?utf-8?B?TUVsMzN3aENWdmw4ODNCakxydjlaWndQZnV1cGhGTnR5YlBiTXNVSVNiQUVw?=
 =?utf-8?B?VkFCREMySGd3L1R3eDZ6ay81UWM3YVVmSkJWNGNlNVZ3QW80c2creGZMSjQ2?=
 =?utf-8?B?cExMZUtteWVWTzlGbmtuU2Rnczh1d0k5bjFoSjVEOGx2bERyc3BYRzNqdHFu?=
 =?utf-8?B?bS95MmVPY0Q0dndhN2ZDMWJWUTBUcUhtcjRsckFzU01JcTA5Ykwxd3l2bWpQ?=
 =?utf-8?B?WW03b3Q2Z2prZnlxZEFxL29IOG5EWkRLSnVJN2phOEhsMCtwT2Z2bWhQOTNR?=
 =?utf-8?B?NUZKRHFmZkRhblFKTUlkcHAwV0wxcll3QVVGNXRGU2Z3ZFQ2cVFXdWR4a2RP?=
 =?utf-8?B?NlVFS3J4OUQyUVpHbk9VQXEzOHUxdW5VNWNqOEFZVURWdlZLR3g3Qnl2ZE5L?=
 =?utf-8?B?NDBJalhJUFpxMnlsc2V1R2k5YUx2WW5iZUdydG0xcm9UbmxuZzQ3eW5IcE1U?=
 =?utf-8?B?WWs2a1l1VmszcC9IeTRZOE8yVEhWL0RUUUZyL1lwWEdTdzlpanExM29XWE1H?=
 =?utf-8?B?U1liWllQYldGTjZWMGNsRjVjQVBVLy8xYlBIVUVNU0x1MlpyYXZiNXEvNXh4?=
 =?utf-8?B?aGs0bVpYUEkzN25jMFYwWlZZYmJWcmhmYjl5VjlmNG1vdEVWUE9DdnpON3Jn?=
 =?utf-8?B?bTh3OFgxb0pscjVpRjRtREkxNXltcExOU2ZpajNFMi85d2ZYdW9qb3pISzAx?=
 =?utf-8?B?bHRiSnd2djFBRVVOakpydnJrTWdack1pYm1zOFo3Z3JQMWRIYTZqTlFMVkdW?=
 =?utf-8?B?SFNldWs5R0gwaHkxbUcwSnhUUWw5Sm94WWNEQjVwZnpLQmdWY0xwbVZXZzZL?=
 =?utf-8?B?b0wvNzJ6Wng3azNYN1dsbjBXeWF0NFFKTUZnSUhFaEl2SnNYblYrTUl6OEJn?=
 =?utf-8?B?Z1hyRnpETVNVOFRDdlJmOTZQa0xvcXZlVE9JSFNiTkNCcmgzS21UbjRscytt?=
 =?utf-8?B?U2NDUXBVTmZpVE81ZFBvalhmSDRUdDhCNE9jd3FoTmI4bUI0cWxiczFkaG96?=
 =?utf-8?B?VEZYZDN4dHpHeTNzckJJb0FicC9mYnRDMXcvQ0lQbi9qdWVaVHlrakV4MDhS?=
 =?utf-8?B?VTJaSldLWGlVVXgrZzJEZzhhS1FsTjBnVjJiL2JtdmRtUGpNODliU0ZoZ2da?=
 =?utf-8?B?T0p2S01WbHJRenlmUVlzUDRJajY0QjRPM0hjTTZ6K3I4UC9ORVdpWk4zQzR2?=
 =?utf-8?B?S2JaRGdzVUM2RjlVRDRGbFR6Ynlya2hKNXZKblVoVjM5UmhkdjBGbEVwMmVJ?=
 =?utf-8?B?NTczU2FiOWRLN2thR3BLUU4xZWF1a1pBN2s3eWh2UVd0S1p0N29QS0lSMGVn?=
 =?utf-8?B?VWR6SmtwU2IyOUVJRG9EUCt5aXhaSnhRdGVNN0l1WGpINTlCYkt3S1NhNjhw?=
 =?utf-8?B?NlI0QXhYQVJGdThWZlg2T2U5RFRLSm5xNkdjYzJVWU0xblNmU1JJVUNxcWRx?=
 =?utf-8?B?WGdzdGEwVHNNL1FWbHA2QUozMHB1NVhnMU4vVEZIKzcyME9TbWZoSVdZaGtB?=
 =?utf-8?B?ajc3dkNDcDVUcGMxMUxXOFpWaGhQYXViWFRObTU3ZGU4N29USXJxenltT2o3?=
 =?utf-8?B?K1pPVkRJUUFTc1F2bFh4NVMxSjNOaDdrUStUK2diVWJ1OGRtbjVkUGtzTE9t?=
 =?utf-8?B?Y2FENEt6TTIxUUc5K1Nwcm1XbEJoV3NhRTJOR0pMdTNjSjhNZldJQ2E2WHZP?=
 =?utf-8?B?cHl1OGxFOFkrNzRnbGRnQnpZTFFZVDNpaGVvejdkeWNjOENjRmIvV2hhZFhJ?=
 =?utf-8?B?SGZ1NmxReFhtMGZMMGIxZ2hRM1k5SDk4RG5YRkgyZ0hic3ozNE14cmxTT2VC?=
 =?utf-8?B?NWFBYW1jYk1hZit2TUV1dDd1RncwRGRidlMvcENaQ0NqSjBwSDBWKzNBWDJy?=
 =?utf-8?B?Ymc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ab0f58a8-f7e1-451c-ddfe-08dd5649e650
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 09:42:35.4887
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5ehzdp5pQIqsr63pipSWtcN4zupBnBu+rmQ2YNqk5oP7b7uSmClGU46ATninESPnnsRxqdCteXF0r0Zo0iIFiqcetl14KyYOBDbj/WSEk10=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7887
X-OriginatorOrg: intel.com

On 2025-02-21 3:38 AM, Oder Chiou wrote:
>> -----Original Message-----
>> From: Cezary Rojewski <cezary.rojewski@intel.com>
>> Sent: Thursday, February 20, 2025 7:27 PM
>> To: broonie@kernel.org
>> Cc: tiwai@suse.com; perex@perex.cz; amadeuszx.slawinski@linux.intel.com;
>> linux-sound@vger.kernel.org; Oder Chiou <oder_chiou@realtek.com>;
>> Flove(HsinFu) <flove@realtek.com>; andriy.shevchenko@linux.intel.com;
>> Cezary Rojewski <cezary.rojewski@intel.com>
>> Subject: [PATCH 20/24] ASoC: codecs: rt1015p: Update definition of device_id
>> tables
>>
>>
>> External mail : This email originated from outside the organization. Do not
>> reply, click links, or open attachments unless you recognize the sender and
>> know the content is safe.
>>
>>
>>
>> Follow PCI-based format (10ECxxxx) for ACPI IDs by adding relevant
>> entries to the existing table.
>>
>> While at it, there shall be no comma after the terminator entry and
>> initializing fields with 0 for statically defined structs is redundant.
>>
>> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
>> ---
>>   sound/soc/codecs/rt1015p.c | 8 +++++---
>>   1 file changed, 5 insertions(+), 3 deletions(-)
>>
>> diff --git a/sound/soc/codecs/rt1015p.c b/sound/soc/codecs/rt1015p.c
>> index 44e7fe3c32da..33917438196f 100644
>> --- a/sound/soc/codecs/rt1015p.c
>> +++ b/sound/soc/codecs/rt1015p.c
>> @@ -133,9 +133,11 @@ MODULE_DEVICE_TABLE(of, rt1015p_device_id);
>>
>>   #ifdef CONFIG_ACPI
>>   static const struct acpi_device_id rt1015p_acpi_match[] = {
>> -       { "RTL1015", 0},
>> -       { "RTL1019", 0},
>> -       { },
>> +       { "RTL1015" },
>> +       { "RTL1019" },
>> +       { "10EC1015" },
>> +       { "10EC1019" },
>> +       {}
> 
> There are different settings for RTL1015, RTL1019, 10EC1015, and 10EC1019.
> RTL1015 and RTL1019 are used for powering up and down via the GPIO.
> 10EC1015 and 10EC1019 are used for the I2C-controlled driver.
> Therefore 10EC1015 and 10EC1019 should be removed.

Sorry for the delay in response and thank for you the feedback.

I'm surprised this hasn't come up earlier in the discussion. I'll 
probably cut off problematic patches so that majority can be merged. 
It's important to have some follow up though, on the subject you 
mentioned. Correct me if I'm wrong but from the .c files it seems:

for DT/ARM rt1015 & rt1015p are represented by:
	.compatible = "realtek,rt1015"
	.compatible = "realtek,rt1015p"

for ACPI/x86 rt1015 & rt1015p are represented by:
	"10EC1015"
	"RTL1015"

The first pair is nice and clean, the second is confusing and error 
prone. Do you know where the second pair originated from?

Kind regards,
Czarek
