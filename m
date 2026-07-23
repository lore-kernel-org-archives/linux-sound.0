Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 098D63EEAF9;
	Thu, 23 Jul 2026 09:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784800258; cv=fail; b=Qj2dymuUv0lvVAQ0OPh7UI/pNE8WQ/yI8xPbrFRe8GtfA+A/F9aXPKlFPXCDWoJa7wxdtqbKSonCAhKdgNTSLqtwPIPkL+s5n1giYvIuPU9Y8mfPDaygLX/SZFc+k7zefEfmx1dg1y2AsD9NlDePa4y+iEZ3xDHS9nHS7+V+dW4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784800258; c=relaxed/simple;
	bh=ckllb5zvhuh34DeOqnzbiCwnIYwWh1FPTKcLU/jHf+E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BKieZ5jeSaqrlVYaJhG+2uswm2fOIZMsZK3eEgSrXqJF5G+9YcOY4wDktL2jGhVXbeLtaDM3MtQbQyMI0Y/Wala3sB6tXGDgWmuf+ahs+lzOzKlU24yWcjXN97UChxGjvqBhNE5vSKjgPNJgzBGa/me8pz36bbhAiQw4enDMmEc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=RFklO3cf; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=wk+lhPSc; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="RFklO3cf";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="wk+lhPSc"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MIeEiX1315228;
	Thu, 23 Jul 2026 04:50:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=o+ckjz6IZ6xElMi+Qt4tY2EaBXuryjA/Qa+gyeBOm40=; b=
	RFklO3cfMjEcR9bEPn50hEGUd+8zpDTFn+RQgd1S149KoXU8ITbGIVsCm+67t58m
	n9OyMiyfVwByXP7O2pZZkLvxK5FaMAfWZ20Ghq7451T2zULOL++ICXZQsdQKIL+q
	fWRKH7KOOsE8FlOjqhRbLE9zFqmMHHYWxZMDoG8TmT0NgByZWQEFoQtlFOOOuUd+
	/aEhhSXUcRBWiVVSjvPKuqyZ0TBai5sZE1dCpYaeV/OEJIrh3bdLRGkT81809Xrl
	ZNzYovn8fhu9UJTwEh/9eEL1g8gGQgqBsUrISyhP0fjUcZAkxegE+5XuezFXKVyC
	vBetGbs/+OVQ0Q4D2+3bQA==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11022134.outbound.protection.outlook.com [40.107.209.134])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4fg6vyq3q6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 23 Jul 2026 04:50:19 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y1fSYAH1x7iDL8cE3DL6x6SWAxjJOAQijyvxLVSLQF6/LkozTfasH+b2+VGzNHyvFRW9TpzBBlh/HjPy8CE8hpplkw4MgYMU7Ls2GqZvxy8n7WSNCVP2igg98fY35bf8NKffjzBOG5ibTGrcZMK1n0pjsPbX+RpBGuVH1Rc0o/4ewyMgFCivDN8ew4Bxn5R0wj2uaLx2Zkf7B4r0wRJ6y8ORCIhB925ZKtgsVflN0qQQiMhN9fd0A2+7p4ndswbgGjbCWHS45brkFYc+vju9U6yesQCkyDdH6JPFW7G0HWrdQZs6uWtEVOm5JmjX2yZ2a3N3lbeaffASHmfAia1/kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o+ckjz6IZ6xElMi+Qt4tY2EaBXuryjA/Qa+gyeBOm40=;
 b=q0oiZ508pQlwgdAqSMUozvqEduk5XV+nLLTyiZcLIPQ9lLfNwkMRgITg0IMRE752gSRkgTNwGSVoByR2Afw/Z5yPKV4a5iX9kUOWmt8iy+kpA9vApw38w8vLhpke6BvQijYP7G2DTazgKw7Tf9/Hnt7mChURXMgMyBy72You5yykcsPL0xw65Nb7SdCWiN84WcpmPLYcotvw044NXPGyT+EhiOD7fMgEHtd2NtxTTB9rwbBlqYSQORPrTnpFrRLaVVlJ/zgSh4wGjp8AH+nvqfB/XiNbfUD2jtlsH3wtkG60oSBElLtnFtV1pvlhVbvrwfh6+bvykJgycCTp+TiftQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=analog.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o+ckjz6IZ6xElMi+Qt4tY2EaBXuryjA/Qa+gyeBOm40=;
 b=wk+lhPScnDF1uzkrquuDBNIoBg3fA+n0LlTnSQMMpzVPH6fhcISIWLvSCwavLxV7TcCyENDrWjye4Azu3uhMZWaW3XGfXkMOixCI0Tt2MDFJM/XxdkDKDS20vzS7NR8+abbzDHEAQ5BryKdB9tbK93j8dQWxg3cTZeIRuGVQMSk=
