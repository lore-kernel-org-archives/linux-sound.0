Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BCF372600
	for <linux-sound@vger.kernel.org>; Mon, 14 Jul 2025 08:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752482496; cv=fail; b=LbJUD2ZZaQWYZpuPWgSm902kb5nRuq9mKcz1uPokuzWtMur5KhBO3SbLSUjfylHnMnnpgfIp8VQUD9ReHf8RbmDwv52IQXtBWGhEL0Hdx/rQhUPM+IUp2D8FV28AHw8AvnA7vqltMw6C1itMbf5WNbcgx+xSTwCZOdoSLB/tezg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752482496; c=relaxed/simple;
	bh=CEBpWYzj7WH/Q9nLrpJfqhy/1s6IrPLGr2jlddJZVWg=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=aUf3OmRziqjdHk92EQzfqyV7LidCrrvVE7w+4F9R31LD61Ad9CPF+lfWbG0UWfHL/SA6tfNv3KPAOBW8AIUDWjETnWL8lD9qYoUVM/HUgdyE+5VVBcaPJ87g6Kh7vwa5ob6Ocp3/eCNDT1czmNUWvzdynWyzmZ3Bu7WeVQfp3vI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DQ3rlkz/; arc=fail smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DQ3rlkz/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752482495; x=1784018495;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=CEBpWYzj7WH/Q9nLrpJfqhy/1s6IrPLGr2jlddJZVWg=;
  b=DQ3rlkz/BXEWKQyIzGcNPFGG8cq5JDh4pJ//M15Zzs/VSBdvzbz/gSaA
   YNNssN+Xi6dPJe7i6unxFBnhQib/QMkxoJx+CggaacZ4BqhHtALf3D64J
   t7lizbbzo+x2mnuk5euZycKIGXMQ4MAoji6+MHREjve65vThFHq5YbHuu
   208XARZ5tpMbGZgiAz1ocd+Hy5+ZiwGOiNpa8H0XxPUVaPnnNWcy4l89E
   eCSeTklk/zQ9RAvINfaPozdwTmkeAhoMeJ6xzsyiRpM3rWjUe9HNdVI+J
   pZ51Kd/Xy/fo8sRahEJawcVmv7wIgs46woafTfYnRJ8dbupC1uYBnQAHf
   Q==;
X-CSE-ConnectionGUID: 5hFgWGonT/So67CX62MW0A==
X-CSE-MsgGUID: kt+0UsntQt+LbwicqY+2XQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="58435192"
X-IronPort-AV: E=Sophos;i="6.16,310,1744095600"; 
   d="scan'208";a="58435192"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2025 01:41:34 -0700
