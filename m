Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4056D22A1D4
	for <linux-sound@vger.kernel.org>; Wed, 11 Mar 2026 12:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773233653; cv=fail; b=ZQJDRaGJkYuvh2OdzcR7ovlVN8dZk47iUYqJCBc9yJgnKi3o688/Cq1PdVc6KW6jCU+8TI5PGnBYhlpjJ2/r0GmltDGA2tN3IjmIxGU8TEzlhACwjq6HQ3ESpYXBelSj8jtpiwOCTolnIUjIpRxqGN5mN4yfUlNnYYxyQAGe9KM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773233653; c=relaxed/simple;
	bh=i1Hdv2XYaeixd0Oq7N1B+nKooM3z5FJjG2vIHObnxjU=;
	h=Message-ID:Date:Subject:To:References:CC:From:In-Reply-To:
	 Content-Type:MIME-Version; b=RAG8JEcW8cp8sTmK1EHI+jHk/zsYfQc5uhkYalGZeiKEEz4pCRzORAtyR8kt+OwPVKaHjk3mYmusGsVW/ErAgbbTXaLgpxx2WbiI68eOf3dsASVQxjMGmn18HKR39nMNoEYwqhkMD4kJjp8qQMacF6rIfYWbOJrQ1gDYqSw+5Nw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TP4OQ7F5; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TP4OQ7F5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773233651; x=1804769651;
  h=message-id:date:subject:to:references:cc:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=i1Hdv2XYaeixd0Oq7N1B+nKooM3z5FJjG2vIHObnxjU=;
  b=TP4OQ7F5G5AGFmY9NHD5HpWZ27iAFURSa6ZMWOX5rWulXwtWd8sszLCr
   tFTLiks1hBYjZUc5L3vJ8SXjFmNvFtR8mXte0YNwPD1PAbAc+tWP7y2jW
   7a9v/1MRbco6GoG6ueW6HOCdvwXad6uXqS4J8AhWBPMXg0uzt4ak5PiLX
   S9UWo/EAIr39wvjrg5rmNP1qkj1Cro2Hbmk0s3SohPKTcy/zkcr3uPyMU
   U/HIrDcbs7rnuLlg88XS+kXN8jXt3bTJgfueHPeS4xrKG8EPRXr9DvWF/
   9+SK7lOqOF0u67yq2nE37WN6W91gXDIGHXse99WvKapRcKn2tlIhbArXT
   A==;
X-CSE-ConnectionGUID: XIWlZT2kRKiwBJQI9XnQzA==
X-CSE-MsgGUID: 7kolBPyFS9K39CiWBXxGmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="74337811"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="74337811"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 05:54:11 -0700
X-CSE-ConnectionGUID: 6f5Mq9nYRFmWzCEYc6BJ+g==
X-CSE-MsgGUID: a2ghvgx6RH2yoO4CGm8AGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="222992955"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 05:54:10 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 11 Mar 2026 05:54:09 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 11 Mar 2026 05:54:09 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.49) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 11 Mar 2026 05:54:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZCy1wOHeXWd2hJ5jxif/lBXw4WFs8VVGE9mSTO99YLeK6YP8BOHqyGihacnedNKEwPycCfEOApaGYsmRsxV0LLnkexcLS7kV+BibSUsVLWRJ9Vrf1RFJheTpz9HwrA2Z2x8GEWOXYEBIgLSzy90g3bv+WFWWwq7LI1PabL+oihq/borPF8RkF/L6RqdFJ4ngBAwP3NAEO6R77ds8i+DK5f8lsgdkh7e34K7Ca1N8z3dFmpVmXNM5/uvXFWO/0LgnvW6kpZZl+sQIvxlSKsNLG2A1QHUoklNn28+aXETY8wFurUgpltBBfyTt5IE1FEkdPlHBrTGadsOwtW+l7XY+uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eMfF9UMToc7XdMvn3R7rPukVV72zzVQ+qqN0ZE/KgYg=;
 b=e45eUU97upjiyw5TzJvTppNoZE+IHGCtQkh3Snn/FJsapIaAiphJru8wg7wKXW7DIv+xZWEXG+HvDB4pqEZNQQjkpAujoSJdShLI2SI9nLIuz7MlGo3a5DerZehicjZxWljx6rS2M6WtiZoX9xOZBNBu9Dtws8tVkf2tFnhpGJ9Ib+LlkZqayj6++3NFHAwUWAIxNi7e12b4Gs4TszYqwFCNtNYuMUwrw6B9tsAuAgkXxpNheHGdXN7d9oAgO4V6qkxA5CwMvMTR2DY+4ZI8rjMVDVEVoa34DIM8B68KrHsiaUEh3B7EJeWb6qTkfm+kb3ycFFHjaMLZfdUlhdswzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8283.namprd11.prod.outlook.com (2603:10b6:806:26c::16)
 by SJ0PR11MB8295.namprd11.prod.outlook.com (2603:10b6:a03:479::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Wed, 11 Mar
 2026 12:53:55 +0000
Received: from SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::d18f:6b38:584a:214]) by SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::d18f:6b38:584a:214%6]) with mapi id 15.20.9700.010; Wed, 11 Mar 2026
 12:53:55 +0000
