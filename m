Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011019.outbound.protection.outlook.com [40.107.74.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADD8D18D65E
	for <linux-sound@vger.kernel.org>; Wed, 12 Feb 2025 02:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739327051; cv=fail; b=CysbNKEpObDZyjSLOvb5WdbeV32xN1V2BWN7gqH9TV+MECcF4ILSlLcKnrbGx6csGWVUEYPvjV5imdHI7zmeQce8n44efYkRokic1XE1SQYh/Bcs19hkfT+IyURU7XWZ+DF8uJDpYxizZbQTBbz61VMj0gdMZyUcxgYmzbz+lKc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739327051; c=relaxed/simple;
	bh=ODo3l85NkBPNhp25qKegHi7g54DZaxDvWwbLL4YXDFE=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Mdv0XqyWDFmugbahzODEvO7ihw+p91Y8rRMZRJdsP4JRk+0Vzle4M/oUm7MQIj5iT9gDnzrBrp84UQ96g6QBvVkrvgLQzKvp3HF1KIXfyQiIj7lpSvwnHEG87RNFQL4dqWeCbGtUe3LW4rBjx46QNvAyBZGz8smaFE5ME8R+EEs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=lcEhJ8vq; arc=fail smtp.client-ip=40.107.74.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="lcEhJ8vq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ruuyi8GN8NMNHfHpVsszatiSxw4Y07brI3UlBrr3TSStwD6xneUIuGV9gSf/3U9Dv+euo6iH8XOpPqvdlJUAnNi88+AxrHynfMom4An7m+2jf5bfw9HyQJtIvgmOJJKGQxaPngHUjD1oGMakYQxhs/UPkqSKHgHBofvCB4GCOK9lFWTW0YXVTXjsmyulypd4O2lBSHZqPOb+aRz1HtdA4zHMEl9FMmAnweHrlvYF6ytcyW0ZnqzQiCqJv950QBYXyxEDBbU5+36gvyQ99u65nWwTCDdIUVYNV/OlTDqidQfntN0+J838Yhz6qj8Wq+1bL8Do8EtcpiN7W9I2A8cWiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FKYDr9b42Da7zKUqEwYXkrx4j10KhFCxpPBYrz8pcXI=;
 b=JuniEom2tZWLPK8nU6bZguDMzQ8OebcchEY1qEXXWWAVUA6+tIniZ4LdWwMNCd9UpteSK/GqbIGcKuKwOTv6plkigrdOuQkC//qbswzNkBO3TjZuENNueaxnfLTzk7EVu5IeijGXZqV0BiZlmVl3Iw8Ptz2z3WB+cES1AXDxbvHPJlLKcH5pcRfSDHYrLB8O/bII+b8xZLx/Mfu9ssjEavjxVj2lVnlLhUVyjrVW/7x1h3AoibrMSAF5wIjB0nBU3wtk/Vg0C1Xo1CaSpRbOusoY9qnC0yaiKtz0dy5/OqJvqIh4cCRUVCmsiFEgvzak7enrXVggEKrLwPbDJE66Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FKYDr9b42Da7zKUqEwYXkrx4j10KhFCxpPBYrz8pcXI=;
 b=lcEhJ8vqzvaQu7urOE8bHcf1N56cD96OLN12h+gG/y6EwhzfJrXIPTf/MQn9FlYISKxSR0GUAYPR/i9QZ7s53vEeMtkFRmdNtk3NvSUoDwqKNjF/ArfVI4ybYR5UNgcUSt7Rk/SAE99GDCtZ+u4JpEuxOIF8FqTeM7uY/dhc+hY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY7PR01MB13706.jpnprd01.prod.outlook.com
 (2603:1096:405:1ed::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.11; Wed, 12 Feb
 2025 02:24:06 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8422.015; Wed, 12 Feb 2025
 02:24:06 +0000
Message-ID: <87tt8zyk6x.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 03/12] ASoC: soc-ops: makes snd_soc_read_signed() void
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87y0ybyk8p.wl-kuninori.morimoto.gx@renesas.com>
References: <87y0ybyk8p.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 12 Feb 2025 02:24:06 +0000
X-ClientProxiedBy: TYCP286CA0326.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::10) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY7PR01MB13706:EE_
X-MS-Office365-Filtering-Correlation-Id: ad75b9f6-5658-40a5-3177-08dd4b0c5364
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wC1CQpKFcx6w9Yfw2zjlYVzywINePuOvZ2ho5vvbegi1AJms1gEjTzmfVTQ8?=
 =?us-ascii?Q?QkH0osP9r+1sYXRvV5hdwJlMpqB5xCjcefSWXy27hjibHLo/BCNia3ddf5sx?=
 =?us-ascii?Q?4hCW9DMigrF8d1eC3yvTqxOiluTuxk/Vvt+fVTkMw2XjUkfOUCiaXuxCfNTj?=
 =?us-ascii?Q?EwJjR1mh0/TwVLroQctZIaHWhSBc/GGFjH85NlczRcy8GPPFgyx19IOmh5hI?=
 =?us-ascii?Q?diJQ9/Pg4eQYQHtYLH+jVCfljHQaH/eAUR0z9S2+KR9ztGbsX+Jpn3xwqWta?=
 =?us-ascii?Q?GaOORl48euMD8Wqd+0szojVFUaaSlEkqgb7UsXyHbnfCkxFhnMwUs+xLn6bk?=
 =?us-ascii?Q?lZ6zGYRqtLSh2o8XHTRcqssdxXRidmHCqVDC8ErDAII3XqjzbPMoNU4X/QqS?=
 =?us-ascii?Q?lmrCLYsWlLTK5pnY7muluL74eabX4xD5iEBJLA+JJ7dC3CfAHdOq7zPyIYuH?=
 =?us-ascii?Q?9Ad3uOW1utnbcgQLFrHCRdp5NfkC+1GReoRfIXO483QgNrbNL+fT8OCqWrRG?=
 =?us-ascii?Q?Q+nsscOTYLWN4WYXO4oiPiYLOU5xx54L1psj6ZwyowSUtMMhIYgIqmx8O4Sk?=
 =?us-ascii?Q?XTJJ/CuUXUWynpoHSo299jt7V9rP83G6TJiqWk6Eo3pXFgsrzUoL14gu01S+?=
 =?us-ascii?Q?2r4meKVUkcIfOYkVaeBMxm9jOQyQSfCmDHkdSK1/0BJMNBLFo7pjevczfXNv?=
 =?us-ascii?Q?HEhVVvjl5bh5sQYtkjMTSBZ9HDePtSW7P9au1LKumtVS5NSTAt1vETxWDoml?=
 =?us-ascii?Q?ycx4n67ctjk88aCF30uxW1yY7rH7mo5MNgopeAmEFuuMVJ02ZV6LEQIs4fXi?=
 =?us-ascii?Q?AXj/FH9jU44JXFEmH5QK9NqRQVG44x7q5pMrd9SvXQRdo8Zvf2lK7Zq8/XQl?=
 =?us-ascii?Q?2Ei87Ulwl1WK83LqsX+owAwSiys8Axk6jNgUOTjHKhjsOJ5B1bGDk1XLO3Mb?=
 =?us-ascii?Q?2crmWt4doTxuImqklHt08LsO9Kzew69Iyfum+IPRuzr9Hgk3MSCvHJfCOl7l?=
 =?us-ascii?Q?ET2tHQ/M5Ce1OFwzJQA7gK6neApbtsFLFYD6VKCa5jUeOTNvPbMov3lbV8Mc?=
 =?us-ascii?Q?idnbfgk2pQGqUufl4XKvZzv5tEjwWVYTLl2nF107n5WBRSO6a4/px0hVTjDQ?=
 =?us-ascii?Q?2Q/BIi/MVwpgstMgAYvJnxfv/jDHX3eTHgPqwCFFRgZcctpst2ZHjEzexcL/?=
 =?us-ascii?Q?EUHLngpJVPSKJkt56LZpbaRBgTdvflOdX6T4izzq1NdZAreGY4l1BpsDONUq?=
 =?us-ascii?Q?1ul0Yj46m2tO1IvL6/9PvuU39IQR7kTmyC87BunjBv4SihrwNYVpjpSOSgsT?=
 =?us-ascii?Q?LknCS2lTvTcZVLDOI2Me3xR4CKXUB6XQlo6hzALiS2jm2XeHsXfQe1OBjQ/s?=
 =?us-ascii?Q?Eh/FmsxD98dT43bBEKMU0IHRJZ7/zmh8yW7CQKZtmolHksNRqbWCV3V35M0U?=
 =?us-ascii?Q?bZHoItvqhP8Cct4RYb/SwSB1CzYrgJi6?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0aGk1Ve5G9oCJUNHdJi2s/JDXUIYPNiwUTRoMeEe5HzCnSVVDUBKk0G2dE90?=
 =?us-ascii?Q?qPbLWKj1Y023DnA6Edbjl2dQ6dnJyUN3aiWZhOPTodkZp62Jel9FTJabJg+a?=
 =?us-ascii?Q?ccxLfp5ZI1VSO/JzqNPIyEqZubyDUwUdLdVC+X7/GFiJRuQBDaceD1lK36Cu?=
 =?us-ascii?Q?zF8AO/O0k4andqNsuXIAVBplkL9mkDAGyH7zE1qpOQ0JNpKN7WI102sIYaI2?=
 =?us-ascii?Q?BvZbC/r/ks4qUbymf+Z6Hp6Tob2TeZwzfsQToqjWRBmAVixGb/r95ITyvKnw?=
 =?us-ascii?Q?mDGDjR5I3mUkgIuW+2Se9GagL161sTMZ2ApFQevcr9Z/qDmh1F2XkpPYe5Mw?=
 =?us-ascii?Q?HyCXk+8FPAanCT/tFG8wrGjdXMckrTzgk1Z3aT3J/yZ2jU2R6HOlvYX6wsn7?=
 =?us-ascii?Q?bF1ZFDRylwauxJz/Es29MwB/ZeU25+dzZMucE4TkjjX3B13Gh71lkvP5Ka2/?=
 =?us-ascii?Q?z40cSFjjxtO10eH2BlOdmBn3/vFpcnf4q9RNLYEzxMllG9IAbTLetsog7+5F?=
 =?us-ascii?Q?RrEJaOl7bUTg1dDGeimbc6wcp4w5bqokhBWjK9Uw5g914hDws9KLIjLtR0I/?=
 =?us-ascii?Q?HlF/zRODoxdpaFEQYsWB6poICrIrkwJttbDb5AjrRz+ioAzzVJC6fx8ZaRIJ?=
 =?us-ascii?Q?MJGNus65OtLKeRsftu/J6EsA9CndNDP6rNXnSBdixgCMtje5SYjhTAI3iO4Z?=
 =?us-ascii?Q?8VAJAv8KKhiTW/Z0QGajj0ai4QTKXA+HRE8T+WOvnP3j6oUo5YzJ5HdrjyyQ?=
 =?us-ascii?Q?SRl2WMVf3EF0xUdZwhoFPjS+Il+vc1c71IGh7Iuk0Uul7qQ8ttTP+PRhS8Yf?=
 =?us-ascii?Q?LH903EoKP7uG0LoskHS4J/doX2aFl//+tnMeuR92/YW/oBKWvZ9il1Q1vpR/?=
 =?us-ascii?Q?rW8xfiz+aEzWFHITg01B/zHPGDQ7I8aNW46l4ZwcNtsvPWDhjcIf1KKDcaAn?=
 =?us-ascii?Q?OVHt1TKfeCILNctp1Rdb/OWvVsiQHoR6LIkXp4LldYm39fvrdTvS8bgtBdsi?=
 =?us-ascii?Q?n6S/HstAPLyygBSTIUrI4tq6LBXJD/4syCuxx/zMtBFwMC0H9+sAd8fPJyey?=
 =?us-ascii?Q?Qa+LnrmcDUI+BxZGJUYkGAh8pjdeAWJQGP8haIbkbDgR9J50holhcNdectI5?=
 =?us-ascii?Q?N3NjkMTPiGZqeeMY2pzY/4qAFDQj3hvVUYwOD3qDEuj865RCq9qLJgVdGMiB?=
 =?us-ascii?Q?b6x95SlqAqsk0YgeaMLcYFvIWrkTor5v2wokK5v/+GReM51+W1CikAI0x6IX?=
 =?us-ascii?Q?PY1Gc9kO9cnvi8q3EanmDiElBybp9QbuEGo5OIJG4/WOF7SVHRH/NL1AH/P0?=
 =?us-ascii?Q?RURA7j4e2goRrbKg9iFnOb9gr/+FYrZh0ikp4AAOpDlJGNiA2rV5/D0lPeIT?=
 =?us-ascii?Q?cw73BDZgDPhzA8pwfAPIe4Mzgga19+2DVCW/oy6HlgMFqEX9WiXBt/AuyVOA?=
 =?us-ascii?Q?llZjOZSKxWZtu3G4/UO1LBJgyDqa/9tPanCvhewWDU5JFLlhQt7fTIcvupNG?=
 =?us-ascii?Q?ElTA/WMVMCLxDmxw1qoe4ZjhZvvJgqGvxvjpaLwAmpULesYhd42JbDoWMupL?=
 =?us-ascii?Q?KeCPGELAyai9ynyMPpFSbLGFE+6xca67JSMMughXvM7bZBB4zyyh9Jd1Mjth?=
 =?us-ascii?Q?FpSlxRTRok+QFH8zImWZw+E=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad75b9f6-5658-40a5-3177-08dd4b0c5364
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2025 02:24:06.8420
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hD87NyuozwfsZ27BwKS2LCGS9YstDpGGU/gNiWwgRjKhQCXdfNq7o9NN+Dr4LhrXoIm9Hkiq+bolVrh7NQVp1Y8Mj4f3GX1ozRJAmEB63yxWvVj91lz23sUaSF6E6NLB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB13706

