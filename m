Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFD852F7475
	for <linux-sound@vger.kernel.org>; Fri, 30 Jan 2026 14:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769784592; cv=fail; b=X5AO5ZUNWiv0+6Pgup6Kbut2igeiI7Gj0FJGsWn8TdXJO/rSE9+Q6cfjWO+UDKqCgF+kaLlwgVHogfGeyhbnwWmH4sqcCQteIbAbzlMo9lkLWEDpyJagSSlp8bHmtyla7B+6IynIdD9lkOzEVFv5oBJMbm6FDVVTEXSQHTv4lHE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769784592; c=relaxed/simple;
	bh=pMyWnZZlEDofNNyzpvSyEzGVXtcheOgxzGyWH6rpTtE=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=CGzy3EwomMJ7OdWctZr3pJPE0ALS094uame3m3l1C/JumFMaWHY1U/IPAgEAzR1IE6k21s4GXyn9EPeuOX+HfHGaK8aD0FHz2IXg0hHZG3eXKVsf8qniJbsUOYMthW2/FNTPJB9YC8ejii3BfxrOZ0Dxu+LP5DMPddNgBWGBnKg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NrNveTUz; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NrNveTUz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769784590; x=1801320590;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=pMyWnZZlEDofNNyzpvSyEzGVXtcheOgxzGyWH6rpTtE=;
  b=NrNveTUzGCAESvRpP9bprOPkXM6B4qfSW3kB8Sl5xnzREOEn8zggX5TP
   AyNG/G/UpsI3IHJLvua9qLdWjcZ2KcNLfRsjlylOQ/aiFR2yiL6uRYZpK
   cBhQOzRyKv9moRt+DZaj5eLK+7ccrtfCngCELXG93qVtYk5p/TI+0I6GI
   JRIiu4cGlUS6HYIGrkT9/ELcHVPmAWv4dk1p02rkf+tGAgbPr4P031nu/
   gfAUfA4JGHeBfpUeZdUiEEMvKanNLoYkjbyyTowEnmuAmqsAI1I7L/m1f
   Q7Icd2cqRMOlyyjrW3towKMi0/x1cbZOLjB7a7LjD+yZY7+9jWaIKM/NG
   w==;
X-CSE-ConnectionGUID: 2n47ic/nTt+RRkF9aXhu3Q==
X-CSE-MsgGUID: 3ziIWWrLTmaac5XIg9MTzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="71199435"
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; 
   d="scan'208";a="71199435"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2026 06:49:49 -0800
X-CSE-ConnectionGUID: UkztWD46RtqTNbs+TxKDAw==
X-CSE-MsgGUID: GHVen6RLTI+Z+TKrGAOgRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; 
   d="scan'208";a="213363889"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2026 06:49:49 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 30 Jan 2026 06:49:48 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 30 Jan 2026 06:49:48 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.2) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 30 Jan 2026 06:49:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kPMG7PYZ0An8QVL8nSrWtNzZJHFYNGspl1jOHEyUDPZ86Ro3kwLYH0Z5YarvzvL35yv8n13lDQy9fkxuM68p61JK0Ek4XlYpxQdwQarTPgll9k5qw1Aj/1PcLf43ctOaRSraGs1jL6C2L4adecu9XsCfUWgKC+jMnxxap3S9dzkGtSbXNgEpcPoKQYOjhrZdhqPZl5X0MbP0gp1m8gVdPPPuzlhFb0F++nipXzFKhQ6YivzZM6d/zePKlOshgdpivhV5Ov4Nfgb9mVA5jPxDC42BNyU2l1LgkoSTuZOHkGHT8qzqnABWk1sh1IpG6KUFQ3ChKFomOEkbTTsV9iBdtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yh02o2EtrAkFCzs/vsA+qlK12TGJWPNs7/ib7S6RYos=;
 b=MD86v8KwQJeJ6kATtrWteotszeRK4zAdYBVuzK+9hq/zdQScuem9aY6u4t5/QgRWGRQrcXHTTnZN6iLFtKOEzKwYQYAkvVv4Mrrwnhk9d2zNa+++zFPjT9iWqZfEUt9muF5RdFHoNpwuDBDATHcXaHmUmy7vPWi1N3rS0TdujLAvMSuS7B5e4X7ljgRYF08+q3H9rAxUm5awQBfJNf5DjfVDDgc/aKOmdsgShKoKiQ7hFstvZrfwb5aZ9TiiiZBiZsXf3w5qfJ7/SkSTU2Wm6r3BJz6eKb9BiK9t0aTyk0wJ4Tn/lY0L/ErTmPKHsLfhfnUEeJhSxUoe16xCYUYPYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8283.namprd11.prod.outlook.com (2603:10b6:806:26c::16)
 by SA0PR11MB4526.namprd11.prod.outlook.com (2603:10b6:806:96::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Fri, 30 Jan
 2026 14:49:46 +0000
Received: from SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::d18f:6b38:584a:214]) by SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::d18f:6b38:584a:214%4]) with mapi id 15.20.9564.006; Fri, 30 Jan 2026
 14:49:46 +0000
