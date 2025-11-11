Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011031.outbound.protection.outlook.com [52.101.125.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B14120297E
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762821068; cv=fail; b=IpZbniTtacmOma7JkeLKxMd9jAUiq5f2qMLDlJM3odzT0rq8osDhpVizAUNAqMv0s3tPCOr+BA5YPCxjbb8EhZdbwihvyyalZ0r0J4YxLbesNPtMcejwMyLt4F8JP3ct2JcGOqxLWq+nVKkwsFvOzk3zVYkzt6vk7EreuKGAB6o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762821068; c=relaxed/simple;
	bh=QiMtw2G6+/Nhz//92KqLXvWm8NtsR2mdjevUSajg+h0=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=NbR2DL23g4aQ2lpYyZDS72NcVnwdoeFsu6Feohhb9orRTSQGtiDxLiMVZzouZ24dzpZmdR5259BELINcW5hGb94Ey807RHdo5RwA1LJNynhUKP6Zp8k4OhFl5AWz+vkJy4e697USLNO16yDRdAog/n9kcQKVB5gLeTDbMGUPFs0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=OpeU1YEl; arc=fail smtp.client-ip=52.101.125.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="OpeU1YEl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MH8x9FXaD6iBW9KVRWEFaRbndQbCr207w28eYL2IKoezwEmNX3UPIfXegjnnyyDL7aMXhW44ArOtw3CjptSYnAnoap7t6ohyCGIF+r85VsmW5ZEqul23nJH0Opw71gM+M7DZbYiZgjJH2OAWlZ/48lb4kP5aZ3+APySq6+1iaTQHiPqO/TdguK2zb8xB94b499vaglHbX9JFgfQmi5QxRyDazHGqZ3gHjpegWOmJ3859y9QGODIFKIsrpN9yVmb101puozuxbTbCaLXWazMMvRozb6P0+AMsMOBT8XDUIPAYxI4iMCppCUixQC/hSxDlSEtIiToKNlrg14qkAUcUZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wiZfOGbVbAi3iycu6oPwvaUZWwTYx/z2sq7A0gdyc9M=;
 b=lzpisnyqIGyZOBxG8f8O2hDyYT1rimfd4Dv1/BDOtZ4qUeLoKJVH73CNf6AzXtJ9RlQtG8fJhbeb2mNW3wBE/L6MsDrioPd2PEfwa8hA8EPRxq7U1ifWkyoxJJoBkQkKbgfCD6FmkmpMN+nDvD4KcSz3FJCK6QKpqKaZPyso9EIfENwSg4FAdfL/VbyBeyW109C1ZfbNSalwBdqX1eDF8zbE2jkUO4Tx0oOHZzT2PDB5gd9/Qp+Na9VQmz2WFz4rOR5j2pQVBFq61OwILTEx+VoFxUbXKA0KVElA9pgh+TV2gwTDhSMMLRmoidUmwWJ0PSwWPKBWKMd3x1s4LQrypQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wiZfOGbVbAi3iycu6oPwvaUZWwTYx/z2sq7A0gdyc9M=;
 b=OpeU1YElk2dTjxDhwPz3fu3nPvordpfcLGLDeKrve6DKlIAeEEbRAtIUw0Dyks2PhYRw3EayOcJ2TC0w6hgGlo06bvcM7fnDfQxRJDarqHsVGBuceu+mxikzy+gJANE//TzLz3b6J1aYOawnrm9virHH22T4k3Ltj4YlGxU89A0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYYPR01MB16440.jpnprd01.prod.outlook.com
 (2603:1096:405:147::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.11; Tue, 11 Nov
 2025 00:31:04 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:31:04 +0000
Message-ID: <87ecq5xveg.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 198/292] ASoC: intel: atom: sst-atom-controls: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:31:04 +0000
X-ClientProxiedBy: TYCP301CA0076.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7b::10) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYYPR01MB16440:EE_
X-MS-Office365-Filtering-Correlation-Id: 2739f456-ee42-4469-8545-08de20b998ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DTWUzZuUmqk7OoamaWs1GHGCFHtbxYOnXr21DEK+6RW1TODK9GljEVkfUP9N?=
 =?us-ascii?Q?pw2oFFY0fA8tnPoRJrU2gFW2Z/nkprI0rpalZOC2NYh97aQ9gSwo1uIUOZJX?=
 =?us-ascii?Q?pDO0EPCnJrbAahr7cjp+NwEdrUctxUF2glBTODr1YmqZ279ScGIfdo+zn60C?=
 =?us-ascii?Q?L10eH0UrkM+aodAXuA0fX1hFSpCmS5lvwe6ewpvtCLBsJD2iIPmcLN+KGBZ4?=
 =?us-ascii?Q?HYBpMzjAyuOQT/hSQ3BvaJBigy3rMeb2VVTB/N0Q+ykLt6oO52fFqYuXcktR?=
 =?us-ascii?Q?PV7/PvLNpnPBqCffMTT2NV2uPEpTYJPDCM1kceofBBkgtpmhFjNuJVBzbV4i?=
 =?us-ascii?Q?SxNGJBKYJABPAsSdaFCf2KtaA8szC8hXqZmrxlR1ZAju5N4XmYv3EcLBPaik?=
 =?us-ascii?Q?osCvFDfrnFzPzi03UtKmgvHn14HBC8WIaLy/EP20FQm3OeLJajVHsNbHdYNs?=
 =?us-ascii?Q?5MRN/M/KX38eW9qZmCiCFnFOwU5ds4yLEpzF150gqJWf4hXb9ztQdv5BHUWZ?=
 =?us-ascii?Q?De7JsLPYCwZb/z7IJdn0hynvEavfl7nqJHYHmqQRRPAztFuI6qC208jFnuv3?=
 =?us-ascii?Q?+TvISaJ3ZFPQHdzTx3Y4PrFlh6khmfBnpfpkLRRNnPj2N/D3yZq8kpSzsI84?=
 =?us-ascii?Q?yTfj9VoSEEnckcW53RvPmBw8qOrzcK/urXyMM2AKQPtyFkhB63GHlb/QXclz?=
 =?us-ascii?Q?G376Xip13Le6QsrKiyuhIeaE2K7sDVQMSLF0V51AgxL+WqUVApWkOXxVGFle?=
 =?us-ascii?Q?E/dUkVVrCeQTurRPFIOV5KRotUMyackVo6hncHa4ad4YhZNZzBYjALdLMko4?=
 =?us-ascii?Q?BbcEHwQhOo99CHT1Dml3+rhftiiz5chNvA8Uvg2tmlTcmCwmNyME83emwCeW?=
 =?us-ascii?Q?xFWVPJKGl5IDOiEPJ3nO6STmhlYq6xxF9ZS2UX8tIkS4ZRzEKRoG5brfnQ/D?=
 =?us-ascii?Q?B9mhCetaD/Wp/Gv/B5ISXIqNb/TOJZoMRTpcb/EwHIfWvVglmi36FbL1Bm6J?=
 =?us-ascii?Q?73v4+WObbojy9/gfqsgRC4yu/XG6DnYDfYJknwRe3eAV7BlESoNvH1EkAofc?=
 =?us-ascii?Q?xgkpsmJ0lkmyldEsWkRa2tomhPmJ2kk8KQl7ZjKP/Ppo5pR5uoJ6TcHlFYdg?=
 =?us-ascii?Q?31k4NrZ/zcQVEXRyp3gHVsvdTehJlb4C/EWDoX/ti0BiC1bEbsbDub8SQFz6?=
 =?us-ascii?Q?kgqGk0i4WhXZGM4Z95XDrIWP+QbYR5Fp5tROE00nO/YdJXuOlcrmJGArgROy?=
 =?us-ascii?Q?xKeeoiRRgAB4RVFSc2ip0eKoGj+4nan8EpomgPBlpCC4KTdxy40sMilwVqsl?=
 =?us-ascii?Q?RWAU5wBaGUH/ioHmX4GzZvUEBkiBJtTYQkwOEmBxgA3VQ8r8kXq118ShkI7R?=
 =?us-ascii?Q?CSbfLV4015a4PmY+VbFshRug55ZG8qfWjBzOskl4IzqmKAbxFQL++11ylFKC?=
 =?us-ascii?Q?DD3WpckuA/5yaj4hU0q9lHuF6ls9smy5gxIGMn0YkWGqs1CWOMtRuo3+vl1p?=
 =?us-ascii?Q?ylPhhbTKcsOPAe4xIlW8h7uKzcCMhDe4nx0C?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QzCn1ae3YIr4jyBUINpaBdYsm62p4ppQ8QaqJ0Wnp89nwWeaWyS6FpD+ugJf?=
 =?us-ascii?Q?jOoqFGEExqeHC+EKcAER8yCKvM+fu71qATO0tk6Z3BDrQUjm7YS/eh2d6aOS?=
 =?us-ascii?Q?/VI6kBCEvLVD3SMpjuxAmkpnyU4AD7PZBuwtqXauITqh7FmQ0XFU0+T9I7wR?=
 =?us-ascii?Q?CAlAUd/Vl1S0cwIvfaMhgiqq5x0c+qwFMXyA7zX5xx2OpyBI/dKouXtrKP3h?=
 =?us-ascii?Q?zT5GxXM/MzjXS2YrZEciw+gWj+0rYRT0X0Vetfk5HYnW71nqEDVGvMUsynQv?=
 =?us-ascii?Q?sZrjUE/qXI9se+t+G5tS4SLPemDqbmGKj9DuvcTWXfzckP8J+Dmywjh0BH2D?=
 =?us-ascii?Q?zPyEjAsTuuIuVSfokB2z6S/qqvlsyGcTHVCPRAAH0rsBPkuCHpkECT2KmbGk?=
 =?us-ascii?Q?NAFDmTLh8yRJEn01vpwfd9e41RwiQvh7OVcsYJjqrc5CI1N1bXuKl3kBeJZp?=
 =?us-ascii?Q?rjwD4+n5lE6Lmdju3gyO8hpgw6zUVBuRczxp3VDu6IficBMCYGMvrPousQNM?=
 =?us-ascii?Q?mxDiX5Btq788DyHhl2MOrLw8l8Y0S3tnHJvJEBppMDQCwsb3Lb50DVFusjsR?=
 =?us-ascii?Q?JZPXGTIbQaz/jM9ZhvHSG82MEGW7elupix/mQcb2+dqrIuaHZzDByGqV7oYo?=
 =?us-ascii?Q?2Y/WOFqZn3M76yVNbxvRWoi3xyKXTQ6/qU4pKAf1Zj1Rdq0Lj7F9eZuUy1Mi?=
 =?us-ascii?Q?pHJtN8h9V+F6ztw2zrsADAvClK4/nZsa2n5fqiWgpPZSvDKQXAPU6jxD/ZN1?=
 =?us-ascii?Q?o13kzXw98mjSkfx6d/hW4rABHLFEY6hTzZxd95ay+sXC84DSYH61clNZHwE6?=
 =?us-ascii?Q?nXOQp5gsZX+ThhPlcWQPavTXJ17i3nMrZP67KLwtzZ6FhF23DDrwYBWjpXjN?=
 =?us-ascii?Q?uAMovtd+8CehrtXAR1H6t5oJJczsP2bsYkisX3eAGwbLA2ugjFY1Q6gOkGAl?=
 =?us-ascii?Q?3ZU5TcsVx5J+giKAcxs1qDyjfy8OTrHwrKKlWCnDPYEmL/LnvtfymptnjGHb?=
 =?us-ascii?Q?ZpwNE5ebZBI1S6wtzIoEy36h1J62CMD67Ce4CPZvYeR1qxhogVrLWq2j3kxT?=
 =?us-ascii?Q?1rzzTlu8AcRVdVHlJ7zxIKSjpUY6FL37bFCSofGHAX4CLQ+EvYVep4TRR0S0?=
 =?us-ascii?Q?kr/qF0+a3gAfv1ifdLU0dPN92x4Bf4C/obTmtQckSssHL33DkdsGiSCvFAdG?=
 =?us-ascii?Q?eZOTRTYizEEnzYvqXv22QoRgQvaGnjsoaV8nr94QNx4J6gHqE2MBGqMDYwqt?=
 =?us-ascii?Q?Fzv+/ezdCpzSeV7jOGmYDiYleC62DtdkJXI/aiDZ1z2oTcSLbvajuIKzLpoF?=
 =?us-ascii?Q?TSTOyhrpunhC9drnDfnp9SMKD/SfobXR3LRgiGSx35J4mGz8Xsvh6jlwtTmv?=
 =?us-ascii?Q?uQPDaEFfIUaYA2WpPPKSNbUOpLe+Q98eDgCCcjLXg5vqSU1VcfIKXurEFHQ6?=
 =?us-ascii?Q?b52UniYWNiK5xBsQ1KPrP4MU/FMFSBml+0D75oNsLm+xqF9cUx9BIm/Hln9q?=
 =?us-ascii?Q?jEswTQ7O5GbyHQ9qgxK5oB0s7fcL+hYNWOoewBNWxZf3LON8EtqKu+ni0i91?=
 =?us-ascii?Q?xYoIUDU1Jgxo1wwZTAdW11xtfQNMWjiUBGQgX6AOosDGgoDG+dUXAvtt7vUT?=
 =?us-ascii?Q?LkWz0cixpElpFoMN99AU5eA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2739f456-ee42-4469-8545-08de20b998ff
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:31:04.1883
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QWI7Fp8TkWI0tqtnj0nwUHtWD58IsofJ1zOcuSaGd4Fqvte7MnG4qfEOC5LtFtjnvkPAYiMF6UNpObN+NPWIK30UFM+d35CoqetFuVndVH/GqrViSCseJd6Ft4/915KH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB16440

