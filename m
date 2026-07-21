Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011029.outbound.protection.outlook.com [52.101.62.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 063132D9484;
	Tue, 21 Jul 2026 03:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784605829; cv=fail; b=bexlefnyciQ0WD4eQYhJotxfZavpwYPeCdzhgn+ZCGitW02ubB+86GJAQS63qWBp6rw4jzJnhQRnRFdwBjoB035jl08SWo7dsjQyaMoqoVDprX8DzPILZ5QfcMzEdSu71qbTe1pjIVCKr1z1hAHAScxGsxFN9yMMbwu+1/OinzM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784605829; c=relaxed/simple;
	bh=BTwJeBrZLPKz3rf4NhDX6QbToO4gWzv6iQHBdsIU3WQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=KSBy8J603dZp+sXeohg9tje03xMtv0A1gP0/fp8QhexX1Qwe3P5iuGetIlYCp6801S/0SNiG/TPJIHNyqkWxQcr2d/jbcCX3Bi23Rb1sHoRkifhketYLTMgn4dqiEd+M/wT8omDkeXSgQk8DX4JEw4xhxIsjbpO2qzkVkkwPpJw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=B6hT4GGH; arc=fail smtp.client-ip=52.101.62.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="B6hT4GGH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s3B6sWWIRecx0KYpnO0iIJnGVieNvZNO875w1SAZeWFYj5XEKtsgkIzOYwrXsQ6wLikQCAmLTTxkepjrIWx2akYcPh6hU+dRRmswQtZ0mJEWl0FSehoh9eqzJmzBmSnzEEO4R01Ft8y/Ek/mD9f1eZqDIiGNTcRK47tuV1uM/ovucFPPFrDZIJji5YnBynYXnldpzAKmb7whCyLHb6HROVTFvRVUEFNUD8RpP/yuOo0fZq4+Mvqqt13Mdw6kntZCsRvZoqwvVr9P46Cx69UYhB5171JEbojEl1wr/CcYUtdmg9wk49iFQKppaYqGBCBPySmlY1/3beXT9WDqJstNrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tk57RmuBW/kWDmnYFZ7XYz0Z6F9494+IER53ibaTYh4=;
 b=PJFBzSFrw+RhAVnyMUVOycu5kick/tb8T8/vJL0nRAUWxI30IIA0/5aElxkuFBnlVO+BSs8bdH6ZpKIe/sgR66KE20ehdLXvzHXSnLXYpxFX36/rCLB6sPCUjeAwnRIkMJscYm/lbLvV1UNe85XTVKfvdo0Cppm0GcQwbarEE3lhcaSJpxVCERidnZwn410HMr18QmPi4n5xhL+ixiplmnGFHZN+Ol0XbFS7L38MPz5SosP413GPNPbi7laP3fUgMgwID5b6md8pMC1OGL92Tjz2klimfQJqT2uFxlECgPVVvCOYBu5HS6L6LYq+8y3671uLL5XnXgmGuglnUz5JSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tk57RmuBW/kWDmnYFZ7XYz0Z6F9494+IER53ibaTYh4=;
 b=B6hT4GGHe/HDQzxALseJwy3NLgeJcSrKiTK6KpWU1w4/B1yi+11Ts2lwbC/mH2sj0JT3S0AQQI8WgThQufe3Gi0fhTJgDnqBfPaOfL57Ayp5kfjAPP6r7ieEQRb7jpcDO6XU7N2RUrigz7H+hV3ZLZKp+CvAiz9Y7YZtvCA+Awo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS2PR12MB9567.namprd12.prod.outlook.com (2603:10b6:8:27c::8) by
 CY5PR12MB6132.namprd12.prod.outlook.com (2603:10b6:930:24::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.18; Tue, 21 Jul 2026 03:50:25 +0000
Received: from DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5]) by DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5%2]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 03:50:25 +0000
Message-ID: <4de738e5-4802-4890-89a9-cfa66a15889c@amd.com>
Date: Tue, 21 Jul 2026 09:19:46 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] ASoC: amd: acp: Unify code style for
 platform_device_id array
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?=
 <u.kleine-koenig@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
