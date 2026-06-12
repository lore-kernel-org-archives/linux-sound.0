Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F8328C2A1;
	Fri, 12 Jun 2026 08:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781252839; cv=fail; b=pFqWBNe39EZ1ABu9msbyiMa9WM1AqjKm4AzJpB2HmonxkYfVC49b8sAk0j6EgouKgml9OOg9yPu5a5Rni8jfsDpKud6nmu+gwPXXGsJEDuzAS7dsR+wgbMC95wqSHJ+AqTa+vw5+1syO9Fi2WIUrVf379bjOPRjqEo7MxRFytdY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781252839; c=relaxed/simple;
	bh=RSr/UBtmxDJT/PBniDjE6ABAPt6uRiwk6Njchh/CvlA=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=CPWBXpPXsFE8B/BwM1GqKIKyOlybX8wNK2Bo9EL+eSL5v15FfSu22Zoy8YD9DMXroqBl5S5IYXxNHh5JKqeMQ50ybunu3h/3v65fCM84v0bddijLMva4JAkY0trn8eEIYA6v+lRQv4xN1eLD4kAJvhNm3kkMPQpdJ4A01Bp6BIo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XRWno5Jo; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XRWno5Jo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781252837; x=1812788837;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=RSr/UBtmxDJT/PBniDjE6ABAPt6uRiwk6Njchh/CvlA=;
  b=XRWno5JoboNmO1ePApgelTG5R1fneogjxxT5RBxTr22+OrthpxdhgPW/
   mWlGp/gMY3DeMdIEDFpIJ1vWWLjIwDYvmbVjIJk6qEIg7Oluw+towrqMw
   WInpqYXEoCPnbjvHT83vmDgnmOZR1fHNj16gIWNDw1XjOVbDb9Uri9sU7
   HVkaq3MTZKoxQ8wCIPwec6Mkg9B0XwLXeQzxYIlSlM5cFTv0rqHwHApA1
   OrmBdW1UBSsdLj2P97HmlEbGi3vsQcSBNZ48boJsQrVImP1Nb6H/OP0Fz
   Wp9Ougus+fY3o066MP77TDcmszyCDCETkFOO7WeS1sPuZ1FyV1h2FVhrd
   Q==;
X-CSE-ConnectionGUID: 1EEAocZLRJyMX0Tm1fxQTg==
X-CSE-MsgGUID: mpvlbsXMRliIR8Mg96F8eQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="92401666"
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="92401666"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 01:27:16 -0700
X-CSE-ConnectionGUID: Ar5FBYLQRUmODW8jl8keVg==
X-CSE-MsgGUID: l0daxyDwSRWCeZDMkBx9KQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="270417740"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 01:27:16 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 12 Jun 2026 01:27:15 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 12 Jun 2026 01:27:15 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.55) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 12 Jun 2026 01:27:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NIvm8IJLjg1pwbm9SsRht/Y2NNvJpW8zLQV1cyN2JJaoqkEJe16kiCn+eW3Z68bAfbsl1rY7i9yn5Gba7yOMAtixdbLovVmRyT4zBI4I4EpVaOIwpYAMjMX+1gJpgqAnIuC4w+STJTGYSr8osuD1YrZwev7k3fAqqB5ZsNRl4zOShnZmPyeJ4FAbmhyO8CM+olMeKM3ySzrJBKLriDZbf7D1figBqIRVfkGSpb8WVHNdq91NJB922bxYQrGCKTc/ie8MgpOKxZ+RlaKv7TORlkrIbAzNvNAakgFSW8jMKXW85CJz39NuaVTVRPK7emfQHg6zKMdYhyTTkLAnYmMTQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cSL0YKpVtAmMEWTROmQw4o1ukgfVRWx78xXi3ytS2NY=;
 b=lX5smmAYtPYZDjaKosM6YL+b3KQ4mNDpqRDUz+J0jQZsGYxdi+U6VBhQJCnXiySROcE9fzTXWcNjljP07I5f40c3uCtyCpItUDYWmlyp8dlpOfjS42aLVhFnjEnGQKa/GqD7ncsSiA+iAzJsfXvAdWaWqsRdylx4VoA2RHLrANnWmB8C1KbcH/7wRbO/MGg9snhi8bWM0dGmOPaitMzL1BchcGFQ6tKOgVDUWcWfVrYh+Q1QPCMNex/962HqqyrPu5StbbvZfNJgcrg4NIZTk4kO5Bn9QxuAvIq4wORRKWjL7Hz5zf/gPo/hSNMQUThB6pNolj0l7t7icd6pHAkrVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6978.namprd11.prod.outlook.com (2603:10b6:510:206::12)
 by IA3PR11MB9013.namprd11.prod.outlook.com (2603:10b6:208:57c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.14; Fri, 12 Jun
 2026 08:27:08 +0000
Received: from PH7PR11MB6978.namprd11.prod.outlook.com
 ([fe80::f60e:1044:67d7:d8fc]) by PH7PR11MB6978.namprd11.prod.outlook.com
 ([fe80::f60e:1044:67d7:d8fc%5]) with mapi id 15.21.0092.011; Fri, 12 Jun 2026
 08:27:07 +0000
Message-ID: <56cae2c2-2fe3-43bc-8b18-f72921464573@intel.com>
Date: Fri, 12 Jun 2026 10:27:02 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/20] ASoC: Intel: Use guard() for mutex & spin locks
To: Bui Duc Phuc <phucduc.bui@gmail.com>
CC: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Peter
 Ujfalusi" <peter.ujfalusi@linux.intel.com>, Bard Liao
	<yung-chuan.liao@linux.intel.com>, Kai Vehmanen
	<kai.vehmanen@linux.intel.com>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.dev>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>, "Liam
 Girdwood" <liam.r.girdwood@linux.intel.com>
