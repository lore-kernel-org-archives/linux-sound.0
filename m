Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F3E432571B
	for <linux-sound@vger.kernel.org>; Wed,  4 Feb 2026 11:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770204630; cv=fail; b=iu4mFaB0/CdA2FzMX8YrbV4NiTk1KgF8zhR2GYqR84GXG287g6yovedV9xldB4VKcSN7CK4MYFRbsHAQwWq9Q/q4ZWfnbnF8HDZzhqLGLz0+2gP6jOxzZQSsj3UJenM4bTXAbB1aFSU4J9CaLZW2bQCvVVnJUUgi1ZPiGtHRgqU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770204630; c=relaxed/simple;
	bh=a2+xer2t97YUoy8Rc9TliIz484oNjnHeNO2BclI/tZY=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Rtpr0KMZzl7QuetvT/G5zxF2sFP9nTNxSD/Jb4i3QJs8jM/uBPM6S5NSz//30xEVMWLo1NhgQvWhX2tqcF9ZkPhcf3Z5bpN+o7pFkuz2C4xMewcHOuu34SaJVeNA8Kaq3co5OhgztevLbNGeG4TDVfq3CkoAAk2OKPtUV40gOko=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y7lrwsnH; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y7lrwsnH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770204630; x=1801740630;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=a2+xer2t97YUoy8Rc9TliIz484oNjnHeNO2BclI/tZY=;
  b=Y7lrwsnHZKbaJTGsxzrSUfXBUUeCDZbT3SkdfqUFOd0sUwnJIAKogA9i
   /U2L1InKDbZfIhAZ9oFCYyMOZBO9aUS9TbvJLcSK9bKNloxPQaQPaC1qv
   lsRjB2jIwdExLYHVfN2ZGVqOyR0cReW6Mri2MVr3RZZPCQKUpzCLCNApQ
   dO9v1XROJ3eV4/m10FTVN8DhTYmkyh65R3q2kC1iLYgLDAhuVZ0jy7OnH
   /GxSWqkENbzhiivcMAd18fs9x+uaRKUtliSIkHvSaN9e1Ny2kTVVuQwAK
   8H220qph3i16B1nNagxfkd9USg96YMoexLmwBwJjNORlGv1sa0dv3dbYz
   A==;
X-CSE-ConnectionGUID: ucsQ3mqCR4i8D5jfgZjLKg==
X-CSE-MsgGUID: OJiYQhxtRZ+NRhfIspVdOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="88966208"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="88966208"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 03:30:29 -0800
X-CSE-ConnectionGUID: sUUj6BktT72cRh2F6UJ2JQ==
X-CSE-MsgGUID: cd3iIrToQziSkY4cViSFaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="210176545"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 03:30:29 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 4 Feb 2026 03:30:28 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 4 Feb 2026 03:30:28 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.5) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 4 Feb 2026 03:30:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vDHPy0RwxyGeczK/XkQ0Ge0Yuy5dsoK7twHJg5nA5P3bXerMlpsQ1mH7x0lJH/sCnFb2H/Lac9qkVSgC9ogL+WNaDS4v/LpO6sk9lAGYCHCgR2viJgITczPa2wAeBWL4O/wncixD30HT2yepU9Sb8kMIHNZalnEooaZDqsBf3Uy1d4Q5rToHpfeglpni5FXPvW0eSSKJOR9JjS0cl2kOZl59AhcgWJDfDI/S12Xui86RRa+r2I6WkqG9+fTwacquKhvRSfaXy5VTGQrWNkkodbBnW9HUPnFzLx616hmpXnB2pJgz6WDpF4LST+L0biEEleJj1ZDZ8SZugOKOsmxuwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OTZGNfmdEb2JY1I+2lTjNyxrHn0knYz6tmA7HmFCOD0=;
 b=e7wBKg0k/S/KMpQf1dEZLU8jDaNKVP1ILBic3d8xAOwQmKJWhCvg59yDYYqjUs/8r/0DTPlcZU3MKzmqZpphOf1fHiONJ5qzURwk0mOzCah22ORr1sWNUsUyMcbHoi932Npmqt/2Nn9216+4oRHKagBsR+o6Ed+BlV2vlFXetaoEeC0PLpw78Uo+ZmdZQZHrY0sQCYn0lzhAUbCvZ6ZOs2A6UEWpTDqsrMjawDLeAafwGnPKD5cS6sZ2G+kKn+A4X8rnak13+6aEajFRVgTJNDaS/Wuf//3zqoxrkOf0h+uHzE9A9OBMjvSYv7GsarcCmoj0GLpYmpuR/Ym1lzSi1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8283.namprd11.prod.outlook.com (2603:10b6:806:26c::16)
 by CO1PR11MB4801.namprd11.prod.outlook.com (2603:10b6:303:9c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.12; Wed, 4 Feb
 2026 11:30:26 +0000
Received: from SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::d18f:6b38:584a:214]) by SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::d18f:6b38:584a:214%4]) with mapi id 15.20.9587.013; Wed, 4 Feb 2026
 11:30:26 +0000
