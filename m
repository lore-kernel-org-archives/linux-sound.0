Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 646A529898F
	for <linux-sound@vger.kernel.org>; Wed, 27 May 2026 13:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779888344; cv=fail; b=ncDukYfU3Y91mSBCDK9ZPVzng/5V+l47D/QAfJiqCCYblzitVwY8D5HxcD4zdMvb5cUM3lJvMLf7pRjFwq5ce5MYjJq1jRyxoJZsW0Zt33BuayEJA1bwafeEanXp97QME1n4iNwA7AE+dqgidW6TROZu7Ua2lm4VSJb9k0Rz5/Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779888344; c=relaxed/simple;
	bh=LTxUb4+qBxtKxD/oJahVe7Jv6YSf3xfIUI0ow+0eDBU=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=aVAqJW1SL/qsUCsAHy0tMX28tX4RxQUShp/MlW7JallKksaPjwl8w4m6JAwdAQh5rquhkwEihkHElOYH3I3Gmxy2iUhXZ32qbsegc/R82t4ZWMDQ74TDvtCXLC6W+74ERixSz/Tz+cIlZMnBIArI++LsjFtFYpDZNr0A5wjPLXs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aMazgAI4; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aMazgAI4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779888342; x=1811424342;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=LTxUb4+qBxtKxD/oJahVe7Jv6YSf3xfIUI0ow+0eDBU=;
  b=aMazgAI4TZSiJxhJHDcu5zjuMNJAQni9PWI+2gO5SHDOfTz1+Fqeh3lO
   yH9AN8feRvUYZppk7spXaGuKauH/fSqpB7Qc6TiKkaPFLi5M9I1hFz3Q0
   fsCf7MgUEr7sTiRpa5zYiVDMp4Pm7lB6MMBimsP3X9zZizwj50/yU88oC
   kgHST+0jXzUL7ONHTym+RFWlWGZhBYUq4J566z1OldglYD4xIrRMTf4gH
   c3tlMrQoXxec4MPA/QxyMQbvn7k2ywxygcdpzM8QL+MnFva7o6oCJTYq3
   snEzyvRQGFPgZapJe9ADsZ2apfSncjOBNLy75yEOEyzZI5vhnogjwq22G
   A==;
X-CSE-ConnectionGUID: SwcwlDpNRoibigWZV/TYbg==
X-CSE-MsgGUID: UlduX4SLTvC0RoqNv/kExA==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="83294968"
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; 
   d="scan'208";a="83294968"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 06:25:42 -0700
X-CSE-ConnectionGUID: CFlHQCYoRU6S/g1yKWzcDg==
X-CSE-MsgGUID: tJVoQjMKS5Sx9cEMYdoKyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; 
   d="scan'208";a="239645220"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 06:25:42 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 27 May 2026 06:25:41 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 27 May 2026 06:25:41 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.6) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 27 May 2026 06:25:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aggojm3zx5KDR0hIwkQPNVG+opkg4Fj7wiePODZr6pYvAJThB8C5Ip83qQHBh5DfcWNQTsXV9Sd7d7O7+9RmdPoG/2yHcNNwGPaFEy/qrqHtfEL8hzE1qDzWqC75HUnRiCvSGUM08oAYi5/BwWcMkf7pLY9l/TscyrJ5Pe2dEeYW95Z3qsM6QP1BtwxBPi/Dt6s27SJLgTbVhG2WFURVcGSrqViEnr/FgDvzD1biBXCOExrjUYlYgu/L9dpww4QxxC0UnsdRBVMgkZADUQIPhVZBT4BLI7TRSDxNY0GmAGWVH0uKdoH8K8AqiIkPxMf1ccL9sRlTuuJOo/vfNTrRuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DsxmBr32KZdkJzeiI6wGxfoYlOme/1POmb1vIpNbvhs=;
 b=DMXPln+bEiju5kXzY4yVPIQ743ysQeiKaRi5hUGq3+KrViin/e3hp7Kdpfl2uccpk5H8udoVt+tF+ilWfGGF1HaQ1joVuHShsyghRygXhyWzCe3VNfejX1jQfLVp6Zp0pr0Zl08yIePfskXx8f6+HGRjwqSvgxX8VE2dMHHSrWs6H0WpaB+RDoedAqGW6pBzK6ntAd2QLJMR6CTn4BNdO0akjdE0GQg9np1QuMg82SdZku1HDvJAkmGsO8r4h3m1JRIMqmTxe0RBk0+peKxDM37ohGfU1EZXH6u/CT4441jO7+uhkVXlrfj6ZlmGMClo+32X5nc3q5TUFQ5ZCOGPVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6967.namprd11.prod.outlook.com (2603:10b6:806:2bb::15)
 by CO1PR11MB5155.namprd11.prod.outlook.com (2603:10b6:303:91::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.13; Wed, 27 May
 2026 13:25:33 +0000
Received: from SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4]) by SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4%4]) with mapi id 15.21.0071.011; Wed, 27 May 2026
 13:25:33 +0000
