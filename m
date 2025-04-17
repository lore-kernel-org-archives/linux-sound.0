Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47CD922FDF0
	for <linux-sound@vger.kernel.org>; Thu, 17 Apr 2025 10:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744884925; cv=fail; b=VUeuU+v1OJLlfzJEXk0cuqJC+XBiySYWtobpbLuGxFLg+ZZlC2MI/L2wSyNho48qDXDAqVuO0Z2AdKk7WAEpgUlwOfgeivk6Nhu+WGG+z/LWStuH6FoLLkpTjjHW3czY0BceEy6upTj9RDrTO4N84OMmN2RWDJe2kcp+/5T5HUg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744884925; c=relaxed/simple;
	bh=xPnw8I7V30IUNTv+iamlySJ3GDwWmlHysbaZfKjbKHI=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=c2ifafPKFexylno94ZVK+IbUXLkA2VkCRPMCGTiHoJK5zaMRpTdN8DV/J/h12HYIAgLFV6jalq/UlJwzBtZPiHGwiIuQZmE4ns5Niu5UBeiWT+RmqZJL7jO0HUadmG7BunoKqbAWJx62nQcD7g/pjgrSZrcNo0BaLH4+KCJzmG8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dp3CtumW; arc=fail smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dp3CtumW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744884923; x=1776420923;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=xPnw8I7V30IUNTv+iamlySJ3GDwWmlHysbaZfKjbKHI=;
  b=dp3CtumW0VViGShKbSHT13Rs4PDN2lHzXMlpQWxykH0wfP8Q8F0rpyrM
   kPe9za2HzMccP7g8YoW2DoDEazXY7CYQ0JYvobKC3hW6HYqRqZ8vN1SrK
   D6lVq05RfOo1ax4hvmAN1FCKXhCdn0rmL+3ss3GISqFPDn5QbzgicbXPp
   +1zMZ2F+KBn5d0mYzjzdb82DwPOUnfJIzTG0cFn5ZsUEcatEoYN4N4sDF
   lrrSvQl/rSCqITXg/WvugzQqogK+Gp/Sd+Gbql0KQVIAjkAm+kDIHFLVS
   S1G2erOwiBTda+u0VdUPZ9dI7xWl8UcsA61T/WOJodU3x4+OJkzd5WWi2
   w==;
X-CSE-ConnectionGUID: RFiGui4qQ3mRD8jgPZZSeg==
X-CSE-MsgGUID: oJTATX9nTGuqCfVGMMXsbw==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="63873849"
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="63873849"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 03:15:22 -0700
X-CSE-ConnectionGUID: vnFyoyCpTX6htWHfw/RNSA==
X-CSE-MsgGUID: geZ8BVfKSuiJhmLQQCzXsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="167946816"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 03:15:23 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 17 Apr 2025 03:15:22 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 17 Apr 2025 03:15:22 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 17 Apr 2025 03:15:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a8zvb9NC4KZYa9O12l9Z5IvpLbTj6xwMLba2smBN0bCTHZSpZuY4ypGLXOch2zZz4dzySEKT3MyBCTKk8ZfPyrCcKR7tJxfCJ2vspQ/iT/sNFjQsDks9FmNbAHRy3a+BktFuZjJnwvS1wGHIAESI8fOKBuPXc8swDa2KR8UwLNE+wHe2X0oibc7EkPCejgwUn7j1nj5sr7xezr+Jf9Vl5lc/jcNiZgJJI2KhGoTPv8aYw2SBaVF/uN19pst9NEvqA2wDGhYrOJYiyQse+lcxsDOGDU7PT/7ghTzbf42wRvSvAJ1LKtYEQ0KeHG0MNRscCtn+pHRJfVO9pGiNrxdt+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ucQl2b/yDSHOsv7P+VHJ7aeAzglCIqfFR2jZ7A9yKxw=;
 b=ZLY8gMpl+W1Ojxick3ycRYS7qSd7OYL4sPsr4nFDZt4e+ZpWLT9XtUjZrggklbu7z45fVpQpfV1i9OalqJ90Aw0onIfkgTYco9EyUnWYJRPOXIiXdYBLRCCDtmzJ/E1IsZcCFYhuhGSAXvEowImtidVxkDxhr2U7noqQXY+E90zUjWhCS9TieFcoxUDNKygpROYl0HEbPG5G9OQeRJ81P98ar+rX2Tv5BhXva0NFKLq2sMBXkUSqep9MPfrC9ztWr52Sb/5tAlYGmnUID9OufpZUAVmABE0S7q6vfBuxWcF5ktRvH1jJ+WTsaOZoBWrLAq239Bw7fWIR/QHgTmF+HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 DM4PR11MB5280.namprd11.prod.outlook.com (2603:10b6:5:38b::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.22; Thu, 17 Apr 2025 10:15:05 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cd01:59f6:b0f8:c832]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cd01:59f6:b0f8:c832%6]) with mapi id 15.20.8632.030; Thu, 17 Apr 2025
 10:15:05 +0000
