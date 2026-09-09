Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11013039.outbound.protection.outlook.com [52.101.127.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31EF52750E6;
	Wed,  9 Sep 2026 02:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788922802; cv=fail; b=qmK8fS6pqURVBAJr0Ry+LADpoJsQTFLntjZxA+SMW69naMKC1wezHO6zNCrlHUD0eO2ELt/aDrIMn/rA9MyeMCDyb7K9tE4Vh7J3mP7LJa4ofuV8TCnFR4VUz5IHnXFPC7nhXZrnCGsS7LyspWojLZUgI455StOVariWCH6bniI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788922802; c=relaxed/simple;
	bh=jNJGmw4rfvo5VMNYtmIeqrbiFcU9Hf9+6zk3Lt8V8c0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=O9XWyydoqfd3INP4tVA1rVpUP0EeJ+qt+YBWIhXdQ8w8MvDSNcZgUEkfPeOBCEvxLfN8fmXtNNvtTvtScjiYExDLeNPApJ/dNC6AYDQ88C1LO7RblqxZl6BRpPtHkpgYnxVPbhtgNRUOzYyfjCiQf9KcXxYvBiZ4Cey+fIyCUho=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nuvoton.com; spf=pass smtp.mailfrom=nuvoton.com; dkim=pass (2048-bit key) header.d=nuvoton.com header.i=@nuvoton.com header.b=NhJpWc2P; arc=fail smtp.client-ip=52.101.127.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nuvoton.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nuvoton.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nuvoton.com header.i=@nuvoton.com header.b="NhJpWc2P"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UKQ17eDbb4nArRLxESD/KMw1at26z+crQvrHaZlWlN4rH8a433JZVdaggUH2z3N0VF21I5F0Xxv7kCV34wJekQaPulGaHjYUEve/LOTuFw/a9Y27eIQaLPoI5A52QElklTQnJWD8Quzaed8OaEpxZ5APYd1Hx15XPAd2HBMgdCQpMRMJMisAkrWyh6PtdWubH/MIKHCdMN1GZa41FccEWZux/XOc5lQRv+ccC7C0GdzO+JkqXS5Z21U2qHyMFCrS0K4rrJRkKMzcsKMWJWtsLOTkxkxgm6sqFf69irvq7xPz+c76V487NrEDZ15b5UsksTdP1k8OofMmiRFzJTTfXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qy6lrToEmTphofwMe2HgyU4ZuOd4XIO7JzBwAiyqVBg=;
 b=oWJ/YJxwaRRx/BMlxJzRPDUeVHVHkLOGEW0x9mF7jlNNY5Lq4UDHdwbo4Idd4UlkkXdmpyjlcRzWPVG5lJFsZQl9lbnI9nTs4esaVJ+va2DyTC5GrwMNCCD9ewIIgdonYPHCCrrsx9dgLmZ/LHQ+7T485wtp/IZryYbTzwq/ws5JEN8/1A9QqVwEMTDWv4Cqrh+162QKIiAQygNiSarIMHQf1o2yHpd7K3hphTm1na3R863ZFOnN3ZEY2HB2w2jq9nERSV/O8UlAZti9d0aITQzW37AOzXyGeK/8jgfRCC0UApRKwUwCHD6R0FDCqeQlE5DmJpLysHZSuvu0JhZktQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 211.75.126.7) smtp.rcpttodomain=kernel.org smtp.mailfrom=nuvoton.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nuvoton.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nuvoton.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qy6lrToEmTphofwMe2HgyU4ZuOd4XIO7JzBwAiyqVBg=;
 b=NhJpWc2PKl3L5jXKDSjfBJUk/9f9sezkR9pE42RnmG1W/rGFD2GflkeIJFb25idhdq55DmaqwnOEwnTx+tiGvQS915gSOHZBPGrvagQUPA8gUO5ogDpz65CZY0o2gWZi4uQYcLFnQ3mlkfhWBgHGWdZBPmUW7d6C+PFQd9o9itH6l7a2ziPzNL91io4RcArX4VJzvyZmBkpWSeMtppcKDGCCvpz59q53zknaimxXOrevhNzEKmjDQ6aCMhlDOh9hOVqBxVlncD2GVr17j0srErU8Omg0qL/DD67+aCvaKNhQlOHyF/KJrmpGLHl17GyMdSIwBmJNbIWaHeHqE3I+WA==
