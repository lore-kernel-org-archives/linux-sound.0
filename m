Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010028.outbound.protection.outlook.com [52.101.228.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39A10199931
	for <linux-sound@vger.kernel.org>; Thu, 28 Aug 2025 02:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756347723; cv=fail; b=LCnoNtFsK8QQ8XRz2TEg1W0H4aX0NNFbOLKLIozO5cFSj/e6df3fZZGwQjouY+0vLsS2Br2gc3vQy2iyK6otrP6dYDBx/hwFNPkzD5bt8g4XAkedVGSj4T8Tq8gfaoHIrr4jeN2TqRCKyJAP8wZUPWOWH1s15r4Mz1iHFC53yJQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756347723; c=relaxed/simple;
	bh=jt7s1BuH176q+N52kMY6nuLteBME5WR80TmHt/UhopA=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=BK2QTReurnkhX3GRhpjCAMtJXqJcfAglAoYlStvs5pWgKJ+KfDW9+Hv/GKlVMYLSjdlbrjeT6/BGOJIws0oG12sM/aR0s+m+UULhuRrpkn/5W2+a4Z6Hc0uY/UoWWAnvfrFu381s1tKLvC8ICAocGDhVVCkj/7jgWLhILOIj0Pc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=iJrVeBRJ; arc=fail smtp.client-ip=52.101.228.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="iJrVeBRJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L31iZM4MJBVQsCcZCGzQJsVdmb4lDt3tikiw3f95m+IPlxzsJSDjtdFcZmUrlL73Fa/5LhGhy/f2yGpyb1CkV2gLyYJcmfYjFUbIbJOVJUmfsDM+nsh59XItN9ShO7Vgu1RPiGvTeqe0UTxujdEGFYUCVb1Kpns5sB/+6wFzZeDlu4EmZ0Uw4rtszMjXz66MsRK88nFFbMVupPc0MbdgbfPrCSraMJo4pD2hXvMQJCIXVAzbx2e4eV71w/dpin2Z9R9aUmFQU6scckcqExFiBW/slkFembUnXbd0XrrN/s7Pg11YMDrFyrWRsdLT2xFcAmQgY8valqPkKVmUqPcbhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v0AanYGu9ekXKT0eSO6DJNpLjcky2mxLzajJg89Zm/M=;
 b=docZ+ZZVUSeiY1oz6xaNKbh9RX98Ni+FnCaAFg8CAJh2S6xSUMrF5p5iGYxw3urOxONl09KVFh1DfiE+UGK8FOHfNJde8k8fHU+hYWVO+YfuXE3FvhjKgDl/N3CjY97FA9JU1F72kW83ZJV9oPhJoIndOgwaXXRqH1iCwmxhglBLBixcqmjZQ18EZpaOz+EC2en1e1miS1BsgZQf0Anfo3cBJRnPJPYdzCtN3as8Key/PEHhf/MSHoMlSGwPU/Vx7090EQy8vxgoTToukH6X1oGTjf+AfRFijDeg3DZEtp+ztq7W3yyzeeI99vHRo7UHOCEPzPLFiO+fGG5WeSqpoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v0AanYGu9ekXKT0eSO6DJNpLjcky2mxLzajJg89Zm/M=;
 b=iJrVeBRJ1DDSGRZTN7438ssVh4i5dDmfLtifMGFmo/lvLI9qdhPTuAXkhzWIotoaM/IDOHDz6Kzies1QvHWiQQIWjMI8PJdtDuED3PYjSNfANCKfI5D9Gump8mfZ1B0Dwh/I9BN1xnmnbW1vy9LAAHMk1Dkj9otakpJJ24PKQuw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB12429.jpnprd01.prod.outlook.com
 (2603:1096:405:100::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.15; Thu, 28 Aug
 2025 02:21:57 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.9073.010; Thu, 28 Aug 2025
 02:21:57 +0000
Message-ID: <87ecswuqwr.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 3/4] ASoC: renesas: msiof: cleanup status clear method
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87iki8uqxt.wl-kuninori.morimoto.gx@renesas.com>
References: <87iki8uqxt.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 28 Aug 2025 02:21:57 +0000
X-ClientProxiedBy: TYCP286CA0018.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:263::9) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB12429:EE_
X-MS-Office365-Filtering-Correlation-Id: b37d28a6-d811-4351-d269-08dde5d9a9d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sx+BuRJB54wPtlHGjmsxL2QRpRfSGCIDB/pYWYgwV65r24axp2Vntuddw2g6?=
 =?us-ascii?Q?uGBGPWevIX3nWzgUL6j+D9wgwH0ljf3hWsrWGGFS0n3RfPTjkpfpoCgcIzrX?=
 =?us-ascii?Q?4Tr1xFI1+QsKSlX6YQlLnVGaABZYN01yXm/EffyCXmR9Nh6lsFkEhrp/wnf6?=
 =?us-ascii?Q?qTh50LQwDaP92GKaGVm4cY740mjtPs6YWNKiD8P/82TU6qUnkn9zUkcg3pyg?=
 =?us-ascii?Q?BfGE3slsVUkCu2IOQi6NvA11BLvrXnpZZD5eekXglEinxzOEDW59KYxfygy7?=
 =?us-ascii?Q?32nkz4goJegQbKO0RoVIAyzcIAdOJsq3t5pOV3P4wZ0BKe7VxexQigqNm1DG?=
 =?us-ascii?Q?yy8INjYpTrqSRnEn0+5t9IfWsFv718KT2NAChu1X6NQzqqksZdlFGGkp1m4I?=
 =?us-ascii?Q?+HO3uKAUJlHeI7WriE/CJCM+j1NLYoxCY21W3qa3ePQY5fp0XV/tfvIHgWK0?=
 =?us-ascii?Q?tiPsmFBzZ1xxRS3+orPHKZnm5UCnbToZfIOU/OYKegg7CqHTsw1QqOIbUhRo?=
 =?us-ascii?Q?SGQBrhBkRx+SQlfZRB0ivKF3Vzr6FHtJZZyv+ZFxpT7tN8SIRPm2ZgBffn7t?=
 =?us-ascii?Q?Xf8y33RPfzm7m9kXsdVzpaBdUCZCVy5UA0g7f9p/up+j83tQQ1DwhlN8wm09?=
 =?us-ascii?Q?XUyExgMbC8VBtOLEFoUT5bpsNAaUmuoJcLItQcUKJD51Rgc5c04+cF7VXyu3?=
 =?us-ascii?Q?TFmjG5gsA5zqANrH6VN8RLzI8UsMBzPYhu43B2yqi8BRRw07U+umtTQW3wOS?=
 =?us-ascii?Q?KnIx6bAYyS1vjh5SNX7wdtMNIXiJCmA8k7L3zdKV1VSGwkdC2ypos3BmB0Wi?=
 =?us-ascii?Q?/wiYwe/0l+73sChQEsjECh8A1ll6SClx5wlVIrdC/6TBxIxZAsEEUzItzRtM?=
 =?us-ascii?Q?fenlSO1Wjuqluft/vOmDfO7y/bnOCXoYbEKUEyBjkCXc/GQPaNLzax/dVve2?=
 =?us-ascii?Q?ExiYNDYo/Z/YhfpI174XmBZ3uDkPr+1aGrAjBjCfILyedOwBfjR2RzMhAwFN?=
 =?us-ascii?Q?doyGkE10yIUop8Pr6v/9e5oJ4lHxuz4WkPXmw0ZmMKhIljuHeDGGnV8XDg6A?=
 =?us-ascii?Q?LAvaEBHAevVG9eRzalEaXWgubZHmTw3tmHA1CgFa82/70LssAYTW8Fk+kUXY?=
 =?us-ascii?Q?8zPTTcLw26KOdaL4xSDIbf+vC6tPnCHNJ20ZHCJYbxPMgM6YG6R0FumAjrBi?=
 =?us-ascii?Q?oZp3haHY+YX80HsoNoPpUSD+h9TV5Hpz/UHfqnbWUYE9JyLRRX04mNs+woif?=
 =?us-ascii?Q?c1L4MwnhxZrdS6X/ACkNhDnSs85dN/oE+i/GGOTd/oYgKLbifgqg9QalzA62?=
 =?us-ascii?Q?Upqzlbf28Xl8aZAdBpeYGmn7wuFox26oKsqMvgZ95s0oRF6Hre7cm6A6DLQB?=
 =?us-ascii?Q?jrwyeO2RDcoH8sszW5JitpmUfp/TzG3Hqwlu5RnHGEpBxGoQy1HpPDR2Bj71?=
 =?us-ascii?Q?lhUXSOkqrjXY6HT+NPtinO2r+dmIhT6rCoT5NtOEasvUVn2DVXAB+A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bFgKADbx86JNmCTWpXD8Ym4aySrGy9a62HgBE01oCONIG2F6LfaTw8qMZdaC?=
 =?us-ascii?Q?dYRRbfrXRhm7sdaCuBgL/70//swpxnQvl/Zq/QUh3rnWtTW0oGp4sR7SNKTH?=
 =?us-ascii?Q?nKn54cAdG4s6HQm1I/g8pL47ZmTTVhWpn3OLYliWEY59RQ3PkR5B28IeHQHd?=
 =?us-ascii?Q?OXCUrYVojttY/rYK+nEae8ydj6/zFbftWxXtJekVWXHXrPtq0Sez6ScpFuRP?=
 =?us-ascii?Q?Bpu/Y1UvBSp39H35NcKT3tkoXmAGIy8F2WgII/6PQKDoMBCExa4dJ2kaq4Av?=
 =?us-ascii?Q?jr8Z8+wr7e8JB1Uhe2iAGjbiupKJtZUw6NyfpXYHkYj/7rFu9Z3fZ04R7vA4?=
 =?us-ascii?Q?DlTafgwbGu+RRo05/cqhNJihZhJF+6rEzJYEvo2mDDthLukYJY2iVmmNGsUC?=
 =?us-ascii?Q?LKfJ0tPMellyqW8VGG/4kcIsdIlIXYTaPlZ0W+i8IXbLWC1l1vsjlVP4mjOj?=
 =?us-ascii?Q?C1bNoCe2ONc+M4ie2HXYR4ikUkFIBdki/oK1//0Tx186qrGnrnLxPcnTR+y+?=
 =?us-ascii?Q?UXtUD3+3B/iHUZJCuMN4hfxZgvrfO5zMKZlOr+y/qpxLtplKPDtlxQkMyciS?=
 =?us-ascii?Q?ey5Nv79sebiRhYe+iANnsMH728NfhnBGRotbcyx+tpvq/OPc7/YbFtqYk7RX?=
 =?us-ascii?Q?yvqjupEiF7QinoFrsoJLUTujoimbMilMmQ4x5k8WVfeCeQKPVE391a5rU4DI?=
 =?us-ascii?Q?eZungGTbyi1XoU4ltzDgAaXqc9RxCXoTCQrJQXkgfbLNvtEo9wH+Cw8kw2YL?=
 =?us-ascii?Q?4RXFP+OmQlLBeyZbqygU+7ALmtfI6b/8Vo8VX4OcfHi4ZwYVfYGKOYIRWhR7?=
 =?us-ascii?Q?0H3H32frr1ttKviflB41Ut/w/nl7CWE443eQqc6Bk13KyVgZbyq3QWO4hLwZ?=
 =?us-ascii?Q?vma8tw8qH7EloSZTiHmqnGYfkeV2+it37qmK9EWT3kQ7rpBMLxf5bfeWeWkD?=
 =?us-ascii?Q?xXV0gD82KVRV6h2fREMnNMCblMVOQhsDvFPmXQWgG270r7QGG6m0zDNBJVNw?=
 =?us-ascii?Q?4QKDT8RaKujMGUCQOgZqeeW59XcuCE+GX+5usSfd9mB6PBoobLNRckmj608w?=
 =?us-ascii?Q?qIdyuGxWZY42fODKliXAysu8QJy/9N7fwLjsI7qjBA+ytdnnMq28KCzy19Wu?=
 =?us-ascii?Q?0AZuo5WUwpe4dlcQVPXi8LtPyHPNYPDBHiKFj0KBYxVlrKyJaJw9Quf8doWa?=
 =?us-ascii?Q?NCjo5IfDvTYpD9WB8f/i1EVROw0gtGin6wD5uR5RML86iV9KxA59POdO6pxG?=
 =?us-ascii?Q?j/oWrKbAQEin0elzVUdLZQ3K6xi+wxtvjLmSi3BQtsDB/qWefcjMkHHVn2CJ?=
 =?us-ascii?Q?Vgv4dI8MIFG+IKwWVDxHXzacooPEey4fZ6kZiVk7Ua2J5oDCCS9JQrD76N6V?=
 =?us-ascii?Q?UJjJoAJhirTvjkcfZJM4EbbXi3OfjL6/krLUOBZzXco7VaeUdLUdXC6kHgZd?=
 =?us-ascii?Q?w4Xk6sGtpBw8LXXzXPfXpaw1pyJ/FFmqB+kdD7g14TAYnEcVLuEnz2Ies3WZ?=
 =?us-ascii?Q?08MEf7jtQMyhkfWcFZblBqn1qibkMUylKQuLVZsDvqJ3D+/PjUH9tEyrzCpp?=
 =?us-ascii?Q?8FiGzLyv7Hjed/bHPKciEchd4MwSCohEp3+UXyHEEILUq2f+MGsyco2Bq1hg?=
 =?us-ascii?Q?yyi5ccVSWfBop247lEJfPnY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b37d28a6-d811-4351-d269-08dde5d9a9d3
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 02:21:57.7946
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yqZort77hOiZp9S9aqCCYPIKZzSQny0ASY42u5qJT1wYEc+5s52q0l9I7iA/c+Rp975EIUvmKTkEeFW/zSu1P5mkkbjH8Kon8T9l35BXIZEwdFkg145A+C+3Scwx0KWs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12429

