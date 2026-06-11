Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2EEF4D2EF7;
	Thu, 11 Jun 2026 18:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781203489; cv=fail; b=AFE3frdmnGvxdGE0HJIwAA/sLEW0olEeeZKDxH4NGdui4kcp+uPBBRHZPQol0mN4UvuFMI6bBh3jEW7V1ZMiRsCU5+0cTFxPTqx/5/kV+qy/6MdXyOTV3W0/SrO/r0FWrPji31UoAFZHIhI2tzd86rBR0wV6hxQviXZnSKdcxmk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781203489; c=relaxed/simple;
	bh=xxXimks47xyQy0tDTAjqh4A1vNu0JtfvLFoQ6DQWTQk=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=MZ9Hf9XklyNpEQCoO4rTWUtBLnLAKMZpCwCGibv6OBpLz84x65wmHpMK+j1iN/g0ctEHOvAXk1EMFvZ6R1gpLG6Wc9JNmGdY2BbR31kVDrpEBLUkYMqr4A9odA+SnapFHb/JwqgicoZ5Y9OHEucEfb6VF6U/fgjyqaqYLykpcJY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M0M/Hox5; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M0M/Hox5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781203489; x=1812739489;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=xxXimks47xyQy0tDTAjqh4A1vNu0JtfvLFoQ6DQWTQk=;
  b=M0M/Hox5SuHblP9TMPY7CJYvxrRcsA5VMEb2pP5HxkABoC9nq/AUSN8P
   HqcyZnQHgSW5FwBWMYwsMrBM+QuQ7dQMaRNlBretRAHiSW9AbMkna28nl
   +D9+yHtisCvy3fFtkCz9BhpDEOXNxDLO2+1xOL2MzmyCTkBMeQo/a65gI
   8C9hhUGdJERdtK1ks9vi8kGP70IxlVRXGITcVlvBGkpsgxrcGns9dIsT4
   F/W3ItXL4JY0BwATkwfQQJJdiqBvGiVHeXAvPUGWSpc8oljBZXhqtuA5W
   dpZAbv/PoOUmvkw2PkQPslG0DT3vZOcdnA50tvSu9rNhVYdmhlzHYpsHP
   g==;
X-CSE-ConnectionGUID: fmEpL/mWTgiyGxKLSEyPMw==
X-CSE-MsgGUID: ZXNhehlCSdCG5sG7oqiIhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="92708471"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="92708471"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 11:44:48 -0700
X-CSE-ConnectionGUID: yyfMtM/XTOKe3ZaghFhlmA==
X-CSE-MsgGUID: XDKlzHdFSQOKJVZpGV20Zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="276760504"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 11:44:47 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 11 Jun 2026 11:44:46 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 11 Jun 2026 11:44:46 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.36) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 11 Jun 2026 11:44:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NYyf2YkMJurEk/EPAhruQYgzq5Ij4anT09jKRlUKf8d8acfbz8yD0nsZYZnFpxHtANNdwwEFEsoa9NGZgdZR6MSEUbMU3vClIhbzRBZoRq9aHDBX8ubSNGHupR5xSirnSTCLEOICPBQCWPwaqK/hhDx5qIE7GnUQy9SWtw4Zh3Qrl4P7PuYOwiuX9HmSVQ6SuakmbO97GgID1nSRIz+p2XPinnJWNIhDBFGF0OVL8oyBkJ8qOZvMrAefX6y3MrfYVSzrc19ifH8v1fRYQkvZ0FFv9J/g/zGXXAH9G2hEORYnmz6lnnNccIVyxNxnTHvkvQ6jQrBerSBOV2esaizc7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kFZXGRiMBVYbw5tJ5PKpI3QrBcuJ1r9K3FoyYIhVU0A=;
 b=ZW52ewLntQiF6yTd4aAIRW4uybgeJht/TsVFDHckAgVH/akzzLOZu2UC/oq8TcXs7ChZPEB/oj41K2UV2CgRDHe/9TFd/lip/13t/qAW8g2pZl2BAHDfPc3100RuR6QHax9W9QTPTR8u9EzE1weR3d5dJlWLBEFu0qdO5hNnmcz798cuVhyLxs7DqbKG54DLtY/ZgFfxgKqEhgDDlx4qxS+lf7kc4vZRq/wA/ed4sXWpm/Vx7GhWakJpToUEgLMKtTcuDypONOWzzL5feoappUV2A0b2NL3c7ssJklibM0Xn1uIAyrF2zYm1/lRFSdjlYVXEULWMWtslglNPwYOxcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6978.namprd11.prod.outlook.com (2603:10b6:510:206::12)
 by SA0PR11MB4654.namprd11.prod.outlook.com (2603:10b6:806:98::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.17; Thu, 11 Jun
 2026 18:44:39 +0000
Received: from PH7PR11MB6978.namprd11.prod.outlook.com
 ([fe80::f60e:1044:67d7:d8fc]) by PH7PR11MB6978.namprd11.prod.outlook.com
 ([fe80::f60e:1044:67d7:d8fc%5]) with mapi id 15.21.0092.011; Thu, 11 Jun 2026
 18:44:38 +0000
Message-ID: <ff85c2cb-1c7f-4c71-9c82-63a10aa6d9e2@intel.com>
Date: Thu, 11 Jun 2026 20:44:31 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/20] ASoC: Intel: catpt: ipc: Use guard() for mutex &
 spin locks
