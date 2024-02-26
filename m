Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A20604C9
	for <linux-sound@vger.kernel.org>; Mon, 26 Feb 2024 12:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708950349; cv=fail; b=Qb6vi57R9mh7+eCYuGzPOcfLntzfP1z6H6cVJYo2n9g2U5eImIQUeDb7B5YX3In/BaSCjatiYAStB8ojdNugRkoT98NvAVKrPGAIIgG3iTHG7c7T/v9LgBykw20oezzZ639XEgTFzjiXJok1DIeWny0N+9cCWacMUfqKZsImOVY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708950349; c=relaxed/simple;
	bh=OIAYCqjrWi1QpDgxLItgHCofxlmCwKYJQeu0LGKQt4w=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=FyfE4kj3jwWVLNwJfAvoh+glLliutDsHc0QAB/l31ik63zS2gIg5u/Zv+G28Rvd9xcPrTcpDoJTJtMf2pQipTi7mQsmJe8beVz85zSZNsnlf71ODvtlFrRCJqvf2UTFn37thqNxXQX7ADNoB18de1rPVSdxw+J6Iinht4uP/Op0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EuUzo915; arc=fail smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EuUzo915"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708950348; x=1740486348;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=OIAYCqjrWi1QpDgxLItgHCofxlmCwKYJQeu0LGKQt4w=;
  b=EuUzo915UfVKGiCFdgMjvhlqTXBshmGNQ2wHaqNQPc09jiDDLp1erq0R
   vvbF6u+Dwkg8DzWtgxkFuXdOV5WmknfDUFh5SmjwPQNR2tYvy8oNhy2jA
   6sE00zz06WXtHYsVEOGbpxNfQMuzCDJHWlRQ2OJLs6cYUOdoIE4QKoGRP
   n2duCKKVTiWvq0yTNow3sZSc6qIEJWb0uOyuxvM/J0oIOTn2X8EyrPMmV
   dJ4cVFmiyQpeCi0EsQzDz8FlvcMnztIAeRpKIRMF1yT9gxN1UukXn90+Y
   WEKaaHOf6oeMj0k7BTkSn/I/CKSCnhrV5Qy1/so2EFZNNmSVX17rjIJNO
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10995"; a="3090820"
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="3090820"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2024 04:25:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="11287649"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 26 Feb 2024 04:25:47 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 26 Feb 2024 04:25:46 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 26 Feb 2024 04:25:46 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 26 Feb 2024 04:25:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G2S3SzfO8ZS2bAC3yA8Xi0vBPyKBUx4oWbXN1mGOcOlLTkEOjBEuY2NBHhDe/ghPKHX9YVaLPbNcUiHEmsHf97GRp84wKNDU6y7veI8uMno/MfW7D3UWHKcBDx+TsFajHg3dw2e1kSN6KSj6IBVhVdGRqff+9P3SgIigUcq98TUPbYPeLK1uUaGhtd1cFIYRUOrTZjPVLRGXLlD0NA/LYi3GfAbXuOmjypHus5aWFFumZJFph8bDHwaqOhC1KciVprBydfhilGKsib0AVna+LJgISSs/WZo9RxDzmqtP51zhIgyoE3aa+YNBw1OSly4TG3Uao3gcP/q7li16m69KWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aDexDzKSRD4EdKtst5IY3TGWQsku1RdNeYGTtQMDNS4=;
 b=k78ETNtH0rdcj/NvkfZAuK3bdIKxy9qTQvDLUXqVb0ybbI8IbBQxonNFy7/tD9BQd+MEkdIYEGahtZuAOping/6KwoNWCYZRs2Pabu9N9iMW59cgieiqyn8imK/VsrwKNLorA7Hz0bRijqZg/JB9T1RKpWvKGFcXEKvt08xEHnRCZKv9AgUDoBy/QDKa10CoDoypTIhfTokDEJG5rV+qJsaAqhST5TwknCjOjuZiFsFXv0Z0OW5eLM7u8+vugy4X6FG47v9yBdrQ86Y81Hvl4cxPgOvuKBQgpj0LsAwrUJE/dlc4cFMCkN9qCU1FKRKvl698ntYEVsxL1GvmJ8y8Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 LV3PR11MB8457.namprd11.prod.outlook.com (2603:10b6:408:1b7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.22; Mon, 26 Feb
 2024 12:25:44 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::804f:f362:1acb:f0f5]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::804f:f362:1acb:f0f5%5]) with mapi id 15.20.7339.022; Mon, 26 Feb 2024
 12:25:44 +0000
