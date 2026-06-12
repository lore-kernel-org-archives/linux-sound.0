Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB14221721;
	Fri, 12 Jun 2026 08:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781253136; cv=fail; b=NJiL3DN+0He+AIn+btCpJgjUvqlAHGJNV0drYG8RUBv0Mi99AmNbQG9hDSmOCRFvRRtcA9xqld/9ZPNWB39vVSAyRQopac7Bxhaeey9MvWr7Sj7SZE2MXzr9me9G5twR4svzcYKwVZq5z/8KG+1YlJtTBPUdbgGQm0TGu774iOg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781253136; c=relaxed/simple;
	bh=OYmK5W3soSVNTU0pMe6QE2UbDW6GQlKyItTBH6ROh+A=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=dugL9NfVLavywU6huVt9IWeKNDSKXO4UjyW6m1ns8PTgww98Ues5a06DM4i4MUfdlDrdjsreCbIsFmUikikL/afO2SNSVsfITdMsfUPROlmciwGk6tA16G4DL5jHIiS5bJoc5gCKPK9SXM2EXbmPvyEJU3EHCHXkqAzBCkk5qw4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kyjDsbhZ; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kyjDsbhZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781253135; x=1812789135;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=OYmK5W3soSVNTU0pMe6QE2UbDW6GQlKyItTBH6ROh+A=;
  b=kyjDsbhZ4HwAmkgbjHpMEDhvZx/iwpb6hAi0OhHIX2tPNg7/p2L3IYxK
   IGqQkjiH/7SP5lp1gTznNhzqCDS6pUJSjqzP8sMg2Q2EGBSZVAhwklG23
   1pzkxtX8oYQUUBPur+DxkFUS8jgSvrnbevDrgNrhEVUaK83AhVazND6FY
   Ia5gxE1oLFiZi7VoaNS9O7gopggexc1EB1svsRnQf4vuJHIaEE5FUHQe9
   i4WmtrqDqY8xLkpchYZjKV2c+gEmT1NwzUElMp99k3vzgLMMRldYMFm1W
   XZK0ZXu2nEWP8erTy4GjaWXVRFuoC+/GD7bDyClSZW9MimPvix3WaETny
   Q==;
X-CSE-ConnectionGUID: AjSZHWgbQYmv+W9i2xSIqA==
X-CSE-MsgGUID: tnH8lY5iT2ubLv6d+RLArA==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="82143953"
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="82143953"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 01:32:15 -0700
X-CSE-ConnectionGUID: t2Kyws4GSQi6bhqK3y35qg==
X-CSE-MsgGUID: /ApOZdXdRs+WDCmdUXWx+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="250692912"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 01:32:15 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 12 Jun 2026 01:32:14 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 12 Jun 2026 01:32:14 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.27) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 12 Jun 2026 01:32:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DVgxPCDnuHy4K3P9da/0GC7Gj+quTtshaBCaYyDKbZhV2hg2V70Uc8yZwKovbLYJs8d3LuU00UfwyY/wMsn2+9aWA50bTkj40EzQx/0crDKd9t5ePRy95JADuWucEOHhGfhfStSXp2cZYxSsL/Q0OvzGzLnRe1Pnrm6iClqqyD2JVSn4dSJ3Bw7HP6SxaNXrUAgoWQqyUasq4H0811Jcps6sYROOftH3hvKQbHPSeEZRuyxWyZeBa3J4RGVx27GSNedjHY/BtF/Fkj8+lA1IKTlbJL+gnZ/RLFZ5vYO29PCSHaT3ECssb9rcAWgwbz7MX9vC1P0bHp9M85w4qvbV1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rlWko+/nIPxzGlNpLN+hn2kjV7/5uqrEpgLwMqPUECA=;
 b=sL2f6qYRuOz1FJ0ezvYt3e1jA52+W7l2iK3mwbSzET7HdLobTWacBlHwQXd/ux+FZjFO9Dzxa+sgrg0WziIu/rJBKnB4ISUQJ5C59IdNsPCOGucL5JgniCGWaaBnHn7rYlbi4ZqMDpp1CDLAx0+aBpO9EdH9osmAEqmi2uxo5ydNtp1wRFOyMZrcUt9SwQ6XTl6jmFQ/RyeV95JokgZzV95wQ46uS8kwqOux//Ap+WmPI9N2+ZuAHTUiZ3vms96Sl3+p4OWaD+w3FlYsSigw2Yuat8Yzrc8KUFRA1v5xpbh+DjGYPJWd5NwKK2urrhSmQQzomKgl3nkrKeK4a+qNVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6978.namprd11.prod.outlook.com (2603:10b6:510:206::12)
 by IA3PR11MB9013.namprd11.prod.outlook.com (2603:10b6:208:57c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.14; Fri, 12 Jun
 2026 08:32:12 +0000
Received: from PH7PR11MB6978.namprd11.prod.outlook.com
 ([fe80::f60e:1044:67d7:d8fc]) by PH7PR11MB6978.namprd11.prod.outlook.com
 ([fe80::f60e:1044:67d7:d8fc%5]) with mapi id 15.21.0092.011; Fri, 12 Jun 2026
 08:32:11 +0000
Message-ID: <9bb2bc5e-507c-4a73-ae44-dff6659fae93@intel.com>
Date: Fri, 12 Jun 2026 10:32:06 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/20] ASoC: Intel: avs: probes: Use guard() for spin
 locks
