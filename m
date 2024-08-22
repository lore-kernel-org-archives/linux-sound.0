Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 898F917D377
	for <linux-sound@vger.kernel.org>; Thu, 22 Aug 2024 09:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724320057; cv=fail; b=Yr0kvHQSLd6my+PwJmVh6jGs7WWQkVrK9pZzVHxPpz4SkbcO86vUdGHWZBHvDfWXX8MN7RVe7YErWVugk0u0AWhB3q6knaG9ooBfpzCC49T1X9PtX1slbNlkByD17tiTyjw0EeUSvlTINclQDbY7d7O9UivRhAEQW0BzxkGsQrY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724320057; c=relaxed/simple;
	bh=QuvsaML4Km2fYy1uieofxMeeT/jzCo+fSdZyatboD3g=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Aw0CQUcCPnxR+nMTV2A3gd2f8incTR9STTpP4uyRR9IppM8WmfYnbOdWL84mlZZqOAfTQyvl0XiuIR2TdpWD2+Zt0Avmbm7/PI0nc/G2unvfDa6DKKWmhcDPptaT6xG/DCfhQ8qc4DLyZqQJaYsMRNOJOFTjbBd8dIM9SgANBs8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EnVU3ufO; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EnVU3ufO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724320055; x=1755856055;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=QuvsaML4Km2fYy1uieofxMeeT/jzCo+fSdZyatboD3g=;
  b=EnVU3ufOHm8dm9qgkel0EYLx3KT2150mPMTuKnB6kfPcRDJRnsAsZaeY
   aSq5boRDGWHrwDmV6LhsseJRvmcZh0c/5oyemumKDtVHqeJ6Tc//KIEHE
   gE6RegOw3sUp/QlKlprPR4rjO24jQUWqkMIe3kCYUUuIrfqMhKslAwYwC
   0HZRC87ooD3QTGVS/uQb40HOEDs5Isx9V0XfOV0baR2q+6Sn20yuepKFx
   WB++xGg2PH5ZPTjI+wagfRRqcd21KFsusNdxD30m8OnZn2ArH3TuMCaXq
   m5nx5nyx5skeIX2gzj0BTD4r2nF02F334BZYbIli7imeou0je41543Gls
   w==;
X-CSE-ConnectionGUID: IhPDM1/mRuukgiL85BGmsg==
X-CSE-MsgGUID: GpC9t8Q4RdWO4AazS1HI1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="33388605"
X-IronPort-AV: E=Sophos;i="6.10,166,1719903600"; 
   d="scan'208";a="33388605"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 02:47:30 -0700
X-CSE-ConnectionGUID: YSsrEx7TQBSohfemss7duA==
X-CSE-MsgGUID: 4s+XkPxvSfCeszaYxJ4pqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,166,1719903600"; 
   d="scan'208";a="66077163"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 22 Aug 2024 02:47:30 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 22 Aug 2024 02:47:29 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 22 Aug 2024 02:47:29 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.44) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 22 Aug 2024 02:47:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EJgGhxUanKdzx8JOkvhTgz3KT8Q4bBCO0agNFjGHPNgElPAXeCU0V0KSf1MH3XZctqGl851he5bAs+r8giiebFnjp194RV/gBSP96gNhai37QIUIpuY8Z9Z1SoXE1G1wuNfNqPqcY1ZfHk5oSTzBnFDXjhGaoXqdytrP4CPYbzOfuzzA91s8pO6wbvbE8uoPMwOIVTRTwOLS/WZj5oSsCHcKtGcgI9y+1raQ3XOjzqdLI5peR4/Flz5jEYxOz5MMW2l03AtrFoKVGYZJzBY8Z15AkGMv7d2k6yeZaZtvMEPsZjaQc8oR6VdikJNHVVxhg8g1GxJUl7rRmuXJIFgz+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JWN9CuSi14/ef/3wT7ImVhXDygq9eF+KevZOaT155T8=;
 b=bp2jPl6L87866QeY/iGE5H+MwjAisRoVxr+8AGc14MmG+5Lk0EtAKOC2n1IBUbmPtQJc4XENZCtOK9gH3SxJ1fWztF0DE/YK+0MdH33PY/maLlVgHSGBIozEPcT4RR/Z3Dq9bdBthhqjoC39krE9nTxI06hFXrfswRwESPOowd8slD72nHMtZ2UEcgyzPUvMnreqB1yYUKebXyy8fUOvCNg/rfCtoHIxHKrHAJ5ou+C+tRrlnGEZZW51V1oUnXwMF9G2iZiVu/+gfT4W2KD7pHDhVHsoqdTMVc60V/O24SPijDvA24M+KzpFdR84KAQ/GLaVrN85GVYv+IwE3srLKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 DS0PR11MB8083.namprd11.prod.outlook.com (2603:10b6:8:15e::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7897.19; Thu, 22 Aug 2024 09:47:28 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cd01:59f6:b0f8:c832]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cd01:59f6:b0f8:c832%7]) with mapi id 15.20.7875.019; Thu, 22 Aug 2024
 09:47:27 +0000
