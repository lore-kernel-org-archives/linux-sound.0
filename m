Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011000.outbound.protection.outlook.com [52.101.125.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F02C0340416
	for <linux-sound@vger.kernel.org>; Fri, 31 Jul 2026 02:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785466009; cv=fail; b=C4KZrr0259m2ashlXu61McOGFYlfZkIALiRom19McJNxnmN4kuBWg/ezZXRuYIl0JHxC9zyWM9LRqcuBheurKeRc3XbGg4f8SiwokkFyRHv2kgwbRC8oaHu7/QxxOtIzYjDz6CMDU3AprluBFdTWAjiKIqEgCDHB5mi3i4PhDDM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785466009; c=relaxed/simple;
	bh=o+ad5r9vpRTvprcloxqF2pQKG6MxVCM330RD7ifc39g=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Xg3qN07rsvd26OvjeCmeyH/AD3EH1meL/pE21GgbUOEX2MsBGA5lDPkM3sEaD1IDibchFcXD7kZel1ALpQDD1KfHF0EoRuknzZOXLc27Vu4WNVfKKrrPVUgxN4NRYyx0ZlU5HXGLOcrHNgXUIoJsxYd2dOjgbGtGYsVdH87mGbw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=N3VqGXAG; arc=fail smtp.client-ip=52.101.125.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="N3VqGXAG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yxY9hV0X0cqAwXusAwxYN5vH4Ao5tAe9HJu7DZa+J1APYy1OnlAASjzzWsIM8C1sR8/mJI12XWT5GxUJfxobg7vJWSpi6FjzqtCqK6H94Xd01202cDOeEvOkepz4izLpaQ4xUiq53k4hU7xiVkh6nQIyRPY6kM2FFPma7jv2N1iGXx6yKOlyT2yhYD6xmR8Gr8d43kJsxLJZQm29LB4y8ALWP2sc/2GteStzuU0hDGRTyDZ326Pt3LUGPHAr3t+b/ou6uMr6O++iYUqJozAWfOk7m15E0r9E5CwUzLqLClHeu/TW5LTf0lT1L8GltAEiJXiJJfY1RgeyNgWdrSiGPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s003IIaYfb0c3AAdgFoPEJPNF/VAO2b7l89VKI8NVzI=;
 b=COgSlKHkMixiVNJDBqAYL9Z5FX5BVLnET0J2POXS1QZHDn+la6kubhuAz0XboXrFO0TdIeWbxbP+QeaR19X6h1Jmk6PzIzYVQiqCa+CoQzdRLKPE7iy4i1NI6bjzu9gdHB+uCXZKMLflQxHHL/CpnDXq9culTtRjMli/VGye2Ut2/xWeH607xq6zn/exNJQMhKyZbcxwo0SYnBHigafOih6tjxHuiazRAZZ502i2/7JIdm30BWizpCMIad2nYgzwTs6sNvvOqCBZpV+EJgrNR+WjrnCf2RQjISCUdwTKxduApCta5ocyqCsrFk0pCd3H4auGHgdyO6qo467caSNyqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s003IIaYfb0c3AAdgFoPEJPNF/VAO2b7l89VKI8NVzI=;
 b=N3VqGXAGe6tkd2uVqdmnd8fHOIGf8jHR52g35xvliVzKll9wRUubqvJ8vwuo3cDieJEXpGUPwPpmaqjDW6D0bUJWwhhsomQhgu5k+Qj3aiAAAnAfcRJ+fdBEHg+Ulwm+hVbCN2tiSTEVbJWILLfbDyUBoFR7ps274vHDmVJNwxM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OSZPR01MB6816.jpnprd01.prod.outlook.com (2603:1096:604:13b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Fri, 31 Jul
 2026 02:46:44 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0270.012; Fri, 31 Jul 2026
 02:46:44 +0000
Message-ID: <87fr0zswoc.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 3/4] ASoC: renesas: enable COMPILE_TEST for AC97 SH7760
To: Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87jyqbswp0.wl-kuninori.morimoto.gx@renesas.com>
References: <87jyqbswp0.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 31 Jul 2026 02:46:44 +0000
X-ClientProxiedBy: TY4P301CA0027.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:2b1::9) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OSZPR01MB6816:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f1841a4-932e-4c64-3487-08deeeadf51c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|52116014|10067099003|11063799006|56012099006|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	9NkaZiYYpHYbP8pk84sX1gEJIxi4zCj7bMlJMIAa9nAKpgdnD7VUOjzE6nCXvNTzXIRA29Vyjk+luFkcCzDivPma30YkluaiB+75a7R5ljkaZ4hXr+/UgKUSx876MZb2oBSxLNRfRWys3Za2iyr/enDHlCx0McoXUmr1ri9r5oc9PWJnMk4pXxG/ePkIDh7FcMdgOYCBsEdiuWTn5dGRs/urintSno15FsBYdrVDP4Y9Gu+2pc0cBwYu/UJe+jGEhoqMllmw8ldKFwqj1vxWgR5CWryJHMA9hG7ajSnWJ4X1QBvOQDqAjdMMjxIavZw1VOCIbQ5MXe8WA9wqr16Ckt0McIh6FyZkfD/Tu2b5Wvbr+ZdlK4P6ALXbQzGZSwk9WwokL2AnzdpVbJNR/iFG44MKag+ibzQ48ECRXLZP/dbT44eaEEp8nIUiz6ig1nvAtFYVnBHihFyZyCvd3TkuwmwJ32yo2qcTZYDfYpXyys9BpCn5WNmOJUqtULh2HLhkGzyIf2RcjJNFovVkz3BOIOoWkXLMPUWrwmwlzC+SVrZcl04ATNm1Kig3CBEwVQuL6kprSJNU3bbWktMIrOAxg/2uE0MJrdh5JBLyNdbZrVubni3AgaeOz1m0+YRDOCgjlaxoY3S4SyCmZ+jGkpY4YxtDwHGWmnFkm+qroW56pdU4+RKwbBK33QUKi6/8vRQ3og0qbEu6VD10RC5MsJ+OmBeRyw/pRAgsR7Cnto6tU+4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(52116014)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HlmQv1SDk57aDn0b2fFbKPq6clE6p6FXvDkjtQgmJMepniLu7ZKX1iuD+nt9?=
 =?us-ascii?Q?vTeqYcslNSFcQyZqsEW0rGdgiOPybgIqBv82TPNv9pOmG0I9AQCKN27svGMM?=
 =?us-ascii?Q?RJqmR0NXRD8SSf219+lJJbxEwYw7Iu5WGMeXhP763096eBy6REK0UjTAbjIR?=
 =?us-ascii?Q?GNZrtLH54lW0b1Bq8M5ymB7RFyzhaRJILtSE/+/MqPxkkwzH+lBLXDG3Veex?=
 =?us-ascii?Q?qRkhPvZQS4Lib1QIniuVVtX1QRp4c5tyKcwaq9AVURaBBZCylXckqq74n5NX?=
 =?us-ascii?Q?RUBIxWWouD90hXImTHV1fLMEbWEAW/6zVTnHUpKuG3hucApj4S7ccL46N3jI?=
 =?us-ascii?Q?cMH7M6FUE5E612VOHnHZGGsCHJRtNpWp2W3rCR5+ZcgoUw1ZiyFKWVDvVFkf?=
 =?us-ascii?Q?Wqz5vGC0x5jk2XD7BKroRHD2gUnYsifilmwnPpW0PsK1phDR4jeH23cXgFaX?=
 =?us-ascii?Q?cY1Jcx0xSbgQsvUK92Ong6pcOa2e1INuZCC9RKsZlc4GkMJ9iYC6o9yJzYUR?=
 =?us-ascii?Q?yQovPVVMiKFt7dyYOBvRUh+QLugWvYhlA5I6adhpi6MQtmf2Qgk6w1VvxySQ?=
 =?us-ascii?Q?XdSewRFLpqoSQRwkup6SGYqpLlucn4n2+suOz1i4HZFejrx2/5B18aVb0Pn3?=
 =?us-ascii?Q?HyTKmkHKzfqyLtLk46u5D9Q1pVqOgmkX3Y79PWkb1uOINrDwLIw62qBykao2?=
 =?us-ascii?Q?HgwnvNLIGCX4VIHUNnjqbkqm0kEJxIhPaq9TqbEqjjVjehoOp2J9hh0oj0RH?=
 =?us-ascii?Q?NUS7AogcpingK8fZ5p9IEY9/WQhV/vyiP85Igs6j5AKqreM0TCckJKv/eWgs?=
 =?us-ascii?Q?t1wpHdvtLHkhrr3Gfm9+BGBleZtqPKiczDqKWIpAfOMqwlCCkDXRVmdcBxMb?=
 =?us-ascii?Q?oRzntWvs/Pa8eXDMJduk+4OcczmG70Frtd0Oe91TrgRC3nsgqklmMYrL1CmD?=
 =?us-ascii?Q?ZEV+MrNOJWh64ezj+OqXTAzCeeq4yd2Kvn9BUjByJ72Ed5nBhAaounQ+aaYN?=
 =?us-ascii?Q?wjepR9VoVaKHOyYcPa8+x4335jv1JC2PbVrVWCcIzsqnd4Cz4M/6+qLRYcOm?=
 =?us-ascii?Q?k+8T5k1MCRxbEPI/nsWJ2mLZ2t7ke0TTQqYXVGHqLXcpMn3ma+BKHabtc2df?=
 =?us-ascii?Q?QSwbPIh4TYd9oB6Z66zMg1CdHdvzeRkvWqvih5gDdVkd/ktnYymwewFGFiyr?=
 =?us-ascii?Q?LIjFmb2CMkKyWzSV1RVytgfgu9Y+2HJ+QDW8bl/hJ/qvgoL5g925LeO1rNkJ?=
 =?us-ascii?Q?kK1+/5rea32yNwjAeBU5YvCoEuU+B6oQ+PPysFaWTnSzTDbOUPuNakuaQgB7?=
 =?us-ascii?Q?ap+/mQSoBTNSrXbhWMBoFeKXT8GZEZZ2ZQKpHUpCbnotYhZp69WoC9g1oHEK?=
 =?us-ascii?Q?rQDNMsKwb3+d04axQUo5/OyV5aYAoW2tN8Psu1EE/kh7sbl2MWmQFPki1fxw?=
 =?us-ascii?Q?xYKF6Kk62B2Z99Mzk+nBDzFj9G6xpau3aG33iYC9abCpimmsqXoeP0HmN60y?=
 =?us-ascii?Q?o7ACT8jYp6Zb2a1jWcvQUl2TOnTMoYLRzzzbUZIZysOF4Y8L0Dkci4u3yvjC?=
 =?us-ascii?Q?33wGw8Hfi8RlY9TP4/Qno6OVJjG/J1dTmYdlppObjibh5q0aXpm9TMKy0/bI?=
 =?us-ascii?Q?UuohgXpyNCsdbVaw776R9MIL9eowaqF6a+qKQi7hh8Gdmd36n2YiyJHHFXgd?=
 =?us-ascii?Q?/a6caSR+hvi3b84i61P8PX+QM0PenlAHUHT5JDSKATNlwfu3Fq35NmwqonMg?=
 =?us-ascii?Q?8sMQke4PPUOKlXTcQyPO6MrDq2vB7tlLHY9fjAHck1ESnPs0We+/?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f1841a4-932e-4c64-3487-08deeeadf51c
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 02:46:44.3530
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LCm9pSZZMphoN5scHRqY2zG8cSUEVQGmQxv7FsYi6VZWIiEDYmveCatBlF0/dBqvxz3zTUyebyPRBQ8HvtyLH97EqwPP14fMnVGJsYtggISt+x8J+zPGcsnO8yZsUN0Z
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB6816

