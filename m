Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011057.outbound.protection.outlook.com [40.107.74.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D2B237FF58
	for <linux-sound@vger.kernel.org>; Wed,  4 Mar 2026 06:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772605439; cv=fail; b=LY5xQfdHX8CZV3kd2SaxTYGdSRJnpCKfjZcG0Bt6/XWvW0AlCdSuorUXHwpXv/lASQ4vW3cyCBMEH4qRd13XXWdnxoc6JycBYoFVK+c15pJwz47w6HTizvz/vpCOS9UIqbEkOxOvc4CgjtVMmDMERZnMM7SCIBXrx3u/33hAANI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772605439; c=relaxed/simple;
	bh=MN8TaRmA/RNHtXeHza7eS/vNwT90Zqd1kxIaNvj4JXQ=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=ZBWrhAxEToEh95nVqTdlGCGnqIPYuG2T5LGtOD8H7+4DjN6E5LGrozTTsXTBqNkyV8c78dI7ZCuJe5FOZZBrQHgrSjN1vTD3kHxwhAdEbDVVK6JR0FEFi4UG17Mff55NEYlgG/5MpAJPFt5MHmfZj66mwjNjiSoGBDrUkX2GEY8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Zppux7hp; arc=fail smtp.client-ip=40.107.74.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Zppux7hp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hF8nn7odDL1T/cllK+AlJckI2sxo7Xxbl7sZ8JEYfeCPfzyH/MD41RWL3zD0carS6yjgVSx+SpJlY6JiLio+tgBhrHuxmP0GWR3FLFcHpOaQAT3tuIFAeS7+yPLTcELHANQE/J8ERZUwBlvyhvAN369mXuUf8U/ZUgaa197G3jZUmLLBZEewXg7M7a4aUiR92HeMecbjvY4jtMjxEimIdtg2RgM5pJdatpGZZoGjAYhSLIlguyhDwi9kTNIhEzSvpBOIP5wHaHq1nGIwH+ls1hA0vU/JNsA8ViJpFkRGYeb28GvjX599+p6gmr2GvQ9uji+b1YiiNlQgxq1TLeJ0UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FldedDEYnea6+ow3O8R+8w2HpVVPYgRklaAlqb7PE80=;
 b=LSLeEWlmV8Ebek7xND/Va6bw8GBbO5Ho3miuuJgGgRhul9sQOn91lVn0v6VmAl4SsYl2fxe/R3D7CezGntHrGsHc9yR3/ci7srGiRaO5nhUrcmLLIiL55jCj3G07K5QCjR1eRF/YWguVBaDOEuLrfLkiLWMAe0FPJfFZi920jvttPZ5MHp/nN0NjTdFonr3O9XQ23YFVr7i4exW1lI3TjU4iTyPctVHqJxkwMITWXD5yvuYyaYk0Wp1zO8FCVQAbw7ul+sBmj4FJLbfss9rQQjbB5bnBue8A1vOMTXYYJeBTMHj+fCcPvhXDn8n4u6jvvpDClB9c3kH6WbI1AEZ40w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FldedDEYnea6+ow3O8R+8w2HpVVPYgRklaAlqb7PE80=;
 b=Zppux7hpKyuRHKbOytKFb/vgJJctUoBFI8LWi3FhOUReJHvEVnlqxlg4uY+ep8UAKPJ8oMI8pjaJHgKffJceif/HCYxG4tgMFG6TZXCb78wFMXqDpGysGFxRUp26IXCWEUdn7/55vVTnX8Q6+Gvil6xV+L1+eWUv9nwmqziMTIs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com (2603:1096:400:ff::13)
 by OS3PR01MB9755.jpnprd01.prod.outlook.com (2603:1096:604:1ed::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Wed, 4 Mar
 2026 06:23:56 +0000
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9]) by TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9%7]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 06:23:56 +0000
Message-ID: <87y0k8nmdf.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 23/29] ASoC: sprd: name back to pcm_new()/pcm_free()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7fcp10x.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7fcp10x.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 4 Mar 2026 06:23:56 +0000
X-ClientProxiedBy: TYCP286CA0108.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::14) To TYYPR01MB7976.jpnprd01.prod.outlook.com
 (2603:1096:400:ff::13)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB7976:EE_|OS3PR01MB9755:EE_
