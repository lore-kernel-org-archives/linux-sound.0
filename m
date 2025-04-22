Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72EC427702
	for <linux-sound@vger.kernel.org>; Tue, 22 Apr 2025 14:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745331348; cv=fail; b=c6/NevKtWbzo/SE6aNaaMaebOtgeQkH6SxtD5njXHPjvMJ1yJ6ehGRFYz3j429og4aNCJ3ppw9q4GWepbZhp8IvkDAkH0l6C7GsglGtVNRb458gwpn0KIFKAN27zTpZfR9A82QZugPY2z2/89Np1aCJ/k0d7NjaBG5C5OllbYgs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745331348; c=relaxed/simple;
	bh=IPS4+GAyfL2CBT6oJIZPegT5W0VE/xi4ODV/gz/1XVc=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=CiqIWHSwGNgBkCBivBwwF+OgXSQFNOjmIUPDclLrBuQdYYD39h/HXqh3IQju4hJebejX5UaT7CYQYaqMthKOOBPhFEEB2BJvdLxYyp2VKTB/mv2fVcgQ9dhzuglDPwjx07iCD70zc3HkEjyRL/+S7RqpplMGqSD58LLM/544z+w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E9BnVGP0; arc=fail smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E9BnVGP0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745331347; x=1776867347;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=IPS4+GAyfL2CBT6oJIZPegT5W0VE/xi4ODV/gz/1XVc=;
  b=E9BnVGP0Id8ot1+y0Fheuz62IL6OFHGPmP0LG8j2UFfhL7IRgVr1MGAd
   YxRkKQbTpNrK6p585Qejn/ly9PfDxoDhLEfue5LJl9yLRqRwHkv2ElUti
   z2qVAh2Kufd06TYz1l2Gg677ZOix1evvoiy3KgDhtI1j1vf45qOT7Xh9n
   nRyWUQ3czMkhkdrfyQDfU9qz85/qWWknAfiLAf2l36h88I+R73k9iVF+K
   PRmTWLEtAT+m2FTgOEaXlaBpknrLOnxR8zwzOOv8hjw8WZUcI/RW/nqiL
   q+AE8gT1VHpnnY0oA1t7EbNcgxUGNVRiTrFcmw3Qiv4dVKaLqSJCl7bWU
   A==;
X-CSE-ConnectionGUID: 84MPHC/cQGWJH+jBnxVG3w==
X-CSE-MsgGUID: jWQAVwapSrKNQMNmEohF0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="34509251"
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; 
   d="scan'208";a="34509251"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 07:15:45 -0700
X-CSE-ConnectionGUID: bGbYLu5VTYW5oCirvHA6/w==
X-CSE-MsgGUID: zevYxwPcRr+Mo7j1Svhg0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; 
   d="scan'208";a="137114153"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 07:15:44 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 22 Apr 2025 07:15:43 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 22 Apr 2025 07:15:43 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.47) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 22 Apr 2025 07:15:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q7r7sKtplflnEbvzFFRayXIzfBZVlT3gZdmXfNJU5lXrn4S86xGI5dw727wEy1DpYbPjD8VpPQ9qwGBHgI5t08iHS7m6DZIT0bVOGDdbjpXj2a12Wabl7htiKQnii2b3AZNJyJ3cS1IN6h78YmlXZ9GXswT/zcK9KQSebKwgLqx245cO178CEn0F50Pa2JBRH/487inQ6rY5qUgWoRMiW27KL8YGgokSH7Q4AawquXo+AKV/uu+F6QlONOLd9ITS9sTq0RaYjIVqd17lPYWvqG9WqWcNONH75uOmorhvZjdV6UfYg6GEe8p+XPZP66WoXfzjeQ5D45rP2l4jWjA4Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vG9xjAfYTYTQuZAXyMFUFntVE9B2Y2CliAHpQXPtJHM=;
 b=GBDTr8/JmVUmhvQBd1UTKwOLGDxCr4jYDrd3ui+Z46k8cY1Ah40NbkMWmksvwJiKF3L+kMD0Pi0CiroqqnOja2Gx51b4am5bqyyggKH+0KnjgI3Fd0khhKwqQ+RYnwVDlFx4f8ZBFDu9gyQJ4fAEsJ67oTmcXlQqh8LO5ZaVdfCCSUlwSi/gF93F+KR0Bo7zglJ0PcgqrGxdRZV5/Sowxy7FPgPRBXwIqILzXTx6Z1Ce/sKXkikiBuYG7hkaxBdx5An0z6Kv7iWeMr9eEENDJrHcmYzh7LTNGEKhiB9ByckWQmNj8XrXhtETLo5mQ8kFSdgvndMEZQL9smVsrYZJZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 DM3PPF7D18F34A1.namprd11.prod.outlook.com (2603:10b6:f:fc00::f32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.22; Tue, 22 Apr
 2025 14:15:41 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cd01:59f6:b0f8:c832]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cd01:59f6:b0f8:c832%6]) with mapi id 15.20.8678.021; Tue, 22 Apr 2025
 14:15:40 +0000
