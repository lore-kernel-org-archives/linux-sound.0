Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F8B520F07F
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 09:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740563296; cv=fail; b=DmTGqCYc4m0PNyejQTRL6N2aoVHLytDT73NVuiWjw4n+Tw3Y2M2haXGrfXjwg0xa4qbXTaN1XD30DTB0MusLoaduj4p/MUNbDNLf588+YgnCWx1Mm8/yhmCs5+BIdOM/pSxOOFV1C5RpGC3FUkeZEH9aU3cXT9I+Pn/IwXFG9cU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740563296; c=relaxed/simple;
	bh=bWvyyxKLQulvwhsqVJPoSV69wCWEV4KC+mXKo/Zgllw=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=sigdZfiPG8E4Fc7z9AII3zWlsbnYEvs1dF4XslI+FMooR8At887jeubyv7OzD1Uam3SOq4ik+HjwvQnBrk3DLOnkMyG6sBDyE0DV1XljT7WMwHiWKN8kzR//SmNkCEkvpT7kaea8TuvTOFKdzOvYN8VdDOrLyGdr8hjuwbGHNVQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CSvEz4sp; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CSvEz4sp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740563292; x=1772099292;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=bWvyyxKLQulvwhsqVJPoSV69wCWEV4KC+mXKo/Zgllw=;
  b=CSvEz4spPY3l3aoc9bxRXZ49oCFpJPSaPHGzGz8aj+n6jBVDwEoojfZ+
   W80ZeeRstJgRPBvPb16WieEs2rVtQxJVRWGKfECDOxhEXmEv2euwicISI
   DSsWivVzyYFvy1x+3I5REY5WL+RVIvOLdOS3VwjQioW1XKup50eDtcQaD
   VDqu7zDUoS/IFF5pi2bZVpJStpJGbpu+jiDlaYbRFA5SWah/CI+eIQ222
   IaLe4VwwHOSj3o4TcinjTMgMXdf3NGZA2ILMUi/mqh9Dc3M/AGwT4jrXR
   mWyl9pQoMtcuAjQM+Z76idKnOhqBmYAvF5CkpMiMdmMvFuOtI5miFk0a8
   g==;
X-CSE-ConnectionGUID: aLw7m6c9Qhe5Dice9cC7bg==
X-CSE-MsgGUID: VHcOlVvTSF6AlFTHUhAZVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="66773451"
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="66773451"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 01:48:08 -0800
X-CSE-ConnectionGUID: mRuG3dz5RA67phwSP0g/ew==
X-CSE-MsgGUID: Tf82RTxlRG2cEgmS1JCz2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="116503216"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 26 Feb 2025 01:48:08 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 26 Feb 2025 01:48:07 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 26 Feb 2025 01:48:07 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 26 Feb 2025 01:48:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HFPFm3lIV1L+JAvyO1B5EPY+LUCggs+37bdWZaf/MER5IvpuKqKwRgqNCKqirHAwQ83KI9BIX/9kzmw9rYb8Ldd7+7CvGyvUnU7FbaZSYpm7jsJAflIWjfV2a/jwXHpbYx27Vvynb5RgNYly/cTa9NGbU0NI1UdRW++80GKYlax30Gt+xwasPZ+b6TI9UpQeI5GM1KZNOmxKm8QgvfIWvLgfAVHPsOUBP+DirxGvWoQSVn8tmBoX4rmQW8lhxG47tjjwoJC2XphaCdYYxTX+doUxXSyVvSd+34jnN2wQC62FhNQVdNOzEhnf/LWZafqJnmgc+Zgx3B1Baj8wnHLlOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GEHs0q5eGBgenVtsx/f9mMu09NXBiMOrqsW1AW69WFY=;
 b=Pts0Q6XgU9iF+7xU6yXw02/AmPEEdMNsZO0j06bIfVXjVZ3cZItADaFZ6KiTYcXdqzLn+fb26536MrexfV7x/p/NxQscJwwTT/LHTiLFGhIpPjzBLYtcHnLpvDhumAk0GVjKzuIVSr+0cnUFJW5oYy99j/Z/+wf/vvXz8nM4NNs+w4PZhc2Bdan2LuKpcPdlJoJI3hzYdWuD456wDm67SZuWj/Yj+KNyu17wb/e0WYwIuBF5UOoAtzVJGYg54JygngckGhba8zlV9Gn9fL6IYBW4Vp+CleNc8japL67onK+vzU7E4Bm9rmYwQUR9kD6RZBHTcUVeXjofrIrWyRhYEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 DM4PR11MB7350.namprd11.prod.outlook.com (2603:10b6:8:105::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8489.18; Wed, 26 Feb 2025 09:48:05 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cd01:59f6:b0f8:c832]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cd01:59f6:b0f8:c832%4]) with mapi id 15.20.8466.016; Wed, 26 Feb 2025
 09:48:05 +0000
