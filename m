Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6745531770F
	for <linux-sound@vger.kernel.org>; Mon, 24 Nov 2025 18:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764008461; cv=fail; b=iueCcbi8om0RpOZO7RLdah1TH5EtCfCX+xJ5G/hVgvfz7UCVYQkx3SvWvSCf1OVE48TdJDuBafe30e9SC73uJiHl0uFj38Wbni9dpF3cmWqx5SemsSqwMy6VfNIUWqrIaY4P59HRCCxblGBU31xzyjOaa7DksE1tKBdkg5AbGGA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764008461; c=relaxed/simple;
	bh=fRHKCn9F7BvqDP79IAdAffe0Ox4QnM1E8ltSgj17D2A=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=QaeEwT3qYAztN4lA2ux77lR6LyV/dObaMO0HRbDLdcbNSYhm6GzuOsOXuJ4mEQC8gzMXb9+XA31FqzD9fdhpF3PQhTNTxAVbhMoB5uRSFBnZSkZBrSPdWBm3kgrtYeIzXAwHCc1wFhDUMRowJVK0tRbl8GbqZRYlv+xTWju+bpk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F7cNoJP4; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F7cNoJP4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764008460; x=1795544460;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=fRHKCn9F7BvqDP79IAdAffe0Ox4QnM1E8ltSgj17D2A=;
  b=F7cNoJP46kYHZj/DMKwSV/U85b94A9heRk4wDkMjLmfembo4fiSckcYc
   UXXSSqFqHXpllKhat9fb2gHY2d/UVgbbU3QqCmA7lZqThhkW+h2T6pQ3y
   DhJ8gn7NV3OSxg/rKMB9a0RLEbx7eqJtS3tzhUnpgwJ4zEq+lIE71HUaD
   KFpsLm9KseTVk67l1KyhErokpc7YFmmlwoTU1W70qvkglPcjJppRs0L8T
   BvrpY961EnayQX5JwHWKDY776rvxYsTBZ/XsZOdvSJERnNPcTjIwplEtW
   2dHrxwX++zZMjzN7IR5ElZeK9q0DnP7jh+nH7muo9MKmvT2lxdnvhx7Do
   w==;
X-CSE-ConnectionGUID: EwJJohrcRLWk47rLYVqPkA==
X-CSE-MsgGUID: P25aukCiSmCvXP54MNGzPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="88665284"
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; 
   d="scan'208";a="88665284"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 10:20:59 -0800
X-CSE-ConnectionGUID: tlWTFZN3RDChYuGaJl25ZQ==
X-CSE-MsgGUID: T1KsqVDCRkC49Wz5rHDqAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; 
   d="scan'208";a="192642554"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 10:20:58 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 24 Nov 2025 10:20:58 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 24 Nov 2025 10:20:58 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.39)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 24 Nov 2025 10:20:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sw1t5j5I/0RHCN21BlFZoDVaX8JbbNJ//Ve5yx/ph1jdeTC4SP7xLNspPQKYA2DsHWlcAfwjKJElTdLskjncXKUXnuHGdM5ihT/9J55goT9cHU4efoC2y3mDdMf0yaP+QeWIMwrQNJY+7J711+3cIZbWcq4YS7pJMZIUFjlkIoYRmNuELUCfBjAIu36Qiyx6MtkzEA/e2aJXpntcKKsKCUUZ3sXmYnqob1ty8rwLoJCH+6rNrL65tj828pDBQnKaDB3Y2yblOYamDrMExGfzSHtYAa2nDaNNlnLWOhqAFI2yD7jmfuXgwcYtrHHoodZCMcEigF8lj9MXsuIC4u6a7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pTVDc4U4h7iqEAf/XKjeJdwFs7lUaKi3uBHu0oHryjI=;
 b=k6c6GX1T5Mt8aIhGTLId1MW7SSz1W6voJcCIysylMIVqN6LI8VE222yRtjNiQNdo+TDzlPmRTnAsF9CrrEsHd2JAqzg5jegfXFtiJ5iMfEUeNI5YuoNHJaklUQooCCVAA6o4GFXy/FSAvjuZ4IXCIQJ0xn+RUF8IqDdcEJDbJ2Dtd6PEgj3vXehp/9iP6oggkpOz8HnRRhjplNqoghS3HqiGjhILCwjtHy/xbmNtfFO11rneGj2OkF61duJ09y5FtM0fGnF6BIbkZVVZ8FnyrygNIQRBIyH+WJ9rvz95dJl08bbefmpnbKxaWA2RdUupjSnY4DkFyeyFyy1psfFLNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8283.namprd11.prod.outlook.com (2603:10b6:806:26c::16)
 by PH7PR11MB6980.namprd11.prod.outlook.com (2603:10b6:510:208::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Mon, 24 Nov
 2025 18:20:55 +0000
Received: from SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::3:e0a:87af:d4b6]) by SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::3:e0a:87af:d4b6%6]) with mapi id 15.20.9343.011; Mon, 24 Nov 2025
 18:20:54 +0000
