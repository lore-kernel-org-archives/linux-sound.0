Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 325DD2BEC2B
	for <linux-sound@vger.kernel.org>; Wed,  1 Jul 2026 10:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782900518; cv=fail; b=O5A6xa46e41pyCQp/E2t/5KaTA89hAM5I8XTsR4H8dsIW6NLgvFhI6Bo6uzk75wkLal6r2fXPMfQI1TErlJ3GhuaptIsehpl5c6MSLQitvj+Gh1Ra0lO91gXMu6pSMtPkQyzy8uIcg4t6v6J5M8Zy8QkLtWnL6z99NnB9KLbw4M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782900518; c=relaxed/simple;
	bh=usERg42JC9EprxOrtT4rXfYWEUS7UwcMZO5c+qVYrqY=;
	h=Message-ID:Date:Subject:To:References:CC:From:In-Reply-To:
	 Content-Type:MIME-Version; b=QAAg1kqo3UG1R8MZBR8OZuabBZTWdHMg9RddHs+VyOPAawhsAIRO3sqfo7lh+ri497/D/pRBeD7BptL3UtFHXydZdeJzoTjhj/7vS0aySFodJVpJN8cbxeFvZ7vd0d+NImI3g4SwsO1pdolxieyD/rmlyEsAlkLR/IkNt6nqrek=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sbe5Hjwx; arc=fail smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sbe5Hjwx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782900516; x=1814436516;
  h=message-id:date:subject:to:references:cc:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=usERg42JC9EprxOrtT4rXfYWEUS7UwcMZO5c+qVYrqY=;
  b=Sbe5HjwxB6JYKoH2OYIwbPUXXBpYuu38VbzwlWlVD7xaa3yh1MJof/0O
   /710GrwKTGFl1dNtwvvXof4uQWgHxvytS8TxjMpAlk06QEkEtlbSbBvbr
   vskIUYzso0rub7GhpFvAZZzEMWwmkbx+ZvZC4KPLYytkDtgTHNfld0x4Y
   +RG5MYDuw2zgy8AYdskik4TLROqMvJ3J6N3tloko4sUMQbrc/C+NRT+lU
   Vgkqauo1FyV7FfEhWz/KNaDlUkvgLs4pPvY/87AXVjALumDbuizfEZi7O
   oDPLEmhf27eOJ7krfwyhxE43okxLH/kcCktlkwilwpKvjmzGX9nU9bKwX
   w==;
X-CSE-ConnectionGUID: efvQPFzMRFeweNtAtRdXUQ==
X-CSE-MsgGUID: JWwYOKm3RJ21y+aXVzS1Tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11833"; a="83764497"
X-IronPort-AV: E=Sophos;i="6.24,235,1774335600"; 
   d="scan'208";a="83764497"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 03:08:35 -0700
X-CSE-ConnectionGUID: Art4G2pMT0+wpU9+I3nBPg==
X-CSE-MsgGUID: l4iX+7B0QKymczudhBh9rA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,235,1774335600"; 
   d="scan'208";a="257427802"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 03:08:35 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 1 Jul 2026 03:08:34 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 1 Jul 2026 03:08:34 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.30) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 1 Jul 2026 03:08:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IB8ion5AdbgDFvrJdW9wFgz589HSHemCjpe1Rv3t+9buys3wo+4vG3ZoRwcuE2qPmFMNbltjp7GxqlD2ZUoBCpv6RHMutNoqwvfXnMEemFGcLrAnhstN8FPkBnsO85a5888AmwxLIbrZliYHCaA03S16mlRjlpK7V53v5YgvuYTiNbo2nDhkzK8HDcYwzHt4EetkXFcilAo8Ye4gv8SIcv+ufQBmQgd0BemKxlOXTTTA2u5EYsGUEUNExKElT6yw7V2jZBOe3ttRDxgztVEEuoig0i7hC5QtijhLA5jIFTP23UjWgoYz0u42WT7cmRqyTn8ixSdz3w5d6qxTOC3NxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XuvHFW3mXWBL620n6aM+mPmSLg3GtktBU+nfHade+zo=;
 b=f1UK+XyYy/O0INZeDaui1CERUzsQfyECF3x2/Juanzv6Nw+L5I+0qiMhVirugiZW77aREhonz9OAOHPFsCR4ImQ5URpTy9LPnOToCFv8fbrcNhaVItpr1qhEdHhGfe1kL6q8cRle1gCabvVl5kgibwrWmFnVPTNDKP3oTvOCDozzIqpUoGXVcSa0nZTkyDFxawDn/j13APV4gqRZrCl9BkdVRcFnvQCH8Svj7lMSCadMmQ5l3SgxYSkuNkDmOm9zuTzxOoiNRW7bQDt+mDD83UUCu+TBNLIswg9CrMFBK6TztlATmwSN0N27USRexjl8QTSfBiGKKKATPRD/Mel7Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6967.namprd11.prod.outlook.com (2603:10b6:806:2bb::15)
 by IA3PR11MB9327.namprd11.prod.outlook.com (2603:10b6:208:57a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Wed, 1 Jul
 2026 10:08:31 +0000
Received: from SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4]) by SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4%3]) with mapi id 15.21.0159.018; Wed, 1 Jul 2026
 10:08:31 +0000