Message-ID: <dc2cb52f-ecbd-4a9e-9a5d-0f927feab516@intel.com>
Date: Wed, 26 Feb 2025 10:47:55 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 24/24] ASoC: codecs: rt5682s: Update definition of
 device_id tables
To: =?UTF-8?B?U2h1bWluZyBb6IyD5pu46YqYXQ==?= <shumingf@realtek.com>,
	"broonie@kernel.org" <broonie@kernel.org>
CC: "tiwai@suse.com" <tiwai@suse.com>, "perex@perex.cz" <perex@perex.cz>,
	"amadeuszx.slawinski@linux.intel.com" <amadeuszx.slawinski@linux.intel.com>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>, Oder Chiou
	<oder_chiou@realtek.com>, "Flove(HsinFu)" <flove@realtek.com>,
	"andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
References: <20250220112643.3813295-1-cezary.rojewski@intel.com>
 <20250220112643.3813295-25-cezary.rojewski@intel.com>
 <121d215bcc3746ddae410f2f9c80e654@realtek.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <121d215bcc3746ddae410f2f9c80e654@realtek.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR1P264CA0197.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:57::12) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|DM4PR11MB7350:EE_
X-MS-Office365-Filtering-Correlation-Id: 13863248-ebd3-4bb9-87f3-08dd564aab09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YzZCMy9zTnpwNXBlQ3ZXRkhZdCs2V09UOFNxaWtQTFJGd3ozc2phVVNjRjdw?=
 =?utf-8?B?VSs0L1IxVzl6QzNwNk83UUZpTlpCS2xOMW9XS1d0WFFSYjEvaXR2SnlHN1FW?=
 =?utf-8?B?TmQzcHBDem5GcWphbjNmOG9nRzZIMjRYZUxLaUdCVjB5OGdkdG5XTUR6RXIy?=
 =?utf-8?B?MGF2a0NNU0F3aFBYM0Z5QVdvcm90eEZMVVkrMFJkYmVEVmdqVDdiNWZyOUwy?=
 =?utf-8?B?STBHd0o2MmQvTjRPVVJQRkFReW5VU2dsWDhhNGJzSWI5bis2SXRVNzlZUzZY?=
 =?utf-8?B?Y2M4YkJwWCs4TDdmN1ZYekJKeGJZZ0dzZFpXOXJSbkNJaDBiLzNVZitvNisx?=
 =?utf-8?B?NFQrNnJVeFF6TlE0Nm5kZEZMZG9tZ1B2SmhheVNwanpHbTI0WEtBcHNSWUta?=
 =?utf-8?B?bVE4bnUrTnlUMEJxUGxjL29RNENFSFp0SklTekhxditFWWthaThnYXN5VmFX?=
 =?utf-8?B?ZlpSU09Nem5LUWhoR1FFOStBOWxNYm1haHNQWEF1NWJwbVJ1Z2VJRmtwSzds?=
 =?utf-8?B?TXNPbFdaL2dhQWFycmE5TTMwT3hUbzF4bHZEL0FrYy9JZC9kNU5RcDVsVFRu?=
 =?utf-8?B?bUhWbVNVdjllNmlGMUpWa3Zlb3E5MFRRZXd5dkRabkpibktmNlJiVXRrdHoy?=
 =?utf-8?B?Y1diSnNvQWtmNmNCTFF2QXE1eEVvTmlsUmR6R1BKbFF1KzYzZVJkT28wemVn?=
 =?utf-8?B?bG5maXkyak9MUXVraG1CTzQ1UnNCNGhiby9PV3FwYWwrZG13S3J3dHk5VTRW?=
 =?utf-8?B?aUpqcVUvaDVWNG01bUF0VzA1QUMrQ3U3NjEwSkMrRWtOeDltZVIyelJMTTdJ?=
 =?utf-8?B?WmRSeDNXTVhHSDVXejhuWWtlc3BZdlZveDIxQVNlWlpaTHJ3YW9ZeW9oY2R5?=
 =?utf-8?B?Q2t3KzFHMnFmcGdjTFdXbDVkT1NSbjZBUGxMb1BRY2FQVUFRbVNCZWJhNFNX?=
 =?utf-8?B?QXNRK2FuaEpRZG5pUm9HVCtLZE1zaThqcU9qM3orR0RXN1JqSDhEZ0FqM2t2?=
 =?utf-8?B?ZGhFNHVMM0FYZm1rN3JBWkxmOG1qejFDaStDb2Y5RTdsNmdzOWRLYWlnbXp1?=
 =?utf-8?B?UDVuY2NTNGd6ekswNnRVUWNSYVI2VHI3ZlFFR0h2UWFYKzUwNWR1TEtpWWFi?=
 =?utf-8?B?L3UxeHRIcHRuNGdUTks0SXNIZUpKRW82SXRuTGx3bTI5T2poVkFHVmhLWlNQ?=
 =?utf-8?B?b2pHY1NWaVMxU001MnRmUnlrUGZZODlYbEw3VFRhbTZtbFF6OFlBdUE5blZh?=
 =?utf-8?B?b05PWmYyenRtUDlqQ3AzemtwalFLQUp5dlluVVhTQkFRa2FEenY4c2lNa3o2?=
 =?utf-8?B?WXg3cDlsYjROYytLeDlTdXNaOWdaMGtUYk5tOWsxUG1RNkViWnVkeXpqR3FW?=
 =?utf-8?B?Tk1jZDlHWHNGMkEyTUtaN1o5TC9CdW03VTNDeXI3MFdFUzBUQXA3RGlncXRZ?=
 =?utf-8?B?N1JlVU5XRHVZVzZKdjRHWHpYRnp4dytnV2d4Ymczc09FWUh2cmh5amcxQTNT?=
 =?utf-8?B?amJzclVhdENWSFdUNWovNzVmZ0xmaHhsaXBwM1UvRXBIWW93dkZoRFJJWUdM?=
 =?utf-8?B?dHRYQVZuOVNBS1Q0b1lWSnJwbnhZVXphQmk3eUxKYy9PaDFrTXQ3ZDRhcVc4?=
 =?utf-8?B?Y1IzcFJDdlBaSkdoaVlYaEt6cHRWYjJ0Zys1NE5abUdobVEwSzAveU05bVl2?=
 =?utf-8?B?M3lDVDVzSlQvbkFqOW5rNG50U01IT2VTQVhqczJoaGJPRzhBV09OSUkzM05s?=
 =?utf-8?B?ci8za2Y4LzVaVjNESjJXYkRKb3BvZXM2dURpejhrbEJsZXhpbUs2disybC9k?=
 =?utf-8?B?QjFBa0x6VUIzOFJmNER3dnBSUHdtU2FtbFRET2NNL0tEQXF2NkNucEdoaDRT?=
 =?utf-8?Q?auHirrnwnWJgq?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6375.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bHFEUm5lamQySVp0ejlPTWlaa2tGSjczbjhHUFhYZDFUbVhpMUdBODBPLy9F?=
 =?utf-8?B?YmJoZGVtNU9DTVhWZjJWU25Tam9ob0l3aXhpcGNvZHJKWjJHT2FYTEZNM25v?=
 =?utf-8?B?QmVZKzh5eTNHaXc4TmhQaURsV0JPcCtvTzhwUWp1M0pJcmVmKzQrTkxVRmVm?=
 =?utf-8?B?cmJpUXcySWFCczVONFhWTGdiRGZ5L0dNSGNST0p2QW80UTAwbThvL1hyVU5z?=
 =?utf-8?B?cDM5RkZCS2syZkVBcDd4TDNhZ2l1U0dvTXluOHdCRmlweTZZay9uMndzL3Fo?=
 =?utf-8?B?aDBGS25aZW1zbHZRWFlkSU0rMXM1MHhGYVhtNTByaTA5R3NCVDNySUJMQW9N?=
 =?utf-8?B?czNQYndBcXJIRVVwamY0WWJMNlZwdmVLUVBKYXovakNHVjBteHRhSnYvNWlI?=
 =?utf-8?B?TEw4c2xpNytNY2NMcG9BL0FILzJqM2VMSVV3UkpRSDdFanlXWU9ZSExWR0Ux?=
 =?utf-8?B?NWw1NmN5VElSN2UzOC9oQU96UFRsaFhnMDRhUzBJSjdjTXg4TkJTSm1BZ2tD?=
 =?utf-8?B?SWZyV2ZQNUwvZHRlWUd2eU1yTFlXRjE5VENHcEtSeFlpbFhQQTIrZElqZkhv?=
 =?utf-8?B?UEk5bm4yVmdWYzRZbUlNVjIvQWgvQzZQcFNjdHJBVVRIZEVtaS9NbXZaT29V?=
 =?utf-8?B?M2RLSVV5YUU2RklTZERSN2lCNlFnaEN2bXIvMXBOYUQ2R1BVUE1keG9aZEdm?=
 =?utf-8?B?dEE2SDFkVnhjTFZmdUdJYWFTUm9rQzYxdXorL2o1bXUrN25YVmI0RmRIUTVH?=
 =?utf-8?B?Z0VXaTVsbE9JQVZwclB4SkMzNW40eDNKZTVqcGpzSHdZVlNCZnpCZjBCQkZF?=
 =?utf-8?B?SS9UdHpqWDBxOWNRZ0Z6QzJNZTRKWFhuVmVMUUdjeTQyZWRpMEdPUmFDWEg5?=
 =?utf-8?B?eC9JNFFKUkM0ZnlNTVRKVFJPVUNrd0NvYlkyNlkzQTNXMmVxVFBqMHB5ZExn?=
 =?utf-8?B?VU0vWFdJR3FZcVBseG9TbklqcG9LZGdrcXMwL3JMN0NNM0R6dlI3NXI4OEM2?=
 =?utf-8?B?US9CRXMvNzY5SUJzcmJvWEx3L0c4RVRrVHNGTW1mR3ZFR04xZzdTWnQzQUxY?=
 =?utf-8?B?OENXMnRoNVA2YnpFZ3hpamtjWXhZZmtCK09EMThQWVRwd3B1TWRtdTlzZHhV?=
 =?utf-8?B?UUgzSlJZWUhrckp2NFVFVXg5TmtpZy9jR1ZoTldmS2V0Z1FIWHVnTjBObWRW?=
 =?utf-8?B?N3F2elhQTGg4NlFNZTkvU0pCQUNiNnVtK2tLUVY3VGpNV2w3VmJITnNQdXU4?=
 =?utf-8?B?M3hLN25FNkZVejlEVkROREx3SFJaQ0RnQVBUcDl4Mm9ibXZQUCtJWElOVUJS?=
 =?utf-8?B?aXRSTTRuMDRNTFdROC9Rb2tqb25NejZyNS9RU2VWT0JVcEN5TmVhK2xsWmtB?=
 =?utf-8?B?RFVaMkpXZ1VNcWhUdnlsdEM5MjRnVitpdytzNHpaelVvMTFOWnN6SkduNG45?=
 =?utf-8?B?bmJ3Qm85dVVoSFE0N2lGRGMwUW9SWVhpZTFNd3ZKR01admVaT1UrNEdNODRz?=
 =?utf-8?B?a2pmTDZYK0FZNEw4YTBmbk9QUEhuRlpQQmdTV3VMbDFpQWtaVVZRL2d2enlV?=
 =?utf-8?B?R2RPNnczTlJCODNjWFNRQldSOTJSYzE0TFFrZ2dPTElFd3lPZHRZVXozLzUz?=
 =?utf-8?B?WDhNaVhCRm1rdjVnOFNXMGVBNFdUT2hsWnlwOU43ZUg1ZGl3RG5ZcHBrUzdv?=
 =?utf-8?B?eGN6dytPaE9LMjQvSGd0djJOM1kxbVQ2RGhBbk9QZkd3aXQ3RHIwd2NlaG8y?=
 =?utf-8?B?dWFQdEt3djdDbFVKMitzL1dzaG1ud1ZYU1lLQUxPTm92UjJJRUtWMkJMZ3Mw?=
 =?utf-8?B?WXFYMTBNVkdTTWdjZVBnN05jQ0lHNlJkT1J1WG9sbzBHN3AyYU5BQTc4M2xI?=
 =?utf-8?B?WldRcmNPb2JZUG9PRGZBMGpUcGZ3WUZvSFFqNnNFVk81RkkvbXQrbklSMzZN?=
 =?utf-8?B?amx2enB6Tm9wdVgzVmNiT3E3Tk5XOTVJc1dvS3lybnVSQ0hJUG0wYjc0bXpk?=
 =?utf-8?B?cnU2ZFBkVmFPY2tiUVF2V1hMU1ZwYSt2a3Y4ZEpTYk5xZW9VeEZXVWpvdWdM?=
 =?utf-8?B?RkRzZ2x3TTc1ZUJOT1ZmTlJrVEg1SlVUWWZUZEgxdEFXcUhGeUpZUmNiSEFJ?=
 =?utf-8?B?WkxybXk1bGVpa2kwbjFmdUd1Z2pZYUp0OHM2blJpRHZqZWVUTzdTVTNzODlK?=
 =?utf-8?B?Y3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 13863248-ebd3-4bb9-87f3-08dd564aab09
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 09:48:05.5351
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0TjZRxb1lEfl2LyLPd3W4LUhVgs2OAR8Ysvp95YMdv44A54/mltp2Dy4A8AeGS2KwcGzMFXISi9k26GhwOBKzVRiZI8HkL8h2XHetLEHguc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7350
X-OriginatorOrg: intel.com



