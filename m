Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F3ED4A21
	for <linux-sound@vger.kernel.org>; Tue, 25 Nov 2025 11:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764070274; cv=fail; b=m9uAbtqM71yZT1NIvuu5IXdeBKgONfQhF1cVOPbOZhtgIyc+sraagoSjOKDK8DSqRvYlskIv8MpMWmrenCSuUpNuP/OdDsaq30pgddyx6TYF2oXFdj+R4NtNO1jKwCzfm1yX+rMaBVy+B6NPtvMiPqkwroMquj5RSm94PeF8cL8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764070274; c=relaxed/simple;
	bh=0zdXYgPkiiOA7HxJch2InUPhZuMSYPNSRTkWC2zQw2s=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Kv5U5llJTei7xAUPQpHaXZc3gIPF0331gcGJvsI448VVof43JIpR5Ucrghg+L1C2Tul8jNSCERfBAGb/W64TQZASfuQLPmejOiukcXF6gtzY/6vot6GqXzwrOoPW3DFHvl15bYNHmgiQ4PObv7Hr/Dq8ltKltzNh4FMWfeeTY5E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GnY2sJx7; arc=fail smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GnY2sJx7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764070272; x=1795606272;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=0zdXYgPkiiOA7HxJch2InUPhZuMSYPNSRTkWC2zQw2s=;
  b=GnY2sJx7rXX8OomXna4cnwgqFB9wxVPxY2KsSrSnBUpEIATvlLqgseil
   CnQt8ufS5CLc7NC2pINE3UtqKeGk5ShRdXFTQhpAccq1oRMVly/H6HmXc
   j6iZbmudoFeivoATuSC5K7LcWKmbgiAHVmky0yU1+cet/QNwxU7W0Qr5G
   VXTsgj2dIzNWBFWPfANVAXRRe3WFsomm8qPhHz2EpwAWL2iFr0k167Dt1
   dfHugFeD4wmSZ7zBWu3uLALDFR1mGc7JiPpSfx0cdeAZUXv2VXZOaJpc1
   NzpJoluqauyee8WNLMjsSktoWds9lb3/37t4/gs+8qwb6msrJGqzLVawT
   w==;
X-CSE-ConnectionGUID: NcOXXwiYTiiz82K6z9OJ5A==
X-CSE-MsgGUID: JTsnrhiBTkanzlFg+ZNUqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="77453083"
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; 
   d="scan'208";a="77453083"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 03:31:12 -0800
X-CSE-ConnectionGUID: COFUo1FcT6imJkQsfrEyJg==
X-CSE-MsgGUID: EITCUexPROaL6WUgxTtbyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; 
   d="scan'208";a="192250397"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 03:31:12 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 25 Nov 2025 03:31:11 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 25 Nov 2025 03:31:11 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.71) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 25 Nov 2025 03:31:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nGVpnXu82GA73xfMNkeGkVqpKIEew97sm3kbhsQDgPQClSLQN0mynieO3zdsqc1+7wxFxYPrU5C5ob4+Ot6HZQ3a67VRlnrzSMrUwUHCxSTo7+yVMgtl3F7rDkgECr9uVpXiRCeC+rUOPzu1vL9JokyXZi9qjDgSBzWch/rbcRaLlM+TLUcpfv03AyJwnOCmMTsKheq7pc9h925Q1aakWICyjFU3zh0YKIZMpjmKOPjF1I0f21jl0VOg00RNVzN8oRyE8d0frt0+9YtMtOenzhkZM30Uk/9qDTglY8K+lv3atvMFKdyNBnf4Mw3z7Nm9Oex8QPH3YIsGxHG/dH5McQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wxp5126xRYWRmHBf83XvTdSqO+/NSPK7foKTfmyv1Zk=;
 b=dr1LCXOOQewgn0ARZL2HpNCIcEKsiE4mTiTatDpypW76S0nBz4LlZ/n0cvRP3HYSUFnn6hG3K746ZH5+0as9Uwis0k5HI50cUgqCAGhyF2YhOOUsoF2PepBNjc8TuhioKp2iOoYjRxN38zOJGjSbgwVrm0ZHGtS4wNu2GpWYeEP1/7l46yuOACycSMEgDXnaUervYtxbcM57U9mMpjirGJrN5lLnJRFaVoRadYC6FyywJjL6mABqBkciGaxJI08CWzj+pRQVS95rJHhfZfC2n+YOEb3KGSlOMfWqUSEFGKQAXluVwkCchm1nw7MshefoLCndPrLkvx8Xnmd7KRBUEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB8294.namprd11.prod.outlook.com (2603:10b6:a03:478::10)
 by DS0PR11MB8208.namprd11.prod.outlook.com (2603:10b6:8:165::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Tue, 25 Nov
 2025 11:31:09 +0000
Received: from SJ0PR11MB8294.namprd11.prod.outlook.com
 ([fe80::fa7:318:6d3f:3c4f]) by SJ0PR11MB8294.namprd11.prod.outlook.com
 ([fe80::fa7:318:6d3f:3c4f%4]) with mapi id 15.20.9343.016; Tue, 25 Nov 2025
 11:31:08 +0000
Message-ID: <0be0219c-51f3-41f1-892a-45a6e5db6bc3@intel.com>
Date: Tue, 25 Nov 2025 12:31:04 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] ASoC: Intel: catpt: Fix offset checks
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: <broonie@kernel.org>, <tiwai@suse.com>, <perex@perex.cz>,
	<amade@asmblr.net>, <linux-sound@vger.kernel.org>
