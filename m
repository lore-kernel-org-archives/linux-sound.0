Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012052.outbound.protection.outlook.com [40.107.209.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8E612DA76A;
	Tue, 21 Jul 2026 03:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784605867; cv=fail; b=j4n0CDqjZaAZv3v3tqrEkJKKwh12J6InYqqSzpIhOkvE2FtMBkqEllUEBPcMMIeE/euvx/zX12ZvCYdp1j4M8u54cJy3eSOr+f+vBtA+rLJactTNG4Dj+Bm1TFtP2vKmUGpnxzWTxijEXq923zRHHjnN7x+es8wQSz6AtGg2Q+E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784605867; c=relaxed/simple;
	bh=vhUfEtndsK5vN+foSW6BiOZqJh9yDYsXB9505PjXMiU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=AGfKJGVxo5vy4MMePPOp7MahRG9ZhPowEkNCvwm/Zbkb5szNsK7BhD0ePJE6eFnzv66tOpkFV7EJ1wQQMaAKw098GSRaOSqSpDITxPnOVTOVY/+XnwV8XXHM/jV6yoQqqTxqJo0q65wDsXykKQZOPY/aR4crJIMjA6BEVw6GTuM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=iP1x0hmB; arc=fail smtp.client-ip=40.107.209.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="iP1x0hmB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XTxeg2nmlK/671xyViQncxxxl5ujJZU7peMxczXjapX+dIAw8EMEJxX7EON9IeABttMW5fOpKFqH3ACvLd+9fMF+LjKF+MSs4d0P324jHV0zB39CFW5ZJSSG8nXwtFkJp3VLJKlQ4xsTSDfgfA+EA4iEJPYWNgBcXFb7UTS44xAMU1UFBvAL9qBTjd8BFwkJP5/Y449hA725K6x9neME86DNWO4Jx3aRDYSHHHJyy9bOYDpJACpzmyxC04sxuZ1v/edBM0iiDvXNCOFRp1Wyw2Kw1hzDJCnKnRTx2Lz8BaI4fi8VTCLQdM4s9jxkpxOk5DPfO1imI9IxEae7ZmatAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z2/A9WGnd9WnQLiG61LLWpsWyc8q+v8+1hR0bzEIiCM=;
 b=IZaVlZwgEO0rTFvuOfLtxG3TqTmV7IDDCcXPeAj0sSbLKYfa1q8gFWJBz214CxPZiftqjH2AknjG+bCXqWxpoJK5TlRFhtnwk1z6E8LFu0iN+9Zz3y1r15vhG+vA9Db0nyJz/71aHo9ZaFBKj03uHraG9yxuC+ZfiOXVOsIT3iyUZfk9C2etmPjCBKFp9QqtGRdkpW+qp8H1oMlriFVNXC/OmnXO9DA7Qp1ULMYZzUbTyuSUEXTJU7H4I26a+Cpi7h2DUiVZEuNLtpsdnuoA+uksih5pJJ5axMLKUD2CaWgqxsS+dFLqVttWQP/uMKjjOb2F2yka7ygSCUK/c2NSWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z2/A9WGnd9WnQLiG61LLWpsWyc8q+v8+1hR0bzEIiCM=;
 b=iP1x0hmBvrR1jMWFMP86kRmkSZ1X6jDsPq+ZSyQZ9RZMUvR6qkzeR3JwFwA1KnnzFqb/s3RXwWH+lyIokkkHfLq69YA1+02O+udrjt93G4R0/EuubKF2dfROMATWKk4qPcgmnPjeBHOOpiU6xfAMzdFQM4lHcouLVcIuTJmJOG4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS2PR12MB9567.namprd12.prod.outlook.com (2603:10b6:8:27c::8) by
 CH3PR12MB7644.namprd12.prod.outlook.com (2603:10b6:610:14f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 03:51:02 +0000
Received: from DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5]) by DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5%2]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 03:51:02 +0000
Message-ID: <68920b2a-fb35-4f07-a1f5-ff7f0119a051@amd.com>
Date: Tue, 21 Jul 2026 09:20:24 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: amd: yc: Add MSI Crosshair A16 HX D7WFKG to quirk
 table
