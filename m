Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1688F22D78A
	for <linux-sound@vger.kernel.org>; Tue, 15 Jul 2025 09:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752571453; cv=fail; b=PxfukTmDBybo7ELskwYT1HwbLwoX/ZzrYp0KC5zl/lb7RS3M5Nb0rn+ArVTop1de+bwQ2SPtQd7m8euCAN95793uxrlDbUq2E5LE99xHcKUy5p9tgi4+yekcF3cSjYSNd+htvw7h7VOgGWQcLDFLdXk2XbYmpiHH0s4lefyOsDc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752571453; c=relaxed/simple;
	bh=6gfoiKzZKmuUrFi+2ar4Dq4DX+a8A9/i8C+FcKhIlKE=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=A3d+oyHyX1HaRQbz2u/YscSy1MGQM4PFfn2JrgAgunOnyV8uIOM7OPQEw2ZCtvPnG+dKaNk+XlKiSSBCL0KybD3XwdKw4migtKDhGUtO/OfqYT1WBdUY3OdX9H/P3hq/P+9gC6c9OhhZcJcBjYLPkl3FJHeoWTnKnBQSUM6iZz0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=de5y0K6F; arc=fail smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="de5y0K6F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752571452; x=1784107452;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=6gfoiKzZKmuUrFi+2ar4Dq4DX+a8A9/i8C+FcKhIlKE=;
  b=de5y0K6Fm0Zbjl85xC/K2fDbmi9V3tSMZ17f5XDjgUV0FR2A7Nu8B72o
   kX6ys7q9imVw9vEfy0EM7MaEd3wqgligwr6VHHLPYMXNiRkMx1FFxzXks
   ZbBDV19is0X0YIMjWxM+175VmkSalru5S8bGW5B9ayy0S8q4EcZgLHn8m
   X31MorkvDKmnUSIrt2XpTtXBroXohm+A18OhwS41dVb/o0dYsopYHD+LI
   88BYBpQxZC6auL/adIy63AbtSxuQVa2eJD63FR6gYo/zUwm5Jf9if4XLf
   8Okk4oDMVxj7K6+SKDYwYa5afxfS35DzRLl7TUtU+HIywu798ceCK+6CI
   A==;
X-CSE-ConnectionGUID: 3Og1F95jTWynQR47BvMVJw==
X-CSE-MsgGUID: cNjCpd6PSr+/Xq8rIYZbSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="54871680"
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; 
   d="scan'208";a="54871680"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2025 02:24:12 -0700
X-CSE-ConnectionGUID: 8OYiOxRETv+3yRo6UZnsFQ==
X-CSE-MsgGUID: hcycWjzbS/yxApYGUTDFaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; 
   d="scan'208";a="180875771"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2025 02:24:11 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 15 Jul 2025 02:24:10 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 15 Jul 2025 02:24:10 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.71)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 15 Jul 2025 02:24:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uQ1pfR70rKJsFTVqcny61FS3auKupyW2F0PuKHi0ccW8BpyCQIbLcmSKQlRhwdffX/gqqRTP/KUvLP/3qeTdZ2t348R00qcU7O2+lMtZZ0ID2iwSzWJena7R2qFHxgzaasUXwQBrAQ9BhFnYYT+9HOb4/Cx+kJAEbN5zx/h4eoybk0mju8xJScctbsgVRVq0XI1j4XnDtZMb613eOltEkv/r8/by771HrEBQSk+2F4Cw0JUMYPICZacrLwApGSpChix5JIwv9KDvkqwopNi08CnvTA+9LNicRF6kP7nbAeWa1gvK2qH9S6JUaWrj1/ClbuhrcaDR2506fNr9qEUT6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l1RzASoiYcczWBdVXVB69KmCEjpwLNY42NF3v45z7B4=;
 b=b5gvlllUSP/N9eGebNU1GzBPuDCNDuhmhskZf/SFqth4VRJ+mpUk6V+to0XjnK2pewewgPv3GB25AlXeKZqZAFEVw2KkbuepFUsGhOivrUny0aiJwsP8GnXFODrm0BOVk0g+G3G1ils5iOmd03Cl9lBnK0ymqAiYV01k2GMOmUdI4BfqEGAb5lOrnfdeXs4+JjTeGE3X1w0sszf2yV9cGZKGUMl96FQa/IbLQPWbzlG2PrMguSNB9xKuVk8VoSoDoeB0pVLS+Hw4nr3/y/cRcRaBhs3uZ7su5dbVm7NmB4H6X8olt4LlpUsR2575yTdazOGb9hRq2iJN6/RKkQ0dqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8283.namprd11.prod.outlook.com (2603:10b6:806:26c::16)
 by PH0PR11MB4983.namprd11.prod.outlook.com (2603:10b6:510:40::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Tue, 15 Jul
 2025 09:09:37 +0000
Received: from SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::3:e0a:87af:d4b6]) by SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::3:e0a:87af:d4b6%6]) with mapi id 15.20.8835.027; Tue, 15 Jul 2025
 09:09:36 +0000
