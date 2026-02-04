Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6147286D7E
	for <linux-sound@vger.kernel.org>; Wed,  4 Feb 2026 11:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770204839; cv=fail; b=qgyVsheXZgBlON40zkoUE+ff6eNAgtHLckTj4pMnt8HPwK3+UEIL5mMLG8fF4bupc1sofNk+v1RIU9GY17mMI9/GYamzq468OiVmtr23W6IzBW9+cOj0+Fm3WE+rWbbbxLduzcsv4Jqouu+Viwf40V26EaZ0lcTVTpnh96F5x64=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770204839; c=relaxed/simple;
	bh=KzRsY2G2WGyYsaZ0ghlKuA2RtBdBHay86wNlpFpBOEo=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=l+O2i7DcPBozJ1X0GfCdK6O3KLC5wxvWg7hUs4Pt+LLkHqJtKHCFfzTLBcL5RFuKdngu0cEBIwN4Ek0W7CibHGDevDaQpvu5VWv+XYG1B227jmgTXdUsxM+60FXvbkEQrWs1oIVBmTIC8jjMYg1Kef95YBl9I/6nSx5iU11L/jo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZReGelYo; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZReGelYo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770204839; x=1801740839;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=KzRsY2G2WGyYsaZ0ghlKuA2RtBdBHay86wNlpFpBOEo=;
  b=ZReGelYo5qsLNOxOxxlCpagIUgwQiGXEZEEHaR/kvA6JK90GqopXO5MI
   zRsz6wc15PJI0IDwBy2Tn29y/q1Ciu1XB+zzln2lmnhygk5aRxMCiiT+T
   WQiTFFDskeSjmBBN3Cu/MnwGiueotPv1hxmSUiyzU4G2TKexkn1BsaGNz
   lA3DHfogiiaU3tvsWyjO+CcEiVJ6xZA4Of4f9KoRpIZtSG8C944Ruwr+w
   G/38Eu4PJ0v4FrMYuJwrbRdod3nURcn8Bq53Pa7aR1f66FCaAA9OeamUm
   dVt4vMlMS6A1a9ameyC8U/6GBY8MR7OLGN5N6gzngbBJhHLEX2cdvpIbe
   g==;
X-CSE-ConnectionGUID: wknU0fiESwmygfSYv4kl4g==
X-CSE-MsgGUID: I4tNuPvoTNiMsnch3tog3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="88966432"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="88966432"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 03:33:58 -0800
X-CSE-ConnectionGUID: BQfBVkGGS4yU+3vew8nemQ==
X-CSE-MsgGUID: ZycX7Xy4RvKmrcovDh8kXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="210176978"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 03:33:58 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 4 Feb 2026 03:33:57 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 4 Feb 2026 03:33:57 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.29) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 4 Feb 2026 03:33:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B1vYeF8oDumjsGL+C0KMf0cBVD4lmxXyRHQ0MNl4i7qg4f4RKNLs7Qjl4aBZldSkCcQbxFClh9leat39TbJHGBQPrJmvnTJk6iiEfVtS3cuOaGFzlW+6jOY8xd2pPGl1rvWVpy4mf7mOE8W8AC6u+hur5cX1/tJgBBNK38uCop83ejGOWeE/fuLAowWRfhoiCJcGEadGfgB1Q+x6t0YnpVkvg/95Mvky68SH5qx+7OM9Eex++XAsp6It8WG4DAyDxi/pHLEkMM9nNLfABiPMlHuMYgg8lnjE52QJx8v1Os0X/If8ZDkTB4oyckAemA3JOHMzhtaFsgUIQNRewkkvBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NCfBYytYPsfJMbaSgXX17n2GWvYD/seO34QLWPvKQFQ=;
 b=l30FfIqTDndjpDM6pwtD4wHtsNVQxv83dSr7hD2OKKjpET4YjJ2yc9YUF+DxAHtBHIsrAL6bNR7SEyTgrty5g7AfBhI7xdhYIvOrCyZeDYT0E/+yNekmXeJI8kWDmcLkOVhvaSYlbIufo9opM8i7fTaZTBdNoQL6It9PP5X8VUxmM91TAsaxlAnPOcYfpfzv+PLaQJPDpCFxoGcEUTrZqpOJVWhdji2aPVVy86mwCE9ZgPq6G7Sypdu4m/PCsnF7BD3nN3mmBDVKCt30K59z2vd6j2r/J7EtXXvoHJG27Wm0Q5MxqGzhDMk19mgUfFqI2ys3iJoibrzmIUDavPUG4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8283.namprd11.prod.outlook.com (2603:10b6:806:26c::16)
 by DS7PR11MB7886.namprd11.prod.outlook.com (2603:10b6:8:d8::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Wed, 4 Feb
 2026 11:33:55 +0000
Received: from SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::d18f:6b38:584a:214]) by SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::d18f:6b38:584a:214%4]) with mapi id 15.20.9587.013; Wed, 4 Feb 2026
 11:33:55 +0000
