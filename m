Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013022.outbound.protection.outlook.com [40.93.196.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB92C36166D;
	Fri, 27 Feb 2026 04:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772167518; cv=fail; b=tF+z+Z09iCCFijyzsCPZdylZzgZNy7vrKiBSYmNhezd1mr67S0/jRlDBMRKn1AfbTF+u/et6dt+NNt0G5aC6Dr5rXU/FeQjCtUSGFz8yj1uu+h/aNbztZhcjZ611p4TyjD/ATvEaA6xxQJDJWiGmhJ+Bhx2dYsVsydEJWrZ2B+4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772167518; c=relaxed/simple;
	bh=RzBRRdMvsp3GttLGVGJShfp6qAberKUlfVYXIPR+iIM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=HNMX8lIQaVVkU6VpW1Vu+c1aAvu/3ERnW50InObtqp68kbNEFNszq1hNZj4+XJBFxkUDhA5N1UMd+0W7pdPnFEs6MQ3NY5DmC1NWHF/8z25cNzyfaDE9XvwbDkk0fc0CMxcfQia0jiXw6/lnGJQJ4L9NvfFfER8BXeTb8LyRZF4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=eGOe99WK; arc=fail smtp.client-ip=40.93.196.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="eGOe99WK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DG5Cq8jPotBxtCWTzscWagX2QxBJD2XyP+yQWwf32c1034EssWIAqEN1tS+RcX1mxor5vVfyVyzQIvsPfr6R8BMnmUP9yAns8ut1i69pY4nKJQW+GixkvglD9axNGsYhcuJYrcxVHZ3i94Wpg1P5z9wZa/KqT+GUle2xhYmEh1ldbNCzNqG48AF5YZ4c9lb+RoyJqOg+NWVkb4loGceB/WaeJRYtwfsWYqZrB7ZoLB7Gnu5zvNrtU847jk+5TZ3MAPhii43Lc84aTwpuZioO6XXQ4gk1TlDis9Q3ElZNGsdnExVQUV+2hUY4tNX0A8g4OtF70M70+o++RjcD+6XG7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U/kpmDynn2eWvdty1eIt5pt/6edUH7QkcHorvtFSeXU=;
 b=hdm5tZmJcxLWl8f3wJ2i93Wtg4P/p/lyzVaetmpKney36uI0lQ/01U9T3mJTPvvVxeOmCaRTtD9fYPzMdmKX/2emR3hSKwIxMa0Ihkt8SFtJ2HiQQQj5HnbJsPx9bQADwpl3Oh2QTPUsBW5pceZAlHyuTeTLnneiKSuR8YqJV27Yk3QSVzrSKI7y/tQIzYL7y8xSNrQfbfYDeajLyKpJf/q6uGlHM8Z3VO+S659nKWpNqENvMp4WRAt7g9sE/pbvET3WsvZ7k8CMpjNeDK2NLAitiYosqIMGPJ5hlLQVxLCmLD8cLfblWYwrp7DNht4KYPHkQO25t6hRDo8EjUNnBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U/kpmDynn2eWvdty1eIt5pt/6edUH7QkcHorvtFSeXU=;
 b=eGOe99WKW5nuXI1uzFjzuG3ACJEsFpDgFcg1NK77buPlX7D+Y3d9mzDjvOCCdmgpey9ruaqGZRTyxbfsTqPvzOy0gG56hjF7ViKNg1jJH77gzsMAEq0rcPtriX2Amv+YGEJmQ49E5toJalzuJruz7awVRx0nwpUwr7PmqwloRSg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS2PR12MB9567.namprd12.prod.outlook.com (2603:10b6:8:27c::8) by
 BY5PR12MB4130.namprd12.prod.outlook.com (2603:10b6:a03:20b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.15; Fri, 27 Feb
 2026 04:45:14 +0000
Received: from DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5]) by DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5%3]) with mapi id 15.20.9654.014; Fri, 27 Feb 2026
 04:45:12 +0000
Message-ID: <6826e8fa-258d-446e-b18d-98b96ca09d59@amd.com>
Date: Fri, 27 Feb 2026 10:15:06 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: amd: acp: Add ACP6.3 match entries for Cirrus Logic
 parts
