Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58A2B4908AA
	for <linux-sound@vger.kernel.org>; Thu, 27 Aug 2026 17:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787853496; cv=fail; b=T3bNIcx49EymmRXkX/diZXZcuekzSnlJ0tlkroe1rsiC6FyRQrj+7TKU428lNEFsIhf5cgxvn7vX2WF4iUKI+1OWGmzYSK9VUmcugZRdlDEhuTy25/z0M0z+bHncomDKwPwuzqBK95MwQn7Zfd6Ix+9yryLsXUJDUSHT5oPAflY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787853496; c=relaxed/simple;
	bh=f+n4oClipxIsZ3g+JNv6TpKNdvF3uT4HjVYYbPq2pIU=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=cDaqvD7Fy1uCuuCDqNpILPKWvh5H2m4hDNWR0fpqdc/JVu0npaaiS88Z6Pe6VpGIIdRqx3K2dUS3HaqbIalsZgL264Lh8ER0++0VVN3ncqcaRahT5L42na1XBB4+b2bCHxGPvJ5IlfuI5IxqCWTQgZBDN4rP1EYSczeItKOT5jU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cpobn0vE; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cpobn0vE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787853494; x=1819389494;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=f+n4oClipxIsZ3g+JNv6TpKNdvF3uT4HjVYYbPq2pIU=;
  b=cpobn0vEOhaLpdvFQFW2KCtZBB60MRhz7Tjyqvl//kZNnkcqWkZsT06x
   EN5XEQH+mV0phE4/AhR6dbwm9kMQLzJhOOH2DE8FaWHgDOUicCBChnA1n
   iy6P1ZyYKz12odJoPtHv80plA3IltPmQFvq4VyITdm2lvWsA7T8LMFiXF
   rjweuz8S5jlxqw1R0GPHnPBh91iKKEWN0InuN3fOjtXb3GMOiXcEzbzj7
   3YAJ0uh/Qsqv0WaQKckCdJ5HVP3FSk4rY72DSmHMZJC0oTHv2jeD/tTwA
   U6l74bJNUmZ4wngJ2SxIRyUsTdtHeCDMY31axjMA6fReL2Ay6pOmy/rj3
   g==;
X-CSE-ConnectionGUID: KObQkoBmSqalIBkiREj2FA==
X-CSE-MsgGUID: MENALOqnTnuX2B+4+iZ35A==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="88385799"
X-IronPort-AV: E=Sophos;i="6.25,247,1779174000"; 
   d="scan'208";a="88385799"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 10:58:13 -0700
X-CSE-ConnectionGUID: 6LoH4Er5RDCnv5zc8BSazg==
X-CSE-MsgGUID: yLe+ii3/RpqaML9SEMdD0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,247,1779174000"; 
   d="scan'208";a="264179396"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 10:58:12 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 10:58:12 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 27 Aug 2026 10:58:12 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.23) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 10:58:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WpqvB0tQqNWbT5bKMIvZIbazSR89qGWIlxmX9WhJp65GR+xzImeloD21N1T1AI8UHzCRQjeE0697EmjL2RBfLZbqSZWXhZaaZ4AM9JcT/h7zNX1cm5f49cfAIcy6Jl+4sDc9fCN/DUrhdjr9xhgvbynwkFVWUu8LBKIFRJpxpDiEqWAamnPNon2FQM0ajBWhjOWGKZiJn6MwkIaXJX9WAn8C2q6KvnVqqKpnKuyHLl6502VZ3LiloBWP683BL0ziE4wYHu9IzgYhnT05SBUvkb8fBRRMD3Wu+dFICvlVz0dWIcql5SJgo5thWjFz+u8ZrB5zFTA7Y0wR9U+B1aguHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1pV/W7nMD3AK4y6wnJhNnL97ooMTcPQxAX9d5pocreI=;
 b=ugNlRTFU3wjzNGWksZU9dmM1y3UmTfTD98M41xWMCroTkWIN1r8up/oMIGkEo938W3/BLLhw6rMm6NTKWqrO+VEbT6kG24nAbHc8CnlVbJHBWzKVoMTxF7Y8EiC3dObsrFsXOTDnCax0R4zeTrJwT/Rc2ZZrOqd8CEWUShh7hTzsq0JEkcEELpme/Ce90tCB6YM5DQOq7lmAnjUPCos2jYXN92/Ky8BsCjwAfvoFd7L4E+msgekZeow34r8SBj+w8YtviaeKzuyTwiSv/mxbV1lrwbwmzfYu8mVmZpEf6g6WqRrSXb634w9h22m3Uv6lxdFvQIt6uVurLu37j9xllA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6006.namprd11.prod.outlook.com (2603:10b6:510:1e1::13)
 by SAWPR11MB9783.namprd11.prod.outlook.com (2603:10b6:806:4c9::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 27 Aug
 2026 17:58:05 +0000
Received: from PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd]) by PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd%5]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 17:58:05 +0000
Message-ID: <9488fd22-fbb8-4ec0-bc59-0c92105eda56@intel.com>
Date: Thu, 27 Aug 2026 19:58:01 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/10] ASoC: Intel: avs: Clean up streams if their
 initialization fails
