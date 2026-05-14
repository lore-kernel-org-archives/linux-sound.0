Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 100BC40DFCB;
	Thu, 14 May 2026 15:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778771129; cv=fail; b=C2rM0o6q56gODTvrJ7dvck7XMvVduVZXMVLH81Oom98ZaSQ7mPuAsEdaJUzfXmTeMiOpC/qex8w1m5oB8lyD1z5Gp1LJ/RS2kQUaZo5SFQdzHwzwKBERF3OnUOjiO8nryq7Mol8NXKHuUFhsHJyU1EG5NnYpFMkuXGbQh7UOJNU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778771129; c=relaxed/simple;
	bh=Fvu9d57MQx1NBM77YEkHIxT7M8TJlAWBR/0Ws1MhMoM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qM9PlwMejHQ3fSL6oqDP9RJQtmxvtGXb94yMT0Smt/EZGPik6XQMmbkEGnoSRirpqG8/XnjzTVns2N5tMu8G3hBNUndUmXXwD9IvzuBL7EbiRWrZ6j360tzW8LnluXGsTaS1ZguufzAtGBX0/mMpR31R2sKr87BqVODJen8XH3Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=ngQkKJXg; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=bFiuhcNO; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="ngQkKJXg";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="bFiuhcNO"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EEx4Yj2439119;
	Thu, 14 May 2026 10:05:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=Ut6FBJOzYEwE+hyGFIfi/TxM3LaZ8nV52oMTka0gPJE=; b=
	ngQkKJXgg8LGr70BjrgVdipK/u609/FXIsOiCR3HlGilUmyb6+z/ocohpagyl3Hl
	YyYa8x24flZALtMPaebHqm7nqcAN93kMYrRPuSEpILa+7nRWI9BoYMDSzOiurnqk
	5gVjV58y/d5Nzr8K3CfLOOS93u35irQqhl+v350jqEw+wOqZcRmD4I+mIwVt9ICu
	M6wkujJH3GTVxL9C6Vwt0vYr9ttLEH4wk/A0zMD4YVaCKeaJuoEHBQIs6uBthvNI
	tJ6DXICf59AGiEGWCkXO5SD+BkcNraJflOPECFJZWWBhjYo//+yJRRUhtyH8Z8Qx
	We4McggujMAositpC7qPpA==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11021097.outbound.protection.outlook.com [40.107.208.97])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4e4c7kjmjd-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 14 May 2026 10:05:15 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BRuGwNFgR15fsKvQyQKyyBlcjeXeiWq2eLDjaXIlLypK3RooO1icYRwZnfBJ+w51J5+7iOEGfj6plgn/Ehm9JYStlx9X6IsrJc9TCd5BMSlbeWsYxET/pIXuMZsDfkq/3i0oryaEvMGPkzl5FWB0QC+C0+9TKtiOuN+/v0Q2S+vN13bthrn7te2sgpZHMRyRM0VD4oI5cQbmlz215ZwVp7PAUZAzRXmoNM5u5GrDHHZKqr8EeCCgcSh6B+OLfwHJfXx31OY3lA4rliWsGIHKduos9a+IWYQ7v7iecMz9sZT5OljYp3oHLgAByJycSPK3jQd7tsCIHazu6A52juuWZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ut6FBJOzYEwE+hyGFIfi/TxM3LaZ8nV52oMTka0gPJE=;
 b=yHau+TdVw2n/qosyM2zFbqzRtHNGAsyRaaGSPqUILQ4Egsdv7KJ77DdbW1wngMsnrDa20oYas11xa+dEFGwgEoaF7yRE7gw0oHZB5lSX/YiPShMkftgPbd//xHHmnFm/yOm3yPzJUFM3oHcqP/pyeqXq6FvnAt9fTeMNE+BNV6Y2DSuMX5K+yXN1QCDoysW44dGl+2ygTKj/XPxJVd+xTZ3JiHv51cwuHMHRYpn//feJz/jzElr4Tws76qgHUDc3LDZ9o7feCT5LvB88kxPhdVT4mXZeMMSu/0+Nedr5RjkOBA2Y0M4utqM25b/jiPk2BObkGYZUjVMqUIw3jvYaAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=gmail.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ut6FBJOzYEwE+hyGFIfi/TxM3LaZ8nV52oMTka0gPJE=;
 b=bFiuhcNOY3PU9ytETGqpTsG2enqH8opQrOErqUAQUb3LCtNnuVmnEm/oT7z660pgPp0sbobQ2sG/v1rHQCVC9AuajwwNbnxoxoUGNg3GKlq+gOkKE7JEbgQcPy5Lr7euhuEX2itFnr+Dj9RhFOPVYwrqmUI+DDaGCdj8m5ZM+uA=
