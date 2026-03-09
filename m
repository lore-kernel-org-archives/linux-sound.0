Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012000.outbound.protection.outlook.com [40.107.209.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3310321D3F3;
	Mon,  9 Mar 2026 05:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773034661; cv=fail; b=FFn0sVHBmRCQuf+AdS4o98LnVGlljsyiq+5HNo3QAbx650CoNhHZHoYW3pnGbH7ld82azsiFTpcVwUXw6fSoUSumLeIYtqLvKLqlXA1dQtKz4OXMjKj8OuJnMTU5oXBdBzvQsmqbx7b2geAoPXh/oGfkpPpHG0l6DGE0m3mgZZI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773034661; c=relaxed/simple;
	bh=TJsnWNpYgiB4A4UgiF7V33thCdk4ntNHT+p2MUv5JdE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ijLBcK0ImcNhH3SjIx1ZN9mjkUxCKrKv+DQvZi2j6URzOZVW+IouIPc6gGv8933kkmHiIf6sIRmXBOgWNdPIDgzOvLN8VJ1cCUrjNiniJYrZprclQDng8A4eTo+0vkjZIZTYGUni8vtKZmMOf/ulcpA9sENNnHaVxdDEqau5+CA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=R0NvwnDl; arc=fail smtp.client-ip=40.107.209.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="R0NvwnDl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=czzvE+RyjAk1Dz7DsFC9OgzCdzy3hp8DSbusVxEIRtJUGfsCwBCLYwfTrDcbcKzxU74epkpJy0Jt1Tb8o9cVHcmFzP4p6OkSFqVA7Vsnr/r6WS7ykj6SPedJQv0AitY44hehprSKnEjdCfQHaTlqewgYN9RB59GNaE5j3cigasdFPPlikN7LLvMfkzcIbAKpLrU+NuuPsCEg2GQtNlWMZcTK6ydTBQQyKI9p3Ezg9Oh/FdxG/iV+XpL1FAzttLiHZlI7KCZLksHgjZKRxYLQuAWVscc9X/ih8vcEUjNlhTnkqH7pINgA1PcCPMTpP/od5mqvExnOHCGgsDhVnVN83w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s3Tdw3iG1vNYwYbTX57iyJ6YQRRR1e25i51n4v8zFEg=;
 b=rbK89GnLO7a+kFXKIM0XCR2iwkshvzBF2SrnqfZY4Ths+GTf6HYZ2inoKpvMZkgf65M2OsSbd4opKCTVdiRMKDRWCnLAnW8YKbl5jJqlqLz7oAY8HR2dXXpe7bG6RofkcEI7lGxRHAh5x7aDoiw+cJcKt3/XyDYpdTQD+MwwkMh4gGFqCP0K2ZZnD8vq17qhKXszevImQ89+XyDebHZ7ln2AsLp1zwcp7BXmMAx+YUJL31dyTVzfJuNuUENYB1nw/m1fJWw0unRh0lTA4tLfm0IQzz8+g8tcKSh9uG1B57fHt82j47amKdKRlNv8PHxuuDy+A34/7D1SYMsJvZu9iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s3Tdw3iG1vNYwYbTX57iyJ6YQRRR1e25i51n4v8zFEg=;
 b=R0NvwnDlhpVPd6puJWSqsxRWa4K+2m0lCni5uLiG7ngfx0l53bnn6/mro8qA3xhA2dA+0EnoDB4p2Uf+RyEeoR6VGyjPmELHmUKaZOqDmdZ8kQvDxaWdO91Q0+IhEsDn+v4n2i96sehIHpmKH0y75m0L7UCo0MKe/raFL1Cf3pc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS2PR12MB9567.namprd12.prod.outlook.com (2603:10b6:8:27c::8) by
 MN0PR12MB6319.namprd12.prod.outlook.com (2603:10b6:208:3c0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.10; Mon, 9 Mar
 2026 05:37:37 +0000
Received: from DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5]) by DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5%3]) with mapi id 15.20.9700.009; Mon, 9 Mar 2026
 05:37:37 +0000
