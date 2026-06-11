Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E233D76;
	Thu, 11 Jun 2026 08:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781167678; cv=fail; b=pk4h6S3TBCAFLMDGvQGfJDrgKHZtSSefbecVsDc4dqnNw3Uu5jiekFsy/SbKEUenmC0EAk7m+nL6Ai+NdhE9ebXP832Av+G1JQ7NRt3oE/5edbP19CohB23TNjHqtB40SQ4gE50aWICNqd3DoodG4H6R2xT9JoqtsttCj8Dl8SA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781167678; c=relaxed/simple;
	bh=7UQ1QRe0/fnBsYQ6gsl7WZqp9xwMwGL7Lfc9wIkod6o=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=seAJafpb4zzbhBanUU1wxSYoV5/eVoLm6dZdANKb2DvOS4+qxwUgZC6e2n4PFhQCkPNHIQLCUZctflXBNo1ySFPkNSbM8Pf4KocVo4WzxDMFOLncmKamJQ1LHnlKpWXg/iDCaOF8PEkEYAM+96UOhBI/TC2QYtDcGFHrEQgRB3k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OusJyWFc; arc=fail smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OusJyWFc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781167677; x=1812703677;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=7UQ1QRe0/fnBsYQ6gsl7WZqp9xwMwGL7Lfc9wIkod6o=;
  b=OusJyWFcyYHnMvMysOxhoYosTevJnDxud7lF8n+BQnW8XnN4q4zy5MEq
   DAZBCPh1ECjEtMN60XY/4WndSQICuFRPNrC/A1bS6jZnSoXWyE9jKKjef
   j+SW2Q0On4dgRAdqfap25SX41GbQURNAM4P2B/OSVfK3Zp6mp89eDdiCV
   opBzVXiGGFu5325K7hEYzjC1bA9XBmRccNb2W4+Jd77QNlbENEEmG7sBA
   jMLd9O3aFjg6Z6vpwZR1m4MfgtRTVMblIc/h+fllp3ekow2IVznMmEIrS
   JMDAbfshj7HZDQQ7vTQxKjQPmswraWgrnbr42Kl6rjooWnzysh6Nc85Sc
   g==;
