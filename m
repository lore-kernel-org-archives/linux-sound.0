Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C6523B5841;
	Mon, 20 Jul 2026 07:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784531148; cv=fail; b=PTFwb9eVNBCw5+NSlnfuh/i63pm1+hdWDbs/lVe1l5sSKKH3q44tjNqkS89EKQHf9PrTUSnvLRDRZG0aj8yJmEv3aPI5Hor/rygFWT3mX2sGKIFDBeuUBLgTRzdP91tVCTm+BZBdqylA8dCP4BgZf0OI/rHQCknqgwYNCwh9tlQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784531148; c=relaxed/simple;
	bh=umopNEq7hW6OTsSXJVmlxyxvnJXZGKiSzebul04A6Vg=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=KuO40YLTsbBAAanjAcP7f4US/esae2dIXHTbiUWZIcs0rwTonR9rwler78fSaR3mcr7tFtcN7EEdseQK4jP2h4NfF1j5HRQoYV7pS+WuwxZhB/57vIDepLdZnEw6b28vcdAIEEvt2ZeRLx2O6HkYpwCxcCttOYqLlxkgRr91K0s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DOaCRFZA; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DOaCRFZA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784531145; x=1816067145;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=umopNEq7hW6OTsSXJVmlxyxvnJXZGKiSzebul04A6Vg=;
  b=DOaCRFZA1w9yJ5UT4m9tS5aZyDIzf+ISit3apa9NaX/sytOglWxeXuU0
   TLm8WCFFpzRtpWRt2JAEL0iXeht4FYuQ9jl0DafNbz2Gob51UxDP0YffB
   QPb+ac176H6YlN4oFOiNHEXscrJOLzksQOH1VmLxTaTqhq0VX0parvmAF
   4Z4rBtagNl/afCOjPws4ZuIWAY2DqnggF4NDHMqP8lxcJinN7JsOFbBi+
   7lXWzmefcEQ0G/+u1/pZbBt7cQPKz3d9p3QvcOQxK9xr7wtER9nij7WNE
   d9IBk5fh1VUQxec6+K5aw/l1gy2vqqo7OBoTUoFw7zi5j5wV8iHCsZWSf
   Q==;
X-CSE-ConnectionGUID: 77TvciqZRzCE1epB736Xpg==
X-CSE-MsgGUID: DsHLi0T3TmmO1KCxNQSMBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11851"; a="95756003"
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; 
   d="scan'208";a="95756003"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2026 00:05:44 -0700
X-CSE-ConnectionGUID: m2D3/kOoQLqEj9dyS4pFvg==
X-CSE-MsgGUID: ifQSukIkSzGz4o4CjENOlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; 
   d="scan'208";a="260941089"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2026 00:05:44 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 20 Jul 2026 00:05:43 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 20 Jul 2026 00:05:43 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.65) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 20 Jul 2026 00:05:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TnvsdZK/qLixMtanHJm7xHhOtMiTcsg8S7zfaUgu5uR6bRAllYPVf+sfDyFAPR09S1Fct61AxBTBc969AMnsCz0RPqAzPhA9znhG4MiW180DRtBpyy5EVa4jGdd5pphqpveDDEonPX3LOWKMd7WAxF9d0kM7mMa2chtCnkkzH7XJ5yDLFBjqx9/2TJGoexn51yPnNXebnXwIXpdpN6+gmFrhTaEDrDeV7AmqvzisF7ag3uwd5+gK0r4F9GTjWYiSA36COr2RKwQvvsaIup+VUS71+gz3AdNAML/fr1TXD9OV/SvxwPVR4hrQGSu6c8Hxij1Sr2iTGQBS62Gp87AZVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wYyNxmHQrrfDLs+XOo7WZ48oRYUmkGjOBs62LrzqWVE=;
 b=gyG9MYfpR5qVLvSAn2V+h+GZMqiJVHSlF5QI3tSR3LuGMJYVYY/XD0Tas9U0cclbH76A3UDe7JZVFq5JscsspJRhWa7zqdsK0tNiCktbzi9KbZGJZ0ef7fV5tWgeuTkM1Q8PKM6HWOaHbqHm0at/7h8BdTvsdRoP9myQDrKkYhSysykYB/3sk6eddHoc5vGNJpK+7vfslQu7mhk8FivI0/1BCNEXEok8AY1gVn9JF6MwtmvSWv+cj/wyqCNV1pkpxdtFRGFPDYyIh0WcNowPh68C9xiLcVsY97XJfIAE/jC891RoeV3cczd0zbBJaQi6zvMh/9HMsFoZaDqPGahXgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6967.namprd11.prod.outlook.com (2603:10b6:806:2bb::15)
 by DS6PR11MB9917.namprd11.prod.outlook.com (2603:10b6:8:461::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.15; Mon, 20 Jul
 2026 07:05:42 +0000
Received: from SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4]) by SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4%3]) with mapi id 15.21.0223.013; Mon, 20 Jul 2026
 07:05:41 +0000
