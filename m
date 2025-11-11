Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011014.outbound.protection.outlook.com [40.107.74.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0DF81C84A6
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820815; cv=fail; b=p020qX5UYBJBv2uJ2+zKCO8ViCS1EoAqDuHz8uHUdc9Ikm34Qx9DNx5QVCMOq+CFp4Ep9n6YkN/X5keGNtLhi/BpJhZ3DidGZe3q/IzWCuCTWzuGhW/9AO4MLmfeuzsHBA0ALJFIQtuak0CjR1X1dRsh/4wyVZlo9BXy9RE8GIc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820815; c=relaxed/simple;
	bh=cAd+zKPmlL3nOr6RjPehSn9oY4yJrv5Bub6F0rbx6lU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=eKt7bRjoNC6nPUtROOpd0hLudlvdTMu4IgfeN8ip+7TSZF8K4RaCi0qnRs6+lH/bszYxWgGYmUHr9sasu3VUuxQ6Emamr0oCfeECVQiRtUPM0sqbGuopRww6RZaR3UW6qpR3eaCUuN6F6szkhVue8QnogY55moIsl2EP11OLoAY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ldGtDlt4; arc=fail smtp.client-ip=40.107.74.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ldGtDlt4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iiLt7EuG4Mo6dqHCvLVrgM8MAko36i6azPuw66gpu4cskIf3TSDmer1c0UWAHMi3pSxEXW7PPTvjX93vz+SkSAyBUKMF14GLTuF/E4jc3v5JfCUs8nIR8PR5lT6Ywlg6Vl4vx5LEGuD1A1Yht3ip9guN1d6IZJfxA6OB3+qaL2YBrjY6rZ9Lyw0qyjqsDR91FECbB2x32Eap3Tjlp7y8NC9AP3gFVWRSYLtyYfQCBdmgYN0C35raZVYwScQH7BhY5rjbt8jlvJ+DOCebUUcpbheg/AIaWg92QoiDgIRaPeL2ThhE0oNNk4AA1zmqz36wJYLE2ZwhAof2sC6MDgNFVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AfNu14Krf47xcRmRlZjv4GKRo8WS8elZ/hLDpn9cvy4=;
 b=B0FowPkus/17e98MkgtbYWwVsK4m4l7HLtYY+ftnC56fmL+d8/ASG+hQRn6b61IkZhx4KdF+A6G0pYZmz6qUQ/hwhPOKer6DSWqhAX9DvMNe4aBypL2p+yEF5KB6x2ZjCdBphXCm5pk+8lp1gLNDyf4xaK7ROnz6SjzshdxrimoNDW631KNmy6J2IOvJletii7F0hyF2kPIiD5WwvdVgGMO53ipAMDHkDZRijCuLGE+L3WvXpQRTJ3USxAgs6uqcNkpkwAGY/+BolbZiO8519I+S9n1lcrjVTSgtPS46ac0Epk7/la4uBHS8uq3Aoh+184E6CYDLyvTyf4PzAK6ajQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AfNu14Krf47xcRmRlZjv4GKRo8WS8elZ/hLDpn9cvy4=;
 b=ldGtDlt4NL/sy2yoT51SHvSTd8+pL28z1fP/wmP137/lWnqTfzngFwurdehVridOcjws3LwG/05x8TKYVHVlWu9FUJNltGow497YQ6N3fF+7X5t1eI5Gdk5jaI7GSL1GvrtHVKvyd5GuTOmidQj41Pg7g/M1Or+S2sevQX87mlA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB13460.jpnprd01.prod.outlook.com
 (2603:1096:405:1d7::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:26:52 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:26:52 +0000
Message-ID: <87seel1kj8.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 138/292] ASoC: codecs: tlv320adc3xxx: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:26:51 +0000
X-ClientProxiedBy: TYCP301CA0015.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:386::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB13460:EE_
X-MS-Office365-Filtering-Correlation-Id: 03f89eb8-32d9-404e-6445-08de20b9029a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/c5ZptYNjz3UvJ/R95OMXuNyNDPpir9rQvbkDdiD3sk/Ol5cWgDEGdF62O6h?=
 =?us-ascii?Q?I/eHOEUbFTIHADM5MkSB7MZQZlY/DHmtrve4rjwh21RAcgDzSUmh3oSaRcdO?=
 =?us-ascii?Q?JBzZ3/z6dneyomqN1+i1JO2tBPbmQ89y590kueMKRPhhbcFNg/Q7SQWOGUbH?=
 =?us-ascii?Q?bOsXkPCTW830t+EHO1yGbXZ/Gn9qJ8snJT28vImlnyn0t2QNBDxRplU/siy7?=
 =?us-ascii?Q?66padnNBhMgX5mWp6sm3naJqA0oj5e1iLkNOFbEGfe+aq+I8sdtrGKsntG5Q?=
 =?us-ascii?Q?Pkyk/0QbCMaMzJvbmUzKjYF2AF63gR8gGZAzPMQSZOLYtSZ9EuntfjUFXoah?=
 =?us-ascii?Q?H4v0Vv/OVPod9NpYupzcVLF/r2leNooWODUU6G1MF4BVjU+xrN76wtOFP1zR?=
 =?us-ascii?Q?nR8hL1uFhtJBRCb3m6twLa1cbG/ewZHLXs3zknSbQRJtb7f7uqpd0h1xdOtq?=
 =?us-ascii?Q?3ekhnxakLacKTTqgYSUcXZOUchu2mNnkhx6MIZCEIvLehMgLCAs/Gy8yVcwF?=
 =?us-ascii?Q?K2G5yDnJKEPeg62Z9n93h6OxPFKox1KyuMTDRnD/qpGetVWYuNaCi3qnVEPP?=
 =?us-ascii?Q?S+6VBsMf6z6LPpodkBZdlQR03uZ6QTSZLeaZnlxu707dMvacBobEQp9nMq7Q?=
 =?us-ascii?Q?z56oXzHf72kwhY4LcVrelmrWSSWAXDYJXSh+ZKzeGlMeF4YRIVzSmKIans2I?=
 =?us-ascii?Q?LM0OfEEsVY1ligKWJJmo35GSNDKwNxKPhPVMi1fqco2Io8t2Rry+aAnZVTod?=
 =?us-ascii?Q?JOMH2J6H9aXcyiafJ2RJZcrLEvEeRzk8JSYoTJHZl6uLdGKMq88G4022yzwi?=
 =?us-ascii?Q?N2IMYRzsOHqLaoZsidxUpWD2omT+DlHxVgz0Kka8LyHAaubumGMzInriAJe8?=
 =?us-ascii?Q?LE0ILkSeUEnSXtdnapa3g94hkoNw6my+lAhNZqiXWPNyIuYUh6V5RRqBdcxz?=
 =?us-ascii?Q?K/5p7l7rcivboZOynFPdKRmH3goGfDXgc412Xlq7pYxaqi7JzihDsst/DlIG?=
 =?us-ascii?Q?w4fC2A1XiBCw9eicTLDFaRVmwG9Ustic8NpKoXLmw0xUZLdW9ILTw/6VipnI?=
 =?us-ascii?Q?9fu2OOD+9hnXLZ6H+ZF31xnb6C5/D/lt8tn2zhp7BYu98zYavtv3HpmisaTW?=
 =?us-ascii?Q?hQ59eauD/n1SEg6qoUK6YGPVBZn3Xhwwfu16IlHMHSkOGzuCCmRrcuyWlBk9?=
 =?us-ascii?Q?ixY/bjCCOU5PcxNUB9mpQoK2/tHVd6SlHPKcCSjmJOQRYoXWEJ70BTD+sxeb?=
 =?us-ascii?Q?2tMVMI4HF2y/5sPiDmOmJadHeriIU4iywrjyX7HutyAlb2Fq12QdmMmHElFv?=
 =?us-ascii?Q?Wh2Ovm0EwifS8OL7lMyCTx0MhMzd9puLUuosBua+F8eSN1d9kB/PCelDBi+d?=
 =?us-ascii?Q?XGMunSBehToNRwVSSKXeE9IjghFk7sVGBSOFYXo9Spz9loLpbW/S+YqJDqCC?=
 =?us-ascii?Q?mZZMmqk7JteMpaZopVXOXxPlQp5vjw5kSQCR0Jvt7awdiIm38ejHeViSIvv/?=
 =?us-ascii?Q?gpwXeqiUVSksv09+8cEcw+aw5kxXjqxOp/V0?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zaI33zViQeyaE14ec+tkMgehNmJ4Ids5rCr924AVgY/jWys9oSkeugpYrRoy?=
 =?us-ascii?Q?sCv7D6iui8R4of3BOqbL2MHwRlknxZFfO3balvWPlA9Lchd2nDSzvEoXQYKc?=
 =?us-ascii?Q?i5yD7E4G6FCNMuH1eEOE9liFDPlZvU3UN3o6i4M9UmjoeuqP2sG1TC5D040m?=
 =?us-ascii?Q?Zl8Ftoz0hxFnkuTeHWew556vO+B6ZVXt5vwBpcOfLcWEiXeyG8bqUVPe5TJT?=
 =?us-ascii?Q?nCjAhxsaacGxYOs6YtQp7ODprJNCKoDS1VL+8YJn1loMFrseObkhdJaHrQhn?=
 =?us-ascii?Q?WSTr6MEaKCpfSlpMQDyfkGOKg4jtm3HO3VcW+yzIvdrW2TQtUA87B1Xv0LuJ?=
 =?us-ascii?Q?Gdz4OhVOzzQWDkuHmOt2oWsgWd0yPex8ELgrKwkzZ1jr4o+1gQiXyhAva42G?=
 =?us-ascii?Q?SMMgVUDXjD5F3jWKYGXTAL5Ljdlq/ruwkVJ7keIrrSuZVFfA2kKrNQNf0Drm?=
 =?us-ascii?Q?0lPJMtFYynsPQYl1c1JptO9Ydu74Yk19i2/9nIlQoizWmUg3KpyX44xRsQbD?=
 =?us-ascii?Q?qqBW4Y9dH8rY+5eonTdc/L+PV4JoogNSagaPro16gNn94W7YuRNEktc/qIt1?=
 =?us-ascii?Q?bCpu6VYYq/El4nJGjvxd0qKLUOF/9y1QdkyS5N3CBpLWmdlDfH1PKv1f5Z+2?=
 =?us-ascii?Q?Er3AvQiR6WvJkowWlmInzew7t2zAg5zLMBirdtDKo5DpNlrQMJL3PyFykgYT?=
 =?us-ascii?Q?UwrriGRB+RGRNgYuSWc3BAukhsCmbvdWrqi/nL/zm3Zow/GLwCtUKf9jrOrS?=
 =?us-ascii?Q?pJgjBYkCykJO5npXp5vzAA86pLhNciXvAyL/blveimHCnCfnkS4SICExWqry?=
 =?us-ascii?Q?bObbPQM6iha5HBAY6M4KIMv8/jCEeKSOdJhi2iTQ8PIo5U46Zfr7sj3IgHzm?=
 =?us-ascii?Q?st+12lUb0p0FNuusqG1ULGRRdTpaPr1wTVqBQ1dB8SLa66KT6Hr6Mq9pRCKU?=
 =?us-ascii?Q?TnTCXKeptsVNFMfFFclrK4XFPw88h6vXMSv51905viMDskoprTGBlsHJEkJl?=
 =?us-ascii?Q?ma0PLXNj/n1N/Gjzq1iLu1Hw4VGQ96yHB6hgFq370EcoXXicZ+OR99oBHUAz?=
 =?us-ascii?Q?mKwShFa+4ILb4hhUhHXlctteXF0PwVmfbSpV6cd5H7ylQVSaP6gnUwQAEpca?=
 =?us-ascii?Q?IJpcdlRy55B4xvB+xmqCynSJFPytlUyFhD26mKaVIY5rgjpqXJRruR5k406h?=
 =?us-ascii?Q?EVQQnC0hv7fKE+tbSJkGyBS4AfABEeGw4k9UqaJVCvDDYt8fc9CQt2GcHkH+?=
 =?us-ascii?Q?FgeJU+OBWzh19a6ZcnRByGOCo0InHANCFTpN+Bru0Qb48CG+WwZ76rWPe1O5?=
 =?us-ascii?Q?4vekCiMYt342r1blenGmt+8LupGRgg70xCBuE6o+TMP+On7mjzZGk4yKjjQW?=
 =?us-ascii?Q?bfSGRb8HuYqPhu/xGeOgva94dP9kZm5smAi+gyHo0H7V1LsEdQVuG3s3Y1sJ?=
 =?us-ascii?Q?kd5F5F8++C5SVNw282JUg8m3EvdSXNdMDXMX3V+Ss7dpJYQLRZtP3Eb5Vd8u?=
 =?us-ascii?Q?hA+fBC52hpdT438ynugG8s0eyc1TqyoopcZV7Za999ygCwiE0mk82Z6t0FKi?=
 =?us-ascii?Q?feAmjpEB8FePZSZT2RkKDQd/kj3O3crNvHvwas2cwopc5i6Nep9+ZAdp+Wwh?=
 =?us-ascii?Q?GhzwUjiI+DxOj9ACr3FhDjc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03f89eb8-32d9-404e-6445-08de20b9029a
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:26:51.9309
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kH8C2s3qi2RF7b3jQcqawX+lgDuC1sXAVIsGfTMA9V6Luq3n5wZvSKdZrFHEE3ER/htnXwHirFpUx80ZGJzBlv07iJQ6avzf7SGaAT+TAd088UC9/zJft/cMcx/8hKTX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB13460

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
 sound/soc/codecs/tlv320adc3xxx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/tlv320adc3xxx.c b/sound/soc/codecs/tlv320adc3xxx.c
index 02ac0dbd9af6b..270eee1ea5347 100644
--- a/sound/soc/codecs/tlv320adc3xxx.c
+++ b/sound/soc/codecs/tlv320adc3xxx.c
@@ -1193,7 +1193,7 @@ static int adc3xxx_hw_params(struct snd_pcm_substream *substream,
 			     struct snd_soc_dai *dai)
 {
 	struct snd_soc_component *component = dai->component;
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(dai->component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(dai->component);
 	struct adc3xxx *adc3xxx = snd_soc_component_get_drvdata(component);
 	int i, width = 16;
 	u8 iface_len, bdiv;
@@ -1299,7 +1299,7 @@ static int adc3xxx_set_dai_sysclk(struct snd_soc_dai *codec_dai,
 static int adc3xxx_set_dai_fmt(struct snd_soc_dai *codec_dai, unsigned int fmt)
 {
 	struct snd_soc_component *component = codec_dai->component;
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct adc3xxx *adc3xxx = snd_soc_component_get_drvdata(component);
 	u8 clkdir = 0, format = 0;
 	int master = 0;
-- 
2.43.0

