Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 574DA27A461
	for <linux-sound@vger.kernel.org>; Mon,  9 Feb 2026 14:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770648228; cv=fail; b=SrcgoGuhXFh88zR2YJp64XMVMJjBV6u6W+Mxhty/l0tsF85JzVXGohf0I9l+Rh/9ds7XXPzTy0/dav9JGBE/zPCDtfX+TqG5Ncf5WEnxhxt2vXY/1hWbE/McFY+5mAuU0F2cFATgf+WNW18Ke86cPBuE2Vd2AeXx5sSGOeHsSBg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770648228; c=relaxed/simple;
	bh=G+lUeBt1ZoEtp/ZMbpKOUdlJlgNNWK+kaJi5UB9+skI=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=hboqeP18HvJZXLQ6Erz/omLpuh51rT2/OyGlhvV38NCCqbMv+1UTkFMOaKFm7vgPg/M5eq+BvGM1KHWpCWpo0s1qt904jlgPcC432It+ZcQbcTBXGCuiv2zRp3jg9GwlOJ9EGoXn5D43hvMXixJWvpz0u41Rt7c61sKz2p3ruH4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FbRZ5M3e; arc=fail smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FbRZ5M3e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770648227; x=1802184227;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=G+lUeBt1ZoEtp/ZMbpKOUdlJlgNNWK+kaJi5UB9+skI=;
  b=FbRZ5M3ekTJ69xklBIFWhFLj9A5lETBnENVcHK0eXRfJkWEBYMWowLSz
   k0PBugbQCh2c62xkKITUssPY+60EKRPuwb6SASvs5+B6SfSf5rRomJBWE
   YGPwXo7CQ0RE+Tp0XCvPla2Bixri6sUc980wQjo2X8Jj/HTIH5pYRl6ec
   vyTkoYaZinNC0XDYjcZ58CbvrCddymaC9D8bdi8NdyIqVdNz7KMY3BboR
   9T8QUu4XvwF0RAw02nnh3UAsDqPLeP5wDI/9mugrqQH1TdkpU1oEr49qM
   FVoHjjOGvDd2SOl+DjJuZuPiYPM9OHpUTYrmM8BYoKDO0wdm7CmKpFZo2
   A==;
X-CSE-ConnectionGUID: BpKQxHMfTbeHpXreEniWmg==
X-CSE-MsgGUID: 2P1f0WysTxGRoEyNP2Oyrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="71481608"
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; 
   d="scan'208";a="71481608"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 06:43:47 -0800
X-CSE-ConnectionGUID: WHoPZ3ngSDiw5+csKk1e3Q==
X-CSE-MsgGUID: 12vHlEHFSbawKRcHTBKnFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; 
   d="scan'208";a="211615593"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 06:43:46 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 9 Feb 2026 06:43:46 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 9 Feb 2026 06:43:46 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.12) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 9 Feb 2026 06:43:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UNW/Wg1xjVGuTbENNVHt+QGhizuAk1yJyzRjYoQvXRhqdensaxUt6AlP6Jk29nBY4w3c0d0qmdJrmLgrJLLCdM6ALYEkUczoTadLHKO/T1SWpQ2ChMJGe8PObAwgrS3WGw3hPf1C9VGJItqc+yFWTqomSs4eBe65k89dKxbJ9MOa1kXpdCUWx4lHYNi8v+q+qjXtXsndSY4r1FW6jnMqw5oY8c1i5EF+h8mZqPxHZiYeQCjl0FNE/vhpISsm0TxiQsncNrKvO0l0YOy81BYH1+9onikQUNGLiR8ZOrT5F6ImvBukyajQcILSIdYw5DdX3mKyP5TxoJLtVw6sEibuGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Vn05eNziXzTEcxCNRFRsAr64LOcCzP8UoMy/kxn0TY=;
 b=CK1O/XL1hLv3kUsI2UZUIFCA4qkwZDTgJa5zjp2kXQWEbI07AEbbaaR9JUAPwN2x4EXX9H5AeDLyJLQPfPOnVrsQG6nU3sdg/M4ftmyy539FYRrEwRxAFGTu8SpuWk30tlRD6nWFcnktiQBnVYT6YZyjVN3n4gbzqR5tPqoXgD/U9EyLJZg7g5g5SV81/y9Pig4ACzD2DdvbvKlH9GhvHj9Lam95qTOIKCKBURQBs0ZqUMxvVonOc2E9qketyZoc5+TIll9mxJx98pScaB9AoNh7YPyw40MoKHAN22EEMQpmMLgO/vFe/7l0fWg3/mCJci7GWzJzXVRQAdP96EbFtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8283.namprd11.prod.outlook.com (2603:10b6:806:26c::16)
 by SA3PR11MB7979.namprd11.prod.outlook.com (2603:10b6:806:2f9::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.14; Mon, 9 Feb
 2026 14:43:44 +0000
Received: from SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::d18f:6b38:584a:214]) by SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::d18f:6b38:584a:214%4]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 14:43:44 +0000
Message-ID: <5979bcd6-f066-418e-920a-8d127f921ba2@intel.com>
Date: Mon, 9 Feb 2026 15:43:37 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] ALSA: control: Verify put() result when in debug mode
To: Takashi Iwai <tiwai@suse.de>
CC: <tiwai@suse.com>, <broonie@kernel.org>, <perex@perex.cz>,
	<amade@asmblr.net>, <linux-sound@vger.kernel.org>,
	<kuninori.morimoto.gx@renesas.com>
