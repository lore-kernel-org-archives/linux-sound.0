Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.61.23
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795607386;
	b=xBYQ43+vQKPwe1OWEMx82DIqMqWHLHEPUT52jHEEpXLTLhA51iXKi5ZWSdeIHMiwoEiF
	 VFTGQCZ8+UpGfCqx9YW++GUoJYGTvG418q7Rv3W37BiAaydBZGApWnmToeB5at4YCBEzE
	 C1vwTmfOCL7ILlS4j21M8NwZa5dQbf4nA2oPRNhy+fdg7sQrGATO/hgwS8xuX4NEHoidX
	 qHvWiZKfl2RCh8uAozI1WkxObysr7862r1eRoTrX2N6vNiCP1Ciix4Q2HaqZnruCl7tAO
	 sxeGDfIRKun5qrmgLccmLLedIMvDebPUhvXaBvdeK6nlKBLzK+9dylAqOHnO2ZYFNcA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795607386;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-EOPAttributedMessage:X-MS-PublicTrafficType:
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
	bh=DeVLP1ubzO5rnpZndmM9GvxlmFH07yQ2vQoOt+PV+9Y=;
	b=TA8fcbkbrdCwH5W6rvOQHONdeF/fPxQeYzdC4sbbLXpy0Fm6Tq9YyDoc0+llgVBJMygR
	 nn2p3UhLxERVymJ01mLPhJSDANDUjvaOcmfeeXwSyPxPdtdYx1FI7qqlZ9kDSGh+39TAl
	 l5gbxpsXxr+FSlFF9rRSCSf9+tbD4XSZOzniMB+4omOrECA9KPFHA8uCn/ZasXy0LOKUe
	 W4mT0fSIPXT2Y0Jg+JAYceV6sH2wvyE2+eVhRn+aH5n4Q7Z7HusGxPpSfIherx9W68Sz9
	 Zv2iJehw/UqCHSu8A01DG+nVfmYFXbpcCS3/yka/2/ScAbS0xB6yqkubB5gSuT4Jyfw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=1J+kKg0I;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.61.23
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010023.outbound.protection.outlook.com [52.101.61.23])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2002E606A321;
	Wed, 25 Nov 2026 11:49:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2002E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=1J+kKg0I
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=biS1KtSFGsCpjV5yNcgiSoAbZGerZ5v6xstBvitC6upctBmrK65NWQVmp3p+0v6rN9tMf2T288n96vPDGNDedaSKvm33iERyYqj3+l3nxvaqh6cieJEGVIbQ3MU6VN1/FJXwM8DShfeW8ZuyDfhHO9U/WB4uK/c2obxqHSkRpMCFXK1XvTZy7pzp1sqcFP0fJFaczsGISRaa7Bpp1rSukLM3x7q7vQxRCi3FDnTchuvms9Uhk+kOqqtG7fHu7lWQ65sAmB8vqZJkteCQBxlOEeVihT5pE6lfP34JQleSCAsT4qVJ5CgBkm4GxHWTtRFaUQTH0XZr/A1jYMlei1+M+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DeVLP1ubzO5rnpZndmM9GvxlmFH07yQ2vQoOt+PV+9Y=;
 b=PlBqceEfFuD06+xlezkxc+XUELwx33f8MfA8vvOcMEWddK/68a1RQJACkhdqyBoEjLfYTQHV4sQj/zAR8CXThYLtUjow6h2RNNZT5Fir1TsP/sIi/BjPV5gJYWfMTr/3IwNlCa02rcuFuUOEPSbgRMZDXzvZAWHlcqAtiKhTiEX7yrTrU5M/m/rvXjpuPUFCrFYLbgIPCe5TFMqkOb360bPM/IxD+r3JB58c5BUhQqfyylOU3ingdvu0tImuRnSLadbO1Zguz7fhtM8AhamgDN9ixy/+oAnPaXi7HVtXXVcCsExApLh68HERuI53hQm8KFeTEoQqVfVJtA9OSNdEcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DeVLP1ubzO5rnpZndmM9GvxlmFH07yQ2vQoOt+PV+9Y=;
 b=1J+kKg0I2D+f0tpfAJXt9T6rtqPnu7PPHgdmLXezNWZPwjI5aCUGbZ2TQSDkN8sncyvghqRnZGvzaRKNcbKf25bt5P9+GI3oRN7UL6mcSwVkvRuW2nhrRvQ6OzPrfSDIKXdNhyihhv+q5SF0TlTJmMqt9qyd6SS2+odFsTBzeyE=
