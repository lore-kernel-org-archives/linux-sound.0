Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80191235C0C
	for <linux-sound@vger.kernel.org>; Mon, 13 Jan 2025 09:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736761329; cv=fail; b=s+d105zw5SYNSNXRAE+qfH2uPAeDkHQfBSQ+fsh/7Zsu0QxNdVMb/MFce4+qBwJ7tJlHLlK1y0ipVsdDBXiJew/NKYD9bpH+md8Z/nkQvhyLO7V7BdTkU1vEYoY740tZ8NkQZ86Uf5Z9d9ioXcO/26igLLwSaGlIm5Ahyt45ko8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736761329; c=relaxed/simple;
	bh=b5jLZAu2y3gOk82OoxjG08tU681LH/xq0zy4ujeHFP0=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ssrdRCVJ/bgFCN8NVLSf9N6MTaHl3ovLZCoH8fHlDniU2YoIynOAtDz6rQj3/S4cfIYLDP5Chq/pgGlqefx8OVP9CgdjijiOfNhHRjI4U/3z+F/sVOJ0mQzoUJ/Nln7dX/DvHDNglv1XI1VhySY4bCDCM044ygm8UM5Ifp5Gh20=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GuogSL7n; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GuogSL7n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736761327; x=1768297327;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=b5jLZAu2y3gOk82OoxjG08tU681LH/xq0zy4ujeHFP0=;
  b=GuogSL7nrBE0srGOQHN1s+ftn7Oq/UlxJLZw1MXBW2zXVwTK6nLegjfY
   CZRPlavfLFolbQOlHNZjmnwpkKBHYBAknoLuJAJHqEzLGLQkpGyjK3NYm
   3wNGieuyokFIZJdnnbthRjkrx+QFkYJY/9kF9yoOCdKcXfUdqmhj4Qshe
   NCyFcTBkbWR9MYTFroznPKjrZQwNDvRwnttCsfC3kJZ8g8lbzDe/hHVT3
   zWPNoMx5HhqOV/GbBbPP3AlbgON2md+jxHqL8IxrnAeI2+WZrUAZnrgM7
   /Bospd0NLNUvb6mbALDZHdsm+Vc446L+LPN8tFbSIZqb9kImrk0Gm9FQl
   g==;
X-CSE-ConnectionGUID: d26sKOg9TGKnCIYZrQEqww==
X-CSE-MsgGUID: NeQhs/35QDiajfxxq/UcyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11313"; a="39827619"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="39827619"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2025 01:42:05 -0800
X-CSE-ConnectionGUID: asEFXbkiTFuhACoeN3zfuA==
X-CSE-MsgGUID: jSgNzkohSzCHkJT/7pCtMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="105288604"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 13 Jan 2025 01:42:04 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 13 Jan 2025 01:42:04 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 13 Jan 2025 01:42:04 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 13 Jan 2025 01:42:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ROwg8fGv5KBQoog9ZbK0j1t3CvTlP90Xp5vHTsh9NCN56Zl6tLD5pGQ1PLGbH9BQEKZ3BxxPfhk/h1d7TA68wALeHpN4E0kUpzIJjIX7ud45Vsc0/FUkeDlnQ4eMu8zXeClvdwwK1ua6stxnJATDbtlS9tbXp6bQm3EptstfLkkntsxG0gxXwe7gXDXamOyvHOyP5UUjAADukmLauhNAJzlqFsHwLv/TfwKZMBTecPLr7TWrB5wNdkRlny0tHO1EJoopa5nPlPwUnaIKeMM37yEBf8J01W8fOunXzaC8y2netQD6ImCSzjhUpPn+NEhV1bFDF4cirF2J8AtZxlf0og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4jVarFyZZlzlsOqw3FyMVbw0AgkS/eIHbNgrAXJBK6g=;
 b=qhJXyhW8xTuydajVBDoEWauNLBhXzSAfF2huZk0H0k2Y0ZFCkgmYn1oJ998kZ5PfUvvjfcDQSR1C+qIOszbJH1CidlWS+PAJxYgSA55vswq1/VmkT7QC3FxWRmLcSV8gHSLckGxePQdI6Eixyn37Tb9BYYyBHl6wXJayTF07hgCx0LQdDIG0zsmJpMMsKPK23fVbwwQrE8Y0Of/pWWDI6nfX8Rw0qbKjhnIM/wZ3cj+yhA9CH/6u+jLq2KcDvVp0fPQsEoaHg7TX93livDaJVfgDjESdOQj3x61NityevePvLKYtl1joHKq6I/NALMN2EybcqzK3IE/6oWzJlEp4mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 MW5PR11MB5858.namprd11.prod.outlook.com (2603:10b6:303:193::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Mon, 13 Jan
 2025 09:41:21 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cd01:59f6:b0f8:c832]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cd01:59f6:b0f8:c832%5]) with mapi id 15.20.8335.011; Mon, 13 Jan 2025
 09:41:21 +0000
