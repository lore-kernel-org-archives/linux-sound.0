Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5FB63D953C;
	Fri, 31 Jul 2026 08:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785487205; cv=fail; b=LNcd3emMJRLojZ3vCA2hbE54TDXKcBU/w4cbhlKMHochRZwaR30t35UaZqAKpvB0jnBHxC488nAFAeY1f1rPWar0xlcsMmHfGPvr2v2yqcMtjY/I8Tr0MubGG/JVQ20umvOO2f3mUpsk8JL5S1atxsO2qWhDOC//vJ1MVCqCtWk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785487205; c=relaxed/simple;
	bh=jd50DQc/t98TdSp0XvvX7uZSQ62hXTi2n1T7+ADp6EU=;
	h=Message-ID:Date:Subject:To:References:CC:From:In-Reply-To:
	 Content-Type:MIME-Version; b=qsi3XsEHoRMj4eapAZp8ktlFU7dIKjH2WWJCKP2FklSitUoSfj3c/5e4pMdqz0SRW7ZNXrxJNFT7mw8dyx+yQV5l8ZG1O5GdMcrWinY7q/a+4yQY5EPGv2/pfwfXgzrW4CP+pPb/v1Z36NzTAhvq66T2kbLI3O7vNJ1X3PiqnA0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XhCOewrt; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XhCOewrt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785487201; x=1817023201;
  h=message-id:date:subject:to:references:cc:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=jd50DQc/t98TdSp0XvvX7uZSQ62hXTi2n1T7+ADp6EU=;
  b=XhCOewrtONcfhkN6FvkGY7xX0BNWOa/S4LouHvGXmDo62/glKdjhPSES
   N1220Xtw0cseIslt5Y5alJP2FfAHzDtvyuIenTxbsVgncKWFscOFLdnM5
   AUYfLlHTPvJ9RuYMCassdwKT3eVxYZ0nJ/W84C4a3oJruJm+HVUduzpPK
   UtFWKqjZByFOBLfOFwCpdNKpcqTmgocnhUWygmGs5KI0+hYPVIcqx54zU
   I3sk3E3zN6/eGlGWaWSZugtYKlKqQ85m0AzPptgFeS5Y+bPhZGu80AXzi
   r8heFWuynx6IsNyVOKDJPpzmhIH3R9OUSR+UAWS9WGu2EtLRJZZGYH5o0
   w==;
X-CSE-ConnectionGUID: pR9bC0+iTYmliTfv7kqhNw==
X-CSE-MsgGUID: r3TLManJRZaKyTg5snGBKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="97267711"
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; 
   d="scan'208";a="97267711"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2026 01:39:56 -0700
X-CSE-ConnectionGUID: Ptfha/MwQR6Ij8NFeSaYEg==
X-CSE-MsgGUID: BxUbmLBnS8yFISkNwz1JIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; 
   d="scan'208";a="259282819"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2026 01:39:55 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 31 Jul 2026 01:39:55 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 31 Jul 2026 01:39:55 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.22)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 31 Jul 2026 01:39:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hhkLKn/4nAw1buBua1ioUz3KtNgdwyvw8KM9GGzbHpvN+JMQ5RcJkkUsS2yyelFNt5hYQ9lrDbRaYevk9/I56xZcZ/nDlTRkIL/qqquNXjRW2n7gZVwwWy48NDqn27BGIv1sDizyV+0bVYxPAD+XUcWjjiE3xqxvtunQ/816PhXg2Xfil5Qm6++vyxaMjf5DXWyoM1JNLlODI/DQNrZj2dabLJQ+ueZTRLNjCV4QZnd9nKAIP81CSeFM/it+f1FYQ9VLZh/iHpR+1/GRqTbDknWjaechplr3W1XUpvkYW55Y3+XbKXXfRyQp2aus/CCUWuOXLR3EA/Nb0JJ87U3Oeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lKdvpX9jIcKvdlsCPR8ChGhOQWNeF9QopX/bCDIHqJM=;
 b=USAb1UfiIEcN8dJ7LCuap1Rtz3Q3U5pK1fxKznCTIOoytezNxPZ2egw73qq/KE8sBXopWsmpbJyLmIkdjGzNF+q8ysFnFvA8sXK8gAmJFlzctLND1c63xSI0161N9g2XA1RqmuMiIh3JqjAwvYZ39GKm60Xguyhzt/6VUrEvkczAT5Rqt6Igs7tAO49X/c6b4kqRY9Ne6naPJcZfRlD0bnBR1YfcfK7r7XF4VV3Ni4ESwvZQ08SqFX5JJ3RQLh/WixHwVQK5vXIlxHjQ4hopgVNL8QTriv4UqL7bzXWHdEOmTtliJRBfj04/ztoq0ISQr/9h9MvBWxW5X3c3nW4yLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6967.namprd11.prod.outlook.com (2603:10b6:806:2bb::15)
 by DS7PR11MB7692.namprd11.prod.outlook.com (2603:10b6:8:ef::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.16; Fri, 31 Jul
 2026 08:39:52 +0000
Received: from SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4]) by SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4%3]) with mapi id 15.21.0270.012; Fri, 31 Jul 2026
 08:39:52 +0000