References: <20260611115901.80438-1-phucduc.bui@gmail.com>
 <3f7bcbc2-cf0d-4bb5-88ce-fadb8816c6f5@intel.com>
 <CAABR9nH6b8kSQt5w8vPGFiXGH3h+QDQdjKgsF-C3pa2hUh1Wiw@mail.gmail.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <CAABR9nH6b8kSQt5w8vPGFiXGH3h+QDQdjKgsF-C3pa2hUh1Wiw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1PEPF00005B88.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d8::636) To PH7PR11MB6978.namprd11.prod.outlook.com
 (2603:10b6:510:206::12)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6978:EE_|IA3PR11MB9013:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f6645c2-327e-4a08-221b-08dec85c643f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|23010399003|18002099003|22082099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: oN91Q1oEsBQH4dADqnNrynO2JP73rkGOK5fz4GyTk4gaiIVeFfYQHqC9uOFvGanFXhX/ckJI/KdZsCK57ZrfHnMheT/7Vlyt77m12yldxopp5NqEzbAV+nyX3YzGTRODRW7Pnza1ZuUr8atVE+Eb0XLUu+ID5oL4SB5ox2G98D+sS/IgSUFdKba3mrSFouSbCZv1wjO5Rm4MEv3qm2IFPleICzBdzpphn5kACB9lXfUvmPiZ2U5tLPfBTV6vbPNRdBxHoz7lHSzf67ahtysSVUFmkhUh9jm/IbH5OBz3svW7LR1I0SxoUTAtXX41WJWXTA6Au3IePExHvkXT6DMazWfhUDmFYgrsn90fSneNN2iUJA2E7Bh+iVJWoHF2RwBvI5vccnUIc2rUNOYniOz5hIJ1m956cWgeSGIiA8QHou3r1vuOeytuA/xArjVvHQ/UOPU14xSgn+IJjBW4717YHH6+Z6FHNv4FUXjm27ZADTLTIBRGGYO/rzmpFy629WE/tnGbsGA+rJt40sR9pGXe6CK18/aKE58d/8PckDVGJq7RHuXcf1nqpU1QEEh8xmg3Swru4M44DOv33eC93I/NpR+HQISA7VwBFEaN0/S9aCDgkBlsvE6NYm3Fpl0DfO4GG+oX56nyNTHKLSeeNBcg+KeUWxp/hzmn9dnaQ+V5CPa0TZnjgnjGEksMoTK8nUlF2ZrorqQbuYtpmNeCc8cy7A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6978.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(23010399003)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SkdteWRRa25Ha1ExRTVFZHVHOE1Vc0ZueTBOMmlSVGhhNkJwSHJBRUpSenNB?=
 =?utf-8?B?OEJpRkx0QUR6SzA3elFWZFJnVWNwc2NLR3laSkNuVjd1QjQvSTZlL0Q2SVd5?=
 =?utf-8?B?Mk10MVdMeUZUY0N3ZXE0VVdUOGlYRHE0bzd2Wjg0QURZWUVvL0NWQW1nclMz?=
 =?utf-8?B?VEtncGdOTFNQeHYwbDVWam5BTHJXQVp2ZVBUVVY4NkMzR3BVNGJsSk8rRHFK?=
 =?utf-8?B?azFHMzRHS2tDbkdkSW9GK1RCaHcyQmhlN0JNemMvLzFVY0Z4aW5iVTc1TWtj?=
 =?utf-8?B?a2JEd0NIWis3Vk1RRHQyaENuM2toNEIwVjA0NlAvb3pGWkpYUWtYY2JSYVp1?=
 =?utf-8?B?UkQray9xelJHN1IxZTlYVld3aTZYTjJtejRndHBKUTFvRGhqY0htSzFtTTVh?=
 =?utf-8?B?eTczR1M2dk1JV0xoakFpbFlqOWt4S1Fzc3VNVk93WXpqalpkdFJNOXZwdVNX?=
 =?utf-8?B?dEp6REdod0E1bk9vVFpOS20rNEt4ZW1FRHdOMDBFTy95d0pZa05CWXZmM1RW?=
 =?utf-8?B?eGpDa1JES2h6cUVGU0xPd1pReldlcDk4cmltMTlDdjVXaHg1b3FGK0FLMjRD?=
 =?utf-8?B?V2g5dmdQd1dCQ053Z0FOQTd3SnhjYnJpb2JNQVVUcDl2eU4zbmJ4RmRlejhp?=
 =?utf-8?B?bWZUUXNVdDVvdnJwS2Y2TWFOWXFGVkJqZjlCdGNvam9OS2dBek1mMVRHYk13?=
 =?utf-8?B?czZ3bVFzSVR6bmh1bmNFWmU0MC94LzlPMEc5bnFHOXlIS3U0ak84cWxMRC9a?=
 =?utf-8?B?MU5wbkI1MU13cmZZOTYzR3Vzd0tRdHhxMm4xY3MzOGhOUFVaa251bTdhV2No?=
 =?utf-8?B?Tkx1ZjEwenltUExXMmlCcDJpSzl4QURLTVVBT3UxRkE4UzMvSlBsNitFNy85?=
 =?utf-8?B?MnJ4dVQzMVd2RlEyaC90emZ3Mk40MjZoSWo4cVRGeE1la2FGcjNaTWl1bURa?=
 =?utf-8?B?NjVzSThGSHpka282MFpCYU54SEMyVUNQTklaWk9CVjNzNk1WVm9xNjN0dkcz?=
 =?utf-8?B?aXJFNHBJZkw3bEhDRFNTV1lvS3RUbTRUVGl2VFFQdXFoR1FzTHN0V2Q5VWZL?=
 =?utf-8?B?ZzFGSFdRWEVTYnlzNkFQRTQ0eUxxbjlLb3RJaG52U2NsYTQ2eloyOXkvYzRr?=
 =?utf-8?B?RDRCNVVhdnl4MHpoVWVsdkpCNUliOVpQV2wxeDlBMjZZOXFSTEtNUDdPTHlE?=
 =?utf-8?B?YnVRMk9nZzlYbmdWV1RMQlBRUEd5dXVzS1lnRW1qZFBtYitTbVgzZjk2eXd6?=
 =?utf-8?B?UkVQU3lkRWY1c3dYQ1dNdy9GTElCcHlWMmxoQXhrVzVzWEhlZnBSb0dRb3pm?=
 =?utf-8?B?ZElUdTI4SUZHWXg5SmJWUjZVdUx3Wk1vODM3ZDZBY21XQk82QnkvM1dEc1d0?=
 =?utf-8?B?aWFlTkZvSUxjbi92L0lGQXRyWDlwek9pLzd3L29rZ01qTE9qM2lJd1Q3TjBr?=
 =?utf-8?B?emZEZDl6RHhOT01BZUo2K1ZvMmcyUll5YlQwMFJmTmhiNXZRN3BaMzY4cUhW?=
 =?utf-8?B?Tlc1RG9XeTV4S29ISU1SeWh1TzRUcVBObkFHRlppazJya0RRQkZraU1Zbnkr?=
 =?utf-8?B?UEN3NXF5NG1nTWNSVjNFRnVlOVVnN1VEKzNISWE4NVFlaTUzVlBUWGppL1N6?=
 =?utf-8?B?YXMvRzd2a2h1R2pmWHdoRFNHWjhxK05RcHVNSkZvN0kzdUlhaUJDbVZRaE9s?=
 =?utf-8?B?MWd1ZlJLMjEwOFQrdTBjSUZ6NEhBWjhXU21Jd0RhSFhMaDg5b0VBVG93UDNu?=
 =?utf-8?B?RE13SjNUcjExV2k5aVEvT1lJZ3FuelAwUEVOUlRjaWMwNmh1OFo3WFpRL3NB?=
 =?utf-8?B?ZWhTeXFzYXcyeTRmTVdvYWNybXFNNHZ3Y3RVeWkwRFIvRWZhc255L0RyOFZ3?=
 =?utf-8?B?TndiREFDcUdkbFhFS2pFZENVdTZJSlV3U3RLa1ZZNTYwait2dzVIR003UEov?=
 =?utf-8?B?WWxubzFnQy9JYyt5ZlgzUDZqeXpkWWc1QmZRckNlUzM2ZTFZMWhFWkg1OTRF?=
 =?utf-8?B?cUZQQzZQaDdRc2ZxRVFiemJ6WmJzNVdHOXdJS0t3dTBNNllsQStBMSt6NUFE?=
 =?utf-8?B?UytnVWFCNmdWVW9uTUlVQzRRMU96aVZwN3BIYlBzL1FJUWhHc0JCaGJOTEIw?=
 =?utf-8?B?U1ZJK05zREpPVXBwQ1E5bjRxVUxqemplcjd6SFcvMHhtNzVPeEdlUFhvRnYy?=
 =?utf-8?B?K2QzbFJqbytqaW1wZGthbmNldnJ2VVlvZlQxeU9kZENrUE9lWU5xeldvUGZJ?=
 =?utf-8?B?MHdxQ3JyQk1GUVRJVk1qVGx6bDJDNWhBV0RTU1g1cjFsaFVTc3dOb0c4ZGw2?=
 =?utf-8?B?T2s1b3o3Ri91Qzl1WmpTWkdHNFZRWmQwdjRDU01pSGIzL2toaG53aU05SmZY?=
 =?utf-8?Q?pNNETvQRg7qAMqxA=3D?=
