Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25FBD425CF0
	for <linux-sound@vger.kernel.org>; Fri, 22 May 2026 14:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779460344; cv=fail; b=jd6EyIQAoBK98dbV0O0Zr4zBWZIkg/3et9GyJ/R5pVISPSFOZltdSGMhRY+9gBirlQAJxjf9hqI1QtZWa2tvrXE2EfMHkIPA9MDVSs4v/FlVeWLIW8KT6aMI16MVEwXl1EW0nL1GmwqK4o1M0MbdFSlHu6MRXl3iStELcUAPBD0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779460344; c=relaxed/simple;
	bh=4HxZiDmuPCpfbmIqHDraqbT7Tg8Ej8PhTeCoJxjyzwk=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=p26Ku6vt4iOXl5++OPAs/W+MsW1t5nfTY0FGaQWlYLYjn7R+LKwy53D7ZR+2YpQaRUnHeb1mibghguTSSU2BuOgEcSpvStPjw3VP+UVc5n/7FbVDTb7+lndBrxE2d785dTkzRtv4wyW+DaW8d1js2xF4AsxdVRSy+GTjrHs9Xac=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=klS92Mbu; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="klS92Mbu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779460341; x=1810996341;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=4HxZiDmuPCpfbmIqHDraqbT7Tg8Ej8PhTeCoJxjyzwk=;
  b=klS92MbuqRxIiL36yTb6DmIDuf2bpOUyNtGR8JGta0QjiDX6gN8iJq/+
   1K1pppNZo7GOFt0jgOu+UNUCDDuck97kzi61QJB7ZNUFXtP4PBPuhata5
   WkrMYUxyhwCix+sJBLL5pVglN2rQaiTF/VBbiEQpzYgPCgKpqGLr34pMH
   swfnyhz7uW8oZTurYLOKQUWCgU9mAGojGDM5hJCPk0fjC07NlRp7mI4Hh
   DM4H8OzZdq/V0AC/Q3ON1t3eabpMnRxP9kX6gOrwubvRhlAmMvgxZUPY7
   UiZS6qkKqyUaWLVe1g0qflnto54mKXxRnAHsmHmBsXw/9BIm9VcsOWzUh
   g==;
X-CSE-ConnectionGUID: A5alA+YBQTS6SnVHVPdzMA==
X-CSE-MsgGUID: cqOMOSfuSMqjgIgZFzxAjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11794"; a="91861751"
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; 
   d="scan'208";a="91861751"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2026 07:32:18 -0700
X-CSE-ConnectionGUID: Nh7pZVzBSKGbaO4VgOQ+hg==
X-CSE-MsgGUID: k+7g/I2KRtCS+lxd9BX3UA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; 
   d="scan'208";a="279037130"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2026 07:32:17 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 22 May 2026 07:32:15 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 22 May 2026 07:32:15 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.22) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 22 May 2026 07:32:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JXMpi8EmhgBiH4Y9rOWZntkC9dPjK3ONgg6c1FV7Wn65r4/JbenfdC3ugq6U1moRCaDB3rrpwSEiqOAkbuES6Ip280MpoxQxq+70N5fpaR975uWWMPZ8qOY/py9xMfFH1NoOz8w4LmO3BPa89IysLZ9aIOtnpgb4ZuwLdjgCa7sQUGulJvqFVOJu1a0ODKm/ehQbTXyD3jLPuW6BijvI2OZXhhzb0E/1Vlj66G2JylUjlMX/43/T11FTd/W3VmADNdNOiJHMJEQUjzCyp2IHi3pYb65RBI2fHHmwvG21kyqh9jJytL0st6VQ51GJ+53qSxTBxrqKtFJsGz9GZYY6kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wo2Rd+tqAIg24KhkvitDsBzxtM61XQk6f/7/MD4UCgc=;
 b=Y982ewxSVhnr9kcdjoIytnEc5ySPBLC9FaB7L2OaGAE1uh4UMs/sxHXlYhvlqsCu0zbp58SoV1LOUqMR9xpViv+lmQC0azqSntOgN6plNjx2Fd3A0/pa5TKu8UHL9Xr9LY2U+hOgR8yBGibWVTnZ0+BtxPELF+Mv2cwqIUlLIW+LKYZslKEfioRnBoYjtafKsMdWK/vR3GN+TAUKdomIC6c89XR7hYS48IGT4oiWHobE204jDr7Wu0OEpLDi/AZByJOLwUnPbUevyNGc6gpWkhUIeN0rgBt3OA+n/MjNZ+NEygNJKHR5Q+r13WS9glBWiphivPg7Q8lNMXlna7Wr9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6967.namprd11.prod.outlook.com (2603:10b6:806:2bb::15)
 by DS0PR11MB7630.namprd11.prod.outlook.com (2603:10b6:8:149::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Fri, 22 May
 2026 14:32:11 +0000
Received: from SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4]) by SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4%4]) with mapi id 15.21.0048.016; Fri, 22 May 2026
 14:32:09 +0000
