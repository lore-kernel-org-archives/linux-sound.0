Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B791B3859E6
	for <linux-sound@vger.kernel.org>; Thu,  2 Jul 2026 19:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783021517; cv=fail; b=UJTQGXlzXZVSvOu1FaiLIry4YP7P8tUsEUxfa+SnMDOlcG+5T7DTYILjocBa3YOqOy1HxIH46jjvtFu/x6XbNGkl37p7wKoFhl7JzIjSpejIRgBYUpjDQESj7Olqz3bsKtdj17HTihIXEA5LOV62bQ/CVY7P+YnD9N5J5EkIGuw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783021517; c=relaxed/simple;
	bh=NoCAHS9YpcaFsb21faZzmSVbK2Bzonfx5wKrVBkE61E=;
	h=Message-ID:Date:Subject:To:References:CC:From:In-Reply-To:
	 Content-Type:MIME-Version; b=QHuWdP7eOGllCuEGX/HztzusF4jv9S4TZ5Y6wGjH8H+WRnlmI/JEkqSSJla6TjN27NGRdyMD/ObCrr1vZ43TNBxOBtdFgdZRiFclmIj+L8NgIL6Eiil8qRQ5P995mgiMCL+1ROgVvHLHAETA8pkofYQCV4Gvb1CpmFt/SBd1hkg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=grXUekir; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="grXUekir"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783021515; x=1814557515;
  h=message-id:date:subject:to:references:cc:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=NoCAHS9YpcaFsb21faZzmSVbK2Bzonfx5wKrVBkE61E=;
  b=grXUekirKlAfHP87eoGRL2zePd1M28EIev6a3j3G82yxpKL8w4lagONf
   jjQsUGdyx5JH9mzq4hYEyehLc9BoqTaCYxcuo/ZJ2Flx54KO+77CKNyBQ
   aP+WOef06iBk86GDFNqXbKgc8JWK/+HLLe0aXH45CX3w0Twwvk2wzF8ZK
   ogdYKMJBfJG9lV0V7M/ix/uT0GiCn+ahM91DZ0FeMpf7GvVv+yFZDEWbG
   OCqROzicFpMHVVGAActkZubBp7gBwAbSkNJbJiX8DTPJ+zg/IZPToQLsb
   pThKRqa3Sry74yarV3vXz1ybdPlsrlOTR2pP5loQqNWkEysISvzPreNxx
   A==;
X-CSE-ConnectionGUID: BEjvb9qXSGWUUvcCxDIDwg==
X-CSE-MsgGUID: PcLNiQsOSjayfoujrpMchw==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="95286693"
X-IronPort-AV: E=Sophos;i="6.25,144,1779174000"; 
   d="scan'208";a="95286693"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 12:45:14 -0700
X-CSE-ConnectionGUID: e7SJ7gPAQx+/cxsObQWJgA==
X-CSE-MsgGUID: fvlAZ61ZS5GPn5tKbZbEqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,144,1779174000"; 
   d="scan'208";a="283021891"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 12:45:14 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 2 Jul 2026 12:45:13 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 2 Jul 2026 12:45:13 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.53)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 2 Jul 2026 12:45:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XlvTjSiUDtkuobGLuAKl85wZxByZQ+aaqzQhDwQShV8+daTFZdFZQJ0N3A6RtXUy5WS8EsdWuXZZflJUBnzJKZ6A5F6N63h4zyaHsME2iZTEYz3kKI6FR8my72oQDoHF1SDar2Je4SjxQR/plEMVGKtIuU2XzchhK9xtREa7gPLIxuEBzTKuX41nkZVWR62RzSE02bG3+uOmEi748YW2vLOwUvBGIgYQVis9alcw3JaD46E7HknFmlgWUoB/WjHES65c/R3tbqu+xOhQDePZ/wXCgKhnRsEauO5nP6Y+G6yWwFk2GHIXxIzE4QGiHiKgMH/iWUz62xWLMg3P4vMBww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sjxyQr3huUp9yTDnAxaO+72i1osn2+crLTilRBKBd6g=;
 b=RajYFm9PrdKzlDnL6DYm528YAfEq2aKPwwrt2rke4/jmB8nvqLv4TEYPTb2zbukp2Oy06q1Zx+FJ1iZn408h4uE0/fyOWM1an4PV+8J1egsDrEV0eGqt+jD8MOY5sijG/W1lxdA8UKeRI7/bGr8oGi+vw2MLIwJbSBRQa1F0ceTeuHjeGTQdxAjRcQeAnPO1kj6YAPy1InFGAfGICJhbSm8KjSZXkBsqZtZ0KqRyKO3LDQ1mKKcKDcVvd14UWd8ILl7+rPzGYeYes/+moseiyoXj4AUOamrJzyl+mqCInuvuWfBIOy01eqtWAlpacB5WIbc6h4tnGPfkkUO0DcIRiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6967.namprd11.prod.outlook.com (2603:10b6:806:2bb::15)
 by CH8PR11MB9459.namprd11.prod.outlook.com (2603:10b6:610:2bb::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Thu, 2 Jul
 2026 19:45:10 +0000
Received: from SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4]) by SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4%3]) with mapi id 15.21.0181.008; Thu, 2 Jul 2026
 19:45:10 +0000