Message-ID: <c1ac7957-dcfc-42b6-bb24-9aa76f9c334a@intel.com>
Date: Fri, 31 Jul 2026 10:39:44 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] ASoC: airoha: Add AFE and machine driver for
 Airoha AN7581
To: Christian Marangi <ansuelsmth@gmail.com>
References: <20260731064326.2284228-1-ansuelsmth@gmail.com>
 <20260731064326.2284228-5-ansuelsmth@gmail.com>
Content-Language: en-US
CC: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	"AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, Cyril Chao <Cyril.Chao@mediatek.com>,
	Darren Ye <darren.ye@mediatek.com>, Daniel Golle <daniel@makrotopia.org>,
	Rosen Penev <rosenp@gmail.com>, bui duc phuc <phucduc.bui@gmail.com>,
	<linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20260731064326.2284228-5-ansuelsmth@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIUP296CA0040.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:34d::18) To SA1PR11MB6967.namprd11.prod.outlook.com
 (2603:10b6:806:2bb::15)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6967:EE_|DS7PR11MB7692:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d1ba1ad-0b89-4570-a279-08deeedf49e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|7416014|1800799024|366016|56012099006|11063799006|4143699003|6133799003|7136999003|10067099003|22082099003|18002099003|11062099010;
X-Microsoft-Antispam-Message-Info: q5uvCLhF9tcbKZppz3lWpFOunEE8CzBx+Pt2N3q3+2v6bkPUj8mv3rWWevj5F8jx6XDf4h8vEG1N8a7oZ22dw10cIx9Vgkdq2LKQ17pZRG5+W+uRHvy2Ko31z93pGj3m4rETYchs4SzEvZov8wFV0Uek4Hit9XsKEEw43kCpWnkyMpxzFuudA6SeIDvLouFvhXNYaOzvvzwL92qLlVggG1iZ1N5OI2YZswWgCSqxh4oN5wIiMDV10XTc9CD5F66pLnx0061Lw8x90VkDen9LXgemEYFgJQe2KxaVpvqh6cVd9F9S1McLj2Y8zbw2TpHEYj8Cyq3ndVnPp++jp9z5+j3L/PGVRjJqHkW0Px5cjR+e96ppoGFZm5m03YYLMnGAnNDHsILMmFPXma1erka0s8zpDH8zWjqs6k4VzjDqRWQAGlgwQLDT8VmqlvDQ5dektuBE94lXj/Rw5Ni7K4RZ9hDn8tdlD8uFPH/tbIqavAyn4wKuG29sSxB0vEhiwsSEj6+lO2HYGyerxnu+RmtYtcdr+ZKRl1SnVEc/kosZ62vxit67ynxP0v8McEVIqyOkUWdWKod2mCjn/lmVIoPKPUkOTz7zqOf+YPEi7qqE2e5/v80ttYlCpKL/pNHBlhcxLuLW5zFSnXXNC2I+pjjWRaV09cBOC4YARX0KGjAdQfw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB6967.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(1800799024)(366016)(56012099006)(11063799006)(4143699003)(6133799003)(7136999003)(10067099003)(22082099003)(18002099003)(11062099010);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cHhUUWNiSmQyc2Nvd2h5SkdhNTFrdW9XUGRsSWcwQWIvc0dSTnVvQytWMGR2?=
 =?utf-8?B?cVVsRGdpYmpoNEJIUHM3dkNSUW00MXBRcHp0UzdIWlFTQ3RtN2FDdFZGdkdH?=
 =?utf-8?B?dEg3b0FvT1paWmNZc0RaZjltWE5UL0c4Y3FGYnByZjVITStkQTRGSDBHSkk3?=
 =?utf-8?B?ZGVNbkNtUkhPTG9qNE5BQXpWUlJRNEN5RXRFZUtKQ3EwRWVjTERZTE5FS1di?=
 =?utf-8?B?YlVUb2hDR1QzS050eE1ERHdkbm5MQkk5dnhjUzR6LzhYY2dQQWZBUzZaUS8y?=
 =?utf-8?B?L0luV3VvZ0ZhakVpUGNlYlF1NDkwVlJSQ1NiUUsvaVpyMUhVTXR6c3lGRUN0?=
 =?utf-8?B?d2FWUHJVbWVGd3d4N2RFZXNFVENuMjA1NmxnV2lkbEpXVkQ2TUE3U21zRWgr?=
 =?utf-8?B?T29YRGxab1Q5ZGx4ckhVYlBheUhwNGlZQktab1p2Mis2THE4dmVEQkRNdGQ2?=
 =?utf-8?B?cCt4ZXl4VGFjbWR6eURsbG5KWjhFelRrU2tvdHJDNDJqTCtTaStkcFZBTll3?=
 =?utf-8?B?WmhmQ3ViMk9WbjdSakNDVElRRzl2cEFneGkyVmJJQzQ2aTEzZmhUclgwWmts?=
 =?utf-8?B?OGozbDZUSGNrR0QreU0vRkxERjArT3hTNDlWYnRHU1ZrM0tPSEgzRENDeHdQ?=
 =?utf-8?B?bUJqWUxnQWxTai82ZnhjU1VhWWNDLzM2VmlaV2h5YlFKZmZyVzIvbXNzVGh1?=
 =?utf-8?B?dzc1RWdaM1AwQ21HYUVCaVBvdXB5SUlqRWRlaXVORWhCTndyNHdhZDljaDYz?=
 =?utf-8?B?NzBHYmZXS1RjVFVPOFp5ZVlObUJvdnhXVnh5TXgwa3lGemNiVGJkNlpmOHBn?=
 =?utf-8?B?Vzc5cWV6dVdad3FSbzhrL2dpbWxTa2U5b2U3U1IrOXNNRjFkTFY0VDR2M0Ni?=
 =?utf-8?B?NVRzYW9GTmJuSVdyRjN1bnBwVmRFNk44TjdJMnFHbGRRYk91aU82S0JNbUc2?=
 =?utf-8?B?UW56L0kxaGdUYllaTG1tRTNWeFd1dE10M3VSM1lqbXo0ZENWdFVEYlFpWmNR?=
 =?utf-8?B?QXNQS3ZmYW92VTF6YS92SHVxSkFuQzV3ZDVQbkZ3Mk9GU3pSdzVFdTIwQ2Mz?=
 =?utf-8?B?bVAzaVpzTjhPS0FUa1NFOFZjeEZZUC84ZnY1azBLZnZTajhGOFRKZkJHblN4?=
 =?utf-8?B?NnRDdTU1UWc1OEZwWG00dWUveTQ2dW05aDNCa0VUSVFGajNUS3g2WUlyZk5n?=
 =?utf-8?B?cFdTRnphRWVrbmhCMS8yK2txWFYzb01vZC9LOUExUnpDSWEzbnc4S2d6Y1oz?=
 =?utf-8?B?VlZEUjJEWml4bkRBVlNzZ1VwME8xRnJzc0t2a3BQZG5mVUZVT0J5SmxTSVZ5?=
 =?utf-8?B?aERXbU5VUUF6dTNDVk9xdG9meXBKdkJaVnJVYUY3V1hCZ3AyeEFmNHo5YzUz?=
 =?utf-8?B?a3J5NWRJdTRqeGdqNExjekUzdk5mMVNhR2dxeGlabThzT3dmOHFBbGF4Um1N?=
 =?utf-8?B?bEdYSkI3dCsyekdXUEsreXlJSDdza00wUmpSSldJWjJyUTlBWjRsYktETFhL?=
 =?utf-8?B?OTJ0elhpcmNTTjd2OHFWRlVtTmRyTTRzZTVWOCtWZ25IYVZpNVJwY2FZbzZv?=
 =?utf-8?B?V1pZQVFPNGdMSFQ2ZDhaTUpmVVBvVHMvTEJocU82K2tpT21vV1pyYlZ4RzlW?=
 =?utf-8?B?L3JuZzBDODUyMkl1OGtnOUYrUkxUZ3BpVkxFc1lVRG9sQkpNWFgwZ0JIUmty?=
 =?utf-8?B?dVBHcDdXOVpQWEo4UnZiOVF4R1E1L1ZuczdzT3h2V09RUHZINWlybU8rTUYx?=
 =?utf-8?B?WE9IaldydDlrYjltVDJVZENUVXc5Sk9ZdkJxc3BHQzhVakx0NmlDenJvMEVO?=
 =?utf-8?B?VHJkT09lRHp1VzRuWjhLVjZDVi9lS295NHJNVkQrS3hVcE9EeEhXTWlQU0dz?=
 =?utf-8?B?ZlJjNUxoY0k2elE5L0ptbStHUmdzZ2xLRmdscC9mV0JVQnVGcXQ0MVRJMTlZ?=
 =?utf-8?B?VmlvWHpIUFZDTTlDa3g4S2VicW1BM0tja1pOZDJPNkJOZytQeU05emFLYWFL?=
 =?utf-8?B?VHFvb2RPZ0t1Rk1mVTFJNXBXb1RnNWFGUUpzN0dsdGx2eDloUjRuWDhSMFNJ?=
 =?utf-8?B?VXlTOHBOM0prVHN1NWF1akxYZnM4WWtGSGloRTZmMTVrMnZad3B6MW1Xaklw?=
 =?utf-8?B?djVMVnVxNks3dzd1QTdEZExVMUZJQktDK0JrdXZFWCsrZEpVU0N0UlY5ei8v?=
 =?utf-8?B?bzFtWmh3SnEzSytvRGE5VjBoNUZKaCtqMVYzcGhFUFFSR20waXdiR1FzYjIy?=
 =?utf-8?B?dVFpZlJON0JOTVQvUUgwaitTWG9RWHM1Nk9IWjFEZXdyK2VickwveWVJeW9x?=
 =?utf-8?B?VGd4ZXNhVGF2SWpxOFFjOWtDcUVTdkp2NitEdmhrdHpKSnFaNWlMc2dCMzVw?=
 =?utf-8?Q?mxEQNqIoxPTtRXgk=3D?=
