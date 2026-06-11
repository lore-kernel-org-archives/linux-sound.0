Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8918630C366;
	Thu, 11 Jun 2026 08:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781167844; cv=fail; b=iDMOEOmCqEZy7FxayeI5sgrIiL66Eluhgzw7vFCNFrj1GdmIVTHxyRv/WOxYlocGXz7+SvqYQMFDeut7BXxN0bOH2X983m+DxUQ/lOn6yIKEDZdZ46TOmZVc9wU+KJwbBaT1x0LhDV5rAgwCg8rVkNBXPl6rg2Sq0zeDJWChtSw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781167844; c=relaxed/simple;
	bh=Fbaj9U+PrLdqQVPdqJYY8EV2Y8Vdl7yk/RvG23R5nsA=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=gLM/2lAlRMnNy3/eopEixA83OxfKyylpHVGjvnsevMnMlIkymiXd70nISByvohmm9STxe7oeRZ1/Vz3zwumnsEukkfzu92MuPbTZoQgBPuyKi62SzVB20s3l/b7uAue2gY39AyFrPGpQYOFCJRyTJ3Rxzb4IXwfLsVP7oqy+enw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X/hlbfUk; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X/hlbfUk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781167843; x=1812703843;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Fbaj9U+PrLdqQVPdqJYY8EV2Y8Vdl7yk/RvG23R5nsA=;
  b=X/hlbfUklXtbaCJ4lBXCmFU59JSspUA45TzxY7bszsGycsomSVZhI9HA
   MjXK2J6IpXhe2Rg+qcEzHBaTWO1Xqr+zSQN6aHMciy8dhY9nizKK5QVrg
   XSrvHNsSjXYvwq6MkW6l1i8ND7oH1yaf6zbXe9iLcw+5Jm+yoKdxC0SPT
   wltOk0HldczwWvMoGW/R73W4gAGjU5cSEjPTrVv8234Bki/hz1x3SWRhB
   LG7NE7QJQE5bS9056gwTyF2OnV7bVIrG3MfV75HI06nwhY4WiLsroC+HI
   cQz4iARU6R2pHtrm1t/oYE/qOO/DXRXscaOW8Toj/G9OdFK5U9Czzip4w
   g==;
X-CSE-ConnectionGUID: mAoOQ8w0RKC0KQ9/PqSHgw==
X-CSE-MsgGUID: 5TApqJNxTaO8H9ah9rvrBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="81980501"
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="81980501"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 01:50:42 -0700
X-CSE-ConnectionGUID: /9I1yxgwTceBT+L1VP7LCg==
X-CSE-MsgGUID: 1v2+S5NvQ9SmCa4i/3bkkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="242277657"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 01:50:42 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 11 Jun 2026 01:50:41 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 11 Jun 2026 01:50:41 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.57) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 11 Jun 2026 01:50:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AEUdvroOiMHxcDwtPNGlQnexCnHk1qF25kGE2m0OUcRKSGG1qPvhHeiBJI5Hd8ODhp57fCQgeS7cNTGuhDQIPZ2xE5/djNkd+d0KBhd8yHMMIsHFVHbXSlHCni9p5+TUspid11kAAUQzX1DlbAV2CFjYHrVbseFqCIfGCwVx68wHnNUmp83ZNFvVwH2LlfnMWhdj6jEdbLs6PaHqpRN7p+mUER6Vp8eJRZaKrKWfNjSEIgTAIlGvywxGaRZGjlAeIrfdlI5+/Ep5EqHXKlC8UFBRhYhcBCB+6MAy/PEaw0MPxRSUcVHtXfdOHMDLxJ21iKQXPesLAZw3upLfbaTw7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ESWZe/mxYWxqerRagCxJTBwaraJl5rmRode73/aqFCw=;
 b=Y5RXnKU7V31Zqv4NHrUsyQqHpj0a9Hb48ZCshd3FgSjvu7E1gPjSDiultiz34wntqVEti2W6D9zhVLYXB/4IQqCDe2Ckd/FYPSTMGLg2Gqrh/0v30qk0xuXl/ZlKJ6QeMJZWdHyaYRbTcG7FsNT4ruIFQNfBDd7cM8Me2FYbtdAj8gKXeyk8tH1KfQ+r/hfYdz1ek4XSQpMDQKaV1PXnRTtzwzdYmffFMqMSeTr7+IBzHLUXVoV1GDzy8hTlojs4qeRBV0gvJtyxDJQH65Tgi+vndwv6BuWP0boIsHuEbBvb5sMpJHifkDv+wmyxEDv9PyID6zMp+xgFTrJgpHc3hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6978.namprd11.prod.outlook.com (2603:10b6:510:206::12)
 by SAWPR11MB9570.namprd11.prod.outlook.com (2603:10b6:806:4e4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Thu, 11 Jun
 2026 08:50:37 +0000
Received: from PH7PR11MB6978.namprd11.prod.outlook.com
 ([fe80::f60e:1044:67d7:d8fc]) by PH7PR11MB6978.namprd11.prod.outlook.com
 ([fe80::f60e:1044:67d7:d8fc%5]) with mapi id 15.21.0092.011; Thu, 11 Jun 2026
 08:50:37 +0000
Message-ID: <3a18dd98-7ce6-4b41-ac42-4bc0d3ac43a3@intel.com>
Date: Thu, 11 Jun 2026 10:50:32 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] ASoC: Intel: soc-acpi-cht: Add Lenovo Yoga Book
 entries