X-MS-Office365-Filtering-Correlation-Id: 23817a75-c32b-487a-0576-08de79b69d8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	gcy/jNXxrXVFXRUBFCo/n2w6WVP4jYJFo6hsTXBYkdj7Utwzi7QN1W9U4r9I9HfLTG3S1ZiGMpZVkMuyk5Qs83LR33sJVTzUYFcfKJcX0mCG6ShvpXGeMcX/yqClFuvJcNz2Py8YcSdHrSUvzJdedWbZCa11gjQZqsvsenGodwLozcAKlYAbWnUmRYYIBTc4iA6BzNre5L5Naw7n4Q8Us3vbRqSlH3kLb7B+CJgA+NbJRmY1PUY8fYi2zSBf8GyKHrrl9OgnZY1sTDL6mp1ceawcZcc2Mz+LoLpb+Q6pLzyQVjX8ZHORMLiay3OQR/xOMJs3+Llxlz1lQdNSY+gswiXhcDkVH1bNIOpQ41tMe/DxNUI+Zvft7i6vqwfDDUF9p6Yp8hSQTj1elSYO6thgN66DFRd7gHmbFerJnNsWrA3yShX96bscPFJFurxr6k6DsD9kv5+uJwJoV38DI4jrhGCkiflIVYRpWvN28CSSVXsj4xP/zvDbBfBM7554r+bePPz5bfY+fD5THGgjv6lQSUd4ix+AAVYI9kCuM/VVR4aurxnyL+C3dJ87SgWsI7qODV6dQoR0DNyA3a1Nm46XbfKTKCLY5yGaolkoUgUaeT04pKA1HGUb0SqOoyNHkC9Gv6XiViH4hDbEhCjE8OZzNlwOgyzI/QFnhR+tf1U7joC/YwyGDPOK1ntaBpORHuJ6E5qOm3M1PPdc1xwnA6fvmcCIOUGDCd4TidtzeCMs4skVbXXwA6yhwm6s7Oe09zmLBH59qeBWa9M8M2VGUkWJJnJI6ZmARRgL0g3kZwnF92M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7976.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ez+ZOQz5Ky+CsOokXJ+3TQv2Pooi26MP4bV6EoMmZ1mEtf0jlGiso8nc+bJh?=
 =?us-ascii?Q?3Ko8SONXBwOiwT4vFHeu+h2vzJDH3M6OOwGoCQsXxQcW9niyXHNy6f5iK+bW?=
 =?us-ascii?Q?NVVk5v+VY8/WjPxXFL9yT3HxuTXSJgjIzcHqPON6UyEK08vz4OHhuZWS5T7H?=
 =?us-ascii?Q?J91f19yGHgJHnTnqGuMG1COa5BHEZelq4NVaeyAdqT6Zx1SXS0dvaRV8M2iH?=
 =?us-ascii?Q?kOuWhOBKWPrZ1q/Wnx8s0lkvntswmo5EYlXQ+T3hrZcYPSz+fBfNgB1G03i9?=
 =?us-ascii?Q?2pj05oTx35AQbe5DxSt+Y7SAvKQdwQM5RS5hl8fIadayvwvxbu03Wo/GfZMt?=
 =?us-ascii?Q?zfaPhrsZRRf2OF89n/Nxe3K7laRHBkjwmfmyXc9wyQzXGe2jhd5bE8IaH742?=
 =?us-ascii?Q?AO8uwlApc8qmiJ2LT+/0Ygk8d3ETrBU54Rq7r/+h2m4sdCGAZi803eXbnG5U?=
 =?us-ascii?Q?hlLaJLIp2aTCzX2MEoiCCTx9PKZpZEQZVtqQfJ83/t8l4Ehg/pmzKueCvZ8X?=
 =?us-ascii?Q?2MiF9n5uhL8zSYGu7EGfY9Kvk5L8OxBUDQpAcN8qVr1sMjZAx3ISwAXzdKzg?=
 =?us-ascii?Q?9sXNgMDSx3CiKuz/9HECVSNgfS/Gh+qUdmNeMboVHz9fy2z10shQiGQW9rjA?=
 =?us-ascii?Q?LABWyiJcr5+XeUw7guA/TG9ARX0hmG/DohRFyVWUfOavhpbQcVe0733jLGPs?=
 =?us-ascii?Q?+GvWyK7qWWFbkpbN+3hoZjRtdoZUHZCHMmQp2z6qt48dFD3DaiHYtbXZT0xB?=
 =?us-ascii?Q?d2wxUngy8GIULTVmrxw3DiO2QA8vz0eDVvZLr1qX1KW/1L24S1uE7v4u/vaB?=
 =?us-ascii?Q?3e+XDN6ZiwUgrfiWNksJFJjV4Zjm8/PCt+4b9txUz8CPJdL5XCe+/5EmtMZi?=
 =?us-ascii?Q?KifPHq0kKRqTu/q2P4QtZj2xfXK0zgcRjxlhYSSikyKKS/uKZYR95XQtO+87?=
 =?us-ascii?Q?EwAdtF8b4HAy1w/mpYgzQoIx/6cC/QLiA6/D4GE4REybr7/2llYWZiSdzVcO?=
 =?us-ascii?Q?Dawkpr18y8QDCLuGfwZYG9CsRL7d2vzCcKKENt8Gf3a75I81Aqq3eAd9qQDm?=
 =?us-ascii?Q?f+UZFvG8l5vNX4Z/yGr18ydU0ihy2QqUpI/oxr3R1bAXpWc3RD4/fyCxsnAZ?=
 =?us-ascii?Q?nY+E04p0E3tcx0ySms+d9jW4pX2L4Gtnf3Mo4b0nO6N3mAhMC+rfaRJ9NHBy?=
 =?us-ascii?Q?Ryy2gyVpZ9x9PZmFUldyfVMDAI6vhLjsZjYsItXA+vyqB9ty5WIcE/Cikgrg?=
 =?us-ascii?Q?DHo4LNSeInZBuXLDNPRxLO8/CFdLsXQQz/mpcFHPTlwSyFk/m7wUrt0VyBu9?=
 =?us-ascii?Q?O15uYk756bWHJD0ju6rL7dsw2tOOj9uWZwaDjRTc2igZTRe2Id9nUktUwmfv?=
 =?us-ascii?Q?/n1uGq/zI7M1Spyt82gH4QFnijdAnBgiA63vux64/rq4hIOiTuXO47sZNh+P?=
 =?us-ascii?Q?ZSCIHzBCvB6w/akbhVjyUvA+cQ56Ad2OIerFTj5+RIL9KlWqY7nz4set9TiN?=
 =?us-ascii?Q?DCTzQO7oMO+B+4FW4X8Rx6bCEXXAzt2g/ru6A16rTgdQ/7G9SZE8NitxTZ3+?=
 =?us-ascii?Q?Di9fFt0HUWbxB7HtafdSzjk76VVnjJ73rMVpIkupN6v/wn2MTnA3f79x3nnc?=
 =?us-ascii?Q?6iR9b5uuJ9d198iynXknBK1pJgQyHqX0aA7Vk4KYWrPYQuDrTstrkeWVI22p?=
 =?us-ascii?Q?FagtxBUw5+KyfTR16tKnj9dmTQcjeAyn6ntlVsBdRFXpyWfi1Er8w3zSuvD1?=
 =?us-ascii?Q?n5ep0UzoXtQL1UQBilvNIDr0zBfjuD/BimZt8eTHdB+6oXKoF5uk?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23817a75-c32b-487a-0576-08de79b69d8c
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7976.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 06:23:56.8431
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XfpcufmvAIeOITt/tVAeKt5Bn2BCyceayJsOyKXT0NOPf6jz1DzGKD2KA4BwlFLy7FKy5YJfJ/YxxfbeguKJPQ1styuyNJ3kkbFIJ1exQaZ9R0NDwkRRw7doGEocwLru
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9755