X-Exchange-RoutingPolicyChecked: NOrdX0x8WC7ZlaATB3jn6wkjE9IOpm/licYE5icqadsuoooPEUcd5hCVajvSFoArYT/sfESMO4QKMNxffK7Nf+16EPg0QI6SJROWYPwNNA/fKGAdqCcuPcByFthS+eAQ+NbaHNq8OW5tWG3445dO7j2jjpBHRGXa6y56y/s4GldDO1wc6DVJDN5a8n/KLSw+0rpUMhnP1YIN64h3ocic9zlPdV4lhETHN5e30ID0izsHBcojoZKnEeDIK8+z01FFe4m3o1gbUbad5okQPI8GBq+Ahnew6Z2J2ZCT1gOewLeqVsPhqeH+wSBn8johRf0o/LliADJ2jYrKTk14c5CD7Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d1ba1ad-0b89-4570-a279-08deeedf49e4
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6967.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 08:39:52.0498
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8APrZNe48PVwMwDGQ4lDHmUamX+AiMZwVyx5GaKmshylfgkz1lFgrNHo/6O28dkCnZHqsJGPlbPNFKc1JzjrHHW186VopHTlZ8DGoqUAZSU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7692
X-OriginatorOrg: intel.com

On 7/31/2026 8:43 AM, Christian Marangi wrote:
> Add support for the Sound system present on Airoha AN7581 SoC. This is
> based on the mediatek AFE drivers.
> 
> Also add the machine driver to create an actual sound card for the AFE.

