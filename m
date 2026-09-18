Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C8F61E5B70
	for <linux-sound@vger.kernel.org>; Fri, 18 Sep 2026 08:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789720399; cv=fail; b=rHDU2E3//YludoQ6HInO9uqaAPwBPfwOdkBcpXROwTh0M04JkJ83kz16yvpCCFEIMGeCqUmxNRrnt0bLChdfMHKpMXR638zMPzJ4UJyaaK/30IKo3CAoAHXXribIm9T7nR/3UAqPHZrJFvl1QupH45emjXgbvhPKGE+FiJZ/C3c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789720399; c=relaxed/simple;
	bh=p9DDNOMBBUMZ1+d1mMdN7lpgwCjhIPSA0Grt4eljINQ=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=lRpB+EIhfH9FYNo9mIauyEMNgK55XoBzeqn5nNCc60Pgh6Kq06FgrrQihzOnTQ3m1JzjjZ3/3xO3wA14XW+3NLGa/xGNJ6iy9717lyG8HfqgdKBrHh1dANDy0f79fFowDP/ER0M/aRQbDfJWK5q3ZdFnJRWgT39DbDJfuQ51Wpo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K+jfAD8N; arc=fail smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K+jfAD8N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789720396; x=1821256396;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=p9DDNOMBBUMZ1+d1mMdN7lpgwCjhIPSA0Grt4eljINQ=;
  b=K+jfAD8NC+hLKUZlSSWH1VeIwSkJfoeS679+v3ZV+NP/fLoQnrcFd9CV
   vLe4AeuLX4LnRKUIU99RiSGccAYEqxz2ROugZB0/lJW1u6W+BP6gFez7T
   QU+Psb2cP2kWs0OzhHSlNdIOjVfoq9ARSfv3rItR6sVnGMR/0bhvIdL0Q
   xeI3wnUBOQ2qowR/AF2f0vXdztK2KCr6qlodkkdkWUhwbsDHZXdiC4tqz
   cD192+9PB1pzFGLxz1wUQoqZx8nehU2oi7rRFvY7wVjA3X4PcRpIRpK3j
   /5l2HZfOGP4w3bH2+HLJ6MRGf8ED2PEZ+Gz5UCGWT27Eia0mw/BbVHabu
   A==;
X-CSE-ConnectionGUID: UWvuXDELQ2WkQ4kURuXzEw==
X-CSE-MsgGUID: LeNKVTs9RgKC7uegbyqLRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89346509"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="89346509"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 01:33:15 -0700
X-CSE-ConnectionGUID: Ous8ZR0UT/myq7wwPb9w9A==
X-CSE-MsgGUID: Tycsk8KVSjecSZOXK8Q2Gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="297763402"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 01:33:15 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 18 Sep 2026 01:33:14 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 18 Sep 2026 01:33:14 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.47) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 18 Sep 2026 01:33:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G7byxPLLS4vpPYQjz8C22Q66g7enDdyUbId85ldbOoey161dbMZ94oB3400TKqdpVnGjXYPTIJwN7hQaTDX8+SJJhvD8mEb/zJBfczPu4OUuiYEm47O9guP9JtJ+G6qP9G1NvcF3zsDdwqFFsz8Zduhl3wXscyWc/rOSS612XNeW+9XV6KiO2ClkCRdqMAyWcjrNkciSQG4v6hOgHeHZ8PoGowwPEVYLLBRmy8F3gS72CjMy3EOXXrxAOaYOBaOoYqH9YL3Xx7T0pRkW5ZnBgZ3S0nh9EJHJDDcprvkxH5096YiokGLfRUYpyePXb15kDACl789BBp22SX1ermnu5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fJZXuG4SV/7Z0eX+mxQ29lgLAAM5rr0PTI02FgO7zOE=;
 b=OcGEPmRlAqNVvuvauVnpRx/nkngsyacbEUslM/4+THdOVccqH7nk0grm3Ns1Wa62TYPZes3B44lT0MzE4oEINY7oKZ8VEminQmHQn7yakjX0UQsguzbaVOTJTfi2Gx+7t69fK0NJPgV70p/VNUT/jc9qjDTagYYYc1M9isCROwy7FfF2bruzd4iN2xACbbDDBM3Rmp7JsaEcm0c9/KDyj0PPKobiCNeZU8NGuYD3noOo8lhMBJCrgeb+peJXUvgwBFmUYq8N0mpk5T+7TKO1XCaCrAloassGx2+fS+8RQN/a7r6Pmcg5vSNUgib/M6H717FixSUTmgU1x1efF1/ZTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6006.namprd11.prod.outlook.com (2603:10b6:510:1e1::13)
 by LV3PR11MB8741.namprd11.prod.outlook.com (2603:10b6:408:21d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 08:33:05 +0000
Received: from PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd]) by PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd%6]) with mapi id 15.21.0406.007; Fri, 18 Sep 2026
 08:33:05 +0000