References: <20251121114331.3841335-1-cezary.rojewski@intel.com>
 <20251121114331.3841335-2-cezary.rojewski@intel.com>
 <aSRsX9qlUVC7HHvA@smile.fi.intel.com>
 <e99d1131-0c7b-4cf8-8830-34f766bdfe6f@intel.com>
 <aSSsXgRjCiXFR04R@smile.fi.intel.com> <aSSsxz9hIavDhpgg@smile.fi.intel.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <aSSsxz9hIavDhpgg@smile.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0230.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e9::20) To SJ0PR11MB8294.namprd11.prod.outlook.com
 (2603:10b6:a03:478::10)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB8294:EE_|DS0PR11MB8208:EE_
X-MS-Office365-Filtering-Correlation-Id: 176cfc3f-9594-46ad-b994-08de2c1620e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WmdHK21LZDFwWlNSdE9iR0JTV2xQSXlLQWNzUWFpTjRrU3VITXFwNXRDSEQz?=
 =?utf-8?B?Q3lWOU0zcFV3OFk3NzE3ZmdMTVdQVjV4MnhtUW1JN0FBQWFOaW9vWDBnVmpJ?=
 =?utf-8?B?THhxZVJlUmtJMlJmVUltZFh5alJESTY0dlZmT1kvZ1FNWEVPSzhHTG9xd0ZV?=
 =?utf-8?B?eFJtY2llNW50c3pnWnB6U1lwcFBxSE15R0hGWWJJVEMxWGFKUVJOSjNaZkt6?=
 =?utf-8?B?YldoMWV3ZTlmWFhBTDQ4eU9WU2Ntc0c3SEZBYktPQS94MWFUZWZNem5NN2VJ?=
 =?utf-8?B?cW1CWHZGK0IwV3hRdy9LdVZwUXZlUit3RVB2N2JkM1pOaXc1TEFOMk14RUJG?=
 =?utf-8?B?MUFOVkZHbnh4OW04REU2enZiOVI3SjR1N00wUFZ4S3dZUHU0dnZmTSt4WjdO?=
 =?utf-8?B?eStFTklPbkhvb0lVSnZqdGF0ZWZCQVRzSHVma2ZKNkN6dS9NTDVEbGtqbzJu?=
 =?utf-8?B?WG53OWw0OEkxUFRYeERqR1RaMU0yK0xDemZ1ZnZqTXdiTFFBMExHSjhFd1ha?=
 =?utf-8?B?Q3o5VTZNdlJ5TVF6dEtwMHAzeTJ3aWNTR2IvL01IRFNZWWd4NmNtc01oVCtS?=
 =?utf-8?B?ZFRHZmMvNzg5dHE5ZlluNUpka0VUOUZvbDVWMHViNHJjWGFlamE2YjV0RmRq?=
 =?utf-8?B?TmxPY2hhOHQraS9UK3lucEtVYUN3cGpudzA5RUxzczIreGg5SU4rWEN1TmRL?=
 =?utf-8?B?S3RQR2NWL09RWFpGRnE4ZXFDSG9pSXFsOUVYZHVGQmkyQmVlNGo2SlBrUXJO?=
 =?utf-8?B?WXhjRHB2cVpaNThGbVBEQVRTVkp2UzN4Wit5OSsvdllaQnZTa0xwQlpRVjFn?=
 =?utf-8?B?U3NMMHUzcTdTd1RmU2VuL0UrK2JDc2NNenUzaFFYaUVqNldxUzE2anZxVGY4?=
 =?utf-8?B?YXdlRjZ2QnFiY3NvdXV0R0J3ckwxaW9lVVl2R1lVZDlOaGJKRFBXbEdaUC9o?=
 =?utf-8?B?UXFTNklNUm9jcFJhcGNVV054WXJiUElvVkhRdWV4aEd2TDljM1I1S3ZHemFo?=
 =?utf-8?B?MnN0THEySGxDbDcvTFJxc0NPazY3ZWE2akJQZXhyQjdLVnErSXV1M1k1Q2Z1?=
 =?utf-8?B?M2tmN1QvZS9TNXRiVjVScDUzVGhyZXAwdDJ2M1l3VE5hMVMxU0NNZVJtekNk?=
 =?utf-8?B?ZWJ1ZDE0MkVTM1hNZjh0YjJIWWxwL1FBclg3anVmQkZZck5ndGpvQzJIbWcz?=
 =?utf-8?B?djYrTDRqV2NJUzR2UThrSzBodGRDVUZNdmY4eWVpeGRFU3hNSitnZXpISTNX?=
 =?utf-8?B?NDNINmNPbkhRY1p6UlQxMUQ0cDY2ZFJzb0lHcit2aXhsWGZGbGU4VnR6NjQr?=
 =?utf-8?B?WkU5WXQxZmFmYTN6Q25EWmNrNmluYUZRK3E1T0NSZjBHNjNOVE5NcEltajJt?=
 =?utf-8?B?RGlYekJiVFQyNEc4TnMvcGJ0YzhGbHVPYmRsUVRRazZOMENqUEx5c1Bsdmtj?=
 =?utf-8?B?UVhGdkhSaVBXNnFtL09VTjdEVkFNSjZpZ2xtTHp4c0tjNDhHNHJIS0Y0TUwy?=
 =?utf-8?B?bmozWWF4L1IwY2pWZytUMlVBYTNKdk1oeXN4T0NrZCs0ek1WSjRTc2o0bW5I?=
 =?utf-8?B?NGdyQ2JQVHJvbUM3NXRuaXh3RlNIU1g0dmVnU2d3MzRoc2d6SldUTHlJSGRS?=
 =?utf-8?B?R0Ixd2NCa2Z6SVpscUtFRVhzMVJmSFdCdjdrMDlHYzhrTHhJV3ZDdjRDNDcy?=
 =?utf-8?B?enZZNlJ5TjJkK21QaHlkcnV2UGtNN0xVZ0F0MDlFVDIxSlFiSHlabGRBVjVP?=
 =?utf-8?B?ZHJFZ0dhS21DMnovRE0rS2IyTXR5dS84cVFQZVkxM2V4TUlQRzZMUmF6dE54?=
 =?utf-8?B?c0RHMGtJQzZFVmJiYk5BVXNxZ0Q1MmlzK2lJamZGa1RhdVAxeFZRRnk1VDRF?=
 =?utf-8?B?TFU5VUhrQU13SGxKcjBlMWRlNkJYUm9GbFl2NEdmUjJPaVh4YWRJdFIzZ09x?=
 =?utf-8?Q?vmMqRhmMQP/aGf4SOw9cI+iKeaVlMttr?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB8294.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YlNLYXc3cE1QaWcyV2c3VldiQjFSN09OL3gxUmZiOFdiOWtFc0wyZzlrcE03?=
 =?utf-8?B?cFROeU1WVk1RSndLQkhsbTA3YTFuUk9ET2V6Tjd5ZzBVa2ZUdmdBaHY5Y0Z2?=
 =?utf-8?B?N1orVDRtYmplQkZyQmZFdkhteXljN0RMbTgxTDlZQXVrdlU3ZE1HMzFIeC95?=
 =?utf-8?B?dUpkRUZqMUkxeHhsbG9JMmRPajg1UVpuZU1NN3VkQWpvUlRRSWNFM2VoMmFx?=
 =?utf-8?B?cmJ6RTJSVWFJR0NGTnRMakZvYjZEbFhGQzEwcEdYN1RkdHk5MFg4aUNhMXUw?=
 =?utf-8?B?RXpJT3pXbWp2NExrSjNTMHEwc3hBWEo4Y2Y4TGlDSmdQTlc0bVpUT0ROYTJB?=
 =?utf-8?B?bkRmcGtEdFRYMzZCY25tejE1NklJd3RxekFzS0hLeDloQUdvaHJLcExaRFhF?=
 =?utf-8?B?N2FGTGtrQmlzU1BBcjNLbDVHMWZ3T3lCcDJhcVFRR2c0bmc4b1ZuVUtkaklO?=
 =?utf-8?B?d3VRbzN4bklxTkp2dUgxZ2ZyaTM4L0I2Yyt2VlZlSlpXODZTSzRtWmZDSnY4?=
 =?utf-8?B?K1JlZzhTTms1c0tWeUJvUTg1amx2aytvcElDdmNoSU51OS9jcHFBTGRWRzJE?=
 =?utf-8?B?eHhBUEMrS21ndVduUVlSWkFZd2NGUFJiaUNJRHVkNndyckp6N0k4cWhSMS9Z?=
 =?utf-8?B?SVNqQlFQZlZibWdsTWE4MUd6b0k1ZDcvVTFHY0QrZDludTkvaWpTRCttbUlG?=
 =?utf-8?B?by81NCtKcVVPYzIvMzNEUE5mVm1QODY1L2hmTEI1TnQ2T0xJd0M2TG1sNkgx?=
 =?utf-8?B?L1ozS2ZuQWpWeWR3WWJwMVZhaWg1VkJDUFRlZFZRMStIUFJXdVJubnIrRmph?=
 =?utf-8?B?NjNER2M0ZENlNStEd3FkN3M4WDZqUUN3SGhWNlJEdkxoaTJ4TmZDUnFuRXdj?=
 =?utf-8?B?UCtGRjFYTHpvZDJiUERnVk9GYmtqZkV5Sk43VG0rSThBOWdPY0grdkFzR2gz?=
 =?utf-8?B?bTZhS3hQSDNXMWlKeWpWUEl3aGFXSktQQmlQUWxEdnowUy9mMTdmTDhZS1c0?=
 =?utf-8?B?SUxpZmkyVXJ3SVNVdzhpSkVmSlI3VmJjNHVUSWJqNkMvd1VjenJlYXFUMDhX?=
 =?utf-8?B?UjNHMmJYaGRTeElFVm1DanE2YjBqSmlkVURMUCsySnFDV0cwUzQrK2FWMCtB?=
 =?utf-8?B?S0l5Y1V0ZmNpYThHTHNuSDR1Z2R5eGxubDViNHNGVTUxWjFGUHAvQ2lzR3FE?=
 =?utf-8?B?RDJhMUR5bVlxWExWM3Z1VGQ1Uy9JcGV3ZkRGYVI2ZzdBSmE1S1haSUxFcHpW?=
 =?utf-8?B?VWlnTzQwcE9yQyt3OUxQVDU1WnhvdzVoc0ZqM2c4b1QrMitlRGtZMUNXWlBR?=
 =?utf-8?B?YzFNc0pqZ3U5WllaMEUxaFBoUWRLV3gvZUluZmtnblY4cTBMMDFzYXNubTRk?=
 =?utf-8?B?NjV2blY5VEpNT3ZoQXRxcEswYlVEWkE5UXhhN1FsTTQxcjVtaVBqUTkzMGRh?=
 =?utf-8?B?SUNhT3NYWWJjN2N1NjIxM2kvdGovZ3NIVTJ4bjJPZ1lOa0V3UmJDM0NRSVBW?=
 =?utf-8?B?dUNyOUVGSEZEdXBmdlNuYzEwcVBWaGZ0L0pEQTQxMXNYMlRWQ001UnExeTJF?=
 =?utf-8?B?NTFwMUJtbFhNUGQ0NTNHbTJsSnI2TzdsdU5aK1FwL09CaDdQMGF6T1FXMnFM?=
 =?utf-8?B?Y3paVXNscjRxRGNEaDJWN2tqOURzSE80ZE8zU25XQlBwdDUzTDVFektUNUF0?=
 =?utf-8?B?WkFrWmpZdCtHQVJSem5OcUcwWEtaMndCL1VlOFpwVmJoVks5VTRieXZsbjdn?=
 =?utf-8?B?anFyYmFNc3dZWHBTUkt4ODk3bVZCZHJNa3R6amNsZ1B6Zk4vOGNtTUYvcHVC?=
 =?utf-8?B?SmVyL0JscFUrQVJXZUVvYjk5R2RTQVh4dTQvc205R0piYVg2THAxenU1ZnZY?=
 =?utf-8?B?YlRINVBmOExtWmhVYXByVnQ3S0tqREU3anJEYmVwZThEVGd1ekEyUkg0STJr?=
 =?utf-8?B?cmhheTJ5QVExRXlPZFl4SFp0NHF2ZjdNTTBpVVVTUTVNRUZ2NGFXNGZSMmk0?=
 =?utf-8?B?d296bFM5S2FHVHZ6NnZxRVBiTERSeUQrTDh6b240K3BGSWZieVdEOWhDUXdZ?=
 =?utf-8?B?c2tJemNmeFMxQ0p3ZTN4VVYwbDNsc3JhcHdJY0piM3h5ZTI1NTlPNkw5K0Jh?=
 =?utf-8?B?VEpTdmV6UzVTVXh4R2xQdzVYM0dOMHJIK0JsaHpET010NEc3dllPODV4WkRP?=
 =?utf-8?B?aEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 176cfc3f-9594-46ad-b994-08de2c1620e3
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB8294.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 11:31:08.8949
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5w//Kw/DS0ZfHbGi4xm+p9Q3bUsAfbTr+wLT8Yb/+zAbIm3SeAsqzAUUtnhzj0UbLrLEuhHbJlCTv9tH+van47Qd26ij6g7fhHCdbLKNOv4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8208
X-OriginatorOrg: intel.com

