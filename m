Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A14724334C5;
	Mon, 24 Aug 2026 16:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787588936; cv=fail; b=pariw/0irhvFxJ9wSmb2jNuktj/4BX9TuYc/M9ntxWkNijY36j8gUVY0HyKtrlO0EnSwGLzi65MlOvLrlx60Z9yswNqtOu+/2zEybtZd+vakU6/kr6dcF0MqMpKHwCOmCDVHXEhsnrlLIfm7n3lYd+sPXATW3089L7rMRHCUjzM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787588936; c=relaxed/simple;
	bh=hE+VhOD9DT6Do/5O6SMRARCPMbaW0k7IiY3OfqwPqTY=;
	h=From:To:Cc:References:In-Reply-To:Subject:Date:Message-ID:
	 MIME-Version:Content-Type; b=s6GtgYd3n9pVkSEb6SaYHzOR4JkxBm/iYqG9yrSHcGagMy2ZZscOHOw3d+vDYjI7LVqsO8orkzV2jo/+1qTl6gKZZ5cl1nPmr8Jms/BLjLnc6Nh4Z2PPfOsk+qmSn9oMNMSWLbWQ4AQfaTOSWJ/9SyZfviF5GV+xhvSUgyxNUmg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=p3rL4dio; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=mKaYguTm; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="p3rL4dio";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="mKaYguTm"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67ODbXKZ2671922;
	Mon, 24 Aug 2026 11:28:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=LTJT5XJD0D9hPGgrc5dwH57CTvibpu2sH07FyOmkfv0=; b=
	p3rL4dioEO+7+YD/34OA44U5exx/IU/jbeziylcrTjt2d5sV1SPp62jTckY77T68
	rJAW3MsdGpsdFl9eS3EIuTNFh14hTysCIJFbJdeGbNm7dpRq2+5FXN+EC5G85w8Z
	G+GMfR8QFIURCaGJtOJKJHkCwEbVLaBH7u7Ejwu7eSYW7BxGEY6sF5sVhoqegHeJ
	pR4ZPPpCr+l6UtC/ijVfL4EusA4uV4MC61r9hDypDjdccBn9SYkFPkf+1Av+/Fwh
	zMGXbHjyUzPW2d6GsdJkCJuWhrUq2p/2xh7LfovbXCtcN5VhjP0StLyL4MJx8QGV
	/xXIsc9tIk/7JyI0B7eJCw==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11022082.outbound.protection.outlook.com [52.101.53.82])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4g795uttwv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 24 Aug 2026 11:28:35 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P939VcUWM5jl8ZhcIB1/INJZ7nINns/WizQuJ8wNDMJ9WW1HIZ0Z7u1vmtzKOi6RIHX24tjG5J2gOP1QL3J4xtThOygmAbdXaXVcdFuHQNu0nrE0deiR/OZvBujn9yKI3J9smQXFkXjI/wvr/4ZHdQbcMeUHpohYkKXP6Br531mK+lJCVqSadJNXPRK8izIB8lQegCTtmszPQMG+OCvIF1HiW3pE/DbCKnQqJd+QbQUfzNVUi/vPE3PbMFRlTAD7JyJcsff5SF+0GksQM7SPcD5AIjNU0UTgITKB9yrJGZsI5//p3dDsnunOh0LW/2sm6ImvTPV2uQLfL/l96ijLsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LTJT5XJD0D9hPGgrc5dwH57CTvibpu2sH07FyOmkfv0=;
 b=eNLBX+MRq0N4TNaRSslN21N1AL5QMry5+1WVZKFSqi3lEjvAXlQaC9nAGerCn+vr4LX4nUANiAMVY/AT3enPm0jc3ZTO4IfrlAC0xb2xJAMVoe9R5ofvkhaR06hmpDIo8/L4KjT8ujtFcpNQbVVTf7YFm+qVxSglZ8H4nZ4adGOPruMYsoQy+0lwvEZplKgaKqztXOGmt3draJ9RKnItCqbhlOnxVmIfmhYRILU7qd6NN1beCKU6MfkwxaohPMzXP7h5PKTfkVbfqo03V2+LsNF2mCiSWjXxsVsj2Y4/hB3CeEptSYB2MsZkz21b56bOj7yMEjXUEGbbTTIB9MHiww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LTJT5XJD0D9hPGgrc5dwH57CTvibpu2sH07FyOmkfv0=;
 b=mKaYguTmL1rcConSuUqpjXR6HL0BntWxMPF5qYcCjUBO89KC4bYXXKwVzHSLKKY01iMyHeLEXw14zmzd/OT8rOmEiw5d3cbqNLtN9jLp6fLCSWM7De9QKvismrAn85/dfofSuxYd4lMB9u9iHBnOvTVMc/2msiLgQO1QpAvNIus=
