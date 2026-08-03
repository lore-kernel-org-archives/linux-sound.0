Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 312BE3793AC;
	Mon,  3 Aug 2026 10:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785754226; cv=fail; b=IsD5z/sBDe8mFlSauKmuiDefA9VkpisCMkr8/XeOUfbgZPHEhi1KY4DGX52sMzqz0j/MfruYyuRQfPEPK49cdisUPH+ZY5w9OnC6qiE4w9mV6V4ck1gmolCa6T3RP59TiaISkp1167SO09p8s6z0q8REToXI5FhxSOyRzmJ4Gyg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785754226; c=relaxed/simple;
	bh=B5AWAFpYgfCcEr6jW7+aPjCui7+ZaNxSz0TYnfFtBp4=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=kQEiTQI2NcZmuxEd+mMnsL6QhANrQ+quJ8mOxYMqAFfErYgQW3yTLnKTx/zDCgWd94y9XC5W1XVyfyPWj4sGPmvUYzjErSK+ZZU6xDNHlK/MCSKu047RhgtIVImNIruyOZhMsDcX6avcaebKc6IeFyAEhnQ23SBpKsFHWHhNv44=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XMVpQGmM; arc=fail smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XMVpQGmM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785754224; x=1817290224;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=B5AWAFpYgfCcEr6jW7+aPjCui7+ZaNxSz0TYnfFtBp4=;
  b=XMVpQGmMckfBFmMaiKTpVT8AvllI/LsCMurXOc89anAbgs87j8E/vYfg
   pHFZ7JNoEI/Cke+oz/o2C64Tx7vb9M/8i5g/Vl/sRDnpDpewJbHUZxK7W
   EHzAl+DPOq5U42eeVp7W3I8PaHL/nyPxqghHncMeXBb1bdLGAqDARK6oC
   lj86GYsOnFRlrlwH/7bIPxmxit1upfv2EwcV1mFv//qjJ7z5OgnPCZFVj
   8FZOrj3JHcEXdgnEfNiT6dIZB6ppSXsZPJzbmooMpR/BP5AFQtiCPAUwa
   GH8WWXG6ZWIJbCxdhrg7QT1Dw3w8u2QzTME7JPMwhUJuBMnPbiHXYVqVj
   g==;
X-CSE-ConnectionGUID: SGSL/nxzShCXvoqgt2zchg==
X-CSE-MsgGUID: lb7XFFfnTyqLg1XvuECQmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11863"; a="85413412"
X-IronPort-AV: E=Sophos;i="6.25,202,1779174000"; 
   d="scan'208";a="85413412"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2026 03:50:23 -0700
X-CSE-ConnectionGUID: 7OcJEe8pSw2TcD9nlKZvMQ==
X-CSE-MsgGUID: ckRfKNFCRoGzBUOMkXz2rw==
X-ExtLoop1: 1
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2026 03:50:23 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 3 Aug 2026 03:50:22 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 3 Aug 2026 03:50:22 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.31)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 3 Aug 2026 03:50:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FCsbXIkaRDZUWoK8IaUUedPl61ADjKp3dENuvBP4L+IGgu9SnHai0WXhvTrExNAySOlwDxf0K6ETaXv8qYHKpbtwBW5LkPRHoqAFSanL5XXoCZB7k3WlXAux9g8IjNjRcaGC7ccnMs1/+BJlJH1pvmNJKb2oLd34ZjcIardYHocz8YcLRgD246V6hBspz59qNUYUsak5kweHq5/4EpioIBcSMqnQr5PZNdNggvyIaTFMAI7mlC9ZfsEWf3nLdQA2jJI+Duw2xXTbfB5s6ZdzpcICMCSjVy4Z+FfKc2701FJ/Tr4J2H58owFT+WiXUyc3oB7p/R+sqp6nuqJnAlJy5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xYeBEMt1ZqxymAeueFCoaHo/Ikir0SDc8xIKzJUFvwg=;
 b=WLp17a2hHszAR8bxJmnF69uDb3YDEGdaYGaQgcZPDHWPWQWPUBTzPutI821ihEirE8jKVZLZ/L/++s/4ItaqlPOROHD2wpO3SI1E0BWWSPZGi/hpjWIKCqnOIiLpE4dQ3grNy3XfRzoMg36W+sk6PTP7omzfT/6aizcypqXFs4oOjS7YAcruEZdHRCEx56v/+/A0c46h9uokePclveeWVWz7aK0O9WVb0K5W2aPbULzx1yyeT2kkEminaFgwNUhC1H4ktL7oiVRjNGCvk/TshfOHZHi4VA50MU8pU33KTc2EbqKXoBBArTX/DZNJcVVF+5uLoAdm9hOLEVPx7fEoEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6006.namprd11.prod.outlook.com (2603:10b6:510:1e1::13)
 by PH0PR11MB5806.namprd11.prod.outlook.com (2603:10b6:510:14b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Mon, 3 Aug
 2026 10:50:16 +0000
Received: from PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd]) by PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd%5]) with mapi id 15.21.0270.016; Mon, 3 Aug 2026
 10:50:16 +0000
