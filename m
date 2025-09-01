Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA7832F764
	for <linux-sound@vger.kernel.org>; Mon,  1 Sep 2025 15:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756741371; cv=fail; b=hXE28eh3VeBLHS7IVe0Lc8ELNBs/kOUorzCuDA5GDJMSkDeZXm191CsiF8KCN0BORj0htqfnh8cxHfb/AR+U7FMo4En7Xf35EtXjAzhv9QWKXEvCW4TfLZRIWZEd/Xw8IUCkJm2eG96t9pCvnsQdbf7G4ymnV8TYDniuS5nFQhg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756741371; c=relaxed/simple;
	bh=OtgUCdNifUJgSD3BHmEAaoF+j7ViIEc+prsLwsK6A2s=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=L+hT5kUnVbnnbpbbL+G4q1FGzEYtp0w/O93TlKlDKXxDR30lPMdedsLD/XbmUCVIo7Onj/IiaFxB75kvauOLPOpcwCdKqozztghFr1hvCu1QCGuRyomInCYmfjG72NAnLjDK38EgQ45tgwXX18vWf1z4rV902nKXUIxRhj/uu8k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GcHvwLZH; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GcHvwLZH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756741370; x=1788277370;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=OtgUCdNifUJgSD3BHmEAaoF+j7ViIEc+prsLwsK6A2s=;
  b=GcHvwLZHsdgHYKu5bDnI4tgWQ9vAP0Rn6z0LmoUpsPPNTn76Lp6hWEbt
   r4QnzgKeIABaNcjuwjGVlozc0QTx+G7vw/DPj/4MZQqaCSYuo3uo1NyA7
   UrQzlgl3emgQJrCmNEVshvN/80IzSsa+4Xr5rTEmYPauX2feRVpvEu/vB
   +BBqkN1QxRdQUcMBG2FfLuJ9JhYA+tfy3ZqSevF6ZUBZYMItikPHIEeBU
   3CyxBS/eJj8d31MeG4xUzPvWyUEHcw1YIv5SI8VIp9GcQ41rwtmduk/f7
   0sP1ptC1HQx4OiTmbOiYLdIBJ93yYcIsnc+0Pke9Mac4eS6rooaeyzvFU
   g==;
X-CSE-ConnectionGUID: fXGnNUyKSLu6UGziIzSpNA==
X-CSE-MsgGUID: 6nHKXcUPSiCdqOrZxb1fHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="70433047"
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="70433047"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2025 08:42:49 -0700
X-CSE-ConnectionGUID: xFAGdNyQQDGWJheARVKzOg==
X-CSE-MsgGUID: yMYTmgE6RUOC6f+HNhe+LA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="170328929"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2025 08:42:49 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 1 Sep 2025 08:42:48 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 1 Sep 2025 08:42:48 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.70) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 1 Sep 2025 08:42:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ez8VYPj3PJt2A38UUtqy8pzXQI1N7XUc9Uq0JzK0hWM2hVz4iudqYZyTCNPJ8NFHOL0fx8ftMKJTn2AEN9iScb3dy7pZolnx2k0e6Tgz7Zh36df4rirxCiEs57g8MxJeaoYWGDzUH0jVabvm0/t61Ugno7c/niAvs4rfILhqZOnMaOGMju90Kr8WIMVNUHIUuemzPs/58Ub8R6onQEToQ4xucL3BzEzI1ZERoKwMPwrvPuken/UyA4gKUUpEKe6LgpCOCYX1AAMEpK5ZdTewtYxnOyXpCcb4wyuNZ0W9YxgkGwxHLnkXqP9ae5k6K9nZC4ilN6aL1OT04vyiFlQN+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=waL7mie/XBhRjKoEQWZBKv6zVMoZSQBe7ZZ3Rp+B4rY=;
 b=aRvFO0OZm43gJnAZR3NWoXekzwof/VeTn9XbE/q2KBI5Tovm6G2706QK3UEiezzYg9VLK4GE0t7AJ1DeHmY2jGXUE2Ua65I4nBVz917Q6NkZbTeoUS5Vlry1vkfyduNSKe0EGTb3x4k6+0Xdfcv6GLXO+F7RrmJ2edazcUGGsgE+eHPPE8E1cooZLyPh+GN/pu65Iq1n+EkmWabLqhwJcShED7FcH1NoxWFvX7MrfzJldi+svX00HVtHCSrx/44eXCewooQZdzTZhttkpAS1+c1GJMs8taLKHnDWggljDfkABqeIp/gBzROozpzn95FPOF17fziN+pQBXWWNuBEeug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8283.namprd11.prod.outlook.com (2603:10b6:806:26c::16)
 by SJ0PR11MB4784.namprd11.prod.outlook.com (2603:10b6:a03:2da::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Mon, 1 Sep
 2025 15:42:46 +0000
Received: from SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::3:e0a:87af:d4b6]) by SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::3:e0a:87af:d4b6%6]) with mapi id 15.20.9073.026; Mon, 1 Sep 2025
 15:42:45 +0000
