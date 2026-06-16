Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 771B947799F;
	Tue, 16 Jun 2026 16:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781627526; cv=fail; b=V7Kl7Yt2R4jwHrDj7YmR7z78psQ6WE1lHEtyt3tRF9ry97xckQfTEH2cCH+ZxBLb8SDC3AO/fBsXkbD8PcCRIUIEx3DjdMAvC3vDPq3iB/L2ZdN/VkpirnhiYQiCdKfZZwBJhFsWJ/H0cJWg8TanmqGUeYa2E3zIuLD8XsinWMs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781627526; c=relaxed/simple;
	bh=4pFvlS2eLQAKGEuxXrLU7hAr3w0n1JaFAQrF4phX4kA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tZv9RCLWIp/lyYGvS860h+Ae0bE/WZYSbSCqx4sl2K4Hn5KKYmq9qpSkGztZn5Xp06cb32B7SaO2tBBJTbp0I6lOhUA1jwSuNsAVg6ETBJ86Hgb/OYuXCsBw5QcUkWeRV5jV+ziaX5NaWbysd0HXOgXMPLWZBHsS85ow98Dek6M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=XLSzAPt3; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=m6BsJqCR; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="XLSzAPt3";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="m6BsJqCR"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GFqXPU750974;
	Tue, 16 Jun 2026 11:31:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=O2ZZO1awEbiOv20Lh3rKJnu3UFgRh2SZRVTMfbFLCz4=; b=
	XLSzAPt3ky6+zMCkRosx7JuvfLoOQPZz+qjupq9vSTUnbn+DjxvienjoCKZj1W6j
	iYHhfXXT0kstQd+aHkaU7i77Nx9u/YAYHhd1bA5kQ7rOaKD6omjaWzPH08vwME/7
	rlKoDC0Mp4MDTeni5LghVMGfQXJNmNJlwrk0EHQ7wF79uTjhdC3m1Z2QLjOrAC0s
	RJnfkfGNJUmpMp+sS+Y8mhlWyMbG91lnbPxdbAEQHlT1Sx070b7yNi4oN3NeJQgi
	zf3NlvK/8pfS3S6CFc7RUW11K1PWb4mdLnZBOUQSH08AGG9Kghpd3gXqZzGshynp
	JLJ8oVrxDDlOwaL5D2lzKw==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11020124.outbound.protection.outlook.com [52.101.85.124])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4eu2wc0qs5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 16 Jun 2026 11:31:38 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bh8H0yR1q5ooJgXDCcpqCQ006zuB4ATSY99YUIQJS+n90BbHFvI3cR/YvJix2AksSdor0yfrSMTs0aV4ZPhNRC18TYI99Fxl1w8FiSYzkUDZDKTfUBuzgOo5UjNKhCRqwEHDWOnoWo2+ua9ctkFNqSHxE92+zQT5BBdE0hYDBXd6Nle/brraSrtjlhazbZ2KEjlHSZ1G0SwRzbJwzbTs20U7MHbOrs0dSEG1pGNqT14haHrDh+dWMQA1LglaIq6rKGzhJcVpeDnH4pF9ZJkTMwJ550P++bE0vdTnerLANoK/aoBoKA44V4VGht455wzrQRed/uEOV7oGlq8prX/2iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O2ZZO1awEbiOv20Lh3rKJnu3UFgRh2SZRVTMfbFLCz4=;
 b=LRXh9mLfbrv1YlL/FyWDo4HNbvovocYfPb2tOm88MfVdbv70PZnX2oKcKYXo/zuMmCs2enuFycbYZKy7xSHMm1QKMSx0eODJaLz44ejMCuWP+t7A/Iy1c6rQA0LaIhpCKRoH2CfJaILvnbGEBk6GcXFsxBoh9DU2wRNxbKYguo0hQhafVjyNcHd3g+slT20kXkOWXjxyFrnE8Wj4zeGZq54DCMKGtgzdI1EmUX1LhJPXnQmqkSeP/7ebI+vlwqTmi8Fq1+kM0GhP2hxzfsi4QYqGgqVGf4PrGfsrbQg4lQ07q6ujyqJyWKbvU1IikQ+aYNH+1p/53NiytzlIM6nI+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O2ZZO1awEbiOv20Lh3rKJnu3UFgRh2SZRVTMfbFLCz4=;
 b=m6BsJqCRmtzqL+mUReHMeaa4RPmsaaacH+rHZPmZpZ+q8D6oicLKiRS1xLxKvrDcQblG5+ulrQ/QMVI6ttQkuKPT3vy53IEIOwyz+8q55VDnx/TZIq6sduWQfwftlpjjqsEmBY+HAJnVmCVqk8t++yH2b71KMXCxPt87DNa8aEM=
