Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010013.outbound.protection.outlook.com [52.101.228.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C7F379EA
	for <linux-sound@vger.kernel.org>; Tue,  1 Jul 2025 00:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751328672; cv=fail; b=iuDhVdPaftW36B6rG42fZMAHThO56cywFqwdAQKi/jST7jcIl8q+QqfDWXt1mxBtaTcwVozIZF0iaondc65YXZyD7jMrJYRAnrc7SclRpGth9xZdb80Cb0/HdwfIE4v/qtlGyr39Pzoxmgg3IXRmLGf3DWLs0YKVkgKNldqVlLM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751328672; c=relaxed/simple;
	bh=ypzLjl40tAEejMyYX4OvNla8A7hN8kraX4H7kCq09ZU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=oG1vUd519WQhb81cejXPleUNEklHu8rVgDktd9HbaIlXkUJ4vJ0Ehot5IJrsfmPI7fFW1nyS4BVOZiK/IIiwyljW/bixRTfe7/sjSk/Ijdvi2cHReITBrukPyCJUw8HlpOIjHxNxsrj6I71xDMGTewBlOmCnqVl4Td/2Jg6x0Ss=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=n6wvc3R9; arc=fail smtp.client-ip=52.101.228.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="n6wvc3R9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eK4alvyivCAzWQKWCaKj/TN5n64mrz+bVrsjQ2foQ0SImkWS0mHB6HtVeuLjgzTNtvURvu1hkIh92PSQAhmT8K4ujazJYYTmcqtUmea+2OU4KVd8H3I5aaqR8z5+iubVHR42vmeDh5Z/kMpBPQEO4nr2QTi/YJNuTdo3RNnZT04GHZjgxD7CmwyBmDtq4Wu6p4ECPv+P2r061NxYEVhhQm3kc+Rbi4HVtm5JuM34JnAVOQO6wGd7b3CauIDQ9IFlWBrYt4xJJ8Rgsg0vLpvMLhbCzvNAmM5rRoz41e6YAB87MWI/6VFEgUhvg+mDb2zKzxlZZvhFOZVYOcDiRhHGvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3qy07wCPYb1r1r1SVKjU+/Ck5adDOrovIJ5Ph8EGxn4=;
 b=WAKr3wIrf4zXtNIxZk6A2Ug+eiH24L+9c5jsI2ZkRS/DBowmaxiWOp2xZo79ByjCRkPHxCfHAeL62cgrgb1oXHdI6pU+LXOePAZ6wyHmxZ4h9OKRn/MiqTbKWThDK93hTRm/yN6E5oaH+19SWJaF1WSVQ8NucKgCa37FXwNXLltiIbV48j0zWRNWTQYAmau8f2ozz/0Z6pAu8ea9eOwCISa2V2LkWa9jJyQGN/s7oqHd0A2boxZIF27Gr5Ym4R+I9BpSgwdzcpebtIXBwv7/dVJ9aHHOLieaZUrJulFlUbL5zYiQzCzHpv/6wsyIduuDU69/U2QH7NjQZODkjMC9pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3qy07wCPYb1r1r1SVKjU+/Ck5adDOrovIJ5Ph8EGxn4=;
 b=n6wvc3R9/ZQ3YF4I2QToLGSDTiz6wCINHwwSeZYqR/e0VBTMpzwK92u4lb3dfjRE327jv/KVmgz3MwiEMsldVcUubbboG6/ai41y/q9QzP4yx1/Yvk1PrYGQ9XdukVu2mG92msDYaArJjO6Rdj3kYm4v/49AQL4sVJJyphjLYuk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS9PR01MB12421.jpnprd01.prod.outlook.com
 (2603:1096:604:2e2::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.32; Tue, 1 Jul
 2025 00:11:09 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8880.021; Tue, 1 Jul 2025
 00:11:09 +0000
Message-ID: <87ldp8hisj.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 09/11] ASoC: soc-dapm: add prefix on dapm_mark_endpoints_dirty()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87y0t8hiue.wl-kuninori.morimoto.gx@renesas.com>
References: <87y0t8hiue.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 1 Jul 2025 00:11:08 +0000
X-ClientProxiedBy: TYCP286CA0183.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:382::12) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS9PR01MB12421:EE_
X-MS-Office365-Filtering-Correlation-Id: 195765cc-7cdb-4807-fe3d-08ddb833c7a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6BvdP5hY+xKN8m1cP6lvwWUyiaygIcYlJ272A12vEkFDOZqQA/0KJ3Q2A8io?=
 =?us-ascii?Q?8qOzGAwFORhsQsOMTxG6jhkTWVFNB158jac+83hVFKiyveM9zdTksrAHEHA9?=
 =?us-ascii?Q?6+vPVNp46eP7Sas1XRHxIessxyecui6upd143ZCiPcCHa+St5JIvMvQMqCgu?=
 =?us-ascii?Q?LPljeu2mrB1tNQTu6p+F5WsfdTZnDEaN/ngTY5CPIt8AXpKIf27L0YdSYeFN?=
 =?us-ascii?Q?T3t30+SPvkQuzmD6h5v4MNODOybnhlnr1uL2i4et1sf18gUDskWJTymM5NKc?=
 =?us-ascii?Q?7wXm2sPICLoCDDT2dHv3BlbkuR+H3fcAf6QvCRhkJUCGzbrkEWzJtat3NL6N?=
 =?us-ascii?Q?OwFJgoUB3jleQBW/8SaGL9dTf0d/D51nuKVeZh+98e4gDiAwkaFhnYD/3iqO?=
 =?us-ascii?Q?YEDVYjit0BRjdeG2kOSj6w1/uWnniDQkN9U3jS00U92W2FI9KgIGa3aT4Haa?=
 =?us-ascii?Q?rOtARO95Uylw1DeOsSB+ts4Ml7vo3ZwcBjen16zrEVGIts8ofnZLQ/lek0zx?=
 =?us-ascii?Q?4KmgYSHEzaOjUlI6qUntefJA7mXI/WFoy1WjqfUT5YfemIMv9SGip2mHTvzi?=
 =?us-ascii?Q?Jd8YSNHcuYHSwSvYKn0u6hhl6SvAga1h3Fd+3k6TK96cxGVtrPPA5ZxB9P2U?=
 =?us-ascii?Q?6RFBoBam6MrzjdNWl8svJiKO4mNwO7VSo5ZWrXTHC76Ns5XVpOhKPKo4V4HG?=
 =?us-ascii?Q?tXTqYrU4dKtxSh4Y0rrP+pj0j4uP5Rl7seY9Y2+aHR3D/MMsi+cRhMxPWmLx?=
 =?us-ascii?Q?RF62pwbLs4G3/UYeWcaii2yMCtPhX7b3Y6h8jH9q4Pc7eU3DFqKwGCaAFvYB?=
 =?us-ascii?Q?qR/QKgJ5WBX6/as0uvGDczL+hI9wWkIB54ZFuQHJ1Zx8bebfPOv7l6nmJj1C?=
 =?us-ascii?Q?JDSmKR+S67GUjkEEHSwXpq6lFYTR/y+HSSVa9HX4zi5f7WAdeqIyCFWvNAtX?=
 =?us-ascii?Q?5UjJ/+m7bEWF/7vPGxhNZ9TMpHBMJIx+Pq/TKtcKPsu5J9uBNMvWoRT2ySSP?=
 =?us-ascii?Q?nLK+ZtKKe1y1pA7v2vuOq2oYdczSLCiVwkCHc4GNUlvy4bXL7yNbPQ0OcO0V?=
 =?us-ascii?Q?7klHj8V8Wbjp8lsroo5+aTvyoj+i0NoBvRbHd9ULO4+XVPWYLpF6dOg/mujj?=
 =?us-ascii?Q?m5NMgSQbVlrPTG+QibrTW4gfimnLUXN8tyfwd9Wb4Yf4W5xBvuhmtByZUWSX?=
 =?us-ascii?Q?9QTQqu+H/Vu/fOBtoo7o1sWyhI5DfvZiEwG/sOpeAF8v/Y000oD8aWKMWoRS?=
 =?us-ascii?Q?YrzfkNKn+5rGL00kqR/nSe7A3IAmmwii05cNlkxzYpnRnqs6+QRcI7TzZkkg?=
 =?us-ascii?Q?ZA0FIdpiZaxVntaudKPHZd2ImLsKKq8ySKzZz3Q8Ev8o7wyPZuiRI93brA09?=
 =?us-ascii?Q?/2BxlpvbSpzcuavbOXgbTVBB3zLZyBRjdS2S6aY2R5AXMvF5DeHLw7cru54X?=
 =?us-ascii?Q?caDgFGnVXuIke3XRDKC17lQqhNIe4i0Ml1n80wF0GEl72msY3SbJ/g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6TZ8fgl+Hfa0OM8JvxkPNJq8r1jXDz9Mrv7lS83xIjTSpi2h1IVMfZJKhJ17?=
 =?us-ascii?Q?9eRiaDXFuGJvT9z//QnyVaJ3a7rz/K9sfCgOeFDzsO9S2B89mPWRMtzDhybO?=
 =?us-ascii?Q?NKIcHbkJATTZN8X7ieCyqE3GLV/916sj3tTk6mYpFxHnQncISPgxqdtnsUp/?=
 =?us-ascii?Q?QlfekBwIlldodcryZLuRgxcFfo28QvPyIcJrXfykFY062MSMmVasUj9g//4J?=
 =?us-ascii?Q?Egl6RJwerOmNH7DFrXysnlloiOfQ/omR0nIlyWfeQX8i43lgCXNDfpt5NRk3?=
 =?us-ascii?Q?Bdtnp4FtzuIaYrZaof2Eo6W8FbTlV86xSNpVa+Cie+jQOfR72aOQ6b29vdrj?=
 =?us-ascii?Q?FBaAyfWhZymLWrKcuFjyU1ybFoe9P9zSYFqjygvOtLAu+sHauDXHSt6TeA1I?=
 =?us-ascii?Q?Q3Ry9/fl1tYHhEWai47sfDPbrL8IofpU3yOUDA5Kqy2BnK4//K3pDcIFcBMd?=
 =?us-ascii?Q?Nbi5L429b1sB85BLkvnIvP7zFl4geO2Ap+2tk5eYXau8rd+6otnr/ZkdDktF?=
 =?us-ascii?Q?EL5QHrGaqgjBVAXSr3XzEkdtLi12P2TYffBej8bRuc+lYCecsPLdyFS+fq9z?=
 =?us-ascii?Q?hrtJmJ9jIHMLKsSUe68WHlFghI5+2jpNIMRvcrvHPTnhcEakxK0LOXOWLJWF?=
 =?us-ascii?Q?t4fgqdy6m3LH1GLW22SuIpovfgxSdWyMTohXF1DXlBz+a5/nZDYg2EIoTxs4?=
 =?us-ascii?Q?qpe55yqsbuFFdRkvQPVNlqhsnEgq5n3hhRprRN/KfwC//H+SjTxVHTEmsz/t?=
 =?us-ascii?Q?to2aXVCq90QikUXGih0vrwCfqrnAvHQEo9MmpKcfOx0LZsPOSq5I0LxuEWU1?=
 =?us-ascii?Q?9VF4DhqcIyE43W8MPl4hlmFbxfb23QRt1GIT/xPuPcPGvEus92PYGlJmxJ4c?=
 =?us-ascii?Q?iq2syLvzHtB4Y4c95gm3sE29Q8YWIj8xNOJb+4ipn4y5bb3GR9RgG6rceki5?=
 =?us-ascii?Q?+Z9sQ2ohulVU1UknQLE8vKvNWrDnxW2vNqx2zy5306UBpL6UxAI6g5T4A7cW?=
 =?us-ascii?Q?t3cHQ1BZxE+uQbOmmM/RpE1KOGLOwsgeZ2ARmnIUECzOE7wd0sakhz2FXgcC?=
 =?us-ascii?Q?FYRxPmePywuqDup2+Mt2XRY7AiX/XlK7zUGHrln2PGpguXzWdBdW7W8IqWFX?=
 =?us-ascii?Q?5e+T3eZEHk4yp0zcUYx2OfOhJ4kOV/LH/bG2bXKKsrdeHXn0fK9Qb7FYfxKE?=
 =?us-ascii?Q?bdbKPJOT/0ZwGSdqO4L7j6q2VKbQecUkp5T4YpJxFUoKatmnEE4Xkxdh45VV?=
 =?us-ascii?Q?FSE9WpeSG4i4ioh4D7SQckunzfH8VbgiObYn/s1Nd4XLqakVqDVMYhXfHdwZ?=
 =?us-ascii?Q?In/86O4LKwiXNCq2oY6yXWztD5KCMHUqqFpHE2p4vM1JRJDwD4ptYj4yqTQW?=
 =?us-ascii?Q?F0Ve4DrRhVb+waNpwIBoNN2KMPAAWNldEc/P/T0/SzPr4pWdQKdyJdJCV207?=
 =?us-ascii?Q?BdmOO16hBm5kxctIr5QXoc0RfTREeO7fcC8CoE6mPc3DP4v6obu94MDQDIuR?=
 =?us-ascii?Q?mWwHGBcekjcrHXKyzStkdt/mxDTSgj+F6XkIIQqUimws//+aC6iudm8COFTJ?=
 =?us-ascii?Q?mHuikBewnwKzFDyctyEFPxpN3KfAklqSOOL3igpDZdNRDzyKMI/WZdo0+R6N?=
 =?us-ascii?Q?DLLs60xS6z20TBGqUkDmx7I=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 195765cc-7cdb-4807-fe3d-08ddb833c7a4
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 00:11:09.0680
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K/WLCBzhtwDeOlKraE6tpD8bPR1F066Ctec4WlhF3DSGD3b0DGfr+BHlFk1PFRdBzDVWUKWV4agZAysJSfYYXMIxbWdwpXT5aH/HCIAzHcjGxoG5H4E86S20/aq1tYSY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB12421

