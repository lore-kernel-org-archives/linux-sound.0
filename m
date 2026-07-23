Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F5C7348453;
	Thu, 23 Jul 2026 09:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784800442; cv=fail; b=IGWciQ60k5MgnkmVAQD9atSAq7jwOIGGS5uGOEW8ysgtdVBaOVARXV8I3H4DJXeslmTLYHtItE/sQNSY4xi4ZKafggB1kwmW0oLNAzLbxWyem2qlMZjSJplPRWLh8UxwwnwX9imu+/iln7XLgmcRCpCsIavhCeFG8yOs2XE1p1E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784800442; c=relaxed/simple;
	bh=xbesbH4+wvl9lkf7LVrRinc05dKEgP1HgYzINIK4NXM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HmW7UOTfMtl4ASdFGPyv7trnWqGkUqxvi3/isto0jt0VkuZTOo1dg2f8IFdg6i4Wt5IUbeJok+0R5P4THeZ1MGu5TWlSbUQrpriCZRD9rwwmAF0xrMP7jdu4nYkooEwJMajrgrSo6FbivcB0vubQbkas+KDnKgMi40+Ugy76dTc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=lH6VtUwr; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=It05qUeq; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="lH6VtUwr";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="It05qUeq"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MIeM1d3530724;
	Thu, 23 Jul 2026 04:53:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=JbPVbhBoiYBJdKasdGZNb7GoZl5t/ZJQ0cFFXMHWPRU=; b=
	lH6VtUwrcUvN5PTZxP9UT1ogj09O+J5/m9DHFiyeYQjhpaOwF8Y+7Hxl+QYCk/Tv
	BIY9V7005qPS5SHv9X89M0LQZsrF3uXOLOKeozysVA4ZVs8qIbPRTBdUqh86JxAF
	e6BCO1PeMpeQDANSruXdhpZ7bCu5Jdzd5SgpJKk5nBM7y9kXP2NtxW/YPfaIJ6Mo
	TsNxQgKTCyctW9ONVEQtocB9tJHuiGijMPKR8ZSzQci/YMdY5+xxQxB2V1rhiGG4
	a4R/yGUR1asEA4ATzI65LjoSeJHER+z+JUNQVjw5YGzkfge5p3QTyTFNCaeU3OC4
	eS6oPe9My0sCTPWvExzZsw==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11021117.outbound.protection.outlook.com [52.101.52.117])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4fg5wff53q-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 23 Jul 2026 04:53:23 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fIq0sU0EzRDF2qDrJUfbYp3eRvKcgGPILPhDNOLm+5emYkXzzYqBm8uHKIeuzSub6n46v+UFUj2C2BRovOY1l73SCf82lveAwFCA83tmT8/NSccKO4DjwBwDRs6Vfd1WeM7mLV+0g6x2f0ulCY3RYmuN0xnU98n7g7y7qKxasUgUJNjr6+yChqeARAbbUMsX8XYoxjWqge7d314HN7ClWMTfjbi8J5Fd4v7s/ITtzOrsdG3QNNoj8zC0Uw90DLIAGqJBKfhfAGJnBsrGOdqNw25n7qBZUARjfV5jQDpfVIVO/pj/VrGe7vxDYC7B3dSAdD9dzpehz2ncO9vdGAOqnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JbPVbhBoiYBJdKasdGZNb7GoZl5t/ZJQ0cFFXMHWPRU=;
 b=OUacLJSHFXcbzehXcjx4hVTAWUMxC/SluUQii/3T9V6x7XH4aecZNNOVuZ7n54rPtFxKv3lJ+UG7jj0/LDJF9NG5oqRDHsh7UL/tLJfWW1+N9eeUitxjCYGqZszQkfgSkGzkJrrBC2k/4nAb1vpBqIbKyLbliEM3v8nImN1HWouI/V+Bo1lPT5HVXCM+2aNnzelz9wC1OENXc1L4mm3NApEMx9NR8tIZa2RypoR/ZL25F4TdcghEEsCuJKwyGRWaMWpKU1UuP/n6UmRTGYsLMSGbFh2T6bBgvuPtHr9qhsSmt1EdeuAwGaj7r2iX0ba5iSJKx13AV8ESpkbeZGCmnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=analog.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JbPVbhBoiYBJdKasdGZNb7GoZl5t/ZJQ0cFFXMHWPRU=;
 b=It05qUeqJHgtxgxgoi2HhRejnBfEQQNJNKdU4638cRw46Z/g5pXONQHDzKgAUNFzBkJyBbYEReEuqSvcX1vJzmRnle6g9qArnZnxil2LZttHS/nL/GaZFjQEyQaWA6kTb6pD2nFZJJHO5pQPpq+4Pjr89RQ1d4NOVEpTcbzDtbI=
