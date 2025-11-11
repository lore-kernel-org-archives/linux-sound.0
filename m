Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010012.outbound.protection.outlook.com [52.101.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A0A18FDAF
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820683; cv=fail; b=deEajgFYe3J3CW9VulFnOfn2lRCqgdC7kEbh+ejmB0CF3wzbP/UhUOUN+jRqQ6ja/KhWDlcdA9gW0L5RTmOalzNIStfYLFH4GjwaD4Gup+0g/3UYa2ZUTIWES+lfRzgVJtN4e+GpSI5Yf6MG1KFklm4D6Nfq/ts2JcAbkwcyejk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820683; c=relaxed/simple;
	bh=+sgPyY3HAZ19knA76Dz/ndrVbCJ/o0tZO/+oFjvd4Ps=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=dhxdjdnxCj0Y3no/WHvOwl5q3pSpbg2p9byg9KQuPFIcF23nMyKO0PREkg5q6SHl2UMyf3GWpXA8FiwPnBQp0Cz59QFj9nctnfBZkeRSphZAgHmNFvG3KRN7ZQ09N4ky7lMF1/bjnmX1Ag3huNUE317ngeXYEUICV2Aotb2n5uU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Wp7mTNlv; arc=fail smtp.client-ip=52.101.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Wp7mTNlv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y8u5ufUjUi68C4Dey5oZaqyHMx+Vu5oBKSreWql+dlT+UgdPUHTzLupB4ErELbRGhJ0/dQzzmrI/cCqhb1mvj9xR0RUhtwOOue9PA+XmAj74J6a5nGz7/6M/Hj14OGz8JG37ZP2eY8o58MhQldGvp783MhJhpTW8pPsjbHMazPtQT2D4T/9fB9/e+g3mLQB0N+50fHwdXyorU86v3aI+FepnWIx7vI8Y7vP3WsNw5ekJjptr82lFVSmPS5g+UbwGP1xogylq+Ay+sIDeYh2H1YRuTRB1wQiTXjHYrIBWh4HZjugkFE1NUj4vlmtthGxR0wlVElQ37BUGuJ2GsVcyyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EQlAnmZYO+diLGjw9/pDOBtaBqXf3Lc2tqedXSP5xxw=;
 b=vjwVCinnxMxdUKd0X668WrhzLBBUkK3rMg9gaGTAlwVQFeIo2w+RWjsyYSyTCJf1IdbtQLi9a6IEu6KEa0mu0Z8+PltwLj17bCpUId0F7gwj4fiG2gHQuvtu/2X+h6O7Jqf6nCL7I472GTkT+EANqMhr9zZrvzcS4Gq+3YszL2hEWlyrHBj4xC9V0r9YfQs79pexjXs29zlLzByy89h8CkIfzTnJZy/wLYukwngTPP6bbsIVA5fqqUfOGNNpdkCxDON8yzLf57Pw/k59ESb8ug8LuWN7dTxNUlGYRGZzY0iGFgoUBhj4xl1iqsJq6tuHhe1xBguyYYH+SyxV90Trew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EQlAnmZYO+diLGjw9/pDOBtaBqXf3Lc2tqedXSP5xxw=;
 b=Wp7mTNlvlS6jCQ9CSYYIHrr+KfamWTyFsTuHN/AcHWKoT2rXb4ua+dNUCovO6Jh3WXUtXy88QTy4juIk/6YyHmltnLd4gzHfcCJrTvCOCN+k50/WRr2+PWxLhN9jrXtEqobeiJcd+Xgdlo1XP0AE0oTBnC5f9rIXUEkAAV6y5eQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYYPR01MB16440.jpnprd01.prod.outlook.com
 (2603:1096:405:147::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.11; Tue, 11 Nov
 2025 00:24:39 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:24:39 +0000
Message-ID: <878qgd4drs.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 102/292] ASoC: codecs: rt286: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:24:39 +0000
X-ClientProxiedBy: TYCP301CA0023.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:381::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYYPR01MB16440:EE_
X-MS-Office365-Filtering-Correlation-Id: 83d8938b-4c2e-4af2-3ce3-08de20b8b3ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/t4Gf+O97vdimDFKh4Plt9lidG6rcBi9ZV2We3Ud6H1TLcUkSxx2qvmXZCme?=
 =?us-ascii?Q?N5SrTbo8tQEtyzr1EOoJ/biusgJ6O7cQ9Ia/jGSX9Xb+lmz7ddB9e5RffE10?=
 =?us-ascii?Q?G6wJfPM2n2sxOS9XzV1eYn7MPP3fWdlpREyptqG3wRkoqzLTWcXlVaPNNzT0?=
 =?us-ascii?Q?Hn/UjfiI5X5b+Kirrl4VSC91iMj4xDfseaUqbVe+qx4vd8qPO1AiTbl1aLiH?=
 =?us-ascii?Q?/7ITCXKiiMZgBd3CkK+lj13b4EbI1r6m4ZjRZjhd6jvWVatzxdHl8FPK6uTL?=
 =?us-ascii?Q?8P17RX1eLWy7ZH6c67WevCmqHMsvJ5sSeoZtIDqVziETznCQzCNyH6QERvCe?=
 =?us-ascii?Q?Nhysqr86ScdbEB0f+W2q62YqySl0Ab5vHXTLAj7XJsMFkh8OpIM+bUVJRuJU?=
 =?us-ascii?Q?m8/7aMjnA0Q1770IHoXwzKb5yVnE+5zx5HyLD3u/DjZ27mmDWU6Sn16B1Exe?=
 =?us-ascii?Q?XYTj8YSc83RRCXAkIcGI4zOVovoBM+yPxHw+kzwx24UqlCTnd+8dTvyXG5nV?=
 =?us-ascii?Q?g939XwS5u5Oaj4GcEKxuiSRlnogFmaFssqocECQWIkmmW7aChOR7nb0c4qXZ?=
 =?us-ascii?Q?f+zbCnOd2N+JZorRYgOnZbeJIxzIt/bi5d0AXAeiED1n04s5L2YxnM4iiQy5?=
 =?us-ascii?Q?9nkxkQokCrdOHKttn11aczxltuoVgT7nhqfqeKJxmRaGPnICbMEOsLi7SrNh?=
 =?us-ascii?Q?Adqo+jZai85AA5nrempd7sZZjkW4dHwrECCTNCgv6ofbo5Ybpvcz+vcM0kIa?=
 =?us-ascii?Q?/dGdGE2tCz1hxJHhY5UADm6ZB6bd8jAKl3aW+GLxhPJPngUZIIta8G06yc5b?=
 =?us-ascii?Q?Buin9ZoO/MRxPRuXiYOJgBUq0MvhY938sXasvI6sqkgN4gIIKqBJlvmZ4DBE?=
 =?us-ascii?Q?GjlZ3ADMpNBYRUBAOjNEy1uEoVi2/wVzpyjjkmNw4QbUKEnAOtg4JZewIrlU?=
 =?us-ascii?Q?nQ5+cf9DbGLMS3mlzZTNuO31wJWTRAYrb+D40ld4HGswmjX6Iywlwb602I9E?=
 =?us-ascii?Q?Cx6oY9U3QpFUi1x5X3UjFyIUe5izyqhNeuGqg2x8QwDAKKW5LWY0IgOMehVt?=
 =?us-ascii?Q?BBQoHg5XP/Jx/XxAuz97w8VamzS7XYBtiGH6M3YS+q7gvFNXNK+Njmf2LKs5?=
 =?us-ascii?Q?LxKE5nulYOhRgJ9zUhmxcxl82qNcSlTST3uoYkrCXjSW2KtO0j6OT2x0jVgZ?=
 =?us-ascii?Q?v9QGsb4mGTveINVDz5h1GHqCf8QEk3DZU1uk8rgMIxSCj+YGZthIVWaVYsHb?=
 =?us-ascii?Q?Cc0MnWQe7Eq6LpjFqB+2UfOhOf4KWbAJsJoIJXhfAlKY+Q/UouE62bLqKEt8?=
 =?us-ascii?Q?7zNxLeLUe+KsXbSUKCk/HGDeeqAhBZUAQkXmZw7FOgDDg5zPPLvp4HwSWChV?=
 =?us-ascii?Q?QsdDynT4gwAC1zxlq9XFHETNYrYSPf3EiUT5hECFtOIE+Jsq4NGnGe4UY8MM?=
 =?us-ascii?Q?swCFPSmIOPy8HyXAUDvHLsh8TWyhz16C24FeoYkPcADnGFkgiRUW+yCJR7Jv?=
 =?us-ascii?Q?5er8n4VVKSHfPcKNhr8XQIdf2K1QUyNJpovS?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lNn9Nb/o999vhBuxznHOpha1jd2Kf5klIFqg1ZwKbevjYs1VBIwSPn7yO6Uv?=
 =?us-ascii?Q?XDRrLR9s9DBApgq8+VtUCG0tktBI+4bEIJhmsRL6EYuGW6px99yhs4P76E//?=
 =?us-ascii?Q?JsCVNCnxN1MJ4UIiJCPlGR+85KF87Zww32nO94AWNU8nU+Q/r0KxzuaQe+fV?=
 =?us-ascii?Q?6g1DfOMOA+wzIdBrG02GgfHwM2O9KL/PuAYuZPc1NOIY4YxGje55H1snahdL?=
 =?us-ascii?Q?P6eNt2KNG2GVEO0XcPaxvl15m4xcVmePbJEYPiFHJzcoAqob90JAUbGnSdWW?=
 =?us-ascii?Q?zNEI2M+9we64Zt0xjdPV5Kpl6gqak+MwcBupiyeB5EfWmABIrz1wK18u9gdI?=
 =?us-ascii?Q?6THzzQeABdCmgOmMiVLDVgvFsULE+sHsjOydhpYg/Kvwt6rdgcLGgTwNJ+m7?=
 =?us-ascii?Q?7NbtNT8aAYiOCwxfunnFGZyVFDFu8P9xWlo9EewkzEClD2rmSkUnbUTdXA5B?=
 =?us-ascii?Q?ggdsLA9fnST7njV2Y8uNXW8MHZM11SGBw9JdYraTqc9S7lvdBvbmH1jxNGmc?=
 =?us-ascii?Q?g9QZuBQKgICUWEwvfH0K0do3QlAdOs5mDpgYo6uDeFQPIzUYHhfPBma6SS0u?=
 =?us-ascii?Q?T9ctCbyU6WyyZbkj7vcuf2ykSxxMlCQ+JtxqNn+RkYsXIru9kBvjUSbR8Rv1?=
 =?us-ascii?Q?aAM+yzi4h244CJStSu2lfbpGC2fgV8+v0tJzm5TWtgCxP5PSxNz/uAfuCFmf?=
 =?us-ascii?Q?LIbvLx8H/BwaaV/OeE1kbF4o87XAWZUyIFaBikXkPpO3H3CD3BSvw27VTPRd?=
 =?us-ascii?Q?I6mUTSQ7+DkWEE1EgnuNw4qquXE43tYeK0eetp9IBx/RkkJ5vGgcDwsTDcZU?=
 =?us-ascii?Q?VVIML6jaXpudWrcicEY5qXRhcdg2l+0LD/vXeJvBo7c7aT5pFwdlYb2RzS/9?=
 =?us-ascii?Q?P0NPYP1yHCZdSdurbUp2ueHlnXE2FBhJKDNYnMihyd8oDYQida3L2eOs27rc?=
 =?us-ascii?Q?V0GIsZjpepdj3zMZ+0JbTmCdQPqmHJ9DbZ96rzxvrIQU0ScmR6Y1cFPVONFI?=
 =?us-ascii?Q?/Av5ISUE+7N4Sa7SUybGBs2jHkLM9h/KpucYIX58nnxl/Fhpcp97AhAWf6te?=
 =?us-ascii?Q?OoNbC9RdeQVLD/rSyhKP3A164Ym7vzi9Ip5vrPjMS6oioXEpNf3T0dSYyOEt?=
 =?us-ascii?Q?tZkcltZz9BH+3pEjibmbGAEfa4bwqUORafTaa9KTrzJSwVtH1A7VgAh1tYCO?=
 =?us-ascii?Q?w+Os5HtH5R1Lhk7oGeTO41FmwzndPsZ0Llq4kT7f8qtoJQaP/QRIWjmIXb+E?=
 =?us-ascii?Q?WTUcYuvBb3nqQanbQVJ9pAjcHZWkkcJdF4Q5w5iViByT8xpow3JKwJ/F+Dbm?=
 =?us-ascii?Q?kyhPsWeBqhQmPmzJID6Ms96qBZ7TnyzW8Pwsg/wNlBWI69sLoXCIsqZP7Qw6?=
 =?us-ascii?Q?DdeetHPA8f/dGV+lj5Wlnrqa7xec9/ZI+8wmFLWccNLPHC+JUDd1m2jUA6/T?=
 =?us-ascii?Q?63AWjU9gVx8AoRNwPuTDspk7yehFWlIUJm578mDs7M9C9h99PLP8tfeqtw4g?=
 =?us-ascii?Q?pFhet3mOdp4e357iXlOQBfzn+v3Un8neD1jSifaNZms7EGPeEYqfEyKEyze6?=
 =?us-ascii?Q?wv1AchVQoUpXO7WFEdiclyUKVo413GAPxfStji4BYg68i0243/Q1o/TNmRrO?=
 =?us-ascii?Q?wxr4rOj+3DsLEau2OvDywug=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83d8938b-4c2e-4af2-3ce3-08de20b8b3ef
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:24:39.8875
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: to1wfDMztJmm5c+oBtKHDSivmMkL7tpS5suId5me/FKiyJxRCy7lbNIA68Iyt0r2ODJS58W6HJXeOXEpm1EaKfu5YK67yxkQl/mgx0DARqF2Fr8JEDO/5KRTS8Le1Rnn
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
 sound/soc/codecs/rt286.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/rt286.c b/sound/soc/codecs/rt286.c
index fd8de8b497936..2fbb5860c4213 100644
--- a/sound/soc/codecs/rt286.c
+++ b/sound/soc/codecs/rt286.c
@@ -223,7 +223,7 @@ static int rt286_jack_detect(struct rt286_priv *rt286, bool *hp, bool *mic)
 	if (!rt286->component)
 		return -EINVAL;
 
-	dapm = snd_soc_component_get_dapm(rt286->component);
+	dapm = snd_soc_component_to_dapm(rt286->component);
 
 	if (rt286->pdata.cbj_en) {
 		regmap_read(rt286->regmap, RT286_GET_HP_SENSE, &buf);
@@ -314,7 +314,7 @@ static void rt286_jack_detect_work(struct work_struct *work)
 static int rt286_mic_detect(struct snd_soc_component *component,
 			    struct snd_soc_jack *jack, void *data)
 {
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct rt286_priv *rt286 = snd_soc_component_get_drvdata(component);
 
 	rt286->jack = jack;
@@ -887,9 +887,11 @@ static int rt286_set_bclk_ratio(struct snd_soc_dai *dai, unsigned int ratio)
 static int rt286_set_bias_level(struct snd_soc_component *component,
 				 enum snd_soc_bias_level level)
 {
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
+
 	switch (level) {
 	case SND_SOC_BIAS_PREPARE:
-		if (SND_SOC_BIAS_STANDBY == snd_soc_component_get_bias_level(component)) {
+		if (SND_SOC_BIAS_STANDBY == snd_soc_dapm_get_bias_level(dapm)) {
 			snd_soc_component_write(component,
 				RT286_SET_AUDIO_POWER, AC_PWRST_D0);
 			snd_soc_component_update_bits(component,
-- 
2.43.0

