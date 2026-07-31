Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F2D68C1F;
	Fri, 31 Jul 2026 07:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785484696; cv=fail; b=lWvsG7SNwE2oAxS/+3Vo2MXBqPnTPXjf0qaC4nr00a3z5cVDi3x41HNKFjyGvoaAKCwwH5FeupoIG3Jwy+C1fKjm2atKQYUMpxzGAQ2KuN3+PK745NdRuQ2nl6W+ac/FYQeXDDsgOQk/nC/XRmCArx2oEwF58NnG0w3Foex3ICo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785484696; c=relaxed/simple;
	bh=cZEDau7oB28mSSPoqGqvihq+Ik//9DUHZi4Iy/p5LcQ=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=hv0npzgkvld5+STbtJKKsaNaBq6dQoMeBipFaM6iRt2ZauAc/sUVQiHTLNf/t9XjXSerOrGjvt4Rr1HW18ueCzoZYdn8BcG5Ve9Znm43aeujv6lCsxy9mHdbEga0eOMY3o3yGQthUUXSNjgikxXkEn0fg9y//RSQ0dDKSBukf7w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HJmRVCOS; arc=fail smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HJmRVCOS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785484694; x=1817020694;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=cZEDau7oB28mSSPoqGqvihq+Ik//9DUHZi4Iy/p5LcQ=;
  b=HJmRVCOSxceWlobzUqE6hA/IORpk47XyhPfTwE9TEK0qxIDJ0TUnLqXo
   0FLCjk1QmIG7501vhx4i3jKWem84lmn/IFUbQCbCVpO4cBi9VecwaUoi2
   8Gsq//UDksc5Sr5tUTUfC23oZRNmQH3NN38Hq96jvK1iDLV9D9DzBXsdT
   Opa7vkAXGDBfmkuUaUJ90vDKFJXY76g94NgO534dI4FjrCihbtwp/UFZe
   SzEuhgwtKAMcbO0wP0TCzasMXM5d5WVPTtkP/y+jcKA72XAF1fC9Nu+1Q
   tssvfZfXshdvCoauyrbfSKS+FSeeaIrhqIe8EUlK3aMX9+XkFb+ghLons
   g==;
X-CSE-ConnectionGUID: hEZNxdz7Qc6W0Zqkzu7p3Q==
X-CSE-MsgGUID: J/5PMPyRQxC1EzoCkDv+NQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="86226128"
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; 
   d="scan'208";a="86226128"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2026 00:58:09 -0700
X-CSE-ConnectionGUID: tTrucTlIQsuwTTXJjM9Wqw==
X-CSE-MsgGUID: rWKHcH81Sz6I5j308/BF9w==
X-ExtLoop1: 1
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2026 00:58:08 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 31 Jul 2026 00:58:07 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 31 Jul 2026 00:58:07 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.16) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 31 Jul 2026 00:58:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tTcJW5oVuUUI5Jz34igSjTmgCwhs+IKYaWRuKBDcqlJocBGw4ztUN8hcN6neplkNX2s9ogwlyVpBIjF73Gdz9hhzQmwVDwwv80BVxpcj/JL/s/TfnD2sreZds1lkOWnr0ShO/GzELKgh1jk1M26AzO5K/abRsan+07A2OB19lmmhcozBK2LY0nMsIDjvn0eSihNOMpKyvQHK423BWfZB9kqG+Zyr6Z2qKvD115p+3DHv/awmL9Fc7h5Nfwp22M9d5Fyl/E8zagNDxP4wqsgfIcTcoq+QIPamYuNEqVrp2P1g4txDDGG3cvZ8VjMmTbxkhSXlY6x8kZlEDJiTT9z7Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G9ruKuP2J73E6ryONHl4XVqiAK5p66+k3bQmVubFKcs=;
 b=VE/kslb1iAtIu0n9+0kAxYnJ/IYWy72PaSU4v4emcjHP/CxfckGqH15zQFeXaYQ2ymW9PPkV+Hs4uAkeyl4sqzcAy4rhrj60ZsbygZ6peL2uDrExB+FnJqi/BUwj9gww5mOsZ+PD81gXwzTlTEJvT8rfEW0pHX0Hr7rmBMycdC87Vm9ysQGv1knVJ6JMjg69ZnHjCMJfP1mQ3LecewjQn+CbW0CIZYW73uE2E8eBy6FeN0Gn95rKhlBMssyg4n6Yu/67OszjxWjyHpYv3MlajJMg2swk1pvW+9fr+WU1V0rKbcatQAqMlD/8uzbE01Nsmasr6bAyDwrI+z7vim6Teg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6967.namprd11.prod.outlook.com (2603:10b6:806:2bb::15)
 by BL3PR11MB6483.namprd11.prod.outlook.com (2603:10b6:208:3be::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.16; Fri, 31 Jul
 2026 07:58:03 +0000
Received: from SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4]) by SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4%3]) with mapi id 15.21.0270.012; Fri, 31 Jul 2026
 07:58:03 +0000
