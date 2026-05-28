Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012047.outbound.protection.outlook.com [40.93.195.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4D481D130E;
	Thu, 28 May 2026 12:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779972617; cv=fail; b=ApARdEOGo40EXYLy1gUcPiORp5IofjKA7DwTij72eRZVRv8iqZTiaGDoUSvB9T8Xtspg9nJexAxjOK8orQskBvrYvOmrtW+sNn6J8OBWgnzTHxkfXAlwz7mrihKDHR2jAeNA/E8tFLJqRmgHJuF7G0hs7MEcmIHaX+NgzRTKspM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779972617; c=relaxed/simple;
	bh=FX65hKl96llkrS8+tKAegQM4tcGMXP6DT4QqchXEjb4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=QQhAa9loM2kmzqXY2OFmf3Ow8i+QGv7Alnl5+nWQkBI2fM4tk0DmpTrbxwsuxxj5UvgXGWG+ANCcrm/idX24LN3m2EceT/UxmJAxtMMKL/3s8C3uaVmKXGTWKiwVzT3vaoG3TBT6U7v7z3xP3P76gXh5NIwmSPoBGMNBv/YsP+A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=EaFODi+0; arc=fail smtp.client-ip=40.93.195.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="EaFODi+0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QkMxWK2yMmGgIqr0E/IizZGSnzItQNvRrHiA7hXDeVggoDm/ZA5UK++fJdE1yOxoFrGz2pjLqSv6NQdNOdOe+4YSp18OixghrfMhcwUKIkpzXQqcgoRMMiYG8q10MLG6scayv/RlK1DxPtYKD7kkDQlwTWYLsIg9EgsOromgLdjO8tyRIpeYsy9bNar8BSEp12+ciRNlrY3I75MNstWZfPED45ajzOwpQeUMhlYU2oUBb6DM/LmhnjMERXBj2xqpeWZNIpdXQE97g0GXY/3LfESewQdEshgsB6dLzFPpXP3TbyjRbqFTlIT1/+gT1JtD7zN6JkP/JzGDsHG9ci3OFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2p2ZfO9HkxQSJuN8Ym1UPpfzvVzQ1w0cGl/IQATdkHE=;
 b=QGzbJY7stYc2Eec72+NYJq+gcWqejIkxYFg0un78XfhsgoShuWneZKhphvXmAPOwkAmx6IU25T8SYjoGYo7R8jJL0dV3rPCfmUaM22FlE8DLJKbZkaGSfw+sPKlZ5GmFkyREJ4MwtKb1UvVG2FagwPccRS1gGvfdkEcyHy6kkgXVI0qQ4WVAe+EsJGnlDnKCMg81p+JGmsCfBwg+MH480HWvOK5n+Br9WEKJjVOQkxcVT0kP88HXy53NaDt7DvSOuVc1PQgjmIhdw4Fyyj5t7CnFvXI1WIXZnDgVSpSkCOOS5HAecCF9jCu3eScsnXsqFD+fzjhPOjNkFk0dO+neJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2p2ZfO9HkxQSJuN8Ym1UPpfzvVzQ1w0cGl/IQATdkHE=;
 b=EaFODi+014gQmaWVSHIZzCC2A8OhxCE+7bZVNDQx0NGqxaw8r2gYYtqQssPl4FulIeLDUPNhuSYC6wYZIPW/Wm/1SEw6Vf7nnzEZ680B++BoHgdsUDGQIaBDTfDBYBitkhzlUUw9eKkxXwbY+9PflwKlxILY7W9Qyblm3gjYV68=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS2PR12MB9567.namprd12.prod.outlook.com (2603:10b6:8:27c::8) by
 CH3PR12MB7644.namprd12.prod.outlook.com (2603:10b6:610:14f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.14; Thu, 28 May
 2026 12:50:11 +0000
Received: from DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5]) by DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5%2]) with mapi id 15.21.0071.011; Thu, 28 May 2026
 12:50:11 +0000
Message-ID: <ce04759f-2d89-40a6-9697-58f49ebacbdf@amd.com>
Date: Thu, 28 May 2026 18:19:52 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/4] ASoC: Use named initializers for
 platform_device_id arrays
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?=
 <u.kleine-koenig@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
Cc: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 James Ogletree <jogletre@opensource.cirrus.com>,
 Fred Treven <fred.treven@cirrus.com>, Ben Bright <ben.bright@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Syed Saba Kareem <Syed.SabaKareem@amd.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 "Mario Limonciello (AMD)" <superm1@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Mark Pearson <mpearson-lenovo@squebb.ca>, Hasun Park <hasunpark@gmail.com>,
 Li Qiang <liqiang01@kylinos.cn>, Kees Cook <kees@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Mac Chiang <mac.chiang@intel.com>,
 Maciej Strozek <mstrozek@opensource.cirrus.com>,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com