X-CSE-ConnectionGUID: tvNjkQ19Sd6SEhGB3OXqtg==
X-CSE-MsgGUID: 7ncAdl9ERY2g9b3+geBy2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="81955461"
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="81955461"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 01:47:57 -0700
X-CSE-ConnectionGUID: cjINbTYzTligeojTaotDxA==
X-CSE-MsgGUID: G4mMAD7cS5+qAkbvbxNxnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="243975509"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 01:47:56 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 11 Jun 2026 01:47:55 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 11 Jun 2026 01:47:55 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.21) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 11 Jun 2026 01:47:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qzni5zZ5pbGJ5rkf9EEX+TyR67u7odVgy7ABPLDpyy0N0XBdTOpwBUAsS105vlERcMLsS9X2RPLInP2eYI8Ce5v4fm3AzVVbU3gfJ6oVtTYBej/e8Fz7YOesTzuDFBznPXoQAZMv5VVqpyl1HNuMtClwrJSsaT/XAELZ8+2wr09SJxFbVsFF3t98KLo4KyP9BjIoqgvOGyUlAsvlOfPjvqJWwjW7I/aTjoQagrO2lc+IQF0LQUJ/aAUyX5RbGa54ywW9sSNsrI3RZMfPO+HtCH5wiY4eybdiiBVV+NOoTUJdZ3ogd5Betbueyi+TIaYJ31Q3GzVglqfMGacr5Z+fZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oNJPsj2B9h3NzknY8EwCNqPKh49LtRyF+tqTo9Ohhc8=;
 b=gKnPrfnqWXLBRti9MCCng4d1MgA/4Gx14MVtSnCqdSaWhaf98XPbS317XNwER5+7kGslATC7Nfz1XV7i0Qf/oiRcKBlRCXaV+xRvZIjWMppANWq/LDGD1r7naErdU6vjmQlnsR0sa5IjOYsLY5LQ2QaQS6F/nFwbZxg/s7l4Dip6g5g1uWq8YiUB2RCsFOYmrCjdyPPDae6753gzFrBIePNsVIUd8SCN1e5ZFpyGYawaRE5+isjzjevMJm7C5PXmcJ5C3DESSRlwhx8zWEbauhCF/15PPifm+rY+AN45EtHRRqwi0Kv8kyX7ITn2/yo1deFyP3LGnygoCxQXlq5mkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6978.namprd11.prod.outlook.com (2603:10b6:510:206::12)
 by SAWPR11MB9570.namprd11.prod.outlook.com (2603:10b6:806:4e4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Thu, 11 Jun
 2026 08:47:48 +0000
Received: from PH7PR11MB6978.namprd11.prod.outlook.com
 ([fe80::f60e:1044:67d7:d8fc]) by PH7PR11MB6978.namprd11.prod.outlook.com
 ([fe80::f60e:1044:67d7:d8fc%5]) with mapi id 15.21.0092.011; Thu, 11 Jun 2026
 08:47:48 +0000
Message-ID: <76232ee9-0042-43e9-a6e1-dfae82a2ee56@intel.com>
Date: Thu, 11 Jun 2026 10:47:42 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] ASoC: Intel: soc-acpi-cht: Unify device quirks
To: Yauhen Kharuzhy <jekhor@gmail.com>
CC: <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Hans de
 Goede" <hansg@kernel.org>, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Bard Liao
	<yung-chuan.liao@linux.intel.com>, Ranjani Sridharan
	<ranjani.sridharan@linux.intel.com>, Kai Vehmanen
	<kai.vehmanen@linux.intel.com>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.dev>, Mark Brown <broonie@kernel.org>, "Jaroslav
 Kysela" <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
References: <20260611-asoc-yogabook-v2-v3-0-3128447b67b6@gmail.com>
 <20260611-asoc-yogabook-v2-v3-1-3128447b67b6@gmail.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20260611-asoc-yogabook-v2-v3-1-3128447b67b6@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1P291CA0016.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::27) To PH7PR11MB6978.namprd11.prod.outlook.com
 (2603:10b6:510:206::12)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6978:EE_|SAWPR11MB9570:EE_
