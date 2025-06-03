Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB0622B8B0
	for <linux-sound@vger.kernel.org>; Tue,  3 Jun 2025 10:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748948248; cv=fail; b=DVKHcxFuIDkCuwgmwHIrMMjrr/tZRu1Fi+f6jKTvrRgmuKCey61RblxC63nONZiW0yd7FWHN1TByZiEmXISjeIuGc7Ur/bU/iE1wpLabM0tbItJ6AUttjDOCqbPk+M6RTGWFeLP5NaLwMaNnMMEJ9A/Nh6I5WOpd1D1Pqn28d24=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748948248; c=relaxed/simple;
	bh=qy2vzXt/wfMptVcY4U7hbmjDESjxuI/J3+V/KH/9ngk=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=JxB0fJfUBuSYonOwZTAXWYLMd8CqSC/a/A8xKduc3lOyI8q9P2GJFLTY7kazfZaE92+HuCPrBf4X7C9RZ14MyIILNNmUjLAH8syeHbGZkYNlj7IejfXmlBTLrUW28IKfgGCaZ6Vmm5334wLJWTIMPEGE65hdrHrG5ek/xx+6rFc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VJLkxR8J; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VJLkxR8J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748948246; x=1780484246;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=qy2vzXt/wfMptVcY4U7hbmjDESjxuI/J3+V/KH/9ngk=;
  b=VJLkxR8JURupixzwTKJR4JZNSuqVOaVXRtKICsXX0htJCFrlnwDdM8k8
   1iscEb84BqfW7qGselzrikC2WQKQQLzgM6dBad8RqhkNKJ6hiHfazZXYi
   QtM+k92DUQYtzsVCGAGuyliIxrLqDbQiQcE6HH5YTwMHa0Z2oJebxE1ct
   RSSP93r4IRhh0O6GhY1UYADj1fURjzOHxASlGiV6ztX4QQylUreOIYUE7
   GyTFZ0IMSTVv1Dl9OpwYGa3YPKwT9rbVBv1ak0100MyP3sYD/kxRIVHgG
   KqfKcci6yLkFsRNcgfSqCpmm0vIptAYauy1yblz1XfU4Zi/RQkE/pFjzX
   w==;
X-CSE-ConnectionGUID: tCX4O6DoSM+AfLzJQPvDlQ==
X-CSE-MsgGUID: xtLfapGGSlqyUpf1aFCzEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="68535447"
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; 
   d="scan'208";a="68535447"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2025 03:57:25 -0700
X-CSE-ConnectionGUID: 6xyNttFnQ0eeT+rDHl6LfQ==
X-CSE-MsgGUID: k5MqyV72Q3KQizk3yrwl2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; 
   d="scan'208";a="149980935"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2025 03:57:18 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 3 Jun 2025 03:57:18 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 3 Jun 2025 03:57:18 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (40.107.95.73) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 3 Jun 2025 03:57:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UJlgjF3Yhl7PXb4LNMuSccWvX0z+dqebF9iz/sh9iLOQzIgzEOdjs52sZUIUU60FuLhzzbaqp5UIroqHC/rn6asoQaeFhvePHcLcoPnowdVJeoqxkH35Z3K2EmXzu4PhTD0IrxCh9a6LENNoROxEagTcpu09AnS+4QQ34gvVTYO1bRepMtq7p1NMdWvdP4VYTzOxZbB73ReOPNZalIjmhrG8/+VwaEZy0CUrgDEbzDem41g1Ydul9sy/Zl4JYN0TT5xMQi1o7wO7WMDgylFx4OlCgESsReSR+PXIFEKIA00pu+Uj4HtsiR6Toazyj/dBY5VRokEg0pl82Nx6uicutg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3tPsOONFLc86Vpi3S0xgFPTp0IN0XBhqSP8Z11RtOfw=;
 b=cR8q5kHkY2poVN/IBua4BAHjz8SdrQGBRC6ZKY4Ynfyj1agKh/4otm0y4SyP5CzS/ymiPGuB+85YA9OGOAV0x8CoVds34U0X+aqgkIGXvkZUxWjLfsAHW/Apl7L9vTkSloGjYPQuNr4JKa24TmClsWzrI2pUp2ZmKTdSOryMCR+oWZ+K6XK6gXtUYP0ZpVY8lmDePWxOGsz9Q2gujgXAZadCMWi4lKGeXToS0BoFLAbHibdmjiTvGcrS1XRGnXUyl755wzUBFgOBOPchzpCfWJkdRhVvYXAc+BibxSCkaOV9+L6sQT8w/p0FZmHzKdLHPaAZ/Nk2seGghSvMbbi4Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8283.namprd11.prod.outlook.com (2603:10b6:806:26c::16)
 by LV3PR11MB8766.namprd11.prod.outlook.com (2603:10b6:408:212::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Tue, 3 Jun
 2025 10:57:16 +0000
Received: from SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::3:e0a:87af:d4b6]) by SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::3:e0a:87af:d4b6%6]) with mapi id 15.20.8792.034; Tue, 3 Jun 2025
 10:57:16 +0000
