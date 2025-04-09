Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCAEA15689A
	for <linux-sound@vger.kernel.org>; Wed,  9 Apr 2025 13:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744203988; cv=fail; b=a70r4BJ1GBxu/X+8RP+PSTO5ot2l6JfhXi7BXXedqpJoyV+istWyg6XdiGp8l0h5zB/IJytyAchfLAKPkGa0vBllEq6czBno+N+8Mqs7J3fRak6PG8EcD4STMquNjuYhpUrDtCgCCvI0HtgNvpaK3e6CEANkn57QsSjXU/SMWp8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744203988; c=relaxed/simple;
	bh=VsUwyCoWehYf4Stk5zT7SszMIVtT2UYpgKg8iGyY4ps=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=fKJ/M6M1usouZZ6zIgEZqVafuxn3kQqPnVjqAq69mqiXUJ6DjvpL1lTNK37642QTXfSB8DPGaNia3bWfl+1xV513EVupaV8aoHKvY34n4o5a2oYuwyToTho1SIkBOc1NUycmaWyFjjNEW9L8NWgC3cDzWclvap7vC8Xii23apOU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Oth4X3VA; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Oth4X3VA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744203986; x=1775739986;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=VsUwyCoWehYf4Stk5zT7SszMIVtT2UYpgKg8iGyY4ps=;
  b=Oth4X3VAvZ5JciABfez/ZJYJ9K87yF41v3UkEB0/zGA/oh940pFcXz4L
   DBH8oOrkBOUyiNn7hzvcXRG3jpU/sFTZOv5URtdkFXEDgyoegUYRdU7oO
   sZ2WKA/hxc07fb+A9MVZdJzdmcDAebjBKmgHi5N3cXlKdNFnlw+jTKHeB
   a18pXaRKeCluYyaIi0CKMAlY8Ea1v0e0xK+WnxYjEVuKg7/lKtki5obSd
   lCW/hvcEAAHgDqgGUl/d3jLzbhMgvQFuygwfDWgcz7tdRAIg2UAcDse+s
   qMfFuKm3CUur925VD0urDgNvYuBB3BTgzwwvbf8eRTboTj76bxrtoqKdJ
   A==;
X-CSE-ConnectionGUID: 3g3CpCN6TKeDJdBAOvNVKA==
X-CSE-MsgGUID: 5fy10oOuTCanTPYXXHe/ZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="56660558"
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; 
   d="scan'208";a="56660558"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 06:06:26 -0700
X-CSE-ConnectionGUID: goWm7ajaQaWRRhJhN8V3/g==
X-CSE-MsgGUID: rJbeHn3DROecJ4E3k190eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; 
   d="scan'208";a="133790803"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 06:06:26 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 9 Apr 2025 06:06:25 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 9 Apr 2025 06:06:25 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.47) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 9 Apr 2025 06:06:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rdjoP3mbYix3JiEyyINZl8O9G53tIAMb5i1ql8M9pkp+DYoQUVE6Gs82rHG0jWbYk8w7LLHd3uRR7iOolpSXoU1l+sBIRgrxLSeX8f9CoQ7B4pThpefoYCJo8BwP7mNzmzMPYWmf+l98ylkXhZq1LU6DHln68l9QGrDQeJl+wyavSptMR2ABYJUumzscL9gRFGCOBy2UsPCgM+kPXjHQxr7YtJY+H0whedijYqcBGNTXOnrxEY8BTRm/NrlYJ+dYnMYlvHmnkSgLt7RC7Tksm1QcIfqpQvqv0c4AFBxmUhY3rOSxTa3iqsJNRVPtNluvfLTFb+eVZWm/9lQD3Z6luA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Md5uXgqJ7qLaMkIRjg7wn+XVdi0wAf2xjnWwhrwrXeM=;
 b=rPhFFenSFg0DwOHWHwpc2fJhMyUvsfGPqz9siAzMobKUqtdYaeQqDVhlw330xJBFo8EFQzz9DQ0JzBacKnjJXbaon+6oaCPGptM8a1ZSLBORJ0z28lG3pXvZiW2IBNCJqMX3arESePnCerKHOro3wVZ8TrCM0FwCFR3sARX64Ha9cdIcxp2DgAQdote/pNCAMPYyc3QV0+0P9VFdIAxaqtqJRtz4WF+DnEfPb1LAgFTIuxaWgGZ9v0+t2r2twe7hPyghDMucu0nxQe1mbxEP+AieAnN7FhzMaAwuIpGJGfXZ9VG0O9XtVaoXdz7xmSD7TOhy6MbYm6Gc7y/fc2cX/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 CY8PR11MB7009.namprd11.prod.outlook.com (2603:10b6:930:57::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8606.34; Wed, 9 Apr 2025 13:06:23 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cd01:59f6:b0f8:c832]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cd01:59f6:b0f8:c832%6]) with mapi id 15.20.8606.035; Wed, 9 Apr 2025
 13:06:22 +0000
