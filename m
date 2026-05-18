Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11013071.outbound.protection.outlook.com [40.107.44.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3066323A566;
	Mon, 18 May 2026 02:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779072452; cv=fail; b=elUdg/IMPN6xbU+SAa2/LoAQaaFggI56jGsJUklUlAcT/O1EyY3TcIqdiLiMnllPk6xnkURlZUWZ+Z45tqFC80kTCQRFeXjfp0pwkh3nnZc0qTgO/jJr8x+i22yJdnwjiF2+ClwHF9a33LfYUWVAlNLyktIr/criba3unUj2YVo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779072452; c=relaxed/simple;
	bh=xLcOvsU3UGKcjYQyY1lFPbbK3xlSXgsw9x087fVLKfE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JSPb0YorCJg+jalToCrKJdtJIKDkfEmgcs30vhTJazFqfM+dBMXTMEt8UBjg7UBJJ6ULWZXTKXL6PX/an7x2y51C7Yby6DsswckpYG8qNrvTkVeks6lXq+yvvsAbIZffOhRz06UAT6mggXGaEiFBWfrdEct+ZtlKy1x4LVfbok4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nuvoton.com; spf=pass smtp.mailfrom=nuvoton.com; dkim=pass (2048-bit key) header.d=nuvoton.com header.i=@nuvoton.com header.b=QD6YqOxm; arc=fail smtp.client-ip=40.107.44.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nuvoton.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nuvoton.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nuvoton.com header.i=@nuvoton.com header.b="QD6YqOxm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cKbbVXlO9sHMRRb90qEk+HvBDCsW7LOh7TCKw89QOVrjxz1/HKoh5ERuFcIbFSEflh5DndHogr4CFEhwO6apsGKj6wvxs6kD6p4jbvOOvSGLOF4PcMoAeFWLdtocArB7CwieDiKQlr0mnZNjce5yKHaGIBlnUAb6v7/Ml1Z8EEtmJc88iIjdx2NHcgca4Xic3Ly5GW/Rk79mAnc/NbCRztzW63d4PQUZDuwf7WTO+voeassjcVtLEnuW5Tnr+YHaeVibfV0dOjMqUX0vum+Z1fkx7CQrVH8frYBHQZP9TNvJfJmawBUzmv+fqAq6ETG1aBFc9xC2Dzu7IiiMc4Zr8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x0Gm9+nIsRnlMqFzKWy/hMpcpYqgx0qMa7dw6GjqHiQ=;
 b=f5KaDYExl24KsAmxsTvxml+3D49LqJFMM6vOs73bmzBmgYRpCQrStsS/Y07DJN/InfHnNBPhfl3Y0ysMnI8lXFZAZATxDgUJFrWOmjPHab0EkivJLs+XacFLbht0L4R22BSWiXuAvP0EXg8gjFGFRdRAzP/ZRv0FmVgVSTM3x+i9qkQAA0GiUIfGL99EK3Ldx4eeatmM4wv9RUdivg9og71ewNTcpzN7KkTL27IUr9GDCMBTbYAjtTeg/3YU/SFhwQ4Q/Q+8cebpVK+nBbNPK9IolewhEwP7JRgcSAvlHjSIPBfqnATwWfpzYe9Rs0tWFhzb2uZ3APd+vV6ApcDjgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 175.98.123.7) smtp.rcpttodomain=kernel.org smtp.mailfrom=nuvoton.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nuvoton.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nuvoton.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x0Gm9+nIsRnlMqFzKWy/hMpcpYqgx0qMa7dw6GjqHiQ=;
 b=QD6YqOxmMKA/xJ+rRhdX5QfUl6Kg6O4AT79qOzpTA++t2dwVcce/JJ23fF7BmI2y34eZgf4D69DFC23+xpdmID/ei7eVX0GKI60r7dZeWOMPhp/sGQfF+yMbob4f2jlb12W7G8oC4hqUXC/WO7LVzMpcq1VrNSZaR3XUXxd5wvoOEwMO1tARB7kPAQhPe4jlWZM8KLcXL2PqQisPM3tr4d+LuhhTnaDmg4BqL7rY6FNQ571ydZYwRz4YRUci7kUuSjBN9rMpdGlzQtxQHyJs+2hMNyqAqVY4uMLE+g1v5p8NZPAW0OviL+lWT6X6GAUMYj4jdETwZcqJ0FjKvebIcA==
