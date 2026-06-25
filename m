Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D9C2331222;
	Thu, 25 Jun 2026 19:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782415635; cv=fail; b=S1gVBsigTzFmLslXXdRRvsBJfyfqi9OFImnP+EzJm2MW5sg2p61PyWZy3jQsYrwCMa3fa6+Uz4d9BD1uZ9WPxoxowWN3F9Q2CMq+n++gepKDYkW81QkQQy8CtuK3Q1dSqixeYTx9q3pu0ShXYsbS/3BI/TaJSy01wkCkUQ4TnJs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782415635; c=relaxed/simple;
	bh=gpB71sR+tuOry2LhkwbEor9hbqE3YNu+/SmhlgH+dBw=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Cmsq1iVpWWpqw3bGSMvnFqe1NubjULUJ/5A6qMyvsFfRQ6QZOd41ZHE12yNiuTv1eNk49ddQ3VVsfbcyRc2rIGWBZwN5QbeCEedMKFrcuvItub/A1zxSo/Q6Qf4bAdtI5n0R6Fdivomwj/mu+24dUf86teXs8keffho7rtMHTkQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OXBCWlT2; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OXBCWlT2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782415632; x=1813951632;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=gpB71sR+tuOry2LhkwbEor9hbqE3YNu+/SmhlgH+dBw=;
  b=OXBCWlT2xk7+e7MS0+E0NPD2jNT2HHYvOxjEi1ltaynlvGYdIEvy8yDJ
   F98EFrwVQXQMykTFvzIRF/513XtUw3/aF6fmjsV2lB3v9PDTEXRT0W8W3
   +mVUJG++3aFhuqu5jz97TFl9oLkZ1SbP31Zum4FHuJu0hw//JY9rBLVKo
   kaB7ooM5uWQgiCRS71rah9NrYdVl9SoHKm7Zl6zNHUx2wNVVGbuQSJ/iG
   7dg2MkyNyJivghO9mWacvAdMvEXr5PrGU1i6VQanwcPO3qiThnd+4WuLg
   fkNVgnmYO3a2LOKrr7i8juM+jHjRsCfW5ecTOKlI7IY8sJc3Wec5/l5J0
   w==;
X-CSE-ConnectionGUID: eDugDHnjR82wJEug8C0QGA==
X-CSE-MsgGUID: 3gxPo6+IR2Kc41Cxctze5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11828"; a="93859126"
X-IronPort-AV: E=Sophos;i="6.24,225,1774335600"; 
   d="scan'208";a="93859126"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2026 12:27:11 -0700
X-CSE-ConnectionGUID: P7zPcD8MS2ioeeNLcViwrQ==
X-CSE-MsgGUID: glKc9QTzQZCSw0zaocJ0tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,225,1774335600"; 
   d="scan'208";a="252911301"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2026 12:27:11 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 25 Jun 2026 12:27:10 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 25 Jun 2026 12:27:10 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.26) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 25 Jun 2026 12:27:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zr87UQU9/MLMT6WrTqUBA1KF1KH39X6oDQQptjj06RxGvJiZxCqEFjiPKjB21Ojyoe/o68nASFR75vq76Rm/LA0ETpmcIoC63JwZGt6ENcBnsvluU3H4K3QFJWN5kR+OMDJPAXEhQ99cduBMc0rA2ROD14xSgeUDnvMblm3vZQUUmLTueo4NdURUTMSvGTJ1FGbTHyik4jMlAcWShdyNN6Nd8kfi9mAxKQqQmGcB/yjv9mvF3T3vrgjiYjfnpbQnj/r6XBUgEVFI9ivaj9J+voyZDgInJJ/LEF3cLmlmdLVHRDvwDzOJ4vFiJ9ZFGmhqiLxbewLlDY1AT/qXPaKglA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=43lXs5sNS+okasAYCQoJGiUVUuDeUDMvhn1UP9CBK1c=;
 b=JtJRtaeVZLPsPJJBo8UdbsRJj/IAfLch8UyfMO3Ga5iQl4nKLLhdsWJKqDeEk8byUlESEtGLu1V83JY7iMK3bpUZx9a4SEDVlLIxnwTaL+hHv6kmJK3ZDVC2UL+POnIZBekG7XHqY8xRnzAgOGsyfSUrdzmCf1AfBeWZF509xM6UCQTW/ThU3SMzrrmwxNmrQIATrkAmO9SDKuTTwvMk/s0I+LZgqx9py2iFuNtkF5bg3KTPuXVUVbYNKCAZuIOuCMAUHjl3Oduhwvm0jEdvT9HAY+D6CttqUtopYE5Kze0YZmzAp0pLW7EtqmarLfH3isv++6959BdLRkC9CLPp1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6967.namprd11.prod.outlook.com (2603:10b6:806:2bb::15)
 by DS4PR11MB9601.namprd11.prod.outlook.com (2603:10b6:8:34a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.19; Thu, 25 Jun
 2026 19:27:08 +0000
Received: from SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4]) by SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4%3]) with mapi id 15.21.0159.015; Thu, 25 Jun 2026
 19:27:08 +0000
