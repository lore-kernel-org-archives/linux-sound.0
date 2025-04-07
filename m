Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC4201A4F2D
	for <linux-sound@vger.kernel.org>; Mon,  7 Apr 2025 13:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744033358; cv=fail; b=huwSbSEAD6lsvmkI1vM+HwhLpSKrZ7zMo+OwyrakU+WxIdFJoQOO8r+Is3Q6d/yDjqArOurNIfIcSNIhMqYH2ozVWu9uLqP6pm9hs8ud0Bom9vXB05vW+3rytN2Cg8xv1zmuvTzFF9NEteyjCJZebbBGkiA7R7hbswsn0NAUb1Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744033358; c=relaxed/simple;
	bh=tFGd5wz0StvSQYWIhYDLAAymHbxNVaNfpEmUwePebvM=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=E7x+LHWVZDv4NgJS2o7NP56eG0KaCcllu0CQymJ9BNMQ9HcLAtSqs4SYwxZkbyFVgtw7xetseCiW2U6NVNKVmfLJF6xrBQ2bhSUATR5P1FGfM0PX6jJAF0rB1FpJ8urIC6mtJzlk9/J9dYDH1O7lYpHMVZyNTmrrANuwbJ8dNso=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pwx/UYQt; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pwx/UYQt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744033357; x=1775569357;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=tFGd5wz0StvSQYWIhYDLAAymHbxNVaNfpEmUwePebvM=;
  b=Pwx/UYQtBJ/5tmCzJL6hVebfmm5zSmU05BbFjdOz13+FoaF0QoNLJtmy
   +lwtyLjjVFsZWx/dFyveEHhi8ygEQMcMnPf6F4tDU8lafwM+05szuEiY3
   Zd+KFwUu3CJrOZzjPUYYsrBhh2tmRuiqjBuuoY8g37V0w1qkpJVsfNrXb
   rsSxNTvoWMFNvBxMUkN4cEexODDntMXJ/sGjMH7ttq8ljpCbmtHolbR0o
   jQXZaB/JCsWtKZ8CpSzF79FFyjN+tn8tEbjA6lq9la70Y1XX5QuIqvRpY
   W4hJUzoAfRINK/r4cMY7mg7t9w74AW1RFAwwn9eWaEeshJfGOBqKrCp2m
   Q==;
X-CSE-ConnectionGUID: bnVkGVuBQOyMO8k0d73P/A==
X-CSE-MsgGUID: zScY/xtVTdKuJeE3OckTDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="67892245"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="67892245"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 06:42:36 -0700
X-CSE-ConnectionGUID: MUPw9WviQG+31EAcHx4Iag==
X-CSE-MsgGUID: KB9tR9dPS+WykIh8sVWBYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="133169495"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 06:42:36 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 7 Apr 2025 06:42:35 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 7 Apr 2025 06:42:35 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 7 Apr 2025 06:42:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RGZs2T7PFms0wUVONF2pY5AgvpF3p90fAxnxz3ADKeLaQdyC/sBw/bZu7BG/7Mn8eIsu7h2IaSBCm0l3Ik5sFiHXs7BLIltyH7OURXTvK/apvLf0/rFpqqAlMmZHa3W+U9pL1KiRZzXGUzUHatRLfIpCQfodOx6PX9c7lULxgx3s1Aw4vG/uzkyofNaQ5Rx+/3mp4voLwhhxLaFfqr6Y8ObLVjH4BdgFAFAeG4JAv1pa42+2WJdNVNrQyenZNuvFEjHrYk7wcEcVgBBrpiF835pwpak1muPIFMhMMXwfs5rcAtXTnBBup6tFyfmHre/1VXlelGY1k0vKOytqapP0yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vt6IqmoNmrLj52x8oatm2H4uEE1oXydW/GPZaFbpako=;
 b=sTsNO8zhSNG/X1WWkQofk0JueV81kBKi5h8fbfVAUFDYhbmQCuyao+2EcqIoyunrorz+K87UW7JnNNRflqF1J2R1IpeWXmyqOtt5eIH2eiArN81i5pZGqjxG+YBcaqiDFPDlL/I9uy/Ef8qv8cNCx9cdcowEP9lNmHF/h4vCaJt+KyrX7/Vj79tzolplV319SAViNcH+xJbup6dV95QT6AGHpTil8q/C3ue13lVrXtfGBwcSrYwS+tgj+qUHWzOC6wDCrTcG2Eddm+LPVD0hAdi4ET8Ha20nOT0E71jnc4OWivpaCxn9dTeR0N2E4O6YCDfMWtzIvX4jmSCDZJxgSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 DS7PR11MB8781.namprd11.prod.outlook.com (2603:10b6:8:256::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8606.34; Mon, 7 Apr 2025 13:42:31 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cd01:59f6:b0f8:c832]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cd01:59f6:b0f8:c832%6]) with mapi id 15.20.8606.033; Mon, 7 Apr 2025
 13:42:30 +0000
