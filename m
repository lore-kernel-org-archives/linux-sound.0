Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.42.115
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795770446;
	b=3YTav/fLJUpGf2AmWeXjyPB3GyIrWSPToqLhke4PX0lW6tZa3PvDiVpsQ1LcTLSFi4FA
	 G6ZxKduiEEgoinDEsTzme7ivULOIRZECC6L+p2ehC0ORiy8XQBNtW14145IiHRqvArud2
	 9jjboVxknG3+JqIGyAWGwa9arAIKCSqypazLhtepU1neV0Wnojq5lEzNf81hQTRWJiw6J
	 86/i3zzDLWZD3s9iZLCbzp3zavxnz+4vAqQzTPALrY197tlZZzPKcuT+/u4F4yG3img9J
	 l9pCQGQybijCghSbfo4xurqvWX96OiTEx80TzFk6aIgc3cMhtGolhjfFb0HqQRUWVPA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795770446;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:Content-Transfer-Encoding:
	 Content-Type:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
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
	bh=INpQYJwwQObj8C4WQ/8Es9gJcHslnltp3BKQUijTuNs=;
	b=qwoAmJCswGcjpByn5bGesiO+lSWZs5nZDDCJpknZN681zwJ884pcHAY1SL1jKUlLgLsM
	 kxFPFbtC1E9hupOs59lOwHpXQDfmtGWJa73tvNhYeNaKT0ioe+xaCrHPLS8Ri1e8Qe7UP
	 alUNP0jwO3Gpa/kBZD4PAl5eUJFSj2quw7wUd9CsBrvh4WOqFUXJFXf8Vn74VVOAHH2LT
	 vu59TdokDPpCSey6bZvn1RCn+1ykMD5zzftuTvlBN9K/a3+3lEnHzfn/XDo2ell9t+10G
	 QL+NrgiRJgJqAFvUVdJWTOE/9ld6qLKEVx2fiBdIgIe6GhqABlZze8e9t0tGs6knhxQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=irondevice.com;
	spf=pass smtp.mailfrom=irondevice.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.42.115
Received: from SE2P216CU007.outbound.protection.outlook.com (mail-koreacentralazon11021115.outbound.protection.outlook.com [40.107.42.115])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17551606A321;
	Fri, 27 Nov 2026 09:07:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17551606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=irondevice.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=irondevice.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aplDZaro2GX6fyx4cWtJFtihHKqu0fQCNXdTqU0efeMA7FmZV+UF581WSKZGbtKTx6/oRVWHFlucJc+rkMwt/S/SAOe7r1RuynccCq5zCnpSzqF+uPZFY3kGM0RsVtELaUvX1QZK7zoS07RFwn/7FYRB95vWNiZRCo1pWLRdAwOqVMODP4SCRAqBqlYDfO7dbJ2KZLrhrXnTDyqB9YDBmJpBELaX+rng0UofdmldtVoVaDNTDLZkkfYTBVmHS+ngBpdghwGYvScUvAQvgWGCBr8+8BadjrCCIOL02y0Z+aRkTkow/XMUTg7anS5PTsnG1mygooeWk1pplFhawgmcLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=INpQYJwwQObj8C4WQ/8Es9gJcHslnltp3BKQUijTuNs=;
 b=OP8AiGP99KvwUld7r+QtLXvFg4rPnfLfWA6JbJK/8Lt1EWjKnLUYWpwDm/QG+2H98ZzQZWBuYQLLS85PCwuhsbJZmBx1MrC15SQSkCOGH5BT05YaQ2SDPaEUfnl99WFIFIaJ6yyLkWykKSZRpEfIcUwq02Y/K6PdxXRGo+RNWi5omC9Rxlk7agzcGt9zxvIQRjWmDebtq9AyzfztEBud4G0sPQypdSf7BDIy9VKS/yc6z2TfyrIelnE6PiAhfbtaOU3DmyXffUfGHQEFTIRCkPiivZLx062al+hmz0+KNv+gGCtdRqf3O8XYgK5vHOCRMm2J3zqsk2ayvYGuBio9FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=irondevice.com; dmarc=pass action=none
 header.from=irondevice.com; dkim=pass header.d=irondevice.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=irondevice.com;
