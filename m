Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010041.outbound.protection.outlook.com [52.101.84.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 817F23570B2;
	Mon,  2 Feb 2026 10:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770028606; cv=fail; b=t2z5HepC5urhy2EEbz3FY4HQ/6NbUrfW9v5LuX9i/XJSxayabsVNVP14Kfzu+IkBLAtw9its5esjXPWlGoAIVE6t7xMO2n4y1ZMmRISNUFQd/fHOBw+dRloikzkLv2g6gmtaWso4XMTYZaFPt7nCx3adTlmSj6j3oApjM7b/TpE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770028606; c=relaxed/simple;
	bh=vYxiCQaqlEe3YJL2tQvYIa7D3DE1uZsxLaZ5Ty2xlug=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=P0laf90ccD2YcnLKdfyOGj0RnO2WkI3yL+TZVACKt2G1mxBNNQ/rTejEO9SRxdWYnG4b/5suLDgo27sHJC6AZGJpWgrPOUh0OIV1rD0PQHCKtyDmLrEgscFcnCtT4+EjcNrvkRaeoYc/F5xbqTG6hsmplke6QUeN6FCnVT4sHYA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Jkbu/uC1; arc=fail smtp.client-ip=52.101.84.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Jkbu/uC1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PwnfPd4FpKmAVQSXBp7uqmvzgr6jz4VJammH6VSCPZkWgliStZso10IdRjGBLKjtfI6pZQD16/Jdl5DKYh6k79wNa5i1EXpKsrX+jJvNyPCqG3dOZ1QVrMfpZODEEhnOw4rWrf1lv2AkcS2vtKjml5M7jpRtLMI1uXOvg3wI9fCDz7pbRh9djd+CAJ91LwPSAObvmIlL37i2dWdluU1zFztOG2EXgc1ihzUbYBRhy6tblpDJ9155M4fHMN7k5Z1CVv4naGE23vAJVv+FDErz0CuaEaYgVGW3mNFnROi6Sj/lHHDXIimqerRQZi4b/ZLLvOoDd+E1NeC1dFtCpjyVyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+jbcNarFbT+o/uE/qYm9Kkqr/+Bd4MI0W2Qw/sWzpLo=;
 b=o4HKcGmrkIjsP72Hr1XdZ72vcL1aQagJnxHkk7CA1djAdQ0ANz+x8ntXZSx+VKFsxzAlTe+zasVsxUx4VP+PwUH/d2wbkIXpg6rrSzGQ4x8NobTrXBR3AruKaDcP2Uj8lMHu26ZnOsnb2QY2Mwq65hv44cWMgPNjP14qQWoTAOfZNCsTbt8ubOZV5HlVndBvh8cbvsLhmO5mvQzoUrTsaLFwWplyrAy0ZTp+huAdiHhaWkNc0taFbgBAIUGHV39LJuyOXOs2ThAranG5op2KT3Jm9Eh5dXHdYVc7Sy2fTLX+xn2gttXnVGcq+FuHwRvcRWNKk4ptDOxDBDcGnWFO0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+jbcNarFbT+o/uE/qYm9Kkqr/+Bd4MI0W2Qw/sWzpLo=;
 b=Jkbu/uC1JiA/+N/Zo/cpBIMh3a+yftKFkM1PjqGr38NSAI38IeVqSmzy66KcpKpTbPS8WTrbOsueXcKV3Bu9LbIUOoyuK1/x2vf2xgL3cmH52mHwjtrS/QTiMmL1gXmg6I0zgImcJP7aSrSCbkjvTICiKrOs5iwwPkNbDFknBAWjeqmaBC2JqQ7MRqNRBzoufMfqQaHbkgb2yt4IBAjz8znX+24E4JgxkN8EC4BylcYTclIObcOfYCk6CMy+JwYg/TwauujPnFeYNEKZ/76ZYHzLaOf2RiWvzGMbT+SNbygOUQmKEa+CYiXt8BSb1Cyplcp1Avxh2+JHj/SFGc2ttQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com (2603:10a6:20b:3ef::22)
 by PAWPR04MB10008.eurprd04.prod.outlook.com (2603:10a6:102:38b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 10:36:42 +0000
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc]) by AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc%5]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 10:36:42 +0000
From: Chancel Liu <chancel.liu@nxp.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	shengjiu.wang@gmail.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] ASoC: dt-bindings: fsl_rpmsg: Add compatible string for i.MX94
Date: Mon,  2 Feb 2026 19:36:17 +0900
Message-ID: <20260202103618.13929-2-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260202103618.13929-1-chancel.liu@nxp.com>
References: <20260202103618.13929-1-chancel.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0047.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2bd::11) To AM9PR04MB8353.eurprd04.prod.outlook.com
 (2603:10a6:20b:3ef::22)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8353:EE_|PAWPR04MB10008:EE_
