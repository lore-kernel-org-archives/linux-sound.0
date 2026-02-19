Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E6034CFAE
	for <linux-sound@vger.kernel.org>; Thu, 19 Feb 2026 16:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771520119; cv=fail; b=pQC0gpiRH8Xw1nxJSVf32us5biOPD81myImpHyqYnsq2qbeK+tmSOlWk731iQMfwoyUl1pkmhQr1KDkCxKE0ERvQR0UVVFrOxpkhc/q7UWr0oCU+yrbPHsYeI07H8WfQDKqkxirQrmcRA8CdM5rHDQpEAjbAeFOrhDHdlYdSXEY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771520119; c=relaxed/simple;
	bh=cp2Heg/U+WzI0E6Mp3im6xP40pl+zPhrT/F7rjVJDS8=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=K5snj4Pc3Xhugb6ZnWqAbKhT2kxz4p/U3d3Z7F9cDJBbcwD/CvbD8RmiABFTRptaBGh2KtP9J4C35wuerdFJy1TrvtcG2qAH7HichD9KpmzrsJmS6AX4LuMcHlFiSMqfw4LrYCl9ZdcpMvscbhlBSAT5mAbVgVcrRAWcQnGFQPo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lv8awnhZ; arc=fail smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lv8awnhZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771520119; x=1803056119;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=cp2Heg/U+WzI0E6Mp3im6xP40pl+zPhrT/F7rjVJDS8=;
  b=lv8awnhZm/vkHqW6yzTPxAY25nYBkqCquTOqFcqoQ1fIvjvObkwiDfdH
   MxnxQ1jBfrdzyhgPPGOsScujnv7K3lmiM5t8TDltxYJIoSR2Thzt+nMsT
   sxNCX1H6JxFhLMwH2miBvLNRg0gER0g4gwrgVKOtlMUrmoqTPIWOGQevU
   vPLSJLToCnBaZJ8ED+PVvD+Ezzc9r4CBNjXZu4MRs6xfARoHDNd3HNb3v
   iwTIzZzBB97Cg8GyZmgNBx5Oakl8/DB+zNOdBGIJ+Gk1Og8qVfF4j4/wH
   IT3LrRiLXWijOIPZdXF2RTn0wD8ZaMTuu017pJNI9wWWZyW+QdS3rM5m/
   g==;
X-CSE-ConnectionGUID: b6SrbTnaQt2QjOnzJb5Xdg==
X-CSE-MsgGUID: q2/n/wqhSMqPctySu6lS5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="60186646"
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; 
   d="scan'208";a="60186646"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2026 08:55:18 -0800
X-CSE-ConnectionGUID: Iwtx3Gf0Suukp4C8uQCVLQ==
X-CSE-MsgGUID: 1x9LhoaET6OjSH83HLGUJA==
X-ExtLoop1: 1
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2026 08:55:17 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 19 Feb 2026 08:55:17 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 19 Feb 2026 08:55:17 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.16) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 19 Feb 2026 08:55:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U/74iukoqtR3n+zOBCbC058ujKfROwLkBhB+L4TRAN0nbujkWzAQ8TDb7SeQf92MjJALz/ov9sPd+sOLsL736gzUq22PcIRidkwscEm1PqbWsCnZfiVuC3F/eB9x6DApYBSf83AjkVTwntEVAujDosQ1PpW/KmEkSkDoBTgernwXe96F82sn8NC0MZnAyp3tvWja9pZ0mDgIvt/uukQ0t0BeJ/M/Ie82mUvh7FugBQOHxfJTjVhkdpsOssy4C2iGGzB2HjlSA01EJBbQztbqNLCeeZ2JbJ7FtwRno2CPXffDe9h3zr7XkK0wUCmsuNEhx98ez1V1+2DOL8z87bi/Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Htvb9iOLxvx2V7G7TiuxCD/veahh7SjNJlopcsZn0Oc=;
 b=LRNMusbOSfDd24S66em48BGyr3ZwtA7fSxvxktAX9TiuVIY4lQEk54eQRduqhnG+MX9PFKPaLbdtbJhLX41pOUwQ1MpnNZ6EzPyS5aCK8OIXpIR404AuflBWBY+XzTcQLWcsWFovO8U7kZUSG63f8M2mEq30gaV3VtOWsfQbgx5IsghORH/mFowXdRQ3IDzhIv8teUMTyKbXu2zZa3yui8CGAu/plwD4rUkQr0uBoaC+DHJ8StwOQmlWp6KP3b0CXQ3c7VlirAyujmdDl9j+DVUFoAgRrQh0EHD0hVDwF2v+DzJqVBz8Mg0ox6Y9HcxzuTxBGZHW/vak2R+sh4p9rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8283.namprd11.prod.outlook.com (2603:10b6:806:26c::16)
 by SN7PR11MB7975.namprd11.prod.outlook.com (2603:10b6:806:2eb::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Thu, 19 Feb
 2026 16:55:11 +0000
Received: from SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::d18f:6b38:584a:214]) by SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::d18f:6b38:584a:214%4]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 16:55:08 +0000
Message-ID: <3839a346-5b5b-496c-97b0-3a556a570b44@intel.com>
Date: Thu, 19 Feb 2026 17:54:57 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] ALSA: control: Verify put() result when in debug mode
To: Jaroslav Kysela <perex@perex.cz>, <tiwai@suse.com>
CC: <broonie@kernel.org>, <amade@asmblr.net>, <linux-sound@vger.kernel.org>,
	<kuninori.morimoto.gx@renesas.com>
