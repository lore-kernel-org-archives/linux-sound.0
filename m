Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7DF0379EC4
	for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 09:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774604122; cv=fail; b=BzrsVOqhrTfTYcFaschKXsn5zqP2S5EJXFx3I3GPh6istA3iJY/q7NFIKurQcUwiMQB9uhLhmFvGQbXy5PgKDVJeJNhY7PVnFPApuWp9E4bRUGSq6T1N1n4CK0qkTPoLm0z7OHrm1gWmxXDXRq4uFdZrdwUCgAuwul4kVPbNi0E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774604122; c=relaxed/simple;
	bh=VL4GJMXZkIU4qPCoemgkS/MZ0Q3uL+aSDCf8TTEDGBE=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=guFChyrjzQdH4EGnwO4XPwNBBu+DjeqQbnuo9IJIi3mJi85ZCjLUhTOt8/xSW3zBT2p4c09Z+U1A1EDWxSbV6PmgrvfzV3OM6c6Kk5MC0CNVPWtJkEI4DkO3xZe1OZp3V9YGQdG2xhzJGisM5SPFmtUT9fSwABbiP5RxqCSGYzQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C19e3AHV; arc=fail smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C19e3AHV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774604121; x=1806140121;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=VL4GJMXZkIU4qPCoemgkS/MZ0Q3uL+aSDCf8TTEDGBE=;
  b=C19e3AHVIOMPefi/bJJsi3rBwsjIHhxa91KjhcdmcaVqIGU5bOd6YZRI
   qj49GwdjKpzm59CMMZnuG9wd2QeHhNpJDoZnDvQlbXHJW3qxXdLuGJkAH
   3088slPmTiyOBpcuS+46OWQ7gh5u6/t6vA2BsWnA03u/WrAxczQLy5BjI
   mnHzqYNXGcVSxY8a7KpllAb70PESpyoJWOrmXmi/QrZDycXDpHTeVMWxT
   FlaYigtTLiLDwiCpwFoaL07YgIw6ARKbM805jZoVeR9gCvC3KVOeTFwys
   sUdKeg4P2Nm4Q3jxNh1FX4otiLE816BUK6tgpReqpocNrcnX9Jv6lx66n
   g==;
X-CSE-ConnectionGUID: y3dvXE1BSg6zIIayprTQNA==
X-CSE-MsgGUID: 0ld4JDc8RPybjmzAtX9ncw==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="75566321"
X-IronPort-AV: E=Sophos;i="6.23,143,1770624000"; 
   d="scan'208";a="75566321"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 02:35:16 -0700
X-CSE-ConnectionGUID: Tf4An9KVS8292HYn/beMxQ==
X-CSE-MsgGUID: 5Momu3PoTCmQQoqk1wo0ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,143,1770624000"; 
   d="scan'208";a="220418952"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 02:35:14 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Mar 2026 02:35:14 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 27 Mar 2026 02:35:14 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.32) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Mar 2026 02:35:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HJigm7/QRi24ZsN0dXS1p6MEFKxty8vVoXDJ6Qrvoc4fY97m75UnWWv0JMExq21YppbjosfEfJgnlQR57wLUbTKZYgiI7jfx0WmltCHhRDs2jnCuLjKIxUnwML1z1RWEaIQ6PmByrphQEKKRJK4uajZ5aDR/gvYsG8WwKZPscCp9JLaLwQmd9wrFJ1rZcwXb2clVIdkPFJKw8l/Ae2YTG4fJ2tUjyty618wHwYHHqdkm+QuTfWDWja+O1Utj8q4Jt/csXOon2OJjQolP3QCIutnpYChviOm34mdcyxwESAsCw0BN5EQY9/MceFduABwiyBYQQxAz6bpIQvia885cfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ol4zDsJOHaiBTzTqWh7BOwuBARoE4+BBWI4gzADZq5A=;
 b=VlfNhj8gfhhC3ynnzuSg7c+wLCNJYj3C2cY+N1yf4aAlRyMym5Mt3e8SZmH7XDZya5FvljCI3nXqc62YApHNgXyq+EAPXi4S0yU6I/4BubOP9gCDiD6rR30W3pWDQ1jvxDFMn6UDlBuqITGbFY+P3YLjrU0GY3TAH+E9FoJZzipqu9w/y52joXkY0oEYG7eisnQyR+YTvXcS2eSGbo0ryEasecBQI2HV8iN6gC/v6PyQuOTTCLIebZRfl8lbiEk1wYx7U21TW2i7KpmFUiMH3bXePuNhgOk4W3Rl0Wp0vhEji6WJtCW2gRjw2jT83ZtwjQmegLFACd4EEM2Yh2YbFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8283.namprd11.prod.outlook.com (2603:10b6:806:26c::16)
 by CO1PR11MB4977.namprd11.prod.outlook.com (2603:10b6:303:6d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.7; Fri, 27 Mar
 2026 09:35:06 +0000
Received: from SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::d18f:6b38:584a:214]) by SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::d18f:6b38:584a:214%6]) with mapi id 15.20.9769.004; Fri, 27 Mar 2026
 09:35:06 +0000