We have been used pcm_new()/pcm_free(), but switched to
pcm_construct()/pcm_destruct() to use extra parameters [1].

pcm_new()/free() had been removed [2], but each drivers are still
using such function naming. Let's name back to pcm_new()/pcm_free()
again.

[1] commit c64bfc906600 ("ASoC: soc-core: add new pcm_construct/pcmdestruct")
[2] commit e9067bb50278 ("ASoC: soc-component: remove snd_pcm_ops from component driver")

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/sprd/sprd-pcm-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sprd/sprd-pcm-dma.c b/sound/soc/sprd/sprd-pcm-dma.c
index d6b96cc2f7087..cbf5bf82d96e4 100644
--- a/sound/soc/sprd/sprd-pcm-dma.c
+++ b/sound/soc/sprd/sprd-pcm-dma.c
@@ -453,7 +453,7 @@ static const struct snd_soc_component_driver sprd_soc_component = {
 	.hw_free	= sprd_pcm_hw_free,
 	.trigger	= sprd_pcm_trigger,
 	.pointer	= sprd_pcm_pointer,
-	.pcm_construct	= sprd_pcm_new,
+	.pcm_new	= sprd_pcm_new,
 	.compress_ops	= &sprd_platform_compress_ops,
 };
 
-- 
2.43.0

