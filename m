Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED6931E9B3A
	for <linux-sound@vger.kernel.org>; Fri, 11 Apr 2025 09:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744364404; cv=fail; b=aqytN0zKI15saCjcyXtmMFxomwUVlz2cvv4OCT8583FKhVmlT0vUlj8XZww4QeLFjBDLLWiWebGzSHUEOKUxdrQVTn2y+R1uwqioDjLiLVsQwX38ZK4Y1d2KhkkUgFXlpwwRNTBdyeZ8UPTbCJOI8zZ/WvupRX+3EjapGnid8Sg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744364404; c=relaxed/simple;
	bh=J1HLs2GseDqmB5OHLsLoefjXD9byA/dt+MQucYBX3S8=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=XvxJDwbT33PO0OZPxXjb4PtA7KFhNK4088UwswQLxBpP8xtklKiRsW1ywlFo5mCy4W3HYkXm7xVPE5PtcoKDVRoexgZEpOGpj5vvYGW03HccEtm5PLd+Mmbf9bHlg5y8XfCVMhUulvqS6FqkI5AUrrVvFlF6E2RcfIb2Q/nBGZE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R2LEBwaE; arc=fail smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R2LEBwaE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744364403; x=1775900403;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=J1HLs2GseDqmB5OHLsLoefjXD9byA/dt+MQucYBX3S8=;
  b=R2LEBwaEYmps+lCBDNM9HIz5kxboVxpC6d9Kdx9eWAL5+a6fkIEZL7t7
   H2zcx2kaQ/Fvz1tqpRbnZLC0MXoo82nvEHdY5/ZzeEUTeXyU8pX+OZhUC
   YZ1lD+BpP+EjUZjMYMX9x20Q5sm1ZH04MeN65WpDW56yxU7y1forq25Vk
   wjbm0lHFI9v+92VWEflWPoUZUfWSjDvuf2AjEj50XXT0LpHYAEvFeufhK
   7WzKt+yC9LCP8eV1gNGxM5tgbf/jajhIrrj8mXUO0+lD6KtVFn2sQsHTZ
   S24FSQKL3b27qErVOIPoAhcWAfP+EfUaVRIbZZfPxxTEzLwkbujL+AXRV
   g==;
X-CSE-ConnectionGUID: 6bSmpT0SRau5CF8IPH7h/g==
X-CSE-MsgGUID: 6VLRn9wHSGSykh7u23mtrw==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="45815416"
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; 
   d="scan'208";a="45815416"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 02:40:02 -0700
X-CSE-ConnectionGUID: NU4hOL26Tfanh5G+raaXzg==
X-CSE-MsgGUID: 8S1t1/u+Qx2J0hgCnuV1dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; 
   d="scan'208";a="134312274"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 02:40:03 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 11 Apr 2025 02:40:01 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 11 Apr 2025 02:40:01 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.177)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 11 Apr 2025 02:40:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jX8TAXKWCbOkakczTglYcb+gAQHWneXZeNEDS9ck/Jjrd7eEMYhYYsqouysW7BIutGmgDUs6/GN5mHhi740NylBj1gKE4h1B+odJirOejACVhZp/pYGZmJUWWr1nrOVEn+Xz9c1haZXbDpas1yQnBuWO5qkm0S0OS6/a9Pb6MaINEuFz2yaMTsGVvQQpxN3Gb35ZWrKn5RStRuSTZoJuwNSU4z7yi2S/GIrLBmWTdOKqAQcUygkqA8qdR4iH5bR8t7cS5KofCLOXZ++nhtZARp6kzx6wkVNiIKB3nf/SasFSaeJaXFKLhJnwRKtxeRl2YJWegLb9Gb7R/T6km/JW8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1cyQg49QjTgL6xxRVhPLqgz+ktA+IJKAdii55hRIFAE=;
 b=AC1nqs38VOVUnMWUjgCbZeVS0T9UVRFP4IfJIBNx3+IDMzREkM1FC5GgR4eM964VC4P8IXigkWa8otO5qwguwFzdyoeQ9UXlsPnHto7DC5sJWPg0AZPIeMNYsoqedT/kL+B/tFrj1i87Obd5i4lMsJnM4TijFvjM356oIjkaMaVwSI7UgfZETL05uxe+zSj1MC8RlKVeqE/W4YtliacRaGL+lSr+qEGyMrwiPAnX43gCxIzk7Gy7Egv//GtPck/c0EjTnnk7G5lV40ULJdFL4HjmV4VEVFAsNad53OTDbZnuNj06gNqgWtnDLg2topaKoQap7GIBjOUB6Wh99Fm1Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 DS0PR11MB6400.namprd11.prod.outlook.com (2603:10b6:8:c7::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8606.34; Fri, 11 Apr 2025 09:39:59 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cd01:59f6:b0f8:c832]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cd01:59f6:b0f8:c832%6]) with mapi id 15.20.8606.035; Fri, 11 Apr 2025
 09:39:59 +0000
