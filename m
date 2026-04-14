Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011025.outbound.protection.outlook.com [52.101.52.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DC0A36DA02;
	Tue, 14 Apr 2026 06:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776148702; cv=fail; b=SykXNHs4+EWeNyKr2Po3ftRC0k7TTxgsycfQ8/3XA+66Y5pz+aycvwhT6cZHxMGaF9NYf+nBCqHOhxc2qO2bGaJ3M+NONqPCLENerJTtLPakfYlsj3Z8TJzAXnRB+1/JR58hgNcQgINq0sU9LyZdkPg/L1zzIbKDYByjZBCuWJU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776148702; c=relaxed/simple;
	bh=z2wBp1k6quW69/MhwFc9kJmmCQVNyCyDfXZF8JTBMXA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rJNFqxpiXnd0y19lUyhvvJJVqIiVwA/U/v7jvmfdrqJw4qTUIEGXIdgovkdEdalj6IAtVbNsqFYReGzvtZCFQXVzTbSzthdy9R078cecMqWUgTopi1scY/d1yX6Yte9PNwYRzi+97b6y67FXAcctnI+oBmxm0u+Yg+iQc43ffaQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=pmpqKeVh; arc=fail smtp.client-ip=52.101.52.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="pmpqKeVh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PJq7D1Bp2d3EmHFJZzD2AegxcT0+778KMYGiFP3FB6Kizh+qpcrnkIeoRcz+eCvXlab7F4vtfn2tO6aesyKDy9sX1ZyUy08tRlEcnWNFAgxIkb2MVrlFS4rTSInDk8t0DdK7nXEU4WhUfnGRMtmvEdaBDQAVrEB704OSJmWNCXCsSJ+NP5Oph+ygvn8lM33THVzmZzJcx46slkUX9yu7cqtDmxPWMXKNy40rgcMgvUhBcwSxeUSJu01OxRSIE4CQ6wfEt/sEvFTHNekEdYaaZuuAo6Nwjv/MgC79/tGpfHnHILFQF7C6719udmX2h7nhX1Pny7BX566CQJTaYe+IIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zUEwaUvBhhYuecKRtQ9a5lsZO8kvrpX3x8UUD5KwrWw=;
 b=mxqB3KlZe0E6hv7iYEsi7YXqkNxuS+0G7qyslLcZeUOksYU0uCEe+zm4AGO2q6ZhXTIHIRZEIx1Zw88jG+TvO79aPMVFeKD9Zdc3fyGfRxOTSkGJn7EGvbxNVqjFptJa52YYAC8Yw+7uDgDsK5qoDdDxdGsGDHoplcyuUl8xSzFOlw7YvZdz+IYD3Rz6THClWx/MWCqPfGkYIpEuoEGaKaCKW7w0qXL6qCg62DD92nI2OU3rAG5p2fP1OpoLdbAsz9Tyf00kGjhxPwCigAQVSUsjladsq6vcsqS3Ybn7+Lmc83aRFvzmGxMvBA1HY4C48io1QV8zGHj3o8RExz5V6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=google.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zUEwaUvBhhYuecKRtQ9a5lsZO8kvrpX3x8UUD5KwrWw=;
 b=pmpqKeVhQmOjEt4ffe+IZmWSaM61NIez9J7Vgu/OsDpYcER2i55BJ8bl7LmZxdrztxyt34BFPk7xPKw+mGIuHPwkpf5zYfugKkneuDBcypo6MCVKhNT3td9ZrujRKv0a8yMLO+qbGn4oC+Es22/5Faszeyfh9xyD8IswmJfUgu4=
Received: from SN7PR04CA0072.namprd04.prod.outlook.com (2603:10b6:806:121::17)
 by SA6PR10MB8109.namprd10.prod.outlook.com (2603:10b6:806:436::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Tue, 14 Apr
 2026 06:38:18 +0000
Received: from SN1PEPF0002636C.namprd02.prod.outlook.com
 (2603:10b6:806:121:cafe::3e) by SN7PR04CA0072.outlook.office365.com
 (2603:10b6:806:121::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.48 via Frontend Transport; Tue,
 14 Apr 2026 06:38:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SN1PEPF0002636C.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Tue, 14 Apr 2026 06:38:17 +0000
Received: from DFLE204.ent.ti.com (10.64.6.62) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 14 Apr
 2026 01:37:56 -0500
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 14 Apr
 2026 01:37:56 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 14 Apr 2026 01:37:56 -0500
Received: from lelvem-mr05.itg.ti.com ([10.250.165.138])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63E6bfQp2327872;
	Tue, 14 Apr 2026 01:37:49 -0500
From: Baojun Xu <baojun.xu@ti.com>
To: <broonie@kernel.org>, <tiwai@suse.de>
CC: <andriy.shevchenko@linux.intel.com>, <13916275206@139.com>,
	<shenghao-ding@ti.com>, <baojun.xu@ti.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <lgirdwood@gmail.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
	<k-yi@ti.com>, <henry.lo@ti.com>, <robinchen@ti.com>, <will-wang@ti.com>,
	<jim.shil@goertek.com>, <toastcheng@google.com>, <chinkaiting@google.com>
Subject: [RESEND PATCH v2 2/2] ASoC: tas2781: Add tas5832 support
Date: Tue, 14 Apr 2026 14:37:19 +0800
Message-ID: <20260414063719.3467-2-baojun.xu@ti.com>
X-Mailer: git-send-email 2.43.0.windows.1
In-Reply-To: <20260414063719.3467-1-baojun.xu@ti.com>
References: <20260414063719.3467-1-baojun.xu@ti.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636C:EE_|SA6PR10MB8109:EE_
X-MS-Office365-Filtering-Correlation-Id: 80c29af0-af10-4127-5fbe-08de99f0694d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|7416014|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	sYOevFcPVbsDKk+BnrfHz1nJdqXpuhnEbXdhd5+YF8aW25t97DTx/RbWCY0cToxifDYk+i9T5Id0X0hyZeICQKYvB0KjiLSebkIEsInEW1HCQTP4lAGX4JTSRozX17BMhpY/5CJ3B8xJvMTlIpOZETs0HBUxEXZOUtZXp7TqgA60ap7VNnSq/iDUhHzr0lnJm+5skx1gkuvsh0W4OFenC8GFiKbPCqG0/0gfiRevZFyJIGsIFJaep3EgNn6iJxc3s279qawoiQqMVxSoPRYwp3LFfvEo28UlR2rV5mq90V8BMCxSIcXlQuqYgzpGsXxg2UrK0bmcaJ+8kU5t+n/+o75lotYOJhmcHWh+KmxSINgAjnpI7z+sBBw3M0ObemEfDb04UYyanVYJ0X3UUk+MH7F1uUi+B3CViemBSs2gKCplLC8S5k2Tv/+KKQEegh+iluEDJ0s28kQ1gGHRTfYSk+MFd8ulByzaCkU8oxSeYe/U54F60pTvQrJI452WZ0fcK0xw3B+Lm+KQEE7b0wYY0XXbIbtVNnSmU7zj57/zIWN0b4llFVYgNwOAkBa8cGosMLq5tk4KIJD9Jc9RwRms0HJSZUEV+3HTB6zJYCEmAoIY5nREwT9uvDxw0fva/og/vgfnQfmbit75BLO+0UQuqY6Bmsjhk87fDOIBjhotBgQRDBG5p5fKUKZFB7zPCLYTPxlmA8I/Xk4RY/iGm/Jf+3LThcdXPUjIr7teL9mUCe6LHT50GJYuePybXNdhI2gdDynUiPieUTply53f5KkBEg==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(7416014)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	GS864wq5KSYurcMAcpiW6budlrKsYLRBFR9D+0vISTPtpLr8+ib0WVlqCQ+7yuKxgk8z2vBp8fnF6EqWfZGeIMrzNVkW4LjZKGeNsaYGc/qjQSKqxcrE229ETfPsupYQcKm5nih4U8SS3Ewp+J7uaB26B2haBPPp7vCgREu7qi4jGaISzQv1Cr2+ykJy5GjUlUtWKFyDPW30BZ4uUJH0qwr+9hwdtynDZrf7K7q/VswaZkiJ/G0sLPFEj6B9F1lWHO0UDu37ec7wkw6Sr4Oi3RmMQjB0uJTkQ/cw+myBV8C8RUbawrNuMDLBBMDJj4MEtZkBoziJQ16t8fRjh7284I/heS10BWYJYNMpt/d1VVGI181I+MEjapG7bdVfgkoZ07B/5ZbUdhuiPAa0Bnh3F9F6f4theoXogv9iJd7F5uD2Zr5pj7S43goz2Utdi73P
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 06:38:17.0369
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 80c29af0-af10-4127-5fbe-08de99f0694d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002636C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR10MB8109

TAS5832 is in same family with TAS5827/28/30.

Signed-off-by: Baojun Xu <baojun.xu@ti.com>
---
v2:
 - Follow the updated association protocol based on device name and id.
---
 include/sound/tas2781.h        | 1 +
 sound/soc/codecs/tas2781-i2c.c | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/include/sound/tas2781.h b/include/sound/tas2781.h
index e847cf51878c..95296bb4a33a 100644
--- a/include/sound/tas2781.h
+++ b/include/sound/tas2781.h
@@ -131,6 +131,7 @@ enum audio_device {
 	TAS5827,
 	TAS5828,
 	TAS5830,
+	TAS5832,
 	TAS_OTHERS,
 };
 
diff --git a/sound/soc/codecs/tas2781-i2c.c b/sound/soc/codecs/tas2781-i2c.c
index c593f9da0c5b..86b591c489c2 100644
--- a/sound/soc/codecs/tas2781-i2c.c
+++ b/sound/soc/codecs/tas2781-i2c.c
@@ -119,6 +119,7 @@ static const struct i2c_device_id tasdevice_id[] = {
 	{ "tas5827", TAS5827 },
 	{ "tas5828", TAS5828 },
 	{ "tas5830", TAS5830 },
+	{ "tas5832", TAS5832 },
 	{}
 };
 
@@ -143,6 +144,7 @@ static const struct of_device_id tasdevice_of_match[] = {
 	{ .compatible = "ti,tas5827", .data = &tasdevice_id[TAS5827] },
 	{ .compatible = "ti,tas5828", .data = &tasdevice_id[TAS5828] },
 	{ .compatible = "ti,tas5830", .data = &tasdevice_id[TAS5830] },
+	{ .compatible = "ti,tas5832", .data = &tasdevice_id[TAS5832] },
 	{},
 };
 MODULE_DEVICE_TABLE(of, tasdevice_of_match);
@@ -1746,6 +1748,7 @@ static void tasdevice_fw_ready(const struct firmware *fmw,
 		case TAS5827:
 		case TAS5828:
 		case TAS5830:
+		case TAS5832:
 			/* If DSP FW fail, DSP kcontrol won't be created. */
 			tasdevice_dsp_remove(tas_priv);
 		}
@@ -1917,6 +1920,7 @@ static int tasdevice_codec_probe(struct snd_soc_component *codec)
 	case TAS5827:
 	case TAS5828:
 	case TAS5830:
+	case TAS5832:
 		p = (struct snd_kcontrol_new *)tas5825_snd_controls;
 		size = ARRAY_SIZE(tas5825_snd_controls);
 		break;
@@ -2104,6 +2108,7 @@ static const struct acpi_device_id tasdevice_acpi_match[] = {
 	{ "TXNW5827", (kernel_ulong_t)&tasdevice_id[TAS5827] },
 	{ "TXNW5828", (kernel_ulong_t)&tasdevice_id[TAS5828] },
 	{ "TXNW5830", (kernel_ulong_t)&tasdevice_id[TAS5830] },
+	{ "TXNW5832", (kernel_ulong_t)&tasdevice_id[TAS5832] },
 	{},
 };
 
-- 
2.25.1

