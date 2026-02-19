Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011060.outbound.protection.outlook.com [52.101.125.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 983061F1315
	for <linux-sound@vger.kernel.org>; Thu, 19 Feb 2026 04:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771476838; cv=fail; b=i8wJqdC8b80ClKhGfe/FzrW1/MxF2OYBacPD4l5coxoHlhi7iSxmEvWlUuaRFRmiFNQ5lchsQLPYv5zfZvwwU+7SSpVlynVE3qh3RXiB/1wNVtHqJ0pBP1RH0qRwJHeb9sDMQHyU+97Wew4wiUB8a3zpzVbwelCNzW/xBlzLu40=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771476838; c=relaxed/simple;
	bh=MZ3eDmgPUr8jsBbpK70eEY3o2HhWX501dQhSiovmbSE=;
	h=Message-ID:From:Subject:To:Cc:Content-Type:Date:MIME-Version; b=MxXmrV5pzZ/1KDTt0eFj/bnXBKh1RFFu4Yl8P6croQKXtEVCyHXU74l/FHrKknJnV2y6c6vnqzQ3y9rN+3ADnJ2+3ZsSTmtNk2CstKSo7TraSUzK/0koyMg0TGM9yOgVqsaPfcyyW4J1Ab5hGpHpIWq8OVHCz9oB1zgk0Ig0RyA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=UvljzahO; arc=fail smtp.client-ip=52.101.125.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="UvljzahO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bwhplSsRn0vV5ISZD2/72VJrOyLmrc+gaHjBADGD/Pxwe/IU0vVEWiRK9ZNbUsfznAv6xFrdvuqNaL9tqNzzVESj7svAQ4eKtozlMWSADQmo3B+j8RUUqZHHsyKN7ETVjMNUx+FC2kdTKGuzUvQ2vH2eShmObOSxzOWj7uA7UaebeJcXSdNOJ1SZb8g/9YBowy3cpMnPoFA5VAUaDfkMq+2CsTjo1DkcoLQOQ6A56QcCXE8fpHMsmxBkjti9SGSS6p1Flcik90wo73cAblH00antNARMgKysNZcnKgxwepQgMgqp7UvgZP0eG1bDEZwiV0QRh6CF5W12G4RDq/YeFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iITmUtKoitcj0LRd+AnfD/b1YEewI7VLf83TbNI/3OI=;
 b=CiW/+DtOjkDX+bh6mFbI252Ba/M71V3xRT0rjEz6l82g/3meFcquu4m8APIUJNgtXR4ajclLX+2LAUieisBukOIeflSplzVNqYuTEZKFBtwzWzlIScDGOScLL+vg3pG+0xM5QJoxHCnRabWN2J3f8QMp4z0XL/0evLLba7mYE8EstjdnflSyicivruhfO/ZJP0LhY/U+KinrnjSxEnpTj12eQ7s7Egg1WoZatyQdFmH8LNROtLCAUImGruOhyNtPKC0LDi2W4qeVVxiCUNl/FYFIg1cBTaOCeXDFeSuGA1W6qh2E4DdpRbBtqaGc45Hc0uzH/fn8LzhnGV9RdR2/PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iITmUtKoitcj0LRd+AnfD/b1YEewI7VLf83TbNI/3OI=;
 b=UvljzahOZstU+LUBde1V1DYLkSoLEHGXKXBubwfzaRyyn9Ro7QFZRSlqWETub62SrkG+ME1Tvd5whyvGGPnybn6BR/TIQy2YPQS6K9mXFU5eyAxayzw8m2EKEs/fNhFh9Wz7zypK1sfhWcJrRp62VFmHLX4kuRdlc5kUDUy43VI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB13067.jpnprd01.prod.outlook.com (2603:1096:405:1bf::6)
 by TY4PR01MB15452.jpnprd01.prod.outlook.com (2603:1096:405:274::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Thu, 19 Feb
 2026 04:53:53 +0000
Received: from TYYPR01MB13067.jpnprd01.prod.outlook.com
 ([fe80::dac1:6ae:15b:67ee]) by TYYPR01MB13067.jpnprd01.prod.outlook.com
 ([fe80::dac1:6ae:15b:67ee%4]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 04:53:52 +0000
Message-ID: <87ms15e3kv.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: soc-compress: use function to clear symmetric params
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, Nicolin Chen <b42378@freescale.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 19 Feb 2026 04:53:52 +0000
X-ClientProxiedBy: TYCPR01CA0059.jpnprd01.prod.outlook.com
 (2603:1096:405:2::23) To TYYPR01MB13067.jpnprd01.prod.outlook.com
 (2603:1096:405:1bf::6)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB13067:EE_|TY4PR01MB15452:EE_
X-MS-Office365-Filtering-Correlation-Id: a79346ad-de32-4979-3252-08de6f72e10b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5mmg/B995dfAArg2D+W5BKZXQiXR0tnOIC9jF9LkeOLY1vmPRZFeAnUptuKV?=
 =?us-ascii?Q?SY9/uX4nLFQ/N3wF9n1X0WMa3U8IZsHrZlg6ObLmCDtnpgweUlSBJ4SRfKZz?=
 =?us-ascii?Q?qu8WskWYv/gsWtJl5/vIu7qV76lZgbfazviZ4snano9tE9qDId62cpDYU7Zy?=
 =?us-ascii?Q?fr8GNa9/2YqrgM/nZq8oXxGDEGQ2Xp3w9gLn9GfGwWv6eWQiQLGjhuHZFw5f?=
 =?us-ascii?Q?iyqbZAHd2zO0j2ZFKEvu9GbnjJKv3xJwpJqAGwDaTmwhFjlyEQNIXUaW5wCD?=
 =?us-ascii?Q?8EqYv4P3INvS5A6fOVg6sBWy5MC09ua8VcKEq4jmBoZEeeLSQ3JGPn/6xhu4?=
 =?us-ascii?Q?dc+cKOQPnp4Z+83WH12fuW91IpRg3FC5C2W/WWtTIFQ6d3YBo8L1+j4Yq5rP?=
 =?us-ascii?Q?3c/eCAkkNJWPzlkDTyVNkslTiGQVFCXoqeLyg7Ctxkta2qc+Z1fdZADLSoPo?=
 =?us-ascii?Q?Dg2gqlU4HV7oqiqpA31P3s0xGJg3JYkKMi0XDuXwTmQcbjMoC+riRkykicN1?=
 =?us-ascii?Q?URkpor8DbJK4P3zTQ7Ap2OhNJesaBz+yQDZXP11qo+mqNzjOzasbf3xFGR5Q?=
 =?us-ascii?Q?NVS9kec1RASl950OAucxFDqOqWFY3a1i4S+iPkRZjnjbjP6P+zksCYauJJwu?=
 =?us-ascii?Q?8WtP2yTASBqRNMKsXD11hLMskR+fH9gdW2NFOXJUWA0a1zayOZb15IPdiAPg?=
 =?us-ascii?Q?Wku9SnUAcGZDNqw5DN4Z1YGUD/Gnz2xothdktrWyXrRNc1CV5PtHcoG8q1gC?=
 =?us-ascii?Q?PY5javkpwlnU8yIdgLcQlAEL/J18j+SiHA1pe3/RO1j4ocyqxNUJj2gqUhYD?=
 =?us-ascii?Q?Ha410f4pDhfjxFLtAeO4qwu8vGtgJKL2ts6nzOvZh/Ixhap/JTv33TJWfcaG?=
 =?us-ascii?Q?BE8QYNSBZQsiknkSSW7AuvB4BvFVfz+czel6WjjvyA0gg5lbRoaONsps0Wo/?=
 =?us-ascii?Q?nGZz4IMVXsffwC6eopF95Mz12jgyf9wJ2kZQQZXtNG9QBu6N4GTwsdqpKTKF?=
 =?us-ascii?Q?9Tgm0oF8KdF7lNna823FyLmxUV1LWzqdVMfMAPgWgSKJgoPmDg4KJZFmXS6X?=
 =?us-ascii?Q?4F3k/sod5BQj6zWLRZqT9Cz2DBJm8rghuc58czH2Z/cGBeEvAbfwvVVznB0y?=
 =?us-ascii?Q?RDUsLTjKAo/IvFy+LE/o4MzgyI+A6DliXVNYa/Dw4QoyrPzGQtvnDJC8edab?=
 =?us-ascii?Q?x/vSqqcICgm1AGD10shK6zcP2eOgxJD9C43ZzowcXvEga9zTrWpDq/wS0Ciu?=
 =?us-ascii?Q?uJlR/d1Z1X2Ag/3rbadZwmpCOCg4ypGEWtRTYX+O/jqAN4v5qFWOk9rxuUOB?=
 =?us-ascii?Q?TfKCeHVaa1jGRDq/5x5YwcOU8nQujHFwQQuJh70C9dYxa7e74U9lK1Gr5/XW?=
 =?us-ascii?Q?4/NJsNn78Eqe/+dvzsBk/EChjF9Yqz/5RwIcpvFMOiqzX3S1yomvcyW+CoaV?=
 =?us-ascii?Q?Jdz7A1TPOhwaELRIXEdKqGgCuGkkJwj+PCq0H/TL4kDlD3U8J0lzE6Vb80+k?=
 =?us-ascii?Q?8Jc+MdgVpwLMghNooYm3MNGiVB32T764L6YqJUjwb2mSCzRYL0aptti0Giq5?=
 =?us-ascii?Q?4Nd5oAhcAiFcSD2GpHSTBMMNDq7xFV+Accpf4qgcQZeDbXiusKnM9AiQw1H9?=
 =?us-ascii?Q?e33ukiCh+qYc0QWro9+JrOg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB13067.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?q4awscuJyQrXCSx3muT524dZzPf7oHfeBvEmXtqD70KvKn35vPx57BNpW+oR?=
 =?us-ascii?Q?rl7zBn9S5xbOBJTCOFM/AHZkHdMttkGN9aG/Q5tQLmmB3lCFlzF2rEJ0hSjN?=
 =?us-ascii?Q?ZQBFQKD9Ngui+s2RMT/xJvKm5WbIDg/pj74Q9fd4JsUeNs+Tf2Me0CcUWdRF?=
 =?us-ascii?Q?FzSNF3b8CMF+NhMZirH7t1hIreFOOOtTerhkWmnus25teQJe9TgE5g/wi0/8?=
 =?us-ascii?Q?2Uw5YEyo/wsyphAi/VQpNUsRUhVukbEE2pGhB+PgEfIlk89a8tzO5lfdPTHP?=
 =?us-ascii?Q?qCKH4uTTzqh5u8bpChsQM+DCNJXML7GxX6SXJPD8Z/HsTcFNuD+14dDtRiWI?=
 =?us-ascii?Q?Lflgq9dqt8Vq2o3IRA7DMIJOBf33YAn6EwzhBvV6x7mZSHmOAz2tvRf9Vd6s?=
 =?us-ascii?Q?vguCsOLmBnYORR8MlcccAcAiN+t69gEmi7SLagb6M2va0Vr1CxPr96+kjWo6?=
 =?us-ascii?Q?co7o+r8ehBTnt+iJ68kl1b4+ut5wWXA/WZ2qWwpr5T0UodFfbjB5tohlSEks?=
 =?us-ascii?Q?yTEPF/Imi3EROSiO5lbO+ZCFyaTksnufjDRchUulhCxRQ4W7QS1pXwDGZco/?=
 =?us-ascii?Q?kE1GDpz5TcY6t1dZPLBq5ZvxgcoPc4EWnp+u4hYG5+O5PD0hSPkmipJLGEsh?=
 =?us-ascii?Q?7EjN06C8SmddrH8iv4XbkCiy90FJe3A9GyI5zj9MfsSxeL9gCitvessHoKQC?=
 =?us-ascii?Q?AVcbXBvoGBD0ox1zqYnRAClQKydvqxe9+GiKQGMuURavKygr7HmkiOk4NYwe?=
 =?us-ascii?Q?8MXd1zuog3Hp7/ERp82NEoyPZzSqyUOPVL0NytAEqCwS914hCwsLJzYIG24j?=
 =?us-ascii?Q?4KzJeqWv3s5NjIxiRuVAb5CDzYA00ZHUuIICPDOozeDOt7FIKBHuZlIo2+91?=
 =?us-ascii?Q?R96Hq2j0qAwmPyq8e1uALXjO7t+y6bjVU6U7It76GIPGKo+Rzl8qMp4rvnRG?=
 =?us-ascii?Q?B14aEk0C/Mlwu1xcwLHvuTfOFPYMUFYRLFHlC7hd36edYU69J0frwDrinoz/?=
 =?us-ascii?Q?1c3Shf1g/9H7VoV3cW8pbsY2BrOER2OuJ7sO2sh2FQa+CK48LJc7vKnz4x3V?=
 =?us-ascii?Q?A36yo/VBNUfkLWi3T1p6842EcpjcK4ksH3ReMQh3NuaFnptqpeHkYyZ5RrLQ?=
 =?us-ascii?Q?qP8r4ce9jn5Vc7L0WZLz+yp/i37qn1EBD34eYh2++nF8SG+j4hIcgVm+xW80?=
 =?us-ascii?Q?upfIsmzoGfWH+9VEKf/ehG/o3Df9QNmQKIZ0B6WPAUBIPgUHbaikheXndLlC?=
 =?us-ascii?Q?PvsAkBE1tTSAI2LjP4gDWb6+li/g2xc5hrS+dzQJQR3SGcLt95TE2McRoAgb?=
 =?us-ascii?Q?azubCbCamKlXITZXoGSNRzIi+YvyA7U6/xmeIzxB6t/wwz94L7EH/acerF4K?=
 =?us-ascii?Q?ZMkeZgyuSL0LHtHZtyOG6WiSQCMlA92JtcTg1WsJZB/+qYwxYvrAI1yrutcM?=
 =?us-ascii?Q?QJMIKAVwekDikpl+7OXq/n6iWgXPcaRUVK39fxYA7UCRMNF+dv/6o1sP2noD?=
 =?us-ascii?Q?FU+m7KBl/8EqTbem21IMaULDSOZNBBSUZLSn1HIlwtt4QtTp3OsMPQi4SOBk?=
 =?us-ascii?Q?N2ZpF+BBPt4YBY7KfolbjjwRk0sosm4lDKF7BWfvRbUoYZflWgSfjrzMd9O2?=
 =?us-ascii?Q?4vMz6Zd6uFgK7/93WfLI81Y/xrIBOjI+g8r7V+EsXGstNF4OLdv3tKvTq2Po?=
 =?us-ascii?Q?+jSyh1QemjlbT7BecDQE0zj8t19HgESRuVElorzw7fkUtbjcJ41F197K6fj1?=
 =?us-ascii?Q?sC/0ERMrEaF9Bf7RxZD5As68RXYqtFANSjI49jpBQENH222qluZa?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a79346ad-de32-4979-3252-08de6f72e10b
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB13067.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 04:53:52.7348
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gODZI72z/+sPQ6NLR612VLxHncBhYHLMaVNqYP5SirSzyCQfHUftXpqYWnEYdb8FxDHSZ35d9c1zbhw38LTMhaWAWqm9/pmcQgtsTZmumg5gojX4XBQkX/8D6Wf4k2mY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB15452

Current soc-compress.c clears symmetric_rate, but it clears rate only,
not clear other symmetric_channels/sample_bits.

	static int soc_compr_clean(...)
	{
		...
		if (!snd_soc_dai_active(cpu_dai))
=>			cpu_dai->symmetric_rate = 0;

		if (!snd_soc_dai_active(codec_dai))
=>			codec_dai->symmetric_rate = 0;
		...
	};

This feature was added when v3.7 kernel [1], and there was only
symmetric_rate, no symmetric_channels/sample_bits in that timing.

symmetric_channels/sample_bits were added in v3.14 [2],
but I guess it didn't notice that soc-compress.c is updating symmetric_xxx.

We are clearing symmetry_xxx by soc_pcm_set_dai_params(), but is soc-pcm.c
local function. Makes it global function and clear symmetry_xxx by it.

[1] commit 1245b7005de02 ("ASoC: add compress stream support")
[2] commit 3635bf09a89cf ("ASoC: soc-pcm: add symmetry for channels and
			   sample bits")

Fixes: 3635bf09a89c ("ASoC: soc-pcm: add symmetry for channels and sample bits")
Cc: Nicolin Chen <b42378@freescale.com>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc.h      | 3 +++
 sound/soc/soc-compress.c | 4 ++--
 sound/soc/soc-pcm.c      | 4 ++--
 3 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 7d8376c8e1bed..1e0b7cd8d956e 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -1412,6 +1412,9 @@ struct snd_soc_dai *snd_soc_find_dai(
 struct snd_soc_dai *snd_soc_find_dai_with_mutex(
 	const struct snd_soc_dai_link_component *dlc);
 
+void soc_pcm_set_dai_params(struct snd_soc_dai *dai,
+			    struct snd_pcm_hw_params *params);
+
 #include <sound/soc-dai.h>
 
 static inline
diff --git a/sound/soc/soc-compress.c b/sound/soc/soc-compress.c
index 7b81dffc6a935..b8402802ae784 100644
--- a/sound/soc/soc-compress.c
+++ b/sound/soc/soc-compress.c
@@ -69,10 +69,10 @@ static int soc_compr_clean(struct snd_compr_stream *cstream, int rollback)
 	snd_soc_dai_digital_mute(codec_dai, 1, stream);
 
 	if (!snd_soc_dai_active(cpu_dai))
-		cpu_dai->symmetric_rate = 0;
+		soc_pcm_set_dai_params(cpu_dai, NULL);
 
 	if (!snd_soc_dai_active(codec_dai))
-		codec_dai->symmetric_rate = 0;
+		soc_pcm_set_dai_params(codec_dai, NULL);
 
 	snd_soc_link_compr_shutdown(cstream, rollback);
 
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 6b134962c71c7..a457f92e50ec6 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -423,8 +423,8 @@ void dpcm_dapm_stream_event(struct snd_soc_pcm_runtime *fe, int dir, int event)
 	snd_soc_dapm_stream_event(fe, dir, event);
 }
 
-static void soc_pcm_set_dai_params(struct snd_soc_dai *dai,
-				   struct snd_pcm_hw_params *params)
+void soc_pcm_set_dai_params(struct snd_soc_dai *dai,
+			    struct snd_pcm_hw_params *params)
 {
 	if (params) {
 		dai->symmetric_rate	   = params_rate(params);
-- 
2.43.0

