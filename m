Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15727421A07;
	Thu, 23 Jul 2026 09:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784799088; cv=fail; b=sLX7KxyQO8yCAideu2EmaynXNQ08Q1MvmaJjlS7yo0tnWo93kynvHJwGRPjgyXg1ZfOyFfhTZg2ODtlTWtpFXa5/n92xtgOUOYmvQP6UHREUY05zxinWR5C7w4J6kQX6YkvoCP9OrUsoAk1uSl99gz63uRk4Ed6br0QzbEcdLX4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784799088; c=relaxed/simple;
	bh=C2nJRErEzqwUntSJjuK32xafL+Rrm/KyzXFlApXcZfY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=du/LaM4Z4ueKqY5dnOK/XfQH8P6OcEKFUshgv/IQGNU5JYirfVEw+6rgwCrnVE8MsdOAYOy0zfi795VYxlLgimwiyfrDkgd2xvHmhrQ0vZUV5laD+A70rG4v/65vX2ZGhc5rvejxIb+NoFEIR3aoFO3ZS2GKpXEBvTN8Iev3X54=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=LH4LrGUO; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=iDGhD6vr; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="LH4LrGUO";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="iDGhD6vr"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N4Unqq2279487;
	Thu, 23 Jul 2026 04:30:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=w9gr48Dwvfl71BB45TQuwCyl/14PQaExO09HrSvMZrw=; b=
	LH4LrGUOSydLWgXfSlEaIfwh4CR50dbaks/9fQSVM6GcQ7RSI5PUsXa6YSNSao4c
	DVKKAn9SqrdJF96HnwS0CXHI8MyX0bkmzsourbuLF6nvTzLHj+rCoZGh5jEbwFBI
	4rRldzd4jsizZf77W1xBR+1KYx82SxcIUv6Nw2OLe3OvmOHejHXR3dUnhJjTZMSv
	xLM2k8CDqEBlmP2C/wdw3dmi3BssEkFgPaqxhtco56fqD9keZ8OZZ3BWSSZ3mF5V
	lIajDwVomTLnl1qgmu6tkTvH7QU6c7GCrTOOT4Kc+tD3KyJtfIykTl4vFhT6mSl+
	QUUAJUd9lrd/lBwqFR4IQw==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11022123.outbound.protection.outlook.com [52.101.53.123])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4fg6vyq349-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 23 Jul 2026 04:30:42 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ijLgT7icvtKrcpl4zP4l0gvLINJGB85/H0JQZwWiK72GdccftgyV42yo9dQ8mlPUgJ9ScZAZ0VGxeU6RlE+ij8Gy7HJHKskN43mLOEKcnrBICkn04XE84CajcfYlQdTnJUTJh6q0DxdtBAKPcO4UUuyxhu6W9sBWejc8I75CrIT+R8ccYBerU491FRx28tm0yErcsbsIAm5rmlRs4hOq40zZpYKI7736LvilXf66Zw4C/FhRCGdh7+8AbEOVK4FDJOoJ0bybjg600O51UN+7U+8JjpSIxc/heK7D6GHnqnlUXLp5//sYjwSSgKEdFjM9ALQnrb5xqwUz5lzhnqWamQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w9gr48Dwvfl71BB45TQuwCyl/14PQaExO09HrSvMZrw=;
 b=UQtyOH8TwMnBBEQQRHInFp00HAIupRJUGmBT0+SFiZHaz5aOErcmNggqhyMDO5EappOaYngyWHzgnj29KhKrqRN2vMFRFcjDAffmTOeOKts5JA1Pfoykgc1nvGtaTghhkk2CY+RIub2wOfFqywE7EoTYU5NK8Rvtqs4nBBc2/z9ZTA8VsCls/8n+yNLARIYz9XrwRA+LyCH3DL4iCHpKg2nm9Lw67h/CVzU18gRsbzhcg/9rxc1QjoaXOsAZn2vNiGoBsIhgporBAzAD/kNPDsFq/M0T3j30/ulPKxLvtja8kc7Y/WmHdEx/vM+ncub/DWGMrErxzAT+/a4jVEz9HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=analog.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w9gr48Dwvfl71BB45TQuwCyl/14PQaExO09HrSvMZrw=;
 b=iDGhD6vroGeopHw43+FS9JodZvC5yJ6Ub0Q642/u3TL3GQ3K6r3lwW/PUEETrMolsi0yPifEsyeIZtWucdlP83PUwkWcWOfIN17HqaSDzDOrlJMa2L1Ukjwvrspfk25jL5PYQg2SSp4orGM1InymEqGP4SFFSniENsamMq0tjAg=
