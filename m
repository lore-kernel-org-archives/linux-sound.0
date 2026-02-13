Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA90C28D8D0
	for <linux-sound@vger.kernel.org>; Fri, 13 Feb 2026 20:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771015729; cv=fail; b=ruJxecSidrDEzTOZ4t0HBJhIST6Y0kTjiPN2d35tgdFGNSj0nQYRCFVdje6/PNXb/YltEXFUJruEdUow+UjUZYNQLKaui9/lA9n2bX60uyCa9Llp/QyfHpsqQwKKGXRSvgfx35C3zq3szt2DEC1XiGS4fMfkx7Tfo8/KDpvFAEE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771015729; c=relaxed/simple;
	bh=EqGKar6ebpMbzoynZ5OEf0gXMNyYXjiJ3CaWjsw7d2U=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Eb/UQ0PIG7p2vZoVJZtHbrK/1Y6HPFfnAhR+nD+K5s+L6+0yrGZRiavF49RI5cRQsL3m0hdvLbElrJOyE+5+Li0sNevqkzWAP7sFXg8ZelSNQHML9d0HaSUbpbtyIkFffpe9hDx64HoaeOi2ozCq6bdcvKi7LmZpiZyWvU+Ok9k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jRDzIxns; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jRDzIxns"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771015727; x=1802551727;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=EqGKar6ebpMbzoynZ5OEf0gXMNyYXjiJ3CaWjsw7d2U=;
  b=jRDzIxnsPRwx8iF1q1QODaDSyP3EGgUTKM9QsMZpbjPh2LUxiv2JIKl3
   YPvsjVzTAYTw2TuANIDxVTBqraMaPYM2O9vy+V/7UW6jcDLaOsH6ACgt6
   7NZaux1TiZAAskHZAxbFtktmw2SmtUY68SEfpeLMQQLesXg6BvNz9xqjz
   r2bK+L12S8UMKXR2d9CEoDQSGuGSYME6CqpQDJZuotsoRgPqtLMyzPLU4
   aYvpr7VzcmJ4z4uEkRZJqBtgGjh1yl9qUI/wJwWLDRbGfLbt3PVOxB6r5
   SxvqqMdh2v9JvdoBjkrT4ecinb6jB1gnbkFrmb2ySTMBBk2+W3/G6wLYN
   A==;
X-CSE-ConnectionGUID: dXWmcThXR2uhWwjvNK9vVg==
X-CSE-MsgGUID: iNx+Ygv4StG+1hLjr1q2BQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="76055075"
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; 
   d="scan'208";a="76055075"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2026 12:48:46 -0800
X-CSE-ConnectionGUID: INNqzNfcRsGrfLSWwsCj1g==
X-CSE-MsgGUID: NLDZ7tZVTby6KajHr9eU/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; 
   d="scan'208";a="217563628"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2026 12:48:46 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 13 Feb 2026 12:48:45 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 13 Feb 2026 12:48:45 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.62) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 13 Feb 2026 12:48:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hLZBC2OsYRgY7wUlMYf5MNiKTgB2C4d5xqQp2LcK988b7SoNPa4wwlQr1HbtwSCSzk90xdgcEm1hhn5jOfD4tKOcRssBeoWHgYAdfBUBakmzwvX5DZfl9N66nIlGuDfv7LVSh/utyGheC7D1zxPvxNPfLqv63Y3/9pIVTA2xTIQxeYxrxHtk83dOwE4xpJ+SOcLmHGqNAPLR4Gbkr4vkQE7mRpT3qLrZRPghqotxdp0rlHqD72Pkd3e4aL3gc2YQFGu8tBRXE2H7ZxstjIgcyyhS+Vs8l0tJsz0rtWiviygxiAuhAEVxoWgWVVHkagtyLa6rDEsSZFvKoKwo2beoLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lnteXQmCmFq9qwgSB7dWnRxzOJveNISN/enAO9FF5io=;
 b=rBbIpLb2jvYYc5ucIu1OT+At6GVcW84cNlQLjpLpzI7dbWnvavzTsGT+Yk3Ix9J+WR4IH5+Mb8iEZDvcWKCU9ToynifZ4iLVpdn+lf19i5GN5IGfcM+flNYM9wvVc3Ud1+iWtw2IxglmXCT35/wIlePBkITPf5/JgvFq4d0JeeHnXcwqm1Ma88VSuMq+T/lZ0wR5js40xmquUCS9Vb3PupXAYlbnS1fvamG7pzPcLhccoV3T+hOsOtyUijEKQ0lYV8LdJhhj8SX5Mg3Lz6BB9Eb/aesdX+6GjX5jNom3UYmkV0BJVgvcznwjz7PQF+UKsUD8y/4ODTw09bPRfkq7UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8283.namprd11.prod.outlook.com (2603:10b6:806:26c::16)
 by DS0PR11MB6495.namprd11.prod.outlook.com (2603:10b6:8:c1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.14; Fri, 13 Feb
 2026 20:48:37 +0000
Received: from SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::d18f:6b38:584a:214]) by SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::d18f:6b38:584a:214%4]) with mapi id 15.20.9611.008; Fri, 13 Feb 2026
 20:48:37 +0000
