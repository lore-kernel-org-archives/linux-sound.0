Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46AC01E1DFF
	for <linux-sound@vger.kernel.org>; Fri,  4 Apr 2025 13:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743772192; cv=fail; b=N41HQyPn3Zn1SJOEu+162ediuK0p2DY4fvUXSP9MaAp4XTtfISdrpiw9rHUGPJaRIzlrT6Y05xrAcMzFmQhISUC22d75caIO0PthK6Zy+xdXGjWoIFsZPdwfaDKvBvpfHoYjpVh50oEirX65xgISsh/UjKLL7LnJgKuDhShMl7E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743772192; c=relaxed/simple;
	bh=GfIl4qhxJ8i6FsoEkiCooWxt92FoMx8x6zrpyuU9MpI=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Kvn8LVij3i7/5M4xBu0/4Vge2LnvQaREyiYb30uopcjjay4QskvVeytsgdI8D+Kqp01h6kvVeD5q0qDT+kTjHNOaefYd0P7mtV6Xp0R3AFD8aL7JkUkh7XrGSEErfyYlc+Z4AqGBwRzBcTrnmdDHd14AI5fklsVKn9c137WX5N4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WWzavArP; arc=fail smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WWzavArP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743772190; x=1775308190;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=GfIl4qhxJ8i6FsoEkiCooWxt92FoMx8x6zrpyuU9MpI=;
  b=WWzavArP4i7sy4ZepfxAhb2eJuuh6PaABCgx/kqYPst3bnClQ7GmvqRC
   rc2sv+vw21me1Nwpv/gXJI8nhh3XzpYQiLhPWlMasBpNehZOfH0KkOfKS
   EH+krBljYgWJYxaTctdSgee++KEHchYu16y3/EX3FMPmFVGRs6qsZakHM
   qNm3RRUiVAXw06TA/wXiJLz7JAjvIqpLHJUPcdwiPrsdhgW1J2I6+Su94
   f7aVocjribhZ6uDjnYa1xIb0nV+oIGnx7Fh+zzq6REsfLAUODa6zfWyob
   Ahm1dEWLnmUFa7V/3FA8lhiqt1FtaS/VGYvyTW+hdYEHnM0ATKT8cj12i
   A==;
X-CSE-ConnectionGUID: X2Z/cEogQzmH57wnMLpvmA==
X-CSE-MsgGUID: h63fyqWbQKqqBwxWsHJ1kg==
X-IronPort-AV: E=McAfee;i="6700,10204,11394"; a="45101450"
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; 
   d="scan'208";a="45101450"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 06:09:50 -0700
X-CSE-ConnectionGUID: qZQxZbMXSua8zJ3mnV5QRg==
X-CSE-MsgGUID: jkgp16ArRwmOXC96GuPcZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; 
   d="scan'208";a="132277469"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 06:09:50 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Fri, 4 Apr 2025 06:09:49 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 4 Apr 2025 06:09:49 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 4 Apr 2025 06:09:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KLtOHm8ssGB3oVaswGuX3P2ojUFK7NLh9YT+iIWVfzCPPxSRlJ4cwxz35GAi0XZ/lRM/FDgZ+dpnZFYMds+F/gsbklLcERDJAazIPfV0EpftaI2jY4hcvLNjNjXzA1+3EegAsqUcEhX/upLLRGe4CcTeCzDNc5iPNrDdbBR/2X1Bd6CUDw/GkvOuQtFhSFMniBzX5D9/joFcgdOslHorO7ExoJ7NZVLH2RuEbk89xnFmnN9vPJEnOjc/98jtf6btm8yauMNYpltrKjKp13Qrmm2bb7XJbeuqVbwmB4YgLwwVAMS0aAXP51ARf6pL88el5cEHJGM+ZH3P4d4+W8Xw5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YdGrxgzWNj+43gUDA4iw8n8lo6VzDw8SMwDMu3NvsxE=;
 b=OrV5Mo8+h4xLgI73qBQy/TgSZO/aRz5vp0fa5nXxWjEgnGV1DDKHHD5bgpok/KjoVY1PUkmSZSxhZISk2ZMl9kB+/pQVQtsRWZD4QWrm+00ABoNXWNAypactfS7jAytr5xE7slVHVtEUjHLqqiAkW7brnElwki5WYPnG0Bkx6yq4xduZaSmyupvR3KNmQzIqPEPmHW0bTjI5ybZGUlKTZQOzZ0dvuTNLBsZx0jB6+783X39PfjHQ6qSX1J/iqtzklRnPUSNbUePPtOZFO9wQgbntt+gkIdUm9cPtNaydpxpo4twSI2gQBUZuAHOXK0UJmt7hudqGjYpGhUGhN5mtcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 IA4PR11MB8962.namprd11.prod.outlook.com (2603:10b6:208:565::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.27; Fri, 4 Apr
 2025 13:09:47 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cd01:59f6:b0f8:c832]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cd01:59f6:b0f8:c832%4]) with mapi id 15.20.8583.041; Fri, 4 Apr 2025
 13:09:47 +0000
