Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010057.outbound.protection.outlook.com [52.101.229.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 147B437F758
	for <linux-sound@vger.kernel.org>; Wed,  4 Mar 2026 06:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772605384; cv=fail; b=El6Nl4vimJk9PkciHo73VK0VNLK7naxQJ6DeSfNZHVW5QXgvcekOfeOaNU6SD4kgbE6DUPek6xtqkQ9TnUQmlFF5Hs8rlIYL/yUb+KnN6zIF/p5HiIGVO4diyjF2O141HQA28iSQ9Ch43AgLHWOsYqR32mZrLCecg0F9Sj0XKA8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772605384; c=relaxed/simple;
	bh=YwB2OG5ktHSOFpEhsEkYgDTiAoGFd0vorkGiZ56Ev0Q=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=GqvFF0yWEaOUGMHB0PlSMg2XwNbWI3TTbxLmGcHrKzOu+R4L4kv6+yShc4wROfF6eZMI0PJJ/A3XbcYHdzYafkgJh7Yeh1ZXZTLRF6MFP8Q3lygF8K8Fc7GetfqZyhUGHjoS67z4O/tfQ5aNwjlyimZlXrJP70JS4+1SNRmC1YY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=U2hlxqkP; arc=fail smtp.client-ip=52.101.229.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="U2hlxqkP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZT2Jqn55MCJagvqMyLI3u3pYidD6e3dMejvdKERiEkmcoR6qUdOmHCFnM7PJDmLiAt2dUKeb370Fl5qOmj3u55xnlkkRawn3r64uvH41mSwoEsY/KODomHNaVTDD+FrOujjDsKqZN/bXDisz2wJSullq6XrzPGB6NkrZV5OJ+7MEtQj/NS/IJNIytrSsB7ixrnqc2f8pXaJnc/SMhIy6n+KNUpBzdJgVzfN0lMGH56hiUzFQHW6vTz4OG58JGb7ObZ0xCt9ydj6951ffkF2ugG6aEzpDLnzJRbWKhYUXxPL1sS2Dl6BIPUSQ3DBmDyi34ryplLQJgIqML4jf8LRFSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M8ig7IMCW3YGor3Xw6uQmOnckh1x37WeoD1j6tDwUkc=;
 b=BnaoibFLRaWwQ66kiaRQP5y1myE9cdWevqUFtUL5Uz7rNxeUdfpdaXc2FQ0QJPv5Pi8a+pOTTE0Xp4UouGa35iUxeFzOs8zlmH/61VQh3cvFIL/op0QNPwlQk7LsHcR4BL8LiF35ERoq2UxzIApPsAgJdysJkmbVRVH6VKJrFd7bs95qAdOtV6hRvoaIuBJNI7htOFA+ggmFZboF6uEfE0aLkLbg0nrSzvMBKTIyhR7ixnlAOTmH75W37KygFnjiBgi7zSr+tr5feE47rfFLs9+RqRzEhKlHBWGpALfuO9zyLgCJUVIdTsx7k0/Y/ua92IKRm2/K7gVa37E2WFizUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M8ig7IMCW3YGor3Xw6uQmOnckh1x37WeoD1j6tDwUkc=;
 b=U2hlxqkP34LRuMBhjzSJeMmD7wMw00p44ofGzYAaW/m7zs4Pgmf0Yz3ALBiaYzJbnx+6jyHR2V2DVkV99vgTCpf5eC+w4jfotgym0F+vb6DWcg8yKO+6JCmeTp96jQkx0G/+khIOMvfl+J3o21McCd8Q9JQTJs8jWuTm19NuSHw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com (2603:1096:400:ff::13)
 by OS3PR01MB9755.jpnprd01.prod.outlook.com (2603:1096:604:1ed::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Wed, 4 Mar
 2026 06:23:01 +0000
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9]) by TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9%7]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 06:23:01 +0000
Message-ID: <87ldg8p0zf.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 07/29] ASoC: codecs: cros_ec_codec: name back to pcm_new()/pcm_free()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7fcp10x.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7fcp10x.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 4 Mar 2026 06:23:00 +0000
X-ClientProxiedBy: OS0PR01CA0186.jpnprd01.prod.outlook.com
 (2603:1096:604:1c5::6) To TYYPR01MB7976.jpnprd01.prod.outlook.com
 (2603:1096:400:ff::13)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB7976:EE_|OS3PR01MB9755:EE_
