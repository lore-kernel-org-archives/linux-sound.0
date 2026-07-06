Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9ED4431494;
	Mon,  6 Jul 2026 09:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783330518; cv=fail; b=b7GUfFdo3oYw37wGAnWNgGriQtxLcrO/1oPhtRhQd3/8ynQ5Ka2NwACpsdM9ijMMqviUYgbpt+TiXRkRv9CsqLo4WMcenjZwEkHvGkFzY7Sf9WpkS22z7i4Ca1p0PgcBGLvn24bOIWS0Vol34RRKAnDSR51zaatq0J8Sgn4RVc0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783330518; c=relaxed/simple;
	bh=cp8NiCXLNfH+1Vc13rNqAIoRyxeyiqFen83ouIU9TwY=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=XimzjUNaDTdJ21yLvXZft5+5nAdz0fMVB0B3O28OIYuC8tT+18wqVBKTrIdNuRw55yOH8+mBoAT2HdzWAertX9M7fK8lPph5OgHtO8L/1CMn0cRAI5Zr7qCwq9gE6Mz0HRC0o0XfD3c1dpqhGsq3E9tkVBJRIGZUa99zfjcMyzU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lVoJiHvd; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lVoJiHvd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783330514; x=1814866514;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=cp8NiCXLNfH+1Vc13rNqAIoRyxeyiqFen83ouIU9TwY=;
  b=lVoJiHvdMSxTLYUQaZz1E6R5AwV/wyPPA4QqKyY5Q+T9BGiMYXB+/tvJ
   nan1UQmXzu0moYckIDipcb71SmQi5icOltmf6WGAeiUEmwLSbUGRTVqjK
   7qfPiQ9lM8vxO++pkzNeF9yIRB5CBcy/guiVcQ/PnY+x11uNoCKyJ/Hhi
   0SGgAnIHG101w3G0ljrNNXd6t6KewujaBHo2vl5KSIlJIafV2ZaUyWQov
   56E4/nNjtR7NB7N+JDa5mPaNxOF2B5BV1uZcnDoc/b1BNCH3DkjQbYD2h
   YYfXOwLuhcZpJcHA+bkK61Pj3SZxjDwwWwaB28CMm3SMt6kv3bmXPafBE
   g==;
X-CSE-ConnectionGUID: mX0VJkDjRP+FWQV0pFd4ag==
X-CSE-MsgGUID: kOmeRhM/T3mBobHCb8oiYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11838"; a="95115478"
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="95115478"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2026 02:35:12 -0700
X-CSE-ConnectionGUID: 7egyUNS1QXOrLKIxKWei8w==
X-CSE-MsgGUID: d+bjJytvRau696ZJwf9VVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="257542682"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2026 02:35:13 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 6 Jul 2026 02:35:11 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 6 Jul 2026 02:35:11 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.16) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 6 Jul 2026 02:35:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MS8K/P7jxjfjEPhJ+sKi3Gkz2ecMff5HrIFIxtdwEcQQvIYpP9Fn2R7eUWj2kp79XLr14pV5uHTjNgWaDlEKnaY+UoeivFFXpoz06fGaDxZ+/sOrzGGDgJ47XTIIFAOBk8sQhv/0idKQEP9HMXjXSKLVYqD0xZwBbpte2mVd1+owg6RoBy0TI/TeklXP1Sw6y+aUJGILCEDtxBtYgEC8DSJiNZfofuFCfKI5lZuLvydxc2aLirP7uHuaMlt15OP/2PR7m/3qLcbPXffRerF035AFgAXmiuG7Y7DVURn1f6wpRpSpjnkHdzhthpKejRrbrusXCgSsYjClrvZeL1pAFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3duXDOOSPpi2iKzdcWdrmltH9uJsdYdffgxX+8EAY/w=;
 b=gyXLUeOXgj8pf4LPVyZ8YKMvKow+15G57k/52bah978y0hCXx94lzB+l4sloOYrAifV2hw3OU9hzkR4GXNwuFMKz2514+grnDHAj4PlNyn5u9s7omqc3nMGp5sTVOTDRvqLwQbjvHXOSMnCgiFAbn54Pt6BiPLLGc6ibk0hisGkpWaIOGkNhofOkwsf5vqb2Gv8mF+njAwrX8xH2IH6DW/RsJSfxEVW5sQJuO19EEiCHpBkh4XrEHGV4oTzqowIjwGLYs8Lh/R8i/lKDhrTnp8NHwF5WFCbNdkbK7oelq/lKF5wfGpB2kXot23Kwp5Jw6aXRLrJMpgdeULsjAhM29w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6967.namprd11.prod.outlook.com (2603:10b6:806:2bb::15)
 by SA2PR11MB5114.namprd11.prod.outlook.com (2603:10b6:806:114::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.13; Mon, 6 Jul
 2026 09:35:08 +0000
Received: from SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4]) by SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4%3]) with mapi id 15.21.0181.008; Mon, 6 Jul 2026
 09:35:08 +0000
