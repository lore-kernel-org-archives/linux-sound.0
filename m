Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F42E241139
	for <linux-sound@vger.kernel.org>; Wed,  4 Mar 2026 16:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772640931; cv=fail; b=sp3OOVexxpo7Qf4rCFprQKry/m0XrtRaeKB6baEsDTgi6qbLEAgWR2f4+lG44W0QurTFWML8BebItd7qlzKMaDW/jZVcmprKR7ADxPJ1+q6HTGy0IQPABW69sP2fVZrMPzEYAN3TOmSscEpMKUmTWhGn0txnGTL9KDiSf8uunCU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772640931; c=relaxed/simple;
	bh=bFoufMN34NrWCFOGZEtyoRl3mGLQVbz5gLFfINFxNg0=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ZrseTuayw81lob9ROsdT01jCJBBuo0ViYLJ3lj+0fmljJeb1qlPGbeiHBTWGxQIjGPTRcmN0cqAj3vISLS/POhXtc1D1fIphwAUcOCe4bHcjVSYzY1mlTl8Jh7gfE3Bsgvwqw7aIC5iYWOSwprKItKCYzdUW7EZEhlq7eChypQM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CFdwqBWR; arc=fail smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CFdwqBWR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772640930; x=1804176930;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=bFoufMN34NrWCFOGZEtyoRl3mGLQVbz5gLFfINFxNg0=;
  b=CFdwqBWRZF6JWaM0WE8oR+gbCk0aU3LySu8l5CPnSdd47rfPwTQ+qow6
   hZE/wItBRMWGEqzEi/FNAsgJaeojWgUbVjhVto17a6E+XY/R93o2wJ70x
   GNKUK/3avekEc4An9xaRRllC++C4myn0bpYN+L6Mdg6i7o6hMtDhyrPR0
   KJ4whRTp+I8AS7DP9v5oOPu3CFyl/dSEnw2vfoGOlBXQireVusCrcRjrA
   C1o42g5lVxPsA35hS7q26r7gCs2E3e00ebGZwtoyNGfrX/Rz9ROIhmigq
   H7DfTbHoGcE0AVlr7EBtuxmK+hwNcs3MSlDQivD/m8OdLBw8/DHOaK5Kk
   A==;
X-CSE-ConnectionGUID: oxzJrPvVRziD5hPX68Q7Vw==
X-CSE-MsgGUID: ua8bWyZfS12Nd+ilI7Snlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="72733968"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="72733968"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 08:15:30 -0800
X-CSE-ConnectionGUID: fu0VF/bmQPusZZ9icsJAAw==
X-CSE-MsgGUID: OKuc3agCS8aZITfb5FzldA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="218523960"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 08:15:29 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 4 Mar 2026 08:15:28 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 4 Mar 2026 08:15:28 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.26) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 4 Mar 2026 08:15:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m7kZvtHKsPjVX9ySKUEgJV5UmIQBkcaZwQb9mDRA4zjlNjzP43qOuVX4m7B3bU5LWzLP1rtbUHr0rXnSGjc04+09wM5uEuGCC3xeI4kaMiWeVv/t8WQs6A/JU5CbPgNFzxjOOtfwa/ZqBibnT3E3RUPLZXbTQoYE0vRXFr09XaOng7iHGWvKLu3z4TSmDRk8qraFfhACU6Nj6njR4acZwD46ZyZLl30oF1rVmO7qgWwcZnyYC29EIJ22HkmVWKvI3cQoIQFc8F5Nt34kMrLKJYNEFB6KqJLu+daSFhUZC5d5N8UjZwah/4A/FaiKDMIwaSVa8pmjljbKndK5tdXZ4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=34VHWOcYxW0lJhkoqrTq8T6R+1oYYTRe2c2tbJNGbJ8=;
 b=EvVM+oGWamQEmLZN8eoFzv9XT4Mu+FKtScCw4QGch91FHXiGhoQvRyyPuXDw2ZRS0lmTI9TeY1hCa4WDhebMNmmeIf2ks2k7iusdadAIowWwofCwYr1XzRNXvB1EEd+YfBTd9dPVynFPpcTAsACTBALLmcB2Au7cHmUh7h/KQHca6HWZ7uqc2Pun9eK5TcNXmelsiwww/1qQqRbODhkQWHeyxoRCEonrjW4/UjftTtOQzEeGbrdW7pf9P52LHl535otYU0lh0vz2Z2vVAkHD1rgyGoO0erBqNW0KexkoFx6l6OsGM6/vaisT8lpXxrIHZgovncY9JPcUcuMmzVeYpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8283.namprd11.prod.outlook.com (2603:10b6:806:26c::16)
 by IA0PR11MB7694.namprd11.prod.outlook.com (2603:10b6:208:409::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 16:15:26 +0000
Received: from SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::d18f:6b38:584a:214]) by SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::d18f:6b38:584a:214%6]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 16:15:25 +0000
Message-ID: <678371c4-257d-43dc-8118-cbadb50527a1@intel.com>
Date: Wed, 4 Mar 2026 17:15:20 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2][need test] ASoC: core: cleanup card rebinding
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
CC: <linux-sound@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
	=?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
	<amadeuszx.slawinski@linux.intel.com>, =?UTF-8?B?QW1hZGV1c3ogU8WCYXdpxYRz?=
 =?UTF-8?Q?ki?= <amade@asmblr.net>
