Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2353E32F75B
	for <linux-sound@vger.kernel.org>; Wed, 20 May 2026 10:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779273211; cv=fail; b=P98oSKi4kB0+16BjyrziIwi6A6J3eHryYpsBb3qH3Vzh19ohSJcWZrpbWD7Ff/9pFfUep/Stmb2xAmq8vb2A3FwjyTwvAIIpHVhX9KEsnWmBdcWuEkMVQEvZ1te+fVf5xQRrRDc5FxdEsh4jfW2O2FVVvad74rlFHZEDiVQS41I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779273211; c=relaxed/simple;
	bh=Lvj9K7BEFX5WYusOzkqT4/KtDdiMmvl+LxcUrAGXn7c=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=F34/Ckcp6GrpM5HAy5d+lwUGWnTVywKtbIstlojU5dIRPvtSYVEiiTZ9l6CgA7IdrgdcmLgYX6FWJj+2O2+B8PGkyQrISJf4A8HIrLc6NJxnRhws1hDO/9btcdnf8dt+XQbEzz9QMXncvNr5Rstw/sQyuN29Y0GRRgwuC9r3A9c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b1/uH+GF; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b1/uH+GF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779273206; x=1810809206;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Lvj9K7BEFX5WYusOzkqT4/KtDdiMmvl+LxcUrAGXn7c=;
  b=b1/uH+GFb8A466Sn2bDmE2fjCQaH+VGBWCukmIVQStOX/C2nN0nld56K
   Nou3xOoqDwtgNsbfRnDG0FrpWqvSCWWLWEoP6x8brMBtTq0lG9l1mO4Rd
   H4tI2PPyPxTJymob4jdpj2WDy04qIGZNrN1YeQjMHoUAFYg6EW+pU27Ez
   L8G45xMkm4qj+p6wnJtMaqsZd9mtPW2HLoPTtlVVcwWeBrLM9iRoj8c3m
   pruh8976m3cyamPwMTZDmOguFPtAlipAxWMwWyRQe0txO155xmx7NtLmq
   oXzDa1Jwsn5OZwp5MN4eriRsPze0fVOynHJfnSXcEhajqOM0Q1zaIC0Gw
   Q==;
X-CSE-ConnectionGUID: 1Q9cG4cLTcm6lMxX3Mo1CA==
X-CSE-MsgGUID: 0sZfsMraSTSVObixubOb+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="102844412"
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; 
   d="scan'208";a="102844412"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 03:33:25 -0700
X-CSE-ConnectionGUID: JY03tw7LR5uFM3W6cDpzMA==
X-CSE-MsgGUID: IL6rYmdVT9eYUOfaxbl7VA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; 
   d="scan'208";a="244420758"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 03:33:26 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 20 May 2026 03:33:24 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 20 May 2026 03:33:24 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.24) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 20 May 2026 03:33:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BeZbyH6JWhuD45BRVrQVA/Z6L7XfQPWLTEJ2k2E/uvL7X3B86ePGwXVp82FK0DT3qDIQYojuSeh0Ur9niqEFd4whzxOzcOhJPhFNLugZ7wLWFT8w6am5kHRCxNz1WAYaQYfgrYQu35906Wto1cPeh5QEVRP3xqRkg0Z1EKfOhdWeY3lYz4NaWMx5EF1z2TVriYuQFqAwz/yjJQ0kRjmEi/oX7TPDF8O/O6xYSqMDAWx138y9nNI/ZI62YABBZuhTPLjMJcQPdbjBPx7zGEx4GSivRevCbGFsbWlBKVlWRkzkrRek+o0N1fbMIZUe1cP81rjlJoDumndYmbw5PmbFqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JsUxj+NPf+9jzVzph/0Rj4LeN9i6XjuPanoquBd/SyE=;
 b=awBB1U3mAtYx2mQce1nWmEfS010gswi+uVZLU4J++b4kSIlBplJ1LB4iVdLdmULZ6hA5c87BvLsN8nVzZK7AhR5URcyYKWs5TKH3TKEKQujvQbSySvlXcPjTJhs3poPE9zJITcwJQuCA9FTWqSZQPkJEZ25NkBAtg/zdFcOgZe1HeRtvk30P/1sn9H+B4TiVw9hbBO72ru0pbVf3rFlHc/aBGd//RMdmNl6xk5FW6z/cJ9y8X3WCgYIYsW89V+NT2RxEVkFwUeyBmDFl06bqJczj9TvQPAPxABOVXuOPjSeT+Q7PSylG6m3HDkMig0YedTCbQ0nTYZe7Pmxvp5dhqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6967.namprd11.prod.outlook.com (2603:10b6:806:2bb::15)
 by SJ1PR11MB6106.namprd11.prod.outlook.com (2603:10b6:a03:48b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Wed, 20 May
 2026 10:33:21 +0000
Received: from SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4]) by SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4%4]) with mapi id 15.21.0048.016; Wed, 20 May 2026
 10:33:21 +0000
