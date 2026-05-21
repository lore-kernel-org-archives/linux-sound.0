Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DA662E7F38
	for <linux-sound@vger.kernel.org>; Thu, 21 May 2026 08:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779351235; cv=fail; b=pYkbCoyXabttg15OTK4d3C6f+p9cZtPFpJLFHRinL+jtwradP0ZvzbSP2MNAsgUEi2I1Pu4CuGThT4nNzi7exdGhcXloB46HwfY3hp7nZstisZMi2cBJh2r51TCKJvmb9LabG+3lLuokOiNgcNffggy82HYMOZk2JYfX96ZE2dQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779351235; c=relaxed/simple;
	bh=Z1u1gngi4yLGvru84X++xcgnXSHNjTuxSAtJsWTcCg8=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=N0bnDb7GZBaUZC/RUiLYIQ7aTFduKzQXhvLNp/uvCjFMhzxdDVciFh0BXNc/jSaKok6K49clnPAGOdaXSZYooVe1r+MkGSjCkt1UK92p3RVOjjVAEBI+MVjvT82Ieb223XQgPrzMC1pUGcbrAyN7BZRTClFYIn2KRT53osdwhhQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fp1ubpD8; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fp1ubpD8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779351234; x=1810887234;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Z1u1gngi4yLGvru84X++xcgnXSHNjTuxSAtJsWTcCg8=;
  b=Fp1ubpD8awV7qMfL4lPYhciq3YqJpXZQ8xiJN0BJ5T+Dy0X2SJlUS0ML
   L2gWoDN5okETBMSg3rWx9cF3Kd3cDbFFL/pUa0SztNbv9q4qUol9WKCxJ
   NZmqvhWTQHSbgGVCVfgM12kUPASQmgw8aMkkO5sso1m0tMH38Zy9JYTht
   onvu5fBwaDscnz8qmV+4KyY7o3i9bRccPn0Tnn8YlWWNxrd4DUxRfYDsx
   sC7k/DhEb/8lcNP76S5NaptZnxnJ8rYfhDltYe6SDA6ZSv1zC/8gObZIe
   sP4QR8VHIKBmG1J+n2ztMhsa2A1fNqBtjXqA4eT2le5fOsLroMLpTAedS
   w==;
X-CSE-ConnectionGUID: sbj7jHVSQWmLjtbMIsyyTA==
X-CSE-MsgGUID: 4wmyg/ivRryGOwR10JEyGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="102940437"
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; 
   d="scan'208";a="102940437"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 01:13:53 -0700
X-CSE-ConnectionGUID: GctdDr3mRXSFgar4qrrAuA==
X-CSE-MsgGUID: jugE+IwHRbCEn4dJAziUcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; 
   d="scan'208";a="245496507"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 01:13:53 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 21 May 2026 01:13:52 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 21 May 2026 01:13:52 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.63)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 21 May 2026 01:13:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bd11I1NP16TyhSNECQwx2HzG/h9DanXgADM+kLz/EYCJcITQXeN5lgekvVjF0aadw9J2olO0+9+/ol1TN9q5bvBaYj8LQ1mT/sCCEmyxONmW+dnSrOlTM9hGJPTtIvSJB1Qv6MSl+/w+Q8AygwLxQ16+okojj0p9IL5jYFoBYDX8adsxEN/4PH/Zf2AAUI/TDgcTc1YfcEF3nVRfHkMSXylo4p66s7gakw6nN7o6sM9c7z3YkitQOoBJr/8Phl7dF3otq3ZfHMEIWyaF/nVeHX8W1z37hUm0TrWgf2PAdHIbBY17foMxdLkdm4wvEXVPT6A/XKGyjgA/IEfSaBVZoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QqVGGbSwVmZymup7liQ9tqosSpU+I3/7XFv+gokhK8w=;
 b=HdnhkY/5ka2CbuN6jlDKxfslX65GOQwIxCqbT5HrE3Z70HL9xYkBMhY8/dgJGwJnQkTQajZyWaQ3Z+9Sa8E4pwZSNxvdiHBZDln3VtwOv7l+jd5dlw1hecRiGDlz1UugpO6ehv+KtlCcD80fEdWiCMqEMbpgR4Zk9MLKdEGCtZ64MEMxrTCMR6lmaGOHQznHBCbK1GxqHLJ0ukgGCJkNDAWUXzXeR4TTYRx7cU86flsbsWELO6FsTeErC6gUt25gVGNt+Tzvi1gEGoIFRoiJoi2wAFcqbuil43lXd2ti12x5UKtxmUZFCACDHz4p2ZGS7j3G4OfVdIM71ZmlP281YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6967.namprd11.prod.outlook.com (2603:10b6:806:2bb::15)
 by SJ0PR11MB5086.namprd11.prod.outlook.com (2603:10b6:a03:2d1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Thu, 21 May
 2026 08:13:50 +0000
Received: from SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4]) by SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4%4]) with mapi id 15.21.0048.016; Thu, 21 May 2026
 08:13:50 +0000
