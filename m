Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5555B23BD01
	for <linux-sound@vger.kernel.org>; Fri, 28 Nov 2025 13:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764337849; cv=fail; b=vA8Onos/RabU5kWljuqp7WtpBg7+jRNFzg46AJyzDWBWYpz2C37QmlRcrbpRukZIxMSe21jO8RU14r/QcBZwC3spkt2mowi9ngU1QSqgOTNpGLVvv1aJVCNDDS4MExwl77UgaauZ0GCTrQlzYDkWDXpGWkQGiQJqNPQ0zuddDTQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764337849; c=relaxed/simple;
	bh=hi8RQNa/Z/hterQqyHiM7o96aQX9ePoQRQT1KZqMLNI=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=CaR2PfnDI0LS4arZpgFsGoLPHxkcGldryoeFEf9rzmXdPOuKtCGINZoLkgmUgd4UA7nm/BXXgNpysfzmrp2DuCvxJrSbuHzGQdfBmxf0DcUkAkxDdqy6K051K+aSZlTJvGtjM0mtEfYn6T6spl0XMHRBTgnT2ONHkApTnGKCJDc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A6VY+45H; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A6VY+45H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764337847; x=1795873847;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=hi8RQNa/Z/hterQqyHiM7o96aQX9ePoQRQT1KZqMLNI=;
  b=A6VY+45H1mCgosxFuKcfXq3ECVzQtGgj7qNm50e1kkE0LyHRiBX+INbS
   2tlCA5U0Ryr3rlUJ+VfaegH9mkkUkvw36pTo86vHB8l1F1g4pg+ZamotC
   R76HQDvY4drJrj6Zlh0nZhkOyPkoG6uvb0PjYNAsk0bEAHTooxbqtJQyA
   ZTWunxgAV/r4wFlzY0wq9ekUm5HaAaUxEjXNv5vmfhlfsgIeCzNlPUEO8
   8bXL6CFZAOwFExgGBA05Ul1OFHOspkhKw/aRCD3+rsNQ46gMqcXcDXn9Z
   P6pD9eg+mlRTa4G4R3Y16geM33Y8+UvNuFsbbPhfAWiincqLdMnplC0aF
   w==;
X-CSE-ConnectionGUID: 3u1EyUjWStSbmUNZwj19IA==
X-CSE-MsgGUID: JZUAIO7ITJmyHURoVOcyGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="77058156"
X-IronPort-AV: E=Sophos;i="6.20,234,1758610800"; 
   d="scan'208";a="77058156"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2025 05:50:46 -0800
X-CSE-ConnectionGUID: AVGt/tKjQR2B6R+ki8nOKA==
X-CSE-MsgGUID: aoaay+8QR6mRtTW1MiLO/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,234,1758610800"; 
   d="scan'208";a="193673740"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2025 05:50:46 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 28 Nov 2025 05:50:45 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 28 Nov 2025 05:50:45 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.15) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 28 Nov 2025 05:50:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J3xGMTxe3xAwhEyTg14J8oS97sKsoX6brFJ0cV3oS63JiiccKFD9e76VA6OR+HnkVEJT6lfhVoAovdjNHyh9ikFIGCVuWZ+p5D79NfPwpjpaUyVlRwM/QAkZkweK1jtUICfQ5FA9VFSvYqOUgaUckWGFj63Jmyik+W6McaRq6e4hSxzfksttcBo5aw0x2go2rWCHpfSD4yYJ5OKv0FXwc2xbJvJmYYidRWb8q4/Nky2TFQnYefF746RHhDX1clXiUhBpqkncBP8VLKsBaNlRai2hxt97FlHH4rd8e4linjEq6L0C4GorJ53x82oxNKMcxCGBcdUXigwavpF/fDJUuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Pzy96zf7G8J8BfQWxziC2u4xB1/98B3PVysapAsgls=;
 b=vP2TdvzPvnHTAsIS2o4ruEFron1bGDM6eEge60UkKxvMsD8yEXoe+BRNVAf7K5+RsvxR3nhI/W9EFZzuQne68vzergp/puWGJ3XU4dDYH4iD0O3tR/ugRgFFhA2MESr2Hmp67fsKyTBvnjJ5RFBZ0Qh/w4zCE4M+NRJys+8kKDoBu1e0vIxLMqPZ2CzZHXCb3NBM95XW+eQp7liQZLALELQjffn9EG3/kwI4Ww2TDjpKO+FLzEWgbKQKUfsR0L24W+SEn7NVfK5HXLDLEj/us+01LYaiEt04NZVP9PgriQEluZGmyiSNzWqQ0oZ5NxifFvKS/DIZ5ZT4LFzjlv3UHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8283.namprd11.prod.outlook.com (2603:10b6:806:26c::16)
 by IA1PR11MB6346.namprd11.prod.outlook.com (2603:10b6:208:38a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.14; Fri, 28 Nov
 2025 13:50:44 +0000
Received: from SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::3:e0a:87af:d4b6]) by SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::3:e0a:87af:d4b6%5]) with mapi id 15.20.9366.012; Fri, 28 Nov 2025
 13:50:43 +0000
