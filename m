Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011010.outbound.protection.outlook.com [40.107.74.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB70226CF7
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762821261; cv=fail; b=DBBTBMMpYaFRqfmi8XsSnf7TUARpx6uNOh6oZVHmBnVX+pp9qYOZho/oZDjLt371stOaN7za2z/IXqZ8ymSDCdg+a8SMyAqhAhqtyP8zRuRU7V/VfAAEVJr1SaHwUXjgX14D56KkgVLMlbOMauuqO0N4IYqLYFHEik+SQ3dOVJk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762821261; c=relaxed/simple;
	bh=f74X8wwb2U3T57ood27wsnzNZ7TCELe5/xpSaYxPnKQ=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=qqLutKMgI791ewdMf7dJFA4On6gHi6KIIS8rlxMa9aA1WYW4DqwT25KktHlLOiSnzGTwdO0x+M2JDcgobgQj2TY9+8Fs6GGzEDAbzq/mJdVdH2p8G/F4jCZ0X/ySMDjIZC8AQfyP8/Cs1LsVvkJIGIV7O403Ayu3KJyDvZIARQI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=X92iYfD1; arc=fail smtp.client-ip=40.107.74.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="X92iYfD1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TphI4kB+9shrZ2yhue3ZqV6gMV3V5s88umA0RpE8tSCTnnrXWNZww0CQq1sfmgcMG7DM6NS5enWnxWacXOSO5Romp7PFBTwSFRt+yQeCwuwXvkD/qrd9SSmrVzxUOah7WcTAHlRfhwpuNV2y7ZUizJ2d1xXGqraqB5zoH5HSbAis5ujQ2uCOd5V5/0nauLblN7Ks+gx/D8gglDpn1/Ss0CT2sePa4E+D851/ENxGX65Gf5CasDZmT3A58Z+epvWaMhQIJizPy6+580yhEF97RphBrgEKj1s+ZkWNbMYFksz0YODkND9XKO2r8BcqORiht5+LXaKAOdSiTl97KeZ+ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q5TmkkxO6RT2JeRJ8Vr8kGQIk8ObBetL2GuYcFFMsLU=;
 b=NCo+lWDECj0jx0EQkI2IACzBFiNbolEmyc+DXkYrC8YD8Wsh9IWqKRDk5EyuaOVC01Zt8Nt7u2OiyFlVtJT059ypGVHHtkf5D2YtS4iiU50dS05QHD6BLR9nhQJjdXQj02RSek5bZKs8n8Q9fxSGPce18UCz2RyMSZP6ae/dA1qpZSjkiPHmUxlvyBJeuLw+ApEuFOdAUb+rffT7i6lL9B7ycOfz5zfMnde/tSi4s5iydrBeLlDj5WM8MY0IXSzOr6jw3o2RhkF4E17k8ZrIv29QsuZbIbZPgoIsSbgpNb/miF1RXnS2kO1Px+CgYo97aMWLa+vBRwbbhRoe3Fz8VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q5TmkkxO6RT2JeRJ8Vr8kGQIk8ObBetL2GuYcFFMsLU=;
 b=X92iYfD13T3Z0rN4Ozu59BmROORgdVRXZu9KWvPwdzkE1EUrcMVc5UB5b5wLf9+FfP23Aw9UnFcgGg/pcUJLXF9thWfkKVtVrqGRT1ckcmGk9EH3Ge2C/9QF9roqijyJvkIc0pTNOIG/PemiFqlUSGbAL/79Q+BaRm2KPFrl14Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYYPR01MB12531.jpnprd01.prod.outlook.com
 (2603:1096:405:19c::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Tue, 11 Nov
 2025 00:34:17 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:34:17 +0000
Message-ID: <87o6p9v246.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 241/292] ASoC: qcom: q6routing: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:34:17 +0000
X-ClientProxiedBy: TYCP286CA0171.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c6::6) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYYPR01MB12531:EE_
X-MS-Office365-Filtering-Correlation-Id: 13439cf1-8dfa-4032-0b58-08de20ba0c61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fxHR4XeWuDfAMUCAg4lHXJ8uRLX6a1We/uvvlVHyxlxNbmvyNoIoS3HDnF08?=
 =?us-ascii?Q?YBVvsBZGG52t49D8RGv/bY1b4mZDth9SQVaBV3HG9BmcsuVH0bnHvsmcaGVu?=
 =?us-ascii?Q?W9YwaWKq73qHfSUWP4thBKNXJXLnDnLc1jiDm+1i1C2YSaK6tnZwgLOZfsQX?=
 =?us-ascii?Q?Nj1A8+twd9oh+kSnfzuJmSSfRsty00oPVNWh/7i67b6gJHLJJF/e1mQvEXzg?=
 =?us-ascii?Q?3UbLHNvKu3J8km/VvKyGCIy9ixVePNJZsMU5XUpskDTLoAI8n4WNqqjr32n5?=
 =?us-ascii?Q?AB0343ylK694fEDj0orFlfXx14uy4hDMdyz/2b1Hmo2xvAysI8zupNoZV7zK?=
 =?us-ascii?Q?rLicsJedmm+GpWZ2UAtI4DRPaXJuC7rtmkXaJwKhkxWNOgzaaU2xnCSWwKpW?=
 =?us-ascii?Q?GKljJ9MlUAQyQy7bdAcZBKXMMpjGR6f/8F1U8QF19B5ytH/bJ+10apXJa1i2?=
 =?us-ascii?Q?wX7Ifl9ElaGDdxUI8MLOxOUc1cQQZ6vx5xfiu9B2UTPZxK02d2wvd//qIOQo?=
 =?us-ascii?Q?0EgVO3JSftiN/Yhs7Hwp4x9XcvjdqhAqPdFUytLhx1v2W1VlNsODdHKplis3?=
 =?us-ascii?Q?LGxYb0QRQfCnbOT8vCCQRDfdavlwBEt8OH/KML8/t1S0iZXS2HiEds6zolLN?=
 =?us-ascii?Q?7DQjZ3uMYNYNkOO+5i1GG9THfQKne9Uv93zkDecS8D/imYKs6khwuLpKG8hM?=
 =?us-ascii?Q?GhZmBq8M4SVTpYofQdHS2KG2FJaypKke2OMUnDcO9jd8D/e5Xu4J8CkYW46T?=
 =?us-ascii?Q?ezPkZZWdFoavtLlYpJFw5GwjX4mc9rw+/Uv1vqf+I/EJOPvIBEhe5Qw1/MZJ?=
 =?us-ascii?Q?iDGHaQGT8dANbD/2TaginHH2XEReiKxHw4Q7B9K6xEYWrFfTjdRn7zfFrZqE?=
 =?us-ascii?Q?HoUJeiv5euCsdktSLA/WMalyLRGx6n7vonF8qHsEC4YdK6Ze1QEjweIrfZPS?=
 =?us-ascii?Q?805ROPojZE5kVY6QgWpzlhYzc/zspPFVHXgtWIxwAeupEjJz1RrjJnA4PEfv?=
 =?us-ascii?Q?4Vnfj2RiwyUy5dqztC+CwUtxSyb1uDAUXN2FIio22nt+Lzmns3ux6xSlAgSJ?=
 =?us-ascii?Q?DRiiYvY5SRGmiK4bZoANsIjKVXGeOg8Cfudlks9qlbqXEJ8xjV063MdfErJx?=
 =?us-ascii?Q?/+/Gr/COkQQudQtcn48HSbw429mhZFnMPdam9Ba6PyynPugYgRpUxRFZ6a8O?=
 =?us-ascii?Q?mkjxI+iJaN5qIRNKQyoBW99Iw9Hf4vmROBPnptONOW3EzbO7MjidnhJ3T2YF?=
 =?us-ascii?Q?5DakrOsIYhWCEgKl61hsHA+bW7iTbBrkzXagFJJq3epaMyoxNOuv+m274Y9i?=
 =?us-ascii?Q?5ivlADGh/fchRaM1vALXXhS5RG7RfyUb27asgoNoz4YRFf+4rPk4PdsI9zfZ?=
 =?us-ascii?Q?BN9ZWfvmqcF4RfB5CiXOVOzEbnG6OdMN5ZCVbGJi3oMhE3TH6/unU0/oMZhj?=
 =?us-ascii?Q?3HcWIpClZXYIZJEQf1hXhph4zR3LmugCid3EyNJ4mdRTuQ5mGFxRfhEHCzHR?=
 =?us-ascii?Q?Vgh6nVSdDRk/bsGOxQVhgogw/M5VP8lygg5k?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?R3Q/NI7LR0Kl1zVJFVCYenzagXa1P4aAPVNuQdfKLt9t4E2nyvZwJApLZz+l?=
 =?us-ascii?Q?AkoQoqO+xvOPDcDnh7v0+ounrscUuZFh/vodLxHbJ/MMmVeop3LH78Xog7zC?=
 =?us-ascii?Q?sucQjANeK7y+KjLRrtgH/9fSCc94eO0hGTbdsIE+8BT8TRcfDkdctG43nUp6?=
 =?us-ascii?Q?lReU9CkTO32LWt1cGMRBKNILAAS5bqxUamQnMOIlHexITEh1d2NcNnmlWbvp?=
 =?us-ascii?Q?7PAPLE2vB1cRl8WcMvrjLd6QYn1+eERJMS7phLCMH0aDIK/inEzL173BNM4D?=
 =?us-ascii?Q?1cOlU/iJDo/aRJYNugJcKBVkHLPbuXSMyb6mCxDc9Rhfvv8hlpge4n5cv3H0?=
 =?us-ascii?Q?sL6C4NH9LKz3z1FCWy4QGTsbp43MHfaMxF8loyW6Tv//nFJzpdxU7Tn6Uy8V?=
 =?us-ascii?Q?CtIqi2U0R3TwTYh9YP72f7Dvxz1651J5kP/v3eUmDzQLCJj95swYKn2uz1fs?=
 =?us-ascii?Q?2aAtHOwlz+S/ZhVUOXvy6O3gaVtViMEBNBbiwctPjb9XCF0mIU1KVcveIJtH?=
 =?us-ascii?Q?WHuduRBgtDGDvTYJnDzP+C8wQV4W/dQXSCOqBc9izDCxIdjrhDr1N9cli87M?=
 =?us-ascii?Q?0RY47ECpmejshW+MmWiG6MdBtbCKdojeBUTLCELc/MoGxKsdl8QQycQTebx/?=
 =?us-ascii?Q?5QFSo4B730GXqy3k/83cPbqrgavgmiADk0vJdPwIIgs6LRPJWV8GQZe1Lljd?=
 =?us-ascii?Q?GK6xFEkiNdhrpqLQ457CfQx9SG+C7YfnmWNQom8HamKR0wp7yMVh0qjmkocW?=
 =?us-ascii?Q?FHt8rdVmO7I6S540UsSRkigFC5Gm7oRMNzOve8w9aGsfEDBwrrZHWCeR8/Pz?=
 =?us-ascii?Q?1A3FOfOwEcjSVaZUsXDGjE5+UfeSNM/A1xSOGzmDnnOBt3D6G2vvKoUi9q6g?=
 =?us-ascii?Q?R0jZi4ccBOlTSJIpSdHueTlpgvxFRfg0/JCheW5z9BcQKJjPIF26o740XGPR?=
 =?us-ascii?Q?Vom4SDGw5NhfbIOhnZhghBOsF92or3s3BzDh0yqSfJfJGdgASk0YcY5qLAF8?=
 =?us-ascii?Q?xZyp9KnHv8/kxl1CNr2WClOV6+Bc52g+anrEzFNMCQN7QfTwhNxhnTuvCsw+?=
 =?us-ascii?Q?eydciAX+RMeTawFs1pcq1BjuVW47ApSkaSG+38CpXuVxZaeTIEJrQdkdx688?=
 =?us-ascii?Q?ACcqZWSPIH+UNR5dajuuoEU85VGh3Hkh8DN2IpTUoCRR/1z27d0GGXQmER+I?=
 =?us-ascii?Q?C5SB52Zosa8iMKuVBvzKD4vuartxXBdAD32GF1e+XpMSqcEryZpdKpbPCeMY?=
 =?us-ascii?Q?SrWzwpIrpilnH/Y7s54idn1M4gCN0p3XgDcgtkhdaTCYt2p4qKghDZKSRe51?=
 =?us-ascii?Q?NBRLRGS63WEV+kt+HKSGwPWcs2bRKsoJU5LpCQBNu74ZDpXZ7D4lhIYqRl8H?=
 =?us-ascii?Q?wD+3rautARz55p2cIXA2ZsYMc1DbAHbnJEEj5H4h2h2lhc50YXd9Lm9m3ayJ?=
 =?us-ascii?Q?L2p9SigGUD83sMBe35GKSlT0cOJHQOXFxE/jehA4c3GueMjNiW9q4TApwyR1?=
 =?us-ascii?Q?TEE/2wIHaHEy/3ihpmNsmK7xiy6oBCn1vEu4EQF+CdJa4VGVTmFx4zW+FIU0?=
 =?us-ascii?Q?Oywy3PxYSkBoTA94xsMuKNa63SQBi+fJEAgs03m2z6PQMeRD7y8thP/X1KZw?=
 =?us-ascii?Q?f9nIiY+bgwgA1kv0AZO+/Zg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13439cf1-8dfa-4032-0b58-08de20ba0c61
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:34:17.7924
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V6GxGIachaq6/w3e6di/HkIJ5GyDgMC7Xu3M1x/b/gmlSV0B9Gh28n2bvyezIR69CRz6gpI9qpecG7yyyWM+MtQ8bgKeYulKw1GqLaRvzXDTqrnvucsB087MNBjMZIKl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12531

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
 sound/soc/qcom/qdsp6/q6routing.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6routing.c b/sound/soc/qcom/qdsp6/q6routing.c
