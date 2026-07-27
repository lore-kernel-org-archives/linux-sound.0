Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010044.outbound.protection.outlook.com [52.101.61.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9617624A076;
	Mon, 27 Jul 2026 04:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785127488; cv=fail; b=SJv5JtklTYlGEdXZFI0i1L0BRn/59E8OzmWm8igJFJBvHhjtK5OZGYZ4VTKchV6TE1DYYl58ex9TugbkvO3vfZ7Xt7uSZe9E3IC/e5lknq14q0DgHLu1yM6y45o+xsLA/XGa0GnQgWc1CiJqFEHCkGk42NPkDAz1IMUnnoaiP2g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785127488; c=relaxed/simple;
	bh=ESz8tVPMkeJtUAKAdM/I/RQTSkV9fxtvUjDYJKZ/AIQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=n3KxTERAVCWlWJj2Bes1e63TRaBBbgI84QRMKWBUsv43a7xtOBSi9Q9pAeJBbLnDmtvMItLiG1QtAni6pK++Y6WVEAOP37ekBy8dnl53JfMP6sLvGx9bRS9pcB0Dc/JeAySu2bZV9sBNScGqvG7vENXLCHKUugSQWqFs76aIx2g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=h9KRTQrd; arc=fail smtp.client-ip=52.101.61.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="h9KRTQrd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tTMEcn5VR0hXnR6jynSChdrivE1zipemHqWKzQdTvdRVFt0qToctVMy6WvNWZ318p0fROp0Z12rgBvQ6vJbPXzV3jivln5jqKHwoqoQDX9pXS82u6ThXzEndwjHh7AnSe+u3Z7Qk3oG0nfoFv3S+YYzdMFwKcK5F2sAg7JL4wJBEohV2ztFpr1rezxrIWaRF8vn0mRUYcqtHtiIFNtEYlNThpZwojUJ93b3+wnSHAfBJdw6TQ+JnyGEn2tff0A8H4U+vflg6orqo0QApgyMpyNJXKqi3PwcPW7B34kQB9/8H/FD/82f34HXwjO3xYEl/zyjeusEP69pG5VX2TGJv+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TASwUBcfVw5/6tF3JfJxKGu6JBd/d86yyqvHePkHeg0=;
 b=EUT12zSYlxc0GEKARoifyhQBu0as7E0kOLd8rQt51UonoB82baclfAZHT9SRKzMa2viFz3NU4W0d+iZKaJL4MmBcH+QP/XP++kxLNWTPWjiPF5iq77zQXDmO468IeGIwGNC1aZh42qW8i0frd/EaC6NmlaLAk5pwWBCUehNppCt/JcyZtB4TSYlfTbkrJ34SygFDPX0RuJrT+oJmB1cdmz8leyslF6yjxaH65qj9YPnHKaXj0xR7AwupVhEnO8TBD/9cxh6fdWGJnXwL6oERkWpw18+NkTKkgMrYdEV7wnqHUPQammie9HqX/Hx3dW9jb7xJnJ4wqwe7U/kFxVF4kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TASwUBcfVw5/6tF3JfJxKGu6JBd/d86yyqvHePkHeg0=;
 b=h9KRTQrdHLYO5xLbZuH2EE3Z75PG3OUPLsXrWEr2nDyNxGscDEqys/QfIeo/deaA8QuaqFerDkgWIe29yak/qIKOAhXwFUwgfqpLmJekEgRyDn3GULejxl2tfQ+2tUoMcHv41YPGMX1tM7Y1dHUwEjdfzy6V9Z8rg6Kwkvb/du4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS2PR12MB9567.namprd12.prod.outlook.com (2603:10b6:8:27c::8) by
 SAWPR12MB999268.namprd12.prod.outlook.com (2603:10b6:806:55d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 04:44:44 +0000
Received: from DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5]) by DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5%2]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 04:44:44 +0000
Message-ID: <f8ca1f18-ca74-4dce-8015-a99cb196b862@amd.com>
Date: Mon, 27 Jul 2026 10:14:12 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] ASoC: amd: acp: remove conditional return with no
 effect