X-CSE-ConnectionGUID: 7YjF/ADMSLOZmqfCIYqoFA==
X-CSE-MsgGUID: fSt3cvE7Qamk9YPqqTSkLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,310,1744095600"; 
   d="scan'208";a="156298029"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2025 01:41:34 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 14 Jul 2025 01:41:33 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 14 Jul 2025 01:41:33 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.61) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 14 Jul 2025 01:41:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ALiJZSuqcyPTlbQkAk5/s4O8OM4hOYOmcEzZGw7X/AO8kAk8kW4xw8n6MdWlGVMqAeIMtlTxSeKB+xGWG/oI0EeE5ft9nAdTSBlFBHdIzKzPepPaEMZ2inTOvUKPaOxClRQIIcHLdS046f5/U2cHxOqpFe8jjZksJV9/cpggMZpQ12xk/Zc1w5M6ijFJCY/hWZs6Oe57FXoSUk/tsYWi6jyQ7MQXD4y7QL1UeK/v29djl7R2Tn9LFjwcsjdbGfTswfvz8w3elSBmI0KnTayic0db88YrMgsw0+bAkGZoizun5l2x6y6BA04vazMpKtAFW8vSBC1NdmgjKS7kgrn1AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7n1JcLEt/7vfQVBpiYHPwkRqfWS3vnOQf77/SLYOOm0=;
 b=dRJNGSkdsXvV597bQdo7Lsa7X8MCRdJvFB5mfD5+2Yz0aoW9jxa7RqXeQJXH+b1kqG8oDViXIbKTbEgHLTGEBVY/1/HVGamkpVPNvDHDI6Ucs242J8pzg8ry8x5WSE7jDCCkgybBAdMQAqMCpWJBfwjbsRUfzYpQ/VThqeZ3xyl7CCiUM/zmSiiTOt0/sJY5K706hXWf3J/Zrye3D/HjflQcCZfj9XkeUJ5cadvZtqXYlA78EW3dBHxNzICOysJX7alOBMcrD5tWneDdq/N8jXy9tcZn07QmD7GlcZdXS3ptNGg2KWiwfYBVTuDi5w0MeDy2l7Mm5XdfkPnDnkN5rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8283.namprd11.prod.outlook.com (2603:10b6:806:26c::16)
 by PH7PR11MB7097.namprd11.prod.outlook.com (2603:10b6:510:20c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Mon, 14 Jul
 2025 08:41:29 +0000
Received: from SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::3:e0a:87af:d4b6]) by SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::3:e0a:87af:d4b6%6]) with mapi id 15.20.8835.027; Mon, 14 Jul 2025
 08:41:29 +0000
Message-ID: <86d2025e-0b94-43c9-b242-a6013998d72e@intel.com>
Date: Mon, 14 Jul 2025 10:41:01 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/27] ALSA: hda: Move HD-audio core stuff into
 sound/hda/core
To: Takashi Iwai <tiwai@suse.de>, <linux-sound@vger.kernel.org>
CC: Richard Fitzgerald <rf@opensource.cirrus.com>, Kailang
	<kailang@realtek.com>, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	=?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
	<amadeuszx.slawinski@linux.intel.com>, <patches@opensource.cirrus.com>,
	Baojun Xu <baojun.xu@ti.com>, bo liu <bo.liu@senarytech.com>
References: <20250709160434.1859-1-tiwai@suse.de>
 <20250709160434.1859-3-tiwai@suse.de>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20250709160434.1859-3-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR09CA0157.eurprd09.prod.outlook.com
 (2603:10a6:800:120::11) To SN7PR11MB8283.namprd11.prod.outlook.com
 (2603:10b6:806:26c::16)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8283:EE_|PH7PR11MB7097:EE_