Message-ID: <fea2fed2-dfe8-425d-b03d-e0a49d62dce6@intel.com>
Date: Mon, 1 Sep 2025 17:42:39 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] ASoC: Intel: avs: Cleanup duplicate members
To: Nathan Chancellor <nathan@kernel.org>
CC: <broonie@kernel.org>, <tiwai@suse.com>, <perex@perex.cz>,
	<amadeuszx.slawinski@linux.intel.com>, <linux-sound@vger.kernel.org>
References: <20250827142229.869139-1-cezary.rojewski@intel.com>
 <20250827142229.869139-3-cezary.rojewski@intel.com>
 <20250829225532.GA400117@ax162>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20250829225532.GA400117@ax162>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1P191CA0004.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:800:1ba::10) To SN7PR11MB8283.namprd11.prod.outlook.com
 (2603:10b6:806:26c::16)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8283:EE_|SJ0PR11MB4784:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ca5d9ba-8824-409d-7044-08dde96e3204
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SzZEaDJFVkloSjFONEI0VkN5LzRvV1hYSy82YStxWWhtcU9IQ2lJMzdpMXRz?=
 =?utf-8?B?YzFVUU1jL1lwWUh0YXhBNk5EM29lNkpSRjlQN2U5MlhUakNRYzk0eEhGNDBl?=
 =?utf-8?B?QkJmK3lNM29jblAxOHB2Qk53VXE5LzJBaXVBUjhRN0NQR1NBMEI3QlZtbDdD?=
 =?utf-8?B?VzljQThXaEEraGd3Njlhd3VabVlyaEZ3bDRPNXdxL0xFem1kai9YNWdFT1hp?=
 =?utf-8?B?K0FmYUFsNHR3Qlk4Um1LYmw3cGQvSkEyYXNCOHcvc2YyWUVHS1hZd0hPN2dy?=
 =?utf-8?B?TUFaQ2VzQUZ6cXBlUEQ0cTNtbThYOEoyUGJvMGNwV1FTTXNMcjhWcUdzOVEr?=
 =?utf-8?B?L2dpQ2JUQ0hwZ09jb2lWSDBJNjdMajdpejU2Ykc2WTFLTyt5MHRLM1g1Q3pD?=
 =?utf-8?B?Tmt3MVh5UW50OWtWNitDU2RqTWZpMEdON01hV1VhcndwT3ordjdlYVQzb08x?=
 =?utf-8?B?emFYdUV5VUMzSnhkcEd3MURxdUw5SUJ4TEh1RXhSb3duZFNWV2tBTzNVeTBQ?=
 =?utf-8?B?NXgrcmVZaUNJYUZEcUNRUHlUMlgzeEJsSnVackRITjlMejhFdE9TVktIcFZR?=
 =?utf-8?B?MWlUM2xBK2Q2SjFoUXhyN3ZiZjRNMVFsUWlNNlBtSmF6Ynl4elVIdG9mS2h3?=
 =?utf-8?B?QUkwZTR1VGRDUkpaY2ZxVUFKT1FDdDErdFJ0NFladmZGdlQ3OTZRblZCQmRU?=
 =?utf-8?B?WTh2ZHpFd0R4SUUydlNOcEZMbURVV1A5RzZtYS9kMFh0b2ZyYnhlamZNQWIv?=
 =?utf-8?B?bW1SbmExZFpLNk5udktUbjR1UEFYS044bi85WWxOUS9WY0dUaC9EUWRHZGVQ?=
 =?utf-8?B?dXJaMk9BR3FDOCtrcU1GNWh1V0E1NFpTSEdqaTZaRXgvWWZqemtBTGdtZ3Vv?=
 =?utf-8?B?SWhINElRSzRCYURBaXFqY3RZbDR5VUliWnhzTzlpdk9YYXdBYzFKYjRTcjVU?=
 =?utf-8?B?L2NET3BCSFR0UTl2dnRXMC81QVMzUi9MbXRxS1Y0UEhtRktQbmd3T0RpUE0v?=
 =?utf-8?B?MmdYbVd6UXRlVjdQWWpUd0tldjBocjlJTm1ObWRnaXY3YVg1RzdhbmRlemJ5?=
 =?utf-8?B?dlFleENSWTZXbytiNGp3WlYwOGRyVktnVi9vU3BuYVV6SElHQWJub2xIcjJS?=
 =?utf-8?B?Tm83cFZ3UFJFUTVreUlKaW9MRW45R21pNk1IUnBrTTB0ZnpPSVo2TzRBUVRx?=
 =?utf-8?B?ZnRHNFJEWW5IVHJ4Nk5lQ3lSSzU1REpRa0JSZkVScEErclhJeC9wdmZxSmdB?=
 =?utf-8?B?WXg1bkZreEg4YjB0czZoR3ZXcDAyY25mOXkwa21oMGM1K3paZEQvVEhEaVpM?=
 =?utf-8?B?WmJTS0dHZlZoaHdjS1FQTDUvSmpkYW02OUhwTlpWcStqeEJzcE9YT0JRNDJp?=
 =?utf-8?B?OWJIVFBKY0VacnYvK3pIclR4VFVpWnpVUnVuSkUvNHpxK2RRV0UvMnBUZldL?=
 =?utf-8?B?V1QvMVpiclphWS8yb2F1Q0Q4Z3VlcFdoZ2hWVTBzOS9SK05wbThXTHBQaVNj?=
 =?utf-8?B?QStMczJHMzd2cXdabGpyYlFRcDJMYVBZVDZnSFIwVkcyaUxiN3NJcUVtRlR4?=
 =?utf-8?B?M2N6dVUxM0xHajVUOWQwMDN3RG14bHJERU9zWkhBanBhaEo3ZEl1ZGNWbVJm?=
 =?utf-8?B?SHNmYjBvSEtnZ1lva0JWcC9Db0toOFFlUHhOU2xjUkNXK1Y4YWtOU0VvNTM0?=
 =?utf-8?B?b2l5Y3kzOGVBWmdvTisyenMyVjhEL2pMZldCeWJOMGdRV29uT3FxUTkyZWxB?=
 =?utf-8?B?b3MyRjFoenYyTmhsdWZGZGpSSXVYUEZCWVlvUURrNkhlYW5VVEZaVjc3cEF6?=
 =?utf-8?B?YmJQb09jL0MrNlBha3RwWUhDVEQrV1IxTlhJdkwrcjJSR0p5ZVRsOXVUMjAr?=
 =?utf-8?B?TVljWStWVVBUKzN6cmtxcTFiSS9QMUZMYkZTcGFIQ0hIZVNVbEFkQXpaaExV?=
 =?utf-8?Q?SjGqcaH5xHA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB8283.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cGtRWnl3MGk2TVgrZy9DQ3haSmU0Ymp5YTRIbWhzMDlYWEl4ZDZXVXlhb2Nl?=
 =?utf-8?B?L0F6L3A4dUdQQXNWRys2UjZielZMem1YZk9IMUdYTmZzb1pLeWdEZEJ1YWVS?=
 =?utf-8?B?TVJRUDVTYW5RSWVvd3RJWjcvdFI5VmJqR0hlY0o3SnoxM1lJSTh4UXQ2RmR2?=
 =?utf-8?B?RS9rVjc3U1YvbFhIamZvNTlVSDFPckkxV21DUVZkMTk3ZXY0SXZGeGoyL3Fm?=
 =?utf-8?B?Q3JlbWZWNHJ2Mmlka0RLdVdxZXN0TG5KR3dNcWNvNHEwTzBFYlBqbzRXQm01?=
 =?utf-8?B?b014d0VRRTlGZDhTdVR4L1lBOEJielpkcm9UbWxPamp0UzlGczdXNmlPRVFD?=
 =?utf-8?B?alhCNldwR3E2STF2UzY3NGFYTFJOTTlPWXF3djU2VDEzUXVrYTJlNTYrY05Z?=
 =?utf-8?B?bm05TXFnNml4UkJYV1c4V3JWU0d3ckp5clA3UWRhdXQ0SWtxYkpiMnE0TzRx?=
 =?utf-8?B?QjZteCtEVlUzb1NlendPQ2NEUzgzV0VCWFJDRFF4c3hFazh6VHVPWFpMZlpw?=
 =?utf-8?B?TjdiT0J2SXRqb3VBRTVXT1JMekFGbHNIYmNvenl2QVlxbTliT0ZBbDErNGVj?=
 =?utf-8?B?MkpwWVhSd1FTeE82U2luRXdER011bk42VE9iY1ZQazQwcXc4TlV5eEVTWnlu?=
 =?utf-8?B?WXl1OHNYVjUyVXpKTk0rUzdITWFra2hYNktPMTFIMWZMN2k3OFpFMEZhNUh6?=
 =?utf-8?B?VkVyN05qYWpxT0M3VHQ1L1pITExNQmlBKzdxd3lNQmh5VmI1Wm9LYVN4cmRt?=
 =?utf-8?B?Qzh5N3JEMEhlRmsyL2tmSlpIMG1UQWsrN3hVTVFPckN1bStSVnUxeDBqSFZu?=
 =?utf-8?B?WURqN3M2UTRqMEQycnkvcWN6cjRTWkhpRzcxNFN2WDN1MS9MUnRhRGprSExD?=
 =?utf-8?B?eUp1VWk0Wm1aTXRYQjFGcG9rdnRVMUp3WGhTWWFNSVZvd1EycC94aGVsRzFH?=
 =?utf-8?B?SW9Ma3UrSzgrcDdyQ3FpZU5SRGMyandHanIyV1AycXZMeUJhTDBpQjFLYi9C?=
 =?utf-8?B?MEdYK3lJNUJuc0JhQWtKMmVXNFR0MVAxVmpneWpVWE1EdW53RXd1YTZHUHpk?=
 =?utf-8?B?VzIySzVBd1ovT01IVE1kNlozOEk1czAvWmxzRVAzYWdaQ2JYaGg2M3dWL2Fn?=
 =?utf-8?B?UElDNytUSzJ3Z2hkd0JVOURMQVVlVmtnSWphV0k2MEREUExKUkFxbDUzdXNF?=
 =?utf-8?B?Rk44WnRRc2hVaHJQUVB0SlFmOENsS21vRWJRdVpRbXJFT3NOM00ydDg2a3B5?=
 =?utf-8?B?VFVrSDFWd1QxNllvZ01ocGpzL2R6WVBORE1wQXd2MXFBd3Jra3FvVkhtbTBB?=
 =?utf-8?B?dE5DR3hwcDRKdCtjMWxCbWdYRmZpVUo4STdWc3pyVTgzQmVTSmRGdmJ0RzVk?=
 =?utf-8?B?RisyZTF4SzZpL3NIcWk2djNkZ3AxaEcrOGZneFhWOTRVQjFNUkp4cloyak9m?=
 =?utf-8?B?aWE3WFRUNHJFZGd1VkV5ZEdLSDRwQ1poK3YyUm1vTU42RGtZbkt0S2twTlkr?=
 =?utf-8?B?RnFVaVNDTThMNGxvbDJLM3ZJS0VTVko4dHloNXRxdStiSUlmTVhjbll0Z0tM?=
 =?utf-8?B?Um1TbmJPOEx4YWtUbFg4SktoZXRXWGRrQzlUQ1kvaE1DaTUzTlJ6WStNQ0hi?=
 =?utf-8?B?T0s4YXd2NExoc3V0MFhEZDFvOUFCTDBZYUh6c1pDa1I4aU5JMVYrY2J2ZFI0?=
 =?utf-8?B?azVvenhKdUxISG5YTk9wUThjTTc1Y0l5Z0k1aE1qVnQzKzZEbGZYK0o2QWRX?=
 =?utf-8?B?Y1VaZ3lVaXZIdk9oenlXY1h2MnRTRHdrSHRZQ2ZDMjlCY2l6UHF3UmZHeWJm?=
 =?utf-8?B?cjV3bDNNVnJ1ZGhCRGRxSjgxY0F2SGZYWCtVZFlrazRFUEpTdUwzQmdRUEQ1?=
 =?utf-8?B?S3B5ZjlZdjRZb2xza3Zqanl1STRzZEY5ZHJHa2l6VkdYQVhzdjJOcTIyQ0lr?=
 =?utf-8?B?TmVMVW51WjJURlA1czRUbEdGbTV4c2ZZM1FZai9UYTNRSG9STmxOaE5qd1hY?=
 =?utf-8?B?MDF5RUkrSytmTXNkQm5YVGJtMnJjdXNhMFdJM2lKMmRiekt3WStuQktJQjZp?=
 =?utf-8?B?WlZxaWFDTXFGdklpU2pYVFkvUXIzbVZXcXY4bmVEZXVtOHRWUjNEaTR5OWQx?=
 =?utf-8?B?K0IycDRhTzZPTHA5c0Y2ZG9FdE9BQm1iMUkxTGRMRnpkUjMwTzFGMWJlQzly?=
 =?utf-8?B?V0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ca5d9ba-8824-409d-7044-08dde96e3204
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8283.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2025 15:42:45.6893
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZvPLPNyftXW8ej8paAeY/k3fyefqg8J5g96pgqICReEP+K7Jw5VxOsZa64oPDISik1CcEiRbbRIXIyBVrrbiuvDgiDYeXIftmEpQ+8VLAvM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4784
X-OriginatorOrg: intel.com

