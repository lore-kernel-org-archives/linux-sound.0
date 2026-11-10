Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.229.14
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794288248;
	b=Vt0ZMh+ebtnFrhYcThn9vNqWQUlmdS2vNyffafZBQiBMf19zxnXMRcT59iX2o+jasb/I
	 G32iQMQv4fGVfeJlxL2fElr5rwRtwBAERfuMUtVq4aAoTBJdV5Moq5KV5OxxLWiJMRX89
	 nPl6m1OCRrQ4Rhrfz+XSECdxUMXVyrwBgwKPNYzHO4RMS/508D4C0KTeWoEkT0JGSzVgv
	 ZVBV5idHL3NR9HqcM3PZGq7sO7+wp4oUuCtyUIG2Sips/LK9gUAsL/x+BWdds/pw7NI1z
	 dnqhwWF7XdNoDbySOf76Ewzf8j2FwZlUSk+g7x78T/+pcQ0GQNSLPVIFxWETwho41Eg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794288248;
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
	bh=0cXE7U6Bzcawqc3MTMO1HouX8Ttq06yYu/wOX3kIbck=;
	b=vedAzNrwXoWjo8iIR+vJS0ecZKmrP8MwEIZT9pNJa72ZM280OBW8gvp6XjKN2n1ytP1V
	 7VEp/XKrzwh1lbq+S0bclVZZSBM/+QLnC2sVKG8T3/o96bI5d3j5Fth01FcQIF6k1N2rv
	 7JWuuFUl3cRWUVfbR9te8ED1mJTwFSbhmUCN8FxRE9FoT54gJjHnwwMdzxZ2ZEZE1d7gu
	 IS/jKPTSeyEFKrvOHz79WfJsdnptsg4Nd/3r3FuMCKbDM4a1OSjSCpfFRA7Q5e8vnnScG
	 XAnG/jP6JHlnvlikd8G9W1azbNrzJOZyLd5Z/qtu8NVgwEgainlinV2llum2NTgeIcA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=C4ReTgGP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.229.14
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010014.outbound.protection.outlook.com [52.101.229.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD25606A326
	for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 05:24:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDD25606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=C4ReTgGP
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uhVM7heK11nwD8mlzGyQaLj0lEvLKP33BlUEujraifVdNmLZjiNEn+vvvJ/htMeTENTJVw/wLMQFt9dTBLT9CsgoW5HCcOGf6PQrT+gmQEkjILrO32Ef/duEWfkXnZrYCo66Lij/BTnXqawGcCnz4qKXo+kx7XnOAKGD1Q1hruka7mVGLDWdl2Q65GiuldqujmGMm4quJK0uk0Fu1tu1HzKODt0JdwaY9JKTdcKrlxNSyRPgSqlBHESdkOKGZW1cXFS0crCjl9OMqq5R3rkoKVQhar8ViijJZ8xdHYSZc2cTfIXPCtVcYqM9XrguG/NW1k2gWHa6ULX0papVJMvqBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0cXE7U6Bzcawqc3MTMO1HouX8Ttq06yYu/wOX3kIbck=;
 b=CZeLSjO+CXNurcYd/d0tmWI18aSNkti0u6oxTccBfWBDRcqGjYgF9O/uRMKFkw7qAL0njT8KahiZG3jgVwhtrD7l8ntOb7gZ9l2q3tpbjyu6ht5XzqZZFG86RCXUBmEFdbz3K1f/jkSkgYGtLezod7SyqtJpvdG6ogro9hK++BZdEnd0rltjdnNaKkfFct7OTP2qxDQcXR4B90KGh75g/c/7H8UC/LTawVOhfxf40n/3f7OBi3AQlrSsVpjbctcXdPTUqAiTZ+t8Cvp1ung0PoyineQYHqH6zzD2Xaf/Aw3ewSSvpPNdaLpWbOM12us9aJsdKeo2PD5z/aPiyi9GJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0cXE7U6Bzcawqc3MTMO1HouX8Ttq06yYu/wOX3kIbck=;
 b=C4ReTgGPyNCAJHNFOwgYkbr4BXPdhffNmVUHx84DYAn9LbJ+bTD6GVHJMc7lRYqJ8fgWjUiPPAMeSt0XeYjkorkZ+aLVHQlax16sC09wxHnhr9TChQYjdjr1u/HnxhW4zU7ie2mUslruDz0Mn3Bv8u9NleuRrzl7jQSrH0PT93Y=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com (2603:1096:405:27d::8)
 by OSCPR01MB12483.jpnprd01.prod.outlook.com (2603:1096:604:32b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Tue, 10 Nov
 2026 05:24:06 +0000
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d]) by TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d%6]) with mapi id 15.21.0592.012; Tue, 10 Nov 2026
 05:24:05 +0000