Message-ID: <77942519-5c7b-48ae-a709-6529d0577e98@intel.com>
Date: Thu, 21 May 2026 10:13:45 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: core: Move all users to deferrable card binding
To: Alexander Stein <alexander.stein@ew.tq-group.com>
CC: <tiwai@suse.com>, <perex@perex.cz>, <amade@asmblr.net>,
	<kuninori.morimoto.gx@renesas.com>, <linux-sound@vger.kernel.org>, Mark Brown
	<broonie@kernel.org>
References: <20260430140752.766130-1-cezary.rojewski@intel.com>
 <3045975.e9J7NaK4W3@steina-w>
 <fd995eb5-31d0-4037-b5d8-2ef3a75ccb95@intel.com>
 <3949821.kQq0lBPeGt@steina-w>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <3949821.kQq0lBPeGt@steina-w>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0040.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:22::13) To SA1PR11MB6967.namprd11.prod.outlook.com
 (2603:10b6:806:2bb::15)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6967:EE_|SJ0PR11MB5086:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f4cd186-9489-4bac-2d11-08deb710e3c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|11063799006|4143699003|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 65UCcrbBGLitocaAFxNOV4/KAFLdJgVKrAGaZx4sy/o/Z/G1uenYRtgkbKhwSEdVce/cn9qIsZeeL1xVXdOzdecwzOzjx8rTh18k+i/Ou/N/9RieVLL1LJLP6GMO2qYL/C+4L2/F3tAid5nkqFp1YW6y+YwN2Ke5eOXTYR81pP/MTr7lbBdSaghskMEuUaK3568JSqfB1VFt/bW7pEjazMaP7loPPqRKYfRoYLw7u4+029MFJ2LSutfvbw3WmAQ7btkLejCRPx15oVV6DrlI6f7ZPd5EfP1pNhXCUOCPHpMjmHQd/2cUDtcLn9nnqS6jDUt/s4bjyVDxBTX0AAnF0ug+iW0ttbIRd/b72TGD2f2/Jc8Vq9VRDra+QME0UIx3WnByjbziHYI4rjt+itV/+7LrA1O6ERTB9MGpe2SAVF/3T+eJsI1Dg9DNEMarX5LbsZHSp+ZizYXhXS2x4rM5yqYwe+Oasjz1rfLOZaAoKM+4fQcUVIq/8jZW0TWUhKHEuSsxXsJJ12DIoHkwAL1kxVm8tROOIsr06ASPK2W9+XbOdPmlAcA1pZkoTtG0Qe9fbMe1aqxtgiOuKx6rWj36NIlj45oR2UXvEKN8DWQk0iLkwmV3eXvyLV2hc7IAtfAzAQK7yPX4y6GWP9EP3ElMy7obJ5+lL/flmgnUWZ4DLDltF/IAiJIBbZBz/jnpjdc8
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB6967.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(11063799006)(4143699003)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MWU2TzBpUmVKNmxCUldxdVVLR29LVUI4WnkzRmxiT0VRbTlEbC9BZ0puNVQr?=
 =?utf-8?B?NzVPbWxhOENxMmpqdHVXclRiSHh0R21IT3ovdWx2enFxN21jT1NMNllqM3dB?=
 =?utf-8?B?dHBrWlNubWVVYnp5emZXZXJiNW81RHZrT3RpTXFnUUVvQ2JRbjdUZjlucnBq?=
 =?utf-8?B?alJxQTVWR0FraUNhL1AyTXJCQVVDa29IVzVCTzMvQm5GM1BiNEN5SDUvbEhC?=
 =?utf-8?B?RXovd0orMGRGMFlWK2oxdTBkVkZqYkViOW5TTnYrU0xodkZtenJiZ1hCU1BK?=
 =?utf-8?B?MEJrZXFDdEhUd0pzcmZhelAxSGprZXc1bEFmT1EwdW94dGRPQXNseFVvWkNW?=
 =?utf-8?B?UkxOREpLTHRZem1xRm94cE1DeUo4T1JaY1lvQ2NNN0JiSW9kWjFTWVZ4Um42?=
 =?utf-8?B?OWRzVHdVelNUOG9WWGY1YURpUGZRbnRzbWpZWUlncTZnWGx0YXJrWHEzK0pH?=
 =?utf-8?B?bzh4a0poZnUxd1ZjVjltT3VPYkhOQlZmYnZFd1VFaGFZL1BKaXZkNmxqN3hQ?=
 =?utf-8?B?OUlJeDRRNXZ4OEtUbFpvQjdlT1M2YUdITUY5ajdBZlc2dzNCM1lsS0kvN29r?=
 =?utf-8?B?Mmo3SVJzaE5FZk5DcXp5c2tqZ0ZuWmNwTUo5MG1MYXNUaU5MTUMvaVNuMThr?=
 =?utf-8?B?VVJsUEJ6aFcreHp2VmdlTjJLbkQzZ3V5dE03bXU2c0g2eDRiSk5CSlZWaU9a?=
 =?utf-8?B?RUpjUHZtbFllbW1EN2xVMlNNLzJUVWdWa0hFV3crNEpDc2FjdE9HcjFDWGJI?=
 =?utf-8?B?REpTMmNYSTZWZ21xeHpyb3ZsY1VJZWJpUW5FdFVqTXF2VXcrNFBsa1pES0tl?=
 =?utf-8?B?YTAwTktRZHVuRzdhRFFXSHpnbnJ2RmFhZUtQOWd6RVdvOHM3TVJMSjR3VTVi?=
 =?utf-8?B?QnBGNjRFTXdRQWx3d2hBcG54SDVqdGdkUWFBeWtiUWZURHo1TWNNTjRXd2NJ?=
 =?utf-8?B?ZGsvc3MrQWFMd1RsTzh4UmovcW9ZRWpDSFh1ajZtQkFlSTRJRnpRajI5ODFt?=
 =?utf-8?B?VUxSMklRSGhROHlQT28vVXJHZzNLSkdIaWlQMGlabjNuUDZLWGIvMzBPQklZ?=
 =?utf-8?B?bllOT0lQanlJY3pjT04wWG41SnJ1aXR2MTM4Q3I3Yi80b0E2QmJ3elFxbzRK?=
 =?utf-8?B?L0N3Z0gxcGg3NXpZSU90Sk9ZRVVRSFE1RTVzNFlSZmlhWkJmOCsxZ3BYYmVk?=
 =?utf-8?B?RGw0L0ViUytDOTJ0Qm0zclBwa21NczFqSTVZVHgrZ0IwZ3ErRFJ0OTAwekhY?=
 =?utf-8?B?VU56Z1FLTUhSTkdOcFJVOFRMaUtwRzZUVW03QjN0S0pndGFGckF2WTkrbmk5?=
 =?utf-8?B?YmNWNVV2MWZFUnJhUGNWZEpUOEN1TWdBcENZeGU0ckhHaEgxYzRvWk5UZWl4?=
 =?utf-8?B?Tjh1MG5BSEJ2SG9OcWZGaytkc2tBY1prc0JGU2krRmVCTjYvclJ5UzZIR0M0?=
 =?utf-8?B?SFVtd3JUMXBYUnBURTlMVVRwNW9SZi9KQy96T3R5aEQ3dkZsaDVtNFdWZ0Ex?=
 =?utf-8?B?NHIzOFc3NUxsK1NPeHJZR0ZoeDVERDUyb1RCSzJ0ZmQ2WFJUL2tsdFNTK1lQ?=
 =?utf-8?B?ZzJsU0lycFZUQkk1R1hNWm5LeDRPWGVEemFkRm1OZzNhQXhpeWdNWDBadjh3?=
 =?utf-8?B?V3ZQYURnS2FmZHN4aW9paDFvVTgwTnFNcW1BQkcvbFBkcnZUU2RPQ0swUE01?=
 =?utf-8?B?dy9EY0M4Vk5pMHkwQnpMenNndFNIOGNjYm1KeFI5Y0tqTnl3RWtNSW9SdTdD?=
 =?utf-8?B?V2ZyeVdOaEhhV2pDVXZiaUJJVW9lalNWSTlLOG9na2x4R054UVh3L1pXdGJ2?=
 =?utf-8?B?TTFqWG1ZT2xHc0w0Y0hhdUxvT08wMFFUVEJDWEdmWG52MXNRaFpYSzNOTmdJ?=
 =?utf-8?B?SG9aanJYRnlrc2ViKzNjRkZkSkt6NWNNQ3VlWS9CME9ucUJodmZZampEWlJE?=
 =?utf-8?B?bU1JQmtYcWdjZ1FzTEVHSmpVWjZIR3ZiTS82RVRQVXYzdzladXRmckVQdTBL?=
 =?utf-8?B?ZTJNK0lNOENMT2k4MFROK1pRRWt0eVhBZXduYnRWOHVEbS82M3RpZzdjOHZy?=
 =?utf-8?B?QmkyNTltM0IrUWoxQWpoM2dwWGpqcElha2MrWWwxNXd1dGtSU3dsU1lhYWsx?=
 =?utf-8?B?S0JjYVI4bnY4UHpqUGhLUFRQNHYyc0w5N3hCdk54NUpKR2xqNG5HQUZTbWpT?=
 =?utf-8?B?azFEUFBsZERzUm9oZEhNUFUrdlBlYy95amEzZGhwc01sVWs4RytuUXZTUUxo?=
 =?utf-8?B?b3hxMi9CK1A0cTFnTm00OHNDV2RiMFZBZ1ptVTdxMGpMejQ3M1lSNnpaVTJr?=
 =?utf-8?B?UXBjTGcrNE9KeG1SNHlwdzNJOHo1TGw2Y0YvUnJWbTAwb05vdDVPMkhVaG11?=
 =?utf-8?Q?mT1/BLqQx60upIFo=3D?=
