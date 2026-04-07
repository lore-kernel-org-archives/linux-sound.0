Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFC6725F98A
	for <linux-sound@vger.kernel.org>; Tue,  7 Apr 2026 13:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775567790; cv=fail; b=jIkChcqydx3MNuKj8jG8d44/PvNQ+sSosB7qbpHpYsnC+X73+6rv7W2MK+Th+jrvhhPF5X7a0aLiG7YOUYdWSX0BZYqQoUR+e6vWvy1qMNZ1KC6fh7BnK7zpEOcngxGGd8XkT2zsrRTxWgDeig0ev7VxbEV8/qvWsGy99IjsCVM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775567790; c=relaxed/simple;
	bh=637Pefn6sZ8U/X8wl+SHTk7WEzoBp8lmKstNyDXe+9M=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Zj36BGTZ/6PN6d+eZhKejY0O6xb/HgqdhSsSvUal0Fwy127ONxTf7j0NTk5HQQC+WkvL7bVydgGHzHO2WKdXOVnmSufI4Y1o8NA3jTbUgUBzFGUhgNKvhAvbDXDNbh7bNa4TBUEGqMsMEyZnJfnM36/0zL1lu+TR9ZuzPUrNIDc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QjPtbspm; arc=fail smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QjPtbspm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775567789; x=1807103789;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=637Pefn6sZ8U/X8wl+SHTk7WEzoBp8lmKstNyDXe+9M=;
  b=QjPtbspmthFQmA9+cp8KT84g8UOaMF1ezN5f69fmo++LrOtqIgipkCyL
   4SXAuzYO1odyYcHtnbN2juNx2Ri259wkzw6KSOANoNaCHTaE9VvOOdmm9
   MamE33aDT6n0C0J5RpvTV++KAnAdwtvLG3Itx3ZvlaPKBEhlXvpDPihjN
   Yv+ykrLhEdE9JLUfnkjloV7L9wDGJn1QUVwILk+zll1lemNIazDIDz2Qn
   NDpR8GN5/kPrPMKR+q/mtA6Qo49hVfvtpy4FxuwCBGiDpLDPoAgrbZwKH
   SBOUysg/ruH++m8+DvbVtGKXOocjlIj7OwoRkO1jIJ19cb8r7Zoa0IikW
   A==;
X-CSE-ConnectionGUID: 421WHnTnR3ayR83QAEtPRA==
X-CSE-MsgGUID: DKMPf41NSL+0/vLgOfeHXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="80388415"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="80388415"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 06:16:28 -0700
X-CSE-ConnectionGUID: ref+ZSFjQHuGtbPiVIAePw==
X-CSE-MsgGUID: qUwiPbHPQQSSFvS+eytjqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="229839549"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 06:16:28 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 7 Apr 2026 06:16:27 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 7 Apr 2026 06:16:27 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.9) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 7 Apr 2026 06:16:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J8cecM2cPT1rQgnJVKGAaoumbY3l4OAEBho3kT43kxVfrUsllhhCzdbukMRzDHQtzvaM/yyvVjHUMd7a4xQEj/9ZvemHSc79nMMwXfYjKdB9+NlBOEgCcHZYGTV7G9Ybu+oTI0szIMi3TZ4yh3JTkD0ja6FscdrN2NM+7ifEeIfMn85yj/IYH7WMy9beGmOwubpc7JXNtKzkHcxi079LEY065xyNbZ2MDNUlZB0b/9TcTZgdx1PixwI6PtVL+711rZmD7daCQRGAeThpFVJYVlQHQgztIZ7HmF7594TpIn87d4vpXx1yD7E/TjLsHfNNcmTd/5aIhqeJY8sPJyS8Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xvfBp6+uNd4Xxkzx0fAb1+L1FsjAnQhTZISsC9wXpDQ=;
 b=U2zNzuOws4HOehZWYiUvp92xMmEJkXMkvXI2/1emNyx0TgB6Z9NQqDPKOTz1+bpH7X8vm76jugiWeYnk6FS5a9N+6rKaDPBh43P+p3UMIzHThY2BbY3eNJhngtv76oA5/b818kgSKvvVe8ysqfTCbjmPX3Y6iIie5QIKdvZGdugPWszidIFP266IEm+8WeBy7vKecs5D+68YywomTmyJBKE7/PNlR46JLnp+/hDAz5SlAwuXhmWjxKoL+VeHhaBwC4dsOtscuUK5pdjbkvStd8rj5LoPQmIyaof8jrHWVHa/IbpTRYm3SamJGSD+eCeIqVgDNo17tkbphZtoLuXAAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6967.namprd11.prod.outlook.com (2603:10b6:806:2bb::15)
 by CY8PR11MB7686.namprd11.prod.outlook.com (2603:10b6:930:70::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Tue, 7 Apr
 2026 13:16:25 +0000
Received: from SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4]) by SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4%4]) with mapi id 15.20.9769.020; Tue, 7 Apr 2026
 13:16:25 +0000
