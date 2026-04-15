Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C6A433AD8B
	for <linux-sound@vger.kernel.org>; Wed, 15 Apr 2026 09:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776246293; cv=fail; b=aLPUSh4raGJxm/9ih+MCgfr58KPHRG2fpbh0Mtj+2YiG0MoSeUBR0mEHERKzrparfSG/j7LZk7tZGsMD659Ym6RPf3FC+VU40cGEeW4BIk5alEV6FlEPm1vxrvVmaltSXOg/vhPtvyxhiWUnz7WH7/GmIe1amxtnV+8pn6CCzLM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776246293; c=relaxed/simple;
	bh=RLQ94ZflprX/g4fVylCFkDRexHNuQKZAkzmudYB5SGU=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ZD9FXkz1atbBbf6Y8+ooqNHdheGs7V4sm9MoBbgYxHdmvWTnrvqUi8XeZ53z4GzJVEM4ra6Gsfk98Ch4eCWQScs2Ea+3I7Vi4X9lq3Y8NHAO8xQMhxi6F30Q4COyCEwoh39kL8DpnGeo0SgwN+cpDbo32nPb6Kxov7oefSplF5k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QujGo+kS; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QujGo+kS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776246292; x=1807782292;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=RLQ94ZflprX/g4fVylCFkDRexHNuQKZAkzmudYB5SGU=;
  b=QujGo+kSgcqxXzWx3fDLT5B1KpWUwOORDBrrbTKn3/iqyZ33ClDBWTJu
   Pb88hvS6UCuXjGsYr3xwoUnwNWKaBq7wRJcjSZQ8/1aOebNS+3/3rV87m
   S6Jk2X8GVMQoN+qp4q8bURmEhQwBShD2d4OGB/R/yHCd/S61QO6TG/jur
   y7nYjBpTdyO3uX7Og8p5nOY+4W4OtdOErdML+lJCG0PrBNjfpf5phpq7f
   FDKBt21NtzbbeRaUsxWPZWVdmdAhrGf41yHMuBpvP1KdDJqYyC/Rvwz2r
   Rb65WmDRKx27AQT2iiz/y2lhuKKYsRw4Sm7rwDn3kdDdjFHtoBVBnTl+S
   Q==;
X-CSE-ConnectionGUID: zwKagTd/QSaewjDAt0v8ZA==
X-CSE-MsgGUID: D5K3U0OyQpywf7TEYiEVkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="102676766"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="102676766"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2026 02:44:51 -0700
X-CSE-ConnectionGUID: d/kjB7v1TxeamIalFgzBPg==
X-CSE-MsgGUID: ppljeB1tRkqqxTUfjkLmQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="227728198"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2026 02:44:51 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 15 Apr 2026 02:44:51 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 15 Apr 2026 02:44:51 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.44) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 15 Apr 2026 02:44:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mbrOxKuba7rQPLmLCBvJL6o+vLDZeNLdWBSXPCvqtsj6KUKxcevMzI5PBCUHqYqPLpfvTwOwg9dozsd58NOFak/XvUM5KwY8GyXXs/FJhyAzo3r42GRZx9bCjHkCgixw3cqGVBT9H0LGd+Ke4KJJANz7MiUEdJaJe0CePIWLTuIW4QZtYUcTDcQinaQNXO70orOzQTIKc0Rv3/jQOqsU8I4Fmy1I/7q4NTTfk1wBgx6A9FsIajtntKI3lFxgMYP4CLirURRUFdDPzMaOo5b64DLfR2Yu4G+DKGUZulfbvDxCJxYfy7KszPydu+texI8tRuxIBdY9XFLKqklzJwYJ2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QcyAcX7wszXquKTAh+MS6sRlojoXAd09Two4X/v1p48=;
 b=ZNt3/J3aj31kaXKHbVQ6YUNHjbqqL3qiGfpcqGf6Q1oYSmXbHFcU76H2/727NfB8u1YR6tTHibOhQBzD/kd3VqnqgRpMEkBPezgaJBDqk9HIS+x+k0hYy0mp5toKfVgqn7DZxPFnsPWHdQgLBGR66uxnf75z+4MVhwM10+QORgVgkyegVi+nOMt4JOPOH/mHfLdmPqX6DRK46ja5s1oS+NxeNjgGvWY7fbBTUm2PpXAQ4bxOtej5TlqL/FKrxVMevI9xIokQmzn/VIlb16+ipUZFF9K5lb+MME7i28YtbCxVGvw89XZwa0ZZR/ETRxIBdaAtPD7r+zksD5i3bLoMhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6967.namprd11.prod.outlook.com (2603:10b6:806:2bb::15)
 by SN7PR11MB7068.namprd11.prod.outlook.com (2603:10b6:806:29b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.46; Wed, 15 Apr
 2026 09:44:48 +0000
Received: from SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4]) by SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4%4]) with mapi id 15.20.9769.046; Wed, 15 Apr 2026
 09:44:46 +0000
