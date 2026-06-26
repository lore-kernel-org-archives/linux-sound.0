Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010025.outbound.protection.outlook.com [52.101.228.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B03E3D7D9B
	for <linux-sound@vger.kernel.org>; Fri, 26 Jun 2026 06:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782455335; cv=fail; b=noJaGuaLPpiiwcCRhMkB7Zj1VTmfhJtg7Xct3znPMQPr6bOSefmj9N7/INoNxOBfpCZ8BP3LTGAsJgEnAsOAxpcCLq2Qx+LSW5HXv+pPp5ZTWPoBUqolX94albpij/s7gPyw4waz26ColGcbK5WRm8RB98htqRI4ExlgP62Ug8U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782455335; c=relaxed/simple;
	bh=rW1jMxUxEnfPpA0RXbAH769AbygrWGy5i2q8Mi9jIk0=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=IddoAJNUDx7JZUJiainAV8+merHi83Ff3TvZ4rIv2/Iv//dTYtkCxZWscXvPxXk1llUxmwTe0xRRcPWprRSuJ/YEg79wb43FRnmvh/SbcDJBpKCCrwt/FFHmTBNCnZS9gimF2PghXcPeeTqxHHLQMKH5VHWmW+YdVFYdfvsaZG0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=kp7BQRc/; arc=fail smtp.client-ip=52.101.228.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="kp7BQRc/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hUH+IMbdLpBSOSdCgZ24u4k4qmb1ZsTRGlXYvWGEP2NQ5Ep7KeLknpFwHFNAC+1NMeYrEDkuwvA7DeID5XUTm+r/EN5+fX2Xh66AGVbbr4vZ/tlDRkphtNpxapUoEidu/q14vrVS3MbNjTMjSqU1aTJ3oMeUft50eeXBpSegUJv37T56HxXs5dJzx84KflcE6gSwM+KAMPu51O7x26nE13quAVx9BJZdAwkfHbTZBjOG8vjpHZL13x2/1Vgc94mFRngbbiYylSskYV3lhK6UI4VAdsgey7pPRfxhU4Oi9Mh3k7GG0fkNe5Xaanm1FWC7ST3aXCKnECjLgoGp7BepqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x9rwUe66RLpThc8RDmg1pT/6xJGq+rgZ7RX8jHtaJb4=;
 b=JRomkg94HfbXY7vli0dClm3i05WCllelK8QPbBYegTlY22HuUke5AVcIQSfz6AjyTm18xDLLVSxBjEHXMf20GLlw5iPn3KsAQPsEXRTwOqu8oTS04/F4N+BuPsND0jhTQFT6NvKI2d2zLCWviD1z9x1OdrE5NfeecGJ69VNzxWE0cqYr5UaW8yz62DoNDlzvvqCVviVk+ccESSKSrH1dFBGchteJceo1/tgZDB7mJrB3OGbnoEJpHMST+ttXSpyQP286Vf43t56SylVcCNQE133DF4OMO6NP6woeUUXjlzuFF9+vYgCUTxnv20uPCb2+n3VEDaZaQ4sFwaF4GOV9Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x9rwUe66RLpThc8RDmg1pT/6xJGq+rgZ7RX8jHtaJb4=;
 b=kp7BQRc/SbtDBkp8fRNIw6CenZfLEoapRpc1kR0saiwvJAa5PZe3LGD54ArBZ1b63oK5GwgO99DPg9kmctdcngZY/Y0d8rsMCKKZV8nBsTEFGpBonkNT8utf0bLo7q8rl4d5XRSzms74WN+wRIgIpSD9YlxUt3C3nhyl847bG7Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OS9PR01MB15751.jpnprd01.prod.outlook.com (2603:1096:604:3bd::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.16; Fri, 26 Jun
 2026 06:28:52 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0159.015; Fri, 26 Jun 2026
 06:28:52 +0000
Message-ID: <87qzltddd2.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 11/12] ASoC: simple-card-utils: tidyup simple_util_init_aux_jacks()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <877bnlerz1.wl-kuninori.morimoto.gx@renesas.com>
References: <877bnlerz1.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 26 Jun 2026 06:28:49 +0000
X-ClientProxiedBy: DU7P195CA0028.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:10:54d::28) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OS9PR01MB15751:EE_
X-MS-Office365-Filtering-Correlation-Id: 8df4428a-e769-4c14-ef6d-08ded34c3079
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|23010399003|38350700014|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	x2gCQCAT67tCUKroC4kaQ+CLFORzkYeOCV5QguJSzTQ0V6GSDYl0ZsVqx9IHxl86wlk62QvLT6Yxal85g8Z7YXQFQWW2eTEIAueI+O0iB8leFdEMdzVh61i2rLFT9kk1X3rzuuz/Yb1uYNjRIsG6Nmln63gzA+nFF2AvmJSVS5EeOHGA36C/4yZtS80Gtx+SCSetkx+3i9VX+lAgPWUtadd4LO848iSavcDiMJmkD4WwS84qMQ1vwFtx+MUraq4k9j+7bF4Clx/loJBM+bVWgNp/qxBmi8AiMcbdoZ0Q+cedZhY1KARA6p9nTHyhvka7+A+kUu/9huYqpxjh0t2JC4Y9a3h+LsegxZaPBi4Jyqeh5boPyESr0QeldGFSdcH/oAulEWceRvOmfKxB31kWRCZezNtGK3WwzI05yMmN9RoULL83eRPuE7p4Rm5w+UvYIAp5VtHhheutSYgIBj/6I2KnjvKSKlFWLh+uThX28Z8MGvcXDV2VIHAvXY5MREcp/+lLRccpjjuELj4hnwDbxi7b+uigs9A/NFsBHaPInUI+lEgBTGdQe9tgpi/6HOTIpCDFvELeYCf7vHYfkEfkeBj0szTS7aokeK4bcpdpw+44QV8nVvCm831Aw4oRhnUdOvmOQTFPjeKhD1Gihm8bCs1VIAN6yt25q/w7vxtWsdxh9U9fpXwPXBnfIf+Ez2tJ/Dev8sZ2GGN+BHZrUeOcU0WcpV7HxU3BXO2kWPGtcCs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(23010399003)(38350700014)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sql0owzWK8/jeOC8W6FP7w0AnekhN/88nXLHTMUw0hzEj0jXHISAL8hy/qxN?=
 =?us-ascii?Q?ejNiYVTuD1HdnfSS8VWcnThztE1dqX7kOqfFWoQzMIJA2TW9G2TpN7fDgCxV?=
 =?us-ascii?Q?m61NpQ0sLzs2ltyDw6um2XQnQ/jbb/zyu4T/e5iLkI21GEtLlyfrs3IDi7tB?=
 =?us-ascii?Q?Xa5H6OXYOaHp4p6mCRBOpy5wo6l3V8DyYJ+dR9cMYdl4vx+s53pd4VwVwJsk?=
 =?us-ascii?Q?+fskzr6IKMqpM4pwyPwoocU5KdsG+8zs2eWpowhGedsg0Fx/IroC0eE+mN+B?=
 =?us-ascii?Q?WJgbBSk9NjBfdT96iVGDTLVK9NoFDcEYDIIWM4FT3lf37dmxvppNMwHwlNpm?=
 =?us-ascii?Q?mOh4N/KMK7ddeQwuiGQcqSy/CVLOY5e7ICXFLb1nWutE7B2rQwo03KiVxAxS?=
 =?us-ascii?Q?y4cSefOoQPkrWtzACUHuGOfow1RAOoYSBfMWflsXPXMTtt8LEiFN7bUu1vkh?=
 =?us-ascii?Q?uGThoGMDiaqv0Hy9+Dg+lWpSWuw1Pb2P8OdTLU2pIyYHENOT+EKGetju6bke?=
 =?us-ascii?Q?IoW7/kfuqpHzhu6256u09CIvg9CT5eDSUs4iSAH4S59e58pdkqXpAryxu8ki?=
 =?us-ascii?Q?WMuvXLboMjAuDJw6rTomaptgsUx/P7Nz+MZKoFY0xVixnZYXArFgQeb4+2bj?=
 =?us-ascii?Q?nIo/vNoBAxv90WehNAoGkqHvhqg8Vc9F0OXUIyh+JGkwXvk+QhOeRgo0QEbW?=
 =?us-ascii?Q?q+UBek2ABUYfdo6Ra2vCH9rMrsIZjELUEKY4lVvAkFz25HGHSVHduy31OSB5?=
 =?us-ascii?Q?g7snUW0vP6vBJvtt7uP/y/xeDvKRaSp5nhlGZUEsbsjMRhMY0wVtbNvpzfMR?=
 =?us-ascii?Q?nVHrGcKpAyN4ovOEAH/lXsx/fVAm7hBvNbnZL+hwGLvh3kP1a4qyyOGqQ7fL?=
 =?us-ascii?Q?5jxZwedIlNb7JKrrSN7T4ufWSriXNmdgn5iYLoiMXYO1m+fnvQ5gdgc25yy2?=
 =?us-ascii?Q?Zrm14/08KoDxZTGgWdWz/qV6YBFviLvXXsxAgOMyDDpVFAAUkVJO0ZPly+VL?=
 =?us-ascii?Q?hkgHPx6FS1tSA/dMhaoJRUanjF3dXPL5rh1ffQ5LbBhWAGhRV0Ori/+5bVzK?=
 =?us-ascii?Q?TzjFfw3HWeQnXW40i8JAR8bwzfkdieFvHLaL0DnnWkmPx0lc9/5FafBuP2AN?=
 =?us-ascii?Q?goL+odLC3VSKpDcMvU0hyElkQ4ppMppbyqQm59jTpGEFNSlqaNjtzmR5rbLo?=
 =?us-ascii?Q?KtMNdqkbYcS4KIRxYOtkxDbgyuid7mP50QobjR5LGcx/dFI563zZmilSfxZq?=
 =?us-ascii?Q?MKp+csPoDc02HWWSvI3l4l/udk0kyXPmQgXvhHX20eu0r/zm7tHv/WaunLJ8?=
 =?us-ascii?Q?thUYk4M49GeaS2nDoEPYwrjL9Mg7YmiSmyXFiBPxi7CkVpIMNsBGOv+UWzx9?=
 =?us-ascii?Q?RkC9bUVsX/Idtn0As/xHR4JC2Si7k7kmUcUu1HDv6zYrmk0JJLfT998c6j0p?=
 =?us-ascii?Q?ATNVcNPPUNh98OJV6llCe1RBlqxk49lCgA758Ri8VNF+G42GOr5Usy1gpMrM?=
 =?us-ascii?Q?acFHI2ci+2ul8+uf0/M04gDu++SynPVSoa85sy2mlrCrHd+oJqFwb7KpJP7N?=
 =?us-ascii?Q?uJi3eDRQ+mhL/6NvW/SJW3lnsWFn0SRYMw+TtsAOio7VwPblq3wwjDAyKcQG?=
 =?us-ascii?Q?PEWehg0DnrSHI4ZbPw1cEOLmGJDK97ZJ0hemoAePC6lyV94trYb30zCLdnKW?=
 =?us-ascii?Q?tEjvaTK3EnnZq3J82k/ugN4inznrfh1zuFcbAD0UnZOdilHzKAqi/y25tZYZ?=
 =?us-ascii?Q?19YQ5fLbu7f6MdJK7QX6Rz2Lrsvi9OKwv7hvFr4B0sf2nf5hExRL?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8df4428a-e769-4c14-ef6d-08ded34c3079
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 06:28:52.1012
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8lR0ypbKfh105A40y9MTPUK3ivmpnfye0i5gUWrfwjg0ijc6bbQEOiVqWd0uideIa7rwKW7UyLDlMc97QkL/y9HRRSekIdvvgZ0KM5bC0nxvRMXj7seTdHbh574wM4cO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB15751

