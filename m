Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 797AE3DF015
	for <linux-sound@vger.kernel.org>; Fri, 26 Jun 2026 08:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782463781; cv=fail; b=RR4RQqo0D9ZYLLL0JshvOc/ts3pg9CP7wh9q8PBiUn9dSG/PyGYIgELWkmcfq6wi1dekY5JvJ7U4aTwanse5eO039Owq3W39wNE8M8MEDdgmCk2iIpuP19OmW/6m6PgmZuP4fHIPkxiFqK6lYmDvZR3GMcG4F3Y7Cd2woyv1rXg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782463781; c=relaxed/simple;
	bh=SlKrxpTUVEIbpN06wcqsJry0MFdnif98O79zYn2Lt0U=;
	h=Message-ID:Date:Subject:To:References:CC:From:In-Reply-To:
	 Content-Type:MIME-Version; b=pmr8pQ2az8MzXdTf2hUq1JDWoJ2aRql9LiNAOBcQYF5tJezCx4nTyeavHRP4KWd/brSGZGgJvnZ4U6sYQdPR5hw0uNVn1Hc4h+QbATQQFN2jD/NdwLK/rSXlGinRFTAy14zA0TQfI3+r24HaxxFV1cQBQty0mW8OW1JABvsVnEE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dhwF9QmE; arc=fail smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dhwF9QmE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782463780; x=1813999780;
  h=message-id:date:subject:to:references:cc:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=SlKrxpTUVEIbpN06wcqsJry0MFdnif98O79zYn2Lt0U=;
  b=dhwF9QmEHqIF21lEdoTwe/QZdL5QKVHFlqFsdAe7JXK12gIlMVj7bQqT
   9xnaXba7Wzch+E2b2MRywUvYTCP1ihGTdCfyH0vpyXFrGe9NdLPb+8WE1
   hxRh+NtnUcyUyfiorcN1VGw5eoGVk4HGSb67TsSdJKmwSoHcsRZHvkp2S
   /o9I4fWw0CGqqE+vg95og1KOsx7ZdV9wYZ7jRZTfJB8t8UkqWyTKgVnLq
   7MmoBGVqLzOu3b4HHMDs5pjpScH1POXTDc2M/D7TufgGWkg014sHnZDix
   ssgxkoprW73oauLUaeETmn7gF6gXOGeci80ozSch2iTxxuu8Ln/elkS3M
   Q==;
X-CSE-ConnectionGUID: ivUvmfEkTK6mBUPU08Pflw==
X-CSE-MsgGUID: DKcUeWc7SmmUU92SYQsGKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11828"; a="100688084"
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; 
   d="scan'208";a="100688084"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2026 01:49:39 -0700
X-CSE-ConnectionGUID: qwEc1qoCT+Cwt3L4bTW0BQ==
X-CSE-MsgGUID: Akt6d5VISMexEDa/UJ59TA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; 
   d="scan'208";a="249621437"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2026 01:49:39 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 26 Jun 2026 01:49:38 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 26 Jun 2026 01:49:38 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.51) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 26 Jun 2026 01:49:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QKnplLkafz5Sd7E8rhg3aTw9eiU8eAlLoXjkj4Fw5L6kAuq0NO37t7HWnY+CdsQ3b1V7HMMknRoKZfle7VoaA4IHpzcYZ468AdCelQDMOOPU+926DuCIt1dlKLn2N+LPaxfY6sg9KO1/qU7beSBgNiHAEJ++MuK8sDKtQDFzQOZtuWTHI02g80Gy7c3+lmz8tJDiG9UGQqBOgo0EiJGv/cFK6XxYeFLnmrXN9rwPP8KxmQpFEZtNtUnw6Y0Yn6FOwMAMW4WXFTsu3ODaMf1ytOpDTshXCThjPi9SRxtMtZdzJY2KSRvHpZap5Uw6MZowa7tUBxdD9kKL6EhB5tTdEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M1Zvd+FWTgu3WTc7AEdDnHjGUOewmGe5mhcJSD/yOhc=;
 b=xfsuF7mVBpR4fRlIDajZrlyTU0I9CXJrdlzirdIi57IOkVtUShw1unMyOx20b89wVe8axr6JQLGdOOXfgBpNG7Nm42Et8L5ctddLQSVopgzu6E33O3YD6CkidASeHqNN0uHslIpD5u9coQNu8INX/6vw5Y+aSByf0F/koKseh4Yqr+BqtUNR5/PnMJZbX/474OI4Rqs7Gfiff39BAKjtOR14AoKIlHLhIgJ/6kxpoVFNfH+r1Gxr/tQ8ChwRzlrOlcWZiHtNcRIGmokJNvogFNwPtyys2diGBu8qETNVcjtqndugiwKk2ioU9KTnPsnVnhH8blFOztq5VVRvPS+feg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6967.namprd11.prod.outlook.com (2603:10b6:806:2bb::15)
 by PHXPR11MB9685.namprd11.prod.outlook.com (2603:10b6:510:3ca::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.19; Fri, 26 Jun
 2026 08:49:35 +0000
Received: from SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4]) by SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4%3]) with mapi id 15.21.0159.015; Fri, 26 Jun 2026
 08:49:35 +0000
