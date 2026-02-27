Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1298C42EED1
	for <linux-sound@vger.kernel.org>; Fri, 27 Feb 2026 15:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772204599; cv=fail; b=cqui7K/oOhVw6Woiav/qN3KdolqCtMExJ9uhbWPKnLXOkSxSEOpN5n7Nsq5bWMYEMl45FdE0AtAdKU2bowCcJt2QYsC04Rp4PV0V9xOSv7FH/2BaFIpHuYWOb9CBzTe1bzKCG+u78/14xpZZbIe87RLPf9+kBeEqAlsRJmUYge0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772204599; c=relaxed/simple;
	bh=EAClBgSW00JYKcKBGKvMofCho7qzU4n2SNPDECw2msc=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=aeqw+/a3Zgu8G5K0mALtsjmMvwyYWrpWWFN5XLTpplQMqNnewMM8mSCRDGxA3ima1cS3R8fHbFrhFay9n4jOXDXrkrIpxI2QAbkab4N2uyLN5FFMiy40HQq2sS87fs5InGTD5XUImtLKhCMIJ0taosd90IZdiTW/iX1bToYtSmg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C2na0Vv5; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C2na0Vv5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772204596; x=1803740596;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=EAClBgSW00JYKcKBGKvMofCho7qzU4n2SNPDECw2msc=;
  b=C2na0Vv54Bd9hZ7VjnhDPIw9pqJnAPz/e925LZWqGddzylnnh+Rexo4P
   AYkzIK0lWeF7AUchifkAlpOMj7NmY+8CYhDUxHA1xJgYcDZ+dnuE3EK+G
   Y3vsa5b102B1LG4Rt8W/z6rrFzDZE4mlSFwHUiOEzU99WCVTI7JiVF8aq
   Mu8V9jn8rgfXLcT9YaaDow8Ixe43XXyv4CaUeLmxkWp4OyFCsrA+jdUb6
   VHtp0GX7huJ3yBlbWZNRagLGbGWZ545K28zzWk0eLhcDvQtES4/oG4VHx
   sK9pINB6hQQzn4VABubP83xNaac3sQ5ZyLmshZ9ly2wkMuSXiuc4Oy3WG
   A==;
X-CSE-ConnectionGUID: 9F9LseEDQKSSmcZ3Aw5MVg==
X-CSE-MsgGUID: Ii4oKf4lTSiu1cXjy9TuWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="90862293"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; 
   d="scan'208";a="90862293"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 07:03:15 -0800
X-CSE-ConnectionGUID: MhtBOSmgTm+7tVdjkiwMxw==
X-CSE-MsgGUID: IjMqqWdOQgS7yOo4Kh/1wQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; 
   d="scan'208";a="216043853"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 07:03:15 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Feb 2026 07:03:14 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 27 Feb 2026 07:03:14 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.17) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Feb 2026 07:03:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SNphq3RQ34iH/1y6ymYadGHydSrqZu+UKBUuswtKov2R2za7utAmn/3Wv4WsmUU0Cep/qjbuipEYIirxJRAWNOUXf/qMrsuwgFo+nToOnInY5WTEs9s1kiAOAHBp0EmnSLL/Jl8JxtXxuDMaDmvVmCLKusRH9zfTDhwUTqKIZK015SieiTbSP26jcM/hebYVt7Rz7CFRwXkzzeVK3GlQRkzRHuVT3HVh97Fjo4rySD224295cB+VXi1x80Mhu5aEzAj6FALuJ5At2cwg/uswBTJvxtreGaPnPZUHmR1XP1L9MLQUckfHVc8kRyKmH4H9RBMnDwv641XQ42db8ekwaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1FPFLAvfnvKsnADKRcxQSLS7ZYpGj9F2x+NcZ+hHbkQ=;
 b=Wt6A2Z5zWs/ODvKPV9vBLfAYHMs+eYYladRlqgAuFlNHhHWoDTZkDWJ4yWmHt5Y1LDmc382pxxlDTeqNbu4obde+ZS5Gac1MGT0KrbvZToTQt+U8d8GishfmrAi1+PZaVOuTlz22cgil4jZf9iuPfidUO9gl38+BRmn9p+dDlz96A+0V+IZaY9VOHA1wOX6vJvy4EbN87jfG9fCFQR25jKwNN7HatXC3i4H0miExz83kRQv7OYdJcRH/XXFoSxw3cGuldVu2blMwoFOVlA1M+T59YpOv0zes+YcVeWs0KX5cInJ3WiurX1bKaqE1SlSKctGvdcb2gaQfgrIDkgT4XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8283.namprd11.prod.outlook.com (2603:10b6:806:26c::16)
 by SA0PR11MB4751.namprd11.prod.outlook.com (2603:10b6:806:73::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Fri, 27 Feb
 2026 15:03:10 +0000
Received: from SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::d18f:6b38:584a:214]) by SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::d18f:6b38:584a:214%6]) with mapi id 15.20.9654.014; Fri, 27 Feb 2026
 15:03:10 +0000