To: Bui Duc Phuc <phucduc.bui@gmail.com>
CC: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Peter
 Ujfalusi" <peter.ujfalusi@linux.intel.com>, Bard Liao
	<yung-chuan.liao@linux.intel.com>, Kai Vehmanen
	<kai.vehmanen@linux.intel.com>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.dev>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>, "Liam
 Girdwood" <liam.r.girdwood@linux.intel.com>
References: <20260611115901.80438-1-phucduc.bui@gmail.com>
 <20260611115901.80438-5-phucduc.bui@gmail.com>
 <8bf70242-a64a-4980-90b0-ab0310685a7b@intel.com>
 <CAABR9nGVKMJjCOQ1S72HR6iAS8Sx+wDT3L0tNyvn2AaAdhWodw@mail.gmail.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <CAABR9nGVKMJjCOQ1S72HR6iAS8Sx+wDT3L0tNyvn2AaAdhWodw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1PEPF00005B9D.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d8::635) To PH7PR11MB6978.namprd11.prod.outlook.com
 (2603:10b6:510:206::12)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6978:EE_|IA3PR11MB9013:EE_
X-MS-Office365-Filtering-Correlation-Id: cfeff477-cd7e-465d-0056-08dec85d1969
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|23010399003|3023799007|18002099003|22082099003|56012099006|4143699003|11063799006|5023799004;
X-Microsoft-Antispam-Message-Info: AJUT5/0LCkob2mIqnBLCfv4huQ5Uub+1FTwco9lqZ/ekiNR6uu6edt5WwLleoDVF6Raf2L9Ip0sPzv7flVbg6d00oPZMlP1pyy8eup+DFCe5g2mE+xkhc90tNsg4HfPCWYHk0dC+Zl4uyUm546NdH8MOVuHehzxf66TlD2j2woIrG0QrR4nPti34KjSLrhwd2zG0tbgkZZIL/3nFrEDWsJnSZ1pH0dwfb/FCIZOf6ejbOMxARto41AwvvQbczojO77nAXTYGKoHEp41P+5YRJ8vb4sx52EU3Y5jTsJaPXiLEVPI9gpAJfDH1SqFyfrgWM82iE9kdykQafZgRfpzJf5gstNLbpI49AOqgBAvjgUG+sE0BIfykGXfqVGuhQCYoEPEYi55d26agUYUOAA/DIFb78/cbIij1yoQHLO0+tkrzscCA4Pyp1aOyWKelpst7O7tcBM4MSR0ahTe+P0aeyUKwytyUhEacNlFJkxgem/Yataj5VmzfuVSOi5UTUojkm66ETpqyV+rWooo/vesUJFzNM1CdtNbu/FPJvhQg5RAx2Au5WXvG0jINc0b0yQazbWvn1NGa7I0S1BdeZQQVOl7GZbtXd29++iMv59gcPvrZLyOJAbmdhKT63gWvWrwCQAfQCCXGaKf5cEVgG0HB2TMPLt75ACtzZf/zrLGSRbf4/Iotr1RK4+mZW3Yv85aJ
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6978.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(23010399003)(3023799007)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bjhVck12Qm1DQUo1alFMbFV6a2k2SndLb0FsQmpLbTdmTDFUaFBjVHU3WnYv?=
 =?utf-8?B?NFBYZzdiVU9ETURuQzNITDZaTnFVUHFkZGM1bERJVjZQbVJEU1ZaaENMVXlR?=
 =?utf-8?B?MTA1WkZ4UVh3QkI5alRWTFk1cWZ3VGJQSmZ5UnQ0Y2p6U1NYWktJdXhid3Ir?=
 =?utf-8?B?WWEwRzJEcENlekIxeFZhV2VZcGFTZ3lBeDRYamNwTUhQakRYalVFOXB5c3Zs?=
 =?utf-8?B?UWsrdXdSekpaMHZvSms5a3JUZHZtR2JwK1RZalljczh2andERHNQeXp5aGJu?=
 =?utf-8?B?OXlQcXBxMjk4MHRPTm95Qm9qUlRxVUFUb0tuellSbDFTNDZUUVd4bThnSWYv?=
 =?utf-8?B?bGl3UGx0cnJubDFUYkVTYWJkRHNLSXB3VmNJdElka3ZSWlZBeHIxaDh6YUwr?=
 =?utf-8?B?KyszQkVoMFZBRGE0N0xqK3BhZEZ3ZXhYSVBUeEYxWlRWemxRNUluTVd5ejIw?=
 =?utf-8?B?bEYyZUloSzBUWG5lK0VkSEF0RG1TaVNMK0xHVEF4LzJ3eVJkTzBMZEFMQ0dZ?=
 =?utf-8?B?TDZxV0RBcHlselFXTWdIQ1g0cW0rNnFRSUg3RGNDQmRiV2Y0WVEvVG8yQ0hY?=
 =?utf-8?B?a0ZNMEc2MWZaRWdIckRMS0dYUEJmWGx1QzNTOGx6cGlSZmtrNTEydUxKS0xr?=
 =?utf-8?B?dnRIS0daS3hvcFJ4ZHJJT2VxMkJNdHpJZjFNQUlBNTB5V1ZpSy9RajkrV0tv?=
 =?utf-8?B?Z3MyWnU2RDk3QjFYTjlvVHpFNk1WZS9waUhJc0FoZzRWZG8rakk0MktZOCt4?=
 =?utf-8?B?L2M0Y2xDTC9GcmJhdTRuK1NyYkVTOUw0SXp4ZWhUV1VRWnVHaW5qNlkyR2RO?=
 =?utf-8?B?ZGRvNzBaS1dxUGluVEsva2pZYm1sRW11cGJtN3JkRVgxRGk2SjlWek0rejJw?=
 =?utf-8?B?NE1sYk5ua1ptUlJ6bmkxbHFNd1U1UitWczJ2VEZxcjdrNFpVclcva0xqMExo?=
 =?utf-8?B?Q3g1MndtR0p3eDZQbTlUU3JhKzA0eEJkSmRmQ2VZMHI5NXUzUURFeGFlQ0ti?=
 =?utf-8?B?Q1R1TGw3RW1DQzB6aU9sRlZOYWh0SllQRGhaTjJURnZxREdnb2lyTUZQd2tB?=
 =?utf-8?B?MXlNTEptRmJScWNmeTl6YjdTT2paUGZMQnM2TmNMTGFHd2J6YkFLdFVjeHlK?=
 =?utf-8?B?alNCcytsNEoyVlhkQ2dWbjdCcnVuUERrTndxNHRNWUYrZUt0TzVUWWE1VU5m?=
 =?utf-8?B?TFNMRHBSemV3R1VuSUYwQTNyejBzWDZDSGFhbSs1RDFvcEdwMmxxZkp1UEZs?=
 =?utf-8?B?WlQ5UTEyZTdmZkNmK2pzVTFoMTE4a2Vmb3BiejBQdFlxSVdxUzZocVNVNzdE?=
 =?utf-8?B?ZVh4UElZb3FpV0hIaW9vSG1uVlIxMit6ZXRzSW5mdGd5MVJzMWxBRGNEWHd2?=
 =?utf-8?B?RUNEc0p2cGp3ZjRzK3lwVDVZQ3REeGRIUFVycmpHcHh6ZVFVcHNxeXgzTXJE?=
 =?utf-8?B?MTB5MW9nNWwxK09jL2Y5bGdlNmNrNUhFMjNnSkNQYis3aFVDQi9zcmZZc2lv?=
 =?utf-8?B?ZFJza283R09zR3hicGFlNG5WRXFUUjBBZ3dybG9QblM4eC9lb3p6RjQwa0Nv?=
 =?utf-8?B?YkZMTnVXcVBKTHZOVGxyeTkwbXdTcm56bGR5Tk1OYVo4YW4zWG5lVDVNaHFp?=
 =?utf-8?B?QmljZERZL1dVMW16WUFaMXZOSTdxR3lCNE52dVZSaVFtUmJrS3BOcDlScFp0?=
 =?utf-8?B?M1ZyNk1DUG4vMHc3MWpUdEljUlZpQXMrZFZ1RzErYjYrVU1udzFBN2hkdDJB?=
 =?utf-8?B?U3hTM2l3bzV2cDZTNFlWVjNJQTdFVExPY3Eza2xUMWNRRldrZkRZTzZweS9D?=
 =?utf-8?B?UlVFMTE3OTVsVUhvV1UvN2R2NFdQTU0yeENRTitCdzhxNitQUngyUFQzbHM2?=
 =?utf-8?B?K2dLU2RXL1NLWXRwSURjOXZkOTNML1lSemtVNlpNTFl0RHo0cVg4L0t0SVZl?=
 =?utf-8?B?Z1kyZkFYSXhDbXB2YnphRVF0Z1lESkNKV25GQXYrS1pmZGhBVlhZdkhzQjdS?=
 =?utf-8?B?MVNtTUZBY3J5V3RRejBYaTRNczY4SU9xdXJsWGFWUHVZVTBWT2FnK1Rpd2J3?=
 =?utf-8?B?WDBmMHltWm4zOWYrazQ4SmFTYUNwNlg1cnNzajRScjZzNkVsWUxYSHVFenFp?=
 =?utf-8?B?U3ZFTkZONnROR0tmOGdUNnY1c3N2SU1RQkIzN1JoVnEyTkJyUVp6MFVDamp5?=
 =?utf-8?B?djNmVjdNL3cycTVGRHNwckR6RFB4K0huQ1ptRlNWNGZiOHpaS21aLzVQK2d4?=
 =?utf-8?B?TTVXZGljT1RnRmE5MjRNSy9vWFZNUDM5Ukc0a2hCYXQ3Y2VjV0hKV3lWelpZ?=
 =?utf-8?B?TnI4eGRVU3lpNzJQRHpNSzVDaXRDcDYyL0dBcmF3L1krbGJlNytzQT09?=
