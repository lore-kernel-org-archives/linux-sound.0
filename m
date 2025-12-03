Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011003.outbound.protection.outlook.com [52.101.70.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D1D12E9EDD;
	Wed,  3 Dec 2025 10:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764757766; cv=fail; b=JQmzYxuSc4yPFHduSCryp30A2/Z4m1Hl430gkX48yrrdhUYhxh00x+kjSDhSsUXja5ozosWtMjyeIX/cdBOO6ov53kAPkykGyulaGbHtubozSfPZG+Ap+67bcsxawgMOqQL2ndxBiHsuFPeoUaNxjTLiSbK8XTOKRoqjSYDhzlA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764757766; c=relaxed/simple;
	bh=xWLlKgeSc3SPZccgBxvhTpXoFV/uTLvu2/hzdCXyoOM=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=WsEU1EoJRFHA+tCNwYLCXjVAXuYlx2vb1QOxDJbxtzzVAAaXwEG+EmLAbEDw4pd7IgMzU/MvBxFYfNxekMdA7jtWujQbLho7BewH58/jIduqnAA+1gfBa4q/Uo7cVikX9a15FP/dK1DeGC+MCusfjBgnD2ZMfMa2XNN1QdwZ1I0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=bvlnpIV/; arc=fail smtp.client-ip=52.101.70.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="bvlnpIV/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZPyWLYLh9+pU7sESGqihH0rGQ8V4+KiqR/89rHb79/U7d3vuAw3nz4N/jPjSyHL2IdzyOrg1TJD39hon3cGVISznEDCArJSqFI8cNFdVwrkdtJuTKxqt8UOoV+LxxM/tYeK2BLo+l7fPDrACF5r1F5oJyQXr1jgxgyw2xuc0Kzpp6wa+FPHm9zLvQJ3cfYX1A7eFaeoTX3QaYh0rM7yODnpeRiYXYM3NOpWcKBdKLJpaUJcuxh1pJ3dMU8Wp2Mrgf6wzF28pSVm0QZznAP01UDjWvO25QORE3wi9setq+AUHJtuddvP84E+5k44Lg+LxK5vw7n4oLJF07lD/uypMYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fKuTwgIzuA88/6/rBj3N9E7OO4cCT5P8T1WZd18PBsE=;
 b=mhXVea4s+RtKOZBlJ9Z86xgjPMFLSPMezmhKuXPIcWL4nm3Li09zkWa1uuwNSd+rMY0JfCtP4NFpR1kxtbLF+0tc1jZ6RGMUO+zGBKUkws5DTuhtAb+SJUgTiOLYVH2UPxMuK7MxAFgtEudDJ/Tjnnkc+62AAXdst7pPvIUX6RPKPGRl15qbvGuHmDq6AR0zHcExBRZWOk457KWQYakfPLeL0YQO4OFRZYi//M/LcRmzNZIz6JzDfU/SEP4v0Bx5e7gvujGTeOK1vXChDlnILhI6NDr4rIPHGqYodXP4pwuSxfF5szg1XHVyhgB+PJ5kcxe+iHbcPxLfTBJveLfLCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fKuTwgIzuA88/6/rBj3N9E7OO4cCT5P8T1WZd18PBsE=;
 b=bvlnpIV/BktpGY3uvFE659dhwT0pSPQPVxybifkgzR+M/aErJonWMYFf71xahIiXvQzglN9yRGwYoGnCtqvP33ZgDfhCHSUg9XEGMYhGLifuwkntuJNSbdmEHttsc1dRPDBxwjKZXTFBjueFSEt1hyJ7YiXeoT+Nr59iIHILvq+iBDULpXDlNmt8qbyuzWxxMQkWGedKbjKiy3bns0Udpv/3lTDUY1CPOylsA86nTuzcdo5ezsS1upsZUOjnWpMXulKYhme3iSkJMzfysNvxiPXJif+YwpcP/yctwQIZiGq+KMDOeUaJ4EyUve2L06L2/2jhf8T1dtJVG0ferFQGMw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by DU4PR04MB10768.eurprd04.prod.outlook.com (2603:10a6:10:585::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Wed, 3 Dec
 2025 10:29:21 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b%7]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 10:29:21 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: david.rhodes@cirrus.com,
	rf@opensource.cirrus.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shengjiu.wang@gmail.com
Subject: [PATCH v2] ASoC: dt-bindings: cirrus,cs42xx8: Reference common DAI properties
Date: Wed,  3 Dec 2025 18:28:36 +0800
Message-Id: <20251203102836.3856471-1-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0158.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::14) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|DU4PR04MB10768:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b671999-5e0d-4322-c726-08de3256d282
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|19092799006|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?o9IJtiiMGnKgHKTzhDejmZKUjve76QLymmed7E7T0Me4FYMPOlX3Ceo875of?=
 =?us-ascii?Q?/BU0h/JYaJ6rhK2O+P6eFnZ9U9d34tSEOEU2qi6o4rpg6qVivgT/ABA+l0dT?=
 =?us-ascii?Q?mH6QegoX/OpWLA/rRoWl0ieq7rqQa1Y3JO9QYmwQdDgufOb3/mxoHFu5Pglu?=
 =?us-ascii?Q?hdBp1oXT6wLslb6ZtQe+gwFo3rt+6A+PwXPClehot0L2/hmGbPv2ZPe9H7Mr?=
 =?us-ascii?Q?Cgk0aJnmltNMMGBzg8LbnFHD1gAkzYHHPkt0PDOiY/RmgrpzLoFumCyrg8b6?=
 =?us-ascii?Q?wJYrdYCXI9cOEs4jLI/4s6+QMBeCXB3F9jG1YDRFul6FLoErsU3/OP3wmKsA?=
 =?us-ascii?Q?axiIbOV4+4kWaDN7Ygb914EX0LOEdDP930XNM6SLiTAftetKw7wOwFTaRYTM?=
 =?us-ascii?Q?9n1Bou1+WpgitJDlkfq25o9d81KYJFKdcH+reoPqqbcPvIoKyHtcQ3MvOFth?=
 =?us-ascii?Q?12MOnnZ2tWE2VPTs+bllKgYr11T5wq9W+f0iyyJeJ0Tmk/T3E5yIYPRTx9+2?=
 =?us-ascii?Q?rBHVVA6q+fWJ4amRSBYzkaWKviVz1/VSVfNZkNzXwglF9EOCJL0CvY5T0wfR?=
 =?us-ascii?Q?1i4tiFQOH8g3vF5YsCjG8MOi/O6Fuvju6u0/mY7KeyYAXMlwON+t610L4AII?=
 =?us-ascii?Q?qha4AtR0DzoYCIgOq2WvkBDxME8m7mGv/gJNev3Cmhh4zcIiKVo+uZgCvIw/?=
 =?us-ascii?Q?bZfKOEOleKWT8gm/HuBekZc3gCwsQHiWfPqPT7zoQf2cwuK2so3nkJrYKTYR?=
 =?us-ascii?Q?IDDtiPD2sqmg7jjVLcN53Xl1GGvK4dxrA8lO7FtlMzy7aoJIq2q6mXkmcKNU?=
 =?us-ascii?Q?b47+8J19WTfwHbrhw8FHBCF+tfKKkWM0JpoBOfLJGSZ+SyUxd7O5O/o9WGA7?=
 =?us-ascii?Q?G4g6bdu3sQMVMERybrs088Bb5JPvCQDkAejwfrQ7XMJ9Eb/SNxsHKRkPbXCI?=
 =?us-ascii?Q?De8MXtfMzf+Nw7Ngtwrrc6rR2zlCnNWZDcTemi8DE1w8oUswXtUE3n9yXfBu?=
 =?us-ascii?Q?5PQv1TSIFGTbKDmpjLdXuQZPg6nqJbnFFvL4ZI4Wz81xucAJwnqW3RuL2qAB?=
 =?us-ascii?Q?zsxbi+nFoFZ2sI1LYxllelfn6Nuiy3UpymMkavY9z1xjhr/lt02et1p12zn+?=
 =?us-ascii?Q?uNuzj6DUmonYS2DfkvDwSs+OjPO43Taf9wbKm20mamADjfz9e2c6Ya6fa7Kj?=
 =?us-ascii?Q?er1qxCjRC1NHT7w19X0lP81b3PwZ9XjnVROVi9QLlL203NNX0F7uenmSvn1e?=
 =?us-ascii?Q?cmetoe90jl/wZvroM7KSYMhaWdPV64F33tKBUiDe2VRVe+bYNDJqEDiSaGPp?=
 =?us-ascii?Q?CJZA/zNG62DKZMtiRFkLhPGw6KDzBpfzB7wqvIPnPdILWwuNYyIVhVbzuFlP?=
 =?us-ascii?Q?Yaci8ohw+2R4oJ2XpFmisPKxDp1reojrU1oGCJOs5pt6kF2ygdyEBGCIdYQs?=
 =?us-ascii?Q?GmLj3cO5Sa1baDKa8Og9qZNzeCL52iTje/4EWUZ5NfsemgQUD/XtbwQW+NOL?=
 =?us-ascii?Q?cjRdgg0ynd/t8K+hx0wmtizNfdUUV4L+Q7VXSvs0aJOFvXwbfh+OQ8SI8w?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(19092799006)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NCY595jZp7BCugo0HWV47FShbg5H+OfV6yVqo4aXIJzFLGpfe8JfJJgakpy7?=
 =?us-ascii?Q?BfwSEJLyHiWEayTReEvKH4GSzIZpoHQz4HudvH3K0LZbZnJDuYwhmUu7N+/y?=
 =?us-ascii?Q?bxf6mWr2nZcfbkYMGvnEZ3fuS65GsSCFxIUKUYYwGmxyfy82UYIFgvHZ9HEo?=
 =?us-ascii?Q?xB1s3qZ08S0PvOBKLNlhrqvt5kVXIOoGb5+zs9zxiVTItmQ8CJXVJ4BDI32H?=
 =?us-ascii?Q?4/40sgPpkjkxFIjOPyUl23w3w1EQjxnEen5Ycrz4y2IOGBhfN4FNGHkNEwCW?=
 =?us-ascii?Q?B6xcnS6oi/k6BJqndifEMUy408wy2Gfr1yQkM3L+AoEFJR/mB5pt7O/jkpY5?=
 =?us-ascii?Q?5d6rO4/CO7BRCsawiqxZRvJ+bHPC59Yt9lvzXUwCHiUzVABhrsG/S4AAaMH9?=
 =?us-ascii?Q?Y+YLbSWcq5/wSOCGP9Oj628Ku5Im+I+XnhDWPgYr0K1JoD6/dMc+vgklZbyZ?=
 =?us-ascii?Q?irlygdXcgBxJo04/6iPJk5L1GyHn77WC8xslvz6ikNBP5XS9drKOG2TB2zVb?=
 =?us-ascii?Q?NVQRhQ08W51pWfNuGW2bYuU4HIMByRAMWD+lOIlNBcWXMo3fjPCIYc/pSXNZ?=
 =?us-ascii?Q?YtkbVv1lEDccBGnTm9T9cmsl2ckjYt/bnJE90zwf7GXT8UJOI0mLclNgMAfb?=
 =?us-ascii?Q?PlxbD76GXnh8V+ZN0ls7+vfqivfPFTmkHoB1XogRf+TzWVuzB9sSGmQeZPB1?=
 =?us-ascii?Q?jmTiBwqyG3g4g2prAtevzXGNHzC0CtfJsYJcMVwUr1UBuAHW5yEsLlW37sSj?=
 =?us-ascii?Q?a2NVKPbhE7A2cAZP74oT5KQWDQPsezEnkyPzC6J9HsvS8MFrgX468YGp3JZd?=
 =?us-ascii?Q?mCddYqc2XylfGa+wi373kfbxZ8ifsRozLqWzvIirHuetKgcuHpdr/qwFv5ar?=
 =?us-ascii?Q?wzYb9HfBznLaGfl/lBBOJd2vh3E/OIA0HyASfSJ2IxiOECRpO9FWDy85lbze?=
 =?us-ascii?Q?eMtDgsoOhwC5X4wpwnXIcyBoZimymzeRvhp6UwltkUf+7fAYAkfyugTNuotS?=
 =?us-ascii?Q?XO60tzcjkDIJmvCQR1BaN9bjhhPkVEX0eiUQlsg9MGirOMGIrp8HDwZGodr7?=
 =?us-ascii?Q?2AC/1UXSl0LtHEKoRcHiRBQVEwqm1kKiCSu4eFRLDVQRRUi2S2w9mWI2uUSX?=
 =?us-ascii?Q?BAp6p0uiU6I+a/oXZWiVN96J0Sdr93KNRrAldS2QuBbjbMpXK5av0CEHS7Cn?=
 =?us-ascii?Q?aEDuhY64qeeoBuMPCGK+ifVtfxIXykpz2zas8aG2L/aVoNldD121OGWcM345?=
 =?us-ascii?Q?6DzMGpwdiE5lsVwRvySUmsBA0NhXft57fdIxkfZLLP3jIWW3Kiu01V18XX1B?=
 =?us-ascii?Q?sz+1xUIwBobqyqvlmL/Gl/4QhpXGehT4ino2BQD13BOauXgrRVx1bZYvzqpa?=
 =?us-ascii?Q?Spg5egxlI0JV6DqgqH1L+Tiq6hQAJvky/39VVRdRkYKvt2oVKO1EmfggTsTQ?=
 =?us-ascii?Q?m4tpAKWowm0jPc08pTg6dBw4SA03NaUj8Lp3zNqhI40nCqn2ChAUrndQU4B0?=
 =?us-ascii?Q?nD11WB1xz7PR+PZ9cmQ3R4dfpfCZVUZYyX9H/vMKn5NiMzKcETULeyCWgokX?=
 =?us-ascii?Q?HhBZraP/MK3CWQK7q5wm23h1Y9MuBBWAufsgmco/?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b671999-5e0d-4322-c726-08de3256d282
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 10:29:21.6644
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xgxm+NkJMqPO7AaCWSiyua7YV1j6mqWwYvB9TJEvk76eKbYntl0JvL5r2nbPMaOEbV8RA6L6+Zxk1BHvKwRxVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10768

Reference the dai-common.yaml schema to allow '#sound-dai-cells' and
"sound-name-prefix' to be used because cirrus,cs42xx8 is codec DAI.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
changes in v2:
- add codec DAI info in commit message.

 Documentation/devicetree/bindings/sound/cirrus,cs42xx8.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs42xx8.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs42xx8.yaml
index cd47905eb20a..7ae72bd901f4 100644
--- a/Documentation/devicetree/bindings/sound/cirrus,cs42xx8.yaml
+++ b/Documentation/devicetree/bindings/sound/cirrus,cs42xx8.yaml
@@ -9,6 +9,9 @@ title: Cirrus Logic CS42448/CS42888 audio CODEC
 maintainers:
   - patches@opensource.cirrus.com
 
+allOf:
+  - $ref: dai-common.yaml#
+
 properties:
   compatible:
     enum:
@@ -63,7 +66,7 @@ then:
     - VLC-supply
     - VLS-supply
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.34.1

