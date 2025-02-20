Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 528A71FDA62
	for <linux-sound@vger.kernel.org>; Thu, 20 Feb 2025 15:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740065873; cv=fail; b=UPfWRV703bVI5QZMX6RyMQbxwavl+zXQipa5KN9TwH0YY1EKmk/Wz2wdAUYEzrOCFgH5buyC3vt5l6v6LjPLwqaSQThNmBhqDnt0NYcFJaENtadBKZqr5PsXk2lBwIOX96WppkDgUN846pT9zxydIQTNpf/wuTHC74ySGSX7Lcs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740065873; c=relaxed/simple;
	bh=nWwBbGj/1lMg7YFXmiNz7eZPo6Rz0BMffmmSmZ31G3c=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=YxffjqiC22r5ZkjCEyfCMbjD8YOyaxxQU2a9I7uEnjKF0pirGmFLohtuW4c1vZ+sMIAroT9qtv/9liejvAQ3W3+EB3m7kBr/QTv/xNYEiYl9IPbdAwwVdCw6Ko1HZIFILB7fRJcNaXD1EecrcDKGRAjKBAj21G7LVimSCZ83D0k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n9wOrsbW; arc=fail smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n9wOrsbW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740065871; x=1771601871;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=nWwBbGj/1lMg7YFXmiNz7eZPo6Rz0BMffmmSmZ31G3c=;
  b=n9wOrsbWHgCPzG23c29tOQEwJSkkq+qGYDKMVcUvnLp51/MOe+XZGSmS
   c9jdKlD0sObrhCBUMJrqOBNBlJlhnFfVmnb8P2yHQsUC2uYUL0NGkeAMq
   Lo86MXQGFc9Zz3Ku9gscwPabP/5WcYWSZMd8hVPw5a9YOWCc6BYwiPK0F
   QK3ubXVEmx/TRFHpMsDffp/54GfC2p9Eb55YYNadiS0jIhCMM0ymoos0D
   ib+5NfWHxR3ynGxmTOzYulawcoYBfP/rVIH9NVbZxvvkF4/yKeHi2uZna
   lUftDinbxg1GTMpr6aloexhH70j2damXFAYltR4RAEjpiZ2KthV31Trio
   Q==;
X-CSE-ConnectionGUID: k/zFVY3pTFOQHO+/yqQiCQ==
X-CSE-MsgGUID: MGypllCTTqaMztQWGJgbsA==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="40774838"
X-IronPort-AV: E=Sophos;i="6.13,302,1732608000"; 
   d="scan'208";a="40774838"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 07:37:50 -0800
X-CSE-ConnectionGUID: HeOWt68ASzeLwTdYEMBscw==
X-CSE-MsgGUID: 6JkYS3WxSCqhzn3r9xhaHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,302,1732608000"; 
   d="scan'208";a="114910950"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 20 Feb 2025 07:37:50 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 20 Feb 2025 07:37:49 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 20 Feb 2025 07:37:49 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.42) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 20 Feb 2025 07:37:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GeLCZC4of5+2S5SSARCSi89/mXufwY5fXZuB3McWd9FueUkJKwovxTaw+K0yR6wm4uZUvi/m9C6LuOhadDUrb4qpPapEqTE36tSVDiu9RDPSo6aZA9XT0/SgJaNTXXsVgwmCo16PgDQ3Xt6siGTYLPRwBTrxDXUV2JvwbnkdVAkVed5KwvWam/FkA7ITI0KjpgJfq5EXYXJX29FCV2KNBPCa7aTVxoVEZKhL2zNKYQUfAcrWoFimbzb3sufKwmEz0ZBulnXWQX6QbJhk/EzGRPc/g46i0WMfIBRp5fa+JFghift0hwCvBxUd5gz2Y6OHjYy5pnsowVdkBpn4mdzlkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pHjJ9/rWjj5cJr54LW4gxRK6n7lehNhRO7rrK1MKLE4=;
 b=RTF6kFY3nxbTr5mTvfc6DcJGKRW4qm2ecnJgdwhHvAUcai8OXiONUR+dYUAp5drb9OveF3Kce2To4mS7UrN1vbwtOG5BDl5OwBaEitm7f2jaxuRNz4CsXND1SpHTybB7Axwaq9kGpFNw3SFvbgnAkiaz/vyWkxM8Wd7SqGw/M3MU0IUgi2hZJHVRKKINyYR1a7rZXuj9t/Fio0SQaxCBMBy508CwztYIHttFh+Vw41xhsoO4VxZpBXgww//vVDr6p9K+4So8P3WzkTzSqCxFxkPGmbrzPcuxHkSRmqdhJRv/32BTfRaRlgwZghbHxSjxm1ikmbFJpC8gPPO6I8nmrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 SA2PR11MB5017.namprd11.prod.outlook.com (2603:10b6:806:11e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.15; Thu, 20 Feb
 2025 15:37:47 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cd01:59f6:b0f8:c832]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cd01:59f6:b0f8:c832%4]) with mapi id 15.20.8466.013; Thu, 20 Feb 2025
 15:37:46 +0000
