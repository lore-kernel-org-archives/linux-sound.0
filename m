Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E01F347BC4;
	Fri,  5 Dec 2025 15:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764947216; cv=fail; b=EffFsrx2By3F3tFFCaGz4QJb4bdyV7MqUv4FlksRgcsDRosR+iIZ4MfxiEcDuT7JtT2XzlTm3FNddiuGBx3GZd05CRAoh4R7U+ZYzrnYFuOfs5hMUdtsk9ZLOM4Wg57mp8S2Ga4/ddOpWMu9D0pVrW8FnYie8g52Msp4GBZ+peE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764947216; c=relaxed/simple;
	bh=1be331rpJ0IcZrUBYhtLH0NL6fOzHwyv5uL91YAYRUM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=COmc7T+dqDl22+7UQgYLX3Xe75I463XQ25qyA2ngQ6naLOaiFVj8u+xajex3vyOYO6m+dAZ59QhBbIxzsmEizNoBudzmDENFIpDyjDruCvdYU8j6bV7zvp5nja8VJn18Wz5z823akZlj55c0wxMxaWuFTtbbqwsHPuZXulkp76I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=O3FFqGAc; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=EMQEgcsi; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="O3FFqGAc";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="EMQEgcsi"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B5Dnpwt4121520;
	Fri, 5 Dec 2025 09:06:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=JPvS2lHCRjL6p7A3dau/mcGnSQPo1RoRI+Tkf0uNmjI=; b=
	O3FFqGAcCjp2E8i25IS941GaFR8Mls6Jn8s3hjtZCuOZ1HEl6Nrpm2t/f4PZUATA
	biMB699uNyUou3SCAH6CN4T1+8J1ftHNSJP0b80v1H6CnCwRcwyBf4zfAPpmx67s
	Q9uh0Vh7iV/kF7HZmT6V9BDOdka76o+jON8/OHSFDbE7kQFk44ZqWQMl/VRo+DOI
	lz7wMOoVr3unGVPjPwRj2dhS3NLnRgPFWAjncLC4XxD7u/j3djXB5lgGwKK00p3R
	RQeav9OVSB/vO6HFYsrPlbDbYX+WO9ddIMEx7v2G5udBsAWlwVlX8AOzLidXi3ua
	Tl2KLSND8h1N5HQp9ulANg==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11023097.outbound.protection.outlook.com [40.107.201.97])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4av0md82ub-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 05 Dec 2025 09:06:37 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gP+jAgCtEkWLj7IoEd22/kLrqdp2curmHUQ9ETALVhBzQCNv1/jXK74QgkcJP/22YzDKSLGslPCS06ITqKm9/DGf9B4jyDOQq/mp6Sn6Ewk7teG+A8C7Y3iwWGZihL9aeZcDquPAo5GJI+ki0Zew1IsQOW/7iDRWjzpDtSSvifo/zM42lueuxL52d/fnuLuaY4lm1DAtsxyc00SNIwufzcvLW4QZhhDloMGxORpnGzaPybr1FlAWGFmBHF+yPHYGWelMkzWmWMz3bcVQP4wlgjFbeokTA+hlA9aFy3YYwjwT1YFegu2C56Yu19wabwAZDN7Xx9xtIVqRz+fYZqockA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JPvS2lHCRjL6p7A3dau/mcGnSQPo1RoRI+Tkf0uNmjI=;
 b=q3Lg5WlS+jenJd8NddpWFIRGbC9+0UE9vS3VfgdX+UUmEkvVHj9qibhi2grAzOCU1ZX4up880aO+fO1BIR6Mcpdiy4Zw0kkEnIEVASpJnMNyQufBlnpcwnHh6ZAavYRm5hS+2VMib2QdKGuqim9VKMZksGHW2y/c4qlyj7nyz5gSq2fiQ6oXjybpwV1EY2253zWS2n5vYNpepf8OGmKd+eqDppRAPKXHoj7T2Wx86pPYSs0f+jfq/UP54MDLeu/3MhJXZbLOIh5p7TFyGlL62+9r96aV1eLsFlmvGY7bCBciD0tMqDjC0P9aVj/XMOfZBJJVkNJ5t8yd5+WRd/dUaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JPvS2lHCRjL6p7A3dau/mcGnSQPo1RoRI+Tkf0uNmjI=;
 b=EMQEgcsiVM2fCTm6S7EoE5E0rkC22yakyidVL+Jln9cktX5resNQkamR6zwnJFci/XThVoCDZoBHMyCR8dSxUr390QhYFqPbGYPv5n2ssfD1HhATw80YO2IuL+zA89qek57t+b6aPWoqH6kIxryPFz9mPDjIQl/ehK5hgycuj6I=