Message-ID: <25cef535-ec13-4fcd-9f50-66c67cc64d6f@intel.com>
Date: Fri, 31 Jul 2026 09:57:56 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/26] ASoC: codecs: Use guard() for mutex & spin locks
 - part 3
To: <phucduc.bui@gmail.com>
CC: Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, Steven Eckhoff
	<steven.eckhoff.opensource@gmail.com>, Srinivas Kandagatla
	<srini@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>, Linus Walleij
	<linusw@kernel.org>, <u.kleine-koenig@baylibre.com>, Thorsten Blum
	<thorsten.blum@linux.dev>, Kees Cook <kees@kernel.org>, Chen Ni
	<nichen@iscas.ac.cn>, Bartosz Golaszewski <brgl@kernel.org>, Shengjiu Wang
	<shengjiu.wang@nxp.com>, Sebastian Krzyszkowiak
	<sebastian.krzyszkowiak@puri.sm>, Pengpeng Hou <pengpeng@iscas.ac.cn>,
	<patches@opensource.cirrus.com>, <linux-kernel@vger.kernel.org>,
	<linux-sound@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>, Mark Brown
	<broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela
	<perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Lars-Peter Clausen
	<lars@metafoo.de>, <nuno.sa@analog.com>, Shenghao Ding
	<shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Richard Fitzgerald
	<rf@opensource.cirrus.com>
References: <20260731030648.8706-1-phucduc.bui@gmail.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20260731030648.8706-1-phucduc.bui@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR02CA0144.eurprd02.prod.outlook.com
 (2603:10a6:20b:28d::11) To SA1PR11MB6967.namprd11.prod.outlook.com
 (2603:10b6:806:2bb::15)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6967:EE_|BL3PR11MB6483:EE_
