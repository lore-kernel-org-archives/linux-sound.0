Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2086.outbound.protection.outlook.com [40.107.102.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 769B94A08
	for <linux-sound@vger.kernel.org>; Sat, 28 Sep 2024 06:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727503502; cv=fail; b=rPhiG0aZ54vq3T4QufQ70aONRUO2W6Rg6rq5Tyip2NZXb96adSOuSeJKmGd8E8ZeEPDDnS68ptokM0tOWNkmzeOFuUdBThtNWunk5BHn7/1P95ivZv3gCjK0XGe6Rm3hY4iu1xFStHZNmrgWjwTwVCwo+2WcSGF5ofVwghIhKFk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727503502; c=relaxed/simple;
	bh=Q9TS8bgqMOeY499mJNKHCKimfrE2kiArjojYJ43bnEU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=cBSobDtvf4uqRbYIT64uXk6ujrXI1Zfk7jYudUsIvrgTpXiMUqtyeqKtsShMNWgTM9AW9QTibQQvMBwtu8KHjBN6uBrhE9CEof1SdieFMxMJbNw+Px/bqjRFxuia6je3X+QROuKImyJPxoBoXdn2o23KaTV1rGRv4/HlJVEmFr4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=RcPEhNVn; arc=fail smtp.client-ip=40.107.102.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="RcPEhNVn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gE9r1f0seezkNSq95TjZdFRap9Iblsp4pdXwoJF22WHOXwX4GamfUqM/6S7LPRpR6lsYBoEYiTj/RD2KX/kSeIO5e+EdMw5EgAssUn5yHNcy58da9sub9cAe5VnMyHJMmvVoQty8u5n0N5+CSsVjQu6+MsZeoFEQ+HiwuX/hQ8dOWzXNuOoWN4UVEI2B3WWwo989RG78UZkx/ZhWWgXpVfPakdd89nkdcpBoyWpW63XSr+8SbitBKLVuQwWVdBPaNhK+SPeaNuq1Jnz7k9b/OwMsVQaCfxQpVTkDv37zW7MZBgEofkGgSgJGKnfVCnK9emPQxgOnvACPfR3K8ZBZSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Z9x3ENIT2pLi4F8m/oQEmSbXcs98+tGJRC665xYFXQ=;
 b=QFkl3ZI1z/RO0oNLCNjnEM55nbRHxPOZeKJ3fxwKGndKjuZ/w4El4VY8pStr0GiDQDHJq8rXc7lXsBNtZ+MCFurKTrWzu5B+WY0XOCtR/m3tgLEJYzcz7LZ0Ke903QoObXpQYk8NTuBV2OHARrsR4sTsL5q5JrZZJTDAAQYvSicjVwb2EPTebh/fMFAb39Q1NGBrMsUuKuW54hS5nsU9Vs0YDeN4Ah6rTuEYA3s53+68tu85sptbWrdMrWvjx7PGZGb6S4z8kVGk/SUoV4oONaCdmD+mnGzf/YRDTdAv/itIeLHEudVK1eFhHQB32WiJhU41ALxwrwiS1tB6hzAE+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Z9x3ENIT2pLi4F8m/oQEmSbXcs98+tGJRC665xYFXQ=;
 b=RcPEhNVn6uNMUh7Kts1uupG3OHwP9+Mgf222LGBLxQ3AEUad94NEXRT3dS8yv/rXlFqmsOSHzym11jArgEBBLyq37ltx5fglpKcjRwBW1+TT4zgq8RdxGusFyWkuhwHvCMOZzJ+6WbuHJidmZjruZKuOfYbinE+uFRaCjIuFEs0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4123.namprd12.prod.outlook.com (2603:10b6:5:21f::23)
 by MW4PR12MB6730.namprd12.prod.outlook.com (2603:10b6:303:1ec::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.22; Sat, 28 Sep
 2024 06:04:58 +0000
Received: from DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::512d:6caa:552a:7ebf]) by DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::512d:6caa:552a:7ebf%6]) with mapi id 15.20.7982.022; Sat, 28 Sep 2024
 06:04:57 +0000