Message-ID: <fc0cbb0f-699c-4b1d-b238-ad733d2a5632@intel.com>
Date: Thu, 20 Feb 2025 16:37:39 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/24] ASoC: codecs: rt1308: Fix definition of device_id
 tables
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: <broonie@kernel.org>, <tiwai@suse.com>, <perex@perex.cz>,
	<amadeuszx.slawinski@linux.intel.com>, <linux-sound@vger.kernel.org>,
	<oder_chiou@realtek.com>, <flove@realtek.com>
References: <20250220112643.3813295-1-cezary.rojewski@intel.com>
 <20250220112643.3813295-7-cezary.rojewski@intel.com>
 <Z7c4BaI8XgOoY7hz@smile.fi.intel.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <Z7c4BaI8XgOoY7hz@smile.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR08CA0275.eurprd08.prod.outlook.com
 (2603:10a6:803:dc::48) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|SA2PR11MB5017:EE_
X-MS-Office365-Filtering-Correlation-Id: 96dbe959-ab2f-4070-59d3-08dd51c4855d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eitmQURUTXUvWWVCcG1wSFlFQWJMRWlhQ0J1RzQ2N2RtTURLQW8zWmdwZHM5?=
 =?utf-8?B?bEJhNGVkWGQxUzdMenVwWC8xdHpYc3lVV25idGxPamxmMzZ2ZE5CbDd5bnBG?=
 =?utf-8?B?RU0yYXdMelpGQkwvb2Q2ZlVnK2o0aEdHazRFeXhiUTZQTkszR09MeERGREZL?=
 =?utf-8?B?d3FGSWlZMml4ZGNmQUk2TkdEZFFLajllRnlrVVlrREV5VmxvVUg3R3U2cC9z?=
 =?utf-8?B?YU9JQW9oSSszME13YkFSUFNGNmJOUXpzREhFZklkTGJUYmVyOHFxb2t1K0li?=
 =?utf-8?B?NzVQaldzT0Jqd2tNdGw0enVkTnFHdE9KQVJ0eTVsQUJ5WWFCNUNveE5jUXk1?=
 =?utf-8?B?VjQyZnRiM2ZrdkpoRkRlRTVpWXRRc2VpdkJ4aWNHbjF5elFBWGFjSmswOGJ3?=
 =?utf-8?B?K3pEYVIyc0RMWitWWGhKVGdVZllodlVFWCswcGxDbHB4K3JnRFNrQ0hacGNS?=
 =?utf-8?B?ZGN1YnN3c1JPSktDcGZvS2hBRmd2K3cwRFJiR2NTcFgvZ1g3M3ZTQStBWEdL?=
 =?utf-8?B?KzRCZVVSQnltY1R0TVBrSmFGdW9rajcxMzZNQ2JSOE40V3J0c1dkSHJBNits?=
 =?utf-8?B?WjBkNjNIYnZpdzFMWnlYZXJScVE3cFFCM05LMnhiUlJ0M0MySFBlQWh0RFU5?=
 =?utf-8?B?WmR1U1BncXFEQU9qR1pqdDBTNWpPbFdPT2hoOEpRZjcyTWJYaEtjSWRqYTZV?=
 =?utf-8?B?UTFxUEh0QjY3ZzNhTFY1RmU5ZVVYeG56c0Z2QVBraGZ0QXFiTXJIeXIyelI3?=
 =?utf-8?B?MDBWSTZKZDY3NjN2bHI5bVNTalR1UHJUWjVJWS8zU2ZOWXU1T3ZsYlVRSDJV?=
 =?utf-8?B?bkIwaGJRSXVMTzJzM09NU24za3djZnVLZVZ0UnZaMTdDb1J5clBoMzhkbjdW?=
 =?utf-8?B?cFE1ckcyeUxpWEZ4UHNpNzExNm1zVEJhQ0M1MHZHeFYzdWdGTmJDSTZMQVg1?=
 =?utf-8?B?QUcrSnBZZm5ieU51ekViVjVYSlZMMy9kSDdDR0JITE5SUWR1UEhZc2g1SXE4?=
 =?utf-8?B?UTcrQTNZV21PVXRJNnpYRGZuV0ZiQVVZRzVGUnhKQm8ybnlNZ3oyNjN3VVFk?=
 =?utf-8?B?c1B3aVZaV0lKR0IvZGdkQldmRXRsc2oyWnUvU3FxT3E3K3BOOUlJTlFSYnlK?=
 =?utf-8?B?Y2xBUHRaMVlHY05lTFJldnZ6dVk1d09IOXJ6eFI0ZzU0NklZaVg0WDR2ME5a?=
 =?utf-8?B?VElMZ1VpZEwzdHRmSS9oTGpWSTgyZE5uZnpCZ0hhNU55bkJubHd1S3JnK0xv?=
 =?utf-8?B?V3gvNG5meFFWaXNIZkdIRWJyZDRwT3M4UEs3NWl5VjFneXhWajlzVitqclhu?=
 =?utf-8?B?YU1ORWk1aFlqZWNVdXBnNFhIbkRWMUFETk5QTXM4VWVRNXphOXdRN3A0bmdp?=
 =?utf-8?B?TVRTWGV1YjcrWDJqcWg3OFZZUjQxb1ZTdE4wSGYxb1NnSFhiUkFuVXl3OU5W?=
 =?utf-8?B?a0RodXhpckZVRTBPSEFCem52OWtYZXIyUWZidGs3VHpXb2o0K1RiSFhLWnBz?=
 =?utf-8?B?ZFpIUG9EOGV3bE1tallYRGZoRytTL3JFR1Vybmp5UHEvbWpKVXlWYktZNDNJ?=
 =?utf-8?B?RmFnRUMxclIwYk42aS9nTlBvTVkwT2x6MnFicmozRlNlUis0NlJKL3FLZHpl?=
 =?utf-8?B?ejJtSURuSU8rN2t4NUYwSGNLdlhrcHRweFA2K3UzaktnZVJjUldnbUF3OUFq?=
 =?utf-8?B?dDhmSXRGVVlmZEdkQ1lxNVpQZmVMd3c0dFg3V2d2bFkyV1lqWE82RVNNaXk4?=
 =?utf-8?B?aDBUcGd1VWJrZytKUU1LR1UwQ0JkbFBCc1dURDVUSUZMNEZCb2o3dHk1d0xD?=
 =?utf-8?B?S0p3cXBqTU5mN3E4UXowMFY1ZkVnYmY5dGJRYkZkN1BMRjQ0TlEwTm03M3hE?=
 =?utf-8?Q?T2xWxjr0T9nts?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6375.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SHFBMmRKSnJhcFQzRzIwOVlkM3dkcWRBajFkMUFnTmlTR09tREs4Sm4zcFBh?=
 =?utf-8?B?MXVQQ1JUQXhaaDdTQm93VHlyNWQ1THUzNXV4TGNKVGVqa1N6TTdiUDRkSEN4?=
 =?utf-8?B?bW5JM1pEUkgxeVJONG5EcHlwVmN3RlZHVXNpbXN1djBrbnVNR1BUWVlaRkFB?=
 =?utf-8?B?eGZzOENzdUQ4UmdKbXczc1BLTXg3ck9WMTk0WEVUb0xCVVdzUXczWjRaMjZO?=
 =?utf-8?B?Mmx5Yzlid2ZWZEJCUXhVWmNDMm1NZlFRRU1vU0dXNW9GSDd5cmYzUmxQMjBr?=
 =?utf-8?B?U0dKOEdMamtjNXZNbTJ2dmsybFppQzZEOVVkd29GbUlyOFJsa2QvNnRoSzlK?=
 =?utf-8?B?Z2pvY0dqbnZnbUhVckw2Nk01dHFxVnpNOXVlQVUyWmg0c2l1YnY4Sk1zZERm?=
 =?utf-8?B?QzBTbGxWTFkxak5TN1JhcTQwM2dKV2dGUUFPcFFLMU5rMWVCS0hWTE9Ud0wy?=
 =?utf-8?B?RXR0QXF4N3gxRkdQSXJXMEM2ZEUvaWZpaFhvZEd6WXltODBkSXRkYUV0T0dt?=
 =?utf-8?B?OTEybU1pTXVHSFloR2VsY3cwWWkvR1ZBMWZqYmNJZ1E2Q0ptd3RIY3Zsa2lj?=
 =?utf-8?B?em9Wa0hueWt6aElkb0M2OUIzVCtzdldNc3JpdEI5WmRDQTIrRnN0VjNxcldY?=
 =?utf-8?B?YzZqekZvZjUrc1dyRjhwVklMNkthY0Z2bElLekhTcHc5Z3oxVFZyczVKWDRq?=
 =?utf-8?B?anM4RFZKOTJBMHhSeGdoT3BnL0FRY2lGbXA1blBhM25EcHJ1U1BxeG4xRy9O?=
 =?utf-8?B?Tk80Z1RlUFlZT0EwS0ROQWltdThidmdOWldzMmFXeldiNlNkVFZNeHpmUndh?=
 =?utf-8?B?Rnh5c0Uva2JwWjRFY2lhc2YrS3hGc2I3a1hQYVNLVjd5MWliQTlEdXkxeXFU?=
 =?utf-8?B?YVJRNVhuRmtKek9QSm5RYmJ2TUhpcU1YMmhQWnNwL1JQY0Z3N3pHRCtTMlor?=
 =?utf-8?B?U3YvZk5jTGZBWXBxOEEySnppVytKK1VLeFhyL0ZodFR0S0hNMW9QcEtrM3RQ?=
 =?utf-8?B?bkFQMVZHUG9CN21MN2xBSjlHSllPZzBvNVdwNTF4dG9rdHlTTTBGYklsd3dZ?=
 =?utf-8?B?eFJINm8reW1uSlZBOTBBL0tnYkxYcHVLekUrRHVxYWVoR1Q2ZEFUbWEzYkNP?=
 =?utf-8?B?dW8yNUJ5SklXcm5rY3NVWFF1Q2NOUUx2WGtGV05PNnB2OVFYZEtmVk9vbGZG?=
 =?utf-8?B?MVhyZnVyajB4ZTZmRTR4RWRuREZmQzVOV05UdjFlaGNOa3l4Y01EV3dZN2Fo?=
 =?utf-8?B?ZTdhK2NjamNQdGtqS0VhdHNhOUhDOXFBU3huVzZHM0FFZ2VOKzMvamFEa3U2?=
 =?utf-8?B?eUZySWNDVzZSNkMwRTdmUUs0VUhoUWF2NjlqelNPNVlSdWRZTXh6aGtTYnlD?=
 =?utf-8?B?NUJOb25YdWlDeHp1ZmxTZ1Y0TDdYVHYwSFdWUVBrNFdURjdVcWpHQlBGVVF0?=
 =?utf-8?B?ZGVHL1lCVDBHYlBnZ1pqckp0ekRwUitRSW5XUytzS2JadU1hZ0IxZTNoL0FV?=
 =?utf-8?B?amRsWWg0amhSL3N2alFXb2hyZXFoY1hqTDlBbWY1aGlkTkVVS0tOZDNQYzVw?=
 =?utf-8?B?NmQrRTNkbitrc0VVYmwzWDJMeDdGQWFYT2FiYmN1TEtPekZMYllZdW5sSzF4?=
 =?utf-8?B?TTEvb1hoYklMYU00SnVCTmNRaG1EbEhCdkdNMUZvOHNHb21xcnBGT2hIcCtO?=
 =?utf-8?B?T1pudm5VYTdGVlpWSC9UcS8rZWd2RHg2d0tDYTJrMzZHWmxoMW5VYmFqRUxr?=
 =?utf-8?B?Vlp4WXFvc09nSkhwSHgvWGtFMjlXd2pQc3lMaE5RUFBoT0JLRGt3OTF1eG9V?=
 =?utf-8?B?bmd3UXVtN2Q2RlNpRWtzWVRRNitpbXBSZ1JMQlJXVDdvWEs3Zy9NWGdSRkNn?=
 =?utf-8?B?MmJUcDNsL0Y1eEpmRkt0bEZTK1BXTDd5b1k3bSs1ZThLZHJiVXpWNlNNS2hY?=
 =?utf-8?B?VERIUExYayt2T3h3NERVaUQ2TzA1ejQxUnZac3lTVUd0QUhPRENOZzUvbXlC?=
 =?utf-8?B?R3RsYzVyUlVHNEhoRzFIcitHdklmbjZmOGtGRzJLM3JIU05BejRSR0FSRkFj?=
 =?utf-8?B?WjExeW5WMWZZdW1lbUlkVHl2cWdLa0hqMEpKOTNzN1dUK291N25FeXNQdjhM?=
 =?utf-8?B?ZGs0eWFSYjBaWnVVWm1lMDlqd25ySjhzSGxWSTRRUFE5a1BMZC9GdEJDZDRx?=
 =?utf-8?B?d2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 96dbe959-ab2f-4070-59d3-08dd51c4855d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2025 15:37:46.0047
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g0JBl8aKQMYsK552QeCxcy2gzo5UW6gtnoqLftlyRSfwy34NlJo3jBO89Bta0q+9TOv2qtOIjNSCnP+NvAivDXA4bG2FRCKHPEV704KMSvU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5017
X-OriginatorOrg: intel.com

On 2025-02-20 3:11 PM, Andy Shevchenko wrote:
> On Thu, Feb 20, 2025 at 12:26:25PM +0100, Cezary Rojewski wrote:
>> There shall be no comma after the terminator entry and initializing
>> fields with 0 for statically defined structs is redundant.
> 
> ...
> 
>> +	{ }
> 
>> +	{}
> 
> I think you want a bit of consistency in the style of the terminator.
> Preferable (by majority) is with space inside, but some are okay without it.
> I have no preferences, just one style for all in the same driver.

Ack. What happened is: in some cases I just updated the line according 
to the standard whereas in others I did remove ',' and other stuff while 
aligning with my spacing preference. Will pick one for v2.

Czarek