References: <20260219094614.504459-1-cezary.rojewski@intel.com>
 <40c8dde9-0801-4bbb-abdb-fe7be4df58ff@perex.cz>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <40c8dde9-0801-4bbb-abdb-fe7be4df58ff@perex.cz>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VIYP296CA0012.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:29d::13) To SN7PR11MB8283.namprd11.prod.outlook.com
 (2603:10b6:806:26c::16)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8283:EE_|SN7PR11MB7975:EE_
X-MS-Office365-Filtering-Correlation-Id: 95d0d00d-3439-4f44-2b2c-08de6fd7a366
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VVZOSW1SRzRQbXNjYmJMNFVtQXlPbEhML3JCdTNHOStMR2NDMkN2TlUzcS9C?=
 =?utf-8?B?Z2VoYVpmSGY2QjRHM09XenBjK1RWaFZKS0k0SWxWcFh2M1Bnd1hrdldKWHpZ?=
 =?utf-8?B?dGlzRlgyU2U3UjQ0d2FsK2pDdkNZUS82SXFjalhMUWlQZG9hOTJDaWZoNHRO?=
 =?utf-8?B?ZVZiK1FsUXoySlF0NHFHaUlrU3hhM0QvZFI1SUdjeGF2SW1sWGVLVElNeEdY?=
 =?utf-8?B?NmMvaEJyUC8vdmw2WDNqbGJLZHc4Z2RpVWtGYnRKTUdWbnY3SnBIWVhaUG1i?=
 =?utf-8?B?bVVLRG92cjg5RlIybzA0SjNhcFB6aFFFbmJ5T0dnYnJZQVBHNGhFVDV3TWZE?=
 =?utf-8?B?UlBzZHhxNndKQ3BvUWRKQ01SY1JrMXAraWpyZVFrZ3dvakZvQytsWlIrNk1q?=
 =?utf-8?B?KzRvZ1pLSXFnaUNWZVU1ZlNZMzZGeUJSZEw3UXNpU3c5UWlWR2lwOFhaV3Z1?=
 =?utf-8?B?RXRvcTRsL29sVmJkY3d2L3NXWTZYbnc3T3hFS3QraTlLc2paTHRDRTlpcVdx?=
 =?utf-8?B?cy9kbWVpbmRXRGFVeldMYmxWM0MzNHZtRVUxTWhYckZxQytEL1VQRWE0Mkpn?=
 =?utf-8?B?WEpqV3RRS0M0YktadW5TbDlOeXM3aG52K3RaSWM5alA2Z1c5Z3J0b3RiV1lH?=
 =?utf-8?B?S1NaRk9oYWI2aEwxdWRKZEZrYkNjVG9JcXNOb2NxQlkyUjFPa09VaHNLZG1D?=
 =?utf-8?B?UVh5b2Q3cGNvazRUM0xVODFFT0pncVh6YS83eko5NmZxM2hGbGVaa0x0QXN5?=
 =?utf-8?B?Vi8wUmR4YlFVRmRMMjVmZFRsQi8yWXlnUXJoeEdOL29PSFF5SzVuQTVTcE96?=
 =?utf-8?B?ekxkYkFNT21iMW1yYkRBbXBwRXBJOTNydllIbURPVVdnOHFGbVlTaWdHTFdY?=
 =?utf-8?B?WUpWMVZueEo3cmR5YzVzbnEwSmFVNXVNVkFxcE0vc0loK1Z6U2tCODcwN2s3?=
 =?utf-8?B?ZzFhRUJkS25PZkQxSnNlbkhLbHdXb0VWeHpURjYrTnQxd2NRSHAwektBRk1S?=
 =?utf-8?B?UEdLdUFFNmF3RVh5K1FYa21IVXd5clpBTUFFYUh0Qkpnb2FLTEovaVgvMnR5?=
 =?utf-8?B?b3cyQWQ0aVFKYzJFZ2dRUnd1VlFlYTNhM2JuaVd4R2dVd0ZNaUNSQktUcUhn?=
 =?utf-8?B?VDJhWGk0MmxpM1dZNXBqdmtsR2xlWGJSUXBla1dpREpiWmhma2l2OE1GcGVp?=
 =?utf-8?B?VTZubk9ycmIxbVJ2MXNlekU5NHEwOGwySXArNHdqakphQlVPK0ljcWUrUlpC?=
 =?utf-8?B?b09xL1F6dlErTCsxNUtXUW8zc3ZvVE5YUHR4ZE5CVGVKaitiNWZjQzNLMGt3?=
 =?utf-8?B?UXVzeHRoL1hhS2dvU0FyUnFCNmxpMk1aVHBNSXc1aFBQSS9zSTN3RWljVTMy?=
 =?utf-8?B?UWY5RTJpZjkwQVhQWEVJcVVMUWxkWkNoVm5SeHgwS0NOSXRDNk1rV2UzNk5z?=
 =?utf-8?B?S0lQekJaQ3ZNaHNtZGpSK01ySXAvbG1SandtMUhTQ1JmOWhKdktYcUYrMzRF?=
 =?utf-8?B?RmtGOFdqTStoM1c3QlBzZndZSDNoWHJGUUpmV0FJLzgrQVo5ZE8zYVp4NnpF?=
 =?utf-8?B?RzhIemx4T0dpMjZSYldJQ3J6TGUrdWU3LzhDTFlkNHVNeVlCSkhHUUtXZmt5?=
 =?utf-8?B?M1RXUnlEM3R4T050UFBQYUMrWiswdDFuaURnb0dmYVJTZW83aVN3NzRrVys3?=
 =?utf-8?B?U1ZrRlRGejBoTXNlZnJyVDBKVWh1TXhma3JzVFpUWWVKN2NudUZvS1A1MXhq?=
 =?utf-8?B?bk80dGJGcHpGQkplM3BUQXc0aFlmNnRGVktWMTNwbXRuYWR4ZUY3Uk0rWnlJ?=
 =?utf-8?B?N1gycmFYVnVYYmtZYjBMbm1xbUJuenlVZ0VvS2YvbHhXQWVUWE0raEkwSGVR?=
 =?utf-8?B?dWUrNnV6dGpkdTlja1grWjNRQ1ZmWGVZY0JZY3hIRHVQQ2RkSGYyWVFQRTY1?=
 =?utf-8?B?OUJJeUxYNUFwZmhsSGdmNzlFQngrSktiWWVqUENKcTg5b3MwT3ByV0E1dSto?=
 =?utf-8?B?NzBVcXBMSnYwd1RLQXVVSDRiaHVMeFdZMnBJUmNMUkorQlNtTVJpNElEUWpx?=
 =?utf-8?B?NG9NS1NadWFzVnR2VUdvS2g1RkdCTlJRTUZuL3FOaDdIV2dYVjYrdko0ZHpI?=
 =?utf-8?Q?oNQ8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB8283.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cDg2U05Yc21uWUMvNDFGL1lQclpVQlQvc2lKdkRCaXMyN25DYUFpbndoQ0Na?=
 =?utf-8?B?RlRUb21LUUx1UjUveG1jYnBITzdSdUdhdTk1QlZXalgvcVdkTTY3YUNYMGxN?=
 =?utf-8?B?dmVma2hXM2FNYXdqZ21PQXhSWVhvalQ0NGNFVE1WdFhha3lSOE5IZ2Z5WnBM?=
 =?utf-8?B?QWxnbVppeWVNcG93QjJwZEVva3hPNjdxU3QzOVViRkl3VTVUMFB1WEVPaDF1?=
 =?utf-8?B?MmdqR29ZYmdzbFVHdGFmcmFMcTRKbE55azc1NUJCKy9TRzQwNjRpT05CRUh5?=
 =?utf-8?B?MkZ4RUZ3Y0ZRbmdIR0g0NHNHYmhaOWwvVlhpcW5udllMR0VXWm03aTViY1NI?=
 =?utf-8?B?UUxCbHNkS0l2R25XeTlKNW5iQ2ppbnczVEllZWQ3czlyVUxzUFdudmJDRWpo?=
 =?utf-8?B?V0ZxUW4yYkdGeWZaZXVCVlFRaDNIRXZPS2pNS1BJQWVqeGZKUFU0b1h2dmNN?=
 =?utf-8?B?SWw3TXVqQjdIVktoTnI0Qnk0T0FNcTFHRGkwTkgycVpTLzJiZVRaZ1RvWnZk?=
 =?utf-8?B?UUZqTHU2dUxxbzdnS0NKSjZSZmRkTlJ3V2tBNVVNRGN1YkdiUmtreXFQMXJh?=
 =?utf-8?B?Nnk5RG52U1F6TW05dnR6MCtYMDRPWWpLWWpHSDZyV3k2a2RlRFhZWUFGVDBK?=
 =?utf-8?B?YllEckk2bUtPV1hHSGNNa1hHL2JvMlhCd0pERThlbFpFQjErV1RjM1FNZmpO?=
 =?utf-8?B?Qjhkc0wraTRNN0lBNlJxRW1GQnZOeENlQ1BWb1E4TVZqWUFuM2NvdmdGKzNE?=
 =?utf-8?B?bXYvN1JJOVVDbmlqTjhhRFNROGlMbE02YnJxaXZwN2RGdjVFUVMxZXFvNXN4?=
 =?utf-8?B?bHdWWEpiNC93L1BKVUVkSE9YelhMVEt0WlFleUQ4Z2hTWVcvcHJ6T09FT0p2?=
 =?utf-8?B?Qk9OdjJDK1Y2bzZEOXlrY0JORnY1eWpFa0JRNnpFSnJNQi9Ob0hwT2dWSkNu?=
 =?utf-8?B?VmtOd0Q4ZEg0dW5GdXZCajA4R25FR1E5QUhsdUtXYlp1VDArSjJsZ3VJR0dn?=
 =?utf-8?B?NElEL1p6TUpwWk1jOUJwTDFRdEVVU01tM3hDK0pPWnZzYlluMHJ3eGtZeEhs?=
 =?utf-8?B?N1dxc1JwZmgyNFZaQytIWE8vZjlUS1lzU1c2SWlxelZObHRoSlhpZ3ZSUXg3?=
 =?utf-8?B?Rzd3d21ZYzFTc3N4bDFRdk1SWERRamdwL1ZnUU5HZCtHeEJ4NUphaHpNaDRx?=
 =?utf-8?B?bXFYMVdsWnpwMXV0aGpucTExWld5ZU0rdXRIOFlIZVUzWEMzTTZtM0RvVStB?=
 =?utf-8?B?bGhSeUJSNkdCNktwYW5MQ0x4N0V6Q3g5US9mRlkwZWhMNXErVVJSQ0Q3bXFZ?=
 =?utf-8?B?L09XSkkwNlNWcUlmUU1mTFczejJJTzZVVVlQbEcrNEF3NXhHajFlcEk3eU9L?=
 =?utf-8?B?dFlNMlhtR1RtS1FSRWtta1BLdm1VR0NrOElBTkp3QTgwdGVFNm1lcVBMaU1o?=
 =?utf-8?B?bEJFWVBoaHRQOGYxQytMYmJlTnZJQXpUcTZQWXFRMXMzbDBqa3pxRnl6c1dI?=
 =?utf-8?B?TkJBN0UvcXpQQk4vVW42b0dPc2dUY1BOTkpiTjlWR2s0NHRZZ0ViK3E1YklZ?=
 =?utf-8?B?K0RQNlltVjhPbUtBVWQyRHNBZmJ0YWZ6amhHdnVRaG9ZNC9lRk9hL1h4dUov?=
 =?utf-8?B?YW5iWG9lblArUStybzQ2Z2JodDlpOFRLWUVMc3FTYkdyaUtFcEhSNVZ1ZFR3?=
 =?utf-8?B?empVeWptVk1EMHg1alZ3UkUybm5KVzl2NldGQjRtdlYrZzFhM0d6UEg1OUhy?=
 =?utf-8?B?Yi9yekxHOUZOeXJ0Yzlvem15cE1OejFhSXc2c2Zna3VlMmIzL3JDME5ISUxW?=
 =?utf-8?B?cFhxOHdoTktvSEJjSlBhdHlPQ2V3bU5LRXkxMVR2YmRNZVlNVjNqcGpIUi9X?=
 =?utf-8?B?ak10U0s1R1BCSjM5R3loNG1rR3owMzByMk8rRFYxVS9xeDYxVXdVQ2V0U1VW?=
 =?utf-8?B?NlplTHNBU05HcGZqYVJmNG1iZnJqVy9KSUpPZGFYd2J6OXA5Yy90cUdGY1da?=
 =?utf-8?B?YTJNRkZ2eklkVnhmeTFCTjNDZm51ZERJZUZjbGJrQ0tvWFlEZU9lMER3ZWdX?=
 =?utf-8?B?bFRGUjZrN3ZaNGhQelRCb1pCWHdadzJrWk5mRkZoMml3VTJEamdnNUJQbXNU?=
 =?utf-8?B?TnFwLzUweEphNGhGVFU3aWwxUld2dnhyUEUxbU1NMWhCWFcrVk0ydjlEUVZZ?=
 =?utf-8?B?Y1FuTVV3Zi9ReGV5c1RmK0Y4WktHNDJkdmVwb3dLQ29QYW1HSmNWNG1lVWpR?=
 =?utf-8?B?YUo1NC9BMTJUbnhoaEpLVWh5aUdPdThLMzMzU2ExOW00UkZudC85SDNta04z?=
 =?utf-8?B?dFkydjRQNklNVG9OdmRpSnNaTTQ5RlA0bWJIbUVUQUl4TGdJc1hoRWoxUk90?=
 =?utf-8?Q?xINDZfYakK93r8cE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 95d0d00d-3439-4f44-2b2c-08de6fd7a366
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8283.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 16:55:08.4767
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wruiS9qTqVrYtLIgGbVPC1pgLdRZwDH2Ij441iHAVyRn+c1UdwGzNS+O2BdvGz6RFuRfcIpn1spX0DHJKh4zk0aG+ZBcVVEKF1f7PsB6GgQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7975
X-OriginatorOrg: intel.com

On 2026-02-19 11:36 AM, Jaroslav Kysela wrote:
> On 2/19/26 10:46, Cezary Rojewski wrote:
>> +    TP_STRUCT__entry(
>> +        __field(unsigned int,    card_id)
>> +        __field(unsigned int,    numid)
>> +        __string(kname,        kctl->id.name)
>> +        __string(iname,        iname)
>> +        __field(int,        expected)
>> +        __field(int,        actual)
> 
> Trace also the control index. I know that ASoC ignores this field to 
> allow simple string concat (easy name stacking), but we have drivers 
> which are using those integer index numbers.

amixer seems not to do so. Isn't ctl's numid sufficient? The reason I'm 
asking is that the message is quite long as is already.
