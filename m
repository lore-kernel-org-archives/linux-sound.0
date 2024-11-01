Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2043.outbound.protection.outlook.com [40.107.102.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CAC91C8FD3
	for <linux-sound@vger.kernel.org>; Fri,  1 Nov 2024 16:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730477517; cv=fail; b=PRJHUVNVToIej/WARLpqFyTB3CAzfzK9KZ+mFkntBdKw+TWZGXSutvwFkvK+aKZtsDqFLd9PpUQ5z/W/Hv6xB1+Y85AbGJiZdyMRH3W6A/YXlSxF41eXTThnoVNaRiLrkYv0rgaohC/7WIuP/yc/ykA4K1qw49BMt5PqE1XheLQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730477517; c=relaxed/simple;
	bh=UGl1+A5sqQ1mRegI1F1AThSgAdfaD9Ez3c3nuFW4gI4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=nVMgtZihF4bLCTDAgVMOGjudlRkTO/MXWvMYP5g67u3UZifqU2TOE3GH+o8UmL46Ksk1Foq1pIeZ0pI2Wq04Uvj6p/JrAIjFQuTyuaJEZTsCgDMu5aY9nkgiKQ6T/2/DRDxpF210383LblgLCyR0j6hO1c7AtlIl3E+9CwNkzsk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=jlPChAcI; arc=fail smtp.client-ip=40.107.102.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="jlPChAcI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=efKzClNfu/2pVOCmtzWiY1lcxcRmxIuuciM6o7iwbET0xlNoMn28Wb4NPKGZS90Gc+N05NwKzS0b7q1cc/6vD5fXA4IFBDJcWKJIi5qMwfm0gKj3ANa1jDFcjD2S6gsEco+vqI0RqdUl81Az1xi/nZKxvvIk0r02B2UPjxwgtYREpPccDpVnzC5il9gi7Bzu8MGbcJK6XYu5V4al5KhwnXjNOZ6YUTq6tIBe6tdaUst2p1NB98Q0lwRdtxajqUgHPkARI99DLryNCHNb3y3J1FRPm81U738EXvIRfdmr/nPT5gZFXPD7z00u4b1Y4Vuh2WhGrkz1fhq6d8/I20v2EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3GE4FczqRPRO+f1BMDu8PmWYT8O6nmPVgWMPhVr9Xu8=;
 b=GOPhuw76kdkd1XVpRdGEeWQDln7/dmaUpvICRIZ5tNzkVHRDxqCD4QPN9lYfC7ZKRAO2VB4+WD2wvwNkOO/hiqRRCZ5qXu39JtNwlzI5rp0gCwurBw6fVtzFI9S2jm0v+Z4nL+yeIgvOMYmd4fvrV5GClYZpkUtctbW6RZkMzGMhcMwht+mRyspywg7OqOKCHUsO0yOzfQyiSo1bEx0kN4JGxxtckFJkGq0yxOHTC5pM/IP6wf9My5ZWOPj4vo44C0ChiZWWdiRqBR52MAUi9GHZ7wuAKYwcGOiLJ1XhudAqUAfOXElPbsdTZf1qLZ7zDy8bLnMfVE0beOEaIzK4tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3GE4FczqRPRO+f1BMDu8PmWYT8O6nmPVgWMPhVr9Xu8=;
 b=jlPChAcIq1ip3jWx75cNvDFacP6Wvlw4HI5xuTrQP7Q06YSrQ6JwmpJ5coHcoXJBreQv+jiNfcsGeM0jnLkpFLNwRQ7JIhv1qM8YOJP71mQhk/ku0UHpiWXhoA9X8t7eeWcPurYDGQ8mIIrS6bZtrRBww97DfR5fkQCsQCc2GHo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by BL3PR12MB6524.namprd12.prod.outlook.com (2603:10b6:208:38c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Fri, 1 Nov
 2024 16:11:52 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%4]) with mapi id 15.20.8114.015; Fri, 1 Nov 2024
 16:11:52 +0000
Message-ID: <b67ce3b2-dca4-483a-96f5-aeaee8deb5ec@amd.com>
Date: Fri, 1 Nov 2024 11:11:50 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: amd: yc: fix internal mic on Xiaomi Book Pro 14
 2022
