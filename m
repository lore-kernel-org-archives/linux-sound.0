Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA95A1F03DE;
	Mon, 27 Jul 2026 09:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785144619; cv=fail; b=VwuvOQozS4pUKHajfHEd8diQoiD2rTTYDNPoqW0rKj7CcM6DDkCL1cdmp+KZZNNzteDAtaQ1rGXaKe0/h9sDhlsf9br+EIJgBNpH1vCnpX7cjP2vWarMfvmTWrdh+ef7b6ziFU9FOdbqsbN4aTuwP0S6RQa3WufQyT7N8b4JMvE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785144619; c=relaxed/simple;
	bh=b3VUrjSMFkVK/NsIXVzEHkF2K13qyjk8HYv27CtxOuM=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=abfzlw6MCc52X5dYtDUzX4kWr1a0R1cbE0B+a+6jpZNHBj3aoOYDF8OTJqmAHLCRtpaDlixlsomSRIr70JeUTIT6Cgb3UxK7yosyp7inu8raEYiiYScuHFO1cJjcVApFgsMR5GVGPC5tuiHjUgZ8KrZG24WwcS9928TWh+3MQwE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R1BP1d1Q; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R1BP1d1Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785144617; x=1816680617;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=b3VUrjSMFkVK/NsIXVzEHkF2K13qyjk8HYv27CtxOuM=;
  b=R1BP1d1QRdmdY3Ya204K9SCJL1EK/1ygRSDm++BV01S99JFdow4WpkFN
   wDoCxE6QPSWzo5s6PvFll4KOwEpoVe5JNhkkKI76t7ZD4dbe8MJn0Gu1I
   9ZUXL1KgjuDOvOYDcr5/Uo1mSL/kEWStXJlSgzpIJ9nHihbAEUI0yMYcj
   ts9+pIt/EIwB0zNUr3FqxJogAqXWc54eVzgCuo0S1ZdwgSw2mauYbkBE0
   p5nnNxuqtmEEUY7d3u2KlgPFYm8leUCjX5YSFKxRet35HQ8FbYoi8bBHZ
   F7wq8AJ1UymdfXArQRI+BGqeFsa4JUNHGkEjuUaffIcVxFt6dWz8sr+JH
   Q==;
X-CSE-ConnectionGUID: bOSTQOIAQlO2LqJfD7rReA==
X-CSE-MsgGUID: XAV4VyY/ThiTJOkAG5oYHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11857"; a="85720963"
X-IronPort-AV: E=Sophos;i="6.25,188,1779174000"; 
   d="scan'208";a="85720963"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2026 02:30:16 -0700
X-CSE-ConnectionGUID: owsf0wmeSvSV0MuiS7j3cg==
X-CSE-MsgGUID: CpUONhpJQIqt4c2MnEvGGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,188,1779174000"; 
   d="scan'208";a="255431391"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2026 02:30:16 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 27 Jul 2026 02:30:15 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 27 Jul 2026 02:30:15 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.43)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 27 Jul 2026 02:30:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ONadnSGw+8Sg7VjXOVGrDagSQfolHmLozfTEq//v37l+hehYufGbkk4BStzXNwQPJjEhO5FHr2wZpli/doro17lfgCDwuU0ulfZOva9r6w6puF8y34raQdk/S2xu9HPZwT0Ap48cUzEBQVZpclp2RglzkPqYPcGE1yS7rzOZH4rp49En+bMOJ2HsMN1k44PWgmmc4lz8x6b33Bu7Fi6Td8w4tEjDHrMvFQpXhyUuEOnQx9/VEwtp8TFNn0K3xdBr0jBJ2I0vciP696eI2dxj2ihCcbAUgTyGVb6W2veLPNzaShgJiUQ0tKEpIwIwLOl0MN91WQ19Tk8n6FVRYHnzqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=knG3KilFXu+OPy0iNCNxmjb0o/MVU0rEstM7TF5lQDs=;
 b=aYATo9gpANHsdOKgK3+c027FSU30KVDXesdnGtw8NDgmOXrmQ0PnPrluKIrvEsQriZwbewCZGxVEwERMFGSVoDIxmWIafk9vhw0PdZpbbnjysrevPzpxCGhUXpAoUtjxgkeaQ3ZwLBrcDUANexMP93eHtaaoRKMJ69FpKoI2S5T4R4Pva/GGBPjEKfT7a+5Nzx+O48cMu05vuoZD6rDIc1lZaM8M8TbRUg95zAfswuvweCrS/ufierhR3GYD808M0YVQrwZqT7MLOKtMX+7P4C/JvCjV5wUAS8HfYCSFHwo4J10SZLH4SX8v2XUPizbpOIz8D2lBgvkNGCoHI3/lqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6967.namprd11.prod.outlook.com (2603:10b6:806:2bb::15)
 by DSWPR11MB9930.namprd11.prod.outlook.com (2603:10b6:8:3a0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 09:30:14 +0000
Received: from SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4]) by SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4%3]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 09:30:13 +0000
Message-ID: <65cc9293-b7fb-4604-a8cf-34f6181b8f22@intel.com>
Date: Mon, 27 Jul 2026 11:30:08 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] ASoC: Intel: atom: remove conditional return with
 no effect