Message-ID: <ba7d5055-f0d7-445d-a226-053b13029f4f@intel.com>
Date: Wed, 4 Feb 2026 12:33:45 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ALSA: control: Verify put() result when in debug mode
To: Takashi Iwai <tiwai@suse.de>
CC: Mark Brown <broonie@kernel.org>, <tiwai@suse.com>, <perex@perex.cz>,
	<amade@asmblr.net>, <kuninori.morimoto.gx@renesas.com>,
	<linux-sound@vger.kernel.org>
References: <20260130135541.115574-1-cezary.rojewski@intel.com>
 <60f477d0-ea1f-435a-bd8c-4e7e06a1802b@sirena.org.uk>
 <87ikcjxjgr.wl-tiwai@suse.de>
 <2d5852c1-f754-4b5a-8a01-962a4ba14b68@intel.com>
 <87ecn7xhdm.wl-tiwai@suse.de>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <87ecn7xhdm.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIYP296CA0010.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:29d::14) To SN7PR11MB8283.namprd11.prod.outlook.com
 (2603:10b6:806:26c::16)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8283:EE_|DS7PR11MB7886:EE_
X-MS-Office365-Filtering-Correlation-Id: 293105f4-c8a1-4908-a1eb-08de63e14717
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dVh0ZEVMRDRPQlRHVFBzQWZhMnVuR291N2RBT202TUtMaDFPL2wyVkRLT3l3?=
 =?utf-8?B?eTVkbkNoN05DbUVUMFU5ZWtUTXYvTjBacDNJYk1LeEV1ZTFGc25iUXNJRXNB?=
 =?utf-8?B?R2dlZUxZTTFDN3lDQzc2NmhqeVZMQWplZmh3ekF1YWZQekNQV2ZFcFV0aVhk?=
 =?utf-8?B?ZVg3cGdkcWNubS81ay9JQ1ZEVHUveFZqdVM2cThybzhzNkpSN1VCMVFnWVVn?=
 =?utf-8?B?WjhKUVgrZ2VRU1E3eGlsdTRyRWg2QzJhTlRMK005T0E3bDBxdWlBTXIyaW4x?=
 =?utf-8?B?MlphVlQ0RjRpdllrVlVaVWdMRGRNMVA0OFBVMWhCb0RyTjRVeEIrNUVERzkv?=
 =?utf-8?B?bFB0SS9VS0MySGtVTWpjNmZmTDVxbWtqWCtuQnU0QURsNG1Td3RhWU5CTGF5?=
 =?utf-8?B?Lyt3djdtN2x4eWppZS9jcnNBQWFUMCtkRSs1UUcvZkcxMm9UNU5PeTFLdWdG?=
 =?utf-8?B?R05EKzlkZ0RSL1lHR0JPNmVpN1Z3enBPNWFCMUhQS2g1L3BxVkp6eEhmd3VL?=
 =?utf-8?B?eHdWK005M2p2cFhhVWFwd0VaR1liQzVvZ0FLdVlUN00rbjJlNXk3cnBNbm1x?=
 =?utf-8?B?eWRGQy9RSXdHSU9nTnUzQTNpNGlzUHdoOVdxUUhkRk8ydzU5OG5xcGdBSFRY?=
 =?utf-8?B?ZXR3bEx2eGR2cGcwRnF1czBGVk1DWFdHekp6WUdWN1R3QVZqY1Q4VlN0T1Vx?=
 =?utf-8?B?dVVla1F6YTRNQXNTdS9aRlN5Z0pmRFZzcjZaM2l2MVNpT2lTTzNiNjFaRlZ5?=
 =?utf-8?B?QkpoY1hSVU1CbmE4UmFNdjdPeVdLaXdpKzYyUHBiQlNBVzh5bmhSbERielZP?=
 =?utf-8?B?MDR0ckI1UytmdklmMjViblFRNk5FdEYwNytNZnhROWlVbzJGcy92NUJabkl0?=
 =?utf-8?B?MVliQTY2UHByYU9ub2RlMklIeXFiZmp5OVFRUlFWUFpPaVBITS9jbm5SaGtO?=
 =?utf-8?B?V2VmSWFicWlkd3dWY1lobCt1ZE5tYlBZUUJrbmQ0ZGlTcEFjTG5FNGI5L1dt?=
 =?utf-8?B?Y0h1bk9WeWJIWndKeTAyWGM5SXpvSmtkckJ2aXVzeGY1K3lVYjhnNm1QcUtj?=
 =?utf-8?B?dXRmT3NMOWdkbEQySkNmOHRVejdFczNkM0E4Q25rZ1pMclRMQjhLK3c3VUo1?=
 =?utf-8?B?aVB4MFRzV3orTkR3elU4amxwU0x6Mm5wbC9QbHVuRTBlbVpUOHZuaWliTU42?=
 =?utf-8?B?VGI5dHlqangxa2dOS3l5SWIwYm5VdkVzVitkQzllczlueXJKaU9YK2hMQUVx?=
 =?utf-8?B?UWRzVXd5U3BaeDIyNHhUZ0QxdnBiVUdGU2FZamtMVXlVNW9wWjMxd1JtRldI?=
 =?utf-8?B?aURNcDNOYlpRQXNjTTIxREpVMDlGd3I4TU1CTjRUSzE3L1ViSGl3MlBReTg2?=
 =?utf-8?B?Yno0b0J6K1EvTmZxSkxaR0NHb3ExNUpxVmRscWwvZnNUMVR1Zmc1bFd4U2hy?=
 =?utf-8?B?S0U4RkVMeERrQkZDNlN4N3FZWU5nVUNkdzFFdDdMSUtCY3JOQUZxQzd5NGRr?=
 =?utf-8?B?VFBaZHpIM1MwVjJHelkxRzFhSjlEWVNBNDJsREFqOEpNL01KbGkyN1VvcGFj?=
 =?utf-8?B?V0Jqd0R4UGFuclJwclEyTzlYcEo4SzE3eUJuMTJJN0h4Vy9wdG5LaWwwRGZl?=
 =?utf-8?B?Wnh5ajRFbmhaVU9taFJwUXpGSWJsTGFpc3ZQVjlMbGFMVFRYZmVWcTMzMU1J?=
 =?utf-8?B?a080WjhzVEJjY2kzMlNadVA1K21IYUNBZGNJR2VuYTBrN2RoSnlUdzMyNXlG?=
 =?utf-8?B?Z1MwZFFaeXhtTDdodmhpbFRhTFNTWThmQk5ac3hUb1NBLzVnaC9xSklVSk1h?=
 =?utf-8?B?clVKeFc3Q0JPc21xWWdXSjladlRYa2orOGdHSGFWaEFGUGNPeHFWOHBXL1B2?=
 =?utf-8?B?cEdLS2RlZzhuQnpZdXJ3Sk5GOWF5N0JxU1RTZXBabEJ2VkxTM3lxd2xvWDIw?=
 =?utf-8?B?M0sxckZRajJiUDB6SGVqdUp1bE9XWjVCaE5uK2hZSWdEb08xbHdXVDJoTkJh?=
 =?utf-8?B?a0JucUowZnkzSmJINktlOXVPR0pmNG14SW5yWllCWlExUlNNSjJxck0xVFpD?=
 =?utf-8?B?Q3E2ZTN5YUFmVGlvT2gvRjZXZnlIZ0EvOWZJaVNtcmc5SDJKQTBUSHNpcjBO?=
 =?utf-8?Q?HirE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB8283.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?alU3UEtJMktLS2szc3Y1bXA1QXJ6QVlJTmtlNmttaEJrWlhtN3FtQmo2VW8w?=
 =?utf-8?B?Z2gvb0Z0aURHTTByMUJxcEFnV3J5OThxNnhQZ0VqOEdpNFZiOGU1VDZDcExw?=
 =?utf-8?B?M25yN0lPVVFLMU4vdXozdFZaekZtNGhxYUtlajBWSUFNYVdRYUxIQVF0N2Jh?=
 =?utf-8?B?aU93RlZKNXk4R2dJQ24waTNaTW52YVpEaUlWZzJBWXJqUFRFVFdiUTNMa2w0?=
 =?utf-8?B?R3JSTUZ6N2p0T2JJNlVKR21pVTJnNnVPU3ZSanA5MFl3WjRNNHNYcGZuM1ZU?=
 =?utf-8?B?YVVXOVNOOW5rTFFnaFliTDFnMS9RUzNORFFvRXdQMWhMTXJwdWxQVmk4bHBz?=
 =?utf-8?B?L0hoOXhkYTRpSE5tUitMWDVZQXQ2NEQxVnFJdnJHWnF5YUthc2xpbUtCRmRY?=
 =?utf-8?B?dWhJaCsrNVVhTThwVVh4QjZZczhwa0JXc3h6NlYwNXFLaGF3Y3ZpcjZvZUVk?=
 =?utf-8?B?K0JDMURFTFZhaFNSZDNLOFBra01qMHA3L1dDUEtGOHRqanhCMHZMV1hVT2RK?=
 =?utf-8?B?aFA2SUxCVkRKRFZGeEpIb2l5WEI3YWNSVVM5RTdKUlo0Rnh2MmhtY09CQWJB?=
 =?utf-8?B?OWpyOTUxMVcrdmtCM2dkejdVdWtNb08vUlJtUEZjWVVSWnV6bFFkVnJEb1Zm?=
 =?utf-8?B?dHM2K3UzazJiNDYyK3M0YzR5ekFqeG5sazZ3VEIvNnlVSDh3M1dMZFlUNDZk?=
 =?utf-8?B?dDNpT0JoZlRuVWg5WlYyK29zVEJjZmxETjhibThiYWhXL1V1WmpLOG9LY2lj?=
 =?utf-8?B?aGU1MHBEenRiZWpCZW5JRjg5L2RneitZbTlTa1Y3TCtXNk5IOE9Mcis4aU5q?=
 =?utf-8?B?OHpxc2ZvS0ZUWEk4UWFiYlk0L0FPSUU0L1RsQytwSnhWSXBadDEvR09CRGpk?=
 =?utf-8?B?Z0wyTFo1QmRSMTJIVUtnMWtFODQ1b0pRWDUzNDdhNkIwNDFVUFMzSHdwMktO?=
 =?utf-8?B?U0FpcFJBdlpJdjVlUkE2Zkd6ZnBaajNQeXdpakYwMXNCYVNwSmJPNTBzNW9C?=
 =?utf-8?B?VEF0d2hpM1RYaGl1cjhsNjdqajRMUDhNM1FwUk80VitqNWE5YW1VZG8zVEdz?=
 =?utf-8?B?YnhHT05SVWI2b0tBbk5SbjBHZVh5N3VsNmhBUnJqL1BET1FsMHpTTlU4Slgr?=
 =?utf-8?B?UGx1T2FnWGFUODlYUHo2T3Juc1QzNlN6bEJOekhEV05kcG5HQ0tZWjk2eXgw?=
 =?utf-8?B?Vi9JSWc5ZUZHMXN1T1JsTDFHVzhCR3NrUSt3K0ZkcXRmWGhVV3lvM1FJKzZG?=
 =?utf-8?B?Ti9FWlJobnVsZEV4aFhnYm8yaHgwOTRtWkFZY2NWMFJZRnFKcm4wTGh5L1hN?=
 =?utf-8?B?aWV0R3RCSzJ0RFUvVXFNcVV3OWFoQ2pzV3duUjkvekhTOE5RVkRrdDhsRHZQ?=
 =?utf-8?B?dU42N0NrM010V095ZWpDM09oWXp3cGdMLzA5UnpuVmpQVDNob1dRZE9zK3Zr?=
 =?utf-8?B?RHF5Njg1UGI5Y3lkS0JJZlkvR1dhS1lwcnN1eWJnK3R0a2JhK0hpS0hTMW5o?=
 =?utf-8?B?dHI4UjB4K3FNcno2SHhUeFZmQ2pkSDNNNzNBdEZLYkppTTRCV0xDS0hlWUdI?=
 =?utf-8?B?VFNIVGZGcGkwQXBwQkZpbm8vZVpselhuZE8vN1JIczhwRGUwYVVXMGVNZWhB?=
 =?utf-8?B?U3BTMTJ5eE5LNFozUXFUYnF3VDBOOEc2Z0NOakVyc3doL1FGaE5abVQ1bjVm?=
 =?utf-8?B?L2d6ekxGT0pobEN6Q1dMYVlLUGRSSVNVQnBwRGVJN2lYYzhwU01EOWtmTVhD?=
 =?utf-8?B?alN2V3J2bHpLeGdabnZBSklEOVdzY0NpNkVIWEhCWHUxcjdyVGFjUnB2OGFZ?=
 =?utf-8?B?WHZwUnkrcklacFRRaXRoNWFRUmJwZTcxdGV4aE01am5zZ0VEcmI0bW1iOEY4?=
 =?utf-8?B?SVZSS1FWNnJMWmMwTlRoYnJ2QmFvTkRrcm5STWdybGdyRXArNWtMQWE2Z0Ju?=
 =?utf-8?B?SG9qZ3BQc2tnckRMd0ZXVzBiQUJZV3Q5UU1iR3JCdUw1OXU0dmdKWHpncG9r?=
 =?utf-8?B?NkU5dzhZWHoxRit1R25Ba01INGpRakNrVHM3NjBKYXovVXhacHBOczhCTkdL?=
 =?utf-8?B?aitVVCtRVDJYaVJiQXUzeXBBUFhrRUhyUW9JV2JYeFVCWmdyYUdNZU9oUW9n?=
 =?utf-8?B?cEVtSjU2SkFST0lkNWg0OHlPT0R6c01FTU1hZUM3TkRoRXNhcHB4SXVOK2dT?=
 =?utf-8?B?VkV6a1RjQkZjMEtjc3lYM1YwOUxnQnpwUHNQNnNLSjhiSXFHZHlXa2VDdjhi?=
 =?utf-8?B?TTlwLys2Q0Rod0piSitGb3J6ZSt6b1dYSXlwUjBEemdSS2tWRWx6V2lTMTY3?=
 =?utf-8?B?SzRBYkdaR1dmemJ3QW0zV0w4ckF4RGhVdkhYdHJham9leXk1UlArM3l4bUo1?=
 =?utf-8?Q?DYCrzp03Bt2SBYtY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 293105f4-c8a1-4908-a1eb-08de63e14717
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8283.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 11:33:54.9522
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MHv2zLSduGMTCHLaeI0VOGBhAfpuwbXsiEB2ZzrpTTYVyQY0zv2byyndhzv9ItkLbfbTc7XMJ49Bk5tavsaGcobfQQ4FL9i7mjQWP+uSgSs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7886
X-OriginatorOrg: intel.com

