Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EBFA28CF5D;
	Mon, 10 Aug 2026 10:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786358465; cv=fail; b=Z8xJpHw7vT5sxAj6z7s2L4dsmj49KOWBleCGDN9SLX3T8LlDJSUMfiod8o5x8Nx8y8QQZoQpM1/RucEDo2TOcaEsjj3zNHj030v6Ump5w7J7hPSnccNuX5AcSKx0qkV1XFtZ5u6vnqd+q5S6NbMcs4m1PWZVFvMflyKHHnlxyWo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786358465; c=relaxed/simple;
	bh=xXDJ/POya8o1bpZMY1Z79nO4Oo71H+kQQUO+V5kSLuM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=K+B8H8tGg0yKvBgX5teMKvSsGK+RfS9e6PlF3eptZofXmInaf9aHp1nsE7lU1bfoqEog2GR+gxsdbqE1pBTxCODgG6iEZMzaMks8RY66i0lAKcslVypaJO1kKMSHELBjNqlildN/0ED9HMmWs3ct/9Fa70p7A1OsfTU+nI09FpY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=l9xciwuB; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=EdcagExE; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="l9xciwuB";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="EdcagExE"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67A4bbbQ2527591;
	Mon, 10 Aug 2026 05:40:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=0hcITiOPx9HgRkSc
	+6brqrnhIHspoNNeg/x+SsRm5gc=; b=l9xciwuB3KkIwlPjRpCltFmoIgkmAhpt
	xAaGavlXgIJ0Ul0yZHAmq6uushkjJI4X/A9BqM4YJPH4qNqZmnrLirI68L3fptzB
	yPImW7969FPRL5TCGO0E25XgxOKD7lLwTghBFtWDSz+acnD0xt6NV8tPBrh5tA1b
	TCeVCyWxpbrquiUOn5FI+OwOd6t4HknboX2aX0LQLXlw7n20mBg7C5ALNkRnAMIZ
	HgpoXLTjUwWSdJkKOvPp5JlSnghFGAYHpE6ARs6RYaVA8M7VXIrgYqEf0JE8l+SY
	DdSWSpqF61UZSg4Bkuw1Pbk6Zl1YgUNoPiIJ+2klER8XyxWetjDFtA==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11020073.outbound.protection.outlook.com [52.101.46.73])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4fx1v0tbmm-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 10 Aug 2026 05:40:50 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H8EkPGS5S2HRT45ztjHYP47az469WEoUVBV7u0FcWkCvt1RO/bpEq47TYZI3x67M1fAX+Ra3rwOnvWpYzCPaJSUmCDG2DiM1OpbPQjeYlq6lh6y9Sn+SLIlTAH443KrDdxS/txjzdwc5W0yhlqpxj/7jAycGCZnu43iv4VeoIeI+usUwTrUmrdmj3bOeJiwSak0/dSJOp/mQPKXpsh03oBvG6uR9cHOxQXo+z3C60j7Lff+a5idjSrGYWuIfk5yiTfjp25jS7p7H9mQs+v4i7Eh+4L1Wuz0azGTxp4S21sJs9LoDojQF/nzwQWn30bTsLx6BJsSNQFrNk3UOhHgaig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0hcITiOPx9HgRkSc+6brqrnhIHspoNNeg/x+SsRm5gc=;
 b=xn3naM4Hje94WstDOoImvF16Ip9Lt0pX1jJVWEgJBsPsCMCKg27X0DRSZn+zm2ela8CyTZSLWGR2/HYkWjco3YqYk7aPaiCOG19PEuqXb4KPDALGduH02axg492oA838RzUGwXKweBcTh8cAtqqOAW6hgqSYGATfoVUuIA6MgB6pR/PzUTIyh37gt1mwkxkBY1tSj32KUSmUaZA7/jQT3uiawQnh3ZqmUCSm9TTYkE+VcMT9vKeLtAgI9nhMcZKgqUI2nVfuvCiTIJh2W4Ta6bUGxS8Qh0o1eFzRvT/cQvm6di2rXA2TsbRpOFrBTwhUD+K2vftfZiEQoHfHMm9aCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0hcITiOPx9HgRkSc+6brqrnhIHspoNNeg/x+SsRm5gc=;
 b=EdcagExEbbLBR4MRBH5XJYjmnj20UL4LsuADxP+2DDPo6e1PRsehx/nNc/Qji1nSu0x1uTmktqtQXrGIxKTfAYBRdwCyElMicfrRV+VJZUDvJvGy2j3PDJzZAvhGzxpfLRRAl0kPva6NxLA6rvixQOmmoFnfzPlwvl7Hg4HF75w=
