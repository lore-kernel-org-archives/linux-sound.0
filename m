Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E57DA32F765
	for <linux-sound@vger.kernel.org>; Tue, 28 Apr 2026 16:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777393378; cv=fail; b=ek8Gw86tw5+AGp7c7bsmVoRv/gvwsRmU9yhfG9vULCEmRd2LQZdYUUty6oQwIYNBKNGkMRT9fKTLmhMZnSAP47c21+ozl/vm1uQN3yzDFhMqer+425Y44ooZo/iDK51ZbuUgtA/GJ0JqH/w4Hq2cTZAMvcQjoUpdFmIOUSyYx9U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777393378; c=relaxed/simple;
	bh=Zfr0QZ/uiz86iErVUEUAy5ym98oNFCfU7xOm6BrRrRw=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=OKeRxqjsV6uYaauXdR7DxdOlwN/ScZKSoHe0LSt+5+IIBH6MG62pEIicqXJkMm5NC6zzPfgrOt/vvqwM7JXRZRLXipbuQ0vQbaZrVPQOU5HhP9EYNMg/s1yEAxT8tB5F5E5biLtXTEAGKacyzsGSEttdUnQMEsmrdOLy5/bkPgE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UD9Q4Bt4; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UD9Q4Bt4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777393377; x=1808929377;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Zfr0QZ/uiz86iErVUEUAy5ym98oNFCfU7xOm6BrRrRw=;
  b=UD9Q4Bt4AbDazq6gcy4S0X5XKEtaP4nkINX3PuVBeKd1nmkgsJVSZnSo
   k6NetAVpnuNvDR/TVVuoJ+Nh2lUsJJhqPO2Xk+Zg/P9E7tFyFY3ojgcQr
   1jkSui18sUjVBF0OwCsU3nnf4erDEqe5aK3RATYeH47/+vdkFpQecGYKd
   v36xuX0xHWYSFDl6TFcWN3LuYC9B/FRbrG3DNZLdYyfXmT8K4gefI9guy
   LAKxVVg72o9/56i3GM9UR0QZKGioDJvXVyyYp0VGlk8veI+VDiYKYoajk
   ws9RejAiGd8mzMiFdh206u57VGciJ4zzMIu6kMGJDMB9MxbgTFGkIbCrh
   g==;
X-CSE-ConnectionGUID: DiKnFZhqRNqTSlkl0kLedw==
X-CSE-MsgGUID: h6vR2oemS+KbaW4Tedht8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="78184471"
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; 
   d="scan'208";a="78184471"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2026 09:22:56 -0700
X-CSE-ConnectionGUID: D3yZ/ODyTXKPH6ozVUyBiQ==
X-CSE-MsgGUID: KlqLpFYJTEq/oIkTqb6xaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; 
   d="scan'208";a="257318101"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2026 09:22:56 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 28 Apr 2026 09:22:55 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 28 Apr 2026 09:22:55 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.9) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 28 Apr 2026 09:22:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PCAJT7eE/I7qvW+BASj1DQSJ12+LNraJZXYpA/L+nzZRxU4TxslFQ/R9rb6Ez1PZGuGyKnG46dkzH26L+NY/V/rmy5P4DoBgtwHX2s6zrHiQUyK/qO8LMch4tb0Q8BnofpR7cKqcFGoStUh35FTJs3373aAwoUOObL8zteyNxuFH3ezOVC8aaXQgFixIV1/Dk/vPciqa26NkQ34sUU4FDqV+MPSNoRtlmvQXq2cqrUFCWkZyJPf2LqDl2Tj2X8XBSC+zSjrBJOBiO2vjBoovXAyRbFX6PiMG1YDA2s9R2LWXqdxx6QU+Rx4wcBrA91AdTuOovHFKIOv4OehJIKIGhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M80Fd0wMos+Sgmgbovho3x+zAyhhMPMG6OsGwbosbnE=;
 b=TXNVkn5F2hjYkX0O3mkc0aNXK1eW8re7+YXbhG/mk1EI02iqwo5V4DAVhc1YAR22t0sEfxFZZS/MQWdPobZv9mriLb6EYdDrpUAPontVlOn6egxw7deV8MgokoKvZ41LTgwt4MI27nHJePq4YWAeNdOMGjbRkQLyxdWn49/wLh64FiaKdaQ4tWumy6NtY8O88ocKpSBY6YY2tidkHchsr0ek4Lw65Iifl3DTnHRrCZQbQ4S2qhGfdSqNrNTLQVAXMjMBOor04bZK/VuIsJkYYf0Ag22K897N4zPkgeLlAlfYsgDAvxg3mBZB1a9uOXD3NK/bP3YgHYnH790b2Ea5JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6967.namprd11.prod.outlook.com (2603:10b6:806:2bb::15)
 by SJ0PR11MB5772.namprd11.prod.outlook.com (2603:10b6:a03:422::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.18; Tue, 28 Apr
 2026 16:22:49 +0000
Received: from SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4]) by SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4%4]) with mapi id 15.20.9870.013; Tue, 28 Apr 2026
 16:22:49 +0000
