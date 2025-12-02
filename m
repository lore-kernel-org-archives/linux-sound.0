Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013018.outbound.protection.outlook.com [40.107.162.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E7462FD7B1;
	Tue,  2 Dec 2025 06:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764655980; cv=fail; b=ftIRVSxObXkZMoYlKatzshFt59Ddh2kW8sNuloMsFI7fKjgmuSmJy6nKdJy9dy1QUge/cIvH7sQqAS0vd3xw/cdhmmmFqO1weBggAt/e4cDXXYllVATg6wp7R+bm/SmxWYW+4nD09oMcFcg2Y+oBBFMIjVZnwLQRaP1uii18PkQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764655980; c=relaxed/simple;
	bh=XcbIqwkzBJhyVBdbLsGUJfH/q0qIxGM7M9FDfwTspP0=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=NWJU5QWdlEo5N7YojOajXC3yLcu3RNjz4CwddxvjlqOBw9I1Z79jJHzMJyLHX7VEIwDN6jKSPbvssyWnDhkTKmKTOyVVaYXwar6261A9id17DgpnY260VpxjG/hFO7quXn32IviWfyIXNjvNLwcwzJMJSdLa11WAQSOCAD1xaAk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=NMCSlsQq; arc=fail smtp.client-ip=40.107.162.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="NMCSlsQq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TW0Vxt7Tpw4h4OnVVfvx8ySrf9wuJUOWWqqkV2u+n6kR9wUNC5Qexs0MSvyC+ofnb+TYto95FL6PkUkLAcrLVmWMg+8lpYurBMlyaU2pXujLuiUuxCzP1JhdGdl0VGDKBgAvxABnBOef7n5BdM+EoJMOH9bLAIONao/fRHUJO46uMyA8T1oF8HXcyvAX/qWpy/9I/d1ZpNv7jpg3rqS6eweHdFLD5XUfUoqNloENNCYryWGVLRyZGIPjHF+1bc9EfLYsp2X1SG4GfKxmNgmRRePDuXrolUsM32QYM/QSzH0326yXSrVD6oZl0G/HFDoP0Ca+rA8pGlnAOAly3pwXUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mCuZmW4H/dD7myojmAgwwfAk8XLC14hXd322qDBVJlQ=;
 b=KWfHQb+IbAxFM/gV/pBTe4tsEFI4u5bMsqAp56FsHhhCiwEMdG6wUIchza8cSNgQqCfcdhIFtssAlholLUJVEjbo4CfxDfNO9MiWxqqFRDAF044rRCe6qhFFz/ewu0/SAqMLl61FDqfk0+ZH0d1dM7oqMKxM1CnRvuj8zMUQFC4nGTMVsHtKR0mGI86o5cqHbqN7oLi6d9/IRZY4AsgQd+0HEP6gnqLYwtrtz4S1+O4dTGgFHoQVv/9TXWTMY0E8TECh8Umjqd+yo2D23GMc62YuYVqTIMmpGFNfTG0szeCvoWczST5H5WCkmy4vkoH4kvOjP4sbZWz7jebmeVeylA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mCuZmW4H/dD7myojmAgwwfAk8XLC14hXd322qDBVJlQ=;
 b=NMCSlsQqtlep5uRidGG1Sh4fOFtq9VmUsJ7yioSPyJ5VBZdIXZsO7cUGJckLM4vH+/GRogn+h5OGM/VTwSEC+9++DrTceWiS8OhKQHDSKXgtBkAPXn/V0pIHbVLJn1fbo2LRv7F4hfJLjBJd1Wdv7FlDeRBOeTBL2JjbAtWBDpfCFR93KvmqbAZIAhN2XQc2Y6F2HUCo0fdokegdE9/NArfpnd+Ki56HDtD3Qk0li4kcV545bfdxYo5AkdTym2Aa2CmhtW3aB54xSGhHf8d1eqia69LSXX2iJvkHEphhwr4v3Bisb4etMzw8v4EQIoVXd5gZbLmfg96+WVL9xvFx3w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by PA1PR04MB10321.eurprd04.prod.outlook.com (2603:10a6:102:44f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 06:12:55 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b%7]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 06:12:55 +0000
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
Subject: [PATCH] ASoC: dt-bindings: cirrus,cs42xx8: Reference common DAI properties
Date: Tue,  2 Dec 2025 14:11:57 +0800
Message-Id: <20251202061157.1710163-1-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0004.apcprd02.prod.outlook.com
 (2603:1096:4:194::14) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|PA1PR04MB10321:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a494ee3-039e-4587-b81b-08de3169d556
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|52116014|7416014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iCAizYmbkFnDBomzI8eSqxNbo+dXSWq1ppC4QBoP/pojxPbzF1Q8IwcEEEQB?=
 =?us-ascii?Q?ULcrglLHbB64pOlGOrPXcuH0K3NhYHg8Y+v3Tu0OPywM+nN88e/Yk+xTeTqL?=
 =?us-ascii?Q?06pofE2fdWwHRSZ/7C2yP6WZ8LlDAUdPpXMsv7FJJtbjg0Cly5Cg8PargmlD?=
 =?us-ascii?Q?gRJr3pPkhoMIS/467m9yA8giBhOr8LSuKwghiRDciHubXX7JVDPVEnQsuFqP?=
 =?us-ascii?Q?Sn05YhdnngdADizIbKyqWfyAlmLnfhadIa4a5y0Dvyl7rCHRrXeHYfsMtBfP?=
 =?us-ascii?Q?NisLjELVNxYWfXxKAXdJ+0NcSMXX3J/6vrwYAoTCkQ/fm45GKHPC8BuBew7Y?=
 =?us-ascii?Q?b9r9Yd7m0nC/6PEccT22XRy4odFZGD2QjeZBlnBeZk/3UzoFgMMeE9/Ky2EG?=
 =?us-ascii?Q?Kc//E/H3u+SXeQr/l6pQb9TCCBVqxpNsWqchwnlc4xgnKYQY+0ewj1Abe66J?=
 =?us-ascii?Q?P0+1HGsw1mt+Bgz711zldI4H51mk/a62s3OOkTsLPOFwC5AG8HovKmiFFB13?=
 =?us-ascii?Q?kgnHFoRiTJ6Jf/F45AlxloNCHphixwOmms9ZFaiEpRFWtQUuDTcQBenpItuS?=
 =?us-ascii?Q?mbQjDYsZL+bwUKc+eKNRA1gAVuQnntlVm0EgWH7G13qckF9b1bm9q4Gi3CXA?=
 =?us-ascii?Q?yxKYHtv5Q6Kpw7IBn9WhqzE8ObsKZF7kivzhJudk5Y0F/3pfjXFGkiGt80t+?=
 =?us-ascii?Q?tnA+smUVjymT24/UHtSMN+8QM+diTY35IH2nf7/UdMsggQv2wb1A4SmhyQof?=
 =?us-ascii?Q?Jk5BFdp6hDRuYGlJZy9fJKP5bXERyn8Wpz6+99MtcI8gj8VyVZd+dpCIDRkI?=
 =?us-ascii?Q?Th/8J9v14Q5uFfua541fQGGJLRhZo+LthuJ5rOji87/6bQFvAcL+RS3NHpXO?=
 =?us-ascii?Q?fYmh7lAcynJGG6uuvfuvunGBgWRU/A2tF8xSNCsqOjQdYChNWEH/7zOKh13t?=
 =?us-ascii?Q?8rNvyXnvzMQhYCspQ5iLKUzTknud5eN4UU2ZPT5STZ2qpzmCOcWuQCyy4sAN?=
 =?us-ascii?Q?3FQVygXBdwIt+FJvVAcVa/hsdwN1qqP+6p+RquPtLpJa+dKiDpftuArGEOHm?=
 =?us-ascii?Q?GxLPV83JPrV/P5akbQkAthRq3XkbrABmRAgn/o7fWCjQ6M5bTwWTfJc+LtX0?=
 =?us-ascii?Q?o8StXNLcf9rmFen/OkHoVu1+ItoEbt1JH1jXWn9BbTkG9dGpGIZdemgV2I7r?=
 =?us-ascii?Q?z4lbEHTqOzvprSFRHSb6DvWzRpRLs7nuMCiu7wjarZr/WvVC23CHowXyG6Jy?=
 =?us-ascii?Q?JdSleespesavHzKCEa2D3isDH4BQBL3UYCQf2n/GYDuuzrp1WIZYsKq/dFBG?=
 =?us-ascii?Q?weYP0tsdqe04PUGx3Uxj3i2zJmVP/K+u6y8YHdDGqKQGwJ/pTfSL6ACbpu0/?=
 =?us-ascii?Q?OaKke+IVe8ig5Qo2sEAzvfTsypjPKXPpRZcpKA+mhD7/ohLYvhoiDGSnIQD5?=
 =?us-ascii?Q?wxH9fzOmRYbH1Gdpsi3QdNXJic6Crq4DGrm/VVaO7D8RGJAPZltnF51LpVLK?=
 =?us-ascii?Q?7zdA+2fRaQGFOoQG7S2vP9P3ZZ2htklZQgzO+YYZ5yZ1PnYdNgPLFiDaWg?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(52116014)(7416014)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?e8W3TCLqwODJyN+Bg6W28DYJGIsvYockFTVMrM5bT8OwXDjOQexPfPzPRiQv?=
 =?us-ascii?Q?8xgt/bXiXGBsZXd354InNadxc6FdT9fJFC2zKtcfrW/i5b2zCnTzvlR1Hg3L?=
 =?us-ascii?Q?k1sAr5YL7AZT/MyyBdHe7ei86aIOO1en1vSHptWhTjHEn7a5ECIuywDzZPQK?=
 =?us-ascii?Q?9EmwGshcKa9gUEZBHh9PyyljuZajzS8HWrp1Vlh/NHNxD3fvzaFMl5sRE2En?=
 =?us-ascii?Q?g7ZJ15d7u3BgEeIZwj8vooEkkMdSUYIsmBC4YHhrVGlfH14if92GFe+O2rzi?=
 =?us-ascii?Q?/74HfgkswYO3cDumJQvEU/NwkzdxX3Aj9qBAyFSeHmFIfquFb97b9hnuzBFz?=
 =?us-ascii?Q?AuSO5t3VFebk9nubjaF8PhLkaeBc61hFTUNcoiUAtqpLVaurtvyNCJTDMgDd?=
 =?us-ascii?Q?mmASWQu3i903GwrE0VVJWptFW1fkvSdMtKKA6La/LGzgwciom/aLad4BAvsl?=
 =?us-ascii?Q?DorYBvyiigRaPLOBsv9uMTOdo/qgyq0rPhJakCI13ktK5aiP4cbDND4hsjfa?=
 =?us-ascii?Q?y3OKiMw5fwwS6Luo4QPFtXzBNE/w/FArK04bcCEHcrGSGqN6xiPaVZcK5fXq?=
 =?us-ascii?Q?MwpxPUEu/jGkgmqpsEh7eczCesM7KureMjxMYHC9gMuALAUSkQqxG3v5oW2o?=
 =?us-ascii?Q?KYV8FiVxsCKizjBEfQenSG8Zh5StB1IXRxwV2nidHR2V7EaP/8WT9jhonoM+?=
 =?us-ascii?Q?JjzeVidymT4e19GwUGKE/Fgbf6U3V7ITdMTIXrxD6TJXAuVVkU+bgSdPh/ou?=
 =?us-ascii?Q?NFCY/NTIc0/FKar1E3Woeiw5rPnUXzjAUFm5n3gL1rj7Z0iDpXk8q3FIfUDG?=
 =?us-ascii?Q?6w9yVkRooXB+FrmEYiZF7xtnuG2GUzSvb0TRBXsDerHNPfX0DP6usCZRaTjW?=
 =?us-ascii?Q?rLXQBWLHigK3f7lzRkaT1vWwA1+hdwM5GAxFJJVNTYVPvbmzAd+5YCceBw/+?=
 =?us-ascii?Q?7OnL/MXI1yUasMNbhntXvYIT2P0eXdCXaO08+L5ABO6a1PLjHf4LqKvcxmEJ?=
 =?us-ascii?Q?lBj8UlgDZYTNjhDnWsFL0/1Lzx9jjoiptnCVycFsn+0gkGZc1+F+UdNYyieN?=
 =?us-ascii?Q?2wx6vPh0I8hMY9CpmsZKgzygd7w2RO2UPKX9khYbepKsNntrDVYltnHDmdGO?=
 =?us-ascii?Q?xcWwfNwrwTBvBtIixRBuSIR63st2PyD0PVzPX53PxJApitSLePkVb1D8TBfK?=
 =?us-ascii?Q?OawJ4FLeBhijE7yIk7RY1uRjvvGCfF5jeI5D+bO32gLkbFRJSyyO2ks2j4TU?=
 =?us-ascii?Q?CiFF6J7OUm7iei/UGNFqAaTWepPLfBU6RqPptWWxhGYUnVCGnNiRvsePbvKK?=
 =?us-ascii?Q?EYC05q4sjcFagda2Sv6WJMSi/Ujf+KFj+3fmS0AIgmZ9gv+oOG8eX5ddmp/9?=
 =?us-ascii?Q?CeRojPf9a3aaGoEqAqpJeRRRhPLHsrM7XdRoxJsukJYx3LpbY7Eb21p4sDlG?=
 =?us-ascii?Q?hP8nR/sefD4bHXedjZhvUVTlEHGP1dk1A85HusDJFbm0KCa3Ug6YPP4xIXC2?=
 =?us-ascii?Q?/+yAxgpy3ebui0rnP7Y9EvM5EOCha5E5y8tIw5zAWrGMaAsMXFB8uoL83fhf?=
 =?us-ascii?Q?mqNJlm0E2FJm6yBTikVgwnMSy4Uv/f3wm2flzGNO?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a494ee3-039e-4587-b81b-08de3169d556
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 06:12:55.8281
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NllkiRc3pXgI+BtugLyA2f9BmDN+cG7h0FXyLjNA+XTd9RfGgj1t2tH80RsmJfTS+pYkPS2GmF/vw2f2Rf/R9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10321

Reference the dai-common.yaml schema to allow '#sound-dai-cells' and
"sound-name-prefix' to be used.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
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

