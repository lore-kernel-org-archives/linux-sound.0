Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FDFC35962
	for <linux-sound@vger.kernel.org>; Mon,  7 Apr 2025 13:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744033515; cv=fail; b=Cu3SY52m+nvSdTCMsmdpqicON2e4KbFDE6Ok1G4nBf3A3IDJJI3Y9XttatB+rA+XaxYMH1lSfsG/MaGkrcIhdeUJJTrB1vHKFB26HdUH27x3KnQLGkl1OY/qw9hdBPjN3RhDQAB0JreRyyG6PM8yxFJ8uP1FEkY2c7aopX4/b8M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744033515; c=relaxed/simple;
	bh=VetNNAjIYIml/lCTAY9eEiDJ9X4JUWgoZi5hzpVMpt8=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=nx5RedZPpLahqXVzrDjDaZv0RnGyCSKglU+6qQACxQTn0PRfy+x7wFQUwUeWqT/mBVIae1Zj7mAv3a/jZcA9hcb/tQzfhF/UuVvswtEZWJBb5xYp8aClNCSORbWRCZQIVIGEmizDxtKxhkgOizCgCw7ZIBQiVCT/zV/gRuklD+U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g9RpAl5N; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g9RpAl5N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744033514; x=1775569514;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=VetNNAjIYIml/lCTAY9eEiDJ9X4JUWgoZi5hzpVMpt8=;
  b=g9RpAl5N4WJk5hLUQY/sJwlJLQCBaFubQ/H3glS0vby6ogWXTjbexX2e
   N8jy3/afLqxK3OkZbID34PIPuBX8syAikNkI4f5DK9uiRLU9dYMQjVh03
   /Dv43uvAd7YX34+FjtZTn1ERkKM/pITf+pzQ1WaytSDghTQwW6UNRxcX9
   0QYNQrUvyDanOcrZvDFNjQXFJRkbBHA2amgc88zYHE1vWdK/8py71HRGi
   6RpMbXBSg0t1OUqpy2tf939KWmcKSO38/2fk+NczsZ+VnAUlxaGIqoree
   DgT3Y/6dhCcIjZGetgeOCzliPJm9G7DthkA8YSVoOL2G+peTdPxevewKd
   A==;
X-CSE-ConnectionGUID: wiwUzC6lTTWSVssHnKBTgQ==
X-CSE-MsgGUID: NUSSegsIS/G/KW4lKrFtfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="56787355"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="56787355"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 06:45:13 -0700
X-CSE-ConnectionGUID: FYWprSWjRhmKMGw/ieFyjg==
X-CSE-MsgGUID: MpOIetTURtWNuxdmaV2BoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="151151436"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 07 Apr 2025 06:45:12 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 7 Apr 2025 06:45:11 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 7 Apr 2025 06:45:11 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 7 Apr 2025 06:45:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y+uOwLcoDTgT1r+TT26+Dv2TtD7APojGZYwFei2TE8nShlClrN9nvhB9Nko54O4bXpe7za0SE5cMN2E9AiyO3AsOuSklHRdkjyZCzx7NNkun/Z6FkFZPQ9tphLvuI7zRZm7yrhSsZAx8AHsABxGiKo83U79itdHUiC1Og7fozwbRVwoAxIBXihKjVmyFfralEtvkNDimK9ZQzEOrlZiFTEfWmQjXhbDz3VRaD92s/VgBbnKsbL298O/q2OgYuJ2CZgifLQFqRym3GlvgJnEllhzI+Qkp7qZFQt2pdSZCDwrFeYQvx7fOZH5yr8Sa0cHS0WnJk8LjM6Bd6fjfqmsfwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SpJULNAsaLHDb0gm57bKMhgx3HTvU7hQ7xn8I1TAGis=;
 b=S5oFoSTvMlx0l5WK4gpxUsqjFjwvUBpiQdNUKAKFdb1BLOjoo0hfVN9RR8aqsdttjVkaepm4ctuKLSegB9cMiZc6a/dchBBTt12mwAS15SYMUKpwJ41gBDAryhkguVvYEyXOBp1S1JW2xh0ny0Q0CZ63DREizW68uMpev8MbCi3tzLpK4aL+t8nBponCVWPpkzBRFG8ew54C2tgN0W9u7QFwbnAZWe5UbBGZbqRHrLjbqxxM67AzNCwK1BF3kIc5jCdSN5GoUzxIWxsLYHHhNvrLsJhrZI/QcZZZ5B8aTYaGgAUjD33+xYxSKDdtTIVwmYZT772WYQG3PPZIOQVwAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 SN7PR11MB6797.namprd11.prod.outlook.com (2603:10b6:806:263::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8606.31; Mon, 7 Apr 2025 13:44:27 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cd01:59f6:b0f8:c832]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cd01:59f6:b0f8:c832%6]) with mapi id 15.20.8606.033; Mon, 7 Apr 2025
 13:44:27 +0000
