Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63CE643551F;
	Thu, 23 Jul 2026 09:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784800505; cv=fail; b=CYqgveZ0exc0/22GBGVlWMdGMtCYklgg+LYD4AqohJjHoC6o8ybx8ZwT8UH4XmkpP/mIqAn/dRfwTpZM8uBUnkgsGRbikcZnA9ePCkv+e3pfsPQucMGwh/Xor9utYiLn6Wd28VWaDvQmuXywF8z3LPkfXpTjLkoDyZDeq2Zfrs4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784800505; c=relaxed/simple;
	bh=M0cdzggdVadihmuv+12QxyVpFdlW0eIHf6vpelzcuZw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fbB9PmwLshQm1lwm3JdEL8dOScoSkFSmDXcTOnOITtXHI7p/T0Os0tRlpNDlDrPelGXUQ73poP66ItiaAL6x23hihOFVjuGMvENWBZASh1uaAGvyZZ/QR+/8yHp6NM6Xn4cjrU51ssFq/Wkl04+oHdRv+qwa67n3luiB50C3FUE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Uh9oo06b; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=EoOLyJ6b; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Uh9oo06b";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="EoOLyJ6b"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MIeESj3530423;
	Thu, 23 Jul 2026 04:54:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=aSbGDSz6y5/CFtsx4ofFbsnEeJREgnvBPzwnstIdNFk=; b=
	Uh9oo06bfOK2z8qdTTjMeP+pNDMfEXxPYBU2yAiUFr1cjYT+ZSplmX4eZUcKdj12
	uSfkBu5HMx14iRCCbQZPvUe6bZ/0wgK+3TuveLtGfip6QfGi7jCudcNQxxTT0GnA
	C9p1mKpyNSV97oWAxVemHVhqOltgPmOqmuTIRifYs00aNorGm9pX7lJNlDcvYngT
	OWwdsEnBHyZNWkyYmZZneP425TZJkUHZsLsPKzFYG+FZnk70exmkImRMG3F3Tf4h
	1B8rzc3EvQAkkO/3/zTu7IOutlCwuPDYpS/MGtVUwtrRHCid9Stocf2EQ7gxa9Bp
	CFdC3Mxq/Myb32nkTxRciA==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11022096.outbound.protection.outlook.com [40.93.195.96])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4fg5wff54h-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 23 Jul 2026 04:54:26 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TvLtwJmRDzRhLmwc6P51o+6qeWxVR8wBA6lGlNblO1z2i1/1mT7s8ecqMzPT1Gv2Aj7Eb3Dxc53v+S6D2UMxAR3EoUA1Tav2K2QOXh7I1BfJ3p16n1jTvciLIvCNd2b5FhZpV9mTOpSb0LTwgviQ23wFak3OIe4x8nJNpT+iGrKSBaMz1ITKSziD6GLdUdOixSXYhb0ieezsmPSZNUFvihRt+ejFwXCPw4PYTSNI+O4HShQSE9AsY7+D66ZbrvlknWWJBI9Z/Jg9OaDUyUfg0BYx2yLr2wN2usyqhNpLXdtwARyyY7jtBetCILTYphoBEBBZfmdF4XZdmzNvPEseAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aSbGDSz6y5/CFtsx4ofFbsnEeJREgnvBPzwnstIdNFk=;
 b=q2i6GphICOaOjxUj0oaLeD/fSl5uri7rJSYSLDR4GIKlGhnIDCX2Im82yMnamv/U5tN9ZBwG4LLs84HfraC1l3lOhJIkNtdeanURtxYQkBBLMupD5Uq/VkrquVHEcW8S0oJYQwI1NYgl6y1qa0JTi7UrKQhrLBMzsSE4TE4bs1OnmdaC6bW0PDldHplKnGeJI64Riy7fvPoGTUPkloukB95GdBerY16pLUPgWXjoSRPb77Bmg9zFvs6G6HwIouwhiPRmeVJ4SJ5FaHw5LDv7MqY4Rc4duQOyeIwUhmvgIyuZUA9bwyYh4GM4NAN+k6qRtmz0B/VKZV2oWPwSbEOmUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=analog.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aSbGDSz6y5/CFtsx4ofFbsnEeJREgnvBPzwnstIdNFk=;
 b=EoOLyJ6bO07Mdt+3/fpYbEZI55ql6LwMOY93IhU9QVTe7F1reu9BEhELvCnj9FjVh0FbQMPu0p8K+FvIWB2MTYzS8bb/1G1sYeomWcj989uQljbzM4iyBVAgjto4mitfFosJqkmcGWFrI+ouDJMWkeuRciznHjxM50s1fLCN+/U=
