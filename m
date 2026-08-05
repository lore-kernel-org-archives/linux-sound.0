Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D32DF3515C7
	for <linux-sound@vger.kernel.org>; Wed,  5 Aug 2026 14:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785941299; cv=fail; b=L0/VMN665BpqwH3afdoTGhln6rgBSI9ncVC31psTIkXd23oDsCPlEJoeWyIGdJ8uECpKN3wfFnQfjynRWnSl1t/P37PTcEBRjKXpgPewzO+pKVKlBX24xXL0+i5yI9teWauIGgkeCDFrPHCcK4B17HBgLyYsRFN63hXpKVWax98=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785941299; c=relaxed/simple;
	bh=u7QUim8YBk+USljSPVJlcbuGJ+YtHPuctaFh6PaojWE=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=mWUooKZh8yX1ThVmgZeyrYvEkiFELeU5uCYF8O0bfBa9WfbCC106JtfMUQt2phWX9bsGzkZyvpY0wjyFN7IBQ0Ur7fvr1Th3qMGB93cyCq8EPe5Byq685CWwiFzNPKgJQoCjsmJ4S9AYylNDAmlO99Mza6Bh5XWtdS3sx+vjmvQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Md9UjtHd; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Md9UjtHd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785941298; x=1817477298;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=u7QUim8YBk+USljSPVJlcbuGJ+YtHPuctaFh6PaojWE=;
  b=Md9UjtHdRuTMK24AIODbYesWr6q/zpTNByHA7pOT9JzCbxnD3AEIsxwk
   JmzhLiBBo5Nrubu+EBrfBMBxdk3JbUC97ml4mjfpGRaoIHcCxX35t/nGH
   virqU4ATZprK7Yr7DB/3a1kBFxKWVsRJ+RaRsB9qj8qyQ0DGjTMoV2XWn
   6HgBohF2X2XS9BchbewHnyNfXQKVulJjUX1hQyRKZuj2xgICQkdz3Ux61
   5FSbUQ6JdmqArAARjhnKbiHw9g1cSlXjTDwMCpzL1YGo0M6w5WAzZV/XB
   5xzqOFVZSBByojuqPc2oCgJcYPVElBFZdDzIlWlIKquBc7g8uH6Rys5+p
   A==;
X-CSE-ConnectionGUID: 6q1RQA17SrmJjK3u8XLcsA==
X-CSE-MsgGUID: Q/BQGmfuTvOQg7m3ZX0yQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11866"; a="90191368"
X-IronPort-AV: E=Sophos;i="6.25,206,1779174000"; 
   d="scan'208";a="90191368"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2026 07:48:18 -0700
X-CSE-ConnectionGUID: Yp7wo6RrR4CQoGbIZstpHQ==
X-CSE-MsgGUID: 3E4kAETRSMSW0JiyOgAT1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,206,1779174000"; 
   d="scan'208";a="257525384"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2026 07:48:17 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 5 Aug 2026 07:48:16 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 5 Aug 2026 07:48:16 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.63) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 5 Aug 2026 07:48:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ipujPQzXC3IG3YA1L7JT41QnBLDfWlBBWIiedIDiyEtItcYNTEBSi/gQW6jDKkmmauRI7dg/nzmdofhreAr6RbhiE0JOkcE0fKC+RopfrJ8dyEGQlxMQfMLyIqZgyYI+s09gnhx87ruEjW7JPR1mpOVKDPMUe9688/A0bShV2vcYNZBikVZ+HFTa+DHaYQB7v69B2TDGU73pvR3ikvlUQm2DbI725uh/wq3rAC+B/yFSzNFMHrhDnXC40+tvcN46AyzwSfM/CB8qEGtrNl7l6uaSLsZMuQotP+ZZ0wRd9tw1t5z91Q9DJXZx2UNmrkT9q+rBgx0QotiiOw+jyM3KjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wlpZegYj+ukxE+INfxC80K8LDsI175ARRoHbf7fPJbI=;
 b=lEI93SeHp7XYCParb4MPILOtgegasaFp+S3ptkb6G8Z89dXpzErjZafEVtz9HdXvV8w36Pi5invJLImewg2y9OD01ixaA1UbeeX34GuSX4OkFU8EK3PIHk1PQaONa9RQ/HOlt66j2hrCJHWNl3Pkjmv7Fv6IaZf9YykMMcm8uvVN2ikSFlShNm4Wqhu7p4oVtxhvWQSruEtQWpk/FoZofQh5qtokPSe9+Ph8e/mB9U7iemctb0qvlHRnp7Lf7+Wm9vgxc53DK/wwihzH2lgnKNL3j2fT/TdaOquXhX/2xJgUWVhNxfzpGsBvybsdUTwwoWJ72ErQGoyR9ZCGVu2RFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6006.namprd11.prod.outlook.com (2603:10b6:510:1e1::13)
 by SA2PR11MB4810.namprd11.prod.outlook.com (2603:10b6:806:116::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Wed, 5 Aug
 2026 14:48:14 +0000
Received: from PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd]) by PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd%5]) with mapi id 15.21.0292.018; Wed, 5 Aug 2026
 14:48:14 +0000