Message-ID: <4d1a0095-dfe8-4719-bda9-61ed6a42749e@intel.com>
Date: Fri, 30 Jan 2026 15:49:40 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ALSA: control: Verify put() result when in debug mode
To: Mark Brown <broonie@kernel.org>
CC: <tiwai@suse.com>, <perex@perex.cz>, <amade@asmblr.net>,
	<kuninori.morimoto.gx@renesas.com>, <linux-sound@vger.kernel.org>
References: <20260130135541.115574-1-cezary.rojewski@intel.com>
 <60f477d0-ea1f-435a-bd8c-4e7e06a1802b@sirena.org.uk>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <60f477d0-ea1f-435a-bd8c-4e7e06a1802b@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR06CA0116.eurprd06.prod.outlook.com
 (2603:10a6:803:8c::45) To SN7PR11MB8283.namprd11.prod.outlook.com
 (2603:10b6:806:26c::16)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8283:EE_|SA0PR11MB4526:EE_
X-MS-Office365-Filtering-Correlation-Id: 38908dde-4ea2-405e-fed3-08de600ecf9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MUFEUys2Y1JNd2RYcDBGaXZqV2hJMkdzRUpHckxVOVFReElXR3RkSnlnOEFL?=
 =?utf-8?B?d3lUdmJDQ1N0NlNOQm1GWlRSeHBiSVNNNFZDcmR2enNoMGtGUHdHTFA4SklW?=
 =?utf-8?B?ZUkzaFBRUTJQRmFLWHZjSVJEM0JmUGFGN1F3T1lKeWhJRDFyNkZzQlY2UzFx?=
 =?utf-8?B?QlgrcVB2OVFnTHhScUxxZFFGcGF2YStscDlUSFdpUWxNT1FaUTlJaWttcmVm?=
 =?utf-8?B?QlRFL1grZWUyL0NZZmlzNjhGdWE3eHVJQTVuaEJVRjV6RWdxT1RNTlVpVHNQ?=
 =?utf-8?B?TCs2d3FWQW9JZWJKTXBVWFRWTEVYUWw0TXR0WEMzbUVKLzd2ZzdTb3ZpMGh5?=
 =?utf-8?B?cGxPb0QreGl5RDZ4YlBjV3RSY0hvUnpTaFZzeFQ3RGZZUGw0QmdtVmY3UGpj?=
 =?utf-8?B?VU9udWI2eGdaaXZid3gzUW1tcEoyRkxkVUE1VC9QTG1KY2diNDVpVzd5NVJu?=
 =?utf-8?B?bHFuTzJRWWF6cXdScUxYY2VCRG9YcXl0UTdZVzFGRmI0M3ZGcnRLWUtONitI?=
 =?utf-8?B?RFBJNU9jOEZwOGplUXMydmVlVmtuaFFaQmtjNitnQXdaVGYvd3RTQ2FpUFBl?=
 =?utf-8?B?UFhKR0JMMklBaU13cHdPdjBWdzh2b1pWcEpoYXN3elFZYlRHUUhMOUR3U3dN?=
 =?utf-8?B?RHorNk1CSG9QT3VZb001VzBwcGkrbnZxT0NxeUVqQkFGOTN6WUoxbjl4L1Mz?=
 =?utf-8?B?T3pWQzVoazIzT25kaXlCbVBVV2haNTcrK0thN1Azelp3TW5oSk1tZjA3MGEz?=
 =?utf-8?B?UFZzNjEraGc5L21QMGhmWmlVN1RURFVMcWhxVlQ5T0NSSjZMOGdGWmlTUWJB?=
 =?utf-8?B?N3VBMk4wRGtHdTU2MHBaQUg3YTdBL3lQR0Rabk5Yd21YTHZObHp3UFlpeXVi?=
 =?utf-8?B?YnVDd2xFT0Uwc3NCYjhtMlkza1cyTFUwOWRBUFJBQm95OTRPRWE2QjV1VjdP?=
 =?utf-8?B?RDdNVWpJMWVkY0o0OSthcks2UktJYUtuN1dlVTlzeTY4emlWbDMxTGRTelgv?=
 =?utf-8?B?U3Voa2N1VnZ2ZGo3bi9EVlpWeGJkc09rRm4wb1BVMmd2U3FsM1JHZy9WaHRM?=
 =?utf-8?B?Y0hCN2puWXVjWFNUdk1XMDZoVnc4V0Noem5FanpkRlZuampqQVk3THBmNm00?=
 =?utf-8?B?OHhaZ2VRdnppeVlCam82YTNlQUJmN2h0V0E4bFp2UU95ZlZlMEFnVy9Vc0N3?=
 =?utf-8?B?bUJmT0RpQ0Y0YUNhTWRXbjRVOUZxR0Vod0FJVFg0b3NVTnFuR0VnMTJ1czNp?=
 =?utf-8?B?N09yYkk1N0Z3Z3ZnR0s2UHlPMFp3N0xyL0JnUnhneHhEQXBaekIzVDNuZ0JC?=
 =?utf-8?B?ajI2SGFnWGhLWmd3U3AyZnB5U0doRkRvS056Smw1Rmw1ajhJMU5TQVZLWkFT?=
 =?utf-8?B?Q09jTC9sMnJjVXl5ckpaOGt6WWJZN0FwbFdCbVJKUkljTnd1cjBKNmQ3eXQy?=
 =?utf-8?B?NVh0Nkx0TVUwWTdiWnNRQUxkNlU2T0FzU3lnNmRxT3YzQzFvZGtIZkJNcWxH?=
 =?utf-8?B?bW9DTlBlN1R3cXV6RCtiUm1XQ3VsdWtWbzNTZjRGTVFaL0JPemsxeUVseDh1?=
 =?utf-8?B?ZWtEMElQNnM4MW5EUCthNXhKMVpMTHRUT3dsZW5DN0RBaFVNbnV2M2FGUnVI?=
 =?utf-8?B?S1k0Sy8zRzdrS1hJUlIvL1dhbGtScFphL09HK0ZTblg0TDBjY1pLOHorMXY5?=
 =?utf-8?B?MVdBS3k1S2l0VG9Td2pzRkVkWE96MEU0TnNrR0ZtNmRTVHo2andsKzB5Si81?=
 =?utf-8?B?aVpXRXJxODc3NnJSTnl4Tjk2ME9SVEJJb2hibE5VRHUzdGk2VkNUbmVQUmhL?=
 =?utf-8?B?QXhRRlhKR054SjF1UHpYVGdQdk9FM2tqaWh5SUduQ1JLVGVrOWZkRlpURVJJ?=
 =?utf-8?B?SmxRTERkK2RPZXAwTzlDQ3ozc3h0dGI3dkcvc2Q0UXllcW96MDN0SFVjWm5l?=
 =?utf-8?B?eXBUQW9yZUltV0J0bEY3K0hPVUdXNi82cFRYY1F6SEV1YWdFVDRmdGRGLzJ0?=
 =?utf-8?B?QW9pZzVrSm1IaDlEUXo0SThtQlRzbjBLeDJIbUpoOFpEL2hUbzMrVSs4VVIx?=
 =?utf-8?B?ZXoxK052V0paUWFkcWNjUFVnT1k4U2hwNThTRkVjWSs1cVdSMTNObWYza2Er?=
 =?utf-8?Q?BUHA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB8283.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WlRsV2wySkRZYlV6bmlyWElyZXp1ZVBFWTNGL2dIQ1lzdXVkaXk5Z0cwTzUv?=
 =?utf-8?B?YVhDQlBjWkF5K0k0cTNlaDB3UTIrc2hLME5XWEdmMHZkSG9RY0E2WUZ2Z1Aw?=
 =?utf-8?B?S1VoUDIzWTR2VjlwMDE3R1lPeTYrSjd2K1pLaWFnODdMQ1BNdlhLTmo5MVVy?=
 =?utf-8?B?L0FDb3doaTRsR2VXVzZOSDZtTmFORFBtUVlIWHExVWNNb095WXNWVlRxRUlX?=
 =?utf-8?B?ZVh3Z0hFcFVQLzlrRnpMUWJjNWpBNHV4czF3d3Z4VWFrVHRycnExZE5KOHhl?=
 =?utf-8?B?YitLeTNtdE5SbFdNOERCeVROZ3k3Wk9CbEdWYnJOYi8rYU1OZ1Jydi9RR0t5?=
 =?utf-8?B?ME5NZ05VUmJKdW9Hbk1yNGtnc09aczUvQlJXODNFMGxWTFFMbW1sc2hhR3Fh?=
 =?utf-8?B?NVMyUHJ6VS9vUlN1cHpCRVpUMFJKQmhoeGkrTGczcHdFL0JYbGdMSXhCa3Az?=
 =?utf-8?B?ZFJTZ1o1SmZkMkRBYmVNQ3AvdVRGbjViL1lxYTBnblBCaG1mdi9GUk9YSmo0?=
 =?utf-8?B?QkxyUm9taUJzbzRwc0NZUS9mQ1pZUTN0c2M1cnRBV3lTWFhNVmZCOXRENGdQ?=
 =?utf-8?B?RENjaFM0WVo1b3RNbEREbWR5R2xlRXZWdDZkWjE5d0FmUGRxTkFkL1dBNW82?=
 =?utf-8?B?OWFWdlZaUnZidTJzdmplNlNVM0oyTTEvMy9IREJreEltSjc1WHVGY3B6YWNX?=
 =?utf-8?B?VjdBVTFveGNTTFdMQXFQRHdaUFNUNHQ1aGFGZU43SWp4Nm9MT3JPUkl3bzZy?=
 =?utf-8?B?OVZyMzJBZE4rUXdUWkYyT0ZxS2laUUI2NTFVMWhWMXFPTSt2Z0pyajViUGts?=
 =?utf-8?B?T2piS0ZTTjFDVHE0aHprTFVVNUJlbE0vd0xwN3Q2QjZQekFzcll0eWJCVVZS?=
 =?utf-8?B?S2ZlbkNEMnN0SEt2YVRPakFramZjQUtoeGE0c2dVTTVYbzVRSVdOK1FiTkli?=
 =?utf-8?B?VGsyMVJWNW15cElmSzd0U0o1L21YaGNYcEQ1RGc4dEtSOFYzcTJNbFF4Z3Er?=
 =?utf-8?B?K0EwNURCbW9jUmNQV205RnJDZEU3WG5scURKbkt0N29IeGsrNklubE1tdXFZ?=
 =?utf-8?B?VDNOemZiOGZSWUptVFZJWnVvUnBFOEgva0h6TzNnbFNicC8vbUJFa0JOb2xU?=
 =?utf-8?B?Q0ZtdlAyYURJTUZNdTAzUTY4YVhaVHdDbytIcXFRWld5MkpOUUtsRjhNS0RO?=
 =?utf-8?B?Wk9NbUh5OTdDQUFBRHJaNWtIczZ2VE1RQ2daVEtwNlNTQmU2eHNyYTVGODN0?=
 =?utf-8?B?OGYvVUNQTmtZeVdTL0l0NXNXUEVVUkM0YkdoYkhzSFJFWmVVLzNNR0Erc0F5?=
 =?utf-8?B?Z1hpS3M2c1pFTUpxVXUySzNmNXBCYXBrRGY2dU1FcHlhdTNVZEFrVVROaVlI?=
 =?utf-8?B?cTFwc3ZPcUdzSkFXK3Y0ZWdCRUFTSnJMN25jWkoweFlrTWFTKzZWRGFNWStu?=
 =?utf-8?B?YTNoQmNjSDRXMlR4MDJ0MXFRWkUxWGY2Wi8vOXR6N2dlWnBTenlMUnBoQ3Ni?=
 =?utf-8?B?Ukt0QVpYMXV1UDBaQVE3bktCaG1XczFxSXdTbjMzNDd0cWxMalhFNnBhNkdt?=
 =?utf-8?B?SGoxdHJncUs4SFQwb09sVmp1c0FENGdKTjFYcll3VUM3UTZ5dktpUGFUNXBr?=
 =?utf-8?B?UEhUUEdvYm5OekNxd0g5M2MzdUFNUSsyOHJkTGF4MGpYaTU4VVBmU3lpSGVj?=
 =?utf-8?B?Y3ZRWGc0RUdrdVBHeWJ1NEd1dDRweWZGckNmSXcrakdNNWNXaDhYRWU2ZDh4?=
 =?utf-8?B?WXFwaXZNRE0yQW0zZXRST2lxNjcwOFZPTXhaNVFhT2tadEZlR2JnVXF0cTA0?=
 =?utf-8?B?SElYa1E1UXB1V2RuaEtXa1VXNTJOSmptWXlyY0diTVRjK1hCdHBHalloVXRi?=
 =?utf-8?B?RDMvaFc4NEFqUERPK3NxSUtzVnJIeFN3QWxwaVAzTDI3dy9GcTR1QnpaVGNV?=
 =?utf-8?B?ZE9wVXJkQnFpLzZ2ZVJmVWNtSjRDNWp6RGo1cjE4SStTWFJIVEoyc3hOTi9V?=
 =?utf-8?B?Y3hMaHBXUUxXYUFZZ3JXb1MrclQ2Z0V5VGRwN3AveWltYzFva29RSjFGcVFM?=
 =?utf-8?B?M1NCNVpWTVBpYkJCc2NpZWVSS1I3ckRiRzgwTTBtck1IUnN5dWhmcWpidFps?=
 =?utf-8?B?Y2Uyd2NwcVJ6SVlLWnY2cDUxZ0t3dmRQNkNuc2dobWo4Skk4M29aNEJ5VFZZ?=
 =?utf-8?B?aDAzYWdmV1RjVkdSQUduMWpFbnZIUmxpRERkTXV1OGpDWUh0NnB3YlV4MVNn?=
 =?utf-8?B?dEkxSGlpZWl2ZkVCQ20xTndIZzN2Yk9FOTd6NmtEOHA5NTMrNmFkOUFCVmFB?=
 =?utf-8?B?ZEswWlRmT1JYdE1HVzRxTld6VVc4UlpLU3RERGZKczN3eTB5QjNTazRzZEVy?=
 =?utf-8?Q?Gq59FeC39lHAXOmk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 38908dde-4ea2-405e-fed3-08de600ecf9d
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8283.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 14:49:46.4517
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T9oD9fLStpTc9JEt6V0NEKRVKd+zvivALjSkbj08GCvkQ/912qyBQ+7JdSAnIjmwd2RvrXkRkI4Ck7+v2Lz3plUT9J7Oqqqfgn3CGYp9ecw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4526
X-OriginatorOrg: intel.com

