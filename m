Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 569D11B3F17
	for <linux-sound@vger.kernel.org>; Wed, 14 Aug 2024 14:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723646920; cv=fail; b=s2L/7CQ20spvJCvSG67kT30CEtSdxxGxYMTh3OFqFX2aO5kkLBCOKy3+LfgEliA71Jqs5rdo2X6jSHe3RlN3zKwAbBVNzf+8wk22LR7LNEabzL4l4dDNq86gj6uq5XmvOKFI5ba+GL0JunRYjuuw+jAsTD/zSi7hCjwqeo/trIs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723646920; c=relaxed/simple;
	bh=Ue6gvmOB1R9tUO509u/APPzZ9jdKXrV8QeyGXx7eTQA=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=K3ke+CJ9LJzzQRBCaM7cSDOiTWBLzrTGYiRBN1/iumZIST6L4kHUtsQiVx4+UXC4SC0h3snbrbpx1TpOBSnkg20iG4Yy2IviaoyjEND5xcwrgedvh2Q+v1JwRPobqS7+U1MoMWrWkVu+j8cl6IM8VWG1XfHf/PM7KAcA9EbAFAo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WKac+deS; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WKac+deS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723646919; x=1755182919;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Ue6gvmOB1R9tUO509u/APPzZ9jdKXrV8QeyGXx7eTQA=;
  b=WKac+deSRdVYJdE0/5ZISh+++OZMT9V8vrOfIxhVUsdT6p1XbuKSBoF7
   DWJf1hMltvSUMnFBizztLexC3GFjp0LqdeAkzLc91kuopCXJQ5ZEi9MRo
   yPFfdpt5lSEir46vicj+XHMWC8NFpDBm3//wRFwfCZBOt1oVTsGca81bw
   rZsgUojPHnWQeRlf7GTm0pxLkpN+cTPbsxHfwn0O7f3waoO+eHjrs00HU
   xdCTdqlQgjLNfrYY8KeY39IcUgz6H3A6al8Bqfa0YesGbOtBEsKOPunou
   84Nb0BgcG0mCbvw+nYkIKpBaJOBmc+zwmK05CrCAnFSK0ge05y/0+m9g2
   w==;
X-CSE-ConnectionGUID: thwpMp1JT/mWqscb+nCmYw==
X-CSE-MsgGUID: vYiJ/EgKRBGlHeOlXSwcYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11164"; a="25733793"
X-IronPort-AV: E=Sophos;i="6.10,146,1719903600"; 
   d="scan'208";a="25733793"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2024 07:48:35 -0700
X-CSE-ConnectionGUID: L8ZvAyH7RluJWTVh9O1UEQ==
X-CSE-MsgGUID: 675R5GT3TL6kHt68/aYbxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,146,1719903600"; 
   d="scan'208";a="89741759"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 14 Aug 2024 07:48:34 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 14 Aug 2024 07:48:33 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 14 Aug 2024 07:48:32 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 14 Aug 2024 07:48:32 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 14 Aug 2024 07:48:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s5Qbd3MoJ7fdH5/2/PjOdOEFDXU+wjKJ4TOnkeYq+o+pCzKCKlnRJ9q5DzIgtcH4qXcKVGTVNrQPeAPRKInrZa4+REQqzBRxwy+Rf3GHa8lZgidRx73tx/nI1sVwRgXFwy8yh7fPQCJHih97rwUVf5ddsun652qeNXl5z/eSHW6PmLmyVFIYqIUX/zD3rvwNNyT3zagnD7VtarGkvFppkEVP4TTn00z03AMUj5TMwr41HGy+Pug++7LUurwRX4jmNWrUA6jiEX3fqkqWyCEO+FgVXOOnnrSkpd4JFS+lfTLv/OKiHoxd4EV8aDNL8sAsAyCiYMOS0mz4DD4VB9Itmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1+F9Fn7KGVVOVf6yiGx94ms9pbAtsETbTpi6H0QPRJI=;
 b=fgI5OvtoNpX1pHtGPOWLzyhWrAXHb+bIQzgtMpxJ/9LvmuD0GMSAOHJo6SxIIiP9kHLieKKa3CrDK1zzV2PV7VZ3MyMkJstmxcJbPpJd5BCwYk9uTjy4/U4bVWqVRBXr+vY6ECQk142e8QaSBAgc7+6gRb9nM/48Zk5RjTSHsIHkUbMvPsOruOVnxIKOCKqykfqGwU4hA4kGrYr49uyNWKznBxc2wqri4cYspTogIt3s5je6kcitJanIFzQCmG6JR2o8ZsdV3xAfpLwBw/sBqv7Vx/C9C52HisejPaOmeraIumotyKURAVcg12G7EUMa+S8ckWutTbZ8W5uUmQ09cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 CH3PR11MB7371.namprd11.prod.outlook.com (2603:10b6:610:151::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.33; Wed, 14 Aug
 2024 14:48:29 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cd01:59f6:b0f8:c832]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cd01:59f6:b0f8:c832%7]) with mapi id 15.20.7828.031; Wed, 14 Aug 2024
 14:48:29 +0000