Received: from DM6PR21CA0006.namprd21.prod.outlook.com (2603:10b6:5:174::16)
 by CH0PR19MB5314.namprd19.prod.outlook.com (2603:10b6:610:f8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 16:31:33 +0000
Received: from DS1PEPF00017096.namprd05.prod.outlook.com
 (2603:10b6:5:174:cafe::ae) by DM6PR21CA0006.outlook.office365.com
 (2603:10b6:5:174::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.2 via Frontend Transport; Tue, 16
 Jun 2026 16:31:33 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS1PEPF00017096.mail.protection.outlook.com (10.167.18.100) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.8
 via Frontend Transport; Tue, 16 Jun 2026 16:31:33 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 8C9B0406544;
	Tue, 16 Jun 2026 16:31:31 +0000 (UTC)
Received: from [198.61.68.151] (LONNCK4V044.ad.cirrus.com [198.61.68.151])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 3AAD982024A;
	Tue, 16 Jun 2026 16:31:31 +0000 (UTC)
Message-ID: <adcf487e-a6c1-4439-b986-c421e206d6fe@opensource.cirrus.com>
Date: Tue, 16 Jun 2026 17:31:30 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: cs35l41: Restore register state after system sleep
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: kernel@collabora.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com, linux-kernel@vger.kernel.org
References: <20260615-cs35l41-s4-support-v1-1-f5a21e35dd9e@collabora.com>
Content-Language: en-US
From: Stefan Binding <sbinding@opensource.cirrus.com>
In-Reply-To: <20260615-cs35l41-s4-support-v1-1-f5a21e35dd9e@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017096:EE_|CH0PR19MB5314:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d89b6c2-58b4-4bee-07f5-08decbc4ba54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|61400799027|82310400026|36860700016|56012099006|11063799006|16102099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	eSCJCu1VP7h9pzB5yyZGt7maGIh+4dKtdKnB+SzHh/oCJaNUl3St4gDp5aRHoowhI0GP5VQoXlji06d8qGV1tpf38ZFzKkdBp41eGH++JK2TQtX+5hh3sJqbZlzFPg2nPviYae3o3nZVImO2FJb6l62Au1zQQ7iX9TQuH92TTRFXykmkPUJq0NyjDkLl0BO7DhL/CTr7n3qE08J+e6OhWdskNEwPQrjj1oTPwqr9xvnT3TKg9xuURLChiSbmAaSp9Fc+0tncaK/ssPYHc5gepvHyIGDr1FV3ahPvvXEiP1gEIEcBspcT+c/39Wvh71fe4Rp3ZXe6jBh5Rpv1cOZDGoBIVZcmDd45ReF5ZkXjvmTBR8u/1ApWIIqHuWCB/BuXwDzTNk7lrh0DaiCioEucjESQ1f3jU2Xy5igMmxZi4z06wEDkBh6571DV7rl9gpnZ40Y7cFoJuPMqbBqURvxIeCH/Kc38JeJzzGOUFIgYlUJ6IGr/hHj7y+3PFTrN8mUgAQs3pZ14iXGTKAXn9l1Qe4eln8PCdgJAVnEPn2VWIqYFnxXBWe7/ijeyjF51fiLnZLucxxnAnn7kMK/OlNmkWU8/741wwnIiGKsart7AHTd0BH6bBUEK+zvQXpC0eK4jN8ywtywxHDEuzLo+HL08/r2tJcUmydywLpP48T8ulXptNZFL83AfMC123k36f1Z+Kd2zdF/md5QwWadxkEPvAz1duMAiISMXYDY1gFQX+YI=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(61400799027)(82310400026)(36860700016)(56012099006)(11063799006)(16102099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	wzZ5fuxXrku/cfeadIVFOdiK3lb+EK8BMzp+xweEYT8TiJ4B1oiuriRoJa5UeZ6v2+W0xOa5TQK+ds/7p903zALpCbCjs9rTOsR1xjF7EgRo6FoV2qcJTYT1MlYd+P5kSDC0HURd0VygEhqQfdLv61/L9WcaxR8cWEfruriVB1LmDznDetr+oP5sfMG9nTMBaNFPTF/Jvyu6hVIcnhUTf/6kGtCiY6f8YULxiwg0B79MaRl9xXbvc/V38MX7qGfx6kCsHR1EEiKaGnVfnpFwn04NISt17z11SxjF7T6Q1tUyudlQaOgPGMVq9wIKGG8x1wn6HTah7k+3jHElEs/LN1ipUPHZbRMKLHGJZG9z8z+4FmyGC0drscof67Hp3Wo7RhLWHVy6EPPOenVvFTajGFoF1O0aJRHQxIU6pypzw/tRQyO8WWl7sqW/3moYNG2S
X-Exchange-RoutingPolicyChecked:
	cfDlTMDvpgG8m9o3TU9fnOEQiVx+Fdm7/dWYtHnH0Ag/XIkXbZpqx39/kqDOUaJgAjN3LW7IW5VmIqqq5q6BwnGVgtHm/DFMUg2Jz3ikjobyU89cU0CNgUE3/FgIJK1jneb997qY53KKQCn4ePfa1agawcvlHDmrnhIZmNDy04+I+VKEnO2ejuT0u9EWv+JaGWxoccxq4jwM7SVbFU9rAl4KauclkYmnVHtQVxujV3RjvcBwuRfXlAnXP2ogSpXBhU1BdtsnInAlkR4/8WFoK+RFlcr+nD6W5osLFKOWn1XIY3+eF0uB53zZzd5mjhWuCj3zNTKvOR3Za/WjhrU7gg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 16:31:33.0514
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d89b6c2-58b4-4bee-07f5-08decbc4ba54
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS1PEPF00017096.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR19MB5314
X-Authority-Analysis: v=2.4 cv=Xa25Co55 c=1 sm=1 tr=0 ts=6a317a6a cx=c_pps
 a=EXmEQszPLboQ/+r5oOSQfg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=QX4gbG5DAAAA:8 a=TFXt_xE3qvQAtSaSGjMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-ORIG-GUID: cayIbV27H-oenfZRhxum_e1cgqOgiZeq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDE2OSBTYWx0ZWRfXwwleOD8ylV3L
 bHtCON4S374smNGrl39eZXL6QjtlkQvJSp/i+r8Y22GjPn66GMWKo1OnBg2MrggTkBXrIIU6s+b
 Wdl4GsbpmlT8keTH6hTkKEc54J2sRBaOQeMQHtGyMsjNe0pwW/1N8AaURHZLqVkVEE0Y0OZeoNh
 r/tT6t11ALgchMfTnROKgkl1ITSJPEqOdWNfsJeSd6iKBV3hZ3vDTlr3btiUmdQI4dWjOSr2tlm
 +0R5YRWd0t1eFIgQyr+YREcuEgQ+OY+YH52qc+DgYjRijHPwArp9HqbLp1RuywIc9R/7aEDnOQp
 S/tFkPL4EG3DVPn3hemJsZWuGIMlx64IOhNRxallFjQhodGl+8zKKmxz9fXnCKH20zKIl9m8Ltr
 iD2A1c/fL2bv+ETT5NzQbp4zpLsAZc0LDE5wKDHF3ZVNOAii9YoAXpR0+1VT8yTh6+okWXcyeKF
 DBE78QXB2TxfmF/wG1Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDE2OSBTYWx0ZWRfX3J3NMdCgKJum
 gvvy80YibssZZbyACqZGRCAguqAdWS4q2tJdNX/mpEQeOPs+KTBYPdq7kDNAOd1DUtaH2txxtpE
 Dmje25ZDa2yEvLMV4ZRDiTI7ZR4z2WE=
X-Proofpoint-GUID: cayIbV27H-oenfZRhxum_e1cgqOgiZeq
X-Proofpoint-Spam-Reason: safe

Hi,

I have some concerns about this patch.

This driver is used for more than just the Steam Deck, so we would need to ensure that this patch doesn't break those systems.
There are some potential complexities around cs35l41 with respect to Boost and DSP enablement that need careful thought when supporting system sleep.

The HDA equivalent driver for cs35l41 does have support for system sleep, but this driver works very differently.

I recommend reaching out to David Rhodes <david.rhodes@cirrus.com> for more information on the ASoC driver for CS35L41.
Please also cc patches@opensource.cirrus.com.

Thanks,

Stefan

On 15/06/2026 15:54, Nícolas F. R. A. Prado wrote:
> Currently, on the Steam Deck LCD when the system goes into hibernation
> and resumes back, the speakers are silent when playing with:
>
>   aplay -D plughw:acp5x,1 /usr/share/sounds/alsa/Front_Left.wav
>
> A crude workaround was to, after resuming the system, bypassing the
> regmap cache on the cs35l41 devices, before playing:
>
>   echo 1 > /sys/kernel/debug/regmap/spi-VLV1776\:00/cache_bypass
>   echo 1 > /sys/kernel/debug/regmap/spi-VLV1776\:01/cache_bypass
>
> That indicated that the hardware registers had gone out of sync with
> the regmap cache due to the power down in system hibernation.
>
> Fix the issue by, before system sleep, marking the regcache as cache
> only, and after system sleep, resetting the hardware and restoring the
> hardware registers from the regcache.
>
> This gets the sound working on the Steam Deck LCD after resume from S4.
>
> While the issue was only observed on S4 on this platform, the callbacks
> for suspend/resume are also set in the same way to account for platforms
> that might power down the chip on S3 as well.
>
> Note that this change does not take care of restoring the DSP state,
> since the affected platform does not use the DSP and it couldn't be
> tested, so it is only shut down on resume so it can be reinitialized in
> a future DSP preload event.
>
> Assisted-by: Copilot:claude-sonnet-4.6
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> ---
>  sound/soc/codecs/cs35l41.c | 127 ++++++++++++++++++++++++++++++++++++---------
>  1 file changed, 102 insertions(+), 25 deletions(-)
>
> diff --git a/sound/soc/codecs/cs35l41.c b/sound/soc/codecs/cs35l41.c
> index b2a076706c79..231341a7eb44 100644
> --- a/sound/soc/codecs/cs35l41.c
> +++ b/sound/soc/codecs/cs35l41.c
> @@ -1199,9 +1199,41 @@ static int cs35l41_get_system_name(struct cs35l41_private *cs35l41)
>  	return ret;
>  }
>  
> +static int cs35l41_boot(struct cs35l41_private *cs35l41)
> +{
> +	u32 int_status;
> +	int ret;
> +
> +	if (cs35l41->reset_gpio) {
> +		/* satisfy minimum reset pulse width spec */
> +		gpiod_set_value_cansleep(cs35l41->reset_gpio, 0);
> +		usleep_range(2000, 2100);
> +		gpiod_set_value_cansleep(cs35l41->reset_gpio, 1);
> +	}
> +
> +	usleep_range(2000, 2100);
> +
> +	ret = regmap_read_poll_timeout(cs35l41->regmap, CS35L41_IRQ1_STATUS4,
> +				       int_status, int_status & CS35L41_OTP_BOOT_DONE,
> +				       1000, 100000);
> +	if (ret) {
> +		dev_err_probe(cs35l41->dev, ret,
> +			      "Failed waiting for OTP_BOOT_DONE\n");
> +		return ret;
> +	}
> +
> +	regmap_read(cs35l41->regmap, CS35L41_IRQ1_STATUS3, &int_status);
> +	if (int_status & CS35L41_OTP_BOOT_ERR) {
> +		dev_err(cs35l41->dev, "OTP Boot error\n");
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
>  int cs35l41_probe(struct cs35l41_private *cs35l41, const struct cs35l41_hw_cfg *hw_cfg)
>  {
> -	u32 regid, reg_revid, i, mtl_revid, int_status, chipid_match;
> +	u32 regid, reg_revid, i, mtl_revid, chipid_match;
>  	int irq_pol = 0;
>  	int ret;
>  
> @@ -1242,29 +1274,10 @@ int cs35l41_probe(struct cs35l41_private *cs35l41, const struct cs35l41_hw_cfg *
>  			goto err;
>  		}
>  	}
> -	if (cs35l41->reset_gpio) {
> -		/* satisfy minimum reset pulse width spec */
> -		usleep_range(2000, 2100);
> -		gpiod_set_value_cansleep(cs35l41->reset_gpio, 1);
> -	}
> -
> -	usleep_range(2000, 2100);
> -
> -	ret = regmap_read_poll_timeout(cs35l41->regmap, CS35L41_IRQ1_STATUS4,
> -				       int_status, int_status & CS35L41_OTP_BOOT_DONE,
> -				       1000, 100000);
> -	if (ret) {
> -		dev_err_probe(cs35l41->dev, ret,
> -			      "Failed waiting for OTP_BOOT_DONE\n");
> -		goto err;
> -	}
>  
> -	regmap_read(cs35l41->regmap, CS35L41_IRQ1_STATUS3, &int_status);
> -	if (int_status & CS35L41_OTP_BOOT_ERR) {
> -		dev_err(cs35l41->dev, "OTP Boot error\n");
> -		ret = -EINVAL;
> +	ret = cs35l41_boot(cs35l41);
> +	if (ret)
>  		goto err;
> -	}
>  
>  	ret = regmap_read(cs35l41->regmap, CS35L41_DEVID, &regid);
>  	if (ret < 0) {
> @@ -1450,7 +1463,20 @@ static int cs35l41_sys_suspend(struct device *dev)
>  {
>  	struct cs35l41_private *cs35l41 = dev_get_drvdata(dev);
>  
> -	dev_dbg(cs35l41->dev, "System suspend, disabling IRQ\n");
> +	dev_dbg(cs35l41->dev, "System suspend, saving state\n");
> +	disable_irq(cs35l41->irq);
> +
> +	regcache_cache_only(cs35l41->regmap, true);
> +	regcache_mark_dirty(cs35l41->regmap);
> +
> +	return 0;
> +}
> +
> +static int cs35l41_sys_poweroff(struct device *dev)
> +{
> +	struct cs35l41_private *cs35l41 = dev_get_drvdata(dev);
> +
> +	dev_dbg(cs35l41->dev, "System poweroff, disabling IRQ\n");
>  	disable_irq(cs35l41->irq);
>  
>  	return 0;
> @@ -1476,20 +1502,71 @@ static int cs35l41_sys_resume_noirq(struct device *dev)
>  	return 0;
>  }
>  
> +static int cs35l41_sys_thaw(struct device *dev)
> +{
> +	struct cs35l41_private *cs35l41 = dev_get_drvdata(dev);
> +
> +	dev_dbg(cs35l41->dev, "System thaw, reenabling IRQ\n");
> +	enable_irq(cs35l41->irq);
> +
> +	return 0;
> +}
> +
>  static int cs35l41_sys_resume(struct device *dev)
>  {
>  	struct cs35l41_private *cs35l41 = dev_get_drvdata(dev);
> +	int ret;
> +
> +	dev_dbg(cs35l41->dev, "System resume, restoring state\n");
> +
> +	regcache_cache_only(cs35l41->regmap, false);
> +
> +	ret = cs35l41_boot(cs35l41);
> +	if (ret)
> +		return ret;
> +
> +	cs35l41_test_key_unlock(cs35l41->dev, cs35l41->regmap);
> +	ret = regcache_sync(cs35l41->regmap);
> +	cs35l41_test_key_lock(cs35l41->dev, cs35l41->regmap);
> +	if (ret) {
> +		dev_err(cs35l41->dev, "Failed to restore register cache: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = cs35l41_init_boost(cs35l41->dev, cs35l41->regmap,
> +				 &cs35l41->hw_cfg);
> +	if (ret)
> +		return ret;
>  
> -	dev_dbg(cs35l41->dev, "System resume, reenabling IRQ\n");
>  	enable_irq(cs35l41->irq);
>  
> +	if (!cs35l41->dsp.cs_dsp.running)
> +		return 0;
> +
> +	/*
> +	 * DSP firmware is gone after a full power cycle. Reset the DSP
> +	 * software state so that firmware is reloaded on next DSP preload event
> +	 */
> +	wm_adsp_stop(&cs35l41->dsp);
> +
> +	if (!cs35l41->dsp.cs_dsp.booted)
> +		return 0;
> +
> +	wm_adsp_power_down(&cs35l41->dsp);
> +
>  	return 0;
>  }
>  
>  EXPORT_GPL_DEV_PM_OPS(cs35l41_pm_ops) = {
>  	RUNTIME_PM_OPS(cs35l41_runtime_suspend, cs35l41_runtime_resume, NULL)
>  
> -	SYSTEM_SLEEP_PM_OPS(cs35l41_sys_suspend, cs35l41_sys_resume)
> +	.suspend  = pm_sleep_ptr(cs35l41_sys_suspend),
> +	.resume   = pm_sleep_ptr(cs35l41_sys_resume),
> +	.freeze   = pm_sleep_ptr(cs35l41_sys_suspend),
> +	.thaw     = pm_sleep_ptr(cs35l41_sys_thaw),
> +	.poweroff = pm_sleep_ptr(cs35l41_sys_poweroff),
> +	.restore  = pm_sleep_ptr(cs35l41_sys_resume),
> +
>  	NOIRQ_SYSTEM_SLEEP_PM_OPS(cs35l41_sys_suspend_noirq, cs35l41_sys_resume_noirq)
>  };
>  
>
> ---
> base-commit: c425609d6ac4012c8bbf01ec2e10e801b1923a7b
> change-id: 20260615-cs35l41-s4-support-aac193d7ccba
>
> Best regards,
