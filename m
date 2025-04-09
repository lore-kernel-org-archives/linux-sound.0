Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A16E25D1EF
	for <linux-sound@vger.kernel.org>; Wed,  9 Apr 2025 08:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744185823; cv=fail; b=a03slifo3Ygwh3NG+C06ptqRFwQ/k/fbBTdHIqoycKyKTFJd3Sk2GZSiYqtY15DjTp3LV9gbks98FlGkWHFZei5I+9j8Bc7DON7pgiVxe9zyLmItYBe/h3hgcL9R3y/utO2uYktxZNuQzAdKL1BRHO+jUW7/ra/09myuFx/BFVc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744185823; c=relaxed/simple;
	bh=fTOPtktVNhiYjuyCJlKNzEAEboCZ47BSih6s091LiVw=;
	h=Message-ID:Date:Subject:To:References:CC:From:In-Reply-To:
	 Content-Type:MIME-Version; b=aJ+ntFc4f58kddO98/BwSOm1sKm6+dNOGqfq+Xbk5P51Kp6cRH1H1SXnRxcmWQjfh3azs/WacmD06rBgmFhNafYVVJzCgOmmX8m4b+2lhxpTcfLbY+0KbVuzt8OXfEfjdW7qH+WrMRDI+JnQjejY4U4/GWwJbsMIKPFZUmkAf7A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BCYzmvS0; arc=fail smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BCYzmvS0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744185822; x=1775721822;
  h=message-id:date:subject:to:references:cc:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=fTOPtktVNhiYjuyCJlKNzEAEboCZ47BSih6s091LiVw=;
  b=BCYzmvS0/8X4KIX3myg2wlXwp22peOCC4CG85pzzYdnwMdt2kLGhkBvQ
   +EC4PisblWo8CsB+tO6yeDhnPy1RXDTflv90LyqtDbZgm8gVwPXxIAcRr
   Q3p2yN1QoDUmnDIC6l0h0OohlxC1veew6y4knqyevA5Tfm7InxKiKlq80
   paPGiWc4dibwok4hK3k9ndLYeHLVNkbepMnQ+s96XDRWdrrUk6vBDlJLB
   bHmIQA1Y3ORHrTJbsAprR9aXt+kGok1zSl9+8FVY3G8Ivh2M2JCP9wVL4
   RBkAE9t1HGWDerLi929dx17FwJKepqUrBmNcSneI/Duv9OtQzt3QtIJR+
   g==;
X-CSE-ConnectionGUID: emSnWP1JRqGMaKF826z7RA==
X-CSE-MsgGUID: 9cRi8hTQQwCew3q14BOlwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="49439549"
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; 
   d="scan'208";a="49439549"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 01:03:41 -0700
X-CSE-ConnectionGUID: XVDzPrR/SweJ+jrod/+Gtg==
X-CSE-MsgGUID: NxVzCTD6Rb+OCMZ5ei8CPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; 
   d="scan'208";a="133493558"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 01:03:40 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 9 Apr 2025 01:03:40 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 9 Apr 2025 01:03:40 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 9 Apr 2025 01:03:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iQXXTkP95ZJQZm86tipKdtW4z06bbucRX+WqHIGSvgdgcjZzddp1zBblWJ7k+Es/SYeTtiek1yfnsl3oh+pJGe3TjO8mnfMObM/TiFgs9eCG5cwBFgcPO3056+6PGkR8aduTqpfWPFS9cVJ+nwxyWTzGVJDZnF+YhRzCHWTans6bzkx3YUoLNW0+y1b8+vyL0wVTW3odA04oO7Ld4Z4EnGHEIW8/UJkaj9frIYoAp8uXvBQI15IflGXBk4UIYimjeLDTUySilV7k18zNz3Es3E8yeEDk0jh0Kqvt44p9dK60zAgSjg2MRLl+D7nCn71ao+N7O7TGbokxkMLtAnlXAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wJ5752t9cZSMR9PL9R1m6TLUE4iApyyo66zQS2auOh8=;
 b=rC6dMp01juaZpHrAFF1z+C9sFdxLv7pPv3VDnXgaobnbTrKR6odzaZJ7/AkeUuSCucp/cJ0sE730luoG0a/SC4Ovuje/HKsbwo7EyYA0PX3VB9hfv7kPCYMiApcJtPPjtmpMRkq50yc5B1b3duPjpLxmbknmqroHaXlJTiQCiu9JfM+k86CQ6zY9Yv2Qs/lpHJXr2sW7UhKGviJ2Gdm7L3FGzVAYewn7zz7puWRXOVo72uEdvDoWW9t7LjeYVeaczyPkTzfVmp4oTpP4G3uPqB0iD/jKGGVdSZxeczgmEZchvr7ls1wtNewlTQDxHED0beNjixzPsC455CkgKB56PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 DS7PR11MB7784.namprd11.prod.outlook.com (2603:10b6:8:e1::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8606.29; Wed, 9 Apr 2025 08:03:37 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cd01:59f6:b0f8:c832]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cd01:59f6:b0f8:c832%6]) with mapi id 15.20.8606.035; Wed, 9 Apr 2025
 08:03:37 +0000