Received: from SG2P153CA0046.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::15) by
 SEZPR03MB6992.apcprd03.prod.outlook.com (2603:1096:101:9d::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.13; Wed, 9 Sep 2026 02:59:55 +0000
Received: from SG2PEPF000B66CB.apcprd03.prod.outlook.com
 (2603:1096:4:c6:cafe::29) by SG2P153CA0046.outlook.office365.com
 (2603:1096:4:c6::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.4 via Frontend Transport; Wed, 9
 Sep 2026 02:59:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 211.75.126.7)
 smtp.mailfrom=nuvoton.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nuvoton.com;
Received-SPF: Pass (protection.outlook.com: domain of nuvoton.com designates
 211.75.126.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.75.126.7; helo=NTHCCAS01.nuvoton.com; pr=C
Received: from NTHCCAS01.nuvoton.com (211.75.126.7) by
 SG2PEPF000B66CB.mail.protection.outlook.com (10.167.240.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Wed, 9 Sep 2026 02:59:55 +0000
Received: from NTHCML01A.nuvoton.com (10.1.8.177) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.61; Wed, 9 Sep
 2026 10:59:49 +0800
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCML01A.nuvoton.com
 (10.1.8.177) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.61; Wed, 9 Sep
 2026 10:59:49 +0800
Received: from localhost.localdomain (10.11.36.27) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server id 15.1.2507.61 via Frontend
 Transport; Wed, 9 Sep 2026 10:59:49 +0800
From: Neo Chang <YLCHANG2@nuvoton.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <perex@perex.cz>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <linux-sound@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <alsa-devel@alsa-project.org>,
	<neo.chang70@gmail.com>, <kchsu0@nuvoton.com>, <sjlin0@nuvoton.com>, "Neo
 Chang" <YLCHANG2@nuvoton.com>
Subject: [PATCH v4 1/2] ASoC: codecs: nau8360: Block DSP path selection when firmware load fails
Date: Wed, 9 Sep 2026 10:59:46 +0800
Message-ID: <20260909025947.287120-2-YLCHANG2@nuvoton.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260909025947.287120-1-YLCHANG2@nuvoton.com>
References: <20260909025947.287120-1-YLCHANG2@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NotSetDelaration: True
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CB:EE_|SEZPR03MB6992:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b8129f1-a7a7-4487-0955-08df0e1e6d2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|1800799024|376014|10067099003|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	T5H5kFHvvFZy7BJic3bxoqbFgjMdLMHUaiKB8WtmCxPUTHdsU53nbhcRPep8liYbBrZiJfpSe+kw67cenhJUujKOX5YV0kPABfQHEvOV2mLbo3pJ/z3OgcsGKkCOW3/+Z6U0q7dvAQ1uldPWpPoAcTuWlvwgj+Xlaogm5bbMfcu8dfUpM98kf3GgeB73T91hpEJUnT5lxo2PDQcCPZ9JRiXgqSHNtBB6vVqgigvIwpXHE5fDnk2RVrQuTPRUUATmvToDndpoxYhFf9zGT5Q8SlU2Zgyn0ztdcDPJvjf+t8/Gje07vq1OAVZ5+8ozk53UysRxuKXX6fHbLGdARvd2MePnHj8eNveCJvApWyg/UeUwpekr9TAqPWLc1fXQNUGLqqLsdj15n55L5YLtT6WXM0/3s7e3tS1XJpTa9fFfiVMtQuZKwieWyNd4eys+eiFrgn4A8DtDw9rCvMwhg8t4+5+IjhASVaG8VvtLmx4TbBNk0tTVT1u/W9mchTybDk3ZpCTazSUsSQyTwk+xgCENHl2JrMt0t6SZynsxsba/gIhTJkqY95LZYSs+qWapgDCi7ed8ZytUAxt5iiLM85czAvDNuzqxciyZ9h/zPvDcYlNhFDm0SvjDk4FJfV5dpm+wKxXjPA0qyEUgBBFd7w+rnBIxzj5jVNFd5NEB4QDAFNdUlrcWh1yRO39T/9M+FQaJZu/1SljC69wREk/lElPegQ==
X-Forefront-Antispam-Report:
	CIP:211.75.126.7;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:NTHCCAS01.nuvoton.com;PTR:211-75-126-7.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(1800799024)(376014)(10067099003)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	SQ9gOBjSJlpdHxFVoOrdY+aU/HIprEsRN23uubL843yNq/wNHHNfGXQ4QletQ5alYv+qUBB+I5hfrEgCi/xj1Rd9eHdckV684sYrvchMz4q3bP7x2FMFDWcrxlWORm9FGLVzov9ChbhRsWkR3MD8i8x8EXUXLHt0jizLEnH4kqKpNbfOf80Q1/cMBiF2UoeIfWESvQ3cYJEEYWjuYgfLw+xE3cdgXfPSiI+N7hxl0D0NuNQKjjzNBaxLH140U8exse+K2ip4CWatJgQcF9S9Vs4V3mwIwAQy5ABIitX5rfxAw9vXyKk78ZJsemyhrYTYcnRgOG79MleXlf9eR12mI0XOgKVQCnbjITyyP27ndbljJBoes7R3UoZgizzlK/S42No9eT8g9+VO4z3k3OvJm6sm6Doq7ithRvoZQWTimCnpgAXk8BiWrhMineFV/DkQ
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 02:59:55.2183
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b8129f1-a7a7-4487-0955-08df0e1e6d2e
X-MS-Exchange-CrossTenant-Id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a3f24931-d403-4b4a-94f1-7d83ac638e07;Ip=[211.75.126.7];Helo=[NTHCCAS01.nuvoton.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG2PEPF000B66CB.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB6992

Block the DSP path selection if the firmware fails to load to prevent
invalid routing states.

If the firmware is not ready, nau8360_dac_mux_put_enum() will print
a rate-limited warning and return -EBUSY. This rejects the invalid
userspace request and maintains the original hardware state without
causing audio wrong status.

Signed-off-by: Neo Chang <YLCHANG2@nuvoton.com>
---
 sound/soc/codecs/nau8360.c | 7 ++++++-
 sound/soc/codecs/nau8360.h | 6 ++++++
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/nau8360.c b/sound/soc/codecs/nau8360.c
index 89b8ee80d6c8..277aa982c341 100644
--- a/sound/soc/codecs/nau8360.c
+++ b/sound/soc/codecs/nau8360.c
@@ -715,10 +715,15 @@ static int nau8360_dac_mux_put_enum(struct snd_kcontrol *kcontrol,
 	int ret = 0;
 
 	if (snd_soc_dapm_get_bias_level(dapm) > SND_SOC_BIAS_STANDBY) {
-		dev_warn(nau8360->dev, "changing path is not allowed during playback");
+		dev_warn_ratelimited(nau8360->dev, "changing path is not allowed during playback");
 		return ret;
 	}
 
+	if (item[0] == NAU8360_DAC_SRC_DSP && !nau8360->load_fw_done) {
+		dev_warn_ratelimited(nau8360->dev, "Cannot enable DSP: Firmware not ready or disabled\n");
+		return -EBUSY;
+	}
+
 	mutex_lock(&nau8360->lock);
 
 	ret = snd_soc_dapm_put_enum_double(kcontrol, ucontrol);
diff --git a/sound/soc/codecs/nau8360.h b/sound/soc/codecs/nau8360.h
index cc640ba8c838..71396747c0fa 100644
--- a/sound/soc/codecs/nau8360.h
+++ b/sound/soc/codecs/nau8360.h
@@ -870,6 +870,12 @@ enum {
 	NAU8360_TDM_TXN,
 };
 
+/* DAC Source Path*/
+enum {
+	NAU8360_DAC_SRC_HW1 = 0,
+	NAU8360_DAC_SRC_DSP,
+};
+
 /* PLL Source */
 enum {
 	NAU8360_PLL_MCLK,
-- 
2.25.1

