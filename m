Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35B28371D16;
	Thu, 11 Jun 2026 09:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781169563; cv=fail; b=U0oEqJPyCbWRjBseNQVK4FNod8VWGzAWNKtO3n7c1F3kXY58lVPZ4SzNUQkESfjBZiWb9hjgnfLBWrLrAAIoty7+iTD8IrwbnQmYsN68lzzK2tEyn78k7vNEyXt2Ki4BwUz7EWvkb7Jck6kFQbm664knlLRoMRaXiPVk2CVq2M4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781169563; c=relaxed/simple;
	bh=9STg50BEeiMCfxTvKMrSrVZGkrmfWJPls9leT1u85O4=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=MHXEuIDj1SVFvNEiIPdSNwA4QkdDuBUDsfmxb+LVjcER7R71azjUnm2v/huaMv8DFMXDwtop22j9JI0klcLWrvlFF9KUKeMpVxRTeMZZJhwfRtXQfWgzil1LmK9DXbsrMXS8MJSBxTfQCS1SYJv0ntgNrLQF0dM0+JoUJ6Jd7DI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hT5HEqDQ; arc=fail smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hT5HEqDQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781169561; x=1812705561;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=9STg50BEeiMCfxTvKMrSrVZGkrmfWJPls9leT1u85O4=;
  b=hT5HEqDQmNrzmUYiji1EDwJpGW5brMhZNyQn6UNhDz9wHO0X9eBOYZjc
   QbRV33Tki5hwMCUYhKb7v9z3HBh7X2xqGqcve3GwQ99ZEa0vbUswtDchT
   hgxq1aNINbJptTfzsY7iWN+leYfdZqWveeTt38dbD3Ng/RezL9jb8MRNE
   1AAVYQ10bYcdXBnXhM5YjaBsn9bBA2dBG1FCC2WLq5lhx5qc9R0F9EILR
   J8Yc5qbTTm5vUmnipQdUQznbT9X5ofFZehleDkSGcEcSGvZMIkj0BuJoW
   cinfMe9hVL09ZAAYNBcObBN5bVvtzhndui9ybVloKfeSPuozyAnGdZq2K
   A==;
X-CSE-ConnectionGUID: vXa7lezfQY+suJ+5mY/u3w==
X-CSE-MsgGUID: i6C3m8KCSGqaK09a6nFDUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="82022774"
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="82022774"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 02:19:20 -0700
X-CSE-ConnectionGUID: Y6KTz2yEQcuN0SsV6nrwPQ==
X-CSE-MsgGUID: EhuJOaYnR2Cb5UY3fYz6Ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="240085547"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 02:19:20 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 11 Jun 2026 02:19:19 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 11 Jun 2026 02:19:19 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.42) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 11 Jun 2026 02:19:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LSee3HiC849ZykAfbD4TJcn7UBEWgAiK6pZrSHnwa3bZU/Z4qRN4j+vKyMb2ooOJhJ7r0EuBzV0khrEGshUUB1iQ9K7XnrbPCOTlnEBChMwJ3SHcCMpDyDE1vy76Aif1oBm7QUWkQChhpZaMt6C5XACQcWwUzWCzBkRR+0kEJ5aT4BOIYFTPsFB+y4TJY3g0CQJ7niKnvnIgzh31IX1VV0iCBzDHcCjcneToohKEHcqF9duKgoxUhVAA+Cw6sYfAsL8ZoCacX5IVklU+CTTJ53pPox8igeeUdRUxGcxBpzvNrdYXyaaZOIKOIpwPhcY5N7qHO4xiKaqdj2O894+M7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YcVLYtDpsSMVQVjZy4rCCa5j28c1D9QZrERVPgL5fMw=;
 b=s+mK9IrJAZtDpgI6IZxa32zcnMVI1kHa4+SYywiaOwRcmeZPvRhGRxUuazDKFkYHrTmIF+MMWkBnmV/7Mi5vrJWZ1dQplbhC5r227eH2lJqfW6dS0L88CM2ud1tHwq3sJpy1Slolla/nN5Tvn+QZjUz4gSQTYJ7mMuz5OrX9rfOAlkpRRLjsehWmf6+5dpL2maltJFdXyTTWzwzfpxbcTtx7353yNk4Ss+viegV3K7gZ8NmIa6rCgbgKMqyRVHKFoFQ2jcTE4cCwym7/F/IcDrc96C8VH7WRRagmxKd33Y4a/1kMs6kNBEd8kT+8KR5FTIi8Q8pevTEB7MNe2bs0eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6978.namprd11.prod.outlook.com (2603:10b6:510:206::12)
 by CH2PR11MB8835.namprd11.prod.outlook.com (2603:10b6:610:285::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Thu, 11 Jun
 2026 09:19:17 +0000
Received: from PH7PR11MB6978.namprd11.prod.outlook.com
 ([fe80::f60e:1044:67d7:d8fc]) by PH7PR11MB6978.namprd11.prod.outlook.com
 ([fe80::f60e:1044:67d7:d8fc%5]) with mapi id 15.21.0092.011; Thu, 11 Jun 2026
 09:19:16 +0000
Message-ID: <e1627940-2bfe-4281-a0ff-03b7dfc16899@intel.com>
Date: Thu, 11 Jun 2026 11:19:10 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] ASoC: Intel: Add cht_rt5677 driver
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
 <20260611-asoc-yogabook-v2-v3-3-3128447b67b6@gmail.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20260611-asoc-yogabook-v2-v3-3-3128447b67b6@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA3PEPF00000514.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d8::668) To PH7PR11MB6978.namprd11.prod.outlook.com
 (2603:10b6:510:206::12)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6978:EE_|CH2PR11MB8835:EE_
