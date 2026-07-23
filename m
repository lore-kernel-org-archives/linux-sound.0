Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C8D2E2DF2;
	Thu, 23 Jul 2026 09:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784799807; cv=fail; b=YIOwYAXDm5gN8PPhFI+TKti/BZiEhEDfVzRUdVKiAQyyKiYk//WpBQyrwt9snCo8LHowgAQcUxwjVm95wVHu/lxqS/RMeKRsM8m2wqL8+nphsnMHYJDuWY9HvkTn9kdI5DfsHFX7ovfUH1XvRCnqyqj0oXSP5+KxDf8QQc8ohyc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784799807; c=relaxed/simple;
	bh=yEZvZZ2HQY3PcXKmM7Kbc0jg3rgZHG/S7VRml9adAH8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AuCb+bUuJImnFWpzoCoPMIk0i7B+HuK1TPnIChWT60FPbEjW/2zk/KH/WA8x5tzFisYY56v8VtSXWx/ZDyw1SO6IcWU8I7ZqLgjIrnOekKKRDA7JQiOh6e3FZli08+jc3DQ+u4BX7SDMUe2ChIawEkO+4bVdFkSLAEmWRAxhMrg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=B/5nuIBT; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=tB4U0Ask; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="B/5nuIBT";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="tB4U0Ask"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MIeM103530724;
	Thu, 23 Jul 2026 04:42:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=QxDGv8e660CP6uBIgI1THatL34Sfm5R543bfX2U3tQo=; b=
	B/5nuIBTZ4To4HnB67q6D/cfZTKnavmUkW5PugH++fK5qxtF+T9+6Tx1VpVGHhvc
	AtunucfJBv77thfdUb7T6ZULBZcUv586RpPehQWrTYe9nbxazfFFhgpWhZ0Wj3It
	jXyxsDQ2Ke9r7mTXDsd/+dCR0J3SBEWq/WR8VtdJgyDLdvvG0nAxUR1l3r1ZMg/r
	2p6akWHuNeo/HmDo8mtjoV1rdxJ43AoQtDBv7ZzyNtnWbCAg05x8wViHRe70wkxf
	StGVMSMwRRS9kaatNJZa9KXkvf2K5isblyqZ60TIR+dO3L6kzOt1FKPGr+8RlK5g
	YOyHwE9OCyu9U+JxbQCF0g==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11022082.outbound.protection.outlook.com [40.107.209.82])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4fg5wff4tt-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 23 Jul 2026 04:42:43 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uYAJpsCdmOJUdVV8wowu1l0XIcZIr8bkBL8DR5aw9NIe1jPZYqjYx1RaVIx9Sjtzwt9YKRTjCH1KI1nuZ3pOcvDI5aghLfhD2kZo5FbAlr//K0ErhSK/MGesH6KbyBYcMAeY1YqBUCq/hdnEtvlHxm4s+eFKJxrHPlcTcppSoht7CaTgU2IyAq+DfWpZSP7nJe/1l488OQwQEzUo35ibtBllp3gUC32zXXc5TGIceXb41Zm4OBW1Sw9QjBJfUjhdhOjzXoap6V4XmMFWnQ1z7DK2epKjcVwCFEyLhllBeifqDSdj4bDJmuXv/hHvmCpmfS681tETgBaw/Jxz7Lnxvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QxDGv8e660CP6uBIgI1THatL34Sfm5R543bfX2U3tQo=;
 b=UV65SLVZI/zRCdTI3wFy0ZlJvVrMyPA1u2PjjO/Rul5aiBWuWJf4uGiRUu1LtapXVE9MXpWVTUKpzd1L7npTBQf2Sud6UQsTeOEBKw5Zx6K47ZKNS1k2CA3D2HsApdpWZvjH202+MafuZIQMhg/ILC514ALRUu/FkAbK3wmDfqxEVsUcANKBlO9E2ve1q5DaP3nEHWeT5ZjH8dd/5POY+B0ZHsdOlxXj+ER8oeH1BZHnvGj0Cv/eXV+XC5/qiWGKFBChOLkD7upSBW3RmBB99T5rE2HQ3jikfbC5/3Car6r4fAfaVRipnkQWwTLAtzB26CPCVx7WHUdLdFqi0LVcYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=analog.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QxDGv8e660CP6uBIgI1THatL34Sfm5R543bfX2U3tQo=;
 b=tB4U0AskzJrlJKG83L3OtgmfG14g8EyWk9r8coxMlgsBJT4bPcgmmIuvlMzkp5L50VII/E0JGETgDjPvklbnJlXhPNVAbavgHDl9Uz/xd2fQVVbcpKxH4fOPGU/Oq3v9wPPbmYjy+5qNYBDNmL5TH21Ac9mdbogn0WKD+R+fUp4=
