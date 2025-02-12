Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010004.outbound.protection.outlook.com [52.101.228.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A02FA1D515A
	for <linux-sound@vger.kernel.org>; Wed, 12 Feb 2025 02:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739327329; cv=fail; b=Ezd3GuL1cUozIY1QW/DTD8ArEVBO7p6XfaHpIuDOqm3jkBSMfjCDsNW5csKFvBHplAWtJPViHhFRQWIMtGAkQYXpQEYeigLkMapcekCWanWAofgnhVwala/6Rf5PNdoplB3legH28otWd6dpuEi3qtQzhFgMJ2Nwl58xVHPrmY8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739327329; c=relaxed/simple;
	bh=EkXW7/Z1SiP/0RS0n23O0igm6PpjjjgH2tP0TWFCjzk=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Cu+GVUejuNfjntgTGdxsqqYK3yJ/v4AnuCatOiLBPrqeP4t+LGMkarZaNhRIbc2PsQ/PcE00tlDszxeWusVMQuuCd5edMifDtj7/1gEMlieyFfr+Ao7YqYLxos7Md1Syz1bzCYbCH1V87R2jUoetp63MEhE9vNC1UQ0jZ8sHt/0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=mEWzNzNa; arc=fail smtp.client-ip=52.101.228.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="mEWzNzNa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vCBEseNJQGb0nbf1qggCUANks2RJ2vE1Cnbw9OOFy1mMXBSH8UoDWyBhCFBTHpDM2g0bNgYsjWL2vdFEWZKJKdiGlnex0JvWY0makw2rEyK4E7PR/4QBH8dbxtE4SvFalQBO/m1mI0Vi2ODWGVtNFP7tbPKqIcO5AfS0J71lYp+oHuId/pimftxeI186WVwPkaDJELZ058FZJlicVZIC65ORi0E37qlatnJIFzccg2mYsXoig8oCnMuJsRt8d7dY2KWAFLoTuJmshYFEIUtfNS51X91/9NspXsLSBXObXLUsi65Ymo0lfpyi+o87P0DpPnhWDjnuoEg8NAKwrbY4NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u2olIib8Qg2U8YAYE3ef8OqJbS7+ULw3jxPPMwUBv5o=;
 b=VYtOQt7UpoNeJ4ETuUHiKSzWQJh7sLnQ9PEqbNMWP+lu8FgHX4TNfKWAzqsXK4pdzHUaF/wryg7+UUvoay+eVwAVJKOyuGWrp9Ew6sO4y66W3V2u+89u1VzVIb6nJu/eqNK1SNe526WiPEYQ/JYPJHmcqmm6E/ZQVWW5euOb5VYGLW/nqZJT8RWEDz6ZGJ6TcD0cG07+JNYiqdaezV9kSE4q3kRxcFdHlKpxvofZnDtN31Na6PEdgLrmIlckYJry5gJuyif6vpK9pE+3/ff9vjW8ZZKit/HsN0oGvxglF0WuD5fFE7IiIXHRlvINPQ1X7yoDYISNr9FB9UprAJH9+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u2olIib8Qg2U8YAYE3ef8OqJbS7+ULw3jxPPMwUBv5o=;
 b=mEWzNzNaYOiGKD2qmxMReW7Rn+gbrtsbfvhv0tbm33V0NsTDx0o9267aaRraiJyUHZlp9nzidmz3Dk4Nt9UcZ9jO586JHzlrKqqGBCCbX220heH4BADOXaRarIyXLR1hrzqHmTHgF/5I+tV1SjIv4jPOKIUwVwkxDl8RqTnYO+M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS7PR01MB12096.jpnprd01.prod.outlook.com
 (2603:1096:604:260::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.11; Wed, 12 Feb
 2025 02:28:43 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8422.015; Wed, 12 Feb 2025
 02:28:43 +0000
Message-ID: <87ldubyjz9.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 09/12] ASoC: remove update from snd_soc_card
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87y0ybyk8p.wl-kuninori.morimoto.gx@renesas.com>
References: <87y0ybyk8p.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 12 Feb 2025 02:28:43 +0000
X-ClientProxiedBy: TYCP301CA0034.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:380::14) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS7PR01MB12096:EE_
X-MS-Office365-Filtering-Correlation-Id: f6fe594e-1d67-448c-b76b-08dd4b0cf837
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iErBO8Y0X96CHIbx54w2Vm7ZSoUSmRWEFxY3YzTVZ+0J180JzhNjx3LAxOHK?=
 =?us-ascii?Q?kBchOX5LismGKs5DwIdM/bs6Nx28OhWT+iU+8gIvvSe2qu3OKnwc6wqigeTg?=
 =?us-ascii?Q?hpU/jH91ZfvQzSFdz4GAR2+a0U0fZ+wKYdd8NN6Av0bayrtuHt9q8hW6QyCQ?=
 =?us-ascii?Q?841v+ZqHlAtUSRoeaoa9+zAH6Er4XO9dnSb/TQx6k2vaMweK3ndMUrxtuzVw?=
 =?us-ascii?Q?U7FnV1j3I0AIiU1+g+0LlKxteIzqSOmOOCusUgZ7KGpYca4G77KSFScHbxgz?=
 =?us-ascii?Q?y+WR2M2pyxnDw8dXqJblJ6hh3nkjR3urmHm27KyY0dvzL1NPrkMQLLlgI1BK?=
 =?us-ascii?Q?dpzd9bGO/fGFsY46PdhSX/NgCbv1mcdfV/I9fhxzRJfT+11wwlpEd88RR4MX?=
 =?us-ascii?Q?uD3dMNMZSwbzcf7eo+nZbFIKj3q0fxjiXWqQ/EKHrmpJSsaFdLg8woRhtPtx?=
 =?us-ascii?Q?Xb42CS8k+VtRviM9Q42FVIcDABfsb1Xj6icWgqYV16X76uM4J2Xmfh1q+Wbi?=
 =?us-ascii?Q?Xg/mlQ7w0MB3HyT+goIiciveYq1qQ/T2MRTfhZ1q16Jz0EIMaFCZJWXf2HEy?=
 =?us-ascii?Q?3KmjYmoYkvy6WlBB1HTQz4qgIfqd/cNvtPZUqA6w+mF9xf3h63zP6Bk9P7wC?=
 =?us-ascii?Q?nuoUUyQdiHlGFGhtfXbo/VORo4X+UuYTjtSJDKUH4vu8k9e8w4dAL5VTEfHj?=
 =?us-ascii?Q?WKmrrbjL6jAEHZha7UgpeWQFFZvw9LZXguw1WZaVoBlLJwCTY5P7RQ/bZ9ZH?=
 =?us-ascii?Q?hlpU9bgCSK9AMp3JQZVWBTQYL7kYiEHv020/PUP76/ouaOG/3C/7MXGO4Bhb?=
 =?us-ascii?Q?+fGtRI4YPkHmEX4WJnBBPpvA5yh4f5FlgVKZJKvlL7aDPt8FCenqNeeXB9D1?=
 =?us-ascii?Q?7gUYGD2gsqV9Vgn40YFvn7ET9hfP2tAWGMOZyu5Guox966sdS209CM2/jvZ/?=
 =?us-ascii?Q?kWkVEwE9bSBwrUWTI5612P6+EUasmafJHx+KqgQHFvV8jpFXuaEbnSfdfrmS?=
 =?us-ascii?Q?MFimvYxjH3CQE8kaatyWv/DHXRNEMwYpHlE1UrAFm+3G9P2SKEuQLsY6WlJK?=
 =?us-ascii?Q?j/fhy41IlGAYxnJO+gpkTHQTkJJNxZExWSykOjOFeFEdrIx0wRkcZ5mnp0pI?=
 =?us-ascii?Q?CQQZ3xZzFsTCQiaZ6cxdoHJHhv2BfbPP5z7FmaKYePz8gfM6sWXPJldVFAL2?=
 =?us-ascii?Q?VIvax6YU/XG4gNCu0Z8jv7nYnC6/qf+WJew9RgVsPvw+VFvtP2I0e5bAUnlY?=
 =?us-ascii?Q?tEAesp0VsJzDba2GC3HLgMoDa06ZXGIOsxsAWJL0HExJAGsAxmRw1GRGq6h8?=
 =?us-ascii?Q?xQOse3fQF560A4GAtnxgJnJHL2S+ifL4D552ctnTh/6wKrV9SpxUTZJOCx16?=
 =?us-ascii?Q?f3Lz6iYaZ/UmBiszX0n/EuuMLf/dMYspO14NflemR+nQvpL/9fNHUus4SXr6?=
 =?us-ascii?Q?RUs/2Ewifuv1/pA3fGMn3qhHlC5ku8e8?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0SXlcmDlSy3GLpXAH6lSGpWTUqR7BlSXEOTj3ht+dvLTl2tJCNRK/RfvVjhl?=
 =?us-ascii?Q?qFbuuj1K2cODlRpnrEv0DZFOGpCq3AYGNBE9Kqdb3JkIjArALQl/ESB/D4Gr?=
 =?us-ascii?Q?YKXC3lGjUAmCEDfa/N3N2XFqvLRPbjw9cm0kJukA6MjqI8mkSIYrN8RNDDX4?=
 =?us-ascii?Q?kLg8g3915cimgPyqlTr6TKtYXCfeRSQ1qlZN1ArULrI6Z7inWmC6g9PHCMNF?=
 =?us-ascii?Q?+2FHsAxFCJBSD4moUflTC95U7kuK6Z3IHzFu9vUBkMdaTNCwdv2h9RsV+vIf?=
 =?us-ascii?Q?csn6cbpKPYF4vD5D5lPEzndeUlc+t1tH56hR/WcK6eeMQVGXQkL/TrTrKsGg?=
 =?us-ascii?Q?TIyD84mkqnLXp4IWkCzwZFlrOTDZAPb/ZOrubqLi7UxCrsyMGB5dau8tMkMu?=
 =?us-ascii?Q?q/KOrUPvafP7zDMonf+8W5ktkTw2o/M53X365HzOIXT7dhycMrFwgpbnHePt?=
 =?us-ascii?Q?+TxR4DZ+2jx2uB2Re4I8Fp9vtrOOyWoXgz70fofbtu4YAGKDB49wy14AV/Dm?=
 =?us-ascii?Q?YSbosahNh7Y9R7B9r6MbX6didAYd95Rm2df7aFxIMvBPZ8LeDyo2cZ8+N8dS?=
 =?us-ascii?Q?BL05eACv9WBH+57JXYojl9BnxKbo6azfP633/wRMSRLUhFy5zYpEw7ne1jBR?=
 =?us-ascii?Q?Vc7LbcTsbxpxYOPBPkfeHLgR1XEF4BaotQMBJ6E2B0x1RIOR2ngQpnmuzWCz?=
 =?us-ascii?Q?DxMpNZpq8RK2mljxEJHiXowka7fJB9Su+tIsMrdufURgqYG0Zilz8t3w9Ewk?=
 =?us-ascii?Q?xKX7xngNid62HWKY95fKqFGoH05GUPgyMkrpQwxF307Cyqw/P7Y4gjTAIhE3?=
 =?us-ascii?Q?B2jrirbg82VGc/lWQkrn5pQBYLeW3L0L2diJxRbseBJ0WDCqYpZYYrJVZA2C?=
 =?us-ascii?Q?Ur9bypUX19jNNXrUKlb2wbrJTLNCtc7SzxTKOZNaLAvSK7YPhy+U/heRBCuq?=
 =?us-ascii?Q?2j63E1KW8gUoIWY1bSYPO2OY0kL5y50BuZXBLm9JuA2intrUu2LRD5gMrEnx?=
 =?us-ascii?Q?mJ84h5dHXXowBEH0DwpZ3M9TcrWDRl8CVDEAJHS9dITmA9mycZhbQ+8jBhuC?=
 =?us-ascii?Q?4g2sCPv6aX90aIysCL/ovlw/Lku+YXOXEJ24bxr7prbCl1fPnytgdLR9QmGa?=
 =?us-ascii?Q?g4kzpAddpccWsA3z/PscPuBvjQIYzFnOI1LwxpL0H/UbMRE29YVTtGdeMiiz?=
 =?us-ascii?Q?ZfT1YIuxYzZUrJ8IGnW3grauVYpi/cnk38DLRBpqXrDUThckWN7WEXarKceB?=
 =?us-ascii?Q?KB/eqpyDk5R78wwoBsun18F+RjWKagaqINOhlEm1eGZ8Z505WxZV7dwAL/b6?=
 =?us-ascii?Q?+zduAPvyL6NPLwzhiSrWYzR4a5o3B87+SmMN5684WkftvuaEQkykSsPjhu/I?=
 =?us-ascii?Q?AI4H6o3aUt4znwhf8NCJOj83TMtPixzVjz/LaoDYuWdBf9+0ihGAPa8930+z?=
 =?us-ascii?Q?0yqZ+xILOIyYlZn2vJGfyJa2Eh7WUeosgGmtJlWrHZz2UUuzL86145tx7i4d?=
 =?us-ascii?Q?bq6pHI3h08NmpqNDJVjauPb21sJbh/mhocIMbiqyL1wP3g/KRgvQ6hOXWuih?=
 =?us-ascii?Q?GiHnEl2VlKLtFehX4m3+g9Ri9C6qX/8RMAb+/PCmPvAHWKlbSBOaye7okJgm?=
 =?us-ascii?Q?7H/dDiuZFk0BL0J9+4bRXcg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6fe594e-1d67-448c-b76b-08dd4b0cf837
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2025 02:28:43.3750
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KD0mHlZUUhugn2WYTjhcU9CeVLdO7thLlNWbbSaJkv32CwIIIdM+jyGdSi7BAA2VnXiD19KaDOyFSlFvI/xiscNo0azKBb+q9icS3npXEbBDgHzrskcx9sw8q1O6EprL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB12096