Message-ID: <9005047f-597a-4da1-be41-370fc845af92@intel.com>
Date: Wed, 27 May 2026 15:25:29 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] ASoC: Intel: catpt: Complete coredump handling
To: Mark Brown <broonie@kernel.org>
CC: <tiwai@suse.com>, <perex@perex.cz>, <amade@asmblr.net>,
	<linux-sound@vger.kernel.org>
References: <20260527094707.1432195-1-cezary.rojewski@intel.com>
 <20260527094707.1432195-2-cezary.rojewski@intel.com>
 <b9ef2ced-b489-4804-b0ab-8f5e9e52336c@sirena.org.uk>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <b9ef2ced-b489-4804-b0ab-8f5e9e52336c@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0502CA0020.eurprd05.prod.outlook.com
 (2603:10a6:803:1::33) To SA1PR11MB6967.namprd11.prod.outlook.com
 (2603:10b6:806:2bb::15)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6967:EE_|CO1PR11MB5155:EE_
X-MS-Office365-Filtering-Correlation-Id: e417d970-2719-4728-99b1-08debbf36e2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|56012099006|11063799006|4143699003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: c/nf5oyI3+IMdYR9W0yPEURjWyAmWYvSjKfIfRvJvUidzZb3t/Wz7MK5RRKWtU6lfZwkyx3jBq+1N84KoIXl3CpBrC0NnyLDNdi3NdFUF4veddUYwNXv3NrTrdac4l8tTKvCk5v2f7TbLBo5hJwHNjW7X2HdxlfgcDVm0F0nF800wEfeS/t/JgW4n+cIdrBrxahoh704hvexr+kJIB2pVM6nMBRDqeeZHurt305bA+Fpw+UcjIRHGYYIL8I8f7zrloHzT4Fq7b6YSstA0YzJ5P7zDBPS+4Kljpb+cmo55j54TtDmX5RzEFrr8v340YiBnAEKbDhFkPLd+KzPxw110FB32+7HEp/tpT08l3shzzl4Qi8Vb3e0rfrnffSlSt7B3T9Y/9OeJl3sHs6jD+vC/xWL+AyRk3NONJJ5MqRWs4Wf0NmHoj5D0NuFYpNSQ0o1DJn6r3B6b90wTYYrlTU9SmKH9iay4vsGHWyGf1rxXqZVJzsljqOMQr9KQxEO9t9uaqJMk0sN1Jer0viret4gyVLE9UVnJUZMvN3Y/93qcn83ecYq9fhbtzxCq1CHDw1t/CltsJVpf8mNuBGUNcMbzFL+S8Uv8EIp/Pvm2rtxEJ/mBYmvUmfBDgILeT6yYRrtnSl9nsL+TJ8SBt2KP73s0U0ATCpJCdcQRYWn+x6GcawpBrgI+fhnQgayNxFnvB2b
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB6967.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SmlEUHEzNXg2Z2pDQXhOUmd5aFdyK25hOTBtV2pqU2R0NVpYVUEremdhN2g5?=
 =?utf-8?B?OGZ6NWpKekQwM2h5NmFKVnEza3VndW14Um12Qy9mTWNhOEhrcWdJcExHYkNN?=
 =?utf-8?B?NVN6UTdiUmhMUmFaTTB5TVZmMXRrYVRHOWVISkRtYXUyeVRwL1dUdjVZbjRq?=
 =?utf-8?B?c2xiMFRpMGNEZU5TN3kxK3BZeUw2bHBvTDhLekQxSGZGWE1NK0tTbnJSVktH?=
 =?utf-8?B?MGRiZ0V6aW9tM1dBZGdNMFNCZkhhU0RLZFBOUGIvTGlGRHVNUHQyNkt0QVhr?=
 =?utf-8?B?aTVGWmJLS1VpK1JETnZ6SWxTdVZUWEQ0MnY4Z2V1TUxHZXFLYjlRL0p2c3Vi?=
 =?utf-8?B?c2dvU1ZTSnRWZVZmODUyM24xbnBqVjIwS092VzZoRHVYRUNWL1R6aUVlcG9k?=
 =?utf-8?B?TUhPbHQ3WmJhaUlUQlRwNUlXMDhsZkVHRDdRZUViL09BN1R1NDFFek1qU3BW?=
 =?utf-8?B?M3hEakJBVC9xTC9WcnlUbVBEeDFoUkxEa0N4YVM1SjErWExMc2I2T0NXbDNK?=
 =?utf-8?B?OTkwZ1Z0MnJYOE1YWnZ0SDdCVkkwZUlxQ1o2b1FPY1pERHZZRW91YWdBQ2t2?=
 =?utf-8?B?LzBSNWsreXh5SzFaVXVyUGsrQ2NpYUJvanVSQ3ZnTGVTRmdEeEJsNnZoZ2NK?=
 =?utf-8?B?TXpzWDloaHhKejlyTE1SLzlFN1JHZUpqUmp4S1VaZkJDd28xRm9CQU9rVldl?=
 =?utf-8?B?TDMxSUFCbFJGb2N3Q1Jkd1BSSmpxUHBKdFhuYnVJTjNFT2YzRkwyeGZBS2sw?=
 =?utf-8?B?aU1JaEhKeUxIcDVhL2kyTElOZmlLTzQ3OFNTNkFuN3kzWlRlUHZicG1NZlFi?=
 =?utf-8?B?WDFBNm5lbEpDOHRUQVpLcXhSZUg4QlFockRFSDJuN1dVSmVySEgxUVJ2TWdB?=
 =?utf-8?B?UVNkdHQ1WXhMNmEwdWcrQ1RKNUNRUzVuQVNrRS9WYkVxVkpFTjNBaC9ic0ht?=
 =?utf-8?B?Ny9XcUVWSXNzTXlwRzFMN2pXditYY2IyR1Y3dE9QaUl6bEZ5K1lWam1LcmRM?=
 =?utf-8?B?WFJsa1Q5RFMvczFIK1EyZ2Z6L3hycCtiMkRrM0ltZlp1dXJuU3FSaThUU21I?=
 =?utf-8?B?cXNveWswR2pyNEY1VmZ2S2djdlhacUY4ZzBmdnhXOC9sUzRGYTJxc2Z0dGZY?=
 =?utf-8?B?OXdyeHpnZ0JkeWNuYVB5aFBCQzFsRjZwNjhUZkRhalgzWjNJU1R2N1hPU1pI?=
 =?utf-8?B?ZXlpcmlrUHJMQzM4TEtDSHFHTFdWQjEzSGdoODNzeHlQVTZkTmMzNFVpc01B?=
 =?utf-8?B?eENBcDR0Y054dHpsOVVwYzhiNmkybVlDNENYK1R6Zk9GTnZ0bEdFaFhLbEVs?=
 =?utf-8?B?MTdPYlVmOVRDYzgwQnRRTmpvYXZ5YndTZ1hrZkV1em1iNURlYWVMdlYrVFFU?=
 =?utf-8?B?VlFUMXkydVp3WkYySCtTbk8yYzBpdDhMZmRIbmpRTUlKQ1krdWNnVDdBTU5s?=
 =?utf-8?B?ZTUvOHdkUGd1MEZiQXZlYklJOE8xNFVUd21neE5ZZEZrWUNTdlVKUXlGQWNt?=
 =?utf-8?B?Yk1pR0NyZTlFdnJKMnp2Z3Ywa1VUMEZKQjJ6cy9vV1dJMWRtMm5EOWdubjRt?=
 =?utf-8?B?blAvWVppVmtvc3ZUVmtyem10YmxaU2ZYL0I1Q0xzS2t4OHBCV21XelpTSkl2?=
 =?utf-8?B?WTJFek9keTYrQjZHSS9HZFVwL3FqcFB2YzF6cWtqdVJsRFllU0UwMDRSNzVF?=
 =?utf-8?B?a25iVmlWYTB4VCt6byt1eDQrVmVsa1R0SklNTnJWTkFleGVYTXo3ZE1YdXZh?=
 =?utf-8?B?SjJER1JEc1ZIYzJXWWdsKzAvcTY5b2kvYVM0aU16b1VBSHExRzlEQzQrMll4?=
 =?utf-8?B?STJheDYrTEJRYm4vQVdtN1ZWZFl0WXlzdjQ2VmpEMWVFS1R6NGFQcFdrbDBx?=
 =?utf-8?B?SmV6cHllVWVwZmlSVFNIYXV4UjB6NVZGVTZyUUFNMi90TklXNS84elptQnho?=
 =?utf-8?B?ZG12dXFoTXNBc3RpK1JmejgyWnBsZm9ycVF2bkErOUFIcFhPT3pITmJ1SzRV?=
 =?utf-8?B?bmxlcVVYaGExYkRheEI1NXFMZXozUXpXQTFxWFlGNmF0ZTlaSHhiYXpkSXJ0?=
 =?utf-8?B?ZDg1dkZmU2RTUHRtWVpFSFd6U1lEQkp0djcvaHVoQ2NrQ3llbWgrbDg3NVpH?=
 =?utf-8?B?TUVES0krUTNjeDJrbThjVEZvSHhndXZvK2ZxQ3VvREZObUtYZjAwMGNNYW5Q?=
 =?utf-8?B?MEdnYzJURVFSb25uSmx4QkVhRFRhMEM5ZHEwRExvNjhWbUpneHM4NFN3cmpD?=
 =?utf-8?B?UlBGN3V2S2h6R1VBRDl1ZEFQbUpUYWdDUS95VGR3TjNsS0MySDY1SlB1MXp4?=
 =?utf-8?B?MHNyd1VrQ0M5cHM4OWppWFNXb0h2NElVenZlU3BIMmJQOUhWMXR2ZlJHd1RW?=
 =?utf-8?Q?IDTq6VS1ZrqlpBQI=3D?=