Message-ID: <46e1485d-108d-4efa-bead-061262eb43df@intel.com>
Date: Thu, 22 Aug 2024 11:47:22 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] [RFC] ASoC: Conditional PCM support
To: Jaroslav Kysela <perex@perex.cz>, <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
	<tiwai@suse.com>, <amadeuszx.slawinski@linux.intel.com>,
	<pierre-louis.bossart@linux.intel.com>, <hdegoede@redhat.com>
References: <20240821101816.1494541-1-cezary.rojewski@intel.com>
 <bfa97823-d638-41aa-b972-0efd00a6091a@perex.cz>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <bfa97823-d638-41aa-b972-0efd00a6091a@perex.cz>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE0P281CA0001.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:a::11) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|DS0PR11MB8083:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a5ed194-8679-403c-c7ff-08dcc28f6eee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dEUyV3lNUUFtbmRMQVlkT0FuMmdEdm4xRDd2bm1Ta2graVA1Q1dxSGJ2WlJs?=
 =?utf-8?B?Si9SdVFwS0VOSEc2MGVJSWR1Y1I2MFgzbXM2MTBWMWw3VVJLQ0ZxeWhFSWpl?=
 =?utf-8?B?OVdtNlo0M2xyb0JSTEVrdVBxWGNORzZkOU1reXlkSmhqcDBVQjRVWkJVczRB?=
 =?utf-8?B?b3NBWXpCZ1l1bHl1c0ZZZ3k3U3lyYktubHIrcWNBSWZJTUI1NkxkWW5RYXU3?=
 =?utf-8?B?alYzcUhVRWNadzMzSnpTUFcrek1BVkFpMDZsOWcrZkhvT2JURFNaaHgwcEVr?=
 =?utf-8?B?SnFrazZyaWY1NEs2WldCTTFkSHpSY2RTSklUeHNPeGVlY0ZvMmlsOGhxNHd5?=
 =?utf-8?B?L3BHUTRGaVB4VS8vZDlyUUR0bVp4N09zSktIRlBjdWlNS2dqbFBXVGtWdlJP?=
 =?utf-8?B?MHNxczlRUEw1SDVpV2RLSzBSQjVTbUxKclJqbzFlbU45YUN3ZHB2bkxuLzdC?=
 =?utf-8?B?VUN4NjN4eHNBc1lSZDNLcmVnK05Sa2VxYU1NK1ljdkNKRDRPS2xDMTE5Mjg5?=
 =?utf-8?B?Z240NUJxOXlwcjJRZjFaaXN0YkdHWGJIS3lrZlduYjdXWjYyQTVSMUFjVUoz?=
 =?utf-8?B?dnRmcytMM2V2QlRjTStRR0NyRkN1NCtvblNHWFpTVGYzc1l3QTdNWnMvN1B4?=
 =?utf-8?B?aU50ZXNSWVE2VUQ0S0hmcTJPYzg4K0Y5VlNBMVNHY3NMYUpMS0lBNlJQY0NU?=
 =?utf-8?B?TjYwVEZLdi9hbGpYM3BuNzVNRmxWQjNPN0NXeTVzTFNqRGQvSHpsMDZ2VzJv?=
 =?utf-8?B?ZzBlYTJYeEp2TGlSdFNPZjFxd3EwbDAzdmUxVFppVzFseXkzM3ZvaVJ1ajB1?=
 =?utf-8?B?aGViaEJBUHRDR0JjS1FYaDFsb0VXYkgxNGhzOVJRTmkyQmREVFROOFUyT0lI?=
 =?utf-8?B?RVNQZHRTbnFpSS9OV2VETDdsbStQZXl2YUluRGRyVmpqSFd0ZmorVllicXI3?=
 =?utf-8?B?ckc3bDlHcDJpN0JxejFWWklOSS93UzlJKzBydjl3Z3NkYmpEYXU4TFB3cElW?=
 =?utf-8?B?KzJlaG5jcTJkZ3BCc0FRYmV0cHNjdm1DQVcvdGxLMjJnTWtIQVRta0JvYXpE?=
 =?utf-8?B?UzlvclpUZ09UUXpkV2pjQTNodjRlenFUK3JwaExVVDVDODBUT0dQMEMyQS9t?=
 =?utf-8?B?NVZlSXNtZ1czZGRCb2IxS3JCOHVsazhGS01NOWt3a0hIN05WaGlYeFVOemVO?=
 =?utf-8?B?MjN6WG1ZQVlSZnV2V3VRRFBJNDFrREp2MzlZTDN2QlVUTmFrdi82S1pjVU5t?=
 =?utf-8?B?dTVoRHdyYkNqS1I2Q2FwWlRpckhqYjZlME4wMERrR1gzWFNkNkR5T0U2ZjFm?=
 =?utf-8?B?RG96ZGtuaDN3WmVuUlFVMGZrKzJUdy9BOVJ2aC9uYUlZbkE2Tm5oWG52OWVZ?=
 =?utf-8?B?b0VKMHB6Vi9md1FiVm9WcVRqLzNBNFZTTjMwSlJEZTFDdFpld1VuSXl4Y3cw?=
 =?utf-8?B?cU9kOG5nQjlSZ3VSRXRTRkQrQ2p2b1o0Tnk1RXRrN29wbjAzNDR3NU9LR2V3?=
 =?utf-8?B?QlZoWXlKcktRUTJCdEJrbExaMkJCd3I3WXlkb1lDZ3A0eHF6VU1ReUk2QXJY?=
 =?utf-8?B?YlZRdVJLSXRJaXk4d25ZQmlBV3hsM3RtWVFhT2V3OVFpTkVMZm1kM0Nscmk3?=
 =?utf-8?B?SFkreDJlL3VSYTVuaDhaMFpXVFRLR0VKK3JNOEt0RjJGY051U2kwYXB6K0V6?=
 =?utf-8?B?U29VVFNZK2Y5bzFBK3FsaVZDZkZMODE0KzRNc2xrdm1nQzVwTzh2TFJQRExC?=
 =?utf-8?B?eE5BazNLLzhLV2ZBU3FMYVRJcElaYWRSSXRqd0hhRXZzZVRDVEp1UVJCS1d1?=
 =?utf-8?B?MTF3cndmMHFXNXYzbW9Vdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6375.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bEZSamorZUMvQ0RYODhTNlJRVGxyRHBseWtKTXJKMXNYaVc4aWNFd3Y3RXVR?=
 =?utf-8?B?dGo5NEtreFc3SUM1eFl0Y0x1M0xFaUN0YWxPdXVPR3pZR3ZLVVNBcitQd2Nr?=
 =?utf-8?B?dG5DaTZqUDZ5YjZGZmsxQ2dPNzJqZlluRHNrZEZLUmszanZadTZwMEExdzln?=
 =?utf-8?B?VWp6b2xYME9SQU5xRXlna3gyRE5OQzNQWDg2bVEvRFhuV0R1RHRqRXFCSGdi?=
 =?utf-8?B?VThXRER3TzdsNU9zZFEzK0xBaENaZVAxdGpIT29rZEwzOHBWNEJRdEt0UmZR?=
 =?utf-8?B?WUcvNlhVRnY2REJOWnl2bDVJMW45RW5pMzJVQitRZm1oRzErTGJVZzBOTTdm?=
 =?utf-8?B?dlRLZWVydWt1SkJFanN0TzE1T01TOWdEK2NjRmtHUUNReFNabDZ3TUd1MnAv?=
 =?utf-8?B?VVBjcXliWWFZdmlRbHBpT01PcUN3ZWd4YmwwQzZxNVp5Tk1mdlFtYWJyMnhG?=
 =?utf-8?B?OFdHSmRSZytLN0MyNDBBWGdsT0NsaDhkRkJzRUVQeDA0UjNwR1lDVVpGWWhp?=
 =?utf-8?B?YXgrKzZJN05RT3VoMkhrVi9MN3UvZmZ4eU4zKzZGR1RCbGZoZ0I2dG5VUWox?=
 =?utf-8?B?endDNmFuaEsxT0xpTTF3Uk9Cb0dxR0ZDQU52WEpvZ2FKeWNndDhPdWZaNlp6?=
 =?utf-8?B?RktFcU92YS9STmdWMXl4SVQ0QThoSXA2eEhJZWNUWmxtckJ4dk8rSitRZTFk?=
 =?utf-8?B?blJvc1JnSUZZbEVzYVFUZGtzTk5LTWdFa3ArUGNSRGZNc3V0NU93Y21tTGtM?=
 =?utf-8?B?T2pxcURZQ1JoaGpGdTlvOWlSdDhXQlJmVTd0WFVrSVNjWkNBdVpnVjZlNjV1?=
 =?utf-8?B?TUFHYXNKRWcwdERObng2R2lzSjZ6UmEyVFQvaDMzc0NodlRSQ1pheUdQRlMr?=
 =?utf-8?B?L2lET2dYTlkyUEloeVFLNHQrVlhwZmJ5aDdEMHo0aVUydjRuQ0QwNDhKdHNj?=
 =?utf-8?B?SmpaRytyMG8yaTRZcnNrZk5HSUg4UFVENnNZbVRjZEhDdGZsUHdwUkpWTDl4?=
 =?utf-8?B?Y05sNlFzcTg2SlZmK1hBUXlhNG4vb1NSQUxadXIzVHlybVRRQzRtYVBwSWJU?=
 =?utf-8?B?WElJcUlCbnNDUTVmcFVGZ01CWExJUFpsVnZMSHhjVlhtaERWQ2lzandGQlNv?=
 =?utf-8?B?QXpobkxvZkx5dG9lb1NCcVcrL2NwVGR3a3NKc2QvZEF3UTJqeThWd2d3WHRi?=
 =?utf-8?B?VnNLdDNLV1haV1d4ajY1YUVEZ2JiaW56UHlOcGxPR2xlREEyRXRxQVFWWEk5?=
 =?utf-8?B?YVhrVE5yUkxMUWYvbSt4Qm9tQlNyeWpRUjJjOFByT1JPUWFmNnZCUUkvc3RT?=
 =?utf-8?B?V2plQ0Q5NW4wMVpjV29GZkhnN0tteERSWGtTSzdYbnhoQkVEbHMwK2NiTi9s?=
 =?utf-8?B?VktnVTNySVBtNnprdDEzVlc4WW1Jcngvc1V4alkrODg4YlRadG11YUp4M05k?=
 =?utf-8?B?aGRhNktJUDUvbmkweWVPdzlUMXh1T2xqYVdUK3RjQ3ZoOERweStVNEdHRE5B?=
 =?utf-8?B?UzI1aEpmczQ5dXQrTjJUWHpCN3ozTjdldEc0eWZmQnM0SDhCYlZubEVYSWs5?=
 =?utf-8?B?WkdWbVlFRk94aCtuL2hQMjhDM3dXR1hiZ3RwNllXODBYQXdjOVorRHNoZi90?=
 =?utf-8?B?UjRuM0drcU9pQWJuODhxWlNPYmxPZ1VnT1ZxbE1xQ0ZMMWw2YUFhVW1KT0M2?=
 =?utf-8?B?TUdOcnlEMW9pRFhJb09VUk9jUlBqSjYxYkUrM2tZbCtlVDRDTC9rUkRPM2VP?=
 =?utf-8?B?TXhXbkM5b0FJdU1HMXBqMFZiaEJxRUtSWTI0bHJPK0cxTlJ0NEZqaWJSUHk0?=
 =?utf-8?B?SThUVEgwK3JVSTN6b3hHTk1BdllwRWQ5azBXTW9iNytYNW51VEszYjdGWGN4?=
 =?utf-8?B?cVI4K1c5WEtXMmlhVDd0VGdQa3laUVFydmtQRHB6ekFmcUJHalpBOEczRjk4?=
 =?utf-8?B?aTBod0d4US9YUldGVHFsdVhrWWl6U085TVZEb1RYcVo4eDVveWtqYW9FSTkx?=
 =?utf-8?B?RGtEZ0owK3pBZzZvNDdiQkZod01FeGkyT2ZuRnUwMThqUlpmSVoyOWlWdXNG?=
 =?utf-8?B?RTBwNnd0Nld1enhvTnprSHRFTi9vNWJYL0tlVjlscE9sUVhiYzdvcStydjdh?=
 =?utf-8?B?b2ttUEpnUDVNZ3lPUmlKV0tWNmk1SUF4TytsLzY5M2JFNXhPV0tINGh5MC9U?=
 =?utf-8?B?TFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a5ed194-8679-403c-c7ff-08dcc28f6eee
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 09:47:27.9173
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: saI/PE8RufwOY89cwsptSsjfG7sKCB+W3LNknZFn4SunPpn3R9s/hAOiuDf61AOVoBbuMkQr+PCjnI+d7Kpw1AQarkFmtY2Wlma/gOfFy7U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8083
X-OriginatorOrg: intel.com



On 2024-08-21 1:35 PM, Jaroslav Kysela wrote:
> On 21. 08. 24 12:18, Cezary Rojewski wrote:
>> Conditional PCM (condpcm) helps facilitate modern audio usecases such as
>> Echo Cancellations and Noise Reduction. These are not invoked by the
>> means of userspace application opening an endpoint (FrontEnd) but are a
>> "side effect" of selected PCMs running simultaneously e.g.: if both
>> Speaker (source) and Microphone Array (sink) are running, reference
>> data from the Speaker and take it into account when processing capture
>> for better voice command detection ratio.
>>
>> Which PCMs are needed for given conditional PCM to be spawned is
>> determinated by the driver when registering the condpcm.
> 
> Perhaps the naming may be changed to "sidepcm" or "monitorpcm"/"monpcm". 
> It looks better in my eyes.

I agree, "sidepcm" is a better candidate than what's currently present. 
In fact, phrase "side-band interface" is common in hardware environment 
and should work just fine here too.

Czarek
