Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5D7C3F44F6
	for <linux-sound@vger.kernel.org>; Mon,  6 Jul 2026 08:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783328180; cv=fail; b=RotOAHLxQAdMRfcEU0dy4VEtn1L6lIp66PwKdLbmwj74SmNCwyPNlSwT3ysI0O6Mj1gJFNHLNou+tyl5fRartlBuYYW5JX5eABIJWbblRcrd47Gx/TkuoUh0iqjQ3+UO/LF/u93CUj/fKkSezGEMN6w24tjYm7nqzmuRosdyzr4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783328180; c=relaxed/simple;
	bh=GOPyxqneApRzHYYNfjAV5Os822OTLEepV16ypHP8PW8=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=fgp901gV5WpRPSJplLQtKc8fYkIROibPI4ptUPRnjWjn7rM9R1nFsrmDYVPOm7bU26FoH7/ZXleaoMVEiWrTSgtX6raTiCtwLr5QBQTBzDAbGK7xmgL4khCFpVuse666LAuiapf0nwpoAqPrbAEARFWXv5lS059+2LCvVy1xe/k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JPG5byd+; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JPG5byd+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783328174; x=1814864174;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=GOPyxqneApRzHYYNfjAV5Os822OTLEepV16ypHP8PW8=;
  b=JPG5byd+ZOfIGARFswo+1/NgWQPabdXpRw5/etomcXZAg++zsfHBhIip
   +NyN4OtbyRhcLSJavMmigMMDVhh9sRAxlxQTbdbf9L16wqeW5lcUttzAD
   6sueYCdBsT8uxNzuSBt/qhnGycdyb0GyG7vPRLdJbhTfYTWQz/YKIH/aW
   FCKgiT4K5xe0adrQ+mRyN21VNi0c8rZmOpZuThY0jUVBo2IuTBCHPkqtp
   kGcIBYLFVuoj6yUeGqVkAZnPZcjSwtJZBumzEeIHor91JR46BckrYAFab
   bkQVItIyMVCYX85J9sX3wDdA0JwuNeXOlrNZfWQ7dCend6B1DXGJA39Hd
   w==;
X-CSE-ConnectionGUID: RFwFSatDSq2ms+hphKRk+A==
X-CSE-MsgGUID: O9AaXw13RH6SO3BoumcrNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11838"; a="94602615"
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="94602615"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2026 01:56:08 -0700
X-CSE-ConnectionGUID: nxuIwg2YRxS1WsJraCLFJw==
X-CSE-MsgGUID: mA1+L0fuTVafxIETvCLbgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="257531937"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2026 01:56:08 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 6 Jul 2026 01:56:07 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 6 Jul 2026 01:56:07 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.3) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 6 Jul 2026 01:56:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yreHbfO7lM+KyubctuvogMJNu12ssuZuxdbIAc/O2Bs/oth+G+82QEjLqK5yB1XIq6q7QPUUAiNt7UEj2qCH5LG7sMdCKLsarRvfteBAU7PZcpTBGXxEgnGLslQGNpIVrpScIQv9//Ms7b1ZDwh8lNOQNplA1qd4fcffkJbZHOh46/Ewr1EB4H1PqewfzwUKlLKWQ1TbtyBom7O6KQzgfW/1iroVItUxe1/BLGazx5Vna3u5jYzeHCYOmOOYhW5Q7vM6djG0Psrh4AzA5vxc+7ntW9u96xx5c4zFqJ7vD7Cb8DQUrNjduOBtlnj91j9YlO1xte4sjGxFsFxkfiC2gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mOruKewdlPfd34ymmOwIMAcU9TsELAwxCDutiGdCR0g=;
 b=yBP3frPjSgF4Kw3FSzpEFDQzWpUHyouIw/aBlAEn5YRcBtJg+oHwkSJx/wgHb/VmTUy+DXPibsDDIbMjCe5dIKD4u+WaFFi0eRG2gSpJq6Cz/nhs6R2Or5xkpAMY5h/m7pBe4wXdlgQTZ6npm4D6KEy5WWQhTU9lD53r049Y9EWx7SYYHS6xNX6Ui2Wski7M+ZajWcUuF1in8Njl68Jn2s001Y9KOsYzCFlhQCWhHJD92j1fr2IJWLIfjbnlekSXU48wNFTbfvqDqmQkrwJK70k2pEMuxBjTB0nYCGf7LkVQI9SZoV9f3JJyXi0x1bJ5sgmQo7NAJUwYzBiP3gHVhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6967.namprd11.prod.outlook.com (2603:10b6:806:2bb::15)
 by SJ0PR11MB4799.namprd11.prod.outlook.com (2603:10b6:a03:2ae::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.13; Mon, 6 Jul
 2026 08:56:05 +0000
Received: from SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4]) by SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4%3]) with mapi id 15.21.0181.008; Mon, 6 Jul 2026
 08:56:05 +0000