To: <phucduc.bui@gmail.com>
CC: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Peter
 Ujfalusi" <peter.ujfalusi@linux.intel.com>, Bard Liao
	<yung-chuan.liao@linux.intel.com>, Kai Vehmanen
	<kai.vehmanen@linux.intel.com>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.dev>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>, "Liam
 Girdwood" <liam.r.girdwood@linux.intel.com>
References: <20260611115901.80438-1-phucduc.bui@gmail.com>
 <20260611115901.80438-2-phucduc.bui@gmail.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20260611115901.80438-2-phucduc.bui@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1P291CA0019.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::23) To PH7PR11MB6978.namprd11.prod.outlook.com
 (2603:10b6:510:206::12)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6978:EE_|SA0PR11MB4654:EE_
X-MS-Office365-Filtering-Correlation-Id: df84ca15-6449-4771-7171-08dec7e97d5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|7416014|376014|1800799024|11063799006|4143699003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: UQLo78UI0rWVDGjoH4fH0dfT9dHQEtJssNpWnJ7yS/0NZFRqoXMX2BA1CcME9y2XVAi4TUvrmQtHlZfBDNu4a29bPhaPiw5eJaWwQutdhcMWwDT3JU3r6IFneoPN2jeT7CcecwOvaFw9YEqvxANFq+pn4DUdqAGnWUequRjNKsNouU7Gjn6j/yqQl7OWhiwwysiB6HY6/ctSpt8a+WSz0/KV76HnfQCA18am3b9rjYdggb+lBprNEwrV6BB/4qxjQvFMInsVkoLhG099jnJ4wdiCmMWWdefN7CHBeO7ZnnjQvq0IP7p1KpMgn74+KQ4umy2ZjC4WoL9rD2LMOLdZll8gMA2glrpnQLBTuwOnlNN7WhaBlNUmgAdFqkva2mD6ZDeGBbSe97XRL+QqVvOmudJsiw2MF7ftSQI1hIc0lWsV/v75bLTtaJyQHlzZmsUxoCPvUPJ9nlvVLUjCi3yTBgaLD3TUhnt+wZBHA91e3tfUmRFRp+tKqsMl7P0ZkSBEhMTMXcxIzy39QOwhljPos3eBP6g+9xwjhXU09R+IxYcWUcyP9jeg8/XID+Ov+/A2YbyTpG6d1JU2E7wDUh4k94ZH8/cTz77U21NlZnFaOe6O03ndmy22KLRPyX0Kxv70Vzb3rVwQUPuIZqTZ/iUoKJIcnxbpNfoMVBJ+w/BWfX1usYPy/yMV6jW+v3TTKn2OlHQIWLXQdXwzKR/+urY/bA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6978.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(7416014)(376014)(1800799024)(11063799006)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?emJXLzYrNDhpMDNHSUJYbVZaMXp1Vmxpdy84c2FveTUyMy9MZWRNVFJkVmlm?=
 =?utf-8?B?TWhsMFJVSTdLR0JCQ2pKeTJzZ1d3TklYSTFLZkxsbEhvL2toZUp3N05tZUVQ?=
 =?utf-8?B?b3VEV3YzbmlnSndNRk01MlRGSmM5czBiMS9ZRjY4Qkx6YXpmRUxyN1QreDJP?=
 =?utf-8?B?MXN1RGZBdlFhdW02UE1Cc3k2VEpZSThpTFRiSUNhenFYbHdwUWozaGt3aEdK?=
 =?utf-8?B?Mk12UCtleDhYV1puK1BwRFRMNUMwbFNieWVQQjBOM1oremFOSFJCOTZFcEhB?=
 =?utf-8?B?dWNBVjQ5eTR0U2wvNEFpdjVIZk9TRzcvUDREWHZieUNicTlVNVNkeWJBYWdt?=
 =?utf-8?B?Ymk1dVI0TmtZZ244RmJiSndoTUlzQVg5NnpMRW5zdmxiaXRBM091MVpuY1JE?=
 =?utf-8?B?blVseENGVWVNT0l5WVJkNm0xcE9yU2c5UG9rOUpGUi9BSGtGcXJrTzRXYmY4?=
 =?utf-8?B?cDcreXRPUndYNjBFM0hyellUK2hZM1Z5RW10djZNWFBtQ0kyekowQmhJeXNT?=
 =?utf-8?B?S3U1VkNQbXRDYW1vbTcweGJJUldLRW1Vbjh6MFVZU2piclh3dCtnemdya3dW?=
 =?utf-8?B?LzZkM1JHVDhYZnZxb0ZZRkJVY0c4WmhZN1FVVFN2Wmh4NmJqQmFyc214OWZa?=
 =?utf-8?B?M3Q0WVV0SGhDeXlTNVY4UDg5VFYzRUIrYzA3RHZsVDhHQ1Q5bXhQRnlmcC91?=
 =?utf-8?B?THd4YS9UYnErc0grdWdZSXBJK1hIKzNXRmVzNDhJMTBYekRkU3p0WEI1NU16?=
 =?utf-8?B?RVZadGJ4SjQwQ3d5T0x3ZmNMMm5QRnBpUmdyaWl4WnYvTFhkMnp3aDRReldQ?=
 =?utf-8?B?K3ZhWEtMZlNUWGZHb205N0FaZ3FndlhPVWZIaFFLSGdRdmQ1ZDRsZVFEMnhQ?=
 =?utf-8?B?VFFXNW5YaGpCNWV1VjhlY2JuMDFvV09wQ0RYRHVnOWpkWElDdjhhOHN1SlZK?=
 =?utf-8?B?T2daRUoxeU1jWkF3eXVmaFB1SlVYdjlHUkdPMEVQTmdxcnZuSTVzNmR5N3Ez?=
 =?utf-8?B?MEJUSm92cmtWbVpwVG1sbGdnUUk2eHNRdzc0cHd4b3VHUlhZWDNSR1RGQStF?=
 =?utf-8?B?Vk9BcSt0eWcwUTNYLzh5dGZwa0tMTlR6aThrVmpEc0lCaDVPYW5weVpoenox?=
 =?utf-8?B?ZjNDTHo4Nml3OXlHdUsxYjJDT2QzRExYZCtVQnJhNTBxS2g5VUhGMnkzenB4?=
 =?utf-8?B?NmFPVlRIajRncFhWNVo2eWo0QW9qMS9qU29LNDF6bUxOT3o4TnlQQkV0L0Mv?=
 =?utf-8?B?WUNqSjg2Z3F5WGRzSFhVUGtHQnhPbkE4TmNPN0tXaDdoU1N6Rk5Rdk1jaDhY?=
 =?utf-8?B?dTE5SzRUdTVoWkhJTHVabHZFd2NRVnRsMnhVZ3RpQzgwZWpDNnZzc2NoQXhV?=
 =?utf-8?B?YllnSVkzV3RZd0NaaHRPSEUwYkFSaWRxZnl5L1c4YXozbngrR3Bqc1pCa3VN?=
 =?utf-8?B?NERNYmJ2VlE2OVlyVzIrQ21GeTBxa1V6dFZJZUpMWGlXQVh0VkJXS1hyMzJT?=
 =?utf-8?B?bTUvMXNnUU92S3BaVERlTmY5RDllS0YveUIrTFF6QTB0QVcwT0kzTDRFZ1Bo?=
 =?utf-8?B?VXBLcEZmdVpDUzNOYXNqcUhtMUJVMVRYeExvbzFKM2REbHcycFdENlF0b0RQ?=
 =?utf-8?B?cTh4Vk9vdnR3WU5STE1zMkRYQy9BTisydjBra05adFhNUUVRNDlVMHVoRVAy?=
 =?utf-8?B?WC9ObW0yV2dkcnFNZzVvc0d1SUhpZXkvM2tycThVTzNRNDFCQ0paMG44Z2lJ?=
 =?utf-8?B?MFlwVmdqN200NTdkb0t6TE5pRFZwUnowZzdkdTBtejRpQmJYM2VPTU9KbUZC?=
 =?utf-8?B?MjFWRzRBcGF6SVozZGpaeEh4RmU5dW1MWlJqYzBhV0lsa1JyMlJnb3ltZk5O?=
 =?utf-8?B?cmlvTWtoOFRJT1Y5WHovOHVtbHZJSEFvQWZFcXFKbmlRZUR5TVQ3YWViOU1Q?=
 =?utf-8?B?THdGQThzSzI4N3liaC81dGFpUklKQk1weXJweFMvMEw0Vm9kMUhuSjVpbE1H?=
 =?utf-8?B?aG90TW5HVTF1S3dZeHZVUHU4dE1BTkFJcTBQb245eHBVdW9GcUdXbFBFNDl1?=
 =?utf-8?B?TWNGNzZ5am4xRksxcnl4TjZjREE1aDJLcGlRSTRtMDNsd0liQ3lGYVNsaEN3?=
 =?utf-8?B?Ym50NW5DRWdxYkthUVcxZW5MZ2tXT2d3Q1JMZUorZGNTMnNCWWZwN1BucS9L?=
 =?utf-8?B?MzlKVTUwNkNtV0xYQXZSUjFWT1NrMnlGOUZqKzFUcDRJODZDRXg1L2dxMC9O?=
 =?utf-8?B?QVpXZzV2a252WE13NDQ3NHFzazZKWWFPekV3YTN1UFBSVjR3TlpFREhhNFI2?=
 =?utf-8?B?OHk0TFQydzdlSGtsZXFFNmgzV052amFBK1J3a1FVU1dqMWIyaXlZZz09?=