Message-ID: <63cef80c-7040-4a21-8fa8-3c258d123fde@intel.com>
Date: Fri, 18 Sep 2026 10:33:00 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ALSA: hda: Allow for codec model selection with module
 param
To: Takashi Iwai <tiwai@suse.de>
CC: <tiwai@suse.com>, <broonie@kernel.org>, <perex@perex.cz>,
	<amade@asmblr.net>, <linux-sound@vger.kernel.org>
References: <20260914102253.2969724-1-cezary.rojewski@intel.com>
 <87bj9zom8l.wl-tiwai@suse.de>
 <9e17f127-ecaa-407f-96ec-0993e9c1ee83@intel.com>
 <87tsnrn5oe.wl-tiwai@suse.de>
 <1d146db5-f4ff-4a5b-a1d9-181ee6d8ceac@intel.com>
 <87a4pin4v2.wl-tiwai@suse.de>
 <36644426-3302-47da-a720-f353c307348b@intel.com>
 <87ik46lcz6.wl-tiwai@suse.de>
 <0f1397fb-4ec8-4644-8fea-717f57354b25@intel.com>
 <87wlsljweu.wl-tiwai@suse.de>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <87wlsljweu.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0538.eurprd06.prod.outlook.com
 (2603:10a6:20b:49d::25) To PH7PR11MB6006.namprd11.prod.outlook.com
 (2603:10b6:510:1e1::13)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6006:EE_|LV3PR11MB8741:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f2b49fd-5ab0-4b9f-ec34-08df155f75bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|18002099003|22082099003|56012099006|4143699003|11063799006|10067099003|6133799003;