Received: from SG2P153CA0048.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::17) by
 SE3PR03MB9966.apcprd03.prod.outlook.com (2603:1096:101:330::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.9; Mon, 18 May 2026
 02:47:25 +0000
Received: from SG2PEPF000B66CA.apcprd03.prod.outlook.com
 (2603:1096:4:c6:cafe::17) by SG2P153CA0048.outlook.office365.com
 (2603:1096:4:c6::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.1 via Frontend Transport; Mon, 18
 May 2026 02:47:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 175.98.123.7)
 smtp.mailfrom=nuvoton.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nuvoton.com;
Received-SPF: Pass (protection.outlook.com: domain of nuvoton.com designates
 175.98.123.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=175.98.123.7; helo=NTHCCAS02.nuvoton.com; pr=C
Received: from NTHCCAS02.nuvoton.com (175.98.123.7) by
 SG2PEPF000B66CA.mail.protection.outlook.com (10.167.240.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Mon, 18 May 2026 02:47:24 +0000
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCCAS02.nuvoton.com
 (10.1.9.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.61; Mon, 18 May
 2026 10:47:21 +0800
Received: from localhost.localdomain (10.11.36.27) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server id 15.1.2507.61 via Frontend
 Transport; Mon, 18 May 2026 10:47:21 +0800
From: Neo Chang <YLCHANG2@nuvoton.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <perex@perex.cz>, <tiwai@suse.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <linux-sound@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <alsa-devel@alsa-project.org>,
	<neo.chang70@gmail.com>, <kchsu0@nuvoton.com>, <sjlin0@nuvoton.com>, "Neo
 Chang" <YLCHANG2@nuvoton.com>
Subject: [PATCH v2 1/2] ASoC: dt-bindings: nuvoton,nau8360: Add NAU83G60
Date: Mon, 18 May 2026 10:47:03 +0800
Message-ID: <20260518024704.118613-2-YLCHANG2@nuvoton.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260518024704.118613-1-YLCHANG2@nuvoton.com>
References: <20260518024704.118613-1-YLCHANG2@nuvoton.com>
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
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CA:EE_|SE3PR03MB9966:EE_
X-MS-Office365-Filtering-Correlation-Id: d432e92a-bbcf-45f1-601e-08deb487cabc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|7416014|376014|36860700016|11063799003|18002099003|3023799003|56012099003|22082099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	RnzdTXizv5x7+VIXW5eSoXGn3KPJjUE2+7QgOlSgJ5oOJf1m9/vn4VSGCQh0mCMlql9UKvFqWTEvD4CT3ttMUwwDWNxVKh7f8KW+cuR7jhXXfL5NzB1pJtRqqjWhOQdacpkWze4IjNyiZTLyYp0KCRXIr/gNb1ZWQSl4TNm498bMx0OTiG59rLYA7AeDVszy7ItnmAReI3elZFSZJ2dDHJxPE5tEUMb//yIKak3Be+09unvduxAzVYutJzT1j773nV4elhw+FBHARVJoDJeNyByzFxObADoMWHulvoeapVOHujV+A6eMn0lIHU+k9OTOnZseLrIUvemRMkZtU6fehEcgXZbDqAY/V2tbUTo6V7HH0MjSpdTEob705OQucMUQ3dwgcYjm5UlsfLQZM4IP3cr4Yf+QNvDqRBPJCPwJ3yDPl2Kn8ZWvnaUVXKT0JQ0j41rQXZ1aq0t/c/WALAPlrhHNOOBCfGtHo0JBCr0Z2jLGuLI1D2iXjoYnj0A0IoOh+1HVCXT8RMMdasJs8WxyqPblkFJjbwRPHeAprfDM8IJ/h1chciSyrhpo6udI/Bgt5F5JW7Vxv6UNqgSQkkEQOVkxb0rlnySxZCKUi9MR+utlaqRg7T+K25rSorVZXO5eSClx6fScztDh/xUeEe+yT2UrNOkPCP6bjf8WvM7fQj8aKqbbEWyQROZxIK82wlq2
X-Forefront-Antispam-Report:
	CIP:175.98.123.7;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:NTHCCAS02.nuvoton.com;PTR:175-98-123-7.static.tfn.net.tw;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(7416014)(376014)(36860700016)(11063799003)(18002099003)(3023799003)(56012099003)(22082099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	dfdBARGRKG+ZjEFsfbICEqy+h9ZYlVwjx44W+qJ6x89GPpJa0xxS72waoY2TJZV7mGNBMdM9MMWx2trB0LiJiG7Pn/6nVEzE2iCoWwM95gOzuF4Ta/4KpQOZQjt/fzposXIlYu93FnBJye4lt51RnBms6L0dhtlqqn1t+Yb5pZoDoVQkRkN2gDYzcSLXuZL1KkIe7vHCILbX94qhTUIak5UjlD/6vhpuBZ+tY5ZR5ygkAYKmVasT6UbaVDYSzCOsDHMnHWpYVhMpTXsRdobu5EJYSeeVYXBhDkVGpj15FQXXn3AmZlo+i+yKfFPVMsHuKJ6lI/UwcxDyamW/sX9EHtAA3ipnhVFigackwF8AQ+d2d+Bsyf/HyM+7/2cMKyDuQHkQ+yzPVZS7b+X/vhQW9UT4v/NGv3130yxlikvG1WJIfvZlnVlHfvgqLm2ZKxkX
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 02:47:24.7064
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d432e92a-bbcf-45f1-601e-08deb487cabc
X-MS-Exchange-CrossTenant-Id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a3f24931-d403-4b4a-94f1-7d83ac638e07;Ip=[175.98.123.7];Helo=[NTHCCAS02.nuvoton.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG2PEPF000B66CA.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE3PR03MB9966

Add device tree bindings documentation for the Nuvoton NAU83G60
audio amplifier.

Signed-off-by: Neo Chang <YLCHANG2@nuvoton.com>
---
Changes in v2:
- Dropped the word "driver" from the description.
- Removed runtime/software configuration properties:
  nuvoton,low-latency, nuvoton,anc-enable, nuvoton,aec-enable,
  nuvoton,vbat-microvolt, and nuvoton,tdm-channel-length.
- Added missing "nuvoton,dac-cur-enable" property for static speaker impedance matching.
- Removed unnecessary '|' formatting from single-line descriptions.
- Fixed typo in firmware-name property.
---
 .../bindings/sound/nuvoton,nau8360.yaml       | 86 +++++++++++++++++++
 1 file changed, 86 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/nuvoton,nau8360.yaml

diff --git a/Documentation/devicetree/bindings/sound/nuvoton,nau8360.yaml b/Documentation/devicetree/bindings/sound/nuvoton,nau8360.yaml
new file mode 100644
index 000000000000..756b3e9c4321
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/nuvoton,nau8360.yaml
@@ -0,0 +1,86 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/nuvoton,nau8360.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton NAU83G60 Stereo Class-D Amplifier with DSP
+
+description:
+  Stereo Class-D Amplifier with DSP and I/V-sense.
+  This device supports I2C.
+
+maintainers:
+  - Neo Chang <YLCHANG2@nuvoton.com>
+
+properties:
+  compatible:
+    enum:
+      - nuvoton,nau8360
+
+  reg:
+    maxItems: 1
+    description:
+      The I2C address of the device. The address is determined by the external
+      hardware configuration of GPIO1 and GPIO2 pins:
+       - 0x1a (GPIO2=Low, GPIO1=Low)
+       - 0x1b (GPIO2=Low, GPIO1=High)
+       - 0x4a (GPIO2=High, GPIO1=Low)
+       - 0x4b (GPIO2=High, GPIO1=High)
+
+  "#sound-dai-cells":
+    const: 0
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: mclk
+
+  nuvoton,dsp-bypass:
+    type: boolean
+    description:
+      Forcibly disable/bypass DSP path.
+
+  nuvoton,pbtl-enable:
+    type: boolean
+    description:
+      NAU83G60 supports PBTL mode for mono output.
+
+  nuvoton,dac-cur-enable:
+    type: boolean
+    description:
+      Adjust DAC output current to match speaker impedance and prevent
+      hardware damage. +3.2dB when present, 0dB by default.
+
+  firmware-names:
+    minItems: 2
+    maxItems: 2
+    description:
+      Assign firmware filenames for left and right DSP cores.
+
+required:
+  - compatible
+  - reg
+
+allOf:
+  - $ref: dai-common.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        codec@1a {
+            #sound-dai-cells = <0>;
+            compatible = "nuvoton,nau8360";
+            reg = <0x1a>;
+            nuvoton,dsp-bypass;
+            nuvoton,pbtl-enable;
+            nuvoton,dac-cur-enable;
+            firmware-name = "NAU83G60.kcs.bin.l" , "NAU83G60.kcs.bin.r";
+        };
+    };
-- 
2.25.1

