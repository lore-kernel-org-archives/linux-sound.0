Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE60D2571B8
	for <linux-sound@vger.kernel.org>; Wed, 24 Jun 2026 08:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782289545; cv=fail; b=j0ZT8bbJwWrryDjF8QZ7mkWvDu78bMSQberexGcUGhWtNd/I/A/xiuqCFY+MfmsLmz8t7mkTJ/dNorfTiZSbbNB0o9the/aDDTwnWihnDOMXR7jSCKfNXfvmc+feuSNuaPnQ+wKbpoUyhAssdKhBP2+gLIbPjIwqna6Tmri9jsM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782289545; c=relaxed/simple;
	bh=ZTMyINZI5HukSnquXe4nVyB2cLQawyfHXQgSWV6g5Ws=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ZamyMhLtvSvaEo7sPKcOzlFszvIaVVwzu2n95XXtaeRvbNnPFbJlOG2/EsG3qIB8qq+CetXL5ONYTL3FUFd2+ecJ7AKTsxnyPtcnEzzbsNpJTYqHJTwI/fbLDKpdbsvKQbJXS/VDiFgKDNyy4ICbwR1sdcG50YleTjJDKRfl4rc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y4/bBH+C; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y4/bBH+C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782289544; x=1813825544;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ZTMyINZI5HukSnquXe4nVyB2cLQawyfHXQgSWV6g5Ws=;
  b=Y4/bBH+C5NTG002CO1ygCJrB9hGiUx7vzWID60ux0SrjueKASH6KQXQM
   CgL2rwGg1X43Md81pN7oCTz0ppCaRRteY08r6nMvlu55f5Iqrxmwt+dmz
   RbRMY0G/uAt2NID6UblgK+70WJfxMzX+ih4Lo3knXCZw7yIYwmCEhm8Hx
   Kk5U+h6cO5AclUz8zbnEj3pKgqWSpNfU8/8MUvPPzxBLbBg6pCnZPS05H
   sqh8AqJkx/Nmr1ID7FsJdv8ShDNS50tGdHv5Y0dvpLyZGz409bJYbL/MU
   ABFqribJ73thEt1wtI2qn6YkQxRGkqVgldbGUnoGrFZxzXBgdFFA9SoSV
   g==;
X-CSE-ConnectionGUID: lZ+tYZcuTqWX+VWPMzFHqQ==
X-CSE-MsgGUID: MtvPRdwtTEeeItyivqYROg==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="93698405"
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; 
   d="scan'208";a="93698405"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2026 01:25:43 -0700
X-CSE-ConnectionGUID: Cpf8eurMTDe7t683KJ3IIQ==
X-CSE-MsgGUID: vLnV4NFYR1GI7jJk9asZmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; 
   d="scan'208";a="254752500"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2026 01:25:43 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 24 Jun 2026 01:25:42 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 24 Jun 2026 01:25:42 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.26) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 24 Jun 2026 01:25:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EHKdKILWworNtbg2WOu81jHmYWHDMCkKvutyK1c+kqcioSEGD8CvUXJ5B2CCNKRJvQhlFvDEsCsSY6Qxh0MKhNtk6MzdGTqD9Fmg/sVc6GRb53IlyYp+SybOf6cWpo/emJf7O4Hv0fkX94Vg/pck2NzivoVbDj3RbBMaRAuP7jDehPinOKiopN/UQF32muLy8I1U22cbwwfNAUmY1IIeTw8TzeZdDQUEWmLatnlAjQIkGHnRMbLt4xoCpZzy5hF3CO6FywUDxnogTxkyko6EGnUdepT8NBcP7oFuEBre9JPm5uBEaToPnFfkotO8WTHsiOAT3T6FSSzqIBgyNiEW2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cum74IzYT8yk8TUChN5IaNTx6y0qYniIK1sEzj+Iohs=;
 b=DRSU4Z0NOqMCGx7TjZhrjv0sMRnfTmEwNzEBvMoN/9OGc/yDGW2Vn4y3HWno8J8Ao44ZwaLGohFyppJQlPEKQHYua2PyTx1pNZkYYJziwcvqkqyCAVQix+Xiic2C00BucJ1H7BJcd6NnJ+SeLwMFcSmhigPStU33q5K9tJeHM2IucFJNPSXiiMWaP0ildQ5t9ILA06coCdyXARcxsbFMbP8B6RNzP2QIxwDXYz4LDNfnL2HNzGNDgYB5s0motfS0S8Qi9jFVDqAg+dgxYtvzed3jwHjdZ7c8bJ3+Je2M+D4gIOSNbmefEVCv7N39SPz1PAE1dPSmoTYZRK7ulY9E0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6967.namprd11.prod.outlook.com (2603:10b6:806:2bb::15)
 by MN2PR11MB4709.namprd11.prod.outlook.com (2603:10b6:208:267::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.15; Wed, 24 Jun
 2026 08:25:38 +0000
Received: from SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4]) by SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4%3]) with mapi id 15.21.0159.013; Wed, 24 Jun 2026
 08:25:38 +0000
