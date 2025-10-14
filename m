Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010007.outbound.protection.outlook.com [52.101.229.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC0EF309F0D
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760415862; cv=fail; b=mJZmBVQ5PilDrJkYwIgkguUa8HDpk3ipCFoKQnolugjeOzE3d6lTVnKBig567IJ/a6R6tPJq/oPhvZhTYf5WJZFqrOE42kyxfslGd1hgtN0P/KLFQbGIjWERGLcFolhOE1dS4n3NgnZryKt2vHCSWA8l9SmWrcvq4veshl1XmOs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760415862; c=relaxed/simple;
	bh=qYq1opwPW8Z3lMOSA9gpKFw+MftT4aLZXXjTO4aOEhQ=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=KUhwxfpOIduzy740QcqKE1H//CszB4Lx/60944rx0HNxxtvUIc3mIBpG2CRVAdmcyjdqvykKfjhVfLQhcnJMLpbuU1P0g/Iz/YiN2srsY9hMa5JczeOxat277sYqZtUEwKdRqJyEpncJW+5uMUFfHJJC79IJubDUmsr3gwME5Qk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=mVp4iifQ; arc=fail smtp.client-ip=52.101.229.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="mVp4iifQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gzzYHN+sUSVvtT4lnwvzKoUxhPbyZDAOpFuRnVR0RcqICzCbcLbgG4lhlRqPtHkhGidwzf/JE1mjQyjyhDlT9FkrBZN6QKqL4XqIe8KUtDeHSqeAU1E7QzqpCqpYdZCvk6p0kCwKtXANfixvN/B8tt4wUXV/FITSsIobGFgZU+z9gAY1rIunzm/mM8Q+Dq24S7zAuCiyIZLNKVAOF8+0K1DL91HrKe1/2wNvwfVniYMPHp6DtSc0eb17vztzyHXDS4fjbQ0bnwzkx0kU8fsNnG58bSwqq4EAbWNzYXHUHpBMIXEvQp/goXaRnlgtXlHAHQOZhA6Y4t7DCRQb5axfAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R2xiHXvBtTsfZny61beV3pivCKT1EaiYkh/Hyt2kAgw=;
 b=M67jDMfCIUiZMeNuJCd7bF5RxkwWMvo/AYHvxGmbgdS1e92oYu1jESikJWlnJ19/84yfWeRQoDcUqp1XXRHm9WuNeJyxf60lwaWg9P16JmRvSf8QY54A6jIH21fcci/M/1engdb/jRTz2forD4GdXc4uBr9XGPDvl6T7JUmLOTFd/11j3DqdyZtmfVBRANJ43cwUmBzYjGAS0Q/exyFxT5q5dnbTarF9QULkgVim90VWKg5Km+jTr+ZqyfrQ3nqifJGOoFWT73p6Wudu8aDo/0E5oRqDAtmLTSSvAhhoc90pWDNRFay6CB0Hs4Jgn89xDfl17kij7x8p3DxEj4vhbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R2xiHXvBtTsfZny61beV3pivCKT1EaiYkh/Hyt2kAgw=;
 b=mVp4iifQJ5qCk4kJU9OculyTgO7V434rKWXZCmGKvpLVoPC3+xg0SnuRlQhknMJ7Pt1IuJrR5apJBuhIi1rD1uef8xHZAE+CCPjYs2EzZEjzgguJcwJVJ7dNzTIb3Rc3H2pycdKr68qgVx9KARBlWgFPu9YCp3LLiqfPqKpLMN4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB8810.jpnprd01.prod.outlook.com
 (2603:1096:604:17f::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:24:19 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:24:19 +0000
Message-ID: <87sefmp0ul.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 077/139] ASoC: codecs: sta32x: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:24:18 +0000
X-ClientProxiedBy: TYCPR01CA0139.jpnprd01.prod.outlook.com
 (2603:1096:400:2b7::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB8810:EE_
X-MS-Office365-Filtering-Correlation-Id: ac5f2370-f209-436b-e72a-08de0ad98aef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?s+jKcKSMrPwQwyqr2cVXQI9aNa1t+UnYfOSWm9p08ZEmr9QMLcJEW142jSes?=
 =?us-ascii?Q?5LUAWjc5c7LWTyFM98BJSCwoKAjMtWDHM88oa8/nKz1VdhSDIlnMGwT/eRE7?=
 =?us-ascii?Q?9mFno+vPZx3TlKfBbi1EXH8bRpU29SpyuLvy+4yBnJF468Dj9BGRMYWBrkj4?=
 =?us-ascii?Q?f8ZNF9Lf6MxlnWXFkNOrP4NYO6GWGx5CRIkf9/+Yzqv4ajFLaRUPfJbkFbPt?=
 =?us-ascii?Q?wxW3GVpDAluqyizs2qcVxdZvM8yuLKOQMS0N8XXZ/RUYPasiVuJeZoJG3PpP?=
 =?us-ascii?Q?Q131w1yX8EMarSwcjhoBZ02zJPaAulEfoZuj1yjCNZvrwsD8aZF2l5ww+JlC?=
 =?us-ascii?Q?hvZW8ke2A3Tg/c+IHI7sRdJBrd8GWObvwP1BuOPLw5bspUhXVSTCj/lWfWuS?=
 =?us-ascii?Q?/MD8NNCi6mEfeC6YVqJMNffkF+icczpqi3aFP3I+PFudUsm4Tr7K+Vtb3UmS?=
 =?us-ascii?Q?M1MhT8dWRMKhENyeRCO1UschWa2VtvatpB5qSSoJr+9rrIvDbS5wAqnHHT6Z?=
 =?us-ascii?Q?2z+3o4NV7VWX3hoiSuvAtG1mLMMOjhAKa6Il45dHTgJP7wxOs24Eh5BriRSI?=
 =?us-ascii?Q?OZUgTLrjeAerJWAnxhCfyOLTWPOgNhTsdfvO/rWM09N3ZYWHPA2aeXf1DXrs?=
 =?us-ascii?Q?Upd9AIXP73K0Cpn5rtmVsJ9tPmFzn8rLJ24Zw8ztPUVaXe88WjDPkbtkowFZ?=
 =?us-ascii?Q?0uU5I5JRso3sAdtrfiflLAEJ+E31+k4xlxpZztXzc5qZg4QfQFYF5uv4oTmh?=
 =?us-ascii?Q?71X5weVs0eNmkMwZkuPO+oQSCGL+Zdgp0iXTwBSXUDpi6G/+PdXRGoXEKfst?=
 =?us-ascii?Q?ARrlc+72plRB9P01igHYjSkRGBwr41v73CX2AKgX3I00kyNbpysT/VD2b38Q?=
 =?us-ascii?Q?O2w/dihixIr8d1YQqLb4djT1+Vii0HCaglMJvIQOTZCBT/daxQeQHC59f2IG?=
 =?us-ascii?Q?7xsifjjK4V0Fk25rFXzELTimZk8W1SaUTgTFqv89e791AQHoaBv6+Ln5KFU1?=
 =?us-ascii?Q?S/g9UK0EDSICsdDrXLSCcFFSF/EwYdqwyZxZYM+5hPiW6w7gXLRdg6zrPNUd?=
 =?us-ascii?Q?sxvAJZ+RWyBRweKzwRVFSqfN4Y8LnP0eAOBdRgLaOwbVog4FUYM/jchK2qeJ?=
 =?us-ascii?Q?UngLUrTHAs+C1y+cGki6HEnYjHbeHscZzumw8vP1wf9sFJ0wHUggmpKrOL4P?=
 =?us-ascii?Q?1jSB/5MOXNpFa50UqBNnMtl71A+8IWnMbpxorhDEQPkcluXYXfe2LWHawPj1?=
 =?us-ascii?Q?tslLIZ3Vn9J8xHUIUUQHD1CtrP1zhp2sAJljRMtdWv2WlinCmwu++MhR3wgL?=
 =?us-ascii?Q?CEWrwGKCZdPo2c+GLgGay2StLNYBvthwRZ6Fe0Ny3MfqXeZSFDxgV41BZOI8?=
 =?us-ascii?Q?m6KFdfY9Vm4/byZ3mgMqCB9DCrebTD1FDy1MZwm7f2RRx82G72o4pTLItMwx?=
 =?us-ascii?Q?xEgvOIKvTAkYGyeYwdi47n50CqSQwwzPOsKjau1WKNAhCAHkhXGEHrWb7X6j?=
 =?us-ascii?Q?uYL78IFcpexI9opfLa6LNVjC5iUr45B3YZWU?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hjjRvmz+0V+jmFA34lEot3Lr/HOC3Vj55+ICI15ro/8fMMyI9621F+CK9y8i?=
 =?us-ascii?Q?YwTN6qkGAfcViRvYci858FocPWm641p8L+wADBgmay5GybAhCUcwISwemMXE?=
 =?us-ascii?Q?sedCmRBADZsSs67snTJdDJTTzyy2KM55l3YhFD02axPUVDKWbwJy+JzI4OnV?=
 =?us-ascii?Q?/oSSQVaQ7ml48xYdQ+Pw5/4ZOypbxwZi5hLBc2oDxnLKmMwwtWDWu71jlaiF?=
 =?us-ascii?Q?H/9hFtq6PjecW4a6zAZOqnjN+9B67PhgsNsowEbyWd2I1wJJA9qXKQfp8qjO?=
 =?us-ascii?Q?Txesrw0B23+XkJ6c22vI23Hmfi6itf2SSmmgQyfXXJrRwCryGpJNy4IEWUIR?=
 =?us-ascii?Q?i8QAC5scZ5UbEEWSmqd3wKR0mO2ZuUoJJmOv3vs2/WxGELs/oEvnVk07OWt+?=
 =?us-ascii?Q?9BlNeIJ/PEi3+s+t0MKAxc6dzenkFSWgY+k+XM3lS2XDnolDh8zp68uLbfsx?=
 =?us-ascii?Q?UL6IG8624Kwubojrl29HtLnkWDjPRJF2iPJezoc/2B8TzZeNESfHzyJtD0yt?=
 =?us-ascii?Q?BNgUsggDjIEzdEroqvTArFmd7grM192QlPprelOhNxZQgkHMxT4VI8eqhA0x?=
 =?us-ascii?Q?PVZt2JrKJ9we7izEqHf3RbutLRsp4dyrVL7xXOIxenytRTQiLbLYPuqSmpKz?=
 =?us-ascii?Q?irWrPu1aDfY9/7tMnMr4zm9/91aT/XAQx7QGW/Kd/iCrH6Ikq7iVv1CS2O18?=
 =?us-ascii?Q?gmFY0yDRFqDwimSkB9ae6pPyksU6FKFpbUdUPGpR6Ovac2g3RKs0iRpQxJna?=
 =?us-ascii?Q?SrHjqFtRuA/LAhLnXyElntXiAlUgcEdVK1CEY1k7Gs3zmUJRolRRQYHKwFnr?=
 =?us-ascii?Q?lHK+bA0D+gHswIv+F2GsPI6LEAdi5np806BxWgVYXEGgeL6mClanr+LzLLzW?=
 =?us-ascii?Q?Lk6Vl2u767A/3j68TimqwKoJqavoymnLtHLcMgDMH35sJT2CiFjkE9Mr/Vzq?=
 =?us-ascii?Q?E2vpq98rSc2kvX5jDOnw8HZU8G78GBf+eD5J7w/42C8BfyE9KyVOji+vyDIj?=
 =?us-ascii?Q?/uoIUzdePQNQuxve58dCQ4W0nTE5er4in3vb2CE9DClXE1O1fwTmTw0A/t1b?=
 =?us-ascii?Q?S+4dPsW3jjRmpMlwWwIHwoScSE2gLRzOIl27z5jOTTsN4v1v5uflaQwNVqjF?=
 =?us-ascii?Q?9CKakyJNKox29S3YJLWaDi31LHg1HtI2CgPK+MMoj63b+xjvA/tm4DlX+LeC?=
 =?us-ascii?Q?UFb+S571OYBTmYmei/QTfjt+l8bQxR614UuAQMSSC62H/8q8iqn619quzIt6?=
 =?us-ascii?Q?qJ5XGDrbDUx75H0knJKXc7ZzSlU6wCBqsQHwYP4OTcXIitO/nhCZxO/U1SpY?=
 =?us-ascii?Q?KshEQL0T5toxyNRSLBn+DwUbmLJAKstdUhzd3nFJrz/YWOWWB/R6w0iJKn/Q?=
 =?us-ascii?Q?a7E00d6v/mYrb0R7yJzvHO2x6UIxl5PnMLM5EzU0uH0j6o3OP5pem0Fc8u2U?=
 =?us-ascii?Q?vPhoxbtOwPgnD9Fz85ZkRunpK2kcX7wEBClCm7ySM5R9uxCNc1lR229VaoKL?=
 =?us-ascii?Q?lTXWoORecZJDLljZY3k0IuK4/RYpcHWnlmioWqaaTGguyQRrlJP/sM11mbMa?=
 =?us-ascii?Q?U5rO/LE/seYzvVBNDldNBRp5wDolnAoGSehfLUm3iOKi4PK3ihJ+WAQaUsjD?=
 =?us-ascii?Q?lY7UU6nObJig9TAam7jRE7g=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac5f2370-f209-436b-e72a-08de0ad98aef
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:24:18.9442
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XxX/K7dhoo3NDjdFKysXiRTFb7u4FF4aJ3rhspme5AcE0ki1Zwk4JunFdIMceB/OEBTVvVsS/oI+b/wVDgC4chlJurV8jtuQzNlQkI0Gn52hFSNgAU/J65W1JzGxsEGi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8810

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
 sound/soc/codecs/sta32x.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/sta32x.c b/sound/soc/codecs/sta32x.c
index 24d4b643917da..97f55e556fa39 100644
--- a/sound/soc/codecs/sta32x.c
+++ b/sound/soc/codecs/sta32x.c
@@ -264,7 +264,7 @@ static int sta32x_coefficient_info(struct snd_kcontrol *kcontrol,
 static int sta32x_coefficient_get(struct snd_kcontrol *kcontrol,
 				  struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct sta32x_priv *sta32x = snd_soc_component_get_drvdata(component);
 	int numcoef = kcontrol->private_value >> 16;
 	int index = kcontrol->private_value & 0xffff;
@@ -306,7 +306,7 @@ static int sta32x_coefficient_get(struct snd_kcontrol *kcontrol,
 static int sta32x_coefficient_put(struct snd_kcontrol *kcontrol,
 				  struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct sta32x_priv *sta32x = snd_soc_component_get_drvdata(component);
 	int numcoef = kcontrol->private_value >> 16;
 	int index = kcontrol->private_value & 0xffff;
-- 
2.43.0

