Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C003B19D8;
	Wed, 15 Jul 2026 16:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784132059; cv=fail; b=iyfDgUFIaCCnWg+LUXxlXJ8hhH/tqA/WnpfEdUBhbePMI9rQnlP9d/UOWNAvKZgka/Zxh4kMrnZf0hvmNL0XUB1wGuRyahc2A+4w3+AgXuvHWq3iRSxKGlkDHKwL4Cijdog0ZZinDRKS/arlDJepxgRBB6Mho3aTVp3+kIJ/HKc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784132059; c=relaxed/simple;
	bh=/IysbIIhLR5yK9vfDd2dv2i/Ik62indBmr7VdWLoVzM=;
	h=From:To:Cc:References:In-Reply-To:Subject:Date:Message-ID:
	 MIME-Version:Content-Type; b=lfuphZ1lwzkF3AeVpciBzMi1AESAXjgGRTW2CP9URH4pfRsfKPr/HIV5kP4by0J03BDEORduznsFyWas4sSbiLHvZ0xP5m/RJiCEJiiSngWcO8vSci62U5lT7oQPFd2tuCvePXUgYS3zqqhilU4qu5ZZi01Cw5u0hUERlILCcqw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=C3SzSNTY; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=xtMcZutR; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="C3SzSNTY";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="xtMcZutR"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F4PWbt275548;
	Wed, 15 Jul 2026 11:13:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=vKm4AwNmSZ6e+A59l+D0cMMCYmqhR5APOpB8LdMV0GE=; b=
	C3SzSNTY+flNWd5c/46HO8L0oVHXndODu6Lux0JSs4y3vAe7fBKxlspZoQkcMk7I
	49FEBlTc6WpoGpqLMo2TS98/0OizBP5EBFpPgjV11cEAGpHUWI/6MLooYj5Pn5b+
	B+dOV5kEgYgR8595i/zpOmTB1S95lqo3lUTZk2+6Om4tnstjhJPIigUoeySaXVKD
	JkJRlyzgm2meotqPJiLC/4UGn8c6o/n7PAP9uCQ9RO0t3HfEcSYepcX77NHeEcKg
	7b10oTt2uGW09a3VynrNe6BQj/czk261e4ik1/szx9aa5yjHHZMqAUbtKQkyzrxl
	4hPTbmjuHLte42vucx3T4w==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11022128.outbound.protection.outlook.com [40.107.200.128])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4fbk7vwtdc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 15 Jul 2026 11:13:57 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lkf73HtTLY/7PNLqR40Kecg2QnUREdc08mnsXKZVr3Tl5bQAU5hCDzMYTFh4OAxf7S5uCXpXLT9UYXQwASVzIdtCYbb5nRxLeOvCY3+Vi3+zyYRcszxhHTBuNajUNe8FbgaHeJBp4knrPkjXXQ/sZ29/vCu3OP4e7rWD4qfg6jagPfyqCVQqciYR7fME0D+wCTpDRLvsKID63A3DyB8VwKPFKNTZSArCoIg9RUEdwdls+gHw60AANu+P+eoYQPMD1lmfukbVD7LToxa0+M0DNGdnoBXzVSZYxkvb0MdNyLiSNzHIgeTPpXy+k0U08Cs2Zr2WubHI6ylnssPYZmYT7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vKm4AwNmSZ6e+A59l+D0cMMCYmqhR5APOpB8LdMV0GE=;
 b=Y5jw9XKjTU65t8FZ0tmsIR3TaxBA3PN/tNHQpwgrMTMzNRKoiuWE7WwdXLY8HsgCFxYCr5LCYdzDopjFsv1CtIxPj/jDqVEAHIjHrAZVSj7ECBmKC0fVNOpyezWRfnHVnWvnPO/rwWQDQkUELw1rzGLhDLMUvZfNo+JX/7nB9xgHRsEq0+66oiKAOJjysD4QqCYJuP+ClM4eojFoAmj3Psq2ymSsEiV01zupv3LJMOvsawQKNAqiBLYd97bCmqqZCo4GT1hcpMb0DuLB0FT4hFaRb17TZI3FtTPAndlCGe5cB2Lax2b2tZIgeHJP0UyQgkOgJpN0C8GMcdwAiHbokA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vKm4AwNmSZ6e+A59l+D0cMMCYmqhR5APOpB8LdMV0GE=;
 b=xtMcZutRWeeZ2SYc/E3MskrKOYktykdaGdGfLbyd2X+4x7racnla6vZc/h3Xq4dWP13gl55wrO1iYIeCGAJW3r6CJoeZsrZ8IR8cZT2G1mk35oTOtTalbaX/kY9alTMSJN+iH0htKXnUNBSZGgkQXaq3c+XuIkfUXap45hqNpnY=
