Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.229.58
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794288287;
	b=L8CihiS8RU9gHVYx5YF8oBhl1YErLWKd8JO1UKV4RWXU5g3hz8rx4HwUrYYYkGFAYyWT
	 UhO9f6/vjulSi+/c2VsGuSvQXFemkYAvUwf6yQclQA9JLNoyKJuNR9QwHI6Vv8jc2eUA6
	 ZTwhhMLy0dWWCq/MbdEJ5C+f9WnV1sSrdDLDYJHcLujmNan+UEkvIAywGY+BgRsImfmuO
	 zAOAPW0dJAj6KNehu3k1fyTMRxvgJc/y2Hmx0JjLCbE7Je5q0NbXJBS184yYKAet+NgaG
	 pRe4oVZy1FsF0qWExk8EG18w+It67J0LyPh2PkIiXroD0i5RYdWnRFAFbCKlkR8ehuw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794288287;
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
	bh=Pz3BCLigwKeCzflaZDuszo5BMV21mm7RTadaVtR00ec=;
	b=3mtrvwCCLLIPfkyiNySML1L0hHGZy62kNnwerOsLKwS17hGFagAB8KVzxr5FIojw/rFS
	 tlji7N3Cg0ieINVcUFdyhanscNqa1ZJvzyNkFLqfJhgmdZhjW6x44/h8RSL0k5Q9djL/r
	 zjlJ/sSbppm19YbJn27996P9B9UcLmJPx20Dd1SsaOUI68cRLhr3U9aYE+ZkkjWw4paiU
	 RbU4eGhgfiQKOCKpupfo1y1ZUWjA157MsL4FXyCP4yGdbXugYq09e25mQx+mbcqc5IxEQ
	 PNvNFJ1+eKIWEW/Oid7gB7nVg0WusacdaEsCu60cEtGZ4BWSvDrb4CYBrAKKiQzAe9g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=LTnBCMSL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.229.58
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010058.outbound.protection.outlook.com [52.101.229.58])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41975606A31C
	for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 05:24:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41975606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=LTnBCMSL
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q9evHeBsbJB0IBwy3T4Uq2Rg1d5fQCAe2byEE5EBEERa/JCN+LdBzAbcYcFk4kmfLy59B/nY9CYJZLaTCNewlZYC3FqQfPjbCmt7A0yXBNJlO8azPwDXVszTlnboe6E2NoNXeMHRgtuhDFINhT3w6GJ+35zof6KIwg7bsrQrYOxEfhShba7A7RZQexkKvRb7Ve+6vZpAA/VospXDizdr3l5ujzhmMxlMu8iJfOKeDLf/esHz9i8dRVyNp8rfwocExHjwcQpwRMybuTfPtLFtxS3FFn1R/x5bX8k/TWsyMTImPXKmgd3t0wEC5x3g11suEG82o1dYXjYPNNIBJyjaxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pz3BCLigwKeCzflaZDuszo5BMV21mm7RTadaVtR00ec=;
 b=n7iayIthF+Oo/MXhQBIXlkWpCPWqin53f8CamWGTeP8BmXIL1UkfDJemo05cWBryFUq8NODIbdEWiEQjv3sSuVHpINXztCg6JindkI+TVAFpyUXypVFDpHgYV9Hve/WLsXN6vCmjYWQsZppwZ6cPrKssULfAjeWcp9F37w8aPTQ7tuQs/K8rU+eyFPMWcRNJNzXGpcaOTToMR/EkunTXT88+ZwP0VoI66URQ1VTInr4tzmzRg5uonIMEbmusLAUwuBth3wN/GN/Xa0fe/Y7kWs7vNC9IJERia/LG+X7VJeaXzYgNnH4kLiOxdd8oLrIMuiFcDHG9CJ1fEAMKFGgcLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pz3BCLigwKeCzflaZDuszo5BMV21mm7RTadaVtR00ec=;
 b=LTnBCMSLqr1U/r5S79m451XS7hrf7qy+rP/eAOlm2MsvtLFQu1Yo0v7WURTwVTmXI1oBfW2SSmXWPeCbH7A81yIt1la50mzJosIl8lJHriIdAxnUnP+4P8xrVeWdQvxuMpPk0zyCLYh6dKYmPCSHxfHTTMLye67xXwQ8JCMuXuk=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com (2603:1096:405:27d::8)
 by TYXPR01MB15740.jpnprd01.prod.outlook.com (2603:1096:405:29e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Tue, 10 Nov
 2026 05:24:40 +0000
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d]) by TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d%6]) with mapi id 15.21.0592.012; Tue, 10 Nov 2026
 05:24:40 +0000
