Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 293BB499F08
	for <linux-sound@vger.kernel.org>; Mon, 14 Sep 2026 17:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789408704; cv=fail; b=pWhpPDSENOrRj90SIGGS0pb08jFBNp1CepCs7yTdeBBeYyH8NAjxIAVIYIcEeiMa6tw+ThBV6AiAEKEmgu3IUgcpWL0YaitXuGahm4i34Se6IWmVWLwstOcOcM+3oN5olbnJ7Qx4DRDH5+JtGqOj051N9ORIzYoJdnxbpVmXEC4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789408704; c=relaxed/simple;
	bh=fyKjGK7uXSatc4u8PeqGIvEjK+m8iDwrVfaIKkmp3dg=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Sq/Afd4Oyph6yoPUo0CLGJw72vK2Ciciqoe7xvRiLMxE1cHJO8Ssd8HeVzt3rxMYOMHQV5ycXo94WwM7HR3EbCwhLlks4A3RwT5GEJjoFBN1+zAGXdHW2XbWAKG7v6a5YCOe0nRWkLrCrg7ikPURRqI2dGXcCLNY1+eVfErKjcE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E5s8gzkr; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E5s8gzkr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789408703; x=1820944703;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=fyKjGK7uXSatc4u8PeqGIvEjK+m8iDwrVfaIKkmp3dg=;
  b=E5s8gzkrfvMrQYfDYfVYNOMQ7ZkVBDRWeajm/SYfD2kdVtDiwYrgWari
   fPFXcP3mE7FSnRTzjxm1cSGG3stGcvwlXEWf+uwUi2Z9whBTdwpIL9EM3
   ynHSAGJsXLvW84rOrNOpfZbqdsyPGgqfgJufOH+qiiYt24nisrUJvYkqr
   YyeYrC91HgivtsqEGj5XctWPhDxOJgS10bf2aV3CqdxrE3C8lXjhNEQ9V
   GCnf9lw6z29LWCDATGbT6vduP5jmYCVgQGFWdVvJfMLefKGaEKyAD5Ydh
   94Kt0/TzJOiYgPo/bVm8uDG2DJr7R8FH+w4L9uoAx9o3oER21nK55xA/M
   A==;
X-CSE-ConnectionGUID: qIIDg1YmQ7i+5I7Sz/dk8w==
X-CSE-MsgGUID: hMdtvAz/SdWmkfdEskBrpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100919135"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="100919135"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 10:58:22 -0700
X-CSE-ConnectionGUID: +0DUjWw+QTOxJuLKJHEDpQ==
X-CSE-MsgGUID: 4RlkwWrmQ5+F+z5Xx+eL8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="271292931"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 10:58:21 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 10:58:21 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 14 Sep 2026 10:58:21 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.47) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 10:58:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oYKIHcQ7cfpcLznjUS9Av6hc64iQfCaZJBdKjIaci8qvsMw2KvLUUDrayao9GpxO+cvlTCvIhcYgcyfmtCfwkGvRYPaUC7ouHBGX0ldRPies8C5KObPaYfKUfbkhXeLuBhGzoHOeIaIjVnynXxg94MS7HYT05J9ig7fLvXW6qzTIgMuU4kdBTm84aJCfqz9cGQIAV0mfhKClDv9ixR/kClD7o+yssnN+zVlhGZ5F0ZEEAIq1zKP+ADLIq+8fkRzUDUZ0qV3lJjHkmXTNgFmWmpDUBpzuSbR4kAghGLPOfvlT7c2V0a5xp9qSYhQGsUHTHYAKQnfZIjru72iuEwHbEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y+6GD96/cv2+gA5CBye5o798WYVeE8SMWm8E+hALyyg=;
 b=dJ4lIBqUhAljm1XeF7WxjbywwZ+1JZCBfAuphP4leExy44CDenebs0y3HySrZQoec8i5+JuB3qpkzxBeE74sJgQhMGZNpBuHbVIbi+C5V6d4b4eQWGUok/hhdOjWBtaHP++Ohtva5HCFnMmDcamRHZwl77LLR+8wPnR9zmq7HdRFjhkUR8Njysx7YkG8xErhYkKEQQfuldFs/d5oPDeJhpg/ji2G2x1MGIDOuq12wEWVyL/y6YZVGqN6bkd0+UOBl8i5yroK3uIuyPnSq6lZAYvH6lCxyd8E3m5J0NAcdPkc00sizaZxap83u48Q4QclbHR7m/75cOP9xn3yenEtYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6006.namprd11.prod.outlook.com (2603:10b6:510:1e1::13)
 by SA1PR11MB8541.namprd11.prod.outlook.com (2603:10b6:806:3a9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 17:58:10 +0000
Received: from PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd]) by PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd%6]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 17:58:10 +0000
Message-ID: <1d146db5-f4ff-4a5b-a1d9-181ee6d8ceac@intel.com>
Date: Mon, 14 Sep 2026 19:58:05 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ALSA: hda: Allow for codec model selection with module
 param
