Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011068.outbound.protection.outlook.com [40.107.74.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61B5F10F7
	for <linux-sound@vger.kernel.org>; Fri, 13 Dec 2024 01:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734052876; cv=fail; b=YkIe9QP8+sW2REdT25Ys8UYg+rnnaj1k1eUA5GF6TLR8OHeLVPMkNAKbAm8VaYoD7ytHFMHdmddmhKePiJ+L5QPD837JRgY/t+ct4PXZFBH4eMOpQ1QHfdHA7TKRIBbipJr7jeBazC/MjNdu28bw/nEr8KUh+PgjWDpm8JZJEd4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734052876; c=relaxed/simple;
	bh=9pRvPIUTM2FhPySFJmlhs158KbahAzeyLw+yU+zxM+0=;
	h=Message-ID:From:Subject:To:Cc:Content-Type:Date:MIME-Version; b=DR6MtwBqFLE5YMVzvttY5UR0Zcs1uqzU3bNb3qg11ejTD9mAPgFY6JUuOJrZuDVdxndDAK3lNjuEaA6gq7L6GtNx5xnrBet7bIgBi45XGV6VX7uSxKwNYOIZinFzAee9t6vyt8xd6W497+eN/Y8vopxVHsHQy5kw4Xjrr6+H2Zs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=TfRLDEar; arc=fail smtp.client-ip=40.107.74.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="TfRLDEar"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gN2DQWpSmiAPrrM9F7EvdxwffKHgq1guAfA6Fqs2dZ8+83xmvEC7/6k4IM9YO4FtAIYDMvJbWODj0Z8fp/WeCpEIhq6EGZuVodRQp5lyq4iYr95aegJN2RIhtcTr+fFIB71ggZ/AbdVttVxF7UBBzAC9J5z5jeb1KgtiQYWPgoNW+d7S934kl2fhVobYMtcRUNRazg2iuPUifVSAPBdsd0tmfgwNGzW9YQy5BG7baJu5yfNAmUA9tI9hYlXbmuXHeiWy+C7WItG80mStJx/kWX5gnETriqXLALyAoCo3TdH512EQZ3iP8b0XcMvjbHnMWdNnmBVtmXChp8Ut45WanA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Ek5TbNS+Xd9lPqHTMaRk24MYsM+rorBJvnrd37axGQ=;
 b=RTYL81e0UqGQSYOJAndScoHZfmGOFXyMyaMp+gGV2+oqeH9rthVOgIoCPJfMh01xLa2JA7y20wUnmR4dXJT8r4DR9K87fXwKre4W9ANY/w/IbXnSi/lEMsdkWt5SoGzjiCLku5gj/mIog8QaY1SJubCQm1ACJBA+ldMMKoETUjrWZ0GVFhSb0iYz9Ill7PWWvCQTnpQCdzuKA44eRZ0SdSvJQmX2cLWUyUCZiC2L5DxsOMAUeLQVM+Aw+RRQyrj1n9WfUwipsmGuMPsVtmH3cEfQi2MViFUuXZtUrQjekkHWdxV6w+16JGjytrFb847gYzS2d/3ZpJCp5tC5UXLvpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Ek5TbNS+Xd9lPqHTMaRk24MYsM+rorBJvnrd37axGQ=;
 b=TfRLDEarGcwT3n8lfR9NaVVtXuSvCnm3O4TqHiTHytyQzCSRM2Mt33spca3WICkLYdYyUzoFh+KxgpKSVpM18Df2O90Bcg5sPipBAGVJHpzgyBbQvYtJulMVSnBI45KNFCcWtqDv55jvnM7lch8FsJFDeQfr+FmLIXi4+zcSiWY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS0PR01MB5635.jpnprd01.prod.outlook.com
 (2603:1096:604:ba::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Fri, 13 Dec
 2024 01:21:10 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8251.015; Fri, 13 Dec 2024
 01:21:10 +0000
Message-ID: <87bjxg8jju.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2] ASoC: soc-pcm: don't use soc_pcm_ret() on .prepare callback
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>, Hans de Goede <hdegoede@redhat.com>
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 13 Dec 2024 01:21:10 +0000
X-ClientProxiedBy: TYCP301CA0037.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:380::9) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS0PR01MB5635:EE_
X-MS-Office365-Filtering-Correlation-Id: 7dbfeba1-e4ae-4f05-938a-08dd1b146d2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8zCv6da3a1nSEeATwcvLjq7qh1TgtvRuo0Segm7D3FW18nUuravWwegcQTJF?=
 =?us-ascii?Q?JaBnNdcUSAdtD3dX2ZhM5zhfNAWY1dKAFOBEBkaPXhLgv7mpIapOX/bC+1el?=
 =?us-ascii?Q?mHYHaItrWwX+DlGl79yfwOH5IlSBQ7+n2aqvX14JX/cr6lRMoLJlFBK9b2Ck?=
 =?us-ascii?Q?J9aHTU/NY5MBL4BNnhA63MQjj3UtJDVdPydpEplTHEjRm+6mXVw+mZz0lsuz?=
 =?us-ascii?Q?z0jA/PPegbw6Ef11yBVxY7rP5Zqylc8+MmtvNHYSy3cJfue8vej2NEnaDuza?=
 =?us-ascii?Q?sDvv83FKZbBbqveEFDQ3AOnmTsnX8M+xKa+IY/99lo2WQ8rntQcFDYqNH17F?=
 =?us-ascii?Q?Bg8EvNYybnUYRw06KoMDZxDK7JJAb+6D51jNep+eJpgzmixxZ5u27UvplUtx?=
 =?us-ascii?Q?00+HF36GKSD8F+EPPqSFcNZ8pZIqwiwfrKMQmhbgMMGS2kEFz+wkyUZ/vO6D?=
 =?us-ascii?Q?SJQwkGHt1fNgweOsI7Utkme1L6jWDrfB9TtGV60FaZmL17ad+vYfihpN9SH5?=
 =?us-ascii?Q?SmYESpTNlWKsJZMf/lfXQJpCa12EDfejKZKGmf2bcrxq7ogtD6muE5+44vHr?=
 =?us-ascii?Q?59rRcrA3oXaYkGWbha/5aSaSa0tUTQKKAZTosVkTqy7buWGHW5k9OCIf2yKU?=
 =?us-ascii?Q?6UGB4hnrQzdk+S4VOtZh1kfru/qA7ape0OHevo53aRxQXu+677Bho5Pn+RsP?=
 =?us-ascii?Q?N/hB9bCL/At+vUZcbI6W11IsJCjmWenhnT+zDeqwbiKhhNyGhI4uP/EoRKmn?=
 =?us-ascii?Q?4Z9uf8ye0z9eJac4AsxuoPj1aAdX8dGjJjuaFBCwuYITYdtju5yr6sf6FUgi?=
 =?us-ascii?Q?0BCSPrnr2El+nJqSahREeZRiQreIwxZFyfOKOjiZ4Rwt3M1x5i/scW6y6q1w?=
 =?us-ascii?Q?hDAHOonl+j3ImMp9DoyUYgHM6J+Kn4YeEn446IjE1sW5bLLo1OEsW1vC0Fya?=
 =?us-ascii?Q?pJopwNIo9fC1YVJ8HPg1GObvJqOoHbIYY+BHz07yeLxlyhMDEld/mm8W7Ljs?=
 =?us-ascii?Q?eizbiwx9Gzsz94ZjM0uAnFj1Kp4qTtpObgW1eiQ2myoZtglgZ8tancg1xxw2?=
 =?us-ascii?Q?83iiHLOW8sdvrhsqTUZasLHJONSKSfDKfvmCG6OEDnB0BdOKwmhrkepK2LUP?=
 =?us-ascii?Q?n/X+ZzTVExi7YbQuwUaxtS3XCJJIB3GeOpR2CVMzOgNOgcrYAuOtDkvYJ/Ak?=
 =?us-ascii?Q?lQvhYjFHILzNzNzzAz1mB+M7yug7SbJSEYvJh8HV8IgyU3+OC3g5xRFNcQ1b?=
 =?us-ascii?Q?5iuB80L/flwLs7qvpdBTcIVYrPZvNEmcXzkp2lqQKiNbQ3CFFC1hP0KiF2Fa?=
 =?us-ascii?Q?TCPKDY1VwdEAKqvVfOMcioEwV/3kx2JUJ2ECWqsKHJMNR6a1IXwMtJcgfeoF?=
 =?us-ascii?Q?ZZaCYuGF6YvjMZTjXxYLDgDIyEOVxX7KbAa/BbMCJGZo7MGWLQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tTJKiewqKylNO/IvG2qgmXCM5mUKzOMcaLRlHHJV9Dxkbz29bGeiXvqICiuY?=
 =?us-ascii?Q?MXU/PkiDEW2GUUdkUqmp6NTKzk+4G9Td27G+xcBGrB4JHHlCcYrGICrdV3eU?=
 =?us-ascii?Q?cCUAM36bHPUJ8ZWC9BLhMM41Fw5LxXgbLecGEK49zQmloyxivWjSLCqJv6At?=
 =?us-ascii?Q?qYj57jevVAWOKH1IwUNak3CpEKeS3qGKxB21IHRfX1IoptslK3cUmPqGjNlf?=
 =?us-ascii?Q?rSsRgPmZuQtNHvx8AZd0+CaMD16ysht7G5Unlcxc/aH3QQulJFQiAMr3gIik?=
 =?us-ascii?Q?H2f/TTiTfEJPvgPe1B7+Hkvc9PC8GpbbxOF3iH4I2ivGiuBGjwJSBleLSs49?=
 =?us-ascii?Q?yOaWIMrradtAWLXduO6Mt/VW1Y2+C7Nqgb/jwzEIuR5BzrCRJD/wbDuCAND6?=
 =?us-ascii?Q?HrcmySUrtxLPBkwnvELGqPqbda6s5Fb3Q9ZDb+QLxMOMudfCPPPMv9jykuCG?=
 =?us-ascii?Q?uGe090ImbV6RGGCVBSV8xok01PWI2VVM7iEMTWBzPKbUVnMRb1AjeIQBB1uW?=
 =?us-ascii?Q?yvO2854bwVxPJ85jo3em5F6XGVtpLZA7BPOtU4ATQJLZ9zMsciHtkiwo9/2K?=
 =?us-ascii?Q?Xpyx9A3hAaXcajktaV2AoF0OImqCQX7rwRAld82erfflD9U6yags2TEYn9cq?=
 =?us-ascii?Q?XToNg3Ctm2OscYlbwNgvpDIcstQiU+h7i0FD8SQ+E4lA7ud87E/hrPpeZ4pl?=
 =?us-ascii?Q?F+bUdxL+Sv1pQ00ECJkFsk97KIdtj5hVpc+kmK51BK/Drb1wX1MGwokHYaIy?=
 =?us-ascii?Q?N7Ag0sajRSRjcN20fcwF3TomjJ8F/xfvya9HflelTUppZf4Gxjw4C/rEf4X0?=
 =?us-ascii?Q?xepbd2gAjWaaIfDvIQZPEaK8/I4IZdZF06fTcbRtFJ6M/g9f9Gl3ghBtes2K?=
 =?us-ascii?Q?yGyGWgWHC8yAj5ELtezM6I7l8hFe0H7kzCS2jVOBgIPuapJeR6B7ss0AbFLi?=
 =?us-ascii?Q?P3UY8ynMa11RB0EOwjPJz/j2rtBT0avWTP1yRLzi+GRn91Ez6IjvwpGh5sP8?=
 =?us-ascii?Q?snTBsy6Q+pT7jVu8+EEZ+tCBVhi0oNRq6fXOyszDaLa8SgBLUhgAJYNxi22n?=
 =?us-ascii?Q?gElLGN/CKRucGKFfUG3QEEdIs9uwGi/A3/USCANwtcaLAu0sXhsn2uxWFQfW?=
 =?us-ascii?Q?4cVyT05kDDRcWdEgM5SDmGIYAJV+sGFn9QdqNACJ5pCT17IcYoYAP39VijhV?=
 =?us-ascii?Q?VbBdO1KvD6R+Oj9LaFO2NHMgBs1r6i+qLew8uovct144S1HlgPC97+kR7dyw?=
 =?us-ascii?Q?VfJYT07qwtTvGBFMr71ILOsArD+U11n4iThUtJKrrvoR0AOzhqjQSZl+y/S6?=
 =?us-ascii?Q?LWNfYLP3mm18PTEjkjFWhMG5zN2wyL0ti5zQzwivx5aXnkCol0pWsSYnn/lB?=
 =?us-ascii?Q?dHuyiwv+rSWpUcKnwpN8eZ1Lugv2F0W/hCjMpsILUK/BEpVxrgIbPXH83tZn?=
 =?us-ascii?Q?wCg68ijE3aMHImeMCymKa0kaFkyGuRj9Tm5OEtZY5QRobflYxPEMIgSNFuRE?=
 =?us-ascii?Q?MbcbBq5LW8vsDzt3uyT4RCW55T9H80nQkX22sIh0Xzd3vGiFVof7E7uUT/mg?=
 =?us-ascii?Q?BQ2tYR9d+++6Djt5o8B0DNZfkfSJrjOqFd4RU5AYerDcEUlxNwQ8RSLgj2qM?=
 =?us-ascii?Q?udD6vaP+Le8h1HdKam4CTGw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dbfeba1-e4ae-4f05-938a-08dd1b146d2d
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2024 01:21:10.2660
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ir3OSdpvA0Oihei5PWiUP62pn0ujjW0sNIT+118G7MKql7Iw55Bg4R09FHElKzmSWAZFTQfQbuRjB8NJuHBbgaKZSNRQSM0UvWcGRTDCUJf7BiY+s38ruDZzGqHXI8I7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5635

