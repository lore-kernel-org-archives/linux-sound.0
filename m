Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51DB4238C0D
	for <linux-sound@vger.kernel.org>; Mon, 14 Jul 2025 08:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752483510; cv=fail; b=oMFoMmTHXSsKB9/zMA5QHb+nHUJNoCqvfbWOvXokVewpPOelegIuD7SAN9ghHPqnLfJWn0DY3ZA5YVMSzdRc3alYDmb1mtbU4uxJy3T9nNTBMYLFqEOxNMVJ10HgzeozVket7ywBnVYzDwbJOdbxTQrmLyNv+C7dpHHnda+H5kM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752483510; c=relaxed/simple;
	bh=hC2AgYZkT5pmQGcKMGksUIrFeew00EL9eArEi/q71WU=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=auJ5bDyFXfELsJJZM2DJ9rwaZwBih+zSBifgRFFel2YUb6r9J9sOUdtoVk6xDGnFGgZxx0LuXeb41Bl9IhUmUpZG7yXEZjU8yPWuiuHnqokJt0ZzArOX4hfiuij+VjtqjF4CBuNgQLEE+bvkQU/bWnIsgE/k1NUYWIcxuCgbQd8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PTVFqaXB; arc=fail smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PTVFqaXB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752483508; x=1784019508;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=hC2AgYZkT5pmQGcKMGksUIrFeew00EL9eArEi/q71WU=;
  b=PTVFqaXBJI0ovuqGQYlrTJq3bTSC+dJ63/WlObdMdz5rD4D6enlPI1hM
   jHTH4X8b+PW2Pn60xOgLy70w1sU5SmzNz6cYbaBIfS+cl6CKvw2A3czRy
   tTcQpPpHxy6tgI4oQAFYppNt4l+s9lWuUqm7WwnTCsn8TYH5bP35PV5ht
   s3gtSlXX5WDPCga2DEpda16Q5xB5FEzoOHoK4CpjeGsu+iGy81Xtw9izW
   WPXhbuAur2dpiKKO6HXnfVDRCK7Cj7dQwFcVob5U3OrojVc0WyD5natmp
   Tx7sK0JMrVSeeTsFxCGusW7jxZSA0K1lkfapEIlRTQiWrkTZGHVT4GC20
   A==;
X-CSE-ConnectionGUID: kQ87uBYtS4WbL4ZQeK4K6w==
X-CSE-MsgGUID: SpVzue1bS5WMVoj9n1+lQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="58437091"
X-IronPort-AV: E=Sophos;i="6.16,310,1744095600"; 
   d="scan'208";a="58437091"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2025 01:58:28 -0700
X-CSE-ConnectionGUID: aieY1p9TSp+djBjt3cdILg==
X-CSE-MsgGUID: 5aKLHsRmRNe3BFiGSiXTBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,310,1744095600"; 
   d="scan'208";a="156299564"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2025 01:58:27 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 14 Jul 2025 01:58:27 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 14 Jul 2025 01:58:27 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.69)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 14 Jul 2025 01:58:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AECIzd5HkzNE8wCN52shDPSPyHBz9S2shpoC98ytZo9xO7/Mi5NELRjwrK5l1aKOWW4oZ7yJzaHEhH2LM2ungLFa96ZdwV7wBTPANFz/L1ZS/vbn7PqQGuN7fUXJLmGnvWQhXtyKlpQZqqTpBLJKP10NIxq2c1ycGPKKEgrHCcAlJJGerVJcqm48BiKYqak25BZJicy9mwnS68ZF/v09hbZaHvcRvU/HuDeOgBalS9OVMbHqV6yaQZn3hQFl7t2lqrEFXCa0KUpEgO3L49EnGyml46eRZlpqRQnouXateUIYVPXoYkur3MVXmTowdHzfh1ui3vGYwWb0kPpfpRnJBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1BGO+Cq+JMeT143bfLZ3dtuXr399Zb/d/NdqK1LS4/c=;
 b=uK7nMDVwSe4PgAElPh0PkvHyUHgvjL6riUahehDn3fY+wZd4sL/MktfUy+4qdzYfqCjZvbWRpBDL2kmCghdRVYXP/D2QSSKK7JQycmkTg4Cg7TxeI9McK3lfMU/UEpWnG4JQQszi23Bu2dT6Sb2DkoApuVWCWQCQCxChItQlt8Kw/Oj05kOn29w2DNaviYunWabui07bav9o2OTy6lA0gJYeywNj5ckT20pM7FRZV1Q/9SGOzMAeiziR/ek0oYA5z2G2tJ+SFISvfI03eiASxqRdLLauGx/G3qfoBbct3hxhEQkzskDqUmsjS3NYhe8absX1rWJ68Qf0tixQdpWR3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8283.namprd11.prod.outlook.com (2603:10b6:806:26c::16)
 by PH8PR11MB7023.namprd11.prod.outlook.com (2603:10b6:510:221::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.28; Mon, 14 Jul
 2025 08:58:05 +0000
Received: from SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::3:e0a:87af:d4b6]) by SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::3:e0a:87af:d4b6%6]) with mapi id 15.20.8835.027; Mon, 14 Jul 2025
 08:58:04 +0000