X-MS-Office365-Filtering-Correlation-Id: 622bca56-c6ad-45fc-1c56-08deeed972d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|23010399003|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: jIjn8E3S3C5vqKPxpUp/U3reGnaT9gCNOkPZslpmLAqMAHbAD0JAc1bCqoKCMLmcrR/4T74wqvhtii2l7RQ2ZCCUXe2gti8T5Aj8or5car35TeHv7eGcnzABndJHwY4tJd4KvgTrRd79fS2hV4YbX+AX/VjhSzm1sghTOc8Y4pYSGgizH3WuQcsmcsMxL0/5Vv42YBKm+3D9iymOjwUoYAuoxND5TT2nh9FVfP5MMQihOuNlx9mXeR4zTYeX2V9gkinWWnjIjTQMOr6Asd40maeSwiKtQkGhlnwtMa/YMQ0SAonzzqS9hMvhy1tLIQ/d/qe0L1GHbVXT5c/mjTfp79Xp7364u0W9+54Q7wz/nzsjgScpPvLyPUutg/i+K8mwASYoA3NCzmDKKys7WgKyoG6vOrwMozlnjCmY+ZV573F6bIztGGTChctWaSAXVQkcE1CoY67f3ibTRXfrwC7aZP6nqDwTRQ8kepnsKxONpUIbW3qe6gP8AUGlFnypo9ZA2KJJIXn+j+kipNtzS2OGXUB02T1FjY1a2mUoypsTZSTZfzyTKyBtTcjnWDvRBF7KpCv/jjII3r5PwyYe8/g5Swuu2Eho5Wn4ejw5SPA/jDvGG9MNe6eIUyZpxnzaq0cCneqwMEKv8p7x88Q6ETJpkVo3h5RR/kOrkcHHk6CQUXs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB6967.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(23010399003)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cDBrZTQ4U0UxY0R4ekd1Yk5paTFMY2d0d0szQXVnY085TWZiTERnK2w3SUky?=
 =?utf-8?B?SmgxMGxQM0tZNzVMNE9COFd3UWdzeXE4MGwzRm5UdXYrcm5EQTBreFoxeGlK?=
 =?utf-8?B?WUtmTkh5WExFWHkrblR6dTBJbS9MVnhIc1k5VmcwVkpVT3hLbFNWMmRaWGRG?=
 =?utf-8?B?VWw0UkJOaUZRWXRMZmFNQ1F2Q2ZiS21ZcWRta1Z5Z1dXSGx2VWlRZ3g2SGhp?=
 =?utf-8?B?RGdSV0hFbGVObmZ6UzBtYmxNMEtURlZSSjJET0QvQ0lFdFVSTXkzNDhWMlV6?=
 =?utf-8?B?dnpxb05TelFXK3ZqYUl2WmlhWW5sclJnNWtaNnJmUXhJaXNkTERrTG55cysx?=
 =?utf-8?B?WFI5bzUrOEJxOW1zdFRTWTB2WFVnK3lUbFJnRWtmWWN2U0Y3a3NLZGxhT0d4?=
 =?utf-8?B?U1BwdlhSck9BQm9md3UrVlhjZHhYb1ZMeHUwVXhjcU80VzVjeGNveGlNcnpy?=
 =?utf-8?B?YnZzcEhHajVxUVh2Rm5RTU1adlNTdWJYWm5XR3ROcUp3bE5RN1JCUzZWSkY5?=
 =?utf-8?B?RUdIdlJMaFlnbHg5eWRvYXVXS080QW5qS0h4VjlrVDh0STNsNGpUbjI5am0x?=
 =?utf-8?B?YXZtaVlFRE1scExuYWFEbFBCSEJ1d0E5UzVGb3I0L3BwTE1IZUtrZDU1MkRG?=
 =?utf-8?B?enNBNExlZHloQWovZ1lreU01cGRIRVJsT05TZW8yMmpEVjJiUFRaSUZGdjlZ?=
 =?utf-8?B?Nm5WcU15QVkvM0xuZDIxdnB1bnhEZEJiWXcxeHM0MGdHdEdTbStwaXhHc1hx?=
 =?utf-8?B?bDhHS2FSVEhjUXlqdFVzSmowVUxlRkVpbzlGQzZWZHdiYjI5QVA1S3REY0xJ?=
 =?utf-8?B?a0NxSmpwa3VFSU9kZDM4Nkk1NEZaVlJBK3J4N0l4QS9vaEUwLytSV0k1VGFv?=
 =?utf-8?B?bDRLaktmdWV0Si94dHg0emYrWHVOWXF1WWdwL1crVktETDdHdEErQ0NmZkxE?=
 =?utf-8?B?bUpKKzJvUFZUdS9oaEZrQUlWU1Vob00rcCthSHhqVmVKdG5KMFFGa3pQVDlq?=
 =?utf-8?B?K0tkRXI5Tjh6Qlp0RG9CU0pzY1VJTVV1eHpVWFZoOG1IUE9TV25QWjRIeE5a?=
 =?utf-8?B?QXBPZVIvTHFiLzhwWEhKSlhvSHNLK000bHY2dFRYREJUempiNWFGeGxGaHpn?=
 =?utf-8?B?UzdKT2UyMXlPYnNmU3paNjJ4dndCL1VweWFteFdLSU4rUXh1Q1oxUC9ubFRP?=
 =?utf-8?B?bk5DdWs1Q2VwNjdmMndXWkN3dklaL2pBVGJ2aUZkVHlST2d0aE5qekVqTGYy?=
 =?utf-8?B?SFhycFhjdFh0ZkJBZTdnQUVtU052TUxZbzJzUTNHWDZjd2pGczg1ZmE5Zm1r?=
 =?utf-8?B?QnNHMEtOT1BJYXdXNmZPYWh0RmNLckJSdEJNQ3VTZFZYZi93SDdPTDhjcmxt?=
 =?utf-8?B?SmU0cG4yRmFWYnNVVmIweG1ZNFl2UThFamFxMGRQcklremxSbmZmbFNZYk4r?=
 =?utf-8?B?VGZFcG5UWnZOa0xMc25ZZktBUnNvcnYrNThRY09mMVlrejZ2dnZuYmZVYk9E?=
 =?utf-8?B?WFErNVBhUytnU3ZKVG5LOUJsQVZOQVZrVzZQUkVienU2UlY5TnlxVGd0eHdw?=
 =?utf-8?B?MDk0dStWN0pOdWYvUzU4N0puamRUR1BkTzlOOGdoL2ZWNjhsSHoyZ2tGVmhJ?=
 =?utf-8?B?RnBSQ3dWNXVlMGtXd1BnQjhNb0p5dTBPcXlFeUhmRzNaTnFwOFdZaDRLeWUr?=
 =?utf-8?B?czhDUElBaW1PYWtKVEhqb0Y5MkVGenZEMnU4SFQ5QmYxUDFweDUwaUJNRktZ?=
 =?utf-8?B?ZjU2QWVZdkFKUTNLd0M0VVQ5QzI4cUhTTk1STUZkdkxsajAvc3diQ2pEeUlt?=
 =?utf-8?B?alp5S0tBNnBWc1R2dnRWd2wwd2wzTmtCRUtITWVuRGVoaVdpMHpGNnFlUnpu?=
 =?utf-8?B?WTRMa1NZNVp5T2Q5RjFiekRWN3QxaFBqU1hucGQwMTdZdStOZkFGYXlqaHl5?=
 =?utf-8?B?bDQ4MGpUNnRGci9VaXl1dkh5Q1h0MlVVVm9ybGNYMzZVZG1NdTQwem8wMEdG?=
 =?utf-8?B?cjFNdDRXZE50ZDZ3NmtGY1dvTVp1Tkc1ZWRPYzh0VThmbGhQYzl3RER5RW1H?=
 =?utf-8?B?NUhjcEhaSnU4RllzbnMyTlF4eTB5TVNMc0o2cEFaNG4vOFNPalR3c2t6dDVw?=
 =?utf-8?B?NlRDSVU5Z2Z6OHM0Z3dJTXFTUytyWUtrcGwyUjZNOVM0K0tjVkdKRnRGZ2J5?=
 =?utf-8?B?N2M5WWVjVVY2Z2t2eU43YzlWeFdoTU1LblJjQmJvMUkwRTBkYVdqdldiZkxp?=
 =?utf-8?B?RXZBQStsdEt6MnYwNnpHeDMxWUovdkZIaXB0Q29FTVdCL0ltUm5MNE9CNmhJ?=
 =?utf-8?B?b2J2Y2dCc2Y5bFR2QXhtVXRLRDJaV3h1U3VraWUwamwyUkRwV1RMajgyNUVV?=
 =?utf-8?Q?4TxbjZgku9OQoKzY=3D?=
