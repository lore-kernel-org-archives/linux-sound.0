Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010071.outbound.protection.outlook.com [52.101.61.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DDC878F39
	for <linux-sound@vger.kernel.org>; Sat, 27 Jun 2026 01:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782522809; cv=fail; b=fPJeJmrrlNrZfqbMi+ex3O6EESchk2b9fDdyCcWEPwiTUzvruJLPZc2cSiaSHpvlVYmN/ynVPcsTYcmPphhzKSq9n5IkV54KG6Vx9aOhJpCn4hjr2RWPnZPfElWB7u/JeU3fi1CD+Oub6fkixP0BsDJhDZCkSejz36kGmBYZ6Ys=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782522809; c=relaxed/simple;
	bh=4SOCcUwDvGUd9iylLTTnOW9zpVwPlquV+ZjJX1KQBqM=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=RE5vjawneqLqsqwNGLMJTAQhc5s69ei04JJcoAflX+cx7JIweKd/jm94nBXN4Xiv6i5BR73eFrVnxJWpJmwe/LAV8pzNz0djmKb0LECiRbav8RHhlkL4M72Yirzl3UOP+yURJw94bYQf0offdPhZfuXu9/zAu6aCK0EidTZehO8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=zLaI7Fte; arc=fail smtp.client-ip=52.101.61.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="zLaI7Fte"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T/mGBsEHy/Crct0J7RP9+jTdZOZufsxIeycgVPhQEjXsCdPogiSHZgOM3Bf53DNigGP5tkEnNb6XXhKIRRsoRtMlYINf8u110/hOVo+WEBUB2Qvhr/7ZustPjc9h0k7BRuXxqfquaZstr/p/T0ZCXpurWzRlYwb/0MzwNTIg8pNR+6rjUE4G2kTtXzTsvlO/76qCuMABo81lVbqcQBV9J4lpSdGpQLB+IP74T1yq49j80J85bEet2kWVKiipAwnwEVKDg147ofwBp+FEnu6+0srDKAdhjj5BjM/XmHvYLepiVHmNEcH1IKYRGYY9g7l1YdfE5zK8vUx7t3gw1sLe5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lce/81+WHnujiDtvhifS9mBJy2VqtrhkNgKZt0AiKy0=;
 b=WZ8/Dz3tr99PNpY76Ykg3R5J/rvXYKE8WgG1PkCfpMSKQ+UfwbbG5WhG2NRO7E8tR5Bm481IzhBrcJb1YLbMPJpZzetcMXpi0ynVkKmGytytw+k6vaV5UZg5UOe/ubCTCIxIGGvZ7SardnWL9pVg8oUmb8O8um/fMHCPiQCO7RXgZsRsA72LJFPjxo4m5hVdTto6rXPN3oZT+03/+9arJugSVvNTCpwScIignVowffKYHvpmzuzY57K8T3YuhdrI73az056FNfF3MA2J6kb3oxr8wdTmsMuZeomSMAhN76kk858OQDP5F3tKxsb/PyfBTvC3WamGi1jOKFRkRocI3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lce/81+WHnujiDtvhifS9mBJy2VqtrhkNgKZt0AiKy0=;
 b=zLaI7FteIO2FNHyziHyt+vJhyP4UJQDfO5/DKI5z4GpvIH196ruUaWDTi1M8bqkb8+WYMoXBPggav/qo5vCkX5wddPFQwFns7D23Z/V1lPnsA3g2rnhlr/MyVIjFzJ/LuA0gnOrCVRzn2YkOjmNVEPieLXY3snZ+R5qujxggQwc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS2PR12MB9567.namprd12.prod.outlook.com (2603:10b6:8:27c::8) by
 BL3PR12MB6548.namprd12.prod.outlook.com (2603:10b6:208:38f::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.13; Sat, 27 Jun 2026 01:13:22 +0000
Received: from DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5]) by DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5%2]) with mapi id 15.21.0159.015; Sat, 27 Jun 2026
 01:13:22 +0000