Cc: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <cover.1784528081.git.u.kleine-koenig@baylibre.com>
 <08137cf5b3cdd0cc2e00da32256664f3cb9b1e4e.1784528081.git.u.kleine-koenig@baylibre.com>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <08137cf5b3cdd0cc2e00da32256664f3cb9b1e4e.1784528081.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0131.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d5::8) To DS2PR12MB9567.namprd12.prod.outlook.com
 (2603:10b6:8:27c::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9567:EE_|CY5PR12MB6132:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ae96cf7-294b-4ce9-e960-08dee6db322d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|366016|10067099003|5023799004|56012099006|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	chmgfJNxBuM+XZkOEUTBtQXpdU+PyvPrjLdPcbSvXrqjr0Ly3uzjXaMbA5yTnd9bVJuoeWNZbLcEaB49AniYCLbHNwi0acWWAMgp2q0VWVdur+EXQJ95/einMq7Dku0Z3WkKCc3jdkZMexmix8IV9vsNPVUYaKiyTqNbhgj6YeQxWoi4oecCcLidqhkuyg3cyno4rtQ/GI9M+3WUaqaL/c6TFgEytaz32AOQz6xnn7vIJQZJigxx/TXyuJUxHRsA71c96qMHhGRuhB/ttQ9LW+Ww9+gJJZag97eVIpuv3lkKpld4HMoLWCw+7p9uzhkACT5hMsGzvrtOQQYOqcIoV6HPSiFjjPdnVpLizecySfSGI5AgxMgG1Y2ez6PQMngBCaRV0GpeaFwJBdJ/5c2vA3/TnaIncnYa2DliEeF+/ENu4d2/rCAdBGnoD/alIOxRO9LY2hb/MiXfO1aIvIm8JrD0mptKWHO3CDRj+wmCzBfY/9ffT7pAW2KtLmRHf8QEFAbe/ZulxW1BGEilMzEHblnDzkyCAKF2KS52W3SVgk/m9WDQjXnAvqmuCyNLWbZ5hlj6Kt+xzhyvR5uSRbd/yKzAUnab9DZFxab9c34Ugd+pQqLRcirZmcDbNXjuvEDaZ25XzbK6/QxAbCI4tHIY3XMiWmb8IVykPs8rt1kxxG4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9567.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(366016)(10067099003)(5023799004)(56012099006)(4143699003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bUpHWFJZQlNyaTdrVnBzaUFnRnhjN21FYUh3cFVOOE9RalJLSG5DekhIdGdF?=
 =?utf-8?B?aUJxVVlVQXltK3ovbkE4SGNTNWw3OFNGWEdlYVJJQmMyMHdQL2J3dVpSVE03?=
 =?utf-8?B?RWMyVWZkM2ZYU0V6WnBSQW1LQ3VwTDNvU0gyaW5YQWxJeFJMd1dHbUEyb3hy?=
 =?utf-8?B?eXVLVm5qcEpJdHUxTHpOTmZGaGNLRTI2WCtMQklyMWx2bzB3c3RjSTA2WG03?=
 =?utf-8?B?dHM0VWRSclNETm1nWEt6ZTJJdk82Z0pRVTBWRTZLeHdFV0ZrSHlwcG1wMlRa?=
 =?utf-8?B?TG16bGpoUTVkOEo4Y3hsM2NGV2xpR1k1WFd0WDl5ZlppTEJkeFZJSFZDTEll?=
 =?utf-8?B?RjI0N3JTK1VHb0tjNFFDdHY5aVNUMWZiektLOFFVK3pDWFloRFVua2EzUDBn?=
 =?utf-8?B?TXdtOU1HQXBKZjlKT2Y1OGo1R3BiWXBSc0J1cjZjbFNyVFZWVWI2WWMyQ2h3?=
 =?utf-8?B?NGJLZTJPTkVncW9lTVZBODRacWJzZUpGRGVJTkZLTmZVT0tGWVFZK1dBZyt3?=
 =?utf-8?B?aUNid2c3Rk1Ha3RhaHJKc1h0UHZYeEs5empENStxU1VVVTE1dklhMDFqSThE?=
 =?utf-8?B?UlVrd3RjbHN2R2xmN0JqL3E3bStYaFZmYkYyNTRCSy9KMGVZYitYUWZBZTZl?=
 =?utf-8?B?ZFhIb05lNE1RMUdoVWlRZnl4N1I0SFBzb3BJckdGTjQwK3VNSmc3M3NLRGNQ?=
 =?utf-8?B?RENPZ3hLTUVrSTRZeWcvMzR1dnIyeXpqWlJsay9GV3AveFB1a3ZhTnVwZDNO?=
 =?utf-8?B?cFJ0dnBqOWdtWDdweUcrbDUyd3Jzdkp2QnBneUFSWkd0OVN4ZW0xT2NpK1hy?=
 =?utf-8?B?QmhiT1NmWVZ5Sisyc1FnMmltcms1ZjRBQmRzTllGR3BLaTliWHJRRHhYWlRR?=
 =?utf-8?B?Zk5BM3puKzBvdUxCZW5iaGJsbTd0ckZib1hidGFseGdiRVZPeDJIVWJKZXpI?=
 =?utf-8?B?RmV3aE9tRm9uRWZqUjlyaDhSUlk0WkdsK1lXUU0xSlJwL0RtTkI2SFB0RUpU?=
 =?utf-8?B?R29aMzlwWFlYVU1sME9jS3RGemZPU3JEM1RwaFpxeXkvRlFqMllGYm1LZnoy?=
 =?utf-8?B?UGR6ak5sQ1ZyaTFjOCtINmZIalNxNkJYYkw2UDAxVS9WZWVyU3N1Mm43VDI2?=
 =?utf-8?B?UlZqK1E5TjFjVXBubmNqVG1HVy85b2xRZytIOTN6WFNHY2o0S3V5L2RsU0Iv?=
 =?utf-8?B?eGw1UjZPU1Jsb0s4TUxSWmV0MkhwcEdacytJOGt5Z2pYQXJQbnd4TWdYZkl1?=
 =?utf-8?B?b1JydEpqL0FPT1Z5NjJNYjBWTnczV1czWWZ1eDlWZUQwV2tTaENEMHJQa1NC?=
 =?utf-8?B?bXVoSklpdkM1M2JvNXVBMENPQjlBclFPckcwYmNYMjJuSmlPQVl4WjlxRzBl?=
 =?utf-8?B?Uys3NmNJSFZTWUEzVkpHamRSdjN4VURuZ0l6REcxblNLOExJR2lGOFdRSFJ1?=
 =?utf-8?B?YTljQ0o2cmtkdXBMNWluRjBwS09TSmZ4MFJZdld6YXV5Z2kwcGtoczR5RXp4?=
 =?utf-8?B?M1p0TmMzRVFyTFU3TmRpaDdyN2t3c0tyeUdQeFZCTmpldGxYY0YyUi8zVFpF?=
 =?utf-8?B?alhRQXJmdDhDQTF6V3RmRG9zSGpGRmRRNk9UQVdtQzNZUDVkYkI1VGVNVHAv?=
 =?utf-8?B?VVIzYUVieUM2REJPZ2w4NHhtNG9Fc2hhZllLdFhnd0dzalFKZEMvbGlDekky?=
 =?utf-8?B?V1orUkRQbVZabTZPYWVLMmVIVmtpNFc4YmpwSGI5ZE5kcCtqazlZLzZObnBB?=
 =?utf-8?B?YzA4WFBodkFrMGk5Mm5ieHRrbnVQbTFYdkxteHBlME1EeDlRN3h4REY2bkVX?=
 =?utf-8?B?d1dTWGV5Qjhrdm9lOVRCRjFJRTAra3MxM0ltQUZkZ0FobDJWdjM3U2JvT1VB?=
 =?utf-8?B?aVNNUHJxYVpyemVIOUZWaTEyb3ZSUUloOFI1VXN1MU1WSmVibjljbmJMSkRk?=
 =?utf-8?B?cEREekg4Kzd5YU01OFc5bjlyY1BrTWVhdnNXcmJua0lSVXZBc1BhenRFb3Na?=
 =?utf-8?B?aHU5dWIyenN5QjMxZkRTb2ZFUmdudzR2V2Y2TytzeWRLUnBmcUgwd0Qrdkx5?=
 =?utf-8?B?MTF0KzNlTFE5MFltL2syRDBiTG1vWmZNTFJOUlVXK3RFbEMxamlSTFM1SklC?=
 =?utf-8?B?RkdqbHBwWE5PbEtObnlQL29kcmx1NU1FTXVVWVJkM0ZCQXJoUmVqSmhCMlRq?=
 =?utf-8?B?b1EwUGFJYkRUd0ZLMlFHUHBUbFFwUXdIRmF5UHJ2OGRwWHdhd3Y5MTNiM3hS?=
 =?utf-8?B?YzVEMWlrVjJKb3B3Rk85NVhyUVN3SGVlU3EwbVkyaU5ZcjNPTGpqWHNHL2pT?=
 =?utf-8?B?eU9LUXhreGhqWXEwTXFHSDRTNThBakRIcmdvMXBJbVJBZnJKUGlTdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ae96cf7-294b-4ce9-e960-08dee6db322d
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9567.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 03:50:25.0505
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BvCsMu3pTqnnwy3mDGwPVhxhIvxc2kfwWEngTVQ1xXbvhUGJKL3qyNuyYpuluuxj4Y4ykeda2w3yT0/ocrhirQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6132

On 20/07/26 11:53, Uwe Kleine-König (The Capable Hub) wrote:
> [You don't often get email from u.kleine-koenig@baylibre.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
>  - Add a trailing comma for initializers unless the closing brace is on
>    the same line and for the list terminator;
>  - Use a single space in the list terminator;
>
> Acked-by: Cezary Rojewski <cezary.rojewski@intel.com>
> Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
Reviewed-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
> ---
>  sound/soc/amd/acp/acp-sof-mach.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/sound/soc/amd/acp/acp-sof-mach.c b/sound/soc/amd/acp/acp-sof-mach.c
> index 36ecef7013b9..8874151e159a 100644
> --- a/sound/soc/amd/acp/acp-sof-mach.c
> +++ b/sound/soc/amd/acp/acp-sof-mach.c
> @@ -128,31 +128,31 @@ static int acp_sof_probe(struct platform_device *pdev)
>  static const struct platform_device_id board_ids[] = {
>         {
>                 .name = "rt5682-rt1019",
> -               .driver_data = (kernel_ulong_t)&sof_rt5682_rt1019_data
> +               .driver_data = (kernel_ulong_t)&sof_rt5682_rt1019_data,
>         },
>         {
>                 .name = "rt5682-max",
> -               .driver_data = (kernel_ulong_t)&sof_rt5682_max_data
> +               .driver_data = (kernel_ulong_t)&sof_rt5682_max_data,
>         },
>         {
>                 .name = "rt5682s-max",
> -               .driver_data = (kernel_ulong_t)&sof_rt5682s_max_data
> +               .driver_data = (kernel_ulong_t)&sof_rt5682s_max_data,
>         },
>         {
>                 .name = "rt5682s-rt1019",
> -               .driver_data = (kernel_ulong_t)&sof_rt5682s_rt1019_data
> +               .driver_data = (kernel_ulong_t)&sof_rt5682s_rt1019_data,
>         },
>         {
>                 .name = "nau8825-max",
> -               .driver_data = (kernel_ulong_t)&sof_nau8825_data
> +               .driver_data = (kernel_ulong_t)&sof_nau8825_data,
>         },
>         {
>                 .name = "rt5682s-hs-rt1019",
> -               .driver_data = (kernel_ulong_t)&sof_rt5682s_hs_rt1019_data
> +               .driver_data = (kernel_ulong_t)&sof_rt5682s_hs_rt1019_data,
>         },
>         {
>                 .name = "nau8821-max",
> -               .driver_data = (kernel_ulong_t)&sof_nau8821_max98388_data
> +               .driver_data = (kernel_ulong_t)&sof_nau8821_max98388_data,
>         },
>         { }
>  };
> --
> 2.55.0.11.g153666a7d9bb
>

