Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B805F476045
	for <linux-sound@vger.kernel.org>; Tue,  1 Sep 2026 08:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788253073; cv=fail; b=Qnje26+MD2tQcFe4gD53L5c5z3V5LiYrKbDTldrcL0FU241qiXT9frw0J4wXeivMHZm0kVUFA2ZOvuA7ybH7yff1bnOwsJa69y0+uLB3ezZj+M6Al2xJnQxOmsDxlCmIfK5zv/Dc0UYJq4E2qIBsNyXpDPkx/JbRp228jG5P+bU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788253073; c=relaxed/simple;
	bh=hSdIHlmFQOl07OxBIQbQRki+70R0njqp9MTHaUAfMcc=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=dAgUigTNfKJVZSfWdM8emMcGsol7/nD36/Y5lbSZpQWe9bKw8lSwpLdkDZOP99uzBo4bKxx9LV7RNftvEOyRHbhR7N/cJSRav3ZbHgtgkbh1S/mx34rS6CJ75ifgNpcSi++eGi+mBjcnPeH3gS2/FKusYyOZqXjK+3G5c1COf7I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C4F5qjlQ; arc=fail smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C4F5qjlQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788253072; x=1819789072;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=hSdIHlmFQOl07OxBIQbQRki+70R0njqp9MTHaUAfMcc=;
  b=C4F5qjlQrC8ud4aGv7vZgTxxe4uIwsszN9DlALQzPXdkg4DHtLuxOWGD
   HgVYYza5k5hy6CfTYBKdJS2Y6Ks6DubZV2kUVu23cnDDQbDoFz3UXJUta
   ioAPU25Wzyt3UWfcLCQ4I5azQb1QvHiv9a4ts2W9kut5qQkw8WT+PO2jX
   PO1MoLYX68XKlwpsonVE6M7ZAuOJGSrOq6KbCL12qtwtWfSbniaeeIyQ6
   pKepXjOWxKB1jJNZOqQ8Q48skWcOaBeluRCKjvbv5PpJLtFfuWfD5ARlo
   CGzzZ2GCXly/9ZXgLPAJQ/Eocmc1vbeeCmowVgvmCr2UXAp4ia83hGbX2
   A==;
X-CSE-ConnectionGUID: KTQPD+73S/2nSlr7kpdTRA==
X-CSE-MsgGUID: ACUTf74AQGS9lBpZNP/BQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="88435109"
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; 
   d="scan'208";a="88435109"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 01:57:52 -0700
X-CSE-ConnectionGUID: eGfIMVzMTT23v0wygB8ALw==
X-CSE-MsgGUID: LcAZcrK5S/K704GaOJqERQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; 
   d="scan'208";a="270983749"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 01:57:50 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 1 Sep 2026 01:57:50 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 1 Sep 2026 01:57:50 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.14)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 1 Sep 2026 01:57:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g7s9C/sFD2YFJVI9PE6Hq9tiSZ8aNp9yZVIybCCXrxnKtFFyuc6mgdbwZP3xHv8bvj26dD6aialqLXM4miYA/tof1I6xVHdbnGWckvA8TrdnfIWlGpMvP/G8jjNAte+/O9qys8e0kvcGvcpSqg5oYzv747Bb2NLETMNSaVG715mxpMGRLO9Q9mAMBqbvSMk7xyD/E7iSJdpu1oqOnL0oCxtcjYrxDQuwqPByoL+C2+D9fyWnBTyy+vN7V0YhoDynJIvJCaPF98HRpQH1ifuDF368FghNehbQtXEY4HXv3o65RZZGgFkxAVp9GAUUHX922qztZilVbx5LJJU6bRhS/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H/7tNTC5MyM1n+k6XDRKBbspPdRLtndjf4rQXjdYVMQ=;
 b=GuzOY1yUVaor981tswF8WnYAHWiFmMcfptjxrxXPjP3G+Co6hGBBcylb9CfGFPRGRQTts9mIvua8mjtwetbt273O8vste0g5/Y0LkTOlz0KvZ15T+NLYTVuRC0SpTSR1JmlPAj/UuTxFNhcP2lTruuVx8eYdn6oHYZRSCPRIyIpv1YloqKIrG4AvX0w4AEgtA0Y2v+j8sfGAikPRL3Wd9gusOGZGKwR5xMFB7nTuisR3EZ+sxrCCBZeAGIqS+E+jZSwYPd/nDKvfQxuYoP5Z2ZbLgu2rUQrxpDVcDmODyOy4Ohe3jGcrzlkzrO/SeWirbzOCS1AtR1UpNaPGOr03tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6006.namprd11.prod.outlook.com (2603:10b6:510:1e1::13)
 by BY1PR11MB7984.namprd11.prod.outlook.com (2603:10b6:a03:531::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 08:57:43 +0000
Received: from PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd]) by PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd%5]) with mapi id 15.21.0360.008; Tue, 1 Sep 2026
 08:57:43 +0000
