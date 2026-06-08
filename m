Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 255CC325494;
	Mon,  8 Jun 2026 16:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780934591; cv=fail; b=e3dCld3ummna2lUmTJQIGNrTzrBSvvYUXNe2Z9y4RtMM83LWWZ+yBILHZy1UFBsmAIUoF0YRlOk3kJKQIKRnu7bKh2rhUz2GKtEpDWTiiY36BFIuwMBSoAjOtESbgk5dq7oWxtMADVXgFn7pQLOjCHtp3sxPhSnQXDos1AhQCkw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780934591; c=relaxed/simple;
	bh=f7WhdCyyM7Sl5t6gVPMwM0uQlxNbJf50dS8619xml7c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=OTznUv3rXdTWIkgCdOeUcUVZxbvTcSmoczcs2pbr6Mt2Mty8u0WX3NV7is3o75bqcUf8ZZrTlB377JABjqCJJD+pYWHipgrQR7NhyvJ8Bh2DI2Kbky0oYpv8dN3kvDM3JzwUYKwjKaRrY4IB++PcXQq/qjYOJ1cI6UwH0P4PIXQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=PO5osXug; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=ZrUXRYL3; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="PO5osXug";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="ZrUXRYL3"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658DrFxH357500;
	Mon, 8 Jun 2026 11:02:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=EL2xn3WChpW1yN56
	Nj+ytEyWt8nEgYhBUI86Hu4SMDA=; b=PO5osXugofVwNmrrw0+fQPeF77l78PrC
	bLddSO4Hpyc4S9K3rNXAx4SR767763ruM3gGayTNwhDRzTkU5ClmPm7AbBUCxGQC
	qwSmCKuE1Rp2gRBRE1+TjdkXeSVyg0AUUfw6pU0LdQaip7abenuVYAdKWLul7ynM
	VK/NroiXYacEnm5rEWIUvmUKuU/hmDUkzEUmtm+lZobRvKdg+wZCgC6QMDX3awuq
	0YZMbWvAbE9RJRkvBrVFTD762E0zruOT3EEYELeDj/X1/CUu4IZSYOHGjR3iasDl
	LeP1rf/wjEo5oV1NkkWCzP9M67hX+RB/5wzw2s87aF5eQp038/mmiw==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11023091.outbound.protection.outlook.com [40.107.201.91])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4emgy0art2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 08 Jun 2026 11:02:27 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xAYKKkYjWkNnoZJNtS7UlZ6USm/IvkqRNFriIOkMxuA/W79A9oOKXHuFk5AEAFC3e94tuD5BQNqD0vg00ckU6dB5yX+QPKeET8tVK93V2NyFSVQ60+hbn8kPl1ZNSmihNrazYe+BHBkbrd9hlx6rG3hm9ZB4BNHb1O0Wux9gYBs6Le4NlGXfrBTf69t36KBj3q1DT97JH+n6KBS/yiiIoqwO6zlz/52mMHHIgTRpa2eNELGn63q3XISWtFwAkZdA4UXgemb0eaRjRVuPNwYYPYfrre/HTGFupa3v7AfYLcsChIYmBbiPz/LuKLjfTYftNuR776ZPxr08Rw7XuF71vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EL2xn3WChpW1yN56Nj+ytEyWt8nEgYhBUI86Hu4SMDA=;
 b=wvF+EGI5Uqi7a+gR/WjToqCkj8CrVc2JXClWJPHGVOwKbxJOwd+mFPW3/F+5wDX57aVH2MNxOHE/BtPpcydWBlm/HDIKaQbyAxcFSN1o0h4YcpOMOM0myTobMPskh+CBaRZ9CLnFNTcQWLwsU3uu1NNah6pWOELuq33OxArq8Js3zA8bU0mgT3cEmVUgoigZy8thxDT1asioptYovbIo9MrfTOGjQqRjnWOUdLpuPFYQzDsFpz6XhSpuxHNqT+BO30lPH2PXADn5vtWqO5qFf44jjZfNaoKE8mf6Qqs7uC4jn2sIlaI7FWIzc/CniCdq/ydFQM5gvl3rqlxf1PF/hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EL2xn3WChpW1yN56Nj+ytEyWt8nEgYhBUI86Hu4SMDA=;
 b=ZrUXRYL3Gh5lWCJkcGF3nLikJfMUHaJ70mV/XJ189N6DCyWT4qJU2qGMczJy7fqFHZgTuyyDiVDYAv35jivkgOLeOamMGJL7NIwEYNJABMTD2QWsU7cn72JAwk1gUJSV+ui8lQSA4g5KjkpVJX/5S1kEUAds3rrsMniRXdB6BuY=
