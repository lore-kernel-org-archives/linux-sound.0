Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B52413227
	for <linux-sound@vger.kernel.org>; Wed,  3 Jun 2026 08:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780475352; cv=fail; b=iSR2XN/plSuAIKvq9WHfx4LY16T5NnlDOIv0uL3d2M4agDkRqi3CNf1ZicMcidORh41mCSdRr/qspy9Yrk9GyH23y7BiQB6a5wPMOz50USCODPOjHYMnEszZ0fB3+gaqd/5MLePtTzQdyWwfrq4geR61ZK8Zmi9zAvhQZYzK1Us=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780475352; c=relaxed/simple;
	bh=P7f7HQilo1EULJIauNUGASkDOGyMFvbmlcahs9YtO/s=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=eRVb9Gl0SMYLC7dRP6gf+MUxTLc4fwi5jae+q5Mvw6P5GBnKY66E3Xw4QKe1FGpqtVkcW674xAJXmS7Gjo3Uf7KjrxMobjY9vnY6Wh/SBzGDOm9//K3+SL0TJLNipCP9bAFJeiXovsi2WGy1YRYV7JhZT+idhuQUmZHDdPGvlyE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=civqNKw6; arc=fail smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="civqNKw6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780475351; x=1812011351;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=P7f7HQilo1EULJIauNUGASkDOGyMFvbmlcahs9YtO/s=;
  b=civqNKw6fmQRW0c/2fjo7cEMYcw3TC6xPQNViOgLy4NWTwip8MmS1mP9
   4WNPNdHdORi/ZZWd8Kq8KpR+O+KvX7y2YEo1/qHCuIaIjf9EhIX7Cr7ms
   7Pa4ey4dDK86tJ+H6pGFZ4mvamlBUNTdS5unKmhanq/APvSayQmR31DQ/
   W70iJIoFoD3EokjfAgo49EPamNQsh8bUn5BLETzIbtA4VCQsmIwOB3NaD
   0XQY59kmtPrwuO/yNS+w7XlyphlKHUWMHXxzwZ3iu4hr2EUBb8hbq7Y23
   hP8DJUM75d1RDUk0vn+Lngoy+SDgUXvyA3RxUXxGlD55N8ZaktnROc+6L
   g==;
X-CSE-ConnectionGUID: XghWxJWzTua9qgXmtLcCLw==
X-CSE-MsgGUID: 4w0KyvtmS/23NwdWe/UjHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="81179272"
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="81179272"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 01:29:11 -0700
X-CSE-ConnectionGUID: RWU3kGJNTaqiQyEThb+Kwg==
X-CSE-MsgGUID: fEEYyVsnQwS41kzIf2+crw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="239698166"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 01:29:09 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 3 Jun 2026 01:29:09 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 3 Jun 2026 01:29:09 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.41) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 3 Jun 2026 01:29:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u8U85qtww4NV+hQcxczuO93zXMWRIYwtoKHbYzBDbCzG6QrVzAwc8pq7FFPM1e8qi7T04VSem3GjrtNKOM0Ppg1+vaCoqIKs129UzO1ga5LygWK84nW/r+6VvzM2DEPnIJDL3dxZz6moZcsdN8aWBb1e1oJORP9rmhg52r03TRiCIo5/SmgXQhqQVJlw2/ETBHvPROLhrHkR0u9E2zzlpKMIUmmbopUHz6pPdpKwo68HRyZz8pqnYaIgOwUOdfnrRPQo+jkS8CuZUrL4dzUjQVRGyH6DLuDCqspJpWtQNpFvtjtuBarED8CmSiT55BKgwBinwSwgIfzTydmH7GetAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MHYmtImKo9QqFrypcUfdqD6oNXzW+/kL1gMjnPWrTf4=;
 b=CwGZoBpgRA0m29rn2aoeFc7MPEY8C0gwFaOs9wdevbVy9PIXX6N9/IhmjJAWoe//ubdBbvaMBJBhfFxftXMokeSUFlHUebd7RbV1OqqYGAAQXNOLbdqEcdE2zOBdAVgYJ2mTnS5oxATPB1QzKBZ8gXlN1tMJix5piPOgUlytLd2HUnQ/P4J7om3VtYRt2HqLKc2kOUEYjibJhpClWkd8EOksnaO8hyC8A9FztOlQxWQ9u9kUSDt6bQ9BFlCcKfC90EIjollXIbfNqCeenFC6w+TuMp1vaIBPzZ8z30AXMczCjGjvNcukliFNsFvY+HT5sfmqpGBPTIXf171JGnDz/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6967.namprd11.prod.outlook.com (2603:10b6:806:2bb::15)
 by DM3PPF96964A2A1.namprd11.prod.outlook.com (2603:10b6:f:fc00::f3b) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 08:29:00 +0000
