Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6299368941
	for <linux-sound@vger.kernel.org>; Fri, 13 Mar 2026 09:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773394135; cv=fail; b=lMGlh3qMZhEylE20+eRoFNGcPZsV0Mv/b33bbiy82eiGKVLzx7irjPUen/gefIv9gdtCLaGFlsHO/kIZ8uDOBpDgQOgr1R/7VclWG5EXQ3W6eTUiobEtijf9f8sAbX7aL2X9XC4iw3bJPTFtnjd5OfUYC7WbIGEu0kccvkv0UkI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773394135; c=relaxed/simple;
	bh=FpH7eSWmyVLB4y53kD7PovYwnLH4VLbw7Ne0P4egDbo=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=b15Iw/Am+44yPxY6oxeBvbrM4SFEQ9Qj16EzoaUqW+afzt8mWXvVqR6/RgfgK2W9i1vCjykSRqu7s1tNAiZ/Oeb/4exSyCh5j6VyQL+rM4Vdfw0i8NVmzLL1XyZnbS/sxcciz9BtOykORv7DLPeGMUwcxcK7BHa7E7OW3aH6nOU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QfDSfrRE; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QfDSfrRE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773394133; x=1804930133;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=FpH7eSWmyVLB4y53kD7PovYwnLH4VLbw7Ne0P4egDbo=;
  b=QfDSfrRE0s/VeAr4WmACl/QtWhg1ax07e3Nq+xWVkvIOyfn5kpgM7A0H
   HcCrh3s6S5pqT/Yu/+QcqCaMd/uutYe/r1dbwm9bTAKMvDO5HRRx0f5lW
   lVpNPdZout6D0zkSO8vns55QAu+wHfvRxqwhcSyESTpRfylTrU31u448z
   9N5i3lNqFNXGkIApoo53OdrP1Fr9Dy+ax90gaH0TO4VR0+4gdHMHHADMO
   xFEasaeXR9LCv7vu0xbtZ1kQYmOt0I/rbAYBiEIZQQrQ/aJD7Ghz4vMAN
   K+4Ey7h2mvkupF4dWp+YmbWQ+ix0yyR13ojdhBZI7THQ9IBDVOHOfoWYM
   Q==;
X-CSE-ConnectionGUID: byU4VRBFQsysL6izoLW9/w==
X-CSE-MsgGUID: W7SBgF8USLSHChHXZlnFmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="74537822"
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; 
   d="scan'208";a="74537822"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2026 02:28:53 -0700
X-CSE-ConnectionGUID: 21qVeeYBQVWVcGbJQdV44w==
X-CSE-MsgGUID: ovLJf2g9TZOxEspSk3l8Gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; 
   d="scan'208";a="246318705"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2026 02:28:53 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 13 Mar 2026 02:28:52 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 13 Mar 2026 02:28:52 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.56) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 13 Mar 2026 02:28:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RWC8S4wNTO6tX64XL3Ntp5F6zSqnqvm1UFW+lcRUoXP0bygerUrXiIh8dLIn2ftJfTXlhDd5rVlR0ookq6AU7E/QOZIMxxk+zrmzUJcEXb3JWSIrlK2s/hCfD+xTSDUdt0+DXpvX+zSeT1ZSOd0LnrmD53aIefPXr83aqn0gkPcnOUuXQZe39gHp7vJom1yGU6XOogsdbuQgzAch8thHcNzyNcQKaCrcAijeFVIBLd7+1uje8boBLPjaDCgZkbmS3neCMr1ytcF2KQOPctYGh7IGl0tuaJQwvfFxC4FMc3hN01pnU6Rswo6LW75Khue/9A6uthoJldzaAXoPeH2awQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pZFLltCpEP+ZFjZLYRc6EPH3U+LxsAs8sxQ+Jzx7xJg=;
 b=hECdZEJFiiL4O5/mmT7s0YRoNrQuv+3DdjqEMm7xNv+rl5Y4mylUUkTMNxHoqfiOqa/yEhrG6SxSY3cKXMJ/iph2Q/lRyRo7kfCtWOAgHzScv6tU11K1rym9h2VeRynPK192ROSeLPaketqBpCerCusVLh39gVNq//6MQGB5DA9uGSHmwww0+D4sW7ynJaoJxiFyIbtNWBwz6PB/9BvVksK9UoakDHJZ/KBfzkGdHdUSXSdht5aiFSWKGCz0v8WJ5XKvwkz+IAyxRYZPQEdpmnLQWE1SKW+GbaM1u+S1uo404auKmct3KTV7kr5cYKXjDcDv+4PwA8Iz2X+1LBud+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8283.namprd11.prod.outlook.com (2603:10b6:806:26c::16)
 by SJ5PPF64191BB3C.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::82f) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Fri, 13 Mar
 2026 09:28:44 +0000