X-MS-Office365-Filtering-Correlation-Id: 2196f89c-96c8-4f0d-6505-08dec7961cf4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|7416014|376014|366016|1800799024|11063799006|4143699003|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: wWgPJi4/5Uqi/G/mUPTW3PGx0uWa3caO5TFawMfrK6Kqy28FIuRPQr2i2mEyk/tJOGsVIykNn2Rgrw90uNPFMtJ9vJ1DsO5IuhTmJkJqQpgiEruhHZ9Ci2ej+jTI/qs0Fg/AIbFG7ji6OOMtLDhyMu6580T98CymmqaFxPuatE1x4bqoL9lzU6NDkA8he4+3dW6psvAKxwiSJcFvfL4LuS2FMYaB5F0HhwY/9y6HfAq8UK+EgjmNDi+gy/19bZLEzrBxk6iJaADpFxhUwoCAlXX8WnqZhh/tYGNRnWz2d+iamrxnic6hyDUVPa55t5yDWkEHtftnW6/hPOXvok1FMrPDpZajjlK3zLDrPfHIzKwOyvDmtGJEyolDMULMHSUSPJhIOV7vGcX587MZVvIldJ9w8JR0MctE2OmEd/ZGBG7T1EixDW5W0xonJL4/pBJEDf2ojEWX8l2FpxX55V+Z+DgFUPRWpksbbAYnLJF7m50o5+D1BFVxuFxA1ZmXTPUeU8sFpo8xR/Q0Rc0LSk7n4WdSL63derszdx88Y0eeXW9O3mNpQM6xGkPgdMmvDtQ7bXuPmDqyWvLPKQs4v7gnFM5MPnDWxQX9HGSH6EqTr9maM1OzSE/Lk2NRJU5riRwIys4r92YxEHjFBpSa4EJCaa7UUTh1JnLmyi8wO3E67i5bnN9H9ghV6lw9lt7R854X
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6978.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(366016)(1800799024)(11063799006)(4143699003)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aXkyeVhNWnNzbStZZjJuWm95UHlXbmZxRGtTYU13em1Camw2cjMzQ01IcEY0?=
 =?utf-8?B?TncrK2pucEhldkRheS9XeUg4Rng5T3V6Y0djTXl0bG5ZZVNSTjB3RThKSU5p?=
 =?utf-8?B?amRQall4aTM0cCtoaWkydnloN0NHMmRwS1pQVUN3UUlmMjd0SkRwOHpseVla?=
 =?utf-8?B?eXQ2NFdBZG1LWE5MNFVyVGdUSFlCNEV2eVR4UkZLdjRDSjJ1L2g4bGZKSFdL?=
 =?utf-8?B?anVRT0NFQ0VoaGFROXlmaW1Tdmc1THZBanZNVFNIZ2t2UVF1UXNPVzRJQ0gx?=
 =?utf-8?B?ZmRvS056QVlMYWxlQjNGTTBuYlVSblJwek1jK05wQy9aQ1hRRXhKbXF0bklB?=
 =?utf-8?B?MC8rVmhQRk1pSXpqclBpSVRrNG5SZXlKb3NrWWkyY0E3OXVqL0I3MmNxLzQz?=
 =?utf-8?B?dlhGRnkrSjFFbWtldnl0MDlkZlFzcXh5WEd4eGMzdHlKbEFvWjBNUUdJZ3hF?=
 =?utf-8?B?YjZ2dlJzcXhsM0s1ZUdnSlJQYjhJSlZobmRxTzRuNm82STdoeW5VZUM3TXox?=
 =?utf-8?B?V3RMMzc4N1ovQ1g5QjJxTTE5ZGgwTWI1UU5CVG1oaGlPMEZJNlFGTnJkZFFC?=
 =?utf-8?B?aTd0WXZYQzM2dnZYZnh3dktGdnY4ME1ScVhVOTByVlZOL1VnNGU4RkJSRE9m?=
 =?utf-8?B?OWNDMXBNNFhibE9JTWU1VGUwVlJUTmcycDYrOW5tVjc5MzlmZHJrL05ubVo1?=
 =?utf-8?B?bG51anY1Q05YSytjOHVHRFU4K1IvWWZkWWxSSWFyYkw1TXdwSTc3ZlBncGNQ?=
 =?utf-8?B?OEpPZTRQVzB5MXZRRVVTT3pCTWNQb054bWJTYUExbUc0WjNkajdaNU9hYTAz?=
 =?utf-8?B?eWhCaGRLdlljaW1iWjB0Q3F3UU5XREQ1aU9NaGVXYU9rTXVZUzU0QkFoMWVP?=
 =?utf-8?B?VnFBeTNEQ3hFNFBxdEhyeEplU2ZrRlNCMnE4bmc2NWIrd0JCd21IZWF5YTg5?=
 =?utf-8?B?Z25vZG5UNWdkV29LSGY1eTI1dmJHcWZOcFpKM3JNc21JWGc3TE85VkNudHVT?=
 =?utf-8?B?MDlhWUpHWlovdVkxN0ZMZ3NXblE3V0ZEQUZsVmdFRmVqSnEvOFZ6ZkNqR3p5?=
 =?utf-8?B?YUFKb0cwVUFwUTNFbEdXVk9lWS9tNTh4UlQ1WVAvd0tHVzl0UCsrakUyNjYy?=
 =?utf-8?B?U2JIQ01FSTNkVzh5ZjVUWVN4TTZ2eXVIbWRMbUxNekh4NHA2dU9aVjR3Sjlo?=
 =?utf-8?B?UDFROVY4UEh1dDFoWFFmSVA0Y3N1QjV3Uml6aWlSaDk3TUViUm1hMUhBS2xV?=
 =?utf-8?B?anJiUU1EZXlrY1NJU3lZNFNnQWJiZ3FMY3Z2eXdsa2VjK0FRZGY0VWRYcC9q?=
 =?utf-8?B?YUlDbERGSUVzNzIyakx4bHR1TS9sZ21EYmVsR0FoMmRUb2hzRFNVM1l5eFkv?=
 =?utf-8?B?ZEd6QWk5bGFNOHVuTmVncndsS1lpWVc5bHYrNk4rRytMN0xMclB4cklkdmw2?=
 =?utf-8?B?bWp1Rnd0MFczSWkreUY0UU93N05jazUwT2hVSWh6ZEZvM2IrYkUybGp1OGk0?=
 =?utf-8?B?UVoya2l4ampFK29neXhzRzNHRlZrU01PR0hOL0c0ZVZHdkpYYWRpZ3RjcUFI?=
 =?utf-8?B?YllyWGhVVGcrOVFmOFJORElYYTdOL1FOaC81RVo5bWpMc1o5QWoxZ1NLN0xN?=
 =?utf-8?B?LzQrQ3VqM1F1b3kvdTNLN1h2MmJ3bEFtdlFleDBzajRjVU5QSlVDOHVadGNm?=
 =?utf-8?B?bzJQRVVhZ2RINVpGT3FIVGxVT09FcFVhZ2ZhQ1c2TVB3VVlyRmx5blBFZ1Qr?=
 =?utf-8?B?aFdjNHI2SEN3R1BQbSt1RjFpbWh0UFZacmZSUWdyNGh2aWtOSEVaTUZXMGlp?=
 =?utf-8?B?bjhLbWZlT2I0enRGZTJoQ0xPQzgvV0F2MURKekNleWZlY1loSzBFTVNXZHVp?=
 =?utf-8?B?V3R4UzFKcG16eFYyQmlBeXdCZ0JIVHI3c21vQjUxK0NVbm5CY3ZZeFdtd2lP?=
 =?utf-8?B?THpkcGJjUWRWc2JQN084R1poNTNoRFZGc3JxUWtLekUwNTU1VFVlOFFPUngr?=
 =?utf-8?B?VkVwTkgrZEUxV0c0U3Z6RDlBcE5oL2d2bmU3QzdYYkZ3MURQcEE3WmM5S3pB?=
 =?utf-8?B?ZHlQNDc3L0ErbFlzMFhjWkR1a3BJcTUvbTdwY2R3WGNmOHJMUUdhLzBRcGpM?=
 =?utf-8?B?aG4xYnplRURzbEx2Y3RlbWtrZ2RZellWSzhJOEtoQy9RWlU2cDhXQTQybmNV?=
 =?utf-8?B?dzFMN2plajZJSUwyZDZON0QyYlR1amJyZkxWa3lNM1FBZHd2eXoyUnRzcERQ?=
 =?utf-8?B?RW9pMGt2Q0xZbVAzVko1bGxnMjhqaGdvMHl3N3Rxc3lMYlNxQlh1SndOZExu?=
 =?utf-8?B?aGM1ZHRmTFVEbFdJTnF2MWZkYm5sUUF5dHJrbXVtK0hZaGFIU1poQ0pWdVMz?=
 =?utf-8?Q?E1n+yLSV1vbroj2Q=3D?=