Received: from MN2PR01CA0060.prod.exchangelabs.com (2603:10b6:208:23f::29) by
 SA3PR19MB7813.namprd19.prod.outlook.com (2603:10b6:806:2fd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Thu, 23 Jul
 2026 09:30:36 +0000
Received: from BL6PEPF00022572.namprd02.prod.outlook.com
 (2603:10b6:208:23f:cafe::ab) by MN2PR01CA0060.outlook.office365.com
 (2603:10b6:208:23f::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Thu,
 23 Jul 2026 09:30:36 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL6PEPF00022572.mail.protection.outlook.com (10.167.249.40) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.5
 via Frontend Transport; Thu, 23 Jul 2026 09:30:35 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 9C159406541;
	Thu, 23 Jul 2026 09:30:34 +0000 (UTC)
Received: from [198.90.208.11] (ediswws06.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 8272882025A;
	Thu, 23 Jul 2026 09:30:34 +0000 (UTC)
Message-ID: <36d913b2-929f-47fa-91d7-2af198341ff0@opensource.cirrus.com>
Date: Thu, 23 Jul 2026 10:30:34 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/26] ASoC: codecs: wm0010: Use guard() for mutex & spin
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
References: <20260723045327.28260-1-phucduc.bui@gmail.com>
 <20260723045327.28260-17-phucduc.bui@gmail.com>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20260723045327.28260-17-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022572:EE_|SA3PR19MB7813:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fa015d5-320d-4f21-9fa6-08dee89d0cdc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|82310400026|61400799027|376014|7416014|10067099003|4143699003|11063799006|18002099003|16102099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	COZ6gbFD84i7/cPlCeWXASVWVJnuQl6BezQ5hcVuR8+dfrRxrRqpjA/scJUwQCbCljIAPc2zODu5bv+WQ7+4KTppnxo5RmqiayXP0YsmoAnIAb3xWaDekg2X8HLNuYbmdu0XVs2yXBROLjb8mZ4LQzUThqxwqEgIkanRPgjHlaV0G16D19l23/uYvc7goNaHqMIKsdTU+9se8avGci/f0TpOsKZf8VSHXIFyfWGC4N7vng81XUuuB/Kvwuvg8osYxOKVS/loxPkO8POmpEGVCluB4pex+zLGaFGDnQsVfXM075GeFCmAigtxF+ruPRCo8Ti3+P+wXnYSAt1/3HPf42GtemNYHxMniFvP4CBQX47bjC/rfLRG6BlE5coYmM3gD3n8zQyRuKuMZ6FzIYC400enMRKMZAUVBD4t6WMLup9qG8yR4UO8In3mQYI3HjoBPrUTnyJFGNrNSXKpRuzfNnlTmpzHfipIQvr45yrVpNchlXh6puF3H+K/BYrne0HajaGP+1RPqQqZLxYD6JGD7M+px4hxKlT5hTIZmORrOOpQDeuK3ayykYnUrKEIaalGdSGbsBX7AwtCZev0cJzmw1FrfYUuyxeYwxBgrCQGSqnJmPb2O09uq9V6hJ3lzfoxReeCFodrINTTRwKOP2GGR65tdhQce3ooMZHo7QwRbsRKZu3Qum5uhwjAXQuc34Gy/XD6LDS+nQVuETfLWoAuHQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(82310400026)(61400799027)(376014)(7416014)(10067099003)(4143699003)(11063799006)(18002099003)(16102099003)(22082099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	aRL/PVtIS4dObIWNT5tIiNl4Lta859uTRg0NGifeY9tNKnZ9xPJZ8+pFS+huZFahQDx3ktJSYQANSSLGj9Bl7O7slL8eLa+DRY21oO/HzgR0G9RDDD7rVZuMH1c8c+FAygiOhheR8glOJEV3sWHKU9hb0Wi+RuLf53AH5nQ/+2a3TNy72X7KwaCwQb9vRW+79G02PBJPvTQhlo/w6N6pdemLNur3GXO/em65QDiDN9vEm3OPm5LFoWjhGtOfDHG9utFy9605kLn1cF0mkkAh9uTFg8p0AhPANJLvFfXsX4l0xiwVeOO7W77+65Cq2bdksnio5b/1iU9JWxTaSMMmAU7+FxQER85x5fKPorA6oUgYwtBm8l7A21/TMnWPIvg4vEYH1lIs3DTVAOVpoIqrKOv7JKIHIP2o2edKKyUvF4qgWrtfHOiqhiSy4cd6XKnq
X-Exchange-RoutingPolicyChecked:
	egJU3/TtTM+cmYOSbgNM3MrATFiW8j/9+PPeQjiqncw0gIEgf94zB7WMddiTJXBdWnDkn9OV84wU+qguu746yR1NzuQFGWYiMwxQQmIjY06KyZVSL/QVRACxJKqon/DgZd3qg9f46IhVN5ExEZIbUoslQgBi2Z+81gTBxqd2FQ2FhPWHSoi2Az+Lan+RYeMw5I9dwMEtP7kDQYGTK0BTmHFki2B4JWzfcqwCEHkUp9Ut39NiqqgnLKvpmvpsu/4UeKbASVF5ew9OB2bgLp7+AbmfibzK2slNZs1uo3Ei0gmM4p87I+1+wvh1M7Bjxjds303jUR3QCICdET6q2Ao2qQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 09:30:35.4404
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fa015d5-320d-4f21-9fa6-08dee89d0cdc
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL6PEPF00022572.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR19MB7813
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDA5NCBTYWx0ZWRfX0JKgk63+cMzd
 aWTwgNRBi57je4HgAbcsGqTb/bXW8eFyfHCBQojKbqjA2LRp0Zfvs3s+ZXo6bJqo37MIaliR5Xy
 bt5XaRnmHySHDacFonuZcStn2SdzRXA=
X-Authority-Analysis: v=2.4 cv=f5l4wuyM c=1 sm=1 tr=0 ts=6a61df42 cx=c_pps
 a=8Uv1ePJK+YeJzHcGDdU98w==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=pGLkceISAAAA:8 a=wggVRkVUAAAA:8 a=w1d2syhTAAAA:8 a=dseZgc7Wqv4YLdx5lZwA:9
 a=QEXdDO2ut3YA:10 a=MZpHe7prQc2n3JaO1KVd:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDA5NCBTYWx0ZWRfXyxohM66/NnZZ
 eu5G0/HdWTtuFouB1VtJxVzdZsTAUARJDYB3G6Mr4s7yh5xEKZglG6RsXqk5/nKMOT7dw2i2+uy
 vwE+COuW9+Mpitrk49OqZf1HpO/v+v7KIs+m0FgWsGRxGnxslnEHGebdg/ge4ZOkYAY2MQDSFtY
 mlq7Sj9jcgh6cQsWdcOs0a9bIYWl8rlM9zcgG0EPzlcCGJLhzRDGeYnQC+T/ZPBLU3oAsIEtkVN
 oo0oDRITWG0ALq4je3jxxO6EjBqRJ7cqjvtq7Eti+zPGgoxCeJa4yUd/bYnnPJuLfQujKGGnozP
 wAHVULYSGwrMsFeCXO8rIRFo5nBnyfSDZ2386HKR+qQbCCrXGL6jv0R1q4PFUl2ixTQVRczNR2f
 hQKqpbk71zoXaThXxlNH5wfmLeDYarvImN6NaewaoPPXmmGiuVpk58tvD3CxlDeyiVmiDnTwJHw
 e5nXHTDTzSVS2LA4/QQ==
X-Proofpoint-ORIG-GUID: klnDbsqK3jEq0NoDuNBHp8_LPnPmt4qH
X-Proofpoint-GUID: klnDbsqK3jEq0NoDuNBHp8_LPnPmt4qH
X-Proofpoint-Spam-Reason: safe

On 23/07/2026 5:53 am, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Clean up the code using guard() for mutex & spin locks.
> Merely code refactoring, and no behavior change.
> 
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---
>   sound/soc/codecs/wm0010.c | 28 +++++++++++-----------------
>   1 file changed, 11 insertions(+), 17 deletions(-)
> 
> diff --git a/sound/soc/codecs/wm0010.c b/sound/soc/codecs/wm0010.c
> index 2a8c61a72c17..58c0c601ee6c 100644
> --- a/sound/soc/codecs/wm0010.c
> +++ b/sound/soc/codecs/wm0010.c
> @@ -9,6 +9,7 @@
>    *          Scott Ling <sl@opensource.wolfsonmicro.com>
>    */
>   
> +#include <linux/cleanup.h>
>   #include <linux/module.h>
>   #include <linux/moduleparam.h>
>   #include <linux/interrupt.h>
> @@ -148,13 +149,11 @@ static const char *wm0010_state_to_str(enum wm0010_state state)
>   static void wm0010_halt(struct snd_soc_component *component)
>   {
>   	struct wm0010_priv *wm0010 = snd_soc_component_get_drvdata(component);
> -	unsigned long flags;
>   	enum wm0010_state state;
>   
>   	/* Fetch the wm0010 state */
> -	spin_lock_irqsave(&wm0010->irq_lock, flags);
> -	state = wm0010->state;
> -	spin_unlock_irqrestore(&wm0010->irq_lock, flags);
> +	scoped_guard(spinlock_irqsave, &wm0010->irq_lock)
> +		state = wm0010->state;
>   
>   	switch (state) {
>   	case WM0010_POWER_OFF:
> @@ -173,9 +172,8 @@ static void wm0010_halt(struct snd_soc_component *component)
>   		break;
>   	}
>   
> -	spin_lock_irqsave(&wm0010->irq_lock, flags);
> -	wm0010->state = WM0010_POWER_OFF;
> -	spin_unlock_irqrestore(&wm0010->irq_lock, flags);
> +	scoped_guard(spinlock_irqsave, &wm0010->irq_lock)
> +		wm0010->state = WM0010_POWER_OFF;
>   }
>   
>   struct wm0010_boot_xfer {
> @@ -190,11 +188,9 @@ struct wm0010_boot_xfer {
>   static void wm0010_mark_boot_failure(struct wm0010_priv *wm0010)
>   {
>   	enum wm0010_state state;
> -	unsigned long flags;
>   
> -	spin_lock_irqsave(&wm0010->irq_lock, flags);
> -	state = wm0010->state;
> -	spin_unlock_irqrestore(&wm0010->irq_lock, flags);
> +	scoped_guard(spinlock_irqsave, &wm0010->irq_lock)
> +		state = wm0010->state;
>   
>   	dev_err(wm0010->dev, "Failed to transition from `%s' state to `%s' state\n",
>   		wm0010_state_to_str(state), wm0010_state_to_str(state + 1));
> @@ -734,9 +730,8 @@ static int wm0010_set_bias_level(struct snd_soc_component *component,
>   		break;
>   	case SND_SOC_BIAS_STANDBY:
>   		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_PREPARE) {
> -			mutex_lock(&wm0010->lock);
> -			wm0010_halt(component);
> -			mutex_unlock(&wm0010->lock);
> +			scoped_guard(mutex, &wm0010->lock)
> +				wm0010_halt(component);
>   		}
>   		break;
>   	case SND_SOC_BIAS_OFF:
> @@ -832,9 +827,8 @@ static irqreturn_t wm0010_irq(int irq, void *data)
>   	case WM0010_OUT_OF_RESET:
>   	case WM0010_BOOTROM:
>   	case WM0010_STAGE2:
> -		spin_lock(&wm0010->irq_lock);
> -		complete(&wm0010->boot_completion);
> -		spin_unlock(&wm0010->irq_lock);
> +		scoped_guard(spinlock, &wm0010->irq_lock)
> +			complete(&wm0010->boot_completion);
>   		return IRQ_HANDLED;
>   	default:
>   		return IRQ_NONE;
Reviewed-by: Richard Fitzgerald <rf@opensource.cirrus.com>