Message-ID: <c27311d1-8110-4591-82fe-1ca89037a97f@intel.com>
Date: Mon, 7 Apr 2025 15:42:25 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/20] ASoC: Intel: avs: Update machine board card names
To: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
	<amadeuszx.slawinski@linux.intel.com>
CC: <linux-sound@vger.kernel.org>, Jaroslav Kysela <perex@perex.cz>, "Takashi
 Iwai" <tiwai@suse.com>, Mark Brown <broonie@kernel.org>
References: <20250407124154.1713039-1-amadeuszx.slawinski@linux.intel.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20250407124154.1713039-1-amadeuszx.slawinski@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1P191CA0013.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:800:1ba::9) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|DS7PR11MB8781:EE_
X-MS-Office365-Filtering-Correlation-Id: 67bb1ee5-6a6a-44af-1ce2-08dd75da0b32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?enNDaWVydjd3aWc4Z3c3K25yZGI0dDBOeUlqcTRFdVdMc0R0TXhuM0dHTldz?=
 =?utf-8?B?TnozNFlOdjYyL0VpRVE3WFFpdG1NWHRKL3I5Njl4UGFKbFhvd05QUmxHYnVU?=
 =?utf-8?B?UXEvZjNvVkdScmF5K0NWcVVobDFqdmU0QmQreUdsWHBRN0hsTmw3dSt2WlFU?=
 =?utf-8?B?NmJVMEI3bWVLT21TcXVMSXh4OXM4NkpFQXkvL05Ock93R1RXMDAwYWwvU2Vv?=
 =?utf-8?B?RjErNGhTZmJLc3NRbWNWNkRWYXA0NERIa05lV2I5UDlSMkR1SjVJVXR6M09z?=
 =?utf-8?B?QkVHMEFEMlpVdGJkRDc5ZDU0WGhzLzVoOUpaMDFja0g5VTZXano0UzVSRWht?=
 =?utf-8?B?UDhEYU1odktUcmg0RXNXaXppQllsMk1jWGxhcEZ6b2E2UmdvRmk2RjBVL3R2?=
 =?utf-8?B?Q3JhZ2h0aE40TGFESnpaQm5LNkhMQmFMREZUa1p0QUNSYVdGeUhORENBcFVH?=
 =?utf-8?B?cEFjZ3ZrdEpYdUJRWXRBZWh5VUlHRGlJNDgvNS9WeEozUllUZjM2Y3VmN1VN?=
 =?utf-8?B?ZmczWElxWDF1a0U2aGdPU3FGQzlrUWZYalhxbUluenJSQU4wbk1XWGljWGNY?=
 =?utf-8?B?dVhNWFdocW9QRnJGRGRoS1ZBaEo1OVM0Uyt3RStGMHoxdmNTM2Fkd1hTa3ZF?=
 =?utf-8?B?RHE3RlhtcUVOU0ZrYWVpejliRHhoNlo3VFhWejNxbmZDSGRkL1c3YThpUE1z?=
 =?utf-8?B?blVmRmUzbDdKeFpwMlVMRGtoVzQzQldyZStxMDNsM0p2WXBkUHdlblkzQlZ1?=
 =?utf-8?B?cG9SZjk5WDRXRHZCVW50MHd2cks4UlpteHQrelhTU092M29pMEg4d0ttNzRM?=
 =?utf-8?B?OHR6UTlPVXFpSlZ3UkxRR2Q2TVlkejdtVC9pRWhpTG04cEpQWFpMQlhzT0ha?=
 =?utf-8?B?UFptN3ozOXRWK0NaSjJqRGozY0wzdWljQkg1amJvazdHekl6ZW5WZ1hjVXZV?=
 =?utf-8?B?cHR6SjAvUUNZd0Iwa0tFZURNbGF3OVJaVWQ2WDA0YzI4aTZRYW5CbUVrcTVB?=
 =?utf-8?B?YzNBRk83V2NqSWU4NXFMYkJQRGN6cDlhQVN6S2dSN3gwT0tiek1veG1MQzNy?=
 =?utf-8?B?TDI0MjlialhlaXlXR3N1SHFobHlkZVpxaXN0Y1NpVVZ4WVZzakxwOGt6RFpD?=
 =?utf-8?B?THV0cFRWZnNGMFhmekdpTkVFMGxYczFQMExtMzlVdlVYTndCNHhjRFF6OVY1?=
 =?utf-8?B?ZGlyY0FqRlNiQ2tWTFUwSFdvcCtsSEZUcDN4K0NFKzM0KzFXVFhkYVNXR0lD?=
 =?utf-8?B?OFFub1c0MU1MWDZ5RVEzQllLTndIR1pDK2owL3ErbDFwMEVxb21oekpjb0pY?=
 =?utf-8?B?U3c4Z3ZBSDdpV0ZVQUxWOXA5STlDRGp0aWw2blJkUTZJMGRHK1JpbmFTMHV2?=
 =?utf-8?B?eUUwRHMySkxOb3dOcUFoZnJRK2IvTWlUbUFPZmtWbXVCSWYxNi91VDdKN1hR?=
 =?utf-8?B?Y0wraXowSW4vTHJQeGI0ZXd1Q1V2WGhOT3JxUFMva3RRdUNyS3prNGhnejY3?=
 =?utf-8?B?ZkY4aEhMcUVROTBRUzJIQXdaOThocGoyR0JNWk5BYVNOcnRPcHRIN3d1VXQ2?=
 =?utf-8?B?dlBXQzdvWGgyNzk1NURaK0x6TEZWS0ZBMkE1ZDU0Z0xNNEU3dmdmU0NGT3ZL?=
 =?utf-8?B?OHEyd0F3T2ZxSlBxRDFVejZVYXJIZzYvUllROFB0blVNeEFFYlQyQ1J1WFky?=
 =?utf-8?B?cWx1Uk5zK0pUU1Z6Z3FndWVBc0dSR1pGZWRSVi9WU2dqSVlSaml2QzlIUXBG?=
 =?utf-8?B?dFhNKytyMUpQUUZBRXVRVWQ4WEZsUHJMYW5IZGtNWnJOTFFOMkh6WXJmNlZ3?=
 =?utf-8?B?UW9wTC9tc2E5TmVBWnFPUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6375.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SWJUZzV2bzd6Tkg2WFNNZEpYdUlwMW5vd0R3WVdYVndEdWVIeWN1VWVxcDBY?=
 =?utf-8?B?VDZVWlNFdHJnYnlVc1pwaHVvRXZVWXFOWSsyVkh6MUthV29vUEkxeWhWTXlm?=
 =?utf-8?B?eW53UXFzWU9JeWlpeUFWelA1dk5vbVRaMlltSmszL0tSVm5ldVF2WVlXczdk?=
 =?utf-8?B?TGdpbHNKNmVUSkpNeTBteWd2Y3ZhZkYwQjlUVG45RlZQMlAzV3J0Z2hnVFBl?=
 =?utf-8?B?QVRPMG5WVkxpQlc1eVhKZnNFNEE3R3BMYkREQkxXajA4ZWUzUmduNnZlVXIw?=
 =?utf-8?B?VTVnTnduTURQcUE1QUxUNmtlRnRNT01tbHRtZ2txaW1IU0p1MXVEOEMzNHcx?=
 =?utf-8?B?b0NBeWNBalZNcUhMMElqaXBjN3ltaU1VMThNeUVNbU9MSFZ0eTdnOSswN2pP?=
 =?utf-8?B?eGRvRmdpVWdzUVFZb1VUYkNMNDh2V1pSSWUzNE9DbTNjYklNdWRWcHJzSXdI?=
 =?utf-8?B?aWwyRmFHUTE0c1lTRHFobXdzNmJvVzFnMEF3S2d0QlpOc1k1V3l1SHVMRkZZ?=
 =?utf-8?B?dnlDMzhwZE04Y1ZSRHU0VjlhT05iVHUrQjNxVkRna295VHdGTlRhcytKc3Js?=
 =?utf-8?B?c3hGVStIVnU1THlXdzYwMFJxM1R1MjU0ZFlKbXE4UXNyOHNSeGJ4Rk11TEV5?=
 =?utf-8?B?azhwaFpZUC8zdU80ajFreDFuNERjbnBRdjBOamF6cWdZbzVDWllqTEx4MnpP?=
 =?utf-8?B?RDRwSkhITG44QW0xdjlHR0xEd1g5NTNyWXRpT0I5Y3pOeU41MHJHaVhGRDd6?=
 =?utf-8?B?OTZPNUtKdXNwcGtXMEYxNVNYdWNLUzA4SHF5REMvVXFzcFlVaWlYS3FnTUtM?=
 =?utf-8?B?K2JQQ0xwc1JGK2F0WGNTNWZ5MDQwTnVraVFIaHR2cVNHVXZwSkcwbkhZdUNR?=
 =?utf-8?B?bzlnaWw3aVlFU1c5YmtRblRtemRPb3oyRWFKNG5RMWVvRHF5bHZhRmNSYUdn?=
 =?utf-8?B?aEdQaTRJYWVQUFdMM2ZWTVVjcW1QNFE3Z1doMFFCZ1UySU0yZ2VSQW1pL3hI?=
 =?utf-8?B?akN2WnBMb05xektheG8rVFYwY0VLZVZrSGJud2kwVDdNQjcyOFlDbC9oNmlx?=
 =?utf-8?B?YmZDemdVR2lyMURQMHZST0N5TzN6MmZLSE1LS3lKTkU3aEdXelpWeWkzSCto?=
 =?utf-8?B?d0tMekFKOC93UEVVbnNPTlordmd6SXRzVlYzb2hEczhDck1tT0xhNnlsOUFE?=
 =?utf-8?B?aDJaZ25mUjEwR0U5SW9RcmtoejBCUlljamhRcUdoOWxpcW95UGRMZzlLUU1a?=
 =?utf-8?B?OVBFZ1gvOVluVXBBdkVTeTBLb1llZU1ybmQwVWVTS2JUYkpnM2RHenBCU3pJ?=
 =?utf-8?B?NUNRVmNVcHQwb0t0TXliSEgwTmN4b3o2WnhIUTJOb0wwaThsRzJ5dkZKY2Ex?=
 =?utf-8?B?bjUwRjB3TC9SZkJEOG5qOVBQRjkrQ3N2Z1VoSzhrMXljK1BsZldKNDFQTmJr?=
 =?utf-8?B?Ynpsem94QlpERUYxV3Q3RFoySzRydi9nSmZiaEE3V1N2T3RqNERIQzZkU241?=
 =?utf-8?B?Tnc3SThCRkg0R2tVTWdra3RHbFlwSm51VkVwM0hxSUdLU2F5ejMrUGI4NHNr?=
 =?utf-8?B?VCtBZEhlSW50NlJXV3E5T2hBK0NVREh3d0Nob21XYXBGa3JzcE9rN01qbHhC?=
 =?utf-8?B?c0FpZGF3ck1BVHZaVjRxQ3V3YTZGQWpTLzB1b01rS0h0T05yTHFxT0JmeURS?=
 =?utf-8?B?V3gwcFBjMWIvdzUzZjVVMnlGOHk4Q0FpS0FhQy8wR0MwYm1LaFlkZCtxdDN1?=
 =?utf-8?B?amEyVFhhQUlvUitIRUpmbWcxcWpTRWdpZ1M0RGhNeStxU1g1YkU1MjJsVUdn?=
 =?utf-8?B?K09qdWlzeWFmc0ZreDd4b1BlWjZmYzRqL0hCbG9CUTQyUTVMSDdwY3djNmh4?=
 =?utf-8?B?cjVzM1NZbkYwdUxIZDg2T3h5MFd3WU1ndi9tK2ErZmUxeW54UkR4ODlqWWJK?=
 =?utf-8?B?R2RsY2dwSWZCTXdGekZ4Rzl1MDRibFpzV0tja1dWQVVqRk9tUmtFSW9GZU1N?=
 =?utf-8?B?V0dseEE4T2RWdFF6Zis1bWJXOVZYdWRiSktaUHJpWHhFYjFzeGZvL3NESTNm?=
 =?utf-8?B?OXZEN3ZrNVFNT0ovSDlJL1plcHJiYXdGbTZQWjZuV0poNGIzbVJRY044T1RG?=
 =?utf-8?B?VitlMkhvWUJBQUtpRC9maS94RS9KeGJQM2ZaSHlGRDBtZmFZU3pUdHJKVnBG?=
 =?utf-8?B?V0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 67bb1ee5-6a6a-44af-1ce2-08dd75da0b32
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 13:42:30.9072
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QpljM0zL1W51XsouSDjeZNq2kBGGykgkaCARU7NjmcXBX17IVRQV5w1aOuqUkRk/TZKfoBuitcc3pNpy3K5alBPzjZmHjoXtpWyHKe3Pmq0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB8781
X-OriginatorOrg: intel.com