...

> --- /dev/null
> +++ b/sound/soc/mediatek/an7581/an7581-afe-common.h
> @@ -0,0 +1,50 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * an7581-afe-common.h  --  Airoha AN7581 audio driver definitions
> + */
> +
> +#ifndef _AN7581_AFE_COMMON_H_
> +#define _AN7581_AFE_COMMON_H_
> +
> +#include <linux/atomic.h>
> +#include <sound/soc.h>
> +#include <linux/list.h>
> +#include <linux/regmap.h>

Sort these, linux/ comes before sound/.

> +#include "../../mediatek/common/mtk-base-afe.h"
> +
> +enum {
> +	AN7581_MEMIF_DL1,
> +	AN7581_MEMIF_UL1,
> +	AN7581_MEMIF_NUM,
> +	AN7581_DAI_ETDM = AN7581_MEMIF_NUM,
> +	AN7581_DAI_NUM,
> +};
> +
> +enum {
> +	AN7581_IRQ_0,
> +	AN7581_IRQ_1,
> +	AN7581_IRQ_NUM,
> +};
> +
> +struct an7581_memif_irq_desc {
> +	u8 irq;
> +	u32 status_bit;
> +	u32 clear_reg;
> +};
> +
> +struct an7581_afe_private {
> +	unsigned int users;
> +	/* protect concurrent ETDM user tracking */
> +	struct mutex user_lock;
> +
> +	/* dai */
> +	void *dai_priv[AN7581_DAI_NUM];

The comment is redundant.

> +};
> +
> +unsigned int an7581_afe_rate_transform(struct device *dev,
> +				       unsigned int rate);
> +
> +/* dai register */
> +int an7581_dai_etdm_register(struct mtk_base_afe *afe);

Ditto.

> +
> +#endif

...