References: <87y0k8p6ds.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <87y0k8p6ds.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0019.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::21) To SN7PR11MB8283.namprd11.prod.outlook.com
 (2603:10b6:806:26c::16)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8283:EE_|IA0PR11MB7694:EE_
X-MS-Office365-Filtering-Correlation-Id: 504bc82b-345d-4f4d-fe86-08de7a093dff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: jgf5GPglnVh+1O9BjKrJQ83j5zEcrRbkKt/BoNjl9Y5hyPaGgU1iQSW3kE1s4vhp9BJs8ifkbBmCO6r3ftT31lCLerTurJ/8u/RjjYZ2otG4qNRidNjZoQ5wWkTi1n9o7LLrnltfO/PcsFuNrPGfoxsNfVpFPC4soZ/t0ZhX4U1Dm3DhwDnnnlSLS0Ag1ekZuRamhgjKi0BjbRhxmkdvSQhFseTCk+op+XNzuDZTgdU9biUBUA3H023aDk+ctvyBroZCB9Ede+6W6ZbXNWjB51Dbeyaw5HeAXWtIeXFUEyhyaYTNCtpMrOtEz3q6zJy0kCb6TNWAtumVRK6V0lICJYxU74eYZCwsqHuVwR2hrfRtwz8CCrvQt3MHThfl9sAsH0h3u4RPkqtXLBPCXGU+NWpw1E3X42zpTJHv0qOL2kvhn2f5mIbLkbT2dtrnxkUvQnHZOYHDLdHVErDv6MZ8l99D0IRtuWSCx4Z6mZXSEnC2ukFVAu64nlJPVmpmAeAiziSEUQwM2yX5eKH5P+YE7oRTlzgzjr3i6Pgfc/igEQDy6mWEERy/OAYPfAAtdV61Nty54lMHBhuvJFPtjfmML4vc/aT1CRINGjBEtzxHiPEH2ofd2W0b0w11CRwu5uAXXYceQ+/XWQ+jiWx6WMv7f1PVQQnPQs95rwHivFI76F2dNWw+JzWLp75fj89VvZ7/nMiZy6dR4UPWKIHRQJ2C04qsaewCmVaKZD9pNUQhZP8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB8283.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TXFGUC9SLzRobUVqbmVoVUVZaU8yN003YUsyVlR2dVdTSWdWbllINTNWdHdo?=
 =?utf-8?B?bnV3UlJlMXJmd0JneFBNalBSWlB5WWd6aU1BRnRrT0FUZG5senA5dERYRkl5?=
 =?utf-8?B?eDZXVllxS293d1VBZFI2MGp3MGI4aTFvL0RHdGxva1IxTVpQZC8wWit3bGZ2?=
 =?utf-8?B?cFhNbE1IdHZJdWtQaGNtUDh6emNUN2g0TFRjdytKQ2pSOXkvNUQ0aUpjMVcz?=
 =?utf-8?B?Qm5UUHJUL0pOT0pFbTRnQjhhMlJNa3dxQzdVQzZjbEtpMW44ZVZEVXZvMVNh?=
 =?utf-8?B?L1FweXVLY0wydGxCaXU5RGNLYjlKL1FkT1VocXpJS3BLWEV5N0dITFpvSkd6?=
 =?utf-8?B?bjN2K2M5TG15VE5palYvYnpmTXh4cjZCVDdib3FmK2xhcWVaVi94YnZMb1pq?=
 =?utf-8?B?RWFSTmtMcCtrY3cza1RWUThKMTlEbENMaUZ1eTRtTndOQ3Z1dWRDcFZkcGxv?=
 =?utf-8?B?aTU5YXpoT2ZGbzI5Zlo0T2MzL3pHbXk3S3VMNGdXQ1dhQVM5dUtzVU5IT0hH?=
 =?utf-8?B?UDNTSGZFS1JsSU94RFduNE5hWlNqaVByaXRnNlNjaWZURG5oalZtNS9XaUpN?=
 =?utf-8?B?UHpIOHM2YmdST0MrNnhRdUxEdjNuOWNWVGh1eW9qZksvSko4eFVVay9zQ3ZS?=
 =?utf-8?B?aGhCdHZnZ2x0QlVLS0tGdXhyTEF1M25Ub0FCaG4ybktjUEMxeVV6Wm1xek1W?=
 =?utf-8?B?S2ZDVGNNaU5uMGQyTy84NTFRVjFhOUJVbmk1bWJjT2ZCYUVLQ1NQaUVOUVM3?=
 =?utf-8?B?TnNVZXU5Y3ROemlUVTVzNlhkODVzek14Y2c3S3p6a0svU2w3MkNrV09CVmk1?=
 =?utf-8?B?U2xrL05xYyt1azlsVzl3cGEvK0NQcWpURHE0cTlSWVhtNVBtakxIYlNvOElx?=
 =?utf-8?B?cTR2S3o5WXRadDBTNi83MFJWR2NPVTRFdHVHenF2M20rbkU2UTB2alBTV0Vi?=
 =?utf-8?B?Y3RySDVIUjlCbGtNRjJEMjh4UWsxNDdCRVZvNW5ra1FlMTl1d0xGQ2N3S3Vx?=
 =?utf-8?B?NWFxanFUSVhNdnNIajEyZjIxMU9xb29UVkFaZGN2WlQ3SUFzZUlTWm1vNHYv?=
 =?utf-8?B?c21xQzh1V3VIb2NBVFFDN1IxTXhpSS9rdTdIYTFLK0JybENGb1pQSHRNN2Fj?=
 =?utf-8?B?Qlg0MG1NdU55SGhuOGMxdk16bEhlbUVxdHlpWWNkZDFNMXhlU203U2dGNkxL?=
 =?utf-8?B?UEhENUtNUFNsYXlveVN3ZGxkNWhkZThhSlYyZWJqdHlVYU51UGlzYXFYNVdK?=
 =?utf-8?B?MVF6dGJ5TnpyTTVBSDJBUGxMY3c3dHh5RUZCRFZzazk4eE1FUm1XcndVejBj?=
 =?utf-8?B?eTByVWJCUGh2TUkzOFRIOENFSDRxdWtoZFZHZGd5R0h3RUw3TVFJK0tHODUy?=
 =?utf-8?B?Ni9wVkdhb2R4OFI0bHJpOENJTEdnVGk3OHVQOTdiUmlTdytKU3YwVUFQS1Rl?=
 =?utf-8?B?VHltUHA1dmZPZkk0S1RzUVdlNUF1VlZvMGZsMkRUekFtSFpISzJqanVIa0ow?=
 =?utf-8?B?K1VBVnUyaExIZWNJMExvYUE1b3Jhb0p1L2dIYm5yd3lkUTdTYlF5MjdLQTlF?=
 =?utf-8?B?UGdqRGVOM1Q2UkNnYldsU0NGcDNxOTZmd2hSckpwOUtGcGFwRXdMeC9ua1VV?=
 =?utf-8?B?eURyZ096M3Y0MFRSaGw2aVUxbUhRbzE4ZGMwcmMzR09uVHhrOHdLY1VlOUFH?=
 =?utf-8?B?K1V6aWlTQzBaVXJqeStTQzRrVlVCYzh5b2Y2MXN5TW5ZMWQ3dHRRQnNJeUtR?=
 =?utf-8?B?TkRia09zaGZXZDRwb3h2ZWk4eGIyUndPNzR3SUVxdjBxK1lEbllQQ0RYTjNx?=
 =?utf-8?B?clFiTmhORk5DZUszMzZtMGRVZGxPdHZ2K245YXNjQlZETVhNQVpNYnNDZ1dT?=
 =?utf-8?B?cVNCVGs1NzlZNXNYNjE1cngyb1ZpL2dCWEYrbHUyZDRSWG5wbjhqYi95MkRK?=
 =?utf-8?B?Z3BHWUpIR0oxMVJwQ2FUOGN5ZjliUW1lY1BsOWNtSThraFR1eDhNelFuTHdV?=
 =?utf-8?B?Wnh4eXlMWnQzQThSWW5DZWZDOVRPaUVtK1FWQityaDhieGo0Si81Q1hjSTBl?=
 =?utf-8?B?S0x1L2JHK1hzQjNzb1AzRERHaU4vTEcyWkk5cmhOdFZPSFlYRFBDMElXKzRq?=
 =?utf-8?B?MVZ3RC83VXZUcDlmMytidi9YMHp2WGhpL0trcmdtMGFNRytyeG9nMnpMRnJz?=
 =?utf-8?B?UG4zcVVKNis4M0d6Z244NTlvb2lvcUlEdTl0MTVtbTJuS21ReDVZcElWSi93?=
 =?utf-8?B?U1hqQUFYaU9SaCtCcllFbW9FMVZFVXB1REJpWU5tR1VucmtDR0EzcTBmQi8r?=
 =?utf-8?B?Y3dsVmxWWlVxNklTSmpZMkQ2blBtYXVPN1RBOTZmc1pmUXJmUlk0bnU1VUxj?=
 =?utf-8?Q?d7YapCAxLjBR0Cqo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 504bc82b-345d-4f4d-fe86-08de7a093dff
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8283.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 16:15:25.4476
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 67Th9VLQIaOx2O0oQx3KCXvkFzQkYj84yjDG/U7lsM6AZ2EzBPfgSbtybhtBmMbwSFOfbA9q04jINOmVuiAY+m+OIcbBY6t2g6GLJqh9RZ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7694
X-OriginatorOrg: intel.com