Message-ID: <cfe701c8-f509-4f1b-971f-4a17c7a1423c@intel.com>
Date: Wed, 5 Aug 2026 16:48:09 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 27/31] ASoC: Intel: catpt: Use auto-cleanup for firmware
 loading
To: Takashi Iwai <tiwai@suse.de>
CC: <linux-sound@vger.kernel.org>, Mark Brown <broonie@kernel.org>
References: <20260805135247.670693-1-tiwai@suse.de>
 <20260805135247.670693-28-tiwai@suse.de>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20260805135247.670693-28-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA0P291CA0020.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::17) To PH7PR11MB6006.namprd11.prod.outlook.com
 (2603:10b6:510:1e1::13)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6006:EE_|SA2PR11MB4810:EE_
X-MS-Office365-Filtering-Correlation-Id: e62f5135-ee19-4c1e-2909-08def300940d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|56012099006|11063799006|10067099003|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: LFRAcvkHE5mwuB81q8oHE4nJ8aiKlyQ2ihCGwTIwIKTeTHgkvLtv5IiGOpb5mXbLrA3NDxBFGcj/I1hpcJ2dpbvzcqGlNXEuqvQISMnzf/qRw7vAp8sgliLp4PlLfOrSWeogfGGBAE1/JXElsZEcFbMV7/5+vEehshengNslIGe3g1SX/9ZJM9uZUMl11Wi3STv2R6ePh59B9/J3CLDRU4ZBfMnXf1LKZMMonCNUH4BP5w/k/pwsJSxYwqr5bPe0kAPJ7PQMsFsWF5s63mCcOogdzvTychfGGFTcjcB0tDUou3+GcmPdrp11JEqpnCaYYttPxKmK4XLwKEdFQ7NEpO7M3MOKvCAnvihwXaCHrJhJuDuMdvc7IqDc2qwiQ70TKkF+Buq8kKIUcgTMmjNBz0PPwaarkz9va8lVf3ygD0+S7pvfjkahAs2j0/x4vtwP74V8NVZldoSQkzU5zoWa23gADSDr0VZh7ETG5oH7oLcaV08jZ/aC8Y+jC8gK8jN/Ec3ZkVOmdpgqcyB2vTU9WMEVQ3ixoKxrv7bSV+yw+u3wevRaZ0sB9iaxNYm0pf/Q9Y80iuKS7laVhiolZ6fW9mlVZp2l6DyWsRcOmI40+bwv0ulMgf/iS6yVyBLxXlUw26L2HvFilt5IqGGvSKs7cvfxRFIpuBkeXoifRMF1YzY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(56012099006)(11063799006)(10067099003)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZUdWb2dpSG94MENEbm1vSUFKTklrdFhjSWNDclFUWC9OODIzcHF1WXV4Ky9w?=
 =?utf-8?B?TlU4cHRNMWxMTUJhUDQxcnVhdE8zWXBCc1ovTEJ0SFlEOGZrcS9hbFVLdDY2?=
 =?utf-8?B?Ly9GeUFBOXhLdmIxaTdBVlc3UnYvaTZWQ0Z3bjdzUkgwZUMya29oYXVjenFG?=
 =?utf-8?B?REJIam1iY05wWlNZOWdsRTV6dmJjRkRTVkpDQnR5NHJRZ09sbUd5RU5GRW1t?=
 =?utf-8?B?V2RsYUFTUU1JTmpBQ3B4L2d4NUIyV3RaTXg4M2RlV29UWGlQaC84Z0NCdFhI?=
 =?utf-8?B?UDY3bUZ5Sm1maG5Yei9NM3RSKzg5QkxiMkp4UGs0OFg1Z05jb1dlcWs1UktK?=
 =?utf-8?B?c1ExVHNVbnp6Nk5VU1cvSHprQlFBbW5aOU5mWG5HQis5R1Z0VTduUDNVRTBX?=
 =?utf-8?B?WnBQbFM4Mi9MQVZhS1poSWtWVjJldkNtM2FHWnc1WG1WQ05WY2wrSXhwdys3?=
 =?utf-8?B?Sjd2TjU3L0JOcXhyYTBPT1F4YWU3VkxhSUxYQ1ZnYktqNytoWTFyRzlyOEtq?=
 =?utf-8?B?RGlQdVBFMmdYa1c1cWVLSjBJdllWcnhDQldteTlnVGJWTWx0VTZydU1VNFBo?=
 =?utf-8?B?bkFwWWdXMytoSTB1QVdrb3lkY0NMV0poOUwzWU11L1lnS3BFQ2pWVTJpN1hL?=
 =?utf-8?B?Q1prMUNVWXRxK2E3Vk9zeXRNOUI0S0JiMFgzOGxDTzU2NndndExqZlFYS2Jv?=
 =?utf-8?B?N1djS243V1N5aTlsYmZYWTl3ZWc2NUE3Y0FDc1J0L2lPYnBpb1dUdEtSSXVI?=
 =?utf-8?B?ZWE1cHR1N1ZwQXdBb3FScEhoWnB0NnI2bTVEOU16OUdqWUd1Yzk1WVhXbnF0?=
 =?utf-8?B?Ry9jV0hTcUJLUkExbDN2WlZXc3Y0eWxQZ0NmVUdvRlBlNFNvUVhtNWgrZWtD?=
 =?utf-8?B?eUt3T3dFcENneWhJVU1zc1dOSGtzOGZFdlJ0cE1aK3JQMHd4bnZaN2s2WU5T?=
 =?utf-8?B?NWdsajRJcVRIM2Q0a0R0MDM4aXE1UERXS1h3WlFXb0NWcDFVb3FGSU01WEZB?=
 =?utf-8?B?dGg3eGpsTngzRkZOc24wR09TQ3lOZjdpRVhrT1J1V2YxdjI1d2lmRkYwaVRp?=
 =?utf-8?B?UDR0K3RMOFJJRkpYSUJxZGNBczNwRGcvTWkyN05QVXpnTElQL0V5RWUxZjhh?=
 =?utf-8?B?cml3UFRsYUV3TllwMFF3QUE1YmJIZkF4K2pNZDFveEN4TUQzVGZTWU52VXlL?=
 =?utf-8?B?UEVOOFVXTkRaVmtnUHRTRGtLSXdQYXpYWmpCdEZtYUZON1BWN3hsVXFub0tX?=
 =?utf-8?B?bUhrQWNFc3pzcVJnWXI1Q1c1RGdlL25QVUpBSEk4VjRab1g0cGRUKzZ3dU5y?=
 =?utf-8?B?N3lHUGU2cDFQTFlwcllpbGgyMVYrTUN6OHl3WCs3S2dzMndiclBydCtEcFNh?=
 =?utf-8?B?eUcwZlJOTlA1MkNzRmk3Ym5rdWVJVkdaTHpLMlJVRmVUUkR3blpCMDZNVXpZ?=
 =?utf-8?B?THVPNTREa0tkTDFiUnM4MitJR2J1V3JnYm1UY0VGSGljeTRBbUpHQlZoL1pm?=
 =?utf-8?B?djZFbE5vL2YrUXFQZUUrT2Y4bENPaktyczVrcEhhK3JWbWsrNFU2Q2o5eHJD?=
 =?utf-8?B?NWRhbW9hZkVoN1grTWhXa0dKTGEvdG1YT2I3Mm16Ylgrak8veU9rNHpxVldj?=
 =?utf-8?B?R1FybkxIZmUxbGtMdHZOV2VoQ3pkRHU3NlVrbmJxSWFTeVJ5K2R2dnhyMU0w?=
 =?utf-8?B?c09sZE1CNlhHZS95aDJpSXRrNWRxVUFpb3FaKzRRenJCZmZKOGR1aUlpSHlJ?=
 =?utf-8?B?YmlrWjg1bDZFTXBDMVhtaEVsTkRsUEROdXBzcThzTDBBUHlraHpNUTdYejFn?=
 =?utf-8?B?Y3VPTXZNQnAxQyt2S2N0V2hRdlkxbGtXVHhtalQ4M2dJWnBHbXpIcnA2ZkJr?=
 =?utf-8?B?TjBrUHZ4VUQvWkQxRGZrbTVBcU0ycmpYQVkycDN0V3RrMWpsalZDUHNuV2du?=
 =?utf-8?B?VkFxVnpiczFBK1JrVldRcVJqZlFWbXE3eVBjWm0wVTV0eHdWSW85RDJjY1c2?=
 =?utf-8?B?UVpZMnZXUjkxZG0vTGJReGE5dDNNeGVTQzBoR1RTVGNYOURDVzQzeEZHU0RF?=
 =?utf-8?B?YXhRMWxKbkxlcnBhc0pRQ2ZiNjlyT2NMbnUydDdvQXp2bFphTVdsVnJlNGlK?=
 =?utf-8?B?QnlPdVZnUkRtMEp6V3hqYVVNK0UwaHY0ZWRIUW9rREJBdDNEWnU4QlUvY2xv?=
 =?utf-8?B?dTFLSjN0Tk5MVnVjYUlzUVg0UXFBMHp6ejJtY3hpa1FRdjRERVhWUDlTTjlv?=
 =?utf-8?B?SnJIT1pYaU8wcm9CWk9YM3o4bXc4TnhjM3RFNGxSZ1NCT2FTbG5hMUpIUDEr?=
 =?utf-8?B?MUZJNjdoZkxsK2JObThKZ0lpbnpZTXIwZVZtOHpzUHg2ZmRiYVdVV2xIbUEx?=
 =?utf-8?Q?5o30PGot1XZ/15Bw=3D?=
