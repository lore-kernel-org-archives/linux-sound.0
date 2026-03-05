Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B461420C477
	for <linux-sound@vger.kernel.org>; Thu,  5 Mar 2026 13:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772716520; cv=fail; b=BKYxbIilxtYQ5toKiNA5Ra+99T+bWq3Q5U5DWDFYjbGWMgOI1ZNLQteLoaK+Zy5RuB1aW//hf2AdXNW4oa3OKWuWY3YvVRmNS7Sik3v7vWwtu4prMMrMRpPK7+GdMLTFiPRNdYV4UcNEkwS/q3b6v5ue7k2JvDQRUKSV+U5Nj+k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772716520; c=relaxed/simple;
	bh=oO98EaoDqiPpJAnFMZ1+BUF3QQ2McNWMQFIuM7RMySo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tjhlXz/RIvxhW3JoMfR+JYUJEpx7N7UoH1QJk7ANSBrvZteppPaIVbF6wuxaoqg3H9g2N/UCapKItdos2asPQSSvLgadhix1ZFqLupbUv+6hCASp72gGYgZWWcqsogVKQnkZ+JPLOcgbuER42rPwX6B2duOvtbGuYuktYLeI1LE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=NR/CXLuW; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=z3SXNv7W; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="NR/CXLuW";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="z3SXNv7W"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6255lDgG1130677;
	Thu, 5 Mar 2026 07:14:37 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=xGACp/DnJmVrgopqOM
	4tAYprFQyti3+9WRAwn6TNY7s=; b=NR/CXLuWqgUjU6j1oaHdqn/AftRN6k3eUw
	s9ldXtDUGfLKkWxtACt7v6oO3s+tgroF1rLkhSJ8/yErYtD9J/Q0RgS2FzT9qsVI
	kVz47iBzbtTmnoqcBua/UVtoDr7VnJJaUp8YLFUxhgWx4oiYvIYoGKV1Gqdhd6f1
	eDNRs5LyzUI/qMiH9WDcao8Fo2hhKa7UhJpSl/j0Bt/0BtK0rARYZx1YFNs3oLFD
	Nh3V++QWQT+xykftXAouyjEpknE0GZdR9kKutBo9FzxPM8VJQz9+kLTA4kXL29fZ
	sUWWuhMlAE0pYQ6q61+fAI1lzONkp6fojZxQph4Yf9qejgp+jYRQ==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11020078.outbound.protection.outlook.com [52.101.46.78])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4ckwnn6516-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 05 Mar 2026 07:14:37 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wyDHmUdAwt78nQKpgaZzl7W0FgnH04exD5jSQQH9ZWTiPE6ttntuPUoxXw7P0nI/XFgEzSorzXjJLfvkW1ICLBGVozt7860NqtBM38WNZH7a9KtTBioiDMEBbEKaL+gtxRNin2biqnDVJwdyNRFslSEcgbngwZLfw5ohOm4igjkZmY+2nuKT78lc7ki6IGxRZEUC8B+ZD4OxQQ0+LiLMx6Kd/bETCObKoBDIg8a2HfC9m0mjpHHGkujPT6JFYyqrlpdW/ps8telKoH61a8pCS3rXRNthUy2G9MXmUE5gK2cxzg4vMX8yF4X8tqIko0UqZz+VpEA2LDgOa7nA9n/mhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xGACp/DnJmVrgopqOM4tAYprFQyti3+9WRAwn6TNY7s=;
 b=kzZBg+GBLwXE6FhXb2URHGDh2FWWaUCMITEprpl/pEfrCGBE762Kl7+9v+QORYXN4c6BB8qOGm4/oR0bc4JcjTTNMIdjg1uZqITLQious+ABO0pujdaiLF95VioC7dnS7Aya7Nwe3Fmx6pElLl47PJV5bSmfT4OB02TByp5IyUm0GPBpKSrJGI6xWkwUHac0sRSYhjDUISuEfm86Jc2QwLrsvnBlJSIdHKUDB/ZXm91Wa7rLpDBxxBS/9XJGRNsmROvVxP1giuAqeN6vj3Zyy0jb/0W4vxWAYXLuF9DBiYleS+v3M1AZTddIRLA5N8bMKC94CpM0RW022kwb1aiFwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=gmail.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xGACp/DnJmVrgopqOM4tAYprFQyti3+9WRAwn6TNY7s=;
 b=z3SXNv7W6jY50Xaix2Gw/OY1UqwOr+89rMB26LGkxBu7y9JveZJ/vhagKj/yfxsj9v7vRslM8VG31ExEI+J9R+sQu0Ofh+V2RcRoGGCE7QFquKEW02k0txjCSe+mFW5M83Kqh2fatTDRPg7EuQl8wovgb0skpgVUwMnY4h6WYTs=