X-MS-Office365-Filtering-Correlation-Id: f2580f8b-bb59-4d67-a95f-08dec79a8295
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|23010399003|22082099003|18002099003|56012099006|5023799004|11063799006|3023799007|4143699003|6133799003;
X-Microsoft-Antispam-Message-Info: rLm0zdj6rP2dekus2mEFT6c0/QxDaTY67FXkxELAWO6uzeM0t3ZuXARJ0tdAXcy0mU/WeZi+LuPmd6IKkRYnBVSoVT7SYClVAz5faZgDT/ES17b6fBfFKEoC54p+k2mrqmyVh9hWDM5/iYkiBJ7CNhsZCC9Y5dXl3UGLFG292hI+GS55/VDTw8djRfDkCJP0f+liAm1DGHtvUJEaNG8NEctYBVaktcT+sA3Aw2YAhDba7IpXh/VNNMYq5SfegIN+va3I1iriq7QHq1HawS+G5XAKlV5ztS3a8wrOUmQqM+sqlpuQov/R3+KShIrI5V4nLSoW6nCmWiOYmS5xRoF8VX8XelXtAjNHJ6tVj1pLZwdC7pO5fhaumZDIfc2qwKnWLb9DeOTpmbXuzIFr85UMb9ktmghhyPSKMuksFgilzhbSN3JUEwvFuPla+TUSU+SBa8Srh5Q2Zjm/JyC1gQJTncos9htO7eerPR/ZzoorUPzH+0jK7QbXFoQg0MPVJJ2MPhRrK6AhMrq0JPFAdYa5fCOTYKOcpZQk/TQSMwzOb5nMVYzjvWIXHQbCaj8v3wHAaqJ7KIyLaJyOe7+1+hDq7S/IXtdy5A7/w7hNRb1ReBrNtxGPTdkaIg5RjhrvPHh/0xspkHTmURgo72360uKiTsdcEX9UU4OvQFP5d6DPjG50FS4i7OwNuB+H1ADmtEuu
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6978.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(23010399003)(22082099003)(18002099003)(56012099006)(5023799004)(11063799006)(3023799007)(4143699003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SDY1dVBld082a1ByYW0rMythN1dwcWpxYnErRmwwZ1o4dFhIc1hvbmMyMWxu?=
 =?utf-8?B?ZjJEdXBOdWt4Wk9vb1ZFVlBCdW9BdTFZdXh6MVVQck5Va3BadmRBejRzVTNR?=
 =?utf-8?B?ODJXVS80TzJKS2YyTjAwVEphdis3K1VtMDZ1d1p2MzZaNnhBbmx5dUUrSmVl?=
 =?utf-8?B?Z3A2ZFF0RkdZT3ZIR016K3VYY0VybUZzbVUwNTZmN2N3NDkvVTZFbWlBWThP?=
 =?utf-8?B?S0pVVGRiWTkwcG5QRTU3WUg5MHFFNXN6L0txWkJyZm1zQzQ5WDY1WUVaSWNp?=
 =?utf-8?B?bHVwWi93NHluandpci9saDZmekVKVmFiNVRtZ3oycTliNVprSEIySjR3N3h0?=
 =?utf-8?B?ZXdzT3BYK0tDaEE1MDRpNGVSMlhpOWhReURxOW56bGFQUjhGdzluVlVjYnZ6?=
 =?utf-8?B?Y3lSek4wSVJyck5hdzVlMEZINHJxK253R0pra3BRc2YvOEFFaVJTVmNvVHBv?=
 =?utf-8?B?a3NqbGxIc1YzUEZqZ1FFT1lLV3J1V3doT25PT2s3VzRhWUlIbGJPTXRWMXZ3?=
 =?utf-8?B?ZTJpeFVCNnRiU3U4TE8wa2xIcVh1Ym51b2JOelkyQ3dRaEUvZmVsamw0Nzg1?=
 =?utf-8?B?K2RIem9qcTRGZTFINHNHZFI5Nis5RzI0SmdzbXdtdm83ZnhnR2l0K2VHZHNT?=
 =?utf-8?B?Y2MxZkNrTWY4bkpYb3RraWE5aDZNdzRRWm00MndMRWFDUjViRE5QZ3RrTmZN?=
 =?utf-8?B?aFZ0WGxqN1VOUFAwbG1UU3RSNVUweHlYbEh6U0VQbGF3dFNOanNmQ3lEbzNV?=
 =?utf-8?B?eC94dk90NHlDdXdtZldSaUhqcmVVYWd5WndxNElVVnRxbXdpRklrNXNjQWl4?=
 =?utf-8?B?TExlMG10bGFuU3VoTFIvaDZsR09xWnA3SFVRU0VmRDl6TnFFaFpYbTFudWl2?=
 =?utf-8?B?TTlqbEIydXozMCthMlZPQzQ1bWxhMEc0MVE5aS9NSS9vSzh1TXRneGJmdHhN?=
 =?utf-8?B?M2ZEbXhDNlc0N21CSHBsL2dqNWZ6Tk9HYnN3b2J3Wkxvb2Mzemp5cmpLMkZJ?=
 =?utf-8?B?T2JsSTBCeitMdGZwR2tvOE1DYTgrOWk4R1daVi9CWitNMnRkYlZubHByYkJp?=
 =?utf-8?B?U0FmNWhOVEoxdk9TOG13QmE0V3lFSG9ER3dJb2xqekVnYXArWHJmbENOaHVv?=
 =?utf-8?B?TERZMW03MjdWR2xJVS9icWJWSS93NHMxUW9QL1NmUk5tZFVWSis4a09KSkFQ?=
 =?utf-8?B?SktLMm9pVWc5Mkc1M3RiTlhCb200UlJIUyttckQ0UlFsOGxKUUdGOTZCL1Qy?=
 =?utf-8?B?b0hmbmNiMFYxTHZ2ZXhmTStwNWFKbFdEcVNlZU1wUnlFVkRWZ25Oak5hOU9o?=
 =?utf-8?B?SWVIMUZmTGx4dUFLamZuSlZIdkk5cEdObkRVMGdKMVlPUWpac2l0SE5ab2Rs?=
 =?utf-8?B?WlhDcjlxeUJ2OUYrN0E1SVBPVk1yYmtLZjNLbllvTS9vejRiZ3E3WlpwL3g2?=
 =?utf-8?B?ejd6WFJlS3JHQnd0eDlSK2ZvT0Q5YVNneGxITnRFaWVlOEpMMDNES3NPbytR?=
 =?utf-8?B?MlVIMGxHQmRZUko0MjRPRGdHWkFWaGVuOE5mWFlJRTFEM3FnT0VvYzhVK1FG?=
 =?utf-8?B?bDFSd28yN25uMHQxRlRMMzhsbXVFOG9nRWNxMlRSVWJ5bG9LVG9udDNHNVg3?=
 =?utf-8?B?Y3lNRHQ2VnN0WDExejA2TG4vWDFaWHBGem8vUkR1Q0dpMytNMm5xL3pmakgw?=
 =?utf-8?B?U0xLMkVYWlU2UGxUR3JHMzV4UlZNYzMxU01HemM3bGduOVNFVWRvZU02ZGNU?=
 =?utf-8?B?dnBtVUtVY1crbXltUGNaM0J6RVRLRVJtbmJ4YWdSU3FjbVlXTmxIcmtmVjlt?=
 =?utf-8?B?dUJuM0twWWxoODZoK1FnWmhOZnVhZnhiMHc2a1dUSXh2TzU3SW9nN2xDdDVt?=
 =?utf-8?B?YlRHb011V2ZkV1BlUHVGSHdFdFplN0c2akZ4VTZjVVJOY2hDUEFDeUZhK0d5?=
 =?utf-8?B?R3ZkTXMzRHdnVHpRZTBVUkNPMTFRSzcyUzJscmloRHA2VGVHb3lvcDBsQXg3?=
 =?utf-8?B?QkRNN3NaWEhKSmlad1VnNjRmUzZUNzgxbE1HYSt1eG5ZQy96SkdqOTFiQzBY?=
 =?utf-8?B?ek5BRW10NkZ2K2dHVHpEL3QwN1FjT3BoYWptVnJXdkJKSVNxWmY3UjZtdnl6?=
 =?utf-8?B?dDY0Q29yNmE1aTl0dytqbVIwcndVV25PdExyR1M0UTZqdSswZVMrVEYrQjRy?=
 =?utf-8?B?aUJGZzBlTFF6ZGFrWHEyRWxnd2dDZFRBZ3Z6SWtVL2IrdHZnUVNhRDhnRDlw?=
 =?utf-8?B?cjFiMkZUWkNmTlowM1dBSis1UDVISFQvMkFCcUs5V2daTE1hWVlqQVpZR05x?=
 =?utf-8?B?ZHN4RVlKY25pYURFaGxjUG4ySnhkNkhJT0pzMEVscUtQVzZqR0RCWjhLbktn?=
 =?utf-8?Q?TuezzQuPaOVqGpsA=3D?=
X-Exchange-RoutingPolicyChecked: qDKy70VwLdpbuWZbhPZdffnxR+oCpauYTOhrN3wrJ8xfXjucXChc3A7HwRZN7kvKPY2E+8LTzbAxmeyVtsYLRthNQar5w9Ly4lcCOieoScVqyRXpZYdY9h4x8mjgouvZHMv7QQV9BeuPZuQldpe04OcF0JG1NmmGc8cDST8HqZaXBF0SoSK6e9B949Fk5P7WSqNqQ9rfeX2+usYayl/cMRAzoUJbqCsOoM4oDXBoCAc7PQX2cj8aqDlnqH3RZRmS4LqRfegMcTLGyc28NY3FJ33swm1EpsdOoBFveINLHHEE7Ct4REy9qNepIyL59SodU7bORsx0qRHY1Uw9QDHf1A==
X-MS-Exchange-CrossTenant-Network-Message-Id: f2580f8b-bb59-4d67-a95f-08dec79a8295
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6978.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 09:19:16.5473
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ku/jaLTf2qUGGxhOKYxKpUjuy4SUEWvgboV7Is+4VV0w4+frCmTtmV/DGZ6YkaFNKQ/gXV/y8xDFuaCC1+jWTjxV5NDSgtIsnpTKfEeedFA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB8835
X-OriginatorOrg: intel.com

On 6/11/2026 1:51 AM, Yauhen Kharuzhy wrote:
> Add a new ASoC machine driver for Intel Cherry Trail platforms with
> rt5677 codec.

...

> +struct cht_rt5677_private {
> +	struct snd_soc_card card;
> +	char codec_name[SND_ACPI_I2C_ID_LEN];
> +	struct snd_soc_jack jack;

I'm strongly against any private context encompassing card and jack as 
fields (sick!).  The design looks off - it's very unlikely you need to 
store the card (even as pointer) at all.  All the APIs found below 
either hand you *card on the platter or provide means to do so e.g.: 
component->card.  Retrieving private context from the card is a formality.

> +	struct clk *mclk;
> +	struct gpio_desc *gpio_spk_en1;
> +	struct gpio_desc *gpio_spk_en2;
> +	struct gpio_desc *gpio_hp_en;
> +};
> +
> +static int cht_rt5677_platform_clock_enable(struct snd_soc_card *card,
> +					struct snd_soc_dai *codec_dai)
> +{
> +	struct cht_rt5677_private *ctx = snd_soc_card_get_drvdata(card);
> +	int ret;
> +
> +	ret = clk_prepare_enable(ctx->mclk);

(save: enable succeeds)

> +	if (ret < 0) {
> +		dev_err(card->dev, "could not configure MCLK state: %d\n", ret);
> +		return ret;
> +	}
> +
> +	/* set codec PLL source to the 19.2MHz platform clock (MCLK) */
> +	ret = snd_soc_dai_set_pll(codec_dai, 0, RT5677_PLL1_S_MCLK,
> +				  CHT_PLAT_CLK_3_HZ, 48000 * 512);
> +	if (ret < 0) {
> +		dev_err(card->dev, "can't set codec pll: %d\n", ret);
> +		return ret;

(save: set_pll fails)

Result: clk is still running despite cht_rt5677_platform_clock_enable() 
failing.

> +	}
> +
> +	/* set codec sysclk source to PLL */
> +	ret = snd_soc_dai_set_sysclk(codec_dai, RT5677_SCLK_S_PLL1,
> +				     48000 * 512, SND_SOC_CLOCK_IN);
> +	if (ret < 0) {
> +		dev_err(card->dev, "can't set codec sysclk: %d\n", ret);
> +		return ret;

And the story repeats itself here too.

> +	}
> +
> +	return 0;
> +}

...

> +static int cht_rt5677_codec_init(struct snd_soc_pcm_runtime *runtime)
> +{
> +	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(runtime, 0);
> +	struct snd_soc_component *component = codec_dai->component;
> +	struct cht_rt5677_private *ctx = snd_soc_card_get_drvdata(runtime->card);
> +	int ret = 0;
> +
> +	/* Enable codec ASRC function for Stereo DAC/Stereo1 ADC/DMIC/I2S1.
> +	 * The ASRC clock source is clk_i2s1_asrc.
> +	 */

Explain _why_, don't just repeat the what's clearly visible in the 
parameter list.  Otherwise, just drop the comment.

> +	rt5677_sel_asrc_clk_src(component, RT5677_DA_STEREO_FILTER |
> +			RT5677_AD_STEREO1_FILTER | RT5677_I2S1_SOURCE,
> +			RT5677_CLK_SEL_I2S1_ASRC);
> +	/* Enable codec ASRC function for Mono ADC L.
> +	 * The ASRC clock source is clk_sys2_asrc.
> +	 */

Ditto.

> +	rt5677_sel_asrc_clk_src(component, RT5677_AD_MONO_L_FILTER,
> +				RT5677_CLK_SEL_SYS2);
> +
> +	/*
> +	 * The firmware might enable the clock at
> +	 * boot (this information may or may not
> +	 * be reflected in the enable clock register).
> +	 * To change the rate we must disable the clock
> +	 * first to cover these cases. Due to common
> +	 * clock framework restrictions that do not allow
> +	 * to disable a clock that has not been enabled,
> +	 * we need to enable the clock first.
> +	 */
> +	ret = clk_prepare_enable(ctx->mclk);
> +	if (!ret)
> +		clk_disable_unprepare(ctx->mclk);
> +
> +	ret = clk_set_rate(ctx->mclk, CHT_PLAT_CLK_3_HZ);
> +	if (ret) {
> +		dev_err(runtime->dev, "unable to set MCLK rate\n");
> +		return ret;
> +	}
> +
> +	return 0;
> +}

...

> +static const struct acpi_gpio_params speaker_enable_gpio = { 2, 0, false };
> +static const struct acpi_gpio_mapping cht_rt5677_gpios[] = {
> +	{ "speaker-enable-gpios", &speaker_enable_gpio, 1 },
> +	{ NULL }

Drop the NULL.

> +};
> +
> +static int snd_cht_rt5677_probe(struct platform_device *pdev)

...

> +	ctx->gpio_hp_en = gpiod_get(codec_dev, "headphone-enable", GPIOD_OUT_LOW);
> +	if (IS_ERR(ctx->gpio_hp_en)) {
> +		ret = PTR_ERR(ctx->gpio_hp_en);
> +		dev_err_probe(codec_dev, ret, "getting headphone enable GPIO\n");
> +		goto out_put_spken2_gpio;
> +	}
> +
> +	/* override platform name, if required */

The comment is redundant, explains nothing, drop it.

> +	platform_name = mach->mach_params.platform;
> +
> +	ret = snd_soc_fixup_dai_links_platform_name(card, platform_name);
> +	if (ret) {
> +		dev_err_probe(&pdev->dev, ret, "fixing up dai links platform name\n");
> +		goto out_put_hpen_gpio;
> +	}
> +
> +	ctx->mclk = devm_clk_get(&pdev->dev, "pmc_plt_clk_3");
> +	if (IS_ERR(ctx->mclk)) {
> +		ret = PTR_ERR(ctx->mclk);
> +		dev_err_probe(&pdev->dev, ret, "getting MCLK from pmc_plt_clk_3\n");
> +		goto out_put_hpen_gpio;
> +	}
> +
> +	snd_soc_card_set_drvdata(card, ctx);
> +
> +	/* register the soc card */

Ditto.  The funtion's name says it all.

> +	ret = devm_snd_soc_register_card(&pdev->dev, card);
> +	if (ret) {
> +		dev_err_probe(&pdev->dev, ret, "registering card\n");
> +		goto out_put_hpen_gpio;
> +	}
> +
> +	return 0;
> +
> +out_put_hpen_gpio:
> +	gpiod_put(ctx->gpio_hp_en);
> +out_put_spken2_gpio:
> +	gpiod_put(ctx->gpio_spk_en2);
> +out_put_spken_gpio:
> +	gpiod_put(ctx->gpio_spk_en1);
> +
> +	return ret;
> +}
> +
> +static void snd_cht_rt5677_remove(struct platform_device *pdev)
> +{
> +	struct snd_soc_card *card = platform_get_drvdata(pdev);
> +	struct cht_rt5677_private *ctx = snd_soc_card_get_drvdata(card);
> +	int i;
> +
> +	/*
> +	 * Reset the codec name in the global dailink array back to the default
> +	 * to avoid a use-after-free on driver rebind (unbind/bind):
> +	 * ctx->codec_name is about to be freed together with ctx (devm), but
> +	 * cht_rt5677_dailink[] is a static global that persists across binds.
> +	 */

All of this looks like a hack and brings me closer to simply stating:

NAK

as I do not believe the patch has been thoroughly tested if such hacks 
exist.  remove() procedure should not care about codecs->name.

> +	for (i = 0; i < ARRAY_SIZE(cht_rt5677_dailink); i++) {
> +		if (cht_rt5677_dailink[i].codecs->name == ctx->codec_name) {
> +			cht_rt5677_dailink[i].codecs->name = RT5677_I2C_DEFAULT;
> +			break;
> +		}
> +	}
> +
> +	gpiod_put(ctx->gpio_hp_en);
> +	gpiod_put(ctx->gpio_spk_en2);
> +	gpiod_put(ctx->gpio_spk_en1);
> +}

