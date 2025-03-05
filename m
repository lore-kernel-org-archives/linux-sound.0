Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72643230BD9
	for <linux-sound@vger.kernel.org>; Wed,  5 Mar 2025 11:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741173768; cv=fail; b=MPWnW9qt8WRDWg5Bmz37kIulvggHwXWImmPb2lnX8pm2ZRbghNbbjETdnTfuWsb4k2YnPAn4cDUCQ2binGuGvx1+tSwSmfeXfkuDp4tX71OGaFlEXj3LZ0PivHiYXpLXh9B7mRc/hOLxOntGMcsBIN/p3PBEJ9G1C6sZtCGbdos=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741173768; c=relaxed/simple;
	bh=Uar/y18L+0rqsZM/uk0/F2fq2tM3fCCMS8mF52/9EoI=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=rFy0xQB22FMW3qALThqMvM1aHUrFWxVlPsTmPl5JivsF4foxoTiqcyyhhVd4whXv3l0eta+ZXJy72HuQJA9LhcSS15QImoTLX3FLtj6uzrZgxYViCgDKLAEKzz+BUF1zr8nIcpg+bFPYw8nJfGV/6YJAoahTzVKPTOp+9k56q7I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aOtMzm7c; arc=fail smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aOtMzm7c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741173767; x=1772709767;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Uar/y18L+0rqsZM/uk0/F2fq2tM3fCCMS8mF52/9EoI=;
  b=aOtMzm7cLsCMf0mtS32LlWQPX3TVovKY+MIWEioxd1hvm58eeKST0wY4
   8JC8L7CSyt3EnwzKAm5WIMuUBly+ta8J2Ri/UtaLRDi05xYWtSnq6A1yC
   82lLNNHz3ASHd0bDs+Kn9WD8yrYIDdSWrbhmvkhYgKlnRuKhAqeB8otQC
   /k24mfHbaytLOQ1K9rSWsrqAhXlPrxWMIuJhXMkW96lxXEZZQbS47g7jU
   /YhmOTrZMf2bhk9JZi207fdMQgu0rh14kJ4hL4UGm6BIEkpLvHLgT8zAa
   c5ftc3T16ZAOXs5bnZUk8gg/OnTPTZL9HCr1N83yakVCMfmTw6+VfWWKz
   g==;
X-CSE-ConnectionGUID: ffIp3nXYRNuPzOLGeOpicQ==
X-CSE-MsgGUID: z7vQk8+1TcW79HTya6Wtjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="29715300"
X-IronPort-AV: E=Sophos;i="6.14,222,1736841600"; 
   d="scan'208";a="29715300"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 03:22:46 -0800
X-CSE-ConnectionGUID: rNklgCUGRzqNueFgixXLgw==
X-CSE-MsgGUID: GgeDuxtfQcel9OgZnRtFZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,222,1736841600"; 
   d="scan'208";a="149429478"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 03:22:45 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 5 Mar 2025 03:22:45 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 5 Mar 2025 03:22:45 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 5 Mar 2025 03:22:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sBQO9JgRv6ZVk/vemWTs2BpXSbhO7IMD26yfBQZtwOXvWp/Ola9DyytO2bVxUpVOn88tKCtIq3GaupnzJIt1vqXoIc0+jnuSBK2qrOWnX2FlP5Ib2B9N9VcamT4o17XzDG4yv8uy2VY29UqnB4flTqVEYhadyLZGoOE9sQOFtedyPVN6lSnw5s6HpkkPUrRd3sUn3YOaNV3kgEWEYc+4eFRG3bz/szMINfUo2NYq+GrWPTbob2ZvLsg1ljKRaaEtOFduxc7OM5iiK0D/G7ksBC7nmV3DyXKine5oAzAFYlwm2Pc3G9lnroNzLzbnG0rgwe6dgijmVJLLc3TOZCSqXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eOgviTuQYhwJa9W57PBoTZw4MBXysPb64dibSjSr2Oc=;
 b=LPd5SWAZDJ9T8MdqshKzCARO18f9zHt4sXnzwvLrtGAMpHJdMBIPqmwjMYgzZHVP4uSWAmCrGsF7+U6BN0/+m/JUz7LA5zsa8QgiVssTOwNVkbGyuSHaEs2Qfl+/GlqLgr+LJr1JdAvYMfG9YAASQv6hau+YIvjPnw2Ts/vKxgj9FoMG2TSPAaj1UtN8yf1RM4TQznQPYWl4968m051+dvR0go99zKB86vxdHrWPk11dPLcFClqOt9Nl4r6V0sVqOFLKAkKfVO6AF4SjYa3GEOQmq+vrcjwcG6qG8ALeNK7tdJQ9c8uGhR3RLRgP6+o5sxW0Xb5Mg5GIq9G67L3wfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 PH7PR11MB6721.namprd11.prod.outlook.com (2603:10b6:510:1ad::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.29; Wed, 5 Mar
 2025 11:21:56 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cd01:59f6:b0f8:c832]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cd01:59f6:b0f8:c832%4]) with mapi id 15.20.8511.017; Wed, 5 Mar 2025
 11:21:56 +0000