Message-ID: <837855bb-307e-4bdd-9148-927442029c3c@intel.com>
Date: Mon, 6 Jul 2026 10:55:58 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/12] ASoC: intel: avs: use
 snd_soc_register_component()
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
CC: <linux-sound@vger.kernel.org>, Bard Liao
	<yung-chuan.liao@linux.intel.com>, bui duc phuc <phucduc.bui@gmail.com>,
	Fabio Estevam <festevam@gmail.com>, Jaroslav Kysela <perex@perex.cz>, "Kai
 Vehmanen" <kai.vehmanen@linux.intel.com>, Lars-Peter Clausen
	<lars@metafoo.de>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
	<broonie@kernel.org>, Nicolin Chen <nicoleotsuka@gmail.com>, Peter Ujfalusi
	<peter.ujfalusi@linux.intel.com>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.dev>, Shengjiu Wang <shengjiu.wang@gmail.com>,
	Takashi Iwai <tiwai@suse.com>, Xiubo Li <Xiubo.Lee@gmail.com>
References: <87zf04c1w5.wl-kuninori.morimoto.gx@renesas.com>
 <87qzlgc1tu.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <87qzlgc1tu.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR02CA0053.eurprd02.prod.outlook.com
 (2603:10a6:802:14::24) To SA1PR11MB6967.namprd11.prod.outlook.com
 (2603:10b6:806:2bb::15)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6967:EE_|SJ0PR11MB4799:EE_