This patch converts below functions.

dapm->dev					-> snd_soc_dapm_to_dev()
dapm->card					-> snd_soc_dapm_to_card()
dapm->component					-> snd_soc_dapm_to_component()

dapm_kcontrol_get_value()			-> snd_soc_dapm_kcontrol_get_value()

snd_soc_component_enable_pin()			-> snd_soc_dapm_enable_pin()
snd_soc_component_enable_pin_unlocked()		-> snd_soc_dapm_enable_pin_unlocked()
snd_soc_component_disable_pin()			-> snd_soc_dapm_disable_pin()
snd_soc_component_disable_pin_unlocked()	-> snd_soc_dapm_disable_pin_unlocked()
snd_soc_component_nc_pin()			-> snd_soc_dapm_nc_pin()
snd_soc_component_nc_pin_unlocked()		-> snd_soc_dapm_nc_pin_unlocked()
snd_soc_component_get_pin_status()		-> snd_soc_dapm_get_pin_status()
snd_soc_component_force_enable_pin()		-> snd_soc_dapm_force_enable_pin()
snd_soc_component_force_enable_pin_unlocked()	-> snd_soc_dapm_force_enable_pin_unlocked()
snd_soc_component_force_bias_level()		-> snd_soc_dapm_force_bias_level()
snd_soc_component_get_bias_level()		-> snd_soc_dapm_get_bias_level()
snd_soc_component_init_bias_level()		-> snd_soc_dapm_init_bias_level()
snd_soc_component_get_dapm()			-> snd_soc_component_to_dapm()