snd_soc_card :: update is used only for passing parameters to
dapm_widget_update() like below.

	card->update = update;
	ret = soc_dapm_xxx(card, ...);
	card->update = NULL;

Let's passing it via function parameter and remove update from
snd_soc_card.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc.h  |  1 -
 sound/soc/soc-dapm.c | 48 +++++++++++++++++++-------------------------
 2 files changed, 21 insertions(+), 28 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 62c90ef40f1a5..644cfe26022ed 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -1106,7 +1106,6 @@ struct snd_soc_card {
 	/* Generic DAPM context for the card */
 	struct snd_soc_dapm_context dapm;
 	struct snd_soc_dapm_stats dapm_stats;
-	struct snd_soc_dapm_update *update;
 
 #ifdef CONFIG_DEBUG_FS
 	struct dentry *debugfs_card_root;
diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 7f18968097924..2a2c1f5941222 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -1743,9 +1743,8 @@ static void dapm_seq_run(struct snd_soc_card *card,
 		soc_dapm_async_complete(d);
 }
 
-static void dapm_widget_update(struct snd_soc_card *card)
+static void dapm_widget_update(struct snd_soc_card *card, struct snd_soc_dapm_update *update)
 {
-	struct snd_soc_dapm_update *update = card->update;
 	struct snd_soc_dapm_widget_list *wlist;
 	struct snd_soc_dapm_widget *w = NULL;
 	unsigned int wi;
@@ -1951,7 +1950,8 @@ static bool dapm_idle_bias_off(struct snd_soc_dapm_context *dapm)
  *  o Input pin to Output pin (bypass, sidetone)
  *  o DAC to ADC (loopback).
  */
-static int dapm_power_widgets(struct snd_soc_card *card, int event)
+static int dapm_power_widgets(struct snd_soc_card *card, int event,
+			      struct snd_soc_dapm_update *update)
 {
 	struct snd_soc_dapm_widget *w;
 	struct snd_soc_dapm_context *d;
@@ -2059,7 +2059,7 @@ static int dapm_power_widgets(struct snd_soc_card *card, int event)
 	/* Power down widgets first; try to avoid amplifying pops. */
 	dapm_seq_run(card, &down_list, event, false);
 
-	dapm_widget_update(card);
+	dapm_widget_update(card, update);
 
 	/* Now power up. */
 	dapm_seq_run(card, &up_list, event, true);
@@ -2332,7 +2332,9 @@ static void soc_dapm_connect_path(struct snd_soc_dapm_path *path,
 
 /* test and update the power status of a mux widget */
 static int soc_dapm_mux_update_power(struct snd_soc_card *card,
-				 struct snd_kcontrol *kcontrol, int mux, struct soc_enum *e)
+				     struct snd_kcontrol *kcontrol,
+				     struct snd_soc_dapm_update *update,
+				     int mux, struct soc_enum *e)
 {
 	struct snd_soc_dapm_path *path;
 	int found = 0;
@@ -2353,7 +2355,7 @@ static int soc_dapm_mux_update_power(struct snd_soc_card *card,
 	}
 
 	if (found)
-		dapm_power_widgets(card, SND_SOC_DAPM_STREAM_NOP);
+		dapm_power_widgets(card, SND_SOC_DAPM_STREAM_NOP, update);
 
 	return found;
 }
@@ -2366,9 +2368,7 @@ int snd_soc_dapm_mux_update_power(struct snd_soc_dapm_context *dapm,
 	int ret;
 
 	snd_soc_dapm_mutex_lock(card);
-	card->update = update;
-	ret = soc_dapm_mux_update_power(card, kcontrol, mux, e);
-	card->update = NULL;
+	ret = soc_dapm_mux_update_power(card, kcontrol, update, mux, e);
 	snd_soc_dapm_mutex_unlock(card);
 	if (ret > 0)
 		snd_soc_dpcm_runtime_update(card);
@@ -2379,6 +2379,7 @@ EXPORT_SYMBOL_GPL(snd_soc_dapm_mux_update_power);
 /* test and update the power status of a mixer or switch widget */
 static int soc_dapm_mixer_update_power(struct snd_soc_card *card,
 				       struct snd_kcontrol *kcontrol,
+				       struct snd_soc_dapm_update *update,
 				       int connect, int rconnect)
 {
 	struct snd_soc_dapm_path *path;
@@ -2418,7 +2419,7 @@ static int soc_dapm_mixer_update_power(struct snd_soc_card *card,
 	}
 
 	if (found)
-		dapm_power_widgets(card, SND_SOC_DAPM_STREAM_NOP);
+		dapm_power_widgets(card, SND_SOC_DAPM_STREAM_NOP, update);
 
 	return found;
 }
@@ -2431,9 +2432,7 @@ int snd_soc_dapm_mixer_update_power(struct snd_soc_dapm_context *dapm,
 	int ret;
 
 	snd_soc_dapm_mutex_lock(card);
-	card->update = update;
-	ret = soc_dapm_mixer_update_power(card, kcontrol, connect, -1);
-	card->update = NULL;
+	ret = soc_dapm_mixer_update_power(card, kcontrol, update, connect, -1);
 	snd_soc_dapm_mutex_unlock(card);
 	if (ret > 0)
 		snd_soc_dpcm_runtime_update(card);
@@ -2689,7 +2688,7 @@ int snd_soc_dapm_sync_unlocked(struct snd_soc_dapm_context *dapm)
 	if (!snd_soc_card_is_instantiated(dapm->card))
 		return 0;
 
-	return dapm_power_widgets(dapm->card, SND_SOC_DAPM_STREAM_NOP);
+	return dapm_power_widgets(dapm->card, SND_SOC_DAPM_STREAM_NOP, NULL);
 }
 EXPORT_SYMBOL_GPL(snd_soc_dapm_sync_unlocked);
 
@@ -3358,7 +3357,7 @@ int snd_soc_dapm_new_widgets(struct snd_soc_card *card)
 		dapm_debugfs_add_widget(w);
 	}
 
-	dapm_power_widgets(card, SND_SOC_DAPM_STREAM_NOP);
+	dapm_power_widgets(card, SND_SOC_DAPM_STREAM_NOP, NULL);
 	snd_soc_dapm_mutex_unlock(card);
 	return 0;
 }
@@ -3447,6 +3446,7 @@ int snd_soc_dapm_put_volsw(struct snd_kcontrol *kcontrol,
 	unsigned int val, rval = 0;
 	int connect, rconnect = -1, change, reg_change = 0;
 	struct snd_soc_dapm_update update = {};
+	struct snd_soc_dapm_update *pupdate = NULL;
 	int ret = 0;
 
 	val = (ucontrol->value.integer.value[0] & mask);
@@ -3495,13 +3495,9 @@ int snd_soc_dapm_put_volsw(struct snd_kcontrol *kcontrol,
 			update.reg = reg;
 			update.mask = mask << shift;
 			update.val = val;
-			card->update = &update;
+			pupdate = &update;
 		}
-
-		ret = soc_dapm_mixer_update_power(card, kcontrol, connect,
-						  rconnect);
-
-		card->update = NULL;
+		ret = soc_dapm_mixer_update_power(card, kcontrol, pupdate, connect, rconnect);
 	}
 
 	snd_soc_dapm_mutex_unlock(card);
@@ -3568,6 +3564,7 @@ int snd_soc_dapm_put_enum_double(struct snd_kcontrol *kcontrol,
 	unsigned int val, change, reg_change = 0;
 	unsigned int mask;
 	struct snd_soc_dapm_update update = {};
+	struct snd_soc_dapm_update *pupdate = NULL;
 	int ret = 0;
 
 	if (item[0] >= e->items)
@@ -3595,12 +3592,9 @@ int snd_soc_dapm_put_enum_double(struct snd_kcontrol *kcontrol,
 			update.reg = e->reg;
 			update.mask = mask;
 			update.val = val;
-			card->update = &update;
+			pupdate = &update;
 		}
-
-		ret = soc_dapm_mux_update_power(card, kcontrol, item[0], e);
-
-		card->update = NULL;
+		ret = soc_dapm_mux_update_power(card, kcontrol, pupdate, item[0], e);
 	}
 
 	snd_soc_dapm_mutex_unlock(card);
@@ -4522,7 +4516,7 @@ static void soc_dapm_stream_event(struct snd_soc_pcm_runtime *rtd, int stream,
 	for_each_rtd_dais(rtd, i, dai)
 		soc_dapm_dai_stream_event(dai, stream, event);
 
-	dapm_power_widgets(rtd->card, event);
+	dapm_power_widgets(rtd->card, event, NULL);
 }
 
 /**
-- 
2.43.0

