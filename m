Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011017.outbound.protection.outlook.com [52.101.125.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEC9B17A586
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820562; cv=fail; b=k0WlmxLADS0+36A8S9DWD6Mdts619/8Je0TfPjKRMcL9LHTM4H06aY96ZOSP+tclqN5/ku8PLNBzaiVnDcHQsTIaIshQgP6pQUoE9Pm6AD4TbncLKzpWrqbsK9Goxdovf/dqo4BMT7Wd+rE9b6hB7d/XubvZsBxVOKv+saLM47c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820562; c=relaxed/simple;
	bh=IGqUYXmSOhzG9SFjsUjgxrulMrO9bTBfq4a3G/8vDiQ=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=VrqlBwqn57ELvMisupY07eWfi5XgUJ2XfcOOe3kWWwJiLAFBIiDbFHZWt+znZ3Kgai4RO1LLj/pweWfBUDoZ1razoh5C2VSGUqE91u1xd9dMlXBKi45N/F/j9R2cGs1D/SLYGGjiePmYFZGVJEy9GTvqsBXSZmWixO17YA+Vb+4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ki1LpT7C; arc=fail smtp.client-ip=52.101.125.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ki1LpT7C"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mEqRWojZevHBjXVAJVkLxTGG+4mM2fadwnFYEJG4fnTg6HtCWl41NDNj50RVO02zH+1WIFKY3gnfpbiHfHl699Iwb64NOgci2Qo+GrEuJyne0KJv30nzSjJKGcyUcFrW+AYjpUo8bW4AbxnGDOWWke7slrg5zv2HjWEBlJjrtfFikyE9KHoyeZj0LzUB+4qfSNjxVN1ZxPCrRh+UOlPpCVAGIsFsldTYxn5XPjXy2uwF/rnHTrnGmY+VadO4e9GyfNBhR/QWiOmrN9AJATNxgisqytJdmE2QRBOPZ3LBtJJG5ID8te+T9xusa86X2KSt5XaK6I7d3Gw6cSpQZ3yUiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GVXEnEkypeN/4jNSvNPLQLOy/w01DqJ5xGE1eIR8EBE=;
 b=P96yn8GiVC5m/ak9tdG+r4TlEf6ojEO3GWXTt2DrMnE2xLcfzv8S0ez/2/W0xUQDizpno2YgdKhDLz7jbKjAU94emTLMAVIjXtM8AOnwyAIuXWSz7xqmih2VEr85j6Dp9vsNS+NF42OvmkIoD+tG8zefJAmR+rcH++5SVE4xUy6igNVjoNZ7KGjjemsiZ7fDC8+fr6256COZRksJVjvbpVohsew1JZRsZ+x/ywd6rLahkWW0xwLKifIgQLmC0F0j5LTtmHRau/z5GwzuXZMJ/lx/o29wdEA6Hr0LHtxtcA1Z/tMNhmmGGqEV56WGaIWBgBEbJpfzkN16hWozo2CC6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GVXEnEkypeN/4jNSvNPLQLOy/w01DqJ5xGE1eIR8EBE=;
 b=ki1LpT7CV29aBD3CNa2m/mBy5JHFIgkZNYOumq50bU7JJLpT1V3luzybcQKI+eLzy84GLvH+cfxyGxvkXIAdB1A7GagbkvHCt4q1jeWSnJSc0eWUcaIKZ3+317AYU4JLNtO0ZSP5Ii/N03RG3a339JtQ6VnSd1IuC1RjAqWyVQw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB10376.jpnprd01.prod.outlook.com
 (2603:1096:400:248::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:22:37 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:22:36 +0000
Message-ID: <87ldkd5sfn.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 068/292] ASoC: codecs: hdac_hdmi: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:22:36 +0000
X-ClientProxiedBy: TYCPR01CA0194.jpnprd01.prod.outlook.com
 (2603:1096:400:2b0::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB10376:EE_
X-MS-Office365-Filtering-Correlation-Id: b93fe5d2-4675-476c-092f-08de20b86a9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Yo2JVD/XWxPCNdKp095XUgcb+d3s8TY5ka7giOVBjbILV5d3V0I9QLvR5wVF?=
 =?us-ascii?Q?64gfSFaVQBNlCmHsmJqB4w+/tSb+9Fx/F4YyOs+ERP9q7c/TwipbdBauH0eI?=
 =?us-ascii?Q?AtlN8q6ayFwT7E6blzqNk2lyFeBF3N0LkfVoUXQbmH5klySNQlfyP8O4GqQU?=
 =?us-ascii?Q?oxrt0+IkFwS+deJ0WSBGkQsNQJjtSkfw72eVsfBWrjtfuK8MsL2q4KFKsCaL?=
 =?us-ascii?Q?PdT8niivVokH1/Oz9DpubGrX3hRU8ZPseD1AK4HtoX1EmqyqvB5LbuU2gJI9?=
 =?us-ascii?Q?CEBMWWqDsV3Ss5IGZmcOPlB/yIXnr730EBff5jR9Qlo5fXQSDYgs5l8ZAMaC?=
 =?us-ascii?Q?37/eHhYgpjKKRGtcIQU17MJZGWXlGhyJpPdgAVsLl6/xUafwKyYKwXJQlYkF?=
 =?us-ascii?Q?HOzWUbxiiew5WSfjacoA+BlGcm5NWWbYzekoirNME09EV7XNVqaRW2mKlIkt?=
 =?us-ascii?Q?NUpqIervWY5ehGPOI9Zbs6VDg1OEoY2N7kqwIvfi8SoOUqzPgBVIx8vrmYlJ?=
 =?us-ascii?Q?Lf427j+vBBPdl4HRPWUkECoV0y9mWU3kSkBX9eBZ/PGHPX1zpheQh5zaFtIQ?=
 =?us-ascii?Q?jnIqYBpMVwSsuCfczVwl4Hpg1WLFTqm4Nx7QjJLq7aCCT3SPencbfG1k3y30?=
 =?us-ascii?Q?J7vdeHfmWqTbE/N5gweyjYR/A2VMOoReNt90sGm7hVQYM1RlMohCXBWZP58I?=
 =?us-ascii?Q?+4GCGOCV9vcSbvoNhLIWxT5XiF/YAuolajELxAUnBo2/6S/XdciMcKADWODc?=
 =?us-ascii?Q?mrLYxBNcjG8dJrcGico+39r8tUUBDZ2d5mC61Qzib0xpkRZM5XwpwDdclN/w?=
 =?us-ascii?Q?aDFOU4GlTnWihSZwrxcBXMW/aJvPLcew1gsNoccwL3Wb0Pipn6xbwFwkGqFF?=
 =?us-ascii?Q?WqAzuceYdaxYyZfNwqkuS5Lauui2+aIYFyxjBvH442IHwR+Mgy55Iql8v7iF?=
 =?us-ascii?Q?8WX9eMbAPEpt6lopRspQexiTRZqzmc0N7M6IpsgNDGTVJideKUkM5pQqF9a7?=
 =?us-ascii?Q?fZXO1H//UEsQn7LNED/WrgiCF9c4TtvZkE+S3SV9DyevkYza6rjOd7rm0ns1?=
 =?us-ascii?Q?HYPmwZSqwJQKvtmGHO8qbFvKYYKtUdqoFdjjTjXdhthHw+oyr2/NeoAJ0+rQ?=
 =?us-ascii?Q?YmtHeNM8mGn1VAS2kNYCOlGjqsSxnySYV709Un4a7h4yFNSeW4ZXqQ93Oncg?=
 =?us-ascii?Q?8iHYR7kNmzMPRuYBoxuYbcn44k2Xjt8xagRcIK8JAGgEYUXM4lQdfIdneQVp?=
 =?us-ascii?Q?Mx3EOyvs/jCM70714/5Uf4E+0Wglkli4laSOSf70DGCpIYDoyYyS6ZIa9Bzk?=
 =?us-ascii?Q?gp8jXIZ7V51D9I5J8BCqIyi613Vx4j555uFi/dkSGBQ4bzlMaHN6g1ssb4VA?=
 =?us-ascii?Q?ORMINevhMdIodKeeuXJ5T75gW4ICD7R2X05XjqBuAPDFauIFs+KZAyhC7lPP?=
 =?us-ascii?Q?Rxsz8h314/qUPTqRZm8jjsI4utRPRCzLc6EZv1242fLUTZ7s2ace1SU+Q2xX?=
 =?us-ascii?Q?R5c4BwnY1ruqds5AXV8s0eU3SYnPskpAvxqx?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kgb8IHIq6HpAVaTSaRcQPEtTHLQk8THWIFVbcLs4p7nfSgB5HtfJvljnmRFs?=
 =?us-ascii?Q?8GYdaTfhF3ZpcyocE+70Lfnwt6YbF9YoLS7mrthQ8/24u7OL1ODJ5ops0Liz?=
 =?us-ascii?Q?S0jIz5a4Yp0pn1eWrdIpkXZcWsR4WY51WmfIEZypJF2xw2xmZBytGcNUPNDd?=
 =?us-ascii?Q?GicE12kxOa7Di4ec9Goiuggos87HD6w1nmvHTwecKnx+1Z98DMWj7YvhfjX3?=
 =?us-ascii?Q?SjbKOLgvFx5X7r49ixu8UCVDWcOPlqhbQkKuyIsDHY38IFLRo8UCeqvJJn9y?=
 =?us-ascii?Q?dsbX1tpsPqjWz4LRA0nFmQYsifRt5yKq1s0Hj5BMjJw/h1hyMtjWxuzQiYGY?=
 =?us-ascii?Q?tm9JogU6B3j4VLhjN7dwgQR0CSG/l4+MewfnoUobwxcqs12rGKDhHrGVQv3M?=
 =?us-ascii?Q?LoOYs1phIkKqT1OPePleCJCrzUntOV62YeRO4fWPirx3W6CmvaMzoCEMKRry?=
 =?us-ascii?Q?AfwyAh6q8V1YjzFVgzdBIlnmigoXqiAes20vOHpETpHDHeVLyhwy5PYyVQbo?=
 =?us-ascii?Q?Y7hx2x8qOoeg7qOfCAsA2/HR2MWnXKs2DYUwHn6EnOXr1JVJz3WeVpcgB3Ic?=
 =?us-ascii?Q?PNek3/OYe3YPlvsZbo/NSX2kHeNqNEtLTX38trV8ITKEMpcjWDQTj2LqLy4j?=
 =?us-ascii?Q?RjiAlUOidQ57/xNa0EejGgkDf0H+FyMsxLS/IdU6o1BrtVUiEHG9v7QCy//e?=
 =?us-ascii?Q?Q/T4Shxsl04joAzkkNl54sc3NUNpDPe1yU0ERnoj9ynvT6eI3Hp2gEjIaxtd?=
 =?us-ascii?Q?26JVkKTrYqo56HMTAa7sWrv1V71lNMJA7kR50tgPFTGAwXypVJcvCcoCRPot?=
 =?us-ascii?Q?9+R3YlSh9z2PztmaIxaZKElxHdeRzbqwnSanwhqfAjeMHhvRtFE9ahjg1TDe?=
 =?us-ascii?Q?20c/QutNDdia4+pDXXdX53lH8zsxbior+CKUMIcA3wZBGzRmzch/NenATAKX?=
 =?us-ascii?Q?U1aLiEDKU29MSpFrwekDg9oPOZGkQytofbld3l649zijsTHRajlq1QgnBCdJ?=
 =?us-ascii?Q?kWdiN0g6EDfSF8xFiAu5NgvrFNC6cc235cQRcLmtaU4LgZcH7IvHNIl2nogB?=
 =?us-ascii?Q?1lLJzji2B8qrcpau2oEn2oU0k1KdWM9cTExET75chBowt2F0j7eVlQJ7nv5r?=
 =?us-ascii?Q?Mv9ZzmCB7l8WnDFn2JVmOhi2tK3mvrXND7sMHqN8rJbregPmhhFWzpBU8Gix?=
 =?us-ascii?Q?Yyvbne8e3Q6jku9Q5p5+tr4v5ITGtp6yG6SOKQlPV+T9uUHqm0XUFYSHaAUr?=
 =?us-ascii?Q?6y2A+6ABmc/t0wdDUt4PyH78cbfUArKKqY/OytYwq6TgGrTig6fy9/+mn9FM?=
 =?us-ascii?Q?AvywbCJCIYG/+iCzGs9upAt1Dnx+K7Dinx+taTMy4gcR2s+YZZXsqfJoO6P4?=
 =?us-ascii?Q?noQDAy/d3/tMd1P5C//GKmV+VZ9TsriXB+nMM8pYq+YJu5zy9Q/iiCfs82yw?=
 =?us-ascii?Q?Lr/eY9Zs5G5sW9qI6fY7cWj1ku2VdaRMZzI5NQFUTu2Xw6Wt2VFtv4t2ny06?=
 =?us-ascii?Q?L8E4E8zLpKR0ukvEEpGdDG3vxsksfJKhMzzPBfT8vwbXQugztsdPu0cEXGJ6?=
 =?us-ascii?Q?HNzIRGu7BmChGyooInpg8ZnRAgukYTsm6YGcoYEiCHX7aJf/DHfVgqs6KqCD?=
 =?us-ascii?Q?aqoHeWxAP93g5ZqNts5oMM0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b93fe5d2-4675-476c-092f-08de20b86a9e
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:22:36.8953
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r6W9PpwBEMrbya74+WzT3cRNAPbQe2ZNkiZTcSgyHDSXX8cZsFv7cHyDvHikrzIto09c8IoH1N2CfkUehGV46axocjKTjLT1ezg39ImOiBDbJJWQjjWTH14R20Rs+TAm
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
 sound/soc/codecs/hdac_hdmi.c | 35 ++++++++++++++++++++---------------
 1 file changed, 20 insertions(+), 15 deletions(-)

diff --git a/sound/soc/codecs/hdac_hdmi.c b/sound/soc/codecs/hdac_hdmi.c
index e50afd0bfcecc..2652fcf2a3a34 100644
--- a/sound/soc/codecs/hdac_hdmi.c
+++ b/sound/soc/codecs/hdac_hdmi.c
@@ -769,7 +769,8 @@ static int hdac_hdmi_pin_output_widget_event(struct snd_soc_dapm_widget *w,
 					struct snd_kcontrol *kc, int event)
 {
 	struct hdac_hdmi_port *port = w->priv;
-	struct hdac_device *hdev = dev_to_hdac_dev(w->dapm->dev);
+	struct device *dev = snd_soc_dapm_to_dev(w->dapm);
+	struct hdac_device *hdev = dev_to_hdac_dev(dev);
 	struct hdac_hdmi_pcm *pcm;
 
 	dev_dbg(&hdev->dev, "%s: widget: %s event: %x\n",
@@ -814,7 +815,8 @@ static int hdac_hdmi_cvt_output_widget_event(struct snd_soc_dapm_widget *w,
 					struct snd_kcontrol *kc, int event)
 {
 	struct hdac_hdmi_cvt *cvt = w->priv;
-	struct hdac_device *hdev = dev_to_hdac_dev(w->dapm->dev);
+	struct device *dev = snd_soc_dapm_to_dev(w->dapm);
+	struct hdac_device *hdev = dev_to_hdac_dev(dev);
 	struct hdac_hdmi_priv *hdmi = hdev_to_hdmi_priv(hdev);
 	struct hdac_hdmi_pcm *pcm;
 
@@ -869,7 +871,8 @@ static int hdac_hdmi_pin_mux_widget_event(struct snd_soc_dapm_widget *w,
 					struct snd_kcontrol *kc, int event)
 {
 	struct hdac_hdmi_port *port = w->priv;
-	struct hdac_device *hdev = dev_to_hdac_dev(w->dapm->dev);
+	struct device *dev = snd_soc_dapm_to_dev(w->dapm);
+	struct hdac_device *hdev = dev_to_hdac_dev(dev);
 	int mux_idx;
 
 	dev_dbg(&hdev->dev, "%s: widget: %s event: %x\n",
@@ -878,7 +881,7 @@ static int hdac_hdmi_pin_mux_widget_event(struct snd_soc_dapm_widget *w,
 	if (!kc)
 		kc  = w->kcontrols[0];
 
-	mux_idx = dapm_kcontrol_get_value(kc);
+	mux_idx = snd_soc_dapm_kcontrol_get_value(kc);
 
 	/* set the device if pin is mst_capable */
 	if (hdac_hdmi_port_select_set(hdev, port) < 0)
@@ -901,10 +904,11 @@ static int hdac_hdmi_set_pin_port_mux(struct snd_kcontrol *kcontrol,
 	int ret;
 	struct hdac_hdmi_port *p, *p_next;
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
-	struct snd_soc_dapm_widget *w = snd_soc_dapm_kcontrol_widget(kcontrol);
+	struct snd_soc_dapm_widget *w = snd_soc_dapm_kcontrol_to_widget(kcontrol);
 	struct snd_soc_dapm_context *dapm = w->dapm;
+	struct device *dev = snd_soc_dapm_to_dev(dapm);
 	struct hdac_hdmi_port *port = w->priv;
-	struct hdac_device *hdev = dev_to_hdac_dev(dapm->dev);
+	struct hdac_device *hdev = dev_to_hdac_dev(dev);
 	struct hdac_hdmi_priv *hdmi = hdev_to_hdmi_priv(hdev);
 	struct hdac_hdmi_pcm *pcm;
 	const char *cvt_name =  e->texts[ucontrol->value.enumerated.item[0]];
@@ -1070,9 +1074,11 @@ static void hdac_hdmi_add_pinmux_cvt_route(struct hdac_device *hdev,
  */
 static int create_fill_widget_route_map(struct snd_soc_dapm_context *dapm)
 {
+	struct device *dev = snd_soc_dapm_to_dev(dapm);
+	struct snd_soc_card *card = snd_soc_dapm_to_card(dapm);
 	struct snd_soc_dapm_widget *widgets;
 	struct snd_soc_dapm_route *route;
-	struct hdac_device *hdev = dev_to_hdac_dev(dapm->dev);
+	struct hdac_device *hdev = dev_to_hdac_dev(dev);
 	struct hdac_hdmi_priv *hdmi = hdev_to_hdmi_priv(hdev);
 	struct snd_soc_dai_driver *dai_drv = hdmi->dai_drv;
 	char widget_name[NAME_SIZE];
@@ -1083,7 +1089,7 @@ static int create_fill_widget_route_map(struct snd_soc_dapm_context *dapm)
 	if (list_empty(&hdmi->cvt_list) || list_empty(&hdmi->pin_list))
 		return -EINVAL;
 
-	widgets = devm_kzalloc(dapm->dev, (sizeof(*widgets) *
+	widgets = devm_kzalloc(dev, (sizeof(*widgets) *
 				((2 * hdmi->num_ports) + hdmi->num_cvt)),
 				GFP_KERNEL);
 
@@ -1093,7 +1099,7 @@ static int create_fill_widget_route_map(struct snd_soc_dapm_context *dapm)
 	/* DAPM widgets to represent each converter widget */
 	list_for_each_entry(cvt, &hdmi->cvt_list, head) {
 		sprintf(widget_name, "Converter %d", cvt->nid);
-		ret = hdac_hdmi_fill_widget_info(dapm->dev, &widgets[i],
+		ret = hdac_hdmi_fill_widget_info(dev, &widgets[i],
 			snd_soc_dapm_aif_in, cvt,
 			widget_name, dai_drv[i].playback.stream_name, NULL, 0,
 			hdac_hdmi_cvt_output_widget_event,
@@ -1107,7 +1113,7 @@ static int create_fill_widget_route_map(struct snd_soc_dapm_context *dapm)
 		for (j = 0; j < pin->num_ports; j++) {
 			sprintf(widget_name, "hif%d-%d Output",
 				pin->nid, pin->ports[j].id);
-			ret = hdac_hdmi_fill_widget_info(dapm->dev, &widgets[i],
+			ret = hdac_hdmi_fill_widget_info(dev, &widgets[i],
 					snd_soc_dapm_output, &pin->ports[j],
 					widget_name, NULL, NULL, 0,
 					hdac_hdmi_pin_output_widget_event,
@@ -1140,7 +1146,7 @@ static int create_fill_widget_route_map(struct snd_soc_dapm_context *dapm)
 		}
 	}
 
-	route = devm_kzalloc(dapm->dev, (sizeof(*route) * num_routes),
+	route = devm_kzalloc(dev, (sizeof(*route) * num_routes),
 							GFP_KERNEL);
 	if (!route)
 		return -ENOMEM;
@@ -1166,7 +1172,7 @@ static int create_fill_widget_route_map(struct snd_soc_dapm_context *dapm)
 		((2 * hdmi->num_ports) + hdmi->num_cvt));
 
 	snd_soc_dapm_add_routes(dapm, route, num_routes);
-	snd_soc_dapm_new_widgets(dapm->card);
+	snd_soc_dapm_new_widgets(card);
 
 	return 0;
 
@@ -1666,8 +1672,7 @@ static int hdmi_codec_probe(struct snd_soc_component *component)
 {
 	struct hdac_hdmi_priv *hdmi = snd_soc_component_get_drvdata(component);
 	struct hdac_device *hdev = hdmi->hdev;
-	struct snd_soc_dapm_context *dapm =
-		snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct hdac_ext_link *hlink;
 	int ret;
 
@@ -1698,7 +1703,7 @@ static int hdmi_codec_probe(struct snd_soc_component *component)
 
 	hdac_hdmi_present_sense_all_pins(hdev, hdmi, true);
 	/* Imp: Store the card pointer in hda_codec */
-	hdmi->card = dapm->card->snd_card;
+	hdmi->card = component->card->snd_card;
 
 	/*
 	 * Setup a device_link between card device and HDMI codec device.
-- 
2.43.0