Message-ID: <a201e871-375e-43eb-960d-5c048956c2ff@amd.com>
Date: Sat, 28 Sep 2024 11:34:50 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [bug report] ASoC: amd: acp: refactor SoundWire machine driver
 code
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-sound@vger.kernel.org
References: <f7a1ddf3-b089-40ef-9518-a8cfd986b8fc@stanley.mountain>
Content-Language: en-US
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <f7a1ddf3-b089-40ef-9518-a8cfd986b8fc@stanley.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0167.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:de::11) To DM6PR12MB4123.namprd12.prod.outlook.com
 (2603:10b6:5:21f::23)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4123:EE_|MW4PR12MB6730:EE_
X-MS-Office365-Filtering-Correlation-Id: b8eda34a-a678-403d-2612-08dcdf837aae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bytSUUtYQkg0dmIwV3ozbWxmZzJuaVROdmpPRmloNnRNSHVsUFpNbXhZWXl0?=
 =?utf-8?B?eVBRaTUyUUFVTXR1N0Yyb0FXNUErSHZocVV0WU9ZallidjFFSnRlZjdzL3ZI?=
 =?utf-8?B?bW5jSjVwbXV3SGVONnZEdUlVWFBJd2VTZXRRdm1CMWlVR09QNk1GQlZkOEhR?=
 =?utf-8?B?ck8zM1c2dUR1WGV6WktjSU1Qdjh3V1c0TzgvMVJQT055ZDNjMDlWUWNKOStE?=
 =?utf-8?B?YW4vbk1oZEFUMW5NTWhrc0laQjYxVmdqZmRISVRpdUMzaW5OK1NkUVU1QU1O?=
 =?utf-8?B?cWxEdmxMOUU0bld0SE9ieGdOR2hzZmkrNHh2RThDUktXZ3ZyUG5zSzZURGRR?=
 =?utf-8?B?bldyejV1eThKMTBoVDZDZHB3c0ZIb0JRa2xUM3BmNXBvZWpoZ3dvRUFRVVp4?=
 =?utf-8?B?b1dEcXZxT3o4RTVPdU1CZGhLaGtwUXpyY21TaEhZWHBrZ0o2OFNmNWJBTTV6?=
 =?utf-8?B?aFAwd3RTaVVkWldQMVYxc0l2OVRmMzEyTHZNVHpORDM4dm95eEtNeHpFNk5v?=
 =?utf-8?B?V0lmalI4OHFPVmFReFVhTVpsNFhMSCtEb0F3Ym0vYmJ6ZXl5OW11UGhuOXpG?=
 =?utf-8?B?aHMvMmpLdG9CWGJiSWlWSWV6dG9Rb0Y4bFBsWWtwMjY5MFdZLzZCVnArNEs4?=
 =?utf-8?B?ZjV4Q01DSlZEY1V5T1BId3F4VkNGSDlBUVhkRjRldjM0ZnIydVdYYzRYMDZa?=
 =?utf-8?B?TGEyYVcrM1hGN0dEMUVlaUtuU3lYcEJ5UmowbXh2NFdtTUNiOUVvZW1TT0h4?=
 =?utf-8?B?b3Q5aVA0UEgxNnl0REtGVk8vcVdOSU1kOHhPejF2eS81ZXAxdThob2lFczZF?=
 =?utf-8?B?UnNjY2VFd3ZhUHJjN2xVQ3JtZ1hFZWJMcm5qM0pKOXZyL3N5NUNaMlhHbklH?=
 =?utf-8?B?OVVja2JUVUdsY0g4R3lXT3ZDQ0NKRFJYY29NM0orbVAwbjY4NXQ2SGlDUU11?=
 =?utf-8?B?c3R4SWx3amJOalRpYVRFN2l5TXNENXp3cmxxdW03Y0RiK1k5M1lMMmt1allp?=
 =?utf-8?B?RnpZbzZnQzZ1RTNQMytzZTc0NVhQajQ2ZmNxcHgzWVJURnZ1S2U4QjdQblRr?=
 =?utf-8?B?Vk1mVlNzdDkrRU9meVR1eU45cWN2VWp3UDVDRXAvcHBzVzQrcTdyUHg1V2Va?=
 =?utf-8?B?eHZWYWNaNjBQZzBOc2UybFB2L2dCQnUrZzFUeWhjRUhzTUN3dkhCV2puc3lN?=
 =?utf-8?B?T3ROU3pONGZNc0MvakdnaUc2SXY1eFBNcUhNMnVQek5GUW9lOWRwdnRMR0hE?=
 =?utf-8?B?RHk1VmJacFo0MGJKSUxVWWd5VkUyeVRjRUZtVEpvS3pWSzVOeGZoYXhSeDdE?=
 =?utf-8?B?bVZ3Qmdyd0NyNnBZM3drdHZzSmdSRzJHZ3BBajRtTzlvOFNrUFdoaXBGMU5o?=
 =?utf-8?B?RUw5SmZLbVhGUHhVb3g1T3ZzR1ZUeEdTcHF4MmQ0bDV0bmxsa1BFWU13TlRU?=
 =?utf-8?B?clBIOUxRRXk1UWs2TTRaalEweDZjNGN6WTBZYUFQNTJ4eTVTMVlwUmx5SHlw?=
 =?utf-8?B?R21IVmN5NjZEek4rUGE3T05LeXpzdGprc0drVXNFYkxlRm56K2J1bnRwU000?=
 =?utf-8?B?ZjZic0dhQXQ0QkxobENsWXhCWDJiWVZmdXRWcU95VURBTmtCcXJnVXltZFBy?=
 =?utf-8?B?VHNVQ2RPNUlPK3BOQmgxRm9rVGU5YzRDM054dXVNWmFoc08rdncxV2FrTVJh?=
 =?utf-8?B?YUJFd2RDSWpxb3lVM0hNVzk5ZXRzellLSjZWMkZLWGZVZ1ErdGw1U1dBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4123.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WmIyakFSZ0pqeTlFQml5R3FiYUQrY25LQ2l2RXBBVkNCYjFsUFNiV1VCcHA1?=
 =?utf-8?B?TlhVKzF3a0FYaFRiSUVUc3d0Vkw1WldhS0M2NmZZYUhhdVZzL3RubjR1V2Iw?=
 =?utf-8?B?b0hCRHQ0T1ZPS2pVRmY1N2kwcklXZjlHQUNiMld1TzluejdTV1VqS3FMakFL?=
 =?utf-8?B?QXFIMGdTRmc2Sks4bHdXWk5TcE1HdFRGamRmZHlWS0owQVp1bGtuR294ZUdU?=
 =?utf-8?B?eStxSFdJd3A4bFhhVEYrL2UvamdSNWlmSHhpYjc0T0d0ZEZaSFd0WU9ISXVE?=
 =?utf-8?B?WC9ZZDZzbDV4ZjAxd0tYL1JoN0dRYUw2T21seU1LdFVmUkFTSjFTOEJUdHVI?=
 =?utf-8?B?ejBTdUY3cU9wcENvSW9tM1ozQW1QSkNRWjljUnJDd3BxblB6VC93MDNObzhY?=
 =?utf-8?B?M2RJbXp4MUxranppTG92bkhXaTF3YWc1aE93dllqMzV0N3VFTTdzZm9vTy9t?=
 =?utf-8?B?bUlJSUdrdEd1amsybE5WbmROMzRpY3NQV3dHNi9nTm91NkpwUWJDZy9PV1hp?=
 =?utf-8?B?cENTWWVNUTQ4cEJFVmZ1U3ErNlBtWXRZYkpIbmZHSDRMZTRKRkI5SnRLQkdS?=
 =?utf-8?B?R25ISzltb2cvKzFjYjhEajVMRmc3Wm1BY1JXUXlHTkFueUVNNzlHT09VV3po?=
 =?utf-8?B?S1VOa1ltOUFXZTJYSDAxR2o2R0hrcnJEa3FpWExnaWVNdDkrRmhxQkFoWndm?=
 =?utf-8?B?dVlZSkcxejBlY2JyU2NzdGMyRzE3RjJJbEgxWUhnNElZTWNzZGY0YzBHcHg2?=
 =?utf-8?B?TUIxLzRlMldUNnljUUxUTzJIOThMZ1ExeitMNkZ4ZC9rVWNaL0FsQ1ZnanBB?=
 =?utf-8?B?MHJTK1I4ODY3K1hGRzRIZ3I2YVVKRzhBZU9TQzNTeFQ1SllxcnU3a0QwVm5R?=
 =?utf-8?B?YllEdlhlbitiTm44VjliU2dqTWFHcjVRMGRpaXB2bjJjOHlyamRsUFovQ25Q?=
 =?utf-8?B?OVdEQXBxelI3aWJFQk80RXBFVUcraDFiTU9ydmZMNm52R2pzaTNSWTk2ZEZ2?=
 =?utf-8?B?bFRlTDRxSGQ4eE9FaUpTZ0Nqb2Y5Y1gydnlqb25zS1d4UUFZK0syZmVNcG1x?=
 =?utf-8?B?WXhTR2k4cThkNC9hYVB4TFk5RjJubE5DSVpBbWdNbTNjRlB3eHd4SUJKbXVS?=
 =?utf-8?B?bFN6aENiWmJsamt5ZWlqbC9uTkNyZi82SVlvdzJhTENTR3lmZDY2SGx4Lzla?=
 =?utf-8?B?VVRtSVdiWjdkUHhtQ2p5Q1ljaWFuNENPY21pT2I2Q3JKa2RXRFZwQm9NdUJV?=
 =?utf-8?B?Z0h3R1FWVXQ2YzJDeCtwRXN5eHI1V0tuVTc5Y2FzQUhDSFRLOHlTa2w5Wm1x?=
 =?utf-8?B?WUxMU1owdm1uNVpraXF3UStJaGxBYzczemhhR1JJTmlBSWc2eDJZaWtjd2Ru?=
 =?utf-8?B?ZklIdlFxSkFBVG16a003RWN0S0pvbTF3UXVXczZmVklYcTdrTDRTWHNhOXhl?=
 =?utf-8?B?OFVoOG1UZ1k2MWliRlh6R3l0VFNGdzRHa3VBT2VXOU5PV2NKZk4rVGJ5RHdq?=
 =?utf-8?B?OTRXMzI5Q1BxTHlrczZzZkFqR3ZiK0xGVjl5UFdrd2tFWE15RTVjTkRjK0xI?=
 =?utf-8?B?UGZHc1RxVTN5aWF3TXdzQmRwQlQ2N29GYzdOUDZVQlpvUXRmNGovVXlid3JJ?=
 =?utf-8?B?cnhob3hrODJqOG5aU3hHVis4YlBqRTBsZ0hDK2JCOUtmSHRwNElUTSt5dFVJ?=
 =?utf-8?B?MitTZUgyejk4aVlFZ0lJVG9hWU9zZ0N0QVp3R3U4ZVBsdjE0R0tTVzkzK3Jv?=
 =?utf-8?B?TDFRWWxhTUtxQzJ2OGllLy9nTGIyN1pnNkY5cGhhNlBVVy9Gc25zYmUvRHVu?=
 =?utf-8?B?cUtDcldUQm9ldXVCaUZJREZNQ1lhUkI3YlhHMzBxcDhDbzNLaDc0dGpVaGRI?=
 =?utf-8?B?QlpRR0FnT2JWQ3dCdHZKcmE0YzBPSzR3N3ZOYkFWQk5NQjR5OEJvRWNHSXZs?=
 =?utf-8?B?RjA3ZnYzY3djb3lHZEQyZzRzVFpQaTdUQm0za0ZOQ0FsMGtnRUhpQ282SEFs?=
 =?utf-8?B?NlcwL2wvQWpaSE9INWQxL1RaU255REI4dERSZTREZjhJRm5PZ1F6WEFkRFpJ?=
 =?utf-8?B?VmF0SDZtNWtVYUlMNkxhQjNDM2VXc0pxQVd5QnhTU1Y4V3NiSzRQdjdRMlZV?=
 =?utf-8?Q?WRRb4zOBi3HgIRK6eg+mrUOtG?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8eda34a-a678-403d-2612-08dcdf837aae
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4123.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2024 06:04:57.5309
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yVNxT4Gfig4K/8gHlXZmYy/TWhA1M4/Y/hrhrLiuKm7y9jtX5XGAIJJkrU8BY6cCfWkZ3ep0TBBn6a38Z4cQQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6730