Message-ID: <e99d1131-0c7b-4cf8-8830-34f766bdfe6f@intel.com>
Date: Mon, 24 Nov 2025 19:20:48 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] ASoC: Intel: catpt: Fix offset checks
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: <broonie@kernel.org>, <tiwai@suse.com>, <perex@perex.cz>,
	<amade@asmblr.net>, <linux-sound@vger.kernel.org>
References: <20251121114331.3841335-1-cezary.rojewski@intel.com>
 <20251121114331.3841335-2-cezary.rojewski@intel.com>
 <aSRsX9qlUVC7HHvA@smile.fi.intel.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <aSRsX9qlUVC7HHvA@smile.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0041.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::27) To SN7PR11MB8283.namprd11.prod.outlook.com
 (2603:10b6:806:26c::16)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8283:EE_|PH7PR11MB6980:EE_
X-MS-Office365-Filtering-Correlation-Id: 55186bf2-4c5d-43aa-2894-08de2b8634dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UUJZbFA2VnpVdDUzcWNQTGloLzVEdXBJeFAwaGlydk9ZbmdPUHZtWHVTdTJU?=
 =?utf-8?B?V0ptUDREaFZFRTJLNWNJdU5KeDM1emhpMnNjRU9xakNJbDNWT29kdGhNWG9s?=
 =?utf-8?B?NVU4bExPUmtNaHpCNmViZTIrUzd6SUdOaGpyRjZQdUNjYkY4Tm9VZ0tIbHBq?=
 =?utf-8?B?cGxOY0lKUzM1Q2ZLQWNhQmUweWxZM1NRT3FzelRRRFpxQjNhQU9Ddk9vNVhZ?=
 =?utf-8?B?R1J5ZDJtMUc4akxCN2I1M1Y0d1FWbTZLRkJxN0pLRE1semNTR1hRMEozNFVS?=
 =?utf-8?B?OU9IQUZzT3pCZGp0c0JjdEp5N29rVENRam0rUkNXVlBWbjVSSTJ0L01YOWhO?=
 =?utf-8?B?UWZFMmRvNHBNdWxpdnZSWmNGTGJnLzZXNnlTTkNQMG9pRm5VcklncXpiSTJo?=
 =?utf-8?B?VFFpcmtZUm92bklpU3AvSkpIaEJVMTAvdlZZWmdEWkJKTGRrV3h3THI1NDho?=
 =?utf-8?B?djFxSFI0OWIyWHVlMFVqOXA4aGt1bHJWdG5vSjBPYXBQbGxnUG1MN282NGdw?=
 =?utf-8?B?akhTdXh3aFFaRktnYVBRem8yeVM0bUs3ZWZxYXhNRTJpSFBLY1NpN1NvSzNW?=
 =?utf-8?B?UWFJQjNCVTV4Q3RBUXdwRWtQK0FuZ3hzMWFMVUNoRHVWOFpkM0wrOTdTWFdV?=
 =?utf-8?B?eUduaTNEaGhmYmhMaXp0aXFvbW9OazBPVktYdG50eWJ5NEdRUWpYeFB4cXF0?=
 =?utf-8?B?TUd5RFRGUXRkKy8xZmZzbHZWeGUxUVFBMjFsTVFZUXBKV0hqL1pDMUV2Umhj?=
 =?utf-8?B?YWYwYzBBOWVOK0EvWlVPTVVPeFlZU2xSd0tBQW9KS09vejNkd2w3K1c0VWVD?=
 =?utf-8?B?dXkybzFEaFNoN0lYSVdmVzdEbEF1VzRVZ1hFb1B0eGJLdmNiQmhUK1g5UXdU?=
 =?utf-8?B?WGhFUUVudEJ3TnkzSlpUYUZUZ0NUQTd6Rk1IdklNeVJwN3lSR0JaVW5yZk1v?=
 =?utf-8?B?cXEyMzJycE0yREVRUkFqV1Z6SlB1aWdGWTF6YUJaN211UUdPTlF0WFMrc3BK?=
 =?utf-8?B?eUhlSHFxYkUxNlRid0lLNVJuWUJ1dzNPWDh0M0J4MTBwM3RGMGNxa01mKy9G?=
 =?utf-8?B?UXBPVEwrY2o3anZGeWVJOWcxVStOb3JmbnA5dXZpYnRpZE93bU4wNXV4SytH?=
 =?utf-8?B?N2dUR1h1bWJkWWZZcG1TMjZZdkRLSWhlREM1Qk90dC9NM1g2VVdqWWtTM3lV?=
 =?utf-8?B?Q2d2Q2tta1lpM08rclhOSVF3WnpUK2tKcmJBSXpTc1V0ZitOQjRJL1ZoSkZB?=
 =?utf-8?B?bkNZRzg3dGZoMXdqeFRPK3U5U0hFKy9RQ1hYSnZFdjhpcE5IV2xIY044SHRm?=
 =?utf-8?B?dDFld2tJYUhxMkZTZE54VGQrN2FDOSs0UDdUcHFWZU1mTjFkaFRWaGg1dXZF?=
 =?utf-8?B?NTdzWGZUOGs2ekNUM0piS1g4OWQ3UjBUWU5WYk5kVk8vUjR1aElPd0ZIZEp3?=
 =?utf-8?B?bVJyR3k2cnAvcGlDRHhqN0VHdnlvV252MGo4MDc1SFJwcHY1Q3l0RDNySis4?=
 =?utf-8?B?amQvRmw5UnZPV2xBTytoTGxPVUhtRXhPczVaQXcwSzJseWtCbkI1OEhzekZs?=
 =?utf-8?B?dGExSmNLaWhxUmNxaDh6aTNPRVNBYVZtblk5OWNSQWNwWFpTVzJjMjc0Tisr?=
 =?utf-8?B?L1l6UkxGcGk2WDZJVHNHWE9uSjYxN1ZpekdCK1JVVjVhdlQ2VmRmeCtMYklh?=
 =?utf-8?B?bEcxUGJUSlgrdnhWMzNlRWtnTjBWUXJZbjhSUWltRUVIUHpmejgrbWhvODVW?=
 =?utf-8?B?bG9pRVJrZEtwSDVUa1k0YWhxNkF6WWp4MFA5OU5KbzUybmdnOUFONTl0cDY2?=
 =?utf-8?B?bEhSNTlrTEE5TWJjQVdLUWx0bjdrQkRudkMwQ251NzZkazlWVk1lekloOWxM?=
 =?utf-8?B?Z3FNcXJPMmtrSVZxQnFxZW5BL2ltT1NZaWt5eWNMOE1NYTVGTTRKZ0tibFlY?=
 =?utf-8?Q?r8tEdc7oyyX5ohIbNWvjmL/ZzTWiELAW?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB8283.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d2tadzkzeVVHclgvdEFXVHdzM3k3NnhxSVFJUmQ5c1BGYlN0T1pmL2JOUG5k?=
 =?utf-8?B?TXRWRGZ1UEJ1Q1dZelMwbUJtR3VkY2NFTE82RDNzK3IzZnllb2J5U2dONndx?=
 =?utf-8?B?eWxjZkFOYjE4TEdFbEpHM0dWc1ZqQ1ZlZVZIa3ZiZlpDbGJLV3lMQ2tVVUF2?=
 =?utf-8?B?V1FVTzRiYVl2VDh3QUtPelhYeDU4ZnBrMmpqTXA2UUxwUHJjdW8rTStPT3FC?=
 =?utf-8?B?b2ppbzNzQ2lqMmJYVlBlOEQveDdTOXdYVGZaaTVodFRDTjVUZW9CZ2M0K1FH?=
 =?utf-8?B?N0trTTQwQVgzcHZOSmI2d05TYnkvektYZVZsaW9iT2E1VEpDd2NNZW11Vjcw?=
 =?utf-8?B?bU5BdEw2Z0g5L3JSajV6WE8zaHExb1B5UHdvQjZ6Z3B6bTlyMnd5anNLbW9S?=
 =?utf-8?B?V3Z5NkhWSHBBSmxlUG5TYVNnc0hLaFUzaEJMdGlTV1gvNHRpNVEvVkNqNmdp?=
 =?utf-8?B?N1hSQ0FVUE01RFRHTWhTQVNCWW0zMWZiV0k4cnlTd0svdnE2VjZrZk5VQnYw?=
 =?utf-8?B?Nkw4OElXcmZaWERlaFA1Y2ZVaU84WlVUbUNYM3FqYllkRHpaK1BLamQ3UHpy?=
 =?utf-8?B?RUV1S1RxTHJoZTVDNnozb2xZVXJFQnJEcDBIbHRnSDk1WUZnWXVFVjVKdFVh?=
 =?utf-8?B?Zm53VTR6VHpCTVUwRmJkSzFOckxFdWpSbkhXY3NwSzdyWjRSOXNTNGZmTWxI?=
 =?utf-8?B?OFROWWxEOWhRT0Z1c1YwblBZTUthMU9rbkZUNitGVmJDT1VrYXZqL2g4ZUtt?=
 =?utf-8?B?OGpzQS9KNUN1bndVT2w0NnlLQ2dlZXN6OVNZQVQ0OElwYjdDOW8rOWJwUjg4?=
 =?utf-8?B?c2tIM1lIOW5hZkRIcGplZWw3UXdzZldncXBwQ0xKVXh1eWdySGs2SysyTmpI?=
 =?utf-8?B?aVI3NTFtVklxcE0rMFlpeDh3RWhQb0F1bmVwOFJKQXlIYWxnVXlTSExtVFB2?=
 =?utf-8?B?WkxlRkNBRndEaVhTaU9oR0M3bmdIcjljdnBIbjZvbk9wNWFoeGZ5UGVQZngr?=
 =?utf-8?B?RkFSZHlBSyttbmFHL3JMY2tDRzdnQ3BKVHZjcHhmS1UvL21pYlVlZVo4OVlo?=
 =?utf-8?B?RStCcU9WY1lGQlZsVkJyMzdpYVpWbVNVTmRBV216VjFBUTEvVk80cm5kRkpU?=
 =?utf-8?B?L2I0R3Q2L2k5aDVkdkVmYjRGNmVjcUhpakFNdUFuNFZZSU9scWRNeitVVUth?=
 =?utf-8?B?SFZ4aDNZMURoRnVRYTF2cWhBWUFzUkloRXA4ZXVjMUJRdkl6WkQwVStObkVs?=
 =?utf-8?B?ZWhhOWlWMXJmTitQTFRZdXlhVWJ1VkN5WXpDZm10UEF5RkZvUVY2UC9DUTB5?=
 =?utf-8?B?c2RUUUc1WmtKdHdkaWZRSXdlZjVKUUozNFZVY3lPVHp6Y0dtZk9HaE4rRmlW?=
 =?utf-8?B?M3g3bXl3VDU2dnlrZi9aRlR2WElTRHVIUmV4dWd5OUxGKy9zYWxxVFBXWUlo?=
 =?utf-8?B?VGdSOUZBMnp6eWFLeU5RYjhUYjBVYlRrWWhrakNvbVJsY0VSWEFKc1MrejZr?=
 =?utf-8?B?aXY3aFFhR0FjMW03WElsT2ErMnFnQ3hPQWFOdFIrTjlxL1hWdnhWMHdEcXpG?=
 =?utf-8?B?RUdXY282WGd1Z01JMkhEaUswaUE3dXQyeStXaTdWai8raE56dU5pUmVWdXI2?=
 =?utf-8?B?MWFwY0s1QmcyVXhkdTFqQlFlSnpacGxjOEM1MGcyWFFaRzhhcHFQdlJQTE9U?=
 =?utf-8?B?OFdrSUJYR0QvaXV0WE5TVUdVdzNxNUNqM0s4MnJtdE9sblpIbzJxc21Db3o0?=
 =?utf-8?B?QlVDaGVzcm93b0pRTWtHWFM4NEFSWkI2a1VuRWdOV280NjZBWWp0TWhSVmRF?=
 =?utf-8?B?QmNONkpxenMzRE43VnN5aHNjaS9JeEhPL2RpbWNpbmxPVGpvMjVTWVB6djNv?=
 =?utf-8?B?cVd2L1VTdUVLMmZQd0RlaURtQlVLQXJHdmZYVDZDTlJHSXg0Ry94OTJYMlFw?=
 =?utf-8?B?U2RsWUMwajM1T3JFVU5CVWxvWUgxaWU5aHZDN0xSYjJGSWZYR0ZKNzY1VVBK?=
 =?utf-8?B?bThwZ0xuQUFadEhBaUZla1BkTlhmNE5tWkdGQVN2VlF3aFM4SHJtUXRiRzZZ?=
 =?utf-8?B?NzF1NGxCdTN3T1FnNXFMWGNMRUhFa1pqNHpmVFlqdnZseUJjU2x6YWFKOGdQ?=
 =?utf-8?B?WW9iUldVMWVxQWI2b2RZdU1wY05TaFlTbnJKMUl5THhZS1VuWmZFY1dIRkFU?=
 =?utf-8?B?V1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 55186bf2-4c5d-43aa-2894-08de2b8634dd
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8283.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2025 18:20:54.7790
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 77K286k/QjqP8HFi7XphL4Ka6u11nJjXXb6QmKavhJ5fQ5O/ePUX0H6ujf1R7c/RThVUNqDhzx3fCp71lzmob86vSk+KIrkpD5G3rQ/hNDc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6980
X-OriginatorOrg: intel.com