> +unsigned int an7581_afe_rate_transform(struct device *dev, unsigned int rate)
> +{
> +	switch (rate) {
> +	case 7350:
> +		return ARH_AFE_RATE_7K;
> +	case 8000:
> +		return ARH_AFE_RATE_8K;
> +	case 11025:
> +		return ARH_AFE_RATE_11K;
> +	case 12000:
> +		return ARH_AFE_RATE_12K;
> +	case 14700:
> +		return ARH_AFE_RATE_14K;
> +	case 16000:
> +		return ARH_AFE_RATE_16K;
> +	case 22050:
> +		return ARH_AFE_RATE_22K;
> +	case 24000:
> +		return ARH_AFE_RATE_24K;
> +	case 29400:
> +		return ARH_AFE_RATE_29K;
> +	case 32000:
> +		return ARH_AFE_RATE_32K;
> +	case 44100:
> +		return ARH_AFE_RATE_44K;
> +	case 48000:
> +		return ARH_AFE_RATE_48K;
> +	case 88200:
> +		return ARH_AFE_RATE_88K;
> +	case 96000:
> +		return ARH_AFE_RATE_96K;
> +	case 176400:
> +		return ARH_AFE_RATE_176K;
> +	case 192000:
> +		return ARH_AFE_RATE_192K;
> +	case 352800:
> +		return ARH_AFE_RATE_352K;
> +	case 384000:
> +		return ARH_AFE_RATE_384K;
> +	default:
> +		dev_warn(dev, "%s(), rate %u invalid, using %d!!!\n",
> +			 __func__, rate, ARH_AFE_RATE_48K);

Three '!', really? :)

> +		return ARH_AFE_RATE_48K;
> +	}
> +}

> +static const struct snd_pcm_hardware an7581_afe_hardware = {
> +	.info = SNDRV_PCM_INFO_MMAP |
> +		SNDRV_PCM_INFO_INTERLEAVED |
> +		SNDRV_PCM_INFO_MMAP_VALID,
> +	.formats = SNDRV_PCM_FMTBIT_S16_LE |
> +		   SNDRV_PCM_FMTBIT_S24_LE |
> +		   SNDRV_PCM_FMTBIT_S32_LE,
> +	.period_bytes_min = 512,
> +	.period_bytes_max = 128 * 1024,
> +	.periods_min = 2,
> +	.periods_max = 256,
> +	.buffer_bytes_max = 256 * 1024,
> +	.fifo_size = 0,

static takes care of this unless you want to explicitly state the 
fifo_size must be 0 - in such case comment is necessary, otherwise drop 
the assignment.

> +};
> +
> +static int an7581_memif_fs(struct snd_pcm_substream *substream,
> +			   unsigned int rate)

For the entire file - char limit is 100, there is no reason not to 
utilize it.

> +{
> +	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
> +	struct snd_soc_component *component = snd_soc_rtdcom_lookup(rtd, AFE_PCM_NAME);
> +	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
> +
> +	return an7581_afe_rate_transform(afe->dev, rate);
> +}
> +
> +static int an7581_irq_fs(struct snd_pcm_substream *substream,
> +			 unsigned int rate)
> +{
> +	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
> +	struct snd_soc_component *component = snd_soc_rtdcom_lookup(rtd, AFE_PCM_NAME);
> +	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
> +
> +	return an7581_afe_rate_transform(afe->dev, rate);
> +}

These two functions seem to be identical.

> +
> +static int an7581_afe_fe_startup(struct snd_pcm_substream *substream,
> +				 struct snd_soc_dai *dai)
> +{
> +	struct snd_pcm_runtime *runtime = substream->runtime;
> +	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
> +	int ret;
> +
> +	ret = mtk_afe_fe_startup(substream, dai);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
> +		ret = snd_pcm_hw_constraint_minmax(runtime,
> +						   SNDRV_PCM_HW_PARAM_PERIOD_SIZE,
> +						   0x2000, UINT_MAX);
> +		if (ret < 0)
> +			dev_err(afe->dev, "hw_constraint_minmax failed\n");
> +	}
> +
> +	return ret;

mtk_afe_fe_startup() acquires irq via mtk_dynamic_irq_acquire(). Do we 
need to unwind the process if snd_pcm_hw_constraint_minmax() fails?

> +}

...

