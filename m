Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09FA33603D8;
	Mon, 22 Jun 2026 07:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782113799; cv=fail; b=prr65trT180EXwQBSrw3OULmhtcu4z2/mZeb+ou01uCzKeD4SW29djA4hKGQvOjXxsRZ8PE4TQL1wiBwqdwWnzU/fES3f0YQj8OnW+ZelCecpEsnr4r24tPANjYLYbcnNA0exri5jJOzjqDUiLVyixWnrasoi3Z6iQHzaOReQx8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782113799; c=relaxed/simple;
	bh=o1PLXUD2YMLoY5L9uFpl5ZY8bJ3EtUapfb9vQrk7fc4=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=fneaAeS1/2K199bjZxiFHVgiD4vfPuuMGLVbIvwKPOIJt51Km9lLgvk6W7oTPdSFfUjMLIAsyvgFcKFDASt7N427eikzcBAfUQiBJAmRge9tjxF97T/GZgda9GJDe9Rm6lgCWGEVbPiLA67dDBpfAJiYgQ0dTux899Kmv3Js2fU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HQAMTk5V; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HQAMTk5V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782113797; x=1813649797;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=o1PLXUD2YMLoY5L9uFpl5ZY8bJ3EtUapfb9vQrk7fc4=;
  b=HQAMTk5VPBXJ8aW3VwLF+05OgXaK4U78PjGanikvGbAvm+VlP2W/vA68
   dn7fEtTG60kLgdXgUjrIOkbLYNviq8RAmm+Ht8lkb9Dihp0YgplTnU2eA
   p9FOZFcf3v7eSTWkriTiEVZ43TWVHw2R+99/EDEBxx/2u5uZ5gKtakqkp
   mQEn0oVkujtBFQo+D8sUAKVjtRI+WtoNDVVxeOebYaKKVcGgep7pcA+f2
   iMH6dcBUI8+RvuBC2mHWlfv3aD43XqvcjtsqT6DJNeE6uVR0emduh/erw
   U32O759CyyWUcJh7aaQGFDQrB7cv9xdaByUw3C9M91FJYFTiRINcwnzZj
   A==;
X-CSE-ConnectionGUID: RNgDgJx1RDaxCncpA1MM+Q==
X-CSE-MsgGUID: tCPLY7LxTce7lel5BzRrMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11824"; a="108382707"
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; 
   d="scan'208";a="108382707"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 00:36:36 -0700
X-CSE-ConnectionGUID: S+u36MRwRji9kOeaZ1dd5g==
X-CSE-MsgGUID: EnoRlAn7QmCIbfnD530GZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; 
   d="scan'208";a="246224963"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 00:36:36 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 22 Jun 2026 00:36:35 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 22 Jun 2026 00:36:35 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.64) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 22 Jun 2026 00:36:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jDtKb8JubzIraliiQ+J/xFGWQRClIsRyl3Ul/rpnKKLQ9n454/+BDieP9KBflOfc0+vSyXAESc16P2qs3m4AWemss0NqOgJbftVAkgAntJvwwx0SwF3zs46FLD8+PU8utg8ddmLWIb4J0cxnoSPMdjQrIW2vUcMGzjgIbyZUk9r/DlYrXLTRhQGzsEwgTaK6FG+iEouN2hEIQfBotQZP/BsywtLTqhv3eluviFm6ADE90wLAYtHgvZfTF4153zP28pED6I3KQOvcrGQmZZcNNtcH6JMkeH8hhpp92WdboHlrfFqcvJXqwuV+9/K+8Gb9dViresbKg1JKhIRGT274sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W8DvpWWRTfbsj4CbyIx6NclTs3i5fV9wiWsladRNVuw=;
 b=yOayDqd3gn+ixbBbVVdDQpr0FEV/Lo7l99dJ1WUYJgEoJ1X4Gqqy8jcg49aXD1o/HC1SN1dk/I48x7WOl8s04hR3ysmKNE391qCV31/g32g1pHNrfiS39I9ucMX8DuC32zzLvRJ1qqm8TysRZSxD4e9FLznkN+sK0K0kYD9FldWFKQDUE3m/l8TTiY7B8oLoiEPdS0tgrBKM8ncuB1tcCAdD5v7yWe5V2X9DTVArlIxgZQy1AeCISPnYA6eW6ra8ijLe2XSz00yYx3NS1SFFoZSL6jHltds4+hDq3KAjR0XTy28oLUIA7YT+4FzZoF73/JYe6GZOxesvCATN85uWQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6967.namprd11.prod.outlook.com (2603:10b6:806:2bb::15)
 by SJ5PPFC35D45AFD.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::853) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.19; Mon, 22 Jun
 2026 07:36:33 +0000