Message-ID: <c4b90a39-1a4a-43b8-9d57-a4fa22edb706@intel.com>
Date: Thu, 2 Jul 2026 21:45:03 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] ASoC: soc-component: add .priv
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: <87v7ayxk3s.wl-kuninori.morimoto.gx@renesas.com>
 <87se62xk2z.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
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
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <87se62xk2z.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2PEPF000008C5.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d8::68d) To SA1PR11MB6967.namprd11.prod.outlook.com
 (2603:10b6:806:2bb::15)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6967:EE_|CH8PR11MB9459:EE_
X-MS-Office365-Filtering-Correlation-Id: 6db824d7-4698-4d88-8090-08ded8726d2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|23010399003|1800799024|18002099003|22082099003|6133799003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 5u6vnKSLzNvPVa2OEb5KJU6jA2BYmIY6woeLcMb81zDx0h+mau+5kZ4vwMhEB7H65ObibTXFWc0RPwtg4/Zz3hWqO0gGeCCFVsChK60ncvQuT6OkgktFr99PeW28Sgs+ZxF3uvbopNr9R5GTxS4LhMx6QUQhGuu5dX4ZvxxY3jGWHWFafbvcOUFa9zV2ybwOo+ic9YGNhSKMHcv7GcIVOQcab7jENRSRi/7maAMA9RJtxhcFpam6Oeu+lC5YZsNcKXA8tyXuX6MNGlC475EMmf1G46MGzEDe8ayphAy4WuxKMvCRKek33Gmg3u3bNZir9XRMtZ1NfyJ06xlIjTeQbqQk5GcJFIz5/mKY0SZV9e/gNxNAtHLEjWJLM+PRX5IMs3FL8K6WfIikvdbjTosJjcBSnwOq0kFKB8QOm80RfDpIeiKEURqI1tpfYkzaOXnvVcHZbKhUOBEX+4hwVwmXdr33szSzh/dzM76xXZNidp1XnvbUJUM2X2HOWp0F1E41TIbyVrsK1KWireVwTALuymXgzI6TQ/Tp0OzZz5+cGU/piZLuHlJgKwXM7WR15ZEwmO49scMzgPgr9WGUvP7C0FOpF7UJ5ZDr1GwEIyGTKN1ePg3DLh/FtSqsklPRWxDuZVYFKevubnr6tqCy9K5VrBKJ89zkm6VQmlKzIN38pBI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB6967.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(23010399003)(1800799024)(18002099003)(22082099003)(6133799003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MWpHN3M5dEJDSEVUMi90QVVPeTNGNzRwQTI1Y08rZGVhaG9Ja0RsZHViVWtY?=
 =?utf-8?B?RGNQY0QyUk9uOFFiUVRUcXNRL3J4cHZKbFN1VzViVS9IaEI3Y0U4Y052S1Fq?=
 =?utf-8?B?dVdGZklLMkdBZVBJOTcyNkQ3RkRGaUUzY3RONFhwZUJwc0NQSWdQcVlLTmNE?=
 =?utf-8?B?ZTlabklkQ2NsMVpXdXV4VXZjcEpMY0xCK3NBTkUvMDhFQTZVTElNM0RhdjBV?=
 =?utf-8?B?WVRpeHRyeUpIMlhOZy9BNHpETnVGbVByWlhVdkdhVE4wTCtSQWRBdjVSK0Rx?=
 =?utf-8?B?OFlnUEorbUhySGdiMGZhWFJ6ZG5oN1FLZGdFTm5MM1pqSWhWWWtHYTJpRERq?=
 =?utf-8?B?cFczQW5pc2tpY3BIaTZJbXhiVXlKRE9lcUtnL1JNWHVnaUR0UjJHVDdibDN4?=
 =?utf-8?B?VmthWTZRSXA3dzZqaktWTE9yMzZ4TTVhRHpwcldmZk1ORElVeWUvOStSNzIv?=
 =?utf-8?B?cTBiTkd4Uk5IeURHVUdjM29OR0pKY3RHcElraW1NeDRhKzBmSlk3TW5uZkRS?=
 =?utf-8?B?VFpSWjQvU3V0aHFZU3ZDS3owWVVLVHZnemU2NHAyalN4Rk1rYWpndklkOHZB?=
 =?utf-8?B?eTVkQ1gyWEx4SmtxS0d0bVRIZkxsUUZxeFNWNFFFQ1ErL2RkOXhzTWNQYXZL?=
 =?utf-8?B?NERsYVdTTGt4QS9KeXNkbDJOd0lidXNNaEdUQWZoc2JaQkRobkdoMXRzOGM3?=
 =?utf-8?B?VDJOZy9nSU4yUHJIM1VDT0xqbjFoQUlTWStNMjVlNVVyUTF4cE9xNGtabm8x?=
 =?utf-8?B?L05ZalBkS0tsbDloc1lOb3c2UWJsWHZHYzNTVXhZdmU3NVI3STQrNGYxOW90?=
 =?utf-8?B?TGl1VnpRR3NFZzZvdnFzdGUwSncwQ0F2RXVNZGg1ckJxaUpXaXM4SGtCQWNh?=
 =?utf-8?B?UmRjeTJkcU5pSm9MenYxU3pDeXhBZis1R3pBR0JOczVESlJhWGUzR3hONFZF?=
 =?utf-8?B?QldLUjBqcjRPUFhWdHN0K0hFOXp1Y2N5M05TQ05xRVNaNUdqZGZZdW5zL0Z0?=
 =?utf-8?B?Sk1WK0hPY28xZTZNYVZvWVk1TTYrS1U3VVpRTGNVOXNLM2lRcS9mS2xESFV4?=
 =?utf-8?B?aU41SmRLek9TY0xKOFZ3Z05XUWdkcnpFREFRWk1IQkpiVmxRbEM2ZDN3dFVw?=
 =?utf-8?B?WHZqaDYwWUlFVVM1anYzT2N2U1c4QTkwOGJSbzRPc242d2xMdU5oUXo5Wi82?=
 =?utf-8?B?aDZ5bVcvSGxpdUxjSXZHc2lLRmFXdUM5b3FJdmpBaEkxaStpa0JUZ1V1WDds?=
 =?utf-8?B?cUxyejBrbWZiMU1pTlFzVWgwK2Q3cTZ0TUpYZndPL2x3QXFxa3Q2akU0QXlJ?=
 =?utf-8?B?YnhnVHBQMnpuNnVyZkFTZTcvWjBvVkF5L25qdFFPK3c0MDUxSEtYeGtVUjhn?=
 =?utf-8?B?aWFFTEpFUEdlaHg4STkzbkt1L3dZZWJ6VDc1b3laQStLc0ZZeHMwelRvYWNh?=
 =?utf-8?B?a09tRFlkQkVwemRMSnBIdEUzRExBWjBGM1lMckJ2amloRG5FNWVIeGhQbmN6?=
 =?utf-8?B?SnlVdHAwRjVqVkx3VHd2eXZrTDNOS2UxRWNDMlZSemdsWkFiRTNxR0JaY1RW?=
 =?utf-8?B?UjJWWm4vTW80MGxSRTV5K0JNMWJXcWFjdGhORkdjaHdveXdpTkhueUs0Zjdv?=
 =?utf-8?B?L2c1NytyWnZYT1R2NHZVY1hkQzQvWHB6WUx1TmowcjRjV1NaSjhva0Q3ZnYv?=
 =?utf-8?B?d1UrckY5ak9ibnlKYXVObnp3VXM1QWNGZ0FSdVdoZVAzYzBlT2IxbWU4eDRN?=
 =?utf-8?B?NWo2K2lrNEJLcUZ6dnBhc09LUVp2UDY5c0lsNGVwQnpLVFdlMFQzYUhnSmd5?=
 =?utf-8?B?aUJrTUxrbVQzalAyeDFRVDA2RWVzNFdyelNuRlNqMDk5SWJCQndyMTFKNWtZ?=
 =?utf-8?B?M0NiakdWMUNPb1oweGFDa3hXMXMrUCswbWhnL29zK21aak1BNXhGYWhRRG1s?=
 =?utf-8?B?cStUWmFHaFhhSE9EbkdBZ21RTG1NeXBoMyt3ZnRIcVJ2bC9hQkdFeFk4djlV?=
 =?utf-8?B?OHp4RmcxdXl5YWlqQ3Y0WW5BY1kyZW1kVC9mZ3NzanVlVGhYbFNPcUVvODFz?=
 =?utf-8?B?bTdtVzJPUnlNYW9BVE9pVS8wRkt0QXpic3JTQ0ZaMGlJREwzS01qRkM5ZU4w?=
 =?utf-8?B?TGgvUHRxcjFiMDV2NjFtQ0hyN2p0bXROblAyZHVkQTQ3Qlh5dUVLLzRvVWlv?=
 =?utf-8?B?RUVwSTNjOGVvNG9ITC9QNmVvYVFPblhrOThMOTFGYVBPSG5reXRZR0VPME0x?=
 =?utf-8?B?OTFwSjRCY29oWHQ4ZHBVMGlBd24za3ZUQ2Q2WlBkQVl5UXFzZGlrbzdGL1p2?=
 =?utf-8?B?Vm5hcWZPM1pQa1drNkFhSVp5eEpSdG1ySWFpUlRjQ0tpQnRtbTlMZz09?=
X-Exchange-RoutingPolicyChecked: buW3PsrrOQBDGE6QeTMAq/n50WteT95gbTGAzC5MABppe/PMyaYkQydMFrkVS0b45IDrxTiWRvGiFUjRXItZscgII1u+rMPPeCg6T1tQlSDwKXXVCOG/ZJuWlSy9h4JEH9pxWG9/g4kQfpTgC4NYy7s8gAODVX9d5xhaOdFK7ysR+5qDj/tqB1hBMMqEhWU+L/W/lrt9APEBTjSdrM6+s/wS3nqr7OPcnvBLHiyUa2W0aZC2wHenUyRkDuAI2tv2Hk/2jorIq7gCmpuOTGprXdQ9XNhj3rZKmEqCIRcuW/1bfrjl+c3IomL86SgxfylLFRAXP0QBeRpkPfWJ41t/XQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6db824d7-4698-4d88-8090-08ded8726d2a
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6967.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 19:45:10.3738
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hCH54R5DGDqf7+cZEp4gys2qGcD+EP8EiXZmvMljzUSh7HUzSeO5f0BlY0P19ystDjd2N9rkpZ9tFUS1wfaBkaSKEEDxK4Bzs5AG0CZU3Uk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR11MB9459
X-OriginatorOrg: intel.com

On 7/2/2026 3:21 AM, Kuninori Morimoto wrote:

...

> diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
> index aa423865dbe7c..c510856d7cf57 100644
> --- a/include/sound/soc-component.h
> +++ b/include/sound/soc-component.h
> @@ -252,6 +252,9 @@ struct snd_soc_component {
>   	void *mark_pm;
>   
>   	struct dentry *debugfs_root;
> +
> +	/* Component private data */
> +	void *priv;
>   };
>   
>   #define for_each_component_dais(component, dai)\
> @@ -282,6 +285,8 @@ static inline int snd_soc_component_cache_sync(
>   	return regcache_sync(component->regmap);
>   }
>   
> +void *snd_soc_component_to_priv(struct snd_soc_component *component);
> +

By convention all "to_" relate to component_of().  It's not the case 
here.  To be cohesive with the rest: snd_soc_component_priv.

While at it, looks like we are going to have a symbol per field exposed. 
  A bit weird, isn't it?  I innitially though we are going to leave 
things at:

static inline <type> snd_soc_component_<field>(component)
{
	// do
}

but if the intention is to define struct snd_soc_component in the .c 
file things will get complicated.
