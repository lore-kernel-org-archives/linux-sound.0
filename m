Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D987336F428
	for <linux-sound@vger.kernel.org>; Thu,  2 Apr 2026 09:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775121187; cv=fail; b=ZBJo8LFTTfMK9SonzvHqVxYHJeKDsZsP0lROK9Z2I9XEPj8C229SqfTVklg1H7AoZuaY5rXMXLBxSmE2/m3aoGnAO9m+Lo00yhQsvwfysgwAJmBUx/LkqTRw99dgoAnqQtfEJlqtxePqjkEgY3TpwxdMlV22FrDmJZ9/dMmwZ+4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775121187; c=relaxed/simple;
	bh=0dqkM4/pbNHqLFHhM1D2HaSDc4sHQUQizslU6CG/f7U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WUMpkz3xfo+L0oQoIQqQqrlR7yejpuojAivaC8MN3HhH0uVP5CjipGxYTi8dzY/29MlsAp9dcYMmnV1e/+UvI4+pRg/86er0mOOVXXINSA0mF6vKJdjsO837n+lAiJaB3exJWfoYB61eVbaDdNUy71gi8Tfz9laE2IuTTI3fVWw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=OSxvt+Hj; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=gZwfyHrZ; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="OSxvt+Hj";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="gZwfyHrZ"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6324s6bc3216298;
	Thu, 2 Apr 2026 04:12:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=BrvO4GgE0YhWy0ozOjf8HgJhA40Lxqy80ij2c2UKMSY=; b=
	OSxvt+HjoaL7G3SKQIg9cDuVS+OYLRc0w6Hfk1qJRLs85jACvS4cU1oOUXzt6jg2
	ARpFZ0M3diK4z3FVgUNq7ymdBQKpohf/MNZlD3wGvVGiUHnWQW+XWMFPy5p98H/1
	YHKSI2XNP6Gex5oMVVnouyiL71cN3JKbNoMUuE0POXNIEQwwkhOH/oSysMynVURX
	uTgVEOWnjgYstn1JqQamvzA3bgTjrTBTcxUkaYGYleKIYwK0NnXiI1WojnS2oYkE
	I6jGaA1MHSGDR/krsZjb2rp6nEA6R7utHUUogpVjBAGVfON6+uh1Au2qKc10MXVs
	75xh4M9dHljXrXhcguYtHQ==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11023097.outbound.protection.outlook.com [40.107.201.97])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4d6ccxx3bn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 02 Apr 2026 04:12:53 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dpCdsUdMeRxtJTpOPFCX2TG6FQGlgOQcjiMAAnMCK8c4gT4NHBp1Zg+5Q69HId8cD7ju3eiYqs17W60OYLGP29tpS0GM9Y6ZVlMrahQPCUfYqhYO3cw6lSoKi++NNJdOJq4dGfvadGWdkEiBCc8l0x3iQpjk35a74ROYT0cC0Jkant16WDmaxI2TN32cgoEBUWqvItW69asvWlLSqTyQwcu8aBZfyITI5LHJblaSPG25H5rhdG8jvVr44OQ4JWbVg7xQSV9vSDxoIfKvpeWmrqiapcqM7s+/SyuIksJXyVj6c9IFdFwDNXyFjSIeViDXt9hdVLHBUR2JOSOotIqhhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BrvO4GgE0YhWy0ozOjf8HgJhA40Lxqy80ij2c2UKMSY=;
 b=FC7BFczpNoSMw+3z+K+xkrlvVBHABgyYI2BzY85bCMErKVkYUgk9Eo+bbwNwTIXzYhTlZnVRUgREfgTPRlymhBz3EgiffSiH8m74MGToSn9waLp6r13uUCquJvyM8u/Eiccf0nuJM7CAJj5BDCc095ghuG+oFUMHxYXpmXIdMZ/8E9CaU2kZXNzUXMXfF6soRQioRm66G7AgBPPg5S8q1De/0QTVlo47QcqxQmu62X88oKQHyzkkdT63wktvavxNp6w2mKGyc30eKlKL1TJm7z/LZWNBW4pV0z1AWFmTavCkwqscd3NHogoxHQjEyiD3j1YkpGnUqqV2dD/zPX3Xvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=fdma.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BrvO4GgE0YhWy0ozOjf8HgJhA40Lxqy80ij2c2UKMSY=;
 b=gZwfyHrZq+6dETcMlsIidmWEIx3bkP9el5CX5otC0Z9mj123fIhvNFBPitY6EQwdTVUv80TJU2c/ckw3YLbKiI09Xyk5N9MCJweSRuQzP+tomBu0o5m4wAI71AXpr/JRZ9t2sUHhLR0OCwTnHOHvNVTBhjIpOwlhcSBz2NchWXw=
