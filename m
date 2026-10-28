Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.229.56
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793156630;
	b=GNQ2qcG0Z7mMyaWyHTaR8YEDtVhhuLD1YWncl2S2sDjklO7FXUNE5acLFOfM9VU0/m9h
	 FCl5otSEtpOT8sRUDfpozSDo6t0Xztvn6OQXjWpnctc79k9nYVH4IvAIc4lsQnabOT7Ry
	 qFbWn/Empeayz9LdtjjoDhzRIJNl6gy+5eXzDxC9kfV5ZxsEiYKjHOvMEuIuHCV1v9fsJ
	 geHkQVCWub2VpPBxik3rtn5jH834TO8FRoC2GZSBi5ywEhphP8SzMajuGF8nxY2tgUIPp
	 +tJx6ZNIf3pkIEO5YodxOW4PJ5cKaFjbjvN7u2cSC632jTZFUYxn86e9QT5zpJY1U+g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793156630;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:From:
	 Subject:User-Agent:To:Cc:In-Reply-To:References:Content-Type:Date:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=s5xPozoNzxLznHC0K1N/1nXFTr3/BDdD5bbNYZ2VVbo=;
	b=q3z5YNleI1T/F03Bsp6nsfficMgUHTeNh/DljTIfDtsSJt03SHKdEKFaiDlZ6lzSB6la
	 HIM6xOjGJ8msdNJ/gFzZhKefM1NJRGmgQJnoNPrmBADKyg+5S688WuH3UeUeLkv9K9P/Q
	 TysBpnbGzdJKUjT0SQuxVB5/eRgzxyOrzWFEWhW23ek3m1kufU/oyuwRkSFLIvhEsPtS+
	 ouoN9r02X+QJ2ksqv/EN7S0zfav8bq6WIVFnpklCfjik6Fo7vbEcK10tglH7cxq0LejdU
	 hzWiLmlSqT4twSX69E/MSlhAKqi8bEyQLOTQOlbKxw1fUcUqAcCwp1MakPnR2dJj0Bg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=KUTZMpMW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.229.56
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010056.outbound.protection.outlook.com [52.101.229.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A931D606A31A
	for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 03:03:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A931D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=KUTZMpMW
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZqfTYxJrs3s4rGTyhVcuTJ4cEhkCzaekGSomiVMat4ONaHiarIqPPaz8DsyVvJb4j2nrmxG2Xpdz0D5QJ7B5iDObyAC2swEwBu/PrmJMX/GuQtaT9cVU7K130JTcHlpxyudX8U6GeWEaZ+FtqnyKIYZKg2Q643AcEX4/i+0hQWJk1pY3YjPXt3JiI3vz5RDlrnPPfy0fXutIWkER53Cd9u6/MPL14K3XZkiJf1ZFOyNyAUGVZ9Xrzphf/3xKOgRBYSOQqa5/GT/rZ+yJ88OBjx/dzdRYlUXu/b0GTY4IZu8iNDET/V6PeX6CEG0bsN07xUcigkFFZrdtSFoq2dzH5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s5xPozoNzxLznHC0K1N/1nXFTr3/BDdD5bbNYZ2VVbo=;
 b=itkZ42al8Q4Ph3nyMDUiSVOYovbNqWMUgdDW4Y1eK1/kubEAq43xQomj5SRZu6LIj4X8tPGRbA+A7f4pj3mr5Qm4a0LfcI3S3Zj+Y/rToxoOPmtIOdD86W7DVNBsT3N9Drakqtgc6tFQKQqkpnrBttDhuoeyZF0M/jgFSZ1ULjNcaHKFizFGvasKNQo4IlSz50ErtCr63cIGfrZxeTJrHc5hhU40587GdSxUJafJWfWGfU3cA39JvJJp9nkyPTkZo+DdLxV9qgDDSxtu7oDj4SS/boFrZEOmjWmeBYrepjeoiMaLqI3kekcZ79H891LEKXiNYvN/Xy5iSrZ75n8CSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s5xPozoNzxLznHC0K1N/1nXFTr3/BDdD5bbNYZ2VVbo=;
 b=KUTZMpMWEtuTQW/zqidj7n/IA6DaJR7vl0yYyEWQmCycqvkS3YHdKRgte/o5yBbG9Wj93YFZBn2eDMl/j9c5BUG99k+o4QDxyYzhZA4AM2dlguMerp1+bAf4+6GhuzddD5qAJSLe3ug8CvYzjYVwt1Vj2yFd+sMjwHIBEmY9DjQ=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com (2603:1096:405:27d::8)
 by TYYPR01MB6650.jpnprd01.prod.outlook.com (2603:1096:400:e3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Wed, 28 Oct
 2026 03:03:47 +0000
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d]) by TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d%3]) with mapi id 15.21.0546.021; Wed, 28 Oct 2026
 03:03:47 +0000