Message-ID: <27b8d825-16be-44d0-924c-2c83b5e83bcb@intel.com>
Date: Tue, 15 Jul 2025 11:09:32 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: Question: how dapm should looks like ?
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown
	<broonie@kernel.org>
CC: <linux-sound@vger.kernel.org>
References: <87tt3nmork.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <87tt3nmork.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0014.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::25) To SN7PR11MB8283.namprd11.prod.outlook.com
 (2603:10b6:806:26c::16)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8283:EE_|PH0PR11MB4983:EE_
X-MS-Office365-Filtering-Correlation-Id: fd8f47f3-8be4-4b89-3dbd-08ddc37f5263
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Nm1NMEFJR2JaY21Fb0NxUVdyeXRwRUhxekhyTG8yZ0g5dTB0OHUrL2pBUVlV?=
 =?utf-8?B?ZWxwRnRMcWljRWxwR1h5aElXeVZhTkRtUnhhdVlZRi9HREV4c3BhSmlnSHBK?=
 =?utf-8?B?a05URU91d2FsenBpYVZjQzJkUkZpNzdncTc2Um80cUdlTG1CTkVJcnNFRFRu?=
 =?utf-8?B?Vm5GSDNua09NTUpyR0pGZVQ2MzEvQ1g0OXdNYUt0bHhUckdKb2JNaGlvclQ5?=
 =?utf-8?B?dk9IbHp1ZVFQd1hTNWFYQzhsU0krb1RmN1AwY1g1dXloVkpjdXhVSE4zZnl1?=
 =?utf-8?B?SEZJT2ppaUVLNXZRK2pwb2F3SUFLMzVqd2o3c3VZZDZrd1lCSHI5ekdNc0Mz?=
 =?utf-8?B?dUpZTldrQndIN1ZIVFBuSGUyZkVEeXFUZWhKS1ozL3lEeWFucGxCT0M0bzk2?=
 =?utf-8?B?Q0kybDh0NlVob2plZ2tCeTcxK0Z4TldySFM5Y1FZTlloT1JJRXU0VmdLWFY3?=
 =?utf-8?B?elZmemtTYkM4VW1veHlVemxJL2pvZjRKVERiTHhkWDkwRFdacGRwM2t2UlpI?=
 =?utf-8?B?bGR4UkVncWxrSzNxdzA4dXBYQ1Q0UkxkeTQyaWN2VFpCT0JYOFoyeDJUWllh?=
 =?utf-8?B?a0lUQy9SQXFuYktCWWFZSHdXVEVXS01sRFcxWS9VZnY4MXh3OVNnTWpieFJX?=
 =?utf-8?B?N1c0RzQ1ZkFtQ2NCOHg3VWtsTC9lTml0c01pU0J4Y3NwZGwxdXFVQUgyQnh5?=
 =?utf-8?B?VE9wa0ZNQzJnclJCVlNLNlVvTFNkK0RpUzJCUW9qSEpSbFZKVE1ZVmQ1RmlW?=
 =?utf-8?B?OFZiOTliUjQ1RjRBZ2c3Uy9ZL1IwM0NYZXNOd1g3dkF4RCtvZnlrRGZJRVhE?=
 =?utf-8?B?SFl0OFpubitXZUpWYTAzTDFLdFVRZEQxakt4b2J6WmFvNkRDTGtpWnpBeUJK?=
 =?utf-8?B?cTBZSm52dVFnbklZRnJGblBxWERYOHd4ek56Zkg0YWhMQnFaYlhlWFhuZVcv?=
 =?utf-8?B?endGS0lFS2xoM3RwaWZ0aFdqeXpCam1RVkNlakdHUlJreUxiZGtiK2VvR3FM?=
 =?utf-8?B?UkVpTXlnYWpRcXdULzBtUEYzQnozbktCSmlCTGh5QWY4Qm9hMFNhVmVGbHhR?=
 =?utf-8?B?RWd4ZUprelQrRDJxY2FoVzFHOTcwVDY4eHNzUXZwNndvWEorZlJFV1lGSm9W?=
 =?utf-8?B?WElxZFhZSk1YV2NONk96N3dqTVZJSzk0aUNneVl1NmU5a0pZSG5kWmtEM2ZC?=
 =?utf-8?B?SGE0N3VzNFFJcEVUMkNvbVhkU1A1THJ6V20zKzVHMkpWcUtGb1VUZEZmWCt4?=
 =?utf-8?B?QmJpajlrVGJrSVJob3BqTTE5V3FFNWdCayt3NEloR3h5ZmZ2b0R1YlhEQmNK?=
 =?utf-8?B?YTNYMVN1MmVjcjhwd0tKdVBRMllUeS82RUczbm96RDd3SjBXUXc5dG03YkRY?=
 =?utf-8?B?bEJKbFFaY2R0N2crSjUvVkhhZjFVVW9pK0o1LzEwbi9lVEtDczVsRVlSZ3hl?=
 =?utf-8?B?aCtCZ0VSanpXcEUxVGJYRFRIV3ZGWGZKZEpCbFBOcDBJOXNrbXZ3bUx0bDNa?=
 =?utf-8?B?Z0JIL1VYMDVDSGJCZzJEQ242dzNDL0FpdllpNnlRenVLTG45WkRXcWxSUmUy?=
 =?utf-8?B?UXFhTnVVNVJmZ0VXRDhHTFZmWjl2bHJ2MzY3RnlhSjJlN0xIdVllbDdBYmc4?=
 =?utf-8?B?SEdHWTlwRis2Q3psSmp4ckgxRnJ3N2Q4NGh0NHVzYUxlQVlnQTFQQjMya3FS?=
 =?utf-8?B?K0t3YmFQSEEwb1lNRTZoQUJFUHlCTm5FcUJjR0lubU5leFZpTTB0d1phaVAx?=
 =?utf-8?B?T3dqc1Z2OVNVZFdNYkdLK3BwSFdnTysrbml1N1JCaUxpZU9acUR0VjJ5dFVN?=
 =?utf-8?B?OFBRZk80dy9KSUxlMElkNmFSOGdLQlZFckpJSTlUNGJGOUE1eTg5WHI5dzhq?=
 =?utf-8?B?WVY0Lzl3U01uVU9xVis3cFV0anArWUttaEV6SUoyaVlOYXZRMksyWkhXVlJ0?=
 =?utf-8?Q?EhhNl8wbbGU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB8283.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TkVhQUkybndmcHhGWWNCK3E3N1d1VWZTVE55a3dyeDczcFhuYkRhN2Z1VnQw?=
 =?utf-8?B?bXhtUEozWXN1QXkxK3pkUWdhY1F3cEQweFBHbjh0OHpTQkY4VmhUMmgzckxr?=
 =?utf-8?B?V05ndUQwQ3lNRE1SUEo4U2RUZ3ZNenRHVmlQNUdXYUF2WlRBaDh4RjFCaE9H?=
 =?utf-8?B?WDJFUWllOC9GbHAybTljRUxtZHRyVHlsVEVVTnVvNlVBK1B6QjNQQzZ6Vnpm?=
 =?utf-8?B?WU9WS2pDYks2Z0FwZ3dHcnBlQ2tIU3VqUDM3YnliTlpQWll6bnZNMUxRSkJQ?=
 =?utf-8?B?V2lPSjNEQ2RMUS9JL1F2a2pqd1dvSDE4QWRoMnhQaWVXUGNTUEhQWjNtVDRw?=
 =?utf-8?B?amJ3cVhxSXNHSTEzRDN0cHpkMWlGb3gyM2puYnVsZkkvLzdEOFhCYTlFZUxR?=
 =?utf-8?B?WldTRkhyc0tza09uSmdaNi9IRUdzWjNLK080VGtpeUpwVVpSTGN3b1V4Mzh1?=
 =?utf-8?B?b3V5aEZuT2hYQnhPYW05TGhnZ1ZucFB2UXExblRLOW1YT3pXWmUyUnoyTkdi?=
 =?utf-8?B?QWJpcXppS0dYVjFLNWpEVmhyQ0FrR1k1WWF4S2tMaTdHaDFGSVRPUWlvbEo4?=
 =?utf-8?B?OWxhVnl3TmZnUUJsRjBhc0FLcFJzQjlTVkd3OE1UOU9VTFdBMmE1UjZaOW5j?=
 =?utf-8?B?WGNjdmtEdXVBUGQ1TWZVZEFXRnYrcFU3S1h1VGxTcnZYSVJESldvVVJPZUIw?=
 =?utf-8?B?aVlvM0JWV01rZWNHT1lwK0V6TktHUHkzYy9BclYwaVdjRUhOQ2ZSa29xdHl3?=
 =?utf-8?B?cy83eWtkMkFRVEVIbXdlM28zNWlxNlZvbkNDYXE3aHJTazB1VnpzdFh4ckh1?=
 =?utf-8?B?elc4QjNJN3AyN0Ftd3p4MkJHY3hIdksyS0oxNUJrdHlLWnJucnB6Tm5FWUtk?=
 =?utf-8?B?OFpmY2pDbGk4cTdJOHlhcXBvOTlKNmgwMkl1OUJGS3E4QTFBZVlpSGcyMk1p?=
 =?utf-8?B?dWJVT1R6WTNzZVhXZTU0R25jMDRoK2RqY0RUeVNzdjBGZHJRQWxpMUdUa0Jp?=
 =?utf-8?B?MENxQ3dPdm4xOUJ3ODN0SjVqbEV6bnZnK254RWF4UkpCYVc2bkV4TW5NZkQ2?=
 =?utf-8?B?UERXWlNKQUJIS1R6YnVEM2t5dWVEWWk3TXNTUUFHa2J3M056K2Vrd0NYakJm?=
 =?utf-8?B?Q25hQzBFY1gvM0lWSkRickszc01RNlZzWURZSGI0eUVEMGp4eE1VVDRDc1Rz?=
 =?utf-8?B?a3d4Z3JXSFJkUDdFTkl4cUJSdnhFZ2g1dFhUUkFKc2MvY1pyYThiNnMxYkgy?=
 =?utf-8?B?Wlhqam45QnhvNmVQNWo2bTRBWVpLRm5ZOTZmU0diVU9uSkZ5UFhYakRDeU5K?=
 =?utf-8?B?N2M1bXNZZEprdzM1SXlrOG44VFZDdWMrRnl5bmUraE8rMHNCV2tGMXVoNlJa?=
 =?utf-8?B?TU5xMU5GLzgza09YbUtCUzhKT0Y3U2E5U3dTRU5sdGt0MFdzSzNKVE41cHNl?=
 =?utf-8?B?Si9kL1ovaDkxd3pTVGl2enMzM2tCcHIwK2RXZVRKUFRTNERQYTIzWWNnV3Bv?=
 =?utf-8?B?cXIrbkRqZ2o0a3QyRjlJTVJEZ3dWZ1JrYTc4ekFRZ2tpQVRjcmw3WFk5aVhQ?=
 =?utf-8?B?ZkN6em43L1pMVXhEMllVVHVodWg3akFIdkN3c3l0S0NTWWUxWTZMc3ZDVXBK?=
 =?utf-8?B?Yjg1WVVUMWZXLzN3cVNhSlA2cW85NHFtVkFibVJOd0pqUElHNDhXQjFlZ2pa?=
 =?utf-8?B?SDNGSmRuTTF2MmdRa2huVTV5T0djWm1pbzlWSXFUSzBRYmpocUZKNkhIUHNx?=
 =?utf-8?B?TVZ1NjlkUVU4M0tIaUVKWGpWaGdIUVVDWWloRW1RcURGMDUvdW9TRWpVZ2Qw?=
 =?utf-8?B?QkZUVnhvRTN5N1JRT3ZMMHM4aGFNcDR5bFFKa1FYTi8zaEhleHYzdXk0N1Jn?=
 =?utf-8?B?SXQ0dlhQMjVEMUtsWTViUGpITWdFWUpUeEZrUHlYWG9YWHBCV0NFNmhFYXA0?=
 =?utf-8?B?NUJYQ1lUK2ZpaXVmaGFWMUdoNlQyRkRNNFBzallGRkRXMURNOFE2eDVpVlda?=
 =?utf-8?B?ZDdYUitTRjVVOW9IMjJYZXZXcXBIYzlmOWppek5zNjFCM0phbSs0eURXQjAw?=
 =?utf-8?B?MWYzTnN0N1BJQVZ2SzZKUE5MQnRVK3JPT0lLZnV6UlBINHhqTzFoZGt4a2JE?=
 =?utf-8?B?UkpCSEIza3BSYUZla21odUpNSXZxdTBxeGJBSTdiYy9naXFCNWVPQ3V3UHd2?=
 =?utf-8?B?eFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fd8f47f3-8be4-4b89-3dbd-08ddc37f5263
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8283.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 09:09:36.9434
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KQPCWEi1+a56tqctlUkEh1ANpZVJoOuYiAi0AZgDkXQM2bmv4V/MOQdzcbXd6C4fwguoFr7df16lOGr04TvgZS5/yBeqKhtXJF+a+W/+y0g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4983
X-OriginatorOrg: intel.com

