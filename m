Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAE2739EF05;
	Mon, 30 Mar 2026 08:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774859341; cv=fail; b=jVaOTKBhpVYpr+xT51PcpIxg0xzxiwPxQx321pX7KC6TmZlyXXukqg3/K8WyBk3DnleWipuaVIHwbR0GsOFGFs4hyoDv5WQ2mQT9fWa52VJG0hq3hCDF9RJhkKJ6tiU6MgCFBSxNb45Ah03zQAkh+enkv02moOQ2gKUVBYfmx54=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774859341; c=relaxed/simple;
	bh=ypOhcl8HK56h3busNg679DYps+WDhfgAgFvGcvAZ51g=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=XkjP/cOw+pwzpbW6kmqBoEIP6qwqEZ3t8CtF8iY0t67C2TCBFVKMsc3L5bNk4k8rmfNtgi44mWQgpl8kXPaavWpMeuA5glo3x8WjIyPy4y1jDTQ+ZfgEmfdZdAdK8Iaz1k+COHj8/Co14E8xfG7BnaQjixLJfUYbnIpztTkt/hs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dnSKIcKS; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dnSKIcKS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774859341; x=1806395341;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ypOhcl8HK56h3busNg679DYps+WDhfgAgFvGcvAZ51g=;
  b=dnSKIcKSnNEd2P1lh9VdYcWH7xdtCZpH0KzCjUtMifjnrIA1vKL9UpVU
   HSBOsIgUR7ec3NndkkrkiViQ4KUZffK8vlu/j/UtltQSsOj63LcTsepco
   tNMUupTE/xJke8CIYMiYvRdc0qAlbkJPyREhNLKnEXdSTrY7/zESTbxpc
   qUT4NzylV1qz7q3KRJU98rFP0YoRwIaDH64OdNfhZemcSBpCweBpB0ZFh
   PXRVF+J6k+qIKZK7soi+IPS1o16szM4U6abfuV33toCwzwAdwbnopK2XU
   L7TDBuFTB/xNYr5korkYPjeE9JIOmx2H3no6Rh1HJizlOPbNYbdUVnII3
   A==;
X-CSE-ConnectionGUID: DY4ugznRRsCtDVza0kypXw==
X-CSE-MsgGUID: o2r4sylvSiC8xR22dKsgow==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="86918526"
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; 
   d="scan'208";a="86918526"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 01:28:55 -0700
X-CSE-ConnectionGUID: 6N4jk1pqRQqTwVqgz1LjYA==
X-CSE-MsgGUID: TXKSS/F2RIOB+O5sLqhEyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; 
   d="scan'208";a="230454427"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 01:28:52 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 30 Mar 2026 01:28:49 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 30 Mar 2026 01:28:49 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.6) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 30 Mar 2026 01:28:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YdngpKeRjx1dIttiiuTWp7LFrARZjXAN2UXgo0vwfuLZgJhud9Ooh7USqpjBBl606VzPJITn0AZHVxCyZ8xFV/yXhSsElCWEIlyduo/n8GzSYOjuedV/iXZzN4pzfFrynvL3Y6+7zcTtzPfQZR2VnekmUwmMK64lNNvDWlgnhKu0gVv8IRgvaq8vJk1GalAgRX88dxE7djxmQhLtwf7xDNSdy7uNR0v8wEz8g7ajc/oncLnuqDGfPoDuLhBMZlwV3FhSrkNq3SxL9uJjJweqxFXTh5R61zrMh6uvH7u5QBDAj63dfwCrgzkIXw1Jr0Zq7OT7DvAIXumLUQFmAEzVaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TvdLf6XHJUeeHQ5BlSbDLea0q+lgmXHWR3khAXh6tQA=;
 b=drvcPRppoh3m048MmOoP2FKlDCLWYi3mGfoZypJOOXSVja8XD6JQLZUSHYqgUksCYhzMjuP6eaA8q/3SttqI8Z/HmNsckdrz0DKczU6KL2nGyTaNPxBfZbYObcf3PXqGeXllnVItCSkv1YWjpTEEi/rF92bNJKLs0xhDvsBCLVNQUiqVn7MKZe8+i80zGdmB6E7COUvIvWHx53g2ERyrKomIc/g+9FUqKboAR23ZwI+0du7n2H9N8QXnMygHVnJu2VVPedyCMvXRwaq/h9Txr/LkoR0Yx4hTbv2ykqaf5Jk7qs3IO8xbshk+kwDf/z8WFIf6b6QCT2HzuEJId95a8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8283.namprd11.prod.outlook.com (2603:10b6:806:26c::16)
 by SJ1PR11MB6081.namprd11.prod.outlook.com (2603:10b6:a03:48c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.14; Mon, 30 Mar
 2026 08:28:46 +0000
Received: from SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::d18f:6b38:584a:214]) by SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::d18f:6b38:584a:214%6]) with mapi id 15.20.9769.004; Mon, 30 Mar 2026
 08:28:46 +0000