index f49243daa517f..aaa3af9f19936 100644
--- a/sound/soc/qcom/qdsp6/q6routing.c
+++ b/sound/soc/qcom/qdsp6/q6routing.c
@@ -468,8 +468,7 @@ EXPORT_SYMBOL_GPL(q6routing_stream_close);
 static int msm_routing_get_audio_mixer(struct snd_kcontrol *kcontrol,
 				       struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_dapm_context *dapm =
-	    snd_soc_dapm_kcontrol_dapm(kcontrol);
+	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_to_dapm(kcontrol);
 	struct soc_mixer_control *mc =
 	    (struct soc_mixer_control *)kcontrol->private_value;
 	int session_id = mc->shift;
@@ -488,8 +487,7 @@ static int msm_routing_get_audio_mixer(struct snd_kcontrol *kcontrol,
 static int msm_routing_put_audio_mixer(struct snd_kcontrol *kcontrol,
 				       struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_dapm_context *dapm =
-				    snd_soc_dapm_kcontrol_dapm(kcontrol);
+	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_to_dapm(kcontrol);
 	struct snd_soc_component *c = snd_soc_dapm_to_component(dapm);
 	struct msm_routing_data *data = dev_get_drvdata(c->dev);
 	struct soc_mixer_control *mc =
-- 
2.43.0

