Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011012.outbound.protection.outlook.com [52.101.125.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB17E195;
	Mon, 12 May 2025 02:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747017402; cv=fail; b=q/vg6UAZixYEtAW6/ylK3+mPeFMBFPUORAUxFIL31Gt3HMcGGQxAgoX+HGMTwT/qtjlvlc1irscXfTcdktte044+u1gC3fveCM5cJNm0o6iP+K5qVrrkYxTL576sQvxS8leCIMq/YEBHD6Xp9iq/8akbHkNLlwnZP6/geq1/lBs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747017402; c=relaxed/simple;
	bh=+WeAFqW4164WeR5PT2HE0CKPwNY6dCC1oRhmV+ta7/4=;
	h=Date:Message-ID:From:To:Cc:Subject:Content-Type:MIME-Version; b=UIruCb6ePNSNo7wbLHKPsrz6JJ1WJPobRQkhySuIQSaWfD83u6jlJkWxdoVYssRik4z410fVuih5XsI+nHkEpMQpFO8itBIa7ZKSE4i/euNBHUqfgdyoI0zaXWuBoU4O9BTqPOLVR5yzPro2B1i2YprvmugNielWyr3tH0Z+daU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=cJ49maEm; arc=fail smtp.client-ip=52.101.125.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="cJ49maEm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r4gC3s6mb8xMrs5MFgmH0io66WJ0RMdf7pxiTgt0SB44OIn7+Z/Z8zVU339Hqij0NWuNiCKyzRQ36OMjwb0f4hmgS6nS1eMyG0Tl4bqRLmrT2BmATGaNXEBGhQ4cqsU3k0X87deSMpEVibM+8T3EE3fuvrUzmgBevfTFeCQuYiQJ+ZR7o5vg/3N1GXP1SDdf88cYnRhLoztYbcf6k2pzxOxCs53J/as1Ld5MACR2Y6OcgbmQQ+eRQccXbA7U/Rzj7aOQxxAANf1TiFiQzr106SexCopzG61BFMmUvPNxMqrjJVbdcLMbC7wb4XjuDT/RI+6L2EM7yYRgGE7bg9qGQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JI16Y55FwxEet6Xd0vkhR49el9u+l3q82In4yLF6oN8=;
 b=h9VQjrjfsBAixh1NQ67SjsQMN/xRVI998exV3Kudq9RACatN0OV6kAF+A0KpCENzGVswH3TgzYpRbN936GI6t2k18OYkOJy00RKsHDh1bdpgsm4IQzVtKIcQao7bRdseaNzSoQrR3aroQYwMt2ESX8yHkVKlpKByz/rTpvJxqkS2ll5Gsb5cnGwMj+cUrBq1i8z36F/zyScXpQAj62BzQf9Qm6vhwXf2xYymhA44hAWGiur2KCpvErQ9H0mp86wfWYxbBhzBY24o9Upzof0hKo+IOT+jV2zvvuE0H4IBPbJwFhM+M21pFg80NC1d6mlm6Nkjp6F4OwchSa5rT2lIPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JI16Y55FwxEet6Xd0vkhR49el9u+l3q82In4yLF6oN8=;
 b=cJ49maEmNrqTq6pmy6PPIeyagFDGMWur04iY1gzk/RWqnJHUjtM6s69Cr7MwIaYUWgDq/QZ5bmA8szZ/WleyMPGv0QHEe4NBWV7mRVxrOY/wEuqY9uGH8Un6K9WIMj7VCi03Om6h6XiSb1mGm0bGkBGOE1PSjl+Bklt5WQvcI3I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB8802.jpnprd01.prod.outlook.com
 (2603:1096:400:10f::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Mon, 12 May
 2025 02:36:38 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8722.027; Mon, 12 May 2025
 02:36:38 +0000
Date: Mon, 12 May 2025 11:36:38 +0900
Message-ID: <87bjryy2q1.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,	Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH] ASoC: dt-bindings: audio-graph-card2: add missing {hp/mic}-det-gpios
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
X-ClientProxiedBy: TYAPR01CA0163.jpnprd01.prod.outlook.com
 (2603:1096:404:7e::31) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB8802:EE_
X-MS-Office365-Filtering-Correlation-Id: 2324b703-ed5c-4d40-80f0-08dd90fdd241
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?q+5wyVR8GEh12Gx1BHPZ1CcokkOABtfkNDRTOzDBCxQ1h2OKIbcNwboO5new?=
 =?us-ascii?Q?4BwSwu//Z46Nt4AAXCdXLfNzhPNvU9b3J+u8fs0Q1S9aVNSphVskXQbeWrF2?=
 =?us-ascii?Q?NzB05DDhj+Fp8xngBJs9pPMefE2dJBwrb8nS9EJhFhI3kTnHEW07BUlckFKf?=
 =?us-ascii?Q?u7UaTdNt3BKDV5FYQafUL5O655vMzKGIl4Aq9RCZcCD4c+NI7UnRZ8+6/CdE?=
 =?us-ascii?Q?1/KjXk3jGqTPxHOAG1+OWjdMFNeKdbWC+csMjeU8vhcjfc7Ac0PUNVzFWK8I?=
 =?us-ascii?Q?EKOVWFtRstFSx9QcrYjz1bRMon0uGR37bcSMvhcRtsI6s36gPrDMbc+dMMTs?=
 =?us-ascii?Q?aEx9WvisQii0oblNNS2GzmfrMYmEtemGuwrRMvPrGs129BT4CxuNBIPnlFDH?=
 =?us-ascii?Q?qnU6eAXwJXDMWnYgC2CDKtTP0stZDEJ4oMS103/Tmf9pdGZoct01n//o+e83?=
 =?us-ascii?Q?QTTc47kvb0suXScYD5sARBvSGNoSQ2wh4HIxi/p8Asae3/7GigUQcVPK4Pff?=
 =?us-ascii?Q?7dV4D2UGCEHCwnyzngupg9QzknBCI3u0k0Ufl+AypOxzHfWJVLxbY8eKvnT5?=
 =?us-ascii?Q?k4GwsGdR7Amc43jHtWRc1VTVxJ6RoDyAT9XKDNo/8SmfXtaVGOiDsHym1Ef2?=
 =?us-ascii?Q?D17Los+Y0Y0NiA6QeRFy5ue/3xFg7R0vFxjiz6KsBsAkmktFnZDsV1vspbq1?=
 =?us-ascii?Q?HjDDTOY/a8CjwpGVNuustvNigmkusRCGLbdnPkGZyUY3kq1tP7zLJg4B6cEA?=
 =?us-ascii?Q?I9do11norf5J++v8ocgQWvImvcczqNlFNwUU6PNae6zmq2cml8iT00ICrjbv?=
 =?us-ascii?Q?HfSf0gV5NwbrD3sYhXoHWVXRM3jFqWzlpINtd7zkFPVAjo+Y6NpPYtFmD68Y?=
 =?us-ascii?Q?whbNDVoLqZT+TkESL4GCKSjXEBQ3t8ZPqMjp0Qq2tIZsxBSuUaa19a37pf6L?=
 =?us-ascii?Q?B5xS0R3DP9W7SQ84rN3PMjApCro2j19su4z4gagozNr9x9yKLoh8aXP5yK6O?=
 =?us-ascii?Q?fp1bfU39+yMbShuuQGYjUTCk3z4WHEA1njHGR/+CcuteTNLXi6sujm94mMyp?=
 =?us-ascii?Q?wOvXJ7RsWqjCPPaU6L2DB/2stQnHJ+TIkIjwSyRjHEmrmSvEOUITwb4kTEOQ?=
 =?us-ascii?Q?mFJcT3Mg6y6EEnibQ9Uj1ko77e4iLJXezB2+0vuXVm/o31gBNJIEsOQtW2Yu?=
 =?us-ascii?Q?bRms0CVBmGElREJOeWgaivyWSg0PnVfL063biSq0wGd1SLgth7NpO++C8ZY9?=
 =?us-ascii?Q?zEQsztK5l81EMa3GantNiLKmgKIFnlEFvI7mZ0niC16edwF2QBOtAmhMmHK4?=
 =?us-ascii?Q?h4heDwVN6KhqCLIa9krziHV1NBQa9fptYqIJvFXxyzTAYD2Xtn9/C2TCsz0a?=
 =?us-ascii?Q?6szjrvEMotMauBGKNrC7CEEzu0MgLfXsCsq5cACywvgyqVXE/1ZGop7SYlSk?=
 =?us-ascii?Q?gtkzJ2DrdIuFxWTLY9evgoX95cgHOr6afHQetKQwAmM1uMj1PWiYhQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?oWSFhS0IUkQWssSOfR4AlgeCKrY55OZ5/qrDkOISzzIKLVe5v03lAeBm0fY5?=
 =?us-ascii?Q?zCAW8P2RSYs0O2sQRhtwrltFy8adn6M4eJxzmXbjQwv0tiAVXZrTGVqFsLzl?=
 =?us-ascii?Q?Zosq0h6sm7Joj3p0650rHZocxgKZwmDGXKSwhx+o9AIfbNAw45iNTzST9tWj?=
 =?us-ascii?Q?+IoO2XTIvJKsmrP7cCdkoz6Bdpou9ivdzd+rXPVkYUeNWbLAnjVcyrIMJsBR?=
 =?us-ascii?Q?KDVKPWqvCBP7yQVphvo+ji8cfx6eQxDkvBK/YMrpQ4WGi3rh/zbqKLDNg0h2?=
 =?us-ascii?Q?eo+rGq2QwSJCZlG5qnG2aWdL7D+gqh18ee+OdlD/0Rtu9My9ThXR6A/L2h5c?=
 =?us-ascii?Q?3GJGZNxFfCFScW32H4gYXwyQc2q10COAcxcuYfRU/a8gScbbqm35Ln/nTWZ5?=
 =?us-ascii?Q?t0yj5i3ocr9WV7cJhPOxJYEt4wV5n9Ky1pD7SD6tEqFPrkU/gTtU1IMpxIvT?=
 =?us-ascii?Q?c/MXI5Ln1HGEFFRrCJnx7SA5AyY0rKJpB3CJkuLu9T8b6OcLKaHLDQYn8paI?=
 =?us-ascii?Q?mGp4x1rHnUdkd6yzdUBI8mI1lNL2yROIk3LPj13wKsnQcNGtnz/AR52zN11P?=
 =?us-ascii?Q?FcS+/jLjXxEuXNGIK+VtV5lhgOX25hK6XEM5v3h5aiagHoZh/sQPsxLWCnjV?=
 =?us-ascii?Q?HZzG3ncHezpDxz65ib57q6YMb+x655JUae+NsjAq8o0BW7Ni4UNs6g2D0BHq?=
 =?us-ascii?Q?6WUa3TRrER8nv0vyF3GZhzQwLjksXZWbtGws/18QqnlMG4eBT3JkDHVWxlC6?=
 =?us-ascii?Q?2qwKodAmbvYkFS0lr4Bu113b23RPdVXYBWS8koZjWaThX2stLiH2fOtq0pzb?=
 =?us-ascii?Q?PmcJAkzZdew/TYpVpqwegjaFHQRToIt+QL6dn8ejYeEiMX0vEWBzGrFgmtQT?=
 =?us-ascii?Q?nA8D+nehoO5rC1Ls3jJBsjnYcyNh8F11GTV0H5yz2W3IJebz5ZgsQRCkm78O?=
 =?us-ascii?Q?y+0fHFKgnKWcsQZwpL6Y7P3qK0ITZXgFfTMNUXEL7w7pQMGhpkOSf5eNZtkB?=
 =?us-ascii?Q?hr9XnPo8+3Ok8BAE2wFw+jfr/8Lra0xK4Gi5Is2hGI3FtEo3Li4p4I7OTu0j?=
 =?us-ascii?Q?U9oywXZKmEEiBGH5RSv6f6kPht3FwtXm7OpYbuCzXfYNVpcSsSIFC1GtrrCA?=
 =?us-ascii?Q?TKCmLfwnZ1LUnOUHm1zkI0KJRutKqYhO1HHF5mQXHwANWDBbjftx527dlCxW?=
 =?us-ascii?Q?67EaOrabLQ9C5P1KY3kq0nf8OfAmkOSqeSA+dLneAZyuI6KSrHVI/Oljd2Cj?=
 =?us-ascii?Q?zhfSuXv7a40+bo72Zkd0Cirbvx8BzuUeMYzaY3rhjgIM5yxPJ5I19nRByUIk?=
 =?us-ascii?Q?KaMN9XMljJwxd6J3FQQWhNBRMOOIN/sEQ0NlNSGI210vyJMumIbsFFyZXMKi?=
 =?us-ascii?Q?peNZgefpXGmvvZzDy2KRRCMgJrcbc+RCUuoXb3uB01b9nEZWdtkgb/kDlrXU?=
 =?us-ascii?Q?BRNH4KnAq+mF5tb+7ziKcdTOhsPv5dUEzTYUCim+Hun1wgKh0bDTtARTy6EF?=
 =?us-ascii?Q?Gj8UceY73lK4eD9+uqzm8QniPIwSmHGXH9t19MYuWplsUfHen9sGMR99k8ai?=
 =?us-ascii?Q?D5wVcRlYWaphn31uzPxFP9c0aj6LIepfig2e0JY9/LsMtrxF5WxwHqtk1G8Y?=
 =?us-ascii?Q?8BGi0hYPrPZPFsxhXTK013k=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2324b703-ed5c-4d40-80f0-08dd90fdd241
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 02:36:38.6672
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BzLOLa2K2hw3w36hP654VVlUHU4f7XSeuEl3natd0SVpImsALUuUXf3x9kHjxhV22q+7ythpMqooP1E9wVzlL/DTd5gty7+5Ou/bjB4Ngh5qeou+GDHpau5s4Ngd/nYS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8802

The yaml has "hp-det-gpios" property, but Audio-Graph-Card2 can handle
"hp-det-gpio", "mic-det-gpios", "mic-det-gpio" too.
Add these.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 .../devicetree/bindings/sound/audio-graph-card2.yaml        | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/audio-graph-card2.yaml b/Documentation/devicetree/bindings/sound/audio-graph-card2.yaml
index 94588353f852a..77c21733f9e63 100644
--- a/Documentation/devicetree/bindings/sound/audio-graph-card2.yaml
+++ b/Documentation/devicetree/bindings/sound/audio-graph-card2.yaml
@@ -39,6 +39,12 @@ properties:
     description: Codec to Codec node
   hp-det-gpios:
     $ref: audio-graph.yaml#/properties/hp-det-gpios
+  hp-det-gpio:
+    $ref: audio-graph.yaml#/properties/hp-det-gpio
+  mic-det-gpios:
+    $ref: audio-graph.yaml#/properties/mic-det-gpios
+  mic-det-gpio:
+    $ref: audio-graph.yaml#/properties/mic-det-gpio
   widgets:
     $ref: audio-graph.yaml#/properties/widgets
 
-- 
2.43.0

