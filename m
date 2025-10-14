Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010051.outbound.protection.outlook.com [52.101.228.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F88B3074B0
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760415584; cv=fail; b=BmOP70cXKXrWXmjZ0/01k0fjVE+57EY9bJKft9LvSS6ArH1CSlwCF0seYqWJC8QDhIZ0CTU0AZfZBbvTJCH+DOfXyuV+/0nHuM1BIgOJdAMlZYiXWcM5ik4tmsub0mXd8iGYJbxTJEaNOWrS683I4qeEURFyWghJZSo+SC0QGUQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760415584; c=relaxed/simple;
	bh=syGDfNOMrutedGgXvVi/uyetBJPSYFyygBUVkzkXBzs=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=UC6tX5zc52Ru0UpPDuseKABmNMaifWf2tVl8xfH633jQ0wGE6rssfQ87MOySas+PWKMWPLnnN3CnY0omtOnI8/r+ZkNFjILyP3XSO5T0QxfLz93ARBgsoGnhwXot26rkoiintOLCo1ZMCTUcfih4CANZ3rKD4HfqnDkfvNsLtaM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=CX68SBtw; arc=fail smtp.client-ip=52.101.228.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="CX68SBtw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jv5oLbGpKwTrsXbNrBdmNyrUYvsqzgG/FnumYuxh96HVC5OrP1E8EeMkN46TCYWQ5VldxSgoead3rU24uNTxf8wd8rcdBG83hc9kkuV/LkPvVrKKJR6cMrSzwReN9ZnIX6cl2UtVFIhdrWb+cZHJbW/XTfNF405h0nEXRuTdKLYp1PMPDcTHK6XiIbTlGOGJVLsLLEF0QSdddtMlmctotdh0VievPzn62hNG2VUFH62T80zXmhmJncn00a5Mmpf6j8wgRRrDdDMGsUS1jsBtazqxCN1gI3+Ii6FjkXWkH8wkRkQy637qfYmSWVQ/RaplofOfnrBXHANSbLhBR/hYjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wp3YHsNKFRoXOqzqN20AirTxN3J+86gTwb1s3zRzMPc=;
 b=fPDCxLFoOx5FlM3T4sfaet7KTo0YbvU18ZdFzkrexgpp/OdxxUquP/xAuzrujZctN5uXM9WlVO/6/GNjfAwAHQCDHFFlIUaBlaBJi/7QrrOtlHLFepUeyd4MRVTGTiegoGZM7YQEuLNDtXOYaAvip6tCIW4FePX3oDpWpRVAlU21idaHVZXoDmWh6VxQ7/UVr43Gj6Xu6IAUnH7yXfUgNHHpEhcyglLEF8QQ/4Z19K4CrYmrVWDUZ3Kww6jP2/KYLBIi7pXbunOOY+X/eEN86/s5CxLZ7NB/u9u7CAPQVCN3cdciML04Vtf59oC8ZAjR/yYx38AmXz1c2g8jtcmM0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wp3YHsNKFRoXOqzqN20AirTxN3J+86gTwb1s3zRzMPc=;
 b=CX68SBtwRWYudSvQkFr6rGEFztdbZ51J6LWoTtb4TMfsYfsAPSqma8S0gitbIFjkG1Fpk2gTN+X9Vq6Ol3htaFGR55D2BPj+0UnGZhNRu6k7JTs0vaVUtvPOrgEVDiSAX0my5KUaVCO6LfPcPl8CFQPR3EPLOt3K+BUC7QbUrrw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB13923.jpnprd01.prod.outlook.com
 (2603:1096:405:1fb::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:19:40 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:19:40 +0000
Message-ID: <87plaqt8rn.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 004/139] ASoC: codecs: ab8500: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:19:40 +0000
X-ClientProxiedBy: TYCP286CA0002.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::6) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB13923:EE_
X-MS-Office365-Filtering-Correlation-Id: 04b00b55-5e58-4740-6c96-08de0ad8e504
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9cHW858WSmUzBPDkFMny6MOWXcBOgIYheMizD+ClgVBt4Ir74zMSGWX+pzV9?=
 =?us-ascii?Q?MbkLpBCyFX/5i+xU/mGOC/3KdMauBUF21PP5dUPS+sHQnfyWUVY4+vnR64eg?=
 =?us-ascii?Q?8wzyGv1RUtCxVRFvO9VKaAGBCRwg2ewyPdjRUQmu1vQunmrw9aSsodhfvlZ5?=
 =?us-ascii?Q?oNXUeq93sh9b9BCcfUv9sYn30oJ5ouM1UekhEZW3Vf86J7kfNVoOF6td4K7J?=
 =?us-ascii?Q?VGiMrPIwy3M6kACpnLSN9zvRGN2aoHsF+mPM7PxVcSRVlCS58TyS0AC5nLG+?=
 =?us-ascii?Q?2I/O9gp5UOuqidQZL0PdWaeQnURhPiGT6kqCacKooadxVJFKDOXOj52wIpnT?=
 =?us-ascii?Q?2iI83HZVgMv/haQc2PoYcfB+1zcjGeShbWaaTeE2t77NX+9505r6j7o9wNhQ?=
 =?us-ascii?Q?Rtn93UCKHz3XoUMs79ur6VZa8WYW+fxP6mpDmfGCcAi8wi4mQPMHHZicPOc0?=
 =?us-ascii?Q?fZNL7gJ7nwI0n1rv6Rj2PYTKQxolo7XJjHFUbpwTvG/H6/tgddwpOEmDBBub?=
 =?us-ascii?Q?DQ0GR54LjRWNisj/CTszT16QqHuqgIbdas36LKYXwl1qpZrSVbUULqJ9jY4Q?=
 =?us-ascii?Q?Kj+Xhw0NpbQ1jX6dbG1pl0Y5K5ZXQ+1k8LGlQpBzXFCB991nqNR+Ygobz2nw?=
 =?us-ascii?Q?3p7bs82Hydeak4TZvPMxZw5bpWxspa2BMMqIwYwaHHqmAjo2/Qs2mk0ZY8bN?=
 =?us-ascii?Q?A9fnrss4i4wwXvW3nqa1yP8K9qgvT8VBZUGLfr+J/V3IOoPvrqW77fXWHN2L?=
 =?us-ascii?Q?Mg7gQSFEvbrWt7RUBRFMQ/szaG+/cyv39cM+NMn0KAoDmMFidhA2rlw4V1Wy?=
 =?us-ascii?Q?UHNmGSVafF4XYWiVN2Vz7nBzaWg094aX8iI+tDqN3u4r4w2ZcG5XW7BDoMlw?=
 =?us-ascii?Q?f46p2p2IJD7c8KhtQAW6Z4VGqeOfsl883MjmEzefvZSz/LOatJqKiMbST8K/?=
 =?us-ascii?Q?uirAoI1QuS4kX2TyRo4L4yf4Da9WFIcBvLjOI0QLd+ypLCnaWw8N7iq/NLcM?=
 =?us-ascii?Q?KIL4Ktf6csRMarDXus1b2vc+7M4B8ku72Vpt7OkYBTvphgrAqZKiAYRI3oVr?=
 =?us-ascii?Q?qcWINo7KWQ6uirD5R1/VvMLrkOLN872TUU+XR2Unpu5qRFsPmKfWHjbGB+vs?=
 =?us-ascii?Q?U2iL1DFJQsFVwTJi5K21oGQ2ICqhVTrNldA6EE/JRHBk6vUm0sgoKAvTzcqw?=
 =?us-ascii?Q?q7f/KtR3iNI6dHFNc1cDLterzboqFLDXiO2cKr/d1vgRp4YZ7an5MRjj+Jmp?=
 =?us-ascii?Q?0QI71RDrXLg2jpjL3go/F2uDkmuIk4GfsapYjSiUzsIL/BYTQuMfW8TPNM+w?=
 =?us-ascii?Q?UWcmVv4mS9o4r8FMiotJNaT5zM097I+D2wr+2KI6zFfunyb+Ie4rC8P+CH4D?=
 =?us-ascii?Q?Q8Ly/ay1ezz50nQF+/D1TbpKd4+DLxT1FvAaPxdp5sEkGWDSWQaQ2MfN2/qn?=
 =?us-ascii?Q?xJmKUUcx8mUsKGSLyqBcrsOzzvO3OPSDqVMeVQTxZTsFCIjzEuKFlkGLJ9MI?=
 =?us-ascii?Q?O1CBakxmSsTNQ9+mC0G0ekCUgcrbS89miMT9?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jWZnzjnYmKX7Ut0XPhx4r69WHrj8OrpAteDycyguK7+vgTBGb30zFSnRlD1O?=
 =?us-ascii?Q?HPUgYn0UzxJwiAK4TX+b9ljwc0G68XGZNw2/3KdEcr/sfS5AVjUKg8KSS0EQ?=
 =?us-ascii?Q?kE++ViJWicit2syIhd10UTnNRwVOHpBVLjidObKKkqVMOkIpQNeXEnniS28b?=
 =?us-ascii?Q?k6U5QGHwQfAVC3egZIY2ghj2FrSG5ErJLZ7RHCOs24+9cWSuNGAU52Z2PAM1?=
 =?us-ascii?Q?Ow9ah1S7ajD2yu6YHuGPyQtbFoavkPzdslRzUO7RiIEQ441J34m37e7lcLS/?=
 =?us-ascii?Q?7WVUj1aRPz7EPQ2NppD6RoiemfKuhdLrKtsPhmVxM3dlcHoJZRVcf8YA/gfA?=
 =?us-ascii?Q?emrFUD2TEatOwCkH10l/F9rvRHj4SFMxhRc5WjYuGz78B7SQz6si78Gug0es?=
 =?us-ascii?Q?OYdCn/837s37rbddD4O0DIgdJto0vIPJ09vk1crlTpMz7xKCRYaH/kXaZfxr?=
 =?us-ascii?Q?lEE51GL2ek9A2cAxrLu6xHg6/2R4944n+N0FEM7r35Ot4erKC0hnBxak/ZUV?=
 =?us-ascii?Q?6YI0FMcJAAMYCQWYKpq66n8YiA116jpFOko0aRmnoJ7IKO/hqu67TU4T/XpC?=
 =?us-ascii?Q?X0ldoM68Yi6ry/P8jfv9evfMBx0XaOVrDRZzjIlcWxVagd6emGI+WyIuVkWF?=
 =?us-ascii?Q?m0Qh1jpg6Mo5aewsHLgSP1d6XxE1BTsIeXhkLs6czBIygyq/xemcHgqt7UXf?=
 =?us-ascii?Q?7fmiElSPSnm7EJX6bRok9QGBqWoLg8KEqMPNYgjXWWwVWrGNY/OE/nRFVdZI?=
 =?us-ascii?Q?9tLRNcMkFphPJtKFMgk0jxDxJbtVyVI51fnCR1KZIL4k/SMP1LUcKPl4BmGB?=
 =?us-ascii?Q?DHXDKLNtC92ncXGwgRQIAsA3QmOYDeo+S5xeEKXFUfl0g4bd64J/Dt+Srnxt?=
 =?us-ascii?Q?FdYlNCYWe5TuWrlVDNENGkLuaziA7Dm9g5YN7rEAb4su+gLds9HVB+TmID4G?=
 =?us-ascii?Q?tm6nElkTjAQfPgOf9jelelF0AFBVmbSFbLT8eIVTonCiWENuSxxR7kcv3wn3?=
 =?us-ascii?Q?tDdYPMkGvdOP2kIL9BGciYF42Ud5XlBp4h8+12L5anZhy+0O3o+qp6FeJGnT?=
 =?us-ascii?Q?mUq1J97xN7YS/gv8AvinJL4NSw02kGAMv0N+ELbUOqoNpLPoJryGi5CsbpKa?=
 =?us-ascii?Q?bXDe0X9+FwMRu5+QQIVHSFjhX6Cx6kVCYWKOIMiNDO2Mod2Qom11X5hgJroE?=
 =?us-ascii?Q?z0mNlcPnK81eS9MOTxpB3GWlBcL4yHZdDn24TBESeDEkLJx1t7YZErlSRO2c?=
 =?us-ascii?Q?CXR6nmSFPQ+CVo9czb2L4HqkQWz7jdfNSBqB9uFFr3aCI5CwEmAuhhMO49pa?=
 =?us-ascii?Q?CHOe2cZafCNrfxcHIsRPnKIXGs1ZNsTPvhuEZSQB43Rq5+zp2OTSp/6LSZ00?=
 =?us-ascii?Q?OQJJvMyFJpTUprXGLDThnFkjobbQ4OA8vMHgqDJY54qV3nsyQxTCPm2MBduD?=
 =?us-ascii?Q?aO1Rd+MqQKtWeV/wEwuS7oUQ0kmPrFjoApqvO2K/L1JDprevOiVAf/d26egn?=
 =?us-ascii?Q?XYC7FuBaay28lR+gDuEsv4lMyH8GD3mOcV8Tpqsiupg8+Gd/pqTzOboP5S3d?=
 =?us-ascii?Q?6t/EE/3F0lJWpnP+KftC5VUG4E3v4uDHbqWBsh/3hGf7qQ1JbsoHq02IG71/?=
 =?us-ascii?Q?4e5t1SifAa5f68Hrg0cco70=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04b00b55-5e58-4740-6c96-08de0ad8e504
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:19:40.6017
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i9tTUvnkR4L4Eu2sfgx1Gpug3Yx7di27OChmjAn5zHoeaKZQBx/jdKeSPbHGFCaBYAug8Xk+ebWa7hp3bZXd2btHmCZL168tD6CczvM4l0OGaVrlJ9lag7dG2OBOjta6
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
 sound/soc/codecs/ab8500-codec.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/ab8500-codec.c b/sound/soc/codecs/ab8500-codec.c
