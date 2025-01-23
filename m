Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E171537D4
	for <linux-sound@vger.kernel.org>; Thu, 23 Jan 2025 09:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737624341; cv=fail; b=SRNGHitDYEz+XtpPokNgqwtens/D7ljDLkzB9YQB4MkH8FSUvSca1P50hu5Gs2jYylIeoPjZVPL8Lgw4r+V9JTkoXYXpTUdFYF3uGRUmpSq2P9vsmQdirVUHllzgh11YHrKO151niq3+p9JDE4S1KlztSRH48OsTvLMZz6iKees=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737624341; c=relaxed/simple;
	bh=/EtsozlLZMoe3K6zV71jf/yVWXeBvRh5nttcYN4Sovs=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=tPgvj85D9gNL1l5bSGSb7HT9a0F6VTa5g8mBdXQtFKTQEaBYWhLHY5HMln7JUFq2JWC6UKzSwMgL/r2IWD4RWTXOQGnBejbHoxjIarV12kR31TZ/zG51m/hW+89R6RaqQiFN0v8B+mH6vN8IavoUm4amZtv+4QTBfTvxfJq5wfU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nwsCaILp; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nwsCaILp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737624340; x=1769160340;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=/EtsozlLZMoe3K6zV71jf/yVWXeBvRh5nttcYN4Sovs=;
  b=nwsCaILpO9Ux/S0c6xAUdOkOucvLCAmxp6E31muQE0tOiP7UxDs7f2bw
   Sc00Ne8rXNUg8W2gE9iapy3CuqGIdgVVzi230N4ShohFBK+UwwzsFdDHd
   5yJLT8/XUOuy0YsY++bfsK/IAiM7rkzXElINPlJSI/4SJ4vVI5ie0gxLI
   q0rMudbc0MFOl5Tv4fp0dq+38+GXpiRVZUrtEJ3mE3TdIhHWMy7DMxKJb
   FA5LUjtyDaUG2EN8zXD29vblQgiomxt7pneEO7dW5Is9BFLB/aSgjEVr4
   WKKEotF4Xz6D34E7JZ10mooO8K4RbXrHOqWkOKnpQg7llDn9otq6CjuZd
   g==;
X-CSE-ConnectionGUID: aretTYTKRUyZ/71ZTVhfhA==
X-CSE-MsgGUID: xw/SnODMTG+CSYXuxwNT5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="38143644"
X-IronPort-AV: E=Sophos;i="6.13,228,1732608000"; 
   d="scan'208";a="38143644"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 01:25:38 -0800
X-CSE-ConnectionGUID: d4tUAUj9TciMvsWUhT7BYg==
X-CSE-MsgGUID: moS72aodSHKRzAhq7AZHSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="112377422"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 23 Jan 2025 01:25:38 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 23 Jan 2025 01:25:37 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 23 Jan 2025 01:25:37 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 23 Jan 2025 01:25:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gYWwmF3zMcQQG/6Hf2VjKBAn8J/SMvN/eZ2iZqrN12r4HhUa/jOd8mbrGu00z9pGEiLnyJEd3dPGJ5xbiatVuM/MovKc6L2ddY7jkdYZPwjMhwXjxTXBblFz3kINEkrcSt5q49Y1Q5dtVYIdLHbxhCOHPmAwAsTTQAKcSVJE5wKzcZh2JwniPkbaLxL7UF1DXW8RunVCZijV+hyzD9FzlrAG4y8ppCX93URrt5d7nJwjNqXIr7AnbUQlwfu8S/RxCyljiaiUhL58OcMM5+J1a2pExwKUY9biSPglBJtJVDHNSa44IZ9caSXN2xS0MI7Xp/X0ZF6JptAqEXk10cps8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X4SAJzN4YB5YFFeqH6SMqm0XF3oBitIADySf0BLsQ7Y=;
 b=bJFG3a3UWIgFugWwpZIKu2RLWLNrwhKc65EG29CIgbFFl7+2OgZ4+yYpgUCqyc8z8R4zNs4t6TB4asP5DvUuY4DhAjWmqoL4nWliIeQOqFfxjwtiX9ekpi+r0NMuAIPjOqzEuUIsDUooraJyTDEbtJocyEm/NtjeqEC1hyVwpCmopMLIGRzMRNybDSDo01wN6u5wbMzQ+tcOBL356qw68k8YgZPFOonFNAKIgZojdnON4reULRMIRMwQJ0MHBsuwYPyZMoQKX1oZWu+Ub2pVCzK9m2indfhFfwYqBUNxJp/QA6U69t0SNAwyFVGXE1ceqc4hiGJ7WLJR3c+IKQsVAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 SA1PR11MB6781.namprd11.prod.outlook.com (2603:10b6:806:25d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Thu, 23 Jan
 2025 09:25:35 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cd01:59f6:b0f8:c832]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cd01:59f6:b0f8:c832%5]) with mapi id 15.20.8377.009; Thu, 23 Jan 2025
 09:25:35 +0000
