Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD1BD3AAF44;
	Mon,  3 Aug 2026 20:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785789773; cv=fail; b=RtYFXdqnFnVHyPJMWqaEeLLMgwO0e2oAS2zMt2DBEupHPXXSYJ6WjjQuf+l5zMUQOPxMk+u+bJ9RqfaFDTRQ3HoRbX47XW7MllPS/ooW6YGjg5q+aXQ6P9ddpZxE8dAzwb/L+qkVdjpyBTe+knbdAMTsXzrWtg0Ir3xTh0o8FZg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785789773; c=relaxed/simple;
	bh=VbV//wH2/aOQrmgLD3mBz0ZX8iOxNB4qGm3hfMwd/8c=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Xj/FoMWn7mtxi2sHzKZ3st6JLqRN4EC+JlkvQZdg9yAvkPpUocS9LREiJZqQ+8D+EOO5UIXWgxNGkpCeJV7WWZ8M1olxeOqeCE0xMLxM7oV+vOb5woFkKtwgZNb5jG8zRG/KAL8SKHz/Wk/dx7OBFIRtulVUwqcK3Yvwz3UGrYM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gRKg8WVm; arc=fail smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gRKg8WVm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785789772; x=1817325772;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=VbV//wH2/aOQrmgLD3mBz0ZX8iOxNB4qGm3hfMwd/8c=;
  b=gRKg8WVmBgeXLxNP3DCiVXt39uSAMet2Wq3XhkeoJX4jIxjJbfwyo455
   RrCSX2QdCdfKueSJpQZEXOUzUctuDGCicy6sBe0POm1/sxLls2YcTR0/x
   pyKHxnRU3wMrYAtWV+MkqQlUEpGTjfPJEERWBpUOkzHWwvOFi71FGkzC4
   Kj6419rdu6R85kntjd2PXxBh8nGK/9Sdtp1Zqmj+LHbV6rOpRz2d5yZPP
   TDMX+SPKDCU6ggbP4trJKziVoA3jYfXZx451KpEbKamD9EE5SqjBOHixu
   sApxRQKUfNY4zJiNGNH04+18O5i9Ib/S3B3fD77iYIJvY1qzDMQJF50oF
   w==;
X-CSE-ConnectionGUID: Z/1oOTUySKaCpK8a9OjxjA==
X-CSE-MsgGUID: lUQJRzkJRjOZurxNDdrc4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="73872351"
X-IronPort-AV: E=Sophos;i="6.25,203,1779174000"; 
   d="scan'208";a="73872351"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2026 13:42:51 -0700
X-CSE-ConnectionGUID: gAd9YXuUS2+ujJsQfIo1mg==
X-CSE-MsgGUID: RmPo3RnBSiawbRsFnB1PVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,203,1779174000"; 
   d="scan'208";a="257429505"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2026 13:42:51 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 3 Aug 2026 13:42:50 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 3 Aug 2026 13:42:50 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.53)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 3 Aug 2026 13:42:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Di5290Po7XF9eaqHGgaytC2pSnbvcwlbwA7vxoUYyYHpQXU+ZaJn4BTmRQoo502beNYU5EYrTAmqiuVLK9xpa6/8ka4bDMMZx8/S20JOZ0UsP/DHDd+JT7FDdqiiDwvwT3OukjWam+BBCdYK3sxBEPGXexSeH8BTbMiLgW33xWphZTUQaqZt8pzUIjIGcpDPfBfVhhkzs6OZPyTtldQGCazD3BrkqOPc3zRzt82GmAewkWNfLWK1ul6marjbulBZ84U4QU8jaAga2JJKibwWZMxx+2qKBsvbIpeJfybMDEKW1Jb2xyy3LqNoS8YAb6epB6lVVH8jCsE24IcnLBrdtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=keO7G/Y4pSichb/TGAQPrG5Mt5x1GGB5hhS1du2/APA=;
 b=vk1AwAGCVNkVB0O3/aMeFZpavxS39kiVmu9PG4aD7aA1wimXQd1vkb562vO1OsKbFKoAyPSpyM2B5HclDkve4rRO96QFMrAViY18e6M8BTVg5vwQPiFaOkPWvUWes/ZfELAIchQFibL3D+U1RXJzQ1/iYzMHA9WyUTP2L4/FYF0XGGOtMH0e1e/HI6w2x1n44CxViAVfejcc72yprQByy1a+kUNnpe8nIf+rj7Xo2r4zVwGb1YFperAMp8SzA51flrwvbAnNxEwPrtnmvZKraxqoX63IkH0BVTXgnw9PFUjmsVudMoGVjksmMYuNxRgrbm/OIOY3pbuA/pNbnqNLPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6006.namprd11.prod.outlook.com (2603:10b6:510:1e1::13)
 by DM3PPFF2E67D388.namprd11.prod.outlook.com (2603:10b6:f:fc00::f60) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Mon, 3 Aug
 2026 20:42:46 +0000
