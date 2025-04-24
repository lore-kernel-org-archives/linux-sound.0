Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 450BC1E9B32
	for <linux-sound@vger.kernel.org>; Thu, 24 Apr 2025 10:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745489831; cv=fail; b=txydgKiJjsjqZErI73LHZGvTYO52iworPg8SevhUhcPs5B7/ScbG1ELfqiiGI7CmmwYhzAifexZyxzJaK/8+ABDeeUchrFSiRHmD9ism43FXFirWELYMJlvvnZETWzaxZ9AEV5GL/5WzGdsIjR+YNttoYFsOjbFTH8/f1OE+KAY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745489831; c=relaxed/simple;
	bh=5CuP+npCAqXg0Y9E4KkedSXpy7a96j3e9y0SogeU9PI=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Bl53MU/CdOPfCRB1sJvrC4PQyZ9hzVwFCQkT6lFJsHt7sfc2j4m9br00mZDhKxtGTyZ8JQPC5mBY4qoH9sx09zcKF6Kl0f4Ndw+WzynbSR0sr9hi/U4sNF7tD043tb+uvlk/xQyg3aPgJzdqpEZYc1mB1MsFKd/zfEaJrS7gQkY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ijpxk4pj; arc=fail smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ijpxk4pj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745489830; x=1777025830;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=5CuP+npCAqXg0Y9E4KkedSXpy7a96j3e9y0SogeU9PI=;
  b=Ijpxk4pj3U5IhaLTyB2ioFmiWMkBSh94kPTG51LxFDBO1YWNMLoB1uIn
   NK2INCjT/rf+ayLeKfOTjpVd1q/MIfUhuo234hfunBqgeHkIWEml8FQ1h
   5l7KMA78DO9ii+4JopsqUjqncujAmCu1kooYDZv+chgiDYU9TZ/bBqrz6
   uyJdQ7qi4LT4JsABKA/ri6nGr4lKoagEI1zZGzl+cfFivYTTuC68urY0b
   tab2lodf1+4Em1KY+Up8wIkTgODWZ7d22P+FQmdrvpXcVZTDLuvvaLly2
   bDwtZuZUm6xuaRO5Pq2BzIYz1RDzv0MS3NMHFbG2IGRuXO2N4LAmy1rVq
   A==;
X-CSE-ConnectionGUID: FhNaP6oRTImd5M0+bTyhzA==
X-CSE-MsgGUID: WCHQpfXUTb255pHqxqIbdw==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="47025735"
X-IronPort-AV: E=Sophos;i="6.15,235,1739865600"; 
   d="scan'208";a="47025735"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 03:17:09 -0700
X-CSE-ConnectionGUID: evIpSv5iSy6aLGYILnQIYw==
X-CSE-MsgGUID: zVBA9dXxQ8OdI0dUIO7IuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,235,1739865600"; 
   d="scan'208";a="133103945"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 03:17:08 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 24 Apr 2025 03:17:08 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 24 Apr 2025 03:17:08 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 24 Apr 2025 03:17:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x7CkNFbyX7zhpBQJdte94ZF7PJSqEa6lQUZiMJCPbc3DJ+zZFlaXN2SHdPhLki4FhaSTmYWdC+BeacVW964NFToDvWvo0mPYi2V7oZulYLQThKVMq4i+tvw5cVOaTY3rnYQ8gUIzotVekphQ1Lx1DrnKK54hkQJ8C69NxNfU9ByXQ7qdOnMKWcfNjrTwKBUmvS9Sv7zMGntcbjjjYI5jqJ+OdwZzm3XT00F7uYktjPpcpDV/4j8svyc6gHi24htCZ93WiX0in91YWfYY/2shk3lzvNIH4vmLTKDL/2mMV9kjrVA2otceF1REaG6cxcSL16W7qZ2nwLRESoUT+Beckw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/hY6uIjGx7CJfyWFV3RctO2zcO52Y7OZt6WumTeeFmU=;
 b=A7qXEljd21U9TpYCm4WjNQn+qHLKnalvsX8gg5CE8nzHhg8iMdya5iIhsNcUHOV9erJgjT+UKBCofWKnC/WkjSjK/jxTOkzxyIHsg2AQPpi1Uvou9t7rRGMKIV2EChPPJLtkoW6WHZaPNrW42RARI2eFaWNPkntySN8MYVuyycsgJlc5ShZs0vFNKgrzAnhSHMP7Pv2iQsRxUx2oBNptPL6mT0Jp/IGY4relZZJ8+D1ouvmMPRr50kB6mEXEjp2yfw0xI84ZDiZoUYSBSa0GQEHhGcNvH+0yYTNHc7jkyrCbIc7wk4q9reQu5zMEEcLDfd9ZEMZFeOaC7MiWgL7Fog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 PH7PR11MB6008.namprd11.prod.outlook.com (2603:10b6:510:1d0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Thu, 24 Apr
 2025 10:16:35 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cd01:59f6:b0f8:c832]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cd01:59f6:b0f8:c832%6]) with mapi id 15.20.8678.021; Thu, 24 Apr 2025
 10:16:35 +0000
