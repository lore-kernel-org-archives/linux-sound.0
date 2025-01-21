Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB6E1714A5
	for <linux-sound@vger.kernel.org>; Tue, 21 Jan 2025 08:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737448767; cv=fail; b=K3w2OhOMGjIdjLaCp/8OfrrAIDwaPcLVcWecl2o4lU3FU2UK6mlxK1Ljitr/pgrdD+9hJvSyUeqBw4n3tYwV6IU6kdvJ6Lj4j+fyxAlxejN4BGzeBEGIRHag19ddStNBcrKVxQGrM/jsngp2xT+3HrzuM/CrhZzkv+r+PvLbhTQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737448767; c=relaxed/simple;
	bh=eHUeaZKuhhgEnwY6LyMZ7hUzROIqu+6K5Npt4N0xLmw=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=JjW23ZRJzmOAb6IREeUwSAQ2ot+5MRPjAlq7qQsTirNDc7j38fwH6NPuc6SAICO9cp4W+9B5JOAjdakf2wR4fny6R7hwPyGCRUd8n0khLrbzBnBxnbe81KRSPWY5B+7TJUjUihJGEfnDGauVsFL0CCm4SIDQqPJ0I8SKRyQOalo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bfNVQ1os; arc=fail smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bfNVQ1os"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737448762; x=1768984762;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=eHUeaZKuhhgEnwY6LyMZ7hUzROIqu+6K5Npt4N0xLmw=;
  b=bfNVQ1osGBCWnYESB2XrnAFIOck+N1MztOyOHLd1F/KiLpCFSQnXJGP/
   N0vn3e+xtYAllrIhPCWKo76iCejD5aG5/zKrIFFua85a5AP/3RmmWVTqS
   qOW8gA5UQwmYj5VN/V+b9I4gw9+68f8O2XpWjuJ9JHYCXOQpc7BHjrmfH
   S9RdExz+gjSKlKtgrl+WlIJJWT759YNPUtNlBm/aF19XrxGZ2EjtGkmXM
   8+BHNbTfFBAnPPqqn8KNlSTnQ1QK/AP8ha/cLqTxkWoe5T64cGE8F1AFm
   d/6h0j5X6TrQ59AQBTUj2lV68BZ1Ll0tFtfSJ2BxLiJrU2JqBR1CB0LDx
   A==;
X-CSE-ConnectionGUID: twRstIv6R8eJLX722T9PPg==
X-CSE-MsgGUID: uP6QIyGWQQq4gP+yv8keRA==
X-IronPort-AV: E=McAfee;i="6700,10204,11321"; a="37062122"
X-IronPort-AV: E=Sophos;i="6.13,221,1732608000"; 
   d="scan'208";a="37062122"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2025 00:39:21 -0800
X-CSE-ConnectionGUID: uYmHyrB7T/Cuzhpcklwm2w==
X-CSE-MsgGUID: lOSPcCBSRsia1poMUEgjoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="130006395"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 21 Jan 2025 00:39:21 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 21 Jan 2025 00:39:19 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 21 Jan 2025 00:39:19 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.49) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 21 Jan 2025 00:39:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eoRxRp1/hkWjGnbNtwo0oLGEmv9U6IeEkJgt3CyWChUxJVcQIgGvvJAgIN3eRo/l/3iaJD+fbHi/exQws11kmiEM3yLxn2rAKOLa1eFR0WpKIcSdJKcYnetshlbhEODwfGwGLdL1DwDYanBMr2gGg707QDs5mtS2hkEQ/S8WDOZe/kgmZQk90MMZheDeeyQ/Oiw/FaE7vB6C3d9S01VRHeoHyFLh+g34yR/BkPKAdkPr8zbdRk9owhhp6epppc2+DXj1QnH1DscO0oJUy2uf1MMPdBSVYYwLt8r5Hc5V8xJElRlTuJbaBL0FJXg6lRuP2rjK/YHNlY5T6/aZZI5FDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=imDHFWSPPkS+o5sR50+EkIpxRtocHQkl6H4usZFQ/2M=;
 b=aFhfj7T+EEH1M7w0V0oOailuQ9MYho0qN1Isid9oMPAF0czo5TY5TlSbw1vQ3z9q/Up+mkhtO+p0N/BGG+vqv0PunDCQXWn5JU2Rcz6CYUhs81wqnrlibGYpKQ4ykhfB+v9TfS6sW+9WQ81sTPyG540czEY6G/yZHHVUGWl0RP0pPMe+CviztvgcMGcKKzrFJfpo8guBYjU15x/CPxuOewynalEykg8LQvjIJH9rCi8QEyAEG8AX8hFLx6ytfeOlJQuQkXmhDN/nMUkv+9RRIDjTnJiFdDzWo0/+EcBn0bn7GBYVEPuiA9UDelmg8GMK7aMTd59x92NoW/NA4PFCdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 DS0PR11MB7214.namprd11.prod.outlook.com (2603:10b6:8:139::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8356.22; Tue, 21 Jan 2025 08:39:18 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cd01:59f6:b0f8:c832]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cd01:59f6:b0f8:c832%5]) with mapi id 15.20.8356.017; Tue, 21 Jan 2025
 08:39:18 +0000
