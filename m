Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF4D44D015
	for <linux-sound@vger.kernel.org>; Thu, 23 Jul 2026 11:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784804512; cv=fail; b=EsLKLWX//ANbAsHWLE5nx6b9n3U/8tnlY2lAPLXthiz5pZGXytIyUlap21xTEuAvpkx1Km4NKB9cJW3hqpzsHBOahnfjJxVbHpWToq3LHhg3j4qEE8qmJsvSoYpSFA88vdEru1RUBUvKBTmOTUItDeyOCdrfNrJEcNyEk98dGYM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784804512; c=relaxed/simple;
	bh=/5EjCZWc6CRN6pMW11c98LzN6m0riFAQrRJWHMZecu0=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=VZyUi7AGBMsy0BVgg954apnDmuV0Acnx1hd7wo6IT/zgsgl8m6fuUl3ei+Eelpi4ZByoyw4iC6Uq753odptTKa0/76MMfzDwDq3gZ5XhhPpgYy0nIuiQm8+FnjH3Pyv2h4EJvTFNNTCCalVrTRpR162CaHpGNxRkP0VqIOuBAdM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AwXIiyiX; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AwXIiyiX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784804508; x=1816340508;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=/5EjCZWc6CRN6pMW11c98LzN6m0riFAQrRJWHMZecu0=;
  b=AwXIiyiX3n2IuWGcxfnfu8LxkQd5dhBr3QP3FIJr4zG3plq/ORkzWC62
   Z3x5u5fw8sjdRT85CGWmWaSVgrWwr3AslyDUQMPUTBY3Q/C4EPU5MH0t6
   /eauFI+N8UHmwCDQCiUn7WicQSywmZculsMvVSob9CHDovtdmVpR09m1r
   Bm0zKtncK9QN+Bfrutv5AIjIghXMF2yP8X3xqhrgKiTn3//ZvXXEk7Qxt
   1aAQ5pFNg+/O4lLsNq7QysaHfW6HiwQAbxDxB7FaIc90m6rafpdsZK1xf
   nu5kBMVcYBVPfVFrBE4LFzPd3w7DVv2veTcq2xHWK9RJif8YWurLxtvmO
   w==;
X-CSE-ConnectionGUID: HWQ7f6Y7TF2MBtsqfhnrtw==
X-CSE-MsgGUID: vdttQUZYR7uU6Qh9VB9NQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="85329713"
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; 
   d="scan'208";a="85329713"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2026 04:01:43 -0700
X-CSE-ConnectionGUID: WyahCKHFTPqtTY/obx/SMQ==
X-CSE-MsgGUID: PdMv1svOSTql0PKvypVgNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; 
   d="scan'208";a="288371837"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2026 04:01:44 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 23 Jul 2026 04:01:43 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 23 Jul 2026 04:01:43 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.68) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 23 Jul 2026 04:01:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A2F4gmOVr0671g0vBPQGpXlLLFRliHTg62EadlzcHJ70oha7TYuOwV9tRUeTkdbwUjver2r3+4Z2/O0/kdedBI/dEOsjTxrS0PqGwpqYrZktYKMUpYwm3xz/uc6yzkCByEUX00HAUjy6h5cXR1wLJNYmoxFK0HNR74mdLtKIGBNxWiAcVrzcQDqj+tn2XcDz40WUUQCz1XI/DPcJh84sVjRABRlzr2xwDIeYWHNOzuGBkqmJT+rWTJxaniSZ0iDRV7Oxzrh8aiPYZYsQ98aQ8o0ju4nldCIHAoq4p+m8QYsPRghdWrVgqqgtvylM+PHB3qrCAg18azq/l9yB6Jbfpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NsdH9R743cNzJIEjk6YrxMEq4biRQLUXSfK3pQY308s=;
 b=udISFl3KtiSjBB9sFgTwFNKY1UGFQ0tlr7jKRoKgbTURbdKvO1rRMczSJMd4NgC7yZzIpCYJk5Sv1ZwfM8gnzAD+h6Sf/CluzZ5OFhjTZ3nBuknyVThJuIjWH7FgofVOzvODX4Zjg1JUctIrbqgbpOu+QkP2MNQqFY7+ZJRbqiK097ZGQGS8v9V81PSrQnPYZnzB87WbUDTmgfH2wtDPvGo/NpmgvwN30knNXmUZVdCdACmrshJbWTV7FMs9w77H/gyYZrKLfWFqNZyh9Y0/hiQ5QvpART3E5Lz9tKaoutU0XabF6KGkGlnfyGWlkBOKR0fLibTmFHaUOrchij8uwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6967.namprd11.prod.outlook.com (2603:10b6:806:2bb::15)
 by CYXPR11MB8664.namprd11.prod.outlook.com (2603:10b6:930:e6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Thu, 23 Jul
 2026 11:01:40 +0000
Received: from SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4]) by SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4%3]) with mapi id 15.21.0245.009; Thu, 23 Jul 2026
 11:01:40 +0000
