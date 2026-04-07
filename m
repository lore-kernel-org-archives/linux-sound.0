Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC5B03DBA0;
	Tue,  7 Apr 2026 19:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775589156; cv=fail; b=FtsLUyPUgrp75otFkqBLpWAofXQi87nqp+S6Z3Rggv9wrd3YGJ3INzAv4G69581K3sCNSGKSF+vsX+gc/Nugq41BYNzXy3bibG3/gdJ2JERIylIb3sDIPH/jEaQocqSL0Es02tSSSQbHIME/0Jm59c0FUy0lYpQhNIUsS5NNN/0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775589156; c=relaxed/simple;
	bh=DRRLSBpRiaFIAnakZUg4KW1hC6bW36vP1zzowfFaivw=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=c/6PgK3W6T1Za4dkiOCGS4T9d99ZE+2ZCkOXVLJrTOR6Hk4CHf3VBVGPmZSHaLZ+wrBvqg5gQfX6/A3Hia3hiP9xJwrc1Pw8pmhbENeIkEBdaOY0Hovwi3xIAj55viSN0Oy7H84lssUQMmERb2JPeQBu88rvzqNgB/8QdeUVZLk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZnUXHe35; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZnUXHe35"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775589155; x=1807125155;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=DRRLSBpRiaFIAnakZUg4KW1hC6bW36vP1zzowfFaivw=;
  b=ZnUXHe355suPdN9iHlVN0bXgKUmQpGZOFOv1OIozTXKIaUPnd/6wkLNw
   9+DhfEj7Qi/qouzLXJIpjwH4A8fg0xOqobge3FpBm3fxwigGGGGcKSkcR
   ynaEjf5s/wFTnPppZdrlv9JHzgNhJFI21XPS923fEBHS/ZUYRL3yW2c6Y
   erNcqGp2+dm4djEHidh8ahhOWipjp1nOpOb0HjRj93G9FNvZWoLnbiPrq
   MeejKsNA0aZZqrhWiQJ/HNTkHlw2T3+Qtlin7e1uC8Fv7zzXg6U2d2IXu
   5llLSd7RcThm5mepG2+2g95oVFgKN4NLUyPzzf6e4cT/PFxZ2yB0C1j9C
   g==;
X-CSE-ConnectionGUID: +6U/XOLaTZWRxxo7fis96Q==
X-CSE-MsgGUID: QoEilfeRS/SJbeY3Q8nYrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="79152815"
X-IronPort-AV: E=Sophos;i="6.23,166,1770624000"; 
   d="scan'208";a="79152815"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 12:12:32 -0700
X-CSE-ConnectionGUID: ikBah57tRUW2GZTjMmzmyQ==
X-CSE-MsgGUID: gE9ozOHnR5us9V7c5UNkYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,166,1770624000"; 
   d="scan'208";a="229919499"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 12:12:31 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 7 Apr 2026 12:12:30 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 7 Apr 2026 12:12:30 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.20) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 7 Apr 2026 12:12:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SM85a9yGZwTMay4DVnX9qQc3TJFpg6nqu/SUwQY3xAVR4F6a/BQkNwzpzC0jpmD8h3Omat69YWdNgSFDSuAcopUf3+bTT6Bv3CHIXmDWJPQxG6frajj1l5+Q67BogHm2smHbHRwUgRu4SWhvI//5HixS7AxQ4ywKj75/UZ2kFFEwbRSCYJwoFyrJw4XIKt+dJ73SQxrw59xzdyxeoUF7ECShraGNCZxCNxnIH3Gwh7d3P26HkhOx+MkZ9QbsfY+ZqD5czUOPknbAacFmSgDNvpQvPDMhZGEHmQp8H13iL9pKx1vLEA30MBl8tpHRcSgWfLuAS18WbIy9MG1Axsbuug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n1Q1ecmr27Z3BewdkBl2KubD+nhwidudt97cyc3Rgkk=;
 b=fxd/ArLmusWGlP8iBv9KmNeXYXF2j3OF9HqdTwx88RdpQspddQGQMJFicG9zTgiaqmxGWEhCeZEiF98Vrq8KXhmbZBb+w+cnSe6/btALS5wRZLpknNtE3Jbajm8dcBlyGJ0mm0ozV89qQMLxq9m601DiL3CTZ/lEOZkyjqjBbVL4nZpwuXPnW8RNbft7oGMjNH7654ien5OfwQk9K9jVk0QUfoxqAR/WnWIr3o8FEj2qGlmlmt0qc8VLNyRTHhRO5KUjNz0eSWR4Udu6av9WxHgFsc4W2zIJbuBV9c4uSYj6epN1vpj9C/rMNF3Uvwicx0DL2ZdrvrhNKlMmZaAiHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6967.namprd11.prod.outlook.com (2603:10b6:806:2bb::15)
 by PH7PR11MB5944.namprd11.prod.outlook.com (2603:10b6:510:124::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.16; Tue, 7 Apr
 2026 19:12:26 +0000
Received: from SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4]) by SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4%4]) with mapi id 15.20.9769.020; Tue, 7 Apr 2026
 19:12:26 +0000
