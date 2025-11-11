Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010012.outbound.protection.outlook.com [52.101.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C09011A0BE0
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820689; cv=fail; b=F9obduTtcsFGJDQmjCBFsZKH1dIYc4NE2Gfiq2ffMIUL/w+mxnDFjXb7KFuGlbXtoPJWuCt2h2SDdL0X9mlZGn3Cg0vxMTJSj1E1eZ1U6IZ9Glu0Z6S7evfaGdMigIpJpioyYPYc8c/gS3vraoSQ5VN/slPURRzTuxhP0mY3T+s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820689; c=relaxed/simple;
	bh=Z86tcYP94UijxXhHku/v0J6tz3sNuvwavn7JBiO8RP0=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=qUbf7kleILl1hEVBASp+61223JMETHxb2slVlqRezH8oDw4D4BZr70jeYzk95YsbQJQsZltyDJhruO0ENIj9JlyKS6y/40+rLcGDC8JmHOHDM/jkmQ2v2rDAhTgbIp4nIcAwy3jaG3K9DyUMiGPwASMVig+2a+01JdQL00avEIM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=X35P800g; arc=fail smtp.client-ip=52.101.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="X35P800g"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IsGSPoY41VYEkGF+zJoFRH1PaF4a4oBLKpvhmr2Z9ABpip9KW0ZaClHbdnTspohInmYiT38wYHtK9V5BvU9sbQgk5PlRYPhwH1Xp/oWl+Xr6TEOpcPt4vRZ4G7wM9SOEaWSKV9g5ukmGRykk6Q6utxQysLdD1VrtHFDdnM6CdWxMYqBEAvTr3UeWT9BGGNTvbVFcoSh1vjyha2wDD2QgL2bu5gvw6P3EeRxtvr2pc7APd8SNY9Tmtjba+mSsqwyLOj872hi9WmtxCfIM6prHWv3kRFoIJMVc/v4WdVCTutlaNQlmCC4pS4A+lP62ZvAD4laMP/ESnQcov5MFuZ7N7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lc8fRSe3jGc+gAp4xny0Qk5DzO60ebERYFt7hIfMXkk=;
 b=fXweXTLf7yXi+Jk7P41Ntcq1IXpLs2csTkqeWcbc+gMNShroU1AJnOtEurvkzJJWf2zftHb++VLhFU8SGdYgc7EPH2lHPYo8ZRpw2jxBhrwi74fJAx3IwhxUtT6i/RrNsXYDsclEwT2yhGt8N41wNNAfaIbzqyyGkToTUOtfgmnfh8vCTmz5GXeHCVsySAUWRMTRPaEFn8ccJfY+B/MB5+8c6QO9hf5RDpXGW+SJ2YuiUyCVtaIFr7BUtDZ5c/un1UvPKEb5yUbYDHIcaghj+jE1suAanbv2j5H+6ajtjfzvXg/K0wO3WbGprO344Ve5l8h+EV0AtIhpkVrFFhTXog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lc8fRSe3jGc+gAp4xny0Qk5DzO60ebERYFt7hIfMXkk=;
 b=X35P800g3vYVFl+V17lRcsMo2NHuiH+pXSf+ao9dN1i4EeoCEK08mt9EAFo19DZi/OtOspPVuinW3vh19CV1+cHe7LO+S3SLAOPjZaVZcu6YyJYWPyslrZZwAKi0lLyMzAgx6Nza9OagnRttea5IbEKvdAxDixHxT2EFNpXoAjk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYYPR01MB16440.jpnprd01.prod.outlook.com
 (2603:1096:405:147::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.11; Tue, 11 Nov
 2025 00:24:47 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:24:47 +0000
Message-ID: <875xbh4drl.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 104/292] ASoC: codecs: rt5514: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:24:46 +0000
X-ClientProxiedBy: TY4P301CA0097.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:37a::8) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYYPR01MB16440:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b9a4978-e2ee-4953-6ec0-08de20b8b812
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bFsy7DNRMUtoE0oc7C+zq12NBLRojVz3uQ40vK9oP9fWGfv9OfYujrq70lFE?=
 =?us-ascii?Q?asqTvmHhnF5308etQk+G9iCBYvw/fTZSu+R+ipVwsch+ic0XIstNrlN6pA4/?=
 =?us-ascii?Q?G/CTRK76YqmR+YPO1qqi5NfzeZBY8/19silMW132014YVa9vnCheryZ5Pq+Z?=
 =?us-ascii?Q?2TLrKqv7zfClw0HM+YFKhVT9u3kSYbQM39eD8+LEARvGc13KvE2C6SKvYZHm?=
 =?us-ascii?Q?+1Cie1bAG5pK+kgveX7kAl0F1rF6tFjXW6nP1x5L/r+cqVnh0YLjfVP6drPs?=
 =?us-ascii?Q?zHPgTEANtQ9r3117F3w1nVuEDgxjj7rLcII2WRUpRlWkK7n5A1kAfDtUHYyd?=
 =?us-ascii?Q?E0E18ln0TGWNcRpYB08GEg9otB1yK7JLh63GdvU1Tjsg4Zxdd42TD4KTM2qt?=
 =?us-ascii?Q?XirKddfsSJZ2bX73kG9DVgszBB8hUA4J8I8l8bXQPAJe1d9zkPIeGWCMxOhH?=
 =?us-ascii?Q?GdDIim8acvYIwk3GiJI1kq4SnZSrwzPE4UCRHtUbojZi5W4R+7EVU8RT5MQq?=
 =?us-ascii?Q?Bwf4tYQd7iXiVGwNVRFZGRSfT2SLoGgJPytZcBH8L75eZ9ifSgCpOGZIR4aD?=
 =?us-ascii?Q?s9Y87vrN0GhWUSaMeePZ13LfJaKR8N4G6RSgtJqx0nZSmqjjkCFHAXb6S6Ji?=
 =?us-ascii?Q?dBRxePSxPerCMhSbmT0MEGo+RQFbFq52gaVrC9ZDc7sicS9KSQWDeaBPnP+t?=
 =?us-ascii?Q?/PCRgmVyV3KFKAY22Z44c62q7Ipj9C3s2dWA4/O6p/6hRbYjh411P4sk87Zi?=
 =?us-ascii?Q?vAzBaNf1iinBxO7h7t2S5jtd695j+00ohTpfn5vGiOEy+QCQ4bQJLMdWxwhr?=
 =?us-ascii?Q?908DPsTcXtvR1f0dmDXS4dCNjpTlENVf9aAbWH4JYXcoH9456/HyPMIM/7e8?=
 =?us-ascii?Q?oqcvNHeTtA32DtErWpnl+MFWil+R6++B/GCAxUDJporlWhUL81EkcnTBTvVb?=
 =?us-ascii?Q?LW+B4snJiQi/HC/E/WXAPL/nc1F/0y+OT4aKo7Jkx3PVilCKdDC+r7CITnMy?=
 =?us-ascii?Q?umlrMJeo69aQH5xI2mBAk6yQuKEAnFDHVDiyG/QXhW9aUukzJ2K5TZcUktxv?=
 =?us-ascii?Q?MKi+rX5VTsArFqroNg8lKbJpMDAInWl6b6mlX9LDrMba8ByKlmr8K5iVd0IA?=
 =?us-ascii?Q?q0wmIxhvpHHNTdso7osO/+hVg/43vQcOVU7OOY2QJNqFpJSWx0ve0qSfMIh/?=
 =?us-ascii?Q?3aqGUErNTtyONLEhM7Hu2Nc0Nh1sI8KXhn0vm6awwLwVWWa35DMSyfR4t8x4?=
 =?us-ascii?Q?eaZrl/3Oo/VPMOyw0kZI1NHR/ysMJ2ND1NUubLVgSX12RSvbunFfi1YppLTY?=
 =?us-ascii?Q?25feokBkoEU4cfK9ko+Vwog2Lfq7l6hQAy8kO9ZInK0ON7Djgyha8QyQ31AX?=
 =?us-ascii?Q?K0avOataehPkp63cCd09HdgsPJZWbXVOzQqXeZnmOwvGhBjnCA0KksJzXPwo?=
 =?us-ascii?Q?LfPmE0ZBlACi7nNR7zjy4rDB4xlN0Lu8SC2ZAjmVc6ov2eo4MK28c6Myx7KY?=
 =?us-ascii?Q?fi4AoVH3nQW4RwMhGZ/oOvpbKjBaBEBP4TQ9?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PnQ8geBSffDLNql4VTosYiUueV/1GuM5xuR2O0Y1I09g/msGszL0qW5/ktwv?=
 =?us-ascii?Q?8QeeCIcvxcZ6MF1jnYhbOHkKlgX0nSrMApcj3qe8XlsgtPRSIGJbX8j5KJbA?=
 =?us-ascii?Q?xwqXWtqbqEm14+lgJ6Q2WJ7jakOIwxdaJ4IP16OLlDo5gdFM1gIszUNTT0a1?=
 =?us-ascii?Q?S0PsRazHhmadvTx1Zuy2ZIxoPWfY5egpMBVJ0qOTifhEq87fDtIWnk9tj9HM?=
 =?us-ascii?Q?dVTknGgrwB2cTrt+2+4daXiywrpGtDCJRCQWcSveZjtwJgedxrms1zC2lDks?=
 =?us-ascii?Q?bICL+K/pkeI9PMBQpOCafKSTJntCgLv3O0AHiQNTI2AuCiX6PZburVgQ70pi?=
 =?us-ascii?Q?WzIy66A45L1DlByJbBJgo4PITqsfS+cYxzJ0hibRQtsRlJw8Oi16Y23Hskz/?=
 =?us-ascii?Q?Ofy6+Yxj5JLVpdP9H0LhQw0hEXiq71EJ4N7Jp7vrEIUyATzZOykta2TvBv1h?=
 =?us-ascii?Q?vqoqiI4j4Cowz/xEjcM4tzD2+IfIUxcUCGd6AtTYi1jV/x+gfzNKsCSr0/Oc?=
 =?us-ascii?Q?A+nwCjSEwyuukKDCBcSZdxwuEKPUxQzT4yRtQuc9Z5TI0gxurFnoiN52kf/J?=
 =?us-ascii?Q?2HyFhfo/pFIR3R88JTx6HjrICm4xK+ItBNjLrabrjjY2tEeZ3J//n1ixbKR4?=
 =?us-ascii?Q?KXWOQ8r+gqA+uAzeN12KQZirbou+hUkguwpuVgUaR/xeDvWV43y9P43w1/xC?=
 =?us-ascii?Q?DOHsX4Pcjgz/FoIGJoZIm+wwhH0nAzJjRNOMNHJWGc5jN3bQQR46JtolkZ1D?=
 =?us-ascii?Q?rKSS0jq3l+YH80Knt9RG89aZ5SgsRqZvY8+YSD6nLVhpynOyCji+fPPekZFw?=
 =?us-ascii?Q?8lNjLXy7U7KAQ21EBd3jr5prJHejDNv911h4Axa7vW8mK60DKH9ZI/pCzt/l?=
 =?us-ascii?Q?gfvYx0uoolG1O1Tw2KJf7zIQWmpnF6kdUB4xM3Dsj1dFm/nRJNZ5djCLUHAU?=
 =?us-ascii?Q?dheIAldAuyslosDddsHZuIMzJL1isisSJxf5kdT/KVIqsZ/GvEU5ZTPrMixP?=
 =?us-ascii?Q?qQ1DjsKMmm9Izra4F+e19OXYTL+Viyx/cbY9rE4sUUU3X4SY8v61EajUI4cN?=
 =?us-ascii?Q?E0uyjOQNUqI603MWHf75EW71cs5/WqyhLExkxxZ8agyj6zRfkFAcgLyFskzx?=
 =?us-ascii?Q?6H43drg5Ddsf1lPvsSR6S4w+nKBVsJUoh3Vp8PthH2KPmeCpYwLVP09sUHVE?=
 =?us-ascii?Q?33ZgohKcFGDK8ODTi895tOohrcn+9a9GFW7Lmksff+F42gUTxd470htz9VYY?=
 =?us-ascii?Q?HTNbKgpoQMU6UN81swi/C9mFlZ/BE6nFlkG09czVH/vRz0lVd7YZVwJ0n1AU?=
 =?us-ascii?Q?o19HQETGW804q5qAK0ylI8nE0p1Cpky+kbsGm9FqVyYnKS5wdUJY5C+jXsll?=
 =?us-ascii?Q?4ATlJevUr7O8WMGmmW/LkrtzDfwa8ws3hLkO5d6ZPH0xQUNXjcvF6iQpnr86?=
 =?us-ascii?Q?HH6EWEk/+U8Yk7Qqp7OdWsEPCcDc19J12kTgKUq6EnDc47ZHmJcNJaeLdq/z?=
 =?us-ascii?Q?harLvWgovYLIM4lpXv1sRRQDJ7AONFJP9/GqOAWKtF4nYYrdLLQmivdMOD30?=
 =?us-ascii?Q?dXuYZ2lUYAFLTn3WmuuydUEWNzRupAp83msxJrN64FQv1V97Jd2j32icSZRX?=
 =?us-ascii?Q?Gf+DpHrGUCe++dpQ5nTqtk4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b9a4978-e2ee-4953-6ec0-08de20b8b812
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:24:46.9143
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JvrNBdn34RCQTSxL/HkMv6cPyVtrdzwnI4S4zXVAYSEsyuhcEmrhNcqK1Lb0cb5ln43HhBnL++ikxaTs/6u0lURrPFWyuIQ2OZBQSvognUKgwkyjJ0lLJc8I88MzhGoM
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
 sound/soc/codecs/rt5514.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/rt5514.c b/sound/soc/codecs/rt5514.c
