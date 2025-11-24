Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66D19318136
	for <linux-sound@vger.kernel.org>; Mon, 24 Nov 2025 18:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764007591; cv=fail; b=fm1Pze5gQj8Xq0Bz+AYhnngtw6PswXUfS6p7owXVEcs5N56/iW6oGxWI2tx3BQQaxwzrKkNrBiqNcAOtVfC0DoXKVtcFiYrgECQypG0bsr43wCpdzrc1FCCjgEaap3UUpLrXQHeDCg9MvuImZYtGm38ittGSWXRF4ycCWo9Wng0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764007591; c=relaxed/simple;
	bh=jrDFN/k7V8fNkwdMIuWwLlRetEO37gURwjLcb49IgTQ=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=bIgEqgi/1DxhunxqnKRzwP/Uf/T8dcdtLuKjRIJ+dALui651M7EB8DmEpwB0nSD02TGjImiuT/t9CmjkQAcH04DJUloTsGIafompAgm0jIHIknQZ9waT65ud6736KShWKJRFlP0V+jvEhNRNA0nDnO/d8qQ2xverjSokmPkRTeU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QqHPm7ZR; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QqHPm7ZR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764007589; x=1795543589;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=jrDFN/k7V8fNkwdMIuWwLlRetEO37gURwjLcb49IgTQ=;
  b=QqHPm7ZRdB0zmnuJRu23LUAL3oKnnRXQZYBhUqqNdZ7MQYGbgxn5ApfI
   mWGsghpTAGKFCJFDgF85uNcGOiMuaQ6qJjreCpfy7PQ6C7s5rIYXt2Sho
   hi0blstMc3b0lhvh+p+sgxpnsj84jOMC+GY0AtBUlTQc3nOPx3aCVqX9H
   fkUg5iQUL7cspSzgAu0yljoTu9ycL4PE8Fxd9DegIKbzGRI4mJPhqWCcO
   mo7WTJMG6uAl0lsH/P0a79vdWmJo8q1s45I1PENixhmhlXLQ47QHEPjEZ
   gQqlkLFItW54fPXua/bntPdKF8iixeK73zikTeHWWezPzLr5X6WFvlhaj
   w==;
X-CSE-ConnectionGUID: PiTJ+wMtQ727pGgyU94UiA==
X-CSE-MsgGUID: wk9MipVcSWqGYBmEerNTHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="66174837"
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; 
   d="scan'208";a="66174837"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 10:06:28 -0800
X-CSE-ConnectionGUID: YoFMA1ecSSGIO6SWX2Fpow==
X-CSE-MsgGUID: JwzpSSykQviKU/TfWLICpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; 
   d="scan'208";a="191541254"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 10:06:28 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 24 Nov 2025 10:06:27 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 24 Nov 2025 10:06:27 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.25) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 24 Nov 2025 10:06:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vM3wUe6MFYhcvjkdeWsA+vypQB+wqNKHPUezUlh7In/I2Y/gnEWxHAWqRlHc3AbVjCjaBAf5cdll7PQNzRou+PgmuCJUEGHLsSPYnZh+R0+pzs/KXjBvq3ewdha7b0szdG2pquvGlbBWUo0wbBJ2IrUQh8gZof8gNWL+hi5uo0B0xuRHS6wcjdr5Ov+Kbs0gR45tnuN9Y0zkWPOKtG7q5J+CkbvT47a7VWQShCLZGpYtFoy56G2pil4EFmfvmT/zUhLpbtV8ulmme7YDRieZx1nL2hhLDRirNyEh85VtOXnpPSdR9h696qFm0dtM51MLxzPk7szboMy8fAHBR44H7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xL6s2A9CgJDwnoNXNfpVxnC8yc0mQCyUxg03emli2pM=;
 b=EhmJZ+f9c3qd0W3/x/Q39cYoEbz3hgyifw0KbkZTxKE0GhP7EBB3rVHfOtFPxDDf+Hz82pHftq3tF3o9nWtrtuba0Xhczd0MRyVx8gJEKecfbha8JRTmZ83QXU6nOIWbUe8sWZoyU+o/yDcJ/TUXK8mzwcjxHL7gcvf/4nZkrzG6a2SDyHT5ZNMg6f+h8ALkIv3dOuj2tlwb4m6CnwymKYifz1bEhmPBC8eNC1/HtC2PJlG4XlUdrFiok7N1B4I5BXEBOeL3jCILRMBM5wiT2HlzChYyHTtXCQaWVZpL1gQ8oXKOIPphF52XWxfsjIOVxi7oBVHs/hsEfjfeM9TjNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8283.namprd11.prod.outlook.com (2603:10b6:806:26c::16)
 by MW4PR11MB5890.namprd11.prod.outlook.com (2603:10b6:303:188::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Mon, 24 Nov
 2025 18:06:26 +0000
Received: from SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::3:e0a:87af:d4b6]) by SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::3:e0a:87af:d4b6%6]) with mapi id 15.20.9343.011; Mon, 24 Nov 2025
 18:06:26 +0000