Message-ID: <fe5bcb7e-ae6b-4915-ac08-3a1e0eca62db@intel.com>
Date: Mon, 13 Jan 2025 10:41:17 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/13] ASoC: Intel: avs: Add MODULE_FIRMWARE to inform
 about FW
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
CC: <linux-sound@vger.kernel.org>, <tiwai@suse.com>, <perex@perex.cz>,
	<amadeuszx.slawinski@linux.intel.com>, Mark Brown <broonie@kernel.org>
References: <20250109122216.3667847-1-cezary.rojewski@intel.com>
 <20250109122216.3667847-8-cezary.rojewski@intel.com>
 <7c857d1f-e520-4fde-9b84-19b071fd8390@linux.dev>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <7c857d1f-e520-4fde-9b84-19b071fd8390@linux.dev>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0025.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::6) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|MW5PR11MB5858:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c2fea98-bb8e-4c14-debc-08dd33b66fc7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TWR2c0lxR1FtTmpjMzAvNkVwaXlwTWZxY0Q4dDZRWWtBNExIN1dpTk14cVEy?=
 =?utf-8?B?S0hhZFM3TUNreTBrTklJSFM3OVhJd09KeTZJOGNJak9kYXovaTljL01wUnhX?=
 =?utf-8?B?aENlSndBRm1sZHc3QStBZW1HMGYvUmF6SENIN2R2dGhIdXFwdkFWTHRrT3Vy?=
 =?utf-8?B?Y2ZOd1Vjd29Nb1poU2lLZFNiM2tJVGVlUjQ1RmxsakVCVXlCSGkyMlpjWTlI?=
 =?utf-8?B?V1pIWjR1aWkxYUUwMnNTOG96M3B0VFQrZk9VdkxkSFVTa1NqTlFZVkdnMDJM?=
 =?utf-8?B?c3ZSeThpaTRid0xNT0I3WkxTSWM2VmV0VGhhTmV6TzRkckZOaCs5bUU4dGxE?=
 =?utf-8?B?SUhkUllWOUhHckFlbHpxak1wOVhuMDZ3cXl4NmlyMnQzbklSSUtHa1FNdnFI?=
 =?utf-8?B?TnQvelVYbUNiWGdDTFdSQjl0U2N3c1VBcmtUckFXWjNmZ0hGQmt4NWtORDNu?=
 =?utf-8?B?RzUramhRMlc4ZXFiSzlZQ2ErWmQ0U240NFV1UnZSM0VRVFVISDNYd3djMEpL?=
 =?utf-8?B?VlQ3NzNLQ043QklyZGl6T3BnY2l4L3NGVTR4MnZWTmtxemJPZG1jd3dKMjd0?=
 =?utf-8?B?Z3VhRzhNNEI5cCtzY2xlei83VVp1ZGJFVHdYSk84SHpKbmN3bE04YzJySFZB?=
 =?utf-8?B?Y1Jwb1Y0Wm8xSTVwS1pmVmxZMzRMcmVkZGwwcTJYUEpaTStTZGcvSCs5RVIx?=
 =?utf-8?B?d2oxSGNuU1hEVHBDdW1ibm10TisxU0RFcVJCYmg3OTVneVlTdEcybGF0Skor?=
 =?utf-8?B?a2tKWWkrTlFabEtHTDBSMi94aEVwVGVKNDBONlpuTGhDdGg3NWNOc1l1MUhp?=
 =?utf-8?B?akdGaXlxRTNVZmJwTTNBcytDeGljWjZlMmNtRmVQVWxvQ3FBTDZJUVhnQ3k2?=
 =?utf-8?B?cDdnVzJkVEZZSmlZVmdLMjJGek9vVHpOOE1wSFRRL0JzK0ZlL0hUMmFzTnAr?=
 =?utf-8?B?UWVmUzFIV01iTWJPWG94aDVkak9WeHhaOFdvVktHSTZPT0VGbVdQdUl1NW1O?=
 =?utf-8?B?bXJDK1l3M2dEa3RHNzA5aG41aW5UbXQzZ0NXWHBVVXZsaUUrVUZ3RmViZ2Ir?=
 =?utf-8?B?V1BVTlA2S0lnaHpUZ3RGOVdEcWtOZlJWdjg2R1ZUd2MyVU4yVWk0Q2U1MWpk?=
 =?utf-8?B?aUVyZlA1dk0wY3JNbEpXQTRnR0R2dlZDQkxuMUM5aURCTDF4OS9OS2Y0RGFJ?=
 =?utf-8?B?TksxRjI4RjVEdzFudWRLczBrS0txRkxyN3Noek52a3ZoWXJHTDZDWnB0Ymlt?=
 =?utf-8?B?NzBmeFAyTVhpdGJ6elhtdUJyN2NSRFljOSsrV1dyVDkvS05rMjNmaXRFcDZ1?=
 =?utf-8?B?SmxYL1ZaZVZnNEIybzhCeFpFbXUxbEZZTkl3WVJvemNKNjNjeE5aOFpZdUxw?=
 =?utf-8?B?WXUrNWtsdnFSOEV4dHc5VlhWV0cyM2w2TE9YU2ZZQzdJbjQ0Syt0S080SkNl?=
 =?utf-8?B?TElNYTB2Qkt6Vkloc2hjbEUzYlQxbFEvbGozSE1LaXB4TFppdkdnTW1zSEtZ?=
 =?utf-8?B?OStqMy9ZREhsR2NYTzAyaHl6TTlNenIrSXZwSVZXVkdyL01FYzRNSVNGb2pu?=
 =?utf-8?B?QlRaSGhkZUY0OW5MNHlpd0lSTDloS283R2R0QVdXODdWcnErQzZHMWg3Lytq?=
 =?utf-8?B?bmJyd1NzSXJWclZxeTNDNUd6R1BsY2JLZ1BwL1E0M0twT2phRmVqRmV0V0p2?=
 =?utf-8?B?cjRTTE1kdzhnU0hvVHlKKzBscUYrQnJJd1pTclhSZTdYZTlHVWlUWUQ5a2tz?=
 =?utf-8?B?eisxdk9vTGh1dUdRSHphMUVMeTdQRkZkSXJRRGI3dG1WdUlLTFRjcmdLTDY5?=
 =?utf-8?B?eEI0eTl5eTY0SVJMZjFOOWd1K2xYZjNlcDEvZE0ydzZjV3NLVm5Wd3BOL1c0?=
 =?utf-8?Q?roI4DngQeE1fM?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6375.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ykp4UHVnNHJBZlZadVZ1L1JLU0NkRXl3VDJENG9YZkJuNzFXNGY1c00vM25v?=
 =?utf-8?B?b2RuVDV0dUFxZWpnOUFvOHBoeVBWOFZHMlZkWmIrTHpVRkN2YTBrTSsyQjEr?=
 =?utf-8?B?UE82OEJNQ2pNakxZRnNBREk0cUdzcU5vZzB0YlJIOEFSYnRaQVlwdzRtekpz?=
 =?utf-8?B?dHhWNEpUeXFVN1doQXlWOFdSdkpxQkZpSmdTdWxXWWFGWkdHNFM1T29URjZa?=
 =?utf-8?B?OVBCYzU5Y2t5Tko2cGxFeHAwTktpTm9RMjlmbDFEOXZaZEpIZldETjVYQk85?=
 =?utf-8?B?eEVVTHREMmQ2S3Ftb3QzcDBvSGtuNWRPd2hrZHFveDJYUFc5SmRmT0RmajJU?=
 =?utf-8?B?VlFIcjRQcm9GZjE1YzJlSC9kdXVadUVXWXVzeTNUTlVZZ1ErZDZuSHJvSW5p?=
 =?utf-8?B?Q1pOM1lmV1MxZlBRNU9KalNEckhMZE1acnJZbndJSGIyY2taMkNLcXFrOENl?=
 =?utf-8?B?Y1FNcVdFUTNleHF3eWtyQmtBVGRDMUw0S3hOVjFIWENQaVFYZHpzcWRGVjRO?=
 =?utf-8?B?TmV6K0t4NlRLYzZOS21DbllZejVwb2NiQXQ4ZTlVMDdHTUVmTW15eTBFMU4v?=
 =?utf-8?B?VHlDS0VBcHVOaVBGRzRlanJNaE5iT00vRSs3dTJzN0dOWEJvZFg1b3YwdFFP?=
 =?utf-8?B?enY1aUlYMzRpMzg3a1poREZnMElDZEJTa2srdDVCUkErSW5PUHl5TzRQNTln?=
 =?utf-8?B?Nk9td2hqS2VOUkhwVXhQYmVaNWUxWjBXRnIrbE1pMHFLeDFjTUJNR2xHbXdL?=
 =?utf-8?B?STJhTHpsRWpiTE4yZE11ZFVyTmtvRlNBWnhxUkpXQ1I1dUNML3p6U3Y5VzVZ?=
 =?utf-8?B?SzdYQW43ZFZNWHNVTENWNUdJMHM5MFU4MzYwSTFPSWcrSnc4WXBEM3YrbmZS?=
 =?utf-8?B?N1p3S3BXWTRlVUd4K0syak4xeTl3VkNnYlByaktPeHppTDJDeVJVbDB2cDBt?=
 =?utf-8?B?WDVwWXdFN2ZnWTZWWEl2dlVuWXBlY2gxdU15L29vc0wyV2lLWkthMzV2QUFW?=
 =?utf-8?B?YlRDc2hQRGpaNDl5aVQ5eXN2SnRpNjVEeit6YnBkS0Vtd2lNUW4yenp3VDVU?=
 =?utf-8?B?RkJkOXFIZkFUYVJ4cTE4bytwZnFud3BBVzZROXM1TGhENFZWNG5aTHk4d0I5?=
 =?utf-8?B?ME1mM2hncWgzUkVjNHRYTjUwd2Z3dFp5SUM1VCtKZW1CdUgydzZvOEJxeEdz?=
 =?utf-8?B?VGVpWDN3YjZZd04ydjZvbGpVTzJwcUlMQkVuaTdldWFjRUFEd2JBeXpEQ1l6?=
 =?utf-8?B?akFzdzRKYm8zRmhvQS9HNTVTb1dSRTcrWlp1WXhWeVF1YlladEQ5WjV0VGRL?=
 =?utf-8?B?dW1YZUJ1RHE1MFJzUXNOUTY0SkJ3V2F0TFNRT3hhRHNNUUpTdkZPWWVGYTR1?=
 =?utf-8?B?T0QxWWppTFJKL0dTK1N4WElhWEFXTktPMTJWU3FmaCtBamJIWUIrVXpFRG5u?=
 =?utf-8?B?N2pDTXNrQ1RVemdVd1dEZm5FSDI4LzZHbXhhSUhHSUNBc3IxMFNzNXRrVnNB?=
 =?utf-8?B?aFYyVnhZRXRFSmk2aGZsbnpObUpud1Z2Q05vOS9ldDZCMFVDdFVKK3V3Q0Nq?=
 =?utf-8?B?cDZ4a2s0a0VOWWI0TmNtMGszTjZzaDFJczhZUmUwWk1GVjdiL2pSYTRET28r?=
 =?utf-8?B?ZEg1RWhSRndSSGNwYXFFWHhxQ0hQNGxjOXdLR0M0MnpPd2VLOURXd0d2bGpk?=
 =?utf-8?B?enJpMmxyQmRMVGEra3N1ODlud1FwV0NNaG05ZmxVR2s5SW9pY1pmMkpvem82?=
 =?utf-8?B?TCtHem9KV0QreGRENERhaUdYK1d2bGFrSngxMkRUZ2xzY2Y5UkZrSTNDY0pz?=
 =?utf-8?B?OEJBY01GbnhqSloveFB6em5jMmhtQUVmcGh0RHg4a2REblhublQxSlY4QUZQ?=
 =?utf-8?B?c1dHWXcybTh5a2NXK3VwSFJWWWYvdW40K0xzT09WeGY1MS9lOWNOQVpuRUYr?=
 =?utf-8?B?Nmt1UGhrV3pUVDQzdk1qNFhMZnRiam5GOFRodzUzSE5Ub29uQUdpR1dWYnFX?=
 =?utf-8?B?NCtOKysrWG9URnBZVUY5dGRrL2szQVhPNFM1K0VoZXVzcEpSUmtndEJ3M2V0?=
 =?utf-8?B?VHRGNDBzSEVUVE5JY1hVY2Jndi83bVVvaTZkVzR5eHRMdDMreHZsZVZRK09B?=
 =?utf-8?B?bSt4TkFyb2JtdW56NW9MQzA1SktRUTVVMTRvZFBxcC94TXZzTTlNWjVyNkdG?=
 =?utf-8?B?U2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c2fea98-bb8e-4c14-debc-08dd33b66fc7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 09:41:21.1213
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xZUryDMcjFb4xU3Q8yRyVgewU08x3vXygIy7WNfjG/o43bJtOl+uox3XZlKx/TOIHwUkpDcVkf88wWtezssfftN7ir6c0VMCKRF3j8My55w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5858
X-OriginatorOrg: intel.com

