Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D138A2D9796
	for <linux-sound@vger.kernel.org>; Wed, 18 Feb 2026 13:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771421565; cv=fail; b=dfAmJ78JXcikQxEc2ZNzwXQLYpUk/S7YYR3YBiUcAAjpeK3n/T0Me0uqyRcY56FTpwWQSw2O1HoIupR49DqDbp7TuEzpcegYmVoA+ksGZ3oU3ZanH9/QAqE9I4rafEHk2FdY3sPhfUuzAu3Li3jeB4VJQw7DuIgbK7m1SoepFoM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771421565; c=relaxed/simple;
	bh=efkhqzUp9uD+Fd8cDxPKZQFUmFIYwRqZWd8ZMqFxqiQ=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=MRZlGqRGcFCejRjkDEyGJSTV7M4dHvY908TxnFbRcXP7vm7TNHbUASul9IXUsNSYcPVcPrqnd6Y7RfPHhRrfaKBljN4dgK195cdu6O06dU/TZsHark3JZbwiST5+HLphbrYv8WmyXXzxyJL3XuPCIVBUFw/TZaWpbTrSwOrc7Jc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DrkhveDj; arc=fail smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DrkhveDj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771421565; x=1802957565;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=efkhqzUp9uD+Fd8cDxPKZQFUmFIYwRqZWd8ZMqFxqiQ=;
  b=DrkhveDjD4HgTjPIC4JTdjwfNEIvJLGq8hbhlkDPtqET0sZttQ02Y3i5
   jrsTG/oynPwBZhGll6W7s51zQ8y/lUm4h5j8CLWv2DCYJWvSV6J8H6Dq9
   Tavw9iYu3ykm1pM/XBpmvwsFf3tAXSWh3eQXK5Vgms0oIGuqCm0jFkdi3
   zh4tuF/5q22/3RpXHaP4OK3rhcHeFhty6qCYdfs8O3/13Z0s0tegYWtTH
   OZqVO5GRQcDP6CzHqS88Sa51YcahwsclPn0bx/1pqMJN0l7Jl8D6zKVCC
   QK/bJ25egvGV8lSg6l2ImYvtmNYxVXyS9KcijAi9ORLb2MpkANWJJtrZF
   w==;
X-CSE-ConnectionGUID: f1YHtDJmRTyBuXvZARaDOw==
X-CSE-MsgGUID: 6PVtCtlyRLOO7utGDCMF5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11704"; a="72206993"
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; 
   d="scan'208";a="72206993"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2026 05:32:44 -0800
X-CSE-ConnectionGUID: HrEoEZg0TdujBI8LyQ3N6A==
X-CSE-MsgGUID: f+LmlMMkSKq2NkJTHZBYjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; 
   d="scan'208";a="213390395"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2026 05:32:44 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 18 Feb 2026 05:32:43 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 18 Feb 2026 05:32:43 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.40) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 18 Feb 2026 05:32:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CvKwKI3wc5kd4J8QbBS6W/l/sC8ZnRgA8EQcCCy0ArTkulsRdUC1VdnoZwG6Rdz4jXOjmF5WFGAeu1HBXHYQu20SKbcSx/2v1zt5m9bbrHmq42u5CPoYbfXPunOor4Uql2I66ws0J2N4K0e0xqGisHuVEiJ3pT6ikMzJqGsIEtfU2fdzvA62iG3Hb92hT8FRbKNMDPjZbE8KD3DyW6WjUt6pm2tBAW/DyNAP9kQ6zcuQR6YtNATtepLDQ3wZoKfXmFBFCGyG8fypOwk0PnB5TEZmBUtgTPRqJTbFmCS8MH+MKG723hJfBm81BLP4ShrGQ5J970+DQNmxeTznxP1PhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h79Gau8enHjAIdQj8KaJzM6TkWPpBtkDhqZ6I1utlh0=;
 b=F/sXH/hDVTf1If8Jq0HZjRVxNTW56K4DLlPmVzib5c5/eU+jWpQRdzDSB4ppsUbcrlg/Zm2d8ohPCHJKdHknTuTJkCLl9sk/D5d6L2e/8Vffq4oAmdHPpNObj92w9sBndtgb72+KYuaNhxd8XzjPdV2lww3n0DZMrWZ8nfa7YCIjbDVguZg1ShNyy/1abZ1E9pMSz9e7yjpNyLC61O98ECxKGZsmyfGQcrgjvLGfn2rBxZxG361uFG42PREDfD+6nfLOzhQmYquDPwKOERSpkI6eGdLBfi5c9//jHfnsvafT72vzqxUjNUmZS8W+plIa1aVlyMAg46wC1r792Y5rMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8283.namprd11.prod.outlook.com (2603:10b6:806:26c::16)
 by PH7PR11MB5982.namprd11.prod.outlook.com (2603:10b6:510:1e1::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.14; Wed, 18 Feb
 2026 13:32:40 +0000
Received: from SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::d18f:6b38:584a:214]) by SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::d18f:6b38:584a:214%4]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 13:32:39 +0000
Message-ID: <29563f08-a478-40db-8c86-23977508205e@intel.com>
Date: Wed, 18 Feb 2026 14:32:34 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PAATCH v4] ALSA: control: Verify put() result when in debug mode
To: Mark Brown <broonie@kernel.org>
CC: <tiwai@suse.com>, <perex@perex.cz>, <amade@asmblr.net>,
	<linux-sound@vger.kernel.org>, <kuninori.morimoto.gx@renesas.com>