Message-ID: <8e3fd738-c2c3-4ea0-963e-477c2fb253b6@intel.com>
Date: Fri, 11 Apr 2025 11:39:55 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 00/15] ALSA/ASoC: USB Audio Offload
To: Takashi Iwai <tiwai@suse.de>
CC: <broonie@kernel.org>, <tiwai@suse.com>, <perex@perex.cz>,
	<amadeuszx.slawinski@linux.intel.com>, <linux-sound@vger.kernel.org>,
	<gregkh@linuxfoundation.org>, <quic_wcheng@quicinc.com>,
	<mathias.nyman@linux.intel.com>
References: <20250409110731.3752332-1-cezary.rojewski@intel.com>
 <87v7rcwbyn.wl-tiwai@suse.de>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <87v7rcwbyn.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0019.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::26) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|DS0PR11MB6400:EE_
X-MS-Office365-Filtering-Correlation-Id: b56de013-dfe3-49b8-d0f8-08dd78dcd345
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZUVFTkM4eHBqUTViL281NTB2R2R4Y1ZoSisrME5USVFZdUEyUDlIN0dtRXUx?=
 =?utf-8?B?b21NRHJMRmlPN1FFSDJ4c0VZUnlzMlg0M01mczNOSWxSd0NmUlV0VHNJSUhM?=
 =?utf-8?B?N2VacEU2eGN3S1hhdW0xRlo0QTNIK1N6WWc1eVRDTlVQVDdld3RDK3ZnU3N3?=
 =?utf-8?B?eWg3aDVuaExLeU1PbW00cnZURTk2YjF5bFplRmFZUjJsMWVEN28xRkpBWjRO?=
 =?utf-8?B?QUVTY0p1bHhmazRsUWVKWmZoRnhaTUFBZUJKUjM2MnN6aXVITzJxWWVIZVI1?=
 =?utf-8?B?UmpKZDdFOVNqYWl2Yk1jSVA4a2RUTlN0VmtoTnVnS3hYMkdjZG9lR2EvdEZN?=
 =?utf-8?B?WEFjS3IxenRYRlRDWEJINTZIM0ZCMWxRNTcwd1JZczR5aml6aVl3Z1M3MG9R?=
 =?utf-8?B?dzc1WFVFRlIxMUNBdjkxRG0vNWV4QTJPUXdjS1dXTG85RkRZOVc3S3g5NFhH?=
 =?utf-8?B?cTFXdkFHN2k5QTZBNTJqcXVlVzcyRUNBaUp5bWpoTUNKeWtRbGlzM2l4R21C?=
 =?utf-8?B?WGFWdzVpY1o2T2xKRGJ4dk1UNnlyaWIxS1p4cjdQVFVYcEh2WHk4TkMxUzQy?=
 =?utf-8?B?bGRuNVdzMGFyVnBPd1Bma1VjRGRJUUZCY2Z3UEhUcS9Cd3J2SFV6SmpuRVk4?=
 =?utf-8?B?VFlwTXF1YmJLaVFZQ2xraFVuNVBGYlVhK2xLQkhidlp1TXJIazNZZnkyRFEv?=
 =?utf-8?B?N3daSUh2TUZJUkZqYUEwTnNIbHdvMHAzUkNuSnM1UmVPTkxiRWhkbE96SjBI?=
 =?utf-8?B?Z0hVZ09QeHNuWkdRV2hvUm1URTIxcTZHbXk5ZDVRNE83TlV4VDZ0eVBMVEU2?=
 =?utf-8?B?b0h2anQyNWlwalJVMElvbCtXL2JmcHRvbi9uL1N1OWZPY0tuZ2lzTWI0WEw0?=
 =?utf-8?B?eDJjb1BVbWV6Z0J5WXp3YW5UTUJySXQrM0RpekQvMnQxZFdqNlhiWTNYYUJR?=
 =?utf-8?B?bUpEaDVPSE1WSGhTS2ppeU8ySGN4Z2NJZ21FcmpZb3RFV0VLWVNiNWwxTXBy?=
 =?utf-8?B?UFBFZ1Z5bW0yN3EwZWFSaDB1aEdLd1pFUWtaUEFHa2JBT1VkbFpyWk5nbkxT?=
 =?utf-8?B?aEpjR3V4bklRaXVKdFFUejZQeUZwYkxPaHNyQnE0OVNoVDNnQzIxbUd5YS9C?=
 =?utf-8?B?eHRId3JtQndzQmZiSXY2TEtrRmZJTSsxS0sxZjg5aVlSVGlhckdsVjFEd0Ew?=
 =?utf-8?B?YXJEME4vbUk1d255czVITkJPdlJOb21DeHM0SHVUb2lGY1RNWE15d2w0Y3Ro?=
 =?utf-8?B?dmx6U005b25ZcnZWZ2FyVGNCRXRNREllbjB5dWpRaHVYOFUybGhOdDlJekFB?=
 =?utf-8?B?NS9aRkVXMlA5WnhSMWpjcElEbWdZMzlFM0VHdzVMOXk1SHB5eDhweFlybmo3?=
 =?utf-8?B?SjdES1B4dzNVcjlJZGVvSTJka1dnREtoM0daUGtUbFJqWHp5T2VlVGFaOHhB?=
 =?utf-8?B?OUxCWXFwWERMQU5tZzZUWklwQ09oMEVmbC9uc1gzZmQxMzlNSHJmblNHdzJB?=
 =?utf-8?B?czIxWnZwdHFucENDazlVMnJtc3BhcTZKdndrWXQvZDdXbmpBa29CcEVncmVL?=
 =?utf-8?B?NjRkTGRSK1Q0ZGg2dG1RRmVpM0NJMEFhOURHcmtmRllWbnlsS3liRVpxM3Zh?=
 =?utf-8?B?UzF5ODRhdFViWEtNVUtJM210dkxhNVlYcXVJRjZiNVBrMWE1OEpCZDR5VkEr?=
 =?utf-8?B?SDM1eVdrakZzMjlMb2Rkb1dlaGk4K2pzcXlSaWlLT0dZNDE0d3AwY2FFcHFT?=
 =?utf-8?B?K2VYSlQ4VzVxdnFxcnhlc0NWdG9DeXlERDFSY2lBNW1uV1NlWmlBbzhrV0NI?=
 =?utf-8?B?KzJQUGJCSS83VmRLOWxwbXlzT2ZWcUxzR1lnSDlqVmhyYlRmV0RSc21xR0JY?=
 =?utf-8?B?ZERiTmZQeDZiNHdDN1d5ZmxmNTF0di9rYUVuRC8yMGhZS042RWs2UDlFc2Nw?=
 =?utf-8?Q?uCK3QBwcKc4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6375.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NGtqNyt3MjNhVW1ab1lCZis2aUExdXRnWm9ZSDdJcktjQnZCZjA1VlIyWUhq?=
 =?utf-8?B?VGJoZVBLU0h4YUw1NFpocGFsd1hKTEZ4VGRJS1J1YmNXUzEraWFtK3JnZUov?=
 =?utf-8?B?MHJPTjB1VDFSSjlNckczME9wQWNvejRFbVA5R3Z6QlcrTXMvTm9FZmdEdWVh?=
 =?utf-8?B?dTVMMEt3KzVucEhLbnZUV29KT3gyZVZXaFFMdUxYTUxDRzRaYVRBR1lVT0tn?=
 =?utf-8?B?elhLY1lIcDUxemk2YWN2OU8xOHVFeWE3Y2MyWGw1Mkw4d1Rxb1VOWUg4NFNl?=
 =?utf-8?B?YnFNRmhqRFRYYzdmeU11cVB6ZmYxb05VdFFWcEtSUHhnL3RWVTZDcDNVWEFG?=
 =?utf-8?B?VDNpbnRCbE8yd0xZUmZpMFd3MjYrai84SFhQN29KVW1ZTkVnOE1PSHM3V00y?=
 =?utf-8?B?eDZ1dFVxUFJXSW5uR1F6SlpHRCtVQkg4ZjFhKzVPWmdINkoxK0VoeGVkZURw?=
 =?utf-8?B?dlpVVjJuUGFTaGQzUk9zOW8xd2hLWFc0cGUwVHFoc0d5YmwwdDg5L1lGR2ZO?=
 =?utf-8?B?SE45dFYvYTAxa1RsajBMSTk5cjl6L0VxbXBvYWtiR0lUZXZwWkdocHJldXhR?=
 =?utf-8?B?RisrNW5GSVplTkFlUVRtbjJldnBEOWxFdzdmVXcvRDQ0cEtoTGZRUk5DSmdS?=
 =?utf-8?B?VThuQzBvOE5NVHJsb3IybzBQS0FiZFNLRkU0cTYzU3E3S1JOQ3ZBa1VqS3Zn?=
 =?utf-8?B?czd5M3c2YjB5UWpGWVZqN3hncEtpQlcwam1taE5IaFRYNzM1TmlFZEJ5MHN1?=
 =?utf-8?B?bjZoNEcyTDBtZ29SUUZKb05YZStPcUVIMFdJQ3FwNEdtektiZUx1TXJBWThx?=
 =?utf-8?B?RXpKWkhaSk5qQzdJTk1HMWFvdFNDaUpycHNFOElxampWWFNlZzMrbXZ2NXFl?=
 =?utf-8?B?ZlhSaWxEKzh4Ymd4VXN6QnFGQjhxZWZ3eGtNTXBBbnpLTW1BdzZTMUJjby9W?=
 =?utf-8?B?WnU1NERUV3RsS1NxNEJZS3U4bTVOVmpiNkNUd25JTG5UV1hFWnRnNHV2QUFT?=
 =?utf-8?B?T3Zwb2tKRHY1S3ZHWnVqY2E1dVVUSzN1Vnl4ZFVuU1EyYndkL2U0aHpEQlI5?=
 =?utf-8?B?bnJiUWVtRFR5NWhCYTZJdzJEWTBLczk2NURzK0p2VDljSUJxQnJveXJhUUQ1?=
 =?utf-8?B?dHVQMW1JelBacFlmRWFWbFlVTzFlckFudkdXdlg1V0U2RWQ0amdRQkJwTm40?=
 =?utf-8?B?SlYrMlFTQXNCTFRUWmhud3NxblFHOUo1WnZOM1NhaGxBMWlSY0g1VEVvL2tG?=
 =?utf-8?B?cmRIY2VUN0xVL3ZOVHZyNW1BTk9CUkZJRWU2NHh5TXNERDJLNm9EUGxUR3FR?=
 =?utf-8?B?OWVCTURNdjFvaHA1eVBVQkMxVnpoZEFadDdOVklCODltSzB6bzhmdVdqa1Rx?=
 =?utf-8?B?M1E4T25SSC9OWFVkY1BzNTNjVjV6eXEvNjFNanBzbkc0MnJyZ2tuWGgxMDUy?=
 =?utf-8?B?Vk45NitVUUt1dkJudlVSOGVuN0d6eFlnWkJMU3hZdWJoK0x0ekl2dHlRdHpE?=
 =?utf-8?B?dXM2cC9LTUNCYm13ZWwrWG5jb1JxM2tJbDBCVUl0dTVjTFFNMmh0UlVEVGd5?=
 =?utf-8?B?bkMrMnhzQmJ1Uml4S0h1eVNaUVJwSm9MRXhpT1E0V2VuVlVWNlpaSm5JOEZw?=
 =?utf-8?B?bGMvK3dyclVVMTJHWEFMcENmNWErNEczazVGSzQ5NUthY1hCSFM0WnZkalNs?=
 =?utf-8?B?RWdkT2owVk4xSUdwZ0NLb0VBdXdDakM0cFhDanc0a0NJOWh2Z3JNenFDUHNx?=
 =?utf-8?B?Y3RpZXQ3Um9XYzhGeS9aQlBsbkZMMm92UFRCUUs5dWRVUmM2OXBucjc3dmhI?=
 =?utf-8?B?NG8zQ1RFTU5UUGt6Tmt3dk1Oc01EcHpGbmcxUzNleG0zSFhaSHNyUENyRlJ1?=
 =?utf-8?B?Wmt5MWp4Mklmb1BGeXJZR0F3eTFERFBDYnJVMFI1bVFUMjlYa3VMTlZkTWRC?=
 =?utf-8?B?eWVoQWhDU0s5K2FRd3RIN2kvNGIwbkR4V0RsMnF5dHB4OFI3RnNMbm5tM2RM?=
 =?utf-8?B?a0lraW1hdFYzdkxJMGdGYWJXTTgwWHZBVzFpei9zdThuejJTTVAra2xOUUlG?=
 =?utf-8?B?TWFUanFSYkFSL3hwaHpHamRWWFlQNGJGSG1GRE5WaUVMTU9SdFMrUWhka05u?=
 =?utf-8?B?VGtJUEltam5mandGUUJ2ZTFjek0vMTlFdEhOSWFkQmVmb3N6ZEdDeHdYVzI1?=
 =?utf-8?B?Snc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b56de013-dfe3-49b8-d0f8-08dd78dcd345
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 09:39:59.0764
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uiEMNbWNfjGvovn+XhLVG8mJ6CYBgdiBaQFnB86+3hseeu9sRf5ldoH1zouRoenTFeEAocc144aojNYfpM0VIiPv+DO17jbS/uKFUH11qI8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6400
X-OriginatorOrg: intel.com