X-Exchange-RoutingPolicyChecked: k40cwLrP+kfi9jQ7e0iaPsoq4yiFWrqHPr2tjY+GK7Xd6FYY7JgXVYE1zwzN/lygzGqIjsvJwzJUZpAce8nl4Jc83p83C7mT8vRmfGgkLNRtjJ3pBn2u7V2YlPiIUbsL/O2U0eNnveACB+z1dfZB6hPDd0qK4lCUx6xXK/5t8uJvMncRDhA7ehkfonUT+A1vtDNRwa5K1EWVZNi+p2rkplahCwpYnFzVef0bj2eHcEYUp9PMI6WKcjK3TPTR4Olsbsj36M2iVQF3uaN2JraWBSzYZQCaLSwvsZ0xxdZUhe8Olw4L2Qn2ETk+a6BEST/z1vcTEaA1iR+4TxEtF/ASzg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f4cd186-9489-4bac-2d11-08deb710e3c3
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6967.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 08:13:50.2780
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ngxrd1P9B9eHCdNnsJ2STxh8s36WKG2CdN0pt/P3JHL1aiTVdEHocvJkSreuoS4giO7y7CQfUZV33q5XnUgVO4AZZgyoUc7mUpc38ODpb+g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5086
X-OriginatorOrg: intel.com