commit 1f5664351410 ("ASoC: lower "no backend DAIs enabled for ... Port"
log severity") ignores -EINVAL error message on common soc_pcm_ret().
It is used from many functions, ignoring -EINVAL is over-kill.

The reason why -EINVAL was ignored was it really should only be used
upon invalid parameters coming from userspace and in that case we don't
want to log an error since we do not want to give userspace a way to do
a denial-of-service attack on the syslog / diskspace.

So don't use soc_pcm_ret() on .prepare callback is better idea.

Link: https://lore.kernel.org/r/87v7vptzap.wl-kuninori.morimoto.gx@renesas.com
Cc: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
v1 -> v2
	- Change idea not to use soc_pcm_ret() on .prepare callback

 sound/soc/soc-pcm.c | 32 ++++++++++++++++++++++++++++----
 1 file changed, 28 insertions(+), 4 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 1150455619aa4..88b3ad5a25520 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -38,7 +38,6 @@ static inline int _soc_pcm_ret(struct snd_soc_pcm_runtime *rtd,
 	switch (ret) {
 	case -EPROBE_DEFER:
 	case -ENOTSUPP:
-	case -EINVAL:
 		break;
 	default:
 		dev_err(rtd->dev,
@@ -986,7 +985,13 @@ static int __soc_pcm_prepare(struct snd_soc_pcm_runtime *rtd,
 	}
 
 out:
-	return soc_pcm_ret(rtd, ret);
+	/*
+	 * Don't use soc_pcm_ret() on .prepare callback to lower error log severity
+	 *
+	 * We don't want to log an error since we do not want to give userspace a way to do a
+	 * denial-of-service attack on the syslog / diskspace.
+	 */
+	return ret;
 }
 
 /* PCM prepare ops for non-DPCM streams */
@@ -998,6 +1003,13 @@ static int soc_pcm_prepare(struct snd_pcm_substream *substream)
 	snd_soc_dpcm_mutex_lock(rtd);
 	ret = __soc_pcm_prepare(rtd, substream);
 	snd_soc_dpcm_mutex_unlock(rtd);
+
+	/*
+	 * Don't use soc_pcm_ret() on .prepare callback to lower error log severity
+	 *
+	 * We don't want to log an error since we do not want to give userspace a way to do a
+	 * denial-of-service attack on the syslog / diskspace.
+	 */
 	return ret;
 }
 
@@ -2539,7 +2551,13 @@ int dpcm_be_dai_prepare(struct snd_soc_pcm_runtime *fe, int stream)
 		be->dpcm[stream].state = SND_SOC_DPCM_STATE_PREPARE;
 	}
 
-	return soc_pcm_ret(fe, ret);
+	/*
+	 * Don't use soc_pcm_ret() on .prepare callback to lower error log severity
+	 *
+	 * We don't want to log an error since we do not want to give userspace a way to do a
+	 * denial-of-service attack on the syslog / diskspace.
+	 */
+	return ret;
 }
 
 static int dpcm_fe_dai_prepare(struct snd_pcm_substream *substream)
@@ -2579,7 +2597,13 @@ static int dpcm_fe_dai_prepare(struct snd_pcm_substream *substream)
 	dpcm_set_fe_update_state(fe, stream, SND_SOC_DPCM_UPDATE_NO);
 	snd_soc_dpcm_mutex_unlock(fe);
 
-	return soc_pcm_ret(fe, ret);
+	/*
+	 * Don't use soc_pcm_ret() on .prepare callback to lower error log severity
+	 *
+	 * We don't want to log an error since we do not want to give userspace a way to do a
+	 * denial-of-service attack on the syslog / diskspace.
+	 */
+	return ret;
 }
 
 static int dpcm_run_update_shutdown(struct snd_soc_pcm_runtime *fe, int stream)
-- 
2.43.0