Message-ID: <53a03615-7a5c-4f1d-88f7-1e6554092946@amd.com>
Date: Mon, 9 Mar 2026 11:07:30 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] ASoC: amd: acp: add ASUS HN7306EA quirk for legacy
 SDW machine
Content-Language: en-US
To: hasunpark@gmail.com, linux-sound@vger.kernel.org
Cc: venkataprasad.potturu@amd.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, linux-kernel@vger.kernel.org,
 Mario Limonciello <mario.limonciello@amd.com>,
 "Gong, Richard" <Richard.Gong@amd.com>,
 "Dommati, Sunil-kumar" <Sunil-kumar.Dommati@amd.com>
References: <20260308151654.29059-1-hasunpark@gmail.com>
 <20260308151654.29059-4-hasunpark@gmail.com>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <20260308151654.29059-4-hasunpark@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0157.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:c8::19) To DS2PR12MB9567.namprd12.prod.outlook.com
 (2603:10b6:8:27c::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9567:EE_|MN0PR12MB6319:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cd6c33b-944b-4cf9-c7f9-08de7d9df91f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	n8H2wXZ+0V5vQlhvmlTrIk9IXptl/g3MQny65B5nfpR9Ic2188owsIcIiKon2CeZ8f0NgwN8zWpuoiQ7AZfcgTLxNDKplaLLByGQOujscAYhjryrRD082SI9BzAOXtpsCinHqaUL8IBKUt6oqm3CXGPE4VxumnpRMCJRLi+uVvlFqaIdk4n5PLjWTvrQiqf8vR0WGv/1NJbPx5pwIx3lmRkpcUnkToa+2scIiiwKQBOJ4+cPxQD10oiHEEXM5lSXDa30n1i7/aEMUs+GzWeU1KQj6Ovjl5RiRr1cVLPhQfS76yAOH54UNAdS9nRuMn2okjz3xsDHM7wLRmVCQtGZHQP8Vq6ZyOEcoYaperxOSaQ2f7Z6Q9Aok/CZcOz5Gz/50+iyjpIJRyipm8l3BZDyrSWwgw/NfYDwPegKrhwAopbbYSrawEm+jhZXF5IhOysAmVpGVZYwNUFI3icg8gCRZ09JBx2ofijr8KWXkQ6Bg+N1M+oNxrdgC0AhP7ErBHKRweSAJcGS4ogylUn0xSxN3xRN/mFgnN5+fxQHLyRvlNyvJBdQHfq30EXIQc/fg+pMULh0eYgbiEt/QuMAh0/6bo8QH7t5jwhbLbpVBtJHePtquRCI8OG+c3BVBSpNVaSgIFGhkanm7B1qSCopaav1X2cP3uYd12qrezTi6J47ffFvo9OZMf0BPPREibNH6lgFV6fBPMNi81mFwgfKCFTyj3DlKVob28UbU6G7qB7wkag=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9567.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YVM3OUhJcENpSEZJOUpVQ0FrMW0xanhFeFNNdFZjVjlqbzl0K20zSkZBNXhM?=
 =?utf-8?B?RkZ1SGZ2U1d6bWtCUXc2bUR4L3g2SVV4bGpicG5Cc2NKQWZDWkhxemJtVFE2?=
 =?utf-8?B?SXgzaGI3SjhOUWNTVnVLZmRac3ZVeFByS293SHlQRnFzSGJoTEJLUmlxWDVk?=
 =?utf-8?B?UnRZcWVBdm5QVHNXUi9TYldCQU5haXZReStmUDE5U0p2N3VMY0NPVWFTcWNK?=
 =?utf-8?B?bEVra1NjSkpvN2M3OGIzaE16cjM2aWY4cDhMdi9KRGNBK2FMb0ROL2trY0lZ?=
 =?utf-8?B?cStIU2xHUW9LaWo2UVZoSGlob0Z5WTc2UGVIbjZrc1ovcExJN1c3RUpTSCtN?=
 =?utf-8?B?YTAwL1ltc3lSR0dqdHB2VC8xR1dYQ1BMWUVGVjE1cHFBOGxFSDRsVGJ0ZkZE?=
 =?utf-8?B?Q2locDVXWXZzNmU0dTZvQW5IcnJaazh6ZVc2bnd4VmkxSXBBSzNIWDI2SEdm?=
 =?utf-8?B?bnlJa0g1ZGY5VTdkY1NjOXZORk1BT01HTy92VGU4TzlINmV1Qk40elZCMkl5?=
 =?utf-8?B?alFSZThiclA2RmVaVmxYZkkrU1JvdXhQSDlnQ0hCaVAyQkcyYXdBREE5VUEr?=
 =?utf-8?B?Wk5DUCs0SWFZYWhwUnRrUTdRQVMzYnh6aHR1U1h0ZnN3NkN3TGVJRmlCdVcr?=
 =?utf-8?B?NHZTaC9ZcGo5S3VmM0d6Rkk5TUF4M3Z4RmFMalFLbUZySklyOHZyMVBqTklr?=
 =?utf-8?B?NW96N1ZUbGxLUXR4eU9uRTdHUFY0R1Vrc1NEd3E5SEJKNVNHN0R6WnhjZmNq?=
 =?utf-8?B?TTlnaWFWWUNWUy9BYWV0alZJczdLZUxRZmthMzJYNHVkR3JicFRxNUx3dzB2?=
 =?utf-8?B?ZWQwellZdG1aSkdVQTJRdGNJRUxKN0l4b1hzR3c2QUd4UEczY0tGN2VqdkJr?=
 =?utf-8?B?bFdYWkVZamF5cTN6bzMyQS9hYUZaOVNLeklHZmF0UkRHNGVpMlVJVGgvemN2?=
 =?utf-8?B?TUMwakJSMzhiamUvREc3OTNMRXlCU3BsMFMxRGgvbTJIbnhPUGM0ZDgycDgw?=
 =?utf-8?B?anZmZlFlTHNMdmhWN1pZSjY1SGR6SUVqNXR5bWFXbXJ5aDRCamNKbXlxZnUv?=
 =?utf-8?B?SHFNV0RnNkYrR2lpdE10dkZhK0o0c3pmZUhFeWxMdlI3KzNiS0w1QTcvTUs2?=
 =?utf-8?B?akNHKzBhdHVrVjFxaHNtYVl0UnVZaXpjdDVOL0hZclhGOGpzSyt1SlJmUzUy?=
 =?utf-8?B?ZTE1M0p3WWtQdmtjd2Y3dStpMFIzcWx2M0w4eXBlTmx6ODRCb2JCSmF2blB1?=
 =?utf-8?B?QmxNNlBid096b2ZVRERxeW1yUlhiUDN1NHp4KzM0N0JxSy92V3RFTG9JZjNk?=
 =?utf-8?B?cmVPZ0tzbjVKbjVtK2tqZnhGc2U3RXY2RndMNVNScnptUS91UzVBYUZVY3lm?=
 =?utf-8?B?NTQwWXdhR2k2YnNud3FFTUtFZW11WmRBdEpuWU9LN045THl1SUhQanZEYnlX?=
 =?utf-8?B?OEJ6V21BQXM4Vnh4WG1BNENXemdPYXk5aXNTMzhFeXZBVi9jSzdlck5kOUJ4?=
 =?utf-8?B?bkRjVjhpWFYrRFFtVWtUbkFsWmdybll3dHhZRDJJaHVGeENsVzNzWFM5ZTg4?=
 =?utf-8?B?NkFuNk9uVS8vdXg2OHA3WWNPLzVWRTcySUZkNnRoVVo2dnhKQ0YvMndySFh5?=
 =?utf-8?B?NUdtaWhTWGFqd2xuTythOThSQVl3eHlzVnovc1M5aTVwNDk4Z2pwWlljUHJQ?=
 =?utf-8?B?ZEQ5Nk5WWEhTdGtsVE9va3VJTTRuTjZQd0dEeXdPTkNST0lVY0UrUG05eDF2?=
 =?utf-8?B?M1VqbFNyZ0dTY2dIRmYxczg4blhaV2ljN2J6RjdZM3hyRDV3dFN6K0ZzOFZr?=
 =?utf-8?B?MnB2VCsxMFRxOTIrQkJTUi9WL01ndUVzYldxVk84VjBEcGNrdUtybGtxN3Jy?=
 =?utf-8?B?cFljVzJBNlhHazZVR29CRG1QYmxieHVoUlAyZ2YvQ282c3NGN1V5NkpxbDFt?=
 =?utf-8?B?T0NLdWpCd3lxQUpkVHB4WEZ6RG1CQWtvVkJxcHRlVTg2L3lhdGxhcTNiMlEz?=
 =?utf-8?B?eVIyelhaU3RFaVhiK212TkJtK1o4MTZpT0svRkZCeUJEb1NybnY1eE0xZ3hX?=
 =?utf-8?B?NWZlVElLR3JidXpFQTF0QVZVNXBNK01pMkdQTzBiaTg3UHBtSGFEVjZWK2RU?=
 =?utf-8?B?U0FyN29ZNmpYcmJZYnZibjNqZHNJb2ZjdWYvNFZQc2ViM0tvMEZBbUlPZUZQ?=
 =?utf-8?B?TytrYm5QTlY1V2NOTFJwNDZpYTAyYmpNNXNuNU1Ecnc3b1lyUUFmaktzT3Vr?=
 =?utf-8?B?Y0VxcU1TcE8xS0QwelFTTEFHa1d0M1JNSmZUVTJzMnhGeVZ0ZzVYSGtDUnJm?=
 =?utf-8?B?VWRNZVJPV3hObFAzc1ovZkpDODAzUVk1UnRpQ1Y5Q2YzZDlXZXhyZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cd6c33b-944b-4cf9-c7f9-08de7d9df91f
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9567.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 05:37:37.7444
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DL04BQAUqIomOwphpCo++2IALS1kivAFQ06NRenRmU5QlIbdLGH1yBpSUrKKKDdqsGzlX7/v2ZJFRNFZgyOhLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6319

On 08/03/26 20:46, hasunpark@gmail.com wrote:
> [You don't often get email from hasunpark@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> From: Hasun Park <hasunpark@gmail.com>
>
> Add a DMI quirk entry for ASUS HN7306EA in the ACP SoundWire legacy
> machine driver.
>
> Set driver_data to RT711_JD1 | ASOC_SDW_ACP_DMIC for this board so the
> platform-specific jack/DMIC quirk path is selected.

As RT721 comes up with UAJ + DMIC, then why we need ACP PDM DMIC in this case?
If you are using RT721 (UAJ + DMIC combination) below quirk is not required.
>
> Signed-off-by: Hasun Park <hasunpark@gmail.com>
> ---
>  sound/soc/amd/acp/acp-sdw-legacy-mach.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/sound/soc/amd/acp/acp-sdw-legacy-mach.c b/sound/soc/amd/acp/acp-sdw-legacy-mach.c
> index c30ccf23005a..d22b71e3fd2d 100644
> --- a/sound/soc/amd/acp/acp-sdw-legacy-mach.c
> +++ b/sound/soc/amd/acp/acp-sdw-legacy-mach.c
> @@ -111,6 +111,14 @@ static const struct dmi_system_id soc_sdw_quirk_table[] = {
>                 },
>                 .driver_data = (void *)(ASOC_SDW_CODEC_SPKR),
>         },
> +       {
> +               .callback = soc_sdw_quirk_cb,
> +               .matches = {
> +                       DMI_MATCH(DMI_BOARD_VENDOR, "ASUSTeK COMPUTER INC."),
> +                       DMI_MATCH(DMI_PRODUCT_NAME, "HN7306EA"),
> +               },
> +               .driver_data = (void *)(RT711_JD1 | ASOC_SDW_ACP_DMIC),
> +       },
>         {}
>  };
>
> --
> 2.53.0
>