Received: from CH0PR13CA0026.namprd13.prod.outlook.com (2603:10b6:610:b1::31)
 by MN0PR12MB5980.namprd12.prod.outlook.com (2603:10b6:208:37f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Wed, 25 Nov
 2026 11:48:58 +0000
Received: from DM3PEPF000265BB.namprd04.prod.outlook.com
 (2603:10b6:610:b1:cafe::10) by CH0PR13CA0026.outlook.office365.com
 (2603:10b6:610:b1::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.688.4 via Frontend Transport; Wed, 25
 Nov 2026 11:48:58 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 DM3PEPF000265BB.mail.protection.outlook.com (10.167.23.248) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Wed, 25 Nov 2026 11:48:57 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 25 Nov
 2026 05:48:55 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 25 Nov
 2026 05:48:55 -0600
Received: from xhdrdevl202.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Wed, 25 Nov 2026 05:48:51 -0600
From: Dhanunjanrao Katta <katta.dhanunjanrao@amd.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Michal Simek
	<michal.simek@amd.com>
CC: <linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<naveen.gaddipati@amd.com>, Dhanunjanrao Katta <katta.dhanunjanrao@amd.com>
Subject: [PATCH 1/4] ASoC: dt-bindings: xlnx,audio-formatter: add the AXI4-Stream clocks
Date: Wed, 25 Nov 2026 17:18:36 +0530
Message-ID: <20261125114839.3642735-2-katta.dhanunjanrao@amd.com>
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
X-MS-TrafficTypeDiagnostic: DM3PEPF000265BB:EE_|MN0PR12MB5980:EE_
X-MS-Office365-Filtering-Correlation-Id: 913e3076-d9f4-432f-fb28-08df4aea16ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|30052699003|82310400026|1800799024|36860700016|376014|23010399003|7416014|22082099003|18002099003|56012099006|11063799006|261022105027099003|261028144727099003|261026121527099003|261026140227099003|261021121427099003|261021123027099003|261009223027099003|261102123227099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	DyZANWD8z73HwU3fFF74T+fHEGgoParnJbjCN1xW99KsWj5FndZJ1lHWnBCKHLqQbIwV4WBlXZffQQqsVcdnecOh/QDj6Xu14mYnYJoRjkuzwv7Ixt9lNzFEFFNSdFHFuRQa78BixgDpfCYLAFJMzkMMDKLypzWy1rTbYbHLgvZmz6k0g/EEYUiOlV4A71HZxWrVCdkQPPXleLScvXIDCE30OWC8kQ4sYBUDnrGpCBe8iC2L+KPEAZaZS4Qj8J9BWBfcukZJzt2R+84aWLw3Kq6D1xm5iek1VCSABRQvfuSHXmzySBt6uD0yst4o+zyGhaWCx1y5DnqYMpHv05HJu4kylzrG7tPZXc4MBupJb/IU8XCykzicAXtdWNCvAo2rFBTNniOtvBEGJ9g4qyi+NLyMbFfzZuK+etamALafz87tADxSQz/T2WzFMl5klvQ5BAnpsTufm0PVYrBVBt/VqvCFl57ovZkKJGxuuM7vuJJFnwGGJy93APdatSDCsYj0weQQraSqlZ9ptk0bNNGwpYGhaB9HBy9Pk54IsxNykJmhPWvuNS0dXQ6mhDLkc7bSS91owL79Aes41lWZYoeKBqWcxU0bB7AjBqq1vmgpTW1lcFyJRRM/5deOXBbGqJBM77pq4J6LzIgsEp8nX95COt/71MB+olnmuQDIdV0++zUhEqn49PrpELkTC1rR4LJA6PDHF2OmPvHbnNh0WooGMw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(30052699003)(82310400026)(1800799024)(36860700016)(376014)(23010399003)(7416014)(22082099003)(18002099003)(56012099006)(11063799006)(261022105027099003)(261028144727099003)(261026121527099003)(261026140227099003)(261021121427099003)(261021123027099003)(261009223027099003)(261102123227099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	yeUqTW0g8A7JAojyV1Ngfq9+KMTp09Bol8lbVe8DUMW6KNoSyEWgCPW61whc/zqf5DxnAN6DYUj1iOuDJ8p1wmLYbIogGpZl20KFCZlN20u6cUP8CmO66R8bOGBVBzq4cXqLZRxK7efhWOfCZ4Jgh2cbcE0wRSJ+TNCxgHYzQYe7YTXYm8ztc0QYdXJ7NCdA2yQrm9yuU1nIjbDYdRFWEt0M/L04/C0vr2yCDBGg9BZav7AyCNqZfVoXzcjsUP1WE5Tcyh/HqkwGw7Sq0hOEmu8kKixnLI1tR5t9jsWyr+MvD3WQrZ3Ka+qr8u3g4CiL38gtwBoF+LbMI7SWEclf+RxHSTRcUxOBqks+/r1E8Ljg6dZR7V/x0itgJir8pE4jEEt4wY6RUecv9M7kgbJPqW5PxxMzwJiIpP1a9apnBDsz/oGn1rx43qqfFsW6laVt
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 11:48:57.3243
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 913e3076-d9f4-432f-fb28-08df4aea16ba
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM3PEPF000265BB.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5980

The formatter has four clock inputs. Besides the AXI4-Lite control
clock and the audio master clock, each of the two data movers has its
own AXI4-Stream clock. Only the first two are described, so a device
tree that lists a stream clock fails validation.

The MM2S and S2MM movers are instantiated independently of each other
and a design may have only one of them. Let the third name be either
stream clock, so a capture only design does not have to leave a hole
where the MM2S clock would go.

The descriptions of the two existing clocks are wrong as well.
s_axi_lite_aclk is the control interface clock and not a clock for the
data stream, and aud_mclk is the audio master clock.

While here, move allOf below required to match the layout used by the
other bindings.

Signed-off-by: Dhanunjanrao Katta <katta.dhanunjanrao@amd.com>
---
 .../bindings/sound/xlnx,audio-formatter.yaml  | 22 +++++++++++++------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/xlnx,audio-formatter.yaml b/Documentation/devicetree/bindings/sound/xlnx,audio-formatter.yaml
index 82fa448bd2e9..a9463f3bf864 100644
--- a/Documentation/devicetree/bindings/sound/xlnx,audio-formatter.yaml
+++ b/Documentation/devicetree/bindings/sound/xlnx,audio-formatter.yaml
@@ -13,9 +13,6 @@ description:
 maintainers:
   - Vincenzo Frascino <vincenzo.frascino@arm.com>
 
-allOf:
-  - $ref: dai-common.yaml#
-
 properties:
   compatible:
     enum:
@@ -38,15 +35,22 @@ properties:
 
   clock-names:
     minItems: 1
+    uniqueItems: true
     items:
       - const: s_axi_lite_aclk
       - const: aud_mclk
+      - enum: [m_axis_mm2s_aclk, s_axis_s2mm_aclk]
+      - const: s_axis_s2mm_aclk
 
   clocks:
     minItems: 1
     items:
-      - description: clock for the axi data stream
-      - description: clock for the MEMS microphone data stream
+      - description: AXI4-Lite control interface clock
+      - description: audio master clock
+      - description:
+          AXI4-Stream clock of the MM2S data mover, or of the S2MM data
+          mover in a design that only has the S2MM one
+      - description: AXI4-Stream clock of the S2MM data mover
 
 required:
   - compatible
@@ -56,6 +60,9 @@ required:
   - clock-names
   - clocks
 
+allOf:
+  - $ref: dai-common.yaml#
+
 additionalProperties: false
 
 examples:
@@ -66,7 +73,8 @@ examples:
       interrupt-names = "irq_mm2s", "irq_s2mm";
       interrupt-parent = <&gic>;
       interrupts = <0 104 4>, <0 105 4>;
-      clock-names = "s_axi_lite_aclk", "aud_mclk";
-      clocks = <&clk 71>, <&clk_wiz_1 0>;
+      clock-names = "s_axi_lite_aclk", "aud_mclk",
+                    "m_axis_mm2s_aclk", "s_axis_s2mm_aclk";
+      clocks = <&clk 71>, <&clk_wiz_1 0>, <&clk 72>, <&clk 73>;
     };
 ...
-- 
2.34.1

