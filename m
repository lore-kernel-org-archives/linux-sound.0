Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8F7B48BD3F
	for <linux-sound@vger.kernel.org>; Tue, 12 May 2026 08:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778573657; cv=fail; b=bhAYXSoeysPAisrU881gcnWpO94LvaiVFZh8FoeWjwnCIplQJ8k5Lgi+82TSh6DTODf70FAeblxJ5F+re8RvABH4L+1/M06qozB5vDsCm9Q4aLtzubiqmUkdO198d3XuiA3rNerb2Ju0Eh+pW09jwCRF7bSbVW7qqMQFKubKUB8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778573657; c=relaxed/simple;
	bh=PVINCMiSxCOdsja9zrFijKiwl0qzpYZmLyU/6hBQW2g=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=MnGh/9L5cJAv9QCrMqpTHBQTjRxD+Fde6RN9AL+UiZ2GGwF4kVNLLyYX3a9BNa8LrMWVzwQh4W9l9ZBvhwb1zfoX0+fEU9GZv+yxNb6bvY29SZlXKqEhQK+YehHhO9Vf8GJHqmrZyU48yAnc3XXvbbXt2NaiYQkx2B3Aw/k/g18=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SKsPata2; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SKsPata2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778573656; x=1810109656;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=PVINCMiSxCOdsja9zrFijKiwl0qzpYZmLyU/6hBQW2g=;
  b=SKsPata2B6r/mudUE/Fn2j1A722qpXN+8I1iZPJKbkVqbPUFXOx4zcVY
   s33pbwD0hm0A16oz9Z+AV/L69auQmOhh2e1g81P1qHPea0D7Y5z1orWB5
   zSdTqhoAULgTekyvaGsTdt6L5yFnJiWYzuJP5/Z/+VGm+f1Zd6NOwmc/V
   KoYpKG8hmjHmMXXVeZoKt+WOLMiWvnGoOpcIZpd7oywFIM1wHT3qcJ3h7
   muMw7kVzUc9lYsrfLqd8BgxeY9+r4O4eYvaS1i6xnXS89iMGiZfe68FTi
   RMw7W4GFQoIMVKwjmKG5w9XRgsy/e5jjoLIPJQBnyBA0Asyr4Dt14DSwf
   g==;
X-CSE-ConnectionGUID: rN+U9oETSkinPMryLhR6AQ==
X-CSE-MsgGUID: f3P90xJQSG2houfiw86x1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="90174787"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="90174787"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 01:14:15 -0700
X-CSE-ConnectionGUID: /l4D1f2IQMK7Vbr8yCtg0Q==
X-CSE-MsgGUID: xrNXK3oaSL+yi3dU+rRCxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="275817585"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 01:14:15 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 12 May 2026 01:14:14 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 12 May 2026 01:14:14 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.2) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 12 May 2026 01:14:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XBnbmRqDRk23YdRl2GWIu4vv1B7Oxu0oYJQ1gEl7f68F3SFpDDf4Jt3DTsboiYcIZPemqBQ+jxbELokgXyWDUjz34eC6aWxU5ITESOjW0wUjDyeVQ3jDzI5Lh7MIL1pG2h/+Dd4auySauwYcjfKl2ggb53Jl1vJKNHdiGh7LEoNy/pyplYszUuW3vqilax/ZweFKFcmOW90yofa8OV803OjefLPkP+GMJFdFZG3kBBTjELZhEoDN3KobZtRXliN54G0CchDCyD0BipkLD7E1eRdqo2nrLbpwYHAj4CNpk4GHr1+cMGYVQbeg+15eoURSwJOqglUVAPAUfOHAcoOLSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S7xyti7vQsY+C7BmoLrRtij4u35zHN27nKGnzZlCom4=;
 b=ak7ZJwaRamOQGfjx1+f2ZH9bK/xy3O5mEc3xChJ3YjPspvHaIo1VlbgJf71+u9Vub+YXbWXWCXIuwXURJyzTpOKaCTvcPc++qv2eidHcNkVfCyl6ztT1hetaN6BiyIzHIGG/kxwoXprr3apcuBCC6Ro3Pj5BufhzD3gKadZhyQuGVN5/1Y1jGjDhjZ11q3Foq0YOQ/+rKWEuwwQUKT6PusVA+96rAhH7NhmrWBDevy59S3o2pXiCGVHSo+i4pDeTGR71duvuc72zq09wtSGIzStS42m+47Ky56vIS+Y+mc8yn2TdVT37HwHg9MtozEoc88Vsh6HRedIMG1KwEIYQvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6967.namprd11.prod.outlook.com (2603:10b6:806:2bb::15)
 by CO1PR11MB4881.namprd11.prod.outlook.com (2603:10b6:303:91::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 08:14:12 +0000
Received: from SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4]) by SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4%4]) with mapi id 15.20.9891.008; Tue, 12 May 2026
 08:14:12 +0000
