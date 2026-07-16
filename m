Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A4D33F0A94;
	Thu, 16 Jul 2026 08:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784191278; cv=fail; b=OzeyEgM3tpScHMNUJExqjHsG3jvQRmKGSo9Lzj4ex7zQBgmJhYq/p1zBIv84iIAI261yHYFyXF/jeWaP1g3dsOQCZ6rLwjLWemTw8oCuLTp6QuoN7yf4S5UmX/7XAXQpVCAm/PG9OMz2x7+ntKRTZdpDFBDpeTslN5Sz+KPP3K8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784191278; c=relaxed/simple;
	bh=Rj575QdZsBNpzYPp9VwLFykBQDi1+sNy4ExwV2mUel4=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=f3YB4qOBq5A88DMaLwA/MW4c565u8Ue83go9bCb5jrImpUkWzrIc/jVcjEv2fcZlVhSye8p4oAik6is7gjEvGX6VzSdz+uOl2z0YcfNwBMOGjdaycH+vcgoD8JX+0IZp/vMvvmOZM8k75D3qwmgb6LAXuGYsGEQ8FwaltSKz5sk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QwdlG1a0; arc=fail smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QwdlG1a0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784191277; x=1815727277;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Rj575QdZsBNpzYPp9VwLFykBQDi1+sNy4ExwV2mUel4=;
  b=QwdlG1a0ne672xmHVev+bq8mKqNtD8OZDS5fHAUiSnrIyt4B7xDxluIL
   g6PqrPCui3dIJMr5X5koi959gkoyUeX21E2S7jARlKOzbm3qhv1c5G8lh
   NSg/XdsdksIdqDHh94/SdsDXqdLXujcyi3FmicSLucDxVPYIjXItuiFkW
   BGgDURWARlH8KOr2iAn6FCubz2hMG1bI23S0joUDrpIVioGuIgzitZ8nU
   ffd4Pl+QBUe9E/+Bgw3u5Q8Sbofmy5wGOhjinCwmI2p1i+3J9ypoM7dwr
   yTZ2ExCRr1I3ckWnuSdIleBrXDoYdDjAlepuuuLcaxmMdkoarM0Eyapnv
   Q==;
X-CSE-ConnectionGUID: AnBM/ThCTHClf/IAkR+z0Q==
X-CSE-MsgGUID: 2VqXwQxHSQ+Qu3KFJwRcrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="102271665"
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; 
   d="scan'208";a="102271665"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2026 01:41:14 -0700
X-CSE-ConnectionGUID: 6GfQU5TxSQ2AdDNbDUKHog==
X-CSE-MsgGUID: e3SQNMvBTZKcXbVBWwu2Ag==
X-ExtLoop1: 1
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2026 01:41:14 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 16 Jul 2026 01:41:13 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 16 Jul 2026 01:41:13 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.50) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 16 Jul 2026 01:41:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HcG5ZGv5o4xaGKWWgq4D793XSUMviU0zQhy42cShmub6aBKx7yqT9ZiSUSnun/eB8uwbAPhOCuAGU05YvWDayR8Sk9BY7hdrNbefoO25b7tiAQ4INXGvtQhUAmNt/lFScKWdaJDg0kxB1UGkgFBYF9f/0xZUijBjDqWcTfarMdaPSG9DOJ/hVADoUS1HGDmdBwPSaXE7i/uN/PF+ET3iW6j5D0ARL49zxBjBbKDj92YLsNNXAu3ZbAO8tpUip4kNd4f1JAgMIWIAIKbCk0wNc/HEYpeYJF+6xbWgBsQhMtIkPWo3BmAgtFv7ZOvxDGvdqbDZkjv/VxjH2F5OJpLcQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZIxSzdGMi55UXHqDo5279OmrkLS0Ko5yAolCDK3nrAQ=;
 b=PryHhmM6st2DpxEfmXpEgsL4Ywu4OxnoFTVKc+RfLMgZ0Wb6PT2Q0O6OyKl22EZVrMiZLye06rdrKIZEM4/W37io5U3n8wriCKahQcqOUsA1xJnm2saL3/4FyfWplu54pI1NL8//u6Sd7EN+urMMKPdccXB1+v4+5FNTFTgCD4j26SvbUr8sPvd1fTQX0rEkb6YDoUvgEHWIMK8MI1QqOOXZflvfZnxv+Sdc/Dxv23ObHaF/ti2CrR48WzEmzU1DBMFQm8Ncj/L17hq7emb0jZc4lzBxh8x4Q45Of5TEHvcpm4F8rP3iW+NkmT1qw8Kp7VcyToQF9JDu/OfTyYKIOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6967.namprd11.prod.outlook.com (2603:10b6:806:2bb::15)
 by CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Thu, 16 Jul
 2026 08:41:06 +0000
