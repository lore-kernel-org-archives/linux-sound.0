Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42DD93F1654;
	Mon, 29 Jun 2026 08:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782721764; cv=fail; b=exePUJAUaQeno11KBpagmwzC8c4+Pj7+EGfExXf2/j/89gz7Q6MW5TtZduic5oFW7cKPZTSGBxo7L5H01NtffDfc6gavET+MBiyYRg/ajLZOqZD0oU0Kq++nkJ7R1Lg3JxyVJ0FLVVey3qTpcPmcA6rwSPiOi3vWhTGtX25QtJg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782721764; c=relaxed/simple;
	bh=xZlqRzwr5eDX3jFOSn7fNfZq/hXVxAgWcj2SiVWxvdY=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=NXMI5expEfy6LNiepdjQhHk+oX2zCG5pqYAdE9IO40AoFVoPY8zLCkc1nCR9gqUHPZenIwdR7rBGvw+Fu/S1iTzZMLDK/5tEcnThbBO4Ck3QzWBxFucFbXm+1C4ALqbIYKDNVJDJSm3DAVc0A3eawgsu3zzRcgmp9ome17BAnsg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JHKF5Uwe; arc=fail smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JHKF5Uwe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782721763; x=1814257763;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=xZlqRzwr5eDX3jFOSn7fNfZq/hXVxAgWcj2SiVWxvdY=;
  b=JHKF5UweH4VGfMCvrBBy9A0KH70EzlEewj9AL5RqzXV7hp4Vgvdc46tl
   5+Tctm9/UwOOXyPSx2z7qyu0pXt2C9nCb7HZ5v14hnUxYO84S5gDxAmN1
   5ri8W0sjrfJeGnOhTzPh0rwaduX3kb98yZ+w3bh13n1Coc9hDV4f5NKBS
   MVkrtmI9PEMrmjC70gRpOqKLFUmxyv309JWL9WDP5+MFFZF+nDYM8tYRV
   yTYNUIAMKwHmC43OyoUvPy8NTjeEHosUnCEU+CzJ1fbfdt7+ky1wrjlaM
   jWpGSVP/a8nVIX3DX0kem/L+6E6FKOI40HilIrhzsJRtK+Qhs88JJ4QrU
   Q==;
X-CSE-ConnectionGUID: /2x9VbhKSt2N49CzYRQP/Q==
X-CSE-MsgGUID: X6j746N4TfaTw21iXYkrFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11831"; a="93985693"
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; 
   d="scan'208";a="93985693"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 01:29:14 -0700
X-CSE-ConnectionGUID: NvmqlDDUR12VyY8E9yljXQ==
X-CSE-MsgGUID: dz9VTzlXRTWUCJFQEYZyMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; 
   d="scan'208";a="290016960"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 01:29:14 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 29 Jun 2026 01:29:13 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 29 Jun 2026 01:29:13 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.65) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 29 Jun 2026 01:29:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L/MVQw/xPVhg7fyz/4cXu+lxVz6kKS0CXWHToV2pXi/MYCA1Ytr+VVudP1BvW6vl9jaiAPZs9L0AjzFmPPvBPcAfDsUphdwgtwQmxLB+eumdk8Wn0DU78KfCxOo+I8VBY8lb0Ruty0qaqw3dtD5wRtxY1QRmYHuqLpFpORhRdYiYZVJnLe0ETDZxTv012w75AQBJW299YXUWjbNMYKEBEebj308EgxD7YmvzFZCgFX6qlI1vU5AtM/jSVtmjuRNjKcjKr24ndju7HO1mpLq15WiTNZ9noCJnsvOW7F34PdyREdRGvSuzO6YpMJq+IJM6rZ0z3ymBxE3/7trZ9r0lpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d2nrjVULtx7gEyjCsnZWaJLF026JhtdC+K6yU1W1WOA=;
 b=sW8ltEVdi3yl9L8O/4418ur+KHmXYOjakIZ5lpAK4rrNeG/ZEmPt6SBzzhHR0qQmkze6QG7brfIAA1ME7U+OqCNgdp8XMxn3TYg5ln+S3TY4eYuDpMCKBH/8QuBgm53v1s7dnmJcm+HFt49qaeczqD3IVxItc/qdUOceq4B7fWjxAjHg8mtXeYcLgIhQ8TlJOTtNtuYngrm+Z2jNWstx6P+ceqLlIx3YDxhFZOPBD2SuyNoQ0pi+CiEaxAzZ9yIUVPUq4QaemiURxuPOr2A77lTWS3k4cJusipEXMy8uQR2qdS5/gvIV2Eluc8sxYP/sEhAEzfVmxDHBHDCwwQdWvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6967.namprd11.prod.outlook.com (2603:10b6:806:2bb::15)
 by SJ1PR11MB6202.namprd11.prod.outlook.com (2603:10b6:a03:45b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 08:29:11 +0000
Received: from SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4]) by SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4%3]) with mapi id 15.21.0159.018; Mon, 29 Jun 2026
 08:29:10 +0000
