Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF8D3DFC94;
	Wed,  8 Jul 2026 06:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783493640; cv=fail; b=TbrrVIdDGPgZEBtYVDWp+pY+SRWeh0w7tecdnq9SXGdR2yMH/vqSqd5WRrNmifGfHB33Y+cBlUbFIIkAAqUt8SJVHMe3aM45ZXg4KiIFNfxdoKT+BbImmVrRX/VxvZFdHNR4m6TjlsXHB61Wh4wzX1nka1OZAWAuZQeVE/yIrlk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783493640; c=relaxed/simple;
	bh=75PM9DhqnGNJKKFsUFGHLsRxKAUA04w++RTX6R2ZmPg=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Xpg0CgQubbfjCmHqwkETjhKm/ARdWhIN5txB5dhFUiCFVhSANdcWINqlLdnRlE7r15wefHiLizVjC0KH4bo2IbV2ve5xIKr+ECjvRcg0RXuSB3NCvEESjni6m/R54VdQfaEN9oH+vkTLKv1rzbXDYKnbaBBVr+KWGxfIYvQ7m0c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fn4whIGZ; arc=fail smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fn4whIGZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783493634; x=1815029634;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=75PM9DhqnGNJKKFsUFGHLsRxKAUA04w++RTX6R2ZmPg=;
  b=fn4whIGZ+hKUpuENrLDTlf8QzbmaNzUiTzqsLp2e84FzyIIwW3Mo81U5
   sOYNW+w3iJoGvKJLfG4Otubdy0UYK7tbPcn6HYTd6osENxwH66JB7rKmJ
   stuaAnDfRMeYo45AAv685OZlSowgRlp55C277bVs7UN33lRjo/5GkY+xM
   6ysk3bUEKV24AQ/kE7qEwDUrIFlK29Udos/+sbmkIkiHbh9oUSqJ7dxx0
   07OnyLQAiL8gbwfWNKeNCkfmFKnRMUkYd8A4TnTHvGxJaG9Hd6ZniorBG
   FOKPd66EfWMZIZFF34wzqhoFt+o6urzcjYgKfgIGUA14M/D1s1v9xrMIZ
   w==;
X-CSE-ConnectionGUID: Yo0NkSUJQwSFktWchQGvkg==
X-CSE-MsgGUID: foAGrWz4Tx+zgp4yK8AmlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="83927154"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="83927154"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 23:53:47 -0700
X-CSE-ConnectionGUID: mlahuji7QKqIIPgrpZb2DA==
X-CSE-MsgGUID: 3r0gQk2CQES+rlBwJFOU6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="259116475"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 23:53:45 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 7 Jul 2026 23:53:43 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 7 Jul 2026 23:53:43 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.31) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 7 Jul 2026 23:53:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EAwHs9z21j/q0Zei04K3ANBmN+om5I9LG9+X3fyUjENd/Ze3HddklnD2otJElgIjqcdCIJmozs72xQIoETI260i64D3wW2zPMBNb9T65TYJvVnz19XEKaMGUWqD+ixcfiV+hag9UyR66Mgzx+W/vIMFqm/st4dt89yR5DrFaGmmrnYedwldFWpD+Jsz3ikQSQVy+W6cQDL7MZFOglzIW4FHGr86EPWln3AkWoOP9RU6rKKHsAouf94Can4rmU+Pnz4DZMMTSo9GnMFk56uP54QN6pObU6GjsUk2N9Q8dRsL/FRVAzOMnoXooJvKrUT/k+SNHCwg1/dSm6+nVrV4DVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xL4qeLoTAGkDbTqraliSsPzWwXe7fBG6QH/OFqLcI7k=;
 b=IPS0ujfZR+tEfCkel9wLxUDkxgUCaD9NAURFqsQUkINK4FaW3gf8wm18mJ2dXecAd2nLzknaWbePM9POvaLPszR3XaWhulXK4rOakTT0MC/+V/qJT86iuQV4xlVCERmyG82OBf8IXdDAZarsuJGyYZOB4maCix9+dZZ08cGbsG7eX1OCxOmlVps6nOi3aP14aL6zYOibt8tkE4UFVdaSZ7yGkj4b+SkGcLnGMaSh8/EH/Uge5KqgaadYi1zut6JftuZyAXKt0lAz7yBU2vefw6do8ZMT8FxS5WblNqLZRydbImJs1V+DgU7DwmqyDDtLkGUjnen+H/aKgU/rcMjyoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6967.namprd11.prod.outlook.com (2603:10b6:806:2bb::15)
 by DS0PR11MB7801.namprd11.prod.outlook.com (2603:10b6:8:f2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 8 Jul 2026
 06:53:37 +0000
Received: from SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4]) by SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4%3]) with mapi id 15.21.0181.008; Wed, 8 Jul 2026
 06:53:37 +0000