Message-ID: <062c88bf-d4d7-4fa8-bc2d-eea9de45fe3e@intel.com>
Date: Wed, 9 Apr 2025 10:03:31 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] ASoC: intel: use snd_soc_dapm_to_component()
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: <87plhm9h5q.wl-kuninori.morimoto.gx@renesas.com>
 <87jz7u9h4c.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Bard Liao" <yung-chuan.liao@linux.intel.com>, Jaroslav Kysela
	<perex@perex.cz>, "Kai Vehmanen" <kai.vehmanen@linux.intel.com>, Kiseok Jo
	<kiseok.jo@irondevice.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
	<broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, "Peter
 Ujfalusi" <peter.ujfalusi@linux.intel.com>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.dev>, Ranjani Sridharan
	<ranjani.sridharan@linux.intel.com>, Takashi Iwai <tiwai@suse.com>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>, Benjamin Bara
	<benjamin.bara@skidata.com>, <linux-sound@vger.kernel.org>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <87jz7u9h4c.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA0P291CA0014.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::19) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|DS7PR11MB7784:EE_
X-MS-Office365-Filtering-Correlation-Id: fa82c8c5-e371-4623-f107-08dd773d080d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a080dXVZU21Lb3BpcSthdVkvSjZOV1pBckZMSjZLODQxMnFVTjRtY002VEg3?=
 =?utf-8?B?SXJQV2xiaEYzRkxXWHZBdk1EVlVHZjdkL1l4clJpODA2cGpMaXVSYzdqTmtQ?=
 =?utf-8?B?NVo0dEZuV3hJK2ZCUmhvZHNIUnFrcWp0VlpiQjM5SXArbjdzWEJ3eW5wdjhF?=
 =?utf-8?B?K1M5dGd3RDVaQjgwYjNFT0pmY2x1dGNMdnBBS1Q5YmF0ekRMbzR3REhBbU9l?=
 =?utf-8?B?NC9MNER3QXVpK2NKMU8vSE5mR0Q1V3BHMkMzNUdSbTJ2Z25tMUZiam5QUkRz?=
 =?utf-8?B?Z2hieDlLWWY2aVhQcmlCeXBMWnJScnpVUzQ1TXVxQWdBQkRsUTdwQzRNT3Jx?=
 =?utf-8?B?S3U3cXVnaWkrUllBdW5iejNnNlpHRFhMSEJQV2VmY1NNRXBSQXNIKzJjdXAx?=
 =?utf-8?B?NGFlaW90WGRKSzh2T2Z4bEVGRmc0dGVBaC9IQ0hCbGwxM3NwZWpFYzV0TzNr?=
 =?utf-8?B?aFFlMjB6VTNOYml2bm5YaFREaCtlOFBXbkhwTXpuOUNFS0hOeTJlWVdGWVBE?=
 =?utf-8?B?REtUTGJPdEgzaTM5aXJ2VUFjVEJKWGxUWlYxZ2gwdnhGS2xqcktPb3pQTmNX?=
 =?utf-8?B?RW4rd2x1OWVoZ0FLeTZpRmNFTGpDWXJnbzJVV2FKdkNFSitOSXdmOE5aUmc1?=
 =?utf-8?B?UGRzenlodFNBakJYNm5RV0dHb2hib2hWMDVXM2dPNEpYN2x1Z0ViTWFhWWE0?=
 =?utf-8?B?cXhZV0VNTnlZQjZBUXptUGo0K2xXbjFHTzFCRUJsTDRIaTFNYUlZdnZtMWVZ?=
 =?utf-8?B?bTljUXB5cmtWOXE5djlyZ0tXb0labFRFeTdabS9CNWE0cHNmTFR2SWF5M3BE?=
 =?utf-8?B?a0dudTZURkI0NGFOTmxvaWtzdmQ0aW9VRWlaNzhKcHlud3dIV1laNC91OCtr?=
 =?utf-8?B?TlNhZWUrbW0vOC9pclhVNmU5TTRFYzRxaTdicXlXRENtK1FRa0xtLzVMeXFY?=
 =?utf-8?B?ZjE3UXQvNzJVejU0QUZCdnZTM3p4TUwvTDljcnVLQnR5YmNyM3R4Ly85d0hU?=
 =?utf-8?B?b2pjaFp0YlZDdGVUdmdjQ3NwVU15aWpET3h6czdmR3lPa0cyVm1CZGFJK1FZ?=
 =?utf-8?B?RG9vNDJRdytuRG9ORjlvbllKdFRnZVY2VGg4Sk1Xak02Vjlaa0hJemFZQWYr?=
 =?utf-8?B?c2o5Zzh1NnRZMm01RjN3RFR5Y20vL1lDVUFybjl4aFFENHp1MkJmNnEzUEM0?=
 =?utf-8?B?czJ5RG1TSWtuQ0ZpckVLVEdpUXo3dnNKMFV4R09ySUsvSU5Bbzk1SHNwcFBV?=
 =?utf-8?B?MGl0SzkvcmJ0c2dodGJXc1Z1R0lTWDJnenNJRGg5citVN0oyTDFadE90MUFO?=
 =?utf-8?B?aEpsTUxHcmRSRFdMQ0V2UjlIZGVKSjZtdHFiVkZiZUJaWFJSdHRXUUc1bWFK?=
 =?utf-8?B?a0ZnaEhGRXFrTHZOUUVQaU9aQUowUUlZM3dRUG0wcS9NZG0rVit1dTNxc2lV?=
 =?utf-8?B?NUNRWVNqTUQvV0xpcnNtclVTVGJGMmxnTk5GVG8yNWtBSXRGT09kMHl3eHkr?=
 =?utf-8?B?ekEwRnhFQ3RUanRxVVRMdVVqcmxod1Z5YkphVmFKR29MbzdUOUVpMDg3dFNI?=
 =?utf-8?B?K3NyQTRJSFBnVWoyL3Fkc3F5OHd0NlllZXdERmZqRE05YmRaU1g4TnBvRlpY?=
 =?utf-8?B?WjdtZDlPOGVxZGY2YXdOSXBCaTVkSXRLRTVyVjFibzEwUkJlSEJrd3FZelRZ?=
 =?utf-8?B?aWpWUENIajhRRENCN2xVWGtzOTRab002eFk4aVZrY0NsUG1vbGZDbzQ4dmdu?=
 =?utf-8?B?d2F1NExIeTZLOGdSTDZUL0hpemRuRUJlMzQyQ2U3MkdkN1VCRm95cmg3Tk81?=
 =?utf-8?B?QUFOLzNtRnFoY3I4eHc5NlJJSFB0TzI5Wkd4Q3pBdi9uV2x5ZFZFNTZldlRR?=
 =?utf-8?Q?OkW0muPqCUVV5?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6375.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TmwzVzliNVYyZ3dER0xkTFV5NDBTR1pCSGRteWkvRWhyZ0J4bU0zNzNHMFNT?=
 =?utf-8?B?dU8yazBrejdoQVBmT05lcDRtWHV6N0NEWUxjaWJkbEZTdVNyR2ZacDR1YkxL?=
 =?utf-8?B?U3J6bGp1NGpkbDZRQ282U3Y2eXFvMDJ1d29HakJuYnNJSlhtK2RTWjZIS3Yw?=
 =?utf-8?B?dEdQNCs3c3ZEd25memlTV2ExeGdxUWExR0w4dGwzazZOc1E1Q0hqc2FDRmZG?=
 =?utf-8?B?ZVFuMWY2TU0vSWxvRy9HTUhCVG1GcWlUQlU1SXUremhCVlpLM2tSL1FGOWNF?=
 =?utf-8?B?RWQ3NVA4aHRjMzdvVzFnZkhBSjlxdDJ4OUF2cklnOUxFUTFING1VcnZNRllq?=
 =?utf-8?B?ZHROQ3NFUG9QLzA2QXdOMkhBR1c4UXNCcVNVcXlzS1J3cUhJQWdFWVl5ZzdO?=
 =?utf-8?B?enJHaHlTd3Roc2xxN04yOE0xSG5kYWNQTEcxcUJwNDYwOU1pS0xRb2hqRGNI?=
 =?utf-8?B?ZDdCRlhISWFuNy9EY1dsemZSYTM2UnlGSzczQldFNE91RlhEWG1RVS9pZzlJ?=
 =?utf-8?B?NGN5dW1jaWtrM1QrQytvNW95aGhOc1g1emNDQSt4VGRZZkRyanFpdnh5V3dw?=
 =?utf-8?B?Z24xeEdiRUpBZU1HSThXRzVDQ2tuZXlEMGFDOWRuMnBTM3pvKzBtUG1NTlUy?=
 =?utf-8?B?S2NuS09sUWNVVjlJZGRPZVFzQ3YyVC9YL2hBMFc4MEtUc05YWkc4eTg2bjEw?=
 =?utf-8?B?VllxWGx6NEw0Tkk1T0dSS0VOUDRzR0JUMXNLNmpTdDNyUytqeW1id0p2YVZp?=
 =?utf-8?B?bmdUZVZkenFtbTlLTFNwdzBkeTNFcXZmeWtRWTZPV2M2Mm9YU3B3QUhueTlq?=
 =?utf-8?B?Z1p4dys1MWhSaTgvTFErUW1iT3lwV0tBbWdFNWY0VnhkU1E3RTk5OGJudExP?=
 =?utf-8?B?MTNnS1lDbVZ0ZHMwYXZpU1grM29zV0tmOG9IYzA1K1ZXYlVOL2o0d1BmQWdh?=
 =?utf-8?B?b1ljSjN6eEtHWGxGQkFPMVMwcmV3cXloSU1VYnJ4T1pueWtRT1YzNEhDN0pL?=
 =?utf-8?B?OEtjZkF1d0UvWlV6QTM0WkE0cU1valZRaUp0YjY4L0tiRmEwNDE2VUJpeTRu?=
 =?utf-8?B?WkpuZzljbUxVQ3Z3akRWdHdYUTBPQXhQQmFBb0kxR2plRUJvY01oNCt2S0Zw?=
 =?utf-8?B?eDFGZ2tNWDBzdVNBNFB2SmlmNHM5RXZCbUJVaVZyM3lIWFRSVk9SNnVIeUQx?=
 =?utf-8?B?VitVMlNoWUh0R3NHWDkxTDl6T1czdEEwejNpaTdOVUFpOG1RY0ZDL1Z3Rk5j?=
 =?utf-8?B?NlEzckgrQVU1ektMa0R4REU3cU1kQmQ3MW4vZ25nNXBmdmU3RVlSSHJ4dW5F?=
 =?utf-8?B?UHJkR1dUUjJxbHpMRnZoU3lzbFhaaGptOGhLNUxsNU40eFpyeWIwZnI1TkUv?=
 =?utf-8?B?cjI2ejBBNjJVNkhCUVlQbldQUDVuQUlFN1BlQmE1YWwyK3NxcE81eEhrMUZm?=
 =?utf-8?B?QVh0Z1dyN3A5NGlUSGZvM0owTitxTHBIeStGV2tXcm1TcjZXa1loZlFPRzRh?=
 =?utf-8?B?U3RqS1VTYVBuVWN6eXAyMkpURUdnVXVBNTlTMkRDRWJrUXNsZEREUkhBczlw?=
 =?utf-8?B?ZHN6cTIwOHhtaHVnUnlTZk1jRkE1blgxZ2cwRFVoV3dEQURLTVlhdm5la2dI?=
 =?utf-8?B?dHdZanQvd2FVUFgzazJ3WkV5bUxTMFdtTzBDMlowLy9scjRqQzFDdU5XZUR1?=
 =?utf-8?B?NUpmU2RTaWovbTlzeDUzc3NxalRVbVlJUHhxblZiU2c5RWN2WXB2TFhYSUxr?=
 =?utf-8?B?ay9lSU1MdjZZRXdBQ0NoSi9lUjMzNEhRR2FTbHg4dEpUcGF0a1RsWWtXTEo4?=
 =?utf-8?B?RnNZV1hlQ29jNlJDRlFQbmV3Rk5GUEdtbkxZYXg3S3hmT0xWUnc3aUhCMzc4?=
 =?utf-8?B?azV6QTJSUmtSYXdON0RIaDNsWER3aEt0dDFTYUtuS01FN2tkUEZGT2h6VzZW?=
 =?utf-8?B?Snp1VHJSRHR2bWU2VDdpNERYdE5MRzdic25qZHF6U25aZHh1OXc4VkVuYTcz?=
 =?utf-8?B?U1dwUDVmbUsvdlZTeXV6TGFrdEpZemQ0Z1N0SUZvQ2JKSFVHY1JjRVltN09Y?=
 =?utf-8?B?RFVTU04xNFlkek9iS2pwSVFGSnc5RCtNZkpuWXE3ZWVEc0NlTWZnK3lpNXRh?=
 =?utf-8?B?N2ZNcUgxRTh2N2haY29CeFM0SnY4SnBJZkN3OXBOcng5ZFM4TWV0T24rY0lp?=
 =?utf-8?B?cGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fa82c8c5-e371-4623-f107-08dd773d080d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 08:03:36.9204
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ywGjUrH+nt1OPnySbmB1xhhj0vIjcx6kb8IubcnUkc4qhhtfE0Mwx0AFj558e5pxwEsvC0BRN63GVOqml5RaCa4Umv9iie8rJqr4abL1noU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7784
X-OriginatorOrg: intel.com

On 2025-04-09 4:57 AM, Kuninori Morimoto wrote:
> We can use snd_soc_dapm_to_component(). Let's use it
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

I'd appreciate "ASoC: Intel: avs:" prefix in the title. Keeps it 
coherent with other avs-driver changes.

> ---
>   sound/soc/intel/avs/control.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/intel/avs/control.c b/sound/soc/intel/avs/control.c
> index 2e01dc75a15a..1af270ef0c8b 100644
> --- a/sound/soc/intel/avs/control.c
> +++ b/sound/soc/intel/avs/control.c
> @@ -19,7 +19,7 @@ static struct avs_dev *avs_get_kcontrol_adev(struct snd_kcontrol *kcontrol)
>   
>   	w = snd_soc_dapm_kcontrol_widget(kcontrol);
>   
> -	return to_avs_dev(w->dapm->component->dev);
> +	return to_avs_dev(snd_soc_dapm_to_component(w->dapm)->dev);
>   }
>   
>   static struct avs_path_module *avs_get_volume_module(struct avs_dev *adev, u32 id)

