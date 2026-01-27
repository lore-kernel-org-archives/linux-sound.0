Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5EA235CBD2;
	Tue, 27 Jan 2026 15:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769528886; cv=fail; b=srIVLOpKJg5LNqZoeq460ZnlyCWa5XbpijxnwjPX4Vkds8AtsXHRy4AUb5JQ0UHCd8J1FO5d/1Fs7KH1Ugo1kC6xeKgUuxbj8NC2Zj+cguBKRTIf+GxiIT2WuSdQMjVXPkm/9ONgl5Aa7j85OZJRdPckIL8gngl63c6hEBveZw0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769528886; c=relaxed/simple;
	bh=MRU1j7HrJvHO10R/GP2/5LRZ/RsifhjqtkNx+7BAjW8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kYa4zGXR+ZawZA3OJOvg5ctxcsJnAUr0RLdMotIVsmDZIc0TwX69obsvvMGLihlJAODEpk883PhdANtZIzQuua1dSNEgC4AwOyECETJzya/Ch8s8Qef4RDRL/byuw6cU9MgaD1/26YWorYGzAKyYHdrXxAxLv6tAXToFL33ilwo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=KjfTWJAY; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=F+rSimbT; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="KjfTWJAY";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="F+rSimbT"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60R5wLhq002930;
	Tue, 27 Jan 2026 09:48:02 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=Ue5hHJOkW2GLSd/J
	Egjwu6EwKg8m1VgBAU4uWZzGTwM=; b=KjfTWJAYBI11SngzAguWbcoMEvH6633O
	A6DdsDFrRSJIJw/DwxmSXBdnBrRF5YASw39135sM9EC9JBx3h8sSIYZGv1DQY4yM
	3FcwXY+9XF10sXaN3HjcYOzfPHSrTEzr4K5mhd0TC9b8TAqPfgUWKcnfosXMOdUG
	ffBxuipvEiEKEGZR2tjGTJDXF6omyQVFBd7azOX6h7MUEFAfPzt6Iud41SrvrHON
	/PxO/yTtq8/+mxUyAfrNFX68kG8q3Er2P3X61TF3glCxj86PTlfeEDcE3xcZ/Mio
	bbiR7fOIUDe0r8Vi9c+6EmaLxkKlrbRL0rExXBi4esrLOPdclscdzQ==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11022094.outbound.protection.outlook.com [52.101.53.94])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4bvvc031tt-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 27 Jan 2026 09:48:02 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e8sbGd9b0DyPJknapiSCmGRCWLqTp/3hKtUNuTimDo1eWOPxP2auBVxeqW6PziwUHmhnJjoX52GCr9eH57hjwIqevKBV8QL8yAd7+uSNCGCS+3BW9GgvhehNojAFTCOl9B8Yh/AR0i5TvGxfzSXWE5ltIJCLwJF8WS+UKr4RZUOiNDOkdjcToKfFo+xk1UhF3WI0SW7P3ekwgmrX2AFSxFGbdObwNbGM9BpHBPFKOBcchcSDPtSl9aBZ6wE+gT/E9XSMgxEWMLpDTA6wG+SxOU31SKG0e2xKce5zAg3Ryl7y1+9nyEGucwSYXnz6IpL3cLGg/F1WNFFqdv5LAAfqsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ue5hHJOkW2GLSd/JEgjwu6EwKg8m1VgBAU4uWZzGTwM=;
 b=Idd8G5Wvn9wANmLn7ikgDH/2rlbHXlIQ5jgstDbHew32mO7326O058hvYV+Z5sHVX7PpRZCqbClLFdbpzzLjXp1vOBzqhAaNhDYuNNE9niWwIy+nURTpni3KEuJJLykLcH7YyzMMBJjk6wy0B2dAufsV6lE0K4qJ9C7UJSMBv0zwcIeg4XVrVoeZQru1CABIOvV38vn6d/RNCLBaLiJC5tGTRPaz8k9NQepRqdk72Z719YfUX7Hzug0ZP+ceXdsn76w61W9/1kbmqPl+QIgixjlq4NT7DcIQE/rAFgJQ3NWx3C2DeyI/Q4QHxplLEG9G6sgqeD//xsQK2xamO//ceg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ue5hHJOkW2GLSd/JEgjwu6EwKg8m1VgBAU4uWZzGTwM=;
 b=F+rSimbT+56UjHMWeDlA75YY59kuFSJWvUdSia4PkpxHaHZBgw0OpPzmf359mKFjRXTnWU2qMk1S5eH+5OkkDIzfqFeKCN1DpmLaKSrMbymnROIlmzk3/VYo9OBXjuPBeYP0+dM3PRNfRL874zwtaZj7I7zwXFUNNhBRF+37MA4=
