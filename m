Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.228.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794443603;
	b=qA9CQjcLD5b0MKCaUwFs2pL8IDZOjxDdJOv9ko22LNyYjzuh2FfCID5OOBUbruU31DqX
	 QD1jORZreAqi04zlUqqjGB/yG7lgEAnBGFCAVWlzLrCmpkvSNhY/HMV734c/tIlenFf6P
	 AEBTO+/up1DROc+97VjhvOkGgVkMeOkn7YcQ7D1BnymTDz7u/8Cfu9ZXUf15G5bS9fDtj
	 ukgV/TZY5g+G4FAqWQ93Y4RbIT+ftS0WZGvwEof9k0FXgH3OpGdtk8fFOSNvAXjcB8u1G
	 Z1fu4r9FhCUtKnkQkGne2dwkK9xOwHMNoDfgwurJs90lgNKbMyB6ktHhIj5CJBFiucg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794443603;
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
	bh=L5mcWiXZIS80QITtTo2iByqma2uhF61tMcLV/jcm6a0=;
	b=07YA3Q1Ao2W5M+R2+vxdLSEnm5sCV6ZknDGyf0u8YgS1LyOlDQ3eCdzRc9pfMNlj00bP
	 ievTf63JwN9xlSVqlp//bQsw9iFj6ATWCM7kKlO5Nyjpxy8FSNf4tKYNar5R/v7xga2lo
	 M6/2rZ3Nby1nSJQ7UAwPaKRWaIGQ7bZfNV4hoVpOoWHX41ldu0NKtVvFFHok3vTIHicnp
	 aZnPhj/mc/Tq8ZtAYaFuIskKd/ZT+zfgKNbWJRokpkXSu727dEU4cCN2fs37PHn2MTrtU
	 55SMzXLlUZC+aaiRdEMAaeiFO1jhPvw2xF3oW/M9QCT01Hl5/MdCM4MJn6IlX9fN4yw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b="Z/bTkQpR";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.228.54
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010054.outbound.protection.outlook.com [52.101.228.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8A99606A321
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 00:33:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8A99606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=Z/bTkQpR
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EuDLr8p8T0saelu/NgRihs6utPcv0h9DK7NgPpmt1/ySf5F4SSKvInoUJkrNEaPGb+KofSoqTqBqiwyS3sAxnejBHPrL27BLRAAqXuNYwT1/FJrR5+tSBGfr7IiBAdLlPcVkpf8ddKUpp7fHKKlBShF3e+EWcME9tqwTJXxqv6otDuJDUc0DmKqY2hXoAapR23ogczd9ZtODh57v8on4/j6ryteDcONeeHBEGORpmW2PFXoll4JzX1HflQciZI4lUK4VP4hZ5uHGM42unkcgAhTPiLx+V5Yv1a/jgUVB8OHmqu2lu9ydoJDqyRV3lxBMYHILUjP6ZBb4+j2HN0B92g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L5mcWiXZIS80QITtTo2iByqma2uhF61tMcLV/jcm6a0=;
 b=v2fDi6YVTe1W9LTkfVd+X0HdfPqv7qwgtp3CjgMbtHkVly+cOhqV5LiXxUPyPDO0MoptEGTWzgKdQ9dx8+tlZO4CevuLUNAKDtYjUNm/kFxGLji+vIV9X+ywp/Hmk04/L+hNQpTnh9O2ivZOqih9tBCYUFsNjEtJy/4nqKdWR1a6+kEZUf0oNfuT5PKm9bibVEqz7M5kKQQYlaKLbHzwjLJfoniKdCIelJW/h8oCIFhkiq2bI+Uka5h8O4uawPro82BXVVRrj7gO+RktxevAjRQuJFKliXWmvMi3gb8f8LqPkpHYTl/pB72M35WoLhZgCrRTm5fq0uV32v8sO1J1fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L5mcWiXZIS80QITtTo2iByqma2uhF61tMcLV/jcm6a0=;
 b=Z/bTkQpRnqgrUhOcUzGLOgOuWpwvtTKLGSYNKX7GnBmhViNa/7kIVZZ5vcQEueHRtxyt6rIIx+9xemkGPEc4vAfoYK2f4vgBHfTTZiO8B9N3By63j1du93HLXnVLQAJJ6b6G2md5sBFPXm+5VF6Lkpph8qATqPhYojQgKteKunY=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com (2603:1096:405:27d::8)
 by TYYPR01MB13263.jpnprd01.prod.outlook.com (2603:1096:405:16a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.12; Thu, 12 Nov
 2026 00:33:20 +0000
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d]) by TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d%6]) with mapi id 15.21.0615.008; Thu, 12 Nov 2026
 00:33:20 +0000
Message-ID: <875wy228j3.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 21/27] ASoC: soc-component: add snd_soc_component_regcache_cache_only()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, Alvin =?ISO-8859-2?Q?=A9ipraga?=
 <alvin.sipraga@analog.com>
