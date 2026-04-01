Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011048.outbound.protection.outlook.com [52.101.65.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D194D3CCA1A;
	Wed,  1 Apr 2026 09:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775036482; cv=fail; b=hvNsCum6BTZ1AX8Wix9ZrSQ30+a8N+NI2HYUN/B8y2AuUJWvahznuiUcYKZl2qScuWI52W9mhlJB0rA3q+fb7pEKQh2CfPJ74/WZBGlLrlRjNOxxO5AokXx6Vub37zdoTqMD0ifHrfN1OWnQ00ciD1EtSIaTbfc6jwcCX1i2Vnk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775036482; c=relaxed/simple;
	bh=bc0YvWcAF8bR32JzvTYcwUyh5BvvQ3EAJW56frLTC5M=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YTvul9myAQCKZCfhSI5dTNpe2wp3+Tlj0L/XQBs1PMas5FgGlzYIK87I/d4QbNcey9sL3w6kD7B5Tm+vRM4AaRFtU0jMAutpU7x7CuFIedYLSBL6gjnso2FwQuNv0LRDIY8+oeJJxm55U0Ay9HiZ5rNElD1xen5lPNqblaCc7k0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Zwl2Z8mo; arc=fail smtp.client-ip=52.101.65.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Zwl2Z8mo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RUlg3QclsBdugZMFdBtd5qitFCOJn88+WW6BfuB3OYSfHHb8rzaitTRIC3fMndL5RugdfzqE8ljsA2NfIq5cfYnCi0tgY2rJT65nHv/w9eFPxcyI1W0HEDWgAUUtthTRawfJeQmDwIHnYvBNjzog6EPm3xG1PSnHRwz5CdBQJqb8CRsTDb9NB6AgLbOEJzWOnN5TTM0dcR8RZ1vxZ/afypT7govkhrVaqcGmk1ZK5aH793mZXZNTwao+Y/9BuRnXk/wk1HkXlfihGHJpIlb6RYySNUGbovS/e59bXRwLCfqA0L81gET5coSylJEg1hdj0CAi2vUnLad8rmaQpDpstQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y04GCk7Dn5EiZCT7lizHtIqx7R1Rt2FBz+pto40UiW0=;
 b=N7bgmk+PvVwJ1mruCiBErTBAcPKJD3b4DYruCOsWeGMNXMi/4MhH8cqUy5cm/am0L0e6rQZN75uULzk2iyJJfwL4n4l85hc3hiKyCZI017ved7orvEG1kNM47MRTYdslKGheXXVshy/eUZfPnLE5HsTZHb6ittYLksB03qK+56b+WVLLYIsQY8/CNex7lcXH9yLTaqWOW4D+3cW9/2IBKC8R9qW+HReV5mREpSlY61wHZeBgIYD/G4k1SMn0MK8unVmePcUyo5Rd/VoBO7WG+jqoGtPLFlMNHnJEqdF37KUeDpjWW/y9xS395tq6Me1qfYWSCINT6KIkd6Y4okbvxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y04GCk7Dn5EiZCT7lizHtIqx7R1Rt2FBz+pto40UiW0=;
 b=Zwl2Z8mohebS6C/eh0u5i19o5TXJ6bR2RiNWepJQELsqMKFvPFBY1u3oEd8iRrjEscqa0Li6kmadj6eDEpMYIgA+b6WdYJ/UZ5wNhF0WNkbP5arGqz9ytwwobp3NzmB1ocp/Fj3Sfu88owWUP4RMVlaloi9bafp3VZ822gVy3KYHXnHmH1e7JviCXABBRh0bdJ7/d6SWu2rgn7P4Lw+xZvpPBOXlYJDa/2mlY2mbre7CGfyWKq03oPCuMfWlZ60svGdp4Hmy2YECEiWSXFvH+DRpgOd5mjfs87+Dgj5tBK9AdYgHscRyyMBQ8fcFfaxTwQQ4fhVjPHTUC4WRkiNf4Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by AM9PR04MB8241.eurprd04.prod.outlook.com (2603:10a6:20b:3e4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Wed, 1 Apr
 2026 09:41:17 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b%4]) with mapi id 15.20.9769.016; Wed, 1 Apr 2026
 09:41:14 +0000
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
Subject: [PATCH v2 03/11] ASoC: fsl_micfil: Fix event generation in hwvad_put_init_mode()
Date: Wed,  1 Apr 2026 17:42:18 +0800
Message-Id: <20260401094226.2900532-4-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260401094226.2900532-1-shengjiu.wang@nxp.com>
References: <20260401094226.2900532-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0029.apcprd02.prod.outlook.com
 (2603:1096:4:195::6) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|AM9PR04MB8241:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ac9e8d2-3b77-4f4d-9cef-08de8fd2cf5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|19092799006|366016|1800799024|18002099003|56012099003|22082099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	JRh+KL0rI1n+Zm6PJ0ZsapTGyQOVJL45AMb6hyy9GpMi6NLLgmwt/DIE3J2pynou9IEFrjksSGMNMvnx3fFJU8IFxAEHGTvMk9SKm3AK6coBZM+OQ+4essgm+QrBZWU7n4oUbzZ3KPGsNrAkuxjyjdDrLFMitTGAWMi1D1T28ltlrKIeJB7ubiyqQLDCBfHOlI5LeshAupj/PH9yp96HdiDxXBCGwyjFuBZ8xlvfkjvumbTonUiogd2TM9JgWFSBiZvL5LfRiSCv0M7wjn4+Sw+pMoFyjmMDnYGX6lPXdRhzy/umD5oI2lDtElJDTlE9y4rkPQdp/GYDOey8dy2FquJqeaGbGtyXx/ggAZGYHKOQEdWZZNE8dXK3epwY2j9vcGzit3+memzAHQJhEZrgYeuSFxMJ8wCBPAuqoA6Ltj2laDTUUH9BCsERXrJboIjUpetc2L8NYueb769BPCSGqDY8fjdyXRk5ryx2dmCEyIZjGcA8I8LnrfvhJmbYqTCsv6/TTyyOLWvst+Bwog1ugNsvfc5CiKvYLp2RA0Lk9YcCjY4j7gxx9tPI0eXbYRtSDhSpmWbNw6nJYF/lKb9NEfp28ZJ3SlWjkebfATKxPkglj+X6qswFoSrZNqXdtlHO3pRtkSjTDqFR7Ydoicx5DYrH20Tkvw4sUbFajq3/5O4Plz0g3POD8fcWOnSbjBQDofR0wTb8Dvtr7IC7SZyzrMaMkiStZoHNPcCMtas3aZAttMQ3YM+gcW07XehtzPxYlIrd3u2h7gmrjl3te3wZ/m30WPn4ycbBPAyL3ZdCfMQkmj7GBHOmfZFRcR+idBiF
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(19092799006)(366016)(1800799024)(18002099003)(56012099003)(22082099003)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gcYLlZX+D1savFWdP3hBh9AZrWa1j0cRZvFP4AupW4kd+ZgES4BOgv0Wq17V?=
 =?us-ascii?Q?suYpJYNpwYrc8jNyUUCbaW2FmlaoneGMfIdDGMyATuBvjyu8Mjto1DC8Xwgn?=
 =?us-ascii?Q?4pLxJsSz7dU+uYVmaO2ltHZmsWPVdyhpF8xHNF8PLwZlObqMkPfDWd2Dok3Y?=
 =?us-ascii?Q?FTihUtHTNPeZJ1pPOW0rXLTkRwIatGf/Etc1JqMjDSTF5zLSD1cxQPWsJ6ud?=
 =?us-ascii?Q?VMtc7NOJNpEIURLFKcd0f7rGmS+wVItpWLnoXV3B/4bNgeYZ7TABGGd5H5TV?=
 =?us-ascii?Q?qyUFBWzsAdPMjXJ0/00Tcf6LKgAO5UtqFfebekDWCPwoc8yFU9ZzCUv+fuLv?=
 =?us-ascii?Q?H/zyBOiW5mMHEZQxLkIUH3MahDKn0eJIGX+BykiF9SzgalQHJalwnzI7Jzcs?=
 =?us-ascii?Q?Ol3C4iJWLooZpiiIKdhGaqJ3/vrzb8Et/cJn6nnHfVZK3+iAl74rk22hxWP4?=
 =?us-ascii?Q?0s7/8ZIHW4ZmG0xtUuG3BwdA6F8fncIryQXll7HXxeGhbefDRKQB+PDztZvL?=
 =?us-ascii?Q?gz7qjB8vdL66UiowD5bcBW8U+ipkBbkLQ+jV7J9105wzn6xo39WK3u90ONJQ?=
 =?us-ascii?Q?uuO2mSueZem56s0PBKsnkiYslnDR/BEJDgkJRZEPFP3MlZVwcd1pkqudUBAS?=
 =?us-ascii?Q?q4uTxxPZtFFqKkwO4KPpGV8k4H23vlfHL/j63fiCqd1kHXTaSbnnHT6DNPO7?=
 =?us-ascii?Q?iAZxPp9x3Q7vxngaD+S/uLDfPJvasOuUjFWniaUzQ1gn8zkVs/jtri8gPAeG?=
 =?us-ascii?Q?1TNSV4UePwS8bVvIM9mwMQg1KMgOWuCID3ZlxypV7/0wps4FIZTSE3kFvUyq?=
 =?us-ascii?Q?6dIs1U+lys2msJohRBIO/znqhEr4VXYqN3Sc93IYCYQOOtVJgoEL3dgyJK/5?=
 =?us-ascii?Q?2UGUKyC/+FmENVqGvSljuAZ3puyCGmfrG+rkuni6E0rePhx5WhhrlPa7yCWv?=
 =?us-ascii?Q?r/d1azH09uMtIkdU2efNMfbzsWB3c9Ka6zCXixOnMroTw2fqkrFaYrjw/BE7?=
 =?us-ascii?Q?9WwlpC5srhuNtQINa5dctf3K2KZsVFQaBv/yYw/FGXXmsl63Q9jH3ZnxHBug?=
 =?us-ascii?Q?h0VnrAvebqguI4N++pAeQZfLlusffllfctGm5fMkXSX/t2OJ9k5AKrcJDRhD?=
 =?us-ascii?Q?w3v2Ly24kgqLLkmFrJM4rH+mq90k4PEa9i0m6WVTRpgGwtqw2v38ntqfmtU8?=
 =?us-ascii?Q?vBKF+Nd8U4PMrTAIiMVPMXbB3uo8VSMbWO8GjUHVUnejf1iKWscLK3jUXPpg?=
 =?us-ascii?Q?CvpzlsNxqE8U7AjQ9/otbyP48NrXZWwfh2Pc8sjunpNj+jM8GPNRBQI7XU9V?=
 =?us-ascii?Q?Gat4oZrvrKwZ5rTVs4mnPW9+05Hyr1XJPiM60OFSpsJU6nUhEt0Sf1qvhmhQ?=
 =?us-ascii?Q?U71o4C0/FGvQWWTU9kaezbyMgUs1fr5d1Sn7RCTs4JIRtqDC0TQKoEiEj8uc?=
 =?us-ascii?Q?esJepdyefTct7mOUn6bw5i6yN+/Ou5PRifYWvMN8QNBP+TgYPVfDHO3xsndL?=
 =?us-ascii?Q?lzMCE3ZF+AKKQf3PcG3ab/s9z63gg5oQ577fAnZDCO7f1K2ZxPSisM1pSiXc?=
 =?us-ascii?Q?JNFVkJB3UuNWr7aLKtRXWpXVt6a/rvIDbD/U0acHppa1o7f72F+BxoznHVeA?=
 =?us-ascii?Q?ZYVj9rtsrzqWX3/VwGJJQT5WMLKUH02tgWX7BY8+2KAKMVODR2Uy1PoDgDO7?=
 =?us-ascii?Q?feiT7IW5S5mcxTiOUaUTv6snpBCyTiPvETV2p6mbQ490xDU/oGBiVwo5Ech3?=
 =?us-ascii?Q?HGNOZPd8wg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ac9e8d2-3b77-4f4d-9cef-08de8fd2cf5d
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 09:41:14.5880
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h9iDMTws4r4jZh5GNsu3tHg1vl/LVOt3EK/88LTx5/qu5usBz3G2wb7ueBestzF1tBun7zx/KOqX/mqMM/m2ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8241

