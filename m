Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1716395DAB
	for <linux-sound@vger.kernel.org>; Tue, 24 Feb 2026 15:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771948030; cv=fail; b=gmRVWzaChq7yODJw2++p0Up60wDFeYrhO0FoKNnuS6RgEfOLQn2BOBt+CO9Dl/oeVo+uC5K3zteMMvHDO1TvHsXcOsQRMe+9pVlaj/4qo4v9bX0+2jrvmzV419EZUoxOr7TQwOZffO84XrCXdWCdmbaAzIQRBD4/tlRNfBmunY8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771948030; c=relaxed/simple;
	bh=CweEU06ZjGnaY9tyIRYkZbCTTWLFhORZ6k8QznJBpbY=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Lb4MNIkbXEQLa27mzc7QxlUsbv115w/9Xp8a9dISjtiZ0H8m0uzq9s1C9pTv1xzd+atrlzPX2EtmNvUILemfpBhKLq2oRw1Zdllv05vVTrkUq21k+vQxljNsmfli8Tux8naeFi7SgIAxb6UgyVuxzAP7XHVs21D8m4oeBISyktg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EzHQOyfr; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EzHQOyfr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771948030; x=1803484030;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=CweEU06ZjGnaY9tyIRYkZbCTTWLFhORZ6k8QznJBpbY=;
  b=EzHQOyfrA8YP8EYr2k6FRvmLhvv0mXPDqgooX56WPUJOk1U+usYojQbT
   Kod+yZFVhS36UR2MA+ieJTZWaii2vX2JDQ3NqD6eLwimvPHJL8yVt5JTo
   RPtG6wTaQCGwb5vd0P26qLG4UbkZ2m2pgg6BDg/ma6qomIcVcdOHHxZts
   UcIhjgoPrz33WfHApZGO/iv+Ey9KtiUA/pxK1+D6L55M7qdx03kD2QaPb
   NwYFQnsoor2FETdq8G3gNM5rDTTVzDwUZkJu0DY3i1aUo7P4ZoAnpAPWt
   bmyy/UhhVcLSiYsCkPT2loRw1woPWxAeEzB2aY3cBvtJTrtU7Vk7HbJJL
   A==;
X-CSE-ConnectionGUID: KPn2cuvSQDayof2pP5PmNQ==
X-CSE-MsgGUID: 9iMvfQU0RLClqpTwdvrsjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="84424624"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; 
   d="scan'208";a="84424624"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 07:47:09 -0800
X-CSE-ConnectionGUID: wUBVhHhjQoyRFG6JqV5y3g==
X-CSE-MsgGUID: QjVkaJ8FT6aI/5akSthbEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; 
   d="scan'208";a="246509619"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 07:47:10 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 24 Feb 2026 07:47:08 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 24 Feb 2026 07:47:08 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.17) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 24 Feb 2026 07:47:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HvqZRAlVLXi7H9GQ2BMjmsiFLEHTI/mlsxOZzaZbMbGl1w57Nbl/LfQfMiThnHxx7RfWx4EgxnwRE29Ou9eSbMUYATJgrJdNEFYv8szLExluyQwa6CMyvcOfaR6NkDCaQjN4Q0J0Kua5HOx/xtz3IvcrFF8k0TzitFDmPpVXBAQ8W/MGP1ndiByDdr3C20rCGT2zLUSsJ3CD1qAR1nAC/EFT6hcR+G8oDpYPvd4ydAerxzkethNbFKBtfCV7z2UxLhE/vIXXozEFLxUePrR0+zOhqIapYPKY5XpBpfkEmQjs2Z+LS75TvUNIdWVs8rsPrnIw7wxOmjtuL41cGUuKcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mkVS+DEYgLhAXzcMDiiZxm8ktv6cuvPqHVPHylH5WhE=;
 b=tGBHlJQMGiLEf6Bs2k8LzAT3vWhYl3dl61Gihllm1m0AsaEN5zsAujpXwOE3VQPPhj1MgxIW38ZNdR+mE9j4dkfH/kOW7SlyjrSv5PhF5k1hRWN2TMspCDTPvc9WyB2bmLBb1PW13Gi9kbWMiaT05fAtEDuLslijpDReaGcppzhtYqU+as6lnQ1ffnH+EaiQTH47wYh4f62tCMUQYiom75DSctCsMWL0YwJqe7nzYzmV5cJVETwM0KdHeCR4diP5EPbC/oW+ZV0Vyv4LvOxNpixL7MZAsu00s7nS+i94N+vgyAWwWiOmx1/xY1A4ncqoou1KPSchSawrfMBhFx+I+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8283.namprd11.prod.outlook.com (2603:10b6:806:26c::16)
 by LV1PR11MB8844.namprd11.prod.outlook.com (2603:10b6:408:2b4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Tue, 24 Feb
 2026 15:47:01 +0000
Received: from SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::d18f:6b38:584a:214]) by SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::d18f:6b38:584a:214%4]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 15:47:00 +0000
Message-ID: <8cfa8e20-1b6a-4d8f-8914-e085e839d250@intel.com>
Date: Tue, 24 Feb 2026 16:46:55 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] ALSA: control: Verify put() result when in debug mode
To: Takashi Iwai <tiwai@suse.de>
CC: <tiwai@suse.com>, <broonie@kernel.org>, <perex@perex.cz>,
	<amade@asmblr.net>, <kuninori.morimoto.gx@renesas.com>,
	<linux-sound@vger.kernel.org>