Message-ID: <76ac86ea-d29c-41cd-b00d-72059acbcb93@intel.com>
Date: Wed, 9 Apr 2025 15:06:18 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 00/15] ALSA/ASoC: USB Audio Offload
To: Greg KH <gregkh@linuxfoundation.org>
CC: <broonie@kernel.org>, <tiwai@suse.com>, <perex@perex.cz>,
	<amadeuszx.slawinski@linux.intel.com>, <linux-sound@vger.kernel.org>,
	<quic_wcheng@quicinc.com>, <mathias.nyman@linux.intel.com>
References: <20250409110731.3752332-1-cezary.rojewski@intel.com>
 <2025040930-catalyst-calcium-a707@gregkh>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <2025040930-catalyst-calcium-a707@gregkh>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA0P291CA0011.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::23) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|CY8PR11MB7009:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a73b0c7-89a2-4bd4-2447-08dd776753c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eE8rM3pYVGN5TGtsdnYvSjNBallwUmlpQ3RhRVFnL3hMbjFoc3R3TEFiNWoy?=
 =?utf-8?B?cDR5N3hYSXJiZUxrUUVLL1UxQjZOeGk0WlBRcHFJNFFaV3g2YTZhQ1p1QUZs?=
 =?utf-8?B?QUdkZDhDcnhuMDYyT1U0cHVCNXZTOXZ2VWFrSnlpOTc1eE05TThXNjZreUlS?=
 =?utf-8?B?OC9jOEcxOVpQenl5VXBFazRKU1daNGRQMEEvZ3UvWVZSYXhmTnJrZ3hTWkJz?=
 =?utf-8?B?MXdXZWUydGJOUEZWS2JOOFdpc05FQnVBc29pa1lmVmF0TVZ4RTQ3KzBYb1c0?=
 =?utf-8?B?NHVDS3V4RnFONnZIWUx0bmN5UHFDaVpOVE1HTWk0a0ptK1ZuZ2cyc0dlWlM1?=
 =?utf-8?B?OExReUdxOWFPQkZqRE9SSDUvRVZYOXJnVVJDU1VicHNJazJqQzJvQTdicHJT?=
 =?utf-8?B?dmtQVTh1cm5MRFdCV2d1RUJmVjNBMjFiNmFzVHRMRU85QVhHYU01OVhOaDJS?=
 =?utf-8?B?Y2VuQVJmUUtNdWsrMUJ0cDgyNG9lK2d6c1lDYmhtMjIzcnhMQll6VlNObW1k?=
 =?utf-8?B?U1pQb2tCU2hFdkx4OFlIZFdjY2Ztamw5Z3U5RUhET1U2dm4wenpBN1dDK3JQ?=
 =?utf-8?B?VEtYYXk0M2dqZllTMXJSUkthR28zdWFVM2tENHpXMUd4NkgwRGNjS3lkK3ZO?=
 =?utf-8?B?aTJ4WmFaa3Nobk84amNuMWdzTEdOLzM5U0pONU9NWW9oVnV3azRJTm90MFJj?=
 =?utf-8?B?ZW1wbGJIbFVvaFdqa3FTSW9SRERaaGdxZDlzMXQxMnRKbkJFajRIMy80Vy96?=
 =?utf-8?B?VFFUZ1gzY2YyRUdsYWZPcEtEMFlyOEE0R1lySWh5ckUxK0QzR21pNXBmRHpY?=
 =?utf-8?B?WDlYVmt3ZVlPTUc2R2d3c3hwTFdXT3FSZUdVSjEzblhwbEdmRHFRcXYrYWRa?=
 =?utf-8?B?bzNQT1A0OC9wTXJUZUVuVXlaaWFCMWFsQXVlb1JCSW1SLzErVWNoM0RQd25t?=
 =?utf-8?B?ekM0M0RVVEMyMzJ4WTdabFVaeWtmd2pGU2hXbFN5Z0d3TE02SHZkK01Jb0lT?=
 =?utf-8?B?M2F2RFhadkdPTE55aVJ1QW5ETHp1OVA4aFp4c1M2OWNGWUNCQTNGTHJDUHRa?=
 =?utf-8?B?S3dlSEt6VEpiN1ZtSDY0aU0zWjd4aCtnQ0VraE9zWEs5SUY1bmJ0OE81V0xy?=
 =?utf-8?B?NHFKbVNJMk1vcS9wQjg1ekJ5SlI2MjFXTGRMNGdnY011QWlpaFFrRXU1T3Ar?=
 =?utf-8?B?V2pEQit0SEplNVNlWEtsVnZ3RCtsUVpneGt3VUtmcjRtMlFEdWU3U0w2ZmZ1?=
 =?utf-8?B?eEhpWDNkcTFCcTU5bGZxbzRESktTOVFwaldmOVRnYlczSDRrZlh4TXVrSWJN?=
 =?utf-8?B?N0w1NDBLZTZMUGtjRzd2UjBuelJDRUx5ekxlTWhxMWxRVUlXbjdlYzZLckJD?=
 =?utf-8?B?ZWlsNG5YSFFtTWg2aTE0NjY2T2R0NTBTdGZJSTB0K2pvdVQrbmhIR1BVRlRE?=
 =?utf-8?B?WFpUYXk2K0RhYWZHYnpkK0xrOW0zckFIcGtWOXpPMDRmbmNGc2NOZVlaZThY?=
 =?utf-8?B?T1VtTlh4dXZyV0tGS1dERGVvdUZ1QXIrdzY3dy9TdSs2TlVwMXRhb1RyZEYz?=
 =?utf-8?B?TDV5Y1JCVFNFTzVHdlNMalNqa0RLRlJMVnlZUDBSRkswQjNkbzU1aHVMRytJ?=
 =?utf-8?B?T2U0cUZDNjMvTllPOGVoTzZVWS9pdmlOdUVEN0QwVGZWZ3lZLzJoRFFUWUhv?=
 =?utf-8?B?K1E2bzJhQzB5Tm81Q29VRDlXMldFZTAxSW1xRzNOcFprMGJxM3VZQXhZOHJr?=
 =?utf-8?B?aE0wUzJFckxLcGY3VmtBRnRhaS9sSjZsTGlMVHc3NHB2LytKSjlvRHlVdmYy?=
 =?utf-8?B?V2NvU09VMFdxRjdMZTA4TlMyRHRFMk1KRDR6KzJ5ZFg5V21uN1Z1ZXNHZFd6?=
 =?utf-8?B?ZXdhUi9BaXJwVlBCc3gvZHhwTkdIdStDeTJOYUpOODVpRzdiTkp0ZDBDL25u?=
 =?utf-8?Q?MH75b4CrMO4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6375.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TmJJTWtDVVE4bEhyMUxLYzhxQU5VQVVsSTlYVEZWNGlIK05KT3RxUkg3dzdo?=
 =?utf-8?B?VlVkRDkwTzhScnRmZ3IwaTh0cVQwNE1sTVpmQTVFcklLMVcvcDBSVUx1aUVJ?=
 =?utf-8?B?bUp1SHovSXRuYmJ6M1lQZHFxMzVERmdVM01DdWxDQ2tGeWliQjhZdDZOdGw4?=
 =?utf-8?B?ZFZ3NFd0V292Z1lFbDZQNXQ0SEdleFBpNTZnQnprV2NEcW5uVVB3VFhzRnVC?=
 =?utf-8?B?cDhPUEh1SXZKeFY0OEdpcGM2d25OaXdDZjR0OUhiSzRRdDdEbGRnVUY5dWpn?=
 =?utf-8?B?T1RRNXlqaTVFL1E3SENJR2FuSXplQUkyOTM3K3pMYnZZNzhwWS9VcWRBbUNE?=
 =?utf-8?B?S3hYM2RKeWZTRDN4NUFsUUFiYjJoNks1aFVHc0lrUGsxMDBmTmdJbncwVVFH?=
 =?utf-8?B?b2ZZQUZmblF0WmlwaGlrSGFiNmhSWmJFZzl6ZGVHSmJodEliUnZyZndXU1pR?=
 =?utf-8?B?RUpUYmphWkVjclYvRGZvaFpIbSsrZWlrdWhpNXBkYlM4bFhjRnVWSHhTenhn?=
 =?utf-8?B?Z0RwbXAyVGNMYkVHZmNwVmtFTHNmdzR0ZXRpQ09ZVUpPeWJoSWN6aFR2aHpo?=
 =?utf-8?B?cHBtT2lvTmdRMDA5bjNZUExEa3grcFNVS0NmZ0dTNjRrSEQ4MmQ4MFNUcDlQ?=
 =?utf-8?B?YTlvK2JGQlM1RjZpOHVnWEk4T21QUithR2dyditRUExGcTUrYVVEZCtOaURq?=
 =?utf-8?B?T0NoWnZVYTNIMmF5UTdiRERwTWhPL1ZiOGRtTlo1di9lZzhUTUtDNUJuQkx3?=
 =?utf-8?B?SFNrMlYzZ25YRlYxbVo3NHBoMHBWaHY5d1JxRS91SnVVVWhRV1NkRUJDWWdm?=
 =?utf-8?B?Q29tbDNWN0F6MlVJVmc2OENIa3pkQjgxZXVMYjZCUWRwbFJ1UkRqbklmWWJ1?=
 =?utf-8?B?UlZMb1JBTkNaWGlabGNmS0U5WExBWmpMQnNGUkNIOUZJdTF6ZFVKVmN0b05o?=
 =?utf-8?B?SU5FLytyQ2VqVFB6UmRLVlFWdlZsUlAxUTFiMExHYitjclpTTjdEamJ1SnZU?=
 =?utf-8?B?M1JZR3o2eXNMa25rV2w3QXNIU1VhNnEvRHlWdDl4NUtvbmtjeUp6Nkd4Si9y?=
 =?utf-8?B?T3dCTmsxc0cyMGZ4NXNsVTdjL1VBaVZyb3NyTFNyZlcwODljSm5JZmtsTys5?=
 =?utf-8?B?ektTWWp3SkZIblFvR0FZN2tMT3hRWTlLYXNzV1EwMFFTMFF0V0ZtdXBLV3VN?=
 =?utf-8?B?YXZoQW15SFZ3TmxVSWdEOHF3d3NCWkhrZW1XUkJ4U2cyS2FuUjJESDRSM3Zi?=
 =?utf-8?B?UThUcHN3SmgvYWZuNFI4SWZpVm9Oa0Y1Qjk4WjQvSmNycmczSXQ5bkpqN2dO?=
 =?utf-8?B?emgrQ1VXb1VlVys4eVVWbEdKa09zZnk2NTZBUmM2T1ppektCSk5rZ3FHRnpr?=
 =?utf-8?B?UExWYTNqak1CT2hxOVNqU1RhSFg2dXdwMStvUXdDY2hNMm5rS3lRV2xYejlD?=
 =?utf-8?B?bkh6OHhxLzgzQXR2SXAyb0VvckRoek5udmx6c3lCU3BibnZXOThlOHhxa042?=
 =?utf-8?B?YVo4Tk9sa3lsRStBQnNYN1h5VnBISUJlL3h2d085aTdUVHR6MWsxMUpGR05F?=
 =?utf-8?B?eGxLK3A4UTZZcUdVUmhMdzFoOHpBcTBxV3Y3dVhvTVdEU1Z5cjlKMFc5YzFS?=
 =?utf-8?B?dUszTVZQQWQ0ZGhHcXFNYzlzdHVJMDlXd3BjdUlldDlSOW5wa0c0Z1BWRWhx?=
 =?utf-8?B?N1BpbWo4TlJxdHByZ29pZWR2bG9oSUZ1OXkyNVNDdnVtdGZxK1Y0NzFZTm84?=
 =?utf-8?B?SE1LNzZqcHpsYWdNZ0FVTFhoMGFwTGc4ZHE3OTQxeEswMWdPZW9TdVU1dFlT?=
 =?utf-8?B?ZVAxTW1ENE84S0UrVG5kV1AyNTJGb2ZpZHpueldmcnBVK29GRTd5blQvK3Yx?=
 =?utf-8?B?RWtWMytzUTZsdjBISTNDbW9zVE96VWlwSWZwUTYyR2VRclFKNGtYaWdTS1dr?=
 =?utf-8?B?dVZOcERMMEFZUE1nZXRzeWJzRWlqbFZCNnY0K3RpNXZCSHNpcHZiaFBiRnFv?=
 =?utf-8?B?eG10R0pNT2R2bnVaRFBIRE9CeXN4TXFSUGtIUjVvNjZHQk9scnZVUmMrcklC?=
 =?utf-8?B?akZDS2ZYandFb0loRUh4SXpMdVcyakFLYy9uSndtb0lGUjZRS0dnbUo1SW9T?=
 =?utf-8?B?NzFxZ0UyeG43RUZXV0VRY1dVaUNhUEwyeUZmUFZ3VzEvd1h2QXpRQWd3OVBs?=
 =?utf-8?B?anc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a73b0c7-89a2-4bd4-2447-08dd776753c3
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 13:06:22.8279
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: upCPIUP7auShBTmf4Y4gd+RZFHpGHpU6FpwXNYSnm1TkrciokBAJ71O/r98cqMjb1ZXFLS4KP0xf1RYkwqg7SorcdcdgxmJJnay79IQdR3s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7009
X-OriginatorOrg: intel.com