Message-ID: <41632f7a-054c-487c-a0bb-8b2e325728b7@intel.com>
Date: Wed, 24 Jun 2026 10:25:33 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: core: Move all users to deferrable card binding
To: <chancel.liu@oss.nxp.com>
CC: Chancel Liu <chancel.liu@nxp.com>, <amade@asmblr.net>,
	<broonie@kernel.org>, <kuninori.morimoto.gx@renesas.com>,
	<linux-sound@vger.kernel.org>, <perex@perex.cz>, <tiwai@suse.com>,
	<Mpuaudiosw@nxp.com>
References: <20260430140752.766130-1-cezary.rojewski@intel.com>
 <20260624080006.1105961-1-chancel.liu@oss.nxp.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20260624080006.1105961-1-chancel.liu@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VE1PR08CA0024.eurprd08.prod.outlook.com
 (2603:10a6:803:104::37) To SA1PR11MB6967.namprd11.prod.outlook.com
 (2603:10b6:806:2bb::15)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6967:EE_|MN2PR11MB4709:EE_
X-MS-Office365-Filtering-Correlation-Id: c6f2a503-b08f-4bfb-5f1f-08ded1ca2beb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|18002099003|3023799007|22082099003|4143699003|56012099006|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: Cvls15lmch5SwTKfvAq2+Lw/SHBxiomZofN3NjVEOW03SfVbEHPgwIoqOPFURONxYBe1QzEIxoidyHVSbfH7XoPbxXm62LNzAEtcbV+wVQ3UZE2O1vIDxJHkH8qY8JEsP3UbPBuOL86Wp7SLyYyanBc8INz3twrmPWNUqkK2fyYAPoUt8x77v1UbujVY+TXdgoj+iQbqMBkBEE/zj9He8XKEvNovUbNSW/8HSkXFegFUHXKwfjNAQV/AFYORtcjb7TLgbRdAkzQStAHbhwZtpunfR8Y3hR7K2guNLtevZL7AatQrErmlNiUMfPwcZCuXLXJ1aESzjKeHCFHSuDTLWFnnZexn3wYEi6uOyCYO1xhb3SEWlGP9O7eWVRRmyiutW6H8PoTrd3jAQo+Da3/OgaaKlprOdi0iE8krZvsLNcZoPHBhgCeI+2kTJUXvoWXuIosE1xhA19GrJaRWltyKZbke1IYQBLPLZfwoPo0Xut1qEi4pUJ2UzoZWWPSqlcu3U3giWcFMGY7+4s5CUxQOCqraXzYJZ00D6YdP7uwh8HDYsFc0216lgeomN+ovSHEUh3ImrEYSDY0KvoGUEqWxaMhIQnQ3QmzGGK/uFJ3h8qAXSywtiprnYPw7JDfQCNzf
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB6967.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(18002099003)(3023799007)(22082099003)(4143699003)(56012099006)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WlYzUnhCajI4a3dicitPNHhlNkhyZk9QZ0dmUmRSMDFXT25HY2lIN2tyMzha?=
 =?utf-8?B?RFo1UU83Vm1tWTQ0T1JxQkEzQlNSK3ltaWRyNUFLVHpvUzFmck01ZlZjQk1i?=
 =?utf-8?B?T2ZPZWtjQnBwLzlGOXk5VzFJcWdFNzlnL3ZRSSsyNFR1amxFL3pld0s0Smdv?=
 =?utf-8?B?TEp3UG1iZ0I0Sm5iRkpLVmM5Rm51TVk1QWJSb1B2M01IMTBwNkdObXBiclBu?=
 =?utf-8?B?TXQrRXpLQzFzOU9oWm1IOFBxcWdQdFFrcVI5MnZ4QXovYm5xdm1SKyt2VVJ0?=
 =?utf-8?B?M3JiTkZUcnpTVmJZVkhwWGxKS1Nuc0Zwb0JaeENYM2JYRW9KcTFNZmZSMlpv?=
 =?utf-8?B?VCt1SjcvSGtMQWVCZjZIMkJEcGg3SE4rS3NQSk80blNnTUhNUlZUdER6K3E3?=
 =?utf-8?B?OElGeFN0MkR2S25TaXRPUnJxQzFrbURUNkZUTjQ2UDZFNkNLOXNrTnJDVWZD?=
 =?utf-8?B?SjVKLzZuUmFrNmMwMVUxMFFpczNreVVDdWJ6NnBaUXNkeVNiKytiTy9tL0Vh?=
 =?utf-8?B?S01BT0FHV0ptL0RBL0x3SjhTSUdEZ1Z6RlkwamliNUdXMFhmTVlVRW0xTHp0?=
 =?utf-8?B?WTZ2V3o4ZnJpZWJNbnVMMEhQUldBcktCREcxMHhna3pSOW5MMjE4YjlvRXll?=
 =?utf-8?B?UEdSYXIrVXZPYUtsTVpGUTlySVlkKzVpbnZDUkF3S2EybVV2OTFWNXZiMXN5?=
 =?utf-8?B?S2ZDWitKajhUSWRYaG1ZOFdoSG5RQ0c2SWJSbGNsQVVrajZWWUcvZ1MwZ0M4?=
 =?utf-8?B?QnpoamQ0b1ByemIxdFJoWkZyQzNHYmEvZUhEbkwzdFozOGlsdHVXbDRCRmlj?=
 =?utf-8?B?RUdvWjhBdVBKbERZZXVGQlNxVmJFeUJ2aDYxZ3pQaFczbVluWWRBSDYvd3M0?=
 =?utf-8?B?bUdHbGtyZUlsOTlxUXVSZHBDY0IvcW5obHBWbmphc0thTC9rK0ZMTVNHenVl?=
 =?utf-8?B?K2F5dW53dDArWjRYejMwbFltcTFPZTluNDl4Z3FyaStSeFE3UVA0bndoUXRR?=
 =?utf-8?B?dHNZbTlDNVhXQUZsMEhtKy9vcHhYT0puemRibzJuRFBuZlBvNm9teWZOSkw2?=
 =?utf-8?B?QzViU0sxdUpqdGtrN2JRQW9VQ2NSMHk3dEpxK1RLaFNFQVZTbVJPZ2VkbmxD?=
 =?utf-8?B?QW1hMU56bm9HeGxmQlExdU9ROWFlRmtKK1FDQklycVBqUE5jemtOWlR4bCth?=
 =?utf-8?B?S1Z3VStnd0tPY2JHNnpOcTVhTnRtazF3bmNQM1VTWmhoUERoblhpUkxVaE9O?=
 =?utf-8?B?cmNqQTZBcG1PK1RLSWtKQ3VGR1dmL3VreHdKOURjNURsYnlwK1NvemxSWHZJ?=
 =?utf-8?B?OCt6ZHdNeFUxdVR2Z1g2SkJTZDNFVGg2eWo2cVNqeXZKbGQxck9pTWtIeGVh?=
 =?utf-8?B?L2tYZ04vdkVBMjVDWDRKdmVXaUdJSE11THlzUkU3c0JYOUYxbVhVRzNXRGUv?=
 =?utf-8?B?VCtVZ2ltUzFwZll5YmFNb2NnLzVkTVQ4MlNDY2oxL2pSTzAvNUNXdUhhc2Np?=
 =?utf-8?B?Ykl1MzBwZWZwZmJMSUMyU3ZJeHVZanpGRlIrb2c1d05TMEpQMmNLOGN2cTFq?=
 =?utf-8?B?RmVkZHNMQ3RXZEkzM1VwR1N2dXBRNGlIUUoyeUxubVFaVGJTZXE5OWhSd1Z3?=
 =?utf-8?B?RHYyR0NIajFRZmsxei9lTUNjckdoWkxSdlM1QjFpRnA3Q0szMDBDV0dja1ZR?=
 =?utf-8?B?K3E4bTVLVmUzZk1KK2tIeDdZWmlMR09EcDNtU3lzTmVtVWJuK3loMVdVbVdK?=
 =?utf-8?B?S1hVeXM5TURKUjcvSW42V016dFZHQjBPbEJVRk45RHJZMUV6SDhRVTdBRkdV?=
 =?utf-8?B?aEVrOEhiVllBb0V4TkxsT2VVOU11ekxVZkxLck9iQjVJRWxLZFM5bWVHb21s?=
 =?utf-8?B?aVVZNmFNSFI4QlFVOUNvcW5NS1RRdjNjTWNtY1M5VmE4Sm4xNFprNlp3YTFS?=
 =?utf-8?B?Q2g1bmZvWjFuNk9iYks3RU9UYS9kK240WXRaSW9FMU5XZno3V0VPVnhMZWY2?=
 =?utf-8?B?RXBsc3BHVElLVEtRZEM0THRMVFpWeVozdWlUUnRRS3JZS1FyMkhCSHhJRWla?=
 =?utf-8?B?UlNVR0NOY1Q2aGliaWtIWENTSGU4bWhSd3lENUVURUVXYVBCUkhmZnhTaTg4?=
 =?utf-8?B?dWsrL0t0ampXU2l5aUNqeDdVTVVTZHhyMVVZNGVnVGtjTXB3dnEvRHJBR1o5?=
 =?utf-8?B?amQ4VnQvOVRDNlZiNGVFSXoxZDdpWUZrMnFaQjdvcGlUWGFONlpHNkE4WWJh?=
 =?utf-8?B?QWE2Y3RCNzUweE1nMlRxV1U5bGFkcC82aG1Wd3FhdW5EWHFhd0xXWkRGbkZL?=
 =?utf-8?B?ckZtbURYVWs5eENaVmFJZGZwYmg0NUlYYWhreDZvS21mVDkxL1J2eW1LQ0ZJ?=
 =?utf-8?Q?i5pfa3T7s0EUvXVQ=3D?=
