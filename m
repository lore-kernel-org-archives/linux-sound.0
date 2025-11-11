Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011005.outbound.protection.outlook.com [40.107.74.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE5C21A23B1
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820722; cv=fail; b=ecidB5p1ivchvSjerPaqn4S3Hv1ZogjfKhABZQHvZsOHHO5osoSuIyHpwryaPTQdxyQ2dCpuLWC13i8w799KnWrcPj22fxTN49XyadbXilnFsbMIBnxbVQraMbdbLDu7RhfUAiEXCmtH6U8nr6FjOfDcI7Q1abePT9/LHnehjwk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820722; c=relaxed/simple;
	bh=e5vOCLgzG/f9qD+wm92jqnkgh0p4zKAhgdbrHyaNqII=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=bk46L/5ACioXYiE2u938qss48W/ePJh1EqvBR+RPkTKySPeaCkJYHaKFfMZ3K/E1n3k/1/LSuHquAb4wZaRFTogcpeJxPkN/MAI6WkACHBPj+4A3aLl7cEa4AqZgf+DstquiQl68gAZSO/zw8bM3CzsJ7Y5zkWIcezVfmlv2l+M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=d2Z07YrD; arc=fail smtp.client-ip=40.107.74.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="d2Z07YrD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m65aELN8VEqbZknWJhgflU9RwuzQ5x3WMIY15lVVlZIl37jD7GskX6qievwiF+QPdfOmMdS8wEyUGyVCSKqRkSF6KaXiLtZuKgyNGJvB6c/3H1rxOe4RueB3lDMwitZSiUq7/q+661pnW//yfxas3DJpGKlp2rDFBCS42AtThngusOfP2L7FY7WgIIzkkauDz3tI4l0Y+1mouDd5v/2UikshKmHAsICz0+TxVZCEvoGvkFb+2u6XK3+SzUtv4fCNLcQEAnQMv+5N9Lee8dG+5ILhxFktsx/OF5f0xXCzXF52Vxy2hupqQbDzJIdHVBwh/rMO3XyY2Uv6IWdED4973A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RzYeC73q7vvavTj4Fx/yUhhIbGW6NMj/WtJFDNK88H8=;
 b=H1DfRgyMkUXzUyyIyDLaGofF/FfYGtSiQaBruLRy3SJlqlsbgOZ6h2lUyfH9RM3WYFRa5B//7C/J3ogUmu5LdQnYe1biMz8A6zPA4htbmumZ19ei4IsCR2vxguvTb/+Iwd2Xwp0X8qR4Q/dY5p9Uk9k/rBSoH1YLTRGTo+2n99fCXAc3ADqE1TB7jAv8+bHfXVwaug+jHHf8den0e1GVbpcqwGmF4jlKTr/QHUM/Rina6ijoCx2f8EJ8zXiLqmgFoEgGO8kUAPx1kNFbNlFguz3BfAbav3k4fRW6hWuiP3BXueCbV2DntSZd8/N66HFfRoU+PNb/gNHUcMIpdXhbVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RzYeC73q7vvavTj4Fx/yUhhIbGW6NMj/WtJFDNK88H8=;
 b=d2Z07YrDjUcKK0pXJMQ0UZwRyYANLc8pGYQ4CGdW367JQ+Bq77i1xY6n205n/QXJRh3TNAOqBePhJDUZg/Nd7rYEvmli2/Di+VvYgUU8IW2YXt6tHHDTMM9GYss4Ta1gYFY9z1qJ9X50gmGa+bofPuQ/Da92LGvqZNlkcPN32nE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSCPR01MB14439.jpnprd01.prod.outlook.com
 (2603:1096:604:3a6::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:25:17 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:25:17 +0000
Message-ID: <87tsz12z6b.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 112/292] ASoC: codecs: rt5663: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:25:17 +0000
X-ClientProxiedBy: TY4P286CA0029.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:2b2::6) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSCPR01MB14439:EE_
X-MS-Office365-Filtering-Correlation-Id: b6e8cdcb-6e3e-41e3-4e65-08de20b8ca8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?berzPCe2xGRuaYv/XeDoRKI/DIHphKbby13HK8vfOfUVFfAJBTX6N085vU43?=
 =?us-ascii?Q?kCYqS7nr5yZhXeFffVlf1Vlfzz1Biwz9VwzCNK1nfdR3RLXY/jWRIJfRFUqh?=
 =?us-ascii?Q?CYj9vToji3+pks0FPPVCj2m4npzw6fx+unUmwWVYualaoHxIYL8/0gza8oYT?=
 =?us-ascii?Q?0xnUQXa/0f6U4mLifwlsnAzcAClrxHl82LWCH0CE9P/oiLZfk9aaY5fMqHsy?=
 =?us-ascii?Q?3R+Ke3PduVMG+HGBNmJwxwZj8+N1CEHLH9WOEXCfnjfOgnNxiW/lnwmC51UR?=
 =?us-ascii?Q?FDjYvltd4nr6E87d1noOicFsM62Jk5794QS/zqGc85QivQmvyWSe7uLF5yYv?=
 =?us-ascii?Q?/qgsSCnmtPQAUeOl6qaBNK+B1MGYDhxUG+Kpw7fuBKeq+/I0LkWnJ5rPs2Lr?=
 =?us-ascii?Q?LxxHL3WtOfTv8n3NvYMAfgtn16CkoxjIcDUj1VA5oGmqg1QXnKv2bDdOmoaZ?=
 =?us-ascii?Q?En7C8Z7LCw4zMJESuy3Muq0d+P45mevbF12SLfCDxrBwT/65RgzyT+HzAZnI?=
 =?us-ascii?Q?E/6z56aapBLRUXv4fjqPWaLct7CY2uCFAeiSUREbvZE/45OtzYeaYJZMOETK?=
 =?us-ascii?Q?zN75fGw62hkDXGoJOLy4/q/s5wJFUMVhPtyfoKkb75UVM/8fuhXoyuZSklpa?=
 =?us-ascii?Q?zxr69neUuSmqJ+j3SrASNAiVQU1oKS6kYb8C7mqc9aTMjTGUAmB/6X0InHjm?=
 =?us-ascii?Q?5+gw88Jq0Tu/rjvV8b/qxHQNYUUqJeK0+ZT+w2LXgVFIq3Yw6sUdIM9I7/v3?=
 =?us-ascii?Q?FUWlgynzMW5yobnaxWDgI1xtVemXhKJ484LyOa//97oZtFMJRIMja4XKT+fs?=
 =?us-ascii?Q?HItQei60S2bbNaIbPRWm2Ijgsr5ZVGzw3Y5Q5AyW087HmSwz+mCdz/TTqWV2?=
 =?us-ascii?Q?TKiutpfB3rGc8pOWUrtigaD0AJZsoACPjtokjEPY7PRyOjSL1zN5XPixt4P/?=
 =?us-ascii?Q?TQquBh3r8tvd2SvSQkA3maN83GuURXAUKYCzeyHyfMy0ll/Q/NrhIaV5CmS0?=
 =?us-ascii?Q?oDg6J9kSQ3Ehg5zLdDCw4SwDnyvbvulXP1PUUdm2f0ySiKHDFQNSfLiLv+OA?=
 =?us-ascii?Q?PVs5bJd+MZhoqDQLMlB3PUhuM0zmhlxgpLccBjZQnl0wTDd6eQ8SfTlhLa5/?=
 =?us-ascii?Q?xfNkOlevMmPCzNRMzAd1Pvk+ccjwr3z5pF2jIJTOSroQREv4jPWZriGIIXlZ?=
 =?us-ascii?Q?ZR9j+eiZLhtzW5nsgbbOBpp9G4YDL6uFJEkJroZ6rI1cTUKTjVeXKoGorSOl?=
 =?us-ascii?Q?4i2xiMBLhmmrRPvY7aH5yWTq0RSr1Ng6tryFI8mzOQZRY6d1hmoJA31Hk5/e?=
 =?us-ascii?Q?mi4WVvDMKUCyZZysUvLwsaNu9E8eTPqlc/BbidHfKvb6SElbAVJymPaAi+Jv?=
 =?us-ascii?Q?1R8bWQMUkGQxOt9Bbh9lu2GyvCqAbkWq2/RzipMRLxrA44tmNWytA0sIi1Pw?=
 =?us-ascii?Q?yNhIGmsDxvwfGjtXWRTz3Sp1kVbkU6aAI6KFLrpXQwm5O2zrR02jcn28CZj6?=
 =?us-ascii?Q?C3dtxi60fsHZFqI+y6ljp4o6WgJhVWGz0G7Z?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bmVV/gqdnFoyl9OEjiCP7To4cIoZ95FM2YyAVpgjIbJGByFkV3c5FxC/C9uq?=
 =?us-ascii?Q?BaChJs5AObtJBtipvfzegVNHbbU0Hd3zXgEOoaATxGEYTecHZdzf0vKOvkZq?=
 =?us-ascii?Q?52v7x1o1Ecm7OiHgAccGrg7grOHaHYZRHSMPoF9io4/DN1uSrUCLCPL+LJcI?=
 =?us-ascii?Q?BW+2HrehLYePxFXvbaH9lA3YXSF1lPC0KklCxj6PTPM41ktcdIOHRVgeIQdT?=
 =?us-ascii?Q?GkaQ97l5D0BeZ8TA7Ho/cOZxz/BgA7NE4y6bJJvcEMtKIFCSYPWjJhtdYqqS?=
 =?us-ascii?Q?AVzl5D0wkNgNp9sFXFaId98U1+tqsXSZUys1js7o58GL69581dDhBQ7Edq0o?=
 =?us-ascii?Q?7FJ/sBNHWQ05iUASDN7a9mtOXisSAOwWR8fUKWsdA0TFhfS01UT29CrHGjBM?=
 =?us-ascii?Q?K3csmJMkb+qvlHJ+4+SYVVbBDnmGF8WgvbCRk9pX4uNlUng3U9iK7hwLkmV0?=
 =?us-ascii?Q?je0StCw950t75m0vjCmsyXQvzVRz/Y62KPCTiM+9gFS9lSartWU7a5hRTo7n?=
 =?us-ascii?Q?8MJnj8SCbMFh0hcjuwdxPRlPoioFPfmLu015cdPl+IfXZZ354HT/aCfJ3VQq?=
 =?us-ascii?Q?T0d0qqzCaQVeALUJGV6OkyxgsCt2J/W48G8LLXizgNnIrLnuSBZBF8ybhCJn?=
 =?us-ascii?Q?aCtFiLKLzMIgsbg80+QBdzWyqR259yvWp8MxYVRDm8HFMjJg5l8aYKZq0iAl?=
 =?us-ascii?Q?S87pOhLV3Y0TToqjGILEGstiIDUQA3nRsum5bl8812jaP52fRThZLasrP9ac?=
 =?us-ascii?Q?4BXX6bEa14TBUGEhmKOkkc9iuLCRqawiGs2Czu5tYQpJiR2kmMDBSVtpJK/t?=
 =?us-ascii?Q?3qAOWkDF48gWENbBnI/20ag5mb1WWrmgg5pWdVJBRD5U723z7D+PhYVkiuGe?=
 =?us-ascii?Q?weZ1R19YxFGTSD840HlWSg3Pavz2t9eqGQVdd66/NcfyG06FzfYLTKbJXXpD?=
 =?us-ascii?Q?6lJFgRXhG/QhJCGxD0g3jMKNLpR6ynWTYW5fSI5p5ARW1opZemtpDZ5+3Fjg?=
 =?us-ascii?Q?Czq0K5rFSzEdJh0/M+kz68mR6/CG51goK2Jcfs40umTY4SuAFGD9Aq4aKGXe?=
 =?us-ascii?Q?1S/QWkJPz2BelMt4qsdVyORR9UpuMmI/0kjdpkld/mA1wpCuyXttssFqjVEm?=
 =?us-ascii?Q?JrsYJoOSeRQRYuH9ZFzbr+rz5Rq430QA3HRC/A9BFzpLIPxF8A6V7S4YMfzV?=
 =?us-ascii?Q?WiSBXS1CTN0Ttyu+YTwdq+duFg+PgzkKwabnBWCKB/R7WdApm95LvI1m0EtR?=
 =?us-ascii?Q?ATogvHxbttKoBX56UDuG4C2d5w0gZBgwaaupOveZqTYUYvSnJW4k4yQRvykk?=
 =?us-ascii?Q?AcD5FDuPCHXoBI3nmN89hH0d/9vwbkD1TSTG4u9XZJ3RbhVAmXmZ8GUhziNR?=
 =?us-ascii?Q?quwfnu6DQBWuTgJMH4hMDZPNRMDUMfWeppdQTRRbmdkXkVFgP/IsXUBxXGzF?=
 =?us-ascii?Q?Wj8OyX3hRpYi/4NS+k6+iCV4D0jCCNOYJokogtDCPfx3TQtzV6ulJNP1UoI+?=
 =?us-ascii?Q?1sRM6F2n/YjMBLL+Kh5k3J6b/nXqbGWYMH3fPJcG4vb7i9O+pD19Tl+XCtF+?=
 =?us-ascii?Q?yWeWJw6c1tkK96TSnoNIEy+sHwCobEERJxovp2ttOeNXG2WZ7XHfvzsyYaEU?=
 =?us-ascii?Q?KyOEjjn9FjQTNx3xFxj1+H8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6e8cdcb-6e3e-41e3-4e65-08de20b8ca8e
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:25:17.8527
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lkb4UNg+HKINygzhL2WP/SqCe6nxBx0zl3N9sHHb0KtyX9CjkkUWyZTFxP+Jd1uXgTIUlQlgcbriUUh/LvASDy7HDMmuZJSlmvn27zyR1/3+g8wCTp/q/wrdb2YMEUl7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB14439

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
 sound/soc/codecs/rt5663.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt5663.c b/sound/soc/codecs/rt5663.c
index 50fdeb8f06061..e4d8785e64c10 100644
--- a/sound/soc/codecs/rt5663.c
+++ b/sound/soc/codecs/rt5663.c
@@ -1463,7 +1463,7 @@ static void rt5663_enable_push_button_irq(struct snd_soc_component *component,
 
 static int rt5663_v2_jack_detect(struct snd_soc_component *component, int jack_insert)
 {
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct rt5663_priv *rt5663 = snd_soc_component_get_drvdata(component);
 	int val, i = 0, sleep_time[5] = {300, 150, 100, 50, 30};
 
@@ -3140,7 +3140,7 @@ static int rt5663_set_bias_level(struct snd_soc_component *component,
 
 static int rt5663_probe(struct snd_soc_component *component)
 {
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct rt5663_priv *rt5663 = snd_soc_component_get_drvdata(component);
 
 	rt5663->component = component;
-- 
2.43.0

