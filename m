Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010021.outbound.protection.outlook.com [52.101.229.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA0F307AC7
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760415628; cv=fail; b=cTclabP5CuKk7RELtKWVZ+1JkFYIZLQKyFoC3JK8QYbQpqFanl2Ilyxirznp8EPQH2aiZoD0i3tm2abCMC/JOut6rzK32uAC/j5z67cYVTrdUmptbsgYJNKnBQOPyDRxZaaY3w90sp3PAObsFIvDaLTMbYCfZB/TL9jy4Bd9NYM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760415628; c=relaxed/simple;
	bh=RzjOscXseuKEt6KXu+5SsxfoczbyH+z5kZ2UqyPjExo=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=o9vHf3soZInwUUB5SKs3n3TLtB+ty6PnO3L5dnqfJLnExZhYFwzxEITtqo84UGFzZ7xLOAOylWVQLPUyp4me3PugpNfZXaJq51l3GshA2/r3eNEQnwPfgYrT3r3mox4Nv0Ux5mx0uSKG2Lz+DPnUPYhysDP4DxusTT7TtWRd3e8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=p7CyKFl5; arc=fail smtp.client-ip=52.101.229.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="p7CyKFl5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sH5qEIUUDYtSv15tbdZ2SORdux3BdXcBw5uDx3tqi8H4o3+h3rztadsL9sdR9n7yiXEp6WkdMt3LIvI3xqDVfirgL1YiXffPsm8kxOKMur/Dip0yCor9S37R6sgRb5/NOexuqwDtWWq5ZPYfQeAnigvmJ0S3gRflpywiIZbriP+7bbFXxA4n3U4eCizm5zrYZ/tFS7OLp1ryYMAh/3A05LuzoTLUBWTqXOC/IsubvjIxtHPOPgAk32/D2J6pPWMUsXl+sGUVimtkXU8Xx1E5tauhxkfRIJqK4ER+9gMuF7QleNukIS1DpyqXoNbN3ycZnz5UwF+YlIvFWq8RjHzjUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4/RcBHGl6tr5uyrz8S1Fb5EE2Z7YzyldGhp0Hx1ErM4=;
 b=lcbQrsLpZpG+pO6GPC879fmpwKZGR1veE8+k2/sFx6bqOMH5+8pd7m94KpxN2QfHkq8uo9tkVWMvz2DJ7V+wW3ZlfsvWwNafxX2McIshoCTzW/IURNkketz7cvYRd4b6xmBvBrw1lseJpl2BVt9IjdfbUT7u1aqb3uxgKzJJqzmHLdLO2LVnSeQ2+WWcQfWY2IdkD+WUHD6oEV62wNzZ/AERB0PdQqJLmAeVcy//9om1WfBCAEe/d5yluMuqoEJzXaSG+VXHh0Kg8BhTYMUfXTaYa0dOeyukAd5o9EI+S1DLOWaasd+gR9aoCgrRNdou3ffIKrTsnXtcFiz6AB9NCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4/RcBHGl6tr5uyrz8S1Fb5EE2Z7YzyldGhp0Hx1ErM4=;
 b=p7CyKFl5yFPvmrKcwE1vTbcFX7jxHdRH9exjYAigO1fnnIPNkAfM+tu8rhgCJNnGxczJl83Rt9z0VCbkYRV9HXWHmwZJ7QJkqLAL+QnMsHkvbSPxZ0aaXEwB5PQNyJgjRP/A87cp6TZ1cowmiw3Y0IQ1MT1Ci8VAlVM5m+gA7As=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB13923.jpnprd01.prod.outlook.com
 (2603:1096:405:1fb::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:20:24 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:20:24 +0000
Message-ID: <87a51ut8qg.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 015/139] ASoC: codecs: aw88399: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:20:23 +0000
X-ClientProxiedBy: TYCP286CA0010.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB13923:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c7d5b6c-2e3f-4439-b193-08de0ad8fedc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QA1Ouis3KT1nEtTTef4oYPtMDLfC/oSzcJ83XxunhpjF7rgq7kVWA5IVDtBV?=
 =?us-ascii?Q?shY5Yaw1cARFj6MHdaujI/lqLJRP+Vr9aRYaRmvXuNQkIgnWT9suLf/gVzMr?=
 =?us-ascii?Q?HeirDcynnJ14uidj/4W16ERgNsHZwXmS3VInz10pePv1B5yFdcqTSegO1aAX?=
 =?us-ascii?Q?QAd0g+Ahjez+kVdNUm8AMGPULXKvau25UIdb2JTy7CICsNA+HE9V8e3APWgz?=
 =?us-ascii?Q?lnkUv/Ypd58LFFR23z2RoNj3LiVua8YOGDyrCSvgghDmd7a25LSZdKS007xU?=
 =?us-ascii?Q?AHHZbb7LUNQ/ZK/HGyjj1c9aMS/Ckk23rtNppg/CMzkUqUfb430YjM4EuhUn?=
 =?us-ascii?Q?4Jw7usB1JzU2NerlzgYCbaPq5SzY3S/VAs87VQVqiaB+OlTlgvRP2RjNWZo5?=
 =?us-ascii?Q?/AxB8/EIsmu3UFzaH0HQ2dzlIDkYzKXO/eCln9BlkEamoDpE82Chz/S4sJ0U?=
 =?us-ascii?Q?stnajSFHYul18p6ymFxLTHsif3odUO6E1NshaIQS4nEniNtndiz3bi5I/0+D?=
 =?us-ascii?Q?IBGmnbt2ONjfy6zGJ8F3yp7LYdzigtVKnaCH25SAAlBgseWN6L5fW2mtjSe+?=
 =?us-ascii?Q?WI2jzGUeZVmDyN25m1rKmo8QYxCCQFA5SBp1IpX9iUKfuAArhFQENvbH2Hgl?=
 =?us-ascii?Q?mrcvwB+N5DsWXY+Cv4iuYknmyU5Y6/ijXUWwb2O1LynAwwgP1e9Ynt2iJVPn?=
 =?us-ascii?Q?Yw5iiBdwGFBDlwsrNO4XqGP+V6ejzV047gCpEfnVn61REQ1oq3lFFRB6R7ix?=
 =?us-ascii?Q?V6vlS8YVXDm8UsBIw5/fEqJDWD1dkGe8HU15lshRkna+oQquQzwDFppOUJc4?=
 =?us-ascii?Q?DJ5gX6gv9gfvgmgBsRvDS3NiALL1z5VEOFPCDZrtgixgcKQUf78CDFUqTgQ4?=
 =?us-ascii?Q?KcLJ2ccVV+smFxf3jDUVWLsJCSMg5p5LobAUnoUNflVqo7Ck/Zs0ckn25rje?=
 =?us-ascii?Q?xCB6CGxXLZ2+tho6ssFbgrI6RR2wGbsP/swV8bYX8utWFodlcWDYFiTYmt9w?=
 =?us-ascii?Q?lNUapV5ZNyFFdY3XH7KNwSEMGfCfkru4TNabSXqbKtfLTAUQnx7z8UzzhC0+?=
 =?us-ascii?Q?kCM2j82VwXx+6qYrprFN8iNland5fVgxXOOhGIUITEVz3eXBogtq8tb3PIHh?=
 =?us-ascii?Q?6XEowxAFOBuL2Pfh+6o5UC5rUsM8oGiV5zUZHitt8okvk91nYju5H4OjpsNq?=
 =?us-ascii?Q?6nkmsOejHEufUcrGh3FMO3R9jDEjQuzwjMi8XxaaYLNpvVNr0fdIPQzH8K82?=
 =?us-ascii?Q?OpST48nvubGDtUsV50b1P4STXq2b93wAPtdsYsuuDlKziASdQ6aoF48uCP37?=
 =?us-ascii?Q?D44gl9xJmp6zH3M3rSXcgluixe4woW8gSiF+oU3znsme8k1HYLmu1PojsVtW?=
 =?us-ascii?Q?lLK1UzEAxBFEGVrWKzJ61zlBGGcQkVKYmZMRq4eoFvPr0+nbRnUX6L+A3WBz?=
 =?us-ascii?Q?O+8VEIdWA9cPrjPHEOFDABrTGBVB/k/3GTwGznk2hiDHGB6kaZU+8SACwIny?=
 =?us-ascii?Q?d+/DdF5OueRw4WcZtHtBYmVEgYg8fx2QwfBc?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?eEKv0HV9oNcZ5k2gkcAxeOFsWDGk8bk7KB2njtm86Vs42EzfGyM08zSvRPXk?=
 =?us-ascii?Q?TPUeZVZg/t7h1f+tAK9Y4DeAUNUjjg8p9NDAP2hw6TT6DjryrbsNhqLWcwof?=
 =?us-ascii?Q?ZJaSPDLS7ZwJqpQUQTjfqZDFHe/+b+u5kw1ewLQgggIr58VjnWKQwUQJ1psK?=
 =?us-ascii?Q?vWgLQGpj4dL7w+OqVsD9Zddw9CxoXWr49kif0G8VRldM1OrtTCigfhxPbNi9?=
 =?us-ascii?Q?qNMuI8JcbCDdEvszmjG6DN9h0lWU2maeNZuNbEPt4LUMDBjQ8Aes6UR4WOFI?=
 =?us-ascii?Q?P90ABr7jAw/MSM5u5NlYWjYq6nxqG8AAqAVe9H5sqN92BwAWGkL0Zk6jsDcC?=
 =?us-ascii?Q?LGAw3lOXaRJmvX5hJeqrIt+IoMwwLXooHYJaxh0VoAVbqnwwSKZ/Tua3rB5+?=
 =?us-ascii?Q?u8pN8c+fT7xkxtzVLKdJmvMoKCxKgJj8Cp3lBuDA75XbewskfF/Dp8JzAFDi?=
 =?us-ascii?Q?5vNjGYxf7rMbcNVUFNyxvLrwKcfwY4qK9GSKZzDx/hvSsPsWNwB26NWCGWoS?=
 =?us-ascii?Q?YADdDo0TayQ9Mqzqq1tmSWmC+oXN9eLyEsgL9G9RAxMSLg1WcxNzivkhX/VH?=
 =?us-ascii?Q?fJHB7VWDqj6KnmMGI2fVAkVF5nYWZDAl9sYtZKpS3KDG9ME39UP59yv14B6L?=
 =?us-ascii?Q?wnXZ7MD6LN9raBEYYiV4b2uGZcqiNhP+8Y8457znORjVNWkdQgZrqBn19JvX?=
 =?us-ascii?Q?JkJXMEajm5gfknDBJi/k90ORsbSS08iG7HJx1WRBwsDa86RKAXBa/XFT7f7Y?=
 =?us-ascii?Q?19ckycVGSA00IWsSndhrDs94ltxKFy+aUDOApLxsatCyJCERiqbjOj4koyCz?=
 =?us-ascii?Q?2Z7SQkHdG3Tw/RPPOFn5XOciL0KPTo4TZ0QhSkcJXkeRrv5o80fvTIF8M3fN?=
 =?us-ascii?Q?DZROGKGytvJLOmTOji0qf9k06TBhompL8v6M/93wdtNcAZtg828BuFJfc4ln?=
 =?us-ascii?Q?l1oYYQ3h9p2r8g+3YFbDKgsMykymcQLBGsDiJIznoQmzKJ52kKacuEuTsKrA?=
 =?us-ascii?Q?x7vWcEVpygjUQilzLgIddgBeSdz6bKiGp2Rc2YKcXk45XE7KrAjtS+68nKed?=
 =?us-ascii?Q?stmDDy/qpNllfOa+esLS3ReZQLpP38j75Ble5lCoJ9z5+Y/hm6OlhVaS3RTJ?=
 =?us-ascii?Q?zMvW+jBTGhSwsXODPPXWPetMT+mg9honnH9ResBqefJM7f+CTRHXVDBQQSW1?=
 =?us-ascii?Q?qWh9WZE23pP509WplXuVEp/yVvLMktyeDGYWvo/oHyxgoZbrL32O4DpOxz6/?=
 =?us-ascii?Q?ZGD762h/fycjBpPgqUJozpjOFR42wBuMDaiyZ4dDY7+gALnQSFwbSDK4RacC?=
 =?us-ascii?Q?TH/aO4lWuzxom5V1/c+PyZHlY8pCR4KMT3zXHlNLZk0SiyhgfX9yio6sSnyo?=
 =?us-ascii?Q?EHCN2ySS08xFz5WNv68uk0EAkDRxgpYlOnRNAKUfJztyJHap+3m+FpQukG0y?=
 =?us-ascii?Q?c7qwEJHwZ9q4uApbiGSG44winJvfpok7OtaEQXQv+DH3A+SPxpsF2GTOycSf?=
 =?us-ascii?Q?Gzs4y2KOfYYLT9NTXdUPVtFjxByb9ULghXWJlUvZsQrxC5AqvpBY/3XBBpZ3?=
 =?us-ascii?Q?D2poyh4ettAUeuGioYYg9/43Q4HMYkpgWhLKe2x8H1L/W56hp6etKMZd2cUB?=
 =?us-ascii?Q?/vNWm8zuSDwyngCRqs+7zs4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c7d5b6c-2e3f-4439-b193-08de0ad8fedc
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:20:23.9668
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BOQMlP+X4Ov+LUSF9V6yKzV73FwQCFzTmy76oFvo3HOpcIvbSUXPMXI3ari2KtOgXxLPflmaXkuiyAmOl/CACpqRnBVJoiYZ4Ui+DHp1uJd6Ob9yV0X7RcbsF0H9e7wi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB13923

We have very similar name functions (A)(B). Both gets component from
snd_kcontrol, but (A) is used in callback functions which is registered
through snd_soc_add_component_controls(), (B) is used through
snd_soc_dapm_new_widgets().

	(A) snd_soc_kcontrol_component()
	(B) snd_soc_dapm_kcontrol_component()

(B) is using very picky way to get component but using it is necessary in
ASoC. But (A) is just wrapper function to snd_kcontrol_chip(), and directly
using it without wrapper is very common way on ALSA.
To reduce confusions of similar function, let's use common way on (A).

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/aw88399.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/sound/soc/codecs/aw88399.c b/sound/soc/codecs/aw88399.c
index 58846feb013d1..b29d76cd8640b 100644
--- a/sound/soc/codecs/aw88399.c
+++ b/sound/soc/codecs/aw88399.c
@@ -1744,7 +1744,7 @@ static int aw_cali_svc_dev_cali_re(struct aw88399 *aw88399)
 static int aw88399_get_fade_in_time(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct aw88399 *aw88399 = snd_soc_component_get_drvdata(component);
 	struct aw_device *aw_dev = aw88399->aw_pa;
 
@@ -1756,7 +1756,7 @@ static int aw88399_get_fade_in_time(struct snd_kcontrol *kcontrol,
 static int aw88399_set_fade_in_time(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct aw88399 *aw88399 = snd_soc_component_get_drvdata(component);
 	struct soc_mixer_control *mc =
 		(struct soc_mixer_control *)kcontrol->private_value;
@@ -1779,7 +1779,7 @@ static int aw88399_set_fade_in_time(struct snd_kcontrol *kcontrol,
 static int aw88399_get_fade_out_time(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct aw88399 *aw88399 = snd_soc_component_get_drvdata(component);
 	struct aw_device *aw_dev = aw88399->aw_pa;
 
@@ -1791,7 +1791,7 @@ static int aw88399_get_fade_out_time(struct snd_kcontrol *kcontrol,
 static int aw88399_set_fade_out_time(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct aw88399 *aw88399 = snd_soc_component_get_drvdata(component);
 	struct soc_mixer_control *mc =
 		(struct soc_mixer_control *)kcontrol->private_value;
@@ -1829,7 +1829,7 @@ static int aw88399_dev_set_profile_index(struct aw_device *aw_dev, int index)
 static int aw88399_profile_info(struct snd_kcontrol *kcontrol,
 			 struct snd_ctl_elem_info *uinfo)
 {
-	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *codec = snd_kcontrol_chip(kcontrol);
 	struct aw88399 *aw88399 = snd_soc_component_get_drvdata(codec);
 	char *prof_name;
 	int count, ret;
@@ -1864,7 +1864,7 @@ static int aw88399_profile_info(struct snd_kcontrol *kcontrol,
 static int aw88399_profile_get(struct snd_kcontrol *kcontrol,
 			struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *codec = snd_kcontrol_chip(kcontrol);
 	struct aw88399 *aw88399 = snd_soc_component_get_drvdata(codec);
 
 	ucontrol->value.integer.value[0] = aw88399->aw_pa->prof_index;
@@ -1875,7 +1875,7 @@ static int aw88399_profile_get(struct snd_kcontrol *kcontrol,
 static int aw88399_profile_set(struct snd_kcontrol *kcontrol,
 		struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *codec = snd_kcontrol_chip(kcontrol);
 	struct aw88399 *aw88399 = snd_soc_component_get_drvdata(codec);
 	int ret;
 
@@ -1900,7 +1900,7 @@ static int aw88399_profile_set(struct snd_kcontrol *kcontrol,
 static int aw88399_volume_get(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *codec = snd_kcontrol_chip(kcontrol);
 	struct aw88399 *aw88399 = snd_soc_component_get_drvdata(codec);
 	struct aw_volume_desc *vol_desc = &aw88399->aw_pa->volume_desc;
 
@@ -1912,7 +1912,7 @@ static int aw88399_volume_get(struct snd_kcontrol *kcontrol,
 static int aw88399_volume_set(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *codec = snd_kcontrol_chip(kcontrol);
 	struct aw88399 *aw88399 = snd_soc_component_get_drvdata(codec);
 	struct aw_volume_desc *vol_desc = &aw88399->aw_pa->volume_desc;
 	struct soc_mixer_control *mc =
@@ -1936,7 +1936,7 @@ static int aw88399_volume_set(struct snd_kcontrol *kcontrol,
 static int aw88399_get_fade_step(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *codec = snd_kcontrol_chip(kcontrol);
 	struct aw88399 *aw88399 = snd_soc_component_get_drvdata(codec);
 
 	ucontrol->value.integer.value[0] = aw88399->aw_pa->fade_step;
@@ -1947,7 +1947,7 @@ static int aw88399_get_fade_step(struct snd_kcontrol *kcontrol,
 static int aw88399_set_fade_step(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *codec = snd_kcontrol_chip(kcontrol);
 	struct aw88399 *aw88399 = snd_soc_component_get_drvdata(codec);
 	struct soc_mixer_control *mc =
 		(struct soc_mixer_control *)kcontrol->private_value;
@@ -1968,7 +1968,7 @@ static int aw88399_set_fade_step(struct snd_kcontrol *kcontrol,
 static int aw88399_re_get(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *codec = snd_kcontrol_chip(kcontrol);
 	struct aw88399 *aw88399 = snd_soc_component_get_drvdata(codec);
 	struct aw_device *aw_dev = aw88399->aw_pa;
 
@@ -1980,7 +1980,7 @@ static int aw88399_re_get(struct snd_kcontrol *kcontrol,
 static int aw88399_re_set(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *codec = snd_kcontrol_chip(kcontrol);
 	struct aw88399 *aw88399 = snd_soc_component_get_drvdata(codec);
 	struct soc_mixer_control *mc =
 		(struct soc_mixer_control *)kcontrol->private_value;
@@ -2002,7 +2002,7 @@ static int aw88399_re_set(struct snd_kcontrol *kcontrol,
 static int aw88399_calib_switch_get(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *codec = snd_kcontrol_chip(kcontrol);
 	struct aw88399 *aw88399 = snd_soc_component_get_drvdata(codec);
 	struct aw_device *aw_dev = aw88399->aw_pa;
 
@@ -2014,7 +2014,7 @@ static int aw88399_calib_switch_get(struct snd_kcontrol *kcontrol,
 static int aw88399_calib_switch_set(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *codec = snd_kcontrol_chip(kcontrol);
 	struct aw88399 *aw88399 = snd_soc_component_get_drvdata(codec);
 	struct aw_device *aw_dev = aw88399->aw_pa;
 
@@ -2036,7 +2036,7 @@ static int aw88399_calib_get(struct snd_kcontrol *kcontrol,
 static int aw88399_calib_set(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *codec = snd_kcontrol_chip(kcontrol);
 	struct aw88399 *aw88399 = snd_soc_component_get_drvdata(codec);
 	struct aw_device *aw_dev = aw88399->aw_pa;
 
-- 
2.43.0

