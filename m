Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 342613B83F0;
	Mon, 29 Jun 2026 14:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782744706; cv=fail; b=MLzqVKtV2NmXu0kU+DSVCLo3beko1bv4O7T+GBbXKkxFJlD6YS14EVHc00Lpm49m9gfq9AgKg5FP5H9pU37kehKO9aJKi6VfV5ZhqTwYGlOHfR73Cvt6URAXvp5F0vnK4/Q94xKlKaWVX6VpFN5DWPylm3xxVeUjgNCaeKD2rCk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782744706; c=relaxed/simple;
	bh=buvPMNjfwNlLt0pVBQ7KM8GpUj3qs3Y9BQwpD5odKAM=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=R2dJ47DsqjEuetM1tGSo3Sy7y1OL2DgKdlcZ1nAAFLqcuiqO/6FEh+7ARk+87BfRGSX/qEMJrMgMP3Xzwy6zSLeUEIdXhKTDCc2j1cC0cQYSjyYNk9GOJuZLLcfq7F1GlcextV3Kjwk48pcSR7nG89S2F5uhVsYXSICNXxJ5kEQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EoLdEdrK; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EoLdEdrK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782744705; x=1814280705;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=buvPMNjfwNlLt0pVBQ7KM8GpUj3qs3Y9BQwpD5odKAM=;
  b=EoLdEdrKlSsInhKcK55JjCqgjZ83sAjCDNStNAtcOHJ1xVMcax+WGTWs
   jqNWWpkpjqtBmCYJc9zSUchk4TVr7P8keunxu6lj0k5P/oJZRKq20X3Xa
   C8LX8pKiFG7QWyvIYGFHooFugNdW75E8eUb4Nl6zlX5/tCdPzeTDecxcW
   F14+d5GUY+1jtZBDSrDmEdhzH+WLQ3go9ugKFdaq0uS7miih9UH3D86eA
   cxRHx6e9BF/SM1/b3GuWei1qb+uuRghjcG3re3L+ser3xkN7IOcrHaSRL
   ZOb1zW777jvhIC/2epyIKgoWY2+c2N+cdiQDgK3RBb/8Vn+kZlMa+Sstb
   g==;
X-CSE-ConnectionGUID: ZufYGSC6QNiwZ9zluTt1+g==
X-CSE-MsgGUID: +Y1VkHkeSFCB0g6dsCrWsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="106229564"
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="106229564"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 07:51:44 -0700
X-CSE-ConnectionGUID: PSWEK+upS0i7SjBzPy/yIQ==
X-CSE-MsgGUID: KCDnS2dRQnOJNhJ24mQljw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="250286167"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 07:51:44 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 29 Jun 2026 07:51:43 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 29 Jun 2026 07:51:43 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.37) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 29 Jun 2026 07:51:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IUmfUIbHI7lTHTd1bYdqPSNYDjzWj36jlxAtlH+0XivCFsqu3XlmHP/la7I4VvvO2YkZhqlcKUAiIe3hrPBTDnGgXy6p0jLS6TOw0LStUe7zSC5PwmELcZy1xAICd9/hSEbtoShKh/FrW9zoGtfMpbqrZjOsweO3DBa4gAoL93ixLRRDokTQRed00OZGitItB2c9gnU6wdwVJLPWU7JFQXTtT3PpPgOahRizW5odg71waRspLOcgLAtFhblb8w/qNt/IA2/JUHZps790kZ5tL+yESCTTPjyigscHqwg82hshiFv+/cuv4dgFyuhpwuzSKx1YKPYVnfo0O3dins9N+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z/C5bKcUVtAq4p5WnrTbA6zY5OKHR4Z4Q3vsJmjbQ9Q=;
 b=PcE5HihK3FmxqHoKMOWc5lBPE4tDG3nn9o2njkbpZcQDf+DtrlyoB3K1/Ei7q6Fjm3hY1DG9SiAwjKLvUeBu8QxB/xtfM1WJ/wHe3Rcwu6LdFcKXTClvow0aL3dOKzU/VsmQg9HDFcSEVwMwsdM+LAjeCk73n7E8cRUL/OgSNYo9u5fNiCubWG21QPMO+pcr7edIO+6KU/pCHAxV2ZmI2m+fR6aHKLssb95ua3nPyNs3IhMsGAc8pcedKI+vGaf6N8LwFO5+VN4jZBCAXyk8JBeBnOHEIfwF9a8fbQe11M3C/yZZkPf12spSpRshbJhlEFE9te3da3XXTMFDFOk2PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6967.namprd11.prod.outlook.com (2603:10b6:806:2bb::15)
 by IA1PR11MB6444.namprd11.prod.outlook.com (2603:10b6:208:3a7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 14:51:37 +0000
Received: from SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4]) by SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4%3]) with mapi id 15.21.0159.018; Mon, 29 Jun 2026
 14:51:37 +0000
