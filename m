Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A285C48BD3E;
	Tue,  5 May 2026 16:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777997508; cv=fail; b=sMSj2WiuLzyFY2ITMUjBsORIYHxoj/u44XY05T+G+olz+y99QMLoaHg0ZtczQVfGJY7rqyq9ulVHdlU6RwmQGPbFi4iWkwhQfThJbI2kr7ElncEeYVHeDs418r7cPlRXbgP7XcJwo43RmkMqGXOKrxin+QGyII4PSXcC4pbfWXU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777997508; c=relaxed/simple;
	bh=lhLFR09iPaTfdmbNZ/YySaZn9964TRBkzeI2d6oSF+s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iSjn0qepys7D7rsk5mw2/GP/b9vt/L5EQ2uwHYRXrdSqRgUxiquVb8HjH2CYglkKwI7jo7yXNURGHEhtn5AP8n3pZlL9SqXQZG/+0kTEU6vkJHwGm9ywRHbnqUWbA0UZLx7gSboDNCQdfPw3dqw5aAqc544nXIfYq//nNdAHnSE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=iTZ8Jl8l; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=bfTyBb42; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="iTZ8Jl8l";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="bfTyBb42"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6455nR0r1839970;
	Tue, 5 May 2026 11:11:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=usq3wMK1RLLrf9ayqHTvrbRFGFRZINZE2ucboBt8t/g=; b=
	iTZ8Jl8lmoMf5k9QkdsRBejlMT8x4I1GNzit61zDz2q/fzqlAcDd6nZ1ypfUFWC5
	fKHym6L93RAGtl83A/H7uUjOc//BVIvHCPmvpj4zJPa7ETVpFYwKkAQarZqGuHNv
	75qc71eQsUZDmsNls3SDCLUQP/t7YjFJ1c9KTLiF9rVCeLWFQPsV24yuThc7X71N
	RGHUGVsQ7aOG106fSXm5VRCSkVV/SaIcgI0epgJw+6Agrdqqe1i49lJkxN1lurR1
	flRqOQlSSLrNMAoddijy5merKmcraLM3ccDNPjrcx2rZMuzJbruV8oL4u2jfffhA
	mIoto9m2h0GPMzMNx1jUKw==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11020088.outbound.protection.outlook.com [40.93.198.88])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4dwep0utg5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 05 May 2026 11:11:33 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K+6NwY730+X7sllg72lwkQU4Tn8yi/BGlIS1owNJKktTnOIBKUDoIYvmBnJbDuTGxDSZySAfoHHlXBPvcS3MsdtNrF+EBWTDeg/vcx6n/MFaGo+CmAgPi4XqV5T4De5yXOa9Ltp1gJBZz2gD2LeStub2mtr15rcl3jqTenk5ZkYuvs1vnQltMy5Jn/Zcn95GsiRaw/3Zlr/PRdsXnXvNFmxb/fArNcr3G4i3iV6hi9jhC7JncV1vuTwsAlrjtboydPgkFDCVjxcdVcqfh1oJBCW0gmB2Fd0uMcL68WGBgdPXJRrEPwetjN/4UMst0b1AHDdgE/7ZULeHogWY+bHrug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=usq3wMK1RLLrf9ayqHTvrbRFGFRZINZE2ucboBt8t/g=;
 b=mU8IzCpGsij8SOewD1ABU9lzgIxv3LYadnlfXbuIKZLB2c/wIUB9bsfGn0UP0xTR0d9Xmr/hiLdJryYkb/CLUrTFp4o9McZYykSJle6Kjs+lVVjll1potUubUhcjx7RvW0yCR24KnmsqOdVzFC1296R+n6gqxaD0CBAgaH+XMctuKNYHtL8KNnGuhy4wG75LPnn8LUKDtrVLDGEfk73va9huAGjBLuHHR8ArknENvzDRtHx05tq8oBT/SrTUmOF7Io8+lLF1X92EFoizkcqP+HPzTp5l39ATLwwE00tD0P3KuZ2vRJE1yE80vsWOO7GGlq+/KI+5D4K1Nm3D5BgQCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=usq3wMK1RLLrf9ayqHTvrbRFGFRZINZE2ucboBt8t/g=;
 b=bfTyBb42qorMsQicectH2UcrRhyVpHDUjbLmQDIo3LeQ6vuODbMEvPJEfOJo6ucCaVlGAK0e6unSwzzpRUsYVqes2l/wDfJagcurfBQ0lRMGfHWJi0pXtE/2Cnt5mAIVZ8fBnfwH5UhIpvmEc2lOrRq8cAVz8mMmeR1TNze4U2E=