snd_soc_dapm_kcontrol_component()		-> snd_soc_dapm_kcontrol_to_component()
snd_soc_dapm_kcontrol_widget()			-> snd_soc_dapm_kcontrol_to_widget()
snd_soc_dapm_kcontrol_dapm()			-> snd_soc_dapm_kcontrol_to_dapm()
snd_soc_dapm_np_pin()				-> snd_soc_dapm_disable_pin()

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/intel/atom/sst-atom-controls.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/soc/intel/atom/sst-atom-controls.c b/sound/soc/intel/atom/sst-atom-controls.c
index c68965f152e8a..4af1e8113e232 100644
--- a/sound/soc/intel/atom/sst-atom-controls.c
+++ b/sound/soc/intel/atom/sst-atom-controls.c
@@ -637,7 +637,7 @@ static int sst_swm_mixer_event(struct snd_soc_dapm_widget *w,
 	 * inputs as an IPC to the DSP.
 	 */
 	for (i = 0; i < w->num_kcontrols; i++) {
-		if (dapm_kcontrol_get_value(w->kcontrols[i])) {
+		if (snd_soc_dapm_kcontrol_get_value(w->kcontrols[i])) {
 			mc = (struct soc_mixer_control *)(w->kcontrols[i])->private_value;
 			val |= 1 << mc->shift;
 		}
@@ -1530,8 +1530,7 @@ static int sst_map_modules_to_pipe(struct snd_soc_component *component)
 int sst_dsp_init_v2_dpcm(struct snd_soc_component *component)
 {
 	int i, ret = 0;
-	struct snd_soc_dapm_context *dapm =
-			snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct sst_data *drv = snd_soc_component_get_drvdata(component);
 	unsigned int gains = ARRAY_SIZE(sst_gain_controls)/3;
 
@@ -1544,7 +1543,7 @@ int sst_dsp_init_v2_dpcm(struct snd_soc_component *component)
 			ARRAY_SIZE(sst_dapm_widgets));
 	snd_soc_dapm_add_routes(dapm, intercon,
 			ARRAY_SIZE(intercon));
-	snd_soc_dapm_new_widgets(dapm->card);
+	snd_soc_dapm_new_widgets(component->card);
 
 	for (i = 0; i < gains; i++) {
 		sst_gains[i].mute = SST_GAIN_MUTE_DEFAULT;
-- 
2.43.0