Message-ID: <87v76msezx.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 11/15] ASoC: soc-card: move snd_soc_card_set_dmi_name()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87bj8etuj5.wl-kuninori.morimoto.gx@renesas.com>
References: <87bj8etuj5.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 28 Oct 2026 03:03:47 +0000
X-ClientProxiedBy: TYCP301CA0061.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7d::6) To TYYPR01MB15175.jpnprd01.prod.outlook.com
 (2603:1096:405:27d::8)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB15175:EE_|TYYPR01MB6650:EE_
X-MS-Office365-Filtering-Correlation-Id: 2766eccf-48af-48ae-43ab-08df34a01596
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|52116014|376014|261009223027099003|261021121427099003|261021123027099003|261022105027099003|261022075727099003|56012099006|10067099003|261026140227099003|6133799003|18002099003|22082099003|38350700014|261026121527099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	tZO1mhjgg01AD7k7EsgJrGVn1ONXlhgDxrbLC0k8uUn7sT5Nw8O3jyOr1y1+JtRWGswDHMak1TqZwHIlwITCPi/q954i0Uh90ywpqm83ZwcS+ky6cU++9YU5a6ocXadt0XqSobqzRU36R2Z/PwoUd3W9qbUUnm8+ezawP4xdxU4Am+37sD712eQGSFhwPU+brbNb256tXl1wVwvj/VDP++Vb6MVnWDZANTd848mq8uNINFR2oKo3D0OTxnpFg+rlX2FxMNBNP0/RGohtAafvBYlEdo+0u/olVmLyu7P2zlfIf7nvxlXDzh8gJkSXq5U7/yyOVSVHgZ8hkpa6lWgd3TDEgRb+cZNUWiBIxTGG54AdolKqMMP/A5JhX255d1+Xr8+z7R73W17S+6gQVuTfQpSboSerox4HgJCLT6QM41z2b7g0lEMDXvs3U6tONykaW59pjV2QOIpKLp7FVrFLlqhti0d/Ql4IloVBG8fvOMBxbmXnOXCYqQixup3ZstqW9AN++EoJEFgGj14SwfSgL3nL4zVG75OdywH/o2o42fL5dx7en8/HiQzJ5/yOQK/ZvutbxRyy0uyZZCYHO6JVHgpL1PHZyMsaJ/Tbiu0owSQV0UyF/uo1grkQJ0LUjibkGOyS2gz9kG28fy3a6wZSUTalBAVTIq0DShKAjDgUWEPPgJmbMq5ZwegIXbvu53Urf9FNcIMh6r7EDgGtsmjqetw2YrORXCtRR7yRHGM45H0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB15175.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(52116014)(376014)(261009223027099003)(261021121427099003)(261021123027099003)(261022105027099003)(261022075727099003)(56012099006)(10067099003)(261026140227099003)(6133799003)(18002099003)(22082099003)(38350700014)(261026121527099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TP7XDCkuNXgOK7iWSojDuTihhncxlmiC0j8roONEFM9lMlcLGoCZx1IISTNb?=
 =?us-ascii?Q?j+4DtbCWaJdiq3aWpc4J9v7dcb7FyW4MibjT0NDhbPIqUPxMDGs1qRcitQGe?=
 =?us-ascii?Q?2tbhIS+hWz3vTUWiqYiAO8Xao54Y9/1Lxpr6eb+EtP/IroN2k2QEEHTO3Vr8?=
 =?us-ascii?Q?95xUlj2bjFD7WJaLefqwVSIwVlPHTt0mvOnZ2fF6n2zNBZnZA17VI53v4Z4F?=
 =?us-ascii?Q?w0N80rJy6RChVtg0c4oWtEKTPIvc/mzvZieasM3Qq+EZzp8G9sCt42QBKw0v?=
 =?us-ascii?Q?fIz+7B/K75OI5zumOyaV0bc2/1MhFNqARelthahKLVomCnSu3hC4kG8g3/06?=
 =?us-ascii?Q?9vOFif8vkvivoCoRJNgUbuDNlQsYDC83dcFyZf3CPXv6zwpkZ0/c+uEwuH9s?=
 =?us-ascii?Q?+Z5rSYyMfUW7SV5osLK0xXxf5FO40lHz9ZfzyBpnH+tL0DGn6sIsbeMGTYn/?=
 =?us-ascii?Q?h/ddkhEwehFKOcafbS6KccAp86dYSZIBNEDVIHRTDxnMyRm+ztb8YGNWTNk1?=
 =?us-ascii?Q?gXYFpb3+oWF7g6ZwFSGZgICbF6Bji5FCYEMWbv1JBpNRJ8EN7IQDLMvmLkqa?=
 =?us-ascii?Q?27cTNcZs42S1hE5hN5k0H1ACrjsXK/MU80d7lkhWy8wmXd1ohBaUzW1QW+eF?=
 =?us-ascii?Q?ypyA3xl5089loyDGtzAakUbttN29PUDad2mNwyyjkdjBFuuruRnM6euiaTc0?=
 =?us-ascii?Q?ZBGYCYdz4yRn7NWZxwluL7wHCkWJ71NUe4zha29hevuJ8F1LjjkY2TVniEog?=
 =?us-ascii?Q?S5XFybtJFHxhrq+Kh1HW9m6kuniTuDegyQQS7Sk7w5S4KmkYpw7ii9KDP+Qr?=
 =?us-ascii?Q?RqPscapptBdvMrMwvNN5cBu73EU7FeewMpOQVfn53UE6wvmRWT0Jjrgwe9qb?=
 =?us-ascii?Q?NaPhB8Slp/e5AIgaJ1b5OcXKIFVhHdfD3e7cK8HpmtkzTWMJJXYMuapCRb1n?=
 =?us-ascii?Q?6JzO+ixUbLKFBgQ/r/Dqs+L18NIBVernNcuCm//kFPaAhPl8E8ks2GWr+iB7?=
 =?us-ascii?Q?RCzMLXSk0OagOFG348eI/JTSmKw+gvvwxIQ5jaGhnnDRroy+SP+FIw4FkMKC?=
 =?us-ascii?Q?9IqSiPSw78uIiNXbhnRWyban1EhNxTflZAYRPgSJmP+YO2srd2L7/K/SNYNS?=
 =?us-ascii?Q?oIs02DFKBJc3BFgzQ5Qgy4Gi6CV/xi+EQNe6OXAfQN4cwHqPO6loMTGBrwnA?=
 =?us-ascii?Q?B6AL8kmeEt0BORDrF31kMMDN77L9UcgEp8UM5DNReScCTHyix9T6y9D4vwob?=
 =?us-ascii?Q?rRGD2BT0vojToFn0jqJXSVqkMlnmji0e/lJs3Y1aE9nuxX+ux7g6B3/+fX8b?=
 =?us-ascii?Q?93HSEInSiMrvDk+YwfROZL/Xs/QOxziUPU5dZwjIFEesyQ/X9CogfJ9kXaCd?=
 =?us-ascii?Q?yKR6DvKTr7sB69FWdjThHDHlpXRa+/yxwFMppwEv6RFjnApo7sfXM+uYHiMB?=
 =?us-ascii?Q?jFjiWiKs6Q52MNv4pxJUn0B48M2O/ctFtqQw5qE0pv/c7IyHS6hhemUPrUHs?=
 =?us-ascii?Q?iY+091qnBKnMrd/mM16CESvD4o7xf7SjgCUnnFY6j4tIOK/0alCjBrLhLs4r?=
 =?us-ascii?Q?WpOw4QXVRdczk4ud0NfnVy1w9oKZFKTFx/DEzt4T0vtVC3NSF0rXW+Y1QkEM?=
 =?us-ascii?Q?tHk3P1JllNJdv4XaCMMt1I+LL7wbX2YPVkQ0RefPS4Yj+BjHmTWqqQ5O9ERT?=
 =?us-ascii?Q?/tu4KyxfChiEnbgf0yRs2fUgH1YdhcdyoETDCuQ83za6qlLo35czxwaBOZHd?=
 =?us-ascii?Q?OYlvka0VDAJWgvg86I9+BnRJ1HCq+LudI7yYplF8ak97T7c7QaBx?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2766eccf-48af-48ae-43ab-08df34a01596
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB15175.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 03:03:47.3316
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x/TwyKrDt1A760TE8oClwF8QJEkh/xqhgrcCVnbikDGJ9NpnnER1oD1/x3cijUvwd8wo1RFnCfCgjUAUMJV1fJBY9qlYDtELvDneKVIbUd4amJKUFSZAEjNOffEQabXP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB6650

struct snd_soc_card will be capsuled soon, its member will not be
able to access from non soc-card.c.

It has too many local function dependencies.
This patch uses temporary funciton define at soc-internal.h. It will be
removed all funciton were moved.

It renames function name
-	snd_soc_set_dmi_name()
+	snd_soc_card_set_dmi_name()

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-card.c     | 165 ++++++++++++++++++++++++++++++++++++++
 sound/soc/soc-core.c     | 167 +--------------------------------------
 sound/soc/soc-internal.h |   1 +
 3 files changed, 167 insertions(+), 166 deletions(-)

diff --git a/sound/soc/soc-card.c b/sound/soc/soc-card.c
index 432882471537c..c64c9d425bcf9 100644
--- a/sound/soc/soc-card.c
+++ b/sound/soc/soc-card.c
@@ -7,6 +7,7 @@
 //
 
 #include <linux/debugfs.h>
+#include <linux/dmi.h>
 #include <linux/lockdep.h>
 #include <linux/rwsem.h>
 #include <sound/soc.h>
@@ -300,6 +301,170 @@ void snd_soc_card_aux_remove(struct snd_soc_card *card)
 	}
 }
 