Message-ID: <eb3be65c-66d5-4b10-ba99-5afeb7d8987a@intel.com>
Date: Wed, 5 Mar 2025 12:21:52 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: soc-pcm: merge soc_pcm_hw_update_format/subformat()
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown
	<broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>
CC: <linux-sound@vger.kernel.org>
References: <87v7soz664.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <87v7soz664.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA0P291CA0009.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:1::9)
 To DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|PH7PR11MB6721:EE_
X-MS-Office365-Filtering-Correlation-Id: c51f288f-026f-4eb0-1331-08dd5bd7f03c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RDRpdURKbTNDQm1NUmk4QjZZZ2tLd0VTeW1lRHMvWDhkYndLSk9SNUV0emRJ?=
 =?utf-8?B?QW1JTitSNnQ1dG0zS2hwcnEzV2ZSL3VRaTVzR3RSSVBQdG1yWjlINDc3Kytw?=
 =?utf-8?B?emZmY1BrcSthcTFNZG1aaXA1VlN0RHJwUkRWcWEvcW83SlVoUkF1L21LTmoy?=
 =?utf-8?B?dWNmOFlxcjJSZkdHUjFDOStyZCtRWElmeXNvNlpsUFBFdk0wNDVVVkttMnYv?=
 =?utf-8?B?NFhJenErNjZBWkQ2MUJCekxKenZYaWpXSnR4K1ZpM0c2aFJZK3NtcitLL2th?=
 =?utf-8?B?WUY0ZkF3d2l1Y1VvZURwdUg2YVpxYVNWbXdvZ0N2ZDlRcTJnc3F5ZXMyS00y?=
 =?utf-8?B?UTVWWDVjbFpiYy9SUG9QOEw5M1BsY1hDSHVCZzhmakFSMWQzdkVWN3ZtMGJP?=
 =?utf-8?B?RFl6OHgzY01rcDA5cy93cC82WmNiNmYrSGJxalVDMHNyTlNTTG5URmFEYWJO?=
 =?utf-8?B?SDNDcGx5d2haVGdpVkFkdUxrbXZZb1lIaTM1L0pyWndtQjBER2lVamFIWlhm?=
 =?utf-8?B?TEFXT2VJTEViQUVXVFFmZ1FzVFh4UGRpNzd0R090OWdaM3ZXWHBnVUYwV2hH?=
 =?utf-8?B?YUlYamI2V1hhWGxEZTNRVm5IcThQTERyTmZCMCtvQ3E1VExLNldQeWtmcUI2?=
 =?utf-8?B?ZnFwY0F6akphaS9iUlU5OGxWckxCTkJuL3ViK0tkNjVqbUhKMllkZWYzYk80?=
 =?utf-8?B?ZHlXT0phYW90UGVuYStkdjUxYytGNkd6aHJ5RFFmeXZJWEN3N3EyMUFIZVp2?=
 =?utf-8?B?ZW13MFFPSEUrTHMzNGRacjg1Wi9zMzRMbnFmQlNFSzNLcFJBRVp0VE5JdlBD?=
 =?utf-8?B?ODhuQjZtdENHYjRVaWI0eVNMRVBvcVkxS1g4aXFyVURlZkxubXN0NlZsN0Z3?=
 =?utf-8?B?NzZnUzA1dHQza3QwaXRCVjMwdlo3V21WYzdmVzVLUEc3UlNTWHBMNTJsYmEv?=
 =?utf-8?B?ak9zQVc0RkxobHd1V005RGQzalZsUEpwY2hWQ2FJTm5YTEFVT05nb2lNZFl0?=
 =?utf-8?B?bWR0MFNpeVN6RlpTNy9VNWR6cWRJVE1qSFFuWVNWMldXWkVsam0xd3d2aHdT?=
 =?utf-8?B?VnlqVEp6Y0dOMlVqb0cwd09xTGN3T2RUN2s2WXVlOEpnV0JZSzR2NTRnYURB?=
 =?utf-8?B?RHhUbUovODMzQjNQc2p4Yzluc1YxclgvV09SZ2FSa0NidWtraTErTmdxQnpO?=
 =?utf-8?B?ZitLYmpxTTd1NlNnWTlzdHBCVENwWnVnU3FpZVpGc0l6QmpFTmdyN3V6cDIr?=
 =?utf-8?B?RHlQRElQMHQwWTRHekdPbE1MN0dUZnRYSXhlWXlKR2dIK2xZTlRrS3NhdmtP?=
 =?utf-8?B?K2RmSGNzQmkyeWJHbXJDYnZUTndvVndsWlBRZXJPK2Q3eEtvK2JBU1JSRWVN?=
 =?utf-8?B?M0Q4ZHo0aUs4NUZiSEZ2NDVzNm1qOXI5NEtLaUV4c2REMzBGbGlOU2J3VW1l?=
 =?utf-8?B?NGtTYWlHSDdZQUZlRUJMY0JtdGRJQllxTmhKaDNMMHU1UW5BMDlhbHU0RHlW?=
 =?utf-8?B?L2FFcENZWFV3VVB0T1pOZ2NpaVpPSVVsNzNxOG56dUFNNWExYjg0NXZSY09q?=
 =?utf-8?B?aXhFQklHVDZsbnlXamZ6ZFBQUDZxWHVjaUZzNU9lNVFUSGNoWGpYV0xPek9Y?=
 =?utf-8?B?ZHpSL2Y4ZmpHODMxOVNqalVnakhoSWJ3ZnpaWGs0NXVMR09nL2VidWVNcERM?=
 =?utf-8?B?UC9hQnIwWElOU0FHeG5iZTZndmdEQzdpL0lyT3NHMWU0Z21qQ21nRm4zK3FX?=
 =?utf-8?B?ckw5VHJDVVZZQ0tmMFNmV20wdHozTWtldHkwNjBvVGU4TG9QZXRsS2p4dVlT?=
 =?utf-8?B?R0RoakVsV2taaVZuVHhzak10WjBHR3p4eDNpdE1JdHlaM0s2TUxtQUtGU05M?=
 =?utf-8?Q?gLJZ9sZAVMF6S?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6375.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V3N1N2NzRGpCZG1pb2hjS1ZDRFJwUy9iYU1QVU5MQlVJamE4Ty8xbXpSekxQ?=
 =?utf-8?B?a1VuNlhFZy9RUTB1MkZZeEFncFcyRnFMKzM1NjNyczRkT0dIWGdFQkJpaGhS?=
 =?utf-8?B?MFd1QzU5L1ZjYW1GTUkvRkJJVTRML1dZdDhmcmJxd1pnL1JMZWpkcFhCdVZl?=
 =?utf-8?B?TERJU1BYZ091MGUzUXVmemtRZ3NWQzlnYWxDVjFkVEFyVFYwRURTSm05ZXhE?=
 =?utf-8?B?WlFTdUNYUFM1V2ZQYVlZZHBWUE5QaXdaT0llWFl3cDRhU005eS9VY25VajNr?=
 =?utf-8?B?OEhXcnlvdXpDcEZTOFMwOUZZLzJXL2xocXpSeTd5Y0lUb255d3BjbUxHZTVS?=
 =?utf-8?B?MFNySGVJMGR5YUF0TkFoaVhPZWJMYnFNNWtlWXlwOW15QnNHL0t1M01zQ090?=
 =?utf-8?B?dGcyY3FObmVPZGxnZjFyRzlNTDNzMXVJRVJrbFdOQVVMdE8yOERlQnNkL3RK?=
 =?utf-8?B?VUtOVEZPSVU3U2pSUXVyTUdEL3h3YWU5Mmt6QU5HYXI0R2dKQ0N0Q1gzRGY3?=
 =?utf-8?B?dXQ2bXc4WUw0bU0zeWlEQmR6Tmd4RkEyOGt5QkZ4NS9OVCthekJTOThSUlJ4?=
 =?utf-8?B?bmoxeHdFQnBGajFCbDJpT3E3YkMvazhJdDFtL1VpSlVJcXVxTi9ockZ5Q2tG?=
 =?utf-8?B?MkVrUkp0dDIwdWNUc1FGaStKakF5ZzY1OFhFSUUzMkgvYVlyeVR2SmliS0JU?=
 =?utf-8?B?MkRUY1BJdldwM00xVlF5eDU2ellKN3BMMlBZQ2NSbWlOVzlWY3ZjckE1dUhn?=
 =?utf-8?B?RVU2SlMvNElsTUwrYnFiZjcwMlpUM3BNbnRRaDhEc3kzK0MrdVZraFRJQTJL?=
 =?utf-8?B?MlZBTm4wVU5FakUxY2c5ZnIvZHJZRVhVTmJpUmlvekx1ZXZNRXB6VXMvS0gy?=
 =?utf-8?B?eWRla2oyVFk2c0t6cU15VVh3R3ZsalllY2xKQjE3WURpTU43eW0vOE80V21y?=
 =?utf-8?B?TFp1d2ZKU1grVUtiVWhidERkSXFqQldVRHMrZG9FZXJXV2JhaDZLSnQzNFY1?=
 =?utf-8?B?bUNEbk1DZEFNaEZGZVA5RGtJcWlKZHJ1ak00YnFYK0htZDJyNllld05GdzBK?=
 =?utf-8?B?TTc2UTVJWUd2dFVZM0dnV1g1ZEpSWms3S3BjR0FxN1FGK2xrZkxVSnR3bk5j?=
 =?utf-8?B?VVZHcHZaOE1zNXdTVFV1TGpsTzZZQUtOZlNsSWRldTRXMFhQZG9pU0pwTHV6?=
 =?utf-8?B?ME1qaVFsVkt4RTl6NjNWYk55NHJDdWtXTFpSSHRTZ1c4MitEa1pQOGZuQnFY?=
 =?utf-8?B?RlBLNVI0aDZwbWFXdG9PZ0dXUXRUa0xhRXVKMG4yZDJaRVNZellOeXBVcEg0?=
 =?utf-8?B?RjJjSkM5MFN2T0dRREd5ZHNiYVlpWFQxZHRqZDJwMjlJUUxVOEhBcE5USCsx?=
 =?utf-8?B?NHpMYnZJUUg1eml0VW0zREE1ajBsNTdHQzBlSmhrNzRCTWxJS0F6ZldINnlk?=
 =?utf-8?B?WDQ0RktsUkwrdDlKZkJRblZoYU5QTUpEUm5XOTRDZC9QSHZZUXlmaVUva1ZC?=
 =?utf-8?B?aVVpYjVuM3ZQOVl3enNDbkR0TENHME9TVVhXc1U3eGVDcXh1TFFUa3FUNHpp?=
 =?utf-8?B?bjFZV250a0RIRGJpeGYwR1BiWFVQWjB4dURYRkoxV1k5UG94aVNTTDRDUzdv?=
 =?utf-8?B?OU12eGFVYlorV2FYZG9FZ0lIMTVkRy9wbWovazNBNVVlZXd5OUNoTTMzaXJM?=
 =?utf-8?B?ZWFEb2M3ZlRvNUhlSUo1R0tGMEo1QWR6YlNIc3pVUlk2QS9CNFZHS3VqYkZ1?=
 =?utf-8?B?NjBMMjFCb3V5MVR5SzhwOFV5K1lGRENLYWxzWWhDOFRRSGhHcGNwMVpWenhC?=
 =?utf-8?B?QVRhNXdsZ2xuTllPWGdzNUhYRlg4YkJCekNVOUM1ZnJZQ0NqZGZiTmtNZ2Zp?=
 =?utf-8?B?aDNwOGpsMXN4K3N4bmpaMjN0QWI2YVFHU2F1b213THhuZENEeXJvOEgrVkYw?=
 =?utf-8?B?bmNqcWc1T3ZqMmxiTXEydVZWYXlNVzZwSXBKOElWQXQ4R0hrVFpiRHc4OExW?=
 =?utf-8?B?d3JqeVNhYzlBSHgyamNxT1FuK3hxZFJ0MkJ3blFrQVJwNVE5dm5CdVoyMWlt?=
 =?utf-8?B?UjVxMmNVQ2JNRWl4Y2tNNkE4ZlFINkIwMWlQM3hlOEY0bmF6MEQ4RUEyVnRw?=
 =?utf-8?B?ZXcwU1pWK2IvNjF5ZVlhbFJLOVJoeUdRdk9jRDFhRHRKZEllOXljN2g1aUIy?=
 =?utf-8?B?T1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c51f288f-026f-4eb0-1331-08dd5bd7f03c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2025 11:21:56.5889
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NMLA4A9V7+RLiepLXg8ncXL5vQExq/2g8RCpTeZQs4oR5YNoTyAO2CUopV01k4vcZnEgyaRddYJr/Hhanqgog98XNUJ86WZKvJG9JMdtjY0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6721
X-OriginatorOrg: intel.com

On 2025-03-05 1:12 AM, Kuninori Morimoto wrote:
> format() and subformat() should be handled in the same time, no need to
> have each functions. Let's merge these
> 
> 	soc_pcm_hw_update_format()
> 	soc_pcm_hw_update_subformat()
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Cc: Cezary Rojewski <cezary.rojewski@intel.com>
> Cc: Jaroslav Kysela <perex@perex.cz>

Looks good.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