X-MS-Office365-Filtering-Correlation-Id: 62029feb-af52-427f-30b0-08de79b67c5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	DEA81Up4kSbiaFPlHrg7KEIVeGpHMOK2w5N2W5+kcCLR9aK0rFc6GCIRl3MED3MPCXIuWta5GOJn9x/iNcpMEOnz5k/zz7QIpBhtO/yaEBtSav6R5j3upcy+hGVGo6ucHVQEUp9tu7h6VePKuj9GKWJ65wm3CdT3tWnwzC793cAF35ZviMpEh3HPkeLRV/qfR8arjG19jPBQhfgLlKPXTcVkWvBbocDepqfvTkiBJB5IG6gHLG56DQqKoeXR7NMcr8aHVxoqIKhmH85yGhLgIwYZYajhoXEvqAgqkck2GvHAhBshCbLvUslVfkjZXyT4pgwDRgAuTz+5murhb+czYBSs1zuZUzI4mIzKq+LxXT19Yj3QGCNZWVWErobOePFjDMAL71YTXBxP0oJD6aKEoFar5biwz6Rrdc1f3DbRW89UCq9E2uoGSpShWt/tQw9V48f/IYDvEyrITl2/UEVzIkiAJJ4XhU15lINPVYkfJ4NFMNST2geEPXFpMQ8Cv5VNZ/OV4QlhCdLb18UVYueAS0gDu4bCR2r5viws8gvvxuTpw7g5dzyuco1bcrDI4xw2zSBUZKW/aEtJziqVwBraLupOaszIQSS6TV8lnIsGRwqIgdEdmiVYObMQezq5UuTU2GeTKYS4BaS8TQi8WZU9rN/GneRaFbg+OJD1WM2OaYu5fqdCypTkbGtG157HWG0ujUAuyTt4H5eCfVoDCFQItEIFal1TTz30/sosV4AZ/66CSD0QsPsyqYukjH2JVod5fdjnvDRkzrreCs+4V0OmP0xRTVLZa20yzs6oAYKJ+hM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7976.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qSjoRYJA0A4ZWFTmzH1FCAwXJWZS38x5RLtn49Vpu7HfcgRMPWGsudNkVdWV?=
 =?us-ascii?Q?CXmD4XoKWvYrBEvO3U+j6iD+x9fvJAVLtfX7RWE4G/xeE9hFA2tdeKLA0xvJ?=
 =?us-ascii?Q?X/NxGqobHrri5gR8g8EBunurYZUSNutATL2jOKf2R4J7Fg6INIYU+QGI8Vud?=
 =?us-ascii?Q?TscQv85bo+w6z+PqW9jT/PlHFZHITRXuVol2PmSfyQ6qFm2ilfJmb0a4F9By?=
 =?us-ascii?Q?ge0ba/br3tffwqbvKxJJPBl+yjwZzSbjli71wOclS3DIzGGn/T4aREKjoMka?=
 =?us-ascii?Q?NBl7GLu8MpNgbxH61hmg4O7f+UNA7+rAiHKLbDzwtlzg/tG7jKKmY71H6wfo?=
 =?us-ascii?Q?ePzegq4OKxCxRLx49evQoBu4zybrWMaRsUnl1ZG9KP2SybZ9CoxSTmRVNWJ/?=
 =?us-ascii?Q?0rW0QYNBBGC9GHmQO1EH+rgRhh6l+u3PZNsD+4m5NZiS0z5cOJRQof71JD3o?=
 =?us-ascii?Q?D8xoAo3accZoe85avowhXZV7Us1CEoJB29ZAwhB16cvRT57qvoAWuMAcrUlb?=
 =?us-ascii?Q?4iVSsau3lWPWv5vGU3z9EVCfn7X0Lt8u+TRkHL/vy6J2v3Cf6Fi3rXIsaj1u?=
 =?us-ascii?Q?Szqs424vH9OzZWhhRkF0jF5ss1T9JRp0/H0GKOSMIBNZqgUlCzij1kbKueRD?=
 =?us-ascii?Q?0HWgVQ500CDhND9Fc316tsUQdR9ee0YY5vpBo6fBtlPzyskN7wip44Ek9sii?=
 =?us-ascii?Q?w8DBltZGfs7epzup/tEx/R3UbMrcdb74SVCUEr5HCKBQhYTrrgdgGTZjlLHV?=
 =?us-ascii?Q?WAKUPovgAbzfYF8zwqQDfCQoH4tU4y6uK03V6t58aZUJjCyy9TIE8PNnRoBT?=
 =?us-ascii?Q?1ht2WjEpHC17r2zrWgag+AY5SOpxq3xvU866RA3MY5asaZc3SB8RXa6A/WrU?=
 =?us-ascii?Q?6IOUVhlw1TMnGolomfgb9DttUblJQn7ey9UnNNUIOQVviroWusyquqqT4Uxq?=
 =?us-ascii?Q?znlOQVhkUHQ5b2BSV9kN6+lsdhECJ+50A0baFW6uMRoPZAdtr9JeEYoOgJF8?=
 =?us-ascii?Q?CCqWuTNnroJgqCShKxD6GwfB4sXGj+HdPZi32Hc1p3io1TUAhQyuei+irrgd?=
 =?us-ascii?Q?Rh0OLGA10xpYKAFwXggka8EMvSMHmIjvcFqYu/RGB8e0A6rz9WP1WfVP5/3p?=
 =?us-ascii?Q?A4AzuRVegN8QuZSszRvcU6d+/nm78lbGpL968p/Usr7AeCQVtalrzOFJXfSV?=
 =?us-ascii?Q?hpScA97+OFYR8HxeOP568WDqe9Ebd3pW4Mf5JnwzB/K+8rYFbdstGD2KpTna?=
 =?us-ascii?Q?jzuCCAjjdZgOpMvKR6p5Abz9CdrpfgEi8KqFS/SowvrdDPf27pkxAxWOtfbX?=
 =?us-ascii?Q?TM0govnxl+XK+5IHMoK7L63IRxhjTZ4rlgO36Y5hunhnq/ryP/MjyMD4l6ov?=
 =?us-ascii?Q?Hi3bKrxYobITQj5lcziQHnbGSjB17N/9eqEl2W5tzO+i+iL8dc8dxtIsyekG?=
 =?us-ascii?Q?ZAE42EBMxyjzI+A3sQtMfd6Bqg1qP1oOOsitgEqZraQjOhXE7T4rQpP8a4uK?=
 =?us-ascii?Q?pp8yw33x/hoaAXbvl4FvhARvBbOn51S43PbMt7Vwsk7+5NgfRW9zmPA8N/ou?=
 =?us-ascii?Q?/Xz1eokokNiLuGNIf2SkwT654AOgQp5/WF0xYC9oEb6LoRzmwN8e7oIQbO6b?=
 =?us-ascii?Q?hCp4gHFYhUvk64vIYtKrWGGE1DV+OKwqSUhEgSk53P1GZ/rLTOmKVYOoyUeV?=
 =?us-ascii?Q?LAB8IgqsDENu0XY54O38OXcJlsl30PKWImYUQwc4N9SZl973qwLn+4xWQCTT?=
 =?us-ascii?Q?XNLINx1Yy1TrRvMQFvUscnWjoKjrZJ78YHzz34EeJZy43cVglE7a?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62029feb-af52-427f-30b0-08de79b67c5c
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7976.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 06:23:01.1578
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gk1tJFR+4E10lBihfQ2dqrZJAaTkMgkKY+IDMXe5/3BPtaFGAUq8Teu5AgFDZuCdgunuO9OSMCrvS/DrBf+k4j3HasUCI2CuBu+jzFPogEtP4OG3V3XjU2H0FLy44zaO
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
 sound/soc/codecs/cros_ec_codec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cros_ec_codec.c b/sound/soc/codecs/cros_ec_codec.c
index f78a85b89d955..7dc5a7c3ca96d 100644
--- a/sound/soc/codecs/cros_ec_codec.c
+++ b/sound/soc/codecs/cros_ec_codec.c
@@ -948,7 +948,7 @@ static const struct snd_soc_component_driver wov_component_driver = {
 	.hw_params	= wov_pcm_hw_params,
 	.hw_free	= wov_pcm_hw_free,
 	.pointer	= wov_pcm_pointer,
-	.pcm_construct	= wov_pcm_new,
+	.pcm_new	= wov_pcm_new,
 };
 
 static int cros_ec_codec_platform_probe(struct platform_device *pdev)
-- 
2.43.0