Message-ID: <0dadcf51-12e5-4bd2-82d4-4a815d7c2d83@intel.com>
Date: Fri, 27 Feb 2026 16:03:05 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: Question about Card rebinding
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
CC: <linux-sound@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
	=?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
	<amadeuszx.slawinski@linux.intel.com>, =?UTF-8?B?QW1hZGV1c3ogU8WCYXdpxYRz?=
 =?UTF-8?Q?ki?= <amade@asmblr.net>
References: <877bryznly.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <877bryznly.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0042.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::14) To SN7PR11MB8283.namprd11.prod.outlook.com
 (2603:10b6:806:26c::16)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8283:EE_|SA0PR11MB4751:EE_
X-MS-Office365-Filtering-Correlation-Id: c369628c-0c42-4210-65cd-08de7611523b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 9WY+DHSBLwjf82eHpy0JAveckvgimzStHvU+fAso1QBK3Zb3VMil7xmko9IspqyVOkOIS/OvwlbVZKZZHpjFX+ra2HaUz7Zt1ZkO06+3FpcQ1DwfW3RzFaH8ThiaEDQelpnRhdbc+obnBHHcrqOjSDFuXACMpVowsa3Um1lRHqe8d/WOHW8LkZBq4YvYfMjR5Tw0qh2hYPhgE0ADxhFyPZl+j3LOWVNFHfBDcGsne87z9KW6bTCYw+1mscwQf1oyukdA4fNMd0+CgITugFAD/CP2gRitQ2xHYa2YUfFnZPQOQ70p0GDkQH+HyThyuvPd5o2DBCCWvq96vPqaV7/Anl5SK2WLRs7/oykaDlVRNxrxe/NYNYZ+ytGN0s7UE7ATpehLSzSRCeUXdr653mloMPdO8KwLJkZbIZOw7qpf0SmHtJnm42/8kb7rdnMp1FI/K2L+BavZFLD+klhs4mBXKCV3h0V8tDDWlkROb2UFDtPlggGRzfKBbwYCLJ7kYt3lVlKxa2sryrLrukzNBY6Ydd6wfzxC8Qb3a9rVZcrX/zVrQO6Sbn+r4cRALZc1zfmDtx9ic/NaMQJ3tuNYMPB2hspLJ3rVKfTfUGAVNnnghmyze24rPtvpTrbxzmi1fuQF+42Z9jdlCZtjDwrHYI4D3UfGvd6X6OGPgGMzohOO1BUXM+kMLBVClEGhN7w+BPqEcF7XKqLvIpqobDSlLONvwuA332swGd2gSXZe9mqmepw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB8283.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y1hiYS9PZ3ZkQUpmNWQybXRMY0U0ZUNXMjd4V29scnpUNE5EQURib0phKzVp?=
 =?utf-8?B?bFU5ZTh4K21JdkJCRU9ISU5SRFJ2UWIyaEtPZldSaVVYZWtUNDBYeExGczRy?=
 =?utf-8?B?aU1FRTEyM1hhVUo2eHdMUGt2QThBSksvMzZvZ0M1VU4rSGplREpVTkVrMlQ4?=
 =?utf-8?B?RHdRbTU2bDhCNjhqZ2xMZ2FSSDNWMDlvNXhUdHFYSGpyS20xNDFZL0FGUFFy?=
 =?utf-8?B?RnZQRk9xb2RTelB5bEU5UUJqcThpUEQ3ZkV1ZStMUU1xbnl4NXFJcnl3N3o3?=
 =?utf-8?B?eW9XaDVtNm5oK0hqK2N2bXE0bGRJT0dvem81K1hoWVV6S2cyR2J3ZFZvYnA5?=
 =?utf-8?B?TU1FbGdkdjV2UnYyakRjTTh2d2R5UDVNZHAwSHF0eVFsUG1iRkVraGxUK2ZJ?=
 =?utf-8?B?dzBRZ3NUazBTclc5MnNmcSsvc0RKYVB4a01wTUEwb0JEaE1RcG5ubEdRZTlv?=
 =?utf-8?B?blpSUkxGa3RmcXY0M1BFVDZkNFVTcS9UMld5Ukw3Z2o2WGpKSnZRTG5ZRC8w?=
 =?utf-8?B?UDkrNTk0aFhZMkRUU3U3RllkV1pGNGRLZVhZSytkRWJkeW8vaG85K2piMm4y?=
 =?utf-8?B?YkJXYlYrenZTU0lLenFPYU1qVzdyWTJBTkZHb1d6WU43aThKSjA5R1orQ2tv?=
 =?utf-8?B?OVhkRk9uK1pxMmMySHJHamgzTFA0VGxNenN0NE9tZE1LTmtwbmN6SnI1a2NV?=
 =?utf-8?B?WXRQRytMUFk5STFSWC9FRVVJTG5sM2FZQ1N5S2FJdCszQmFIbGVnQUpFLzVP?=
 =?utf-8?B?V2hNVlBpenVJZFJibDYxN0x3SU52SXNqL2lxTkJqUzNMZFNWd2JLaXc0ZjNn?=
 =?utf-8?B?LzQwTmMvTlg2eDBMbXdIV2N3SW5hYnk0bVF4cmR6R0g3N0xWUkxWTkxhOER2?=
 =?utf-8?B?V0c0aXRyMGd6V29Wa0VDOEsvemRkMnpuZnRpMzVMNkRrU1llNGhVbnZ6QXRH?=
 =?utf-8?B?bmV6MVNLQk9WYjJ2K2ppQkxRMWxGVzh2VkFENVQycGFSZkJLbGpDMlZrMEk0?=
 =?utf-8?B?R2NNeDhqeVUwRXptMXZ2VWlTL0hwMGdIWW9tU2xEQVhlTjdDRHV3azZMcWNR?=
 =?utf-8?B?NElUb2xIWjhNRzB5QU5QNkEvUWc0Z2psUDR3eS9DTmNKRTNZR0Juai9XdEdM?=
 =?utf-8?B?Ym9RVjBVNUEvdjN5VjAxaTloWXZMNkM4SmpHRDllOG1HTU5VRE9IVktwNGtk?=
 =?utf-8?B?NGF6a24rSkNDVXFMbytSdGw0TGk3UklOSVpSMmdybFlDVUFUd25ubHNWWmFX?=
 =?utf-8?B?YU40L0hFTnBjb0dqQnYrZXpUVnJobEhpOFg5TE1nZUxtSm44Qlh4STdZczJM?=
 =?utf-8?B?WWQyNEdBTHNIQjZDQnRCYkJDSHVVZlIvSFdiOTBObll4R2tQY1BBSkRaV3FW?=
 =?utf-8?B?eDlOQlQ0eTZUMUY2UmdoWnZleWxvYURER2wxeXdLV3JvV3dtOW1JSEFHdW9a?=
 =?utf-8?B?NmV4SVJUbndIYWw0QVFsYUdaMWl5NEtiRlE5MHRUUkN1TGRkY0c4VWRYQ3Nn?=
 =?utf-8?B?ZVlITjRpbCtVdi9nZVFoV2svRXhGQkw3TmZsTmFDb0FKdG9FOExTQW40dG9X?=
 =?utf-8?B?VlFiRGgvVlYwaTJuNDJTWHB5M1F1R1BCbGpaVmYrM3o2R2d6b2JkSFVBeGw2?=
 =?utf-8?B?S3lrcm5sc2lkR3FxSVQrSXBHUHpCeSt4bEpkYVp5VUZsWkFoVEc1cy8ybmli?=
 =?utf-8?B?Qms0RlBpOWxCcGM0MUFzN245VFQ0bjExbDlHWHBteWhXcTdYZ2V6UTRYdjlM?=
 =?utf-8?B?Qm9oOUhGTFE0VER1YnM2Y0ZsN1NHb1BKR2RxUGJ5clBUYXZxL0tJR2xDbFhU?=
 =?utf-8?B?YWVHR0UvbFFJTW9leEFORmI2U2NJSGpDUFUzU2FYNnMyL1JtS09TTTBrR29o?=
 =?utf-8?B?TUQrZkc2S3hXWGEybXFZaitsMlByd05DVTVUamEyWEN2VUJ6MkFTVmxPMThv?=
 =?utf-8?B?TGIyNENkRk9lMGpsK096Z1JWRTdlMmpjM0x1VDRRYW5FZ1BtN2M3RGVQUHpY?=
 =?utf-8?B?WTJwVzJyVnV1SGd3OVpnSERRTHV3azBKWCtXMFJVYkxkczdzR25xSFZhL0NW?=
 =?utf-8?B?Ky9aVTV3UFFFSHdKWjFSTStWMjVnSkE3MXdXcGVsK08zNVFoTzYyZWtobjUr?=
 =?utf-8?B?ZHZkY1gzdFpMNTJjbFMrYnRyMzVHa1dKdk8wTTVVWElKTXJ1T2w4dmFra3VY?=
 =?utf-8?B?VTRneDUwSnpVWUJRQndMd2ZWME9qb0RqRnNqRjRpb3hrUWxkcUV2TGdsYXM4?=
 =?utf-8?B?TFJlc29udkYvZmxIbC9PYnkydzFGRm44U21xVlNSaHkxaGtjS09vMGpzbjZC?=
 =?utf-8?B?eTYyc0lJNXUwdHFiWXdMSkJGWC9VOWhSOVkzbnNOeCszWXg5cnNnclU0UUkv?=
 =?utf-8?Q?ymkW4+1krxS59V+A=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c369628c-0c42-4210-65cd-08de7611523b
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8283.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 15:03:10.3575
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HMvRSiJrIZGF8b0R8Ju+OWAiaT1LMVPAqEjwP4X+5oiXK2evoAtI7I/r6gjeT8qNlMaCi5SCVwBvtHU1Y+pvlFlk5K0ueumqe7dMhS+QGVs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4751
X-OriginatorOrg: intel.com