To: Mingcong Bai <jeffbai@aosc.io>, broonie@kernel.org
Cc: linux-sound@vger.kernel.org
References: <8bad41b7ddbc8e061f682ecdf00a50e1@aosc.io>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <8bad41b7ddbc8e061f682ecdf00a50e1@aosc.io>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA1P222CA0053.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:2d0::27) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|BL3PR12MB6524:EE_
X-MS-Office365-Filtering-Correlation-Id: 476bd30b-c50d-4d0b-93ed-08dcfa8fe5d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YStXdElxK1psSnpROUZ3Z0hXSFFEWndBWHJ1TnJhcWd1MWZ1SmxTVFU1VmJ3?=
 =?utf-8?B?WW5PS2ZFOWVoNUE3V0l6akNaalY3a0t5cjlrc2ZpMGMyd3ZUakpHcERxNTNY?=
 =?utf-8?B?TDRtK2MvTit6UituREdlOVRSaDVzdXZYZDQ5R0I2dFhiNHM5TXlRdi9jL29H?=
 =?utf-8?B?T2ZKZTBFT3dzenpqeTlicGlweDF6ZzU5R1REMXJ4eUhCT1BXbmhuMHNQeTRT?=
 =?utf-8?B?SUg3RDZuS0VhZDM1M3cxQjJ4dTJTUGNOOUUxckpNVXZYMUs1djZSeWRmeXE4?=
 =?utf-8?B?WUJmMGZBL09ROFNUZmpxcSt3bU16WG9PS1pOU3BTWWRZcmtqTEhXNFBKRjRp?=
 =?utf-8?B?MlJIMjVVYi9DeTgrYXROTEs0MytwYVVDblZ3amc5VitQUy8vUDJHZ1VKTStW?=
 =?utf-8?B?YTlwaE5SUWsrcm5MZGdhWTB3dnd0aHB0Znl4YzhpTjFVcEpuc2w5bFB6eWJU?=
 =?utf-8?B?MFkwNXMyR1lCM3FPRVVocGIwaEIvdk1hTVR4THJGTEF0UER1ZzNzRkd3bnJa?=
 =?utf-8?B?ZnB4MXY1NVBNYXFzSXpnVVdscHpBUVBVQXpwb0FvMjR0UGpLbXA1YXo1MnZV?=
 =?utf-8?B?dFdYMk5hQ05sZTBlT3JSZXZjb1phNTBHNk04ZXg0a1V0WUhicFZoWHNGSzVZ?=
 =?utf-8?B?NmZHQkMwYTRxVWJ3aGw2YlFYOEFBdHdLVXNJSGdsTTRtaWtDdXVKSEdUcDcw?=
 =?utf-8?B?azJ5SmxBZzhtUHNHZnQxTFF0ZklWTTdRYUxYTktWRTZhM2xQZ0kyRDUwMmtN?=
 =?utf-8?B?KytCNDA2ajltTThWblBIUGRjc05vZm4xeEpTN0dVOGtlU0hrWTdNL0JIK04r?=
 =?utf-8?B?K2w1WE9ISGVZM3NGMm80cTFRSExqdjI5bkZuV3dwaGg1TVNqTk0yN3kyUUhx?=
 =?utf-8?B?ZFBMNGtWcHFKejJBa21CSVl5WUJCNndmT3UrNkNzcVZEU2sxVE9Cbk5VSjBH?=
 =?utf-8?B?Y09JcWEwNTd4eHRHYkR2SSs1Z1dNa0JadEt0OW5IcVpJQ1k2eTJnN1NnVDRR?=
 =?utf-8?B?WnFqblBpNTJBUUNIRDlnQW51SFNJSVlXa0U4bEU1ZVNHY2RWRlVkZUwreEp2?=
 =?utf-8?B?SVkvaWtHbXArQVV1bzczalJnY0tUQmNMd2Z1TWdGajU2S2RVZzU1WFVQU25U?=
 =?utf-8?B?Vkt1bnpuVVdUYXI3N0IxRFhNU3dKVFhpZ1Q3VEp5blg0eStSYWtVNVg0dkl2?=
 =?utf-8?B?aUVSbVpmOFZoajVONjhRcE1RbDJVV3YxSitLK1JRZW5BaStCYUgyZGtIYkFB?=
 =?utf-8?B?bUxyS3FaTThsM2twYk96Y0xiN2lnRm43Mk12TEZSMlRmK2NOemhxQUoxYTIx?=
 =?utf-8?B?QmUzN2RQUnNnOVhGMUpmVUpWcUhtMmJGYVV6OVZiYzROMmhJN05zbGowbmFO?=
 =?utf-8?B?TEVKZ0FJZmVwWFZlSmFYcEJXV1A4UWJmb1pBOEVqdVpzdHBaWmVtUU5jd0lz?=
 =?utf-8?B?UWpKaitqSlFhNjd2VjRwUzk2RlFMRDRHWkQwbDcxd1k5RkVXbWhza2MwcDBy?=
 =?utf-8?B?SXpDMW5rU1dJUTRscUdUV3Mvd1lHckFLK2dpODlSamZvZVZLMklHMnAvYjFo?=
 =?utf-8?B?ekZUb0ROd0JBSDR6MytlZ2xFelRLaW1DVUNjNTZvS2tUZFRuYjRTem5XY2oz?=
 =?utf-8?B?eUNHQi90THErTlRrQk96TVNSVXliZTR2MzA4ZGZBK20wZU9WNWxuRythd3hm?=
 =?utf-8?B?V25aUTVOeDk2Nzd0ZUdiMkhTZ0liYlVLdFZSTmlrNldRUkg5MFJDc0UxNWpI?=
 =?utf-8?Q?YjswXM9W4FuJYpcX8sg4BbcZizboO+eqrLCyk0N?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cFUwczgzZVg4UVNMRlhQU1luQWdyeFh0Ymh0SjZuODJxTDJvdGZEclZYK2Zm?=
 =?utf-8?B?d3RycFFSTVlzL0gxVFNXZ0NTZ3ZHRmhWeko2NWROSUpRVVNrMG9hcUNTQTBN?=
 =?utf-8?B?bXRHZ1hwT1F6ampHVHVaTW92K3MwdEhWVG1sZTdkK25yZ2pDSkdSdnRoS0xq?=
 =?utf-8?B?RW9jMUJkNnZMVk5tWlh3aUFrbTNlUmpCMUpPK3NBRGRoR2VEUlk3RWdyNHRh?=
 =?utf-8?B?Y0prcDN4ZUdiSWY0VFJnTldTSEx3bUhqczdiWVNnYVMrRlA0YjB0ejZ2SUlh?=
 =?utf-8?B?WmxUWkkyazdwZUkxWnYrR0JPcnRNSkVkd0d0ZWpHY3JKeFNSNEtpOXFqQXBR?=
 =?utf-8?B?bThGdmI4cHgvekVtNUpQMkpmd0JSVWxablhVWnRQVTVpRGlhcnFoR0psVG9K?=
 =?utf-8?B?bStqeEdRYTVSNFJVN2xhU1FxbFJKaFNzdHI5Yjc1b2hBekNxbjdwRlNBTU1C?=
 =?utf-8?B?RjV6QWhnT1dRUW1tQ0dKeUZYdzZPcXoxcjdIRmtKT2dhQWpiemVxMndQZE1a?=
 =?utf-8?B?SzNHOVRUSE5oSWtjeHViY1JUNDB6UTB3YVhNK2dIYzZWbUJ6NXVJQ3o2NWpE?=
 =?utf-8?B?VVdBaEhvWld3WmxvSHRUcHV0SzUzTm5JM2kzSS9uZDlEYWd4ZmJNQmxkT0Jp?=
 =?utf-8?B?ZUk5TzlicWZxUVdtNWNXeTRteHQvbGN6WUZQbXZtOENJSEZJUU9Ud3hlbDha?=
 =?utf-8?B?WHlpV2JDSllTZTJWZVI5Zm5vQVhDT25ZSVlSdWRhRE1iekdSM0hUZ09saGFv?=
 =?utf-8?B?M2lHZFo0dUZpcWxYN1JzN1FyZDB4bXlEaVIyREtxZnIyTHo3b2JyRTBuMmNw?=
 =?utf-8?B?emV5ZGV3c1JhdTUwa1Q0MEdKZDhZOEdYbFdwT09oUjhRMFg4bDdHQ3UwcWda?=
 =?utf-8?B?M1E1a2JGZDMvREFSUkErUERoekJKWHZBN1hKZnd3OC9yV05WMU52TFR1UHpB?=
 =?utf-8?B?K1N4OVgzU0duREFST2hIbkhFMEhibGF3c3lYcU5qVHdHdnEwQUEwNENnVmd5?=
 =?utf-8?B?bkEzNDdiUjBUK0pLbEtjQVlMNVo3aWxVc04xeWkwUlBNdWxlV2ticlFWR2t1?=
 =?utf-8?B?dTFPZ0JWOEsvSFpRSVBzU0xTK3MyRWRrc1M0WU1hN21sQVNsWEk4RDVDYXll?=
 =?utf-8?B?N3BvenNPYUw2Y1RrOGV3QVpQSmJYbkhPejRaajRhSzdEc1ZjUTUvTTJtTk4z?=
 =?utf-8?B?M1JQZy9VUkJ4K0ZvbGhsaHg3TmRVMlFqczAxQ25UTVpORXpmN2czNjZhSEpW?=
 =?utf-8?B?WDNhWkdlY0hQWkhvdXZibGpkLy9EZGFDaUIrVmN5U3Z5WmIzM1V0UVAzajZW?=
 =?utf-8?B?VjJJc3phR055R3hGZXpOQUM5NWtCSHlaTTNsM2xjV1U1ZmV6ZW5IdlQvRnJV?=
 =?utf-8?B?WlRqbDNmSmJ3MG5tUUdiTXhvR0xRNWJOWmFiZzFzM0dkcDBKTzkyVW9DWDRY?=
 =?utf-8?B?USthNzU0Q2kvVHVxVCtmY0ZZeG9mNmdFMnVlM3JCNDBCMmpBRTNLTlRIUXF5?=
 =?utf-8?B?Nkx5VWF2S3JUZWxONWhuQWZhNlRmYlpYcjlCTytTN0ZncHRiWjZsbUx5dncy?=
 =?utf-8?B?WGNEQ1c2WmJiNjhZWnA5bXFYVkZaZE8vdHprQjRWZFIrRFdBK0pwMmNxYkty?=
 =?utf-8?B?ZndzZDZyYStOMWtXOUQ4Z0xHWXo3eFh5TmhJMU1ZUFY1QTFmcUlySGk0Ym5I?=
 =?utf-8?B?ck5MRHFCUjFjVExrWTdtYStNdjRCbFB1ZmxRc0tDMk5XenNYL25NWW5rQ1pw?=
 =?utf-8?B?SU5lYUNZQWp5cEM4dkk1ZmtVcllBZmVuSnRaM2RtMmgyVW1EL3BLaWdnektx?=
 =?utf-8?B?eGJYYmRZMGp5bEQyczBSbUI2ZlVVV05YVGxvNDZzWDZaWkxpQy9QbDlJT1hX?=
 =?utf-8?B?UjZhc3V3d1RXUXd1OFpwSFJXZDBJbE1XQ3c4SHpMWW5VaDJlc095MDlsNDVa?=
 =?utf-8?B?c1lwWHhBbG5NT3d6TU9ZZGVLcW9uWlNtbHgxb3YxQm94QWkxVHBtUi9wWnBs?=
 =?utf-8?B?ZHZzdEM3NG5leXhzUXArMXRYL29EeEF5R1lITFRyWXY3b1hQckMwa0piaFNi?=
 =?utf-8?B?Q2pSYlJTb0t0b0VpWEl5UzZzcWpJUzFrT0xhSWJNWlJTU3Mya0lINGp2blh0?=
 =?utf-8?Q?qDa2r+3hKs0fmJPX9DcBSgnPU?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 476bd30b-c50d-4d0b-93ed-08dcfa8fe5d9
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2024 16:11:52.5232
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ucB3Q+S7PsQytzO6HtWHEe0y+qo8LjzcOSt+tkNxss3KqGmUED2nUdJv2BnQGl+7vdbVlQXWup4L1vbK9t4NjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6524

