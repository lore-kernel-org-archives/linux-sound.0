Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011030.outbound.protection.outlook.com [52.101.57.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40CA52D3ED2;
	Fri,  3 Apr 2026 04:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775190061; cv=fail; b=Jwtp5HJp1OYxB6LHdA4TfGNOGLyI2uC8DXGLaLTXsHc8zth4E8lHN5gx3OvrqnqJErwE4VvsTVZ2op1Rs05cIHEf5Nen6IOEcb+LFH9fCsDSuBmdNe/HjP7DshdyxhE6/hAhDStSoWL8A3CY/MEwoEKDFvmDu5Ud5cZOkh8fW6k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775190061; c=relaxed/simple;
	bh=7rNF6C5uU22bheqbFxziKRtsQjWap3rjQKIisq4RUsA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=hhKdcj6JatQq8e6dzTeQfew+IBVNXG+XsCS075HQvqMlaE49TdHtDY8aPmbv5bwZQmw1tm4UVqOC2OmtzLF3CCrtZKK/LzsgUdbvNxvja6RYtbeD6M3DRLWl/tTdg9JajiUF5I76LSY74QqUBAq/gxhPrTVNKZi3bvAKaNNehn8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=wBWytxCY; arc=fail smtp.client-ip=52.101.57.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="wBWytxCY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j5i9z0K3I3YUVjqar8vvLrgBRlwvfDr6OxJfCAwbXuW6kfs2bbYzMyN2EeZAixXVevj7t9eMycJexk7Jrg8jzWhiOLFCJXIUqWmnKD8HyzAIsLZrzetIERtjzstzGA6SspuA+gTGRja+SL2dV5TGA/BFo4Dd4gjIQ40bSlR//Js+HE93H0ChksHx/ZFPWodGPCPWcuPs3iZJSJchCpPmpkBiVjuxrPvQUnBiKBw5QyvNq7hUtwSeOU+XyutUprfguH0zANfvrzEMYV4zaWEo75fd8nJ4UCRP3jDucmfB6bx8R2VbXtQRQCjtb6d0g8CSA3VPezKuyRJRgEMsmBr1Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7p59dJjmB0nZnbINLHoo0soOOWDeZGyVgBqM/IDDdBs=;
 b=Phvzf7pj5NOMnqO2r887f/H44ZBm9tqsYZ1LMUI04QGHAS167BOGrCOkxxeVQHXJbJOBkVGZ2fW0b1gN/uWvTBAoxrLnd5niTrG0j6uoyqvCxAU1Kl1tsjSYihCe/1mNTfvLjC8rok17ceDahplM1SF1wWVD+cMEj90XJNNHq/tmcr4wh5UotBMnf8LsDY9yw0vzetCGWqIzZ7Z2kDbkY8YmIynoPZvP6RgMdiinfVTrd3l/2ySJJ7bik3vBRq9fxflb3hLjuXi5mnlfxqKnrjSbh3dFYjpkg/lSwrR4Cb8ptplP9Wp28uxaud6HZgHujovIKi5W+0r3ib3C5k6aRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7p59dJjmB0nZnbINLHoo0soOOWDeZGyVgBqM/IDDdBs=;
 b=wBWytxCY63TdIctdt8o+Qt0boaKjlPxr5DNJXn7TFrlL/5voJGPd7Nwc8GNLmXOEGCwhjUx4H3VAonHpnBw9IVG0dXCHGgmfrONpAP99AzEJjof01ri2EX4nr6DipxnSzMEN9j6em3v0MoC9hxrskbl8sFgluSaCGEdpXi30Fbg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS2PR12MB9567.namprd12.prod.outlook.com (2603:10b6:8:27c::8) by
 SJ1PR12MB6052.namprd12.prod.outlook.com (2603:10b6:a03:489::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Fri, 3 Apr
 2026 04:20:53 +0000
Received: from DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5]) by DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5%3]) with mapi id 15.20.9769.017; Fri, 3 Apr 2026
 04:20:53 +0000