Message-ID: <14a2f5a4-c29a-4aeb-985d-1618feeeb345@intel.com>
Date: Tue, 28 Apr 2026 18:22:42 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC][PATCH v4 0/2] ASoC: core: use Complete rebind cards by
 default for all users
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
CC: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
	<linux-sound@vger.kernel.org>
References: <87eck7k868.wl-kuninori.morimoto.gx@renesas.com>
 <62019496-ec5e-41d5-a17c-7739b829f15b@intel.com>
 <87wlxtxqd1.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <87wlxtxqd1.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P190CA0043.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:800:1bb::6) To SA1PR11MB6967.namprd11.prod.outlook.com
 (2603:10b6:806:2bb::15)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6967:EE_|SJ0PR11MB5772:EE_
X-MS-Office365-Filtering-Correlation-Id: 01845d5e-e635-4ef5-4af8-08dea542638b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 1aggUliFjUlCFtweTMLpBbwUwpVw6/Z7ym79FJhplwX+HQGqUz3QxK7yvpr59sDbq+TbLVAi/3QUCzDMe9Zd+irPqs61iLH8zRNVKt60Uuj54+pHyHXZIw9n8Fvdm72/mhrZMFUaqLLvoqkkcSTVFkbeVAPZhUBCfOWZxJfpWdbZ0U2lMq6EXxnc/yz/sUOlDEhDWun0Tl0QFcWVI4kdrRq+BEapy4wMl6I/N4Emusy7QQrnThNEw0mSxHqXBRpRfIJ3IYFpMPCnOElMMb6Z5p+cce7ah2jslqyrGSAsOTiyU9HkYEbTOeYuLZuGFkCxlqSGiUadXExBn/4tuQLdpwl6eCQkZxlqjZvltr1g+FswXg8fbo1baELLJe0RSO/NvIceATsxM+e7pDgw1TsXwa5CzlrUVjyFZLG34XO2o/D7BVgvF3OPv53o1K0mS4AFe+k1u+wmBI5riHOywyZ7U2mp6nF8rgZwZ0j9e6VSs5prnw9YN1zMjvNfKqe9C1WKeUGLto3zh6Pr26A+yt7DXItBUQcwlgJNtBj/4QSps244hVKU2zvofUDu5brKDa1VnWbYTH31Nf1z1JebAMC5P79iWkbul8oa99UiXM9IGmzcBriOIdu/80F118iJFr+PTq+uKRQwe5i5xf9S20oyDIOcEMlZdccs2hYbjhyDpj5T5ZqwDQn0YfnYso5y6OEiIR8KN2uNTktCoQrKmEBVVgYRSU8JuV/cXYqQfcrPqpI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB6967.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TndlUkpZUld3amlWK241SjB2WXNpOVR3KzJiS1l3WFpvMkxkZFcwSDJmZGkv?=
 =?utf-8?B?cVBReEkwSHkrL3dVN3VuL25EOStUMmtkQzNwNGhCNi85c013TURQN2ZnVFJX?=
 =?utf-8?B?TlpVKzZTUVB5czB3TFpiQmZGUUt5ZjVMV0EraVF3OUtwbFcrUWNjUVFYa2ds?=
 =?utf-8?B?bjcrNUprenRlVVY0bEcxb2lCd0xTYXhLK3hjKzhNa3ZsbkhUWFhBQk5zOVNx?=
 =?utf-8?B?dzczd1NiUGZsdHorRDFiUnNaZnZ5bEZrWFoxTTF4OUwyYzM4cmgwNWdya2h2?=
 =?utf-8?B?YVhpeGhkOGVWWXJBRzJlQlR2L1VuR1dnVkhBUUczdHNud2tveTdMKzRMaUVJ?=
 =?utf-8?B?RVk2SlZPaFE5bU9GNG1uSHRhN29DWUhyd3VPVkNXTlNhOFdLd08wVGI5NGYv?=
 =?utf-8?B?T0QxU2cvTHZpTlh4ZU1BNVJaWGsxT1hkSVQ5alZOSUJVMkhXbTJudExjV3Jk?=
 =?utf-8?B?dE95SGI5N1NhRks0Nm9sMVAyMzFwRjJ6TW5Bc2NWdXBEdGtDcGtLK1Bac1Fn?=
 =?utf-8?B?NW5xLzNNUStUL3lZc3FHMVhyUDROc1FudDFveVliU2x2OEREbENnSDUvNEZF?=
 =?utf-8?B?cnJUYVNEelhUbGJRYldpWFFQQ3NmYmErL3VKa1A2dWVwbTlETGVVemFCWjZG?=
 =?utf-8?B?b0tpUXlMSkhBUFN1VjR2bEJMMnFQaVFudjlLenZmYjA2M00yZE1pN3FrSzlF?=
 =?utf-8?B?dmdieWN5Lytvb0xra0h6VkZVSit1MDZPK2h5dzdlamcvT21nMFZGRS9ZM0Rr?=
 =?utf-8?B?RWMyOWVEWGNNY2NiNkxVOHIyVWRUT3owTlZ3RHZ4cEV6WWRDVnZ0Z09EcGpU?=
 =?utf-8?B?eGkvZnh2c2UxUUk0M1V6SksreUVJRitLdDJCVUY1bmNZL2QvckJFRnVkSEFQ?=
 =?utf-8?B?aGdIc3RtaE5yb0FlcWhYOWR1eXUvWE1qMkk1RXlZRjM2QWRHc2tNTm4wRVF2?=
 =?utf-8?B?RDArQ04rWlZiSXZMMUpqRk5reXB6bmlOSTZ4SnVLRzROcGN1elZBejNQdGpq?=
 =?utf-8?B?RG94K0pTcitaVTBIUmhzblQ1b2FrSTFvTUpQdjhialo0ZVRqSlNLOHVEN2FO?=
 =?utf-8?B?aTRMN2orSHkvQmZsRWludzRHczF5S0tvTElrNUFrTmxOK0hlckR4LzZNVmJ2?=
 =?utf-8?B?bkc5NWFZbnY5K1BwQzBicitDK1cvdHFzcVZYV2JBSGV4ME8zV3B3S0YrNFFC?=
 =?utf-8?B?eEdIeWNuMWVFeHR0dVVDMU1GYjZ4T0lBRCtSNEZuTmxrVTBCQldoUnZWNklG?=
 =?utf-8?B?UFVFOGN1dzUySnYyQVJpaTI5S3hId2oxYWMzaDhQOXlqVU5pOFR0aWlSSldt?=
 =?utf-8?B?ZHNDblMzU1owdU9UeXpIeE5BZmo0Zlh2RDZYUnFWaXB1L25ta2VPMzRmM1pZ?=
 =?utf-8?B?UXl1aXVLd3NQcnZ6NVhVYitkblNjWjg1STRMd3JONEp2ZTdDMGxWRm9uTHFh?=
 =?utf-8?B?L2Y0YmU3dWZ4U3RmNElMYVBwUTJaZkIrN3RaTjZsYnEvdFJMRi9SbEpEZTZt?=
 =?utf-8?B?VXNSUGlTVEd4eEtubUFBVGNSQ1FuRUNSWGhQZ0dwWjRRRWdwV1JDa2UwbXRS?=
 =?utf-8?B?Zm9IQjI1VDBEYWM2cUVvQ0lpU2NhT0hLSGV1ZkZFSENBRzNnQU1zeEZDWDVZ?=
 =?utf-8?B?MEVUekdJSVhLemlTYkE3S3RSaUhYcmxhREgrUVY4bHNFVTdFZDh1ZUpyTXJQ?=
 =?utf-8?B?aWg1UUNxL0EyY0Q3UWxJUGRrbHVIQmVPTW5ERkN5QkRXU1c2UkVSV05ZVVBW?=
 =?utf-8?B?NmREUG1SUXBtSzMvZzZ4OGtDVFhKOXVwSGVKcmcvSnVNcUpFVk53ZHZoODI0?=
 =?utf-8?B?dTJ6TTNWV3NVMk5MZ0Z6Tm1mOVNkSnVBRzFCL2hwL05LbWtiNFFBQ1RQWlVC?=
 =?utf-8?B?Y0xTSmE1dmhxdWowZFppQXpIWXVhN0F0SnFzK2pqelFNK3M2bUlDNTZlQzE0?=
 =?utf-8?B?eVV0UVlSUE1LalNudWw3Q1FmYkdSVUp2bi83eTFzNVVyTTJ4alIvSjdwa0FR?=
 =?utf-8?B?dEtpSUNlbGRZT3RuY05tcDBuTXBGYkZraEtmbGliUkpwUUp6TVJHV2h3UWZJ?=
 =?utf-8?B?VmhwQTRvTFJGT05ZWnoyL3NLSWhkWjVpc2NGaHZRblNzTm04Z1d0MU1BQ0to?=
 =?utf-8?B?dUZxb29rUjBYUkpzOWkzOEhZRGxmVSsxdy9HRTdsWGhzTlFtRDlzM2dJNXhC?=
 =?utf-8?B?TFJiYmdScFRLeGZCMitURDkwa3J4Z2tCbEx4d2NaMVJTUE56UEx2UnpmR3FR?=
 =?utf-8?B?c2ZYUDNtK0lmSUNTdkQvY1ZsVmEzS0dTZ1lORUlDb21NMmRBUkwyM2puNHE5?=
 =?utf-8?B?Vk5abWFWeGc2YU1RS2VKT3h3UFZRMThHd1JVcHJCZ1l5SHhWeE51SS9kZFU3?=
 =?utf-8?Q?oWuT8R+fxLv2hAqM=3D?=