X-Exchange-RoutingPolicyChecked: NpSy1VjijY241jGdjnfuMiJ0JJiBn7BVk5kGgTLRQgq6S6Szn6DJtwtjyBf8onNY1CWcdnxRz7sf2txTokp2wNgx7fM7gyTSKXeH1lQeY1Bk+qpCBukgEX5gCLa4izNa4y3BA7+hqaYUBO8vpDeDZNlqiMy8eLxXvqsfSwDegVnQaIrGdHCQ+a/TAZe26RJF/OKWs37s425Rrw1ob6ho05BN3Fj6SLbVkztpgK5sVdm+n5OApLg4/QmlUgS8pKFgOF/Dc4Lgj22pQUgatuIXGylREMAb/xfPTPGoaWu/Ad8S6AeapN3dOeBaYZQKqhyWdAV4g+Cx7grnWl77e66p1w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2196f89c-96c8-4f0d-6505-08dec7961cf4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6978.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 08:47:48.0987
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wWrU3vXJi8C42tVYeV3PHgt8cvm248MZ4nfe1oZCSj6MAIY6nNJVreGcCIHTkn1ldBMkIZbZxEr0p8Jw/WkTk/1NQeOb6dQtzhKDqNblEig=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAWPR11MB9570
X-OriginatorOrg: intel.com

