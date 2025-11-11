Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010029.outbound.protection.outlook.com [52.101.229.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C17221ABB1
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762821152; cv=fail; b=tqygb2DzqoFLylXi4skPAzTBc1nijPeG49zVOaO/cquvSrXIdZD7dxvU+Ce9Wt+DvwEjfaf+bHEcijkA2O8z4EuO6dsJEXhNBq72HCfdNfVZuYtM94cmJeGTGZXF/bGyjKw1cFaAt4uQiLaZuMWdKfEeZmDxcynkt5QtqmGVXIE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762821152; c=relaxed/simple;
	bh=5yG3wCIeZ2eMyoLJ9tdJ4ffLkv+BtSYJMi9v8IDZExI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=tlShiKSSbeOJxMd3+Smd+x5oc9oBUdmEZjN+B3bqhQy35r6tXmtRgoEgAMVr1xQQmzjijqKQeSJrfGeMPNk0tEMw7kqgPD17ZACk6GTZTa2EBumF2NhM8dqY75KkXv/G1N4nKSYUYBEPXh62KFXNly8wNxF/ilBNSZmOYUGaUjs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Ll6hU9Rm; arc=fail smtp.client-ip=52.101.229.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Ll6hU9Rm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pv9IsnhuxYmxP+QnH6u8B0dsMjLnbkwb9tnjTW+O0q0crm88pVZ7jG+YdrSYMb0m+Oa7xs5kF/BsDtR1dCdr0Mq/E2elyKUoNemcgdfxn/jydlLHEBBdWOrO2nXg43+tqRVwnBWBsBc4BHCjhK8QVWTiN/9WWNveNaYlM3AEcn144WreyD76Kl1nwnwo5wb/tGURo/bsaRf67pU5G1tIJzLBAysp5tHVJYWMyIQ2i2hk4QMSTOxPt4191qDrsrcP3e4x5x8PfS9FbNFfkupoZkxLYoCXi4sNHdmymtlY+njfiyWBSWIXfqKLSJ8zL5ba+6AAU0h902G8a8Ajn5GYSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sa+fkTRYwrGsY4qD0tnRTNWrK5IZfbXd9cOpb5SLTXc=;
 b=MbsosoC+r0Cx50XQLsH8FhlfUGng1u5REhMphVi2cgxVHwAWMx7YuXpzTE3vJFKuTKUHXNwZLqU9n/KZ2iuLYLoH7n5svc7y5wPrwTdiGPNAxvrVTHHdHOGJQiiwFrGpDRQF+OnNJ5kMVzlVFJjSKDEKY06wsxUNwZ8txiiakQRVtfOMbw7kPBUlDyCHwvYYZymb/tdnzGUiPzbe59pF4AKwiG57gRM044d6nmsZwseegaImWBolFasICAvDlrMBquk1XikO0Rs4Oxh0yCW/yVqrzNfAModnd1UT6xt6z47D4ZpKUFCvYc1rWTo+Nf/7vKp+U1PK2ZNunUOz6SdxQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sa+fkTRYwrGsY4qD0tnRTNWrK5IZfbXd9cOpb5SLTXc=;
 b=Ll6hU9RmJEHHrOr1rEllB4Uje78fJYu+1GpH2A0FIbF4WNXNEwO5H9AVKXLBH9FU7fHyGN9E+02HzAWXhba6jzyxGHzYQl7qigyWKt+zaR23jTMETDSJwa7T4jQxPNHtXNWrqfQASYFZvj05a5SJ6/HQrAk/tLCZ43gzy4IRzoE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB9810.jpnprd01.prod.outlook.com
 (2603:1096:400:222::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:32:28 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:32:28 +0000
Message-ID: <87v7jhwgro.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 211/292] ASoC: intel: boards: bytcr_rt5651: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:32:27 +0000
X-ClientProxiedBy: TY4P301CA0024.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:2b1::11) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB9810:EE_
X-MS-Office365-Filtering-Correlation-Id: b6a87a83-8bbd-45fa-c514-08de20b9caed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?aHIk3YnHrDT0RHvysR+orYf4LqDGDQh5TYMfLZ3j4nL9zyCEzj7x3dlgZitH?=
 =?us-ascii?Q?Tnr3ETCpSMMXGG9zWUPnhaq+VK+yKVbNnzijpGlOn3+l2Q0VWP0Xyz2bBlW6?=
 =?us-ascii?Q?yBhzIuc9SMgSkwaDnlHuSaJ5v7xswLqMpSx6BU0BRaPrZX3A179IY2jSok9P?=
 =?us-ascii?Q?9jZRHPZem9mX7sKNp7FIiBRF0jz+8IICexcYhGMH4Aljv8LWav4TcDvv2D4h?=
 =?us-ascii?Q?wih5fFwufQLJxNDiyqBGEbm7Oo1SvuDKOYRG3JuFlh4irN7tFZliekjW3sSC?=
 =?us-ascii?Q?DiY1Gu/YZTWKY53uOUI4VaAmCOFtIoJBCQXGcfTIp9cfhrKiKPHMt1+Su26/?=
 =?us-ascii?Q?B+yfe4moqx6PEIeeRjuxsiWeWWlSSjbgJSFnedZdPc6fMiN4G0yQEcvNYAHE?=
 =?us-ascii?Q?lA4uXttBQWLjdMxq4DTl59izhcWQnXfjPWuv13/rSOQVBQTxwIgRDY3/UxsG?=
 =?us-ascii?Q?EgaRPCOlteJY9geeX5fhG8wz4FEXb2GfYJhJ9a/Q5uUaz7q2va6gA55/aEhr?=
 =?us-ascii?Q?XCq9w7bB/2QSbJ6ssfsBUcct6+/kykFGlrwLLwi43PUk9zjF7u2LyYjpBWEp?=
 =?us-ascii?Q?zxy7Yv33/k1fi7B/OCrE1Smfa6GCaEfBQ4kPaz+0fvDbA8YfiHmdA7HdjLna?=
 =?us-ascii?Q?8CdsrLgiqzO8yeKsTY1ytKwgTiloGpTu7vJeW9mwBq3Yma+Xw/IbXyatfA1S?=
 =?us-ascii?Q?xmCjdi9CFvbLMf3YA/guTxxrfWS0Y1c/8nnGhLnZZ+mu2isCJrZXCh+xkr30?=
 =?us-ascii?Q?8Inyp/tpTuy4q1DyWIVUgk2hr/sonT/76mjiMIHPJ57Zus9qPq7huQ4iwxA7?=
 =?us-ascii?Q?m6fk1QufAXPr0Pjz8EQybFCrVUpJ6OI0JwuCASHyzmy4j8bLZdXcmmXjQxFU?=
 =?us-ascii?Q?J+6jZBZCEj2RRVsRyeZfkWrbTJKXAHSqqmAeA+apdr9kXgQtP1Hn79fqBvGz?=
 =?us-ascii?Q?TT1UgTvhYA66MqUYaQ9L+VS9YkAfec22ka/BRaU8QBHLZjRfwRjGgH1uj5xw?=
 =?us-ascii?Q?Pij2smCNzSUbxpfkDwRt/nXYt59LOq9r3/SkPjffXCDsf3BwxnQT6OkhDzzk?=
 =?us-ascii?Q?HPi+m+PLLGDWPbBrGSZC55gyOa+vgN90eqZLT/Gum93oiCL1Z1m0wldgZ19H?=
 =?us-ascii?Q?N8+WE4CU1h5SgdSvYgaHcuxK2T54mTcOiTDmmM4Ic8m7R/Ti6og3Bg5YwsU7?=
 =?us-ascii?Q?L92+dIXWfNPHvDr1pchsMOMNMZXma09mVX0RjQktZGkaY/TCGivXQbreAB9U?=
 =?us-ascii?Q?tEYnB9zxr9iPb8sXaIRJRGpNDTB1+6DFFyUXffg90Ui/E7fojLl49TinG0TS?=
 =?us-ascii?Q?DT1pJ4atumV8psMbkqH6YcrLXg6hH910tB+jsANyijXEkOEDmUS7fPtC74h0?=
 =?us-ascii?Q?PSFcJvNkzjojVENTmjSQrGw5pbCoWNhK539PxrKZ47g6L6ppoC90vRicMddi?=
 =?us-ascii?Q?NoH5Kb6hy523u+qgDsPRotUuaa5wm4VVR9JcLiYBAkxPoZsOzNFj8mDEZW53?=
 =?us-ascii?Q?oVx3t6uCYeqPa7BycILj02AnnYa49KmuJY/R?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?npj5H5kXIn9VtlPrLYIRNMAuB5cxdtJq8JMOjTSaG1220ISUXgcUhtKhV8EY?=
 =?us-ascii?Q?OI/4vdl1VY8Zj6NtTOKHXNiotqbKUeX25I5Y0BkXBEPGK613VcDwFE4j5OxT?=
 =?us-ascii?Q?KWikiyp3T94fT1Vc6GWQoaCn+e/7Cl8Fd6TKkaLZKg0RLz8HBio8ozIOAwbH?=
 =?us-ascii?Q?RlfE0bPyKFykn0tCSlfEk6fRbzloYL/dbqm62QvHoe9KJX+OlrU7jgU02imG?=
 =?us-ascii?Q?vTlHi3+2PKel/5ur7g2KFaG54lLTyi5c8PZm9kn2La16MV+skTFHQaO5Y3LQ?=
 =?us-ascii?Q?HAl2QQlbszolPQgcPI4W1fd0Jhm/eaHjb9B+TsEDAADpDLCyuW1ZBt3mlAVl?=
 =?us-ascii?Q?UUrgOSKd8U2W2Xc0fCElOA3z0w2SQr8jmlQ0r5dGJI3GsByjY1JpwG1Mh5cj?=
 =?us-ascii?Q?z4mVJZwwLdNYyyzFc8oDr/b9mpqc/ecZIAppn+1GTOHz7Wp6FwXO/p4SjO4d?=
 =?us-ascii?Q?94s/ZngFx8+qHeC496OHoPTJC0D4LRK+aCwzfyphzavBCJ216A8HGaPnBwvd?=
 =?us-ascii?Q?SltIkYYtQbpfNxvj/TIy7acH+TC2/vdnxYr9Pk9CFeMaESEgKDo8HWtgFPHd?=
 =?us-ascii?Q?bPAtJ3vCO0t6WVoylq2p/LVWcBujv4OPojyDUUW3d0vm9Xsx45IWX7vKdknD?=
 =?us-ascii?Q?pVImmSysIpj5d+XOp6rBuk8IZaIdQneJCp3DqOi85wxxpF4K2fSP/DuRwdXm?=
 =?us-ascii?Q?J6O+fa8snKQMThUiS0x43jFf6gjyRP4h3EHKcC8m2kh5yCsduFzIwvcau7zq?=
 =?us-ascii?Q?KmbxcllFB519CJtRb0o3mHBkeoDbk4Ao20NINHBBEKou9JqsjqG1dRlLoIQX?=
 =?us-ascii?Q?A9GpVRDElkZPGzB/yeeJ+ur4k8cd5QyFO8F3WnVguHXJRtQAz+gDaB3gW8ja?=
 =?us-ascii?Q?JzSUfP38PeeZUnC/ZtZuh36H/hKc31YOd+iJHWOQxCy/Ym2dURKVMg/7NPRj?=
 =?us-ascii?Q?USy7Y0t6qJK3SS+9bAZm7Y0hviBXUHVeaKnrg2yCw9ItVFlFwTj5SxaHzcY6?=
 =?us-ascii?Q?AwU9zhsPt9iP64jAh0q1h1nTG8M8QkojeOcZW6fTSIUWhgMdEBcM2f74AHpe?=
 =?us-ascii?Q?NhrEfkF5s06dDqYl7gjvEa3l+k6UvLIp0MUuNmJiGr7Tu8TcadTm/PoxjmGD?=
 =?us-ascii?Q?o8VxYmZEozeWR0JR5LX1wEFEpPMXouW9CVfVsCT23MWizRq+sUBGfFxYZEnG?=
 =?us-ascii?Q?75UzLMHYcSZbTOLHuxUeyMjEJxgQgKreKV6zwSSbmBQJ/ICcYW6gLpXcW2iV?=
 =?us-ascii?Q?atrloBT5Oeds/Equgs5nlEf7ktasmDSd/T53S+w0E8l4rmVViARkiAiHEYRB?=
 =?us-ascii?Q?BHF5jrkipIYwxCE9y61U7W+/d4JZIH0n5OadqXEnWd1LbrQ798zdHWyqFlGi?=
 =?us-ascii?Q?9ibwdgpMpOO0onSfIXLW+18F4aErYq6DExAEzPNSq9XrOOxQXBzgpeKjjyMA?=
 =?us-ascii?Q?rnltgl+tiICbQ9i8TrBX3lEaugzossZHlbCcv0I8TlEZLn/r+dNhZA5SwD+q?=
 =?us-ascii?Q?rsTpNf6JEtnIKTVg8ARf57+tmtF7EPOKaeVmNli1NilGyWjHBkB0d78iHmi/?=
 =?us-ascii?Q?O21OG1t+Co0iClrG2A+rgB0iyOQbZoIpd9ygEhAzq5um1ir5EEnJSI/nPb5q?=
 =?us-ascii?Q?bChRPe58HXPb3eCkUrt6i4E=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6a87a83-8bbd-45fa-c514-08de20b9caed
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:32:28.0114
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xq5FhGIZZ48WBttje3FaHeNPDglB7H+EZ6qIPzqgyovO6IbRksgYAX/9FD0agzmWIlazStbAj0EcSuNIrLlZSeFGne/YXD6cH0vfAcuyN9oNLMm8wD6zbz0NfWEY4Jnf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB9810

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
 sound/soc/intel/boards/bytcr_rt5651.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/sound/soc/intel/boards/bytcr_rt5651.c b/sound/soc/intel/boards/bytcr_rt5651.c