Message-ID: <4b1260ba-4584-4a73-92bb-022ebdabafb3@intel.com>
Date: Tue, 12 May 2026 10:14:08 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: core: Move all users to deferrable card binding
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
CC: <broonie@kernel.org>, <tiwai@suse.com>, <perex@perex.cz>,
	<amade@asmblr.net>, <linux-sound@vger.kernel.org>
References: <20260430140752.766130-1-cezary.rojewski@intel.com>
 <87ecjin300.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: "Rojewski, Cezary" <cezary.rojewski@intel.com>
In-Reply-To: <87ecjin300.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0070.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:26::19) To SA1PR11MB6967.namprd11.prod.outlook.com
 (2603:10b6:806:2bb::15)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6967:EE_|CO1PR11MB4881:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d85dfcc-8324-4e4d-1050-08deaffe7346
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|11063799003|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: w6UeJqJb1/ybvjmJn/wcV95Htwo7dvearo7sXW7AzvNVLCMlEk3eBZsJNDAfHlAQH8KNhF3fGScEbTw04DfSzMhMTFVH/LiW5cjxyOsaC+C17fMOX6/U+CzlLhqwf6RGvxbplUiMN13kBtzKm+b+V5q4TwgiCtKkT/vZ4welAmI2Ukw2FrcunnK8F7nEJy1ukrIyYvxkgDrX4vIU8idlWWcLx0jTE92XmMTvIIzn5n8dSI4Jt2VenLVPDtAfXTLSf9Ps1uRUqiRbGaqaNX2WzyzoTwyWJFTKlenDqLYLXbakTGebc3JvMrZgfUE1TmzyS+mH2sqEGQBnxedJ1z3OAgsiXNsXrBgl6oxhFyXe92zGGnih/9RWOFJpSzEO1VgwY1dJry4twkCltXq/tMIrRymHdWplp2U73XY9AAaTYzkUHckcJLGisNI3hYoxVuUnbgsRwyF9Nmc+F03a0awOJzhoiPd2Y8EHSH5UhJtmTWQ1iVICC/X7z8lNQyWPOvqax9IJOaOJ5WeIMRXUo0zU4iLJ1JdNtY01odaBUHAHeHfVN6Z0NqxS5kdTSdDwNGhD+ShGT35wdGpoifrqXsaIyoFNT8YZnVRgk9BOe/J7/qjyNRwtQ3aVuRWNrNt4ulhg9edIP6Xuh+TdEUDN8yjvCBBP8ouvAnoZupNpjVkM3434kcnLCrA7mCmyDUCwqEi/
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB6967.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(11063799003)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R0hHeTArUkJnc1lyc0tFUEZSdDVBUS8xMC9hd2tBK0oxc0Z4a1F6MkhnZzBw?=
 =?utf-8?B?cFNhazdKdHdIS2JudEJVbzRxL0lRZzgzekhWNFl0YUltR2N1aHIyZWllc0FO?=
 =?utf-8?B?UXRGZGJOTEZ6T1FidTdCVk1ic1JYL1VpajNhQ0daZkVCRTM3QnRnVEY2WkY1?=
 =?utf-8?B?T29nRUpWUDVHQSs2TVNNQjdnVzFnc2x0TEw0TkFOUDh0Nm9UL1VXMXhuKzZR?=
 =?utf-8?B?ckZ2YTd4ejBrTFh6NFlLL1Z3M1dTUUh1S3RabDgvcXNKakt0VkZUby95Z1VM?=
 =?utf-8?B?amp6eUxQeFFFeXVWWW53bDNod3hnc1FZMUlpNURWSTF1SS9lSDJjcmdhRlJW?=
 =?utf-8?B?c09vVytQN3ozRVdibTJxbUlJNktvYXU1Q3RKMll4YnE3Q0gvcTVybjJ4bS9k?=
 =?utf-8?B?bXp6VjJoc0FZWGw1MXAwOUlLRFBGVGFFWm9VelRxWmpraU93VHEvU0xiRnhD?=
 =?utf-8?B?RElVbGdHSyt5U1dobVE0KzRnL3NobDhicUVHVFFBc0ZFdGlNVGdYQVZZdk1R?=
 =?utf-8?B?b3VxeW9HcjE3TTJ3SS9oQU90akI4SVN4N0tOOE9jZFpaUHhvdGI0YUh5TlV5?=
 =?utf-8?B?Rkx0bXltZk9zUDVvbTZCL3Z2K0VYK3k5d2F3UjltYUVHSWFGWGJOTXZ6WGRq?=
 =?utf-8?B?SDBiWG9aZmFVdUJkS3loa3lzdHgrTFlTc0Jpd2x1Q0lVOVRMMFlPV2xjL0VR?=
 =?utf-8?B?bW80YXN2eVhSNG5BSFkyRTdwVENaRHlLODVQVGR4NGRUS1Mwdkc4cWlyTjJK?=
 =?utf-8?B?VE5BVFRtUEVyRThjaTA3dVFPMUpsQm40THNUSzZCYnkrMnNaU09PaHAyNUZm?=
 =?utf-8?B?ZEdxT3BqVHd1cnZzUFlpQmNzTmFFM3M3aURWeTZMb1RDeTA5eTZZRFRSbmFa?=
 =?utf-8?B?ODFwUWQ4UUdrSlRKR3NzQkJoZFlubzVWdmlNNExjL29nLzZnZ2VaOGp0MW81?=
 =?utf-8?B?QlAxV3lLSjZMSGgwbVVHaTcxYUd5bkQ3Ni9OSE9WdlN5TG4yZVpNeFZvWENm?=
 =?utf-8?B?RGE1SkZsMmxYRTVuUUluR1hHeW11LzNQc2NHdUJQZmFmMmxIYjJoTTlkeWNK?=
 =?utf-8?B?S25mRjZEZklsL05wZEJjYU9yMTZJL2pQK2NZSWoxejc5ck5KWE9xR3hjUk1S?=
 =?utf-8?B?SGhZRHExU0dxNVlRNmF4M2VTSE9iSWYwRkJDMzNraVZNU2p0U3JaeHVyZUhI?=
 =?utf-8?B?N3BQbk83SjBrOU82OUlKaTlZeXpJQkl6cU1tK1A3Z1ByQ0N2eWNjV3JBOUlr?=
 =?utf-8?B?SGxmaVZYSnFwSkhDVy9hYmJlUitwSm91ZTZhdmJvWUgvNm50OEJTL0MxRzdw?=
 =?utf-8?B?RE92eHVwVUxmV2pBdTdGRkFKNnROdDNMQ3Z0SzBzUXNaOFEzM2l0TkVOaWo4?=
 =?utf-8?B?U0pSOW9WZGhwYmFWUHJkdjUwUTFlT2laS2JRVVVQdlBCeGlKZUI1c0lra0Nu?=
 =?utf-8?B?ZmFNVUlBOVFWRnlHWkZ1T2Zubm5VbWZCRUc0d1hZWHhRdXpZZldCVlNZN2Jz?=
 =?utf-8?B?SzFhMEkzejNNTGg4bnd4dThzMlQyazBzTXFSOEptc2FUYmUwOXIrdjJOd3RZ?=
 =?utf-8?B?cVI1NEpoQW4zcHpVbDJTRkdYRTVDMkk1RlcrZFc0SDVJVW5wRUFGRkZqSnpL?=
 =?utf-8?B?VysrNlFuVTFxZHM0MVNnUCtOWGJtRUpmcTFsQ0c5Z2xsMHo5REhiVmRMTUVa?=
 =?utf-8?B?b2lOcVIvRHhxWk9vTHRpSDY2NStVOUVjTXVDYTg2eDV3V3c1ZHBSNENMU0w4?=
 =?utf-8?B?eEZqa0cxeWlkR3VLTmYyZmo4QnFjK2tGMkxDWFJmRU5jd2tyck5DTkdCam8y?=
 =?utf-8?B?S0tEaGd4L3dMNVAwRVRtUVhuS0t0clJ5ZG1FNDBBL2VsS0dndlNWcDlJV203?=
 =?utf-8?B?U3pDQWdXSkgwOUtNWXhQV2M4dGJFVURhcjBwNElJa2IzYlBMczRNR09nemQx?=
 =?utf-8?B?ZGtlTnF6d21MbVpyN2EwTG1wQzRKUm80aUJZKytCU1VKeWNsdERnQUdQeTRD?=
 =?utf-8?B?eldtYktHMlkrQk80Z2sxUTBWSGZyTnkxamZrWThWVkJQRkZWSlNVdjFycTFI?=
 =?utf-8?B?ZjV4em14T01BaHVPaGtUTW9HYzBtRDlsaDc4L3ZzY09PQ21ZeGxkQzZ6Yk1E?=
 =?utf-8?B?OEtidWdVd0x3MmJBVWpJTXRPVWNwQWhBTXllZzhKNE81T0R2QjNwcUtJRlZO?=
 =?utf-8?B?U05BV1l3NWZlaGd0MXRqZjBHS1lxM0twMHVOdnpUN3lxSkpPeHNYdHc2SnFp?=
 =?utf-8?B?MENSSGNsdlVaK0NHVzVzZURxUXNWSlF6MnMvd2JnN0w1cWR5ZVdXTkpjK1pq?=
 =?utf-8?B?d0l3cXlSNVd0aVdQdjRRQ0JnVTB4VGFKbUcyZVlKc3ZaOEpUdklocmxJU3Ns?=
 =?utf-8?Q?L0Lptgl4seVhKD1c=3D?=
