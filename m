Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.200.40
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795599207;
	b=g882yKY12GVVvXagM35veBniTajT48Z9RdRx//R/IxceFBRgP+SftKA04gTn5D4HC0wi
	 jjFcbiYR6cbVvFdDIHGAoCvLCjYpTBrEKwxu4c/9Wlo/lTVSpiLvaWMWcKg7V48WFUGuf
	 Og5tHgum6stxrCRLbz5yIf8t/C71LTa8vuAFxaNXbsG4CXRlc4Inn2p6QYlU92FXR2mT7
	 96c6KyQzNgIUr3M71qohhs+TnbYZSXHnqf1n5U6KMoGTWoEsVrBqmvQE2rb3FJoccNabo
	 TyHajhILcSA8COF/+2xuh7+TPpKXPG2AHZjE6eclgt2qiQ6km2AKTvP/PuF+gHAM3BA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795599207;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=x85ZrLgLVZ2u27nl2iDBCxCBo21vp5nUpjJyUnMXL6Q=;
	b=Urb1YrPKiYtbRD5Oi356lCBtokjjsfLToFibQzWe+4FPonBVnhWvphizueaRh2CreSV9
	 wZE1XXjcgzA9lTwOU4ksB9Z77IaDNcj+KExhn9ipB3rm0SHEOz4l38mF8o1OtcVk5lEAF
	 VSd4z3KVRv7OKwNIFAHLpJESl6redbvJPnxh/CGuHf67Kk2RPoTky/kG49jurl6fucWXM
	 4pt9S0oSEb4YkNBA/rLYglky+2w0HMl04/u6ur/FFqevZqQVWQeXyCovisdZEsPk2nLPe
	 SemSU7epJkt0TTbHFrgNSu/rfWW3fJThiJ25LEwQsu6/eDY764JbnfgPMF5sraipWtA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=tDrYchy6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.200.40
Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012040.outbound.protection.outlook.com [40.107.200.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD19B606A31E
	for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 09:33:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD19B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=tDrYchy6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mJRKZnaWiBuTqKpmK+G2U3yEiOwmz4EoqvBHQ9fjF+oogOtltDH++Dv/lrMyqfBk825+igvQdo1D0D4BRjPIPv5bE4kikRlXhqVWQW0EuPiDaeMX5n9mIci8GytBqsRlxkBx08x6Ih/FCgv1fNxuVN36N7awZZUxefL+oet+vB/tCUKbaA80/6Ri8KokxlRFIxCKN0NEczA/krajnxB4gKbRPeuW++HVaG7W5bcsTF03NEVbG/OAoZtrZv5KWmIGEm/FJxJ9ymRuAxoxZhvguqhBI47/rx/EW5eiJBaxP+Z3OSGd7P5q/UinBdRuDi2x94jBeWpTd3ZiWRNfUX79fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x85ZrLgLVZ2u27nl2iDBCxCBo21vp5nUpjJyUnMXL6Q=;
 b=gnLT0outkQI76g0M/nxbrRc0ifse0ZD0JZJCxGx8QjSqdg+/MSsQWBdA21SttR/YMpR0Tgo9Qu0JrnWTPNtdVYjUr7/0gzdG4qGee43QzNK4rEkkPmsh2CX9NucVK90v+bU0CvUX8G/NbGcZeoddKMkLwVrQeh2ocPH8a6YUVuVXFpm2oOYsItnP2b6J7vGQ9vY+QzpbVTmZ6Xe455Q1hKkcvelshUVnkJwGcG3LFvAwJBNJR6PCFGdGwehCCtPa7fadjNViTvPfmI1V29mkem7OWUqMrnzCC6/RcJ4qWyeK8za7HZmlap0QgtJXVoC+b6mBQLGaB5wvy7bLPwtkxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x85ZrLgLVZ2u27nl2iDBCxCBo21vp5nUpjJyUnMXL6Q=;
 b=tDrYchy6aJo7CzJoFF0TBd6BQRhxMvILoSxn2/hI80y6bg5ZWQGKhJlukPRrSN79QVnPUSzPt7PyXYEPDsv1VM5ME89p2gjZlqHvGSA2W0xk7l5bVmA6zJ1bURwGWXAQGy8FBqkVRVXKyicaODPfiM6dBpD3KXwVzu+imtd0jJ0=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY5PR12MB6252.namprd12.prod.outlook.com (2603:10b6:930:20::17)
 by SA3PR12MB7879.namprd12.prod.outlook.com (2603:10b6:806:306::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 25 Nov
 2026 09:33:23 +0000
Received: from CY5PR12MB6252.namprd12.prod.outlook.com
 ([fe80::ab00:d77:6014:64a2]) by CY5PR12MB6252.namprd12.prod.outlook.com
 ([fe80::ab00:d77:6014:64a2%4]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 09:33:23 +0000
Message-ID: <61c0a076-5433-410a-b1b7-247d4393bf01@amd.com>
Date: Wed, 25 Nov 2026 15:02:13 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: amd: yc: Add DMI quirk for HP 255R G10 (board 8D22)
To: =?UTF-8?Q?Alen_Ti=C5=A1ljar?= <alen.tisljar@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org
Cc: Mario Limonciello <mario.limonciello@amd.com>,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org
References: <20261124182329.20428-1-alen.tisljar@gmail.com>
Content-Language: en-US
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <20261124182329.20428-1-alen.tisljar@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0022.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:179::12) To DS7PR12MB6240.namprd12.prod.outlook.com
 (2603:10b6:8:94::13)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6252:EE_|SA3PR12MB7879:EE_
X-MS-Office365-Filtering-Correlation-Id: 39c8fc18-d9bb-422a-46d8-08df4ad72614
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|18002099003|22082099003|261009223027099003|11063799006|261028144727099003|56012099006|261026140227099003|261026121527099003|261022105027099003|10067099003|261021121427099003|261102123227099003;
X-Microsoft-Antispam-Message-Info:
	UIkzIvdoX6WtIM/ocBzSw0p7uWvQd+7FyJl0xkWD7e0F6i11eK53ZuIx+Yj1ysI1UGg1NwqS2roK4OTHpcPkMIfOU/fuBR/Q7eWejDEKEDwtpIo5TaQIGIbM4wnPbrV34E/9uroJmueKxDVx3BYe6Npfouxphpto+IHZClIYs8ysSPtroWbWLUYhgumBbuk+YOHMvcpVPaEZOMRSO8z9ilD8P6+m1AZ/Sn8ueO+EaUIyUW9NJDtinTzBhj/5G2BWPSnxgN4s0pfs1prAoae14FARwQ4Tgfk1yemlOKYZkgwLOVeOO4LsnFbWST8g45vNLXrJpBUDc1r5GPjmvqH2uB5BjPUvIrxmb76VGHuyWSXCrmxDS37vHzZMkWzOqln4BamFdAuJegpXGaDu3NHndhEfikxpilTrCoK+4gQplrs+bBm4o1Qg8wj25tIG2owA29xEoUy4yKXkOSs01WyDBFq3EiyW9FN/sBrNUK7Q9oELfrDybh0bowz5L3LQ5vo7g8Uo3rHJcwkAQXpqEQh6aBGXLMGcox1G/uqhs8lXWG0YaF2cd5BvVzxmggRBId/95XMps2jcWNpaV7goQemBaPflNE2x53MPecufLN6SYUCDUXa1G0gVnkOAbNhEWFdyxb0ekkZ948bSc0bKX6lA1NUB57U20PU4LlXubl+tq7c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6252.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(18002099003)(22082099003)(261009223027099003)(11063799006)(261028144727099003)(56012099006)(261026140227099003)(261026121527099003)(261022105027099003)(10067099003)(261021121427099003)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b1R2aFhFSmluMVUvS20zYjYwZStoZHI1SzM4VldOdW5XYTRvUlRBMEFKMlZu?=
 =?utf-8?B?SWN4b09kekdEMXdCb2YwZGdXRW9vT0pnanc2VTl2aGtYYkJWUDk3L2VabDBy?=
 =?utf-8?B?Qmh0cVU0NCtYeGZJWkhSVTZLU0djYWxxaXVHWDU3STlvRmZhbGJBcnl4ZTE2?=
 =?utf-8?B?Y3cxRXBLU1BWeGJnRzQweTFXR1diNlgwWUNqM2F4bXpyVHVFZFhVWW9CUDd4?=
 =?utf-8?B?ZXVqOHJpa2dLL3lsV0huVEdTOWZoQmthbnFDYnp2TXdQVnh4K3dzU2NTamxG?=
 =?utf-8?B?T0grQWJUeEZZRDJ4VmdhbU93eFFqcU5YSG9rOU9nVTA2RWFZc2l4VW9hczlp?=
 =?utf-8?B?a1RKaTdtVTloU3dnVGN2V293S1JzNHZCN050bHJyWmhEaGg2bXM3Q0FmQjEx?=
 =?utf-8?B?eVpJYjJCSk1kYVJ2UjBkd2VyUGVSNFdPWFBSMFc4TTNtZUI1UXJzQThEaWxJ?=
 =?utf-8?B?d3N0MFNKWUlzNGNjcEx6cHdjNGI5Y3lQekJXOExVdTlQRHVTY3JTL2JqMmts?=
 =?utf-8?B?dzlQcEtTRThlMHRUMUJacjRvMmVZVFRCdVd5VUNMS1cvZ3RDT2VZNmtEYTVI?=
 =?utf-8?B?Q1MwZFY5UjFnQm1TNVpYbVJZQXplUjYyeHZZVStEWFRJakxlam1ZZXRhdXN5?=
 =?utf-8?B?cEhMc0FYczVtZXNTR1pvYWh0UHJ2bXRnWElFcTV5K0Z3YUpTU2Fic1RzTGNm?=
 =?utf-8?B?MEswOVFJalRPTEdOZ1U1SkVJcFJrbVc1SWtScjVIVEVlRlgzai9zTW5GaTZi?=
 =?utf-8?B?bXRTY3pVUHRYeGhITTdMSCtEdHNBQk5hZVZ2MmdJWVU2NFdXWkdQU3N5Qkh3?=
 =?utf-8?B?c3hlWDNDS2JxWml0bGYzMlpMaVlkZlh5cWpkUFN6S2x1aGtHMlBVb2U3VSsv?=
 =?utf-8?B?eUdBZzMxQ2ptMndadXYyVHJiMlpyVTlxdDRBS05VUkg0ODZuSmx6c3VNanBH?=
 =?utf-8?B?MmpnSHc2Q1ZGTGtiekRuWEVsYk4vTlJnakVQMjJ5TUJCemJ4VGtCOEtacVdh?=
 =?utf-8?B?NnZZVGNCVElkeWY4alp2Tm9QOTVXWThUUGxlSWpQZ0NTZndiTjZ2RzFzdHhv?=
 =?utf-8?B?bEhnV2VHOCtvUHVjMFIrYm9YTkZxZC9aQWkyMnh0a0pScm9MT1VUZmdlUkRx?=
 =?utf-8?B?YkVFdWJuazk3QkovY0tFdTZ0RHI2Wk5IbWl2Z1MwejdlN0plWUR1K1pIQVNZ?=
 =?utf-8?B?R01OZW5oNGUva0FCRmZHaXlScnBmM2hOdStZZUhSajhFREJFNDBrdVpMYXFQ?=
 =?utf-8?B?bGtZSEx2T1JmWm9lT3Q4Y2pEdE1zSHI4NjVaUUNnSHRMdjJMdStyOUVvczVW?=
 =?utf-8?B?eldVMEhQbzF2TlZBblBRS05FcVlQYU9IWWhGZVc2d213ak9mbHhVQ1J6OURX?=
 =?utf-8?B?UlBYMThQS1pBejdMKzRFM0hTR1M2dG5mcjNDM0FZOXpvNFZ2bDd6bnQvS3NG?=
 =?utf-8?B?RHdIVllFQXdYa2FSMEpNdGJuQWg1ZDdkV2U2ZFNxTjhnOUJIcFZpRnF1eXFk?=
 =?utf-8?B?MU1VenR4R2tjUG9kd3NSaVd4Z2IxS1RkYmRwM1RlMG03VWJlRmErMVB5WHRK?=
 =?utf-8?B?YVZhN0I2enh0Sy9MVGNPOURTRVJNU0JDNGd6N3doM1BYby9TLy9wU3ZoVEk3?=
 =?utf-8?B?MzUyZzNKVm5Wb212cUxrbnZqTXVUNzVpOFFrQlpsSmVoU3BZT2dPTDNkNHM5?=
 =?utf-8?B?SWc4VUJzMjlNWEhQK2lSeWlzMlJ5ZUVIZ3hrUklwbDE4SCt4OXZEbkJlWGVx?=
 =?utf-8?B?ajYrY2ZtdCtYTkRFVjRXMmFiMlcyZ2U3dzBNWStSYmo2ak5rUHlLcm96VXk1?=
 =?utf-8?B?MWNyZ3gwMDE4dE5RcVl4em1nMXRwOEdUNnB2UHBURnRWamRFTzJvdVVpZDN2?=
 =?utf-8?B?TjNmOGlYNU1BY1J3WUYzQjFsV1V6aEpZZzU3NmFBYUYyQ1JEZUlqTGE1RlR2?=
 =?utf-8?B?YjAwYitMd1J5WUZmeDlmY2ZxUUpRMFc5ekJYdnJSSVcyOTI5SGh4Y2VtYXEx?=
 =?utf-8?B?Q2VrK0VKcitOcENSMUlxdnFWODlQOHhnOHplTWx5bi84ZmJhbVZXR3BQQWFW?=
 =?utf-8?B?SFFHSDRQNzNEeXVOZXNOd0t4NE9GWjBGbFZXZW5XTFVsNkFEeURocDZ3RGtp?=
 =?utf-8?B?aUMvSHJVWDVXU3ZTckVVc2NUaHB0Y294U2E1THNEQ0p1d3gyeG50K1hTUlRp?=
 =?utf-8?B?OTdqbWRObllWWDZjOHNyL1Q4ZkxIUTF4S1ZiNCt3dThLcU1GaTc2TjJXcDVO?=
 =?utf-8?B?VzdZL2NoTUlGaUg2UEY2MzNsUzZuMG03ZC93SGxIaVFwRWJMMGd6SFRyeElh?=
 =?utf-8?B?M3QwU3Y5K3FPR0RLVzFwS2ZUWTBLOU1EZ3d3TFFyZHVRM3lpc3RiUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39c8fc18-d9bb-422a-46d8-08df4ad72614
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB6240.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 09:33:23.4081
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BYe/G0hb9XRHeyDoZcvZsmJQ82NHRKy3sBuNDWqCo35xR06zc+yEsas3SqueF0o9lJnLm5/KGmt+P2fEdkkTlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7879



On 11/24/26 23:53, Alen Tišljar wrote:
> [You don't often get email from alen.tisljar@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> The HP 255R 15.6 inch G10 Notebook PC (board 8D22, Ryzen 7 7735U)
> has an internal DMIC connected to the ACP6x. Without a quirk entry
> the acp6x machine driver doesn't register a card and the internal
> microphone doesn't work.
>
> Add a DMI entry for the board to enable it.
>
> Signed-off-by: Alen Tišljar <alen.tisljar@gmail.com>
Reviewed-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
> ---
>   sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
>   1 file changed, 7 insertions(+)
>
> diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
> index f636b5ba5..9dcb98160 100644
> --- a/sound/soc/amd/yc/acp6x-mach.c
> +++ b/sound/soc/amd/yc/acp6x-mach.c
> @@ -731,6 +731,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
>                          DMI_MATCH(DMI_BOARD_NAME, "8A22"),
>                  }
>          },
> +       {
> +               .driver_data = &acp6x_card,
> +               .matches = {
> +                       DMI_MATCH(DMI_BOARD_VENDOR, "HP"),
> +                       DMI_MATCH(DMI_BOARD_NAME, "8D22"),
> +               }
> +       },
>          {
>                  .driver_data = &acp6x_card,
>                  .matches = {
> --
> 2.53.0