X-Exchange-RoutingPolicyChecked: nMIKq2CZWMpsPLPDJtD9Whb97xX5PZJ1tw3oTCVGc9MHFdPbvA+Un+r3GgJdKKjaDJNARVlT1iTZeYEyoHUIwdh1RjFrwzXbTwERodX4c9tfxXBOYO/K1238QxAz48bGBqmmr+dmV7JZpzWRE7yfNE4cCF5lZMrWhNDD3NJdN8HFz90ldpbikS+JgjWrU1clUXhiuGv5HzrFVC967nbdyhX8BP0Z2H6qcqKkRFpe+H3y+jmsjyBTRF+R1j3l+JEHD3BI28r0851NjLhNzxqGlOIkjS7SO2iA4l9btA+KNu5jmSwtPL0BGVagoUjQjRGvSjp6eKksqAutQgKRb/hh0w==
X-MS-Exchange-CrossTenant-Network-Message-Id: df84ca15-6449-4771-7171-08dec7e97d5d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6978.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 18:44:38.0309
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ri/ND85ZXAFn1D9LjUhiPpG6WPtjexznj4M+OySiheifAo0QCYMvnRd1RK53/ztDnKq6VcSnEHbw08E+oQZu+REhmBRCwKwrHnWjCBkQjcw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4654
X-OriginatorOrg: intel.com

