Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCCC930FF30;
	Wed, 12 Aug 2026 06:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786517577; cv=fail; b=hatv5C8+W4MCRekK05AphiuPz2+zg7FEV+pahjL/SnhV7eQzSJUyXPpiOG5Nf0xjKaPq0VPe6bvkQQ3LvBA/1TWQYB6auq8ALSBiJnWlvb2fTzuIko8aM9o/O5TeUphyZR0ILfXgswh4cP5cleANfbjkfgb9FjnMROx57Vd12kE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786517577; c=relaxed/simple;
	bh=8hjB7vfl5WzLqcuYjyoiKBK2Y1hwXOm3K3H1U8C4CGk=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=A5esyiADRPqoSzRTSdbXxFZ0SaqdFvYx9DbGFgPA9VDyMnUSHWftORUcBZ8Upy0XmJcpZL9Gi81SDCytTc24w+lAC/9v/h8SBNOPQv/u3Pl2nQ9wwY/HdjXulhNSeX+o1Xm8EZQAvyjvF3cRkcFLlWtn42Oiid7tqN2UdgB+L74=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kKD+SFtb; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kKD+SFtb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786517576; x=1818053576;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=8hjB7vfl5WzLqcuYjyoiKBK2Y1hwXOm3K3H1U8C4CGk=;
  b=kKD+SFtbW6QuFHllhsFuf2dJVxnCaI0xQIX3CndXFLeDyXMwI0K8NtS3
   5t8OOVGF4G+8Euj2PaWXyfyp70HXSoYX1B2rQA9Ja9DUugnOGy0FbVdnZ
   e1miYVBJSVjnJVHzqfcWOvFgokQBRqIVDsTxvN7rXo2ipUSDNhAa6BBYK
   psbD16oTxVzrSy/ltpZXHxlU6jcIN5oRebJd1hn4aTA6wopsfv0efUcqv
   Pz0hbtZS1LSadHm6yYFrtOEdCdDpdv1xFJrRxHqFrSxjhAcL56p5mr0SC
   yG4YEhEK5EhK/BUMzy1bXWJqM9tOhpOQnyVypQp1vsGMNAlNq4uiDNPdm
   Q==;
X-CSE-ConnectionGUID: hxr7idAcTT6S+XsyQvpBew==
X-CSE-MsgGUID: 0JLtDoolRx+tUE2s23n4Cw==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="87135587"
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; 
   d="scan'208";a="87135587"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2026 23:52:56 -0700
X-CSE-ConnectionGUID: laKY5kkuR4ucoXugjjfLJA==
X-CSE-MsgGUID: SxdhxeBZTEiMM4KCpu2WLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; 
   d="scan'208";a="288288117"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2026 23:52:55 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 11 Aug 2026 23:52:55 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 11 Aug 2026 23:52:54 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.2) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 11 Aug 2026 23:52:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N29zhR/VqIziCDucOpOxBmf/vrH1ZqIvemyVCTg1xQV5bW8q0KCR23V4wz+3CdCOd6ez3wqRxDt4UEoPbkXqRJk8qsfZgIV6J1YO0+neztEApWbSXZ/OkT4Y9vIQU4yxOQ41hsVtOZeDfhlgGYOZCTxNlSEp876lyOfR++URjDe7sAP4XcBbHdSoMSFuj8y6Nk7BdkP8r52n42XVBPwnujXJ3+Gqv9zcgrtIWe5x/GxNexFefyTr06V6h2EoZdGWNYGJBFOsxqMKXqKl1lKjuPFzROp3KZjaEg9FiSPK2PNCb1VegZjwlhQOVm9DkvZ2NnuKHBdIbHDG/VUwDOZ0AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hmnVXbUPq2FiqTmRJYwe7ycBkr0OUuTaM/7oorzD+dQ=;
 b=FmtAUCz0TIl2sgcEYZ1aOkC2oCByaGpcWT5qlfnOIGbyMsejjd5oRX81TUHJINz9aTk4MNLuQZBvcPDNOZB1htF20f1tjaTAsPLGxpHhibbC4h8XFpp8DIYhHHVn9fB4K6aqs33c1bTBVK5mj1+IekHwZER2yWhQHntjkgDtLstYFNLHXpH5NRdejxNvo4XQPalRTVhfPpvXGSkJpIrzKfrnX13+zZ336u2haRTztvoS+F1xyRDcgnvsM4vN9z43rCEIGmkF51Ze98DN0fs+Kq4cjAGMC0XLmeYNGMQvqxRT/0bs9SPd8VexBZQi7fmTuyFRN8lrZ1BcdrDhyAXofg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6006.namprd11.prod.outlook.com (2603:10b6:510:1e1::13)
 by DS0PR11MB7214.namprd11.prod.outlook.com (2603:10b6:8:139::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Wed, 12 Aug
 2026 06:52:50 +0000
Received: from PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd]) by PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd%5]) with mapi id 15.21.0292.024; Wed, 12 Aug 2026
 06:52:49 +0000
