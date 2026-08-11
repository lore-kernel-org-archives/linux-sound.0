Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 173322DF6E6;
	Tue, 11 Aug 2026 13:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786454233; cv=fail; b=XKx+oHToGL3YXENAWOtclH3wZj2Yq5XBIsXqqJqwg3ny4yvCfl2oaTHA2doM/ousZQe30WnfSqEkK7cKLTaDw9opX8AhBkCDq6l0AUiayLRf9jVJwWcdEhkNSJKM07FXNMPsb5lDnRvmJE1XqoxTFCNgo2wSghTAoLNMWfGvlfM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786454233; c=relaxed/simple;
	bh=5F52yzI2DhtVwmApLOdigFYoytOYhgTXT3uwMpuWP04=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=h6MZ8nNNzadoPCsX6SMwj2LLuiTmQ0fDBUfYdxLBWbcW6DMjxeQhHPhnFRd1jVeuex+v1wtP/QmDiUabmvZyV3KNZDnyYXAJ7pdvlrLF6FUsG8UtfJhnpVwZuvQIBJ9p0Mo87TrFNnSAzBFXkIEG3s7beA77KEmWhQUXh9/esNI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ayWEOOs4; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ayWEOOs4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786454231; x=1817990231;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=5F52yzI2DhtVwmApLOdigFYoytOYhgTXT3uwMpuWP04=;
  b=ayWEOOs43xjMGpcmr1tY202xEhDDvEVAPOGY0dKbGrtbHmK77Xd4dinz
   kOfUW8OsEBz6OIN6DR0IQbD4C6V5XDI26U5SHTsxVmak15/BGRToa5nzP
   O+Rw6AEO1CfWOavEgrGlDWgVSvRWPls0g6660b+R/P6k68IV15gNlBSxP
   amaaG5rXMwcSY5WVNaFA4CGVfIDXzEREI2wTDWGG8tAEoNwpkVSxyt0L7
   OSFQiZqNmg9Ku99CI8rKxXlX0UWofCOEkAcTOMvYFnXGj5eQdVL39kZ9C
   7ZXyVUMtTl0PvzRl8OpXxOgQU56306kX/hJzXnXbwH/VgQ+vX+UWlcX8p
   A==;
X-CSE-ConnectionGUID: ZCJa3GMaQfazuGpSJ5cYsQ==
X-CSE-MsgGUID: NRFRA7H2SpyP77NjonBa/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11871"; a="97329857"
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; 
   d="scan'208";a="97329857"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2026 06:17:10 -0700
X-CSE-ConnectionGUID: fJsmhEEnRnCaq5wbYcjs+Q==
X-CSE-MsgGUID: GQ1mobvmSoKP9loK6earpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; 
   d="scan'208";a="260728531"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2026 06:17:10 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 11 Aug 2026 06:17:09 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 11 Aug 2026 06:17:09 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.25) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 11 Aug 2026 06:17:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e5Q5ZV9OeR7c11iHz8ABbLWkBtvToghy9pclZee7cXVB6lTiurbbXp6TPBvmw95fYuQNm49L9RYAFRb1rI2zw383eCcvj9Lp7CwN0fw8XfjqcE10cw8NA4kbLatPeIE/9EPsZi6mIRqLahZXhGb2XG9qKgub5S7DzRpXcNAXEqHBpMNlrh3GRtKHFmyWwtd2bP3QHPdhO6uOZYWiaRUiy203e11E+U6kay6YK4qEmU8cmsPMTjgIkMfOkziyibLxw0c6LItBM1Im3a+QPQYKxJp7mQ2W7bkgU/oW9u1f22Cvb+f2gWvSeWEYo7Y9sKmQDGQyqy6zTBzq4BHOKTEWwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rvb1bsTaj0R5W2W5yi1TU6D4ZkRJB0lP+y66Z972Oio=;
 b=XZQM8hDO/9WrdGbMDykIT18SzN22LYS90DpngmsYEH6UobmbsJXNRWyTjx4a6qBVLzJkbgziawmXs7AfCjRYd6rEtXegfLh5jJrLi9OVF/Im21WhOaeTT9XvLuuRa0QPSG/60QF84ZhvPfPktKKSXeoKY6dlTpod+teddCukSoIft/7SOHbpR1uZdAND49QeKntNf5oqO8sQS3GhP/6obIDzduxAGRI9oLycvdtKxAS6YjeOhFqvhOXCvuGCiryZNsz3GaEHDhagfl2qv7B8ocWxbP+m6O6ulpz7kzv3zErYAFqV5ZZhKoxcLIQfxsvVprpTen76zll49kMb2gjhvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6006.namprd11.prod.outlook.com (2603:10b6:510:1e1::13)
 by DS7PR11MB9449.namprd11.prod.outlook.com (2603:10b6:8:266::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Tue, 11 Aug
 2026 13:17:08 +0000
Received: from PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd]) by PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd%5]) with mapi id 15.21.0292.024; Tue, 11 Aug 2026
 13:17:07 +0000