Received: from CH2PR02CA0023.namprd02.prod.outlook.com (2603:10b6:610:4e::33)
 by MN0PR19MB5874.namprd19.prod.outlook.com (2603:10b6:208:37a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 16:28:30 +0000
Received: from DM2PEPF00003FC5.namprd04.prod.outlook.com
 (2603:10b6:610:4e:cafe::44) by CH2PR02CA0023.outlook.office365.com
 (2603:10b6:610:4e::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.12 via Frontend Transport; Mon,
 24 Aug 2026 16:28:29 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DM2PEPF00003FC5.mail.protection.outlook.com (10.167.23.23) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.3
 via Frontend Transport; Mon, 24 Aug 2026 16:28:29 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 3EC48406541;
	Mon, 24 Aug 2026 16:28:28 +0000 (UTC)
Received: from LONNCK4V044 (LONNCK4V044.ad.cirrus.com [198.61.68.151])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 04B1582254B;
	Mon, 24 Aug 2026 16:28:28 +0000 (UTC)
From: "Stefan Binding \(Opensource\)" <sbinding@opensource.cirrus.com>
To: "'Sven Jans'" <skbotnl@disroot.org>
Cc: "'David Rhodes'" <david.rhodes@cirrus.com>,
        "'Richard Fitzgerald'" <rf@opensource.cirrus.com>,
        "'Jaroslav Kysela'" <perex@perex.cz>,
        "'Takashi Iwai'" <tiwai@suse.com>, <linux-sound@vger.kernel.org>,
        <patches@opensource.cirrus.com>, <linux-kernel@vger.kernel.org>
References: <20260824142209.4945-1-skbotnl@disroot.org>
In-Reply-To: <20260824142209.4945-1-skbotnl@disroot.org>
Subject: RE: [PATCH v3] ALSA: hda: cs35l41: Support HP OmniBook 7 Laptop 16-bh0xxx
Date: Mon, 24 Aug 2026 17:28:27 +0100
Message-ID: <003801dd33e5$98042a00$c80c7e00$@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQHd77by57z1fxh0M5/kqzsDG/1Xv7ar6yDw
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM2PEPF00003FC5:EE_|MN0PR19MB5874:EE_
X-MS-Office365-Filtering-Correlation-Id: b4ce03df-7278-45e0-9f16-08df01fcbb45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|61400799027|23010399003|82310400026|13003099007|6133799003|10067099003|56012099006|11063799006|18002099003|22082099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	4M/15H/C8g/gL/lp8fwcY2rDONZmVeTLeBtr4nPj4tcpeh6GUCpmbIIxFlGP90tYsCK/FVNeTYuICmDePHJLw6FxmeLPMsT06jYElRav08cJIwchpHa2r09jBUrAtFGa8O1z9/wNJeDquwgZzeFdt9dAw4lclkwKvVkvAjahCaxzziNEcz2vdSgy8v96p03mAjpjl4rFEK4EyEcexPMKuD04SBStKpW9WiAXc1hT3lgyQ5ngQAdFtZWR9oSSEHjcd1aMe9yfWpxJpKCH0ABSJuc2vX7w2ZaVr4LGL2b0xfq4h4p5noJ/liPJ8MeR9IxqfEkoRx2mC36HW4EhYgFsvbhRpo2f8F30Kk2qb+Dy0HLLazjApzWS2k5WTb70jWOuDBEWoCvYuK+OyUHpdCmHwPiqaZmRT1d6R+pPJfULZsmr4VYDNlUDJK6ai3VIHj8VzJTet7vDxWAhM/WePWXOC/LnpR57yeTeRYrP1Bo++JFwcIqUfWBZcdfCUJU0pkFpcYB0AltrUXr3NpMMUOKFBjfTUDIR0e//rP5cw0sKg7wvH3MMQPl3LCuI9Pl8gSa9/se7aQADS7/et+Ow/PPrlZkTcC3cmX0eQbqd4XazTUdZWSpCBRd/ZPBxPc8QvnAkWl661ysN0B2FG2kkoWTgHXfl8NrFdrXmSPaJ3+7LU8/DhUlFP1eq8ZD2N06EeBTnt/ElNnV45dHq3JUA+Rqlow==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(61400799027)(23010399003)(82310400026)(13003099007)(6133799003)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	HjV8mA0o3mi4yE+y0ovJE6LaAL2WSHH8AEMdOMBbt1f14tN0eBWXQSaw5kPqoKo5dHOoYpU1pkdDAk6DJSbTcYDXkvuZemud+KguVhvzXqLh4DggCnA2bgu/Dr+Ig0ZEZw4R2Oan64bW062WIdfbXeg5HFPnyQKP4rTWCGvE1iQqvhmWNZl64Gm5+NnnfabElv6WpWWUJmFNR0ecAfATJ03ldZOpc5nzReGlRsmpu62vOtohadwpHd6+W8+21rU02JYFlkNR5mg1DyRp7CGLGJ4/5MWMSFBlhACMpRbWzd0w9zCEJzi/zWbIR833u4/zZ5qTTykaZ3ohLYmWwFrxVttPomwF9wHu71hfIrZWK1tAmWPnLytuQNgPApHJ8sSXBnRgm+yF0AVKJxkWTvlaL+4nFMJeOHoRAbCk9E6sVjTC699AaJIgnDSYyATUdb0Q
X-Exchange-RoutingPolicyChecked:
	Vu9cYxUqGD4nksZfOp44+mKDaXdVR/yDajkr0hHtqvfl9u/0H3s/zrrp8SjzbVHg79tuSaspk7P9UgNU7x0ULEF5++ndL9ojJTMeZptB4Xvqq10DgrR42TU7pyt89A+1uUzTeMkZAt0rtEjBt/7pS9WH9bLSSguTzw10JYD8Djd/wssciC2ekE5iTnn+YHk9QG9QFL8Ct6H17nIHr+1NKND54LQA+HCRycmMS+DmfHqJJZv6AAOjK6fEhJXm0UAykvnMlwrsbE+zLnboB1RmI2s/caQ+z9NfK+5eHbhkzQ0F1P7yHZQdD1UqAV5V6vbhbLzXkdbqv1GQRwGfutACVw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 16:28:29.2576
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b4ce03df-7278-45e0-9f16-08df01fcbb45
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DM2PEPF00003FC5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR19MB5874
X-Authority-Analysis: v=2.4 cv=aYhRWxot c=1 sm=1 tr=0 ts=6a8c7133 cx=c_pps
 a=fzV1Iv4YRLQDDQDbumTdQQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=VwQbUJbxAAAA:8 a=LpNgXrTXAAAA:8 a=w1d2syhTAAAA:8 a=iox4zFpeAAAA:8
 a=KdYoivNf6ORsynzyJ7AA:9 a=CjuIK1q_8ugA:10 a=LqOpv0_-CX5VL_7kjZO3:22
 a=WzC6qhA0u3u7Ye7llzcV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDEzOCBTYWx0ZWRfX+j/lfFeKc5yA
 5bSIqTPjV8/cBIknVnmO1gAX7G7+XVl+aHdMKzsq9uXZDvQnUXf54vixStXk/1cLqG2q47jyH/m
 DT97j1KHJ5Z4dkpyXKLJ5NOvlISjCaQ0LrH+gPQXRN5EaYifBpc8u8N1VIwV8qpHigDEVgmPEuu
 stKI6L3lEpukGScKAP/YNwWOxJyHQkn5lRj2C+jxzYvBdmqHoAviwk7uyHYsypsuSxvTvptV3de
 UwLrEedCQxQ5G5pLWkoPvhMKt04KzCjmmKJbfC5V6E70ii7fAc+lt6fD9mUrnC3bADv9xXp3lnx
 myvm2lpTY8CqyoyocWmhZRW7Kh0KVH4KhqUg4n22LGbaJM3jSC2naJn/nOWgzXE47ihOdEJUJeG
 UsEsZfO6VypGEr3NvZVa8kgQb18RTd/tftF+NUcZGK9wSomyR+MtlKOlb5oGneeueQHAvaO/zED
 KIJAQeJjLXMHj/NGSjA==
X-Proofpoint-ORIG-GUID: t7SK_tV_PIH6Kcf5BFPYinvyJUFF8m3w
X-Proofpoint-GUID: t7SK_tV_PIH6Kcf5BFPYinvyJUFF8m3w
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDEzOCBTYWx0ZWRfXzeb8dXxRY0mu
 Nxg1bokDI94nI11XbtkGq8+i3cYOKUl2uSerComVOFepcBzcIEoM+rxoE2SNnlon3eT7vwwTasj
 w7/y5SFhrBKAgMpWiErEmbmSxuI7x3g=
X-Proofpoint-Spam-Reason: safe

Hi,

We are planning on upstreaming fixes for various laptops, including this
one, with malformed ACPI.
We are currently awaiting confirmation of the correct settings before we do
so.

Thanks,
Stefan

> -----Original Message-----
> From: Sven Jans <skbotnl@disroot.org>
> Sent: Monday, August 24, 2026 3:22 PM
> Cc: Sven Jans <skbotnl@disroot.org>; David Rhodes
> <david.rhodes@cirrus.com>; Richard Fitzgerald <rf@opensource.cirrus.com>;
> Jaroslav Kysela <perex@perex.cz>; Takashi Iwai <tiwai@suse.com>; linux-
> sound@vger.kernel.org; patches@opensource.cirrus.com; linux-
> kernel@vger.kernel.org
> Subject: [PATCH v3] ALSA: hda: cs35l41: Support HP OmniBook 7 Laptop 16-
> bh0xxx
> 
> The laptop has a malformed _DSD which causes the cirrus,dev-index property
> to fail to parse, so it needs to be supported using the configuration
table.
> 
> Signed-off-by: Sven Jans <skbotnl@disroot.org>
> ---
> Created against tiwai/sound this time (I read that's preferred?) Link to
v2:
> https://lore.kernel.org/linux-sound/20260709214414.8461-1-
> skbotnl@disroot.org/
> 
>  sound/hda/codecs/side-codecs/cs35l41_hda_property.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/sound/hda/codecs/side-codecs/cs35l41_hda_property.c
> b/sound/hda/codecs/side-codecs/cs35l41_hda_property.c
> index 416d7bf3e..e14a87336 100644
> --- a/sound/hda/codecs/side-codecs/cs35l41_hda_property.c
> +++ b/sound/hda/codecs/side-codecs/cs35l41_hda_property.c
> @@ -85,6 +85,7 @@ static const struct cs35l41_config
> cs35l41_config_table[] = {
>  	{ "103C8C51", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 },
> 0, 1, -1, 1000, 4100, 24 },
>  	{ "103C8CDD", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 },
> 0, 1, -1, 1000, 4100, 24 },
>  	{ "103C8CDE", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 },
> 0, 1, -1, 1000, 3900, 24 },
> +	{ "103C8E60", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 },
> 0,
> +1, -1, 1000, 4500, 24 },
>  	{ "104312AF", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 },
> 1, 2, 0, 1000, 4500, 24 },
>  	{ "10431433", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 },
> 0, 1, -1, 1000, 4500, 24 },
>  	{ "10431463", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 },
> 0, 1, -1, 1000, 4500, 24 }, @@ -511,6 +512,7 @@ static const struct
> cs35l41_prop_model cs35l41_prop_model_table[] = {
>  	{ "CSC3551", "103C8C6A", hp_i2c_int_2amp_dual_spkid },
>  	{ "CSC3551", "103C8CDD", generic_dsd_config },
>  	{ "CSC3551", "103C8CDE", generic_dsd_config },
> +	{ "CSC3551", "103C8E60", generic_dsd_config },
>  	{ "CSC3551", "104312AF", generic_dsd_config },
>  	{ "CSC3551", "10431433", generic_dsd_config },
>  	{ "CSC3551", "10431463", generic_dsd_config },
> --
> 2.55.0
> 