References: <cover.1779958164.git.u.kleine-koenig@baylibre.com>
 <c98326bcf4166fc3035d51e03f41b4b35eda52df.1779958164.git.u.kleine-koenig@baylibre.com>
Content-Language: en-US
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <c98326bcf4166fc3035d51e03f41b4b35eda52df.1779958164.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BM1PR01CA0154.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:68::24) To DS2PR12MB9567.namprd12.prod.outlook.com
 (2603:10b6:8:27c::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9567:EE_|CH3PR12MB7644:EE_
X-MS-Office365-Filtering-Correlation-Id: d5776720-02d5-4704-f2f3-08debcb7a76f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|18002099003|22082099003|5023799004|11063799006|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	7dfAk9fcBIIaF/kgnIQlFagBcL8QE435Rld2xn86NvNk4NMzV52acVRf1f6lvQ9kg5s0uw/LKXJxCip06gvsHdq48xCiMgcXQQB40U6ImfE5siQ4ASMl8aZgs32YoE+1RRJJADI6FnedheCh/cFxOnM3fRj0Rc6lSJ2lyx+WyIyxx3f3/g2DY6lDEESkzgjlbUjPHFOxWfuIkcRVNEwQaKOvACv6WWsmS5RIf+AjJNHDe5sbjsvv2vRWv9NMMdHuG5SJ1TFOJWFSWX1JPEMVzfFReP5lIrAuwS06fCSbFcC0RWNnyWnLl8jlev6ob0um5/UlCsAFJcxf6wNBCr7xPvjXNTo4Y6eUXZPnPxehUsV3JSiH/svEXM0W/hs954/Q4piyFd/YddeivXbADLpb9tn5ELYxu9sGftqHhqAf3RqFrXL8zX388RrzGDfCmE/g+bzwAriiFmdjtLjiAqgppULbLDhWXeM7tAjMyx5JupEG3TAGbcM2gsbYB1tsR0bLEiB+lzOKqQ2CTBAHlNf5C3t2HBubZinJ4wxmbCLqzFVjLzMIW7gAxOzj/bSLIED56azU1xvFqQroKcoTu1lm0MYFch/d69K7pAvRKZ21G41qyIs9VL7IN6FVzV1l+LoC3pvQYtEOc7PHnGPfDePj2rLeXSFDSVflxw++ahsH7LFeu3s0qxFjjCdSSNqBiZSv
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9567.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(18002099003)(22082099003)(5023799004)(11063799006)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bXJMM0QydkIxNXFvMmhxR1A4YWtvby9HdG9Dc0hpaG1aNzBQNWRwblpNZFd5?=
 =?utf-8?B?RlJ4YmV2MDRMOHF6dFhGekFiVk5YVXNPMWRlNVU3ZFFjM1pKZ2krMXJORDRx?=
 =?utf-8?B?SzFaUHkyWW1Nc2FpV2F3VzZsTzBvMU5WQ3lhdFRMa3MwUFRmUjJ4dG5SMmk4?=
 =?utf-8?B?dWFGZFl1UDdLUlI1cDZsR2FMQkVCOHExRC8zZ3pQK3o4UVIyU3NPRktkL3FX?=
 =?utf-8?B?Q0JiMTQ5Z1Zsa2VjMVYxemxOaUE5YUFFbFdDQ1BYWU5Sc2huSGJORXI2aVhr?=
 =?utf-8?B?MnEwY0hDTHA5L3Zma0R1K2NOUVRiMkNid1Vad3pVRkVSSktlZk1hQkY5TUJl?=
 =?utf-8?B?SmZNN0RDbzB1Y095MGVJdmlDMDA3UEdiQmVXZUM3ZDdWUmtjejdJMVFBMTht?=
 =?utf-8?B?RFJYaFlzaTZlanptSDN0WGFidGtJUWZXamdMcFRWTDhKNVpVQll1RUtiOXRL?=
 =?utf-8?B?MUN3eVRIOGoycWFncm5oeXlWa2ZwYmtUckZrclFUcUh5dzFEdHNYTkZOcUd5?=
 =?utf-8?B?RWE4Sjlra05ITXNhR1BraS9pVWpob0NPeEdOODhPNTBTREdKOFEwdXJMeGtJ?=
 =?utf-8?B?blkvNDJWZUkyTHNuWEtNSUVGeXZFWUNmMWcxaXFSSDlpejlLUG04SjkyT3BP?=
 =?utf-8?B?MkloeG5ZeEcyNG1RWGZMcTRrZ0NmWHB2TExkeTZnVmo4azc1bmNsMldWMXAy?=
 =?utf-8?B?VWxEdjVUYnVrTXdVSVZ5cFpaUis0RlZUK0N1cy9YMmFJNElNMnRka2xzMENZ?=
 =?utf-8?B?K0NkcHIwRS9vdjdqSXJEaFVuK1F5Q2Y5cDUwUXZ2TlB5clpxdkxlbGpmVG5B?=
 =?utf-8?B?TFVwbDkyR2FDeWt1dU41V3ZqcTkwWXoxN3gxdDNiT1AxUjBwQnRrS3RTRU1i?=
 =?utf-8?B?azZIRHV1WHRhMlYrdS9JNUluK2xqU2dnL3NiK3QzWDVVM01WbWFBcjVGd3hr?=
 =?utf-8?B?RXE2U2Jwd0g2SUptRWlwcXhZcUN5NGNmcjdBWncrVERQZVIvK2pxVTB6NWhm?=
 =?utf-8?B?bHVNVWl3ZEp5OUc3RTBsZ1lNRzNuaUJidi8xOVFsaGRJMzUzaXNuSnIvOHFy?=
 =?utf-8?B?ckVMSXJvbkpOMC95SWtHK1FoUW10K05lTGtGZnAyektpRWgyQ3lTbFZBSHA0?=
 =?utf-8?B?Tzk4aGJDQ2dIK0F4WVVrTEYxYU5QNit1SWpTeWJJNlFvOU1WOHpWRklVZHFP?=
 =?utf-8?B?dmpSN2V2THNnY0h6Lzd2cWVxM05IZVNBRmdtaXpmb0Rqam5RcGNSU01FQWxZ?=
 =?utf-8?B?NVRLZDdkcHRnSEtidXl2TTkwQytYVTlZdUgyYW53clhLTkI4elhXUnFzUTVK?=
 =?utf-8?B?aWhQdk44RU91akQvK1l5Z1FNV1JIcXgrYkZjVkFTNGlQRFhQbGxvUzF3K3Ra?=
 =?utf-8?B?TUJTc3c4eTgxLzc0OVV3Sm01YmI5eldZZURpc3ZCT05JNWxRK1VIMVFBTk05?=
 =?utf-8?B?Q3dqSVZjVWZOVlNwNXA5ang0TmQ4d2ltZnVpMC84anIzWDUyM1U2TGJ1M2Jm?=
 =?utf-8?B?dnkxRkV4dWhJVytMWnQrWkQwU25ZZTB6dmNRR1Jsd3VYd2IvbUNpbUxOU09z?=
 =?utf-8?B?bS9jYjJ1UVFzeUQ4K1dsY0pZZ3VFbkYrSU9lWGFhNDZ0RG9WUG5yZ2VpYkFZ?=
 =?utf-8?B?Zm9La2w5SHBEemdEUmxtWjgzNFNpZWhIQmMzbXpNNTg3ODBSQkxCSWQ4ZzMy?=
 =?utf-8?B?WjNkczZPN3dlNXI1WE10Q2VuYXExTjZMSTFReFk1TU5mQ1RtZXBSVVMydERR?=
 =?utf-8?B?dVJUZy9BaU1lalRneDJxWkg5UmhOdXIvd1hHTzNjZTdCRk9BcGtZcmt0NWQx?=
 =?utf-8?B?cWZlR1FmUHlZSnU3dUVjZHNwaTlOaGl2OVc4d0VUYjdOWHNla3Y1Uk5wRUlp?=
 =?utf-8?B?RFF6WnVWdWk0L1pZb1ZWeThBY3hpWVNMWFpKdDNqZHc4eFhiV09TczJhU0tu?=
 =?utf-8?B?azJDTnBseHZDZ0hKRklmZVZKTkIvTTYvaWRkd0NjOThCVWhIQkh5cTA2ZjVV?=
 =?utf-8?B?SXVEV3N2ckVPR0VQd2lXSHJZcS9qQzlneXhsbkdIYjVxYTRhK3g4TXVKK0FO?=
 =?utf-8?B?dTR1STAwUGFMV0JkdW9nQmVmNDFWcnFmZzBpUy9rdGthZVJDNkNwcUZuSmND?=
 =?utf-8?B?aWM2VUJaRDdLUW5tM2RCMElXOERJU3RZbXZjclU2WGtFUHJPK2IzYldaQUla?=
 =?utf-8?B?V0prcysyVjM0SkExdkZZV0NqaW9DT2l4SjJvSUM3dzY3U3dKWXB3eVJBUGI3?=
 =?utf-8?B?L0dnT3k5VlZTdUVjRERHT2JIRGh3UlNCdDN4elVrL2VZMGNnekllMGhlT0Vo?=
 =?utf-8?B?WXR6QmFFOURqQVlRd1lUM1pMOXpRVWJSWGFmSXlvUWh2K0lZRWRxUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5776720-02d5-4704-f2f3-08debcb7a76f
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9567.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 12:50:11.1234
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +WkxkxVmhDei31z/OjXgGGa9L8VObyXqC/MOkG4lv8W7ClLh+Sg6P+5LvNEw1W/ajSsx2g7dCIlWjQYA8QK18A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7644



On 5/28/26 14:36, Uwe Kleine-König (The Capable Hub) wrote:
> [You don't often get email from u.kleine-koenig@baylibre.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> Named initializers are better readable and more robust to changes of the
> struct definition. This robustness is relevant for a planned change to
> struct platform_device_id replacing .driver_data by an anonymous union.
>
> While touching these arrays unify spacing and usage of commas.

Split AMD patches and use ASoC: amd: acp: as prefix in commit title.
>
> Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
> ---
>   sound/soc/amd/acp/acp-sdw-legacy-mach.c | 4 ++--
>   sound/soc/amd/acp/acp-sdw-sof-mach.c    | 4 ++--
>   sound/soc/codecs/cs40l50-codec.c        | 4 ++--
>   sound/soc/codecs/cs42l43.c              | 4 ++--
>   sound/soc/intel/boards/sof_sdw.c        | 4 ++--
>   5 files changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/sound/soc/amd/acp/acp-sdw-legacy-mach.c b/sound/soc/amd/acp/acp-sdw-legacy-mach.c
> index 09b475c83c49..c3a0e0c4e996 100644
> --- a/sound/soc/amd/acp/acp-sdw-legacy-mach.c
> +++ b/sound/soc/amd/acp/acp-sdw-legacy-mach.c
> @@ -579,8 +579,8 @@ static void mc_remove(struct platform_device *pdev)
>   }
>
>   static const struct platform_device_id mc_id_table[] = {
> -       { "amd_sdw", },
> -       {}
> +       { .name = "amd_sdw" },
> +       { }
>   };
>   MODULE_DEVICE_TABLE(platform, mc_id_table);
>
> diff --git a/sound/soc/amd/acp/acp-sdw-sof-mach.c b/sound/soc/amd/acp/acp-sdw-sof-mach.c
> index a0fd8a6f9970..578f24329c04 100644
> --- a/sound/soc/amd/acp/acp-sdw-sof-mach.c
> +++ b/sound/soc/amd/acp/acp-sdw-sof-mach.c
> @@ -437,8 +437,8 @@ static void mc_remove(struct platform_device *pdev)
>   }
>
>   static const struct platform_device_id mc_id_table[] = {
> -       { "amd_sof_sdw", },
> -       {}
> +       { .name = "amd_sof_sdw" },
> +       { }
>   };
>   MODULE_DEVICE_TABLE(platform, mc_id_table);
>
> diff --git a/sound/soc/codecs/cs40l50-codec.c b/sound/soc/codecs/cs40l50-codec.c
> index aa629ef53db4..676367163067 100644
> --- a/sound/soc/codecs/cs40l50-codec.c
> +++ b/sound/soc/codecs/cs40l50-codec.c
> @@ -288,8 +288,8 @@ static int cs40l50_codec_driver_probe(struct platform_device *pdev)
>   }
>
>   static const struct platform_device_id cs40l50_id[] = {
> -       { "cs40l50-codec", },
> -       {}
> +       { .name = "cs40l50-codec" },
> +       { }
>   };
>   MODULE_DEVICE_TABLE(platform, cs40l50_id);
>
> diff --git a/sound/soc/codecs/cs42l43.c b/sound/soc/codecs/cs42l43.c
> index f0d6ff0b2976..08f94ce18e14 100644
> --- a/sound/soc/codecs/cs42l43.c
> +++ b/sound/soc/codecs/cs42l43.c
> @@ -2942,8 +2942,8 @@ static const struct dev_pm_ops cs42l43_codec_pm_ops = {
>   };
>
>   static const struct platform_device_id cs42l43_codec_id_table[] = {
> -       { "cs42l43-codec", },
> -       {}
> +       { .name = "cs42l43-codec" },
> +       { }
>   };
>   MODULE_DEVICE_TABLE(platform, cs42l43_codec_id_table);
>
> diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
> index d43daf9b025d..135c93ce4415 100644
> --- a/sound/soc/intel/boards/sof_sdw.c
> +++ b/sound/soc/intel/boards/sof_sdw.c
> @@ -1539,8 +1539,8 @@ static void mc_remove(struct platform_device *pdev)
>   }
>
>   static const struct platform_device_id mc_id_table[] = {
> -       { "sof_sdw", },
> -       {}
> +       { .name = "sof_sdw" },
> +       { }
>   };
>   MODULE_DEVICE_TABLE(platform, mc_id_table);
>
> --
> 2.47.3
>