Current MSIOF driver clear status 1) after starting HW, and 2) clear all
status. But it should be 1') before starting HW, 2') clear necessary
status only. Cleanup it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/renesas/rcar/msiof.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/sound/soc/renesas/rcar/msiof.c b/sound/soc/renesas/rcar/msiof.c
index 56bf64e55ba3..90ca3357392e 100644
--- a/sound/soc/renesas/rcar/msiof.c
+++ b/sound/soc/renesas/rcar/msiof.c
@@ -37,7 +37,6 @@
 /* SISTR */
 #define SISTR_ERR_TX	(SISTR_TFSERR | SISTR_TFOVF | SISTR_TFUDF)
 #define SISTR_ERR_RX	(SISTR_RFSERR | SISTR_RFOVF | SISTR_RFUDF)
-#define SISTR_ERR	(SISTR_ERR_TX | SISTR_ERR_RX)
 
 /*
  * The data on memory in 24bit case is located at <right> side
@@ -80,7 +79,6 @@ struct msiof_priv {
 #define msiof_is_play(substream)	((substream)->stream == SNDRV_PCM_STREAM_PLAYBACK)
 #define msiof_read(priv, reg)		ioread32((priv)->base + reg)
 #define msiof_write(priv, reg, val)	iowrite32(val, (priv)->base + reg)
-#define msiof_status_clear(priv)	msiof_write(priv, SISTR, SISTR_ERR)
 
 static int msiof_update(struct msiof_priv *priv, u32 reg, u32 mask, u32 val)
 {
@@ -174,6 +172,13 @@ static int msiof_hw_start(struct snd_soc_component *component,
 		val = SIIER_RDREQE | SIIER_RDMAE | SISTR_ERR_RX;
 	msiof_update(priv, SIIER, val, val);
 
+	/* clear status */
+	if (is_play)
+		val = SISTR_ERR_TX;
+	else
+		val = SISTR_ERR_RX;
+	msiof_update(priv, SISTR, val, val);
+
 	/* SICTR */
 	if (is_play)
 		val = SICTR_TXE | SICTR_TEDG;
@@ -181,8 +186,6 @@ static int msiof_hw_start(struct snd_soc_component *component,
 		val = SICTR_RXE | SICTR_REDG;
 	msiof_update_and_wait(priv, SICTR, val, val, val);
 
-	msiof_status_clear(priv);
-
 	/* Start DMAC */
 	snd_dmaengine_pcm_trigger(substream, cmd);
 
@@ -439,7 +442,7 @@ static irqreturn_t msiof_interrupt(int irq, void *data)
 	spin_lock(&priv->lock);
 
 	sistr = msiof_read(priv, SISTR);
-	msiof_status_clear(priv);
+	msiof_write(priv, SISTR, SISTR_ERR_TX | SISTR_ERR_RX);
 
 	spin_unlock(&priv->lock);
 
-- 
2.43.0