> +static int an7581_afe_pcm_dev_probe(struct platform_device *pdev)
> +{
> +	struct an7581_afe_private *afe_priv;
> +	struct reset_control *reset;
> +	struct mtk_base_afe *afe;
> +	struct device *dev;
> +	int i, irq_id, ret;
> +	void *base;
> +
> +	afe = devm_kzalloc(&pdev->dev, sizeof(*afe), GFP_KERNEL);
> +	if (!afe)
> +		return -ENOMEM;
> +	platform_set_drvdata(pdev, afe);

Typically drvdata is assigned last, one we know probe() is successful. 
Is there some specific reason why you assign the pointer immediately?
> +
> +	afe->platform_priv = devm_kzalloc(&pdev->dev, sizeof(*afe_priv),
> +					  GFP_KERNEL);
> +	if (!afe->platform_priv)
> +		return -ENOMEM;

Especially when the memory allocation is still ongoing..

> +
> +	afe_priv = afe->platform_priv;
> +	mutex_init(&afe_priv->user_lock);
> +	afe->dev = &pdev->dev;
> +	dev = afe->dev;
> +
> +	reset = devm_reset_control_get_exclusive(dev, NULL);
> +	if (IS_ERR(reset))
> +		return PTR_ERR(reset);
> +
> +	/* Global reset I2S */
> +	reset_control_assert(reset);
> +	usleep_range(10, 20);
> +	reset_control_deassert(reset);
> +
> +	afe->base_addr = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(afe->base_addr))
> +		return PTR_ERR(afe->base_addr);
> +
> +	base = devm_platform_ioremap_resource(pdev, 1);
> +	if (IS_ERR(base))
> +		return PTR_ERR(base);
> +
> +	ret = devm_pm_runtime_enable(dev);
> +	if (ret)
> +		return ret;
> +
> +	afe->regmap = devm_regmap_init_mmio(&pdev->dev, afe->base_addr,
> +					    &an7581_afe_regmap_config);
> +	if (IS_ERR(afe->regmap))
> +		return PTR_ERR(afe->regmap);
> +
> +	mutex_init(&afe->irq_alloc_lock);
> +
> +	/* irq initialize */
> +	afe->irqs_size = AN7581_IRQ_NUM;
> +	afe->irqs = devm_kcalloc(dev, afe->irqs_size, sizeof(*afe->irqs),
> +				 GFP_KERNEL);
> +	if (!afe->irqs)
> +		return -ENOMEM;

If the size is known upfront, I'd just move all the allocations to the top.

> +
> +	for (i = 0; i < afe->irqs_size; i++)
> +		afe->irqs[i].irq_data = &irq_data[i];
> +
> +	afe->irqs[AN7581_IRQ_0].regmap = afe->regmap;
> +	afe->irqs[AN7581_IRQ_1].regmap = devm_regmap_init_mmio(&pdev->dev, base,
> +							       &an7581_afe_irq1_regmap_config);
> +	if (IS_ERR(afe->irqs[AN7581_IRQ_1].regmap))
> +		return PTR_ERR(afe->irqs[AN7581_IRQ_1].regmap);
> +
> +	/* request irq */
> +	irq_id = platform_get_irq(pdev, 0);
> +	if (irq_id < 0)
> +		return irq_id;
> +
> +	/* init memif */
> +	afe->memif_size = AN7581_MEMIF_NUM;
> +	afe->memif = devm_kcalloc(dev, afe->memif_size, sizeof(*afe->memif),
> +				  GFP_KERNEL);
> +	if (!afe->memif)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < afe->memif_size; i++) {
> +		int sel_irq = an7581_memif_irq_descs[i].irq;
> +
> +		afe->memif[i].data = &memif_data[i];
> +		afe->memif[i].irq_usage = sel_irq;
> +		afe->memif[i].const_irq = 1;
> +		afe->irqs[sel_irq].irq_occupyed = true;
> +	}
> +
> +	/* init sub_dais */
> +	INIT_LIST_HEAD(&afe->sub_dais);
> +
> +	ret = devm_request_irq(dev, irq_id, an7581_afe_irq_handler,
> +			       IRQF_TRIGGER_NONE, "asys-isr", (void *)afe);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to request irq for asys-isr\n");
> +
> +	for (i = 0; i < ARRAY_SIZE(dai_register_cbs); i++) {
> +		ret = dai_register_cbs[i](afe);
> +		if (ret)
> +			return dev_err_probe(dev, ret, "DAI register failed, i: %d\n", i);
> +	}
> +
> +	/* init dai_driver and component_driver */
> +	ret = mtk_afe_combine_sub_dai(afe);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "mtk_afe_combine_sub_dai fail\n");
> +
> +	afe->mtk_afe_hardware = &an7581_afe_hardware;
> +	afe->memif_fs = an7581_memif_fs;
> +	afe->irq_fs = an7581_irq_fs;
> +
> +	/* register component */
> +	ret = devm_snd_soc_register_component(&pdev->dev,
> +					      &mtk_afe_pcm_platform,
> +					      NULL, 0);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Cannot register AFE component\n");
> +
> +	ret = devm_snd_soc_register_component(afe->dev,
> +					      &an7581_afe_pcm_dai_component,
> +					      afe->dai_drivers,
> +					      afe->num_dai_drivers);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Cannot register PCM DAI component\n");
> +
> +	return 0;
> +}

...