On 5/21/2026 8:42 AM, Alexander Stein wrote:
> Hi Cezary,
> 
> thanks for the quick reply.

...

>> Sorry to hear about the problem. To really see what's going on it would
>> be good to attach the entire dmesg with:
>>
>> options snd_soc_core dyndbg==pmf
> 
> I disabled HDMI and xcvr audio, as these are separate sound devices, to not
> clobber dmesg. Here is the excerpt from dmesg including the first and last
> snd_soc_core message:
> --8<--

...

> snd_soc_core:snd_soc_dapm_link_dai_widgets: tlv320aic32x4 1-0018: Playback -> Left DAC
> snd_soc_core:snd_soc_dapm_link_dai_widgets: tlv320aic32x4 1-0018: Playback -> Right DAC
> snd_soc_core:snd_soc_dapm_link_dai_widgets: tlv320aic32x4 1-0018: Right ADC -> Capture
> snd_soc_core:snd_soc_dapm_link_dai_widgets: tlv320aic32x4 1-0018: Left ADC -> Capture
> snd_soc_core:dapm_connect_dai_routes: fsl-asoc-card sound: connected DAI link 30c30000.sai:CPU-Playback -> tlv320aic32x4.1-0018:Playback
> snd_soc_core:dapm_connect_dai_routes: fsl-asoc-card sound: connected DAI link tlv320aic32x4.1-0018:Capture -> 30c30000.sai:CPU-Capture
> snd_soc_core:dapm_connect_dai_routes: fsl-asoc-card sound: connected DAI link 30c30000.sai:CPU-Playback -> tlv320aic32x4.1-0018:Playback
> snd_soc_core:dapm_connect_dai_routes: fsl-asoc-card sound: connected DAI link tlv320aic32x4.1-0018:Capture -> 30c30000.sai:CPU-Capture
> tlv320aic32x4 1-0018: ASoC error (-22): at snd_soc_dai_set_sysclk() on tlv320aic32x4-hifi
> fsl-asoc-card sound: failed to set sysclk in fsl_asoc_card_late_probe
> fsl-asoc-card sound: ASoC error (-22): at snd_soc_card_late_probe() on tqm-tlv320aic32
> snd_soc_core:snd_soc_register_dai: fsl-xcvr 30cc0000.xcvr: ASoC: Registered DAI '30cc0000.xcvr'
> snd_soc_core:snd_soc_register_dai: hdmi-audio-codec hdmi-audio-codec.1: ASoC: Registered DAI 'i2s-hifi'
> --8<--
> 
> 
>> Now, listing the clocks won't help here unfortunately. The patch works
>> on the component-level, clock details do not interest it. Also, could
>> you specify the scenario? Is just a simple platform boot causing the
>> problem -or- do you perform some specific test steps to reproduce?
> 
> There is no specific scenario, just booting the board causes this error
> during probe.
Thank you for the confirmation.

I've forgotten to mention - please also attach the equivalnet but from 
the system running the previous kernel (one that causes no trouble).
Now, would it be possible to receive the excerpts as attachments? The 
timestamps are also welcome - in the above snapshop, all of them are cut 
off.

Kind regards,
Czarek