Message-ID: <0b095ccb-5208-4813-959d-e82480bda50d@intel.com>
Date: Mon, 29 Jun 2026 10:29:04 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] ASoC: Intel: Convert locking to
 guard()/scoped_guard()
To: <phucduc.bui@gmail.com>
CC: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Peter
 Ujfalusi" <peter.ujfalusi@linux.intel.com>, Bard Liao
	<yung-chuan.liao@linux.intel.com>, Kai Vehmanen
	<kai.vehmanen@linux.intel.com>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.dev>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>, "Liam
 Girdwood" <liam.r.girdwood@linux.intel.com>
References: <20260626082904.32344-1-phucduc.bui@gmail.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20260626082904.32344-1-phucduc.bui@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VE1PR03CA0010.eurprd03.prod.outlook.com
 (2603:10a6:802:a0::22) To SA1PR11MB6967.namprd11.prod.outlook.com
 (2603:10b6:806:2bb::15)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6967:EE_|SJ1PR11MB6202:EE_
X-MS-Office365-Filtering-Correlation-Id: 81899274-9c7e-4d3f-6f1d-08ded5b87e80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|23010399003|366016|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: yALaWLYFEf4NK0U97XhBZpU6beVJhtCK202TkzQkCdPdeULaJlHYB3DO3Zy5Snd+KfnwjSJd0Lxhy4E2bEHWS7iIwuxEBL2GyacVnArRYl0zqoU0i94k0QEOD3xVwPXOxxYlPZm2ItWdry4+WiKbyKjLSnQuTBFeym3V5YxcbP1o+XQyZxVfGs/iJZM1AW501ZPp5IKdGaAVvIOGkXzEQK3fjqbCFzE3sorgwxyLYbxFlcD4BhOecGV0JxchWDuBoNv6U/US7S9SGgRE9xG+8UDigOIEcWqUXeqpkiNu7i1HXNsehJ7bEBNgZAoOv85ftSGG/EDIoSw6G25gYGMr6RAdaVQEiBoxg68hvDQg6dHkFmZKzEM0AaLcF7oZB/fwcazg9ATDwqE2b/RGaP3M+s2+095X8GRc+RkxPmH73InqkBuzFihqo/4+s/YTb4RBfaZrEqtw1SK10XPtuFGS1LM/vfw/YgIlH2S6XNFB2FVKbR/0T/iy8qzJyNvlCdiyKzit3aLAvPq5+xKRVIO4Tl8XH5FnHg/ORkb4QleXSQc2LHbNwbdZkrBzv8G40NTulxXmks3J1SBcoaDHgE/i8fO8aG2KUddPMky0h9oFpD3Js/gQMUtcm46hE8VktJb4EG7FV2H/DFh34F0tdsbvnl3vJFtuPPbs5WIuu9QBbHk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB6967.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(23010399003)(366016)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZzhDdlUzUnhvdGlRcmJDZERHS3p4Nm11czduWnJxeFRISHdvRHdWcG5tNjFY?=
 =?utf-8?B?MlBLSnpyZG9wWjdpaWRnYWV3UFc4MitKMGVCVm81QzgzR2U0L0JYc0s1bVVu?=
 =?utf-8?B?OS9WUW9qdUpKOUQyb1pCd3RtN2ZxN3VMNjVkdXJ5RTVjVWNtMDdFd0dUcHdF?=
 =?utf-8?B?TUJRUU44Mm9Nb1poSmlHNlo1OHUwbzBXQkdsdGlVdnQ0QjFLNnlybDRvdTdq?=
 =?utf-8?B?Ty84dU96NlF4VnRMMWZMV1RyUnZJbGducElvcG5TaXg0OFNqRFFBcytoS3Y2?=
 =?utf-8?B?S05SUjJwTFdYT2tWQU9iMnN5L0lGSTlwSGdtMkt3aE1QK0M3WjBSSlpFaVFI?=
 =?utf-8?B?VElVRnQrQ1IrT3E2MnpWdlNEbUNRUTh2aktpYk1ZaVJXQXh1blcwcyt1d0RX?=
 =?utf-8?B?c3VRRE5va3RUMWJ0dWtQTUNFWndrS3YyMHdYNHY5OFFSK0hXeWx4U0ZoR0Jy?=
 =?utf-8?B?UmN3Qm9rYWdndXJyZ1gxclRJWmh3S3dSUmtlb2ZVckRXamtPbStlWFdTK1Ry?=
 =?utf-8?B?UHNZS0RBRVVmSSsrS2dRVkVtZ0Vpb0dnT1h0MDB4eEh2d1ZjWS82TXFRSnZM?=
 =?utf-8?B?aGo4YmNHY0h3T2g2UFBUQlB5dFNrbXRDc2xrM0RTYnF2WmNGSkFONGtjSzVT?=
 =?utf-8?B?Yy9pakNNL1JTMEQ4U25jN0JoWnBUNmZzeUJzMkg2MjNQOWRrcHNoeVBCZnhy?=
 =?utf-8?B?Ymx5NUQvNDIzQnlUMzlSRFhBTm5FZHFrMUo1RktheEkxOTljR0hDVFMwbzdj?=
 =?utf-8?B?TGdBT0l2NFBzNUI1QW1CbGUrV1RPMEc5T3BwWDUzdXRZdTNnSWd2SnNZbzVa?=
 =?utf-8?B?MkRJMkVQbGMwMzVET1RwN3phN3ZYeGh4R2l0anRuK24xZ3RtNjNnUDlCeDlr?=
 =?utf-8?B?RVk0QjJGeFV1eGNDY2pxZENVOXJMK3duemMyRDNxdnB6OG94ODFadlQ1cTVk?=
 =?utf-8?B?Lzhlbmp6UWdxMVlhcWFHbXc0eHJ6NDR3SVJyZmx6RW1jU0pueXhTYWloYnV5?=
 =?utf-8?B?M2dwaDVQRGJUYlNGYW16UXR4dm1Bem5UZXpuVjFJdmVNVTloMS9JZzBRMVl6?=
 =?utf-8?B?cmh2WkRYRkdyL2kyVnhOMENxbVVJWS90ZktSWThZcmdQMC8yOUpZU3F1b3Nq?=
 =?utf-8?B?N2ZBSzBySEk2Q3hIWlZPcmUvN3R3Wk9IalNrb2djMG1xT0hZMDZiWTBTVXRP?=
 =?utf-8?B?YTJuUTl2eEhXa0tVSk84V2ZIMVZGZW9mcXBpcFdXOTlFTkY0cTdncC9FaVdN?=
 =?utf-8?B?ZFZ6Z0t6ZDZmUFpqa0o1Wk5EMzkwd2UzQWwxQlAzcFgrbEllSEpaR3NIa1g4?=
 =?utf-8?B?cFZlSStsbWo0SXQxMGtqVVdzTTBBQTdLK1lPVFcyQWVrVzFrUFF3emE4Vmw2?=
 =?utf-8?B?a1ZDQjdJSERwUkVaanVKY2hEYVdKNU5odnFyV2VlOTBxVEZOaG53dlJjdGZq?=
 =?utf-8?B?SUJycmZGNWdHZi85UVU2RDJxZnV0a0ZhdURYQ3NUT04yYzVmOWFqVHliQk5E?=
 =?utf-8?B?ck9kWDNzaUQzRHF2YzFhNmZkS2k5cnppNi9CTThsMjJxRk5PU2RuUXJuK2Fx?=
 =?utf-8?B?aXJIenIxUlBZdFh2RkY5REVIRkJoQTlobVNlQU9pb0NWdGlhZ00xZzMvVmlu?=
 =?utf-8?B?dUNJb1NkOTE1SWF4RGJXUmxCVDRjOTVRNlRFNjFUYm05SnRJZU1Rei9Kd2Rq?=
 =?utf-8?B?UnA4Z1pQQlBYdERON0lFaGFSV1BMb2NUVGZWNDc2d1FwS3IzODd5UE15YWZn?=
 =?utf-8?B?SXB4bldHclFnQ0VHTVd6cVJYY1BwZStGdlI1Qno0TFlOemJwMVRFcjJEYnRH?=
 =?utf-8?B?UzlvY3NmN01YU1hEN0o4SGljbXBsdmg2cndhdVkzNDUrVEt3dzNrYVprQkwz?=
 =?utf-8?B?clNHa1lsd2ZlS2RRdEpjMUFrcXRIUGkrM29mLzErY1ZudFNXOEx1NTJidktt?=
 =?utf-8?B?cXRjaTAycjJpaWQyQXNtOXFWYnlseVFvZlpOb24rTEt5TU54UFpkcmtCQlMx?=
 =?utf-8?B?U1FzV1dPSkhKQXpuOE9EV0xjNzZOVWJoYklWU211c05GQnZDM1I0NGlDN3pO?=
 =?utf-8?B?dHB2WU9uQjhtZUFhNXgvWFFUTkJET0tVeHNrclB3ZFUvWGsvSlB0aFd2bzRw?=
 =?utf-8?B?VE5ONVZQLzZXUFFOQXNsY2VpV0NWOUhPZmJpVjRZVFp6cFdaSDEyazFBNmNO?=
 =?utf-8?B?TWJQUHBTalgvSFYyZzY5MjFtKzBsZzI5cnhQTEU4WlZaa1RjT2Z6R1k1U2t6?=
 =?utf-8?B?ckFXMDRnd3NLQjQ1Q2tXbkJNUlowelRWS3NUWERmRlZCN3ZLMVNXRkhkdFZX?=
 =?utf-8?B?alFkWFBVZTBOZlNRcVRRdGdmUGR4VUFubG9ST3dHVVRRa044Yy93c0tZMzA0?=
 =?utf-8?Q?RwRiQzAHESKMW5II=3D?=