Message-ID: <438e48da-b559-4f08-b12b-078610135550@intel.com>
Date: Mon, 20 Jul 2026 09:05:35 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] ASoC: amd: acp: Unify code style for
 platform_device_id array
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?=
	<u.kleine-koenig@baylibre.com>
CC: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Venkata Prasad Potturu
	<venkataprasad.potturu@amd.com>, Jaroslav Kysela <perex@perex.cz>, "Takashi
 Iwai" <tiwai@suse.com>, Cristian Ciocaltea
	<cristian.ciocaltea@collabora.com>, Mario Limonciello
	<mario.limonciello@amd.com>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Liam Girdwood
	<lgirdwood@gmail.com>, "Mark Brown" <broonie@kernel.org>
References: <cover.1784528081.git.u.kleine-koenig@baylibre.com>
 <08137cf5b3cdd0cc2e00da32256664f3cb9b1e4e.1784528081.git.u.kleine-koenig@baylibre.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <08137cf5b3cdd0cc2e00da32256664f3cb9b1e4e.1784528081.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR0202CA0001.eurprd02.prod.outlook.com
 (2603:10a6:803:14::14) To SA1PR11MB6967.namprd11.prod.outlook.com
 (2603:10b6:806:2bb::15)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6967:EE_|DS6PR11MB9917:EE_