Message-ID: <f7dcf11a-d37e-4023-a3d1-47a68852fa8a@intel.com>
Date: Mon, 26 Feb 2024 13:25:38 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] ALSA: hda: Skip i915 initialization on
 CNL/LKF-based platforms
To: Jani Nikula <jani.nikula@linux.intel.com>, <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
	<tiwai@suse.com>, <perex@perex.cz>, <joonas.lahtinen@linux.intel.com>,
	<rodrigo.vivi@intel.com>, <tvrtko.ursulin@linux.intel.com>,
	<intel-gfx@lists.freedesktop.org>, <amadeuszx.slawinski@linux.intel.com>,
	<pierre-louis.bossart@linux.intel.com>, <hdegoede@redhat.com>
References: <20240223114626.1052784-1-cezary.rojewski@intel.com>
 <20240223114626.1052784-2-cezary.rojewski@intel.com>
 <87plwjo6e5.fsf@intel.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <87plwjo6e5.fsf@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR5P281CA0059.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f0::13) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|LV3PR11MB8457:EE_
X-MS-Office365-Filtering-Correlation-Id: 151ad664-92bd-443e-d7dc-08dc36c60dc0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zx+jMSMxTYM3uuGYI3e4H1tCToTLFL80CFZ6nk8DRPLyr0gLBNEaOEtoRVQc/XKAU6PU/HVQI4WuI1p5g4j1Ol0MwGWPVsh4NGq4pyVliJWuUwjTsvIeUUhwgXaJ5+DqPpKiYhmj+GD4qAeLPPaV8ecn8cv8oUg/8khvCXnQFOAmJpHwYoXlEDqNusItZSjahghUWz2afYmH7CmCHxH6O5twClAS5R/qR7LNHj+Y40MYOBhq802/N04dqwK89AX/2MdDp+lWMig0HotI1lpgoullqvB1udI8GQjyFMcVgSxtbcwfAWLv/qjKuFQHQQ1QoS9HPJQ3bERSlQHxEywhGWOOwd78h6NrTokbdHiVsMcYSgRalw53mGoIZGMHl4IPvmiddZgQhivc9PP1JJp20XXECxwOUYCc6QkgQI679EJGSrUPpTfCH4lPkQ5pqS0rWgp6lxUvWZYoYTD87oXQ2WxC1Ahrn2wRJ3vx0Xdb+3jtmCwKS4DMMS4PLuIC1Ed83IAhj5HB6FkNCspeGLoGjJ7EelQjnEShEfL8FbfbsLbyNtmHwqfmc07Eg9SDXaOWZ4LHO5Mg7Up/hPJikWduKrxS6yi2fE2xyLpD71lAbhRZqpeRHv7Fqq8iHrIqKG71
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6375.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZWRZK1lSaytacHUvY01ycUY2MkJXaUpra2tFN0ZrUGZBWDF5Vy9GeFZCOHNq?=
 =?utf-8?B?TENxM25tOFVjOE9LK3NzOWtlS0swcER5WlhxTG92MnZnWkZWODJLa1hyOWto?=
 =?utf-8?B?KzErSGRhc1lkN20ycEdEUm45TDcyMGN1U1pqeFJDKzdVMVhPMVlrR29RRTlw?=
 =?utf-8?B?K3l5YlBkcHNpV3NKTWRUVmNGaitrTnUvNEJTUkl2aUVmUExBSys1YmFrcU1I?=
 =?utf-8?B?TWkyK0plSHpEMlgzbS9TbXN5VXNrVk5yM0diM0pFb2VJeWhYNVIzWmcyd3dR?=
 =?utf-8?B?Rlprcm82ejJmd05RSEVlbmtLV3laQ253cDR2QjJIdU5NR0RJdkM1SmF6amhO?=
 =?utf-8?B?b1hacklmUmh1U1Nwa0M5NVlhbFdnckg3RFF5THczaS94NDEvVW9DZGhuc2Z2?=
 =?utf-8?B?dnYraU1FYldUam9EVlZ3aWtzdndCN0NZU1JvMDlLWUs4eTBFUG9nMmZtMWJU?=
 =?utf-8?B?R0kvczlnRmswY2l3b1JPRWZYVXg3QVlqSFh1OVp2d0c3dGRDWW9TTTNNZTJY?=
 =?utf-8?B?Q2c5cU1xQjlsclc1MklDM0d3UHBObFo5VzhRMWg4MUNkNENjVnpHNUVmSTRo?=
 =?utf-8?B?aU5XS1NReU90ZFlhMmhGS3JSY01zaE9mWHFjV0N0K0hlMmo0YXppbU1Yay9I?=
 =?utf-8?B?ZG41U2taajQ5YjFhemFDSHBnVlhYNFhZbnBHblNiMXRrZHhjVWN5N0pEQzVi?=
 =?utf-8?B?TStGN0VtbXlNMUtadEdOQm9sYjJXYzlEWjJTNCtZQ3FSZjBJQ2xqQ0ZWNG8x?=
 =?utf-8?B?V3gvUitEVSs3Q3diVmJvTy9CaTVrWWhlTnZGRDZGUzFpVW1IQ29LY2lpeDJF?=
 =?utf-8?B?a1c4YkxHQ3RPUDBiOEkvNjkxWnNnN0UwbllFRHVBMFA3VjhLMVQ3TVZnYTN6?=
 =?utf-8?B?eS9JRU5VWG4wdW8yKzJCZy9HSlhyTVR5bEJlYXpNM3pZS0JHUTlaWjdDVkNP?=
 =?utf-8?B?NnoycHBTNlRPemIrQzE4QUQrR09PeU5JTmU0UG5sbTBYQ2dQbm5YWi9kQkQ2?=
 =?utf-8?B?NjF4bHpPYmJZL1VWeU11MGhIQUthUm5EdFJJZXNjdkkrOHljZlVUdmtnK3E4?=
 =?utf-8?B?cnZISWhXaVFlVFRrMEwyM1dDbEdzSW1Db2VjZW93OWdEa1ZISElkcEsxSzJZ?=
 =?utf-8?B?MDYrWXdkdjhiNXk4VlE1U0NoR0srZ3pZWm9ublhDL1BwWWlXSnJscDNsSmxz?=
 =?utf-8?B?NEJ2aFRRb2dsQ3ZrK3UvbUl1Wlp2dTZsQzZuTk40a1F0RWxhMThrQmR4YWRk?=
 =?utf-8?B?MkFNZzBpeWRRWHdrYktrY01CVXZJWkdHdm5vMGMwY3VBSE1keUVqbk10MVBF?=
 =?utf-8?B?c3FFUFRIVVZGRUltZ2xUdzh1aHNtTHJZTjUvNGU1cFlMNnZkMFRaeXBZckVs?=
 =?utf-8?B?WW5GWnVtbUhvMGkxQnVKR1dKWGhieElacys0SVU1cWJOSFduMlNzR1AvWnVM?=
 =?utf-8?B?dUtDUDZpUGVlZmorSGM2NHdzcTIrd1FPaDRvSm9WMVcvalJOWVNyWExKZTEw?=
 =?utf-8?B?SFBoeEt1djczZWIrQUtBb1lpZkdQblhWYWdMWFdwUWxVTktlTjRIT3N5R0Zk?=
 =?utf-8?B?TGROMUpiWm9Zamk2d1ZGK1VIT2VrU21qdlgzeE81R2VSekE2UzQzdjNHWlVH?=
 =?utf-8?B?a2duditzQjhKRWt1R2FyNEd4YU0zSzFUd29GOXBGVGg3WjU4NGxDRm5lT2ZD?=
 =?utf-8?B?dlFTMXZyTTJVMnFWY1g2NndCRnNIT3prUkdjNlJoTGdsN2xmRmN1cEdkOEdr?=
 =?utf-8?B?dEE1UVVldUUrblRJWFVhSjdXQm02ZUhxMHhKZnR1enlsRVRKN1FHYWN3K1Nu?=
 =?utf-8?B?UWtyb3FIMFVZNkdwZjZYYU0zdmMrbkx5ME5jZkFCUDdHWXYzdmJsZ0FmSFlE?=
 =?utf-8?B?Q2NBSGQ5bG1wTEJmMmkwa3c2UjJtWjgzWGNLeWV6VlNaOVB3ZzhMbk50M3Ew?=
 =?utf-8?B?YzFpWUF4NHhkN0k5Z2xoeE91Zkx2MHcyL2x4SjV1WVFvWkFzai9XZjk4UFpN?=
 =?utf-8?B?S2l5Nkx2ZnlzejlZY1psdjRYd1E5WXEzdkdFY2gyLzFVam1nR3VRVFY1RTQ5?=
 =?utf-8?B?N0RVdnNuaVNZZVJ3MWIyVnJ3OTV3N1lBbE1KSDlHcUZ5YkVjNm1xOTc3Uyth?=
 =?utf-8?B?REFFM1ZmdUJzVi9JSlpOTVFyMkRVZnRsdGkzeFlnMHZ1Uk1JVWVaU3FWWWlj?=
 =?utf-8?B?amc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 151ad664-92bd-443e-d7dc-08dc36c60dc0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 12:25:44.4032
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qw136kInvv1Kj3JM+/2HA89J4a4J91YWr4tE6ZIu5hG4rtIYaKbv1dr2ZlQIQkzsx3UVnEjinoJnbh0jBH7DhS7dL9/B505nac0D0QEMc38=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8457
X-OriginatorOrg: intel.com