Message-ID: <87fc67e6-5a8f-4249-9419-3f77e1c762e5@intel.com>
Date: Wed, 4 Feb 2026 12:30:21 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ALSA: control: Verify put() result when in debug mode
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
CC: <tiwai@suse.com>, <broonie@kernel.org>, <perex@perex.cz>,
	<amade@asmblr.net>, <linux-sound@vger.kernel.org>
References: <20260130135541.115574-1-cezary.rojewski@intel.com>
 <87ikcgatdi.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <87ikcgatdi.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VE1PR08CA0014.eurprd08.prod.outlook.com
 (2603:10a6:803:104::27) To SN7PR11MB8283.namprd11.prod.outlook.com
 (2603:10b6:806:26c::16)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8283:EE_|CO1PR11MB4801:EE_
X-MS-Office365-Filtering-Correlation-Id: b46e2816-7f9b-4f13-63e6-08de63e0cb1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VDdGdk54TUd1bUlDeHpXVlVyeGtnU1BUQVJXdkZWM01Ub2NidWVJV2w4cXIz?=
 =?utf-8?B?WjlCdkpGRFhBcHBkbWVNNGdrSTU0cGZjcm53aTgreXFEUkFKYm16bW9CMmpF?=
 =?utf-8?B?NDRwWEhiQzU2SkwwWW0vek9hZnJjbkpJME9jNkdRMFpPTkZNNHR2VVE0Qy9O?=
 =?utf-8?B?b3VhTDZYZ1RVdDk3U3pteUlmaXN0RTZsM1I1eWpTVE1kNUJ1VDBlQ1hGNzN2?=
 =?utf-8?B?eWNjMlBSR0hZc1ZYdGU0OHZzVk41SEpJYjl2NW9YZGRvWDRGSkxKQmtOTXJC?=
 =?utf-8?B?YTNtMFJLTW1tNG0vYWI3bEFpVTZpWkVDVkFIUnZZQkZGUWVuVndTNndpY3Nt?=
 =?utf-8?B?c1Y4VUNGSGxPbFJlWkVCbXdWRVhQblZ5NDhLajFJaWNCaXlpM3ByM2ZOSTV2?=
 =?utf-8?B?bmVnKzV5N2hwWlhRbUI2VkxTS0N4TE1uWEI0V1RnancydXlsWEdSdHl4VUh6?=
 =?utf-8?B?ZkwxY1Y4eERDRGU3Y1pkdFBRRWlvUVZsSUIvSnpEcEhwN1dqWGpyVU56RVBj?=
 =?utf-8?B?eU9qQXJzYjFFb3hYTFpnOFhkOENHYlBiSFZlN2w1TjZXaDl0Uy9BVjllV211?=
 =?utf-8?B?WXBhZEhFQU5pNEpyTk52cjBNS3pRaXc1Z2Y2ak1tYWNHMDBwUXRiUGJzNmd0?=
 =?utf-8?B?S2p3eXRGQ01PdzlzajhVOVhPUTA2ZGdPU3l0RE9kcDEwa2t3dTA0N3l5NDI1?=
 =?utf-8?B?KzVUYUw1MmdvY3lCU0g0Yko4dFFQdWVNNVk4MVJaMFZGOVZZY2lRbXh3VGVO?=
 =?utf-8?B?SlNkcGlpSjRNTTgvNWQ1M2Frc1F1YmhSV0pBeTh2eXF2QjVNaGZ2TFVseHpi?=
 =?utf-8?B?OGtnMHRicW85M0dHTlZjZ25nbjBGc0s4bUdtQThqbmhQRnppYXVBMzdteWtw?=
 =?utf-8?B?YmFnRkdzdzRFaSsydEhVeHREVWlKb25PM0JEOGV6MWJGNzdxQVBHS2JYd1lC?=
 =?utf-8?B?QXN1SzVBS1RWRFZSbHh6K25JeHdLMzFEaGJkMU9qcjZxZDR0dm15TVd2bW5M?=
 =?utf-8?B?R0lHbTNGSk84N29LMDNKZ2xjbkp4b3IwMUdqQWxVVWNKRWRST0R1WG1tZU5j?=
 =?utf-8?B?VWlOZzUrbHMzZXlUWkc1cTNwUzNTY01KWUo1cS9TaEc5RU5LSlFzYjcwYzRa?=
 =?utf-8?B?K21BZHFOZURTZU5FRUtNV3l1M05rVThGQ2lBR1ZIbFo2eldMcWVKelVDcWtX?=
 =?utf-8?B?S095R3ZJUnJmd1dhdXFCY1dTVktmMXJYWFAwUWE4QUFlUjZMcHlZeUJMeFpQ?=
 =?utf-8?B?STZzNTZvUDlBbmdaak1Ec1plUjRyWDFobjFyUzlqNTlJTG1jL0FUMm96MThk?=
 =?utf-8?B?U2ttaHJwbVdOK0RHakpWTzlQZ0lzSFVYeC8wM25FbHNuQ3VaUk96Mjg2NGZJ?=
 =?utf-8?B?QUorcG9wUkRWWWU0SzVLS0djL1RiUE9uOHJqYWpXM3BwdFFYc2EwbHBaOXlx?=
 =?utf-8?B?cWxXNk9jMHZlMXRBVzcyTDZpeFR2NDV4N0VSQm5yK0ViSURnK05JVHJUTzNK?=
 =?utf-8?B?QVlucmljQ2szVXMrdVBycDBXdWRmMDIwSUhpUlFuQ0ZlUUJKSVJkZEtBZERy?=
 =?utf-8?B?a05nb0hjOGVaOXFkM3lLUVdYeEs1SjMxRStCTWoxR3Q0RUpsTkM0dFB1Z05D?=
 =?utf-8?B?dTQ0N2RLYjdrRGVnVGVuM2VXUEtXc2tvMkhMakQ0eW5JTDdBcC82dmlKNGcx?=
 =?utf-8?B?T3o3ZWJDcWVTclhCMDVuMkdtZEoxZ25ZNUpiRTJFZjFKU0FrTC9hc20zMFQx?=
 =?utf-8?B?K2ZiM2JPRWtNMUlsbFQzZ0I2VGVBa0ZQV2ZBRUpsV25OQ3QyWXdqaUpPcXo3?=
 =?utf-8?B?RzhkcDVOMkZtVEtMSDlUSnppbytIaVdLejhUN05lOGsyMVpoMTlOK0N3Y2VB?=
 =?utf-8?B?MzhxVTRZemgxTUI5ZHhjMXhYQmdieUVBTERTc1ZsemZmYUxxUy9INXlYazI0?=
 =?utf-8?B?U3l5TnpWUm1OdmFxa1ZFaWFjcEgweU9mTmJGTmQ1M3hRSzBqWW5wWm1wUk1B?=
 =?utf-8?B?N2FubWlTMkpKNHRJeVV2UVA4Z0pSLzNYWWozdmVFVXJyVWhydGZGUUVCZU9T?=
 =?utf-8?B?OWdNUFlMaENjYXBuKzJVODRGcG5SVW5NSWx3alBnaFUveUJiZmRla3JjUTk3?=
 =?utf-8?Q?YjIk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB8283.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K1VwVW9UUi9LUmhqKzcvVFg1R3ZpWGFMYzM4YWxQZlFDd3BrY1VDZDBWZDJZ?=
 =?utf-8?B?TnU0NWhWaEM1Smc0ZDVMVDlBdHNaendIZWhmUGNPencva2pUZzFmY1ZJbG1E?=
 =?utf-8?B?cG1OMXllOXNYVlVPL1A1dXphQ2hqZ2RKSHdqd0hyZWN0d3E0dTR0b2JKS2NL?=
 =?utf-8?B?emI2WmNUZHAvTFp4b0IvTkJiTlNWVXZmK3NhdWppU2dSNUlFQ2lNV1ltWmhq?=
 =?utf-8?B?UDV0TDg3RklOOXNBaVU1TEZoZnVDWTI1RTdwZEtueENjSnpScWFJODg5Vm1G?=
 =?utf-8?B?R0F0M21WVTdPK08vN3N6MjY5RCs4Q0ZpbFdSRXZYV0sydFR4b1lCdTRmbDVJ?=
 =?utf-8?B?N0U1UDFpd0Q0bEp6S1YvclNlSFpsQUlXS3JMSFdUOThoYkZhSTdvMDVqT3Zl?=
 =?utf-8?B?T3JsYk15aGVNNVVtVGx1S3UybjBnaGFvVFpMRndBbXNTWnJ3TENYVDlJSk12?=
 =?utf-8?B?K0ozVExkQ3RQMDh3Mkh6NUtIMm5GSmtqdjZlcVFpNk1Qb1c4R3I1cDAycmNW?=
 =?utf-8?B?UmdqNXNMekg2Q05Fa2p3dnlBcnBCM0FQZTc1VHdhK0ZKc0tRTXJWZm9JdUZ5?=
 =?utf-8?B?REI1SHdMR0tmZjhuSEJlREtEakxFMW1TdE56MEZaMmcrRzFvbDIyMlR1WnB5?=
 =?utf-8?B?eXA3UDh3Y0x3YVlVZmlRWEpodE1mT1RrYlF0dG14Um41di9QQVRvNWJOVlBh?=
 =?utf-8?B?elhFYVR0dytqTFprR2ZnVTN0aW9GbjlobnVSZTBhTHplU0ZCblQvbzgxZGcw?=
 =?utf-8?B?ejJvUER2MHpSU2NuQjNWczNyb2psUlZxanJlcXoweHZXTVl2ZkZ0S0djT3d3?=
 =?utf-8?B?a2tCZXBaODZHZlRoeS93NVFDTUhLSUFOTVhVN0J1MzZ2bi9Rb09kaWVRazRa?=
 =?utf-8?B?MWdUQ21NNUUzb0p1MEpvbHhTVlNJZkxhMWd3Y2ZFa2phTEQrcUFPbm4yRkw4?=
 =?utf-8?B?a3oyM2JrN3AxbkNXS3lXVHFVeXBkZG1RMk9Pd3JkMGYrNTlCT0o1aXk5NTJS?=
 =?utf-8?B?bzhFNmNjNCtnQUZPY1NSQ3BmV05YMk1sdjZ1NlN2UGZVMys5a2s1NUI1MTM2?=
 =?utf-8?B?a0gzRU0vUzZSV1FsYk1LdnVkT2NRelVPaENwbHh4SWphRWZqTEJtVzlVSTBu?=
 =?utf-8?B?andSVmdwQzVlWTFZby8rUktaRjVpQ012U2luZWZ6dWhEWklnNTg4Y2pzb1B6?=
 =?utf-8?B?bmRHdFlhTk0zOUk3V2tkVHhsV3pnNnFhSlJncWhvYzlNdm8vN0pJNS82UHQw?=
 =?utf-8?B?QVUxbTlveUZxY2lPcENRaEtHd1orSXlpVTF0RXh5OEZiM2IxeWxSc1Ntcitv?=
 =?utf-8?B?Z1h3RVZiN3c3K3NLcGpkNDlzVm1GMkp1TStUYWlaZXJUMlpkZ2Y3ajc1LzV6?=
 =?utf-8?B?amVTT2MxdzRWaHlIVEk3eXYzTE1tc0NuZ05EZ2FRV05qT1VraGs0WncvdzNr?=
 =?utf-8?B?d1RJc3RLYWc4OWhzSEVyenJqbi8rckQ1bkJTOFN1RjJoT3RTRUZwZlF4WTh0?=
 =?utf-8?B?ODBMZDhPRlFmUTRINnp5Unpma2wyMSs5U3Y3NU5uMkFqdjVSOEc0eC9yUVor?=
 =?utf-8?B?eDM2T3FndUdPTHVHMVZRMlJvMUNNNDhZYjI3VmowMHFqUXlqSGpDa0xxdXM4?=
 =?utf-8?B?Q21KV0ZRazJ3Z1VYamlYVlZzUnhGeEc1d21CZDM0Z2lWYy9FNXdJQWtpLzZ5?=
 =?utf-8?B?ZGt2MVhOdHB3WHoreGYxbXZHNXROVWIrQ1QwYlVaWlhjRGYrNG9sRWJ5em9J?=
 =?utf-8?B?UERVQThvRitXdDZmV0xrVzVGY0g1dkpQV2lnUWVtc2ZHYmk0TkpKWVlkRlZU?=
 =?utf-8?B?SGphSGdBYVM1QWxaQ0E4SkMrN1dNelVIOHdSZW42V0pjb2xYaFN6UjVPSzZI?=
 =?utf-8?B?QXFLbkpwSTFGam5yaUZJYTJuc0lSNFFPMXZkeDNDcFdQS3I0cWQyRzJJYjhD?=
 =?utf-8?B?N1JPdkhqYk0yekh1T0haSks4OWRJN2lGcHhKcjBvMm5xcDY0dDlWRHdjK2pR?=
 =?utf-8?B?MXROZFowTHBXQWR6bFFUVUFnRGVHeW5IcTdyNm5LQktBNm1TVWdNVTc3amFz?=
 =?utf-8?B?a0l0Tjd0bDhpdlhCRGRud0pES3B5L3JhcklOOFRLcXdxY0MzY3EvcVFxWEVR?=
 =?utf-8?B?QkgwZGZzMDhveldZTE5CWGs2N1c2S2ppRVZKSnRQR1RTdXR4a2U2MUE3Skoy?=
 =?utf-8?B?UmN6R3pDM2tJTEhqQzdvL2lVeXNrMm5UN3Q1dytWcE1sUHJINzJkbDR3VFp2?=
 =?utf-8?B?SmEvNHVZSXVEaWg4TkNsd0RMMFIwZUNrcmFZd0dOSEl4RWZUVkRhT0NlNUM2?=
 =?utf-8?B?Vk4zR0VPbkM4OUhkdGFtZGZrcmx2Q3psRVh0eisvd3ArYS9ZVTUxUkhrUGFZ?=
 =?utf-8?Q?6iBhWWwodN+7qYDI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b46e2816-7f9b-4f13-63e6-08de63e0cb1f
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8283.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 11:30:26.7622
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eGXamNq7TA8SBcIiQmNlLxSPFJN1TXQgiIM5tc2fre0+XhZwozLW04akT3UnRaxp2P0uK16nyobpV80qrFv7lrY/jWdE7yTftG46aLVyd1s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4801
X-OriginatorOrg: intel.com

