Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89AD83F0765;
	Mon, 27 Jul 2026 09:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785146078; cv=fail; b=Gj5Z1oiLspdJ6O32mvr3kLMv1FNHxr6aJUjrlVWsTDke6GcjoVKB5hjqYpMpSMKBtIVG5vo9E/DjNYm4B+pfpNl7TvQJxyy76lVKqP61mxOeV8IDJbB8X1y5X/AYtjMh3zwJyEUyCh7XXT11cyJXz5AO/4nBFycOiDce5itRYKc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785146078; c=relaxed/simple;
	bh=LJ/+7cry8cLJElDaCpugPBe47PMNeCexvRWnxSMKM6s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qXkZFC2C82HqnwIvnAkl3AcPE1t1Sgccj44Ddo5/tXXp0FE8YLeoKPxH79gO/HNPGQaTVnYD7pBUIkFJFf04gPrzi/cRiK0V6s6ZAENvzmiX4Zmlv0Qksfrpw8LaJphP9QPtMYn6HD23xDI6rpeglgOSYJ0yLifln7ijcaTrTh4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=XtzA/yhE; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=xaOjm1dM; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="XtzA/yhE";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="xaOjm1dM"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66R4w1HR1663499;
	Mon, 27 Jul 2026 04:53:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=SC9l8r7z0jhnEkV8gXs+oK/jUVUmULLLjG7rmIaEdWY=; b=
	XtzA/yhEEFLY0lvE8s5H7GnJrSP+AbeZ14SEkQsKJNw6jDqghWE2xWSfF/n0TNKD
	6a5QslPNHLXjbPtP/ioXdoGeZVo0dnMGyODC4U/8RAp6ghufZhXvVEkhYK0m5esr
	2zbGdR5yn7lu5nuYYWo+N9IhKyIifQCYiSQi3MBR6p5mlN/g6irs7+5pzUzJiC2D
	WLY9fEY8n05+2+LUWkJMswhTW9FxkJjCh1hn/37iI7QKFwVJDPYuJW0bKBI26VX+
	njg278dyrvUPb7Z/utZEZJTJ2u+eDEQX5qkb+y757IvikjrGsauo3e/xem2hJry6
	YAMAe5nnKt3YkXPwYCuKmg==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11020141.outbound.protection.outlook.com [52.101.46.141])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4fmsjg1wfn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 27 Jul 2026 04:53:53 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m62xUlPCQ3XdErjgRJPdXh9R+BLVME8sJuVTd8eC1qXkFCOtpyYhOiABAZtNStrmmd/03ulfAL3Skj1y+DukJq7I+RHzYjRRJsSeKxOUFI0SdlZoAxK8dlcfJ8JExLEGwkglM48ciECHOtAnqGhVNkNX5WP7ar42FiBTj4GGRfESH6BjHtEB8Kw5SUQfyiN5eTAoQUNeTHs9gnhg4TRsQ4sJROE0HV3/E+nM5qyR3gkzMDIdq6hVv5EKZB8nKJcEDHigXtFXG3p/5mrWf1anMCY1+2zmqEiY3mwSsm6urXBtUie5uB1LaJ2sDB/DVdO/EBNldo1sk5z5y+ajU7uwrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SC9l8r7z0jhnEkV8gXs+oK/jUVUmULLLjG7rmIaEdWY=;
 b=A6T9noGGitbYgc31rlx2ETiZIQo0XTiKh9AnDvlsY+qfbz2i+g3m/hLS2X5DJut5ekcNr4dm9jdC3sxjji3VfwALxM1yrRQVxuro7e2cN7dTbeq5S8AgdwJpw1RfAFlyGjYMqDqdLmRMaaAQSq1tAGJxhWMpg88N6SP9K/DJCrd+bSC9mcEepUW0/m6agWAW4J4WbH6MNLr8N4n8WnlLAeKjgsYIB7xOpTWIsCInAzd4jpvlNEWLpgEPUG2HJ6LsiMZK6nSCSWpkZn7xCPeAT4iYesNHtJOBGW2dKa0vYjSI2gb1e8pNETrRRcoX8q/nH/FnhbPfKoSACdi3YigNLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=analog.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SC9l8r7z0jhnEkV8gXs+oK/jUVUmULLLjG7rmIaEdWY=;
 b=xaOjm1dMYDSdHaLIR5/HOB2t1FRV5lGzI7QFRwFURjuOwANkJmLEb/ts71XzbXz3/m69+T23bjH516Pel66jtA426+jcObuarNKANnwDLI6wOeHstCxdYZyQK5mfJYiJbhUetwpfetxv+8N0rAoStF3gQmOQKoXt1ihtfjI2VTs=
