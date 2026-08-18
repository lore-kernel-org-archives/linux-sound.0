Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF771451982;
	Tue, 18 Aug 2026 10:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787049093; cv=fail; b=KEVWM4Z7Y0l82jqkSruikvkk1To8ZS/OVqdq//TZZNkMX5DiDP2oubeHL53akrXt1Us2O5Xq4Y4Fh0PMZOGqaQMGs+5XZm9jh4dQQB3LiHkDbnRE8DG9Kkms9rmjHhUcmJBWxTNdVXPJWW4Dt55D2TBUXinWNp8jUldvZscFIPw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787049093; c=relaxed/simple;
	bh=sWrF2F0UHrt/Hg1lcXZdOrk4MULs/cCww3tjNpSYSjI=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=kG7V9IgaxxwNO3LbNWSrzA1pEjLnBp3rVUBEPmXHtcXtNJ2rGKziBm5O7kwjAPKrh4VH82yzrHujNc1JUVv2r3hKhjr3nhiZpFd0IM/FJGzofcXe2A/Ym8vf63xp1/AtQR+0YXZ1pJ0Bzbk9tIrj0TbJQal9nHAbfk3I8RfdKbw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QidknknW; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QidknknW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787049091; x=1818585091;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=sWrF2F0UHrt/Hg1lcXZdOrk4MULs/cCww3tjNpSYSjI=;
  b=QidknknWyvmCNPnKey0tpJ9uXiQjZauKAvNnHJuXG91TQz1oZxnWo9aq
   DFnEs3V6ZDOgSaI70cGf+n651md8ABP6SvgXNtmJG5P7S8yKuYqY+vxFY
   JiVWatZsZ0BOZvQPqMXglaT8SLAVUbBRemgyTOQw6RCg+qfhw4EeEw37N
   4l83J55tzmAEX74wB7jxsNA27ixGFTks6X7+q7yJBrZCycDvM8QZyDJJg
   XF/4aCGJ3ECSGOLAC9CvbauVCaKaFepHKkzISRN+rTAm68uD+7LFq4wGx
   f/GsMk4+NndyLWplNWpvrvT5tN0rpTROS55dQOITRa2UChNEZFHnBWwDn
   Q==;
X-CSE-ConnectionGUID: lP195WqMTE6AsxTqW7YgxQ==
X-CSE-MsgGUID: jaDEBf7aS3KUScR7owEpbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="87413161"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="87413161"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 03:31:17 -0700
X-CSE-ConnectionGUID: fNBf9mwkStqVFMOBI0llRQ==
X-CSE-MsgGUID: BOTkI+d/QoinV/GP8cuQbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="264742541"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 03:31:17 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 18 Aug 2026 03:31:16 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 18 Aug 2026 03:31:16 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.9) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 18 Aug 2026 03:31:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gjWmrtYO/hxBHYQO7En6gKoYeYrEmGcwJhMB4nEIvydW5yJnBktiVHtROOmf/5D0Y23sorMn7yka1pemTFsBt5JMXdg5C6QcytLM4EUElNDBDhMCG5gqlIXJ9sT5z3sSGrm/16pUeoRfw+L111G9/JkggyACEge/m1xMYKhTibM8jB3IOU/jqBYPzjR1xGkw6/864pudqhzqEo4fjrfcClU0/AXQ0sdwtimHwZjCfIEiJGRRSDwIfmKPeJFFJwtE5IimcKLXEeJAt9aRMTtGzQZJzb+UtMaMQq0lOms2bZ/oa7H4sG45CqGm11P9Z+UJAre1yljaPlgKYFUF/bHfig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zTZIGZgFm8jHPh7WyQnjbDJODJ0NKppeoXhKErwsmXI=;
 b=Uc688hmOey6M4rC2tqPgrP4kjYRLQcj9Hch59P0xKpQLWL7ePkscXehaFZD5Iwxn6cGJOdby0hxmNvwWDxlpsGBD/gGiuwpPg8Ykgpk9o3T4RmYRjT4VrBHk6Ns/1PKpN45OkEekWZkPqriqajNE1Zd5yuzvtBTAWPB6CXbYTE85fAPNB+CMqQj4bpgM+jconpwSQQZBIuyokJ0I7mWtfwacCc5oKb2sTmKHgRdXgfUiWpNO7WqLOKrAhmhBG5lCqVO8Tifg6aZX/pfUHz/YABtOSx8cVdej+WD7k8LRJhiHl9osQmZuRmUMxkncTCzDsHSPp2lyXR8Re53/87LFzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6006.namprd11.prod.outlook.com (2603:10b6:510:1e1::13)
 by SA1PR11MB8795.namprd11.prod.outlook.com (2603:10b6:806:468::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.14; Tue, 18 Aug
 2026 10:31:13 +0000
Received: from PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd]) by PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd%5]) with mapi id 15.21.0339.007; Tue, 18 Aug 2026
 10:31:13 +0000