index ab9d81c32be8e..649b44b790b03 100644
--- a/sound/soc/codecs/rt5514.c
+++ b/sound/soc/codecs/rt5514.c
@@ -325,6 +325,7 @@ static int rt5514_dsp_voice_wake_up_put(struct snd_kcontrol *kcontrol,
 		struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct rt5514_priv *rt5514 = snd_soc_component_get_drvdata(component);
 	const struct firmware *fw = NULL;
 	u8 buf[8];
@@ -332,7 +333,7 @@ static int rt5514_dsp_voice_wake_up_put(struct snd_kcontrol *kcontrol,
 	if (ucontrol->value.integer.value[0] == rt5514->dsp_enabled)
 		return 0;
 
-	if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_OFF) {
+	if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_OFF) {
 		rt5514->dsp_enabled = ucontrol->value.integer.value[0];
 
 		if (rt5514->dsp_enabled) {
@@ -1050,11 +1051,12 @@ static int rt5514_set_bias_level(struct snd_soc_component *component,
 			enum snd_soc_bias_level level)
 {
 	struct rt5514_priv *rt5514 = snd_soc_component_get_drvdata(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	int ret;
 
 	switch (level) {
 	case SND_SOC_BIAS_PREPARE:
-		if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_ON) {
+		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_ON) {
 			clk_disable_unprepare(rt5514->mclk);
 		} else {
 			ret = clk_prepare_enable(rt5514->mclk);
@@ -1064,7 +1066,7 @@ static int rt5514_set_bias_level(struct snd_soc_component *component,
 		break;
 
 	case SND_SOC_BIAS_STANDBY:
-		if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_OFF) {
+		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_OFF) {
 			/*
 			 * If the DSP is enabled in start of recording, the DSP
 			 * should be disabled, and sync back to normal recording
-- 
2.43.0

