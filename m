Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011031.outbound.protection.outlook.com [40.107.74.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75B4E255F52
	for <linux-sound@vger.kernel.org>; Fri,  7 Aug 2026 00:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786064213; cv=fail; b=ZTjzhdf9Yl7G9QrA6oNJITSWjORcZrvaQZEJ+qsPmPyZ2VebMBZF2LYbOILNH4m0A4FmxB1Wl/sxtHNUyoD1L6eCL3xEQ1d2vW4ldoMcdSBgr0VG0uYsxYH0hZbkOPbCR8TmwWueA0fH5VrW07iGXASMiziAgd9Q5qse/hy//y4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786064213; c=relaxed/simple;
	bh=yu0UL//nS6FD/hI4jADH5QMuNys1puOxaUYMZDBDrlM=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=hLdWIOwVMCwtL46McLopX1qhlnxx/4SSN+g9UhmYsge2G359iG673hBavvAzvVgVXn3ElsdLp3IG+UFVKGvQdIAdHPZQ7FnaBZoa+vCGEgas0WfH9xtCr+H0jw7Rjt5KqwBXYPIdEx+GtUJo1bYTStIErlmgOWsGZVc0w1xosrg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=djAM3uB8; arc=fail smtp.client-ip=40.107.74.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="djAM3uB8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EMP07HenzaKYn1DMs30bIfjqHDMHMuiZHqlnds+qTp+K0SXDsbkdlXDsgJfb4aFMoZJm4deDoG19FJmdL7EcGB4kKuGlGSMkwrxslM7lGoIPcVhLRpH2BlGFc0Z4MfPweeNKvifY6s+cVObl5VXjKaIfS676u5zV5vSlFp/l3Gnobmg4YudK6jODS7fwUxuuKZUws4kxncrTAT3dXa6a9arBGUesctbW//riOZPGYI1vD3RArn5Ni4JFvucFpaSNxVDxGhmCf6/6DgV1FIMNY2AdDCABJ0uN4zmYb/0FkQPSanPj5xtDG3SR8x59Y90b6JKMFdmV5KQUF1jjWsWozg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QE4U2vAcTah2VHUKRUuj39R8Bip59Ns0nqg7bTgQr44=;
 b=JtinzgdRbVz0hR1JTJD5BhEk2vtUFPExCO36iG48oxSzEtQnQ3qhJBu5wlMepINFf/ROGYL0SqvMcYMT9ZyUOrl2ihQ1vhjuBmeQl3BQ0ly5FOvaydtBPGkCCh1UYzQ5y6TFc3elS7TiHrjPmznemE0/vsw2IjTtS9KR16YeqKvR0EXUB0+zGjyv/TnKUH1uc8D60Re4z72hKjqUUwWKbKCMZg9CQ1nDnEl4ITw/jhXQknFM+kxnJFV7ziOS6EgRhljFR02/gvptbJ3dB8foP3WwPtm1HoTxGrNP2qfAtcs0cJjKLjChQaqAca9Wk/2Ti/6xhA/+2qhla5auCJweFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QE4U2vAcTah2VHUKRUuj39R8Bip59Ns0nqg7bTgQr44=;
 b=djAM3uB8f8hIlmiqAwcRphogBfNTcsmflTYE0sIbZOfJURZvnkTShtSeRirQ7sWptYGYg0zZ/s+qQfeqYvUgULHrZE+JbPxYKfTxBnKrhVNm0de6WrN9SniWnJoiqfaN6G9LBxw8rsXxIT7Ca9+sdcEJ5UoWte17G3U44D/BNeM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OS7PR01MB14460.jpnprd01.prod.outlook.com (2603:1096:604:38d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Fri, 7 Aug
 2026 00:55:46 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0292.022; Fri, 7 Aug 2026
 00:55:46 +0000
Message-ID: <874ih6u4tq.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 =?ISO-8859-1?Q?=22Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29=22?=
 <u.kleine-koenig@baylibre.com>
Cc: linux-sound@vger.kernel.org, =?ISO-8859-1?Q?=22Uwe_Kleine-K=C3=B6nig_?=
 =?ISO-8859-1?Q?=28The_Capable_Hub=29=22?= <u.kleine-koenig@baylibre.com>
Subject: [PATCH v2 27/44] ASoC: codecs: ntp8*: use .auto_selectable_formats
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
In-Reply-To: <877bm2vjjn.wl-kuninori.morimoto.gx@renesas.com>
References: <877bm2vjjn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 7 Aug 2026 00:55:46 +0000
X-ClientProxiedBy: TYCP286CA0246.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:456::12) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OS7PR01MB14460:EE_
X-MS-Office365-Filtering-Correlation-Id: 2def9741-60e5-4098-c666-08def41e9d84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|52116014|366016|1800799024|376014|11063799006|56012099006|10067099003|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	MKn0NJRWHHImnVTwejHXGpiMpnHHKlv+rvKimKimHUPXnvJV9jR0ojpQ8UdDCv4GFDZsZKCMVXy6pB6LHRi+5rm+xruDOwaOTbNyco4BfsLjjgyhoS9o5hSAvEIlTuKzpddBZoC9urdUQE71uxojqKtx6a20DNWsg23NpBx55gOCXlm3NH/Ty8dyS3uFc30Simrvom3suJ/s9u8nrv6tSGZzAl0pLicRLjoWevYP3kW4HdFUL39In1x3nxmpFGI86XHGaEEwCLjZ6OFzmeo8D5OwajlYYp+jcfuR2bdlqiTUK4umnSxaI+vfQMDzc8EAL3/OtfF/u+/DwKsFdvgKpT0MyUqUA78dbjbUvfhCrWjSEHa8XuoaYShk+SHfCqJo/QsWJQr0JKcg0UyJvfP/kbevCuqxXr62q9jTwUdsMdABLOORj+SSlcnt74zA69yRlYy62jS5+YHajBiKPgKjN4YqQwt6c/OFmWEAbRoxkwgl2Rkiloy4bdhDta3GrWjW1QL0eCVMoh/lOO7o+EOt0RUdJgqXS4ZQY3ERMpWfOrh0YwbFzsIH71Z6+x5DMYseDIoJgR9Ml5QZZ9B62igeSoomugg3wLmWlbX17ASU6GUYLEtmL2ZIJCeA8s/wCtnH9hJ22mz5ADf3SvarIkIuLlrIZQI/BZRXvYiLP++79xyM2/SFfegcOYmgsYus5A60fyXhgqaKPm1LW6At2Vjc9CH0SsfBPMygDy+eDrB05oc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(52116014)(366016)(1800799024)(376014)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0o/0K8R7L7RhOJmlAQxrqYEOifIskEKbL8ErOuEkZjBs/tQpLeGM3ZbRlZqg?=
 =?us-ascii?Q?n+NRIjy0FF6pMa6xOOj3eoIxGDLh7x3ldhXvGiwqMRucCB7UHjYXDtTMWkFr?=
 =?us-ascii?Q?kLfVt7R0Vml1MG7OtvgEM5rUjFjWIp/Q55GPLsVZOFh0XS21p1ecp+xZ1fGK?=
 =?us-ascii?Q?QmYQnGmmkv5eIxDp0ChnOfAVC4d+6BThHmhFaxIAVExSZSXbz0fB01CtbkHn?=
 =?us-ascii?Q?i6IIBjgIZ5xjId0uZrYKBnMsLG5hee1fiv3lGTTjnumg8mf02ILA2K27bnNl?=
 =?us-ascii?Q?jGxOrUPu0q0+FZqE3XpVZO1dkiUdDMjF53evIIoNakGQ9vCy/LmLz50Dm+ud?=
 =?us-ascii?Q?fNjvCIGYFSiJavny9tuGl1WmJU9E3lhcY54lOiWZAb3KlC2C1IcVmZVdMPgC?=
 =?us-ascii?Q?TgBGQpxZpev1l686/t9BUyDAX2dCGpJ1a3GQf2jZG6zzkb5YLEI1Ie1oc7Zz?=
 =?us-ascii?Q?jS3jPgIW0DFfEgezXPW3le+vRn3pY30OVemvCnsq86SkEPOEKMuTRz80v1ei?=
 =?us-ascii?Q?5xYuAVi7KH8ZOmEuhGyBhvdxM67bP5IymO93XT+blrFNS4aEAc9eDwvzegqa?=
 =?us-ascii?Q?FPxf1rVubNyrPndfkyYNtx4Vkvt5e5LhfzMRzndBot2p6YpKdcRBOIAa79S0?=
 =?us-ascii?Q?q0t6FECWxkXo54ViX8DoLbg2WVloel2AeWsMKAo2acXnLmqWewmifCvBpig9?=
 =?us-ascii?Q?U5RiUMQPnrBoPROWoX6aptEasumWIaqQczAtMPExkHSe5F8amyIkhPZd4ZLE?=
 =?us-ascii?Q?4GTAiY+KX2LYRiWpAwh1xGhkWvanivSPZeaNBsrFye19dMfqaS9mdrqIrTta?=
 =?us-ascii?Q?SSjPbXBO775JpM5y4DBvlYDaeVLypRJ9KInlFZkng2EcGuZ+j49cRZ+clH/s?=
 =?us-ascii?Q?FzH4tEsJKJKo2e7FySR1nV5OGOksi27Z7Egqf1mvYAte89sFC6+zRxXBO1PC?=
 =?us-ascii?Q?0XvQotJKSI8Hb9P1g3IAFWdL9d3j/yA9hoUlS/ZyR1kwX9vF5iI59mX+hM+m?=
 =?us-ascii?Q?HYQXrO03XCmy2WHiELbJBZcq8ZZJ0wOuNu7pAG2JnZevNFQ5BBn2/Hm863Ry?=
 =?us-ascii?Q?IIkDI03dGNg2+xI3fSy7tT+uWJ7QOrZzBSBAUaLMZySTRVhme1nidVXcmeJD?=
 =?us-ascii?Q?WyNQwQDeoRUY+HbyD9cIwWlfm/i+8OCW+bK5dXSKF/o9MD2qre/u0oiiGYMk?=
 =?us-ascii?Q?vV9HcCeiHEKEgXmdDWpzNusP9LR4fml51ZayAE3hyVS7kQ0K1+VV/vhBeMRK?=
 =?us-ascii?Q?Wl+4wlgkFcpx4c8QGuHMqtR2m1Q3RW3VBEknFZJziDnyo66yQ9T9ovdSdf5N?=
 =?us-ascii?Q?sgzxQzNi2DIoCLKcla6qEvPoH9wrtB+wWDcUJbEe+SvCOsj3tlrblAyItTNv?=
 =?us-ascii?Q?xuwX/ofpdrXTwbuq1qnd8SVBqK/Ufo7ZkauNYQjynPV+AgJ0vjd1SxC+WNsm?=
 =?us-ascii?Q?hh9hDYa3/c0FwjJ0SMxzbpx+tidb2UkRlS79zAmDsejiJ3AM3ifm6oZ+X4gI?=
 =?us-ascii?Q?T3F+9MNkX9D91GA1G2i3iOaadkIv3eJpW4A/dgoAH8W/oOjzmbG3FTQw4olY?=
 =?us-ascii?Q?tydYxlZzrIaS2HeGD+gG34dULtH3vcgcEZPUyu6cKHsyzSyKlaV9QqO2ndXP?=
 =?us-ascii?Q?/WrDR/2C1bWBZEVyiJQjSAygCiBj0Bap99juyry8i5X5dAQsZdc3zTQP4R54?=
 =?us-ascii?Q?kQFgR4B0c2DTXayp7+ZyQ3JVoc2OzjcQB1erw+IvlGZ56BvTGeT2zJyDldYs?=
 =?us-ascii?Q?4vfDHO4PIlvmzaDAip2BCXMspYt4ub8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2def9741-60e5-4098-c666-08def41e9d84
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 00:55:46.3349
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XRGhBqa3Zg2pzgUg7NnLbkEGtlpPnNVThx45Cn/6T/BVb1rcJ1UohxKEAF2qLEwvuBaadCkEWdSvAKS7KFE1lvIkB+e2ZVRJK1qapA/CwBTA3PpwDgICQC9iYwto53ZB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB14460

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/ntp8835.c | 7 +++++++
 sound/soc/codecs/ntp8918.c | 7 +++++++
 2 files changed, 14 insertions(+)

diff --git a/sound/soc/codecs/ntp8835.c b/sound/soc/codecs/ntp8835.c
index 5837b9379fee7..39620b84e214d 100644
--- a/sound/soc/codecs/ntp8835.c
+++ b/sound/soc/codecs/ntp8835.c
@@ -385,9 +385,16 @@ static int ntp8835_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	return 0;
 };
 
+static const u64 ntp8835_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J;
+
 static const struct snd_soc_dai_ops ntp8835_dai_ops = {
 	.hw_params = ntp8835_hw_params,
 	.set_fmt = ntp8835_set_fmt,
+	.auto_selectable_formats = &ntp8835_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver ntp8835_dai = {
diff --git a/sound/soc/codecs/ntp8918.c b/sound/soc/codecs/ntp8918.c
index a18d79aa80aaa..eca34fafc4e6c 100644
--- a/sound/soc/codecs/ntp8918.c
+++ b/sound/soc/codecs/ntp8918.c
@@ -306,10 +306,17 @@ static int ntp8918_digital_mute(struct snd_soc_dai *dai, int mute, int stream)
 					     mute_mask, mute ? mute_mask : 0);
 }
 
+static const u64 ntp8918_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J;
+
 static const struct snd_soc_dai_ops ntp8918_dai_ops = {
 	.hw_params = ntp8918_hw_params,
 	.set_fmt = ntp8918_set_fmt,
 	.mute_stream = ntp8918_digital_mute,
+	.auto_selectable_formats = &ntp8918_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver ntp8918_dai = {
-- 
2.53.0