Received: from BN9P221CA0011.NAMP221.PROD.OUTLOOK.COM (2603:10b6:408:10a::31)
 by IA1PR19MB6130.namprd19.prod.outlook.com (2603:10b6:208:3d6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.11; Wed, 15 Jul
 2026 16:13:51 +0000
Received: from BL02EPF0001A0FF.namprd03.prod.outlook.com
 (2603:10b6:408:10a:cafe::77) by BN9P221CA0011.outlook.office365.com
 (2603:10b6:408:10a::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.11 via Frontend Transport; Wed,
 15 Jul 2026 16:13:51 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL02EPF0001A0FF.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.9
 via Frontend Transport; Wed, 15 Jul 2026 16:13:50 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id C778F406541;
	Wed, 15 Jul 2026 16:13:49 +0000 (UTC)
Received: from LONNCK4V044 (LONNCK4V044.ad.cirrus.com [198.61.68.151])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 8651A820244;
	Wed, 15 Jul 2026 16:13:49 +0000 (UTC)
From: "Stefan Binding \(Opensource\)" <sbinding@opensource.cirrus.com>
To: "'Takashi Iwai'" <tiwai@suse.de>
Cc: "'Sven Jans'" <skbotnl@disroot.org>,
        "'David Rhodes'" <david.rhodes@cirrus.com>,
        "'Richard Fitzgerald'" <rf@opensource.cirrus.com>,
        "'Jaroslav Kysela'" <perex@perex.cz>,
        "'Takashi Iwai'" <tiwai@suse.com>, <linux-sound@vger.kernel.org>,
        <patches@opensource.cirrus.com>, <linux-kernel@vger.kernel.org>
References: <20260709214414.8461-1-skbotnl@disroot.org> <87pl0owccc.wl-tiwai@suse.de>
In-Reply-To: <87pl0owccc.wl-tiwai@suse.de>
Subject: RE: [PATCH v2] ALSA: hda: cs35l41: Support HP OmniBook 7 Laptop 16-bh0xxx
Date: Wed, 15 Jul 2026 17:13:49 +0100
Message-ID: <003701dd1474$ebe66650$c3b332f0$@opensource.cirrus.com>
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
Thread-Index: AQMURuue21vLvqRUo1z03WmpmJ0k7AKzyg7as+q9UrA=
Content-Language: en-gb
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FF:EE_|IA1PR19MB6130:EE_
X-MS-Office365-Filtering-Correlation-Id: f4aa2a40-b3d0-4ee8-682d-08dee28c0f02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|61400799027|376014|82310400026|36860700016|13003099007|4143699003|6133799003|10067099003|16102099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	DXfT9PCU31yeIbuvnnqFdmJ2eJRA/cPjHrzsn7ibK0o2HNdbxlwrbKsANLvjEL462eCMvjDyAsSrOyS4gGkg9plFFZNMSGerSDWBQfpfwFKNeyKHhyTJTy/i0kE/LkOqc5MPjlv50lZYtzI513SdqSNM9MV89icnJTD6wgHzOw6rEs6zx32wdTM0VKIsx951hy4QxgSUbMz/t25CyCeG/mLEDNfu8hYIIk9ZVwac6URynM+Pn6rcGPxqmMgAUKJ5rW/6uJSK0thgWtZAJsYQ9og/4MpvlwvgC8jn/hXVLCmn2KaeqJLVc8GnsCtDpbfy/siOZjNp86bz0h/ZDa2ASGgC8AMXlTmrTJfJO4ChFD31hPyMTTTFleEJF68PpYHXYvjMNB0LQ9SVcah02YoaseGlVkGflMuuxozRTrkpG4SavbDEosyTnVUPmFsvdt9P29I+NYbC0vP0vXVoGbTB01vj+qAEel1/myYaGKkEWOgyE9mzD54InBXaQlm9zk7FiRdruGzTCqLSgDG1gCP73D+wtgYnYN9d+d26fpLjdJWS5Iy9NIp4MAkBI8jKj4oC4HkAAOgtmef4A5oJSskig6/i/KYJV8haBsxU7uTadD9lU9lYMnpRVd3D7XoyBRBeCZUVm/IYMp+T71Scd8eMOw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(61400799027)(376014)(82310400026)(36860700016)(13003099007)(4143699003)(6133799003)(10067099003)(16102099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	E2s+23vCALg+y/0nZfdzA9SGqKx0Fzpdpd6FTtK4RyYL8JCgh7Ehn1noJ1MO5y8sxyjn73EkdWomb0JG5kwVJUZJhCcbndDmgk96A7R+S4g0uPQZMAELl67jT+qzOuM+g4yE0Kbmfzhd3iytdAkiZmEyTAsQ/VHQYxNsx1cfiMpooEngMoX6+vMI0eDbHL514EDrheeqCQI92dLcsjaFnoHAAzVtXu1pLaJQ2AAEVqHdFN6aAPwWSBO5/Ar3YhyzM6tX5FyVeIQH6/YccZRUN1YyMxmREMce9bRK9pN6zCw7/030OeaQ0P0ZI5uHPim/fSXUXHAiZsI+yBOc0lbkX9OeRyjoBa2OU2Aj6Yuh7uqa6V5kY5E7Xw+7jeLL4kdHuRJ2m63uMlgIAOtlQCdyQKPAzcPCOXuYKcpXBLu0pWxhmigWaEPkKPIhINusaeas
X-Exchange-RoutingPolicyChecked:
	XaZMBSczA/2BpjqrXwyaSy6iOnl/zEhB+WjrFkbipBLelzNe9vhnESq169wFYeKgWTXnFr7MHoXNf0QcOrafzM/BMAcvUHguUgI/L0exGLzTudcOhFzA/nbhU4WeptrMaX9h+Vm1lSWeFSu3S+qGO+qHSdeJl6YXdCQk7siq9oxvEjH9cDMzfOEIMmuMvGq3DLnSBRFO9oMzxHh+5roSJepRKySwBMNiLuA6GrFZRWWpOllS0Yrf2Qo1zK5R4JdfkizSFMt5eEpU9HMioPHDaGqFNKCKtiiL2NC0ks3FQpb2CiiPnqW2fayyuTZzCgP0CQPb/NlRnqqIiiCAiBfrIQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 16:13:50.6260
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f4aa2a40-b3d0-4ee8-682d-08dee28c0f02
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL02EPF0001A0FF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR19MB6130
X-Authority-Analysis: v=2.4 cv=V71NF+ni c=1 sm=1 tr=0 ts=6a57b1c5 cx=c_pps
 a=kTZZPKNJDFewiw4iZ0IhzA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=VwQbUJbxAAAA:8 a=w1d2syhTAAAA:8 a=LpNgXrTXAAAA:8 a=iox4zFpeAAAA:8
 a=YHIB5vpSAAAA:8 a=pAiWtnzf_V_J4eouD4EA:9 a=CjuIK1q_8ugA:10
 a=LqOpv0_-CX5VL_7kjZO3:22 a=WzC6qhA0u3u7Ye7llzcV:22 a=SZc75Due3N3eFuSs_Jxe:22
X-Proofpoint-ORIG-GUID: F5svGJ0cLV5wbuTSEWvpIB25gV_fRrPq
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDE2MSBTYWx0ZWRfXxTyChBWRD6aR
 tBtDxMb0AsykROa14rn2hKkNJMV+TObxxaRBnBXXV+WjFFx4ae2MnC1sjLeZTldDZ9tp5CpIHHr
 sdieCkGOI0HVG/y268Lm4NR3SWkL9Rk=
X-Proofpoint-GUID: F5svGJ0cLV5wbuTSEWvpIB25gV_fRrPq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDE2MSBTYWx0ZWRfX9o3RPJB3/29d
 5PvvFLXThKhA++s16KvooEXHTM4tk8T3w3Uey6JcwxB1NTmtvDlhRkwAiSnsfRHQqy1swJbELKO
 Uf/WEg1PTrg+biDKWu4eYV4O5EILzvCE1GA5XLh1/XW13sVzRtYwN++r7DRcdkp/WJBH4pk6GcZ
 99tvHz43PR8MgD7sXsG/ERw0rCrNqU17s5dKTFkoCO3iAl0UqlcvQUGIQAyWGwh6puIDWtPDiNQ
 L5FdQi9mxBuI1g3S2zDpszlJXU4ZRDrrRKK12ZmoKh5K2A/H3c7+ZkzVEg+vMDgpZs+SnH9C3YZ
 Qo9sV+n5G3kZRupw8wAvpcj3t440cZaBgwycnAzaF07n14qoNO90InaxuIMwhk14efwnPeXJQ8L
 9fc9RqC01Jvvc9dOpTDIf7PRfsqzT+QFvpXJf/KJDroTV5myeFNjL/8pUxROXF53D3qD/mSLSrq
 iIMzqqWTyrqD6+7xtmQ==
X-Proofpoint-Spam-Reason: safe

Hi Takashi,

Yes, this is one of the laptops with malformed ACPI.

Thanks,
Stefan

> -----Original Message-----
> From: Takashi Iwai <tiwai@suse.de>
> Sent: Wednesday, July 15, 2026 3:35 PM
> To: Stefan Binding <sbinding@opensource.cirrus.com>
> Cc: Sven Jans <skbotnl@disroot.org>; David Rhodes
> <david.rhodes@cirrus.com>; Richard Fitzgerald <rf@opensource.cirrus.com>;
> Jaroslav Kysela <perex@perex.cz>; Takashi Iwai <tiwai@suse.com>; linux-
> sound@vger.kernel.org; patches@opensource.cirrus.com; linux-
> kernel@vger.kernel.org
> Subject: Re: [PATCH v2] ALSA: hda: cs35l41: Support HP OmniBook 7 Laptop
> 16-bh0xxx
> 
> On Thu, 09 Jul 2026 23:43:53 +0200,
> Sven Jans wrote:
> >
> > The laptop has a malformed _DSD which causes the cirrus,dev-index
> > property to fail to parse, so it needs to be supported using the
> > configuration table.
> >
> > Signed-off-by: Sven Jans <skbotnl@disroot.org>
> > ---
> > Resubmission, discussion of the previous submission stalled.
> > The values are equal to the values reported in the _DSD.
> > You can find my ACPI dump to verify here:
> > https://bugzilla.kernel.org/attachment.cgi?id=310050
> > Link to v1:
> > https://lore.kernel.org/linux-sound/20260506181807.22547-1-
> skbotnl@dis
> > root.org/
> 
> Stefan, is this also one of models with odd firmware?
> 
> 
> thanks,
> 
> Takashi
> 
> >
> >  sound/hda/codecs/side-codecs/cs35l41_hda_property.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/sound/hda/codecs/side-codecs/cs35l41_hda_property.c
> > b/sound/hda/codecs/side-codecs/cs35l41_hda_property.c
> > index 416d7bf3e289..e14a87336478 100644
> > --- a/sound/hda/codecs/side-codecs/cs35l41_hda_property.c
> > +++ b/sound/hda/codecs/side-codecs/cs35l41_hda_property.c
> > @@ -85,6 +85,7 @@ static const struct cs35l41_config
> cs35l41_config_table[] = {
> >  	{ "103C8C51", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 },
> 0, 1, -1, 1000, 4100, 24 },
> >  	{ "103C8CDD", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 },
> 0, 1, -1, 1000, 4100, 24 },
> >  	{ "103C8CDE", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 },
> 0,
> > 1, -1, 1000, 3900, 24 },
> > +	{ "103C8E60", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 },
> 0,
> > +1, -1, 1000, 4500, 24 },
> >  	{ "104312AF", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 },
> 1, 2, 0, 1000, 4500, 24 },
> >  	{ "10431433", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 },
> 0, 1, -1, 1000, 4500, 24 },
> >  	{ "10431463", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 },
> 0,
> > 1, -1, 1000, 4500, 24 }, @@ -511,6 +512,7 @@ static const struct
> cs35l41_prop_model cs35l41_prop_model_table[] = {
> >  	{ "CSC3551", "103C8C6A", hp_i2c_int_2amp_dual_spkid },
> >  	{ "CSC3551", "103C8CDD", generic_dsd_config },
> >  	{ "CSC3551", "103C8CDE", generic_dsd_config },
> > +	{ "CSC3551", "103C8E60", generic_dsd_config },
> >  	{ "CSC3551", "104312AF", generic_dsd_config },
> >  	{ "CSC3551", "10431433", generic_dsd_config },
> >  	{ "CSC3551", "10431463", generic_dsd_config },
> > --
> > 2.55.0
> >