X-Exchange-RoutingPolicyChecked: rhzVp+N+QyZhkK/xT8Fjx5p+3eh2sP0MRUK2X95RF+Bvpi46L9BH/nylJIjrwDV6MdrqJ2v0xzE19yuC3JDsYv3UvqCCWN/GqfsMPTyTroB67sTI9zFGw/PsvHeSS0MsxFzMkIJq3/OAoYcwpFJWUSgzA9evAKKn9zclqmcLEUptZexx5X03qRvIwQBA4q8Qst9glg1DIRakCOHoi1oc/cA/tXPdDHXMpkW0AiCR6k1RRKmOdO+P1ZAgiPAbMDKLit9m/w4zHIEx+XaNoJf8w5O+iUrbFtFR0hyhhgYzulBDV5dBQ9Drv18g8qsc+BKQY8zgi7TAz+E4Jg6o5ttLWQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: cfeff477-cd7e-465d-0056-08dec85d1969
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6978.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 08:32:11.8161
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DLn+eu9oIC7FF4N/g48i1Xki8Bxo0ecH4o/YND9dopUnuT0mbrCwWzdtM4M3Le60owYcW9otqsWGeXDZQ9JrfSY6WCCDeD8B3e8slqs2VrA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9013
X-OriginatorOrg: intel.com

