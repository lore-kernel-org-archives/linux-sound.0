Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CFD92F3C18
	for <linux-sound@vger.kernel.org>; Wed, 12 Aug 2026 07:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786518789; cv=fail; b=pl0oQa6kvrl4nx3thGWQeAwUvtx/b/otZw3dNKi3bbQcSeOcSYedOi22WshhkcQ5toB7xdiU/BfV2poo0m5mbMjeNXVxJoGUo59CN43RnSyL91M2nF7q4O6bIGic4noHeSxoFrBGMyOw0OilgOqszv/JoquEUcHkFGuvHJ3pFE8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786518789; c=relaxed/simple;
	bh=a+7xf7S+8aO42BuQLx72pMG7TuEtgig3pjb5XzzxjFM=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=B+rPpkWnEghmyCqH4DtlHN0HFL+ZScE056XHoCJEiEAtmzFKmpdAL+miLq02EpX/sX9PuBuipUFgY2sQI5s/4KAxlCmMt/IcOiBTzkApFeCAonfkN5uRsEhA+1jfM+E0HPZ9ulFs07/yD/pRlPVIDrFitNdHcvd1CCrhYpxrklU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h9rfVXcC; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h9rfVXcC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786518786; x=1818054786;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=a+7xf7S+8aO42BuQLx72pMG7TuEtgig3pjb5XzzxjFM=;
  b=h9rfVXcCzgJnLIzPOz1mRcEJEOwzfRiJQF2Ga/ClWlSx+nk6FFTBBtGH
   BMNR2tt+YG2H27XzHj9iJabdr14cri22KakYngujji64PzW9tGCiex5ei
   gVa7RwJmNA0cXcCp+yjNo4K13ULTh6dQL6hkZ/6eopz5dROavs5tQEueX
   cRhFw4Qt4DW8K/LLeIaXKMQjJ1XuZDymPqLUbYfzvUcTi6UZX3om0TiyK
   kMTebGn3LKzQSnMXznqq5TtmE5QQvVABN81OGVB96DJxD7JEgovfcxtLa
   uL3BY2LsohfPj7F8TmQq6FIlq6J+1qLLf4wruyMoeG5fQrNSC66H72mXN
   Q==;
X-CSE-ConnectionGUID: 4Qffc57EQaGhtoFn6mOPCA==
X-CSE-MsgGUID: CV3VeVvRT8eftctH/PGGhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="97726958"
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; 
   d="scan'208";a="97726958"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 00:13:05 -0700
X-CSE-ConnectionGUID: pIJMSf+1SA6oC4gPdHX6sA==
X-CSE-MsgGUID: tm5GDDTJSbiFmE0FXawXHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; 
   d="scan'208";a="257367944"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 00:13:07 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 12 Aug 2026 00:13:06 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 12 Aug 2026 00:13:06 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.51) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 12 Aug 2026 00:13:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oX4fHR4R0gS9SCw+TNPoCL+b6BUykwAcCG7P1salXt/ZL0wMRKi6i8Cymf4C5RZYb2GEl0edC8d1jiJkbmhlq9fvSAp06P3dvg1dfVuImejS5jCdQLZP/Rg7dDR5i6y5uxNN+rrZCqhPjWjT2gP8dzrUeG2yBxT+XfTwDFlGZEIy9c/DiIxrjiyehYwgNRNqVwajRGs8QEBkAMpOhHe+YPvLYu+1g54Y4RCqztNM5cq7w2VgJBW+LC6fZJgVBocqhcjgeavhhoPZXBWXfgvzRf8dtBuZIAszoB5/9pcTFfyQy5CjvBimxpODKMjxqt715tGLGczLq2zUdle0IJf88A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yyFfHp86ixGYR+5eD8qg21fsKRDTwtEH+NQxH4OFsyE=;
 b=hbu5BQQSVg2cyq72JkoU7rc5070vCT0xP3JhYDipdZTpggOcc4liRknEIJAzQrBj8g9hlq89JUR7WcqGpJ6XQwS0y8UXmCfS9i3yAcU9jj6GW9IMCDWrjGkyf0IPxpwvZLioFMniGYABVCzntCGD7YnXI97So+Rob9eO1+Ohs29wba4Edy202ptwycf/L41LF1U/W2vIDDUaQ0gW/QdwPwgqTXkcvlxetPtizfPYJBs7aS6wf3uCh8F/1u8ivFPfk7773xy4K5vFoTXcb4c7VHXFOWWiUDrqBMx3rRrMJGOYUAEGsHyxt4B0rGNklq8lNmtsCEi6vVSnL4hNQBi7Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6006.namprd11.prod.outlook.com (2603:10b6:510:1e1::13)
 by DS7PR11MB8807.namprd11.prod.outlook.com (2603:10b6:8:255::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Wed, 12 Aug
 2026 07:12:59 +0000
Received: from PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd]) by PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd%5]) with mapi id 15.21.0292.024; Wed, 12 Aug 2026
 07:12:59 +0000