Message-ID: <58f7f20f-6a70-47a7-8aed-05c5676baf25@intel.com>
Date: Thu, 23 Jul 2026 13:01:34 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/12] ASoC: intel: avs: probes: use
 snd_soc_register_component()
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
CC: <linux-sound@vger.kernel.org>, Bard Liao
	<yung-chuan.liao@linux.intel.com>, Fabio Estevam <festevam@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Kai Vehmanen
	<kai.vehmanen@linux.intel.com>, Lars-Peter Clausen <lars@metafoo.de>, "Liam
 Girdwood" <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Nicolin
 Chen <nicoleotsuka@gmail.com>, Peter Ujfalusi
	<peter.ujfalusi@linux.intel.com>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.dev>, Shengjiu Wang <shengjiu.wang@gmail.com>,
	Takashi Iwai <tiwai@suse.com>, Xiubo Li <Xiubo.Lee@gmail.com>
References: <87y0f2rz8l.wl-kuninori.morimoto.gx@renesas.com>
 <87o6fyrz7h.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <87o6fyrz7h.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P189CA0015.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d7::19) To SA1PR11MB6967.namprd11.prod.outlook.com
 (2603:10b6:806:2bb::15)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6967:EE_|CYXPR11MB8664:EE_
X-MS-Office365-Filtering-Correlation-Id: 34ca2464-1528-4df9-2018-08dee8a9c5ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|23010399003|56012099006|10067099003|4143699003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: f+9eJi4Qb4PA5aYaPeLxFxXKy7lNxpKyYaMLX+LbWcwauhU5K16lrfPrsyr98CQR2sNRsRDSSypq63lSXBrOWThGaVG8rQcoUQ/KibYzkk07RmXxVIvgCLpJAYf7iSmz/D50/Jy/gxqlOIf09VEkrqM5F7q+GDqLJeQ1WpizagNYZNc7eN/5uKzkPzW6AP9icx1lx7xIBLRJDwQKX3uTmMS271AYJ6jdfrLrRrQdYb88jLgnVgRMBMxUusnaUcp8ByVAo4ivCEM+tbq5feJC0QN6hN9FX8vjP8nIKpbNVWYX0LDkEXNv8VlJXMrYuw64QtiYrTRgAqdmPOG3uJtQB82DoSqqK5bkJa9LWnYqScj6g++Wm474LWQS/IU4mvYLpxKNtLtYngmii7WCbR1VrTbobi/4ZotNBUmV0FKQkbSGKKJoDp0AFgGAUSPOcMz7MJnnK52tcySIWpIWdhvE0iDzKpDfzRDWfePQEBgz5p0kqy+mYy4mI06TwDWchSE2D6kSlMTjsDTfxNfU7nvE/L8wvN2wu0tdIewG2G9B7I9/ZUPuWw3lGI/8BGyQSg3EbJCln72g+3ukMae/5EEWmR8S5lRxlAB4d404MKDvHP4aNy50/SilnGckOVYakLrNDapflfFGiDyjHboZJkMeiA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB6967.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(23010399003)(56012099006)(10067099003)(4143699003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TGYzYmc3QTE5QWptYmhYSjJVVVY4a29jTUI5S0RiYlRKR0dENVNFc3YycU92?=
 =?utf-8?B?K08rZUF5ZmRpYWhwOTRDT0VNc1cxWDVCa1JYSDRBNjFOdEt0eUJqMVpoS2ZZ?=
 =?utf-8?B?dXQrV2NlZjdxYzY0ejZjWWsxcjJQZGI2b1h1L0lueDJucVhvbWo0MnI1YTBi?=
 =?utf-8?B?UERQS1FndXZOaks0amxHa201WVpRNWZrOVZuSG9EZ2E5OGFFS01RZnhYNEVk?=
 =?utf-8?B?NDRyYXlKMkxJMnVIbEl3UVZHdkVIY3JSWDhSTC9vdHBWUVRDUVhJQ1lDSllz?=
 =?utf-8?B?dkdZL0F5YmtBWjVjUHFGckgrUTUzNmlNRDJ3S0tjdk53NVpVNm9qR2Z1ZnVM?=
 =?utf-8?B?dzl0NXkybGtYWWJsNkN6VFFDQmhUQUh4UTZNQjJaQ2NoK1FuK1ZjTCtsc2Z1?=
 =?utf-8?B?L25TVHFrektWeHN0a1Q3UEl1c1E5VzU3SjdIbFZSOFJxSzEzRlJ2WXJrUDZs?=
 =?utf-8?B?M2JNWmFZQ2pDRjJISVJSQWo1azZzZUkycnRRVHF5STIyZEtLRi90TGZERFZi?=
 =?utf-8?B?RDZQcndKekU1TEhOQlJQa1hxUFVRb3JzcDJNTXFXcGdHVHhEd2NYeiszektp?=
 =?utf-8?B?cWNlQmZERVFyUm05d3ZRNGQyQmZSNHVDNmhBU3VDaWVWWU5lNVN2RkJIQ09R?=
 =?utf-8?B?Y1BsTzZoMytkU0lMNzZlQzczNnQvUXBuK2pHdmd1YkFlaDNEcVdNbytyOHhQ?=
 =?utf-8?B?U3dEaWxYUTNHZS9lRmdpNXQ0UFVwNDZCWUNQd1k4RzRSZkFIY0E4OC9KNG9G?=
 =?utf-8?B?Wm9IQ0E1eGVhK2M4Y2k5VzVlSlc0YTNHcUh5S2oyaHNUOWdCYURmbkJjUEtR?=
 =?utf-8?B?ZHc1aHQ3S1VSQ29jVTFJZ0RYbml0RGkxYXdwRk55MEo5TDAwc0VzUHViRzBF?=
 =?utf-8?B?amFld0NoSHlzVXV3cGl3b2JQaTNMUkUxVVBEU0hxZU9uYjA3T3lWRVFOZ05M?=
 =?utf-8?B?d0p0ZC9wcWFXZ0h0ZXhwVDNLN1Y3NWt0Qy85ZWxTS2djRUFtWE0rdnlSTWtD?=
 =?utf-8?B?NHR1QnNFRlNwQXRKR0lRcFdPUEZ6c2ZiQnRadFRKV2pyVS9ldlpPNi8zQXJz?=
 =?utf-8?B?ZG55U0VQalgzellDeHRwdFk5VjcrTFJFMUxjSDJuM3FoOWJPeEl0NXdSK1FK?=
 =?utf-8?B?UnptZVBOVm1qMjQ2Rno3c3lFSlc2Q0YyYjdwNG83NXU4QVcxT05OTmpoUExm?=
 =?utf-8?B?QnA1dFFiL0pkSDNXRHpIb3dVcmZkU3N5OVZNamxrb2dKclNaU2NGbWVwcjZw?=
 =?utf-8?B?WG5DSVEvd0l0NThEcEthZHNvL21kL0RqcFMvV1hFTG1hbS81S1hsU3Jwek9a?=
 =?utf-8?B?UjZiSlZ2QmI1RVRDWFpTaUpFZVlucks3RXFxUG5IcTdvZWpzVm5CYUtKenhF?=
 =?utf-8?B?OG80NGN1YU5sMG9OQTBlV2l3NkUxTjJCelA0ZkJnNUxZcHdSMS8yQ09GcUQr?=
 =?utf-8?B?RGM5RENjNE1xbUxUdlZXMWpjZjRsb0dvVUNEZVVZQjQzd1VjR2YvTVBNdWVQ?=
 =?utf-8?B?TUxnUmpkUHpZL05WNjNUU1NESWJhV0hOOFl6WGxHZHNUeENhR2V3eldBWFcr?=
 =?utf-8?B?Q2ZmUVpUSndJODJYaVlmdjRCT2ZlMDkwd3NCTDFKQzB5RGJrZEVRcE9JNVN4?=
 =?utf-8?B?OStsN2ptVEc0QmtOblZ2dlRmRmNsdVhlbXVIVC9CY0Rzc0EvM0JvSUxkZDh6?=
 =?utf-8?B?ZlFWVWhocW9QVzBnQXJ0Um1QYkh0RlJucHdxRVhTdFBSYjdHMzdEdWRYK1dK?=
 =?utf-8?B?dkhaQTE5RFlGY1pSM3dqT05pTEljUDVEVGZObGp2TTRRZVRaQlB1ZVQvelZZ?=
 =?utf-8?B?MWlldU1oNThtUHREUktZakRUdzJjM25Ud3gzZ2wzOXkvQ21kWjFSMEYvendC?=
 =?utf-8?B?NCtlT3o5N3FUd0pxRDlrS1hqU2lpbUtaMm1iaTV5Sk8vMjhNeDUvc1hxbnI4?=
 =?utf-8?B?Ti9RMmVmN092STZSaXZiN25FVU5zWUtvYktLOUt1V1hWSUVXdWQrd1NuVlZI?=
 =?utf-8?B?N2x2Q3RLWXgzWmVKVllCZkRKQ2hDSkUyS1NINWlTK2VBczZEZUdnQ3hDMC9x?=
 =?utf-8?B?bTArM29CZU44di83bFdjUU4yL2VwdUpydFVvSGpTSlhaOWplaUJmNFUyeCt6?=
 =?utf-8?B?UnBaQUdodDBJamc0eXhBWC9YVzFDa1hlNUt6MCtGR2ZLWkVSNDF3ZG43R2ZP?=
 =?utf-8?B?dUhiTmxYOWlsU0tMNWtvdnFvWVljeFIzaWVHSkJTZUt2c2hhTXh2aUsvbTBh?=
 =?utf-8?B?aEFkdkZHdnFsUnpiMnZ1WnJyV1BDb0FyV0UzdGg5aVp6bmp0NjhyQ0NDeHBO?=
 =?utf-8?B?TjJVb1lvVm9OWmJiZTVkWFVGS1c0S0ZZYmlsVHRvb2dJV3VhMmQzUDkvdnRI?=
 =?utf-8?Q?xxPdrJ8bFzLl9LZM=3D?=
X-Exchange-RoutingPolicyChecked: WU3++4sOyCCDhaqaqUoJeEhiHHjfZ2ojG5n2OJEp8DjQkQDW5ys63pZ5BcCjTKVpRIkUSEea0UKIgn2+UZUOWH/ZUIGLe8QwTAk7O8HM4yJo41Z4Ml5j8op46X4kka3UR6+nhflAWGEvhWfS06s6qxBwcucu+YPVlK3J2EtapB7Xz48Ab1ApROSyXsT1BAlylLioedOpkl8zOpOcvoA+nQRX0IbSJjBuPR6t9qpBo6jDE6f94zjzID+IGrUec/rgpKyGrsJ6EqKvgU+Q7EMiI0mWVNb4ecLaYseZ/mUDyxTvrVYBCsMRXt9rxCW9Z5OTHmUV4nGw6G3o+V3t9JuP2g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 34ca2464-1528-4df9-2018-08dee8a9c5ef
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6967.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 11:01:40.3370
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 493QLydOACqgf3lXJByEtBE4rQSrF1PWqLPZLrzwcfR1cY0cYwsZRcytaZ7D+7hAqsl/WArjskwVnjI9LxSiZY9TTVKqznVEIfKwAi9sivY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8664
X-OriginatorOrg: intel.com

On 7/23/2026 8:34 AM, Kuninori Morimoto wrote:
> It is calling snd_soc_component_initialize() / snd_soc_add_component().
> We can now use snd_soc_register_component() instead.
Noticed it only just now, why is "probes" change split away from 6/12? 
That's just a nitpick, not a blocker.
