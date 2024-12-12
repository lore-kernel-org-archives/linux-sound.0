Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011039.outbound.protection.outlook.com [40.107.74.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A01984D02
	for <linux-sound@vger.kernel.org>; Thu, 12 Dec 2024 01:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733968682; cv=fail; b=J7F9p1IxJCiEwTsCrT6tz9I/ueiw8nmzWaJsNDLS467HFh83Juko/r6qy2Ml1uc2PcTDqGJle+ZCO9ID7eu+yrkmpVphvtfJWQgX+yAgZzVX35HN0Fr4BgCFCXLe11flUBQ/oMWa4R7J1YjVXe9i0fBdsbkSOqgjmjV/GnIJ59Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733968682; c=relaxed/simple;
	bh=ZBONh6mMeTJOnX3+yFo4LE0prHNA9aBTKP4ufhzK9m0=;
	h=Message-ID:From:Subject:To:Cc:Content-Type:Date:MIME-Version; b=EEb7NhSovZXZ0UR1+RhkFQ6Tg3gEsCbeKc2B25lpx8tFiekE5jwBQrB2i/SG9HV0hUpH4CXZ7h2+wqKlpge0Mt8gHQxx0UO3ar/Qv2fOQvC12++eshAZyretU1KlTcG0QLh2N5QFD7LoucLiPWzBVd2CCypSMLHLiTS3Ltkna9Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Cl6aHfYV; arc=fail smtp.client-ip=40.107.74.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Cl6aHfYV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iQzgUsPgpwGXt0QgQnfYsJ38CcFWPcRyI+C6evev17Gp1KRuHp/6S+Wj8WfxPhQsF4YI+a70qH5cWGQjon9U0SrM8pHUaumj2xwSJqOgRFwAQr25DJwnPfATO9mlMym1ccgTuc5CgqkpwS/VWaROjiVt5y4P9X4a4z6Duhkx5uepdiXGRv/R9N+OoXopMneZdjHwTi7K8s0GHm/AogAAz8EsNoP8nqk69mtjL5Bd8Il2lvW3B7jspRshuL10zM/2cEYwrc2ZRe4/pBd8FlpcJblan+fIo331/L3yKttq6YhjOrLFloyjzSw4tY18s4JUYzUVMSnlcDj2oVNoGwI6Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6sAlLiGiDlGaH8Hs6B8Rk1eakq8SrIP+Fo2TTb5te/E=;
 b=QdPeklY2z+ayCj7nYAfuMFtMBH+AagqCiar/EMYUGWVlCZg0kBU8D1UeYuVFxvzoXFjcdu9Q3srGbv2GxScxdx370hRUktC+x3/NXoOY0uSblf1qC+3W7+rg/0gzfP4F+wXaUoxPqljs90Hyad8sbLzeyYtFJV1FNR33o1N2eJpEgmWLqV37/jMY0JTmZcUkKPjw8UjKA5lxrVAZEe1efQyYAUL9umZ4Z4wwy9OIdO1pMa0UcpPqwsbAew+djZGJ/hXtfluWT67uoQZqjQxDeMVGoJZUWWoJVuHlnnafMTpeGK6shpeaEZ07abLNaV+88wIW4BOf/KjJTHcpb+gNZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6sAlLiGiDlGaH8Hs6B8Rk1eakq8SrIP+Fo2TTb5te/E=;
 b=Cl6aHfYVQHU4j6bRvL5eZ7JSlSU9QlkJCDgRJY557FukTAcc94PCaNZwNaMY6RyPtPrnujafe4JLvMgsJkulRjULjuUcU+0V4EsEdCYV9Yos5vQVVpnZW6MtEsUQmIvHIOtlPsor8d+mK+i8il5dYqIm1zCVNoc6+8IlBSstu1Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB8702.jpnprd01.prod.outlook.com
 (2603:1096:604:15e::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Thu, 12 Dec
 2024 01:57:55 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8251.008; Thu, 12 Dec 2024
 01:57:55 +0000
Message-ID: <87y10lu0gx.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: simple-card-utils: Unify clock direction by clk_direction
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 12 Dec 2024 01:57:55 +0000
X-ClientProxiedBy: TYCPR01CA0158.jpnprd01.prod.outlook.com
 (2603:1096:400:2b1::9) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB8702:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b671ae1-ed93-4da3-c4ee-08dd1a506553
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GuG4Yxz98p4UjSTejjUXA3ZkoPdVNGoEuF72IA0hpxzvC+3BDI97A2lS4sy+?=
 =?us-ascii?Q?9TFPD5LSVajeKFCavdYMnh3hUKHlrxpAo+8Ct4z7530mck6QCQ0PGJ5CNdGO?=
 =?us-ascii?Q?Dh508GlN8g+Di7bYNGSo6nx1T+Qa4IN/62bh7MjyWrnDF5gbQ0xlwBfF1YZU?=
 =?us-ascii?Q?rZWJKqrUHvb1BokLllEvQvOKZb7IIOtATJfcrpO0skIIMNMYkr1b/5Uw9UBh?=
 =?us-ascii?Q?slTz/hWMXPLTuzEvEGxTnie1VA0rKNQp2HgeMuuW1dc8OJGyLMK8p4lLyQS4?=
 =?us-ascii?Q?fVAdep6MpHr2soVwh1lcw+2rHX7Q45lkhhKNETUAUO4yjHHSCCwMqtBeatNM?=
 =?us-ascii?Q?GITLDLa/Rp5Gf+2Hw+MN7fvkJFWzHTHeh8AVyHTm94LAfU+lnG085qZc0USY?=
 =?us-ascii?Q?QAJkO1TKKTJ13j2YdjPVnYQoqfOX8a+SV/l+1PQTs9XQruJtRdl7Iqr2/s9Z?=
 =?us-ascii?Q?H1wiMIqK0cj7R+1xYzOjJnZCgoaVekLDVPDQr+/0qL5ZYyxECYqBiYTEBy42?=
 =?us-ascii?Q?G9RSICpxT1OL5F6mTtQXMBunbLaprqVBWF2KSxJ3cjBYeDYOUkVAZ+6+FyF3?=
 =?us-ascii?Q?CRK36k2LZTL4CfrRmE5uRsUHEROPDCHx7BXz8FScvx10TyXmbKrgdiBMgREp?=
 =?us-ascii?Q?/KZgX6dFd4Qjg7Jfx3ezIj67hlwuUDxECTSAmU73wDQamFYQFexjPY/onHz+?=
 =?us-ascii?Q?+OfHjxQwc5Dw0UXJjw5M3LUVcNjPVLbpSshq0ZGxG/sBQotfVm4Rzmqax9no?=
 =?us-ascii?Q?sJLrUMUq5NBaeDgEjD2BBQx+KoeBlXEj94yUR6Ggbacmr4v2YRhnEQOhUwFH?=
 =?us-ascii?Q?tOtjJAut1SzCRzGFhA+2pnAsdF8KBVNz+a2HPYX38mx9VU1YyKKsRe0xAwYq?=
 =?us-ascii?Q?fqYvPff6jwAg2H39IepfSbxUcfy1yYW3GneFla9zBgNXNXqsyBhvA+b9Eb2a?=
 =?us-ascii?Q?LBNZaycLAwjJi/Np26g6IAJprUMupI+SOvcbK2K3DYDoII0/2Zoqb6WKW3XK?=
 =?us-ascii?Q?7OdHOEvGJNyx1+8GfGgh19Uezx+0vVywbcALimmZomPdXvnanPljoTor0FpG?=
 =?us-ascii?Q?bCDTyDTflkSYbcidpOSK1puduWNa6HJN8JGlPLczKWUTroqTKwQ6Q/HzZVfn?=
 =?us-ascii?Q?GXbd0ON4OfpDOYaEJE5IZVj/sAJRsFx9t9dxo7+dmc0LkaHBz8K+hu54pEwz?=
 =?us-ascii?Q?BN2V2Ls0m0GDB+3lxbe/K2eztQQ9D0pE7/pshx+gWJQszyKh915B+44bpT4G?=
 =?us-ascii?Q?/RupdAPU6hyqAo47TTeyvYyrflWytT+2JNXcQ9BN7G5OrPom81KnbRL5Okpk?=
 =?us-ascii?Q?FzvvXC5dh9gexphNfUvRHt1JMENdB9qFbPA+Ln5XFLENJx57EpJgKoLcuzSJ?=
 =?us-ascii?Q?y5vUNJE5aa7mDXGc4h92pvgikXLn09HaGaEvnQEw/1N33ovqXw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kt5cK74qSmW5XL7CEBIlnnHTESCxqMOs0fl+AWBuj0jofnGyHkWikuS4oTDq?=
 =?us-ascii?Q?9i6q86yIigdjjZbZaDIKG8OOy0LQ6Of9Ep8UurqIHlTQTYrxbnyDRd/WKxGa?=
 =?us-ascii?Q?Nn+Noh2WH62rRitksnVhel8AAz9u8J/UJEul/vTBCdiJJ+ashBj+An9r6K+t?=
 =?us-ascii?Q?2navb6g1oUCDe4w5ncDIjlEikzHWLz9t3TXC0qCLDrysUpZNIPd7rgfoE24D?=
 =?us-ascii?Q?t9/+lsLa48Wm8cgUnWVQJiHco2w+vE7Hhtehm+U86jcyX621e94hbDsXZXr/?=
 =?us-ascii?Q?D9D3Kay+KxUq9DdhwGRVN4qQ3ooBOwUJZSMAdD2ACUzjINBPcLEIGtEcGIQ4?=
 =?us-ascii?Q?2ikyTRjBj7lNVSCXEfqFQbwg1G0lSTdswsQStIFWy+3j4Tk2P+tXZ+e+mltD?=
 =?us-ascii?Q?pl/hR3MAVhbq4bji9sIE6a7MFRyAYuMCAzyPtlAeEvcGcPSmanVkN+NPzgoA?=
 =?us-ascii?Q?9ALHX6rcUUKlPEvOzX7d4UbxtX8PFjgE1266iETsdpjH8mIpj5f+28i5QTUW?=
 =?us-ascii?Q?x7AS3iXNhYS/Mq7vCnHkyhmd40PiApMGtNykfPnjo+lnQckCkot+w/dFmB9v?=
 =?us-ascii?Q?XtDvqneUKuzgQ8BAogRV5VahFOjVKUZlBoDGrVbF6LUGIDIKxhQ1XhSwr6li?=
 =?us-ascii?Q?F0D3FCg9BZkfusfAjAnIqxLSX4JipJclOh6p8hbPhwQZsDMe4jfi8kyzlYxD?=
 =?us-ascii?Q?o+vpAmKui++Tae6g3vj+fKanmvgYwWX/iEz0MAW7A1JF19NkCLfL1qj68PZU?=
 =?us-ascii?Q?sbZae047xMi8iGkTi6+lnRfuOHyFNFTpeGuX6J19cBUX+pVKamGnlTiywh9l?=
 =?us-ascii?Q?oIT1S+sNggK3CI4CUDMp8OGiJjSoliW3/g/txrfmb19HG7OHyi0GdT6udrcE?=
 =?us-ascii?Q?9oP4jJpZeRuIscLANedk0O1UuDc4UCB0kIrkF8CXcpd/HgwIioceD/H3wQp0?=
 =?us-ascii?Q?M7agWmcrhrHlaPb5KE7I7o4xojmzTHYBDprxZQGiJ63MxQ0fbW2cq0EOc4X/?=
 =?us-ascii?Q?ADdEswZs+p0PMn0jOx2RdDvEAc+x0/0ipFIjEdrncVT60O805ZrjZpTSbA+4?=
 =?us-ascii?Q?FrUFfZAG+eqtIUvIx1eOqKzdZ6/vpMiaFjeTGpar71Oj8fKL6AJqfg7wB1s2?=
 =?us-ascii?Q?mjNwvD29Oux0EAbjoM01jHyNQiNhr/ZjBpCLqZnAK0XNol1T0C0o+Y3VJ5Lg?=
 =?us-ascii?Q?BIYM8ZQyf0nvdBja/Huz0p/BBmnsLPvRHlgWv+cKIPYskBrSlmwE5HdH89Zm?=
 =?us-ascii?Q?CXoXjIfbOloR2ns4pESYLdn3O/92viL0rqW0qGmeFCNZuhIQHx9NXW/FqdAe?=
 =?us-ascii?Q?JUKWR2AzPWi5ZzCAL+B1+9aq0RYBXnqsDg4Ma1Mnw1e871Mb74of6ZHrHRZ8?=
 =?us-ascii?Q?EECK/w6sJCzyjrP57aaJHvzFphdu3C7hvkEBquzczAFgle3NxS53CC10iuH8?=
 =?us-ascii?Q?c90g+YZXpkNczn79hcXag9h8RBkiOOLoShHfXrqh4Ly0EFjCPWyrW+FMt9SX?=
 =?us-ascii?Q?7q5cvJYWW3G9w87+F8DODSgo33ijfLI3tP2zgWJNJatyUkpO+qndwebw/Q1e?=
 =?us-ascii?Q?JHyzpMKHwCpoqI/4KHc8oFHyME6S2V0HGWQOAjb3D2VN7JODkpn2jXHPGkBX?=
 =?us-ascii?Q?xC8K7dq/qWzthTmkG1d7Sbk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b671ae1-ed93-4da3-c4ee-08dd1a506553
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2024 01:57:55.7564
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: baoG/NzyOG3Xtph6RFAHr1mPrG0OAVGSJYIhydsjW6wNL7QumOzygGHE694V0PhlnfsIo02SkKLFkSjbm469HMOG2PP2Za7Z/5gua+D4MXajFHiRN4WquPCYh5dzu+vK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8702

Original sample-card assumes SND_SOC_CLOCK_IN is used for
snd_soc_dai_set_sysclk(), but someday, Codec uses SND_SOC_CLOCK_IN
and CPU uses SND_SOC_CLOCK_OUT at hw_params(), and dai->clk_direction
is used at simple_init_dai().

There is no uniformity today. Let's use dai->clk_direction for all cases.

Fortunately, almost all DAI doesn't care about "dir"
(= SND_SOC_CLOCK_IN/OUT) in .set_sysclk callback function (which is called
in snd_soc_dai_set_sysclk()), so this patch has no effect in such DAIs.

But this patch might breaks some existing Sound Card. Use
"system-clock-direction-out" property if it needs to use SND_SOC_CLOCK_OUT

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/generic/simple-card-utils.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index 6c5a1c5a6b3b2..a0c3111f7e08d 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -365,8 +365,7 @@ void simple_util_shutdown(struct snd_pcm_substream *substream)
 		struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, i);
 
 		if (props->mclk_fs && !dai->clk_fixed && !snd_soc_dai_active(cpu_dai))
-			snd_soc_dai_set_sysclk(cpu_dai,
-					       0, 0, SND_SOC_CLOCK_OUT);
+			snd_soc_dai_set_sysclk(cpu_dai, 0, 0, dai->clk_direction);
 
 		simple_clk_disable(dai);
 	}