To: Simon Trimmer <simont@opensource.cirrus.com>, broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com
References: <20260224130307.526626-1-simont@opensource.cirrus.com>
Content-Language: en-US
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <20260224130307.526626-1-simont@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4PR01CA0050.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:274::7) To DS2PR12MB9567.namprd12.prod.outlook.com
 (2603:10b6:8:27c::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9567:EE_|BY5PR12MB4130:EE_
X-MS-Office365-Filtering-Correlation-Id: b208c47c-ec11-493d-5b4b-08de75bafe3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	AQKUSGH4IhckGYDssg1I//WLP61EU8eVcXNfJYhlz733ZDlK6imn7B/YesAZKmvKTZA7dEBp4iKbbhLsrW59V/rWN5ntmVMyTI1MmiV3sjyVtMFypINfoE+HCCErxNB/SJsXCkqo5zcT7YokLwD0aZ4TSxOIumQDjqUnxOnrTi6EKxgAMfEpY3drauPnQ/OhXPGlWsobUV0l85YQNXetQuujT9+HE8kSSpeMEaz8ZEsuozvkSA16/mPy0wRhrfoLM3KNPjn6Rm1Jb2X978gFItDfF4/iXog1EfpFwWGhdSDEIgdcNBjGIPc0ZN5UaFKMK5yygWd3TJ91nwo5VR6sZ7TGOhtvUzaAL5oOYJ4LNalnTg1wQMG8S9ZUl0hixwiUNpEJMtD4uJwUHgFRSioFSzRJkA5oHhUt8ToHfA/kqa6qmA9dwCEo8slT18Up53vSFl9jwiCxGdFqf7zpBKqmukQ1hjjLHaMZliKTHkTcx1cUrq82pr5zalflWFvR0gaIiQK/w4rrTs+Uh+pUoII7PT8ZoNh6kE6CAPGMaGGiONUG0EYBWGszzix6sOwh0aK2FipjTX0cmbg1PqX056Roqcdq3ftKiSH7ghoNA2IRhoSbeLpt2OPkyjtMmYIvfwLtCiPj0ZfNnQ+WdmxcybX208qqyJo3fD7QduGPvzxyTfkebhrkypZqD2Vw+hYDi45Uuu93Kp/iKZzoByciPXPtJtU2KqdtWvgiOOScqBBV6PA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9567.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZGdYZmVPRWZMcU45SUl5SlhmZ2tBQ0ErWU1YdGF1anR1Z3dOc0xaQ2RvdURy?=
 =?utf-8?B?UVVwdEhHMk5zdnBVZzAwYkhWSTFIM1NXWWEweXdtVlNXM21HUlB5WktDYzY2?=
 =?utf-8?B?U2NieHJOQXlQUE9JdjFGa3pZM1ZIVEhCVHYwSnJER0dzcFJudms5TWRGQjNG?=
 =?utf-8?B?VG5aRDhuaElpTGRVQXNqcmZEZ0FnMTNLMzRzN1Q1ODFNdTAzczgvRTVHQUNo?=
 =?utf-8?B?eC9EVjhyS29YUXROa1ovOHpYU0U4bnZFb1JGTG1OQnNMMUl1OWhzd2hvS0k5?=
 =?utf-8?B?TzE5c212OThrTmIvQ3BWMC96WE5oSk1YR0hoMWs0R3l2R25NWFdid09LNUFj?=
 =?utf-8?B?OGlsZDlSMjloU0QrRWc3ZEd5OThscGF6Tk5JUDAwMlJpQ3AyRUNIWnd0Ykxv?=
 =?utf-8?B?RXRJNWt2YUtGUnZSSHZBTkNYYUloYXMzNnljMElpbXpPMDNRNDRBZisrcjY0?=
 =?utf-8?B?WGIzRjdSV3N0L0NQa1JsWHJpOURQMGdSM2tSOXJGMHdyQ0ZkMjhFN25jdEkw?=
 =?utf-8?B?a21ESUVMMWNkelVvMmZNdzB2clpibTNDWlk1ZUtmdjBueTBXRXpNOS92OFh0?=
 =?utf-8?B?QVY3YkZ6dk5YZlZxVjh5Sktrb3JBZ3dLYlJKZ0x4TU1ld3NSWWpkZEZwVDNm?=
 =?utf-8?B?Tm1jVzhzTzRIRUdJVkt4RzhVajJ2SUxBdVR5ZVY2d3V2ZnBzbEJhWDhJOU9B?=
 =?utf-8?B?ZW92K2twR296alM2Y21PZWJQVEZ1RzNKcnlnNjE2WW9lVitRODI2QVdRWkRL?=
 =?utf-8?B?TU9QR21FWW5HZCtJZzlweUU0c2hZeWhWNGtQVGVhQ2E0aXJlNDJrZmpYd2Nh?=
 =?utf-8?B?cU50MnJRT1pENnZrVkE4Um1EQzFkZU1pZ2NkOTNuSEpRMG8xQWIyY0NOT3Zk?=
 =?utf-8?B?cVZRdUc1OFJVNERiZEdOM0p1V0pRM3FaN1kzY0wxaUhrNUN3ekFpSEhjOXZy?=
 =?utf-8?B?UHdKQWk1aUE4RWc3dEl5WFdrc2Z5NUNEWkozbGJDb2pzc2ppRUVqeXpUOThW?=
 =?utf-8?B?WitiVDVXR0lLKy9GMThjVjhtUUVGbUhiWEw3ams2Sjd0UXplUzRjcG4xYXNE?=
 =?utf-8?B?VW0wK2VNTzJibk1IVlFFZEZsRFc2N2g1eXVJaVpXYjhCYWJuVWhBcDZ5TllR?=
 =?utf-8?B?dVRWY3lKampSOGl0cHhQdlQ0RFBIdGRKU29BWUVmUUw5MCtQT0JFaFBlamZJ?=
 =?utf-8?B?eUtEa2sram1UZXBtcTloelNVMS8vdlpadFNXOUxtNkpGWEN5Mys5STI4Nnd5?=
 =?utf-8?B?ZUt2QjcydU5tT2IwRXM1dkVXbjMrdnFGMTVTckVKTDBLVERtMlNURXZLcGMv?=
 =?utf-8?B?bUd0QU9wd0pxWlZJcjdzQnJJamNrd2pNRlpBVVp3NmlNRUJzSENEZUF4WEpC?=
 =?utf-8?B?UWtOQ0tmUElYMDhRL3NkbkVmSzdaVXBiSkw1cjhGalJXSWRLSlVoYTVzaTZE?=
 =?utf-8?B?MEVESHI2YU9IMWN5QWR6U2NRN1A0VDh3QWZ2RFlHZzRtakUrVWlna29wNVFF?=
 =?utf-8?B?UXJXeGlSSjV2ckQ1ekhwbU1EbU5rek5RRzRWUzBqekp4S3ltcDZFdzVyekhw?=
 =?utf-8?B?OHc5SDk1elBNRW42QzJpbDQybjJYZTRWS3FlbXo2N1dFUG0rQU5tbmMvdmZ1?=
 =?utf-8?B?c0FyQ0QzQ3hMcWF1TmxVMGF1eVZiYkdEVU5Jc1NlR3Bib3FrbkFvUDNWZHR1?=
 =?utf-8?B?aG9FTGRFWjVtSnNIWnlyQktTL1l4WDFiNzRIaFBLRUlHR1FHSURBUnBKOWpE?=
 =?utf-8?B?NGczZGRJVlRSMlY4akd2ZVd0TUVza0orODQ5dDdLSGlKc1J2NVdSSEFyQWs3?=
 =?utf-8?B?WGs2bGN3K3h5K1FaaTl1dkE1YUZERGFSNDNnQ0R2S1lSa3d6OSt1SWdDSW44?=
 =?utf-8?B?cy9DblNEQnRtOGZLV1Fmdm9USWdUWUZ2NnVFN2lZM2pBV0s0MWpqV28wRjJl?=
 =?utf-8?B?ZTFDN2NBczJ0czdVa210eDlORVcvZlFLcTdpTGdsazBhcHBEWnNHc3Zrc1lX?=
 =?utf-8?B?RUx3WHlvTWVsU0ZNYkdtd2NOeERNY0IyVHZITG5UMEYrZ2xkMzJPS2UzelEy?=
 =?utf-8?B?RkZ3QnVxTGRNTDdSWS9BeGNYVXVqZlFSV2dlazZ3a1VreW0yMFZ4RER1a2F6?=
 =?utf-8?B?KzZQYWdKVWNRN2kxOFczdEJaWTlRVkl3UTRleHJEYkV5NHhEMVhsMDJvQXgw?=
 =?utf-8?B?allUL3JMSFpOSjFjTG1UeFJXdTQ2MU1pU25Ha3VXdGlFWmF0WFk5SlJpVlF3?=
 =?utf-8?B?OFNSMjV3WFpKRk9ESEdkVTdpdTdQM3psbFIrZmVyZzJnNUNBT0luMGxFeXp3?=
 =?utf-8?B?MHc5TXVNb2tmbFFkSHR2b1lOcnFtcGRBdWQvZlhYWTI0SnJiMDNBQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b208c47c-ec11-493d-5b4b-08de75bafe3e
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9567.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 04:45:12.4354
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3p1qbGV96VpBph6qX7DOjgl5k2P4S6zxv2tpNpcAiKCE9WB8NvL4uzwgRidy6gphTR25V4O/q6YcjVBeUQByGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4130

On 24/02/26 18:33, Simon Trimmer wrote:
> This adds some match entries for a few system configurations:
>
> cs42l43 link 0 UID 0
> cs35l56 link 1 UID 0
> cs35l56 link 1 UID 1
> cs35l56 link 1 UID 2
> cs35l56 link 1 UID 3
>
> cs42l45 link 1 UID 0
> cs35l63 link 0 UID 0
> cs35l63 link 0 UID 2
> cs35l63 link 0 UID 4
> cs35l63 link 0 UID 6
>
> cs42l45 link 0 UID 0
> cs35l63 link 1 UID 0
> cs35l63 link 1 UID 1
>
> cs42l45 link 0 UID 0
> cs35l63 link 1 UID 1
> cs35l63 link 1 UID 3
>
> cs42l45 link 1 UID 0
> cs35l63 link 0 UID 0
> cs35l63 link 0 UID 1
>
> cs42l43 link 1 UID 0
> cs35l56 link 1 UID 0
> cs35l56 link 1 UID 1
> cs35l56 link 1 UID 2
> cs35l56 link 1 UID 3
>
> cs35l56 link 1 UID 0
> cs35l56 link 1 UID 1
> cs35l56 link 1 UID 2
> cs35l56 link 1 UID 3
>
> cs35l63 link 0 UID 0
> cs35l63 link 0 UID 2
> cs35l63 link 0 UID 4
> cs35l63 link 0 UID 6
>
> cs42l43 link 0 UID 1
>
> cs42l43b link 0 UID 1
>
> cs42l45 link 0 UID 0
>
> cs42l45 link 1 UID 0
>
> Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
Reviewed-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
> ---
>  sound/soc/amd/acp/amd-acp63-acpi-match.c | 413 +++++++++++++++++++++++
>  1 file changed, 413 insertions(+)
>
> diff --git a/sound/soc/amd/acp/amd-acp63-acpi-match.c b/sound/soc/amd/acp/amd-acp63-acpi-match.c
> index 9b6a49c051cd..1dbbaba3c75b 100644
> --- a/sound/soc/amd/acp/amd-acp63-acpi-match.c
> +++ b/sound/soc/amd/acp/amd-acp63-acpi-match.c
> @@ -30,6 +30,20 @@ static const struct snd_soc_acpi_endpoint spk_r_endpoint = {
>  	.group_id = 1
>  };
>  
> +static const struct snd_soc_acpi_endpoint spk_2_endpoint = {
> +	.num = 0,
> +	.aggregated = 1,
> +	.group_position = 2,
> +	.group_id = 1
> +};
> +
> +static const struct snd_soc_acpi_endpoint spk_3_endpoint = {
> +	.num = 0,
> +	.aggregated = 1,
> +	.group_position = 3,
> +	.group_id = 1
> +};
> +
>  static const struct snd_soc_acpi_adr_device rt711_rt1316_group_adr[] = {
>  	{
>  		.adr = 0x000030025D071101ull,
> @@ -103,6 +117,345 @@ static const struct snd_soc_acpi_adr_device rt722_0_single_adr[] = {
>  	}
>  };
>  
> +static const struct snd_soc_acpi_endpoint cs42l43_endpoints[] = {
> +	{ /* Jack Playback Endpoint */
> +		.num = 0,
> +		.aggregated = 0,
> +		.group_position = 0,
> +		.group_id = 0,
> +	},
> +	{ /* DMIC Capture Endpoint */
> +		.num = 1,
> +		.aggregated = 0,
> +		.group_position = 0,
> +		.group_id = 0,
> +	},
> +	{ /* Jack Capture Endpoint */
> +		.num = 2,
> +		.aggregated = 0,
> +		.group_position = 0,
> +		.group_id = 0,
> +	},
> +	{ /* Speaker Playback Endpoint */
> +		.num = 3,
> +		.aggregated = 0,
> +		.group_position = 0,
> +		.group_id = 0,
> +	},
> +};
> +
> +static const struct snd_soc_acpi_adr_device cs35l56x4_l1u3210_adr[] = {
> +	{
> +		.adr = 0x00013301FA355601ull,
> +		.num_endpoints = 1,
> +		.endpoints = &spk_l_endpoint,
> +		.name_prefix = "AMP1"
> +	},
> +	{
> +		.adr = 0x00013201FA355601ull,
> +		.num_endpoints = 1,
> +		.endpoints = &spk_r_endpoint,
> +		.name_prefix = "AMP2"
> +	},
> +	{
> +		.adr = 0x00013101FA355601ull,
> +		.num_endpoints = 1,
> +		.endpoints = &spk_2_endpoint,
> +		.name_prefix = "AMP3"
> +	},
> +	{
> +		.adr = 0x00013001FA355601ull,
> +		.num_endpoints = 1,
> +		.endpoints = &spk_3_endpoint,
> +		.name_prefix = "AMP4"
> +	},
> +};
> +
> +static const struct snd_soc_acpi_adr_device cs35l63x2_l0u01_adr[] = {
> +	{
> +		.adr = 0x00003001FA356301ull,
> +		.num_endpoints = 1,
> +		.endpoints = &spk_l_endpoint,
> +		.name_prefix = "AMP1"
> +	},
> +	{
> +		.adr = 0x00003101FA356301ull,
> +		.num_endpoints = 1,
> +		.endpoints = &spk_r_endpoint,
> +		.name_prefix = "AMP2"
> +	},
> +};
> +
> +static const struct snd_soc_acpi_adr_device cs35l63x2_l1u01_adr[] = {
> +	{
> +		.adr = 0x00013001FA356301ull,
> +		.num_endpoints = 1,
> +		.endpoints = &spk_l_endpoint,
> +		.name_prefix = "AMP1"
> +	},
> +	{
> +		.adr = 0x00013101FA356301ull,
> +		.num_endpoints = 1,
> +		.endpoints = &spk_r_endpoint,
> +		.name_prefix = "AMP2"
> +	},
> +};
> +
> +static const struct snd_soc_acpi_adr_device cs35l63x2_l1u13_adr[] = {
> +	{
> +		.adr = 0x00013101FA356301ull,
> +		.num_endpoints = 1,
> +		.endpoints = &spk_l_endpoint,
> +		.name_prefix = "AMP1"
> +	},
> +	{
> +		.adr = 0x00013301FA356301ull,
> +		.num_endpoints = 1,
> +		.endpoints = &spk_r_endpoint,
> +		.name_prefix = "AMP2"
> +	},
> +};
> +
> +static const struct snd_soc_acpi_adr_device cs35l63x4_l0u0246_adr[] = {
> +	{
> +		.adr = 0x00003001FA356301ull,
> +		.num_endpoints = 1,
> +		.endpoints = &spk_l_endpoint,
> +		.name_prefix = "AMP1"
> +	},
> +	{
> +		.adr = 0x00003201FA356301ull,
> +		.num_endpoints = 1,
> +		.endpoints = &spk_r_endpoint,
> +		.name_prefix = "AMP2"
> +	},
> +	{
> +		.adr = 0x00003401FA356301ull,
> +		.num_endpoints = 1,
> +		.endpoints = &spk_2_endpoint,
> +		.name_prefix = "AMP3"
> +	},
> +	{
> +		.adr = 0x00003601FA356301ull,
> +		.num_endpoints = 1,
> +		.endpoints = &spk_3_endpoint,
> +		.name_prefix = "AMP4"
> +	},
> +};
> +
> +static const struct snd_soc_acpi_adr_device cs42l43_l0u0_adr[] = {
> +	{
> +		.adr = 0x00003001FA424301ull,
> +		.num_endpoints = ARRAY_SIZE(cs42l43_endpoints),
> +		.endpoints = cs42l43_endpoints,
> +		.name_prefix = "cs42l43"
> +	}
> +};
> +
> +static const struct snd_soc_acpi_adr_device cs42l43_l0u1_adr[] = {
> +	{
> +		.adr = 0x00003101FA424301ull,
> +		.num_endpoints = ARRAY_SIZE(cs42l43_endpoints),
> +		.endpoints = cs42l43_endpoints,
> +		.name_prefix = "cs42l43"
> +	}
> +};
> +
> +static const struct snd_soc_acpi_adr_device cs42l43b_l0u1_adr[] = {
> +	{
> +		.adr = 0x00003101FA2A3B01ull,
> +		.num_endpoints = ARRAY_SIZE(cs42l43_endpoints),
> +		.endpoints = cs42l43_endpoints,
> +		.name_prefix = "cs42l43"
> +	}
> +};
> +
> +static const struct snd_soc_acpi_adr_device cs42l43_l1u0_cs35l56x4_l1u0123_adr[] = {
> +	{
> +		.adr = 0x00013001FA424301ull,
> +		.num_endpoints = ARRAY_SIZE(cs42l43_endpoints),
> +		.endpoints = cs42l43_endpoints,
> +		.name_prefix = "cs42l43"
> +	},
> +	{
> +		.adr = 0x00013001FA355601ull,
> +		.num_endpoints = 1,
> +		.endpoints = &spk_l_endpoint,
> +		.name_prefix = "AMP1"
> +	},
> +	{
> +		.adr = 0x00013101FA355601ull,
> +		.num_endpoints = 1,
> +		.endpoints = &spk_r_endpoint,
> +		.name_prefix = "AMP2"
> +	},
> +	{
> +		.adr = 0x00013201FA355601ull,
> +		.num_endpoints = 1,
> +		.endpoints = &spk_2_endpoint,
> +		.name_prefix = "AMP3"
> +	},
> +	{
> +		.adr = 0x00013301FA355601ull,
> +		.num_endpoints = 1,
> +		.endpoints = &spk_3_endpoint,
> +		.name_prefix = "AMP4"
> +	},
> +};
> +
> +static const struct snd_soc_acpi_adr_device cs42l45_l0u0_adr[] = {
> +	{
> +		.adr = 0x00003001FA424501ull,
> +		/* Re-use endpoints, but cs42l45 has no speaker */
> +		.num_endpoints = ARRAY_SIZE(cs42l43_endpoints) - 1,
> +		.endpoints = cs42l43_endpoints,
> +		.name_prefix = "cs42l45"
> +	}
> +};
> +
> +static const struct snd_soc_acpi_adr_device cs42l45_l1u0_adr[] = {
> +	{
> +		.adr = 0x00013001FA424501ull,
> +		/* Re-use endpoints, but cs42l45 has no speaker */
> +		.num_endpoints = ARRAY_SIZE(cs42l43_endpoints) - 1,
> +		.endpoints = cs42l43_endpoints,
> +		.name_prefix = "cs42l45"
> +	}
> +};
> +
> +static const struct snd_soc_acpi_link_adr acp63_cs35l56x4_l1u3210[] = {
> +	{
> +		.mask = BIT(1),
> +		.num_adr = ARRAY_SIZE(cs35l56x4_l1u3210_adr),
> +		.adr_d = cs35l56x4_l1u3210_adr,
> +	},
> +	{}
> +};
> +
> +static const struct snd_soc_acpi_link_adr acp63_cs35l63x4_l0u0246[] = {
> +	{
> +		.mask = BIT(0),
> +		.num_adr = ARRAY_SIZE(cs35l63x4_l0u0246_adr),
> +		.adr_d = cs35l63x4_l0u0246_adr,
> +	},
> +	{}
> +};
> +
> +static const struct snd_soc_acpi_link_adr acp63_cs42l43_l0u1[] = {
> +	{
> +		.mask = BIT(0),
> +		.num_adr = ARRAY_SIZE(cs42l43_l0u1_adr),
> +		.adr_d = cs42l43_l0u1_adr,
> +	},
> +	{}
> +};
> +
> +static const struct snd_soc_acpi_link_adr acp63_cs42l43b_l0u1[] = {
> +	{
> +		.mask = BIT(0),
> +		.num_adr = ARRAY_SIZE(cs42l43b_l0u1_adr),
> +		.adr_d = cs42l43b_l0u1_adr,
> +	},
> +	{}
> +};
> +
> +static const struct snd_soc_acpi_link_adr acp63_cs42l43_l0u0_cs35l56x4_l1u3210[] = {
> +	{
> +		.mask = BIT(0),
> +		.num_adr = ARRAY_SIZE(cs42l43_l0u0_adr),
> +		.adr_d = cs42l43_l0u0_adr,
> +	},
> +	{
> +		.mask = BIT(1),
> +		.num_adr = ARRAY_SIZE(cs35l56x4_l1u3210_adr),
> +		.adr_d = cs35l56x4_l1u3210_adr,
> +	},
> +	{}
> +};
> +
> +static const struct snd_soc_acpi_link_adr acp63_cs42l43_l1u0_cs35l56x4_l1u0123[] = {
> +	{
> +		.mask = BIT(1),
> +		.num_adr = ARRAY_SIZE(cs42l43_l1u0_cs35l56x4_l1u0123_adr),
> +		.adr_d = cs42l43_l1u0_cs35l56x4_l1u0123_adr,
> +	},
> +	{}
> +};
> +
> +static const struct snd_soc_acpi_link_adr acp63_cs42l45_l0u0[] = {
> +	{
> +		.mask = BIT(0),
> +		.num_adr = ARRAY_SIZE(cs42l45_l0u0_adr),
> +		.adr_d = cs42l45_l0u0_adr,
> +	},
> +	{}
> +};
> +
> +static const struct snd_soc_acpi_link_adr acp63_cs42l45_l0u0_cs35l63x2_l1u01[] = {
> +	{
> +		.mask = BIT(0),
> +		.num_adr = ARRAY_SIZE(cs42l45_l0u0_adr),
> +		.adr_d = cs42l45_l0u0_adr,
> +	},
> +	{
> +		.mask = BIT(1),
> +		.num_adr = ARRAY_SIZE(cs35l63x2_l1u01_adr),
> +		.adr_d = cs35l63x2_l1u01_adr,
> +	},
> +	{}
> +};
> +
> +static const struct snd_soc_acpi_link_adr acp63_cs42l45_l0u0_cs35l63x2_l1u13[] = {
> +	{
> +		.mask = BIT(0),
> +		.num_adr = ARRAY_SIZE(cs42l45_l0u0_adr),
> +		.adr_d = cs42l45_l0u0_adr,
> +	},
> +	{
> +		.mask = BIT(1),
> +		.num_adr = ARRAY_SIZE(cs35l63x2_l1u13_adr),
> +		.adr_d = cs35l63x2_l1u13_adr,
> +	},
> +	{}
> +};
> +
> +static const struct snd_soc_acpi_link_adr acp63_cs42l45_l1u0[] = {
> +	{
> +		.mask = BIT(1),
> +		.num_adr = ARRAY_SIZE(cs42l45_l1u0_adr),
> +		.adr_d = cs42l45_l1u0_adr,
> +	},
> +	{}
> +};
> +
> +static const struct snd_soc_acpi_link_adr acp63_cs42l45_l1u0_cs35l63x2_l0u01[] = {
> +	{
> +		.mask = BIT(1),
> +		.num_adr = ARRAY_SIZE(cs42l45_l1u0_adr),
> +		.adr_d = cs42l45_l1u0_adr,
> +	},
> +	{
> +		.mask = BIT(0),
> +		.num_adr = ARRAY_SIZE(cs35l63x2_l0u01_adr),
> +		.adr_d = cs35l63x2_l0u01_adr,
> +	},
> +	{}
> +};
> +
> +static const struct snd_soc_acpi_link_adr acp63_cs42l45_l1u0_cs35l63x4_l0u0246[] = {
> +	{
> +		.mask = BIT(1),
> +		.num_adr = ARRAY_SIZE(cs42l45_l1u0_adr),
> +		.adr_d = cs42l45_l1u0_adr,
> +	},
> +	{
> +		.mask = BIT(0),
> +		.num_adr = ARRAY_SIZE(cs35l63x4_l0u0246_adr),
> +		.adr_d = cs35l63x4_l0u0246_adr,
> +	},
> +	{}
> +};
> +
>  static const struct snd_soc_acpi_link_adr acp63_rt722_only[] = {
>  	{
>  		.mask = BIT(0),
> @@ -135,6 +488,66 @@ struct snd_soc_acpi_mach snd_soc_acpi_amd_acp63_sdw_machines[] = {
>  		.links = acp63_4_in_1_sdca,
>  		.drv_name = "amd_sdw",
>  	},
> +	{
> +		.link_mask = BIT(0) | BIT(1),
> +		.links = acp63_cs42l43_l0u0_cs35l56x4_l1u3210,
> +		.drv_name = "amd_sdw",
> +	},
> +	{
> +		.link_mask = BIT(0) | BIT(1),
> +		.links = acp63_cs42l45_l1u0_cs35l63x4_l0u0246,
> +		.drv_name = "amd_sdw",
> +	},
> +	{
> +		.link_mask = BIT(0) | BIT(1),
> +		.links = acp63_cs42l45_l0u0_cs35l63x2_l1u01,
> +		.drv_name = "amd_sdw",
> +	},
> +	{
> +		.link_mask = BIT(0) | BIT(1),
> +		.links = acp63_cs42l45_l0u0_cs35l63x2_l1u13,
> +		.drv_name = "amd_sdw",
> +	},
> +	{
> +		.link_mask = BIT(0) | BIT(1),
> +		.links = acp63_cs42l45_l1u0_cs35l63x2_l0u01,
> +		.drv_name = "amd_sdw",
> +	},
> +	{
> +		.link_mask = BIT(1),
> +		.links = acp63_cs42l43_l1u0_cs35l56x4_l1u0123,
> +		.drv_name = "amd_sdw",
> +	},
> +	{
> +		.link_mask = BIT(1),
> +		.links = acp63_cs35l56x4_l1u3210,
> +		.drv_name = "amd_sdw",
> +	},
> +	{
> +		.link_mask = BIT(0),
> +		.links = acp63_cs35l63x4_l0u0246,
> +		.drv_name = "amd_sdw",
> +	},
> +	{
> +		.link_mask = BIT(0),
> +		.links = acp63_cs42l43_l0u1,
> +		.drv_name = "amd_sdw",
> +	},
> +	{
> +		.link_mask = BIT(0),
> +		.links = acp63_cs42l43b_l0u1,
> +		.drv_name = "amd_sdw",
> +	},
> +	{
> +		.link_mask = BIT(0),
> +		.links = acp63_cs42l45_l0u0,
> +		.drv_name = "amd_sdw",
> +	},
> +	{
> +		.link_mask = BIT(1),
> +		.links = acp63_cs42l45_l1u0,
> +		.drv_name = "amd_sdw",
> +	},
>  	{},
>  };
>  EXPORT_SYMBOL(snd_soc_acpi_amd_acp63_sdw_machines);