+#ifdef CONFIG_DMI
+/*
+ * If a DMI filed contain strings in this blacklist (e.g.
+ * "Type2 - Board Manufacturer" or "Type1 - TBD by OEM"), it will be taken
+ * as invalid and dropped when setting the card long name from DMI info.
+ */
+static const char * const dmi_blacklist[] = {
+	"To be filled by OEM",
+	"TBD by OEM",
+	"Default String",
+	"Board Manufacturer",
+	"Board Vendor Name",
+	"Board Product Name",
+	NULL,	/* terminator */
+};
+
+/*
+ * Trim special characters, and replace '-' with '_' since '-' is used to
+ * separate different DMI fields in the card long name. Only number and
+ * alphabet characters and a few separator characters are kept.
+ */
+static void cleanup_dmi_name(char *name)
+{
+	int i, j = 0;
+
+	for (i = 0; name[i]; i++) {
+		if (isalnum(name[i]) || (name[i] == '.')
+		    || (name[i] == '_'))
+			name[j++] = name[i];
+		else if (name[i] == '-')
+			name[j++] = '_';
+	}
+
+	name[j] = '\0';
+}
+
+/*
+ * Check if a DMI field is valid, i.e. not containing any string
+ * in the black list and not the empty string.
+ */
+static int is_dmi_valid(const char *field)
+{
+	int i = 0;
+
+	if (!field[0])
+		return 0;
+
+	while (dmi_blacklist[i]) {
+		if (strstr(field, dmi_blacklist[i]))
+			return 0;
+		i++;
+	}
+
+	return 1;
+}
+
+/*
+ * Append a string to dmi_longname with character cleanups.
+ */
+#define DMI_LONGNAME_LEN	80
+static void append_dmi_string(char *dst, const char *str)
+{
+	size_t dst_len = DMI_LONGNAME_LEN;
+	size_t len;
+
+	len = strlen(dst);
+	snprintf(dst + len, dst_len - len, "-%s", str);
+
+	len++;	/* skip the separator "-" */
+	if (len < dst_len)
+		cleanup_dmi_name(dst + len);
+}
+
+/**
+ * snd_soc_card_set_dmi_name() - Register DMI names to card
+ * @card: The card to register DMI names
+ *
+ * An Intel machine driver may be used by many different devices but are
+ * difficult for userspace to differentiate, since machine drivers usually
+ * use their own name as the card short name and leave the card long name
+ * blank. To differentiate such devices and fix bugs due to lack of
+ * device-specific configurations, this function allows DMI info to be used
+ * as the sound card long name, in the format of
+ * "vendor-product-version-board"
+ * (Character '-' is used to separate different DMI fields here).
+ * This will help the user space to load the device-specific Use Case Manager
+ * (UCM) configurations for the card.
+ *
+ * Possible card long names may be:
+ * DellInc.-XPS139343-01-0310JH
+ * ASUSTeKCOMPUTERINC.-T100TA-1.0-T100TA
+ * Circuitco-MinnowboardMaxD0PLATFORM-D0-MinnowBoardMAX
+ *
+ * This function also supports flavoring the card longname to provide
+ * the extra differentiation, like "vendor-product-version-board-flavor".
+ *
+ * We only keep number and alphabet characters and a few separator characters
+ * in the card long name since UCM in the user space uses the card long names
+ * as card configuration directory names and AudoConf cannot support special
+ * characters like SPACE.
+ *
+ * Returns 0 on success, otherwise a negative error code.
+ */
+int snd_soc_card_set_dmi_name(struct snd_soc_card *card)
+{
+	const char *vendor, *product, *board;
+	char *dmi_longname;
+
+	if (card->long_name)
+		return 0; /* long name already set by driver or from DMI */
+
+	if (!dmi_available)
+		return 0;
+
+	/* make up dmi long name as: vendor-product-version-board */
+	vendor = dmi_get_system_info(DMI_BOARD_VENDOR);
+	if (!vendor || !is_dmi_valid(vendor)) {
+		dev_warn(card->dev, "ASoC: no DMI vendor name!\n");
+		return 0;
+	}
+
+	dmi_longname = devm_kzalloc(card->dev, DMI_LONGNAME_LEN, GFP_KERNEL);
+	if (!dmi_longname)
+		return -ENOMEM;
+
+	snprintf(dmi_longname, DMI_LONGNAME_LEN, "%s", vendor);
+	cleanup_dmi_name(dmi_longname);
+
+	product = dmi_get_system_info(DMI_PRODUCT_NAME);
+	if (product && is_dmi_valid(product)) {
+		const char *product_version = dmi_get_system_info(DMI_PRODUCT_VERSION);
+
+		append_dmi_string(dmi_longname, product);
+
+		/*
+		 * some vendors like Lenovo may only put a self-explanatory
+		 * name in the product version field
+		 */
+		if (product_version && is_dmi_valid(product_version))
+			append_dmi_string(dmi_longname, product_version);
+	}
+
+	board = dmi_get_system_info(DMI_BOARD_NAME);
+	if (board && is_dmi_valid(board)) {
+		if (!product || strcasecmp(board, product))
+			append_dmi_string(dmi_longname, board);
+	} else if (!product) {
+		/* fall back to using legacy name */
+		dev_warn(card->dev, "ASoC: no DMI board/product name!\n");
+		return 0;
+	}
+
+	/* set the card long name */
+	card->long_name = dmi_longname;
+
+	return 0;
+}
+#else
+int snd_soc_card_set_dmi_name(struct snd_soc_card *card)
+{
+	return 0;
+}
+#endif /* CONFIG_DMI */
+
 struct snd_kcontrol *snd_soc_card_get_kcontrol(struct snd_soc_card *soc_card,
 					       const char *name)
 {
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 2b47186640a1b..12b8bcb93ceeb 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -30,7 +30,6 @@
 #include <linux/slab.h>
 #include <linux/of.h>
 #include <linux/of_graph.h>
-#include <linux/dmi.h>
 #include <linux/acpi.h>
 #include <linux/string_choices.h>
 #include <sound/core.h>
@@ -1075,170 +1074,6 @@ int snd_soc_runtime_set_dai_fmt(struct snd_soc_pcm_runtime *rtd,
 }
 EXPORT_SYMBOL_GPL(snd_soc_runtime_set_dai_fmt);
 
-#ifdef CONFIG_DMI
-/*
- * If a DMI filed contain strings in this blacklist (e.g.
- * "Type2 - Board Manufacturer" or "Type1 - TBD by OEM"), it will be taken
- * as invalid and dropped when setting the card long name from DMI info.
- */
-static const char * const dmi_blacklist[] = {
-	"To be filled by OEM",
-	"TBD by OEM",
-	"Default String",
-	"Board Manufacturer",
-	"Board Vendor Name",
-	"Board Product Name",
-	NULL,	/* terminator */
-};
-
-/*
- * Trim special characters, and replace '-' with '_' since '-' is used to
- * separate different DMI fields in the card long name. Only number and
- * alphabet characters and a few separator characters are kept.
- */
-static void cleanup_dmi_name(char *name)
-{
-	int i, j = 0;
-
-	for (i = 0; name[i]; i++) {
-		if (isalnum(name[i]) || (name[i] == '.')
-		    || (name[i] == '_'))
-			name[j++] = name[i];
-		else if (name[i] == '-')
-			name[j++] = '_';
-	}
-
-	name[j] = '\0';
-}
-
-/*
- * Check if a DMI field is valid, i.e. not containing any string
- * in the black list and not the empty string.
- */
-static int is_dmi_valid(const char *field)
-{
-	int i = 0;
-
-	if (!field[0])
-		return 0;
-
-	while (dmi_blacklist[i]) {
-		if (strstr(field, dmi_blacklist[i]))
-			return 0;
-		i++;
-	}
-
-	return 1;
-}
-
-/*
- * Append a string to dmi_longname with character cleanups.
- */
-#define DMI_LONGNAME_LEN	80
-static void append_dmi_string(char *dst, const char *str)
-{
-	size_t dst_len = DMI_LONGNAME_LEN;
-	size_t len;
-
-	len = strlen(dst);
-	snprintf(dst + len, dst_len - len, "-%s", str);
-
-	len++;	/* skip the separator "-" */
-	if (len < dst_len)
-		cleanup_dmi_name(dst + len);
-}
-
-/**
- * snd_soc_set_dmi_name() - Register DMI names to card
- * @card: The card to register DMI names
- *
- * An Intel machine driver may be used by many different devices but are
- * difficult for userspace to differentiate, since machine drivers usually
- * use their own name as the card short name and leave the card long name
- * blank. To differentiate such devices and fix bugs due to lack of
- * device-specific configurations, this function allows DMI info to be used
- * as the sound card long name, in the format of
- * "vendor-product-version-board"
- * (Character '-' is used to separate different DMI fields here).
- * This will help the user space to load the device-specific Use Case Manager
- * (UCM) configurations for the card.
- *
- * Possible card long names may be:
- * DellInc.-XPS139343-01-0310JH
- * ASUSTeKCOMPUTERINC.-T100TA-1.0-T100TA
- * Circuitco-MinnowboardMaxD0PLATFORM-D0-MinnowBoardMAX
- *
- * This function also supports flavoring the card longname to provide
- * the extra differentiation, like "vendor-product-version-board-flavor".
- *
- * We only keep number and alphabet characters and a few separator characters
- * in the card long name since UCM in the user space uses the card long names
- * as card configuration directory names and AudoConf cannot support special
- * characters like SPACE.
- *
- * Returns 0 on success, otherwise a negative error code.
- */
-static int snd_soc_set_dmi_name(struct snd_soc_card *card)
-{
-	const char *vendor, *product, *board;
-	char *dmi_longname;
-
-	if (card->long_name)
-		return 0; /* long name already set by driver or from DMI */
-
-	if (!dmi_available)
-		return 0;
-
-	/* make up dmi long name as: vendor-product-version-board */
-	vendor = dmi_get_system_info(DMI_BOARD_VENDOR);
-	if (!vendor || !is_dmi_valid(vendor)) {
-		dev_warn(card->dev, "ASoC: no DMI vendor name!\n");
-		return 0;
-	}
-
-	dmi_longname = devm_kzalloc(card->dev, DMI_LONGNAME_LEN, GFP_KERNEL);
-	if (!dmi_longname)
-		return -ENOMEM;
-
-	snprintf(dmi_longname, DMI_LONGNAME_LEN, "%s", vendor);
-	cleanup_dmi_name(dmi_longname);
-
-	product = dmi_get_system_info(DMI_PRODUCT_NAME);
-	if (product && is_dmi_valid(product)) {
-		const char *product_version = dmi_get_system_info(DMI_PRODUCT_VERSION);
-
-		append_dmi_string(dmi_longname, product);
-
-		/*
-		 * some vendors like Lenovo may only put a self-explanatory
-		 * name in the product version field
-		 */
-		if (product_version && is_dmi_valid(product_version))
-			append_dmi_string(dmi_longname, product_version);
-	}
-
-	board = dmi_get_system_info(DMI_BOARD_NAME);
-	if (board && is_dmi_valid(board)) {
-		if (!product || strcasecmp(board, product))
-			append_dmi_string(dmi_longname, board);
-	} else if (!product) {
-		/* fall back to using legacy name */
-		dev_warn(card->dev, "ASoC: no DMI board/product name!\n");
-		return 0;
-	}
-
-	/* set the card long name */
-	card->long_name = dmi_longname;
-
-	return 0;
-}
-#else
-static inline int snd_soc_set_dmi_name(struct snd_soc_card *card)
-{
-	return 0;
-}
-#endif /* CONFIG_DMI */
-
 static void soc_check_tplg_fes(struct snd_soc_card *card)
 {
 	struct snd_soc_component *component;
@@ -1520,7 +1355,7 @@ static int snd_soc_bind_card(struct snd_soc_card *card)
 		goto probe_end;
 
 	/* try to set some sane longname if DMI is available */
-	snd_soc_set_dmi_name(card);
+	snd_soc_card_set_dmi_name(card);
 
 	soc_setup_card_name(card, card->snd_card->shortname,
 			    card->name, NULL);
diff --git a/sound/soc/soc-internal.h b/sound/soc/soc-internal.h
index ffe055e1b2de2..e1f456e222b63 100644
--- a/sound/soc/soc-internal.h
+++ b/sound/soc/soc-internal.h
@@ -31,6 +31,7 @@ void snd_soc_card_aux_unbind(struct snd_soc_card *card);
 int snd_soc_card_aux_bind(struct snd_soc_card *card);
 int snd_soc_card_aux_probe(struct snd_soc_card *card);
 void snd_soc_card_aux_remove(struct snd_soc_card *card);
+int snd_soc_card_set_dmi_name(struct snd_soc_card *card);
 
 /*
  * In soc-core
-- 
2.53.0

