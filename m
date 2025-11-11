Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010049.outbound.protection.outlook.com [52.101.228.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43EC712C544
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820364; cv=fail; b=pph/DKarCNTK9fuUl3eAllukF0wxlk8dl9fRUq7E16JvxH9/YBjEDcSnGiZhhIf1g8SAS1yT3xAHudtohRa9kf0/x4E6sttWwFLEl0OJvPiwCetV7fy2JIuBIfYLZ/OTZyZn7Pt346fr+B/OIrTYXvYyoSShNSdeB4lG9oaQPVA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820364; c=relaxed/simple;
	bh=a/SXazdScxzTNnjnMHAK5hqPac8O81+PwKFPs3kbrwY=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=magKdQ7LywhGlvd1T8rDUbX0o5jdYtrc4GFN2P8oQPRqxJ6Y9YsTFOZHvWuCzoAhNZ2yVoZdQb0JIt2czszYdU4GHf2p7+iG+kPhtshCEpYp7oNa+RfaXmbb0CXFHUwQOZ2/Axhj8fB9RHAWiVfWzh5hb31fPvDN4xCfYWdA7zA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=JrjAk2F8; arc=fail smtp.client-ip=52.101.228.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="JrjAk2F8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AAbw0Etbo3Gy9yqgkkURKNcaK39tJDDSqu22avn6f7XLu5Gk4zAVA1RCid+98NeibEIqC5EaHxR+Nwjy28Lv9ykY9QpjXVQPO1h6e/u0XuMpOcvPQoKuxQzMrL2WJNr1USMOAciv1xYiYOWPilPTwcfpFvVq6dKbR/RujTOwHGgS+XuHHbLVDefShu60Ni1XqMHsOyQ5oVFThZHpGLd2pZdMcmcKuqCyFzYC3QsIXZidoiErHbArZwh+2JtAZv8C2hh+vTO4g/txGd8o9Cjf9uFOnEs0bsdKaYspNFNkx4twNuRTr6eCylEWFWQDkHVBjRUa9NWPqz5oJ3ABoTx2zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eSgSEtQCUek4087V4v+IxlJNJomOAY8LS20r5c1MUgo=;
 b=RVVHfPE62OGuuY26de5PmO6Q6udiK9kFV2uPC08jErrMWlih+DNA3NabpdYL9m8zyG0CgCu6QN4Fc9pOxeWR+nfKrvFRxWEMTVaaip3Y9V7idPxqo/0YCzjH5ZDVqwywPvIVvgoCTiW5EOM8eFSQZUh7hLTcK9UHQNj/iBMfY/eDP7KZO973jmJV1b4eCa+44Xb+qC5IMYETwKsdPvKhtFEAV8LtFZCaI8R+ojQNWFujW8hodWP2yC84q4/N2/tTp9WmEMiHsJfS6aWAidPMeFM88ZF6UDHBVkemPxn2+OF5HLmXAVqFlveurV6MM7tru5PxUgalDEydUkwI+LG5oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eSgSEtQCUek4087V4v+IxlJNJomOAY8LS20r5c1MUgo=;
 b=JrjAk2F8dP2T1g3Xnu7gVNItAWW4N20kH3XGY/ThOmoJK7arDItsN4gSt501C6q7H3Ohj5E1EuxxHEQX6AMw3riR2lj1W+kYhmXd7izyMLSIdMFEHYMRFLKzF0t56R31HFseOdPZbwtf4D+stzCbOi/mFM9BxgHpVuQp/1n/nD0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS7PR01MB14361.jpnprd01.prod.outlook.com
 (2603:1096:604:38b::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:19:19 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:19:19 +0000
Message-ID: <87bjl98lq0.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 025/292] ASoC: codecs: arizona-jack: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:19:19 +0000
X-ClientProxiedBy: TY4PR01CA0086.jpnprd01.prod.outlook.com
 (2603:1096:405:37d::14) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS7PR01MB14361:EE_
X-MS-Office365-Filtering-Correlation-Id: 43f7bbb2-ef31-4db9-f216-08de20b7f4e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?aKwkJuvhTakNVW33aUl6QtCOUDi0Do9lyHOA9spGWn9qWcS+UJKnLgxSk33C?=
 =?us-ascii?Q?sMFfD91etSnNPME+t2JZbXF30B6FKhUitmD2KE95hi2wLg7iz4ajdqr2vqiV?=
 =?us-ascii?Q?PbQd+FF5FpQdURCT6FD21kToHkRT9Ll+XF4eG/duTXhjmCXiVV8a0ynpKMKI?=
 =?us-ascii?Q?OuRuGIXf5LQ2nV74ZS8eMTshYz5KsR13DStLMY9BvxLA//VMVFcdrXQTJ/BN?=
 =?us-ascii?Q?n7E0Rz/LV8wKgum/TTqjvamAfgFlTUvoTatlsospMSq15iY5zP5Fth65TCg8?=
 =?us-ascii?Q?2B9OuUqsfEHheQAxPUn/GF1Fa02TK14BVaA50DEFsbx18gH8PguMUZl0iq8M?=
 =?us-ascii?Q?cJupDHTPeiqXPz/Kltq8aWlggDMezbBttybLNrLBzk6k4phjN2M2YIUsoSb0?=
 =?us-ascii?Q?y9KIvEmIfSUM7vIa5CJlP8zzNySjDnU85+yK+WLJdHsbDg6w8NI5BdZ/jlaU?=
 =?us-ascii?Q?oSo1XPgDf1kvNDRmi1JvHr53nZG2cNEVhrBWgpWM7DW8Sxozjmorlp5TmAU1?=
 =?us-ascii?Q?jWc1rW0ixCXAEgODxeDDYZKcEdSDxihLsDcR2DmenE1BhjYMl1GOiRUeVZtW?=
 =?us-ascii?Q?0mRm1YpTchRHE2xB1RUWbLnS0dhX9dCeZc7FRSbIfQxXOlDqbpSpeiaKKIy3?=
 =?us-ascii?Q?qNZwjBLnHBv6/eowTGU8IL8dVWs4F2r1bLrT11OOPLnnEd2+G/fqNwiUUuYz?=
 =?us-ascii?Q?udyTLLrI/Yin/VX3oeDA40oXy8WZkirD7uLxTUlZPJ3rLbFbgdL+IZx35/MU?=
 =?us-ascii?Q?xG/P/kPFxp8VukfKImHWWX92zjg7SP2YFb5L0meOUm0YAHeXUevTorP6R1f4?=
 =?us-ascii?Q?L/oFfXhbEHfN/vA9zSruXCQLLYs6SrR8SB7AnN9ayJ9Z3xHoXjWmwT5zUp+S?=
 =?us-ascii?Q?ic9B5zrrxKnqLde2K/gX4oCky9KD7iCohcrYSWYkwVEy039zfTT/8FmCWqUO?=
 =?us-ascii?Q?VN5CkjGl7WIBaKhevX6N3u1PQeOoQzwGk33mGcO7rqzqSxDUubEs645hS59G?=
 =?us-ascii?Q?SLeY6qVe7G/9q2uIvKLabZT9Bf6mbIuSnErafUc3NaKlTdjPgbD7u6TiK0j1?=
 =?us-ascii?Q?ZcqiNszJJh+u9ljyQ8AFyBUicSB1AO/BW8Wj4UOtGtwkBY+yxeu6o99fN/pl?=
 =?us-ascii?Q?U+n/UWTUnz+m8cJtuXnSLrBjFp3Y+QhBV6CpF6aKMA0ZIblGwV3Yi7Iralh+?=
 =?us-ascii?Q?8kf2rh8si3uwuie62kc9kulv0NLs+LUmxbgA/NOtDUDdsW7WcvfV3V15E9kO?=
 =?us-ascii?Q?kZOlsKX/BdgnKvDhqNIsfw+2a0aMQFVvdluSQj3DZgaVZMiX8CSRa8tERcAj?=
 =?us-ascii?Q?KX2/y6kxZOz0e0JllDqaIjzwy104Y29b6/SVWVVHlNWemZPYeoEhxh3EiljF?=
 =?us-ascii?Q?oYHNXFTrP7zCo/AbhFch4z3RYwzbGSEjPjIYdq9bo+xT1NB2/klN5ELvMYOS?=
 =?us-ascii?Q?7mJS+szl5eC0AZV8aSzBGVRqeesnIU8uWhvgrafQeuuGoKKh7UPlPeGbCVif?=
 =?us-ascii?Q?jJyHu0nciUerua5+mvtJdKoGRW/B8nya1vE6?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UZQiu+kdjskEytzqHwQwcODjAOKczDizuWP9drhcIxnkZRdi3RmyuYMu1iE+?=
 =?us-ascii?Q?L5uubxrqVPd3/J66DyiEdYGWKFHvyK2zFzz/+W7fVSNGg83UAziiRS5Brxj5?=
 =?us-ascii?Q?3+jNr26diqYHYuoY49ojnFzeLE2RTmdy2U/AW6Qq7whHYRvq21Y84YLSwKWK?=
 =?us-ascii?Q?E5L8HRkHVcX/AAIXm5lKEXTHbo/qXq4/UI4hOUY28+esvHFD2CuLCV41uOPQ?=
 =?us-ascii?Q?ZFHwnr+Cux7sTwX93DvGIfAzCarvmFbTrwwWxohBzQvPYegz/MLTeB87L6/r?=
 =?us-ascii?Q?sWoUgxIFQUSyZelVbNP76sKKwoUxKUVejn4J8cKnsl/pUzTW8S7I6eK497Hz?=
 =?us-ascii?Q?Q5x3SPvdHROZpYCD0iCvS9ffuP+R4mPOeGRI/aSG6XvZ3VnPdECtneyigPuO?=
 =?us-ascii?Q?UrCA41CUf9ji90nOnM3BF1fpvKGFWGQWE/B+VxmJKFgdOpJcCazD3ANNziYU?=
 =?us-ascii?Q?BP5cBxDcwMSj/OZ6xi+cUQoZSNgI4N5oyasXeBFU2kyKl+ASDldOybqvXC2g?=
 =?us-ascii?Q?8Nsed+sPtRsAbz74+vIs1p2Bj4FifOYyF1uU+ptsvNBZgmGKt65Rds73BQMc?=
 =?us-ascii?Q?Ah4z7nU7lBra/p7J8lO5RtuE1CVwo1jSwAKm3iijYg0A1vEz5AoRY0jAFyJv?=
 =?us-ascii?Q?aPdrf7Y+GHcACLAwvgJBAahoWWcw/6sYTFDqkWYr0Y9FT6FIzf6AeiFmypnI?=
 =?us-ascii?Q?E0pqi2+ABzuP467t2rVRsi69dKmrle/FTQTSOfvFx/W6JaL6tlJBAVXse+Ig?=
 =?us-ascii?Q?327MIBctfRJ9BXYp3nOZzdkzhhc/3MrS/yMF3AimrZNSbTPRNTGXZlDvtlQ3?=
 =?us-ascii?Q?WHwcqwlee79a6if0HbDZS1yJzN0u7tqzvT1QYNJ8N/mYnzpUE7ktF6XYg81e?=
 =?us-ascii?Q?ege6libus7w7wlvgs5qgV+DDhXMv5gbUdkJkOxmUkEKLa+wfA8Nj52M9m4NP?=
 =?us-ascii?Q?urAULnuUh8tJFdp9W70K4MO6hw4xEnOGg3AvAcfDAuxNLolAOPPH6u1wzsC2?=
 =?us-ascii?Q?itbSEFoldI8dojHdstTzScuFOOU+xqmx1xJJmnc6ysLxrfzCKHq1ugnx6LH/?=
 =?us-ascii?Q?wqdeEIlFp1AtEd28lVOJrT4guyjH7CcESTztuZgLdNM1kjoNlDrUSDVLG2li?=
 =?us-ascii?Q?WGyWUCTkUuZPpruCXCn9Qxcz68sllZG+dAnkC7/QXCQeAVMgyT8W+ZagoFUD?=
 =?us-ascii?Q?IaRCk8cdtWKpjcSWtzBpGFCiRs71cdUwfIGHbjPyDsQE663o67x3ZsY1k8Eo?=
 =?us-ascii?Q?Xs/s8S+j2c0JANznHOThutEr3AVOySrXYylmWJioSRvaoD7c0ZJrSTOlLcjO?=
 =?us-ascii?Q?UyWjMNVA4kLmTX6lkDAO7lFegv7aKM0HJnvZTSJXV5NubjjFzB7iUOxg9gXo?=
 =?us-ascii?Q?PyGETk3cbIl+edfhi4GucouYkQyRyyaUR3tMcB2+y0b/9UcsVoEyvJeZKJt4?=
 =?us-ascii?Q?rQj/fLe6Qp+j3V7ciTE6Vhz4dLOkkK8ZLMb+FRITEOHi4HGMzymaz6jYqUfc?=
 =?us-ascii?Q?HVGIuuVH5xkVk9EgGn3OsxQ+If2/+bxe3VLPgZu3PPl2HqwJXba0mU3ebLNw?=
 =?us-ascii?Q?kW21FUAHTWpJ8VVx96ypmKkBDbYSJlvJQKdgScwfNLyhbfScL2r4rDHRtcoK?=
 =?us-ascii?Q?RxfHRdrKRhOUq7uA/whzQAc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43f7bbb2-ef31-4db9-f216-08de20b7f4e3
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:19:19.4138
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G4U3LxnzHBfddCTz/tXXmN3iQmibpRfN47boqSVfQ8bfB/AZK8rP1d08JfG3HiTCedGC2Dy2xRMe3j9PlRvzKahf3tgyMdiFaitkMNBZUqx25Tx1eD8z5xCgVCPcV5AF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB14361

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
 sound/soc/codecs/arizona-jack.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/arizona-jack.c b/sound/soc/codecs/arizona-jack.c
index 6b55610ad535d..303c1d44ebd8c 100644
--- a/sound/soc/codecs/arizona-jack.c
+++ b/sound/soc/codecs/arizona-jack.c
@@ -212,17 +212,16 @@ static void arizona_extcon_pulse_micbias(struct arizona_priv *info)
 	struct arizona *arizona = info->arizona;
 	const char *widget = arizona_extcon_get_micbias(info);
 	struct snd_soc_dapm_context *dapm = arizona->dapm;
-	struct snd_soc_component *component = snd_soc_dapm_to_component(dapm);
 	int ret;
 
-	ret = snd_soc_component_force_enable_pin(component, widget);
+	ret = snd_soc_dapm_force_enable_pin(dapm, widget);
 	if (ret)
 		dev_warn(arizona->dev, "Failed to enable %s: %d\n", widget, ret);
 
 	snd_soc_dapm_sync(dapm);
 
 	if (!arizona->pdata.micd_force_micbias) {
-		ret = snd_soc_component_disable_pin(component, widget);
+		ret = snd_soc_dapm_disable_pin(dapm, widget);
 		if (ret)
 			dev_warn(arizona->dev, "Failed to disable %s: %d\n", widget, ret);
 
@@ -287,7 +286,6 @@ static void arizona_stop_mic(struct arizona_priv *info)
 	struct arizona *arizona = info->arizona;
 	const char *widget = arizona_extcon_get_micbias(info);
 	struct snd_soc_dapm_context *dapm = arizona->dapm;
-	struct snd_soc_component *component = snd_soc_dapm_to_component(dapm);
 	bool change = false;
 	int ret;
 
@@ -297,7 +295,7 @@ static void arizona_stop_mic(struct arizona_priv *info)
 	if (ret < 0)
 		dev_err(arizona->dev, "Failed to disable micd: %d\n", ret);
 
-	ret = snd_soc_component_disable_pin(component, widget);
+	ret = snd_soc_dapm_disable_pin(dapm, widget);
 	if (ret)
 		dev_warn(arizona->dev, "Failed to disable %s: %d\n", widget, ret);
 
-- 
2.43.0