Received: from SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4]) by SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4%4]) with mapi id 15.21.0139.018; Mon, 22 Jun 2026
 07:36:33 +0000
Message-ID: <25702973-66d6-4afb-b1f2-75fd858323e6@intel.com>
Date: Mon, 22 Jun 2026 09:36:27 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] ASoC: Intel: atom: Use guard() for locking
To: <phucduc.bui@gmail.com>, Mark Brown <broonie@kernel.org>, Liam Girdwood
	<liam.r.girdwood@linux.intel.com>
CC: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Peter
 Ujfalusi" <peter.ujfalusi@linux.intel.com>, Bard Liao
	<yung-chuan.liao@linux.intel.com>, Kai Vehmanen
	<kai.vehmanen@linux.intel.com>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.dev>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20260618110649.227062-1-phucduc.bui@gmail.com>
 <20260618110649.227062-5-phucduc.bui@gmail.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20260618110649.227062-5-phucduc.bui@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P189CA0028.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:802:2a::41) To SA1PR11MB6967.namprd11.prod.outlook.com
 (2603:10b6:806:2bb::15)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6967:EE_|SJ5PPFC35D45AFD:EE_
X-MS-Office365-Filtering-Correlation-Id: b0f64346-8c25-44a6-3edb-08ded030fb85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|23010399003|376014|18002099003|22082099003|11063799006|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info: COdCccm+mW+BQhgB9Z1PORoXIPAtGpncWS9b3VAUxJwk0EcpJ1ve9eQ2fNu/yqFePkWlvskW613Zl4igVHY+Mzq36oQpDQnx8tI9y3NRAD85gnBsukkMiptGJIRKpNU6TeJhkZT+sXcEgiFUHp2MdRnInX+GcTuHidWbHt4AhSqhs2Yv7KPTjisJf4IY4pql8NwHZXg6aup62e9Aj0RhyzT1dCXkz8m8mLRT8Taluxn8oD1Uj0kceou9GIzX/QJmsobtvTuZ9UWlUKxTqF9s/jhMtUWGsZjgQMAT23kxUVENQMQuylNKuSVPyrwOtR6cuqezI/qSBqg4fc6x+FO734DXrbwXIg4CmUL27Hx5emowyNCq7QpKy3XB2Rhxgw9byqLvyA7gtfB/vAcGJvFC8yQfM3kcIkzjJBbEqaSxbsO1xmerw198XSBcPhAsNX4zHv6MEAG7eOtr3t6C+zWL9E6I7G/BwDW9t/cgZ1oarwBB6lfMTptSmSV4EuKvmLFf+v0LdS/SpoiWBEqBswimuvUj0seO0QQUzKOimo/XFtRBkJnSnVBfgXl2gnOk5N3aRVbjxH5daFf40X4lNqDe3iM2jrfUdYs3NtDEXoNr+MU2WuiTI74U2sqglbZOnBF/ojtMvRz5L/Wk2xhRTYbMufQKO6fLaDgbEbYnpyJlZcA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB6967.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(23010399003)(376014)(18002099003)(22082099003)(11063799006)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZFo0MGNMbmVlR3VhSFkwRnliYlNpOWhselZOWWNnb3NRc0lpRDl1MFJ0MWg3?=
 =?utf-8?B?aWFrbEhCUmpwWWlzcDlYWFczVDJwOFBoRENrQ085REk1cG14T2hmR0RNMXRy?=
 =?utf-8?B?S1N2c2RDOThvVUt1RkVGYmJhYkhyMGpCaExrMGY2TC9uVFNmZk5TVk5GVURn?=
 =?utf-8?B?ZkRzcFh2cDNNeDkrYmtHMzBlWE9QenZCS3NPK3p1TEwxdmwxQkVhQ2VieERN?=
 =?utf-8?B?NGlOc2lkVjB4Z1kxY2JSWmhHZDZZY3M0VU02SVM3OFozTS9oTWQzSWZnWGp0?=
 =?utf-8?B?enR5dXNSazJkL3d3Wmt5UnV1UjI4bnNqcXhMQk5EdHVLVVlSN1hDWlJ2UXRN?=
 =?utf-8?B?RmV1VlJKQ0JpdXArek51WGN0eFNlY3Z0L2ZvTzB4WjN0bUxnQTFHcFVtQTk3?=
 =?utf-8?B?R2NBZnVLeXNqQ2pKOWRQdm14ZVZMQkV2bjYyNnZMNXhTRXVKaDFGb3Q1Uzhr?=
 =?utf-8?B?UFpka21aK1dWWjlzeUZnOUhXTGQ4aWRJZ1h6eVdvVGQ4TFQrRHE4M0dZVFFK?=
 =?utf-8?B?OXkrVnE4Sms1SDNmUXp2dEx5U3VmYmQ4WHhqMHhEODFyK1RiSXNUc0ZLcWtK?=
 =?utf-8?B?WjRudWNRbXdyOFY4VGRKY0c5c2V0L2owTXpvY01DZVRkazhyZUx3SnFnOE9F?=
 =?utf-8?B?Y1F6a2JUellHRmtDaUcwemhZNmF3N2hhWnNJMWJPMS9NMmdBSmJuV0MvWGJ1?=
 =?utf-8?B?K1Nxa1YrTVdqbXRWellNa3VhNmNUbm5CUnNsakIyRUx1OG12MG1qdU5na3kz?=
 =?utf-8?B?eEN2aUtHL0NJMWEwZnFBZWZhM2dBSXBjRXM5OTA3L05QVHBpZ3NBWVpzdzgr?=
 =?utf-8?B?bmt4eXdwSmtLU2VwMTFjUmREcDVzbXBadDkwR09oNkRsbEg2NWtzOXJ1SEMr?=
 =?utf-8?B?Tjc4MVQ1aFhaNlFrUFNSN0JhanJmVFQ2N0kvR011YlBEOUM4NCt3VFpLdXVX?=
 =?utf-8?B?NkRNRVJENGcreTh4amxrRzVXVjlaQ3Y0SnY5b2dHeDYxUFdSbmhUeGpiUVd5?=
 =?utf-8?B?QWF4OEtaM050ZlF2SWNrVGgrSG1aa2p2SmNWQU5LNmdXMk0ydFhkUFB6WFB2?=
 =?utf-8?B?VkcwMFc1OS9iU21iUWwwbXBuQlM2eXF3YXllWlltSG5MOXJiajZ4YjVMcmUr?=
 =?utf-8?B?a1VBSGlmQWRHZTJGNWVVTllBYU1RSlcya3pJMmEzMVgrV1pVbWp0ZzFGdm1F?=
 =?utf-8?B?VDZUZlAwMDRMY2ZzSU12aDZtR2Yyb1VIeERXRTdJWHBSdkYwdXFzVjBKdk50?=
 =?utf-8?B?b0tUWklqZElPbWZuZmh1M0xGVkRYaDVRVmhzamhCYk1EcCt1R3Q3ai9jZmhm?=
 =?utf-8?B?OUZSZThSYXYzYkF3SFl1dERIK1AxdlhxWFovcGlRaUtUeGYySkxBN0hlNjFi?=
 =?utf-8?B?eXVSY1RyMXFqd2VPd3JPQk5KR1JMdUpYa1FEYWF4QndodXZFQnk2ODQrMWRp?=
 =?utf-8?B?UzZsMWxZSlNQNUJPVytKM3Uxa1pkMTRoaFJVNkplMTFEcDIxK3NRaktocjlh?=
 =?utf-8?B?US9TelhkejYzQk9NVzM1U0JyY3UyeUZtOElNV2oyN1pKTlhwR2VBV2dFeTdQ?=
 =?utf-8?B?TjdyU2NTeDdTOVNFem1ZME5CQysvZzNoTzlpZ0xmTm1KOFhZZnlsR2JIT2Zo?=
 =?utf-8?B?c1AyL1oxQXRXZEY1MEhMYlNsRll1QWFuZC9ZUm13c0x4bmdBeTlEc1drcUd2?=
 =?utf-8?B?UlcwVjg5Tk43cFYzbjQ5c290M2picW5XKzZGUjFTbzE1MlA3TUtpT2FGNFhY?=
 =?utf-8?B?WkNPaXdDL3E4TURjU3FkaFRRcjh3Tms3ZWFkQXRPZmI4TXc2QkxyQ280VHc4?=
 =?utf-8?B?YnI5WkwwZzF4VmgyS2VmTFJkRkgxZTZTMDJFMW1WRzdwMGlQYW93VVYwUDRP?=
 =?utf-8?B?WWlUUzV6U0g2Y0FSWjdyVGswS3gyN1hGK3M1N3M4Qmp6UUpRQlZ6WThBV0NL?=
 =?utf-8?B?anhXWFdpaXZ5dzhZaVRpOUlvL1VWWVhVYU5BRGFIdlkxdGVwbXZuREpLTHhs?=
 =?utf-8?B?R1ZZMy9JdG9GRzNWNjQvOHd3TkJuRFJ1U0lWVzZTUkNYQlhrT2EycFdkbnVF?=
 =?utf-8?B?cnFTdUFlV0kxcTJ0VlZUQ3gzTjh4ZjFrd0lLa1U1eDdOSEVOT1RPQ21hSkZP?=
 =?utf-8?B?azVGSHJjNWFkZ1VheklHWFRLczVPSVF1cTJDYzljekk2bUVwb05FSndhWEVO?=
 =?utf-8?B?dStBeXpIeXA2cnpsWUhtTHZNSmpMLzlwYUV5cnk2eDBQZEo4N29QT3hWYkg3?=
 =?utf-8?B?WVRjQmtvaVl1aXI4czVYWll5ZVg5QXlTSDRtVm9sQjVyN2ZmT3RYUmlpMmdW?=
 =?utf-8?B?bUErT1JiWEVwbVdwYnVFdkhnRTloUUo0ekxhdGVjWDBiYiszbE0rZz09?=