Message-ID: <826504b1-cc8c-42a9-8f38-62118f331a0b@intel.com>
Date: Thu, 24 Apr 2025 12:16:30 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: Intel: avs: Fix NULL pointer dereference
To: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
	<amadeuszx.slawinski@linux.intel.com>
CC: <linux-sound@vger.kernel.org>, Jaroslav Kysela <perex@perex.cz>, "Takashi
 Iwai" <tiwai@suse.com>, Mark Brown <broonie@kernel.org>
References: <20250424094600.1678051-1-amadeuszx.slawinski@linux.intel.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20250424094600.1678051-1-amadeuszx.slawinski@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR08CA0228.eurprd08.prod.outlook.com
 (2603:10a6:802:15::37) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|PH7PR11MB6008:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b31c1a9-9ffe-43f5-8e31-08dd831917ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b21abmxaakwrcHpPOUxLQnVXbmNRRHR0enl4ZTEzbE1tdUJWWW1mSG5yQUs1?=
 =?utf-8?B?Wmtvemo2NEltUTBZQldHdHV4c0UwbWxxRUk5dDJ1d3F1aisrenhkWGMyNmZM?=
 =?utf-8?B?U2Y2Zk1MQVhoZGVRWWxtUm0xY2s3S0lIZXVENVFrQmI1eHh0T1VyU2g1bDR2?=
 =?utf-8?B?YzFXM2dvbzdDdVZFbkRXMWJxNXZhcjlKQlVHV2lZVXFLUnU3UndrWGUvcmFM?=
 =?utf-8?B?ODI1QS9SdERVeDhzS0Z1K1BwOThIS0FKSktESVlpNytWd2lQME9tcWRmWGZu?=
 =?utf-8?B?V0lYSXB3ZkRHUENESzl1VHNJeC9MZnVMazNQekRuQkFFT0V2QTVCU3dIUWJi?=
 =?utf-8?B?U1ZTOThqWUNhY2tpa2s2N24xbzRkWG1CeE5TYWpoWVk1S2hzT0VEV0xaZTlu?=
 =?utf-8?B?NzUrQmdtUllDOTJ1OW02ZjlmdFNYaHN0MlV3a2ZqNHBxeDFpN2lqMm0vSnlW?=
 =?utf-8?B?b3hBZW1oZ2xFengxanYyTU1HNkRxQ05CdExwSjJ2ZW1aei9QcGluYWVCTExU?=
 =?utf-8?B?SEpPQmp1ZW5aN1JoNEM1OEF3dzF2VUhUc1FwNmdYQlp5SzRTTWluRktQcDNI?=
 =?utf-8?B?aUVMWjhsYnE1SThNaG5pcXhxNnl0TmdTWlU4Yml5ZlEzS2xZanlPKy9BVTFs?=
 =?utf-8?B?UWFJZ2s1b2c2OGZKcEJpQUd1WkhhZnlpd0wrSHlyNFp5YkhJdEoyaEIxOC9O?=
 =?utf-8?B?c0xDSEIrNkNGUCtQV0lrbjd3bTNrOCtMY1ZGdXhZODUwc3hrbk1lcjVQSk5M?=
 =?utf-8?B?YjlTNm1HUllxdlBGQmtyMmd0ZnEvMjg0OTJhZ0ZxTEYzbjl2dzk4MlhONlF1?=
 =?utf-8?B?U3dJc0lkRDN2YUlVeWZKS3g5dGFudW5tNmJreXc2eVFOVS8yV05KUTZmRjF2?=
 =?utf-8?B?V0owaTRGcHU2My9hcVJzSmJCb3pEajJscUJJRjRYYStXYmt4QVAzV1ROUlRP?=
 =?utf-8?B?ZnBKbjJmdGZVQ3U3aVR0cXhoYlFkUFVaSG1wRFdSb0dNYnk1QzdmZnptKytz?=
 =?utf-8?B?YUdyWEtzUnVXK2ZDcC8vWnlxbGQyTEg1UGhUZ3NUSzBNRytmUnhtL2h1dTdT?=
 =?utf-8?B?bWVGZWc1MlA1NzhSMVFqVGVGa2dNL2VUNTJvbCtYUmthNVREcWJVcGx2QTFv?=
 =?utf-8?B?Nys3TzBhbFc1eS9ybCtWbnRQS0tRakcySXcwVVJDeVVDcXNqOHljckREYWZM?=
 =?utf-8?B?aFh5V3pvMUZMU3hBVjJqcWVsTHN5UmluSXEwYmR6VmQvWWwwTUVCeGlpNVZn?=
 =?utf-8?B?Wm5ud1N0eFJ5elg3K0dUOFRpT1d4RU9NenZ6RlkzN3EzUmlPYTE4dk5ybVlX?=
 =?utf-8?B?a3luUytMRFAwNFlhenFJelBneTRpbTRTempHaDNGTCttZ1hOSHZrdy9IdXIv?=
 =?utf-8?B?Z2dxSjhkYTJYM0R3OEc2R2kxMDNIOTJBUlJLdThuQTJITTdYck9pRmRVYXhh?=
 =?utf-8?B?cnlyblM4QWx1c2l6dE94emprckxndDZyRTVzemNDaGhaQnN3TytZT0FHWXpD?=
 =?utf-8?B?T2NBRWR5MlBVVzU1b21MLzVQdkgyQXpMb0taTHMzRXZOTDlPS0lmQkJTWjZP?=
 =?utf-8?B?TnY1M0JYOE9qUXRCeW01MjJBVWxRN3pHRW1jVVh2cng2SE9VZHZNZHhGcUJn?=
 =?utf-8?B?YlNRY01LdGwyK20yeHp4cFlML3huUEw0MWc5MEVZMm92MGRzTGdSSmhPL2lP?=
 =?utf-8?B?V2VtOVRSTGtsVHB2TndBbFo0cUNURTdPWlhnVnVHdzdPN3BqVG1heTN4eHNy?=
 =?utf-8?B?N0s3bVUxWFB5czhTMWJ1MWdCbURTTVkrSVQxeHFZeFNKK1R1YnkzYzdzWG8x?=
 =?utf-8?B?TXoxWHArc1VJSWFsMUR5SXhoREovUmZnQlNTQjNmZE1meklvNjgzNUtrM1lC?=
 =?utf-8?B?TFJWREVZUjQvOUV0RTRQWkFESjh5amhQOHdEOG9FNFE1aXpaRmQ0eTFKWE5w?=
 =?utf-8?Q?6enolTu2WLmmITwCRIf0sDhRUudBhCFG?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6375.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S1lJaDVmaUhSTkJXSnB2ZktqMWpZT3FpSW42VjkrRXJpYjExQ3ludG0xbjRn?=
 =?utf-8?B?bitWdDVRZWJtVnR4bTdoR1JxZFA0VVJwZWVERVhxZ2NIblVNK0w5K05sZUZV?=
 =?utf-8?B?NlN4ZjBOemo5N2FaWDEydHFCbXRPd3VVWEdUVkFSOVo2KzMyM01saDBYd1JJ?=
 =?utf-8?B?MzdPMWswWnB6Q09KeTFrRFRiUEhOdUdUUlBUUVdOQmw1MUo5aWpwS04yN09B?=
 =?utf-8?B?bnZ0NlN0VjgreFYwQ0s4Yk50OVBrMzZKa2o4R0JwZDh1VEdkdzQvR09EcUZm?=
 =?utf-8?B?MjBuRUM5THBSSU5Na2VFRUc1M1FSNUxQeWE2bUJmSDQ0b0NzSnZTRmFuZVpo?=
 =?utf-8?B?djkyZGdCWEJOZDN2dHdQZHpGMzAvZy9RdUJjdWlYU3hod0diemxYWVZxc2RF?=
 =?utf-8?B?a3pwMUREVnlnVWoxWkRUQmNNTEVHVi83UUZBSWN1dTR6NitJczdmRm9yaUhQ?=
 =?utf-8?B?RkZNQ0daTWN0WHpmL0t3WEEzYWtpZVhmdVVYc3cyNktqUXlVcUtZdTE4dnZq?=
 =?utf-8?B?bVEwYlpqQS9wV2h1NS9BdHBjZXhhQU9yYjZteEFvYXlaMmZ0dDNzODY4ZXJn?=
 =?utf-8?B?UnRzZDF2RnJkQWFvZ2hrL2YwNGNsQk9aTW5mdDNwbFpZSXdERzJKSFJPVlZR?=
 =?utf-8?B?L2JCUnp4MCtVNEpZVWdEZGxlQkk4dTV0NE1UN3BjOU4xclBTd0g1OEQySkVP?=
 =?utf-8?B?bm53NmtJNUJJVHlVa05KZmJsTmg1UEhGdW1wZkJ1L2hXU3lWR1A3UDdmZU1Z?=
 =?utf-8?B?Y3FKdm5jTkNKMGwvaHoraXJlZ1hRTmxrQ1BNZHc5QUkxSytsTWt2R0oxeE9i?=
 =?utf-8?B?QnBpTkFKdDAwNlpyTUhBWkpuNG41M1RHL3FxdFoxQnpvZ2sxRTFCcXN5WGhM?=
 =?utf-8?B?UTlwTnRVam84bmo1bGIzL0NvMkNuUW5GUDR3THhJc2M1SGpDRlcyZk5sUHJa?=
 =?utf-8?B?d0dDa3czaDQyQkJqRHJyWFhNNThodHNPV3p4NjBLTHErRjlqY2VNMHJ4MGkv?=
 =?utf-8?B?L3hrTVhrd1BPZWpiWTIxMHMraVRHNm1wL2hJblRlTWJieTNrNzRNSTFrajUr?=
 =?utf-8?B?T1NkdVBUbVN4dGJsTFNpeGNsWjVSWmkxUXQ3Z0N0SVQ1OHgrYmdUL1AySmZM?=
 =?utf-8?B?cGUyd2tTTXNjZmRKRGVFSEhZeXlXUUJRYXp3ZjUvWXJVak9aZTlNM3Uwa0M1?=
 =?utf-8?B?amZFQmtXUCsrSm94L0dranl5TWZVaXhCTHEvQmtQUWZweitOblA5UjJDVCty?=
 =?utf-8?B?VEZ1UXpPbGphSStDazNyUjdtWW8zb2l2dWlhU29kYUZyaEo2OTlPK1NWS29z?=
 =?utf-8?B?UXJyZ3pYazNhclNTdmxKQzNFMzBHZi9FYkxPaU5VZldsemt2S0RoSStSQzZU?=
 =?utf-8?B?aTdob2hhTE1hbCt5dEhJVm16MWJCQ0hkQnZnVTlVeFRrTy9aRWhTeGkraDRD?=
 =?utf-8?B?VHRUYnJ1blZQSGhDVEFKODhTemFZQXl1QnVhanQ4WDk0U1hTT0VGUEhoVm5N?=
 =?utf-8?B?Ym1DRk1QV1ZtMjBsSUQ5bTBoS1V3SWdCblNlRlJwb085YytYWWNsWHpKWXR0?=
 =?utf-8?B?M1ZxeHZlTGZmdGZKR21DRDdtRXl1bUJqck1FY1hRR0dyZG5KSWs0Q1hTU1kz?=
 =?utf-8?B?RUhWZUNLZUxOSWJ5bGhYM3lPeVFGZ3JodkFUcG53ejNQclpwL2lSdnJWWHk5?=
 =?utf-8?B?Tks1a2pDL3hpemNoeklKZVZuSHI3VEovYnZuaWNObHorOS84MlBUVW1yOVVu?=
 =?utf-8?B?V1JRZ01yZmxXd3lHNit2ZHBuNElaUElmUHlyMDNvdVBxR25NVUFKc0JSOTFq?=
 =?utf-8?B?U2puTHFrWHE5QVhZL2FNZzNsNW1OaTFHV29WVHcweU40aTBuREorbUJCUXho?=
 =?utf-8?B?WGVNVGJUbEZSOVlZUGYxcEZ5d2VYeXI1YjkxeDBQbVc5SXV6UkxuQUV6T3Iz?=
 =?utf-8?B?cXNlcTJHaW9aL0IvQktHTjJ6RmFvOUZtMUZyVmZmQzZlMTZzaXJJSjAzSDlY?=
 =?utf-8?B?SmhKNGtjaGJ5OGQ3M3ZrdkVOSys0VlVidk43cDVKR1Y2alE3RWxhS0t1V1E1?=
 =?utf-8?B?Mm1HVlFHcE1BOEROK1FTdU85ZWZYdnIzMkNqTXBWN3Ewb0wwNzBnWXg4ODJU?=
 =?utf-8?B?UmlZaWE1c2RDaFV0NDgySW5KMWp2dVJBNlFzUzVHYUNlR2VvdWdzMmNDVDJD?=
 =?utf-8?B?UVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b31c1a9-9ffe-43f5-8e31-08dd831917ac
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 10:16:35.3806
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DTAj3HYFeUc0JYrfZsjiCn4VnCsJiJzXI93E1guE4QTUD+ErlP0GMfVrNZVyo/9swdYx8+Y7v559GOgLCQxnwp9WkoVD5Mdi5pP+bJimKU4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6008
X-OriginatorOrg: intel.com