Content-Language: en-US
To: spark_psc@outlook.com, Mark Brown <broonie@kernel.org>
Cc: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260721-master-v1-1-6f56d5a54d96@outlook.com>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <20260721-master-v1-1-6f56d5a54d96@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0137.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d5::17) To DS2PR12MB9567.namprd12.prod.outlook.com
 (2603:10b6:8:27c::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9567:EE_|CH3PR12MB7644:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fd4b3e7-e231-4240-ac59-08dee6db4866
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|56012099006|11063799006|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	0ydQ+2+HfvHOgCSmlQmp2z9oOlej/EmzRKoQKWK+KWsLa4QUF7Mbkzy7y/cibfGxcWNA965F2B91APe8M6u7gksb06vXe6YARveGk0LdExwuw1okerODijAPenO7sS9LINUTOQfcSfyxlzUhFavq/4PwR2eNrTJt0M9vw7QplLxt1dVy9bhMdmoO4ePI7Z7SiaUC2cuTohm00VgV7OYc5ldRE1H/zYZdWk9aQB2p5o7WQfb5COqINc78DrrNiEV6rk7UQfmIvRweoqhMjAAp3W1vo/MwqzOE+Xfib4ePpQ7EtBxbxyRAYZjW/zoCJvGdf5Iah1arQOEUlGOnbroytcBi/mj5/dBoU1hZouiQxkY9ptyrk7i+hcuTgqUD5muAPcD59HA9mGhPGAWL0rVBJx9LDtrH0Xw7gOnAMz2Av8U3MUULoWKgV6wBDLRvZIbq78Kxryq3ekCM8ZfUWH2uyHIZkhQ0jIru09N8xwcy6bXXM6UdS7q0oHJmfNwZJOE3fMslUjsS0CnVhLeqzoKCiWLKlWnTf4FjOWMBI2g+GSS/xeZWg54ReBtftP8b6gKPtoRDKK/JQkUOMKr5+rigzJFsH2eCLgd946LV8JlwQuxeu7UOxQS9ae3+cMUqpGq67DQXYw3+6E62Nq8m04ixdm5bLSUlpWiRcIP7SlUfch8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9567.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S0hqV09hYzBMeHI1ODM0b2xsOUxEc0Q3b0R1eHlXSmJjN1BvbGE1Y1doV3BF?=
 =?utf-8?B?ekRIellqQXZDUXVUUUlCZ2lrRGczUnJKd2lWQXFPb09pZklRZng1VkVWdmVj?=
 =?utf-8?B?NU5pRmUwdzZ0UCt2ZzhscU92dU9kM1VPVTJibzFMSE5rQkNQMnY3TVVacFFC?=
 =?utf-8?B?MkV4aFRTU3E5WCtISFE1MVV3Y09rWHpnMDgzNUVWdWFIUmw5bTJJbVMvSUFo?=
 =?utf-8?B?RUZ1Z1ZzK2t0RTliaTVScEg4N3ExSUJrQ3VzcjFsRHMzQ3EwWlZqVmlTMU1G?=
 =?utf-8?B?bko0N0tRYzlwSktUb3dOUW4yTDhWczhJTVluTWxZdHlXdGxVdzM1Y1p4N1ow?=
 =?utf-8?B?VDBnL1RNVVowU1B5NnliejViQzI1cmNJcFZySVl2YVV2eGhtVXJUVGZIZ0s0?=
 =?utf-8?B?QVBFM1VxYk5HbmZpZGRuS1liQXFTS1FEUThKUkxJN2JVNEZwWUw5UkdMTEpG?=
 =?utf-8?B?aytKSng4UjR1TDlzQ3EvdTR3bnFObnFLaDZuVFZrZ2dsRGY2L3l1MTUxemJj?=
 =?utf-8?B?YVdPRGlabElaTGVMMERKcGVtZDZ0d2tpWjZwNDB4bWNpeG41VCthNWVxc1Bt?=
 =?utf-8?B?bDhTTS9UUEhLRDdYS1B2Z2pPcnBxMUcwNHlnYXVwZjFUNGVXNGFvb011RFlo?=
 =?utf-8?B?WTc1SVVwc3lLMlNPSUVXRnJtRUVoZ0hRU0k3SUt3OEVLQzdjcHp0ejNPbURH?=
 =?utf-8?B?SjcxeGR0WXg5dHV4bmFOSFZCYk5ibmREZXVLUlZ3WER5V3ZZdGVuVkZ3TzhE?=
 =?utf-8?B?ZVpMUFBHaktHVGxhd3FUU0tVZ3hQYXJHRENUYzR1bXNkQ1IzZ29SSlorK1la?=
 =?utf-8?B?ZDE3a09CWkp4OHFLS0ZERlM0YUZkc0tZcWg0ZGFGZ0JTeTF5QjY3MDBveHp6?=
 =?utf-8?B?YUlLU1dCTit5NjZkaVVpdit3UjdtcjNVWHFKVDRUS1FObU1ibUdZQ1BtakdC?=
 =?utf-8?B?UGVNT2V0K0wxVmdMR2tROWt5Z0NEZkVtTU1RT29qN2xvYjB0UEk0K1FCMThQ?=
 =?utf-8?B?bjRzK2JkR0lHZzhhWXFhSVo2a1E0NjgvKzEzL1JUVm8xTUNCTFYxR1lZYnZH?=
 =?utf-8?B?RDRSZDdXK08yNGJ1eXoxaGpkZHFXV1JTdHYwRERIWVA1VDFQZExSOUZDTUx6?=
 =?utf-8?B?bG1sUTRqcXlHWFBaQVRIaExiR2hrelJ0dytOTDZGT01xUjVlVlVFZVlaZVlr?=
 =?utf-8?B?L3FmUlRGOFFXSUwxUlJhUVpkYnpuanBrcnNHSlVraEl4d2JJK1ZLVEQ4N1Ny?=
 =?utf-8?B?b2wrT2NYSGNrUExHeDBNYnRuT0VKVWRiQzM3TXZxdnJ6MVo4cDZvODlxVi9K?=
 =?utf-8?B?WjNhb3pWdm5Wenhoekk0TktrV2llazVsK0twRGhrQ09PMFV3Rm91NVlTTk83?=
 =?utf-8?B?bG9WMzlkM0RQSGkxR1E1QlIrZTgwcUlPMVpvQ2trSkcvdU5UbVFHZDA1RDNw?=
 =?utf-8?B?aG5oUlhmbG1YVEtzVkxEWm83dWlwdkRCT2pvVGsrRW4vUk9yRG1HZU84dTBB?=
 =?utf-8?B?WHhNWWNNVU9nemlPeWVSaC9LSnNLR0JLV21iRzhoYnZSQ0VYenFORnBjZ0Fa?=
 =?utf-8?B?QU1JNmx6Zkd4YUFIZmN1Z2Rrbit0TWtOVW1FazMzcVBHT0U1cm9XWXZIQ3V2?=
 =?utf-8?B?WW9uTEs5OTJOeGRjamd1VkdMeVZYMTFPUEJpZjhNR3c1Y2pKMnpPS29qMlZO?=
 =?utf-8?B?OEFZRXVPNlczaXMvTnByTWpNdk1CL2U4OXpRbWlSSi9PNTU3V0JUeXdLcVE0?=
 =?utf-8?B?V1F2bE1YOEhBazZLYVg0a2ZtZ1cvaGtYcXdEcVR1MmVhRFVjSmNGdDJnRXZy?=
 =?utf-8?B?WFVDMERJeTZLNmJPTHdXQjlxL2xYTlR0Ni9sR2hiOU83UVZ6Z0czamcyaDNp?=
 =?utf-8?B?N0laZkQwTVl3VXJBQnRzc1FEc1VyOThHK29GTXc3MUNkRmdwTlhmZzRtcFNO?=
 =?utf-8?B?L0lXd1BhbTF3am9JekQzeTVmNkNIbUNEN1V5TEl5dmNzM04vUDViV3ZQWVYy?=
 =?utf-8?B?UlpHY0JSY2JXRFFaN3pxeGdsbERSUmdMUnFLaFlsUVpzdjhLWU10ZVlRNzJN?=
 =?utf-8?B?NlE1RTFhUXZ6Ukppc0dlYXZaMjV3T2NTQ2Q5aExURkM3cnhtOS92V043VjJR?=
 =?utf-8?B?NktKSHRGZytqSWowMDB4dkZCdE9nNmo3N2xMUGQydi9PSVNiMDBIUDJyS1BO?=
 =?utf-8?B?QUp2UVJYb1RGR0RpWlRyaWlpaXdZTWtvcDRWMU16TEdMZWdRQjdBVFVxS280?=
 =?utf-8?B?NE8xSFh1ZkcvcHpNZ3BJdENTb2swdURCTTAwTFArVGdZYUc3Q1psa2xUV0JC?=
 =?utf-8?B?Zm95ZU45QlhvUHJMMVJoTTc5VE1QcW1lOTNyUmtMcmliOXVUTm4zZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fd4b3e7-e231-4240-ac59-08dee6db4866
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9567.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 03:51:02.3718
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1yEqd3zJH8TYxxAZWaJU4I3KJiEP+U1LQMDLJSbCNLEY69hIVUMsgP5Jf5HMeQXqN67KimAu/FJeJ5MdpCB3kQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7644

On 21/07/26 01:01, 郑鸿源 via B4 Relay wrote:
> [Some people who received this message don't often get email from devnull+spark_psc.outlook.com@kernel.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> From: 郑鸿源 <spark_psc@outlook.com>
>
> The MSI Crosshair A16 HX D7WFKG has an internal digital microphone
> connected through AMD ACP6x, but the system does not expose the
> AcpDmicConnected ACPI property. As a result, acp_yc_mach does not bind
> and no DMIC capture device is created.
>
> Add a DMI quirk for this model. This was tested on a system with board
> MS-15PL, BIOS E15PLAMS.10B, and AMD ACP6x rev 0x62. After applying the
> quirk, the internal microphone appears as an acp6x DMIC capture device
> and records correctly.
>
> Signed-off-by: 郑鸿源 <spark_psc@outlook.com>
Reviewed-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
> ---
> This patch adds a DMI quirk for the MSI Crosshair A16 HX D7WFKG.
> The commit message contains the full rationale and test details.
> ---
>  sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
> index d6df7de..3a8a5da 100644
> --- a/sound/soc/amd/yc/acp6x-mach.c
> +++ b/sound/soc/amd/yc/acp6x-mach.c
> @@ -521,6 +521,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
>                         DMI_MATCH(DMI_PRODUCT_NAME, "Vector A16 HX A8WHG"),
>                 }
>         },
> +       {
> +               .driver_data = &acp6x_card,
> +               .matches = {
> +                       DMI_MATCH(DMI_BOARD_VENDOR, "Micro-Star International Co., Ltd."),
> +                       DMI_MATCH(DMI_PRODUCT_NAME, "Crosshair A16 HX D7WFKG"),
> +               }
> +       },
>         {
>                 .driver_data = &acp6x_card,
>                 .matches = {
>
> ---
> base-commit: 1590cf0329716306e948a8fc29f1d3ee87d3989f
> change-id: 20260721-master-9e8351d0d61a
>
> Best regards,
> --
> 郑鸿源 <spark_psc@outlook.com>
>
>