To: Takashi Iwai <tiwai@suse.de>
CC: <tiwai@suse.com>, <broonie@kernel.org>, <perex@perex.cz>,
	<amade@asmblr.net>, <linux-sound@vger.kernel.org>
References: <20260914102253.2969724-1-cezary.rojewski@intel.com>
 <87bj9zom8l.wl-tiwai@suse.de>
 <9e17f127-ecaa-407f-96ec-0993e9c1ee83@intel.com>
 <87tsnrn5oe.wl-tiwai@suse.de>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <87tsnrn5oe.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P250CA0015.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:5df::14) To PH7PR11MB6006.namprd11.prod.outlook.com
 (2603:10b6:510:1e1::13)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6006:EE_|SA1PR11MB8541:EE_
X-MS-Office365-Filtering-Correlation-Id: 94364291-5f63-4887-c0f1-08df1289bd13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|6133799003|18002099003|22082099003|4143699003|10067099003|56012099006|11063799006|5023799004;
X-Microsoft-Antispam-Message-Info: lcmMaz/kHFvKRIVWml51wdOV1/RQw+VsEpO/Xz9eZzPX6cMt4S/SjrfaWvCZsNBLng8mXqTItDsP63xEljvK/RWhSr8QQcjcA8qddBOtn1U72pGkM9DV2EqgESenEB+MlcoACCKUb83i8i03Bw8yELUefqxl/mtr2bq0cjE272QSalNOCFWaONsv+ACRxF3SIWyHQ0U1EWkNioyiXQxwec6HNFSStJPjDvRDb7XO58UhzAcFD/O0r8h+JEhX8tndmhFZFpum1MGVff4h+DA73tTx3jydpO2qyUI637mNiQdwUjWdtfvh3Arq157+bMQP7oqAztkum/MS8BMbPWBUL0Jy/nnPzbCNtn9qVsNEQfovN8iS5s8DLQGCR/ai9qR4cpQoVQog/81mRw6YV+J0kZyAMIz5kgrhaQmRfB0cbvcOuG33Zj05pou8iPtBN5KwYevtnuSs1O1/ZBZq1kkYfw8inrKwwIgS7gCun/07Kvw7kq8uMK2R/YM5IKcxWBlNs13qJK5+RTlpks6Y2dJuODwt779c+9UbhucFsPmM99y4y9Sj3N2x9BuHnd/bRKiX41HaKP7rsNMQFAHkNVUQVhVCYqrOhUn77O30BcI34GaU2olbVNY96tFfwwf1Gqxa
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(6133799003)(18002099003)(22082099003)(4143699003)(10067099003)(56012099006)(11063799006)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aWJrcGQ3MEZyK2sxZnpsZFRMTFRKTU1vY3lxcklCQzE5dkdreTVBTGpIUE9H?=
 =?utf-8?B?RURkZnRSdngzdmFkVGxmZlRKQ2NUM3dEdUphS0JHd3Q3bTlJNnBvVE9VS0VU?=
 =?utf-8?B?MGt0aHN1blc5dUl4bDFVNTIxSURZejAwOE1DQXpIT2IvaUF5MFJBV3pQRkNr?=
 =?utf-8?B?SmtlaTJmaEc1MTFLUnJObkFqQkZSQ2NmZjdnMUhmU1VFOFBtdlR5d3JtdTNZ?=
 =?utf-8?B?MFN0elQ1S0thMElhQlNXdzBTalhDQkFOMkdwcDRCUlFXUXNZdGZtdnhTNFhy?=
 =?utf-8?B?Nld6OE9lcWVyQzE2bTFUN2M4RThOTVg1QUZXRkJoOHR2YVd1cStMb3V1d1Fm?=
 =?utf-8?B?dllXZ2lhbzZuVU1KelMxUVBqMVdiSE16L1dVWjZrb0JTWi9TMDRQa3Nmc2RU?=
 =?utf-8?B?OUJrQTlpRUt1V3RjRnhzKzNwN0JWaWhqV2daL1NnZUJ1UUoxMDlUTW9XdmVX?=
 =?utf-8?B?Uk1YaFlWUm1ISVFBaTJTZTBRakRrVS9rNTBKQWl0ODhNRHRKdEpPcktSMWo0?=
 =?utf-8?B?dUpPZzdIZmk5ZG4vVm04NzFaWjhjRU1yaGRDRlpWUk5hZkVrTVc4aytjQktW?=
 =?utf-8?B?WW16NWRZczVNZ1Z5NXVJWFA0bkhyZG1PVHlLQVRzYm5PVHZWUjR2Mm0zclBU?=
 =?utf-8?B?c0RGZVJDZzE5S1lWS2EzVEw0SG01UFh0dGN2Z2hYTVI2TFFLTWFCYXk5Uzdw?=
 =?utf-8?B?T08wUXd0MERDRmVkcFM5SmtCVlZiWEFhdlZnblRaMXI5T05OWXNVcDh4d2FT?=
 =?utf-8?B?d0lIMXJnN2RYVGpWNDdDRjJ0Vi9PdDJCNjVBZ2RRWGxJYU04dVlDOFhIbm9Z?=
 =?utf-8?B?ZHRnUC9FY0IzQkY4VlljSUp2Qk8xdEQwMjc5anRQZkhGa2g1dXIvTWtDcDVC?=
 =?utf-8?B?dW43aDI1dEZkWm9laDlWb29lUmFIL2pweWErNTRybDB6bzkwb3J3ZDNzbmU1?=
 =?utf-8?B?VSt1a3d4dUN2SkJadGRubFVzdlBhL1diOHN0SEc1MUhKN1NzOUxWKy9yWkdq?=
 =?utf-8?B?UDduV2tPSjlLbUx6bWVrM1dpZExUYmgrd3pMOVcycjJWMDhpU2xBT0NOc0xB?=
 =?utf-8?B?NmFaK2s0K2ZSNk5hOTRYQ1pTU0FGdllvRmpJUC9peCs3Y0NoTUxIMGlmcWpH?=
 =?utf-8?B?R1dETWs5Q2JtTGZpNmtOandQOXViRWIrRko2VHpPay9kbi9DcnEvZlBBbmhh?=
 =?utf-8?B?Vnl3dTVoM3NXNzJrZWgrbzU5TVhFMEhqN09KV3hnNTFkbllyeWNtS0RCMGFv?=
 =?utf-8?B?RGp1UFhrRXBoeXpoSFJ3L2xLSUtwQjVBMVNJdkRzRTZEQ1oveFFGdmkyVmND?=
 =?utf-8?B?RzRaWDNXSXVibXVyNXNkSFV1N2FrYXVvSWpVQ09rOFROTE5tTTNhbGpDODZv?=
 =?utf-8?B?VCtuejIraHk5MmxkZHFqcmVoUlJxNlUvQkpoQ1Y3dElENU0wUXMvOHNFTmFw?=
 =?utf-8?B?cTIvOWdpTHdRa0d0UVhEcERIcWd0bWRNWFk5aDVFNGh1enVZRmpMZklGUmJj?=
 =?utf-8?B?dm5tYmxCV0diZGhHNW1reUJUSUJuaURpN3FwVjZjZmVyeS9CUjJmL0c0V1N1?=
 =?utf-8?B?YmFCcFhXZmUvOUkyQmEzeTJOUEFRcFc2NkZpc2NPTmVNTy8vQVdLd3hCMGt2?=
 =?utf-8?B?TUlnb2tKbWU0TWFUaGlUQ21NUElkVXpGdGg0NWdlTGVNQlQ2ck00aDlLK3Vk?=
 =?utf-8?B?QkpFQTlVeVlGeWNyREhlZy9JN0xkVksyS3dzTU9mSm9kQmRETDc1MnRzUXhk?=
 =?utf-8?B?WTZyTWFETUpaLytYTUsrV2RUa1VRYVpIaTF2YmoybmVpbFkzZDJoanlSTVJD?=
 =?utf-8?B?ZnNKdUs3NVRrNDk4dmdQR0RQWExvcmt0eEk5NHQzTXdkNFlzdXNBSEZUcXJx?=
 =?utf-8?B?R1VKS3FFS1grN2hwVm4xNTF0TDZudmExT1JyRDlTYlBZdnU1SEg1V2xHaTVz?=
 =?utf-8?B?NXVnSzZ6UjdlUnk0bW5na1h5ZDhxbGp5ZWdwcGJDWEpaL2FmUnROZmVMKzVm?=
 =?utf-8?B?bXhST3RKTUQ3eGUyNkIzRkFYbExza0oyWFJJRUFZbWNybDRhVGx0eGpYZFBB?=
 =?utf-8?B?aDVRQlpaMTZQQjcxUW05S2s3bTlDYWZnc1RDWXJKU2JxaWo1amJ0YTFqM0Iv?=
 =?utf-8?B?eTh5OGphMloxV3NQaGNoMUlCU2JaQUZIUUxRMUVxSlBOMDQ2V0VyTHpPK3RM?=
 =?utf-8?B?SnVvZ0svdWovZGxqbzVuOWxiWXNQQi9UeUIzeHQ5Tm5UdlloL0k2SzRtbVJN?=
 =?utf-8?B?bUpVTnlWcVl5QnFHVkdQZWZQWUlEVlF3cms2QlVVamtwLzliNStEVWczN3k5?=
 =?utf-8?B?SmRYSFBKdkhRa20vOTJ0TnZFckZBdG0yenY1WnNUbzFGaVdiOENXbGI5TFFL?=
 =?utf-8?Q?bh3Ngl0ViRoDxn0E=3D?=
