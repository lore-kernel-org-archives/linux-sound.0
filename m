Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010053.outbound.protection.outlook.com [52.101.229.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F4E1BCA1C
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820640; cv=fail; b=IYPIxBffovCwtSTESqe65DNLzs5m4Zk/Qauu3kX78t4x5i46+Kt6fFZlQfK8n4EUQROUncG44ILbGqMEeSHw4Fd+NTcvB+cu1msp9dNNzSn1UjMcB70F12vWW8DUv0sxr6qI1lGFVNNktweSI8efGBdtaFqIhnu1Iq4V9UTVuuk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820640; c=relaxed/simple;
	bh=3utmIw1VplaBRP8aseoN9/mwUp46ahWV2iXPCBrVWcg=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=YIWwPakIz7dIZw+KSsyV19f2/V0DTSp02Oz1yUYZFuSgCR+Ok/Q05N4Gnjt1bKT3pQl0rA7PHyCo1WIjJrSX4uwtDbSeLvEReaXg623mnzvdDA9XvAdjh7Fko/2HrNqI7sp4OIL4KjSYhTHutpD+4V8+396Oz9/bHbXVoc1cWbw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=RVRSFNXr; arc=fail smtp.client-ip=52.101.229.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="RVRSFNXr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KhHr8ioFoUBz4CifxcL7E5nD0ETGoWgR+dMmoXEjCpE3H7AOrabAYYkGFt43X+zLKUrxwdfcwjkxFcBJLZPYvp1LDcnz/dDP4EqKluGLd/Ig6SjIzQnWDRFRF69AV/FyRAUFXGTyMHk9Fra5dPf1sopgbmRZBNx5urrKfjcOKdsYv4B1OTwd0fWtfEQHM0021+cCXhhO4m0hHsRcwTRQWX4ihui6n+aNtmZEkhsuAPsTGh5yCT3QkyC0WVvbkxFvcMJD3hhXPpFDNpa/H/HXAMVLhzV8xCYtcIB6v/lwTdnxqCKg7IExkwZv3JU4SbM4vl/Da0j1chwyn8PTfcnQjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FPPP2K1n4oHgGxwPKCO/x4yW7TEzf32H+hp917/AU9c=;
 b=sTaekNlMkmnnbqytEnPgDHdbOom6TMY2jQfsYirhhgeRnK8RSbIh7b5lMQ4kgjP4wG9cnRKAIcTLM4CcFqFNTLUm2DBHEpL+ChvLE5dk8mFhuVLM1/Hli7vtlp9cSmZhAQd7JsVJLhaEOG26LPQ4XZ99EkmUpUBu8Os2ZCzobwFu+PTeSWLz9/78ukkNvcu4GsbXPOhfNO7s3uiMiNP8WP8UqSNRLiIIQ6xCO9qVVNP03Rv9YLC9aimAddXVvHTFlJreiHgjWfsQPWwfx1snI4772dGpcXGWVRlsWUH8MyZLmSPhNhAvAf7imwh5hO37fuwEZNp7FXHttMqriBuGbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FPPP2K1n4oHgGxwPKCO/x4yW7TEzf32H+hp917/AU9c=;
 b=RVRSFNXr++F7X0Tl1ZuSsLGeTplQEGa1dZHYd1lIO2fKm2v5fWGOceNPP9Q9Z8Y3u7Y1TOdvsAQEAz6S+D5Tl6N1tIHGHaKpiMQt38M8FUEJOfzZkAe7UVSIr5IHzpwjtK7YvbyiTKGNIx0uBQ1xW0hr9hX6ZRGyu8mDHIxZzIE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB10376.jpnprd01.prod.outlook.com
 (2603:1096:400:248::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:23:56 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:23:56 +0000
Message-ID: <87pl9p4dsz.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 090/292] ASoC: codecs: mt6359: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:23:56 +0000
X-ClientProxiedBy: TYCP301CA0025.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:381::12) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB10376:EE_
X-MS-Office365-Filtering-Correlation-Id: 43b61847-3e83-4d5a-61f0-08de20b89a06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HSzQlH1u73kEPfHd6joLyx7tJa2kJoqTHmqYTVoyflD8Ib2CMiEfcG3Jdm2M?=
 =?us-ascii?Q?Ku8KQTIAaHzpUrs5z556wPqkZ4rI8nL0fYI7BmkgvfBakqE4jQNPzresY7wx?=
 =?us-ascii?Q?eoqbqB/QZIT9pymbFh3x+2KAzG4a7acl389uO0Jk3ADP9cOGbn6hPK+5L8mG?=
 =?us-ascii?Q?QXtEcr2noeIlgiFdGsoik5ppVmfIyE35TWucn8h3CoAe7ZpM5PXTX+MiwwkO?=
 =?us-ascii?Q?kV84dg0+awsk7Of1Be/dDqNj7dv/mYy8YrhrvbW/hHMpPgE3UgndmYYEKrQz?=
 =?us-ascii?Q?7IcMipxgwgDOelTP+JUe5Gvp2Z+UNOHj7Op0Yxlz0uJml/BZpA3DdoApcoYl?=
 =?us-ascii?Q?dpRKLuhRyHzY9umSJgqA1yM9Ejrun2GUo1AnkqeIB8rmxLRIX1P/FhJF00IB?=
 =?us-ascii?Q?4pfDPmv8jfWrasagn2T5LIOHrbe+LFNyN4c1UA8eUJjhIwSJ+q7ZibHpaKrf?=
 =?us-ascii?Q?UGwDczI0bpWQd40rFUpCYWBuNuGc9drJ4UKhoR9X/+f/qj4+Ty2ve8uF/wbv?=
 =?us-ascii?Q?Vm12I0FT9/Ew3AysRf/aw6PtMdTCqdNf1gW8gR1UKqJ4djitOMM6pOlERzOE?=
 =?us-ascii?Q?uGTeATgXkQFDhST136XBz8odAVLrxsx8eUmv12Ryshg80Q07F6cFs+E8ZgYS?=
 =?us-ascii?Q?6C8fic7VxxRvCw2JeVtJAhk9Xi1Fn9webvnsc78hYnxMDnBQUldhhXY41tjT?=
 =?us-ascii?Q?mdwtsbYMRQH4A3me/S5Ll4UcfdTKowqUaKc7yUT2vKzgbN+kTNkIBxfDJTDN?=
 =?us-ascii?Q?1V92ZMM2CQl1lGtVzZoxV2qzsILYBDtsgpVKe60bsNOd0d3EZLr9eWQSdJT1?=
 =?us-ascii?Q?4j3TIuAhajLjKjPLSIw2lYfdVnRI6UnoQCsY3M6h+7/QxmWqmaK3qFOcNd7P?=
 =?us-ascii?Q?sf+5WhGkzq4d+vU4GkjLb7oUd6AJMFYCphMcJ+KOdOA7W/I3VpPNhuCBEKxY?=
 =?us-ascii?Q?XYceCPRCbtVx+xrTJCQaL+zKNv/T8lIVD78KbvjrLT4R3AlVbCUlNlS09R52?=
 =?us-ascii?Q?9oI34G89VZLzOWK4VBZ1RphbPQlplgQSZaQdQ1j2NhvISekcSuETC0ElMo05?=
 =?us-ascii?Q?SWbwvwIi/XxaLXD1mSU/JY7AwUGJKnqsWGiDht0t7sZuIelk9pEoW6IK+0sB?=
 =?us-ascii?Q?kB9mIM699ix0L1R9pMNsU+aCvzE13UjOxn08Nk/o9BkQ53zNE9Lw6USTrCk+?=
 =?us-ascii?Q?S8fG5uQVUaavH2f9dYdPbkIrkl3Q+9xYEjDkJMIUeETKnroe3awkK5dqs5DW?=
 =?us-ascii?Q?y/znmaFVM553BT+SeBlOgkMKBojhz7jzGWFgLNzG6nS274JTYHKTEddlP3Ts?=
 =?us-ascii?Q?c42i1BhqntR68S+i9BHegjfuqhJoN0YSPnKel1+707JyZnnD2Ax+Mq6YS4xc?=
 =?us-ascii?Q?Q+VgALwozi8uhw84Le2VZ4hJVrk+u154u7sV9prWRR0ElAlTjXmFNiFw+Q9l?=
 =?us-ascii?Q?uTrWOS5TLOZv8rt/8Oa21CEctIIL9//B8BMYqMs0FCL/a7CMNob/lTsSFrFR?=
 =?us-ascii?Q?Hi8KoHobVisJZqzmhLof2GQwmvDaHaE0F3xH?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ouT8CBurN8+NkPAGs/4KAUCbjTDxBDVZcB99TTiSTXgpO3ainRM4NxUIYqxV?=
 =?us-ascii?Q?mMdeda/X3UFEjtPAvbr9PccYt2ApdNHAjl0KLBLjbSNY0oF+KOWeks9tsFbQ?=
 =?us-ascii?Q?Hs1tfnMpwX4PwwEY1TiwSubwLI/BsgLrS+omEtHgjruvrYnT+bj4C6oW7Rs5?=
 =?us-ascii?Q?tJbLpSL5QNg0QIFoP6zI7/kPMPyIngb438zGkbDFGf+d9rit4RreoypJtHcN?=
 =?us-ascii?Q?ueUgmU6d3P5Zv+Xo/X7jk7m4ZXwfSRNbOu3VmcEvw0YyMqIvNMBI7Ld9JJKS?=
 =?us-ascii?Q?GKhwrdVayDDp2Cr/mow8u5vYv/eljtTbXRyd8EK31DD0GImq1eyye7f+Xc4w?=
 =?us-ascii?Q?s0S07RVy1JfIDf6dpgFRydSFLvogb4jeRY2WFw4x/qJnnDWLEuebr4DtgzFx?=
 =?us-ascii?Q?zFav3rhcz1pgVLCZJ3jwZ4vnjR3nxREzRhv+Wy45zxwQY5BA/pxza6UWBR8m?=
 =?us-ascii?Q?6LQ8u8UOFSl3YWkQtcugTbxlV52QlBPjxtYL1jnNg6MoUIAZRB4wJyqsgUEF?=
 =?us-ascii?Q?EI8gi9Oc0Gy2VRnsdYfwYZfmLeqoi04vsOroJgSTiNx8uFAu2O0aBXFWbKud?=
 =?us-ascii?Q?eQzc8ksik77exM8gBW0FKs2OhVQZxE8Kle/zIzp+0u8iGKU6+qxk6snWhIGL?=
 =?us-ascii?Q?lH3NG+zaNLvLPDQJ4jKwvk4hT88KqBgJD8ttS0Hyy7ky3TFo2NCwmjBrsoLP?=
 =?us-ascii?Q?FjcNiuTjmt+7RFH8pu+YGui9Ss8YbcfLl45sYGS7FdlDFINuf+HpiFy3AsPc?=
 =?us-ascii?Q?6JY2rx4ipaCUX7YLEwJ7UnnaVX+ya4q3XglcI79UrALRmi9qhE1CiRNvKCyd?=
 =?us-ascii?Q?Pang6YwLdKog5aMRV44UnSTA0XLVwpp+IhVCO54eqzNIDtlDjaPxjzlJtBxd?=
 =?us-ascii?Q?yGLk9H23h0XuiKpKMU8PtfGh0Qf8nKY0EzQMw7U4Vxkuv/+5y6FkvgXzegyM?=
 =?us-ascii?Q?JQln82yBIaeBJ5Y7l5/M7a3oPCnNdHoBag7Q1So6+Md5zjH6uisADGAewPX1?=
 =?us-ascii?Q?U2W1EAAK16XB6muWLkbDcRKE/c7J8Zwzw8lmQKEktc0R24NNClVinQKIbi9r?=
 =?us-ascii?Q?RAEGUGJ2n5yCDwRlnSqnLCH6wbt16K2XSrVLMu3jXy78xv38imyKydNSJXn5?=
 =?us-ascii?Q?NXk9dnm/0JlkawBha4nr1oXpLrV5XHGbhGIxVE25fSWxOA8Dc5L6i//rr+/h?=
 =?us-ascii?Q?CTlqSNMv/LjhyOvijhiwgUsme7KSYHvXHvM+S505NYrakDMlywJF5ElUa51H?=
 =?us-ascii?Q?WUFumalYa8Eysj2D6uPk9MSaok1Mt+0jkDrBrJx/jYuELRQzj5x5GUoFBU/8?=
 =?us-ascii?Q?ibHpnDh+qAcWvO0lmJOESEhRc/yn65Fr+T1yguH8GnP4zle3pW2vECryMMdf?=
 =?us-ascii?Q?Sj6mNalGqsELM0dUSxdgVwteMwFUoC8p+zHYWCGzeFRbZfytSKUyj7shP6mH?=
 =?us-ascii?Q?pbgSvATf81AfQK0Opsq8V0uhkA/S/Cv98cHo6vOftFsAmPMJpLl5FH5XMbaG?=
 =?us-ascii?Q?gvHpVE/846Y//UZG+UgZ07ode5u2D9XXNSF/nErW7fH/c1tXllls5j6iCTJj?=
 =?us-ascii?Q?IhFBHCKzyBJxDjHTYFvk02t+y7IWiuWFHrgQXjAvMCUyk3llvcoDS+LaxSru?=
 =?us-ascii?Q?C7Rx6ujoXDbZtN00sGCf4cg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43b61847-3e83-4d5a-61f0-08de20b89a06
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:23:56.4948
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fvxfQujKNNKnJO7Fc1q5ml1WdiAo6SpW6h81WK9a17X2O/IolW5pBL8gqLY4Lk/bf30cz94BhkMRybL59Z28/C/uS4q7JiSHRRGNHxlsfldkzybqu+QEGsqxSiOa2ZXr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10376

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
 sound/soc/codecs/mt6359.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/mt6359.c b/sound/soc/codecs/mt6359.c
