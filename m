Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.74.34
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795571061;
	b=ZpOjXDVE8nipuEHXwGoJh956sjpqmBJZLLH2IJL0ATEENEvenZxPgrzGjBSmVf/QFwQ/
	 +F8P/9op5Ocf5vRN14PERzOGb+IMqt4w/o9p+on0/VnaoZrWPaTMIjSsrC1McCCNcU7zX
	 mD07wIwIDgIBZxrPvBaQG+Dz3SwTbSAxiZjpjbwafrbkkr+u50vk1Bord5FqSlaKQw3pH
	 jf4X4XMuv32sIi2guKd4muVeVVQJjWEhHEcTUFbxNkPJZGMoD1WNRNHLawFEgH+EuxIDF
	 ft1JM4e5iFrttymoZ9I8kbC9iKvH0oANuG+oF0r0tFPOhTUVbR+EIanTwSWPIAT7vLQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795571061;
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
	bh=T6fw5ekDRJyoi7RUINzx7GCn+NnGkPFuV6YN8OcrNfA=;
	b=YyKQEuyxd5bO7/TpAGivxBo9svDT1puI4+XRZPFORuQ9gmwzbtOS4322U2TZWYBSMwjW
	 awe262SJjK24URpbnE/KtTI3Ms5sEYTbmxa1GxJLCkB4GvCig45ZSHEvQXMh4GE38Yl4n
	 49p6dPH/kP7gHV2gHbWby76krsjJfVt01XDco75q5SSmAW+2yOUjaEvj0JlkE5MukQ3u4
	 90OPSIyLH3dNcRGSMalKbN10BrXFKex2LDt9nY25Oe8sJMG+UmIkvBb7yk7im9jbDsYEg
	 9TZKif1ki/QqEnZphCjVFwUKcsJ1Yf4lgLvupKeHDWQN5yQJZanXKlRCVZ7V9HvdCCg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=JyLfK2ir;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.74.34
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011034.outbound.protection.outlook.com [40.107.74.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FEF3606A31E
	for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 01:44:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FEF3606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=JyLfK2ir
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vl75FWHOGRaQIo6kALj+W0Y20teyuGZA/I3fYRCEXuOVnyk0KAR/rAqJm0ctD/GfgEuvTnKKKIzxfC35W6n6u3Y/XYCNawYLXK7ZKwTBLu50j7IUUZJ5q73dZ+FPPDywdlqIKy1dnWvq+8un/y4873+hTCblczMPs+zyP3a5rRB/daRe6yq0g6eDWBwJMBwidihfQVDNgcmbWtWVLpIL5sKa6kV9vtiCG4CQThgwsPlK7v6Vai8FQIv8nxkUSHQ/6eQxwJ2ZEhV17abHcnkBDh5jMfYR1nrPXazesgtI12Rx9ZwDzkb5AcQSz5OxuAeQIMatDZrT2fUQT5HUvsTzfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T6fw5ekDRJyoi7RUINzx7GCn+NnGkPFuV6YN8OcrNfA=;
 b=tCH+0VHQH0ovJiz62v5LFTRdcNSTZzvjbsf/RAve7N7M3FYzr1pKOrDWxeCSSV0XjtNYpFREo0Jqqmj+XIVtghMD2WRupHxLNRpNKd6EhYsD0imUs3gx+f/21/tjPwGAPEoM3vhm5csCgWRUMMS6ckj4KtWO9Ucdhex6uTMKARi8EmlG6cXEh31iBbBX5fK+X7Y3DevNpv6uoS71p+6OQr3jpz58dPp2HfSbXhVI7VCXJc9avz6tW5sk+SkitVRUL12Rgxa1aW86kLQgjL4AMM1PGa3zwms3pZGw5Da4McHmc2n91QqZ6eDZelYLvVTIS3JZfSSAYU26edcTD7yBuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T6fw5ekDRJyoi7RUINzx7GCn+NnGkPFuV6YN8OcrNfA=;
 b=JyLfK2ir7wjm9YcBaKK6GCeYcOzx3wOxHyogPCw6fGP+GfJkkACfqrSf751MZOExY4nGWBbyGRR4ey2xg4J1m4xVAR1+9JPCCwoRMTPpo+F9F3lsCmsZeC7LTXkjdRKFb4T0D5rY8Adeqf2+52b7W9qKJ8vCcz76yD5+IXMW+Js=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OSOPR01MB749128.jpnprd01.prod.outlook.com
 (2603:1096:604:4ba::14) by TY1PR01MB10739.jpnprd01.prod.outlook.com
 (2603:1096:400:323::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.15; Wed, 25 Nov
 2026 01:44:19 +0000
Received: from OSOPR01MB749128.jpnprd01.prod.outlook.com
 ([fe80::6a3b:d29c:c743:5180]) by OSOPR01MB749128.jpnprd01.prod.outlook.com
 ([fe80::6a3b:d29c:c743:5180%3]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 01:44:19 +0000
Message-ID: <878q2helcd.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 26/27] ASoC: soc-component: add snd_soc_component_active_update()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, Alvin =?ISO-8859-2?Q?=A9ipraga?=
 <alvin.sipraga@analog.com>
In-Reply-To: <87a4mxg01k.wl-kuninori.morimoto.gx@renesas.com>
References: <87a4mxg01k.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 01:44:18 +0000
X-ClientProxiedBy: OSTPR01CA0060.jpnprd01.prod.outlook.com
 (2603:1096:604:222::16) To OSOPR01MB749128.jpnprd01.prod.outlook.com
 (2603:1096:604:4ba::14)
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
X-MS-TrafficTypeDiagnostic: OSOPR01MB749128:EE_|TY1PR01MB10739:EE_
X-MS-Office365-Filtering-Correlation-Id: 4571c382-607a-4371-08f1-08df4a959f04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|23010399003|376014|366016|261009223027099003|18002099003|22082099003|56012099006|11063799006|261028144727099003|261102123227099003|261102130727099003|261026140227099003|261026121527099003|261021123027099003|261021121427099003|261022105027099003|38350700014|10067099003;
X-Microsoft-Antispam-Message-Info:
	1PlMd5RaY+fGwTNcOKEHdkZUi3F9Q1xl6C4qJVuObgpdFkZ9DKBiUXp+0/b7PBCMnLN9AKeUHcz5nHjawqeyCDgCZZbPj6k2LlnLjmcqKw3WaCJREmeUuXaJjU2bZW/f9ZKy/IEXJu+RNKy+fFIm8cRStDoaz3SsLMupc8y2coaM12SOws6A8a3hP74JmVyiX3UO85lT902rm7sMcaPzAeRIZwhBNWr6Mr9/XRNILew9OO/Q5Zl0bNSwgE4FU0TSN2aQStzMpouraLBMXDvglHPx4NEHY/Z5DVyHzhlhBinqMELzBWcu81xwHGW1qvgkZBbABtOzZy7G0FBN5CdNIZPnaigYmEkI77tEhyl5iWn6Bs659Pwf6VajxqM3ZvqfPbhGabPYaS7NQf2ZKG6nuoFLnnY2rh1GEo295kAcTRNyFEsbNWSqcsBAXFrRIwl9QRHq1G1pXh+4JwgMcqcIqtVq2/uJ+DjKlbJk8el+tCgjobsbPosk3cwYIx+MlwxkO6WNOw238GU/ymXOOr/Ye4KIDir8Y6KuS0/8/Aa4P7GiopY+WgsYLEbsGtM+lfVm7F36Z9hf/Os+gWYWSUtSscskD25e4k19dd/HQGVnU8pGAHmaC3ZUeq3HQUioMC1nSjaUnMjKjhPYjTejG15fAXoHmdYQnq02tJ7yV63En/JGt/6ZnHvpRw2VwlVpWJmemEBBJmiAL5+356VzLPUiGT45wvH9PrKEPHiBqPXxQ8M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSOPR01MB749128.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(23010399003)(376014)(366016)(261009223027099003)(18002099003)(22082099003)(56012099006)(11063799006)(261028144727099003)(261102123227099003)(261102130727099003)(261026140227099003)(261026121527099003)(261021123027099003)(261021121427099003)(261022105027099003)(38350700014)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-2?Q?4NR6PhUamKIuNQpcAj1HyxZaCdIHiOEGaQ1Jd/4y3i2n1xl1n8H+5C48Rc?=
 =?iso-8859-2?Q?xQJKGUfAVzRAV1gxkLiQPL0lDGgbLEAF+k0vvrwA0ByizeRgq7CTZRblH2?=
 =?iso-8859-2?Q?HkIlk4ZPsMKxB1GkqZIjob39mTdzJtrvmckD0YDSIn/jXqX/Yn+U1xoZKY?=
 =?iso-8859-2?Q?uZd4MPeESb9VA/yvcp/m9DvX4uX2gR5YslY7t2ar1G3s1/1Cue422M/Q7o?=
 =?iso-8859-2?Q?9FJQw2JHBryyUNPjm8JFZ8WzMINwNpsiris6Q4QntsPY8cgzK8hDFLZLCo?=
 =?iso-8859-2?Q?YoHMdsSXITbh48e33Fd5QXRSBDWhO7L8om8tZj/3O34WHwT4v4zN1braxY?=
 =?iso-8859-2?Q?KDEyuJiF+mq+TSH4X1Rk7X7Vt7B1EicHcL7GZKEmZxuy1CfZsVtBHiUzXd?=
 =?iso-8859-2?Q?/5gyQ17tzm1gLEariZ2SOYmdGU7bqT5hRFeyFbGb4NO0rQXRyGJQhK+qFS?=
 =?iso-8859-2?Q?Hi5lj5HNKvva9k/DrioURKVq54GpzwO7dMowEH1RpNkIgqpOE1QdIYPYFd?=
 =?iso-8859-2?Q?BvLQFX4zFN0i2GKKj4MPveuy39CTaQ97Cq+6J8vl/DEVabG/n4ib2BCnj9?=
 =?iso-8859-2?Q?iQKygt97gP8JRQ8jK/ou8E1CRP4LP/q5jdKOx39vud62lpIS873rnGc5lL?=
 =?iso-8859-2?Q?3SrwUNb8o5LDqMvJvAjMvDzA/9M+S/sc9PnESTtc8/WaV2oz2+mRnSO2nj?=
 =?iso-8859-2?Q?UtvZ6IQFVwGrh2mdsQukDV5RHKTojTwoPQ2JZMyF/np5QD/6b5zoHbgX3k?=
 =?iso-8859-2?Q?WqFHpYUeyOV8plTrcPI+iTx9PzzWjwKccJOCIRlX9+VTikfcYP48uUw8G7?=
 =?iso-8859-2?Q?gErFGmFnNAukqIWkFc1pLgXXN9/p+K8gYrlrbnuQzVJHbCfmiK0gwOIOq8?=
 =?iso-8859-2?Q?YIKCH60UV+0iDPH1NFPBrqA1DonD5tESaAXqAuRQ6UW7mB77KqnpLBQ0EV?=
 =?iso-8859-2?Q?4VkeFAcbwltXZ1yx5ixBPWp/aZjlTbYEf1MHX/UgD6uroQttLwvvI+MsuC?=
 =?iso-8859-2?Q?6/HR/vP2GOyOwc0XKiqCMo7NJ1TOqJ26/xZ6G1/QFj3kNXECK5EjGgkICS?=
 =?iso-8859-2?Q?j/HGycWFTtf+8mSLgyDfBvrkzHnj8/2Lnceep+m3Hc814t/jHbcUy5jlKh?=
 =?iso-8859-2?Q?+ed97CGdgtqVyPPYP4LG+Z06YkaXS6GhjL7FJ/fowQJcX+XY6jkCMyJM1Q?=
 =?iso-8859-2?Q?EEu0IR0iPy95gWrvxJ2+/lAG8TQdUdDyQMmrkhepBABbalG+e0SrRJ4inx?=
 =?iso-8859-2?Q?13lhFOEeu2mObR4h8XCVjkDubt0ne3f9Ipj5geaSUXweCHZvuuTFq/H7M7?=
 =?iso-8859-2?Q?zvXydaBsm7kPuoqyiGjVntyysgP+gaKLajlQZbtOUZmh/YYtQqH5P2esgK?=
 =?iso-8859-2?Q?1gLMVDArIxL0+EEXkwmDhNmwoXQ6Y9R9viMjxeFoQEoRGm/YmNjbgp7oZ3?=
 =?iso-8859-2?Q?yKQNGMs1j1IzR+1lRvp5un1kDRh4wiAYrItIhMPaLaXjt0/XaDa9+siFpr?=
 =?iso-8859-2?Q?ZMHGZ4ebPzBGkiYQnjUMpJQZVpmrrabRSW8muY0quarONedf/nF7M1Y2Rc?=
 =?iso-8859-2?Q?Y6cM0Ily/OT2Ur2kZcnZCUEw8O6FYJUcwWeHwL1oUGIhiVT/mW7LQQiaZJ?=
 =?iso-8859-2?Q?Lp0/4jles/BX7hLlQ2+R+OIIJ9TkhM85V61NerfGBtj1ppIypvEPZKLD2x?=
 =?iso-8859-2?Q?FNdopqmitVp5L7+8K8QNx4vr+YBnCcm/SUTtDjt+uTA+gwzY6vk+/KCGmZ?=
 =?iso-8859-2?Q?CGOCDqcYGZMiN4I5QT0UbWkkeO0RPTN82J0N5ah06sDMydxjxy75AXm58H?=
 =?iso-8859-2?Q?/KZG8yfPOyEdi3CDYpX03zXW/B8oPrPsiAA7nwsp+2ASZaO6KrWO?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4571c382-607a-4371-08f1-08df4a959f04
X-MS-Exchange-CrossTenant-AuthSource: OSOPR01MB749128.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 01:44:18.9265
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fPhHjCM9fupFzeSHAKDIo+7Xeb/eRemLewMwWGpmfzgEZao28rLokJ98W1yLek96UXL1q5T5jUcEqUFAb7M099kJyPiWKoRb/gPWNNAPc0ggKGUiFSpgG6NlPyJDo5tB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB10739

struct snd_soc_component will be capsuled soon, its member will not be
able to access from non soc-component.c.

This patch adds snd_soc_component_active_update() to handle Component
acitive count.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Alvin =A9ipraga <alvin.sipraga@analog.com>
---
 sound/soc/soc-component.c | 5 +++++
 sound/soc/soc-dai.c       | 2 +-
 sound/soc/soc-internal.h  | 1 +
 sound/soc/soc-pcm.c       | 2 +-
 4 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index 806aa8ab66092..5475938f80738 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -104,6 +104,11 @@ unsigned int snd_soc_component_active(struct snd_soc_c=
omponent *component)
 }
 EXPORT_SYMBOL_GPL(snd_soc_component_active);
=20
+void snd_soc_component_active_update(struct snd_soc_component *component, =
int action)
+{
+	component->active +=3D action;
+}
+
 int snd_soc_component_num_dai(struct snd_soc_component *component)
 {
 	return component->num_dai;
diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index 596180367d9a0..73aea7291fa73 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -713,7 +713,7 @@ void snd_soc_dai_active_update(struct snd_soc_dai *dai,=
 int stream, int action)
 	dai->stream[stream].active	+=3D action;
=20
 	/* see snd_soc_component_active() */
-	dai->component->active		+=3D action;
+	snd_soc_component_active_update(dai->component, action);
 }
=20
 int snd_soc_dai_active(const struct snd_soc_dai *dai)
diff --git a/sound/soc/soc-internal.h b/sound/soc/soc-internal.h
index 98ff0e2fc2e1d..1190be669eae3 100644
--- a/sound/soc/soc-internal.h
+++ b/sound/soc/soc-internal.h
@@ -70,6 +70,7 @@ void snd_soc_component_remove(struct snd_soc_component *c=
omponent, int probed);
 int snd_soc_component_probe(struct snd_soc_component *component, struct sn=
d_soc_card *card);
 struct list_head *snd_soc_component_get_list_head(void);
 void snd_soc_component_connect_dai(struct snd_soc_component *component, st=
ruct snd_soc_dai *dai);
+void snd_soc_component_active_update(struct snd_soc_component *component, =
int action);
=20
 #define for_each_component(component)					\
 	list_for_each_entry(component, snd_soc_component_get_list_head(), list)
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index ef8ccf52798eb..dac353fec4bcf 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -374,7 +374,7 @@ void snd_soc_runtime_action(struct snd_soc_pcm_runtime =
*rtd,
 	for_each_rtd_components(rtd, i, component) {
 		if (component->num_dai)
 			continue;
-		component->active +=3D action;
+		snd_soc_component_active_update(component, action);
 	}
 }
 EXPORT_SYMBOL_GPL(snd_soc_runtime_action);
--=20
2.53.0

