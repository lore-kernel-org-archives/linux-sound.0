Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57DD048A2D0;
	Thu, 11 Jun 2026 18:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781203192; cv=fail; b=JscB0nwD8gFB5Mq4ipu4eMH1Ls8OPTCI5V62wf2BsUrJBgCRwfiTqlO1opt12QbFmnGsuwfAQZVP8Q8HcPljn5OAVQL6xzBACIIY8AFfJVTkV+VNR4Ras1TsnXs9A0mVumffd4PhkY7ldsU6PkNvZCjNBJ/cxiVTOSLtFdKo6TU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781203192; c=relaxed/simple;
	bh=ycLJH8HXoIFKpgFMreL1e93dCy1bJBE+V78wr/1oon0=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Jc1UY91XPaQwl9zSzR8ni+ReMz+YUmGlggMy0SD6evVaNuey8Kk+81Zo1ZTzGOYfMXUsfAZzpUsQxdBzzV252AdpidtouMPCvWPFXFrRuGjQpcY+t/vhH5nm7PL2CGjoroXk67j5pmzPUNuSDFTvl+iOpKviMULppDt+feScjd4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D/GBBpnM; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D/GBBpnM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781203191; x=1812739191;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ycLJH8HXoIFKpgFMreL1e93dCy1bJBE+V78wr/1oon0=;
  b=D/GBBpnMcA+V9q6wRhsZOlK1fJ966WlmN1K1Hh+9v00KG+a1cN/fHVBP
   bH47kAhekSp9vE8kMo/STx4D1Q572czwXyvZyYa7c3lB2j1d66MB3aDuc
   W89oKM+ogx8uWgJRncfS3PVSMlOH9ap68V10QjnC/sDZJEIH7PoF+jrAy
   cUDDWJmkEKIVq/QJoW613xdJKbM3opwDKUI4npP+nbLJREr3X1k2sTedq
   leCyd2pK6c+38cZkRyuRlw1WvX2UCwyUqJUpTFsoylArmCwj7Q7lgwsZf
   V2ASnh2ToxT1kOp08pRCVWS+Q9jYsVNKEQB3ud9qpI2aPmCqN82ow2AVo
   w==;
X-CSE-ConnectionGUID: uL2sQsXlTIa+gCwIvZTQIw==
X-CSE-MsgGUID: rGW2x/GyTJyKJA/8xno37Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="82032608"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="82032608"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 11:39:50 -0700
X-CSE-ConnectionGUID: TIL6G+HWRvmHM4uEuWIYyg==
X-CSE-MsgGUID: DSCmTtkUSW63kPi7M6zNGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="242197355"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 11:39:49 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 11 Jun 2026 11:39:48 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 11 Jun 2026 11:39:48 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.0) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 11 Jun 2026 11:39:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pL9z5Z6V14Hj0KUltzSiYemYzEjDT95VJEaCErTfJmDth7Smy2dg1wszNu0+E5WGsZWnwv0zOCeo1ehxdN0LhWVriGa8iAERYJhHSUj3XUXNHWFyo5jpAReAEah8ZTDpmd8JwarV9ZxI3aqmrcueG+6s0grZ6W/nIvRR3yHnW5WuFBYCNN+F6ZZtCvVshptE507HRdT+S/aG/mZ4lFT8+1zDUPTTzPfah3XqUkWTDsxyUXFS6W9UhpA9wCAxJg29iyFh3435VHUZT6/GtR24rmMRflN4H026bH8oIZpDigsTI/CbXWLQVuxrNBkod6OdX685F+oz5c1lGTAlwe5FFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6yATTo29rTq9NfYg3yjdo3F+jKKzlhR5gRYGr7UGzXE=;
 b=PCHt0US5XaGPzqS+XljHviJT/P315HCuAViDVoiEKMO3qGfoudTzxtvoc8REeAWohnMB37g6xOkE5KIO48ifyvVGI5Qgogp5n9pouYiz/6WeIk+1wjcVIPCNJXczFSGuP1B00Vp24ioX7psjdIt2dpag4eUJjzS4vxhhjpS51Ol6gTguIZ/7VKeR1NZulu46hLvk7QXp/mu3wRGiHCo+uWD0oSoWepdSwdXpmBT1VuiqOcVMwxBTGpyK+pBfvaBL7oBYI3z97MoKSCThak+rY2Wv051/VpQ1Sybf2xtn/7FVhQXftv6l6Qv5fx0csGhNjosiyOG8nR7A8TvxLTuW9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6978.namprd11.prod.outlook.com (2603:10b6:510:206::12)
 by BL3PR11MB6435.namprd11.prod.outlook.com (2603:10b6:208:3bb::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Thu, 11 Jun
 2026 18:39:46 +0000
Received: from PH7PR11MB6978.namprd11.prod.outlook.com
 ([fe80::f60e:1044:67d7:d8fc]) by PH7PR11MB6978.namprd11.prod.outlook.com
 ([fe80::f60e:1044:67d7:d8fc%5]) with mapi id 15.21.0092.011; Thu, 11 Jun 2026
 18:39:45 +0000
Message-ID: <fcc9ba0b-c0e6-4ed3-b6a0-70038a4993c3@intel.com>
Date: Thu, 11 Jun 2026 20:39:38 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/20] ASoC: Intel: catpt: dsp: Use guard() for mutex
 locks