Message-ID: <f0b27a44-81c9-47c1-878f-0cd2219e82af@intel.com>
Date: Tue, 21 Jan 2025 09:39:13 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/13] ASoC: Intel: avs: Add MODULE_FIRMWARE to inform
 about FW
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
CC: <linux-sound@vger.kernel.org>, <tiwai@suse.com>, <perex@perex.cz>,
	<amadeuszx.slawinski@linux.intel.com>, Mark Brown <broonie@kernel.org>
References: <20250109122216.3667847-1-cezary.rojewski@intel.com>
 <20250109122216.3667847-8-cezary.rojewski@intel.com>
 <7c857d1f-e520-4fde-9b84-19b071fd8390@linux.dev>
 <fe5bcb7e-ae6b-4915-ac08-3a1e0eca62db@intel.com>
 <3ae5da14-c1f8-4403-ac8b-2cd558a8bbfd@linux.dev>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <3ae5da14-c1f8-4403-ac8b-2cd558a8bbfd@linux.dev>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ZR0P278CA0122.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:20::19) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|DS0PR11MB7214:EE_
X-MS-Office365-Filtering-Correlation-Id: a848c6e9-a636-4055-39d4-08dd39f7180d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eWxKOG1GSzkvVElLL3REUEdaNWJ4aHBCSTc4bUd0Yi9ueXhqMWxubDEwR1BD?=
 =?utf-8?B?RmxoTlU2SDNaU3U3YWEzaTZCSVozSVJKTy9TTGVoQnljeW5pYWdDbXM3WWpL?=
 =?utf-8?B?WXVnelRoL0lMNWNRa1pUUzVsekZMbk5nVE1aRnZ0QThJbHphSURYY1I4aXlo?=
 =?utf-8?B?Szl4bUZSVXQ4b1RUeGVnNWZzQlVJNXYyUGZkR1ZGZnBDNHY2cU9aS3lvQ3Fp?=
 =?utf-8?B?M2JEWTlvbk85Ly9aVDJGVW5CS1VJWFA1YU5pK0hEaXUxYTRmdUptRUxlR0FQ?=
 =?utf-8?B?aGlHSUg4aWcrcDN1dXR6KzNYVXpPb1QyL0FZYVFtSDhyOFRBdzI4R2xiLytM?=
 =?utf-8?B?MlZ2dXhQK3A3dVlTbzJ4VTU1V0ZzNGNmekdRWmRpWUIwR3hQZHdCc2k0QVMz?=
 =?utf-8?B?WHh6dG9ZanA4QWgvSmZRNXh1RHRJeEJqdVFwSVo5OEhRNUJ1VTR5Z0NKSGNH?=
 =?utf-8?B?MjdMc0tKeXR1RTZLQ1Q2YjlvYUJIbE1HNzlPL1V1K0tuaDdzb0FPcHZJdlZI?=
 =?utf-8?B?VVpaRnVwZ3JXUEZCUXNVMWVZZTZPMUZ1TWFCbG0rRS9ZRTZPRG5yR1QyQXp0?=
 =?utf-8?B?cFF0VmVudTA0MzZacDFyM1RtTDA5d05KRzU1a24yVHBNNklpWXlKeFVSL2c2?=
 =?utf-8?B?K1hBNUpya3VSMWlBWU0yTkt2SmNhYWVHSHlsT0t3bWVpSm9oU2hnKzNWNUZ6?=
 =?utf-8?B?UE1iSmVMQzQ5K2hCSmdqR3gvcTRIdFBPV2lmVXJtYmsydDBpenoycUwzNmhw?=
 =?utf-8?B?VWxsT0ViUlRTRUJwYkN6c3dmK3I4WDBBSVN6VTl1UmE4T1RzRzduaTlqZ1RG?=
 =?utf-8?B?V295MHk5d3l4V291bjVXU0JrWmdsQ1lNZzcyNlBjRHJzOEYrSURXL01aUDUr?=
 =?utf-8?B?L0tOYkZMMnAzenpvdUNvYlMvSy9BUUJtSExyb080MXpLdmpPUzJxZGlKRGtp?=
 =?utf-8?B?S25HVTJNY1hkT2lFQmVWYTFFSG42b1Rvc2tRTlhBVXJQWkVCdkRyOEdvcitr?=
 =?utf-8?B?bk40Tlh2dUlkbHBkWEdZcm9BenE3L1E2VTR5YStoNDhUcU4rdDVNbXByWUlD?=
 =?utf-8?B?a1ZEVXVEYTh4MlJIamZxUVRKTDVtMVNtWnZYMzh2T1dWcmFHcHFWaUx0R1VS?=
 =?utf-8?B?dFhrSU1sbjErSnBaWVpTL1NERUlrRGhZVjk3Q2cwZjFSRVdjMlF5NnFGMWN3?=
 =?utf-8?B?NUd4VTRMejRwUW1vR0V1RTVteHlUOFFUL25uUi8zNWdGVzF1MmMvMU11SkdD?=
 =?utf-8?B?MTRlaFdYQklvVXhscjViSk1BeGk0Zk1hZ04zSWgrOXFPbnEydVNNcGYzZWU3?=
 =?utf-8?B?cVZHVG9RU0RuZFBJVzMyc1NkSVY0WDRHMDAzdW15bnhDNk1qd0l0RWovNm1I?=
 =?utf-8?B?bFY2WXYvdWowY3VUd3NYVnlWTEJ1bTZQTlhMdjBxa1pNTnVCSldVZ0pXUWcv?=
 =?utf-8?B?UkhXR1lWTUZWYjgwdXhkRlB4cEVjMkorb3FTTlBsRjVVbzBjNjZuUE9qcFIw?=
 =?utf-8?B?TEFqeWNlYVVOM09rdnhjUm9vY3lnVmZwbmc5RkI2Ty8vcTFPVFI3VmJmYm5a?=
 =?utf-8?B?MjlPZlBIZE1HY0p1UGV2QmVtSmNDR1REcWdoQ0p2SlIxa3hxcENvMEU1T1Ur?=
 =?utf-8?B?bzIyZ2tBRGQ3RWJUMkxUckY2MnM4UHREaGY5OWxlaEs2SDkxcHAxUmhvbHlo?=
 =?utf-8?B?dGxUeEdOdU43Q0FnS3FTbTlmRWVIWDVQMUt3OVpGS1JFU0Z4MVNjeVFiaTk2?=
 =?utf-8?B?YXhhclZuSW5mZUZyMStiK002Y2JXS0lqNnNLbUdqSWl6VDNibnFoZnlSNzlY?=
 =?utf-8?B?NkxDeTV5bzlsTEQwQzZVUXNsbjY2TlJmeWhuYjRpdGJiMGpVaFVpV2lEZzNp?=
 =?utf-8?Q?eKKM42t+r2Bzq?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6375.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NWtUREkrdy8yS1RkSXl5eHpaamxWUlg2N01CM0huenYwUnZwWmFmR280VWQr?=
 =?utf-8?B?Y1lDVkpaanZXOXNPYTR3Vzl2eVIxSVJQM0I1QVVtcFZ2SjVQTHNjYllXbnQx?=
 =?utf-8?B?OXZtQlN5TXlsYU1hMjkraEFMd2pFWFYwanNid3BDd2Vmb1l2dU1YbURjYk56?=
 =?utf-8?B?UzZ0R2NLK3EyREdCKzUvNlVmWTc1SXZQRTdsNVBkZEk4a0greDdUUmtRbFhn?=
 =?utf-8?B?NHZhY0YwTndyai8ySHBIT3dKcEtlMG0zTVJUbnpXQ0V3S0p4bnZaaW1xcjFS?=
 =?utf-8?B?QXhlNFpXTHJnT3pLa1hRZm54dGtmeGZHRWJoOW1yQmptajhQUzFaUWgvY0Jx?=
 =?utf-8?B?emN3c2RJbXNBMWFoMUovd3F6Y3BIMlZtaGRjcld6cFVhaTRkKzd2L2k0Y01Q?=
 =?utf-8?B?aHphck1VM2dWdnBXMUNBQnVUU0dZR0ZqOXBUd241S3A0TkFRSzlYTHJOVitK?=
 =?utf-8?B?MmJDWFFKaUlEdHgrRDdvWkh4ejFCQ1cyMkQ5c0FXL0grVDhkNUQ0di9Ta05n?=
 =?utf-8?B?VU9NR3NLeDVzU09TSGNNaFVCdWE4MXlDRUpRN3FGc1QzK0dHMEFjbTRxc0Vp?=
 =?utf-8?B?eE5sWXpiVGdhdUVZY0ZFNFMrWjNTU2F4c21kYnVqMVQybmhCUVB2TXRRSW1p?=
 =?utf-8?B?WkdwMTM0dXI3YXVkdmo0VThrbmcvcGx6U3pxTS9ra3lmL1hIWm5EUXFkNkZM?=
 =?utf-8?B?YmkrSWhXYmNSY0dKT2EyMTdhcVk3a0J4VlZ1R0kvZzUxVkFqYmhTNGhIeE1l?=
 =?utf-8?B?WEQ2UUlZMjRkdXQvNkJYelNnMzBGNTZkV3kvaEcxU21JN2orMW4yTlh5NVA0?=
 =?utf-8?B?SWFYUHZPNWRIc0gzNDVndm1YMWt1QkY3eTZoeDJzU1pFY0VPa0tZSUN6V25R?=
 =?utf-8?B?ZjFqYmExZFBacmwxN3BoWW9saVpMNmtVWG5PenE3M3JOYVpXeGRJR0JvUndq?=
 =?utf-8?B?ZkxQZU5zMnJtTTMza1BLZGNUS3NGMDREd3hkS25JZDk5aWNld3VkSUlHSEpz?=
 =?utf-8?B?cy9qWE43eGUvTFVhQUZ5RTJibzhITlFWTllzU0l0RWVBRHdMRjcxejBNSHRY?=
 =?utf-8?B?VGVWM2x0VU85Vm1vK1VsOFIzUjlJVms0OVNQR3JXOXJVZC9kdzJSMHZBRW1I?=
 =?utf-8?B?c2E0WjNKNmQ3anRYZXEwSWV6TlNPTU01R01USmpEWmNRNld1RzRNT1RIRUN3?=
 =?utf-8?B?YkJUa3dSb2xjS0NpTWFUQ3hZZ3N5cmFyTDd1VWNYU3kyNkprNW9Zd3NCLzJ5?=
 =?utf-8?B?dnp5amk2Wlh1UkpqY2t3dU1ZcjNYR2NNeGc2eTQ0VE8yZldtZGV0aUxvNjRn?=
 =?utf-8?B?ZCtMMGxoVnAxWkphSE5XQ3pXd2d4UXB3dVJqRDYwYkRLV0gxbXdzY2hhSjZr?=
 =?utf-8?B?Q3oxMGpLMWo4eU1abDB3c2lZMGVNSFlLdTZ4b1NiejNkdlB5b0ptQVZzbTcz?=
 =?utf-8?B?dzdObkVTeE1GZ29KVmZlMitKNXQ4SDNKRnh3OHYveHpwZ0lsbVpsZzVjZWtM?=
 =?utf-8?B?N0Y3ZEgzM1BDdTZpU2lLVzdsaDVtWWVvaDB1QTZPT3FNYWhVeHM1blFWb0VO?=
 =?utf-8?B?RkZBOWF2VDZVRmhIZ2orbGJIWjRCTnF4QXlMMEVDVXJVMFRMSHZGaW4wWXk0?=
 =?utf-8?B?d1Q3dkdKaWlyOURWMGxMbndHcXkwbFVRQ3BlendHemNKeDMwNWp6MVNicVR3?=
 =?utf-8?B?Um5CYXowYVMzV1loM2JCM2xxN0EyZEc1Vld1Ujg2RTEvQ3VBU1M0Y0FicjZs?=
 =?utf-8?B?cU9YRDJ0QjZVdTViL3pKR21tZG5OMU5hdjNXb2V2OHV6WThTSXNhMzNFOEty?=
 =?utf-8?B?blllN2FhSGdHTDk1NmxvQnRHMTB3MWcvbG1NWExzdW5Na1YzaEY3TUdNTXdZ?=
 =?utf-8?B?bnZkV3RzdU56QW9nRmh3a1ZXOWl2Snpsb3psK09CcjB0b3p0Q2p1cG1sZmZW?=
 =?utf-8?B?SHNiRlRHckJONnI3d0I1SGlXdlpxazZBTUZhN1grZzhrRXFTQ05uU3YwVkNj?=
 =?utf-8?B?RzRSWTZSaTFwVlZSWXh1ajUyMXlCTUV5bEtvRkIrZTdBQnFxMmZuS3NNazk5?=
 =?utf-8?B?M09XdjhsNkFjQldhNnB2c2IrRlhNaUtBdmFId00yZkJTQ2t3a0swZkprT20w?=
 =?utf-8?B?a0crTjFrcmJJd21qbmNHYjhZckhPVkFhelFTSEt2Rm95T2JNTktsdU1ZRFJa?=
 =?utf-8?B?TVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a848c6e9-a636-4055-39d4-08dd39f7180d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2025 08:39:18.0598
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y/NMXeqybWNfe8fDSX9ddkdiABD6Md0Zct0DBpSvEl6lLhASn9rn94Jqd7QAZSSPfRl7hTY4mn21uTSBMK7xFD6Z2JyiG3KzYK4oRKGse+g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7214
X-OriginatorOrg: intel.com