Current code makes old style / new style conversion difficult.
To make future conversions easier to understand, this patch clean up the
code a little. but no functional change.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/simple_card_utils.h     | 3 +--
 sound/soc/generic/simple-card-utils.c | 4 ++--
 sound/soc/generic/simple-card.c       | 2 +-
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/include/sound/simple_card_utils.h b/include/sound/simple_card_utils.h
index ff9747c6aa49c..5e2e91578bf54 100644
--- a/include/sound/simple_card_utils.h
+++ b/include/sound/simple_card_utils.h
@@ -219,8 +219,7 @@ static inline int simple_util_parse_aux_devs(struct simple_util_priv *priv, char
 int simple_util_init_jack(struct snd_soc_card *card,
 			       struct simple_util_jack *sjack,
 			       int is_hp, char *prefix, char *pin);
-int simple_util_init_aux_jacks(struct simple_util_priv *priv,
-				char *prefix);
+int simple_util_init_aux_jacks(struct snd_soc_card *card, char *prefix);
 int simple_util_init_priv(struct simple_util_priv *priv,
 			       struct link_info *li);
 void simple_util_remove(struct platform_device *pdev);
diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index 4630a9b87d810..00f25fd0d3d5f 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -820,9 +820,9 @@ int simple_util_init_jack(struct snd_soc_card *card,
 }
 EXPORT_SYMBOL_GPL(simple_util_init_jack);
 
-int simple_util_init_aux_jacks(struct simple_util_priv *priv, char *prefix)
+int simple_util_init_aux_jacks(struct snd_soc_card *card, char *prefix)
 {
-	struct snd_soc_card *card = simple_priv_to_card(priv);
+	struct simple_util_priv *priv = snd_soc_card_get_drvdata(card);
 	struct snd_soc_component *component;
 	int found_jack_index = 0;
 	int type = 0;
diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
index a67f4aad01883..49289cd655ea2 100644
--- a/sound/soc/generic/simple-card.c
+++ b/sound/soc/generic/simple-card.c
@@ -661,7 +661,7 @@ static int simple_soc_probe(struct snd_soc_card *card)
 	if (ret < 0)
 		goto end;
 
-	ret = simple_util_init_aux_jacks(priv, PREFIX);
+	ret = simple_util_init_aux_jacks(card, PREFIX);
 end:
 	return simple_ret(priv, ret);
 }
-- 
2.53.0