AC97 SH7760 is not compiled with COMPILE_TEST, and there is no defconfig
which selects it. So it is easy to be overlooked for compile test and/or
ASoC updating.

Let's enable COMPILE_TEST when it was for SuperH / SH-Mobile

Then, remove #error which hinder for compile test.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/renesas/Kconfig | 3 ++-
 sound/soc/renesas/hac.c   | 2 --
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/renesas/Kconfig b/sound/soc/renesas/Kconfig
index b30de242e5dd8..8b04a42c82c3f 100644
--- a/sound/soc/renesas/Kconfig
+++ b/sound/soc/renesas/Kconfig
@@ -63,7 +63,8 @@ config SND_SOC_RZ
 
 config SND_SH7760_AC97
 	tristate "SH7760 AC97 sound support"
-	depends on CPU_SUBTYPE_SH7760 && SND_SOC_PCM_SH7760
+	depends on SUPERH || ARCH_RENESAS
+	depends on (CPU_SUBTYPE_SH7760 && SND_SOC_PCM_SH7760) || COMPILE_TEST
 	select SND_SOC_SH4_HAC
 	select SND_SOC_AC97_CODEC
 	help
diff --git a/sound/soc/renesas/hac.c b/sound/soc/renesas/hac.c
index db618c09d1e04..9963c9f1ca452 100644
--- a/sound/soc/renesas/hac.c
+++ b/sound/soc/renesas/hac.c
@@ -86,8 +86,6 @@ struct hac_priv {
 	{
 		.mmio	= 0xFFE40000,
 	},
-#else
-#error "Unsupported SuperH SoC"
 #endif
 };
 
-- 
2.53.0