Message-ID: <5574c552-a2a7-4970-9fe0-1e25be78eac8@intel.com>
Date: Tue, 11 Aug 2026 15:17:01 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] ASoC: samsung: aries_wm8994: Preserve gpiod_to_irq()
 error codes
To: <phucduc.bui@gmail.com>
CC: <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Sylwester
 Nawrocki" <s.nawrocki@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>,
	"Mark Brown" <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi
 Iwai <tiwai@suse.com>
References: <20260811090550.38930-1-phucduc.bui@gmail.com>
 <20260811090550.38930-2-phucduc.bui@gmail.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20260811090550.38930-2-phucduc.bui@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR09CA0113.eurprd09.prod.outlook.com
 (2603:10a6:803:78::36) To PH7PR11MB6006.namprd11.prod.outlook.com
 (2603:10b6:510:1e1::13)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6006:EE_|DS7PR11MB9449:EE_
X-MS-Office365-Filtering-Correlation-Id: 59fdf8bb-3891-423b-cae6-08def7aad823
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|10067099003|11063799006|4143699003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: DUrt41AmXDH2LbQuK/Xl3otOTZLY2KYbV5jJ7Iurrm6cjaFprVs/8vZVfKH8fEfM8j00Ai/7xRgzrn6qCtHHnEDQFiaf/aKp6+PkXXbFE15KeN9ixjW3LeyShu4fYDeFfwWX6rfEryYbDgyCLhN0jvyORkOh8ccnrOgPUBuGct2ZD1R8ZrSnw44I+i84M+E/YdTgyMjADDcHYj1fVbA8Rp4jbTRi2gThi1bbHU+FLF1Q9FhbAJYjfp9UflXdZ8YybJcKfM/UHGTtJmtvkbjBRBK8AoGDfAwwX2H1bEoWE/aYVmnQmF6SIuhHplutfmGpuneGoaIFNkZXf5++A+vRZiW/8MyU3sHMGV5pTinQRXneCBCdFQNvh1mef34AtXBk2/hvYNSCFNvtyQg2tyHbx7+/0WsxQDmMqj9UKO+5ripHmoeWtgWnIZ0/4KLQKNRsbmiCUJQas06i+6go13TE5wFu03NYLtVm2tqQTiU3mmw3IIziFrxg8vwvVbSYJZEwD8E1MIA4FsRn7Z0S5xvEYK/eeFimMecexrbZ9CYwkarjCXn0o6X1UW/tlO+M2c7Kh8PLeS0mFB+UTfuKTggLRyyk2F73bDjAyII6cnHsj3Kzak0+YvKpmimvpjmZfYT9F8BLvYxKJ7azvFGerIXZfeofFKaNkGzmQ2Yd7ieqJs8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(10067099003)(11063799006)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a3g4NUdPQXlKcmJzVHpDRTJyMkZXbTVOdFNYZlRreVgyb2dZR1ZNekJIQTJZ?=
 =?utf-8?B?YXNCUHRlb3dmLzRQTzU4Mkg1Z2Y3Q29WR1k3bncrMmZHazdLTm54M0VON28r?=
 =?utf-8?B?ZTR2b0s4Z2laOStYWkQwd3ZkRmtnQWtXczRsYmNjMXlCdWMzdktVS0ZUSUZn?=
 =?utf-8?B?Q0VRV0p1andCN1kyd1Y5T3FRTUtmK09MTDB3anRIcW9zcWxlWm5FdzV5aEhH?=
 =?utf-8?B?SDIvUndKVklzbDM2a1Nlay9nNjR1eVZNK1Q0MU9rWWpqZ3R3elE4bEx3YmFS?=
 =?utf-8?B?TjJKYURabndRUHVNME5ZMGoxSHY2UmlwMFJJM1pIdVg3ME00d1VseEhlOXFn?=
 =?utf-8?B?bUZTdFZIYmYxYjJoMkJMeVBTZWk2YnRqaUVNenBJdEp0UzJuY1JabnRyVW1k?=
 =?utf-8?B?b0JRMXpmc2hXQnRtQlI4T1VNSXVkSHFISmk3YVFha2NNQ1dqMDFhWEpxaG5V?=
 =?utf-8?B?Y0lVdklnM1pUbis2L253dDY5S3RhYXpqZEJTNFJ1QnBrU3Brdk9wZXM0Z1Av?=
 =?utf-8?B?WFNZT2IyanpHdDZZYnNmNnEzanF6TFlCcVd5bktpc2JGWmtseG05TkgvSWhL?=
 =?utf-8?B?amo1eEMwVGU2MVhMVExqcTNuajN3RjRTbTk5Z3EzSzlzNEM2MzdNdHpjYXlO?=
 =?utf-8?B?UHdmS1ZZamNrWWtha2N2M0RnMmhoQVNXNWJLa1h5S29FUzN6bUtncUoxNVJB?=
 =?utf-8?B?U01IQW94SFpMcnRUSEZCQ0s4WHRuUzlyWGRoZmtPZFpwR3RseUUvcjZ1aUFR?=
 =?utf-8?B?MGRFTlA0RVlRMmZjQktMUVZoWFc2NzA4ejhKMjhsZ2hwbGRmalFjVlJMeVNR?=
 =?utf-8?B?aDk5c1NURHdoakF0RWdRbHl1RDFyRkpqVzQvZjFCNU1CQ0pkYU9LQkpOYy9M?=
 =?utf-8?B?d282c0dvWXFOZTN3QmtiWm0vaHNsYmxHbHVsMkJDeDdVU2RKYkMvd09mWTZw?=
 =?utf-8?B?T3VGcThGNzV1Z3JwMUtVTTZTQk1PYUdZdUJ0WGtWOUdhdjZpRXlEOFozSkZX?=
 =?utf-8?B?NE1OVWxpSS9sV0Q4Q3JJU2tQMGJMSDlTYTVzZHJ1S0E4K21JZ1JhWHlJSHdE?=
 =?utf-8?B?T2pTQ0dIelk2TXBsd25MN3czQy8wTE5RZ05lMlZJUkZ5T0FJTGJFV1lxb01i?=
 =?utf-8?B?Y09XTWkzTjYzYXhWZFJTRFNtb2JVOUZoTXoyS2VWUFVsUCtSb0hseW9qcUVY?=
 =?utf-8?B?cno3d0U2ZlhHVWV1bXUxWlhDY0Rmc3ZoQ2JFY0JTQTlpa1Y2MU9xVDVKNUhC?=
 =?utf-8?B?akhvbGRudVp0Tjd1UVgxRXFqb0VCN1JUdFhXZDBaR0xuQXcwUlg4MnVvajly?=
 =?utf-8?B?Z1ZPYTBjdFNhcGZYdGNyRktENlBhVmE1VVdsV1Q1bXFIN2pBZEt4UWZrSzJh?=
 =?utf-8?B?dTI0STdMR29rd1c4MW1jSE1FbVRhVkRYVmw2UzByOHdNeENac0FUeEZSVnIv?=
 =?utf-8?B?ZzNNUW1ocVBHUlZueHBBRDhnaEpoc3hFM0NQWGhKejJPcldiQklIZzJ2b1Vv?=
 =?utf-8?B?VWwyV3l4UFZaazlqY21WOG5oS3pjVTJpTnlSS29ZZTJaTG01MlFFQ2JXREVv?=
 =?utf-8?B?VHc0NUhzNDNuYnp2WmpUdk5WMVJWNjkvM2pacDdOQi9DV1RMSFMzMkJMZXB3?=
 =?utf-8?B?OU4wZkU4T09LM0I1WEFVT0c4c2ExU0tMV0JZRm5MU21pL25XSXkwT0l6S3hx?=
 =?utf-8?B?N1RJQzMyaG5sZDRNREx6YjRWdjFkSTBIVTF4SXhqQ0cvUUtwZUJiR3dUNjhF?=
 =?utf-8?B?VmE4WWdNVEc4RmV1T0FrUXdZRURtdGZENHIxUjhxVDRFb1NuNFBEMnlBeEM5?=
 =?utf-8?B?MmduSlFzUHBDakp4SXBLSUxWVmNuSnk5N2VPZ3cxYi91ellzVXdxNW9Fc0hk?=
 =?utf-8?B?Y2N3QVhraml6Rjlabkd4aVBJNTZPK3RoWjZpeE5DcHJrWFQzMVM0TnJBaStH?=
 =?utf-8?B?b0haTzNsc0xTUUM1ZGdJQnVlSGZGb2hPbit4VlBObEl4Z1NXU05zbHdHbEY3?=
 =?utf-8?B?K2VTMEs1RlZyQnlRNWJoL042QldkbVI5amZXS3YwL3lyMFRRYjFpSDdVcjky?=
 =?utf-8?B?cFg3cFRyZ1l4R1lkcUs2RzFhbEdLUnBOeUxjckQ2cWFHVzd6VTFUR21YRnBY?=
 =?utf-8?B?NEJsSEVzcXB3cGFlaWdrRWJmbjkydzY0MW9naHZycUlmREVhM1BVTWhab3dY?=
 =?utf-8?B?RS9mbkFQWEQzOStySEhzVm5zOWlhc3ZDckhtWUpMTkx3cFBCL3FpVThFZVFq?=
 =?utf-8?B?RFBKdWVxOFN2RFNXV3RZMmNwUFk0blA4TmFHUXk3SXNyTWM4L0FKTHdESlFU?=
 =?utf-8?B?TFNyVEF2Y3RHVzdYdUJGMWdCaG9yOTB3MXYxVFhES3I4dUs4YWE0dz09?=