Message-ID: <a55aae2d-ba47-4c03-9f64-49ff679759e6@intel.com>
Date: Mon, 29 Jun 2026 16:51:30 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] ASoC: Intel: Convert locking to
 guard()/scoped_guard()
To: Bui Duc Phuc <phucduc.bui@gmail.com>
CC: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Peter
 Ujfalusi" <peter.ujfalusi@linux.intel.com>, Bard Liao
	<yung-chuan.liao@linux.intel.com>, Kai Vehmanen
	<kai.vehmanen@linux.intel.com>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.dev>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>, "Liam
 Girdwood" <liam.r.girdwood@linux.intel.com>
References: <20260626082904.32344-1-phucduc.bui@gmail.com>
 <0b095ccb-5208-4813-959d-e82480bda50d@intel.com>
 <CAABR9nGtu83T-_riRpbndPyqbhxQpNrcXU-avy2m1VC-H4_AZg@mail.gmail.com>
 <e0a41c2a-3fa1-44d8-afda-71e21d210db8@intel.com>
 <CAABR9nFoDBdGYVDNLEkyGHHksjE2z+Xd7MV7mwdFjieQvD+47Q@mail.gmail.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <CAABR9nFoDBdGYVDNLEkyGHHksjE2z+Xd7MV7mwdFjieQvD+47Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1P191CA0009.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:800:1ba::13) To SA1PR11MB6967.namprd11.prod.outlook.com
 (2603:10b6:806:2bb::15)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6967:EE_|IA1PR11MB6444:EE_