Message-ID: <09c381c9-113b-442a-9ada-fb177d6dc4e1@intel.com>
Date: Mon, 6 Jul 2026 11:35:02 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] ALSA: control: Return -ENODEV instead of -EFAULT in
 snd_ctl_open()
To: <phucduc.bui@gmail.com>
CC: Kees Cook <kees@kernel.org>, Dan Carpenter <error27@gmail.com>, Cen Zhang
	<zzzccc427@gmail.com>, Len Bao <len.bao@gmx.us>, Mehul Rao
	<mehulrao@gmail.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Jaroslav
 Kysela" <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	<cassiogabrielcontato@gmail.com>
References: <20260706084950.49331-1-phucduc.bui@gmail.com>
 <20260706084950.49331-2-phucduc.bui@gmail.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20260706084950.49331-2-phucduc.bui@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIUP296CA0039.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:34d::9) To SA1PR11MB6967.namprd11.prod.outlook.com
 (2603:10b6:806:2bb::15)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6967:EE_|SA2PR11MB5114:EE_
X-MS-Office365-Filtering-Correlation-Id: ecd65130-c0a9-401f-40bc-08dedb41de71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|23010399003|22082099003|18002099003|11063799006|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info: QzkTFgWPTAWIE+1TYh9FNLDzRWt9laj9krvIjLVZLVNOH0hwDI0I0k5lP68sPu+TUYqIYdrV25zr0TISRLQvRAKdPbzGe45SiXDZItvg2+MpTyPBnLGPhXyVTe311ku7MRdKmS+yKD5ziyulRbNA6bPtV/vP/PRU8BAp+r1fnlKNwcL27rpjRnF8pR/PhSNFl1wX1RanDxag7DynOz8jTh3swbOP8p2NbPqO+hX5aOjuf6r/zejuElEhv7KnjYhlFNKS3xDRBc9SHYdoAus2PvpaXnpoZvPIBuxYD+833htMBV4aLT+F0TTTe7XvlQ2ySr3wkJa4JgKmtUAmuHvI747mqazqaxcCIcnTMDgBIlw838+MVFDC+hycimIXimngOlk64xlSB8gXCwKzNuWP58T4IDnyq5rx7uyFgU6SJkpCLaerqFXs/LPGerCGeW1snh2LQoImnfW0AvKl8eZWpmbbcTtWxb5VQhu3+ZoUjk77xFyIa4AEuspVux8wfGkRYDarTeSBEvhHtClvSRDLq4WriA8IAmG6qvTlHAfh9/8c84qEpriNFi/kXbxrPCviBnA8UcoXSi3AVDNBUfhwn4Ac8R4qV7LtZSq6UktPBcJO4V1e8oA96o3ptnlugIWcL2tB6N1E0tp2+huv5q4kp9BHFUV4fly+m1Dwc70xyd4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB6967.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(23010399003)(22082099003)(18002099003)(11063799006)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NWo3UjhIbklNN1FzR0d4bjV6TXdPajFLMEEvTXlqU0l2cTJOK3lMVTkzSHdD?=
 =?utf-8?B?dnNQUHVudmNJY0NoTTdNclovMEhiTCsyUDNGM0U0TFI1VU94cWxnL2ZPQUxU?=
 =?utf-8?B?ZGZHWEFOb2xXNG0xNW1acCtaNDkwc280bDRUdXBLb0hDQk5FVll5LzJsSkxh?=
 =?utf-8?B?VnlIK2hYZXUyYitJck93cWdLK21mUUVFa1BVRWRjdExYNHFmaG9OZjlHVXFs?=
 =?utf-8?B?ejF6akVqWUlWeVRhdFFXTStwVHJhV2w0RDlFeThPWkRsOU80OGJhSFo2SmZa?=
 =?utf-8?B?RjFDNzcrTmVUbUZYanN6V0EwYTR1di9jZFl3dituZU1vSHZpWHF1VzJvSTh3?=
 =?utf-8?B?bXkvM3pxRTNXSFBRVm9iUEVRWm5IZzQyNmZJOThQTEI5YkRiem91ellDeXJw?=
 =?utf-8?B?OTZzQmJyd0s5MktoSldreUwwV2F3cU5SUm51ZXNsNVJOZ0l1TU1WaXcrempW?=
 =?utf-8?B?STFWRFBNQ1QraXZvZHhmVHozb0R1Ym9wZDZiUDJadis5aFdrdUlQbjBtQ2N1?=
 =?utf-8?B?K3VmTU9WczIzV1ZzaC9CQWpZVTRCbXVBVlEzMHFGeWt5aGZjV3hGeGNZUXdp?=
 =?utf-8?B?eVEzblRZblZtcWs5SzJCWkZMUDcxVkRtWWJzRjZ3KzhpWHl0OWVieVc2b2lH?=
 =?utf-8?B?bUZKaGFTWHhJd3NDVEZLTDVhVnhKTzFTaW5YTGFsTlpCOU1CUC90TjRLaldz?=
 =?utf-8?B?WStKOGF5bXZpUWEwL3NhcFFoNkg2Qy9hZkJjN2R0SDZqcmlPNWtDWjR5NGUx?=
 =?utf-8?B?L1FKWGViTWh5d295cGx1RS82ZFZwdERlc2NRa1VQb0tiNnVvYzJwQmtkNlRT?=
 =?utf-8?B?cnZNd29TSlRHVVd4bFo0UFlkcGs2TFU2cmlyV0o1T3IxNjQwK2ZTcFg1UmV2?=
 =?utf-8?B?MUxJWE9DY29pNFlCdEFBdmVuVDIxOWxOSW9qUWRadFAyMVFYUWdCaEdXeCtp?=
 =?utf-8?B?VlNEeXpvSk5GQ3p4TEVrRTZpK1orUXZCNk5rY2t4M0tPRUpJNDFKc3hlaFdN?=
 =?utf-8?B?REM4Q0xzWXpSZUR1NkFZU1lsc2oyNjdGZi8rVVRlcDlQUUh0eFV0WC9EdWht?=
 =?utf-8?B?a2xGekdBT0o1cjhHWGoySDZxWjF2aWRGZEIxNG5hOFBlYVdKUHBwbmNMZjR1?=
 =?utf-8?B?SVgycHdoOTlJWXZ6L2UxbEVaSXduVVRBK2RKNmdqVWVBTWZJSEY2S1htczVV?=
 =?utf-8?B?M1djclhlcXlmNDFQNXJjSFllQlVQTnhCOGpKZTY4QXlrTUJKRUJhenpHblV3?=
 =?utf-8?B?dlQ5UHV4NHZqUUd2eUZ5VVhGM0xkTFhYbXdBVHhwdU85amJHd3ljcVY0WG9L?=
 =?utf-8?B?WXRNSWFKM093Vm1ucENRNDFmV0pJQ0JkREh2bjVOS2VrWE9hL0ZDRTJFVHB3?=
 =?utf-8?B?YTM4akduRzBGZGp1VUd6elhGRitlZDY0QVlQa2VXaHVnTHpkdGt6Zm1sSEpw?=
 =?utf-8?B?bGNTYUxGQmdRMEdGaFMrRVl5WXU2TmRRdFE4ZTd4a0E2cG5Kc3VaUk5NaW42?=
 =?utf-8?B?c0xDaHJISXQ2a0ZkSm9yZldWWjNKMzJ4SFpEUlQyRmM3cUJMeEI5SHhRVkJ0?=
 =?utf-8?B?Y1dRV2IzQzA1YVhEQkM2VE5Yc2pkb1g0MHBiWnRLSEFZNGlsU3NsYmhCaUVY?=
 =?utf-8?B?R0xwZXczRkhIeWFOUEhjY2dneFdXeXZQK1pVM3psV2ozRy9wazFOK1BTeFpU?=
 =?utf-8?B?bjhUcmtLMVlPRm1lRVQ5aHdmSG1zc1hlV3JlWnMrZnRoQzRQWjhsTEVIVGlW?=
 =?utf-8?B?bkFrQXpUeGs0N0pUQzd6L1U2N2J6NHZYVVJyUzZ2VHpvQ0VlNzR6RDFOUnB6?=
 =?utf-8?B?d1VkdVQ1TENNbjRpdkRwOVE1dmFua1FDVmR5OGJHcTkwMGlWeXdtYmpMVGZs?=
 =?utf-8?B?MlQ1dWtiTVFjWEVwc09wOVlJMzFpWEZkeGkvUUVBcUJTSFU4SEJqUlg1TTl2?=
 =?utf-8?B?NmJyL3ZZNG10eXJGM1VIbUIvZWYyTVBDbUkyQUp1SmdDYklXSC9zNmNBeXFH?=
 =?utf-8?B?UXhnSk9YRXdXdXdiZUl0M1NRc3FidDRjZGtyOGVlN1pleHdUY3c0MTNvWEsy?=
 =?utf-8?B?eGJpcExQNUN2QTRCdThUa0lDZTE0T1RKRTUvQWxkVXVHOHhscWI2OWc0SXZM?=
 =?utf-8?B?YmQvVTZwUm1mYnp4SXd6VVdUWTJ5c1lsRHdWY295OW0rRkZrVFVQZnJnZ0Vt?=
 =?utf-8?B?YWFuQkwzdy9la1JldVhha2N4VFRaUTdUM2x6dkZFNTRyOGdvcEpCQXdjK1lF?=
 =?utf-8?B?d3dXdWxraEV4RjR0TDVLK1h4MWI2SGV4VG5JTmFtaDAyRHE4M0g0Wm4zSzRD?=
 =?utf-8?B?MzdkSTFrNW8zclFkaFI5YWZMWUs5dGRPUmExU2xMckdWWDF3b0EvVjN0bzVY?=
 =?utf-8?Q?kxHT/fqGJHfWS6Gw=3D?=