Message-ID: <b6ecdfd3-f5c0-4ca1-b38d-e16dc5ca2855@intel.com>
Date: Mon, 14 Jul 2025 10:57:59 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/27] ALSA: hda: Move codec drivers into sound/hda/codecs
 directory
To: Takashi Iwai <tiwai@suse.de>, <linux-sound@vger.kernel.org>
CC: Richard Fitzgerald <rf@opensource.cirrus.com>, Kailang
	<kailang@realtek.com>, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	=?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
	<amadeuszx.slawinski@linux.intel.com>, <patches@opensource.cirrus.com>,
	Baojun Xu <baojun.xu@ti.com>, bo liu <bo.liu@senarytech.com>
References: <20250709160434.1859-1-tiwai@suse.de>
 <20250709160434.1859-7-tiwai@suse.de>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20250709160434.1859-7-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR02CA0055.eurprd02.prod.outlook.com
 (2603:10a6:802:14::26) To SN7PR11MB8283.namprd11.prod.outlook.com
 (2603:10b6:806:26c::16)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8283:EE_|PH8PR11MB7023:EE_
X-MS-Office365-Filtering-Correlation-Id: b7a16d7e-d1b0-4a56-26fe-08ddc2b48b82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K0NKeUxPd1RFUmlOa0V1WVdHTktmNkZzNTlyVVUzTXpqcmltOVlOb1dvYW9N?=
 =?utf-8?B?V241blVUT2xockx6amdOKzQ3TUsvd29DdUN2YThzWFg3Q3AvRzFpN3A5REpR?=
 =?utf-8?B?K0hiVjhocE83Tms5UVNIUDZTdU1aeFNzUDQxY2Qwc3lyNkZUeHgrRktEUXJz?=
 =?utf-8?B?c2tvNGcyM2dxdUxuS3hlZnlnTEthdFhNZm5tc2NsWkQyb2QxMVdSTnJQa2tH?=
 =?utf-8?B?TUdTWEpYNG5QcEgrbWN0NXJ1R2FBWlRwNml0RkFsQUkveHJUNm5YV2tNdi9a?=
 =?utf-8?B?eGVITFh1SWZ3Sytjb2QrZU1YcW40QkF4bERxWlJtaGgwYS92dG5CN3lNTjI4?=
 =?utf-8?B?eHVISjZXeFQ1cDhGODVzcnZmZFAyclhwamMvSW1IalBpSGxHWHZIVUgzK2Rx?=
 =?utf-8?B?VGpmcklTaE9LeEQrbFd6cnpNRVdTdENzc3dxZW01eWRZcU94eVVoQ2xPTmhV?=
 =?utf-8?B?STZHc1Q3MFNaRjBnNU9rUThUSyt1MjZBeDFaRjZ1RXo0cGlYb1p2K25jWDJu?=
 =?utf-8?B?Qlg5UEp6WTY0SnVqUk5LZHRsSUZhSUhHQUpwMC9KNmw0QzdrVkdVTkF3dUpO?=
 =?utf-8?B?ZEhUMDlyUHFXUXBhelRqWDh6TytURXlCbzF2SnhFNzFBeXVqcVhVeGpBdXRS?=
 =?utf-8?B?OFczRDl1UEVXMlJHZ0xJendpMXp3TCtBTW5KYmZQa2NyZmxKalNnWnFVMFNN?=
 =?utf-8?B?ZGN3QXhRUjJ1Z1AveElOR1Q3MkxYU0d3YXVZRENqZ1g3dHJQWGRkT004YkV5?=
 =?utf-8?B?RllNVVQwN1JuWndwNittdkRVMHlubFV3MWpOUnlRNjFub3NNNDRRcWtTZ2Zx?=
 =?utf-8?B?Q1JEdFMvSjRxMDNnQ0tsaHErMnNCU2ZGaDcrdXNUWlkzeDFYam5hdDhxMk14?=
 =?utf-8?B?aU0zNEQvMlRacUtIQUVTT1JRbitLREx4OWpqVjB3YzA0VTIvUVNVZS96OVEr?=
 =?utf-8?B?S2ZCNWFscGV3SVVidWhYRTBuaFY5RUxZU21ZRnBIY3d5TzhHTzV2SmxKYm1O?=
 =?utf-8?B?blV3R2VEMmhlZUFCbmgwK0hKZ1UrUng1Si9DR2h2WmdrcFRadmRUTUVQeWlo?=
 =?utf-8?B?c05XY3JlOE9paFc0RHNKNXRsNFBncE5lYnJyMzNXMDhRczQwQmxBYWlldElL?=
 =?utf-8?B?T1BWYlNMUDQ1cEpNV0c2N011Y3lPckdIQUthcFZ4eEZTbHRJWjFyQ2RQZDlD?=
 =?utf-8?B?Zm8vVW45YWl2RU5MenhnYS9FT0JSeUZyemd6SzV5TnU5b2FkWldJME05QS95?=
 =?utf-8?B?SG5IZ1ZvKzFrU1A3UWVneTZPVWg1WHgzL0t0MVVTRHo1WUtTakprbytMTFpI?=
 =?utf-8?B?dWxoTGlnTElFY2lQOGdnS1VuUFluSlQ0a3JiVGFjWVpZNitvYzVCbllsdXVo?=
 =?utf-8?B?ajdmSldnblQvQm1WbEFwbUVVbDZHUkJxME1yZnViMzVoV255cHZKMjlpZ3Y1?=
 =?utf-8?B?U0p1cjBpcUpISVBSQXQwSks3T29sSkJRWnRWSVhwUGlxQnA0NFRmRWp3czRs?=
 =?utf-8?B?ZEwwUzJ6REFmd2tNK2RQbE8vUVdlTENlMlVHMy9tcHZKSXVheGcxaHdsaGtE?=
 =?utf-8?B?dHhOWXZOblJ0ay8vY0puYnBwSkJVdHcwcjZ3WWd2cy9ka1lqZ1FnU3UwbVJj?=
 =?utf-8?B?NUNVSy9UZU1pRGltYTdqTnBEdEUrU3lzRDU1NG5LVm45Y1RaVzFaN09Hd2Zh?=
 =?utf-8?B?T1h2Qm5LYkV3VjQ4eHJFSGVtRkJndXFtRW9qSTRuNG9NUytIdjcyajdVQlFM?=
 =?utf-8?B?Tk83Y3FISWtnVzk4am9zSEl6YUUveWlPbUtCdnlGWEtnMWU0OHFuV29TUm92?=
 =?utf-8?B?WGU2RjZET1JWbDJXSk52cnN5M0VsUGRTTEYvNE5pOUYrMDRUamRjUzNoYzVK?=
 =?utf-8?B?eHJNM0g5UWNMV1JxWkFsRFdYTFZ6QnZabVNKM3hQWlBlNlVLK3FqVWRPVGRC?=
 =?utf-8?Q?LoOQo4etsQM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB8283.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Unk1VnI5aTd1Wk1BZm9YOTVQczZmWStyU0FIVkVISi9SaWhDcDNhU3l0RDh1?=
 =?utf-8?B?Qk50cE40TUtkUEpJdS81YTdpSEJJcFJTOWlLVlN4MlMremxnV1FpU2ZMdzJ4?=
 =?utf-8?B?bVhMeHdwOU5WTWdIaW5xQlN6cGwrVUtqQUVWRGpiWjJKUXk5czF6MGVsY0VL?=
 =?utf-8?B?NVlYUWtUZ2s3QWZtTGFneXVtSzlWWnAwc3ZKcU9FVmFHTWwybXRVV3Y1ZmFr?=
 =?utf-8?B?MWUveXcvTHZrVEJ0SDFFdmIzNitKOGRZSWVJeDVBSzllS0lJN0tBUzlVQUxJ?=
 =?utf-8?B?aitrMnk0WWZabUpOK25id2EvZkZaQ3JvSngxSjJkNUcyaHF1NGd2eFFpZGwz?=
 =?utf-8?B?dGNycFRQNmM0L1crbkNTdHVwdWVBZnl4eUVFU0dGeWNuYTVaY2o4TFVEQ3pm?=
 =?utf-8?B?S0QveGtRNlZTZ0VSd0haWDRXelNxbWR1SmlORWxQb2Y2OERvSDNvTjBJd2Nn?=
 =?utf-8?B?d0YxUVVLMS9yVWltLzR2SEczNkNqcnFkdXRURk9CdElTbHNXMk9TKy9BejVJ?=
 =?utf-8?B?NlJkL3A0bmp4UnlQY3A1Tis2NGdzTGFyTmNaeU5KbHFZRzlDRk5ZYnZCT1h1?=
 =?utf-8?B?YUFXRm5PUVl1NlluZnErUmdhVXkrTnRnUjNiekthNFR1d3RTVnpNYjRueFlW?=
 =?utf-8?B?V0twdkthaXVlVlJBYzdIMHFLMXdrQ3laRG9EWEM1dDVQVmFQbHZIdGpteWR4?=
 =?utf-8?B?bkFNQnVtQXJlcWNlRTZ0ZEh0NE9kUjdoTXlOZisxbkFCZWh4SHNkSFp6RWor?=
 =?utf-8?B?T1M0NXBpdy9VMlc5M3R3NGF6NVFVWEpoa2o5NU9DRkFkU0N3VU1Qa2RKL25j?=
 =?utf-8?B?b1RPdldRKzA1ZnFZNTZ3ZU5yQ2U3WkxDZTRFU0I3Y3ZDTTJWMzNWdUVrclhU?=
 =?utf-8?B?di9YdkU4MnZDYzdMSE9xYUZ1eHJCdksxYlVVVGhYQ29MSWtjbHVja01ENlNz?=
 =?utf-8?B?Mk5OYmxtS3RURkVJaVBqUnFFcjR1OHdEa3JQb1RHV254NnBvTEJCdTZ3ZTJ4?=
 =?utf-8?B?aHlJZDNSTEdKRytmamhncmJkbnYyam1Fb25ZRDNrL1NLdTR0cGRzSUkwQkhr?=
 =?utf-8?B?OFFjQ1A5VElSMlpRV3o4YXVUM1phOW9RckdQejMrYnpwYUZHK0JqZy9kQi9u?=
 =?utf-8?B?Mmh4aStIVDcyaTkrNVZoSFJ2emE4c3h1QnFLNHVLT292ejROK2F2ZjRoemZr?=
 =?utf-8?B?aHhqY0FyekprSlR5c0M4QnRVSyt1VkE2NGFGSE9Sb3lMWlJydytXd3drRzlO?=
 =?utf-8?B?RGxSZnI0ZVFKQkVIMHBtVnJtd1hNY2MyVDRHQzFxZElXcEVYSlBWUStoN2Rx?=
 =?utf-8?B?L3EwK1g2MGpMc1d1VWhObjdoNlV0S1llZk9kR0F1THlLcUtTUFNjOGtuaDFO?=
 =?utf-8?B?RjM4eU9mdG8zUFZKQnY4UjM3aUZNZWxTdUxjdyt0NEkwTmZTZFBiUk1nK3lw?=
 =?utf-8?B?dHZmeTJVODFpdUJGdlZLa2JOQUhFZ2w1RUF5VmZ6aUMrSVNDekRLRlR5ZTFP?=
 =?utf-8?B?ellaMWJUUjI4eEFZT3BUMWg0ZkgxT0o2eXovVW5uYTFEL3BIaVdqKytRMHps?=
 =?utf-8?B?N3g5K2h5YjBoTE5neFJjS2h2cWM1d20vSE9LNENzWURuVm1FRUF0alJrekNm?=
 =?utf-8?B?eisyZEUrVmRZM3FtTUZIMEtuTjlOZlE0UmU4a2poVFE1cTl2M01XUDc1elRn?=
 =?utf-8?B?WlBaR05LMlBjVHNhRjRsazBWSkt6RXNuWlNPc0VyUXExKzZFcGsralNNM2VJ?=
 =?utf-8?B?RzZ2c0lDZGNLWGNIWkZhdEgvMHp6UFVDRTBFUTVGY1hjK1REN2xjOE5QMnlF?=
 =?utf-8?B?VW1BN2syalMwd2tvMmx2L21SUGF4M21GZkZaQmhQU3BSVEZydEkvWG1kQzE3?=
 =?utf-8?B?M1dsSmx3emYyNDdWZ21SVGVPYUNZRm5Ud1czUEVkdVJ5TnNSQ3l0NHo2amE3?=
 =?utf-8?B?NmtSSlpRWloycUhEcmJ6Mi9LVTdDRVJPZkZZR0cyM2h4U3YyY0VDYXM0Y3hx?=
 =?utf-8?B?cnNKTUttL3FQT3UrWnUzblJybXRqYVc2OGIweDRHc3RVWjczTmJzMWhQeTFt?=
 =?utf-8?B?OVZyYU93Z0MxY24xV09EN280RVhIVWZuOHFHT21GZ0VtTWIvTGIvUTZIM05P?=
 =?utf-8?B?aU41S01wSWgzOTYyUlZCTDBLNnhWRlVJVFpvNjRETkZBajlVOURkbUVPeXZL?=
 =?utf-8?B?ZWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b7a16d7e-d1b0-4a56-26fe-08ddc2b48b82
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8283.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2025 08:58:04.7979
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0Xw8MqDlo1rvfpcIPqI7wQWUXxvotEaEhzmbR/2Yn6qWnssYxFiLoiMxIhPeCtc0CP1iHE2+ycByt4XePBXEOWGarN260f218+3pE+LOEOU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7023
X-OriginatorOrg: intel.com