Message-ID: <80900a76-f35e-4959-a178-f66b718ab9cc@intel.com>
Date: Wed, 11 Mar 2026 13:53:49 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [Question] ASoC: Intel: avs: Guidance for finishing new board
To: Carsten Behling <carsten.behling@googlemail.com>
References: <7asofwgi5xn2yux4nau7xvjibfokdzipxsmmjfkixs33ceguaj@22xbaftccepg>
Content-Language: en-US
CC: Liam Girdwood <liam.r.girdwood@linux.intel.com>, Peter Ujfalusi
	<peter.ujfalusi@linux.intel.com>, Bard Liao
	<yung-chuan.liao@linux.intel.com>, Ranjani Sridharan
	<ranjani.sridharan@linux.intel.com>, Kai Vehmanen
	<kai.vehmanen@linux.intel.com>, <linux-sound@vger.kernel.org>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <7asofwgi5xn2yux4nau7xvjibfokdzipxsmmjfkixs33ceguaj@22xbaftccepg>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0429.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:81::24) To SN7PR11MB8283.namprd11.prod.outlook.com
 (2603:10b6:806:26c::16)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8283:EE_|SJ0PR11MB8295:EE_
X-MS-Office365-Filtering-Correlation-Id: a3819b3e-9c00-4ed5-4617-08de7f6d40d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: lcDcf906+3dethge9HPwBFaQzG3MCbqjhyU43osjvZ4ruLfe/kgRVBbeGtzDTng/REFZHIKiSd/ta51l7C019wM30LWkAQytL9YyKhf9Te3oq3imarVvXx9Xc1e2vdfIfuET2un5hBMIu8bahlY5ML4ydns19i57uB1iQz0SY4ATFFyTZLTaQcpERDDNqlbydtsEQI3d+zK0NARsgkDpPKJRffRkOKZRgytp4WABL4ORuCABCsPgMccOa1QQJh2EpunWrbpb6inaaPvjezg15xfSLv3WQiLIEkLMWsMgyNMC+ttqoHXdmAxjxAnF/l/XGM9gNsy6yXuNNhWEsdR3DONJsjtkSX9g6ly5QJK7PEPEQEM9Zv+TO3MAfFbAyGl67SZkoLe5fzXSertRdkSe1NEhc8WiQYtvdvtniYUYnTysjIX+mYUeSsQX2702BVF8sKmQsSz2Cv7FxAs/GMxJ9uvhRH2YBhk1UiftXc8g+sltghGDZPg8WqWBhYZzgrwxYp5IeercgG/GBDYB4msEqTuwhfTHz/fxOkW69PghU3hgXRMyVKusXtW6/ea75Yg2V7K+D8zkXEHCqC1QzPGZa538/mByARESDv6gIlx9OVIoDdTeboCYD1Gu/lY8BT5NifJ2y1yRN5bpeBlcrjJz+UdtMyDEJ0A7c48tDRH1uMJrgmMleso8FTwVfZAiDlwK
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB8283.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SzN2SXZpUDg3ck5CTForS1czWmFqT1JTcG1udWZ1S1EvSHo0ajArRU4rNU5Q?=
 =?utf-8?B?d014cnlUSGttVVJHMEVCY0hIVjVuS09MZjY1Y1FHYzZoRWtaQ3R5ZVN3ZUhs?=
 =?utf-8?B?OG1jOGY0aCtaVDBVQWNSSG9mditWVWhaUUdnWVMzZU1LUmF5OWx2QVNQaC9o?=
 =?utf-8?B?TzdBYzk1blV0Mm5pU0M5UU9VaUUwQVpZRHpEbjRNWnlIN3FOeER1WFhMckll?=
 =?utf-8?B?Z2diTHpDUU5salY5SjlaYTAxYWk3Yk1UTmhNQUI3VnErM2xjQU9UWUtwek9n?=
 =?utf-8?B?TmY0UXZ2bDJ6Z2xVckUzL1JtYVp0UFJxUnpieTVJN3ZRZGFBVGZUYzFNOG5s?=
 =?utf-8?B?KzY1TGttMmFIdkJqTnprajBJcnlzSkpneW5EUnlleTFwSTNyV3RmSzIwN3hB?=
 =?utf-8?B?Zm5TNGJBb09VUGQ1NXA5YjRoYXpId1l3UFd0S2hMVHZITjlWcmtZNGZGbVZp?=
 =?utf-8?B?c1dPRWw3QXJCY2N3RHQ3bzdaczVKU3NGb2dIbnI5eEU5QUUvL0d4ei94bnU4?=
 =?utf-8?B?eTlNcS9BNy84T2VKdWMyYyswd0l0cEJsaVJqZDF0VzFhejQveTJYWE0zVkZW?=
 =?utf-8?B?c09SVWsyaWhXQUFwM0ZzWThONG1pa0d1Q091Tk1NdEZJYnZ6ZU9KbWlES0Vn?=
 =?utf-8?B?dTJMdlREN1NjL0k4SDRtbDdnVnZhZkNJcGc2aUlzMEZHWlljVnUzQWI5Yzhp?=
 =?utf-8?B?L0ZNbm1ITlBEb0xITlNJZnVGejJZbEswWUR6L3Rub0tqV0FHL2I3bG1zdmg5?=
 =?utf-8?B?Zzgra2tVWmFrZXhpM2ZXaTJkc09wbDN6TklQZ2FaWGRnZ0QrYmtEWkx6QVAv?=
 =?utf-8?B?ZW5EZkxVVEVoamx4WW95WEc2QnFIODVpSVFyM2hoYkczajJnUVlmbXJNdzY2?=
 =?utf-8?B?bnJJaWkyOG5MWmNvN3pnWkZDNXZtS0dHVksvNmZqeERHR3l5ZTRRUDh5NGVs?=
 =?utf-8?B?bllVVVg4bU5BV1N3TE1uNzdXM2liWHYxc3NuMWp2VFFNc1NleFpVYnVqMmZp?=
 =?utf-8?B?QmhPcVliTEJGZkpQL2YxWEUyWFBDYThvMEtNTUpSMzJEV0FEVTJGRG1OcC8r?=
 =?utf-8?B?UGd2TWRjWlZrV1pwczJuR0VnT3Z2OTVCSldLN0lPOG5qQTlPWEwyS2t3UURM?=
 =?utf-8?B?K05nTVJIYldObmZjY0VvY3RvZ29jVDg0ZnhiU3ExZmtJOFVoenpsWUgycmtS?=
 =?utf-8?B?RXBxVDBoT2hLNmQ2VVd3Tm43T1pLakthL2ZmS2duVytpV2s2NEZaYXhTeGFp?=
 =?utf-8?B?K2Q4cDU2Slp0TEI3cjVvN1pMWXR5ZXg3WEhjVnNyTkVJVkFNVG9zRVVQQldo?=
 =?utf-8?B?dDdsUG9DTnJMTmpXbTdMRW9QWmE1dmR5cWNYZ3QxNjcxZU1tdUZsR0J6Qy9T?=
 =?utf-8?B?QXlmcVVXYXpqV0psS3ppdGh0YTBCYW1SZTlmQXF4Q3BRNEtacDd3bDFqUmVK?=
 =?utf-8?B?NDhLaTN2dnRCdkVVN2U2dDVXM0tDVVFWeUYxMlNTVjVzMWYzSjFaY3dMc3FU?=
 =?utf-8?B?UWFvWmhKRHlPczByTHhBbVBjZXJKM21UeEpJR2wxZ1drUXBIaEd0cmo4YzM3?=
 =?utf-8?B?Zld4YStCWDY4OHl6L0hoN1hWQk5DSTFQaHhsOTlPL2llYzJ3NUpha2FRU1Jr?=
 =?utf-8?B?M2dtdTFIaGlmZjVibTRCR1ZQS3l4RWd3TWp0ZXJTR1lWVHdLMjlEcStFNFAw?=
 =?utf-8?B?aXVJTWJXOGpSRjJSeG5HQVVxK1hIa09WOC9hMExtd0V2NkFyRE9QODVDcURs?=
 =?utf-8?B?c0VibWxkWUpTUVlMU1NBWkZLVWtvbkh6eTB5TWtGUlluTzhXS2o0WE5NdzVy?=
 =?utf-8?B?ZjJ5WEIwTEd3dThQN2ZWUmFPOGhMMVp4MTBWc0JDdUFQdnY4QmQ4MVNXWHg3?=
 =?utf-8?B?cTdZT2tWOG5WY0F2VHRMdGZzcTZQSzl3YjZ1b21Sc0ZmcDBvZnZ6U1V2ekZW?=
 =?utf-8?B?Y1NQdEJCeEFraHJQUTdvdURKdUEweklOMGxJSnFGS1ZpUFl1VzFGdXN2dVhv?=
 =?utf-8?B?M0M2YlR1TU5MUTZkZWswT1FuMzUvZFFybUJUTVlQWCt4Qzg2Vm53UTU2UWVz?=
 =?utf-8?B?VWFCZ1pLNFh2TGl1MVkyaHFpelBUQUtaR3BUbXM3RTFaTTlqd2xoUmVlOHhJ?=
 =?utf-8?B?eitWMG5WbFNxaXZEMHpkUWtsOThWTnpHT0NoOThFV2V4eGUrcnFIYVhwdXZk?=
 =?utf-8?B?TkhudUlNMkd3OGl6U2xkREFickJRUzNTS1hrQWhiTXY3WUNwd2lPSFZZVHo5?=
 =?utf-8?B?YjNVcEhVcDBHTjFwbFlCaDVLblJkVU9hMnhqNEZNS015VUhlYlk0S1M5V2pY?=
 =?utf-8?B?eE56VC94R1NvQ1lJR2phUVovUFVMNEpwa205Z0RLNkdoQWNaQmRpVUxoZ3FM?=
 =?utf-8?Q?WxbbZjCmsqdh4fic=3D?=
