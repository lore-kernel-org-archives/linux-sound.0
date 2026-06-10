Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B00A0314D1A;
	Wed, 10 Jun 2026 16:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781108733; cv=fail; b=YcH8pJ3LSEv+wtPEKrf74pq2MMzgdodsnqlaKhK5lHEpauwHm7pVolzYUPeLW0FpWRiKxcY2yrgkn04MuCOGkkWbzk/RpSVA22XKlb+lzEXbPhDV7V1IpruRYigYCTa1ANEwMrzddNwRShTcIP3Ex9vKF5Fj1VU5kCXdWkcV88Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781108733; c=relaxed/simple;
	bh=ikGxztNl6Mxy0oyxptPKo6PODJVFcX/Heqg6Gd1MwNE=;
	h=From:To:Cc:References:In-Reply-To:Subject:Date:Message-ID:
	 MIME-Version:Content-Type; b=ef3rkiOZM/EE7a6nV+cj+30dTAitOqI3mhs2D/EDd2tAWUuZYVOTAr+G5SpU4i1GtVGUn0ZooFWItZZ5T0W7VPAJ+mr09IeUGj6lIi0jfwhiJJq//0YutEAA2r1KvzO18v0cCcTvPAdQPUh/lwjMJ6iQdSQW2qmCSY5vQX/xCpg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=GAU9i05s; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=GTSkLDNX; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="GAU9i05s";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="GTSkLDNX"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65AEN7eN1304981;
	Wed, 10 Jun 2026 11:25:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=9NrVF3zwwhXLGOYJ8jjJjZ3FTdxzffVKhP8N+YGUToM=; b=
	GAU9i05sl/ZIJq01fOsn1rpGos7iCQs1+ZsiWtecGs3gH0TMeqmmBuP225l5dCAt
	TwuaupOgejFA64+0vkC1WlFS7+nheogaNQ8TQDBJc5EmkNnfNtM6CeZTeel6ozBA
	kaMXzSfc0PIyNlIGT/bOZnd7dAtzZp+hvs06ZaeUVjt43lV11UlzsS+lEngSU15h
	T6L7zKtKXH+VhhGnAlMLYVE0ofJ/KUbAIJuKUk7NI36IXxu93dfKtEUjXk2vTxcj
	BP/q2ge3GvnErSSYo3TUFn2nrO5J4Eg4obEhu4xHvlpdJtkSykQzPz6u3JAyD3YL
	i0rJxDz1OYPe0sCxHljiAw==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11022113.outbound.protection.outlook.com [40.107.209.113])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4emgy0ecyu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 10 Jun 2026 11:25:14 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qM3v7/pCS1TPKyv2y4giDuFfJbswwp4cjWBzYb0HYj9pppEKH8ybPiD4w72GObCrNWI7niCTHrLFud1E8XPM5GPoXQ1n9YrhtYj9crJtxdsOUCpD5ZeA2KciKB91Y674pIk0TshYbBF1EcqbJea18Boa/VFcx7MuyjSx7W1eHJnd6qFA17kbgLnVXslhasaBzrjfSwVL19deotvQKM7DhT8eZx1+8X/VNnvVWk2SzH+6JHwEmnmymIsl28XL5tpPXs/Cy8Usb9dcZqJk+ABSEv8oIErF1ECkrZoCWHE+xzib8ieOAFEW6ANXbqFxPC2U+Li7Qwgg4/qo/h4Ui7jBgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9NrVF3zwwhXLGOYJ8jjJjZ3FTdxzffVKhP8N+YGUToM=;
 b=t6yJeg79lgAYXIKxIBzYCBWClkuboR7c8q2UF7JcvY2q//E73QFG5lSRr3GOmRpGA4r2eao0PyUrY0D4/hDhgXCz19JtpL74Xw5KN7/K7v/vqkNpu+pfQqXAnyonY7w51fFkJMr/g/pVZaKd2+SIxlf+L5ejP4P/k9Tr1cmJRxosbGT9kEeKKZMSBysKm76SIlD1IJ85XivIy0I/383nfBkJ34rCh6Dj/y0+/74cpXEekIDyMxP18Vp9gPSu/yco4C2v3MjtgXxQ1nzQ9csOdPOUNg7EgJskeQSb8OzswVkT9tT7nm2u/8Tntf1VUdYmJFtKYTnvzW0p5WGe6VR5AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9NrVF3zwwhXLGOYJ8jjJjZ3FTdxzffVKhP8N+YGUToM=;
 b=GTSkLDNXK3LcS3OldmPbvuOe55c6WvCP6GS4G3L5n//8AMYM97h+PJP1dlrp7DsWJrInrlk5beSVqMgShYN39XeNxb80D8xCZZwCnL9fEFl598uUbsrC+uzOogxTkNNlqSClp4voiqRs9yILVJe4qbrsmLDmmHNl3JtvaeyVPTs=