On 6/11/2026 1:51 AM, Yauhen Kharuzhy wrote:
> This file contains two types of quirks, both checking DMI for
> machine-specific strings and returning machine data for a matching entry.

(...)

> diff --git a/sound/soc/intel/common/soc-acpi-intel-cht-match.c b/sound/soc/intel/common/soc-acpi-intel-cht-match.c
> index e4c3492a0c28..28f600171f9d 100644
> --- a/sound/soc/intel/common/soc-acpi-intel-cht-match.c
> +++ b/sound/soc/intel/common/soc-acpi-intel-cht-match.c
> @@ -9,47 +9,63 @@
>   #include <sound/soc-acpi.h>
>   #include <sound/soc-acpi-intel-match.h>
>   
> -static unsigned long cht_machine_id;
> -
> -#define CHT_SURFACE_MACH 1
> +static struct snd_soc_acpi_mach cht_surface_mach = {
> +	.id = "10EC5640",
> +	.drv_name = "cht-bsw-rt5645",
> +	.fw_filename = "intel/fw_sst_22a8.bin",
> +	.board = "cht-bsw",
> +	.sof_tplg_filename = "sof-cht-rt5645.tplg",

Given all the relocations found in the patch, it's hard to assess the 
actual impact of it.  Ideally there should be no need for the relocation 
at all.

If you believe this has to be done, please split the change - first have 
a "preparation patch" that relocates stuff/does whatever is necessary 
with the existing tables (rt5645 and wm5102) and then have a follow up 
that carries "the impact".

> +};
>   
> -static int cht_surface_quirk_cb(const struct dmi_system_id *id)
> -{
> -	cht_machine_id = CHT_SURFACE_MACH;
> -	return 1;
> -}
> +static struct snd_soc_acpi_mach cht_lenovo_yoga_tab3_x90_mach = {
> +	.id = "10WM5102",
> +	.drv_name = "bytcr_wm5102",
> +	.fw_filename = "intel/fw_sst_22a8.bin",
> +	.board = "bytcr_wm5102",
> +	.sof_tplg_filename = "sof-cht-wm5102.tplg",
> +};

(...)

> -static struct snd_soc_acpi_mach cht_surface_mach = {
> -	.id = "10EC5640",
> -	.drv_name = "cht-bsw-rt5645",
> -	.fw_filename = "intel/fw_sst_22a8.bin",
> -	.board = "cht-bsw",
> -	.sof_tplg_filename = "sof-cht-rt5645.tplg",
> -};
(...)

> -static struct snd_soc_acpi_mach cht_lenovo_yoga_tab3_x90_mach = {
> -	.id = "10WM5102",
> -	.drv_name = "bytcr_wm5102",
> -	.fw_filename = "intel/fw_sst_22a8.bin",
> -	.board = "bytcr_wm5102",
> -	.sof_tplg_filename = "sof-cht-wm5102.tplg",
> -};