Received: from CH0PR03CA0414.namprd03.prod.outlook.com (2603:10b6:610:11b::32)
 by DS7PR19MB5925.namprd19.prod.outlook.com (2603:10b6:8:7c::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9870.27; Tue, 5 May 2026 16:11:27 +0000
Received: from DM2PEPF00003FC3.namprd04.prod.outlook.com
 (2603:10b6:610:11b:cafe::9) by CH0PR03CA0414.outlook.office365.com
 (2603:10b6:610:11b::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.25 via Frontend Transport; Tue,
 5 May 2026 16:11:27 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DM2PEPF00003FC3.mail.protection.outlook.com (10.167.23.21) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.9
 via Frontend Transport; Tue, 5 May 2026 16:11:26 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 0B9AD406554;
	Tue,  5 May 2026 16:11:25 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id F29F682024A;
	Tue,  5 May 2026 16:11:24 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v2 2/2] ASoC: cs35l56: Destroy workqueue in probe error path
Date: Tue,  5 May 2026 17:11:24 +0100
Message-ID: <20260505161124.3621000-3-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260505161124.3621000-1-rf@opensource.cirrus.com>
References: <20260505161124.3621000-1-rf@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM2PEPF00003FC3:EE_|DS7PR19MB5925:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 1a97358a-c815-426a-8f7d-08deaac0f5d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|36860700016|376014|82310400026|22082099003|56012099003|18002099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	TyQeQUP3owKFZBEIEEXDPRkCgcbgVQCJWngrqdDf66Gl5owI0Xg/XhZutsk5u+C436mqbPjgJOqX2rGMtC67CCWtxcfsWUOPQep3BqbJKfTqcQqOMVlAOmCNLuiHY//q/KccXMXg7nLrzxSxPq2Wy7vJjDr0tA8vzwoN0KrItAESH3kc5kYc75STlxX9CSm09jL8BA+lAHy7PYBGjfyu5I6waOaM0tECTLWTNSotQsfXzmVKfzpJbQdUozTyUdQZZJXFGQnUH3z4158xnpa3c3k/0QMgZ0GCeboy0IY+YWd+aMub8+s/LcUCq1bEweEJTIA5yBSAAVdF5RRcDEm/n6OcKy3dPk0e+buJ9H2ih8aNIPkJdojdUbgNnZrbSOpqCvxugI9enXFlfwY1DAOrkQDgufyF9MtAhrFy8VPEGvDNp7O1GPTfIfki8CGdvUTI/qWGeSOet99KwnxtCjPdfjinPfo34WDD38OaOdNZOeDkwfc96z4ooWzago+4a2zLRSM059ZeCph9oQzps+FhxAcY0VyX93MFq/br+nIZlXq9OzZXwIEsUM00v223WHpNp18ijbgtLCqTbV7tbUe8UDosqojO8xKkFoNgFX7lQ+boayfdgBebev/gqh7U5AGxbB6f6UYKoutmHIcfRQa2uQex5gabclB7IIBf0kaBqFkPM3Mv0sN0wj4SM8U7RWFDZI1Vn2Ypbu1xf1lluuWNE6/z3n2sK2B+VqkT8wjAObc=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(61400799027)(36860700016)(376014)(82310400026)(22082099003)(56012099003)(18002099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	e96Ogpe7twcXaIgYFij0X3VtnFYNI0tP90VJTA8IklDdP5YZIYzOk3FKpuqUMzQUiAGQk1KCmI+58zmRs9+WUXDM91b2tIPFT2e/4qgozcpe0Ry13l1dJxh9uGVCtmFJIvkHocfyUzExI/PZ/9zKoHdeetZJx+LlFfzzz7Y5LLrNXNyYUl6IcOyLKURl+hrcZnadI7GuA9Q7/UFfJxZORSIDM0ujxB7gxcffLkjInOBdAgTcSIeq0JI1TXL/qfibgVxSN6reb8unI5vSP/2uQY8n839oPHsBiAld086az3Bj8I49K2DJgbsh5shFPMh1yAdNgf/MCBYSVOgluAKGQo3gr3rwk28GxZfzB49oyuJl913zpqa5+oOGi8oCkK+fGYoZS498QAJFojAcvg2QJgglwhhyXml2bLYIcn3i9gJg8cwrMXKFFLpJxcWHBFTG
X-Exchange-RoutingPolicyChecked:
	GQ+kCyb2Kazi4YbLT1JE7976ty3NTibgoIJ0SFW5pGxEwDthXH0aLAO7SOGz7QscXmZI8aUB69x82eaBKuJYsfTf8IMLBEcCVEvXDCRnmn8wp77QZl3Q4kpKnv/KJTQUbd1qjDo2aA/2h8rE4oeQdQ9jTw3IdUPIRlwEPua4TYp5eOc/vCsT9MvHSLBQSVq8+p1NAddL/lyFphnPlVBYwJMu1i06oftr8jecOYdDUlVOiq7smd+/O0iFLvhpiBHu4rIUuNzW8F5dyRo19n0+e/pJlDl1e30uA6L5s9X8hrlHJ1TmETR0pYtuSpdYn4/L9Afh11BlW4d7Y4GX/76adA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 16:11:26.5474
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a97358a-c815-426a-8f7d-08deaac0f5d8
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DM2PEPF00003FC3.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR19MB5925
X-Proofpoint-ORIG-GUID: Sb3VcKUmtlc3Ul1mN1fV8Bw64CyK9CPD
X-Authority-Analysis: v=2.4 cv=fcCdDUQF c=1 sm=1 tr=0 ts=69fa16b5 cx=c_pps
 a=B4HvfKsIdAoZ9ZdT5gFWvw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=NGcC8JguVDcA:10 a=RWc_ulEos4gA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22 a=w1d2syhTAAAA:8
 a=xUhIR0su6rBK1gKWfMwA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDE1NiBTYWx0ZWRfX+brIKJ3LAdT4
 z2QhpH1Q65c5QB8DDSfBKkFC5p3dMeVOIlebaWc2gqeAXDMNd5/v+aJrSMxWsCqIhjCSQmwys+G
 Y4blItk4lAWSBdcs73ubjY4WyNFUrMyWBVnk/VlvjrFktXqnV5bYueLIcLAdSKqG8h3Vg52ODZK
 g3vfRlNhKxc7zOpm8+DflfNcgib/32cmRpWWQFXF07LMhiZtXiT9JLOJ0S/8l08wJKdWEOgJrkH
 ZnYH2la2XOsWxH81wZc5PB9S9FIum2Rk/7bKLjx6Di7sMVCWYT0oUymaU8VmpEddMK2OrHBJKNb
 XNR+VWDgGnlK3HPkARUsi9UGQ0MGHqoeE+2nRbZ3igNHnNQNzaVqapLH1tgtSkcq2rt8q4xlMNR
 3uD4woeDidomAQDj4AQ0wNq9T8Vb7CsyYaUEMSnbUoKuNhKvDh4cdhaegZ0JIUxMpTjp48ToWYa
 msUoeWwJ4SBqBkmMj/w==
X-Proofpoint-GUID: Sb3VcKUmtlc3Ul1mN1fV8Bw64CyK9CPD
X-Proofpoint-Spam-Reason: safe

The error path in cs35l56_common_probe() should call destroy_workqueue()
on the workqueue that was created by cs35l56_dsp_init().

Fixes: e49611252900 ("ASoC: cs35l56: Add driver for Cirrus Logic CS35L56")
Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
No changes from V1

 sound/soc/codecs/cs35l56.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index e847bb32af2e..849d70ca23d6 100644
--- a/sound/soc/codecs/cs35l56.c
+++ b/sound/soc/codecs/cs35l56.c
@@ -1970,6 +1970,9 @@ int cs35l56_common_probe(struct cs35l56_private *cs35l56)
 	gpiod_set_value_cansleep(cs35l56->base.reset_gpio, 0);
 	regulator_bulk_disable(ARRAY_SIZE(cs35l56->supplies), cs35l56->supplies);
 
+	if (cs35l56->dsp_wq)
+		destroy_workqueue(cs35l56->dsp_wq);
+
 	return ret;
 }
 EXPORT_SYMBOL_NS_GPL(cs35l56_common_probe, "SND_SOC_CS35L56_CORE");
-- 
2.47.3