Message-ID: <d5e3fc22-8a17-4672-ba5f-167d8cab2aa8@intel.com>
Date: Fri, 26 Jun 2026 10:49:28 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] ASoC: intel: use component_name for Component name
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: <87fr29esth.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
CC: Bard Liao <yung-chuan.liao@linux.intel.com>, Jaroslav Kysela
	<perex@perex.cz>, Kai Vehmanen <kai.vehmanen@linux.intel.com>, Liam Girdwood
	<lgirdwood@gmail.com>, <linux-sound@vger.kernel.org>, Mark Brown
	<broonie@kernel.org>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Takashi Iwai
	<tiwai@suse.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <87fr29esth.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIZP296CA0015.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:2a8::10) To SA1PR11MB6967.namprd11.prod.outlook.com
 (2603:10b6:806:2bb::15)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6967:EE_|PHXPR11MB9685:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ca6da23-4ef0-40c9-5020-08ded35fd936
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|1800799024|7416014|376014|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: w+/oUMTdQkQBEtiSRe+MqC0m9tKDeHWPFxmUljyraJfprd3jV7cfmqqV5Fpk/2GggJbnRt89fEseU6wAtrBFeG1S/nMedMBhDztyqN4PjlNinKgwdyJLcMWNmNT/+saHI8GJ7yD1T5Yokz/9at35wKVZT7WzzQJliEyvCdAD2UmrmGpVQC78lZGsYCm6ENejqUv5DqVOSh0xJupxc/X8MXtk26sDnTYniImp3lQlTE5UnG93TyZrXHPt+dIWzP7B3FWo03BKLXYTrxj3ggZOEpd/HsctG0ILmnQzLMCZr2KLWJkwwnv11ow/cKJyaLE+3HHSbPJTlIJQnt8Z/4cHusScwIy+9FROplEGoUJjse/ghd6hVkxdjeIXVWfV89CEnuIjTfFScdeOc+SIO83E4JIKoibhKV9YN7+w6O/xjVVJst4K7JAlNJy41k0OKYBCCiaCsc/Cut5BHMNb01B//B9/Cw/GbFZjKxmyB1mSQd5TZ5B+EEmocOY83NSAy05olREWTaOAyxNQtWF3nlRCQWl8saWaJj2loffZV8Y6WopYCZ23GgKESpfN9nfVrApWrNlYBAYcQJ/UURybLvo1y2XreBK5ROSOtI1kppxJNehgaYZMAosmiCTUHPuf7Y1uqHX4u8lFdxkclfXOKO6MW9AFnYA3Nwii+tcqwbTX7TI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB6967.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(7416014)(376014)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VjQvWVVwWVhtdW9sVFBwemxNTmwzMndFUi8xYVlwdm1UZ2pXTXVhdUNoR1d6?=
 =?utf-8?B?ZUVyeU9kQUVDVUFTU3Z5V2hWb1BXYmMzT2w0TjcwWFRKN0ZtUHYzeiszZTQ5?=
 =?utf-8?B?ZER4dlNiMHNnQVZMME5YY0hLM20yTlZmMVJmeWFlUVJFeTRZTURkL0p4V284?=
 =?utf-8?B?Tzc2cUJvSHFac2N0Tm1iVXVPT0dVMlBSOFhZeWxpdWlJV0JzY2pQWERuTWNk?=
 =?utf-8?B?dEpxSExUdU9iRFZvYVhwVndOd1ZuSWZmZkF5TXJnYXJpUDdNTzhhMDVFYlYy?=
 =?utf-8?B?bm9JR2RSWVVPazdIMnhBSkZtS1VGbllGWmU5VXpzZXF1VDB0MFpZQzJGZzRP?=
 =?utf-8?B?LzJXQkhsM1ViK3VIRXU5VERyOGFwS3R2d0pJYnlqcnpLM2lBcXJZMHN0SVVO?=
 =?utf-8?B?N2g5WlhNZjNYRCtMQTBKOFZKaHJqY083emF3cVFQYkRpK3V4d2dPODJKQU9J?=
 =?utf-8?B?VXBFamRsSWcrSWMvRWMzTmk3Wm8rcXEzMGR1K0tKZzZyRTI2SW5jRzBzOTRi?=
 =?utf-8?B?eldkdHYxR1RTWllHQ1k2eHFqV2pzL3l5MmUyd1hIMUp0MWhuL0w3dTJ0TS9B?=
 =?utf-8?B?dXFGaEhQaHgvT0Y1NXozVFovbUVrL0QybW56aUVxMVJULzEvWkw1eDd4UVBi?=
 =?utf-8?B?ZXp5blpMTWVuWEJ4U3lqd3VHN3FJUmd3eER0NkZObUsxbjlobldtaXVMTm5P?=
 =?utf-8?B?VkxuYk8ybnllckRhRTdncnpILzhxbzVrNjArNklZRzF5dWZRWGtNQ3JWSDI5?=
 =?utf-8?B?K05kWnh6SThIWnRoeERoZm1lcFNqNWVxRHJML29ERVZRaXdyOWt6QW92VWdU?=
 =?utf-8?B?aUV6b0dNQW9kb08rMDIzQ1ZNUU5SQ1hhSXhvd2ZyUGE4bU1iaUprc0hhRXJX?=
 =?utf-8?B?ZUgySFJzKzFyWit4MG9UM3JqNFMyR1owZTFMUCtJbmpsZGdIVUY5TmlDRnN1?=
 =?utf-8?B?OGRLTUFCK2lOaUNXa2Vnd2J1VkVaOFBodzdibEt6QmNFRXBBdzBQZXltRWwv?=
 =?utf-8?B?Yy9GZFJMRk5mMndhVG9XbnlJa1k1TWhENGdUNTVoTVdySlloLzhIK0JnRllH?=
 =?utf-8?B?SFY0ZzVTTWt4TG56dENNbGFsZWp6OXBSd1lIZUpKdGxTendsZ0tzcDlOaFVy?=
 =?utf-8?B?RW5iSFhnNTB5Q1dUQ3p0d3FKYWp1Y2FWTTAxUEg2ZUdQZWs2REdTSmdJNUdm?=
 =?utf-8?B?eWRyeUFQRnRWb1JkS3F4U2JRTTBZdnNDTHBnN25PZ0U0T3FabXdqVnBXL2Vt?=
 =?utf-8?B?eDZqajJ3aFNFMFNxZW1ZU24rOFRWQ0J0MGQ4ZElueVorUjlraWNKODBFWktL?=
 =?utf-8?B?MTYrNEozK0RrZXltaTZ6MFhFVHUzSGdXb0hvcmJIWHQ0eUp3cEJYYWZtT2Jv?=
 =?utf-8?B?Q1JvZkhBS2V2Ukc1TE9NaXlhWTdEZlFhNThKd29ieS9mUFhqd1JXeEsySERy?=
 =?utf-8?B?dGRZNjZHY2NYRkU3NzJpSmllQWRlZTI3THlZYS83SWJTL2RlWEZaRHV5MExx?=
 =?utf-8?B?Q0FmUTdyOVhxdHJhZjFDWEI3K2dDL3JJbjd3SlBiczZralRocGJzQkllSkVB?=
 =?utf-8?B?UUxTd3JxRFQrVUt2QTBFUXhCRVhTZHlOTndWZG1XcXh1ZVVtOVMyYjR2alJk?=
 =?utf-8?B?NnV3S0xNeXE5Z1I4WEtBVjBnVGtWRXZqM3lSbjIrYXRqTDFCL0NDTmF1aUxn?=
 =?utf-8?B?cG42QnhZOVNERC9GN0NwSjZ1MXpZaTF4SmdoeVlhWTZKU1FFTnVCLzR2N1Rz?=
 =?utf-8?B?YmpIL1phdERwbzlSd0VoZGxZVFAyanA4dkZ5eXR1WGNPU3ErSTVUOGM1eFVM?=
 =?utf-8?B?alVxeDRYcGRpWjNkTFRialJLMWs0S2gzODNUOWFrczhKc1JUSmJjQTE2M3FC?=
 =?utf-8?B?SGtNNlRUYkNsR0p5WENxTnRocXc0QllIRWNPWm51TmpDWTlZaEFFQnB1YVNW?=
 =?utf-8?B?Q056OVBiZG53SVRQVHltSUprZXM3R3pQa05vN21OREM2dEVjaGlxZWJGNFlU?=
 =?utf-8?B?SUVZRS9Ccmovb00wTDhXWXB5L1RzdHNKUlo5N0pTZGR3MGdDZElLMFhwKzBk?=
 =?utf-8?B?cFprdCt3empyZlRZbStFWmc2TFY5dzg2anRwWEQ2ZG90eGlOcGY0aVVDV2E5?=
 =?utf-8?B?SXpscmdlb256RjRyV2k0ZVFIdjVaN1FMazV6emtUS2RObkpZZ3NIc3dyZSts?=
 =?utf-8?B?anIzZXF6ZDRuMnBrdzN5ZDhlZ25hd0JtOUNoOG9zK3k4d0RyK0NXY0NHWCtF?=
 =?utf-8?B?TzlJQzd2TXRRd2d6aGk3c1hPa01FTGFrdmpycEFUNHIxQmtiS3VubUFick9G?=
 =?utf-8?B?cmVJWU5yV0pWa29NdkhqVFArcU9nN1Juei9MZlBLTUVtUU9PUmRidz09?=
