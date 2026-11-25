Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.10
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795607356;
	b=2440QAHLkhHX/1akUVxz0UO4uNwOribnOuzmc/Rj5hqmqTRTxndLl8ZA/JFmIbFbEXRI
	 6QTRIZGdIIfIQOkdLEbykLBS+lNzXeUz7NypCkykdw6a8rzgApS6Gw1udXgJ1BLT+ZO+g
	 5d2wvnZo0r6/Faf1lWyF1F+cYEwTgdxJJVXAsr6rU52HVkLltwuYgc5dL7UY09Ddjxk0E
	 az/gzgI9sCSPKhIas+FNrxx2qrxgFYE0iSdiVMBz/lSupkr4uOwn+y3EozWBqwZcS9nGJ
	 pmxjNfh4SZikefnVhYQHvWZmgyfpbsn1+9s9L5RV+hu+a4YCi9VWsRCXtsr0A6NROWw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795607356;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=dxctmJflRuL9zAMiAR3q+0VjVS8neVLlMXccxHlJrzs=;
	b=bQucLUjagdKcAogmZTBTjLlk7twNDoMIOZIGUj1uElk+I54KNsMaU/+2+BGMn8QlUD5N
	 ADf7Gq+wWaK5yjf/fN9obaszEhjpvK77wmI4E1Z8NMtyV4QO9fkAbi6iQj01Je4VQhk7u
	 jNKCME3Pq+rheAKpco1Aj9dLCT75rliEWmi4Yeuma+AFJH2puMLDQtAiyu34yhuFssQKt
	 DkfHbsKNhGmJLbzzOVp5UEMTIa8W2y/0e3mnHmk0TJuiuDAwyb3lIPV5wFccMXFljtOb8
	 NNp64kQ755xDlC0aQPZKw2Moqa7dKznQhBUb0WLutmfHTTCpcbIThv5uYdFMeYZis1g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b="wb0d/hd+";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.10
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012010.outbound.protection.outlook.com [52.101.53.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F07D606A680;
	Wed, 25 Nov 2026 11:49:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F07D606A680
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=wb0d/hd+
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d+PCgK/LJkXOiHwR8v6efZEpM8UiAO9kuyr0pMXidwGRtviZIytxf9nZr/omPr5eMjtd7dvIuotoaEMD7nvOIhiHOpMueZvXIsVq/IU6r0PU9t7zwfIwgkSYNdh2Y6lycPVY2V8/g6NlfHH2sElPSDDohdlMqiPVLSEQnf+qJSYF676+7R6XLsvdm5W6bwA23RTJBy3tp0lhhdH4taWzltY95evLJVPTcC+zRWzr9O+BuP9XCWopkYJbc2nmdrPnOZYy1a/la7hdntUcGiip89NHJUsMerVZfbu8k3BH8W5iH4qDriAUlafPxzKIDGcSERWW1GcqZuakifAUCVNmSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dxctmJflRuL9zAMiAR3q+0VjVS8neVLlMXccxHlJrzs=;
 b=qNzqsoiyTvc6ls06ynva0NE0sU6Bb7gJD6LIznoCQnPesOlVTk2oKucEBMt0ZVXz8E9lh2grXZO5aS++E1UK4nwj9l02jhb7h/GdHilPfzCSgVJrdGdfwZNqmhFe94ELLRrTLwtW6+DCa9jPQBMD8LUe1q2pt+6UBasgS9fYAMhr4sKOQiHjWtXPTG3yIXbidWc9ZnNDKgARkj4F48248KfwgjPi550vpbyrocY1c1y6Bs1yUgTy/l0fOHVGfH3QIPEIoZGifZKes7D5V9k4vcLzYaldEJOJJ6LudaESwVjHQ03t5MVqiK8PTzaDvuNLuvAdOyCLLR6mxiz262WUQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dxctmJflRuL9zAMiAR3q+0VjVS8neVLlMXccxHlJrzs=;
 b=wb0d/hd+TnEGmvr7qh+EPcYOpCEzk45slXd07jR0W6uxcepRcSL8e1wQg5ecQqp7lkWkTB/G7PVp3SoE6d/MkVoRwKKaUoSATpHhIzvUvHXlgpIabklaFsk3Q1kvLGLlnJhN1NjSNROs5VaAU5FVeSl5S19RTJGMgjjHvhdPoqo=
Received: from BN0PR04CA0053.namprd04.prod.outlook.com (2603:10b6:408:e8::28)
 by DS6PR12MB349270.namprd12.prod.outlook.com (2603:10b6:8:52b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.4; Wed, 25 Nov
 2026 11:49:12 +0000
Received: from BL2PEPF000352CB.namprd02.prod.outlook.com
 (2603:10b6:408:e8:cafe::41) by BN0PR04CA0053.outlook.office365.com
 (2603:10b6:408:e8::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.7 via Frontend Transport; Wed, 25
 Nov 2026 11:49:11 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL2PEPF000352CB.mail.protection.outlook.com (10.167.249.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Wed, 25 Nov 2026 11:49:11 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 25 Nov
 2026 05:49:07 -0600
Received: from xhdrdevl202.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Wed, 25 Nov 2026 05:49:04 -0600
From: Dhanunjanrao Katta <katta.dhanunjanrao@amd.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Michal Simek
	<michal.simek@amd.com>
CC: <linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<naveen.gaddipati@amd.com>, Dhanunjanrao Katta <katta.dhanunjanrao@amd.com>
Subject: [PATCH 4/4] ASoC: xlnx: formatter: advertise up to eight channels
Date: Wed, 25 Nov 2026 17:18:39 +0530
Message-ID: <20261125114839.3642735-5-katta.dhanunjanrao@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125114839.3642735-1-katta.dhanunjanrao@amd.com>
References: <20261125114839.3642735-1-katta.dhanunjanrao@amd.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL2PEPF000352CB:EE_|DS6PR12MB349270:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cfa01d7-da23-4f94-0e38-08df4aea1f68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|7416014|376014|23010399003|36860700016|6133799003|261009223027099003|18002099003|22082099003|56012099006|11063799006|261028144727099003|261102123227099003|261021121427099003|261022075727099003|261022105027099003|261026140227099003|261021123027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	5nJMA/n18zvORyrKuSxivzH2ACDoo53iPQAepAseh2vunheBosC3ABoA0P9Bp7kiA45reOO5ALLCTQGosCQRB9PwNi7PMHVhY5avsKuYkyx2TXiWJhYf0UoZUF88l4VpXktcWFJKwijtPGoR+zrHdUkQhVRlp28sP6Dy9VD+ufw8EL2dDUUpXJtBemnJYd+kYfwy+vI2O5kvXkyKAav8Fidb2W3U9wSPo5Ht3F3srBLH25P6xJzjAFTTjQHOmQ/pynjdPO2P0bGn8pTACkCJUptX1oTPTORlci+ZbnqfmF33NRwdm9WJVkAr1Mv7lm2G6UXyFO0/kMrjzOoxd4OI8uG0XXlEdgJVaqZxdzXzPCxSXC+NBShvq5gvlODDtGPYJ12LRL1JwTFTWBE37oBtzqFiP/1Ror0/Dp24JdcgsuI7RHKTFPJwB0tM3T8QEEOZLq/Wr/m6rcjn3a/v9XfbTF/yKd9B2enCKuXm7qXtzrhT9HmJAKoIepI7RW5Xe2Hxt5q8WLDWn3iqwzfIRKvwG/aBEqAdLm2maWDWYtfhs+vq6ciDlGH8hG9pGyuUfsknjlFlPXlug1n3xa/0650KPj+y2sgkuy/QhzuavX02R2K4MxnUGNE5AndR66YETNH2Dhlq4FvDq7iQU6nrIZhSLuH+0DNym2HN2AIdejpH3V+PIW/miB75uk7VKIqTQV5i
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(7416014)(376014)(23010399003)(36860700016)(6133799003)(261009223027099003)(18002099003)(22082099003)(56012099006)(11063799006)(261028144727099003)(261102123227099003)(261021121427099003)(261022075727099003)(261022105027099003)(261026140227099003)(261021123027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	agENXkjJci49Z/uasldl6sz9yODvfBbr32FaUXQc+0Jg3Fs7R5U2sgM/fQxg3kVoQOtW4+6IV+61hvkxqupzePA/UkJ7Bb5Wjzto6aFHqJlSgOvtwlUNvWGFqg8OyTXScLjbkFq4NLKCnCH0IpbBQ1VF68GWpsNC0+lGMZKwlbsDqsAPdVU3h7tEkSspPjRYREjGpKsFafW8YOWzDNRtN2NqfxeSuODGwhY5IifRzqCI2rInA+uxsq6tOGk9KuQTUHrhMwwy4dPL7X50FgrdmxCQxCyWpuEe6CYNUs8U4SDpjertIsz5k+UKPF69CsheZJjZnLGz5U5R7NOc+c/O4bV0Ff7HejttbS/oxs+4GwPimKcK69nufhi0odLC1mvq51zgPpzxufF7Kh2uyP4bxfp0NVT+bdmafV3pxWHJ6B9hdDvCaCEVKu4IAB2KXq41
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 11:49:11.9264
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cfa01d7-da23-4f94-0e38-08df4aea1f68
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL2PEPF000352CB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR12MB349270

channels_max is two, so a design synthesised for more than a stereo
stream cannot be used for all of its channels.

The active channel field in the control register is four bits wide,
and hw_params already rejects a request above the channel count it
reads out of the core configuration register. The advertised maximum
only has to cover the widest configuration, so raise it to eight. A
two channel design still refuses more than two.

Signed-off-by: Dhanunjanrao Katta <katta.dhanunjanrao@amd.com>
---
 sound/soc/xilinx/xlnx_formatter_pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/xilinx/xlnx_formatter_pcm.c b/sound/soc/xilinx/xlnx_formatter_pcm.c
index 57901c9466a0..d64b27a84177 100644
--- a/sound/soc/xilinx/xlnx_formatter_pcm.c
+++ b/sound/soc/xilinx/xlnx_formatter_pcm.c
@@ -109,7 +109,7 @@ static const struct snd_pcm_hardware xlnx_pcm_hardware = {
 	.formats = SNDRV_PCM_FMTBIT_S8 | SNDRV_PCM_FMTBIT_S16_LE |
 		   SNDRV_PCM_FMTBIT_S24_LE,
 	.channels_min = 2,
-	.channels_max = 2,
+	.channels_max = 8,
 	.rates = SNDRV_PCM_RATE_8000_192000,
 	.rate_min = 8000,
 	.rate_max = 192000,
-- 
2.34.1

