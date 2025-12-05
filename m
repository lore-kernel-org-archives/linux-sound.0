Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023106.outbound.protection.outlook.com [40.107.44.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 833CD21D3E4;
	Fri,  5 Dec 2025 11:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764933408; cv=fail; b=Pef+iclBZqdA6WmPmikNKS+KozfxB/qz3QJ8W6mm9KMmCD/gh1C5InCMKrRBcLCqz0i14HNF5SkyR1DZE3HQPHbUE7nnGIZ6f7FRo1mClFKWUR9Pmei3bxCLgHV4XwaLv3yVLolem8wW2Mn+wW5ft2nb0+5RnEFQ/9FnHmqXPVM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764933408; c=relaxed/simple;
	bh=G3GD6XKJM2+YIbBXtXrPsgFWAMG+MIkxTT4iRanb+xc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MUN5S1EBhFrWQ/f8LtX0Bmqid44RWqFdazS2qKZ6Kadb24QIGJt8CvzMSuqAn5W1HHzCqyiHOCWFlg1ki40jbO4tfFE7kp6V315NTNwqCVoZIU152AbclSF7vx5sVlrbOPT8RyvVSUgdGkkMQb1ZfWPHvtt7SZ9DiskJBDbWkxc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.44.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s/Jw8idzLAUl2M7DgajbybLHA1X9daMQTFf8C0vvXTgppZLdIkw5mmBGvdm8T3C9MGJ+JXPepnqNfMmmalEJ6y1QMnbFItG9AZSunlfdlqqDZSMBEMlGcgZKSXSbh0HG1mnRBk2xfn0dLP8Mc1dxt/025Ib/eQVdBGBJqW98zUb6GflBDn1FoSB+zh7xiAgl7GXwlLcr4kQnAMufSJjusue8tUaUuSnoDBDOnqBcFoX5iUJvT1LezEN5Mp8nnQqL502CjnOl0ARKUrODGPp76UiJLlv7f6B+hK+VpyCpdzCd8pzxoT3O/u9/4lFAGRDdcN5NLkum4n3QXM9C3gGqZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cGkn6CA0K9DX4H+0EdhmbW201Lgl56kn+EZ3hEVAo/Y=;
 b=Tc1J+uwrf3ndB3+T/wYKrwVU0DHu08nX02wcBvEyP/Aj7J85VwGQhegUMCYGw6Jqx4rWziPZm1417Nn+Kn4UIjBe/qY3FjlX05chW5uVFylJjfPj7GqRgF7k0j2U4FmT65lQQshYSoG5TAa1DjGnGOKKIlcYrDBOuUdkxLzf04IzxHfBlsIirbE8H9HBBhbtsJYtv2g1cj9cD64d4fbt0a3qg1r8fCJyZd52t23leK0eNQDoaMWhPn5skuQYy/tK61/3tB73z/iRCPlya0ltPKWcsxVnW8lNZNclNDCTBzT/Y2xbiJTNWuU+Vsf3oiKqPkrIiVFpANpQ1mYumnRfJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from PSBPR02CA0001.apcprd02.prod.outlook.com (2603:1096:301::11) by
 SEYPR06MB8121.apcprd06.prod.outlook.com (2603:1096:101:2f1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.11; Fri, 5 Dec
 2025 11:16:40 +0000
Received: from OSA0EPF000000C9.apcprd02.prod.outlook.com
 (2603:1096:301:0:cafe::30) by PSBPR02CA0001.outlook.office365.com
 (2603:1096:301::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.9 via Frontend Transport; Fri, 5
 Dec 2025 11:16:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000C9.mail.protection.outlook.com (10.167.240.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Fri, 5 Dec 2025 11:16:39 +0000
Received: from localhost.localdomain (unknown [172.18.64.15])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 6786C41604E9;
	Fri,  5 Dec 2025 19:16:37 +0800 (CST)
From: joakim.zhang@cixtech.com
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: cix-kernel-upstream@cixtech.com,
	Joakim Zhang <joakim.zhang@cixtech.com>
Subject: [PATCH v5 1/3] ALSA: hda: dt-bindings: add CIX IPBLOQ HDA controller support
Date: Fri,  5 Dec 2025 19:16:32 +0800
Message-ID: <20251205111634.3004576-2-joakim.zhang@cixtech.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251205111634.3004576-1-joakim.zhang@cixtech.com>
References: <20251205111634.3004576-1-joakim.zhang@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000C9:EE_|SEYPR06MB8121:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: b92fa8bd-7f49-4bcc-fa9a-08de33efc2e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?y7rABsk1fMwW1WJEWEjNk7Doez7GfD/wCGTvRImLeTwhxj//1N/jaY/VzQqB?=
 =?us-ascii?Q?g6qscuyMFFxyLoOk/A2VC1i6ArgM4u27VRXap1dLIftP8G1VoxBojvklAMw+?=
 =?us-ascii?Q?A+yx0tpUwM26WZrD1ujhF/8sgDCpZgjm4VmJEFatUW0LxlR7J79Ghk1oIjJC?=
 =?us-ascii?Q?UzVKo1Yc/KIszKv/BGcPpGSnrUeOs0cnC3TNVwpPBCrJ27YWlnRnprcQANn1?=
 =?us-ascii?Q?/50fCykVI2ha6sA5GOGJx0b0JBjUiT1HfAU1i7vfXTb0ALw3+Uj6+ybGi2Qo?=
 =?us-ascii?Q?leY/YL2i0JYUdMSEbjNFYkG4oaQabM652WeGFGNEC5aBxAHIMkZNg6MpCE5y?=
 =?us-ascii?Q?NajRlAr8x1juKkGFNnK/fWP3ABxFNxUyFwuZmSXZypvM8SeIkbvIsVJkgNZ0?=
 =?us-ascii?Q?zw0gJx73/uzgfTKI9ujRhoAMtg8RnBYxq8yZxcYgqa+5PE6YwwPqoxSvik+u?=
 =?us-ascii?Q?86hTA/UsnnEpjGq4ko89OWbLCXoMHtgp2nxTpFnwEHENgFDJ/0Kdhzspzy2Y?=
 =?us-ascii?Q?adcz5lgkPHhdHwBfJ+X1wRJbYYDer0vu/SviYZMg1S79q47n9VFD0cYiIBJ5?=
 =?us-ascii?Q?JdGsrzHq8VzE0o+/zfkqEqW81lC+d0YotVcTBql5vdh9buMTgMtSfn7SWQkE?=
 =?us-ascii?Q?Duf3dotB5V2mNYAb2nATgRBqITro8fZkOiSMAuNHnVEvokNZ5kQ0/Q9fqnDN?=
 =?us-ascii?Q?Yalh1cS/OTYElOM/r+1x5MuZpT+RmYIHXi1LslqB3ps1TDGY717eeKfEDr6d?=
 =?us-ascii?Q?VximVn10WLRvLQDkPTM3KL6ELTuPrSsBdNYfXu9mg0jXNAXfxdPwiXQJI9VR?=
 =?us-ascii?Q?cLdy31zy+lI6nn/xb0oN3ZImjDQhML2qUTiNupAHUQFX4+lrMXO+en9UaS96?=
 =?us-ascii?Q?zhEmAPNgAoq7QGkqLOhzFQ3atNmvkrMPs1v4u/NaXebdZAHscaVtJq+eNXxj?=
 =?us-ascii?Q?JAHj3lGUQjsgUv4INdds5LLwV3eib2JwkYtLGDoV2yuKNRfDRZryQM4oCo/P?=
 =?us-ascii?Q?2DIudlzEHxGWJWovYyVMgKmfky8qAzZT6gn1O9kshB/yVqYuySrOPKmJ74xK?=
 =?us-ascii?Q?TgLJzJEQNnGvZZXv7FWPUaULIBpvFQaC0JYCBh3eqh/kzsveQ1ywol3ivZ9r?=
 =?us-ascii?Q?kCxK37wi3lzAybf8ccHDcRE1GOxb1OzMZ725ajuANRqFberGMFTWJURB5fuA?=
 =?us-ascii?Q?PysBJoehrT53ZkwdbEHHuc0VKiGb/c/yVpS5JiyrCve7gxgHyNRGwUiEt4IH?=
 =?us-ascii?Q?wurwdHTSGsN3s1N8vZ1K0uCzAgFSiRmnBqd/FfJ9nWDG0UnMW0wotinSVoNo?=
 =?us-ascii?Q?K2v5evoRaj/HAyoF0WSWdHFjbvJ5w3WydJj3q6AFmEy3z3A+3DEgB1CMrNsd?=
 =?us-ascii?Q?iKsqksFl5Xk4lsrkIe23NK4X4SKm2l5YgRBvev7qlp+mu6FVpioJxqoHdxzU?=
 =?us-ascii?Q?XXDXT1CuXaCUqdZMagkWwKr1HWbpUirh0YyXveqyE4QWJEg7RtNM9saJlDnY?=
 =?us-ascii?Q?oTOhCpgDe3qu6d2AWQeu+4bfx13in0GxCbAi?=
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 11:16:39.0946
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b92fa8bd-7f49-4bcc-fa9a-08de33efc2e5
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	OSA0EPF000000C9.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB8121

From: Joakim Zhang <joakim.zhang@cixtech.com>

Add CIX IPBLOQ HDA controller support, which is integrated into
CIX SKY1 audio subsystem. HDA controller supports 64bit, but the
audio subsystem can only 32bit transaction. Use jack polling mode
as there is a hardware issue, lead to interrupt strom if the RIRB
interrupt enabled. Host and hdac has different view of memory, so
need do dma address translation.

Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>
---
 .../bindings/sound/cix,sky1-ipbloq-hda.yaml   | 62 +++++++++++++++++++
 1 file changed, 62 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/cix,sky1-ipbloq-hda.yaml

diff --git a/Documentation/devicetree/bindings/sound/cix,sky1-ipbloq-hda.yaml b/Documentation/devicetree/bindings/sound/cix,sky1-ipbloq-hda.yaml
new file mode 100644
index 000000000000..02ac5f1aa926
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/cix,sky1-ipbloq-hda.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/cix,sky1-ipbloq-hda.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: CIX IPBLOQ HDA controller
+
+description:
+  CIX IPBLOQ High Definition Audio (HDA) Controller
+
+maintainers:
+  - Joakim Zhang <joakim.zhang@cixtech.com>
+
+allOf:
+  - $ref: sound-card-common.yaml#
+
+properties:
+  compatible:
+    const: cix,sky1-ipbloq-hda
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: ipg
+      - const: per
+
+  resets:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - resets
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include<dt-bindings/interrupt-controller/arm-gic.h>
+
+    hda@70c0000 {
+        compatible = "cix,sky1-ipbloq-hda";
+        reg = <0x70c0000 0x10000>;
+        interrupts = <GIC_SPI 234 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&audss_clk 7>,
+                 <&audss_clk 8>;
+        clock-names = "ipg", "per";
+        resets = <&audss_rst 14>;
+        model = "CIX SKY1 EVB HDA";
+    };
-- 
2.49.0