Message-ID: <fde361f5-55ee-43e0-a5a9-1e458a2b9bcd@intel.com>
Date: Fri, 13 Feb 2026 21:48:32 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PAATCH v4] ALSA: control: Verify put() result when in debug mode
To: <tiwai@suse.com>
CC: <broonie@kernel.org>, <perex@perex.cz>, <amade@asmblr.net>,
	<linux-sound@vger.kernel.org>, <kuninori.morimoto.gx@renesas.com>
References: <20260210152737.347279-1-cezary.rojewski@intel.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20260210152737.347279-1-cezary.rojewski@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA0P291CA0021.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::25) To SN7PR11MB8283.namprd11.prod.outlook.com
 (2603:10b6:806:26c::16)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8283:EE_|DS0PR11MB6495:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a04505b-1e7d-4232-4774-08de6b4142c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NVhMOEdEemNYYnRRTERPdjVxa3B2aTlSRStyZUNWUk5ReWtQVENOczgySjVO?=
 =?utf-8?B?OWhhUkxMQzJteHUxUURQZnIvR1lnczVtTHIvWUlCa3VjSlFVUUFEa3dvWXhP?=
 =?utf-8?B?N3FCdFIvVFlhb2ZXQkY4QkZHbUlYUVhTb2w2Tjljcy81bWo3TzAwc3RXbEda?=
 =?utf-8?B?UlhQcnpuQkl4eUl4MFFRckNldkxlVW0vZ2lTRlA1U24vUHl4cWNyeWhlVUNF?=
 =?utf-8?B?SGZ6U1d5bDd0SnNnSjBoOUt4bkRyL3paUkJHZ3QzWDY1TkIrQWY5ZFpHTURl?=
 =?utf-8?B?N2JwaW92aGJBdE1sK0hiTHRYNzJaMHNvdm1jNklNcWhiOEZNaVZobWZ2Z0lk?=
 =?utf-8?B?SjR2VVhVcWpESW9iR1lwcnNVNXQ1SmpvblBjWU5XUUFab3pWM25GcUtnZDd5?=
 =?utf-8?B?OGN3U2swbVBUM2lVNzlrTk1mNkpWN0l4ZnEwcVNMTHc1T3NUalRNK0pGRFB1?=
 =?utf-8?B?dUNrcDRaYVp0NDNkSXBCQytvaWQ2TUhpTjhNcTFXMmRhTzhUZmxLeVFyTGVO?=
 =?utf-8?B?WXJFSExpelZvVlE1MmZ4c2h1MDRuZWxDWXE1NytUNEU4ODhtT1YwMno3QWF5?=
 =?utf-8?B?bllYQWFHUldlVm8wMUF0YW4yeldna1dqR2FvLzlCUk9NRHNoV29jUHdzSFNT?=
 =?utf-8?B?bUpmZmZuTFRBV0VzQnN4RVdYTVUxQ0w2WVNHaWpQVG1reFBka1l4bk9NYmF6?=
 =?utf-8?B?bTVHNENvSnZnQk16a2dZVjhWYXNGd2tDbTdzdXJLUk5MTVFoblhkaDNINTEx?=
 =?utf-8?B?ZWszUngzQXAvSC9JV29NZVRSUUNQMW5sWU9PeStBR1pIUGppc0R4SndJSGZU?=
 =?utf-8?B?QXZvV0xudGFxWWM4cE53cmk0QmFVVk9ReVJyU09yNlNZRHc2cTg4bVFzbitr?=
 =?utf-8?B?K2d3MHcyVXJDblZ6alhzald4UmxDOElHa2dwR0RCLzNVR0E3ellMOTE4UTdJ?=
 =?utf-8?B?bkhuQkE3SXpuSGN1ZXdSZGV3RU1PaHVoSkhQSGNxL2tYelNUZGpObktqVlds?=
 =?utf-8?B?QzljZUpydVpSN016OU13VzlyWTB4U0MvY0IwaDdYTVRQVXFwSmlrSDI5ZmhM?=
 =?utf-8?B?azI4RkRFd0dlM1JoYyt2dTJuOGNEVHZjUlJlRVpuc2FjbWw4MmgrTUxyR1JS?=
 =?utf-8?B?R3IzWVB4bDR5Mk1uaEtVOXFkb0pYbmJwQXhyNzIveTU1aFlia0xmblV1QUlv?=
 =?utf-8?B?UmQwNERiZFhOMGtjQVc1c1lOSkxBMDMySFlaeTBtMjdjalczdVdndjdDU2NP?=
 =?utf-8?B?ank5SjZ1OWRCYnVFZGVOWGpXVUpwVWtFRWZhZlV4ZUJrdXI5bWZBQ3l5S0dL?=
 =?utf-8?B?TExQZTNZeDdjUnlFaStxTmR4Wm5wWGJHanR4VFk0Q1NsSENyN21oMDBSVGEx?=
 =?utf-8?B?TXFWTWhUNitYSlIvb3hYZmYzTVgrbFlBNnFaNURNQ21xRFBZdHNBZkRvdmJt?=
 =?utf-8?B?a2R2WlpNZVE3WnZmNUZVekhmMndMNUw5NGJXdi81V0ljQnRvbWRkM3Vid1dK?=
 =?utf-8?B?S3NnWkdYTWc0c2p1RkZhazNsRGhUb09wcnR4bHJIcEVPdFB1RE1vRFN2VEs5?=
 =?utf-8?B?Nld1bWhtbTNzT3JBeVpub1JmV1plNTJjWXZjVTJVSmRhci9VYWQ0aGgreHhs?=
 =?utf-8?B?R2hwcGt3eENaRUlvV1JFcGt4VEZDdzZTejEyT1RNaHp1WUp4cXRIdFpXR0Ns?=
 =?utf-8?B?UkZqQ3JqMjFBODJvTDgycEZmZVBVaTlRYXhwbEY5WnZlUUpqMGxFcUNWbVJZ?=
 =?utf-8?B?WklYZlo0b0tIbGJpSUxjdk8vM1JOUlpFUG1tbU1ld0V2VHExVHRwamsydXNH?=
 =?utf-8?B?MGo5b01JWFBvUDlZeTQ1bVFOZFN3czYwS1p4Y3orOHFyT0h4Q2x6Z0hrWXlM?=
 =?utf-8?B?dExZQXVSVFkzakVoTnRMemNkYldFVzJ0QlZiblQ2cTNYckFTNVhqeFNuaTln?=
 =?utf-8?B?SEloVDVmbDB1Wnk2VnV3MStKVVBURGlSVWhJNWpPWWhqOS9PbHFzODRtNEFU?=
 =?utf-8?B?dHZ5bW5RUXVpSS94UlJyM0EwYXlHbWx1eXVKUmYvbTM0WEc2MVhaMXVydE5o?=
 =?utf-8?B?WTU3S3FFU3FqNENjb2Z5WUkydm1mdkdyaWJkMlJScTZhUkRLL05OVFhCZFJR?=
 =?utf-8?Q?diNk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB8283.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WDRSZ3V0dll6WXZDNVJURzRxamJ0YUNpRi9YZDhtdmkyTzkvWTFRNThRT0kx?=
 =?utf-8?B?UElZcDZubVhzdHZzUVJVTStEM1hoLzVNOXVQMW94TWcyNmR6bThqQkJsamFa?=
 =?utf-8?B?NmlnYnI4SGVGalBKWmVNUSs3eTA3ZVJlN3BZNTJzMEgrYlR1Sm9qU1hNN0py?=
 =?utf-8?B?eEdjMjRzcHJEOFhtZm1vOUtqUXBQOTBOcFNrL2RiZ1paKys0UnJlUk1UTVNm?=
 =?utf-8?B?Vm5RWUdvb0RqTWZMbWNZTDJIckU0VlIwMTdERDJSMmU4NGZvMExxRmVtSDUy?=
 =?utf-8?B?U0xob1VxVUJWcnRhV25lekpOaFJ3N2QyQjNCWXg1VXA0OTF3R1ZBNEZFdm9w?=
 =?utf-8?B?RWVKSXA4WTJIcEd5d0hYWjRiek1tVGpmR0hoTCtMVHovUXc0TnNoTS9MNEUx?=
 =?utf-8?B?ckp6akpXTHE5dkY0VVpJcEpVdHAwbXh0NENBNFBUWTRCNU5KSno4NTk5NkhP?=
 =?utf-8?B?a1lzdEIyM0pkZVZmU01SQk1ZMU9NU05nTjlvMG1XQjR6VS9lZVJscnFUSW9C?=
 =?utf-8?B?eU1XSGg1cHNtb2JEZ2RpSXlXdy81aFB5RlIvcHkvRTlXd3FMMWVRTVJvZjJ3?=
 =?utf-8?B?Q1ZKcllMU04xVys4QnB5THUraW8xbVAyWHBvUW9iZjlKY0FtZ29kMzlLRS9S?=
 =?utf-8?B?cUNnVk1raUpXUTBPUnA0WjFHUEVYNGpsQzZ5dll4UTJFcVBaZHVBTkprU2ND?=
 =?utf-8?B?YWJMMjFSeTVEdllFM3JqY21LRlhBUlJzSzF3ZUZQVTY0ekZPYTNXVWl1WHlQ?=
 =?utf-8?B?OFBuekpyVWtROE45cHNNNVhocllXWG5BRUlWcnJ4TEFTZFVET2lvc3JMWGtV?=
 =?utf-8?B?dS9WbUJhQmtyYnVkQUoxdUJzLzN5aWI4VnRCTC9nSkozeXQ0WGVpWlduUG04?=
 =?utf-8?B?YnJEUkdmVkNCMnp6eTVJTWVsZDlZcFJzeUJkWmo1eUhrcG1IQUE4c241bnBE?=
 =?utf-8?B?TXh3QjBFOTJ3S0hjUUlyTTdtVWp3N0Qvd2k4MEsyaXlSZnRPeFc3NVgvV2Jw?=
 =?utf-8?B?WkJCSGh6QVVlWjFibUhVSnFYWXBpaG5DSmt3aGc1cmVDQnViYnJSWnNHNi9Z?=
 =?utf-8?B?YkZ0L0J4WTdOS2V6ZnA4enVZd2djdG1MRG0wVUxtR1llZEZFZWxQSHJ6QkJ6?=
 =?utf-8?B?UlhsVDhMeENZbDFGQVg1ckgyWmlwRGJIUEFRcmZrQ1NDQUZwTlhhMUVreHNp?=
 =?utf-8?B?NEZ0aVV6T1JDR3JIa3ZZRXhNSW8rbUpMQXBUUFY4allpekRCWkp1UWN1VUo5?=
 =?utf-8?B?Vm5LMlc5QUFaK1dQQ2dTRkY3YzZGVFppT2wrOERkM08zTERXSkNmR0t3WEV2?=
 =?utf-8?B?bWVWMFNmbWNCOFAvWGFpWmdBOERycy8rRmFUYkswSHZFRktDOGR4dGRoNTRv?=
 =?utf-8?B?VlVMQnZMdm9iTmtlRnlINXZEaFVlVUlYWVhPMnJHZHhYU2pTQ0FUNG5oVlhy?=
 =?utf-8?B?OTZiRGRoSXRpN1dYeUpDTi93V0syQWVkMTNFeXprWTFjSGdVbjdYMTVlUWxz?=
 =?utf-8?B?T0ZXU1RteXRBZDlYL3hnT2dDRnlDT2Q1VGswSDNPTXJudDB4ZEZOa1hyZ2JW?=
 =?utf-8?B?ZlJTWkNzNHA0Qk1SR1I1RjFTNUhzWW9TOVZRbEFrRXF0RS81T0tDdUhVeFJn?=
 =?utf-8?B?MGk0RzYvb3RsWlFqSm5LazlINEg2d2YyaVRvYlJIeDQ4c3V2Z3hrMXdnamZi?=
 =?utf-8?B?ZnNha2JVaUNnckxSa0pTNDdocnpiWFdWdkU1OENRVHRnYVhIRGdMRUZrWTll?=
 =?utf-8?B?T3FPL0MxYWxmdXlCdHczSkxLNUxSTGg0ckFtK0MxY2xsZEdCNUlZSG9DT21T?=
 =?utf-8?B?cVpYZ0FwVEVEUXdEOFl6ZVRMZTBLckUxM3dYNE1kSTIyc21mZTE3MGc0Z2ZQ?=
 =?utf-8?B?VWZRdGg4b2tsRUpzOU5WYzk4TUpxT2VnS1V6c253T3pPQitJWXp0Zlhod2VM?=
 =?utf-8?B?bU5TeWo3VEozb1loV1dsSVFBeXF1WXVVUzBZUnFkcU5UUlAvaHBINzhvUzcr?=
 =?utf-8?B?U2d0YnViLzhobzd0M0ZnSEJrQ1BGU2FFeWpFampySXBQbVZSS0dEVzRtNzQr?=
 =?utf-8?B?ZXRxU3k1TnIrTU0wMTZWazNpRGN3b2xRbit3amUvb2hIWGxueFQ3SWViQVFD?=
 =?utf-8?B?aEJTV05kbk4rTFU4cGZQSG9vaEx2aUNDbVI5OEpVU1hpZktIUTJKUkZUY2NR?=
 =?utf-8?B?c2doMnlyT1UvZWVPYzJJYnZidlZ6Q3dXSFEvbGxocnc5Y0pjSE11aEZPTUJY?=
 =?utf-8?B?M01jSzJLUlJqOXRBYzF4R3NwY09qNFRjZERJdjgzaVVPRlpmSGcrRlFDZ2lZ?=
 =?utf-8?B?RWdnZWpPdGVrRmg3TnFuZVhBT3V5VWdHSzZ2THI4WS9DNzkxYTFnYmk4QmZM?=
 =?utf-8?Q?NNIIgeVRWADEMfbI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a04505b-1e7d-4232-4774-08de6b4142c3
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8283.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 20:48:37.3584
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: behYt06sSSa8O1a9BMyxrwuhKP3/S+qGOXrFZ6zWXDiU5CZB8OwFI1S6oPKFwYCyeI6WuEUtI5ybCUBgbGt6yCgaAGF7EvuQU8gsjlNa/NE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6495
X-OriginatorOrg: intel.com

On 2026-02-10 4:27 PM, Cezary Rojewski wrote:
> The put() operation is expected to return:
> 1) 0 on success if no changes were made
> 2) 1 on success if changes were made
> 3) error code otherwise
...

Only just now I've realized that there is a typo in the title - should 
have been "PATCH v4" instead. Let me know if I should resend this one.

Kind regards,
Czarek