Received: from BL1PR13CA0320.namprd13.prod.outlook.com (2603:10b6:208:2c1::25)
 by SN7PR19MB6784.namprd19.prod.outlook.com (2603:10b6:806:260::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 09:54:21 +0000
Received: from BL02EPF00021F6D.namprd02.prod.outlook.com
 (2603:10b6:208:2c1:cafe::23) by BL1PR13CA0320.outlook.office365.com
 (2603:10b6:208:2c1::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.5 via Frontend Transport; Thu, 23
 Jul 2026 09:54:21 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL02EPF00021F6D.mail.protection.outlook.com (10.167.249.9) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.5
 via Frontend Transport; Thu, 23 Jul 2026 09:54:20 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id C6774406541;
	Thu, 23 Jul 2026 09:54:19 +0000 (UTC)
Received: from [198.90.208.11] (ediswws06.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id B776B82025A;
	Thu, 23 Jul 2026 09:54:19 +0000 (UTC)
Message-ID: <8f3a84e4-f0f8-4510-b952-81f762a9d014@opensource.cirrus.com>
Date: Thu, 23 Jul 2026 10:54:19 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 21/26] ASoC: codecs: wm8958: Use guard() for mutex locks
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
 <20260723045327.28260-22-phucduc.bui@gmail.com>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20260723045327.28260-22-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6D:EE_|SN7PR19MB6784:EE_
X-MS-Office365-Filtering-Correlation-Id: 4738a5b9-e08b-4ba2-4c84-08dee8a05e61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|61400799027|82310400026|36860700016|376014|7416014|4143699003|11063799006|56012099006|10067099003|16102099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	04Rc325MzsuefGxIMX/L7Z6CdD9IuXQnA8doaxeFrN12LU2lfRauizWDZRl5C6yEHEsBcqjWqzU5IG7HKdJuhFWGUdUS4Rf2niTKHlg2HaP8HGTU6Us6vpFPnWjWdAZSF2zO3lZwoXuGPG+DxR0CtKNYleUoGhAM6MIzjT51f1xsuMx8C0ONdhFgzXJf5ogiMueYCppRT6getXUTE7FfRqJdDbKb6pCWA8uBRnl0yBBMtGQ+bgeC8uJUitwAiPKuMcFAxFGG8dIDgB+VG8pNcpCgVfx17uBOmuLBC8WpNDNRQw5BzPld22vQefba6qYuQw/bj/0Tyfpf/74XLt8sr6SUMHNL5ICRmkah4rXjYJcQWn2RQrqsQ4tZEVHTwlyCT1cbJOvbfHaI3hp5FwiVyCwkuW+Y6XV7TBj/mEjJGRGHY9GT10V6u2l2Ep6JF8s9jmsRdn1gduVsXi3BhzqXJDbbhEXgqqHLEG2SW0rrr4eltbd8FucR+LBcI3D7qCukTm1DbXUpwDnrGBnw2V92jqEqezp4KiiU65bdlqdvhk8pyY60syup5vWzJGv0s4KdZPdObQFAzmylDSHmM3dFpleQXys0/Au/KFpRcDMUjUBwOEP67zeUGbTbj39obvw/p2Ds6y9dTbtL+aQT7OG4S35qIzLivzSuz4oYBm7WzrJ48KbpcBnCSJD/6ybBkfiSvANMWMmah6vZ+lTFDsrwgA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(61400799027)(82310400026)(36860700016)(376014)(7416014)(4143699003)(11063799006)(56012099006)(10067099003)(16102099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	fKwl2v06UVHVID07/PufMrZpTpd0rCQadRkCgRzTz0mfpQMmqBEeFiQq+vKh2Pb/0hq0mhEUmdHjJBXW00WUe0LsYrjLJZooYl4kkhReTDCbtY09eV6lAjeBWLPKwnYukYTT7rsBrmnDANgz9SvoDd0eyHlt8W0zZB8JrJLK9HCGekGh/ln5CAaT6t+4SMawoYvR8wQtLoyui3Mpor4TG91amzRp1G5uMJY/wOAodxAuCtu5h67n9raX2akHlq0/yD+X+0YqgO0krhAsAng1TrjDZMYKUZ/so6vYAfUR+bziFJV6O7l6i9ez4PZNrwYbau80/FLiwmemdb3rTBCfBBBcL+MkLI2JOP03GWhvrAwPMfWig0xG9JCKaifquS91vkkmHi3/xjYEIc12/4a/HsU4gFjdsEJPPkA4qOLBWETOprmjWyNUKvK6j/mAEDZI
X-Exchange-RoutingPolicyChecked:
	SAseJrwwjR2oNxvpFXUoz7lHuCpJlsV+uqKAGCvqM6nQryoOAiapOtg30BTK8MsifcEDBAlqOGLjvWAE4BhvJmosR5owReH1bkfxxXpm9xxZcWKluV2QxKULfm3FQcnJUMss0EvS/q3SN8NVr+aSritOMGsuGC/037PBD/BNcq2ybBJ+BzCFp8j3eHbTqRS+nbV5bvTexT0xiWud0d5dvz7nesmlMU91zCZU5fOux9d3+OPmMHQ2v+bdBatgjOZHs0DfK207NrWQaHk7925W3jvNMcnEv6ugYzaiOTuLbSbTsoUZ8rkEF52Xz1Jl1k+q/GfmaviilHx7mRZCueGcPQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 09:54:20.6960
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4738a5b9-e08b-4ba2-4c84-08dee8a05e61
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL02EPF00021F6D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR19MB6784
X-Proofpoint-ORIG-GUID: ip00PvCxCJ8aTqBV-ffPGb75-elfGl1K
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDA5NiBTYWx0ZWRfX7lOqsXXxxum3
 iESXpFI5Y8EPws6ba31zgagyE5qAXHsNYci5FzR/ehnmbMV7tgph7SHEoj3m7+XOST4840dm8hz
 HfH75OEosXBTSKrnnVRUNhrOzxGpnRE=
X-Proofpoint-GUID: ip00PvCxCJ8aTqBV-ffPGb75-elfGl1K
X-Authority-Analysis: v=2.4 cv=BdjoFLt2 c=1 sm=1 tr=0 ts=6a61e4d2 cx=c_pps
 a=DKZP5JzZ8AWO9Vvd/xN3Jg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=pGLkceISAAAA:8 a=wggVRkVUAAAA:8 a=w1d2syhTAAAA:8 a=oz3nwUUBMwimQrgN-I4A:9
 a=QEXdDO2ut3YA:10 a=MZpHe7prQc2n3JaO1KVd:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDA5NiBTYWx0ZWRfX8/fa3zz3DZbr
 A4KWIVOlIOJQilTyjNk7Gtzu6B3g36KMtWYdTaUlGI4DjdmpX/IRQWcoXK8xZ1r9zPkJwIvSiN8
 csmw0vOwXZ4YL5U4rkpVnWAnNz/MsAr/2Oo1ubutd4iIREaOoGDzfuhbzYZn9bEqt4h1zSC4Rid
 UHQeSyz+mzOXgy5vRQFrfTiwUWPDDXMRAU5JmR29msYiExDhMbcGmMno5+VbxFp0m0RlrDoTfX/
 MOrEYvKwDF/SpC6uS9+hqBVRyiG0HYm85XqpeqIULSMUZYX+AAeuTp5qf/rpF74roy7NDmFW067
 18wE+f5d0T/iSuXo0k8u7Mm8F05u+eh1FZjDEQkz2oilWWhli3dOY3o7D/sfANRSvIYrosv03UD
 c6D8LfUoj5YPk+xFUJ4NEbcp5OiIcZ/8Ip3E4Txupo8sGhY0pV68kDjZ4+QyeGCPyHYI7crnuIz
 DofNVj6gZjV+aFN0E5w==
X-Proofpoint-Spam-Reason: safe

On 23/07/2026 5:53 am, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Clean up the code using guard() for mutex locks.
> Merely code refactoring, and no behavior change.
> 
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---
>   sound/soc/codecs/wm8958-dsp2.c | 10 ++++------
>   1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/sound/soc/codecs/wm8958-dsp2.c b/sound/soc/codecs/wm8958-dsp2.c
> index 8ff0882732e7..f75a6dc9d2bb 100644
> --- a/sound/soc/codecs/wm8958-dsp2.c
> +++ b/sound/soc/codecs/wm8958-dsp2.c
> @@ -7,6 +7,7 @@
>    * Author: Mark Brown <broonie@opensource.wolfsonmicro.com>
>    */
>   
> +#include <linux/cleanup.h>
>   #include <linux/module.h>
>   #include <linux/moduleparam.h>
>   #include <linux/init.h>
> @@ -864,9 +865,8 @@ static void wm8958_enh_eq_loaded(const struct firmware *fw, void *context)
>   	struct wm8994_priv *wm8994 = snd_soc_component_get_drvdata(component);
>   
>   	if (fw && (wm8958_dsp2_fw(component, "ENH_EQ", fw, true) == 0)) {
> -		mutex_lock(&wm8994->fw_lock);
> +		guard(mutex)(&wm8994->fw_lock);
>   		wm8994->enh_eq = fw;
> -		mutex_unlock(&wm8994->fw_lock);
>   	}
>   }
>   
> @@ -876,9 +876,8 @@ static void wm8958_mbc_vss_loaded(const struct firmware *fw, void *context)
>   	struct wm8994_priv *wm8994 = snd_soc_component_get_drvdata(component);
>   
>   	if (fw && (wm8958_dsp2_fw(component, "MBC+VSS", fw, true) == 0)) {
> -		mutex_lock(&wm8994->fw_lock);
> +		guard(mutex)(&wm8994->fw_lock);
>   		wm8994->mbc_vss = fw;
> -		mutex_unlock(&wm8994->fw_lock);
>   	}
>   }
>   
> @@ -888,9 +887,8 @@ static void wm8958_mbc_loaded(const struct firmware *fw, void *context)
>   	struct wm8994_priv *wm8994 = snd_soc_component_get_drvdata(component);
>   
>   	if (fw && (wm8958_dsp2_fw(component, "MBC", fw, true) == 0)) {
> -		mutex_lock(&wm8994->fw_lock);
> +		guard(mutex)(&wm8994->fw_lock);
>   		wm8994->mbc = fw;
> -		mutex_unlock(&wm8994->fw_lock);
>   	}
>   }
>   

Reviewed-by: Richard Fitzgerald <rf@opensource.cirrus.com>