ALSA controls should return 1 if the value in the control changed but the
control put operation hwvad_put_init_mode() only returns 0 or a negative
error code, causing ALSA to not generate any change events.

Add a suitable check in the function before updating the vad_init_mode
variable.

Fixes: 29dbfeecab85 ("ASoC: fsl_micfil: Add Hardware Voice Activity Detector support")
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_micfil.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/sound/soc/fsl/fsl_micfil.c b/sound/soc/fsl/fsl_micfil.c
index 97f24c9bdd68..1c826e0cb1d5 100644
--- a/sound/soc/fsl/fsl_micfil.c
+++ b/sound/soc/fsl/fsl_micfil.c
@@ -407,13 +407,18 @@ static int hwvad_put_init_mode(struct snd_kcontrol *kcontrol,
 	unsigned int *item = ucontrol->value.enumerated.item;
 	struct fsl_micfil *micfil = snd_soc_component_get_drvdata(comp);
 	int val = snd_soc_enum_item_to_val(e, item[0]);
+	bool change = false;
+
+	if (val < MICFIL_HWVAD_ENVELOPE_MODE || val > MICFIL_HWVAD_ENERGY_MODE)
+		return -EINVAL;
 
 	/* 0 - Envelope-based Mode
 	 * 1 - Energy-based Mode
 	 */
+	change = (micfil->vad_init_mode != val);
 	micfil->vad_init_mode = val;
 
-	return 0;
+	return change;
 }
 
 static int hwvad_get_init_mode(struct snd_kcontrol *kcontrol,
-- 
2.34.1