References: <20260206113250.207179-1-cezary.rojewski@intel.com>
 <87ms1m9htu.wl-tiwai@suse.de>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <87ms1m9htu.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR04CA0060.eurprd04.prod.outlook.com
 (2603:10a6:802:2::31) To SN7PR11MB8283.namprd11.prod.outlook.com
 (2603:10b6:806:26c::16)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8283:EE_|SA3PR11MB7979:EE_
X-MS-Office365-Filtering-Correlation-Id: 36baa5cb-a724-4819-1415-08de67e99fcf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V013S2RONUVFTVhBMUVha3ViWGZLVHFuUFV0elRqK3JxSWlUOG1WWHFwUmt2?=
 =?utf-8?B?d1UvY1ptcVpnaVh0V1FQOGtGUjZ1cWFnaVAxSExhK3RzRW1UdEZYWGkza0NF?=
 =?utf-8?B?M0NTVUdnbnFMZlI1K1RIeGZUcUtPbHgybHoxQytWbll2eHVQZ0ZrTEdIUjhp?=
 =?utf-8?B?ZHZBaTZ6UDRoT2NBSUFPa2dWTXdNd1doODZGdlpSSk9lMGl1RDNPZ2tHaUUw?=
 =?utf-8?B?Zk9mYU9nNkJqM3Rsa0JQczgrSEY4N1gwaE9Wd3VlR2p1VDJDSTlESkpRZWRl?=
 =?utf-8?B?UWNDY2d5cG5RdHRiNkNvRmdwWmRiT2RObk4zMzhiZ05PbUxFajZKK01NaDUw?=
 =?utf-8?B?MHgwSlMrRWhUTmFoNmhXU0FZLzlYenVNcUsrdjZvNVZGZXBXVDc5bllpVjJj?=
 =?utf-8?B?SlFBcjdVSDFBZTByQ1lORWZDVG9UaXBSZUJJMHI1TTYwT252SHB0eERCcjYy?=
 =?utf-8?B?a0ErUmo2Q3lJVDdid2NBWVk2Z1BlS2kzVjhnQXU3UWdxdkltemo5STl5QVZN?=
 =?utf-8?B?MXR0M0draGlGQjEyeTdPY3g3SFpEcXJnK1RCTDRodXp5NzA2R0hjQ3VvOG1O?=
 =?utf-8?B?ZzFTRmdVRk9NRmdnV1Yvd2E0eVZkYWZ2ZTVLSlJlS0pnK01kYTRHazBsNVdo?=
 =?utf-8?B?SGhITkVXRFh2aEtlUWlkVkNoWG5qKzZyUnQ4RG9ZYm9FRGx0ejJHQVFuZjZZ?=
 =?utf-8?B?aEthSjAybllZZE9ZMk9kdVRnZE12UzFqSTNIZTR3SkZLZUZ6VnFvK0tLemwr?=
 =?utf-8?B?NDhIaHNlREZXWExIeXBJWjliRmIwNnJldE5jancybER1WlVLK3V6cjZGS3dL?=
 =?utf-8?B?aDRUVnVkMjRENmM5eXN2eE1jbmhLRmN5bUFMQVRkbWZIU2Ntd01JV2Rkdk02?=
 =?utf-8?B?WlR2NzZQbW13SktTbnFBLy81MExLK3JrQXIraHk1ZGFDNWoxUDBiVjZEbXY3?=
 =?utf-8?B?UDlmdC90bVJDb3dlWE9zdVArNzZiVkgvblpCOHd2RUF0c1BvS0UvNHVVS1V4?=
 =?utf-8?B?aDU0TVdpclQ3dyszb21zaFc5SVhEK0k3VGxSaEMvQ25wdDV4amxpYU9CaXZE?=
 =?utf-8?B?RkQrUG5lUDNNcS9kdFZTbzRMMGQ1dWNOditkdmE2UnJSTE5vdmNpekhWQkV6?=
 =?utf-8?B?djRpdWRrK2RHQVhHdHQrQUc5TXlEc1g4U1MrWjd1dS9ZcFlNQ015ZjNQWWkv?=
 =?utf-8?B?Q29RdFljeE9ieDdoUVFYREFieGFmTDMzV1JwY2FOeVozZlZReUFtRHhZLyta?=
 =?utf-8?B?RW4wN0JXVTViT2JiNjY3SU9tY0hlaDNzMC9aVW5FVVZudTJaNFBtWTB6Q0hG?=
 =?utf-8?B?aVNVZDJObkVYbVQ5ODNyY0IxUFdYZEZTNHFvQ0lFdTcxNWR1TFVwVXQrZ0I4?=
 =?utf-8?B?bmRqQ09QdnI5UjVhRlpOVEZFNU9zMGd1WTVocUlYL1NIbkZpMHg1Yk9RSFdM?=
 =?utf-8?B?alFVUlByWG5RU1NBRnc5dmZuRUpBR0oySFRidzdtcXNFM2RmMHh4VVM5bWtB?=
 =?utf-8?B?TjhkTFYwZ21lcXhxWkhWYTRGMEdhYzZPQWZmMnZaZVBZNXh6MG1DL0YveVE4?=
 =?utf-8?B?MUhqVU8xdXN6OU95TFlMajhYVXQ0NEpWTWU1elpwUDhoSVVlaHRmazRIMk9C?=
 =?utf-8?B?NHVZMzNvTWFSRU14dDd2K1dMbDR2a2p3TjI4Ym9BS0dpWVRDcVRVOEFLTnk4?=
 =?utf-8?B?NnFGMlM3SGtHNHVodE54MXNLWWNOcHhHMVJTby96TGNHdzBzMnZjQ0tTRUpk?=
 =?utf-8?B?b2VhdHNTNWNiSzVWSm9nQUVyL2ZnY1FRcXRBOUtOY3FtQ1FmcWY5UVdpUHdO?=
 =?utf-8?B?UXFMK1V4MWQxWWNqQ3dIR2RjM0pYcHpXMEtjMUFEU2IvL0htbnJvaEpacjV0?=
 =?utf-8?B?ZGlGSlBjWUFZd2xIRG5EZDRUWmtpVFM5VklxdEh6L3ZRRlJrdXdyUS9UOG1s?=
 =?utf-8?B?M1JzazF4dmFiWkNVTUZOd1RBbTNHZSs1Y1JHSFF0UDRvWDM0YmlqbjVWZDE4?=
 =?utf-8?B?V0VUK1l0clVGOFpPNEIrdWRZU0lGL2FBek9sUjQwTHNVU1FRT1NMVHdRS1l5?=
 =?utf-8?B?UnNFM2JieTliTlFNVmd2eTZOQUNoK1ZMUitObVkxSDlGSHRrb2ZteFpRcTdJ?=
 =?utf-8?Q?qi/g=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB8283.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WUJlOTBpSWE3djNGTzFrTVI3ZTN4Y2tDWnpYaG96Vm9ib0Q5N2N4L0JzUHpE?=
 =?utf-8?B?RGNLZXNJL21SZnV4Y2Yyb1k2NjVxdkNRUG1YS3hJL0ZIalVCWDZITUorUXV3?=
 =?utf-8?B?QVEwTTRqek9RWkcvOUJ0ajVwM0JBZGhOcmM4RkhtNmpWaTU3Mjd5cy9OQmJv?=
 =?utf-8?B?NkZ0cFRTdC9LcG5sbXhwUy9OeTNISHMzYUpNYndXNXdFaG5qRXBxWnhabXRm?=
 =?utf-8?B?dXp1WUV4WXcrZ01yemZNSEgyaXZTN1l5YUxqbWVhTTNaWkl3MjhrV0RTa2sr?=
 =?utf-8?B?TFdtV3owVzFhWHZhRmp1dVVPbFhhSTJpa3NOTi8rdEFleWJIZTVvVCtSTS9C?=
 =?utf-8?B?a2kzS1Z5MGJVTm9ObEw4Skt6T2V6dUYvNlQvZkUxb0JSZXRoRmJrTDlpd0pH?=
 =?utf-8?B?RHdtOXVUeDlIYjU1MnIyTjRuU0d2T0Y2b3lWeHM1VGNBSXFEVW01YWZaZmxt?=
 =?utf-8?B?UUM1MmJQQk9JYS9zcEZmK0hLZFFxYmt5RDZkYVQrN2RGdW9BS0FZMlZLOWdR?=
 =?utf-8?B?MEV2akpzeko0MitZT1BUNjlnQy9Cc1dBMG5PODZCY1JkTlNTU2FwS0xzRVFR?=
 =?utf-8?B?eG1tRTRWM2ZxNHBGZmFjdEVTQVFRc0wvekhLRklIWXB4bVBhdG1KdHd4VEVI?=
 =?utf-8?B?QjNqU051UXoxajZqY1pQRG5wZEFYUWtBeDBWaG90R1U5bVN1MDhYMEZmZlhq?=
 =?utf-8?B?VURBYWZ4YUpVQjM2OWxIT1R2d3pJaENJcDhhNjNuS0dScHV3Z1pOL3ZqV2NS?=
 =?utf-8?B?WmRkSzFkTERTR1JlVUpuN3F3eDRjOFR0RGVLRWVUNkJtUE15ckNIamNnVEVK?=
 =?utf-8?B?WkUzbkVOMTN2bTNyaW4xRGx3TEFZdHhoU0JXSnl0TGE5eGlVcFYzeWhXU2tE?=
 =?utf-8?B?QXZOY3BQM1ViUlNoeUVqbnVQNGNrVmgyUmYzYmw0OTFRWHgyME90NHoyYjZO?=
 =?utf-8?B?Y2R3U3hjMW9RTEw3ck1YQ3dVakVNNzBBdFFENFcxMXY5OUh1NzJONVBZS3RV?=
 =?utf-8?B?dXpSZXN3ZG9mMElYVmtWNmlKODNTamVCcVo0aE1YdUN0eGNkeXRud3RwNis0?=
 =?utf-8?B?VlBpak5tVzBRWDd3M0Z2U1NRS2UwUEp6aWx6WTZ6RFdhZUJRZUJNZklBc0tx?=
 =?utf-8?B?OXEvdi9zWlc4OC91b3cxODdlUnBGQXB0K0JWdk5QMHFURHA2T1pSaWF5dXNh?=
 =?utf-8?B?Mk1Bb21naldGRmQzWER2WmNjMWpXU2lUcmUyLzRwZ2ZicWxMZ3V3M3FPL2l2?=
 =?utf-8?B?K3QwU2RnT2w4WkdpU2p1Z3I4TmE4OW1WbFN5d3FYbGlyUEROQTMzZkJLU1Rv?=
 =?utf-8?B?SHpqc1lTaXozUS9yZ3ppaUhHTkpmWVg5K3Znbm5MNmwzQi95dFBPcE5jczRj?=
 =?utf-8?B?c3lKV2pWZEs2Wjh3ajV5d283b2ZhbU5XUUFtdkxxVlArUHNxcE1HMmR0WUpV?=
 =?utf-8?B?bllLNzhITWlHTFlHTkt0eGR3a2tJcldibmNSRFRISDBRbi9qS3NmSlRhSzdL?=
 =?utf-8?B?UTVqaTQyQWdVbVNwRFdSbHRCSCszQlVQVi8vQWtiTmpPdnNTV0E2eXRtUW5D?=
 =?utf-8?B?eFRjRmhwNnFaY2RObWF3RlAvMFY5aVNHd3ZzdUlzL3VBQ1d6dS9wVnFVS0lC?=
 =?utf-8?B?Y3ZSM25Zb1pFME5zeXBzcFUzN080b2tiUU5abERycE9HRHRGNG10SkJjV3hW?=
 =?utf-8?B?L3JNOFRiUVZGZmJBWlBmamdJM0FycmhHWkdjc3ZMSE1kWC90bWRlTlRsNG1a?=
 =?utf-8?B?SXJySy82Sm9nUG5CNENMMmJZSElaY242aGNzZFE5T0FjRUUyRHhjd21WRmMz?=
 =?utf-8?B?QkJXQnFOUk1HSStYWXdKd1FWU2dtY1JIS1pqZHFnR0dja0krakxNbHZpZldr?=
 =?utf-8?B?Q3ZKT0RMU0ZkNkI5ZTJqTk1aME5tbzBnMjcvdHJZNDJIbFUzak84aEVsQ3pZ?=
 =?utf-8?B?ek1DRjlaSDNIejZJTExCMFZ3eVppUU5QWmRFcDB1T28zQ1VZRDZHWnhjeTNY?=
 =?utf-8?B?QlUycm13REwzbHFUS2FVNWxndTcxczJ6OWE1NG1EZ29UaEJUSWdhQnF3eXcr?=
 =?utf-8?B?NlU3d3V4STVOWEJvTkRIdWdNQ0JINFJvYXlZbGhGUG9CY1ZuOU5vVnJ0a2VL?=
 =?utf-8?B?Ym5UeWt3cW80TDBLcFd4RHBOb2M1QkczVXZwNVRnZkFJZzMrTnJSZmRBN0p6?=
 =?utf-8?B?VWIzOEVvckRFWFBOZW4xN3RCOVl6Uzg3YU1jemZDam1IRk95N3FlYVJkdFRn?=
 =?utf-8?B?eVZ1bjJhdjNvMlZlUk56aGRuZDN3VUZEVWJjcmEyYVJNWUMwSXdIcWJ4OGRz?=
 =?utf-8?B?aUNzUTdjVW8xR3lRdFRuWHJRT1hnZC9HeFQ4ODJ5N1pxcnpra1hoYXpFVDJR?=
 =?utf-8?Q?bY4DNyBQCkHgecQo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 36baa5cb-a724-4819-1415-08de67e99fcf
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8283.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 14:43:44.2395
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BPMHh18p6V4/2rM3DVfCxaG9YEGD8ntBEiWRPEln8sA8AhHGH0DRdW8sk8j6iNarJ+tlaifvalm3JOIp3vWkmxv0zrtfpH3vd2tZYm2RZxk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7979
X-OriginatorOrg: intel.com

