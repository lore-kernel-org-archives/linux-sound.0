Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013000.outbound.protection.outlook.com [52.101.83.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 512CB301489;
	Mon, 29 Dec 2025 11:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767007550; cv=fail; b=q25ER3TL7QJQCkk4IGVsYcrW4sQnTRSfZ9v8O29rt0EDOrXYHMefimAKtSDo6UadbEzB0VJZfJCbo+L9LXKyGK9tCuV1o9hSG4y4zSQpLstjJqeqJzO5bRoSPy1EF86igbkiqjOQKYNMFIW3TOOsTI0668+BzUqh91bHkcS0o4Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767007550; c=relaxed/simple;
	bh=hOf2MwObJXZOXMv89cv0Se2aEIVwlP7oFee2Xt/JQgw=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IJW4LaUfJDaHHdjiuGMor/XoZ0JgFPndvEZ2jRubRKlDm04Ik0l0Xg2umUXemWOWiGhn9wpqGNj70mP7y+Qq6TDa1u+455MwEYID7q+xFiDAlwLhd8MhL7GTHFjd7hkG4ozcmy+PXsRMc7yBpMxb3OyxT4uF2Afa+ld9Tfvy4T0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=kICl3lkV; arc=fail smtp.client-ip=52.101.83.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="kICl3lkV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SEYcaPXoonbQklE7BmAik5eOdK3KxQ6ncNa3du1GJ7xZIQ8+VvvGJXDvfeZbjhvBBMfBpLDB9EhtdCWDxzimIE6U6bb73EClYUVYsTvjpTBuCG9l+gIpw+QXzOgy12tsNc5oCcLqDKfz1SsspqGQWe2wePuqzPRxF8s07S4ZiLuA6uSgppyS3sndDdDXOiJVCn0DOcIRgSSJEF5hbzM9x+KepBmq7tsreUF2cpeXEBtVQM7ofcDgWnF1loGC5KaC0DxzLpOKzMqWoKb9t/lNgbjMs45hsR+6EbSwshuu0aF3k/j11Y9e24aeMs8MfjJsYZwPs8zwNvYa3AEej2MVYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZE52Fsr8mBbZtYleaLYjJy4TTlLEFLk6KnbZe1P5dPA=;
 b=XTyUQR2kDnbbsKRgjkMeOyQuyhT4ZAbMS9wq8fk6hR/fa7VRiCNj3yxpwYTR7sNGhSM6CaquEr7vY9dCQ6CSBL1tvTj0B/RhjhBcyj4dM86VqTUfJcS7ZUA2335XyKtU91ZdstuKlK3mEHOhfBcFdoM4sc4u+T19NeCaCGI2pY2ZEt8EQPbuJ94YXLv4XOP/+XTCaisVouV52gEY9dm2Ar3Y5LuSU0cXi+oCwxcfnkxZICNpbYT44tdvZBhfSdhswEXPITVOIrGS584qutc5lIidWJrUuPJD6KbiEfs/idw470ZgKp/6HonS5zwCAXSx4NRQb0GMpcRNg8Gt7JPYqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZE52Fsr8mBbZtYleaLYjJy4TTlLEFLk6KnbZe1P5dPA=;
 b=kICl3lkVaPyFVp5fzTUjolqO5qWEt8GTt/vikO9wTO3G2eQ82u2XoivRjEKCw53chO7F+0t054cGo/kGCQRF2gvRlIqnruN9hWlimGbTpZaS+1KSzeWSj9nRfgT6uXHzbkhhsplxe62ZNnyixj2xlIIaXQQxuVdvaiPEWXGzpomtuLemw203McholnlTw6JMjRGE62p81m+qOOzPCwZtFSSoHgj0jzEYJrQJoAM227mLA3+Hg0bIK74vwgbnkO7TaSBmgLKrGtBlEvdqN6nE5X+U8j5aVe55lC4lapix5PearFpDt359zORJa/VNXXFTRusj5l0eppLqNh2GjpYBig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by DU4PR04MB10959.eurprd04.prod.outlook.com (2603:10a6:10:586::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Mon, 29 Dec
 2025 11:23:17 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b%7]) with mapi id 15.20.9456.013; Mon, 29 Dec 2025
 11:23:17 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: broonie@kernel.org,
	kuninori.morimoto.gx@renesas.com,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 1/2] ASoC: dt-bindings: simple-card: add 'hp-pin-name-headphone' property
