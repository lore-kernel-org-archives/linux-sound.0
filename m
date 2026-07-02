Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C42A357CE9
	for <linux-sound@vger.kernel.org>; Thu,  2 Jul 2026 19:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783020666; cv=fail; b=BtNtPdDgmggs8hU6qM5HSbkIQjUJlBVAjxdnYGh21UUxItO9EbvVWJsIK3IZARH37b/vnpRjoV5MD7poPKFLmlmMR2HgixLkLkM7BIl4c6w3JUKXVJoRLfqwuD+O1MSY9IPzrKkj9LON/d2P4bZXASdaml98pfzxUGF+aq8aM5Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783020666; c=relaxed/simple;
	bh=rGO3rIff5RGn2g5AQTsSrB/T8m7gG/K805k0WmAymfM=;
	h=Message-ID:Date:Subject:To:References:CC:From:In-Reply-To:
	 Content-Type:MIME-Version; b=EHNK9jdgG649sxirvWomW3Xiy80jB8enz7m1f49VhgTrHOQnlQtkCzzIfaRNe5BPzr9yEcx5vFwjZhmeMv3ooiAYlW4TFMYafUWX7bnoDNoa0cVwyzjFN6NckR0dtNe5a3Db2VLStuSa7aIFEpkSdYCnIHuYVTJ57SyMYUUzGnk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lvEZpOvp; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lvEZpOvp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783020664; x=1814556664;
  h=message-id:date:subject:to:references:cc:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=rGO3rIff5RGn2g5AQTsSrB/T8m7gG/K805k0WmAymfM=;
  b=lvEZpOvpe5Efz4sW9UqsTMVFfHRHGM+6yfY2xcKoaw7IVn8MW288D06F
   W/Fs0zKnwG0p9E5tJtluAFZHSCxEpd85ZfSQ3Lln0+PS5EoDU3NeQgYl8
   s1uxt3hTHw6ixQ/gcI2V/edN28ADFxu8V9NHx60yJw6JPe3ZABfTeOtSl
   m6AUltHJt4XRJBZ28iBU+09iuMtbwZkMNxaP7u2umL4SUKQx49spEurAp
   aOxF5zvNIsJex7+OAo4gsL3RAOEmhFKTH5iG0sBKs0dkFWacNh4WB9p24
   5fPiZ/tqtSowgjQKpcOyLlCxJDTCrpDGDUhU593OXqF1gFgHLJa0qRUjs
   Q==;
X-CSE-ConnectionGUID: kRIVyi7NSSCG/scJXu42JQ==
X-CSE-MsgGUID: fCK6EobARE+5LmAy3Fjx7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="94935860"
X-IronPort-AV: E=Sophos;i="6.25,144,1779174000"; 
   d="scan'208";a="94935860"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 12:31:04 -0700
X-CSE-ConnectionGUID: 0wq7kitrTrO3I9tq/l5vjg==
X-CSE-MsgGUID: jh+5BW3hR4KkZo7PcjKGGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,144,1779174000"; 
   d="scan'208";a="277260342"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 12:31:03 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 2 Jul 2026 12:31:03 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 2 Jul 2026 12:31:03 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.46) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 2 Jul 2026 12:31:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J9SsEjeRSgD5D3d7tTLhgpvU6vPPCdispT1MI/LkiS5BbEMV7yLPVGI8a1nq8ms0rsZwvGPjC1hDRPKo1AsdYftdEGlH4+9qarRoFSnB8akuPYXomOCYLEIgHMvBpLs01kFJuaxHdFnlY/EppBAMDarLmrfpQZKK5sPv705WXe1di+4p8haA+VejzjkB+UNjZIB7U/4bt0pc0+yJuIpCyODquOzEjX8BD9y5aQkSRwOkohFDFZ1gF277jHJC2uZ10oEFwtkzv+pQSIxtUhKN6sIAFhHt2X5D/2nf3rjjeE2V8YjTYZfEC1bsDpFls8WuqAz1Y3u3VGpd6RGDJ/YMog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5t62k79SA7I7M0EsPAn8EISXcilSheePcFD0iNc8AFk=;
 b=xwtGqmWr9hPAo68Kw1oYX+XJ03Vg0d8OLyRIR6dFfil40xdXWt+CbRs6NAd1+kJb24gimrwY4ssXK7rguxAk+mAvnbHp/SZbUrKgMXmS0Zp6pyNmT/MJAzs2l5giUc1Et8ebCsIVNt/dDs8Ps+v3cpSo9vjc02nS7MfFkz2ZwRt90NtpvZ6gjHVjEg5aVdX/jI4xuE4o7re0hMwUKLdjx2oUcPIIBdQvyY4PCj6akkyRghQ9incljTkD7QzlbTlpiDi/OvLuUEdN6KlUahKeenCItv/8kgeg03I+v9rpIdfOpP+892HC1OQL+demO75kbLvbHAR1VD3nxUL64mLOWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6967.namprd11.prod.outlook.com (2603:10b6:806:2bb::15)
 by IA1PR11MB7173.namprd11.prod.outlook.com (2603:10b6:208:41b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Thu, 2 Jul
 2026 19:27:53 +0000
Received: from SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4]) by SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4%3]) with mapi id 15.21.0181.008; Thu, 2 Jul 2026
 19:27:53 +0000