Received: from BN9PR03CA0467.namprd03.prod.outlook.com (2603:10b6:408:139::22)
 by IA1PR19MB8289.namprd19.prod.outlook.com (2603:10b6:208:3ef::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Fri, 5 Dec
 2025 15:06:33 +0000
Received: from BN2PEPF000044A7.namprd04.prod.outlook.com
 (2603:10b6:408:139:cafe::83) by BN9PR03CA0467.outlook.office365.com
 (2603:10b6:408:139::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.11 via Frontend Transport; Fri,
 5 Dec 2025 15:06:30 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN2PEPF000044A7.mail.protection.outlook.com (10.167.243.101) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.8
 via Frontend Transport; Fri, 5 Dec 2025 15:06:33 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id B95D4406543;
	Fri,  5 Dec 2025 15:06:31 +0000 (UTC)
Received: from lonswws02.ad.cirrus.com (lonswws02.ad.cirrus.com [198.90.188.42])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 8CAE382254B;
	Fri,  5 Dec 2025 15:06:31 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com,
        Stefan Binding <sbinding@opensource.cirrus.com>
Subject: [PATCH v1 1/2] ALSA: hda/realtek: Add support for HP Turbine Laptops
Date: Fri,  5 Dec 2025 15:05:54 +0000
Message-ID: <20251205150614.49590-2-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251205150614.49590-1-sbinding@opensource.cirrus.com>
References: <20251205150614.49590-1-sbinding@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A7:EE_|IA1PR19MB8289:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: de304a16-b731-47ed-d29d-08de340fe0c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5i09TH2Kf8fXQ2at8v+pjrHGETMsaHhRJLMjGNH48JWp7YcpbRUQXZ75diI1?=
 =?us-ascii?Q?Kvpb1I7xqfnA2RXUdu6YWFDLzB8ErkSXfId8LfHfR3v0VacAxXpDjZYwRbPZ?=
 =?us-ascii?Q?6V1Lk0jlfe7sc3LeiE1lVO0DMOpRfNwidXUcQiNhFM4GzAluWbqJHR441vv6?=
 =?us-ascii?Q?WUfCRRGby41ZGawBRO27MICL49WGFtbckXvqFrKm76xiU24Rz5JT1f7R7o73?=
 =?us-ascii?Q?U6K0YBNWNbqxr0sPbarTAovymkMO7pmr0xjoaVtoqbM4tny5HgAGwj7zvKeh?=
 =?us-ascii?Q?icq4B28bq7sgzp5HUHf+WBQg5EQanm+fG7y0rzzSsy0bI1FgWIuIE5PPo+Tg?=
 =?us-ascii?Q?4EbUueHvCKfswBYigQFa+rw1q/Y7bpVTFG2rc6UUxvFYow3vOyHHIDvvVunq?=
 =?us-ascii?Q?pIfK1s9TV/dedheeb8Jy4aTmLEqz5VHjaxx3mojmuN6NsOW71t3OGJIEFUiF?=
 =?us-ascii?Q?KW2v7Ue+WRJO6UAN8dbG4YHdem37XYXODJimQDoBJCV+juO049fcjdVFoKjd?=
 =?us-ascii?Q?2MfTThiw3J89ulrHRBx94ty8eWQx3mHFaNwZrLz0SMg3aqMmlhNLGpHCixFj?=
 =?us-ascii?Q?uQbMOk1adiAp5nqGYmkVmBKKDBGuCrqJFZmPZOKMye5FIdxHylYbW4+VO6nI?=
 =?us-ascii?Q?aQBuIW4mNjit6oac2Ei0RDKYHNX3DjXXw5cEOYjO/Bhn14ZqVXgPEeytJZKF?=
 =?us-ascii?Q?/ZGlmCDpsR4jHFlOuMGo8JXZXUEtKlQBCJAyUNa9rfgnFALI3GAbdlTDVCID?=
 =?us-ascii?Q?Gm30h/r1Sn+uz7zoqt1gUh4DTpFYW8dbM0rPXjrY3UK6x1jvcR/rUIJTrE5y?=
 =?us-ascii?Q?KA3LxGLoSobwK+dDqyhr0TNyzBVkgbBq47VPrPQ/enlA59krhVB5ff0To1Yk?=
 =?us-ascii?Q?nU2sn65istdJpzSH1HY+T21r7ab6wUOOiSJGf/xqf/ntz3zMO2NSNTCBxIQo?=
 =?us-ascii?Q?9vWfsr0nitv3ul1U8OnD4wg25ncqDIvFPeSwAIL/GTlOzPMTwrMtWEL99AdC?=
 =?us-ascii?Q?I4x++bbSYfX8pwXff4uAgEG68BT54vttSOxIK3Dq/AFyibMq96BbKpJmj8al?=
 =?us-ascii?Q?lkCQVWSwU4dyyZzo6t0rDMbDxlNx2TaVWJqVjKlkUvSLzqHz5s/CnI81mnua?=
 =?us-ascii?Q?q6IPugc0J6FfFYvpOwjPaMPi5E3rjSkiznXEVVW5r4COTsXunep99mrAOAoS?=
 =?us-ascii?Q?M/Z0c6Cp4fqvcMTJlrsgVPtwczuReuxbB4PCcIeDlDWfvSN60RleicPAs8ac?=
 =?us-ascii?Q?5zApUbg5BUE7BjG/u/ih4QkKcHGMvRSMif4YO1oAIO/mryPRIsSLuJfh4n3B?=
 =?us-ascii?Q?nacYraxcymKjfAY+sGU52d370w2kF+0JFKpIcP1DcWQUdVMRQpBHRvr16SYB?=
 =?us-ascii?Q?1DBPCXDkblft5yjU9U4ujBvKrRPkXX59bFJO/LyrJSkY6aMTWo9bMhObP0Df?=
 =?us-ascii?Q?vv186VqzVXohIxHOzjiEvEbeFe4zAMyCbFw34CYBykYwWHRv14jt7CEIQglb?=
 =?us-ascii?Q?hHGegKa6AlDx7BxYeJY+X7W5B/3diRSSUwh0qd0hP5U10d16XWtgGzoPC6JO?=
 =?us-ascii?Q?P79gQ5zQ5WPasQ1elPo=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 15:06:33.1272
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de304a16-b731-47ed-d29d-08de340fe0c6
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN2PEPF000044A7.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR19MB8289
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDEwOSBTYWx0ZWRfX6ZpwFRGIhPiF
 S9ImTAUw7t+5Dmc4ojn/L5nTMWbSKiEdPKgfWeVLud4XzWA8Vb3M/wU1T8yeT9ZSTfGvGnulABg
 wGKSlohOlpWKNtTsO8KyQ+tkemlt+ZaccITkaoPMgN9MtAIXIVsCblRGgTMmas9qyAatQTRxhs3
 OjoFY8NT8PPv4wh+FoA7LZCHqwtFO6OA5YPiFDKotExRJEPXIus/GHIdi62uJiQnRxAu/l3IjZd
 UXwod6GWod9fmj6u5dK1y1vQ1Be4GQyqpJz/iRWQH3U90d3tmkqDxX4JfX1fyNypQoP5kltKPGa
 ovOnKAbd2CC9OgYvZhvjfyl6fhlX6CVYNTkix2MOXZkIpGsM+KKNJW++TtoxlWrfr2EVili7/sj
 YEPL9iZaDnz7QDqYNF42cRIBJMrRHA==
X-Authority-Analysis: v=2.4 cv=cJ3tc1eN c=1 sm=1 tr=0 ts=6932f4fd cx=c_pps
 a=XVr+MSEQQxWnM56OsALW2Q==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=AhKRtg19bS0z-_xsk54A:9
X-Proofpoint-ORIG-GUID: oKoHmgEJGKpUrUNfQ61Jm5LxNCGYtYV0
X-Proofpoint-GUID: oKoHmgEJGKpUrUNfQ61Jm5LxNCGYtYV0
X-Proofpoint-Spam-Reason: safe

Laptops use 2 CS35L41 Amps with HDA, using Internal boost, with I2C

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 sound/hda/codecs/realtek/alc269.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index d90a6c01f63b..0172ff22f5ea 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -6770,6 +6770,8 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8e60, "HP Trekker ", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8e61, "HP Trekker ", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8e62, "HP Trekker ", ALC287_FIXUP_CS35L41_I2C_2),
+	SND_PCI_QUIRK(0x103c, 0x8e9d, "HP 17 Turbine OmniBook X UMA", ALC287_FIXUP_CS35L41_I2C_2),
+	SND_PCI_QUIRK(0x103c, 0x8e9e, "HP 17 Turbine OmniBook X UMA", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8eb6, "HP Abe A6U", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_GPIO),
 	SND_PCI_QUIRK(0x103c, 0x8eb7, "HP Abe A6U", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_GPIO),
 	SND_PCI_QUIRK(0x103c, 0x8eb8, "HP Abe A6U", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_GPIO),
-- 
2.43.0