Message-ID: <5f3c62e3-6993-4595-80fc-eb77c0c11f1d@intel.com>
Date: Thu, 17 Apr 2025 12:15:00 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 00/15] ALSA/ASoC: USB Audio Offload
To: Takashi Iwai <tiwai@suse.de>
CC: <broonie@kernel.org>, <tiwai@suse.com>, <perex@perex.cz>,
	<amadeuszx.slawinski@linux.intel.com>, <linux-sound@vger.kernel.org>,
	<gregkh@linuxfoundation.org>, <quic_wcheng@quicinc.com>,
	<mathias.nyman@linux.intel.com>
References: <20250409110731.3752332-1-cezary.rojewski@intel.com>
 <87v7rcwbyn.wl-tiwai@suse.de>
 <8e3fd738-c2c3-4ea0-963e-477c2fb253b6@intel.com>
 <87sem9xuxs.wl-tiwai@suse.de>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <87sem9xuxs.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P190CA0043.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:800:1bb::6) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|DM4PR11MB5280:EE_
X-MS-Office365-Filtering-Correlation-Id: df891aa9-7cd8-47e8-77ae-08dd7d98b916
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dDVFaE9uYS9oWC9nZ0NoR0Y5WVh0dzlINEwxS0pQMFNDVzJ3QmlkWmJvY3BR?=
 =?utf-8?B?Skx2UXZLek5xWWoveVV3TWRjdjZHWXlpK1hTSmN3S2hFR2FudllYVm5oUFV2?=
 =?utf-8?B?Qm10UC9Penl5bzQzWkh0bnQwNEVNcHltQUdIeUJTcDJWQVQzT1J6RnRtWDhF?=
 =?utf-8?B?TkNiRTQyaVgwZFY0T3BndmpmNEZGVGliODVmNVlrYnorTmYyZmVnUzdnVTQ0?=
 =?utf-8?B?QTBmd3paSEQwM0xKc2Zhdy8rck5UbFdPUkhxS2lWQ3NrTGt6SElTd2NjVXBy?=
 =?utf-8?B?cGFReFVWdmlERnA5T0JXUzRDUUdoc2FtWWd4YTBrWlBOZE5KY1BwU2VUT3Bl?=
 =?utf-8?B?REhRMkRDUERLQWNJb0NjdDUyaThMM01pNmkrZjBxRk5VTU1lRzRrb28zNEpS?=
 =?utf-8?B?UkxtTmhVdXFSMHF5SmNsYTc1WWxPUlpzeUYzbm16ZXRGVlhaN0hvZ3plUFRv?=
 =?utf-8?B?Qy9Ec3dIQXRsTHErY2pyUm9FRHR5WnByU0lZN3U0a1pkbXRJanRHQjkxZUsx?=
 =?utf-8?B?djU3QUIvMXVxRlF4WkhlUjhBYXQ1L2Y3QmZUemtheEhlSnkvVTdnZXdXTm1L?=
 =?utf-8?B?MDV4UFFZaGNscURnYUtRMENsZGFXZWU5Q25SSTNLUUoyVjBOc0tucXdwK1J3?=
 =?utf-8?B?SGt4WWJ4MEI1SS9YUVovcm5VbGM4STFWcjVMQUNGTDBMS2JDSXVtYm9ralBW?=
 =?utf-8?B?TDlSWFNOWjUzdG5SdWpKSGFQNElpTHpybkhTTmQ0RDRvMGpGNkFoNkk4Z01Z?=
 =?utf-8?B?eXRxNXZ6djdGZXpVTnlNMVZyd29yTnFmRENuOHdaOGQ0YkJqblRJR0NQNlg0?=
 =?utf-8?B?R0V3QzVzeXZpVXQydS8zYjA2TlAybU1rNGhnUzZTTEF2WTFNcTg5RTBmRnds?=
 =?utf-8?B?VVI5VFQwditEd241aSs5R0ErZWFWa050bUNGVVJGSmFQa2lHZ0FCUnBYRXcz?=
 =?utf-8?B?bVJ0bkd4cVpnMlM1V01ta0RINnVwWm44cjZvSlZPeDlqSmdGd3NhalRGeEsx?=
 =?utf-8?B?b3dtYnhrRXh1aGxmRGVDM25wS3V2QXo4MlA1bE5FMlBnVjUyc3lKaS9ubUk3?=
 =?utf-8?B?WnZvMnFEWm1jMXFjTDFaaFNEVkI3cDdDL2oreXpXeW9WWHNCcGVqUC9mY2gr?=
 =?utf-8?B?RHlpR01aZ3RmVmZNZUlBRWR5Smdzb1BYREhHWmcxZ09wTUsxSVRZaUVycDZl?=
 =?utf-8?B?THdRZXNTTTJzU0lvQS9YNnh2SzY5d05JM1BOV2pMVzFmWkZ0MnpnWjBpcVNC?=
 =?utf-8?B?U01UeWFwaFdmSlNBV3RCQmh0VXRHdzdpaVRkZmxUQS93RFp2TGZWTy9Ba3hh?=
 =?utf-8?B?YWNMcVUwemh6OXlLMUN3WCtBeWJGejd5MWY0NFI0Um5QOTNpZFg1dmxIUTFz?=
 =?utf-8?B?NVVtUDRuazkwTmw3STBhR0dFdnYzVUFqaVdGbXdzUEw2ZnhMYmNyOGtPbHBk?=
 =?utf-8?B?YUlYRVcrZ3c1eDRZWVk1WnNsMDNNZTN1eW54dVYvZEtJNFlJcWRNczdpbDZX?=
 =?utf-8?B?Z21TSDk0bXpNaEZ6eEJlcFJMeStqdXBYckt1SC90a1hycnYwcWQvaTdUZE1X?=
 =?utf-8?B?V2pXMjdacGt1czMzQVd5eHcrSkZDbDcwc0hma2sxdGdBQnYxOEdZUlFFQXEr?=
 =?utf-8?B?N0xSU1dObTQzTDhRUk83clpPL0Y1aDlIa2sxRG52R0NMYis5dUMxL3hvQWsy?=
 =?utf-8?B?U0UzblgyUkd1a2Fhdk02Z3IvWVJLSzhGZENTL3RjT1pwNklwUmsxK2xMVTdF?=
 =?utf-8?B?NzdiV3VMV1lsbTBpWTJVNEZBckZzTmVZSGFPa2pmZ0Y1WFBwa0pGWkZac2J1?=
 =?utf-8?B?cGRDLzEyTTFydnpYeFJoYmZoaVlwQmdJVmNtbzFoK0hxS1RTbXJEeHJaNUJX?=
 =?utf-8?B?TnEvRFI5U2hxL0t6SHJsQ2hnSWwyYy9GcHRLS0E3RVJWVDlxNUhQZ3Nzd250?=
 =?utf-8?Q?v/z3WXDTD6U=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6375.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SE1wMU5wOGxrT2dwNzdTS0UwSy9LT0FqYW5obnpIYzNQSGg4eTdZL25rT1FU?=
 =?utf-8?B?Ui9KaDFpMm9BeTIzM1Fib2hOd0FUcjdGVlJaNUZFQnFZcVkvY0w3THBxTzYz?=
 =?utf-8?B?R1lXVERhSmJaZ1prVGV6c2lDbFNZV2c5clVWNUFBbHVPcDFGazNwU0crU0NI?=
 =?utf-8?B?c1lLMEFCRU5jRWFTR1hoaDlDVDh1TzZ0Sy9rdFA0TTltNmI1R2hHWjhqY0dU?=
 =?utf-8?B?Snp1ZllEaWR5NnhSQ2piMnJxeC9YdXlpOTRYdXcwUmRkU0JVdEh1VTRlRmdZ?=
 =?utf-8?B?TVU4K3JDVGU3MXJwcVlqRUJlVFdiZlBPd3JYSGZ3UVdaWFdvbE9PRmZZd2ky?=
 =?utf-8?B?RVJjbVlsTUJhMUE1RDRoMVBzM2pqdVduR1JJcHlBMExXZzBSbDRQVUp0cmhK?=
 =?utf-8?B?ZEJlb0o2Q3J0Tnk5WTRBSTRHcVNUMGhpMmhOenlLdHFQTGRUT0ZZOUs0cStD?=
 =?utf-8?B?aDRlNVdBQ0s5ZzY1aTl1V2QwSzJmMzhHYTZIc2VvVy9lRUxNWGVhNzI3NWFw?=
 =?utf-8?B?WnFJSVRiNDRjNEo0RS9DVWJmb004cTQ1R3Y5Kzh0R0p0VFdWa1cxbHF0MHcw?=
 =?utf-8?B?QVBhMERJQTgxZEZSbjc0Ylk2T09RaXlOdHlUcVVSdExsSXhpczloUXlwZ3pk?=
 =?utf-8?B?VjBSQ3gzRWJjN0Y1ZzgxQ3ZJSmczdnM4aVQya2VUNEx4MGZaeFMrWWVuS1Fx?=
 =?utf-8?B?K3BFTVRFcjZLTDlxMFdVdTlNY0pjWS94NnZxQWp5Z2ROVWdZTDVFZXBFano1?=
 =?utf-8?B?dUtQU3hDZVc3YlJvTWtHK0NrTnRzM3JxU3NHNWZtY1Y3S0FHT2VDVkdFVWRu?=
 =?utf-8?B?a3VJSllpZEttM3BWamprZUNQMklGajZmazhTWkhkUFZ5U0wzMlBCbVRjTmlz?=
 =?utf-8?B?YXBVNHJZU05pam84U0Q2WklwK3h5MjNXdnkrRHJLbTkrVy9pN05QWEVVeUUy?=
 =?utf-8?B?UG05dFc5b0J3M2JVWkRsa21ZZ1JSWTdJcG5YanEzaTE3Z1lFcEZka3k3QUFY?=
 =?utf-8?B?TWtIU0FEZmM0NUsxUmN6Z2pMVWpDY1dhYjlxcW9TelkwNk80WEdtUlM2Umpi?=
 =?utf-8?B?L2xBRXFSNGI4aCt4N1VKTmJVZG15S0NHeW9wOXRiYlI3YXByK3dUMGI1WDFY?=
 =?utf-8?B?SDQrYWVaZzY3OU52NUFscHk4Q0tZS2VkbFkwY1Y4bjdFTW96UmZ5RHJVNldV?=
 =?utf-8?B?ajkxQncwWWRGRVZKVENyT284SWwzTkVTVktuRWxEaWYxcFR0SklSdzlYdmhP?=
 =?utf-8?B?SEhJU3F3OUkwYkdTRzhLNVFrU0tMUVdKWnpNeFEyNWV1bXNKWGE1cmM4YldQ?=
 =?utf-8?B?d2Vkb005Nm9sQ3BRcmV5bklKUDZSR0lucEJGQjE2TTVJaVpvOE1jbU9FdnpH?=
 =?utf-8?B?TzA5MFgzOWhqNjRtQVVtd0JteDB0WXplOEV5QTNXdGFlT0dkT3dULzJzT3BL?=
 =?utf-8?B?SStMRnBQTXdvWVNMTE1VdzRzaWZzTTk1TjNLMkdkc3hEQSs2ekYzcnVaaVB0?=
 =?utf-8?B?cCtBOXV1cWtBWkQ5dG8rSlU5bzJRMTM5NitlN3R4emQwcDVtRjd5d2VRa3dx?=
 =?utf-8?B?WWdOZDhoMW9YU3ZER3R4SjRkVXR2QUtYU29GeCtrQUNHM0tDcm5YYjhXNTJC?=
 =?utf-8?B?aHAwZkNoWXhrVkhlbWVOTHFQOFovc3pKZkRGbGhxYklmVU9pWjhsMTQyZVly?=
 =?utf-8?B?dGJhdUZlc1hpQmtYRUMwVEQ3T3JPMytxbGlENVRPMXJLU3c2NkZsZkNpTWwy?=
 =?utf-8?B?K1hVVnJrSU1wTUhDell0Tnc3UmZCRm1yUklZUEU1d1E0MDA0Sks1WitXd0tk?=
 =?utf-8?B?WEZGVkFIdS8vNHhGTVNDL243TDRReGw2MTU4U1dMODRqelc5bS9LOTIrQXpG?=
 =?utf-8?B?aGJrdlM3RmFtSThZZUQ2T0pYSkd5QWZCSFRrdGE2K2tuRUFxdGthbXRPMC9V?=
 =?utf-8?B?aW1ZWFJRRk8zUUxDbWMzS1ErNWJvVkpLRUUxTmg5ZVdBTkQrcEhmdzJEajYv?=
 =?utf-8?B?anFJdjVKWEJmc0Nqem9qdlNzTEZKYWNhc3VaSlkxV1Y5VnAwaGtDbGc0OVdK?=
 =?utf-8?B?WUdrbjFUZGt5aU1VUTF2Q1Btbi9YRFpLbXhIWm4yeU5oSkwxK0pmMVpDLzE0?=
 =?utf-8?B?TzJkenoxMDVyemZtN3B3cG56UU9tU2V0QVlYZk81K3lkV3dTOE1nM3RJRVBX?=
 =?utf-8?B?MHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: df891aa9-7cd8-47e8-77ae-08dd7d98b916
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 10:15:05.1533
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cjG1ERLH4D9xO7dV5iY2BOmEKCcavFdfnzKlKUCDptk4ud60XMtLIL7NU6EntpgTrxD9wk3GG2urHDtecbiSNrHZTodBUeWGBiqhDJ6e4CA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5280
X-OriginatorOrg: intel.com