Message-ID: <fd995eb5-31d0-4037-b5d8-2ef3a75ccb95@intel.com>
Date: Wed, 20 May 2026 12:33:14 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: core: Move all users to deferrable card binding
To: Alexander Stein <alexander.stein@ew.tq-group.com>
CC: <tiwai@suse.com>, <perex@perex.cz>, <amade@asmblr.net>,
	<kuninori.morimoto.gx@renesas.com>, <linux-sound@vger.kernel.org>, Mark Brown
	<broonie@kernel.org>
References: <20260430140752.766130-1-cezary.rojewski@intel.com>
 <3045975.e9J7NaK4W3@steina-w>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <3045975.e9J7NaK4W3@steina-w>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI4PEPF0000014F.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:808:1::867) To SA1PR11MB6967.namprd11.prod.outlook.com
 (2603:10b6:806:2bb::15)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6967:EE_|SJ1PR11MB6106:EE_
X-MS-Office365-Filtering-Correlation-Id: a3dedd39-9767-44d8-a253-08deb65b369a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|56012099003|22082099003|18002099003|11063799006|3023799007|4143699003;
X-Microsoft-Antispam-Message-Info: KYUK9zbiwq24LYB8FyXlewFVg/XzKqDszZblDXZe9P7bgPkjvmb9+Gl/Z9ba8iQ27Nbta6mhqOzD6tGSQ4E7u3Bk8uczT5zeC0CbEt8YwAnWkoANt/t0mY+N5SWr1Mb2ltHAJLUSOz7UXlA1z3awVD29c9BaRO9eAEEXEhl8Os2FsZR/melyJJL9siK2wmVCntbbPEDEtJjST5U7pQy/rSmfVXrM8vltsUBOuNgtHyEHYlaj08D74EgENKHayD/ECT1FpnyZnQ1We1Wr78zeBO/3EIYcEjRfLVGgq8jb1OUECziJousblIFlQvHkT29vEumJMooQVOOfUvLIRt5K1/x1Iq5peaK3eNKSvWKq33FZihf4Rk3qnP78b6/kIxIxSkEdxcOBF4hVUJWuwWxAyU+5frB/7vXdNapo8pYtJTsiiumnrq9FxJ8EUD4odO74VA8JWNy85itfVz45r0A49Pt92xrben6me1YX6MD29qAknYkuu5R7XCmw53ew4sPb08G6Pmwb5yuJP2jDZlY7Po3WN6kBuCzpjRS4MO90v/cfnRJH7/LRtNlNd9LXHfTTvbrsw7EPFyldrekgvOge+I/qn/GJYAPJ/Vya9tLSRDxGUCF9MKMnW4ADTqEGt5kI6l5M0wRxBTobRaf6jIToNF4+N0iB0YeToyvijtNwTvVANTFQuI6UFJ0qtRP6rvkz
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB6967.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(56012099003)(22082099003)(18002099003)(11063799006)(3023799007)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TFBCb2FCVnhZeFdJaFh6cHhSbmUzNDdQYW92OEdTbWhQZGsySFQ2VGJhSFha?=
 =?utf-8?B?U3o1YkxFQ3B6MExqbWNPWnliNmZYRTY1ZGpyK2VmM0VseEE2TjFmYmJyY3hv?=
 =?utf-8?B?SXRtTzMzbzVIN2pXYlpGbFJ6K2VzS2Z4ZFplbFJWaWJkb1lKOC9hREFCd0dr?=
 =?utf-8?B?TU9KZDNjRTdNTzJtYlMrZHVmN0xuRUVJSUdYaGQwZlRBY1YvYWRlR3FLWDNJ?=
 =?utf-8?B?TzhSaUZqWVFnZU5OeEhWR2x2NlYzczNjcndGWlhnVWxrWDEzd2hNNWk0RmNQ?=
 =?utf-8?B?WmxOVFBXOVhEYWkwRmZxbHh4RkgvYk1DYUtoMEptZW5neVcrd0xRT3hET3E2?=
 =?utf-8?B?YWk5SjlyLzRpbU9JOWtNZWpWN2pDb3pqaXpwTnFncTFKUU45SHpGMzJFMmVW?=
 =?utf-8?B?c3lTcjVYOVJYeUFzcXFCa0R1S1M4ZGZpSVdWbHR3N3lucUQxQ3RmTVc1TVN4?=
 =?utf-8?B?YmhrV3h1YlpKN0VuZHkyUzgwSlI5eTJmUERnOFA2T0MwUUVETkIyTSswQ09K?=
 =?utf-8?B?VkhYbEdiYTVqSGtiUUp0ZDRQdmxjQXd4TWc5cDBpODdUTDExd3dOYWdENjRX?=
 =?utf-8?B?L000ZWRpUmJ3MnNzSWZvYzV5VXp4K2c3c0xKSlhDS1JCcUsyeGZwZXdBVW9S?=
 =?utf-8?B?Uk44a01ZRjZWZXFMN0RDU2cyY0ZyNnVhaU5qaGNGdGhPVUVOeHJXUGorek9K?=
 =?utf-8?B?VWpEalA2N1JtUEZUcGFCdHpzZ0FmNDFKa2xVU1Fjb2NFQ3lRK2lOU2Y0Zmw5?=
 =?utf-8?B?dzhaS1dJbGpNM05peEtTaDF6Z21mZisycVB0QUhOTzJrazNUbDA0dlRIZGZG?=
 =?utf-8?B?a1BjZ25uNklpZmJDTGhzZk1EQWZ3aDcwazVqeDlXN2liTXh3Zi96QUxzRlJz?=
 =?utf-8?B?Q2QzS2hyYXVEUlp2YUcxM3hKTkFmcmlnaStIUU54WGVpQjluVXlFTytNb2p4?=
 =?utf-8?B?My83L2wva2VLVk9SOWFFMUtUK29vOVZmNUZMcnRsSWZ6Z05jNXFLM05JQWZT?=
 =?utf-8?B?NHRscExEcno0ckN5cTN6TlFSN3lCQVQ0SDFua2lLU1BkZjJuaE94Y3ZnNFFR?=
 =?utf-8?B?VVBqMWlMMERXUVhGcm1RV0MzNWJ6T0NZeXF4R3lMQ3oxWlZFck5BSFNnallM?=
 =?utf-8?B?ZzVob0RIVFZwQ21ZeC91SzkxL3ZWV1pVMHhMZWN0UC9LOTIvN1hOdGNUalNV?=
 =?utf-8?B?NXhvQUJtZ2hmT3lwbVpscmhjWSs0NjlGd2o5eTl1d2xIL1N0QitBUCtQU3JC?=
 =?utf-8?B?YzIvS01SdlBSYmluZkRDUHVKbjlpOFJnZllwSk1ZZ1E0UWpZejZ2RnU4SzF0?=
 =?utf-8?B?dXhoODUzWktaU1NjdjVhQWV4WGgramQxTlBEaVNOV2oxOFVMV2U3NlV6ZnVI?=
 =?utf-8?B?Z1JLcitLNVlZVHhMcUMyVmtyRWJZMFJKUk92M3hVc1ZtQ1drdzh5RjNvcGdB?=
 =?utf-8?B?Q1FQRi83VXBabEpHYURsM3RqSU9GWFBtdUlxMENkNm5aLy9zR2lqQnNKem82?=
 =?utf-8?B?dDVWQldNTHMwNlBUQ25RaHlHTkpyejZoVGtubERPUy9rb0NUWlUzaGwzVmRU?=
 =?utf-8?B?eWxnSjlrbXhwRGp2Y2o0ck0zNnZTUTVJUFpwb21GNkdEdUhkejRwdzdnWExz?=
 =?utf-8?B?TFFLRTBNTTZ4MHdvWkxvMTRMdnp1M2hlRGl6MWM0RHNLUm9LbmtCcmJ6TXFz?=
 =?utf-8?B?OEY0NWFMVmI3MldsWkZZQzNMYjFSTE5WWXBWSVZJSzFvampsQkkzeVlnbVpu?=
 =?utf-8?B?SklhZHEwUHZYSlBYbXBwQXRKc1RqY1NScmtjK0oxemYrL0s3WGFodnNKZ1Fj?=
 =?utf-8?B?NWxNenMvam5GNlZNc2NNSHJBZ0xjSFM1WndnOFJkdkxkVzU4WmNQWEhtRVdT?=
 =?utf-8?B?RTc1aXlRTGZkZjJmbDZ0bTdGSElvQmkzYUdoa0tnMW1mRHppNVFqQXVkS3FB?=
 =?utf-8?B?Wm92ZGwyc1V1cTZjZXlrakhXY1VTTnU0dlhWU0FLd2xzdWNQWVBWamxJS216?=
 =?utf-8?B?clA3WXErbXRsVlBlY1d1OHZENUR5REVsQ1ZHQ0RaQml3a1pyT3NiZjNNTDRP?=
 =?utf-8?B?ZlhUYzIrZGZENUZXVUw1MUwrUTBDQW83QkRxK284ckRFTlpDTktZRnIxMmpO?=
 =?utf-8?B?Y0tUekpsbHducmtnRGpoS1JJYk1KemN5RUNWVkJ0S3dDSEluS252RkVBdTF3?=
 =?utf-8?B?M0tNZDZORXorbVZHQVZLa3N5em9kRDR3WlRad05oOWROaWlRWSt0VFdmdEVE?=
 =?utf-8?B?TER3cnlFZmVkeWxzTkN0SllrNE9PWVVBei9zcFBkVE8yZTQvYzAwWXlVd1Fv?=
 =?utf-8?B?d09aSkZ3ZU82THJDUnRObUpBa3FZdS91UlFOeXRJM1lId0FMSTJFMjRtcjRm?=
 =?utf-8?Q?wKN7WxNW0bUyKHPU=3D?=