On 6/12/2026 6:48 AM, Bui Duc Phuc wrote:

...

>> Well, maybe one patch per driver suggestion of mine was a little too
>> much.. Let's separate guard() changes from scoped_guard() ones.
>> guard()s carry no readability cost.
>>
>> I'm not a fan of scoped_guard() update for any existing code block that
>> looks like below:
>>
>>          lock()
>>          one_liner()
>>          unlock()
>>
>> Adding tab to the picture ruins readability.  The cost of tab is OK if
>> there are more operations between the locking/unlocking though.
>>
> 
> 
> To save both of our time and avoid endless revisions, here is the plan for v2:
> 
> 1. I will keep the patch structure exactly as it is now (individual
> patches per file/driver),
>      instead of combining them into 2 big patches.
> 2. I will completely drop the scoped_guard() changes for those short
> 1-2 liner blocks.
> 3. For the remaining code, I will only apply guard() or scoped_guard()
>      where it genuinely improves readability.
> 
> Does this approach work for you? If so, I'll send out v2.
1. per-driver approach.  I haven't checked if there are any non-liner 
cases for scoped_guard() but if there were any:

	ASoC: Intel: avs: Use guard() for locking
	ASoC: Intel: avs: Use scoped_guard() for scoped locking
	ASoC: Intel: atom: Use guard() for locking
	ASoC: Intel: atom: Use scoped_guard() for scoped locking

2. yes
3. leave guard() as is. As I mentioned, guard() carries no readability 
cost what cannot be said about its scoped_guard() friend.