X-Microsoft-Antispam-Message-Info: QE4siUH0q+93CB9Ayb9TCwPdtiImZCm1Dl8jtuK9rtpUhPf6oHQ+JG+etdpqpSSmNZXVUlnS3OX6/7nmHWb9D+wX6eROq6XxOftXiWOXiPbVpHUGVzk9maSAMi4/vMvbEsfZMxN1aE65GqAIAhM5g+vsM+ieFRApfXfau2QGTJJv84KbJzOiDy/u/7ciZTrEPm/p/le2FI/IA51goSToiUIxumWzJWx5oAlJJVmIt90qCSn6FMpthJUIuiIZBBYPsoJM9V2NZJ0TZGJkf8blxOFEwDstoTu5XxdhT4iIBkRp3blt43mLKPE1zp+94/fwdARaOWR+9DzZwO1h8IvrgDQiEtcC/PaWkr2YxOWVkFn4jWJp9aS69xOL5uQHhudI5cGLFmW41A15sfCtduAgQHJv3x2V2fNUeSwkepwPOqjoQq0nScVsjySoCTF3RdPCOaaeVDg6AhZEMvQUxhiJ1OAFmDc0dvkQaEfDG3jkiqCsEG7jzWMklZdfx9WttLDNhrkcm79vPpWUIauJzNwWhOKcqBTv/RXCECOoeFnwKtFWC7mlVU+4sIQRNxI8Y+l/8B10fD3Rn3+YHW3+l3bHUo3ZHkB1cpIX7S3Nt3lYYothROWY8KdzbVlnkfG/9jfWGIexfhFUF+VVvdCTQUUlZQYQUmybL/dk7WF2+tHkeiM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006)(10067099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZE54bzM4Z3hCQzVDSmdkWTdGTDFBK3VDUHcwTUs1dGl0Tm02N3oxYk5zUkM1?=
 =?utf-8?B?bkpURjNiZm1WU21oMmYyR2ZHMWZPdDFQVXR2dlgzSlAwUURXYVRGK2EzNHNK?=
 =?utf-8?B?MElmT0lCT1NzT0tUN2Z0S1VSWnNTMUFqeGM5dUsrZzdXWStwckZqcHRiNnNB?=
 =?utf-8?B?STdtdmdHV1B0Q1c3VENZOUxsRGFHR2pZT0JDY1hEZldUcGhHVWdGYXdJd2dU?=
 =?utf-8?B?enAwMG8xQmNRWFdCMXV2ZVo0QUg4Rk1qVmpSZnViTG5mOWNDUjB5UFR4Zk80?=
 =?utf-8?B?ZU9FZmJ3ajdpaHYxVzR1a3hpNDVCNkNveTVXRk5idzlWUGR0NHRQMU5oOHRW?=
 =?utf-8?B?c2JZR2Z0UEQ5VXdnN05rOVlaVVQ4SlRhQ1lGaGdCaDNSTlNMVmpYVTFXOFIr?=
 =?utf-8?B?a21mUCthWWZGZk5CSXZKMDFhT3NpME1MWHgyZDNJdmsxYnRHWmhlMWNOZDlx?=
 =?utf-8?B?RXBRTWMra21LemZqNkJpYkYrbkJ0VW5tVElXOVN3ak92UVdPT20vKzVxQjMr?=
 =?utf-8?B?cXFOU2NXU0p2elN1RkhBOFI5QjFFNkVhNTNDazZHM1VRekZtVVhrWUU1RXlL?=
 =?utf-8?B?K3RvYXo0UTJzTUJmRHV4cXZ1RS9pSWQxS3NNTmRJbXBrQk5SZnpJQmZyN1Br?=
 =?utf-8?B?Y1lubi8zYmVLTS96VjJPbzVjcXl3bnBvcmUrb2lkbXg5TVpkek81Y0lYbmNN?=
 =?utf-8?B?WCtxR1V4Sks4bkxRejdQRWh6bGxqd1VicDVXQWtsWnYyYTJDMjRPdXpBMDgz?=
 =?utf-8?B?Y0x5YWI1aGdSRk1zdDZFYUY2ZGtSNTA5K3BjWDhpMHI0ekRmTTQ0bGlJaXFm?=
 =?utf-8?B?NDVLa2RSUUhHZkJxZ3ZNa2w3dGcwb3Mwbi9CeXNOOVA1R2xVY3Z3MkFpWWVC?=
 =?utf-8?B?ZjJQOFVLODVQWHI2Vm83aVFrTTJjTmcySjJDNE1ldnp2OSs0bGplMEFlWlFI?=
 =?utf-8?B?WjY3eDdHUGhKS0pLTWpHY1BTUEI5UGlFdEIzcm9maUVwL0VmekVleHRoK2h6?=
 =?utf-8?B?azNLakRGZ2lwU0M5U0RsU0NJaU8wUEZ2clI2VHJublZEL2syNURGb2haK09j?=
 =?utf-8?B?U0xsRlpCTnJranBybUhwU01GY1Q3UzU3dnk0QUxRQXc1V3VDQkloQUp5elQ3?=
 =?utf-8?B?V1RsN1FzQTM0Y3podnoyWkV1NGMwTkdRVndyejRyWHo1VHRTbUhyQUxZTGty?=
 =?utf-8?B?M2t6aWhISFdmWjR5cno1MzJCb2kyWUN2N1docE85YzdnY3c0Y01TalYwcDJZ?=
 =?utf-8?B?ZFJYSCtzOWNIeEZ5R2hRTi80NUlIdUhIeUVxY0RmcTFvYWtsell1czJCY3N5?=
 =?utf-8?B?NTVYVnRrOUZNOFAwMzJxUEVKM1NHd2VmWWR0M2NabFJ1MzJxVTh4Tms2N0Vp?=
 =?utf-8?B?Q2lpdCtlczdybjYrY1pBNDNxZE0vaVorNVpNU0hKWExncFQraDFLUk1GVlNn?=
 =?utf-8?B?ckRsaWUveGhSYUREa0ROd0pyOERucHlBaVNjbStmUlBDVFYrTmhsK3BYYkxC?=
 =?utf-8?B?Z1dnWjBLeko3V1crOEY4OU1ucnhSeFJtQ3NBSE9GSlpkYVJ1V3ZHQUVHQUpX?=
 =?utf-8?B?UDVPR3pSQ3NQSDdLV2p3bzh2bm8zSFVuclNEM2NrK3hmWnZRWDdqcHZGTGkw?=
 =?utf-8?B?dVo3MGdGOVJWb0JaY3VMZ2RDZ04vSllvRElCR2VsQ0t6bU1kalJDS1E3SEVE?=
 =?utf-8?B?RlNFOVFaMklwRUNsam9FbzRUOWpOT1ZFWlhIclNvQ3lJUTJaWEJ6MGt1S1lQ?=
 =?utf-8?B?czQxUWNhaCtnc3Y2TWpBU2tFcHpMMkFaY3QydjF1MHUrZTh0UGI0ZmV2SS81?=
 =?utf-8?B?WVRBY3ZDSTFoTmw3K3czdGx4bjZNNlRMVUdGOEdFQnRVb2w5VHdGVDdZZ1J0?=
 =?utf-8?B?VFdKcVhzM1hzbkFLbFpxa2xESDBaQVBRekxBanhFcjBYQi9jZDBkYVlrbzdN?=
 =?utf-8?B?dXRRbW42TGZsaE1JZDhGM2JUYTdhUyt3eGFqcW15VnEwcTltMDZITkpFc1Fv?=
 =?utf-8?B?RHhUNHh6b2FVb1VpbWk1OWkxb1d4RmZuSnpvUTZOVXR2V3pkNytaUlhIczEy?=
 =?utf-8?B?K0V6Smw1bi9OU3VVUTA0MVhVeDR4L1NlVWxvaXR5SFdPaEpDQnRMMzMreUR2?=
 =?utf-8?B?QVFwUlNnSHQ1QXBWRyt1dkpkbjVLOXBxSGkzMVpKMThCUVFyMVppcGR5b0k4?=
 =?utf-8?B?cDdhZ3Q2d3lXQWFJaTdGMVJuajRXS1ZoY3BJNVA5OUs0ZERJaExmenFkSEd3?=
 =?utf-8?B?OFMxOHFXQ2ExSzdYNjZscFN3NzVpOXU5ZGcxeVh5QU0xU09aL1FXM1Z3cW5T?=
 =?utf-8?B?WDY5MkxTcyswbUVYd3g3cDlmZ2l5ZVBmbFlCL3Z3dVlkbTVmUFlUbVFRcjEx?=
 =?utf-8?Q?YLKJua1hD86agg2U=3D?=
X-Exchange-RoutingPolicyChecked: 4wGisXEtZ9CopycQT6KIf9XUc2S8o2QhnGzpx6hocV6X/6MnHwh8NB641j7HXAbyQ49+4TzkiT2/lOVUlAGC5gQJeYoP0tl9ixBK5ixnyrqxy0cOWBr9LEIIaXBPYwNQPT3ASmXUXG+gpJ041IKdjgVje6yC063XKEp9U3uvK0DRRCB+ayUPuUTlAaCXzGGsbLKTeY+BaMHBgA7szf25bHvlgRXf9ikqoVKBIntReSdXS2aOidno6gWyCTX8wH5RbW80C5Oq22Rje69+/jCEYC0ZVs/cGhZ4nQTyiBeN8BGhHHdgRz7/UpFHoFaQbEzVAEUh7V9JybOQUlc2v+ZHMQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f2b49fd-5ab0-4b9f-ec34-08df155f75bd
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 08:33:05.3424
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S/vIUSdEoA8YeRxv4dkuJBdPiUnlXODekXJPtFhJ9hyZhjS6SshkwUejUvlTFVELE9USsZAcG2dPW3JRM5r84dIkf1Naf6aflZTKNKjsL7w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8741
X-OriginatorOrg: intel.com

On 9/16/2026 12:57 PM, Takashi Iwai wrote:

>>>>> In theory, it can be a hotplug device, and in that case, we may have
>>>>> two device configurations for multiple codecs of the same codec chip.
>>>>> But, that's an exception, and I wonder whether we should care for the
>>>>> model option that is mainly used for debugging or workaround.
>>>> On reference setups we do anything. 2+ standalone codecs on HDAudio bus
>>>> in our lab is not some kind of sorcery. Obviously right now we
>>>> workaround the kernel by applying a bunch of patches. But adding a
>>>> module param (of type array) covers both: any userspace and any
>>>> reference scenario.
>>>
>>> Well, using an array itself isn't a big problem.  The codec module
>>> option could be an array, too.
>>>
>>> The problem I've been seeing is, however, that it's cumbersome to pass
>>> the arrays correctly if there are multiple devices.  Currently it
>>> depends on the controller probe order, and that's often unintuitive
>>> for users.  This problem still remains with your proposed change --
>>> even more confusing because now there are multiple entries but
>>> digested differently (imagine a combination of hda-intel and SOF).
>>>
>>> So, obviously, I haven't found any good solution yet...
>> snd_hda_codec is fetched with SND_HDA kconfig which is always on when
>> SND_HDA_CORE is selected - this is true for both DSP drivers, avs-driver
>> and the sof-driver as both depend on SND_HDA_EXT_CORE:
>>
>> 	SND_HDA <- SND_HDA_CORE <- SND_HDA_EXT_CORE
>>
>> Depending on dsp_driver, not selected drivers will quit probe() early
>> before the code gets to model assignment part.
>>
>> And thus I'm not sure what you meant by "combination of hda-intel and
>> SOF".  At the same time not quite sure about "controller probe order"
>> issue either - bus->modelname and codec's model are two different
>> things.  It's likely I've missed something and if so, I'd greatly
>> appreciate additional input.
> 
> Basically the model option is passed per controller, not per codec.
> 
> So, if you have two HDMI controllers (e.g. built-in audio and HDMI on
> d-GPU), it's common that they are bound to different drivers (ASoC and
> hda-intel) on the same machine.
> Now when you pass the model option to snd-hda-intel, only the HDMI
> controller takes it.  Meanwhile, if you pass the same model option to
> snd-hda-codec, it's taken from both, and the order matters, and you'd
> have to be very careful at which position you'd have to put.
> That is, the same model option, but they have different values.

Marvelous! Thank you for the example.  I was typically using a FPGA for
multi-bus tests, oh well..
In such case I do not see us avoiding the bus' modelname when specifying
the quirks e.g.:

	// array param, [SND_MAX_CARDS]
	model=my_bus_xyz:my_codec_abc,my_bus_123:my_codec_890