index ca540a66f22ce..68cf463f1d507 100644
--- a/sound/soc/intel/boards/bytcr_rt5651.c
+++ b/sound/soc/intel/boards/bytcr_rt5651.c
@@ -188,8 +188,7 @@ static int byt_rt5651_prepare_and_enable_pll1(struct snd_soc_dai *codec_dai,
 static int platform_clock_control(struct snd_soc_dapm_widget *w,
 				  struct snd_kcontrol *k, int  event)
 {
-	struct snd_soc_dapm_context *dapm = w->dapm;
-	struct snd_soc_card *card = dapm->card;
+	struct snd_soc_card *card = snd_soc_dapm_to_card(w->dapm);
 	struct snd_soc_dai *codec_dai;
 	struct byt_rt5651_private *priv = snd_soc_card_get_drvdata(card);
 	int ret;
@@ -234,7 +233,7 @@ static int platform_clock_control(struct snd_soc_dapm_widget *w,
 static int rt5651_ext_amp_power_event(struct snd_soc_dapm_widget *w,
 	struct snd_kcontrol *kcontrol, int event)
 {
-	struct snd_soc_card *card = w->dapm->card;
+	struct snd_soc_card *card = snd_soc_dapm_to_card(w->dapm);
 	struct byt_rt5651_private *priv = snd_soc_card_get_drvdata(card);
 
 	if (SND_SOC_DAPM_EVENT_ON(event))
@@ -579,6 +578,7 @@ static int byt_rt5651_add_codec_device_props(struct device *i2c_dev,
 static int byt_rt5651_init(struct snd_soc_pcm_runtime *runtime)
 {
 	struct snd_soc_card *card = runtime->card;
+	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
 	struct snd_soc_component *codec = snd_soc_rtd_to_codec(runtime, 0)->component;
 	struct byt_rt5651_private *priv = snd_soc_card_get_drvdata(card);
 	const struct snd_soc_dapm_route *custom_map;
@@ -586,7 +586,7 @@ static int byt_rt5651_init(struct snd_soc_pcm_runtime *runtime)
 	int report;
 	int ret;
 
-	card->dapm.idle_bias = false;
+	snd_soc_dapm_set_idle_bias(dapm, false);
 
 	/* Start with RC clk for jack-detect (we disable MCLK below) */
 	if (byt_rt5651_quirk & BYT_RT5651_MCLK_EN)
@@ -610,24 +610,24 @@ static int byt_rt5651_init(struct snd_soc_pcm_runtime *runtime)
 		custom_map = byt_rt5651_intmic_dmic_map;
 		num_routes = ARRAY_SIZE(byt_rt5651_intmic_dmic_map);
 	}
-	ret = snd_soc_dapm_add_routes(&card->dapm, custom_map, num_routes);
+	ret = snd_soc_dapm_add_routes(dapm, custom_map, num_routes);
 	if (ret)
 		return ret;
 
 	if (byt_rt5651_quirk & BYT_RT5651_SSP2_AIF2) {
-		ret = snd_soc_dapm_add_routes(&card->dapm,
+		ret = snd_soc_dapm_add_routes(dapm,
 					byt_rt5651_ssp2_aif2_map,
 					ARRAY_SIZE(byt_rt5651_ssp2_aif2_map));
 	} else if (byt_rt5651_quirk & BYT_RT5651_SSP0_AIF1) {
-		ret = snd_soc_dapm_add_routes(&card->dapm,
+		ret = snd_soc_dapm_add_routes(dapm,
 					byt_rt5651_ssp0_aif1_map,
 					ARRAY_SIZE(byt_rt5651_ssp0_aif1_map));
 	} else if (byt_rt5651_quirk & BYT_RT5651_SSP0_AIF2) {
-		ret = snd_soc_dapm_add_routes(&card->dapm,
+		ret = snd_soc_dapm_add_routes(dapm,
 					byt_rt5651_ssp0_aif2_map,
 					ARRAY_SIZE(byt_rt5651_ssp0_aif2_map));
 	} else {
-		ret = snd_soc_dapm_add_routes(&card->dapm,
+		ret = snd_soc_dapm_add_routes(dapm,
 					byt_rt5651_ssp2_aif1_map,
 					ARRAY_SIZE(byt_rt5651_ssp2_aif1_map));
 	}
-- 
2.43.0