X-MS-Office365-Filtering-Correlation-Id: e81f9078-2acf-4300-d672-08ddc2b23a00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UXh6UGh2Z0VYb3d4eVNaWHRMZk1oOTlPWHBNTUJVTlRWdjEvUmlTU2JJeU5p?=
 =?utf-8?B?bkVNMHA3Rm40WGhMYzkySDZwd3E0WXMrLzdyWEhZVHRtU3FHdTd2WDdKY1hJ?=
 =?utf-8?B?QnlqVitDbDExS3dDOUxTU0RFL01NZXJDb2Q3aGNIQ0Z6V0FsUi9OQ25zalFr?=
 =?utf-8?B?YytLV0tIK09rcXNqbSs2cDhQbzNvQVNFZ1hRcUpXaVhleCtlYUs5dE1yVnMr?=
 =?utf-8?B?K2F0VmUvUWdxSWh3RWZUdEN5NVR2N3ZVYy9KWnp1bllVZDNXM1paaVpDSzUx?=
 =?utf-8?B?azVtbUdSS0VkUzM4Mm1iSDZoTjlha0Q1TFpGTThFMGduUEtFRjYrL1VCZnVU?=
 =?utf-8?B?clNZaE9FdEIzdW1YQUZsVWFZeFZxSnRwM3NGODkwTi81b2F3VEh1NGtLbGo2?=
 =?utf-8?B?Z2VwRFBlV09PR2kwb2srTEV2TlYxaGRoY0xtYUNGRStnaklMTjlYZjNIeDIx?=
 =?utf-8?B?a3Z6MXVqNitqMlFIUG9UcG51RlVJeFJzUVZpSXFuZjR5VTNMbzBkbWUvcFM4?=
 =?utf-8?B?bWkyNVlWZU1tell2MHNhamM1ZG1YWEowbXRMbmdmWkpHSU5HcHZLbmpPT0xL?=
 =?utf-8?B?ZFlxc1IrTG5VcE9TWFJVU0VUZEJXQjR3RytsaHdjbDlzZFM0ZVZLeElodDYv?=
 =?utf-8?B?RzFoTDUyWmNybmV2SDJFZXdBMTZBSERhUFFaejZ1MUxVM2lKaHNobHp3QkRY?=
 =?utf-8?B?VmZYaC94Q0ZBKzAvbmx4akczSW5POVl0UGdOM0FDYURLd3B2dko2TmpHbHA4?=
 =?utf-8?B?SGI3bHJrd25aY0paWHRXUWMzdDNSdzJZUjFaN01pYmxlYjkvSTg3Z3RZTVRQ?=
 =?utf-8?B?L09iajJhby9udkpkVG9sWnVoQzR4K05vNU9naVp4bk1vVEtnTkpYUHowV01L?=
 =?utf-8?B?UWlLbkkzbGRNcGVLaEVOSTBHWHloTDVBc2U5K2VFVFZpbThpM0pjeFoydFhy?=
 =?utf-8?B?NDBSSzVoZC9XamdMQk5WRHBpT1ZFcUFwK2daOWdwZ0txS3k2aldLWEhCK29q?=
 =?utf-8?B?RW03MmRVUW1HUlJiL3NMYm5QODhrWXVRVWNWT3Q4aVVHWHQxZUp2UW9TNzNW?=
 =?utf-8?B?cU91WEltSUtadXAyeCtMaUdNNGxKdzVGc3dLLzA5ZXV2OTk2SVJORzQ4ZXRa?=
 =?utf-8?B?MUs4RTRpZTdLZUhEaG1pYnh4blBjSWh1Zm00NC9sSjk0YWVBUnZ1bWJBb05S?=
 =?utf-8?B?VmMvVDJmeTV2RGF1bE52VkxRaW52S0hna3o0d0lWcGwzUldQNkFqbHMvS2Y5?=
 =?utf-8?B?bHRSNXUvaWZOU3RMK0d3UkVrdzF6dTYzZ0RQL3RkVURVcTFaa3hHRmtOcWJ0?=
 =?utf-8?B?Vm1xZFdRSWYxcFJLMEt2ZWF0UVRKSkQ4SUR1TjJaZmp0eFZOQytjOTVtdUhI?=
 =?utf-8?B?dTkwbTB5RE0yNjFjRXlGTUN6Qkc3dHcwTnMvQmRYTXYxRTVma29BQkZNbTNz?=
 =?utf-8?B?ZmswbEtMLzFZeE9YNDdRVHZDam11NktYTEM4NkQ5UWNDSTZKRERScXdqT3hs?=
 =?utf-8?B?UWloc21tK0xCVWlScERVK0x0YUIzaU5UUHZ5OU16RFFDUnRGdXZMNCsveWl0?=
 =?utf-8?B?QXFvbjliQ0IrS2xwUEY0RVVWaCtFTHN0K054TGNDSy9XZ2l4MUFKeHZxbXNy?=
 =?utf-8?B?aUNSSmlnYm9XS2kvVFU5a0R2Sk1iWVhEYWxsVU4wVG1PemxPcTVqaUYreTIv?=
 =?utf-8?B?c0UxZUs1ZDkwZlJsaXpGdkpLejV4UUlhMUc1YzRkeDdVaWl1U3dxbDJhczlo?=
 =?utf-8?B?b1k5UU1OcUViZWVkdkhxekVyODNUbGJLWEtlZmNSSEdlUzhqNldkdTE4YVly?=
 =?utf-8?B?c2c5M1V5SE9YMzZZR21TOFlacWpmZEdqbENxSmU3SzJ1UTJ3Yk85ZE8vcy9K?=
 =?utf-8?B?Yy9QUFFhUEFEdFdhK3JaOEFGTGMrM2RTZ1oxM2gxaVFSWHc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB8283.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Tk1VaTk2czhPeFYxVFIyaUdUQm9UYWZLTTZCR082QU5HSWxYS3Rjc2VhcHJR?=
 =?utf-8?B?VWNiRHY5SWpsWS90N0FSMzNNRC9qL3FYM05maXZ4a1ArejR5UU1MMXV6MkMr?=
 =?utf-8?B?N2JXZTJNZ3lucHE3d1MzRFhiQ0Iza0VoZWVVbkQ3Qk1CV0xFTnNLUlZLM1dv?=
 =?utf-8?B?eVU2YzZpclZReWNKcGhibU5pM0NvbjMvRVI5a2hvRjRUeFM1WG92RnhOenh3?=
 =?utf-8?B?WHNRYkRrN3JqdDk1T1c2Rk1Iak9TVVM4Q2NacXVUbXVHcEdMNWNQcU92ZExE?=
 =?utf-8?B?aitteWwrTW1CS1pBTUkvY29ETFd2c21wdEZxOGc2M0w0SDlPUUFGUW54bFRY?=
 =?utf-8?B?ZDlTc2FzTmE4L2QvY2hPa1JnNDlWUC9ZRDMzb3MyMWducWV2ajhyMkJvbzBK?=
 =?utf-8?B?cllPMTk0WnlHVUlQY2VPamtFUFovVEpwK09Ralh1bXJZcGQxMlljQnZTVENR?=
 =?utf-8?B?U011MStHdDB0cjFDZFFzc1lBdysxcVJQYnJCcGsxZ3lQRnJBc0p1N2FrN3Jj?=
 =?utf-8?B?MlY5Z2VSK1FEb2xiQk12V0ZuN2k2dDVhRXlkdE5JODFSRzFQU1U4M29wNUVt?=
 =?utf-8?B?ZEsvT002dHlZQWw0Sk01eU11bHV1bmNYdVNnb215alk1bllwRFdIcEdES25u?=
 =?utf-8?B?SGwzQ2ptaExwMDBmT3dOKzhnVEFJTkJPR3ZNNVhrd1JyTStzbFhuMnVxZUkr?=
 =?utf-8?B?TVhXbkU1RExqbS9nYmwyU014NjA2LzR1NEpwMityaHh4VkY4bmdYQTZId1pq?=
 =?utf-8?B?MURDWG1ETk1qa1I4N2pnOTg3UTQveVdLaStXWXdoY21oZDlUK1loNE5keHRt?=
 =?utf-8?B?NXBHdmxHY2RXTVZRQVdNMWN6aTA1QW1Cd3JwMU1DN1N6WEdNSlIxazNQalp3?=
 =?utf-8?B?Y2hZRTZ0cG9HL0pqM3hINXo5TlFiSUh6Y3BGM3Q5QkVGaGVMTVUwR3JQS3pk?=
 =?utf-8?B?bVlmRDFDTjA0eGtSd1BNYlhLdExvYXQ1WmdPdm9TVDkyemIzNWQwWG0yZUg5?=
 =?utf-8?B?TDZwVDMzUkVLTUc2NUZyK3RLWUdZZjFHSDVXaUNWeDk5aGt6NVlGTllVVll6?=
 =?utf-8?B?RC80eHY1OTUvbExpeFdEZy9RWnRyMmpIUGsrQnpLaHkyYTJXQ2NKTCtuRHFO?=
 =?utf-8?B?dStkVk42Skx5SEpmRU9YUnpaR1QyVk5MZkJFekE2QWRvWGgvWml3Tmptamp1?=
 =?utf-8?B?N2hwZFM5VmpualJYcjc2dmxTNld3S3dlSGRJNFptSVNQNE1adGUvZ04yWGFV?=
 =?utf-8?B?bXg3YllYVXJ0SW1ocTdFR0FrMDJ4SThBbjRXdWpJTzB2Vlo2YWFnQ3lBbmlo?=
 =?utf-8?B?REg4UnkvNGZSd0FVT0JrcnZqSWJZSGpKRE00S3VJZk5mZUVuU1ZPaUc4b3Nh?=
 =?utf-8?B?cFowcmRNbDA3dlpEMk1JY0NTM0FDSCtZdll2dEJoNk9WcGZQeTRUN1BwdWFn?=
 =?utf-8?B?S3I4RlpOcXgyWklRVEtsUjZwdVEvK0lHQ2pBVEZKOCs3Z0F5L2VBWVhLVWY1?=
 =?utf-8?B?OHRuSXhGSkdMWCtOT2xmNnYreWt0TUt0WEs3Z3BUbTdzRkljQitxZWNlQWJk?=
 =?utf-8?B?L0hNSVc3Tm42RERGbFYrVTRiVUd0US91b3VWNTJWY0J2amNZTGtSaDRFMFoy?=
 =?utf-8?B?bXZ1alFlRU0zK0g2SWw4RFZscXBaVzBNR1dXNHJUQVVqODRBQTFGT2FZOHVq?=
 =?utf-8?B?QytRYzZUdGs1NTY3VzlJcERxK200OWJmRUoydWpZMHhBcm5Ld0ZrWkp3SzR1?=
 =?utf-8?B?Z0hkWGZhSGY2MmFVMndBSGtUaHoraU9JTks5REU5ekVvQ1krK1RSeGZlNkFk?=
 =?utf-8?B?ZEdIdGNBdkVrNW5TdmxJNmZkb2tLM3pGenhMTG5VSXluZzZBY3JWSnRPcTJa?=
 =?utf-8?B?SVZVUFNFYm5DV3VKb0MyWGkza251NHR5aHVvRmNPd0pvR1Y5SUZYRHhKNTVw?=
 =?utf-8?B?aU9mcjd5OVF4ZjFJNmJScTVoK3ViN0NaN1FMbTN5SlR0ZDlScHdiQXVBUHBP?=
 =?utf-8?B?NkhMYlRZTGprWFFIQitablgrTVFIejlVUkpuNlZWbmJKRldwZ0lPVlBzeDl5?=
 =?utf-8?B?cTlLSFhpdGQrUDNmTnU5TlR4ZGtIVit0VUxTekdXZjBkYVR5RjZtbG1pTEZS?=
 =?utf-8?B?ZUd6NXRLYjlTQmp6RkpzZFhpK0xzaURrYzdTRTB1TUxCQVVpdjMvaWhmdWpH?=
 =?utf-8?B?eHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e81f9078-2acf-4300-d672-08ddc2b23a00
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8283.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2025 08:41:29.1600
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dz6rNhlhCstKJiOneFdWGvd8KfHO0MH5o2q4fOWGx0d3pTzEFrA6AFV3tsV6L0H2+9d7FgrJ2nXoIqueU5Y9re1w/jOgsD+uq1m6i0T6tPk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7097
X-OriginatorOrg: intel.com