Message-ID: <86dc9c88-2b12-4a4c-b640-cb29c9b84264@intel.com>
Date: Tue, 7 Apr 2026 15:16:18 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] ASoC: Intel: avs: Fix type warning in
 avs_probe_compr_set_params()
To: Mark Brown <broonie@kernel.org>
CC: <tiwai@suse.com>, <perex@perex.cz>, <amade@asmblr.net>,
	<linux-sound@vger.kernel.org>
References: <20260407085459.400628-1-cezary.rojewski@intel.com>
 <20260407085459.400628-2-cezary.rojewski@intel.com>
 <416e2b85-f0a1-4dac-9e36-5ae31551539b@sirena.org.uk>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <416e2b85-f0a1-4dac-9e36-5ae31551539b@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR09CA0178.eurprd09.prod.outlook.com
 (2603:10a6:800:120::32) To SA1PR11MB6967.namprd11.prod.outlook.com
 (2603:10b6:806:2bb::15)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6967:EE_|CY8PR11MB7686:EE_
X-MS-Office365-Filtering-Correlation-Id: f34ee200-e56e-4563-75cd-08de94a7dec5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: OjtrdHS2G/ZUIMnGrL8sK+Uu0PIhX3jq8NOCFk1xib9OW9lIQlWKFXeIdVu7NmY+qdXo0F1yHcH8N6a/+G6X67sVrY3+wVNM5Tj8YvcGnUujkj7ZTt82sMBDMQu2RzzNmZD8F5jRbwo/NVRSFMASpEZ5pcM5uD0ks5LH2QQcPp3jcUDIJd6T+zI+bsKvc57BK84kiVlwtzNmDWTvA5qbpnxcSO54Ev/FvNCKcOfbSc4K2dB0WQ4CJoMnuOPYeVR8oEFmfwB85SEhSW8G9qsLTG4dU3BulKodUh5JQIFqNViI7Wy6jXrt90o5sG1KLMkP+Yze5DpF87gUDV70hmeKUXkaQ87LSb0fz9xqd4H/guExvFH47JGLUN0D0VsdD5Fwd40hmFUIXTfGpe9ooGYGU28JfVapyntWhJWQdRTzW3nHDvovqXrIEAbJBnVnOyHv90rlDMEkZCJclNw3xZ5pl8rw4qZToiCk/mv5j7rY390cQ3fEo/NruNI/oX7eGqmHiWXMtOlzZ4q5ZstSOQS1amBP0Qak5Uku/sbFswHgdMddEot1eNQaMGn6XbT9SrVdcWQUFzCNTE+QaC1AkeyaAMvn2tv+crA1NZzklumDZqeBcrdbEGQFgRyudV9d7JuiTqbS4ZnCQfSzdiGPSKUbmfYe+42c/TDIdpu3UvmjZlQ4RV6V00hk8OY61cPPjedB
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB6967.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QzBIZFNna3Vyc3N0UktvRTFOY2JIM3I2dEJ6ZHozalQ0U3NxaTMrdVFEOHNs?=
 =?utf-8?B?UTBKcXdnN2VOM2h0UmJZNWkyMjZCcEtqSkltcDlRTVQ0QXZqWnhNL0tmWi90?=
 =?utf-8?B?Q1VycVU4YnJ2V3dkNlhuNmRRMHNJNVBBTmFxZE81NXpzSFBtVmZQSDJZam9T?=
 =?utf-8?B?Z002cU9vNXByTHg2Q29OVUxMUWdLdC9KZTQ0QkQ2YTZkVE5DczAvYVNMWGRJ?=
 =?utf-8?B?em42bks1bE9LQWlhdkQrS2xnZXBYdng4c0NTOFRsYlp6dDlTWDBDY0hPV29Z?=
 =?utf-8?B?bWU0TnNYV1VubXlxaW9KK2RqMGgwc1JtdUpOQ1B0UkF2QXkyWGxqbytGVzkw?=
 =?utf-8?B?S0pFTndHUHhvZDVzWW0yQWxtMXJOcyt0TmVUZFlqRFZxNHdCQnNUREl4WVhL?=
 =?utf-8?B?aDhMZzhaYnFKVE5WOTY5QThZYVFuK0VUakgwTEIvZXZsV093K0xVWmxhWkRy?=
 =?utf-8?B?WTdML3I5OG1VMGNzVTVNRUNWOVJrekgvZmxUQ09Hb0ZMczRodTlOK3pjV1p5?=
 =?utf-8?B?ejVYUzRtd3pKSXhwTStnbVAyRjYrRWJmNFRab2d1S1g3bXMrVnd4emdiY2Er?=
 =?utf-8?B?c1dpMmVPejcyd0dsRkNjWGRPeWdpdHdyWVZmNGFBWFZQN2EvRUxwOW1aUitk?=
 =?utf-8?B?dVk2MEgyNHVCK3lXZWdFcks3bXcwV3AvekpzeW45bDFMS3Z2Wldld0dIamho?=
 =?utf-8?B?bzNGZFZDN01PakVMNFBlWmRvWHJiSGpJcHF3TVFtY2tGNUgzOUQ3bFJpanpm?=
 =?utf-8?B?L2dhOEVuQk9ycEVvRWhGWXV3V01zMVlpNDFyRFVVQUt3ZTdiQjVoclQzREVS?=
 =?utf-8?B?Vmk0T3Z5SnlkN0N0MFlwRFJEemVzejRHa2FFNUhjUURlMHlHNHpzUnJDREhL?=
 =?utf-8?B?dGpWZnE0cnpsRHpMZEpUcTFSbDE0UVVhVGdScFlZbUxEdWxSZlA5QjEyZyti?=
 =?utf-8?B?cnlqdDRIdWI2Z1V6SnBxSzdRWmgvTzFpOGl6WUFkZ0t1d0FwYzgxOUlvNEcr?=
 =?utf-8?B?aXJqQ2RRS01OQjB0eER5d0pURFZEYm5jL3dPMy9qYXo3cXBMUzZSL1ZEbmxP?=
 =?utf-8?B?MHE2RnFGRGViU3E5dVFxZ0lWZU01L29qbFF3Z1lYWlpTMU1Ha3RSVkwvangy?=
 =?utf-8?B?R0VDL1JvTU45eGptWmMwTERtTjVCMnB1NEpmNVkwWGtBVDlhNkljQ3JJT3d2?=
 =?utf-8?B?aVNyL3VHbWxmSlV4NXBMeUgwZ0tMRExFUERYMHRLOTA3Q2FjbVJvUG1kNWZG?=
 =?utf-8?B?S3MzU2ZXREppclpuZXZTdmRFT1JTN3dKQTF5TFNiN01UWXY2bVBYRUFqcE5Y?=
 =?utf-8?B?dlJKL2dRaTdOUjhOSkpnNHpmNUEvcEdUSWw5YjhkRmtQcGkzRVNXWnp6SktC?=
 =?utf-8?B?R1YvOXRGODlMeXhzU1NKZGpuek5VQVJhWWQrMnRSUWVDdmNsRXJGU2ZxUk9x?=
 =?utf-8?B?S05aQzFiV0VnY1BlSm1idDFpUTV3UnU5alRsWk5OLysxTGhlQ2NrUHc3c3pm?=
 =?utf-8?B?czdnbHBYMko5c2Rpd2FmQkZPWWIxbzF1L0tteW5IeWM2YWZ3RGxOK0puYjlv?=
 =?utf-8?B?Q1NxcjJtUWVVYTVwVjNLbFVLZHBYMzZuZmhUdHJMVk51bjlFMHU3T1JJNnBB?=
 =?utf-8?B?UUxKYUQxdTcrRUkwT2FJajh5Z2MvTFlZQUFsUVdnVFZJQmtCVm1nMjBqRWxQ?=
 =?utf-8?B?ZE56VHJKb3UreHFwcXdFdUkrNVVPbWplYXN6WUUrN1FNMEExdTBRQkwrd2Y5?=
 =?utf-8?B?SHV2bmdibzVMeTg3OHRmZ3lFeTQ2eW5hQmtHQTcvWEpISU1OMnN2ZTlQaFdt?=
 =?utf-8?B?NjUzZWRkdmtrbnhpWVNpTTl1QUhKRW5NMXlYN1pOcWdvTXBHQUNKV1RsdWU2?=
 =?utf-8?B?U3UvbFBRUmZydTFab0FqQ3RpZFdlRXc0Rzc2cG5rUzhDSHpscm5tRVU3bFJo?=
 =?utf-8?B?czIyeWVoVklxV3JJNHVqTnVBTktGbldlazhGMXh1WmkrMjR5R3NCN0NQS1dH?=
 =?utf-8?B?bnlSYlhvT3pwTGhLK3BTTFVpa3hoVlBnYWl2L1B3TU8xVTB1UG94K3R5cGpH?=
 =?utf-8?B?U25mZm1UN3ZuVlpvUjVUYy9iTnhnT1NLbHZPQzdyL0VocGhVRW5TVzltdkJM?=
 =?utf-8?B?eTc0a1UvK0FVZ0hkSkZ1WVppM2xnWjZQMjlyTUlsYVVna2E3Nlo5dE1Ncjdj?=
 =?utf-8?B?ZloxTkZSQ2pBMWRwMGJlZFlJaEwvQXVmdU5QTTZzbnROVmdQN01xTDVrMVlu?=
 =?utf-8?B?UWRwZTRYZHR2dzExVjNESVUraS93MkNBUWg0cFRETnR4VXZ6aHNER0Naa2Vy?=
 =?utf-8?B?cktrZHJsd1VmczRpRFdsVGpVZmtHcjFlZDdTQzhlY0dON1puTFRQbzcxYUFP?=
 =?utf-8?Q?uXkdoBbxBkVzcZ0M=3D?=