Message-ID: <b5692a55-40be-48a7-ba51-9c2ebe40a846@intel.com>
Date: Thu, 25 Jun 2026 21:27:02 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] ASoC: intel: sst-mfld-platform-pcm: Use
 __free(kfree) for stream pointer
To: Bui Duc Phuc <phucduc.bui@gmail.com>
CC: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Peter
 Ujfalusi" <peter.ujfalusi@linux.intel.com>, Bard Liao
	<yung-chuan.liao@linux.intel.com>, Kai Vehmanen
	<kai.vehmanen@linux.intel.com>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.dev>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>, "Liam
 Girdwood" <liam.r.girdwood@linux.intel.com>
References: <20260623105721.25865-1-phucduc.bui@gmail.com>
 <20260623105721.25865-2-phucduc.bui@gmail.com>
 <fffe4925-c5aa-42a5-ab8a-d8da4989b9b9@intel.com>
 <CAABR9nGh3nHnRx8yROqUuHLVZ1nWsDWKxJqAJaX3q+fiOBL+Kg@mail.gmail.com>
 <CAABR9nGZjz+VZJOJBB_BF72iYQtCs3Fvc_zskaHF8DPFodzX8w@mail.gmail.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <CAABR9nGZjz+VZJOJBB_BF72iYQtCs3Fvc_zskaHF8DPFodzX8w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0021.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::29) To SA1PR11MB6967.namprd11.prod.outlook.com
 (2603:10b6:806:2bb::15)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6967:EE_|DS4PR11MB9601:EE_
