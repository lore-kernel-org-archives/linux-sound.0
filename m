Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2555430C608;
	Tue, 23 Jun 2026 19:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782243336; cv=fail; b=Nj3Hp1n4aZNudphWKZsF/IYP/9Gwncxue3KPnZDM6j+uggKb53z2/qVv7T53DIHhYsH1M8+WCMyhhq3dsi3/7sEUZ0TUUpJcY5U6auF/KaFfbf7fOLCaokSKioxkDA0oukPXpAFzaKlXt3CY/iHkCDigPXBUfsTB4b6bdtjrsA4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782243336; c=relaxed/simple;
	bh=eSJx1cohegnX/BPstN3ErqKZGYCD1/aeDmxuzgtpvs4=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=TE0A4clVUNGQZ4FQaCCUsNQzcAMk0w8SIRw5hLiCcIlKsOSiGu68KvN00q8mJzh91i5gJe5zEJ+J72d3JlfX74Ggl50aQmmiMj0Ix9NlUYxknOV38JJ9k5o922PWiUsOcgRo2lyCkioqonvwi1AjDWpFDu1WppHLIEcbjjAQNw0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k5VypFPQ; arc=fail smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k5VypFPQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782243334; x=1813779334;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=eSJx1cohegnX/BPstN3ErqKZGYCD1/aeDmxuzgtpvs4=;
  b=k5VypFPQK11Hvh510srq+gcNwzURphPSnQpnvIKcywFNWwKWmJvlEFKq
   CuIYjTm6yT2xZLXx9Wh532+jrcBZCR74zdXN0/kd15OJjug0LG4B+YKjp
   BDoCMLzzdaS6/fgfqwOKYZ+Tft7kscVRbFz0NiIUxA8c/ipmwxHSA23yx
   X5FGQr3aU2H9nSpiNrgZdxwpr4T7BXN6YUcH5Lm8ka8z2LJyJZX8xhRZN
   sgbB5WFpTqf9Qv0W/t9l3+zVAGpRDEH3bQp013GqAt2OartUdat96Z5yF
   CLaz0z2FrYkuasQ1a1qRnBh1q2S/1VSeXYf1/cAti60b5l3D60C5CKrgT
   w==;
X-CSE-ConnectionGUID: uX8K4zmWSpKshRbaNRa4XA==
X-CSE-MsgGUID: n7cZffumQ2+BDWgOxt4aIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="82105249"
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; 
   d="scan'208";a="82105249"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 12:35:33 -0700
X-CSE-ConnectionGUID: DvJZ7ljhRp+ctDpypoqfWA==
X-CSE-MsgGUID: dfsWBzkRQPiq69fRGl4HCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; 
   d="scan'208";a="247272571"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 12:35:33 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 23 Jun 2026 12:35:33 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 23 Jun 2026 12:35:33 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.43) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 23 Jun 2026 12:35:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sKlYwxK05CAKjuWrVDBUU0yWjTJqsve1kS9d8D05uFZ6n3e3Yoq4laYFNGlnu+XMvHuTipuKXC3ILR/XbsuwSqYqdDfwALNZ4DgSdH37wM2DG7UW4GbK+rmGjeAV6rBBJ+KqSmiJETP209FAnuZf81roTLlGwC1L7OJW+7P2XZPT55xnpa29HsKsYcaVrrcrJE7D6zbVim9CbrtuTsUANVQihPbvh9CRcNQbC5FzoaD9cdcq0Sx7lCQEEAA6faPEvIs22aF0DCKi3NLw6M27uSxBdHEWt88Z28DhNkiUSxk1vIjWoVdhcqLuMcWm5xUCUzvJi8nw/SoBxxJlPIrCSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fNINgX1f3m9mFdCBSA5YlXIpsFfy7SvVR7td1UIx77k=;
 b=rN6gChoC7uNqp2mLvh4rN0648m09M/grJj1CQ8KCjRTEcQ0AymgBCWHmNeWzoRNJEP06UCc74TdZ3R4Gh8luDVfvcN6oy4zunw1QvYn3493p9eob47HuG7lJWSW1cFHwDvdsF0pm4NRZTf5G5Ou/l+xHl8Qoy5E3LloNa5wofkya9qpfujet5cvzwR+5fZKXIlHpPIUG+8MGOvKG8szXCy4wsedqgaehbg+udITJSeynmQDOKb+lL/zTJB4yO59dy1GXLR4yBWKfNNP1W4JoejLbi+N1QBobW1hzOkT7OGjUmNQjxB9HN0G3yssCrkQhbIZ0HZWxkugrMSBJRHKv1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6967.namprd11.prod.outlook.com (2603:10b6:806:2bb::15)
 by CH2PR11MB8866.namprd11.prod.outlook.com (2603:10b6:610:281::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Tue, 23 Jun
 2026 19:35:29 +0000
Received: from SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4]) by SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4%4]) with mapi id 15.21.0139.018; Tue, 23 Jun 2026
 19:35:29 +0000