snd_soc_read_signed() never return error. Let's makes it void.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-ops.c | 23 ++++++-----------------
 1 file changed, 6 insertions(+), 17 deletions(-)

diff --git a/sound/soc/soc-ops.c b/sound/soc/soc-ops.c
index c6601ef16f843..bb1fbffeef9f8 100644
--- a/sound/soc/soc-ops.c
+++ b/sound/soc/soc-ops.c
@@ -122,10 +122,8 @@ EXPORT_SYMBOL_GPL(snd_soc_put_enum_double);
  * This functions reads a codec register. The register value is shifted right
  * by 'shift' bits and masked with the given 'mask'. Afterwards it translates
  * the given registervalue into a signed integer if sign_bit is non-zero.
- *
- * Returns 0 on sucess, otherwise an error value
  */
-static int snd_soc_read_signed(struct snd_soc_component *component,
+static void snd_soc_read_signed(struct snd_soc_component *component,
 	unsigned int reg, unsigned int mask, unsigned int shift,
 	unsigned int sign_bit, int *signed_val)
 {
@@ -137,13 +135,13 @@ static int snd_soc_read_signed(struct snd_soc_component *component,
 
 	if (!sign_bit) {
 		*signed_val = val;
-		return 0;
+		return;
 	}
 
 	/* non-negative number */
 	if (!(val & BIT(sign_bit))) {
 		*signed_val = val;
-		return 0;
+		return;
 	}
 
 	ret = val;
@@ -157,8 +155,6 @@ static int snd_soc_read_signed(struct snd_soc_component *component,
 	ret |= ~((int)(BIT(sign_bit) - 1));
 
 	*signed_val = ret;
-
-	return 0;
 }
 
 /**
@@ -266,14 +262,11 @@ int snd_soc_get_volsw(struct snd_kcontrol *kcontrol,
 	unsigned int mask = (1ULL << fls(max)) - 1;
 	unsigned int invert = mc->invert;
 	int val;
-	int ret;
 
 	if (sign_bit)
 		mask = BIT(sign_bit + 1) - 1;
 
-	ret = snd_soc_read_signed(component, reg, mask, shift, sign_bit, &val);
-	if (ret)
-		return ret;
+	snd_soc_read_signed(component, reg, mask, shift, sign_bit, &val);
 
 	ucontrol->value.integer.value[0] = val - min;
 	if (invert)
@@ -282,13 +275,9 @@ int snd_soc_get_volsw(struct snd_kcontrol *kcontrol,
 
 	if (snd_soc_volsw_is_stereo(mc)) {
 		if (reg == reg2)
-			ret = snd_soc_read_signed(component, reg, mask, rshift,
-				sign_bit, &val);
+			snd_soc_read_signed(component, reg, mask, rshift, sign_bit, &val);
 		else
-			ret = snd_soc_read_signed(component, reg2, mask, shift,
-				sign_bit, &val);
-		if (ret)
-			return ret;
+			snd_soc_read_signed(component, reg2, mask, shift, sign_bit, &val);
 
 		ucontrol->value.integer.value[1] = val - min;
 		if (invert)
-- 
2.43.0

