Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013068.outbound.protection.outlook.com [40.107.162.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B29402D0C92;
	Fri,  6 Feb 2026 08:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770367364; cv=fail; b=AiUuoIupP3h3FxmzXigA9a+Bbn1kNwAKKvvw2nSrEXU40KUF6NMlkdDqjeEo41+K8OOOEYH9SdMiEIH0gnJEWxi0Ru46UT9OJQNq+BbH5S8FbFV0m4p2Q9dkexh6gCx63slvONxvWbTvC5NSCiakGTYPJh0ceZiEMyFUIGr1sIY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770367364; c=relaxed/simple;
	bh=AG9ePy32+IIkQcYkfKuA//Ldw7t6L0LSZxMMOBFCEqQ=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=OU3XAbr0iW7V40lgrWrZLgow6ektACFkXorPkQnbe7RyPy/lNDLqmLPYGq6L9uVG7WXYtqV4dIu7DaFs8gaZqkmNDHtp/3zaUwFCJnlOv3YscYYhJOYIYwf787boWcXwfiZ2puWZXreWuQcrSA4cpPZMOL53whoOiCN0f4b9Cqs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=BhXK6Uzy; arc=fail smtp.client-ip=40.107.162.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="BhXK6Uzy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hyyclp96+OOBgWLReDZEipXb5N8mxNq3zlKkvxQBNqWmlJPkdS76WwKc/IJea6gGIjSvJIOiuJ2AV0fSROwzIUuBmupbGhXaf8+tLsvfHkuYXMIu5+RNYQmLRa32VrODiu1MNUzd8TIMmRiL7+g9N/5EuKDSjg+WUnIygsn6tn72h25GSWF4PR+zx12SFAeJGMvveBO+5eIRr8efJvwxEBJZG9L8S1iaQgn1Y4NXEyP6/KDL2Y/Pmri7UkBK7+dRVEGST6buqzErE412ZCBYKwDTS17ZQy5PIBpuS8ohHHbsJvvh+Yld2aTmlnkTRAIwabH86iGwzMsXDkVIFHyqtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DHJv4om29nDL23nkXqH2NWPtyudzSU8ysG1DZUcWGlM=;
 b=SQFAhnYe4N0RMsgK2kE4CSJ+1HgyyDRUjG5Hf1vS2srPwUWbeXotwlvcPfcsF1vPha8gWirHQmyPzAywc4pVQ+6oYP/vb1DCVLUsp1ESpQQ9kLcog16qO+qRq1QsVB310IChRL7e8vpdNBJSZ9vkk9QUgfxRW4GRiTx6e2yGMjW+mp4jd7xD9darcpB8HQOaY2APyjG9tCkg4Js3piy7R/alYdxt4iY9QYQSBFzxeKtby/hFlNmC3MoGDQNQzvXgK1G+whsv6MChYJyaM84uLY615zq4Em516/yuR18F1A7TvT189BxhywEdztP+jx8n/L7o8BpXC6FEQv5rn7x/8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DHJv4om29nDL23nkXqH2NWPtyudzSU8ysG1DZUcWGlM=;
 b=BhXK6UzyOfbcC8zK3+rPFawTdzhWMJt5KqdbrkY1hj7FGmB6X/0wdDaFRrZqY1i88RLU7csmUp+XZz7CtPXpfLUNGTkKEdxiIP9X7zztP7wQtnoBUs7/WkUeZACjT/tAwE1fYd6bjknnVAtUDRz5nZgNi9bFsvqby7FWM1lJ5XRVUgYUjdeM9N4bKWd0SylXpaur7AIvBfEnAk+dxYb/KsEeTTBvQ+cAuBUmmMlcX8iak2QOBKm8TggJIfDxcZPsqD1MOALGh9EoZEr3Q9G/RBFfavbfLwkUOw3VUbV5uIPCVW5BBzLmQ+u0eEY63vJKqLI7Tda06TsBcU3IWnnIHg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB7055.eurprd04.prod.outlook.com (2603:10a6:800:123::21)
 by VI0PR04MB11503.eurprd04.prod.outlook.com (2603:10a6:800:2c7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Fri, 6 Feb
 2026 08:42:40 +0000
Received: from VI1PR04MB7055.eurprd04.prod.outlook.com
 ([fe80::d6ab:1538:d868:bf8]) by VI1PR04MB7055.eurprd04.prod.outlook.com
 ([fe80::d6ab:1538:d868:bf8%7]) with mapi id 15.20.9564.014; Fri, 6 Feb 2026
 08:42:40 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] ASoC: fsl: add bitcount and timestamp controls
Date: Fri,  6 Feb 2026 16:43:32 +0800
Message-Id: <20260206084334.483404-1-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5PR01CA0107.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d1::10) To VI1PR04MB7055.eurprd04.prod.outlook.com
 (2603:10a6:800:123::21)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB7055:EE_|VI0PR04MB11503:EE_
