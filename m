Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA622319851;
	Wed, 17 Jun 2026 17:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781718060; cv=fail; b=XGBezj4rML5fXTnvytpUK33w1dEonRHRYABNFrK42NC8MKs7dwv2kaD0BaHgO251ei863+joqRGVqBNFMH7FF7mhsTA5HaCgPFHPzCm/s8fVbOR5TXYj2DSUu7FBTrk6ksEoaUNJ9P2hRQYtPmYZ4+dBsC+37x9i6quWf+iXn/c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781718060; c=relaxed/simple;
	bh=HnYeFKRqiE/ZGEEuC7nFTwxkWflUPJcq/aPDjmzhEMI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VCnIVCbzgx8TkJP3Y0s9gGGiZDj8tQVH74fl1uvuSi0GXaOehme31R0Hzy/LhHdqgFJANWwyVL3SKLnLALclmqvjk0o0W3GU/S3Nlcauq2F6lKnN2YYy15RwHAZj/T8JZQC/iI05wXjTieJ/s5iP9PSvD907MHk0ONOYBzH8bqE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=eQoE/5Kd; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=SgzsfIA6; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="eQoE/5Kd";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="SgzsfIA6"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65HErB2U145243;
	Wed, 17 Jun 2026 12:40:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=5khoFu1h8sGayvai/2R/J8z+VKFAZ+FKEtxQp94NCNI=; b=
	eQoE/5KdVfLS+o5JLNNvZkVvA8hAWI7oFRmR7fYuGHgMSLKi0IxDGxM7sw6CIHe/
	C1fFu69EstdqNWfBHUBF1c0tn26ZfKBhfAgCQ+FG1uhqkyT3eVVARqlliB1G2R2G
	YQZHt6yhNjtUGp9vn6ov0Fgp2r5CiuvjVJ7gM9wUQsmZ20i9XZil9O1eD8jh9HuU
	LKvLzICFeXRl932QCZcvkUFRkGbImgmk4vbbnuQV2BiGtqDAvwyYU89qnPpsZt04
	wjDrqabgs9suda8IC/fgUISxMVIJv3MK0gK46+doEEvZ8Bg5zXPEgxcmVFUk7Z1V
	pXEs8GzVbJO94D4BCo1fhg==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11023098.outbound.protection.outlook.com [40.93.196.98])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4euee39fd1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 17 Jun 2026 12:40:35 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fXmyl+97QefzOwIy8ulXcusqT5RGUCXz9u+IBXEyQJFbJ7qeayw/P+ciS6kAs8bcvCChDIf43TTa43lhwW8ZH5hRIBa6LpLI2rht3Q81pA97gLn+kfqazA77VuElxxT4XQwGIf75pyE638zjFylZFe5EkdcbVB069uHW3SA8NkzskpyBLngvZUeRehoFBUKRqBaDt9+sQ8cyXE7cD8cL1B1CtrhRNDA6sNqx6nFc89D/u8lsLFuE556Sm4p/DtsoeT79KjjrAjNucEddWH5FwbFmX91VE3Nk3hceP07kCVW5JK2s+fK4k0qUGZvHuTGkFTtAyx48+KXXgePF02ksPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5khoFu1h8sGayvai/2R/J8z+VKFAZ+FKEtxQp94NCNI=;
 b=xSiM6g6PISq99xzkUX8xvFAZBJeVjqX2A1FebH9XQt5DUCYzUo1gPfTRWPECF16FDovHN+2foFUR6qw71LTxj2Qeqfun/HKsnk/qCdRLgnBf5rsjW9S7bnLjTmRS5fGGMwXMMNvB7zLg5lvlJizGvPxp4jk4eUqAKMroDVGklu4mBoCfoPO4QjozmZH3ciZpMokA/l0DwHXKqogYTQSrH4zJY3W1EkwyIwpQVDKrfwxxZguHRohEmizoUF3vGmNzMZhjC4blxVENrm5mVBVLPZKJ5Gr7QuuzA946DfY2nCuckmOS7joNBtmjxMM+7s+Y/SHQ9OvV+/15SlscV8Kt5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5khoFu1h8sGayvai/2R/J8z+VKFAZ+FKEtxQp94NCNI=;
 b=SgzsfIA6aiU8LSMNjHBKfrDYENtYFNqlQNWDMRBulyFj4PbyP2pK9Y8nH8/Mp9IeLdELQ7c1jAC7W9ipmQk+AWgA3yxH/eCS9ZaWOI18aLHdeM+uq/v93AhgaYecLn56sdMcmysOgX0ezPNdEFE2Ygi9E39NInvopvKZmBemx1o=