> +/* dai ops */
> +static int mtk_dai_etdm_startup(struct snd_pcm_substream *substream,
> +				struct snd_soc_dai *dai)
> +{
> +	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
> +	struct an7581_afe_private *afe_priv = afe->platform_priv;
> +
> +	regmap_set_bits(afe->regmap, AFE_DAC_CON0,
> +			BIT(AFE_AFE_ENABLE_SHIFT));
> +
> +	mutex_lock(&afe_priv->user_lock);

I'd suggest to switch to guards, see cleanup.h.

> +	afe_priv->users++;
> +	mutex_unlock(&afe_priv->user_lock);
> +
> +	return 0;

Why skip the return code of regmap_set_bits()?

> +}
> +
> +static void mtk_dai_etdm_shutdown(struct snd_pcm_substream *substream,
> +				  struct snd_soc_dai *dai)
> +{
> +	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
> +	struct an7581_afe_private *afe_priv = afe->platform_priv;
> +
> +	mutex_lock(&afe_priv->user_lock);
> +	afe_priv->users--;
> +	if (!afe_priv->users)
> +		regmap_clear_bits(afe->regmap, AFE_DAC_CON0,
> +				  BIT(AFE_AFE_ENABLE_SHIFT));
> +	mutex_unlock(&afe_priv->user_lock);

Well, here we clear bits in locked state whereas above they're set 
unlocked. Typically such inconsistency translates to an issue.

> +}
> +
> +static unsigned int get_etdm_ch_fixup(unsigned int channels)
> +{
> +	if (channels > 16)
> +		return 24;
> +	else if (channels > 8)
> +		return 16;
> +	else if (channels > 4)
> +		return 8;
> +	else if (channels > 2)
> +		return 4;
> +	else
> +		return 2;

Refactor, not a single 'else-if' is needed here as well as 'else'.
If a preceding if-statement ends with 'return' there is no elsing anything.

> +}
> +
> +static int mtk_dai_etdm_config(struct mtk_base_afe *afe,
> +			       struct snd_pcm_hw_params *params,
> +			       struct snd_soc_dai *dai,
> +			       int stream)
> +{
> +	struct an7581_afe_private *afe_priv = afe->platform_priv;
> +	struct mtk_dai_etdm_priv *etdm_data = afe_priv->dai_priv[dai->id];
> +	unsigned int rate = params_rate(params);
> +	unsigned int etdm_rate = an7581_etdm_rate_transform(afe->dev, rate);
> +	unsigned int channels = params_channels(params);
> +	unsigned int bit_width = params_width(params);
> +	unsigned int wlen = get_etdm_wlen(bit_width);

All the format variables are used once or twice. I'd drop them. Right 
now you have 11 (!) locals on the stack.

> +	unsigned int val = 0, val1 = 0;
> +	unsigned int mask = 0, mask1 = 0;
> +
> +	dev_dbg(afe->dev, "%s(), stream %d, rate %u, bitwidth %u\n",
> +		__func__, stream, rate, bit_width);
> +
> +	/* CON0 */
> +	mask |= ETDM_SLAVE_MODE;
> +	if (etdm_data->slave_mode)
> +		val |= ETDM_SLAVE_MODE;
> +	mask |= ETDM_BIT_LEN;
> +	val |= FIELD_PREP(ETDM_BIT_LEN, bit_width - 1);
> +	mask |= ETDM_WRD_LEN;
> +	val |= FIELD_PREP(ETDM_WRD_LEN, wlen - 1);
> +	mask |= ETDM_FMT;
> +	val |= FIELD_PREP(ETDM_FMT, etdm_data->format);
> +	mask |= ETDM_CH_NUM;
> +	val |= FIELD_PREP(ETDM_CH_NUM, get_etdm_ch_fixup(channels) - 1);

I'd group 'mask' and 'val' together, easier to follow. These do not seem 
intertwined.

> +
> +	/* CON1 */
> +	mask1 |= EDTM_LRCK_AUTO_MODE;
> +	val1 |= EDTM_LRCK_AUTO_MODE;
> +	mask1 |= EDTM_CKEN_SEL;
> +	val1 |= EDTM_CKEN_SEL;
> +	mask1 |= EDTM_LRCK_AUTO_OFF;
> +	val1 |= EDTM_LRCK_AUTO_OFF;
> +	mask1 |= EDTM_INITIAL_POINT;
> +	val1 |= FIELD_PREP(EDTM_INITIAL_POINT, 14);
> +	mask1 |= EDTM_INITIAL_COUNT;
> +	val1 |= FIELD_PREP(EDTM_INITIAL_COUNT, 14);

Ditto.

> +
> +	switch (stream) {
> +	case SNDRV_PCM_STREAM_PLAYBACK:
> +		/* set ETDM_OUT1_CON0 */
> +		regmap_update_bits(afe->regmap, ETDM_OUT1_CON0, mask, val);
> +
> +		mask1 |= EDTM_DIRECT_INPUT_MASTER_BCK;
> +		val1 |= EDTM_DIRECT_INPUT_MASTER_BCK;
> +
> +		/* set ETDM_OUT1_CON1 */
> +		regmap_update_bits(afe->regmap, ETDM_OUT1_CON1, mask1, val1);
> +
> +		/* set ETDM_OUT1_CON4 */
> +		regmap_update_bits(afe->regmap, ETDM_OUT1_CON4, OUT_SEL_FS,
> +				   FIELD_PREP(OUT_SEL_FS, etdm_rate));
> +
> +		regmap_update_bits(afe->irqs[AN7581_IRQ_0].regmap,
> +				   afe->irqs[AN7581_IRQ_0].irq_data->irq_en_reg,
> +				   AFE_IRQ_EN_SEL, AFE_IRQ_EN_SEL_I2SOUT);
> +		break;
> +	case SNDRV_PCM_STREAM_CAPTURE:
> +		/* set ETDM_IN1_CON0 */
> +		regmap_update_bits(afe->regmap, ETDM_IN1_CON0, mask, val);
> +
> +		/* set ETDM_IN1_CON1 */
> +		regmap_update_bits(afe->regmap, ETDM_IN1_CON1, mask1, val1);
> +
> +		/* set ETDM_IN1_CON3 */

All the comments found in this function do not explain anything. Drop them.

> +		regmap_update_bits(afe->regmap, ETDM_IN1_CON3, IN_SEL_FS,
> +				   FIELD_PREP(IN_SEL_FS, etdm_rate));
> +
> +		regmap_update_bits(afe->irqs[AN7581_IRQ_1].regmap,
> +				   afe->irqs[AN7581_IRQ_1].irq_data->irq_en_reg,
> +				   AFE_IRQ_EN_SEL, AFE_IRQ_EN_SEL_I2SIN);
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	return 0;
> +}
> +
> +static int mtk_dai_etdm_hw_params(struct snd_pcm_substream *substream,
> +				  struct snd_pcm_hw_params *params,
> +				  struct snd_soc_dai *dai)
> +{
> +	unsigned int rate = params_rate(params);
> +	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
> +
> +	regmap_update_bits(afe->regmap, ETDM_COWORK_CON0,
> +			   EDTM_IN1_SLAVE_SEL,
> +			   EDTM_IN1_SLAVE_FROM_ETDMIN1_SLAVE);
> +	regmap_update_bits(afe->regmap, ETDM_COWORK_CON0,
> +			   EDTM_OUT1_SLAVE_SEL,
> +			   EDTM_OUT1_SLAVE_FROM_ETDMOUT1_SLAVE);
> +	regmap_update_bits(afe->regmap, ETDM_COWORK_CON1,
> +			   EDTM_IN1_SDATA0_SEL,
> +			   EDTM_IN1_SDATA0_FROM_PAD);
> +
> +	switch (rate) {
> +	case 7350:
> +	case 8000:
> +	case 11025:
> +	case 12000:
> +	case 14700:
> +	case 16000:
> +	case 22050:
> +	case 24000:
> +	case 29400:
> +	case 32000:
> +	case 44100:
> +	case 48000:
> +	case 88200:
> +	case 96000:
> +	case 176400:
> +	case 192000:
> +	case 352800:
> +	case 384000:
> +		mtk_dai_etdm_config(afe, params, dai, substream->stream);
> +		return 0;

Again, skipping return code of the main procedure. I'd avoid blind 
'return 0'.

> +	default:
> +		dev_err(afe->dev,
> +			"Sample rate %d invalid\n",
> +			rate);
> +		return -EINVAL;
> +	}
> +}

...

> +static int mtk_dai_etdm_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
> +{
> +	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
> +	struct an7581_afe_private *afe_priv = afe->platform_priv;
> +	struct mtk_dai_etdm_priv *etdm_data;
> +	void *priv_data;
> +
> +	switch (dai->id) {
> +	case AN7581_DAI_ETDM:
> +		break;
> +	default:
> +		dev_warn(afe->dev, "%s(), id %d not support\n",
> +			 __func__, dai->id);

s/support/supported/

Though this entire check looks weird. Why should set_fmt() care about 
DAI's ID? Such check shall be done once, early with the rest of the 
runtime doing just the important stuff.

> +		return -EINVAL;
> +	}
> +
> +	priv_data = devm_kzalloc(afe->dev, sizeof(struct mtk_dai_etdm_priv),
> +				 GFP_KERNEL);
> +	if (!priv_data)
> +		return -ENOMEM;
> +
> +	afe_priv->dai_priv[dai->id] = priv_data;
> +	etdm_data = afe_priv->dai_priv[dai->id];
> +
> +	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
> +	case SND_SOC_DAIFMT_I2S:
> +		etdm_data->format = MTK_DAI_ETDM_FORMAT_I2S;
> +		break;
> +	case SND_SOC_DAIFMT_DSP_A:
> +		etdm_data->format = MTK_DAI_ETDM_FORMAT_DSPA;
> +		break;
> +	case SND_SOC_DAIFMT_DSP_B:
> +		etdm_data->format = MTK_DAI_ETDM_FORMAT_DSPB;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}

Please waterfall the points to all the functions/files. I can do another 
round once this batch is addressed or explained first.

Kind regards,
Czarek
