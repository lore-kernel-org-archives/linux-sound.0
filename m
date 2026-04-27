Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DF7C31ED83
	for <linux-sound@vger.kernel.org>; Mon, 27 Apr 2026 15:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777303205; cv=fail; b=HSX1zwk8eOsu6y4XbI/dh71ZNd0tN+BnX/1hQdQr/Bjkm1ph0335A/bT8IG7nz6DnzraCqttMIIAzbbMsPCFP3+FD5JItuOvIDpnMXyAhTtkc+C27WOepv7yr+z1iRulDx1nU510PxmBOr7jOCRzi4Tfxb6TayOABYNb1u+bigM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777303205; c=relaxed/simple;
	bh=TbN7TNoelyAEk7J1HlGuGUb8pBguqHNO6YNj1iwD4Bk=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=SbG8M0AEZ18k2cIbC5Z6mu5WiGg4k9KJbD1ScD7Tbs1YPqLpOW1Oq33YlVN4GC1Z9TVbr/zlitQDmznbfLpCwH+g5SevYLsrlSuq2FK1RMVcGVI5GofouIWqx2al+KXXLAkapbQiMY+oONTLZxmyRD0+5hZtxIA03e/r4DjlWa8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Umy90jj4; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Umy90jj4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777303203; x=1808839203;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=TbN7TNoelyAEk7J1HlGuGUb8pBguqHNO6YNj1iwD4Bk=;
  b=Umy90jj4UWjdZ43Qiwo3GbqZpsc7IsMBXXtoTDMUL8Fj1yIzOudtqvGu
   RiQ5JWfUjmvtWbpyDN95SBPZ5v8WZRUQlLAWoN8c0ox5z4ZZN/5Dtw3hG
   K7KT1gwfwf1dG+38ldUIEuJ0R7G1Vx73pmVV5oV8ifS0GbL/WoeLykOPB
   pL7vvV1v/z8D4yswc4VPNIMTlPVPoaq/0p30IKyhAqiMZO1VgS5RqcOM8
   voECOhJjosn84/SsKpbAzIoMs+0en6n+niws26xEayPw1ym4MMag5uNZj
   CBbXm8PK/zZMYFGcd7whq0Erf1XWLoXBz0A0EythXjrviZ+Zrx6nGips/
   Q==;
X-CSE-ConnectionGUID: PhkyYrDnSwCaxHl3OCi/SQ==
X-CSE-MsgGUID: IWtaFDVuSSizlbJzWtEnKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="88890575"
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; 
   d="scan'208";a="88890575"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 08:20:02 -0700
X-CSE-ConnectionGUID: oH1UDCJkQ3W4U0v7YgdAGA==
X-CSE-MsgGUID: HfKHQ2IrRe+KdDqagaPuzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; 
   d="scan'208";a="229107359"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 08:20:02 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 27 Apr 2026 08:20:02 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 27 Apr 2026 08:20:02 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.39) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 27 Apr 2026 08:20:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LZA9643lWRx1X+nP8Xc6mSDyML6SqDvX+PU+SlxjCszg0Lffl+S0ufgkKgjQ940wHAJ6qIVwyvG7eiQp9bF5Sdxz9F8wMtUOVACwocQsElfJP339IqLzAE10/uXYeYun9ZsIPAm0+QHjRhSeRXhIqSrvHRv3uaTjAI1s1hNXYUAfmsfz1e9BB6CusZDpZi61h5beYWK7UjZK/fVV+0ZSrCi+YMHcp6px2ZvuvbWoeZmcpHN2upcnoII3CGDVo273Ws2c8Q1LFtSbaJnz3+B4Iy9M5N0yR3L6Jy0EiDx+0lyYDak090gwQ/k8MAh1dM6so9koseT70E/q2DffRiiXSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D1QQ1bPnSvcZHaObXPGwhUWIi7c72+IdObwAvk94uG0=;
 b=OSMYr5RCxEGA7J9CiQN5/Hk0vc+d2YvVeNbTONqyiUwFBEKuIvkqOSOXgS6zMLuktGcyvbUeefWE+aXotiuqHeCO+JYCEu+/cU/+A8qi7jIjucq5Q8Q+h4GHHi5loCMNlImuJ+TRp7q2j4ncwxsVp9FulkNGO1nDTIIVcKkW5nr+8LzvLJgXYBearlHA4oGyyAo/pec5RV0C0WosYkNWXJ/reFwef6NegBwLR+M65JvKTlZ+HX76Lip153DNNGS3WlbPc4IemUcytRGM+dRFp4zlgWEpD4beWqBMT5dk9eFxww8lVCGB9DsAH8cNZTIvkcGHWtW6b8cHicVEKNKP9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6967.namprd11.prod.outlook.com (2603:10b6:806:2bb::15)
 by SN7PR11MB6603.namprd11.prod.outlook.com (2603:10b6:806:271::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.16; Mon, 27 Apr
 2026 15:19:58 +0000
Received: from SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4]) by SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4%4]) with mapi id 15.20.9870.013; Mon, 27 Apr 2026
 15:19:58 +0000