Received: from SA1PR03CA0023.namprd03.prod.outlook.com (2603:10b6:806:2d3::28)
 by IA1PR19MB7709.namprd19.prod.outlook.com (2603:10b6:208:3d8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Wed, 10 Jun
 2026 16:25:10 +0000
Received: from SA2PEPF00003AE5.namprd02.prod.outlook.com
 (2603:10b6:806:2d3:cafe::3c) by SA1PR03CA0023.outlook.office365.com
 (2603:10b6:806:2d3::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.12 via Frontend Transport; Wed,
 10 Jun 2026 16:25:10 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SA2PEPF00003AE5.mail.protection.outlook.com (10.167.248.5) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.7
 via Frontend Transport; Wed, 10 Jun 2026 16:25:08 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 1A34D406544;
	Wed, 10 Jun 2026 16:25:07 +0000 (UTC)
Received: from LONNCK4V044 (LONNCK4V044.ad.cirrus.com [198.61.68.151])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id C0710822549;
	Wed, 10 Jun 2026 16:25:06 +0000 (UTC)
From: "Stefan Binding \(Opensource\)" <sbinding@opensource.cirrus.com>
To: "'Marco Scardovi'" <scardracs@disroot.org>, <david.rhodes@cirrus.com>,
        <rf@opensource.cirrus.com>, <perex@perex.cz>, <tiwai@suse.com>
Cc: <linux-sound@vger.kernel.org>, <patches@opensource.cirrus.com>,
        <linux-kernel@vger.kernel.org>
References: <20260610155701.118313-1-scardracs@disroot.org>
In-Reply-To: <20260610155701.118313-1-scardracs@disroot.org>
Subject: RE: [PATCH] ALSA: hda: cs35l41: Add SSID quirk for ASUS ROG Strix G16 G614PR
Date: Wed, 10 Jun 2026 17:25:06 +0100
Message-ID: <004301dcf8f5$b3186a70$19493f50$@opensource.cirrus.com>
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
Thread-Index: AQKm5iUg9a/2brl2lJaEm/+DuNmfmLSkHUmA
Content-Language: en-gb
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE5:EE_|IA1PR19MB7709:EE_
X-MS-Office365-Filtering-Correlation-Id: 544edb14-d1fc-46a1-1b2f-08dec70cd689
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|376014|36860700016|61400799027|13003099007|16102099003|18002099003|3023799007|22082099003|11063799006|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info:
	uXaJzJkRe70M06d0rHB9tCASJ2d8otoZ7sxM+TGDKeq1S8ABo4XS8k3hHyiam7AexQ7jLihJCorNL6VVamoQtkMLzOPfoXSNDX4o1Y/7o4SXhe/oPOL1pkkXZZB3GI/OPWm9LSU3WqPd50aMi2QASsJhn0NW/rl+tqnkayuCnNRjQW91JUaNyK1DZy/+cI/yArfLfWc0FyMfkuNXNQyPMG+rPcyWSTfZtV4MjuAQB9DUnqVlvDQQubJ+tOgndS5yJ/AWer7VBEsQZbaMHGg4iNlgllzrgFiW3QI68YU0apOw0p+0YzCMRZ5e1bAFt1r7p8O2D6okQUF7jaEgzL+RfRsiC1tQKrFlX0y1wqIS114Gylv+PVDpSmKBAvWiCa3YkGgc1XNIiCkd0BjA/hKyfmZY4pRw5jqOj0TdsGtjHYkJVwyu/D8o464mv9KkUDVs059JlnarZfUN31keZWbqaVXcjA0b5QrsuodEjknpev6MN9GRu5WDo7fVLRxi3ti+mJIA/lKSEKZOf5nNRkEfyAfJsMF/T18OHyncRbxiyYF5g8HYV9Hx/RlVOoTnidADnx7FnSK9sQb8lglsQgI2VNGE5/g0UoyzJUHvSqaG/Npg03C95G86L91rT9tpB006s/+ksnMSLdcQ2rylQ3Tx7xjP6b3C1ljZplfzqfqMsKOz0ibeiahVeA/kVwQ6eL76
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(376014)(36860700016)(61400799027)(13003099007)(16102099003)(18002099003)(3023799007)(22082099003)(11063799006)(6133799003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	1kA5sA1pa/gRlv0ZpSPruTru1wSMEOCJcTddjGaNm5bdG4Jmz2VTVpWk1nFkiIkqpsEUvwe/GQ70pctzXOSleXmk3AsryLkmmaWXehapra5lt1MtXv27bo0ZJQEHeaDEGNvCJX/YFsrPxPkkP/NDGYKw0nWnvsQ+rJ4HBNwBPr1JQVpjZNdDSQXtUV1WcC9KDpidEoiUBQBHAfquMSP+TAR0NZcjnVPb8Y0uOXygtXdsHT1UxUh2dIeMm/7raNOsDIYPyWFbRsUxDS+vGPgHgGf10bdU8+r5FtvWt0qbsKA0WBQhyJW6iL/prAbh8KX05YgYoXcSB3ihXWLjLtvfnTeyYPYa30vsRW1zfp6AHPEKQyz5bc5ENbQA1B/H1EhCaOilBRDlszuMxnXHfRNJ9tT0cLoK10WKbnIFY+3EwNATFXM5xQaPqFcwtrvWUaNM
X-Exchange-RoutingPolicyChecked:
	Xa4ZEQ2HvpfrfJibwgbVahJhc9miGxJteKngqR3awYoYbdcUQ4FAEWjwTkdx4rHMxzKH9L/WI7HL7VKqo5VfmOWemAY0q+Kcjxcva/YyngkPqfv4vcwiWi8J9PEfT9vEtK6NQKaDEBghbuI3LUeiPBJmSfVNGIyEg9w4P8XA9OoI+mtZDHi2t703NIgHs4Yd2DIKspnHNUEwaEHs4rf5/i7N0ej+V9+letT7ezDKdBdmD8Y+y+YftVQVRaVRIFQeDMEVJEXC8e3ko8AzkIP26K+HqpG8bUKM+Gt0loI9GZPfHCbtpIyFN9hMigQxBlymHaCuhBaK02dIhjcenNeYFw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 16:25:08.3262
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 544edb14-d1fc-46a1-1b2f-08dec70cd689
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SA2PEPF00003AE5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR19MB7709
X-Authority-Analysis: v=2.4 cv=GP441ONK c=1 sm=1 tr=0 ts=6a298fea cx=c_pps
 a=PAagVXhlguM9sGT4qHQNdg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=VwQbUJbxAAAA:8 a=w1d2syhTAAAA:8 a=LpNgXrTXAAAA:8 a=iox4zFpeAAAA:8
 a=q8eAjEfMUTVzHogoDJYA:9 a=CjuIK1q_8ugA:10 a=LqOpv0_-CX5VL_7kjZO3:22
 a=WzC6qhA0u3u7Ye7llzcV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDE1NCBTYWx0ZWRfX1UEpjH3VwSxG
 qb/ulyGONLcseaU72FAbDNhynBOpDRiOJdUqak9wAa2iJQkS3hgVbBQ51107uauzIKolF79AH0E
 yvakYbr1u6RQr7XVCNgGFPazeDu8bwzOFTQ4et1Zr7DTx+uqEDGTWt7eJmxm8n6ku2rqO2PWln8
 lGoNie38iFMxcrItS6OKZYn1clueACwUrb7o0Ql7cGVzNESmk3ANBCEp02MhVVKT+a2dQ2fjk8k
 isA56OF5Z9adb/BcRvooHcEkfoktDmDiOGn7i6D91LiFjr3h/i8buyO/ZzOmXxjdBpJ6vQCll41
 kxnOQszLrqbpLVDmltqabQV/7/7mWjF9cNIriSGhYysCwSFRqEHyqwlGMX189f2HDOqmuaCMVlp
 9Z3DXY/LN09FIiOM67fvT4ss2xcNn4uPdpXUboP6IDK1s35rX+gfk6KiaKz2zdWe8klVIKsR6U8
 +G6M4ayGEzugUbs8i2g==
X-Proofpoint-ORIG-GUID: zySz40vsC0YLWkwONOjHDTg474bTOU2z
X-Proofpoint-GUID: zySz40vsC0YLWkwONOjHDTg474bTOU2z
X-Proofpoint-Spam-Reason: safe

Hi,

My understanding is that this laptop should have correct _DSD.
Can you please create a bugzilla ticket at the below address and CC Cirrus
Patches (patches@opensource.cirrus.com) to it, so we can investigate.

https://bugzilla.kernel.org/

Please attach an acpi dump and dmesg of the failure to the ticket.

Creating a public Bugzilla allows others with the same laptop to find
relevant information pertaining to this issue.

Thanks,
Stefan

> -----Original Message-----
> From: Marco Scardovi <scardracs@disroot.org>
> Sent: Wednesday, June 10, 2026 4:57 PM
> To: david.rhodes@cirrus.com; rf@opensource.cirrus.com; perex@perex.cz;
> tiwai@suse.com
> Cc: linux-sound@vger.kernel.org; patches@opensource.cirrus.com; linux-
> kernel@vger.kernel.org
> Subject: [PATCH] ALSA: hda: cs35l41: Add SSID quirk for ASUS ROG Strix G16
> G614PR
> 
> The ASUS ROG Strix G16 G614PR laptop (SSID: 1043:1074) uses I2C to connect
> two CS35L41 smart amplifiers, but its BIOS ACPI tables lack the necessary
_DSD
> properties to describe this hardware setup. This leads to the driver
failing to
> enable the amplifiers during boot, resulting in a -110 connection timeout:
> 
>     cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: Enable(1) failed: -110
> 
> Add the SSID quirk entry in cs35l41_config_table and
cs35l41_prop_model_table
> to provide the configuration override. The setup uses internal boost with
a 1.0 uH
> inductor, a peak current limit of
> 4.5 A, and a 24 uF capacitor. The GPIO indices used are 0 for the reset
GPIO and 1
> for the speaker ID GPIO.
> 
> Assisted-by: Antigravity:gemini-3.5-flash
> Signed-off-by: Marco Scardovi <scardracs@disroot.org>
> ---
>  sound/hda/codecs/side-codecs/cs35l41_hda_property.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/sound/hda/codecs/side-codecs/cs35l41_hda_property.c
> b/sound/hda/codecs/side-codecs/cs35l41_hda_property.c
> index 732ae534db36..4a3b14468dd8 100644
> --- a/sound/hda/codecs/side-codecs/cs35l41_hda_property.c
> +++ b/sound/hda/codecs/side-codecs/cs35l41_hda_property.c
> @@ -85,6 +85,7 @@ static const struct cs35l41_config
cs35l41_config_table[] = {
>  	{ "103C8C51", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0,
1,
> -1, 1000, 4100, 24 },
>  	{ "103C8CDD", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0,
1,
> -1, 1000, 4100, 24 },
>  	{ "103C8CDE", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0,
1,
> -1, 1000, 3900, 24 },
> +	{ "10431074", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0,
> +1, -1, 1000, 4500, 24 },
>  	{ "104312AF", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 1,
2,
> 0, 1000, 4500, 24 },
>  	{ "10431433", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0,
1,
> -1, 1000, 4500, 24 },
>  	{ "10431463", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0,
1,
> -1, 1000, 4500, 24 }, @@ -510,6 +511,7 @@ static const struct
> cs35l41_prop_model cs35l41_prop_model_table[] = {
>  	{ "CSC3551", "103C8C6A", hp_i2c_int_2amp_dual_spkid },
>  	{ "CSC3551", "103C8CDD", generic_dsd_config },
>  	{ "CSC3551", "103C8CDE", generic_dsd_config },
> +	{ "CSC3551", "10431074", generic_dsd_config },
>  	{ "CSC3551", "104312AF", generic_dsd_config },
>  	{ "CSC3551", "10431433", generic_dsd_config },
>  	{ "CSC3551", "10431463", generic_dsd_config },
> --
> 2.54.0
> 