X-Exchange-RoutingPolicyChecked: RULCOrYIPvLVd6+L1IEeHs+u2A1zEApZayZ1plia8woCQjjMBex12J0cGvubII4BxIfoKPgWpepD99tV0V2x9bgRODUkEKmodgR/2bm+3et5Wop3CMaeC9EafeYXWzBTnhGCfcVPcp8sdKsZsoM+nzDstthAbGo2MxFYkl30q6VHL3QfdwIKb2VfvpBPt4+kcSyKMSjtKvy5EqrwfrSPuGYuqshZf/HYq+1gY+9ZIBYk6HEbUHprlNRzs3iLSOPjlezBRgmyJSIF6PESdHCKUcG18hPQYX1zRA7GEPdNQu303YZGirtj0b4Otbc3LDvbW+56ShWvyPMJtYcIVG8Qow==
X-MS-Exchange-CrossTenant-Network-Message-Id: c6f2a503-b08f-4bfb-5f1f-08ded1ca2beb
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6967.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 08:25:38.5811
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M+4Jz8VStIfCBKGDg/EUiTKf0SW92rYLfBifja/knygezCL3bGd2fvHJl/iMr+GOzyNHygMvPu7kNzCsXJ17DSwIQYNJSum8nErCH+iwXTQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4709
X-OriginatorOrg: intel.com

