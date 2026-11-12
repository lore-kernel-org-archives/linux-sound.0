Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.74.29
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794443574;
	b=VEBN8RiryFlxH/jwCyv3Q8Oy8zi4rRl8faleJO/uxzqrpPanPE/UfGJiSdC6tXwOnJ9M
	 aziSZGPh5cvodWxsmDVnoo9lFhKmO69uH0gCJ5fkamKUqBWJCySH00u179onuiYtm3pNZ
	 VldUPGzkN+J15ugoC9KjRvgVV5PGIAQOq8P4E4JIZNXfWdxQoxqdToWTu6+HbCDziocPS
	 5Us7LWiNSmoT9IYHimYwr1sCoXWX8EwzxEt1xYrqP36OMqEvxMUjFNwlufqH5GoZWMpuE
	 X7mz0+CKItVyr5YP5bWVm8K48izYHlPTlD2xqqS1dmR8IOA8kPdZ8lKN+TdiF9B3g6w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794443574;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:From:
	 Subject:User-Agent:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=tWzmmfqmUZzaW9xAzB3BAADeUZM9jgtUH+noVD1xqb0=;
	b=GvrCD9mQoORjcCegCjskAQHjqQi2d1QB0Wp0bUUjKf/fQ+fYjP7t0kvcBlfwkS7GsQ0C
	 aYd/xuBUPZvRawBhE/VPFkMd4ujEIP3MUcXotIyz3VKdMJBxmxfHepb82+jtfBYboi5fX
	 j7dUEYUhdgDxlPtFAaO6/VrSDI4Enmjf/btK60pfGVkj49oWwitPY9doOjSOVfSsLxzbi
	 21kPX1e4Ar35qm00vNI+K6+alA9nVpj1PysnnFWky6+owuSlH6JKEH1JTm8o9Ribo5l5C
	 Py+5PcHnGsP5DdoWVLRJa6DvgLUVtDmbP4MAaqChtbzUEst42+Qy1GNr4n/pu3STV8g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=RgGcAI1u;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.74.29
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011029.outbound.protection.outlook.com [40.107.74.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 105F3606A324
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 00:32:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 105F3606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=RgGcAI1u
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R0KhBLzEjoskhVDWPyEKBNSeoLRNM6me5U24Co66sUMJRDeD2yIPejZfB6iRTCh9xhk0XccwtPtwsYuXz07xezVKryMqCzwPPzbGcMQmPJiDkDO6w1+nvd1u1APvtze/yGECQ25pXTBBIqmlFV95kfq9j7acWHBINdCAViOHHxytNt0HJNHTZYMLd5z2LFAvGFUSI/2XKbkJboaZ4ovuHIeGUAZUCDQaxdkXARrjeeSM4swUiGkGJ9+ldWw3Ng67oLHh1tiajWxOTq2CY/DJNxeoP8fsbRW12VTzcEnX/n/3sWHKFr3i6Lh+yWjHLI6aCUr9ZA1A/6wJc7ocfT1e9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tWzmmfqmUZzaW9xAzB3BAADeUZM9jgtUH+noVD1xqb0=;
 b=fdHtKENRzqIeCtY4hfAxpPGRQRilnapwtZIgUswb9Pd2ri4kHHUGTRSZIkZFozUtVWIGhSd4shpuh3OFY6kWCcoOzLmPoHjnyA+mRlUFNeixIHW/ARGk1LTnYzbzLTy3lAy5TBnVBmlGF4zA3TyHEHhiNSpWM+e+GySd5t8yNCIl5VlJSDpdHxp0OAViAp606f1h0oTM4STmfT6rDXK6SFE96XOvL96j/hJ04lZta7IDMYLkVTyyIjown06E68+TZWyNHG3ZdtGOXRXPLpMWWVDDOLzVAMD5f3BBqEJfncopLznfqB4rYpLF8zQuNStMSYHFUQqV7thZDTFuBhff4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tWzmmfqmUZzaW9xAzB3BAADeUZM9jgtUH+noVD1xqb0=;
 b=RgGcAI1u81zu7QxTgBs82QFLN3G7t+2DnaVlVWou9gtVoNmArKw2Kh7++9LhSA4avdJ4ZpLQV88NaNVMZKGRCUp4HDNapnwYi/EbIdpn0ZxOWRjO16cP4AJ5vphzjvmMA2Xe6WqUEgkMol/0k8jMQ2bbQS5W8uE+FX9mJMfLLl0=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com (2603:1096:405:27d::8)
 by TYCPR01MB6867.jpnprd01.prod.outlook.com (2603:1096:400:b6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Thu, 12 Nov
 2026 00:32:52 +0000
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d]) by TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d%6]) with mapi id 15.21.0615.008; Thu, 12 Nov 2026
 00:32:52 +0000
