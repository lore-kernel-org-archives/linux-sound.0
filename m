Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012055.outbound.protection.outlook.com [52.101.66.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C50F4418DB;
	Wed,  3 Jun 2026 09:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780480261; cv=fail; b=tpedJIX95M71adiczd7p48GuH6fI4iE/2I58YSsX/kBM0pJuCvFz73x0s9QJnycxIaTqEk5Q98v03bjXYpK7/kNHuBupYtmUWLyiqNokgsxBhIgu2sU4wPYuuBLoNp8k4BeJLA4462g6x3jGVnj9CqOfkN+Ld/8Ueeqp8QGossw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780480261; c=relaxed/simple;
	bh=2w6WjEViumcaN7zzFvRoj7sKp/KLAeBfJDGRJJk/SS0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ze6Aw1T0vubI4/PFCasGSpiy7ueFbGk7zzUhvsz1q3kw2yP9P1Mc7d7zTIxwqabARREWxwo9sTTX6FbvZ7ctb6p/ganElNA6bFF9kq/plHM8mLaW9HnP3EB91zWlNBZRbW6pwxw3BRtrhHg0CJzmio+wpOwoP9EJXO4IzoLgaqA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=gTh8kt5J; arc=fail smtp.client-ip=52.101.66.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="gTh8kt5J"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sjd+QPNwUF74UobeJ62HrWPU1YNptSV1WB1vtGCpU2pyA8FAiWeLM48DtZVh5oHvlp5F0UFInJlCI+YF17E8+v8nWx6TtTW5+iC9K8pkb7/wBP0JUzaW1n7+ZislWJBdme4egdxgVphYa6r5I7U4XUFMDUkjGhokWtyeACeGqOujLeaW9iUUcuTWdL5oys05z5f30CLXHrDZj6KP3mMeIYACIzCcXp10Tr3j4tc2U4f0QvLTNWd/n88XxmGgvNps3rB7/B9QQieTJYrBFc6GNwNYpbdymLXFzw2BptmQRmkCTGr3jcP2SsBN8T0NfPlCcJ4eIx51f2W4ftjWPrqeEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jJRKfN7TjXaGrKoMAkE2PDIt8JUdB0TbRISXjd2cn5c=;
 b=MBPJBbWA/YeHbY7WFUVoUKne6eyNnol5tLtAx4QaDTADQzycMuleZZUE5Lp11hy/xZriXDlbN8Hc5GZxO/C9z3zXTaJmUIORDu0ZTss1YYgojIU5PGOfyCfh+wiYPwSCK7iVL60QQTmHKZL/9y7HZSmsJVLU6hZ6vLOtJJ3KlfqZ14Zmh7fF4tUsX3fxQHapreN2BivgDlUYjECjrF4Q38EoQswKj20brREG36V5oHWE+khc9Ah4bIbvd3jn/kmfp7OLKQiZsi9SNpFEGKbXGLhm8vrbA3KkeAq+NuHovkBNI+/tIp7+K7TiShdvi5KQNm7r75llEvpXGB80MFHX8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jJRKfN7TjXaGrKoMAkE2PDIt8JUdB0TbRISXjd2cn5c=;
 b=gTh8kt5J2Eo/PUB2oM6kh4EWyOrrAQBnSkAUlU7dENRoocOmkycP9DUshEohF/IecqvD8DxEqxGI/DnffG0ngkTh3aBaoHTA/8FGkZmOEe0OBls5Vc3r6VU6Dr5/oUA057cyn4kX1Gz9z4fWruKxzIh2qiwIrDPAazUcXcyl9VOg53keTTQ6ef+/U1xyVgxCwnjeZISo7xXiuXprQkEARsMopyneJ9EiuQobZ01kRcmxv2N035j/4dhsscPDVVfoDgNxuMg2ROPVOsL4VcqkoH4PS3Ak3U32c7oiEkPVRpji2CtjUIdgXK5RJviQlHBUuXNKjsWFP3ETWnURQJxS7w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by AM9PR04MB8258.eurprd04.prod.outlook.com
 (2603:10a6:20b:3e2::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 09:50:57 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 09:50:57 +0000
From: chancel.liu@oss.nxp.com
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	david.rhodes@cirrus.com,
	rf@opensource.cirrus.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: [PATCH v2 1/2] ASoC: dt-bindings: cirrus,cs42xx8: Add SPI bus support
Date: Wed,  3 Jun 2026 18:50:40 +0900
Message-ID: <20260603095041.3906558-2-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260603095041.3906558-1-chancel.liu@oss.nxp.com>
References: <20260601080224.1410292-1-chancel.liu@oss.nxp.com>
 <20260603095041.3906558-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0151.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2be::16) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|AM9PR04MB8258:EE_
X-MS-Office365-Filtering-Correlation-Id: 228a2947-0324-499e-7db8-08dec1559c5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|19092799006|18002099003|22082099003|4143699003|11063799006|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info:
	KhIhbNo5dGHHbG3hMKKsrBBq2ZHnsH9JByXlsiyJYBRxd7FECht27Ub7K4tyl7PNKM0YUUTIGbqMVQVjLJqh/ZwG8up0CtEDytjwTNcowYsRq6tjGU3L+RCOknWMfdCNPtdyffNNXDavLLevENfSCRTcGymjkgjU0guX/iPWvlK9ckFyuyjF3SHKo6z0KEX7miUT3SsWoKcnzv6Um4ZfQ71fE4cKBHkNQZplM41B9lInBJyvLE35l+5+t3oBtnfANM+Ds1fFxWGb1XL6gejJYv1oMWO+PpGda86ImiQ0DOr+AGbKwU/VK4zFvDdptvLy1S6om2t2SadOLTK5IIl4WwB7kATvh7a1ICsIaOutEdZDbRd5pX2nqZe2HljCSWa4WaM/fluCrkRWNeZQidtI6mZH8FmUO/pBRFbw/lntbCQwmo8BWrEtfGtmAVrSLemmUZ39DSPsi5xKBMVDg4oooVOnBYM6RhRqRddjqfjl7lhxAT21u95uys/hsRHPQKDsjOTqRbBI00CVN6jzrlfQslDUD9ECzdAEk1AM+FSb6rO/SskyOdPpo0imHFV+lulLTXo607ykOb9CtzayMNe90w3Xaag18LSngp/FG6ORVieYs/km8KcBGzXaH6ItOeoLxVBErDVhxyopu4CqFccIOjEAZemGS2AvbcUOD8W9MaEbmhOji8fmSvc9nD0LPEOa
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(19092799006)(18002099003)(22082099003)(4143699003)(11063799006)(56012099006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VsFMrmrRWXigesFVnSgixCN8e86carC1Z7X3+TzHrgkuPBDXbC0yGioFCGCu?=
 =?us-ascii?Q?8IZShV3/ezEqy9UWDAv+dWG+otNUxauvpwmOsLhhg+PHi6WJJpyoFYIc/PWB?=
 =?us-ascii?Q?x6GfbGmWu2hZDRtJKOFcrKrDWVmnu8XzdUbN59RvKUkTLC38ZxpKzd0CFmJj?=
 =?us-ascii?Q?d8Znz8oFQ7g5nzsxod4RGnSzbQmdvSDLtRrI7AYgB0a2N8juoKtiy8z0g1Xd?=
 =?us-ascii?Q?zaGUCNSPZ6lopiUr9/hsqF1rIuTvv2BMiyuM+g/MyAuvsPA+GjsKAh6BQPqi?=
 =?us-ascii?Q?47IP1U0LWsjY1/O/+0F0WzQAOYvXtJtfhNPMzMDULIgfRy/pXNiAeqm3/cvi?=
 =?us-ascii?Q?0dpEn0ix80suymUZu1QD9HvwrWb6i/zFLtfaiqnKm4MF7iNSJCfqdFOt7vW6?=
 =?us-ascii?Q?yipxhHtrrODr006z/PP2tKqcRdGMjKHCDgNcPx0bug5RnFdYAKHIWAy4cdft?=
 =?us-ascii?Q?kXfkYiZ2P2CWs0l+dVRXd75WvXNe8VFZ7XbcBIsgZcbjDx37g3q064rUNkVH?=
 =?us-ascii?Q?ujTuSQ+924p/s/grvb30tTNgrEM3LXMz8wxexS6K0I2fkppVYt8FNg9tIYwS?=
 =?us-ascii?Q?LiTAdAPWcrw3UpZ4ENWOz/IIby1870L+4iBgcD5xwC1zIhthB/6uebhd00Cd?=
 =?us-ascii?Q?1t7sJkzJAR6Tmwz+SxM1GAQsbZVg8XkTw9DbQlx/At0fg4xmeOixg5whei+u?=
 =?us-ascii?Q?oYR+LwS/9W4sEVUW9A0ivygREcvuwuIF7646m8vTJB3M7Ir4YGhst9ina1br?=
 =?us-ascii?Q?/DR2mqAE3h60Iw9qgIi1gYq8U6h+GJfXHioQDvgmK6yChPMORCEpCI2uHF8E?=
 =?us-ascii?Q?fkEEIgTrn2DMEuEqOvJRlZUWHGdFe3y1OFfH9sov9uYXBN1gVGc3ZsPBAhSH?=
 =?us-ascii?Q?LkytawzdJYzfxQDJQGG0+9A21dbf7trwf1X3t+iWcLBcY+/wd2tAAswC3HpJ?=
 =?us-ascii?Q?iPpihj7ogW3PmZlzmgX2b86yXxZBXcHmQqFArBodRf6aD5vQWBIj5BMdTbdd?=
 =?us-ascii?Q?dE0I4C8jTICGN8bHRwLX45oKy3DWd9qVseQaYd4jqWii44IfpPZx4+ZG6ISm?=
 =?us-ascii?Q?O4VxN+Ou4bLMNA6PJoYod4qCSRtE6Wbf6RtsQpqz4UwUc2/7FgbqIIhpqEsW?=
 =?us-ascii?Q?D7wgxf0tuPzlrqPsk33ObRkIgOZkdDepWT+JLTjziLCU8vuS/u3J9OGk7WH1?=
 =?us-ascii?Q?X1hWNlBDvYHDUQYKOPfc/7LU2mG5+h7LNwfdtxF+uoZsw5Y+DRO7+KevhZxK?=
 =?us-ascii?Q?97OrFRdt1bh+fh1Ij+gsvUopZhVxZsDyET3YBY605/7XvtR6eTgaNtOZd1ng?=
 =?us-ascii?Q?yAExuy7jy4eSXxgR07nvuWN2Sw8AWC0sEeLDvmXd2/eOqrdnIDlWXav5/t9k?=
 =?us-ascii?Q?yOZVReCWov1ItRS2FWXGrvTCmQPGi1ueGM2Ii6NSn1/9CiJlh8GiaIC1iDzT?=
 =?us-ascii?Q?lo7dU/kA4QQLN9NHrjwKRdqTUYrSO18W4r9M/VitK45nduI43jUwm2eAgNOg?=
 =?us-ascii?Q?ZNyxR12JnuxOhx/3jQrS8TDKudROzAid3PyiEX3O9wK1uT6Py/tgSglFItdW?=
 =?us-ascii?Q?JpfBmA/6HFp6t5yTE81Sz+RhepEIaKmdVlEmDP9YftSV1EqpnvSnrajn5HXK?=
 =?us-ascii?Q?SvPf9+BW1PVmnzDNmV3R1jEU9Hz1otzEkrJQomIayvoKge+VV7xp8h4+/h8z?=
 =?us-ascii?Q?ycrZKEHIXTY83Iqgb1i7vf/s+ixRy/9Rb2KqKf4DJOl58XsBAcgCk01tWMG3?=
 =?us-ascii?Q?Bzr40NYPQHfVfJ6EPknwQ7WDVZ4ErQ2uT76q7QfAp8tKh+mpmQB1?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 228a2947-0324-499e-7db8-08dec1559c5f
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 09:50:57.5023
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4STs6df/cGmaAa1IYELcwW7M3FCXUVDl7yfZPS3Us+4S5klp7T5k/U9YvdRIrtC1eWfx10D9qoA4hmDWr6BQy7QI49toRIUQ58f7j2gIyxCwSrzn5AF5NzrGsx9V7kwU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8258

From: Chancel Liu <chancel.liu@nxp.com>

Codec CS42448/CS42888 supports multiple control interfaces. At present,
only the I2C interface is implemented. Adding support for the SPI
control interface, operating at up to 6MHz.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 .../bindings/sound/cirrus,cs42xx8.yaml        | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs42xx8.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs42xx8.yaml
index 7ae72bd901f4..a1ae548c4b7b 100644
--- a/Documentation/devicetree/bindings/sound/cirrus,cs42xx8.yaml
+++ b/Documentation/devicetree/bindings/sound/cirrus,cs42xx8.yaml
@@ -11,6 +11,7 @@ maintainers:
 
 allOf:
   - $ref: dai-common.yaml#
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
 
 properties:
   compatible:
@@ -21,6 +22,9 @@ properties:
   reg:
     maxItems: 1
 
+  spi-max-frequency:
+    maximum: 6000000
+
   clocks:
     minItems: 1
     maxItems: 2
@@ -86,3 +90,22 @@ examples:
           reset-gpios = <&gpio 1>;
       };
     };
+
+    spi {
+      #address-cells = <1>;
+      #size-cells = <0>;
+      cs-gpios = <&gpio 8 0>;
+
+      codec@0 {
+          compatible = "cirrus,cs42888";
+          reg = <0>;
+          spi-max-frequency = <6000000>;
+          clocks = <&codec_mclk 0>;
+          clock-names = "mclk";
+          VA-supply = <&reg_audio>;
+          VD-supply = <&reg_audio>;
+          VLS-supply = <&reg_audio>;
+          VLC-supply = <&reg_audio>;
+          reset-gpios = <&gpio 1>;
+      };
+    };
-- 
2.50.1

