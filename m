Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F6A38B7C3;
	Wed,  8 Jul 2026 11:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783508582; cv=fail; b=HrfB4LIvpQCuDjiK/AquEf1A5ChIaJNeUVRfRkkBRNHYIOzqQtXwnuGcmXRPg3/iPVrmOkOgZAR5q30Da28GCw118mXvEUsZOfBuwnMhi6aWEYtS7lzCI4morGGUnYbfPssi+0P+KAOPF92NwmmQ+2iDUzb43TQ0b8MZRPIj3L4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783508582; c=relaxed/simple;
	bh=pB5oe+X6j/BUYpa7DH6sDTN5Bw1vc8vmt1Vkb8rhHfE=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=CvRYF4n5KSJE5OeYu457Wv1WiN/lxSjD03sZhkRtS269KzdmxbnfC9+IbJAcqgoQXp7npP8tt8qs92wQWRO4sf4PuSAF47jm9c47PF/tR59tzykI7IeiJJbHbR71AOaHd2BZFmcSDPZBEalOLGG80Ml7Yu361zzSFzstQpPoRSw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d/mqaXNS; arc=fail smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d/mqaXNS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783508578; x=1815044578;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=pB5oe+X6j/BUYpa7DH6sDTN5Bw1vc8vmt1Vkb8rhHfE=;
  b=d/mqaXNSVHL14NRtR4/8tS2CR4PDpQMVczCNqq8fcP9UXPp0w/fvSdgt
   C+1RtqRGeiBTceXS/KbYaBJ1h3R8qb/xICT9+5xAxTok/IPridOy6/8Xl
   qKEEfsgyPZ+awA8orDyiGYuv+7g9HgoFzbI5V6aZ/ZQhK6bRI+n9qNiBj
   bYqrFIC16JwpwKtY6D2ZT312UzBT922ejiVmYeydr6xaYjXrNNfS/phF4
   6adT1D5pPRYOwWKPHTAfwyJ5NKrxwi2Y59X93cFWTy0Y0oydyQ/EyYAge
   6eg30GRZmuXcsFw57XvuE2kV+KHbLM3dijmtLjB+QNKfu+Lk0tBIB5/E2
   w==;
X-CSE-ConnectionGUID: RNWOPAwNQuuDl1tsIdMJew==
X-CSE-MsgGUID: nzAHdpRSTIawdau8Sfortw==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="83946145"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="83946145"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 04:02:48 -0700
X-CSE-ConnectionGUID: hd6UgMzEQLi3VikE3oNhFQ==
X-CSE-MsgGUID: OlpB+UiPSDqsDvr1EtRX5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="277471375"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 04:02:48 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 8 Jul 2026 04:02:47 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 8 Jul 2026 04:02:47 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.65) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 8 Jul 2026 04:02:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JndaubVa/G6V1EcM0PyQZnStPkN/Ye/Gh6WL1SEtOfdQXOQnq0muByARQORywaeFDgygf9KdNGhv3S26uWLRNg368VwekCWcBhjqY6UKCNcfO/Hu3qVUOz4IcP+tSVcNcgkWY/VsTWrrd6zW1IbrC5Lhfr3e6tCLY1L9ZIhe8Yq2pAjrI+E7jqWRvF0ZV6kaV0VcT04tUBeTLVLL2iqVS06nQLmf7OuUITAzVaAKSiIt6UCjRjkC7uHFKGX5zum7leqSudI6wPYLaOPXvIZ0ckYh7kxa53FnvrSCE8mtUZqUUhZ/cBUMmHNzF5HjiUFg86HNGPegZa3u4skrx5eI5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iNFNNoZr2ocHpyhmrcTAsS+caybg07xe5hTJSU+ODJ0=;
 b=R2kCOAKjoulAkS67fnFIWw3qTQ9G8dyywi2rR8GhhMH0VDRIq/0GjNcUZso5m+NookI6hb2c8BGMEBKIIpGh9Q2XXatlIEys9rTD56wg744CsoGu8xq2JAMeHqOHCOUejdLxBd9WYLR90aSMFOgjeBAGyA3sXjCCh73wjE52EJgPB/qJjyr30pp0OOLAWZhkUvzn6h3Iys1njHD0/cfe5iLPineFLKjYitHj/BjYOddHY/pfLVunKt/CSff0yMUJQd5UMXybS3AZEYuMnWQBaalwQyCxGDZ9khdgua7ZXgn05MnVppdYIlu8ferwIr4BCHP7R4mKkAxD1M8oQq3bTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6967.namprd11.prod.outlook.com (2603:10b6:806:2bb::15)
 by CH3PR11MB8212.namprd11.prod.outlook.com (2603:10b6:610:164::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Wed, 8 Jul
 2026 11:02:42 +0000
Received: from SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4]) by SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4%3]) with mapi id 15.21.0181.008; Wed, 8 Jul 2026
 11:02:41 +0000