Message-ID: <f9af61cd-9687-4f01-9562-79de0c9feae4@intel.com>
Date: Tue, 7 Apr 2026 21:12:17 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ASoC: intel: avs: Fix type mismatch in variable
 assignment
To: songxiebing <songxiebing@kylinos.cn>
CC: <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "kernel
 test robot" <lkp@intel.com>, <tiwai@suse.com>, <broonie@kernel.org>
References: <20260323032745.281611-1-songxiebing@kylinos.cn>
 <20260325021752.238203-1-songxiebing@kylinos.cn>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20260325021752.238203-1-songxiebing@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA0P291CA0014.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::19) To SA1PR11MB6967.namprd11.prod.outlook.com
 (2603:10b6:806:2bb::15)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6967:EE_|PH7PR11MB5944:EE_
X-MS-Office365-Filtering-Correlation-Id: 905e2535-8aa0-4aa5-f476-08de94d99aa7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: HMLjdRGTFB7FjTyesjWAHG7SgPA05g5vmEJfS8oto7jIPP1Qlabu5tz8z0Qb2KAO6kGSZnuaSHqOKiYQ3Hnq8XE+I4H/5tDWyRmke3SJhtzgm4CDLAB6c8vx8NK0XFRqLk/1HHj2q+lKnN2cccGnkxjbvZuAVo1BXyHX67wfAxy5HDGOInsfXjwUx88W89ABridlp7mBn7H2GCGmAL/cBjRmFntw2MVw/4s/NMWsIqQ3KAhuNr+EMwDL2dr+O/JKcY35/bOWtqyrBFk+TcLu86BddC7ukWYBMEQvVRnr5FhIPlChjBKnGhEi3e7Jwhf4Zi+IeqRHt8MWud1mMGk/XKGvW2SQkOjOmBdGSpfBphvwij29SrxBJCHVspx6PR67hyVPNCPkAXFnhfCY2BVlIr9SEEvr7s8sZz32Qmljv5jcs77xbl1GUq5f+1JHWoBE9Ufw/AZgr17jbnl1691p6SnZuFuEyAdqb8/zABJo946Pa8NQX9XZVWkzZWLEWNVLS2Dfrh4peuREKvT8AL2JwwEXP6pcIZuiEPSi+/dR2lHZ8/16uHQ5pHo/GnFhbr7GTA5KKMflXxOwj2j33xP135bkyfMyht7zQ38U8ayYQS+oNpRJrfxBoDVc+i1dNxUerTrAfbA4K+wk3MnM9TpF9sP+JBd3Mgi6hsbYEG2dR7hm5seTghknZnXr0R2KBb0eZ//d8K1sw4yClUBA1Z1wYoEFjtkWOF+k0Bzslv5K4QA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB6967.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZkdNMCt5WnlrRTQ0VGNsWFJPNk40bHErb3ltTjkzMFVBYjlIVWh3bDBLQkUv?=
 =?utf-8?B?UWxubUFYMjE4NXdxWGpadXlwNU5IdllRU2dwdFE0bWozUERwV0J6Nks1QzFw?=
 =?utf-8?B?NzJxeGJrY3dOaDZaMlYrWW1yZU1jUFNuWDJyUkVqMy8ySWN6aXQxS3dMeW1i?=
 =?utf-8?B?YmJ5Y0pJTEswWEE0T0xZczhPblZ3VTJyNUZKVlNITnZDazRsVDNxVHhIeEdr?=
 =?utf-8?B?bjhMaFdYZU1iUEl1UDFra09aRDdYWnVacklYdmpBV0pOaTJlc0pIdXJleUQ4?=
 =?utf-8?B?U014ZkhWRFV2UVYyaGw4VTA0NTZ6dFVXdndNU0U2RTZzeDFkbGluKzNjZW96?=
 =?utf-8?B?V3BqV0FIUmRjQU42REgvUVRCWTM5di9pTzRYeUp5cHUvWnFsN01HdGdWa0hs?=
 =?utf-8?B?aGJPMExkcWRJQ0RzVlpMS0lYaEtxWjRZNld1SVZvS1krcDRUbzlxS3Ryamlt?=
 =?utf-8?B?ZXJXQitGMXEzekV0cXZQdnRURk9RU2gwaXA2U0svVThBU0lxWkVpOXFZTzh4?=
 =?utf-8?B?azZJdkVGbmZMUW5kdXVEcXZtckFzcHN6eE5ZODZWR0d4RllUTjVUTGxPY1g3?=
 =?utf-8?B?Vm53STkxakJlYWNTenFGM2E3Mm1ZUVJwTmt4R3BYc3Q0K1pLTnlOUDVvb2pI?=
 =?utf-8?B?VDQxYmFFWlAybEU3REVQY1FNZTRVRmRXWTFORlZQVFB4UWxHNTY0dVE0RUc5?=
 =?utf-8?B?VkZxWkxIRHVXb3BVVVB0bjhHbVB5YnNHelJiOXF6SWpJaUlnZVAvY01PTXhM?=
 =?utf-8?B?aXpSaU4rSXpISWhQUWE0cGxkWjFJdk9PODA4NnN0NUIwVkhmWnZsR3VXRmhs?=
 =?utf-8?B?NE9QT3RDOVI3NS9hZDRCeXR5VVBtbTZUeDQrRUFoZnA5QXowaWVOaUZ2a05s?=
 =?utf-8?B?eWd6S1B1MkRGbU9zcGhzNGJZbmo3a3lMWXRJT0czWlBBcTFHUWc1bnB0Z0pT?=
 =?utf-8?B?WDFIeE1JSjlXeUFCVFQ0ZUl1QlRiUW5EOURzemNhcGRvY1U4OEtqMHpFbkM1?=
 =?utf-8?B?MnQwTnN0VXdyV0FiWE4wNUpzb2VZUEtOM1hDRlJiclo4ek5NYkM4M1ltamZV?=
 =?utf-8?B?STFKSGhQRndyYTlPSVpTNFNDb3oySlEwZ3R4MXFFM2ZWZkxuK3Q4VFcyZDF2?=
 =?utf-8?B?ZDlzNjBKWVlYczFsd051dUVlMjd6WlZQblhzcTBWcStXUnFZSEtjVlhPNDdG?=
 =?utf-8?B?WU5aM0FJZHlhS0JNbWhtRkNFZEJvcitqUHEyMmpMTkdTcFc0aTJmUGdYL0pr?=
 =?utf-8?B?UWN0VU1PTnJLT0FSamhhcmpCOFVUdzZHTXVFc054MzM1WGYvbWxHOEp0b2VE?=
 =?utf-8?B?bHhiME5BZllYZTlCTjNicjNpNXhVamlyZHhCUEtkRlAya1VIVngxeU04TFZp?=
 =?utf-8?B?Tm54NkQ2ZkptOHpyZy84eWtJemRkdGNNR3FWWTZUQzc3MWN6aExKLzAwczA0?=
 =?utf-8?B?R3B0UzlvUEFDUTFUWmFvMU5zZVdJTE14R2Qxbll4ZGYxdnlicUlPdEZTQTBH?=
 =?utf-8?B?TmRzb1BFQXJZUFJsMkpZWmhkMlVTbWJHMmt2ZG5qOFZ2eVp1NVAycklVbnBN?=
 =?utf-8?B?L05PWE5OcjhuR0pFdlNXcUc3bFkvTmRpUzVWWGdWTVcycWd1bHEvYWxla2oy?=
 =?utf-8?B?bktwM2xnemw0VjgxOW52MTdnRDhlVUdQY21HRjNZbC90TEZRUmN3MWNtSVZN?=
 =?utf-8?B?SXFyTE5zckpnWmZBRGJOa0JvQ1lub0xSejlRR3BWMTA2TlEvaVkxSkRjVUcw?=
 =?utf-8?B?emxXcEQ4SDZtZUVXaVUzSGtPU3FMcENlNm1XN1ZwVFBjeGRrVXVtenIyV0V1?=
 =?utf-8?B?R2JkMGF3YTE4WllOM2tsRGo5Z2xuS3lweU05N1oxOE13VzFaWE1oWkRiNFlp?=
 =?utf-8?B?V2lpZlRDeWEzSkg5dG5XUmwvWnkzRjBpMlAzR1pXT3YrTnVCMmgxMGRkOTJW?=
 =?utf-8?B?b04zMjBYbTdwWit2LzUySGkwTlNZVU5nU1ZmTnV5OGVHWW9uQVlRaTdFV0Yz?=
 =?utf-8?B?b2dCYmR0UEJRejFpejc2Q0p5ZWxTUmxybzU5OTdrTTAxRmtaRmhJZ3k3MDBi?=
 =?utf-8?B?dE5qeENtUjhJenpKTGQ2dWpBbU0xNUh3UG1vZnpPencvSE5iMllFYXk3VHpC?=
 =?utf-8?B?dmhaaThIeGd6bjFyRFpMQUxWeUNIT1dzZ1c1OW9tTENycnpYUGhnYndlWm9l?=
 =?utf-8?B?am9UODhWU0V6V3NHdVA5L3lLQ08rWHd1bDNRaXpoamdmM1BxTERianNCL25n?=
 =?utf-8?B?YlpYcHBaZ0VERGozK0lZUkRHalNDTnhRYU83eHJ1b3RSc2d2bTRlaldHd3or?=
 =?utf-8?B?L04xVFV6bzFObldwd0lKVjJlLzF4WVN1a0xyWU9OYUNNeERXT3FOSlQ5Z0hM?=
 =?utf-8?Q?4h/q+EDLP8wDp+Gs=3D?=
