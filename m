Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011059.outbound.protection.outlook.com [52.101.125.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4512137C0F3
	for <linux-sound@vger.kernel.org>; Mon,  6 Jul 2026 02:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783303365; cv=fail; b=ADCPPSo1X4IW3cTdkBddWUFg6ovl/XiRZyNFzN96k7nNNzQvsdRHE5T804IcrLWpan1qVX5opxKfM12fUS6NFENVadHkOVTFVKuS8AakyIMnAfpCiBduUj5amWC0lcJxGCPAzcl8ugVaIMnhUlJ0/Ffp79z8fGmgO4pbw+1GtEs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783303365; c=relaxed/simple;
	bh=8PvTymz6A+v3IS4blb1hKnXS6VZQ90l5L8knVep4L2Q=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=CgGPVuVwbjrdlymI0Rt13TiWRc4Jekcvsld5iCsyoBOK/JcYIlSioD2ySSv/KU4oF5r5JstDWtUjvT+WelBVQEveqddR9Uxg62PMRiTloof+sguT3gl6l0FcA2rc+KuA31VwVjjsYT9vJwXpaI5aVfzoyFnbLWCrJzYIOcvPeRw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=SheWzeTw; arc=fail smtp.client-ip=52.101.125.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="SheWzeTw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hv82P8ro6OtHHfHWxy5ONRu6wC4ModjR6m6jxQpLnsIBiMyAj7Tf4Ow+31lAxg0SWqCs1k+EjLCdKjvFCV0Ln3EPErDDdCMoL66yTsEJJKB+XahR1nmf9x128oghomj5OeylQ21f5tL96rEo7XqJTJ5LkfaoHfkH0vUMSq+Rh9KhQYDBnfn8yQcDm0z11NaH27+HzL4ZDCAOGEjTOjEN2vyTKpRUlPUhauOmBn7vFwV8GwtHzyl9QiV93UINGJ/zzSFYz4knRTtYjTZWVUlOgNKsQW2JFZQ5cT9Z3YnSYPwBB0mRTOqrWVgkS+b2zMV/yuIY5km/TPLf9BY1hLeP3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=det4HkNHn0yKgCYD4CH6ZsZNx+gqSvbicm64vTI1acQ=;
 b=F/pOgxBPOQu0FluBD3JpwaCQ02TqOWXnqP8tmoI2Olis+9W/vuSW3DvGPNIgKDwXqMQ3OkdM+v/9v4JLtfyhcPadqjwrOGnr+Pa7U1/Xr5q0wxIh6OKb71075UQS9cvHxMiDVDhTfxisQmXNDqGc7we7KCjBbFBFIsTMnqEAuNUqxxxbat28Nbi/I8tVaUge65dlUZq8BrMEKrl2oMB8SPyYC7BGxmCsI0NncjBF3Sc3Op+T2b0hpMhy/ya0enWAPrKzMHNtgc/vEomeB1ZqLo4tlUqG0ZKgMwA+ZQhYYDwdDQXYvP+zneSVjaLPaGZjQPpXwFCXN98qcI3T32ZMRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=det4HkNHn0yKgCYD4CH6ZsZNx+gqSvbicm64vTI1acQ=;
 b=SheWzeTwSTTeL9wE3yoUSoVb6uK/TgpwBz0FvufmAtD66X31/mX0g0dkH0OirfFgcp3DmO8AbsN/KRFHZvI6RCI7J7DmhzaILtgVrUBuvblFv5krw/2RYROTlN91+AKJsJ+srFXrrbn39fO48TOw96woNaVgKig6I+qCYzEC8oM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TY4PR01MB14075.jpnprd01.prod.outlook.com (2603:1096:405:20d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Mon, 6 Jul
 2026 02:02:42 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0181.010; Mon, 6 Jul 2026
 02:02:42 +0000
Message-ID: <87pl10c1tq.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 07/12] ASoC: intel: avs: probes: use snd_soc_register_component()
To: Bard Liao <yung-chuan.liao@linux.intel.com>,
	bui duc phuc <phucduc.bui@gmail.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Fabio Estevam <festevam@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Takashi Iwai <tiwai@suse.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87zf04c1w5.wl-kuninori.morimoto.gx@renesas.com>
References: <87zf04c1w5.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 6 Jul 2026 02:02:41 +0000
X-ClientProxiedBy: TYCP286CA0214.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::10) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TY4PR01MB14075:EE_
X-MS-Office365-Filtering-Correlation-Id: 71ba1ecb-743a-45d7-b48f-08dedb02a9cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|52116014|23010399003|1800799024|38350700014|921020|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	REgtOFHLSJY5r8ELQG2OtlZsKwHOSbdA/saiZZDPrLudRykcyAYTPKaYv3QWYsGMIOv2z/0a8KDh8gGmdVcYM0dQ8mOCyM01RwYQUA7jZxO2NqlhIieqbcT0LHDdEZRnAvRwJAP+n3S7mPnMhWDSEs07epN6SR8A/murzUs5qkKHEIzsu1FHeAnn1WA02BiqgbeB2Y8fiAnuiFstGjugQU8tuQ1v4/hLSax9S1UgAttzM+Xr1kAKDc1Ek5hkJIyzVc3l9lOj7hUUufMp6ybT5f9vjee3dEusBSy5LWb0Wr1wfIwoHSOQvXdv8ebWERrOTtiVMt2B4MEjauYSVaz/XY4B27eqvm/BeabXi49+RWwZZIdOIsV1g8TdD1V+CE0hDgJIEYJU1AtXIXJKCetaaX1RgOZ8Ui8tCgJXUc+9v+MeZ28q2x4cEEcdwP4XQyqOmBT4tS8m1aLTN4gjVZFwSDUSPZ1s2m/y6u1EpbnghkoM6rlMA/jaXJpjg3XhPoWqy+olcCkRg5DvTeKk7V0o6Jk5kdNzdWlkrYVTCsRe3/tUOe3IZvch7vZIvoz7uQCuVUWUKZdgbH1msedgzR453/Szg2OGlyp0X3zE5FJBallazV2vc27mVqUNh9I7V3vKSS07QBbOPDeZmiUXg4Kq3jvVqrKm71ggdLR+UsN9C8q/GoDjgoiAjbooRJ8mX3MeHzwFqnZLxlEjfrOxmKhW7t1gshygax70m0mRc8uGCXs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(23010399003)(1800799024)(38350700014)(921020)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Y6+uf8u+e/lZ3pNVXQmihFQHaQfGiTG6IyCf3Gp801s7m0zoyf4lczGHFPaz?=
 =?us-ascii?Q?XcP3WpSTsGIKajqKk0ApQkDeXyImz9SS4Pk7VNVFAvf/BJJ3bNrVUEmYveUA?=
 =?us-ascii?Q?zrttKttGMyNOup1+7Gwpp1GXEjN9seikV5qlf2AeW82BbymN6zWsylukom1Q?=
 =?us-ascii?Q?Jr7ho6kfqFH/jrjQPaDUzRIgi7bLm9UHKNlosUTCNm/gTbzG/oF7sBoOPk7c?=
 =?us-ascii?Q?hQEjYsb2CVaA8zNEj5Ddy1g0tzSxh0ZzMVh5FcbHPHy/sCPLRXbYHKXKwdlo?=
 =?us-ascii?Q?HPI+PFUx291FnVj1Ja4pHzfdTUBmU2ujrrxLmEug5E43WHOP9qwwyovzqfy6?=
 =?us-ascii?Q?0bbJihUPlzJ0hZU20YE8jKbvc02vMW+ohjRGFzl1lAtwlfQiMkxAH2WsBdio?=
 =?us-ascii?Q?yYkg7+eko0ccJSVDGutpPobj51VaMvnSKBgkhUbSP4atGP0gBfilkx2FCvTY?=
 =?us-ascii?Q?5WJ/j1FnznvCcu66j3YJgEescVxvzdDqpO6DYMDSY8oJrgS3EMjDtMERjMPv?=
 =?us-ascii?Q?yS+8JMfKULxmNNGVKBg2IwGLbAvn7i8e47cLpeu/EIK+RpQGPvtM1ETDT3/N?=
 =?us-ascii?Q?oUoMnuV8mhhT4xeF0R8xr3nUD6Hs7Inm+SBLGYcOyzh1L9UyVuXuqc+XQqt5?=
 =?us-ascii?Q?GfInnuQKuqK+w2s+EjQ3EZD9ouxhT9G9l1JSVVKldiRd9Gl7ntyJr2lMq239?=
 =?us-ascii?Q?Y32iQtx5RCulqJWhr4AJt788RK1dSN17vF48UJKWy9lfsFaP5vnYmamqEke7?=
 =?us-ascii?Q?dDVQsEKi6Jc3MdhbZ2CFx7kwSJ6zk86DO48ONlXDv5lh/ipy6ZPkNJdR2Ud5?=
 =?us-ascii?Q?fnCBjYRGQ0MnWEEzF0KUvOLceda0i59/FItinf59qwAyaSFavGZK9Wi5OqHr?=
 =?us-ascii?Q?mjUF4j10ziaWJnfri6pB4VFAZpwEoANB5O2Me5f1V3XCJ0z76v3nLpuLx0Mn?=
 =?us-ascii?Q?+xk1UmsXSE7QB3p1KVBZk4TfXfykWHVipjHUthavYzKmwlNoAZqGEr5lu44L?=
 =?us-ascii?Q?E6IN7A15LhHLQ6qjUics4hTVRYE/T2FvlG8idyFKc1dR2u9b6DJviq6sPEoj?=
 =?us-ascii?Q?2Et1JyuSbRha34N7z1VIGqzLDGmgXiw8vp+XSJi3MCPM6fRiSZGPV18F5PRA?=
 =?us-ascii?Q?eWQ4poil2Hu5LzzM8/L5y6IzPnw0TAcltfPz28aKZuhW1mbEQpXFdE37vrXA?=
 =?us-ascii?Q?B0tgnqslz4AGpaNUJWvxCOeny6XaFL8Ze+Wb8Cj7EMe8rJ92apSmI7RbaBuH?=
 =?us-ascii?Q?x5+9t3pYzT5cGoYrneLMUJ9ki+t7yV7QW5Bl6VcFdlDbEwN6hrpnbxRsfTn9?=
 =?us-ascii?Q?8PO/abmaKZKNFOwpBcRbfZAqC0Ji4rw+q2yLiV5gAEBQTN7eTDOhwEfyRRhR?=
 =?us-ascii?Q?diucoVZ7o/rvBENRuyDJp4VYXd/j/CULswqGZEm+VzEEYTVJzNB7dtpjuK9G?=
 =?us-ascii?Q?XyumuEcgoOCyOGHbNPxvvAvys6JA44jAbJXRA7TFvEKtUHIj59UQHGL1d0uH?=
 =?us-ascii?Q?VPxOj8uyOq3PCE4NBfbYIOLD8Xv1AnXMwhlzVoGlh1Ks85VBZWI8THM7Ib9w?=
 =?us-ascii?Q?5uResMe1kNNmruawHxi7Lo9Udb7269yTXly/t3bpJqaWVRPpJwwvMMrHNvs7?=
 =?us-ascii?Q?gOnWKLjDrd8KXKTQ7zzo/55fuzZ1oc6DrPZNqXnoBX6eVQGMk8wdt47u+Zui?=
 =?us-ascii?Q?CDTMvwMQChFbhOAHZBsMkuehJcG3m9J78Kmr7MPHTPgmfMmWio6QJrD9nbJd?=
 =?us-ascii?Q?6wzWOco0G4yUdElTVytKYA/jgjt/SdzZraRKFDCn9hjCNJ93RUi5?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71ba1ecb-743a-45d7-b48f-08dedb02a9cc
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 02:02:41.9774
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ytsn1oi1gHkulL7QyKNRGeLhV8uXCGbpu/Oo1DiQjRSd/6hDGX8JZLMEp5CYngNUsOH2LVN+gqZ2cL0/hEZ11pMLYKXKBqT+j9EPJOLpAtN4mREkTEYvlDXSTnbbVL94
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB14075

