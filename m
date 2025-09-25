Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011052.outbound.protection.outlook.com [40.107.74.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 053B22DEA99
	for <linux-sound@vger.kernel.org>; Thu, 25 Sep 2025 01:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758765309; cv=fail; b=jPTA/IRf+X5tpt2HBf3FYXavAcIovG3K8MsAgfx61e0aq/ZfP1ME8e0GkdEasLVVJjk0jTeC1gMoG1orMObHl4f7b4+Ll7UMyExwbvgkjvg5U0zeLL6KAbbaiS6pfx8X3+hLRJS3PVxffGTBi0W3aTEuIllrXkCd3HpnvrFc4h0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758765309; c=relaxed/simple;
	bh=sLxFbU0EIQ1nXHHw4m7eHgAIGt0FxtUSkVNiIk6LspA=;
	h=Message-ID:From:To:Cc:In-Reply-To:References:Subject:Content-Type:
	 Date:MIME-Version; b=rNX/+w9sxqpTAbGl0UWKcXOJdPH44bnwdkm7yBl3yJufvt9cTifErfb3tzj4NwWS6cSK+87oRn74yez77Qxmvk4+YVKqspp/OfIUhJhzvDsRqjwKD47PKsaLJDbdlp5Z2jsdacWfrzbZjiusDknfD2e0XCFXYsxGJOLFy6htav0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=OK/sGAqm; arc=fail smtp.client-ip=40.107.74.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="OK/sGAqm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qfgxmcsOetSo52WcNoX9zsflodg08A5cmV3S07UuhRx7Vw9f+o6cnR9QvE0QTSLli/WDPeFWUTeTClWDNWz2qM4ccvmsBoKesnaU5yLEoA5V083K/xKznaeHvPwRZq3p5S89MXCVQQIA5vcoLLyaQO8FNfKDAf/h5WIdTAvAi7McURS2agvh/tX5LPIrIiJWfTyAbPVUvxVjUMR3k9YXOQUwn2QkNJZ9WO3UC5RsPgCHX/vl20VcW0xpkhU2CFnbXml/BBH4EanFaRgjfNghJyou9ccTPF8bslboqXEA4LUCLBsUafNrZiMVTMsLVgJu4uLa6lTjLl3dsrjf/j6+Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g9fV9vfP+6HCm1qQ933uVVoePnyqeJ2SIeu/rYqWOgw=;
 b=y1Fekbp2ZATCFhBjxwzPAw8XH37APbL6ZUgg5iy+7X6FlDtQDG5KEC1suayB1bm7Q1YYVAzMdUU3iDgQwDVvfRsRuaba5eVAgjM+8aH4VMos9rOUJd2eMn588gCQchZ21Xz2V2JJKTWQG9TiKpTZ8I0Wp3PmU1Ypl8yWqe83SDH0rVPzU3UI/jdyK7g8edUL+jyVRAk1dxkRrtb4H0lQWOxtx5zkzNn53sU4pZjhNrWCQZtPdHuxwUoIVkQWfTATNM6YimwtTb0SidqDOWus269dHzJuxYFVc9Z5Fvk8UCf0tTFPGnVf2hkFV41x07btHtBt2hP76MCqp8nN4h+PpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g9fV9vfP+6HCm1qQ933uVVoePnyqeJ2SIeu/rYqWOgw=;
 b=OK/sGAqmrfuhZ86/LIUvUPNJ15UyBAZ6d9IsNs91XrL2/of4afpjvP7tuUOGDgUfKr1R64r4HIcWvjI5uFfHfITGIvNH4SoIRWVGRC+yVh9TmFEnDaCCAEIX1Xjkt6AsyO4QMQjtHSwKhQw/spJiR8eqVEDKmaxHDBVz/4nqts8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB16015.jpnprd01.prod.outlook.com
 (2603:1096:405:2d3::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Thu, 25 Sep
 2025 01:55:03 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9160.008; Thu, 25 Sep 2025
 01:55:03 +0000
Message-ID: <87ldm3z47c.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87ms6jz47x.wl-kuninori.morimoto.gx@renesas.com>
References: <87ms6jz47x.wl-kuninori.morimoto.gx@renesas.com>
Subject: [RFC][PATCH 1/3] ASoC: greybus: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 25 Sep 2025 01:55:03 +0000
X-ClientProxiedBy: TYCP286CA0134.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b6::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB16015:EE_
X-MS-Office365-Filtering-Correlation-Id: 099671e0-06e4-4826-4284-08ddfbd68b67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YavBc9PjvAoE/FsmVCdPD7aTYOhlrtTQh3E0dGlijBJ5qgEIa9NrEWwFPb4F?=
 =?us-ascii?Q?ELF6jj+zLcnR+nqgd+O8GkK//rNhfKCPbPXnXCCmmyEJokMvx+ZK05OuU6bq?=
 =?us-ascii?Q?Z5UIaWNUb1SkgrwYOTgzaNdY5GfGHC6qOt5HMHNWo4X9MD0ODM82OiQ9EO1Y?=
 =?us-ascii?Q?NS483O+zeGJMa4/pUNeOE80cMC3hq0DkDde722LFodUzSK5ujYjvNjau5oup?=
 =?us-ascii?Q?Y30cmY0pS1eGbiKG8BizULrOsLBAyS2TPluN79y+Mv9HBtE+XOp3ydIP7s/S?=
 =?us-ascii?Q?VTwZK9Kol4cw63tvMPYaXD1fvKIfYd53cSm9RMMBk5JS9YQZWgPXeRvMYrk8?=
 =?us-ascii?Q?AEy+x+gSu1k9r6q/MiP8UdgTdbTB9gYXQqNQ7+TgXhmQRHjefjIx7wc7VMRb?=
 =?us-ascii?Q?nJWxOuCHi/35qyyECrUUCHyBA15hMKOvtZLeZAJYIevzLjDo+Zliey1xTgKB?=
 =?us-ascii?Q?1v+1pusT6Nfo7FEyfyDParaVLBDiF4NmcWQeO/A94kR52oco0zH7I86SInNG?=
 =?us-ascii?Q?miCfCnBMczgIT+dYRXXyKrAT3ns3dbRsp7hlQrEBHc1eO6SOMzlqjP2nJAHd?=
 =?us-ascii?Q?PzEk1BmfX5v1iFZpGEn7dbivk7b+rPEkxLOnwXOd2rkWbpEyeeW2gnOcO6g9?=
 =?us-ascii?Q?J0D2VZumMnzOxHbadgkJyzQlpTZnWnLjVeteE+KolXuS2FRSBnwrsYlwSVhK?=
 =?us-ascii?Q?doW9+Lx0lmGCUeOEoA/7wqwB1r1grwsoA5RB3VsRrCQf86GixqIsUOwkxC2Y?=
 =?us-ascii?Q?0qz4WDDBVpuK2eHrnw3aM6AJbeT0/12rwK7iTWhcVf4lHtVhrgUfSwI70d97?=
 =?us-ascii?Q?5qTk2T4y+7+perb08WtOFIVQ8Mq/Ag+YXycLYrGv7+M7lvORF/nAlYyOWGZi?=
 =?us-ascii?Q?N3Q7TJbccVmiTm+8O2fY9as0MRl6eFnCpHWTIsxKTqqtUIiWxdkq+JmRB4Mm?=
 =?us-ascii?Q?IPPk5+tTS9oh7TTmhfkoUvzrJtRFcZvXbreRkiaOzbMBDOH3/hG68VR/cPyy?=
 =?us-ascii?Q?b9HIY8M7eh132WAv2jBTeyoZA71dZLI9yuxOnIW7h/kwtUWdvS/aedFeEN4i?=
 =?us-ascii?Q?9hnbDuoSOCF4eRGl+L3sO82aOJtw6wHYN7XqbPedVUu7s6xDP4/wfEx83+Ay?=
 =?us-ascii?Q?nvHm46mB4hlerD50mnu3lY+8jUu63hgfOcbarncNyhmvd9cTo++8vwb4hnvi?=
 =?us-ascii?Q?VH7sGJhMR2DTa1sZk0AmvRibJsgPuUXaP++LMUc2xIsJWvnt4ozpqb+nTpGG?=
 =?us-ascii?Q?jGmC6BuMRwJpvTh1sMhV+97E22+zJ2HoM0Nr7obZA0Iy1zoPjd6NzEWw6XSq?=
 =?us-ascii?Q?iWvD1Mx9RA86pK+1t9BSJnmF0+hYfoYinH1MVlTABiome7JAJS0SZ4bau2MV?=
 =?us-ascii?Q?kv6gnxTDL6WBfP6cRr3KJC6wqI/WNzf9h498MrSNBLhxx07liVGua/jlNy+a?=
 =?us-ascii?Q?B9N+W2fSjJXR+raPujpkxVi2FIwIPtOfpznRdEpX7qybQCyHCBBJPVIyLPRC?=
 =?us-ascii?Q?7NjCixphHdtA/e0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2x9mmIdUUkAzjSyYdIUuyUVcznLPgx7CuvHYiWJ5AkrfGhlX5RWHGJ7pk/JN?=
 =?us-ascii?Q?5+933Q+mAlrvnYATqTQUJ/Lj6PKzeBfZ0Tf2ud2p37IHEhjmM9dEYToZb2sS?=
 =?us-ascii?Q?5tZK6FjMjH/lDQMnluBXZhZkfIPTtlSxhSBzJoyM14N02CoUal7UvrVKrcq4?=
 =?us-ascii?Q?7WCbMOknkjq3whWK489BNwjWs583DaQUY8KQSXusXUEO2d7OYIaLzuU/KiC5?=
 =?us-ascii?Q?/uFuXvaAMT+4tA2FOvN9WmYJqmy16ctsETozrsC73dcvPrIzzkpUJexdMzPt?=
 =?us-ascii?Q?66mCFM2C5za4lGZjH5biG40yVvacxN9TGFdGFzG0TMp7qIgdVsnAtczEo3l+?=
 =?us-ascii?Q?XHkoVAeEvvFbGDLNK3WXBhS4qFOMVaJATH8MbgSNJepZD/LFGcUp1Sr3bEWd?=
 =?us-ascii?Q?ZwACll5tGr5ry6f+5XbhSGp8JUFEUzYPG/KkJl/ORwc2EdsK++kdhbrOmKhR?=
 =?us-ascii?Q?lsB+rln/7sDySXnKawRcKs/veTwqE0hI0YWV0D2tKvJ3kvYSviEpHXeGvbdr?=
 =?us-ascii?Q?UpsmYluJR4Cifluj/+DeP88GkoO/2F5cI4im4Du+2xHXz4n23NQb7Q0zMSWK?=
 =?us-ascii?Q?vdg8TqTIp6gP4TlTt1dVoA3MIoM4pmen1rccWuckyn2yHX1JUpx1aGOiqSlX?=
 =?us-ascii?Q?q1hOejngJ/eQqliDCtehWJKwkeAGjMOP2a9OGOdDSUwhbtw3uG/8CZabyHmu?=
 =?us-ascii?Q?TohylcgDrfj/T7ouvJFti5TBae2Ao2sDtMS25U44e8UgmzZ3NrenB13FMl7x?=
 =?us-ascii?Q?4tAq8auOMJs0Hccu/83gTJ9wkapeNg3fGz/LFIlTBmicQtoYBGKv9tSHXpER?=
 =?us-ascii?Q?Km6kyOQCoTAuQDHATv3p+ilg3CfwpZFdMR2RCUrzvE09Kvo0KvmOf01ZyAUu?=
 =?us-ascii?Q?p2K4D31eY7zfjJ3Q+csSRPx6VslsEFmOGcXWv7kcG3UKAj7OKjE6LBBDr/4M?=
 =?us-ascii?Q?ia5QW9jfVYaf1mGP+FgczP3Rb3WC0KX+XXIR+l9CW3oXHEq9AM5zLYXamWBo?=
 =?us-ascii?Q?iNKTiSlNrdnXavnz6vW3InVOQodNLaTpJWXf1F3XoMl5VMZKWw+5ol03Jx7W?=
 =?us-ascii?Q?Lusxii8prydk97CH+kj8Ifet6y0VsqHYlXEjlBz+MjxOJcSc/9LzbyEYt3bb?=
 =?us-ascii?Q?g1/UJHyyCyDlQ1QcP+dN9c5zgc6FO1lcb+4O5nTZ4DKTmIyxJUpDVbTdf8Jk?=
 =?us-ascii?Q?73Jc+S37vbIqbKWVOPFq0e3Z9rCcYRaoPrffI9Ds6jph70qGtmj9fjAWQbZl?=
 =?us-ascii?Q?fHZu+x8pEv9jSZhaLSqNvnMA566DkLLAgGJtfGT5ZlaT0g3a4HJFrXkA2ela?=
 =?us-ascii?Q?GcfoauMb7X8R5pvsbFMk5ZCri2mpM3vuuOy61c00S5Eq5ynQwXnuvvGVM/0B?=
 =?us-ascii?Q?eRgIhhAgxnRXKRWCVUV9ERRtaSNAk8xaTN4BtRMmXDAk9MPbyvIFamNRg4eZ?=
 =?us-ascii?Q?eE/JwLZbtR5t2ef0SyzBnAAtw4WkWWKFkY+fJF10ehz2JAIJdYUNAvWoMOml?=
 =?us-ascii?Q?Ob00e/5PrxhXtaRN+6WMPji5d211bBW/3vfxUPCB5+byImNa05bsavYx5VBS?=
 =?us-ascii?Q?I2JPMBDP64gAhzXwR8Hwof6gGkKj5OJkqDPJ+RwBSwXoYScWnMV43cBngRXR?=
 =?us-ascii?Q?gl4ReXwSwZzQVhMBgUsWfeU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 099671e0-06e4-4826-4284-08ddfbd68b67
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2025 01:55:03.8870
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GIfLdmpCcYOP015+0YpULm2m8CW9WbdWmJfxUg4Arwfb/E1H8FxhG1zjV1DHhfFdommiNEVlsBkbKINkarubD9Vh8atBaiNrmLmvRBAtjAQZzWDyBfoHP49tlXnwtFtW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB16015

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
 drivers/staging/greybus/audio_topology.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/greybus/audio_topology.c b/drivers/staging/greybus/audio_topology.c
index 6ca938dca4fd..13b790f81d44 100644
--- a/drivers/staging/greybus/audio_topology.c
+++ b/drivers/staging/greybus/audio_topology.c
@@ -163,7 +163,7 @@ static int gbcodec_mixer_ctl_info(struct snd_kcontrol *kcontrol,
 	struct gbaudio_ctl_pvt *data;
 	struct gb_audio_ctl_elem_info *info;
 	struct gbaudio_module_info *module;
-	struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *comp = snd_kcontrol_chip(kcontrol);
 	struct gbaudio_codec_info *gbcodec = snd_soc_component_get_drvdata(comp);
 
 	dev_dbg(comp->dev, "Entered %s:%s\n", __func__, kcontrol->id.name);
@@ -214,7 +214,7 @@ static int gbcodec_mixer_ctl_get(struct snd_kcontrol *kcontrol,
 	struct gbaudio_ctl_pvt *data;
 	struct gb_audio_ctl_elem_value gbvalue;
 	struct gbaudio_module_info *module;
-	struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *comp = snd_kcontrol_chip(kcontrol);
 	struct gbaudio_codec_info *gb = snd_soc_component_get_drvdata(comp);
 	struct gb_bundle *bundle;
 
@@ -276,7 +276,7 @@ static int gbcodec_mixer_ctl_put(struct snd_kcontrol *kcontrol,
 	struct gbaudio_ctl_pvt *data;
 	struct gb_audio_ctl_elem_value gbvalue;
 	struct gbaudio_module_info *module;
-	struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *comp = snd_kcontrol_chip(kcontrol);
 	struct gbaudio_codec_info *gb = snd_soc_component_get_drvdata(comp);
 	struct gb_bundle *bundle;
 
@@ -543,7 +543,7 @@ static int gbcodec_enum_ctl_get(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
 	int ret, ctl_id;
-	struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *comp = snd_kcontrol_chip(kcontrol);
 	struct gbaudio_codec_info *gb = snd_soc_component_get_drvdata(comp);
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
 	struct gb_audio_ctl_elem_value gbvalue;
@@ -588,7 +588,7 @@ static int gbcodec_enum_ctl_put(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
 	int ret, ctl_id;
-	struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *comp = snd_kcontrol_chip(kcontrol);
 	struct gbaudio_codec_info *gb = snd_soc_component_get_drvdata(comp);
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
 	struct gb_audio_ctl_elem_value gbvalue;
-- 
2.43.0