Received: from SJ0PR13CA0003.namprd13.prod.outlook.com (2603:10b6:a03:2c0::8)
 by SJ0PR19MB4747.namprd19.prod.outlook.com (2603:10b6:a03:2e3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Thu, 14 May
 2026 15:05:11 +0000
Received: from SJ1PEPF000023CF.namprd02.prod.outlook.com
 (2603:10b6:a03:2c0:cafe::8d) by SJ0PR13CA0003.outlook.office365.com
 (2603:10b6:a03:2c0::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.18 via Frontend Transport; Thu, 14
 May 2026 15:05:11 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF000023CF.mail.protection.outlook.com (10.167.244.11) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.13
 via Frontend Transport; Thu, 14 May 2026 15:05:10 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 0FB4040654A;
	Thu, 14 May 2026 15:05:09 +0000 (UTC)
Received: from [198.90.208.13] (ediswws06.ad.cirrus.com [198.90.208.13])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id DB02982024A;
	Thu, 14 May 2026 15:05:08 +0000 (UTC)
Message-ID: <38aa8831-e2ac-46af-9fcc-4d0c7d6c2969@opensource.cirrus.com>
Date: Thu, 14 May 2026 16:05:08 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] ASoC: cs35l56: Drop malformed default N from
 Kconfig
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
References: <20260513162612.365729-1-andriy.shevchenko@linux.intel.com>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20260513162612.365729-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CF:EE_|SJ0PR19MB4747:EE_
X-MS-Office365-Filtering-Correlation-Id: e5c07981-8547-49f0-cfd7-08deb1ca3189
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|376014|36860700016|82310400026|16102099003|18002099003|22082099003|56012099003|11063799003;
X-Microsoft-Antispam-Message-Info:
	r0tsR7jRSJY2JSvj7fB98NfDP+hcJEKLnjGm8hUhsvJMl2+uvrwf2puo0GfWZYUTaqixQR6vYeSRmEAuG4frs8wi3pqi27KOHZJmJFGawo+OrWbAcSABkizuNVcPD7GQv4J1ns9hAxnJRPZFaIeoU3SQkHTYwySs1jPJ92lVZsnlvbKSHuwWNSJ00w4xE//GUHZqwUZFXRJ9SJRyxAwv3OwEgHC/Gv3Oq8GND26h6QJF3Sp40vTDvcKgnxDhh2ojyLazjmve/A56seJwxZ7CQ7+mIcclmj1dDIlHkOq+JLm8UTGARuG6NPuQcPBBLGlIT7oaF37f3jTQezeF9I3Wi4MPWerDH46vqqPixq9r6Q8Zo1lZI2p9n447CmTlYmDjQKEFQ0kVqYbefXAK1L9ispijnF2wVGdjswsT2u8jwUXw/jufjUVHBEQ23V2PAR2TXnYMklv3731aXBogv2MCRyNAIYHOuIbp9wkOHKQKTShcIzIEN4wMVOih7URVCH4KravgkAG4sIGnx6iEcOrMyK1dwz4TrB8yhZbG2QZIUwd1WuThedRHMsMSMJKZobXnwQdFZ9VnBrN8u2X6n/AyiNE+emDZJPnesMx0K1xeFuWZwaLDV96kIaSwa7RcRmIhpYGy4A4YfCOF5GmWzDHBnMn6e7E5GslHD4Wj1UmGBnFrxYOo7NUwyyg0KiZYWnOkeMcocgVohorXODZtrFVUix/6LeTWUzgaSqqMy34ma2g=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(376014)(36860700016)(82310400026)(16102099003)(18002099003)(22082099003)(56012099003)(11063799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	8FYXtjHdQ9lTQbCptgZpYWgpHKuYDKvI8++rjJYFgn93XV8NN/VoIWFL5ILYuR4cGLpWK+x4RKcbM1TXOHM/c0pr5BOc5AKpWjZBTLZyijEWwyOma/wJ1EaE7aKgXncJhVZ1eIU/eiMTEmNjP0XZcA31lnj/jWGzCLn5p+djpLkVgarebvNaTg4u5blknpawPUH2qWdEFTVeQw5cuCmEhkSz1ALY3HC6i23t8dJ4eZQ9mSon0LRwKjof/nWpijnyxeZAlc4M0ccUVPjLQtsnVaPcunqrz+eVxXpUxlD85qmwA84cHa83KRyXjXStfFyQ8fnBTfmKrxhsUh/jSfw+lRYlNAUkzmnpQ3H+Teo+ynmZK7kh61ixEuozbCb+OV0VUPAPz1I5BrUMqpimO0q1tVXY8Zc5vFfKgSSAown2iDCFIu/RPIh0OXQrVk3/Cs+S
X-Exchange-RoutingPolicyChecked:
	rSlGhBUQuVIBAAFclIyVmEASKKcVlNAgP6/YXvE8LkPao3y3wnGf1fRFK1pb023L08m5SRCxmhHwVi5aQlWRNOc6Cao2vzaMhzlUd3Gap2pSvTU5xkdZllmWiq9TvhElwmPOLua3krgqPryf0XRJFYNGsFrJwtS2msrCg6JteWClUJDRL/+O7G6sumRnyniyyWS4AXBPPfEnD9+kJAz2fxcVmTakUwY+oYtUrZmI0lRoqSInH0uLp/9AwRg3U0OI2qYA/J6+FE7WF3DXL3DO4aErlINYh+JWZH0d/pmLy8rLvoEzJgTfihQlihcAtSpgvtt16u99OgZbFRtQD7cntQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 15:05:10.2626
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e5c07981-8547-49f0-cfd7-08deb1ca3189
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF000023CF.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR19MB4747
X-Authority-Analysis: v=2.4 cv=DZcnbPtW c=1 sm=1 tr=0 ts=6a05e4ab cx=c_pps
 a=HfG1oWozJQbQxD3IkfRzFg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=QyXUC8HyAAAA:8 a=w1d2syhTAAAA:8 a=b8D-plGB5X1cvMOrIeYA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: iXmfpcsh7Urcgk_6fUwXcLqFS11x8RX5
X-Proofpoint-ORIG-GUID: iXmfpcsh7Urcgk_6fUwXcLqFS11x8RX5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDE1MSBTYWx0ZWRfX8oi5vtujTeM1
 c9hppG00Oykeg5bmAU/pMyiU8vJZkH7e+vYT/eW/7Ujk4LsF+fulHpzUp1wo2uYwYcDPeGq2uEU
 wKrdYObwOeRuq1uZbJqt5Df7Dd7JUqGgAOo0ktrJoaIoeB0Du8HqzwYNH3Wzixk9xQDlSzzJirD
 HK8qLgfrEcGKERLN2wjBymRxYOTB3Hbt3kR+XqHuq6JExVR06llRIFgrOA+V8ABRDPeYeANh/9A
 TrVBQGKeUEOiEZAFLqduw+Uzt+LtoRoVTgNlKbEmNrZL/eZO6vSde3GhesVhB5oxHZkFLA8kv16
 9OKHtBPr5391NjmGmkHYNd3aISq9+/5WgOaM1Z+ibtiAdiJrcNvnIo11lMNpyEwXaOWsBpAo0ky
 zTc3gYMDXwpicwI/WOVLahiRFedOVvz2HpAgMkSRoYDxKQOtVviLQpFw7lqs2A8y2kg0QsuRALH
 SpsL3EO0eUD1w0rJi0A==
X-Proofpoint-Spam-Reason: safe

On 13/05/2026 5:26 pm, Andy Shevchenko wrote:
> First of all, it has to be 'default n' (small letter n), otherwise
> it looks for CONFIG_N which is absent and in case of appearance
> will enable something unrelated. Second and most important is that
> 'n' *is* the default 'default' already. Hence just drop malformed
> line.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>   sound/soc/codecs/Kconfig | 3 ---
>   1 file changed, 3 deletions(-)
> 
> diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
> index 069ec05e4a61..db321b9f6771 100644
> --- a/sound/soc/codecs/Kconfig
> +++ b/sound/soc/codecs/Kconfig
> @@ -900,7 +900,6 @@ menu "CS35L56 driver options"
>   
>   config SND_SOC_CS35L56_CAL_DEBUGFS
>   	bool "CS35L56 create debugfs for factory calibration"
> -	default N
>   	depends on DEBUG_FS
>   	select SND_SOC_CS35L56_CAL_DEBUGFS_COMMON
>   	help
> @@ -911,7 +910,6 @@ config SND_SOC_CS35L56_CAL_DEBUGFS
>   
>   config SND_SOC_CS35L56_CAL_SET_CTRL
>   	bool "CS35L56 ALSA control to restore factory calibration"
> -	default N
>   	select SND_SOC_CS35L56_CAL_DEBUGFS_COMMON
>   	help
>   	  Allow restoring factory calibration data through an ALSA
> @@ -925,7 +923,6 @@ config SND_SOC_CS35L56_CAL_SET_CTRL
>   
>   config SND_SOC_CS35L56_CAL_PERFORM_CTRL
>   	bool "CS35L56 ALSA control to perform factory calibration"
> -	default N
>   	select SND_SOC_CS35L56_CAL_DEBUGFS_COMMON
>   	help
>   	  Allow performing factory calibration data through an ALSA

Reviewed-by: Richard Fitzgerald <rf@opensource.cirrus.com>