X-Exchange-RoutingPolicyChecked: agCOo+Ar4v+Aip9rU+Dy862/G/XtmDtZA1r+UCWQ1CTy0mbISTjQYuTLcRIzVa4atKYKWKjhsUgzoIschxBHRkVX+Xk+bpWJgvIkvF0Yq2OXoiOFXUgMDI2wkyJEAjBbEas+qfofx9imL3lvzTrCUp8YMSiep4bs3dh9XcuJ1cn/BEVZ1s91mFH+jH50ILSL4uBa+ekqsiIJTewBzTToORn+nWvfG7FAZkT/kh835gobmWkz90NDMsKufuY99z5NTA8Il6X2hoQn8DTdEBN1YUD12wFRELGy7Bxco/ZFiuzS5K5D+SSNZPUSXRlI/1OtVoYbbxGv8Vt2yTEkjbJKwQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ca6da23-4ef0-40c9-5020-08ded35fd936
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6967.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 08:49:35.3677
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cXka7R3RGOTuDqqh7/USiIP78qHUcjMoosIsjArlAL4BKQrjGyqmnCoTM17XzGlvWE9+9FBqO5D4f9X2iUAAR1ookxn7vVapcsGqsbqAY6g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PHXPR11MB9685
X-OriginatorOrg: intel.com