X-MS-Office365-Filtering-Correlation-Id: 8887d876-6a5f-445a-a740-08ded2efbf48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|23010399003|1800799024|5023799004|56012099006|11063799006|6133799003|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: eJIewAgsokd6iLfWt5u4s32R8g11Mi7eMSiZ7/p69Pd8SJOC5SEETycUELpMkWWstKdg48m8UHr7LeYzOH7uPtqnkXoqYA+L0nLpfBHwKpI03z7g6nTjjHbaJU2PJY2YyHCL+95/3/FQPyWvqXL+yoIrYoeiVPBt0D0Vo1zUMIQ4eWd8wXST1FNmJAeAgX3j009AGGz0UeSU2cSzNHDcVhkga+f+EcgSfQyWCGcW6ARmS6kkyJdfs1vatjQ1wP2fmqm5NmI038khwR3QUpzaK4tumZqbO95c35H9bXm1BgIAVsdM7s8vMtihQ4rLSUZu7CVeT3zoAJIfOqa58s1+/q8TnGsbaAJBEiEKzkLAdsdqSuxoEL0HAwBMQFEqCTzg/QnCGPgbIR2yPf2aFNuqZVxd9aiwBlZFl79ZDb5J/u0/WjDkVQuMusUIC1QmceT1WiIMIS7CKaoWY3MpchbaFV66VW6qZ1sK5vEM3JW91s4TYRJ5hn8a1KLUa+qYUJDQyz2FsHtP4sa5trFoPsIJzmZFPeDSgItWMEXaA1NtaFGLRbWqigZJJZpzKSC3WxEX1n/SPsgvkR/HFzoT+xbCVZo51yW6BkayB2E+UcHfBsSS9DX13CAKT+O+WUYpSFuz06QokPm1mTSNd1ivf2QnAfICnLaS683RRLUh05WWc54=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB6967.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(23010399003)(1800799024)(5023799004)(56012099006)(11063799006)(6133799003)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bHM4THo2ckxUVUZBbmx5STJCRXdiRW9sT1BWeVp2S3FJakNhTFBwam40NmU2?=
 =?utf-8?B?WTNhdEtiYURhc0dOYmRWMmdTdzUwTTlaelppK2F0T01GMnl4S09vZDRHK3F5?=
 =?utf-8?B?SWN6Ym81MVlWSi9ZUllDY1BSTjhBcUhicVdzWE1mSm1ZTUE3TUdpa3kzYUEx?=
 =?utf-8?B?Mld5VFZuUzdudzR2UkJRMGpGdDlISGNPOGhvcGVNcDVaUUgzYWYycm0vU21M?=
 =?utf-8?B?THJjUUt2dWNvaVpSdldtOUFNc1hvQUdlRlYrdzREazV3WC9pZnNsbGMyUEs2?=
 =?utf-8?B?ZkJMRnpiaWpkZ2dWcjFtdHlwUGhPaWV3SVE0cjNhN3R2RFI5WE9aRnQzOW5a?=
 =?utf-8?B?R0FiNHFxZjc5NnN6MDdGZEY0VC8xUks3NkpmWEJZZkZLU2ovNTE1aCtzYmJW?=
 =?utf-8?B?Vnl1OERLOWloNkNBbkYzdFRYZVRlQldqYTQ1Yjk5dXBYdjN4YXVuQUI2V1Fv?=
 =?utf-8?B?dWxETjZ3M0RXUHZYaVpmVnZlVnFjM1JoYy9mUGZpTVhyaWI4VExybi8rOGpq?=
 =?utf-8?B?VjE4SGw1UWx6OExoWUk4bUx6OTlYcDIxeG1sMEJXUE9OSWRKZVZUdksvVmVW?=
 =?utf-8?B?aXNqY2NGOUZFcklIU2pVK2lZVE9BVU5zRnpYY21zUkg0eXUvQmR4aXBDNTRn?=
 =?utf-8?B?YktXT3lMdjI1TW9KT015bTFGblhIbE9USjRDTEtDMHZQeUE4RkdHZGxFMXdI?=
 =?utf-8?B?SkRLa01wS0lWQTFUclVzMUROTU5VTGdEL1ZCOXJiZ0tXdkFhVk5yYjdyTkdS?=
 =?utf-8?B?SG9PN3BYdkNhSVNoc3RkemZqTzhEZlBUMGs1d2orOW1DVitwL05VTEV0M1J1?=
 =?utf-8?B?bllncEY5Q0RvUzZWcmtVU1Z3VjRvYnkzZklJbmRoY243TlJQeURTbzFEVklC?=
 =?utf-8?B?SWZwTURTVWdhejBqeEl3NnVVSGVBVUQrY0Z0TWV2cWNkNStKeVpTOE0rTzNz?=
 =?utf-8?B?a3hkd0phMCsySldSeUY5VUljZ01nWFdOQlBoUVlBTnAycExBRlhHOTNzbk40?=
 =?utf-8?B?T3UzcDhlTXhjNGNKWisyNUo2MnZCc243RTl6OVZCZXdEYTNJRCtUb1pPYU5N?=
 =?utf-8?B?MlRtQWY1eDNqTGNaREJiRm9YelV0OFR0Q3N2bTZZbnpsd25SWWpubTg5a2h0?=
 =?utf-8?B?a2I0NXROK1Fha3c2QU8yWjUxam5rcU1ySDdYb1Zaczk2ZlpoYnBSME9oSHVR?=
 =?utf-8?B?YkhNUSt4LzFnbXptdTJxRUo5TkJ3NDJsTTFlU1k0elgwS0dkWTBGNVNac0ZK?=
 =?utf-8?B?Y1NaUWgyd21iOTJIOTQxTHZxcHQ3UTRYSkJKYmxRb0hmNlpGNzhCdnJQK2ZR?=
 =?utf-8?B?c3JoRm5sWitFaUpXZ3JZbW5acHpjS0svK1hFWGVuNTJHUXJBZ3NKcVhhcjR3?=
 =?utf-8?B?U041Y2FWMkEvRFE0UVNCejhuWXJrSmxVUXpZV1cvTlJGek9wTXhJd2JrQ3pB?=
 =?utf-8?B?TkVOTjB0SVpKQTdDSVNlQkZ0UUJhUjZhZU5LUkI0bkVKRThqNkZyWWoySzYz?=
 =?utf-8?B?cHZYZjlqR0REeW1QTUVlR243ZExXQ0haTEdsMWhYVnp1WXc3MkNlMjNRdlZV?=
 =?utf-8?B?dzBVWEdxM2tHYXZ5Z0JuUHNXMUFsRHl4NEZodFJCbGNEckUxRzJaNG1MWndK?=
 =?utf-8?B?THpyVjJwdUpnYUhNdytUc2dOVmhVYzJKNVdFcldyMm5OZUZtelpPdDFVKzBO?=
 =?utf-8?B?MjZ1dmZWZVhiSXlaNVRtcHRqRTZwQ3dqblF5THplZ2VoUTM1eHU0Q1NDVmsy?=
 =?utf-8?B?bTNQZ3IyNFh1WXFBNGVUVXdXMkF4Y05lVm9GaUx2UFNjTS9VbUtkbm14VVBq?=
 =?utf-8?B?WEZOWHp0dmxDbU1VcEhDWXhlQ0p0TW9jYW9TS0Z6eitpN2RSeS9KT1ZOWWpO?=
 =?utf-8?B?b3ZlMGMyUmJvRzhFc21maGNPWHRBSU04aitvS2l0Q3YvY0NNeHY2dzJQMURM?=
 =?utf-8?B?anRadlM4cko4eGJYTlVialBFMmI3ZFF0a25aQzIveDBwaVUxYWsxa2FoWjYw?=
 =?utf-8?B?ajVhOTRCem9RWHlWZ3h0UHcreXp3UDFsck9NdkV1dVBIREg2R3MwMktQNmkz?=
 =?utf-8?B?R2FKVjhyYXhWb3dEdFRDa0xNZXZ3eVRENm5QcXRIbDlWN2lUbjNBWTFURDVn?=
 =?utf-8?B?YVBvUlA5N1ZCeTZaOGZKZzhLblZrcEdqRk1xOWFOWUNkZVMxQUpGa3JiSTFF?=
 =?utf-8?B?VjJPbEwrbWJWRFNBUW1GV0ZKL2pITllHbUVVejBTUUR4WTJKZ1hNUEpORndS?=
 =?utf-8?B?KytwcnQvNEFYeUVsVnhUODdkR1MzQTFROVBkRjVTbXI3NkZkdjFNWlVaZzd4?=
 =?utf-8?B?Wlc1S1djWEw4eTRZTzZCcnhqRTAvdzZVSzh6MFIvUkczL1VmREkzd2hmc25h?=
 =?utf-8?Q?iPQuHo5yGFMciXe0=3D?=
