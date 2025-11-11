Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011040.outbound.protection.outlook.com [52.101.125.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E0DC149E17
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820467; cv=fail; b=j86V66dtkDbxFRkQG3Bfs62RmcqjBqMdL3oOR6en6hy2AqGMpQbYzwaWYWzgSz7hWLAYQdBGnx6cxFllyIoChqPSx1oF7eTlBLOODy5B48EPD7UOD4mrrJqpD9ZBtc/QgScZWRvalur/UsqelI+ffoG7j56SW+g84Mm85u0kwkc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820467; c=relaxed/simple;
	bh=iEiKPOMUWVH5boY2gtC3Vdvzty2V7zQw+Tu9lYiLRVc=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=fpv7SKSEyfFj3BPQ0ecXgsB8fL/ClrnaDRnXQJKPorgzqVYFIQ8oSjAWZQKqFwboow+qdC57/9xQPTL6J/eYEt5g51f+LC6D7s55HCacrcybNWHMjSZUe1rrCwjScU/iuhP2gUnRE2olKNcUW2O04dh3S7hjZ4EwmoPZKArw6f8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=V3c8qv2x; arc=fail smtp.client-ip=52.101.125.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="V3c8qv2x"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xM/oIVCfF5djA5PCkwgTa+J8ZWGnpq9pL18ZlhzFp4528aM8asB/b+5LsAAEpGK8WGBm+WU4uYEqKQ6PMok1Em1cCXXYjHdXo3VQcyzntEVSsDXvAs23KJMz6Tl5GsN8K6A0rEx5HUwL5VNeJs6oOQuEIJSJpazwwJ+rprXbJH/qowGFrmeADZaftAmQceNi0t1CukOCyXaG91lm0wQiPi0Y3IkrDeHF1aD6YLADU4CqlYxLEV1TMrN6oLcAr4fEl7ROz4hnIP0319ojs9xkRxaeqfCdPn9mMGKEvvUZa+zQFQwwafp7TnhQFQyrQsz26TsEUOkJi/rRl+huIIbfnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/wcx8iXHhppABnYX31DGre/c/E+sFEgJd+XMQgyC+84=;
 b=p8I4Cf1Vm3fgZbAwRfoLGlD13tVLhmcKuM2Pj2DRvU4pbroDeEmWEjRMHRk5HhIsTwQ50woTPbbFFEzyWe3Yotd3nwuLPEW8tt2u7jPwt91ySAv/gOplBUphA5VseDNVXFMwFYaXPF7D9gvWF2oL5toeoWXlufvW9h3Qa+jpEbPhJ/jBUT+U2bpP82lPrX0Oc2IQ102wbI+XUXzcxejq1VbNdM2fc9FHlevpABkaGiqrKr3cFUF0emIkd+JjLocuJTQRAcOtTyfts+/0oerimP3Jk0HJ1aDikewNl8XhgGp+3MqCfttjsBs9ZI/05R31LKGc2HkkP+Y6RMUZk9NtKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/wcx8iXHhppABnYX31DGre/c/E+sFEgJd+XMQgyC+84=;
 b=V3c8qv2xMTyvwgGqAt4K1YxfH9/POeswZKQaaKA4mqjp+ZPmEH46Eshui28vOhKQItufioJTDzhuyiuJW0ThbBtRot/it/r1ZXfg5kSRG7xi8MmQLUPYu1B8F2l3uMJ738peo+hJzeHdumyMeQ1BvcVAY2505SWxKaLwmuMID4Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB6994.jpnprd01.prod.outlook.com
 (2603:1096:400:bd::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:21:03 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:21:03 +0000
Message-ID: <87ldkd772p.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 043/292] ASoC: codecs: cs47l15: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:21:03 +0000
X-ClientProxiedBy: TYCP286CA0296.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c8::8) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB6994:EE_
X-MS-Office365-Filtering-Correlation-Id: c44adac8-1055-4880-9973-08de20b832c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/0Ww/p6I08S1OlvwlFHlNVYkr5gkAlY3S+MstZ73JTRIg6lWDElAMn6u7+ci?=
 =?us-ascii?Q?R8zkj3w6WiW31nzAIZNubA6deWBrhIjGLyBYBffrlW7HmlV395SWNqlJ5hyz?=
 =?us-ascii?Q?kjUmxQpTiiuovmPvY4I8R7e/nr0WDeOqjgJ6Z8IqbWiFhnL1a4G0r+e8HxRC?=
 =?us-ascii?Q?LGZneQgswWKagEccddjsAOex4Rgg20FzKzzMI13Ipel4dsdbCiuhA71q6HdC?=
 =?us-ascii?Q?AbxSau7/FWE/c3JuGS5MPGky6mAzKE+3oBF5tPrYDEb2M/Cc3kMc0phzPv9c?=
 =?us-ascii?Q?WHxd1QB3a6D1SUpQnddobrB4cu9dRzuLHv6px6e6cjgejethctDLFmovXdK3?=
 =?us-ascii?Q?o49yCn/gcZKWhMqRjcqjuxgpdvebyojF/ojAH1bB4drdGzaK6xeMtZve+m2h?=
 =?us-ascii?Q?pC6RJqTPbPBmEs+u7X6WNKIPbriDGamGyP0NXCMqNBPt179HzJnTf9Fl8WX2?=
 =?us-ascii?Q?Ci6m6TuX6vKjp2kIOBQfHgyEUdnSUcOKwNiOzcii/6BqgovT6FdrEee4hikg?=
 =?us-ascii?Q?lI+h3sBrvN2iL/HSoumXi/pAwjho7U2I734ycEqRIbee3d/ITpgSobfJdHk8?=
 =?us-ascii?Q?y9PJYtrtEn/n/FDEjz7tWHl6bKNOHn4yeQxaQHUZisAuV0ixdXynQjt615qA?=
 =?us-ascii?Q?Q9pIXhwE3RW1UQFbxVI/yGHt+cd+ybJ3xhxtcb8IJdNr3UpS3h/FlEUVJuBm?=
 =?us-ascii?Q?G+OOyLUFW6jiPILiuhYFfpmOrExkX1pBB3zAmg2mrQi/n/Wotbw23UygHEzl?=
 =?us-ascii?Q?GHeSj730RDSzQRrfvQRspPud/yL6yyqyUImCqgADHw5+iHvFK5ROuepBvfXR?=
 =?us-ascii?Q?G4X1gr5jVW9u3W0nz36v/HwvS7o/1ogVoXiY9X1VS/CJixhxSgHJtmzeyiDX?=
 =?us-ascii?Q?CwT56mvPbKVf+py5X2JryBL2YiMMUHBvs3G/uDpaCtsFzk6y/icdQWRC5cCk?=
 =?us-ascii?Q?JUDIL9Mw+m9TAs43wFvM1ZhEexAnN6vBVzsdDkMmfsTLYdsQH6zeIwvzkRRj?=
 =?us-ascii?Q?qrSGZ8kczkh7bYn2MARQQ7weGz9KiSiNWrTJmBvbZ06eMxcXyyVIYQHwXLhL?=
 =?us-ascii?Q?UxWXD+0Dm53Bk+M7D6Ep2N+C8S4HDiR5zbKIgsWeAyuBU23czl/HhXZRis4E?=
 =?us-ascii?Q?XjSUVN2P2rs8QR4+YPd1Hbb0NlcpVMSXEFqZrt1gGgxZCP1fXxY1eskZmWgt?=
 =?us-ascii?Q?KD/+zfq5l10bmQ+2c4oiz3q7UBhehvAV6xgCFcfrztC4ggNiorMeCUcqzVw9?=
 =?us-ascii?Q?WBeJjPrXelHQEkDSs7wZ5S7pKjPCAhX+SRoGiuIXvvpE1PAl6XyAyCQPVGdl?=
 =?us-ascii?Q?BaiEKDfaLM/T/WS799hyNUhzWz+JoFd1J25fcYOXiYg4q5tklFQd33xfN8Wy?=
 =?us-ascii?Q?KKlmoEeCBbrYYXzxtvt2oqwGyuDfiyfZ8WR8UsOTr8kM8yEBmxn5O6UG4Q3q?=
 =?us-ascii?Q?G8ittE2TjJnNaZGULep0JXu9xdkQx+ThuEn6LwWFVbC8UazXb/32KAGgDYk2?=
 =?us-ascii?Q?ABDLpgKTek4+iTsJ2hY6Dcn+mA1G8HkB2Pw5?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fHlEvyzkdkDvOjP3SxwjJGayX8V2u1POmF1z0dTV5rnTfeuGQ5s3mtOMo1xE?=
 =?us-ascii?Q?FYbtKTg/Vh1WThdiT2i2YfUnoPUpyih/DIZZ//4pIslWQAWkVZWhqlbZX8f5?=
 =?us-ascii?Q?Krw6W32n3ZuZIklMKCOoAJ504yPBsVnRHFPlWF0cAskxedLkqPzezsCilMfW?=
 =?us-ascii?Q?Gu+on9j8xSxV9KrMjBwjvjQTBVgLT78F5hx0JzMbn0NSV3cAQu+FcUepFZ84?=
 =?us-ascii?Q?wrttiShIfWraqwA4imiOHqAmYzErCr1Tjffn/JM9A2qiv2Ly43BeGvBmrqCx?=
 =?us-ascii?Q?bDFImODEHyB0u+QoJil8adOGn6n2fKhK4j51q84jXbPl1XIpYOhZaDI99gEy?=
 =?us-ascii?Q?kBgQ+zIxbVQX8UZcFN3sb2pM2PTEaD6+9Ovk1IBm7VG3R9weCf6aBFU0oomj?=
 =?us-ascii?Q?9KjaCp9AMQ3/AWfQ5tZv1Hk6pzZr8M9nM56gmfW28lWoYyr6pM7t5zvyrDMk?=
 =?us-ascii?Q?6gYwfgnXXMKcvf3jSiagRqXWz9EucUL6TYfj7Sy9xM30AtgUnxiya7pwDSrr?=
 =?us-ascii?Q?V8o1UWG1FXmuq4whWezItLXveQHis71dZdbQItSY6Y5akWVdJSKTRDyHQX3V?=
 =?us-ascii?Q?hK4ik5oskxEpaefD8r/fGvEimVZj5BbP/DUmb9iuQFqWWg6lEVmBvEwiK2L3?=
 =?us-ascii?Q?wjps736O3EdIGZHODrson+2UsNv/q9uux0bWY+USnBjKtT4QRHRlt0paMwYN?=
 =?us-ascii?Q?DUM5aTiv/L66+goN/MUMoJVao9VIKQ0kyBqwPEua/sd0ftDEmromHW2/l91X?=
 =?us-ascii?Q?/+USN8IHahSt09l6LN8q6F4ubOVDX6YmzeS3rEHL86JtpkTAMmuU2i6ZP7Nk?=
 =?us-ascii?Q?nTdNtjzt/P/2btXFqy8M1oqCnhWd8caVOAp6ymiWHLe1stXS68QL54LXQbVv?=
 =?us-ascii?Q?imABxIgSvXJt2oCYjcmcDP9nnHTFCI3J+YPJ4MpWoJQV45u4UglFX6kgmj0i?=
 =?us-ascii?Q?FYx7VfFip64A3n+74pbMkixwDuHKErDmcPXw4oJ+UJHmpjj4l5eWmZuc6uaz?=
 =?us-ascii?Q?m5avKJYvL2n03LKN/D4phJ0RS3OAgKgkKB3cQh9HkkMJp4WjVm+2vutXsuqg?=
 =?us-ascii?Q?UYKVP2mVNykkUgt5VzxQUx9UkHj38f/aSdZNKSEIKiPexNJB05it0QR5jWtJ?=
 =?us-ascii?Q?26shSCcchFFLC9k0G3QXyLlk59PB6uX/t67E05BFQZzXQk9NmxWIXsPIi1JS?=
 =?us-ascii?Q?2HuK37ssERT7++mpmCYPcAa4APRArz7p4nqS/gh5SxU7ThM0Q+idB6Yyui6l?=
 =?us-ascii?Q?9Oo4bkLN6wZdUAc0FmRFuMNYL3qPqwB1BusgMBS1mmr756iSRWXfJnoxIeIe?=
 =?us-ascii?Q?sJHsT2P6FxfiD+gn9uPHcF6sJICWK/9Qx7GtiXDX3QlnCpT2oO3GFqV8ZGtW?=
 =?us-ascii?Q?qw99mhPoJzXpRpxDKBGI7aBxfwesUYCLfUODImjso6OzLrh65DO9vBKRVqhT?=
 =?us-ascii?Q?/yR2hA3Qg5IQEG9nCAc54rrBaOt2RwtaRwrW929BwXKO+qY4tk2QYT91pk4i?=
 =?us-ascii?Q?vChqvBwbHj+94n7r3MEyg2/OM6Fqs/Dat+y4u4rKur/KHVE/2qMRK1rtpxt9?=
 =?us-ascii?Q?4Kb/YrLlH9KO4DU8WKmz5qHxmirTxUrZfSxjQvVG9gZ/lJ5rjCuLkxUVmzqy?=
 =?us-ascii?Q?oSmIr0FKOods3TD8b49C528=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c44adac8-1055-4880-9973-08de20b832c9
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:21:03.2435
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3dYAopKuMivHY3ra1IpojcaMvDC/or6CfHXX6ShQGKez99/DEwf1GjbNsfnpTDMwGuCFiPFPIH1/qFZ1cSHfbcSwZr4uEy2154BbPO3FggibpDbRZzGPU5pt8j/VckQf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6994

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
 sound/soc/codecs/cs47l15.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/cs47l15.c b/sound/soc/codecs/cs47l15.c