Message-ID: <6ae9b485-9c73-4a40-a958-8a72595278af@intel.com>
Date: Tue, 22 Apr 2025 16:15:35 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 00/15] ALSA/ASoC: USB Audio Offload
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
CC: <broonie@kernel.org>, <tiwai@suse.com>, <perex@perex.cz>,
	<amadeuszx.slawinski@linux.intel.com>, <linux-sound@vger.kernel.org>,
	<gregkh@linuxfoundation.org>, <quic_wcheng@quicinc.com>,
	<mathias.nyman@linux.intel.com>, Takashi Iwai <tiwai@suse.de>
References: <20250409110731.3752332-1-cezary.rojewski@intel.com>
 <87v7rcwbyn.wl-tiwai@suse.de>
 <8e3fd738-c2c3-4ea0-963e-477c2fb253b6@intel.com>
 <87sem9xuxs.wl-tiwai@suse.de>
 <5f3c62e3-6993-4595-80fc-eb77c0c11f1d@intel.com>
 <a05a3419-8acc-47e4-bf06-8d87aca444cf@linux.dev>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <a05a3419-8acc-47e4-bf06-8d87aca444cf@linux.dev>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P194CA0038.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:803:3c::27) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|DM3PPF7D18F34A1:EE_
X-MS-Office365-Filtering-Correlation-Id: c423d98b-95cc-467a-59a5-08dd81a82989
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OTV5WjFiSWVBNlRKSU9MNlFYL0JKZmhYMGZFQlp2Yi9XTVBoVy9jSVc2cFc0?=
 =?utf-8?B?WVR1cmJZMzRSTndSOWdWTFV0RzFzb3hqdmwya3M2bEdIUTJDcU5oUkd0dmta?=
 =?utf-8?B?eUdZTFkyRUsvcGNKNldKNVNLTWJ5aDY5bWFqK3I4a2hNc2I3WFM0VkJ2aVhy?=
 =?utf-8?B?ZlFoNTRNTmlKMHlMQkJCSW16UGtKNFFoMlhLSDIvdlFuYmFLQUZuRkwwakdM?=
 =?utf-8?B?bXlrZjVIRTcyVE1qNXVFSWtEUFFwdXVxNjZPT0l5czl0eXREclBma2xxajk5?=
 =?utf-8?B?eGh6S1hFNU5jc2NweURSU2srZmIvL0hOZkdsQ3ROQ0txQ2c3K0VCQnRLemZ2?=
 =?utf-8?B?T2ZoWFdJSVI5NTI4VUQ4UytuNjhhRUVXeUF6NHA5S0QxUm80SWo0aGF4VnN6?=
 =?utf-8?B?UzUwcGhyd0hsZ0t0RjZzcis0NFluRmhtM3p1Q1RLaHNSYm4yck5GUlc2cnJu?=
 =?utf-8?B?eGlwQUNSaHNhaWZYWnhRbkFqWnJLQ0lpOVI1L3owNWVKVjhsU2lQdFMrSzdl?=
 =?utf-8?B?Z0dPUVlQdURMemlTSFpaeXBnZHlnMTFYZlBiME91V29yQzQ4SnJpUCtocERi?=
 =?utf-8?B?b3ZJT3puS2x2dWlzWlRLTkNjWHBJdk1tU3ZEYUdpU2tSOVd1ZjRvc2lkTGJk?=
 =?utf-8?B?TS8vSkVLclJOellGcmNZS1gxRDlSdTc4ZWorNjYxcFVXYXlVMkVkTytiOVRT?=
 =?utf-8?B?VkRqdVhNd09aZ3dTb0N4eWpEZkFJU1RpTEVzVUQ5b2JRUDRPYjNJU2U5SHRp?=
 =?utf-8?B?UFFIR3RidThDNFlNRk1YRmpNSVlFUHhDUDVlZzRRMXpKOVpLYmtFMllwRGFO?=
 =?utf-8?B?Uk9jVXNnSjEwUmVVWlNwR0J1dzg2MUw3SEhhZWU3YjB4RGM1WmZoRHhGMmJm?=
 =?utf-8?B?TUI1M2N4U0kzODBlemV6RWtGQkVFKytreDJzeFJ2YlpqVGRBVTBXWi9FdzFp?=
 =?utf-8?B?Rk0zSDAybEVIdGhlWFdCSjlvYlRyc1c5TXRJRmJoaHR3Mk05SUY5SjZadjhR?=
 =?utf-8?B?QkNiM0tnY3FLSFFRM3lwQm9uNkRnNWxyejhwa3d4bFZsNEZZR0c3emNmNmpR?=
 =?utf-8?B?Q1RHMERqcjdKMTVzVStnUWdFOFBOcE14eVV5VHdpRHdOeEd2WjU0TGI3d3R4?=
 =?utf-8?B?QjBjVnVOd1BvOXN2VXFzZTN4cXBWM3o2RndTSmZBMUxDQlh3aWh4VEgxeWVL?=
 =?utf-8?B?WVpEREVJckdzdVUrR3R5d1NBT2ZzbEt2OThQNER6RDRELzVKTUUybzdRakRk?=
 =?utf-8?B?ZE5JcTBkS0NrVXpRNkg2WmVUSVNxUTJvMGpMRi8rRHdVSTlTRzVISlIyNFRz?=
 =?utf-8?B?R0tDOXRoZy9OcEZJcERhV25mZ0J6UURodmlKUEN3cENsWGNiUEMvSGsxRFVL?=
 =?utf-8?B?MWNudUl3TllMRGI1Z3BTSWlmNDdjSXBSaTQrVVBXQ2lGdUc4RlNCN2V5TVJH?=
 =?utf-8?B?WnU3TnAxZnlEbUsxN2V0VlFVZXhQV1MzeE5UaWpvTjlWYjZHdjgzRG9YUGhn?=
 =?utf-8?B?aGYxR2ZqWitJOW40R0diN2g4c0M3dGgyWUMvRkxiM0d2dGVWUlprV056aVNO?=
 =?utf-8?B?VDB3U1I4VXAySjQ2MldRSWM5Ym9YUVVSUDRTcC8zUStRM3N0MzVIc2ZtMUpj?=
 =?utf-8?B?SGsramlGeDQyQXA3Qk5acTgrSDg1VkZ5VUFCUCtrcElybCtnK2s2ZDBWbnlV?=
 =?utf-8?B?a1UxRWtnTkhkQWNrZEJtQVpmUWZ5RDUrVmptbHVycGxQV2IzODIxZU1EZnZs?=
 =?utf-8?B?L3dxMlRuNURPWlNyaEZPajlTNUxYMlF3RXVGTTFSV3hwVnY4QlUySTJ5N3Er?=
 =?utf-8?B?N0RWSGttb05ZQWJpWnY2elZudHJsRXBCZ0ZNMWVLODI0OXcyZTlFamM3Z3ZC?=
 =?utf-8?B?RE85QnpVazR1dEtINVB0dkRCdXRvdW1WaFFyNEJBeDQ2WFVKZ3djYStOcEdo?=
 =?utf-8?Q?tcd6cYkkWHE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6375.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MnFPSWtpSllZVE9uZy9DTW9RK09KYTZ2U1JxOHpMbG84NFBmYWQycVZSYnp1?=
 =?utf-8?B?VDIvbDR4NnBIU1lHbmtScE9QcVJRSmVsUkoyVG1ibng0dFlWeTBjQjdQUXgv?=
 =?utf-8?B?ODdPUjgrWWxPSjVVRGQvejlPWVB0OVdkOGRidHVtUnB2R1Uycy9tWll0ZjJi?=
 =?utf-8?B?dUMvWkprU2VHUDJJdkMxL0oxK01NRnBqTjF1WXpLRjYyUStJTDRzY3dvVWMz?=
 =?utf-8?B?dDFqbUpvM2dJcWJrb0R6aExUY3ZwUTE3QWx3ZCs4bXIxSVE5eWtXeEwrcXZh?=
 =?utf-8?B?NHV4TzFBbHZZbUdSNW5mUllvSDc3Tk9udFdmcXZ3KzYyNUR2RzkweVI0SDUx?=
 =?utf-8?B?S0tqaGNNSmlOVHJSZ0RYQ1U2NmRRQVRUaVkrWVo0ZDJRWXNDbEZuaVRvUjZ4?=
 =?utf-8?B?REFndHFCVHVYYWFPYmwwb1JVOUp5aFVYSjN1ZFkyQjhjL244TlBzU3RLbkl1?=
 =?utf-8?B?ZkpWaHp4TzJudjBCaTgyZEx1WmVpZzU3eWxoUis2WG5jbzduVUtDdzdXdi9B?=
 =?utf-8?B?aVVFUmxGSVphNEhRdWFOMklHL2RxUHZKZm0rMC9sNnJzdkhkSzVFeCtFYVEz?=
 =?utf-8?B?VHVjNXZ3dzJ5NEtqcVFSTFBDK0lGbHdGajR4aWFCVFdoMjFHZ3FZYythQVZJ?=
 =?utf-8?B?bmpMeHVTcGNNUmxkMlZtaGxYSTQwb0FGWHp3TjJBbzIyZUFyekZWbmUwQXFG?=
 =?utf-8?B?Z2xjODlTeXBFMDV5aFdNM3BJL0ZNUXkyNEVlQUcvZkRacVh6MzJwci82NWdw?=
 =?utf-8?B?dXprT0J2dTQwUzQwK3pDTmwwaW4vV1cxTkcyN28xYVlGZHBnNlBLNURWMk53?=
 =?utf-8?B?QzMrZHNRZmpINjVMNXJMOGo5MUhRd3NmT1VLSUNESE80M0lja3JlcExKMWtO?=
 =?utf-8?B?ZWNDVmVxdE9aOVRlM3RqNE10aU5OUFhlRlRoa0Z1VlNma0Rldmh3N1NHanB4?=
 =?utf-8?B?L1hxa1VJcXU0VHhzWmF1TmdqWE5iWXM1WEFEZVdmcUtDcURNUG9zMTNOZzg0?=
 =?utf-8?B?WEJ4dS9WTEVLeGVuMFhIS2F0MUtTd2NZdHI2R1NpaHQ1RGE5UVVFNGlWVTdW?=
 =?utf-8?B?UEplZjBaSkFGVlBTaDhVU3g2T0lZVHRXNDUwZ1FPTGZhS0FoUkVDRWttSVNQ?=
 =?utf-8?B?SkU4U2xMdVhXdXA2eHl4U2NneDVrUXVVYm5uOEl6Q25nUGJzTnNkamhJRGQv?=
 =?utf-8?B?VGxyenVWbm1rbGx0QUZ4ZnZWK0hTMmo2bWkveWhUS2R6QnUzSmdqSzlzUVFj?=
 =?utf-8?B?VklXVi9MN05zS29Wd0VNWG1RMnRmMVR5ekNtRVBSakZCbWhvazNIQ1MyUWVz?=
 =?utf-8?B?R2RScW01czdUb08vUnUrc2N6eEg2R0YyY3ByRkZRVU5udEVBeFR1YUJLUG9D?=
 =?utf-8?B?N2pUOVVXYk1uWDlEQTdVTk1LU2tFSFMxY2VWNDgrQ0JreVZydGZkelY5L1VU?=
 =?utf-8?B?dzZUeDlqemVyMUJteEM2MG8ycTZuT0w3RlZ3WGJ5YkJGOU85NTU1amRnUmJ0?=
 =?utf-8?B?QmhiK0NOMHZrNmlpM01ESFZPMmlrOGdWcTl5SkNmN2l4b244OHVtdXNKQ3Jm?=
 =?utf-8?B?OEdsM0ZoL0Z3RkszK1RCa0ZZSWRmR2ZsMkNDZGkrU01QcXVjZk5aZkJPTkQw?=
 =?utf-8?B?dkhkZUh0aTdzTzZJS0QrdzlVWHFDR1kxWEpNREE0Tk1tdzFGU1kvSElGZmQz?=
 =?utf-8?B?aVdGaytRYUFFdmJONlZKTU02OEc5VFNGaFNVUi8yc3BERWk1UUJ0NHRrelkx?=
 =?utf-8?B?aDFndFEvZnRodkQ5RmJucGF2T2JiRVpQazd0N0lFRnR4KzQ2anREWTk5L0Jk?=
 =?utf-8?B?UGNDTWhKdEswSXRQSGVZV3E4T1QwbmlIWWVvVDlaT1o0R1JWaVVDVVlySW1D?=
 =?utf-8?B?eDhIalAyUzB3aENSQ0pMb1R3NUluV0hkSm5HSnlxUTdxTUxETFc5ZVNkbDhp?=
 =?utf-8?B?eUFXenpnKzA3Z2gxZ0xMRXZNZ3Q3WFpMcVlwYzZ2U0FISGdjc0xKdGZDY1Er?=
 =?utf-8?B?TWtoSU5TNkY2QVg2ZGp6a05WV3c1dkoxb2xjNjFlUllxSlRoTXZ0QW1wUFI1?=
 =?utf-8?B?MzhGbW8yUGZnd3RZWG41MkIzSlZCc1FacUV2M0JhanB2RVJOQm5yTDhsc2di?=
 =?utf-8?B?cFRMVTBhd1NKaSthZEpJdE8vbTB0LzVjaEMvZjJPeFJIWkErRy9jTHlXdzhz?=
 =?utf-8?B?SUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c423d98b-95cc-467a-59a5-08dd81a82989
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 14:15:40.9141
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FUlGrbNqaB1x4kgFhP5DkEtSkuv0p+DlpjWbQpT2xjwZlgTg5EhfFQA9cCWGWjDaQFR3GFHR8qAy5nTY1JgV7CGtD8BKBzf/OCbT4l5ICxI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF7D18F34A1
X-OriginatorOrg: intel.com