References: <20260223144937.524019-1-cezary.rojewski@intel.com>
 <87o6lexs08.wl-tiwai@suse.de>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <87o6lexs08.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0009.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::6) To SN7PR11MB8283.namprd11.prod.outlook.com
 (2603:10b6:806:26c::16)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8283:EE_|LV1PR11MB8844:EE_
X-MS-Office365-Filtering-Correlation-Id: a49d7e49-735b-44ec-7fdc-08de73bbf309
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VHl4MlZIZG9oMWhZUXFtajRxaG93VnZsOWJ0dzV1MWdNTlZYSlRlbnZUdC85?=
 =?utf-8?B?TzVKekFrTUdxOTVkQzEwMVpXcFd2cjQzOC9MT0I2QkNWOXhaTFltUGFUd2d1?=
 =?utf-8?B?dGdpWDFPVGpZWDFVV3lmZFdtNmlqUEpBMXZlUVBBYk95NVJycWR1b3E5WGhS?=
 =?utf-8?B?SW1LTlZsMDdvdzNhaks3eDdLZnVzbitqbmdla1N6UVh6RDUzYjUyQW11TWJ0?=
 =?utf-8?B?em8vRXRiVnNqTGp0eEdqR1U3aDMvQm0zYTBXZUNGN3JoMXVIcEUrcFRkSDl2?=
 =?utf-8?B?a1dUVDVBNXJ5QXdZeExHM3dyUi9rdnRwZ2VMRnBnOTNqUS8zaGxIcDcrdzRY?=
 =?utf-8?B?b213dUorS2Rzczc2VGEzUU1NZXpqd212YlVLU2d6TGVCKzNTWXJqaWpFbEow?=
 =?utf-8?B?NUtFTncyaXRSbG9pc25JbEFNNERQK3JseVF3bmdQM3BwWGo5cVZkcEJNWHRk?=
 =?utf-8?B?YStVbVdsc3p6Yjd3dlFjRVk2UG8yUmwyRzkvN20vUmh6V0Q5QnRkUGF6ZWlL?=
 =?utf-8?B?LzhmVUR6OXplaS8xQnoyOVJvc21NRDhxc3ZXWFdxNWpkZWZTSjdXNEpNTnJE?=
 =?utf-8?B?QnNUTC83cUhMOUc3ZmZYdUU0RWNENk5tK0doMXRhenIzSE9VUUZSTXdVSGdR?=
 =?utf-8?B?eGMzMEk0T3NMa1gyYmpabjh0ZERQWUQyM0cxYkw2M3dsb2VnUENkMU0zVzVm?=
 =?utf-8?B?cmlDTER3WGJtRk15bDk1TlRLSDBUNzI0azk0NDFNRVg4RCtoN3FrUVFTRXls?=
 =?utf-8?B?TnJoanU3RGswMGUwUDRyUzFsekNKSTE4YnhMTmZoN0V5Tmg3eTZhSm5BOGlE?=
 =?utf-8?B?NCtqSUFObnpMQ3lUWVMxWE1WK2ZWaGpGL3pqVkxDZ3A4Q01QYkZkRHgybHZ6?=
 =?utf-8?B?SGJyM2M0aHpITjAvOU16RkpmRjdWSERiRDRVcXkyQUwwUzl5akNEV1FvcXZo?=
 =?utf-8?B?Q3lLYWFIR3FJMFZwbHBSNDZCOXJNUmZaQy9GdFVJenVtZ0M2WldGWkJMZ1pj?=
 =?utf-8?B?RHVZMnVDQ3JCdkwyUnF2UGpoaXE2c2Z3d0lmSWJoeU4zaTF0SWlnakRsQmNj?=
 =?utf-8?B?YXo4ZFQxKzEva29CbDFBbjF6c1dWUzVVbXAxaElTcndSUWh5a2tFb1F3b01H?=
 =?utf-8?B?cmZWN1F1WEhRd3cxR0JJQVZhV05HalNOUW96dWFMVEgxVTNQQ2REQlZqVUhW?=
 =?utf-8?B?VGt4ZU5PVUhCWUdqS3lDeDFBMm9aVGs3MmtoWUZzWHpNZFRjc1pXRFVldTdx?=
 =?utf-8?B?OCtxYXF2ZU9CVjJYL0V2Tk9SdDNmdlBTUzMrckNUbTB1U09mNGJyNXV2N2I4?=
 =?utf-8?B?aS9ORHY3eU1ZMUVwbHI4MDkxZnYyc1VWanpmUFRWL05WQWJhbTlORnAxcmNB?=
 =?utf-8?B?cWNXVXA0WEUyWVJIV0ZrN241VVQxa2pGcCtsekRTdDJraTVCTjdvVmM2bTVj?=
 =?utf-8?B?MnpyS1Nzd1pCOGRHd2xRV2YyV2EwLzdxei9oVjJZOE9RUXhqQ0p2a21EUVRD?=
 =?utf-8?B?MFNnTm9xYXNuanhIbmJFR0JBYXJKU3l2QjF6QXNoZHRwdmdQR2hGRkMrUEVL?=
 =?utf-8?B?cGRVbldQelUwT3orb25RTnpHTEIxZ2htdkRKaDJoVSs0QzJFOHZ4c2NOMkk0?=
 =?utf-8?B?Q3UwMTY4cHRuaWt6M3RIWlJybG4rU3JhU0pwRXMvVGVrNXREYUYrTUNRcll4?=
 =?utf-8?B?Zm11SHJKNmNvUnlJUk9YTlFhSi9yK1lyREtqZnJmMVBYc25wOFZQRDE0RVoy?=
 =?utf-8?B?N0tBWUk2QzJMSklqWVU1UUcrdHIxY0FnUHZtcFZ5U3E5ZW9ENjJ4MWRqYi9w?=
 =?utf-8?B?RXZsTVlDd3JISS9jNjBiaEl3NlJ5alJ6bEh1bnBOZ1l4UXVNWC92b0VpRTdt?=
 =?utf-8?B?NExMQ1RJU3owUHJFODVRUUZ2UmUvZXpzcEVxMC9KNjRkQXJOQlcvTGZzdFgz?=
 =?utf-8?B?NUdtdUVhLzdSOWFUL0ovZU0zc3hjS1BIQlFCaitUdk5ETHVvSUlJUExWK2RN?=
 =?utf-8?B?QWw1YlBBUzFYbkx4WHhzdTlkL1dvUTBQVDlPUEFhRFVWT0NmUVdqYWpKc1Bi?=
 =?utf-8?B?MWlCNm1ONDVCSk96emJmMnI0QUJWNFQ0T0oyZlFaSTcvM0ZmZjhRK01LWHIz?=
 =?utf-8?Q?h9xo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB8283.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SlplNjlOckNqNFVXRDlEN0dEdHlqaXg5K1hQZ2FWZnVweHRzSnNPb1hOMUJC?=
 =?utf-8?B?L2w3ODJYMi9xaXJTL1J1MDZJZEh4L2l0N0tFSVlOdlN4TVhJcHdQb0ZHdGRY?=
 =?utf-8?B?VTBSTEV2eHpwOVBLcVR2enRIK3N2RVloNWpZSDhza2pnc1VjUjhCS1JiRlRF?=
 =?utf-8?B?S1JXb1VxSDloaE5pMjFRU0hsUTJnTGFGdXRseDZ4SFdLWmVBc2ZaTGlRRzhR?=
 =?utf-8?B?WFFpWkF3L2hIU25rZ2ZaWmtSM3dqdFl0eGs5K290bjRLQy90Z0gzYWlTQnBL?=
 =?utf-8?B?TlBoWm1WVmVpYkdHL2dpdVAveUxwYlh2ZjI3QmFvRERwVDhSUmtRREVDWGpn?=
 =?utf-8?B?czlTcmoweFBIdzlvWjBHd3RnOW5QMmJCN3RVRm5BeWcvL1d3bTU3TG9FTjdZ?=
 =?utf-8?B?WkFZL3BwNzRETGlxcnBoZnZyOUl6K1BGeWJ0RHNTRktxeC82WGJnbmN5WFpz?=
 =?utf-8?B?Y3JRMVR3T2trNFdyYjB6bjFqZEN3YTMwVXhWY01tRUhPb291S3B4dmdpUDVT?=
 =?utf-8?B?QU1nOVA4aWp6czNtSHlzQ1lzTVhjRWlQa1BFT2l3dVFSdjhIdjVRY2ZBKzBq?=
 =?utf-8?B?NVBySFVFZkt3aFAvVDM3YXNkTnpHVkdPLzBYWUt3L0ZHZEEwSnZ4SndBRllX?=
 =?utf-8?B?Y3pMbXNZeVFiMjZra3ZKQVVmbnF3M2FBWWxObDUzTG9LMjZpQmJJYTRxcVpH?=
 =?utf-8?B?ODRIdFBydjF2Q3djeUgvMTlweTV4Y2FqcVNPMU11bjN2V2ZKV1IzNDhEbmZr?=
 =?utf-8?B?VjdCaGc2RlZZVG1KVWlNV3dMa3lvT1h1UXhCZHNBb2xZWkw1K2VoYjZRaTVq?=
 =?utf-8?B?elkrT202UVB6a0RDR2tONXFEdHF6RU5SLzYvdk51ZUYzanpieVRNekE0WXRH?=
 =?utf-8?B?ZU5uQWJ5a0ZOMmYwT2djOFlIY2JPWWhFZlFQVGRodEJHZ1BGdnlRa3hackdl?=
 =?utf-8?B?ZjhmNVJwbDUwWWswSTBqdlZ5V3R0dGFObkdyUHFmbVJsZWhrZ0FMNG8xUEFl?=
 =?utf-8?B?Vy9tMjhmMk40UU1aWmd6TDcrbGlyMENRamZYc2dRVkdCclVsRzZUbTV2eE43?=
 =?utf-8?B?YUFyOEE4QUlYZmtsUEZHVlhSTVA4bVowRnVLb0lEeFJRVTR2ZEhmSWJ6clRX?=
 =?utf-8?B?WERGWU92Y0w1VnpOQTJNYWtQbk9MNnY5V21KdHpFMmJMakprbmVrUDU1WFNa?=
 =?utf-8?B?Lzd4ZnZsNGM1S0ZTN0VGUlNQTmNmejU0aUNSVmFVaTlDbWQ5NnZRcDJ2TkNG?=
 =?utf-8?B?cGk5Y242VWd5enkxQkFCZXdtMnNPSzNIR3VPT0J0eENiRnpuczR3SnVzQ1Ey?=
 =?utf-8?B?YWJCbGhhbjcyYzZ0RCtaQUI4TVlIMU1HM3A0M0xDdDUzUDFyalNTZElQUEh6?=
 =?utf-8?B?L2JIajgwMmx1ZXJqaHlsUFFtTXdyYk5kOWxrQ25ibW1XR1kycVVPNnJDVnBu?=
 =?utf-8?B?cGk2bGZWNGFYVkQxQUNOY0hTVDVFMzN0d2x0ZTk3bFdmbzFIUE5TUlBOdVRn?=
 =?utf-8?B?SkxaODBraHNQNHdsUlN1a0h5VmdjYzQzUERTeXpWYTF6UU83bjE4SE9YUURB?=
 =?utf-8?B?NGNpbUVOUU0wUDUyc2twb3VyN2dOVXIzem02cXlPZXNPdUNoSEFHWmNwajVs?=
 =?utf-8?B?aDhQd3R5RS9xSjcwMW5iYmUvWDZrSUk4VlJxY0tla2VIV1h0WXA1T0lKWUI5?=
 =?utf-8?B?VTNhb3dUci9aNDVDdEhLQlNtR1UzeUNSVnZobmJTakE3dGFEbVdicXdTS2RV?=
 =?utf-8?B?SGxzRnpSMGRJQVJheVNFanU2NUl0bFlFa20zT0VwVUJLVTJ1WlBZa3dUVktq?=
 =?utf-8?B?bldPY0l0TnZ1QUliUUxXbU9ZRkV1ZjNvZXBBRDQ2ZVZXbHNxM2VWMFdIclQ1?=
 =?utf-8?B?am1yTDRkeE5HUEFIL25nZm9maklmMElPNzFuSmhuenhmSkVpc3lHQ0lIZ1ph?=
 =?utf-8?B?d3RzOGxFSVpEcDFzb2tWR0JVRUcvYlhKQWI3YTdZdDhYa01IcEZ0SFUrb1M1?=
 =?utf-8?B?SGR6K3pNYk14S09NYnl4Tm0yc0JBSDVYMUlqSGZ6OXMwNWdOZGFIc3dZSXhI?=
 =?utf-8?B?enB2L2Y5OE9DOWZ5NnpYQzRZVlVVckNUSkROdC84QVZjRGhVNndKVjFSdVlx?=
 =?utf-8?B?YnRBWVpndzk2QWhJTGpkSW1raFdMQ2xHZUxqbXJBdkdac08xVEozaG0xYjJY?=
 =?utf-8?B?cndNSSt2d0ptRnZ1R08xV1dLRjJqNnNNNUovY2pLV2dKR3BRM01pem50RmFm?=
 =?utf-8?B?U3dZcXVkQ1Job0E4QUIzR0N5TnNmM29QYkVPMjAvUitCR25CR1BLSUpVR3VB?=
 =?utf-8?B?Y2xicXByRlhPdWI2ZDlPeVp1Z2NXM1Y5eWdteHJjbHRUbFZyQkxxQ2pRbzlj?=
 =?utf-8?Q?WDtRp0pArRJEE2Kk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a49d7e49-735b-44ec-7fdc-08de73bbf309
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8283.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 15:47:00.8839
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ppDpnu9RWmiOL85Srzg532qMwQ2a4hLd07I4UEySZNa4p19yjbfyMUSQ3o127srB+UgN1xLuvbsg7aUmRRDKW6lMOok6prB1Qo9EP82xUgo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR11MB8844
X-OriginatorOrg: intel.com

On 2026-02-24 1:09 PM, Takashi Iwai wrote:
> On Mon, 23 Feb 2026 15:49:37 +0100,
> Cezary Rojewski wrote:

...

>> --- a/sound/core/init.c
>> +++ b/sound/core/init.c
> (snip)
>> @@ -537,6 +542,9 @@ void snd_card_disconnect(struct snd_card *card)
>>   		synchronize_irq(card->sync_irq);
>>   
>>   	snd_info_card_disconnect(card);
>> +#ifdef CONFIG_SND_CTL_DEBUG
>> +	kfree(card->value_buf);
>> +#endif
>>   #ifdef CONFIG_SND_DEBUG
>>   	debugfs_remove(card->debugfs_root);
>>   	card->debugfs_root = NULL;
> 
> IMO, it's better to be put in snd_card_do_free() which is the place to
> release the actual resources.

No problem, a question though - I've written the above to be cohesive as 
CONFIG_SND_DEBUG-part isn't part of snd_card_do_free() and what I'm 
adding is definitely also of debug-related capability. IIRC 
debugfs_remove() may invoke kfree() operations. Why isn't it part of 
snd_card_do_free() too?


Kind regards,
Czarek