On 2025-08-30 12:55 AM, Nathan Chancellor wrote:
> Hi Cezary,
> 
> On Wed, Aug 27, 2025 at 04:22:26PM +0200, Cezary Rojewski wrote:
>> Switch to the new board registration functions and remove the
>> then-unused code.
>>
>> The SSP-number-check is still important and cannot be just dropped. Move
>> it from avs_register_i2s_board(), which is being removed with this
>> patch, to avs_register_i2s_boards() to maintain sanity when registering
>> a board.
>>
>> Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
>> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
> 
> I just bisected a new NULL pointer dereference BUG on an old Chromebox
> to this change as commit 6acfaee44cbe ("ASoC: Intel: avs: Cleanup
> duplicate members") in next-20250829.

(...)

>    git bisect bad a37280daa4d583c7212681c49b285de9464a5200
>    # bad: [6acfaee44cbe9364a91dcc373fb4e6e395c5b20b] ASoC: Intel: avs: Cleanup duplicate members
>    git bisect bad 6acfaee44cbe9364a91dcc373fb4e6e395c5b20b
>    # good: [3351e814cb49dff7ef4808f5ebfb299162994118] ASoC: Intel: avs: New board registration routines
>    git bisect good 3351e814cb49dff7ef4808f5ebfb299162994118
>    # first bad commit: [6acfaee44cbe9364a91dcc373fb4e6e395c5b20b] ASoC: Intel: avs: Cleanup duplicate members
> 
>    [    0.000000] Linux version 6.17.0-rc2-debug-00065-g6acfaee44cbe (nathan@ax162) (x86_64-linux-gcc (GCC) 15.2.0, GNU ld (GNU Binutils) 2.45) #1 SMP PREEMPT_DYNAMIC Fri Aug 29 15:20:49 MST 2025
>    ...
>    [    5.021907] BUG: kernel NULL pointer dereference, address: 0000000000000078
>    [    5.022559] #PF: supervisor read access in kernel mode
>    [    5.023201] #PF: error_code(0x0000) - not-present page
>    [    5.023671] PGD 0 P4D 0
>    [    5.024135] Oops: Oops: 0000 [#1] SMP PTI
>    [    5.024600] CPU: 1 UID: 0 PID: 331 Comm: (udev-worker) Not tainted 6.17.0-rc2-debug-00065-g6acfaee44cbe #1 PREEMPT(full)  d53566f3620e7aa5231643b0a073759aa0a44325
>    [    5.025086] Hardware name: Google Teemo/Teemo, BIOS MrChromebox-2503.0 04/27/2025
>    [    5.025575] RIP: 0010:avs_probe_mb_probe+0x81/0x120 [snd_soc_avs_probe]

(...)

> If there is any other additional information I can provide or patches I
> can test, I am more than happy to do so.

Hi Nathan,

Thank you for the report - the form of your message made it easy to find 
the root cause, much appreciated. Hint pointed out by Amadeusz - try 
with probe-board disabled - sheds even more light on the problem.

Below diff is enough to address the null-ptr-deref:

diff --git a/sound/soc/intel/avs/board_selection.c 
b/sound/soc/intel/avs/board_selection.c
index 52e6266a7cb8..6412b0a010fa 100644
--- a/sound/soc/intel/avs/board_selection.c
+++ b/sound/soc/intel/avs/board_selection.c
@@ -438,9 +438,10 @@ static struct platform_device 
*avs_register_board_pdata(struct avs_dev *adev, co

  static int __maybe_unused avs_register_probe_board(struct avs_dev *adev)
  {
+       struct snd_soc_acpi_mach mach = {{0}};
         struct platform_device *pdev;

-       pdev = avs_register_board(adev, "avs_probe_mb", NULL, 0);
+       pdev = avs_register_board(adev, "avs_probe_mb", &mach, 
sizeof(mach));
         if (IS_ERR(pdev))
                 return PTR_ERR(pdev);
(end)

However, I do not believe that's the 'correct' way to proceed. The 
patchset of 5 is part of a larger series which I decided to split into 
smaller chunks to make it easier to review. Unfortunately, looks like I 
failed here and should have published a larger series instead. Even if 
harder to review, brings no problems as one observed above.

I see two options here:
a) revert this patchset and I'll simply sent a new, larger series
b) no revert and I'm sending the rest (~15 patches) to linux-sound

I believe Mark makes the call here, I'll follow up as required of me.

Kind regards,
Czarek