On 2025-01-17 4:59 PM, Pierre-Louis Bossart wrote:
> 
>>>> +MODULE_FIRMWARE("intel/tgl/dsp_basefw.bin");
>>>> +MODULE_FIRMWARE("intel/ehl/dsp_basefw.bin");
>>>> +MODULE_FIRMWARE("intel/adl/dsp_basefw.bin");
>>>> +MODULE_FIRMWARE("intel/adl_n/dsp_basefw.bin");
>>>
>>> If you start listing the variants of ADL, then shouldn't you also list the variants of TGL?
>>> Same for CNL, there are multiple variants, not to mention different signing keys.
>>
>> The only reason ADL and ADL-N are listed separately is binary incompatibility - MEU differs between the two. In essence, one can use ADL-binaries for all ADL/RPL based platforms _except_ for ADL-N based ones. The code is the same, the verification process is different. For all other major platforms, no MEU differences so one binary covers all variants.
>>
>> In regard to the key, the approach is: it's ignored.
>>
>> Whatever is in the directory under 'dsp_basefw.bin' will be attempted for booting the DSP. By default, what lands on the market is a production-type-signed binaries. Internally CI runs with prod -or- debug signed binaries but we do not intend to share the latter to the official linux-firmware repo.
> 
> You didn't get my point. There are also binary incompatibilities between TGL and TGL-H (different number of cores) and in the CNL/CML space there were different production keys and MEU snaffus requiring different binaries to be released.
> This wasn't about the production/debug problem, I was only referring to 'production' releases.

I'm afraid there are differences between cAVS/ACE firmware and SOF. When 
it comes to the cAVS/ACE, TGL devices are all handled using the exact 
same binary and the firmware reads certain hardware capabilities in 
runtime. CML-R (CML platform with TGP PCH) falls into the same category.

Instead, the cAVS/ACE expects the software to send BUS_HARDWARE_ID IPC 
to inform it about details of the hardware revision e.g.: the stepping. 
Firmware may decide to tailor certain flows depending on that detailed 
information.

Kind regards,
Czarek