Message-ID: <f7c2eafb-84c0-4c4d-a359-8c80ed989c24@intel.com>
Date: Mon, 3 Aug 2026 12:50:10 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: core: add snd_BUG_ON() check in
 devm_snd_soc_register_card()
To: <phucduc.bui@gmail.com>
CC: <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Takashi
 Iwai" <tiwai@suse.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela
	<perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>
References: <20260803102739.55569-1-phucduc.bui@gmail.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20260803102739.55569-1-phucduc.bui@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0902CA0032.eurprd09.prod.outlook.com
 (2603:10a6:802:1::21) To PH7PR11MB6006.namprd11.prod.outlook.com
 (2603:10b6:510:1e1::13)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6006:EE_|PH0PR11MB5806:EE_
X-MS-Office365-Filtering-Correlation-Id: a01e19c8-4a91-4f5e-b28b-08def14d00a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|10067099003|11063799006|6133799003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: +bowoqT9tPhDoLY9TFGfbhNsk3WqIl2ne7q63zZFMK+GuwGKC9tkyWoVlthjSEq6ZN7qLTWFF+ZdVAC3sU6mQiViONdZGeGgY7+zjvsE5+IfAWF6G6MW6iMwLBPeS+bSCot3elPmNnt6pDqpB0eXenGe19jWIC8Al2DbwFVWTCqymOl7+hVepxE9G6S87prw3WpkikP7A+M+ZqmGBbZcI9oxi18OWHJ3/hufBjvcRtxG3jSscsyzCAY5JPXTz+sY1NBIKMpZWzYOGzl1WcJtX+tQ7LGO5Q7qzDf9mkOkYgiH1eY4KGOiCMDz39n6g7gLuoTtUhaBobVetK/cYXooMFXI0FvQenzQbjEKrgFdNSBNXhhHY2xU6Zuk+Au1BDj0xm0Qg57lKcYL7jkoPZ6k6MYEaEj0vaEGKg1inslO3P8jjKluuyeCby1Gtfigr2R46W85PGEAuwLtLwXhYVVLKBqyp3Jx1FIXc2YM3XscQWTiy0IC4J/QaLc+HjqJoakJqtVRGMkcly09iFXkVFMyFs/eRi31RLfIOLUvtKKxuBFMtMpsZZ565peeZykuqz9fdvDd/q59RgopvwjYZeSh5yYYVnSln8PQClzbugVLCmufUkAFdeJBLsCGhvAyLyvHjzmImIVHHhkUfxtxRdDQWeCWMe4c5Ys5qcrjMfP3JzY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(10067099003)(11063799006)(6133799003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?elN5USs4dkErT0dhSXpnVUdyK0k4WWVhRHhZQmtiZVZhbndOQ2ZKQ0x6bmtJ?=
 =?utf-8?B?VW05TW9HTkRtbmIzTHRUY2JGYjd0MjZ0WnA4d3NnMFZrQ2pxWm4yUkVsVTdv?=
 =?utf-8?B?d2Y0N2grSXdWUkQ3d0ozcFFHWUI5SzJvaXZsMldSenF2MzZMSFhVNUM2ZTZj?=
 =?utf-8?B?YXRZQ1d4dFREMEJRRVZ2OFlJeEhDYUNsSnpwVzBLc0N1MkVEcTZ3VjhCbnE2?=
 =?utf-8?B?UmhDTHBVaDVCWjhHcUlTVGw0Vm9kZmFSL3haWWp0TXpuYS9DWFpxMDZ5KytD?=
 =?utf-8?B?OURlMVdSYVNtdk4yVFk0N2piQ090SXE0Z05IME5aU1l6aTFDNTZBT25OeWFD?=
 =?utf-8?B?YVY4UnRXcmF3Z2ZDR2VnQWpEKzlNR2RmVmF5WlZkSE1YdGR2YVgrdVk2Wk5z?=
 =?utf-8?B?VlA3U1lxUW93TTFNTXJrd3hra0tVaEVYS3pnczIrMXA5SzRDVGk1Z2Z3emQ4?=
 =?utf-8?B?WnJtekFCUWRKb1Q3UGRCZEFFNmpKL2dmT29FT3JSRlpPL0oxeHhoTTdFYUtQ?=
 =?utf-8?B?eW9zT1NlODNRNDhGRGFRMFIySVRHcjdoVHgwNHVlanNDWUNTQWxnVWdYMS9v?=
 =?utf-8?B?d1FwNFhkY3BXNnhwMEhpYVNId1VGZmFKVElJbzVHMWNLR20zUWNTTFlHSG12?=
 =?utf-8?B?UWtDV3gwd1lIbWdYUjhPa295YVZuUExXYjgyM0JtYXd6RGdVclZvbmQ2WnJJ?=
 =?utf-8?B?cmR1dTlISm12NFJCaElZWXlVMnpsWGxRb1prb0FId2YwNHY1S1lDZ25EM2Zk?=
 =?utf-8?B?L3grTkRXVDJ1ZS9wTXpaeTJvV1pucXMxRlp3dHlVeDNpZGdlckgrYllvaGhk?=
 =?utf-8?B?bDJSWERqZTczcmpqSmNOcEJHK0FiYkFJU09pOWZIYi9uRUN6VjFESDBqQkhy?=
 =?utf-8?B?WmlvWW94a2dkMmhPVTNCME16UUFKY3EvWEI2WTNIN3YzOEJMeVZkZDNtVG93?=
 =?utf-8?B?RjBiUzVKSHQzQTQxTkpQRWVLMEVZZ1lEbXBHWVFiV241WVN2THN1VVlhVmM3?=
 =?utf-8?B?MmdWbWV5ZU5YV0t2M3Rad1JUSDdpN21JRHV1S3Q4Rnpnd1ZxNnBqTW1HanRY?=
 =?utf-8?B?M0M1TEM5SFlWVnZQT0VQRzBtdXU5anVWREdEcjg3K3ZTT0xObGs3aVNSWHBR?=
 =?utf-8?B?NFFQVWtyLzZYdWE4NUhZOEo1ZlZ2RW1hcWV6NmJXVXBDZTdybjBXQ1pBNmU0?=
 =?utf-8?B?U3dJWXRaR3I5MzFPdXJYakVuZEw0MHQwRGhlNm5jMGgrMXAwNVVGOE10TnBM?=
 =?utf-8?B?OFBzQjNrQUx5NFkxZkgvaFpvZ1FzRWh0cndseWJJeGh6Y3VUcW1GbG9LVFU2?=
 =?utf-8?B?bHBEenIzZ0FHL3ZOOEU3TlZvVnMxeWY0bzFDeS9qakhzK25VSk95Tndsc2xW?=
 =?utf-8?B?UFFvektVUFVGTFc4UklnazhHN1dlN0ZkTThwS2xrd09CQnloV3dMTHowc3FC?=
 =?utf-8?B?YVZtb21FRGVhNGlxOEZnQ1hjNFRXbUJVSmhlRkdmNVppMXltR092MEsvRisr?=
 =?utf-8?B?bVhadWNzSW9zWHplQTkyODZYYVZoNDVtQXBwVTl6d2l3VlA0cnNqcDU0QzFN?=
 =?utf-8?B?Qk9TVWZkQ05aYXYrK2NlU2RDM1o2TzhSYVhNaDFNQ00wZGdLUXpERHpaeStI?=
 =?utf-8?B?V1Iyc3EzNGg3SDdkb3lpU1BpYkZRK3VwZFN5cC9vUVYxNHNiZDNqYlBrQVBv?=
 =?utf-8?B?elVoOWNZOXlwcnAxTVBJRHF0dXluWVoyMWkwMHhVcGVBNnloMDg0OWpJS3dK?=
 =?utf-8?B?ZXdvTkhhTlh5WXQ4T0wxVXQ0dHY2VW5XdFpISDVQRldFUytnNDZpcytTb3BV?=
 =?utf-8?B?bzdwNkNNV3pQdnFqSDRuS21ZendFY2VXYVE4ZmVRN0Z4LzdDNGFlT1lkcm5B?=
 =?utf-8?B?S25mZm5mSVZjd3pwTkVQVWxkbDBUQ09qam5xdnpkQWJCYWRmaG0wRklUVTZt?=
 =?utf-8?B?OWFVeWQ2QU12WHkzWktxMnNzcEhwTWdodCtlRUR5VFN6VzA3emF6YWMvR1dx?=
 =?utf-8?B?UFFKSmNCOThuUjU1Ri9KZEpTcTJvUysvb1cvUnJXc0JjaGxxcjBCYzNsQ2lk?=
 =?utf-8?B?U3VrT0lZSXFabDN0OSthZ2FpaGtDU2lLZHZoZEdUbEV5SVM0UVFRcUpqTFEy?=
 =?utf-8?B?ZFJjQUZncDVOM2RQcHlrc2NRRnBJS0I1RzkvNVF2MDB4UWZ4SmZUclRnTFBE?=
 =?utf-8?B?ZUhCWnljTWg0TWJ5ODZJaXFSWWlGN2YzNDdIdzhPNFcyZ2RORG45cGl5L0Vn?=
 =?utf-8?B?aS8wU3AwNm1YdDV4TjVxcHVXTEdRT2NmYTFQMUhvNkxTYytjcjZSS25PeHE0?=
 =?utf-8?B?UVl0UTlJaFFYemhuVXRYaU5mTGxKQWN1K0phNGd5b1BCZGM2ZmF4MkJMTlJr?=
 =?utf-8?Q?pEWf1ACpahFcpjpY=3D?=
X-Exchange-RoutingPolicyChecked: nrUe1+EkFu3UbvqAStpnMJtIy2+dj+TxOkcWs4Snp2fXqa5Rhy1dxfguMZXn+JMWHDywujyrI5YXC+2/xcCRotH+vNfbm6Pq+hsUA83hSVtdV0wdKzMr3TIniblg62F7dOq3MQ8HHoO3F8v2m8E0HSCAfuYEkwECUOXQrbyO7VsRHiLSmQkvFd1WWXp+D/ZIkLsDXiUrdSSlsgafBbaxd++ntCxiQQZtSxmEiv6R1g9LCs6/MVUohCxfaW+zDKL5KiSsApSclDP3y1QS7ataUJxrUhTVtvIqmCvuV9ObTo57AtrQpkvJLfphHeN2ZD8dwljfMhM9ttxSleCjqtqzMA==
X-MS-Exchange-CrossTenant-Network-Message-Id: a01e19c8-4a91-4f5e-b28b-08def14d00a3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 10:50:16.1948
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NSzXDYJF3wbb58g5RRJgihlAFEphLOT51iutIOxNa3giPLEM0I5VyEYs6vxPtsEOj0aGL5iGDi8Bjxf2dQVdu5quHqaiAPaDqf2x+28sTEk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5806
X-OriginatorOrg: intel.com

On 8/3/2026 12:27 PM, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> card is dereferenced immediately, so passing NULL results in a NULL
> pointer dereference. A NULL dev is silently accepted, defeating the
> documented automatic-unregistration semantics of this devm variant.
> 
> Add snd_BUG_ON() checks on both arguments to catch API misuse early.
> 
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---
>   sound/soc/soc-devres.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/sound/soc/soc-devres.c b/sound/soc/soc-devres.c
> index 718165ba84ac..3e946196022a 100644
> --- a/sound/soc/soc-devres.c
> +++ b/sound/soc/soc-devres.c
> @@ -59,6 +59,9 @@ EXPORT_SYMBOL_GPL(devm_snd_soc_register_component);
>    */
>   int devm_snd_soc_register_card(struct device *dev, struct snd_soc_card *card)
>   {
> +	if (snd_BUG_ON(!dev || !card))
> +		return -EINVAL;
> +
>   	card->devres_dev = dev;
>   	return snd_soc_register_card(card);
>   }

Not sure whether we need such defenses. If we are to follow such 
approach, many ASoC-driver APIs require BUG_ON/WARN_ON() update.

register_card() is typically called as a last step, once 'card' is 
already allocated. At the same time, the register_card() typically 
occurs in probe() context of given device so we're always certain the 
'dev' is not NULL.

TLDR: this is not a UAPI, (obvious) NULL-checks can be skipped.