Message-ID: <8206ed79-823a-437a-9171-ec8f24291dd1@intel.com>
Date: Wed, 15 Apr 2026 11:44:40 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [Question] ASoC: Intel: avs: Guidance for finishing new board
To: Carsten Behling <carsten.behling@googlemail.com>
CC: <liam.r.girdwood@linux.intel.com>, <peter.ujfalusi@linux.intel.com>,
	<yung-chuan.liao@linux.intel.com>, <ranjani.sridharan@linux.intel.com>,
	<kai.vehmanen@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<linux-sound@vger.kernel.org>
References: <7asofwgi5xn2yux4nau7xvjibfokdzipxsmmjfkixs33ceguaj@22xbaftccepg>
 <80900a76-f35e-4959-a178-f66b718ab9cc@intel.com>
 <m3uuy5f4txsfi4wbocasaqpf64w23cxwobv37thxnp4nzmz4vj@xahbt6bbnudq>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <m3uuy5f4txsfi4wbocasaqpf64w23cxwobv37thxnp4nzmz4vj@xahbt6bbnudq>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR07CA0132.eurprd07.prod.outlook.com
 (2603:10a6:802:16::19) To SA1PR11MB6967.namprd11.prod.outlook.com
 (2603:10b6:806:2bb::15)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6967:EE_|SN7PR11MB7068:EE_