X-Exchange-RoutingPolicyChecked: qUPklbhzruWOzStcY7cHRH6xFN2YfhkCGsMKMvrqzz1/Ef1I/tYxIs341qd28PlfIOQr5LRVeW6Vic1CYEZQeBR/m8r/88LHnPU8XwKrVOJAT/N91RK3VZC/g77W/tfHix9b+sJgKNRXZEQUs5HFvgNMgeh+f9/EqI5UKPvTctYYFWIWOOxt/wamdbiFazi0pm3eS2f8JiklVU2bM+WUiz/Mc1dH/keRQFmFcyBNJyHIZ2KziG2AdANhePkGKntbb458OnVnz6WFlPOqu8NRTwPZZ9tlkwLgjq9UjIVcm50JilVtUCW+D91LvxGKM9OpYGsC0zulrAuK5BRGJOfryw==
X-MS-Exchange-CrossTenant-Network-Message-Id: e417d970-2719-4728-99b1-08debbf36e2b
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6967.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 13:25:33.5092
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nR129Hn6abICvGaYI9QoBn39eVw+PUp7JpOn0DrxNX0BmgWDDla6Gz2zeDXifEHw4YEOOKMI/AjJc9gYtQlBMasH7rzdIFfPDB8udEvbqrg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5155
X-OriginatorOrg: intel.com