Received: from SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::d18f:6b38:584a:214]) by SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::d18f:6b38:584a:214%6]) with mapi id 15.20.9723.004; Fri, 13 Mar 2026
 09:28:44 +0000
Message-ID: <bfc1db52-2549-4216-8834-e3a68f084900@intel.com>
Date: Fri, 13 Mar 2026 10:28:39 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2][need test] ASoC: core: cleanup card rebinding
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
CC: <linux-sound@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
	=?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?= <amade@asmblr.net>
References: <87y0k8p6ds.wl-kuninori.morimoto.gx@renesas.com>
 <3582df07-8d1d-488e-b76b-b8c288d35ea4@intel.com>
 <87qzprywbh.wl-kuninori.morimoto.gx@renesas.com>
 <87ms0cy37u.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <87ms0cy37u.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0102CA0064.eurprd01.prod.exchangelabs.com
 (2603:10a6:803::41) To SN7PR11MB8283.namprd11.prod.outlook.com
 (2603:10b6:806:26c::16)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8283:EE_|SJ5PPF64191BB3C:EE_
X-MS-Office365-Filtering-Correlation-Id: 794a3d5b-acda-48a3-e32d-08de80e2eb91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: gBShwsQoPSMYhPij73RjSqF92T9wp5RmoiqIl86LGajegBgQPkVreEZIjgi65g4UGsdH44af59uSdf4uL4gbQDnW7sO4fA7XGs8ylBblSA/1rYbjtrSBAxRmqiDBxiH+p3IuZhuIHM0ne0SrwKte1BwJh2yeAzNO8vXN4zHi7oXHUNmxrl52cQAjVznX7cDIJrPXw+/7jtdvRLnCwvjCQTORRa5VtUqgpbyvKxW9YOPW1VH4+EMJtHHCh1YMIodoQ4i9safxTgxWSyVZU9BO2q5YTfYCF8mwK7d/M5y6uFga+sFuQJh6Pa84RHJ4nQG676LELerN06wXtkqpaLwH+NGl9l3Eh+FhSHmkYf9YTcOfMjzmuK4f7riBB/mFGd6DghP+jfW94LTE0tzdoPUfFCpgXE40y8EaUEtDtSlYQ0tCA71oEDAuwD9Dhy/To9OxcIdObbZAKaz67r4g3RmdKMEwn/xbsY7Gju4W32Q8kngFnbxjptgXR1Uv5jdA2aoP8nsQZ5nA2T4TaNhQ15ojngNVNV6HpIpqNfIhstu+qEGgQsnH9uFTwLcb/A31xa+R3Sazd8tF3LMw9Zzy6LW35PwFuVooAinmCrMduPa/Y2k1oRRTgdL8zrGTkeJFEh+U0wRyJLZ7ZViuIDuBsT15Nn2uw4/vo6QmjzilFJEHq2s/KE4GGG6sUZRgr0awloEYcPSyFlriGujL62MqMykISKkCiQrQsNlOL0/2n/+gb6w=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB8283.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YU1KcUNFb0FwV1VVT1JJalFDUUV4ci9pMTVzS3NmMTU3ZUJmdmpJV1paN1ZH?=
 =?utf-8?B?aGlxN0kvT21hZDkzY3QzZjFxVXhpVlpXSHhPRzJ4VU9QU2FEcjJ0RW1BUmh5?=
 =?utf-8?B?K2NGNVkxclFKQUx3YzZWNXJPYUJ6cnkrV1ZacnV1eEk4U0kvZEVEYmsvbnZu?=
 =?utf-8?B?KzE5WTFhVGhoYkUzWXBaaEhiQ0M2V3AzRGRuZ2pPZEFjR1lyMWI5MUNiRVlJ?=
 =?utf-8?B?cnVIV0VFUjU3djhvcTU1T2pWa3MycTJmcEUzNmczOFBOb0QxL3VVbU9WSHNC?=
 =?utf-8?B?ZW9OVjdpaEZlU1BkcmRoaVZabUVVc1RCSlMvMDF0UXB0WjhLQ2Y4eEh5dE92?=
 =?utf-8?B?WjZvWWlrWFVBZE5HdjlYRzZSS0hmbkZIUHBhd0h0bWIzZnRUMmhmZ1Y2UzBl?=
 =?utf-8?B?NGEwTHduekZ4d3lhUnA1YytBNHBXbmZDS2NnY3dEbUxMbitOVWVuc1hFNjJy?=
 =?utf-8?B?ajdma29qUXhIZEdxS091cGR3NkVHZEpzbTg0OW1udXFuR0hnNk5ZZkZWS1pS?=
 =?utf-8?B?SDlRZFFtVUt1RUpjaGhiMGw5S010Rmo2bVBucWJHdlR6VlNGZWU4cFdSSXo3?=
 =?utf-8?B?aTFVSnlzMmkvMkxtODk3OVlneU0zMEhkUjZDV0dPUGhPVzgxNUlYajRISGRT?=
 =?utf-8?B?SGZBcWh6eVEzSjVFZVE3MEdKdUtGSnp5NHZCNGtNQzdXVnMrRXdNdXJybHFO?=
 =?utf-8?B?aWQxY2RrOTNOZDFjRnlLRE0zQmYxSDlzbEtyUmxQM3F0ZmU1UXhlT2NJYzRL?=
 =?utf-8?B?VEdSUXh3UTlBSEVIN2cwQ3k4MElMeVRvWmcxdys1VVJUc1o2N09nTTVrSGlr?=
 =?utf-8?B?b2dDa1UwQnhpbk5iaCs4NVo5UFhidHJTWnBHc04yV2t5aE1xVkNtdkVHdE0y?=
 =?utf-8?B?bGpKZ0daTlY3cmV0dXUrcEhTemNWZXUxQ0l1dHhpZGY4NHJZSG9oSkZROTBY?=
 =?utf-8?B?VURqVFMrekdOVUQzSC9McnAvdkFXL0tpYlFHWm5tM3ZRNUdGQXRHQ3dQWlZQ?=
 =?utf-8?B?R01wcG5GbXlXQ0lQeDFNK1V0TjNNMkx3MlZCenNzb1ZBeUt6ZnBCaUR4bncz?=
 =?utf-8?B?bVFPcnVOc0c5Tm1sVkdEUTk2QThtZ0NLb0lxanlPRDVmSWJWZVdTdVp0U0Y5?=
 =?utf-8?B?WS9PSVEwOWxla1hxbC9ML3hWTElZbzdBN1JkVzdOYmljQlZIeFh4aXVWVHIy?=
 =?utf-8?B?TkhtNzRiTWxySkhCMlgvRFcvWjNVQThJYldTUFh3cEhPcmdqcm5yaDBoRDV3?=
 =?utf-8?B?Z1VLbFRZa1hBWHg1ZUZ6UXpnTmN2Vk43bGlWTVI2RnZDVk5FUVkvd1hya0hi?=
 =?utf-8?B?VW9nU2FnWHVCN2plNHd0UDc5YTlESE5DcDMvU1RJODdTTjN1cFV3TDgrUlN0?=
 =?utf-8?B?NmYxS0RxU3JDNzgrZ2sxVGZka0M3SGJIbjhoNTMzL3RRMnBuc1JTSXpsWjd2?=
 =?utf-8?B?YXVUUTJYcVpRQVc4MFBhUC93S01RYU9lRU9Ma0d6U29Yd0tlK3pKZ3NhS2Jm?=
 =?utf-8?B?UkgyUFFuQkNKMzNlNzd3UHJ2dmVpQzlmdlN1YktCRWtTZ291cUR2OXR0UGF6?=
 =?utf-8?B?YlpUNVFqVmlKa1pQVGpVKzhqNDFRWjVPY0VqbnhlY3IzcDUvemdVZ08wVmxM?=
 =?utf-8?B?NkdRWThFb1RFaUtsVjFwN2Q4RlQzN2hVZDJiNk52TEhkaHVnL3l5MmhMTW01?=
 =?utf-8?B?SlNlNUQ2ZXJjSVlyaklKcDRoVkh1b1ZXNFE3UUs4WGJtOVFETmNQZ20ycHRZ?=
 =?utf-8?B?UENTMHRWRVNOaG9QR0tkU0NVekNTemw1SW4ybUlkdG1ud1pUd2VFSFo5c1VX?=
 =?utf-8?B?U1JZZDZocHFyR2hhNXM3WDlzc3gzMDgyOGNzYlBOS1lhdHpUUmMvWXhNbDJF?=
 =?utf-8?B?U0dpVGhNd1dBRVlyejc4VUJVcUZpT21UcHY2dmFBUGtaWnREUkdvaHYvdGZ4?=
 =?utf-8?B?RUh1bk5YZmVnYzlqdkhiNnFCWGJucFRFWGRNY29rSE95Si8zWFE3ejA5YUp0?=
 =?utf-8?B?VXMyZHNmS3pmYjFHS0Mrd1Z1UTE0L1RZVThiRWxZelZjWWxhdUlPVVJyeG1W?=
 =?utf-8?B?TUc1NjRvOUFzYTdJeCttbHFPK1NOQ1lJTnE2UzZJU3dlTFUzWldTelhsKyta?=
 =?utf-8?B?MkdRTHU5QTJWS0NzeUgyazFuQVM0b0pwVlhUTStxWFZObUV3dWZ1OEUramsr?=
 =?utf-8?B?YzNFN3FBVkNyd3lzNUh4cTExZFJwNm5WdzlzZ3hydSswVENncHRSM0VqTWZl?=
 =?utf-8?B?TjBlaXN1ajR6NG5ubEVjTVNaNm5XSDU0TGU4OVNCL1NXVnUrZkN0UGtMSXF2?=
 =?utf-8?B?MEpkeVd4c0gwU1E4UjlTWE5kTjZpeTVNNlJkU050MWQzZjVCWHRjUGx4L0pt?=
 =?utf-8?Q?9bteObZ5YjAXxwKo=3D?=
