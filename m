Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB6048034A
	for <linux-sound@vger.kernel.org>; Mon,  6 Jul 2026 09:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783328509; cv=fail; b=aBv3zFY5iCUdDlt7aLprSpLgE9RhF6m2HJ/9uOYUKR5zIEm0vcKjv8D8layQoX00l/vJm61oTZSRN9QU9HeD9lRixrwvohQ0F7SNGz58AKFvC4ZRN3ph9AeYcPMsUJR7qSPNmP0IrQKSc582eGMicW1/GvCneNgt3drizsuMty0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783328509; c=relaxed/simple;
	bh=AHCTVdcqvd5A5pbvazLEvaudDhopILck/RYv1NUBzfg=;
	h=Message-ID:Date:Subject:To:References:CC:From:In-Reply-To:
	 Content-Type:MIME-Version; b=NNcjfGjs6ICN+lScWg0PoaBbDDUh2maE2ZAyaC9xnVMk5RoGSmAk9Cc2excOoiWGdgYgbFB0CMECD+5WNI2jk46oN7jCfUpkV62uyT8LvCT4luUmdR1pnMeZ11LnGDXjElRd77uIfxFTszWk0LRfVUklVJvaycEVKP5lAMAUtsg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=amBR8iVR; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="amBR8iVR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783328503; x=1814864503;
  h=message-id:date:subject:to:references:cc:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=AHCTVdcqvd5A5pbvazLEvaudDhopILck/RYv1NUBzfg=;
  b=amBR8iVRXGfq+2tDIhfFFiuv2mHp7otQI+3tbIEioT9qcuz1TkhRLKXa
   r1WdNHmsj+FpzAGsXov8jrOH6/d/9EB8V/IoXclS+zJyOrVNokvZSyG6Y
   iA5nw/Kv2sbg1+AS5+M2iEN+xnNu8bAU+1GrdYw4qZdTv9jRbwN7EKotw
   U467Lm+INZyGuO5DJSK5iOGaOI5YMf0ELNLU5vdH5nOhGOkYUDUKhwh5j
   54S0xrG2EBnb1yrVzF380+N9KGfRfcPTaqIwNuPASC0lDskDtE5Hjor2/
   OdV7cQuZsT4d1AfXpmST9G+S178mwP7hhgXlt73C2lbdwsGXxQbRqU5QX
   A==;
X-CSE-ConnectionGUID: ncEsG9zkS8+sK4mOnw9BbA==
X-CSE-MsgGUID: nR7EZcoATQ2tBIl9rmvFOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11838"; a="86508654"
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="86508654"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2026 02:01:38 -0700
X-CSE-ConnectionGUID: X4ZGcNihSymzUA15X/Urlw==
X-CSE-MsgGUID: FWkA3GsKSvqgjVhZQ4Km/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="251923402"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2026 02:01:38 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 6 Jul 2026 02:01:37 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 6 Jul 2026 02:01:37 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.52) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 6 Jul 2026 02:01:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A1nErq5vdlSjVOTYFJIZzVl0LjkRuB/ROmJiwPg6tIvUuqJfCP6MycWOb0wG8SnxcyOI0kqGSTiR58rHqOstC58Ue0bNs2CHPejrrj79ZINrrtem/eGQnE+2FHDANrAVYcuAM/l2nNBkEYLQQw8D8GnqkshuQBOcohU+4J15Ye+nEYsDs8dDm3bmSxgFN/Yf5FaPTZk0yIN4RW7M1s/x7voaTLOVRaPzMKlqaufNmS2Ri0PqZPhhEjyTKAw2ImliT12Gg2d2tYyv0h3t6qmXs98dqNM6/Hr6jqfjnjiaVCXSQ2MtDirMKcu5ufR9RaWu4W353m4te5jNLqlm0VX8gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pSRdIsdCrc1RMrLEqI+PXuon/qxb3ZD7IU7IBnfToWk=;
 b=GSyx1LdaDTkd7l709qrF22XN9az6/w5f2FKUvoUWIV03Rh7oBN77iE4pHjnoOXgEt2/SX2FNOisll81cdIsAVmaUXlMJKfVscLvveut9yMSfYVz9CMuI+SFmPZlUiz5I4+emICi0IYb0NspAE64NB47RLhLJ3/HHcScVpGvAXiEqoedfHBqW9H26r8QAeNUKzTavjzVtL32wpITSjzK7JD2SadajJMZzJuPtztAFCD4MmR4mhKJkI2RjnVnMoBYW7w8Wvg9oIVJfi6VgPmCWYFqslb6HQohNlSgp3L5Sdm4BvUdyzOxqmiPQaFP2X8sfXsy6phjIrdqBinBs3jruBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6967.namprd11.prod.outlook.com (2603:10b6:806:2bb::15)
 by BN9PR11MB5259.namprd11.prod.outlook.com (2603:10b6:408:134::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.13; Mon, 6 Jul
 2026 09:01:33 +0000
Received: from SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4]) by SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4%3]) with mapi id 15.21.0181.008; Mon, 6 Jul 2026
 09:01:33 +0000