Message-ID: <87h5hm28jw.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 13/27] ASoC: soc-component: move snd_soc_of_xlate_dai_name() to soc-component.c
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, Alvin =?ISO-8859-2?Q?=A9ipraga?=
 <alvin.sipraga@analog.com>
In-Reply-To: <87zeve28ol.wl-kuninori.morimoto.gx@renesas.com>
References: <87zeve28ol.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 00:32:52 +0000
X-ClientProxiedBy: TYCP286CA0251.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:456::20) To TYYPR01MB15175.jpnprd01.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: TYYPR01MB15175:EE_|TYCPR01MB6867:EE_
X-MS-Office365-Filtering-Correlation-Id: 253f2ec0-0e50-45a9-cbdd-08df40547c90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|23010399003|18002099003|22082099003|261009223027099003|3023799007|11063799006|56012099006|261102130727099003|261028144727099003|261102123227099003|261026121527099003|261026140227099003|261022105027099003|261021121427099003|261021123027099003|38350700014|10067099003;
X-Microsoft-Antispam-Message-Info:
	7AUtE5nrmc3Gn8YX+LNFjOokTHKJuuwnsMx3+raop9q6+WfeFk2F7Uvo1xA6mn/nTpDEoisKB/EyvRXEoNr9VySRkUr9d3vOnTn9MMj+1xG3bf33u4G011KC+kOkq7TXEIsPwzjprSxXxTAdCMURhCnFr9GnGJXXohy9NEWt0UyMjWwyhVXm1XkYoUs9AT5pICp/WdMl/9JqhMHLuPf3bwTpdhDfLq934sozXbzeXzMEK5xmNloedjl86ZDJwrgPLxwNLUMMRVoo/ut7TfTTQkbJz7CUNnDJQLXRFbfmZR33pvILkxggjGVZHqsPI2/fcGTd6UMHnAd5Hs9ji5KYY9CKAYCTLZhU5CkALn7at2ME2dSlTHTfDoQBzBuWEP2gMNhBx8cly6eGGUSiLaECo/xI6REPgOmSWAiGIwobbBArGFKEY3mcjNLehz/cSYREaSdraa676YCk0xxVrZYSStU7QDjSb611lBAluYQ8mQjBbUYZAzKuaga4KO6WEfwEXBIWkKPqU+itCk2EzXlS5LqwVIn71/yUwUY7Er+PMbY67A84oz4j2KiAN9cTuH38Zwmb6gb8Z43ulwaeCI8cFIfyFqeZ2aziaCLKi7uqWLTD90tX4GKgyhrZRVvCsFXjQwkp21GXChLG1OQXnSqBFGQ6tGL7ceLNFuulJRj0KgXYPAw0stCwcDL2hZHRPbCm8eQeHnu2kAP1mpB/thIXcosNqI4yuuYtepMssZpsTrc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB15175.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(23010399003)(18002099003)(22082099003)(261009223027099003)(3023799007)(11063799006)(56012099006)(261102130727099003)(261028144727099003)(261102123227099003)(261026121527099003)(261026140227099003)(261022105027099003)(261021121427099003)(261021123027099003)(38350700014)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-2?Q?bpwbf6ltfHD3DEbVsJaVVyMGQy5x9TGZnth4hzHa2oJYtAvzO/VEnMltjM?=
 =?iso-8859-2?Q?4deTsxMckZ8gfkophtspeZu+z/xetvNFD8TsZvEd6Axb9WHlV3JsGnvRRA?=
 =?iso-8859-2?Q?nNy4E1tvVWxSjg1I7PtKBhiRBji7o8U+dWZK/rDP4SdmGbvBPL/g0AhvC8?=
 =?iso-8859-2?Q?CxV+Y2m3k4HtT/UzEskwus5/UcHcoqIQ8nJO03ZX2X0+cqP2zp0ufMOzeE?=
 =?iso-8859-2?Q?2XK1v0DIydxAYvB06WsUVevtdtyWaGgFf6GAiYaTMEOxtsFHYzJeoNCk7j?=
 =?iso-8859-2?Q?md4wJJ+6OHhesFiQSwnCuMtW9gL8bnbFyTmM1ER+VYIS08csEmaP5vwwu4?=
 =?iso-8859-2?Q?9DcXztCo4A1+72VZQGuzUZ56nHfoSrbHGMMDrHuDNgpxUiIWNa6ohwCJac?=
 =?iso-8859-2?Q?B9fcOLo6z7qNuIjWcgW4A2Ax1nQjJQjJhd2s/cxIdVYElcvQAf0CL7LnO0?=
 =?iso-8859-2?Q?evowGk4+jDrFWhW3Rq027ZPx4InrLclTguHcifHkMjMzNGsOTlB9xNPfzJ?=
 =?iso-8859-2?Q?WC0Zt8IRwuY8Ok4OOCp8aPAYywt8K2YvA6vxNqQGclm/FG34Gf1EIxsK+L?=
 =?iso-8859-2?Q?Ev5CvHn1wVzE+2UrAgBQFBHkPsjyPm0tYxufbjtg4LlfCIT7piJcQUz1iA?=
 =?iso-8859-2?Q?LXYRd9w+OL+8iE7OV7QGbesvbtMU4WYW6SMNx6UL7ub2Uys6sYm7hD2/iE?=
 =?iso-8859-2?Q?rsxTzcIDkTqLwKnK5E8X90VUE0+UjA5REwDcTOr/Korm9tR44JjWkVJBOH?=
 =?iso-8859-2?Q?34A1WeOOJ7XAk/KXJoylNhQAF2il1GPTZ01RSl87toKMMbj74uaX2eSM9l?=
 =?iso-8859-2?Q?ch05R1OT2x+wEFO7lWw1cKFoDp3TsRfQOl/2EN+4W41UPzs6FeL/4T40I3?=
 =?iso-8859-2?Q?OZRldlPMNVCfr6w8CdwVsNr9s6Jz0BhNWcp2GdM//pZ4JLMzWZd2uGYtxi?=
 =?iso-8859-2?Q?j2MMcakTAgsPa06t95jBT1j/FT6cJKK3iufJFHad8nXJ0latPnmuQ9sr14?=
 =?iso-8859-2?Q?gx/zoFfd1jJk+DSZabT6lkPJeYtVbej6zvmAByGeOTZJn/4plDl1+7OdIy?=
 =?iso-8859-2?Q?3xgSOYtJennxpOs1yNNYvc6a6oTwsIZUo141tQoAQRgRzaIxMC/b7bCGWW?=
 =?iso-8859-2?Q?FZsErLzv4YG3jf/QjssEIpRhQRon1jNbvqoMqdr8fEfnaT8YuVIjBbcwcp?=
 =?iso-8859-2?Q?0EyQU5FHP1qKwGK9Ly5YE1hZcJcjD+H28e3e/DSR5MPfNtBHlqqVK1aauR?=
 =?iso-8859-2?Q?UD2Ywvixl8cqavi7lTDr3UfYknaUN03JT0bBP5eobCs+ZDEPm9fzFyH0ZR?=
 =?iso-8859-2?Q?io40X5SIRCGkGwpZHOutg8QhC0sxv3wHswzMBY3Oh0WryVLhCJGTzI/Vkd?=
 =?iso-8859-2?Q?1MUE8Y0ZV+JuuCySJefem5S80MmNAFzGsYIb6XpfJzF3nc2PM2vrA/hZWF?=
 =?iso-8859-2?Q?LqU6CXjnNW7YA/MLGR3whdB2JZ6G9FAphSUQMIe2RvPPloYeuhQ7485SND?=
 =?iso-8859-2?Q?/CEnwYJdBc0o0q7VJSrB6oyVj7vDbn9CohgFu/GG4Ddfao72IQxEq1waPq?=
 =?iso-8859-2?Q?wKw9sHJaTIc0yr+sVCpONz6f9YA/pxkmlQaGgOwlj0ibJkL28F7pKb71I4?=
 =?iso-8859-2?Q?7ZvmkbFu3AO37VhQ6KBPUnY+rxHlRy54LnQnbci5RWvvZm0bFojw0oDVBs?=
 =?iso-8859-2?Q?A49HKc2VhzlhajKKacIJDFuaTt2iUCjmArBdzhvgOWeCuwpUOWi3RNJfhA?=
 =?iso-8859-2?Q?TvOyi3O6EOwvDh8kasT/JrgcOuXJ4XN1o+zie2ztmGpDTHa13o1Tru0lf+?=
 =?iso-8859-2?Q?8BhcmyCl/zwpaU6q4BAeeCMjipMTdlPc+jEE98l6+getrRz33UUZ?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 253f2ec0-0e50-45a9-cbdd-08df40547c90
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB15175.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 00:32:52.2774
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LEtKyfJCpUViFHr03uedJa32zs/63WdIjmauAfLE10xmd8TGfm7hyYWdjBT1EXjJlPVDjP1Ogj8zFuF69CsGnpFfWY9oBypouBmP1LgMt4l1ZU84aao1ta/WZ3zi644G
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6867