Message-ID: <3f2c2a7b-72cc-49da-bd19-09b1d5fa7275@intel.com>
Date: Tue, 1 Sep 2026 10:57:38 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/10] ASoC: Intel: avs: Refactor and fix init_config
 access
To: Mark Brown <broonie@kernel.org>
CC: <tiwai@suse.com>, <perex@perex.cz>, <amade@asmblr.net>,
	<linux-sound@vger.kernel.org>
References: <20260831164233.1487766-1-cezary.rojewski@intel.com>
 <20260831164233.1487766-10-cezary.rojewski@intel.com>
 <1f928229-1c43-4260-90e9-9e1bd1cd776b@sirena.org.uk>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <1f928229-1c43-4260-90e9-9e1bd1cd776b@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR02CA0063.eurprd02.prod.outlook.com
 (2603:10a6:802:14::34) To PH7PR11MB6006.namprd11.prod.outlook.com
 (2603:10b6:510:1e1::13)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6006:EE_|BY1PR11MB7984:EE_
X-MS-Office365-Filtering-Correlation-Id: cd8a1cc1-2b83-4168-bbdc-08df0807157f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|11063799006|10067099003|4143699003|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info: 3r+XXsCYq8AYeHGwPviAFa72Al+AuTih3PyAwzHiEN5tM6378OAIiDanferJugRHbsfgCB3yM3HXiau2FfeCm6djN/GlWkMid26qdvXRkLwNF8iSuEn7izPdVRyofG8CRnCRULodTja0n/MnF8Jl0IhaATebEr1/Klf1L6qg4dpJELuw8tH4LcesJBU925RVUiA+G/6yNzkylNMZZCdIL9LL0xFZom302A85uqK7v3QCBg1gim/lL7wokw9Fro8NNlljcNlMDekuXmZuuqU0SM7aSIjsP4UZPjYhY+Z7mjWU1SA9rQP/xdzb3b8OayZn6LODJAaawYSVyfsDG1b3f23Jx+kvjpJluP/EUpLZ6yIjIpTa+cNLQf8vfa6M7fyvy9uG8yT5zntxjWyUnEJ7FyBgVmg3QBK5CtStS4Kc2/TjmZUf5e4FUBv9Gm40I5akeufwfSxPsrMTOM6wZLzuywsftDt+1LZzg6AsmlpkjUI4v5yyzr0KphsRMXNM9a5kQN1jOYzeivFaKFGgJzYUtbsufd7SzHlecHpEDPUrwBfmse4OPWnW0Vi8VyJsP2H0s6UXdXGYS40L61XK/nY5XP7MJFV6dB8yyXahNB+OyUvH1i13FW9KK3D4ZSyrsTzU3A9Yf3cuiE/+h2vQ6OITwoYokBOtRbii/E5ogbxfdFU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(11063799006)(10067099003)(4143699003)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vms3WlRHclh3MmlnenhiRWlqSlpWK1FybjFYN3dFTUQ1Sll6elVwWFRTeGhz?=
 =?utf-8?B?dWZpQzEySDR1Z295NGlySDFjZkJseXhCUFpybzdCcmxLYXl6T2NQQjFYVWxM?=
 =?utf-8?B?NHYrWFJnM3VtMEdTbUFIOS83RkJ2Q2lveGFyRzJsdmE4VUsrbk41b0NjVGh5?=
 =?utf-8?B?V0J6bUplSlcwUjNlbldhSjQ1ZWN5alVKVnZuaXYrQ01zcTVEeHVLaDdzd1d2?=
 =?utf-8?B?VnRqOEJSVGp4REtNcXN6SFNKTmJaTFQxMFFzamt6YXdzd1hONDBBSXJoY0ky?=
 =?utf-8?B?OFJNc0dWaGxWRzV5aXo5SjVRdzYrT05QZXhrZVRrOUllUDdadm9hQVZuR0I4?=
 =?utf-8?B?RG1pdW1BRXJzNlJydXA2K25OcGxrL1g4UThPYVk3TmRpNlh4eHpJZ0JZZGUw?=
 =?utf-8?B?Rzl5eVVEd0RGQXl4ZXhaaWlqMldCV0VqdWJhbWNjcnQxOVV0QWxYOWZmM01D?=
 =?utf-8?B?amVzTVVubmplSkZVZ2tOd3NLU1hOU3V0UVNMdHBSdmhIUGpSdGUxWFNXaXcv?=
 =?utf-8?B?Y3JxUk91QmIxOEIwUzBCYXlHV3J4MjAxN2htQVRyNVZoRk9UODFwS2dOTHVG?=
 =?utf-8?B?bnRtdDdYOFVDYzhRbjBFMHRjeENKUTRYNzZ4UE4ySWFENDk1Qktja2ZWSWNX?=
 =?utf-8?B?WU5LemhTNWlBMW81Yk10ZkRoVFhKWlVacXcxT1hXQm1uWk1GTnNUc2tSUzJ4?=
 =?utf-8?B?NDZCZXVXWUszekdrTFQwTGtIbXJ2RnFzT2t3T1VIVTBQaTNMdFJ4Y3BqQzdl?=
 =?utf-8?B?dzBOMml5aWMxVHRVQXh5WDZnMkN3SDl1WDFPTUM1Q29tTnpZNmNuYVdZaDhx?=
 =?utf-8?B?QVExRW9TZWFDVXFlY1l4d2N1TWEzSWJlSnlOcENmZXFVYzNBODhYNEtuTTlR?=
 =?utf-8?B?Rm5CQ3ExVXZ0ckRSVktOYVFZc2lWUzB4WVA2Nno1MmxneTNBS3BBNGNubTFB?=
 =?utf-8?B?Mjc3RHprVk1NSWVTQWdtR0Q2MnRWRVJHVkV4bGczVUNDSS8rSXg2UkZwMzdL?=
 =?utf-8?B?bTl3dWtrOE1McktQRUtSRnFaNnUvRmMrY1BPUVo2VS9BVzFlcjFPUndON09J?=
 =?utf-8?B?Ui83TE5RbnJXSW1WUG9wK2YrdTVpSnFwQ2oxYTlTYS9rR0V3R01relB0Vjkw?=
 =?utf-8?B?Wm9OM3oxOXMzb0FFdk90RzJjUGgrZGlUcHdIM2dGaWVDN29yZDJSZnZsVENI?=
 =?utf-8?B?Mnl1aElsRWs2M29LajBjY291VFhFSFpNRTJzR2tLNHJVbUE3Vng2dkVaaXJV?=
 =?utf-8?B?eTdjNnVsMUdXaHQyUmcvQzBmSEw1SEJwL0hOUk9vQjdLNkROYlpVRWtXMGpO?=
 =?utf-8?B?WVhBVlpnSkdLTUliSHg5TnBUWUtXVC9ycVlCemJoK1ZvaHpsd1FJeUpsdFdu?=
 =?utf-8?B?RDg4bDdXOUxsOW8rRlc5Ry9BSitqTTBWdUJHNjVkOTVPKzBXVWhIY2pKN2ZL?=
 =?utf-8?B?VHRXNmZ2TXNMSVI2NUo3YTF6YS83eXUwNUhJMWFmTjc3Yk9zUkxzREhrbEhY?=
 =?utf-8?B?NG9hQTFzUHRqckhERy9mK1RuVUlEc2pqYWVBeDJtWEhxSFQvdXgvZElZRTN2?=
 =?utf-8?B?c3FzZTkvcDhTU0Vra2dHaW95QzZPcmxZNGlNSEZaWVBLdXIvSE5iTE1DNDNW?=
 =?utf-8?B?cHl0emJrRVV1VkIyTDRqZjNMcjROMXU4M2V0YWtzVVYvVmR5bUNGaFNkSXdn?=
 =?utf-8?B?VjQvSkN6Z1c0TmFHS3dldmlaN2cvbnZzaHZkVTdybGpORGFEZnZ1Nzd3KzJU?=
 =?utf-8?B?RjlvNzd5YjI3UysxekdWb1lUZERPT3NtUVBleXEvZmJUWHkwZDFwY0xnMTlZ?=
 =?utf-8?B?UEVjKzhUYzhPN2t1WFJlbEsvdGFURHBzSTF2azB0YzRIZW52d3lpckxxZ25S?=
 =?utf-8?B?cWlpbEFaR0NMYUN6OEJ5L0x5SE9mZkZJWU55NXY1UGt6b0VxdkorZmVzS2V3?=
 =?utf-8?B?OTVKQlN4cGk5MFVlVmJnSVVwMXYrNkV3MFpTa0VQVzBsMS93NXFVRThnanRy?=
 =?utf-8?B?M0NHNTRwNTJBRjBwRURrMXBCTzdRVi81a25SVFhIaEVMZzdoRkZxZThFUGhF?=
 =?utf-8?B?S2wwNE1YWVJaNzc4Yk50TUUzU1g5OUJYRGNVdFRaeXNrYUVwaEtXRTRIMmRn?=
 =?utf-8?B?c1dZMjc2TXd1VGUyd3ZPUXVGTDRXRXg0cE12SkNvN3lzcVVBRE1mTUdZd2JU?=
 =?utf-8?B?MGRZYk1NMlZUL0xONlhIWjEybm1XdFBMT1hrTG0xMEVja2VpRjRHaVVmVHV3?=
 =?utf-8?B?UHlQemZ2MkFZN1l5bWlxYWNxYVZhWmU4aWN5bXVRT1Rhb3kwb0RuR29HUWlP?=
 =?utf-8?B?QldqdzQ5Z0N3Ull0dCt2YkpwS29tcUg5TFI1U0VLRDhZQW9HNXhRRW03aWNO?=
 =?utf-8?Q?kIgQ0Fx+ygquwMsg=3D?=
