Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010013.outbound.protection.outlook.com [52.101.229.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 033F512C544
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820391; cv=fail; b=iLNO1phGEG6JjLeTkQKMbNYwJglJz2odqE5OV4TfWtRPNwG3KSORe1/Afx9z7jZIc7Grr4LNFYNi0CnfUvMIHq7zOxAP7DFpW1qQn6Ckj9fbx2grhITatCYqWQ2/+HaKBbqsYE8wPBDxbiQY032iP/t9+HlAF0shHl4dA4kNfGw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820391; c=relaxed/simple;
	bh=vpK6OzlRBveRPwRaeYpfLA82yEVRlvQHLdcQAJ1SDIw=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=EdhEUAkKsKcSQPgWbxDoSebU4MO6Bs+CqSpa0X5sOHF4TtV08ZbKGGTRu32Wjppbr8AMEIMH7ESUsMWM+LinxEzL/axeCyC+r+tZ6E/CzV7KQ29sZdTxmCV5Vs/zIumD41JDX6YFw1MDzS+nSptpa32TN9pee87w960tpDa3neY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=UmE7hOvC; arc=fail smtp.client-ip=52.101.229.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="UmE7hOvC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JUohRsdjJ0E1cRseaWxRiz1TOpibAN+QPZ1kDCTOFftPwfvFUCjCXAOeQxVWsIRVmdaF5ihvlaxI2vdnKUfskkRtedr6jTkzkP5Jk57jG7eGEriUj+GHoKWWAZ4mmrMMrE115g8dEWmiC1TKMaB21iMj/vMhNu2kHeCw+pyc83YwpaIXuadvK5F/AQjSqvPIZNN4zSowVBFlEsXfqDnqj56Omd1c6hwifkb3DUngSIZbt5/y9ihMokH6O1xtzeFTZ+nLn8r+e0k87wIzFJaQ+WFvwRWLFfUJYmYXKBqNoSzdkftMPVV5EXu5dTfOZO05IZl3OKo2mAd1k27w2CFa0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sc9cAuABGj7Kx0b/tMhLbIanPlBzEdYypnkkRVHU18A=;
 b=ZhhNt+msJlLOOxgdPDkibP32+ovfYqPDYSuEUttxbiEAlWECJOVWXBv2mTFfSrHeMgkSSpY2oDaTcRRCvQfxSrLsCtiakSyuL8pyZa89jUoi/SU/t6XYvBP7HdvSQ3SQ92gnjzfE8FZqQBBC+9nF4eW4xWhWWAPMkqDkFHeG4U+m5Mvhvcs14jF9YuMotmVHfKOI9eJR2RbPnQ2etcfETEsPWae3YAD2cp+50DN8vdTS9quhDIINdKuPLHE8wVUmHdE2xvpoEoZ/RZgZvC5Hjz+jgbxVPjJRpbj6pWXI7Ksng4A/AnExHDz1UaPd4dhqlk5/FU016+oxOFJSXnj/Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sc9cAuABGj7Kx0b/tMhLbIanPlBzEdYypnkkRVHU18A=;
 b=UmE7hOvCGZlu8vD+wCz2g6hed3C3dbVgKJV+FYRjT4DKRyGimmoC4Dnqez4GbWbseimzbxIbr8xLAzzmH0UXkLTug3cryIiKx4lHp6L9v/FuW5hzZOJkzDxoS3hXIEtzH5hpOEnuAPqvneX7uhHE1LzVtkyTu8o76wxOiKucOE4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS7PR01MB14361.jpnprd01.prod.outlook.com
 (2603:1096:604:38b::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:19:47 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:19:47 +0000
Message-ID: <877bvx8lp9.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 028/292] ASoC: codecs: aw88261: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:19:47 +0000
X-ClientProxiedBy: TYCPR01CA0165.jpnprd01.prod.outlook.com
 (2603:1096:400:2b1::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS7PR01MB14361:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f3e987f-04ef-42d5-3d72-08de20b80577
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TB1+Yn0EHfWr/ZQpoVRFRiBG93i42zh/Z0UadH8irIWMOrtck9L/E2rU1Kmj?=
 =?us-ascii?Q?NlFhM96F/MGqsZl8QxhUOD/qe3j9R98h79l/vM1LiiNAbBZVuceJoPND327b?=
 =?us-ascii?Q?SHrC8435+gF/uvl0wR8Z3vUc4lYMXaFo6FBHv7CxhB1x9Sk8J3yDC0c7GIhp?=
 =?us-ascii?Q?GRay57Epf2LqYXZwee8xw1GHTz1r2sx/+I983k96z0KapnwFhF9C+Q1NIo8Z?=
 =?us-ascii?Q?36BS3jagStJ5S3Ylql5A66uSNGYvZkssBMcX7MrlrMd7fMa1FzKXQt9fS8O8?=
 =?us-ascii?Q?Y8hvi8q5BWN66fwaC7uNz7UwoptW5POK5PuM4msAAKRp4AK8f/FuNITiTPC9?=
 =?us-ascii?Q?xLxtQm9F+DCz/IjBkV+FSk78zR9q9wdm5yIjtCZfU1zy3G/GbZ2SgcH5BS/e?=
 =?us-ascii?Q?ndQJDohJntULcqtBqaEYV/zu6+Lsm/FCKpS44dQbzRYwjEUwR0MOEOycK5KG?=
 =?us-ascii?Q?GKCztWeZ8Afr6Eedr8ECl+nDsvV2sZFusxYxmEuM4Fkkk1PCjNgfwwb9k6kN?=
 =?us-ascii?Q?5JjQWE1lJTegMdS6f/N9I2rCNwzrmMhzSaydg6KAX/RioZEaUkwb53vSayni?=
 =?us-ascii?Q?xa063tVlUHzRzxutb0y0BbEWuCMV21TWXe0m0JfbmozE2Rn2lcphzo2r5pHQ?=
 =?us-ascii?Q?pTk/xT9xcQOIoyBP3XlvgBkp3Ehnqo5ItR8YN7oQ98ax89tDxe9oBGtRau0C?=
 =?us-ascii?Q?jpODXXcl3EOC4zi9e6opFQxScbe9oKMa3u6j0z4dcvkWVb57+n0W36ILJp4D?=
 =?us-ascii?Q?5/M4AXDBtIZrjxIHaO7SOWak08fhB9U760a5jZRUpyjdVVydoRf4uFK03Hgc?=
 =?us-ascii?Q?7fmfEhGa27Ex0mvNEzNf0wRcmjlDoDKGsXWGofUadIsosJoh2Rwpfb/+zFex?=
 =?us-ascii?Q?c1ABqoaEHWnj41y1T8zdQtI5ZuiV7J+OWx8zrcQFZJLBD/CYhwdNH+vW9MEt?=
 =?us-ascii?Q?ilEa7OXQcTujvngP7B6TVUyLr2/0zOq83YMdYb1NSHCPs+hI6+1pvSzzWkvJ?=
 =?us-ascii?Q?O2UjbM3DR9whTfTK8xv4ejmiDRk1U40lysujySkkbrcMApKJYNrN+5xuKL25?=
 =?us-ascii?Q?KbNrkefd0ug3m88tm5YQ+EYL2nHWxOQko4Ws5/MV8ovMJfr0ArcP2jl0u3E1?=
 =?us-ascii?Q?yQNWmcszI686cyt3l0tmO0SymCRHvqWA4hBSf18s5e8lILXXbxitVinePBe5?=
 =?us-ascii?Q?EGeGy5NwfE2nZ+3zwYjnMMeNYBT8TM1mptnAFXlZam8jszsAtTNZiDooflUf?=
 =?us-ascii?Q?ptYnGqqniJo1SDChJeJUdHzXl0vJ3Yel/dMiKxnBX38AuOrH74a1RgFPOARu?=
 =?us-ascii?Q?nYiZ7yc8fLzQG6UnOOReZxk744EkMUopoL2BUXfCGJbLoy//xDqG5tdu1X+z?=
 =?us-ascii?Q?fAIUgjOv6PNxPirBSAmWSC6Sriq8GlT45Fgwyhn3E0j0gEc6wPVxdnu50gUx?=
 =?us-ascii?Q?e4tlYIl9lv37nnPSceVU6tlIR1/woPicRFAp5gx9f2plMxlrILRQtb8Zs/GV?=
 =?us-ascii?Q?doDFJK+VGMUwcDA03Bti+lWvxvy2qu2s8euc?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?l0+7Vc2PJOoiGzsMgG4eG0o72gfgsSK6yYS0ck2CH53FPYOq3MJeS8KrVy32?=
 =?us-ascii?Q?S5tIMG1BgFIXplLkflYWXOqfdMeHhvhYGQpTgjw5aEDAoKXphC3ZGmbgWuwm?=
 =?us-ascii?Q?Krgj30luXiO1EgLpWaiP2ATncW7xOwJvJh2OZvRZdovApXEgeAxUPIduOHTb?=
 =?us-ascii?Q?MgoHh7DbxCOBCyhA5t1tR3DQWVX9ulBcmQ4DvKGQonlUXGrAFt+EY0PEVRMe?=
 =?us-ascii?Q?plkcfQaKeO3UqINoojb/8PIspr6Pu+tXLlf5vLlx9moelR1/nAsQms9dTXdg?=
 =?us-ascii?Q?huJi1A+vuSWqVegPYgj6RBwMG2dxMEKSg1a5DNknMVegjSebZCnvjzKtU9q1?=
 =?us-ascii?Q?N+VtnqGJj7mg1MfuuuLPjrhlkwqtBiXpLzj/rENzmGLx7ZNonUTulnwla7cN?=
 =?us-ascii?Q?wXl50Oy0dmmeXPhVPmKuux7AzEka+18AZzMudVuDH3TpKyv2R2OMhiRHAQHQ?=
 =?us-ascii?Q?ZT3Usr6orYXucLrcj84yod0l1HYLC8cpuM/NOkzrr+DBb8uA9s62t6Xsfj/3?=
 =?us-ascii?Q?eCmuWfePjP5VJFGHbeMVsA29nkJFBa4wSYAu30ZLGoPzail/LeXUPdyIhB1p?=
 =?us-ascii?Q?ywVeKxBIm492pxSlE0rTTKEFDJ00cApLnRVfiG9VAhwVg9cWuvbuQqbECoH8?=
 =?us-ascii?Q?GSu0rspm02NOZvTjecxWjT/x185prmfaSMsjlpDynaDQLSCZkJGDQ4vHOSTr?=
 =?us-ascii?Q?ArPvtxbHS1DNAER+BnwoP1dHCt14f22uVwhQckJ7rPqFPACPnVuvgBbFSnUc?=
 =?us-ascii?Q?NYHlWNextI2lqGJ1zdkXcEhCqUUBgIHFQkYho+eBJB2ywN3hxFO5Dng7pe3e?=
 =?us-ascii?Q?Bc1SfbatIq//6bQw0fX51kN1jPD1M9LsQ+mOZxlm/a5EOXQhbLv7f9G99yqo?=
 =?us-ascii?Q?bZWj5D5dUWoPDBsa9VsSdNpijpm2gHpMzGzhZ2/gONACtKKVPs8bRJEBMM+2?=
 =?us-ascii?Q?jqVYZ6WekgV2whUwG3FPBm2zVbZ1uMq1WBuu3fghThTcM57/nkNw9B74wGY/?=
 =?us-ascii?Q?SxLrcWzEDDrdG94JlAPsWrLFaR5Q4B4tNHe/LrZL/wJMp5RWt3xQuX9SpifA?=
 =?us-ascii?Q?EeV3OudP8XjpOeBaYOaBAbxOLhOc7gqon1VLqApJP7bbhL46vwn7z46UXu42?=
 =?us-ascii?Q?KiAG7hWdfO06zo5Y6fxsWLGKmq0h9fUZ3Ft3wiWhb6Iu+vh5dBZFi66P7FEd?=
 =?us-ascii?Q?qcK9FqXVq/W0/OkgrWiVbVmfZuGgR129WhWXU9CVfk7kHNE/jTaLKljrEhmr?=
 =?us-ascii?Q?E7HJkt5VUCKKd0VteFmZ3cHRy+qgOltGRGq6PCwsXZLzwYsjyUWqij88C2gR?=
 =?us-ascii?Q?oGg4nfGa1HTPtzyKvbdlcPbIbcZf75OiKp4S3/EVpFNsfoNFnOo3srlRPriV?=
 =?us-ascii?Q?A325slbDUoT3CuAi3SooAZ2QLfWoeDWbTnL8jbUdEQqS86V7wAk7HnBfMeJf?=
 =?us-ascii?Q?04uBLgoJTIb4aOaUOoctBnvyUZcZtHkNbhteKHp/PHnv7qJkvW2f+yp5gXRi?=
 =?us-ascii?Q?EqOr5hkx724ing/yP0KwqRLgR9kYMBS2cHNsXx6CKQ2I9ejVcSJ4+Q4nKzVP?=
 =?us-ascii?Q?flr9g0hN4AT4SUqP4wUfK/ter/TerC5ghcEkG9V5ndIJVT4vC6ZctGXTMkZd?=
 =?us-ascii?Q?wSTNQsPVwV157TZrTfjiE8w=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f3e987f-04ef-42d5-3d72-08de20b80577
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:19:47.2239
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NP8iKU3HkeUGIfgwGfx03Eq5bB3ZBPVGzboL9lG7j4K5wlK+EzyvjxWY16pROqP8QV0HEAWxjYjyF1xtrdBWbxtB3TyaQ+w00tMsiaqQA+uVgRc8OTMY8p92AkTW5YB6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB14361

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
 sound/soc/codecs/aw88261.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/aw88261.c b/sound/soc/codecs/aw88261.c
index 8600b21ea618c..8f37bfb974ae4 100644
--- a/sound/soc/codecs/aw88261.c
+++ b/sound/soc/codecs/aw88261.c
@@ -1131,7 +1131,7 @@ static int aw88261_request_firmware_file(struct aw88261 *aw88261)
 
 static int aw88261_codec_probe(struct snd_soc_component *component)
 {
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct aw88261 *aw88261 = snd_soc_component_get_drvdata(component);
 	int ret;
 
-- 
2.43.0