On 2026-01-30 3:12 PM, Mark Brown wrote:
> On Fri, Jan 30, 2026 at 02:55:41PM +0100, Cezary Rojewski wrote:
>> The put() operation is expected to return:
>> 1) 0 on success if no changes were made
>> 2) 1 on success if changes were made
>> 3) error code otherwise
>>
>> Currently 2) is usually ignored when writing control-operations. While
>> forcing compliance is not an option right now, make it easier for
>> developers to adhere to the expectations and notice problems by logging
>> them when CONFIG_SND_CTL_DEBUG is enabled.
> 
> Makes sense to me, although I fear it's about as likely that people
> enable this config as that they run mixer-test it's reasonable to be
> helpful.

Fair point. I admit I've noticed the problem in the existing 
sound/soc/intel/* drivers long time ago and.. forgot to address them due 
to lack of any "pings" in the logs.

alsa-utils' tools and alsa-lib do not allow to differentiate between 
success-no-changes and success-changes. Ideally userspace-level tests 
(functional tests) would be allowed to verify that. While in the long 
run updating/extending alsa-lib is probably the way to go, I believe 
having kernel-level check _now_ is not bad.

>> +	struct snd_ctl_elem_value original;
> 
>> +	ret = kctl->get(kctl, &original);
>> +	if (ret)
>> +		return ret;
> 
>> +	retcmp = memcmp(&original.value.bytes.data[0], &control->value.bytes.data[0],
>> +			sizeof(original.value.bytes.data[0]));
>> +	if (retcmp)
>> +		retcmp = 1;
> 
> original was just allocated from the stack so who knows what values it
> had originally, and the get() is only going to write the part of the
> value that has data since the normal get() path has a memset() in the
> core.  Similarly with the new value coming in from userspace there's no
> requirement for userspace to set anything that isn't part of the value
> being written to any particular value.  This means we're liable to get
> spurious mismatches.

You're right, I've based my patch on results from drivers that do init 
the space entirely. That may not be true for every driver in sound/.