On 2025-04-10 12:24 PM, Takashi Iwai wrote:
> On Wed, 09 Apr 2025 13:07:15 +0200,
> Cezary Rojewski wrote:
>>
>> Note: this series is based on Mark's broonie/for-next. The xHCI
>> dependency is missing so it won't compile.  Goal of this RFC is
>> discussing the direction of sound/usb changes.
>>
>> Note #2: Why exclude xHCI?  Current form of xhci-sideband.c [1] does not
>> fare well with Intel's hardware design for USB Audio Offload feature.
>> The production shape for usb/xHCI subjects is being discussed with
>> Mathias.  Once we're ready, I'll share the rest.
>>
>> Note #3: this series does _NOT_ aim to block QCOM's equivalent series
>> [2].  The team does acknowledge that we came the "table" late.  At the
>> same time, we're prepared to help QCOM switch to the presented sound/usb
>> approach if that would benefit the framework and its users as a whole.
>> Make it part of this very series if need be.
>>
>>
>>
>> Apart from changes to sound/usb, the patchset contains exemplary
>> ASoC-based, offload-aware USB driver and a small sound card on the
>> avs-driver side to show how card/dai_link initialization looks like.
>>
>> In short, USB Audio Offload functionality lowers CPU usage when
>> streaming PCM over a USB Audio-Class device.  It has been first
>> introduced in xHCI 1.2 release and is described in section 7.9 [3].
>> Once hardware is prepared with hw_params(), all the USB endpoints
>> operations e.g.: start, stop, submitting URBs, are performed
>> internally, by the hardware and AudioDSP firmware.  Software driver
>> shall not intervene.
>>
>> Startup flow from:
>>
>> 	usb_pcm_open()
>> 	usb_pcm_hw_params()
>> 		snd_usb_endpoint_open()
>> 	usb_pcm_prepare()
>> 		usb_set_interface()
>> 		snd_usb_endpoint_start()
>> 	usb_pcm_trigger(cmd: START/STOP etc.)
>>
>> reduced to:
>>
>> 	usb_pcm_open()
>> 	usb_pcm_hw_params()
>> 		snd_usb_endpoint_open()
>> 	usb_pcm_prepare()
>> 		usb_set_interface()
> 
> Hmm, how can it be?  The start of EP at prepare stage is done only
> conditionally for non-lowlatency or implicit-feedback mode, for
> example.