On 27/09/24 16:09, Dan Carpenter wrote:
> Hello Vijendar Mukunda,
>
> Commit 6d8348ddc56e ("ASoC: amd: acp: refactor SoundWire machine
> driver code") from Sep 13, 2024 (linux-next), leads to the following
> Smatch static checker warning:
>
> 	sound/soc/amd/acp/acp-sdw-sof-mach.c:365 sof_card_dai_links_create()
> 	warn: inconsistent indenting
>
> sound/soc/amd/acp/acp-sdw-sof-mach.c
>     307 static int sof_card_dai_links_create(struct snd_soc_card *card)
>     308 {
>     309         struct device *dev = card->dev;
>     310         struct snd_soc_acpi_mach *mach = dev_get_platdata(card->dev);
>     311         int sdw_be_num = 0, dmic_num = 0;
>     312         struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
>     313         struct snd_soc_acpi_mach_params *mach_params = &mach->mach_params;
>     314         struct snd_soc_codec_conf *codec_conf;
>     315         struct asoc_sdw_endpoint *sof_ends;
>     316         struct asoc_sdw_dailink *sof_dais;
>
> Just declare these as:
>
> 	struct asoc_sdw_endpoint *sof_ends __free(kfree) = NULL;
> 	struct asoc_sdw_dailink *sof_dais __free(kfree) = NULL;
>
> Then you can delete all the gotos.
Will fix it.
>     317         struct snd_soc_dai_link *dai_links;
>     318         int num_devs = 0;
>     319         int num_ends = 0;
>     320         int num_links;
>     321         int be_id = 0;
>     322         int ret;
>     323 
>     324         ret = asoc_sdw_count_sdw_endpoints(card, &num_devs, &num_ends);
>     325         if (ret < 0) {
>     326                 dev_err(dev, "failed to count devices/endpoints: %d\n", ret);
>     327                 return ret;
>     328         }
>     329 
>     330         /* One per DAI link, worst case is a DAI link for every endpoint */
>     331         sof_dais = kcalloc(num_ends, sizeof(*sof_dais), GFP_KERNEL);
>     332         if (!sof_dais)
>     333                 return -ENOMEM;
>     334 
>     335         /* One per endpoint, ie. each DAI on each codec/amp */
>     336         sof_ends = kcalloc(num_ends, sizeof(*sof_ends), GFP_KERNEL);
>     337         if (!sof_ends) {
>     338                 ret = -ENOMEM;
>     339                 goto err_dai;
>     340         }
>     341 
>     342         ret = asoc_sdw_parse_sdw_endpoints(card, sof_dais, sof_ends, &num_devs);
>     343         if (ret < 0)
>     344                 goto err_end;
>     345 
>     346         sdw_be_num = ret;
>     347 
>     348         /* enable dmic */
>     349         if (sof_sdw_quirk & ASOC_SDW_ACP_DMIC || mach_params->dmic_num)
>     350                 dmic_num = 1;
>     351 
>     352         dev_dbg(dev, "sdw %d, dmic %d", sdw_be_num, dmic_num);
>     353 
>     354         codec_conf = devm_kcalloc(dev, num_devs, sizeof(*codec_conf), GFP_KERNEL);
>     355         if (!codec_conf) {
>     356                 ret = -ENOMEM;
>     357                 goto err_end;
>     358         }
>     359 
>     360         /* allocate BE dailinks */
>     361         num_links = sdw_be_num + dmic_num;
>     362         dai_links = devm_kcalloc(dev, num_links, sizeof(*dai_links), GFP_KERNEL);
>     363         if (!dai_links) {
>     364                 ret = -ENOMEM;
> --> 365         goto err_end;
>
> Missing tab.
Will fix it
>
>     366         }
>     367 
>     368         card->codec_conf = codec_conf;
>     369         card->num_configs = num_devs;
>     370         card->dai_link = dai_links;
>     371         card->num_links = num_links;
>     372 
>     373         /* SDW */
>     374         if (sdw_be_num) {
>     375                 ret = create_sdw_dailinks(card, &dai_links, &be_id,
>     376                                           sof_dais, &codec_conf);
>     377                 if (ret)
>     378                         goto err_end;
>     379         }
>     380 
>     381         /* dmic */
>     382         if (dmic_num > 0) {
>     383                 if (ctx->ignore_internal_dmic) {
>     384                         dev_warn(dev, "Ignoring ACP DMIC\n");
>     385                 } else {
>     386                         ret = create_dmic_dailinks(card, &dai_links, &be_id);
>     387                         if (ret)
>     388                                 goto err_end;
>     389                 }
>     390         }
>     391 
>     392         WARN_ON(codec_conf != card->codec_conf + card->num_configs);
>     393         WARN_ON(dai_links != card->dai_link + card->num_links);
>     394 
>     395 err_end:
>     396         kfree(sof_ends);
>     397 err_dai:
>     398         kfree(sof_dais);
>     399 
>     400         return ret;
>     401 }
>
> regards,
> dan carpenter