Message-ID: <5d8cbbfb-3884-4c6b-aea8-0c9a76964b3b@intel.com>
Date: Fri, 22 May 2026 16:32:03 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: core: Move all users to deferrable card binding
To: <broonie@kernel.org>
CC: <tiwai@suse.com>, <perex@perex.cz>, <amade@asmblr.net>,
	<kuninori.morimoto.gx@renesas.com>, <linux-sound@vger.kernel.org>, "Liao,
 Bard" <bard.liao@intel.com>, "Vehmanen, Kai" <kai.vehmanen@intel.com>,
	=?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
References: <20260430140752.766130-1-cezary.rojewski@intel.com>
 <01d1d642-bf24-4ef4-a30d-56884300407f@linux.intel.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <01d1d642-bf24-4ef4-a30d-56884300407f@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI4PEPF000001D6.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:808:1::851) To SA1PR11MB6967.namprd11.prod.outlook.com
 (2603:10b6:806:2bb::15)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6967:EE_|DS0PR11MB7630:EE_
X-MS-Office365-Filtering-Correlation-Id: 36d628cc-b006-4d09-22de-08deb80ee819
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|3023799007|5023799004|11063799006|4143699003|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: eJZcnjV0Vs/Q5+Q9UTcsy9xY27QsKEC1PIA77sCP05EmeifqLkYD4Wa2opdFK5uAAqt4SE3vk63pDew6SPyUpqt38TTaJvA0GxpDi1Lz3mpvSmW805wozqVEtMJq5CJrofMbWu9pVetNpHkzrYolkRcZlpEZeW8E/a5Phfww796g2S6jlHWGjCdlGdKh8BEiyqba25MTw+79M2Lr6jShlW7lIj/GL82abQFJos0Kd4nsJ1slBq6LLKz07Bo2bYsXxICf0/3Nam/mihC/tP2g96x/xsSdAa+lnBpJJGUV8SA/AEhKJaALZ8w3cejb4AmfyN8qVbiwTy8RjnedYOjZQ449TlNYJpfL8+/OphycaOC0Ou8q8WX1PR46Bqzyk+N/JuFJeFwUhxA/jmQTdWaQbn7Snri8fy1ZrNQ9FPf3h997BXQ1BiPZ5j5yMQBEiNBFvZgIjB0HJSDhflctDC5vu8xT5g7bnYEHxuBpZa3oD92CTSmRpy4uIGHOrifwMurS6hOqHzYNvLpuDgfLrIURR7xd5h8AjhNtVU9Rwms77EFbN0kLF8GcO9e37L3DlBGG2pgriaujoe1rmPR07oJsQNt37HTAkPh3FZQojIGjTDZBqzfhE3XhatujjLVu5nPULSMMlIKLMVyrSjGeoOUbMjVhGNmkQnhP+TOh4/TaC9+wMGppU2rJ1qpIBvkexSCCXwejYyZpYYJDU80SQq8rgQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB6967.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(3023799007)(5023799004)(11063799006)(4143699003)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dUVaRXJWTUhPV1pMTFk3WTRxREpjN0F0NVBkZmdtb1RuWThvbzkveWZGTTdQ?=
 =?utf-8?B?WTJLUFI1NkJLclJGR1J4YVpjS0Y5L1R0Z3VTeHdsSXloY2cvNFF3OGlMSDlm?=
 =?utf-8?B?UE5OSERTZUYrN21yZDd5Y0VBdkMxZTJGVFlEVnRaSzdQVmlFNGJZaXlCdllX?=
 =?utf-8?B?bXdlcjM5NHdJNFA5ZHR6OXByODcwV3J4MDZQSnZBcFBDNzAzMkdvYXhTSlNI?=
 =?utf-8?B?RStNL25WZDhZNnoybVVvQVprZEwxN1VkNnNmZHVya09jbHRHdEZidWVNUjM1?=
 =?utf-8?B?eFNqUU5TckZ5S3hmRWZ3Y1g4d3d0RTdhUHpYakVTOWxMUUJZWjNqcXI4emxa?=
 =?utf-8?B?OHZKRWN4OEg0R3hCbFRkd2hEbExQNG43QkpkZU5iQnhZeUVUb1hUa2p0V3Rm?=
 =?utf-8?B?Z0IwR0ZZdXJ2dkZBS3RXNlNNYmh6c0kvZjZTUzl2NjZGQXhWMzlMQXZqcnR3?=
 =?utf-8?B?R1J0NVRRSDBmS0cxeTQvM0JlajFuS3V1U1psdVRueVlOTmN1RjAybmxMQ0RN?=
 =?utf-8?B?dHhHeWVJSDhlQTlyek80d3E0SXg3MWJBc3BUdkl3VlZPdHlDVWNxR1JEQUFE?=
 =?utf-8?B?WVRXb2FCaitpT0YzNTNmcnZCVTFVSUxXQklzcSt5SlE1WGZNbU5zT1dDZ2Nq?=
 =?utf-8?B?VjlEQW1oMGE5N3R6SHRHZUZ0UU9vazdGRmwvY2V3OWhzRzZyaWx4cDNWL0Np?=
 =?utf-8?B?Um5mTlFMdW9JVy9ZdW9hYnNQdjBNVm1UUGpycm5BVXRKbVZsNDc2THlPeXFt?=
 =?utf-8?B?b1ZLcFdlS2pvWlBIbmRwZ3lWbmxzbU84UHRsZitxSG1OSDNDUkp0dHlZdzIy?=
 =?utf-8?B?WDlzY2tvcWh3TFUrQVl4VmdlU1RCN0dNUFlWVWpFV3JXWWtDcW1vK25vTTJn?=
 =?utf-8?B?aUtjWHd5UmNsYUZuSVNWZWNGT3dxZFU0WHRZSStZNldudFN3SzdqaXZGb294?=
 =?utf-8?B?dGgxN2VqOFUyWEtUampRREtlWXNSNzJjN1U5ZExPMXBNNGZrT0lCc0g0SkRw?=
 =?utf-8?B?ait6czBzUlJaRzRGV0FFMElOMlowNlZQZUxrN0FZTGRkZ2hpeG5PbWQ3OHY1?=
 =?utf-8?B?L2hhZnJ6eWdEdGNHUFBNWEFPKzFrT0lJdXpHUXBpSSs5eGNvYVlUYTloZ0Ir?=
 =?utf-8?B?czcrMWFod25GVjlUdzBzME5lY3hsVytFckZ4ZUlNVit4dk4rMWx6cVZEc0U1?=
 =?utf-8?B?amlObDZ4VDYrUjdVNUVIdXBSZkhQYVREZ0d3YmtSMGpLMzEzSFgvMFdUVXlF?=
 =?utf-8?B?THdLSGhDRXllWFY0OEoyYXZJaFp5NXVGOUtDWC8yZFA4cXJ4TElDS3FKN2Uz?=
 =?utf-8?B?WGhJOFJnNUcrbjlaWFVMTTBJQ3hEUGdXWkYrcHIzNGIxNmhyM1JiQkpjcU5h?=
 =?utf-8?B?aWxuR214TDJ4VjlSVGVvcXpJTTExWlJBSVlQSllVa2FzRitXdTYrR3FRUGM0?=
 =?utf-8?B?SXZTeU1lR0NmRHNBcDk0Qyt3by9kaXFlTE05NEFJZUNHL3NBdEVvSXh2TVdH?=
 =?utf-8?B?YU1uQ291bEdEWk9ZUTZhejRLSW85d2dvSGd2d2d2V3d2WkVqV2ZQa0RHS2E5?=
 =?utf-8?B?ZWVKYXFMQVJENzBqVGZJdDdHbStMSWdnRlhqOFltRVYyRHJaejNldmtWTjN3?=
 =?utf-8?B?OE9JemxjWUlpcERzdVdsbnJ5SEpJZ0c2ZWgvYkNtNTJYdFJ3MXpXWks2b2w3?=
 =?utf-8?B?V04veHFZelE3UXV3U1F6aGxkKzVqVVFORURMWmFzZmVaUk5reVZHNGxXNnRU?=
 =?utf-8?B?R3ZOZlBIWW94UmwwbE9yTWdOSmEyZE9yY2IwL2ZWN0J2RmlVQ2xBTWpqOHc2?=
 =?utf-8?B?VnBNWVY3WHhIb212SGE2eEZBQk45VDRBckRqNGxnZVMrUFExY2YvdHZsWUpi?=
 =?utf-8?B?UnBEbmpOMDl4RUlzTkhtZXlqSlRHazFkbW8zNDhEdlNyZjlrUjhOY3VEUVgv?=
 =?utf-8?B?WXJZZzFCMU5sTndPWG90NHZxbXI2bWU3aUlEK3FTeTFZZm43MmRuUEl2bWJ4?=
 =?utf-8?B?WlpXUTJBaUFBcmhjNzdpamppTE1sN1JFSExrN1Y1dXkrQWxmOFl4eEp1Vzhm?=
 =?utf-8?B?c0ZZOVhUdTU1MEMxeE9MaTc4VkRWcUlrUzVCOVFibHZLNlFiYkNXbU10TENN?=
 =?utf-8?B?SUk1L0k2NElVMDRTTkpwODNSTFlnaEJETSt6Mi96ajdLY21QbmRZYkpveXBh?=
 =?utf-8?B?Vk9CMVZPRWdXcC9IZFcrbFNVaTJneC9pZndVYi8ydGFKWHM5WDVtODVveC9U?=
 =?utf-8?B?U0dDbERXUDNFSk9rdFBSZnU0YjJiSVo5SWliUlovaTdZcUp3TnExNlBsdkpG?=
 =?utf-8?B?R0laZXdDR3FIeGM5a2ovS3Y2R2lTeEdyT1lCdHljUncvanA0S1I3Tml1YWU2?=
 =?utf-8?Q?Gkh8UwmK8Kz8nkmA=3D?=