On 6/26/2026 8:09 AM, Kuninori Morimoto wrote:
> Hi Mark, Intel developer
> 
> Current component has component->name, but we can't setup it via
> component_driver today, so the user need to use
> snd_soc_component_initialize() / snd_soc_add_component() directly
> instead of using snd_soc_register_component().
> 
> This patch-set try to solve root cause of this issue

Hi Kuninori,

Does this mean you have a patchset or two that follow this one up? 
Looking at this one alone, I'm not seeing why both ->driver_name and 
->component_name are added.

The driver is supposed to define _behavior_ of the entity it _drives_. 
Component's name is (typically) a static part of its description, not 
its runtime behavior.  To keep the design nice and clean shouldn't we 
leave driver->name and component->name alone?


Kind regards,
Czarek


> Kuninori Morimoto (5):
>    ASoC: soc-component: add driver_name
>    ASoC: soc-component: add component_name
>    ASoC: intel: avs: pcm: use component_name for Component name
>    ASoC: intel: avs: probes: use component_name for Component name
>    ASoC: intel: catpt: pcm: use component_name for Component name
> 
>   include/sound/soc-component.h |  6 +++++-
>   sound/soc/intel/avs/pcm.c     |  4 ++--
>   sound/soc/intel/avs/probes.c  | 27 ++++++++++-----------------
>   sound/soc/intel/catpt/pcm.c   | 20 ++++----------------
>   sound/soc/soc-core.c          | 11 ++++++-----
>   5 files changed, 27 insertions(+), 41 deletions(-)
> 