Received: from CH2PR10CA0030.namprd10.prod.outlook.com (2603:10b6:610:4c::40)
 by PH5PR19MB997199.namprd19.prod.outlook.com (2603:10b6:510:34d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.14; Thu, 23 Jul
 2026 09:42:40 +0000
Received: from CH1PEPF0000AD80.namprd04.prod.outlook.com
 (2603:10b6:610:4c:cafe::4f) by CH2PR10CA0030.outlook.office365.com
 (2603:10b6:610:4c::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Thu,
 23 Jul 2026 09:42:39 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH1PEPF0000AD80.mail.protection.outlook.com (10.167.244.90) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.5
 via Frontend Transport; Thu, 23 Jul 2026 09:42:39 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 50CA6406542;
	Thu, 23 Jul 2026 09:42:38 +0000 (UTC)
Received: from [198.90.208.11] (ediswws06.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 33E4A82025A;
	Thu, 23 Jul 2026 09:42:38 +0000 (UTC)
Message-ID: <3eb2eaee-85dd-4dc2-8c6f-397cfedd6946@opensource.cirrus.com>
Date: Thu, 23 Jul 2026 10:42:37 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 25/26] ASoC: codecs: wm_adsp: Use guard() for mutex locks
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
 <20260723045327.28260-26-phucduc.bui@gmail.com>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20260723045327.28260-26-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD80:EE_|PH5PR19MB997199:EE_
X-MS-Office365-Filtering-Correlation-Id: b556567d-3b5b-4456-74e2-08dee89ebc4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|23010399003|376014|36860700016|82310400026|7416014|3023799007|16102099003|11063799006|56012099006|22082099003|18002099003|10067099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	xXqQ6zTtenWjIXkIKSuepIpi66rq0qXfSBUg2f15KhevFbxq8yndU60bAaMFYJvY8w3oht/ph+7bH/iX3EGXacvPgsX/Vcax1OX0Ub+wmjdeOIP4gwpWI5VsKp8wR8JhCpR5VO1mf5C+WB45dsBRMwSVl3PYUzsrYgrUkHjG/FLT4McQ+58uQIBr5HCDjhYH6y8znPtc+li6xsJaxHyl8q/3KzxnMZMEKnlr7zVRuvGoXO0JmdszmZus+LgMuXPZQSuqzoBmK3zES0/7A137eX1ZIFwYLvV/QV++6HS8RLVCj10xb5szqNoitCd4vHi+gWl0WblBL3lQE/KYJGHX0fLQUljex3i12yYddrzwsvdtjg012iAXMa6SD2HppwFUyHNI4Tz+saX4MtpRpiRPRrcJb8BYb2TqBGC2k6P/LlVJ8Nz4mOiJryNzPjNguz6XR1DgdKGdUmTkTZgvpO9Xz/nIeBXfsUJB44KihEojh81CT7tl1mgO00f6WvojKOgG6mT+5smepYAzlz17oKr/jWsTsk884Q38Tee26e3XJA1bZKN5VPQeLJguzZWs3mF4jAjd89J+EX9L1QldStMXIe46fPkFdKxehto9h10yS5oFEqM6+C8h8vztSl8MdI5pma/ANR0z0NG9ajlBxzDGwNlmVLL0De6zNS+uaka8BQHkQ65/+x6F7iNyt8gKR9elr0WuPnPvl1r15C8dXJEb8A==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(23010399003)(376014)(36860700016)(82310400026)(7416014)(3023799007)(16102099003)(11063799006)(56012099006)(22082099003)(18002099003)(10067099003)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	pFgOETAV82jAijmSnvXBOGgxenSJI7fJ7SmipsLMsDt1N0wcHHS6PnVcDAeDoWFHvD8F6Q8p1ErfFYJpzfK/oQnBVjc5WLTZljcHn6XpRaaiV0L0kP3eZt92XxFpaGIjcXD5Y6vcby15oFbcjDdokCtZc9vTXVrLx0dc1lHhH2xnJApLedyxcX8kGKLjr2KtJmvH/kqk0rdtEngw/cg536X1G6K9moUgrAKAE1hjIwSmOd0yJpD9X9jTJTDfIA3F3Kjxl7crnu0Thubj7VCE+NZjJqERu1ub+VmWMbNsNwVu2b+Ug3VgOWv6VqP2vDmVMHJuWZqbf7GMbYQt/0txTxEXfownguk6zzDH+lsHyrmk77W7QYWJIVW/j/tNKiGHvHwOZ9s0ntaZ2K/pjrxuHjC2nS3xz7L2d1FJRGPCr8Ufel/i6sDiL82ABnd91vUp
X-Exchange-RoutingPolicyChecked:
	U3MYbJsqsLycQIV/E2lTUeg8B2E/h4tdW9BYCJxpdYgmogW91ZLpBKXtZjVgTZXHAbgiaFHwkxjQSb7/MFPx0aCaLnHZrebWjOhOBt722R76d+E4c3qWOX4uYHzXe+lT4U39XaFHFkx4BaO9SH51CF1YxSG96jeKVc0JabDL6ZIREJ2rcpNPbA5j9TAB2LHSh+y0u7AnZVKJnoD2LL4ulNhwLJROVrccumQLE0W4ApiT5ofaDQS7eqoBSe4tow79Y5PBixWsYl2H+JSgsJMY3EMHhQu4nfqfmRx+ya7APcYedEXSQaG5WDAEnQuWwUQjOKfGuyi/GaTYry3Nbg7Icg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 09:42:39.2340
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b556567d-3b5b-4456-74e2-08dee89ebc4a
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH1PEPF0000AD80.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH5PR19MB997199
X-Proofpoint-ORIG-GUID: sZo4uWpsz1X-4n8-6FIxjOKJYXqyVcvC
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDA5NSBTYWx0ZWRfXyk2G9fxbID+J
 qaKBpdhHy4yauoemMzPDnF/otoSQGrnvkxngGF+GKTi6+8X7/4bzoBvJccH3/mGjC3SJKXe3xH3
 y4D99kfJuXa0E+1+7ANhfOPrBOY0gVI=
X-Proofpoint-GUID: sZo4uWpsz1X-4n8-6FIxjOKJYXqyVcvC
X-Authority-Analysis: v=2.4 cv=BdjoFLt2 c=1 sm=1 tr=0 ts=6a61e213 cx=c_pps
 a=yElQ4muSOuhJtI3odKz4wQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=pGLkceISAAAA:8 a=oz3nwUUBMwimQrgN-I4A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDA5NSBTYWx0ZWRfXyrNBiAQQ+ISL
 LZmIMBUQKu3zyRIzzQCAzta8Xm2d1mkYCcz2Gw/n2BHYZoH5VilutmZ6Ih6ig4ocKKowhII0naq
 4ZIAQtFv29vSzpHjXH2aTQjS4oXprVyqUlJa1RkSxrg3QGAakKPtBNVUtqspUgfwRq505LdrY/6
 AFv/Q1bscEcthSTuwi9Lo8ogu1NmuhvFJmakCP8RSwDZ4vyP1LAyNCdSSPho9dI7i0jg8v7GDOR
 BHNvh2gKYs+z+egUE0qeC7Ulb0z80T3heX0278Ckd+Vv5h5mBVdW+6Zf0J8GF8IfWod2vmcuw33
 Kss4Y6MqLhJvqVDpLXxQifqsielVaNCJXMEciFuDQ1Zij9sDTqbskDav7jnG4JuulXG2l17SZr8
 gSEp5Tgn25rVRdCebOLRs9VddjLSwIkJd1OmhUJttf/GkGNRTgJ1qeskMX8pCbA7ih+hHrX1sZx
 iXQk2RvclKJ9rVwAF9g==
X-Proofpoint-Spam-Reason: safe

On 23/07/2026 5:53 am, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Clean up the code using guard() for mutex locks.
> Merely code refactoring, and no behavior change.
> 
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---
>   sound/soc/codecs/wm_adsp.c | 77 +++++++++++---------------------------
>   1 file changed, 22 insertions(+), 55 deletions(-)
> 
> diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
> index baa75e7ff53b..cef8472dda8c 100644
> --- a/sound/soc/codecs/wm_adsp.c
> +++ b/sound/soc/codecs/wm_adsp.c
> @@ -348,7 +348,6 @@ int wm_adsp_fw_put(struct snd_kcontrol *kcontrol,
>   	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
>   	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
>   	struct wm_adsp *dsp = snd_soc_component_get_drvdata(component);
> -	int ret = 1;
>   
>   	if (ucontrol->value.enumerated.item[0] == dsp[e->shift_l].fw)
>   		return 0;
> @@ -356,16 +355,14 @@ int wm_adsp_fw_put(struct snd_kcontrol *kcontrol,
>   	if (ucontrol->value.enumerated.item[0] >= WM_ADSP_NUM_FW)
>   		return -EINVAL;
>   
> -	mutex_lock(&dsp[e->shift_l].cs_dsp.pwr_lock);
> +	guard(mutex)(&dsp[e->shift_l].cs_dsp.pwr_lock);
>   
>   	if (dsp[e->shift_l].cs_dsp.booted || !list_empty(&dsp[e->shift_l].compr_list))
> -		ret = -EBUSY;
> +		return -EBUSY;
>   	else
>   		dsp[e->shift_l].fw = ucontrol->value.enumerated.item[0];
>   
> -	mutex_unlock(&dsp[e->shift_l].cs_dsp.pwr_lock);
> -
> -	return ret;
> +	return 1;
>   }
>   EXPORT_SYMBOL_GPL(wm_adsp_fw_put);
>   
> @@ -450,15 +447,11 @@ static int wm_coeff_put_acked(struct snd_kcontrol *kctl,
>   	if (val == 0)
>   		return 0;	/* 0 means no event */
>   
> -	mutex_lock(&cs_ctl->dsp->pwr_lock);
> -
>   	if (cs_ctl->enabled)
>   		ret = cs_dsp_coeff_write_acked_control(cs_ctl, val);
>   	else
>   		ret = -EPERM;
>   
> -	mutex_unlock(&cs_ctl->dsp->pwr_lock);
> -
>   	if (ret < 0)
>   		return ret;

This has removed the mutex lock but hasn't replaced it with a
guard(mutex).