Message-ID: <8e9229a7-f58c-4f9c-ba26-f4f12d91e279@intel.com>
Date: Wed, 1 Jul 2026 12:08:26 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] ASoC: intel: avs: pcm: use component_name for
 Component name
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: <87fr29esth.wl-kuninori.morimoto.gx@renesas.com>
 <87bjcxessn.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
CC: Bard Liao <yung-chuan.liao@linux.intel.com>, Jaroslav Kysela
	<perex@perex.cz>, Kai Vehmanen <kai.vehmanen@linux.intel.com>, Liam Girdwood
	<lgirdwood@gmail.com>, <linux-sound@vger.kernel.org>, Mark Brown
	<broonie@kernel.org>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Takashi Iwai
	<tiwai@suse.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <87bjcxessn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0042.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::14) To SA1PR11MB6967.namprd11.prod.outlook.com
 (2603:10b6:806:2bb::15)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6967:EE_|IA3PR11MB9327:EE_
X-MS-Office365-Filtering-Correlation-Id: 47c9b54b-ac5e-46da-5c45-08ded758b3fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7416014|23010399003|18002099003|11063799006|4143699003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info: Swp/gtXvSmXJewDSlr1SGvDxAUQHaBuTQ4XH8MG/MVWvMaIoeU0ShWdH06Bi1Mgl1VPw/5WQ9sT5LlYrepQPxAlhTl5NbJ/8evFFqGPd/Gsc3smpOHJb7Pj3KG8VxX+ScW9Hu2ovutTA0P6+XeTvX2g4Cb/QRqHx4QcbEVV46nAHthML+Bv+CMn96v6m+9U2Q/SEejwCTEtXo4KlbXw7Xmwfjy3AnB7Hm9Pskxr/c9kVkwn5ouxtqi16hFDJ53OTWE12DFhsFlvMzBb5dDT+sYAim2k06BxmpLH+sJBU/FDvFQoZm47G6oMfZSbKd5ege/tp2MFLD8xobZSuQhpeKZLXw0uxTLp8EEW1N74bmUxU2GaJyQcNtuSEcgEXkK4qEJXFUif6ZrQZfbnIJ2wVu9EiBVObARY/+2mQkxvLSJ9gMVYfv9IYpCRmfUn6mCi/qMJJrq/hqCUZrxqBkxodySOqKKIJoxHBCr/JnuqPjJY7jT8vHEFLGX43jaHstw/OvQvpOnEP8LEYSoLpj2o+5K7fL4vFnHmMKh3WxuDrkpuARsyzCuytfRdosa2QhIfBeHJWXpNthXghqhKmGp8uTnfcLKSpiyetYj2AZsLhZ8Wqy+tW54XuREq2GpWqpxjoLuqhDtpKUX906DPOd0lRvEV2IIgx+vPkzvlXuvCMvAM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB6967.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(23010399003)(18002099003)(11063799006)(4143699003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UzB3RFJUdVhDL3R3NUlGY3FGcDFCZ1ZsMTFDcVh2WnlwV2pVcEFvT2RlV2FQ?=
 =?utf-8?B?bEZ1bkkxUEw1SVoxR1I5cVVkOE1idDdnMVVYV1haMkwwbDFHWWNhUnpRbkVN?=
 =?utf-8?B?aGJTeGpLY1J5eWdhdUJJNVNDOFE5cDB4TzFzRHlySW5YMEdxRkF1L3ZOMVJu?=
 =?utf-8?B?TkE1NjgvY3lzajVaVHUrejdRR2liM216RFErQXBBT2dPT1EvWjg4cmo3d0ow?=
 =?utf-8?B?N3dSRE1VSEVLZ1JaUlBjWDFVc0hwcEwxMnRFMnZjLzN1TTZqNFdVU2tONTlR?=
 =?utf-8?B?dDRQejU3VllsMFhKcDVGTUU5RW1xSVpUdmgyeDd3RmVWLzUxR1N3S2ErTmxQ?=
 =?utf-8?B?R2xGajVHY2FBU3VDQWtHd3lZbTI0T3JxOGhpZEZzdTRQZmN5ZDZ2RjJWVy9w?=
 =?utf-8?B?M1Q0Y1Y3bHhhY2FHT1FETlY5Ny9SdnlyQ2lNbnN5NnZub2ZPRjA1Znhod1NH?=
 =?utf-8?B?eHhDVGMzaVhReTZzN1ozVjNvR2VJbjhKT1lyRCtqRDBKK0VtYVBtM0NWOXhC?=
 =?utf-8?B?YlhoMzJuNHBaRTU0SEJ1Um9ibzYzd1dWRG1XTVVPcEtvV0poRkRzN3ZiTG5n?=
 =?utf-8?B?d2l0WFoxOENvN3A5MDFvcFRNbjQxMWg1aHd5aWVab2VYcUxpZDY0ZmljbjBT?=
 =?utf-8?B?ZUdYdEovNi9pQU9PZnV2L1ZlMmV2Tm9TaFFXYy81SXl4ckRDUGdtWGpxUERB?=
 =?utf-8?B?UUNyUEtmQWxDMjNPckthRlVhZHpBLzFKRGZJa040YXpyQXVEZnREZHhsMDdV?=
 =?utf-8?B?M2YvUkU2V3RhaDRUR040eDdscjV2c1l3Y042Q21BRkxCUU41V0ZST3ZyT25V?=
 =?utf-8?B?eGxSNVlML0o1L2szQ3JPNlBhcjJOMzdRTnVPWXQ0b21BSkdPSWVmYzlkNm1p?=
 =?utf-8?B?ZitqVS9mVmNydS81YUVkaXAzQjNnZFViZ2hRWkRBZjlaQ3F1cDJITVhTc3lL?=
 =?utf-8?B?Z1ZMWjkxRlRNcVJkcmVzZzNNMW5rd2dBdVJwTitRL2JoNlFUblJIODVhc3Ax?=
 =?utf-8?B?a2Y0MHREdmlldFNnUjBscE9zaVg1WmMwU1NKYlpUYTVMUkEwWHRTeGpma2F2?=
 =?utf-8?B?bjNtUlFybDQvSUhRb0JJMjRjZ1lnUWFhcmVVQ0FwTVBSSG92R1pkekxKRkFJ?=
 =?utf-8?B?WEN6ZWxGWCtkNG40SE1xdW1Vb0dsREJMZi9maCtrVURoalA3V21kR2RNaG5S?=
 =?utf-8?B?cG5pSTRlSTg5MzA3K21TZmxNUUdEaUtGeFhnMWo5THBKR0FzRVh6ckdqSTU4?=
 =?utf-8?B?L3Vab3FjYm5NeUlsZWZZZitKMGw4UHVFR25WMGdlQWhvQ2loM1dQbWRoTnRr?=
 =?utf-8?B?Z0FDRGtLcDg4ZGk0TUFWSVRGU3dBRVNIb1RIMXc3M2RHUmJxbS9tcCtSNUdC?=
 =?utf-8?B?VFVPaGNSYWJQVjF1eVBPQnpLbjd6UlJyVi94RkFScEwvaTFteWt3MDVkWnF5?=
 =?utf-8?B?L2ljRnl5dGV6VUdFdUxuYkpBclRCTHUrczZjdURyMGdUU0hUQnA0U1NQMGY5?=
 =?utf-8?B?WU04ZEZySWhEemhHd2NXbGI1enVOV1BiMWlYSEZpZlRBQmpCbkZXTVlvQ3dk?=
 =?utf-8?B?Y0I2WmRkeGc0WFpPZW5YNUdMOVk5cURFTWUzT082WWF4ekFlVXNRWWMyNFBm?=
 =?utf-8?B?czBvUzR1d0hIUmc1bHRnRURZc2E4d1VYL1pTVTkyV0hiMGhuY3ZHbVFTZ1dF?=
 =?utf-8?B?aEJqK1grTkFiSEp3MVpmbktUelhibjJtZHdUa29CMDBvd29FV2Y3OHBOTnJi?=
 =?utf-8?B?ekJJZlhMcHVIWXhhckpXUHQzN0d0YzRjeDk3K2ZpM012ZGJMOTE4OTBRYWpr?=
 =?utf-8?B?Y3c1aDdMcmQ2UWFNK0pSbGE4V2EwQVR0aTdFMnVmd2M4c09TWlloZDNQS3lZ?=
 =?utf-8?B?bFJnbWtBdHhZUll4RTBZY2xoMkFJaEFNN0dsdEpkWEkwVGZOejU3Y3hzNEtu?=
 =?utf-8?B?UWZ3QVEzck5qNDdRL1hxTlp4TytjUmdSeTQyL2FCUFE0SXdIWXRZWGpVYmRi?=
 =?utf-8?B?TmlpT0t6dkdnbmdlVUc4MU1oNVBvZEs3U1ZkbVRsNm8vLzJtN25qS2JObWt5?=
 =?utf-8?B?OVoyckNNd1E2dGkvNStkVEFGSytoZFRMN1ZBbWYwRVp2Nm9RNE51eFkzRjgz?=
 =?utf-8?B?OGRVNVRhRThGSFQzeUJ0SWtYY3JCd2E3OHJ3ekRIMWlBWHlVV0FHRDU1UEk2?=
 =?utf-8?B?d1pJR1lNRVhTVmpKQzlBNGJobFZmTmdWVmZ2RkxyRFhxUjB2blFlaTZPcGxj?=
 =?utf-8?B?NVN5Wkltc0hiQnJuTW1LYTFRSW9PNG96b2wzRC9KZmJRSGlFcytBYmZpUU9j?=
 =?utf-8?B?SnU5SlhXSjFUbmtLRFhYVFhmblZidm1hUnBqdmZBcStrYTNrNlZDN0lnbm8z?=
 =?utf-8?Q?JbIxgxEkKgPlMpJs=3D?=
X-Exchange-RoutingPolicyChecked: RyYTP1bsPRPfoRRLWhJpobA+tspWSMz3mwVkenhp2OMqiwdQYEJdNm/QKPA1t6Bx66VuSZCmJB5GseEbecTL1XPs6sWBE4A+EtSA8UUWS9SepiMVCwmeYg0wOYSEVQg9fnrb4FrSq0WbZ3UG6d93s41ZjTXXtoGb7TWQWX/KolpdWO87daYkgNn0/7sjNXyiUUt2NVrTpgRe1+0uO//u1yPSRBcHV6w5nRr5VYQUcu45kXIsifBzbkkEDllqCTuUVnEziDLLGSPMmB+OLh3eA+MFYX9dGjg5voaC8ggtZaMgOAoz5qJld53JAYwEo9pcedZpCGSgHym77B8VIiDsoQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 47c9b54b-ac5e-46da-5c45-08ded758b3fb
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6967.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 10:08:31.0744
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A1mgFz+5Dcl/Bz2jpiykmMm2FlBD4DrjjY2Oq2ZPHjQQJsNrQA2VArfvuSAAHOGC+AQcTnGZ13AOegeBKu82DY6vZkqNW75RjnRX9cIPLFE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9327
X-OriginatorOrg: intel.com

On 6/26/2026 8:10 AM, Kuninori Morimoto wrote:
> We can set component->name via component_driver->component_name.
> Use it
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>   sound/soc/intel/avs/pcm.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
> index 797b9c9163b49..1a0b7cd26d9f1 100644
> --- a/sound/soc/intel/avs/pcm.c
> +++ b/sound/soc/intel/avs/pcm.c
> @@ -1393,8 +1393,8 @@ int avs_register_component(struct device *dev, const char *name,
>   	if (!acomp)
>   		return -ENOMEM;
>   
> -	acomp->base.name = devm_kstrdup(dev, name, GFP_KERNEL);
> -	if (!acomp->base.name)
> +	drv->component_name = devm_kstrdup(dev, name, GFP_KERNEL);
> +	if (!drv->component_name)

Unfortunately, things are not that easy.  You're modifying member of a 
staticly-declared component driver.
That's a no.

After taking look at it again, I'm even further away from agreeing to 
the idea:

- components should be populated dynamically as their description may or 
may not differ between instances
- component-drivers can be left static as they describe behavior and the 
behavior operates on (component) pointers

With the proposed changes, instead of assigning memory for the driver 
once (for avs, once per interface type), we are going to do that each 
and every time new component pops up?  1:1 relation between components 
and component-drivers heralds bad design.  Plus a waste of memory.

>   		return -ENOMEM;
>   
>   	INIT_LIST_HEAD(&acomp->node);