X-MS-Office365-Filtering-Correlation-Id: bc5c512b-3c5b-4f41-2f69-08de655bafbd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|7416014|52116014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lRckedDfie46Y+JE/bei52/Ac6vBYcScd+PJxjGwU3Q+zPLpaIGfC/xU7GcW?=
 =?us-ascii?Q?D9AItrtcYdIuro2dVnDfrFZfOUbZ4tPNQpVFcVSd4TjeYONl4pc3qMPbxqTe?=
 =?us-ascii?Q?lv0erz3+ASeSjP2UAVvGBX3ofDedAedcykd2IVgA51LxYnByic0opVihhZxx?=
 =?us-ascii?Q?PhzLmOpVjty+zh+wtbQ6cW6fi0ZO622T9fMM7T1esbhtYZx/hA8XkMkMmQNg?=
 =?us-ascii?Q?4Lvr/eSSEBjONiky1ug26bjPLd8PeqOs05fQexgiurFqAFxCDsoHRVFZ3ZBB?=
 =?us-ascii?Q?7gIpOHbTFIQeXdscKfG3vP1Gr7C+A4u5VeoBq9ewThQOsIyIwvvEj0CqnmwJ?=
 =?us-ascii?Q?iTP4Z1ylYadpOLHkZmts6uB859vq2zyxN7npZ07Ni6Pee2cvw3+rFK6bZNBH?=
 =?us-ascii?Q?iRuh2zyDrsV2jAAHHzzq0Z8Dki+xfF2VJ4monJOET2zsj4yu1XicikGH1R8a?=
 =?us-ascii?Q?1H4fahk9jfTnNEcw5TwJVkX2552OiFr/Xq0Qs2610E7/2GKs9HfAyzojZcPe?=
 =?us-ascii?Q?FxPy+1iUVqmCTZTMS8co7oTKjdMyYzq+Qlkw+r7uCadsEHx4QH38zI1ej9Bv?=
 =?us-ascii?Q?Yq+gh3JsipJq8dpBZJHZ4GCzjMHaCY/wBOM/USOSq6R7kGSAVYdcCniGZBCW?=
 =?us-ascii?Q?FzonnbioLQdswUhW7Sw05O84upC0NilhEkP+QTkqWQKgTQZjYFO3ZNUoRfOa?=
 =?us-ascii?Q?Sw7YNIzcBCn8pwvyWwXxgFeqnPMbxB4MSfyWJoj0mS5MISu/pxFwY13EJaIy?=
 =?us-ascii?Q?we2i9De8qDNYcuEqDrcH3TB2ReyJJtOP5tk3Zc6QGevdU8Fo+TT31SKIdmuc?=
 =?us-ascii?Q?sVlxMd3e6bxp54+e5mnGZeykTL/KTFuaOZWq+ThRRMBaETL42Ii+oN6Sp4ec?=
 =?us-ascii?Q?/tTIieWNnr6SMT3znXnc9Hr9I7QND2+s8bKwOECwcQnm4OaS3HbDcGlIgfOX?=
 =?us-ascii?Q?6uWl2L1DmUp2xD4+XYGDiM5LalVhFBkNbXRCHCJ4F2461+WZuHKnGBhiNzEw?=
 =?us-ascii?Q?3Qd4zvz0FDeUkX5fSp36yqabuKLDFwL5uEmJWVaUkU16Zylgj3MYiVMJ92lr?=
 =?us-ascii?Q?Y9/wKUJJc9WUo7mFhJC7ER878Oy2PRV6xqm/Av2l6krdWkjWSfa2Yv2xRS2k?=
 =?us-ascii?Q?noZBanxuMlE8clx+PpC35xklDM9EwlB8u2dTLccw/dwPnAchz+mMhDHrncNw?=
 =?us-ascii?Q?imO1KG9LwrEiLazsTorn4cnk8rRHivGfkpEoWAdZlS2Ky3/dxtRIsQHpPlO0?=
 =?us-ascii?Q?mc2mGI8jFFDepYXTSidLMHdkxHBLjoR6oNcJkBv0hOxIPC/7xOT8UGoWBBKI?=
 =?us-ascii?Q?N8UrYe4JA8tAShIBr6E96IOuorQP2Xrm7HPF5o4jT71JzkdWkldXYn/y/1s+?=
 =?us-ascii?Q?52I4kscv1IrD2V6AaPtSJm4NnlDP52kK7WPxU/PDpcSsoEkY8pg1WDGudEpL?=
 =?us-ascii?Q?bJw9fzi8c6uRwHKhSjvRiBOA6zxP2cDpyzy8cpEWhPm9x69WA+R0uEVFjjUw?=
 =?us-ascii?Q?CZAQTq2GJKDu8557/WOsKdkyQS62SIOBYqZ0YwOCTt/7sKcLisFaPBzigXq7?=
 =?us-ascii?Q?IH+kQcaqGopX9VXLLw954zgeUOMbUhdsilZJLPrY1NNl3QDXv1HnZ9cpvwEl?=
 =?us-ascii?Q?ITr3aPcTVeJXZi5ubuN5qdJh69ovPVx/UzHYQRc+VR2d?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7055.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(7416014)(52116014)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nWtHzD6reCVnJ6Qq6IgdntN5XSeCRhSSUkAY0kWCoCIy+cg6xjgxHeVrtcBe?=
 =?us-ascii?Q?o14i4QF0u5upj9y0KCXquNb4Vhu+kvRG8tLx3fab80dUK0iDA/R4lO8TatDH?=
 =?us-ascii?Q?oyRXizNYa/cUcobD9IvHrndOaqzSvk8sPOqERXa0J1m+BtVxAKmmDkJ+VTcz?=
 =?us-ascii?Q?Cv65SSummZuDbailJUITYtCIjk6xPQhTXH6cwwrhJNqGzxdt6td7ekS6W+QW?=
 =?us-ascii?Q?Ri3C/Y3BcFW1ZUlNi1YI16VpVbzPajxytkbM2fwKNaS2iPqHgOzgebqpG9/l?=
 =?us-ascii?Q?p7iiJB+ORWLKgsRV2ed8DU6C1cKeXjujx3gK/ud75S9BtnyMiW8bl1SWt1ue?=
 =?us-ascii?Q?d+o+rCOxpoquWM/+Zd/U1YuOmJ3D84kxOq9VaGt19BZt0kni7XjV0CJBZWL9?=
 =?us-ascii?Q?FEV7yLBYpRFXtUY+fP2TEJyw5R1HokSHtz2cyVyof/mdhJxfuJ78dYwrJ6Fi?=
 =?us-ascii?Q?Cv0b0sTHi9Sr6wSCRAkiPDhWQJgkYviEIB3Bscf1yWbZUF5N8ZoQ9iUDbGvz?=
 =?us-ascii?Q?r0utA9wulhPsupdkjhEvfKdtPsCeXaqoY5CZkjVJohk/1gRzNSq5jHklVxDM?=
 =?us-ascii?Q?Gfl1w8QpfvtZ+8cnojIxUXdS2OxQabk6AFpKB+692KN5NqSkibCemb5X702G?=
 =?us-ascii?Q?hlKY3x7qCydd2DO+8DmMfoEtK97MyUYciKS/BfYsV6n2+vLdsbILCmalQSms?=
 =?us-ascii?Q?PbH8Q4X4TqCPkeXozptMQ9MWwmrvwUdX5/6QKSgn2MmUZ0UWs7W2pENEh5J3?=
 =?us-ascii?Q?JiBelKAa0GafjOFB+OqPUtOoihEeR3oKu/662UxbuAEwDCbdLegObJerp5tT?=
 =?us-ascii?Q?R5nX6PjjGq8k5l2nJzSQe3njgI59Bl42QQWIKOViXF96nWVo1jJR36u7jW6S?=
 =?us-ascii?Q?1aZSQcaayB5b5fhFj2bXNRV5DwNnSQRmk5KOak4sHfp8QSD9pRsrlMHME8tB?=
 =?us-ascii?Q?r++rHrpoHsWp8W3+/NClwSP/ahA1Qj9t7lxzkxBmsLK2DIP5gaSTfmd2vV6q?=
 =?us-ascii?Q?qdzUb/DQG5Teq4CgnGCnEzyTvD8H8/7FMZ2si2FxZaUkzRdSUDCoQFL+ToG+?=
 =?us-ascii?Q?XoOV2Y8fLq7/M2mvwpIY//3+4XxFH723ow7u7CIMTwodVxC0cKso6v//YlT5?=
 =?us-ascii?Q?NhitFKeRhz79GaXrceMlOoYMnhqGFZ86YyeBzGS4CZN1Rg53XQsu4NjycMGq?=
 =?us-ascii?Q?OoMaZ0bfZdIMQ49twzoEDFdpt7q6FyMimfe7FRvvYilqPHFceWbOmOSHbZe1?=
 =?us-ascii?Q?nj8yu4e5FmeWYwCKglwX4yKaoKLwg6ceFedjlsF8zPHvKsIpQUA8UsZv+RbX?=
 =?us-ascii?Q?DRl37TZnIFISiDdpe5LgJWLoBTrlSTN81D6kRUKiISUPv4ug61tCbrvu9JFr?=
 =?us-ascii?Q?LgXZ6nLlv5j+Nz/Q9IAvXYXdNcuIZFaGXJD1bjVig6TsIBJWUrhiP4S11bX3?=
 =?us-ascii?Q?8ru8Qdfn5JwdCVzws+nUbqsdoTD4gVkgMP3PPuqgMfAiom7/BNKHLDv9NCKV?=
 =?us-ascii?Q?LknyYKUSV/wXRNYh3c5y9OS1B9/n2ICXdqx5EtK4/hLlXSfrm3nY17bvTKho?=
 =?us-ascii?Q?iHttb9d+9lvgImhJCP2JLgz57879WFyq7dT4EsvJE/auyz0reoqKm/JFY4Gq?=
 =?us-ascii?Q?DWhXe80FpGNYwA2aYc4QC/4qmLA/ngQlBe/jQREZJl6uyPMMzQO+Y/olyHKg?=
 =?us-ascii?Q?RJDSQvrQlfBjZLebE1vLkPHVLhak44cv3wbpuop0K6/aTbiGtj8CdMDCldGT?=
 =?us-ascii?Q?DK96ZrTp3Q=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc5c512b-3c5b-4f41-2f69-08de655bafbd
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7055.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 08:42:40.1333
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SnFaYm1jz/ryJ+zviRbi3MenMyTfnuvqWdrfMuYJyPdHTvk+FPvmyZhGushQtpvPW26EOIfoytlMln2sE38eHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11503

The SAI and XCVR have the timestamp counters and bit counters, which can
be used by software to track the progress of the transmitter and receiver.
They can also be used to calculate the relative frequency of the bit clock
against the bus interface clock.

Shengjiu Wang (2):
  ASoC: fsl_sai: add bitcount and timestamp controls
  ASoC: fsl_xcvr: add bitcount and timestamp controls

 sound/soc/fsl/fsl_sai.c  | 52 +++++++++++++++++++++++++++++++++++++
 sound/soc/fsl/fsl_xcvr.c | 56 ++++++++++++++++++++++++++++++++++++++++
 sound/soc/fsl/fsl_xcvr.h | 10 +++++++
 3 files changed, 118 insertions(+)

-- 
2.34.1