On Intel architecture the AudioDSP utilizes internal channel to 
communicate with xHCI and perform all the transfer operations.  In 
essence, once SET_INTERFACE TRB is done, the usb-driver is not supposed 
to do anything.  The avs-driver (sound driver) would be the trigger here 
- sends the start/stop/etc. requests to the AudioDSP firmware, DSP does 
the rest.

By trigger I mean SET_PIPELINE_STATE IPC and avs_path_xxx() which are 
utilized for any transfer-type (sound/soc/intel/avs/pcm.c).

>> Handlers such as ack(), sync_stop(), pointer(), delay() are not used
>> here too.  The AudioDSP driver will handle pointer(), rest is
>> firmware/hardware responsibility.
>>
>>
>> There's a hefty number of limitations, most importantly:
>>
>> 1) typically 2 USB devices tops, rest go the classic (non-offload) path
>> 2) AUDIOSTREAMING interfaces only, MIDI not.  While not an interface
>>     type, Media (sound/usb/media) unsupported either
>> 3) simple PCM, UAC_FORMAT_TYPE_I_PCM only
>>
>> Current patchset shows this in form of 'udev->audsb_capable' field.
>> True if xHCI sideband reasource has been assigned to the device.  The
>> filtering is code is not part of the patchset.
>>
>> Important to highlight, 1) means both, offload-aware and offload-unaware
>> drivers could be utilized simultaneously on the system in runtime.
>> Opportunistically few devices would be controlled by the offload-aware
>> driver, whereas everything else by the offload-unaware one.  This
>> differs from existing HDAudio Controller driver situation where either
>> classic, snd_hda_intel driver takes complete control -or- the
>> offload-aware snd_soc_avs driver.
>> In short, once all Audio Sideband resources are depleted, classic
>> sound/usb/card.c driver manages whatever comes next:
>>
>> 	snd_usb_audio (offload un-aware, sound/usb/card.c)
>> 	snd_soc_usb_codec (offload aware, sound/soc/codecs/usb.c)
>>
>>
>> The design goals:
>> 	- make ASoC first class citizen of sound/usb
>> 	- re-use code found in sound/usb, mimic HDAudio integration in ASoC:
>> 	  small sound/soc/codecs/hda.c driver leveraging power of entire
>> 	  sound/pci/hda/
>> 	- no shared control over a USB device, either snd_usb_audio or
>> 	  its ASoC equivalent takes control of the device
>>
>> To do that, major tasks are identified:
>>
>> a) On ASoC side 'struct snd_card' is part of 'struct snd_soc_card' and
>> is managed by the framework.  Similar situation with 'struct snd_pcm'
>> and rtd->pcm.  To keep the teardown path sane, drop card->private_free()
>> and pcm->private_free() usage.
> 
> Well, this is a generic problem of ASoC framework.
> I believe this should be better handled in ASoC core side at first.
> e.g. the card object could be created at the very first step of the
> snd_soc_card creation, too (but without the actual slot assignment or
> device creation).