Message-ID: <b3dad816-469b-478a-b6a8-a08ac8610ac9@intel.com>
Date: Tue, 18 Aug 2026 12:31:07 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] ASoC: mediatek: mt2701: Use devm_clk_get_optional()
 for audio_mrgif_pd
To: <phucduc.bui@gmail.com>
CC: Liam Girdwood <lgirdwood@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Rosen Penev <rosenp@gmail.com>, Daniel Golle
	<daniel@makrotopia.org>, <linux-sound@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>
References: <20260817104929.63152-1-phucduc.bui@gmail.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20260817104929.63152-1-phucduc.bui@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIVP296CA0005.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:357::17) To PH7PR11MB6006.namprd11.prod.outlook.com
 (2603:10b6:510:1e1::13)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6006:EE_|SA1PR11MB8795:EE_
X-MS-Office365-Filtering-Correlation-Id: 19851093-af9f-4d6a-f0a6-08defd13d3ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|23010399003|22082099003|18002099003|11063799006|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info: XNgApcSXz+C6SYYsIooWcfDu/Sl3hn3f7OzJ7PWUCScdso2ULKgztxQhQu9ShnXlFAMuRg2ZQWPY9WOIFsfihrkD4OAL4pvN4QVcm1pyrU8c3g9IqQ5p/mRrPhB1J1OYCqbzmW9+kVwKCFkDR4g6kRZbVaTv+n2dnT1jksk06hcTdZpXIjm5Dh24lXgjt//pMA9ClLGKZSSe/Ro3hywDh60D1eOWM1ONRVPIWPJXsKaQHeIKIwQOOshCplevLTAsvbstFsC09YgfzgOt9vcL+mlysx6cL4yFMRafrcw78cRlHe4rgfP9cdlSqm1ovJbAhQ/JNXLGIao/E2WSI+miMQNn+0JJva1QvhldbLQQSksTWd3jcufxN5G4g4ZVSrEeOBbH+bXT1ZRXyC0iabARy/Hypr4xkEKZbUtkUffZ+Ck4ZACPdLudonY2Lo4KpiLtLkEvQRU0uoCeygZaj49OHEmpXlzSNIcsb6eqz8Zf9+CwoYt2DqAtr3rGral+/Ia0Vovu5aw6wxq3YubDwLX4RzG996koJ+z0cESGMPWzjM8Ld/dkS2T25qJHQCs8sx2WAa9+zgzmwOKS7An7DV3WMm47W8yfW1dSgEsynsRyd5hz5Ythq+aaH16Ipax0gL3pZGO/CbIOPmvBWNG2xKI8UDQq7LpxwsY0mvp3cvgshB8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(23010399003)(22082099003)(18002099003)(11063799006)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Zm5vS2VDOFVMOUUyY0RDcXdqQUczRWFsUlY2UHM0ck8rd3hqa0xFa2lCTDRC?=
 =?utf-8?B?OGVUN3EyU0twaStXbVk5bVFKbGRLSTBMcStJMk5WK3NUdm9mU2lKUnllempw?=
 =?utf-8?B?SHoxdkhvUkNwWVNHMzUwc3RObUdLeHcyblJlcDdOVXAzb29yU2ZOakxLWVM3?=
 =?utf-8?B?WGR5WnIrQVRyRVhWLzBCN2tnNnA2VjF4dWRYQXc5cTRzd285bHhqbU5pajBu?=
 =?utf-8?B?V3RpS3g0MDRpVGY0Z0s5LzJ2ajJRaUs5RmxXVGlyVmNVc245bWwyUENseVkx?=
 =?utf-8?B?RVB2dkFxZUMzNVIyQTdhWDRaNGNobGVxUFRFNDhQaU8rMFg2RXRlQzdHOHdu?=
 =?utf-8?B?b29nZlpSWk1RSVJENEE1R3YvZXFVMHNSZ0IzdUE1MlZwb1ZQQ1JEaGtTd1Zp?=
 =?utf-8?B?N0N2ckE3MlJsbEk5RnF6QytCVDhCOGs3aVZGN1Rjd2c5L1ZWU2loTUEzTW1E?=
 =?utf-8?B?bGhQSTI4cWJ1YXVENGxCN3BmaXEyQXV6WWh1b1JWK3BvNVlTUTRDN3V1Y09n?=
 =?utf-8?B?cU85cjByZXJpWTdMQTFiWEorbWJrUDJIbWsrQzlVMzJDdkR0VlQyQ1Y5MUVM?=
 =?utf-8?B?L3VEczJUVEMvc1hvUDMyTmEwbUY5WkxORXNXZGhDY3JuVzk0L05wbkpnandM?=
 =?utf-8?B?WFlWZHI5WXNUT2V5L2NWR28xYTJ0dmdHVEUvU1VwUGdYUDRtNDZRNDhmTnJQ?=
 =?utf-8?B?emJMclo2d2RHUzhYMVBjaDVOY1l2TzFBRSs1dDJBNU5vYnFSMlFQc1FzNTBE?=
 =?utf-8?B?cDZJdm1tdHpTMWdCbEJNSE9vUU96Y00xc0tOK2REMzVubUVwNGI5VVMxUzJW?=
 =?utf-8?B?UkpGVXVBYXY4TTdodU9uTDQzOC9CODRnMG1SdkVXSVAvMnpZbmxYRVVnM0pH?=
 =?utf-8?B?YnlEYzRmZDdDNnI4c3FseWQyNE5oakRiYSsyUFF4UDErT0V6Q1F1NWQxKzdm?=
 =?utf-8?B?TFJhTi9SZml5cldkOEYvY21JQmVLN3o4bWlpY1FEU29Xem9tRTljSE9VVHNv?=
 =?utf-8?B?U2gwUU15UW0yL0JkemViV3hZMUNZdE1uZ1AzRHoxS0IxQnhLVzhVNGZYR3do?=
 =?utf-8?B?blZCMU9QdGdURm41R2pLc0RkaW4xQ25tSGNlUDF6RkNhd3JMUS9sUlZUV3dL?=
 =?utf-8?B?MkJlVVJ3dHg3NXNJTElRRFQ2S05xa3ZPL0Mxc2RLbWI3N25QbzMrdWVCdEw1?=
 =?utf-8?B?SDU0NWdYZ0hydVgxYldCaE1OY3lONUxBd1BMczJDS1dESEM3R0VSbnVObTFJ?=
 =?utf-8?B?TW9Td1NBYk1hK25uNkkzb200Z3liazlXbzlOSExTMHlTZllHdnBESWN3Y3FO?=
 =?utf-8?B?bWRrd3M3VFJHRzNZQmVDTm1DSGVxM0YyeDZaVm52TDNHV0phdTBkd3FGWUhv?=
 =?utf-8?B?Qk5ycHNBa1R1RWJZdEkyZFNJZVdXNUQyUUg5YVBCelVnaDVINWpGNHNqZXNr?=
 =?utf-8?B?b3VHS3NhRU5yMCtBYS9uZE5ZbjB5YXpHQnU1QUFGb1RWSUtwQUpRYTVVWjRv?=
 =?utf-8?B?MDM1bzVXS1JFdGdtVjF4OVJZZDZZeEhHTFRsMi9yN3RDS2VlYWdJVW5wUW10?=
 =?utf-8?B?dE9iVm9kNWJuSWJWVkFVNzNuY2x6T0YzOVBBakdyMzE2QVRmRGJ3TDNvUDRL?=
 =?utf-8?B?YUFSRElPOHBaTlo5MWdoUEtBVXlNdVdXNnZhOU11VlF4dnplTFRjaGF2eU05?=
 =?utf-8?B?aVBaMUlURkhYNHQ5dHZjNXEzNlY4TUlxL0duT2wwSWNWQ0UyT09jZmE5YnVY?=
 =?utf-8?B?c2ltY09JRjIvK0Rja3lOOFVaV1NMajN4WkZxRXljcWFma3hsTzNhSElld0xL?=
 =?utf-8?B?QXBOUDBZWmdURkgreGFGNTBGSFpUWm9CRW5hRnBTMHZIalFTNDBxckh4dVA3?=
 =?utf-8?B?N01lMDUvNHBBWVdGdFV3RHlva2UzNlZiM3VKYUNHZG4yN09XYnFkQSs2RUIr?=
 =?utf-8?B?eEF5eWMvaG14MVhTcnppcmVVcW80WFRlUVVIRjdoM3ZsREQ0TTlNNC96U2ht?=
 =?utf-8?B?Z3lGZmM1cHNxaUwwekp1a0dMM1VZQmhpc3Jza1NQZnJrU0ZBeHg2YUY1SEtN?=
 =?utf-8?B?NHNHcXJTQ05CUkloYW9jUHVLeTBPZE83Z1BPNXZFYVdiR3czTVdYdm9BTjJk?=
 =?utf-8?B?azdPcUJMV0VPUWZLU3RqN1QwN0JlQjNuV2c3Z3I0aVUvT0U4by9rWVdjaXJr?=
 =?utf-8?B?VjZyWnE1U09VTnphT1BaclpKT2hCbXBDNHdObXVPUDYvRHRBcnR3T2wzYm9n?=
 =?utf-8?B?YUVDcUVEY0hIVWpOMEhoUXNtbnlxTWhlQ1VDWVNoRUU0VWN0NkZ5OVJKZC9m?=
 =?utf-8?B?RmZOWis5RHFXaWZXRE1jb2tBRFpnY3E0YzdCSy90V01wYll3eklHSWpCRG84?=
 =?utf-8?Q?8TIecqCZEBjADPyk=3D?=