X-MS-Office365-Filtering-Correlation-Id: b6a97507-c31a-4384-b248-08ded5edebaa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|23010399003|1800799024|4143699003|6133799003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: rUTfqTzpmolJkm95USJlQ0Qc42JBhSbM4F+WssmQSyoXYeWrmA1o+IDTBdEWL6LcU5jrO815r0Rw1UdrYoixGDoBu+o40Shq0wv7na0PIDc7o5m3ASxQ/VF95rkkwhCckJBhwkqnYUlhUIxzFyYZMcx+eVPYLxuDe2idiasujEjgVWILfLao5LULZ14u+WP5ZHtg9glIgqlPwsYzivH4/u/0I3TPrwag9Clq9dTW4RHq/POnfOcnEPx5k7lGWjZQJp0vOWuvEMEQwOCrDD3dSvKeKeqxmdqf+lQZFEsE2egS6llSz4yvD87d0UtDayE7+3MC3k2pOc52yMe/X7C4JS2cTa1/IUfD6AYRbL3dusFWu6pAvebibNzQ/lhDDhDo2W52uPIRFU6plEtveumArU9bWFc/9R6rAgDPW7nPLPzbBIYTVp2LgU4W+sROVu4YkoAMgA6Hno33z5l7Aou/+oWYYyRqbgbcV6MQn2gFL+3FxgOioOg/TU2USZMxcXR2H9w5vKP7zSrIkTrk0V4IVWVCFuyfgduivG8xQ9Kl/MC5sz3Xe8n7jH+tERP04Zg/Uq6MnBRcllNA2YF+cfgQ0426Hkwg2E1mV2tDTbVjqtQvVAQMCgexZxx2TJEcToaGYzu0MV2XGoLeDwhDlK4nLZs074Lq0APURRLlfFYqf8M=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB6967.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(23010399003)(1800799024)(4143699003)(6133799003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aVBRMTczNjArN1FqUFRET3Z0Y2U3WnBTUk9mRE5GeDFpYlV2b0pCMjRuUitq?=
 =?utf-8?B?b2FMeFltYkh6a1NBSEc4RjlWd054UEgvVlFzb2MrMWxtVGgvaUNRM0RqbXlE?=
 =?utf-8?B?Rnl3OUxxK3VONlhlOEN4VlEyTkM0dS90KzFWdnV2L1VFUVNjYWR4ZVBxcExi?=
 =?utf-8?B?emhKYjk3aWtwd2Q4YmErRGhPSkR0d3lqRDdicFZ0UHhKcUdrZVNKTEd6NVRa?=
 =?utf-8?B?cEMvOHQzc3ViR0Zwb3poYmxpQ29OZWdCaURSYi93OUNaQU43Wld3QzhmUUxR?=
 =?utf-8?B?MC8wMGFQT0JyU2pFSmpVbVJSbHFnYVFLcGJwRkJmQ3ZTWXppRDRmaFpLZTh2?=
 =?utf-8?B?dzlDVmg1RlhUMGZmVk4yTDBJU3J1Sk5PUjdIK2hMRk1mVHhHNWRDWUJBWmx1?=
 =?utf-8?B?dXA5RHcrVHROZzlFUHp5aG50M3NPVG5PUG1pVFV1dTJUQVU3eVFxN3hSNGRj?=
 =?utf-8?B?SmdCNXFuS2tXMFBUQjhxSFVQbWFCV0N2TFI1QTF2TG9jRG5lbWpjMm5DeUph?=
 =?utf-8?B?aUQvaElZZHgrRDN1TUN0SzZkdWpTbVJGN1l0cWNVeFc2ZGxQWVAxSEFUMEFl?=
 =?utf-8?B?SzdoUGY4MzZmaUNDTWxrRThNL3dwMHJrTjlxdy9qOEFSbXVKYm42WDRKME92?=
 =?utf-8?B?SUQyU1pUSTlCK09ESjVmWGNTQm11dnR3MkJvNUI2SkI4NVcyUUhXK1NYdTJh?=
 =?utf-8?B?djVTZzdER1N6VWJpazFoTVJPVXB0KzlSbjFQUnBuTmduZEN5bHFKaGFNT2R4?=
 =?utf-8?B?N0dIUnE0Um1xa1loYklHMWFwRjBtYmxaL2tibGd5RGFMRG9zZTdhaWdUOFBm?=
 =?utf-8?B?SnVDcWUvWmFoV09NMlRiMUQ2aTZpU0ZKQ3MzM3lVOC9BbUR1NUt3TC9WbGEr?=
 =?utf-8?B?OEtydlZ3b1RpSUxPY3BsNFk0WGRsc3g5YjJYVjJnSERRZnk1dStncFJjT3lX?=
 =?utf-8?B?cll6RXp2YjhoSzc0K0JoaTJUc3laSjVORHJYaDZTRjBCWUFkYnh4YXhJelJn?=
 =?utf-8?B?NHFBZ3oxbFZvcE44alhRRXlETEY4NnQ2OGphNi9jNDVqc1VYRnZCL1h0MmlZ?=
 =?utf-8?B?VlNWclREMi9xbFRra1VHNkQ1TDFLRDZoSnZsSm5sZURBQm9DNWlwb3JRN2dH?=
 =?utf-8?B?SFlFUmxOOWdiWkJ3U24yenNFd0R1aGV4Nk1LL1kzNlp4UkliK3BZOEdiL0JL?=
 =?utf-8?B?T1hSeWhCQzdtbSttSmVadDdBYU8rVFFzVk91NU5QdEJNSmdoYlZDdTU5MzFt?=
 =?utf-8?B?Ti9oRVlXeFpDbDJVS3Rzb0FYMjNDK2MvS2lFazhabEZwMDB1bFphL0xCbVVp?=
 =?utf-8?B?NGJNbmlUNkFsVkdnQkxjOERNNHBLYys4N3FicUdCcjRqOWY5VUtHWEYrMEQ5?=
 =?utf-8?B?d2RWQ1Awcms2eklPejloZCt2R2VTV2dpdk1jTWV0enhjQjAyc1RybW5BM0Iy?=
 =?utf-8?B?eDlkajMwbzRYNnJkdDBlV2I4UGFtSUlyL2FpeDNQeTFodUE5MFF1NUI4aXg4?=
 =?utf-8?B?YzNKY3FoTCttUWZ2S0IvOHBpM0JqTkV4d3I4NWlwK3h4VDNCTjlkNlgzM2Vr?=
 =?utf-8?B?VWNpT29IaDliNFA0K3N4UEdNNDdnbFA1cU02QUlQQllOWnB2S3BEcExvN2JK?=
 =?utf-8?B?MHI0S2VlYVZNdWJZTFpBSURETlhMNWJ4L2VOMzJIdzhIWEVLdWdHcHFMTXpP?=
 =?utf-8?B?RG9zbVE5M1VQblRkRjEveGFEdUg0ZXhySzFpeW42OTR6NFJNTnBEcUZMOGMx?=
 =?utf-8?B?NkhlSjNDTWEyL1VHN0s3T2pOWTVyQWdPQXRpQ0ZEUHpSNk5zQXNPNkVSRHZS?=
 =?utf-8?B?Znhmc0V2bXA4aVF1WkR2SjBpNTZLc0tKcUVzeUZqSjZaNHdEelc3V1RBejRt?=
 =?utf-8?B?Wm5nQ0VTUFQwMUVnS3d2RnhlL2FNYkUwdk9hdk8rOWY0ci9YUm42K0xDekpX?=
 =?utf-8?B?cWtTTWhNQVFFdlZVQjhHQTlXUHBTMG5NbnNZKytMd0dNLzVXY2lSQkN6Z2V1?=
 =?utf-8?B?K0dITEd6emhwMmFvL1JqblVWWU95VjJUQ0REQ2w4Yy9jU0F5dE03ajVlcWhQ?=
 =?utf-8?B?UnRMKzRhUENUL1FQbTYwL3NkbFM4dGtpV2tLTHlyVDlZYjFXblpYQmsrM3ZX?=
 =?utf-8?B?V2hQWGJXaEJzOFBDU0lTaHZSaStscTlWT0hsdHE2ZlgvOTVtU0o1TDRUdXdM?=
 =?utf-8?B?WnlKU1dWdHJTU2dqYnVndmJKdlZzdjN6aXZkY1R5TncrdzIrUzJ0MmdPNDBY?=
 =?utf-8?B?NkxMcGRZTUtBMzNIeHNoMHBuZ0xhS1pCNXhNODNQcDZBdnBnS3drNVcwdXJO?=
 =?utf-8?B?YVdjL1FmVlc4Q2E4VUNDSktqK2ZuUmE3TW4ycnJuaUdHN2J3UkwrczI4NnlB?=
 =?utf-8?Q?wEcrScKEkg6jOdss=3D?=
X-Exchange-RoutingPolicyChecked: S79WhIYiKZBWE0EIvipsypbEMwL19kbriK7qmJd3wx6ZC331PTOwW3hKfpT3E7Ybr07mn1GbXWrgUWV3VX5G0Z1Dy2uSMF6vjRuB+h3Gk/2i9L3DfRETmAWsFdAn6IpHHzD05/VMtPiLdXUuGzZjG5VdfSbSW2fb+WzjoLoyHFYEEUPl5N+uhvsrb8aNEZNut3kAi7EqRyz5vHQmnWnMlV60U2runQ7cGMRv/b8Ph8IRRLM14vCBmdd5lb6cn9w5QoTwjqG1TTbs3Py4Cw+IXlX5YoRgdmpU+gCR0O5/aDyN9eUc/qEUckyeZHtvNS3QxLHphAGoReggpuSuExYeUg==
X-MS-Exchange-CrossTenant-Network-Message-Id: b6a97507-c31a-4384-b248-08ded5edebaa
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6967.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 14:51:37.4834
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ERwB3sqf1KuVCJ+LoLiadRO+PT+RUt+DRWl8slfh4DHK5b0LCiz3aQtPsLuQBT1B5VwAZD3CBqgzuYnVeGyFjLpiUKYhid32MTZIBaT9Q+g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6444
X-OriginatorOrg: intel.com

On 6/29/2026 4:26 PM, Bui Duc Phuc wrote:
> On Mon, Jun 29, 2026 at 8:25 PM Cezary Rojewski
> <cezary.rojewski@intel.com> wrote:

>> Cannot share the details but I'm talking about actual long-term-support
>> CI with large amount of corporate resources invested.  A lab, high
>> number of physical setups with intention to cover every Intel's AudioDSP
>> architecture version (starting from Haswell) and streaming-interface
>> type (HDAudio, DMIC etc.).
>>
>> All functional tests are fully automated - imitate every single scenario
>> we do expose for our clients, regardless of the OS type.  While again, I
>> cannot list the tests, the basics are quite simple - bucket the
>> "functions" e.g.: system states (SXes), device states (DXes),
>> multi-threading, clocking (the list goes on) and do: atomic test and
>> then a combination for each feature from each bucket (if valid).
>> Incomplete example for basic playback:
>>
>> - 1x default endpoint pb before s3
>> - 1x default endpoint pb during s3
>> - 1x default endpoint pb after s3
>> - 1x default endpoint pb before s4
>> - 1x default endpoint pb during s4
>> - 1x default endpoint pb after s4
>>
>> Wait, does that mean the tests go in thousands?  Yeah, several thousands.
>>
>> However, without such investment, people like me would not be able to
>> propose and provide reliable contributions for Intel and ASoC both.
>>
> 
> Thanks for the detailed explanation.
> 
> That sounds like a very impressive CI infrastructure. Having such a well-funded
> and comprehensive validation system is clearly a huge advantage when developing
> and reviewing patches. Running thousands of functional scenarios
> across different
> DSP generations and streaming interfaces certainly gives much higher confidence
> in changes.
> 
> That said, it also made me think about the `sst_media_open()` case.
> Unless I misunderstood something, the CI didn't catch the memory leak
> caused by `kfree(stream)` when `snd_pcm_hw_constraint_integer()`
> returns an error.
> That issue only became apparent while doing the cleanup work.

Nah, the CI hasn't been run yet. Maintenance takes a long time :)
Unfortunately for "atom", it's outside of the support window.  My 
Tested-by: would go for the platforms support by avs (and catpt) driver.
> So perhaps the patch  ASoC: intel: atom: Use __free(kfree) for stream pointer
>   is not merely a cleanup patch after all—it also fixes a real memory leak.
> 
> Out of curiosity, has this function been covered by the CI before?
> Or is this simply one of those corner cases that are difficult to exercise,
> even with such extensive functional testing?
No CI is not 100% bullet-proof window, it never is going to find 
everything, that's why you need still us - developers.