It is calling snd_soc_component_initialize() / snd_soc_add_component().
We can now use snd_soc_register_component() instead.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/intel/avs/probes.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/soc/intel/avs/probes.c b/sound/soc/intel/avs/probes.c
index 099119ad28b3c..e957ef46198a6 100644
--- a/sound/soc/intel/avs/probes.c
+++ b/sound/soc/intel/avs/probes.c
@@ -296,19 +296,19 @@ static const struct snd_soc_component_driver avs_probe_component_driver = {
 int avs_register_probe_component(struct avs_dev *adev, const char *name)
 {
 	struct snd_soc_component *component;
-	int ret;
+	const char *comp_name;
 
-	component = devm_kzalloc(adev->dev, sizeof(*component), GFP_KERNEL);
+	component = snd_soc_component_alloc(adev->dev);
 	if (!component)
 		return -ENOMEM;
 
-	component->name = devm_kstrdup(adev->dev, name, GFP_KERNEL);
-	if (!component->name)
+	comp_name = devm_kstrdup(adev->dev, name, GFP_KERNEL);
+	if (!comp_name)
 		return -ENOMEM;
 
-	ret = snd_soc_component_initialize(component, &avs_probe_component_driver, adev->dev);
-	if (ret)
-		return ret;
+	snd_soc_component_set_name(component, comp_name);
 
-	return snd_soc_add_component(component, probe_cpu_dais, ARRAY_SIZE(probe_cpu_dais));
+	return snd_soc_register_component(component,
+					  &avs_probe_component_driver,
+					  probe_cpu_dais, ARRAY_SIZE(probe_cpu_dais));
 }
-- 
2.53.0