index cc53ce552c2eb..da64e0a1db28e 100644
--- a/sound/soc/codecs/cs47l15.c
+++ b/sound/soc/codecs/cs47l15.c
@@ -1278,6 +1278,7 @@ static const struct snd_soc_dapm_route cs47l15_mono_routes[] = {
 
 static int cs47l15_component_probe(struct snd_soc_component *component)
 {
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct cs47l15 *cs47l15 = snd_soc_component_get_drvdata(component);
 	struct madera *madera = cs47l15->core.madera;
 	int ret;
@@ -1285,7 +1286,7 @@ static int cs47l15_component_probe(struct snd_soc_component *component)
 	snd_soc_component_init_regmap(component, madera->regmap);
 
 	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = snd_soc_component_get_dapm(component);
+	madera->dapm = snd_soc_component_to_dapm(component);
 	mutex_unlock(&madera->dapm_ptr_lock);
 
 	ret = madera_init_inputs(component);
@@ -1298,7 +1299,7 @@ static int cs47l15_component_probe(struct snd_soc_component *component)
 	if (ret)
 		return ret;
 
-	snd_soc_component_disable_pin(component, "HAPTICS");
+	snd_soc_dapm_disable_pin(dapm, "HAPTICS");
 
 	ret = snd_soc_add_component_controls(component,
 					     madera_adsp_rate_controls,
-- 
2.43.0