To: Mark Brown <broonie@kernel.org>
CC: <tiwai@suse.com>, <perex@perex.cz>, <amade@asmblr.net>,
	<linux-sound@vger.kernel.org>
References: <20260827131510.1014084-1-cezary.rojewski@intel.com>
 <20260827131510.1014084-6-cezary.rojewski@intel.com>
 <8537fc06-7d8d-4a25-a111-5fb6e6121253@sirena.org.uk>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <8537fc06-7d8d-4a25-a111-5fb6e6121253@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P190CA0034.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d1::10) To PH7PR11MB6006.namprd11.prod.outlook.com
 (2603:10b6:510:1e1::13)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6006:EE_|SAWPR11MB9783:EE_
X-MS-Office365-Filtering-Correlation-Id: e8022011-e160-457b-5257-08df0464beab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|10067099003|22082099003|18002099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 08tjIy5rT8FwtF2/K9hnCDGPP2PwOQZqJ0mIuICzwL+qDYdb94fz8md/0SoXItpCZ3QTGHQiZUmpz8fiiul9Y9hQNKjl5mGhJDRIXyIPHKE33drnl9chfhA8hwNmE3vzAZJzSnM9eDuVB5ygRIhacWvvAS2Zotjy/rS6P9o9Fqp05tPdLkhayOp3x1SSpF6UaHDZNmTpOrELtZUOx2sjfEJrmRFfRLaKKffZEWsK0ogKuZsc8nA1ZbLdGGi65RctIAbuAyLJRIhNfpOT8bgWSh6NGJ97MRqSTVhwDKidaI7yGF7uRSBTeUW3X4kDBwlDfxQaxz/HF8AFNEwq2118N5fP4Q0L9a9ymqo47tNhqU05lFkt6udlCzefT34CZ608RZIcL+CdMbzVem0ZNjxL+TtJolyXuwnkEgOxP6ITp5VOrw9HX8dgeT0YT9F2jeWh34sG0Bhd0Q+87lo0lAzPQMMfPk4f9NAU+dXWUYwMThWMXglktRnhZCjrb/TtsK53/YuycNHIMiP634x2LBHXNjbRegITuiuaLGLYexCnIMqRTGh7CxZx/ouaBHy+d5/FV6PmGSw+7L/++T6j8IG3znF8Vb48WkI75ZIumtS8Nm4oGVRO40BN7sn7eZHTkSy5YUqn8KJdLY7za/2TYHsCeBZfmZCA1OVY2e2chzAgJQ0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(10067099003)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c0F6SGIrQmVJdDdnVExZSE1SdlZhclZRS3FDUjAwcUZyS2oyTXJUNmtnbE1Z?=
 =?utf-8?B?dTNEYThGWEFMaVkwMmtFUVI2TEt6TjFCR2J4ZTdMb3V1ODBrdFhHbVVlZ25C?=
 =?utf-8?B?Q0lZUGVnemFhc2Z2N255TGFIaVZjNVdxWnpIM3ByUmRjcGhrS3VEN2RnZHEx?=
 =?utf-8?B?TkxGQ0RkWTcwS2NHWmFsRjZHbHpYZTJyT2VoU0NjNXowZVpDMzhiUmVPNUlj?=
 =?utf-8?B?dkxDU1owNDBpM3ZBM1JRSWVHZmlmWXBuKytaa1VXZC9rUTZTbU9XRkVWV1Qw?=
 =?utf-8?B?cnpkS00yNU9Sb2NKQVN1ODBxZlVickNXWXV4WmNRbFlTN0ZEdkZCajBNcXhz?=
 =?utf-8?B?WVVUcEthdFM3aUxhY3BBYnNTUDhpcGJsQ1NsYlluQ05Sa0g3b1ZFOW9YY0Zz?=
 =?utf-8?B?SC9Zc0xUNmxMVk1OaVJaL2dsQXR6Z09NMGlETzl3Sm9hVlI5RXgrbDlxZ09t?=
 =?utf-8?B?TmVETE1weEUwbE85a0dwaU5jcWhBVFhySUFVK1lNQW5sM04rQXE3bDArM3Bj?=
 =?utf-8?B?K0xEMUJ3YW96S25lRFpFSzNkNWUvZ3NSL3lnZEJoSVVNQzk3bXVtNER3L3dt?=
 =?utf-8?B?a0dlQnJxT0x5QStqaFVVaCtra1I0N2ZSYUpiOStScUpRaEk3bTR2R2c5KzND?=
 =?utf-8?B?ZURxZUpBQzJrcmY3SlNoZExJb2E5NW40dDRTcnZiOHEyMWtRY09FbDkzTkVq?=
 =?utf-8?B?OGU4eEZuR2s3TE1BYkhEOEllaHg0VFVTcmJaSlBsVnBlQmZ5RFA4NmZJTUd2?=
 =?utf-8?B?cWxVMml4NEg1MktoSzhtbnhHWjIwODNTbmVMWEJQYVp0M3JHTnBxNGV3K2pq?=
 =?utf-8?B?Z09KY01neUFEejF2L3JaaVg5VDVoME5yZzFyZEt0NGwwTm80YTIwamtONzVw?=
 =?utf-8?B?Vmtvb0dVdU5IVHJkQUQwMVFYNzZBR1VqbXNaamNYRHAyWHJSd2VkVXhESXVG?=
 =?utf-8?B?T2JCMDBTNnM4dHN6VWZrQ1VqdmVMSGtpeWtad1FlZ2swZTNOemswV3UvR2cy?=
 =?utf-8?B?KzNPTzkyT3d0Vm91VzlWcVk0MCtSM1pBNDNSalFjTVZKQVFUUlpLSkQxTEFI?=
 =?utf-8?B?RG9xUmt6UHZ4RlNzdVd5Vm16MEFwa3NzTG9ra0hiQncxbyt2YnllZWVzMWY4?=
 =?utf-8?B?U0dOV3IzQi9ZNGRrQXpxN0grUU10MVlHSUk0SlhYMlhyOGo2b2x1V3B3VlBw?=
 =?utf-8?B?QnZ5aStmOXpEYTR5ajk5WDQ2MkZqdG9qb0lzUTlqQVFFMnM4Z2UyMGhUMXo2?=
 =?utf-8?B?QkZ6QUVlVHRxdWZMeFpnaG1Md0ovVmc3bktaZjZaSG9rNGIzUjVjK1BweWdU?=
 =?utf-8?B?Q1VGeHRhbWZXaXMrTWtuMEI4eno4SUxubU0yTXpxK0dtQVduUUlQNjZ1Tmhs?=
 =?utf-8?B?bTQzbGhmQjRTRmlSMkRRSG5EdWZkYzlvVVVSZjl5UG0rZElReEdNY2pMRnZO?=
 =?utf-8?B?ZUxYN00yM2prdEFMOGpLWDhFZ1ZqcVZPZ3dJY0ZmamRkMUluSkJLczFXTnNh?=
 =?utf-8?B?NHBPNkkrS25FcU0yZTl1YUc4TEVwTVNVOUQwRFdCQjBzazZjenNhWFRMclIw?=
 =?utf-8?B?ME0vWjJjeVF3dmJKV1kzVkQyZkVLSi9IMjJrL2hNWkkzN2xGblk3a0E2ZVlF?=
 =?utf-8?B?V1ZvWWlIMTYrbU9TbjAvbXI3bnhHdFRoVUx5MkxIUmZjTTUvNTM4TEdHVk1R?=
 =?utf-8?B?d042RU5WVFMreEtEYkFFVFVTMUJLVXVnMzQybFVZTXpuV1JMUWlUSHB1MDJ6?=
 =?utf-8?B?WDh5SWhIR2JWOHFXcXlMRGNSb1BOemFQYnFWMXVnSFg4QUx2OGRWMm1BcDd1?=
 =?utf-8?B?NWphY2NzYWJWclJjQ1pFZHkvQ2ttZ2ZhL3lYYkllT1hhUmVmdGtHVmxtRTRD?=
 =?utf-8?B?U01PY29hbnp4S0FKUkxxWEFkRms0YnE3N0g0VWh4MzFXQjhPMTZwYXpVVENU?=
 =?utf-8?B?eDZRSDNXMUlvZXlRWklNOHJ3c1ZvT2UzckNpOEViNGV2eDZWMU90RkE1NkRt?=
 =?utf-8?B?STFtRHNVR0YzNGNpODY1SGJHVXluclB5NTducEFSL0h1SWorcGpMV3p2dngw?=
 =?utf-8?B?dmNFR0RPQlFMa09vTVdMZ3dzSlFHMW5EbzlqdEVXYXdxdFVucEphTHREcFVB?=
 =?utf-8?B?YS9MdmJKMG1xTDNRYjVvejg5WGt5U3Zod3lIOTFYcll4TzFIN1FXRktpZDJB?=
 =?utf-8?B?c0cwMHlNc3M0VEhZQnRkdStyNTBadVI4QmhUTUJGNHphZjcxZ2FIdEpQNmhL?=
 =?utf-8?B?U1JIbC9QaXY1a3IxdFRoNUU2Ymdja1hkSUQwUFpvSGRYNWhjRnpqb2dxb1Y3?=
 =?utf-8?B?bWpDdTNDYk9lbUtobUtoalBwaUIzY2lBOHZva1ZrUWhpNFVjR2RxQUc0ZEVK?=
 =?utf-8?Q?CfcjcbJFu30nzbYo=3D?=