Message-ID: <4b311faf-6269-4904-9658-9ef6f6b0114d@intel.com>
Date: Wed, 12 Aug 2026 08:52:44 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] ASoC: samsung: aries_wm8994: Drop redundant probe
 error messages
To: Bui Duc Phuc <phucduc.bui@gmail.com>
CC: <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Sylwester
 Nawrocki" <s.nawrocki@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>,
	"Mark Brown" <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi
 Iwai <tiwai@suse.com>
References: <20260811090550.38930-1-phucduc.bui@gmail.com>
 <20260811090550.38930-3-phucduc.bui@gmail.com>
 <cbceffb2-e573-4c4d-a81b-e6f368050c2b@intel.com>
 <CAABR9nGxPv+XUmaRBUoS=sU3vaUdfRT533NyqZFq5fGkTzz30w@mail.gmail.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <CAABR9nGxPv+XUmaRBUoS=sU3vaUdfRT533NyqZFq5fGkTzz30w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI4PEPF00000159.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:808:1::875) To PH7PR11MB6006.namprd11.prod.outlook.com
 (2603:10b6:510:1e1::13)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6006:EE_|DS0PR11MB7214:EE_
X-MS-Office365-Filtering-Correlation-Id: 5af5faa3-d098-4c8b-f77d-08def83e52f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|22082099003|18002099003|56012099006|11063799006|4143699003|10067099003|6133799003;
X-Microsoft-Antispam-Message-Info: 4neiMvjeXsI7ti6wzJJipU0RT1nx6+YDtx4g74HBIgTkTCoZ1pHt/puMUJ+IFW8UopkGWFS0z2gulBq7Q0vtT0/ppSNxWv92/I8FJ13+A6oG7cMJJ2iEOvHUvRL5HAjoLuJpbtChRinE/rE/Cl0HY6b86PqL8C3+Vrbgxhw1vpDznj5M5vwcZno8KLwMxagJWTl+Y9Zy9NJSmfupYs70QcTsEFJjt6+IKrTomksVQ1D8NNDPipxB7xuZgK5O4uhuZ9Xq6koo8vETb2wbvWmfJjxLB9X0jS7h2uWrRJmOVYbTwC9MWbE6+I6uL03ziUwLnUR3mp8ynZ1NiPGdm4CnUvGvtQfNseqo3N8MvjdeP58J99IO+ZB9ji60FF5IFxbBvthQV3WIGGSiIw71PaAVx3GRcH+6jpVsoqBctqh2xoEJoJXfiHVCt6qcdtDQhDxGE23eZWy7JptxBoDePX/3yk5d+eKSGiLy3zb2EQpfsT7gUkVwpvhKgqV8hmlK1RM2h4HFkQGED5JGS5qbqtptYJ3B4zdaWwjLyR9aY+plbJljCWST9i6xaPELL/ngsikJerc69SrMGSgiqROJz+fA6LT/dmT/F6MTn8VFIGNjp5NdPMYebVEbQRte5JyyDfLR0MFAIRwfwkAddYTN02+qqA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003)(10067099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TTA2YXRqMEpaelhNSFhFVWJwa2JON00wZjJjMzZVbzdGTEYvOWxjT2ZadWxT?=
 =?utf-8?B?SExYeHdsaXRWWGlIRTIxRkpUVlFhVG5JY3c2MVl0YjEzVVNwZjd1NGpYZjRp?=
 =?utf-8?B?TVNnTURqY1I3ZWtUcCtuVExkL0daSGRGTHp5KzlFQWNXZGgrN3ZXY1R0ODJK?=
 =?utf-8?B?Zy9jQjY3bW11Yjc2OVZQcFNTMGZiYXd4ckI2ZTlnSDkwUFEydkttQ1FQdXNa?=
 =?utf-8?B?ZEVhNldERFBXTnF2b3hVQ1NZcm9WSUJiZ3hxSldZdHR6cHZtSGNlUE9rRzk2?=
 =?utf-8?B?aGE5NW44YURKd2lqOEErTEl5MHpmN0lDM1loU2hUWHNrYXF5TVRPWUZZR211?=
 =?utf-8?B?aGltZ2UzaUxEOHNJVUkwR2pFZS9VS0R2MElaK28xcy9WS3VnbVdKY1UvWXFX?=
 =?utf-8?B?ejhlelJ1UXBwOEt4bityYzhiZ00va1ZZYUxrWUJEdk1lbHJYaEhUblIzRXRZ?=
 =?utf-8?B?TytSd0IvQ2JSRXduQ1N2RFl3Yk9vYUdVVGZCQUJCYmIzc0llWVNXdDdUYnNx?=
 =?utf-8?B?d3pFTmYyNVJ1ckozWi9ta3psSEtIMERqRlVhaW5VZFpFdFlkY2JFMGh6dzc1?=
 =?utf-8?B?YlozMVgwMGQ3c1JKcUJhb2JEMEo0bGNSUUlCOWxQVThlR3ExRWE5Z3g0ODBj?=
 =?utf-8?B?WW1ZY21zcUVXV2VJUDlZNkphOVFaVTY1S095SnpZSEhDa0sra1VySGRtYzAz?=
 =?utf-8?B?S3NrZnVNdFFSWEVzMVJvOUY1Q2RYTWJZUjRmbk9XNWtXaE9td05SaGZwSnRB?=
 =?utf-8?B?VWNqbjRlOU9QR3FTNzFlZVpMQXZyYk80YzlKaUo5c25SdWxhMTl6RjhCdzRT?=
 =?utf-8?B?d3FZRSt4MmNHWldZTjUyNmlYaThTZzhzUUxyQ0ZneGJjWjBGL3NMY2FqRVdp?=
 =?utf-8?B?VEoyNzFVYkhvSnZ2YzhVUGVEUDh5d0QvWm9DdHVjaElwSHBQNnl6VDk1SXhD?=
 =?utf-8?B?bXdMVE5CTVNkdnQ0d3B6OTQrR1JwTi9wOUdBRXlxbnJJVThOT3kxZ0RqM0ZZ?=
 =?utf-8?B?VTNYWit0NGsvS1hUQnU5QlZYQ2JzNVNHL1c1UDRSTWFlM3YzejFZODNGQVFN?=
 =?utf-8?B?OUw1aTlKNXY0Mk5RdUJsM2xZQmlDZnA5eVR4WmFZWDIrL2gvVDgvL1BhYmxq?=
 =?utf-8?B?ZFBrMGdqeGVlck1jaCtPYi9CZVA5WkMxdjBqeHUwc0R3OGFQejlBQW44OEFt?=
 =?utf-8?B?M1UxTVQwSzFKdEZGMit3QkYrMEI5N0pwTEVPVEhXejdLbytmdlgxdm0zd1l2?=
 =?utf-8?B?bUFCNytEa0JsekFoOXEyQ2FtVUtxWmROYWN2OXJKQlp3cnZOWklDUFJPVGQy?=
 =?utf-8?B?a0FzN3R5dUgyNU9SUmtmQlRVVnNtRTRYdllVZDRnMFJLdUFVQ3ZlM242WVlH?=
 =?utf-8?B?alp5RExUanhpMmczYjZmVFVTYkQya2VTVWcweXlmWURnc0lnRm5jZEYrK2tE?=
 =?utf-8?B?SjE4M3NSNVd2SjQ3WUpWMUtlSWF4R0l6eUlkUGRFNzZyUGJMZDZ6ODByWjBC?=
 =?utf-8?B?WVJpSFI0bkV4R29peUxqSzJiVmVXWWFEOWVhaGYyYkpjZHF6ZXlTQzJraE9v?=
 =?utf-8?B?VHJaMnk2ejh6N0lDcVQ2QkZEQXBRdUpxQllTQ0IxRTB5eXdTR2daZlpwMjZQ?=
 =?utf-8?B?RXJJQXNPT2VCeThmVnRST0V0bENjZDU0RGtvM1VoVEdNSXZXei9BNm5UZE1w?=
 =?utf-8?B?aXQrcnJ5SVdwTGpyRitvRVNpcDkzbEZSbFdsSTV3L2x4ZHhxRDhQdTBOYlpn?=
 =?utf-8?B?cllDejRXZGowTVVqdk9JQUJ5S2ZMU1VvWWk5WkZyQ204d2tVczNZNGJnK25Y?=
 =?utf-8?B?T3REZENBREk3cXlJMVZsdWxhTWM0UlZoOUV5WnBWeFdkZWdzM095Z2hHaFFX?=
 =?utf-8?B?S0dTc05SWUVaNTdQU0IwbHA1dy84bkpobExhcHZvRnM4NjR6MURwRUtYa1Ir?=
 =?utf-8?B?QWlKR1V1SUJVR2ZsbVVtYWl5WnZ1LzBZNWVuMEFoOEFFc09SK1BENDdkY3N2?=
 =?utf-8?B?ZEl1Wkt3Y1ZLbVFPMkQ4WldaWlBGNk85Ym5OQiswR2Z4anZYYWRDaXhHdlN4?=
 =?utf-8?B?blUzN2RSSU5JNmIyOXhPVnhBRXUxUWp4bUw3TUhGNGxHT1g3SW5JM2htNkFo?=
 =?utf-8?B?NEljL1VleXI5akhBWE02VzRkSTF1WDdhaXpRYUErdnVieHQvb0dXbWxERXhC?=
 =?utf-8?B?ZEpxMitSUFdvRVVFa08rSnY3ZkZmN0txT3Z6THZUazdqdWxHTnZqai9ERVFG?=
 =?utf-8?B?SVJsUVFxUzgyYU5qdHc1d2xwRFl5ZkQ3UXpiNjVkb1hleHpuaXZmVlVQUnI5?=
 =?utf-8?B?c3Rya2lkMklPaFU1Zkh2OHk2enh6VXI5QmdneWIxeUp4eDBBRzNzNUVtL0Ns?=
 =?utf-8?Q?hwiL0mTALHc1vEj8=3D?=
X-Exchange-RoutingPolicyChecked: PgaSOK4jCOGjbUEskzAUyMdFH70FHnf1R8pZa6mQxsaTSjshNJzW7Rh9/QkgTa4K+yeJW9NJQv4x92JJHeFr0kb15hLRPau95GWAAQXbfTtb5tPsDH6cyPEzJwvk56CYBxJCIIqkpHevrPkLSAJJtlDbGBVJGJo6peYg6z7nSXcXAkNKN0MFZTY4/dwZdXPB60DKqHWeosP6cQrd70WFhVhexRkmqAuD5jZdadKpYovC6kx1ql6Q/E3fTdg9CbQj+5IvyWMF/1w+sL8OIfvv7ORtFxr0+tW3Ha23CNwXdarrRY+Uv6NuCC+xqsBum4y5s+W7srqGdDb1GPScU3rJbQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5af5faa3-d098-4c8b-f77d-08def83e52f2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 06:52:49.8268
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2ISEb3eviQmNvQ/Fn9vgy68h+UQYClNfXer5XnGVl0oslMTKeANz1qhpPwof6nXDX+f8jdyULLZMgdESIUgFcqqRajp5bv7JUT+qaR6/M1A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7214
X-OriginatorOrg: intel.com

On 8/12/2026 4:59 AM, Bui Duc Phuc wrote:

>> To be fair, xxx_snd_soc_register_component(), both the devres and the
>> non-devres equivalent do not report anything.  The
>> component_initialize() and component_add() do though, most of the time.
>>
> 
> Yes, you're right. I checked and all the error paths before returning already
> log an error, except for -ENOMEM, which by convention doesn't need to be logged.
> 
> I'll update the commit message to clarify that the error is logged deeper in
> the call chain rather than by the function called directly. Something like:
> 
> -------
> The functions called here don't log the error themselves, but the
> error is already reported deeper in the call chain, so the dev_err()
> calls are redundant and can be removed.
> -------
> Does this look accurate to you?
Looks good.