X-Exchange-RoutingPolicyChecked: lxfEuS4gPAvOeEUpoZF/imzM8p0Lg5sqwsJsfLsGQvh6HVhd+1VlJit9loyVqkrxxsH+UFsmTV05fLT4X1HNVMiKIXEtg/NYvZk15KzQg05NpsBCQKeQXlH0mTTdno56HuUUIcrP2JAxDeKR9vfCAvs3cTFmzecNPlasRoh7cCF82l2qTzcZD10r6tpqLW/lXz3da5obreVTka0hSG58/rNDtVI+hCn66HwYMCLQWwYS3meIBTeMny/v+R47pGzw1QKi2c2OW+dzywym4VwYjBpy02I+SJKl+EI02QNWnA7pms9+tTag0YdZhiGhHfPEBZeUt2UUHy9cuknS11ygbA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 36d628cc-b006-4d09-22de-08deb80ee819
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6967.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2026 14:32:09.8869
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fvtS2ZJvymxx7Xsol0X3uVHCgWifpVaOP4F1XvkYJbSjOMHomtEfU+5r4QaHTrFThdrzkF6vmqdj1f2lCYsZVlC6/haN6UNPs6EfncVa6qo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7630
X-OriginatorOrg: intel.com

On 5/22/2026 12:16 PM, Péter Ujfalusi wrote:
> Hi Cezary,