X-MS-Office365-Filtering-Correlation-Id: cc8327d2-afe2-4f2b-161f-08de9ad3a108
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|56012099003|22082099003|18002099003|15056099003;
X-Microsoft-Antispam-Message-Info: yQGRkBJCcngKq28zYLy5DOBQ8/mDhFm/LEXzQxsPYj5dZZXKRt98MW2bSg0dohSP1cQsogpP8NHFxQ1kFDaWe30GT5XIGF8c+umyv1VP8vFp9mOYt0aCkG8V79sjyVgH1EYlkXhozJ9Wwf9G0jTndlpvmvA8S+8OuE5trOfo7qpsPQjwIivpY2LhhZcOeY6sW4/5kyXiFD1ZLWJHJ2+j9XerDgJtc4dEbfQUu3ma3SETeyuofj3UKMMtnWeTg+LShrCbiXleloBWMVmkOe5oMtN6ABuPcK8NO4SxNtVe8MApRqeN5xOdxfxEzkyZz3f0R3cdXdSNzqVBqyiBho+Ge3IgKHXikXOp4G0D8I8fTNorumGLisuKgcjzn+iOh5LLZ43IBI+pkUFp/kqltbL+ywvU7CHLSQihp6mttu3E4yxgDgaHO91uBHKsUOXvXbypnFrn8N443xU8YrnOpbWitDwhfzR2ASh8hal17NtOF9pEUL62z2CatbZNVYQ6Ik9YQ2DJlC2kdGo3RmdOd00Sj5RMUgDuXyoAxjBSZmUxxYro0yNT+3rESdcr5rPQiPtCZwvjBXAlE1B99kl2PhsJvvATOtbY0jY+R1nvGosF8CstxQV+7e1PBpweqzSJ0YTpsjo6Wf5sdKNkSgnxgs8v7ata07eoKFrV/Nyn0C3GMWsa2evQGe5vyuZ9DN3/+vu3hbfVWb+oN9YXmDYeiQ2SP71vLX5fD14rlVkDFyYYIHoqVCefAwG39Pz82qxN+ejI
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB6967.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(22082099003)(18002099003)(15056099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TTZXckFqZElVdmEwaFdZU1Q3U1pzYitZQ0JsaytJaUk0Z1I5U2FRVCs2TXR2?=
 =?utf-8?B?bzF6SVd6b2diZHk1VVN5MDRua1h4TXQ1YXpiaHFRNUJuTXNwMVpZbHg1SFBQ?=
 =?utf-8?B?QWYrdmxVQmtuT2pBUUJubG9iUVBpd2ZGSkVJQ3ljZFRRWFg0OFloNHpXNE9q?=
 =?utf-8?B?c1ZUSlRidTJOcjNFVEN2MWJBZ1FPVGlwenpxalVYTllhZjZ6eWdQRnQrMGw1?=
 =?utf-8?B?STJ0VGQ5aG1nanYvU1N5VEI5VnozT09qanJQQ21jbU8wM040azR1V0ZJRGQ0?=
 =?utf-8?B?ZzQ5MkpPVUZDSDJZTURtNjFlTElINUdRdGVhQnY1cE9OTlN5dDRZd3o5S3k2?=
 =?utf-8?B?REQxR3kwaEowSUpGWkZDSDRYelU2Ym5RNFhrQVVaekx3czJtbmszcUtGM2RI?=
 =?utf-8?B?bUVFZDhpS3JLVHlVc04rZlRSeVdWV3Z0NlVGdU5VUjA3RzhyMzVsRGZ6WEQ0?=
 =?utf-8?B?OVBGcFplSEtUZFFYT05wUzJ3MGIwUjVUVWpXeENDaTBpVXJjNmNPbmpYM3Fv?=
 =?utf-8?B?R0dBUTJhbVRyZnk5TWtSSCtrbmd3VVc4Q0lwVk02ZHcxT09ucmVQRStzT0Zm?=
 =?utf-8?B?VUl0bk1zRmI4ZDdmNk93enhnMEUxTFl3QmMwTHh4emhWTEtvUHVDZ1BUVnBD?=
 =?utf-8?B?NFJZT24vSWdpeFdVRkpnc0hLbEZuTUU2cHNVR0c3NGg3eWJWRExWQ1NqSXhy?=
 =?utf-8?B?bzMvaXpKWTZRVGQrWGhzYURpaU1SRGdEOTg0dWEvYmtRNk54RWxzcTZTelpj?=
 =?utf-8?B?d2gxbkh0R3lnOStKdkFqMWEvUkRldTg2enBUOEVEV05tVlg0bXZsa0QwTkZX?=
 =?utf-8?B?UDBKckdZM2t2cFZGZlMwYkF0ZGIwanZYMk1WNHFOTzZrNCt6NlA5ZFBBT2kv?=
 =?utf-8?B?bCtxT2tNV0RwTnRvLzlZWDUvZjllYm5NNG91MVljQllMRGJOSVZoZUFJditN?=
 =?utf-8?B?UGJCN3ZhT0NQSWVGcW15ajdFanE3a1FkYlE1YjlIVUVjZ0dObndqN0NFWHkv?=
 =?utf-8?B?VGNvU3ZKT2VKRFNTUkVaVVY4ZGl2QUp2ank2dVVQRTB3ejBqTHNQbzNvcmFV?=
 =?utf-8?B?R3FpeUlMM3l1QnVLRmp4Z3JIOUxVNVMrVVB0MitKaW9ienA4eWo5TW1URzRH?=
 =?utf-8?B?TW1IaWF3alR1N1FEVnVVUERnME1wWDV2djZEWVpLR0xld3NzNGVxUG1rYWlP?=
 =?utf-8?B?N0RtRVIxVWNhRVd5T09PQ28zSXJqRytxU09BMGlNN3I5QVZHWStSMFY5OVoy?=
 =?utf-8?B?dWhBRjk2OHFML0I0dnB4cFptbDNnQjRXN1VpbVJZSWR6b1I3ZFc1TW9Mb0w2?=
 =?utf-8?B?a1Z2dldUd21WV1cxUVNPUlFIR21RcnViV1czaXVOaXd1OUhVQ09JbEYrRE94?=
 =?utf-8?B?TG90My9BdE8ydXpqMytHdXV5WVpxNVZuVVdla2ZjaWVtQ0g3OTVOWDBEcUY2?=
 =?utf-8?B?b3crQkphMUpZNVhXbWxod0hNZXBNdUtlQUFKWTVxQTUrWHpEVHhUOEpuWDVo?=
 =?utf-8?B?bFJZM1dPMmM1U3VjUWErWG1VSDRyNUFwcW10dnQ1WjE1ODBRM3BlbnNJd0Jr?=
 =?utf-8?B?dTZqVmp0a2VxRy9JOWpjL1FBQkhUOFpFYzdoK3F2QVhaSXhsSGJDZHIyNGh1?=
 =?utf-8?B?N095RmN2RUJtZjhVeTlxMC9UNlYvUE1zazc0TmkxT3N0dkZrUHdHa0RDbUNO?=
 =?utf-8?B?N2ZDc1ZrV0NDODM1S1I3dWlHTURaeTFJb0RpRzNTQTE4aVhGSEZpdzNPQnR3?=
 =?utf-8?B?UDM0VUU1d01KeXlLbGxreU02bFE2dFp2cjBFRlBRUHJVcGFldzd5NnFPRHZu?=
 =?utf-8?B?b2w2TVFoU20zemdUMlhSd1NBSUJGTDBTQ1BJUUhMZ0VGUVJiVkdBNEt5M2xs?=
 =?utf-8?B?eWx0VENOaDI1YXNGNXlMM0liQWIzamxIQzNmb0JzQnBkMVpEbDAyc25tRkJD?=
 =?utf-8?B?cWZIRFZCQTFUdHBIQkkybzkraFd1UUNrZXYrMDY1YmtRYld1T0did3R2Zm9T?=
 =?utf-8?B?RkUzeTR5R1F4RHFXUlV3UWtIMEVyWjJDczIxaGJ6MWN5cEpHc2FFZXVaYWdk?=
 =?utf-8?B?ZjlyUk8xbnVvL3ZSaW1MbUYyaHBIZzRTTkVsOFQ0UFVvVmRsNUwvOGs0dzlD?=
 =?utf-8?B?cWwvUGhkZzJwTzdsZC9tZW1UQnFjbUl6VGc0a016TmVDNUd2YmRlRUpYb2da?=
 =?utf-8?B?akVpVlV2cUJIaFgyRGpRNDl4Ty8yMHNRdXUvUkl0ZjJVaDVuTmpJcml6QUtv?=
 =?utf-8?B?Zkk4elNxaUhDMUtwRTB1QjduRUNCN3ZBUTk3dDF4bGRPWUJTRjNxNzREV2hs?=
 =?utf-8?B?UGFmZVpzd3ZuR25GYnZwczduOUFqVFQ2cmtjV1V2c09tTUpUNXVPd0h5cWlI?=
 =?utf-8?Q?feJpYWcxJaDgptvU=3D?=
X-Exchange-RoutingPolicyChecked: uyey+IYnXi6GT0Ft1L7oWQSwZoJxipE+s3Zj5vbV694KwlNOG2cKtfnFhCmSEc9K+xovvKqRXX0nsxBr4/dIQ1JwUBMlxi3yVQ20kTVpgM152ZLTQsYXAxe4+eYnZuY/OuhnOqjQRq3y66V02LCwTJpxnKbvXMeYOZlzlBQm/hRoT2qoC3NmrD8bk6sQ5MbIfR3l2v55LM1nbe0WZUisnZiANHmBMMvoQmw0pzUCsCj2uQbtFJEDbWawutc3ctyfeYJKauWGpV0HNt8QaiWu36ae5pzY+soqJ68hVNhZkD3ysWPXFKPcZyjiCtE1yPa9aOl2LUc5RAsCgzFs/jlfOw==
X-MS-Exchange-CrossTenant-Network-Message-Id: cc8327d2-afe2-4f2b-161f-08de9ad3a108
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6967.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 09:44:46.7484
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jH2W8h3mfyoISd63uEPVH0uu8yqgUs0O23IIwqpgWM4DnV3LoFDHtMZ10ahuBeDYo1aBT90TP81wFa5xb3kLCR/WOHL77/4cOrjC55JMidY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7068
X-OriginatorOrg: intel.com

On 2026-04-14 2:30 PM, Carsten Behling wrote:
> Hi Cezary,
> 
> thank you so far. AVS configuration is still a challange, so may
> be you can help with some details.

Wonderful! Challenge is what motivates us to move forward and improve!

> On Wed, Mar 11, 2026 at 01:53:49PM +0100, Cezary Rojewski wrote:
>>
>> The -19 error code states: -ENODEV, codec#2 is hardwired to HDMI. Summary:
>> probe of HDAudio (HDA) HDMI device failed. Some APL-based in the field are
>> devoid of HDMI and, if I recall correctly, the TASxxxx device is not a HDA
>> codec, it's an I2C device where streaming occurs over I2S. Smells like
>> invalid Audio settings in BIOS.
>>
>> My comment regarding the topology highlights the fact that one can overwrite
>> either the entire NHLT or part of it with ACPI tools -or- the avs-topology.
>> The error seen here _does not_ relate to NHLT (or the topology) at all.
>> Streaming over HDA does not involve reading NHLT either, your BIOS may have
>> no NHLT or an empty one and streaming over HDA should work just fine.
>>
>> Are you sure your device is equipped with HDMI? Seeing the entire dmesg
>> would be helpful here - could you open some kind of bugzilla or, an issue on
>> avs-topology-xml project mentioned by me earlier?
> 
> Sorry, this error message is irrelevant. My fault. TAS5722 is a simple
> I2S/I2C mono audio amp. Now I set up a current kernel BSP with that issue.
> 
> Regarding my initialization ambguities:
> 
> 1. At platform driver probe I observed that calling snd_intel_dsp_driver_probe(...) bails
>     out returning SND_INTEL_DSP_DRIVER_LEGACY here:
>     ...
>     static int avs_pci_probe(struct pci_dev *pci, const struct pci_device_id *id)
>     {
>     ...
> 	ret = snd_intel_dsp_driver_probe(pci);
> 	switch (ret) {
> 	case SND_INTEL_DSP_DRIVER_ANY:
> 	case SND_INTEL_DSP_DRIVER_SST:
> 	case SND_INTEL_DSP_DRIVER_AVS:
> 		break;
> 	default:
> 		return -ENODEV;
>    ...
> 
>    with:
> 
>    int snd_intel_dsp_driver_probe(struct pci_dev *pci)
>    {
>    ...
> 	cfg = snd_intel_dsp_find_config(pci, config_table, ARRAY_SIZE(config_table));
> 	if (!cfg)
> 		return IS_ENABLED(CONFIG_SND_HDA_INTEL) ? // <-------- CONFIG_SND_HDA_INTEL=n
> 			SND_INTEL_DSP_DRIVER_LEGACY : SND_INTEL_DSP_DRIVER_ANY;
>    ...
> 
>    so I set
> 
>    CONFIG_SND_HDA_INTEL=n
> 
>    assuming this may not be needed for my I2C ?NonHD? case. The other option seems to be extending
>    the config_table and returning SND_INTEL_DSP_DRIVER_AVS. But this additional code twaek seems
>    odd to me. But if CONFIG_SND_HDA_INTEL is needed additionally (for HDMI?) what is the way to go?

Instead of modifying kconfigs, select the desired driver. For avs:

	vi /etc/modprobe.d/<any .conf file>
	options snd_intel_dspcfg dsp_driver=4

All HDAudio related drivers co-exist with each other. You could have all 
of them enabled at once and your selection should still be respected.

SND_HDA_INTEL enables non-DSP HDAudio driver
SND_SOC_INTEL_AVS enables DSP-capable HDAudio driver

both utilize the exact same HDAudio library - code sharing.

> 
> 2. Later in probe snd_hdac_i915_init(...) call has to pass at sometime to not defer time out:
>     ...
>     
> 	ret = snd_hdac_i915_init(bus);
> 	if (ret == -EPROBE_DEFER)
> 		goto err_i915_init;
> 	else if (ret < 0)
> 		dev_info(bus->dev, "i915 init unsuccessful: %d\n", ret);
>     ...
> 
>     This only succeeds when
> 
>     CONFIG_DRM_I915 = y
> 
>     that sets the mandatory acomp->ops:

If there is no i915 on your device you can blacklist it. See 
i915_gfx_present() in sound/hda/core/i915.c

> 3. With the above kernel config the i2c board registration triggers but checking for a valid
>     enpoint fails here:
> 
> 
>    static int avs_register_i2s_boards(struct avs_dev *adev)
>    {
>    ...
> 	if (!acpi_nhlt_find_endpoint(ACPI_NHLT_LINKTYPE_SSP, -1, -1, -1)) { <---- No way to pass without an endpoint in NHLT ACPI table
> 		dev_dbg(adev->dev, "no I2S endpoints present\n");
> 		return 0;
> 	}
>    ...
> 
>    since our BIOS is made for a SOC module that didn't know about our external TAS5722 and has no NHLT enpoint in turn:
> 
>    Thread 29 hit Breakpoint 5, acpi_nhlt_find_endpoint (link_type=link_type@entry=3, dev_type=dev_type@entry=-1, dir=dir@entry=-1, bus_id=bus_id@entry=-1)
>      at /usr/src/kernel/drivers/acpi/nhlt.c:127
>    127	{
>    (gdb) n
>    129		return acpi_nhlt_tb_find_endpoint(acpi_gbl_nhlt, link_type, dev_type, dir, bus_id);
>    (gdb) p acpi_gbl_nhlt
>    $25 = (struct acpi_table_nhlt *) 0xffffc9000001af80
>    (gdb) p *acpi_gbl_nhlt
>    $26 = {header = {signature = "NHLT", length = 45, revision = 0 '\000', checksum = 169 '\251', oem_id = "INTEL ", oem_table_id = "EDK2    ", oem_revision = 2,
>        asl_compiler_id = "    ", asl_compiler_revision = 16777235}, endpoints_count = 0 '\000'}
>    (gdb) n
>    avs_register_i2s_boards (adev=adev@entry=0xffff888074d03828) at /usr/src/kernel/sound/soc/intel/avs/board_selection.c:570
>    570			dev_dbg(adev->dev, "no I2S endpoints present\n"); <------ OUT
> 
>    ...
> 
>    It looks like that this blob is later used in the avs driver. In our old 4.19 kernel with the 'skylake' driver we needed
>    to patch a so called 'blob' (not sure if I am allowed to post that hex data here) that was an array of bytes inserted/tweaked
>    into the ACPI NHLT config section.

For the readers.  IIRC the above describes a hack, patching NHLT with 
"blob" files available in sysfs/debugfs was never officially supported. 
The dev team flushed that code later in favour of SSDT overlays and 
later NHLT-config [1].  The former expands on Intel's topology rather 
than playing with fs.

>    
>    So how can I overwrite the entire NHLT part with the avs-topology so that the enpoint queries in board_selection.c and path.c are passed with no endpoints
>    from BIOS?
> 
>    Which information is needed instead of the binary blob and how can I add it to my tas5720-tplg.xml?

Looks like a typical broken/lackluster BIOS case.  Related documentation 
can be found under "SSDT Overlays" [2].  Scripts can be found at 
acpi-scripts [3].  NHLT can be built using nhltdecode [4].  If you 
provide me with the details of your configuration i.e.: what has been 
used with skylake-driver, I can prepare one for you.  Obviously the list 
is not a place for that.


[1]: 
https://lore.kernel.org/linux-sound/20251115180627.3589520-1-cezary.rojewski@intel.com/
[2]: 
https://www.kernel.org/doc/html/latest/admin-guide/acpi/ssdt-overlays.html
[3]: 
https://github.com/thesofproject/acpi-scripts?tab=readme-ov-file#adding-acpi-table-upgrades
[4]: https://github.com/thesofproject/avsdk/tree/main/nhltdecode


Kind regards,
Czarek