Received: from MN0PR02CA0011.namprd02.prod.outlook.com (2603:10b6:208:530::33)
 by SJ0PR19MB4640.namprd19.prod.outlook.com (2603:10b6:a03:282::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 09:50:16 +0000
Received: from BL02EPF0001A102.namprd05.prod.outlook.com
 (2603:10b6:208:530:cafe::43) by MN0PR02CA0011.outlook.office365.com
 (2603:10b6:208:530::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.11 via Frontend Transport; Thu,
 23 Jul 2026 09:50:15 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL02EPF0001A102.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.5
 via Frontend Transport; Thu, 23 Jul 2026 09:50:15 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id DA5F9406541;
	Thu, 23 Jul 2026 09:50:13 +0000 (UTC)
Received: from [198.90.208.11] (ediswws06.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id C1F8F82025A;
	Thu, 23 Jul 2026 09:50:13 +0000 (UTC)
Message-ID: <a594dbc2-7609-4d08-a226-3e58da20852b@opensource.cirrus.com>
Date: Thu, 23 Jul 2026 10:50:13 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/26] ASoC: codecs: wm2000: Use guard() for mutex locks
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
 <20260723045327.28260-18-phucduc.bui@gmail.com>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20260723045327.28260-18-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A102:EE_|SJ0PR19MB4640:EE_
X-MS-Office365-Filtering-Correlation-Id: 3929d48f-c785-407e-6e13-08dee89fcc0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|61400799027|7416014|23010399003|376014|4143699003|56012099006|11063799006|10067099003|22082099003|16102099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	gPOq6GkOSCQJssqWlSjNxbpw/3Ew8VrkNf2flrk9+S/uPjhHu7GonFXCLv++PCfIpjMcFQFpmNSgz1qMet3THoRB4rGc5WxmkHHvFQ6dS6j/GBy1vzqbfdc1dqovCSiGK1ajffecSiPrhDohTPlkY/Nl5KQMEsWEveYhNDjC2P2cKTcmTFyCXAof652KjgjN1Ke4TkOnw3dWdNrpi211OGznTLevOhlCgzQP1gIevvexgXUZL1sKgyNNzEAPTiL/pZieW4yjRYczyzcretm+at5CZXkhUfikMxfHp0XjKp2RNgOkjYzwPo64sUlaL6sh80qY/XVEtqqTjspbQm5RguRWu1vODSZi+0Oy14H92a36oC5nCiK1hmj9h0qBwlL0sCe8vgNfj+gFR5HNNe+o34kXcLKXWtASJpAk7KpcqSM2bIbxBgOTRVFeJJKUOxzj5+sDtjGPwgFXsZxCyf9o4STxNgyAE3Ki1bPBd/pYiEuPBVJZ+2Y9Y/F4S4efnEsl1qQTgJTpgIedKE7uaMrkRO457FqLicXeyQPegLYBIOCUh3CDoRssKlqcKIgwt2Tuqt4+xLVOsfU2zJ0ptr55ZU7WliKG3DReY4jKirPz2rKkEU1UxFp1uvTPZM2yzePab1xxT7qVgoQHT7u5zecwAObXIAwrLenbKupMfpmcqlMKAN5e/NIKg4jLAL7jdqOVmG/0Tnks7j60HDwkKi8VsQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(61400799027)(7416014)(23010399003)(376014)(4143699003)(56012099006)(11063799006)(10067099003)(22082099003)(16102099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	wAk/L6vqhsREQ7xIAPVmGrdxwqVjxpDEhRz31H5rNChRYl3bKWzbqeo285d0B1KIsANryU49gjfzkaNjYPQMiFRGJg6vuoTcjERYAewVtpKHreMYrGcJz0vX+urChDNL4mdTvyDEHWJA5jO4YsurSGiYv7hQZS40ORVgtBjvfu5Kow2Epf9yEuyUW8prTzPhGCqMYvXt1gReqejhcEPYf9p7IoItFJA9qjuDWoUoYYPkToNvyJyFo8gTIL5Bk3zRzBDleJiprJoE+9rjNqzKqrRp85zfeoYFUYME4Olc2ViE52pEyPpQyxmt7C/0amu7BfkfZR2fZWEGa9ftA2REPdHauuGUXNgXo5MbKqRiiAYXJSXW/KoWYzTYU17xqz2aIXgtwa/UxAQF/fWjp+te7Z1vFt0r/0kVuR27a6yuEUBKz0l+ek+N2hsgwQyVUl8t
X-Exchange-RoutingPolicyChecked:
	jz+bl64OewPz0AyTPTCM2VQJyevUq/3yk2GPTA4tKRCsH9bmkphT5ySa/VkjdQ3+8Wep1HLbU+Ewb/nCjUUq2Suo9Cxb9bZvKZHL4fJf5bOBS3zH8KsbHpC+cYeA57Gh0VhwtWRcU/+6d4o9nciqDGsd2jP9dQHA8un/Ui+JlE8i86aRXKMGYXxgzdQfCdpK/5yefkZ080nB5vf1ZcpfRlWIxfvY0iIjwuXN5v9jntGTFEHgdxSMg1EH04Yd5w3CWfHrhaunSRI5Ri2JufJ8Qgj61pAhlK8TgfrtrH/jJF6fza/1iq+rcmjnBEvTXm0ML6MotEYdtmgawz4lXE8Bng==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 09:50:15.2041
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3929d48f-c785-407e-6e13-08dee89fcc0e
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL02EPF0001A102.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR19MB4640
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDA5NiBTYWx0ZWRfXzPogk37H4jED
 gA6/q6OegdZqyAt1skz9IY8DWTs80xedgx+k2P0dbigv5bzvP8mbrHK7k0dIrpsH5SXbidpqUZb
 ClbvazMRqjeBgAXQ9ka/xe7GJqaEd8g=
X-Authority-Analysis: v=2.4 cv=f5l4wuyM c=1 sm=1 tr=0 ts=6a61e3db cx=c_pps
 a=RSKkSjVyZ2Ta+HBtYZh2RQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=pGLkceISAAAA:8 a=w1d2syhTAAAA:8 a=oz3nwUUBMwimQrgN-I4A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDA5NiBTYWx0ZWRfXw2+bA/kSUZU1
 PxwDSvtLKTpDVa/iMp4v6FcuUG/OO4cIw3/gqZgOCghpjSgPW2hoaBhtbUFslpbWCeoWaxExByc
 kF1EZQ+0l7NAo2kqh3wddUKKvb7PzKVZmdTMWA4wgGgLl5D3UOGZIEm92BVx3cBs/A1tp5Z2lPL
 frQbymyrL/FkVj3TgLLaxBTzNUt9HSdqiMKVKoRBByI5HCcvNPHcHTsoocW7lovC4dCpy7VzfgZ
 ASQoZJop0izXzMB1VGceA6SbtfuQI6irVcFmWCzh/Ib+pwO0mQVHxfDOiQtz7B8o2dA6IEJPWB8
 Gjj8NPhNmlYN4RLSfpeeTElG9wbaC68ct1cHn7+L/McOe0qFQS2GomiINyGOFe5blK01TFomFTB
 r3xWZ7xohGZmGQM4RlCYuP9J7uoafukQ/5CpNHW36BE0ajtwEx0DfDcLMyBN5jHf7wAN7VZZqsa
 4MYza3RdWGfq6EjPijg==
X-Proofpoint-ORIG-GUID: 4htwxbIrewFESr776Vha67d6qH91ANPf
X-Proofpoint-GUID: 4htwxbIrewFESr776Vha67d6qH91ANPf
X-Proofpoint-Spam-Reason: safe

On 23/07/2026 5:53 am, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Clean up the code using guard() for mutex locks.
> Merely code refactoring, and no behavior change.
> 
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---
>   sound/soc/codecs/wm2000.c | 28 +++++++---------------------
>   1 file changed, 7 insertions(+), 21 deletions(-)
> 
> diff --git a/sound/soc/codecs/wm2000.c b/sound/soc/codecs/wm2000.c
> index 9b68ee69324b..897b0acac5f3 100644
> --- a/sound/soc/codecs/wm2000.c
> +++ b/sound/soc/codecs/wm2000.c
> @@ -23,6 +23,7 @@
>   #include <linux/kernel.h>
>   #include <linux/init.h>
>   #include <linux/firmware.h>
> +#include <linux/cleanup.h>
>   #include <linux/clk.h>
>   #include <linux/delay.h>
>   #include <linux/pm.h>
> @@ -612,20 +613,15 @@ static int wm2000_anc_mode_put(struct snd_kcontrol *kcontrol,
>   	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
>   	struct wm2000_priv *wm2000 = dev_get_drvdata(component->dev);
>   	unsigned int anc_active = ucontrol->value.integer.value[0];
> -	int ret;
>   
>   	if (anc_active > 1)
>   		return -EINVAL;
>   
> -	mutex_lock(&wm2000->lock);
> +	guard(mutex)(&wm2000->lock);
>   
>   	wm2000->anc_active = anc_active;
>   
> -	ret = wm2000_anc_set_mode(wm2000);
> -
> -	mutex_unlock(&wm2000->lock);
> -
> -	return ret;
> +	return wm2000_anc_set_mode(wm2000);
>   }
>   
>   static int wm2000_speaker_get(struct snd_kcontrol *kcontrol,
> @@ -645,20 +641,15 @@ static int wm2000_speaker_put(struct snd_kcontrol *kcontrol,
>   	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
>   	struct wm2000_priv *wm2000 = dev_get_drvdata(component->dev);
>   	unsigned int val = ucontrol->value.integer.value[0];
> -	int ret;
>   
>   	if (val > 1)
>   		return -EINVAL;
>   
> -	mutex_lock(&wm2000->lock);
> +	guard(mutex)(&wm2000->lock);
>   
>   	wm2000->spk_ena = val;
>   
> -	ret = wm2000_anc_set_mode(wm2000);
> -
> -	mutex_unlock(&wm2000->lock);
> -
> -	return ret;
> +	return wm2000_anc_set_mode(wm2000);
>   }
>   
>   static const struct snd_kcontrol_new wm2000_controls[] = {
> @@ -676,9 +667,8 @@ static int wm2000_anc_power_event(struct snd_soc_dapm_widget *w,
>   {
>   	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
>   	struct wm2000_priv *wm2000 = dev_get_drvdata(component->dev);
> -	int ret;
>   
> -	mutex_lock(&wm2000->lock);
> +	guard(mutex)(&wm2000->lock);
>   
>   	if (SND_SOC_DAPM_EVENT_ON(event))
>   		wm2000->anc_eng_ena = 1;
> @@ -686,11 +676,7 @@ static int wm2000_anc_power_event(struct snd_soc_dapm_widget *w,
>   	if (SND_SOC_DAPM_EVENT_OFF(event))
>   		wm2000->anc_eng_ena = 0;
>   
> -	ret = wm2000_anc_set_mode(wm2000);
> -
> -	mutex_unlock(&wm2000->lock);
> -
> -	return ret;
> +	return wm2000_anc_set_mode(wm2000);
>   }
>   
>   static const struct snd_soc_dapm_widget wm2000_dapm_widgets[] = {

Reviewed-by: Richard Fitzgerald <rf@opensource.cirrus.com>