Message-ID: <64a890c1-5db9-4bfe-bf28-4ab5e4d1b1af@intel.com>
Date: Thu, 2 Jul 2026 21:27:46 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] ASoC: add
 [devm_]snd_soc_register_component_with_name()
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: <87v7ayxk3s.wl-kuninori.morimoto.gx@renesas.com>
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
In-Reply-To: <87v7ayxk3s.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIUP296CA0149.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:34c::17) To SA1PR11MB6967.namprd11.prod.outlook.com
 (2603:10b6:806:2bb::15)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6967:EE_|IA1PR11MB7173:EE_
X-MS-Office365-Filtering-Correlation-Id: ed17fd35-769f-4ff8-5ee0-08ded8700321
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|23010399003|366016|11063799006|56012099006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 6fiCLFKeipwsvcZom5ozHsV6HRmj7yGR44RvVegLby/S1I3f936k35fnqrqGEBpXeTPaVI4cUiVJ2yuc3rWV86JC+VrKnaF3/pUTElpkke5pk62/V9tXIJvDzBlhIeztr5o3WofeceEJ3PUWtklqKwAmH9VgF0eOwOySVDrNLRZnXbqMcZxbrv0uhLu8LkWEpihTGrdAUESy6D3PG0fa2bYJu50tHYx1tC48nOfycnV3DUnuTXcPZDgT9kPVcM1RoZRYSSVc04F1Fqw+cBjk0lJar+6TVq9CS3QiMVxyzDRCdaa/eODG6juJnXzDg+y/CDknKR3JzMAgnhoAvfGV4TJiqYvoO+ymFgeZofCoyRJk4EkqzwgzG2gCnWYt++VDHgufaqZkkRRfq0MOHnDeYOTLjSrOmWlvNgqra6E685FPy8cJLF6OZD99YoKxfO2TBpfItM3gzp14ChZ3ulWhYLLbDLol6njU/1k5CwVSy42yRPiCI3SB6+BI6jUgXnm9fvi4vd2ZPGuy/qr2xM1XN3zWvCML7F5MlUgzbhF81CsvTiCXg1YXfe2dnAgdYgrLsZczscS+chaRIhdg9KNqL/Nxr/QZ2Es1gjs9Iuc5Rp96Srpk9HGlEkUGEgz3SuUjmBMQdCEGFp+armQJHnxQ5Mepq76OuJyvJLXdAozCquI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB6967.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(23010399003)(366016)(11063799006)(56012099006)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SkpWaE1tMFpMVHRGYlA5dEl4THlpMHljU1BpSTRsQTBoYkJvVDJDS0pPMm9s?=
 =?utf-8?B?MW5saGFLWVkzcW5pWHpXVjdLZ2Q2MzVYRmt3MXlHNUtQUkNwVjhlUHhaditr?=
 =?utf-8?B?RTA2U2ZBc3N4VW5xTWN6Nm0wTTNRY2N2TjFRYlN3akdoZWVLcW43ZEkzTjU4?=
 =?utf-8?B?ekVoczRDMkFHZDdVUGxLbVliQTk3dlowVGVybCtreWo0c05RN1hOUVJqZzFj?=
 =?utf-8?B?VVhiK1J4Z1Nwc2JpbGdqYWFIR1NDUzRTVVlTWk9aUDRjZFdxdUVIVnJTODFZ?=
 =?utf-8?B?VjlLODgwTEZDQXd3cnNnMGkyb2lKZ1hBU0tnSDFkczE2aFNCQmFCTEk2TzBT?=
 =?utf-8?B?SGxpWlNhR25ocC84L0w2WmtoOWVJanpsc2hOQlpsT1V4Mmk1RW1mMWhqSElG?=
 =?utf-8?B?VEdGWExZUDE4WUh5eTVqakF3d2R3RFN4WGJUWEJiZUZjZ21LZDM4YkNWR1BE?=
 =?utf-8?B?WEdmYXdneWRIVk8wVXlndXhUU2JtV0p3c21KYnE1RkIwWTl5ZFdkZzV5dXpT?=
 =?utf-8?B?MTlOejluMStrRVlrNE1BTVI2QmgyekpHR2VUZ0hDUGF4TGo2aE5FQndnREpC?=
 =?utf-8?B?bURQU0sxaFVkUExpVjVXZ1lubnhTSHpqSDFuemlqbnIwcHhDOThVOUdxYXY3?=
 =?utf-8?B?ME5nT1g0Z2p1eEg2b3ZKN2Ryc2pRZ3JWU3dVU0w3RmdQd1hCNTYyVjFmaXRZ?=
 =?utf-8?B?OXgxUTltMGtNV3czMyttblB1clcyNEY1bkNDUmN4OXlOckpQRlBoMmg0OVhk?=
 =?utf-8?B?YXh2cDh1N3FPM2IyUlRYTlMwRGNhbGptK0FBRFAzVlRZc1JSZGljcW5nOU5K?=
 =?utf-8?B?ZmRMYUtRZ0g0a3FUL1NjdTRIa3RYbzlwbkJIWTJhN2JVeXFBSWVEZ0w4a090?=
 =?utf-8?B?aFFZdTB0emtXeDFXUHBEYm9JcUxZNW1zTEhoTnl5d2o1dDNZVm9xUldFbko0?=
 =?utf-8?B?OVBBaFNXQVhIcHBEdDRhdUVBRG50NExnVDdkTzhrT3F3RW4yM3UvdnNnU01k?=
 =?utf-8?B?YWd3SHg2TC9yR0RoSExTOUx3SERNTWFaQWdMc05LbTBSanVETDl3eFFrY3JP?=
 =?utf-8?B?ZDhUZHJ1LzM4eXFnZkt2NXNiTnpSb3ZCcUdodnMwb1A0WWk5UnpsenErMzV4?=
 =?utf-8?B?MEdhK1ZZZTBwamdRWVc4R1hjalI2dTRucDFVYUE3ZXI3ZVB1RVJHZFdJcE42?=
 =?utf-8?B?aDd2aTZ2NStjSExmRUNVcXNHeEUrV2p1NVhSdkg1NGY5anFYNFdxeTBoUjJR?=
 =?utf-8?B?QW50RzdCMEhiOHhzNVNZQS83WCsvYzV1RCsweTl0NWV5SWxtN2RBZEJhN1Qz?=
 =?utf-8?B?dlp6NnNhZDViWk53Y1hWdkl2MXE2NmdYaHVsQ3ptTjNvSjFsUDNYbjR4Y2k2?=
 =?utf-8?B?amt0QitZM3VUMVdnUUFaR0tYSFZZY2cyOXRXZFhEcWVQTkRWaHU3VlVXeEZX?=
 =?utf-8?B?ZG16c0ZPTnA3MldUL0hmWUxKTEJONEwyZGJuK3hjOS82cHA4cEpXTUFUZWV5?=
 =?utf-8?B?a21ZaHkwNlRFWFdQb0ZFbzUzbGdpV2FKZWl1VEpWN1VLdnBMZ0VDVmlBazVp?=
 =?utf-8?B?Q0JzVm00ZkFBNktOa2htM3NHcCtjcDRnR0d2aTFLRzMxS2NLdjJwRW15RTlD?=
 =?utf-8?B?UXgrU0dJRUNwaG93aXk0RHFmVGI5M2hnY0k1c0l3dEY1UGJTbkFDWnRIZlo3?=
 =?utf-8?B?REN5WnpaWFErdGI2d2hqWGozL0pDRDExSkpmNk83aHBIaCtSSFliNWkvTG9V?=
 =?utf-8?B?Vitwb0tXcTJFUWtxdjdVNnlqc3RJUit0V25IUnZpTWZZWHZhL3JjTEZkVUZu?=
 =?utf-8?B?Q25CeWpTTm8vbWE5V2U1alc3d1YyV2dTTmg3OUZKY0s5eWV4MnBYN3hTNkFT?=
 =?utf-8?B?YjZYYTRpZVU0bHBCblc0Q0RBdy9MT0dUTXZnZFdIeUFEYTltWmVPL29lS3Jo?=
 =?utf-8?B?aVdEdXlPVmx4TlRYZ2lhRGVRUU4xU0RyNUJoMjcvY3JrU0R5dC9LemhkT04w?=
 =?utf-8?B?ZUJCdU5VbzFHTVdnYWZ4WjhlNXZUYzdSZ2ZqbWlTWTVudjZpa1JoWHo4bm0v?=
 =?utf-8?B?eXFFYkJ3WXR4eWxhUVdWTmUwZ0tWT24wbzQ3bUhEK2N4MnJjZzFnMmQybFBa?=
 =?utf-8?B?Y2IrTEJndkNYT3lHN1IyTzNZcHNBeXpQdndhT24zZ3Rnclc5QndRaExXS1lp?=
 =?utf-8?B?UTlCdW1NNG8wMEtBNWthb1Q1R1NTbEtEWG0wQjJzZUlBQWUzSUNXLzBVY1VD?=
 =?utf-8?B?U05ERDB0VXdJNXN1NDlUN2FqOXNORnV0aXpmQkFxVEVHNEdNSWs2VEhLZzZT?=
 =?utf-8?B?N0xqc3hnTWd4WWd4SlU4VWZSQjR6QmpGd2NkRkxmeDFjdVpKNkdQUT09?=