X-Exchange-RoutingPolicyChecked: KeY8ne62n/LCdTE2ZmnVooOuJEbi8toAN+slPaqoEiMCs6pBNGj/8ckFh6pTuFJ9ouEkCvILj2VyY8195POROCT7CVBAS1kPBhlpbOZKlXGaEmN3JC+jfIHeRldOEaXqerdoFqek+gcZNiqBA63sCBepEdelqVTcc/Bj3MdwpxmHjuhHnK/0NlkH7kc/VVDxZvmDDoxV24xHakRE8tIhkL+SQWYrQmGEPyZq1d9dVV4Q7UgtmRA4Qs9HVMmDrobz0GIaQ4yWkcxGRNxqscaDOCzEbMEqSupEYSslP1l+YQHUol2uoQyi5cgDMroSAYYKLRpHgaEy4fXjjIZJt6MWcw==
X-MS-Exchange-CrossTenant-Network-Message-Id: a3dedd39-9767-44d8-a253-08deb65b369a
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6967.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 10:33:20.9784
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3pE+F840P246O07u56D6Pp4LixGdcqN16vz2IfpPys188bZbcRc8yUE9PviPQ3DKI6aQC3tsPJp6Hj+drqXunAelVEjXzoCkajd0EeApYDA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6106
X-OriginatorOrg: intel.com