X-Exchange-RoutingPolicyChecked: Y3iVwQjNemmMjia+hSEy6XLbB9Bp0gnBRP/EI3Lku4n+Sv0gBaoXX/sGBBkqu6VglKS5IW/HqtpAe0PqMzmJa+8usIko8xBi0JhXRQ0mZBmOwYuBq3jRONQLayc0vjMU9v3ycLU4B/Obr0fr6mVyVdTCeHxI/ZoAIsIxvTT8GenInWsoR5wPecEtGHOFQNZrwpClFLC/K6JtYFBjL1Km2vwHIwnaMtzOtvRmuyJ4jvGYd7vzjg4dqU4YggYDv7Kk08tJM0XvSu2g4ZndW1NZyXS+N6Iwqk2XdC/SLJNvEd/wOtgvdKhuecNjYpv9VKvP1c2Gs/Ug88BpxwG0xM3fRQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: ecd65130-c0a9-401f-40bc-08dedb41de71
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6967.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 09:35:08.6638
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cCgU+tErhRr4B+/EVkiPlFzHloM4oqTKfPqDm9xYj1YlgOXczBPmnli1c7nPQkytaXtCBw5ue+Mdsktni2bYzR7fmqzCnZS6FAbTz8aoM6M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5114
X-OriginatorOrg: intel.com

On 7/6/2026 10:49 AM, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> When try_module_get() fails in snd_ctl_open(), the owning module is going
> away and the device is no longer usable, so -EFAULT ("bad address") is the
> wrong error. Return -ENODEV, matching the other unavailable-device paths
> in this function(the NULL card check and the snd_card_file_add() failure).
> This changes the errno reported to userspace on this rare race.
> No other behaviour changes.
> 
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---
>   sound/core/control.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/sound/core/control.c b/sound/core/control.c
> index 037e455bb11b..f64b2dec746a 100644
> --- a/sound/core/control.c
> +++ b/sound/core/control.c
> @@ -64,11 +64,10 @@ static int snd_ctl_open(struct inode *inode, struct file *file)
>   	}
>   	err = snd_card_file_add(card, file);
>   	if (err < 0) {
> -		err = -ENODEV;

Seems unrelated to the patchset.

>   		goto __error1;
>   	}
>   	if (!try_module_get(card->module)) {
> -		err = -EFAULT;
> +		err = -ENODEV;
>   		goto __error2;
>   	}
>   	ctl = kzalloc(sizeof(*ctl), GFP_KERNEL);