X-Exchange-RoutingPolicyChecked: Q9I257wIsB2fiGaWdstkHUvPc0rBtD9gD6PFEdecLUcbQ1XwtFHB0l5MpKU+MSyHZ0UvVkEcKL9kd2ljRVbtRCGYCRD6Hj0lZwi66oCY2UVp9vHwGaoLpG/KiBGfFNzWh7jLfm5YIpeNQ7PDwMjQ7G3o7aL1l8v1NicOEte4+dFFkooiW0M2ejHoVLnEm3t12f4vjwe+azC1IPmHwfwXSp/Vnl3GJbiEZVS9amdyEoBXq5DayUC13/Ic6W0OjNclBGgHbjGZh0B5ZAnh1kq1J4TP6DbSjVKz2AbiM9tuCbyNZH08JWK5eN65YhuyV0HELE9mGcG2o10ibdQOftAcOg==
X-MS-Exchange-CrossTenant-Network-Message-Id: b0f64346-8c25-44a6-3edb-08ded030fb85
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6967.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 07:36:33.0646
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uRoIf6jIgHJHQRWIazWQsUo8XcRzjEyk3R7fpS9CUg1svFeLd+RAXxevGt3q5wmiDifbD1E1jUfU6HVd6IBLr46UDuqEl7HP6b4FgtWNeko=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFC35D45AFD
X-OriginatorOrg: intel.com

On 6/18/2026 1:06 PM, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Clean up the code using guard() for spin & mutex locks.
> Merely code refactoring, and no behavior change.
Looks good.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