X-MS-Office365-Filtering-Correlation-Id: 36bd1d28-d39b-4264-0e97-08dedb3c696b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|23010399003|366016|18002099003|22082099003|4143699003|56012099006|11063799006|5023799004;
X-Microsoft-Antispam-Message-Info: N8HCU2R8idNZxIY8UCfuzU1MQb5KRTakr5+4a1f7JU0UrSBdWbzBD8Cu6MR+SQ/XmhtxHYSrqncZDUt9fsMsDRw3lifSFu6Uf6ElWvEwZY5ZjsfJO6FhPVFyKU63r8yW9/N4BW6hqryQUw5IJ6zfU7mvJiESuh8f9s7SDctxLW6hMHh42IUINk7Gg9Mpflfwpr/Wiucw4L1UpX+cdLgSlLhl8a/L6S3HbuAH68HKQbVSHiVE5G3EZCci1NUhO1CXJlqanEtJsEv2eS1eDc0nFN4QwZGZIxFG8hhqU8yk/EV01kG9PfD8vZq6pg47eBF/xw72ln12F3RYVC9LPrJ6700+3LhFtPR20+cL0DAy/V2BErUtu6MG+hFuaA9Xfi+2CU8lKNDL+4ie/8xgaWPzwdFMIfQrSMvi5+k6bUGI4kRV3pNWNK2be+ez1VEFuCXJTC6CwnmGe1JRm4HmbPjUq3fo29Eclcm4B/rBt/18FphLpxzw3c/kTAz5tVfvYGLUcVQO4jtHHzMQ+NBgazZ/j51fotG+AISiwjdpzMv7uqcOCC3dsb1Oq4qvGNeWv+HVajrN28Du0TS4Lp4IcNYCGRgFug13k+yS8FySkOHhIoSuqF5shHS35EdZar3ou7FFz8vca4vIPbQQ5/AgsuGr6zdycIAb/7vyVcSOPzOj/4w=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB6967.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(23010399003)(366016)(18002099003)(22082099003)(4143699003)(56012099006)(11063799006)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S2xFNFRnMjVCbFlCdHFtWW5RUnVQZHVBTXRIb29Fc0VRcW5vNUFiMDgxOUxk?=
 =?utf-8?B?QndxT09xaVBZeDI2dldNanBxR3BabkFOSlNUNHZmbTNjTGs4eEw1UFlObERT?=
 =?utf-8?B?am16Nm94ZGppdnkwZGtKeC9lR2w0cmp3RVVpcVQweC9lMHN4NkhrVXU2VE5h?=
 =?utf-8?B?SzZONzVkK0FVeExsWWxkUW1lanp6NzNMeG9hZ0U2VjNDUlFLK1pWc0Z5dUtE?=
 =?utf-8?B?QjRSdCtBUVM1dVd5bkNORStGbXFJVnF4N1RLWWh4WEd1M0t0SmNDb3A0a2VL?=
 =?utf-8?B?VndXK0dNcEFIMTRCZVdEbWdlZnpBdS96YjR6Umx2T2lySWR4NklaT2NtUGFT?=
 =?utf-8?B?VDlSMHh0eEE4VE55TnB6aWxzU1lZKzdVQmJQM3NIbi9XN1lxUEM5eDB4UVJY?=
 =?utf-8?B?ZmZtS2dYbU11WWkyK0Eramw5bTAzTHdOQ2tHelFSOFoybFlrS3NLenQrcWhs?=
 =?utf-8?B?QUR1VGMzUVYyQU5LUXVpNFBIUFVQb2lBSjRBdFFoRXMyNk45NGZjK05LZkl6?=
 =?utf-8?B?ZVk1OWZXTlJzZXpnZ2FrWFNXQndOeFhSdWJvZnZRZkt6UC8xV3V1NXIvVVpj?=
 =?utf-8?B?blJXWmo0VWxncVp1dFZOQ0hPVHQ4cEF6bVcyckJRZEh4SWdSbTFkeENVdFBG?=
 =?utf-8?B?TEJwazg5a1U5UmVCeGs1bGpsZUVsYnBJWXZDNkRnYzdhSFRsRW9YWUJGaHpo?=
 =?utf-8?B?SmVPbHBNVEN4azF4dXNQWUpjS3RlWXRCVnlRRysvcWRoc3VTWmphanQvNXNh?=
 =?utf-8?B?Z09ISmN2WjJQKy9EMzJMSy83YnlxT01oSlg2dDVSMWVPN3A4bFdFQ1JWdHFD?=
 =?utf-8?B?YUQwdEtKbjZkdWFCcEE2MDVvV0JWT001RTVsbXdlRm1rajZ0c0VrdW02RzVv?=
 =?utf-8?B?cE84MHVpamRQN05ocW43UEZiOVlwTkFWTFJyRzczdmhZbGtPMUtXd1AvSEl6?=
 =?utf-8?B?S3k2L0ZiNjNrQnRVY2N4OW9Qa1Bxc3ZTdWdzcTl3TE1lMjFvd3BQaWZzeVF2?=
 =?utf-8?B?STg4akU1SDVRTDN2RkpjRU9qV0plVUwwRE1yVEtwWXRYNGhYTWhCQW9ER1N6?=
 =?utf-8?B?T0ZYbDIySG9yV3BCaFVTcXllMTVnbWxhR1VLNEgrcXNPb1lOYks0OHFtSUVX?=
 =?utf-8?B?bUlUeUdERHJZMWFFdFpsVXFEeXRHbG5HL283UTc2V2lETUd3RWlGL0MxMFBJ?=
 =?utf-8?B?aWZCaVNLc0Yzb2NyTmU0QWpYZEF4djAweVY2WFdmYk9MdmhTRmdGeitjTjN5?=
 =?utf-8?B?a0liUjl5dDl3SkU2TmcyTUdxOEdDdmM3bGZmWThYbDMzbnE1RHNQeTU3MDhv?=
 =?utf-8?B?blA0cEN0MzFKbHZ1ZTFrblFQOVAyRll2cm0yUHhZdG9IVm9aN0w0UnhwdjR2?=
 =?utf-8?B?STE3V3ozclBBNGMrVGNzd0tUZDBJMUh0YjhNTnpIWXAyNlhIM1BYeURSUks5?=
 =?utf-8?B?RE0wMThmUWZ4SWRoajBHRlFjME9jOHJhcWhXaCtVRVBlS1dhMmVWRnhiRU13?=
 =?utf-8?B?bzIyam9xMXEwR3pIOVlFS3ltZllBVlBMTUIrOFoxbkpqc0RJQVNjTDRWRWVJ?=
 =?utf-8?B?ZHhjNmNZR0NtOFdERDZabzI0RWMrZjF3bnoySXBYZVdiTjhacysxVFM1VHcw?=
 =?utf-8?B?OGh4Z3dDZ29qM0lkYzBrWVlIUUM0UmVQbjBoRDNBQkVFL01HWTJSeDcxNE1G?=
 =?utf-8?B?ZnZlL3dSY21CWk1DY2ZTbFpCa1RaY2Q2Q3F4cXAvbzh0ZHFLN3hubk5rcWRZ?=
 =?utf-8?B?VFFwbGRFY2dxL04wczBKbmlZQjYydjRPS05ISVBPRWdUSVBsZU9zU214c1J5?=
 =?utf-8?B?aU1RUHdHckpMNnJtSWFBVUZLanVNV2JkczJzdGRXa20rYk1mTFRpWDlnaWVF?=
 =?utf-8?B?ZmUrU2pMeG1jVytHeDN3K0Jua3h5THlYWFhTMmw2UFlUSHpZUmU3ejhwYnVn?=
 =?utf-8?B?MFFNaW90enlDZHVEclZuTU53ZVBhTVJSWWJuRGVpZTFZaWlsZjR5aE9RT05F?=
 =?utf-8?B?U0hoazU2TzJ3NlpWcHoxY2ZsY0NJRm1sS2pGRUJFUm4vS0VyVTc1aDQ0NVdX?=
 =?utf-8?B?SmtTMGR3elRSUTd1QVBtTXBuKzYvYmZIcHZnUHh5eU5pK3ZjZ2pZMk9SZmMx?=
 =?utf-8?B?dW93LzJtdHB0eHBHY0xzZW41QkZ0VDJvYlBqbWhGZU1hWTM4Tys0WHExVkZJ?=
 =?utf-8?B?QVdWQzRSWFNVUzhQRGpvb3ZpRWdvK0RydGp6M0lGN2FHUTRhZjVQN0lMU3Zh?=
 =?utf-8?B?ZEJWblF4aDQxM01hcFlSZVg3S1YyZ1ZydklBKzc4em1tbXA0ZnRvVEkyRElp?=
 =?utf-8?B?Q2x6SUh1SmtvSTVZK2FuSG91UmhzTGZ3a2UwVXg1V0xMd0FqZk1EbmdDU29y?=
 =?utf-8?Q?RdxaVCsufqe7AbSw=3D?=