Message-ID: <15b97e92-ff96-4244-a1c5-2ef4c511ec1a@intel.com>
Date: Mon, 7 Apr 2025 15:44:23 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: Intel: avs: Constrain path based on BE capabilities
To: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
	<amadeuszx.slawinski@linux.intel.com>
CC: <linux-sound@vger.kernel.org>, Jaroslav Kysela <perex@perex.cz>, "Takashi
 Iwai" <tiwai@suse.com>, Mark Brown <broonie@kernel.org>
References: <20250407130851.1726800-1-amadeuszx.slawinski@linux.intel.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20250407130851.1726800-1-amadeuszx.slawinski@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA1P291CA0022.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::29) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|SN7PR11MB6797:EE_
X-MS-Office365-Filtering-Correlation-Id: f1612f85-996b-42cf-36ea-08dd75da507c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NC9RYVR5U3hlN0lrOXQ2UWo4eUJ4OUhPM0pQRWVXNjJCVmxiWTVIOE5lTWUw?=
 =?utf-8?B?eEs5eW1yUGJSdnZYSnhNaE9uQUIrbGV2K0RrUUFjWDJDVTljSWZ5aDUyQnkx?=
 =?utf-8?B?WjVXZWpNSDdoY3ozSFR6eE5ZYTJLWC9qQ3BOZ3VlVzV2a0I5OTYrcllEV3gv?=
 =?utf-8?B?TXV6d3FVNEc0R0FtN2ZTdXBmWlJSemYyZHgvVC8xQml0cE9zNnRSb0tpNHZ4?=
 =?utf-8?B?QjlBTzVzTHJ0WEh6QmM2SFdxc3ZVUElSQWk0Z1RXYkR0YlU2L2xkZ0RtaFo0?=
 =?utf-8?B?RWE2WUlOazFpZkd3VTZEZHRsdnJsOHFPRGVJQ1FMNmxKbnFhVXZuWWZpV0xQ?=
 =?utf-8?B?VWtmdzAybFZMUUt6d1lwUUFNWU9yZVVFSUFRanAxeTFKNnZ1S3lFMnFkYkpu?=
 =?utf-8?B?cFBxT093ZXRLMCttNys2L3ZCQThZYVpsc2V1UFFrRy9PaTh6d0JyK29YeVZo?=
 =?utf-8?B?QWFvSXRqZDIyd0p6U0k2UHVTUnhmNEZpQjFqd290UkQ2M2ZIRkh6WmNkdEdt?=
 =?utf-8?B?cGU1WTRHeElSNmFpNFZxY21YMm5GamNhUE5GL3JZVm91K2JZYk92V1F3ejZh?=
 =?utf-8?B?RXNSUGdQZXlHTHI3cmpwV2p0WjdMalpJUUtYTFBRQlk5eXdHUGhiQU5Xb080?=
 =?utf-8?B?UFozb3hSRk9Pa1RvU0cweldrZ3dRdDNqc25BYjVBakxMc1VKcmFYV1pKaW9s?=
 =?utf-8?B?aEpGazNtU3RjOTJhcFhuSlN0aitRVUdXKzVFVGtYRGFCZG9DbXVGNWRTVGM1?=
 =?utf-8?B?OE5iZlN0aDVNekNmaWtnRjNFeSswUk8rcDByN0d1STR2eTkrY3NYSFQ0eWhk?=
 =?utf-8?B?aFgvL3Q2YkdCOE5hN1NXR3AvMGhUdUpOS2xhWURDcUNIeXdaYnl4RjZob1hx?=
 =?utf-8?B?dEJ2b0ZSOWlSbTA4MXBkQ1loSGtwais0bmE4NWlkcGVZa01XU1ZxTERLem5l?=
 =?utf-8?B?bXFQTlR0MDhHcXZsa2JPSldKby85c25jOFVBYUNZMENXYU5LdEpTc0tuMXRL?=
 =?utf-8?B?b2V3S25jOFVQa2ZXY2tQL3Zsdy9qQ213QXlKS0IxbGlYejdRNDZnSjY0clVr?=
 =?utf-8?B?NmZKRCtsT0hKcm5rWXJmV3hOZklPU2E2OXA0bjBVK3E0RWw4Rlh0RHBBTlBV?=
 =?utf-8?B?QWdocWM2T1ZsWHJXc0NJelpEc3JIUFhvUFpwZnBWK1lTYVJvaDgwT01hbUVN?=
 =?utf-8?B?VzYzbUR0VCtVc0ZLbHRJODErb1Z6dW94c3FPZ0I1RkRibVZrRGd6dGRuWnRw?=
 =?utf-8?B?bk03K1ZLNnRoWjB2Zzk2NDBpYmZ2UloxampYbzBsVDBlUC85SlBHNUsrTjFp?=
 =?utf-8?B?VGU3WUNvM0tqaTZTU2lJM3F3bFNEbWtnWkJkV1Z0MVhBMEQraFE2dGJ2QTF6?=
 =?utf-8?B?S0ExMnJUbHI5VkZNS2hueGlBUWRiOHdzQmF5ZUFEdy9SN1BSMk9NWlJZV1Uz?=
 =?utf-8?B?aWNib3R2aHBFRU1QZXVuZE5BRUcxUVdQcXhvT0xvaUlwcko2d2s5a0tSQjJZ?=
 =?utf-8?B?cUpJbTBuYmVZVGozUTVEYW9CaHVkd0V3WUtTTXpMY3hXV0xYNTB1cUJRYStl?=
 =?utf-8?B?djRDMnZRMlBZdEdtc3JKYzJvZnc0TVJKYkV0TUROekJJMkd2cHlvM0h6di9D?=
 =?utf-8?B?Smo0UkJYSGQvY3Q5aDNXU1Z6YWdPaU1yZVpUREoxMUhMZEtiRElBeU4zQ21r?=
 =?utf-8?B?ejBFNno4aTVZbkhuUm1xYmhnV054TGFuT05zWVhlcVdZdFpDVmN0YWc0aEh4?=
 =?utf-8?B?RkFYa3M0RlJ6SGJhWVlZaWtaRWJRTmxBS0pjWWQ3Z3ZKSitmVjByM2piNEI1?=
 =?utf-8?B?RDNaT3RLOGtSVWZuRTJpR1Y0ZkNiWjlSUk03Y1RBa0VjT05DVE1kZmJHNEJH?=
 =?utf-8?Q?egsINcMcfs2MX?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6375.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?blAxbUNpaWJ4LzJCSkk0N3RCYlhyS1ArcjJJRjNyUkhWdjJqMjIra3JxVW1k?=
 =?utf-8?B?cmNCNkxGS3dTMEpodytPZmNGR3VmT3hwZzhnaGdpejhRUmVXVjdaMDkyKzJN?=
 =?utf-8?B?djhWMm1lQjE1Ym9xOWhRQXZHVWtlbVhudDBOZkN5MEhsNFl1UHNFdm9IVFdZ?=
 =?utf-8?B?TURmMEE3ZEQzOTExNjlZZzQ1TWVZaEwwWkF3THdSdmI2ajczUzd1QThUUlcv?=
 =?utf-8?B?aU1CWERvMlRaWGUxc0RHRlRUVThMV3lHK3JMYUtnM3BKZG5yNnBGUGREVUhR?=
 =?utf-8?B?NzJlWVRWZnU2cm9YNHRXL2RIVFRBK3FiK1RxMEE3VG1ML3RjRlQzVXhZOHpL?=
 =?utf-8?B?TXZvRzhXOEZVT1F1dUR4ZmVCbGZUaDhydTV5d3ZObzgyeThFUXFkNUxPZmJ0?=
 =?utf-8?B?VTVGYVN4MWkwSExDSEg1S2dzQ2FhaG5GcWtLNHJuMkhUbHhGU3lOMnpEQmxs?=
 =?utf-8?B?eGgzK2h5MFRRRHNEWEJFWEgzdWxuNFdpQzVCR0VwRHN3cUp5QmNpcmFwYkVB?=
 =?utf-8?B?d1NsZDJnQ2swWk9nNTV2ZlFnUnpqWU05WkpwQnF3VEV2aWRHZkg5R3dlSW5R?=
 =?utf-8?B?RGkyR1dPMFcrdkFMWXVNSHBjTDJjQXJ5WWhRVkducFVmdk5wSlRUSjd0L2xG?=
 =?utf-8?B?SGJob2ZlUzhPVFVWdlZlMmh3cXU3K1dKbGh5b2xabC8wc3Q2dGZ1dlpFMWZy?=
 =?utf-8?B?RFFSTVFhYXdsaGovWjExL2hsUmtKV2lveXlKcmQrTndTQWdUSXZ4dko4TDAz?=
 =?utf-8?B?NWthLzZ3ZmlPcDROSVNzQVJCMkphaHF2MjJ3RFFINnB5N3IwTUZJd0N2NzZr?=
 =?utf-8?B?NGZaUTFmQmFUOHltNVJFK2orUHdOVmJWNEpBQldKbjF6cThQS0szdzVWd1ZP?=
 =?utf-8?B?RThSM0w3UFVIcE1WYitQZmMzamtrOUttWGE4LzVqbzFuSy9OVzFjaEE3NlpT?=
 =?utf-8?B?ZTFhQmNJaUVqeTN0Q1g1dTF2TXZ6V2ozQ0JtV2x6R1VoV1Fac1A4NmVXSnJw?=
 =?utf-8?B?cU5NM0k0YUF4em52TWN2N2hHdmo0VExrOUxyR202ejZyN2FsM0xYams4b096?=
 =?utf-8?B?NkU3T1lIMVFWemJua1RqbnozS2swZzhrSHRqUXZHRHk0QWNYeitDYUEzdkFi?=
 =?utf-8?B?VXR3T2tkWHN5cnVLQTZYSnh4TFZGNXJoMGhZaEdzblJXNWwwM1N6L0xUbEN5?=
 =?utf-8?B?WSsvcm01aGs5QnQyMWtkYjFJbzFDVmMxeEIreExPdlJCNDU0Zk02T3o2Mkkx?=
 =?utf-8?B?MkdNbVVicDIzRitxY2VZbXV3U01nMkZXQ1RxN1h5cHpoby9hYmE1M0JYdTgy?=
 =?utf-8?B?Q0tRQ1MzNVJCRFlUV09CZTkyc2QxSHU5MThYdVhzdSt6MHBZM1VjT3V0QWJo?=
 =?utf-8?B?K1lUdjlwL1d0MXBoR3l1YlUrVTF3RHJSclhHUDhPV0ZOZm9Ud3JWY2FrK0E2?=
 =?utf-8?B?Q0lvcElsdStxRTRyV1VHUlVhZHN1aEUyLzh5b0pBVDUyWjJVTmF5djNRdmNO?=
 =?utf-8?B?NWJyNC96aDM5eGR4K1pUaDRUSVdkY0JHQzZwN21HeXMvTXlNNklPc0dFVXBz?=
 =?utf-8?B?UDlTQXRoRWt0MXQvaS9pU3pjZzJWR0V4Rk10RjhUYnMvS05LSFI0TXUvVEdy?=
 =?utf-8?B?eWFQZ2d3YkdCb0FIKzM4cjhPZmVuaSt3TGdFZ3RsL28yaFVlaFR0U3hvWXNH?=
 =?utf-8?B?ZkhpMjdSV3hMZXRsS1ptSkM3dE5vN3F6K1lEaE9nMGZWaXFRdmIrR1pieDEr?=
 =?utf-8?B?WWtRd3BCK1M4dS8ydTc0M2gvMGp3aS9rcGY0ZkcvTUs0UFFTTUNuQkpYYitT?=
 =?utf-8?B?cVNmVTR3THZhWHJreGVCNmF0Z2Y1enZmYURrTU1xYjlXMURvbm8xV0RoQ09x?=
 =?utf-8?B?d29VM3NWOWtvZFF5SFE3d2VQRkl1NWtsVFhLZDY4Ry9oWlN0aGZrRVlVRHVP?=
 =?utf-8?B?VGZ3am9uTzc4R3NXenkxT2lnd2I3Y3FhNDRhL1ZlWG1zaldxMG1Hb1loVW1i?=
 =?utf-8?B?UFAvaVpSZytjVk1oa0RJV3BqVGxCME5hOE1OTWJPckxzbUhDd3RHeHQvSUhY?=
 =?utf-8?B?NTBFR1dLTWhrQ3JFZFZ5YlRoSWJXTFBnMHYzUzBBOEsxTldYdVQ0TDhqWGZQ?=
 =?utf-8?B?VDNkbUJJdGNWRXFFSTJ1eVZ1T2pzRlVPY0ZWRThHMFpudmczdmdyVlhRQVA4?=
 =?utf-8?B?TEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f1612f85-996b-42cf-36ea-08dd75da507c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 13:44:27.1718
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WIMbKvmZPC/p/a6jXVY0K1n9wdYcdXhUegFcVbix/vMgJTJ1ybBVzdhhq5MqgNdyV9yXj8ytZAtLsMZrJXwUdQo+fzpbgSpmebpWEyEWs4U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6797
X-OriginatorOrg: intel.com