On 2025-01-10 7:09 PM, Pierre-Louis Bossart wrote:
> 
>> +MODULE_FIRMWARE("intel/skl/dsp_basefw.bin");
>> +MODULE_FIRMWARE("intel/apl/dsp_basefw.bin");
>> +MODULE_FIRMWARE("intel/cnl/dsp_basefw.bin");
>> +MODULE_FIRMWARE("intel/icl/dsp_basefw.bin");
>> +MODULE_FIRMWARE("intel/jsl/dsp_basefw.bin");
>> +MODULE_FIRMWARE("intel/lkf/dsp_basefw.bin");
> 
> Lakefield? Is this really a supported platform? It was EOL'ed a year after launch, wasn't it?

We still keep all the platforms, regardless of their age, in the CI to 
cross check firmware-API compatibility even with newest generations such 
as PanterLake or FriscoLake.

Few years ago the team did quite a job to streamline LakeField (LKF) 
with other cAVS 2.5 platforms on the firmware side. The TLDR is:
- one firmware branch covers from LKF (cAVS 2.1) up to 
AlderLake/RaptorLake and all their spinoffs (cAVS 2.5)
- one tgl.c file on the avs-driver side covers the exact same range

so, any kind of redundancy is greatly limited. With that in mind, we 
utilize the cAVS CI against the ACE (MeteorLake onwards) equivalent to 
verify API compatibility between those two firmware branches to lower 
the software development cost.

>> +MODULE_FIRMWARE("intel/tgl/dsp_basefw.bin");
>> +MODULE_FIRMWARE("intel/ehl/dsp_basefw.bin");
>> +MODULE_FIRMWARE("intel/adl/dsp_basefw.bin");
>> +MODULE_FIRMWARE("intel/adl_n/dsp_basefw.bin");
> 
> If you start listing the variants of ADL, then shouldn't you also list the variants of TGL?
> Same for CNL, there are multiple variants, not to mention different signing keys.

The only reason ADL and ADL-N are listed separately is binary 
incompatibility - MEU differs between the two. In essence, one can use 
ADL-binaries for all ADL/RPL based platforms _except_ for ADL-N based 
ones. The code is the same, the verification process is different. For 
all other major platforms, no MEU differences so one binary covers all 
variants.

In regard to the key, the approach is: it's ignored.

Whatever is in the directory under 'dsp_basefw.bin' will be attempted 
for booting the DSP. By default, what lands on the market is a 
production-type-signed binaries. Internally CI runs with prod -or- debug 
signed binaries but we do not intend to share the latter to the official 
linux-firmware repo.

Kind regards,
Czarek