Message-ID: <8e2422e6-54e7-429c-bbef-f4fb50dd2cc4@intel.com>
Date: Fri, 27 Mar 2026 10:35:02 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] ASoC: core: use Complete rebind cards by default for
 all users
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
CC: <linux-sound@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
	=?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?= <amade@asmblr.net>
References: <87y0jsibki.wl-kuninori.morimoto.gx@renesas.com>
 <87bjgaxkdb.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <87bjgaxkdb.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA0P291CA0022.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::22) To SN7PR11MB8283.namprd11.prod.outlook.com
 (2603:10b6:806:26c::16)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8283:EE_|CO1PR11MB4977:EE_
X-MS-Office365-Filtering-Correlation-Id: ab13f925-c003-4f18-0ce8-08de8be42166
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: B0xGi3Vfrn1GC3Ojvwveb2hWWypjoa1GBbn10mAIreV6Mt9L89QBU1keF+NTfNDB/TmapBXZDNqYSdiG9nvKFwRf/ZgnS4uQbOYsfJAde0w9wm73uvIn8EvPegk5kdnK+CBY9hbmTVNSUSzej/zbDdmYVKTbSmBp77TRK8IEwgMBGdlsqX1cp2nkWN+WGqfN1ecwXeiH6fJDtiRGL0q64NY29SH67njrrP/rpsocBQk1i1+DYJmJfw0KKwfnT3hearLWS2Z0D3E7NHzggnGMSpoBxvjX8ScY+67djhI+SxKIlMrIl9HZkmi6OHYb53emL+Xg/5gJuP/52FKIe+Ah7I72cwFAlBUraCcWAIZk8Wa2mqyA52ewyhpqT0krSu9oLLKLC8K8cXfnzmzzOYOEaGKrJST+yzs6YXPx6eOog7eyA2CFBf90yakY/0ETE5BNqs48v/EGzCaTpaFl1IFHb4uWTzDmIChQDru0788qwcHNU6bng+2mseN98QVZLmf4TRBBChlXw1OkzNDcjEL6uq2dUl8U3NaZFLgk9SW0R/I4ts/v48inqSVQGbQfvDL4io5lokyiRQB3bjMUOD2NXxrQGDsR/2d6J0WC5K9n49nKem92bRLAkQCahWxk6aJ3g4WjadwuToiSTkS7GnpiopLkB5mCTSGzx3obs+ojnYbqO79uAFH1JHbzbtPpznNXbn654VU2E8+pW4VTrHn+XqH4tMss0zKTyH4PCxxD9/o=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB8283.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c1p0ZGxSQVJRSXNPc0kvc2Mwdk5JNi9QODBaMVk4R2gwZHFPQ2ttZ0hOK2E5?=
 =?utf-8?B?emZiUFBhYUhGZFlEQkJHb3N6WWM5TXo5ZW5kVGo4ZEZ6bGxHRXZsNUJONlho?=
 =?utf-8?B?K2RZbFZKT2xPK3R1dCtPY0ZaRjFHQ0pTOU9XYTFTWndLWnFVMXZWaC9WL1hx?=
 =?utf-8?B?SEJBTFJTUjRHM1JJSmdxbHJiSXlleE90Z3AyOTB4Y1RKVnc1cVNucS9jeHI4?=
 =?utf-8?B?a3pQaWlzOUtHN1pva0E1cG0rR1RQeEI1cXdDY3NabllPdDRCRWJHWk1GN3p1?=
 =?utf-8?B?V1JadUVkOTBJVDFnZ0U1bmFKMTdRS3RpbHBRbmlySjdvNVNMbmpqTE02aVNS?=
 =?utf-8?B?T253NFJ0UHBzREZEYm5KVVIwT1R3NzVGbERlKzI5RDRCZWxCcUFiUU1idkwr?=
 =?utf-8?B?SzhYMnViZlZybkROcjIxc2NQR1lOR1E5NkdsRFZaRjEyM0ZNc2IrZlJLdytu?=
 =?utf-8?B?ZGVXZXhwbThBNHRFM04vQTMrWjRHMUZ4Y29QRzNlWC9vRTBlc24rT0NkUjlY?=
 =?utf-8?B?RmMralhzYzBTVWFVUGVSVmJqNWM0bURLSTVoUHJpdC9GUWFWTUFhUFluWDJF?=
 =?utf-8?B?bHlGYU15R2NEdW9tdUhjZVZtS1NUWlMwdVJmSWJTUFlaL3IySkdVeFZIUUFU?=
 =?utf-8?B?TXFhNU9VV0hsejh6QXgyUnpoK0RvbDQ0Q2ZWdGFXK2hHbFhKczN2c0pEYVVC?=
 =?utf-8?B?alZLNEZvUzhia0hIOU1BeCs3QUJUeUoyQkJDb1JNclMyL2V5WnZlMm15UGxI?=
 =?utf-8?B?TlFZRzF0WWk4clExb2FsdmdzSVV3NWZ2SzQ3MGJOK0o0NW5Vc3U3djZkcXpi?=
 =?utf-8?B?UTkxTk1ERG5GeHlPQ2Vwem0za29LOFBYREg4VEZRZDROc3d3UlBWekJUQXJL?=
 =?utf-8?B?a2hkYmdnTlREQU9zUGlpbXVOc1lqMlBuQ24vSFlCaWx6V0lmbDZpc1lGY3hF?=
 =?utf-8?B?VlE4WXg5a2RIZUtPRW9nMHNxTDQ0b1A4K0F1TmE5dzF6M0hucVAvbkw3ZmFS?=
 =?utf-8?B?MHJHTFcvaTNYZFYvTzB4M1BkTjRMZmNSOTRTbWNTNEtzT3lDbE8wUlZTQXFJ?=
 =?utf-8?B?czR3bXZwR2hxVDZ5QVVMYTM5b2hwNzd1WWtxUlNKRk44Z3RUdnh4VGVZbldm?=
 =?utf-8?B?YVhxM0xzSVJOenpQeDhqeGY0akNXb0YySW5WMUZrdXp0R0haczB3L1dCU1hR?=
 =?utf-8?B?MXgwQy9Yb1RpZHhZZlRKUTNYK2IwNjRRaGZxZVVHeFpUbFIvWm1QSXA1bE5p?=
 =?utf-8?B?MFlJS0xjdGh2NHJPZ29LbXNRcU14UWRsenJZYmlFSVVVV1RuejN1d2xiby9V?=
 =?utf-8?B?TTFtVVVMMzhlTTZVenpFZWZpbzE1Y3p3ZjVnWEVaM0FCWlVDSWJ5TXJITzRj?=
 =?utf-8?B?bnRJV2xzLzdUZEIwQlF5d2xQb1ppdCt0Q2VieU4vMENSR1NJVkQwRFJnb3Z0?=
 =?utf-8?B?cGw3RW1VcCtRNitNVU9IVXQ4ZUFwYTJMem9BaUJQWjNNTDBSck10MUk0MVIz?=
 =?utf-8?B?UWpMUGMyYkQ5SVdwaGNEcG9KdXQ3RGJvZ0N0R0s4YkpKczJZVU9wZFlHL1Jo?=
 =?utf-8?B?MHlXVllCb096T3BzRzVSU2I2V0hyOVBMeStWOFRUZDFxQld2VmwvNWhnaVJR?=
 =?utf-8?B?TXpZV3BMNmp5YXJ3eVUvOHY4Y1dUMVVnVVhlbEUycko1cHVScExrc1VBU3FJ?=
 =?utf-8?B?bnltY2tjWjU1K3JDaGgrb05rRXhML0x3Umw0T1dEU3JOTkx6eGI3NXRSSVZE?=
 =?utf-8?B?a2Z5ajBOR1dIU2c0QUgwdGhKWVlQa2FEZEsydmZ3cEdodnRjVENLalR0Qktq?=
 =?utf-8?B?YVMrT04wYUJsSW9CNG8wRFp3VmtOdkwrZE13ZGtWc0QxMjFyU1QyaGgwb0pB?=
 =?utf-8?B?d204YzhaWEp2ZUxNZlNjU0trS25TMlhZSXp2bUhjdWZPOC9lNUJ6SVhwWG5Q?=
 =?utf-8?B?SDN2TTYxZzI2ak1mUUNiZXBXMmtIOHNjTkU2VWpKVHppWGxSdENQcW16aVZy?=
 =?utf-8?B?Qk9LQk1EREJNSXFjQTJFSElUTGlTUFV4SlNicWRoUWFocUR3QlV1dVZDdkxE?=
 =?utf-8?B?SDlSU1BiNlc4dGpIZmJaZ1BHdGpKdUtFVktHUEF6d05xRzJ1SFZJUEVSbHVv?=
 =?utf-8?B?THdieTJ2K2FOSmtBQU5IdmcwYm9ZODBSWEVHN1Ard2pHeWpVcWhaRm5VRXdL?=
 =?utf-8?B?V0JIYlJVRFgrSkpEZEdPaW5mN2Y4bVB0dXNPQXUrbU5lMVdseStnYUIzaXh6?=
 =?utf-8?B?R1IvdWxKM1VVQmwwR2pmeE56Y1g3T0xnME44S3Fidmhxb1hFaFpQWHVQTVAr?=
 =?utf-8?B?aVdTZWxkaVF4V0tWRkV2OGJzSXFuTGQrQ1p6Z0FWSnJyZ0crc1NPTWc3cXc3?=
 =?utf-8?Q?rjDuhrevQ6AQ/mb8=3D?=
