Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 018064C81;
	Mon, 27 Jul 2026 11:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785150418; cv=fail; b=HzD2YaShxZqrouvhhnQ7xxB2ieTfInK2Y5nh5jaeu62R81VIo5RSqU/AcHv9CFT7Rg4hGrHaZdtf9TkWAFz2vxg+W3Px8Qc8+mutQPL8g2l0tG8ah1V2lWn3nti996kLCt2Z8+RAIH6XKpk3ISzUca/OpozCt6XO6/Fxxabyius=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785150418; c=relaxed/simple;
	bh=LGZUQ8ZfE7NzQ7EM4c0UxRwi5cYk9Uup2OD6tag4ht4=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=FuBU8MGAe7fXu8TCJGnPSv+Wc9NaGk+sb12uIz5ZsDybgwRNlktmxbxqULXFFDMZM76HT7BpN7Tfr8pUiX99x4tmBK+j9E9S5Dot+K4mF8ePsst9o8JEF8kabqwW+jrKeS5QzRjEpEtoGyQ/bXSJcJRxj+HOH1+6nSRPWH3MxZo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=laNlPuB7; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="laNlPuB7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785150416; x=1816686416;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=LGZUQ8ZfE7NzQ7EM4c0UxRwi5cYk9Uup2OD6tag4ht4=;
  b=laNlPuB7+i6j+QpVCWP7MM+24G2edKc0SoX7ZRDRVgpoOQlll7jYbm8q
   psf7BgQEOgEvTeK65NP7tCVtQU5iJ5kkhk9b68USwpQCbY9x6FXMURfSR
   vbhKDe1qsy6oH3uD7uRu0ht+T3OoSL2kJ/SKKhM5Zb6m3qsZMtQRNlWPj
   S2FsSjV9xaD/+n+oofhT9L9qdVnm+pX9cMMEe08MkhwqIDcFEyf0dmwu+
   MEtwbgH5llVHdf4j59hJ13ov1xmbL94cZ2305Mpnh3oq+V/OOvJSNTH+K
   ZdyiYj7EoYrj88p8Eg1H1jhsYFZIT9EigMb2wdmZbNSOCIUnFoCbn8cB6
   w==;
X-CSE-ConnectionGUID: lOasKwbZSF6o7SDfp3cDsg==
X-CSE-MsgGUID: 7n1I5Uu5SQGz5lM6vqG6/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11857"; a="96072985"
X-IronPort-AV: E=Sophos;i="6.25,188,1779174000"; 
   d="scan'208";a="96072985"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2026 04:06:55 -0700
X-CSE-ConnectionGUID: kJYaHUM0QjqSQcYKPB+lcQ==
X-CSE-MsgGUID: iRtXx/FUTsOMJVhije2AYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,188,1779174000"; 
   d="scan'208";a="255452931"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2026 04:06:53 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 27 Jul 2026 04:06:53 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 27 Jul 2026 04:06:53 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.23)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 27 Jul 2026 04:06:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HEn6B4bZpNwnEf2Jox5sbSy2f2CJLqYixWBfg1/EYVh0GDZe6l+3u5Xydyf4qdyjvkTAl7VQQtr15VXy1pH345AWsMxed9miPL6uDRWrMYNYqu271DRHeVLxSYUp571mWtlxtOqxN6q5revh1qWIA9rCw4NHzghfKRVDUGkivRR/Sc0t5P16lgVZW9005Gon33iHOEzgx4scYszXusy9wrTLZZlrym9gQrdBnqbXY/dkPXEpnJ2zM2r70xPadwgD7sQk6jVmnCpx/Np6xza0TgbIv93wNzYBOhW8O6JWvdrW7MZtSIrCz99Vsn8quCq18PHJKHLAku9rNtuMIHk4zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zhlqQxR2gjHcPzliEoule+vXG+RIWX8KSSfxgSp99dU=;
 b=B9Gg0gIeBNiWRbcOVhFbZBWodoO5Y9YLz821lYcBenRlcD/f3CBjvu7DK/fxMpFJJm9Y3AZNJts0EFOQIprXGX2T/q6hZInQhvwzrzhwqWzR6zfrK+ic8nf782tc+foVy8LS+vTWgqoBDDOCkEBsSErXCRDDMl5Y81FDciX9B3tBaItxvITYvhQhEU5/TExDEpXJqQbJB1Gyi9sEPdbCtuek79DvtkouCCN+L3sETx7CqkJllQqS8Dn9brYIxGELh2rde3ZQiF/xapEmbGlHONAG2t6T6ScQ+E0K9LrVm5FtZ9CbDA8BOT1Q/kSifOBrOJTfrdlgIofSncEmZKL9FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6967.namprd11.prod.outlook.com (2603:10b6:806:2bb::15)
 by CO1PR11MB4978.namprd11.prod.outlook.com (2603:10b6:303:91::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 11:06:50 +0000
Received: from SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4]) by SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4%3]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 11:06:50 +0000
Message-ID: <512ae60e-abbe-4d5d-8106-8b4020c7a2e1@intel.com>
Date: Mon, 27 Jul 2026 13:06:42 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/26] ASoC: codecs: tas2781: Use guard() for mutex
 locks