To: Sang-Heon Jeon <ekffu200098@gmail.com>
CC: <linux-kernel@vger.kernel.org>, <linux-sound@vger.kernel.org>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Liam Girdwood
	<liam.r.girdwood@linux.intel.com>, Peter Ujfalusi
	<peter.ujfalusi@linux.intel.com>, Bard Liao
	<yung-chuan.liao@linux.intel.com>, Kai Vehmanen
	<kai.vehmanen@linux.intel.com>, Mark Brown <broonie@kernel.org>, "Jaroslav
 Kysela" <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
References: <20260725160344.916838-1-ekffu200098@gmail.com>
 <20260725160344.916838-3-ekffu200098@gmail.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20260725160344.916838-3-ekffu200098@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P251CA0009.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d2::20) To SA1PR11MB6967.namprd11.prod.outlook.com
 (2603:10b6:806:2bb::15)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6967:EE_|DSWPR11MB9930:EE_
X-MS-Office365-Filtering-Correlation-Id: 7aff0aee-c1eb-4908-5e9a-08deebc1a95c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|23010399003|366016|1800799024|56012099006|11063799006|4143699003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: niWF7Or3bP4dbWCf6iO0RtSkeLherWTsLxYiHfXJFnmgpa7pntoa/9O3Qa7y2HHpGL4eZDlAOB51kfXNKFhvmyXDrYkMq14vTenO/dx8m9KUqi2pjlD6TLf+Ilr3BHy0sUfnakTNgjrMWtB3sJbt8phtbml101i/XtijBC8zDwmd0huc1iTFrTyDeyj07PBMUIU9DLzXBMLqoBvetCJzEaprPGoJRXxPHVOKvqqa5XZtG3D0j2TtkMIVGGnYoC56+1p4uUVbJWKr5lXx16Gfk16n3SyOZfTH61AH22P/o86GjuoNHiGK+aR/5ZmdR/eJ8zkP5wPNqqbYB5IMs+NDXVZDXW/b/CUpCnEFfglCByien97TiCTRoTCiaWcOeoLBcOn+5Qwl4/nS5pqR+ePTIFF95LyHqowOzGd2mmvlx0/8H40h9w/a3vcMhLOgiXbit1W0S/Wc7S2vceXiCqE703rbJvisFzEOuu0uHUvra+Es2WoIrAmwnK1/IgrlZ25sA+lyL3dgC5qvqhcqgAgBfG5qe4E8KMchtAJB7day8KIHOruMNg+t8cO+oKx7N91GXMKq+F5JlDkHRy9ukFZN5IWzUauLRCu9sCBM4VYYUoRUYDujFkgbYCY+5ixNOUQ/l3d8FTeFMDtkSddHHlNDfhaLLIkwq/KsSu4am7E41OY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB6967.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(366016)(1800799024)(56012099006)(11063799006)(4143699003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z1VDQnVGZllkY2tZeHRMTUVKOXhEUjg1UnlZQTU3UkVpclUxR0tyUlB3WXhE?=
 =?utf-8?B?ZEhJdXdZSys4bFBYOUs4dm1OOVdxTzJlNnRndFBDeGpDaEJTdmZIWFZwRy9r?=
 =?utf-8?B?SW9rQkV6bm15VFFTclNnQUF1bzRNaVgwRlBrREVsRGQzb3dHZUZmRUczVDZZ?=
 =?utf-8?B?Skg2ZTV5YU0wNnYvNlhYcmFOclNuQTVOZHgvUGxIb3JBK3VFVDJON0JJZDkw?=
 =?utf-8?B?NXNzSzJjaWMxK3VuejlaQytWbzQrWDF5eU1lNFRSMXY1eVZJMTAxdUlRem1r?=
 =?utf-8?B?VUpSakFwWlZHY0tPQXNyREQ2RUpQM04wZTY0WUtEeTRBalphcjNTS0UvanRD?=
 =?utf-8?B?UVpVam9HamVUczJwM0dmT0F6b1RSUEFERUFpSnp4YlA4dThmcllOWHFOam9l?=
 =?utf-8?B?RUxCR0M1QmdsQ0dJVzczN0NvVWtGdEw5eGdJeWNjd1FCU1VCdzkyV25Ydm5Q?=
 =?utf-8?B?MjhYc1dJU3BRRUJtdUxISUM4dGQzbE5lY0NCUk5PdzRRR1Z3eEJPWUtYOEd5?=
 =?utf-8?B?YUpaem1ES3dIb1VIUVVYODRRV1RHemtjblJnZmlXRURMalFKSUU0SEtqMkFv?=
 =?utf-8?B?NVUvWi9PeHFNZmRrWGtuWXhCL2w1RWVwRTR1Q2VmNkt1NVZNUUdXS1VhQm5w?=
 =?utf-8?B?bUVoR1FUQTE2clZRQktqT3NIWGRjK2tzanZZRjh5RDlXTkhrYU12V3FyZHhn?=
 =?utf-8?B?aGtHL1QxaUpNMCtGa1dSTWxYWjF3cGZWeWhLb3pDeHlDWVBiRFRzVDgvRFYr?=
 =?utf-8?B?eDNJRC9teTZPYjhPeUVmd2F4aWo1NjBMbXlWTlhxalFZWmkyR0ZnWjR4ekpo?=
 =?utf-8?B?eXRpTUVrQlVDeDM3MWQ0bGNQczNjTXdGTmF3SGlGQjc3TWJmOHl3dkRUZGNz?=
 =?utf-8?B?VDhKY0JSWTFQcHFwREpPSWc5T21BZENHQTVpYWZnUGpFOWRSMndZcTB6bElo?=
 =?utf-8?B?NWpROE1TNVNhTUd2MjBBWU90MS83UzhlK2ZhN1l0amdTenNYMDFUdkxxbDEv?=
 =?utf-8?B?YlpRTU1TY2dFMW1xK0V0dUlBTzlxSGFJU0trQks4T001UTQzZ0U2ZzR5YU1o?=
 =?utf-8?B?dTZSR3BrMDNUOGV2TjN4eFc2Sm0ySnhSRDlBdFlUUG54eG9ETGNDZEhxYnlD?=
 =?utf-8?B?cGR0cHFnREZ6UThuZlc0SzQ2dzVVZVJXT3lOVzBScm9YakFxWC9taGhFdmQ2?=
 =?utf-8?B?V3kxM2JVV09DUzVkRmY3YU5IZDVLQ0YwQ3M1cHprajNaY3owVGRtdW9WNW5F?=
 =?utf-8?B?Y2hnaUF1bmg4NFBubUVWZXdYSXFSMXd1Zmh6MktwbjYxNFhxUCtoWXFzVXUv?=
 =?utf-8?B?SE5DeDNyTit1WWp1dGZuRGt5K3dKaURmczRUT1htSy82TTE5cEJ1VHFRelBs?=
 =?utf-8?B?MEt3NUE2bkhsSUdRR3lLV1VtQmovOXNQN1g1ZHZTNUZvZTYvYXlMcEI1NkJq?=
 =?utf-8?B?cEN6aG1UaDZSdTBnNUdvNFZKMm9pYUtkRktHVERSSFRDN3p5dkFCQVZHbGRE?=
 =?utf-8?B?cC9WcGd4bW00SWhTbU8xZWZuY0dVQTlCRFNJbGFqakRtUXFPR01sRE4zb3Zt?=
 =?utf-8?B?aml2bTNFNXV4a0ZWcHRIOEJGNmdOUUgvNjNiMzJ6SVlKL3Q5ZnJRVmF2eDlR?=
 =?utf-8?B?YWdhdTJtRlFybnlYTWxMQVBzcXNlU2dIVGpaLzhoOEg0bHV3SS90YWRuaVRZ?=
 =?utf-8?B?bGZDNm9CRi9BYmtaSm5adkp2N0VLeGpzSHNDNTVyejQwK1N1RUJjUkdLRGdl?=
 =?utf-8?B?QkwvWncyWGpldGpoWTQ2bGZQOFNIVWpRZmFYa013UCtOMmVOK1lMVDhBWW1E?=
 =?utf-8?B?aytWOTBWT2dWYmZnMVpwMjNrdUtpaTdwc0ZkZlZQbDdHQnUrTHBVeDUwUVZN?=
 =?utf-8?B?MzFETGh5VktsT1VkM0tVZjB3M0ZKT0Vsenk2d0gybmdxWnhQR3N5N0VQdVZ2?=
 =?utf-8?B?eUJxZDdZd01QTzR0anM1aG5oajMyc3dWN1RZcXlCV0U3L2RsY21MWlkxZTF5?=
 =?utf-8?B?L3VRTmFHaTRaem9QQWhLeFhvNXA4Z2VvK1QxSmNSaXArbWkvcVYzRThwT2do?=
 =?utf-8?B?VGM2Yk9YVnZSemRLT0hkR2YyVnJFSGVGWEpjVm80dkd5eHNGTjBVTEU4eVNu?=
 =?utf-8?B?bE52emlhQTJGV3MwbnQ5T3FFdEQ4aHY4UndGL0dHcDMwem5DQzNtYVU5cFRt?=
 =?utf-8?B?NHhjNUhMcFVqeFRCYUlZdFZuU2EySDdxcyt2cjFMMkJ2aks2dlAvUU9HZFpL?=
 =?utf-8?B?NlhpaDVDaHdUUkYxTDFCQzRHQXY4QlFKQ1puQVgwbU1QZlMzdGJuQkRiS2Yy?=
 =?utf-8?B?RldRNkFHSE8zU1lwZko3VCszY04xWWVHaFM3b29UdVlYcGtqaDB0NHE5NVdk?=
 =?utf-8?Q?xxxRvscDX1CfoK88=3D?=
X-Exchange-RoutingPolicyChecked: booNyg5Fyc+BLlHSbtjxsnew3TZg9CxgcNlv9YMUU+jfni+mNQLZcgpCid4cnPTnlDwFD9k0WroaQhIpVfXRXqpGkl3o9Qo8y2gNzJHws0LwfxO6atS0UU6tsxY2FXM49aKamRQCuCNSo1RiFiyP0kA+aGJgK49JvCF+MA2yyL/ok7rkfl3Qq1gLhZatBqusO+Ttube9jTBaz6C7vNmIprhXjZfkc0bZrJ7/AAHLJNTMzRz9NG9JdW8OdKLyt/F9wa5Iq4thL/Bzvwwt4EpcQkrbhBpwopNy8Htu+PtvYR6d65lh8BbK6IXp0VWxtnkx554zsvPLe3/JCsUQyLHhmg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7aff0aee-c1eb-4908-5e9a-08deebc1a95c
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6967.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 09:30:13.7823
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dyB4wk0HScYoilH8gLgluhINoDFv6RYI+g9cMlHkvcsWlO6xuM3uEwnMGiH3YY9WNJd6puUeXxIYxDENMD0kCkc7D5lJNePgd2M+jFDz91o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSWPR11MB9930
X-OriginatorOrg: intel.com

On 7/25/2026 6:03 PM, Sang-Heon Jeon wrote:
> Both branches of the check return the same value, so the check has
> no effect. Remove it and return the value directly.
> 
> This is the result of running the Coccinelle script from
> scripts/coccinelle/misc/cond_return_no_effect.cocci.
> 
> Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
> ---
>   sound/soc/intel/atom/sst-mfld-platform-pcm.c | 7 +------
>   1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/sound/soc/intel/atom/sst-mfld-platform-pcm.c b/sound/soc/intel/atom/sst-mfld-platform-pcm.c
> index 9ee4d9926e06..a4c8cbfba096 100644
> --- a/sound/soc/intel/atom/sst-mfld-platform-pcm.c
> +++ b/sound/soc/intel/atom/sst-mfld-platform-pcm.c
> @@ -236,12 +236,7 @@ static int sst_platform_alloc_stream(struct snd_pcm_substream *substream,
>   
>   	stream->stream_info.str_id = str_params.stream_id;
>   
> -	ret_val = stream->ops->open(sst->dev, &str_params);
> -	if (ret_val <= 0)
> -		return ret_val;
> -
> -
> -	return ret_val;
> +	return stream->ops->open(sst->dev, &str_params);
>   }
>   
>   static void sst_period_elapsed(void *arg)

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