Received: from SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4]) by SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4%3]) with mapi id 15.21.0223.008; Thu, 16 Jul 2026
 08:41:06 +0000
Message-ID: <60eb194f-9568-4111-b224-c9a03a774a63@intel.com>
Date: Thu, 16 Jul 2026 10:41:02 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: fs210x: Make cache write through again during
 resume
To: Mark Brown <broonie@kernel.org>
CC: <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Nick Li
	<nick.li@foursemi.com>, Liam Girdwood <lgirdwood@gmail.com>
References: <20260715-asoc-fs210x-fix-resume-v1-1-dd81d9c62c05@kernel.org>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20260715-asoc-fs210x-fix-resume-v1-1-dd81d9c62c05@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA0P291CA0016.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::28) To SA1PR11MB6967.namprd11.prod.outlook.com
 (2603:10b6:806:2bb::15)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6967:EE_|CO1PR11MB5009:EE_
X-MS-Office365-Filtering-Correlation-Id: 4dbecbe6-b596-4252-8f3b-08dee315f9eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|22082099003|18002099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: sM8L1ArJtZHgj8HecY2rypmWdJCBYbzlrB8M7zvzSg0apoHOneezU1wvF/819TtIcPzb+/B+AZ31L16r/BX/CBDU7JpiYm5m1fT8GgEINkBW7Br4qWzLZGBk+Jvse6/MEN5+yYF6FWF4FJzpFFZdUw/PaKEAFHteR2708p2+JFGUcUcnWlQWQrkMkFjujCo0c/A2It9UF4JQlfk20yNNQtK5u0WH1AnjbJwAzAhfWQiCUoDENqBdq/pW48WhymFd+9CFBQnue3ePY68wp+8/cr0AYP23tW40B9VWhJLEdeRI1fMkBVaeQLFeKcaWwIhmQ3MudGYx4VqOVGGYGmbtiNH3XNjMBXZeM1NX24AQnh1Z22P7Is1r4wssvOONLXh7qJ5WP3J5aAIxpwpU+ZlwgieUi39UfnjwtihFPCv48VqvH+FAKnaQcilbUxIJc26iGPJ/g4lMrVCrjv9hULaYzggg1sZGemaMQYll+BwQpTGSHFEc6+eguPFLjrAuJJFg/+1Bo1u6EE9zn61fDsk95pfOf7yWUm7mzi5XwpGjPENPIKNl6OXXV41PIQk7TnvBaETRX3au4hJ0qizQkVVzHCugfWcAvW+6F3QPy8SAg4U5CL66HgDjIW+RCup9cKeC7aZJEyw1HX1DxMQ79uaJ/2Mu9woiMs6mzKAwZ5wctqo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB6967.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(22082099003)(18002099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dXU3RDNodjFhaUJvek83MDJVS2FLVm5ZVVBBNDJGZkhiN3YvUkZFeVB2dDFv?=
 =?utf-8?B?RE9DeVg0dVNiWFJmaDEveFIyYVFacm96TWhtQkJlR2liN0VSbEZrZkw0bTNN?=
 =?utf-8?B?dHRQUDFHYWJiWmN6NGV5cXBJYnVYQ3JyRGc1ZnhYYUl1TWNXbTF4UFprY29m?=
 =?utf-8?B?TGlvTlFsZk5VclI3Yk56UkdVdmVpSDFQYlFGSkJtb3YzSUJZVVhZWWlzM0xZ?=
 =?utf-8?B?cXRSaGhEUzdnUE9YYjJaaFQvTE9IUEJjZWNzcEV2MWVpU1BhM0liTUtXMnJo?=
 =?utf-8?B?d1hEcHFkeCtWYmRhVW5sNXhISHM1QjhUQk9kM0ZPK215cU9leHlxTHE4eEI5?=
 =?utf-8?B?MWswMHQvblRxZlNkVkFXNmZmNTFZb3pGS2lFRXcvOWVocENPMWZqbG5HR3pO?=
 =?utf-8?B?dmN4amJPN1I3dGJpNWI4Z0J5TmRIa1NpQmxKeGlLMHV1VW9OZUJwb0dUSGJj?=
 =?utf-8?B?blBCdVNSb25EMmtKVDA2OVZaSmVwUlk5ZDdRUG1kQWtaSHBnT1ZXYW1SY2FI?=
 =?utf-8?B?S3BlL3BPcXdQZjc0cXNpK0gwR25FakIyMjRuZTRaRm43MlZkaHp4THU4b1dS?=
 =?utf-8?B?d1NaMmNMcVAvOVQ4TDFLVjBqc3V1N3FmTldLK2pmNnRORG1EeEdLWlQ3WTY1?=
 =?utf-8?B?d0VNc0xrNDNKSWRIcFE2ZkNvMFlIWUVSWFpWRUhBNVk5aEoxVCtPWk43OW1C?=
 =?utf-8?B?MFdvdlU5MTF4TlRQaWVCODM2QVptWmI3ZVg0V3h2VEkzc0QvTmx2Qms5WkJu?=
 =?utf-8?B?QmRHQ3Iybzg5L0s0aVdGYWJkWE9XK01PL1hoa2s1RzVOV1FEL2h6Qk0rRmN6?=
 =?utf-8?B?QkVaSnNiZnpjcTJjS2QrWmFsaUgwc1RWUWlpMXlydklDczhEQ2J6TTYzb0JB?=
 =?utf-8?B?emtGb2hsRTIxRE9qeExyOXhldzgvdTZlQnVwcU1wOStzWFJRUVRoS1RDV3Qw?=
 =?utf-8?B?QnYvd3UyZG10TGJjcjRkRUF1SVNyakVCRW1UMWJGWXpSVk1SOXJvVjdiMnRL?=
 =?utf-8?B?elBOTFNHNVpCK2ZrendQRTlpNjlYOTMyQm05MTFUVjdsU1VLNkdOaVJLRGRD?=
 =?utf-8?B?YlcxaEhxTnd6b3FuTmJLbDZIRTJZSS9UZFNFY3lCSXI3d0dRRkw4Ym8wVnZH?=
 =?utf-8?B?ZUowZDlBLzdvRURPeE9WNjU5a3FLRm0wSExzZnBWNGluZFdjVCt3OHE5MllJ?=
 =?utf-8?B?SHpOdFZRbzVnV2IrN09leFBINzl4WDFxRnFXRHIyeFM1bnJpZ1B1VW5DWG5D?=
 =?utf-8?B?VkloOWt4dDhuYzFzOVVkNnZiZjh4UkdoK09TdVJickQzblZwVGdSUnI2YXZ5?=
 =?utf-8?B?dEtFenJWZzNuMExORFJOSVpqUFYvZzUrUUpWUXNpUGh0WkZyUmNSaE1XdXVo?=
 =?utf-8?B?WXdDV2RQRkR3U2kxQldNL1pSaEtpZHcwU1Yyd09qc3ZpMnhCN0tRSHBDZXBJ?=
 =?utf-8?B?UVRLbHNsNFZIZmNKZEpKUzZYclVMWDZxYmNpN2hYbXBzNktzdDdWMEJrMVRC?=
 =?utf-8?B?YjgzQzFYTWZodkYxVVlVOFFBNWJtam96eEQ2RHVTbkhPU011cVVhTVl2amVP?=
 =?utf-8?B?RVNENUtpdG5oSm1TRU9MRVRiUG92WEZRcnIwNjk4dUowTnROdDRIVE5Vb0tU?=
 =?utf-8?B?L1pIOWVlWlJxcVRLMnorMDBCaHYrZGhabkhEUnJNQmsyRWxRYktZRkpuZU9G?=
 =?utf-8?B?bEljTE1hdXJrY1pVZXpDQVcwbkFXalhQS1M4Qmtxa2lKaEpVMXhCNmxTVWw1?=
 =?utf-8?B?VXBuZm9OL0lnOGV3anZmaDMwY1JEdlJtcHhZOXhveEFsVnp3dlZnelp5dWpp?=
 =?utf-8?B?U2tPL2d3UVdMeEhXSW5WWEpSQ1lzZ0R1bm9sYTMzUkt6SnRPSHhKa1JpNzZV?=
 =?utf-8?B?dnV5Z04zclhnMDUvT0hJVyt3Qm8rQmhBTk90Nk9zUVNlaTBMV2pUSWZLdlFG?=
 =?utf-8?B?TzZmTVZFRmdJYTBiaFVPL1FWQVNlOE1VVFU2Vndjc0JQYy9VVWcwWmFJajBp?=
 =?utf-8?B?SmZ6OUpaRnMwOUFUZTJGZkFWVmhmK3pSb0EzWjhEWWx1ODU5TitkaXQxei9H?=
 =?utf-8?B?NFlnNzZXSFg4RWkzV1A1OU1mU3gvb1UvSGZhd2N5RVlUd0VjQ0VsOTduOHJv?=
 =?utf-8?B?bjl6WnNrak1LSXYrR3RqOSs5TEV6VDRzUG5VNlJ0M3duK3JqNmR0MXduK3hB?=
 =?utf-8?B?SGRIbFhpN2Y0NUhnZklxT3dPMWQwL2I5VW1uOENQUS9EbFFxcHltZ1BnZkxH?=
 =?utf-8?B?ZzhsQVZTT1JBbnFFeHdLNlhsZmpCYWlsU0xRSmJmMldyTzliWXJQSjdXRmRZ?=
 =?utf-8?B?RDJYcTZmL0NhYi93UXdta084cHMyMEhhRDNPY0J6WFdNVXIwdkJFZz09?=
X-Exchange-RoutingPolicyChecked: NXMlX0sFS3uH6/J0k9yRnGfxU8Nsxy4/oiXNtiuFMMtFmXsOnjFxe/RdEEt0yhEAm1kVpE0SEBt3yyPrz6tJcJ5XZ6drsa3Ad/NmpkJiHSwwxvVQrKUbTIuqhS7QOvPsGHyVxUhKXkEVxmAb5c0kjuhREFuwRn2M1wWFgoJMA4WIiB460QY7jBfEW3tktKk4eFuhYWX9OVyXb8AKJNS0NBs6tSZY2+F6nlmbgUO8m4/5L9XZs1ejr7amDSvqtMHavaDqF1aOxT+kR3EDYqZQTzNVW+oGWrVxvXtepE75695wClh1v18MkG3xqawIFkTI19dJ9+VKNpqeM4R4cTmbPw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dbecbe6-b596-4252-8f3b-08dee315f9eb
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6967.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 08:41:06.2130
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5SJoRstx8lfVCU1mrY7P05Uro9ncSI7YLKl31LVfNb202e0bw/2doLPUvhl0JrQE8pfGYvHsc2ba0HPRdST1LDCjnMbvFeEHbrxWyBlDZPM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5009
X-OriginatorOrg: intel.com

On 7/15/2026 10:16 PM, Mark Brown wrote:
> The fs210x driver currently puts the regmap cache into cache only mode
> during suspend but at no point does it make it writable again, meaning
> that device can't work after suspend other than basic powerup which
> bypasses the cache.
> 
> Mark the cache as writable again when we resync the registers, it's not
> clear to me that the cache only mode is needed at all but this is a
> fairly minimal change.  Since this is setting a flag it's safe to do
> even if the cache was not previously in cache only mode.
The first paragraph seems to mark this patch as a good Fixes: candidate. 
  That's just a nitpick though.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