Received: from PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd]) by PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd%5]) with mapi id 15.21.0270.016; Mon, 3 Aug 2026
 20:42:46 +0000
Message-ID: <61910d04-6f6c-4c99-bc96-397163cfc31f@intel.com>
Date: Mon, 3 Aug 2026 22:42:40 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: core: add snd_BUG_ON() check in
 devm_snd_soc_register_card()
To: Bui Duc Phuc <phucduc.bui@gmail.com>
CC: <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Takashi
 Iwai" <tiwai@suse.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela
	<perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>
References: <20260803102739.55569-1-phucduc.bui@gmail.com>
 <f7c2eafb-84c0-4c4d-a359-8c80ed989c24@intel.com>
 <CAABR9nHynGR4TjdpGW9-sjEC8p1x4D8omq8ouPR6E-3ifDhBqw@mail.gmail.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <CAABR9nHynGR4TjdpGW9-sjEC8p1x4D8omq8ouPR6E-3ifDhBqw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0102CA0099.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:15::40) To PH7PR11MB6006.namprd11.prod.outlook.com
 (2603:10b6:510:1e1::13)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6006:EE_|DM3PPFF2E67D388:EE_
X-MS-Office365-Filtering-Correlation-Id: ad1b6db9-e304-4929-bc59-08def19fc60e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|6133799003|4143699003|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: WmK1Pw9mRdHrPe3q4NXrTN9JyVfmgOa2vpjxHU26Iaj3K2HhUXUGuY7wtAhukMXFhSbHnswhWEC830NP7aKI08VxZvjJHKa29SUocIN+S/fv00EqV+fCcIkomIkbC6bIDZDC+y/puNnOIuVr/orJWpU6w3dl+KqcgHX61pBAwGM86Ee2hcIsdA6HwijXStUeDkq5JESeBgtfNN84jYspnn0sdFzN5AaWpKZRE9b2o5IpAeb9E1RTb64kIN4oqvEvde6yeTT0oCETMnHVXQHjvnXk4tu1uzJHNrP4EHNJIi2C0dsD9rLpaAWcO+BT7J/tj1oxUc7/EJyHR5ET6iwE3rFBp+/Vo7eAqpj35Mh1v8gN8XUZwiGQHw706kUisNpfsp+iYiJvCeyW2DiB23hhvZUGVYXlI2aaNG+lE9gKq0mbyukD6CC6fy3fsXbyvfYG5hVxhGfr8Z7qLtDcjcw0ILBZMSf/8beati0m3lbLYDPCBm6BtbbHS3Rpb5kRutgnLGJqOY7u4SsO2Qu3zXePWBCVLe4mugHRo1LPEq/E8Og//LkUjcYuIqrJZbacpCIh2eG8SVsH3L0lUbR0Jr1MwKecl+48jC8xRQHbw1nC6lcL17lFkakxJtxKneE+mfsV+bYZcajg1jQstUnZbEesx9UNtu/kraHeV/a6HrHa32U=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(6133799003)(4143699003)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dm9nUC8zVHZDMENXS1cwRk5jcDNnMEpnMExYcDdHeXlnYUgveDkwU1hRanVm?=
 =?utf-8?B?ajQ4TzlZKzhJR0NPeHljL1ZWMEN4eThaRG0vM1Z2TjArR3ZXMGRSK29oMVBJ?=
 =?utf-8?B?ZjB5Q3l2Vnc5Q0Zob3lpcmN6V1VFWERoK0tJeEU5QSs0OS9RTnR5aTFmTTA5?=
 =?utf-8?B?Sk5XMWRNYU4xaURLa2l1LzlxY3I2QmRnTWdISWM5eTNpR2lRMjBqNk1SMHhj?=
 =?utf-8?B?a2xvd09PaS9wME5vcUVJOVJoRkxYUjVLbTJma2NURWo2U250ck0vbGxjYWNm?=
 =?utf-8?B?bCtaMWlvL0FXaUZnNHFHV1lWeWFWTldVanFac2FuSFJaSXExcVBFYjBFRzJa?=
 =?utf-8?B?MVhNMlllRktsTUEvOGZKRk1CZEQvek83bnpkVTlRd3N5bnBJMTBUd3R3MnBl?=
 =?utf-8?B?dXVwd1FXTTl3bndKV0pDOFVRNEw3bWdQWU9lVlpEUytESlp2RUJWL0Q2MVVG?=
 =?utf-8?B?WEZmcW5ib2ZPYjdmUHFLaVJQOXNwVEg5ZVY5cUoxbkVVMVIxb3VTdVBwYjg3?=
 =?utf-8?B?U1RrRlRHemFFaW9XbnErRGZTMUYyZUhJRkh5L1pHQXRHc1VTMzZJenlYVWJQ?=
 =?utf-8?B?WnpNdEJQanEvNm5tZEVJUWtxc2RLMEtKWHpKRURLeCtpQlZVcm1ML2ptaUxt?=
 =?utf-8?B?dWZTb0Mvb1NxSE1Da0JkL04xZXpXWkZrWDVVZVNFbUtUV1Y2R0tkTlVxZU00?=
 =?utf-8?B?RVVveWtWdmFZd3ZpQzBDQTZFcjFkNDJCVDQvRWZCV1VFZHFoYnUzVCs0cjY0?=
 =?utf-8?B?UjE5d0dJTmVzams3b3c2YmtVZXNxSmZyWjZpM3NmUGswTi9yak15ajdnOG1K?=
 =?utf-8?B?bG1qZjYvVWR4QjNjSndYaW15eGhUOCtGaW9mZXo1UGtvc3BBYXY0Sk43UFR0?=
 =?utf-8?B?WnBwcXprcUtnTm5UWmdKcFU1UmMvYzNXUStqRURSdHpzVFROdWhRSHNjUXdV?=
 =?utf-8?B?SmFkdWR2eW9iS3FsYytpWlFHZ3NqSzRwMGxRQ082dE1CZUJWVmIySjQ5cUpj?=
 =?utf-8?B?bkxYZEg5OUtydzZwcDV3N1dDUkpsNFQzT0lVeTJjSExqVk1sU2RMWk1SS2Qw?=
 =?utf-8?B?Q0V1dFkwcHZHdE16RXpEZkFlUnAvTUcxVzFubWdqbGdzbW5KRXBlSnU2Y2tY?=
 =?utf-8?B?bnlFMzlZWnJTKzJURlZWYmdudjFrditWNnNHQ3p6TFFyVXlYN010UVgxTzBz?=
 =?utf-8?B?dG1KandsNURROGZQdFIwTFEwSTkrY3lPamo3RWhTZGw5ekZiRlVNTytKd3lP?=
 =?utf-8?B?U3llTFpvTG9sNkxqVzFhaitNbnBYT0ttT3N4elhZbDV6UFFac1RadVArL1Zt?=
 =?utf-8?B?OTNCQzdZMHRoSDJrUDV0WUlzNWU4aVpidHVWRndNNTZidXRHNjM3Q0pzckE2?=
 =?utf-8?B?UFk4SEZIa3UxWjh0N0dramVqZEpyZnQyUU1IM0k4ZkVFR0F6OFBBUDRWVWFy?=
 =?utf-8?B?VkxzN1ptbmkvcFBQbHVOV2lGZkNVbE5WVEtMZ2R2dHRqSFlhNzl1b3lvcTJZ?=
 =?utf-8?B?aXJtbVZHbm1sTlA1MzV0VHM1M1phNU53ekNkMDl6dDU1U1ZUTTJRcXVGWGRH?=
 =?utf-8?B?QlJaZTdrQlBZQXpuamNOQ1VBSGlUVDljb25EWGRUbE43aUVycUhmb0lGLzJJ?=
 =?utf-8?B?aTl0RzVLS2dubjY1Ni9JOHlYVnBPTTcyT0JsZ2cxTUxCUnV0VDNid3RuV2xr?=
 =?utf-8?B?dXIremlpTmNrWWh3Y2VmbXE1UWd1dHU3NXZtRFM3QzVwOWxhZzRqZzJHbnBp?=
 =?utf-8?B?Uy95dUFWazQ1VURwVGZ0VWd0a2plZDlBbjB2TGtsSU9FcFI4eVpjZ1lOcmVw?=
 =?utf-8?B?cnBaTlFSb29hK1EvNWh0QnY0TUJBaC93NUVaRENGcG0rcjdUUVdRMWcyOXdu?=
 =?utf-8?B?c3BqbU1mdEFpeHI1T1p5OTl0b1R5dCtZaktKMUhvREFmN09YV1RaeTJxQ0Vj?=
 =?utf-8?B?ZTNTMGhSdGZHYUV1T3YyOGEwVDZXeVZ3aWxMNFFWT21senpYSnVQc1ZpM0RB?=
 =?utf-8?B?YXorYjFVUWxKQzJCKytYOGVtcituSG01TXRkUFoySWEwSjhWR0t2NmpCK2c4?=
 =?utf-8?B?dTlpa0Eycm1xNWlBNjVuRURpT2FQdUl5bkhYUkJqZzIvU3ZYRE5jam14WTRn?=
 =?utf-8?B?WGlBTEcwMnJHU2J3S3I1NTNHV3dUcEhwYjFuTFc2SzA3VlA3Rld6TEYwZnc5?=
 =?utf-8?B?ZXZaNmpHeS9HUlRrOWpWWXJ0b0I5ZG5kajNVZUR0ZkFrV3JFL1FYQmVXQytB?=
 =?utf-8?B?KzFtd0ZkOE1KQVp5MFg0QTRjeGhqY25JejE5VjdOWnpTUy9qT0lPVFFHcnhy?=
 =?utf-8?B?U2h2OTVUQ2x4M1JDd2E3dko4NmJ4RXVIUU1VUXVKcS9YM0tydWF3U1VQWTBJ?=
 =?utf-8?Q?rNy4O74f4J6K5BJY=3D?=