Message-ID: <f6841e94-3260-4ec0-bdef-50ed73ba8875@intel.com>
Date: Wed, 8 Jul 2026 13:02:36 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ALSA: control: preserve snd_card_file_add() error code
 in snd_ctl_open()
To: <phucduc.bui@gmail.com>
CC: <cassiogabrielcontato@gmail.com>, Mark Brown <broonie@kernel.org>, "Kees
 Cook" <kees@kernel.org>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Jaroslav Kysela <perex@perex.cz>, "Takashi
 Iwai" <tiwai@suse.com>
References: <20260708023540.6962-1-phucduc.bui@gmail.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20260708023540.6962-1-phucduc.bui@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P190CA0014.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:802:2b::27) To SA1PR11MB6967.namprd11.prod.outlook.com
 (2603:10b6:806:2bb::15)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6967:EE_|CH3PR11MB8212:EE_
X-MS-Office365-Filtering-Correlation-Id: 04a2478d-1047-4475-8ad0-08dedce06def
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|22082099003|11063799006|18002099003|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info: AQ4GvWUfBjEdkNUS/IWnbrsQjwscUlNmPViK429WgF/H5dReJ0XJcGOta4Suw4xg9ctCYaNhiogTR39wbVwZd8AxBGWw4zpfVUr5PIvBEpvJgDvlQDPFmgQnEhI/GGJmO29+0ECa5rOHj/d+eLNoe2dJhMi9lYaeCjpfVQxR28SnNf+loPZDASQ3ZYfHGJ05iubk8sroHhDmxTE+X7mE5hApXYPLez9HJG718hvhkbNMwNKWB+8ZuHaZsbiQQe2cEn7Aj6VVgDbWuYlJXGqGSdTBSjD9SfQfnY4R8+iF5lky5ipqbg6C/DBKaMibRY1USL1STmuaG+YfPGdhr3p425cVxuzK/bcdKi8ZLBKNnn0baLC8OmSvd/+uukU0uhoQTUEmPa/k8c3MNjtkw34SA42CDJ6jzelbSwE7JvFAgL4taEtmv/il0Hfbh9cfNSlznoLREpabvCgNPaQJJ1P++kn7BCJJ8Tz08N43oHIbUvNgKxTqJCQxLXhVdo/3cAXVVZNmFIuWs2K+UWeiQNzObeIdgthCA96isGj+b7rtVSZaeZI5cKP/IqMVOrm+h0RjRb4ln1ujQSSbOGXfWRQETJEyYhOMD/oRYUv6P+gKZoxJlSRIMpYH7kd42ip8p4vHzUD+eukevmkqbrsi7mbHGN8LuccUA1o5EC9Aw56chsc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB6967.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(22082099003)(11063799006)(18002099003)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Szd5NXFxTGJGemUxa1FCdlBGeWJlSS90cWV3cVI2SExwNmlXOThaQkRScGp3?=
 =?utf-8?B?QVQvOXVsKzVaTVp4MDlldUdwMWhiV0dYQXJEZEFRVHBWUm5XdlYxMlVwMzQw?=
 =?utf-8?B?bldmakRIS2NFcFR2cTFUSVZxOFRZV2FzT1hzNmRGaWZaeGorcEZWL2srRTc0?=
 =?utf-8?B?a29pSnZqZGlNNVBJcld3MnRLU0dOUVU2WlllNmdieU9RdXU3Yk1vV293Vm1N?=
 =?utf-8?B?Y21BbTVLcmJ0bEtjd0tiUVloVnJKS0Jwa0dQODdYL3RoQUdhVDhCaUV4ZE1M?=
 =?utf-8?B?L3NXSXRRdnFxR0s3akRxdzJLaG5CMHdZVTI1ZE9scWpCaU52bzUxeVR0eHdC?=
 =?utf-8?B?YUZlL0V6LzAyUklBVS8rSXRSUEJzSEkvS0lUNWdqVTJLOFI1VFd6SVQ5Q1lS?=
 =?utf-8?B?RVpuU3RTcFhTVTlJWXBKUlZFQkJoNTNFWmRvYVpsMmY2bVdyQ2ZrM2tqamtm?=
 =?utf-8?B?SkY5UVYrOEhNQWFGSENzeXdpSEFhVjVPeU1SczRoN0xZVDBvUHdyT092cjl5?=
 =?utf-8?B?TkR6ckxIcmN4dGVIQ1R3c1ZYU2Q2MWtFYTdhTHE3c2xJWCtBRXVaOHF1OEkr?=
 =?utf-8?B?emZWUkxEendTN1NMc1hub3hiMU1PVjRsczRxbnBiZm9SUGgyMWp5QldPS25V?=
 =?utf-8?B?M2VUcUxDcmtUQVRCMEcrMlAzeThhaEhkMEl1NzQwMGpqTTVxSjEwS1d2aGFY?=
 =?utf-8?B?UnVnNFQvK1hxMENDa0l4Um5GMDB2Q2p1aXgvVU5qV3pRVVlOaUFRY1ltTUZh?=
 =?utf-8?B?aHJUNThvbVhEeFNnR1hjRWxaaVlWakEybnRQLzEvNWszUXE4NzMvU0tOU3NF?=
 =?utf-8?B?cVBGVG15TFp2VWVLWTliT2piUXhnb3JCMUxXNkZENnl2RXBIMWhpbm91NTVy?=
 =?utf-8?B?b21ZaTc1R2VYelR2d2p1UndZNUR6WjFYN04yVytIemlXZU0rM3FLQ3NjeU5L?=
 =?utf-8?B?eVBnZWV1aE1oNTRmSkZjbHdpMjBIOWIxTWlpa1ExWnRVbVNDaDJ5K3B3ekdJ?=
 =?utf-8?B?UFVydkN1aHFrbllVK2lPY0R4UkFkZ2Y4dXhFVytjSHF5VXRnWUlBK0x6NGJl?=
 =?utf-8?B?L0RVbXdSVGdPcVRmOXF3YzBDZDV4cURnSGR2Zkk0SGFWTC9kb21JaGxvR1dK?=
 =?utf-8?B?ZmFGeVdyeTZWallqNTFZaGpMUVB3V1ZLWVBuVHBwT3NHQ3M1d1F4bU13Y0lo?=
 =?utf-8?B?cUVQV05OanZ4cm1SUXpCWmJvd1ZwZERqV28ySXhEVGJGemxTdXhmZHRsZFE3?=
 =?utf-8?B?V2srb21aYmFiWlV6T0tBdVBvZmVrK2ttSU5Ob2QyUVg2UVlkbXExbjloTHho?=
 =?utf-8?B?UExpZnRBY1Z6MFZTcFlDSUUzK0ZMR2tyUkt2bUNMbGhjQUczQzBzdTRXV3pV?=
 =?utf-8?B?VlJmRVBZOEhqTGQ4c3ZrYjNIR2t3R25WbVBLczlvZDNkZjFYc0VWaHpYV1hV?=
 =?utf-8?B?VGhnTzYvbGNrMC85ZHpmTkhyaW0yNGQwUk5wOVlBWlp0MXVvOW5HbExISHBL?=
 =?utf-8?B?ckhwc0NxaXNHU1IwUXc1dTd3YTFUQ01YYVplYnZ2V0hkMEdtL3JxbWZVejVo?=
 =?utf-8?B?OS9vRTZXd2FVUUtDcFhZL3daMGZqdVF3c25OZUVxMXRJcjV5UUcxWWpNRUJI?=
 =?utf-8?B?eHRhOGZmZVhwdFN5UWRHQ1VkR21QWFlpeVpjYUJpTmZHbk5vdWFmbUVuVERM?=
 =?utf-8?B?R2ViVTF6Y1dhcXl0UnlvV05Da0U5STBHYnZrQTdKYUtCWmhwT0FqUXlTRmNE?=
 =?utf-8?B?dDlhT3g5NzhXclVtazhrOHB1QXYzRWV1YnNzTFhnNkJkQUNhcEgyVDFsMzFq?=
 =?utf-8?B?TUc2VnBLbSt4UUg4cSt4VXRNMkU2NndheXR0RUExWkw4NmZvSDdKcG9rblBG?=
 =?utf-8?B?bTJLRHlRMVVleTFmU1lsWmpVWG52MmFjMnV1UHVJK0FuWVFYLzFRV1pySlYv?=
 =?utf-8?B?UFMwdGp4Tmp4TGs3NW56S2lFR0ZRQmZIejVSMFFZQ1g2aDVkTEZJSW1qMHFq?=
 =?utf-8?B?cEF5ZHdUOWF6WDM4NzFDaHI0ZDA2MTFlSjFONE9TYWJzZFNqUTFhcWNEYWdm?=
 =?utf-8?B?eGo5WTMvL1NWc0FjVzRzQk5od3JTOHhFRWxvTkpYblYzYVlmenBIakFEZHUx?=
 =?utf-8?B?blpEb2NBa2ZIL2NMVzBadVF4Mk1VVVZNbE10YU00dVJCN2RyZFNydEx5M0xN?=
 =?utf-8?B?UlJ1Rm01NE56dGlpMk5BeWZPeENrMUFpZnkrYzdoUzRyVXZYODNYaTF0Z3Jt?=
 =?utf-8?B?M1BSZHNWTDk2MmlQU3ZZYWNLVmRuZVRGYUVKSFVPRXVkV0ZDTi9hSkRFdnlH?=
 =?utf-8?B?dXZxWE1oOFh3Zyt1Z3dsNVMzMGRFbGhMcUM0RnI1RlNZb0EzRm95NGp6eUti?=
 =?utf-8?Q?FG8ttKrafOeI4Mpc=3D?=