Message-ID: <24c282ab-a65e-4057-b596-5b44fdb4393a@intel.com>
Date: Mon, 24 Nov 2025 19:06:17 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] ASoC: Intel: catpt: Drop catpt_runtime_resume()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: <broonie@kernel.org>, <tiwai@suse.com>, <perex@perex.cz>,
	<amade@asmblr.net>, <linux-sound@vger.kernel.org>
References: <20251121114331.3841335-1-cezary.rojewski@intel.com>
 <20251121114331.3841335-7-cezary.rojewski@intel.com>
 <aSRtxKLlbc1FomOL@smile.fi.intel.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <aSRtxKLlbc1FomOL@smile.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1P291CA0004.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::15) To SN7PR11MB8283.namprd11.prod.outlook.com
 (2603:10b6:806:26c::16)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8283:EE_|MW4PR11MB5890:EE_
X-MS-Office365-Filtering-Correlation-Id: d3f84e46-99cf-4da3-defe-08de2b842db3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MExISXdySGMxU0dTenNZemJrcVkzek5veGo4aEJFR0JRSXhjQXpNR0hhK3Vh?=
 =?utf-8?B?Rk5BeTkvcHRIem9uNTltd1B6cUpqamp1UWY5SVJVVkRwWW1PQ0Z5RXdnL3Er?=
 =?utf-8?B?aUIydlFBWGY3MitsemRTcjdMbkNGNXRMZExpV1RrZUZkRGVFVzRwaUpSdXA0?=
 =?utf-8?B?M0VSWWpCQjVHNk45TmNmYXdRUlFKcDBsOVFTVSs5T2c3QUdOeHFPOERuNG5Z?=
 =?utf-8?B?T2M4VXcvbFZ5WWt1UzhTR2doTWt4dU5MTzVDNWsxRmJaK2RFNU56bWxuR1FP?=
 =?utf-8?B?WHllR09CNy9FNnFpdGxTNGhwNTV5b2loZjMwNXJHYnBDZi9PZmpQWDRUVERs?=
 =?utf-8?B?Mmd0Nks5NnpsbFo2QXY1bzNtbGkrTGZ2bGFpSzJXSXpDaVdzR05pbUdPOGVx?=
 =?utf-8?B?TElTUHNYZGp2RW1wOGlveCtTRkV2a0loaWdVaXNOQTFINHpWc3JIRlNLc1JF?=
 =?utf-8?B?ODRuUjRXcDk2TFZQS1czSzFEeXY5SnRhRmFoa3lnSHpObk9VeC9xM2hvRXcz?=
 =?utf-8?B?dXhTTUUrWmlRVlV2MDA2NEZ1WmN2a2R3QU54cE00Ykx1UmNQZ2hTUjFDT0lx?=
 =?utf-8?B?N2dUR2hPK1VwZmY3b0hOMW5wb2hPbzZwQzIzOWR2c3pkSlAycXpJZGl0ZDIy?=
 =?utf-8?B?cVo3bVZuN2hackt0ZmZZVUFMc29Uc1NQUFdSUkxhTTFpNm1YMklsdG9kbFph?=
 =?utf-8?B?NGN2R005QURBMU5LQVFOVmxDVWRWOWhVU1FZMks3V1RUQU4zMk1UdzNDTGda?=
 =?utf-8?B?K250Nk1XNHRrZmMvMVgrTWFwSUxxa0gxblp4ZldTSEJsVjIyZnlvYlhxc2cx?=
 =?utf-8?B?ditrTmx2eGRub1Z2bUhpNkpsakhjSWplYXV5dTdJajc1eHFjczhGRmwweS9Z?=
 =?utf-8?B?T0lYTzVXcWF2aGNpdzdLUW1FdFJ3all5OFQ1YjdKNURtTVI1RVc3OWhUY05M?=
 =?utf-8?B?Yi9mcGRvQ1F2aHp5ZGkrTWtjakcrdk9DZkYxRUJYdkR2ektOWlhkNStRdWVt?=
 =?utf-8?B?WGIvZHJhWmNacisvY1krcFd1QXB2bjV3NEUzVUQ0Umx2ZWptZVU2ZkZVbnpl?=
 =?utf-8?B?azZkNm1FKzdDSXZRUkVMclBXWnVTV1N3NEV5VlR3K3lBbWlxYzJNU0JVbitr?=
 =?utf-8?B?SjJJVTBzL29YWW02dWk3OENDWnh2cm1WK3NZNHRsck5TeWh2RGFNbzFpaTdo?=
 =?utf-8?B?ckl4ekFiRDYzRm9LcER5NnNoRDhIWENhK1BMODlxRzNVTHFTVnZ2RTNacEtD?=
 =?utf-8?B?SVMrNjdOa0UrNUR5MlREMENhendXNnh3SFZKc3Y3aGdYQjlyWmg1cFhPU1pk?=
 =?utf-8?B?MjYweG9GYmU0L2FtTithU3M4SzRzWWkwbnpWSkp2QXhoM1Q2OG54RTg1RVNQ?=
 =?utf-8?B?aEo1QTQxUU1YVWhxMUJEV0NUeUVQWkFzYS9wdlNQdTBRWEt5aXVRYkYwdUVH?=
 =?utf-8?B?Tk14VlZQQTNieUcwMUFyN1p0ekszbmFOYldreWIyRUVzNjJtQ0MyOFY5KzY3?=
 =?utf-8?B?VnZRTEMzQUJDczJXcktNSmRPUUlGOGFWbGcxa2dMU2lKUnpDZmFhWnV3NXVP?=
 =?utf-8?B?WGJQam5xS0lFTkY0d05aRVI1N3FBQm1HQ0NuVkZhYzFubUNzNmszZ3VMbE5K?=
 =?utf-8?B?Z1F1Ni9ZbzRneGtyOEhkUHhDMTE5RURGRzg5eFg0bU5TcVZSLzFOVDFRUzJH?=
 =?utf-8?B?U0JoWkMzbnZXMnVoeGJ5YzhtMFFjU2V1LzJwTUxXOTJkN0ZtS3NYSHZjdjlw?=
 =?utf-8?B?cGhuSllaV2RydXJBS0pSN09weTY2MEVUcFdJSHB3RHJ3LzhDSkxPQndvVEsr?=
 =?utf-8?B?ZkxIMkZFOXp4MXlCWnpnaklRVFFteEh5VDJXUFJMT3JHMG9tQmVFVEpuTlc2?=
 =?utf-8?B?cWV3Rld1RjQ3SU9Qd2hLc0RjNzFCTkxmaDR4QzJaak53Q3NWVWNSTEhCR3Ar?=
 =?utf-8?Q?bYO5v5YyB2bIrtF6Oe6qo0UdNbHuirU/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB8283.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WjRsaTZLNmlzYUtnMlBlZHF6QUJMbUdQS21IUm1VWHBxYk5hL3drZXNaNkJY?=
 =?utf-8?B?TXloTXNFWnJ3M3VwcTZEYzNVd00raHZmNm9sVS84Tmx3MTdzbVhKbjBXSkM4?=
 =?utf-8?B?Y2s1V2M4cWwwUC9qMTdlYkNqVVFyWjlRNkl4VXJDNWZEVmxlOUU1RG5DNzVW?=
 =?utf-8?B?b1ZkQXJYUFQwOVdZZ3hmTGpoQ05pbDZZZ1dzMlRZUVIzVFJ5V0lOUWZ2aytk?=
 =?utf-8?B?S1N4ZjVWU3VHZ2oxVE02YitlVXE0cnNleVBWQ3ZBSk04c1Q5SFRaRkdqbkph?=
 =?utf-8?B?RFdNWDNjYXZEelpvekZQM21pZEwxL1lDUy9XRS9QeG9WN1dnMFowblRKZVJS?=
 =?utf-8?B?VUxKdGtHbG96SWZIN3RrR2Zza0xnWHgyT1NYOUVEUUtVMmdncmJ1eG5EWW1W?=
 =?utf-8?B?WGE1MDdBcnFFeFN3TXdyZ3hFY0FGTlo2Q3VYaG1vRUsvcm5DMHpibGtxaDI0?=
 =?utf-8?B?ZXBPdzAxNnUvai9ST2ZXNXU3YjNMRnNTdDAva1FJaG0zbVZYL0dRaDVQbU44?=
 =?utf-8?B?bUp1cXYwRUIrSHJTNFR1RmJCL2h2bmFDK3QyVVVMS1QxcWtScnUzbUpYcWVD?=
 =?utf-8?B?VEp6YzNHbk1FN2o1Z0ZGcjV2dUZMZmNXbk9PQ00xZjU1cjB4K1l5TWJ3Vmlh?=
 =?utf-8?B?cXVDR0gzL3NKVjFXYjhZbC93TzBaQURPcEVQenJqUWo4dkpvMmhydTBER0Fm?=
 =?utf-8?B?TjdUdHJuOWo3d20zN2N2ZkZkNmdtVjMzdmUyV1FUNTAxTldCdnY4ZFNsQWtR?=
 =?utf-8?B?OVUyUzlHSUJhYU5pZDlIU09NRC9ydk14bGZNbDExNUd1Yk1JMi9sMHRNbFJw?=
 =?utf-8?B?NTRLUnFLRUdvcW5DV25BQnJWZnUweEtidGtmR0hsRFVUN2RWbDhHVDAzM2Nk?=
 =?utf-8?B?Y0tEd01pTzF3a2d1YUlmRjlTMlJUNWJpMmhyVzZ6REtoYTFvRWMxK1puR0k3?=
 =?utf-8?B?Z0FaSG1NM3IyV3RTTkpzTHVmZHFkQW5DRThWa1RBazFRcmlCRi9KUUoxVW43?=
 =?utf-8?B?VjIyS1hzM0wzS0pCKyt0cm4rS0FmMHpmcW9FUVQ5aTBKQk9xVXArLzVKanlj?=
 =?utf-8?B?T3NlQXRpWmwzVzh6TUJHblQ0djVFdWhJR2owbytIdUMrNGpGUTkwdzhJYWZx?=
 =?utf-8?B?bGRBMG8xNld1Y1hhd1VEYnpheG1sOXR1REF2WEZGRnhncVZRK3JLZ0NzU2pE?=
 =?utf-8?B?ellVZWd5alp0Z2JFdHpBSlJJbFU2UWUwNWwvTnhNbGFZdjY0by9NcnlieFdG?=
 =?utf-8?B?ZEJ0Wm45RmZqQkh5ZmNYT1N0Yi84Y09mQlUzVzhjUk9JS0UwanVldWQzcG5h?=
 =?utf-8?B?M3kzdjNDaDlBekkyQkxzUUNkaTNaVllZMWRyMHFRa3RaWk5vSnZHUGorSkNm?=
 =?utf-8?B?YmhnMmdaNWlpdURmUDNNbkhET2ZTN2F1aUFrQy9WcGdsMklGRHpzRnVCQjZx?=
 =?utf-8?B?WkNpUzh2YkEraWc4d1d2YWVDZTIrelpIaFlPcGt5NkVvc1pHWG1SNHVWRllh?=
 =?utf-8?B?NlV6UDdLenVPWFdsUXl2aTBVSDlrNHVoOGQ4K2NwVlptdHRUQ0RDUTQvazFt?=
 =?utf-8?B?cUlWUWJWRE9lc01la05FOVVsdEhUY2MzQjFuYUdNdjFMcm41eVRIbTFRelNq?=
 =?utf-8?B?aXVYcVBDK20xUFJpVFVEemVLOVJPdjJnSGV3WUhwMi9pRi85b0FXeEQvL0lX?=
 =?utf-8?B?dlVTaTRyMU1tUGZqUlZacnpCNU5DQkh1Sk1iWkJ4VUo4MDlwWE1JS1ZJcDFy?=
 =?utf-8?B?VU9VeGZFWERuMUtJVGlvRm5NWWg3TEc4L2NEWWVnV3hFeGZ0bHFGUmhmUGtT?=
 =?utf-8?B?aHp0VDkzZklucnpaQ3BLbjQwY215b2xCa0l5OGhRL0hOQ2JpaE10cmloVlRq?=
 =?utf-8?B?RmxWUkg4UkJubHhIaU56R1NOaU9uRlArVHc1Z0g3NEZkM25HSFhTdzlGQ29k?=
 =?utf-8?B?YkdzdVo5dWM3K2M2SlBOdEZOS0hSUG9jL3JZRmV6NmdqSitnTU8vV0R6Vlhp?=
 =?utf-8?B?T29Bcnl6UzRjdVVQRFZaVVlDaHhrdXpTZ3JncnJwV042azRDVEtKRFNRVUo2?=
 =?utf-8?B?T2tRWXFsMFplU2Rmd3FiVjlIMHI1cjFZMWJIdDhZTUtXZ3FDeVBQQzJYVEZ6?=
 =?utf-8?B?MnpiRTk4MFRKTzQxbHRxK25DUWVyVjYvNk5KdVhZZXBaVHpZMkhYTzJxVURx?=
 =?utf-8?B?ckE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d3f84e46-99cf-4da3-defe-08de2b842db3
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8283.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2025 18:06:25.8530
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PTXNkaKQkOfQSuAPus2E5gneiOPq1zca1BTWFHD+5RE+GGZGW+NEG7osO2S7HoKb0xopx7UdEih1URac6zsLnrceRGcPG5YrrQsSzOn1Wyk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5890
X-OriginatorOrg: intel.com

On 2025-11-24 3:37 PM, Andy Shevchenko wrote:
> On Fri, Nov 21, 2025 at 12:43:31PM +0100, Cezary Rojewski wrote:
>> The function provides no value over catpt_resume(), use the latter
>> directly.
> 
> This makes code understanding a bit harder in my opinion. I would not apply
> this patch.
> 

Ack, will remove in v2.