On 10/31/2024 23:35, Mingcong Bai wrote:
> Xiaomi Book Pro 14 2022 (MIA2210-AD) requires a quirk entry for its
> internal microphone to be enabled.
> 
> This is likely due to similar reasons as seen previously on Redmi Book
> 14/15 Pro 2022 models (since they likely came with similar firmware):
> 
> - dcff8b7ca92d724bdaf474a3fa37a7748377813a (ASoC: amd: yc: Add Xiaomi
>    Redmi Book Pro 15 2022 into DMI table)
> - c1dd6bf6199752890d8c59d895dd45094da51d1f (ASoC: amd: yc: Add Xiaomi
>    Redmi Book Pro 14 2022 into DMI table)
> 
> A quirk would likely be needed for Xiaomi Book Pro 15 2022 models, too.
> However, I do not have such device on hand so I will leave it for now.
> 
> Signed-off-by: Mingcong Bai <jeffbai@aosc.io>
Yes makes sense this is a Rembrandt laptop.

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>   sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
> index 438865d5e376..dc476bfb6da4 100644
> --- a/sound/soc/amd/yc/acp6x-mach.c
> +++ b/sound/soc/amd/yc/acp6x-mach.c
> @@ -395,6 +395,13 @@ static const struct dmi_system_id 
> yc_acp_quirk_table[] = {
>               DMI_MATCH(DMI_PRODUCT_NAME, "Redmi Book Pro 15 2022"),
>           }
>       },
> +    {
> +        .driver_data = &acp6x_card,
> +        .matches = {
> +            DMI_MATCH(DMI_BOARD_VENDOR, "TIMI"),
> +            DMI_MATCH(DMI_PRODUCT_NAME, "Xiaomi Book Pro 14 2022"),
> +        }
> +    },
>       {
>           .driver_data = &acp6x_card,
>           .matches = {