Message-ID: <b7c048bf-d764-4264-afd8-364756973033@intel.com>
Date: Wed, 12 Aug 2026 09:12:53 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/14] ASoC: Intel: avs: Drop __force cast
To: Takashi Iwai <tiwai@suse.de>
CC: Mark Brown <broonie@kernel.org>, <linux-sound@vger.kernel.org>
References: <20260812060557.80445-1-tiwai@suse.de>
 <20260812060557.80445-13-tiwai@suse.de>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20260812060557.80445-13-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA3PEPF00000515.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d8::669) To PH7PR11MB6006.namprd11.prod.outlook.com
 (2603:10b6:510:1e1::13)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6006:EE_|DS7PR11MB8807:EE_
X-MS-Office365-Filtering-Correlation-Id: 49edd7ac-897c-4941-a726-08def8412387
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|10067099003|4143699003|11063799006|56012099006|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: 2cifkLsEGrJFTMIlHfqWCX0M03xF8vMWf1t3X46NyvbMFhm2wAQktj1wGxn/12IhFvkJalea6fcbTuTYoVhnMmp7YCTjhU+AAqiogF+HPiUXdrCa0Mwd6fUKPSl9fdTgXTvMv2XYkYwUAO/PgU72JAoRwGjp4YUbxmUljQzjm+z9PLra09JSeu1HyPqn6UlIjHutZqJNd5F1wBNp216r0VhCKfm6En/ugcXPqynMBQfqWSe9+MTqHpknLWjwSrMkM19IsoxygRhwopQ7cDDmpScKle3jOhjgdS7XbJnBqj+zTflJtMBp06qiNG181ol+Iu8eqnxtOS/NakwKlCCAKtxCu1SdkQ0XJEVoxqKz6WRjroqPoTiRJBuyWnhUnUiStgXxqbkUqJyi2XanrCN6RZagsJ6Smrs69vZvPO6v0lfmsghNoRjKjb/oO6T4hwF90mYaSoXvNCGESuaDYJWcYLaqc+WPb95EJoetATVgFtWIE0IHcho1Cs4YhiGKdRoPdEe6tAZveSjoGQlkYnbk0n4ckyhgPcvDRiAwXeuCAHilhQ/bakMCPq1W2TrXixonmX/NsSoLzrl/X6Ij++Wq2j0AsCODTfGKZ1eGm73iPDkelQTmkxXY+Eyr/wz5cbouTO+Jj80cTTIg8ke8NC9519tNNczrcehQK+XS93BW5MM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(10067099003)(4143699003)(11063799006)(56012099006)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dU02T0Q0eVQ4b3pUWGNmSkFCQy93ZzVXZ0wzM05LN3RkbnFRWk8wc3ZsNVlD?=
 =?utf-8?B?TGM1U2ZubldueENmcnAvUHVRcnhQMnJDMm10ZGhPM2xrd2xnWUNLMmVKanV5?=
 =?utf-8?B?SllmdXhucHNLSUJjRWIycllZQ01xVkZrb0JVMTN0RnVyM0QzRUlpdy9qRTVa?=
 =?utf-8?B?K3hOS2ticTJ1M3pMbEVhRVQ5NUZtMFViRWlmRmtxdjVzT0ltU0Q3cHNJNFdT?=
 =?utf-8?B?eC9pNDNNdERzQ0hYS2x1YmNiUlVkSkVhMXhlUWpNQzlIY1JOeVVyNXp1MXlB?=
 =?utf-8?B?V1lHQWhPaDlmdm5icFhNZU1jbEIyaUN6bVVaUjlRN2lxdVBzYTN0SDBDWTZp?=
 =?utf-8?B?cW1XclF2c0FRRFYxK01MS3dQb3JKZUQ2Y3d2NGVPcjc0bXdmVEZoZXlJclpC?=
 =?utf-8?B?c3VBbVBLREVUMXo3NlNjUXRZZGhqWHFXeWZkYUVkWnRXT0hEZUloSjFualJj?=
 =?utf-8?B?UjdNT1h0V1dHdkhSMi9ta2pIYndOVEVNR1pSKzNFM1RvZVRONWtqcDJBVE96?=
 =?utf-8?B?VXpTenJ3ekk5M24rZk9IVGhURU5adnhxOG1hVmRkZU5OQnh0WExqNGFTd3g5?=
 =?utf-8?B?VUs3RklpUjFwSVI0NlJBdGZsalY1Y3MyeWZMbm1kQTJSY3hlaVhyMDAvMzEx?=
 =?utf-8?B?UGRkd0hvVk9EVFZGMlhiaWRKYkZVRHVJVUNtYXFCZlVoVEwxNWxUMXp2NGJG?=
 =?utf-8?B?Tjc1QytvQXE4VjhYVTI4cllpdmRqdHU5UkFEcVphQU1UNEhNSnRYMU1wRHI3?=
 =?utf-8?B?QW85ODhIT2V2Z0dhZGp3d2ZuQjd3OG1tWnBxVkdJN2tTeG5rdFA4T2syMVY4?=
 =?utf-8?B?citTeFRtVG5HUnozYmVZOGlmNlZwZTg0N09SdjEwZTN2ZmFuM2huVkR5S1Bx?=
 =?utf-8?B?NkNTaUxOT0xZZkZLeXUrSS95dVE3T0ZlQXlCV3h1Z3FTL0FsT01BWVF1UkNY?=
 =?utf-8?B?NU41T0JGSDRSd0FPbDFnSXJPY1ZMUEpFWnJwNTZsdXhDZS9sSlZKTDE3OGpB?=
 =?utf-8?B?SjUrSjFxMFo5QWg1aFhZSmVmeXFWVTZFV0tpZmJRTlN1azAydUJDbXMvdVBw?=
 =?utf-8?B?bVJ5M2RSZEdQMEpvUXlUMldWNlpyK0Zhc3cvTHQvaWNqdlBGZkNWQS8rSDM1?=
 =?utf-8?B?ZFVVZmdyNmNxellVeDFTU3ljWG5ndnBiMEc1UjN6bGcvMXRFMUtIczZEWUgx?=
 =?utf-8?B?YmlvNTZrNVlmRCtOSUhCTzZ4Y3FhV1RJRElLTXBYd25iSGdDZXBWMDkzYUdz?=
 =?utf-8?B?TXBsR1NuNDI5bUpUcGJtWXNZMVBrVEtyWW10bzRoRDZJZlc0a2RmaUpEME8x?=
 =?utf-8?B?N1dvcnQzL3JrK3lwbzZsMklPNXVIL1hUVFhxQVhrOU1Cd2l0aW1wS01wSFhq?=
 =?utf-8?B?c1BpN3lRTzFJaXRBME9vYmg4MXJ1ZGJWTEp2UmRlMk4vOW5VM1ZVY3hpRlpN?=
 =?utf-8?B?SmhHaE1vYWdpaStBZUFvVmRWd2hubnJpOUVyQmxNczhkc2J6ZUt1M1EyYTFl?=
 =?utf-8?B?bXhtU3FVRmNYRk9LNmFueHlNaGdHYktnT3BRYkRMSXFVRWlwaHA1RjFyN25B?=
 =?utf-8?B?RXBhdHYydDFnZXB0eUFrd0doZDlMQWV3dHdVRUFWRDBvdWszc3FqbWxSblFR?=
 =?utf-8?B?ZWdmdDRTeXJ4dTlQR3VxSUZqUXpIQzhWUlh4YkF0U1hxQnpiVWl2VmwrVmp1?=
 =?utf-8?B?T1c2d0dPQUhXWlZ3WDRLZzBOdTdTWnNleGE3RjlDRjNHUFJ5WVdRNWJUNi9k?=
 =?utf-8?B?Z3RKQzZSOGQxa2hFYWxWR0FhVm1tOFJIczR0cGVzVUFIZ1RqTVdpZWhURzFN?=
 =?utf-8?B?WjVQb0ZTb1lPZlk1SWFnNmJWeGVRNS9haDRjQ1J1RHczSktPbE9TdS9yVk91?=
 =?utf-8?B?WlhEek5VUFNrUjJldWlGQzAzQWVpcW8xUmdjelUxbFNCbjV4R1d2bmIrU3lV?=
 =?utf-8?B?dC8xRHhNZ0ZiQ1Jxc1hQK2VQcTU1MUVIOWZKYkcweWkzcDI0RC9vbUlMb3RE?=
 =?utf-8?B?T0hnbkdDS2lRVVZ3NnBwanVkY2RRSEVQSGI3bTZUYmlnZVZsZ0NVS1c5Zys2?=
 =?utf-8?B?MVloUmVZUlJscnFlUWNxK1NwZ1U0NGQ3ODBSYXBCcjhHMmNCVXlHN3BiMWtF?=
 =?utf-8?B?WWNxV1ZDc2FPTE1BUndVVlpubWp6b1grV1o4Z2hGUG5NYWFLSExXQnlJYjdo?=
 =?utf-8?B?cVd6QnVnWWE4bVpITXhscmxoTTZlbUVKZk5aSCtCZnRkS1VtaVRmeVM0OFN4?=
 =?utf-8?B?L1JCVE9vSTl5ZDhzanZiWjZlK3VORDMwTEhvM3U2QnNYSytDRkFBTmZPdzZL?=
 =?utf-8?B?anJvOTNTaGlsdEVvUUVteFBPY1lVMWQxdStISVlRV1VPSUptOVZKZmJDQ2Yw?=
 =?utf-8?Q?5abDpnddFKWiW8IU=3D?=