Message-ID: <61c0be50-831d-4633-901c-82c81d25355b@intel.com>
Date: Mon, 30 Mar 2026 10:28:40 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] ASoC: Intel: bytcr_rt5651: Fix MCLK leak on
 platform_clock_control error
To: <aravindanilraj0702@gmail.com>
CC: <liam.r.girdwood@linux.intel.com>, <peter.ujfalusi@linux.intel.com>,
	<yung-chuan.liao@linux.intel.com>, <ranjani.sridharan@linux.intel.com>,
	<kai.vehmanen@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<perex@perex.cz>, <tiwai@suse.com>, <linux-kernel@vger.kernel.org>,
	<broonie@kernel.org>, <linux-sound@vger.kernel.org>
References: <20260328052556.434191-1-aravindanilraj0702@gmail.com>
 <20260328052556.434191-3-aravindanilraj0702@gmail.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20260328052556.434191-3-aravindanilraj0702@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE0P281CA0031.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:14::18) To SN7PR11MB8283.namprd11.prod.outlook.com
 (2603:10b6:806:26c::16)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8283:EE_|SJ1PR11MB6081:EE_
X-MS-Office365-Filtering-Correlation-Id: c7fa758e-78c6-440f-0148-08de8e365c4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 7NA59pCvLuN8hznJQ6BPkL0/0yXzeLaqMYOW+JV95R7Z4U1GSArez+BwLAKuKAhpAgnCH3eOBqYpOhSe+jMGhPsyODtIStGzQApXPaS5jlhq6nue1z0kzw3Id/PJZYv6vcIrXBbJ84+MB9kXURQ/2yhxXUZ20ZUa5EgF7ovIqvDu8NJ265aJV7zB4RuqvtLRkM2ye1JCgiVzGyBGHS1aFEsWtNi3lTfL0uVd7odSTcTpo0j7ERkQkPhEdYO5KLtu3KxVUNw1ygUXnbpjQ0uG6+LirTj01rU26/nbRLAh+JEhZAByEdpwu7dDOsP48HyfoMoC4ColeyreJyA1G3Ja0NWW0YuATgzmJLvUA9Y9NEy3A1F1ZsLvNpBw2uD4+tSJlQcbjgzTcGw9ii1ScOdxLp9aJyaQng1PW+ZFdO0vq8ijgSEmuUttjIl7toECSUNqDDGxGt6T/CnguUuYhPrbuVFd0JxSkh/RNR6U3CeCQHBRA0jH0XkjYqGT6oqxwbDD4iq2KHrklVavvNvQ8UhG1hN7mL4z3XWPz854wxHuJg13GcYXigg0KeC/bcnrrMvn9MJuMSXDS1Ev/X8C6kq6IpPTfEjJQUhMA1N9nNSQtb7+WQGUWHfWXP3MAdrxc5paANNeWQctq/e7lwIQxdlKV+0Fl3CkikIZ8HB6n7UNA2M/t5T6/LTzr2N4WwS6zQ0juoJi7qvAQMLeGE9rCmXmB25FzivHYuwfK/tb1IpnahY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB8283.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MXRiRnI3dGgrZm9CQ251VXRiZExRK3JMNmFVUDIybHN1eTlQTWRDYnlLcXQw?=
 =?utf-8?B?REJhTHlSRk5uVkw5d1JqNnk5cE5ReExmOHdPM29RbWk5UHNVc2F2R2VTTXhu?=
 =?utf-8?B?RmpFSWxNenZ3U3UzemtEYUxVaERSbXVERjdJSC83R1pqQmpIOGF4ckQ4RGlV?=
 =?utf-8?B?NEJJbWZGVUNRcDZ1Z05TU0c4Ulp0ZVlXM3EyakFyTFdOTHZOaGtiQ0FhWXBJ?=
 =?utf-8?B?R1FHVDJ5c3JtaEtmRlhBcjM2a083dXZCbWdaZ2JWRTZpaGo0YTFHR1l1RDVa?=
 =?utf-8?B?MEgwYlR5dDdoSFNvNkpEZWJiSjZNdFQyYmRzOHJIOHVNSk82S2s5TWE2NTBz?=
 =?utf-8?B?akNMNGZ3T1ZBZ0FYeVovZ0pPdTM5ZWRHNmlJMU1LRkxJWi9mcmFtZlNOeXRH?=
 =?utf-8?B?NHdCUjBaNmNsZWVIb25OODFSMnNGbnBvank4MjNoNVJtOHl4Vk45SmhkSFNS?=
 =?utf-8?B?NXdEdDJHcDJQYnIyZFFFbnVKY1BIOVl4bzlDb3pRZzNNbU5yK3hBOWZlZnR1?=
 =?utf-8?B?amE4bEpYOU1TMUNhdGFGNFhVQzhQczRkR0JXcGVjb0RQcHZONE1JbzRXZlBm?=
 =?utf-8?B?OVV3S1NzUjVvWHJDaG4xc0VaWDAvL3hBRzZjS2U0MFBOM1V0cWpZNytrWmJr?=
 =?utf-8?B?V3R2Y21mdXVlNUtISE5hKzJxeXcvWTlxYXZ1eVBQWU1XcGxYRHJtUGdYTXR0?=
 =?utf-8?B?WHppYWtUVlFoV1BYNVFzdVFZVVpKVU5NbkFiYjlNR0hZeUNUQlA0dzIxa3pU?=
 =?utf-8?B?d1k3S0RGMFdMV0NoMHBPQk45TTBoZWJacXBETlhEODlOQjVZRkVtNGhkQkRp?=
 =?utf-8?B?YnE5bUpZMTBzNEV5aGREVnhOdy92NytlNTVkWVkrajVKaGpsUXVvM1R5Q09H?=
 =?utf-8?B?b0JIQlNaRjVlWmdjTHpxMjVPSXM4bTVOZEREaEFrMk16NzM2NWphcEx3WlZX?=
 =?utf-8?B?OGhGcXA5ZzdhODAyQ05TYm9uUW84M1RTc1lKWVVLZWhySDhBS1FGaFlVMERC?=
 =?utf-8?B?cDNuZ1BzS3NSTmRYL01IN0NDQXRabkFjdjBEbkhXbW5KbzkyUDVpMEtPcEh1?=
 =?utf-8?B?Q25IcW1NYThSaWw3UDJ5c1BxSVFSb0lKSkw0YUIxNmdDbGM4K3BaWGs0Ukpw?=
 =?utf-8?B?MTJ4Q2k4aE55ZjlxMDFuajBCTlZaT0ZFT09GZFlRdUFTYzJnNDVkb2w2RVNG?=
 =?utf-8?B?eFRpWitHWncyV2hoL3c4elUyMm9rRGhCYlkwcnZab3dRUG5JYnVacUhIWGFL?=
 =?utf-8?B?KzZJTGgrY2owSFV2dzQ1WXdNUmN6S3ZGQU5PMlVZcUZBQlRlWDZSeVBLQzhx?=
 =?utf-8?B?U0F1eGNJZDRRNTdhYTU4RWZ4R21Zd281bGNzeTZMNlRNRXZOcWtSOG43VVhm?=
 =?utf-8?B?OG4xZysrVmxFNEhQK1BKTnlIMW5WVk8vTVBOd1k4WXpjRG8wMXE4cXRqV0Qv?=
 =?utf-8?B?b1B4Q3U5MldKSDQwZUxRSFkzTW92RzkxcUM4L21BTE93dEFlMlA1S3ljYjky?=
 =?utf-8?B?cTFIZzJwYVprTjJxcGh0WGtkSDcxaFI3Y2pJOWV4K0xOM0tKNmpaalVKRTFV?=
 =?utf-8?B?S2k1VWF1NjBha2pGaStuV2YyNHJuZ2c5WXoyMHpiaUlUcHB4bmQ4Q21Db3dK?=
 =?utf-8?B?cEw2bm1GZ0hTNjI0UXZYYkNSRVBsUzRIVWtCRWRpZTVRR083cXl6TW5qOUlv?=
 =?utf-8?B?NDhlU2lUdkM5VFAydXlEV0FaQitqSXJTUC81aWpVbDNhVWZORFNEVzFnZVpm?=
 =?utf-8?B?RldZUFdLcG9qTkNBdTRweVdHamJTd1RWTVRwWmFiUnM4dzViYjg0OENQS2kv?=
 =?utf-8?B?V0pPbXNWUVlvaC9jT2EyUEhWSXRwUjdLSWpUMjhyYmIwMWJPRlUwSng1L1p4?=
 =?utf-8?B?UjF2NEt3QlhINENOYThac1dwdEhJdjZWbyt5RVl6cVcxYUw2TnoyTi9OT1Mx?=
 =?utf-8?B?UW9EQyt0eU1FR2dJZ3RKcENoRURSWUpSa1UreVQ2UjJ6Nk92M0MxejlVaFox?=
 =?utf-8?B?WFMvWGpKMnVhcmpUYVR2Q3ZNaktTK0l0SEFnQTdCUjRMdWhJRXc5L1JmQUY4?=
 =?utf-8?B?NGpGMGFtbWJGZlhpVURuQmM5ZkJxL3k2eUtRRE56SG5JMUZZRHhZVzBXc3cw?=
 =?utf-8?B?RUoxSjYvRmJnUWZwa1d6alpLZVR3Q0EzQzN1RW1TdXJqMGRBR0R4RERrRGN2?=
 =?utf-8?B?M2RaeFg2dUtUbE03bkQ4VlVtSlBIcklkRklzYjdoeERYZGtMZS9WTUFtWXd5?=
 =?utf-8?B?T0NSNDRydVBVZDV3ZlVLZ3FaRm9WSGk1alNYMktKaVZIVTJDWmcveHUrQlM1?=
 =?utf-8?B?b1ZwRXN5QnFwaXVraUlDWVZMMi83N2VVL0xscVZMLzBXeEJQYzJYK1FVR1Za?=
 =?utf-8?Q?KiU2dIWODjkYpDWw=3D?=