On 2025-11-24 3:31 PM, Andy Shevchenko wrote:
> On Fri, Nov 21, 2025 at 12:43:26PM +0100, Cezary Rojewski wrote:
>> Verify if the entire block is found within DRAM, not just the start of
>> it.
> 
> I would rewrap this to have less distant lengths.
> 
> E.g.,
> 
> Verify if the entire block is found within DRAM, not just
> the start of it.
> 

Sure, will do. Typically I just do 72-chars per line and whatever 
happens, happens.

>> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
> 
> ...
> 
>> static int catpt_restore_memdumps(struct catpt_dev *cdev, struct dma_chan *chan)
> 
>>   		off = catpt_to_host_offset(info->offset);
>> -		if (off < cdev->dram.start || off > cdev->dram.end)
>> +		if (off < cdev->dram.start || off + info->size >= cdev->dram.end)
>>   			continue;
> 
> Hmm... I would rather do something like
> 
> 		struct resource r;
> 		...
> 		resource_set_range(catpt_to_host_offset(info->offset), info->size);
> 		if (!resource_contains())
> 			continue;
> 
>>   		dev_dbg(cdev->dev, "restoring memdump: off 0x%08x size %d\n",
> 
> OTOH it seems more invasive change for kinda a fix.

Looks elegant though. My idea was to avoid additional operations (which 
resource_contains() does), perhaps unnecessarily as readability suffered 
because of that. Ack.

> 
> ...
> 
>> static int catpt_restore_fwimage(struct catpt_dev *cdev,
> 
>>   		off = catpt_to_host_offset(info->offset);
>> -		if (off < cdev->dram.start || off > cdev->dram.end)
>> -			continue;
>> -
>>   		r2.start = off;
>>   		r2.end = r2.start + info->size - 1;
>>   
>> +		if (r2.start < cdev->dram.start || r2.end > cdev->dram.end)
>> +			continue;
> 
> See above, but here we already good for use the respective resource_*() API.
> 
>>   		if (!resource_intersection(&r2, &r1, &common))
>>   			continue;
> 