On 2025-07-09 6:04 PM, Takashi Iwai wrote:
> This is a part of HD-audio code restructuring.
> Simply move the current code of sound/hda/* into the subdirectory
> sound/hda/core, so that more stuff can be moved into sound/hda cleanly
> later.

Nitpicks: I'd suggest to drop 'stuff' in the title, 'HD-audio core' is 
enough. Same with 'Simply move'. 'Move' is sufficient.

> 
> Most of file names with hdac_ and hdac_ext_ prefix are renamed without
> the prefix, since they can be identified well in the directory name
> and superfluous.
> 

Just nitpicks - nothing TODO as a must, looks good as is.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>

> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>   sound/hda/Kconfig                             | 67 +------------------
>   sound/hda/Makefile                            | 22 +-----
>   sound/hda/core/Kconfig                        | 67 +++++++++++++++++++
>   sound/hda/core/Makefile                       | 22 ++++++
>   sound/hda/{ => core}/array.c                  |  0
>   sound/hda/{hdac_bus.c => core/bus.c}          |  0
>   .../{hdac_component.c => core/component.c}    |  0
>   .../{hdac_controller.c => core/controller.c}  |  0
>   sound/hda/{hdac_device.c => core/device.c}    |  0
>   sound/hda/{ => core}/ext/Makefile             |  2 +-
>   .../{ext/hdac_ext_bus.c => core/ext/bus.c}    |  0
>   .../ext/controller.c}                         |  0
>   .../hdac_ext_stream.c => core/ext/stream.c}   |  0
>   sound/hda/{ => core}/hda_bus_type.c           |  0
>   sound/hda/{ => core}/hdmi_chmap.c             |  0
>   sound/hda/{hdac_i915.c => core/i915.c}        |  0
>   sound/hda/{ => core}/intel-dsp-config.c       |  0
>   sound/hda/{ => core}/intel-nhlt.c             |  0
>   sound/hda/{ => core}/intel-sdw-acpi.c         |  0
>   sound/hda/{ => core}/local.h                  |  0
>   sound/hda/{hdac_regmap.c => core/regmap.c}    |  0
>   sound/hda/{hdac_stream.c => core/stream.c}    |  0
>   sound/hda/{hdac_sysfs.c => core/sysfs.c}      |  0
>   sound/hda/{ => core}/trace.c                  |  0
>   sound/hda/{ => core}/trace.h                  |  0
>   25 files changed, 92 insertions(+), 88 deletions(-)
>   create mode 100644 sound/hda/core/Kconfig
>   create mode 100644 sound/hda/core/Makefile
>   rename sound/hda/{ => core}/array.c (100%)
>   rename sound/hda/{hdac_bus.c => core/bus.c} (100%)
>   rename sound/hda/{hdac_component.c => core/component.c} (100%)
>   rename sound/hda/{hdac_controller.c => core/controller.c} (100%)
>   rename sound/hda/{hdac_device.c => core/device.c} (100%)
>   rename sound/hda/{ => core}/ext/Makefile (54%)
>   rename sound/hda/{ext/hdac_ext_bus.c => core/ext/bus.c} (100%)
>   rename sound/hda/{ext/hdac_ext_controller.c => core/ext/controller.c} (100%)
>   rename sound/hda/{ext/hdac_ext_stream.c => core/ext/stream.c} (100%)
>   rename sound/hda/{ => core}/hda_bus_type.c (100%)
>   rename sound/hda/{ => core}/hdmi_chmap.c (100%)
>   rename sound/hda/{hdac_i915.c => core/i915.c} (100%)
>   rename sound/hda/{ => core}/intel-dsp-config.c (100%)
>   rename sound/hda/{ => core}/intel-nhlt.c (100%)
>   rename sound/hda/{ => core}/intel-sdw-acpi.c (100%)
>   rename sound/hda/{ => core}/local.h (100%)
>   rename sound/hda/{hdac_regmap.c => core/regmap.c} (100%)
>   rename sound/hda/{hdac_stream.c => core/stream.c} (100%)
>   rename sound/hda/{hdac_sysfs.c => core/sysfs.c} (100%)
>   rename sound/hda/{ => core}/trace.c (100%)
>   rename sound/hda/{ => core}/trace.h (100%)
