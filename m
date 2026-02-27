Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5348368947;
	Fri, 27 Feb 2026 13:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772197354; cv=fail; b=JTb0d0hTcPpsUL1SHdTa9hbWVYCqb42DeZItlTvTZGCmaxLeA2jIy3GS9bcQ2ArVXLs0ShUc9XjFQsGIqVTs85pdFF4DcD+OUM9umZbdzDER6kmShnwettxs8NMlHXLUTRoTA9TYJxsYmgnwTQHgRoUSueK5JV135jxVr0m4iPU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772197354; c=relaxed/simple;
	bh=xmXFxHrcI9cZp94uRjKjmViVFdsHcS6noWtuqzTkOm8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=c/ffipdilaX7OQjrKVFeDwxhaRc40d2ZD+T4Xp4kGB9JNwiZdqK8ZoL5yVmnjGjS2NLALl9KAl1zl3Q8lzAE9Q5gbkwCYGNWbwlWq2143hsIRt7X4yQ17zg4H2G/U4VMTaAo1houjY/6ApRZEsNo0i0Mvf1NrOGgWS7rIeQmHAA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=TkScL0Df; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=nxCilvKK; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="TkScL0Df";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="nxCilvKK"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61R6ZJgP2534477;
	Fri, 27 Feb 2026 07:02:18 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=jFwWy1m/v39kNIsw
	FUmP4nTVTgs2B8BiMEjS6tqs7MU=; b=TkScL0DfPg5F/cmmevRExm7ozFBUHGxa
	Iz7LSBnaBCLijgwhF9ApX2Sw0jX2mfDe0hwBcoXYJ+dHMI49XCBpcrCWRSumPxsY
	MRKPzFN6Hk+9g0/GhmA0I051SaFioiwpV2G0hzlYs3GgedrHfQS44+cr/VpLcC6y
	lR+ZJPMrUb1f6XYeKW3JLKNixyo4Th1xOy2oM/H+lMwgY1P/TiS8B8MogpI13cN6
	gqsak3/FIKiiHZmXDRhykcdjSRkdNcYGVoSAwXBqJMRJplCCgQuqgDX1BjkXVo+X
	X8f0UgdjC1L9HYJr/bWpYuWPkoUPArbQ0Gmn937beJuaxoQaDZgqyA==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11020141.outbound.protection.outlook.com [52.101.61.141])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4cjmds1fh1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 27 Feb 2026 07:02:18 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PyuB9wKPaRXFUk3hKu26GrUn6Zj3j9B6HDkt1cifYHEmWLR7yh5Q4PxysJ0b7Fp5b+AYIqakNjWIzuob1/NFHoZYi3tVhL0ioHlhFkJz1qnO1Tu2pTot1Z1PJzaVRjzfGYn69xQPTUfAiTrT9l/HSTQF3+fCNo5Z1ewR3zB9NgITpcBibes9MryNJ82o0ng9Ki278lG+ZssJN/4q/pz+r0ubdnRNdSE+OKEPuOpxweEeU+iRhBQjUo+pueyEZMLqIfOedg1g9QyY3xDglvywsB+Ilpdb3fLGdP8/jnb2MkMUitb4giETA3EI5C6WAFLMh+Pl4lqfoCKkGJnT8kH/9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jFwWy1m/v39kNIswFUmP4nTVTgs2B8BiMEjS6tqs7MU=;
 b=AwZ+cITZ/wjPvF2hpOGjS6hffv4jsCFbPqP8UudGQpRuPFIH5+ivc7MFI1BW09asJ+KMai6R72eHiNf6iGLoM7k5pChb8w/Nlo/XWEuJCby3lOdBphE+Rp80cnSix1seTZq4FEfjgyx+O2Q43nV/iRsvgmKvggwV3kidJMMeOfcetq1u03kRNAmPQl6wcRxtB0asAzyhCgQKoqcaNJHSuprK6rhv0YFsfblbeWA7k9rkP6rVCoJ8WNzUaRfwzdWbBUTm26ouztE2CQyuCb0Up+5mEbrVoHtkkyhRyr09095DpKbVM0GZlIfUFkrzlsoJ0D5AK8tWKQms7HwLghxavA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jFwWy1m/v39kNIswFUmP4nTVTgs2B8BiMEjS6tqs7MU=;
 b=nxCilvKKTZ0EUlMQamgNIPpilCWhzZo96MugBg34aI3m+mrc1QvSyrFxtbh3qahoFiR8zeblc33sVjvc4uy9wW1dz7hVqskYj/jXm4TeV1IppgekEgMu7k1BGmbFMWzYQaiUVuxPVztqQ6ZrJ6x3QmrMPIQFIki3oOIDx7w7mds=