X-Exchange-RoutingPolicyChecked: IBhLufQjZfPjXUEAVNZ7IDNnW2Wv6xc74/u20UuH2VstIiS1JkwFB/XykAbkhZOi9WCKijDaUnerTx1PygOMyfNE+8PtIEJNcXdVe+XkpEsYixcTlFguYeTZUokxS3xa+4L6id557NqoiUaLchsfyAVOO99JtdE3BLotHyslVAEgh4Kk05lvN2koPIeXCV7sgeW5rfxQEJ99fNHzoX4M2fQW41n6QED7dKXg3zTg75K62xQZN7fSw6XQGI6w+/ynMjzpE17ZyWoZyG+78gs51OPqvh5UT6++O4t8cY4Sjz3k5nCxSYaLsT+VxFW1k1iuOUGzw3JgWbz+1p70wxkpBA==
X-MS-Exchange-CrossTenant-Network-Message-Id: c7fa758e-78c6-440f-0148-08de8e365c4a
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8283.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 08:28:46.3254
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mivfE1fjnh+l2Vi1Q9B9BNnseLI7s51wNqXzcNMdQvsaWVYYZmmm1Evd+vMi0L42MVoK0sNgqV9nA/DMbZcp74+/MQTzLVm+yxogYAPcPmk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6081
X-OriginatorOrg: intel.com