Message-ID: <4d5f3abb-bab9-468e-b1be-74bfa728b255@intel.com>
Date: Mon, 27 Apr 2026 17:19:51 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: Intel: cht_bsw_rt5672: Simplify probe() with local
 'dev' pointer
To: Sachin Mokashi <sachin.mokashi@intel.com>
CC: <linux-sound@vger.kernel.org>, <alsa-devel@alsa-project.org>,
	<tiwai@suse.com>, <pierre-louis.bossart@linux.dev>, Mark Brown
	<broonie@kernel.org>
References: <20260427144619.1739971-1-sachin.mokashi@intel.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20260427144619.1739971-1-sachin.mokashi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P194CA0035.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:803:3c::24) To SA1PR11MB6967.namprd11.prod.outlook.com
 (2603:10b6:806:2bb::15)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6967:EE_|SN7PR11MB6603:EE_
X-MS-Office365-Filtering-Correlation-Id: 1366042b-a34d-4014-af5a-08dea4707173
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: PGWDUqYGfTcgSzThR9vlY54IFCPOLsSRtUcC+BsB2p/JaTITOo3vPrKEAYkir4RRalqZCv5wkrI6wHF0gzm3p7u2AmOikvhh9pTsBqjtcKq3K/Bc1WCzb4Sj/oObMIlrUAEofXhxij245taTIJONXK5IaNREsII02c+DHTZdFSfxR1rjrqbW5oVRJqLQO9nHSuPasWUqY4yf2NP0XijsocWm5dDHU/+oxXWGLkzYpS2lPnXKBV/jQLYFywBNm5buWmQwz0YSOUoeQ2xIbhWYa5YLtx17Wb9SxOnsiNZCjBXGzaA6B63raRA86frJ1sfSOutOTEfNdCtNp7o7R0JsykllQhtzgkVMbXwS/JE4UG1EGr9e+XASyOkVI7O+Pu2V15/hqGScGeHfpPbJvMZg/vhfUd2zH6d0w4SKz/UD7OXTj2Gdf7K9QMSAPxX32pObYRYmnWK3JLK9gHIuUre+3oRh5ZZ9yscLAIvYSY0JM4mAaEl7EYchSSLPrMWteXyvaHEq9HuAGSVnvBzYBdNDmpwVq8UKpQ3A1hdUy938Ra78Glmcz/xgJQ32Y3ca9orazBdl5s2eZjx6GTpns4KKl9S6imYYlrJCKfoDzjqVp9WLsBYDYm01D/IN9yYDhv5NpyKM95iKh3afbSfsluobm1t+ijgI975Ri+7S/N2Af4WXRtHtWn7I48AxbMEfZJh+jsAohVz31mNBlKS1uGOBfNmGCGcecS8W6qEgz8SHZ4g=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB6967.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZHJqOXpBQjAzL2RuTGZvSGltTDlxVGQyUzllOVZ6YlRVMC9FMVYxeGE5TlF0?=
 =?utf-8?B?OWlndTNtQnVxeVdVUHRwLzZPdWFnb0RxeURRbDMrNG4wWW5zQ3Q0YXNEWGIx?=
 =?utf-8?B?RTI2RGoxSElpTmFXdW9yTTZrODkzblBkd2FUVTB2SXRnZytQbkdDT0tiai9U?=
 =?utf-8?B?L1dGWHZYMkUyN2dacmtHUXBZZ3V3K1UycGxiOXg2UTVEaGpTSWZPZHM2NnJz?=
 =?utf-8?B?S3B0M21EY2tCN1VaOEpOMSsxbkNaaGREb2swU2tWWXo4NEZzdEUvZ3psVnd3?=
 =?utf-8?B?a0psRGZGSS9qOCtRb2gzV2RacGV4Q1lOVUhsTlBMOUgyc0doSW5kTGNwQ2Ja?=
 =?utf-8?B?NE96YzhHSjRheTRNeGJZNmErcXZUMzYvMkkyc1J1ZHJhdkw0dzhNWnFKVHlT?=
 =?utf-8?B?NUtjaVFpYis1S3p0Rm1oWTJKRWdtaExFaGFpK2tRTXhDdENrRllIc0pSOGpr?=
 =?utf-8?B?U1p5S05HUW51NVVIbU1KOWMxTXBxWlRycUt0b0E3QnExZTRoTDlSZkl3UlZE?=
 =?utf-8?B?QlhHelJOeWF3c3gySjhsRmdzbDdiTFNnN2ludFVLNkFPU0U3amJPZG9LT3Qw?=
 =?utf-8?B?aEpsRkJoUnUrcUZ0YWRpc0l2b3hoZVowZlJzbVNheUd5aWlvbjRFTzYraVIv?=
 =?utf-8?B?dGd2K3dDTlljMkZlRWMwbGxhcW9hSml4akVZWTkxS21nbjNwWVg5cmdud2p0?=
 =?utf-8?B?UFg4WlZGdFpmV3JYR2liejVIdXdBUDhPTExNcFR0VmFCRm8xN0piRXh6d3hy?=
 =?utf-8?B?MzlIeWdLS3MxM2x6bUxwUWtMYk5oRzJtUEFDcGxyYXluN0t5ZkczWXdQUlQy?=
 =?utf-8?B?cXF5K2hFenhDZFUzMWN6dlBnenBldDhiVVdLOVp3azMrZFlzZ2NLL08xVHhw?=
 =?utf-8?B?Q0xlQmRkQ1EybHlHWExrVEI3MWptTVNnUDg0RjBZZjk0KzlnVzBiMDgwZkJX?=
 =?utf-8?B?V091M2lMWkxaaWh0dWNtVHlXMlBPdHBsVUVqWERWZUJ3a0pXNC8xMlhqaFRO?=
 =?utf-8?B?SGtCTmx4bktxd0N3a2V6Y3JVRjVNbk50RE52a2s2SWxIZDZ6U1pFQlhrRnh4?=
 =?utf-8?B?eHM1TGNqUEFRNHJDRU43dE83QXFSU3ROUUJUVi8zU0xPeEJjT1IxelBBWlRs?=
 =?utf-8?B?aDRzVDYyeFN3b2xGNVVkRXZtdVNWTzg3VzlzZWUwdFR3dGJudU1ZSklJalh6?=
 =?utf-8?B?OVRNc3pYZXlYZEVRZEFyZTc3eVBONEVCZEFPeE5GeGp4eXJRMEM2T0ljZ1hw?=
 =?utf-8?B?NjJXZS9oV1lMRjJJTWZFZHF5WlFXQnNaeGpJRmZ5NDRKVytUOGlsWE9ub1Rp?=
 =?utf-8?B?MnlLbjdabHZzNzUrTHA1ck5LYWpPOFZIVU1nUlFRakRXa25BNG9ZcEhqMnZ4?=
 =?utf-8?B?WUY0S2xBSWg5V202U3hDKzJSNTRFQnhkemp3KzZXb1M5UUtpWTJOZVZyekgx?=
 =?utf-8?B?YTJqbGlpVFpWQ3N3ZHdWcE15RFJsd1ZNbTJOMWgzQzYrNjJtZ05BSDZGODlm?=
 =?utf-8?B?SGo0YkNERytGSk1qZkhFbjJ6TVRJMDEwTmdvZnJ0U1FqYmd3czNCUWxqUits?=
 =?utf-8?B?eFNieFFCemhudUNsb1owOTY3SzcwbmhUWEN4TkQ5RjNBQ0hXYzY0SldXaDJj?=
 =?utf-8?B?N2xMUVFCR2VvTTJodGZxQStzQXBzWFhxWkQ5MFM5dU4rcU5UZ2JyQUtrbW16?=
 =?utf-8?B?Z2NvbWtRL3pJWERnZDFqNk5PRWhqNElWbzUwTW9YRHBaVUJqRWZlUXltdXho?=
 =?utf-8?B?WHhXL0F0RUR2M0VFT1dwMjk2K1dIcU9xYitxTy93SG5YYXRiOXo4MnMxRVM5?=
 =?utf-8?B?eEJyRExkTWZNRlQxRnd0VmhJQVgydzR0cHhiWm85VFVQaUhQSm1Mb1B3Y20w?=
 =?utf-8?B?UE81K1pLMEZOZ0txZGxGMjd5TFFMUUxneFZtSG8rYzRSUk9FU0gvZnRweTRM?=
 =?utf-8?B?WlB1YjRxR09EU3JNR1hkTWJzVFdzanloa1hKMmF5M3lRc1grUHRSV3MyeWh5?=
 =?utf-8?B?ejhXRStjYUQzQzlHUHNjZXd2a2xxQjgvM1lQMjRGZk5zMXVZREpWY1gvNzhL?=
 =?utf-8?B?T1FtL3dTRmxjQmNZV3oxcFJ0WjYrL3oybm9QTEZZa1NHK3hBaVVack0zZ010?=
 =?utf-8?B?Q1UwMGg4YmVLRGhKdXhUaERSbUtzV3N1YVFQelRPSHVyQ1VVM1FPS1hLbmx3?=
 =?utf-8?B?MGhtWHpDbjgrNDNOUFZ6c25OU05USUNJeWZjUXliQWlNTXBRVngxazZRaGs5?=
 =?utf-8?B?ZFJEalJrMi9QemE4L2x1MDdLbXlKZGFKVml1L0FCZHJTNng0aWJFRzk5Yms2?=
 =?utf-8?B?SEJoNjVCYThSUXRpRHdhWm5TOUFoRnVyUTRoRFVGWUdlWjN4dURKVEpJOWQ3?=
 =?utf-8?Q?CPqrx17XCsYV4x4U=3D?=
