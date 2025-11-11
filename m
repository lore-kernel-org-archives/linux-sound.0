Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011001.outbound.protection.outlook.com [52.101.125.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B675617A30A
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820557; cv=fail; b=f/xzy347/BvZDeoK5q92r2IDQewC+KaDJQE59fZdiPCsGx+q2ud6/wvpneMhOKFMbQQmAMnazH3wVivTqXsJPlweKxGRMm8iIyCZyVcUYhzOxo+1S6UkUwOjsk4f06sTxAZeLMN1c4xsExLHF+p61K+RHSaCf1nNgUeNwsuiKKE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820557; c=relaxed/simple;
	bh=1huILbfv8nby2hi0qZrYoI3bmUPO9CeNSrGWnPmeR3U=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=IHz3tz1Ql5dSavfq6uGflI9B+WoQEwCm6G77aQGC6n0kLn5QGrMoZZ1XGkYndEW2mYH066BAYi9QxmVMeZbuWWECQGzzq1GYhxgsYEQ2xfPuOtvV1YRfZo7zkgqy9iQ9ty9cTsQAZMF/cDx2/4oE+X1fRfrZCmdKx3S2fGiw4p4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ikzBS08w; arc=fail smtp.client-ip=52.101.125.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ikzBS08w"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VUnwfKJoGA8i9SkxiaK0Yanhq38mr/E5JpZcm+W3BWtLCIChfEN5o0wItBArJWtxmL97UQiOzG9rb8c9ujRedRqGPbmNFA+BTpOStfVH0IHQQr5CfX2VGUizPrXFRizutAD0c4ZFY0HaGQt3zVVJVMA4+rDwrVSW/h0t/TSdIckl+rauJxffHrhs1c4D/SBOHmsuluSxzfofFxPrMEyrlNWTb4FeaulPD9JrdHG8fGZ+UiTpmZFNI/rxcHFJH0FSXZENLL7lx9UyYUQ/h4UNl6me95lVnZOozInOr4vh3RUzPYO+A7zsOU9vsyt0IItCi2/YnWw+POy8T00uI+rZ8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jmJ8djfgl6zdD62fbHUSe2IvydAfP3MtRN1YrJrwmh4=;
 b=D0Blyg/ZydmKDOJlVtNcUvLQBBvvSW7/NzZNj1c4fT7PIOS1xd6GlOzYvYdoQt4Yc/BDI1oQhiZVdfXBcydLSfLljmlU/5K59TgSVaAB+vplYxojdB5JTnmKo+XxRxYRulA++Ko9rlBSxf1Y5fh22qSJeDgm2N7JtQVtOPB4LpadFjkkxgbzx7sI5mUISx9oAPrB9vpa6Vdm/rEx99f+NaAi584LGxjY6rIRxom4tgsP6jcL3nmllp16WeyFr44l3EmFRJL4vQEd0om4Q8U7RP0GkXMJ71E9RVsPqsigKVNz3lOZPHHAO1bUJILeGaHS02Bw3JYKd8lGYisdUxtiDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jmJ8djfgl6zdD62fbHUSe2IvydAfP3MtRN1YrJrwmh4=;
 b=ikzBS08wTZCOfw3NkoVSgfPwhrgIQka+4G2JGyg+Q2KMnRRijMvgpSEsRgC2Z2zEXDMu4wEyJewc3a3sTeeAxXduM0a3M4O/7YgiHDLfIx6aIlfSldlErXpiAuUrjnYJUxsI1OKwj9XS+Jr+M5Bt6XEnActrkGOc0P8p9acfEiA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB10376.jpnprd01.prod.outlook.com
 (2603:1096:400:248::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:22:33 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:22:33 +0000
Message-ID: <87ms4t5sfq.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 067/292] ASoC: codecs: hdac_hda: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:22:33 +0000
X-ClientProxiedBy: TY4PR01CA0046.jpnprd01.prod.outlook.com
 (2603:1096:405:372::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB10376:EE_
X-MS-Office365-Filtering-Correlation-Id: da00578d-7e3f-4309-3f00-08de20b8688b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jU15utwHW0YqRKnEqP68nWd3MLtNzbOLemakDlUyFvqUTBAkkc7R4fgJ6iQB?=
 =?us-ascii?Q?WI9yYJEEkFAXoJRk3QzVgEc6bBJGO/Mxj0KhIZhT9ImpaaPdJyQkinbrGESv?=
 =?us-ascii?Q?uy6oOUFmtiNU6BGoGWzWCv4unp49XsPXZZoUYLtrCLvoY9nPwS6pw6gr8DkM?=
 =?us-ascii?Q?FyTBSvfhVBp3dkIBeSVnX+MW1MAsXRCD4dYixbtK6ty1fE3TC7LAIUYhwhPm?=
 =?us-ascii?Q?TkyM92r/DMs6WKzdvLsgZsQeSGt45PXheX1EaPgWrj2WChx90of+2Rd/N6W4?=
 =?us-ascii?Q?C1VJPGr0w4lSvKyc1xKLt2NY2d1z5lHYRc8ZiQsAKYiuDJKf9OaiIjf5+LQm?=
 =?us-ascii?Q?iFtmCSATukpe3xixZI11HHvKIrDzdnfhsUPhRMlekEIR1cY+/KvLTLTT8Mep?=
 =?us-ascii?Q?b0WNrbVk4BO4sxFDXUzBDSJwXY8eBf0Q1PjNoVTKo1y73jl2vK7dxxiOPvRV?=
 =?us-ascii?Q?GcakUj5PkSzm+dkixRMaQBqWPXTBLV80lAlp9fUSlE7whEFZizdPc8Cj9+CU?=
 =?us-ascii?Q?Hc2ok0z1rVAZGpqAdbotDtdoNMNcHwXpT97/InyYEdH9rVi6H517gJ08pTe9?=
 =?us-ascii?Q?QK7Y2Up51ZyGy30R2CWcYIKd1F/exxw8gW6B4n7dZqmdyKp75jjg+7vuwrLk?=
 =?us-ascii?Q?kdjqVHCnZgUcasrYimyWS2r/XmSllIYzh6HO7vfJy7uut5kI66r+w9x0o9lv?=
 =?us-ascii?Q?2Qk47M6Musbr7DcnnpPs/KB3Z8ROQyTQsIsUyltJ91P6XXLNav5TQHJoK8OE?=
 =?us-ascii?Q?4nRRQb4EScPZoTyyVRKbNtJ1uCdXLqTOGSS5KPreuO4H9yjK87RzvR249Pkv?=
 =?us-ascii?Q?x1bZ5P//pW5tDh6nKQGjC62uPMtR5OGJINyd6V9Ju5ckrueYbgMCjvbPq44C?=
 =?us-ascii?Q?kGXDLE/BeSiRF3lcXcW5CtZycCPoIsqk0tTtDeV0Indg+ltWOIZmZQLfgjsC?=
 =?us-ascii?Q?ECkVHHiP3fe9paN7eKwGQ9/ORxiBjJ/9eTOsF/RGS4X37xM1BfFS82oq9ZxP?=
 =?us-ascii?Q?YL0M17GIFs7jf11D1ouEhyANPlphbuH4DjIjcOAGYzJk71LjzfgulxQYttM/?=
 =?us-ascii?Q?SLEOu77zOdY5CmzFvLvt9qZOA/5O17DTKht0By6mmZNl6IHak3cOdJv11i8d?=
 =?us-ascii?Q?HHwxQT9RB2Fwka28zipJsmMoMDkOlqdw8SACwnvY7P2bFTNNlDQ1WLoFPIfA?=
 =?us-ascii?Q?Ygr3y7hl9EVSwFVQ+0lA3DQtYOVs7mHtuCu2q+ukuoTa5aJml8+8R4uRapaL?=
 =?us-ascii?Q?CTRwfaWOj0/XIzh96ZlEwolDhD3ZUTUKJNTC8753svT1lcZntRLRjzwQ9D7u?=
 =?us-ascii?Q?pEwQ1vC9XPFevEBOVAdjVsJ57stboT7H8azfAVebynY//Vi5kwdM6Fr89Ndb?=
 =?us-ascii?Q?Mt6hDk5xyJOqL4yAtg+RMVdOOzweziGGMYl4gd627ta5SkgOJyjI9MCOBDDS?=
 =?us-ascii?Q?vwMyAD9C6WoWkweu5DNqrVWpyw5EjGORTzoX//GosTznVaI2VPNIYt0/D/Ej?=
 =?us-ascii?Q?Q8c4ConxVQXBaK5T76nBlSf1+/wKkRpUuNjI?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hELorFVBA/FtMbz82506j7DgErZ0ceYKtcsXC4eMFjGqG/poL1b8VXHTIvrL?=
 =?us-ascii?Q?nqcQbU7Q69+GKxDLv6fiBUm9jy6j4xozids1CLH6xkTHCamiCVLuaZ5exkMw?=
 =?us-ascii?Q?GNu/SKVO3O3rnR7IksTPJdRG0N4cQHMnivOj7E1eG9Z9Adpcm+DsbEm+Pnlh?=
 =?us-ascii?Q?jLZ5fr+5m0ycmHEYT2fB1PmMggtq2Mt8gDlHkwUn8Tn8+H52xL0gi/KtRshu?=
 =?us-ascii?Q?D3C01VqrT8JnYSh6P7IrEsoMdZGz+9LHfr6zRyUn6BC643XNKo/DR2DF4TBW?=
 =?us-ascii?Q?VCMP6FjSoqlvlAaBL5TBP4k2lDCC1q8BgWLZ1e5HQwvKwliymfGsQ4/u1DzU?=
 =?us-ascii?Q?0KTAUewD/b02Ypbac3urVoxuIbG9iALh2soujHoRwxkVAYJ/fKJgqby6/NDE?=
 =?us-ascii?Q?KTV40ETbe5IlZfrK/EFpzIk5zFBy4MC10ZP4AHC73jXCkV4pzBQ8QJZ4eR0e?=
 =?us-ascii?Q?xQ0b9DbYJwjVUOlGPlJr67Zr1IKqpXJogGLDwMuKYrQwvUn93YW3xQYQ5JX8?=
 =?us-ascii?Q?Q+xzvukomnpvHmjGQJ+76OPXZqrvAVSxB1xklJZmvovtJ7h67W8DK8aFM8UE?=
 =?us-ascii?Q?88PvwWVbxkLaIf3mohhRm82xmvsUYGNdA8nDHi2ij4cdegESrNLpOdvpF82N?=
 =?us-ascii?Q?JLxoq0GdFNt/96JOdYBKWzF9bAaYRoz0Mt8luWHYRa908nl0kkdqYxCzNRtX?=
 =?us-ascii?Q?COrKEZ/4ay5yTcIDUlmrgkablIreDdzEiM1zzHx5GYEsDvssmkQ1WUJBt51O?=
 =?us-ascii?Q?5pq+5m8cOEcvlNv3S38Oy8703zLnG8uFAWscvWjSheaPWihrXHrmfQADc+aY?=
 =?us-ascii?Q?yQOL4klqyQXVveS0dTMZC8HkG8eoEIRAHrEXlzrjfQX0QfDZ/y7AH2Nm5O+G?=
 =?us-ascii?Q?Nm+R2JltDQG9O64rOzLUE4DZkUz4mUGFaf4J1qJ0aiIQ7BW/SegfZwFGaWpL?=
 =?us-ascii?Q?7F8yCNE9sSTh8+s8ZiNMLJtwHQvMYt/0QE24ySyHzrUkK9UTzvSuseDCEXCX?=
 =?us-ascii?Q?NFnb3EeirgEk68giYyjJneiHLJAkEOF9DxnnrlUbMSXXsl336CtT/YvQq5Wz?=
 =?us-ascii?Q?L75WowaOcUoMsVRoBnSuunqUQhtCUGK/DpcYAcPIVR9C0TXt5lWLtFl+AOTY?=
 =?us-ascii?Q?TZ6dgoDxykq2s0quSyDfzT2shqYDQkXsczEK6153TDhMYyMMJJLYVnGK6Nh+?=
 =?us-ascii?Q?2ydzTiW8kl12BK9ZRnE23FQPze30K1FyMH0uKQEl0mZ+NJ8R70A+tQEvPco1?=
 =?us-ascii?Q?CZalHC/n7tCDJqJu/80wa4LZDYRaBia4Yd8EkBz3twPXNFPhvzJscfcUsota?=
 =?us-ascii?Q?IOUtDl4HQdM6T03p+POTZrYELt/GJj1bdqkEE6x0R+9pBcyGl3qouV/zzlg2?=
 =?us-ascii?Q?Bn/Nyav9AGvXo+7SxkBknAEWyquUIDowLGQYaEpdC86U1alCWsm//3fi6Ik0?=
 =?us-ascii?Q?Ku6+W82N7ARGK/eNK+GcczDomGJNS5G1hNvZRIiQb3FZukLwPSTIXej7kOLH?=
 =?us-ascii?Q?1h1kVtf61WGzY0UFPCe9F3P/gLkC6SGj9ZG/c6X7ebifDnd51trdyg8+/2tR?=
 =?us-ascii?Q?vicUMaoCwuMkv2K6BNZozSVFCHTGx063xzFJehOB6CVnDCpzGiawcI1gvINf?=
 =?us-ascii?Q?kUFs2QVXmyVQrRR0IRpYbcY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da00578d-7e3f-4309-3f00-08de20b8688b
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:22:33.4237
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mP5VwDoVWGRzPzErL2CogUDSafVjm7CEOjHcVhqjPA+ZMa40mvqOWdZSJLksCyGKuhzlL6ZaDW1xqHEmElXDbLylI4jtv7FPzZnP1SMK0bu/Zs+NOipk0lGFnqC1kpAs
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
 sound/soc/codecs/hdac_hda.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/codecs/hdac_hda.c b/sound/soc/codecs/hdac_hda.c
index afd8edf10fdc8..680e341aa7f1b 100644
--- a/sound/soc/codecs/hdac_hda.c
+++ b/sound/soc/codecs/hdac_hda.c
@@ -405,8 +405,6 @@ static int hdac_hda_codec_probe(struct snd_soc_component *component)
 {
 	struct hdac_hda_priv *hda_pvt =
 			snd_soc_component_get_drvdata(component);
-	struct snd_soc_dapm_context *dapm =
-			snd_soc_component_get_dapm(component);
 	struct hdac_device *hdev = &hda_pvt->codec->core;
 	struct hda_codec *hcodec = hda_pvt->codec;
 	struct hda_codec_driver *driver = hda_codec_to_driver(hcodec);
@@ -470,7 +468,7 @@ static int hdac_hda_codec_probe(struct snd_soc_component *component)
 	 */
 	pm_runtime_get_noresume(&hdev->dev);
 
-	hcodec->bus->card = dapm->card->snd_card;
+	hcodec->bus->card = component->card->snd_card;
 
 	ret = snd_hda_codec_set_name(hcodec, hcodec->preset->name);
 	if (ret < 0) {
-- 
2.43.0