Received: from CH0PR03CA0406.namprd03.prod.outlook.com (2603:10b6:610:11b::14)
 by SA6PR19MB8757.namprd19.prod.outlook.com (2603:10b6:806:43f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 10:40:47 +0000
Received: from CH1PEPF0000AD80.namprd04.prod.outlook.com
 (2603:10b6:610:11b:cafe::2f) by CH0PR03CA0406.outlook.office365.com
 (2603:10b6:610:11b::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.25 via Frontend Transport; Mon,
 10 Aug 2026 10:40:47 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH1PEPF0000AD80.mail.protection.outlook.com (10.167.244.90) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.6
 via Frontend Transport; Mon, 10 Aug 2026 10:40:46 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id ABFA0406544;
	Mon, 10 Aug 2026 10:40:45 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 9B3DF82025A;
	Mon, 10 Aug 2026 10:40:45 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org, vkoul@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 0/4] ASoC: cs35l56: Switch to using the IRQ from the SoundWire core
Date: Mon, 10 Aug 2026 11:40:41 +0100
Message-ID: <20260810104045.60701-1-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD80:EE_|SA6PR19MB8757:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 17d62168-80c2-4348-65dc-08def6cbd66e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|61400799027|82310400026|376014|36860700016|11063799006|56012099006|10067099003|18002099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	uJLH4UyOuh+Zo9uqdH6RlbipiFUGkkvIVysUHq9ElArIlNn1FqmUHvAz4yWkx63VDAFfu4pdOBjghLExwYUAOzfpCSJtWRGPHgkRhrzvRg1tOHD2VaJ2aQOyIBHFCC1324+gPvbThtOTj0Lhv8XY5DKx/IC2MnCD99AebAvwzeufGijqHY+JPWDPwp9oN6qn1bv/crkSsllSe37GjuZ4sg/KEElTkdIdNkQS5Z6JfQeldblicCFXBofnNZQ5UOPGVdNic8usmnSxFbI4PF+IJU+413sXbdF/ObOWmlJ/JEV6Hkgux3jD6xcYmWPta9a4/BKhbCIxVHjCkadA9fADNQz/TXVnS7QvhA+KAqcsk3g+stTN7u3Yz4k/1HSo64ZuabIGnP0hBzK7R7XRuM3QknE5x4j0ePIDdCNkOeq76moFp+N6yqj58I+wogdMxNjwNhsagxmHb4yOLpiyxbcpBJBw5rHG2/651yxcfN7Xdl6O9k+MaZ6IPYAf9zPFOCf0rUH0pNVOHAcPC/3fFSdLvYVVCxjlaxc+h9S8YyzXqTONDOOC6zFk5XQ3lOnXplC2pztvwQkCeFQ0i0c8rvCgrK20bqMcbBftrgdhNN9EfJypU73NLUFgW3xs+AT+roQ8x81VWjGAj3HZBvDysTZIxIeiWuvZp9mmiviuxPxS3+7EF9spXgaYS/mmTrtwekvpYZeZFOiBUf3BovxZSHl18g==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(61400799027)(82310400026)(376014)(36860700016)(11063799006)(56012099006)(10067099003)(18002099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	BhYIshnpBBHabDvZ0ZFF9TTWABt5SXY6hIsxPNnDUNXrtAKTOhxjKdkSEDPtBDqYqTvih1EFnK7KyslnxTfLTsyjZPlH3cvSj/pkRG5bDvbA/af6LHGPpwcGTJuFB+wDifGgmDubzjNT/yLwsEhuNIttiBy8lO9gFSelftE5aNb5sht7gz3OqUIoAspDR0RCp6cbdtCyZh99hMrOGGWfMuz5eeO/HMasSE79uTtGzk+bewA6F9lAKkpceR4XB7ndfgepCtYzMKgoJaBmy4XH21EoMIQc33MoDjGc/WZWROISqwWyONFHTr4iHBTAPCP3yoPyfFtWwYGZ0G8nB2jk7ug8VGuxcswekcLt0LmEMDvAJggSknfpTb6kAt0nKOUU7Erv2car6ONpH15QPZPdIStqJkHubwzUHSLyRQ3f3rlEW6eVD9q8OIpY7zU1cwa2
X-Exchange-RoutingPolicyChecked:
	bYqajGxyTNEo94i8uZlLVNONiNzXwNmj3qK98UmZetbEURlYIQ37TLB1d5a8c/j9wrf3cV7bTuqxkKHuOWIXyCdC/mtaWnce8bxL2J/zT02q+YnVvjR7SuAAzfLjsgEKJoav4ywoQhkhgpPekLbP5mOQzZqaJHR7KneDiGrrlrCRjXWTjW8D8b3lwlr9x3v5ed1Z9DLTiRACv8tWayngmkZQI2UfskfSYbCLUL+JriNH27ZhnHHStqN+wUmBgZXuxBAeJYrJUsJkNRMRFjfHiYl8YzRcWw9Vnzg6FAgqpV77kS6TzINtd6b15Eq8XHy+izkYAR1+eaqusdAVemJIRw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 10:40:46.7256
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 17d62168-80c2-4348-65dc-08def6cbd66e
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH1PEPF0000AD80.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR19MB8757
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDA5MiBTYWx0ZWRfX98bGtlvxI9kn
 A+ANjUuNyg6Tk+tA0gHKnZ92pqOSgq/Ia02ok9fatgm3fKM3b25biFXJfFXGQ9FD2zu0ykprv8X
 nr1NhMfsqfGNEjAlSvjj5KWdtab4rXw=
X-Proofpoint-ORIG-GUID: MN7feotyzkKBh3d9PjUIw7mi0khJae6X
X-Proofpoint-GUID: MN7feotyzkKBh3d9PjUIw7mi0khJae6X
X-Authority-Analysis: v=2.4 cv=ZMrnX37b c=1 sm=1 tr=0 ts=6a79aab2 cx=c_pps
 a=NUMs+PEU/Pz2DPnLQvFO8g==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=zz_LNmnal2haRPJW:21 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=XA4i9bNTDppAmMg53sUA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDA5MiBTYWx0ZWRfX9gC+rcQxtLBV
 BRTKUlVspaMQi9uShuZhjSJk3YDAs6A5cg1wnasX2xAAT+YCuodQntFDNcU98AQE7Ghd3Se5sSu
 4tXY2wWcpm7SjllFgG9DLLfgywNPo2MUHk1Z4uwimLKIfXWL4SaGwTMTheByPWoi21wFafLxmlK
 1cYsjCcNsoFvBceG3eWgw9bZz/dFd3M/Zp5Rv0epozaV/8h36JlylgKyVtVUJ34QDyTrErvo8GY
 1uFwgNXc5zvetwxGAPLkf12vEWlTgn+guZCLpysarv32BuW04Bg1EazWXm1jo1MOjRbz3K+34Wr
 OaCcNCvMnu7Rdc0LYWl2BCcH7Lld+sOgN1xg73oWXo+9CHqLB73UG3MpxvIHcHeN7QErGbKQRjC
 RqlkhsEi4HSHqcw+IRwkXwIkOghRC5QeWfj9qqitOoJ+XZmCrPs5XKwxgprQn8s1HbR0b9AgTcf
 Pf9Ol5t3fRhJ8/fJnMw==
X-Proofpoint-Spam-Reason: safe

At the time the cs35l56 driver was written the only way to get interrupts
from the SoundWire core was to implement a custom handler inside the
interrupt_callback() function.

The SoundWire core now provides a virtual IRQ for notifying ImpDef
interrupts, and switching to this simplifies the code and also makes it
more similar to the normal interrupt handling of I2C/SPI (though some
SoundWire specials are still needed).

Patches #1 and #2 do some preparatory code shuffling so that there is
less clutter in patch #4.

Patch #3 changes the SoundWire core code to create the virtual ImpDef IRQ
before calling the codec drive probe() so that the IRQ can be requested in
probe().

Richard Fitzgerald (4):
  ASoC: cs35l56: Request IRQ in cs35l56_common_probe()
  ASoC: cs35l56: Move cs35l56_irq_request() after cs35l56_irq()
  soundwire: bus_type: Create IRQ mapping before calling driver probe()
  ASoC: cs35l56: Use IRQ provided by the SoundWire core

 drivers/soundwire/bus_type.c      |  6 +--
 include/sound/cs35l56.h           |  1 -
 sound/soc/codecs/Kconfig          |  1 +
 sound/soc/codecs/cs35l56-i2c.c    | 10 +----
 sound/soc/codecs/cs35l56-sdw.c    | 69 ++++++-------------------------
 sound/soc/codecs/cs35l56-shared.c | 41 +++++++++---------
 sound/soc/codecs/cs35l56-spi.c    | 10 +----
 sound/soc/codecs/cs35l56.c        | 57 +++++++++++++------------
 sound/soc/codecs/cs35l56.h        | 11 ++---
 9 files changed, 73 insertions(+), 133 deletions(-)

-- 
2.47.3