X-Exchange-RoutingPolicyChecked: WnVvxrizHH8WS6FC0b3/gAc6eFE180JCYtmLK/OLL0lN1ozJrQ9IO4czSrWd2JMwDg65C1Fx7O++H1Dlyc8mV7bJWE6AuWr/mqWxJNtzK7/H5dpVratZmD6BtZxwY4ahFLzfCHil+uJHu3ucNz9w/UVg7gdr4CfyPVL6I4rLbGhUCuwucgQuWa139eb4QVqCWNolATJmbCHwla31j2f+v0Qz+71VFwEldH3sKBz6UQWjWbly/DwhEQjjL4Q8e6GJ8zOs44Ugcb7mVmR4mWm3g75fVZFr0W2mAHmkfN46RWMVqXxuxgHzngr0cfFcS35W+ueIs5ZAW1OZYKliJbJwZA==
X-MS-Exchange-CrossTenant-Network-Message-Id: cd8a1cc1-2b83-4168-bbdc-08df0807157f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 08:57:42.9509
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XysWOIH7qPF7HtYtOACtS/QPZR2DEOHHLeoASDSSmP+j+I0DLmycHY2nnwf9fN2T7PS5SSxPl4SA91PLhTCkdmoItT9+W8CyPyH/rLIK88I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB7984
X-OriginatorOrg: intel.com