Message-ID: <abe40ed3-49fd-49d2-bb5f-42481898ecd4@intel.com>
Date: Fri, 4 Apr 2025 15:09:43 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/12] ASoC: Intel: avs: Add support for MTL-FCL platforms
To: "Girdwood, Liam R" <liam.r.girdwood@intel.com>
CC: "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"hdegoede@redhat.com" <hdegoede@redhat.com>, "perex@perex.cz"
	<perex@perex.cz>, "amadeuszx.slawinski@linux.intel.com"
	<amadeuszx.slawinski@linux.intel.com>, "tiwai@suse.com" <tiwai@suse.com>,
	"broonie@kernel.org" <broonie@kernel.org>
References: <20250404094953.3657679-1-cezary.rojewski@intel.com>
 <ce71ea6903d05c3b5312c9f534d83478e488729e.camel@intel.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <ce71ea6903d05c3b5312c9f534d83478e488729e.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA1P291CA0002.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::26) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|IA4PR11MB8962:EE_
X-MS-Office365-Filtering-Correlation-Id: 1090817a-566d-4358-375d-08dd7379f9a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bXkxTmxlb1RDNTdkY0NLK3RaSys5bWUwUC9aSlFyWWNOUmYzN29telpPNGU3?=
 =?utf-8?B?UVNuaEJNNE9qUXoxZk9pUVFzeG5CK21CbjVsU3pVbHBxQ3lxU0g4M2xEK0hp?=
 =?utf-8?B?NzJUWXc0SHpleE53U3FVMVJaQjNRZ1ZKSzBEVGNpZEdHZzRtd0MvSmZGV29C?=
 =?utf-8?B?aGRCT1ZYNFhXLzdaL0Z5SC8wSnZLVHl5bXJ6bzZZdzZxUWM4RFRhSjBxV2wr?=
 =?utf-8?B?SEZFR1R3V0luV0x5WVJtQTdsWnBQSlpoWmVEbWMzS05zNWhzSXFxTHFqTVJu?=
 =?utf-8?B?cHQvZGR0bnBsRVlJL3ROendlME9NaEl4Y0lmaVpYRStKdzZlMWpwbTB1ZnR5?=
 =?utf-8?B?eVVTNk8yQTBWQlFJZkhtYkowN2YxdDJBYjU1K28yNE9FWUlKSWVjTWF4VU9y?=
 =?utf-8?B?eHZuSDh1VklhdHZJTEIrNThzZDBXb0EvYTF0YUpEcEN5aXRNSHNaWE9IeGd5?=
 =?utf-8?B?dnNCQzB2SjMxWGxQbUJjcHhML1Q4VDlCY1FGVTI0UnFKUTdjWXRzK3hpTW9j?=
 =?utf-8?B?aVBtZ3pIVWxhbk8xVjFQOG5Bdnc4ZnJpTUp3NUI2OVpDYjQ2TCt6RkR3VEor?=
 =?utf-8?B?MHpMYnVoNG8wcHpWWlBwZVppazJBdDcxeGNTQ1M5MTRJZHBBVXd4V3l3cjBE?=
 =?utf-8?B?dHVYSnJuS2t0NngxbFBUWXlmTkxicE83Uzc5aUMzT2VQcUdwMEJ4V1hzUXd0?=
 =?utf-8?B?OEFqR3FtNmFOZlpndlRoQUJuanlxQ1dXSkFOVWRsS3ZkRmZBeHRFd2VwTG5M?=
 =?utf-8?B?RzdFYVZHZWVyRVRaeFAwT1JaQ01iT3NDWUVvYTkrbmJXQ2E3NTAzVHlwZFRQ?=
 =?utf-8?B?c09RSVJLUUpITStEd0xzSStvRzMzeE5nNThLaEVvMGFkSUtFdUUremVqaDFV?=
 =?utf-8?B?RTVHakRHZWYwT2dmcmVlRWJUY1hWMzVQRnBDUmRSR2RFOWlIcDhlS1VrM3RK?=
 =?utf-8?B?aWVyd0pnM0hzNGdpWDJhQlY5b3VUM3J6bFg1L3BKelROUG1QSXhEYlZxZ0ZC?=
 =?utf-8?B?R2lDM0NyOHE0MU84K3pubFJyM1FxLzZBZFFoN1A0TTJoV0NZWXQ5TGo1NSsx?=
 =?utf-8?B?RTdvbkdXVGZsMGp5c29ZNmRDbVUrUUQ5aXY0MzFobWFJSmRlYTl0OWtOUjRo?=
 =?utf-8?B?T0JhSzlLWisraUdhNVpxeVV5Q1VOcFV6elhrT3J5NG5WWUs4cUR2OXA0QktL?=
 =?utf-8?B?L3R5MGJjTktWbEs1TGZDbEZJMzRKcjBTb2E5Z01Yb2VvMHVQRGM4b3Vlaitu?=
 =?utf-8?B?dTFuMUR0cWsxRWszK3ovcDRQbVFwNGU3RG8va1VjdVhYcUozNXdVRHlyVUJh?=
 =?utf-8?B?TVJocjJnL3pxajhnZ3hnVGVGbyszdWJqckRIM3phY09hOU9zV3h4M0wwQUFm?=
 =?utf-8?B?VWM2bXBtQ21iWjMzMjNzdVA2NExpQjhVTEZvR2NpcmE0RlpnV2p4OSsveG9F?=
 =?utf-8?B?a2RFSGJBeElZNVQ5SWNtaEkvUDZKelVwcStkMkl2NUlFZFJkVnZkNHF6ay9j?=
 =?utf-8?B?VllidFBORHVNSDV2dnVrZU9MaHJOWXlPUFpzWWhzOHp6czhwWjZsRndVVkJn?=
 =?utf-8?B?aVpxRHFVNVIxWEJseGhwdWtreXovamU4ejlkQUlEbnFzK0syam1LZzlGKzJ6?=
 =?utf-8?B?QU5yQXBSb2RzOE9CakZMcERCRHZadTBhNGZxV0lqdjlMdFQreFhiMnptVmRk?=
 =?utf-8?B?VmkwV1F6QWNaUGVKWm5kbFpUQWtNcDJvb2p2WDEyVCtyUjk4U1JDZGlJMXpt?=
 =?utf-8?B?U3d3bmdneVBjQytweHVkNEkzTC8xa0ZUcHhaalo1b3F1Sm01VzF2NEhHOXMy?=
 =?utf-8?B?WWxxV1VueTNZS2psWlo0RDNXcVVSOEg0L1VNemFScUkxMzlTN0xhR0JFTXRa?=
 =?utf-8?Q?+/hJiFgGrMWlp?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6375.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ky9TK2lHS3NnOC9QK1NXWUV1QkVKbWJOd3V1ZjJGMXhPR1A1a3QvRXZNNjZ2?=
 =?utf-8?B?WHl2UGI1TUN0K3lyT0l1YlFDcHAvR1FkTXNNWE92N3REbW4xZzFld0xlRjRk?=
 =?utf-8?B?cHhHY1pzbHRnbWltcFVNZ0pUK0RZa2JJbnNaaXp0SlQvdS9UaUludkRzbllN?=
 =?utf-8?B?VHBpNjZqUjYzcmxSYkp4UVdPRDVoL09BMndJRStwTjc1dWtYY0FJZ1JKV3lG?=
 =?utf-8?B?eHJld2txcmxLaFg1Q0FYWVJPNGJuak83MEY1TGxzaWsvSXhKTEpzTURuM1o2?=
 =?utf-8?B?S1hmdmd1clpySjQxVmVpRnJ6VGY0Q1F1NjFPNkNQQm9GRzZKN2V6a1RIMWo0?=
 =?utf-8?B?NldhMWZHTUYxZkU3YkcxUUJIZjRRVXBQUjNnRER4dThXUjlOWmdYV1l6YThR?=
 =?utf-8?B?TTI0S0pwdmJya1gySGJ4OHgxbVJNRlZCTWlrSGk0UlZTdmJ1RGx4UW1WSUVw?=
 =?utf-8?B?RXprVkRRT2JRNjdvcTRodUZtZXFHRjBNbEJNVHlTcEdXOEord0lNaDNYNzlX?=
 =?utf-8?B?dk5wS20yOEg3SUNOTW5ZMWp6NHFJUTlkRk9aTTlzTnNCYnFNc1dGRDM2OGV4?=
 =?utf-8?B?RXVrNDFWemFYUUxjZDhrNEF3TTk0RlB5L0t4LzYwYk9mTGMrMnpyTUYxbzF6?=
 =?utf-8?B?dm1ycDFsZmNCMUgzYXdKek82V25MRGYwdi9DWG90Ny94RU1aczI1eDZMVEpJ?=
 =?utf-8?B?S04wcW1zaUdDUWE5QzErWWNLbEI2OXJsaGdxSTRHNWZuRnJ5bUlxQU9tUHJz?=
 =?utf-8?B?UEN6bURxVnRoU1ZKV1B6ZGJUOFh4TTF5NXA1Z3NsWVNKeW51UzUxNERIbTJQ?=
 =?utf-8?B?ZFRDbEhBWlNvNE9qV3Q4WDZxb21YUzZ1OUhhVzFSQ3dOVnJLQ094Z3k3Z2V2?=
 =?utf-8?B?ZmZLc3U4MDlCbnRvT0EzVmMweTZZVzZIN2xkWUh5V3dFd0dPYkQ3SlhlSGpq?=
 =?utf-8?B?SFpyZTdKTmpZamxVbVpjeVYwL05JVDR4SlNDWUJhMkoraVFvWFVWVXJIT3pM?=
 =?utf-8?B?c0c1R0RocDFTMVdlOXJaYlRMeFZNQi80S2NsVS9ZMU9ucHVIYUMwVUZLK2JI?=
 =?utf-8?B?NUNMdXlHMzl6cDR4R2U1NzV0V1IwOG9KMGlsazJSSEgzOEhWcURTMG5oRFZx?=
 =?utf-8?B?OHlqU2VtNU5jWGdHUzlWWlNYQ0MrV0xsUFRyZUp2a245ME5vQmFHMmM5c1d2?=
 =?utf-8?B?Q2RHY0QrZkorWkNPSTVudkRlREx5TkFCZ2pBMVg5MHp5cmQ0dFl6TUZkOFFD?=
 =?utf-8?B?ZkJLQWkvNlRGR1dZMnM3aGw0QUZwcVBFeVZxdXJkQ2VwVFJDNEpEZXBuWVZ1?=
 =?utf-8?B?Nzl4aEwzM2cyM2YxQjBFL2tVOEpXV1A2cDAzTU41MlVmMFVpWlUzZkJ6OTBy?=
 =?utf-8?B?b0Z5cHFFWkxBQllUbCtiOWR0Nk9vKy8xVWRXVVZOSzEzeHFMWDJ2VHVyTFZP?=
 =?utf-8?B?M2tka0VLcjB2bnJQNUlFaVhiaCs1VnZBWmdWNGNSeTAxNDhlRG90UlVDVkJL?=
 =?utf-8?B?ZUZvMmxGMnUwOUQyUkdkeHJPUDZ3RFZzNGNmS2o1MkRUWm1rZTRGUnQ5NG55?=
 =?utf-8?B?dmxZZ09BUEtCMXhHUGlBUHB4UXBwOHpML3Ixa2hUMlNScE4ycnBvOGxSUXBB?=
 =?utf-8?B?T3IrLzBiTG1CSTNSMVg4K3IvQkM1cXliU2NGR2hOY3U2Q3ZxSFgzdDArOFlk?=
 =?utf-8?B?MjdWV2syT0V4MXVKVTRQUWxuMTd4ZlZZejBKVEQ3Y3hYb0hvZnlzTjBXcjVI?=
 =?utf-8?B?WmdocTZUdjZlMm9LWDBlTUxwaWFTVzdud3VURXhMdWFXRnRDMmdCUGEyNk85?=
 =?utf-8?B?eWt2NDNpM0h6VTJVUEU1WkZ5ZksraWRZS2xwTnpZbzgvc3lPdm14OXNrYzkw?=
 =?utf-8?B?NFJLcE5nTFptbDVOVlkyRGVYczZKQlR4ayt0MHBIcGpINysvUENOV3VZeEVQ?=
 =?utf-8?B?dWVveStYOUJ5aUwyUjBsVU5GcW5sWlNuSWFJbS9Wa0krZWV4dGhSU2NkNHdB?=
 =?utf-8?B?MWxJZzUya1NRT3FlSjVITkFheTNKRDBmdUFjSHBIWXVCcXdhWjNUQlh1UnZh?=
 =?utf-8?B?MVFvTTdYanpPY1dabmJ1cGt1bjlLN0I4REpvNnoyQzh2TEs4aTY2RC91cDhN?=
 =?utf-8?B?YTg2YXhMbVBscmZlZC83aWFNb2tZdEdneURzZGRyRG8yS3B6d1YyL2VsVnBB?=
 =?utf-8?B?cEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1090817a-566d-4358-375d-08dd7379f9a8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2025 13:09:47.5166
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GZkyvFjPehgH9GcRMqwR1IRmcXP4c71A6B4Av2LyvQrIKEalB6kvDAPxbnkrI/SL7J0i4FAzpGLVRfcmJw7gFVUXhXb/uB3EoF+/HFoXM1s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB8962
X-OriginatorOrg: intel.com