On 2025-04-22 1:28 PM, Pierre-Louis Bossart wrote:
> 
>> In regard to the HDAudio point, I see clear benefits by having HDAudio and USB aligned in the approach on ASoC side. It's a path that's known, works and is well tested.
> 
> The current direction for HDaudio is to have the DSP handle ALL streams with DSP-enabled drivers (or none with snd-hda-intel).
> 
> But for USB we absolutely need the ability to bypass the DSP when the resources are exceeded (too many endpoints, too many channels, etc), or when low-latency is required (lowering CPU utilization comes at the expense of latency).
> 
> In other words, the USB solution MUST expose two PCM paths, a legacy one and a DSP-one, and a sideband communication between DSP and legacy drivers to manage resources.
> 
> HDAudio has none of those concepts, which makes it hard to see what the suggested alignment is?


Hi Pierre,

I see your point but the spec describes the exact opposite. The 
intention is to follow the Intel's software architecture specification 
for USB Audio Offload Link (UAOL). The high-level steps provided in 
previous replies align with the recommendations of the spec. The 
reservation of Audio Sideband resources and negotiation of audio format 
are part of that. There is no intention to offload every single USB 
device and the device is to be claimed for offload entirely or fallback 
to the classic, offload-unaware driver.

That design (UAOL) is known, well tested and proven on the market. It 
shares a number of logical flows with the HDAudio case and thus having 
similar programming on the software side both makes the code easier to 
understand and aligns with the spec's recommendations.

Kind regards,
Czarek