X-Exchange-RoutingPolicyChecked: Q6vb71mVMe4NFnGasycF/7c79rIIcUYy2L7RKUtH2LB7xt5kXERm2tdxh1qg//72TzgIJnx7lLhR3ZGGfr384mSyACpcJKpFB/Zqu01BZy4iprogbeZuVGLRsdf6LO8jqFOnX6HkoO4HxWnrTWXoBXx4iFFbfd0242Rd/X2JzIpwZzwaWQbvY9AP/H2xTPJv1pzeq4kUV6yZdJGDp6RoyqK2kWiFRtTo/cOr2nomHG52+rz+Ybddfilnkuf59jMcABaw1/f/Llfgf1z4NflRkKbyOZ65ewZmEEHDK3mbolIn6bkbUwgKmyZ3kK9zyGItigdJeq6SAxror6wmB7s75A==
X-MS-Exchange-CrossTenant-Network-Message-Id: ad1b6db9-e304-4929-bc59-08def19fc60e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 20:42:46.1153
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TkJacgw0+n9UFi2HHyrSftmPFL2LhF8VgohhP9Jv/2fiqmuJP6slVHmjcSMDSx2uGqelBZqTmyJffSK8rSBqIu8S/3ZoVSN0V80quOOwxKU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFF2E67D388
X-OriginatorOrg: intel.com

