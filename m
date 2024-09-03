Received: from SEVP216CU002.outbound.protection.outlook.com (mail-koreacentralazon11022113.outbound.protection.outlook.com [40.107.43.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3604D1CEAB2;
	Tue,  3 Sep 2024 05:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.43.113
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725342299; cv=fail; b=YNwoQrM82b+e8Xp/ThpFkivgRy2/1+CfOeUHxG+EKqXOMfRuYUDWAu7a2KgHFGo9qYBSmdEphg15G0WkO5poSc/qZQg8Ga1eIuJmufgRO++tyVqvSQLoe9D8w5QiVPdd/Nt08GesNDvtaqfU4v6T0Vv/tvJVNH2aTFlgA8G/4HI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725342299; c=relaxed/simple;
	bh=641dztNgJ/r4mDuDgj/U69IllRQdoP8QIyzkMV33b1I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lZ8eVBzOQZslURMuOrr2oUK9om7uX/EAwBIiQs2VXX+3Zd8ZIOflwzujGpr0Ks4sgQM9zTsaTWPIvpYZgnK9bgTHrWoV1OcOgghmg8PUUQAIQki0bQl8zPStKSIAkuawOODSFBKW1VFEDAYvHm8bekW1ZyqEeBfseDmUE//x+bo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=irondevice.com; spf=pass smtp.mailfrom=irondevice.com; arc=fail smtp.client-ip=40.107.43.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=irondevice.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=irondevice.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lqfSe5RY1gWlpW848Kof//AWkQf5INr1Q1XZEE580uqq1yt14QYb9iCxl9Baww3vVo+8kN1uDHOCXgGe95XiDDh3s7gls+RZ+RbbrvqiRht+PFajBSui/QflxtwUzHJ4rOHLX4eA05biJ80ZhQsGhsllx/6yYfZJ9w0PkCz6wyYXs5V4QAJ6Dve1qBYjdeAkXuUAsEVPScm+naCnO073lFZuL4ZycqbN2M+mlTakWCakVUFaDG6WEWuBstNUXThSEW17QG3yr+1IAlyYOIf4T1kIahbxS9RZbYterxvsIL8XWHalRuhue4Y+xgf+PqD5IXoNSP4lUNhbTbhaFEAghg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZxQMdi5tqW8awP2NOlmAdeUdJU+ymAw0xV3f4lqGGBQ=;
 b=VFsHuMpzn6w0a5S9sdSkIqlRAOHFdzP+bOMGe6wweYB4k9z5kAMTHkKaydpDaSNGRcbCaWQPd3Jjbn/gddrDdDN4asJ+EdqcZpNMAuehN2RilYaYVN8/QeXcgxTDvSVu+HW0j/AL1OzC8AVqeVyEB8iS1p/ASxs09iLZ7R/AhHkbNrI4OQJcxtT/xvYYlNWcGKEQ/i0PAjDXcAjj/GGByZJKW2kAa5SgKqqmexE19IhuUXXHG09iWdrMcRic8chjNLoyXarN5kQnc6KgzRY6UHKe+80a5RxTMpggNwgEsfI/AHIT5kuKiZdg/93lDFYOqx+F2G4L0b/BXuRBDoFNNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=irondevice.com; dmarc=pass action=none
 header.from=irondevice.com; dkim=pass header.d=irondevice.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=irondevice.com;
Received: from SL2P216MB2337.KORP216.PROD.OUTLOOK.COM (2603:1096:101:14c::11)
 by SE1P216MB1543.KORP216.PROD.OUTLOOK.COM (2603:1096:101:29::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Tue, 3 Sep
 2024 05:44:54 +0000
Received: from SL2P216MB2337.KORP216.PROD.OUTLOOK.COM
 ([fe80::7e8d:9550:c46b:2756]) by SL2P216MB2337.KORP216.PROD.OUTLOOK.COM
 ([fe80::7e8d:9550:c46b:2756%3]) with mapi id 15.20.7918.024; Tue, 3 Sep 2024
 05:44:54 +0000
From: Kiseok Jo <kiseok.jo@irondevice.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	application@irondevice.com,
	Kiseok Jo <kiseok.jo@irondevice.com>
Subject: [PATCH v2 2/3] ASoC: dt-bindings: irondevice,sma1307: Add initial DT binding
Date: Tue,  3 Sep 2024 14:44:34 +0900
Message-Id: <20240903054435.2659-3-kiseok.jo@irondevice.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240903054435.2659-1-kiseok.jo@irondevice.com>
References: <20240903054435.2659-1-kiseok.jo@irondevice.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0056.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:115::7) To SL2P216MB2337.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:14c::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SL2P216MB2337:EE_|SE1P216MB1543:EE_
X-MS-Office365-Filtering-Correlation-Id: 4685b217-5dcf-4210-dd01-08dccbdb891e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?H/41ahi7IjCXlGkFkmJrLsOhTL3FUH71RZ6AGLOMA0m8HBjIJZ8l2FfHmYVb?=
 =?us-ascii?Q?S/g3cFjGKShquvqqDPjnmSLIiRFcovL9ub3I6ApNwPFncKRTpjcRZufD63WJ?=
 =?us-ascii?Q?Sx32Dyv74LW9JuUW/pedetBerYodCLyNNSh+Qw+cHPd9FHmFrpX6Ub6if8aW?=
 =?us-ascii?Q?V6HL0fUTsr0fdtE19saHRoxfXK7LbY1uglN1mZd8X1M7f2xBICLKxoINt9Qu?=
 =?us-ascii?Q?4A2UMyDnKm2fNmlKquTCV+4Xw7aaH+beT/hWSlVf/y0QmJGpqXsylDLmQ0pH?=
 =?us-ascii?Q?0cfK1LaMYZPbv7EKLHFXZ5JG1RkHSEAsuLp0aU9o59W0iTM+galkMqmQp5rg?=
 =?us-ascii?Q?uB7wJbo2AOQK7FztHv0J4YR1uA2Tl9OYrLt0kGBv3guGjp7rEzZS8EtN6XCN?=
 =?us-ascii?Q?EO2JtfnMjwIzQB1mAXlMUbK0p7GLGyQ9RbmFw3k35bAtU9IIHQliwkGfRrPU?=
 =?us-ascii?Q?+evGz2ERsDdmXrm4aa+h63cemCFWCHDSHTgP2z20+IKYa6fDLFfRfr+LJYuN?=
 =?us-ascii?Q?mDERJfO7P0lQSjX4qy4iLlrbnm7KB58XPMheEUdgokX7ED3vIqaAwi60WWO2?=
 =?us-ascii?Q?vM+1a9f1VYySjl7fwDGvvKXizuwql0+pbrNIA22NSSeo316Dv04qy+hXRots?=
 =?us-ascii?Q?OtiLO8bhAo06u8If/HvPVpzR92mn7w+sSgrLyR1AUF9HlOU/Vsjr9ebV4oEu?=
 =?us-ascii?Q?MgcFLavajtYvDAlRLZ8hZIY9KKN8I3fEmoDXh71HXwE2k2vk5+/z3oAq549g?=
 =?us-ascii?Q?sZT3iSIpfzXhF2RKyIpLfxK6UzYOyWY05XnIglAq6O754YRsDprgMprhxcJ2?=
 =?us-ascii?Q?pQBGXq0ZdBV//PecA0wGUhaKlx5VVcVKSKq27RSjS3OA8J8cuZGHBcQ6A22u?=
 =?us-ascii?Q?LcPjoEKdaZQwlj4CuQnGwVoNOf1/41il99ehOxLvPDabdGocj2RdBnPFM7hN?=
 =?us-ascii?Q?TgWgRoZStmchzRfMRoHTgHsZdapiDxOMZrv11pTsM0ps8kk4ToWSqLCw1OSN?=
 =?us-ascii?Q?PdZuZtwBKljzrKhmu3Nb+ylkYFKuXrwFWCQUrGjZfDL5YLgzZo4u7NyqLMNM?=
 =?us-ascii?Q?dOJdgei2cuvFfSiOhRkOSKILAjm9McQRLu252ZlO0AMA+05YzsjgasDF2oVg?=
 =?us-ascii?Q?fcUaTq0GDAL/P5wqtT7YC5NGuMMjH+qjgsf2XJJL5mTjPge85erqn74mPDY0?=
 =?us-ascii?Q?Q4KYISozQ222xQ83l29/SxY4hv70Vj3Z6zsN/A3+uatcPuTnzoWyGJC1jQga?=
 =?us-ascii?Q?nxMQoxxJEtXRWjpcHvQw0LTaepk6tc+Cqe52a0zBYaXUG5yMwirGV1RvLVHj?=
 =?us-ascii?Q?2dHJ5J+QssgFW9F/Ye17AcoM17r1AZwEpOrcLzLF2qlWiw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB2337.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wdQ3a+XPHNoCk/qnLUCZlV5BckLkKgYQf6HrtxJC5WWDFZcWUeUdCrHbCcXh?=
 =?us-ascii?Q?pp0M1hZIyi7DUZ4HHRl4jdjcyoENbXyyrmrT9q1oUx1DyeMFB9HdhOMdS4gY?=
 =?us-ascii?Q?9WFn6D/tIxAFMYUyl0IrHEoZ4Oose9geBgHdRM3uGM1FfNZmsSsPhj3dEZEG?=
 =?us-ascii?Q?HpuKDrSieUaw31fybGAan/v6SqY3qgXjZA5cG+hFfWQcfmqIxiibLojYAO9u?=
 =?us-ascii?Q?AhMkJYXNKca73ifU1But+tDvYMkAbHt8GSE2vXC/I7srltyKvXFI7anfxOdb?=
 =?us-ascii?Q?/N/TPf8jP3a4vy4zzOUXA1v6PIYvtrNftLVZBuE0BcehIzGWkf7ad1uC/q5u?=
 =?us-ascii?Q?S27cuLBOs+H6B5CDInGNlGDh9LL/afeXb9yEECXRmhmMMaiN2DTXd9ZZtPei?=
 =?us-ascii?Q?g2LiXpvnDMDdTBt1W6j9IFGFIL7WhXzwDjqGqFg9+/Mjy2RHNlJlikqfKyKI?=
 =?us-ascii?Q?HvYTJw6piE5exQvTHmkzhEg47iN4QF53AtV9Ysr1omCj9IYbpriI7sHmqzGO?=
 =?us-ascii?Q?d1CPkIzQR9BWx/tX4d4ECbLdcY6Y6DlRKXKkOe41mLZTGS4OwfyyMnwvGmsg?=
 =?us-ascii?Q?ZN2s0s4Jmo1vQ5G5morixAzyjUNKLB1dP4LO76XRC8RM+6ibAIdo7ggQsOpV?=
 =?us-ascii?Q?X9VjmqarLQgHwtVZsGSk5JDg7LFNGCsZ0HyhKvfgGhYR8i9gbNHD0p/iIlfD?=
 =?us-ascii?Q?iAY53CLBDiQf/3fxEsyWx2L8UCXpYyKLvr+mxBznTKllR1HVjlRh9+7IJHDl?=
 =?us-ascii?Q?mBh+WIwu8Kdufc8olXTYzhibbfUECoB3SoLjy0PAL+FXBr1by3ToOq8fNBKj?=
 =?us-ascii?Q?xQA1W1bEeCJu6Pu1Csc6CFYDZrchQ3H2rwCdC2DC5b6u1kAG8nIr6srLB68/?=
 =?us-ascii?Q?PFp9hy5lLQqGDItXecnn9R59Ki9D92JCrvUMP1X04mJ3/s4OA5w9+L04yRUV?=
 =?us-ascii?Q?S8AunIvfhK00NjpT5LM7U5YbmS9xtR3MENl/BPvnrIBomAz2SQGDE+bLK6rY?=
 =?us-ascii?Q?wp/MwbpbHF8PfQknAOxkwRpZgZ3P9ihyqhwLIZ3hqG0Jy1AgwuppAsJ9bQaK?=
 =?us-ascii?Q?YB79AmfwRIGKhmGTqTjJAgP+11CCYPZkeZNbXP94fwfmYnP3MyzpZlVcciwJ?=
 =?us-ascii?Q?qy6vmLvznMtsRjYNnZbnxZgHbsPtDfV1N/uZ4NpTeT5doVHM1aBNIBUIqExl?=
 =?us-ascii?Q?4MjuBhYVuG0Ta4a2UHZm61AmCmhX7Ey04eyazBJiCmhb1tk78QRZd0ytJZm/?=
 =?us-ascii?Q?Ua/S9toXa/UvuE/mYO2Sl/78pm9OZCc+SiPVkT0DpJcjZa6lg66vsMxRLR82?=
 =?us-ascii?Q?8wq3SfBgu9xiR3h9slcepVkvC193VwL+3Io90CfJvLe26Wy6NwdCKdCR9rir?=
 =?us-ascii?Q?1M4WSIJMNkaoyneZNzRY3Pq33QTAC69Cr6MT8gAYxxoqEmP6nU2r/W5S8hwT?=
 =?us-ascii?Q?UAflSDwNA6GPKN+LErf9Xlyx3h5zl0V758QG50jAfQ6WUGdikRy3irJQAuBt?=
 =?us-ascii?Q?xbBikyHts1Sfllu5NqYMFy1vxMcLZgmVatM42WNszOHHQaT3DlhURjeE5eB7?=
 =?us-ascii?Q?yCi074veQdn+zQng4xEBr6NhFMx6YZAHxwwX7Ac4?=
X-OriginatorOrg: irondevice.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4685b217-5dcf-4210-dd01-08dccbdb891e
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB2337.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2024 05:44:53.9939
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b4849faa-3337-494e-a76a-cb25a3b3d7d1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4XrPDRPnxYMscwk6aDr/A2t2uKqQRDDDKs+X1Pm17gJF3iX1p5In7BCg2NafuqPtZTdeNqHlweGxec5/K7CpKg+TA9WLCRaGK3YJnFpR+jA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE1P216MB1543

Signed-off-by: Kiseok Jo <kiseok.jo@irondevice.com>
---
 .../bindings/sound/irondevice,sma1307.yaml    | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/irondevice,sma1307.yaml

diff --git a/Documentation/devicetree/bindings/sound/irondevice,sma1307.yaml b/Documentation/devicetree/bindings/sound/irondevice,sma1307.yaml
new file mode 100644
index 000000000..0bb4ee664
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/irondevice,sma1307.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/irondevice,sma1307.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Iron Device SMA1307 Audio Amplifier
+
+maintainers:
+  - Kiseok Jo <kiseok.jo@irondevice.com>
+
+description:
+  SMA1307 boosted digital speaker amplifier
+  with feedback-loop.
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    enum:
+      - irondevice,sma1307a
+      - irondevice,sma1307aq
+    description:
+      If a 'q' is added, it indicated the product is AEC-Q100
+      qualified for automotive applications. SMA1307A supports
+      both WLCSP and QFN packages. However, SMA1307AQ only
+      supports the QFN package.
+
+  reg:
+    maxItems: 1
+
+  '#sound-dai-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - '#sound-dai-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        amplifier@1e {
+            compatible = "irondevice,sma1307a";
+            reg = <0x1e>;
+            #sound-dai-cells = <1>;
+        };
+    };
-- 
2.39.2