To: <phucduc.bui@gmail.com>
CC: Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, Steven Eckhoff
	<steven.eckhoff.opensource@gmail.com>, Srinivas Kandagatla
	<srini@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>, Linus Walleij
	<linusw@kernel.org>, <u.kleine-koenig@baylibre.com>, Thorsten Blum
	<thorsten.blum@linux.dev>, Kees Cook <kees@kernel.org>, Chen Ni
	<nichen@iscas.ac.cn>, Bartosz Golaszewski <brgl@kernel.org>, Shengjiu Wang
	<shengjiu.wang@nxp.com>, Sebastian Krzyszkowiak
	<sebastian.krzyszkowiak@puri.sm>, Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	<patches@opensource.cirrus.com>, <linux-kernel@vger.kernel.org>,
	<linux-sound@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>, Mark Brown
	<broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela
	<perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Lars-Peter Clausen
	<lars@metafoo.de>, <nuno.sa@analog.com>, Shenghao Ding
	<shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>
References: <20260727094046.23001-1-phucduc.bui@gmail.com>
 <20260727094046.23001-5-phucduc.bui@gmail.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20260727094046.23001-5-phucduc.bui@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0122.eurprd04.prod.outlook.com
 (2603:10a6:20b:127::7) To SA1PR11MB6967.namprd11.prod.outlook.com
 (2603:10b6:806:2bb::15)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6967:EE_|CO1PR11MB4978:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fb58b71-c09b-45b9-4780-08deebcf2856
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|1800799024|376014|23010399003|11063799006|56012099006|4143699003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: b2xCMFbLXSmzUQPCB4mgaJNuCbpYtYVPM/nj8uUqHVTiy/GARWfgTcEfTiXsi5cGT2O6F/PhASJ0kXAlOGvupBHKuvZXHC0ZzzDyIjRRFVkGgh+WaRwd3qs6ZjFh3OOKI48GJjTzDxZpBbFmDZt4xtyHgrbRSJ91+rnpldzV5Jct2r9npbV3HN7ZEMhQ8ZScTCSVRli67Sj9WaZbNMJMn74newKdT7baUVUb10REzMPgeL9v2vqEmy89SsSZP/xDxT3IyjAojsGtFOTM49BdpqHnpCAied7swab7me9OgQFxYkPvLJYKxFDccirNUWmBNxOSef7cjTLtSXZJpZ9mCSI6j2GxRrcgv4RrVbsbuHZqTj4elUFH4x1/ZgC5GL/3IwViiXcUuhIPSCMdDBZjv92N7ovbi+f/nUHjtVjQh3X/wIgct1obRIr8hjmA/4Z9jLZAJvLuovUXXAjgfZDPLJMwoQlLLIiJ4sigumh2gyIOm/QFTGvVQNhO9ewG7IFcDVcOSyFuLiySPW4vUFmaabMwTRIM1YE1BfB5Q0F83OMRrsaC1GP1GWBWdbKGSVRx5g5M/0EMvRmIYFRJFF1J0KnidQ44r812iJqlc/Xph75Ucrwll8pEUwrwlt0kF6PQ2SirEpM8GgmlT6knlChkug==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB6967.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(1800799024)(376014)(23010399003)(11063799006)(56012099006)(4143699003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R2x2VGxQRW9vYU9lN2U5cWdHWmFQUnIvU2hYZGNsVW9PZkRMTTl4NzVLN1RU?=
 =?utf-8?B?ajhRZnF0Ty9sb2hkNXJaczVPRk9ranRTYWNTZnN3UVQ2RXY4N3N1OXZBVlNO?=
 =?utf-8?B?YjMxM2VyaURLR1g1enNoWGtPY0liN3B0OUd2YkdvUlBubmFVRldXdGpEU1RM?=
 =?utf-8?B?ZjJrUEJHc3psdEZZY3VrU0NSV2VaVHpjMjlONzhRM0lHUlB5VHgvOHg0enpO?=
 =?utf-8?B?NDNWOFhjLy83NzRteUdmN1drSnFLOWhVM1VyTTVYWDVteFpiSG5zV0EveUpn?=
 =?utf-8?B?RFVBcGZqajRxdEM5MlAwaTlzWC9xMkFYZGdzZ1JmUWwxM1FIZE82QmZRRHFV?=
 =?utf-8?B?MzRmUWRnSHJmM3Q5TUJMeW9yY0d5Y1Jldzh2M2xXRWhmaFB3K1dqSUpMbDkv?=
 =?utf-8?B?aitNMktjVVlBNjVCbXNFMlh1TFZ3bStZUEpCTzhkTUNEMjlQVG5ocWxFVVk5?=
 =?utf-8?B?aWcrUW1XSkZxcnFPRUpOTjkxSmZhRnhGc21uL2VmWXZSYWdpaTVpYjdxWjZY?=
 =?utf-8?B?RzBWcGtNVFdzM0Zab0tJVXZGOUlVdTBtczVVTStiUUYzUTN5Y2lOOVBHMCtx?=
 =?utf-8?B?VFl4ckJjMnJVRXlUTlZvTHpVaEpCZ05qVGR3b0tDeHpNaHFweW1SampaNXcy?=
 =?utf-8?B?cU9vSE1sTGxOdGtKWGRsT3h3czQvUnE0Z05RWFhyYW8vWGdQdkY0MVpyYVdx?=
 =?utf-8?B?cmJ1RGNrSkVnbXN5YmV3bUlwQzV2Umo1L2xuYlFIQklva1BBOC9wYlNIVnQ1?=
 =?utf-8?B?MWpubEdNZXczc3hGYjFaTzduclRXR0ZyT0J1N2ZnMXNSMXpZMlBabENqak92?=
 =?utf-8?B?cGFSNHBGcSsyc2JrZWJrZ2tTU2NzS05PQ1REd1J5UDM3UFBMMGtXbHpVQStS?=
 =?utf-8?B?ZzRUZ2ZIbVJXSHJ4MVV3ZTI1MzlRVzByT2hybmc1NjExZG1XUERST1pOY0VP?=
 =?utf-8?B?Tnl4Yi9uY0ZtYkZ1TDdEN21vNmlQWEFsb253MTNWNXM5NENGU3pHOFFvMndv?=
 =?utf-8?B?dlBZaHozdnplSDFxeFQ2Rk1ZaldyMWJUYWRYV2dLK1hVNFZzaUgybWRLVmk3?=
 =?utf-8?B?alQwbEFUMXVWa3JaajdEWlVuSitVbkwrNzBTaC9qcVlRdlVkbEZ3V0dpT01r?=
 =?utf-8?B?VHF1ejVicEhTaUNDN3NqNnlVWDlRbWR4VThlbWRlQU4zdm0xUzVOQWk4UVRO?=
 =?utf-8?B?SVlnS2NxOWovZmJ3RFowRHVldE1wRkNvS3REdzlRWm9FV3hhRVJNTjh1cXRu?=
 =?utf-8?B?M3Yxekl2N0dSUjdYTzU0VmoyOC9yZnlBWnpxclNGSE9nRHlwMjg2b1psRXpG?=
 =?utf-8?B?V2REckE5SDJBc1ZleE5jWTlzVFlaQkw5Wi9QYWVYUm1lQXdBUW83aUNUaDEv?=
 =?utf-8?B?ZHVOSFJZcXBoRmRlZ3RzR2xPR085aEl2YmFWUGJ3RVdyTDNibTZRYWpQbFla?=
 =?utf-8?B?eWtra1VjKzdYcUxJcGtRRGh3YmtyU3lGMEYvT0FhemJtOTMwNVpPQkp3TGto?=
 =?utf-8?B?bThNVnBrVCtBd3VHaDZEVjh4ZXcwMGkwYU8yNHl6MU1MWW1acU5XTzJCTWpy?=
 =?utf-8?B?Q2ZXMTBsZHpiaFZuOEdMamlBNyt5YURlNEJjc2twR2h5K1pBSlE2NC9nQ0NZ?=
 =?utf-8?B?aWl2U1l2cG45TU55SUp4dUhxUEJxcW4yNTFCejBCMHhteXE3Q3NRSk9Fb3Qx?=
 =?utf-8?B?ZHVrZkxRREpxYVcxWnloTFRTbG9CR2ROTWNpUFJnTU40eHdGL2xTZFBXNlJu?=
 =?utf-8?B?SFVPUGYwSUZRZjlqN3hsS0o3b2JzcmQycENHeFQxQ28wcE4xOXB4Yk5DMDc0?=
 =?utf-8?B?ZW9Hc2dhRTl1ZEU1bzI3SHM1TUN5TXQ0UVpPVkxPcENXUXpxNDFDSy9ESlJ3?=
 =?utf-8?B?NjBXcTNaYjFiOHlDWGVPa0t1M0dTUVRkaWlaRUtJVVRmYnBPUEVsVWtXbzB0?=
 =?utf-8?B?VmhXUHkzM09NaHM4a3hWc1BoUUF3Wnhsb0JRMzFZc1FZWEdBWEwrWTJZMDEw?=
 =?utf-8?B?a0trcVR6RFJtUHcxZmhhVk15YTRCNGZYd2ZkZEJCaUdOZHBWRlJSZ0pNMzRI?=
 =?utf-8?B?UHZ2aU91Yk9xUVJJMGZkb1dZY09TOEZCQUZ3STI5M3lqSEMraWpMQzZCYXI1?=
 =?utf-8?B?MEN4ZmEyQnlHcS9nZm9tSkxaVjExZzhRclhTQ015SXQySTZCNlFMNk9od1do?=
 =?utf-8?B?dXovakloYkRlT25yWXdxcndsSmZEOFFwcHp2RzBrQkt4ckxhMzkwZVRyZEpP?=
 =?utf-8?B?bndNNm5pUC93NnIrUjJibTYyTTJrYUpqTnFROXFTVXVoMG9XSkR0bkV1cXAr?=
 =?utf-8?B?eFlrMVYwcGFQM3BhRWUrb1I4QTBvbS9Pb3haOVBTMi9LdXMxM1VzRExLaXRG?=
 =?utf-8?Q?eteEwxx3cx+Y30QI=3D?=
X-Exchange-RoutingPolicyChecked: OnS9SWd9EV+Gd99NzxeubXY4LJjF4mXuXlC+3/AcQqeJfo8iZFe7sOedbjod0oCsImEQfS0068r6uUW9AonA5sXVIWWRR1Dpkwkn5yIbb94qqv9ewFc1AmHSXswI4QqraUb/b8CDsob9riB6Wn+k/Qv/sgKQpiSbbRLl1gka+dD6rUSTnrBjmXOXzzEFzrTM+q/eRJhLPpBFTDSwdeiUth+O8ELFFPy4EnnfIfZao+dwQ91LF3+VsG+poN9eWAJQR95MBUsCyHAPNS0SEbjOEtZNKSFIzdz09ne8eRnofYnKT6jixkPe+ftwKE+EXpbSt9uiSrucjp8IxTDINedsEQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fb58b71-c09b-45b9-4780-08deebcf2856
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6967.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 11:06:50.2542
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tdOxyyQOwoQq/ARRCx4T2Cnpev0lDC07ukfCeH1WmNz13DHIzjHd2ty5jS2cdKZbBel1NZhtvYgDrqni8lDOS+j2n6HxPdUPgyc0wSlxcj0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4978
X-OriginatorOrg: intel.com

On 7/27/2026 11:40 AM, phucduc.bui@gmail.com wrote:

> @@ -1766,12 +1762,10 @@ static int tasdevice_dapm_event(struct snd_soc_dapm_widget *w,
>   	int state = 0;
>   
>   	/* Codec Lock Hold */
> -	mutex_lock(&tas_priv->codec_lock);
> +	guard(mutex)(&tas_priv->codec_lock);
>   	if (event == SND_SOC_DAPM_PRE_PMD)
>   		state = 1;
>   	tasdevice_tuning_switch(tas_priv, state);
> -	/* Codec Lock Release*/

If you dropped one comment, you might as well drop the "Hold" one too.
TBH, these were redundant to begin with.

> -	mutex_unlock(&tas_priv->codec_lock);
>   
>   	return 0;
>   }

