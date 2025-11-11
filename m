Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010001.outbound.protection.outlook.com [52.101.229.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33091238C07
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762821387; cv=fail; b=GrLiq4u6nhKTZNtlSCTpHWjophLIWZwo6mhlbje+y+poNw2ILjtXqz4jCo7zwr3dS0ZBH6OQ8IV8UVmW0M2i4lRxLmOEsiqI6Nj7bFkx1IWvcDcujELIZXHiARFUipgDZyQdM6b+w8YrAWOpRRTVyVY20nAhAXWl68W/+RuZ/Gw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762821387; c=relaxed/simple;
	bh=pXX+Gg/6NkN5e5HUjX8eSExCoG5PCROb3LgUxJ5k8cA=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=M+8yoc2wsym4RSRI70d7LXvGP9fj5cHIA2plhNYYIQc90WMsXugdJ/z6qsK6ekJglpzLMX++9QooVuO7CjvqSWVC49m6l1Z1+kRVIeURux5PKF6YC6gudP7HZdPS+IAY70BPKwetPsIZpo6pXem10KbqVLiy1xcLg8mBBdlHQgY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=j2R60/Pl; arc=fail smtp.client-ip=52.101.229.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="j2R60/Pl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QQnyFAKFXALLPYxdG0gNELM4JKY7XJ+nmJgJ7mvEqJDgxzoqeqd1JKXyrtn3f2E0iKxTMnp8Wj+bfJUCfyl5fM9TLMQSDSZOQBrbHMTKQbRWwnBmC7vptRsNiDBu4+5jlRfKCpfew6OqPdPOXmEz4H2hd79xiIhXU8MecjW7PkP09sry/aMOoYnpA+LERYuwn6Bg/y26T0FikimbCm2I8IFxrL9Rr8cLdSW9A/l/LHEm159/4wVh9gXcwLO+KVr2ahUffdPNoXdSK5Sf01Y4aVqu6lsaRuBpPI0SsMdthF4yApYCE8JJdBEbDcahlH/gYZk0V9HXeh7j8EfxvSRaiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p9AZeor8d3L9/QGwhWuLaed4wI76lrJtBKHtujQ/P2s=;
 b=AnsUl1sWkH/Ddl8a22aYoUHgvuGZLYOMZsM5Nn9X+81khia3xZFRtlHew6CafhkkhlhBoOHQ6t0jp6U+fooW0xa6AnGGvKlDukBMMeJ8tdxyvkyhG32MfXfpjaRNeIRPSw6LM1+siM+IUWvs9Rh9oLNZxNnAIxqJ6IV8x2R++yw6ghyPuQrhfrkQGhZo+vC9Vtgkq3Ug5Do9V3SVqRezvFeqv48L2X/8fRJ+XMmFYD04EAD6UIjM/3z4Ky2iHsoRfNU9OyqZhMXd6ETvM1zQZfYjvwIf3AVlQ8PbZx58LBJcgfusfV93TBt9u/KSNXJH9t8gAe730EWnBC94lb0amQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p9AZeor8d3L9/QGwhWuLaed4wI76lrJtBKHtujQ/P2s=;
 b=j2R60/PlAwdOuMqK+NH21RjUuJB9LM9wGeyodotcWDk+tcZh8ArOdFism8zshrx/xVFLGYYHRDAKERPr1ffBliFvkBD7BZaG1HTWYN+y67BEkculrQWSOk4n8c2h3yuP0+7ySgvmycPm8A2CoHSSH/ZZr85vs0sJQdA0BFTIb4o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB15789.jpnprd01.prod.outlook.com
 (2603:1096:405:2c6::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:36:25 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:36:25 +0000
Message-ID: <87bjl9tng7.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 275/292] ASoC: soc-topology: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:36:25 +0000
X-ClientProxiedBy: TYCPR01CA0176.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB15789:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b6c32ba-e416-47ac-a435-08de20ba584a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?C02OPe4IZ47n3aevFThAU8kIEjYrDl8gK1hDl9s5J+6dftcNdT/2ig97C5Tz?=
 =?us-ascii?Q?9kSgQyPOCmbFyoEE1DDzw7ruIjdUcLNj7SXwbaAliVORNKSedaZgMGB/YzMt?=
 =?us-ascii?Q?mMYtP3Qnao/6zyNEto5BA+o7EBHbGfa6Eo2wFkYBKq7JRWaMhhBotdYKQC/x?=
 =?us-ascii?Q?q57kL+T+ETiU23TqR1sNPrekeswoSlkaCICyz7j/3mJajpv7ySj7A3yngpG1?=
 =?us-ascii?Q?dgpOA8iXgH9V5P9+hdt6ajqunpOGbO0RsU+Zzoz7NxRrtinx8IDkSav9uu0D?=
 =?us-ascii?Q?GLL1VAs8joi3URG6Y6Hstji2HGkKkeKuqJakFCuEwcvpdmPM7ISq7z2dPh1h?=
 =?us-ascii?Q?t4dz8VJPlUARML0OQCk3fFkjvR3bJmF/qErR3EMSGPlS3zZcMw7iXGCOFUbD?=
 =?us-ascii?Q?09IwcNgTKjYv9mR/6E0uocpVDh553phL7KW6nd/zPSRqQAiUT2Thl5N0SSzI?=
 =?us-ascii?Q?HedXfvfFOfzR7sam4qKHVM/zsKd1H22OoKaO4y7sNMAzFjspcOnd1eX/G2TX?=
 =?us-ascii?Q?ZSjuniCTEBeFxeD6RbIhD/sZt16iziUjhTJu6aqec0DkLEvuFoezZ4wzke1T?=
 =?us-ascii?Q?GdrJ0HSKWKACffW7GlyRERLJqxdc5gkPK3bz9sxgrMfR338O2MBa5NH9Rp/m?=
 =?us-ascii?Q?OPxy+cUtbiHD48bvllwTorZxcX+ezZPDgjJr5bFmEF7w8+B5/UaJkjPSrxuk?=
 =?us-ascii?Q?EP/lhrbchh1dTMDt6gUVB05nE4XGhT64j+h2aG68mCatbaTRBFmFoYHkPFuw?=
 =?us-ascii?Q?WyTBuB1HQhOPxvziXeLVMOSv8UU3Wac6QgtnNxYqH/L5yfcL1kLjcOlZz62E?=
 =?us-ascii?Q?1WsGklUV5oVueFXzjiknn0RFg4cgLEk8EtjTh0TDkAaskakv2DZpqSWK71To?=
 =?us-ascii?Q?zxrJ8rYRQfHEC8mRqsSJWk4PdEBJ2jFWJdPuxTOaKvp3Ymj69TMxfPV9WZ7S?=
 =?us-ascii?Q?jyd9dlDQnysAjWTQ06aEx+qecSGRmWYkGpbhbAN9h1WgQHg04riseq2iSvFl?=
 =?us-ascii?Q?CAbxwXo/HdtgLprE7Nydq3tPfUq/ybyIxviKQ+AO81my+lNL5uUZSngwbb9g?=
 =?us-ascii?Q?sksCSPTbS+VkWGWqHfd0/tdYxY5Uenjx0YXJDpbobQR7JiW0cBP3gBBPblqw?=
 =?us-ascii?Q?448T0zoHa1s77tNmiG3X7ym2vvQ8OKSzC7VncRmT7ZF64tMADT2E7aMErGRh?=
 =?us-ascii?Q?Smqwiu6VnhAfsHiQdVqtslM9MtbEBllCVqgIk5bM5ITfRdlys4SMC6GO0XRy?=
 =?us-ascii?Q?iPAsjp4GDrZ2hQeO+cmYXe96n5TsoeFOIj5U86aPrd2SM32LWbstkdZ6XAVi?=
 =?us-ascii?Q?MdtufABnXO/Pmq74SYvyboqCMnn46YYxGW3qq5+MdZ9tHQaL2QxoE/PphtIj?=
 =?us-ascii?Q?9yyP3tFym4GeiUJez9D2zP7PTjGqvCrw3Kl9tb0I3g86ewfKbjIL3GChs5UE?=
 =?us-ascii?Q?X2TLLtepP8YqTFC5opzFK3GZ/dqN37gRqA+YYm7vgUiwcgphryCBhhs0exNf?=
 =?us-ascii?Q?kUx832VSD6BwkWkFx58Vkn5CpcF9yqth3bkD?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FSemx2VUiwr3B96wievXzEj2CqHBK1qB7pT/u5oQMfI6+3GF6hklSY3iBwIn?=
 =?us-ascii?Q?0YIiyyr12tUUBOyBi3e9q6MLLuJ73M4hZZvd6/6Hf2K99VuxtPZh5/whDD/m?=
 =?us-ascii?Q?m5vvlAE43JZFLJzmnl65nX0VfpPM52SmgqNEioSK/S90akQIz7nIPz9PH+aF?=
 =?us-ascii?Q?PQ79PVkCKFS37pZirycOGuUP/eG1BDQclMurBM9WCLCdWrwXuJY9sBbMCB8p?=
 =?us-ascii?Q?gY93YMpbjTo1RNT4fDyYtPHCUn9D8pJbuhQxKHtei/8PE4pB3WXrm1dGDvAu?=
 =?us-ascii?Q?QyKefOTaPiV6U55C3r8JBeYDBMm+LZ5zF3cDTbpW9m5D5sXlvHyxId1Mrrs2?=
 =?us-ascii?Q?73QnpumJCHqhu1vcqzi9JvFTcpgpS5tHMRdmg02Q0d5BJvexg/J+VN6/nv1Q?=
 =?us-ascii?Q?/7GOYbztGS5n8A2PafuEbwhtzFehPkNaEn+TUC3Tyv5dn8kwLc6yNdhW+llr?=
 =?us-ascii?Q?efvJGiGPNtgkFVb7i+ZErVHhIizVhsXrqERPcwNgIqmfs3O7lhVyJfiMBz5s?=
 =?us-ascii?Q?ZcXuzhmWgYTw1oCosibDaluqPvey4hGNstj04kWajl8gjqK1G6+EUtNuMyq2?=
 =?us-ascii?Q?8ZOVWQfkWMXRTL77C30E73OcdUNjdxOuse7IM+48MgNmZoVWEW577jIXuNGP?=
 =?us-ascii?Q?2KV7Q9r8EAMGHr0tdDy5iYYJIiZsXW5YD4+s3KJmCu/Jjo8ZNynONXjjoPWl?=
 =?us-ascii?Q?sJ/gYUgCwgR4e0uKq8nvsvYoUeWaDmvtsczTGAw4d3VGtWYBQZj8xb57Ktr4?=
 =?us-ascii?Q?ncO1u4pKJ6cP952QVyVf9kjXdBXzZRVLwYyBlBiTUbW2Mh6TmPxvbkrEP3L8?=
 =?us-ascii?Q?flkTV1KLP6mN3LoFm51xeqJrOLUNX/kC9NHmtSWXhLxZFsj4REZXZMHNIPgp?=
 =?us-ascii?Q?myqZoZhjvUpHuLprUFopsVOqdafr8BdUC0O6n5YQ02A1vXo8y97D3fAmtNIW?=
 =?us-ascii?Q?ZaUBx4o/oK8DKxQF8csZEtrhBGxhL/wGpYBo7Ub+0Ze11UHVEN4k1VosjJSJ?=
 =?us-ascii?Q?i8eYZzVuNMvc5XWja9w3moK/1QuHUCqKu+UOHC5cstMkdsQPyF5tmmqkjPZY?=
 =?us-ascii?Q?mH6Uk733/DwVZO17SXR8hDb5H862PL02tHOGT0f1N6FNz608OwEgZEbQAnqd?=
 =?us-ascii?Q?8RAqk/m1vrvjugorxjzCqtVjlAG+eIeD7Ws/IwC55iiW+gDvXd91+W2Q6/y1?=
 =?us-ascii?Q?7UWnr5NFumtKHP5kQBOvKtblrkfNsJFoHKmmzTtxzevp22UyvIDb0cwbZqoz?=
 =?us-ascii?Q?YS9MPF4raG2u7xrSdDzFKHnDXcoAGhU0j9+B2u/tm4+zZ/6wk2Prswn7Lhkc?=
 =?us-ascii?Q?RdEdfQlm7ikgTxrHKENfCsBQM0n9HZyAKzB2pQaXB2HyluRgF3oeNpAC684e?=
 =?us-ascii?Q?vKZu/cDDoMmw/dVJGH8furkZ5ZG10RwmKVlii8127o4CgeSyfrS1K06BvUgF?=
 =?us-ascii?Q?dKIooCSfjQyvQUFFqV1izl3ezvNZiC63tHCGL8uOswBje3ElyVqmT8gC87t5?=
 =?us-ascii?Q?7pS6pAUBD47kd138OsapHJ8nQFtip7KrIypHk2jZn0mgAYHVTPUyvJ9FgBUP?=
 =?us-ascii?Q?OAtYK/roMGDLLoHqk5ZtGjtZzJVoQKQeaPVMsrzm3fmCKw3az6GPuixZL8Qi?=
 =?us-ascii?Q?f2mLd1MY0NLG8iJeXKyMAvU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b6c32ba-e416-47ac-a435-08de20ba584a
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:36:25.1682
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ezvDnnRqitXraP+xCMUnj80LG1Mh3LsZ9UaShbI08lHm/h8oq2q/YovgJNq+veyj94UEwJ7tjHLDtwLzDI7ThfD4wwL3kPlTIBS4KJnMTgZ+WrX/UbKewNThHXr36IBJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB15789

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
 sound/soc/soc-topology.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index 44b60324eaa2e..064b8d76b9550 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -1026,7 +1026,7 @@ static int soc_tplg_add_route(struct soc_tplg *tplg,
 static int soc_tplg_dapm_graph_elems_load(struct soc_tplg *tplg,
 	struct snd_soc_tplg_hdr *hdr)
 {
-	struct snd_soc_dapm_context *dapm = &tplg->comp->dapm;
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(tplg->comp);
 	const size_t maxlen = SNDRV_CTL_ELEM_ID_NAME_MAXLEN;
 	struct snd_soc_tplg_dapm_graph_elem *elem;
 	struct snd_soc_dapm_route *route;
@@ -1097,7 +1097,7 @@ static int soc_tplg_dapm_graph_elems_load(struct soc_tplg *tplg,
 static int soc_tplg_dapm_widget_create(struct soc_tplg *tplg,
 	struct snd_soc_tplg_dapm_widget *w)
 {
-	struct snd_soc_dapm_context *dapm = &tplg->comp->dapm;
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(tplg->comp);
 	struct snd_soc_dapm_widget template, *widget;
 	struct snd_soc_tplg_ctl_hdr *control_hdr;
 	struct snd_soc_card *card = tplg->comp->card;
@@ -1245,7 +1245,8 @@ static int soc_tplg_dapm_widget_create(struct soc_tplg *tplg,
 	return 0;
 
 ready_err:
-	soc_tplg_remove_widget(widget->dapm->component, &widget->dobj, SOC_TPLG_PASS_WIDGET);
+	soc_tplg_remove_widget(snd_soc_dapm_to_component(widget->dapm),
+			       &widget->dobj, SOC_TPLG_PASS_WIDGET);
 	snd_soc_dapm_free_widget(widget);
 hdr_err:
 	kfree(template.sname);
@@ -1367,8 +1368,7 @@ static int soc_tplg_dai_create(struct soc_tplg *tplg,
 	struct snd_soc_pcm_stream *stream;
 	struct snd_soc_tplg_stream_caps *caps;
 	struct snd_soc_dai *dai;
-	struct snd_soc_dapm_context *dapm =
-		snd_soc_component_get_dapm(tplg->comp);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(tplg->comp);
 	int ret;
 
 	dai_drv = devm_kzalloc(tplg->dev, sizeof(struct snd_soc_dai_driver), GFP_KERNEL);
-- 
2.43.0

