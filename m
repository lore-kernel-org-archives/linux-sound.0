Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15DD41FECBA
	for <linux-sound@vger.kernel.org>; Thu, 20 Feb 2025 15:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740066176; cv=fail; b=mdYwCWnT7rl93RnHXEuGFWm7qQPcQgESpf+qfaxtN6C80kA8ZSQMCKLrKJUB3UMR0MWZM0xqO05+h/QkNUiV3pAn0YetsqDCP4FlBXyx5/Ed9pClXe39/mVQL4ikNcZkVEVuv1xYxqnqGfeb2UA3N+lCTwkZlItgxwuTpjkdRQo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740066176; c=relaxed/simple;
	bh=FK4Qu6MJy4KMZezYWHn7tLEiwICuvGh5yNgqbg3v8F0=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=lYbyK26OLZhfMssh70nSezjcGixRMlcklku0qrWIxvA7qeH1EpplTSA1OGpUL6Yt0iEnkj3D1J58vDJVIe0PbSjS3Ky9vy+1TyQRxVikZp/MIE0tR/1U28Xzq7yFWV8wkoCkoJ96cvJQqdh4dfVjrLpR+8fB6I7Fbp08xeOhY9M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I7HreAux; arc=fail smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I7HreAux"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740066175; x=1771602175;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=FK4Qu6MJy4KMZezYWHn7tLEiwICuvGh5yNgqbg3v8F0=;
  b=I7HreAuxgh30kwv4Ac4b5s2ZGXhomiJxvqrCGrlH9yw+RHFZ2gJNslxy
   UCgLbBwkTKLFhtTilO4+3nOxn1pDcX+cflF9H7BFwkUvOmMtNHqcfBzfx
   1da1RG/LNs0T2im+9lfQI5uhnp9RkXJpF/wYjqovbEShrJ9LJ7Pv7lwWY
   fLArlPUNUcq7j7xHXh+2ebvZB2Ef3yO7RqNsHE9z+lfRFdQP6pUSVZrMR
   im5OIpiEhRuQRX3p0E79Ipm8Le/UWB0/MB6sZEocAi/Ob/tvsbIO/lnxw
   xU3yRYwbGWiNWTK+24PQZYhw1MrwV2SxCX4YM7U4m8PxaRxjmyKd5c8Q+
   w==;
X-CSE-ConnectionGUID: QPc6Wr3xSk+WdkaYsNEkNg==
X-CSE-MsgGUID: ki54K+q5QNG1FS6T1FTtrA==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="51469871"
X-IronPort-AV: E=Sophos;i="6.13,302,1732608000"; 
   d="scan'208";a="51469871"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 07:42:54 -0800
X-CSE-ConnectionGUID: 3FvQLsgISvKNj3ApHtIABw==
X-CSE-MsgGUID: 79XsmCc+TZG3vGhS7YNxXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="152262925"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 20 Feb 2025 07:42:54 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 20 Feb 2025 07:42:53 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 20 Feb 2025 07:42:53 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 20 Feb 2025 07:42:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fqwDi4L54U02L5CpnLGFqwirVI+BdmT8CBo6EknFqSiGMt2NgZSj2gw3hRvc1WskvIUm9+9lg8paNTX2bJ9/uEZl09Lu53mHalwjlK1eryX1F7RKMqlaqRSCy7xH3a4UVTDmWNqTfQLQlC+qT2eE+N59N/3gUtR4VUZXI74IAt7RKIjhyBhgAFqDx2eXP0IUX5ZUgDRqPfTjQnVL/gmv9kX3CrWJcQpHzMtVt5/DObnMiEeU+KyO0UycOMZxkabRWa6abwlvH3ET6nu0Y9Nvtmh70phCvJ9dLzZQH5FDzdlBf1l6MTLTCPCL3/XnUgBtme9To68tKwj2p7BnPlvEmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CZlFAmiQo9Lct2QibfWH5XeGh5VyDx/MPPBWNBY0So4=;
 b=p7YGCSethJ4sRuS1U8tSebM7xpJXC5T6hrmHPPvegtd9oZ9BikJ8PDvMaTS9dNJZOUI8qorDMbrakAJFmLxnRVlNYWWWyx8MI7HcMdcLGdy9MHJT5OwxjSF9kvjQcnd2pIXai/0TZeEYiK5F2MfrQ0thLFKpSUF0fLr+jK7Kvdel04SFMwG1mAZ0835f64O8dTVxKT576e3yC6JRMmsbyjEW3MV1Dz3+uih8I5h68cuGpRv/+tPLVE2wXZKutCjN76BcgFzUSf2kwpXUDaFnZfj6N1I9oFvy/WnEKHG/EmZcrrZQU47JXKYSPzjNzyezNy/RylpKBuk6sFZcj8vxcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 SA1PR11MB6783.namprd11.prod.outlook.com (2603:10b6:806:25f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.21; Thu, 20 Feb
 2025 15:42:28 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cd01:59f6:b0f8:c832]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cd01:59f6:b0f8:c832%4]) with mapi id 15.20.8466.013; Thu, 20 Feb 2025
 15:42:28 +0000