X-Exchange-RoutingPolicyChecked: jsooGHd5UBDsSKhS9JVxcXNpPXlAO8tdTf6WQNeODkotrkyRoNFVEQQyPF1vYo3uF6Dgghz+QtihWOeT/V4ALrNXzUEVs3ZYOIommWuS8tKDkkK5eqn4jY4WUu4ebhgonvB/c+oyJnkRAoGkQU8ZjlzyR5vKNbom9Gh/GvP9C7zDvTztrS4J4kc4MoJCw/gMIjmnjxAmaBwwtn5wV6o/EdgdGVwtNELnLtAUEAb3x22KOBEwoWz5URf2sgFXuwQzT9RpdjfXc7bh66gTasi0COKmyvfeYtkpSjRw+tOUObXJq2xTLKk4vb74ZezCT9KjlS4+wh577GhcmEFCaLZkDA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 81899274-9c7e-4d3f-6f1d-08ded5b87e80
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6967.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 08:29:10.8430
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gSmSxLPXYBSG4gEaMsnzPY3cqjZmEo/GxsfgwoR0twW6qglN5gvAmgx2jOiH6DZyA2lBGgXqDQez9NzzG1ht3hX1Xqvy4xwQQ4KnHaFsNeA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6202
X-OriginatorOrg: intel.com

On 6/26/2026 10:28 AM, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Hi all,
> 
> This series converts mutex and spinlock handling in Intel ASoC drivers
> to use guard()/scoped_guard() helpers.
> 
> Most changes are straightforward conversions intended to simplify lock
> handling and cleanup paths, with no intended functional changes.
> 
> The series has been compile-tested only.
The patchset looks very good, for all:

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>

Can provide Tested-by: tag but not today - tomorrow, as my CI is in the 
middle of waking up after a routine maintenance.


Kind regards,
Czarek
