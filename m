Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE161364EB8
	for <linux-sound@vger.kernel.org>; Wed, 13 May 2026 20:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778705215; cv=fail; b=Q42Cjy52qxh4SPsvhHXIioS/0xcq/q17JCcnaCmSpTEL7OzYgfFQgaSoOYBGA53Z0hVyuyR02RfaFV7BtYSaCGhHke34hTT9AfLdC+p393q+JyzGKtGhmQ5LU1GJs8qNPmSC4pGqafaK8n9Bc+UBkp6UivIhDl2C0ntHvmTKyBc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778705215; c=relaxed/simple;
	bh=SjzhIVhwkbh3y8OZOWSxaJfUaYXmsZLBNRFofX4XuZ4=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=qEva+JGD2F5oi845I2BIQ7bR8MUGJz9B9nd4N2cnXGYEFJYCdfiFpqICExqFxjcErtCRDtfu6zs3WllTlmlc6yWS4gHlS1gvBw+CwxZDvEx+4Rm0kRRfORwlo4scSWnLFD+epLxabynw9h0KJI6zyPYR+WDXf9+Wl8bO9QBB0fI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UPCg5JZO; arc=fail smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UPCg5JZO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778705214; x=1810241214;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=SjzhIVhwkbh3y8OZOWSxaJfUaYXmsZLBNRFofX4XuZ4=;
  b=UPCg5JZO8EOqhZlgumj+ojtiNRhPcN2BrZ/nvUf9U+y1AKeeV8WaNEzj
   sfJb8CO7oBJ7fElGU7bS4Is9tDgPBYQvDywI94l74lTK1BLUAP2Bm+0EX
   LXotdjTKL/Re/Q9C6XAodXWZqbNqrPLjCa+rGX4Jf1UZNFDDq4J9t+f0S
   L6Cjq4YUkEukL6KlUZbKk6Z1ebj7BusMe1zHC9ijiknyP6HwR4mbBO+Tu
   2ByPABt7VKmGNRf7MgziVAcJqa4+zTR1ir3CD2y7ObGd8WHy3sDa81LSr
   ftT2eHDsK8MEaDX02q9x0CfpwAOfZYgYjDl7ghrtqZWFubD1Co/6fua94
   A==;
X-CSE-ConnectionGUID: tEZhgywcTu+wsj5CN18P3g==
X-CSE-MsgGUID: 3roRRR35RxyB3/rITwEu+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="79358752"
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="79358752"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 13:46:54 -0700
X-CSE-ConnectionGUID: nRcj29irSEClGvI3MTqOLA==
X-CSE-MsgGUID: /vnjD3vCQ6m2YJYYLSYdPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="237212530"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 13:46:54 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 13 May 2026 13:46:52 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 13 May 2026 13:46:52 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.22) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 13 May 2026 13:46:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LaY1lXxko0OBLo8Y94EUTIE/755++bm6xYB/DxWzy3z4ohz/8+fmgMAgjWsRYerCSVoKgocMmc2TIWWxeSYuuVmNl+Oj/S0stOMjI80OcTOiXgdazVDORINvgsqeXybkceNwtUGZa8N9oZ3IeoWIxbSdtG0S1Z/pzW4CseNDWQ476ZOC6MFfYIVDTXVY4bLOcSL8/omAv6DOFcCIJdJAwM5TJf3/ebPqWE9VhBd/NJbzRS0ko5rN5SFaQWefInkfgXMbTaLgLBkS0WfeOH+Hxkbp/KMGnuWI4wGm1MRmVr6XVKdeHXdJK76cP/2we73cIcUImO4QszKmaz8ZUjsw4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sxpIcifAi/YcVqQIB/OaLbRclD2lKHN7GrHMKlfRcdE=;
 b=BhRMO2hqFUy1jgQIbhL4TmZBP1G7MButORTnAzIN0fzPhYYTc0JfqsMWUq4VW4RWd4n2G6ECsYNdTXd3XUfgU301SgOoMe2MZ3RxW2zWk8v9azyCi/exTAzdFf3qLV+6hqL1bdTsOLzufxr4FTk4hnMdkjtvbPfE6VfhbFXqZndufC1W8/LxsotMN/VdpsA2Eh5oONRcdVYWWvSC77vcRLGMngn4Xcu4soKlDFEE7zJNBhiviwTyZiC6dE9OesojR8gKZaBpqg/YXMt8ePPhNF/HJQAWBGN9lUddBCe2k6KsIG4zxK3SI0CsQtw2SnjKXK3wD4RK9ZWMCgQ87SqEQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6967.namprd11.prod.outlook.com (2603:10b6:806:2bb::15)
 by DM4PR11MB7399.namprd11.prod.outlook.com (2603:10b6:8:101::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 20:46:49 +0000
Received: from SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4]) by SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4%4]) with mapi id 15.20.9891.008; Wed, 13 May 2026
 20:46:49 +0000