On 2026-01-30 4:14 PM, Takashi Iwai wrote:
> On Fri, 30 Jan 2026 16:00:10 +0100,
> Cezary Rojewski wrote:
>>
>> On 2026-01-30 3:29 PM, Takashi Iwai wrote:
>>> On Fri, 30 Jan 2026 15:12:58 +0100,
>>> Mark Brown wrote:
>>>>> +	struct snd_ctl_elem_value original;
>>>>
>>>>> +	ret = kctl->get(kctl, &original);
>>>>> +	if (ret)
>>>>> +		return ret;
>>>>
>>>>> +	retcmp = memcmp(&original.value.bytes.data[0], &control->value.bytes.data[0],
>>>>> +			sizeof(original.value.bytes.data[0]));
>>>>> +	if (retcmp)
>>>>> +		retcmp = 1;
>>>>
>>>> original was just allocated from the stack so who knows what values it
>>>> had originally, and the get() is only going to write the part of the
>>>> value that has data since the normal get() path has a memset() in the
>>>> core.  Similarly with the new value coming in from userspace there's no
>>>> requirement for userspace to set anything that isn't part of the value
>>>> being written to any particular value.  This means we're liable to get
>>>> spurious mismatches.
>>>
>>> Yes, and if I understand correctly, the above memcmpy() just compare
>>> the single byte from original and the result?  Then it'll lead to
>>> false-positive outputs.
>>>
>>> We'll need to query the control info and check the relevant values
>>> for each info->type and count.
>>
>> Wouldn't memset(0) as a preparation-step solve the issue? That is,
>> each element - instance of struct snd_ctl_elem_value - has up to 512
>> bytes of data, regardless of type. Not seeing usefulness of ->info()
>> here. Perhaps I'm missing something.
> 
> Well, you're calling memcmp with sizeof(original.value.bytes.data[0]),
> and this size is just one byte, no?
> 
> And, if you need to compare the full data, the remaining space has to
> be initialized, yes.  For the variable original, you can do memset(),
> but for control->value, there is no guarantee of initialization of
> remaining space because it's a copy from user-space.

I admit, I'm a bit embarrassed by the 
"sizeof(original.value.bytes.data[0])" mistake of mine, fixed in v2.

The ->info() operation brings questions to my mind but I believe in v2 
I've utilized it as suggested: use info->type and info->count to 
sanitize the 'new' value. If I'm wrong about that, let me know in the v2 
review.

Kind regards,
Czarek
