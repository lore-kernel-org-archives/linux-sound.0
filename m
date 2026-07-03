Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8FD33546FC
	for <linux-sound@vger.kernel.org>; Fri,  3 Jul 2026 08:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783066392; cv=fail; b=pDvJUWl7Tr690xdd5Z7TYuKYZVCm1HLa6bYmbpY+msgb+24161RyN4VW0WAD+CyX79okU5FzTC+z0uZuhFA12zrejsHQetkZ/QT08FeipoB0KqU/9tSnm3v6o0hJjGtWqAHin3t+uQ8RYe9K+AWMyoM1hdOkHA/AcasYzkivAtc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783066392; c=relaxed/simple;
	bh=IQVhJyQ+ewsBp6w5Er7Qb068LzzGn+uT6YUEMwizkdM=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=urcfyzo1ytU1Ca725UwUt6GWLjoUmMsGzt/qsPA8oPCvF+sIeecos3FnbkA4FulQnaA7QGIxyjAUomEhgMRRWUKikJ4dKX/TTtbhoCCmbv87kfMaEjJYJTqygINtmH7xK5rBXtMJBjDtxXohLf5cHignEu9dvxPrtEtb4VWpFnM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ArFzVrk2; arc=fail smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ArFzVrk2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783066391; x=1814602391;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=IQVhJyQ+ewsBp6w5Er7Qb068LzzGn+uT6YUEMwizkdM=;
  b=ArFzVrk28p6P2qBc7zEU1ZFnMF6u9zLXTDhflkQqrB/Jpa2X6R4DsRvn
   Oh4+xrLgQ1mkhyWrlPc9ByTjhjf/nce2Scs/izWmw3/pUWs5HONZdNpNt
   mJ5kVkQ95kOs8gSe3BAtTewGCcNSyHmfwNQyaUUx1ZWWz+I2z1pvojNYy
   zsO571kB71JS9HZAZYEV3P3fd9NcETh5V5gEo/mIQiuYfxG3M5Sq56tTj
   JieaAeybPyfV9YtMon6PI/ozukjqS0b3o2gIQEiSZKYcC5799AzTIfi4u
   dp3BxB4NTf5VgSbz9+rLciKEoiPYkun+Vy5mciV+b7gEgMxslXVulCW7n
   g==;
X-CSE-ConnectionGUID: Bq6sTZUySAGLuNDC9E4j0Q==
X-CSE-MsgGUID: 3I4cWImYQCurSEYfzBh4xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="95193034"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="95193034"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 01:13:10 -0700
X-CSE-ConnectionGUID: Ze0TGPfTRgSup/pDP8GhTg==
X-CSE-MsgGUID: +8w6lbdBSJe+yVqabGFS+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="283147970"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 01:13:10 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 01:13:09 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 3 Jul 2026 01:13:09 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.23)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 01:13:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lDXAdqlnfO5IkzvAQnLmY6SI/bNewfyQx3ormvFWFl80hgzI8vz5ehWcuSGsWfUVfF5gFFkRL6ZZzGsQAT15aAZBOxWXwxOz/+9vLZ9FknZhMhtbr5A8+hNNYE3OctYZXKh88S57fr79PVxUKFI8kOma31fZngO8+HM+EYyKsXgecoBfzru/3gmzGzhxcp5vw3zduSTa6vfzXyVYx53Wmekbb1vZLhuUoHBImMP4XCcSyDkL/1nVfIQunnCjXhKv15y0uWn9J6COEuk5QckGjPJCMEEeSN11quyKJWomO+x23dyrZqcyDEnYJw+3Kde55+pMAQyCLOZ/0FJHOqSLpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EwnzWTJuQln9NkKhBrmSBdJ8x/Phq15Dx52j4tu+wBU=;
 b=uS/tZ6PGBRLy55sSZX556Ca/1eQS9157A0VFqSXvxjVwCIIvbTMl7C8IQyXiRPudc/x6TFXcZ4VpyLtTEcaxfzsxQG0wsUKgzjin/rqFtlNcJekE+cDF0LTB5jtUaf3hLPHvk5vntSt/tp8y/TAAGrZjTcuq67LGpB5S5Gu8JLK8V2droGrzWA91/lSoTF3NIgZcIBeFP3CdKlZv38DPh0hoH1xS+hn2/9j+oeDe9Rzr5icqYeue7gp+TmjWy7EPPQHFw0NvhL79KRbPK0x9QNwBtxHcSpCmFvOJESLDtPTBlgp1hozygY/MOMUd9qrpwtQgKokZt2/ZcnvkNEF4FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6967.namprd11.prod.outlook.com (2603:10b6:806:2bb::15)
 by DM3PR11MB8716.namprd11.prod.outlook.com (2603:10b6:0:43::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Fri, 3 Jul
 2026 08:13:07 +0000
Received: from SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4]) by SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4%3]) with mapi id 15.21.0181.008; Fri, 3 Jul 2026
 08:13:07 +0000
