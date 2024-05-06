Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2073.outbound.protection.outlook.com [40.107.223.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54E811F19A
	for <linux-sound@vger.kernel.org>; Mon,  6 May 2024 17:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715017197; cv=fail; b=MQp8suK+DJZesmUlEIrZ3lMd9n6WbtL9rgUb8bJvzY5U7EhoLW4F6PTjuU/Nm7JYdrvx/6yUod7TYR/XsVT0BUVk0qNb7wI0HWNADYExhRrubtIs2jHNO1Mr/XlhocTQlJC5h4fQIprTiEbHlsOG9fpicHjTFu9L3p3yZ2gC4eI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715017197; c=relaxed/simple;
	bh=CeD0BAnodYKwmPAAru5Le+fbGRRYcw1Vu0/R5mP7Eqw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=fWGHaAVOa9YT7MvBofpVvUlMXnCDcW1K1SouQO9DB3ELFpmZxOQnKk2zAKQfPucus1Cy2N0mLTMsxgh2i7u6cCQYNgkuoZrQbPdhux5AbOJ5s0n4DpRFfhwjKYrz5NILYQ0wi+DCXJ4IEsVHTj19OwmZkpU5pkLMjZZvZ48t35Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ce1f4p3t; arc=fail smtp.client-ip=40.107.223.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ce1f4p3t"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YpKln/HjEaHy3fdgOqksaJaT5H+HcuSOkfmj1JpDI02vRy9pW01jlle/yVma5b87hwYNkvTvriWwtPR+7wtS9vTmmGB5NmrahipIJP/sKjT13y0nq+ZKwnzHs/ZFY39rI96Jyx93cilrLLa5KkgHU6xd5r/98bh+SGTDn9zAX6VmDvs+tg/mojNm4sd/JkCatQYUZJozHjRXMKolLQXdt+mTgaybnBpiQzX48HfST1GYAJOXJ97lVeyWxWbkuzHxwkkeeGGS1ON31uO9T2HcvKH1qxiKDGTFFJQifmGzdDC4o8CRO6qS6EBJNO26dgNkBY8WgTRqYIRSF9hIY5Sfrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3kOvg/U7TPDgqWSXSD6pkJ96nZz8aBktv2cUtO09UB0=;
 b=Y5HXJh8QLABMBlBvZKqjNbWdikeo9OOw1mkyNkg7ZFl5mZfxpQXl13wYwn10+7YylotmC9hJZgtaR6/S3PfeHXc2lc86x0nxAbxUQPPlOZDy6LiuCkXrbYa1/Pa445E2l0h66TAT0Kgi4T7TSLVPZ+XQMH7GVJmWAi1DvhO7F771osVlmTs1JnVp/2DSWhWpcjgrRJMhNkBV6WbAkHs5ab3q2EwUAjoq+6+5L/5vUTdoLjHSJa5BxMW3VqGQsb1OlCbQIf948sBlxiq7EA+Xvp21nKZchQB2GWTXsyaxKRZ7nhw/t48Xz+l6H2SbDTccDhB1SfKaJncyFIT3xrYpMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3kOvg/U7TPDgqWSXSD6pkJ96nZz8aBktv2cUtO09UB0=;
 b=ce1f4p3tiV2DGB8t5Jq6tzPX6gvqMehXtekrEpxYl6lAx//0aeUMmfFL0blzENtyE9o0qnXn3T61uVq+/uI+CK62D1qCFAVGoRMF4aCkJBCjm1vGuBFgLdErEF7OPQE0gCcWLOxgGO+i8Yr/hciTR4S9YrBONeIbK8z85xOFzy3iBesETYmvzzIrkmuDZB8Mrwh9DdffR6n/29oMDh25j/8M97Ids5NJNvMbLJQGZtxv165+FFloLyUPUH/W8Gc8HDNrqS/CR71n3fF5myShm98jwYYGtpOImbU5Yx8+PossKDFVggPiIGEcskgDl6OxPJZI06/Bimb21Y4Xb2X6GA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4130.namprd12.prod.outlook.com (2603:10b6:a03:20b::16)
 by DS7PR12MB6215.namprd12.prod.outlook.com (2603:10b6:8:95::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7544.42; Mon, 6 May 2024 17:39:52 +0000
Received: from BY5PR12MB4130.namprd12.prod.outlook.com
 ([fe80::2cf4:5198:354a:cd07]) by BY5PR12MB4130.namprd12.prod.outlook.com
 ([fe80::2cf4:5198:354a:cd07%4]) with mapi id 15.20.7544.041; Mon, 6 May 2024
 17:39:51 +0000
Message-ID: <81d24856-cf09-4376-929c-d0bf7fa8e8ee@nvidia.com>
Date: Mon, 6 May 2024 10:39:42 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/alsa: make dump_config_tree() as void function
To: Jaroslav Kysela <perex@perex.cz>, linux-sound@vger.kernel.org
Cc: Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>
References: <20240506075419.301780-1-perex@perex.cz>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20240506075419.301780-1-perex@perex.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR08CA0046.namprd08.prod.outlook.com
 (2603:10b6:a03:117::23) To BY5PR12MB4130.namprd12.prod.outlook.com
 (2603:10b6:a03:20b::16)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4130:EE_|DS7PR12MB6215:EE_
X-MS-Office365-Filtering-Correlation-Id: d14f2ea9-c67b-4b3e-6e66-08dc6df388ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eFZJTnArb0duVHJMQTQybVo5RHZvV3VvUjhMVjZEYjZ1RktCY3prTVUyVnE4?=
 =?utf-8?B?dktBMmlnTzRIQjVMYU9FdTJRQkZSNWtudmRjTUxiMEZJc085anp3U1JiQ2h1?=
 =?utf-8?B?clZVU3NUQ3hiWWhFL2NHajlIcCszQlRGWlJuNG1JTFQ0UXlVQWxQclpRcVFB?=
 =?utf-8?B?Zkk5SVgzS0g2V3F2TkIvR2h4cVpmSFZpeGg2KzBkQ29Cc0lpam1JeDk5ZEI2?=
 =?utf-8?B?ZkRiak5uU2RQdzQwTGY1TnFJaUVFNGdhYTVRYUcveTRtVkc1RFE2cVJJU0R4?=
 =?utf-8?B?Y1c2U2NMM3FYdVZNRDNVOEVVY1BzQmtrNC9tSmZYeHNSYjdUZ1ZqQVgvcVhO?=
 =?utf-8?B?UG9BVlRteTdtQ3oydXM5cEFGemFoRU13YUEwTWtxT0xCTHNDcGpHbk9zL25Z?=
 =?utf-8?B?ZWlxcGRJbkhOM1FrVDZTVFBia2thU1VCWVRTMzRUanYxYituUlVUWTJmdkdC?=
 =?utf-8?B?NnFFNzd1aE9WQk9TeVNBOUhWMkszSjBmMFdoemEybi9lNHVLZHE1VGMyVmRU?=
 =?utf-8?B?bXowUkJ2RVlLVnh2TjA2TEtJUXV5OU5qRnRzaUJMeWhjaHdKa2VLOWxKcUFl?=
 =?utf-8?B?YmhObnJ3Vk1maXprZkI2TzIxSk5BT1NrdUhzOEcxbVpIMkhidDI4N3JIeUF1?=
 =?utf-8?B?TmVmeW01clhEdDBlMlE0c2pjak0ycW54ZEdIdlo5bUxwcmhteTdvYXpYZThx?=
 =?utf-8?B?T3QyalB2NEJJYnh5YWlPbWhVNE5oSis0cnVCS3A1a3dkSnRKRU9zYlZRR0R5?=
 =?utf-8?B?bkwyM3cxUmNnU3hQaVJrZzNobnVKMXNWT0s0dlE2aU1UWnhYSWNqNDdqM3Bl?=
 =?utf-8?B?WEVGSmpDVURSUFRDWHlGZFBWRjdqa2JXb0ZHcHhjdlF3ZmpTbmh1dDlPWSt5?=
 =?utf-8?B?Z0RRZ21DMjJZeFo4VklSbHlJRVpmRnRIaUxUWVphUGdZL1VPZ2F1djRwSFk0?=
 =?utf-8?B?NWYvZjJTWlVCLytCUjNDQWJiQlRxaXRoWEFDOTZnU3k1YVJlMW5BN09FUjdo?=
 =?utf-8?B?VFJVdVp3dGpJeEROQVVmS1pLWW5WRkhOc2VSWWlheEo0VGZkTnIvTTZMQ3M2?=
 =?utf-8?B?WW9UaXV3TTFucW1rajBkMFM2eDJ0WnlDYy9SUWV2SEE1K2QreTdqb2tKaHFO?=
 =?utf-8?B?ZVJva2I5YU1nWVU3WE5xN21uNklCS3V2NDFYSVExNFZLYml2SkxxNlNmbUhI?=
 =?utf-8?B?TU9Ud0xKbWhIbXhLbXJaYzdpVTZxUHFJQjNIYzNqSmVtM20xbm5CSnZYN3R3?=
 =?utf-8?B?bDhFUEhtOUROcGg5VU1qWW1GZTcvSXFscHpMcHBJL3pEeExXZTNLYWNFTTN3?=
 =?utf-8?B?eng5Qy9qdi83TEZoNW03MVI5M2txbVBjY004ZDY2UFBkZzZGcmFySFA0bHgv?=
 =?utf-8?B?SDRrbmY3am1NbHA1U1JvNnZuc2RMeGRzRk55SjYvazc5Q3ZVeEg1VGQyK0JX?=
 =?utf-8?B?RGNJakc0WDQ4Nk9pR3Z3Q3ZSMHFNUHFpbWNKQWRLRm1na0FnOWI2V0tkWXo2?=
 =?utf-8?B?YkZlL1BabmhVNWYwY3I0TTN1eVRXb2p3dHRzdEdGbng4NWRVU1g1bTR4eDE1?=
 =?utf-8?B?WmJGWUZNVDh0SnF5elNUWStXcGpSVjhxK0h1Y1laOWlqekkvTEJMMHFhU1Y0?=
 =?utf-8?B?WGl5L0ZpYXVwbSt6blRoL1dOZWU1Z21SNm1Ra0tHaWk0dFlKZ3RsUllzcC80?=
 =?utf-8?B?eVFTT1pqczlMWEF4WEFNMFBBb0lwaUV5SkhWVVdwV3pobWVtYnZkZFhBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB4130.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SDB4UzJVdWQyMmxnZXlzd1EzcU5NZjdKS3kyZ1RLU3Vwb0E2ellLNDQxU1hu?=
 =?utf-8?B?TUNkM3BzOFNySTAxS09MdnpYdjhzTnVXRDhNa2h0YWF3YUk4Ym5hYjB1N2hx?=
 =?utf-8?B?eHkxWktSM3l2UkYwNmdKNnBtd0t6OWVPd2pYNUp2Zm9OaXZZRFVMZXRnMFJm?=
 =?utf-8?B?aTVURGFCWUpLd3NUMlBtM1doRnhzS01SelhGdTg4Mmc5NkpXMTk3a1Bhb2xX?=
 =?utf-8?B?ZEF5UVlmdHY5eWd4Z05aenJmK1VSUStqWWVSYkJkWnplbHlWNGtFdmY4TUoz?=
 =?utf-8?B?NWFtdXFIV2hkbWFsNVhNa2F5bUlFWS9lZ0lFSkx1SlI5aUxlRGVaclRnemZX?=
 =?utf-8?B?ZEVoSVRrc2Z5Q1Jlc3lxYy9nZ2xnYmZONmljaTdrdVB5SUM5b0NKcFdWaFMr?=
 =?utf-8?B?RlQ0ZTZiTHp2ekxpUXY4NXRadWVKbDVBK3YwRHdqWVFBbmJHODRIUUVGclo2?=
 =?utf-8?B?Y1dPMC84cU05dUp3M1lGalR1bHQwSTZ3WklyY1BlWUc4eFhETW1pYW9BVGRM?=
 =?utf-8?B?Vi9DU1VzUXFNQkRpcUpKZ2NCUWRTV2lSWThlazY5REExUFhSM1JMb1RSalhC?=
 =?utf-8?B?WFJ4Nm8yL1RodWhFbkFiNndaY1N5R0hhenZDL1hVcWJ5bDhBbXNTMGxDREc5?=
 =?utf-8?B?VXc3TjZUUEFycFIxdlJLV1Z6N0xFSEJDc2lGdGNEN1JVV1l6dzVZSnNTYWpM?=
 =?utf-8?B?YnliZlFBYkk2QndST3hCdThGRzdvRnM5NlhQSnZpeEVXRWVuT2FBRTR0Tnd0?=
 =?utf-8?B?TUh1Q0xXNHlqMXFiVCtaRStlTXEvTFRBVk1zZVJ2WXlpWCt3VUdkS29laEhq?=
 =?utf-8?B?eTdSTk9kQ2w2OXhBWnIvZzhVWktwTEM2bk81SnQ2LzQ3bUJha05YSG5WMUNS?=
 =?utf-8?B?TVRWMG80Si90Y2RwSys0bkRmTFRid1NRc1A4VDRFUjFmZDVUdGltMjE5R1g1?=
 =?utf-8?B?WHQ2VjJRL0hGcVQ1MEFTR0NORDRtSks1SWJzVDlTUlh6Z2lZSStZUkdkam9s?=
 =?utf-8?B?Yi9ObmZjanI1K21UVGhmd3BjeStuRUZKeTQ2RmVnb1lLaHJBSmNnU2xYVmUx?=
 =?utf-8?B?eGN3MWI1LzkvNFpoc0xzRmZMQWo0WXlOc1lLY3BJZEU3KzBsa0ZscHpUd2hG?=
 =?utf-8?B?RjE3NXh6T3U5UExnK3dwTmxzSGlRcUpPa1BTWmljbXowbXlNcmhMY1lYTCtE?=
 =?utf-8?B?eHBuNmV3SEs5bDFsZlBNcE5CS3VsaDMwV3VaZmN5eS9ocHZGbjhhOS9xTzBJ?=
 =?utf-8?B?N1ZGMVRpcUNjbjdFQzdNL3BRcEN6TUt3Z2FDazBkNHN0WFdxS1o4S1ZuQjAv?=
 =?utf-8?B?bFN2WjYwOVVmNFcyOTd3SU5NQjc2SDR2T1FGN3lqd29NUWxTSDFqNXhjV1Vy?=
 =?utf-8?B?aVV5Mjh4YWdTVUpMeXZhSUxIUEQ3R0lCQkJ1eDE1cGhEYmxIZlZ2dE0vU1Z0?=
 =?utf-8?B?VzJITDl6YWpKbFV1MUQyZHQwSnJhWGVwMkZGR240ekY1ZjdzWVVkcUZoSmFG?=
 =?utf-8?B?SkZwa0lUMGJQSnpEc2pjYmQ0NkhHNG5kRFQ3a2N2NFRVOStWd0t2U3pNQzZM?=
 =?utf-8?B?RmtMMzlWVFlNTzZGNTZ2WWo5N0lkd010Z0ZxMExIWnowQThDMTk0ckhxeVJI?=
 =?utf-8?B?R2F2TnJyb0N3NkdOTVhlaHJOQlhLZis1SGRWQWp5bzVQWm9MeTI3QkphTlMx?=
 =?utf-8?B?YW1SZFB5NjgvbTN4MzhRZzI2SUsxWm8vM01LdnhWR2p3Zi90YkNRZnZZZXdG?=
 =?utf-8?B?SHNYT1J6M0tNcFpEOTJOMStRb2VmM3BVbThUTHZWbEwyM1pxUmVmbFJRTVNN?=
 =?utf-8?B?MmRaZmxIQUlUQnZkaXBrU0VWOGVNRW5yYkRpUCtFblkyTjdvMHNVOEZjbEFP?=
 =?utf-8?B?TjhtN2xkOUZuZWdOWDBsQ1hmeTJLb2tMMEZpTnlnTU1hZmJKWmozOVF0SWJr?=
 =?utf-8?B?TE9wYnYrVDB6cCtsbkNOUjIvRFgwL3hOU3NuOHFndU50c0VjUFhWV3hiRm02?=
 =?utf-8?B?bUV0a1Z4c0piMkxDSFhTcy9DT0VLeFhTbndMOU5RaHdhVmwyV2JWeDZVTU9l?=
 =?utf-8?B?RTFPZ3VCc2FmTUNtQThhY2EweGx0V09IVithU05yMk9XZTk0SnNMWllpallM?=
 =?utf-8?B?L2xyMEJGSmh5OGRwcGRIRk5aWEViTFRuUythMHRiZmFnU1dwcFU1bzUvMmVs?=
 =?utf-8?Q?tl2Y7Y3LcGstwG8zCMLmPbs=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d14f2ea9-c67b-4b3e-6e66-08dc6df388ba
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4130.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2024 17:39:51.9185
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zrc5KAWO6syeyECpk11AIQWWGMd/R0HPHXCd2XHq3aEU3cM9l2Q7ltFzP07CzRf5IMYHJJcHM7i7LvDx1RTGgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6215

On 5/6/24 12:54 AM, Jaroslav Kysela wrote:
> dump_config_tree() is declared to return an int, but the compiler cannot
> prove that it always returns any value at all. This leads to a clang
> warning, when building via:
> 
>      make LLVM=1 -C tools/testing/selftests
> 
> Suggested-by: John Hubbard <jhubbard@nvidia.com>
> Cc: Mark Brown <broonie@kernel.org>
> Signed-off-by: Jaroslav Kysela <perex@perex.cz>
> ---
>   tools/testing/selftests/alsa/conf.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/alsa/conf.c b/tools/testing/selftests/alsa/conf.c
> index 89e3656a042d..e2b3a5810f47 100644
> --- a/tools/testing/selftests/alsa/conf.c
> +++ b/tools/testing/selftests/alsa/conf.c
> @@ -105,7 +105,7 @@ static struct card_cfg_data *conf_data_by_card(int card, bool msg)
>   	return NULL;
>   }
>   
> -static int dump_config_tree(snd_config_t *top)
> +static void dump_config_tree(snd_config_t *top)

OK, looks good. :)

>   {
>   	snd_output_t *out;
>   	int err;

thanks,
-- 
John Hubbard
NVIDIA