Received: from IA1P220CA0013.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:464::17)
 by SA1PR19MB8827.namprd19.prod.outlook.com (2603:10b6:806:45c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Tue, 27 Jan
 2026 15:47:56 +0000
Received: from BL02EPF0002992E.namprd02.prod.outlook.com
 (2603:10b6:208:464:cafe::4a) by IA1P220CA0013.outlook.office365.com
 (2603:10b6:208:464::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.7 via Frontend Transport; Tue,
 27 Jan 2026 15:47:58 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL02EPF0002992E.mail.protection.outlook.com (10.167.249.59) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.3
 via Frontend Transport; Tue, 27 Jan 2026 15:47:55 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 94D0B406541;
	Tue, 27 Jan 2026 15:47:54 +0000 (UTC)
Received: from ediswws03.ad.cirrus.com (ediswws03.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 7DE5E820249;
	Tue, 27 Jan 2026 15:47:54 +0000 (UTC)
From: Maciej Strozek <mstrozek@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
        Maciej Strozek <mstrozek@opensource.cirrus.com>
Subject: [PATCH] ASoC: sof_sdw: Add a quirk for Lenovo laptop using sidecar amps with cs42l43
Date: Tue, 27 Jan 2026 15:47:38 +0000
Message-ID: <20260127154744.2583611-1-mstrozek@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0002992E:EE_|SA1PR19MB8827:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: daaddee5-e318-463b-1119-08de5dbb7071
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|61400799027|54012099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?58MBZ//9qnYri5b65wmbOT2SOjWtd2JXT+OpSRIXWE5c1O5emXYOg/IoYA2n?=
 =?us-ascii?Q?pBRyhTEUpQFeW9mBJpruFbyk72RWnuYRB2cS7DgEKssj4R3KGFPEOd3SngkQ?=
 =?us-ascii?Q?wxWQzjAAzgdkRkHjY1Y5ljeW5gjfHFeHafBXhKkvKcd5Hxnt+Rf0wzn7dn3i?=
 =?us-ascii?Q?4MmJ6aEzxMg5jL3l5LN4BFldu8mA8lKdIuuVs7exiE345ODjYRA6j5Gmh23l?=
 =?us-ascii?Q?z43+rSN1Xh41KugfaRTJrWH/MJTTwl8BOJ3jfCpLlgpRBGmxkvXIgVeaG+1r?=
 =?us-ascii?Q?QK7nnwAGAG3OgBWEOiqquuNpzkFUurB606TS34nGyn+DpXq4rYxV89zdX1ih?=
 =?us-ascii?Q?uHKLhdvb8FbUYutPBnot4vBo2FlOiN7XNm6uz9oTEnXthxha+5AD9UQKL3oG?=
 =?us-ascii?Q?XrTHyYhf/h6GtZ6cjq4brRKW6R8RzztU+oxYMs3nIhn9AKbkhiiAvp2UyU36?=
 =?us-ascii?Q?CJXImGM/oJv0khfDvUA/fztqFctr/OeTH24045czaUuQN0KVV11HVDIg9kSM?=
 =?us-ascii?Q?fYHzElrvEtS06FXdwTuIrJePKh4mfjXIm9jrk8DPUYLe4Pzn5oi6+mMtNsrV?=
 =?us-ascii?Q?h0VN7v78Gw/sniHFOnSMW2dkepPcPXt/ViFAn8Ux1XAmL/DD4ycva4TzP7SA?=
 =?us-ascii?Q?ZwJVFXuGv9CTbRsySPzdfC9YebrpY18pefn9hjq3rqVaR9lr3MiM8RRmsSrR?=
 =?us-ascii?Q?qITt31cuGDEuix4VyOcfoWHrF7zVmz3L3mm92o+tcl4HRogMcGvdVKb4fA5B?=
 =?us-ascii?Q?XvsXS0Kj79LVZwQoM9Nena8iKuSn4UkJ3DVnrV8FOZ5sh3Ayt5j3SEiSJTEo?=
 =?us-ascii?Q?67BRvo6VCf37wJp8vezCCbe7/tTyznsh11sfXXySmdgPzv6IcdwDaT/CPEzS?=
 =?us-ascii?Q?45YO/R7J/OK3YcwTZrygt4h0tS7yStjsZyqpdoLW0fJfdUmXvE8F0tCpeUd2?=
 =?us-ascii?Q?X1q5ptwjYYMO5NRPP/GTjRiQGaA30iMrWHSXbNLtKAkvF/XdBXlvSvOkGfIn?=
 =?us-ascii?Q?UUVk4yUGno/ffwrB2gyje6Ze3I0wFSg3eI3C/Tkv0ouAqcLLjVtDk2/6nW7f?=
 =?us-ascii?Q?z9nGS6lzvQPzTyFx0dr9CivozmnUN/va3l7yDutHk5fz60DA/QnVdJf51PP+?=
 =?us-ascii?Q?Py8mSB0QHWNANjmNAyX6GQBTTy8IbouG4Os+aFma+3SLtPyzQsfhHOfTgMuF?=
 =?us-ascii?Q?jVgdnHtaM+vKLiXSWVuWVznGDt3IF+2RQXNumYvRDVFShRqc4Qe5QlGYCrcF?=
 =?us-ascii?Q?QvuXCceT7vLmHZv5u8bFo6C6sRvkCKgqQZSTCz1mR4CLk+NEPHei7INPc4ly?=
 =?us-ascii?Q?S8v0gvb3PGg5R5vwzjSszb3huIqIASK/N0V/W7drY8S99vexvddcczetLrcM?=
 =?us-ascii?Q?67SoPgJC8HcMZnEJ6FAY4vkjTrrIzIxMASWXHyO97xOpndkKSQPmxptOKLPy?=
 =?us-ascii?Q?ufzPseF+UaPiHsR2Qudv/Xt/E3LD26bu1Tbtg1Y312nAuI4YrHRmSH0+vL6z?=
 =?us-ascii?Q?VIftXUKG8iG6VliUSoWROxwv0P7NfbFGWOsk5rfmjkTEgEfi08JKBnJe5aMC?=
 =?us-ascii?Q?xQLoZTtJBNjwNa/7dd31Itp9UHeGQISeb1NG5cj/zO66HbESpCYZlhbka57o?=
 =?us-ascii?Q?fOoFYMoTchwcWJwkoDaHlMf51R7u0+0OKYKMrgVDTUMdEoqyPUlpWIRRyPKo?=
 =?us-ascii?Q?0TFtkA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(61400799027)(54012099003);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 15:47:55.7854
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: daaddee5-e318-463b-1119-08de5dbb7071
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL02EPF0002992E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR19MB8827
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDEyOSBTYWx0ZWRfX3f74wNBltc5H
 yuK3fgGJPoOJc0v6DWqR1Ft8wFhqAaOB/S/REimgAk7AhP2AKIUZ+VL2YRjQTJ3LJh28+GndeUb
 EVThAtiyktBni3l2kHpEQ27O0BRUwWkAb5gTzOCdUq3c79eqiDs8lLxEmn0TFdlq4NwENiUQLq/
 oGHW/XfTBGaJvZRqB9IxntJIOWKmi21nqgNPEny1pxafWdqaFzhcILeH2BhidryiK7inFjljyDo
 0WOdaMJIfrV8+jT3VP0l/S8N3qxnZ1ojKU0QGf8EcXH6G762YE+gbranDeNvM4wm9mWXgCY+2Dj
 OsGJxNjMpM64WoZzoyHV1WMxVc+hoJ3xfHzz8/619s8Nai1jS4OC7DRKsmb8D65FwI1wCi803Wu
 uVgRSKKrqeKbbUgN8v5ZUWFvv2uPNnoik4j3eI8CQ2bZsJKjPsNX435j9Hqs1icT8UjdcQqLIZ4
 XIduUx8QnPO7bq4hasA==
X-Proofpoint-GUID: _yFszBs2E5QfPdz-9WIzyyNjFZZgfRDC
X-Authority-Analysis: v=2.4 cv=KvBAGGWN c=1 sm=1 tr=0 ts=6978de32 cx=c_pps
 a=TRl0foosKS0XhiK7bTG47Q==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=g7q0kSdTfiXSywdjglcA:9
X-Proofpoint-ORIG-GUID: _yFszBs2E5QfPdz-9WIzyyNjFZZgfRDC
X-Proofpoint-Spam-Reason: safe

SSID: 0x17aa3821

Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
---
 sound/soc/intel/boards/sof_sdw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 8721a098d53f1..50b838be24e95 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -838,6 +838,7 @@ static const struct snd_pci_quirk sof_sdw_ssid_quirk_table[] = {
 	SND_PCI_QUIRK(0x17aa, 0x2347, "Lenovo P16", SOC_SDW_CODEC_MIC),
 	SND_PCI_QUIRK(0x17aa, 0x2348, "Lenovo P16", SOC_SDW_CODEC_MIC),
 	SND_PCI_QUIRK(0x17aa, 0x2349, "Lenovo P1", SOC_SDW_CODEC_MIC),
+	SND_PCI_QUIRK(0x17aa, 0x3821, "Lenovo 0x3821", SOC_SDW_SIDECAR_AMPS),
 	{}
 };

--
2.47.3