X-Exchange-RoutingPolicyChecked: dk13Us+m43b8eKpKGeVVOcEUa6qBbLaBfbMrPoyCdxuqfMseJvexb/K8BuMd5xhbzmFPHrMlnBWfm+amOjqyQv2jIay2Yy20WRyzYRqqMZTrpxIEZyPYYdumzWkiiJgepCK200r73AJZMBiGiizAoqc6k6CFxIww/NB+lFFSbY/8+lteQ/NkTMgslFTsXf1J+AyflXT1stCen5e9n8gW07A12Y0kNYilWNJhY16Vxbd84bGoBSDV7PbuPJlffK08in0lwJsPm6h6Uh6ufdV+xX/nNnPeoJMWgo3RU0VWZlpzPvusnHkBJjO+Ql7ehMZJU9naaadrV5CEJYXI32RXDA==
X-MS-Exchange-CrossTenant-Network-Message-Id: ab13f925-c003-4f18-0ce8-08de8be42166
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8283.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 09:35:06.5854
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C/MH2JczHHNKNTNZ1YRf5NXLuSpG+30Y2gZPHOFT4r0T6Av3GTJ6n+fUaUJAYQHLSsTDuHcGgjORyWQsnYBEBLmVnTiisqt1mrc0YZz5rGQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4977
X-OriginatorOrg: intel.com

On 2026-03-27 12:05 AM, Kuninori Morimoto wrote:
> 
> Hi Cezary, Amadeusz
> 
> Sorry to bother you, but this patch needs your Acked-by and/or Tested-by.

Sorry Kuninori, somehow I've missed this one. I'll try to get it tested 
and reviewed today or by the next Monday.
