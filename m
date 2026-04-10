Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013041.outbound.protection.outlook.com [40.107.201.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 697D829AB02;
	Fri, 10 Apr 2026 13:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775826873; cv=fail; b=TitzBeY2bdnsKZornsB+wZowtydfOOrd/1u2NP1NJjk4kQ7skk5NMst80Xv0mUukdXOQcSWqeaFRMg7zHu0OGBjab/GK5AADQpDH0GDuouvleCpsbR0L3FfHGDsWCwdJez0XCC2Ep+J94W7j6rMVBxA0O54sAhKen4qZjzwCoy8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775826873; c=relaxed/simple;
	bh=BibER56/YiSQPbZqHvwZLnnOzHz710Si1KiFmL7H/rU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Pqyb7IpC13shR3Be5cAcE9mIguJeZL+j7hs0InafWog2eHR7mbUiLiq+8pLhaOmfq1jlJjv7rsaBJhZpG9I4gbOyR4qUt3Y4465EjW9hyr0IRWmSKHyb/LC488s7QBJIwfLC5oco3AHOcIp2vzFYZm68rB0zksmtaqiCVMWBa9o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=byl2fkxK; arc=fail smtp.client-ip=40.107.201.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="byl2fkxK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nyNTHfDZT0SwT3X4B7caCrhr6wqLzkoIg/oLRpS033Tz/gsNWkyvrZ51mjopgHXopL+Y1Dg5HG0tIOpPbJwCeO3Rtxets+F09Xvk1vwf9oFzgdUvyLZlBhmeS1we5LO/X4GIA1rOOH/zMnOlkgQMkcT/+G63oyh+gN7w4Ygjl6FhcVO09K3VfudX92ybCncs1qSyuaYzjFrm2PZzVBJakYAy+RNeq6WEQ0//9hwbjJ9LIZQw56ReBALVAss7S9jm290r3fQ0mxaAFMCGgXavQT1KF9r5Wj4W3087al5MLpojkHQ72Hg5aUv4QkHY4mkHTDy3HdiMOb8tpD1ah4mIkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6cvED1s+yr+AZTgNa0N1lW4uOAyJMezGC9zLQg0Lt5o=;
 b=oIwJEb71T9eG57pRziEUEBBnUjGiCRs5DtSrxkyLL0fXTP9NCd8n0SeUAJG7AgNoHzSPeS4nF2lZGRoN6LxZI0Y2WYLZzqjSy7EQk5RuuJH+i5rejdGQ9u3MjTFniQb5mhylgg5UnTAPZhTYQbhpWo+zLXozWS+zuj0qWaZc0RjHNkBINiztoe3xugLFFwSB7zfk+zv46TfRLmSFAQQ+GGyg7FYdRZ5ArZBTlXhHOSBBWgXRFrdjIoj+we4kAbW1AeJBZNC6WDz/oOr2WdzOJKxkgn1qPDW7glDeuR34qhBJ8KuPdeue007GUTEYjDrE2jSoeO/l4itBh0y5r8oDyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6cvED1s+yr+AZTgNa0N1lW4uOAyJMezGC9zLQg0Lt5o=;
 b=byl2fkxKfAnJ7BG9qKM2dsHZ37FRK+ejqZH8HwxX50EXmVTnp3uPIgSpD6rntwexnXNjutFbqJ9kO4mirQt1eWFKLfWlBFPVkynSBLNZMw9oZ8QyVj4IJpu2gmYJfOTv69tIN8Bq3S8X7aGgMR8LWZJlZXwLI/WYFF3V3orw2Bw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4557.namprd12.prod.outlook.com (2603:10b6:806:9d::10)
 by PH7PR12MB5975.namprd12.prod.outlook.com (2603:10b6:510:1da::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Fri, 10 Apr
 2026 13:14:22 +0000
Received: from SA0PR12MB4557.namprd12.prod.outlook.com
 ([fe80::885a:79b3:8288:287]) by SA0PR12MB4557.namprd12.prod.outlook.com
 ([fe80::885a:79b3:8288:287%5]) with mapi id 15.20.9769.041; Fri, 10 Apr 2026
 13:14:22 +0000
Message-ID: <f95444d2-44dd-4a25-93e3-85c11276d876@amd.com>
Date: Fri, 10 Apr 2026 08:14:19 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: amd: yc: Add MSI Vector A16 HX A8WHG to quirk table
To: Ihor Uzlov <igor.uzlov@gmail.com>, Vijendar.Mukunda@amd.com,
 lgirdwood@gmail.com, broonie@kernel.org
Cc: venkataprasad.potturu@amd.com, perex@perex.cz, tiwai@suse.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260410094553.24654-1-igor.uzlov@gmail.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20260410094553.24654-1-igor.uzlov@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH2PR20CA0001.namprd20.prod.outlook.com
 (2603:10b6:610:58::11) To SA0PR12MB4557.namprd12.prod.outlook.com
 (2603:10b6:806:9d::10)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA0PR12MB4557:EE_|PH7PR12MB5975:EE_
X-MS-Office365-Filtering-Correlation-Id: d45f3752-0f7e-419f-4f7e-08de970314e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	aNJw08ZYxcc4+J4XjlCaXIcxlfa9Z/MluwfCNiMqJuWTyQ45gu1gJo1YMHNvVEtf6dShfeRU4rBuzsqjTSYpTxxxHYD/6DVT+eQMcMlxMhG/9IJCCT6IZ+YrA/Z0Dfra8NFVMC1uWtGR/T9nPsZkcrIMfE7Ee0onSEfKOdNuWQi7VpaQysICuw9A4PJbu1c+N7QsMGYnlN7iph4Bs/bFoZsuygD0M0E+lM5VJhMCE54H2a0IVOojKaSeZ3a0+5Rc2Ty8+BmNpTSdPsptmyXluUjyYJ45WTN93dTr40Q4BsCqsrwJFVcNfZk9VBdgXbE9RNdK+nyCVoMr/g5IcMbe6MNxcptfkjwSN4N332Il/S/Tv6h/mS2cDGb/VVSLe6TjzEp2lejWXTGT6O22EQ8epetunSkju+9awShlxcbOyL8xL9EPML+yfXgLhuiGftKNo+P0QyR9uef5E93hZ/L0K0aBDofBGUB1MiDKjM6GFbouKRkMfHoRKRY7Ka6Iu6G7Sds3pjyNJISpMWbsRjIxN3TcLlYJ2G9gH0vLU6kbH73Ta0jLRMi1sjw/Mrbd6jj6hVOSgKdenzz+SOcfYPuCrxeYFAkt0ZIbpyUgeh6/S2HueJrG2CXLw2AFA2j+o9dAhfqPRyUIGnKPzmoPqDVpt76fKqDbsWOinHVW8LdVA8JnQjCs9BWUUNUvgXc3P9w+sV5ryTduDysvneYVFVAwN6lfHjK/7FpZ9GmNoyxhmmg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4557.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UXFWTW1EMUlMeEVHOVJXaUIwSXNhNytNSjZQN3JnY0IxMmxnVjRVVEZQWmVP?=
 =?utf-8?B?QkJYRXBLekRGeXJQZTFmazJDN0ZZanJ4R1E3NFdUYXllMjEyV1BGNm9MUHJS?=
 =?utf-8?B?dmhYMmZDbjkvYjA5QUxNMUwxeGlPbktCU0JSN2RRZFlBNEFrNEpCSStEcmN4?=
 =?utf-8?B?bnAwRUtvb3U2RnBaS2V0YnNyVnZyeVROU05LQnIzQVowbEJDQXl4aGNYdjFv?=
 =?utf-8?B?V25Va1lSZk9GdmZhMTRGQk00UXhGUW5ScEp3MGJHZzg5eW8wRU5OcFNRVGY2?=
 =?utf-8?B?MWhnRGJIMEQxMFk4eWJydzNBYjhGSThscTdXeVBSTmRqUm40RXZNUm9EMXNm?=
 =?utf-8?B?Zjk0VW04NjZJZUw5MzNRaHRTNmNRTk13U3ZXbmc3cDU1TzFnYkVVVUo2UVBY?=
 =?utf-8?B?dzJMZG5POHZuaHQxcW5LejZPZzUzcEp6b2c3QnF5TitBZDRFWWJZUE9mTmlZ?=
 =?utf-8?B?anVGbXV0TmtNbFh4WVpaREYvamRGL1ZNM0pxYitxVmxRZ0ZnNnh5TDNoSGgy?=
 =?utf-8?B?SnNwUEZMTnRQcUpxMDNXQVUxbGM3V1dSUFR2bGp3MHRVcTNVRGtOcDdkakg1?=
 =?utf-8?B?OGZQc2EyVFZpZjF3VExTR2p2aU1RWTA0bENsMzdLUFpWeHNlMG0rYzRuYjFS?=
 =?utf-8?B?aDlaOCs0Skx5SDBMb1psOHVrcWwyaVFLQjZsclpoZmxmME5Ib2EwcEloRmNx?=
 =?utf-8?B?b0M2NVZLYUx1YU9odjUzY3A5U1FVbVc3UlBCZ3kxamc2VjR5cDc0MzZJWHBO?=
 =?utf-8?B?M1g4STUxc0E3dTBSejg2MlJvUEt5a2NIU29vbjF6RXF0NFlpcTgyd2JHWE1z?=
 =?utf-8?B?d2xMYTlNcWZlOTVtNi9kVW1WUW1TZ09tdGllR0twazVEcG5MQ0U5OUNrZ0o5?=
 =?utf-8?B?ZWdQSlU0Wm80aU9ORjZveHI0N2JFaURmNkZTWFFrdkVTdTJyT0RoQm9ERHJN?=
 =?utf-8?B?WGl5TTlGdmhtUUFHV3ZJU1BaYnViemdXN0pFUXkwWjhGRHFBVmI3OHdCOXBh?=
 =?utf-8?B?Ni9CUjUrNHp6VVBJYmtHcERzc1pML3N2dGl1b1VsQlFQNENNN2gyOFRxQk1P?=
 =?utf-8?B?aGJOK0RMelNLUEViSUhReUVaU3ZrV0tvd1Z5WWlmQkFCRUw0SHo3OTBrMENx?=
 =?utf-8?B?UlU4M0swaFBTWFdOWSs1c3I5Z3puNFAyeFFjSjRCQzhTVkRlQmxvTnVIbWc2?=
 =?utf-8?B?UENhVWRGY2EyVW1yV013MDRvSlR4eDZGQTVRcERPYTBzVFNOWjNVbXZpSWxE?=
 =?utf-8?B?ZCtKZjdzL3ppNHVQcG55cmFEWG02V1dVUUtoN3h3cG1hemtTOWhZSjEweFF3?=
 =?utf-8?B?L0UxYTZldHc2bmUwU1hVcWZrSUJ4MDZ4UzJidzdoZjJodjdKNnIveTN0Tmh1?=
 =?utf-8?B?S2g4cjE3amVVbStOYXdxUW8xUnZEaWxrdHNVWEM4dGdrZWdoeG5LcGpBSTF6?=
 =?utf-8?B?dS9hRndJTkZON1NQNEc0dUVDNmJPaUd2UWFFMERuZEJCM2FBZXhIOHNLQ2lu?=
 =?utf-8?B?cHFoeWwrcUs2dDhoeWtnNGtjL2JYQjdQUXhQZWEyems0eUZ1MjlXNTdNUTJs?=
 =?utf-8?B?NFNpRDNBa2dhdEhXbms3MmVBNnNXemV0bzVHTUZnM2NrQURJbW1weUdBWlVn?=
 =?utf-8?B?YzNPcUN5ZEtHa2FwSU1oWGVLRTNWZXBDV3h0TWc4T1Jad1E4QkpNVkY4Sy9j?=
 =?utf-8?B?VUhBZmhzakRlWkEyQlM4UHhWbkI5cXRxSXk2MGpwemE5OTF6bC80azU1MUhX?=
 =?utf-8?B?WU9GRlg4UWFUNnRRQWZ2SThwZnFZMmJGYUZLa2NraXVaOUg3Tk14K3BlZWpX?=
 =?utf-8?B?dWFkcGZFN1ZMQ0ZwTGdHVUpjclRWN25RSGRxUHBBV25QaXBFMHFEbXg0M0FP?=
 =?utf-8?B?d2dtUHRQKy9jNU1YQXFjM091L1hVclFjZlkxWEhWM01SaE9lVTBtOVJNakx5?=
 =?utf-8?B?Q1JOR01yVWtFVGJudExYZ1ZzcHlMYytHc3diSFdFUWtLdkZvelhUNWRLbCs4?=
 =?utf-8?B?SHpjaTI2dFp4MW5wMWdCbmo5R3BpVlNCV0RYN2NvS0Uxc3BDV1hQbm9aZXFG?=
 =?utf-8?B?VGo0L1RHQlUreFhtUURJUER0aStib2g0Qy9TcEtRcklZNjRUc0FpNTZaUjh2?=
 =?utf-8?B?allQQzhuR2pUYUVnVWkxZ213V0NPNzhVVTM0ZUZ2UTZYbWp3M2R0NHk4RkY4?=
 =?utf-8?B?cjZCVEp4WVBCTlhsL2ZqVnV1dDR4YUZDSDVHUWV2dnZhdEhSRFhVRnNDaUJ3?=
 =?utf-8?B?NHIra0YzS0c3UnlYV2R1d3lEbnVmaUhzalFML3hYQk0rcnNIaUxyUGZXcTk1?=
 =?utf-8?Q?Gcvici1dJprY3sJQjt?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d45f3752-0f7e-419f-4f7e-08de970314e1
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4557.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 13:14:22.5939
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UA/Htgv3jQC79wqyUUEo781Pg60XZFkU9fzuK12XvTWRg5ME2e+prJI9BffBNxlX5LqCKKJE15/M13Dyx+qoUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5975

On 4/10/26 04:45, Ihor Uzlov wrote:
> [You don't often get email from igor.uzlov@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> Add the MSI Vector A16 HX A8WHG (board MS-15MM) to the DMI quirk table
> to enable DMIC support. This laptop uses an AMD Ryzen 9 7945HX (Dragon
> Range) with the ACP6x audio coprocessor (rev 0x62) and a Realtek ALC274
> codec. The built-in digital microphone is connected via the ACP PDM
> interface and requires this DMI entry to be activated.
> 
> Tested on MSI Vector A16 HX A8WHG with kernel 6.8.0-107 (Ubuntu 24.04).
> DMIC capture device appears as 'acp6x' and records audio correctly.
> 

If this system is dragon range, I'm not sure that is the completely 
right location.

Shouldn't it be using the IOD from Raphael (IE rpl-pci-acp6x)?

> Signed-off-by: Ihor Uzlov <igor.uzlov@gmail.com>
> ---
>   sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
> index 85579c81378f..c5cf45881416 100644
> --- a/sound/soc/amd/yc/acp6x-mach.c
> +++ b/sound/soc/amd/yc/acp6x-mach.c
> @@ -500,6 +500,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
>                          DMI_MATCH(DMI_PRODUCT_NAME, "Bravo 17 D7VF"),
>                  }
>          },
> +       {
> +               .driver_data = &acp6x_card,
> +               .matches = {
> +                       DMI_MATCH(DMI_BOARD_VENDOR, "Micro-Star International Co., Ltd."),
> +                       DMI_MATCH(DMI_PRODUCT_NAME, "Vector A16 HX A8WHG"),
> +               }
> +       },
>          {
>                  .driver_data = &acp6x_card,
>                  .matches = {
> --
> 2.43.0
> 