X-Exchange-RoutingPolicyChecked: g27mbJaPH5kFz6uarYkoIT93smLVAA4UQtQfXjg3VaGJmR2B2vf8CN9u2kdS9l44gOPn46d+2tAbP374M+IBijUfRfPIRaDFF2KKv7Ikxvdo9tO/RsAMrGp6sgeg4q1kVrNIH7GLVT5zMcSnFfKMzuzHL5GqVvXGgAtK8Nd13pO5r+my1RRijLhLDg7hF9OeWw2qlLyvjFAvjGvwJcBxypUT+5tOydfZH/03w1MjALCYuSrS2HFsGNFPgXbDW/c9NOlm3DkgWMebtY+8wgC61FjxbrncohfyVyo4brtXbs4sPIXe8ibVpZkWeLm2EFs6iZRwDTd4+mxzfS9K+Xqi4w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 01845d5e-e635-4ef5-4af8-08dea542638b
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6967.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 16:22:49.2297
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nK9ZHC2Y3bcFZQ3HXrq65YgTgGoYIwHDaDs6f08rC3j+oytEr9Xw8TeLf5f82QNtldRoki2P2Iv2+mFAecPCtDkf/Wot+cGgJZPXy0FIE00=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5772
X-OriginatorOrg: intel.com

On 2026-04-27 1:18 AM, Kuninori Morimoto wrote:
> 
> Hi Cezary
> 
>> There is soc_tplg_remove_link() already, I believe introducing
>> soc_tplg_link_release(), an "unbalanced" function goes against the goal
>> of the patch.  Internal struct is a heavy hitter, I'd argue it alone
>> defeats the purpose of the patch.
> 
> Ah, yes indeed.
> 
>> Perhaps we can achieve the goal in multiple steps.  Simplify the code
>> implementing the feature by merging 2) and work from there if you
>> believe the readability still isn't where it should be.
> 
> Thanks.
> Just I can do is indicate the idea only for topology.
> My posted patch was not good enough, but happy if the idea (= use
> devres_add() to remove rtd/dai-link) acceptable for you.
> 
> Thank you for your help !!
Before I send my patch, given your large impact in shaping the subject, 
would you like me to add Suggested-by: or Co-developed-by: (you) to the 
message?