On 8/3/2026 1:58 PM, Bui Duc Phuc wrote:

>> Not sure whether we need such defenses. If we are to follow such
>> approach, many ASoC-driver APIs require BUG_ON/WARN_ON() update.
>>
>> register_card() is typically called as a last step, once 'card' is
>> already allocated. At the same time, the register_card() typically
>> occurs in probe() context of given device so we're always certain the
>> 'dev' is not NULL.
>>
>> TLDR: this is not a UAPI, (obvious) NULL-checks can be skipped.
> 
> I completely understand where you're coming from.
> My thinking was that this function is referenced quite widely
> (currently in 112 files).
> Given how frequently it is used, I felt that adding a simple defensive
> check here
> could make the API a little more robust and help avoid potential
> NULL pointer dereferences for both existing and future callers.
> 
> I wasn't suggesting that every ASoC API should be updated this way.
> I was only thinking of APIs that are used very frequently, especially
> those commonly called from probe paths.
> 
> Also, it's not always obvious to callers what assumptions a core API
> relies on or
> the context in which it is expected to be used.
> 
> That was simply the motivation behind this patch.
snd_BUG_ON() translates to WARN_ON() in debug conditions.  After reading 
the macro documentation, pr_xxx() or equivalents are recommended when 
dealing with invalid arguments.  Same results after grepping for WARNs 
in sound/soc or in general references such as driver/base/core.c - it's 
clear to me the macro is not used as plain null-arg-check.

Updating just one function with the check raises the question when 
reading the file - Why just one devm_snd_xxx() has the check and the 
rest do not?


Kind regards,
Czarek