Message-ID: <64f38617-c8c1-43b2-947d-5182321d8f6f@intel.com>
Date: Tue, 3 Jun 2025 12:57:09 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH 0/9] ASoC: Intel: avs: Set of functional fixes
To: Mark Brown <broonie@kernel.org>
CC: <tiwai@suse.com>, <perex@perex.cz>, <amadeuszx.slawinski@linux.intel.com>,
	<linux-sound@vger.kernel.org>
References: <20250530141025.2942936-1-cezary.rojewski@intel.com>
 <174888256446.96622.6929185418537717818.b4-ty@kernel.org>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <174888256446.96622.6929185418537717818.b4-ty@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR06CA0154.eurprd06.prod.outlook.com
 (2603:10a6:803:a0::47) To SN7PR11MB8283.namprd11.prod.outlook.com
 (2603:10b6:806:26c::16)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8283:EE_|LV3PR11MB8766:EE_
X-MS-Office365-Filtering-Correlation-Id: f004c586-737d-4313-d31a-08dda28d6701
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RmZnWHJncDlTNUIyWTNMOGdkSTljU2ZqRG02OEx0UytxWFo0ZVNaOWFhVWFi?=
 =?utf-8?B?UUVoUm42NmRQa0FWOGk4K2pOT3VBWlJIZXRiR3pGOWJmZUF3T2Z4NUU1TXBv?=
 =?utf-8?B?dVRRYTFVeXN2RmhuNm4ya3JTZS8rblA2a08rZFZiczd6WFpXK1pJWFdLdGQz?=
 =?utf-8?B?UlZ6OFhrSG5KdHpLYVB0SEZDaitSeW9GUHdCdHJkazRCeDRXMFl6bHV4aFk4?=
 =?utf-8?B?emI1UVNaVnJHRE9wTGU5U3EwQ1BzN0c5SGdjQWErbVJPYWY3KzN3L3NHbGFn?=
 =?utf-8?B?OThwVmZWODJoZ1ByY0dlYXZjOFJpbDF2RHFsTUFxR0FseitLSlZQZEFyb2U0?=
 =?utf-8?B?d3k4aE16UmwxM0l3R1FNT2x6QTlZRUtPdHpHcHRhb0xMODhxY3ZNd3JOYkF6?=
 =?utf-8?B?OWVQVGdTZ3B4WHJnQWU1REdoVmpKYXhRTVJqaTFESnZSbTRjTTRrejgyZFJ2?=
 =?utf-8?B?RHlrenhmNHNiZ1QvaVkycFc3RGg0TWwzekpBSkY3TFFRY0NSajJQa2lhRU9y?=
 =?utf-8?B?MGk5WTBvTkUzWU85M2UwM2NNa3M5NkdiNGhPVlcwaGRpR2xhN0FsWG05bEdx?=
 =?utf-8?B?UXRWUnh2NmZHOGJQc2E5LzhOUGdoOGh3UjMyaC9Bc1UwT2M3bGJ5QmRBdkV0?=
 =?utf-8?B?UWMxdGxaeG85NVFTcldsdnQxSXBsNm5menRkbG5oV0k2VXBPUG1oZjRBMFVq?=
 =?utf-8?B?Uk8wMDl3Nm9jTDdZWkI5Sk5sZG9CZ1dNTThkZHZ0SGI3UEFqdGR0WnpLZWs1?=
 =?utf-8?B?VlNyc3RJYzNMUGRqVm9xUkJoY09WT1ZBR3lVVmVOSWp3YnAxbjZMbmF2OU1F?=
 =?utf-8?B?ZkFURjFuS1lDbThkWjNuK3ppaXV2aDI1Y1B2VGRHVnhyWTVrTTBteWM3RzZI?=
 =?utf-8?B?bGtxRUQyd3FVTXQxR2c3ckwxY0JQWEJLTGxWYS8vcDAzRVlsLzcwVTUwRVFP?=
 =?utf-8?B?cVluTEVaaCsyUDFKYXplaG9uOHdtWGZNNVJHd1NobWJtdmRRd0VCZHJKblJO?=
 =?utf-8?B?R3Y0NXRjZXFmYzdTV2RMem9DclFESTRDMG55eWpBNUYraHZqZDk1TzZZS2Jm?=
 =?utf-8?B?VWRVNEoybWFOQ1RWYzhsZThGQU1RYmkrTzQyeFpCQVNtajNYb0MyRzVMdjZz?=
 =?utf-8?B?NmVkL3NHRHAzakNNdk1YQ0g2ZHZ0VzR3eFR5NThibXVTaUdoelFlenBXMHdL?=
 =?utf-8?B?QWsvWGUyS0FZZEhtczhRZGp4WU1zVE9wY0ozTlZjWURRbkUySUxoaVlJNmxS?=
 =?utf-8?B?YTFOalFzeTRoUDRXY0VaZjVSVjgvZ3Q0Ykx0Z1VwUS9mbjBjTk8rdk1rQjRY?=
 =?utf-8?B?ZU14Z0g4ajRHY1VDRjFpdjM2NnJ2TmpRZ1NBZnlLem9SUll2TE4vaG0ra00y?=
 =?utf-8?B?RlhoR3o3a0dyaUVlaUpBOWVRZy8rTDIvaGphTklTanFWTmdkc3VhNW5qUks2?=
 =?utf-8?B?Qnh0cGczbldMTmZoSkF4OVNGMTN6NFc4S0JWMWVqRVdGLzBCUmZIOTdIcEtC?=
 =?utf-8?B?ZExncS9NTnY3Wm9VR2V6QVhsMUVwQWdtVDNQSnVEcW53VEo2eDM1UlZxRUxK?=
 =?utf-8?B?Vm5LeW5ISzhRYWh0OFNXczhCWEZtV1grQVJjcU1GMWl3SGVxZFBtSGhTQlVQ?=
 =?utf-8?B?NHRlaWVKVHNkTHVZSDQrNWt3d1p2QUVlRm9OT2J4OUhHaW0ranBNV1Rib3Iv?=
 =?utf-8?B?REIxY3Z3S2YzNlNqcFl6TENjTTlaRnBucUNzOTNUVEhoOUNMRFdEazF5ak54?=
 =?utf-8?B?RkVjWUJZYlNrcHQ3Yks3NFFhOU9CTno1VnlBMTRsNGJKVk5XRWlZZEtiUXJq?=
 =?utf-8?B?Y3UxTzllUTlpWFpZQjZRYnIvWG1Xb3ppNDlobXI0bkEwUzFDRFdLSnVqN3dK?=
 =?utf-8?B?bTg2K1U3S2FpUWJkVVUzZWphZlBISkU1ZW9abjcremdyVFNzcVJTNEwrVUtr?=
 =?utf-8?Q?fRotk1PCcDc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB8283.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aUptN2R2YjhUbC8yRlpKNy94Z1pFd1EwaWFPLzlNRUhPY3RpaEg0UWlKS2Rw?=
 =?utf-8?B?ckZuaFYzUDhMOWt5ckV6M0JlMkllbENBaUQ3UW9BV294NVBKMERrblVOTXZn?=
 =?utf-8?B?bGxiakxBem9OL00vYm9tSGV2NlBVQzVhb2FlSitiTFVsd291NjJzMFBTM1Z5?=
 =?utf-8?B?em4yaWdhdkh0ektuOS84TFNlT21UMlZrN3Z1NGxUajgvbFo4RnM3SUF3U0Zz?=
 =?utf-8?B?UmxGK081Qk5ranRHSms0OWF1cHZmd09CYmNPZnpYZHZEdGxxK04wRzBHYk1G?=
 =?utf-8?B?ODgxcis2MjdrUGNGeFB2MkdMM3ROVFU0RW5PRThNT0JLY1hHanFvaFY4WW5G?=
 =?utf-8?B?dW9jWk1BUWQwUC8xaDI2dkRjamk1Rzc4ZnBveE5hdmtRby9EZTEvK2xSK2xy?=
 =?utf-8?B?RnR1UmhhZlpYUGRDQmpwQjUrMzY3MDFFajdzYnNhS2JNWlA0cS9Hb1RWbEtI?=
 =?utf-8?B?MEVzSHFqMHZ6RFJPVStmekVMN1hnUmllbGl3VHlFYjNXRTFzVWlqNVZINCtP?=
 =?utf-8?B?Z3o2YkxhNmdNdUVZbmJPdTNjTmtMZkdOZzlkY01ha0VaQWdyL1EwN2R3M1dI?=
 =?utf-8?B?ZlU3bXZTMWN6cVZGdlZ5TUp1Vzk1T2pPQStWTnFXOHp2VkJBTW5iWWIzRlhV?=
 =?utf-8?B?MlJKWTIyU251YzlIc0J5bzg2SEQ4N25ndkNzQ01iaHYyc200MkxmRHI4RGgx?=
 =?utf-8?B?Qy9QRG1zSlNCOGE0M2U5Q25HUmVrZVVMenVlTy8vRGtrTXMrYnRRSU9zeGlC?=
 =?utf-8?B?N253WDFxZUZNUE5xN3AwZ2wyUGtOV29VTjR0emtmZm5vclZvd0hNTFJtUTNS?=
 =?utf-8?B?bDhTcUNieVRTdThpRUYyVmltTHlQZ0kvbWtZcC9VTHpVRlFPZUFpMXN5K20y?=
 =?utf-8?B?RFU1VUY3MFBHSU9sVlVUcmFNb0IyVnV2QXVla3BMNkFZQWdkbTZkMk12YnVL?=
 =?utf-8?B?N1hkblYwSGtJYTRUblNaOEw3clZQSjlDeFJwR1NUWXMzSU5ONllHSnZIbkpE?=
 =?utf-8?B?cHVKamdFb0NjYzF3MHUyRnh5K0xKUExRd21OYXg0OHNZSk1ybnRjVy80RWsv?=
 =?utf-8?B?WEdDUEFvdGRUbjFKYmYxVlFLVjhZTG5HZGhpTmxVdmgrUHBXbWF0RXdURVp3?=
 =?utf-8?B?U09ldkg2OUFYVTk3U1ljKzZhbHl3NlFIOFRCNG9DRERZT2lHT2tjV0liQXQz?=
 =?utf-8?B?M2RvbnRiK2dpMStSUWI3SGVnZEtzaDU2TDFCTUgzT0NaWmdoeFNzYlRONkVj?=
 =?utf-8?B?djJWaG1ML2IyQXJRN3R3UlM3NzVBMlFQNFJSWFB4UHNyc3pFYm1iaTVyS0ZY?=
 =?utf-8?B?dmpmT3dyc1ZjNUdFTzVId2grT08zOFZ4WUR3MDh3UUpBd1A3dE93ZGxqL25x?=
 =?utf-8?B?V2lUVEpBTGZOTnBueTJtT1BEellPaUJPeTJ5d0poL3FOeUFEVk0rdTByMXp3?=
 =?utf-8?B?RUNqL1Nkdk03Z2Q3SUd2cUV5YlpmWlN2OVg3QThIRUcyZ3Z2TlZ6UUFtQkMz?=
 =?utf-8?B?RWpqSmI0UWJZWEUySmZ1Z0wzWVBUOWZkZ0lwQkVOZHcxVU9saXVtOGk3VlV0?=
 =?utf-8?B?bGdpVnZuZG9ITU5mNkpHcHF0WENWTmd2QmZoVHdHWFB4c3RRd2tPUmU5Rmg0?=
 =?utf-8?B?dTFpL0cxQkpWNmFHd2puRFdtTnA0aDlNQkViVUVVKzk1U3Q4MXdtK0NLVXdM?=
 =?utf-8?B?SlpadXcwY3J2N1Z1dVVraU5Tc0s1SGtaTzV4ZW9Mc2RhNjVIRklIWGxseXhX?=
 =?utf-8?B?ZEovc3JvWld4TlRYYmVKYzc4T01YSjJlMmVXamoyaG91VzZGRzJGZjRyaU5q?=
 =?utf-8?B?a1dNcUhrMnRWS0pMVzgrSGV4Y1ZzNk1kWG5ObnVCR1E2MHJVYW05dE8zRzlY?=
 =?utf-8?B?dktBMDR0T29yZ282R2g5TERPcXRLRDVoZ0E5VmtOZ21kNHJrNUovZlFPV0hQ?=
 =?utf-8?B?TEo3OHo1cEllem5aN3FxT2o0cEJsUnE0eEtUcmRSSGFtb0hYWFJaMkxqbGUv?=
 =?utf-8?B?ZHV2MiszdnFjK0pIYTh2T0t3aU5zT1IxRzRhN1dncnpaTVJOd3RqWjAxRFQ1?=
 =?utf-8?B?K2ZFOEVHYTJxYnM1MVcyYjZCQTRMVkpSZCt3SFl0Wm9nRkJSZG1RMFlyTGxK?=
 =?utf-8?B?K0l2MnAzbUl2R0tybGZGK0ZqYnVQdVFTL2t5ZEhtUDR1V3VYUjNwNzlSbUFO?=
 =?utf-8?B?QXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f004c586-737d-4313-d31a-08dda28d6701
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8283.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 10:57:16.2210
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 02y1ZhLc8JbxKuCmkvQoG/vvqvEUm4kgPnYiO9vmZvPZHtkRxpUB41Th4O8Huv//Cb3tBlBUgP/nYU9SBIXvThpObBi1e0MCeqeaHOnPt+w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8766
X-OriginatorOrg: intel.com