In-Reply-To: <87zeve28ol.wl-kuninori.morimoto.gx@renesas.com>
References: <87zeve28ol.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 00:33:20 +0000
X-ClientProxiedBy: OS3P301CA0046.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:604:21c::6) To TYYPR01MB15175.jpnprd01.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: TYYPR01MB15175:EE_|TYYPR01MB13263:EE_
X-MS-Office365-Filtering-Correlation-Id: 492a549f-3092-461c-c9bf-08df40548d8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|366016|23010399003|376014|261009223027099003|38350700014|11063799006|56012099006|261021121427099003|261026121527099003|261102130727099003|261102123227099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	QhdxWatjuZl7Q8P4xdt++CEOleE5fAZ1HkKdiI+yDxhQ1QYuowmHQjNKaIFZS6yvQidMMLrDuOUavfq+VbcQDYCpANegNl1F2jJ+IyGTlBspDryb/SPjWEtgSbZZK5iNZWnDusRHPlc6VCOyTdGpyZQxCCZk70tcWNEESpLf8UvzWKPDYXKcawMiCKgztjEfbI4NEf7KmuADXT/NqDny8p7HpPmOT7401jhvehQSrQdWeF20sogbLDsfO2LVZj/rkLJ3G+0CZ9LTCt6pSC0dSzl4l+N/l5JCDyz5QV/zYpZ7v+pRemMLTgtht28bPUYcUDBP4eQWQi7cfmaETtra8oADoVvmboORI7PgvtBxZSILcDUoXBJXvgOpVUVOHxHMNi1uVm35vZ+aNkaPJp2Fri+lY0ZZZKfMvDrHqDZOc1Jp3z8RUko/+IIegukRFZUwaptORpz/J2peZ5aDbd7qnvmo2nV6WaRcR03GEM4TyuD6dYrxmhR73OshtMgeatqJXpLYO5LffN9+OhiybHpOs69zl4v1GG9oMLmHo3wmgnCfG2y09UBs8v7cV/1WXBERQWGHi2xfIjkN+BByiL+yr0/7Tfu/H+FRoiyfg+tMBhLwwzHjZCkfMyZ2mx7SXQwzM+862kNno4WCRB10LRFqGhAb7XowEPSP9L7NKCct7TMUiE65s/hptyROKd9EDn3/IPKQVpzaBn+apY7RgrG6t5L0ecg26lbld9KIDazDqSc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB15175.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(366016)(23010399003)(376014)(261009223027099003)(38350700014)(11063799006)(56012099006)(261021121427099003)(261026121527099003)(261102130727099003)(261102123227099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-2?Q?vrfV7n585AY1olNJShnJhYNIMVeWtaKr1sWKX/P6xl86VKFoH7wXjQUN7T?=
 =?iso-8859-2?Q?K/HCOTsnAQDjXkGj4GvSjWT9ZOOte/hFq8h3YSplBq5tz50m7cBasIyYYw?=
 =?iso-8859-2?Q?duSe6uQ0e9/3Igc65Weh50rli+NIXdHZmYniHdt9Umz7OeTKlHxcnN7/VH?=
 =?iso-8859-2?Q?W5qukCcfdHHn+NA2uK/RrEfCVYUWn0McHa/MLMftsmUc0wzUrg4n9r9fev?=
 =?iso-8859-2?Q?3JMQX54cbp5S6Bp8a8/1R9r7Tmt2mBsrXuPKlf8ashW3FC9pon6PCUrDna?=
 =?iso-8859-2?Q?P7A97fRrG3Eq1FbTujBh2099DgWz0GPRe5zOQ8yuP3z/8D8sJkAIqNcORf?=
 =?iso-8859-2?Q?KmhEMY8kJKRazcJByRcmSQKwiI52yfw+tTbqY2vlQzjqY1U4cjT6+75jhD?=
 =?iso-8859-2?Q?UCxdgPT6WgaVlx6OrQxiFpA9hQ5q7qNneNw/oo6UTdYpECx+1suNGtIf59?=
 =?iso-8859-2?Q?dJX8oTlpE6PBmDldvJklwR2vv1kL5pelAMQESiOOsBxWKKh0h5IsQWfWOV?=
 =?iso-8859-2?Q?0nKVpcuz7k+8RfwZmOHRcsJduOY8tZJmoeUNsh04Yy7IeMGQJh/eG7/5lj?=
 =?iso-8859-2?Q?FbPuSlQQogqgMUUdfD8wzwaU8EzzBV7cw/7TxEut3eYG07NXQW6QncBY1m?=
 =?iso-8859-2?Q?rywID3vGH4NN7Ctjr6glIYWwRmIK/oPzdG/uSKeR6IhJS7drn6K/kr9MTa?=
 =?iso-8859-2?Q?d0vxFxWy32fH7MtmL6OO7+RmTsfB1jrAYgDoqP4/jW63/HLMpZFsfWsuzq?=
 =?iso-8859-2?Q?jswgEsopJyEohBp4EJ9ZNFo+ybbbbB0o/I/+H7VtCGcHYqHqlOM4oi2mRc?=
 =?iso-8859-2?Q?w9TxpOWdBm1M6Q9CCtBAJxt2ZCJ6SR5PNfV49awKtAo4We26Bug7sLAdQd?=
 =?iso-8859-2?Q?AqOwvxL90cjdfUZPlG3j7rYO7o7+jaLxmUDCfm4mecEgXKggaxWXO8mdRE?=
 =?iso-8859-2?Q?RCUMIyvu/yoeSrGlKmfGws3VkLmQJaAxNbtFI0aMS4fNhV5BWIQcudbWP8?=
 =?iso-8859-2?Q?WeFYVhwv6m5d9NKxIs8ZLUpX7rs8aRUGvh7X2foeNt/Scpdi4KK6n3oXge?=
 =?iso-8859-2?Q?sLz+torEO+QFkHMgpXsqUzkR/jp3eim9irZJUdok69wkUXUmOIsHHl0q8s?=
 =?iso-8859-2?Q?K1jFFX9j3kUtqEGUTeYFMDXfqGYx0cBfKPOCC9s2pBjCpHQIVsyG68B3Ly?=
 =?iso-8859-2?Q?0lexellOa4KTQ/PrvM6ZkaRrPOrIuOwPRk5dbG4FfBjKqvmKYGnlBfqWOQ?=
 =?iso-8859-2?Q?rFlSg1xysg7pPdCRxy2AUIDqpW0GbOWT+uhHCEIRdd9r7p6jkIuVJfYECW?=
 =?iso-8859-2?Q?SKswOfjNq24flyYDr3kAqm0oXMmPsaRWxq7JN/B8rj5dZjhPTl0gYdjZWe?=
 =?iso-8859-2?Q?MLmKx/CNowbvKsX34p4hGNUAfpCYh3kHtkWS8jnLRqLewysHFBv+fx9B1Y?=
 =?iso-8859-2?Q?lJ2OhmrTq3aCCShD1Ya4tLkQXDVDoX+d+9GwHdaYTUmhuZAtJMgDwS1a/v?=
 =?iso-8859-2?Q?uKaonYJpFpNk+JYb5vZCtSNzn12OuNoSKRzXOLsdhiCFrxMB+iOmNvs3xO?=
 =?iso-8859-2?Q?UEq41LVjtSB+FZp10VP2VElWpSTvoJCOXxzwwvPGS1xvRw5lDNhzJZe1YN?=
 =?iso-8859-2?Q?S/aKgaB1nhS9aNTzXCamQfSNNpmu+8nNPvpEXBJdznTW23AhMHOhZSG/ap?=
 =?iso-8859-2?Q?GA3vVScOW1SSbFJlPEkpuPgb0h/yeSSWlcvhh9G5lTSqhbTnXtb0CmK/Nw?=
 =?iso-8859-2?Q?53US3KeW5a1yoeDTQ20RSI9htZmpGCl7pJWwhkbWEeRj+Or2jQpuC3+qXn?=
 =?iso-8859-2?Q?yaXsRztD23lz3rLRpQz/M7mlP797msCOt7c5CFE2pMyVWasTkONp?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 492a549f-3092-461c-c9bf-08df40548d8b
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB15175.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 00:33:20.7365
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u9IdEKRDx2n6rIPHlS6+g+goENaPm1PWTl6Y2zA0lvDLaQv7+BO1LAmQi3x1Xe3H9YZlZ7i+h0H1XhMudSF1214AL1Rl6PfahKoAD5dGQJJVXeYxL4wgYqQn+phqEY6G
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB13263

struct snd_soc_component will be capsuled soon, its member will not be
able to access from non soc-component.c.

Adds snd_soc_component_regcache_cache_only().

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Alvin =A9ipraga <alvin.sipraga@analog.com>
---
 include/sound/soc-component.h | 1 +
 sound/soc/soc-component.c     | 9 +++++++++
 2 files changed, 10 insertions(+)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index 9b799cc300f48..3427f2f094956 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -358,6 +358,7 @@ int snd_soc_component_regmap_get_val_bytes(struct snd_s=
oc_component *component);
 void snd_soc_component_regmap_async_complete(struct snd_soc_component *com=
ponent);
 int snd_soc_component_regcache_sync(struct snd_soc_component *component);
 void snd_soc_component_regcache_mark_dirty(struct snd_soc_component *compo=
nent);
+void snd_soc_component_regcache_cache_only(struct snd_soc_component *compo=
nent, bool enable);
=20
 int snd_soc_component_fixup_controls(struct snd_soc_component *component);
 int snd_soc_component_add_controls(struct snd_soc_component *component,
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index 452c95a38596c..983ebd705569a 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -518,6 +518,15 @@ void snd_soc_component_regcache_mark_dirty(struct snd_=
soc_component *component)
 }
 EXPORT_SYMBOL_GPL(snd_soc_component_regcache_mark_dirty);
=20
+void snd_soc_component_regcache_cache_only(struct snd_soc_component *compo=
nent, bool enable)
+{
+	struct regmap *regmap =3D component->regmap;
+
+	if (regmap)
+		regcache_cache_only(regmap, enable);
+}
+EXPORT_SYMBOL_GPL(snd_soc_component_regcache_cache_only);
+
 int snd_soc_component_compr_open(struct snd_soc_component *component,
 				 struct snd_compr_stream *cstream)
 {
--=20
2.53.0

