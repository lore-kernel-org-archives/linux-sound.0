Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5100B38F924
	for <linux-sound@vger.kernel.org>; Fri, 10 Apr 2026 10:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775817932; cv=fail; b=FQHrhTqQpOgsyuR4dN2JjX0W9herR97Ya91dcEatBdh1JVa9Cu2KaviyomootMRHgaryvXvmT0cdwaMvC7LlLUkbOaiqz9XTxojO8wZ6KjC8Lm+QJhnaY6QsWpp5ASckgpPblmf6nSSiDEDgXi7FrpdxItJZKwhAzxzm3tbvNfI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775817932; c=relaxed/simple;
	bh=OFp9jwUt2AtkvW/U6b0nOoDs5cien3dcgT892MyTKvg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=cZc/S2z3venlAHUf+OtR01EaqKiz/2NC+u5PbPeqDLFd+jsNr+qACmOd6VuO0gg0tey00C6YFTEJ/9wSiLjqHNicWY9GGgFDGF6ohNnqoNH8UGJHKOoMcjdxM04W+TY/lHfA2RaODF7KY+BTPMYn+a05g5uBNjn2Gz04N4/kq98=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=HEwf43BP; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=xSdAw8DF; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="HEwf43BP";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="xSdAw8DF"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63A5sFC41237476;
	Fri, 10 Apr 2026 05:45:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=JpzcQ/u7IvXajpfV
	XLo38LfHoBSoxXCLizbOcWyFjPk=; b=HEwf43BPG4HdLiJerr+wzOfHXxWznkZb
	IC3LQIxqxaIfei6MqBrMPRmegQ0JNrdUaKEiiXNkD3m2cYW9dlvFQxT4EM9oXcSc
	LYsOJOXObTYl8M+N2ePqXb35l6naP7KqqvUvjmYLYROMWwpsof9bQCIuyFwl98MQ
	7w13JYOlwdSIBMJMRsNGLI37Dih2qLdHIjIPVR7m2veTnoA01UEMvokWeWxzhRql
	1CkFZj+BnwuvpGDK5TLzj7Gnd0M3/xCeU6Dh1VZif2kqEf0SEKs/jBlDcMfvtVK+
	t1lh0p6dUuy/pGpehQ4xxIeGtSQxxQ0smsV5qk03DloTa6LdggmPug==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11021096.outbound.protection.outlook.com [40.93.194.96])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4dcmr7mue6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 10 Apr 2026 05:45:10 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w/Njbelf/0X0iEqQDDUiMbJsNHyb4TmkrHhD3PZSvGa4ipO5LVRxw0dzUAeWpB3Gs6/0ZvXloXMgvExdTtdB3erRdsfvsvCMD2QAQIGcpAaA6jNmaX3mbl3g1zmgwugMWx8Ffv4Q9w/E2mleFzRDIqYF8Kv84jegRiWcy+3gH5rGn1aft9kr8JDjliqeU5gV2IhnMmNMtQJ19kMQ8yBzQSHGcu3JXmspRP7wg4cA0gNRlGDpNzB07Xir04qPdH+HBH6zs5HaKrDoqKqxhCDG48lY+N5JjqrxJzGQTQnJSBNpPv0eHYxILalai/BvX6n+oP36Kt62WdYg75nWu1stZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JpzcQ/u7IvXajpfVXLo38LfHoBSoxXCLizbOcWyFjPk=;
 b=d/A7YU7BL6I7Nn/o9sjLl1no3lorv21PZFSx27lsQJqmJxBw2u1ni4jP55kSFMya3M3bNGW8gh9FZvoYrX5/KUroH43y4k+oWdGnb0dqL+8U1swWB/tSEOdEWYrP9/VIvD6BB62uJWaZOWs1IDblP3CAu3P3NIGz7DPAZ6VhkLDZObdmXqGW3RSgdFJ5jVxNoPc/bcRY+ZsPuJwSgabkCk6RY2AymeDR99JOymCk2Tz4EPFwTrHfKr0q4ypD3FMmmCj104QszviJ5BbbHlZenpxoaCOGA3i72+UMb3yv0w4Datmj5O8WUzT3gz1WTN+2W47n194tiyWoQDgUq/2u4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JpzcQ/u7IvXajpfVXLo38LfHoBSoxXCLizbOcWyFjPk=;
 b=xSdAw8DFBFknsSYUkYyJSfsWHHNfhHVs7X48At0cToPFBKaUMyheGYvERJGxO72Sd/FKNavVbiPCRD8ybKKYHHqfRs/COR7ss+H9Xbl2ByUEAJ3+Jh16F/pNGYtYrIiZCnZ1bl2RPpBn2XgSHdwv1CzWVlaEqRnZWOkqAmIyhfU=
