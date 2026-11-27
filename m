Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.42.77
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795770443;
	b=DNtlO0gj+XB0FMTd+d7zdWYNbzm91F7jukjL4iKnrwIBW5ukpC0EUKaXPBCWsx8BgQrK
	 dhEwnjN1I+h6ZjomlOA7NetMucDxl5ksi8DrIB31yhJ9jOjrocuZSoyPUxvYHLozXjVsd
	 rQPbyLEW/g43gpz6vOajKQX0U6dsDHo7Ut/iu1/ufJ/Vv+31k5JUqFsblCeUkH8UkClw5
	 /qB9ctydbF7pvghJ3RohhJ0nTvTSIZ6ILWX9jg/tXsXLwGFNYtkG6TtvxLRJpGd4j/mZL
	 duC2UmFktmCobZYpsm8RvrpnMsmc9ApQsjLn/6VOFz6MkKZafNC8mx2XcyYn/MpQLRQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795770443;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:Content-Transfer-Encoding:
	 Content-Type:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=LHAyQ/AjIRahb1+VSmKo87HlGE+mEVH/Qq/c//T+7sc=;
	b=WIFbukWr5gc03mfAtlyCMX9qN2r6AZ5qa66goVFR0iFzPp8lrCCYj5ynd2IoefTh1aK1
	 JWZvGd9s1mZRvRuGEhNlaWFz5aGNq20kCzTBzu6rsH91LalYhleZv2zlzBEMRm4kI3Jaf
	 Zi+VOssaqIWiNp74h5FjafPYCde/b69R3jczLSHlW5yGZu0JG5/3pmQVfeBBRxtf1UUDi
	 6UpYOmFhJiXjnGttb/Z5ISW+Z4jtsWsLF6lSqEjbpfE+oLkL6MhYEUS1Fq8uYJu09B06b
	 uiNK7OdCt9MvIQqdA9BcKncTL5Ljnb2UTWZGXTf9D2N9/qu5dNjhYmtYjE62U2ae53g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=irondevice.com;
	spf=pass smtp.mailfrom=irondevice.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.42.77
