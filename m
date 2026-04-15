Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E58B12FE056
	for <linux-sound@vger.kernel.org>; Wed, 15 Apr 2026 09:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776246532; cv=fail; b=dudVYjwRrAYZYEtsObbbPh1j4Nwf0H0sbrLtmS5hQ8r9l+OVIUkpKu567kDRYpo17kLCmcOgQD9iBsgyA6CsHZ4SjlLqxhZDwsKH1G0I+hOOGXVogl72FtczO3ys/yMmJGSNYM5ee622ghPXKRBzEvDfMgg5YvocFghHGZmz210=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776246532; c=relaxed/simple;
	bh=Mud9kgCJg3y0cvaNfTZ4NB7EjJs2brlG1oF1Gq1Rois=;
	h=Message-ID:Date:Subject:From:To:CC:References:In-Reply-To:
	 Content-Type:MIME-Version; b=LCLAj9aakop0xTRp6bMdIDj3iv87b6FG5apDj5HygfHY808vZNVQtRzhNtxBnHlSLQZ29ypkzFtXBt91dB1O3jZMjY9EiQ5Ldshp6VqR87UB5MmtZ+z8fHCzk5y4c0fHXuAg+vLf7esIpmuDowgTkgn3XY+TNhmfWWBI9OM9jV8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YSp3NCjT; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YSp3NCjT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776246531; x=1807782531;
  h=message-id:date:subject:from:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Mud9kgCJg3y0cvaNfTZ4NB7EjJs2brlG1oF1Gq1Rois=;
  b=YSp3NCjT57MMTMsOpAwM1X9HZI2IHuOJz0oCWjJzo3waVz/lUO38ZW6q
   dTkuPq6J7c7kJbHpap8dPRtmfxyr4IWHIRavxbA3jQouWait/0AFyDPyT
   Xtds3mDJa2+gt5o35vKJvVjsPEATjbPGo042GRMoQxtQfR4gzRtWIA7rt
   eSvH6M2+QkqHRHCwCqlfT+pQnVodXGauYxUP/QqXbdQ/eZvcZP3FrDLN9
   U+9YxOvDeeDgOfKeZl410WEx/dIvBxtTF3e6wwnsdkevN1C+HK+mCAe1l
   0kca0RO73cau0Wz2dLfh+2TKbESpWqXiBWmadD+jeqmyLnSk24k2AkvF4
   A==;
X-CSE-ConnectionGUID: 59nSjtK/SF6AHC87rLW8gg==
X-CSE-MsgGUID: IKkBd2WTQqOefbyd2VxIQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="88298670"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="88298670"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2026 02:48:50 -0700
X-CSE-ConnectionGUID: sLjAgKV2QjiSV0FKOQArrw==
X-CSE-MsgGUID: VHrgej8DSnas6ZzzdMvd3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="225682564"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2026 02:48:49 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 15 Apr 2026 02:48:49 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 15 Apr 2026 02:48:49 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.31) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 15 Apr 2026 02:48:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YNOOGcTdU22vvC0ow73Id7Cw62j3O8+tqK0q07YXDZZFDCi+ghyoag0sCGHexCdZ3jUa9E6PE+HIWmtjyFrrLZcvm8NWiKZzw5MtQFaIYS0iHGx+VXsuntCJ15D8dJ4/32nUl9VLCInx2NSs8C9+GXY/0uW8zUr6gPI1OBhB5ZrP6wKlj817q5M4ZXbGsaUVfFxuKs+aSRSmWK7F6a4Y2rfsQV7OnUz0k6FJN3k6vZcEB7mtn7ou5k4eeE8u+oW/zC2ZjRe1wVG0gcCWmWXtwTllXCYDDFXY4rqLzvyZpQH7LSIQvdU4WdYVK1VRW+JlSQw5OH1Dg8l3Ul3pBRqPkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iGkuzJIHCDtlSjTZ+3DX/e6acTEkS9hnKDrj/9KWJz4=;
 b=Dxin8LezHpNIfAOsc1ZzALspA2lO/ZPqTHI89PauxWXqsX26S7Yf5GA8mF+NrYDdEdj/3pB9iNiPhnQePP+Q6It1RlUSrFTUAwZurt7O1AQvQ0HtQGZo5kk+M36EGnNCA/W51MbG0ZWW8mmJ3pqRNl1m8vf4+01DxnpFaOn2gW4ICEXBZ4YrSIJBnJTSuihY2y3bwlfh4YkeTusnveTmLbwwHGBgN+JMAWlnjb9l2SF9S491oHzok4SrJTLDRzmGgOQTznqgL6iZlT4aVYvuQ3vbiqvpQFW0va67V7rZT7CHK0MDe3YAWY7+8nWmVHBC0LDG+Mc2F5xtSYEw5nVXMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6967.namprd11.prod.outlook.com (2603:10b6:806:2bb::15)
 by DM4PR11MB7254.namprd11.prod.outlook.com (2603:10b6:8:10e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Wed, 15 Apr
 2026 09:48:42 +0000
Received: from SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4]) by SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4%4]) with mapi id 15.20.9769.046; Wed, 15 Apr 2026
 09:48:41 +0000