Message-ID: <77e7ae97-a89c-4fce-8928-8a03177160fd@intel.com>
Date: Mon, 6 Jul 2026 11:01:27 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/12] ASoC: add and use new
 snd_soc_register_component()
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: <87zf04c1w5.wl-kuninori.morimoto.gx@renesas.com>
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
In-Reply-To: <87zf04c1w5.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR02CA0065.eurprd02.prod.outlook.com
 (2603:10a6:802:14::36) To SA1PR11MB6967.namprd11.prod.outlook.com
 (2603:10b6:806:2bb::15)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6967:EE_|BN9PR11MB5259:EE_
X-MS-Office365-Filtering-Correlation-Id: 4664db66-5eec-4903-0f18-08dedb3d2d57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|23010399003|366016|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: NHahx6Wh+wrKuJljewrTmpUfcUd4DIW8ry1l6Cqshrz7TjIuwtU8m7HD3PEZXsPdz35ZfEs/dk0YkKOmsWLViL5ESB/fzbq9uZRBDcqZN4UJxt90quH1PBKsJyMKjWNb0y4CFzNXkIvzQOK2VNralz4nXuNfnUIOzNbMhyeh4VpA217OsPtYviDl1tlrniuA4qa8ElcOJacKHiAHxSycMrBGHAesCLwR5DFqOVa1oGegB557XXnHnD2TwMTRy3TRhWk+SNHnntzw+/1/kGpn7q0iqQzl3TnUzCS5grnSm5JRMV8+u52kcZ7F4QUkTvAnWoIPNjw+WuWyq8wKjf0AItT4VM1je30pQ0ZVagMbn2dAjX9Up9YXgrHH5lz1XyohDMjgZ5nZM6b7tkULjlAK28lK4bUUqIIAzSQd+Fg+J3Vpm+rles5h0lvE3cxOSob4BZRg8WNTPbAycv9HWNdGcDdqFWTxM/dW7/zscXSAiaU1sBOxLNcyJJBIaUpiT6rQkBPoUafdyPQV8FKVG1BNLhHPdj9aCzhu+nb0gmGT0mTRk+e4FRVmFNs3oBPiY44lFkqpaZQUMzXs24ZtsWIas0GRZkF+DMHSaFpVF5hJ6E8qeUDM4p50y9hZXsUnUETTDfi4f6gfSEgWER32Z/n3ZzC/F6ZsObkdaFE+lkF0ua4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB6967.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(23010399003)(366016)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YURlbFZ6aU45eitaMVBVd1R4cDhkcEtyZHZIMkJzank0NjBKOTVZZ3BhTHJl?=
 =?utf-8?B?VldLQ1ExcmNKTDRjT2VBUzgvdEJGWlVwWTdHZXNWQ0phOStEcGlGMC83dVhB?=
 =?utf-8?B?ZEJ2d0NXb0l3dEhyVkVKTFo0R2IrSEVhd0FSZlVBR0hndlN3ODV1WkduTHdT?=
 =?utf-8?B?ZjQyb01JdVNvWW4vZVlER0RsMjR5cktscE1Xb2gxY29VZ0RDQks3OHl4TXJ5?=
 =?utf-8?B?TWRIS0U1cTZqdXdwV0ZqL0duTnF6K1JtUEljbGZLTE9JVGhlSDU0MG5FVDNP?=
 =?utf-8?B?NHJJNytGOVVlbmtqeTZiSkYxUVMzRlVmNWhvb25yVjh2SUdYa0gyRnBaT0dI?=
 =?utf-8?B?SWs5clY0WVJWQ0tJd2ljdjJEbWlxTldlejJ6b1BiSWFDK3pnYUw0dFhCQmNB?=
 =?utf-8?B?cEY3SkN2L3BxcFBwelVQNzN3b2o0cVk0eG9ER3p2NlVDcnZhTVdtdDlYM3Rz?=
 =?utf-8?B?MGhPTE1OeUdvcGs3NkJaVW52TDNmazRYMEJ4U3F6U0w2RFBOSW1nL2duQjF2?=
 =?utf-8?B?c2hmejJEazFZKy9teXVJNktIMndMeHZXSWg4eVJkVnZEa2xhMUJkMlB0b3ND?=
 =?utf-8?B?Tm9EYndKRWJmeEdxOUJmTzV4QVhicngxZ1hYeGpFbW8ya2xxWmtyUlVydlhW?=
 =?utf-8?B?K1pwNEVBMmlxTkVhZmhUSzU1OWhRT3ZnYWtQYUdvUmJQOU1RaE1KSGRPRkl5?=
 =?utf-8?B?ZjZ5MkkvbnlYZmVRMHRwaWJhdCswR05Yc2tONUQvbG9OVW9VaUdrL0V0S2R6?=
 =?utf-8?B?dnlqVHlUdHBaaEVGRE13a1BaK2xKRThwWDVwa1p2dzNBMWM3b3Jzb0ZHS2Ez?=
 =?utf-8?B?S1h6RTRxd1VuTC82WVpsSU9OT29DdUszUmQ4STZrOTRrLzREUVZLaTExYnZn?=
 =?utf-8?B?SmJCYnAvaUxMNE81QktxYmRORGNzeTFnMUR0U3ZjSVo5anVEbWlSRElpK3BY?=
 =?utf-8?B?Zm1SMUh3SkxKZUhIQkRFeXgvVTNHbFIxeW5ZbFFDV3V1UFAzMGdvTkVYSHNv?=
 =?utf-8?B?VlR6dHJLSk1jNVNlRTYvOGFyUjJ2NFVFclpwQ2N2N2dOMWdmd2lzWXkzQUFi?=
 =?utf-8?B?UUdUWmRFNG5LNDNxRjhIUGhXWVZvT1NsU3FGTVk4ZTN4cmU2ZDZyZU00VW5F?=
 =?utf-8?B?RmxETDBJdUdsMk9iMDJEbVR2WTNvaWZ1WEgrR2h4U0ZyRGxmYmYycEI0NVpS?=
 =?utf-8?B?UXlleTZteS9tR1QxSkFmc2ZaYXVvUm9LWXAzMkdFNnNCVXhkZkIwUkpnSHNn?=
 =?utf-8?B?YVJSNnNKdTJadkFMMXQ2VkhBVUUvMENjS2pveVhXZmZjVTFKdEtJK1F1bCtK?=
 =?utf-8?B?MzFWcFM1eVozNUYwTTZQS2VITnkxY2FTR1Y4LzNDdXlmaHpYeDcxNXRFeUtF?=
 =?utf-8?B?S3JiZkx6NHJJelE5a1Z6Qlg2WmdJMVRWdGdaNFBBU05abTlZTGNYcnVUeU1L?=
 =?utf-8?B?RmxGNmdFZG91WXhGSGRDM2V1Rm5LekswOHo3Qm1mSSt4WnVTQ3MzWC9ZVlZ6?=
 =?utf-8?B?aHo4WWlPMUNHS21qT0xqWUxaZlM1aHFNeDJQWS9PbnZBSFV1dnFHVVdtcHM4?=
 =?utf-8?B?ZTBFaVczUjhFVEZHOUlzdiswQ3lVaC9YZFkxblhCcVVyY1Uzd3YvRU5GRTA1?=
 =?utf-8?B?dzR3Q3BnOVh3cDlsTzVGdThXRHZZajdMeHkza0RudXh6aTJxVXR4UUszOUJY?=
 =?utf-8?B?alBoQVN5NWJVQit5NEJ3ckNpZlNtZmRYNmR5QmZwWTlHYjhxeWhEMGJCUkNC?=
 =?utf-8?B?L0RCZzdIZVlPV2Qwa2ZTSnZwMzFaSlZ3WXZrdlFXMU5RYkl0SGEwYW92b053?=
 =?utf-8?B?bHVvRmpwa2J5aUdhbDU5T29Pa1pvb1YybEpVTnhSRUo0dWpoRXJrYmNac1BJ?=
 =?utf-8?B?TFpHek1pZzVHak5xVTRQM3VZMkZ1SkZ6SnkyR2Z4bFhWOVpkOGJUdm9tcDhL?=
 =?utf-8?B?NnNabEEwUmp0ZjZWNndCVnhVUDdjZHgwUlBzblB0RnpVM3RCNEhsZTI5dTF3?=
 =?utf-8?B?RHNKUWx6TThDNzRHSUFaazFpc3FsQTB5WHgzNktLcnJuMzhyU3F5VWUrYjlt?=
 =?utf-8?B?d3U5ZkJ4VStPL1Z4eDBBSmpjRll1WldIUkk3Y0dwL3ZON1U4ZWtVbnFYMEVm?=
 =?utf-8?B?RmFybi93RjBBdDYzckxZaXJDb09iUXpyR3IrM1JmWlAybXkrV2NIZVR2ekxE?=
 =?utf-8?B?dGt6NHVBTzBVUEZPWG1ENWdkSVFvcGlsYTZpWVNMeENZS0xxaDBlZjU2cFZ4?=
 =?utf-8?B?K2ZadnVRdE95WGdXNTdXd3V2NDBSSjZzWUJBY2RYYWMxSElBajh5VG9wdkI4?=
 =?utf-8?B?TkVaSC8ydHVFdCt2YzYzVHJtM3ZnZWJjejJ0OEsrUW5TbDBUTjJLYkhlalhQ?=
 =?utf-8?Q?fzBCAjICvzS11NNE=3D?=