X-Exchange-RoutingPolicyChecked: cXetX/BLltIpKXAjQDgzYUWVRTteVofNB7li5SjPyGnfUiiKJDtCx3x8BexJZpqVwBQg/uoraWvcaSiRLy7EVfoGsCKDmdYpdjLO3LD0HpLsoDVTx0cnNIARl2V/tCsWzsWBLGzr7T+ktwXec1sKfDChXnUAVp7kd3X++ybIFBj3JzCM68aBIGRAz69aCVeaLEDXnezKaTaLXsuIF+SVaUeguXkMYghMUCVTM8Vaxw8qvgqfhd3AvawpA9Si3/2lZmrm+NBcB2OGTkdu1xtp/JANJtaYzKCk2LhxNmKN/3tQ/K3kMTeUrxrVvFOIX6pb4Mer8UhEtvb2ru+5kk25DQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 622bca56-c6ad-45fc-1c56-08deeed972d2
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6967.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 07:58:03.7122
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: izrCUqCiNG6n9XJ2Z3VAKgsQ0oBZAmjcCEm4Yn9fv3cAMklDIJ/1JMZ/QADYHMKhY0dN5sWeLVZh82YnmSOx9SaZQihidHr+1C4Qqh8E+HY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6483
X-OriginatorOrg: intel.com

On 7/31/2026 5:06 AM, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Hi all,
> 
> This series is the final part of the cleanup to convert ASoC codec
> drivers to use the guard() and scoped_guard() helpers for mutex and
> spinlock handling.
> 
> Compile-tested only.

I wonder if --patience would make a better job of showing diffs for the 
patches with larger scope_guard()s.  It's kind of spaghetti right now.

For the series:

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
