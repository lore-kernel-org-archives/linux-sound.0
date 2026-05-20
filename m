Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00AB23DB310;
	Wed, 20 May 2026 12:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779281579; cv=fail; b=jR5uCb83zc1P4z1ufB6YNprPo+xlItEDsBMLQ5IPoCOj8FBho6NqXKsuYEqD9xDO4vfJ9y7Tp2z4WMd0MkHHUPeb4HV+HnF6Y+GlzLxnzpv/wLZHvkJQFhgq10x/QT0yWGUhdnP4VIfCrnvcbU6doWNNTX685zVjWclEpyZz640=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779281579; c=relaxed/simple;
	bh=yVYcE2izInHTvGazmyAiMz5dT/9cHm6lF0WGJCFtXgc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VuooyVAStqx5TKlhZcQdsnmetsjOOZo57hK8xm95Ywm0cLqzGsUGsCWg9dSV1t3tm3bZe/dbvEA7pxGqMXYhkmoeUp2ej/7FDnG9tTFl5S/d6ivT/bwb+1jP6CIAsGq4ZbdXKOZprrCFkV6Oh7w0XcVK7Y8Rm9sC0hQZztHUmws=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=RErHuok/; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=Gfa3Go4L; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="RErHuok/";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="Gfa3Go4L"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KCfDd11072374;
	Wed, 20 May 2026 07:52:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=tFZ0jAQKKAKA3eFg/DKqj6mATwBhZfplt5jBaN8fNMw=; b=
	RErHuok/EDeaovynS09JaeN4qLZNLKF4sUXHEjJy0WOdHtmMf2OxVoyajpz62frl
	nNc05H4xfGR31pEZGzb07eSIrw2KoNIlpv55J2d1oD4mTPMTDF2YhTwGo7p5mBdF
	IbNjF4vq48OyO+KOVHNzQwwDfpLhH/ToS8ox5pWyIvZvtxV8V27GKtA2AJkHd8ms
	KuActRmk4FUYHGypRqySS6EwTIIpadIrsTVdVaRRsgXpYScz/diTchKqg4FfAKU+
	6SIVwY029c4IBhzl8Y7WMRx4aTMbSXvfftCAxwTx8wWDvY8VccnAlXNiP8PPEh9H
	J0xOCIQSqVHiXt/xVAsgZw==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11021136.outbound.protection.outlook.com [52.101.62.136])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4e93xcgn6f-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 20 May 2026 07:52:39 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gU+QtLNgVD89FFaHq6N24+0mwAVAbLJSH3Yd2a8KQenzTohkVk+3Zl5ht0gMuSqLzriAVUtvN+BfXscEbWC7TX7SgSaCFZ33QtunCBcH1nzZTQMeDjXfgAFF0tApP2xUI8t+hP+/3qIa7/LcZgrAWN4mLpd5fFofOfIN0+MdwwDYe7lB4UBtNo+tWBUiV2vPAR4XauKn0xl5vR54RP/LAGN484SwbAqwYhsdQBL97X13VgIlG1iJ30qcM2jvLxcbavrAr2h//Nao2I1yrfMAh/ttkoVOBv4iYoWZiEH520TNV+sk/VfsvWbTN0hkvTfqTMJE0wXDvBW9UsoBVDW3Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tFZ0jAQKKAKA3eFg/DKqj6mATwBhZfplt5jBaN8fNMw=;
 b=OEsU0/AkEFI9uvBqySN82JUMYDBpqj35dGycNhAsb4uKks06gB9XzJy1ElssE3cRRSxZiCXpS9RzLlAtDWABgwtX5yQydtJ6jnbimpr08ixPCT3KMqFRtaSrU+BSpB370Z76kQBXrfrkNvcBFhUioF2InAnMhOVsFP88Wt//ZJLkx+BsxKziGY3Eg2oPYX7D0iw9v9t8IGfsjJvko+gZT6RwySmosk864hOVE3agztguNdgh5d8mkBPVhFMg7HhNlN87KBTz5tdxfDfbCtR9uMoCfg20vOeSoFLO7v3JGuYnHFcQxQQoaJwBgqq8tXRq66dB6R6017WADvZtjb98Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tFZ0jAQKKAKA3eFg/DKqj6mATwBhZfplt5jBaN8fNMw=;
 b=Gfa3Go4LapNb8y48qvDAZnEHylKtyrlsWlaWxV/7uoKcr+7v7ofjVQtwSRHF2J1RiZs399CAdGIcZxnhpE1ioiqSYD3UlMW0ee2o84J6hph1opctyg+mj5Spc/uf0uLx5EsragL62F1X7AWTXNiNfvCFblIdMqr/W3MOR2ao7T4=