On 2025-07-08 3:53 AM, Kuninori Morimoto wrote:
> 
> Hi Cezary, Mark
> 
> We have discussed about hiding "struct snd_soc_dapm_context" into soc-dapm.c
> because it is framework internal entity.
> 
> 	https://lore.kernel.org/r/87o6x69h4y.wl-kuninori.morimoto.gx@renesas.com
> 
> I have been working for it, and I'm happy to post the patch.
> But I noticed that it would start to affect how it be used, since next patch-set.
> 
> If we assume that the struct (= snd_soc_dapm_context) has already been hidden
> into soc-dapm.c, how it should looks like ?
> 
> "dapm" itself is hidden into soc-dapm, non-dapm can't directly access to it,
> but it provides access functions anyway. Should it be accessed from Card
> and Component only ? or can user driver access to it ?
> 
> This selection has big affect to user driver...
> I have implemented as "Pattern-A", but do you have any comments, favorite, etc ?

Hi Kuninori,

Thank you for the upfront message with high-level overview so that the 
direction can be decided before any code is actually modified.

> (I start to thinking that "Pattern-C" is better than "Pattern-A"...)
> 
> Pattern-A:
> 	User driver should care about existence of "dapm".
> 	This means user driver can use snd_soc_dapm_xxx() functions directly.

...

> Pattern-B:
> 	User driver should *not* care about existence of "dapm".
> 	It is encapsulated by the Card/Component.
> 	This means we need to have wrapper functions for it.
...

> Pattern-C:
> 	User driver should *not* care about existence of "dapm",
> 	but can use snd_soc_dapm_xxx() functions.

I do believe the Pattern-A is the way to go. Mark provided good comments 
on that, my two cents:

Be cohesive. Dynamic Audio Power Management (DAPM) framework has a 
(distant?) relative - the Power Management (PM) governed by Rafael. The 
latter is commonly used in the entire drivers/ and it's not rare for a 
driver to manipulate its PM directly. Also, for someone new to ALSA/ASoC 
or coming from a different part of the kernel, it's easier to connect 
the dots if both power management interfaces share the pattern.

Kind regards,
Czarek