Received: from PH7P222CA0016.NAMP222.PROD.OUTLOOK.COM (2603:10b6:510:33a::7)
 by SA6PR19MB997387.namprd19.prod.outlook.com (2603:10b6:806:450::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Fri, 10 Apr
 2026 10:45:05 +0000
Received: from SJ1PEPF000023D8.namprd21.prod.outlook.com
 (2603:10b6:510:33a:cafe::8f) by PH7P222CA0016.outlook.office365.com
 (2603:10b6:510:33a::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.42 via Frontend Transport; Fri,
 10 Apr 2026 10:45:04 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF000023D8.mail.protection.outlook.com (10.167.244.73) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9818.0
 via Frontend Transport; Fri, 10 Apr 2026 10:45:04 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 0D7A9406542;
	Fri, 10 Apr 2026 10:45:03 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id E911982024A;
	Fri, 10 Apr 2026 10:45:02 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH] ASoC: SDCA: Update text of FIXME
Date: Fri, 10 Apr 2026 11:45:00 +0100
Message-ID: <20260410104500.163337-1-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D8:EE_|SA6PR19MB997387:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 1e0d5544-cf9e-4a13-f2e0-08de96ee39db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|36860700016|376014|82310400026|16102099003|13003099007|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	EhEcY7iJ7Ktw9GycfcVUHZeyftlNwI0nYF/prTaI315UlROMbjF41ja+8u/muFng+cnprBYvgfq+t49x7/ykwiEOpJcaF/qKP/G5Jn63ybRhIFjsnllWyKhWkHS4MTwWkFjiAG4jTorRNgYd0/a4GuFpHwYE4xMhiD6B39dIVGDsZydlikddX0+XzPCWYVgH+TYz5MwMdvjc4yqZxuIRGa5X2XGIb1nlCidQV12CWuURqHWCZidCngITS0QewHGiU+0xQzZ1xmfgvCKoVORAk+xbo4qS7PkzASxvbFlDSw8W5P4hreT5iX5Brj7n9Mhcogwo6o7Rl9dTOZ7KiEOYYdyYs4Aamh/pddm69ZZG2uvtaC9R7FZ7oOOMklve5RAurUobU9kxvzEH0T3WeplM9TKNzVjs6yjxEXWe4FwUJUenDPVedU31cyQPNL1Him5DyodrRKj2ZmRuOoRl/1BKS+wO+SBRmNUzWg0c+fCi2scM1AVxiPW7bxTM8GjYpGUVXezxGcLBNrj/vmK6/hFTxwecnDzX0emAVQvV3BAOwfhCWczmOhRs4kWaWLtCSym2+CUFaMGSCpj0e4oO8HRz5n3TaIpVPJ2vjS+Yv/LtzHLHWjQ2BfNcVCOvAXovcZpg56kHMGFG4z5s4W9p47bRDYqpji1qKhg95QBrUcsu4CyK7Qd2nSnHmxu5rcylPbrDu2X3kVzCxn4nfXZAq12he2J48Bou2z3XsoG+KkPENg25kwvFGE9NLXasIxR1lfqdPZk1QZoeyDjp8Xvl3PzQEg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(36860700016)(376014)(82310400026)(16102099003)(13003099007)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	LWdP+Bnh4jMK//l3DTgH8GWOmDLAb0GaCjw/Wl4SVeIg39Mu3ggY2nloQiTkUvFm3FEzFhlAL3xfVAYQ1tpH4v4aVrB2qAm4sx1Dlap3XEqwqq614gj5W+nHLD7pZqUz4CbQTmizZXnbbuj4ywnFx/xCc0AHPB+kUguvgV1r2sE59d5wCNvjhWpxBiYsgKOnZx/9BFWNR7yJhXCZuVdE9AqCe40+G/kVPaJ2gzFjqda2GuzvH4vKKSzyIhDD4rmuUnNwBRKfthAfNbzqR+nX2B/q4UGbB9Hf8rfMODVpL5bOOiJ9ANK1BJEHset2Lrv9pPlFrlNaCDQbVQ0alC+rWCYwQISHhxBHZZLsqWER+TBecFGDaq7/jKnYyOPDTM6Oi9HmjGCUL01RuUdHioyKSOFKuJK1NgZAKJhLwVc0Nli70qyrLG4C0g4kXQtpGJAe
X-Exchange-RoutingPolicyChecked:
	dz2eHMNK0YDMAtCicUV/Ums3krGdcdpNnrFDU4B3b9l0XN5fVstYDvHkEFdQ0GnT+9v6vzxpPfTyYMUcek3Ly3dLDkJGQqn6+LMWll4AttK4UupNfgQTVYnCZhQgpg/qlKLErzL0ektgRCiIjhqTfhlpli+xd38QBeQkZc5bJkkeIuaB4Q1vVTH4YA/JqvZdLKyZeX0hHnka9dgn5InAf5+3peGf1Vr4qLj8WxgEmr75/ZsN6EREEFxMQYi3rD/HCHQk4ddpxfm5U0ott4P3MG2e7yDpTdcyTRr03aDD4sk54add46w6esvP7308ZITDzr80c+UIHqUKgXEOTTR0UA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 10:45:04.6995
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e0d5544-cf9e-4a13-f2e0-08de96ee39db
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF000023D8.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR19MB997387
X-Authority-Analysis: v=2.4 cv=LMhWhpW9 c=1 sm=1 tr=0 ts=69d8d4b6 cx=c_pps
 a=Y5OhYnybWnDos8loL9/x+g==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=A5OVakUREuEA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=VwQbUJbxAAAA:8 a=n9Sqmae0AAAA:8 a=pGLkceISAAAA:8 a=w1d2syhTAAAA:8
 a=avN4fjI5vLKTu_Ys8sQA:9 a=UmAUUZEt6-oIqEbegvw9:22
X-Proofpoint-GUID: 0FvWsEIK7KUDHJ9CH3V5W3Tlo0SB-0qH
X-Proofpoint-ORIG-GUID: 0FvWsEIK7KUDHJ9CH3V5W3Tlo0SB-0qH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDA5OSBTYWx0ZWRfX6jjfVycU0A4E
 GWtFaVkow9QGUaJQrESdWIDULaXtTqe7DtAC87exDFasKk/JrHVPYqikaLuzNBlBe1qvOSVCZcr
 ir4ocBjjVwXlNVIVWba9dUv9ecNNxN4r/GZZn1STgDUwOY8jIxmNMIsbopsTRdRl2WsO4RJK9TF
 U+cgfayTmHetjHrq1+bfOMgeIIyYswtNiW0qc4rZzlCyBZN5NHyyQpqP7XxyZdkjFuauo2pDXYY
 ObLAii8dTv3Gr9JaeRa6hF2KAIqgDa92aIE2AH0rQpFA1t2tdX8AFVxyXvlHdLaelfVC5Fq+z7D
 jszFQN+XOLqoNI7aUUNhPfs+Ycl1mrZaaRYGJ8yKjzj9Actsi1SxY3vnpDjwfRhU18oO+P2ZjUt
 NDheGmgrRchUrt6+JC/WX6AHoEIXO98vy0e0o3GDuidHtQyIk5EMr9jeraM5yux2XY+5LpWI9+E
 Jw5k9gVqgGLepfdhc1Q==
X-Proofpoint-Spam-Reason: safe

A couple of attempts to correct this FIXME have been sent upstream but
the situation is not quite a simple as the FIXME implies. Update the
FIXME to include a better description of the situation.

Link: https://lore.kernel.org/linux-sound/20260408085607.3813488-1-shumingf@realtek.com/
Link: https://lore.kernel.org/linux-sound/20260324-sdca-function-status-init-irq-v1-1-bba49417a4e0@gmail.com/
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/sdca/sdca_interrupts.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sdca/sdca_interrupts.c b/sound/soc/sdca/sdca_interrupts.c
index 3d7eb19967243..6e10b4e660d96 100644
--- a/sound/soc/sdca/sdca_interrupts.c
+++ b/sound/soc/sdca/sdca_interrupts.c
@@ -119,7 +119,17 @@ static irqreturn_t function_status_handler(int irq, void *data)
 	for_each_set_bit(mask, &status, BITS_PER_BYTE) {
 		switch (BIT(mask)) {
 		case SDCA_CTL_ENTITY_0_FUNCTION_NEEDS_INITIALIZATION:
-			//FIXME: Add init writes
+/*
+ * FIXME: Should this do init writes?
+ *
+ * Currently init writes/cache sync are done from the suspend/resume
+ * infrastructure. It is unclear in what situations one would receive this
+ * IRQ outside of that flow. Presumably it would be something like the chip
+ * crashing. In that case however doing the init writes and a cache sync might
+ * not be sufficient, for example if the failure was during audio playback
+ * there could be ordering constraints on the register writes to restore the
+ * state that are not handled by a simple cache sync.
+ */
 			break;
 		case SDCA_CTL_ENTITY_0_FUNCTION_FAULT:
 			dev_err(dev, "function fault\n");
-- 
2.47.3