X-MS-Office365-Filtering-Correlation-Id: 99faa391-3496-4a44-c2c3-08dee62d4f93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|7416014|376014|1800799024|56012099006|11063799006|5023799004|10067099003|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 72wTcxoVE+ta18yTxtBc+Q/ZF8kWGzUApVuNP+lYBrgM04dVVWCS4tjQnV9v/znSqVNaAuoBarjWarczT/gN+P/1XwUDLvvrCr3xvVYq8iTvL94TmDFJj6KDq90QqY05LDmk0H9JKQEKutBk1WQlpVqnNB0AbJ6EwwYJlPhO9kT2Y6bzVmLux26ByGczdyUVqyk4/4uwOrkv4Ze5NEBLDFpOCCK6F4vSmDKkhOYIgpfjYjSyaDLZgTivZmIKz6UlZbVLmPzom2vqZqFtgoTLQwsEkrgE4NSgeyBOxdUKYim8Uo+YdEiub1ziGdJYONziyuetOrPEcEmc37KFnovD7n2Nu2T+RuaWDF/d43tshvRpX00tjnzb58IetfYr3nklSPZKMaZIvKTJsAOhXinpkptQKw3OYkohGHqgfdFjIfay2yNNiMrrSZhskNAV3tuJiUk7QMQCO1CgFx7a8vQHycEegW0HRBhFShtd9SLonkf6JL87su9TYeRQr/kfHYFdhNGFenzmSSWdURqXEyKHllViAo1pGLzu2DQjV3AhVZHzJmxMnMErelgZln6WT5xiDAcng932vYgUfEFxzJehfcq0PhwjzVRDHTJr/HoUJCK72S5toQB1uC8iOuoVFv3mT7N3BO/PoOp0QcfGp8Rzlm+TVm1d1A+guxYdIyxPYeA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB6967.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(7416014)(376014)(1800799024)(56012099006)(11063799006)(5023799004)(10067099003)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V29WMStKNnc1ai9zM1lzRFJWNnVFSEdLR1E5a2dpeTRGeHNUUEtPTkpzb1dQ?=
 =?utf-8?B?Z2pHSW01R1AwRkpOSFpMZnBsdnRrQjB0YWNCOWZnb1Znb0VDT3kwTkNGaHND?=
 =?utf-8?B?RVlOeUhRekh4SWJYT2NUMlRsWG9KMk9uQ1FZRzEwc0tVUTh2VG1FTmVLWVVN?=
 =?utf-8?B?bjQ5Nmo2YWNHcFBQWGM2Slkva0QrbkdvM0hZV0l1bVBkMGpTRmQ1MnA0Ulky?=
 =?utf-8?B?dlN3OUcvaWRZdEcyaWwvdnhycDZVYTZQVFhwWkVtbCtBT3VSOXIwNS9ubnpY?=
 =?utf-8?B?ODJVL1d4SExVTUIwTHltWDN5NDhGQkZLRjA5anBZZUEzcGNkYW9VRHpjK21B?=
 =?utf-8?B?WElEUGtTRzFDZkhUSWlGdFNUWWVYWWhIcys3N1VIb1BFMVhWa2w0VTlpenV6?=
 =?utf-8?B?dXB4UElXOEdnNUJxSnhPNTZNa0I1TlpiMWRYVFJYM0hydk44RDVJc3RHQkdH?=
 =?utf-8?B?OGwrU2taMGw5R24wZHNWRzEwdHdiclVpdXRNRGNpK25PQkpqdVRFVWJxcXRR?=
 =?utf-8?B?RHdZcVNZa3IvemVQMDkvc1FyOGl3U3EwK2dJK29BV2ozUEx6ZGV5SllmRTgv?=
 =?utf-8?B?MS9QSmlYUmUyclViU1JFYkQ4ZWgzU1QxelEwRS81ZGx6alZQRTc1czlKc3Fh?=
 =?utf-8?B?ZGJqaEN5YmtDZ3pwOTlWTG1VR0RGWkhsR2RtcWhHSjRUeFVOQjI1ZkY2RGFE?=
 =?utf-8?B?TTc5L1J3TytwcVgrSVByczU0TWhEb3NkUVNBVURCb1JoR0FMU2FGMkx2VzRZ?=
 =?utf-8?B?UHhVTi9ER24rTjY4VkhuWVRBS0l0MkorbHY0UTJFeDRSK1lsUHpqVnphY1lM?=
 =?utf-8?B?b2s2NzR6QlFPZVVrd0FqNFd3TmRTVGRuS0VzR3hZS1VMb0x5ZDhGSzRrR0dt?=
 =?utf-8?B?bWJXb09YWUdVaGhPTHA0VHZpQkRqVnZ6VTVLWW5vNHQ1RTI0Y1p2Q1JnZ1BU?=
 =?utf-8?B?VmQzNkx2Sys1WHlkNjRQWWYveGZVWlYwaTBJaVp0bE1kRkFTdy9GY2FyTGZB?=
 =?utf-8?B?dWduS1EzcW1pbEN1WDFXakU4c3kwU0xhL2NheUUvb2dYWmRMQlIxdGwrTXBy?=
 =?utf-8?B?TjNYQUR0RHZqTnNaNVhReGwvQkdmRTErcWQ0aytHVHZyM0hsanhLeUJKc2VR?=
 =?utf-8?B?QTNGSFcyR1l6WEcvbEcwcjl0WGpVbkNKaFVxQWF5UzEzMG9GaVUzdzRiRDhT?=
 =?utf-8?B?UFBpY0dJajIvNm1nMm8rb2JBZ1RtUlprcFpEVkkzK2E4Ulh6Y1FGblNoTEda?=
 =?utf-8?B?QmgxZ0U3Vms5ZVMrVS9DZ2FjUjZJV3dSVi95VFZRdFg5L3hoR1RsQXg0UXRm?=
 =?utf-8?B?OEk5ZkxtTU5hVlQvcCtiT05vVDJVb1Avc3JpMnV4YlJzcHoyTTRnaHBRY3NO?=
 =?utf-8?B?dGlHd2tDZWcwbFI1SVQ3Tk5yZUYyeDNiN2hBZzBlN0JhdWlRMVhEWERYblhz?=
 =?utf-8?B?bmxXRWRCUE1IN1JvZW96RXVoakJ2dWNyNm9DaXJIZk5Sb1VWTDVsZXB3elM0?=
 =?utf-8?B?WGlIdkROZHZTaWNBY0s0anZMNGE2OXE2RFg3UVE2S1Y3TDV0M2lLVmYvdlhl?=
 =?utf-8?B?TkVVTkZDcVJDejRIbVlpVGwwcU1hM0RlbnI2ZW05TUxkMEtITDVHRkFtbEFp?=
 =?utf-8?B?WDVXZHRaYi85UldZcEpJL0hhd1RnVlFYZTZYeHlWY2F0dG43b01YdFZJK25F?=
 =?utf-8?B?aW9IekNLY3FpN1B5emprMjk1TEFwZ2pOazlsRUdTV1FBNUdwVGpFK2V6R2s5?=
 =?utf-8?B?dEhXRDA0aTF2eXB6NmMwYnhyQ1VDemJOQVhyNU1ZYVZ0UjY1N1lhbzBCYkNZ?=
 =?utf-8?B?cEkvRk1FWXJrZXM3MVZHbnZHcFl2Z2YzMGw1Zm9vdVVDYXNBcllwN1ZBbyt3?=
 =?utf-8?B?VkhINkZ1R25ELyttbWZQUStjNDNLYm5kZ2gxbkpmcHYxaE02ZUtNVU5PQ0ZP?=
 =?utf-8?B?eGxCR2dUNkxjdlg4YVNOajhEVm9rajFsSjhMS3NBQUJSckIwbEZ1UEZLYS90?=
 =?utf-8?B?aTQzV2pjcmVoVkNhTk9RaTA4elhYeC9hc2dPV0V3WnF2K1pPWWQyYUppallH?=
 =?utf-8?B?NGtMaWEyOFY3cGEvYkdFam5oem5CMEthbjhBbGZtVnVmRExzcU9neGxTVDZu?=
 =?utf-8?B?ekJYeHZBNlJOdERKSEVuMXExUk9rWXZTTS8rWVl0YlFYVUlHYWFOc1hCaVEx?=
 =?utf-8?B?T3J0VFRzdjBqTmJvUWMvcFd5eVVvTC9hWjFCRFZSWmZoQ0YvakpoTVI1TlVS?=
 =?utf-8?B?NHZhMDNzOW9qc1dBOGxpUFhXZm8wSWZLSWxDZXoyTUk2S3JvSzEwZ0c0MW15?=
 =?utf-8?B?MU41SXhHMm1Kem5yZk1YWmZsZEJPb3VHU0ZQdjFYalFtdkJCZ0wydDZlWTg0?=
 =?utf-8?Q?DS0wGXWSfQVf07Ak=3D?=