On 2025-04-09 2:10 PM, Greg KH wrote:
> On Wed, Apr 09, 2025 at 01:07:15PM +0200, Cezary Rojewski wrote:
>> Note: this series is based on Mark's broonie/for-next. The xHCI
>> dependency is missing so it won't compile.  Goal of this RFC is
>> discussing the direction of sound/usb changes.
>>
>> Note #2: Why exclude xHCI?  Current form of xhci-sideband.c [1] does not
>> fare well with Intel's hardware design for USB Audio Offload feature.
>> The production shape for usb/xHCI subjects is being discussed with
>> Mathias.  Once we're ready, I'll share the rest.
> 
> How is that going to work with the patches that add xhci offload that
> have already been reviewed on the list?
> 
>> Note #3: this series does _NOT_ aim to block QCOM's equivalent series
>> [2].  The team does acknowledge that we came the "table" late.  At the
>> same time, we're prepared to help QCOM switch to the presented sound/usb
>> approach if that would benefit the framework and its users as a whole.
>> Make it part of this very series if need be.
> 
> I don't understand, I'm just about to take the QCOM patches now.  They
> have been on the list and reviewed for years now, why hasn't this work
> happened before now?  Please work to make your changes on top of that
> patch series.
> 
> So what do you expect me to do here?
> 
> confused,

Hi Greg,

I wanted the effort to be transparent, that's it.  Given the size of the 
task, I've decided to get the feedback earlier.  I believe asking 
sound-maintainers now for their take on sound/usb is better than coming 
here much later and shooting everything at once.  If the proposed 
approach to sound/usb is not welcomed by the sound maintainers, 
obviously xhci-sideband additions that will arrive here later will be 
impacted two.  In regard to the sound changes alone, there is no 
intention to blow up the parallel solution.

TLDR:
Work present here will be placed on top of the QCOM patches, no question 
about it.  xhci-sideband.c will receive a number of changes to cope with 
Intel's design but nothing the list haven't seen before.


Kind regards,
Czarek