Received: from CH0PR03CA0325.namprd03.prod.outlook.com (2603:10b6:610:118::31)
 by BL1PPFAD49D6705.namprd19.prod.outlook.com (2603:10b6:20f:fc04::eca) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.16; Wed, 17 Jun
 2026 17:40:27 +0000
Received: from DS2PEPF000061C2.namprd02.prod.outlook.com
 (2603:10b6:610:118:cafe::62) by CH0PR03CA0325.outlook.office365.com
 (2603:10b6:610:118::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.11 via Frontend Transport; Wed,
 17 Jun 2026 17:40:27 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS2PEPF000061C2.mail.protection.outlook.com (10.167.23.69) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.8
 via Frontend Transport; Wed, 17 Jun 2026 17:40:26 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id BDF0B406544;
	Wed, 17 Jun 2026 17:40:25 +0000 (UTC)
Received: from [141.131.157.79] (macMW3KVPQQ2W.ad.cirrus.com [141.131.157.79])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 1A5AC820244;
	Wed, 17 Jun 2026 17:40:23 +0000 (UTC)
Message-ID: <a824dfcc-71cf-4ac9-b17c-563ba857cc83@opensource.cirrus.com>
Date: Wed, 17 Jun 2026 12:40:14 -0500
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: cs35l41: Restore register state after system sleep
To: Stefan Binding <sbinding@opensource.cirrus.com>,
        =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: kernel@collabora.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com, linux-kernel@vger.kernel.org
References: <20260615-cs35l41-s4-support-v1-1-f5a21e35dd9e@collabora.com>
 <adcf487e-a6c1-4439-b986-c421e206d6fe@opensource.cirrus.com>
Content-Language: en-US
From: "Rhodes, David" <drhodes@opensource.cirrus.com>
In-Reply-To: <adcf487e-a6c1-4439-b986-c421e206d6fe@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C2:EE_|BL1PPFAD49D6705:EE_
X-MS-Office365-Filtering-Correlation-Id: 48808401-7512-4d56-f036-08decc9784bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|82310400026|23010399003|61400799027|6133799003|56012099006|4143699003|11063799006|22082099003|18002099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	OQf27LX5ZC+qGYk0GeR0Ua/D+kLbDuFPzj5yGoDs4kT3t54a5rKujnLv7pJhZnRbn/i0xF927Xlpsq15+YBldwaGKlCWKYAYuNvxeLVoET58VY2+Ub8J2cYUXFLQAShxn/hkl8R9A1R5xM/8SJXJi4YSG+vAvENv3Jk/sJX4Vp5J9Oy42ZTyqPfUSb/LxQ6RZqLFWnlw8zCq3btX2IFSKd3ZnD4uAsKohGLBAbTF6uz0oqsRw2mIWfwjA3+JThS7NjfI2K/CG+9QSfWxGE6MauPN8I7qGlbSzpPSk5hO0qgKaQALJaaapuJNCGU/cByBquE8PKdh4XoIv/XUGJakW5XNxycVXkJBOwHadPi4OGyKjDYOcevX0vgwO6bBBYuXPSBX24yNbXWYgk+CkP42tFo50dxZR9Q8zTANLpLr5cii41IUHo0btvvC8TQ4yeOUOFjfWF+Lp3mB7mBQMGx6oEmf5SF5JbUgqOM5X8YZKo0Cs+zTDG/ERgyN4nazNYrOv0qBAuzBeEN2AcXK/XnN5ReUJgyIM7Z5Z0UBzXtFETelYyFQsFs0FbpHnFZFXpEIEn5Ip/pWlbXQUjrPRy/QXar0o/hIPiiBQQJaqEcFLzJC8IW9dWEFd0mS9BRXjPJ6W2S3OkwE5q0biaR0aUSPxOqGNfIwLdBbfJeWCbdVBXeyF4I1rvAYlYSp2Q1JvJeBVeLu//c+GouuSyuVIm/5XPrRa7u45dbZlCdgvnXnLKk=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(23010399003)(61400799027)(6133799003)(56012099006)(4143699003)(11063799006)(22082099003)(18002099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	hR3kWCQMnBYgTjUNfahyV1cUvBsfaG3IUdkmlgDArfgCqEldf8mkMZ9RT2PuMEzHB4Za/J/05ZOu7U3SMdsCKMZOWz4ZUv/mQRTJwj27c+iWqCpn4uUrEvWWVQWJmkSiLVafBDIAyHSqeZafF8r1+7yiMy3jew4uM+cxopEUIefIRAcMfEjx4OKDI1z2nAI7hN2PY5pDGkVM6373vlAl5OZyD3ZDcfoSKd8fWF+SDFFn9brHl2ktbfOwjUEzNKKr2ImwvEaqGuPTo79Esys/33lqJYEN4O9YcPgH4juUah/dVa4wSjwNoUS38zAMwSf4Jerl5NpZzb6rinYKePIHIAUAYmQNO9pJrjrT7X1T/lM4A4hsRCtqecNK9kuIe2ScALGVp3JXcHm47BMkCNIQ7BV7lvzoL8DeJE5TAUmWtW/Z9uiw9Qw/7e9i4zvKGeca
X-Exchange-RoutingPolicyChecked:
	qBoSodQzzWqfrjgiUX2B+HhR+Uehefc2L69ijIi+DJ5ltZTBPfXI/ZneiiLNHsdeXBlZaXdFv3OW/H+GuD7T2u771KHpEvt2PqaaUPsGTXi7NI1vIj/Z78cNUMWYRJoFSh6b7NOP0bmqCS351g7Ri0vACY47jgjZgYl9+jS0zOCXY5tcVTr7mjR2Jq51btMGvjkEZNRJHJtSLY37ZIH3uoNP8QBBTkJxQxDChOeqJG8xUL5+oEr0EKvKfUbrWHhvs7W3PATY2Q3mf76N+FimWFM3kZ/ljcT2Y+pWvjTgO1wXk7XLWLnlc9VKUFUvVknXO5H3xFT7uFPxNoO4wIiSkQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 17:40:26.9591
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 48808401-7512-4d56-f036-08decc9784bd
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS2PEPF000061C2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PPFAD49D6705
X-Proofpoint-ORIG-GUID: OJR7-xkrQC2NYGjMKDabVmi52WvZAFaG
X-Authority-Analysis: v=2.4 cv=UuxT8ewB c=1 sm=1 tr=0 ts=6a32dc13 cx=c_pps
 a=RF33hWjtojM2TPqP3ubyaQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=QX4gbG5DAAAA:8 a=HvafMVDoYJZp9L_GQB8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDE3MCBTYWx0ZWRfX5GYR2fBb8Dih
 voy3MZE4dg7fnm+4iZguZrhe48rILpQ4ibrdEm1Ryjr9Rl2A9XdZQP/UNUPOOdB2aBx+XFkhHD9
 ruaG7KgSGcDonbjogwiCXryBAVK29DM=
X-Proofpoint-GUID: OJR7-xkrQC2NYGjMKDabVmi52WvZAFaG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDE3MCBTYWx0ZWRfXwCv/ww8VI+VK
 ykIeHMHasDXq3YMewKnxKBQuTlAKJmQldB+vDH98cJifkcU08TAUwmfz5UNdzc99gwFqKSqi1gm
 +ub5DKmBUR64aphNu0x8Pg9G/h4g0ch/5v98nC9OPs5JLVXc6o3zUPKspOcHN9CJ/tT4TzyLpif
 1e2iofzLn7WwuvI2NFK2+B3TH5TA8/oiWi6BZIQgHUeJkaqJ633i+Qadzep92ptRVtAvEAw5hvx
 FCtvDBgMmU1qXwa9PEUoDV6zT8fqbQS8uGmCfHFd08ilx8zRvjGFGe0IfqlO7+py+BYUEURjae0
 w4jmmKf+co8Bp4w1ZqI63PBvDa1RuIgKLuMSu79j3C4AfCSZMSgHA/SMW0Z1yRHKX4AdcjoIWNz
 BeEWKxHEKqxGi+Nfhyhwr9hkw+kueFVPCQOxnsUr4vA7F3XhzBdaCEgVM3QvreOyuM1WmKjuA7u
 qAzWGlYsvjY91u80fvg==
X-Proofpoint-Spam-Reason: safe

On 6/16/26 11:31 AM, Stefan Binding wrote:
> Hi,
> 
> I have some concerns about this patch.
> 
> This driver is used for more than just the Steam Deck, so we would need to ensure that this patch doesn't break those systems.
> There are some potential complexities around cs35l41 with respect to Boost and DSP enablement that need careful thought when supporting system sleep.
> 
> The HDA equivalent driver for cs35l41 does have support for system sleep, but this driver works very differently.
> 
> I recommend reaching out to David Rhodes <david.rhodes@cirrus.com> for more information on the ASoC driver for CS35L41.
> Please also cc patches@opensource.cirrus.com.
> 
> Thanks,
> 
> Stefan
> 
> On 15/06/2026 15:54, Nícolas F. R. A. Prado wrote:
>> Currently, on the Steam Deck LCD when the system goes into hibernation
>> and resumes back, the speakers are silent when playing with:
>>
>>    aplay -D plughw:acp5x,1 /usr/share/sounds/alsa/Front_Left.wav
>>
>> A crude workaround was to, after resuming the system, bypassing the
>> regmap cache on the cs35l41 devices, before playing:
>>
>>    echo 1 > /sys/kernel/debug/regmap/spi-VLV1776\:00/cache_bypass
>>    echo 1 > /sys/kernel/debug/regmap/spi-VLV1776\:01/cache_bypass
>>
>> That indicated that the hardware registers had gone out of sync with
>> the regmap cache due to the power down in system hibernation.
>>
>> Fix the issue by, before system sleep, marking the regcache as cache
>> only, and after system sleep, resetting the hardware and restoring the
>> hardware registers from the regcache.
>>
>> This gets the sound working on the Steam Deck LCD after resume from S4.
>>
>> While the issue was only observed on S4 on this platform, the callbacks
>> for suspend/resume are also set in the same way to account for platforms
>> that might power down the chip on S3 as well.
>>
>> Note that this change does not take care of restoring the DSP state,
>> since the affected platform does not use the DSP and it couldn't be
>> tested, so it is only shut down on resume so it can be reinitialized in
>> a future DSP preload event.
>>
>> Assisted-by: Copilot:claude-sonnet-4.6
>> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Hi Nicholas,

I share Stefan's concerns about this patch affecting other devices. I 
also wonder if there is a less crude workaround for your system's behavior.

The existing driver uses runtime_suspend/runtime_resume to enter and 
exit a low power 'hibernation' mode 
(wm_adsp_hibernate/cs35l41_enter_hibernate). In this mode the part will 
lose some configuration so the regmap is put into cache_only for the 
duration of the sleep and synced when waking up.

Are you sure the device is not just missing a runtime_resume after the 
system is in S4? This whole sequence of sys operations should only be 
needed if the amp is completely losing power.

Thanks,
David