...

> diff --git a/sound/soc/intel/common/soc-acpi-intel-cht-match.c b/sound/soc/intel/common/soc-acpi-intel-cht-match.c
> index 5e8a1dc84ee1..c719c3ec8314 100644
> --- a/sound/soc/intel/common/soc-acpi-intel-cht-match.c
> +++ b/sound/soc/intel/common/soc-acpi-intel-cht-match.c
> @@ -17,12 +17,11 @@ static struct snd_soc_acpi_mach cht_surface_mach = {
>   	.sof_tplg_filename = "sof-cht-rt5645.tplg",
>   };
>   
> -static struct snd_soc_acpi_mach cht_yogabook_mach = {
> +static struct snd_soc_acpi_mach cht_rt5677_mach = {
>   	.id = "10EC5677",
> -	.drv_name = "cht-yogabook",
> +	.drv_name = "cht-rt5677",
>   	.fw_filename = "intel/fw_sst_22a8.bin",
> -	.board = "cht-yogabook",
> -	.sof_tplg_filename = "sof-cht-rt5677.tplg",
> +	.board = "cht_rt5677",
>   };
>   
>   static struct snd_soc_acpi_mach cht_lenovo_yoga_tab3_x90_mach = {
> @@ -41,17 +40,9 @@ static const struct dmi_system_id cht_table[] = {
>   			DMI_MATCH(DMI_PRODUCT_NAME, "Surface 3"),
>   		},
>   	},
> -	{
> -		.ident = "Lenovo Yoga Book YB1-X91",
> -		.driver_data = (void *)&cht_yogabook_mach,
> -		/* YB1-X91L/F */
> -		.matches = {
> -			DMI_MATCH(DMI_PRODUCT_NAME, "Lenovo YB1-X91"),
> -		}
> -	},
>   	{
>   		.ident = "Lenovo Yoga Book YB1-X90",
> -		.driver_data = (void *)&cht_yogabook_mach,
> +		.driver_data = (void *)&cht_rt5677_mach,
>   		/* YB1-X90L/F, codec is not listed in DSDT */
>   		.matches = {
>   			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Intel Corporation"),
> @@ -147,19 +138,11 @@ struct snd_soc_acpi_mach  snd_soc_acpi_intel_cherrytrail_machines[] = {
>   		.board = "cht-bsw",
>   		.sof_tplg_filename = "sof-cht-rt5670.tplg",
>   	},
> -	/*
> -	 * The only known Cherry Trail device with RT5677 codec and 10EC677
> -	 * DSTD entry is the Lenovo Yoga Book YB1-X91. It has a device-specific
> -	 * driver, so check DMI and use a machine quirk to override the default
> -	 * (non-existent) machine driver.
> -	 */

You are removing and editing (the below table) code you've just added 
with 2/3.  This looks very bad.

>   	{
>   		.id = "10EC5677",
> -		.drv_name = "cht-bsw-rt5677",
> +		.drv_name = "cht-rt5677",
>   		.fw_filename = "intel/fw_sst_22a8.bin",
> -		.board = "cht-bsw",
> -		.machine_quirk = cht_quirk,
> -		.sof_tplg_filename = "sof-cht-rt5677.tplg",
> +		.board = "cht_rt5677",
>   	},
>   	{
>   		.comp_ids = &rt5645_comp_ids,
> 

