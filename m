Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E7347D927
	for <linux-sound@vger.kernel.org>; Thu, 27 Aug 2026 17:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787852706; cv=fail; b=t8w15CPKrnw+7Uk0b+YlxUDHSAtY2ZFwzdNkl2nSz8+QEnJeV/fSwEgQ3foNzzx8x77+sYLFtbQLwopcBIAknDvaThO6mP8Ry+Sdf4QX5rdpfpOTKmAYIiUPPFLBPcv61ROvo+fbccuyDhEb1EgzLS7ySHKTKsjxba9HJN2mfVU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787852706; c=relaxed/simple;
	bh=nfjR2Lf2GB/qhdPYCqMubAtwohbKQxPDZZUgEbFXamU=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=rw35xH3Ua1RBH9z/HzwK9omcuYEkRhc221A3YvPKcOFOCFfM0nkD98XJ9c1FU+yp8SeX0GT99U0cr6hUm7OL79MaM18EaJ1QPaRr7W85gA4Bco48N6FSfykKONNFatc0Decj9T7AaGfgydP+iQtk2OHUg44TA1poKvFMV1I7LHA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SEOhM4pO; arc=fail smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SEOhM4pO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787852703; x=1819388703;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=nfjR2Lf2GB/qhdPYCqMubAtwohbKQxPDZZUgEbFXamU=;
  b=SEOhM4pOlmDnXYKmSh02cnJ2q2Kd+N51FBtzBghQepWttFXpL61VARad
   v5omkh+m5Az44htGntnBoJXpOMCv8um+vgNYLw4ZBYrQlmkm9VncYEs+B
   FaEjMuo6IECyy5sebwY70iKYdaa8qVvrFgaDuSyaGDh6yLOM0lZXvT6BH
   Cr/WVEEoNGpF0xVopKb6ZyYZCx3Y/uD+d+HfmqdtPsBdLYXKqRCkFBrDd
   iDVW2jOBopkZAXhWBfqslhxwKwo50tGRqe1P914U1hmFftasjn1n+l6gs
   D4dKcmU/Kd7L5As5MhEtemytWX8YYsRt0nG9RM55bR/LkUMT1caYmCTp5
   g==;
X-CSE-ConnectionGUID: 3fbBNHP6T5+czA4k48tpag==
X-CSE-MsgGUID: MXR5A9FKRyaBsR1BNv4GCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="87494100"
X-IronPort-AV: E=Sophos;i="6.25,247,1779174000"; 
   d="scan'208";a="87494100"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 10:45:02 -0700
X-CSE-ConnectionGUID: 6WGXsNaTRFCoOd2VoNnsew==
X-CSE-MsgGUID: 140sGSesQuGBStXt1QVHcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,247,1779174000"; 
   d="scan'208";a="271463527"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 10:45:02 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 10:45:01 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 27 Aug 2026 10:45:01 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.57) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 10:45:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BFaEuZEaIDXws3kIVWnreUTRIczEXQRcq+uD6JfNGTq/sZ3TF3dTaqg7B+V709I6nS+9NRXdurKVKzKzn40hz0KgkMDq9XRRIYMtWHOflVOOqtJNnXgW+OBwGopMnWpdD5PjSzPLt97Hsik+f8wiXXj7SUAMf0aEJYdZAfr93Qst/O0HBl4YsvCv11+fyDSWW9Yv5/IGbDn3Jo4pCHt7fEcyWhLDdIA/xH1/VxlsBltLfSWor+DQQ09mmWG/QwsqU+d4JfgMefDSPCg6ZrIieWO3HUqyOoVnwY3p2quLwAHqKmS00euQP+WlaszJfzv7i04Rl+7cdRA67DN26OE6wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xZPDOQnlfZL1Js6IoSQVLG2d5RiHtcHmMKXpyREFds0=;
 b=i6hCIPVBi5ZuKG6VyK3xmvrCgemdE413gAsFuDvSP2J4apfnNEJbc2IaLJFmr4+VDL8Vt/2PFN3DvUEwYTN/uFX8S8ZA9tOYuOOXwk7yX0ywMWb0SKIQh0BzPZGcQO0eRd1QWQRl/QSq2zOoGf8Nv+7FqzxgmSE0FnEw81fsGdjuWd30FDnUcPL4DGwDBXMcOOISTpemvh4GwWUNy7dH3MJx3RCVp3zacoQP58AliwPH3AvONkgdv+ci++w0stzwnAfdC1BmkJtaaqvgciuEs/q3Bib4vZ/N5dMJvF3Ai++jGdXIVAV9CR+gnE25jVoDgYlgHBI7//bYBbMyqDlTlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6006.namprd11.prod.outlook.com (2603:10b6:510:1e1::13)
 by DM3PPF4D011AE7D.namprd11.prod.outlook.com (2603:10b6:f:fc00::f20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.7; Thu, 27 Aug
 2026 17:44:58 +0000
Received: from PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd]) by PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd%5]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 17:44:58 +0000
Message-ID: <734ca204-2324-4a95-86be-d6a9e3ee5190@intel.com>
Date: Thu, 27 Aug 2026 19:44:55 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/10] ASoC: Intel: avs: Refactor and fix init_config
 access