On 2025-02-21 3:08 AM, Shuming [范書銘] wrote:
>> Follow PCI-based format (10ECxxxx) for ACPI IDs by adding relevant entries to
>> the existing table.
>>
>> While at it, there shall be no comma after the terminator entry and initializing
>> fields with 0 for statically defined structs is redundant.
>>
>> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
>> ---
>>   sound/soc/codecs/rt5682s.c | 7 ++++---
>>   1 file changed, 4 insertions(+), 3 deletions(-)
>>
>> diff --git a/sound/soc/codecs/rt5682s.c b/sound/soc/codecs/rt5682s.c index
>> ce2e88e066f3..5ad0cc3fab7f 100644
>> --- a/sound/soc/codecs/rt5682s.c
>> +++ b/sound/soc/codecs/rt5682s.c
>> @@ -3310,13 +3310,14 @@ static void rt5682s_i2c_remove(struct i2c_client
>> *client)
>>
>>   static const struct of_device_id rt5682s_of_match[] = {
>>          {.compatible = "realtek,rt5682s"},
>> -       {},
>> +       {}
>>   };
>>   MODULE_DEVICE_TABLE(of, rt5682s_of_match);
>>
>>   static const struct acpi_device_id rt5682s_acpi_match[] = {
>> -       {"RTL5682", 0,},
>> -       {},
>> +       { "RTL5682" },
>> +       { "10EC5682" },
>> +       {}
> 
> The rt5682s and rt5682 are different codec drivers.
> The rt5682s uses RTL5682 APCI ID and rt5682 uses 10EC5682.


Sorry for the delay in my response. Thank you for the review, Shuming!

I have similar thoughts as for patch 20/24 and rt1015p case, reviewed by 
Chiou. To not dilute the subject too much, I'd suggest continue the 
"confusing IDs" discussion there. For v2, this patch will be removed to 
not block the merge.

Kind regards,
Czarek