struct snd_soc_component will be capsuled soon, its member will not be
able to access from non soc-component.c.

move snd_soc_of_xlate_dai_name() to soc-component.c

This renames function name
	- snd_soc_of_xlate_dai_name()
	+ snd_soc_component_of_simple_xlate_dai_name().

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Alvin =A9ipraga <alvin.sipraga@analog.com>
---
 include/sound/soc-component.h |  4 ++++
 include/sound/soc.h           |  3 ---
 sound/soc/soc-component.c     | 33 +++++++++++++++++++++++++++++++++
 sound/soc/soc-core.c          | 33 ---------------------------------
 4 files changed, 37 insertions(+), 36 deletions(-)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index 965c2555010c7..caed32327daca 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -401,6 +401,9 @@ int snd_soc_component_of_xlate_dai_id(struct snd_soc_co=
mponent *component,
 int snd_soc_component_of_xlate_dai_name(struct snd_soc_component *componen=
t,
 					const struct of_phandle_args *args,
 					const char **dai_name);
+int snd_soc_component_of_simple_xlate_dai_name(struct snd_soc_component *c=
omponent,
+					       const struct of_phandle_args *args,
+					       const char **dai_name);
 int snd_soc_component_compr_open(struct snd_soc_component *component,
 				 struct snd_compr_stream *cstream);
 void snd_soc_component_compr_free(struct snd_soc_component *component,
@@ -462,5 +465,6 @@ void snd_soc_pcm_component_delay(struct snd_pcm_substre=
am *substream,
 #define snd_soc_lookup_component_nolocked		snd_soc_component_lookup_nolock
 #define snd_soc_lookup_component			snd_soc_component_lookup
 #define snd_soc_lookup_component_by_name		snd_soc_component_lookup_by_name
+#define snd_soc_of_xlate_dai_name			snd_soc_component_of_simple_xlate_dai_=
name
=20
 #endif /* __SOC_COMPONENT_H */
diff --git a/include/sound/soc.h b/include/sound/soc.h
index 338ba5cf85fb3..5abebfa329b52 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -1303,9 +1303,6 @@ int snd_soc_of_parse_tdm_slot(struct device_node *np,
 			      unsigned int *rx_mask,
 			      unsigned int *slots,
 			      unsigned int *slot_width);
-int snd_soc_of_xlate_dai_name(struct snd_soc_component *component,
-			      const struct of_phandle_args *args,
-			      const char **dai_name);
 void snd_soc_of_parse_node_prefix(struct device_node *np,
 				   struct snd_soc_codec_conf *codec_conf,
 				   struct device_node *of_node,
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index d681b2abe8249..0a89fa8cd7fbe 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -1818,3 +1818,36 @@ int devm_snd_soc_register_component(struct device *d=
ev,
 	return ret;
 }
 EXPORT_SYMBOL_GPL(devm_snd_soc_register_component);
+
+/**
+ * snd_soc_component_of_simple_xlate_dai_name - Resolve a sound-dai phandl=
e argument to a
+ *                             DAI name by searching the component DAI lis=
t.
+ * @component: ASoC component to search.
+ * @args:      Phandle arguments from the sound-dai property; args[0] is t=
he
+ *             DAI ID.
+ * @dai_name:  Output pointer set to the matched DAI name on success.
+ *
+ * Return: 0 on success, -EINVAL if args_count !=3D 1 or no match is found=
.
+ */
+int snd_soc_component_of_simple_xlate_dai_name(struct snd_soc_component *c=
omponent,
+					       const struct of_phandle_args *args,
+					       const char **dai_name)
+{
+	struct snd_soc_dai *dai;
+	int id;
+
+	if (args->args_count !=3D 1)
+		return -EINVAL;
+
+	id =3D args->args[0];
+
+	for_each_component_dais(component, dai) {
+		if (dai->driver->id =3D=3D id) {
+			*dai_name =3D snd_soc_dai_name(dai);
+			return 0;
+		}
+	}
+
+	return -EINVAL;
+}
+EXPORT_SYMBOL_GPL(snd_soc_component_of_simple_xlate_dai_name);
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index b0dfdfe8d4a29..54a6d696d59cf 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1593,39 +1593,6 @@ int snd_soc_of_parse_tdm_slot(struct device_node *np=
,
 }
 EXPORT_SYMBOL_GPL(snd_soc_of_parse_tdm_slot);
=20
-/**
- * snd_soc_of_xlate_dai_name - Resolve a sound-dai phandle argument to a
- *                             DAI name by searching the component DAI lis=
t.
- * @component: ASoC component to search.
- * @args:      Phandle arguments from the sound-dai property; args[0] is t=
he
- *             DAI ID.
- * @dai_name:  Output pointer set to the matched DAI name on success.
- *
- * Return: 0 on success, -EINVAL if args_count !=3D 1 or no match is found=
.
- */
-int snd_soc_of_xlate_dai_name(struct snd_soc_component *component,
-			      const struct of_phandle_args *args,
-			      const char **dai_name)
-{
-	struct snd_soc_dai *dai;
-	int id;
-
-	if (args->args_count !=3D 1)
-		return -EINVAL;
-
-	id =3D args->args[0];
-
-	for_each_component_dais(component, dai) {
-		if (dai->driver->id =3D=3D id) {
-			*dai_name =3D snd_soc_dai_name(dai);
-			return 0;
-		}
-	}
-
-	return -EINVAL;
-}
-EXPORT_SYMBOL_GPL(snd_soc_of_xlate_dai_name);
-
 void snd_soc_dlc_use_cpu_as_platform(struct snd_soc_dai_link_component *pl=
atforms,
 				     struct snd_soc_dai_link_component *cpus)
 {
--=20
2.53.0