Message-ID: <d7fe1201-d746-42cd-89ff-bef10f011a77@amd.com>
Date: Sat, 27 Jun 2026 06:43:11 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] ASoC: sdw_utils: tidyup
 asoc_sdw_parse_sdw_endpoints()
Content-Language: en-US
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, Jaroslav Kysela
 <perex@perex.cz>, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org,
 Mark Brown <broonie@kernel.org>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Takashi Iwai <tiwai@suse.com>,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
References: <87ldc1etyp.wl-kuninori.morimoto.gx@renesas.com>
 <87ik75etxw.wl-kuninori.morimoto.gx@renesas.com>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <87ik75etxw.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BM1PR01CA0151.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:68::21) To DS2PR12MB9567.namprd12.prod.outlook.com
 (2603:10b6:8:27c::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9567:EE_|BL3PR12MB6548:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b93fbe3-59f8-4307-df06-08ded3e947f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|23010399003|921020|22082099003|18002099003|6133799003|11063799006|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	E9YmOK5uzhz4fKd4Lw7TYU4zQ6MFjoRPLG1IHH2w1+QeFOtlZ56UbeptdiUyz4VOEO1aR60WSsoVgUuBRp0VA7yx5khvZ26pmJkogyI0Kx5Jqft+vqWUI27hnQS/4Bo5pSOpH0xeFUb7rb5gZi005WMAZqNrZxTdZ5XPP2r1DJQ+U81MoOUmCsp/kSDjLyXtsmJKUEhbp9fowd7cfq+o1f66EhKzTaxzCxFqkpjPipOBrf1SBBpJFxreLU5X7naSd4XivLuif1FYKIwlp1D76PJs4p4mbd2frqXt6biM8YqVgitjmZABN4ornDG3EwQhkhbbHgtMK2Uhg0ZGF4Yofh2nPzs2VHm/Fjabd1CuYe4b63X5xEvtkBUOQYQFYj7aADpbPy8fp0rjKHNzFUd2OxhoYor/KdNC34UUmNM3LdBAXQcORbzAGstz13dgsRAnyJCTXJ5GXA+Or3mRnAZutUm2ub24giyUHt/JT3NpvfLf10uO6dEaHBeRh6GqUiibMo20SyHZEU6MOM+HBQpniWV2Ol8hQpC9+O45dv1D0Sm71SIrsOg9+TnzZ0O7rSFGO9QctBV5JOAAktQS+d6ANtdhbex6SzfIyXvX7qdimw4tLf685ny5DgSCDVdR61GhZ4O2/FfuXosDOc7ZRbRDsvoU2BBG7ke0CkX6DHmkYslBR5gCM/3uhn5CmoZ2US0fC+WUTPZJS/NFO+/FYW63Yg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9567.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(23010399003)(921020)(22082099003)(18002099003)(6133799003)(11063799006)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MC9jR0NxM2NzbURIZ2ZUSnViQXJnV2lDOEF6RmxLWWdFM3FUdUdoVWtNTEd6?=
 =?utf-8?B?RTRhVGEwZElYZThCOHp3TW1CRnF4WjJheUNBamZFY3Q2dTVsRGtmZTZTMVdQ?=
 =?utf-8?B?OXhXTmlrb25PNnJwZUxISTJmRFpoaDg5YXdLQ0RKTkNJZXJFS29UeDRCNVJs?=
 =?utf-8?B?dzNZeWZkYktlQ2VCYVdLRE41cjF6Sk1nVVhZOXByanlPZUJVeDJKZ2I3Y3Ey?=
 =?utf-8?B?WThVbHZaZ3dLSDJvWWd4TG5jOUM2eGtHSkFhYkhXZjNkNXMwa3VSbCtseUoy?=
 =?utf-8?B?UVViSTk2dWVaaVVJdG1hYjlwYzJGdXMzWEZNSlVSdXRRQ3o5YlU0U1ZMa00z?=
 =?utf-8?B?WGgrZHhwSS9FSVZ6RytLMXpCU240UVdOZUJwa2ZMN0FCcWt6bXVGTW1GZ0to?=
 =?utf-8?B?N1E3RDVENytVV3Z3NGI4TW9DSXJ1emtuekFXZ0t5QVQzd1k5clB1QTNJQWFP?=
 =?utf-8?B?b1NMciswYUZXMUN4NUlSWFVRdlpDMUVNYzk5RmdrbGpKMnRET3FjZENxWmZz?=
 =?utf-8?B?OXhXcHJJbUN2TWVsYW1VZllxSG43YklHNDlLQ3pqbElrL0ZWa3dROVI4Q3Ja?=
 =?utf-8?B?eDBJUmtUSXZsb01Xdkc4UmptcW1uWEhGOE93UVlZalp2YkMyc0RaYUVaTEJE?=
 =?utf-8?B?aHNWcjZreWdIbjEvekRBdmJkZTFIRktmSzhVQ1lxMVZnTWlMeU92VjZua25S?=
 =?utf-8?B?M0l3ejZvZHJNc044QWNLZHdyU0VXSUNYS3hvTkVwZHZKUVhDeVh4N0R5aE83?=
 =?utf-8?B?bXJxVjA4dHhmNjlJN2dTVExPYmhDTTZDd09RUVV1U0xzLzFjMVVOMWw5M0hn?=
 =?utf-8?B?VFhIaWVZVjdhQXlSM0hsMTFsZXo1L0kvNmVwemgrL3dXclRvU2VRRnh2TzlJ?=
 =?utf-8?B?eXZiOC9uOFd2Vm9wdklSWFVSSExWWkYwTExtQXU2aXVqdVZybktuYjY2R2d3?=
 =?utf-8?B?Njh6UDBQQXJpWlB2cTdNaENBbHoyVVN2UjRmSGx5bXlPcTJLRE5PMS81QTl1?=
 =?utf-8?B?dUYyQVdpRzIzVU5kdXNLbWIwblpqRldFZkp3RUcwTSs0ai9WRW85UGRmb0hp?=
 =?utf-8?B?N2lrNVMrTzQvUU1ESFFsRWRaakZZYk9hVlJXb0YrM3F0RDI1SHNGc2JZZUVk?=
 =?utf-8?B?TVlOWWVEODNvSk12MVRFVS9nYlQwc09UclR5ZnFVUE1Kd3UxY25vRDVtUlpj?=
 =?utf-8?B?WDBxTllZY051OVpVMTN5Vnh1WitURWpCVnRjOTZHRWxLUmlBMWZ0WUNWb2xB?=
 =?utf-8?B?SGtWS3QvSVd1ZGxSWEh5cS9HZEhsNDVxNFFrVHV3QnV4ODBxTGx4eWMwaytm?=
 =?utf-8?B?OEVqYnZ5cU5vL3VnN3I1OW95bEg1bFZRSDlRTDd1M0tVVGRNNGJGVHFnbXpu?=
 =?utf-8?B?dVQzTHh1S1A3MUZCS1kxYW5LSkNyOHMzVklXaitCanRpRm9JNmszamtRZktZ?=
 =?utf-8?B?SjE3Y0NQVDdWOTdpZmdZczByUGNUOWFQRXd5cmh6ampIWU92TUdJVktKL1ZX?=
 =?utf-8?B?TTB5djhXTmdWQnF6Z1FlWnMvZUV0QnB6YzM1MkhCOU5DUFNsUm5FN1M4OGVz?=
 =?utf-8?B?Z1owMkFSdFliYzBqTUZtb0thMXJQdHREMjRmZzRVc1VVWGdVLzBJRExMYkxF?=
 =?utf-8?B?Q0ZXSURPMU9neVhNVlNXaFI4dFpnZkFMdFBiWEJPUUY1L3FqV1RWZHhIcTlu?=
 =?utf-8?B?SzdkZnpuSVVKMzBwR1lpZ29kYnRMeUtGZndzU2drQk5FM3FxcC82UGZPTUhE?=
 =?utf-8?B?aG9KYjRPUlFQekNIMW1ZS1czSGREOFZ2SFVVdXRxZEQrYUFsRzBPSS9meVFT?=
 =?utf-8?B?OTJXbUozazF1c0x4ZSttbitJOUxKMFdXRk45RXJLZzhDNGIwZm9HTXROR3Iz?=
 =?utf-8?B?M3ZrZjEyWEp5RktaaXU1azVwWnlJQmxsbExtbElYQlRYQlE4TUFCSDdxYnNM?=
 =?utf-8?B?clZPZFZnME02Zmk2YWs5OXpsdU03S2c4aW8rcndVYVp0M1dHUGlScVVFYXVP?=
 =?utf-8?B?SExkaEsyeWFiYlU1Tk9nYjVIVXBGaGVZdFRQVjdVaUdLc0E5MEZoNEZmaVdh?=
 =?utf-8?B?bFpmaGJoRkcyYTRxaGhnMWJxTDcrZllmeEN2aG12Rk5uYko5dUpFZjJYODlP?=
 =?utf-8?B?N2t1aUF3M0lmQ0Q4K08ydk90c09ncWRROU5JS3h5ZUl4MFhjRFJxMDRZckxy?=
 =?utf-8?B?clNyWEV3QlgvTVJNeWhvNVhUZWVod1VLNUFOeHBVUFJsT3FCSlJoK09xZ3Ex?=
 =?utf-8?B?cTZTemtxWDBJSU5TRzVMQjRWWVJVUlBiNXFRMHB4MHI2b01IdnVUSTR6Qitp?=
 =?utf-8?B?d3dJMWhCUS91N0pxaDI5djVWdUtvUzJZVDZtM1J6ZVFtdVgzWGlpQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b93fbe3-59f8-4307-df06-08ded3e947f1
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9567.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2026 01:13:22.4684
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KLEFKYee4WAT7LBxoooNITceEqJ/zMqKRCRdyV6nZXeVx8W3LvCQbNTCf0qaZEDNQm/ZTHqGTvnar862HHTeCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6548

On 26/06/26 11:15, Kuninori Morimoto wrote:
> We can avoid to use *card. Tidyup it.
>
> Current code makes old style / new style conversion difficult.
> To make future conversions easier to understand, this patch clean up the
> code a little. but no functional change.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
> ---
>  include/sound/soc_sdw_utils.h           | 3 ++-
>  sound/soc/amd/acp/acp-sdw-legacy-mach.c | 2 +-
>  sound/soc/amd/acp/acp-sdw-sof-mach.c    | 2 +-
>  sound/soc/intel/boards/sof_sdw.c        | 2 +-
>  sound/soc/sdw_utils/soc_sdw_utils.c     | 5 ++---
>  5 files changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/include/sound/soc_sdw_utils.h b/include/sound/soc_sdw_utils.h
> index 443d63dc6ea37..9b28e9aef4f1d 100644
> --- a/include/sound/soc_sdw_utils.h
> +++ b/include/sound/soc_sdw_utils.h
> @@ -182,7 +182,8 @@ struct asoc_sdw_dailink *asoc_sdw_find_dailink(struct asoc_sdw_dailink *dailinks
>  					       const struct snd_soc_acpi_endpoint *new);
>  int asoc_sdw_get_dai_type(u32 type);
>  
> -int asoc_sdw_parse_sdw_endpoints(struct snd_soc_card *card,
> +int asoc_sdw_parse_sdw_endpoints(struct device *dev,
> +				 struct asoc_sdw_mc_private *ctx,
>  				 struct snd_soc_aux_dev *soc_aux,
>  				 struct asoc_sdw_dailink *soc_dais,
>  				 struct asoc_sdw_endpoint *soc_ends,
> diff --git a/sound/soc/amd/acp/acp-sdw-legacy-mach.c b/sound/soc/amd/acp/acp-sdw-legacy-mach.c
> index e8b6819cc4b45..9726a9d33ec6e 100644
> --- a/sound/soc/amd/acp/acp-sdw-legacy-mach.c
> +++ b/sound/soc/amd/acp/acp-sdw-legacy-mach.c
> @@ -432,7 +432,7 @@ static int soc_card_dai_links_create(struct snd_soc_card *card)
>  	if (!soc_aux)
>  		return -ENOMEM;
>  
> -	ret = asoc_sdw_parse_sdw_endpoints(card, soc_aux, soc_dais, soc_ends, &num_confs);
> +	ret = asoc_sdw_parse_sdw_endpoints(dev, ctx, soc_aux, soc_dais, soc_ends, &num_confs);
>  	if (ret < 0)
>  		return ret;
>  
> diff --git a/sound/soc/amd/acp/acp-sdw-sof-mach.c b/sound/soc/amd/acp/acp-sdw-sof-mach.c
> index a423853f3a97d..963ce6fd40122 100644
> --- a/sound/soc/amd/acp/acp-sdw-sof-mach.c
> +++ b/sound/soc/amd/acp/acp-sdw-sof-mach.c
> @@ -303,7 +303,7 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
>  	if (!sof_aux)
>  		return -ENOMEM;
>  
> -	ret = asoc_sdw_parse_sdw_endpoints(card, sof_aux, sof_dais, sof_ends, &num_devs);
> +	ret = asoc_sdw_parse_sdw_endpoints(dev, ctx, sof_aux, sof_dais, sof_ends, &num_devs);
>  	if (ret < 0)
>  		return ret;
>  
> diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
> index d43daf9b025df..24226a387cc2a 100644
> --- a/sound/soc/intel/boards/sof_sdw.c
> +++ b/sound/soc/intel/boards/sof_sdw.c
> @@ -1285,7 +1285,7 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
>  		goto err_dai;
>  	}
>  
> -	ret = asoc_sdw_parse_sdw_endpoints(card, sof_aux, sof_dais, sof_ends, &num_confs);
> +	ret = asoc_sdw_parse_sdw_endpoints(dev, ctx, sof_aux, sof_dais, sof_ends, &num_confs);
>  	if (ret < 0)
>  		goto err_end;
>  
> diff --git a/sound/soc/sdw_utils/soc_sdw_utils.c b/sound/soc/sdw_utils/soc_sdw_utils.c
> index 073f3f9205a73..dd2cc57059d6a 100644
> --- a/sound/soc/sdw_utils/soc_sdw_utils.c
> +++ b/sound/soc/sdw_utils/soc_sdw_utils.c
> @@ -1976,14 +1976,13 @@ static int is_sdca_endpoint_present(struct device *dev,
>  	return ret;
>  }
>  
> -int asoc_sdw_parse_sdw_endpoints(struct snd_soc_card *card,
> +int asoc_sdw_parse_sdw_endpoints(struct device *dev,
> +				 struct asoc_sdw_mc_private *ctx,
>  				 struct snd_soc_aux_dev *soc_aux,
>  				 struct asoc_sdw_dailink *soc_dais,
>  				 struct asoc_sdw_endpoint *soc_ends,
>  				 int *num_devs)
>  {
> -	struct device *dev = card->dev;
> -	struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
>  	struct snd_soc_acpi_mach *mach = dev_get_platdata(dev);
>  	struct snd_soc_acpi_mach_params *mach_params = &mach->mach_params;
>  	const struct snd_soc_acpi_link_adr *adr_link;