On 2025-04-15 6:15 PM, Takashi Iwai wrote:
> On Fri, 11 Apr 2025 11:39:55 +0200,
> Cezary Rojewski wrote:
>>
>> On 2025-04-10 12:24 PM, Takashi Iwai wrote:
>>> On Wed, 09 Apr 2025 13:07:15 +0200,
>>> Cezary Rojewski wrote:

...

>>>> Apart from changes to sound/usb, the patchset contains exemplary
>>>> ASoC-based, offload-aware USB driver and a small sound card on the
>>>> avs-driver side to show how card/dai_link initialization looks like.
>>>>
>>>> In short, USB Audio Offload functionality lowers CPU usage when
>>>> streaming PCM over a USB Audio-Class device.  It has been first
>>>> introduced in xHCI 1.2 release and is described in section 7.9 [3].
>>>> Once hardware is prepared with hw_params(), all the USB endpoints
>>>> operations e.g.: start, stop, submitting URBs, are performed
>>>> internally, by the hardware and AudioDSP firmware.  Software driver
>>>> shall not intervene.
>>>>
>>>> Startup flow from:
>>>>
>>>> 	usb_pcm_open()
>>>> 	usb_pcm_hw_params()
>>>> 		snd_usb_endpoint_open()
>>>> 	usb_pcm_prepare()
>>>> 		usb_set_interface()
>>>> 		snd_usb_endpoint_start()
>>>> 	usb_pcm_trigger(cmd: START/STOP etc.)
>>>>
>>>> reduced to:
>>>>
>>>> 	usb_pcm_open()
>>>> 	usb_pcm_hw_params()
>>>> 		snd_usb_endpoint_open()
>>>> 	usb_pcm_prepare()
>>>> 		usb_set_interface()
>>>
>>> Hmm, how can it be?  The start of EP at prepare stage is done only
>>> conditionally for non-lowlatency or implicit-feedback mode, for
>>> example.
>>
>>
>> On Intel architecture the AudioDSP utilizes internal channel to
>> communicate with xHCI and perform all the transfer operations.  In
>> essence, once SET_INTERFACE TRB is done, the usb-driver is not
>> supposed to do anything.  The avs-driver (sound driver) would be the
>> trigger here - sends the start/stop/etc. requests to the AudioDSP
>> firmware, DSP does the rest.
>>
>> By trigger I mean SET_PIPELINE_STATE IPC and avs_path_xxx() which are
>> utilized for any transfer-type (sound/soc/intel/avs/pcm.c).
> 
> But does the DSP handles the different ways for the implicit feedback
> mode, the low-latency playback and else?  A specific mode like the
> implicit feedback mode is mandatory for many devices.  Similarly, the
> low-latency mode is essential for some application setups
> (e.g. pipewire or JACK prefers), while it's not always applicable
> depending on the PCM parameters (such as the free-wheeling mode).
> 
> AFAIK, the qcom offloading doesn't support those fully, hence the
> configuration must be dynamic for them.
The hw design is unfortunately not simple:

xHCI <> SIO <> ALH
^ USB side	^Audio DSP side

It's an internal channel between so-called Audio Sideband located on 
xHCI controller side, goes through Scalable-IO and links with Audio Link 
Hub that's acts as 'front-end' for DSP.  Every block has their own 
requirements and restrictions.

And thus the number of available 'streams' in such configuration is very 
limited - typically to just 6.  These are not even bi-direction streams 
but an internal map: IDs {1, 2} for outputs, IDs {3, 4, 5, 6} for 
inputs.  Due to such small number of available streams, there is 
pressure to filter USB devices.  In regard to endpoint types, only DATA 
and FEEDBACK are supported, IMPLICIT_FEEDBACK is not.  Such device 
should fail offload-candidate filtering and be serviced by snd_usb_audio 
driver instead.

The official xHCI spec and its section regarding Audio Sideband is 
tailored for "claim entire device for offload or ignore" approach:

- scan the USB device descriptors
- verify if it's an offload-candidate
- count number of DATA + FEEDBACK endpoints
- ask xHCI to _reserve_ Audio Sideband resources up-front. This means 
the resources are reserved long before sound-devices are visible from 
userspace, yet alone opened for streaming

- pcm->open/close() just ask xHCI to perform 
SET_ASSIGNMENT(reserved_resources_here) TRBs to prepare/close the 
internal channel for runtime operations, that's it

