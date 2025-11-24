Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A8732C1786
	for <linux-sound@vger.kernel.org>; Mon, 24 Nov 2025 18:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764007571; cv=fail; b=hQol6NNbVoNnr3wOxRlIF9REE0Vjwpq6Q58cS/bo4txbBmxciooR/k4tSCxSrWSjbi6D+7WCsxe5/54hQrKID7VwvNrDKasIPA36LWOsfQqCfZWBIuTSYdo+hTvtjGMhk2WBQKHrG3BGTtYWIAcvJdSuwmnrUyz0nrk5wmT8VQE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764007571; c=relaxed/simple;
	bh=Wj3C8DmjfXeEjgsuwWB3SXKcg4viNFr/Lgs+O0bgvd0=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=pEwAcf+9q08H/rW9SBNUKS27Qt4U/977rJiJQ0OQPTZTjppqImJnpCGbYlXjMNe+9R9bXNCkYpKmthYmfat4BxYBGgyMQV6GRbNO7caB+E2XCFt4xvxfe5xnjVYUszrnp5Q7NuduhVvqfFnpUuRsbNkuhpZ3AmovBMFXQIwrE/4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ndjzgnnO; arc=fail smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ndjzgnnO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764007568; x=1795543568;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Wj3C8DmjfXeEjgsuwWB3SXKcg4viNFr/Lgs+O0bgvd0=;
  b=ndjzgnnOKa4XPIPRhsS5icwLC/KcIMJEKiSgkXH1cRY/GopC/1mGKKD0
   XFqVjkWLBK+22nSWFvDzXXP9pUr1S5YDJJ9Zr3mIeW1iXAJWWClUjrBHO
   fkXWTn+aKgHix2QARy+cgPqWiFyuI5JnOct3O803kzTOIlhvjflR4du1Y
   hU/Ys1SH1roD2SBVx/F6+dLkjRIKstuUBTogpwi/55Yy6oElIEt0P3/Fv
   uNvOO7Nm5qlkVZ08+NzHw4yRpsVqK2EraJGnCaYzRR+R+7GvGKJtvpwS8
   7Nbsy8n5jUo664ToYKP4vUDCojy57rqmGM6T6jk14HmXz+VczjZzc5PWc
   Q==;
X-CSE-ConnectionGUID: j+k1Wz/qSiqN5Y/+A0jSjg==
X-CSE-MsgGUID: BRiJfX+2QeaocRRdEDDYmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="53577083"
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; 
   d="scan'208";a="53577083"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 10:06:07 -0800
X-CSE-ConnectionGUID: s3va0e6mRuW9Uef0tA0c+g==
X-CSE-MsgGUID: b+HZ1YAAQuCRiw57d3PEDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; 
   d="scan'208";a="196561469"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 10:06:06 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 24 Nov 2025 10:06:06 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 24 Nov 2025 10:06:06 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.63) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 24 Nov 2025 10:06:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eBtR0QZbuDNnDTEQGh5s511FGi6jB+xIo13qNRoAcIkInD7Ew1icfXTgtd5+T7+Vg9/cHybQPq6kHoDCjvso4vR47u/AplZtI/FSelpP06ON8QV3VGG1tcBqXReobM1VUkANthCrK7z998t45IrFQsJrC7MEcSKAS+0j0ugOgAVArN4ET+yTuH5jut64GsDDzYOmqmc8m2tmvs8JAepvJP6p0rY+mJ7A3bDZjbFYKtPcZgJI6sA0zRway9GSxKDBM4hytwaT8lVnHGzOUsDTPUOdr8dTTB3V4Ke6JfwgnOxBDq7WQQ3+qXCxuQQGedKVkL0gVGvv4Pq77RNVVHw3Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mbo8ly7Qkv2iGfMqDOmHI74T3QFGN7HiQPDJY4rBVzw=;
 b=cqPCh3pcdGdQl+5+pK/j2ipsSwggueeSdYiJHUCEPql9SKcxXpUL9xY6WYT31uHhtszPoVPf1tMPXKcwQT3kPSxDJRXYQK7FxZ5JqL3woFbA1ENtEsxuN72AzvvMP94p92eRw+7LcBu1t9XLgNHUGV5O7Edt7WmwYORfxoWQhkO4tHXeIUvxIPDgN0ub52bwYmZqtLP4Bw/ZlaVUsIoIft3bOKszD6Ofujh9JTywxRwSN+BOjmrVfHnj/RPhdb02VNzdxJuAbp1iZguGZsuVFvpPtl6OJp2jjzMPxNWBClIKAuQqCziG6kk11Wk1PD4EMQIhLq6nTdCmX0ybglM8aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8283.namprd11.prod.outlook.com (2603:10b6:806:26c::16)
 by MW4PR11MB5890.namprd11.prod.outlook.com (2603:10b6:303:188::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Mon, 24 Nov
 2025 18:06:04 +0000
Received: from SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::3:e0a:87af:d4b6]) by SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::3:e0a:87af:d4b6%6]) with mapi id 15.20.9343.011; Mon, 24 Nov 2025
 18:06:04 +0000