Received: from CH0PR03CA0288.namprd03.prod.outlook.com (2603:10b6:610:e6::23)
 by DS3PR19MB9368.namprd19.prod.outlook.com (2603:10b6:8:2df::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Thu, 2 Apr
 2026 09:12:50 +0000
Received: from CH2PEPF00000144.namprd02.prod.outlook.com
 (2603:10b6:610:e6:cafe::59) by CH0PR03CA0288.outlook.office365.com
 (2603:10b6:610:e6::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.20 via Frontend Transport; Thu,
 2 Apr 2026 09:12:50 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH2PEPF00000144.mail.protection.outlook.com (10.167.244.101) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.17
 via Frontend Transport; Thu, 2 Apr 2026 09:12:50 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id DDA38406540;
	Thu,  2 Apr 2026 09:12:48 +0000 (UTC)
Received: from [198.90.208.24] (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id D2AA482024A;
	Thu,  2 Apr 2026 09:12:48 +0000 (UTC)
Message-ID: <881307ea-0caa-4fbe-86f6-bcd6bc40b737@opensource.cirrus.com>
Date: Thu, 2 Apr 2026 10:12:48 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] ASoC: intel: ptl: Add machine driver entry for Dell
 XPS 14 DA14260
To: John Meyer <jmeyer@fdma.com>, linux-sound@vger.kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        kai.vehmanen@linux.intel.com, ranjani.sridharan@linux.intel.com,
        peter.ujfalusi@linux.intel.com
References: <20260402001236.17086-1-jmeyer@fdma.com>
 <20260402001236.17086-2-jmeyer@fdma.com>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20260402001236.17086-2-jmeyer@fdma.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000144:EE_|DS3PR19MB9368:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ac4ca13-3b1f-4a6e-8fcf-08de909803af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|61400799027|82310400026|16102099003|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	nKQtpCOSm0zy+WqGXEAlETI+p8zeDBVR4tfHnbs6fn6hJlJADHtvyq2Mt4iVDDoJ2lvFLfpnOya5gjL+eOhgvCK9PAOxISJE4TCGrN0THkedkFO6nbbLc2RJQuXwR3MQr40/oweMi+AE6r+3FJcaaK3Rx3YJCQbybCyELJ9zKu9NaMmXDZok4futv/UHp4yt0UAp7QSdRLbsKQOJXdG/9m6itR5dGFyKXgSHAwlyIG539u4vUS55ygIdSgfeNLDnvwYadWQDKnLjTDIfWFT9SFf2UVaYYilT+OnUV7KDF5bWwOa94cAm7x8xLEOgV7Haz6OKJ948nZWaZkL+EgWG/jRiTwMircaRYnkIQLnBJ4dJhCekWpk8rJKet3ob6zQxwOv9ZCvNOykPW9JDo424zw9EAnO7N/wgIyEz5JjKKDwd6wlM8L2Eq5r87Ss/bCAWeF+ECrPx0fAw9MpLKhx5xJSQIhQlyAgnnFlUiSucK5Q7fp4yALi90M/vOJCYyNYoPXcqY+V5/3RUYOzNhp1mXAdg7w/k9yMYcFmIQINt3SFryGZq0NJxX8YnXmoiY9fdQyPZmMivyQLRo3WfyZPmGF5zhOoh0HaPDtWBfWqa13/JrtA4oZdO2F7nBPjjMHomGOpepI/HyZEerB3fo/EIT9Ki5wqHum1VGEoE6ulzywsGX1fxvH7PiIgs8TITyz0nDi7fDMrVbbL+wcY9z09NE85Q+TA23OyT1AVjlGpdhcE9h25Porz73O57Bu/lh3Q8Ac/gtmtEONMFEqL5M6o0eg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(61400799027)(82310400026)(16102099003)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	BHo7/e52M534Xx0DqLLg+w3988JkHQftA9hTzyRGXN87DzqBVv8jO6f72JNaTI2ZdAvUog66MbTUVw0ducDJJGyjq6AdKRpYquCGPRFkkoJiTmUSRPNvxivNcv7kZF0DNcbDO+VBKwV6UTJWKLX77QWSbk0jMvZhNC5rs7IRee9GfVcW/HEgGU4xjuvn+rdukamGCKqhMpjzHxadLdSoh/1JNX3JFUc8T/qZ8aGTbZzvLSyHx1uRh8eDgE0ZgkScb4ixK7cB2l6rBqOfU4sNm1/Qm8zAu9hwEPi3kM5cNK2TMc6FMEZCngpTxIUvTnOPyeVLX6jDQv4Yrz88tjkJ1xI4YEkgqnNRDud/nOOJwFSfMOKQ1GB7DlJQGuIDuWBWpxm8w3GQc8fbqixyOLsvZgy6Cq1cxjTtCCmSTxSzHM9q11zVN/sc49h44EQVgL4n
X-Exchange-RoutingPolicyChecked:
	mimIaKH+9Izj0VvR55JPprU38y/JxTXie6JbzbALsfMBVXWR23ukS89cVqyL58s+8CMWlVP9vXDQ0kyeDSnro6Tg19NBPLm6wXMCsF1R8vodyOon5KAhAGptaYn1By/iZSvPee4+H02Cfh7ZrP8ydg2TXgnkhGbCjeYd6iPug+42XERHTrKgsqw3jK1iOqN0FYjRh34PI4R3azMjM169oCC7QxzaMqk3feXL428+0ikCYWHCFaerc0vKOjS21K9vljpeb5JuVBU83Tm39UK6oLt3/juf15n9f/Gj72L5qsJHFky26//aFRfcb6Z6tC09a3cmTAFA8qyTZCNG2LiNEA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 09:12:50.2097
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ac4ca13-3b1f-4a6e-8fcf-08de909803af
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH2PEPF00000144.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS3PR19MB9368
X-Proofpoint-ORIG-GUID: i7UjH-Dk3MVfPfkbU5C40dxUZ1fyR-JW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA4MiBTYWx0ZWRfX+qFskQiX2X8g
 TpLaZdJwgdFoEkwcS2ksFi2/ZRF+0llNKu+spannMXm1O3aF83N2ynXU5GQSKvuyn4WqzU9phQL
 EMQHN7/EPCkBTV4PQ+pCycWy3lQQxSCMJyYP+a6EHRD/l2Vq7g6w3DYlXEiwhUuRYA7rRbDt/s7
 MCoKDHNvEHOtMcyo4mYZEUusfewjgZzUpwKzi+tPRCVMtKgd9JumBYp5CqhOB1n04Y0d6Zqeaiw
 Y87WadBXYj+rPQI3AYOcPvexSBvZvqvLpWpa4sx5trvUiiHbL+JIOusczS2QMoFBzN2PnCvuNXM
 jw5mY9wP1B2E5yn7SHrSd4BV2TEsRhGUFBAMXvs+5rcQlpKPA3XHPgEcHB8o+DwJSns3j3JZhyJ
 lKH8XlaxSmBFR7kBaEBUCsiv/zUjWX140h9EQ1mvDJ0VVoFvZW0ZXM6rE9ocwe+O+hu3cLo/DCA
 yBHFCrg/x4CISvCG4Kw==
X-Proofpoint-GUID: i7UjH-Dk3MVfPfkbU5C40dxUZ1fyR-JW
X-Authority-Analysis: v=2.4 cv=Xvb3+FF9 c=1 sm=1 tr=0 ts=69ce3315 cx=c_pps
 a=XVr+MSEQQxWnM56OsALW2Q==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=2klGZANpNTW2U9O4IwIA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Reason: safe

On 02/04/2026 1:12 am, John Meyer wrote:
> The Dell XPS 14 DA14260 (Panther Lake) uses the following SoundWire
> audio topology:
> 
>    Link 0: CS42L45 (mfr 0x01FA, part 0x4245) -- SDCA headset codec
>              ADR 0x00003001FA424501
>              Endpoints: UAJ (jack playback), SmartMic (DMIC), UAJ (jack
>              capture)
> 
>    Link 2: Two CS35L57 speaker amps (mfr 0x01FA, part 0x3557)
>              ADR 0x00023201FA355701 (left/AMP1)
>              ADR 0x00023301FA355701 (AMP2)
> 
>    Link 3: Two CS35L57 speaker amps
>              ADR 0x00033001FA355701 (right/AMP3)
>              ADR 0x00033101FA355701 (AMP4)
> 
> ADR values were obtained from the platform ACPI DSDT.
> 
> Add the necessary ADR device arrays, endpoint descriptors, link array,
> and machine table entry.  The CS42L45 uses three non-aggregated
> endpoints (jack playback/capture and DMIC) matching the SDCA functions
> advertised by the hardware.  The four CS35L57 amps use the existing
> aggregated speaker endpoint descriptors (spk_l, spk_2, spk_r, spk_3).
> 
> The topology file name follows the established PTL naming convention.
> Note: a PTL-specific topology file does not yet exist; users can
> symlink sof-lnl-cs42l43-l0-cs35l56-l23.tplg as a workaround until
> a dedicated PTL topology is submitted to linux-firmware.
> 
No. This is completely the wrong thing to do, and isn't even
necessary because these parts are already supported and working.

PTL doesn't need match entries or hardcoded tplgs.

You seem to be sending random patches that
(a) are not necessary, (b) are wrong, (c) will break things

 > Note: a PTL-specific topology file does not yet exist; users can

The PTL tplgs do exist. These are SDCA parts that use the function
topologies.

