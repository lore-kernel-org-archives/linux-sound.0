Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7413B3A9017
	for <linux-sound@vger.kernel.org>; Fri, 22 May 2026 15:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779462504; cv=fail; b=K5rFDqT8HYIYbayJfYT0PFNBCbMcTTPA5s0EcqeYpakbhqZqMmZxvXuA0tFfUrTgDjKmdh9QUqXrkiAiVYg+5I8XWfmqk+GO0YNQ49rnG9kG0Lk+kISqyw83wUqKtQnvc012kngn2eQGIAYzKGm0XH3Egb42N07h1e67w8I6nHQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779462504; c=relaxed/simple;
	bh=pwcJonaM7ofpgTEntWx2mPqYCLpvlSviWvA89PNR6sQ=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=B9B3vnPO21ompIapjQBHU4Z/hMHYYIs21nLT5mKrKOjgz7VPki+VnUZ2jwJ3B3Yu2AxKL2nusqBKhFKISwEFEZkpz0igQfKyeL3C9GYikUNdIbZ1nsUEFAn3cNDf0bcBGiGtenxcFT+kHVaMpCPdGvtyNMgHGuqOKyf5CEBRWfc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JDC7yHiW; arc=fail smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JDC7yHiW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779462503; x=1810998503;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=pwcJonaM7ofpgTEntWx2mPqYCLpvlSviWvA89PNR6sQ=;
  b=JDC7yHiWFWeypQiWFHIoNbnhUnk0MkTIvLw/yNJDt0q1t20UY21xuMu3
   2FetjvCRqXZPVBjP1NBNJqOmfFx0HxOU+lUtKJ+pBJqJc3+T1Zdpz+NS6
   VUsoBBIgBu8npKsLXWHld+NkPG3KVgpA0OnFX5DrI7+eelK5GVEDL7rr1
   eVq9ft4o2/ciGa75XmfS07Z5wvZkhSaL3LKLAZvNU44utOHrHSN4uOLIV
   wCI1n0OWs+vv77xeuo0BagfL1NfKdeyMFp729FCVQnxMTITCZR2Xi9L6i
   +TJSu2Tw/lanyAjacojnuAwbG7VnboJc9AIpfgMmzpS9QpZbVIzVngKG5
   g==;
X-CSE-ConnectionGUID: 3mt5+79RTsWWOzQZ7ka1yA==
X-CSE-MsgGUID: BzNOBtjcRRWGTE9VS80X+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11794"; a="80296997"
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; 
   d="scan'208";a="80296997"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2026 08:08:22 -0700
X-CSE-ConnectionGUID: zy1VPzL6RbuJo0mxUm6X4A==
X-CSE-MsgGUID: ACXZgox4Q3eJgXPU6f+zLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; 
   d="scan'208";a="240993455"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2026 08:08:20 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 22 May 2026 08:08:20 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 22 May 2026 08:08:20 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.37) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 22 May 2026 08:08:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CzHa9qPKfkXR/bUJTL63CzKS32emylA+50Ne8gg2wH8EH2SgBkjoV7o6tFCpwS/9wbCjPAX7TcwdDAvAUYZ/00H65I2F1tjTfs3rf8t7qbwHl5LM9JUEA7WfTLbXWPzOYAFpRgPTih76obVUcYqfm3ZGkkFaN2KiHdJwxVKRlauj9T0YlheuSsm4LNsQoM3MQ2JQCJP6b9BbErsS1vzCJpLwUF7THEvSw6Ejsjgqg9oZ/13Y/2Ex/jnSkxaxCLycQy7QAakfm0sHVmA8PrvHFe1liViYl+Y3JXtBDx99Q23LzQ09/5nWhU4yrQB8C41G4A1u7b8TF6aoPZ7NZ1rdNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rzwXDjqAu4mlNfAivhpr4HYpnLSjAHZoY4Ge4BJiwO0=;
 b=loEEBrm6AgnevhzB2wJQcimPz3Qv0lnEraYJpFY5+uvqlTngDu7Wf2wQa867iMg/Yy5+HswDmbUmYw6DeLeFahx4GzP9vYxV1z4RuJwOeVx/bvE3L4XndN73jOyVeWUnbAmFW9Zb1aslesZjl8sXX0PRr6qxhv1sgknZpF/UCdcLxCj3ILeZWXNRJtyabEMya9v1l/SPOdgkZ00hjVrfNMj1MA264Q9OImI4V1SLPI/6eVBx3H3bc5uH49ZCRDUFv4GcYahvVgnMqw4ToNFdpsOObx2gc22cQT84hp5r5cMKvtL720YWYoXqeVzymWNa+1KhlaKY2WAQf9Dv2hk2cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6967.namprd11.prod.outlook.com (2603:10b6:806:2bb::15)
 by SA2PR11MB4795.namprd11.prod.outlook.com (2603:10b6:806:118::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Fri, 22 May
 2026 15:08:18 +0000
Received: from SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4]) by SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4%4]) with mapi id 15.21.0048.016; Fri, 22 May 2026
 15:08:17 +0000