X-Exchange-RoutingPolicyChecked: G4at4E6WG+Qyz9XuQ1Gj3hOR2+zsZbSqw5s78TZO8PftOzkh4T2cb2uBTsmCTpCX6Z0eDVeLmJjxg9az2GGEo/j6sa9x3j+HmYq5MsJIEf2HPlgTgJUTzgOb2JyUGs9hH14EHcBj5zzsVX6sKAopNP+ufZ7GScJaLyiE4U3XfcGb00MF8xo2Kq1BhKm++jE7dVf4mKfPNj4Xs3vywvKbNvLFZ9m+H8Mn56KvTlS36mjbJrQq1QVTcAnsGDFsFm0KtSuY78wBL6/nUP7mCZIKHRPyf1xE5/JlWyHnNXxJ7QrX1fRoMwWQW3HwFttZhrja/gnGxwN+Yi6F8NlPBTSUOg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 94364291-5f63-4887-c0f1-08df1289bd13
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 17:58:10.3322
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0V2nS34+y/B/W17yo572hH1h4UZW09GSRDkhOgEb1BCtFVx6EbGgIoR4uOvjWDa+Nq5y+eQAe58iJ4+IfJVc+7mh5vY8ieIvgweWb5TNLEs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8541
X-OriginatorOrg: intel.com