X-Exchange-RoutingPolicyChecked: kXs4hr+UBO3otGQ2uE56aWPKp4ZthhcV6WOLHOM1bnJ14WJg0Fk6zg6IuMCWXhmY0QbwcVY4eWM7ixbw7Tj/vucWioyqMK6opVpct0DC4CJvtBqMp0WLYeA4Wwiiz6T4lAD8xyBV8Itr7Jbc3xrHdZgs9xG9gCraBLN1XQIQZKHnnrRLhWkAW8X1LcJ6dSuBwAcEBlBj1lx1Z1uwGS+Ml83ufkFMH3nqCLpiOpF+bcm9xXVQNpmKGk7ujKytC6BqFHa7pkwlUBr4kQbB2BojVHYsCZb51Or+6ZNwkb05FAQh6swCjRoZir2ze/KKrYC8zmwwi8cFjz3ROfIGuwtX0w==
X-MS-Exchange-CrossTenant-Network-Message-Id: f34ee200-e56e-4563-75cd-08de94a7dec5
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6967.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 13:16:25.4384
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bK80y6bSu3tJddGSF0ZBaq4+lkFkJFzBPsufx1ZxmR49nQT5gN4hVLA46NJIhVm8x4+3kLHc8mmgC4eDouLUXb3pZD9Dc0XTOlLvjJiJDao=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7686
X-OriginatorOrg: intel.com

On 2026-04-07 1:28 PM, Mark Brown wrote:
> On Tue, Apr 07, 2026 at 10:54:59AM +0200, Cezary Rojewski wrote:
>> Expected argument type is snd_pcm_format_t.
>> Found out by sparse.
> 
>> -	bps = snd_pcm_format_physical_width(params->codec.format);
>> +	bps = snd_pcm_format_physical_width((__force snd_pcm_format_t)params->codec.format);
> 
> There was an earlier patch for this one that didn't get reviewed (and
> every time I looked at it the __force looks super suspect):
> 
>    https://patch.msgid.link/20260325021752.238203-1-songxiebing@kylinos.cn

I don't mind either version.  This is basically an incremental update 
which I should have sent long ago.  The warning keeps bothering us in 
the scans.

Are you suggesting we should squelch the warning instead of forcing the 
conversion here?  The use of __force is present within 
include/sound/pcm_params.h, params_format().
