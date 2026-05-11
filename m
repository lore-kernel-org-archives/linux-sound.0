Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 520283FB07E;
	Mon, 11 May 2026 14:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778508679; cv=fail; b=ao9NDyAA8MVlqpiTl0X4Oq8cghvfjXCOOOe026rmQ/9gJM04SQ9JBBAx2pADpCOHOlw10wVUMmV8FeqS3xOT27hHvA6/VziKLkkxAAG7IKs/uhFQ63sZgaOKGRzLFqg0tc/et4z89UeT9mctmT676efPl+YRSyqPz0TIAm1f5mQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778508679; c=relaxed/simple;
	bh=eYYDFu9A454mPEDQcXiV9dBWj84CoriWJpnLhp8rxCg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pT/Sdv2q9wpaFWHBKeGV/prMXfx39C7rOgie6R+RMdXN7DmWb8TqBgtQ67IBTQ0V+CHIoKbZJUmCwzJhCpWOKcUmIFifR2zqv9+DR4vpMWYZMbyYMcJ+6tTSPZB3scFZOu/AE8Sywxs2TLIACZZz/5uQ3uw2lGW5VH3tAdTxylQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=O3w2caVq; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=PXTi0blK; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="O3w2caVq";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="PXTi0blK"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B5tU0Q3468705;
	Mon, 11 May 2026 09:10:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=JQxQLfvi2pTCl9TSDQ7Iw15kcFq9fNp7SFd49IMsC2k=; b=
	O3w2caVqL48kbLOMOu5qtwg5aHMVwTYwSKZ6E16kF20p3dlancvFHr2L7ctIGQ/t
	Wiuyk6MZkL5s5Wo6D9/RgU2nPxVp9lgk5tmv2ktJ7O8EpaH25L+y56XiJcei6QDw
	RTG201hS6exhC9tc6xRI7Ao2gajqr93GpEiofp6bKxZ60iiNBuxb9NcRb9gBNNG2
	0mzKN8RNcLGIqMCcq/6KT6RBKwMTROkYUJCgtC0/+zjE6X1OJCHQ6L7+VcwQgTim
	zZCXwhR2/HTwwwhbxIzB8o+nnZpuzbmjzd6balXKaluD5/aVVE6nxZBDZ3py+fbG
	g+f9FoupnBm+BvLRn7E+7A==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11022078.outbound.protection.outlook.com [40.107.200.78])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4e22b0t3tt-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 11 May 2026 09:10:41 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f41VC9wmno6KFC8zqdMpewny+eJVFzubdVNK+tlOq/nm3Lf+USb+Mt1HBkv1wpLLfX92UR1KROXNDPIvYGV7X0P5YZV+55eEDbYuY2zteJdS3nw6scwGopSpe6KOnKHxCp0v92VcalLAX4LIanrPPWgJp5tPbpihspZwBafmACC0dB2Trqp5t+IGoqP8mYKfax9DHLgHGzdmf+bfNDF1JZP4ZgKo6nOm0lHGacBBwTzaXaXhOnKjYg0LHoWXqp/MR1e9mcekT3VRQ/N3/DchM9eueh1o8XhTVPmOhCErjRxezTE/aDlE1wB+auHZWdjhRu2kJrOxHulMpjR5T3CQug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JQxQLfvi2pTCl9TSDQ7Iw15kcFq9fNp7SFd49IMsC2k=;
 b=ohx9mnxkzctX0aYjuoVmpOxVQ2UUFQ+xihngMWl3pktW45QF31JOq7HkRwhiiLavWqQLPyN8gUYxj2JeP+BkzqyXC8SegplNMsy17Aqf7Y29xBhpAmjrkFP/0jt4u3uRQTRKMkdjOSVJkWxgyEEiGPswdd2W9Qgg8O5KUly/D7KzBAZRovpnqsHRHA51hl+yZ6wh4VRwmhSpTRsuCOg/nn1ObyezesQBj0XFZCRp7LAXUZvyaBy7c5rzaHdFK+IMOptIFv8t4l4pEStYL2KMGHPNkotlU7Sq9cVFy2TdQGJjXReegRA1oU59RfopAzE2vPwN5LUPf7zIcRTyHM0Y1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JQxQLfvi2pTCl9TSDQ7Iw15kcFq9fNp7SFd49IMsC2k=;
 b=PXTi0blKAriOOHk8jtgSi9jQQdCWTwgMA8D0xylPnibNhhBR6i/v0yEqqXLYDLc/Kf6GyzVXGpqGynG2vn/r9npx5OIHj9O1gvIylSRypKjX35SVhyLGHmTgkbpjOzvLSQSlXgRaz+dZNEhpPLnkXJzIbopfqWlaT/aU0dxFdKY=