X-Exchange-RoutingPolicyChecked: qcXI3TLVuryYZCeRZcGWGGgzeIAu2LIhf3uU4MPfC14VhTNfb1Qxtg+TeNBKOPIAY+EIsHCG1Pd6Do9YrgmneMpYOfj1e3IIjv17uFjj9d58ghPF6m60daKO7JhI2jZcUuB+eHB4ZqC8VmtnG0saofjfdPwpoEOwNk/5VMrSzX1+2e2z1hWXfrnEKHjZSKC9TV2a0ZM3iGU6WJ9Us1i//k6CxYTOtHAATOn8SFsrBuxI+rFYpjme+SqcXh2pdsAWsLrf/Gm+OFRpdGtyzYXqo26tMFikXrmZH0X68r+gx0ZWASWogF3vfrQgD1QGvbPJ27Zwdtf/ygi+riiA7uMvFw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1366042b-a34d-4014-af5a-08dea4707173
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6967.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 15:19:58.2796
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OYrSskb3+wRJ4riEBsvp5UHgOzY7lvCFOCQgnuqix4gvubZo0tdDeilHj93/mXoWCmbLoSTWtrtkWztb1VR0OIl0EL6LvEUFYS1nt41AG3E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6603
X-OriginatorOrg: intel.com

On 2026-04-27 4:46 PM, Sachin Mokashi wrote:
> In snd_cht_mc_probe(), &pdev->dev is dereferenced repeatedly throughout
> the function. Introduce a local dev pointer
> early in the function and use it consistently in place of all open-coded
> &pdev->dev references.
> 
> It reduces repetition, improves readability, and aligns with the common
> kernel driver pattern of caching the device pointer at function entry.

One nit below but it's not a strong for v2.  For the patch:

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>


> @@ -450,12 +450,13 @@ static int snd_cht_mc_probe(struct platform_device *pdev)
>   	struct cht_mc_private *drv;
>   	struct snd_soc_acpi_mach *mach = pdev->dev.platform_data;
>   	const char *platform_name;
> +	struct device *dev = &pdev->dev;

Weird location for this declaration. Why in the middle of nowhere?

>   	struct acpi_device *adev;
>   	bool sof_parent;
>   	int dai_index = 0;
>   	int i;
