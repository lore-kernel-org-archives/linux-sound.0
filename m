Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A03763EFFC2;
	Thu, 16 Jul 2026 08:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784190747; cv=fail; b=Gc/fDhzE7wWMe2IidIvtaNS44cvRmYrsc/RL0Ii60jJ9tklj02p+XDiKrnXyyRJImwJNqvdFY8cZXUKLt4NHetmPyjjqNmvTv4QTn6bD1/NMtB37IkqOwSv0pI5zDq/Knnhx0JTxtzYZoQuLetXap3ONBQuhKZOQuDCgjurskdI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784190747; c=relaxed/simple;
	bh=MlTbB4cVvru7UMObvcrNIa2sK9yZ5EgKdVRhV9i+Eb0=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=BxMewu6p5MkmZ2H5nM0iol4t/fLMGfGClAL7zHKZPCOKUFSocj4Q0+cRVJ2eMQ9PmheKN79zZd/9AVLRjXAmxzdgGQZ8dGWA60pXcGCcqNqHb/ORjkSQI/YbqG7FMifouoOfJpGv1vWRcCQVw1Nu6ogXhZLJE91+r36nw29webI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AWVW8sRs; arc=fail smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AWVW8sRs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784190744; x=1815726744;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=MlTbB4cVvru7UMObvcrNIa2sK9yZ5EgKdVRhV9i+Eb0=;
  b=AWVW8sRsOwclANc282zCqiI4XdnxFtx9/xh6dbmChG17XnPtAAkuRqbd
   E07Z4yojC6q2DJfanPEtBD2p1eIIfSKxwTkeuAg8iizQOJbrBf8LaAa4W
   EzhvjsMeqzys2nwqS2z/J8ciB2TrIfmXVGgXatHloBdEBXx9XhygmaMtR
   WDxSE1Srd7J+11tIrWEJYr40WXw0oaQNBmU7b4z9/yp1V6xs7CHE090pT
   fEElNMplJmEk0BlHTUBc/qgA49qAGbc9GrHa3/msK3DNzslnmsFBIvMaf
   smNoUhMKjCf5loohuTRkSvBiGe+oD8vHchm4edyswt/1qIrfcwsj9xbWd
   Q==;
X-CSE-ConnectionGUID: W7vQ8+GWTyCVIPjmmiFKlg==
X-CSE-MsgGUID: v33hjXqyRX6HGGrkRdc1vg==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="96208684"
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; 
   d="scan'208";a="96208684"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2026 01:32:23 -0700
X-CSE-ConnectionGUID: vu/CD9ohSFKtjeBM2zPI5g==
X-CSE-MsgGUID: +6hObV4ASVy75qyfv3sBAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; 
   d="scan'208";a="250069830"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2026 01:32:23 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 16 Jul 2026 01:32:22 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 16 Jul 2026 01:32:22 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.59) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 16 Jul 2026 01:32:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ngPIujag7R4UeS+RmM/hbdkxDcAbwSgDBIdCdFNTsPMJEBT+7HS2R7gpTR+20jBNWy9AvHLBEvaRCY0x1PJMDhRFMk0V9JQXz4c6d/0HKyKBumiwklk50LQRHaKzWHtkpml+0MF6vl5fDXA5doNBTBci8gCT2b8B8l6/IjLmcn3FdMWCRdglknz/NneI4Jvo9BqSMYCGV7uKIpEJQ12DVGXckKQmYx6EzgoOF4YCmRX3yuJqa0pea35yhShVPgIuUZpRnMCA1O/eFhz18muw/XNvqfRbc2uRnKbtUM1r8mfWHCMeFzEm+fqFVGVhAklhkfNpuRIzXt9QUKCnzyK2yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tqz6+WKravrp0sCgjEQ3QDRnWqLVkV8zAZw0f5Cri2M=;
 b=mRTcMnU4ejWBAEFpsxQ/8yzJWrUP39M3aWFXdH6cWB5s86cQftdgUUq+i6I5+fV06EomiKDMB/JEfgtnB6G63OxVWXyG4OrBoF07OF+QVWrCBgDpwAvaSpbYU4y4Ayv//UTravYtrw16c0AYUX19guG6dL06CAxMYrhMgvj/+SM8AFdO8HAoTxXO0QH0w4UayCY81Qzm15VJohGXIekVDatlkHCm+nGx6MZ7vHFP97JpWWbkVpZ6yc9wC4YFnHC6AX4+qooZY39R0GAucgttH9STZu+1/igwcnozwF3zVvR7PZxwX/RHC4vffHOrO3+Fz60YNcSl479FyISOT+68Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6967.namprd11.prod.outlook.com (2603:10b6:806:2bb::15)
 by IA1PR11MB7385.namprd11.prod.outlook.com (2603:10b6:208:423::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Thu, 16 Jul
 2026 08:32:14 +0000
Received: from SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4]) by SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4%3]) with mapi id 15.21.0223.008; Thu, 16 Jul 2026
 08:32:14 +0000