Received: from SA9PR11CA0017.namprd11.prod.outlook.com (2603:10b6:806:6e::22)
 by DM4PR19MB6512.namprd19.prod.outlook.com (2603:10b6:8:8b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Mon, 8 Jun 2026
 16:02:21 +0000
Received: from SA2PEPF00001509.namprd04.prod.outlook.com
 (2603:10b6:806:6e:cafe::8) by SA9PR11CA0017.outlook.office365.com
 (2603:10b6:806:6e::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.13 via Frontend Transport; Mon, 8
 Jun 2026 16:02:21 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SA2PEPF00001509.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.7
 via Frontend Transport; Mon, 8 Jun 2026 16:02:20 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 10B17406540;
	Mon,  8 Jun 2026 16:02:19 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id ECA14820244;
	Mon,  8 Jun 2026 16:02:18 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: vkoul@kernel.org
Cc: pierre-louis.bossart@linux.dev, yung-chuan.liao@linux.intel.com,
        julian.haarmann@student.kit.edu, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH] soundwire: dmi-quirks: Disable ghost device on Lenovo Yoga 9i
Date: Mon,  8 Jun 2026 17:02:03 +0100
Message-ID: <20260608160203.151943-1-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00001509:EE_|DM4PR19MB6512:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 6c73a6ad-8082-41a5-1b8a-08dec577528a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|376014|36860700016|82310400026|11063799006|56012099006|18002099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	FJSVsw5DOxrefhRBPlKAom+jG0VGoipQ3SPixNbQ2Q4tq3GAg1s4Eeqr7KoRo7t+5MXReqF+GmHsQOTCfpwyS23MEXS2IP6BK0xfDUzH3IaFv3sbAwUWUtIRSr10p0vQ9juoONzIHIOhEr8OMa6KfWO+JI4V26QlfSGw3yC3Qt0UXr69RkjZPxLqpXgTQorc7YLMLOna04ydHDr72ptcO1a6NwWxXvGxvFHKaHt74l4/n64/Ll/ly5cdQgTPlVCPU+VlIb/c5ZRJBoXw6F6zzLwjac2xPSao3tdvjXJereevuB89w6/g6y6OCDb62eW+Z0JJrOwZq72iny1mStt+bpCADHKB42AQoz9tk8K+4hiJo9TNl3r5yViFpbPz2ZBtOwJfArbkqsQsD06ZHZqvoarXJr/EeEXo4SYxg98VpmEKoIyTVVQFoeH84xdazk5fb2Rcaq5RrS+GE3seonKax3C0BX6ADXhAmp6aPOUzAcbuUwwEi1OpWfsX50q6ZyQWQoo01Tx9rYkBnZOnacJp/NzlOncFtTZAbkEtOjv50lv2OyGriwUpOEc8rjRLslH6JPiYo7IVfy/GeMdU0HtzKB8vqfLPwuvtYju85DlSEMdTarhotB9ADcIqpfzJNoVWHD6pEGhBJ+Sc6+vDSl3U9uS8fOAlMKb3uiwB/3taZBETvCZcX0rArdEZKghKgigp8aOaZ4jXUe/lDIWTlYYfvVCw6wIyHyhKGbykE24haQg=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(376014)(36860700016)(82310400026)(11063799006)(56012099006)(18002099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	mYZx2WNosCUCCZ7e08uFOtsKWY3m4Le3b1sqhkxp/6cBjsA3+vm/e5nTwIPBUM2y+eXUiGFJYlm24BeYZOZwieWHEsrQmoDMghWN/fu9vl6o7vuorYaarcD/HN+lfls1MID+AVr3HDjzk7IMxXJlnVz7Mfd0kKueUW0EMD0ofvru0YGMYBTPybZ89af02W9xl5Z71pf2C4Ga/QVu8yeU23iLg7xqp6jJElJuQoALql8bGjK88SI496WbZTsmjY+elYSaEqP0JhjDHHvOf1Q73mdIWZlsz8vv3NjZ+2/EDGmEfm07N+S6KKuubR6S3iMxCPnN6O80J7MCLogbuad+lm0vKkXYaRDwW/GrHtnVp87vXUkN7SQJc3Qmc1aR9L+sCMebfJETUEPC8v1imZ6txFNkM66eUEngE9P2nKiSM6SNTOhX5M0a2Jiwe7e7Pm3K
X-Exchange-RoutingPolicyChecked:
	bx0cUgQEFdGb/9V5EqjYkb7LQTDQgnw+9lu77DMMIaw5X1D1mq1vXz3H4hBMueRoZ4yZ/QArpUrKm14YPHB8Sna2cQsxAfLEKGRNecBTVqujbQMwTxYhtrO3sTga+qW9ub/+yQPiV6yGojSl/+Fdj4R7xyCjwUauM6s9BxqCsTdJ4mKn8KeowFkpCtzu+8fYUoa8dU0X+fxBckHYnxAs5eXpOK3+DRJ0TetPBKltj26y/zdIa7i7+vtjL7g5W6rHgLvea4T97ZteYqbLNpEF85X/bCYKgPMaXL3Uc9qaaxNiqBCUcFAsoiN7ubArkjzevzHD77KXq8fc63ycsFrb0Q==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 16:02:20.5610
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c73a6ad-8082-41a5-1b8a-08dec577528a
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SA2PEPF00001509.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR19MB6512
X-Authority-Analysis: v=2.4 cv=GP441ONK c=1 sm=1 tr=0 ts=6a26e793 cx=c_pps
 a=yYYKAKAKl8D9GxIYT1WzoA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=63GtIddKG-ENwnAW_z8A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDE1MiBTYWx0ZWRfX8HkRlR5qXXLA
 p/GZN0w991T0A9g75sOqB9YLKxHxjdW0zl9jxMFcgp50l18qXoEsi1oS6uWrPS1S2geGWL52jtU
 mwkmRf3BXPfhy1SaLgXajbVUDjJM0I7FGJIx1gDLpiV8JR6Oc/zwlITUauUo/YR/0ktrB+/8fw9
 vUsfWjCdUaTEpo8gotrvCSzfh2cWBxpUlnKZQyf1npPC0cDgpei0gJBXQNJ8WdN4Mxu3vTXhN5i
 Xk/l/SQhzp47PvGoz7cJT20Viuf0dqHkMDoIBFDVnbOyTOmvWyuOUj634KswzFNkN0kMeYYDAc8
 zx68lfD/Ws0wRrHvUI3y/Q9XuDCmfy/g5AUrR5Va+E2RlVTbEBSySjFJswtAZxeWcYH7ALmjcXF
 iwTfCztOtR0YZzGvY1Ahx8elnpWH5Iu93hmbvluWinuh91vr7lKRHDu6N8w4kS6HYUqxGB0jiFh
 bsE2dUQr3NnoCcf9CSw==
X-Proofpoint-ORIG-GUID: XpawgWSm23LOogCK8fd0VGcQ4-g-4LLy
X-Proofpoint-GUID: XpawgWSm23LOogCK8fd0VGcQ4-g-4LLy
X-Proofpoint-Spam-Reason: safe

There is also a "non-pro" version of the Lenovo Yoga 9i (83SE) which
also needs a quirk to disable a non-existent Realtek device. Add this
missing quirk.

Co-developed-by: Julian Haarmann <julian.haarmann@student.kit.edu>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 drivers/soundwire/dmi-quirks.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/soundwire/dmi-quirks.c b/drivers/soundwire/dmi-quirks.c
index 32a46a2d90f7c..c7e50873c8739 100644
--- a/drivers/soundwire/dmi-quirks.c
+++ b/drivers/soundwire/dmi-quirks.c
@@ -192,6 +192,13 @@ static const struct dmi_system_id adr_remap_quirk_table[] = {
 		},
 		.driver_data = (void *)ghost_realtek,
 	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "83SE"),
+		},
+		.driver_data = (void *)ghost_realtek,
+	},
 	{
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
-- 
2.47.3