To: <phucduc.bui@gmail.com>
CC: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Peter
 Ujfalusi" <peter.ujfalusi@linux.intel.com>, Bard Liao
	<yung-chuan.liao@linux.intel.com>, Kai Vehmanen
	<kai.vehmanen@linux.intel.com>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.dev>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>, "Liam
 Girdwood" <liam.r.girdwood@linux.intel.com>
References: <20260611115901.80438-1-phucduc.bui@gmail.com>
 <20260611115901.80438-3-phucduc.bui@gmail.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20260611115901.80438-3-phucduc.bui@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1P291CA0019.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::23) To PH7PR11MB6978.namprd11.prod.outlook.com
 (2603:10b6:510:206::12)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6978:EE_|BL3PR11MB6435:EE_
X-MS-Office365-Filtering-Correlation-Id: cc8b72ae-95ed-4f51-cdfb-08dec7e8cf3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|23010399003|7416014|376014|22082099003|18002099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: QV112bo2464LJoxIORSnDLJmzl+xsKKsyb0IaLw2yj8PHMIZUg2mm8ykG0fjcoKnxOYRmKLR+szi7MVOiq9RqbgIzevAuPQA2PiRr2jnM69W4zJN0rIdjwl7yhxqj4CiQDdDkVNJ7BOlL0XKZI8a5JNkBBchtawis+gXL4fXNt+e3YPvntUXnrPbL3YHgLcq/dxjqr5tbcZaiSe2EVQ2r3C4scC2peo/fqn4ssHuAzD1+EtEE2frWaaCcEHTVHIWSk/5Wgg9mSFSCwN7YitkknJCDSXlDdTt+yDXb+178CUW/1c/Pd4Jr3z2bR9K2L3P128zAHB1WCNF2a06l3TpKmczX/yjzPwqQb5nRA4YBt1+yCTgYlHN0xqNTN9AYxTXF4OR23nRmsiQmt8mOlaqxQyJnTeS5iLxX4PYr4MI33mdCBrnjka8sZdoNOe3RTD9S92M2ubIXQaNqzFzuNYTsFfkzOR91aKJbfL/PMRRZlBUts6A316Rhmng+uzUAtTShQoxYxCKJytkaq1ztEv4l8eWKFOgNjs6y3Jw3wxVX36k4ZHXAtohUWZhczYpeZ3HQKGFh5NJMp1EpYyhqOE/B9hSLc4ObHakE6N3YdF13XQTF9Hv0m5CTwae+MoVOf9sz+G/jWWuzenaS7alVpBZfFo7rcGUccJKFOx8ynnixhHJWdcPuJypg7d4WOL31RNP01c8LiTp3hENuNG5cqPRWg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6978.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(7416014)(376014)(22082099003)(18002099003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VE54Z1huNXFpTXFCd3pLUklIWWp5dlJRV2xyZnNhMFpROUVsTWdObWhlUXNP?=
 =?utf-8?B?THpjc0RucXFwdXZMTGw4M2tQcGFsQVVjZnJJcm1xTlBEcDdkMXBXUHdXNlA2?=
 =?utf-8?B?VUpiN05DYyt4S25mMDNmbDdvZU5GRm9NS0hPNzM4cHllU1RhNEVxcWxNM0gx?=
 =?utf-8?B?N0VqU2FNd2FOT3F6RFBkTUNVTWV2RjJUdGp2UkhIYkxPeVdxdk5NNTk2MS9y?=
 =?utf-8?B?cEluQ3dBVEEvajlQL1FBMUZHN2l3a0ZYVWhpS0hlYTdla3VFS0ZPTENaUEEv?=
 =?utf-8?B?TjVjWEl2bVhpMlByNlpscWVKdUhzaEJPM2ZjMkJzWThMV2x5Q1p2WUQ5UXdH?=
 =?utf-8?B?bE5PZXZ4dGtHcGwzMTJwTGRRdEJ6UWlTS21FL1V1NXZkVkptdkdWNTZpR20w?=
 =?utf-8?B?T21TR2ZvY29BNExyTGlySWpxQU8rVzlGdlp5YnpqQzdzd3RUdHhzK1lBKzQ3?=
 =?utf-8?B?ZGh1SWhmK2JCQy9jMnZDU2lvdUh2WXYybmY1WVRPMEFMS0s3NjVHcG1uVkp3?=
 =?utf-8?B?ejhqYXMrNDVjS0Q0MEdYTHlzejlxWDZ5ZS9CSTEzN09CYy9CMXNUcXRvRjR0?=
 =?utf-8?B?OWphaFdGbGV6c2MyRlhneVdMUlkzcis1S3I5MVcvemk4UElpVE9KOFowamxM?=
 =?utf-8?B?dnV3SURiS3lwQUM4ZDE1eUV1djkxT0Q5YXFsMm9iK0MwQVNycEdhNnVlUlRl?=
 =?utf-8?B?aHhNTFRCQXdpOE5JaW4wcEExUUxKckUvaG92OUlKaUtqd1pkditlVFZOYi9r?=
 =?utf-8?B?b1FCODRKVkhVR0M3aGJISnNHbEhXcUZ0TzZ3LzdISGc3Q0lWY0ZWa3A1Q2s5?=
 =?utf-8?B?TlJiaUc4N0czUkh5NTA0WVE1bFU1WXdOSkN3SzZyZFdlSFNYQ3d2RFo5SWN6?=
 =?utf-8?B?T242VTVpWmVkL3duakpWL29KRE1wRzV0MFVyZHZTd0VaYTNpNU9Sa3Zxci9o?=
 =?utf-8?B?QkVYU2QwVFlzSUtJVlpVVGZUVXRIMjJ4cWwvd3orZlQ3aEdXbzZTSGhCaVpC?=
 =?utf-8?B?T1ZnSmNTemIyQzFFWnBaQ29hbnhlSmVGZzJyQTZRSUxZSXM1dkhUVnkwL25Z?=
 =?utf-8?B?RFAxTHZYdTZ3bmo5RWtYYUJHME9Hdk9JYWNqTFJMVEZlbmxoZ3RyYWlqZkpz?=
 =?utf-8?B?eVZLaHNZb3BEaDVReXUzdWlQUjFRUjB2cXhhNGh1WDVSeEJTU01qWHpmL1dL?=
 =?utf-8?B?Mm9jOXBMOTFNeHRidmdieUhHUFpLT1ZHS3BDVFc4T1laUmdsejZJNkhKVW52?=
 =?utf-8?B?M0lpN1Q1RnE4bktCMzFDc0l4TmNvUVE4emxjUjNPRFZEVE1qWkUzYjdnSDQ5?=
 =?utf-8?B?K25TL0MrSU95ZkxvM05XSlJIRkErZnhoRTNhZ1hFRUFnR25xZzY5R0NkMTNx?=
 =?utf-8?B?Tmh4WGY3TEo3QkYzNXJVUzhraDM1TGtZdVg5WlU4anlRdkxEaytuUlVaOEE0?=
 =?utf-8?B?MFhOQmtYWWhtTE5VWXFpdTRWOURHeVNsK20veGF5UFMrVFc2c1B3K0gxM2ZK?=
 =?utf-8?B?TkFaVjh6SWwyNUpXK0N6WUNmRWY3WkE5VzRITXdwTmFEVWs4RmgrR2VpaEtl?=
 =?utf-8?B?bHJCUzYwZDU2cUYrU1NJeDdLRFRNcUVKMUt5R3RCa29lRDJ5THZTT3NWaGZ1?=
 =?utf-8?B?VzNLVHBFUzJEZGc1RmtySmh3QTNlNUlpRDFXMWFjNkhweFFUQkc5cWRnZnZj?=
 =?utf-8?B?N09hL0VTZWZTVFpCbURtQWJYUTEvdyt0Z0YwSTFSWitRR2M5SWJ6VXZETEMv?=
 =?utf-8?B?WndQN1NpMkVJM2phUWtRSUV4MUZ4eDhKK3lIeE1FcVZLVTNwcWVxZ2NZUWNC?=
 =?utf-8?B?M3c3WmZ5RWFKYWN1bFQrcDN0MUZ0MWF4RjdvdWU2dGdUOHI4TjNYeEl3a0Vt?=
 =?utf-8?B?QVdHc2dFYk1mNVc1akVzNmJicWczRGI1dGFCb0QwUGVBQy95ZnJnUDh0UDc3?=
 =?utf-8?B?ZFZaVXJldUo3ZEkwWGZCK2pHV2RnZTRGT3A0TkV6czVhOUIybFBvNEdZZUdN?=
 =?utf-8?B?TDRlc09xZURUMG5nektOekwxY0Y2cVdBeS9tTWVWVmhwaStqUnhIcHpzRm0z?=
 =?utf-8?B?d1kyWDhkWDB0VkxCWkJOZDN5NzdRcGtWSHd6R3VoZXlFbldGcEpUdGFteXJW?=
 =?utf-8?B?aHl6a2ovWEFqbUxwaS8wQldTQ3lQQ095dlVuZjFieE1KSkY2WUdMTTd0bDl2?=
 =?utf-8?B?REV5MHgyc1JOZlpqRkVVRndGbFdEdXhiZ1ZDVkhkR0s0QVN4c1ViMzBjK0RD?=
 =?utf-8?B?MmUrang2ZW1Db0x2MGpDNk1OTnJQQ0NCRW9DdW1xY0IvK1RpTncyT21tWi92?=
 =?utf-8?B?eSt5eVZCcGhvMlBxbWN2RDdQbHdOKzdPVnZwdkd3M1h3aXFIRGxqdUQ2eExS?=
 =?utf-8?Q?491t8Q4BkIC1qTqo=3D?=
X-Exchange-RoutingPolicyChecked: gDbGSDi4f0BkDrQiF6ZFSyZc/cXVuNCAqugViQdunMzf185T0KAXDHp8lNODouMKChFbqEOe56PYnZU6e74wZtUul6TvJED+nVFldClxfDtWq6n/dQ20lI9hiFUZsYnzpkVjBbp4hpPzwtMmDaBIR8Fumvj5AzEJm5aOo6lVyVQ4j0ZUUgbWs0JWvFtanxqv+QXsa7UOkb8AZgJ25ZHf9sCTrLJTJnWe/TYbOKZPkGJEKNqIBsfHKSonq/MJhzgBRHTJuJY1attKmp9e77DoigPmY945ZCzQpSPGtursuyH3wFVUQrp3yHwdL4tdbAMmlUAJ+Qmcdtq+PD2M/60iVw==
X-MS-Exchange-CrossTenant-Network-Message-Id: cc8b72ae-95ed-4f51-cdfb-08dec7e8cf3e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6978.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 18:39:45.8061
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gct3VyIeJZFt8uwbjkH0bZSjTXV1Nk/BCxoNQVOpcpYUQPTo3g60QLIr/JCWoLmzn3cGO3lUXjKfn+xqzZGN7ZA+b/7PPQJJXrV71/Ask0A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6435
X-OriginatorOrg: intel.com

On 6/11/2026 1:58 PM, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Clean up the code using guard() for mutex locks.
> Merely code refactoring, and no behavior change.

Already part of Mark's tree [1].

[1]: 
https://lore.kernel.org/all/20260603085827.1964796-2-cezary.rojewski@intel.com/

> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---
>   sound/soc/intel/catpt/dsp.c | 11 +++--------
>   1 file changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/sound/soc/intel/catpt/dsp.c b/sound/soc/intel/catpt/dsp.c
> index 677f348909c8..1eb1591213c4 100644
> --- a/sound/soc/intel/catpt/dsp.c
> +++ b/sound/soc/intel/catpt/dsp.c
> @@ -256,17 +256,15 @@ static int catpt_dsp_select_lpclock(struct catpt_dev *cdev, bool lp, bool waiti)
>   	u32 mask, reg, val;
>   	int ret;
>   
> -	mutex_lock(&cdev->clk_mutex);
> +	guard(mutex)(&cdev->clk_mutex);
>   
>   	val = lp ? CATPT_CS_LPCS : 0;
>   	reg = catpt_readl_shim(cdev, CS1) & CATPT_CS_LPCS;
>   	dev_dbg(cdev->dev, "LPCS [0x%08lx] 0x%08x -> 0x%08x",
>   		CATPT_CS_LPCS, reg, val);
>   
> -	if (reg == val) {
> -		mutex_unlock(&cdev->clk_mutex);
> +	if (reg == val)
>   		return 0;
> -	}
>   
>   	if (waiti) {
>   		/* wait for DSP to signal WAIT state */
> @@ -276,10 +274,8 @@ static int catpt_dsp_select_lpclock(struct catpt_dev *cdev, bool lp, bool waiti)
>   		if (ret) {
>   			dev_warn(cdev->dev, "await WAITI timeout\n");
>   			/* no signal - only high clock selection allowed */
> -			if (lp) {
> -				mutex_unlock(&cdev->clk_mutex);
> +			if (lp)
>   				return 0;
> -			}
>   		}
>   	}
>   
> @@ -303,7 +299,6 @@ static int catpt_dsp_select_lpclock(struct catpt_dev *cdev, bool lp, bool waiti)
>   	/* update PLL accordingly */
>   	cdev->spec->pll_shutdown(cdev, lp);
>   
> -	mutex_unlock(&cdev->clk_mutex);
>   	return 0;
>   }
>   