On 2025-06-02 6:42 PM, Mark Brown wrote:
> On Fri, 30 May 2025 16:10:16 +0200, Cezary Rojewski wrote:
>> Medium range of fixes all avs-driver related. The most important fixes
>> lead the way:
>>
>> 1. For ASoC-hda codec driver, existing RPM manipulation in
>> hda_codec_probe_complete()'s error path is superfluous and leads to RPM
>> usage count underflow if the probe exists early e.g.: build-controls
>> operation fails.
>>
>> [...]
> 
> Applied to
> 
>     https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
> 
> Thanks!
> 
> [1/9] ASoC: codecs: hda: Fix RPM usage count underflow
>        commit: ff0045de4ee0288dec683690f66f2f369b7d3466
> [2/9] ASoC: Intel: avs: Fix deadlock when the failing IPC is SET_D0IX
>        commit: 9ad1f3cd0d60444c69948854c7e50d2a61b63755
> [3/9] ASoC: Intel: avs: Fix PPLCxFMT calculation
>        commit: 347c8d6db7c9d65d93ef226849b273823f54eaea
> [4/9] ASoC: Intel: avs: Fix possible null-ptr-deref when initing hw
>        commit: 2f78724d4f0c665c83e202e3989d5333a2cb1036
> [5/9] ASoC: Intel: avs: Fix paths in MODULE_FIRMWARE hints
>        commit: 9e3285be55e6c0829e451b4a341e3059da47ec9d
> [6/9] ASoC: Intel: avs: Verify kcalloc() status when setting constraints
>        commit: 5f342aeee2724d31046172eb5caab8e0e8afd57d
> [7/9] ASoC: Intel: avs: Verify content returned by parse_int_array()
>        commit: 93e246b6769bdacb09cfff4ea0f00fe5ab4f0d7a
> [9/9] ASoC: Intel: avs: Include missing string.h
>        commit: 38b1befc7a35a475d90ec32bfbe319f4412880a1


I've just checked broonie/sound/for-next and it seems the status of the 
branch matches above - patch 8/9 is _missing_.

At the same time, I do not see any reply with reasoning behind skipping 
the patch. What can I do to help address that?

> 
> All being well this means that it will be integrated into the linux-next
> tree (usually sometime in the next 24 hours) and sent to Linus during
> the next merge window (or sooner if it is a bug fix), however if
> problems are discovered then the patch may be dropped or reverted.
> 
> You may get further e-mails resulting from automated or manual testing
> and review of the tree, please engage with people reporting problems and
> send followup patches addressing any issues that are reported if needed.
> 
> If any updates are required or you are submitting further changes they
> should be sent as incremental updates against current git, existing
> patches will not be replaced.
> 
> Please add any relevant lists and maintainers to the CCs when replying
> to this mail.
> 
> Thanks,
> Mark
> 