Message-ID: <b4680b57-742d-4e2d-847e-fc8722cf7011@intel.com>
Date: Mon, 24 Nov 2025 19:05:55 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] ASoC: Intel: catpt: Do not block the system from
 suspending
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: <broonie@kernel.org>, <tiwai@suse.com>, <perex@perex.cz>,
	<amade@asmblr.net>, <linux-sound@vger.kernel.org>
References: <20251121114331.3841335-1-cezary.rojewski@intel.com>
 <20251121114331.3841335-6-cezary.rojewski@intel.com>
 <aSRuvUeGS-v2s8nT@smile.fi.intel.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <aSRuvUeGS-v2s8nT@smile.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0030.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::26) To SN7PR11MB8283.namprd11.prod.outlook.com
 (2603:10b6:806:26c::16)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8283:EE_|MW4PR11MB5890:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a0bcb47-c0a2-401b-eb73-08de2b842203
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a25FQUdJczdXcUNPOUdEaU1uekF6VnVmdEpObHFHYWo4aFk1QWY5Zm9iQTdR?=
 =?utf-8?B?R2ozTWYxR0w0TFUxdm4zVy8xOTMzQVAwRUxSSVVxbmpzb1g1ZXVSSFAzQis4?=
 =?utf-8?B?dERrdkJSYVJtdjBhUTMwQXNVSDFtNzZUWnE5NTJPa1lrbEl3OGNJMzJQUlpw?=
 =?utf-8?B?czhXNnVJWnFpck1zMFZLRCtxYmd4ZWhJY3FyMUdTUy91UEZSbGNrdytHOGdI?=
 =?utf-8?B?aXlSSFdUa1N0cUF3VW45L0pwUnZSM29lczAyZ0NRUEFRZTRpWWR2NGxhZ3Bh?=
 =?utf-8?B?VC9DbGhVeXVBZmZ1SXpXNElQM0tOWWkxL29ITFVWRmUyOU1yZzBHVktmY1Z2?=
 =?utf-8?B?cUN1RHl3Z09PaTdkdDZxVXdBUUozMW9vcGlraVdWckxtRVp6OEtBRnhqMk14?=
 =?utf-8?B?UGVRWktlc2dWWXM3OWlRbHhQTjJZYWV3Q0ZMcXVxQTBNVkM0aUlpRlZCZWFD?=
 =?utf-8?B?RDhCamZwZzFjN1BCNXBLbUFEL2pYVTA0SkFBZ3lKdnQwc3l1MlZidW5vOTda?=
 =?utf-8?B?YWg1ZVlSQWFHWE5iQVVSVTYwUEtGZUN2KzFpY055aTVCb0tsUmlNT09tYVZk?=
 =?utf-8?B?b3RPc0d4VGJHNWF3N0NOZ0J4YzBCWU1VUVNVU3puUmJMTkZvT3QzY0lQMUly?=
 =?utf-8?B?R0R0NUIwTWNaRmplZzFNZFJrS3dVU1pTZ1puSkk5K01tdW1mQ1VicEYxQnhu?=
 =?utf-8?B?WGFpVkJoRFd6R24wd0k0RC9Xb0RNVnh1dzFLMWFlUTdhU2dZN3ZkUW0vRlBX?=
 =?utf-8?B?Ump1NXg0U2ptK0pQU1FJQm11SXZQRE4rZUszMXczamxXSlIyYWlkYjQxdU9n?=
 =?utf-8?B?TERUYVNySzQ5NE56T0tVV3FIQ0RJR2ZMUU1KbzRmWi9wbzRQd2l0YkVGSkk0?=
 =?utf-8?B?NUlHVHArQ0tXS1RrWG5kQ28yYlAwZ25KUGowTnloVHU1WC9OSXNZempTNTRU?=
 =?utf-8?B?UU1vU3pkd1hzNVJiL1VCNmhuK1JwcnU0N2g5NEltakRHZnN2SUZNSUYvTEFF?=
 =?utf-8?B?aDJmaUJBdUpOY0VsMS8xOW1mSk1kZlVGdkZtT2JwSG1MTVZub0Y4akNvd0hz?=
 =?utf-8?B?bEJjbUo0N1BhVFQwOUxURGxuZHdVQ0wxQXZoVkRPeTVXaDRjekV1TWUxaFFj?=
 =?utf-8?B?cWRDTUg5anJhbE9zd0M4TWdnNGI2OXJnTXNmdi9uVCtGNGdtcWVoWE9pME1F?=
 =?utf-8?B?SUZhQ0NBNmd1Ti92QUZzZTZ2ZmZLcE4wd0ZTQzNSSnZNZEE0SXBPREV2V2o2?=
 =?utf-8?B?cmdEV1dFdFBFdzNMNE1iQlVWM3ZYRDhUVm9RdlJSYWFlRnNxem9hKzkxRHFx?=
 =?utf-8?B?a3FpS3cwY211dExVM0E1YVhiQ1VCdUp0R3NCbktGVTZOTm9Od3JMSUV6eVZ1?=
 =?utf-8?B?emZoQ0RmV2lqdVBtYkRNTThXL0lBUUpSRTBiaHRoNHZ4L0U3QStWUDVaUzQ4?=
 =?utf-8?B?L0EwVWIvRGZvM01oZWdtdm9UM0VJa0d4cWJzQUprVFlIWmc3aVZNTnZJOGFK?=
 =?utf-8?B?T1FzdkNZbDNtdngvM0ppdEV4bE1Qb1NpMnlYVjVwdUwrYlI1Y1dtSUpxMHJV?=
 =?utf-8?B?RjZrYnN0bW5iT0NrbkI4SFZCbWdhbkJqU3UrWml0YWRZYkk0NlBDYTBQTi9X?=
 =?utf-8?B?RG00anA5eWFpZWJjMTM5NnZsTjdMUjU3b2FuallYS2VqZkJzTkdQRnRobmth?=
 =?utf-8?B?ckRsaC9YMkdXMW1LVnRDbitIZ3grdzZ1WEVUMUMwV0NEQXVGUXE5KytIQjE4?=
 =?utf-8?B?VHA4SXU2eGlwb0NWanF6bGtxbXU0eGdSSTc3RUhNZ0JXV05Lc0xhTFYyV2ZI?=
 =?utf-8?B?bU9ISFU3R1JISFVWV2lURkZhQ3BaNHdJcjlvS3psS2M3VStQUHVod2VDUGVX?=
 =?utf-8?B?dUowU0xadzNyOWxkUU1MckVWNUpmV3VMbmI3eVRlTDhHRWUwZGVZNUs4aXhD?=
 =?utf-8?Q?uzWbzHp51cdBe/l6+kDaUFOmIazP0Fsm?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB8283.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ekpJRUtZaHlRQkdISXdranVJQTFSZXV5M2o0dE82clBVWW42TGZycmR0VGhR?=
 =?utf-8?B?Z004RlI1QVAyUCszSkwxU0JIc25mOUFQeW1uTVlBZ2JWalROLy9ncEI0eUc4?=
 =?utf-8?B?c0ZNV0x5M3lUbFVzSmRoZUNrYlpTUHpVRisrcXpIemMvZGZJbjNLdkxoVkp4?=
 =?utf-8?B?Z0p6b1E4alU2S1ZxOTZLTkxHcEVCeWN2TkVzdzVYZVNDY3BQbitVYzRmZFhr?=
 =?utf-8?B?NzlJNHNzV3FhZUsycW1jMHlyTjc5UjhObm52RGRDejYrRERHQjZzeTNuZ0xr?=
 =?utf-8?B?YTMzRUY0aGF3UGRKa1l6TGJrdC9aeHZsS1RpTXcwbU0wSjVndmYrR3pQMFZz?=
 =?utf-8?B?ZE0vd3kzQVV5MVVqTjBhcFpNN1ZyOUFscDNEMkg0ZGNxeVg3ODRrWHZPL0JX?=
 =?utf-8?B?Q3dEWGc2bFgwY1B6bEtycWlDeG8rcTZpY2NBSFdmUkk2VUpSODlRcFhJOGRw?=
 =?utf-8?B?MlBhM0JqRlQzaDdsQUJRSktZY0xpRThzTTZEeXdPeDQxYi9aWEJuQm9SVm43?=
 =?utf-8?B?cm5zb2h1Z2hWY3NWY1FrZUpQb3ZEQituc1kxd3JoSU9XUk9qMUErWXgxQUp3?=
 =?utf-8?B?eDhWOGtJYUNycmV1SmFEUStnVkNsczZrSW5LdkdqOGlFb3czK0VMRTF3Mk9U?=
 =?utf-8?B?RzhaS1JFUElnUTVPMytocDNEKy9rYnFCekxlRUxkWDJFZE00K29HRzlERUdk?=
 =?utf-8?B?OFFZc1RJa0h6K2tSYk5ZbStFNW1QM2dPSnh5SGF6ek1GdjluNXBNUmpWd09K?=
 =?utf-8?B?SWJBR2tzSE1uZGJlQTNjNkpxT0NvVkVqSWRiWHcyRnY3TFNqbUtLMUNUM3dm?=
 =?utf-8?B?TkI4aXA4bUE4ci9WWkZKQlA0YUV4VHlFbEJhRG1GQkVKL2NINHFCaWtkNmda?=
 =?utf-8?B?OFM0cTBKelpsL1l0MXJkSi9oTEtOUlZPRmlRK2RrUndpMUsxNDI5WHdXdEI0?=
 =?utf-8?B?b0R2L1BzSjF6U1Q2aDJadGtmVk44aVdTMldZb2xPQVlTZ0w3TzErMkppRXFC?=
 =?utf-8?B?R2EyajZZWmZmZ1hTcVNKYVRXU2dPM2phRGxEY25WdTVaT2E1UHgvWE5ub2gz?=
 =?utf-8?B?amFPTC9yQzFNc0VqNzdxeDNhSE4rd00vTXRZaWcxTENxNkttaWlhdDFFTEtS?=
 =?utf-8?B?aDFCWHBtUExGQjdZd2dnb1Q4d0lWRDdVRTkyS2M0WitsUHU2cmVUMzUwcVVW?=
 =?utf-8?B?aXpVQkluTzFDTWREY2ZsM1BBK3FhMUVITDFEVTQxRk9RYXJnSEtqK1ZiWGVH?=
 =?utf-8?B?QWE5L0cwMHkxSzQveVM4cXJQb3ZLK280VTZxRFAyU2Z2dmtZSHI4V1g1NGx3?=
 =?utf-8?B?N21xK2ltMCtGT0pLYUU5UDcwa1NVOXJGTXl6MUM1QVNuaWVtdlhWZVQ5dkRR?=
 =?utf-8?B?MkZmVm1GbzVzb0N3alVneURaVEF3RCs1aWZDQUlxWWcrZGZQK3paRmdVeVEy?=
 =?utf-8?B?dllndjZaK2FDeUxUUFB6Q2xjN3V3L2FrMlMwN3F5WVdNM1dwVzFzMEJidy9q?=
 =?utf-8?B?aXh4ZmJWcUh4NENZeS9yN3ZmOVNNcW9EQ0Zrc2xjNWVkb2tjYlBUQ0lCZGNW?=
 =?utf-8?B?bFp4UVlLUDg2TG5HSlg3N3E2ZElCNzNqRnVDbUZkMDZhRFFGbDhrbDErSlVI?=
 =?utf-8?B?VXBoRndUU2FOakNzTmJ6aFd1Z0hnUU9VeFBCbG5Ocms2SHJKemFBTE5ENDJj?=
 =?utf-8?B?RlFJTXI1T2ZSM2VEMVhlUE83em5ETUh2ZTZSQnRRaWhBcW1JQUpaTHZWVDlW?=
 =?utf-8?B?Q2wwNG5wSFVFakQ4R1dUVFBQeVhENlJmYXJXcWdGYVp6NUlMWXJBd2s0Z0pL?=
 =?utf-8?B?SjNhRFF3Zm1QRGxXblI3WjF3Y0gzeitvb0lMRXVsTUIyWm51dzluaDhsaDlC?=
 =?utf-8?B?dHBLTUNnVXd4RVAwSnpIazQ3dFQxaS9GaXVEQzZqN1RPNkdBb3o4Y1hsL203?=
 =?utf-8?B?T0lLUGRJREJhbUdyWjdac0lMN2JHK0l3cG5XZEN6Uy8wSkFIWGRVc2FSM0ls?=
 =?utf-8?B?dFNnWWRCV25BSGN5YWpxa09PNS90TUxKY2MyZEZ2Sm85Si96eU5YY1VhSFZk?=
 =?utf-8?B?bUVhR3Z1b0dMYlVzMVY3R24zcmdoRDA2S3h5SWxtZTlXdmxHVCtBRFJUWEVH?=
 =?utf-8?B?RG9NMGdWVEg1WWZnOTlxQ01pV0xqNlBnclB5NDY0amcvcm8zYUJhT0V0ekdm?=
 =?utf-8?B?Unc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a0bcb47-c0a2-401b-eb73-08de2b842203
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8283.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2025 18:06:04.1738
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kBSIULPW4tF86cZuGBAW+S3UPPPNq/Yo9Svnknq8CwKjATL7zVYinjDNliWdDMu0KzINo2QT5KimE4DhyGjos+0eH8RFyF/Nwo4UQOmswPk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5890
X-OriginatorOrg: intel.com

On 2025-11-24 3:42 PM, Andy Shevchenko wrote:
> On Fri, Nov 21, 2025 at 12:43:30PM +0100, Cezary Rojewski wrote:
>> Even if something goes wrong when performing suspend on DSP, from the
>> system perspective the component is not critical enough to block the
>> suspend operation entirely. Leaving recovery to next resume() suffices.
> 
> Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> ...
> 
>> +/* Do not block the system from suspending, recover on resume() if needed. */
>> +static int catpt_suspend(struct device *dev)
>> +{
>> +	__catpt_suspend(dev);
> 
> Can we use catpt_do_suspend() name? Or something with a better suffix?
> 
> Wouldn't be useful to have some debug message to be printed in case of failure?
> 
> 	ret = catpt_do_suspend(dev);
> 	if (ret)
> 		dev_dbg(dev, ..., ret);
> 
> ?
> 

No problem renaming the function in v2. As for the debug print, 
__catpt_suspend/catpt_do_suspend() would dump enough information 
already. If I get failure from powering up DRAM/IRAM banks or an IPC 
failure, additional "failed" message on top won't add anything useful.

>> +	return 0;
>> +}
> 