Message-ID: <70be5746-f1e3-422e-b68a-899cd8357f2d@intel.com>
Date: Wed, 8 Jul 2026 08:53:30 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ALSA: control: preserve snd_card_file_add() error code
 in snd_ctl_open()
To: <phucduc.bui@gmail.com>
CC: <cassiogabrielcontato@gmail.com>, Mark Brown <broonie@kernel.org>, "Kees
 Cook" <kees@kernel.org>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Jaroslav Kysela <perex@perex.cz>, "Takashi
 Iwai" <tiwai@suse.com>
References: <20260708023540.6962-1-phucduc.bui@gmail.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20260708023540.6962-1-phucduc.bui@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR09CA0152.eurprd09.prod.outlook.com
 (2603:10a6:803:12c::36) To SA1PR11MB6967.namprd11.prod.outlook.com
 (2603:10b6:806:2bb::15)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6967:EE_|DS0PR11MB7801:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d18c587-5836-4f64-7ea6-08dedcbda26a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|18002099003|11063799006|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info: b2nO+xPxuRyu2pxFff0ma1eIEbj+fDaMM+cC7tOmbyS5MWrooCs6GX3cl4GUzNALI9f3PNPhbSW0Tpb73MEmyfWvcP+ep7lLC6r9gVgTSsuAO5SRd3n9jX6qMj2V/YopEBzGNRFY2s987d+BqGzVSKBl312X+/JqSvWMVFWmtUjlOeBWHP7fxJ02r6i1JCnDXU99Sr2AHvy0ywKjBQi0tBk9JgAqGw8flakbX3bUilO1JSmUfOnz99k2P2oEtAa9B+SmJPe6cuZNNxugdtTQDUv6+Q4bL3aEP54iO+W1hHbkw22eHb1YOKAC/VHRmD9Jw5OhgNLSjUBeb8rQPXoj5kojTDA3JPMObYERbe1S2kn2SU3YhjjF91IVxintbJV7hOLt3YlaJnPeUzcj2QKgUefJU5rXKlnI1uU3Imde7FzOhr8rt/yhjtKIWKDh+uVqu2lL1XFp5j1zWbsVc58khCAH9LHOuwgqe6X+CAnzx9yqAkVMi1aQfQ1W+RpAjIApcy9fp7Esy1ra10phRAGOOXuPwVCDELB8VmkP/R219oH/jRJu2tjKpQTKL5CPHcgbnWXzgv6Flv86wU6a411karpN6zDijMoOiTVc4exY2SmMyDw2v1yF19Gp/MDpeMDmpVgIRkAFQp6a+OU2QrjjiyZHGEXHH7H4143U1GwtlCo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB6967.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(18002099003)(11063799006)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dkQ0aU5SV1pzNHNTVy9uSnhOSjE5UklYNDNxU0JCTnVGM3phSVkyMGI1T3Bz?=
 =?utf-8?B?VVF5ekhZdnN1R2kvWmMyNk9rQitkc254cGhTYkhYM1BkMS9WWS8rYitQYjda?=
 =?utf-8?B?VmJwVDkyRUVuSXM4blpjbFNsT05JWEtNWndlc29QOUFWYmNXcXZ2dTB2MTdU?=
 =?utf-8?B?SFhNSDYwQ0dnTmlHc2M3MWI4cWhuYXNuMDYvWk5KbzFpOFpYMFg1VnNNMzhY?=
 =?utf-8?B?RFBWQnpDaWJMUHRmWVJIVjJhbm8rTm9NODh5NmVFWWdSQjZlbGY1dldSbk5n?=
 =?utf-8?B?elRERzlnRVU1RTZDQ2Uwa1U0UmhsWHRGWDNhMTJ3WjFyS3lUeUlST3QreDNW?=
 =?utf-8?B?b2htcDd6VnlpY3g0bGlUMi85c1BiSE1QRTQ3OEUyR2xrdko2M3hFWkU2dzlq?=
 =?utf-8?B?M1BrUTF5Yi9rNTB6S1hHZU13ZndUY1lxYm5ucFpVVUZCYTFBeExNUGpsNGRa?=
 =?utf-8?B?SE84K2tnM1JsdjFJcHlDWTFaWGZoNXZ6aWU0QkFUNkVrYUVrV0dTbGx5TjZH?=
 =?utf-8?B?a1l2c1RmUmE5ZUdZMExkZjU0UWZDTEh1VEtMUVJPQllVUkl1cHhpTkpZekdF?=
 =?utf-8?B?TjAyTTY2bkhZSFBnWFVwUGJrR1RxNWZKc3hEQk00amtnSU1jbmRKMkpHL2l0?=
 =?utf-8?B?Q1p6QUxQV2o0T2lQQXFnVEdDNHdXSXIxZnR2VHpFSlNNZG9KSzBMY2cvUHZV?=
 =?utf-8?B?ejlQeHhVWWFoTmVKZmo0d2I2a2FlOEo0Z1F2MktFMFArU0psaHQvWEVxZ1hC?=
 =?utf-8?B?UnFnNjErLzg5V3ZnMUphWXF1Q21ZZGdUUnVrV0RYbXRSNnlxZjE5ODhJRzBS?=
 =?utf-8?B?Y3VjcGR6bEpSUkd5YUErUjc1dU1rYURpRTVsUmJyUjd6QVJaSCtIZEtXd3N1?=
 =?utf-8?B?NzltdkpNcjR0ZzRHZkhhTzVobFJEQis0TEU0Zkl5Y1hOeEVETS9hQWYydzl0?=
 =?utf-8?B?M21GNnpXZSsvMUpndWdZczZKRitQdTVCdFYzeEFPZnRoVjZRSFIrYjFiMUFV?=
 =?utf-8?B?dXNERTY5aWdvTTNVcitMbGNkYXRxR1JRWnQvT1F6R3BIajdTT1VMeUN3N3NT?=
 =?utf-8?B?NDZYVG50bDBVRnpBblZ0ZVVaQWRTUTlIY3lSQVpoUWIvSHNvUlh2bi85elQ5?=
 =?utf-8?B?TDhYSlhlOUVjaEJvdXBFOW1rKzlQaGJKTE1BczhTWHY5Q2toWW4vWlQ0eHRa?=
 =?utf-8?B?bWR2dVF4SXF2MWo1dHUyOStyMXRPem92RHZzZmFLM0RGZHA2RVRJTkxYelhK?=
 =?utf-8?B?OUp0RHFIUTgyMldtcE5xYXR0RkxiNHMrckVPT2pNNU1TdlNVUm9Cc2VyQlQ5?=
 =?utf-8?B?VUpVYlNUV2FtQ3FpVFhlSGlpdlRncTZIMkxIWGpDcmFDamVkdXlpT3BlSzh1?=
 =?utf-8?B?WVhhdVFjY1c5NTZPRlU2Tk5GbDBxRXI3TVEyMnQrNkRPQWp2UUEvd1FNMUZq?=
 =?utf-8?B?b2NSdDBnWXNBc0tQUUNGZGlwRGpIOUNWVjBwY053cWZjZzFpUlV0R2w1WFRK?=
 =?utf-8?B?dlhVNi9MZVpyV3l1VHZQRnA1V3hpSCtlYWowOFplNGNpZGljcUp4OUlrTnd6?=
 =?utf-8?B?d0xMb3F6ZjBrT2NKc2JnbUxZcHBxRWZLVWFSc1YraHc0cERIUWlNZWIrUVl5?=
 =?utf-8?B?Rm1Ec1lUM25DK0UxQ0JabEQyUm0vZ0JsdHNpSnRZK2k4ajZhaDNxdGdxRXhl?=
 =?utf-8?B?NTV3c1ZmRlRBdlpYWEtHeEpVQUVBcktXY2FxbjdReWo4MmpWZUNwaTVPSXdZ?=
 =?utf-8?B?UEhFeWQxd2VNa0tQT1hVNjJ1ZFkwd1l3aloxS3F4eU16VytwMTFBbVdKTU9u?=
 =?utf-8?B?YUNzb25naTFnVGk0L3JKS0IyTmhDa0J6Y2N6QW5EUjZ6OCtKVzFDb0taeXFD?=
 =?utf-8?B?cllwMzVoSFY2eU9FZUtDL2ljeXVuMUo1a0Q2UjVUMi92M0VwdWZaZFVlY3RI?=
 =?utf-8?B?RjJabFhab2wvSS9Oc2ZMNzZubG5jSDNsYmc1R1RoeWxBMmVudWQ2RXJJa1hH?=
 =?utf-8?B?akE2Z2VnVnVucTBoZmswdGdGRE50YittTDh5ckl3eWplUlF3Zk1JWWJQMW0z?=
 =?utf-8?B?Z21QQkFYSmsvRFMxNytLUFFrVWNCV1FtSEp6WGpiOFErTmI0azk0ZHVWQ3Bh?=
 =?utf-8?B?dnZGa0I2T1ZocTI1MkRGZ3RzeXpxSHh4NFVPRy9LRnBQMDZscklabE9IemtG?=
 =?utf-8?B?VWFHcGhvdHZsdWlHVWowY2JycGh1YmNoQUdwZTFONVJiTEl6cTdiZVBSRXoy?=
 =?utf-8?B?S0xaWFhBSlptZk1rKzZhcVpZaFR2cjBNeis5MDlJaWZrYWcwaEFiRnBZSmc4?=
 =?utf-8?B?UnVUdWxKZ2phM0YzVmMwd1Q2QlhGL3lCTTl5ejBsaGxnWlhwZ3JPKzNUcXBK?=
 =?utf-8?Q?nfWvkCnm8Yl/geD8=3D?=