Received: from BY3PR10CA0011.namprd10.prod.outlook.com (2603:10b6:a03:255::16)
 by SA3PR19MB8168.namprd19.prod.outlook.com (2603:10b6:806:37f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 09:53:48 +0000
Received: from CO1PEPF000075EF.namprd03.prod.outlook.com
 (2603:10b6:a03:255:cafe::63) by BY3PR10CA0011.outlook.office365.com
 (2603:10b6:a03:255::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.13 via Frontend Transport; Mon,
 27 Jul 2026 09:53:48 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CO1PEPF000075EF.mail.protection.outlook.com (10.167.249.38) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.5
 via Frontend Transport; Mon, 27 Jul 2026 09:53:47 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 28BD2406542;
	Mon, 27 Jul 2026 09:53:46 +0000 (UTC)
Received: from [198.90.208.11] (ediswws06.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 0B00082025A;
	Mon, 27 Jul 2026 09:53:46 +0000 (UTC)
Message-ID: <7c4c11a1-758a-41de-8449-45b5f311faa6@opensource.cirrus.com>
Date: Mon, 27 Jul 2026 10:53:45 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 25/26] ASoC: codecs: wm_adsp: Use guard() for mutex
 locks
To: phucduc.bui@gmail.com, Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Lars-Peter Clausen <lars@metafoo.de>,
        nuno.sa@analog.com, Shenghao Ding <shenghao-ding@ti.com>,
        Kevin Lu <kevin-lu@ti.com>
Cc: Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
        Steven Eckhoff <steven.eckhoff.opensource@gmail.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Linus Walleij <linusw@kernel.org>, u.kleine-koenig@baylibre.com,
        Thorsten Blum <thorsten.blum@linux.dev>, Kees Cook <kees@kernel.org>,
        Chen Ni <nichen@iscas.ac.cn>, Bartosz Golaszewski <brgl@kernel.org>,
        Shengjiu Wang <shengjiu.wang@nxp.com>,
        Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>,
        Pengpeng Hou <pengpeng@iscas.ac.cn>, patches@opensource.cirrus.com,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260727094046.23001-1-phucduc.bui@gmail.com>
 <20260727094046.23001-26-phucduc.bui@gmail.com>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20260727094046.23001-26-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075EF:EE_|SA3PR19MB8168:EE_
X-MS-Office365-Filtering-Correlation-Id: cfa7195d-480c-4bb4-892d-08deebc4f44c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|36860700016|23010399003|7416014|376014|82310400026|11063799006|10067099003|56012099006|4143699003|18002099003|22082099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	DOGM8m6SokeCkza+0ON+ffpNiZ3jkgs82ctRiki9jp0ugVIynhiyx4CsFOSmI2gINgECUVbVkWHlwWfz+dwA23YuPm7BvKcHAxjCoOREDfBPFoLOefbMah57WaFcBBUon06gsXJF6SxGhZyHGYIL1jANI3hcACtlCOLY6O1Gi/AwFdT/yWglQ6K+po9kjhDtT/gqDDATp6EVH0zEXxpIFqpiDsWM+LaIT9gAbPgNklqHTNmgIoZqfi99g+gNGtDCbp/wGVg4Dl6WFAJ9Y34CyPtAVU2pEVFn8XlsAina98eAlXtw5GxgLeMpuFEEKHxY50I1QazxZK8Uz9/SRWhqUMGiOjrwFqkun0Gkegozo1Dmy9PdPPA874s3D8uilE5rQUmkhcu+rHoZUX/cEBVNurLu5zwzpa9vYurYIlYTLlIuF8tQ17R2a7YZpsmOvf8ecEvsz/YzzBf7fPMVc2EoqK/C9r7yyebqOQAMIVN+J7ajAZfUidycJTGML0UGD4rrINLQ5HJk7duzNpN+HeF+0Jasz2rgnwGYQEi1HOnjV86w5bGQ04xg1VwtSGGvCPFB97FhBLJqmeOW/ORSIGXVBjqE+eIypl5GYMhzVi46lE2xOvrQ/E460vM9s9uJ5WG1DtT0CL4n2uHfEk2R0N2KiRE8Z2XVB55SIIosHbfbSNWHoeCDQNZSZgzwk64YVa3M9SfPUheNWa8oVN3i+82pXg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(36860700016)(23010399003)(7416014)(376014)(82310400026)(11063799006)(10067099003)(56012099006)(4143699003)(18002099003)(22082099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	8e1Hax5z7hzmeJYCAT0WvqJKScvn/jrrMw9Io7+WO5L91iW76feq4/olfsNQR+P4W/XT2h9ipelpikJAxowypUrO66DrTUTmGSm0Q9Bu/Zufg5modofb1lSld0P892x7Mas2ON5kaA+87a6J23oLaBVDpq2rBFsxAGVxHNICjPKN2X9hsWpdrUAfIDl62WaI3FERa7+2hdXUppx3r6/G1fgXLOXhoMOMw1763RS/ESjoNAASbp8fwTAuT13EBebFrAejCBM7eVcX/R89jDHM0Cnon8lzs2oJ2cfIQX61xhSsrRqkuVRWuktrQ/dd3XrDJjAdCkZpmVRBgZsJyUodCpls4udYuAycVMbrDm/8oo2/8kzTaAhUhP3DLqdqDuzTDIk1LyBKiBgPLuKE9jodDnav8XISVVmyqpShjGG9n3hwyrlJeGS7f7kFn83A3pyl
X-Exchange-RoutingPolicyChecked:
	iISV9HMumF+xMKD4EjFd0TJavGL5wAWmPOaQkEZEoXjjH7YojuncTMETrnQCPqH9kaW5M0CBScNLrhdJ3pt8S8byd92TmAKHfgdu6YVZdAzJZ0ONO0It76pgmcDbzcQ104i6GefT8+ZmwwMoPgy4RFrXFYXtxJDPMXZPSCfjZ2LNEQLXj4Y1SFSaYhqU9zMJUVcgqZ80rI7gGZlRFG0G28PCiLKHnXmGQvLMZmWEDtUkqlLPKi5PFgKIihog9mSyhoPplJ36EhSLwuwE07jhXcIEytAzng8QHtxR6DG+g8RtBM5uJVX0Fs9aNMcrMf39RLazCbwTgeJkg4mDVDte4Q==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 09:53:47.4685
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cfa7195d-480c-4bb4-892d-08deebc4f44c
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CO1PEPF000075EF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR19MB8168
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDA5NiBTYWx0ZWRfXw/NmXl8rQkbg
 JZF5yGNxfuCbdkY0zRkd5e9DCYXJoIHocUZnx0ku/0aA4lEzQgn+qhSSH/CoAVaeHQtPA1lF0UJ
 RRanSHdjQ1UvbmYypppe1LX5ynaGk9w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDA5NiBTYWx0ZWRfXx7ipssRzdNw1
 hrfPlQsQXVLKbB5sM0RU4c9KKUl9wGeCDLeJJP1kEzqyNZzmFuHDU00ntWkLDvZgCl9cGdxf2Wj
 NUa0YQxyBjHjvIrQcbVL58gBcXNtN91QQP00Jr+XG/Qb5Se5O27H6qqVz5o6r9XVb+Tp8XSOJ56
 isEUVg9tCcoDYiPysXXvgKR36yuhNWqYBXZF4MCSvtgo2tHq+WSm7iQ0i8fMU0xWSBT0KVZYB4W
 NktgHsdDj8h2rVsnaJxS9kpYOFQ113colieUkr/zqxvgY+3S7/hJYiDwl+hCTaT2adMotDfDs7b
 pxDFY9MFYqD8dzm6NuP2pQQaG90oOs+pEWlJhCLf1fGuI93uZtIbuq3NBVY+LgaGmdscZLvE/OV
 SMFGej5V811GZDVN0CSAPn1WyUcsUT1UJmnVpaB4Pz4xAMrRl9NbarRVs2/if06Y56GazH9MXsg
 Teo01M9EkiXTb7rTflg==
X-Proofpoint-GUID: a7EImWGsm4267mYbxJcgSeF9x9EisG8O
X-Proofpoint-ORIG-GUID: a7EImWGsm4267mYbxJcgSeF9x9EisG8O
X-Authority-Analysis: v=2.4 cv=XLwAjwhE c=1 sm=1 tr=0 ts=6a672ab1 cx=c_pps
 a=VxO0TNiV1+gBiOWqST4D9Q==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=pGLkceISAAAA:8 a=w1d2syhTAAAA:8 a=2LXkwXwYv1G787AwtbYA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Reason: safe

On 27/07/2026 10:40 am, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Clean up the code using guard() for mutex locks.
> Merely code refactoring, and no behavior change.
> 
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---
> 
> Changes in v2:
>   - Add the missing `guard(mutex)` that was inadvertently omitted.
> 
>   sound/soc/codecs/wm_adsp.c | 77 ++++++++++++--------------------------
>   1 file changed, 23 insertions(+), 54 deletions(-)

Reviewed-by: Richard Fitzgerald <rf@opensource.cirrus.com>