Message-ID: <52993b7b-d8db-4ca2-92b6-a23e6cb05b7d@intel.com>
Date: Fri, 3 Jul 2026 10:13:01 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] ASoC: add
 [devm_]snd_soc_register_component_with_name()
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
CC: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
	<amadeuszx.slawinski@linux.intel.com>, Bard Liao
	<yung-chuan.liao@linux.intel.com>, bui duc phuc <phucduc.bui@gmail.com>,
	Fabio Estevam <festevam@gmail.com>, Jaroslav Kysela <perex@perex.cz>, "Kai
 Vehmanen" <kai.vehmanen@linux.intel.com>, Lars-Peter Clausen
	<lars@metafoo.de>, Liam Girdwood <lgirdwood@gmail.com>,
	<linux-sound@vger.kernel.org>, Mark Brown <broonie@kernel.org>, Nicolin Chen
	<nicoleotsuka@gmail.com>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Shengjiu Wang
	<shengjiu.wang@gmail.com>, Takashi Iwai <tiwai@suse.com>, Xiubo Li
	<Xiubo.Lee@gmail.com>
References: <87v7ayxk3s.wl-kuninori.morimoto.gx@renesas.com>
 <64a890c1-5db9-4bfe-bf28-4ab5e4d1b1af@intel.com>
 <87v7aw64xb.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <87v7aw64xb.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIVP296CA0103.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:355::17) To SA1PR11MB6967.namprd11.prod.outlook.com
 (2603:10b6:806:2bb::15)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6967:EE_|DM3PR11MB8716:EE_