Message-ID: <38a6e62d-eaae-4c9a-96b2-4d1bfb8be438@intel.com>
Date: Thu, 16 Jul 2026 10:32:09 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] ASoC: tas2562: Fix default digital volume
To: Mark Brown <broonie@kernel.org>
CC: Haidar Lee <haidar.lee@adlinktech.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Shenghao Ding <shenghao-ding@ti.com>, "Kevin
 Lu" <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
	Liam Girdwood <lgirdwood@gmail.com>
References: <20260715-asoc-tas2562-put-retval-v1-0-97bf467c924e@kernel.org>
 <20260715-asoc-tas2562-put-retval-v1-3-97bf467c924e@kernel.org>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20260715-asoc-tas2562-put-retval-v1-3-97bf467c924e@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2PEPF000008BD.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d8::68e) To SA1PR11MB6967.namprd11.prod.outlook.com
 (2603:10b6:806:2bb::15)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6967:EE_|IA1PR11MB7385:EE_
X-MS-Office365-Filtering-Correlation-Id: a3e97483-2d8b-46cc-e533-08dee314bce7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|56012099006|11063799006|4143699003|9063799003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: kbgiSTH+XVN8AdovJjdKDABignURHhlazFWbEewXFPHjZDl9uB1DTxPuoOJoL0E6ha+ciJJOigvaT68lY6rt2TWODLlyDnUzc42e27a8I+BVBWuNwB2KcjIWl9c8PFX4OH7s8y18z59D/hibku/H0ZB5YkU1lty2qQ1Lhiu4VCLJMLDJHkZ3+afMzA50boGwbozN3IRg1spqVGazunjvUaxmamOAcF634iEfRHC+Vuf18giGtmhMD+w51HpAG9tKuV7hGA0vDv2KR7ACYSIhpo0vS5opJfn3pPB88HvAHQfZoWz+j3iOjfc8CoSY+LJ7c7fyAM9YNDJDfAtetDAXMzog7DvuNbt6a+gTxmYLLGktd46dyyiKq6DVcS5gDG1kC+qn9fIoFFDQOHU06FogXV2ktdZCTxIlCeMEprrfWTYHvM5kF2CtqfBBrTO7sVLDFlH6wbZaZvytnGzirTylG86/66m3fZ8MZGbZeKq/LatxxHtsPa7Iln0cKeqJ6x9hMtGkpVYvjg1FD3t4vQaOQjz/S/gv/C4cijIWnkpP6pwZZi9q/2u4+43yk2rgzHtOIoleK4dDbKQEkuEhpOEwHdhE4OSO6DZlKsWyCkHQmVfQkyhMX0NXNf0a8i1xWl3ag8XNjMLblxiL9xBSCCE3akGqiOj7PdZQXWW3iVH4jNc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB6967.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(56012099006)(11063799006)(4143699003)(9063799003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eGVUM3d2N05XQmhtZFNoaFBPK3gzWmJ1eldwbm1SdHVhOWFYd2U2SER2S0hk?=
 =?utf-8?B?WWNLYitFbVVBR2FBcWYyVUFvOTFNajVPc2FtV2F6WUR6b1JXUi9HcTFCdml3?=
 =?utf-8?B?cnhVbEtOYVpGeHFpdEpONGNUUlREc08vZm53UDQzS0pIRXdsSkdIOVpCTzNI?=
 =?utf-8?B?Znk5MWpGOEVtRFl6eStYKzV5NEJHaG5LUkNkNTVycjNYSmsyVnJRK245UHZG?=
 =?utf-8?B?aTd3dmNSSDl3Y09nVDlKQ0FlUlpnT3RCcHRCWVdUeTZLc285eXI3bHl4Nzl2?=
 =?utf-8?B?RjBmN20xZHBUNlJ1OWJEdm9hTmtsUXZuMHhBWndYZU5VdDZOaktVWFRtUDlZ?=
 =?utf-8?B?NkJyZERwSU4yT0hDMnRWNHlmQzlLdkIrSGVEMTdxYk5DQSs2S0duSGliQjhO?=
 =?utf-8?B?dG1xdEpyakNORGlSMXJVcjZWYUtoeVhFSjRIekkyRHZFd2NSTVNFOFUwTEgv?=
 =?utf-8?B?Qkd5TERWbnFvblJjVlY0TGYwUnBESktRUldzaHpjYUZLbU5wZzYwdTZxaE9S?=
 =?utf-8?B?RFZzSlljcXRDeTFIQjRFcTdRVEk1NlBtWGJ4eFN0WU1BVFoyRDdUVG85b0pU?=
 =?utf-8?B?M1lGbGxyTzhXaVFDK003Y2tsNkRHVVVuZ1lZb2Z6OHgrOXZ1UEJCLzhON2ph?=
 =?utf-8?B?TEpiM1pUVTBwWmRGYXpFNitBN1dvaWZsL2JtdGFCazVhRWxIQWs0UXNRNno1?=
 =?utf-8?B?d1FaYVU4TjQ0YmRHbHUybk81Y1dRVmoybjc2d2xmL05QNUROenRjc0xRaHhD?=
 =?utf-8?B?YzdERmVSV0MyODEzQlBzb29UVnIxRTRCazZ6dUZhdXc4VlF4dmlZVGZoMzV1?=
 =?utf-8?B?VmtjZzRobmdKOUdBeVpQUjJLZXA2UGs4L3Jsczc3RWhEVzV3WHNBZXVBdk94?=
 =?utf-8?B?TW1LZGwzOWZnWkRKeHVObGxKdzRtVE1XUS9qUDRCdzlMZURrK0w1RVc5eWdK?=
 =?utf-8?B?ZDBZZlJPdERiWDdvTjhkTWk2SUlDN2dibGF2ckprS0JKMnFYd3RaTWpiY0hR?=
 =?utf-8?B?bkd0WkFCTnNxa3YzQzZOVXM2NlhmWDliRUZQSmNUSElYaldEYmxEcHFTUnhp?=
 =?utf-8?B?aVJjU2k5cWxlcnpTWjhYRmFhL3dVT0ZEaVY4U3lmVVhrY3JUeFVkWmVWd2ll?=
 =?utf-8?B?ZlpJcnF2eXV4WXBwM2N5Q0ZWcnZHM0IzUjBvOUE5NC9valNVRmNqQXovRzhF?=
 =?utf-8?B?bGFxZHViQ0ptbk5HUEVDOGVZSFhYTjJyVVNub2t6UFVSbEh0eEc0REUxbkZ3?=
 =?utf-8?B?bjFBK2hwUUtlNDFOYk0vY2k5S0F3WnJWQXBib3hweG5QUW1DZy9KdXJaTlJ5?=
 =?utf-8?B?cG9ueGFsMFZHWXlJUFVxbTdxaC84WlFvV3JPYjJUU1dvaGxXRmxmMzR4Y3hR?=
 =?utf-8?B?MHdNOUJOMGszSjJmd1dtcmpaUUpiTzJrcFJJeExhVjlUTkJhK1pCOXNxWXVH?=
 =?utf-8?B?clhFNjFBOEVMNmNHdnZNNzdpQVI5QkUvbTM2NGlISUhsa3V1VUs1akl2NlZD?=
 =?utf-8?B?VzJXQ0N5WHd2aURDSWZFYytkRlYzVjhndzA1RndJNDZRL3Jlbkc1RGM1TU9O?=
 =?utf-8?B?S2VWR0E5WHpNdE1SaVg2Nk00eHV0NEYwbmMzajJBdGRUMXJhTnRqd0hJcnJa?=
 =?utf-8?B?ZThtVjlaSXBKMjB3cHRvYSs5VmtrSGR6K1BFRTQ2dWVtSW8yeVBnZitRakl3?=
 =?utf-8?B?WkE5RFROR01MbFBiTVBRU2tCMzJwRmVzMW5FaDJUNTBmNGxBVnlSY1BtOFh4?=
 =?utf-8?B?ZFhTSEFDNi9abCttL2sxaHJQVnZKUndObVA5Y3YxYXpPemNiSDZVQkZoTmNZ?=
 =?utf-8?B?bEN4bFZwOVVLMmFJZjlGVWNuNDlEb3VMYW84djJrWklJZzVOZkFMMU5hM1Rl?=
 =?utf-8?B?RlkzcGUwMUd5Y3FKYTRCOEEyYUMzUzFXMjhJY3RueVlFMkJRVnpSNk5lM3kx?=
 =?utf-8?B?aTMyMkcvRFRPUEVMd2VwN1IwT3pVQXFkNlU5UmZRcXVuQUlkcnhMYldiSldN?=
 =?utf-8?B?UjNaaENFS3lCY0llWmQ1RnRVYzErb3RENGl2SHdYSXB1UDZ6U0VTRU43WWt5?=
 =?utf-8?B?Q1VlOHVDZ1k0U2FiUDNOVWsrenFSOXV5Q3p4Y1dvUUZ5MEduVGZpVVpCRXM3?=
 =?utf-8?B?YzVNWG4zQVNNQmxZWklocnVGaWdXOE9nRGpLSHBaMWhwWnBSSklUbkZEekYw?=
 =?utf-8?B?bVdzQWlBdUFUN0RDZjVObkY2a0daelowQ3N0dng4MDNzQTFFb1VaSCtjVW52?=
 =?utf-8?B?ZTdHMlBjVjgvNWM5ZzFVTGJGL0Jadi94MU1oK1VIU1FxbVNXc3JINzNMb1c0?=
 =?utf-8?B?QjVsNWNNa1U5bmdUMWx1bnppNm9pbWNxUDVTQXVtWlpZTEFqSzlsdz09?=
X-Exchange-RoutingPolicyChecked: pbQnp2Gudbwdayi1fAliGbJT9KYdm1tOeoBEYDlE88HY44KeQ+tgQQNdTpztt0md2uYyNlT62Pc4NqVOr4p1UtyJqX92dC5gqSNkFV5rxSck4ljzdJRgV6XXUv5/82whfs6lfnzzAeatVAamh2A4S+dbW+qFAoWFMWsse0E9f880Qeahv4mIB85J2DOcbDeb8dDaDPODANZ4eXxWHPGY9gPp1fex8hRVyzPMt/M6VnyLRcJEnDD2v7ar0h44tn3anBXVOvOlECfIWl6DK80cbspnuuFb+GDkjkSaWv5OVLoi/DPMcwfSFfrfoybzQOjwzkx+9rI3Spl9gVMUIa3aDw==
X-MS-Exchange-CrossTenant-Network-Message-Id: a3e97483-2d8b-46cc-e533-08dee314bce7
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6967.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 08:32:14.3662
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9fA/YGRZ16AH7iNidFoWhKJ6DtxkGLxExOXmH5wTLMKmtpJzubCxCFUEtFqlGyOG/fhRSC+Q9Ik/+Kf3K9qYhQKhZoIEbUvx5COAhq6E7X4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7385
X-OriginatorOrg: intel.com

On 7/15/2026 10:18 PM, Mark Brown wrote:
> The tas2562 digital volume is spread over four registers and is implemented
> as lookups into a table so the driver stores the value for the userspace
> control in the driver data. This defaults to 0 due to kzalloc() but the
> register default is 0x40400000 which maps onto something a bit over the
> largest value defined in the lookup table. While it's not an exact match
> update the default to the largest value, avoiding user surprise due to a
> sudden change on first write.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>   sound/soc/codecs/tas2562.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/sound/soc/codecs/tas2562.c b/sound/soc/codecs/tas2562.c
> index 9b863b000470..5fdbfec8ce3f 100644
> --- a/sound/soc/codecs/tas2562.c
> +++ b/sound/soc/codecs/tas2562.c
> @@ -738,6 +738,8 @@ static int tas2562_probe(struct i2c_client *client)
>   	data->client = client;
>   	data->dev = &client->dev;
>   	data->model_id = (uintptr_t)i2c_get_match_data(client);
> +	/* Register default is 0x40400000, this is closest */
> +	data->volume_lvl = (ARRAY_SIZE(float_vol_db_lookup) - 1) * 2;
Sounds like bug fix to me and a Fixes: candidate.  That's a nitpick 
though and not a blocker.