On 2025-11-24 8:06 PM, Andy Shevchenko wrote:
> On Mon, Nov 24, 2025 at 09:05:06PM +0200, Andy Shevchenko wrote:
>> On Mon, Nov 24, 2025 at 07:20:48PM +0100, Cezary Rojewski wrote:
>>> On 2025-11-24 3:31 PM, Andy Shevchenko wrote:
>>>> On Fri, Nov 21, 2025 at 12:43:26PM +0100, Cezary Rojewski wrote:
> 
> ...
> 
>>>>> static int catpt_restore_memdumps(struct catpt_dev *cdev, struct dma_chan *chan)
>>>>
>>>>>    		off = catpt_to_host_offset(info->offset);
>>>>> -		if (off < cdev->dram.start || off > cdev->dram.end)
>>>>> +		if (off < cdev->dram.start || off + info->size >= cdev->dram.end)
>>>>>    			continue;
>>>>
>>>> Hmm... I would rather do something like
> 
>>>> 		struct resource r;
> 
> You might need to nullify this as well:
> 
> 		struct resource r = {}; // or any equivalent

This made me realize variables 'r1', 'r2' and 'common' that are part of 
catpt_restore_fwimage() are not zeroed and utilizing resource_xxx() API 
without doing so is bogus. My plan is to the following: leave this very 
fix as-is (without refactoring) and follow it up immediately with patch 
that swaps manual manipulation with resource_xxx(), as you suggested.

Sounds good?

>>>> 		...
>>>> 		resource_set_range(catpt_to_host_offset(info->offset), info->size);
>>>> 		if (!resource_contains())
>>>> 			continue;
>>>>
>>>>>    		dev_dbg(cdev->dev, "restoring memdump: off 0x%08x size %d\n",
>>>>
>>>> OTOH it seems more invasive change for kinda a fix.
>>>
>>> Looks elegant though. My idea was to avoid additional operations (which
>>> resource_contains() does), perhaps unnecessarily as readability suffered
>>> because of that. Ack.
>>
>> Note, it's defined as static inline, if compiler can prove constiness of
>> something, it will eliminate the code. TL;DR: let compiler to do its job.
> 