X-Exchange-RoutingPolicyChecked: fIOlB1EzUd+/uSozvhp7PdfJ7KIw25Ene1NbsFrtmOB/rnQMHYc78ZjQjomHBCx84l6fG+As+AYdUTb7umHl8CFTPomQ0WQEAHp/wkmPLOpk++xQcOvJT6kviuRR9+EOJROULxjRkt5p1aPBPKSeL6d50li9waGS3zFlnkqK2Bn0+Gek2vKj14JYor/tKuTdn8XpqPFseWnnmosvAIP2G4R46/QPqkB7r4u4fTAGWEKKM1QzZMUFVmAXpqegetpVPqkq017GACnBCoiI8lO9XZHGpwTpQpUdsAu88We7UyY/bkKgkqXf2D85K/nnWoJblzak4ngDT9wRUvzE9OiF3A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4664db66-5eec-4903-0f18-08dedb3d2d57
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6967.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 09:01:33.6176
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kRX3vpa43wZrS72YRVSZ6L7hOF2fbf0CJfikqg4wue5HNLw2+wZ4ox4r8dQB/HQHzuRfciKuTsbbuin5Zkt8hFRZq/cZ8eLF/7bCZwz11So=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5259
X-OriginatorOrg: intel.com

On 7/6/2026 4:01 AM, Kuninori Morimoto wrote:
> Hi
> 
> Current component has component->name. But snd_soc_register_component()
> user can't setup it, because component itself is alloced in that function.
> 
> So, to setup it, user need to use snd_soc_component_initialize() /
> snd_soc_add_component() directly instead of using
> snd_soc_register_component().
> 
> In the same time, Component will be capsuled soon.
> 
> Let's tidyup around here.
> All strange code can be gone if we have both below style.
> 
> Normal case
> 	snd_soc_register_component(dev, ...);
> 
> Want to setup case
> 	component = snd_soc_component_alloc(...);
> 
> 	snd_soc_component_set_xxx(component, ...);
> 	snd_soc_component_set_xxx(component, ...);
> 
> (A)	snd_soc_register_component(component, ...);
> 
> This patch-set adds new snd_soc_register_component() which allows to use
> component (A).
> 
> Originally, this patch-set was posted as
> 	v1: ASoC: intel: use component_name for Component name
> 	v2: ASoC: add [devm_]snd_soc_register_component_with_name()
> 
> Link: https://lore.kernel.org/r/87fr29esth.wl-kuninori.morimoto.gx@renesas.com
> Link: https://lore.kernel.org/r/87v7ayxk3s.wl-kuninori.morimoto.gx@renesas.com
Thank you for good discussion, addressing some and providing technical 
arguments for those comments we didn't square on.  I've spent quite a 
while analyzing the subject and the outcome is:  Is there something I 
can help with, to make the conversion easier?

And obviously:
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