Received: from CH5P223CA0002.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:1f3::10)
 by SA6PR19MB8782.namprd19.prod.outlook.com (2603:10b6:806:438::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 13:14:33 +0000
Received: from CH1PEPF0000A34A.namprd04.prod.outlook.com
 (2603:10b6:610:1f3:cafe::3a) by CH5P223CA0002.outlook.office365.com
 (2603:10b6:610:1f3::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.23 via Frontend Transport; Thu,
 5 Mar 2026 13:14:26 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH1PEPF0000A34A.mail.protection.outlook.com (10.167.244.5) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.18
 via Frontend Transport; Thu, 5 Mar 2026 13:14:31 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 8F5D8406540;
	Thu,  5 Mar 2026 13:14:30 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 7063F82024B;
	Thu,  5 Mar 2026 13:14:30 +0000 (UTC)
Date: Thu, 5 Mar 2026 13:14:29 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
        Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Mark Brown <broonie@kernel.org>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
Subject: Re: [PATCH] ASoC: soc-dai: don't use dev_{set/get}_drvdata() on DAI
Message-ID: <aamBtfjzkM7onEfp@opensource.cirrus.com>
References: <87bjh33uoz.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87bjh33uoz.wl-kuninori.morimoto.gx@renesas.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34A:EE_|SA6PR19MB8782:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e014e56-a0d7-4346-e162-08de7ab923d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700016|61400799027|54012099003;
X-Microsoft-Antispam-Message-Info:
	4lcRLuJH8bIdiHGiRlC23irYlPN2OUYSO3UllOniIE4KQ/LDIvLevvC8M+jmtUrXXRSFkCACjykJ2jYJO34w15nMPLlSK5YIRZLmOqaJuzs5MoBv8hTqkkPRvaPDBfS6nF17beuQLq2lsWvE64PhZtamoCgq2u2dAJy6gUNsBFr2NQ9epCxaaxtdFnHDSvKRKu30LpCwuNW/1IGB0MY8wyKeHFsB49s2nX8DsSxNH13mRLu0wuJZK1F8VUx9d7fwcd4KkWYkRupXqJa+lVvRPZ4h75sZYTZLvQ+/+OSanv23U6trTlEER0NwlX/d49a6TANB0dYbKiG7K6LnKhhrWXckTtSOcqsjBAg1X9+UKsYc//uJt/DhbUn3EYZHX+BmY5KHfYXYWbt23hUYtEPjWvHWEQeWy/ovpFnuMbx8lXN1W8wEtrCn7jND43/0lvchw+1hhLA9egnRpZagub1WxtWfrf7VOp58h+EoZO8Yt594Vb2fZf8MBZVYAgkeBUTU55F2H50xm0RutvBkxnGD2FQ2y8e/oSl2OqItK82CE7Kcpj0flofVmb6kF/dzAwpt+4T38tW5571qYu3xaK4vvkKv8XFWJRG5njgSbTNwtaiPKEUea5aIiwO78amyfetKlQHDQnZfiOvmY4zui3HXPbm+UOyVGvkcc8QgW3cbHtCuCXOx81XjHi/HELjskyYZjrNqtqj3lldejQyfKgmMDi5Qnh2Xeipo7BZa0Z/k07p0QSCzMx5GX74/b3fcVoc/8L5PjQxNkH4X/aikOF4QTA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(61400799027)(54012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	U+mzrakHIyzfkWmYyT6g5NN6O5D7Ra5tEBlDtZy3idSM26257Lx94qqhbFXP15zXiOwLfrDrsndHdaDS90PjtSnyh/+Nl+waHdE5nrUFUCyqZoU0kxdmrpFSuAeNv3uaKA6jRpjXlxd+aF/U3BcrREl9MnTeF6SFsrvxaohPQsY7S96r80zdDQQL1oEVerhLVpzxg/YsJNug9sqWyPslMM1buPKnO1/PkKee7KrzmSG3a43ixZiOCBCYF1xZD3mV+lAjfl7W0mLBJuuLa3Xw9Sm75MMn4BXsr8BembuXaaR3vjBWWGxGe3ryaNYW9Wge8faZa2eZMMDWTn6DjQmejtZqgFWasn+jX5SIREXGyhThPWdsykVYeuYIIQCSJCzYYFRSMKDnLPZKFWKsYe+h2uA3CaPo8vpnb517+sUyI3AewWtZK2lGBjWLK3cCkyPj
X-Exchange-RoutingPolicyChecked:
	sK79dS/3+9J2rIs8B4edqFQ+JYv7NywiUT42l6G7mNOWdDuyGU5uL4lYaswM/rvwgrAQ0HezrJ1bxljNVUB1o8tJNWM6MRy67lTkOsmDRsvNENaAqfEUvMavpcKE/tsrLAQe4Ab4lBvP9iRpWZGclxl9FU4BOR2LmdKsqzUvRSYYdpzykmKugJvG4jcs9ODJjFtl+Rv9jArN1KIS6xluNzLVsq2ETm97xOUocwCFY95nNA3GiHj8OoKNfGrAgNIUPeBdJFGz+eJBa30ddvlTuWggmLvRfRfKwZ+RB6pQR2R7kDIkYyCfULp2sul+UMX4E1zmYL0nnruTn6Vbm10wSw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 13:14:31.9370
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e014e56-a0d7-4346-e162-08de7ab923d1
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH1PEPF0000A34A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR19MB8782
X-Proofpoint-GUID: KJ_jePeLOzji8X0Xgi40Q8p0B9sgQ2cG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDEwNCBTYWx0ZWRfXwpnTgHgLAvop
 KfIUbX6VaJyWE6l1flXMInOV9pSuIK2cXi55N+zgeN9lIN/dqbD5hZR6apEx5tzsErgFUoB2GeF
 chljPo12br4xdntgiq4IYtZYuyqhy/fDDBa76x9nd9Vll5pM2JNjC8sXXmo7tywOxVyxLDCUMuM
 8D/IYkrMvbDMje44ZtcpaKfe12eBmAhxd0Hh+Cx0QAFO8q9m5g+/LeLFCH1yk3yX4dA7nguc5uO
 ArqF6DFqg2pPiWFphq1OEQDj7SkVFVPyfJJj/tay5kQvxG96fgV0JSyGpXzK3UQx1ftJnPbvqg5
 m8XOyyMI3f+wvvkumoQ8qBUKeA/GMr5lXed3ptlMogukIvbe1xvP4P/pESGaOPSjX/v6iEQHMbK
 DrEgR6cq2X3XYkDWn4xFxfkeSdIBpPpOdx4fo7fbNYPfWc4qIpEI5rt9JD1A+/GwJA3lCDA34kM
 nWTpxThu7Y8GKjpcKpw==
X-Authority-Analysis: v=2.4 cv=ZaIQ98VA c=1 sm=1 tr=0 ts=69a981bd cx=c_pps
 a=x8fXg9NzY3hbHNzXWQS9+Q==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=yC-0_ovQAAAA:8 a=65B8pePItA3lom7MplwA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: KJ_jePeLOzji8X0Xgi40Q8p0B9sgQ2cG
X-Proofpoint-Spam-Reason: safe

On Thu, Mar 05, 2026 at 01:56:44AM +0000, Kuninori Morimoto wrote:
> We have 2 type of driver data set functions.
> 
> (A)	snd_soc_component_set_drvdata()
> (B)	snd_soc_dai_set_drvdata()
> 
> Both are using dev_set_drvdata() with own dev
> 
> (A)	static inline void snd_soc_component_set_drvdata(...)
> 	{
> 		dev_set_drvdata(component->dev, data);
> 	}			^^^^^^^^^^^^^^
> 
> (B)	static inline void snd_soc_dai_set_drvdata(...)
> 	{
> 		dev_set_drvdata(dai->dev, data);
> 	}			^^^^^^^^
> 
> But, these are same dev.
> 
> 	struct snd_soc_dai *snd_soc_register_dai(...)
> 	{
> (A)		struct device *dev = component->dev;
> 		...
> (B)		dai->dev = dev;
> 		...
> 	}
> 
> This means, if (A) and (B) were called in the same time, private data
> will be overwritten.
> 
> But, in the same time, commit 5f86d41d0410 ("ASoC: soc-dai: Add private
> data to snd_soc_dai") added dai->priv for private data, and sdca_asoc.c
> is only user of it.
> 
> We can re-use this dai->priv for snd_soc_dai_set_drvdata() (B) instead,
> and avoid the issue.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---

Hm... the patch looks pretty reasonable to me but does seem to
cause issues on my system. I will try to find some time to
investigate further:

Mar 05 13:06:17.645064 ck-upx-mtl kernel: i915 0000:00:02.0: [drm] *ERROR* DC state mismatch (0x0 -> 0x2)
Mar 05 13:06:17.647247 ck-upx-mtl kernel: BUG: kernel NULL pointer dereference, address: 0000000000000000
Mar 05 13:06:17.647257 ck-upx-mtl kernel: #PF: supervisor read access in kernel mode
Mar 05 13:06:17.647265 ck-upx-mtl kernel: #PF: error_code(0x0000) - not-present page
Mar 05 13:06:17.647270 ck-upx-mtl kernel: PGD 0 P4D 0 
Mar 05 13:06:17.647276 ck-upx-mtl kernel: Oops: Oops: 0000 [#1] SMP NOPTI
Mar 05 13:06:17.647281 ck-upx-mtl kernel: CPU: 0 UID: 0 PID: 98 Comm: (udev-worker) Tainted: G            E 7.0.0-rc2-mykernel #1 PREEMPT(lazy) Mar 05 13:06:17.647286 ck-upx-mtl kernel: Tainted: [E]=UNSIGNED_MODULE
Mar 05 13:06:17.647291 ck-upx-mtl kernel: Hardware name: AAEON UPX-MTL01/UPX-MTL01, BIOS UXMTAM13 02/13/2025
Mar 05 13:06:17.647295 ck-upx-mtl kernel: RIP: 0010:intel_dmc_update_dc6_allowed_count+0x17/0xb0 [i915]

I wonder if maybe something is mixing these functions and
expecting them to set the same thing?

Thanks,
Charles