Message-ID: <060a90cb-e044-49f7-a7da-364d6e0ff2e2@intel.com>
Date: Wed, 14 Aug 2024 16:48:21 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/14] ASoC: Intel: Remove skylake driver
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: <broonie@kernel.org>, <alsa-devel@alsa-project.org>,
	<linux-sound@vger.kernel.org>, <tiwai@suse.com>, <perex@perex.cz>,
	<amadeuszx.slawinski@linux.intel.com>,
	<pierre-louis.bossart@linux.intel.com>, <hdegoede@redhat.com>,
	<cujomalainey@chromium.org>, <lmajczak@google.com>
References: <20240814083929.1217319-1-cezary.rojewski@intel.com>
 <ZrzCPfagF7ezdzMq@smile.fi.intel.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <ZrzCPfagF7ezdzMq@smile.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0037.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::17) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|CH3PR11MB7371:EE_
X-MS-Office365-Filtering-Correlation-Id: 969d5215-4dda-45d0-3ca5-08dcbc702942
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016;
X-Microsoft-Antispam-Message-Info: 3Rb8DkdczRTLOXejvMKXUYrjyCKkz83IILopWARr38RhulJJy+EkL4DXTJHaDXHw4HoC8svWY1NKchB5LtCK35KAudhUVwTUCmjFpi7CEcyG+Rl8uhSZGH/JYJm/J5VvroCrOjaBO8aHGGvqvil8Sm9eG6ABdQbH50+2nXc4nOeM+VvbrQqOcvT0BMcr4t9/vTf+VXMdB56zqPHdxW2TgbeH5Hm2X2jhun1HOtA0erkMB3Q36M3tzd/FulhnRDXMHFhI5BEUmbJn8JKxJNteANJR/veTnmsgCF0ecAwDgdTx+l7Iw9115bC8VFXwgFQhYQEJ0tDI2b4zFdYzuX0cfggLZqQTpgbXOy+bgZwfRuDDWfnjdnCguXo8v0YhFeumvmIax+wgnsJXvs3N1G6+XYZq9gGUNBruoRF8844tSyT0Ti1V2EIO1obdY9EZJUTYZqUSduhOv9lD94IeE0eMSa98XscHxP1FiP5Rx4MJBZB1Tj4Z1Riz6+OIC58Es17MEu9Ldym7FDYBh6N1z/JvyNpEgXVf+POI+hMBpO4O5yb+z2ba5MdfF/m7msqtrjLfZCsV8NRwjb87+t0KYpDqORBEH+1ZlaypYgee5W/edwOSy2gIXkNoBcX36PB6BUojdsS8TnhJyNtt4eD6d+E3hnXE5oX00DXQCiet7auQxP0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6375.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?emxJcU82WDZrcjhwT1ZKN3hoQlkwVHA0YlpJdmNzNUV1Q3RuWTFtVjU3dXpV?=
 =?utf-8?B?RVJkbjFONU5pV3NNYzZJTEE3b3I3ODQ5cy9ycHk3bjBOaVFvUTAzNnJ1V2Yw?=
 =?utf-8?B?dUcwM3REVWhjYXdVQjVwRGVWL0hEa0NOaGdjZzFmYVQ0WWFiZy96MWdBUzhv?=
 =?utf-8?B?RGluUUdBY2FoWmZLMTgvQThIdk1YUTlNTzdQR3hNVSszQm5HdUJiQzJpOW9J?=
 =?utf-8?B?NWdUdktnVWpONGRNeSt1ZFFYRTFaSyszNUlIOUZPcGNzTUplcjdXRHJJQUNC?=
 =?utf-8?B?clR0UUttbG5YS0tqWVY1ZFpQdHNUY2NsQUZlT2ZPczhEOE03ZWovajR3eWhH?=
 =?utf-8?B?Y2JlV0Rxd0d4enBlVGhtTTdySzQvb1lhWkx0WnkweWxpVjl0MTg5RTNYQkVy?=
 =?utf-8?B?TlBRK3ZVZjgvNEtLN2Q2VGk5Z3BoLzlxRHNpY01yNEI3NTNoSG14QlBLakxK?=
 =?utf-8?B?Wm9UMVp3SVE3NTl4RHAxQjdtZWR3Nlc4eUNhcmFyaTdDS2h6L3lBYXNpMHFP?=
 =?utf-8?B?ZGZqcEU2VlYrZmZsVFNVSWlDREY2WVVZSEFQSW1PRDNaZDR3TzNmekN2VkRq?=
 =?utf-8?B?b0lXcnd5VFhaRndSbUU1djlKcEdxUnU5UFlFd2NDcHd2eUU0NUt1Y3U1UGNq?=
 =?utf-8?B?Y2FBbkJ2bkplZDRUaDhwOUluT21VRFM2djdBYmZYdk5POW0wUElCTVQ0UzVK?=
 =?utf-8?B?NmpBTHZDbkFhZTFoZDVyWFRDSUJKajBoOFV3ZjVxUFF5ODMrVm1YU0pMNmRK?=
 =?utf-8?B?c2svWlFYdnZodHhwZlV5L0dTSEgrZmk3YmtHeHp3ZG90c3l0UEZxRTRFb3FH?=
 =?utf-8?B?QnhuNndXajBRMWltQVRObHBrVkVzcjdxYnEyZHkxOTNzVHN5cHZwSWhqNVhH?=
 =?utf-8?B?cldDNWQ0RmRYSXhsL3JNWUFBQkt2a0cwcm8wdlZNNHkyQlVVbTZBUWc2aTBo?=
 =?utf-8?B?OUNFbzB2aGI2NlRTMTJRSU8zS2l3OVhKcnF1a2llQkVBRkZ1N01WTlZhWXp4?=
 =?utf-8?B?akJTQ1FML3VpM0VTN2wvaFdjR256djh4SWxrcUhwMEFhTXhoNG5VZ2Yweldh?=
 =?utf-8?B?SjVhN3ZDUUdoWkptMDhmVERuS3NBaWV1Q243bEpGRWFHUEdwdnZSZ3VhbWxn?=
 =?utf-8?B?VHIxZC8ycXB3Rk9QQ0NOcndlZlg0WHF2UVIrYk9TU3U4aklQWW9xdUsvUUxs?=
 =?utf-8?B?RS9xWk9KYXAvQXBieFdvMGhPRkFxTEt2SGRIcWIxL0V1MmlKelJHRlVsMTZ5?=
 =?utf-8?B?STJsQmUxSEcrMHVEd3QyL2lUOHYybFlSZHdBWG82L0t2V1ZNcWVCUHdDL3lY?=
 =?utf-8?B?bGpPSWFleHJVdldXMmVmelFkaGI4a0FKN2lUejA2N3RVTVFjdlNYTUh1R1Jo?=
 =?utf-8?B?VVg2eXVmUU5jYnhraUhnZG1oc3Mvd3Fob2Q2T2ZzRE5QNWVlaDQ5Qks2WVFV?=
 =?utf-8?B?aW9LeGlsK1hobyt1dDJyejA2bmFwMHFmaGhVSElhMEdDYUlDM1hzNXEzRS9E?=
 =?utf-8?B?Y2laYmVRd0N2b05yN3g2bVpwQmthL0JOdnRxMDB1STVYeVpkQjlhemJ5Y0hk?=
 =?utf-8?B?Y2lsSkJkK25aemRYMzkxbWZTN21MbTZLcjJWdHpTblhhTVU5L0xRQkpsd0Jo?=
 =?utf-8?B?Yk5lYUpmOURuUjFLbkdQaHF2ZXFlMERKbnVWVTNZOERIajNkakI2QW83YXFk?=
 =?utf-8?B?NEI5d0pLV3lpcFNtVjdtbnJJdE5rOW9hRmRvUGxzQVorTDR0VzF5WW9QWkoy?=
 =?utf-8?B?ZGZaVzcwbTZpZHhUcDFPN1YvMllZT2J4QkRLbzBYMmVVNDF5RldOZjczY1Iz?=
 =?utf-8?B?TU5aZzljaHlBT3JMOXoxejArSGtjbTZqRlVsMXRCVys5NnBNSExEVUh6V2ZV?=
 =?utf-8?B?WXdpQTlwckxxUHJhWnNOME14N053cGFpN051aVlYV3ZOWHluaEplOXRDY0tw?=
 =?utf-8?B?d2xmVWtMQXMxZmRqN1B1SUFZeFBhSnE3Zzl6eVpsRnVZQlBwUzV5c3N3ZEc0?=
 =?utf-8?B?NU5CaXg3Q3FtL0RTaXI1MU5NOUgyNGJpaHBtaVBsSCs5WWtQY256VWhzU0Nr?=
 =?utf-8?B?dkNOcy9DWnAwU0hrQXQzaTV3RkV0dVgwRVNkVWZKRERjU1o2YWpBYWdHWGFy?=
 =?utf-8?B?amRjM2lmUnpJQ3JNYTdDR2o0Y1ZGUk9zeENBcjVBNHUxVVkxWTU4ODYxcWFt?=
 =?utf-8?B?d1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 969d5215-4dda-45d0-3ca5-08dcbc702942
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2024 14:48:29.6910
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ojz527AQ+q03mq80YYxH1BGej+SrXYjYCcVDJ8/I1xecluQAu7EmRECzIiIAczpmEzqcYg64QE1yY7CD9Fr3rJNGw+6iA9gTELB4WHJe2ng=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7371
X-OriginatorOrg: intel.com