On 9/14/2026 6:44 PM, Takashi Iwai wrote:

>>>> Model selection allows for customization of codec behaviour and thus
>>>> dealing with various problems on very specific configurations. The
>>>> parameter already exists but is part of snd_hda_intel specifically.
>>>> Non-Intel HDAudio controllers and DSP-capable drivers cannot benefit
>>>> from it.
>>>>
>>>> The common place for all the bus drivers is snd_hda_codec. Add modelname
>>>> parameter there and honor it when initializing codec->modelname field.
>>>>
>>>> Link: https://github.com/thesofproject/linux/issues/5683
>>>> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
>>>
>>> The handling of the model option is a very long-standing PITA.
>>> A few years ago, I proposed a change like:
>>>   https://mailman.alsa-project.org/pipermail/alsa-devel/2022-September/206631.html
>>> but it didn't reach to agreement.  So I'm not 100% sure whether adding
>>> here is the best choice, either.
>> Thank you for the link, Takashi.
>>
>> IMHO patch presented here addresses the feedback. I too prefer
>> one-location-for-all approach. Also, I do believe having no option for
>> specifying the model is worse than choosing either of the approaches for
>> the model selection.
>>
>> snd_hda_codec module is *everywhere* and given the param is an array, it
>> supports even very complicated scenarios when multiple HDAudio codecs
>> are engaged.
> 
> The multi-codec is exactly the problem I've been seeing (of course in
> addition to the lack of the option in ASoC HD-audio).  You'll have to
> be very careful how to pass the option, and it can be even fragile.
> That's why I hesitated to take this...
By multi-codec I also meant scenarios where one has 2+ codecs from one
vendor e.g.: realtek. Having non-array param e.g.: for
snd_hda_codec_realtek would not suffice.