X-Exchange-RoutingPolicyChecked: H52KS9AeBgmRPvYBZ8Dv8u1us4ZC9DCTMt5iCWp4v5EvQCkVj69qnLldlqdYb25Zj+Fl6Cy70DT60pu3YgNfPo8J7DGlEBeyIqi64Sq9dZYeCz5xF2hwQvXmVN/7zaV+pmY3DAUbzqSAZmf/kjpWZKBDmLjfBmI75QU3YLTCx56cTeJ6tMwohZ9vmtLfkyq4tvEVnmItxxwPteX3FgSnAkLpCZmQGNb5Z8EaUrRg7NUtCQvJHskC14YIqyJJB/BxswniLbKnvfPXnmayPjgySvAcx3qQaKdwE+Iw4fcITXRlETRSh17lrY644LdcYxxu6DLC5qt7yuaIZtQH9wH9pg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 59fdf8bb-3891-423b-cae6-08def7aad823
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 13:17:07.8833
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jWWmeX4jIA+B+mvt/TXibaw/5wxdHsLH3j/l6ShU/PH1Opb6BUAssfFpK/Wv2p9uIzq93QBsab8vmwziDVAgo1DeET/bCi8tR1wwL/zYGn4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB9449
X-OriginatorOrg: intel.com

On 8/11/2026 11:05 AM, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> gpiod_to_irq() can currently return several error codes, including
> -ENXIO, -ENODEV, -EPROBE_DEFER, and -EINVAL.
> 
> Return the original error code instead of overwriting it with -EINVAL,
> so that the actual failure reason is preserved.
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