X-Exchange-RoutingPolicyChecked: aI1BfCr+lputx0+TvZNGXJJZpVAW3yVaMRliA3WISYJhl0uR+dX9jYBC0q00k1ERUxvmpWEQCsXPpQ0fSYcx2siMUYBMBEiNvvmcYA6a2N/EcCGaPvEBYv94OelK7he6mjJV55n3nYSur6fbHQ3C0VrXiRh0+fg7vpw92XxwZh6K9WUTfTdCnMAGbdPiDc1x0BLDNxRkC/PZfczpXyvKdeuKxYq5Weji0hd60aXpwMfHoSTggZdHYIRyK06SfSJ2I0kA22eoRtmH7i7ROPY2HyPUcs8o2X+lEJuZsc4N6cQ9L5WqAVGd2myUa9W/X5ORT0+ztW20wPe+VDd/JL9SuQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: e62f5135-ee19-4c1e-2909-08def300940d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 14:48:14.4128
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O6JWCjP4gUk8kmqFgNAQ4f5rMFfte9QKCDeBuFOKqWB15jm9UWjF3FT6B52V4Kl9pc1qgoGHkhCW31qoumjdxxBULhp9Z16AalAD1J8UxOs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4810
X-OriginatorOrg: intel.com

On 8/5/2026 3:52 PM, Takashi Iwai wrote:
> Simplify the code to manage the firmware loading with __free(firmware)
> auto-cleanup.
> 
> Only the code refactoring, no functional changes.
> 
> Cc: Cezary Rojewski <cezary.rojewski@intel.com>
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
Acked-by: Cezary Rojewski <cezary.rojewski@intel.com>