Message-ID: <87y0b1mf7u.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 07/20] ASoC: soc-component: add snd_soc_component_name_prefix()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <878q31nttj.wl-kuninori.morimoto.gx@renesas.com>
References: <878q31nttj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 10 Nov 2026 05:24:05 +0000
X-ClientProxiedBy: OS7PR01CA0260.jpnprd01.prod.outlook.com
 (2603:1096:604:255::10) To TYYPR01MB15175.jpnprd01.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: TYYPR01MB15175:EE_|OSCPR01MB12483:EE_
X-MS-Office365-Filtering-Correlation-Id: 24428179-6e33-4d0e-cb9c-08df3eead6ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|52116014|366016|18002099003|22082099003|10067099003|11063799006|261102130727099003|261102123227099003|261026121527099003|261009223027099003|56012099006|261021121427099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	zjehtMY6OfBSpo/ItJY/Kw8x2IJx2lyQGGTM5lYNTxCFOmToTsRXVxmbL6V70LWyVrc3zquBs3Pno1JrFZD4dEQnqJvk3H5KH+MwzeKELtqui9BL+fvI7mlvQBie/05QTmhNiKujEbkvXbcyzjj3ActtMcbtV7Fbzf9qWRvgUEKfzZoYAFGMQ5CXuh+EXIOIZSv6hoDQf9Yta13yknkrRiy1nnhAdXacCaRPV05q6A24HkQPGQ5VB74aCuIQTar83LVlJgaAY+ef9wMeuGDOFRIpnrUjYjtN6dg+ZvOvjNNH6j+8LcGv4osG+zwCb9hIWXm1N4BjbbmGO40lQr9rGqMA8Q+6vaUDTK/eHnLzYk296s2WQdif+tETcMHY/2K4MOh3Jyn0PJ/jrJVYL4Q3a7Q70EgWlReL0BNdjIowb9QNXwXdhy6gFsDQdj7eB+yNI4+A21wU0rycBnRyCILC/IeAHRkDUIWzmdynXZyqAwDwP7D1F3l6prcaMsOuFGJzdRzw84AwQ8GDMUzx9REywa69g2qIwhC4mit15Lhfh6KVOzg60x2o/0MQxzKwJZlfZm1vUMwVnte+iz/zTveK2I/BRbaFNIuY6kWKArX0oZ1iL10Ed+e6jvf0h4Y41JSmdXCNrcHGyMsGLdWcgNFiXc6tZWIQvPVGv7WTcG1Cuu0WWgeleSkRNlgKr8Wfn9pePwFwwS9XH/eLh8LwvYRKmA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB15175.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(52116014)(366016)(18002099003)(22082099003)(10067099003)(11063799006)(261102130727099003)(261102123227099003)(261026121527099003)(261009223027099003)(56012099006)(261021121427099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dpZ0G/T3SijR+ejtTC/6s2BZzLbKC+Cg6f6YkOlCbaWSw6jAaiZScn54cYSv?=
 =?us-ascii?Q?VcDPwPAp9P5Ja9UOxLXj8sX7gIZt0LVh71ks8W0S1PTZoAaWSFRkxh/FbuP6?=
 =?us-ascii?Q?gJ6w4aayBqCphYNiLAk0ZRoIB6ofbWHKAkPSjAvxYqBpeChgYnD6FXNokkmY?=
 =?us-ascii?Q?biJFq6kLJqXOGcQaNMknHTmV+E5MmGEiRIWIyjFCDXAqVOf+1sdTMKCo9wee?=
 =?us-ascii?Q?nILs3pSX2LeunWPyT9+VGM5+cjAHPNAu9wXaqnca3AC+RyijiYREiSvZReTe?=
 =?us-ascii?Q?0FyzeHh7Or2LkawKpJenMYGuEBiDXGw9KaOpC+ZeB7skS4d/poh9TixLJgIn?=
 =?us-ascii?Q?gMjXS1RVk06Ina+XihM7a0Mr1okDD8JJLNrI8A5jMhAqR1eEE9hrEzCtghAC?=
 =?us-ascii?Q?7aKrQ5nVAP8oZw+S54WffPB3Zp33FiQXdrvH28s0Wl0kYAF3eaDIROuEjytF?=
 =?us-ascii?Q?K71jn/tt7wMNNbLgI/+Jdq2glSEsLKvbdjYcdXVk99X1LLKaT+ZtTQgv1diG?=
 =?us-ascii?Q?v3mHlg/s9Ly1eUu5NR+NfipBK/XowIyJcwzoRaCeIMXFy6xtZ6j4vnOxGir2?=
 =?us-ascii?Q?ma0MtczZQMGHwB8TeKqCepbm5A/adpcsWYwwiuqlzOXiyWQOo2RpcI5a8TGK?=
 =?us-ascii?Q?ACxWaggWeWyB5DonVkGsFSlFy8oh5lF7cprYXLEmL0CVOciPK8vdE86US3gI?=
 =?us-ascii?Q?3yBxwpnK33a1a/xzW7dqzT1i1qnKzg6fCHAK1BpUCVU1CqVJP5n63qUxytut?=
 =?us-ascii?Q?oOgh1ipZqpNjF3+GBKIh7Fw6h6QuddC0+Og/l7aGBw4e3gDIkMtkqKW6IEp3?=
 =?us-ascii?Q?c8LSLVwL0A340+2fDZEtzIytBpegggqP81cj0yVEcuswAYwL3Z0cGaoR14bT?=
 =?us-ascii?Q?EIBob2Ved3g/4Xgdy+spAL/TkOakZWoIfudQF/GIszY1ylwMyWtFYue3vAI8?=
 =?us-ascii?Q?CqPEebhs+wxi0W8ZiUACLCIxeRCNGpnIRSKmHg1ysKzw3BTB4fkXjoCuO/Rm?=
 =?us-ascii?Q?HKuGjRABIE9BpdZitiqNRHcRCOjwnNuZYY51EzTWS2y+lDQm/lt1UuD+1NS2?=
 =?us-ascii?Q?qgCgJTGQW8qINmaboWYrNOjTt9aQvmMjSl0YRi2F4cwYXbE8aytMXDjHw63I?=
 =?us-ascii?Q?OdEkewGJTTbqtW5Pf5c89cnPENs5mLmARTWXJYUL3BzN2Y1O55snN9dEzWwD?=
 =?us-ascii?Q?XNuDO3ZR+59a5yWHUxO+66l6IB74EtyiPW2grRM403T7yXTIj4w0DbbdBxfs?=
 =?us-ascii?Q?ZFcljLxqB+ITcfXK64ii2FbLoBKcgFRxpHFGO5OSCdH3THy+i2tuHeDMP09L?=
 =?us-ascii?Q?KoMU4WkAooCtsvyyrPT5BbssSwdnRkCpczZECesn/mVR2cLPVQMHY9WZkLyP?=
 =?us-ascii?Q?3HSEelq0Nskn6rWy9jl7u8vFs9AQ9jDaabnSQwXFUIm7ji2Tq1VQKmalwRt5?=
 =?us-ascii?Q?rETAzcL7n7lH2xCKk0NjTDqYKmMiTv7732Tr1jVj1ZedF1v+cyu3XRKmsJj7?=
 =?us-ascii?Q?gID6TGhA8XcdGire284sMHf3eLGcFjspB5OahYxsqlXl+0Jpb4nmXGnbGcSI?=
 =?us-ascii?Q?khRGduiJK1DbhiB5U0rOi4/wdlOBrq+GyaEqQK4yjCSUzhgaF12wVGFW/dcT?=
 =?us-ascii?Q?e4fu03piC+aYiMpMnfAe0JbqP0e1KjwLx6g5VP2SUgq3J/zIQ2tVxBuAyMhv?=
 =?us-ascii?Q?++D3etDOEw8H5QtxSV0GZIJ48xMJ4L/0s6qOSvbwiZ1Fi8UInjRV25M+oaOv?=
 =?us-ascii?Q?rjRljnZxaF8kxvEjPbC9AxUUn/CsyLNbZWg9sGlk25KX+3eHqcwL?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24428179-6e33-4d0e-cb9c-08df3eead6ca
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB15175.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 05:24:05.8417
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BtQmD7Hb+3Opue1dWebrmCzqyE8OjRuD45XRwao5QrTqceaRXLDwxYGJNqus4gPjsl4DbgTEqZ8Ut2hIU7MGDCagNkqccB1yDDsQzaoSzCd/n6BcXO5VcnZJ/RYDUrVj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB12483

struct snd_soc_component will be capsuled soon, its member will not be
able to access from non soc-component.c.

Add snd_soc_component_name_prefix() to soc-component.c

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-component.h | 1 +
 sound/soc/soc-component.c     | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index 4e538942df643..ad148e341fdf0 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -290,6 +290,7 @@ void snd_soc_unregister_component_by_driver(struct device *dev,
 					const struct snd_soc_component_driver *component_driver);
 
 const char *snd_soc_component_name(struct snd_soc_component *component);
+const char *snd_soc_component_name_prefix(struct snd_soc_component *component);
 
 void snd_soc_component_set_priv(struct snd_soc_component *component, void *priv);
 void *snd_soc_component_to_priv(struct snd_soc_component *component);
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index 838a00c2b325b..0dd0008ac59b9 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -43,6 +43,12 @@ const char *snd_soc_component_name(struct snd_soc_component *component)
 }
 EXPORT_SYMBOL_GPL(snd_soc_component_name);
 
+const char *snd_soc_component_name_prefix(struct snd_soc_component *component)
+{
+	return component->name_prefix;
+}
+EXPORT_SYMBOL_GPL(snd_soc_component_name_prefix);
+
 void snd_soc_component_set_priv(struct snd_soc_component *component, void *priv)
 {
 	component->priv = priv;
-- 
2.53.0