Received: from MN2PR18CA0014.namprd18.prod.outlook.com (2603:10b6:208:23c::19)
 by CH3PR19MB8261.namprd19.prod.outlook.com (2603:10b6:610:195::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 09:53:17 +0000
Received: from BL6PEPF0001AB75.namprd02.prod.outlook.com
 (2603:10b6:208:23c:cafe::34) by MN2PR18CA0014.outlook.office365.com
 (2603:10b6:208:23c::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.11 via Frontend Transport; Thu,
 23 Jul 2026 09:53:17 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL6PEPF0001AB75.mail.protection.outlook.com (10.167.242.168) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.5
 via Frontend Transport; Thu, 23 Jul 2026 09:53:16 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id C03EA406541;
	Thu, 23 Jul 2026 09:53:15 +0000 (UTC)
Received: from [198.90.208.11] (ediswws06.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id AC23682025A;
	Thu, 23 Jul 2026 09:53:15 +0000 (UTC)
Message-ID: <eaaeddb0-7343-4249-96ef-3cd67a5fc02b@opensource.cirrus.com>
Date: Thu, 23 Jul 2026 10:53:15 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 22/26] ASoC: codecs: wm8962: Use guard() for mutex locks
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
References: <20260723045327.28260-1-phucduc.bui@gmail.com>
 <20260723045327.28260-23-phucduc.bui@gmail.com>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20260723045327.28260-23-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB75:EE_|CH3PR19MB8261:EE_
X-MS-Office365-Filtering-Correlation-Id: f720e2ab-35dc-410a-b527-08dee8a03862
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|61400799027|7416014|376014|22082099003|16102099003|18002099003|4143699003|11063799006|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	4VJZ9NJ/8JNDOxilcxCq7+a9PaOmARVhX6Bq9lin4MLUBGtlw7auroAN5vyQFhn/IPB6hwHE7/TxEPQb9U+Fc7ceiVeqymQ1a3Q803+U4zmFzUOz52+5sZ81gArQuwJPJ1b+Cw2Keg5SqpZKe8i3VdAsD9s2KEMBPQEko2sToNQhYbZzNPypQLd8r6Y5nI87CYwmlOQ7LxrpgPnC6kg9HiJIvOzO7UVj6Tg+pfH256AERq/PKq2r686FBNMzxunQLi0E5EV6cx3DXq7QJZSOxgT1vA/aXzKV5/cr4ySBGhXNoNqMQUu+/g5Kudac4WAt2ibeCdxaW+8914g1YqB+a4jjfqeUJeSEt+GHMiCT1WJLj9LtU2ES+Z/aPuVAUGEjhsl1EPcRq7u8ZHGA4cNFnda/T7o3shrx4Q66S/CirsEcwkVKVFZm3xAamFK7oYoN+7YibqNiotTA8OvF55XyLb53DyP59cLjS91FRf+MaRYT7aUzzc63h6YTs3PYCqWHqlwkuIZmFylBoFlUeUbQuuFmC3PXiZca7aJrZT9DVCrgVeEgvbARQyg9k6yxT/jTH3xTjLzs/H86MS3CJ2xMyq1H8pgPJvvOwZhD0b3H1GSKD0WuL8vThIhjpsU1vxZdiaKrihC6mtso/fGjgXgKHl2skqBBMO1f4RTpT7H416o7ESvJolVf4v5QA4k5tTqJD9Qg5Od8ZbSPt3DQjpBzBw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(61400799027)(7416014)(376014)(22082099003)(16102099003)(18002099003)(4143699003)(11063799006)(10067099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	WGZLTFXaag8tWVUuiOyaUkqHbOcFNjMoBUfOwmxUWilxGZZg18slISCtMawoHfYBFNqWy+Vb7BkiXFyF56y7dABF3nRQN4zrf3S8fL+n9Kz+9mJnBpIpnpZv5ePJUcCWpac/Rxhia3eNY7iRpcAL5rKyDFvuLMc9ImVbOoduvTO5l7HbyThL2gOKUx1Lt2tSL2oRvtIOep6984xrwfcywFMWrVoGKvk9UmmINBCEtRIRE0Ri1D5ABM8MOWIS8cGIS9JOdHVeEHPUxnw389ivXS3l8jWPngg0hQIkcV0wtz/nVKm3sBOSm0tH83eiVTeJDrre4Z0C7fgKdf8mgnvQMxFY8NXWfUjwTT5dcxjjH/NGLIdS4oXRLiRrmtSZBGl3Cfmt3NaX2roj2ljoRod61TfHn7nk2UAimsz/eHwBMwhdNFYqzgJ1FVtvvrrEpkx2
X-Exchange-RoutingPolicyChecked:
	Gzuc9+4OHUPFtTQwZ7AtjSG1lfnF0pVjBpzpevr2hzQ3GllQFXqdOC7Yrz1wkRuHXMfHvoC8bdm0RY6rHVnO9FWiy5EHzoMawNS3y6xGRjq4hccv2qjbwcB1c9gkTs6JlGJhTQ3DsC1/hYAILLQDQoKW5duF0ivOovz+oG80oPb9CpWYTGJ8nbqPCEqTz5xEQSmS8NXc2n3iMF9ZC5u0L7b4zytPC/or0m/M/3pla0emPFUCj5qnppx1i8fYAvEBohauDmBdYrn0ur+5UxSPUnfrdsPA+ze534ONfz5P2dCXvjozJRPs+RdUROnuOrOapyIPZ0bF7R1lgHs/08oWEw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 09:53:16.9531
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f720e2ab-35dc-410a-b527-08dee8a03862
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL6PEPF0001AB75.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR19MB8261
X-Proofpoint-ORIG-GUID: VctxB7fT7JI_ZZpXBwYTC5ZkJNd89_hm
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDA5NiBTYWx0ZWRfX1RN6h6Z8BdVL
 3QcxnkRqZo/z3XKSgOd2EezqqZJSJVz0ZWOxOwcZ2L662hrqWHSxgV+0ULW/kk58nFTuu7dsYdX
 8QA3xt15OTBzCvEWIPH1ZRPhmh6nNQU=
X-Proofpoint-GUID: VctxB7fT7JI_ZZpXBwYTC5ZkJNd89_hm
X-Authority-Analysis: v=2.4 cv=BdjoFLt2 c=1 sm=1 tr=0 ts=6a61e493 cx=c_pps
 a=nUtUY41U26iC5jD0qKn5yw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=pGLkceISAAAA:8 a=w1d2syhTAAAA:8 a=YzK0GkagNc5e2jYrGFIA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDA5NiBTYWx0ZWRfX6o6hUFMiDpnY
 sD+toV6W4gSu2JgeykG2E3ISZrpggbdVhZg3OHRW9eutdTo8/GR+Czm9czQzp4IA08W+3mihggm
 Az+XpReht1MCk6EIz0rD5yjGcDpZTwH5HnvlgbykcAX042gLeF7KtC0gva2CTdcYmOL0nATImGf
 1vTg6TF2nUwBdEBkKTccuSb4ui5JH8KEgHP7WGo4wm0pzbXhecyFnGLyCWpIaeRO+sOIwOx35TP
 e5Ry8uM1U1OxY1oDp5QjCSKBjmDFQMsexgZPgW/SMx0V/j3cd5OVAXOF0NQu/q/7Xelv8RHdqEi
 JUMO00ONtov0yj6s58Jst5gJIYjKfqP8QBFbSunVwd4VwZY3aajl4dt+Td8/odHOrIA022rrns8
 Q3BIPxzIaRlg7lIYEQxXsv15pm8s40B13nqmO6OnF7km+xIhVwbygrorbqD+G7wk7UXqD374fKv
 VgzDbOrB6gA1mkEpcBg==
X-Proofpoint-Spam-Reason: safe

On 23/07/2026 5:53 am, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Clean up the code using guard() for mutex locks.
> Merely code refactoring, and no behavior change.
> 
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---
>   sound/soc/codecs/wm8962.c | 13 ++++---------
>   1 file changed, 4 insertions(+), 9 deletions(-)
> 
> diff --git a/sound/soc/codecs/wm8962.c b/sound/soc/codecs/wm8962.c
> index 2db822fc1de7..8a9598161b35 100644
> --- a/sound/soc/codecs/wm8962.c
> +++ b/sound/soc/codecs/wm8962.c
> @@ -10,6 +10,7 @@
>   #include <linux/module.h>
>   #include <linux/moduleparam.h>
>   #include <linux/init.h>
> +#include <linux/cleanup.h>
>   #include <linux/clk.h>
>   #include <linux/delay.h>
>   #include <linux/pm.h>
> @@ -1564,11 +1565,10 @@ static int wm8962_dsp2_ena_put(struct snd_kcontrol *kcontrol,
>   	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
>   	struct wm8962_priv *wm8962 = snd_soc_component_get_drvdata(component);
>   	int old = wm8962->dsp2_ena;
> -	int ret = 0;
>   	int dsp2_running = snd_soc_component_read(component, WM8962_DSP2_POWER_MANAGEMENT) &
>   		WM8962_DSP2_ENA;
>   
> -	mutex_lock(&wm8962->dsp2_ena_lock);
> +	guard(mutex)(&wm8962->dsp2_ena_lock);
>   
>   	if (ucontrol->value.integer.value[0])
>   		wm8962->dsp2_ena |= 1 << shift;
> @@ -1576,9 +1576,7 @@ static int wm8962_dsp2_ena_put(struct snd_kcontrol *kcontrol,
>   		wm8962->dsp2_ena &= ~(1 << shift);
>   
>   	if (wm8962->dsp2_ena == old)
> -		goto out;
> -
> -	ret = 1;
> +		return 0;
>   
>   	if (dsp2_running) {
>   		if (wm8962->dsp2_ena)
> @@ -1587,10 +1585,7 @@ static int wm8962_dsp2_ena_put(struct snd_kcontrol *kcontrol,
>   			wm8962_dsp2_stop(component);
>   	}
>   
> -out:
> -	mutex_unlock(&wm8962->dsp2_ena_lock);
> -
> -	return ret;
> +	return 1;
>   }
>   
>   /* The VU bits for the headphones are in a different register to the mute

Reviewed-by: Richard Fitzgerald <rf@opensource.cirrus.com>
