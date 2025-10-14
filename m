Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011013.outbound.protection.outlook.com [40.107.74.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F3A30ACF4
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760415959; cv=fail; b=JrYv0oU09xIVxoVHy7tlJrVeOviESOlUL2Vn7A64fQf81Ipge/GPrzxNNL1v3GGm/SHIdAFSyO3AUBw7TuvU0rRGx9AAsEVMXGpz9rUzvhOLAMHw/ZqCaT9JTFYz0lRlMwo23SShyeYx7vLFbDAvMno5v2DYrkfdD3EtOtGx6LY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760415959; c=relaxed/simple;
	bh=jBVipTpOL+cBKXgPifsh+I5ChoCG+X+wI1jjeJErT3I=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=rcsXyD7ZC2kNMpQN0kLDLRKVcZGp6tM6ciDHiWwv8IbTvUIr3Kgka4iwc5RI6opzWZk19Ye/2l66N+lAoPsEXDmVMbZcTTyaTNvDZ78e+0X93Wtz5dk8Kp6K58ESOhPX9FvDvtUfsqNeiDQcH/TOtHm0y2hjztKM59l9iH+DDs8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=G7JW3dGx; arc=fail smtp.client-ip=40.107.74.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="G7JW3dGx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rWvgKYvgBE4w2s26WvNTm3uxG/bY+qsjPaX7ceU6ia1jcMh/9HR4s1dKVEQixw17cMseyUAYU3Ne6VvrGYnkaDwxAgJpXsjGPJ78uRmnMDQYFy2wgumWyPPeo52gIBpzRuJAw8dPS3DkpQX8ySz9HdNNfwHFglGBOAi4a7R/8gk/m3AfeGn+wcmY1CN3gbl6f/yGwCIweaJDNXxmPM1AwdRXJnP5JFLK+iJ/iM1jHTNBScKxj4sv3lpfQjTC2uGNx92NQddIyziyohuyI8pMsuxfic9xANJdPhySqB7TlCAvZOi3zBLRgtn21aOAVVDyyW6Mb4K6859SI4wjf1W31w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l/daNs3/nb11R6eP3axV80WCd83KsKP9SYYuUENlxcs=;
 b=qXkxkCfp4VXJ+GMZ1BVDnxbsjyBjx8U2zrh8xk84bFf/RtVfE6WJvAFsQWsBDwqmCDghBqEHOWAReRkWhTM1sZlBszAyNmwB78Y/7DkTqZArxms7UVSiOOjbZvVr4qQ74XAE5AzMfKbwn4Ui+jvaxSu8MQSh4c5qD5UuKJPsqJ7foE90bL8TiOe3Qypfom57y64fFx6gPbUdngHlSRRsUSwoUZsFelpZlh6QBiTRWJC/fWeep48ilHApRo/DjQIbRSebj5YnFQfE7p9vnmdizQdVZyGm3kbXa7ZB/IVBVfkd0RqZCtIDUxNNMani1IPIgeaThDB6sJz7AQeKV0HkUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l/daNs3/nb11R6eP3axV80WCd83KsKP9SYYuUENlxcs=;
 b=G7JW3dGxnmvksWoYiHPVr2jIsxYUSYb2kpopP3htiRO8rxtEZuA2VTGxkA8pMhA6mGDwmlQLzcRgvixUwSTDPeOpsfJZsMP7hki2wpUp9qSdvecIng1WAwqKEHT0FcBrA3wTRYc7XpVYrc44hRhKoN8cgOw9IXTzUb02iu5eX/o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB9955.jpnprd01.prod.outlook.com
 (2603:1096:400:1e3::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:25:55 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:25:55 +0000
Message-ID: <87qzv6nm7g.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 103/139] ASoC: codecs: wm8350: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:25:55 +0000
X-ClientProxiedBy: TYCPR01CA0206.jpnprd01.prod.outlook.com
 (2603:1096:405:7a::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB9955:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b000062-33b0-4175-b8b8-08de0ad9c49c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Z9O9vhcJ7IoLldBhpLA2KIC7VQZHTAzeElsl1bTuuWQNbMzFIwnB66yUTxQF?=
 =?us-ascii?Q?z6qD1Yu38+gHlOg0Zkg/BdX5UlAG3Uc5Lz1FdLGI5jNUtmWhkVk3XEAEKNiH?=
 =?us-ascii?Q?5IdYtzFxu78g7P/LWZfd1+23JI+jZzMgInlic0J92Fbl+1p3PftPUO7zqZwj?=
 =?us-ascii?Q?i49ThxFhPbTFfIhEfHPdNuzQZ39EEfQP12+rKcLKam6deFK7gTRitTxT6Fnu?=
 =?us-ascii?Q?tGZXf8cnuLvC0NrHz1Pk7q7d9IfapQyKFH7aM6shMX8zajTtZ+I+BySJLi6b?=
 =?us-ascii?Q?PIWd6apq14TVRkaMBl2KJyGuR7i2bXD+u/NHpXrkYFLsjuG32bzWJf4SkXD2?=
 =?us-ascii?Q?WAm7ubu9Ln+XKj5VYhcXUBTjR8B1QcKlcxPhG3XkRKegXFBaRuoErx4mq02G?=
 =?us-ascii?Q?uhv4x7mNrXMKOqt/q5KQdZB2ormWwRZvC+GZvSAXZBHI6ECokqT/nu+EAivd?=
 =?us-ascii?Q?q5DoKw6flEuEPkt9jbk/mFezIWjPjgSwMtswBil8MhBvkpuXBxdmRUwyNYFy?=
 =?us-ascii?Q?hPgjnDIOFDCJxIN9gtCIgpBNYlYxjYXZhRlMuhQVIlXPMraTAjCUQEfbW10a?=
 =?us-ascii?Q?Cs+LyYYAFSr+jhhwWRD9Q90GDdlBxKrDuhQWITLv7+U+iuWY2OV/GE9+xQyP?=
 =?us-ascii?Q?MttTYCe2jnVNgw7sdWpsRmfnFOfdhM1hCy7tWi20X1jRONRIzz8zM/kQ9swL?=
 =?us-ascii?Q?dT1f/xn5SomkJYgu5K9nerq71RnjpxQ9o/FczDhxINTjASfO34wN4p0zsIPl?=
 =?us-ascii?Q?PNKzX+mUBqJqmnvfCM4EGRgZAj23Zm7zIXrZSXeagiYTofrtfiwklofNY81b?=
 =?us-ascii?Q?BFAHXXEw+VaB81VGtEbqHmb2uLozsyHJF6LyqLFZ9lhsC1BeOPWo+AOchb1e?=
 =?us-ascii?Q?EisvoJL7B25z15rm7yzG8jOe02dIUF6VfeN0Vah7ny9iJuv4JiHGd7aX8ZNV?=
 =?us-ascii?Q?B2MO6IYl6ABCbeJc8VSOV144wVNj1QITU6EZfXChXKZ2tbCSJ9L7Gtz5BdJd?=
 =?us-ascii?Q?gJ+hRGZipPt4Q/zELWQ2CxV0NEYrSWmlWQ+ZHbOfD1nXm5MvQ/S39zHmMxRN?=
 =?us-ascii?Q?z/bt6Ts+dkR/Cd1u5EG9mHgIiRZjL5iYEisjdAOgHAXFgX0JNkZd4D7VOi0X?=
 =?us-ascii?Q?u1M1KdZjPv2fUD6D7eAGaYfmHNlat+UY1t2Z2RJU5HPwFCEOOXt7UZs5ID8D?=
 =?us-ascii?Q?CPZ0ytErAQzfJVyzDhN9GEihK5HqRkxQJY16rZTmYlLT/bIVeU6vToytXgBu?=
 =?us-ascii?Q?RFC4chOnzXe88ZK39l7fQYljmqFj+cG5fM7H8gxPlZKAKeKH0oI22VTStQqB?=
 =?us-ascii?Q?8SYXvXef5X5eyAensO3X8AKhALxXS8GKrI+IQciq+vOVDJDdNHJgGGBoCHqs?=
 =?us-ascii?Q?NxjX/dBuA5SCZnp+OMpEDpDI7c5aInwFDxL+c9K+92AtzDLwDnB7hhaEbzlU?=
 =?us-ascii?Q?DBx61N0LYz8ufFROjnRXfSMDamYp9THnVIIu9R3JS855AbZ+u3/i4RvThpHZ?=
 =?us-ascii?Q?3wD2ZYlKa1XoqwZjmZyzKi7IWd4iO2eTQE/h?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yCBHMjk7yIlOAdjr0qA6alU/M3Jw8YtVzYgweg6pPE4Ft15Ctvpj6dZDdemQ?=
 =?us-ascii?Q?F+sdo418U0+oblGIgG7A/4c0kiJ5Jd4PQsWGK0lyI7JuPf5njWajB10E8WS6?=
 =?us-ascii?Q?GJG6YbIpRiNgUV8h9zWGCmAncO+kqWhNGCt0V4SRXxA7oJJ7mqh0FA2zPd6H?=
 =?us-ascii?Q?K/fzWB1Z++MLfS73sTfmEVr5nYv9yVYWLt0t/DllygQlo5Nja1F/oddxZqoo?=
 =?us-ascii?Q?PXXQ2y4MqVgoLt33E+cQeeaVERKDqWMTmIv7sLlKNpBKX1UceZa9twhYq4lC?=
 =?us-ascii?Q?wrYZQjEVNiehkOGPZvrQeMW3aj6leQ3/zGuC9gQ9xPTaU3u4tGkjkCUt06FX?=
 =?us-ascii?Q?34lETLxurh8F4o86Rz5kCZKT7GDfRzsw7Zu2wX1qllPUs+LmhQjxnCNY2LE5?=
 =?us-ascii?Q?rzX6WOhV5kZKt5Y5BCO3tApgtE16NKZYS56nnU+NEe2nG+BvTKZ4Q64c3xZX?=
 =?us-ascii?Q?+PKt+zHZ9c1bOUdd8BnDal4o7pAmh9eA57L9d8fO8A+WmV+Ij1PYF43Rc+9J?=
 =?us-ascii?Q?AJ1FPJ3hlBgfZo+U5F/eqMpmvNGQALUF9znayMNITMnCzizSemhdafkatHlx?=
 =?us-ascii?Q?gL9Q+d+IoVSxttJCw4hr4mBnAAM+0NFydIwajlLGGq8F+3g4TQNin3J6eG0a?=
 =?us-ascii?Q?c2m3bKr7X3L7dd3ihEXURpXurzXHo5rS6XPXWeTpaGoVdblxGd8x7lP3cMCo?=
 =?us-ascii?Q?fLcbOA+aVvOQ9LEWCd3UqH7+jhKqPvso5Ggm2BdrRVtzKcBUDGIrA7060kz3?=
 =?us-ascii?Q?Sv5rwrFMtxR+fxEdfX9EjX3nYS8z6iKnE7vGm/+yo8rtAK/TWmY92WREiczK?=
 =?us-ascii?Q?/Za/a7RObAlbXQ6iY9RZY0/RH6BvVKj1ifIFo1G71vl/i82mgrLA2oIvaPu6?=
 =?us-ascii?Q?J6VI9cvkdciAGMBxy3NDGLR2OrVhFnq3PJShiEVDpfy5xZP3Sif/B4pJ2yFc?=
 =?us-ascii?Q?ghcRNjnjFKQ4n9YjZLIZY0QrrESYCmNPfcgdVJJg5BxV6fC+lk9cKy3YVpWq?=
 =?us-ascii?Q?/Jg/RLW5f2Ey36iDzBgyzLi/fuZILW0WvRrO2zaUF/fSk55IhGLapQ+Wzgip?=
 =?us-ascii?Q?fnlW2Ao6RRI5i/krPXgjIUL8w64Htq5dMAYmpI6M57pDgBpCRS46Rdpga4hL?=
 =?us-ascii?Q?VOAz6yhcSlSyhLSNkZKNmmgI9yla9rIIAA7CmziAxH5xmAEYmUFG43HuUB1k?=
 =?us-ascii?Q?MgAFd17rVzSIOR+UMDKO3xzM4XLBXe6KP0g+qYzqyzYfklHTwSWu/rmSmgqE?=
 =?us-ascii?Q?6YbNqubI3K7BDyEZkOJnmqvi/wr8rJb0+VRcZtN6bHcZqXaFvQwAK1shWo8x?=
 =?us-ascii?Q?s4S7+UuJKPtufVAKVg8jVjVtL7C7KQeP0FhGgLvRTybHss4EtqLpZDIGV0pi?=
 =?us-ascii?Q?8vjGLTG53+BXpuCmp6w6NtmpbiPFHa797HAFSIlV3NncHLnwvAdWU3sfZNvt?=
 =?us-ascii?Q?Uiaxb6+Y0a0C4BFMveAP1vSE4gFsAh5abMPZmfMYSKydVX2rsWnBiy3ls2Fe?=
 =?us-ascii?Q?r1QIlETs99Lic2A7Zzz200eQbhYCydBXtmyOaBaRiPUgSkdsMXei5Aq1FU/T?=
 =?us-ascii?Q?jyOJeVwK31tWYuk5Nf0EUoQoS8AX46Q7Wlmap0IV1jIleNQaOXnwHwx1YWmR?=
 =?us-ascii?Q?T1ywCFZVBZ+wpNSmOW1DAis=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b000062-33b0-4175-b8b8-08de0ad9c49c
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:25:55.6907
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hfUoK8zg8Dn5DHIqAR0CwvQxtehC4wczJkSCbpOV/VZ7wCvYV7yHZbJBJI8Ac+UYBNkJ8yZBtZetTmrgkx1o/WjDqQuKNzm6YstB0wK22JdBYMDQqi9keMpcjMHkqnfa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9955

We have very similar name functions (A)(B). Both gets component from
snd_kcontrol, but (A) is used in callback functions which is registered
through snd_soc_add_component_controls(), (B) is used through
snd_soc_dapm_new_widgets().

	(A) snd_soc_kcontrol_component()
	(B) snd_soc_dapm_kcontrol_component()

(B) is using very picky way to get component but using it is necessary in
ASoC. But (A) is just wrapper function to snd_kcontrol_chip(), and directly
using it without wrapper is very common way on ALSA.
To reduce confusions of similar function, let's use common way on (A).

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/wm8350.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wm8350.c b/sound/soc/codecs/wm8350.c
index b1fe6f4e0c10a..fda753152a68b 100644
--- a/sound/soc/codecs/wm8350.c
+++ b/sound/soc/codecs/wm8350.c
@@ -297,7 +297,7 @@ static int pga_event(struct snd_soc_dapm_widget *w,
 static int wm8350_put_volsw_2r_vu(struct snd_kcontrol *kcontrol,
 				  struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct wm8350_data *wm8350_priv = snd_soc_component_get_drvdata(component);
 	struct wm8350_output *out = NULL;
 	struct soc_mixer_control *mc =
@@ -340,7 +340,7 @@ static int wm8350_put_volsw_2r_vu(struct snd_kcontrol *kcontrol,
 static int wm8350_get_volsw_2r(struct snd_kcontrol *kcontrol,
 			       struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct wm8350_data *wm8350_priv = snd_soc_component_get_drvdata(component);
 	struct wm8350_output *out1 = &wm8350_priv->out1;
 	struct wm8350_output *out2 = &wm8350_priv->out2;
-- 
2.43.0