X-Exchange-RoutingPolicyChecked: bRskndIAq9w9lc3OcBQULGKcOZ5gXrTtS9nsM0kOdrhGLzuZbsADIdFZE6lCgm7sAxsSseFw/2p/poKA9v8kej0ib0CZZBgP0GhQNdqvuHZ3E585Rm5vNDyhd+3IRgI4vJh/0jSczInxuVxkNVxgqf2MAnbdiROU7p4tAJ1BvShAl27Pk3GqrESakZSzrkDjm1O7Y8VaEiYcQp+PawFMBpdAFBCeOxKyPxdZuoFdgbLmYuetGcD8NwIjc5RyVf6DohU7edgZ4XA90XU2jNwVt6wgKYHMn+8SDpF0dQtK0/1apdQv5FKDFtHyoEe11NC/2FJnk+RK/PAnQ6FlHj7F7A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 99faa391-3496-4a44-c2c3-08dee62d4f93
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6967.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 07:05:41.8634
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zjZUOKDF/fepaHYsp6EJJueKkLLFxa7uPnjcOfr/6ZtFUm4FTTYTd2zZs49TbtSSHpM3BKcGSXHQWHSG1NE9UN5VBT+BHUjT2nmWty21Yk4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR11MB9917
X-OriginatorOrg: intel.com

On 7/20/2026 8:23 AM, Uwe Kleine-König (The Capable Hub) wrote:
>   - Add a trailing comma for initializers unless the closing brace is on
>     the same line and for the list terminator;
>   - Use a single space in the list terminator;
> 
> Acked-by: Cezary Rojewski <cezary.rojewski@intel.com>

Perhaps I should have been more clear in my previous response [1] - I 
expected the sound/soc/intel/avs changes be separated and then ACK tag 
can be freely added _only_ to those (avs-driver) changes.  I do not ACK 
non-Intel patches.


[1]: 
https://lore.kernel.org/linux-sound/28c0e1ae-e2a4-43e8-8be9-c05f8cbeecdb@intel.com/

> Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