Message-ID: <87pkwdmf6w.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 13/20] ASoC: soc-component: add snd_soc_component_regcache_mark_dirty()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <878q31nttj.wl-kuninori.morimoto.gx@renesas.com>
References: <878q31nttj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 10 Nov 2026 05:24:40 +0000
X-ClientProxiedBy: OS0P286CA0134.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:16b::7) To TYYPR01MB15175.jpnprd01.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: TYYPR01MB15175:EE_|TYXPR01MB15740:EE_
X-MS-Office365-Filtering-Correlation-Id: 0578e8dc-699e-4fbc-a9b5-08df3eeaeb4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|23010399003|38350700014|11063799006|261021121427099003|261009223027099003|56012099006|261102123227099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	hGzTXeF93o2mnY4wlia3UIY6XvP+yZ7oSlrlnkK5JbvAJG3j6qYs68HkNTaMabVqmjBkQ0XC4aCZZE73XvO35DLLMrg2KDyvO/dioc+BoaXNhlOIBgXmYCUNBqHWiTnGogdgk3QakqRs8r2VwKqKLJ/vClDmnksRnBLAN97SeAngOCLRQhOfrcblEAzsVWLG0uZSp0r4S07JtNMAKG+uhtq9ifAKpCAVH6PPRbwk75RbLNaUMhPlHf0JZPS2xnMAlFrYtOAnxVmi/oYeRcFR0wyQ+ppVcvacIkaG3kbFJ21I1CaEqFLSBh8rYF0oEI5GMbXWl9bTC8/hsQMcixCR2Nd7CDbt5ylNEqoX+doeqML4G9KXR9BzZxvs1auyZsWKHBQnkKWTKN2RF/FQh/9LxIZDP149BBVjytgQxbac9oQ0FAeCh7vdoKv0eA4cfRBUFR9JieYWLbUl0f7i351ChYZqF1JS6Mq3mnkMCip5KApoBvYem/Tz3lbPZzn+R56uuL3h/cUb78PVqxcICQ69iAx3D0s8w2awsNFkOPUHu29mye3tc6v8dvl8UJ6fCQgy8yDhwCyjtLBlcdcSUwp7jxEeGlQ0i03mK9Z8tXQ7Qf1aZtum0egpZdw9W53aJTdTUiprtk/UF293L2HwKrg6Vc6qoQZ+Qg98vYeOJ/u6oTWnuncusCb/QZ+nl9oUPdrCjcg50iIUZnJRzAxErvD2V6HA5OHQys5znhvMYxmP95Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB15175.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(23010399003)(38350700014)(11063799006)(261021121427099003)(261009223027099003)(56012099006)(261102123227099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iNu79/t+zpjjF5c4cKGyaxTHeTfpxKEs682WxhaMdFnQSxw/kXGEiSKR0Ml7?=
 =?us-ascii?Q?tt6DwYEEMAgO59W3rWFL7KX+xpbpJfMKZtsKCfYtxWUZNHUIltHIvibjQJ21?=
 =?us-ascii?Q?KYwAV4uiVYIq0CikwcAaSFFM5FJDD0N9qE4Mc4KG0BGRkvkaQfzg6NM04eeo?=
 =?us-ascii?Q?dQOqCWGfS+z/i7On59T58ToqnFT3On1ZXB7CuzsbxTiiYCOepLIskrQZY0yM?=
 =?us-ascii?Q?Bc1ZxhGw93hCpovpx3266zNK/3bqbuuBSVvaA0QFaV+HsFNK4NOxc70bJDKH?=
 =?us-ascii?Q?ARSxbhc6rnEpWqRRdKvIDi0kuZ6/OQp3Z4+v+Jqpw0irowHrZB8uCktP6V2d?=
 =?us-ascii?Q?E68hMmpEZdRS3yXtHa76wN0F3y2U7RrpTV0E7pAPvKB5oc5yDOTKLjjOVeGK?=
 =?us-ascii?Q?vAVwW/ZELnXNySOMWPkXzhDOLMN5MMyUyGuBTDTtlg4qeomYDOdjmAZWxtSc?=
 =?us-ascii?Q?qcyJfsUnBmiNPbbCf0yhlrA1nCytXfmbybPSpk0rDFgtOkfPqjisAW0aEMH8?=
 =?us-ascii?Q?1/IYJjyle/62tPN0v56cB40Tr5d9XM6FbEBRU6BeOcOYVW6yKOQNPswJYTCF?=
 =?us-ascii?Q?Ou6epNnK9YY+XMd+ZRFvF34aEZ02YbcR7RjDyRNBwwEbbx+yuLybnBCdeXNW?=
 =?us-ascii?Q?+fQZqxswcxxEdrqmCd00CztkvOOb4qZCZspEfAlYM5G+MUJZ44V4p/of/aD7?=
 =?us-ascii?Q?IJSsOCj4NDqCmmOmiuBscu9IOBCaN+S6nKWI+wkbLcr+4o7ydZGapwYs5LUk?=
 =?us-ascii?Q?qGfArvGZoNYAebuG8HCv7GSt4bPHAWzdNI8CBBhw9ajts+RISORlAmKIRFSP?=
 =?us-ascii?Q?iyhkbZQZk8tHaAJNPERcIGm3+CBT5tp+iGv0kDOVvXRly7+DCZxhY3pnw28P?=
 =?us-ascii?Q?U5VaWIn1mUvAzM4WNfO6Cgjh2tXgQ7WNx/hF8WE7irH9yOk4erc/DwScUaR/?=
 =?us-ascii?Q?O2GrxlLlRqdOvQOKKxwmvT5zswdpr9Wbg6H1yXv+czDKed3XFdaS8Cy85vF9?=
 =?us-ascii?Q?Nww41n1iNqHwJ6MWh5iKVJNol0+RP3UyxZHoLjViQICbgcGHBxaT2AmiTvC6?=
 =?us-ascii?Q?PLO5y8amRjN0ssdigdrROc6n4QLdEs42f+fDvSfDTbQUvjareSI2iuvXSD8V?=
 =?us-ascii?Q?OuZCT5188cL8cvWIHT4J7Vn+UBnVV5tDuO6Z7w5Xm+E25ohKlS8FnSY6owAf?=
 =?us-ascii?Q?EcM6bJkVsvCD2OP8RcZhfn2x+iXuFg+attHT5fdqHcSozGbgRtvmXn9ICCT6?=
 =?us-ascii?Q?mwuzwQaRjTBMF7PGmBZhp0HR6d4j6exPXdAwqrqQlLjZvMozKKyDDUVtQPyr?=
 =?us-ascii?Q?ReRoh7p1DWe0iLrgIfdqsEwlr8iAoZuCoID1ZDVLptkXB4zz9a0DYO0IkrjV?=
 =?us-ascii?Q?y2JaeZh8/QSiBRs25ELIcCSs/RBk+Tw6TtYAyV7MF20c85ZPvidmGUS7eJDn?=
 =?us-ascii?Q?2XjGENUN572ZMgWayYeTPz0FRaHGFg2VWvr3PDzbqGdYkhfRK2126bLjvx3X?=
 =?us-ascii?Q?GC2/8aWgSSvfme9+5TtoHxYwXBzUbEHp8duk4i4oNsJqpnMxBt/yy+huA8JN?=
 =?us-ascii?Q?CcHZeKMUNsqJkFDcxIC412SfG/lkcDlpEZlvMd4uDboAUN+qKR85ZfKLTIbz?=
 =?us-ascii?Q?BV4rCi3PEKa1Un6gBn9bA4BYq2wMviMODxteiC5ycCwEffEI2iTE9F9CytBK?=
 =?us-ascii?Q?JKmx0kUj8SXm8EEeS3tMhK1OuTSrWDJaFg7US2UpydXUZrsQkockP0XvJIID?=
 =?us-ascii?Q?HW2VcJTEumGAMFn1Z2dwLEo4W88+jVtk8Vo6BH2qJHusn5x/kukK?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0578e8dc-699e-4fbc-a9b5-08df3eeaeb4f
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB15175.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 05:24:40.2671
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zuRR6jwMaOLUzw+xI5hcvH9dmX2EwNp81wHb/S0eDQzy2MHRT/hQ6UHhP618JrCSc6xKQCvlt1y61jLKB1gczTPuzHNh3GWMxPsGc5INRTUwmm3o3nYWacLRraa4wKde
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYXPR01MB15740

struct snd_soc_component will be capsuled soon, its member will not be
able to access from non soc-component.c.

Adds snd_soc_component_regcache_mark_dirty().

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-component.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index 4a72cfb5401a9..25b25389bf0fa 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -497,6 +497,15 @@ static inline void snd_soc_component_regmap_async_complete(struct snd_soc_compon
 		regmap_async_complete(regmap);
 }
 
+static inline void snd_soc_component_regcache_mark_dirty(struct snd_soc_component *component)
+{
+	struct regmap *regmap = snd_soc_component_to_regmap(component);
+
+	if (regmap)
+		regcache_mark_dirty(regmap);
+}
+
+
 /* REMOVE ME */
 #define snd_soc_component_init_regmap			snd_soc_component_regmap_init
 #define snd_soc_component_exit_regmap			snd_soc_component_regmap_exit
-- 
2.53.0