X-Exchange-RoutingPolicyChecked: UX/mGfQYkCdRNI+oqsuibPJ2gunYqLMVjLPnp0fxi4cvaDbl/h7T604katpj3VDmSmfWA91p83cx1iybYtRBKdhwCFTooVALYSUc64LBFz0FlP7xYypvQH02CEDfoGmNnqJoMbdJ5Sph5/7tg7Gs8XaYnrx7iUzQSECLOwIuzVpW+vkILFRO9pGjqcMG7nKuMCll4ClChfTq4N34gaTKFp6g8/JLweY0iT5RM2py2zz9I2TkYBYw3dYpxc6IxyyFbOmOCnJruSUmZP6WJIi4cN88+LEGAxYXLkXGv3OApPLzqt3LmiLCXKNWy1UIDE41a4KiX/utsyVETsKvhaxJ6Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 04a2478d-1047-4475-8ad0-08dedce06def
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6967.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 11:02:41.2162
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 52VbM84Ptc50pay7839cKgBYXHDglYC7a6Uhxe+UuK/0M+B39W4prYrckzR1/P6NOq9OAX9YGds3hpA5Ex/LZgmcCo5tq/cn3OAFXH/zIq0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8212
X-OriginatorOrg: intel.com

On 7/8/2026 4:35 AM, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> snd_ctl_open() unconditionally overwrites the return value of
> snd_card_file_add() with -ENODEV on failure, discarding the actual
> error code.
> 
> Fix this by directly returning the original error code returned by
> snd_card_file_add() (e.g. -ENOMEM or -ENODEV). This behavior is
> consistent with the error handling used in other functions such as
> snd_mixer_oss_open(), snd_hwdep_open(), snd_pcm_oss_open(), and others.
> 
> There is no functional change other than the returned error code in this
> failure path.

BTW, as you've provided a number of positive contributions, a tip for 
future:

The change is simple and does not relate to any workaround or some kind 
of 'recommended' sequence.  And thus there's no need to be as verbose. 
IMHO the first paragraph suffices - explicitly answers the _why_ question.

The last is completely redundant - return code is a functional change. 
Similarly, "Fix this by (...)" in context of such a simple change yields 
no value for the reader - we see _what_ is happening clearly in the code.
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---
> 
> Changes in v2:
>   - Update commit messages.
>   - Drop superfluous braces.
> 
>   sound/core/control.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/sound/core/control.c b/sound/core/control.c
> index 0ca9fff56e51..73d7ba0f509f 100644
> --- a/sound/core/control.c
> +++ b/sound/core/control.c
> @@ -63,10 +63,8 @@ static int snd_ctl_open(struct inode *inode, struct file *file)
>   		goto __error1;
>   	}
>   	err = snd_card_file_add(card, file);
> -	if (err < 0) {
> -		err = -ENODEV;
> +	if (err < 0)
>   		goto __error1;
> -	}
>   	if (!try_module_get(card->module)) {
>   		err = -ENODEV;
>   		goto __error2;