Message-ID: <33c1ad17-a2e1-4d91-aea5-5ad76acd55c6@intel.com>
Date: Fri, 22 May 2026 17:08:11 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: core: Move all users to deferrable card binding
To: Mark Brown <broonie@kernel.org>
CC: <tiwai@suse.com>, <perex@perex.cz>, <amade@asmblr.net>,
	<kuninori.morimoto.gx@renesas.com>, <linux-sound@vger.kernel.org>, "Liao,
 Bard" <bard.liao@intel.com>, "Vehmanen, Kai" <kai.vehmanen@intel.com>,
	=?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
References: <20260430140752.766130-1-cezary.rojewski@intel.com>
 <01d1d642-bf24-4ef4-a30d-56884300407f@linux.intel.com>
 <5d8cbbfb-3884-4c6b-aea8-0c9a76964b3b@intel.com>
 <85045e51-e09b-44c2-9266-3e7ee72c4eb0@sirena.org.uk>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <85045e51-e09b-44c2-9266-3e7ee72c4eb0@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VE1PR03CA0013.eurprd03.prod.outlook.com
 (2603:10a6:802:a0::25) To SA1PR11MB6967.namprd11.prod.outlook.com
 (2603:10b6:806:2bb::15)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6967:EE_|SA2PR11MB4795:EE_