Message-ID: <fffe4925-c5aa-42a5-ab8a-d8da4989b9b9@intel.com>
Date: Tue, 23 Jun 2026 21:35:21 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] ASoC: intel: sst-mfld-platform-pcm: Use
 __free(kfree) for stream pointer
To: <phucduc.bui@gmail.com>
CC: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Peter
 Ujfalusi" <peter.ujfalusi@linux.intel.com>, Bard Liao
	<yung-chuan.liao@linux.intel.com>, Kai Vehmanen
	<kai.vehmanen@linux.intel.com>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.dev>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>, "Liam
 Girdwood" <liam.r.girdwood@linux.intel.com>
References: <20260623105721.25865-1-phucduc.bui@gmail.com>
 <20260623105721.25865-2-phucduc.bui@gmail.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20260623105721.25865-2-phucduc.bui@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P195CA0053.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:5a::42) To SA1PR11MB6967.namprd11.prod.outlook.com
 (2603:10b6:806:2bb::15)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6967:EE_|CH2PR11MB8866:EE_
X-MS-Office365-Filtering-Correlation-Id: 749857d2-59d9-4d2c-5a4d-08ded15e94d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|376014|7416014|366016|56012099006|4143699003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: ciwzwlfjt43nJGx2LOFzH5P7xrHTVhYibCz3ybqACpckk4AXnxbfI/JUxFgN36V1j+nujAV5hbwa24qOCyUPtavPhTmEv72ZFhp8aCMjJrglaTKMtNal1IRTPqVaYqO6FHfMf/Q+SKFinX/fdW9gLkpUkMRdXIhmA7ee5acPlMN1DACzKQ3wKt6wWJvz6wbfMwAY2ydP6GpShU8PAzt/nlFO4VJJKHYyZxSkNbvxZB0T8m3npyJi1VhGvNyCM+iU7omLb8dl5yvUWn2jSq4t/s11k+45xX0cvAAMdIlONFjcGn3HvI9hlQsp9OU0IW8v7Qq/c20fE9ouRI6yAdSQnZAdD+iPVXbHyyyHOCnYDDmAseFvbQavxnhib9d3pp7pcDCyscoT3/xh9hNMqBAJj2r6yCNqilHx32erhi59mud6BBytF0UTiyHyMFsxiXXIqhTUVhCkscm6MQ/m8qJvBmny/5JgCVByG4mUHBJ7toIFoWP8xW9D+ab+UT/i/FmdF0imxFL3Pk6a4nQzqku663esbHg4J5LmZ4sXJpDUfd6lLNqpRQAaZIwqy4dOg1h2n/dpQ+GFdMlFFRPlHmhSidMMmgk11lsUZF8ZIhrZ71hOsxdD/1RVUtSLZ+mMNxC1Ly3NLOHjBgSv5kuK9OjIfvsPdmvxMOJ6WmwAgRoSG64=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB6967.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(7416014)(366016)(56012099006)(4143699003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q0FyamtiUVdWa0wzMFhqS2o4SWFqcURrditUTVBuSGN1UkdhdmFWWlRIeHU2?=
 =?utf-8?B?U3BUczdhTnU0UDBtSkk1bzd2dTIxQ3V5dEp6akdnQllrNEF6YnVZZk1GRXlF?=
 =?utf-8?B?K2I5bXRPRExpVlQrZDV1QTBwY3BxV1NnTWs4NkZrYkdMYWtBYW5CTi9nejk2?=
 =?utf-8?B?dXNkVVB2WU5zbHdYQmF2WDhBRUJRbUV4UlpqSjk2Q1RTdHRuUEZKazEyMHFP?=
 =?utf-8?B?dFRqSXdYa2Ezb3Jaa1lzREhzcW90YktLOWkwTGJ0aXlINVZ1MXoyRXkvUFRo?=
 =?utf-8?B?SkVzTnlubE5pd3AvU2Q1ODAyaFBBZlpaaTd3NTFNNndCQXowRUlGN2dEck5R?=
 =?utf-8?B?U0VJM2U5c0JVVWtSUmMrRDZpbGNKWnlsaWVWVVF2ejNmUTQrMzNWNTJTZUpE?=
 =?utf-8?B?YTY5Q09FamYxbHArRGlwdi9rZE9XNE42eU4wK05sTXVyNkJqbFhpNGU1RXFI?=
 =?utf-8?B?Vmg5ei9kdjhkVU9pZUxYQnRkQ2pndEdRdGJ1eUNhbjJMNExDQmRjMlI3SVdG?=
 =?utf-8?B?angrVVEvUmt5VTFyeVFBSnl0dHJwUjgzNXN6eGVJL1pyMERyejdlR1dvM2d6?=
 =?utf-8?B?TDBORHZabUtKMHZkZ3FuMDlzcXA5R2p1V3U2MWpHMDJ3dDZEY1dIcTg0WTRa?=
 =?utf-8?B?SWhObHpKaVNNVmhKSGh4OFlsZnNSMWdXdHJJclRVVFBPbEZnQ21MZTRUak9s?=
 =?utf-8?B?Q0dVMytCWS9yYnA5ZERFblE0ejBPNW4vZXkyWEtSdGxrbWpWb0hQdVJOYkhv?=
 =?utf-8?B?OWxGdGlXZytIK0lNMEc0OGxINm5GRGMwMmZZWmxHOU9CNWZXZEcxWCtMNitr?=
 =?utf-8?B?bFFXRjc5UXNZanJLdzJkVGNIdnJDc3Z1ODdjZ2J1bzNac2pYdlZJWUo1THlo?=
 =?utf-8?B?Wm5Pb2hESjE0YUJrUzlJZzZvKzBpWHE3SkRXb2sveEFqL1NYUE95eFVOeG5V?=
 =?utf-8?B?L1A5dTJFNEl1V0w4VkxvT3F6QmxLVGkxV2hTTDhKZVI2cGgzRmN0TTF4bzZI?=
 =?utf-8?B?c0kwQTJBWDE1WUlLaUlYbVdpTzRTYnF3T0RGWTZkTXZXYmxERVF0dmRFUEtp?=
 =?utf-8?B?ZXRzL0NWd3RsMFloUjJtRDZHUTE4cG5YY2xCOEFUdGs4ODI0SmcvNStHMm9i?=
 =?utf-8?B?clEvN2x3YllqLzBsV1NrTUNaSzFGaWdLazhqZ1FGMmZXUFFkMVRaWXMrQk96?=
 =?utf-8?B?ejBOY3N2WEUxOHNSNzcvODZ6V1hIY0VvbkVYajY4d3lCYms3ekZPSVY5dXgz?=
 =?utf-8?B?RzArVGtsSEtQS0NieUltMHBlZm9FRjh4NHRQL2F2WXBsU25XUERrL29LWjRl?=
 =?utf-8?B?a0xZVS9YaVpXL1Q3VFBGK3htV1V5Zyt1RlVQUEVZZjNROXhFQWR6Q0hQRjky?=
 =?utf-8?B?OCtKaGxvaWpzV016MWgrbWdtWHZHdXp1Z25rQ2FQNkFPS3ZZZDNqeHZ0SEVL?=
 =?utf-8?B?VTBiYWhWVldXcjRCL2l0dVh3T3c3UnFyQ0szamozTTY3Vk9NcFJReVpVUkFB?=
 =?utf-8?B?Q05tS2RiVzMzeG1xZXNubnRlYVAyaFY3aDZ3b1FTdEYzZ1pEYngvcEg1U2lE?=
 =?utf-8?B?UmFQVVRtZ0paMFIwNTNSVUVTNHFuaC9RMWlQQURMR1AxZUhWNEdENWh4M3Y3?=
 =?utf-8?B?UnlOcHA2Ty9wS2M0Sld6KzZpdzhObG8wcjZkNmhFNm82MGJqZWxVa3lJaGxu?=
 =?utf-8?B?THpvb2xsMTkzNU9zVXNkenZOR0xYRGRUMGJoS3FoMnRMRjRtZEJEdU1UN2wz?=
 =?utf-8?B?ZmVkSWlJZ1Q1aS94V0xBeWppL0dabitpR0s2WkZLUjF0Tjk3SkR3eWN2UTZ3?=
 =?utf-8?B?MkVaTi9CSituekYyZFFRTDRYa1FlNnk0Um1RZ01KZlQ2VDJudWhwTHZROHpZ?=
 =?utf-8?B?eHgveWJvM2M5cEw2YVRidzJqVW9RbDRKQ3ByZjJ6N1dVSThVVTZwdVNTZ0Js?=
 =?utf-8?B?eDk5MGJ5YlhBOTcxWTllQmhqVWd1SXFhN3lsMWQrVHkvNWZleWY1R2F5VzZ2?=
 =?utf-8?B?YVEwbCtjbXJxUUhyR29hMDFXclQ3bmY5d1lrNGJkamJTMEluc3pXZW9VOGRs?=
 =?utf-8?B?Q0RyZlk0dGp2QzRCVEpnU2RMUnVFb0wrMW5OT3BIWmdMSkxLbzNBN2QvZDg1?=
 =?utf-8?B?bU1xYzdla1dwY1JxK0pycG5KRWQvMEdxdEpUSFZYVWNQNVN0RnNvZjZvenFG?=
 =?utf-8?B?bklTMG5rbUFwekdMR0xUN1VRUkcxTm1xK0QySENkY3R1TU5pUURSWlp0cDlH?=
 =?utf-8?B?WlpBWU1LakRlYWdHMXUvOVVxYVllcXV0VkJ4V1ZIRzZ3ZWZYYUNOWTlYcndQ?=
 =?utf-8?B?RWRXbGJsSjZIdGVqcnY5SGVTeDdKelQ4TlQ3cGtTR2o3US9KOEFlN3hRUVFJ?=
 =?utf-8?Q?TVtDmHY8uqiBcLu8=3D?=
X-Exchange-RoutingPolicyChecked: atpUT83XZdNF16fHk/ORa9K+4LfIXSvNEjA1+pye+4pxf/zUn9EDnBwHJnEdCMMm4CxuVvsk6vBd5vRxKxPJRw6uu0+sWRpKPxQyYkuNOY+CNMpuSOcLtE0PnveWZE+6TjcqKceB82lwsEHxxFVGxlE5HgCi3FjETTscPWpxqQwr2jQP0uZUeyXbiLWpvvWwb7n1v04Kqwmk3q/+0mAmFgYUzi3cTO0AUVe4KvCRIXUwn2Y4nDLVcxsDOKqake8Si6LYqw4JfJQDxhsi2+/QlK/9wc5dNwg3NC9qE4M+AUgOeHj7Zl7RI8MNge6L9r0yQqgPfmBd4XrwHdE1oILkrw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 749857d2-59d9-4d2c-5a4d-08ded15e94d4
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6967.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 19:35:29.1143
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZzRrJP/fiBtyuGChbidmoYuqUAVTq6soZXAOvgO3LbDzip/BWB8eN4cXjlel6exJtAFznVw3+5OLuis/4K66DBBK1b+vtF2zPq4EbZyFG8s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB8866
X-OriginatorOrg: intel.com

On 6/23/2026 12:57 PM, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Declare 'stream' with __free(kfree) so it is automatically freed when
> leaving scope. This allows direct returns from error paths and removes
> the explicit kfree(stream) call.
> Set 'stream' to NULL after ownership has been transferred to
> runtime->private_data to prevent it from being freed on the success path.

Hi Phuc,

Thank you for separating the change.  The design of the patchset is off 
though.  __free() is by no means a requirement for the locking update - 
it should be located at the back.  Also, grouping changes targeting the 
same driver makes the entire patchset easier to follow.  Right now we 
have 2 avs patches surrounded by atom ones from either side.

Last but not least, please drop the filename in the commit title.  We do 
not do that here - some filenames are long and the approach leaves 
little space for answering the _what_ question when building a proper 
commit title.  "ASoC: Intel: atom:" is what you want here.

>   sound/soc/intel/atom/sst-mfld-platform-pcm.c | 19 +++++++++++++------
>   1 file changed, 13 insertions(+), 6 deletions(-)

...


> @@ -347,12 +347,19 @@ static int sst_media_open(struct snd_pcm_substream *substream,
>   	snd_pcm_hw_constraint_step(substream->runtime, 0,
>   			   SNDRV_PCM_HW_PARAM_PERIODS, 2);
>   
> -	return snd_pcm_hw_constraint_integer(runtime,
> -			 SNDRV_PCM_HW_PARAM_PERIODS);
> +	ret_val = snd_pcm_hw_constraint_integer(runtime,
> +						SNDRV_PCM_HW_PARAM_PERIODS);
> +
> +	if (ret_val < 0)
> +		return ret_val;
> +
> +	stream = NULL;
> +
> +	return ret_val;
> +

The entire construct looks bad, unfortunately.  Guess the reason comes 
from its follow up - the locking update.  The delta (+13, -6) isn't 
exactly a good advertisement for the cleanup either.  Again, I see this 
patch as last in the set.  Should lower the delta too.

>   out_ops:
>   	mutex_unlock(&sst_lock);
> -out_power_up:
> -	kfree(stream);
> +
>   	return ret_val;
>   }
>   