X-Exchange-RoutingPolicyChecked: AWXSFgRrjeFPHxFRbBpoOz6cFZmwwyAIVQX6L+Y2E6xri5OFkDCUpAxBzZYBLeOVAFBM/239u/Eb+e3od2cqzzdJTVNbdiyOs0qQmUA38iK5tY0u6P6esbTz6LPoBg3nBYy6hWkc0pD2R5qb65YrNQ72sBOKefHva2sdW1AKpgfPDSyAeIx73VQQbVbqtvQto+AqlqJmD6dtx7+z9UlsLEby8UGRqXA98kk/ayWrPsNutieSE5U1KtCqBHyCo1ZcXo7Sk8abUbBP8xdFTj0juzdvDFpUbCgpoxtfC4QqEn4vwNk2Lnookvgon6mjkkyfPHvcEzGALANTHstXyrbxmg==
X-MS-Exchange-CrossTenant-Network-Message-Id: a3819b3e-9c00-4ed5-4617-08de7f6d40d7
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8283.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 12:53:55.2510
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4LenjoqQh1tEzuaQ2Uc61UKuS5QJeIpmfcykShl5jBw9Fy+D9CTSDK+N44yc70E5levjm7pvoX3BKvFbdcUWEgcjlHsLuX4i0HuR8WIrsIc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB8295
X-OriginatorOrg: intel.com