On 2024-08-14 4:42 PM, Andy Shevchenko wrote:
> On Wed, Aug 14, 2024 at 10:39:15AM +0200, Cezary Rojewski wrote:
>> A spiritual successor to haswell/baytrail removal series [1].
>>
>> The avs-driver found in sound/soc/intel/avs is a direct replacement to
>> the existing skylake-driver. It covers all features supported by it and
>> more and aligns with the recommended flows and requirements based on
>> Windows driver equivalent.
>>
>> The skylake-driver related UAPI has been removed with "ASoC: Drop
>> soc-topology ABI v4 support" [2].
>>
>> For the official kernel tree the deprecation begun with v6.0. Most
>> skylake-drivers users moved to avs- or SOF-driver when AudioDSP
>> capabilities are available on the platform or to snd-hda-intel
>> (sound/pci/hda) when such capabilities are not.
>>
>> For the supported trees the deprecation begun with v5.4 with v5.15 being
>> the first where the skylake-driver is disabled entirely.
>>
>> All machine board drivers that consume this DSP driver have their
>> replacements present within sound/soc/intel/avs/boards/ directory.
> 
>> Changes in v2:
>> - added two new patches (leading the series)
>> - the first moves all device entries previously under the skylake-driver
>>    dependency under the avs-driver
>> - the second patch drops struct skl_machine_pdata usage to fix
>>    compilation errors as pointed out by IKP
>> - no further changes, retained Acked-by tags for these
> 
> Hmm... Have you received my tag for the v1?
> 
> Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Yeah, I've left the tags alone for patches 3-14 but for the newly added 
two I did not as that would be inappropriate. The first two patches 
address the problems reported by IKP bot - I've not been dealing with 
sound/soc/intel/common/ for a while and have forgotten about its existence.

Thank you for reviewing the series!

Kind regards,
Czarek