Date: Mon, 29 Dec 2025 19:18:38 +0800
Message-Id: <20251229111839.4009517-2-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20251229111839.4009517-1-shengjiu.wang@nxp.com>
References: <20251229111839.4009517-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0039.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::16) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|DU4PR04MB10959:EE_
X-MS-Office365-Filtering-Correlation-Id: c8e9e56c-2d6c-4748-f0e3-08de46cca9dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|366016|376014|19092799006|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?USuwBweWZ16c286W3FYvXXkh0tsWP/CVUHbvNtXB/MGPZrR3g+KdXUAc6aq4?=
 =?us-ascii?Q?O2uh3JSGpE0upm2P1CzAMj+W5+ORTs6PKqg59GnjYYAgEZ1gWZs4lQgPfuTY?=
 =?us-ascii?Q?g6wftjP0FupZM0QZTSCzqoKRalKar/uRLOCzd+BjdkbvY+QL1ZnSrgSwXv6i?=
 =?us-ascii?Q?9pUQXnZVJIBGbBb/aEoPSN0/XuO9KxY7j+FfnWtyJ7yevaLYtTSwenfHFSGr?=
 =?us-ascii?Q?TieX2J48XSFafw1hUSzWq1k4EgmrbdnDCkDTcXrmV+KFi8NgzmpWcNTdKzdR?=
 =?us-ascii?Q?4cLY81IC4Vx4yd2lHtze99vlIQsb2DfmoMOcNr6zvO00m/WvX3bUhQit6i/l?=
 =?us-ascii?Q?QZrfBLM77izJLPo9Y3dmEbmlLt0+C2+KKDPHPPFb06NQoa+3J1Rek6KrEb5c?=
 =?us-ascii?Q?wnMqkMjsLnt9fANinCHwYgU2itmDpQijqbedf4rCnEiOlAp/6Z5gwATKrcz1?=
 =?us-ascii?Q?4cTVGzF6O3mRxcXSPWsdcZ+s+EfZcUapc4a43oSLPKZRd3bg7Ih7NY/KZivw?=
 =?us-ascii?Q?r27X1xqrQGoCzDu+QxfAziZhf6ld+9Fmh06r+O60BYe9SEAdT4l5G+uREdKo?=
 =?us-ascii?Q?9Buo+WUNfPuzH6UtPUT5mXxY3vSDQQ4vEmbMtkmLZ4dnZQcSFujh1AxzX6Z4?=
 =?us-ascii?Q?j5lmtP98V+fahz7IC4xb13jCh0qlquaL45hSh2VMIJzcY1VhZbU5LD371fpc?=
 =?us-ascii?Q?EqmYBIgRk7SuVE3dQ8flHIArm3lmfmyoxtdc1XogOCAYcqCM56V5RTgIcygH?=
 =?us-ascii?Q?YSQQ/e/1/7UXYXxYDaEXG30QLUsG1EaMpSbAaCJshBia+MLMdfTLpljG+1vv?=
 =?us-ascii?Q?9Jhl1SL4khs6/J3zItb7xbZzJuLaR/nqSA2CyE1MFkNsqGdH5bNMkeRAUELK?=
 =?us-ascii?Q?V/cCua93JdLxF3cK6TUL8BSNGD71xjjgVhcIDwR8lmVbyozG61TP8OCFd9m6?=
 =?us-ascii?Q?uyttzzOPQtfnCSasIEqg6FSpkz7+nnBX17He6tTP2y2naQFlEchAAxoifT0j?=
 =?us-ascii?Q?y160RTYyMwtGiCxxV/k7jVLBSyH8a5Hu8tnUjm36zPxv9ZZQnNWusC/Mg/9U?=
 =?us-ascii?Q?vYDpaGp/NSOj/kJLIzuiYvOuH1cCCO8eZL4gjjTjQBYPFlc4dW/x9Qbz6C/X?=
 =?us-ascii?Q?0bk94e8qOypkThYdswUoVPLfLf9pZkLXfedMpkCbbQ44VUxCqDC4LISkz/5M?=
 =?us-ascii?Q?3U67peeKr3VS4193QnEv/AlqmvcI6unwq9CzrONkcRUZVIIhoC1tDsq4hQIm?=
 =?us-ascii?Q?FtamO5ToCsTdSRthq70VIe5geefjNxyb+dszRZ3rbh3UHlnr4BC2JzmmrSXS?=
 =?us-ascii?Q?WW9AkLvIkIlWyBta1obgIMKejDCOE0PayTzn3fUfNxnjCn37FY8pG6A2Z5NT?=
 =?us-ascii?Q?cnPbxSTgabSSYqH9UPcZY//M+3fxy5jBa7TN7rUY0EPdLZ+rTaM7dBICDYXo?=
 =?us-ascii?Q?mlx31GHOwiwgc4ZpVwk3R42O2dgWyeWos3AQdLReenlrq0fNwjcd4B6jevfP?=
 =?us-ascii?Q?kYw/3Gv2TAtKYnSJSmU2LKfJpiP0sL5BZDGIVfHxV8lluYnfFI8MXyC5/A?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(366016)(376014)(19092799006)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ixXIKiq6RzYndiijxsS1ZgZCwBfE8JGfVSXpfrdkQMmYjiFRz7uBLNyS7+w2?=
 =?us-ascii?Q?haEccQBgzCCSvYOiPYE80LOd8awHLiX3qoPySvOztrrYgQ6eUr1WOgVAkXxe?=
 =?us-ascii?Q?AxUTNc4DX/A1TiDBsKqf+RhqnuP5wWwtrwU6Bnf0YBu6cCPjvw1kF/0fCMgu?=
 =?us-ascii?Q?JknL/4T76C87I3d/OCKYdF8V82ovcleLkFe5mfLGsPMMcipZvp5nqDJ1ahMX?=
 =?us-ascii?Q?7UAQ7tzkvZxTHNTO5aIDC1dPitL97OojZj5si+bXeosOSpIoLwQEs2eq6WJE?=
 =?us-ascii?Q?9itiBoiEoHYbHzFVI93vCJV9VbNymrvTB650Z6h2W9bCp/Gs03oUdDERbUNp?=
 =?us-ascii?Q?QmPchQy81pdpdzIMCftIBCIkz5vGRNm/YK03BENe56V5yp9TsofwnFT4g6CB?=
 =?us-ascii?Q?E4Jh/RZZeLBrsZJlhCvhMLvojE/UIMmPyO3tY0jbjGx8KYxVKDaPvwrqBn1w?=
 =?us-ascii?Q?hhwFgXZj03ADHcuqrMjd/YfZYx3bBWJFwd0S6/pd76RBD2bi3Ht9OBnJIz2Z?=
 =?us-ascii?Q?989yROK9/UTrRg3DFbAJ05GfmQrIXkvTJYVTyKm6eI4snmiBxWFNSJaYYFss?=
 =?us-ascii?Q?7NcIS808vwER8OVgp+xt7p1GFPDUl9rEcFS7ljyo7GqowGXq7b3Xmmq8l302?=
 =?us-ascii?Q?3yonBMjyrvmc0fHMTnGNI8/Zy6OogoRauuoj+0eQL2XlWtSS5q7TzmW2TjIh?=
 =?us-ascii?Q?pmtWkL97S2MIWXVUYQ9P2xBnAKwtZUVdFDoVvu5Vx1hPHjy+IngfMr+MrbEb?=
 =?us-ascii?Q?uysjAri2l6PIxaJrEG7+rWKhrv4iK6xlbVLN+R07x2F6n2/uoEWlk/rBuoP9?=
 =?us-ascii?Q?Mrac9POs8K529scFtYUMQrA6ri+1Jkubvup6pbv6GZqKP5QwRppD8aAiVyJy?=
 =?us-ascii?Q?Tm/Bs6oCZX+1pj4X1T54xzKnEVwcR/X6ezd1+bWEdL5i40P5j0iJXduQE50n?=
 =?us-ascii?Q?YojQ266nCAfddj0Hz0hWSp6++ltmuhEUCBsGnLPuIm/0Go4YmCBJzMkzb2Qi?=
 =?us-ascii?Q?brAl1fOzXlp+YcYxIvwQxwZ1/nhCWUpkMGw1bQ+l+R3Bqxo12LsizxvlDvvA?=
 =?us-ascii?Q?88XTTWWSlYWt+spP/p4q9Gb2rHvNpbUZBu7qSAtwlvqU/UPpz+Y9LQ36KPEn?=
 =?us-ascii?Q?3qBrLQqHlYLyajjEzBnWGyD1OAbM/taN0eQjEsmDtHOWj2lglqEiuAMt2qlw?=
 =?us-ascii?Q?qro+CA3pz12moGTdHEZcKxjozjvguOjQSjlcbxwiiZO/sZf4ToIaWYakUzP5?=
 =?us-ascii?Q?I/qWVikDLCGWmnNMiSpaMiYdae5rk9HOw+MlDWpVzD2/RqyxT0YdDvkMihpa?=
 =?us-ascii?Q?u5UeWf0tv2fxHM1souL0MJtSztF3d7x6LnmWTwghWgVOyp6zJqfOoAwJiWzF?=
 =?us-ascii?Q?EBX7cayiXuytk8VFbIiqJFRmQAiaP8mcvXz6j48oCr9OSpGoes2RmOM7G1Vr?=
 =?us-ascii?Q?tN+butYSROIP32aqPTy9/NAPBdi2cSQvsTgnFKuWM+02O7rawg88VReu9GHI?=
 =?us-ascii?Q?GsdQ172cFegpnK7kYc03PltClqUEIxuAEQJTNAoErFfBo5/AKI9u9Bq7w46O?=
 =?us-ascii?Q?QJ2YiZXonVgo1zI2YcS8RiW3r0g1cQfDcGFbZMEMCK+mjUmQ7nvTHCWpS8Z4?=
 =?us-ascii?Q?or60JJsT/PahsGWWDeh0SihAY+uFx0Ksd72wqIN5dravYF+EinyKRYTCzl58?=
 =?us-ascii?Q?7XV5+MW7BdJQwNmKEz+7SfQMEE/u04ByJqgq0plEBPGrSna1dSE1APzO5uvr?=
 =?us-ascii?Q?E3GSMdujrw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8e9e56c-2d6c-4748-f0e3-08de46cca9dd
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2025 11:23:17.3308
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: llvu5vjgpcmuTT3tdvJokSoj31qHSv5kRUd962hONQ64AI+DMiWB2OqDU+ZLgmzAvKgL7PdAbutaXxfXpTR8jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10959