X-Exchange-RoutingPolicyChecked: Dpt1WAn9RSLJJDa8AlMUlRxSzPtlXQ7Z71nE3xG/jrkC1OVyG8AfIyNJPFjSKT/IkHhwOXQlvqi0QhJu27/WKTDBM5fjwPYt78HAMSGq+nViheWZT/vHQtk4YFQE0Xn+nXchcmsOJHxOVGzcHQUcM0pxQzsa1n7X7VPD7WMrdh4ZCB1mcaZQdnFFcmwbktROSrbDjPBU1cwWKOyApaiBHAquhmmPS7vkJO28vLOkwl9SMem/l6R6r8DMsehfrWkqVdOkZRGVpR4ndZUKPbgzT6jHicPkeaKj/ByOj8PmJyeghBkL4LWoJ0mjVmN4RkPUYiqXpo4aDtsx6J4hQURCnQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d85dfcc-8324-4e4d-1050-08deaffe7346
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6967.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 08:14:12.5896
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j8GQseg8YzqbEhEhXER4Z9+gWjVUW+Wkak8QpVMW8A6yvB25q0slVilfV28KjSsAMsr5ArE2shYrT9cxwIX6XF8Uw4jNjMl77uFvxv4blQg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4881
X-OriginatorOrg: intel.com

On 5/11/2026 3:34 AM, Kuninori Morimoto wrote:
> 
> Hi Cezary
> 
> Thank you for the patch.
> And sorry for my late response, it was long holiday in Japan.

Thank you for finding the time for review and asking the questions!

(...)

> 
> It looks more simple, thank you !
> 
> 2 questions.
> 
> Q1. this means, devm_ register user can use auto rebind, normal user can't,
>      but is this correct ?

Rebind is now the default, regardless of the method a driver registers a 
card. devm_xxx() variant causes the snd_soc_bind_card() to be managed 
and the card is automatically unbound (unregistered) when the device is 
detached. Apart from that, there's no difference between the classic 
(non-devm) and the managed (devm) way.

> Q2. If so, list_xxx() can be done in devm_snd_soc_bind_card(), instead of
>      normal snd_soc_bind_card(), but what do you think ?
Guess if Q1 answer is "no", then Q2 needs no discussion. Feel free to 
correct me/ask again if I'm wrong about this.


Kind regards,
Czarek