Received: from SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4]) by SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4%4]) with mapi id 15.21.0071.015; Wed, 3 Jun 2026
 08:29:00 +0000
Message-ID: <2b6ec878-f806-4b8c-a674-700179416989@intel.com>
Date: Wed, 3 Jun 2026 10:28:56 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] ASoC: Intel: catpt: Print error code if
 board-registration fails
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: <broonie@kernel.org>, <tiwai@suse.com>, <perex@perex.cz>,
	<amade@asmblr.net>, <linux-sound@vger.kernel.org>,
	<krzysztof.hejmowski@intel.com>
References: <20260528083444.1439233-1-cezary.rojewski@intel.com>
 <20260528083444.1439233-4-cezary.rojewski@intel.com>
 <ah9gR3qlJj7ca_i4@ashevche-desk.local>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <ah9gR3qlJj7ca_i4@ashevche-desk.local>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2PEPF000008A6.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d8::64b) To SA1PR11MB6967.namprd11.prod.outlook.com
 (2603:10b6:806:2bb::15)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6967:EE_|DM3PPF96964A2A1:EE_
X-MS-Office365-Filtering-Correlation-Id: 62d779ac-5b15-4f73-4780-08dec14a298a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|18002099003|22082099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: o2KM07nLTplPbh6lHE8Sz5wfsg9EBmRdY9+OOxLZgf5mcBgcTZ9su4KFRRsOEhn/XhEP5PseF3W9eaiVG///wUxF3B9EEuIWVb3v+rVtpm4QHQ7QHIicGJBYMu+B+8DsChsxPu+wog+vAQCDTSXDHNrs1ZUgfWVWBjEsBl/sfLzqdpeIgX5X3437+OtyrQXlhwbMp7fBqjoVHB/f1enLHPVcudk43O7GRJsDwyPV8hL4Un0VnRH+KpTDi5Pj00KtxbHL1I4JMqGI4E64A9J8/Grr+yXueHnUTwDdRaJbYXb85SkIQ4AbLEbih45VOpXfInxTNVvlP/cS/4OC4q5/cvAAAmXy8TgUNPyGOavm/nmo9qnovpRclLPqS1pLujuOI7QE4m+8GmkQ9seO3JM5VOtGESUYz9RzkuwTma3KBJqUTKQLzZ/+HcwweevkotI66NMtE95+uBOhzoR11tOs4o++fjO8aXPLvJseqt13Rk7kXpvZAsCq9qSZuuRbTvBneHNMbpmri/VGB2h7feqBcIqe/0mh+2R1ki9QFQdSD7yTXwMaiAgVC8AyQ1Liilk2xBbNq2gc5ZqYHl88af/2fBQfX+Serxjs0VnF3ASnm4cxtYAfkHaJ/fimBOtHmtCNTes+E2uhlUx29K2fVgZYJIQmGrb81uIyop6DVrf2iZzNfA2faCrdjax6XxCZdxu4
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB6967.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RzVza2ZmUHZySHhYZFd2K3VlVDNyNlJ4VmdrZ3pkdEk2Y3BqdHVHZEN6Q2Ir?=
 =?utf-8?B?NDd5WlFuVnVLWk92OWpwZWxRNjVranhBMkJWOVhJSzJSZmZQQWRkUkJKeXpn?=
 =?utf-8?B?VFRFeTZ3ZkJ0NzZvbTFaUkRUR2dFajl6UWd1Qm1xbm9Scmdma2RZYmdsVUVU?=
 =?utf-8?B?UVJoU3QvNjNvVFZxVDZCdHhMenVCb3RHVFFyaEtLdjdXeThxbHhjMjh0N2hY?=
 =?utf-8?B?ZlFOYTljYnpvY1ZDL1Y0Z1JaMnZvYWU0eUpTM3NEa0VOdTRPYTJyZUo5bFFy?=
 =?utf-8?B?dnl3VzhUb1dZZjcxNjdHNlZsZ3V4aHRuNTFXcSs1TmRHY1BMcXJ1dnQrU3lH?=
 =?utf-8?B?M3hnOGZJWmQyNXFBSlMyMEViZ2U3S3hiL0RQN00wdEducWZPeGliWEFLdzUy?=
 =?utf-8?B?bHdCWGdvVjFJMGNYc2hxUkJlcldVNkpJN1NORDdaSVZRRTlaeExXY1BYRFZm?=
 =?utf-8?B?bmxNMHFlRzBUc3F5Mm5JVWQzNk94NlJ5ak56K0NBaDgwNk42S2llUHJzK1pZ?=
 =?utf-8?B?UW5najE4eGV2WWk2K3JFR3pZekpxTkRsajlHTWxRd3d2VjltMlNLV1l0U0Fr?=
 =?utf-8?B?cFlONElQNmROcTNZYXpWQllWZ0dHeUhzWVZMT3VKWWRHR1JsYTN6MGhQMmtY?=
 =?utf-8?B?dVU1Y1F0RFlnNnBkZDNtOW1ObWJ4NTZDUUtOdjVjRFZSSlc1QkpKMkc3bEFo?=
 =?utf-8?B?Sm1GZi9UekdteC9VYkFnblA2OUdZKzVYZCticjVGSUN2RmJzZUk1ZlRhVHlJ?=
 =?utf-8?B?bWZobWx3b1c3WDc1d01EN0xjaDZ5UHhPelJSZXM4QWFHcjdOU21tRWh1Wjd2?=
 =?utf-8?B?eWo2RkpDWFZPWGZCMGxpWE1yMkw3TFVPL1dVM1loU0xrb3NkK0VLLzhWNnFX?=
 =?utf-8?B?bjA0aEdxRER2emV6M3hsZUFNUHROc29vREdKNE9tSTZBRG9CanozcWVacWNl?=
 =?utf-8?B?WGppd2ExNSsyNVJFMituc0FHUTdGSG1BY01oT1F6Vk9QNEhWVzAxZm0vOTQw?=
 =?utf-8?B?UW0rblFNK0RiUWVabUFkL2hsUDZ1dUsxZTFaQ0FQdkxVMS9vc05LVGx2MW5W?=
 =?utf-8?B?WE1kRk9jNnpJbUVRNWIyQXNoLzR0TzR2czFIa1g3K2dhY1FlaG50ODdTYzd0?=
 =?utf-8?B?SklJVlMvWkdTeHVYdk13N0pmTkJYWjZUSmNhRTFZcGJPenNDb0h0azYrWGsx?=
 =?utf-8?B?aEtCejB5REJzbHdwWjFPaG5aSjBYa3dkNHFiRDVIRG55ZnplL2NkbitEMU1C?=
 =?utf-8?B?TjhRd0RwQXJhRGRIY3F1dEtqa0Q0LzVNT3N6anBjZmlJNndndTAwMzJuZzJl?=
 =?utf-8?B?YUpCKzhTVXdXc0dqSDc5MC85TU1QK0xpVTBrc2V2dE42SmhoemhpRVBidHA2?=
 =?utf-8?B?ZnZqbjQvZFYyTXN6aEovckU2UzVYU0tWdk8ya29rcUhVd05SSWYwd3E1SmhX?=
 =?utf-8?B?eE92KzhITmdDbXEwSW80S3JLWnpPNHdHeEVxc25HaEZYbUt0RmVHNkxibkZm?=
 =?utf-8?B?a0N2RllKZWc5UVhnYjdyT3owcFdCSjlSZzFEUlZFL1VZcitaL0xaZkxYaE53?=
 =?utf-8?B?WkkwZDNQVm53N3FMc1dOS1hrZmJXR21hZXUxWW5SS2RWZ0FGenhNekNUdnBB?=
 =?utf-8?B?RTR6RjFHYkswdnVQVjhzbEtjTmQvWDZxSHRSTjdkTnM2TmJVY3JuTyswNVp3?=
 =?utf-8?B?U2pTZFVYTmYzR010Ri9YWGhPYWRnRUNQZ0ZzMmQvTEhUTDQxdU9nVmFRZ2Vn?=
 =?utf-8?B?WlJBcGsvS0NnK2h1WllqOHJDL2w1OCtRMVNjV2NsTW1uOGpKNnU2Q3lmay8y?=
 =?utf-8?B?YzJSQTAxUmE3dGc0RjBXNHp4czRlZERnUzRNRzR5ZHZvZThNMUxqRjYwUVow?=
 =?utf-8?B?b0pEYkliTEJsSUJiUFo5ejhKS0JNUHpqaG92VzRDSUY2TFQ4STJndCtoVWoy?=
 =?utf-8?B?Mzg0WUFEVGF0amx6V2tiRXZmZGJFeUNmdG9VY1JHZ0ROd1RubGtCYS9qdDM4?=
 =?utf-8?B?bjNFQVJKdWJSM29NQVl4N1ppdHA4MU9walhvY0IwS3hkei9tU1JQYXFPR0Vy?=
 =?utf-8?B?K2dpSm5rQkpBaWFySjQxMTJlT3oxZE5YQXpXTFAzcmo3U2NuK0NUcE5PS2dv?=
 =?utf-8?B?bnhEdmFiL1pHR2YrcjE4R2kvcjBWR2F6RSs2ZThzUzJZSXRVNjJZcEVUanZx?=
 =?utf-8?B?b3Q1VFNHK2FaamtKcXVjb29oUHRIdTFscWRJUmEveWlWOWprVEhQeXh5Y2pN?=
 =?utf-8?B?amF4MDZneEpRVGx1UDBRVWN3MU94WHBRS2l0ZXRxOGUxc0h3YkNTd2tiRGNy?=
 =?utf-8?B?NWMzVGpkWktORVNEV2ZmYmdBWUxybjFxOFQrQlBaQ2JpNkJiSjJndFpOcnlt?=
 =?utf-8?Q?KM4EFNmUcymZRJWY=3D?=