There is no intention to allow for switching the ownership between 
offload-aware and offload-unaware.  Either entire USB device and all its 
endpoints have Audio Sideband resources pre-allocated or no offload is 
present for the device at all.

...

>>>> The design goals:
>>>> 	- make ASoC first class citizen of sound/usb
>>>> 	- re-use code found in sound/usb, mimic HDAudio integration in ASoC:
>>>> 	  small sound/soc/codecs/hda.c driver leveraging power of entire
>>>> 	  sound/pci/hda/
>>>> 	- no shared control over a USB device, either snd_usb_audio or
>>>> 	  its ASoC equivalent takes control of the device
>>>>
>>>> To do that, major tasks are identified:
>>>>
>>>> a) On ASoC side 'struct snd_card' is part of 'struct snd_soc_card' and
>>>> is managed by the framework.  Similar situation with 'struct snd_pcm'
>>>> and rtd->pcm.  To keep the teardown path sane, drop card->private_free()
>>>> and pcm->private_free() usage.
>>>
>>> Well, this is a generic problem of ASoC framework.
>>> I believe this should be better handled in ASoC core side at first.
>>> e.g. the card object could be created at the very first step of the
>>> snd_soc_card creation, too (but without the actual slot assignment or
>>> device creation).
>>
>>
>> Well, in my opinion the card's tailing private context (extra size),
>> private_free() and all that comes with them in sound/core brings
>> unnecessary complexity to the ALSA framework.  devm_xxx() is
>> enough. Polluting snd_card and sound/core/init.c with driver-specifics
>> causes the teardown procedures on the ALSA framework side harder to
>> read/maintain.
> 
> Well, I'd say it depends, and pretty much a matter of taste.  The
> resources managed by the card free should be the last thing that is
> tied with the card object itself.  So, yes, it can be devm, but this
> wouldn't make things easier; the devm is merely a serialized release,
> after all.
> 
>>>> b) To initialize ASoC components/DAI properly, PCM capabilities should be
>>>> known up-front.  To do that, existing USB card probe() has to be split.
>>>>   From one-stage to two-stage process:
>>>>
>>>> 	- look ahead and parse usb_interface descriptors for PCM endpoints
>>>> 	  but do not create any PCMs (sound devices) yet
>>>> 	- create all PCMs based on obtained ->pcm_list and follow with
>>>> 	  MIDI/mixers/media
>>>>
>>>> Such approach allows to feed DAIs proper data even when a valid
>>>> sound-card pointer is not yet present - the initialization occurs before
>>>> snd_soc_bind_card() is called.
>>>    This one is another thing that is needed to adjust for ASoC
>>> framework.  But when snd_card object is available, this can be
>>> resolved automatically, too?  e.g. snd_pcm object or such can be
>>> created at that point.  The actual device registration is done anyway
>>> later via snd_device_register() call.
>>
>>
>> While I'm up for upgrading either framework in any area necessary to
>> have proper UAO support in ASoC, not sure whether it's a good idea to
>> make it a requirement for the feature.  This will enlarge the series -
>> well, guess it will be separate series (dependency) entirely.
> 
> The series contains lots of hackish API exposure, and I really would
> like to avoid that if possible.  In the case of HD-audio, the whole
> stuff was moved to its own bus at first for adapting to ASoC hd-audio
> ext implementation, but for USB-audio, I don't see the need for that
> yet.  And, if the concern is about the snd_card object lifecycle and
> ASoC binding, it can be improved in the lower level at first.

I tried hard to avoid hackish stuff, perhaps not hard enough :)  Would 
it be possible to list the areas which you believe need to be look at? 
This is frankly the feedback which I'm most interested in.  Mathias gave 
me a number of these, e.g.: do not access udev->slot_id in sound/, avoid 
manipulating hcd/controller in sound/ and such.

In regard to the HDAudio point, I see clear benefits by having HDAudio 
and USB aligned in the approach on ASoC side. It's a path that's known, 
works and is well tested.

In regard to the snd_soc_card vs snd_card, in my opinion the refactor of 
card initialization is a large task.  In the past I did similar change 
for the snd_soc_component [1] but the card is an entirely different 
beast.  That's why I'm suggesting incremental approach - update ASoC 
initialization as a next step.


[1]: 
https://lore.kernel.org/all/20200731144146.6678-1-cezary.rojewski@intel.com/

Kind regards,
Czarek