On 2026-02-06 1:28 PM, Takashi Iwai wrote:
> On Fri, 06 Feb 2026 12:32:50 +0100,
> Cezary Rojewski wrote:
>>
>> The put() operation is expected to return:
>> 1) 0 on success if no changes were made
>> 2) 1 on success if changes were made
>> 3) error code otherwise

...

> Also, this message doesn't show any relevant information about which
> card, device and which control caused the error, and that makes
> debugging harder.  Put some prefix to identify the problematic
> control.

Quick peak to what I'm currently logging - output from 'cat trace':


#           TASK-PID     CPU#  |||||  TIMESTAMP  FUNCTION
#              | |         |   |||||     |         |
           amixer-1177    [003] .....    97.421022: snd_ctl_put_success: 
expected=0, actual=0 for ctl "Master Playback Volume" of numid=1 from 
dev="bdw_rt286", card="broadwell-rt286"

           amixer-1181    [003] .....    99.065279: snd_ctl_put_success: 
expected=1, actual=1 for ctl "Master Playback Volume" of numid=1 from 
dev="bdw_rt286", card="broadwell-rt286"

           amixer-1185    [003] .....   144.007205: snd_ctl_put_fail: 
expected=1, actual=0 for ctl "Loopback Mute" of numid=5 from 
dev="bdw_rt286", card="broadwell-rt286"


The format for trace_snd_ctl_put event class:

         TP_printk("expected=%d, actual=%d for ctl \"%s\" of numid=%d 
from dev=\"%s\", card=\"%s\"\n",
                   __entry->expected, __entry->actual,
                   __get_str(kname), __entry->numid,
                   __get_str(dname), __get_str(cname))


kname = kctl->id.name
dname = dev_name(card->dev)
cname = shortname or longname, shortname prio

Is there something still to be added?