X-Exchange-RoutingPolicyChecked: AiiSsl8dU0BklPFj5s4bU48yiy6Qz6ZLDd9YKMsQXQaL+AyxxirxOcU4/eV8x4WbHDpG06mx0JDLb4EZD/aslpH7JEeaE359fe825CQ/uYs2LTzP8lxW1FPD/Pvbp7UPU3DTNW3iYrYrVDKK3xgcqnmld1dko8FBo1bgWgI7fUWUxxZqz97wOepxhqVtBI1yONXqjZQ6aWQEotx/lom1B7uZ+zLFRO4s0nrnIiDL0VFz9dkFzlROSMfALao209w1j/yE7DdXwKXOQE06xhXjyG+LoNxjkVW92dtih2Ea0RGSt2psp+fFPMQd9EHOVEvbuQopIkkr1H+nPJBdTw/TBA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 19851093-af9f-4d6a-f0a6-08defd13d3ed
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 10:31:13.7535
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ehJozPIYFHJDWS2DIVrLatC6ICUFwpnJJS1gEepROtZgGCU497r56sz0/4NiqhFIuJ4Lh/Sl0VeHfG5OnCBHchiLuSoPWw6dLJIhyNoE4Co=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8795
X-OriginatorOrg: intel.com

On 8/17/2026 12:49 PM, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> The audio_mrgif_pd clock is optional as some platforms may support the
> BT path while others do not. Use devm_clk_get_optional() to reflect
> this.
> 
> Propagate other errors to the caller.

What does that mean? Did the functional path change?

> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
This should be part of a mediatek-patch-series with a cover letter. 
Yeah, the mt6797 changes should be here too.