X-Exchange-RoutingPolicyChecked: c/GUn3mLVJbm2TUaayiv+T84CLhHhaBQnI/D9iXgz/Jx+c8MmvIbqveQlF6hgYDoMr/0M/1RUhV+iZVuyLawRC7fmtSHkdCqQF3862nV96pcLSJLhziAoVvjTE15dU7SRR6t1GIYWYXPQSUGqBUOT88105rkPhcTNjUq54PWUWcUjET2OeEyplGg901OhOSLVuDMsNsRvhLhmaBIHB/xkLNbzgXxcunw4kMNWL+FtJHMBrONknbbkwV8Q78I9LA2+YNxRlzcj87li8UMzwZKO1oB6vNyXRLaTWoQTe7zggTe9/qhkiKpI76YU9tg+U2IPnsVOM0Z3jUJEWRN2L9BzA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 905e2535-8aa0-4aa5-f476-08de94d99aa7
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6967.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 19:12:25.8091
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7M0bbwUfEutXaZsHNm4qCQxD5EFJL7drR2cak0rYwF72OmvQlUw/YgaDV/G5SeL6gjkhKnpg+/F4D+dOuziMREPCQSv7WkW8YV/hmTuMS9I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5944
X-OriginatorOrg: intel.com

On 2026-03-25 3:17 AM, songxiebing wrote:
> The input parameter requirement for snd_pcm_format_physical_with is
> snd_pcm_format_t,but params->codec.format is __u32, resulting in a
> mismatch error:
> 
> sparse warnings: (new ones prefixed by >>)
>>> sound/soc/intel/avs/probes.c:147:58: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted snd_pcm_format_t [usertype] format @@     got unsigned int [usertype] format @@
>     sound/soc/intel/avs/probes.c:147:58: sparse:     expected restricted snd_pcm_format_t [usertype] format
>     sound/soc/intel/avs/probes.c:147:58: sparse:     got unsigned int [usertype] format
> 
> So here, the format is cast to snd_pcm_format_t.
> 
> Signed-off-by: songxiebing <songxiebing@kylinos.cn>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202512190032.hnwn9mCV-lkp@intel.com/

While I see that this just got merged, the signed-off tag shall be the 
last. Other than that, looks good.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