References: <20260210152737.347279-1-cezary.rojewski@intel.com>
 <8d133f5f-dee1-46cb-b0b2-48a50b747d8b@sirena.org.uk>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <8d133f5f-dee1-46cb-b0b2-48a50b747d8b@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0274.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:84::19) To SN7PR11MB8283.namprd11.prod.outlook.com
 (2603:10b6:806:26c::16)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8283:EE_|PH7PR11MB5982:EE_
X-MS-Office365-Filtering-Correlation-Id: c16b45e9-edf1-4a35-f9ee-08de6ef22fd5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OHFuTFJtbXVBU000MTVYOHpjWllrTm1sQjdVdzVuaU1TeHI5Wmp2QmRCTjI3?=
 =?utf-8?B?VGp5V05nUjBKZ1ZQclZTZFZVYkJJc1MySkNGNXhhTDNydjA0Q2VPLy81Zzda?=
 =?utf-8?B?N2lkVHVMT09jcklTL3JPMXVmVU4ra3pjUDZlUXpyUmxEUnl0Yk9uVmF6TUM1?=
 =?utf-8?B?MDRFWmVrVzlWRENJeDJZQ3FaVFNGZ3pOZC9BTjFDeUt1UCtCWVRNSDFUUnZL?=
 =?utf-8?B?czNoTmw0R3ZQSEpLTGNoQ2wycHdYQ20xU3NjM0pSTVAwOE1FT2VSNE04Smlm?=
 =?utf-8?B?VjJJTWJFS3pKZS9PM0JiSFVqWHlydVRqaDFZbGNxamN6YXcxRld4OWtvdTE1?=
 =?utf-8?B?bTVac0xpZlMwK3ZlcU5tdGtXbTJUeGZ5MmlCQkhoMVEwTHZ3YmhvbDh0aW5N?=
 =?utf-8?B?aEtUK3lLaFZtYVVLcEpMKzhnSUJDcElZR3VuTXkwUnNraHlaTnNQZ3FHQy9M?=
 =?utf-8?B?d29TaEFMTi8zWVFIcjRpVWVqVGhEbXdPTTIzalp6VWpNWGE5MkJ1WVcvVUg0?=
 =?utf-8?B?MlBmNGl6YStVWXJYenEwMEF2cGZJYTdBbzM2azhVWUVqNElXSFFRMjdFQ0Rp?=
 =?utf-8?B?ZU1vejJPRUt2STJuaG9kY254WWF2R1NSRnJTWmNuOGt4R3haelNla0UvVU5m?=
 =?utf-8?B?SnhtT2tyMlcwU0lnK3VvNzdUWVJ5cXF6eUdZWnFQQzRkbUJOU1VsaU0wK2Zt?=
 =?utf-8?B?WUVYb0FHMzRnVjc4TnkvN1o0UEtNbEU0ZEtmR3VScUtOb250dXZidmpyU0l5?=
 =?utf-8?B?ZkZncGh0YU53SWlXWDM5Mk9jYzJkbXh5QVZESDA4amZLek8zWHpJM1ZSYmVy?=
 =?utf-8?B?RVFCby8yaC9RbkVGUmE5OE9jYUNvVUJ1ZDNFV0NhT2piREs3ZjlDQ2xqb0dw?=
 =?utf-8?B?MkxEYkNNYWc3WXcwSnJZckJtejloU1Q1L1lmZGxSMVNWdkZsdG9rWE10azRx?=
 =?utf-8?B?amlZdU5NUTE1ODdYSTNXRHhBdGZ5Mks0dFBKa0ZyN0EwbTU2R012dE5yQ1ZY?=
 =?utf-8?B?ajJpU2ZOa2RNcFdLdFgzdVRDdGpsaVY4Y1Zwamd3elFPaVBaY0VzSFpVb01D?=
 =?utf-8?B?aERMR0lDeSttY0FINmpPcE5GQXhBdWpMR1lJUmUvUXFYb2Q1dzJEMURzaER4?=
 =?utf-8?B?U05GLzlTckxIa1BpRzJqd0tNQXdONC9aVnhCbG9xRzZ2cHp0UUZxN2QzNk1m?=
 =?utf-8?B?TDQzcmdGZWxySlNpb21RVGhYWXdBQkRiTUttSHQxQXdFOG1idFc5NTBHSFU2?=
 =?utf-8?B?MGZxdUEzblJMNWx5QmZGWGptT3BDNGFUWGNFVThmRE9ZQnBDT1Y1YklaKzRK?=
 =?utf-8?B?VjdSWko1bkxiV0NOUTNCcUloUTFGRC9HSmN2NFo0b3ZaVjlubmIwZXd1eURX?=
 =?utf-8?B?Z0EyQ0tIVU15bzY0eStNTGcyNno4MW9FR00zTnNHZTFLeWNkZXU4eFovbEhx?=
 =?utf-8?B?WktVVU5mUXdTSTJ4N0VqQ0g5RnVqcGczc1oyOVJmNzBaSExpOTNNbkR4TDdx?=
 =?utf-8?B?UjhjaHZXb3Jlak1Xc1kvWTREbUxJWGMzMWljMVdNdlhRTEkxd3haYTFSMTg4?=
 =?utf-8?B?UzNiUUNmdDNyWkNnU0Z1QVpzSDdJeEZ3ZG1VUDVaTStZMHVyVnRyc3owZ2Rs?=
 =?utf-8?B?azFJZHdhQ3U1UXNwV05tZnJMYmV6bE5WNkZRejZ1T1dOcTZPbVZvd1VBWS9G?=
 =?utf-8?B?NFBuUlN0aXQxUjRNVkZ2RkZCRVRCd0RtM2Z3OGh2ZU91WnQxeWFFbXc5RlVQ?=
 =?utf-8?B?dlBaWnhkcWNnREJYZnhadjAyRjlVdlppUU1KTEUxTkVlVStVc3NwdUM1VE5j?=
 =?utf-8?B?MzAzYnpZT3JzYWIrUnhLeDk5TTl5Y3c5VnNQRjIwdzJxSjh4YndHaUJOWDkz?=
 =?utf-8?B?blB6LzV1dlEvOXVNM0lHMHBwYzFMRlFoaVhNMFhHc0sxQjVBbTg4a0p6U01W?=
 =?utf-8?B?VmlZMllYMU1ubC90ZkZBN1kxK1gwYkZpZCtJNnJ0NmNVSE5ZNzE3dTRTNmpq?=
 =?utf-8?B?bE9pZFNSUDZxMS9yaU1yMmtyRlNrUEFIc1RMWlduVGcxNUdEeDE4UFgwMzJ0?=
 =?utf-8?B?cUxxamZjSVJYcVRnQlpNL1FXTDBqcituMElvMDB2cndSNU93UWhEbFpRMmJ3?=
 =?utf-8?Q?zcpU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB8283.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R2RaYUhMV0N3NVo0OGtBNG9jRitDcDF1aFlzNEpOTFNtNnlyVXBDR0w3WWU1?=
 =?utf-8?B?TUdCckEzZnhyelNKWCtOcm9wUHdERHBxZUcrYUlacEdTcHd0R2xWRzcyV01i?=
 =?utf-8?B?a0g2QlBqbGxuamlPZ2NrcUZFcjE4TmN1V3BDVnVNRmpLa05kWkd4TmlhTjZo?=
 =?utf-8?B?aUFxemN4VWdKQUQvaXEzZUdFbUFoRjd5bkpXaVRLMUhJS2dvdm1LZjh0Q3BF?=
 =?utf-8?B?SlpOQm1vQm9lYis0ZHVKcGhweXRLTWtueXZ5V0JNYU5JUzFZKzJmQU05aTRh?=
 =?utf-8?B?a0ZFMG1HTXliWnNScTZsdEZFaTdwQjFrMm4zRFN4SzUrcXhSMEhBZDJXZ0Jx?=
 =?utf-8?B?L1J4ci8rMmVxRFBMRUpvSXVxNDB0N0t3eUkzMWdWelJ6Rks3SXVKcWFvanRT?=
 =?utf-8?B?MTA4L3BnZzBKQXJsV3UySUhHUml1ak1xRXByRGNoTWF1eXkvNDM2Tkxtci9k?=
 =?utf-8?B?cS9EZWlhYlFQaWtKN3NTM091STVxTVkyZEwzN0Vvc2ErTjBTbmVNMTZLOEZE?=
 =?utf-8?B?dDN6WXV0cGVDL3N6MEJzaHRRTTBHWElwMUhISHdWMTZHekszeDhmcW82SEJS?=
 =?utf-8?B?L0pXbndwbWd1VjNDYmhOM29wOXMzQTBvVTRZN3ExUm0vUDBnUjVrakFnZjNi?=
 =?utf-8?B?eU5OSDAvMFlURXlIZWVrckdISlNKVXlhVHVPOTFOSU9hMUM5OTMyblFwbzMw?=
 =?utf-8?B?ckFPZkZvdHVudEJUd0xIcUdJWm9CbTFwMVo2Zkc4b2ZWMy9vUFZ6NlhZQklX?=
 =?utf-8?B?M2N1dDQ3TWoyOUxqTUJ3M2dvQXo4ZjhGNEV2U2xwS0FGOGk4bWVuNWg3SGVW?=
 =?utf-8?B?VThIRWZ1WVZsRExvR2JWckx1UXVjbmdFWjNYajJEQitseEtseXU3MUZhYUlS?=
 =?utf-8?B?dkpVaWh3TjR0VkFWMElZZ2NRODBwZ1U4THdiQ3U3UUlnaHRuZGU0UUovb3o1?=
 =?utf-8?B?MEFqZ2hPT3ZRdVJBM2xDWmlpck4rRzQ5MDNCZkZPcG1FWUpZazhQOStJVlNL?=
 =?utf-8?B?TUhiTFN4VTdlL2JpdUxkM3ZHRVJ2dHoxMkUxUEt2YWtnZ0l3dTZ2aGlLQmFU?=
 =?utf-8?B?dHdwaTZBQ3NtSHBqYkl0bTl4R1NPZWxIOWU3czFNWSt2UVN6WWF3dTNmODBW?=
 =?utf-8?B?cFNQcUcyU0hwWktiZ0tOUUZHNFJyVnFuK2U2aHF6Z0JBTGUzc05MWVF5UUpG?=
 =?utf-8?B?cnhkUi9aRk50UDE1M0JaZE5ETGdJd2tPdTM5N0M2eHFLUFJIYUkwaUh0aWFL?=
 =?utf-8?B?dEs2OW1HNWptNlk1ZzVQRnBjbmQ4bXNETzl2QitFYnhURzlCY0ZLaGRvWVc0?=
 =?utf-8?B?RUVnZEhsRENyRXVlWnB5UWlRTktrZjRtcDZwS3BCTFFEWlBrallUcW9TM20z?=
 =?utf-8?B?a2FmZlJUdXhXRDRuRDlFbDNLekJ1U3lyRVdDaVI1bGFhQ0svYm1VNFhtTmln?=
 =?utf-8?B?K1VSZmxLdmpZTU5NdWROV0lDVkFSQnhORDhxb000RFJvejFGOFNIaFAxTk9h?=
 =?utf-8?B?bnZ0ZnJPSnV3d0RyMnZjQkMzOWc1UzlRbERKRDlEdU5LOHRoOFZBbVpZWjhi?=
 =?utf-8?B?UFYwbWpiSUsrcnhBYk5Zanp6WkNDclZDYXlZdEtnd3hMWm5QcllxbEw5U2Nh?=
 =?utf-8?B?bnZQL2ZuUmIwQUoyOVJSQ3JlanBXbzA3RHVXMGtBMng4UGE3eHRROFZSa0Z4?=
 =?utf-8?B?Z2NVS0xkc3JWQ2xXQjBkU2h5L21sS2xaZTBZWkFSSGk3eGFmUnFqSkRnbHkz?=
 =?utf-8?B?VkFDZ0xFWmJqeHdUNkhSeWtQRGhLbnNOZVVURXU5eEZkcXd4M2hETDF6QmdW?=
 =?utf-8?B?S3FLZjh3SS9xdENGVzd1U1lwczBQS3lrbVhYMGFKYXh6VDBiUk41WDRBRkFV?=
 =?utf-8?B?WlQwSVRYbXFrUXlFa1JwVFp3M1N6a3JIelYzUTZjM3BOR3ozZVZjMFRpWlIw?=
 =?utf-8?B?OWM5VWdYK0w5ODFoME0yWk5QdXZKc2xraWk3T20xNlRwcmpOTzliOFhtRnpG?=
 =?utf-8?B?RGRkaldoYzQ1WFB4QXlPRlVCRGlRaGI0aENzZmU2MmxUaXZzSytSQ1ZTc2t6?=
 =?utf-8?B?YmxDa0pMY1VzeEtrbFVMWEZtVnFJbkZ0UkU1TCt0UVdSWGkvQndpa1UvQ2FR?=
 =?utf-8?B?cXUvSGJKQ0hrOHp1WW84YmtBRW9VeHVmcnlHckJDN2ZjbThmSUp4eUpsQUlk?=
 =?utf-8?B?bDhFWkRUVWxuVmwxeFBPNm1YbzBEWk1YNFlyRGlWb0xNRVI5TThxSktvOXBv?=
 =?utf-8?B?cHR6TGlQdHRaOUJOSUljTWZSeHRxeXROSklJNW5maXA4bjNQN2dZNFpWVEQ0?=
 =?utf-8?B?MVVjck1teUVBaVFtbkRCWUxuTkRMT2xvYWVmaDRtcGh0Z2c3d2lEV1V0ZDNw?=
 =?utf-8?Q?gqqsd+I4ydNeRpOg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c16b45e9-edf1-4a35-f9ee-08de6ef22fd5
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8283.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 13:32:39.9354
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OHXkrFgXb07ZXe2ye4gAf8nqTUqwIDw7BLW51ck4c4Jl8jf3GeO80AwLeCtKvYOPSZZMsw8/15bzn5ZPin7ed2cr/RYC+nUCrD3GmJHkRcE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5982
X-OriginatorOrg: intel.com

On 2026-02-18 2:20 PM, Mark Brown wrote:
> On Tue, Feb 10, 2026 at 04:27:37PM +0100, Cezary Rojewski wrote:
> 
>> +	/* With known state for both new and original, do the comparison. */
>> +	retcmp = memcmp(&original->value, &control->value, sizeof(original->value));
>> +	if (retcmp)
>> +		retcmp = 1;
>> +
>> +	iname = snd_ctl_elem_iface_names[kctl->id.iface];
>> +	trace_snd_ctl_put_success(card, kctl, iname, ret, retcmp);
>> +	trace_snd_ctl_put_fail(card, kctl, iname, ret, retcmp);
> 
> It feels weird that we have two events here - given the result of one
> you know the value of the other.  It seems like it'd be more idiomatic
> to just log the result of the comparison, the output is structured so
> it's easy to parse.

I don't mind either form.  Typically, I filter just for the fails (here: 
trace_snd_ctl_put_fail) but greping for the 'fail' in the output is fine 
too.