The 'Headphones Jack' name used in current simple-card and audio-graph
card driver can't be recognized by user space service daemon like
pulseaudio and pipewire, which only recognize the 'Headphone Jack',
so add 'hp-pin-name-headphone' property for this case and it won't block
original use cases for 'Headphones Jack'

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 Documentation/devicetree/bindings/sound/audio-graph-card2.yaml | 3 +++
 Documentation/devicetree/bindings/sound/audio-graph.yaml       | 3 +++
 Documentation/devicetree/bindings/sound/simple-card.yaml       | 3 +++
 3 files changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/audio-graph-card2.yaml b/Documentation/devicetree/bindings/sound/audio-graph-card2.yaml
index 40eb1d7d6cf1..803e0a960d2e 100644
--- a/Documentation/devicetree/bindings/sound/audio-graph-card2.yaml
+++ b/Documentation/devicetree/bindings/sound/audio-graph-card2.yaml
@@ -39,6 +39,9 @@ properties:
     $ref: audio-graph.yaml#/properties/mic-det-gpios
   widgets:
     $ref: audio-graph.yaml#/properties/widgets
+  hp-pin-name-headphone:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: Specify 'Headphone' as headphone pin name.
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/sound/audio-graph.yaml b/Documentation/devicetree/bindings/sound/audio-graph.yaml
index 9899d9d1958d..8cb2be122a6c 100644
--- a/Documentation/devicetree/bindings/sound/audio-graph.yaml
+++ b/Documentation/devicetree/bindings/sound/audio-graph.yaml
@@ -46,6 +46,9 @@ properties:
     maxItems: 1
   mic-det-gpios:
     maxItems: 1
+  hp-pin-name-headphone:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: Specify 'Headphone' as headphone pin name.
 
 required:
   - dais
diff --git a/Documentation/devicetree/bindings/sound/simple-card.yaml b/Documentation/devicetree/bindings/sound/simple-card.yaml
index 533d0a1da56e..9453089dc5f2 100644
--- a/Documentation/devicetree/bindings/sound/simple-card.yaml
+++ b/Documentation/devicetree/bindings/sound/simple-card.yaml
@@ -271,6 +271,9 @@ patternProperties:
         maxItems: 1
       mic-det-gpios:
         maxItems: 1
+      hp-pin-name-headphone:
+        $ref: /schemas/types.yaml#/definitions/flag
+        description: Specify 'Headphone' as headphone pin name.
 
     patternProperties:
       "^cpu(-[0-9]+)?$":
-- 
2.34.1