X-Exchange-RoutingPolicyChecked: TrOAbzRIUSeV/f43E30HummZUtcyBOLEnpcMneism1GfidybWGFil0bP5ZjCgOUEBNyOTGzgo7x+ztke+Vm9BFP8hnZ5SH5XnluYV5IwVR47Y5qtPxHB3amSvaM9hqqj3HBMMvdi9tEIDrbXnZGWEVOUFPGaKoWKxXluiUj3LjJ9jWiJn3tFywlWXMUDgzY9WylFuEfrZA1to9Rx0FzMfsW53tOqCcrS8PI4bPu2oXCnU2kSRmeBWaCHN67ZR+8ueGzvn9Izsw5D810MTvmwsVOqDjzyFGqcNZi39nXZMH1i+B5Gckj1qHxNw/109rG6Vh7QJvughwzodpr4l6OG/w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 62d779ac-5b15-4f73-4780-08dec14a298a
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6967.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 08:29:00.4134
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x3KSr8mt2ToGXMp6cQmXTFK+cMI5YQJRtgiTjF0mShXWPLLVkDDyAUQbIGtBXZM+EA0BWQ+c3pGISXOEKMI1+fsmv0+39FLGUtFzXVOe2Ck=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF96964A2A1
X-OriginatorOrg: intel.com

On 6/3/2026 12:59 AM, Andy Shevchenko wrote:
> On Thu, May 28, 2026 at 10:34:44AM +0200, Cezary Rojewski wrote:
>> Message alone without the code does not tell us much.
> 
> ...
> 
>>   	if (IS_ERR(board)) {
>> -		dev_err(cdev->dev, "board register failed\n");
>> +		dev_err(cdev->dev, "register board failed: %ld\n", PTR_ERR(board));
> 
> Why not %pe?

Did not know such format existed.  I don't think we have any in 
sound/soc/intel/.  This is an improvement can be done in a separate set 
and target multiple Intel drivers.

>>   		return PTR_ERR(board);
>>   	}
> 