Message-ID: <ff22df75-6f69-499a-a1c2-3ad8cff9b985@intel.com>
Date: Wed, 15 Apr 2026 11:48:36 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [Question] ASoC: Intel: avs: Guidance for finishing new board
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: Carsten Behling <carsten.behling@googlemail.com>
CC: <liam.r.girdwood@linux.intel.com>, <peter.ujfalusi@linux.intel.com>,
	<yung-chuan.liao@linux.intel.com>, <ranjani.sridharan@linux.intel.com>,
	<kai.vehmanen@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<linux-sound@vger.kernel.org>
References: <7asofwgi5xn2yux4nau7xvjibfokdzipxsmmjfkixs33ceguaj@22xbaftccepg>
 <80900a76-f35e-4959-a178-f66b718ab9cc@intel.com>
 <m3uuy5f4txsfi4wbocasaqpf64w23cxwobv37thxnp4nzmz4vj@xahbt6bbnudq>
 <8206ed79-823a-437a-9171-ec8f24291dd1@intel.com>
Content-Language: en-US
In-Reply-To: <8206ed79-823a-437a-9171-ec8f24291dd1@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI6PEPF0000022C.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:808:1::8e5) To SA1PR11MB6967.namprd11.prod.outlook.com
 (2603:10b6:806:2bb::15)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6967:EE_|DM4PR11MB7254:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d8b2049-2fc5-4eec-7c70-08de9ad42d2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: cP+nXLQ0OuPTP34ZHyS2ZvaotCvZe4yglQ1adlsuBXgqJv/qN247Wmap0hUnWkYc1OKwNb3puJBsFC67kwcOk6Me8wcledtXhYDdGsIC6jGmrQSIrkY8xPoqhXOTTCxyIoXU8HY+nTxqXaHk2mablhVaB5KkLckllJr9Qsvs35RpCK72r6LOsJJkYLV+lXQp2GCc4i4SltQ1eVPjQhRoQSIGWuMzYOtj44GBxBPWG4xSwf3clArcYlW+cHECc0PRldNT6mHkxPl5Hm0Gb7preOFusnpYeuY6oJPfF79TKbyuJrkY3zqLxzpJXQbGQdcwiBV/k+ZVB4B9RGRaqdC7Y3ND9pX3KKaGLkmw8FwZX1gZMnfk1hqSFiGymJH1flI56ctScsXkS1Y4TV+huOdOq7gYngmuv4Vxk1jXZXJ5NfatIPI7SAB+4WzTRMdsoQPOzn2Qg4y9oNHRI3DJDPSgkUIg/KYMqrtEXI42Xp8s3lneL8sSJ415M2j3IXZkuYH6ipVCVSJPnHiA6RTKPDrBBfKgQsfRE2RMew1UYlM3//OqZeSggpJ76zk/nGQUmFgY13LRhIU89gs3uskCAhflvFzjaRV2ImipB+B5fHFcbbip10FSU2igqoymomfKN8h5s0IaCTS56JO/k6dGpHc02cWyTNk2sIIuEH3JdQJ+MYdeBXyiyGWImBoKd6EekEF2qEuwnniiDs4GaXp6u7GdZ95uu3v0irq6vwiTbRDktpo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB6967.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WndUV2dBUno4a3REWEh6dXlwOFE2YkJ3L05MRkM1YnhCM3ozNVFZdnAvNW1x?=
 =?utf-8?B?UjNsd0JoQklaQy9MZXpqL2R3aXdRbWFvVVp5Q2NVYklQSWRPZksxK2cyUDRN?=
 =?utf-8?B?OFFzMCtic0tTK1FpY1lGVUR0VGMyanJJbkc4cndTZCtrNVhRK1JpdW41Z2xv?=
 =?utf-8?B?Zk9TTUJyaWZVNE5kc1Z0MytIL1lOWHNUc1MvcnpwRE9ZZG1Danp1ZGdoUit5?=
 =?utf-8?B?S1FpUEkyQkZNNVEzQmo2M1ZvOHFDU2FWa1FIMm92S3dCMnFSbGVlWHNUdzJ5?=
 =?utf-8?B?TzVyVVlSVU9heGZMOStKczZIL2haemxkOS9xMTBIU1JQUGZDbWlNeEp4TDVF?=
 =?utf-8?B?WE5wVW1TNkdYb3JVdTc3VVBXdW1EZkwrNUJGcEtZb0xxNkxISkw1VkdmVGVG?=
 =?utf-8?B?bi9qcWdlR1IxTzB0MjE2SFRwajhXSHlsZlZEcmhFc2J6ZXFtNEhDTENOdklF?=
 =?utf-8?B?SWZEV2RlczMvUEd3Zm0zbGhOR2dzUjlUNkQ2elNBN21xWE9ybjRpcmxjT0Rx?=
 =?utf-8?B?YUhha0FiYlgwZEkxS0ZBZXAycGM0WTJoVko1Wlh1WGR2SERaa3JqT05wbzV1?=
 =?utf-8?B?YVVlY3l6cE5lMkFQSFN3MjlEcnVudVFoY05XTXdvWHBhU1F1L2ZMRlVEWlRr?=
 =?utf-8?B?bTUzY3c1UXY0aC95VUkvQU5YeG5uOVN1dXgxaWo4ckxDUjd0enlsdjhMTTlN?=
 =?utf-8?B?aW5Gam9la1g0WHFKcER5MGF4T3Q0Q1ZHQUdVaERUQ2Z2K1l5UmJBNGRoSW11?=
 =?utf-8?B?cVhkR3VGZU8xV1hrWHVqaS8rSkQwZ2JOcEFLZndaWCsxdzFzR0FpalVoVllq?=
 =?utf-8?B?Z3VUMndYSWxTR0cwb3lESVZDTFBGdGJJdjZFb2FQdGJaUTlmRG1wcGtKM09u?=
 =?utf-8?B?dGFINkh1dStBeFMxUXdORXRteGVqRndZZ3NZVU5LbVQvdTFxb2p6VzBmZWJq?=
 =?utf-8?B?bFBrOFN6am1jQ1d0UzNudEhkSWw2elhkelVoVlMyK3FTdEVDcUU1OEk2VHVm?=
 =?utf-8?B?Wk92S2NTWURkNk1UR3RaNVFFTDJlaTZMM2x1aHQrbThFUkd4TG1XQ2FkN1Z2?=
 =?utf-8?B?UTBQMTBpTFhYYmNqV3NNcVMxRi8yZG1DMnJKYWpRQW8yd053V0MxaUZOU0M0?=
 =?utf-8?B?YlZOVW1BK0dJb3JTRmQvOVA0dkZtNVpJbmhnRmFEZnB4K0dvZFhUOVpTZkVm?=
 =?utf-8?B?Yld5bXBDTmZPSkJZd0JuaCswS3BTUHJsRjcrT3B5Q04yUEw4UHVpYlhNNlpI?=
 =?utf-8?B?NlZwWFYxakVhZjRqUjBpYlJPcW16NWl3b0VyNkZJUlJWSHNHbUNWWUtNOVky?=
 =?utf-8?B?WXpMQXlCK0gxbVdvTjdUeCt2Y3Q1dkdxdlhmQm5mVFdaTDFWQXdINTdITHJP?=
 =?utf-8?B?aUpGcmxsejFNMnV6QVovV3dBem0vRWROYUpGQlFGTmtBNFYwNHBMOGc3L2NR?=
 =?utf-8?B?akJNcjZmQjNtMVpsLzV3RTVUcmxIckRRTUZiVlJucGRPb1JTTm9Zd0FremtJ?=
 =?utf-8?B?YzJtdDlhMTdXVk5ld3JkcXRDWUNqc1NkK3hKS1hZZm1zNzBxZ281TWpGZWFs?=
 =?utf-8?B?d29pM2xlVkZhV0FiUjdPQTFCSnRrWGJ4V3QzYXVQWXNkRGQyRms0aXRIV3B2?=
 =?utf-8?B?akVpTld0OGdBaS9YYVMzaFFqQ1JhNkdxbSt1bDM5VW1UTlRCb0E2d08yVGpO?=
 =?utf-8?B?ZkFYZDM0ZU9SV1E2WmFqNlJ2Nk16d2dkZmhwSU5kU3J3d0pwNlJNUFRiUjhH?=
 =?utf-8?B?R013aGxtZGM2N0V4OWJtRlAreUd1bnJpMFppMXdPUTV0NVJzbExvY0RaRlFQ?=
 =?utf-8?B?TDd3anljY3Yvc1hLS1ljOWlRU25Rb3JyK1YycjhoeDlIcUltcmtOR2l1T0U4?=
 =?utf-8?B?c1NENDhCOSt3WitQbUdISEhTR0tZL0VicEhEWFBySHUzV2xpbVNOWFE1eGdL?=
 =?utf-8?B?WE80UExPaXQ0OUhpcFlpQUFWMjBPbmg5ZGJVelpvYndOekN0TWpWTWFGM1RJ?=
 =?utf-8?B?UmJXYUlvbTdoMEZlbnR4WTR6RUxibS9wQ25VZi9FOGFleWhmSDJjSHhpWjhO?=
 =?utf-8?B?TUZhRU9iK1dGS2VlQ2VjUDVieHdJbm1zR0VvZXVxVWpNYUl6VUVYaDhmRHhu?=
 =?utf-8?B?WTNSMmRsR0JEZzlwaFNYSDZRNVFoUXhCSTZ0enZvS3pOQS9EQ1hPRDdJTWU1?=
 =?utf-8?B?RFF4YzRmUXovN3MwUTFTZ1RRdmVXTnlySXFxYW9SNVV1VHBUVTBsVVIzbUlk?=
 =?utf-8?B?Y2I3bjhCa2pZNStJbWFuNi9VSGZScjZwdzVTby9JUzM3ZWw0U2lFdlMvc245?=
 =?utf-8?B?Y1FrL3hHTHhkVXZyNEJLcHpHWG9scW9Od2FGaXdZVXdrTFk5YTh5NVRCSTlw?=
 =?utf-8?Q?iBld2wUOlWWr9hKo=3D?=