On 5/20/2026 11:55 AM, Alexander Stein wrote:
> Hi,

...

> This showed up in linux-next and causes a regression on my imx8mp-based
> platform (imx8mp-tqma8mpql-mba8mpxl.dts).
> 
> On 7.1.0-rc3-00101-g56ba969925ac eveythings works as expected and sound
> cards are registered.
> 
> On 7.1.0-rc3-00102-g42d99857d6f0 I'm getting these messages/errors:
> 
> fsl-asoc-card sound: ASoC: CPU DAI (null) not registered
> tlv320aic32x4 1-0018: ASoC error (-22): at snd_soc_dai_set_sysclk() on tlv320aic32x4-hifi
> fsl-asoc-card sound: failed to set sysclk in fsl_asoc_card_late_probe
> fsl-asoc-card sound: ASoC error (-22): at snd_soc_card_late_probe() on tqm-tlv320aic32
> 
> The clock tree looks like this:
> audio_pll1_ref_sel               0       0        0        24000000
>     audio_pll1                    0       0        0        393216000
>        audio_pll1_bypass          0       0        0        393216000
>           audio_pll1_out          0       0        0        393216000
>              sai3                 0       0        0        12288000
>                 sai3_mclk1_sel    0       0        0        12288000
>                    sai3_mclk1_cg  0       0        0        12288000
>                       pll         0       0        0        49152000
>                          codec_clkin 0       0        0        49152000
>                             nadc  0       0        0        49152000
>                                madc 0       0        0        49152000
>                             ndac  0       0        0        49152000
>                                mdac 0       0        0        49152000
>                                   bdiv 0       0        0        49152000
> 
> Adding some debug output the offending call is
> tlv320aic32x4 1-0018: set sai3_mclk1_cg to freq: 24000000
> 
> Apparently this was not happening before.
Hello Alexander,

Sorry to hear about the problem. To really see what's going on it would 
be good to attach the entire dmesg with:

options snd_soc_core dyndbg==pmf

Now, listing the clocks won't help here unfortunately. The patch works 
on the component-level, clock details do not interest it. Also, could 
you specify the scenario? Is just a simple platform boot causing the 
problem -or- do you perform some specific test steps to reproduce?

Kind regards,
Czarek