X-MS-Office365-Filtering-Correlation-Id: b0e3bafd-1779-4aa2-76d9-08deb813f410
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|4143699003|10063799003|11063799006|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: O+g8zuL/cMs4JqXGJphg9BnCbg/PJklORjojz7888HWz1cVaE5/T3Bpr47fZR4ChAKuLyQj8P4NUJsEMQLs5buNOrkYukarlFy6AYpR0KWSAx//mbCyuAidabSJRPcyGE4MnbJ/kt9cfWfUa3ccw1NplF94gniw3UXQBzcTJJ7sImCy7IW+V5JUXfFANeHpTsKhxgpgHTSilFclFEKjE3RWS2aA3IP6lH8DCVz8Txz32ccdwzzilPVjX2nlSMnYvtecj85Q466qB8PfLsykvVal5xg8DFf0znJRaoubZHzT1Yds+XheDL0abc7DwuArLycTClUECe7EvKx/IpqYzHVO8bRsOanJXhpeVjnwVRaL/hbOc58Ra6gXmkQnNusnqEPv8GUsuA4NG/4UarXW5+9fhO+WPilYcP7jc88iiDW3jNMJHy4PEmNFrkZXNG8Vx2F8TSrdbB9d80ts+GewFUIZynHaOYaGETq9c51jItaEQXpYtCf5hFjBqNmV4CwiwHWMDvLHGuXHL7LxX2KEe+pi+R67a/SYaLND45oiZsAn7CCHexLgAAXFPgFZLvDVHep5fdAFeq+SydMA3lKf+EywAIgAw5o0ZGj6HsOdGgnwUsawpc633ZRyIaHsDC1DPXj/Xs7hahcHXNf95SvPzavCM4mFKsCFSR2nJlVuTdwK2zHjtVv1wp0p31f3Opars
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB6967.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(4143699003)(10063799003)(11063799006)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dmZJbmZNQzJJRndxTG4vRVdYNkFIN2UzWFA0Y25ac3JoNkErR1VHNjEvdFda?=
 =?utf-8?B?YU1ZWEpBOWV2TGpXWEl2Q1JsY285Y1JEdjBCTjJ5MHVybk12UDI3TFZRYndu?=
 =?utf-8?B?bndON3VvdXFOOHZnSUtVL0I0dkJsZVVMMVltRWpONHV0VU91RjVkNG1MaWpn?=
 =?utf-8?B?dG1RYTFVd2dSTmszRGpoS2ZINTNrNVdCUGVMRkFHRVBZSjFFbi91NkpFQWdU?=
 =?utf-8?B?YmFtQUp5R1Q4S1llanZQMDBmNzh5aGR2L1I0SGxNUXZBM3cwL3p5bEJRMEkx?=
 =?utf-8?B?Zk92QTdiaGRreTNTMTZzUVNYbEF6aGZHaVAvVVdpVWtDZVMvaFJvanFHY0pW?=
 =?utf-8?B?YUlrbmIyV3hUWHk2YXd3aGxnOGVJTjJuSTdDZmVOK2VLeDQvSlQ5c1htdDVR?=
 =?utf-8?B?Q3J4MUppRmttQlk5SXZ0Z2N6Y09qYjJGUHczRnhwcGFCYmJmK1F2cUNmRkY2?=
 =?utf-8?B?WUJXKzhhMFdwL0RnMXdjWWpoQzNxVE85UVh0VnJYcGVRdWtyMmVCRTN1ODU2?=
 =?utf-8?B?Qjd6UVhnTlVTQWp3THd6YW41NUt2Ymw0eGJYc3l6OGdUVGpzcGY1aFZveDZ4?=
 =?utf-8?B?UTZTY2tNRngwa0xuNzNodGZKRVMreW9JajRpdmZGWXo0WTZpVWl1cU0rbnpp?=
 =?utf-8?B?UmpLSUJ2RXhzNFlGcGFsS3VZZGpqTjZWMWhTTjNkcHVDeHFHS0lraGhhbFpK?=
 =?utf-8?B?R3FKWkdXZEQ0MHJ3bFRhY0xYMTQxUDRaNHl5WEUrRCtOWTlvQVdFcEZZV1FQ?=
 =?utf-8?B?ZVJBdEpRNk90cDJ4eFlIVjRUQnVQYnR6RlNjVjFKT2pjOTF6ZUNuWTZZRHJu?=
 =?utf-8?B?L2VMbnl2VlRhQ2RWZCs4NzBkSDlqdzk4a2toRjd4WGtiRFFnTFZWM1dlNk1S?=
 =?utf-8?B?N3NlM3pVQ3l3N1lCMFBDdEtUaXJQeXUrWHJpQU9oQ1lBUFF5WmpiUTBiVTJE?=
 =?utf-8?B?akdDbXpZWFZTZVFMRU1zVTJ2NjZIdzNzWEQwcE9hd0RZdkVib3UyRitpM1Jx?=
 =?utf-8?B?dWtObit6R2JCbmNLQllFMGt5b05jMXBXdGZOTmZ4ald3VzVCTmZORWJOWWJj?=
 =?utf-8?B?RXh0NE1odVFXejhPaGZwNUNZZVJLdEI1VTFjbVJ2eDNlcGpoYnRRbGtLL2ta?=
 =?utf-8?B?emowYjhzZlBQWmJ6bDl0ZktXdWMzVTZwNGxMOG9wQkZ2d1dZTnNhbFpIVDh1?=
 =?utf-8?B?cFRRZ1l5M1FmR3FXY1VnKytua1N4d010NDJ2aitaQitaZ0ZJaGJZOFphQmpj?=
 =?utf-8?B?anpOOEVSdTV0Z1htb0VOZ01QTWpDOHgzSXhOMG5Mc0ppNTRTM3JiOS91T3g1?=
 =?utf-8?B?bEk3OThZM2dPZ1poRlRvTGhGcHNrdUM2WjR1VjlNNDJHUm5NVXFqbUQzKzNo?=
 =?utf-8?B?U2RLc1pWakV3UVliWTR5cTRuS25xYWhKaHpnaDRhbkpYK1NOdlQrU2YybkVV?=
 =?utf-8?B?Ny9XbDkvK1M1NGNvcUduekVrMUZmWXprblFKSlNYL2hTb21rcG9nbElPcDBm?=
 =?utf-8?B?NmZVcGFpRXM4QXpsUnduUlkxcDk4NSs3TTg4b2dNTkJ1V1lJRkxXUXFMM2ZT?=
 =?utf-8?B?K21YY2piUTZCdFBBKzd3ZzVQOWRmazJsMjhWM09CZTJ6NmI5TER5ME0yM0Nn?=
 =?utf-8?B?UlhwT0NacHcrc1hIL1RIYXlKQlJ1UHhqODhLTUVHLzA5dW5keUJodEhmLzlO?=
 =?utf-8?B?UnFxRUlJTmluSTY4SXVDUTRrWm9lcUpIMDdmekxiQ0dKdFljYTNybkVFQWdI?=
 =?utf-8?B?SDgyVm5La2NHSzBpdkViL1J2d0NxNGVQQzdWYU0yRWxrRkk3d1c5L21xbFNq?=
 =?utf-8?B?bkorYXlWY3RpRVV2NkxNSDk4YzZ1REdURDVXd1R1dSt3OHpkeXAwUlBuY3Fi?=
 =?utf-8?B?L1Z2ZmF4YXI5RURSYUl2bkxhVjFHRUxUMGFhbDQyZldML29STDB6Z2V3T044?=
 =?utf-8?B?Vm5mWjdJT3VCUklUMzZLV2dpbldMMU5VaGRSc1JuVnB2UG1wOFBvVURiU1Nn?=
 =?utf-8?B?ZkQ4Y0Zld215S2NxRGs0YStrbHFUTEgxUkxwZXJPN3krenlmMG9jV1VjVzVw?=
 =?utf-8?B?dFdMNkMyZUlmTVN0MmkyUXlSZElJdXlpbmxmNUR3ZFhWblFjME12RDcxUE5Q?=
 =?utf-8?B?eFRBbWIySlpXbUFUMWZsM3BZbkx5VHV0akdoMVFUaE9PbmFDdmFoVjRsRnZJ?=
 =?utf-8?B?T25uMUIwMEQyZVF4TFNyNUowc3JDMkNISjV6SWJsT2UwNXJBYWV2bVZtWTls?=
 =?utf-8?B?WENOQkFEYzRyT2ExVU9YNnhnZFp6Q2M0TW8wMjB6OFdGTFZSbkMwSXQ3bzBK?=
 =?utf-8?B?dDJBdlpxYUk2VjFLa0QxNjlPYkd6TkZJUHp5Uks0ZHA0dFI4MjNlcFZDQTh3?=
 =?utf-8?Q?0OEF4xMXwhXFhdJ0=3D?=