X-Exchange-RoutingPolicyChecked: asuLQ6I7rGKwkmUX4IyIrnutjynaEOM4chIJE7MG1MhuPU9J7hTQ6ocLPqVx8DjfYdKH2BWQpkyXXeYWYZ9t2n5PFLSu3JyboUsz0BPtUrVrC3xTEC+FUSphg3jbcxaFlH0vcOLKaL0FNJjJWsBnsiZLTwoqHKtois/8UlQGrcNOFxHY+Pl36RKqYBSeR/MtwjrO1JxABOzRKbsWR0bX20/BsoxrZPRVdCgah3lRGwoFXgFHUE2v1p1JvmyxOwWO/UkNyBaeiQOrFaxwBBSVfzhmrpQTLv8Og9NvRo5+O6PWehjJuhPd2YlsSanGbI/C4A4BURoVD/V5YAwYzuZ7Ag==
X-MS-Exchange-CrossTenant-Network-Message-Id: 794a3d5b-acda-48a3-e32d-08de80e2eb91
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8283.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 09:28:44.1385
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vo6cpWHZVUUrQy3QZwWkeQENqqCH3vkoNEEJlREf9sq0FEAk0DE1jlLJTq9uGYlZZ7JYwuISutoFe4xaXQCTeHu/gVe+yj9x+3U09pCksM4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF64191BB3C
X-OriginatorOrg: intel.com