On 6/11/2026 1:58 PM, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Clean up the code using guard() for mutex & spin locks.
> Merely code refactoring, and no behavior change.

The catpt_dsp_send_msg_timeout is already part of Mark's tree [1].  At 
the same time I'm against using scoped_guard() for 
catpt_dsp_do_send_msg().  The existing code is small and transparent, 
there is no need to tabify it.


[1]: 
https://lore.kernel.org/all/20260603085827.1964796-2-cezary.rojewski@intel.com/

> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---
>   sound/soc/intel/catpt/ipc.c | 12 +++++-------
>   1 file changed, 5 insertions(+), 7 deletions(-)
> 
> diff --git a/sound/soc/intel/catpt/ipc.c b/sound/soc/intel/catpt/ipc.c
> index 2e3b7a5cbb9b..9614ade5d31a 100644
> --- a/sound/soc/intel/catpt/ipc.c
> +++ b/sound/soc/intel/catpt/ipc.c
> @@ -88,7 +88,6 @@ static int catpt_dsp_do_send_msg(struct catpt_dev *cdev,
>   				 struct catpt_ipc_msg *reply, int timeout, const char *name)
>   {
>   	struct catpt_ipc *ipc = &cdev->ipc;
> -	unsigned long flags;
>   	int ret;
>   
>   	if (!ipc->ready)
> @@ -97,10 +96,10 @@ static int catpt_dsp_do_send_msg(struct catpt_dev *cdev,
>   	    (reply && reply->size > ipc->config.outbox_size))
>   		return -EINVAL;
>   
> -	spin_lock_irqsave(&ipc->lock, flags);
> -	catpt_ipc_msg_init(ipc, reply);
> -	catpt_dsp_send_tx(cdev, &request);
> -	spin_unlock_irqrestore(&ipc->lock, flags);
> +	scoped_guard(spinlock_irqsave, &ipc->lock) {
> +		catpt_ipc_msg_init(ipc, reply);
> +		catpt_dsp_send_tx(cdev, &request);
> +	}
>   
>   	ret = catpt_wait_msg_completion(cdev, timeout);
>   	if (ret) {
> @@ -131,9 +130,8 @@ int catpt_dsp_send_msg_timeout(struct catpt_dev *cdev,
>   	struct catpt_ipc *ipc = &cdev->ipc;
>   	int ret;
>   
> -	mutex_lock(&ipc->mutex);
> +	guard(mutex)(&ipc->mutex);
>   	ret = catpt_dsp_do_send_msg(cdev, request, reply, timeout, name);
> -	mutex_unlock(&ipc->mutex);
>   
>   	return ret;
>   }