X-Exchange-RoutingPolicyChecked: qU9ZSSKc+eVjXHLCYluDw2WY0gbO7phqUeTJkhFn2CNUlDubaLKKvRoVkoMnLiE/5pz7vXs93QEbYdXc+yhRaHJuTQ+5FoyYmsnQzA5/9PAf7w0XygPv495vfOw/o3NhiKg22nJBKwm3yUwdV2ZX6IIUoVsyEjOG1nZOngFipOK1nbeqIM6ugwGIexuqsSadFofKoz3Gq2D0U9S2vn2TGw/h6EgqW9Q0YHG0iw36kb7PmvWg9lEHSNejzRfbPI16nEobY+T3va5D7ee6nHX+qoTlKqhi4DmJxsf6IqZ1JzqAXPh1TuVcFrzXqrxNgWJx4W3AbBlJezd+2pkV1x5dcg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 36bd1d28-d39b-4264-0e97-08dedb3c696b
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6967.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 08:56:04.9085
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zk9UuSbh73NYcFyAKludhowC3UCLBkk++BD5QFTqmcBJL42KBfA5qn+6eNzC2sa47iXpWmij2PthyVt4WMtZhRXmm4h4/HCVibwGOCJUZ70=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4799
X-OriginatorOrg: intel.com

On 7/6/2026 4:02 AM, Kuninori Morimoto wrote:
> It is calling snd_soc_component_initialize() / snd_soc_add_component().
> We can now use snd_soc_register_component() instead.
> 
> It is using container_of() to get avs_soc_component from component, but
> will not be able to use it when capsuling has done.
> We can now use snd_soc_component_to_priv() instead.

...

> @@ -1387,25 +1387,33 @@ int avs_register_component(struct device *dev, const char *name,
>   			   struct snd_soc_dai_driver *cpu_dais, int num_cpu_dais)
>   {

...

> -	ret = snd_soc_component_initialize(&acomp->base, drv, dev);
> +	snd_soc_component_set_name(acomp->base, comp_name);
> +	snd_soc_component_set_priv(acomp->base, acomp);
> +
> +	ret = snd_soc_register_component(acomp->base, drv, cpu_dais, num_cpu_dais);
>   	if (ret < 0)
>   		return ret;
>   
> -	return snd_soc_add_component(&acomp->base, cpu_dais, num_cpu_dais);
> +	return 0;

Nitpick: you could just:
	return snd_soc_register_component(...);

Note: alone that's not a reason for a resend and v4.  I can do that 
later when doing my quarterly driver reviews/scans.

>   }
>   
>   static struct snd_soc_dai_driver dmic_cpu_dais[] = {