dapm_mark_endpoints_dirty() is global function. Let's add snd_soc_
prefix.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-dapm.h | 2 +-
 sound/soc/soc-core.c     | 6 +++---
 sound/soc/soc-dapm.c     | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/sound/soc-dapm.h b/include/sound/soc-dapm.h
index 5aeb0822ce0b..ee77a80765c6 100644
--- a/include/sound/soc-dapm.h
+++ b/include/sound/soc-dapm.h
@@ -700,7 +700,7 @@ int snd_soc_dapm_force_enable_pin(struct snd_soc_dapm_context *dapm, const char
 int snd_soc_dapm_force_enable_pin_unlocked(struct snd_soc_dapm_context *dapm, const char *pin);
 int snd_soc_dapm_ignore_suspend(struct snd_soc_dapm_context *dapm, const char *pin);
 unsigned int dapm_kcontrol_get_value(const struct snd_kcontrol *kcontrol);
-void dapm_mark_endpoints_dirty(struct snd_soc_card *card);
+void snd_soc_dapm_mark_endpoints_dirty(struct snd_soc_card *card);
 
 /*
  * Marks the specified pin as being not connected, disabling it along
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 1ffabac1fb6b..31dd013dcf1d 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -681,7 +681,7 @@ int snd_soc_suspend(struct device *dev)
 	soc_dapm_suspend_resume(card, SND_SOC_DAPM_STREAM_SUSPEND);
 
 	/* Recheck all endpoints too, their state is affected by suspend */
-	dapm_mark_endpoints_dirty(card);
+	snd_soc_dapm_mark_endpoints_dirty(card);
 	snd_soc_dapm_sync(&card->dapm);
 
 	/* suspend all COMPONENTs */
@@ -778,7 +778,7 @@ static void soc_resume_deferred(struct work_struct *work)
 	dev_dbg(card->dev, "ASoC: resume work completed\n");
 
 	/* Recheck all endpoints too, their state is affected by suspend */
-	dapm_mark_endpoints_dirty(card);
+	snd_soc_dapm_mark_endpoints_dirty(card);
 	snd_soc_dapm_sync(&card->dapm);
 
 	/* userspace can access us now we are back as we were before */
@@ -2289,7 +2289,7 @@ static int snd_soc_bind_card(struct snd_soc_card *card)
 	}
 
 	card->instantiated = 1;
-	dapm_mark_endpoints_dirty(card);
+	snd_soc_dapm_mark_endpoints_dirty(card);
 	snd_soc_dapm_sync(&card->dapm);
 
 	/* deactivate pins to sleep state */
diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 16f8eff42835..d612dfbd245e 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -283,7 +283,7 @@ static void dapm_path_invalidate(struct snd_soc_dapm_path *p)
 		dapm_widget_invalidate_output_paths(p->source);
 }
 
-void dapm_mark_endpoints_dirty(struct snd_soc_card *card)
+void snd_soc_dapm_mark_endpoints_dirty(struct snd_soc_card *card)
 {
 	struct snd_soc_dapm_widget *w;
 
-- 
2.43.0

