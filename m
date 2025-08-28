Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011050.outbound.protection.outlook.com [40.107.74.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0986A199931
	for <linux-sound@vger.kernel.org>; Thu, 28 Aug 2025 02:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756347711; cv=fail; b=SEZIEIcRVDVYBQ82MWZVwBL7YZba1BQCZHH5H0gSuB3KpS8ErvOpzeHeWmyxh65+M9yEPmF5NVpAc9VnJO40spAbD6Ak8lhAT9/ILsb8EW5AoQjStJ06zElFBRkV3MyqDB5Mqub/OfSA0X+gTdv9z9JlVBBTVt1t3G5Dd2cag2Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756347711; c=relaxed/simple;
	bh=VarYkKLtaZ82drEAkwKCJwtoTZqGU4ia2ET8pBKjzJE=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=V0DpOyBOfPunv565VkjPjWoMIanUfGnahbOSrEVJoxweybPIcae6UQEEhVCUN/4xubO7G7DYj7bptShF3tGpM37tEok8b1V47AaXcVDEZ7tgW5jH+kVYJfNuMY9FRJ9gL38fJA8yt7Fl2GvA+DHJ6tn4it1+Vl0FK4qt4rvEAWI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=egsFeiSL; arc=fail smtp.client-ip=40.107.74.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="egsFeiSL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vo9rD39Ot3H2aOHWlLsxoK3O9z2B+7M0gpskfrIfsquhpi2KbPJ3Y4vsSTQpp8ISFtIDOWPdbEJACyv1kX07vquwNFIC8f+n7xkuLmYKnmQMbfcDAmBmukxcUR6ObJzN4ska5MzsAal48C3jenaoXYGDGnpKsTDp+rSgc4F0M5/5HagnncO3EVqVXaKqbWajT3OrLelY5ZqgN4XKsFZGxnzkjzdr/52FoxCNy/7WZAGqYlqaqtElAAI4d9QMXstONoEHHG7EsbB4+BsVPrCqr1g9jzXohJzQqQ40TNhuLABbEyVQspXbH1sfWUmrbHnt8oLQSlLsV+FGyLIgZuT+RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5E846Yf/GQ0RZWUkdl812GeNvbdY+4pk2iDUeUQoxtA=;
 b=ob5YBlqnJbIyfK+Ykw4cFjhiVFJBnGtDzM+TF1iTRoh0S4PW6cIyOHFHEq25BAGzQ78RBZcIF0KsH4XEPaI5hIdn1SSrk2PynOUmkhO4nLwlU8drfSbbtadop6WsG8eertNVJLuaQSrJBhrm/NYkyzNvonCVU3UxPrpWcl8Lg0rWt4epFNpLFAnDawdBC8BGRgg5O2kXuLqGafppxil6F+m+IULv6KVLdYEHmL/wuVK9lf/NuPHnPaNnS27R1Q4x8nAsgfOYXUVqpu5eTruY2Hpc1CCeIr9O+J7MyLXQEWQ3IrK5udGR+4PLjiCfStbITztqVIEpGsSIs6wy11Vvdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5E846Yf/GQ0RZWUkdl812GeNvbdY+4pk2iDUeUQoxtA=;
 b=egsFeiSL6rLPggaeGw+/r7ONX0a4i7fT6BARsYCZhWg/k5WgymYVvSwqZsP23z81y1fw0o1tojv3aORGfnhNvHHX2b8/f+X7KCoNN0aQRywz/QuZYEgTp+oT7FqwiqL0/tZS0KHL94IuyYd9NkC4oL1dL90aG4HarU6SGn7u73k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB12429.jpnprd01.prod.outlook.com
 (2603:1096:405:100::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.15; Thu, 28 Aug
 2025 02:21:46 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.9073.010; Thu, 28 Aug 2025
 02:21:46 +0000
Message-ID: <87h5xsuqx2.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 1/4] ASoC: renesas: msiof: msiof_update_and_wait() checks whether reg was updated
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87iki8uqxt.wl-kuninori.morimoto.gx@renesas.com>
References: <87iki8uqxt.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 28 Aug 2025 02:21:46 +0000
X-ClientProxiedBy: TYCP286CA0361.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:79::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB12429:EE_
X-MS-Office365-Filtering-Correlation-Id: 628d8f11-4177-4b9a-43ba-08dde5d9a350
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ckCCW3Gj0xrhF3glqHxsqcTtjJIrfZRGpAG4dRxXV5vSu7ThVazqx3Ta/g0X?=
 =?us-ascii?Q?pOfdj2zN16iDk2vy8/hm+egC4jE2F1l8sbjkS1Ec+9iWQOv3czyzX/mlGFOq?=
 =?us-ascii?Q?Rb6RNsuyyBJTcUuSHJtzZvL1vyaNc4SHriG6abStjXBUiz1hZgwztHUAApEG?=
 =?us-ascii?Q?gnFS7zqQvw9wnowTgsdXL1TSM+faDTsLX7NC+/R5DE1N/WmTIL6hWB2w2KGk?=
 =?us-ascii?Q?PhZbTx/dxaAFzhs4t6D2U9X4snf2lU3jbDsUhTAEelJq9E09KV/8Nzd0yk37?=
 =?us-ascii?Q?Gm9UQfpMCV5npWpC4BLrgaGlldCBLZ1fL5nCboxkibdmdHcu9BCoe1Qal2nR?=
 =?us-ascii?Q?gGfYe3lzYqwOpeRLtFVShdSdpw3yzeluT2ckP+YbL+OwMicVvTtQOnql/KGq?=
 =?us-ascii?Q?JKNPIy/mDtNoDq3oaBK5UvLZIkNwtkZqWbWnMbLYg+U0S73BjtYIsEe7jWVn?=
 =?us-ascii?Q?JW5k+AQk/FaWrCDem3BVL4HISa7ecXngcel2RtAAGNlsgUnVASHQ3xbvd5L9?=
 =?us-ascii?Q?gFRSaox8j00xsJfftEJyP76yG1DKpYxUcic0e/GT7QvfkajlBP12CnEAdqEq?=
 =?us-ascii?Q?fPdw8ZimPAklUiw54+r0xD/PVWN1/1F0hAj0QEs99GRC1+HcZ7v8lUaJY026?=
 =?us-ascii?Q?CBH0vYUONYeVslHll4rQk7CXBS8+nsJ0gLUvfxTYjo/Vnir4+wUpUH9ft9Wr?=
 =?us-ascii?Q?kBZNIB1HDaF7HcRbBtNwd9UWfyPJWdIMO572PCeQ66+MnoNjI9s4/cCZHTnS?=
 =?us-ascii?Q?uX4FbCTJfIWIj3jRMhH5wnY40FxFKloy1u9qJMBfDvsUm1NCuRU8HYrAdZxV?=
 =?us-ascii?Q?ubVrFLWwCoSLXtAJO6gHRMyyehQKKTO8IvWZm9KiHEROQSrfjW6x0+DulpaT?=
 =?us-ascii?Q?6pSBALB1cS9ru4GB02K5o0PYfl4kDURZKK9PiGEcsp29kyONb/dkcx3azPKG?=
 =?us-ascii?Q?jbFVixpK/uySy9UaU298JUXpkjOQ0Yr+7rx+69JP1Sf2GPa4jcDbA1BH4eVn?=
 =?us-ascii?Q?rsY5FV/bf+ow7f6seN/fm5rVhpoK0Tg+zDZL9ZVXax3G2Ny13LeybmjztX0L?=
 =?us-ascii?Q?NTzIN547pV/MGpcbYtzqp/jVkW2dsS/XE1EBKUIcATU9GZUyufDbHZB7m+Mu?=
 =?us-ascii?Q?3NQfpSzeu0QG6yxupATkLY76esFtJ/WZ7Sji/EZXiMLejY3/fyJYN30mnPGY?=
 =?us-ascii?Q?zxSPbzajBTL4AuW9n7IkFluRhX236ZS0x3Y5tEusxFapbZH0aDMkhGuFTGR3?=
 =?us-ascii?Q?c34NX1hzecp54Bq4xrTefM9+59dhi/YCsg+cLQDnVX8JzzCdTF95etuvExZF?=
 =?us-ascii?Q?9ED8PPgRjUDyX//x+2jEreMkMV7sOIVScFCqyCzMFZI00Du2d7Hzru2ybqS0?=
 =?us-ascii?Q?vCvL2ASZxgKzes1uMGQBODGw5PFCdp8D4DNIwbd/VqPXY9tZBrenRTjCE8b1?=
 =?us-ascii?Q?Ui0Q8jYSBIi/TBGztQwdRQXbIeyRLUll8/FnlQh1ISWiwcsa2ucaDA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1yi1Vg65nbEhcTQIR26oTRepeBOhNtmvjmKBK7vvtW+2bRPxmsFpF0CrpehT?=
 =?us-ascii?Q?sfGz9CYvd9+qo4ybKreoFicTo5+rKV+RZWodsPgGiSFCQEj5vLTDHw94491v?=
 =?us-ascii?Q?/4qpF/up5hIZJdLV3OliI+DpTYHsQkY31rVyU40psQCRLo7cKD2jUT2n06Ih?=
 =?us-ascii?Q?CNwwaJCekaiS/1PNImAYNzONauVdU6MMY1a8hKgP7GQY6ZpDY9u3082JP+Ap?=
 =?us-ascii?Q?p/a2ta0P6L8u24pDwBCp2vW2go7iD15tOFmC9zbc+ngrqVdMjjzOLQaFO7Re?=
 =?us-ascii?Q?d5F011iIFjmGAK3dbELHT4/+fHFmxjXOoax0fNl//zPr+9lbk4a65lahl+2T?=
 =?us-ascii?Q?KQyhH26zm6bnkH3MfxikV+430V1vAcackkX0SDoffQhMNbpNGYr81t9CECEP?=
 =?us-ascii?Q?sSBFQms2lzZHKapINH9utQc3OJ8wugijX37kMsw66aL2Y5rRF0mXtMxjOcZ8?=
 =?us-ascii?Q?lZ9OdQAxh8QhOoFJxfyaECWlIsy2e403VojEHSaRfX1n6mB/9ZHvKrkWA765?=
 =?us-ascii?Q?gtMP3E2cLtjk3wuz73ehFbGvwKMaLrL3b+1JDk0pC0pz9869hG3yuvOJp20B?=
 =?us-ascii?Q?70s6DdoVix9cbeC+SK7IMJm6BiRS2O67joPPm1GhguI9/0BB2Fg14tDiGcnb?=
 =?us-ascii?Q?xaaIL0TQX689E2/YY4LFgDEEQPAu/Mp79+aYuxzcQi2hcCoVS05QjkwHM+eB?=
 =?us-ascii?Q?X1AhsKgyhUUe9nGixi/VUhTnC18bg5c4TjNPY2Ea8OQ4ROq8yHwR9ehw8pdA?=
 =?us-ascii?Q?7tP1DmcorSBGsVO9kTysrON2hIkTdn+gkaP9kyuMxVv3xJ2Q0hpV3sMUAHAz?=
 =?us-ascii?Q?e+jVdvKCEAnwauT8KQOEEEsTYmnlLf+AFSTnIvjDxBF2bxE7S6qIRFyy+2Ob?=
 =?us-ascii?Q?22Qv1UpB1FFO8nsH+28ggWI9iB+yHJY7mxFWGukoV6+Out0t1bg7Ro7R1ykL?=
 =?us-ascii?Q?xuGAfC+7pYtMyYQrAlZPC5+ujjT3bSViqMVJQ52Y9Ftq2s9wREqaseMIZhDT?=
 =?us-ascii?Q?hAeFFPoi3XqjSFzp8v/KCRUuz+VDsA+pQOVYkLa0r47qd4vKKEYkKJhLE9oZ?=
 =?us-ascii?Q?jGfG5BTQRi2dkJdYCjg2pQapgZvpSThz6E7HMIkSpDuCcjvKpf1LrfDkGIcs?=
 =?us-ascii?Q?Lc+sre2qZHlZ15klL1Kk+pBA243iUTUcXF8PqB5vqb+/uBuCDXj2zv938t8y?=
 =?us-ascii?Q?wsSgEKv+uZKRxJUIZMmSahAC0mNcXYXiyZQxKpQXVbu/8UpTOznTByWamRA3?=
 =?us-ascii?Q?quWMaQ/WdOcOkk2Ru4k9sI4xI+yDeWH2ilRg5ZR3CD5OIAwGT87Pz2SSAzz6?=
 =?us-ascii?Q?MwHaB3OxciPBlfgzQSkgZXE7uj8LGwSlG2fiAjmUfgrAy+0D0GA1Nj5+z4oP?=
 =?us-ascii?Q?5F0l7jaC63gNBnBPl9CFc3EtHOnzxy5OvIBaWdKmQ7Dbb4HEGjct1nZxXuo4?=
 =?us-ascii?Q?pBw9wfAPfido9Vxv4AJxVqkn6mq91bkYEwD+RghWLBf1eqzKk/DuiPp0tUdb?=
 =?us-ascii?Q?MPYx2YCcsR/LVSTuqp5oM1cCID3uaBfwYObkooqE1dWmzF5WYfeVLD3PjIPD?=
 =?us-ascii?Q?tRMsDMwsAMKflkyq468TfO2x9wSWmq3lHXcY95UVPcPzgInzA2xRntLAdWuw?=
 =?us-ascii?Q?FxoQq9tRhEPdDdkKnvQ28Ek=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 628d8f11-4177-4b9a-43ba-08dde5d9a350
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 02:21:46.8794
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IMoIuMfEVoooQpdwylG8JHdaKgQSJovQkaxv9XUu4NtzxboHdriYb5cPG+FtBmcTHKZaoJwBS1V2PpCvUBi8o8ahebQgGuZkQTt13RAvuK7RznwwA8O+M71o8DsSvJTO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12429

msiof_update_and_wait() updates reg and waits until the value was updated.
But, if the set value was same as current reg value, no update will be
happen. Check the value, and ignore waiting if no update.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/renesas/rcar/msiof.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/sound/soc/renesas/rcar/msiof.c b/sound/soc/renesas/rcar/msiof.c
index 36d31ab8ac6a..b7633ed3e3f0 100644
--- a/sound/soc/renesas/rcar/msiof.c
+++ b/sound/soc/renesas/rcar/msiof.c
@@ -82,13 +82,18 @@ struct msiof_priv {
 #define msiof_write(priv, reg, val)	iowrite32(val, (priv)->base + reg)
 #define msiof_status_clear(priv)	msiof_write(priv, SISTR, SISTR_ERR)
 
-static void msiof_update(struct msiof_priv *priv, u32 reg, u32 mask, u32 val)
+static int msiof_update(struct msiof_priv *priv, u32 reg, u32 mask, u32 val)
 {
 	u32 old = msiof_read(priv, reg);
 	u32 new = (old & ~mask) | (val & mask);
+	int updated = false;
 
-	if (old != new)
+	if (old != new) {
 		msiof_write(priv, reg, new);
+		updated = true;
+	}
+
+	return updated;
 }
 
 static void msiof_update_and_wait(struct msiof_priv *priv, u32 reg, u32 mask, u32 val, u32 expect)
@@ -96,7 +101,9 @@ static void msiof_update_and_wait(struct msiof_priv *priv, u32 reg, u32 mask, u3
 	u32 data;
 	int ret;
 
-	msiof_update(priv, reg, mask, val);
+	ret = msiof_update(priv, reg, mask, val);
+	if (!ret) /* no update */
+		return;
 
 	ret = readl_poll_timeout_atomic(priv->base + reg, data,
 					(data & mask) == expect, 1, 128);
-- 
2.43.0