Received: from SLXP216CU001.outbound.protection.outlook.com (mail-koreacentralazon11021077.outbound.protection.outlook.com [40.107.42.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83533606A31E;
	Fri, 27 Nov 2026 09:07:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83533606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=irondevice.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=irondevice.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ja6FET/dW6/q7n0oBU1VuW3/rx8CvwFRDLLpE1z92ZcM1sUSGwcXye4R0eZ8q4ZfRMe0PafHa4u24Xn/mAuDO8BUn6bf8v+eAVtHiZEe3mD0eyxtEnIuFzJcuVhbT068lXmZLHRZRur+XZhWCSkaQxne0QgMQko1ahMHPKhpjChDIR1cFS6JH33BzHcKUaoIOKbrSmtnBWLsxx/K11IyG+3moi3vl/oLQzZ1FwQ4h971jxniXTAAgXOJO+b9DgEiPE/PdSqrrfQWJRq0Lon+f98D3mQ0lE+b3nRp/N9ZSd1zXfusxl7O9DVbfdtuQp6Ze9E2NQiIWWvC7RbVYZmGZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LHAyQ/AjIRahb1+VSmKo87HlGE+mEVH/Qq/c//T+7sc=;
 b=GxbquZxCb2VfQldz23fD/mcktTF0dLjwEpk+q/GKWBzMjD8XV5/zwSaM/KvZVX9Pxvjm2b8zyCvSN76L7CISkNGOrTwmmgS+HvXBHYBWm1l9JOuPYNDEFX1UJIKkx8L273n0SA8sNN220aYjXKcgOCWo0eVeRqslpaILpFSJZnCqQ/oG70LgOM8wpdE4xgPCX7WHQaN1chKzx0ev6OyFS8Gg0nG71veQWQraCH1RNbetnokK6LP0lST1UN6OGi6LqlpXjSxM9v3L6waiisePtQgv3Tg7YW+rdk99tVavVc8VcSlF+wNUlisw/4lBylgOXBmoo+BlHhSHWxk15GGwlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=irondevice.com; dmarc=pass action=none
 header.from=irondevice.com; dkim=pass header.d=irondevice.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=irondevice.com;
Received: from SE2P216MB2423.KORP216.PROD.OUTLOOK.COM (2603:1096:101:1c6::14)
 by SE5P216MB3160.KORP216.PROD.OUTLOOK.COM (2603:1096:101:2fc::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.9; Fri, 27 Nov
 2026 09:07:20 +0000
Received: from SE2P216MB2423.KORP216.PROD.OUTLOOK.COM
 ([fe80::98a8:f50c:a9f8:3073]) by SE2P216MB2423.KORP216.PROD.OUTLOOK.COM
 ([fe80::98a8:f50c:a9f8:3073%5]) with mapi id 15.21.0662.007; Fri, 27 Nov 2026
 09:07:20 +0000
From: Hyunuk Son <hyunuk.son@irondevice.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com,
	kiseok.jo@irondevice.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	krzysztof.kozlowski@oss.qualcomm.com,
	conor+dt@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hyunuk Son <hyunuk.son@irondevice.com>
Subject: [PATCH v3 1/2] ASoC: dt-bindings: Add Iron Device MA5311
Date: Fri, 27 Nov 2026 18:07:06 +0900
Message-ID: <20261127090707.389362-2-hyunuk.son@irondevice.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261127090707.389362-1-hyunuk.son@irondevice.com>
References: <20261127090707.389362-1-hyunuk.son@irondevice.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0092.KORP216.PROD.OUTLOOK.COM (2603:1096:101:3::7)
 To SE2P216MB2423.KORP216.PROD.OUTLOOK.COM (2603:1096:101:1c6::14)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SE2P216MB2423:EE_|SE5P216MB3160:EE_
X-MS-Office365-Filtering-Correlation-Id: c27ce20b-d04c-4d09-44de-08df4c65d796
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|7416014|376014|23010399003|366016|261009223027099003|18002099003|22082099003|3023799007|10067099003|56012099006|261028144727099003|261102123227099003|261026140227099003|261022105027099003|261021121427099003|261026121527099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	IcoHlFHMUgQl2CctwJbalYK42d9LTWEAcaPJ1CsNzRru/RtIry2XSQP8Tec6o7j/xrEoJOa31bL+6PjrVXXPfAb6JrbUiahHxLZm/yxn051jden+GCc85ietVw1vrj2eN6RSxj6bBFmO/xtfTl6J9ukzR3kOAz5qaC6u0xMFAlm38eBZnSPXt0FJ1lQrqRUmyzqM3SXSEsAj0qn/SRIZ8OuG6oTAw4Zns9RkIrXqYJ4U+mnMsgoCz83JcHRza84BfsQQmc3Y/QgFAlAlsKrm3fbpzzjse0iXdfrAKoWTOlA5pE0RBQb7lLhZIohH4eDJRtnV4at4AOwi10ilqD73PHhQOKKGOjjUcGsgIyP8KHxzKbh72fhhYh6NLAsZBCv7me7p6mqwhCZao7Y0nwu7GIlUveVRNGrihTzvscYSQ29lmDlGt52ygo0ZpZlQpSdzBsEjJmLXTmH+tX6g8Mz/Cg9IfVKQ8W0agysvXq3LPtl4X+Xf3w6wAGcXpktIL1q/OYApS0ch9ZDhQjiy5gf6GT/cMFF5qCfU/WM40+9rgp4ZPOreRgP5543t/xVXUmUn0CAcbn4P+UAxHbv4ePexj/YVWqgh3tpHkhMm8ZEwc3VYuICJ2GgcIoophZx+r+AWvpntXakFnoPkg+Z+AtuAje66q3WLqB157iSQjdvbmOs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SE2P216MB2423.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(23010399003)(366016)(261009223027099003)(18002099003)(22082099003)(3023799007)(10067099003)(56012099006)(261028144727099003)(261102123227099003)(261026140227099003)(261022105027099003)(261021121427099003)(261026121527099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SefDGS9NJu0vA/ahkdNoF/QBFHJo2qIQXxz2FVxIvAJfB+YAKtJppzz9dlr/?=
 =?us-ascii?Q?xugY6qBePZsh/85z0g/6K/tsKh+gUK+5H67umUmO3cwuxI3ldBRAcnlXaS4g?=
 =?us-ascii?Q?cCwEg5/4HqfB/J8YWOUCMstBF1gqzjYv6LpKFYo3Gs6V7bvRC+maA62bUPfi?=
 =?us-ascii?Q?zV13yDLRE1ZZXkHe3ctQbAJnHnlvDKJxm0K+OFaSU3wUmV81TtW0F+FeEuuz?=
 =?us-ascii?Q?dMiIHPyaVY56zgFcHD0ymub+i8KasiwzMPA/rTlf5a0i5rMmeDiCFpbnpfNM?=
 =?us-ascii?Q?OnESXIrFC03V2MPzVmWUIzpoP7JXv/FhF0IUN3Y3m3hMMf5DdlAY6NPj4nM5?=
 =?us-ascii?Q?/U51To5j0oTTM1PNLIuqvYUnZ9AECgCnNYxmREnRSHKly3+62fiyIbZLPrqh?=
 =?us-ascii?Q?5ckY0ETRvGmp+0zT1kyqGOO2H/HmEcIiNZpZ2+PQEo6K+z0xSKjvchT+bbpP?=
 =?us-ascii?Q?vzR7yMApf4tGmDc43PNKfG8QUiBnt5t8cc25scHYo1LidEW/rXdojIQxYoD8?=
 =?us-ascii?Q?BxjYDaoZUC3OL8eTR5PKjuj6z7aT4D1r8Ofj1Pu0d5+ZPyQTeKRaoLyrMR46?=
 =?us-ascii?Q?lB3yFeiAw/6OTiiA8ijrC5HKvQTN1WGfcijIeFOQqfgYoxHtyYiG6pAtnBu/?=
 =?us-ascii?Q?Vbu2aXwlszGwjl04hJfzLCcMtJPCtTg5p6p5pjmEHP5RbfOvVnSln/dB7gVt?=
 =?us-ascii?Q?g3cpIU+YqZkmy3n6jN1VPpogwzBuu9fUWgRZcLfx7mYKH70uOi1NDdVBmMw9?=
 =?us-ascii?Q?ZBdIK17kRMhvESDefNzWiAJfr9rbk1O3LH2Wce4PNRwfvMlGLkDlkN4vb7E6?=
 =?us-ascii?Q?oC146AzsxUSUOjLjiTGA3XsbJpDFJCKUfQz32By9hM3/FOjZKmJH9KDCXQhs?=
 =?us-ascii?Q?fOoW2uVb5Owkwkfvkb3bgCXuIW8afcF0tKOYNe47ppXSxnAQ73lKRCHIPyMq?=
 =?us-ascii?Q?nkQUYj+U5Khs6JjjuSLSmMdUpv02ank01mVlCbY4wZtNKbFbLjVVgX45JL2U?=
 =?us-ascii?Q?t94wHcr06+S7RwlpN+dNlC98cElm3rFzt4pT8m9DIV25CylyFgXx8WRf0bpn?=
 =?us-ascii?Q?PU1ueQ1EBvnaCqE8hYaUoz0mArerHaPsb6dlOvawXLYC6ugyz1/rGl7gVPBk?=
 =?us-ascii?Q?OQ+7rsf3KRN+nZckGrI3mqu5N9t1AiQ19PcfrgzFRSHG5eBjK/ZBV6OuwV9S?=
 =?us-ascii?Q?ehxwXrEkHFkUOWGWkxPwbT/XXKOGgcyuVERtGICdlyJR7oVFA1phOS0uVtpn?=
 =?us-ascii?Q?0bU5YvmyfDNzqldoE6y6Lb/mLDzkaqN3wLK5o9e3WzSEAEjmg1mhor0ugiMK?=
 =?us-ascii?Q?DaCE/jB/dNZpJD02EOsLV3BV0uXq5tOgGqOS75dRH245JoR8ItewAcA67z6w?=
 =?us-ascii?Q?rEZlxwBr0nVjfyMXKl4dptMe1CDh11ZtHeup5dEVcCGWlcqAC/RqXnbMNloV?=
 =?us-ascii?Q?/lXFyRb0DLBHgpSvK2GS5N0uGPcjIs7iylbBQZQ7DjJEO5jK18LCs/vuSFkI?=
 =?us-ascii?Q?/DeHHH7C/ZKCOCB4UZ8zXxZYzv/2v3DhW3NpOt1sk3YzyqvACRMa9w2FsN3o?=
 =?us-ascii?Q?7ln0/koRArFpHMTGwSYmXgXn7+YiurTHo2LCG13m39Xza8wX0x1Jf0pHLFo+?=
 =?us-ascii?Q?I4CFeg5VUsVezPy8MFZuJytQyeCIzjLqu+Xpfm57PJLsjvULBfZFBBWRYEcq?=
 =?us-ascii?Q?kGDJf7yXLQt05GkkuQDlM8m+khqrKTyEKhRrLWBxj649oYtp9mTGxHsOPhmY?=
 =?us-ascii?Q?EPHU/vlpPg=3D=3D?=
X-OriginatorOrg: irondevice.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c27ce20b-d04c-4d09-44de-08df4c65d796
X-MS-Exchange-CrossTenant-AuthSource: SE2P216MB2423.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 09:07:20.3865
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b4849faa-3337-494e-a76a-cb25a3b3d7d1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m4i0Q2c2Jk8xN2OhWZLLA1yBMxKRvlIwh6P9V9dzQ28HECE65pbGE055kjY51gEA6a2cZaDWrTrNAc6vItKIx5GA0trml1c5kcPiI8m8lpQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE5P216MB3160

The Iron Device MA5311 is an audio codec integrating digital speaker
amplification, analog-to-digital conversion, and audio DSP functionality.

The device uses two I2C slave addresses for separate control and ADC
register banks. It also provides an active-low reset input and an
interrupt output for fault and thermal warning notification.

Add the Device Tree binding to describe these hardware interfaces.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Hyunuk Son <hyunuk.son@irondevice.com>
---
 .../bindings/sound/irondevice,ma5311.yaml     | 84 +++++++++++++++++++
 1 file changed, 84 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/irondevice,ma5311.yaml

diff --git a/Documentation/devicetree/bindings/sound/irondevice,ma5311.yaml b/Documentation/devicetree/bindings/sound/irondevice,ma5311.yaml
new file mode 100644
index 000000000000..d013d539e0ef
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/irondevice,ma5311.yaml
@@ -0,0 +1,84 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/irondevice,ma5311.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Iron Device MA5311 Audio Codec
+
+maintainers:
+  - Hyunuk Son <hyunuk.son@irondevice.com>
+
+description:
+  The Iron Device MA5311 integrates digital speaker amplification,
+  analog-to-digital conversion, and audio DSP functionality.
+
+  The device uses two I2C slave addresses. The first address
+  provides access to the control register bank, while the second
+  provides access to the ADC register bank.
+
+  The device provides an active-low reset input and an active-low
+  interrupt output for fault and thermal warning notification.
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    enum:
+      - irondevice,ma5311
+
+  reg:
+    items:
+      - description: I2C address for control registers
+      - description: I2C address for ADC registers
+
+  reg-names:
+    items:
+      - const: control
+      - const: adc
+
+  reset-gpios:
+    maxItems: 1
+    description:
+      GPIO connected to the active-low RSTN pin.
+
+  interrupts:
+    maxItems: 1
+    description:
+      Falling-edge interrupt from the active-low INTN output.
+      INTN is deasserted when the fault condition clears.
+
+  '#sound-dai-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - '#sound-dai-cells'
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        audio-codec@3e {
+            compatible = "irondevice,ma5311";
+
+            reg = <0x3e>, <0x3f>;
+            reg-names = "control", "adc";
+
+            reset-gpios = <&gpio 2 GPIO_ACTIVE_LOW>;
+            interrupt-parent = <&gpio>;
+            interrupts = <3 IRQ_TYPE_EDGE_FALLING>;
+
+            #sound-dai-cells = <1>;
+        };
+    };
-- 
2.43.0