To: Yauhen Kharuzhy <jekhor@gmail.com>
CC: <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Hans de
 Goede" <hansg@kernel.org>, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Bard Liao
	<yung-chuan.liao@linux.intel.com>, Ranjani Sridharan
	<ranjani.sridharan@linux.intel.com>, Kai Vehmanen
	<kai.vehmanen@linux.intel.com>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.dev>, Mark Brown <broonie@kernel.org>, "Jaroslav
 Kysela" <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
References: <20260611-asoc-yogabook-v2-v3-0-3128447b67b6@gmail.com>
 <20260611-asoc-yogabook-v2-v3-2-3128447b67b6@gmail.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20260611-asoc-yogabook-v2-v3-2-3128447b67b6@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1P291CA0008.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::19) To PH7PR11MB6978.namprd11.prod.outlook.com
 (2603:10b6:510:206::12)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6978:EE_|SAWPR11MB9570:EE_
X-MS-Office365-Filtering-Correlation-Id: b73e50bd-3a73-489d-579a-08dec79681fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|7416014|376014|366016|1800799024|11063799006|4143699003|22082099003|18002099003|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info: vHWVmCe7NC0F4AYGCHti/P1IK+K6iM4Le84OQr18D4Js3wHhlw29qax+WZUuBAo5dPOS5QaGDc08vWCtBfLDDICakPhjkupHpdnfP0GfpOWXJCkMo6hWi3K9JJJJZpwz9/hz1iuwLTw3lZzXlRN6kRWPUu269lVPzemTkX9sOQR7r/HW2TejETHqe7AV4+PUlg0NN/LG6ltE4GTBOIFG1qADopIB49Yku1B1oto4ecFQcrVVhcc0oAcsqA/qAfjW1NQUmaEN/tR6dUM60B0JdAByqoTKqa+KjTI9nKoM4u9sRJK1J5bTyRXXgVFvk8KexOGwZg8Y/zKqG+bFlggwbuBjNpJZYYlWNySQNVxChHwCnNuNqW5xsA08qnxXoNWBR9+UEULFRk2CMG3Fv5xn9vYJrWjwnEzCL8kpDrbYJGhHdvM8KUN5ScpxWSvl5mGE1XB1Q39hoF7bpkeKWAOwc07yhDqUUhRnekrokBqPOM2ku1MkJcF6Nuhajy21P11JHElHPRMQCm1PDjTCNX7BPL59dD4upRm97tUkfOJ1kLoydSyQ97m6efwDO1GqdYds74Eh+O26D6P+X4lm3ah+SzQmNwJz8EtHVP/QJWtgHQtHF2/U+ED/hajB+MCS7Kex4IOE1/zCpTcrnKIlQHhXl/iAH8IlG4jKZlG0kR25msC2/qk1FRSnRSQn5HZmdzoB
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6978.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(366016)(1800799024)(11063799006)(4143699003)(22082099003)(18002099003)(56012099006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UFdwMUF0MHhRUGtxL1ljQU1VNlBQUmZKMHhrbnAyU1NKMDlzU3h1b0tKU3Zq?=
 =?utf-8?B?TFlpRXRTZzlJbzJ5d01oL09yeFIvSEhvY3RKOEJSeVhCNy9KS3FINFhNRDE0?=
 =?utf-8?B?Y04rRFNqWXZkWUMyYmtENUtKaHplOTF5M29nNWdxb0h3UnZ6TjFOOUFaV3hC?=
 =?utf-8?B?U0taQXFQSHRUckNaaXF4QkRPTkowSlFpWWJ3ZnhJSk9JalFVMGJxaVNLWFJH?=
 =?utf-8?B?M3hRc1NrU2trSCsxNEd0NXpkRklmVzQ2Vjd1THBaMHd5Wm1rdmxUZUZjWHFI?=
 =?utf-8?B?cnI0T3FkR0d4MmpNTU51QkU3Q245L2pPVlBRb2FJUHJxeXdvQmpUYWMvNzlj?=
 =?utf-8?B?bUVGK1NzMDN5RDR6U2xVUHB4aVYrQ2hmY21UNnB0em9TOG9KOTlNNFJpUVpv?=
 =?utf-8?B?TndYdTRYS0oxRDdXREszcHpia3A3SHZwUGlFSURWb0NvcHhydFZ4eHJWNDJw?=
 =?utf-8?B?cFlJNWo2c1p5eUdQUFA2TGd2bnRNVVBRT0tDSHlDZUtrTTA5UEdvdUFpUlE4?=
 =?utf-8?B?ckZwNlhhZElTSVFPQWNMaVd4T1IvTUtTeDJkcDhLdisveUl5aHlteGdVOEt3?=
 =?utf-8?B?SmhNMjR5dFp3WHMyTFZJMDVhR0orZnVZSDBEZnJSM0hVZFk3TjFSemF2L0Y5?=
 =?utf-8?B?RS9ITTNLNmlDWG9DZUx4YU1TS2wvRU5SQTQyZU5obnpoTmxmcmZIMUlCVmJa?=
 =?utf-8?B?Si8zdElOT0hzdlkwczMrN1RYaFQrYTI5UjBGU2xZSDB6VU42NnhvUVlQLzd5?=
 =?utf-8?B?enM1V2JxcGM0dTQ2U1p0UUhHNTYyOGwrYjdsNXpsZWVQc0p0djJ6SmQxNDdo?=
 =?utf-8?B?QkczZWZXSFgxK0lnTmlmak5VS2RHUnNFM3ZITzdod0V2Q0liZVVyNVFRNklm?=
 =?utf-8?B?ZFY0SUJrdkdaRHNHU1RpTnZZaDczNCtwUG1HZXZvWTQvN2xVdmZmUVdNU1cr?=
 =?utf-8?B?TjJzYmd6Q0pFL1pqOXhrSENYbEJ0MjZ4N1Z1aVFjaEYrczlQcnExR3ZUV3Z5?=
 =?utf-8?B?RG5TVHlTVDdPWWx4TG9VS25Yd1R6bW1CRGtYK0hXb3pNbFVGL0xjM3BONU51?=
 =?utf-8?B?RFJjSVBqMnEvb21xVW9STWxheS84ZFhHbUpNanFqNXRBbFZZMHZwUWtsNTRB?=
 =?utf-8?B?c3QvUlRjMVpWbytDMlZjTXpQZzRQRTdTbGd4ODhZOEwxNmkrUjR2WFBEMjFR?=
 =?utf-8?B?UkVSRzh3Smo5TmhWcXlEN2hkYnZFTlRQU0ZFN2RqK2pDdFRHOE03RE5SZ0t5?=
 =?utf-8?B?MXZsOXVrdmVMNVE5VVJmRXNBcTVrSWdoU3JFOE8xdVVUSHhFeHIrZDhWek94?=
 =?utf-8?B?Z1N2QWJWNHl3OXNCazVUeWJWZDAvYkorT1FWcnRsckhJbFZZOHMzNDJQQ3RM?=
 =?utf-8?B?MW9FMUo4TW90MGFzcU93alo1QmZWTXdkUjF0T0gwS1VORGxHdkg4TTlPTU9o?=
 =?utf-8?B?aWRVRS9oOUw2eXNjdW1HNlUrVC9zSSsvSDhPUENremQxQ3VjYUhVUlpac0lD?=
 =?utf-8?B?dXNmdnpqMTEwd20zSTRiVCtldzNEUTVJc1VaZVdmRGdpbi9qeEFNVjdLS2Z6?=
 =?utf-8?B?UVpjZ2o3UGpFRWx4QkFqOEsrNCtLWndOY05pSFFXWG9uRzNpREhocUlKM2RP?=
 =?utf-8?B?MWRIT1hkRzhlWndCWDdwbEtQWCtSYWZnSkV2ZlF0WlZTckZwZ1hoQnJkRUhV?=
 =?utf-8?B?L0xEMEU4TE1rd2U2UTNkUEpySXpsU2E0eEFZUXFROExQT1YyR1ZrekVtWVVs?=
 =?utf-8?B?SFZYMkNpVllpbU8wdzFoS3NBYjdtYit6R01nbmJNV3JzampKdzAzZVhDTk5q?=
 =?utf-8?B?aGM2NFNQbCtaL0hwcEkrWncyc0l5dEVpK0dXWGlxNEwxTXNuaEMwZlA2T2xD?=
 =?utf-8?B?dWYwbDk5TkpvOVlMaHowMThtaWFqK2Z1aVZTQnRZRTh6MDNZaGM3WStGNUhu?=
 =?utf-8?B?V0NJby9CQ3I3a09HS2w0NWlRalhGTFpvM0dYQldtQkN0R0V0b1NCMkNFOWdZ?=
 =?utf-8?B?T1pGajJkdFlaQ1pBblZXUEVJeDQxeXQyaElZK1hoTzEwM2FleVN6TkhGd0xE?=
 =?utf-8?B?aERzYlRiOW1rMjBiVWZrWTVHNEVqMHBpaFovcm42a0NSc2t3TFJuVjFQbUFz?=
 =?utf-8?B?cEZIWEIzUzRlbjFRSHVsNExhM0ptckxBSm9XOXk4ODdGNFlXRHpwKzM0eThQ?=
 =?utf-8?B?dytDeTBsZU9MOHZLZjFkV3duMEFjT0htMUFuVE9teGxraDR0YjVKNFhwRENJ?=
 =?utf-8?B?OWUxTHNWNWZsTlhRZ29kTElaUDlhT3htSndWRmNQMWg2ZXhzWk9oZ0hhUTda?=
 =?utf-8?B?ZlFYU1JtWFZ5cFUyU09sL3cxdGppSWpFZEI4Zm5uekxGYy9zcHRycy9XOEpK?=
 =?utf-8?Q?L1AFTUgps0WTShBA=3D?=
X-Exchange-RoutingPolicyChecked: JJHxEeeArU/VaUHsGswrYcTW/xubKveIQhkgU6Bcmbs+T0uzBoJki54p7rQX/2C9J5f4LHUCVkLAeGJWsZZCR1zx2aRLlQUyDzCZmQNt6mRbjFkR5C8AEnAYhqIqt2GR4WwmwWjC/nv8aM+B68bVzvkgl7L+Q0QHFkwhN/Vt7YLhBQph5yd9q7nxbfqc+VzpLDcXSwjo8F+PGYR8FyQJ2gcONWBdl1WTKS5k6aeBz/pW67ZeXnBnobxKEdLr9sybhk4aPhVIrev8IOhDFlAZ85n5zytdn+rtEU53e9uhQFfN8nueTWnqOKMWzriZj+qXx9vK9Vwti8gAFJ+rU8X+3w==
X-MS-Exchange-CrossTenant-Network-Message-Id: b73e50bd-3a73-489d-579a-08dec79681fe
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6978.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 08:50:37.6480
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O2TaOpyHLkyzfp5y7SEabW5PMKV7dHDx0rmVsmf8EE31leVOQXkGM8YizXMP+lVzlF30pelDQy0jL/XKiRJ8y/UqI1vOpO4EluznWjHE60I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAWPR11MB9570
X-OriginatorOrg: intel.com

On 6/11/2026 1:51 AM, Yauhen Kharuzhy wrote:
> Lenovo Yoga Book YB1-X91 device uses a Cherry Trail SoC and has a valid
> ACPI DSDT entry for the RT5677 codec. This entry has some non-standard
> resource definitions, such as jack detection chip information, and
> hardware has some additional GPIO controls so use 'cht-yogabook'
> for the driver name instead of some default (like 'cht-bsw-rt5677').

...

> diff --git a/sound/soc/intel/common/soc-acpi-intel-cht-match.c b/sound/soc/intel/common/soc-acpi-intel-cht-match.c
> index 28f600171f9d..5e8a1dc84ee1 100644
> --- a/sound/soc/intel/common/soc-acpi-intel-cht-match.c
> +++ b/sound/soc/intel/common/soc-acpi-intel-cht-match.c

...

> @@ -121,6 +147,20 @@ struct snd_soc_acpi_mach  snd_soc_acpi_intel_cherrytrail_machines[] = {
>   		.board = "cht-bsw",
>   		.sof_tplg_filename = "sof-cht-rt5670.tplg",
>   	},
> +	/*
> +	 * The only known Cherry Trail device with RT5677 codec and 10EC677
> +	 * DSTD entry is the Lenovo Yoga Book YB1-X91. It has a device-specific
> +	 * driver, so check DMI and use a machine quirk to override the default
> +	 * (non-existent) machine driver.
> +	 */
> +	{
> +		.id = "10EC5677",
> +		.drv_name = "cht-bsw-rt5677",
> +		.fw_filename = "intel/fw_sst_22a8.bin",
> +		.board = "cht-bsw",
> +		.machine_quirk = cht_quirk,
> +		.sof_tplg_filename = "sof-cht-rt5677.tplg",

The cover letter reads:

v3:
(...)
- Remove support for SOF;

and yet here you're assigning .sof_tplg_filename.
> +	},
>   	{
>   		.comp_ids = &rt5645_comp_ids,
>   		.drv_name = "cht-bsw-rt5645",
> 