Well, in my opinion the card's tailing private context (extra size), 
private_free() and all that comes with them in sound/core brings 
unnecessary complexity to the ALSA framework.  devm_xxx() is enough. 
Polluting snd_card and sound/core/init.c with driver-specifics causes 
the teardown procedures on the ALSA framework side harder to read/maintain.

>> b) To initialize ASoC components/DAI properly, PCM capabilities should be
>> known up-front.  To do that, existing USB card probe() has to be split.
>>  From one-stage to two-stage process:
>>
>> 	- look ahead and parse usb_interface descriptors for PCM endpoints
>> 	  but do not create any PCMs (sound devices) yet
>> 	- create all PCMs based on obtained ->pcm_list and follow with
>> 	  MIDI/mixers/media
>>
>> Such approach allows to feed DAIs proper data even when a valid
>> sound-card pointer is not yet present - the initialization occurs before
>> snd_soc_bind_card() is called.
>   
> This one is another thing that is needed to adjust for ASoC
> framework.  But when snd_card object is available, this can be
> resolved automatically, too?  e.g. snd_pcm object or such can be
> created at that point.  The actual device registration is done anyway
> later via snd_device_register() call.


While I'm up for upgrading either framework in any area necessary to 
have proper UAO support in ASoC, not sure whether it's a good idea to 
make it a requirement for the feature.  This will enlarge the series - 
well, guess it will be separate series (dependency) entirely.

>> Point a) is scaled for all three "domains" of sound/usb: chip, stream
>> and quirks.  That's why there total of 6 commits doing that job.  First
>> implement, then switch.  Everything that follows is, in my opinion,
>> self-explanatory.  No need to repeat commit messages.
>>
>>
>> [1]: https://lore.kernel.org/all/20250319005141.312805-2-quic_wcheng@quicinc.com/
>> [2]: https://lore.kernel.org/all/20250319005141.312805-1-quic_wcheng@quicinc.com/
>> [3]: https://www.intel.com/content/dam/www/public/us/en/documents/technical-specifications/extensible-host-controler-interface-usb-xhci.pdf