On 2024-02-26 11:40 AM, Jani Nikula wrote:
> On Fri, 23 Feb 2024, Cezary Rojewski <cezary.rojewski@intel.com> wrote:
>> Commit 78f613ba1efb ("drm/i915: finish removal of CNL") and its friends
>> removed support for i915 for all CNL-based platforms. HDAudio library,
>> however, still treats such platforms as valid candidates for i915
>> binding. Update query mechanism to reflect changes made in drm tree.
>>
>> At the same time, i915 support for LKF-based platforms has not been
>> provided so remove them from valid binding candidates.
>>
>> Link: https://lore.kernel.org/all/20210728215946.1573015-1-lucas.demarchi@intel.com/
>> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
>> ---
>>   sound/hda/hdac_i915.c | 32 +++++++++++++++++++++++++++++---
>>   1 file changed, 29 insertions(+), 3 deletions(-)
>>
>> diff --git a/sound/hda/hdac_i915.c b/sound/hda/hdac_i915.c
>> index 365c36fdf205..afee87bd0f2e 100644
>> --- a/sound/hda/hdac_i915.c
>> +++ b/sound/hda/hdac_i915.c
>> @@ -127,15 +127,41 @@ static int i915_component_master_match(struct device *dev, int subcomponent,
>>   /* check whether Intel graphics is present and reachable */
>>   static int i915_gfx_present(struct pci_dev *hdac_pci)
>>   {
>> +	/* List of known platforms with no i915 support. */
>> +	static struct pci_device_id denylist[] = {
> 
> This should be const to place it in rodata, it doesn't need to be
> mutable.
> 
>> +		/* CNL */
>> +		{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x5a40), 0x030000, 0xff0000 },
>> +		{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x5a41), 0x030000, 0xff0000 },
>> +		{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x5a42), 0x030000, 0xff0000 },
>> +		{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x5a44), 0x030000, 0xff0000 },
>> +		{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x5a49), 0x030000, 0xff0000 },
>> +		{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x5a4a), 0x030000, 0xff0000 },
>> +		{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x5a4c), 0x030000, 0xff0000 },
>> +		{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x5a50), 0x030000, 0xff0000 },
>> +		{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x5a51), 0x030000, 0xff0000 },
>> +		{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x5a52), 0x030000, 0xff0000 },
>> +		{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x5a54), 0x030000, 0xff0000 },
>> +		{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x5a59), 0x030000, 0xff0000 },
>> +		{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x5a5a), 0x030000, 0xff0000 },
>> +		{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x5a5c), 0x030000, 0xff0000 },
>> +		/* LKF */
>> +		{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x9840), 0x030000, 0xff0000 },
>> +		{ 0 }
> 
> Nitpick, prefer {} over { 0 }.

Ack for both suggestions. Thank you.

Kind regards,
Czarek