@@ -374,8 +373,7 @@ void simple_util_shutdown(struct snd_pcm_substream *substream)
 		struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, i);
 
 		if (props->mclk_fs && !dai->clk_fixed && !snd_soc_dai_active(codec_dai))
-			snd_soc_dai_set_sysclk(codec_dai,
-					       0, 0, SND_SOC_CLOCK_IN);
+			snd_soc_dai_set_sysclk(codec_dai, 0, 0, dai->clk_direction);
 
 		simple_clk_disable(dai);
 	}
@@ -483,13 +481,15 @@ int simple_util_hw_params(struct snd_pcm_substream *substream,
 		}
 
 		for_each_rtd_codec_dais(rtd, i, sdai) {
-			ret = snd_soc_dai_set_sysclk(sdai, 0, mclk, SND_SOC_CLOCK_IN);
+			pdai = simple_props_to_dai_codec(props, i);
+			ret = snd_soc_dai_set_sysclk(sdai, 0, mclk, pdai->clk_direction);
 			if (ret && ret != -ENOTSUPP)
 				return ret;
 		}
 
 		for_each_rtd_cpu_dais(rtd, i, sdai) {
-			ret = snd_soc_dai_set_sysclk(sdai, 0, mclk, SND_SOC_CLOCK_OUT);
+			pdai = simple_props_to_dai_cpu(props, i);
+			ret = snd_soc_dai_set_sysclk(sdai, 0, mclk, pdai->clk_direction);
 			if (ret && ret != -ENOTSUPP)
 				return ret;
 		}
-- 
2.43.0