Received: from SE2P216MB2423.KORP216.PROD.OUTLOOK.COM (2603:1096:101:1c6::14)
 by SE5P216MB3160.KORP216.PROD.OUTLOOK.COM (2603:1096:101:2fc::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.9; Fri, 27 Nov
 2026 09:07:23 +0000
Received: from SE2P216MB2423.KORP216.PROD.OUTLOOK.COM
 ([fe80::98a8:f50c:a9f8:3073]) by SE2P216MB2423.KORP216.PROD.OUTLOOK.COM
 ([fe80::98a8:f50c:a9f8:3073%5]) with mapi id 15.21.0662.007; Fri, 27 Nov 2026
 09:07:23 +0000
From: Hyunuk Son <hyunuk.son@irondevice.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com,
	kiseok.jo@irondevice.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	krzysztof.kozlowski@oss.qualcomm.com,
	conor+dt@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hyunuk Son <hyunuk.son@irondevice.com>
Subject: [PATCH v3 2/2] ASoC: codecs: Add driver for Iron Device MA5311
Date: Fri, 27 Nov 2026 18:07:07 +0900
Message-ID: <20261127090707.389362-3-hyunuk.son@irondevice.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261127090707.389362-1-hyunuk.son@irondevice.com>
References: <20261127090707.389362-1-hyunuk.son@irondevice.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0092.KORP216.PROD.OUTLOOK.COM (2603:1096:101:3::7)
 To SE2P216MB2423.KORP216.PROD.OUTLOOK.COM (2603:1096:101:1c6::14)
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
X-MS-TrafficTypeDiagnostic: SE2P216MB2423:EE_|SE5P216MB3160:EE_
X-MS-Office365-Filtering-Correlation-Id: 46958f27-43da-44da-930a-08df4c65d8fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|7416014|376014|23010399003|366016|6133799003|261009221727099003|261009220027099003|261009223327099003|261009223027099003|261009221227099003|18002099003|22082099003|3023799007|20052099010|10067099003|56012099006|261028144727099003|261102123227099003|261022075727099003|261026140227099003|261022105027099003|261022113327099003|261021121427099003|261021123027099003|261026121527099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	FmY606Cnlibe3oQFRLD14zOIaRXKrrGUawQbgt/u6rY/QWxAuLtL2BrQNQbXsRvUXU/5NlmZmrBRYXfHQLQboadQzTjPhxtWjo04IcLLpjqkzzoywIFXTK3N1zW7fRRq5ZSLbp8dTYKYHB1MbKjXVtGW41Xoz3eAqq5jjAqdjxzwUQL1CrpqhyMX4r010zVVLFjdPSyNFsS8T+bzNYmMpvRzz+NpBReQK6cb5ykc1NkCEft5gc/X7PutLWerSk9Utmaxh0h5jTtmZAsdr7YHB4lThlNQCISVPYVIuZcj+fZppk0c9tes4HbY9XY+9dU1GJluyFpEIEww+EhkHlPIxodMQXhfK4+E+QJmYPocuDhToPEJrrwvVCATdLp6jG1iV2d4v+KG3W7SK7C6t50g+iy2zoHL7Jrb5yDJbyiT8Qd5BA9zoLBn5VCofYYKLEaMDo9ATBCSMY037TPJIt93KA1IwNyBoSd4sfY58Db0vZz/diN5f1NqMtq5DNhuhtYI5m2T0wNCU8iPFkFomcgPIjtEw6QngXqSsmiJLvBxbTGqbTjwrPcJzw8EvRbZTrcOat6BmZKZvbFAki7qovrVoK6eqFaZzVdaezP+k/XfcU2IDVYe/Ct68JwhQ18TpK1559X+UcGDwYRZrqtv5ylMt8nqtrpeIGd2tpczYCdzv7Ai+VNIZ7vFb2+7jc355U5qLS3R8xz6hU2DBwh4OBCUtjRgHPZlal0F+Y6EgJbC8jI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SE2P216MB2423.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(23010399003)(366016)(6133799003)(261009221727099003)(261009220027099003)(261009223327099003)(261009223027099003)(261009221227099003)(18002099003)(22082099003)(3023799007)(20052099010)(10067099003)(56012099006)(261028144727099003)(261102123227099003)(261022075727099003)(261026140227099003)(261022105027099003)(261022113327099003)(261021121427099003)(261021123027099003)(261026121527099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0aYT1ZF0LBE+3E+JLfakIZEj6SJnbEeIC2FlNkmmDFY13+iUOzd8sjMVC3oU?=
 =?us-ascii?Q?OYO4BDCr+BI3Z+twWnq5IjkRnj/7QKy4p5ZVVWUutqYMk46FY44aq9qc5e5u?=
 =?us-ascii?Q?LV1PmCzmH2GCQ4j8LAB/uT2cPFwp6xauHiaRO9Oesbj/zb2TsqovtUo4KGKO?=
 =?us-ascii?Q?8I4DrIjl0CSl0RLipGv3XdIC5ywot2UhqalIx5qNO1hnDVPwTpIkadU/4+gx?=
 =?us-ascii?Q?CQ+bkNGHAJCq5hRqNjk03g5eQ0D3yUyVYUopDxXucdGJjgllrClQrgR4Ri9X?=
 =?us-ascii?Q?CMEDuYiacXtsC24HjJWQyEbPiICD9lukkjkKJsiN/m4fzeXOqPW9UlkuBtTy?=
 =?us-ascii?Q?Vefe1W4PM11uOXiqt+aVW/4YJbTz3S66rDyy/x+cPjKvn//HHCVtnU0RXbKa?=
 =?us-ascii?Q?tgskiBJMCF0+TW0tnqtf2HK1Rz5fmHeLCsYD2/gugN5O/Ppvbj4TVHuSImgf?=
 =?us-ascii?Q?8OKTgBgdZija8TQo9+gI76nxCwEMUDJL4GNXuZ2U5lxhHh4fUfL93f8Dgl8A?=
 =?us-ascii?Q?3/QMGwfcrD+w3tWBJf17V5ciNQknXR489nCI9bXZS6NVHEZYG9rtpqjxU75P?=
 =?us-ascii?Q?3BOXKxDuRFFzxguANhdKrN3SP5E+b0JpZToTpLCs/+QnBFvZjzV8SL8TQ+Wy?=
 =?us-ascii?Q?5sLQ3vTE6PlAVwBYtP6/emQiekqzlcF67YQwyzT+ORx0NnE40oTREffZxGml?=
 =?us-ascii?Q?0O40BhLiUlyYzSrFexAcWMQc69/QpILdje1s8MkPrLBJeJlHNBGWWee3bHkK?=
 =?us-ascii?Q?rpXWPNT1mGJshFb4IixD4xnqalpVTl4X+LdhR6rzmpLnOzQGyfWk5ya0CztI?=
 =?us-ascii?Q?RIKzA8vGnx6U4wOfJOkfVV2fqO/d1puT0BUxtckd9dbzf/WYCu1pWuDjDUvV?=
 =?us-ascii?Q?uiTlhJ6404aBmE+Zoa7P973k2xqCylleTaUc6la9rt9Q/ZM8A6VLnpxoMYcb?=
 =?us-ascii?Q?wqvN6v77bWtO6iANuj5/JDPMVvom+TX5gYFbj8+fyIqfu/nrkBVSLbo1MAx4?=
 =?us-ascii?Q?+mzgsf+xoomV3j1O7JR4HWhXiUz1B3sW+aOOPtqhan/5Icq1gwMkhdtAuaNB?=
 =?us-ascii?Q?wpfc0bBkyN8g8G/pW+Cp0Poe8WBPnh1NnqmWXwqKEzOgOgY2imOJKqgMJ4oG?=
 =?us-ascii?Q?nLKvW8Rmg9v7iM3Uk7xZILnuN/edzIONH40Kgi+C0D0RzFlUbnOASTtv87yV?=
 =?us-ascii?Q?EdIL0/uV0u0YaC5Y+eDxpuop2FEe5G/jSfTBzw71GtueyasXk42E9LFHNTZK?=
 =?us-ascii?Q?+Ci1qPgtkhieLJ8fJsaEX4TbGao/wXBw5HbvR36HSdIBhls27rjMvFrzCFbu?=
 =?us-ascii?Q?Lwym+RSkXsoo/3tRoykHZ5GC0VlBsiuXetjEfZTJms260/qa5v4sorBiTpWH?=
 =?us-ascii?Q?wzF+ZvxRv3Z1RMKFwDOgaal/c/Uf8DYt7IDmRXWAikNsBIlN5rfwh+P0oAD/?=
 =?us-ascii?Q?CYl1QmlWSv/V9HDuyT2+YhqqT6noyldBbPhVQ2nc7Gx/WJy1x1ESGFeCuznJ?=
 =?us-ascii?Q?PkyhvNouxeaFEClHrVZhQ8OHSype8HvjzgrDLYlzoLNMRIcYbP42VI+m0K02?=
 =?us-ascii?Q?m1aZtXmDJhSUSEIuHe6TqbHiDFNRPiI8s0phOjUiI7+vxUR/SQYbePpCo11Y?=
 =?us-ascii?Q?HIzGv5hooni5ve8yMfqnZFFVfYRFHWoyjoP3TRebbjSzP072oVLkuJyH/hRK?=
 =?us-ascii?Q?BByh1fPnWR0oq3Y0KAulXN5EGlGVkUTD3NgaAkXANxhtvsNBUUIoGsBQZcgj?=
 =?us-ascii?Q?iYvyIGSZmg=3D=3D?=
X-OriginatorOrg: irondevice.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46958f27-43da-44da-930a-08df4c65d8fc
X-MS-Exchange-CrossTenant-AuthSource: SE2P216MB2423.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 09:07:22.9480
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b4849faa-3337-494e-a76a-cb25a3b3d7d1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +kcRze2UQ8cUQ8uMJGgzPO95y38uOnSqfsgwybDSPzplh4TaD1GehvNypeT4tsgok2ktTEK1AoO6OdQ+fHSiRmeYzaBUbVtQ+Ql35zkTLto=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE5P216MB3160

Add an ASoC codec driver for the Iron Device MA5311.

The driver supports audio playback and capture through I2S
and TDM interfaces. It provides ALSA mixer controls for audio
configuration and uses regmap for register access.

Signed-off-by: Hyunuk Son <hyunuk.son@irondevice.com>
---
 MAINTAINERS               |    2 +
 sound/soc/codecs/Kconfig  |   12 +
 sound/soc/codecs/Makefile |    2 +
 sound/soc/codecs/ma5311.c | 2300 +++++++++++++++++++++++++++++++++++++
 sound/soc/codecs/ma5311.h |  558 +++++++++
 5 files changed, 2874 insertions(+)
 create mode 100644 sound/soc/codecs/ma5311.c
 create mode 100644 sound/soc/codecs/ma5311.h

diff --git a/MAINTAINERS b/MAINTAINERS
index ca6853f7eb9f..7c9860e9d999 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14128,9 +14128,11 @@ F:	net/netfilter/ipvs/
 
 IRON DEVICE AUDIO CODEC DRIVERS
 M:	Kiseok Jo <kiseok.jo@irondevice.com>
+M:	Hyunuk Son <hyunuk.son@irondevice.com>
 L:	linux-sound@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/sound/irondevice,*
+F:	sound/soc/codecs/ma5311.*
 F:	sound/soc/codecs/sma*
 
 IRQ DOMAINS (IRQ NUMBER MAPPING LIBRARY)
diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 6239de3afa5a..720b27f6cdd1 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -145,6 +145,7 @@ config SND_SOC_ALL_CODECS
 	imply SND_SOC_LM4857
 	imply SND_SOC_LM49453
 	imply SND_SOC_LOCHNAGAR_SC
+	imply SND_SOC_MA5311
 	imply SND_SOC_MAX98088
 	imply SND_SOC_MAX98090
 	imply SND_SOC_MAX98095
@@ -1448,6 +1449,17 @@ config SND_SOC_LOCHNAGAR_SC
 	  This driver support the sound card functionality of the Cirrus
 	  Logic Lochnagar audio development board.
 
+config SND_SOC_MA5311
+	tristate "Iron Device MA5311 Audio Codec"
+	depends on I2C && GPIOLIB
+	select REGMAP_I2C
+	help
+	  Enable support for the Iron Device MA5311 audio codec with
+	  playback and capture over an I2S/TDM interface.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called snd-soc-ma5311.
+
 config SND_SOC_MADERA
 	tristate
 	select SND_SOC_WM_ADSP
diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
index 459a2aa463f3..ae6a83872ea5 100644
--- a/sound/soc/codecs/Makefile
+++ b/sound/soc/codecs/Makefile
@@ -167,6 +167,7 @@ snd-soc-lpass-rx-macro-y := lpass-rx-macro.o
 snd-soc-lpass-tx-macro-y := lpass-tx-macro.o
 snd-soc-lpass-wsa-macro-y := lpass-wsa-macro.o
 snd-soc-lpass-va-macro-y := lpass-va-macro.o
+snd-soc-ma5311-y := ma5311.o
 snd-soc-madera-y := madera.o
 snd-soc-max9759-y := max9759.o
 snd-soc-max9768-y := max9768.o
@@ -614,6 +615,7 @@ obj-$(CONFIG_SND_SOC_JZ4770_CODEC)	+= snd-soc-jz4770-codec.o
 obj-$(CONFIG_SND_SOC_LM4857)	+= snd-soc-lm4857.o
 obj-$(CONFIG_SND_SOC_LM49453)   += snd-soc-lm49453.o
 obj-$(CONFIG_SND_SOC_LOCHNAGAR_SC)	+= snd-soc-lochnagar-sc.o
+obj-$(CONFIG_SND_SOC_MA5311)	+= snd-soc-ma5311.o
 obj-$(CONFIG_SND_SOC_MADERA)	+= snd-soc-madera.o
 obj-$(CONFIG_SND_SOC_MAX9759)	+= snd-soc-max9759.o
 obj-$(CONFIG_SND_SOC_MAX9768)	+= snd-soc-max9768.o
diff --git a/sound/soc/codecs/ma5311.c b/sound/soc/codecs/ma5311.c
new file mode 100644
index 000000000000..d548fcd0267b
--- /dev/null
+++ b/sound/soc/codecs/ma5311.c
@@ -0,0 +1,2300 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// ma5311.c -- ma5311 ALSA SoC Audio driver
+//
+// Copyright 2026 Iron Device Corporation
+//
+// Author: Gyuhwa Park <gyuwha.park@irondevice.com>
+// Author: Hyunuk Son <hyunuk.son@irondevice.com>
+
+#include <linux/bitops.h>
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/errno.h>
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/interrupt.h>
+#include <linux/irq.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/regmap.h>
+#include <linux/slab.h>
+#include <sound/pcm.h>
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+#include <sound/soc-component.h>
+#include <sound/tlv.h>
+
+#include "ma5311.h"
+
+/* Board-selected delays; RSTN timing has not been hardware-validated. */
+#define MA5311_RESET_ASSERT_MS 50
+#define MA5311_RESET_RECOVERY_MS 50
+
+#define MA5311_PLL_MATCH(_input_clk, _post_n, _n, _f1, _f2, _f3_p_cp)	\
+	{								\
+		.input_clk = (_input_clk),				\
+		.post_n = (_post_n),					\
+		.n = (_n),						\
+		.f1 = (_f1),						\
+		.f2 = (_f2),						\
+		.f3_p_cp = (_f3_p_cp),					\
+	}
+
+struct ma5311_pll_match {
+	unsigned int input_clk;
+	unsigned int post_n;
+	unsigned int n;
+	unsigned int f1;
+	unsigned int f2;
+	unsigned int f3_p_cp;
+};
+
+struct ma5311_priv {
+	bool amp_power_status;
+	bool adc_power_status;
+	enum ma5311_mode amp_mode;
+	unsigned int num_of_pll_matches;
+	struct device *dev;
+	struct regmap *ctrl_regmap;
+	struct i2c_client *adc_client;
+	struct regmap *adc_regmap;
+	struct gpio_desc *reset_gpio;
+	const struct ma5311_pll_match *pll_matches;
+	unsigned int format;
+	unsigned int frame_size;
+	unsigned int last_bclk;
+	unsigned int sys_clk_id;
+
+	/* For dai configuration backup */
+	unsigned int dai_sys_clk; /* 0x00: MA5311_DAC_CLKSYSTEM_MASK */
+	unsigned int dai_clk_mode;
+	unsigned int dai_leftpol;
+	unsigned int dai_sck_edge;
+	unsigned int dai_spk_mute;
+	unsigned int dai_tdm1_rx_pos;
+	unsigned int dai_tdm2_data_len;
+	unsigned int dai_tdm2_capture_cfg;
+	unsigned int dai_data_path;
+	unsigned int dai_tdm_slot_enable;
+	unsigned int dai_pll_input; /* 0xa2: PLL input and reference clock selection */
+	unsigned int dai_pll_post_n;
+	unsigned int dai_pll_n;
+	unsigned int dai_pll_f1;
+	unsigned int dai_pll_f2;
+	unsigned int dai_pll_f3_p_cp;
+	unsigned int dai_sdo_len;
+	unsigned int dai_sck_rate;
+	unsigned int dai_o_format;
+	unsigned int dai_adc_mix_ch;
+	unsigned int dai_mas_clk_sel; /* 0xb8: MA5311_LRCK_SCK_MAS_CLK_SEL_MASK */
+	unsigned int dai_adc_clk; /* 0xb8: MA5311_DAC_ADC_CLK_ON_MASK */
+
+	unsigned int dai_adc1_word_len;
+	unsigned int dai_adc1_sck_rate;
+	unsigned int dai_adc2_word_len;
+	unsigned int dai_adc2_sck_rate;
+	unsigned int dai_adc3_word_len;
+	unsigned int dai_adc3_sck_rate;
+	unsigned int dai_adc4_word_len;
+	unsigned int dai_adc4_sck_rate;
+
+	bool flag_ext_rst;
+	bool flag_dai_tdm;
+};
+
+static const struct ma5311_pll_match ma5311_pll_matches[] = {
+	/* Input clock in Hz; register values produce a 24.576 MHz PLL clock. */
+	MA5311_PLL_MATCH(1536000, 0x07, 0xE0, 0x00, 0x00, 0x03),
+	MA5311_PLL_MATCH(3072000, 0x07, 0x70, 0x00, 0x00, 0x03),
+	MA5311_PLL_MATCH(6144000, 0x07, 0x70, 0x00, 0x00, 0x07),
+	MA5311_PLL_MATCH(12288000, 0x07, 0x70, 0x00, 0x00, 0x0B),
+};
+
+static const struct reg_default ma5311_ctrl_reg_def[] = {
+	{ 0x00, 0x08 },
+	{ 0x01, 0x00 },
+	{ 0x02, 0x00 },
+	{ 0x03, 0x01 },
+	{ 0x04, 0x17 },
+	{ 0x05, 0x01 },
+	{ 0x09, 0x00 },
+	{ 0x0A, 0x58 },
+	{ 0x0B, 0x58 },
+	{ 0x0E, 0xAF },
+	{ 0x0F, 0x0F },
+	{ 0x10, 0x00 },
+	{ 0x11, 0x00 },
+	{ 0x12, 0x01 },
+	{ 0x14, 0x5B },
+	{ 0x15, 0x01 },
+	{ 0x16, 0x0F },
+	{ 0x17, 0x0F },
+	{ 0x18, 0x0F },
+	{ 0x19, 0x00 },
+	{ 0x1A, 0x00 },
+	{ 0x1B, 0x00 },
+	{ 0x23, 0x19 },
+	{ 0x24, 0x00 },
+	{ 0x25, 0x00 },
+	{ 0x26, 0x04 },
+	{ 0x2B, 0x00 },
+	{ 0x2C, 0x0C },
+	{ 0x2D, 0x0C },
+	{ 0x2E, 0x0C },
+	{ 0x2F, 0x0C },
+	{ 0x30, 0x0C },
+	{ 0x33, 0x2C },
+	{ 0x34, 0x00 },
+	{ 0x35, 0x00 },
+	{ 0x36, 0x92 },
+	{ 0x37, 0x01 },
+	{ 0x38, 0x41 },
+	{ 0x39, 0x00 },
+	{ 0x3A, 0x00 },
+	{ 0x3B, 0x00 },
+	{ 0x3C, 0x00 },
+	{ 0x3D, 0x00 },
+	{ 0x40, 0x00 },
+	{ 0x41, 0x00 },
+	{ 0x42, 0x00 },
+	{ 0x43, 0x00 },
+	{ 0x44, 0x00 },
+	{ 0x45, 0x00 },
+	{ 0x46, 0x20 },
+	{ 0x47, 0x00 },
+	{ 0x48, 0x00 },
+	{ 0x49, 0x00 },
+	{ 0x4A, 0x00 },
+	{ 0x4B, 0x00 },
+	{ 0x4C, 0x00 },
+	{ 0x4D, 0x00 },
+	{ 0x4E, 0x00 },
+	{ 0x4F, 0x00 },
+	{ 0x50, 0x00 },
+	{ 0x51, 0x00 },
+	{ 0x52, 0x00 },
+	{ 0x53, 0x00 },
+	{ 0x54, 0x00 },
+	{ 0x55, 0x20 },
+	{ 0x56, 0x00 },
+	{ 0x57, 0x00 },
+	{ 0x58, 0x00 },
+	{ 0x59, 0x00 },
+	{ 0x5A, 0x00 },
+	{ 0x5B, 0x00 },
+	{ 0x5C, 0x00 },
+	{ 0x5D, 0x00 },
+	{ 0x5E, 0x00 },
+	{ 0x5F, 0x00 },
+	{ 0x60, 0x00 },
+	{ 0x61, 0x00 },
+	{ 0x62, 0x00 },
+	{ 0x63, 0x00 },
+	{ 0x64, 0x20 },
+	{ 0x65, 0x00 },
+	{ 0x66, 0x00 },
+	{ 0x67, 0x00 },
+	{ 0x68, 0x00 },
+	{ 0x69, 0x00 },
+	{ 0x6A, 0x00 },
+	{ 0x6B, 0x00 },
+	{ 0x6C, 0x00 },
+	{ 0x6D, 0x00 },
+	{ 0x6E, 0x00 },
+	{ 0x6F, 0x00 },
+	{ 0x70, 0x00 },
+	{ 0x71, 0x00 },
+	{ 0x72, 0x00 },
+	{ 0x73, 0x20 },
+	{ 0x74, 0x00 },
+	{ 0x75, 0x00 },
+	{ 0x76, 0x00 },
+	{ 0x77, 0x00 },
+	{ 0x78, 0x00 },
+	{ 0x79, 0x00 },
+	{ 0x7A, 0x00 },
+	{ 0x7B, 0x00 },
+	{ 0x7C, 0x00 },
+	{ 0x7D, 0x00 },
+	{ 0x7E, 0x00 },
+	{ 0x7F, 0x00 },
+	{ 0x80, 0x00 },
+	{ 0x81, 0x00 },
+	{ 0x82, 0x20 },
+	{ 0x83, 0x00 },
+	{ 0x84, 0x00 },
+	{ 0x85, 0x00 },
+	{ 0x86, 0x00 },
+	{ 0x87, 0x00 },
+	{ 0x88, 0x00 },
+	{ 0x89, 0x00 },
+	{ 0x8A, 0x00 },
+	{ 0x8B, 0x08 },
+	{ 0x8C, 0x20 },
+	{ 0x8D, 0x00 },
+	{ 0x8E, 0x00 },
+	{ 0x8F, 0x02 },
+	{ 0x91, 0x00 },
+	{ 0xA1, 0x40 },
+	{ 0xA2, 0x48 },
+	{ 0xA3, 0x20 },
+	{ 0xA4, 0x00 },
+	{ 0xA5, 0x1A },
+	{ 0xA6, 0x52 },
+	{ 0xA7, 0x00 },
+	{ 0xA8, 0x28 },
+	{ 0xA9, 0x25 },
+	{ 0xAA, 0x44 },
+	{ 0xAB, 0x62 },
+	{ 0xAC, 0x04 },
+	{ 0xAD, 0x00 },
+	{ 0xAE, 0x00 },
+	{ 0xAF, 0x00 },
+	{ 0xB0, 0x00 },
+	{ 0xB1, 0x00 },
+	{ 0xB2, 0x00 },
+	{ 0xB3, 0x04 },
+	{ 0xB4, 0x00 },
+	{ 0xB5, 0x00 },
+	{ 0xB7, 0x20 },
+	{ 0xB8, 0x44 },
+	{ 0xB9, 0x0B },
+	{ 0xBB, 0x42 },
+	{ 0xBC, 0x82 },
+	{ 0xBD, 0x61 },
+	{ 0xBE, 0x67 },
+	{ 0xBF, 0x67 },
+};
+
+static const struct reg_default ma5311_adc_reg_def[] = {
+	{ 0x00, 0x89 },
+	{ 0x01, 0x6C },
+	{ 0x02, 0x07 },
+	{ 0x03, 0x00 },
+	{ 0x04, 0xFF },
+	{ 0x05, 0xFF },
+	{ 0x06, 0x00 },
+	{ 0x07, 0xC0 },
+	{ 0x08, 0xC0 },
+	{ 0x09, 0x10 },
+	{ 0x0A, 0x10 },
+	{ 0x0B, 0xFF },
+	{ 0x0C, 0x6C },
+	{ 0x0D, 0x6C },
+	{ 0x0E, 0x00 },
+	{ 0x0F, 0x82 },
+	{ 0x10, 0x89 },
+	{ 0x11, 0x6C },
+	{ 0x12, 0x07 },
+	{ 0x13, 0x00 },
+	{ 0x14, 0xFF },
+	{ 0x15, 0xFF },
+	{ 0x16, 0x00 },
+	{ 0x17, 0xC0 },
+	{ 0x18, 0xC0 },
+	{ 0x19, 0x10 },
+	{ 0x1A, 0x10 },
+	{ 0x1B, 0xFF },
+	{ 0x1C, 0x6C },
+	{ 0x1D, 0x6C },
+	{ 0x1E, 0x00 },
+	{ 0x1F, 0x82 },
+	{ 0x20, 0x89 },
+	{ 0x21, 0x6C },
+	{ 0x22, 0x07 },
+	{ 0x23, 0x00 },
+	{ 0x24, 0xFF },
+	{ 0x25, 0xFF },
+	{ 0x26, 0x00 },
+	{ 0x27, 0xC0 },
+	{ 0x28, 0xC0 },
+	{ 0x29, 0x10 },
+	{ 0x2A, 0x10 },
+	{ 0x2B, 0xFF },
+	{ 0x2C, 0x6C },
+	{ 0x2D, 0x6C },
+	{ 0x2E, 0x00 },
+	{ 0x2F, 0x82 },
+	{ 0x30, 0x89 },
+	{ 0x31, 0x6C },
+	{ 0x32, 0x07 },
+	{ 0x33, 0x00 },
+	{ 0x34, 0xFF },
+	{ 0x35, 0xFF },
+	{ 0x36, 0x00 },
+	{ 0x37, 0xC0 },
+	{ 0x38, 0xC0 },
+	{ 0x39, 0x10 },
+	{ 0x3A, 0x10 },
+	{ 0x3B, 0xFF },
+	{ 0x3C, 0x6C },
+	{ 0x3D, 0x6C },
+	{ 0x3E, 0x00 },
+	{ 0x3F, 0x82 },
+};
+
+static bool ma5311_ctrl_readable_register(struct device *dev, unsigned int reg)
+{
+	if (reg > MA5311_DAC_FF_VERSION)
+		return false;
+
+	switch (reg) {
+	case MA5311_DAC_00_SYSTEM_CTRL1 ... MA5311_DAC_05_ADC_DAC_MIX2:
+	case MA5311_DAC_09_OUTPUT_CTRL ... MA5311_DAC_0B_SPK_VOL_R:
+	case MA5311_DAC_0E_MUTE_VOL_CTRL ... MA5311_DAC_12_SYSTEM_CTRL5:
+	case MA5311_DAC_14_MODULATOR2 ... MA5311_DAC_1B_BASS_SPK7:
+	case MA5311_DAC_23_COMP_LIM1 ... MA5311_DAC_26_COMP_LIM4:
+	case MA5311_DAC_2B_EQ_MODE ... MA5311_DAC_30_EQ_GRAPHIC5:
+	case MA5311_DAC_33_FLL_CTRL3 ... MA5311_DAC_3D_TEST3:
+	case MA5311_DAC_40_EQ_CTRL1 ... MA5311_DAC_8F_PLL_F3_P_CP:
+	case MA5311_DAC_91_ADC_DAC_MIX:
+	case MA5311_DAC_A1_TOP_MAN1_FOR_SDO ... MA5311_DAC_B5_MCLKO_TEST:
+	case MA5311_DAC_B7_TOP_MAN4 ... MA5311_DAC_B9_PLL_A_SETTING:
+	case MA5311_DAC_BB_CLASS_G_LEVEL1 ... MA5311_DAC_BF_POWER_METER:
+	case MA5311_DAC_EA_DAC_STATUS ... MA5311_DAC_EC_DAC_SCP_STATUS:
+	case MA5311_DAC_FB_STATUS2 ... MA5311_DAC_FD_POWER_METER_DISPLAY:
+	case MA5311_DAC_FF_VERSION:
+		break;
+	default:
+		return false;
+	}
+
+	return true;
+}
+
+static bool ma5311_ctrl_writeable_register(struct device *dev, unsigned int reg)
+{
+	if (reg > MA5311_DAC_FF_VERSION)
+		return false;
+
+	switch (reg) {
+	case MA5311_DAC_00_SYSTEM_CTRL1 ... MA5311_DAC_05_ADC_DAC_MIX2:
+	case MA5311_DAC_09_OUTPUT_CTRL ... MA5311_DAC_0B_SPK_VOL_R:
+	case MA5311_DAC_0E_MUTE_VOL_CTRL ... MA5311_DAC_12_SYSTEM_CTRL5:
+	case MA5311_DAC_14_MODULATOR2 ... MA5311_DAC_1B_BASS_SPK7:
+	case MA5311_DAC_23_COMP_LIM1 ... MA5311_DAC_26_COMP_LIM4:
+	case MA5311_DAC_2B_EQ_MODE ... MA5311_DAC_30_EQ_GRAPHIC5:
+	case MA5311_DAC_33_FLL_CTRL3 ... MA5311_DAC_3D_TEST3:
+	case MA5311_DAC_40_EQ_CTRL1 ... MA5311_DAC_8F_PLL_F3_P_CP:
+	case MA5311_DAC_91_ADC_DAC_MIX:
+	case MA5311_DAC_A1_TOP_MAN1_FOR_SDO ... MA5311_DAC_B5_MCLKO_TEST:
+	case MA5311_DAC_B7_TOP_MAN4 ... MA5311_DAC_B9_PLL_A_SETTING:
+	case MA5311_DAC_BB_CLASS_G_LEVEL1 ... MA5311_DAC_BF_POWER_METER:
+		break;
+	default:
+		return false;
+	}
+
+	return true;
+}
+
+static bool ma5311_ctrl_volatile_register(struct device *dev, unsigned int reg)
+{
+	if (reg > MA5311_DAC_FF_VERSION)
+		return false;
+
+	switch (reg) {
+	case MA5311_DAC_EA_DAC_STATUS ... MA5311_DAC_EC_DAC_SCP_STATUS:
+	case MA5311_DAC_FB_STATUS2 ... MA5311_DAC_FD_POWER_METER_DISPLAY:
+	case MA5311_DAC_FF_VERSION:
+		break;
+	default:
+		return false;
+	}
+
+	return true;
+}
+
+static bool ma5311_adc_readable_register(struct device *dev, unsigned int reg)
+{
+	if (reg > MA5311_ADC_CH4_3F_OUTPUT_FORMAT)
+		return false;
+
+	switch (reg) {
+	case MA5311_ADC_CH1_00_GENERAL_SETTING ... MA5311_ADC_CH4_3F_OUTPUT_FORMAT:
+		break;
+	default:
+		return false;
+	}
+
+	return true;
+}
+
+static bool ma5311_adc_writeable_register(struct device *dev, unsigned int reg)
+{
+	if (reg > MA5311_ADC_CH4_3F_OUTPUT_FORMAT)
+		return false;
+
+	switch (reg) {
+	case MA5311_ADC_CH1_00_GENERAL_SETTING ... MA5311_ADC_CH4_3F_OUTPUT_FORMAT:
+		break;
+	default:
+		return false;
+	}
+
+	return true;
+}
+
+static const DECLARE_TLV_DB_RANGE(ma5311_adc_vol_tlv,
+				  0x00, 0xef, TLV_DB_MINMAX_ITEM(-7200, 1763),
+				  0xf0, 0xff, TLV_DB_SCALE_ITEM(1763, 0, 0));
+
+static const DECLARE_TLV_DB_RANGE(ma5311_adc_pga_tlv,
+				  0x00, 0x3b, TLV_DB_MINMAX_ITEM(-1200, 3225),
+				  0x3c, 0x3f, TLV_DB_SCALE_ITEM(3225, 0, 0));
+
+static const DECLARE_TLV_DB_RANGE(ma5311_spk_tlv,
+				  0x00, 0xa8, TLV_DB_MINMAX_ITEM(-6000, 2400),
+				  0xa9, 0xff, TLV_DB_SCALE_ITEM(-6000, 0, 0));
+
+static const char *const ma5311_aif_in_source_text[] = {
+	"Mono Both", "Stereo",
+};
+
+static const char *const ma5311_rx_slot_text[] = {
+	"None", "Slot01", "Slot23", "Slot45", "Slot67",
+};
+
+static const char *const ma5311_reset_text[] = {
+	"idle", "reset",
+};
+
+static const unsigned int ma5311_tdm_rx_slot_values[] = {
+	MA5311_DISABLE_TDM_SLOT,
+	MA5311_TDM_SLOT0_RX_POS_0 | MA5311_TDM_SLOT1_RX_POS_1,
+	MA5311_TDM_SLOT0_RX_POS_2 | MA5311_TDM_SLOT1_RX_POS_3,
+	MA5311_TDM_SLOT0_RX_POS_4 | MA5311_TDM_SLOT1_RX_POS_5,
+	MA5311_TDM_SLOT0_RX_POS_6 | MA5311_TDM_SLOT1_RX_POS_7,
+};
+
+static const struct soc_enum ma5311_reset_enum =
+	SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(ma5311_reset_text), ma5311_reset_text);
+
+static SOC_ENUM_SINGLE_VIRT_DECL(ma5311_aif_in_source_enum,
+				 ma5311_aif_in_source_text);
+
+static const struct soc_enum ma5311_rx_slot_enum =
+	SOC_VALUE_ENUM_SINGLE(MA5311_DAC_37_TDM1, 0,
+			      MA5311_TDM_SLOT0_RX_POS_MASK |
+			      MA5311_TDM_SLOT1_RX_POS_MASK,
+			      ARRAY_SIZE(ma5311_rx_slot_text),
+			      ma5311_rx_slot_text,
+			      ma5311_tdm_rx_slot_values);
+
+static void ma5311_restore_dai_config(struct ma5311_priv *ma5311)
+{
+	/* Restore clock settings without powering up the chip or PLL. */
+	regmap_update_bits(ma5311->ctrl_regmap,
+			   MA5311_DAC_00_SYSTEM_CTRL1,
+			   MA5311_DAC_CLKSYSTEM_MASK,
+			   ma5311->dai_sys_clk);
+
+	regmap_update_bits(ma5311->ctrl_regmap,
+			   MA5311_DAC_01_INPUT1_CTRL1,
+			   MA5311_LEFTPOL_MASK |
+			   MA5311_SCK_RISING_MASK |
+			   MA5311_CONTROLLER_DEVICE_MASK,
+			   ma5311->dai_leftpol |
+			   ma5311->dai_sck_edge |
+			   ma5311->dai_clk_mode);
+
+	regmap_update_bits(ma5311->ctrl_regmap,
+			   MA5311_DAC_0E_MUTE_VOL_CTRL,
+			   MA5311_DAC_MUTE_VOL_MASK,
+			   ma5311->dai_spk_mute);
+
+	regmap_update_bits(ma5311->ctrl_regmap,
+			   MA5311_DAC_37_TDM1,
+			   MA5311_TDM_SLOT0_RX_POS_MASK |
+			   MA5311_TDM_SLOT1_RX_POS_MASK,
+			   ma5311->dai_tdm1_rx_pos);
+
+	regmap_update_bits(ma5311->ctrl_regmap,
+			   MA5311_DAC_38_TDM2,
+			   MA5311_DAC_38_DATA_LEN_MASK |
+			   MA5311_ADC_TDM2_SETTING_MASK,
+			   ma5311->dai_tdm2_data_len |
+			   ma5311->dai_tdm2_capture_cfg);
+
+	regmap_write(ma5311->ctrl_regmap,
+		     MA5311_DAC_39_DATA_PATH,
+		     ma5311->dai_data_path);
+
+	regmap_write(ma5311->ctrl_regmap,
+		     MA5311_DAC_3A_TDM_SLOT_ENABLE,
+		     ma5311->dai_tdm_slot_enable);
+
+	regmap_write(ma5311->ctrl_regmap,
+		     MA5311_DAC_8B_PLL_POST_N,
+		     ma5311->dai_pll_post_n);
+
+	regmap_write(ma5311->ctrl_regmap,
+		     MA5311_DAC_8C_PLL_N,
+		     ma5311->dai_pll_n);
+
+	regmap_write(ma5311->ctrl_regmap,
+		     MA5311_DAC_8D_PLL_F1,
+		     ma5311->dai_pll_f1);
+
+	regmap_write(ma5311->ctrl_regmap,
+		     MA5311_DAC_8E_PLL_F2,
+		     ma5311->dai_pll_f2);
+
+	regmap_write(ma5311->ctrl_regmap,
+		     MA5311_DAC_8F_PLL_F3_P_CP,
+		     ma5311->dai_pll_f3_p_cp);
+
+	regmap_update_bits(ma5311->ctrl_regmap,
+			   MA5311_DAC_91_ADC_DAC_MIX,
+			   MA5311_DAC_ADC_DAC_MIX_CH_MASK,
+			   ma5311->dai_adc_mix_ch);
+
+	regmap_update_bits(ma5311->ctrl_regmap,
+			   MA5311_DAC_A1_TOP_MAN1_FOR_SDO,
+			   MA5311_TOP_MAN1_SOO_LENGTH_MASK |
+			   MA5311_DAC_A1_SCK_RATE_MASK |
+			   MA5311_TOP_MAN1_O_FORMAT_MASK,
+			   ma5311->dai_sdo_len |
+			   ma5311->dai_sck_rate |
+			   ma5311->dai_o_format);
+
+	regmap_update_bits(ma5311->ctrl_regmap,
+			   MA5311_DAC_A2_TOP_MAN2,
+			   MA5311_DAC_PLLIN_CLK_MASK |
+			   MA5311_DAC_PLL_REF_CLK1_MASK |
+			   MA5311_DAC_PLL_REF_CLK2_MASK,
+			   ma5311->dai_pll_input);
+
+	regmap_update_bits(ma5311->adc_regmap,
+			   MA5311_ADC_CH1_0F_OUTPUT_FORMAT,
+			   MA5311_ADC_OUTPUT_WORD_LENGTH_MASK |
+			   MA5311_ADC_OUTPUT_SCK_RATE_MASK,
+			   ma5311->dai_adc1_word_len |
+			   ma5311->dai_adc1_sck_rate);
+
+	regmap_update_bits(ma5311->adc_regmap,
+			   MA5311_ADC_CH2_1F_OUTPUT_FORMAT,
+			   MA5311_ADC_OUTPUT_WORD_LENGTH_MASK |
+			   MA5311_ADC_OUTPUT_SCK_RATE_MASK,
+			   ma5311->dai_adc2_word_len |
+			   ma5311->dai_adc2_sck_rate);
+
+	regmap_update_bits(ma5311->adc_regmap,
+			   MA5311_ADC_CH3_2F_OUTPUT_FORMAT,
+			   MA5311_ADC_OUTPUT_WORD_LENGTH_MASK |
+			   MA5311_ADC_OUTPUT_SCK_RATE_MASK,
+			   ma5311->dai_adc3_word_len |
+			   ma5311->dai_adc3_sck_rate);
+
+	regmap_update_bits(ma5311->adc_regmap,
+			   MA5311_ADC_CH4_3F_OUTPUT_FORMAT,
+			   MA5311_ADC_OUTPUT_WORD_LENGTH_MASK |
+			   MA5311_ADC_OUTPUT_SCK_RATE_MASK,
+			   ma5311->dai_adc4_word_len |
+			   ma5311->dai_adc4_sck_rate);
+
+	regmap_update_bits(ma5311->ctrl_regmap,
+			   MA5311_DAC_B8_TOP_MAN5,
+			   MA5311_LRCK_SCK_MAS_CLK_SEL_MASK |
+			   MA5311_DAC_ADC_CLK_ON_MASK,
+			   ma5311->dai_mas_clk_sel | ma5311->dai_adc_clk);
+}
+
+static int ma5311_reset(struct snd_soc_component *component)
+{
+	struct ma5311_priv *ma5311 = snd_soc_component_get_drvdata(component);
+	unsigned int status, revision, i;
+	int ret;
+
+	ret = regmap_read(ma5311->ctrl_regmap, MA5311_DAC_FF_VERSION, &status);
+	if (ret) {
+		dev_err(component->dev, "Register read operation failed\n");
+		return ret;
+	}
+
+	revision = status & MA5311_REV_NUM_STATUS;
+	dev_dbg(component->dev, "MA5311 revision: %u\n", revision);
+
+	/*
+	 * Critical register settings including speaker, ADC, PGA gains are
+	 * following factory defaults, while rest of settings are fixed
+	 * in practical settings including data format and path settings.
+	 */
+
+	for (i = 0; i < ARRAY_SIZE(ma5311_ctrl_reg_def); i++) {
+		regmap_write(ma5311->ctrl_regmap,
+			     ma5311_ctrl_reg_def[i].reg,
+			     ma5311_ctrl_reg_def[i].def);
+	}
+
+	for (i = 0; i < ARRAY_SIZE(ma5311_adc_reg_def); i++) {
+		regmap_write(ma5311->adc_regmap,
+			     ma5311_adc_reg_def[i].reg,
+			     ma5311_adc_reg_def[i].def);
+	}
+
+	if (ma5311->flag_ext_rst)
+		ma5311_restore_dai_config(ma5311);
+
+	return 0;
+}
+
+static int ma5311_adc_volume_control_get(struct snd_kcontrol *kcontrol,
+					 struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct ma5311_priv *ma5311 = snd_soc_component_get_drvdata(component);
+	const struct soc_mixer_control *mc =
+		(const struct soc_mixer_control *)kcontrol->private_value;
+	unsigned int val;
+	int ret;
+
+	ret = regmap_read(ma5311->adc_regmap, mc->reg, &val);
+	if (ret)
+		return ret;
+
+	ucontrol->value.integer.value[0] = val & MA5311_ADC_VOL_CTRL_MASK;
+
+	return 0;
+}
+
+static int ma5311_adc_volume_control_put(struct snd_kcontrol *kcontrol,
+					 struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct ma5311_priv *ma5311 = snd_soc_component_get_drvdata(component);
+	const struct soc_mixer_control *mc =
+		(const struct soc_mixer_control *)kcontrol->private_value;
+	long input = ucontrol->value.integer.value[0];
+	unsigned int val;
+	bool changed;
+	int ret;
+
+	if (input < 0 || input > MA5311_ADC_VOL_CTRL_MASK)
+		return -EINVAL;
+
+	val = input;
+
+	ret = regmap_update_bits_check(ma5311->adc_regmap, mc->reg,
+				       MA5311_ADC_VOL_CTRL_MASK, val, &changed);
+	if (ret)
+		return ret;
+
+	return changed;
+}
+
+static int ma5311_adc_pga_control_get(struct snd_kcontrol *kcontrol,
+				      struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct ma5311_priv *ma5311 = snd_soc_component_get_drvdata(component);
+	const struct soc_mixer_control *mc =
+		(const struct soc_mixer_control *)kcontrol->private_value;
+	unsigned int val;
+	int ret;
+
+	ret = regmap_read(ma5311->adc_regmap, mc->reg, &val);
+	if (ret)
+		return ret;
+
+	ucontrol->value.integer.value[0] = val & MA5311_ADC_PGA_CTRL_MASK;
+
+	return 0;
+}
+
+static int ma5311_adc_pga_control_put(struct snd_kcontrol *kcontrol,
+				      struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct ma5311_priv *ma5311 = snd_soc_component_get_drvdata(component);
+	const struct soc_mixer_control *mc =
+		(const struct soc_mixer_control *)kcontrol->private_value;
+	long input = ucontrol->value.integer.value[0];
+	unsigned int val;
+	int ret;
+	bool changed;
+
+	if (input < 0 || input > MA5311_ADC_PGA_CTRL_MASK)
+		return -EINVAL;
+
+	val = input;
+
+	ret = regmap_update_bits_check(ma5311->adc_regmap, mc->reg,
+				       MA5311_ADC_PGA_CTRL_MASK, val, &changed);
+	if (ret)
+		return ret;
+
+	return changed;
+}
+
+static int ma5311_startup(struct snd_soc_component *component)
+{
+	struct ma5311_priv *ma5311 = snd_soc_component_get_drvdata(component);
+
+	regmap_update_bits(ma5311->ctrl_regmap,
+			   MA5311_DAC_A2_TOP_MAN2,
+			   MA5311_PLL_MASK, MA5311_PLL_ON);
+
+	regmap_update_bits(ma5311->ctrl_regmap,
+			   MA5311_DAC_00_SYSTEM_CTRL1,
+			   MA5311_POWER_MASK, MA5311_POWER_ON);
+
+	if (ma5311->amp_mode == MA5311_MONO_BOTH_MODE) {
+		regmap_update_bits(ma5311->ctrl_regmap,
+				   MA5311_DAC_10_SYSTEM_CTRL3,
+				   MA5311_SPK_MODE_MASK,
+				   MA5311_SPK_MONO_BOTH);
+		regmap_update_bits(ma5311->ctrl_regmap,
+				   MA5311_DAC_37_TDM1,
+				   MA5311_DAC_TDM_STEREO_MASK,
+				   MA5311_DAC_TDM_MONO);
+	} else {
+		regmap_update_bits(ma5311->ctrl_regmap,
+				   MA5311_DAC_10_SYSTEM_CTRL3,
+				   MA5311_SPK_MODE_MASK,
+				   MA5311_SPK_STEREO);
+		regmap_update_bits(ma5311->ctrl_regmap,
+				   MA5311_DAC_37_TDM1,
+				   MA5311_DAC_TDM_STEREO_MASK,
+				   MA5311_DAC_TDM_STEREO);
+	}
+
+	ma5311->amp_power_status = true;
+	msleep(55);
+
+	return 0;
+}
+
+static int ma5311_shutdown(struct snd_soc_component *component)
+{
+	struct ma5311_priv *ma5311 = snd_soc_component_get_drvdata(component);
+
+	regmap_update_bits(ma5311->ctrl_regmap, MA5311_DAC_0E_MUTE_VOL_CTRL,
+			   MA5311_DAC_MUTE_VOL_MASK, MA5311_SPK_MUTE);
+
+	msleep(55);
+
+	regmap_update_bits(ma5311->ctrl_regmap, MA5311_DAC_10_SYSTEM_CTRL3,
+			   MA5311_SPK_MODE_MASK, MA5311_SPK_OFF);
+
+	ma5311->amp_power_status = false;
+
+	/* Capture shares the PLL and global power with playback. */
+	if (!ma5311->adc_power_status) {
+		regmap_update_bits(ma5311->ctrl_regmap,
+				   MA5311_DAC_A2_TOP_MAN2,
+				   MA5311_PLL_MASK, MA5311_PLL_OFF);
+
+		regmap_update_bits(ma5311->ctrl_regmap,
+				   MA5311_DAC_00_SYSTEM_CTRL1,
+				   MA5311_POWER_MASK, MA5311_POWER_OFF);
+	}
+
+	return 0;
+}
+
+static int ma5311_reset_control_get(struct snd_kcontrol *kcontrol,
+				    struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct ma5311_priv *ma5311 = snd_soc_component_get_drvdata(component);
+
+	if (!ma5311->reset_gpio)
+		return -ENODEV;
+
+	ucontrol->value.enumerated.item[0] = 0;
+
+	return 0;
+}
+
+static int ma5311_reset_control_put(struct snd_kcontrol *kcontrol,
+				    struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct ma5311_priv *ma5311 = snd_soc_component_get_drvdata(component);
+	struct snd_soc_dapm_context *dapm =
+		snd_soc_component_to_dapm(component);
+	struct snd_kcontrol *slot_control;
+	unsigned int val = ucontrol->value.enumerated.item[0];
+	unsigned int rx_slot;
+	int ret = 0;
+
+	if (!val)
+		return 0;
+
+	if (!ma5311->reset_gpio)
+		return -ENODEV;
+
+	if (val >= ARRAY_SIZE(ma5311_reset_text))
+		return -EINVAL;
+
+	slot_control = snd_soc_card_get_kcontrol(component->card,
+						 "RX Slot Configuration");
+	if (!slot_control)
+		return -ENOENT;
+
+	snd_soc_dpcm_mutex_lock(component->card);
+	snd_soc_dapm_mutex_lock(dapm);
+
+	if (ma5311->amp_power_status || ma5311->adc_power_status) {
+		dev_warn(component->dev,
+			 "Reset denied: playback or capture path is powered\n");
+		ret = -EBUSY;
+		goto unlock;
+	}
+
+	if (snd_soc_component_active(component)) {
+		dev_warn(component->dev,
+			 "Reset denied: pcm stream is in active state\n");
+		ret = -EBUSY;
+		goto unlock;
+	}
+
+	gpiod_set_value_cansleep(ma5311->reset_gpio, 1);
+	msleep(MA5311_RESET_ASSERT_MS);
+
+	gpiod_set_value_cansleep(ma5311->reset_gpio, 0);
+	msleep(MA5311_RESET_RECOVERY_MS);
+
+	rx_slot = snd_soc_dapm_kcontrol_get_value(slot_control);
+	rx_slot &= MA5311_TDM_SLOT0_RX_POS_MASK |
+		MA5311_TDM_SLOT1_RX_POS_MASK;
+	ma5311->dai_tdm1_rx_pos = rx_slot;
+
+	ma5311->flag_ext_rst = true;
+	ret = ma5311_reset(component);
+	ma5311->flag_ext_rst = false;
+
+unlock:
+	snd_soc_dapm_mutex_unlock(dapm);
+	snd_soc_dpcm_mutex_unlock(component->card);
+
+	return ret;
+}
+
+static const struct snd_kcontrol_new ma5311_reset_controls[] = {
+	SOC_ENUM_EXT(MA5311_RESET_CTRL_NAME, ma5311_reset_enum,
+		     ma5311_reset_control_get, ma5311_reset_control_put),
+};
+
+static const struct snd_kcontrol_new ma5311_snd_controls[] = {
+	SOC_SINGLE_TLV(MA5311_LEFT_VOL_CTRL_NAME, MA5311_DAC_0A_SPK_VOL_L, 0,
+		       168, 1, ma5311_spk_tlv),
+	SOC_SINGLE_TLV(MA5311_RIGHT_VOL_CTRL_NAME, MA5311_DAC_0B_SPK_VOL_R, 0,
+		       168, 1, ma5311_spk_tlv),
+
+	SOC_SINGLE_EXT_TLV(MA5311_ADC1_LEFT_VOL_CTRL_NAME,
+			   MA5311_ADC_CH1_07_VOLUME_LEFT, 0,
+			   MA5311_ADC_VOL_CTRL_MASK, 0,
+			   ma5311_adc_volume_control_get,
+			   ma5311_adc_volume_control_put, ma5311_adc_vol_tlv),
+
+	SOC_SINGLE_EXT_TLV(MA5311_ADC1_RIGHT_VOL_CTRL_NAME,
+			   MA5311_ADC_CH1_08_VOLUME_RIGHT, 0,
+			   MA5311_ADC_VOL_CTRL_MASK, 0,
+			   ma5311_adc_volume_control_get,
+			   ma5311_adc_volume_control_put, ma5311_adc_vol_tlv),
+
+	SOC_SINGLE_EXT_TLV(MA5311_ADC2_LEFT_VOL_CTRL_NAME,
+			   MA5311_ADC_CH2_17_VOLUME_LEFT, 0,
+			   MA5311_ADC_VOL_CTRL_MASK, 0,
+			   ma5311_adc_volume_control_get,
+			   ma5311_adc_volume_control_put, ma5311_adc_vol_tlv),
+
+	SOC_SINGLE_EXT_TLV(MA5311_ADC2_RIGHT_VOL_CTRL_NAME,
+			   MA5311_ADC_CH2_18_VOLUME_RIGHT, 0,
+			   MA5311_ADC_VOL_CTRL_MASK, 0,
+			   ma5311_adc_volume_control_get,
+			   ma5311_adc_volume_control_put, ma5311_adc_vol_tlv),
+
+	SOC_SINGLE_EXT_TLV(MA5311_ADC3_LEFT_VOL_CTRL_NAME,
+			   MA5311_ADC_CH3_27_VOLUME_LEFT, 0,
+			   MA5311_ADC_VOL_CTRL_MASK, 0,
+			   ma5311_adc_volume_control_get,
+			   ma5311_adc_volume_control_put, ma5311_adc_vol_tlv),
+
+	SOC_SINGLE_EXT_TLV(MA5311_ADC3_RIGHT_VOL_CTRL_NAME,
+			   MA5311_ADC_CH3_28_VOLUME_RIGHT, 0,
+			   MA5311_ADC_VOL_CTRL_MASK, 0,
+			   ma5311_adc_volume_control_get,
+			   ma5311_adc_volume_control_put, ma5311_adc_vol_tlv),
+
+	SOC_SINGLE_EXT_TLV(MA5311_ADC4_LEFT_VOL_CTRL_NAME,
+			   MA5311_ADC_CH4_37_VOLUME_LEFT, 0,
+			   MA5311_ADC_VOL_CTRL_MASK, 0,
+			   ma5311_adc_volume_control_get,
+			   ma5311_adc_volume_control_put, ma5311_adc_vol_tlv),
+
+	SOC_SINGLE_EXT_TLV(MA5311_ADC4_RIGHT_VOL_CTRL_NAME,
+			   MA5311_ADC_CH4_38_VOLUME_RIGHT, 0,
+			   MA5311_ADC_VOL_CTRL_MASK, 0,
+			   ma5311_adc_volume_control_get,
+			   ma5311_adc_volume_control_put, ma5311_adc_vol_tlv),
+
+	SOC_SINGLE_EXT_TLV(MA5311_ADC1_LEFT_PGA_CTRL_NAME,
+			   MA5311_ADC_CH1_09_PGA_LEFT, 0,
+			   MA5311_ADC_PGA_CTRL_MASK, 0,
+			   ma5311_adc_pga_control_get,
+			   ma5311_adc_pga_control_put, ma5311_adc_pga_tlv),
+
+	SOC_SINGLE_EXT_TLV(MA5311_ADC1_RIGHT_PGA_CTRL_NAME,
+			   MA5311_ADC_CH1_0A_PGA_RIGHT, 0,
+			   MA5311_ADC_PGA_CTRL_MASK, 0,
+			   ma5311_adc_pga_control_get,
+			   ma5311_adc_pga_control_put, ma5311_adc_pga_tlv),
+
+	SOC_SINGLE_EXT_TLV(MA5311_ADC2_LEFT_PGA_CTRL_NAME,
+			   MA5311_ADC_CH2_19_PGA_LEFT, 0,
+			   MA5311_ADC_PGA_CTRL_MASK, 0,
+			   ma5311_adc_pga_control_get,
+			   ma5311_adc_pga_control_put, ma5311_adc_pga_tlv),
+
+	SOC_SINGLE_EXT_TLV(MA5311_ADC2_RIGHT_PGA_CTRL_NAME,
+			   MA5311_ADC_CH2_1A_PGA_RIGHT, 0,
+			   MA5311_ADC_PGA_CTRL_MASK, 0,
+			   ma5311_adc_pga_control_get,
+			   ma5311_adc_pga_control_put, ma5311_adc_pga_tlv),
+
+	SOC_SINGLE_EXT_TLV(MA5311_ADC3_LEFT_PGA_CTRL_NAME,
+			   MA5311_ADC_CH3_29_PGA_LEFT, 0,
+			   MA5311_ADC_PGA_CTRL_MASK, 0,
+			   ma5311_adc_pga_control_get,
+			   ma5311_adc_pga_control_put, ma5311_adc_pga_tlv),
+
+	SOC_SINGLE_EXT_TLV(MA5311_ADC3_RIGHT_PGA_CTRL_NAME,
+			   MA5311_ADC_CH3_2A_PGA_RIGHT, 0,
+			   MA5311_ADC_PGA_CTRL_MASK, 0,
+			   ma5311_adc_pga_control_get,
+			   ma5311_adc_pga_control_put, ma5311_adc_pga_tlv),
+
+	SOC_SINGLE_EXT_TLV(MA5311_ADC4_LEFT_PGA_CTRL_NAME,
+			   MA5311_ADC_CH4_39_PGA_LEFT, 0,
+			   MA5311_ADC_PGA_CTRL_MASK, 0,
+			   ma5311_adc_pga_control_get,
+			   ma5311_adc_pga_control_put, ma5311_adc_pga_tlv),
+
+	SOC_SINGLE_EXT_TLV(MA5311_ADC4_RIGHT_PGA_CTRL_NAME,
+			   MA5311_ADC_CH4_3A_PGA_RIGHT, 0,
+			   MA5311_ADC_PGA_CTRL_MASK, 0,
+			   ma5311_adc_pga_control_get,
+			   ma5311_adc_pga_control_put, ma5311_adc_pga_tlv),
+};
+
+static int ma5311_dapm_aif_in_put(struct snd_kcontrol *kcontrol,
+				  struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_dapm_context *dapm =
+		snd_soc_dapm_kcontrol_to_dapm(kcontrol);
+	struct snd_soc_component *component = snd_soc_dapm_to_component(dapm);
+	struct ma5311_priv *ma5311 = snd_soc_component_get_drvdata(component);
+	unsigned int val = ucontrol->value.enumerated.item[0];
+	unsigned int old_val = snd_soc_dapm_kcontrol_get_value(kcontrol);
+
+	if (val >= ARRAY_SIZE(ma5311_aif_in_source_text)) {
+		dev_err(ma5311->dev, "%s: Out of range\n", __func__);
+		return -EINVAL;
+	}
+
+	if (old_val == val)
+		return 0;
+
+	if (ma5311->amp_power_status) {
+		dev_warn(ma5311->dev,
+			 "Cannot change AIF IN Source during playback\n");
+		return -EBUSY;
+	}
+
+	return snd_soc_dapm_put_enum_double(kcontrol, ucontrol);
+}
+
+static const struct snd_kcontrol_new ma5311_aif_in_source_control = {
+	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
+	.name = MA5311_AIF_IN_NAME,
+	.info = snd_soc_info_enum_double,
+	.get = snd_soc_dapm_get_enum_double,
+	.put = ma5311_dapm_aif_in_put,
+	.private_value = (unsigned long)&ma5311_aif_in_source_enum,
+};
+
+static const struct snd_kcontrol_new ma5311_rx_slot_control =
+	SOC_DAPM_ENUM("Route", ma5311_rx_slot_enum);
+
+static int ma5311_aif_in_event(struct snd_soc_dapm_widget *w,
+			       struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	struct ma5311_priv *ma5311 = snd_soc_component_get_drvdata(component);
+	unsigned int mux = snd_soc_dapm_kcontrol_get_value(w->kcontrols[0]);
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		switch (mux) {
+		case MA5311_MONO_BOTH_MODE:
+			regmap_update_bits(ma5311->ctrl_regmap,
+					   MA5311_DAC_10_SYSTEM_CTRL3,
+					   MA5311_SPK_MODE_MASK,
+					   MA5311_SPK_MONO_BOTH);
+			regmap_update_bits(ma5311->ctrl_regmap,
+					   MA5311_DAC_37_TDM1,
+					   MA5311_DAC_TDM_STEREO_MASK,
+					   MA5311_DAC_TDM_MONO);
+			break;
+		case MA5311_STEREO_MODE:
+			regmap_update_bits(ma5311->ctrl_regmap,
+					   MA5311_DAC_10_SYSTEM_CTRL3,
+					   MA5311_SPK_MODE_MASK,
+					   MA5311_SPK_STEREO);
+			regmap_update_bits(ma5311->ctrl_regmap,
+					   MA5311_DAC_37_TDM1,
+					   MA5311_DAC_TDM_STEREO_MASK,
+					   MA5311_DAC_TDM_STEREO);
+			break;
+		default:
+			dev_err(ma5311->dev, "%s: Invalid value (%u)\n",
+				__func__, mux);
+			return -EINVAL;
+		}
+
+		ma5311->amp_mode = mux;
+		break;
+	}
+
+	return 0;
+}
+
+static int ma5311_power_event(struct snd_soc_dapm_widget *w,
+			      struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+
+	switch (event) {
+	case SND_SOC_DAPM_POST_PMU:
+		return ma5311_startup(component);
+	case SND_SOC_DAPM_PRE_PMD:
+		return ma5311_shutdown(component);
+	}
+
+	return 0;
+}
+
+static int ma5311_adc_event(struct snd_soc_dapm_widget *w,
+			    struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	struct ma5311_priv *ma5311 = snd_soc_component_get_drvdata(component);
+	unsigned int format = ma5311->format;
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		regmap_update_bits(ma5311->ctrl_regmap, MA5311_DAC_A2_TOP_MAN2,
+				   MA5311_PLL_MASK, MA5311_PLL_ON);
+
+		regmap_update_bits(ma5311->ctrl_regmap,
+				   MA5311_DAC_00_SYSTEM_CTRL1,
+				   MA5311_POWER_MASK, MA5311_POWER_ON);
+
+		switch (format) {
+		case SND_SOC_DAIFMT_I2S:
+			regmap_update_bits(ma5311->adc_regmap,
+					   MA5311_ADC_CH1_00_GENERAL_SETTING,
+					   MA5311_ADC_POWER_MASK,
+					   MA5311_ADC_POWER_ON);
+			regmap_update_bits(ma5311->adc_regmap,
+					   MA5311_ADC_CH1_0E_MUTE_DATA_FLOW,
+					   MA5311_ADC_MUTE_BOTH_MASK,
+					   MA5311_ADC_BOTH_DEMUTE);
+			break;
+		case SND_SOC_DAIFMT_DSP_A:
+			regmap_update_bits(ma5311->adc_regmap,
+					   MA5311_ADC_CH1_00_GENERAL_SETTING,
+					   MA5311_ADC_POWER_MASK,
+					   MA5311_ADC_POWER_ON);
+			regmap_update_bits(ma5311->adc_regmap,
+					   MA5311_ADC_CH1_0E_MUTE_DATA_FLOW,
+					   MA5311_ADC_MUTE_BOTH_MASK,
+					   MA5311_ADC_BOTH_DEMUTE);
+
+			regmap_update_bits(ma5311->adc_regmap,
+					   MA5311_ADC_CH2_10_GENERAL_SETTING,
+					   MA5311_ADC_POWER_MASK,
+					   MA5311_ADC_POWER_ON);
+			regmap_update_bits(ma5311->adc_regmap,
+					   MA5311_ADC_CH2_1E_MUTE_DATA_FLOW,
+					   MA5311_ADC_MUTE_BOTH_MASK,
+					   MA5311_ADC_BOTH_DEMUTE);
+
+			regmap_update_bits(ma5311->adc_regmap,
+					   MA5311_ADC_CH3_20_GENERAL_SETTING,
+					   MA5311_ADC_POWER_MASK,
+					   MA5311_ADC_POWER_ON);
+			regmap_update_bits(ma5311->adc_regmap,
+					   MA5311_ADC_CH3_2E_MUTE_DATA_FLOW,
+					   MA5311_ADC_MUTE_BOTH_MASK,
+					   MA5311_ADC_BOTH_DEMUTE);
+
+			regmap_update_bits(ma5311->adc_regmap,
+					   MA5311_ADC_CH4_30_GENERAL_SETTING,
+					   MA5311_ADC_POWER_MASK,
+					   MA5311_ADC_POWER_ON);
+			regmap_update_bits(ma5311->adc_regmap,
+					   MA5311_ADC_CH4_3E_MUTE_DATA_FLOW,
+					   MA5311_ADC_MUTE_BOTH_MASK,
+					   MA5311_ADC_BOTH_DEMUTE);
+			break;
+		default:
+			dev_err(ma5311->dev, "%s: Invalid value (%u)\n",
+				__func__, format);
+			return -EINVAL;
+		}
+
+		ma5311->adc_power_status = true;
+		break;
+
+	case SND_SOC_DAPM_POST_PMD:
+		switch (format) {
+		case SND_SOC_DAIFMT_I2S:
+			regmap_update_bits(ma5311->adc_regmap,
+					   MA5311_ADC_CH1_0E_MUTE_DATA_FLOW,
+					   MA5311_ADC_MUTE_BOTH_MASK,
+					   MA5311_ADC_BOTH_MUTE);
+			regmap_update_bits(ma5311->adc_regmap,
+					   MA5311_ADC_CH1_00_GENERAL_SETTING,
+					   MA5311_ADC_POWER_MASK,
+					   MA5311_ADC_POWER_DOWN);
+			break;
+		case SND_SOC_DAIFMT_DSP_A:
+			regmap_update_bits(ma5311->adc_regmap,
+					   MA5311_ADC_CH1_0E_MUTE_DATA_FLOW,
+					   MA5311_ADC_MUTE_BOTH_MASK,
+					   MA5311_ADC_BOTH_MUTE);
+			regmap_update_bits(ma5311->adc_regmap,
+					   MA5311_ADC_CH1_00_GENERAL_SETTING,
+					   MA5311_ADC_POWER_MASK,
+					   MA5311_ADC_POWER_DOWN);
+			regmap_update_bits(ma5311->adc_regmap,
+					   MA5311_ADC_CH2_1E_MUTE_DATA_FLOW,
+					   MA5311_ADC_MUTE_BOTH_MASK,
+					   MA5311_ADC_BOTH_MUTE);
+			regmap_update_bits(ma5311->adc_regmap,
+					   MA5311_ADC_CH2_10_GENERAL_SETTING,
+					   MA5311_ADC_POWER_MASK,
+					   MA5311_ADC_POWER_DOWN);
+			regmap_update_bits(ma5311->adc_regmap,
+					   MA5311_ADC_CH3_2E_MUTE_DATA_FLOW,
+					   MA5311_ADC_MUTE_BOTH_MASK,
+					   MA5311_ADC_BOTH_MUTE);
+			regmap_update_bits(ma5311->adc_regmap,
+					   MA5311_ADC_CH3_20_GENERAL_SETTING,
+					   MA5311_ADC_POWER_MASK,
+					   MA5311_ADC_POWER_DOWN);
+			regmap_update_bits(ma5311->adc_regmap,
+					   MA5311_ADC_CH4_3E_MUTE_DATA_FLOW,
+					   MA5311_ADC_MUTE_BOTH_MASK,
+					   MA5311_ADC_BOTH_MUTE);
+			regmap_update_bits(ma5311->adc_regmap,
+					   MA5311_ADC_CH4_30_GENERAL_SETTING,
+					   MA5311_ADC_POWER_MASK,
+					   MA5311_ADC_POWER_DOWN);
+			break;
+		default:
+			dev_err(ma5311->dev, "%s: Invalid value (%u)\n",
+				__func__, format);
+			return -EINVAL;
+		}
+
+		ma5311->adc_power_status = false;
+
+		if (!ma5311->amp_power_status) {
+			regmap_update_bits(ma5311->ctrl_regmap,
+					   MA5311_DAC_A2_TOP_MAN2,
+					   MA5311_PLL_MASK, MA5311_PLL_OFF);
+
+			regmap_update_bits(ma5311->ctrl_regmap,
+					   MA5311_DAC_00_SYSTEM_CTRL1,
+					   MA5311_POWER_MASK, MA5311_POWER_OFF);
+		}
+	}
+
+	return 0;
+}
+
+static const struct snd_soc_dapm_widget ma5311_dapm_widgets[] = {
+	/* Playback */
+	SND_SOC_DAPM_AIF_IN("AIF IN", "Playback", 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_MUX_E("AIF IN Source", SND_SOC_NOPM, 0, 0,
+			   &ma5311_aif_in_source_control, ma5311_aif_in_event,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU),
+	SND_SOC_DAPM_MUX("RX Slot Configuration", SND_SOC_NOPM, 0, 0,
+			 &ma5311_rx_slot_control),
+	SND_SOC_DAPM_OUT_DRV_E("AMP Power", SND_SOC_NOPM, 0, 0, NULL, 0,
+			       ma5311_power_event,
+			       SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
+	SND_SOC_DAPM_OUTPUT("AOUT1L"),
+	SND_SOC_DAPM_OUTPUT("AOUT1R"),
+
+	/* Capture */
+	SND_SOC_DAPM_INPUT("ADC IN"),
+	SND_SOC_DAPM_ADC_E("ADC", NULL, SND_SOC_NOPM, 0, 0, ma5311_adc_event,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_AIF_OUT("AIF OUT", "Capture", 0, SND_SOC_NOPM, 0, 0),
+};
+
+static const struct snd_soc_dapm_route ma5311_dapm_routes[] = {
+	/* Playback */
+	{ "AIF IN Source", "Mono Both", "AIF IN" },
+	{ "AIF IN Source", "Stereo", "AIF IN" },
+
+	{ "RX Slot Configuration", "None", "AIF IN Source" },
+	{ "RX Slot Configuration", "Slot01", "AIF IN Source" },
+	{ "RX Slot Configuration", "Slot23", "AIF IN Source" },
+	{ "RX Slot Configuration", "Slot45", "AIF IN Source" },
+	{ "RX Slot Configuration", "Slot67", "AIF IN Source" },
+
+	{ "AMP Power", NULL, "RX Slot Configuration" },
+
+	{ "AOUT1L", NULL, "AMP Power" },
+	{ "AOUT1R", NULL, "AMP Power" },
+
+	/* Capture */
+	{ "ADC", NULL, "ADC IN" },
+	{ "AIF OUT", NULL, "ADC" },
+};
+
+static int ma5311_probe(struct snd_soc_component *component)
+{
+	struct ma5311_priv *ma5311 = snd_soc_component_get_drvdata(component);
+	int ret;
+
+	if (ma5311->reset_gpio) {
+		ret = snd_soc_add_component_controls(component,
+						     ma5311_reset_controls,
+						     ARRAY_SIZE(ma5311_reset_controls));
+		if (ret)
+			return ret;
+	}
+
+	return ma5311_reset(component);
+}
+
+static const struct snd_soc_component_driver ma5311_component = {
+	.probe = ma5311_probe,
+	.controls = ma5311_snd_controls,
+	.num_controls = ARRAY_SIZE(ma5311_snd_controls),
+	.dapm_widgets = ma5311_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(ma5311_dapm_widgets),
+	.dapm_routes = ma5311_dapm_routes,
+	.num_dapm_routes = ARRAY_SIZE(ma5311_dapm_routes),
+};
+
+static const struct regmap_config ma5311_ctrl_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+
+	.max_register = MA5311_DAC_FF_VERSION,
+	.readable_reg = ma5311_ctrl_readable_register,
+	.writeable_reg = ma5311_ctrl_writeable_register,
+	.volatile_reg = ma5311_ctrl_volatile_register,
+
+	.cache_type = REGCACHE_FLAT,
+	.reg_defaults = ma5311_ctrl_reg_def,
+	.num_reg_defaults = ARRAY_SIZE(ma5311_ctrl_reg_def),
+};
+
+static const struct regmap_config ma5311_adc_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+
+	.max_register = MA5311_ADC_CH4_3F_OUTPUT_FORMAT,
+	.readable_reg = ma5311_adc_readable_register,
+	.writeable_reg = ma5311_adc_writeable_register,
+
+	.cache_type = REGCACHE_FLAT,
+	.reg_defaults = ma5311_adc_reg_def,
+	.num_reg_defaults = ARRAY_SIZE(ma5311_adc_reg_def),
+};
+
+static int ma5311_setup_pll(struct snd_soc_component *component,
+			    unsigned int bclk)
+{
+	struct ma5311_priv *ma5311 = snd_soc_component_get_drvdata(component);
+	unsigned int i = 0;
+	unsigned int pll_post_n;
+	unsigned int pll_n;
+	unsigned int pll_f1;
+	unsigned int pll_f2;
+	unsigned int pll_f3_p_cp;
+
+	dev_dbg(component->dev, "PLL input BCLK: %u Hz\n", bclk);
+
+	if (ma5311->sys_clk_id == MA5311_PLL_CLKIN_BCLK) {
+		for (i = 0; i < ma5311->num_of_pll_matches; i++) {
+			if (ma5311->pll_matches[i].input_clk == bclk)
+				break;
+		}
+
+		if (i == ma5311->num_of_pll_matches) {
+			dev_warn(component->dev,
+				 "%s: No matching value between pll table and SCK\n",
+				 __func__);
+			return -EINVAL;
+		}
+
+		pll_post_n = ma5311->pll_matches[i].post_n;
+		pll_n = ma5311->pll_matches[i].n;
+		pll_f1 = ma5311->pll_matches[i].f1;
+		pll_f2 = ma5311->pll_matches[i].f2;
+		pll_f3_p_cp = ma5311->pll_matches[i].f3_p_cp;
+
+		regmap_update_bits(ma5311->ctrl_regmap,
+				   MA5311_DAC_A2_TOP_MAN2,
+				   MA5311_DAC_PLLIN_CLK_MASK,
+				   MA5311_DAC_PLLIN_EXT_OSC);
+
+		regmap_update_bits(ma5311->ctrl_regmap,
+				   MA5311_DAC_A2_TOP_MAN2,
+				   MA5311_DAC_PLL_REF_CLK1_MASK,
+				   MA5311_DAC_PLL_REF_EXT_CLK);
+
+		regmap_update_bits(ma5311->ctrl_regmap,
+				   MA5311_DAC_A2_TOP_MAN2,
+				   MA5311_DAC_PLL_REF_CLK2_MASK,
+				   MA5311_DAC_PLL_REF_CLK2_SCK);
+
+		ma5311->dai_pll_input = MA5311_DAC_PLLIN_EXT_OSC |
+					MA5311_DAC_PLL_REF_EXT_CLK |
+					MA5311_DAC_PLL_REF_CLK2_SCK;
+	} else if (ma5311->sys_clk_id == MA5311_INTERNAL_OSC) {
+		pll_post_n = MA5311_INT_OSC_POST_N;
+		pll_n = MA5311_INT_OSC_N;
+		pll_f1 = MA5311_INT_OSC_F1;
+		pll_f2 = MA5311_INT_OSC_F2;
+		pll_f3_p_cp = MA5311_INT_OSC_F3_P_CP;
+
+		regmap_update_bits(ma5311->ctrl_regmap,
+				   MA5311_DAC_A2_TOP_MAN2,
+				   MA5311_DAC_PLLIN_CLK_MASK,
+				   MA5311_DAC_PLLIN_INT_OSC);
+
+		regmap_update_bits(ma5311->ctrl_regmap,
+				   MA5311_DAC_A2_TOP_MAN2,
+				   MA5311_DAC_PLL_REF_CLK1_MASK,
+				   MA5311_DAC_PLL_REF_INT_OSC);
+
+		regmap_update_bits(ma5311->ctrl_regmap,
+				   MA5311_DAC_A2_TOP_MAN2,
+				   MA5311_DAC_PLL_REF_CLK2_MASK,
+				   MA5311_DAC_PLL_REF_CLK2_REF1);
+
+		ma5311->dai_pll_input = MA5311_DAC_PLLIN_INT_OSC |
+					MA5311_DAC_PLL_REF_INT_OSC |
+					MA5311_DAC_PLL_REF_CLK2_REF1;
+	} else {
+		return 0;
+	}
+
+	regmap_update_bits(ma5311->ctrl_regmap,
+			   MA5311_DAC_A2_TOP_MAN2,
+			   MA5311_PLL_MASK, MA5311_PLL_ON);
+
+	regmap_write(ma5311->ctrl_regmap, MA5311_DAC_8B_PLL_POST_N,
+		     pll_post_n);
+	ma5311->dai_pll_post_n = pll_post_n;
+
+	regmap_write(ma5311->ctrl_regmap, MA5311_DAC_8C_PLL_N,
+		     pll_n);
+	ma5311->dai_pll_n = pll_n;
+
+	regmap_write(ma5311->ctrl_regmap, MA5311_DAC_8D_PLL_F1,
+		     pll_f1);
+	ma5311->dai_pll_f1 = pll_f1;
+
+	regmap_write(ma5311->ctrl_regmap, MA5311_DAC_8E_PLL_F2,
+		     pll_f2);
+	ma5311->dai_pll_f2 = pll_f2;
+
+	regmap_write(ma5311->ctrl_regmap, MA5311_DAC_8F_PLL_F3_P_CP,
+		     pll_f3_p_cp);
+	ma5311->dai_pll_f3_p_cp = pll_f3_p_cp;
+
+	return 0;
+}
+
+static int ma5311_dai_hw_params(struct snd_pcm_substream *substream,
+				struct snd_pcm_hw_params *params,
+				struct snd_soc_dai *dai)
+{
+	struct snd_soc_component *component = dai->component;
+	struct ma5311_priv *ma5311 = snd_soc_component_get_drvdata(component);
+	unsigned int bclk = 0;
+	unsigned int frame_size;
+	int ret;
+
+	switch (params_rate(params)) {
+	case 48000:
+		break;
+
+	default:
+		dev_err(component->dev, "%s: unsupported sample rate: %u\n",
+			__func__, params_rate(params));
+
+		return -EINVAL;
+	}
+
+	if (params_channels(params) > 8) {
+		dev_err(component->dev, "%s: unsupported channel count: %u\n",
+			__func__, params_channels(params));
+
+		return -EINVAL;
+	}
+
+	if (ma5311->format == SND_SOC_DAIFMT_DSP_A) {
+		if (ma5311->frame_size)
+			frame_size = ma5311->frame_size;
+		else
+			frame_size = params_channels(params) *
+				     params_physical_width(params);
+
+		bclk = params_rate(params) * frame_size;
+		dev_dbg(component->dev, "Estimated TDM BCLK: %u Hz\n", bclk);
+	} else if (ma5311->format == SND_SOC_DAIFMT_I2S) {
+		bclk = params_rate(params) * params_physical_width(params) * 2;
+		dev_dbg(component->dev, "Estimated I2S BCLK: %u Hz\n", bclk);
+	} else {
+		return -EINVAL;
+	}
+
+	if (ma5311->sys_clk_id == MA5311_PLL_CLKIN_BCLK) {
+		regmap_update_bits(ma5311->ctrl_regmap,
+				   MA5311_DAC_00_SYSTEM_CTRL1,
+				   MA5311_DAC_CLKSYSTEM_MASK,
+				   MA5311_DAC_EXT_CLK_24_576);
+		ma5311->dai_sys_clk = MA5311_DAC_EXT_CLK_24_576;
+	} else {
+		regmap_update_bits(ma5311->ctrl_regmap,
+				   MA5311_DAC_00_SYSTEM_CTRL1,
+				   MA5311_DAC_CLKSYSTEM_MASK,
+				   MA5311_DAC_INT_OSCILLATOR);
+		ma5311->dai_sys_clk = MA5311_DAC_INT_OSCILLATOR;
+	}
+
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		if (ma5311->sys_clk_id == MA5311_PLL_CLKIN_BCLK &&
+		    ma5311->last_bclk != bclk) {
+			dev_dbg(component->dev, "Playback BCLK: %u Hz\n", bclk);
+			ret = ma5311_setup_pll(component, bclk);
+
+			if (ret) {
+				ma5311->last_bclk = 0;
+				dev_err(component->dev,
+					"Failed to configure PLL: %d\n", ret);
+				return ret;
+			}
+
+			ma5311->last_bclk = bclk;
+		} else if (ma5311->sys_clk_id == MA5311_INTERNAL_OSC) {
+			ret = ma5311_setup_pll(component, MA5311_DUMMY_BCLK);
+
+			if (ret) {
+				ma5311->last_bclk = 0;
+				dev_err(component->dev,
+					"Failed to configure PLL: %d\n", ret);
+				return ret;
+			}
+
+			ma5311->last_bclk = 0;
+		}
+
+		switch (params_format(params)) {
+		case SNDRV_PCM_FORMAT_S16_LE:
+			regmap_update_bits(ma5311->ctrl_regmap,
+					   MA5311_DAC_A1_TOP_MAN1_FOR_SDO,
+					   MA5311_TOP_MAN1_SOO_LENGTH_MASK,
+					   MA5311_TOP_MAN1_SDO_16B);
+			ma5311->dai_sdo_len = MA5311_TOP_MAN1_SDO_16B;
+			regmap_update_bits(ma5311->ctrl_regmap,
+					   MA5311_DAC_A1_TOP_MAN1_FOR_SDO,
+					   MA5311_DAC_A1_SCK_RATE_MASK,
+					   MA5311_DAC_A1_SCK_RATE_32FS);
+			ma5311->dai_sck_rate = MA5311_DAC_A1_SCK_RATE_32FS;
+			regmap_update_bits(ma5311->ctrl_regmap,
+					   MA5311_DAC_38_TDM2,
+					   MA5311_DAC_38_DATA_LEN_MASK,
+					   MA5311_DAC_38_DATA_LEN_16);
+			ma5311->dai_tdm2_data_len = MA5311_DAC_38_DATA_LEN_16;
+			break;
+
+		case SNDRV_PCM_FORMAT_S32_LE:
+			regmap_update_bits(ma5311->ctrl_regmap,
+					   MA5311_DAC_A1_TOP_MAN1_FOR_SDO,
+					   MA5311_TOP_MAN1_SOO_LENGTH_MASK,
+					   MA5311_TOP_MAN1_SDO_24B);
+			ma5311->dai_sdo_len = MA5311_TOP_MAN1_SDO_24B;
+			regmap_update_bits(ma5311->ctrl_regmap,
+					   MA5311_DAC_A1_TOP_MAN1_FOR_SDO,
+					   MA5311_DAC_A1_SCK_RATE_MASK,
+					   MA5311_DAC_A1_SCK_RATE_64FS);
+			ma5311->dai_sck_rate = MA5311_DAC_A1_SCK_RATE_64FS;
+			regmap_update_bits(ma5311->ctrl_regmap,
+					   MA5311_DAC_38_TDM2,
+					   MA5311_DAC_38_DATA_LEN_MASK,
+					   MA5311_DAC_38_DATA_LEN_32);
+			ma5311->dai_tdm2_data_len = MA5311_DAC_38_DATA_LEN_32;
+			break;
+
+		default:
+			dev_err(component->dev,
+				"%s: unsupported PCM format: %d\n", __func__,
+				params_format(params));
+			return -EINVAL;
+		}
+
+		switch (ma5311->format) {
+		case SND_SOC_DAIFMT_I2S:
+			regmap_update_bits(ma5311->ctrl_regmap,
+					   MA5311_DAC_37_TDM1,
+					   MA5311_TDM_SLOT0_RX_POS_MASK |
+					   MA5311_TDM_SLOT1_RX_POS_MASK,
+					   MA5311_DISABLE_TDM_SLOT);
+			regmap_update_bits(ma5311->ctrl_regmap,
+					   MA5311_DAC_A1_TOP_MAN1_FOR_SDO,
+					   MA5311_TOP_MAN1_O_FORMAT_MASK,
+					   MA5311_TOP_MAN1_O_FORMAT_I2S);
+			ma5311->dai_tdm1_rx_pos = MA5311_DISABLE_TDM_SLOT;
+			ma5311->dai_o_format = MA5311_TOP_MAN1_O_FORMAT_I2S;
+			break;
+
+		case SND_SOC_DAIFMT_DSP_A:
+			regmap_update_bits(ma5311->ctrl_regmap,
+					   MA5311_DAC_A1_TOP_MAN1_FOR_SDO,
+					   MA5311_TOP_MAN1_O_FORMAT_MASK,
+					   MA5311_TOP_MAN1_O_FORMAT_TDM);
+			ma5311->dai_o_format = MA5311_TOP_MAN1_O_FORMAT_TDM;
+			break;
+
+		default:
+			return -EINVAL;
+		}
+	}
+
+	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
+		regmap_update_bits(ma5311->ctrl_regmap,
+				   MA5311_DAC_B8_TOP_MAN5,
+				   MA5311_DAC_ADC_CLK_ON_MASK,
+				   MA5311_DAC_ADC_CLK_ON);
+		ma5311->dai_adc_clk = MA5311_DAC_ADC_CLK_ON;
+
+		if (ma5311->sys_clk_id == MA5311_PLL_CLKIN_BCLK &&
+		    ma5311->last_bclk != bclk) {
+			dev_dbg(component->dev, "Capture BCLK: %u Hz\n", bclk);
+			ret = ma5311_setup_pll(component, bclk);
+			if (ret) {
+				ma5311->last_bclk = 0;
+				dev_err(component->dev,
+					"Failed to configure PLL: %d\n", ret);
+				return ret;
+			}
+
+			ma5311->last_bclk = bclk;
+		} else if (ma5311->sys_clk_id == MA5311_INTERNAL_OSC) {
+			ret = ma5311_setup_pll(component, MA5311_DUMMY_BCLK);
+
+			if (ret) {
+				ma5311->last_bclk = 0;
+				dev_err(component->dev,
+					"Failed to configure PLL: %d\n", ret);
+				return ret;
+			}
+
+			ma5311->last_bclk = 0;
+		}
+
+		switch (params_format(params)) {
+		case SNDRV_PCM_FORMAT_S16_LE:
+			regmap_update_bits(ma5311->ctrl_regmap,
+					   MA5311_DAC_38_TDM2,
+					   MA5311_DAC_38_DATA_LEN_MASK,
+					   MA5311_DAC_38_DATA_LEN_16);
+			ma5311->dai_tdm2_data_len = MA5311_DAC_38_DATA_LEN_16;
+			regmap_update_bits(ma5311->ctrl_regmap,
+					   MA5311_DAC_A1_TOP_MAN1_FOR_SDO,
+					   MA5311_TOP_MAN1_SOO_LENGTH_MASK,
+					   MA5311_TOP_MAN1_SDO_16B);
+			ma5311->dai_sdo_len = MA5311_TOP_MAN1_SDO_16B;
+			regmap_update_bits(ma5311->ctrl_regmap,
+					   MA5311_DAC_A1_TOP_MAN1_FOR_SDO,
+					   MA5311_DAC_A1_SCK_RATE_MASK,
+					   MA5311_DAC_A1_SCK_RATE_32FS);
+			ma5311->dai_sck_rate = MA5311_DAC_A1_SCK_RATE_32FS;
+
+			regmap_update_bits(ma5311->adc_regmap,
+					   MA5311_ADC_CH1_0F_OUTPUT_FORMAT,
+					   MA5311_ADC_OUTPUT_WORD_LENGTH_MASK,
+					   MA5311_ADC_WORD_LENGTH_16);
+			ma5311->dai_adc1_word_len = MA5311_ADC_WORD_LENGTH_16;
+			regmap_update_bits(ma5311->adc_regmap,
+					   MA5311_ADC_CH2_1F_OUTPUT_FORMAT,
+					   MA5311_ADC_OUTPUT_WORD_LENGTH_MASK,
+					   MA5311_ADC_WORD_LENGTH_16);
+			ma5311->dai_adc2_word_len = MA5311_ADC_WORD_LENGTH_16;
+			regmap_update_bits(ma5311->adc_regmap,
+					   MA5311_ADC_CH3_2F_OUTPUT_FORMAT,
+					   MA5311_ADC_OUTPUT_WORD_LENGTH_MASK,
+					   MA5311_ADC_WORD_LENGTH_16);
+			ma5311->dai_adc3_word_len = MA5311_ADC_WORD_LENGTH_16;
+			regmap_update_bits(ma5311->adc_regmap,
+					   MA5311_ADC_CH4_3F_OUTPUT_FORMAT,
+					   MA5311_ADC_OUTPUT_WORD_LENGTH_MASK,
+					   MA5311_ADC_WORD_LENGTH_16);
+			ma5311->dai_adc4_word_len = MA5311_ADC_WORD_LENGTH_16;
+
+			regmap_update_bits(ma5311->adc_regmap,
+					   MA5311_ADC_CH1_0F_OUTPUT_FORMAT,
+					   MA5311_ADC_OUTPUT_SCK_RATE_MASK,
+					   MA5311_ADC_SCK_RATE_16BIT_CFG);
+			ma5311->dai_adc1_sck_rate = MA5311_ADC_SCK_RATE_16BIT_CFG;
+			regmap_update_bits(ma5311->adc_regmap,
+					   MA5311_ADC_CH2_1F_OUTPUT_FORMAT,
+					   MA5311_ADC_OUTPUT_SCK_RATE_MASK,
+					   MA5311_ADC_SCK_RATE_16BIT_CFG);
+			ma5311->dai_adc2_sck_rate = MA5311_ADC_SCK_RATE_16BIT_CFG;
+			regmap_update_bits(ma5311->adc_regmap,
+					   MA5311_ADC_CH3_2F_OUTPUT_FORMAT,
+					   MA5311_ADC_OUTPUT_SCK_RATE_MASK,
+					   MA5311_ADC_SCK_RATE_16BIT_CFG);
+			ma5311->dai_adc3_sck_rate = MA5311_ADC_SCK_RATE_16BIT_CFG;
+			regmap_update_bits(ma5311->adc_regmap,
+					   MA5311_ADC_CH4_3F_OUTPUT_FORMAT,
+					   MA5311_ADC_OUTPUT_SCK_RATE_MASK,
+					   MA5311_ADC_SCK_RATE_16BIT_CFG);
+			ma5311->dai_adc4_sck_rate = MA5311_ADC_SCK_RATE_16BIT_CFG;
+			break;
+
+		case SNDRV_PCM_FORMAT_S32_LE:
+			regmap_update_bits(ma5311->ctrl_regmap,
+					   MA5311_DAC_38_TDM2,
+					   MA5311_DAC_38_DATA_LEN_MASK,
+					   MA5311_DAC_38_DATA_LEN_32);
+			ma5311->dai_tdm2_data_len = MA5311_DAC_38_DATA_LEN_32;
+			regmap_update_bits(ma5311->ctrl_regmap,
+					   MA5311_DAC_A1_TOP_MAN1_FOR_SDO,
+					   MA5311_TOP_MAN1_SOO_LENGTH_MASK,
+					   MA5311_TOP_MAN1_SDO_24B);
+			ma5311->dai_sdo_len = MA5311_TOP_MAN1_SDO_24B;
+			regmap_update_bits(ma5311->ctrl_regmap,
+					   MA5311_DAC_A1_TOP_MAN1_FOR_SDO,
+					   MA5311_DAC_A1_SCK_RATE_MASK,
+					   MA5311_DAC_A1_SCK_RATE_64FS);
+			ma5311->dai_sck_rate = MA5311_DAC_A1_SCK_RATE_64FS;
+
+			regmap_update_bits(ma5311->adc_regmap,
+					   MA5311_ADC_CH1_0F_OUTPUT_FORMAT,
+					   MA5311_ADC_OUTPUT_WORD_LENGTH_MASK,
+					   MA5311_ADC_WORD_LENGTH_24);
+			ma5311->dai_adc1_word_len = MA5311_ADC_WORD_LENGTH_24;
+			regmap_update_bits(ma5311->adc_regmap,
+					   MA5311_ADC_CH2_1F_OUTPUT_FORMAT,
+					   MA5311_ADC_OUTPUT_WORD_LENGTH_MASK,
+					   MA5311_ADC_WORD_LENGTH_24);
+			ma5311->dai_adc2_word_len = MA5311_ADC_WORD_LENGTH_24;
+			regmap_update_bits(ma5311->adc_regmap,
+					   MA5311_ADC_CH3_2F_OUTPUT_FORMAT,
+					   MA5311_ADC_OUTPUT_WORD_LENGTH_MASK,
+					   MA5311_ADC_WORD_LENGTH_24);
+			ma5311->dai_adc3_word_len = MA5311_ADC_WORD_LENGTH_24;
+			regmap_update_bits(ma5311->adc_regmap,
+					   MA5311_ADC_CH4_3F_OUTPUT_FORMAT,
+					   MA5311_ADC_OUTPUT_WORD_LENGTH_MASK,
+					   MA5311_ADC_WORD_LENGTH_24);
+			ma5311->dai_adc4_word_len = MA5311_ADC_WORD_LENGTH_24;
+
+			regmap_update_bits(ma5311->adc_regmap,
+					   MA5311_ADC_CH1_0F_OUTPUT_FORMAT,
+					   MA5311_ADC_OUTPUT_SCK_RATE_MASK,
+					   MA5311_ADC_SCK_RATE_24BIT_CFG);
+			ma5311->dai_adc1_sck_rate = MA5311_ADC_SCK_RATE_24BIT_CFG;
+			regmap_update_bits(ma5311->adc_regmap,
+					   MA5311_ADC_CH2_1F_OUTPUT_FORMAT,
+					   MA5311_ADC_OUTPUT_SCK_RATE_MASK,
+					   MA5311_ADC_SCK_RATE_24BIT_CFG);
+			ma5311->dai_adc2_sck_rate = MA5311_ADC_SCK_RATE_24BIT_CFG;
+			regmap_update_bits(ma5311->adc_regmap,
+					   MA5311_ADC_CH3_2F_OUTPUT_FORMAT,
+					   MA5311_ADC_OUTPUT_SCK_RATE_MASK,
+					   MA5311_ADC_SCK_RATE_24BIT_CFG);
+			ma5311->dai_adc3_sck_rate = MA5311_ADC_SCK_RATE_24BIT_CFG;
+			regmap_update_bits(ma5311->adc_regmap,
+					   MA5311_ADC_CH4_3F_OUTPUT_FORMAT,
+					   MA5311_ADC_OUTPUT_SCK_RATE_MASK,
+					   MA5311_ADC_SCK_RATE_24BIT_CFG);
+			ma5311->dai_adc4_sck_rate = MA5311_ADC_SCK_RATE_24BIT_CFG;
+			break;
+		default:
+			dev_err(component->dev,
+				"%s: unsupported PCM format: %d\n", __func__,
+				params_format(params));
+			return -EINVAL;
+		}
+
+		switch (ma5311->format) {
+		case SND_SOC_DAIFMT_I2S:
+			dev_info(component->dev, "Working in I2S TX Mode\n");
+			regmap_write(ma5311->ctrl_regmap,
+				     MA5311_DAC_39_DATA_PATH,
+				     MA5311_ADC_DATA_PATH_I2S);
+			ma5311->dai_data_path = MA5311_ADC_DATA_PATH_I2S;
+
+			regmap_write(ma5311->ctrl_regmap,
+				     MA5311_DAC_3A_TDM_SLOT_ENABLE,
+				     MA5311_TDM_SLOT_DISABLE_ALL);
+			ma5311->dai_tdm_slot_enable = MA5311_TDM_SLOT_DISABLE_ALL;
+
+			regmap_update_bits(ma5311->ctrl_regmap,
+					   MA5311_DAC_91_ADC_DAC_MIX,
+					   MA5311_DAC_ADC_DAC_MIX_CH_MASK,
+					   MA5311_ADC_MIX_CH0);
+			ma5311->dai_adc_mix_ch = MA5311_ADC_MIX_CH0;
+
+			regmap_update_bits(ma5311->ctrl_regmap,
+					   MA5311_DAC_A1_TOP_MAN1_FOR_SDO,
+					   MA5311_TOP_MAN1_O_FORMAT_MASK,
+					   MA5311_TOP_MAN1_O_FORMAT_I2S);
+			ma5311->dai_o_format = MA5311_TOP_MAN1_O_FORMAT_I2S;
+
+			break;
+
+		case SND_SOC_DAIFMT_DSP_A:
+			dev_info(component->dev, "Working in TDM TX Mode\n");
+			regmap_update_bits(ma5311->ctrl_regmap,
+					   MA5311_DAC_A1_TOP_MAN1_FOR_SDO,
+					   MA5311_TOP_MAN1_O_FORMAT_MASK,
+					   MA5311_TOP_MAN1_O_FORMAT_TDM);
+			ma5311->dai_o_format = MA5311_TOP_MAN1_O_FORMAT_TDM;
+
+			if (!ma5311->flag_dai_tdm) {
+				regmap_update_bits(ma5311->ctrl_regmap,
+						   MA5311_DAC_38_TDM2,
+						   MA5311_ADC_TDM2_SETTING_MASK,
+						   MA5311_DAC_38_CAPTURE_8CH_CFG);
+				ma5311->dai_tdm2_capture_cfg = MA5311_DAC_38_CAPTURE_8CH_CFG;
+
+				regmap_write(ma5311->ctrl_regmap,
+					     MA5311_DAC_39_DATA_PATH, MA5311_ADC_DATA_PATH_TDM_8CH);
+				ma5311->dai_data_path = MA5311_ADC_DATA_PATH_TDM_8CH;
+
+				regmap_write(ma5311->ctrl_regmap,
+					     MA5311_DAC_3A_TDM_SLOT_ENABLE,
+					     MA5311_TDM_SLOT_ENABLE_ALL);
+				ma5311->dai_tdm_slot_enable = MA5311_TDM_SLOT_ENABLE_ALL;
+			}
+
+			break;
+		}
+	}
+
+	return 0;
+}
+
+static int ma5311_dai_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
+{
+	struct snd_soc_component *component = dai->component;
+	struct ma5311_priv *ma5311 = snd_soc_component_get_drvdata(component);
+
+	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
+	case SND_SOC_DAIFMT_I2S:
+	case SND_SOC_DAIFMT_DSP_A:
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
+	case SND_SOC_DAIFMT_NB_NF:
+	case SND_SOC_DAIFMT_NB_IF:
+	case SND_SOC_DAIFMT_IB_NF:
+	case SND_SOC_DAIFMT_IB_IF:
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
+	case SND_SOC_DAIFMT_I2S:
+	case SND_SOC_DAIFMT_DSP_A:
+		break;
+
+	default:
+		return -EINVAL;
+	}
+
+	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
+	case SND_SOC_DAIFMT_CBC_CFC:
+		dev_dbg(component->dev, "BCLK and frame clock consumer\n");
+		regmap_update_bits(ma5311->ctrl_regmap,
+				   MA5311_DAC_01_INPUT1_CTRL1,
+				   MA5311_CONTROLLER_DEVICE_MASK,
+				   MA5311_DEVICE_MODE);
+		regmap_update_bits(ma5311->ctrl_regmap,
+				   MA5311_DAC_B8_TOP_MAN5,
+				   MA5311_LRCK_SCK_MAS_CLK_SEL_MASK,
+				   MA5311_LRCK_SCK_CLK_SLAVE_MODE);
+		ma5311->dai_clk_mode = MA5311_DEVICE_MODE;
+		ma5311->dai_mas_clk_sel = MA5311_LRCK_SCK_CLK_SLAVE_MODE;
+		break;
+
+	case SND_SOC_DAIFMT_CBP_CFP:
+		dev_dbg(component->dev, "BCLK and frame clock provider\n");
+		regmap_update_bits(ma5311->ctrl_regmap,
+				   MA5311_DAC_01_INPUT1_CTRL1,
+				   MA5311_CONTROLLER_DEVICE_MASK,
+				   MA5311_CONTROLLER_MODE);
+		regmap_update_bits(ma5311->ctrl_regmap,
+				   MA5311_DAC_B8_TOP_MAN5,
+				   MA5311_LRCK_SCK_MAS_CLK_SEL_MASK,
+				   MA5311_LRCK_SCK_CLK_MASTER_MODE);
+
+		ma5311->dai_clk_mode = MA5311_CONTROLLER_MODE;
+		ma5311->dai_mas_clk_sel = MA5311_LRCK_SCK_CLK_MASTER_MODE;
+		break;
+
+	default:
+		dev_err(component->dev,
+			"%s: Unsupported Controller/Device : 0x%x\n", __func__,
+			fmt);
+		return -EINVAL;
+	}
+
+	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
+	case SND_SOC_DAIFMT_NB_NF:
+		dev_dbg(component->dev, "Normal BCLK, normal frame clock\n");
+		regmap_update_bits(ma5311->ctrl_regmap,
+				   MA5311_DAC_01_INPUT1_CTRL1,
+				   MA5311_LEFTPOL_MASK |
+				   MA5311_SCK_RISING_MASK,
+				   MA5311_LOW_FIRST_CH |
+				   MA5311_SCK_FALLING_EDGE);
+		ma5311->dai_leftpol = MA5311_LOW_FIRST_CH;
+		ma5311->dai_sck_edge = MA5311_SCK_FALLING_EDGE;
+		break;
+
+	case SND_SOC_DAIFMT_NB_IF:
+		dev_dbg(component->dev, "Normal BCLK, inverted frame clock\n");
+		regmap_update_bits(ma5311->ctrl_regmap,
+				   MA5311_DAC_01_INPUT1_CTRL1,
+				   MA5311_LEFTPOL_MASK |
+				   MA5311_SCK_RISING_MASK,
+				   MA5311_HIGH_FIRST_CH |
+				   MA5311_SCK_FALLING_EDGE);
+		ma5311->dai_leftpol = MA5311_HIGH_FIRST_CH;
+		ma5311->dai_sck_edge = MA5311_SCK_FALLING_EDGE;
+		break;
+
+	case SND_SOC_DAIFMT_IB_NF:
+		dev_dbg(component->dev, "Inverted BCLK, normal frame clock\n");
+		regmap_update_bits(ma5311->ctrl_regmap,
+				   MA5311_DAC_01_INPUT1_CTRL1,
+				   MA5311_LEFTPOL_MASK |
+				   MA5311_SCK_RISING_MASK,
+				   MA5311_LOW_FIRST_CH |
+				   MA5311_SCK_RISING_EDGE);
+		ma5311->dai_leftpol = MA5311_LOW_FIRST_CH;
+		ma5311->dai_sck_edge = MA5311_SCK_RISING_EDGE;
+		break;
+
+	case SND_SOC_DAIFMT_IB_IF:
+		dev_dbg(component->dev,
+			"Inverted BCLK, inverted frame clock\n");
+		regmap_update_bits(ma5311->ctrl_regmap,
+				   MA5311_DAC_01_INPUT1_CTRL1,
+				   MA5311_LEFTPOL_MASK | MA5311_SCK_RISING_MASK,
+				   MA5311_HIGH_FIRST_CH |
+				   MA5311_SCK_RISING_EDGE);
+		ma5311->dai_leftpol = MA5311_HIGH_FIRST_CH;
+		ma5311->dai_sck_edge = MA5311_SCK_RISING_EDGE;
+		break;
+
+	default:
+		dev_err(component->dev,
+			"%s: Unsupported Bit & Frameclock : 0x%x\n", __func__,
+			fmt);
+		return -EINVAL;
+	}
+
+	ma5311->format = fmt & SND_SOC_DAIFMT_FORMAT_MASK;
+
+	return 0;
+}
+
+static int ma5311_dai_set_sysclk(struct snd_soc_dai *dai, int clk_id,
+				 unsigned int freq, int dir)
+{
+	struct snd_soc_component *component = dai->component;
+	struct ma5311_priv *ma5311 = snd_soc_component_get_drvdata(component);
+
+	switch (clk_id) {
+	case MA5311_PLL_CLKIN_BCLK:
+	case MA5311_INTERNAL_OSC:
+		if (clk_id == MA5311_PLL_CLKIN_BCLK)
+			dev_dbg(component->dev, "PLL input: BCLK\n");
+		break;
+
+	default:
+		dev_err(component->dev, "%s: Invalid clk id: %d\n", __func__,
+			clk_id);
+		return -EINVAL;
+	}
+
+	ma5311->sys_clk_id = clk_id;
+
+	return 0;
+}
+
+static int ma5311_dai_set_tdm_slot(struct snd_soc_dai *dai,
+				   unsigned int tx_mask, unsigned int rx_mask,
+				   int slots, int slot_width)
+{
+	struct snd_soc_component *component = dai->component;
+	struct ma5311_priv *ma5311 = snd_soc_component_get_drvdata(component);
+	unsigned int rx_val = MA5311_TDM_SLOT0_RX_POS_0 |
+			      MA5311_TDM_SLOT1_RX_POS_1;
+	int ret;
+
+	/* Reject invalid frame geometry before changing the hardware. */
+	switch (slot_width) {
+	case 16:
+	case 32:
+		break;
+	default:
+		dev_err(component->dev, "%s: unsupported TDM slot width: %d\n",
+			__func__, slot_width);
+		return -EINVAL;
+	}
+
+	switch (slots) {
+	case 8:
+		break;
+	default:
+		dev_err(component->dev, "%s: unsupported TDM slot count: %d\n",
+			__func__, slots);
+		return -EINVAL;
+	}
+
+	if (rx_mask & ~GENMASK(7, 0)) {
+		dev_err(component->dev,
+			"RX mask %#x exceeds %d slots\n", rx_mask, slots);
+		return -EINVAL;
+	}
+
+	if (tx_mask != 0 && tx_mask != GENMASK(7, 0))
+		return -EINVAL;
+
+	switch (rx_mask) {
+	case 0:
+		break;
+
+	case BIT(0) | BIT(1):
+		rx_val = MA5311_TDM_SLOT0_RX_POS_0 |
+			 MA5311_TDM_SLOT1_RX_POS_1;
+		break;
+
+	case BIT(2) | BIT(3):
+		rx_val = MA5311_TDM_SLOT0_RX_POS_2 |
+			 MA5311_TDM_SLOT1_RX_POS_3;
+		break;
+
+	case BIT(4) | BIT(5):
+		rx_val = MA5311_TDM_SLOT0_RX_POS_4 |
+			 MA5311_TDM_SLOT1_RX_POS_5;
+		break;
+
+	case BIT(6) | BIT(7):
+		rx_val = MA5311_TDM_SLOT0_RX_POS_6 |
+			 MA5311_TDM_SLOT1_RX_POS_7;
+		break;
+
+	default:
+		dev_err(component->dev, "Unsupported RX mask: %#x\n",
+			rx_mask);
+		return -EINVAL;
+	}
+
+	ret = regmap_update_bits(ma5311->ctrl_regmap,
+				 MA5311_DAC_37_TDM1,
+				 MA5311_TDM_SLOT0_RX_POS_MASK |
+				 MA5311_TDM_SLOT1_RX_POS_MASK,
+				 rx_val);
+	if (ret)
+		return ret;
+
+	ma5311->dai_tdm1_rx_pos = rx_val;
+
+	switch (tx_mask) {
+	case 0:
+		break;
+
+	case GENMASK(7, 0):
+		regmap_update_bits(ma5311->ctrl_regmap,
+				   MA5311_DAC_38_TDM2,
+				   MA5311_ADC_TDM2_SETTING_MASK,
+				   MA5311_DAC_38_CAPTURE_8CH_CFG);
+		ma5311->dai_tdm2_capture_cfg = MA5311_DAC_38_CAPTURE_8CH_CFG;
+
+		regmap_write(ma5311->ctrl_regmap,
+			     MA5311_DAC_39_DATA_PATH, MA5311_ADC_DATA_PATH_TDM_8CH);
+		ma5311->dai_data_path = MA5311_ADC_DATA_PATH_TDM_8CH;
+
+		regmap_write(ma5311->ctrl_regmap,
+			     MA5311_DAC_3A_TDM_SLOT_ENABLE,
+			     MA5311_TDM_SLOT_ENABLE_ALL);
+		ma5311->dai_tdm_slot_enable = MA5311_TDM_SLOT_ENABLE_ALL;
+		break;
+
+	default:
+		dev_err(component->dev, "Unsupported TX mask: %#x\n",
+			tx_mask);
+		return -EINVAL;
+	}
+
+	ma5311->frame_size = slots * slot_width;
+
+	dev_dbg(component->dev, "TDM slots=%d width=%d\n", slots, slot_width);
+
+	if (!ma5311->flag_dai_tdm)
+		ma5311->flag_dai_tdm = true;
+
+	return 0;
+}
+
+static int ma5311_dai_mute_stream(struct snd_soc_dai *dai, int mute, int stream)
+{
+	struct snd_soc_component *component = dai->component;
+	struct ma5311_priv *ma5311 = snd_soc_component_get_drvdata(component);
+	unsigned int val = MA5311_SPK_UNMUTE;
+	int ret;
+
+	if (stream == SNDRV_PCM_STREAM_CAPTURE)
+		return 0;
+
+	if (mute)
+		val = MA5311_SPK_MUTE;
+
+	ret = regmap_update_bits(ma5311->ctrl_regmap,
+				 MA5311_DAC_0E_MUTE_VOL_CTRL,
+				 MA5311_DAC_MUTE_VOL_MASK, val);
+	if (ret)
+		return ret;
+
+	ma5311->dai_spk_mute = val;
+
+	return 0;
+}
+
+static const struct snd_soc_dai_ops ma5311_dai_ops_amp = {
+	.hw_params = ma5311_dai_hw_params,
+	.set_fmt = ma5311_dai_set_fmt,
+	.set_sysclk = ma5311_dai_set_sysclk,
+	.set_tdm_slot = ma5311_dai_set_tdm_slot,
+	.mute_stream = ma5311_dai_mute_stream,
+};
+
+#define MA5311_RATES_PLAYBACK SNDRV_PCM_RATE_48000
+#define MA5311_RATES_CAPTURE SNDRV_PCM_RATE_48000
+#define MA5311_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S32_LE)
+
+static struct snd_soc_dai_driver ma5311_dai[] = {
+	{
+		.name = "ma5311-amplifier",
+		.id = 0,
+		.playback = {
+			.stream_name = "Playback",
+			.channels_min = 1,
+			.channels_max = 8,
+			.rates = MA5311_RATES_PLAYBACK,
+			.formats = MA5311_FORMATS,
+		},
+		.capture = {
+			.stream_name = "Capture",
+			.channels_min = 1,
+			.channels_max = 8,
+			.rates = MA5311_RATES_CAPTURE,
+			.formats = MA5311_FORMATS,
+		},
+		.ops = &ma5311_dai_ops_amp,
+		.symmetric_rate = 1,
+		.symmetric_sample_bits = 1,
+	},
+};
+
+static void ma5311_unregister_ancillary_client(void *data)
+{
+	struct i2c_client *client = data;
+
+	i2c_unregister_device(client);
+}
+
+static irqreturn_t ma5311_irq_thread(int irq, void *data)
+{
+	struct ma5311_priv *ma5311 = data;
+	unsigned int dac_status;
+	int ret = 0;
+
+	ret = regmap_read(ma5311->ctrl_regmap,
+			  MA5311_DAC_EA_DAC_STATUS, &dac_status);
+	if (ret) {
+		dev_err_ratelimited(ma5311->dev,
+				    "I2C Read Failed During Interrupt Handling\n");
+		return IRQ_NONE;
+	}
+
+	if (!(dac_status & MA5311_DAC_EA_FAULT_MASK))
+		return IRQ_NONE;
+
+	dev_err_ratelimited(ma5311->dev, "FAULT Asserted\n");
+
+	return IRQ_HANDLED;
+}
+
+static int ma5311_i2c_probe(struct i2c_client *client)
+{
+	struct ma5311_priv *ma5311;
+	int ret;
+	unsigned int irq_type;
+
+	ma5311 = devm_kzalloc(&client->dev, sizeof(*ma5311), GFP_KERNEL);
+	if (!ma5311)
+		return -ENOMEM;
+
+	ma5311->ctrl_regmap = devm_regmap_init_i2c(client,
+						   &ma5311_ctrl_regmap_config);
+	if (IS_ERR(ma5311->ctrl_regmap))
+		return dev_err_probe(&client->dev, PTR_ERR(ma5311->ctrl_regmap),
+				     "%s: Failed to allocate control regmap\n",
+				     __func__);
+
+	ma5311->adc_client = i2c_new_ancillary_device(client, "adc", 0x3f);
+	if (IS_ERR(ma5311->adc_client))
+		return dev_err_probe(&client->dev, PTR_ERR(ma5311->adc_client),
+				     "Failed to create ADC ancillary client\n");
+
+	ret = devm_add_action_or_reset(&client->dev,
+				       ma5311_unregister_ancillary_client,
+				       ma5311->adc_client);
+	if (ret)
+		return ret;
+
+	ma5311->adc_regmap = devm_regmap_init_i2c(ma5311->adc_client,
+						  &ma5311_adc_regmap_config);
+	if (IS_ERR(ma5311->adc_regmap))
+		return dev_err_probe(&client->dev, PTR_ERR(ma5311->adc_regmap),
+				     "Failed to allocate ADC regmap\n");
+
+	ma5311->reset_gpio = devm_gpiod_get_optional(&client->dev, "reset",
+						     GPIOD_OUT_LOW);
+	if (IS_ERR(ma5311->reset_gpio))
+		return dev_err_probe(&client->dev, PTR_ERR(ma5311->reset_gpio),
+				     "Failed to acquire reset GPIO\n");
+
+	if (ma5311->reset_gpio)
+		msleep(MA5311_RESET_RECOVERY_MS);
+
+	ma5311->amp_mode = MA5311_MONO_BOTH_MODE;
+	ma5311->num_of_pll_matches = ARRAY_SIZE(ma5311_pll_matches);
+	ma5311->pll_matches = ma5311_pll_matches;
+	ma5311->format = SND_SOC_DAIFMT_I2S;
+	ma5311->sys_clk_id = MA5311_PLL_CLKIN_BCLK;
+	ma5311->dev = &client->dev;
+	ma5311->frame_size = 0;
+	ma5311->dai_sys_clk = 0;
+	ma5311->dai_mas_clk_sel = MA5311_LRCK_SCK_CLK_SLAVE_MODE;
+	ma5311->dai_adc_clk = 0;
+	ma5311->dai_adc_mix_ch = MA5311_ADC_MIX_CH0;
+	ma5311->dai_clk_mode = MA5311_DEVICE_MODE;
+	ma5311->dai_leftpol = MA5311_LOW_FIRST_CH;
+	ma5311->dai_sck_edge = MA5311_SCK_FALLING_EDGE;
+	ma5311->dai_spk_mute = MA5311_SPK_MUTE;
+	ma5311->dai_tdm1_rx_pos = MA5311_TDM_SLOT0_RX_POS_0 |
+				  MA5311_TDM_SLOT1_RX_POS_1;
+	ma5311->dai_tdm2_data_len = MA5311_DAC_38_DATA_LEN_16;
+	ma5311->dai_tdm2_capture_cfg = MA5311_DAC_38_CAPTURE_8CH_CFG;
+	ma5311->dai_data_path = MA5311_ADC_DATA_PATH_CH0;
+	ma5311->dai_tdm_slot_enable = MA5311_TDM_SLOT_DISABLE_ALL;
+	ma5311->dai_pll_input = MA5311_DAC_PLLIN_EXT_OSC |
+				MA5311_DAC_PLL_REF_EXT_CLK |
+				MA5311_DAC_PLL_REF_CLK2_SCK;
+	ma5311->dai_pll_post_n = MA5311_PLL_POST_N_DEFAULT;
+	ma5311->dai_pll_n = MA5311_PLL_N_DEFAULT;
+	ma5311->dai_pll_f1 = MA5311_PLL_F1_DEFAULT;
+	ma5311->dai_pll_f2 = MA5311_PLL_F2_DEFAULT;
+	ma5311->dai_pll_f3_p_cp = MA5311_PLL_F3_P_CP_DEFAULT;
+	ma5311->dai_sdo_len = MA5311_TOP_MAN1_SDO_16B;
+	ma5311->dai_sck_rate = MA5311_DAC_A1_SCK_RATE_32FS;
+	ma5311->dai_o_format = MA5311_TOP_MAN1_O_FORMAT_I2S;
+	ma5311->dai_adc1_word_len = MA5311_ADC_WORD_LENGTH_24;
+	ma5311->dai_adc1_sck_rate = MA5311_ADC_SCK_RATE_24BIT_CFG;
+	ma5311->dai_adc2_word_len = MA5311_ADC_WORD_LENGTH_24;
+	ma5311->dai_adc2_sck_rate = MA5311_ADC_SCK_RATE_24BIT_CFG;
+	ma5311->dai_adc3_word_len = MA5311_ADC_WORD_LENGTH_24;
+	ma5311->dai_adc3_sck_rate = MA5311_ADC_SCK_RATE_24BIT_CFG;
+	ma5311->dai_adc4_word_len = MA5311_ADC_WORD_LENGTH_24;
+	ma5311->dai_adc4_sck_rate = MA5311_ADC_SCK_RATE_24BIT_CFG;
+	ma5311->flag_ext_rst = false;
+	ma5311->flag_dai_tdm = false;
+	i2c_set_clientdata(client, ma5311);
+
+	ret = devm_snd_soc_register_component(&client->dev, &ma5311_component,
+					      ma5311_dai, 1);
+	if (ret) {
+		dev_err(&client->dev, "Failed to register component: %d\n",
+			ret);
+		return ret;
+	}
+
+	if (client->irq > 0) {
+		irq_type = irq_get_trigger_type(client->irq);
+		if (irq_type != IRQ_TYPE_EDGE_FALLING)
+			return dev_err_probe(&client->dev, -EINVAL,
+					     "Falling-edge IRQ required\n");
+
+		ret = devm_request_threaded_irq(&client->dev, client->irq, NULL,
+						ma5311_irq_thread, IRQF_ONESHOT,
+						"ma5311", ma5311);
+		if (ret)
+			return dev_err_probe(&client->dev, ret,
+					     "Failed to request IRQ %d\n",
+					     client->irq);
+	} else {
+		dev_warn(&client->dev, "No IRQ configured\n");
+	}
+
+	return ret;
+}
+
+static const struct i2c_device_id ma5311_i2c_id[] = {
+	{ .name = "ma5311", .driver_data = 0 },
+	{ }
+};
+
+MODULE_DEVICE_TABLE(i2c, ma5311_i2c_id);
+
+static const struct of_device_id ma5311_of_match[] = {
+	{ .compatible = "irondevice,ma5311" },
+	{ }
+};
+
+MODULE_DEVICE_TABLE(of, ma5311_of_match);
+
+static struct i2c_driver ma5311_i2c_driver = {
+	.driver = {
+		.name = "ma5311",
+		.of_match_table = ma5311_of_match,
+	},
+	.probe = ma5311_i2c_probe,
+	.id_table = ma5311_i2c_id,
+};
+
+module_i2c_driver(ma5311_i2c_driver);
+
+MODULE_DESCRIPTION("ALSA SoC MA5311 driver");
+MODULE_AUTHOR("Hyunuk Son, <hyunuk.son@irondevice.com>");
+MODULE_LICENSE("GPL");
diff --git a/sound/soc/codecs/ma5311.h b/sound/soc/codecs/ma5311.h
new file mode 100644
index 000000000000..2470124e4290
--- /dev/null
+++ b/sound/soc/codecs/ma5311.h
@@ -0,0 +1,558 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * ma5311.h -- MA5311 ALSA SoC codec register definitions
+ */
+
+#ifndef _MA5311_H
+#define _MA5311_H
+
+#include <linux/bits.h>
+
+/* DAC/control and ADC registers use separate I2C banks. */
+
+/* I2C addresses */
+#define MA5311_ADC_I2C_ADDR_00	0x3f
+#define MA5311_ADC_I2C_ADDR_01	0x4f
+#define MA5311_ADC_I2C_ADDR_10	0x5f
+#define MA5311_ADC_I2C_ADDR_11	0x6f
+
+#define MA5311_I2C_RETRY_COUNT	3
+
+/* DAC and control register addresses */
+#define MA5311_DAC_00_SYSTEM_CTRL1		0x00
+#define MA5311_DAC_01_INPUT1_CTRL1		0x01
+#define MA5311_DAC_02_INPUT1_CTRL2		0x02
+#define MA5311_DAC_03_INPUT1_CTRL3		0x03
+#define MA5311_DAC_04_INPUT1_CTRL4		0x04
+#define MA5311_DAC_05_ADC_DAC_MIX2		0x05
+#define MA5311_DAC_09_OUTPUT_CTRL		0x09
+#define MA5311_DAC_0A_SPK_VOL_L			0x0a
+#define MA5311_DAC_0B_SPK_VOL_R			0x0b
+#define MA5311_DAC_0E_MUTE_VOL_CTRL		0x0e
+#define MA5311_DAC_0F_SYSTEM_CTRL2		0x0f
+#define MA5311_DAC_10_SYSTEM_CTRL3		0x10
+#define MA5311_DAC_11_SYSTEM_CTRL4		0x11
+#define MA5311_DAC_12_SYSTEM_CTRL5		0x12
+#define MA5311_DAC_14_MODULATOR2		0x14
+#define MA5311_DAC_15_BASS_SPK1			0x15
+#define MA5311_DAC_16_BASS_SPK2			0x16
+#define MA5311_DAC_17_BASS_SPK3			0x17
+#define MA5311_DAC_18_BASS_SPK4			0x18
+#define MA5311_DAC_19_BASS_SPK5			0x19
+#define MA5311_DAC_1A_BASS_SPK6			0x1a
+#define MA5311_DAC_1B_BASS_SPK7			0x1b
+#define MA5311_DAC_23_COMP_LIM1			0x23
+#define MA5311_DAC_24_COMP_LIM2			0x24
+#define MA5311_DAC_25_COMP_LIM3			0x25
+#define MA5311_DAC_26_COMP_LIM4			0x26
+#define MA5311_DAC_2B_EQ_MODE			0x2b
+#define MA5311_DAC_2C_EQ_GRAPHIC1		0x2c
+#define MA5311_DAC_2D_EQ_GRAPHIC2		0x2d
+#define MA5311_DAC_2E_EQ_GRAPHIC3		0x2e
+#define MA5311_DAC_2F_EQ_GRAPHIC4		0x2f
+#define MA5311_DAC_30_EQ_GRAPHIC5		0x30
+#define MA5311_DAC_33_FLL_CTRL3			0x33
+#define MA5311_DAC_34_EQ_CTRL			0x34
+#define MA5311_DAC_35_POST_DRC_CTRL		0x35
+#define MA5311_DAC_36_PROTECTION		0x36
+#define MA5311_DAC_37_TDM1			0x37
+#define MA5311_DAC_38_TDM2			0x38
+#define MA5311_DAC_39_DATA_PATH			0x39
+#define MA5311_DAC_3A_TDM_SLOT_ENABLE		0x3a
+#define MA5311_DAC_3B_TEST1			0x3b
+#define MA5311_DAC_3C_TEST2			0x3c
+#define MA5311_DAC_3D_TEST3			0x3d
+#define MA5311_DAC_40_EQ_CTRL1			0x40
+#define MA5311_DAC_41_EQ_CTRL2			0x41
+#define MA5311_DAC_42_EQ_CTRL3			0x42
+#define MA5311_DAC_43_EQ_CTRL4			0x43
+#define MA5311_DAC_44_EQ_CTRL5			0x44
+#define MA5311_DAC_45_EQ_CTRL6			0x45
+#define MA5311_DAC_46_EQ_CTRL7			0x46
+#define MA5311_DAC_47_EQ_CTRL8			0x47
+#define MA5311_DAC_48_EQ_CTRL9			0x48
+#define MA5311_DAC_49_EQ_CTRL10			0x49
+#define MA5311_DAC_4A_EQ_CTRL11			0x4a
+#define MA5311_DAC_4B_EQ_CTRL12			0x4b
+#define MA5311_DAC_4C_EQ_CTRL13			0x4c
+#define MA5311_DAC_4D_EQ_CTRL14			0x4d
+#define MA5311_DAC_4E_EQ_CTRL15			0x4e
+#define MA5311_DAC_4F_EQ_CTRL16			0x4f
+#define MA5311_DAC_50_EQ_CTRL17			0x50
+#define MA5311_DAC_51_EQ_CTRL18			0x51
+#define MA5311_DAC_52_EQ_CTRL19			0x52
+#define MA5311_DAC_53_EQ_CTRL20			0x53
+#define MA5311_DAC_54_EQ_CTRL21			0x54
+#define MA5311_DAC_55_EQ_CTRL22			0x55
+#define MA5311_DAC_56_EQ_CTRL23			0x56
+#define MA5311_DAC_57_EQ_CTRL24			0x57
+#define MA5311_DAC_58_EQ_CTRL25			0x58
+#define MA5311_DAC_59_EQ_CTRL26			0x59
+#define MA5311_DAC_5A_EQ_CTRL27			0x5a
+#define MA5311_DAC_5B_EQ_CTRL28			0x5b
+#define MA5311_DAC_5C_EQ_CTRL29			0x5c
+#define MA5311_DAC_5D_EQ_CTRL30			0x5d
+#define MA5311_DAC_5E_EQ_CTRL31			0x5e
+#define MA5311_DAC_5F_EQ_CTRL32			0x5f
+#define MA5311_DAC_60_EQ_CTRL33			0x60
+#define MA5311_DAC_61_EQ_CTRL34			0x61
+#define MA5311_DAC_62_EQ_CTRL35			0x62
+#define MA5311_DAC_63_EQ_CTRL36			0x63
+#define MA5311_DAC_64_EQ_CTRL37			0x64
+#define MA5311_DAC_65_EQ_CTRL38			0x65
+#define MA5311_DAC_66_EQ_CTRL39			0x66
+#define MA5311_DAC_67_EQ_CTRL40			0x67
+#define MA5311_DAC_68_EQ_CTRL41			0x68
+#define MA5311_DAC_69_EQ_CTRL42			0x69
+#define MA5311_DAC_6A_EQ_CTRL43			0x6a
+#define MA5311_DAC_6B_EQ_CTRL44			0x6b
+#define MA5311_DAC_6C_EQ_CTRL45			0x6c
+#define MA5311_DAC_6D_EQ_CTRL46			0x6d
+#define MA5311_DAC_6E_EQ_CTRL47			0x6e
+#define MA5311_DAC_6F_EQ_CTRL48			0x6f
+#define MA5311_DAC_70_EQ_CTRL49			0x70
+#define MA5311_DAC_71_EQ_CTRL50			0x71
+#define MA5311_DAC_72_EQ_CTRL51			0x72
+#define MA5311_DAC_73_EQ_CTRL52			0x73
+#define MA5311_DAC_74_EQ_CTRL53			0x74
+#define MA5311_DAC_75_EQ_CTRL54			0x75
+#define MA5311_DAC_76_EQ_CTRL55			0x76
+#define MA5311_DAC_77_EQ_CTRL56			0x77
+#define MA5311_DAC_78_EQ_CTRL57			0x78
+#define MA5311_DAC_79_EQ_CTRL58			0x79
+#define MA5311_DAC_7A_EQ_CTRL59			0x7a
+#define MA5311_DAC_7B_EQ_CTRL60			0x7b
+#define MA5311_DAC_7C_EQ_CTRL61			0x7c
+#define MA5311_DAC_7D_EQ_CTRL62			0x7d
+#define MA5311_DAC_7E_EQ_CTRL63			0x7e
+#define MA5311_DAC_7F_EQ_CTRL64			0x7f
+#define MA5311_DAC_80_EQ_CTRL65			0x80
+#define MA5311_DAC_81_EQ_CTRL66			0x81
+#define MA5311_DAC_82_EQ_CTRL67			0x82
+#define MA5311_DAC_83_EQ_CTRL68			0x83
+#define MA5311_DAC_84_EQ_CTRL69			0x84
+#define MA5311_DAC_85_EQ_CTRL70			0x85
+#define MA5311_DAC_86_EQ_CTRL71			0x86
+#define MA5311_DAC_87_EQ_CTRL72			0x87
+#define MA5311_DAC_88_EQ_CTRL73			0x88
+#define MA5311_DAC_89_EQ_CTRL74			0x89
+#define MA5311_DAC_8A_EQ_CTRL75			0x8a
+#define MA5311_DAC_8B_PLL_POST_N		0x8b
+#define MA5311_DAC_8C_PLL_N			0x8c
+#define MA5311_DAC_8D_PLL_F1			0x8d
+#define MA5311_DAC_8E_PLL_F2			0x8e
+#define MA5311_DAC_8F_PLL_F3_P_CP		0x8f
+#define MA5311_DAC_91_ADC_DAC_MIX		0x91
+#define MA5311_DAC_A1_TOP_MAN1_FOR_SDO		0xa1
+#define MA5311_DAC_A2_TOP_MAN2			0xa2
+#define MA5311_DAC_A3_TOP_MAN3			0xa3
+#define MA5311_DAC_A4_BLOCK_CONTROL		0xa4
+#define MA5311_DAC_A5_VALUE_CONTROL		0xa5
+#define MA5311_DAC_A6_VALUE_CONTROL2		0xa6
+#define MA5311_DAC_A7_DT_CONTROL		0xa7
+#define MA5311_DAC_A8_SLOPE_CONTROL		0xa8
+#define MA5311_DAC_A9_FDPEC_CONTROL		0xa9
+#define MA5311_DAC_AA_LDO_CONTROL		0xaa
+#define MA5311_DAC_AB_PRESCALER			0xab
+#define MA5311_DAC_AC_MBD_COMP_LIM1		0xac
+#define MA5311_DAC_AD_MBD_COMP_LIM2		0xad
+#define MA5311_DAC_AE_MBD_COMP_LIM3		0xae
+#define MA5311_DAC_AF_MBD_COMP_LIM4		0xaf
+#define MA5311_DAC_B0_BPD_COMP_LIM1		0xb0
+#define MA5311_DAC_B1_BPD_COMP_LIM2		0xb1
+#define MA5311_DAC_B2_BPD_COMP_LIM3		0xb2
+#define MA5311_DAC_B3_BPD_COMP_LIM4		0xb3
+#define MA5311_DAC_B4_DSP_SPK_CTRL		0xb4
+#define MA5311_DAC_B5_MCLKO_TEST		0xb5
+#define MA5311_DAC_B7_TOP_MAN4			0xb7
+#define MA5311_DAC_B8_TOP_MAN5			0xb8
+#define MA5311_DAC_B9_PLL_A_SETTING		0xb9
+#define MA5311_DAC_BB_CLASS_G_LEVEL1		0xbb
+#define MA5311_DAC_BC_CLASS_G_LEVEL2		0xbc
+#define MA5311_DAC_BD_TONE_GENERATOR		0xbd
+#define MA5311_DAC_BE_TONE_FINE_VOLUME		0xbe
+#define MA5311_DAC_BF_POWER_METER		0xbf
+#define MA5311_DAC_EA_DAC_STATUS		0xea
+#define MA5311_DAC_EB_DAC_OCP_STATUS		0xeb
+#define MA5311_DAC_EC_DAC_SCP_STATUS		0xec
+#define MA5311_DAC_FB_STATUS2			0xfb
+#define MA5311_DAC_FC_STATUS3			0xfc
+#define MA5311_DAC_FD_POWER_METER_DISPLAY	0xfd
+#define MA5311_DAC_FF_VERSION			0xff
+
+/* DAC/control register masks and values */
+
+#define MA5311_POWER_MASK	BIT(0)
+#define MA5311_POWER_OFF	0
+#define MA5311_POWER_ON		BIT(0)
+
+#define MA5311_DAC_MUTE_VOL_MASK	GENMASK(1, 0)
+#define MA5311_SPK_MUTE			0x03
+#define MA5311_SPK_UNMUTE		0x00
+
+/* 0x10: Speaker mode */
+#define MA5311_SPK_MODE_MASK	GENMASK(4, 2)
+#define MA5311_SPK_MONO_LEFT	0x02
+#define MA5311_SPK_MONO_RIGHT	0x04
+#define MA5311_SPK_MONO_BOTH	0x0c
+#define MA5311_SPK_STEREO	0x10
+#define MA5311_SPK_OFF		0x00
+
+/* 0x37: TDM receive slot positions */
+#define MA5311_TDM_SLOT0_RX_POS_MASK	GENMASK(5, 3)
+#define MA5311_TDM_SLOT0_RX_POS_0	0x00
+#define MA5311_TDM_SLOT0_RX_POS_1	0x08
+#define MA5311_TDM_SLOT0_RX_POS_2	0x10
+#define MA5311_TDM_SLOT0_RX_POS_3	0x18
+#define MA5311_TDM_SLOT0_RX_POS_4	0x20
+#define MA5311_TDM_SLOT0_RX_POS_5	0x28
+#define MA5311_TDM_SLOT0_RX_POS_6	0x30
+#define MA5311_TDM_SLOT0_RX_POS_7	0x38
+
+#define MA5311_TDM_SLOT1_RX_POS_MASK	GENMASK(2, 0)
+#define MA5311_TDM_SLOT1_RX_POS_0	0x00
+#define MA5311_TDM_SLOT1_RX_POS_1	0x01
+#define MA5311_TDM_SLOT1_RX_POS_2	0x02
+#define MA5311_TDM_SLOT1_RX_POS_3	0x03
+#define MA5311_TDM_SLOT1_RX_POS_4	0x04
+#define MA5311_TDM_SLOT1_RX_POS_5	0x05
+#define MA5311_TDM_SLOT1_RX_POS_6	0x06
+#define MA5311_TDM_SLOT1_RX_POS_7	0x07
+
+#define MA5311_TDM_N_SLOT_MASK	BIT(6)
+#define MA5311_TDM_N_SLOT_4	0
+#define MA5311_TDM_N_SLOT_8	BIT(6)
+
+#define MA5311_TDM_SLOT0_TX_POS_MASK	GENMASK(5, 3)
+#define MA5311_TDM_SLOT0_TX_POS_0	0x00
+#define MA5311_TDM_SLOT0_TX_POS_1	0x08
+#define MA5311_TDM_SLOT0_TX_POS_2	0x10
+#define MA5311_TDM_SLOT0_TX_POS_3	0x18
+#define MA5311_TDM_SLOT0_TX_POS_4	0x20
+#define MA5311_TDM_SLOT0_TX_POS_5	0x28
+#define MA5311_TDM_SLOT0_TX_POS_6	0x30
+#define MA5311_TDM_SLOT0_TX_POS_7	0x38
+
+#define MA5311_TDM_SLOT1_TX_POS_MASK	GENMASK(2, 0)
+#define MA5311_TDM_SLOT1_TX_POS_0	0x00
+#define MA5311_TDM_SLOT1_TX_POS_1	0x01
+#define MA5311_TDM_SLOT1_TX_POS_2	0x02
+#define MA5311_TDM_SLOT1_TX_POS_3	0x03
+#define MA5311_TDM_SLOT1_TX_POS_4	0x04
+#define MA5311_TDM_SLOT1_TX_POS_5	0x05
+#define MA5311_TDM_SLOT1_TX_POS_6	0x06
+#define MA5311_TDM_SLOT1_TX_POS_7	0x07
+
+#define MA5311_ADC_TDM2_SETTING_MASK	GENMASK(6, 0)
+
+/* 0x39: SDO data path */
+#define MA5311_DAC_SDO_DATA_PATH_MASK	GENMASK(3, 2)
+
+/* 0x91: ADC-to-DAC mix */
+#define MA5311_DAC_ADC_DAC_MIX_CH_MASK	GENMASK(1, 0)
+
+/* 0xA1: SDO output format and word length */
+#define MA5311_TOP_MAN1_O_FORMAT_MASK	GENMASK(7, 5)
+#define MA5311_TOP_MAN1_O_FORMAT_I2S	0x40
+#define MA5311_TOP_MAN1_O_FORMAT_TDM	0x80
+#define MA5311_TOP_MAN1_SOO_LENGTH_MASK	GENMASK(2, 1)
+#define MA5311_TOP_MAN1_SDO_16B		0x04
+#define MA5311_TOP_MAN1_SDO_24B		0x00
+
+/* 0xA2: PLL power */
+#define MA5311_PLL_MASK	BIT(6)
+#define MA5311_PLL_ON	0
+#define MA5311_PLL_OFF	BIT(6)
+
+/* 0xFF: Device identification and revision */
+#define MA5311_DAC_VERSION_MASK	GENMASK(7, 0)
+#define MA5311_DEVICE_ID	0x0bU
+#define MA5311_REV_NUM_STATUS	GENMASK(7, 0)
+
+/* ADC register addresses */
+/* ADC CH1(L/R) */
+/* General Settings */
+#define MA5311_ADC_CH1_00_GENERAL_SETTING	0x00
+#define MA5311_ADC_CH1_01_DMIC_ALC1		0x01
+#define MA5311_ADC_CH1_02_ALC2			0x02
+#define MA5311_ADC_CH1_03_ALC3			0x03
+#define MA5311_ADC_CH1_04_ALC4			0x04
+#define MA5311_ADC_CH1_05_ALC5			0x05
+#define MA5311_ADC_CH1_06_ALC6			0x06
+#define MA5311_ADC_CH1_07_VOLUME_LEFT		0x07
+#define MA5311_ADC_CH1_08_VOLUME_RIGHT		0x08
+#define MA5311_ADC_CH1_09_PGA_LEFT		0x09
+#define MA5311_ADC_CH1_0A_PGA_RIGHT		0x0a
+#define MA5311_ADC_CH1_0B_AFE			0x0b
+#define MA5311_ADC_CH1_0C_VOLUME_BOOST_LINE1	0x0c
+#define MA5311_ADC_CH1_0D_VOLUME_BOOST_LINE2	0x0d
+#define MA5311_ADC_CH1_0E_MUTE_DATA_FLOW	0x0e
+#define MA5311_ADC_CH1_0F_OUTPUT_FORMAT		0x0f
+
+/* ADC CH2(L/R) */
+#define MA5311_ADC_CH2_10_GENERAL_SETTING	0x10
+#define MA5311_ADC_CH2_11_DMIC_ALC1		0x11
+#define MA5311_ADC_CH2_12_ALC2			0x12
+#define MA5311_ADC_CH2_13_ALC3			0x13
+#define MA5311_ADC_CH2_14_ALC4			0x14
+#define MA5311_ADC_CH2_15_ALC5			0x15
+#define MA5311_ADC_CH2_16_ALC6			0x16
+#define MA5311_ADC_CH2_17_VOLUME_LEFT		0x17
+#define MA5311_ADC_CH2_18_VOLUME_RIGHT		0x18
+#define MA5311_ADC_CH2_19_PGA_LEFT		0x19
+#define MA5311_ADC_CH2_1A_PGA_RIGHT		0x1a
+#define MA5311_ADC_CH2_1B_AFE			0x1b
+#define MA5311_ADC_CH2_1C_VOLUME_BOOST_LINE1	0x1c
+#define MA5311_ADC_CH2_1D_VOLUME_BOOST_LINE2	0x1d
+#define MA5311_ADC_CH2_1E_MUTE_DATA_FLOW	0x1e
+#define MA5311_ADC_CH2_1F_OUTPUT_FORMAT		0x1f
+
+/* ADC CH3(L/R) */
+#define MA5311_ADC_CH3_20_GENERAL_SETTING	0x20
+#define MA5311_ADC_CH3_21_DMIC_ALC1		0x21
+#define MA5311_ADC_CH3_22_ALC2			0x22
+#define MA5311_ADC_CH3_23_ALC3			0x23
+#define MA5311_ADC_CH3_24_ALC4			0x24
+#define MA5311_ADC_CH3_25_ALC5			0x25
+#define MA5311_ADC_CH3_26_ALC6			0x26
+#define MA5311_ADC_CH3_27_VOLUME_LEFT		0x27
+#define MA5311_ADC_CH3_28_VOLUME_RIGHT		0x28
+#define MA5311_ADC_CH3_29_PGA_LEFT		0x29
+#define MA5311_ADC_CH3_2A_PGA_RIGHT		0x2a
+#define MA5311_ADC_CH3_2B_AFE			0x2b
+#define MA5311_ADC_CH3_2C_VOLUME_BOOST_LINE1	0x2c
+#define MA5311_ADC_CH3_2D_VOLUME_BOOST_LINE2	0x2d
+#define MA5311_ADC_CH3_2E_MUTE_DATA_FLOW	0x2e
+#define MA5311_ADC_CH3_2F_OUTPUT_FORMAT		0x2f
+
+/* ADC CH4(L/R) */
+#define MA5311_ADC_CH4_30_GENERAL_SETTING	0x30
+#define MA5311_ADC_CH4_31_DMIC_ALC1		0x31
+#define MA5311_ADC_CH4_32_ALC2			0x32
+#define MA5311_ADC_CH4_33_ALC3			0x33
+#define MA5311_ADC_CH4_34_ALC4			0x34
+#define MA5311_ADC_CH4_35_ALC5			0x35
+#define MA5311_ADC_CH4_36_ALC6			0x36
+#define MA5311_ADC_CH4_37_VOLUME_LEFT		0x37
+#define MA5311_ADC_CH4_38_VOLUME_RIGHT		0x38
+#define MA5311_ADC_CH4_39_PGA_LEFT		0x39
+#define MA5311_ADC_CH4_3A_PGA_RIGHT		0x3a
+#define MA5311_ADC_CH4_3B_AFE			0x3b
+#define MA5311_ADC_CH4_3C_VOLUME_BOOST_LINE1	0x3c
+#define MA5311_ADC_CH4_3D_VOLUME_BOOST_LINE2	0x3d
+#define MA5311_ADC_CH4_3E_MUTE_DATA_FLOW	0x3e
+#define MA5311_ADC_CH4_3F_OUTPUT_FORMAT		0x3f
+
+/* ADC register masks and values */
+#define MA5311_ADC_HPF_ENABLE_MASK	BIT(7)
+#define MA5311_ADC_OSR_SDM_MASK		BIT(6)
+#define MA5311_ADC_SAMPLE_RATE_MASK	GENMASK(4, 2)
+#define MA5311_ADC_SAMPLE_RATE_192K	0x00U
+#define MA5311_ADC_SAMPLE_RATE_96K	0x04U
+#define MA5311_ADC_SAMPLE_RATE_48K	0x08U
+#define MA5311_ADC_SAMPLE_RATE_24K	0x10U
+#define MA5311_ADC_SAMPLE_RATE_12K	0x18U
+#define MA5311_ADC_OSR_DEC_MASK		BIT(1)
+#define MA5311_ADC_POWER_MASK		BIT(0)
+#define MA5311_ADC_POWER_ON		0U
+#define MA5311_ADC_POWER_DOWN		BIT(0)
+
+#define MA5311_ADC_SYSCLK_MASK		GENMASK(7, 6)
+#define MA5311_ADC_DMIC_CLOCK_MASK	BIT(5)
+#define MA5311_ADC_DMIC_MODE_MASK	BIT(4)
+#define MA5311_ADC_ALC_SELECT_MASK	GENMASK(1, 0)
+
+#define MA5311_ADC_VOL_CTRL_MASK	GENMASK(7, 0)
+#define MA5311_ADC_PGA_CTRL_MASK	GENMASK(5, 0)
+
+#define MA5311_ADC_LRCK_POL_MASK	BIT(7)
+#define MA5311_ADC_SCK_POL_MASK		BIT(6)
+#define MA5311_ADC_SWAP_LR_MASK		BIT(5)
+#define MA5311_ADC_MUTE_SLOPE_MASK	GENMASK(4, 3)
+#define MA5311_ADC_MUTE_RIGHT_MASK	BIT(2)
+#define MA5311_ADC_MUTE_LEFT_MASK	BIT(1)
+
+#define MA5311_ADC_LEFT_MUTE	BIT(1)
+#define MA5311_ADC_LEFT_DEMUTE	0
+#define MA5311_ADC_RIGHT_MUTE	BIT(2)
+#define MA5311_ADC_RIGHT_DEMUTE	0
+
+#define MA5311_ADC_MUTE_BOTH_MASK	GENMASK(2, 1)
+#define MA5311_ADC_BOTH_MUTE		0x06
+#define MA5311_ADC_BOTH_DEMUTE		0x00
+
+#define MA5311_ADC_OUTPUT_MASTER_MASK		BIT(7)
+#define MA5311_ADC_OUTPUT_SCK_RATE_MASK		GENMASK(6, 5)
+#define MA5311_ADC_OUTPUT_WORD_LENGTH_MASK	GENMASK(4, 3)
+#define MA5311_ADC_OUTPUT_FORMAT_MASK		GENMASK(2, 0)
+#define MA5311_ADC_OUTPUT_FORMAT_RJ		0x00U
+#define MA5311_ADC_OUTPUT_FORMAT_LJ		0x01U
+#define MA5311_ADC_OUTPUT_FORMAT_I2S		0x02U
+#define MA5311_ADC_OUTPUT_FORMAT_SPI		0x03U
+#define MA5311_ADC_OUTPUT_FORMAT_PCM_SHORT	0x04U
+
+#define MA5311_ADC_WORD_LENGTH_24	0x00
+#define MA5311_ADC_WORD_LENGTH_16	0x18
+
+#define MA5311_PLL_CLKIN_BCLK	0x00
+#define MA5311_INTERNAL_OSC	0x01
+#define MA5311_DUMMY_BCLK	0
+#define MA5311_INT_OSC_POST_N	0x07
+#define MA5311_INT_OSC_N	0x70
+#define MA5311_INT_OSC_F1	0x00
+#define MA5311_INT_OSC_F2	0x00
+#define MA5311_INT_OSC_F3_P_CP	0x0b
+
+#define MA5311_RESET_CTRL_NAME		"Reset Command"
+#define MA5311_LEFT_VOL_CTRL_NAME	"Left Speaker Volume"
+#define MA5311_RIGHT_VOL_CTRL_NAME	"Right Speaker Volume"
+
+#define MA5311_ADC1_LEFT_VOL_CTRL_NAME	"ADC1 Left Volume"
+#define MA5311_ADC1_RIGHT_VOL_CTRL_NAME	"ADC1 Right Volume"
+#define MA5311_ADC1_LEFT_PGA_CTRL_NAME	"ADC1 Left PGA"
+#define MA5311_ADC1_RIGHT_PGA_CTRL_NAME	"ADC1 Right PGA"
+
+#define MA5311_ADC2_LEFT_VOL_CTRL_NAME	"ADC2 Left Volume"
+#define MA5311_ADC2_RIGHT_VOL_CTRL_NAME	"ADC2 Right Volume"
+#define MA5311_ADC2_LEFT_PGA_CTRL_NAME	"ADC2 Left PGA"
+#define MA5311_ADC2_RIGHT_PGA_CTRL_NAME	"ADC2 Right PGA"
+
+#define MA5311_ADC3_LEFT_VOL_CTRL_NAME	"ADC3 Left Volume"
+#define MA5311_ADC3_RIGHT_VOL_CTRL_NAME	"ADC3 Right Volume"
+#define MA5311_ADC3_LEFT_PGA_CTRL_NAME	"ADC3 Left PGA"
+#define MA5311_ADC3_RIGHT_PGA_CTRL_NAME	"ADC3 Right PGA"
+
+#define MA5311_ADC4_LEFT_VOL_CTRL_NAME	"ADC4 Left Volume"
+#define MA5311_ADC4_RIGHT_VOL_CTRL_NAME	"ADC4 Right Volume"
+#define MA5311_ADC4_LEFT_PGA_CTRL_NAME	"ADC4 Left PGA"
+#define MA5311_ADC4_RIGHT_PGA_CTRL_NAME	"ADC4 Right PGA"
+
+#define MA5311_CAPTURE_NAME	"Capture Mode"
+#define MA5311_TDM_RX_SLOT	"TDM RX Slot"
+
+#define MA5311_AIF_IN_NAME	"AIF IN Source"
+#define MA5311_AIF_OUT0_NAME	"AIF OUT0 Source"
+#define MA5311_AIF_OUT1_NAME	"AIF OUT1 Source"
+
+#define MA5311_CONTROLLER_DEVICE_MASK	BIT(7)
+#define MA5311_DEVICE_MODE		0
+#define MA5311_CONTROLLER_MODE		BIT(7)
+
+#define MA5311_SCK_RISING_MASK	BIT(2)
+#define MA5311_SCK_RISING_EDGE	BIT(2)
+#define MA5311_SCK_FALLING_EDGE	0
+
+#define MA5311_LEFTPOL_MASK	BIT(3)
+#define MA5311_LOW_FIRST_CH	0
+#define MA5311_HIGH_FIRST_CH	BIT(3)
+
+enum ma5311_mode {
+	MA5311_MONO_BOTH_MODE,
+	MA5311_STEREO_MODE,
+	MA5311_MONO_LEFT_MODE,
+	MA5311_MONO_RIGHT_MODE,
+};
+
+enum ma5311_setting {
+	MA5311_SPEAKER_MODE,
+	MA5311_RECEIVER_MODE,
+};
+
+enum ma5311_adc_mode {
+	MA5311_I2S_MODE_ADC1,
+	MA5311_I2S_MODE_ADC2,
+	MA5311_I2S_MODE_ADC3,
+	MA5311_I2S_MODE_ADC4,
+	MA5311_TDM_MODE,
+};
+
+#define MA5311_TSD_FAULT_STATUS	BIT(2)
+
+/* Field encodings used by the existing serial audio configuration. */
+#define MA5311_DAC_A1_SCK_RATE_MASK	GENMASK(4, 3)
+#define MA5311_DAC_A1_SCK_RATE_32FS	0x18
+#define MA5311_DAC_A1_SCK_RATE_64FS	0x00
+
+/* MA5311_DAC_38_TDM2 data length field. */
+#define MA5311_DAC_38_DATA_LEN_MASK	BIT(7)
+#define MA5311_DAC_38_DATA_LEN_16	0
+#define MA5311_DAC_38_DATA_LEN_32	BIT(7)
+#define MA5311_DAC_38_CAPTURE_8CH_CFG	0x41
+#define MA5311_DAC_38_CAPTURE_4CH_CFG	0x01
+
+/* Full-register values: keep the other DATA_PATH bits cleared. */
+#define MA5311_ADC_DATA_PATH_I2S	0x00
+#define MA5311_ADC_DATA_PATH_TDM_8CH	0x01
+#define MA5311_TDM_SLOT_ENABLE_ALL	0xff
+#define MA5311_TDM_SLOT_DISABLE_ALL	0x00
+
+/* Preserve the SCK_RATE encoding used for 16-bit ADC capture. */
+#define MA5311_ADC_SCK_RATE_16BIT_CFG	0x40
+#define MA5311_ADC_SCK_RATE_24BIT_CFG	0x00
+
+/* 0xEA: DAC fault status */
+#define MA5311_DAC_EA_FAULT_MASK	BIT(7)
+#define MA5311_DAC_EA_UVLON_CH1_MASK	BIT(6)
+#define MA5311_DAC_EA_UVLON_CH2_MASK	BIT(5)
+#define MA5311_DAC_EA_TSDW_MASK		BIT(3)
+#define MA5311_DAC_EA_TSD_MASK		BIT(2)
+
+/* 0xEB: DAC OCP status */
+#define MA5311_DAC_EB_IPSC_2U_MASK	BIT(7)
+#define MA5311_DAC_EB_IPSC_2L_MASK	BIT(6)
+#define MA5311_DAC_EB_IPSC_1U_MASK	BIT(5)
+#define MA5311_DAC_EB_IPSC_1L_MASK	BIT(4)
+#define MA5311_DAC_EB_OCP_2B_MASK	BIT(3)
+#define MA5311_DAC_EB_OCP_2A_MASK	BIT(2)
+#define MA5311_DAC_EB_OCP_1B_MASK	BIT(1)
+#define MA5311_DAC_EB_OCP_1A_MASK	BIT(0)
+
+/* 0xEC: DAC SCP status */
+#define MA5311_DAC_EC_SCP_2B_MASK	BIT(3)
+#define MA5311_DAC_EC_SCP_2A_MASK	BIT(2)
+#define MA5311_DAC_EC_SCP_1B_MASK	BIT(1)
+#define MA5311_DAC_EC_SCP_1A_MASK	BIT(0)
+
+/* 0xFB: Clock fault status */
+#define MA5311_DAC_FB_CLOCK_MON_MASK	BIT(0)
+
+/* Factory Default */
+#define MA5311_PLL_POST_N_DEFAULT	BIT(3)
+#define MA5311_PLL_N_DEFAULT		BIT(5)
+#define MA5311_PLL_F1_DEFAULT		0
+#define MA5311_PLL_F2_DEFAULT		0
+#define MA5311_PLL_F3_P_CP_DEFAULT	BIT(1)
+
+#define MA5311_LRCK_SCK_MAS_CLK_SEL_MASK	BIT(0)
+#define MA5311_LRCK_SCK_CLK_MASTER_MODE		1
+#define MA5311_LRCK_SCK_CLK_SLAVE_MODE		0
+
+#define MA5311_DAC_CLKSYSTEM_MASK	GENMASK(7, 5)
+#define MA5311_DAC_EXT_CLK_24_576	BIT(7)
+#define MA5311_DAC_INT_OSCILLATOR	0
+
+#define MA5311_DAC_TDM_STEREO_MASK	BIT(6)
+#define MA5311_DAC_TDM_MONO		0
+#define MA5311_DAC_TDM_STEREO		BIT(6)
+
+#define MA5311_DAC_ADC_CLK_ON_MASK	BIT(4)
+#define MA5311_DAC_ADC_CLK_ON		BIT(4)
+#define MA5311_DAC_ADC_CLK_OFF		0
+
+#define MA5311_DISABLE_TDM_SLOT		0X00
+#define MA5311_ADC_MIX_CH0		0
+#define MA5311_ADC_DATA_PATH_CH0	0
+
+#define MA5311_DAC_PLLIN_CLK_MASK	BIT(7)
+#define MA5311_DAC_PLLIN_EXT_OSC	0
+#define MA5311_DAC_PLLIN_INT_OSC	BIT(7)
+
+#define MA5311_DAC_PLL_REF_CLK1_MASK	BIT(4)
+#define MA5311_DAC_PLL_REF_EXT_CLK	0
+#define MA5311_DAC_PLL_REF_INT_OSC	BIT(4)
+
+#define MA5311_DAC_PLL_REF_CLK2_MASK	BIT(3)
+#define MA5311_DAC_PLL_REF_CLK2_REF1	0
+#define MA5311_DAC_PLL_REF_CLK2_SCK	BIT(3)
+
+#endif /* _MA5311_H */
-- 
2.43.0