Message-ID: <a9542a23-7a9d-481a-b93e-04f1961e9647@intel.com>
Date: Wed, 13 May 2026 22:46:44 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] ASoC: soc-core: handle card->list in
 snd_soc_unbind_card()
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
CC: <linux-sound@vger.kernel.org>, Mark Brown <broonie@kernel.org>
References: <87zf245bc3.wl-kuninori.morimoto.gx@renesas.com>
 <87wlx85bb3.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: "Rojewski, Cezary" <cezary.rojewski@intel.com>
In-Reply-To: <87wlx85bb3.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIZP296CA0005.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:2a1::13) To SA1PR11MB6967.namprd11.prod.outlook.com
 (2603:10b6:806:2bb::15)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6967:EE_|DM4PR11MB7399:EE_
X-MS-Office365-Filtering-Correlation-Id: a01c335e-190b-482c-154f-08deb130c125
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|18002099003|22082099003|56012099003|11063799003|4143699003;
X-Microsoft-Antispam-Message-Info: HPMzEofLi66ER6d+NJIxaYqqCTDLxTyw4NphtXY+lUgNoVJm2jh6wqaLWVURse2P5FZ+u4sjB1HzWFo6COrnGTb7oWAN3g0FhzBJKP3Bl8uJVT1BuVsdcXnVDHkt+70QdvulwtascxMbJU9/52QMThmhdjGhLjaFFBEQcyy73YGGcHuEvOGH6eP+mSxuzb/qxtfHinUdnppJeW1AYvwm5eAOAcOoDrkEMUHMWCbiPsb0ICpbVgQz2tIu0P0x0/P9jyujqMvP5Dns90g3LO6RZ8P2SYBSN57M5FeAdvtb3c9L1cGHtr+wYDK2bBfsieCsbl1GDisMBl8Z0s1uI6rFPA8vf2z1IjfypQRDK7dG7gm6BAcODfyyx/zerRPeUJPYmWij4oSXeL853ujjAV3aDrduQp8yRluP/2VzI6XaI8RAfCKR3WuA5MP+KaCaDr1s9l60ZeRzdVFFpMQhLOIFWNM51Y5qfi2ICgyIsbFJtSWBW4S5eqxJL02FXDmhZrZBUN3JuxBBP1vzBNK5qBgE2RTwFc2Y8DP/pXR/MNYdxgP4DfrQ1gx8Vyj/pphNwlJO1qpjtXdH8/q0YNJu5e9sCwudL8xuvuwt7rkaAC2AL7R1JYqCvhgdmZ1cjLpp8vF6z79xz1cz5YcQ9SwWpHQdTcqHLbxRN3ixytul1wA+Z3I0kpDTktKwtIf6KdwoW8rA
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB6967.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(22082099003)(56012099003)(11063799003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NTNNNGJVOU1NWEt6Z040UUN1VFBlQ2crMlQ2NkkxMG5ta1hLMWZ4TjE1ekln?=
 =?utf-8?B?TFlBakZOREk5ZVJNM1NkZTNDeG53dTl2cE91Vmd2TmtOM1dXaWkzdnBaQnJ0?=
 =?utf-8?B?UnNab2k5RHU1cjNsek1oWUlEVEk0dXEyWjlTUVFRNld6WWtaR0Vzd0tYcURK?=
 =?utf-8?B?VXlXaVBma1NyOVhiY1VTZHE4Q1lMUFVEQzVhZkFvVEoxK01TOXVtSmxhemww?=
 =?utf-8?B?SGdOL01rcHNHaU11dXovbDVSR2Y0Q21OcDRiTnk2REtSTEN6OEcvZThlOEtv?=
 =?utf-8?B?aHRjcmVOZ1R3RTNVNE1JS0ZocTVEN1VCU3NQRWlKVWkzK0ZXTFFrSkx5Mmph?=
 =?utf-8?B?Mm9KYi9SQjhMTitZT25FdFI0MUttRTVFKzVIVEp3Q1EyL0tyS0ZQbHVicU9J?=
 =?utf-8?B?ZGQrMUpqV2RpakRmK1piTGF2U01QTEdXME96a0p2Y09CR0Zod0I5SmQ2TnI3?=
 =?utf-8?B?MjFsQkVuL1NPU3BPenh6YUVHY25nYWllMndIdHU4YlBrTGFMVFUvQzZzSXJn?=
 =?utf-8?B?Tk1ZdENJZXBEVzBTUzNkQ1dGVzZhY3gwMFBZaHNPT0tsOXVBdkRHTWdCMkRE?=
 =?utf-8?B?N3pNNjVwWmdOcUU4NkJEYVB1S3JlcXNIM253amJGUllvbmt4WGptaG9qaFBv?=
 =?utf-8?B?ZFloZG1sOGZreW9raS9UZzN6MUZteHc1QU5hWFRxc1Z1cEUrTDNnL0U0RFl4?=
 =?utf-8?B?M1dIekFlQ21DLzRnMFIyZE5pa3I2UW1SS0JOSGV5VlVYWGFxNFZ0aVQwUWlK?=
 =?utf-8?B?NWhnOENJemxUbjVSbStmWmt4ZU5jMS85L1NvNzNpYlB6ZXE1cjN1NXpYY2Fv?=
 =?utf-8?B?dmZLK2taeWJHRmw1RDc5bzhRYkRIelNMQWdGbThZZllydmU3MFozNXh6bzBv?=
 =?utf-8?B?eHRxUHd2RSsyR2NhV3Baeit2T1dmS1lVN1BvaFFOZkVlVlJXb3RaQkRsYm55?=
 =?utf-8?B?anlBcmhJWi9BaEpoSDhkUi9MRU9TODJMS0NKUjBZY2kzOHV6dmtGYXBvSk93?=
 =?utf-8?B?dmg2Qjd4OTgxZDZzU2ppREIrem1LUWMzcC8xRHpQTmVQbmo3M0lSd28rVmxQ?=
 =?utf-8?B?eHB3VDhWTVpramJMSFl0c2puMW4ranlvd2R4MHhrVGdNNUxwY1BXS2t0TW4v?=
 =?utf-8?B?aDZUdmhCVzZPeC9ibjlnR0QvZUg5REdYRm13MjFtTmxWOG8rQldDZXVUTVdW?=
 =?utf-8?B?TWRZTlNLUkFnUWwzQmsyR2crTG9yQkFEQXgvT0lNTEVOQ1VJSnRUZkRlbllz?=
 =?utf-8?B?em9zMVpWd2ErV0psNXJiTzRKZnlOcU1jNVZoT1pmQlBCOWxXSnMwSEc5cG53?=
 =?utf-8?B?TWNRRXE2bGR3QmdYZ2RYaGs1NEEwYUZqbUsraTUwWGZGVEV2c3lacGNwU3Rj?=
 =?utf-8?B?T1VMa1c3L1FLbjR1bUtSUjZkeVh0NmNGY1krRWNqc1VBcmdPSjJkSk1Ick9L?=
 =?utf-8?B?Unc2bDRaWitqc1czQ2ppT0tGMGRCY0ZrUEJ2ajJvczJMZ01BcnlyWVc5S0Z5?=
 =?utf-8?B?azVERzYvdnpSWFJhaGozYlVERm1SVk9YbWp5ZVpTOHFOeWhDVFRadzk5VmFN?=
 =?utf-8?B?MzZON0o5OEJ4Ui9EOG5pOEJaa0c4VFJrMmlNclkwbG0zclNXQU95dWd4cDlN?=
 =?utf-8?B?Nm85ZFJxYk8wRFQwUFRvMjNuOGhjYkdvcW51SUorV1d0T3ZxRmpDdUpPLzBI?=
 =?utf-8?B?UmkwSCtETzhHVVVnWjRLZ1p6MWVBbFIva3pxNmp5alRqTXN4bHNFT1FiTHF2?=
 =?utf-8?B?YTUvNkNpeEhMMTBzNkttZ0RnM2JHNkFPZmJUYTMxbVNLdm5uMkdOeWdQWHdS?=
 =?utf-8?B?cnlqNitlLzJkVjBaQkEwM3JFeW5yNUVYQWZZMGxjSnhOdnJnOEZHWkxlcVRo?=
 =?utf-8?B?eWtYMzIyZmtFRm10RWNGTnA0N2VYUXVqNThJK3d4RllOT1FWb252MzRuZUlh?=
 =?utf-8?B?czFxYmQyak5tdVpsaC9PS3lMRUtvdGRDUnZIc3V1Y0ZIVGVuRzVLcEtkZnQx?=
 =?utf-8?B?S1hnRjJLS1Y1NnhMamMwTWNMVW5MRXdZdGlxbGNKME9nNC9NTklMcjZNNWdn?=
 =?utf-8?B?YlA3RVpXL1hreTA5dEhZZmI1ZTFMOXdLY0xMd3dvQmhFck40SzJBUFlyVEdz?=
 =?utf-8?B?RHpaL2NPM0VRS3NXUkNvWHlOaUxnUHNJU05kNjdOMDRUM1hKU1l6akl4THQ1?=
 =?utf-8?B?cDdKT0FiMFRLaENHWnB4bkFPeEJpUjBTOUNBY2JXWW83Mk5lUGMwc3d0dWtj?=
 =?utf-8?B?L3lvNXJORC9VbC9WL1N6S2xzUHZ3eTR3RFhQZW1GRHc3ZCtINjIzdXJYVWY5?=
 =?utf-8?B?cGd1Y29LVzBoN2ptWGN0R2lnV08ybzdxbTdyUmc4WmxpNHFYd2dpMERwaHp0?=
 =?utf-8?Q?uhCozge88L/a/Wh8=3D?=
X-Exchange-RoutingPolicyChecked: b7eafL/tBkZPlZhUXpzG/Ib9MV37xygI5QPS2nkdhkp58V8QwdyGBG2Zo22OMZUZEbADP4t8QXg/m6wGJ7EaCadGGVqVGmm5U9RH2MiGsYKg1QpICBSU64Me7id3VO/7qReww97GJjpYm3eWrsnemuaf8qn2wuseGzJmAs52+ido7XZRDH91I5S1n5r/zB0Og3Jo0Oit9TBupQfA04LEhz0ZuM05LgAMJptX1/kd6YmsieFFRyxI4BbgTpP4mjiinzhqoHVWT49Bjqg0GcgUGb9dfrux0VwsFx49Oys16EBxGV7CwO4+EqAuSUYTGXIbO5X3yw9LKQa5gaeTTsBH0A==
X-MS-Exchange-CrossTenant-Network-Message-Id: a01c335e-190b-482c-154f-08deb130c125
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6967.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 20:46:49.3125
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: amDz4cnSoqaoc1Fkf1G5pj4FaBcG+rEIfOM4kbEMYtJo2fOMZkdN/TL7DblvVyYwHO+Ke5CpuaakzWQwjGCw2h8JqGuBX263a7aEoNWEtrM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7399
X-OriginatorOrg: intel.com

On 5/13/2026 3:48 AM, Kuninori Morimoto wrote:
> snd_soc_bind_card()   is handling card->list inside, but
> snd_soc_unbind_card() is handling it in outside.
> Let's handle it inside.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>   sound/soc/soc-core.c | 19 ++++++++++---------
>   1 file changed, 10 insertions(+), 9 deletions(-)
> 
> diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
> index ae8467d88978e..8b2269ba67c3a 100644
> --- a/sound/soc/soc-core.c
> +++ b/sound/soc/soc-core.c
> @@ -1990,12 +1990,18 @@ static void soc_cleanup_card_resources(struct snd_soc_card *card)
>   	}
>   }
>   
> -static void snd_soc_unbind_card(struct snd_soc_card *card)
> +static void snd_soc_unbind_card(struct snd_soc_card *card, bool add_to_list)
>   {
>   	if (snd_soc_card_is_instantiated(card)) {
>   		card->instantiated = false;
>   		soc_cleanup_card_resources(card);
> +
> +		if (add_to_list)
> +			list_add(&card->list, &unbind_card_list);

I see benefit in this.

>   	}
> +
> +	if (!add_to_list)
> +		list_del(&card->list);

But not this.

Moving card-behavior code from component-related function to 
card-related one seems intuitive.  However, snd_soc_unregister_card() is 
already card-lated function.  I'd keep the list_del() there and avoid 
the second if-statement.

>   }
>   
>   static int snd_soc_bind_card(struct snd_soc_card *card)
> @@ -2439,8 +2445,7 @@ void snd_soc_unregister_card(struct snd_soc_card *card)
>   {
>   	guard(mutex)(&client_mutex);
>   
> -	snd_soc_unbind_card(card);
> -	list_del(&card->list);
> +	snd_soc_unbind_card(card, false);
>   
>   	dev_dbg(card->dev, "ASoC: Unregistered card '%s'\n", card->name);
>   }
> @@ -2667,12 +2672,8 @@ static void snd_soc_del_component_unlocked(struct snd_soc_component *component)
>   
>   	snd_soc_unregister_dais(component);
>   
> -	if (card) {
> -		instantiated = card->instantiated;
> -		snd_soc_unbind_card(card);
> -		if (instantiated)
> -			list_add(&card->list, &unbind_card_list);
> -	}
> +	if (card)
> +		snd_soc_unbind_card(card, true);
>   
>   	list_del(&component->list);
>   }