On 6/24/2026 10:00 AM, chancel.liu@oss.nxp.com wrote:
> From: Chancel Liu <chancel.liu@nxp.com>
> 
> Hi,
> 
> We have found a regression on i.MX6UL/ULL after this change.
> On our i.MX6UL/ULL + WM8962 platform, starting playback can fail with:
> 
> [ 321.026334] Can't scale 63529412MHz input down to <=13.5MHz
> [ 321.035547] wm8962 1-001a: ASoC error (-22): at snd_soc_component_set_pll() on wm8962.1-001a
> [ 321.035664] wm8962 1-001a: ASoC error (-22): at snd_soc_dai_set_pll() on wm8962
> [ 321.035699] fsl-asoc-card sound-wm8962: failed to start FLL: -22
> [ 321.035719] HiFi: ASoC error (-22): at snd_soc_link_hw_params() on HiFi
> [ 321.035780] HiFi: ASoC error (-22): at __soc_pcm_hw_params() on HiFi
> 
> Before that change, if a required CPU DAI or codec component was not
> ready, devm_snd_soc_register_card() propagated -EPROBE_DEFER back to the
> machine driver. Therefore fsl_asoc_card_probe() would be retried after
> the missing components became available.

That's not true for many cards found in ASoC - see the initial commit 
e894efef9ac7 ("ASoC: core: add support to card rebind") and then the 
recent refactor [1].

[1]: 
https://patch.msgid.link/20250404101622.3673850-1-cezary.rojewski@intel.com
> With the new flow, the card is kept on the internal deferred binding list
> instead, and the machine driver's probe() is not called again when the
> card is later rebound. As a result, fsl_asoc_card_probe() may complete
> before the CPU DAI and codec components are fully bound.
> 
> This is a problem for fsl-asoc-card because it currently caches some
> component-dependent state during probe(), including the codec MCLK rate.
> On the affected platform, the codec MCLK is provided by the CPU DAI
> clock, whose final rate is configured through assigned-clocks in the CPU
> DAI node. If the machine driver probes before the CPU DAI driver has
> applied those clock settings, fsl-asoc-card can cache an incorrect MCLK
> rate. Later, hw_params() uses that stale value when configuring the
> WM8962 FLL, which leads to the error above.
> 
> We have prepared a fix that moves the component-dependent initialization
> in fsl-asoc-card from probe() to card late_probe(), so that it runs only
> after the related CPU DAI and codec components have been successfully
> bound.

Hi Liu,

Looks like you've corrected the dependency issue by yourself - these are 
precisely the kind of problems that this very patch reveals.  If you 
would like to discuss the solution earlier (including via voice chat) 
don't hesitate to ping me.

Kind regards,
Czarek