On 2025-04-24 11:46 AM, Amadeusz Sławiński wrote:
> Due to unfortunate interaction between two recent patchsets, avs driver
> ends up dereferencing NULL pointer when registering i2s boards.
> 
> Commit [1] does a call to avs_mach_ssp_tdm() which requires mach->pdata,
> however due to another change in [2], mach->pdata is initialized after
> the call. Reshuffle code to initialise mach->pdata before calling
> avs_mach_ssp_tdm().
> 
> [1]
> Link: https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/commit/sound/soc/intel/avs?id=79138dbff53ab0e9891ebdfce8d7b298c3783cd1
> [2]
> Link: https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/commit/sound/soc/intel/avs?id=7d859189de13f06fdc511761c745f3b302bed7b6
> Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
> ---
>   sound/soc/intel/avs/board_selection.c | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/sound/soc/intel/avs/board_selection.c b/sound/soc/intel/avs/board_selection.c
> index 6f6137c3a02c8..636315060eb47 100644
> --- a/sound/soc/intel/avs/board_selection.c
> +++ b/sound/soc/intel/avs/board_selection.c
> @@ -472,14 +472,6 @@ static int avs_register_i2s_board(struct avs_dev *adev, struct snd_soc_acpi_mach
>   		return -ENODEV;
>   	}
>   
> -	uid = mach->mach_params.i2s_link_mask;
> -	if (avs_mach_singular_ssp(mach))
> -		uid = (uid << AVS_CHANNELS_MAX) + avs_mach_ssp_tdm(mach, avs_mach_ssp_port(mach));
> -
> -	name = devm_kasprintf(adev->dev, GFP_KERNEL, "%s.%d-platform", mach->drv_name, uid);
> -	if (!name)
> -		return -ENOMEM;
> -
>   	pdata = mach->pdata;
>   	if (!pdata)
>   		pdata = devm_kzalloc(adev->dev, sizeof(*pdata), GFP_KERNEL);
> @@ -488,6 +480,14 @@ static int avs_register_i2s_board(struct avs_dev *adev, struct snd_soc_acpi_mach
>   	pdata->obsolete_card_names = obsolete_card_names;
>   	mach->pdata = pdata;
>   
> +	uid = mach->mach_params.i2s_link_mask;
> +	if (avs_mach_singular_ssp(mach))
> +		uid = (uid << AVS_CHANNELS_MAX) + avs_mach_ssp_tdm(mach, avs_mach_ssp_port(mach));
> +
> +	name = devm_kasprintf(adev->dev, GFP_KERNEL, "%s.%d-platform", mach->drv_name, uid);
> +	if (!name)
> +		return -ENOMEM;
> +
>   	ret = avs_i2s_platform_register(adev, name, mach->mach_params.i2s_link_mask, pdata->tdms);
>   	if (ret < 0)
>   		return ret;

LGTM

Acked-by: Cezary Rojewski <cezary.rojewski@intel.com>