X-Exchange-RoutingPolicyChecked: QsLwmJ/+qz9sn6yN8kFSAteyp/eda4vXugfpKAvvrsIhWQQlziJwf0EHS8ejFPF1KDVdPK2r9wANQeQSDXhLvBfBkqkqAg51NS/h3qcb4tPgWu/YmwEhEzWXwy2cMjKiuCOx89Qbjpdt1Src2R6teU8wZ/k8TMlx2pgpYY9IINvS3xfUVoyWgiSySs4qdDwpXcfhVlcKIJk7H8IecJ0u0/VQDKdHVyGe60ASzGSAotKHX+9o0dRhN+Eqff+DCPrpidbBI4vrMGaCbr60joi3RI9/UDe/cVj79zc2GrOsCAwjU83FaPlwFUg4O57mf1n+8biQGDfujYfCo8yp3d3XEQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d18c587-5836-4f64-7ea6-08dedcbda26a
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6967.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 06:53:36.9145
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kBCdyA61NWzUc9G19p4RE62k/7u5INcrxrpnQXc+ECZ6kxfYg/iCOhQsf9g8cGuGmdFCd2nr6AxkZFaUYoadc6tWlwATqwPwrMY1ePHa9bo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7801
X-OriginatorOrg: intel.com

On 7/8/2026 4:35 AM, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> snd_ctl_open() unconditionally overwrites the return value of
> snd_card_file_add() with -ENODEV on failure, discarding the actual
> error code.
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