On 9/1/2026 12:30 AM, Mark Brown wrote:
> On Mon, Aug 31, 2026 at 06:42:32PM +0200, Cezary Rojewski wrote:
>> Existing code accesses enties found in ->init_configs array through
>> indexes that are part of ->config_ids array.  Those two are limited by:
>> ->num_init_configs and ->num_config_ids respectively.  Using ID larger
>> or equal to ->num_init_configs leads to out-of-bounds access:
> 
> ...
> 
>> Rather than adding another if-statement, refactor the code.  There is no
>> need to store the IDs, have a list of pointers to actual config-entries
>> instead.  As the verification of ->init_config entries does not differ from
>> verification of other types that are part of the topology.c file, simply
>> reuse the code.
> 
>>  static int avs_path_module_send_init_configs(struct avs_dev *adev, struct avs_path_module *mod)
> 
>> +       for (int i = 0; i < template->num_init_configs; i++) {
>> +               struct avs_tplg_init_config *config = template->init_configs[i];
>>                 size_t len = config->length;
> 
> This will dereference every init_configs entry...
> 
>> +	cfgs = devm_kcalloc(comp->card->dev, module->num_init_configs, sizeof(*cfgs), GFP_KERNEL);
>> +	if (!cfgs)
>> +		return -ENOMEM;
>> +
>> +	ret = parse_dictionary_entries(comp, tuples, block_size, cfgs, module->num_init_configs,
>> +				       sizeof(*cfgs), AVS_TKN_MOD_INIT_CONFIG_ID_U32,
>> +				       init_config_parsers, ARRAY_SIZE(init_config_parsers));
> 
> ...but IIRC this ignores things it doesn't understand so will leave NULL
> entries behind.  You'd presumably need malformed firwmare or something
> but still, we're parsing data from userspace.

Thank you for the review!  Yes, the parser will ignore unknown entries
but these are two separate dictionaries. TBH I'm not seeing the problem
but the technical background first:

struct avs_tplg holds the array of init_configs:
struct avs_tplg {
	(...)
	u32 num_init_configs;
	struct avs_tplg_init_config *init_configs;
};

That memory block gets allocated when the topology manifest is being loaded.

Now, struct avs_tplg_module holds the array of references to existing
entries in tplg->init_configs:

struct avs_tplg_module {
	(...)
	u32 num_init_configs;
	struct avs_tplg_init_config **init_configs;
};

tplg->num_init_configs != module->num_init_configs
tplg->init_configs != module->init_configs

The memory block gets allocated when the module template is being loaded
(DAI widget).  In contract to the manifest, these entries are just
references - parser avs_parse_init_config_ptr() is used (comes from
AVS_DEFINE_PTR_PARSER macro).  The parser checks whether the ID exists
in tplg->init_configs and then assigns the reference.

The goal behind this procedure: reduce the amount of memory allocated.
The manifest takes that burden and all other topology components just
reference its entries.  No information is duplicated.

As I'm very used to the driver and its files it's quite possible I'm not
seeing something very obvious.