X-Exchange-RoutingPolicyChecked: aA7X+xBeSWWnm38qfY9sOM23ly2jJxUm52U5EpZkEQYt+YA4dw9Dwb3U9WFIesP+tEXH1KywdpDBu0A0TUo9vbuLVu5wNXD+oiyBdH3L7hg34bVNkmmEnnmmqSxfMHo1GfIehrdxvTPn+2biaYlF1tS6UK+Gw/ItXELnbWtrazNl3cr6EltRTDgsPvosMiN1BW+qd7Slru1JBB2ueb6DPa4gwewHl4mVNrTFeM0RFuyR4Bn7cREgUZ4QnF4Vlq0LI4b4x4nNNA9s7yANe080ymA3GtD0XyHaGIYWfxG1Ow6PTYTVJqWOiv3BkfBQ0KeXtW6MD+LnnFn4Wa4zkEKaig==
X-MS-Exchange-CrossTenant-Network-Message-Id: b0e3bafd-1779-4aa2-76d9-08deb813f410
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6967.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2026 15:08:17.4894
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zhPzBWLLGj9KeG3V07xj8oNQTd48y1ZjPFZUoPvez4DRYfvCmBQWTXEM9xHriwikzDeT1zwSJXAmwxTUl9cORnXsxQWbjqqtELc+5KdUryA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4795
X-OriginatorOrg: intel.com

On 5/22/2026 4:58 PM, Mark Brown wrote:
> On Fri, May 22, 2026 at 04:32:03PM +0200, Cezary Rojewski wrote:
> 
>> The question on the table:  Do we revert the change temporarily, fix the SOF
>> first and then re-apply the patch again?
> 
> Given that there's two drivers we managed to turn up bugs in already I'm
> inclined to leave the patch there so it's more likely that any other
> issues get found.  It's a bit annoying for SOF CI but I guess a revert
> can be merged locally there?

 From technical perspective I couldn't agree more - the problems should 
be fixed ASAP and now we have a vehicle for finding them out.

However, I cannot make the call for the SOF team.  Peter is 
unfortunately already out for today (thus responses are coming from me, 
not him directly).  What we will do: send you a reply on Monday.  Either 
I catch Peter or steal someone else from the SOF team to try to address 
the dependency issues immediately.