Received: from BY1P220CA0019.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:5c3::15)
 by LV0PR19MB9576.namprd19.prod.outlook.com (2603:10b6:408:326::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.11; Fri, 27 Feb
 2026 13:02:15 +0000
Received: from CO1PEPF00012E61.namprd05.prod.outlook.com
 (2603:10b6:a03:5c3:cafe::15) by BY1P220CA0019.outlook.office365.com
 (2603:10b6:a03:5c3::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.27 via Frontend Transport; Fri,
 27 Feb 2026 13:02:16 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CO1PEPF00012E61.mail.protection.outlook.com (10.167.249.70) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.16
 via Frontend Transport; Fri, 27 Feb 2026 13:02:14 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id A3B0C406541;
	Fri, 27 Feb 2026 13:02:12 +0000 (UTC)
Received: from ediswws03.ad.cirrus.com (ediswws03.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 6A6DF82024B;
	Fri, 27 Feb 2026 13:02:12 +0000 (UTC)
From: Maciej Strozek <mstrozek@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com, devicetree@vger.kernel.org,
        Maciej Strozek <mstrozek@opensource.cirrus.com>
Subject: [PATCH v4 RESEND 0/4] Add support for CS42L43B codec to CS42L43 driver
Date: Fri, 27 Feb 2026 13:00:57 +0000
Message-ID: <20260227130120.3070893-1-mstrozek@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E61:EE_|LV0PR19MB9576:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 8a10c945-ab03-47dc-cb04-08de76006d94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|61400799027|376014|36860700013|54012099003;
X-Microsoft-Antispam-Message-Info:
	Ln3JV+200Ve6sNBF/KxQQ30yYHS6SmMg8+y8ZsFx/k60TM1io3vsa+bdzg/OOWLdDX19i1IubxdlYj3bv7Ux9eqSBW72txKbag/4UsqJRPC4oL3+s34UwKglFFk7Tq2BoEeYi/p36aZCb26AuUih7PrFxt53JtxJl440IKmE7JxlXMxw7ZTNzMopy8/eYjrctcJXpSnm6NVyZE7HQzuO1zbFGJA/2/zaWWDt822cs4Tdv+yDYinDcIKaT+GOZ/jAnXK4Z4vC6t8NelAt3hBkLj1twaarDNa1eH7rh0l7snwMIkEKPzCbCKkYb8YM8Zevbz1S/9q9ZXhERQ2igzklY7g9Jvox37PkChdN/nbd3PMisxmak6JSLqA16wB7j3HXTqOXr9Ow6E9FRDxf/Ggv99VTMyjFkYIGZSpECduZWoKvBf0uo96dS1IwQJ+ZXKifzVeJ4FLEgYRoDr1Qoc+UJSNmlz3YVpP6Yh4hAiAMBIGNbWq90j0xDUR52aFkHiRo+B7rwu3bC3gv1iZFiVxviwdwEbNS9EqE47L2Msnwt5suYj49JQv9omgB2c8TuI3XJGG0y9/2xv/7w5qqbaIFNj8TgUushAI2RbiMS7MQgYFT65H6kNicHYvfYe3KRBTRxsWXdMPaoRGoZOKR5LnYnonrQknWE4hIY8WSAGPu1/sOx4IDbr1DYSe+whFHZfnHW5qQSifrCb+o+yZ7vFspp0jkHuljc09peQeA6jgIIt25HD2w8dJUVcMPD5DGPCxe0o9rmU/ezxuRUkyX9sx3LCfeX3PyhkEopnTdA+fO7dJjOFAuDFD5x4c6fApcD0OxrCkm9JMncMOElQGBo/Ysew==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(61400799027)(376014)(36860700013)(54012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	sSyqkRuaUsgh00jHIuNY4Tqq9a5rMnuoMuU2sUv91mCerTD9sDcg6wjDREfgMwkYW5WkI9uvy73F1eMqmi6k1ZZXH0Xm4pgaAr9R9C6PW0fmRASxLt+maQvAPAN044pxIQm4KCsGoK2j/VDmo3gsAwMGIDk7ZyVNfJ7J1yk3k6e94NRMVA4jCBYgtSJwwEplKtRgLiz9N/rBrhusDO4dEYAit4xahtZoBbpPm9RGaAQSEDfgRL09LiavdykScsK4QhWWRc4VguahcklnIKUDccEWB8oKgmdVulIlIeOJ5KFGRSrYGblGs19/cKJhNDuzyvy7gD04fGdsbHFYi6sVx99GrkuoXt2jPcj4wGr3jup4K9aXz/NCX0z2sj8CVk5UwrcmYhqqonHTF5kC2Go+4QmZMFohk9SogAcItXQ2+3iSE64hLK8jSmZzfQgYLhvL
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 13:02:14.0419
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a10c945-ab03-47dc-cb04-08de76006d94
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CO1PEPF00012E61.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR19MB9576
X-Authority-Analysis: v=2.4 cv=dO2rWeZb c=1 sm=1 tr=0 ts=69a195da cx=c_pps
 a=ZuCHbd2xFD7xydy4Rd7b4Q==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=HzLeVaNsDn8A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=3fcK6sipGkM-lnU_H0wA:9
X-Proofpoint-GUID: z6EYR2ak0kQNuGR9jRFFrFhwrN8VmmOe
X-Proofpoint-ORIG-GUID: z6EYR2ak0kQNuGR9jRFFrFhwrN8VmmOe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDExNCBTYWx0ZWRfX6Cq3UxJ1TE3o
 D/W6/IbTIqkiyHIfkFTOwbY48r5OlJ3B7vb7IahbdHV/UHSg6bjlwXZLa4zw4nxl0vcJYxi2IcE
 II3ByWxixPYwNs+Voai8Aw+94ulzuBnQmz7kDL0RCxUMXpO2nx1/Y2/oGIzUF4VqrD0WFDixU8V
 aW7hLvmqXUSKBkyTFW3EykR1fn+A3sTNXWUf1v739CiHUs71VA6SGQxutqSDWQ11AvvRVYVKc76
 s6jdG4UAYWxVHpsttxp1SO0rQI1qQ0+wJtoR8JWQzQTbam/bTIRIdJphlfEWgl7eEQyi8QvliiT
 az+UDpfY4vhgJJrPHxVqUKouxzhxcYYK2rIzgDvHk5t+dD7kht9CmKx9d+lEtbPtiSQ8afn3YRw
 zDGFp5IRGmhFnGfGW8pw5juurIUpkUa6fFY6Wevs2y2ql8XGjddtwC8ZIKMVQ++e8znDxA1pa47
 3ASjFoMhM7AG8iKV9Ow==
X-Proofpoint-Spam-Reason: safe

Hello,

Introducing CS42L43B, a variant of the CS42L43 codec with changes to
PDM (DMIC) inputs, RAM/ROM memory and extra channels to two SoundWire
ports and ISRCs, and can be supported by the existing CS42L43 driver
with some modifications.
Support is split into four commits:
 1. Add CS42L43B codec info to SoundWire utils
 2. Add dt binding for the new variant
 3. MFD driver part 1/2
 4. ASoC codec driver part 2/2

Regards,
Maciej

---
Changes in v4:
 - change variant_id to long int
Changes in v3:
 - fix incorrect type cast in mfd patch
Changes in v2:
 - Rework the mechanism to identify the new variant along with some
   error handling improvements.
 - Added some comments in cs42l43_readable_register() for clarity.
 - Add handling of the I2C path for the B variant
 - Add a dt binding for the new variant
 ---

Maciej Strozek (4):
  ASoC: sdw_utils: Add CS42L43B codec info
  ASoC: dt-bindings: cirrus,cs42l43: Add CS42L43B variant
  mfd: cs42l43: Add support for the B variant
  ASoC: cs42l43: Add support for the B variant

 .../bindings/sound/cirrus,cs42l43.yaml        |   3 +
 drivers/mfd/cs42l43-i2c.c                     |   7 +-
 drivers/mfd/cs42l43-sdw.c                     |   4 +-
 drivers/mfd/cs42l43.c                         |  93 ++-
 drivers/mfd/cs42l43.h                         |   2 +-
 include/linux/mfd/cs42l43-regs.h              |  76 ++
 include/linux/mfd/cs42l43.h                   |   1 +
 sound/soc/codecs/cs42l43.c                    | 756 +++++++++++++++---
 sound/soc/codecs/cs42l43.h                    |   4 +-
 sound/soc/sdw_utils/soc_sdw_utils.c           |  54 ++
 10 files changed, 848 insertions(+), 152 deletions(-)

--
2.47.3