X-Exchange-RoutingPolicyChecked: L/H1bReHxiLPB8gREYihU2wNpNT7erLoYIpZnpRVSGq4dBIOVFdPa8ewDWkgrZQQu6IWQRjBF4SZS85zzi+NKz45L+lzEnzTb85k5QSeez70uOqOqoukWEOP5lPI2P322bumpv80UVLjarD45Ytg6Me2xETAqse3t9QXsV8IiBGOet2w+ut0CmNBssx2ilcdf0Zl8uZpcnAbNzZKGO3qobE3PyVJJs270pSS/DJSXBmU9YYk6pw+7Pz16wAK2rhsQGerkEi039P+Lml1923d/tJnfv8hnoirdJ4dD3AJlR7eCcE7G5W2PP2s8m3+8EAW2MTdKkLrRU3WrfbX082hUg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d8b2049-2fc5-4eec-7c70-08de9ad42d2d
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6967.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 09:48:41.7027
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eknstrAYywVg1SdzdwlHhYVLtMynMDXOJEe3d5k8N1q8K/WwM48jv8VqeiVJz0vj5e4NmDh3RML0giYewuejTg1e+FAYhRvPFumDcCEPcqc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7254
X-OriginatorOrg: intel.com

On 2026-04-15 11:44 AM, Cezary Rojewski wrote:
> On 2026-04-14 2:30 PM, Carsten Behling wrote:
>> Hi Cezary,

...

> For the readers.  IIRC the above describes a hack, patching NHLT with 
> "blob" files available in sysfs/debugfs was never officially supported. 
> The dev team flushed that code later in favour of SSDT overlays and 
> later NHLT-config [1].  The former expands on Intel's topology rather 
> than playing with fs.

Obviously I meant 'the latter'. Sorry for the typo.