index 04b5e1d5a6530..14d0378bfe725 100644
--- a/sound/soc/codecs/ab8500-codec.c
+++ b/sound/soc/codecs/ab8500-codec.c
@@ -1114,7 +1114,7 @@ static void anc_configure(struct snd_soc_component *component,
 static int sid_status_control_get(struct snd_kcontrol *kcontrol,
 		struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct ab8500_codec_drvdata *drvdata = dev_get_drvdata(component->dev);
 
 	mutex_lock(&drvdata->ctrl_lock);
@@ -1128,7 +1128,7 @@ static int sid_status_control_get(struct snd_kcontrol *kcontrol,
 static int sid_status_control_put(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct ab8500_codec_drvdata *drvdata = dev_get_drvdata(component->dev);
 	unsigned int param, sidconf, val;
 	int status = 1;
@@ -1183,7 +1183,7 @@ static int sid_status_control_put(struct snd_kcontrol *kcontrol,
 static int anc_status_control_get(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct ab8500_codec_drvdata *drvdata = dev_get_drvdata(component->dev);
 
 	mutex_lock(&drvdata->ctrl_lock);
@@ -1196,7 +1196,7 @@ static int anc_status_control_get(struct snd_kcontrol *kcontrol,
 static int anc_status_control_put(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
 	struct ab8500_codec_drvdata *drvdata = dev_get_drvdata(component->dev);
 	struct device *dev = component->dev;
@@ -1279,7 +1279,7 @@ static int filter_control_info(struct snd_kcontrol *kcontrol,
 static int filter_control_get(struct snd_kcontrol *kcontrol,
 			struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct ab8500_codec_drvdata *drvdata = snd_soc_component_get_drvdata(component);
 	struct filter_control *fc =
 			(struct filter_control *)kcontrol->private_value;
@@ -1296,7 +1296,7 @@ static int filter_control_get(struct snd_kcontrol *kcontrol,
 static int filter_control_put(struct snd_kcontrol *kcontrol,
 		struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct ab8500_codec_drvdata *drvdata = snd_soc_component_get_drvdata(component);
 	struct filter_control *fc =
 			(struct filter_control *)kcontrol->private_value;
-- 
2.43.0