On 2025-04-07 3:08 PM, Amadeusz Sławiński wrote:
> For i2s and DMIC copiers constraint stream capabilities based on
> available NHLT configuration. This allows topology to provide generic
> configuration that handles more hardware, while filtering unavailable
> ones at runtime.
> 
> Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>

A number of iterations reviewed by me in our linux.avs mainline.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>

> ---
>   sound/soc/intel/avs/path.c | 72 ++++++++++++++++++++++++++++++++++++++
>   sound/soc/intel/avs/path.h |  5 +++
>   sound/soc/intel/avs/pcm.c  | 49 +++++++++++++++++++++++++-
>   3 files changed, 125 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/intel/avs/path.c b/sound/soc/intel/avs/path.c
> index ef0c1d125d66b..cafb8c6198bed 100644
> --- a/sound/soc/intel/avs/path.c
> +++ b/sound/soc/intel/avs/path.c
> @@ -115,6 +115,78 @@ avs_path_find_variant(struct avs_dev *adev,
>   	return NULL;
>   }
>   
> +static struct acpi_nhlt_config *
> +avs_nhlt_config_or_default(struct avs_dev *adev, struct avs_tplg_module *t);
> +
> +int avs_path_set_constraint(struct avs_dev *adev, struct avs_tplg_path_template *template,
> +			    struct snd_pcm_hw_constraint_list *rate_list,
> +			    struct snd_pcm_hw_constraint_list *channels_list,
> +			    struct snd_pcm_hw_constraint_list *sample_bits_list)
> +{
> +	struct avs_tplg_path *path_template;
> +	unsigned int *rlist, *clist, *slist;
> +	size_t i;
> +
> +	i = 0;
> +	list_for_each_entry(path_template, &template->path_list, node)
> +		i++;
> +
> +	rlist = kcalloc(i, sizeof(rlist), GFP_KERNEL);
> +	clist = kcalloc(i, sizeof(clist), GFP_KERNEL);
> +	slist = kcalloc(i, sizeof(slist), GFP_KERNEL);
> +
> +	i = 0;
> +	list_for_each_entry(path_template, &template->path_list, node) {
> +		struct avs_tplg_pipeline *pipeline_template;
> +
> +		list_for_each_entry(pipeline_template, &path_template->ppl_list, node) {
> +			struct avs_tplg_module *module_template;
> +
> +			list_for_each_entry(module_template, &pipeline_template->mod_list, node) {
> +				const guid_t *type = &module_template->cfg_ext->type;
> +				struct acpi_nhlt_config *blob;
> +
> +				if (!guid_equal(type, &AVS_COPIER_MOD_UUID) &&
> +				    !guid_equal(type, &AVS_WOVHOSTM_MOD_UUID))
> +					continue;
> +
> +				switch (module_template->cfg_ext->copier.dma_type) {
> +				case AVS_DMA_DMIC_LINK_INPUT:
> +				case AVS_DMA_I2S_LINK_OUTPUT:
> +				case AVS_DMA_I2S_LINK_INPUT:
> +					break;
> +				default:
> +					continue;
> +				}
> +
> +				blob = avs_nhlt_config_or_default(adev, module_template);
> +				if (IS_ERR(blob))
> +					continue;
> +
> +				rlist[i] = path_template->fe_fmt->sampling_freq;
> +				clist[i] = path_template->fe_fmt->num_channels;
> +				slist[i] = path_template->fe_fmt->bit_depth;
> +				i++;
> +			}
> +		}
> +	}
> +
> +	if (i) {
> +		rate_list->count = i;
> +		rate_list->list = rlist;
> +		channels_list->count = i;
> +		channels_list->list = clist;
> +		sample_bits_list->count = i;
> +		sample_bits_list->list = slist;
> +	} else {
> +		kfree(rlist);
> +		kfree(clist);
> +		kfree(slist);
> +	}
> +
> +	return i;
> +}
> +
>   static void avs_init_node_id(union avs_connector_node_id *node_id,
>   			     struct avs_tplg_modcfg_ext *te, u32 dma_id)
>   {
> diff --git a/sound/soc/intel/avs/path.h b/sound/soc/intel/avs/path.h
> index 7ed7e94e0a566..c65ed84aa8530 100644
> --- a/sound/soc/intel/avs/path.h
> +++ b/sound/soc/intel/avs/path.h
> @@ -69,6 +69,11 @@ int avs_path_reset(struct avs_path *path);
>   int avs_path_pause(struct avs_path *path);
>   int avs_path_run(struct avs_path *path, int trigger);
>   
> +int avs_path_set_constraint(struct avs_dev *adev, struct avs_tplg_path_template *template,
> +			    struct snd_pcm_hw_constraint_list *rate_list,
> +			    struct snd_pcm_hw_constraint_list *channels_list,
> +			    struct snd_pcm_hw_constraint_list *sample_bits_list);
> +
>   int avs_peakvol_set_volume(struct avs_dev *adev, struct avs_path_module *mod,
>   			   struct soc_mixer_control *mc, long *input);
>   int avs_peakvol_set_mute(struct avs_dev *adev, struct avs_path_module *mod,
> diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
> index dac463390da13..b57db62d1b364 100644
> --- a/sound/soc/intel/avs/pcm.c
> +++ b/sound/soc/intel/avs/pcm.c
> @@ -31,6 +31,10 @@ struct avs_dma_data {
>   		struct hdac_ext_stream *host_stream;
>   	};
>   
> +	struct snd_pcm_hw_constraint_list rate_list;
> +	struct snd_pcm_hw_constraint_list channels_list;
> +	struct snd_pcm_hw_constraint_list sample_bits_list;
> +
>   	struct work_struct period_elapsed_work;
>   	struct snd_pcm_substream *substream;
>   };
> @@ -74,6 +78,45 @@ void avs_period_elapsed(struct snd_pcm_substream *substream)
>   	schedule_work(&data->period_elapsed_work);
>   }
>   
> +static int hw_rule_param_size(struct snd_pcm_hw_params *params, struct snd_pcm_hw_rule *rule);
> +static int avs_hw_constraints_init(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
> +{
> +	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
> +	struct snd_pcm_runtime *runtime = substream->runtime;
> +	struct snd_pcm_hw_constraint_list *r, *c, *s;
> +	struct avs_tplg_path_template *template;
> +	struct avs_dma_data *data;
> +	int ret;
> +
> +	ret = snd_pcm_hw_constraint_integer(runtime, SNDRV_PCM_HW_PARAM_PERIODS);
> +	if (ret < 0)
> +		return ret;
> +
> +	data = snd_soc_dai_get_dma_data(dai, substream);
> +	r = &(data->rate_list);
> +	c = &(data->channels_list);
> +	s = &(data->sample_bits_list);
> +
> +	template = avs_dai_find_path_template(dai, !rtd->dai_link->no_pcm, substream->stream);
> +	ret = avs_path_set_constraint(data->adev, template, r, c, s);
> +	if (ret <= 0)
> +		return ret;
> +
> +	ret = snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_RATE, r);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_CHANNELS, c);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_SAMPLE_BITS, s);
> +	if (ret < 0)
> +		return ret;
> +
> +	return 0;
> +}
> +
>   static int avs_dai_startup(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
>   {
>   	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
> @@ -101,7 +144,7 @@ static int avs_dai_startup(struct snd_pcm_substream *substream, struct snd_soc_d
>   	if (rtd->dai_link->ignore_suspend)
>   		adev->num_lp_paths++;
>   
> -	return 0;
> +	return avs_hw_constraints_init(substream, dai);
>   }
>   
>   static void avs_dai_shutdown(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
> @@ -114,6 +157,10 @@ static void avs_dai_shutdown(struct snd_pcm_substream *substream, struct snd_soc
>   	if (rtd->dai_link->ignore_suspend)
>   		data->adev->num_lp_paths--;
>   
> +	kfree(data->rate_list.list);
> +	kfree(data->channels_list.list);
> +	kfree(data->sample_bits_list.list);
> +
>   	snd_soc_dai_set_dma_data(dai, substream, NULL);
>   	kfree(data);
>   }
> 
> base-commit: 3a0f0a4355df0240485ed62b6bd6afa5b3e689c5