Message-ID: <0f463c54-f57e-4274-8846-1e14d7ad1a0d@intel.com>
Date: Fri, 28 Nov 2025 14:50:37 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/6] ASoC: Intel: catpt: Round of fixes and PM changes
To: Mark Brown <broonie@kernel.org>, Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>
CC: <tiwai@suse.com>, <perex@perex.cz>, <amade@asmblr.net>,
	<linux-sound@vger.kernel.org>
References: <20251128093412.3949374-1-cezary.rojewski@intel.com>
 <aSl9NZ7YUao1NGNQ@smile.fi.intel.com>
 <879cbe3d-d93b-435a-a99c-5de54c053836@sirena.org.uk>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <879cbe3d-d93b-435a-a99c-5de54c053836@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA0P291CA0010.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::12) To SN7PR11MB8283.namprd11.prod.outlook.com
 (2603:10b6:806:26c::16)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8283:EE_|IA1PR11MB6346:EE_
X-MS-Office365-Filtering-Correlation-Id: d42e1692-dca7-4ddc-1a30-08de2e852006
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UHA1UldFdmpPU2lFNmsxMlRMUVhabzlqQk5IdGtRUWduVElNVHpvc3Z1VC9j?=
 =?utf-8?B?MzNzNDlSd21FN0xqby9DSUZ6V3dNNGpMQUpZYXVIK1lLVUlaVWwrYkgwbVFm?=
 =?utf-8?B?TndjbFBheDI0Vmo3V1Ridk5wN0lrNGdKNkh6bE5vc3FWdlliRUx4bDZMSllM?=
 =?utf-8?B?TW5USUNTQXhKamhiUDZoZWFRVnh0TGVkNWNqTWpVLzBoWEhnM3JjK3RtN3JK?=
 =?utf-8?B?MVY3eXRRc29HQWpNSDRiSFh5VWd3WWNrZ0tIbXNodEdiMFN1MmpDNlNnSDZP?=
 =?utf-8?B?VEprM25QQ0ZMc09iaU8zUGR3MUU4ZDVEVS9NNk9DL2o5dncxMWJ4Y3dDV3Zp?=
 =?utf-8?B?VWVocmpndmFOb2JWb3dhQWYvZ0tNeXIxVms4Z0N4cUxXMGJacE9Cbk1INXp5?=
 =?utf-8?B?d29SQkJsaklKU0Q3MzNIblBjRURtWjZ3amtiOEo5YnowSDNqemg0OEcwNHVJ?=
 =?utf-8?B?UzE5UlhTU1hTTUU5bDhVTzBCMWlqTHRwNEFZOEtSV0djRFNmNzM3SjVYcVln?=
 =?utf-8?B?VFFGbm1Ubm1NYUI4QjQxZmFzUWpFWnlITjZjamlCN3NOVWh6d2RTd0pKazc1?=
 =?utf-8?B?bTlLWU1UWUZKOGlOVUhIS3h0NW9DZmxoTW01M2ZOLy9vZHByOG1odDFMbXFl?=
 =?utf-8?B?Z1RVVy8wRVoxMEFuMW93dUtVSDlrMVhmK1BpYlpnSnFqaGdSY3E0aW9aU2tz?=
 =?utf-8?B?SDJNM3luWW5LbmxlbURVVDlwQnltWThWa3JuQThqQ0E1dDgySTF6WHdZMmNp?=
 =?utf-8?B?enVrTDVheDJha0MrV3Z2MWR1VFJTTDVubnpndkIva3gxZVpyaHFQTDZkaEhW?=
 =?utf-8?B?bThoSC9yOHM1MG9ZZ0tHNWJKNjZzQ0RYRUs1NnpReWNoV0RuSmpqbnhoQ2lq?=
 =?utf-8?B?WEdKdjRjUnkvM3dNQUhUWGFyYkR4bmYyK3ZRR3JGR3Rhd0VVZGhvL1h2dDhE?=
 =?utf-8?B?OXdFUHdicmJ5ZWpoa0lZRGRFRGRzNWtyZVVOZENJODNFMEVGaVpIcGh4UHFv?=
 =?utf-8?B?cUgzb01qd1FJZ2o0QjFzazBiVUxYWnZYNUF6NENlcmhOV2I5OWNVK3pjRE5j?=
 =?utf-8?B?Qzhxa0VLc3dVRjdjcDJQdDZ5bWRiOHJTR2s5aHdvbHNsUmdTWDI2NWJYQSt1?=
 =?utf-8?B?OEZKNW5DVXFmd0thMWNxdU9kRDJ5MFh5TGo2VWhnWkRhZHFtZ1B6cUNmUHhP?=
 =?utf-8?B?UWo5YnNFS01jOXRtVzBiUEgxZm5sanFyVStrY01zK0p1dXBNUm9BN2pqRHJp?=
 =?utf-8?B?RjQxL1kyaW16U2NycmdCUVhRaWs0d25zNDhBNEVtc1dSRW10K3cxSU5Lc21N?=
 =?utf-8?B?WTdVc0RIZ09sdm9pRTJwYWZqMUtKcVZ6U240TGZlMXExb3BrYmw3TG12Tjl6?=
 =?utf-8?B?Q1VNZ2JRSUxFVE5GakFPOFBzT1NJMW1RZ2FYU09MeDRhNmNmKzEyclJkSW5S?=
 =?utf-8?B?VkdBak81c2M2MXZDQklIeGpPT3IvdFNnU2kyNFoyNlN4cE1aYVBISGcyUDVh?=
 =?utf-8?B?a05GWHl1dVVKbHI0VE5OYk5nUnRCZFhQcFUwVGNtSG5jMi95cnJQeG92VFVt?=
 =?utf-8?B?QzlKNXlseHNVdi9BaCtyejNGdDV4TmV0MUh3L3ZBT3lycDFuNW9MT2NzbUpX?=
 =?utf-8?B?TitHN0l1OUR1LzdVa1hqemtPaWFDUHlWR3lnbVNNNk1Ka3pZcmdPTHFPZDVu?=
 =?utf-8?B?SVdzUXdOVks2bEFGbFdYV0hSakJNZ2h2c0ZDeDZFMVIwdXZ3TXlNZXNHdXpQ?=
 =?utf-8?B?OHFSOGtScVBJWmlHNHo4TEljUGFZLy9YRDRhMUk0V3JySUJSN24xaWVJaitT?=
 =?utf-8?B?YXNCdTdoRWhpQUVhaFgrLzhpM3RjWHBFczJNYmc5NTRzLzU2cytJbVJUY21K?=
 =?utf-8?B?WHh5TFlMMDQzdFZ6a2VaK2xhM0RJcUNJR0xpQmk3Nm15UnJMSHlNSVBpMERi?=
 =?utf-8?Q?SLcnc3+Mn3e1oNLbMV7CfoSxz10u8pen?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB8283.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L2hPUEk5d0FRb1lVckw2OGd5QjdTcEsrVmdFNG5zOEp1SkxBdFFDVVNqa1VP?=
 =?utf-8?B?QTdGa0Q4M0hlOHlWS0JTMElRbE5kRXZ6TGZzd1lsUTBtRHh4bWMyQkFIeWQ3?=
 =?utf-8?B?bHI1bVVBbkRTR0NEUkZiYmI2YVNzQy9xS1NWb1hidUlpdWl0MFJ6RTVNVzlm?=
 =?utf-8?B?V2lGMm0wT1VETGZYb0l4L0MrQ3cycUZSSWVNY0FkRXhCOHVCL0Z6OEk3dXFB?=
 =?utf-8?B?VEJuZTI3Y25ydHk4dXhINjg1QTFaRnRTb01zWjUvVW1TaktPRU1CVC9sbE0v?=
 =?utf-8?B?aGVIckIrblpMYWRwQm82a0RrcWsvd2I1ZFNURVRNandaY3VFMFdBUTNxMDhJ?=
 =?utf-8?B?MU4zaUZFUzA5OU8ybTM5WFpDdTJqdm93UFJ6RmpYNWY2RDNWS0dDVE9ONGJq?=
 =?utf-8?B?MlI1TGJveU1SSGlFeVIrSjFHbEMzQVZrV0RxSnlYeXJTWUZBM1Rpa3g4bWxa?=
 =?utf-8?B?UnhKd2N2MGdvNmZqaXpFR2h0cklnQ3U0Q0dyd3gvMit3ME5qWkp1MWF5TjFu?=
 =?utf-8?B?SE94N25DUVVxa0tHNmUrM1M1bWsyY2FRU1JrQVFqeXZkc2RUMkMrTDNEZXdq?=
 =?utf-8?B?eVVqYlBjMFZoSlNFTm5MQjU1WnlFNlp3cy9ud2psL0dVK0FHemt6TWY2ZC9R?=
 =?utf-8?B?eGxlcWdTMHFSZ2NOa1RPNk5BQ1Zla2xlZkhDa0NjN0RpRWJ5YmNMWFhycUIr?=
 =?utf-8?B?UDVVNjRjbEY3THdHQUNvUEtjM1p1Rk95NXNZNmtnNThwNFNTSG55Z1lWT1Vk?=
 =?utf-8?B?MEVSNklxSnc1MGY1ZmhlbFduRi9JM3pNcXdnc09IdVpTK016QzBRV2xEZzBR?=
 =?utf-8?B?UWxNcTgyUUE2cFFZVURHdnV5SEJmZmt4ZldUOUtJZ0wvOVY4UnJjZ0ZzNlls?=
 =?utf-8?B?cXVuYjRyZGxFUXpXYWlqRSs5OHJhcEYwbFp3Q1JMV2hxb3NiT1BkOWMzODBi?=
 =?utf-8?B?SWlKcTlMNjUwWERuNy96czJSYzRid1RrbEZkN3MxSlZoOSt6M0RXWDl4YTdG?=
 =?utf-8?B?K3JEKzZMQ1VmK3dqUHA4TWVNUEV1ckJEcmRUbmhycmlkNGFoRVpCdnZBbHRJ?=
 =?utf-8?B?RzdPY2x6NUZ6VHlDNnJKQWtOTWUraWU3TlBGYUpGZ2lRN3ZVSjZZSVlCa0FS?=
 =?utf-8?B?Q25xMFJyOVdyREZ5ZkZhSUtNMVMzMGx5TG1HQkkwRnpzL1FvV1NZYWw3clBO?=
 =?utf-8?B?NmQyWVBQQ3V5bFNIY0NESnVNdTI1T2hJTktHU1p4aW9YazZGZXg3OHF3dkpu?=
 =?utf-8?B?S3lCVFYyazJoOXM1NU9wc28wOG9yalZia1pCZVBROCtiNGF4S00rNHMvV0dZ?=
 =?utf-8?B?blhkditJc3NUNnVsMU1QQUhabmNvczd2WmVQYlAxdEpXQ0ZVNW9JZnYzTXVB?=
 =?utf-8?B?cWlPLzU0UEdzWXpOekQwV2FKb0RSa25QRDFyRVZVY29vSmZLdFJBNStJTjg4?=
 =?utf-8?B?KzRERG10dlJEeW9EZ1ZiV04vL3l6RncxdU9mOW5SUW84ZjhibnA3N3M2ZFdE?=
 =?utf-8?B?V0F3cjRvWVVSSjJDT2NKYVRUbXlNTklaMWsrSXJyL0ZoOUhTL00ydWZZQW9V?=
 =?utf-8?B?bzgrUERxRDJ3VVVpdHpRK21RVUJOMzE0R21yZ1RTR1FYYTFEWjVmMkpIcVJH?=
 =?utf-8?B?TW80MnJwOHl2TElvRWRxeVRXTVFxYUhKOGJwb3pLSU5JZ0VQOEVnMU1PYW50?=
 =?utf-8?B?T0JzeUs4N09vUzdCSGNhN1F6b0gyYXlNNFU1b3ZZcTV1YnJMWWZuV1FJZitq?=
 =?utf-8?B?a3J2ZUcwMi8ySE5ZeDc1WDZjWkhYbXJySDRYd0htWWZ1YzRhZUlqdFoxVDBP?=
 =?utf-8?B?aWEyTml1MThlRFRONHhzdlZFV3ViVTNrZVRWN0NkS3hIV2JybFMyV3BSZlpQ?=
 =?utf-8?B?WjdVVXJWd0hQL2VZT3FSQlJXNnY3NkVOYWlETzdjRExhYWhsM2tOSWNGV1VI?=
 =?utf-8?B?K3YySDlwUmVGb01GMnFKM2FyZkpGU25nbFRuS2VWa0h5S1BycHpjbC9wb2tQ?=
 =?utf-8?B?cmhHK1g5SGd0UUQ2bjBXUG56NFIwdHd4Z3dNME1yZzRPVnlSTzQyUnNRTVdi?=
 =?utf-8?B?NklpcHNaQUhvdDN2K2hERlpsSmt3U0tZYUxBVzhpYmtpOUVGdXRnSVlGSVc3?=
 =?utf-8?B?Q0ozbXhWK2dJbzNwalBCVVNIVFU1NkpzbXAwbEFyVzZzNFFoTGU2RWxFNUdT?=
 =?utf-8?B?cXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d42e1692-dca7-4ddc-1a30-08de2e852006
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8283.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2025 13:50:43.8379
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /hGNDR3i9foAazv/VDjSd7WdfVN4KEEbYpxXsplm0m+cdz4wx7QORSxxSPS1gFUtcWrB7Qrfu12bFRdQvMef3OLwJg+kPE3iyQIZKMuFxkU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6346
X-OriginatorOrg: intel.com

On 2025-11-28 12:47 PM, Mark Brown wrote:
> On Fri, Nov 28, 2025 at 12:45:09PM +0200, Andy Shevchenko wrote:
>> On Fri, Nov 28, 2025 at 10:34:06AM +0100, Cezary Rojewski wrote:
> 
>>> The standing out PM change is removal of the catpt-driver as a
>>> system-suspend (S3) blocker. This is a suggestion from Andy as indeed,
>>> audio is not a critical component that should prevent the system from
>>> going into S3. Whatever happens, the driver can recover on a follow up
>>> resume (S3 -> S0).
> 
>> v2 had been applied AFAICS.
> 
> Yes, it was.

Sorry for the spam then, didn't notice. Nothing major has been changed 
in v3 so it can be ignored.