X-Exchange-RoutingPolicyChecked: RWJLA4ZpkLxxwHDoWP5VMbVs1flF/0RYMDXs5PoBUnfj2uN6otXh9JwzgiFJbRg9J/Xtjt+efvkxycXTY4l19ZEiTT7nQvKAsz8BM6Oi4zknVG+571sn+SgdwhiKyBIM8bSr8aT7winJerY5jWoKf8m8sIyA9jrJmlSdArK6x8LHzc0RVruvLoolpFM82W9kUXEWv/oUmsrzRGLzg7rR0HQREPMMr5HCBsg2Qcv4r7cKBycStxX8TtfKYSvObinfvwnqZ8OeqVeHyQXu5vXsb0HxAyyMxShJFRIAaMCcInDyUT7Ln4AKR3GylDYg+a6Ri+r1JbldfiDXzh5rF0IT7Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 49edd7ac-897c-4941-a726-08def8412387
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 07:12:58.9548
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dCZjVSjGi0Vc3AvDYMUNrs/BFgSw+CJnOdk7shr6no9tgAu1MYDQ9WjN4zdmuJbQnqJcLZqvpEyBDwsqjGBFhThhz8CWp9eySjxLj9tjYyQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB8807
X-OriginatorOrg: intel.com

On 8/12/2026 8:04 AM, Takashi Iwai wrote:
> Now that the bitwise parameter definitions are gone for PCM
> parameters, we don't have to cast with ugly __force prefix.
> Simply drop a superfluous cast.
> 
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
A very welcomed change.

Acked-by: Cezary Rojewski <cezary.rojewski@intel.com>