On 2026-03-11 1:05 PM, Carsten Behling wrote:
> Hi Cezary,
> 
>> Yes, for ApolloLake (APL) devices the avs-driver is the way to go
> 
> I got this answer from Peter Ujfalusi:
> 
>> I'm not sure what you mean, but APL is supported by SOF stack with IPC3
>> and sof-firmware package have the needed firmware and some topologies
>> for the platform.
>> I'm using SOF on up2 board with HifiBerry hat on (PCM512x).
> 
> I thought SOF was dropped only for CAVs 1.5 (inclues Apollo Lake) due to
> this SOF commit:
> 
> https://github.com/thesofproject/sof/commit/0f0acaae94ed4cd3af907584ea89fdee0581b0b1
> 
> AFAIK Zyphyr RTOS integration and some other other issues made that necessary.
> Since I don't know what does that mean for the kernel drivers I'm still not sure.
> Where would a new Topology M4 file added in SOF supporting a kernel SOF driver?


I'd suggest to follow the recommendations. Intel recommends avs-driver 
for APL-based platforms. I'll refrain for commenting out-of-scope subjects.

>> Fortunately, the avs solution does allow for
>> including such details within the topology file. So, no BIOS/ABL updates
>> required
> 
> My last observation was:
> 
> ~# dmesg | grep snd
> [  409.596006] snd_soc_avs 0000:00:0e.0: failed to config codec #2: -19
> 
> ...
> static int probe_codec(struct hdac_bus *bus, int addr)
> {
> ...
>          /* configure effectively creates new ASoC component */
>          ret = snd_hda_codec_configure(codec);
>          if (ret < 0) {
>                  dev_warn(bus->dev, "failed to config codec #%d: %d\n", addr, ret);
>                  return ret;
>          }
>   ..
>   }
> 
> triggers due to no Enpoints
> 
> in drivers/acpi/nhlt.c:acpi_nhlt_tb_find_endpoint

The -19 error code states: -ENODEV, codec#2 is hardwired to HDMI. 
Summary: probe of HDAudio (HDA) HDMI device failed. Some APL-based in 
the field are devoid of HDMI and, if I recall correctly, the TASxxxx 
device is not a HDA codec, it's an I2C device where streaming occurs 
over I2S. Smells like invalid Audio settings in BIOS.

My comment regarding the topology highlights the fact that one can 
overwrite either the entire NHLT or part of it with ACPI tools -or- the 
avs-topology. The error seen here _does not_ relate to NHLT (or the 
topology) at all. Streaming over HDA does not involve reading NHLT 
either, your BIOS may have no NHLT or an empty one and streaming over 
HDA should work just fine.

Are you sure your device is equipped with HDMI? Seeing the entire dmesg 
would be helpful here - could you open some kind of bugzilla or, an 
issue on avs-topology-xml project mentioned by me earlier?

>> Using phrase "dsp_fw_apl_release.bin" explicitly made me curious. What
>> binary _exactly_ are we talking about here? The avs-driver _does not_
>> expect such wording, neither did the skylake-driver.
> 
> I meant most recent
> 
> intel/avs/apl/dsp_basefw.bin
> 
> from linux-firmware.git

Thanks for clarifying.