On 2026-03-04 5:26 AM, Kuninori Morimoto wrote:
> commit a3375522bb5e2 ("ASoC: core: Complete support for card rebinding")
> supports complete card rebinding, but it uses unbalanced pair functions
> It added devm_snd_soc_bind_card() (= bind), but its inverse function is
> snd_soc_unregister_card() (= unregister), and it adds new
> devm_snd_soc_register_deferrable_card() (= register), but it doesn't have
> inverse function (= merged with above inverse of bind function).
> 
> Thus, it is difficult to understand, and difficult to cleanup soc-core.c.
> This patch cleanup the rebinding code.
> 
> The rebind method to connecting to "unbind_card_list" is merged into
> snd_soc_{bind/unbind}_card() which are used from all drivers.
> This means no need to use special bind function
> (= devm_snd_soc_register_deferrable_card()) to use complete card rebinding.
> 
> When it bind the card, and if it failed with -EPROBE_DEFER, the card was
> added into unbind_card_list (= snd_soc_bind_card()).
> 
> When it unbind the card, and if it it needs to be reused, the card was
> added into unbind_card_list. If not reused, the card will be just removed.
> (= snd_soc_unbind_card())
> 
> Because snd_soc_card will be capsuled soon, separated from mutex_lock()
> (= client_mutex is soc-core local).
> 
> It renames function name. Will be moved to soc-card.c soon.
> 	snd_soc_bind_card()	-> soc_card_bind()
> 	snd_soc_unbind_card()	-> soc_card_unbind()
> 
> All Card user will use complete card rebinding by this patch.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
> This patch needs Tested-by from
> 	Cezary Rojewski <cezary.rojewski@intel.com>
> 	Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>,

Thank you for the patch. Letting you know that I've seen the message but 
cannot test and provide the feedback immediately. The change isn't a 
simple one and I'm don't want to ACK/NACK it blindly. Once I finish my 
existing tasks (couple of days), I'll integrate it into our image and 
run the cycle.

Kind regards,
Czarek