On 2026-03-13 1:37 AM, Kuninori Morimoto wrote:
> 
> Hi Cezary
> 
>>> I'm against modifying the list unconditionally here.  If the bind fails,
>>> let the order of nodes on the list remain at status quo.
>>> Right now it acts as a "protection" against possible follow ups.  Either
>>> there is a need to modify the list or there is none and don't touch it.
>>
>> Is the list order so important ?
>> The code will be redundant, see blow pseudo code.
> 
> Still need feedback
> 
>> 	snd_soc_register_card() {
>> 		...
>> 		ret = bind_card(...);
>> 		if (ret == 0)
>> 			unbind_list_disconnect();
>> 		else if (reuse && card_is_not_connected_to_unbind_list())
>> 			unbind_list_connect();
>> 	}

I agree, the above does not look good.  Comments below.

>>
>> 	snd_soc_unregister_card() {
>> 		...
>> 		unbind_card(...);
>> 		unbind_list_disconnect();
>> 	}
>>
>> 	snd_soc_component_del() {
>> 		...
>> 		ret = unbind_card(...);
>> 		if (ret == 0) || reuse)
>> 			unbind_list_connect();
>> 	}
> 
> If my above understanding was correct, I have one concern.
> 
> [un]bind_card() and unbind_list_[dis]connect() should be called
> in the same time. This is rule. But we can't force it.
> 
> This means, someone might use [un]bind_card() without using
> unbind_list_[dis]connect() for some reasons, someday, because
> he don't know the rule. It creates a hole of rebinding.
> Actually I found such code many times before during cleanupping.
> But difficult to notice it, because there is no way to warn it.
> 
> My suggestion here is, include unbind_list_[dis]connect() feature
> inside [un]bind_card() for now, because it should be called in the
> same time, and it is the rule. We can separate them when such a
> situation occurs.


Hi Kuninori,

All functions manipulating the unbind_card_list are responsible for 
holding ->client_mutex.  The (re)binding procedure is system-wide 
operation, not card-wide.  Now, the same ->client_mutex ensures many 
other procedures performing when (re)binding cards are done 
synchronously.  I don't think there is a need in listing all benefits of 
keeping ->client_mutex held.

I'd argue utilizing word "rebind" explicitly makes the things easier to 
understand.  Current word of choice i.e.: "reuse" is misleading in my 
opinion.

By the way, I did not see any response in regard to my "squelching 
EPROBE_DEFER" comment. I'd advice against setting 'ret' to '0'.  Let the 
caller decide.

Another by the way - perhaps we could start with listing the functions 
you would like to see AFTER the refactor? e.g.:

snd_soc_card_bind()
snd_soc_card_rebind()
snd_soc_card_unbind()
(...)

Having this in front of us could make painting the detailed picture easier.


Kind regards,
Czarek