On 2025-04-04 2:52 PM, Girdwood, Liam R wrote:
> On Fri, 2025-04-04 at 11:49 +0200, Cezary Rojewski wrote:
>> Cezary Rojewski (11):
>>    ALSA: hda: Allow to fetch hlink by ID
>>    ASoC: Intel: avs: Ignore Vendor-space manipulation for ACE
>>    ASoC: Intel: avs: Read HW capabilities when possible
>>    ASoC: Intel: avs: Relocate DSP status registers
>>    ASoC: Intel: avs: MTL-based platforms support
>>    ASoC: Intel: avs: LNL-based platforms support
>>    ASoC: Intel: avs: PTL-based platforms support
>>    ASoC: Intel: avs: PCM operations for LNL-based platforms
>>
> Sorry - AVS is not officially supported for MTL, LNL and PTL on Linux.
> 
> NAK.


FCL is a PTL-A, PTL-based platform. The driver is officially supported 
on the ACE architecture with clients utilizing it on distributions such 
as Android and Yocto. As software needs little to no changes to cover 
PTL alone it is preferable to have clear division: ace1.0 <- ace2.0 <- 
ace3.0. The code is maintainable and readable this way.

And then we have validation point. intel-dsp-config remains intact (no 
selection changes for MTL/LNL) but still leaves window for the 
AVS-validation to have high code coverage.

Unless you can bring technical arguments, 'NAK' does not apply. The 
requirements for the project state clearly - upstream the code for the 
architectures we do support.


Kind regards,
Czarek