X-MS-Office365-Filtering-Correlation-Id: 18b87cd7-d9ad-4c38-62af-08ded8daea01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|23010399003|5023799004|11063799006|4143699003|22082099003|56012099006|6133799003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: mHeohyxNZVp+W5VrlGkI9B3+a4wKf4LtoS2oidGYcxac5nXSGlnqCG+h9bYVKAtGdLnT79odxV58gAO+hggkiOYWJbYjoSuN4jQiKcL6CQDUWV0f30rnesro4deie5QGetcYQHLfkB9+/wt1aJJ/RXrA+m0X6Za8etUo9pEgweG1+SScc8iLZlYj/Yo+HwwXxdF6K9z+okGS294hOI9cLjYkBxAOi/+GI89KNlpYKQtNfdsJBpjewXbyNDmHndQoGl+woMt7/XqZPYicjPkijqqmFE193KaSKeAZN/ZN42aMuqX53p9lJK5QbTFfcNdmmk0RwQZPNRLoWoCfnTRL+xwQBysXqQu01z8bCOHTlFn8kZYwdbyFk7WXO4WUzoYGLTpKy9JBQsqsgGDNFUFrf1/j84ht8rML6Xl7pAiuA8Ur3H4HPKaRSTzg0ZvCRLDWaitPOyfCyRr8JBDut4YFdQNpDdR8UlSvoy/xn04LoYeRovZHVRi0NK9YHEhrCLswvnxSfcR/btF5VFoKouy6mD83amYn6K32VkqShU1XIhZebsHGnWJ88ujb8/KOudJ1EjUY/hMQiLmOzisCKbDU3Oimezihge4Dh0HU8582fPe/Q+A1JDfeYe5YUEqKvTqK6XXB5mnbZGlt4jQObZgzIwg6NPSzkoLKOjx9u9a8xYE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB6967.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(23010399003)(5023799004)(11063799006)(4143699003)(22082099003)(56012099006)(6133799003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TDNjL0wxRVhOMzR6VFZIK3V1UmxodWtoWTdTZjQwYUlJSjdUVFY2ZjBxNHFu?=
 =?utf-8?B?MkFic0ZiVWtNR1FteDRlM1U4RERmUXdaQ3lOYXZJd1VVUkZLK052TTlqNjB2?=
 =?utf-8?B?L2g1TEdmR0V3M3RYc3JNWUhTTldMUHZ4TXJsVlljZmRneEFXanV3RzV4MmJi?=
 =?utf-8?B?RmYwWnZSZGpSMGNyZ1J3T0FFWHl2NjlGYmszTm5lTEo5eU5PMTFuTTl1UzBu?=
 =?utf-8?B?TmVHL2hVb1B1WXFrRWg1WlptUWtzbCtnNElqdENaZXB0aytUekpjOWpmNVVN?=
 =?utf-8?B?WXNyMTJYb2plZjZiQS9ldzFwMm9DOUJ2ZXBFcW1QZVNNam9DSWtmcSs4K0p5?=
 =?utf-8?B?UjVDZTlDZUJKU0gwT1VYUGIwK0RLYmxaQzgzdkZlQlQ4R1pLTWZRUXZOanFV?=
 =?utf-8?B?VlBWYnJSWVU5S3RISUJEZThnYVdXRzhQODNaMzJFS2hSREVVY2tWNUdGdnNQ?=
 =?utf-8?B?TFczTkEwT3J5Q0ZDTS9pUGZnQ0FoUEMzQVJBY2MwWjR3VUtUc1FnUU4ray96?=
 =?utf-8?B?TWo1dEV6SXFjbHJOMjFUSUNOaDZ3RWlYM1N0eG1TOS9FK2xNcjVCZm91T2kz?=
 =?utf-8?B?K1ZpcXphMWVONXJOb2xwRmVUV3hxVTQ1QUxKMEpiK1lpbFFlbk9DZzVWUkdF?=
 =?utf-8?B?bHQxdXpGUHdYNEVJRXhJcUNoREg3b2NROWxad09RTVI5UVNNK053UlIwYWUy?=
 =?utf-8?B?VlBaaU1icTdVdU5DUDhESGFVSjJqemJVNG9NK1FzbGNRR3g0d2RRVzVSalFx?=
 =?utf-8?B?RXZQK1dkWU9DcDg0bTg0dnBkTDlBQXI0SFI2SDZpcXJWZGNwUXgrRGRvWENj?=
 =?utf-8?B?Q3lmMjJGVjVNbWw1ZXdMRXlJa211VnkrQjRqRHhGMVI2Y1RGMTNnT3pBSEJp?=
 =?utf-8?B?WEpkUzFPTEQ0alhyQUh2Rmd6Mml3QjZOSnRHQm5Lb0lXa0RVd2l6S3AzV0sw?=
 =?utf-8?B?dVM5L2g3TmNGT2FFZHM3VHlldTlrNzBDZCtPRE1mMC9sNW5wTXRaKzRzUjg0?=
 =?utf-8?B?dTZzMUV0K0duNDZHRTduYzVUMlozNE14eUdGNU11MUQwY0cyQjZSNU9FZ1V6?=
 =?utf-8?B?Z0ZFQTlvVC9zTGJneGgrNktTNUlMMWV1K1Fxc1Y3RXpFbEM0K1lCRTF4OEIr?=
 =?utf-8?B?NGRwMThoMHVqbENlS2NvQzR1aTRPL3BwZXozT2RZZ2VTTXRFVW40a3BpOW1N?=
 =?utf-8?B?aUVmTmtZK2l2WjRydzBqQ2ExTkJRSllqeFltU1U1RmFkaEFkQk1XR2Q5WG5K?=
 =?utf-8?B?YStXZ01OMWZLb3hJc2s3SU5KcDZERXNneS9Md0NNVHdvWHY1SXU2OHNQN2s0?=
 =?utf-8?B?Z2Q5V0F6TmpPdGZVVXo0SzlwZmh1cmh3RjVQdVVpVCt3VzU0ZFdyVFBYOFlI?=
 =?utf-8?B?d2RzSTF6SWFEN2k4bi9zZ1FtOXlPSjZXNEVBa3VJWEo0NG5OeEtxQjZNZU12?=
 =?utf-8?B?bFc2cDduN2YxMFNqcEVrZlpwNGJPTmVleW93a3Q4MUgzb08vajhVTVRFelpy?=
 =?utf-8?B?RmxCdjg1ZjlGc0U1dEs0VjFhRllhK3FHc2RiZkdjTFh1NGFyYThaQ1UyWWRt?=
 =?utf-8?B?aDNkZlc4NzcvbWtqMXpwTUtMcUZkb2dSQmgycDZhYVZOMHhEcThJdm5wbzYr?=
 =?utf-8?B?cnNkUHlaMXZISENIZnNvZFF3d1BmNVl3VEV1WXJSYWV5UXV6NVMrcHhkVlpW?=
 =?utf-8?B?d25RQStYSVJvdWpLbHFGeTZZS0lQWHZHZWRnWTIybHJsZU9OL0oyZEpPVFd3?=
 =?utf-8?B?cC9EdGhyYWZHbjBoZUVyQkVVZWpPaGZCNTd6MXFCRkdYSGFIMUNBM2hGM0pY?=
 =?utf-8?B?WE4zWjQ0bWhqb3ZmRVYydVJXTkVQUHczclB3Vjduc01FKzZmRXhBcU9WRENo?=
 =?utf-8?B?aVBWNzE4S3d1U0FFWHkwanIySGh0cTk1K1ZJVFQ0VTZhMi8vY0VtaGlSOFF2?=
 =?utf-8?B?R2lwb0Y2QXJ2WWVrb3NyVXh0aThoNjR4Q3NjVDZEVXJhcnd2ajViUTFlN2M4?=
 =?utf-8?B?cDg1bjgrMzhMaG5NL0NXQ01rb0hPZFMzSldwam4zWUxsbTVtYkRwOGkzemVI?=
 =?utf-8?B?RzlqVXk4RGpVOEFzNndocndpNGpRamNCZThsMDFJSzl5SEowRkJnQk5ybDZ4?=
 =?utf-8?B?QWVuaHF6TzV5OGlsY1IydlAza0ZWMHgyTGoyQW5HcXFpbG5uMC9qREZFdUtF?=
 =?utf-8?B?ajV0b2phK3MvSUs2d1dVbDhucW4wQkNrZ3ZPR1N3YWwrTGJvT3BMbGcyODhh?=
 =?utf-8?B?MFBGdkdsbVBhMngrZG85ZGZjaEZ2MWtTK3QvR1Y0TnZUNHVMS0N0VHppMGhR?=
 =?utf-8?B?UmMveXNZYnFNNmNtcnVmNjFDcDUrQ2t6eTE1ZGhOU1BjVVIrdlRFck1XUmZz?=
 =?utf-8?Q?B52ighE1OYrXNU7c=3D?=
X-Exchange-RoutingPolicyChecked: lVAIGrw8tJOg460eB1ka7m+0IRIGv5Z5yzK99XXT33KLrpN0kO0vj266KuYtZVDjmTJ4U/2TKUs3HIzfmPMZ6uUCXCzbbPxy2D2qODhfkly9BU6YzTrhN1JJMlE65DS3Wzxxou7kWRz7BKJgH4GuMH5YWRp5vpwsl7/MYdZvXp7kWYH2BljtfJ9jOhXOLTj1zImV0A5gwXNgvp1YpCKawxzV0of21Euy1rA4qTTuq4875PA/2NbJPQz1F/EjE37icGkiUMAwH2/tpyy7KSOpwCUNy7v5zUx/S5zVDeyOXG8BAlILO+siOTi048l5V0xcmRgz/2HxcpPL+7Rp8bMzcw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 18b87cd7-d9ad-4c38-62af-08ded8daea01
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6967.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 08:13:07.6322
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jM6RHY1+UCK3YlxYL0F+7prgG7WXIX9j1r/82DOwHTLdQ5pBLAjO+1Mv0Aix8T8zlOAkAAjvY256UAcRn6OFt4HA6VytoNKXYZXdHLr+D9o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8716
X-OriginatorOrg: intel.com

On 7/3/2026 7:03 AM, Kuninori Morimoto wrote:

>>> Current component has component->name, to setup it, user need to use
>>> snd_soc_component_initialize() / snd_soc_add_component() directly
>>> instead of using snd_soc_register_component().
>>
>> While I'd prefer the trio (init/add/register) to be left as is, with the
>> register function getting updated with "name" parameter, all
>> snd_soc_component_initialize/add() users could be moved to
>> snd_soc_register_component().
> 
> My plan is like this
> 
> 	component = snd_soc_component_alloc(dev);
> 
> 	snd_soc_component_attach_name(component, xxx);
> 	snd_soc_component_attach_xxxx(component, xxx);
> 	snd_soc_component_attach_xxxx(component, xxx);
> 
> 	snd_soc_component_register(component, ...); // = initialize() + add()
> 
>> I've came to conclusion that perhaps seeing the offending driver will
>> help me better understand the need for all of this.  Could you point me
>> to driver (or drivers) which triggered the entire notion of privatizing
>> struct snd_soc_component ?
> 
> Not only Component but DAI/Card, too.
> And I forgot detail driver names, because I'm cleanuping all ASoC drivers
> (= it is over 200). But basically, from general theory.
> 
> I have talked this topic with Mark before working. And he have agreed,
> and mentioned that he had been received such request from other ASoC core
> member (I forgot who he is).

Well, now I know why other people seem to avoid the (very important for 
ASoC) subject.  Given the scope of it - literally every function and 
struct - I'd have preferred an open discussion.  I wouldn't mind an 
opinion from owners of other large headers either e.g.: dd and 
dma/dmaengine - is this the general route the kernel is taking -or- just 
the ASoC thing?

> But I remember that some driver updated xx->id which is set by ASoC, and
> driver is only allowed to reference it, it shouldn't update it, but did it.
> And/or, there was a case that if you want to update some member of them,
> it requires to call some function after updating. And this must be done
> in a specific order. But, not all drivers did it, etc, etc, etc.
> These issues are already solved. But there may still exist which is not yet
> discovered.
> 
> If people access to member freely without any restrictions, issues cannot
> be detected at compile time, and makes cleanup and/or updates difficult.
Provided there is a getter/setter per field, we won't avoid the runtime 
problems - one could simply replace xx->id with xx_set_id().  It will be 
easier to log/catch the problem, though.

Since you're about to touch most of code lines in sound/soc/, perhaps it 
is a good time to do something about the prefixes/naming convention. 
The headers I've mentioned - dd and dma/dmaengine - have rather short 
and crisp prefixes.  Having to do 'snd_soc_' e.g.: 
snd_soc_component_xxx() (repeat for all other ASoC types) every time 
kills 100char limit quickly.


Kind regards,
Czarek