...

> This patch showed up in sof-dev kernel after a recent upstream merge and
> broke audio card probing on some devices.
> 
> There are no errors in kernel log, the card just does not form.
> Reverting only this patch fixes the card binding.
> 
> The affected device have 2x sndw speaker amps, 	1x headset codec and 3x
> HDMI PCMs.
> 
> It is likely that one of the codec's probe happens after the card
> probed, the card is not created for some reason and nothing happens.
> 
> rmmod snd_soc_sof_sdw
> modprobe snd_soc_sof_sdw
> 
> will create the card, so it is likely that going ahead without waiting
> for all components can and might break audio on system boot.
Hi Mark,

I've had a debug session with Peter today (yes, right after one with 
Alexander) and the outcome is kind of an expected one - dependency 
issue, TLDR:

// working case:
1) snd_soc_add_component(sdw_codec)
2) snd_soc_add_compoenent(sof_platform)
3) <sof card is probing just fine>

// failing case:
1) snd_soc_add_component(sof_platform)
2) snd_soc_add_component(sdw_codec)
3) <sof card is MISSING dependencies i.e.: components>

We're going to ship fix for the SOF within a week or so.  ASoC-framework 
behaves as it should, no fixes needed there.

As mentioned by me early during the discussion [1] (last paragraph) 
moving the ASoC users to sound-card rebinding may reveal issues.  With 
the change applied, ASoC, perhaps for the very first time in its 
lifetime expects its users to respect sound-card enumerating rules. 
Many users do not have the same coverage as the avs-driver solution and 
problems such as ones reported above may pop up.  I believe it actually 
fortifies the need of the change initially proposed by Kuninori - enable 
rebind for everyone - as it gives us a chance to finally address all 
those dependency issues.

The question on the table:  Do we revert the change temporarily, fix the 
SOF first and then re-apply the patch again?


[1]: 
https://lore.kernel.org/linux-sound/0dadcf51-12e5-4bd2-82d4-4a815d7c2d83@intel.com/


Kind regards,
Czarek