index be5c973903986..b15bdb15dbb07 100644
--- a/sound/soc/codecs/mt6359.c
+++ b/sound/soc/codecs/mt6359.c
@@ -1043,7 +1043,7 @@ static int mt_hp_event(struct snd_soc_dapm_widget *w,
 {
 	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
 	struct mt6359_priv *priv = snd_soc_component_get_drvdata(cmpnt);
-	unsigned int mux = dapm_kcontrol_get_value(w->kcontrols[0]);
+	unsigned int mux = snd_soc_dapm_kcontrol_get_value(w->kcontrols[0]);
 	int device = DEVICE_HP;
 
 	dev_dbg(priv->dev, "%s(), event 0x%x, dev_counter[DEV_HP] %d, mux %u\n",
@@ -1075,7 +1075,7 @@ static int mt_rcv_event(struct snd_soc_dapm_widget *w,
 	struct mt6359_priv *priv = snd_soc_component_get_drvdata(cmpnt);
 
 	dev_dbg(priv->dev, "%s(), event 0x%x, mux %u\n",
-		__func__, event, dapm_kcontrol_get_value(w->kcontrols[0]));
+		__func__, event, snd_soc_dapm_kcontrol_get_value(w->kcontrols[0]));
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
@@ -1157,7 +1157,7 @@ static int mt_lo_event(struct snd_soc_dapm_widget *w,
 {
 	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
 	struct mt6359_priv *priv = snd_soc_component_get_drvdata(cmpnt);
-	unsigned int mux = dapm_kcontrol_get_value(w->kcontrols[0]);
+	unsigned int mux = snd_soc_dapm_kcontrol_get_value(w->kcontrols[0]);
 
 	dev_dbg(priv->dev, "%s(), event 0x%x, mux %u\n",
 		__func__, event, mux);
@@ -1637,7 +1637,7 @@ static int mt_pga_l_mux_event(struct snd_soc_dapm_widget *w,
 {
 	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
 	struct mt6359_priv *priv = snd_soc_component_get_drvdata(cmpnt);
-	unsigned int mux = dapm_kcontrol_get_value(w->kcontrols[0]);
+	unsigned int mux = snd_soc_dapm_kcontrol_get_value(w->kcontrols[0]);
 
 	dev_dbg(priv->dev, "%s(), mux %d\n", __func__, mux);
 	priv->mux_select[MUX_PGA_L] = mux >> RG_AUDPREAMPLINPUTSEL_SFT;
@@ -1650,7 +1650,7 @@ static int mt_pga_r_mux_event(struct snd_soc_dapm_widget *w,
 {
 	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
 	struct mt6359_priv *priv = snd_soc_component_get_drvdata(cmpnt);
-	unsigned int mux = dapm_kcontrol_get_value(w->kcontrols[0]);
+	unsigned int mux = snd_soc_dapm_kcontrol_get_value(w->kcontrols[0]);
 
 	dev_dbg(priv->dev, "%s(), mux %d\n", __func__, mux);
 	priv->mux_select[MUX_PGA_R] = mux >> RG_AUDPREAMPRINPUTSEL_SFT;
@@ -1663,7 +1663,7 @@ static int mt_pga_3_mux_event(struct snd_soc_dapm_widget *w,
 {
 	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
 	struct mt6359_priv *priv = snd_soc_component_get_drvdata(cmpnt);
-	unsigned int mux = dapm_kcontrol_get_value(w->kcontrols[0]);
+	unsigned int mux = snd_soc_dapm_kcontrol_get_value(w->kcontrols[0]);
 
 	dev_dbg(priv->dev, "%s(), mux %d\n", __func__, mux);
 	priv->mux_select[MUX_PGA_3] = mux >> RG_AUDPREAMP3INPUTSEL_SFT;
-- 
2.43.0