X-Exchange-RoutingPolicyChecked: 1XPdFjZapz/skmaPMYjBXrKA5UA4irt5hP6EOO+AiyoN33xuFDBgZLxlb4tmC5qlkDcKU7HvVQKuWsow+ke1EwQST5kdHYLFO03jHUjp5fmKCPXwOb4o9ntbB+9/52JDOd9y2pIpMj/eUNq1867sThs2jQRK1Zfb10DRBJQnHEawK1n+vdf6BgFKQJNkTzEy9svoowYuHunHHda8fmztjN+5rrRamtKzSh94I++zadToRtL7XUzR+u1iO180ftu5C0TLemve7v6Bqv/XJu8x6Y+j74pwjDImoHGWZHPIRu5o5Fc2AXqoOWJMJd+GMo1l1JVvaR5hAVg5PeYgww7Ofg==
X-MS-Exchange-CrossTenant-Network-Message-Id: e8022011-e160-457b-5257-08df0464beab
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 17:58:05.3126
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qcf2oAJAEp2eNCEUK0tl8WSy4ZacQNt0pwYFaq9Sjpq3EZU5HTfjGq2KvE1s5wvr9pMJGEleFc1MhI/epMJenZfcRZu8R0xX4o3Cn4A7I4U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAWPR11MB9783
X-OriginatorOrg: intel.com

On 8/27/2026 4:34 PM, Mark Brown wrote:
> On Thu, Aug 27, 2026 at 03:15:05PM +0200, Cezary Rojewski wrote:
>> When streams are being initialized the memory allocation may fail.
>> Have an error path and return early if that is the case.
> 
>> +err:
>> +	snd_hdac_ext_stream_free_all(bus);
>> +	return ret;
> 
> I think this needs a snd_hdac_bus_free_stream_pages(), or possibly that
> should be pulled inside the cleanup.

I agree, snd_hdac_bus_alloc_stream_pages() situation does not look 
clean. However, I'm leaning towards adding an error path to said function.

If a call to snd_hdac_bus_alloc_stream_pages() fails, I'd expect BDLs, 
bus->rb and bus->posbuf invalidated before the function leaves its scope.

That asks for a separate patch.