To: Sang-Heon Jeon <ekffu200098@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
References: <20260725160344.916838-1-ekffu200098@gmail.com>
 <20260725160344.916838-2-ekffu200098@gmail.com>
Content-Language: en-US
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <20260725160344.916838-2-ekffu200098@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0051.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::9) To CH1PR12MB9576.namprd12.prod.outlook.com
 (2603:10b6:610:2ad::14)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9567:EE_|SAWPR12MB999268:EE_
X-MS-Office365-Filtering-Correlation-Id: 254e0053-f51b-427c-d007-08deeb99c6d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|18002099003|56012099006|4143699003|10067099003|22082099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	m4Cpwyd/gsPuu3TXBjgr++YZMo+kG1Z7/4txVKYOUgvpVCmYS22f1wGrBi//HiI14pWPOMwgCHqv0nRhypO/UEAuf4t7qvhq6iFliWgWypGrMEKH6hwvOSRW91TNdTuHDg4MXHZa35YP9bU9/bfLxVanD2HyLQPdJCabb/3kzD5L3mssDIg5bXq3eufVajtATOdVooqeJDo85o/CK0feF1xpGBXpnenvMGPHxFFQf6Tf/I4nO1vQp8P2FMLyESd/M2JUbLfgeBj0GzAA1ccHpHMget/lNiAGYa5fyTlkXeJhksTC/Ncct7vo/bmzH8o4LWzVquc3ZIiOJ27/rGCHsV4+Sp8X61rm1MPJHBKWxbYQyYLMN9vw4G2kYzrRyW4i2n1Wqm1hbebPCaajvSDOCaIJ7xOtbpUl4M3hbPwYFBGiaaEkBdap/b2y26p7Gd4s09rxevuya1zxMZigSO0IsFmsNSAAY8uCFN/VLiG+V6mKnuFSrJKE837hsiw+2rRGgAab8IT5G4ooF2DR12cR3CjTyBF1zg2TQ8KMtgTQoVjZ4abPN3cViKWgQxlDpneFOP5RFoVZmeT0ugpwsKznWxBEgnEHY07LGuD7IxhY9NlTwi02/PAZdP5dY4wTj9oCvPmHfiHNZonDzLzXKlt3C3k7Glsp7zeUZ/8t+ktThfA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9567.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(18002099003)(56012099006)(4143699003)(10067099003)(22082099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MEVlMmhubitqT2NBdWtKc1IvYWllVXE1ZU4rWHdTazdlWktvN1pxS01ST05V?=
 =?utf-8?B?bDlJU01KZmd2Z2p2RFgvcEVSWUl6RURZcmcwUkxDME8yd0hlalVLUlpsWHVS?=
 =?utf-8?B?WFNTZmRVMEJqcnJVd0FObEdJL21zOXZkUmFMLzEybDZiblk3OGVHWG5SWFNp?=
 =?utf-8?B?Zkd6VmUvV1M0Y1NieEU5ajM1YVFXbCtSenZ5NUNxZkQyVjVFamJaNElTTW1u?=
 =?utf-8?B?Q09CcmJweWxHTzUvaTRML1RGd0l5Q3RJYXVlWU13UUEwam84MEVvalNLVGsv?=
 =?utf-8?B?SnpaSldDVkR1QTVrc2d3STNVUlM1amU3V09QYW1qOWdFZ1g1U3c3M1QweFlZ?=
 =?utf-8?B?Y0NublZYRmE0V0ZaaGs2bEkzUWVZQXR3Ykd1bUltUlN3NVdDZ09UOGRIYVR4?=
 =?utf-8?B?RDErS0ZReCtSODI4U29DK0I1L2crNlIvbmZ2YkRzSGo5aWFma1lTeVRjK0l5?=
 =?utf-8?B?RnFpVWdZNlVuM0tlSm9yUWdjOGFKcXBvcEE5Y1RLZVlMbnFLQVdYMlVTTDVv?=
 =?utf-8?B?d2VPMnBoL3hmNU8xbTJYQ3hIb3lMSFdmeG16RHZDaVJsRFRKVXk5c2V2UmpW?=
 =?utf-8?B?bUpUbzFjKzJCU09RaEpsVVBIb3lZNGRXc3ZkKzFRMVlsM3VHa3hTanZVdS91?=
 =?utf-8?B?TWFaTDhTaTJydXBON1UvUnhyOHhDT0phOEpta3hpelRwTTZ2dEozcGVTbTJq?=
 =?utf-8?B?NnNtZDdMbFlZZTFKVlloUzBKMFlWZ2FUZkVjVjQ0bFpCelIxM1Q5ajR3c2dC?=
 =?utf-8?B?SXVaVHFkOFpHWFJQSUF6Tlo2MGkzcFNYMHJRclhFVjNpSFRWUDg5ZTVVdnRP?=
 =?utf-8?B?VU43UXhPb1ExSHNzcFd4UFZrZTlldS9IekFpVW1zU1hBQkNFRlhwcVUrTW1H?=
 =?utf-8?B?VWduczl3VThWT2JERmZBeUFHWHhJZkNOR2xuRFNEQVFrN1RuaXA2dmtOMXpW?=
 =?utf-8?B?aXN0SXdqb1dtQmV3MUd5aFpUV1lsMDVZS1BBdkdCWkpRc2NnczNtSURjTHRY?=
 =?utf-8?B?STVpZG5IOHVpd2pIZFJlcXEzOXU4WW90UTFmSmlGVEw5T0N0OU9RNkdhM3VE?=
 =?utf-8?B?eUtvV0NqQmZqM2sySlQ3dmtBV3lNSUQrS09ySDkvYnN0eTFJRFd4L3dtSTAw?=
 =?utf-8?B?ektSU3RaQXdjQjkvT2Z1dG0weERtRXREQkNGWTM2N09vbnRURTN3OXF1MXZG?=
 =?utf-8?B?K2RuMTcxazlaQTRQdTdCTkprbVp2dGRybVR4WUlXR2xFQlJIMlJrWmI3cmp2?=
 =?utf-8?B?NnhINU5CQU5nQmFWME5lcnE0K0pXb25vUzl4Uy9tZ3pIRDFoUUwwQWg1OUNR?=
 =?utf-8?B?aGpKUnY5RVkyWEFhUHJmSk9jMTYvVHJJUHgvb0tQOU9xUHJpak84K3JhTUNv?=
 =?utf-8?B?ZFRLT29meTlxY040UnVRQzhvRnJnN2RYM3B4QXVRZytEZXNaMTBHWGp3YWtO?=
 =?utf-8?B?MG8xRnBkY01SSGlHWFA2S2J1ZmgrdUlXbVRKSXk5a1p6Ylk1RUlXKzEyNDl0?=
 =?utf-8?B?OEdobllOVVRGTDVsZmk2WWZ2TVZiM2o2Ui9mUkwwYldyRktkRlFaQmxWUXpk?=
 =?utf-8?B?THFMbElYUHJzdW9zQkMvTU1WMm5nWEZGQm5aMEhxZWpDUnJCY29ERUdQZjJv?=
 =?utf-8?B?alNtQUwzbHZISHlqbk11UDhEd1VkWElRVUprU0ZHZkJpdmEwd0llcWpkdWFB?=
 =?utf-8?B?OUsyMU02TWZZQlB3MXAvMHB4R1YxbnFRTU1xaEF0a3F2OHhRNldHWmZ2UHpS?=
 =?utf-8?B?SW1QT1RrVFQ5dmJVNTErOEZzdzdDb2xkbE8yQmFYeXZ3ZGMva29WdmRxek1r?=
 =?utf-8?B?UU4xWlFTZmFXd1hKWjhVVFhNaVpIbVFhVnlGYWFTRzVKNVFvLytmR1NCb2lu?=
 =?utf-8?B?NUlpeTUvOGIvVC9ZYlloejZlTXhPS2dWR1BIWGwrRG85UE5vNTRZN2hleWxG?=
 =?utf-8?B?TnVIT1k1TWFPUTRjTHZTRlg1M0hHSktOd3VZdkFxaFdNOUhlek14U3VVODVr?=
 =?utf-8?B?ZmhtODRmT2ZSNkJ5V2hYWEJ1Tm1UU0JyaDRBdGxNbEFhWVFURVl0allKSjdT?=
 =?utf-8?B?dHUzRkkvbnlqUlJsSkQ5eVRxSTFKVW95Yjg3OGttUDJybXY1MTlFcHpTWWlD?=
 =?utf-8?B?SE4rb08wU3RTVlkrS2tYQk1jck9wemg4Z3FTOTZscS9SanV4amYzSGNLNytv?=
 =?utf-8?B?NW0vbGxseXcxWEhaRGlOSzBzQnNScHpsbHY3cUV2VlFBZVhwdm81azJ4TkVy?=
 =?utf-8?B?bWgrQkIxUkRVdGh3QTZOSlQ4REtNdzNabWR2UUVRUmRONTZFNHB0cERpMHUw?=
 =?utf-8?B?VEFBQ013QytobllNUnlodGpIOGQyY0ZWVGhXSDY3TGlZdWRGT0RYQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 254e0053-f51b-427c-d007-08deeb99c6d4