On 2026-02-27 7:50 AM, Kuninori Morimoto wrote:
> 
> Hi Cezary, Amadeusz
> Cc Mark
> 
> I'm now trying to clean-up soc-core.c and noticed that this commit.
> 
> 	a3375522bb5e28285cb1845ad5601bf4a581da04
> 	("ASoC: core: Complete support for card rebinding")
> 
> I think it enhanced card rebind functionality.
> 
> But the code looks very unbalance for me. For example, in general,
> we have paired functions, like bind/unbind, lock/unlock, etc, etc,
> but devm_snd_soc_register_deferrable_card() isn't.
> For example it added new devm_snd_soc_bind_card() inside, but it calls
> *unregister* instead of *unbind*, eventhough it is *bind* function,
> etc, etc...
> 
> I think the behavior is correct, but unbalanced code makes people confuse
> and makes code cleanup difficult. So I would like to cleanup it to balanced
> functions.
> 
> Then, I would like to ask something about it.
> I think this feature itself is very nice, but need to use new
> devm_snd_soc_register_deferrable_card(), and the user is only Intel today.
> 
> I guess all snd_soc_register_card() user can use this feature.
> But does it have some kind of limitation or concerns ?

Good question. First, short paragraph regarding the feature:

The deferrable binding helps in situations when a sound module, that is 
part of a modular-sound-system (think of multiple interfaces, be it HDA, 
SoundWire, I2S or other, working simultaneously, each exposing their own 
endpoints but utilizing same AudioDSP) becomes for whatever reason 
temporarily unavailable. Plug/unplug, hardware or firmware problem may 
cause codec or certain interface unresponsive. We do not want to impact 
other parts of the sound system. At the same time, if the module becomes 
available again (e.g.: plug in), related sound card shall be allowed to 
enumerate anew.

Before the patch, the rebind-capability was limited, I'd argue it wasn't 
"rebind" at all.

--

Now, the "unbind" function is all that is needed to actually 
"unregister" a sound card that supports deferrable binding. There is no 
reason for code duplication and the possible renaming of the involved 
function was not in the scope of the patch.

In regard to your last point - yes, in theory all ASoC users could 
switch to the deferrable binding approach. The entire ASoC enumeration 
is based on so-called components, and the core tracks them. The list of 
those is dynamic, they come (register) and go (unregister). The dynamism 
alone implies the need to support the deferred binding.

However, in practice that requires testing - my confidence is high in 
its usage by the Intel drivers because the feature is tested on a wide 
range of Intel configurations. Without the coverage, my confidence would 
definitely be limited.

To say more, I'd have to see what you're actually planning :)


Kind regards,
Czarek