On 2026-03-28 6:25 AM, aravindanilraj0702@gmail.com wrote:
> From: Aravind Anilraj <aravindanilraj0702@gmail.com>
> 
> If byt_rt5651_prepare_and_enable_pll1() fails, the function returns
> without calling clk_disable_unprepare() on priv->mclk, which was
> already enabled earlier in the same code path. Add the missing
> clk_disable_unprepare() call before returning the error.
> 
> Signed-off-by: Aravind Anilraj <aravindanilraj0702@gmail.com>
> ---
>   sound/soc/intel/boards/bytcr_rt5651.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/intel/boards/bytcr_rt5651.c b/sound/soc/intel/boards/bytcr_rt5651.c
> index 68cf463f1d50..65944eb4be16 100644
> --- a/sound/soc/intel/boards/bytcr_rt5651.c
> +++ b/sound/soc/intel/boards/bytcr_rt5651.c
> @@ -205,7 +205,7 @@ static int platform_clock_control(struct snd_soc_dapm_widget *w,
>   	if (SND_SOC_DAPM_EVENT_ON(event)) {
>   		ret = clk_prepare_enable(priv->mclk);
>   		if (ret < 0) {
> -			dev_err(card->dev, "could not configure MCLK state");
> +			dev_err(card->dev, "could not configure MCLK state\n");
>   			return ret;
>   		}
>   		ret = byt_rt5651_prepare_and_enable_pll1(codec_dai, 48000, 50);
> @@ -224,6 +224,8 @@ static int platform_clock_control(struct snd_soc_dapm_widget *w,
>   
>   	if (ret < 0) {
>   		dev_err(card->dev, "can't set codec sysclk: %d\n", ret);
> +		if (SND_SOC_DAPM_EVENT_ON(event))
> +			clk_disable_unprepare(priv->mclk);

Same as for bytcr_rt5640:

This if-statement complicates the situation unnecessarily.  Please do
the check in scope of "if (SND_SOC_DAPM_EVENT_ON(event))" found earlier
in this function.

>   		return ret;
>   	}
>   