On 2025-04-07 2:41 PM, Amadeusz Sławiński wrote:
> As discussed in user bug report [1] & [2], it was identified that HDA
> card provides wrong FE device numbers to be used with UCM, at the same
> time it was requested that we change card names to better names.
> 
> This patchset does that, by adding option for going back to old
> behaviour in first patch. Using existing way of enumerating FEs from
> topology in second patch. Then setting new names in all cards while
> providing fallback to old name. Only exception is probe card, which is
> used for debug purposes only, where we just directly rename card.
> 
> Do note that patch 2, will require updated topologies if topology
> exposes more than 1 FE on card. Old topologies didn't assign id field
> and it defaulted to 0, however when we use this field by setting
> snd_soc_component_driver::use_dai_pcm_id field, we need topologies with
> distinct values in FEs. Necessary changes are provided in avsdk and
> avs-topology-xml repositories ([4] & [5]). linux-firmware update will
> follow as soon as this changeset is merged.
This was quite a task :) For the entire series:

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>

> [1]
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=219654
> [2]
> Link: https://github.com/alsa-project/alsa-ucm-conf/pull/499
> [3]
> Link: https://lore.kernel.org/linux-sound/20250127144445.2739017-1-amadeuszx.slawinski@linux.intel.com/
> [4]
> https://github.com/thesofproject/avsdk/commit/a879c8ae4ba7be53b8ed528da1361a8c62475b6e
> [5]
> https://github.com/thesofproject/avs-topology-xml/commit/9b94d52cbc5c1e07c8d9503c86329cd62ea4c9e7
> https://github.com/thesofproject/avs-topology-xml/commit/bdbc8d6ba9ea6db67daed9cbbaed3c23ff112ecb
> 
> Amadeusz Sławiński (20):
>    ASoC: Intel: avs: boards: Add Kconfig option for obsolete card names
>    ASoC: Intel: avs: Use topology information for endpoint numbers
>    ASoC: Intel: avs: boards: Change da7219 card name
>    ASoC: Intel: avs: boards: Change DMIC card name
>    ASoC: Intel: avs: boards: Change es8336 card name
>    ASoC: Intel: avs: boards: Change hdaudio card name
>    ASoC: Intel: avs: boards: Change sspX-loopback card name
>    ASoC: Intel: avs: boards: Change max98357a card name
>    ASoC: Intel: avs: boards: Change max98373 card name
>    ASoC: Intel: avs: boards: Change max98927 card name
>    ASoC: Intel: avs: boards: Change nau8825 card name
>    ASoC: Intel: avs: boards: Change pcm3168a card name
>    ASoC: Intel: avs: boards: Change probe card name
>    ASoC: Intel: avs: boards: Change rt274 card name
>    ASoC: Intel: avs: boards: Change rt286 card name
>    ASoC: Intel: avs: boards: Change rt298 card name
>    ASoC: Intel: avs: boards: Change rt5514 card name
>    ASoC: Intel: avs: boards: Change rt5663 card name
>    ASoC: Intel: avs: boards: Change rt5682 card name
>    ASoC: Intel: avs: boards: Change ssm4567 card name
> 
>   sound/soc/intel/avs/avs.h              |  2 +-
>   sound/soc/intel/avs/board_selection.c  | 37 +++++++++++++++++++++++---
>   sound/soc/intel/avs/boards/Kconfig     |  8 ++++++
>   sound/soc/intel/avs/boards/da7219.c    |  9 ++++++-
>   sound/soc/intel/avs/boards/dmic.c      | 10 ++++++-
>   sound/soc/intel/avs/boards/es8336.c    |  9 ++++++-
>   sound/soc/intel/avs/boards/hdaudio.c   | 23 +++++++++++++---
>   sound/soc/intel/avs/boards/i2s_test.c  | 13 +++++++--
>   sound/soc/intel/avs/boards/max98357a.c |  9 ++++++-
>   sound/soc/intel/avs/boards/max98373.c  |  9 ++++++-
>   sound/soc/intel/avs/boards/max98927.c  |  9 ++++++-
>   sound/soc/intel/avs/boards/nau8825.c   |  9 ++++++-
>   sound/soc/intel/avs/boards/pcm3168a.c  | 14 +++++++++-
>   sound/soc/intel/avs/boards/probe.c     |  3 ++-
>   sound/soc/intel/avs/boards/rt274.c     |  9 ++++++-
>   sound/soc/intel/avs/boards/rt286.c     |  9 ++++++-
>   sound/soc/intel/avs/boards/rt298.c     |  9 ++++++-
>   sound/soc/intel/avs/boards/rt5514.c    |  9 ++++++-
>   sound/soc/intel/avs/boards/rt5663.c    |  9 ++++++-
>   sound/soc/intel/avs/boards/rt5682.c    |  9 ++++++-
>   sound/soc/intel/avs/boards/ssm4567.c   |  9 ++++++-
>   sound/soc/intel/avs/pcm.c              | 13 ++++++---
>   sound/soc/intel/avs/probes.c           |  2 +-
>   sound/soc/intel/avs/utils.h            | 16 +++++++++--
>   24 files changed, 224 insertions(+), 34 deletions(-)
> 
> 
> base-commit: 3a0f0a4355df0240485ed62b6bd6afa5b3e689c5