On 5/27/2026 1:59 PM, Mark Brown wrote:
> On Wed, May 27, 2026 at 11:47:05AM +0200, Cezary Rojewski wrote:
>> An exception may occur during the firmware booting procedure.  In such
>> case the firmware sends COREDYMP_REQUESTS and expects the driver to dump
>> relevant information and finish with the COREDUMP_RELEASE write.
> 
>> To distinguish such situation from generic timeout, always signal
>> fw_ready completion when a coredump request is received and translate
>> it to -EREMOTEIO in catpt_boot_firmware().
> 
>> The "FW READY" print makes the success clearly visible even when
>> the event-traces are not enabled.
> 
>> @@ -536,6 +536,11 @@ int catpt_coredump(struct catpt_dev *cdev)
>>   		pos += CATPT_DMA_REGS_SIZE;
>>   	}
>>   
>> +	if (catpt_readl_dram(cdev, COREDUMP) == CATPT_COREDUMP_REQUEST) {
>> +		dev_dbg(cdev->dev, "releasing firmware from the coredump state\n");
>> +		catpt_writel_dram(cdev, COREDUMP, CATPT_COREDUMP_RELEASE);
>> +	}
>> +
> 
> Do we also need to do this if we fail to allocate the buffer for the
> core dump?

Yes, the driver must ACK (COREDUMP_RELEASE) the request.  Otherwise 
rmmod->modprobe remains as the only option.

Thank you for spotting this out.  Will update in v2.