Received: from MW3PR05CA0028.namprd05.prod.outlook.com (2603:10b6:303:2b::33)
 by EA3PR19MB9349.namprd19.prod.outlook.com (2603:10b6:303:2b6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Wed, 20 May
 2026 12:52:35 +0000
Received: from MWH0EPF000C6187.namprd02.prod.outlook.com
 (2603:10b6:303:2b:cafe::9) by MW3PR05CA0028.outlook.office365.com
 (2603:10b6:303:2b::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.16 via Frontend Transport; Wed, 20
 May 2026 12:52:35 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MWH0EPF000C6187.mail.protection.outlook.com (10.167.249.119) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.11
 via Frontend Transport; Wed, 20 May 2026 12:52:34 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id AD6CA406540;
	Wed, 20 May 2026 12:52:32 +0000 (UTC)
Received: from [198.90.208.13] (ediswws06.ad.cirrus.com [198.90.208.13])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id A0636820244;
	Wed, 20 May 2026 12:52:32 +0000 (UTC)
Message-ID: <9f48fe53-1a69-4445-ba64-13a43e8647aa@opensource.cirrus.com>
Date: Wed, 20 May 2026 13:52:32 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ALSA: hda: cs35l56: Free ACPI _SUB string on errors
To: =?UTF-8?Q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>,
        David Rhodes <david.rhodes@cirrus.com>, Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Simon Trimmer <simont@opensource.cirrus.com>,
        Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
        linux-kernel@vger.kernel.org
References: <20260520-alsa-cs35l56-system-name-leak-v1-0-d13b54423198@gmail.com>
 <20260520-alsa-cs35l56-system-name-leak-v1-1-d13b54423198@gmail.com>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20260520-alsa-cs35l56-system-name-leak-v1-1-d13b54423198@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6187:EE_|EA3PR19MB9349:EE_
X-MS-Office365-Filtering-Correlation-Id: beed1a71-4c8d-49ce-9ee0-08deb66ea9d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|36860700016|376014|56012099003|18002099003|22082099003|16102099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	mDKuJ9Ed58jR4wylgTUA7u0vdqOws86/L/plh9nVtMHskxRSWyWsq68Q15UQiDsq2f9ZosdrT/C+6hX3AMlDXYqoEFviHrG0geUttqhTAgxhEDkm+utINauLiw0OAZP0YduNES/Gp5QFRASc8Rs1bg5VvhQvRhEvGq3N3ELXHy4Yj9fA8sNeFM7OWdTZkRPZkYupgSDwc1KDGpU7JF3M5zCoi83ghu3wReLKpcGx4L12CIm4ZKgeVE38eeoJ3zVuddp5BWT6NSMbrX8tX5jP0KUCNllvFOtDcDxTq9YXkoa4I/Nu8ixMNuJGZy4GZmPPxhhmVrvu978VI78FuQsHfrRNsS5VdewETHBvdaZFeNsv/tkzGIqRWbTkKC/Y0UUUrxVLd28gbMJVgcVOhrTrcX3G3KhbzMt5YShg4xixT/uyl+vPR316HFaVdQ/2aFzGFpJT4dqe4LNOukwvjRsMXR06WFQ88DBN+b+KIeAkrd1T49hTy3UzLgRy6FRYZU/unmpTbYZH/Zdur4O0ZKk8qFm7dW14w0oJDq0/8mfHbcqnWW6sv3J5BaoeWyFUmHUviMItXRI59QRfDVcHF746NschJLcQT1rgNdXLYrnYMfQpFi5gDYguMC5oEmBLwWT33X0tv60bEDe5cru+XSNwPCT/WGmuNs03OCFPftweuCpkB+ZiGM/Aa8ABUmoga4pz8ixe6uf60vzM8V/XV2/Da3FWDwvMxyNof1wsseUvRrI=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(36860700016)(376014)(56012099003)(18002099003)(22082099003)(16102099003)(11063799006)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Rfz7lkcOZ1uqbDwQ/nG5c/MB9k7InZvPRTg4Eu4sXxDaZX8RkxdmG9hymWp9Y5CLEIcLGWGtfkqkqgwKOMObNNawfIfvw1TvTbWBf0kLs0xDOc9VBwUixTXmJ448r7t/3gsQKPoOL0jkmInO6FUA0HaTqZgm9y54Z9NSvTNcnx4yQMCX6Jxhm7PeP6gKrvio+w1VXFZLTpRe+IfTurG2e/tI4MQxHOhHvY+GIwWYwjmjY3NYNaTR5l35YyEb0P7Gzns6eBpR1hnjrLFkjSvaNM9nCDFTk/csUsHJD1h6SwsHPJrDxkZocc9p4qMvc2UF9xLdHsdRw+8g5XTWm652NzZ2fl39TKObYLg/kSpaoCBozPX8HrQ4AL+nx+td3wHNHrGK6SXONzizyvnXMNey3eYvQWMrr49BSLpM6Kk8yrw47tINGS8cXWJ7W23jZw+T
X-Exchange-RoutingPolicyChecked:
	Y/vWxhEmWTDzHC+wklIiudsbONSxz3OGd/vSMVyikOsGZdEOmqeFedyZO4ou0d0ZHZdBpPs3dyrqdf4VDGM3kmQIVvB4XMpVSl5xcfGAxvL8APROpbxI6akc6kQBYB0/nBG2hwIVVkTs/5hMH0gSzLEGESABxvL/XCa4GLWhHzgmS0sbt6eEMy/PBOfc3zs+UZkN0SHliNd0c5YGI8T0uQayP+Q5572DeW5oS9HJ2f9g7y1DRfaa0x/cWyq7uSl6iiVBRZQVBaXj54xqdbh7yf2tDCGKFKwpP4ieMWEDPAYrM4ZskiLb+jOcNeZbHbUQ5oxvXIEILcBlpeSGr+52sA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 12:52:34.2053
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: beed1a71-4c8d-49ce-9ee0-08deb66ea9d9
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MWH0EPF000C6187.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EA3PR19MB9349
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDEyNCBTYWx0ZWRfX8uYkNKUsR4+/
 tZ+VQZQhV+6g75sE/cN8MCOc23ZfeK/pCXm7vEhX5hT+RSBpN59zlRyLAREHrekLi5L4jH62xpe
 tG2LXFn8bViiXhx3xi4jDBL1IaXQUkRTz8jEDy/EZufQf4uXaQ9213b/lmTL+G+TOJLP7+HEqxY
 vceB87sfpdknFEySxj07cCWGtA4sStX983L7simWir8QzJ0OfElyX1cz6c9bIv3iN9GS18OvQJS
 AJl9ihKkKEbXLy6Ap1T2TQtKq30gnwZPkw/szUby32sqJFfVP7GkLiZTBpM2M0zKW+3KIE0JcMN
 squDacTCcqkku1EX4uhMInLrTXMxB4FDGieYuG8tJ2MlFrjjBjf6u92FJWxji5EjvBs7glzarKz
 Wnr+lSiy3YdDVcX1coNq6v/re2jSvwaNaXOHJk8z9CZKWa2qUqeExTmxDDj+TnMQSFC+vNajdC6
 SctrTuPZwKZzd8jcTZA==
X-Proofpoint-GUID: -Xk5gflnvjyqUJw40Su3kAROUlQzl2Cv
X-Authority-Analysis: v=2.4 cv=Wrgb99fv c=1 sm=1 tr=0 ts=6a0dae97 cx=c_pps
 a=lvn/hLBWmN+qdOxS/Y+nnQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=pGLkceISAAAA:8 a=BQyK_wsuOP2dLHQkvEkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: -Xk5gflnvjyqUJw40Su3kAROUlQzl2Cv
X-Proofpoint-Spam-Reason: safe

On 20/05/2026 1:48 pm, Cássio Gabriel wrote:
> cs35l56_hda_read_acpi() gets an allocated ACPI _SUB string from
> acpi_get_subsystem_id(). On success, that string is either transferred
> to cs35l56->system_name or freed after constructing a speaker-ID-specific
> firmware name.
> 
> Several error paths after the _SUB lookup return without releasing the
> allocated string. This includes speaker ID lookup errors other than
> -ENOENT, and errors after _SUB is read but before ownership is
> transferred to cs35l56->system_name.
> 
> Free the temporary _SUB string on those error paths. If ownership has
> already been transferred to cs35l56->system_name, free that member and
> clear it before returning the error.
> 
> Fixes: 6f03b446cbae ("ALSA: hda: cs35l56: Add support for speaker id")
> Fixes: 40b1c2f9b299 ("ALSA: hda/cs35l56: Workaround bad dev-index on Lenovo Yoga Book 9i GenX")
> Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
> ---

__free(kfree) would be simpler.