On 2026-02-02 1:20 AM, Kuninori Morimoto wrote:

>> +static int snd_ctl_write_verify(struct snd_kcontrol *kctl, struct snd_ctl_elem_value *control)
>> +{
>> +	struct snd_ctl_elem_value original;
>> +	int ret, retcmp;
>> +
>> +	ret = kctl->get(kctl, &original);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = kctl->put(kctl, control);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	retcmp = memcmp(&original.value.bytes.data[0], &control->value.bytes.data[0],
>> +			sizeof(original.value.bytes.data[0]));
>> +	if (retcmp)
>> +		retcmp = 1;
>> +
>> +	if (retcmp == ret)
>> +		pr_info("kctl->put() returned the expected value of '%d'\n", ret);
>> +	else
>> +		pr_warn("expected kctl->put() to return '%d' but got '%d'\n", ret, retcmp);
>> +	return ret;
>> +}
> 
> I think this is easy to read ?
> 
> 	static int snd_kctl_put(...)
> 	{
> 		if (IS_ENABLED(CONFIG_SND_CTL_DEBUG)) {
> 			/* Code with verification */
> 		} else {
> 			/* Code without verification */
> 		}
> 		return ret;
> 	}
> 
> 	...
> 
> 	if (!result)
> -		result = kctl->put(...);
> +		result = snd_kctl_put(...);

Hello,

I see the idea - reduce the number of if-statements in the actual code. 
What I decided to do in v2 is the above with a little twist - enlist 
macros. Not a fun for declaring yet another function with a single 
if-statement. Also, opted for "snd_ctl_put_xxx" instead of 
"snd_kctl_put_xxx" to match naming pattern most widely used in 
sound/core/control.c file.

Kind regards,
Czarek