Message-ID: <e762abc5-a000-4a24-bf0f-37068a7871b0@intel.com>
Date: Thu, 23 Jan 2025 10:25:30 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/11] ASoC: Intel: avs: Add pcm3168a machine board
To: Jeff Johnson <quic_jjohnson@quicinc.com>, <broonie@kernel.org>
CC: <tiwai@suse.com>, <perex@perex.cz>, <amadeuszx.slawinski@linux.intel.com>,
	<shenghao-ding@ti.com>, <kevin-lu@ti.com>, <baojun.xu@ti.com>,
	<linux-sound@vger.kernel.org>
References: <20250122175426.1369059-1-cezary.rojewski@intel.com>
 <20250122175426.1369059-5-cezary.rojewski@intel.com>
 <1eee8433-d2d0-4801-81e0-35d59a5c7d1d@quicinc.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <1eee8433-d2d0-4801-81e0-35d59a5c7d1d@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0032.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::21) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|SA1PR11MB6781:EE_
X-MS-Office365-Filtering-Correlation-Id: dc4f5602-6d2e-4468-5d57-08dd3b8fe3ea
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MVlYSTROQzhaQlBFRjBaRCtOTkNOU1hITGZaSjJ4bkd2N0svazVRZ1dobWNI?=
 =?utf-8?B?WEtFQUpZL2c5bFQyTGIxSEdTVjVsbGZkNkdEQ25GcXFRaFBZNHp0N1pyVXpa?=
 =?utf-8?B?QUFNMEpIMXNQZEdzOEJkUHZIYzREQ2F3R3FwbTdpY3NjMi9qYVMrVVNVUHN5?=
 =?utf-8?B?NXFzQ05ZNmM5R2svSGZSemRTcktjR0tabFRVTEFqNzRPRFFrVXQ5SFU1TVFT?=
 =?utf-8?B?M2FDaFNsb0cvWTF2T1hEdmxmdkt0dkZMUlgwWXVMQjlUbE9nOXR5eUthMm54?=
 =?utf-8?B?UnIwUDk2eWJnKzNuTzNVb1NmbHc3Y3drNlF4Um0wNWp5UXNPMzJiNDZubGlk?=
 =?utf-8?B?ekxzRGIrd1JSbDNmeHdmWFpEbW9WUkIwdUVGTTJtWWtqRi9oVURKaFg4ZFlG?=
 =?utf-8?B?L293VzNkZnVTUGFFdkMyT01FODFuNExselpPZ2tmNjkzb2kyekI3RVBjS29B?=
 =?utf-8?B?WmpSZCtnQkxQK1pKbjErNnliV2xLOFBQaE10OGpId2s3RGRpOER5YVlOUFlz?=
 =?utf-8?B?WkxndDVnNDNYQTNSUHUzSCtoQWRXL2R5SkVzcGYzdnFLM3VXOHVlWVpKeGN3?=
 =?utf-8?B?Qi83di93TXh6N1VTbVRWcU9YelJPYjBpTS9Fanl6TSt3cWo1d2Nyd1lEdFM5?=
 =?utf-8?B?WENZbHdMZTBFNlFlVkg5RGpWa3JsbXRicjhFQmNPa296V0ZBQVE0SmFqaXoy?=
 =?utf-8?B?T2hLRlRUeGF4TVRBV1cvMDR4aTA1V20rYm5PUWRWVVR4LzNuVjB0ZEJaZHQ4?=
 =?utf-8?B?K1hzWWNUc0xWbGF3MmNwNGJJN01vaTVCWDhNaERIbFQyZ25WK3dWVlhCeW5T?=
 =?utf-8?B?NkFDNE8ybW5mbGFDelVWNjgreUN3M09zRkI0MTBINHlFbkVmRy9Zd2Jpbk1q?=
 =?utf-8?B?azJHcnFFQmhobmEvU1pLUzFTbzNvcnhnVGNnWjZla05xYTRSVlZ6YWpObnJ4?=
 =?utf-8?B?RUNJVXZrM25iYk8rNUIxcXpoZHlNUysvMk1od0pxcWRuZmVoamxETTZlOTYx?=
 =?utf-8?B?bDJJZSt4WWdoOXFGRGNFS2k4SlowNWRrR1d2c1F5RHpxTjJMYlBzOEVVOWNK?=
 =?utf-8?B?VXFJNUNqR1o4YXVsanJ5NUl1N2hJVUdqU3RFNmVaUXE0Y0ptUllMeXExWUxO?=
 =?utf-8?B?Z2R5Njk4MVY5WHE5bnlSSkNPM1BCeUdzZTRZQkpkcnc1MjZ6MlBkM0lHcmNr?=
 =?utf-8?B?UXFUMlhtenAwUy8yZ29QU0xpblhHNGVuRGRFSGV0RTAwQlhiZ1ZLdEhUK2tQ?=
 =?utf-8?B?dVRUbUl2SXh5Qy9KVHBqQitKTm5hRVFVaEpqTjNjUzVLdzV2K28ydHJTeDNp?=
 =?utf-8?B?a3BONyt0bXJvUktQSEdiTGsvbXo0bmdwdmRaakl3KzlOaTVxakJJazhYVTZr?=
 =?utf-8?B?RC8rSTZURXZBcGNpZWFQWDBGQWtoczRoOTM4M1J0alFiRnJyUEpIMmM2MmpH?=
 =?utf-8?B?N0JyUnV3dWVNWElzT3VSNnBTZjNTWmdORGdJb3VnaWpYRlY1aThUdFQ5OGV1?=
 =?utf-8?B?Qk5zRzRwUVZZVmJiRHFLS2VacWFMLzFnc1ozaytad3F5RzJkTGxmVnFjak1i?=
 =?utf-8?B?S0VlY2FXcHV1alVkN0c0bXdXd1RnQzlaWWc0eVJwK2pHZzJRbkdySmRaZFhw?=
 =?utf-8?B?UUdOU0wwUmhlWkFlcWs2MU5GRGJQQ251NUlxQWJYMU9JOUNXdkRhTDV0TEZF?=
 =?utf-8?B?TlR4MjZOODJKUlhBa1ZHTlRjYzl3cGdDUjF4MlB6T0tuVlZyK1pWTEJPMUV1?=
 =?utf-8?B?dWN1MFNpYU1jMVZkaTdwV29tMjlRLy9vU0ZPb0RnckREZTljYjZQdHlpQ1VU?=
 =?utf-8?B?b2FJZTNiOXZ1c2FCNjJpTXM3eTJnWms4QUJGYS8vdzFxVld6bnpuaVlPVTJQ?=
 =?utf-8?Q?OBZ48SCxI/aEX?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6375.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K3hlc1V5NjVqZG1teGpYNEFBZ1o3bXFhc0F1UllqTklNWnlNQTRFT3JTU1dy?=
 =?utf-8?B?M2FXWTJLRGtRMnBHNHN6QTh1ZDVQTGVCZExldVVLMUYzZVlSMVBHaENKQjJD?=
 =?utf-8?B?SnBCTkJXOGdSOXVJUjBQd01hZ1NEMlBUN3NkalpkRmVsdzJiTVRLeWZyMDJi?=
 =?utf-8?B?MlNLSEtROUN5aWg5ckRDbjQ4bmdYSEZDRS8yZkdrV0FPM3EyZFNaSTRvMzJk?=
 =?utf-8?B?SjhzK0t1MzJrTWpuMGNPQ25TK3ExZS9wdnkyRHhYdkF4NWM2U3lmSTRRRi9Q?=
 =?utf-8?B?VUJ5VlRLU3VyQzUvb3o0WVhxMjY0L1ljQkIwSHZxSVpBL3ZHeUs3MGJINkJC?=
 =?utf-8?B?QVZYa1o4UFQ3eUUzWEgvdGppRVo5cWl3T1AvRmxlZVhWeFJ1eGNpMjhpSWto?=
 =?utf-8?B?TXdCeS9yUGdvTDNOa2xRM09PNkdLUjh1aVdqL2pkK3QwWlRoSTdaUmJxK01w?=
 =?utf-8?B?WnpvSGNJTTloUmI3MlN5cDErSGhqZmpYNnFJREhDelM3bXNNSHFXQjh2SERZ?=
 =?utf-8?B?S3JjUi95d3ZpMTNrcXpqRlVtVWdUUzB6STJ1NW9FOWtaZDFJM3ZhbFpsZVRT?=
 =?utf-8?B?MFMwSUIwTUZDUjRWNE9UWmZPQnNlZlpjN0ZUY2VicU5BaDhKYnBFdnlEaEhi?=
 =?utf-8?B?SUl1ZXprRjFhWEJGQk5zQlhScWdKVWlJcUhxdGxnd1Z4SXMwdzVqVHlvd0JM?=
 =?utf-8?B?ZjNBSXQ1U01UaHZOZ2lEZTNMZ0dCblpMVWdjbW9jd3FUV3ZLN1VMSzdrcGN6?=
 =?utf-8?B?U2U2ZU9IYWlpNjdLdWgwZ1FmSnVYZnpEbDRKbjY5V3BvUmRia2taTjE4THBB?=
 =?utf-8?B?czhvY3h5bkxHQlg0MXoxdWQwVXZRMXZRb0dWdjFvdnFXSkN3eEFnaGtiM2tM?=
 =?utf-8?B?eTVrQlFzU0k0cm9wQ3R6M1gxVEdYdlA5MkVqbG1Wd2k0d05wYVp2WisvS04w?=
 =?utf-8?B?aGRQNXY0NjBnV0ZwRTRGWnd2ekhJUWV0L25yY1J0WU8xc0xmd200ZmI5UFd4?=
 =?utf-8?B?UTVIM2FzVWMxaFdzeW44aTYzWWNZNFR5M05QeXgrYVBFNUNwSnZRT2gySUhk?=
 =?utf-8?B?RjFDQ2FPczh0bG9vZEx2Z2VBdU9BSGRRTy9XMjNtM25Cd0J3WHhDYUl1Y1dx?=
 =?utf-8?B?SGNhZHRHL3lETUV4elV0UmMxaHFyZkNxd3E3RXFEYW5zdHJqQzZrMDEwOFk5?=
 =?utf-8?B?eE5uMjJBcVpYZ2FsYXFXdDlTNzdaN3NjenRBYXhDTlM5dXY1bjNOU0xyeDdQ?=
 =?utf-8?B?N2JxaVc2cExBcVRKdXJYM09EL0JxZmNyaVE3amd1RG13ZVlVbGV2NHFQT2hr?=
 =?utf-8?B?a3ZNZGxtYkJXaGQxYTJEQ1JDMnhhUTlncDlGUkVOL0dSZllWVjV1bTFWcys3?=
 =?utf-8?B?d1ZuQ0lpTC9EUWRSbHBOeGFBeFRWNWhaSUlOTEJqa1RVbjJrZ0pVWnUzQmFj?=
 =?utf-8?B?cXJpTDg2Y3plVGhDZVdoR1NMOEg4VEQ4UFNqYzhkRG9nZFFvdDNHRG92QzlN?=
 =?utf-8?B?Y2NuV0hUR0FCTjJ6QXJtUVlENkE2bUxtZzR5NUxmRSttVWxLSlRHWU1uWEFW?=
 =?utf-8?B?SWVKbHdIOXZNdmlDTUpIYzdjM3ZqcnJNMFVXdVJJMkovd1pPVnVEdk9oRXMw?=
 =?utf-8?B?WlBjTGNzd3dKVFVJTVJsMENHNjRxRmdVODIwMjFwSVBkWXU0NUozbmpTVmN0?=
 =?utf-8?B?bGdlVks5K1B3M1JQMzRmcWZ3YTZMMmlQeUVRK2VnSW0wNVJBMmpMUTBRZFM4?=
 =?utf-8?B?bkdjT1oyRnp1VHVqNmxtU2VPalBqSTFaQXpROHdNaGNEK21OV3hzQ1RKR0Zi?=
 =?utf-8?B?aDhpeXZxTEplZHVubkFJc01vb3RUVERWbW9FbTR6aWt4RWZHZzVOMDFoZWl6?=
 =?utf-8?B?NDNTbmZNQ3o2ajdsZjFHK1Y5aytieGZEenRQWHFpZi94Uzl6TEcwSklGUFBX?=
 =?utf-8?B?MWQ3NGFZcmxqOTMwWG1uY0ZTWTVnZUQvRGZBaVhhb21ocVBRU3FsK2dUa2U3?=
 =?utf-8?B?S3gyWFJqbFhtY2VRRktkd1EzeGU4VHo2VVJSUDhDMElBK080anlNRkk1TG9O?=
 =?utf-8?B?L1dQR0JYc0pEb3BzR0NLRU9TcHpXTkhlMkpISGpVWHVpc2Q0dmxMQ3JOajAv?=
 =?utf-8?B?MHJEc2tEd3cvRnBBZk5IWVpnNXRhdkVTUjlrSGhqekxBSkhybDlBQitWRkp0?=
 =?utf-8?B?YlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dc4f5602-6d2e-4468-5d57-08dd3b8fe3ea
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2025 09:25:34.9445
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AAAUUBwYPIKDOiwZmcXg8OcsJy0SnGxUPTdaU/Vd21fneJRNBcpbJjXYeZVGGt9zZgXnBsjn+TQmqVPHOqGX4eulH0v/6BkPPFxWav+XrF4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6781
X-OriginatorOrg: intel.com

On 2025-01-23 12:15 AM, Jeff Johnson wrote:
> On 1/22/25 09:54, Cezary Rojewski wrote:
> ...
> 
>> +module_platform_driver(avs_pcm3168a_driver);
>> +
>> +MODULE_AUTHOR("Cezary Rojewski <cezary.rojewski@intel.com>");
>> +MODULE_LICENSE("GPL");
> 
> Since commit 1fffe7a34c89 ("script: modpost: emit a warning when the
> description is missing"), a module without a MODULE_DESCRIPTION() will
> result in a warning with make W=1. Please add a MODULE_DESCRIPTION()
> to avoid this warning.

Ack, will fix in v2.