X-Exchange-RoutingPolicyChecked: DBySKjX+uyKM/8u25BSOSgbpqTTlNZuJXbqeQGIliAOtdDApvj0J5d12slPsuz6gmwWHW+zDIByam1IAI09yIjHJ7jffcKTRi3N/p0EVackC/ROTUtf/DRN77CkX3SzDxF1hd74IBDn/FqymKaJsJcOCm+XwGFx0Bz9VkXButSM7BKZHuIdpB9J1Zvnz8K+yCmY7sj5n87ofTV3FrDcVR6fZ6L/BofdXkIIqsqplPZyk1NVHSDXyhs6JjN4LZA6Tf0kmPPjFtU0/C6JR4jq1fsiHXDyv5WdpSII44jnGMyL/UXcRgQx8QYiiIZdiQP+CIbYH28ioyO9rflOc3B2fyA==
X-MS-Exchange-CrossTenant-Network-Message-Id: ed17fd35-769f-4ff8-5ee0-08ded8700321
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6967.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 19:27:53.5245
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rjz05iuij5aVUmzt/bwIRPVAE/ze6cdIIDRwRlvgWiPk+m4tMcgvKKbVfEMGp65lxGhprvXwYKklbty1xiKDMEqr53kWh3SslcuOSZTz8sE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7173
X-OriginatorOrg: intel.com

Hi Kuninori,

On 7/2/2026 3:20 AM, Kuninori Morimoto wrote:
> Current component has component->name, to setup it, user need to use
> snd_soc_component_initialize() / snd_soc_add_component() directly
> instead of using snd_soc_register_component().

While I'd prefer the trio (init/add/register) to be left as is, with the 
register function getting updated with "name" parameter, all 
snd_soc_component_initialize/add() users could be moved to 
snd_soc_register_component().

However, this does not mean we solved everything - reducing the number 
of methods for registration is one subject, privatizing component is an 
entirely different one.

> Conversely, there is no reason to use them for anything other than that
> purpose. Current code style interferes with Componet capsuling.
> 
> Originally, this patch-set was posted as "ASoC: intel: use component_name
> for Component name". But during discussion, I changed mind to use other way.
> 
> Therefore, I merged the patch-set and patches which I have planed to submit
> later. So, I didn't add "v2" on Subject.
> 
> The header has become a bit more complex, but there is no functional change.
I've came to conclusion that perhaps seeing the offending driver will 
help me better understand the need for all of this.  Could you point me 
to driver (or drivers) which triggered the entire notion of privatizing 
struct snd_soc_component ?


Kind regards,
Czarek