X-Exchange-RoutingPolicyChecked: lh2MdHWe4gkGvxh+FJYklDZrE6zK2aoYuXq0eFtyCnOoGNShPPPc47HljSDlHus9pYPeXWT8guCr3ih81UhCY0BrRbwF2HQQr/wcFFbELC/pJG90LsPEanmReF3qu0nP5EqLLReZVVAHD2k+svMIb0Gxlb9S/zd/RQF1p1UW7rfkDeZQDqo34LlX6eDhfjLcrZaBpiAiSOOMJmmHiHnf+hZ6bbyTUS9L0pQpc95rq6nBTvFrKgweTicGL2GPb4Hj+jyV/XQrkxDtGXwS4eTBjk7c/zMHYfcYB3BUrIl6UafgxT29l2v9FoDOI0gMVIib1eDGJnnWz4S4y16D0D5XQg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f6645c2-327e-4a08-221b-08dec85c643f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6978.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 08:27:07.9224
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dTZskrl3ZAGGAENiocPci1x4w4x20USqqOOkbCT7SUoxxx9dcfAbroZ1ohkGAOUIXTNUtGtaPr2E3L0CDuVJ54TEj7WzBHCY35D2kSVFpBc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9013
X-OriginatorOrg: intel.com

On 6/12/2026 5:45 AM, Bui Duc Phuc wrote:

>> Recent changes took care of catpt-driver [1], so the first two patches
>> can be dropped.  While I wanted to follow up with the avs-driver, I see
>> no reason why I shouldn't let you do that instead.
>>
> 
> Thank you for the feedback and for clarifying the status of the
> catpt-driver patches. I'd be happy to take over the avs-driver changes
> as well!
> By the way, since the catpt changes were already taken care of by someone
> else, could you share how you usually check for this so I can avoid duplicate
> work in the future?

Assuming someone is new to a subsystem (here, ASoC), it is advised to 
check the MAINTAINERS file and the kernel.org git repository list [1]. 
In our case we're looking for sound/soc subsystem maintainer.  Both the 
file and the repository list will point out: Mark.  From there, fetch 
their "-next" branch, typically "for-next".  Checking out a for-next 
branch and applying proposed changed on top of it, recompiling and 
retesting solves majority of problems.


[1]: https://git.kernel.org/pub/scm/linux/kernel/git

>> Now on to the review - there is no need to be as granular as you're
>> here.  Two drivers are being updated here: the avs-driver and the
>> atom-driver (assuming the catpt-driver patches are already gone).
>> Sending a patch per file creates unnecessary traffic, so let's limit the
>> set to two changes.
>>
>> Please use the following scopes for those:
>>          ASoC: Intel: avs:
>>          ASoC: Intel: atom:
>>
> 
> I initially split the series more finely because I was thinking about
> bisectability,
> but grouping the changes per driver also makes sense.
> I'll rework the series accordingly.

One could treat the conversion of open locking into guard() as 
"feature".  If a portion of such feature causes problems, it is usually 
better to revert the feature, fix the problems and apply it again.  When 
reverting, it's good to do so for the entire entity e.g.: the avs-driver.

At the same time there may be no need to revert for everyone e.g.: the 
second driver, the atom-driver, if only the avs-driver presented 
problems.  Per-file would translate to quite a few reverts, again, 
unnecessary traffic.

>> Last but not least, your name and surname are not capitalized.  That's
>> clearly not the case here, in the cover letter.  Please adjust.
>>
> 
> Regarding my name, leaving it lowercase is a small trick to quickly find myself
> at the bottom of contribution stats (like LWN:
> https://lwn.net/Articles/1075574/).
> I capitalize it in emails just for communication.
> Unless it's strictly against kernel rules, I'd prefer to keep it this way.
OK, thanks for explaining.