To: Mark Brown <broonie@kernel.org>
CC: <tiwai@suse.com>, <perex@perex.cz>, <amade@asmblr.net>,
	<linux-sound@vger.kernel.org>
References: <20260827131510.1014084-1-cezary.rojewski@intel.com>
 <20260827131510.1014084-10-cezary.rojewski@intel.com>
 <868fabf5-81f5-487e-8ed1-855e97f31897@sirena.org.uk>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <868fabf5-81f5-487e-8ed1-855e97f31897@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM9P192CA0005.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:21d::10) To PH7PR11MB6006.namprd11.prod.outlook.com
 (2603:10b6:510:1e1::13)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6006:EE_|DM3PPF4D011AE7D:EE_
X-MS-Office365-Filtering-Correlation-Id: 21ddc94d-082a-4a74-ec80-08df0462e9c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|22082099003|18002099003|10067099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: Rx0vmAkaCikKfTcJabstw4VypcNBFtBMqOGpGAsdp2+Sya5dXQ5vPKouNGDq4ARo2vLAAF9dvnUTxCDacVr+ZjyGgZLrtgsvn2NAgYJboN1Iig+JfEo0YqbFFZxGZ0mQIS8vuTbyijsuDhPwJLhOV9RAsQrJxhYmgiOUPRGSlJy18Ge6cWf5Jr5To+CtA2/2NgNyGmBhQiS6RBvjZ+ySMGuH4XpFAjJShzGEIRgGsfDN/F9G38twwm3I1sN4IvzTfZpU05RNS8nxxzfZklPOC5pOGerLTzeqFvTLw6KbwO9PTyv6a6N9ze0gY9B9oqm0en3YIHBRzq08QDG1M1xYAUXlqbxoKTx9XRJqkBp5mtVa5iCUjtJxCuHLHI6Hk+5AW9AQ2FtNJyNXNdtH42PfCwgvU8gNQUbl1TTVaKZEs6SrZqeKpsvZc7D4kNs3kYWUyH0gPENXVnfmF3woYr0qo3x25AgDMroHdhTD/REHh1km0DPnE2scD/NIKx0qa8+FfI/aVDzuhdGrzIxl6W7b9X/4LYJomjjSl4sM5o4Zc36F8pnrDaimQijDK4Dn8vjvnMWoM+fMFL3fuSncW6nEqX0vNcvCUF82GCxsqQk+z7X0ME+NT/B/rbjU1bv0ni2zjZby54gapn6EQb46OypnYg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(22082099003)(18002099003)(10067099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TXBXWkFRRm0yYVYveVd6U2Rtem9SdmtzNng1ZHZUdlp2eWwwTXFIN3RrUjda?=
 =?utf-8?B?cHlKM0FTRldtSVk3TmV3ZzFPclRGREg5WDFLWEFHaU1LQXlVNnFvUGdSWlNk?=
 =?utf-8?B?YWQ5TDRaeGg0RDQ3bFc2cjQweG9oV2JwL3RTakg2WTlzbzIxbEJNSDNGU2hO?=
 =?utf-8?B?bmNyRjMxQzlqbkcraHdWUHNLdWM0YXBNT3J3bjkxQ2NvYU8yRyttY1p6a29Q?=
 =?utf-8?B?Yis0a3ZMQ3RLVWk1c2VCaFNueVAzUkdFRjR1c2tQQTRRb0dhL0RQSkJUek0r?=
 =?utf-8?B?ZXRvalhZSUlia0xURG1QVDEwR2IzRGw3bkxsb2hvQlRuZ0sxMzNpeXhOVjdL?=
 =?utf-8?B?cllDRTVGRXY1cWJTY2dnNWxGWFVPVk9tOEg1dUdweUZrR1JnVWxyU2tUYkRG?=
 =?utf-8?B?QTI0UUZjMGl6ZllYMC9kZkhDd3h0REhvZmZxVUVobEtUY0ZmYjcyWTVpc2lF?=
 =?utf-8?B?R201Vmg3ZXlwcStWMFpBYUZENDhNaUJqWUJzTkpHR2VGdDNQR2Zvd1BzWUlL?=
 =?utf-8?B?cjI2dHQyWmNUSHNiMnA1MlNaYXVFNE8xR0Q4QkF3RjdjY2pKNDMyNDlqZHFi?=
 =?utf-8?B?TUFMWXMzVkZscWhEOHFkS3VnQmJKRUd0MVNpNlhyVkJLbzg4YlV4c3hCcFI0?=
 =?utf-8?B?bkwrQ0lnR0JHUjAraFk0VExuYSswMk5LYnhkamFpRzhySXUwNTd4U2tXVDFU?=
 =?utf-8?B?RldPYXppWDlFVzd3K3BQZUZuZnhtRnZrNEFtNFZxM2d1QUFFQXRnL3prU0JB?=
 =?utf-8?B?Z084R3M0bDZmcENTNCtZVlI2TGtiMWNpVEl1S0IzZG01TDRsbmtKUDJJZmtV?=
 =?utf-8?B?VkJkNHkwVXdoMzRZVS9kZVl6ZHNxZDM0YmJmZjF2dDcvN1ZGelU0VlNpNDJ2?=
 =?utf-8?B?OUdZVW5qSkpBem1aaytmNnU1dTdVRTdqQk5FYUlXbml4YlcwTHphQ0tjZVZZ?=
 =?utf-8?B?VEhIeE1BMy9YOGgwRTMwNVFGMTdiYWVIRUNzN0Z2cHRhQ1dCQ2hiYzZ4bjJD?=
 =?utf-8?B?ZjdLSkh4MmxRWTJDNHUzdXlpYlZWd3RqU3NDTHdGT3c0WnRuVi9jWEtiQ21S?=
 =?utf-8?B?Y3VMbGFEc1BkZFp0UnM1TlpiU3k1dzgrZG4vVkJlOHh5djBkNkJ0c0Z4ZFZR?=
 =?utf-8?B?SUVCelFpSkhxWExkZW11WFJ5T1IrMnE0K2xqL2pXaUtVL0dDNDhoK2QvMWtv?=
 =?utf-8?B?cGNPNFJiSUdEZ1Y2WU81dmpaajZlaWYzc3FPSzJjZStIeWVBNE42TDdRRXVX?=
 =?utf-8?B?V0FyMVVTUjExMno4RHVnYUZVdCs3d0kxOU5PR01HN3VnQ2tpSGxpZG5ubDFX?=
 =?utf-8?B?VjI4WnNXcWtWdURKR1o0T3ZzRmR5ck9FcFdLOERLTUs3WnRSVjA3WjFRdllP?=
 =?utf-8?B?QW5pZU0xNkFVSkRSNFB6emZPS3ZrVnp6dG9BbXJZWHV1NDlua2ZKQ0dHMERr?=
 =?utf-8?B?Ykp4UHRtSmhsSmcwM2N0Z096d3RITkRvZmRhejZRNjZyNk1YRHBoTU5abFQ1?=
 =?utf-8?B?NHdjazYrOVYvQW9xcWFWMVBkSVdYdkI3OCtUKzhMcTMxclJFUzlQK0VoU3Bo?=
 =?utf-8?B?dTZCanprU3gvZTAzREJoQ1JZeDNnMUJxZGptNS9yaFV5Z1NpZExWTXhsWWc2?=
 =?utf-8?B?U3RBTUVQSHRhYnFXcUhtOTFDNWIxbXFhZE9FbDgxRkxCUHA1MXhMcWFEZ3gr?=
 =?utf-8?B?YnVncXl4ZHFPSGpWcG5PZTZlWVg0SFJKU1huRlBCTXpiYXdoUE1JRThLZG5S?=
 =?utf-8?B?NVZQcWIrR1pMcUxrL0k2U2NXdEFwNFBQOHc1MkZWeE9EVlBQUEJtOHhHeTcv?=
 =?utf-8?B?dnh2alZaSTNMa2NhZXdER3R5VUxxMGVuNWRZdEN0L28vTGFWUTN0bllQaE8x?=
 =?utf-8?B?RmpjWWFQaWsreVJqSWpVRWwxK2g1NkhBY0NyeHl2L2s5VXUrV0JIZzF3aHAz?=
 =?utf-8?B?dDIyWXdoYjVQUEVKOENBNWdWV1lSZzZvcjUrbnlCYkx5U1dFeDVXekxZcHlH?=
 =?utf-8?B?Z3hoK0kxWlJrSXBEYmZSZWg1ZFMrZlllK28rTzdwQWlvUlYzK29NaHhoYkNT?=
 =?utf-8?B?VWo5RDZ2T3gvbzJRSEMrZmZKRGptc1laS052Y3dudEpEbUpCUElrS21rZlhQ?=
 =?utf-8?B?NzNrVVNKSmsrWG5JOHloOStnNFF4OUZqbkFGQWRBWFZGR1d6Y3JaZ2NhMjdD?=
 =?utf-8?B?Z2tyUnc5RHlIRUlOUkN5QldKT1VhcDZWZjJZenJ1M1htRUQyS0lpMnB6THRJ?=
 =?utf-8?B?WHdCYW9qRDlkZ3Fnb21hUDVycjlRK1kxY0Y1MDM0RTJwUXpuMUplTVQrQ2hB?=
 =?utf-8?B?UnBEbGRyTU0wb1FJMlU2Y1dBVG95Mi9VOGdHeXJWSnE1SzVGekd6cHREWXJp?=
 =?utf-8?Q?LB50fRSW/vBu+CDc=3D?=
X-Exchange-RoutingPolicyChecked: meEj2Y3BcnksvJ/iir6qZhXE3utVoIp4qsWNGiVJfuBDk0Ms8tm7yVE4C3Ah9zQKrROcVkxnO6+WJ5j0Jclns/MZJZ+FEt+VAb+pwxKgqaJ7hL8v31y/B/TSzoukFa8WQX6AMf4ijSJZKyy2foUkL8xbV8lQ/SCoupIy7WnMD6X567YAF88xS6VWICEmiO/akbdV58BbhocoNneSM1079iXNb1/VAIhgXsuBjJaiDue4tdAmg6edztnyxT6iOzDwL2N8Y9ssR8Is7ujqDAuSyIQdXDBUsgOVsBWQDaMtcdGXLwX26ca2dJdj0Y8Axq0ZoKze0zNtFRyqMGasVwutWw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 21ddc94d-082a-4a74-ec80-08df0462e9c7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 17:44:58.6436
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qgA5zWQXOAqiUOMSBEx197BqDfDTnXHaUxnkQDvVvGTXA2W9MCd/U+FAKqpDT/cupjvApXHR+xZR9/QMCF9ubcfuM7vr+47RKk+YZ78JegY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF4D011AE7D
X-OriginatorOrg: intel.com

On 8/27/2026 4:40 PM, Mark Brown wrote:
> On Thu, Aug 27, 2026 at 03:15:09PM +0200, Cezary Rojewski wrote:
>> Existing code accesses enties found in ->init_configs array through
>> indexes that are part of ->config_ids array.  Those two are limited by:
>> ->num_init_configs and ->num_config_ids respectively.  Using ID larger
>> or equal to ->num_init_configs leads to out-of-bounds access:
> 
>> -	acomp = to_avs_soc_component(mod->template->owner->owner->owner->owner->comp);
>> +	acomp = to_avs_soc_component(template->owner->owner->owner->owner->comp);
>>   
>> -	u32 num_ids = mod->template->num_config_ids;
>> -	u32 *ids = mod->template->config_ids;
>> -
>> -	for (int i = 0; i < num_ids; i++) {
>> -		struct avs_tplg_init_config *config = &acomp->tplg->init_configs[ids[i]];
>> +	for (int i = 0; i < template->num_init_configs; i++) {
>> +		struct avs_tplg_init_config *config = template->init_configs[i];
> 
> I don't see any users of acomp left after this refactoring?


Good catch! Ack.