X-Exchange-RoutingPolicyChecked: iBb9iai/297TvgxQneu0U4vGj4vRA4upk6auNJcvkD6LcRilMhtVZ11tQ2KnS4MAA3Vz9GGhmB5PFvoSYqEdfszPXPlWLFE9TlD/1F4YJ1NrS1/Opy7ICxW/HrM3NjBoYlNeXilUu/TNdEimdnAFAWjld0IKoF11eewlKCNz2t/M9kHnWMeL0TYEY6B2zhVd2pKt/U+e9QHBIEegjyUC16Oil9NpUyT9x5Bix3DHtWuL4J2vw33Io+nHk5lJ6kEgJPbKkjSkN6q56AyDxVKw0iaCyN67WmFZF7jLYZLv10BK1Is4fvu2IiW3WagkGgm30dni3JUDlSjJGfORNRwNOQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8887d876-6a5f-445a-a740-08ded2efbf48
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6967.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 19:27:08.2954
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B2zAYBrfQriCcnzKwhdJwjqrb0a6z8Ba0F1odiHxS2O+a9AJqJkE2LXxDR8KsesInuz3BQOvijI0TwtLWL/4zpXjey3qtgtWMaJzjwHuLmI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR11MB9601
X-OriginatorOrg: intel.com

On 6/25/2026 12:54 PM, Bui Duc Phuc wrote:
> Hi Cezary,

...

> After re-reading the cleanup.h guidelines,
> I think I was mistaken about suggesting an ordering between the
> __free() and guard() patches.
> Sorry for the confusion.
> Since both conversions are part of the same goto-to-scope-cleanup transition,
> combining them into a single patch seems more appropriate.
> That said, I'm happy to follow your preference.
> Would you prefer a single patch or two separate patches?
Hi Phuc,

Thank you for revisiting your take.  In regard to your question, I'd 
prefer separating __free() from locking.

As a sidenote: even if that my take from technical perspective would be 
a complete miss, the commit message should plainly state: a preparation 
step for upcoming locking changes.  With such statement, a maintainer is 
aware that there is more to the change than just pointers cleanup and 
placing it at the front is intentional.

Kind regards,
Czarek