X-MS-Office365-Filtering-Correlation-Id: e4ff8396-ae63-4d4d-1fd5-08de6246f430
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|19092799006|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7xnnUubc6JdegOhsUo/BpD2J5/HpVJR6xYk5JVOK60+aE7vQCRtjoR/rSNsz?=
 =?us-ascii?Q?LzfzXZadGif3PuX7SdTeS3urDdai0+x8FPeVeuIBSsogEm1B//SGsYggCPA9?=
 =?us-ascii?Q?OZgfCH71G+b6pZaR57mTc/FUgJLhNC0EqhpJyFrujzGGoFnFE921ofxrt6a0?=
 =?us-ascii?Q?XklbYJbxZpilSvc5APkPQDkZBqEj+jQcWtO6x8rfQdbI/D/8HMMsRZcZ6JPD?=
 =?us-ascii?Q?lA6zFLX/O3Ex44ODT/viAP0yMZ8Xj9DP1bLmq005S7Cfn037LccKAzx/rqK7?=
 =?us-ascii?Q?0bfVCP74Eo2sIjF81nnPWmruSSC4hfBqPzwtXU4PPcQHT8dgcZERn1GfuATI?=
 =?us-ascii?Q?ciJ6H7o9TLyCtltjzonrWfcUZ7SSqPwEzRHsg0mNBzqiFIsifAGf7/tF7a5n?=
 =?us-ascii?Q?lbAqJINzTheXWgS49sHc9SA9nEKu/TiYpUERIFEqDfMTYWzA7UShUrEdtIfG?=
 =?us-ascii?Q?5qIHMZQPElcWfh1Xg4WqBt2cgCIZfCTSe9VfjqabJlOxH1usCH0NsHvSrMom?=
 =?us-ascii?Q?oy1qIkCVJFR0t3k1QX5dr4ElqdplT/cTYHDrBm9Kk1L/kNTx3aO24NvD+cmI?=
 =?us-ascii?Q?b83mu8dNUziGQbU60LFsGvbS4hYFHD73FXa1TKB0eVd+j1QfffiVvKBoRLGp?=
 =?us-ascii?Q?eiJZSH8jWDUHsR6AagUAeDT5wLqV/Y+HNKek2D0CImznOiYEIS1BdsrogB1n?=
 =?us-ascii?Q?4qLs+h/nrlzp306igAfCYE3FXTKr0IdkHwFBG9kv55lFeqNuR7R9ryZwTqno?=
 =?us-ascii?Q?ang/0/Q9OZ6q6mb/BBaCeP6cQDRPGAOujwhM6oH/grWMWACTUU/BnfkKktqV?=
 =?us-ascii?Q?8YoeJZ06iOObx9dNIj7Kc+dcC7oRGvjSlIcZ+gLVhnntM9trE2+M3f3xlXu6?=
 =?us-ascii?Q?ZBgk1HP7VxsMlsNoCqRF/TZcD9ebIIGFRX1lEX0i19IODm/LmYKgaLE4R6pD?=
 =?us-ascii?Q?kjZ9NHUjKGPi6Fb9UNg1l6KUaKA+AF3Q7asmMcG/qBhSKzFRi6cK/zCXMWZZ?=
 =?us-ascii?Q?RE0DHSqKae2ONmQowgYXyz1Wk0q5TQ2bv/XBS3GOk8khMjNo2DMBEOX7dzei?=
 =?us-ascii?Q?8GWtVz3Rl5OGIhKhXzPPtBF1Meik0ZhC+22p+jYO3DeTZvLXlBx8Rjxug5r2?=
 =?us-ascii?Q?wTc0+Oy/vcRZ1p2eDcraxxYenUC2NzEjmNaEFuEmET67pnMLa2PVdotpFYYm?=
 =?us-ascii?Q?hxunStYX93GPBThqn8URcDdKuSnVDqsEXpFoF9mdCH7ElA+JhpRAjx+vPSj9?=
 =?us-ascii?Q?0442tBAJJPlETjmlvP7T01d5rQbS+huZ2VFOt/spFVK2HnViQXcnE9y3V+1Z?=
 =?us-ascii?Q?XAHhP54nyyLLw76asohSR+UmvSFsFEfW9V5y/sczGKKyG2dCWvzByFunevjj?=
 =?us-ascii?Q?GLms2OrtMRMPp74eZg+JRrI+SLjuEVpBAmbE/CliyS7EMB7d3lgmMHuLvK4t?=
 =?us-ascii?Q?8Wfc5wPfs6AP2TOc7JOH9ua+X+JMtK6VQXPArmw6Z7Tn8wyyITIWd8ghVBOy?=
 =?us-ascii?Q?x+wP8MBZ7pWKAdWXJq5ofAEEimG8J5wiS/KfKI0CsMEV9ZQi99TaG3d7wCEx?=
 =?us-ascii?Q?+KXVC2hIdC/ksVS3ijPJ2XS8czIzqiePcpavuhdMzrpCjfsEKCj43XLfUZIw?=
 =?us-ascii?Q?NgYmBbDFe3Q6VkMlEzilEas=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8353.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(19092799006)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?l2J87fBc9YUCjw/uuxvYx7MPo9MGfyNqDYC8Nc5REGsJrFkfHwkVJL41s4ux?=
 =?us-ascii?Q?yhoIHRNQRAfGBbDbpK7UuR+UAoYWvHmW/VuX7qGYP8JiEp+dF0vB3+bl6dbo?=
 =?us-ascii?Q?i553LS7P4eSwOgv+Vrelxg1iaOQ5Fk6SPnaMyP02lcI1qIor45Um8vrTzD/F?=
 =?us-ascii?Q?Wr1WexeCFim2SF00gLIwtzo71VsOapYYRWZd3NIW7xjhEX/JPNj3z0tlMo8g?=
 =?us-ascii?Q?fNeYLo7N+3RnXZNfoSU5NQf1+NVz1vad+/lDdem8U+xuKb+dJdNzv+KJsjN+?=
 =?us-ascii?Q?wfVy01jZsFScQI/oP5qk4aVmN5O+W5TTctntf/fTH217ObqOBZftnQeZV0Tq?=
 =?us-ascii?Q?56FFy9aM2EoGIzUg7Idtv0nHWhOjy1WL561kbccrcHeeeAqaNq0Vo1GwJs0R?=
 =?us-ascii?Q?Bc62C8Fi317EsDmYAD5zwjIJuDOqVid6Vd4iHhUy4RCh61ZPX+v1AtKc9dqr?=
 =?us-ascii?Q?x3TSuzohglzNM0IMg5VmNSIu5s/T+n2ubeAoVZRuuQjKPmjDBSAzT48AT8Kl?=
 =?us-ascii?Q?cFprpguJFeQHwpUd8WppzkkH1dajASTTqkn2gTpU3aIhqa+OE3P+1H6e/iPA?=
 =?us-ascii?Q?odgZNX3Uy6ta8lVraErYGtzvCKBJfDNswzbq+77F5nDuNA/WvWo+YBmEiL1u?=
 =?us-ascii?Q?nSK4aJthijWywJxTU0j1Hu3mCk3s1o7WBwXYDtuLTNmxadj82dbaA0quLzQO?=
 =?us-ascii?Q?xSOsDDLEg6bZ6XPz7YDiricvta6UwYrW7OLwP7NYzDGyQ8HpWyhSdzj2UGgq?=
 =?us-ascii?Q?tVgULwtxyrlx0Au5mz72T2sw5rEDabgoPpf2ARRaxX1ztwBuVJFjjDFb/14H?=
 =?us-ascii?Q?9zsZQPGl6zuiAWCmDr/Z2WPt7CvXrxdtROdkCkg8jXyyvT5zJOZ+nE8j/hdb?=
 =?us-ascii?Q?BOv96NnlMT6kfl7cpJWobgU9JrMVcxa22Q+MNel2cFoUYtiTcbMQnNgI1h/U?=
 =?us-ascii?Q?kH6MA3xNaLak10fnQN0Wj/vfA8dIl1k+a2/84SYzb7UIqFxRRk3yXqPIlm3l?=
 =?us-ascii?Q?nEl19vQKBCMWOW/4S6uyNxHtABNZpYRK/gu+FgmQY9GnLtmd1pr+mkiRIpKO?=
 =?us-ascii?Q?4dZa/oDXuQ5oXXxeN4O6nRZ+NrxkYpYo9pGAJon+E5OSkjNJhGkr/gmwXpah?=
 =?us-ascii?Q?zMF5T6xoz5JFFyww4w4/iHAdz9Eu01tGbhBJBCb4uWBRG3QI1Duq9XPd3MgZ?=
 =?us-ascii?Q?2GAD0V9X9voBvDs+hb6im9njW2PHiEAnCtr/ykasf0dWjLlIVlJ7gT2jLDA0?=
 =?us-ascii?Q?VochgCv4+pgOU7pXeQgz8nysNpTy48UuUzNhJ6TwxlP/4W/NwFgVj5C5vJqf?=
 =?us-ascii?Q?rFe4TA00Tmh48r+JJigY2doVGw1WCRRnN/MNKj0lQoxs8YWgTOEYY5I+pio3?=
 =?us-ascii?Q?/WTl2UXmJTMjk32zDbSFZWJcF+xypMfiV4vaEN1kzHqAF2UNWQEs2dNwtxQ6?=
 =?us-ascii?Q?S+rXuTqfIlbnq2p+hI61piWjFw2bxMv3S/TN2CKrXRkJSaX719baUglMnb6M?=
 =?us-ascii?Q?TGDwpxTmAwAMCQ7k6IE8SAwW9OrqM0vvdCqRnirGkgi+ReLmTieg6DZE4Hza?=
 =?us-ascii?Q?UHylr5objE71Tjjhss54Sbi1KVR3+nCMj0LDXBBfEBDiELyHSnCBwI/gTRQ6?=
 =?us-ascii?Q?EhF3paoZRaKN23pFA8RBkUYFBGvR97HldWGu/gC3aCCggrVAcu1LZNbd7TXb?=
 =?us-ascii?Q?P63sFovKgEohLfad78bkUkLv9T8tvBtGBeAwm3rJoHE8ysKUK1XIKH5GHIvk?=
 =?us-ascii?Q?Jc71TJeiQA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4ff8396-ae63-4d4d-1fd5-08de6246f430
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8353.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 10:36:42.1352
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gfWqgX0MZhthjB/k5pqoBD/bF6JfIG9K/SfET18nPNdZ+2HBtlQ9BoYd7oUuxw1m7bzsf+uVqfhS89NodH/5ZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB10008