On 2025-07-09 6:04 PM, Takashi Iwai wrote:
> Now move the all remaining codec drivers from sound/pci/hda to
> sound/hda/codecs subdirectory.  Some drivers are put under the further
> vendor subdirectory, and the vendor helper code (*_helper.c) are put
> under helpers subdirectory.  Also the sub-codec drivers are moved under
> a different subdirectory, sound/hda/codecs/sub-codecs, for
> distinguishing from the main HD-audio codec drivers.
> 
> The prefix patch_ and hda_ as well as the suffix _helper are dropped
> from file names as they are mostly superfluous.
> 
> No functional changes but just file path shuffling.
> 

Path: codecs/side-codecs/ looks wierd. My suggestion is to avoid the 
repeat and stay with codecs/side/.

In regard to 'helpers', I believe some of these .c files could be 
converted to headers and lie in sound/hda/quirks/ directory. These are 
more of a platform-level files, not sound/hda/codecs/ per-se.

> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>   sound/hda/Kconfig                             |   1 +
>   sound/hda/Makefile                            |   1 +
>   sound/{pci/hda => hda/codecs}/Kconfig         | 158 +-----------------
>   sound/hda/codecs/Makefile                     |  31 ++++
>   .../patch_analog.c => hda/codecs/analog.c}    |   2 +-
>   .../patch_ca0110.c => hda/codecs/ca0110.c}    |   2 +-
>   .../patch_ca0132.c => hda/codecs/ca0132.c}    |   2 +-
>   sound/{pci/hda => hda/codecs}/ca0132_regs.h   |   0
>   sound/hda/codecs/cirrus/Kconfig               |  21 +++
>   sound/hda/codecs/cirrus/Makefile              |   8 +
>   .../codecs/cirrus/cirrus.c}                   |   2 +-
>   .../codecs/cirrus/cs8409-tables.c}            |   4 +-
>   .../codecs/cirrus/cs8409.c}                   |   2 +-
>   .../codecs/cirrus/cs8409.h}                   |   2 +-
>   .../patch_cmedia.c => hda/codecs/cmedia.c}    |   2 +-
>   .../codecs/conexant.c}                        |   6 +-
>   .../hda_generic.c => hda/codecs/generic.c}    |   2 +-
>   .../hda_generic.h => hda/codecs/generic.h}    |   0
>   sound/hda/codecs/hdmi/Makefile                |   6 +
>   .../hda/hda_eld.c => hda/codecs/hdmi/eld.c}   |   0
>   .../patch_hdmi.c => hda/codecs/hdmi/hdmi.c}   |   2 +-
>   .../codecs/helpers/hp_x360.c}                 |   0
>   .../codecs/helpers/ideapad_hotkey_led.c}      |   0
>   .../codecs/helpers/ideapad_s740.c}            |   0
>   .../codecs/helpers/thinkpad.c}                |   0
>   .../patch_realtek.c => hda/codecs/realtek.c}  |  12 +-
>   .../codecs/senarytech.c}                      |   4 +-
>   .../patch_si3054.c => hda/codecs/si3054.c}    |   0
>   sound/hda/codecs/side-codecs/Kconfig          | 128 ++++++++++++++
>   sound/hda/codecs/side-codecs/Makefile         |  28 ++++
>   .../codecs/side-codecs}/cirrus_scodec.c       |   0
>   .../codecs/side-codecs}/cirrus_scodec.h       |   0
>   .../codecs/side-codecs}/cirrus_scodec_test.c  |   0
>   .../codecs/side-codecs}/cs35l41_hda.c         |   2 +-
>   .../codecs/side-codecs}/cs35l41_hda.h         |   0
>   .../codecs/side-codecs}/cs35l41_hda_i2c.c     |   0
>   .../side-codecs}/cs35l41_hda_property.c       |   0
>   .../side-codecs}/cs35l41_hda_property.h       |   0
>   .../codecs/side-codecs}/cs35l41_hda_spi.c     |   0
>   .../codecs/side-codecs}/cs35l56_hda.c         |   2 +-
>   .../codecs/side-codecs}/cs35l56_hda.h         |   0
>   .../codecs/side-codecs}/cs35l56_hda_i2c.c     |   0
>   .../codecs/side-codecs}/cs35l56_hda_spi.c     |   0
>   .../codecs/side-codecs}/hda_component.c       |   0
>   .../codecs/side-codecs}/hda_component.h       |   0
>   .../codecs/side-codecs}/tas2781_hda.c         |   0
>   .../codecs/side-codecs}/tas2781_hda.h         |   0
>   .../codecs/side-codecs}/tas2781_hda_i2c.c     |   2 +-
>   .../codecs/side-codecs}/tas2781_hda_spi.c     |   2 +-
>   .../codecs/sigmatel.c}                        |   4 +-
>   .../{pci/hda/patch_via.c => hda/codecs/via.c} |   2 +-
>   sound/pci/Kconfig                             |   2 -
>   sound/pci/Makefile                            |   1 -
>   sound/pci/hda/Makefile                        |  61 -------
>   54 files changed, 257 insertions(+), 247 deletions(-)
>   rename sound/{pci/hda => hda/codecs}/Kconfig (55%)
>   create mode 100644 sound/hda/codecs/Makefile
>   rename sound/{pci/hda/patch_analog.c => hda/codecs/analog.c} (99%)
>   rename sound/{pci/hda/patch_ca0110.c => hda/codecs/ca0110.c} (98%)
>   rename sound/{pci/hda/patch_ca0132.c => hda/codecs/ca0132.c} (99%)
>   rename sound/{pci/hda => hda/codecs}/ca0132_regs.h (100%)
>   create mode 100644 sound/hda/codecs/cirrus/Kconfig
>   create mode 100644 sound/hda/codecs/cirrus/Makefile
>   rename sound/{pci/hda/patch_cirrus.c => hda/codecs/cirrus/cirrus.c} (99%)
>   rename sound/{pci/hda/patch_cs8409-tables.c => hda/codecs/cirrus/cs8409-tables.c} (99%)
>   rename sound/{pci/hda/patch_cs8409.c => hda/codecs/cirrus/cs8409.c} (99%)
>   rename sound/{pci/hda/patch_cs8409.h => hda/codecs/cirrus/cs8409.h} (99%)
>   rename sound/{pci/hda/patch_cmedia.c => hda/codecs/cmedia.c} (99%)
>   rename sound/{pci/hda/patch_conexant.c => hda/codecs/conexant.c} (99%)
>   rename sound/{pci/hda/hda_generic.c => hda/codecs/generic.c} (99%)
>   rename sound/{pci/hda/hda_generic.h => hda/codecs/generic.h} (100%)
>   create mode 100644 sound/hda/codecs/hdmi/Makefile
>   rename sound/{pci/hda/hda_eld.c => hda/codecs/hdmi/eld.c} (100%)
>   rename sound/{pci/hda/patch_hdmi.c => hda/codecs/hdmi/hdmi.c} (99%)
>   rename sound/{pci/hda/hp_x360_helper.c => hda/codecs/helpers/hp_x360.c} (100%)
>   rename sound/{pci/hda/ideapad_hotkey_led_helper.c => hda/codecs/helpers/ideapad_hotkey_led.c} (100%)
>   rename sound/{pci/hda/ideapad_s740_helper.c => hda/codecs/helpers/ideapad_s740.c} (100%)
>   rename sound/{pci/hda/thinkpad_helper.c => hda/codecs/helpers/thinkpad.c} (100%)
>   rename sound/{pci/hda/patch_realtek.c => hda/codecs/realtek.c} (99%)
>   rename sound/{pci/hda/patch_senarytech.c => hda/codecs/senarytech.c} (98%)
>   rename sound/{pci/hda/patch_si3054.c => hda/codecs/si3054.c} (100%)
>   create mode 100644 sound/hda/codecs/side-codecs/Kconfig
>   create mode 100644 sound/hda/codecs/side-codecs/Makefile
>   rename sound/{pci/hda => hda/codecs/side-codecs}/cirrus_scodec.c (100%)
>   rename sound/{pci/hda => hda/codecs/side-codecs}/cirrus_scodec.h (100%)
>   rename sound/{pci/hda => hda/codecs/side-codecs}/cirrus_scodec_test.c (100%)
>   rename sound/{pci/hda => hda/codecs/side-codecs}/cs35l41_hda.c (99%)
>   rename sound/{pci/hda => hda/codecs/side-codecs}/cs35l41_hda.h (100%)
>   rename sound/{pci/hda => hda/codecs/side-codecs}/cs35l41_hda_i2c.c (100%)
>   rename sound/{pci/hda => hda/codecs/side-codecs}/cs35l41_hda_property.c (100%)
>   rename sound/{pci/hda => hda/codecs/side-codecs}/cs35l41_hda_property.h (100%)
>   rename sound/{pci/hda => hda/codecs/side-codecs}/cs35l41_hda_spi.c (100%)
>   rename sound/{pci/hda => hda/codecs/side-codecs}/cs35l56_hda.c (99%)
>   rename sound/{pci/hda => hda/codecs/side-codecs}/cs35l56_hda.h (100%)
>   rename sound/{pci/hda => hda/codecs/side-codecs}/cs35l56_hda_i2c.c (100%)
>   rename sound/{pci/hda => hda/codecs/side-codecs}/cs35l56_hda_spi.c (100%)
>   rename sound/{pci/hda => hda/codecs/side-codecs}/hda_component.c (100%)
>   rename sound/{pci/hda => hda/codecs/side-codecs}/hda_component.h (100%)
>   rename sound/{pci/hda => hda/codecs/side-codecs}/tas2781_hda.c (100%)
>   rename sound/{pci/hda => hda/codecs/side-codecs}/tas2781_hda.h (100%)
>   rename sound/{pci/hda => hda/codecs/side-codecs}/tas2781_hda_i2c.c (99%)
>   rename sound/{pci/hda => hda/codecs/side-codecs}/tas2781_hda_spi.c (99%)
>   rename sound/{pci/hda/patch_sigmatel.c => hda/codecs/sigmatel.c} (99%)
>   rename sound/{pci/hda/patch_via.c => hda/codecs/via.c} (99%)
>   delete mode 100644 sound/pci/hda/Makefile