Message-ID: <ea68f8da-c970-472c-ad5c-4de2c9f609e6@amd.com>
Date: Fri, 3 Apr 2026 09:50:47 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: amd: acp: add Lenovo P16s G5 AMD quirk for legacy
 SDW machine
To: Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: venkataprasad.potturu@amd.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <mpearson-lenovo@squebb.ca>
 <20260403010336.1223078-1-mpearson-lenovo@squebb.ca>
Content-Language: en-US
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <20260403010336.1223078-1-mpearson-lenovo@squebb.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4P287CA0058.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:270::15) To DS2PR12MB9567.namprd12.prod.outlook.com
 (2603:10b6:8:27c::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9567:EE_|SJ1PR12MB6052:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c5eced8-b86c-477f-cd7d-08de913864e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	5yRW3fy67h2f3gYmoeCVivNEOq3KbEquJMIJNxDRFiQVLoY3lxVxFPilEHSpaYNUQWDQCf2uYmFmRjVIcnSXhFjoLxHONr0l0bptAHqm5N03HOuVnLvewgTxSeVstHf80JF2xjSYwLwlGUdzXOTCgB+P06TgsIHTFfsa2nO2M0lTmase7GkU6Iwttz+q6tkphQBCjWeOcq/8Rvgt0ao8qn6//jBNxCM75RgzqJ7JqEwWvRpaJVi6XVgf2faHJhorucX65oaoohulBa+Ge6kLnsHMCszzibgRdcg/7naGnMHyNXOuJiguJwDkmmzNYUv+fl8cdNm5e5TShrgGbSpuQWrY6eTdaVdPDHeI6qYo8lKfFDXIiACCB9dHz/JdKekdmmNMfa4rsYbI9+faOT058xno4stirAgNk3EyzfVMEgL/HXCGt34g3BbBDV0cRNum4nR+2qWJ8jekEUeUQvudVToCfGsaVIrhviY32XULRzV53joHqLys/j45mu4VIEWDWm1XjtCfxhK1emKvI5vl+XYBGlj6Dy1AydyHHTBftJYVREVnJNKJ4bBi+BPSWgTNabWCu5AhbUsQeLK1GL5MpS5Hz4AOymm/jJQgJYqEfWtXBF5ChaIcqVsoQJqEcA5XuHjrCIvYsFuXo9g3OMVMkEmoZZcqo2p8g6XipoF351c1xV5uMJ68GcNzBTj3bkGCHT4Pz2foKBs2yf2881UT3oPu5ebdvAqJHrA9W3DFMzk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9567.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bGFBR3ZYd01IdWV3cklSV2hoSGZxRzRHc1huRGZ3eUxZNjdSb3FTTkdZM0t6?=
 =?utf-8?B?V1hEVTlOejdHTGhaSjNlc3lNajRGMDlQeGh2RzlZWFl3dVNIVy9VLytLbFRC?=
 =?utf-8?B?N1pKeFN5Y0IwSE8yNWc3ZE9MZTd0UnIwdFYvcmRrWVRkR2RSeWg0eW1qYXpQ?=
 =?utf-8?B?ZjN3ZzQ1c0ZPUjhtN2ljbjlTd3lPbXJtcW92YVc5MXNJT2c1Ni9rMEhIbGNs?=
 =?utf-8?B?UWtJQWxRazM0aEJrTzVGcjBDZHQzT1Y2dWJ5dk9sNXZVbHBQK2pTZ1lxLzFm?=
 =?utf-8?B?MlJ5Zzk4Wkc4ajZ4YkdNdzhGWUFmeHVlbGMxZFdnVUdUVTJVYzZ0dllQS1ZL?=
 =?utf-8?B?cjk1WVVCOTZPQ0pucU0zS042dHdVMlBrR1loaXoza1dZY1ZFb1ZWelBMVXJ6?=
 =?utf-8?B?V21UUzNLK1JpcXV6aEwrU1RmbDZzZ2FBbGIyODJRc3pxYXVQaDl6YmRnaDlS?=
 =?utf-8?B?cG5iUkQzM2dmY2NtNndnWmVGa3piM2p4WXBVZDVIelVIZlFpTDRoMnlweWV2?=
 =?utf-8?B?QWlpMnR6bWdVWmFjNjFCbm1YYldpSUtsUEg2R3lWVFY3eWZ4a290QUh6N0Nz?=
 =?utf-8?B?R0kyL3Q1OE1vZ20yb3JxK3JTeUI2OEVtVFQza2pJRHNRRDhLb3F1Z2dmcVkw?=
 =?utf-8?B?QXB4SHZTQll6SmZTeU9oRnVuR1JDaFA2VmxkSkJRT3h1b3NsUDZwQ3ZxOFVs?=
 =?utf-8?B?Q1lzOThpMSt5aHpuS0VLRjFpazMyNGFUVzRURlBBS1VjZnQvZGZwOE1Zam1S?=
 =?utf-8?B?T25ZNXJ0UmpHYXVpS3U0cDdhaENpYVRJRUNiWTV2bFVrb2lvbWNLdlZPNyty?=
 =?utf-8?B?VWhId01ORy9hUlFwcExFajdseXhEcFlaMjFIU3dGbXZiZ21XMC9SNWtkcXRu?=
 =?utf-8?B?aUJsNTlJaXdMbFExTUdveW9qQnRqTVZhNGJmRE96MXowYW5INmJCQkxTTDdI?=
 =?utf-8?B?MFgzaTlQMEpxcE1vMjBISkRXaG4xWHlXL1JNUkVpd1hONUxzcHNiV3ZFNUo1?=
 =?utf-8?B?NjM2aVMwUXhicXJKVk81SjhDYTJRbWRjWkdoTlJCUVlGRjU0cGcwblNsOUJr?=
 =?utf-8?B?RmUzQ25KMnA4Z2dPczdjOFpYakloRzVOQmtRT2pRekVoM1haelJEMFNoVEVV?=
 =?utf-8?B?SkFtamZiZy85S0JaODViOUovUVB4dDVHUkQvRzhwR1g1U3BpTnRDemxLSU5l?=
 =?utf-8?B?dXVKYmNMWEpYbDh2RFpzemdSQjNLYjJIYXlqdnd5cTNMbzZya3hRVktLYWhw?=
 =?utf-8?B?c2hPWk5rMFo0OTZEcG55VElCZEF5UitzZUhWQXhWdnBub0IrbVhFUlY2SjhC?=
 =?utf-8?B?OVBVTVAvaVc5MVV4WU5rK09rVnNmWWhKMUlOKzliM05nNGQ0azdDYksxS1NC?=
 =?utf-8?B?ZUtSZk1FZHp4MlFvMGZlV2d3MWR6V0Y0aGVJa25SY1ZoTmFwREV6QjZPbFZM?=
 =?utf-8?B?VkNsS1p2cmlLQW5Fd2dwZUYvYlJmYWV1eGlBVStiL281NGxBcW9JalBzeCtR?=
 =?utf-8?B?bXdMZ3R2aWx0RkpwUmxuZXdZOVFqTWJEbGUvbmJQQ09wTUg0TGtTcHQ4dTRq?=
 =?utf-8?B?dlZMaGYvSElYMjJIK3JCWlQrRkJXK3JIWmFxeUlCb2EzMEU3UmFmZkpPMkZn?=
 =?utf-8?B?V1ZSbnRyNEIyQmk2VmRZaG5MeTVBbWJ0bi8xUzhOWmdVS0xMenhLcWNtbGtu?=
 =?utf-8?B?NUwrU3NyZEZDL1NFL04zTUh6akZvUHl2RE9rTGZkcWtwSlQxNlBjdXAwbHl0?=
 =?utf-8?B?Q09DbG1mcW16bVVUZ01wL0FXM2pPNVM0TnovcmNJeGxzcXhWQ3pEYmp4eVFv?=
 =?utf-8?B?UVRyZnVvL0VYM1J5YUpLdWxHQi9HckVURExwZisvVG1Udm1ETXBDVDhaMDJH?=
 =?utf-8?B?VlNnMHpMWTZmTkw0NkpyMXpPT1V5TVZ5UVBYSlkxaHl3Yk5nMVJiMlkwc2ht?=
 =?utf-8?B?dkVxRmJWdVhrd1kyc3Z5ZDlnS1hzcDg3WHo2c3gzL3lnT3BDdEtyd2w0RUdJ?=
 =?utf-8?B?WHJpWit1a0MwQ2lpcHM5SXNGbHMyQ0xqWmxpV3ZNMGZKYUlrREQ1RmdLZHVY?=
 =?utf-8?B?eEpBTWhkcEJCOHVGNWhRQnlDeUxXbEtxbS8rRHg1TktNalMzZ1ptK3ZkeERq?=
 =?utf-8?B?TFAwdWtVbHJENUpkQVRPVU9Ca1JTaHNzZmFYbjYxTFFNSDdKUWd6eWlBaDBz?=
 =?utf-8?B?RWJHb3NHRTcxV3BtbW1xNVJ6bXZ1VFZhcUQ4ZEcwZmlKTG1YZnNDVDIycFZ2?=
 =?utf-8?B?RGVWVmZZckxUUjRjNGJ0bXZseEZ0OW1ZQ09KNEZRcnpYb2poQ21RS3c2MDJI?=
 =?utf-8?B?NzhhM1BtWCtBYmpWSk1yZEJXby9SSmRmbHRUVlBVK3ErUW90cDFrdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c5eced8-b86c-477f-cd7d-08de913864e1
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9567.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2026 04:20:53.3506
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uCTyqjtf3XaCDuADXV/QP4vwScqhLnJ0aqlx5yRNwM4UAkvofiuCpHfJwnPpBft/tB4HhfBAAhZwLnTacc44BQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6052



On 4/3/26 06:33, Mark Pearson wrote:
> [Some people who received this message don't often get email from mpearson-lenovo@squebb.ca. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> Add a DMI quirk entry for Lenovo P16s G5 AMD to use ASOC_SDW_ACP_DMIC.
> Needed to allow the microphone to work on this platform
>
> Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>

Reviewed-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
> ---
>   sound/soc/amd/acp/acp-sdw-legacy-mach.c | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
>
> diff --git a/sound/soc/amd/acp/acp-sdw-legacy-mach.c b/sound/soc/amd/acp/acp-sdw-legacy-mach.c
> index 05484c72f9a8..f2c80f1424f0 100644
> --- a/sound/soc/amd/acp/acp-sdw-legacy-mach.c
> +++ b/sound/soc/amd/acp/acp-sdw-legacy-mach.c
> @@ -111,6 +111,22 @@ static const struct dmi_system_id soc_sdw_quirk_table[] = {
>                  },
>                  .driver_data = (void *)(ASOC_SDW_CODEC_SPKR),
>          },
> +       {
> +               .callback = soc_sdw_quirk_cb,
> +               .matches = { /* Lenovo P16s G5 AMD */
> +                       DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +                       DMI_MATCH(DMI_PRODUCT_SKU, "21XG"),
> +               },
> +               .driver_data = (void *)(ASOC_SDW_ACP_DMIC),
> +       },
> +       {
> +               .callback = soc_sdw_quirk_cb,
> +               .matches = { /* Lenovo P16s G5 AMD */
> +                       DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +                       DMI_MATCH(DMI_PRODUCT_SKU, "21XH"),
> +               },
> +               .driver_data = (void *)(ASOC_SDW_ACP_DMIC),
> +       },
>          {
>                  .callback = soc_sdw_quirk_cb,
>                  .matches = {
> --
> 2.43.0
>