Add compatible string "fsl,imx94-rpmsg-audio" for i.MX94 platform,
which is backward compatible with i.MX95. Set it to fall back to
"fsl,imx95-rpmsg-audio".

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 .../devicetree/bindings/sound/fsl,rpmsg.yaml  | 21 ++++++++++++-------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml b/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml
index 3d5d435c765b..48cd5fbeb8af 100644
--- a/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml
+++ b/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml
@@ -22,14 +22,19 @@ allOf:
 
 properties:
   compatible:
-    enum:
-      - fsl,imx7ulp-rpmsg-audio
-      - fsl,imx8mn-rpmsg-audio
-      - fsl,imx8mm-rpmsg-audio
-      - fsl,imx8mp-rpmsg-audio
-      - fsl,imx8ulp-rpmsg-audio
-      - fsl,imx93-rpmsg-audio
-      - fsl,imx95-rpmsg-audio
+    oneOf:
+      - enum:
+          - fsl,imx7ulp-rpmsg-audio
+          - fsl,imx8mn-rpmsg-audio
+          - fsl,imx8mm-rpmsg-audio
+          - fsl,imx8mp-rpmsg-audio
+          - fsl,imx8ulp-rpmsg-audio
+          - fsl,imx93-rpmsg-audio
+          - fsl,imx95-rpmsg-audio
+      - items:
+          - enum:
+              - fsl,imx94-rpmsg-audio
+          - const: fsl,imx95-rpmsg-audio
 
   clocks:
     items:
-- 
2.50.1