Message-ID: <e605b550-fa8a-43a8-920f-f2ea2a17a110@intel.com>
Date: Thu, 20 Feb 2025 16:42:22 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/24] ASoC: codecs: rt5660: Fix definition of device_id
 tables
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: <broonie@kernel.org>, <tiwai@suse.com>, <perex@perex.cz>,
	<amadeuszx.slawinski@linux.intel.com>, <linux-sound@vger.kernel.org>,
	<oder_chiou@realtek.com>, <flove@realtek.com>
References: <20250220112643.3813295-1-cezary.rojewski@intel.com>
 <20250220112643.3813295-15-cezary.rojewski@intel.com>
 <Z7c4j74gUjtbvgo8@smile.fi.intel.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <Z7c4j74gUjtbvgo8@smile.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR02CA0075.eurprd02.prod.outlook.com
 (2603:10a6:802:14::46) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|SA1PR11MB6783:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f214a69-ee89-4243-f3e8-08dd51c52e30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bzhKVWJDZXJrN2tTTnk5QldqZnhwNFVyMldXWVNTbzNPWlM1aUllS1hFeFZu?=
 =?utf-8?B?UnR6UFdYRzMwdEREazNNQkc0OWIxY1dWbUdKdllRd0hnM2dhYXd4TjhXSm9I?=
 =?utf-8?B?ZHJtb1NkdEt0QzVzNUQwQWlHTlN0V0ZGUEdQL0hvb3F2MThSUFFwR0pGRTRx?=
 =?utf-8?B?SWVxUE1KYVVxcDdZbzlkdWcwN2NHN2QxVW5NQVNHNmFLQVpBb0tud1o5c25I?=
 =?utf-8?B?YkRZS1F0TE5UZzBYdCtDWGlDRDl2YmJFdVF6bTF5QllGaTgzaElMNjljYnlU?=
 =?utf-8?B?cGFzTWlhNDNucDlsT3hHcVQ2MHBLSzhoTDZuejNDdTkyY1N0UWpLMG5RYktt?=
 =?utf-8?B?dm1XVE1yOGNrdzgrYitxN2ZiREtaRVBkS2xzSEZCT2JicEpJK1F2SDJHcldQ?=
 =?utf-8?B?d2YxZFo0Q1FuQk1QcXl0ZlkxUXlwVDRjRkl4VHlKdU1BUGxWRUF3WXNLbXVR?=
 =?utf-8?B?cU43dE5HNkRVdzRGRGRrdzlkU1JlOGlNODlmdjVrdkg1VzVkOVh1dFVxa2dm?=
 =?utf-8?B?Uzh4d0FqMndkaGdxRkFqUEtSc01yOFNKKzVheS8vcVNRQlVaUmsrVnRDVVpt?=
 =?utf-8?B?TmJPTk55T2F1aVM0b21Dc0x5aVFXN2VjQitCMDlMaHBJU0V1M2hyazAwQTFl?=
 =?utf-8?B?UFZBV2RGYUwzY2JaS215ejRhY2x5azlIMXNOMDJua2UrWFBkZ3F6RW0wYjhy?=
 =?utf-8?B?TW9Dc3VDRi91YmlkSjFMOWE5Yyt2QWRmZUNVOXdyKzArZ2ZDdHBqMnREbWxS?=
 =?utf-8?B?di9pNjYrcnhqdGhNL0txdFB4ZkhtNzRPMGhSdEJnNDdxV005RTRhWGp2NFN1?=
 =?utf-8?B?UGE0cmtCR1k5aElGRTRJK1hpNmt0U3NKZmxsK2pUZUJZWlBXSWdScEg3T3Qw?=
 =?utf-8?B?MWkvQmJURVVGcGY4ZHY1d2NyOWM4V3I0anRmYi9wUHY3OE01L1JZenZNb0Zp?=
 =?utf-8?B?QktrV0ovZy9XL1dNRUVoQnRNSG9hdS9IRFd3WEIza05ZbjRSSE9mcmplamJO?=
 =?utf-8?B?V2UzREtMV24wRHBuNW9NclNLZHFQZTFEUlB4ZmxVQmVQMitBYnVkV3BwdlVj?=
 =?utf-8?B?Mk1odUY0c0NtNWk4aGYzZUZXTFY4UkJEcmY4SmxVcnBLY2V5TnBya0plcWZp?=
 =?utf-8?B?K05EL3U1YWJsakxZVnRDRy95K2RtY1BSTFFGSEVIdWgvNkJDcEwyYUVFdTZB?=
 =?utf-8?B?VC9xTTZXMXdqeXVseFkvRXJUdVBFTHFETUxOOUQvYmlXUHJhMit1dEZVRlNl?=
 =?utf-8?B?UmFIZCtXakc2RmhCaGRoNGcvcTRHMjJOQ1JzT0RPUGU4ZDBjRyt1N0FSWEEw?=
 =?utf-8?B?SmhxVXBhL1pnRVo4WmJxQjdJcG5yckZyK2FYUWlJd1JoSVNWdEtnNERuUFY3?=
 =?utf-8?B?Y3RORnhPczcxc0pZY0dqTVpkN3BCanJZbWdydU54U0t3YTVMa0pmRHhabzBo?=
 =?utf-8?B?bkVqN3ZUeEM3WHZKcXgxRytGdW1RSWNZYXp0QTJkUmNaM21BMVNwK3V2RmZp?=
 =?utf-8?B?bDJ3OXhBQ0xYU2tYM29OdCtLMWtyMzdkanJUS3RoWVNWTXJ1Wml4REhDQUY5?=
 =?utf-8?B?YUZOU3hSNjlmcnlhZE5iNHZDNDR2c1E0MDQzWFJkbkFRVklMR3pRSk9aVXky?=
 =?utf-8?B?NmVCdXpWL2YvclcxUGZGREVsWFFzcTRzRVhkV2VLWVFxQTZDSlZqQXFXTDNv?=
 =?utf-8?B?QW1SVWVMcDloMDNxcXBmWTA1QTdhcEdXZ0QrTEZ6aXlrT0djNU9HYkJvYVNz?=
 =?utf-8?B?c1hZOFJGRENyRXdPUTFiMDhNNVg0c3ZLSFpWeDdLRXFPQlFIZ1k4R3h4Ymlk?=
 =?utf-8?B?alRQakQrdDJ5eDR3ZG82Kzl4QVhKRVlCSWJwZkJBSGtxNk1yM1d5dnRuelY4?=
 =?utf-8?Q?aw37mLTb8S4eu?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6375.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V0ZpR1dTWjhNN09abWpsWDVOYlRGZ3YwWmxBZVg3R1lyUG9ZRmFGUldXMmVt?=
 =?utf-8?B?SnB1dGQ0ZzI0Qi9IL1J5aG1qcDFDZ2dhM0lab0NLMEtEVTRaUS9jV3E0VXl0?=
 =?utf-8?B?eWZpbjhDS0NpYUJmVkFnUXYxSFRsVGZOdVBleTVwTDc2RmdCM1p0aER6Y1Nn?=
 =?utf-8?B?eXc5b25neUpOZEpMUFVaT2hMamZybzNmMlJGWlZTbGF6aXdmeUVDcXRyb0pW?=
 =?utf-8?B?ZEVWajUyR0dQbGlDYk8ySDJUdlN2aVZxa1JQMno1UzNua2VvWFNBVU9vL002?=
 =?utf-8?B?T1RvU3M2REVzVXA2U2dlS29GNzk2dTRPYzNYQldPMStIUkVxMFhZRFQ5K1l4?=
 =?utf-8?B?TmVnM3ZZYTU3THJ2YncvYVR2bzZHVmk0SlYxbi9MSzJ6bldjc3htYnFZaGR4?=
 =?utf-8?B?TFRlbkF1QkhxY0pubVZCa29jTWduaUhrd3RMWjEwYk5aSkh3YWZBWXR6Wm5o?=
 =?utf-8?B?eHBPakxacjZLTWc3Tjd0bVBhZjdRc3FsdXlqVXpHWUVqYmZwNnpHRTU2bU92?=
 =?utf-8?B?Z3gyRW4zT0dTS2padUthanhrd2MwSlJUbE96YkpHN2ZWbVNzc1RWYzdwb3RX?=
 =?utf-8?B?cnhwVURGdEM1ZzdubVZSWEh3R3RpRzR0R0JLVytPd1FVcHFjYVdBd3VHQUlU?=
 =?utf-8?B?eUNoMm8rWHl4RDArbVNWVk9VTjNub2pQZXJiRG56U21mazdacjg1b25NZDRy?=
 =?utf-8?B?MW42eU0vcEpwa09yOXh4QU5ZQ2dpRERHaUk3bzVFeXphMWZtY2hETlo2dGQw?=
 =?utf-8?B?dm5rMmxDN1M1d21KUm01RmhDWFFJalkrWTNuVWMybXBXdGRXS1VSMkZiT3pY?=
 =?utf-8?B?bFdHb0FGUFMxSWUxazViOVBlZG1HVk9rZ1JWenl4TWZ3RE1odmtzVlprTUtO?=
 =?utf-8?B?WUtTV0lOSThvM3ljRXNwRXY5QUw0cEhqMWJoaHhOdEJWakM4Tmx0bXZxRklJ?=
 =?utf-8?B?RWlLaUdIYlJRLzJOT1JXYlpac1Q3dEhlU3RpMklLWVVzVnBnMEN2OUNobEZG?=
 =?utf-8?B?KzJLSkVjOGIyM2ZvdE51ZkNIczQrNDlHWkpjTWtQazZ3TG1HUDlCZW12Z2Zq?=
 =?utf-8?B?aDFBVVJjeStpSElnU1Rld09neGlVYTlrVVNxTlB5aXFmdDVZT1JpemVWRjFm?=
 =?utf-8?B?NXEzakpJRlk3eHBVMW9TamlFNUlDZ29FaXJ0Rml5SGg3cU93QzJRdXNNbkxG?=
 =?utf-8?B?bTRHZ0JOSXBhV0QxaVpQbUkyMTVzWjdmYWdPSHN6cHlTOThNZzNiSFBXdVlz?=
 =?utf-8?B?c3dOUkEvOCsxUVRFYkxkZndqSWF5bStJVFU1ck1qbzhhSlJjYzlCV1d2bDY2?=
 =?utf-8?B?dzVoY1g3enVFNWp5djR1UHptTm9wcGppRFdycTJYUU56T3dHelYvbU5YWUR4?=
 =?utf-8?B?Q0dtbWNQZ0FDSjVwdGJnS0FBaUxxMUlDZk5Uc2E0SlNIbmJyWThhQU1FK1N5?=
 =?utf-8?B?bEhnZE84eVI1TE5rNUVkalRoa2NqZW9HOFR4c2tUYW9SM2tYU1doS0xWcm9w?=
 =?utf-8?B?dGV1UkEyTkZiNU1nQ2ZnU1lPM3ZsRjVsalpPeDQxaUUrdFBIdnc1TEUwYS9o?=
 =?utf-8?B?ZXk0YUxmSFhJVkhtc1hyZHlhQmU5ZXZRQ0t4bWdTd09kN20reXJzNkdydUxh?=
 =?utf-8?B?M3g3VmxEOVZ3dHdsdE9GWUJBVnpGUXdTUGxYMUp6SVl2Y3RuUnRSc2dJNzV1?=
 =?utf-8?B?cDVzc2xlWGZHeDZwZUFHTkRSa0ErSEltbC9qNm0zS2o3N1ArQ3ZRVE53YXg0?=
 =?utf-8?B?UHh1MlJxU3dha1prWUsraUxXOG8wK0F0QTNaSlBqVlgrdS9OdUpRVXJobUhz?=
 =?utf-8?B?b013UDFCc2RJVjdmbEJaT0dYN3d3aXIxeEYwbElMMUNTaHNDMnJnS2YremdB?=
 =?utf-8?B?dFA3dEd4TW1QRGV5K0tPNzhJcmpBVGQ4TnhYY3dLbkhGYWJBSE1Uc05zUXJE?=
 =?utf-8?B?OVJ1MFBKZEIxdjhrYkF6Smpwam5HZWlRMkdXRCs2cUM5WHVxQXpTeEpHVk9Y?=
 =?utf-8?B?RU80K3h6dXNVdTJEZnI3anJKdEdoUXQzeURsbHJnWFpTcEdVaG1ydVJUK1h4?=
 =?utf-8?B?aWxPQjNRRmpNTTM4ZnpRRVJ2RXNiSXBMT0JEVG9pTWZqTVRXNll0UEtiWlgx?=
 =?utf-8?B?Qm5SYzN4Y0pUVDFDS2VSN01Ub1FncDJuRDkzTlBxeGZCSUl5RndqTXBubHJ2?=
 =?utf-8?B?emc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f214a69-ee89-4243-f3e8-08dd51c52e30
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2025 15:42:28.4567
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J7WtARg+DyZIKCBU/B58K3+pTTwD+fK3zqKyBS1B2EV4yD7HUanzs4Rt/VUzaJbLTYp4bnfqWXANQkO4zaoK4Bd3vkl/qR7ck2AzhO/rl5Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6783
X-OriginatorOrg: intel.com

On 2025-02-20 3:13 PM, Andy Shevchenko wrote:
> On Thu, Feb 20, 2025 at 12:26:33PM +0100, Cezary Rojewski wrote:
>> There shall be no comma after the terminator entry and initializing
>> fields with 0 for statically defined structs is redundant.
> 
> ...
> 
>>   static const struct acpi_device_id rt5660_acpi_match[] = {
>> -	{ "10EC5660", 0 },
>> -	{ "10EC3277", 0 },
>> -	{ },
>> +	{ "10EC5660" },
>> +	{ "10EC3277" },
>> +	{}
>>   };
> 
> While at it, can you sort them alphabetically?

Ack.

> Also, a side note: perhaps at some point you are going to remove those ugly
> ifdeffery around them along with unuseful ACPI_PTR() / of_match_ptr() calls.
> With that in some cases we can get rid of unneeded of.h and/or acpi.h inclusions
> (the ID table definitions come from mod_devicetable.h).

I do not see a reason not to. We'll do so in a separate series to not 
mix the subjects though. This will probably also scale beyond 'just' rt*.

Czarek