X-MS-Exchange-CrossTenant-AuthSource: CH1PR12MB9576.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 04:44:43.9293
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9FiPbQ2/CRMFtUhTyC7wa2IH8YrDc0I09CAiGE6aRAIxTSQpVd+gsrqs+qLrRGMyg0bybyD1Pzm+X9BZd1gojg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAWPR12MB999268



On 7/25/26 21:33, Sang-Heon Jeon wrote:
> [You don't often get email from ekffu200098@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> Both branches of the check return the same value, so the check has
> no effect. Remove it and return the value directly.
>
> This is the result of running the Coccinelle script from
> scripts/coccinelle/misc/cond_return_no_effect.cocci.
>
> Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
Reviewed-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
> ---
>   sound/soc/amd/acp/acp-mach-common.c | 11 +++--------
>   1 file changed, 3 insertions(+), 8 deletions(-)
>
> diff --git a/sound/soc/amd/acp/acp-mach-common.c b/sound/soc/amd/acp/acp-mach-common.c
> index ef784cca13f2..01a0aaa60246 100644
> --- a/sound/soc/amd/acp/acp-mach-common.c
> +++ b/sound/soc/amd/acp/acp-mach-common.c
> @@ -938,15 +938,10 @@ static int acp_max98388_hw_params(struct snd_pcm_substream *substream,
>          struct snd_soc_dai *codec_dai =
>                          snd_soc_card_get_codec_dai(card,
>                                                     MAX98388_CODEC_DAI);
> -       int ret;
>
> -       ret = snd_soc_dai_set_fmt(codec_dai,
> -                                 SND_SOC_DAIFMT_CBC_CFC | SND_SOC_DAIFMT_I2S |
> -                                 SND_SOC_DAIFMT_NB_NF);
> -       if (ret < 0)
> -               return ret;
> -
> -       return ret;
> +       return snd_soc_dai_set_fmt(codec_dai,
> +                                  SND_SOC_DAIFMT_CBC_CFC | SND_SOC_DAIFMT_I2S |
> +                                  SND_SOC_DAIFMT_NB_NF);
>   }
>
>   static const struct snd_soc_ops acp_max98388_ops = {
> --
> 2.43.0
>