Received: from BY1P220CA0011.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59d::11)
 by BL1PPF50030D607.namprd19.prod.outlook.com (2603:10b6:20f:fc04::ea5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.21; Mon, 11 May
 2026 14:10:36 +0000
Received: from MWH0EPF000C618E.namprd02.prod.outlook.com
 (2603:10b6:a03:59d:cafe::d4) by BY1P220CA0011.outlook.office365.com
 (2603:10b6:a03:59d::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.23 via Frontend Transport; Mon,
 11 May 2026 14:10:36 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MWH0EPF000C618E.mail.protection.outlook.com (10.167.249.100) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.13
 via Frontend Transport; Mon, 11 May 2026 14:10:35 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 7BE39406556;
	Mon, 11 May 2026 14:10:33 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 43EA882026C;
	Mon, 11 May 2026 14:10:33 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org, vkoul@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        niranjan.hy@ti.com, shenghao-ding@ti.com, kevin-lu@ti.com,
        baojun.xu@ti.com, sen@ti.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v2 02/18] ASoC: cs35l56: Use new SoundWire enumeration helper
Date: Mon, 11 May 2026 15:10:13 +0100
Message-ID: <20260511141029.851125-3-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260511141029.851125-1-ckeepax@opensource.cirrus.com>
References: <20260511141029.851125-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C618E:EE_|BL1PPF50030D607:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 6677263e-e5d8-4b78-92c0-08deaf67125f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700016|61400799027|82310400026|3023799003|16102099003|18002099003|11063799003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ktd/5AIIqCIPUcqWzjTv7BvLOQt8WVBM2+wQ8uxP+1QMWlfz65g9uAElQkOZ/1WhTk9l7I0IxrbVXY0H6x8syubiVTKWe+gk925PWmE/8PxhEzYmF/w28U9KMlU4XA52zpj/DSYxuLK/NjVDzAPv7rLgF48slDwy0DkOaCIU3ZSlKWgtHswrEuF/fO8NxrJAqkypOwMjTgD+RrYQVst9J44w0jlM+puaUKmKDBGGysFSFUHTVQxEuFZF51GhqgeJD34YOH2EVJ3/9iERAEG8ofZRCl8DecqRF8WI6XHyUfVh24NvaN53HWb86ZWoFmbIn5PNSSYKL+L+9nTBfCwkaE0hakwLMuqq5JJmGe3E1ooEMmvBZ1xoK5MdSf3jfAYn5YNVvZeKdV2aSwuBk+zorVPBVtxAXWhf/QHw5X0Ed6TzPYERvA4dDPwMWJjBlabcQ1/bEbka1+O3OS6yUV9TgQI98lGtfR9vfMCaO0qgJtItXj/d/4WOMWBYbf4YPoafv8QQZNg9hnYDJPY2+OOWccaULWk42LpEW4vaIFcdXlFPi5CrlMSqNwht3hHVmoNYkWopnwOmEsZmaIyVqwFXgcvyHOH7TpGGnZl2mtiUJ3dGPRyHFGmpBkvCnjxhOhy9n+hmmzbln/4i60/fXk7LfNoWXoyPJmewZnZ47PMxZDBgcTUNbBvLcky3wNSdgAvC3CP/JKL4dduik3vL8JT6P2zZEpQnedjeagZDuwxE6Mc=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700016)(61400799027)(82310400026)(3023799003)(16102099003)(18002099003)(11063799003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	cApMgRq++wZ8CAshvq33Oe2DfkUR9B4jBCTvwJTtCQcaVhbK6TcWzWI2bAauHs8/T5dQ2Iowi1/Hc1I9CmXsmLHpG8fEXUU9qIPQdsHXB6lMkaMPJeJIfN/HkFbETCkVJum7QCwqGH6rUE3wrCCCOeG+pInZ6gGz3txnyMVrogfrEvt/JLE51qHPzOHqVEZccCMsUh9ep43pYEuwffQNywwUpanCudx/xXw8hfHAMICnF7xAZeFlmyerAOHv2ZntZwFXEEF4Jj3zbcheQPwvKz8UgrM6ziZvOudqpikOpMlygphDzPSy++AMwAzP4t9txKIw2OTXazDS4kktus1mJGwhLa1eiOnj++jiIXeg/apbge4EUb0T1nhsFoNaqQRalAyn90019E2KansVjSau3RIW9AYo/1j6Z6+fjqNqs0/b8AU2M3aySDI+DqjY8wT0
X-Exchange-RoutingPolicyChecked:
	viXeX6Xyph25fQ0opT/XNTjgyBd0KiQub4j04H8Q8dVCPW+A+BFufR0ghbbMyI9YRq7IrloB2Zmb9n4LqSe8+9YCm6FHFY1kjFuEgr2BG/mF3NZLWzdtqYGJ2SNO5W/oZbUM1f+uStHCgkO3C1JmN0IOgBPg8SPcs+/nuwRfxFKtiXa+Z/i3yRJxijrbydIqHQQGrSKT5kM5OLNpWt8b/j8CTdt4mlMyeElc1ThVw7lgXHdYcisNzbgPNW5QZf4eYX2k8TX9Kz3fQueZYiJr6lcEmGpfubSMt3DYqjCnZZDCpCRzhmUi7gHUfMMsCv5lHvBQ5lm+XNh1prbYIpMi+w==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 14:10:35.4787
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6677263e-e5d8-4b78-92c0-08deaf67125f
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MWH0EPF000C618E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PPF50030D607
X-Proofpoint-GUID: _l4JYcfRyc46f8tQtUws-Lnj6mxGEtc2
X-Proofpoint-ORIG-GUID: _l4JYcfRyc46f8tQtUws-Lnj6mxGEtc2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDE1NyBTYWx0ZWRfX5FuZqQdrXCn0
 wYF5kNw6RjM1It6TgEn4qZeRaqMTZHu6iX0gfEA4UZH5tcRIVG8BlxKKxgXvHoZ3yfYkdWRCB11
 aV4UwOgikV5y1GIj+wrM7U80mCyEPUsIRx1RL5fa65oxTnW9b100Zir2xypcwfgSgHRM7U4xhnM
 /ni7Ic9qCxKKrAyXaIavaBhoDxCr9V6OZtyxW5L/g7RbUUjHOHwMo2fA8K+rApTdLfyIOyxaAF8
 jhJsocjKQV4Cxni9Fle/xz6D34SR4F8hcnYBQEJ/lITx0dfNR3ZSWXn9xs2dwU8T9DXcw1w7XPF
 hmt36Zb7n6yFKhxiYrTVYLXckUi5U6he70ry9TDM9OTwXN3CqjkRjuCzqInDXiKjVB4Uf/zJiA9
 4NDO1OfjLdeL0GL/YSjzldyNv4LaesCuMsMc+Wlstn4ySCHq74jtdDYaK13U4eW3Ma7jWY3Iu0J
 j/Ebfz69cm3NPFU29IA==
X-Authority-Analysis: v=2.4 cv=UdxhjqSN c=1 sm=1 tr=0 ts=6a01e361 cx=c_pps
 a=kwEHbe0FhOXiazSsKgGQ8w==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=_kLIPOSdNJ7StitxxVsA:9
X-Proofpoint-Spam-Reason: safe

Update the driver to use the new core helper that waits for the device
to enumerate on SoundWire and be initialised by the SoundWire core.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

New since v1.

 sound/soc/codecs/cs35l56-sdw.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/cs35l56-sdw.c b/sound/soc/codecs/cs35l56-sdw.c
index 9dc47fec1ea04..105d38b1c1878 100644
--- a/sound/soc/codecs/cs35l56-sdw.c
+++ b/sound/soc/codecs/cs35l56-sdw.c
@@ -436,6 +436,7 @@ static const struct sdw_slave_ops cs35l56_sdw_ops = {
 static int __maybe_unused cs35l56_sdw_handle_unattach(struct cs35l56_private *cs35l56)
 {
 	struct sdw_slave *peripheral = cs35l56->sdw_peripheral;
+	int ret;
 
 	dev_dbg(cs35l56->base.dev, "attached:%u unattach_request:%u in_clock_stop_1:%u\n",
 		cs35l56->sdw_attached, peripheral->unattach_request, cs35l56->sdw_in_clock_stop_1);
@@ -443,13 +444,10 @@ static int __maybe_unused cs35l56_sdw_handle_unattach(struct cs35l56_private *cs
 	if (cs35l56->sdw_in_clock_stop_1 || peripheral->unattach_request) {
 		/* Cannot access registers until bus is re-initialized. */
 		dev_dbg(cs35l56->base.dev, "Wait for initialization_complete\n");
-		if (!wait_for_completion_timeout(&peripheral->initialization_complete,
-						 msecs_to_jiffies(5000))) {
-			dev_err(cs35l56->base.dev, "initialization_complete timed out\n");
-			return -ETIMEDOUT;
-		}
+		ret = sdw_slave_wait_for_init(peripheral, 5000);
+		if (ret)
+			return ret;
 
-		peripheral->unattach_request = 0;
 		cs35l56->sdw_in_clock_stop_1 = false;
 
 		/*
-- 
2.47.3

