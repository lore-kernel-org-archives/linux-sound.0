Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011002.outbound.protection.outlook.com [40.107.74.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B8D1B0437
	for <linux-sound@vger.kernel.org>; Mon,  8 Sep 2025 02:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757297341; cv=fail; b=jkIz01Wne66YGwPIUuQVIyCyXgzxMZC3J+L1eOiP+/h8KhYlSSpsFDWDxTJO3Mqj4Rvo1SOmMILB2uMWKPn1n4DdyJraS1wWmomfS3RhpanpvTaIvAYfMq3yQlQTJZWv5plBS1FttV8Yq4/w2EtwepcrX6MD5FHZz3L29565X/w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757297341; c=relaxed/simple;
	bh=S8oERaHD8XBLs1E9P5oKaxstVUbKMeNNbRhoaHppOhY=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=YxSWnWCXgpuPSdbl4jjfCPBrjMMPxW1RWYsvcf3AXX/6ZlUId8/ycfsgrfmQhwXY7nf5QzGnwCEcOAVA73b94JR+yUdxMeJ23hiEF5bF1Z+8U1jmd7EN0/f0RE7iWn4SFDIhsgmIAKqRapVnEQh5JFFUKZJ0jJpJebAI6NWbaQA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Z6dBi/t1; arc=fail smtp.client-ip=40.107.74.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Z6dBi/t1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jO7fSJ7nc42nneBguX0NUnsvieGv1Ph+MPAl9srs/+AyyFUILnMWZIieaUsYi+AvtBfDfppre36bOVsrpzMg26q9mIc4T3CwYGAYrav4ivb2CdAlbplxox11IbVKcAdK4Kt8BWFXuHKmnhiBRTDnCFvyHcLL9uX7XGPaine7WuVcJyQBxcfLSDrnck17xmxIK5cZNzHqfMxoW4BAX6NapSEJHcqYemA9Ez26urJ4THaYxvFm6FByCHWDh8vFwfoGNoYirDMaE+LvIdLDpinZJCAZqBGMOuYhqA+jXQVf4l8gKa825K+jBn4MqvZ3IJF87HVSOmRr/DXV8BZnMpF9hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n7iP5ewSJmoMwEZtLOM+uTtKPScvBSJWofQqFX8Ot3A=;
 b=ssifYP+BH5ya/uG1HpCVyaRl1yElVuqU9sCaX4fcCRODZfbI1XkqsepxuVEFJSDhcjhr8a6QmTYqcdfLrPg9F4gsDBD0UT2LKbKd1LjMy5UPiBJRCv7ulhN4QONvkNSIZsRYj5WLsVuDDvZOx+GX8//pDZpixeBE06ioeOIbbU59bEW3Ev3/h1yyOmG4hT2HSHg4V1fALQGwBYyc1OrQLDMSWkIirn7td0ZxgYufjGJJe5zV0a//Bh/Y2gnTYfwtoodgwwENGO9WS6RZ6kdUb2oXwceiCVWBGa4RmlItYfPIbl4AXGshqUzeYRd1MmunKwpl76vARtz7Hgxtn+FyiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n7iP5ewSJmoMwEZtLOM+uTtKPScvBSJWofQqFX8Ot3A=;
 b=Z6dBi/t1ECZ1yrH56e6yvrZ9K6lFkjeWs2kiVLK50O5TcWp4HFND4qoraHwxUuOwQaqQtdwa0K65EWdF5wgui+s8r1flGgwxSir9iZXG91/LX+WpZC2VDcHFMin1b6UnojUpsDwsSfNxsCQlPh7FVmRQvxrRefOTt+LslZ7E0lg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB9666.jpnprd01.prod.outlook.com
 (2603:1096:400:228::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.19; Mon, 8 Sep
 2025 02:08:57 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.9094.018; Mon, 8 Sep 2025
 02:08:57 +0000
Message-ID: <87jz291yrr.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 1/4] ASoC: renesas: msiof: Use guard() for spin locks
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87ldmp1ys6.wl-kuninori.morimoto.gx@renesas.com>
References: <87ldmp1ys6.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 8 Sep 2025 02:08:57 +0000
X-ClientProxiedBy: TYCP286CA0026.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:263::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB9666:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f1d61e4-aa9a-4d0f-5b88-08ddee7cab4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?l8zAMTjYCaUDfmAQxuI1Qwsvj0DgQpu68SKDuiNwc6s5uD0Hd6bNt2Lf1Zow?=
 =?us-ascii?Q?yZCwt5ZwH2jst1SLyWQrkVOWE4kNAc4+NkoCk4Wt0HuUmslnAV35wqXmIlRI?=
 =?us-ascii?Q?LRKTyhwUgYVG/tD2yF8ekhbLOiBbRljdNb2LCuwPp0q1UChgj+aKELK7Ntf/?=
 =?us-ascii?Q?GVKLr/kfVOpxYAwe1GsLjNy+Ap8miqBRp+cjQ5jqzykLKEaEsIK5xJ1jEyXT?=
 =?us-ascii?Q?wPhzd+pI+qzJiQxPDfzQ6i/zX1ynAjVsZEbyEkvbMZM6HRK7taknZY+EAHKf?=
 =?us-ascii?Q?LTBHipkadl3Ipd47jZFahgaRPptJfQrf4BNwp0nCBydUah6QgoiEoEaGXn1S?=
 =?us-ascii?Q?0h44GBZ8nNmVMQIipZVuw+86KLIMUEDi0YVhVoFO4saoERc/fgIQVZtbvAdP?=
 =?us-ascii?Q?nY80+Us4MSFiLNBguIif6G0h0nihOB9VDJVZe7ulJINxU4M4ByBNurFnVKKa?=
 =?us-ascii?Q?M5mAxsqQlwJtCIfc8rE6V+acF8KJl8dsrN1DFyUKvtnW9xLs/h+8eJsgAECJ?=
 =?us-ascii?Q?59FvARbTsIrQ4dPzwLpfQt4lynG51UmP3cm5RKP4dAPgD2r3tU1y3hrDh8Qx?=
 =?us-ascii?Q?4kq1kYOyU/8MY+kuyA4nSb0P9tisHEyycwmNuV6TQ06CgBnvYE9mhwgHfAwv?=
 =?us-ascii?Q?cV7Vq58+7ThPfJ9dYUzpZOxVaDrDm30qhixYKs6to7BHFffrlPCQWH7jDEg1?=
 =?us-ascii?Q?jQPATBwfc9qN9Vonjb2mcSF5Yygqg1/bHp2DyuBtpVEUf12BifHjGSRye3fk?=
 =?us-ascii?Q?9m6mRYCpn+ef6ghRErisQbpAbOPG6NYks+CbWL5PHK7gcYV9gGSXbEoa7L9D?=
 =?us-ascii?Q?4kc+JjLU073dkkdgPt4to3AB5OpCBoYIGpYWBZukvCVSTs33rtpx7Enc8U7v?=
 =?us-ascii?Q?gzqH5+s4CDQk1z/lLaXmXpMhgfrR4BBJUIS8YUeIwtbyG1gAGuUOdN8VocEa?=
 =?us-ascii?Q?y16ufvg49aWjMEen85n0t6IK87FusO5hEk12ggckTULK6A/9uxfYLujCPN5W?=
 =?us-ascii?Q?fLYcJ1P64rB5vXbLxbBHfRAArONo0dnqf4EHD3HxK4W1Zp/ETX4VuAiLzXAx?=
 =?us-ascii?Q?b3ZL32LZk4ulQ0108aGG4KkMoX0/8l1TZ1N/XfFA0zDveagL3ypkcqqLqtSp?=
 =?us-ascii?Q?m8elJunpv3zO/sqxnVyc8Yz+EFIjjT9VwFGNYJLF1Y4LPOdLO2yupkCWtfit?=
 =?us-ascii?Q?qx9mrD2ODyRWpOGScvGYICNlhPPsRWCccuKeAlde29JLZM5S6tBxNJ/SSjBm?=
 =?us-ascii?Q?6o7+1DucS8UDVobEJLk7Kj35WQWx5NO5+1YGrONoZk5+sem3zym8adXFWc39?=
 =?us-ascii?Q?06DKqpVWFcent+L9qAml6a2u3bobtsxGq6UnU5wjRSw8TsWQ88slzWBgpEGr?=
 =?us-ascii?Q?KhBwzgIahvWz/DuHHINR8Ib98kD5QigYbl7lVPw4eCsYCB47idwOIEXkha3h?=
 =?us-ascii?Q?35uq+eaVBD2qAht0yBH0UjqqvIurmtDuqQU/c4BZIGoyWR+R4EcZkQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?H1OZFOHhV1Onq+mu1WwrgyYenG7OWBk2XsMP/c9t5TfNs3Nd0KTn9toUAtcy?=
 =?us-ascii?Q?o++tT9eLap8NVYE+RiNXCPClFb4bXKLQ0GxVjecvuMJzcKNjMVtKqNB0rMVq?=
 =?us-ascii?Q?yNK9nJsbFypMyyr1Fhh/zpC5NQjB4oBRQKwdWG3F+Xr8wJdoIz7elkwPUPan?=
 =?us-ascii?Q?M0hNc+4RbcZPPv50N6r/ufoD+gWE0lrjN+BFEN3DVpJawWGYlwpI6RDA2nvd?=
 =?us-ascii?Q?lV0FZxpic+Bhr42Ws8XvZO27LIwYGbMeeqPirI8uZZOPdS3KKIQORAD0TdFU?=
 =?us-ascii?Q?9nl9FKF5vry5C9atTiRPBILAJqQJDX66dMlHAvsUR6Rv3FRaf7Y183G7PoZX?=
 =?us-ascii?Q?avCNQ5RaZvDa+kRgjwkQKjJ9Uzdh2WUOumCcCzukWtwQ6pBfJxKfiHA8wDIP?=
 =?us-ascii?Q?1LKHvEjaHPbovJ9inibUSRR3bpjHAWPHJR8xjleWHtL2eK5ldGBHnxezGLm8?=
 =?us-ascii?Q?EhJoOqW+sutXqk4/7WqX3cOG7nvNSYto1HkX8IIW3B9SDpIwel7SKqRtTLpZ?=
 =?us-ascii?Q?jiuU0h+GLwiD3pWFLLJY+2ZyGVwyA8+06v3n6ZnAh63rybbDJUR+lu7zwxiY?=
 =?us-ascii?Q?/Y90kNahkXw+6SHj+K75FLClmqX40yHhe6JRocbXMOuVUf37Q/SwgB86sBGY?=
 =?us-ascii?Q?EO52bhavvFNYgjdrByA+x52aPkrYwhOajB4KP7PNg8hWTpOVsbXk52BoFa+z?=
 =?us-ascii?Q?SdxlyETqjaK2ZkDiyZx2LRNiUsNLxKCpcbOZX+AIu6ZqCzcTjXmfIyo1yqPo?=
 =?us-ascii?Q?V/RLj7RU6KMNfhpDPSbOMYWjsVYgx2hnC4193JTxC9OgERs+IgnKShtv6Yas?=
 =?us-ascii?Q?u0j3wAgma6mtScz5hzm8B8rrIr/a/kAsT8s3r4t/Wh6VhUxj+HBALQlbEBUz?=
 =?us-ascii?Q?j6WWnyJ+yBuc+kGMqPPgILUnGM9vaEuGsGfWwZmIp+H0PTDlkenkHibuT5kx?=
 =?us-ascii?Q?Wi2ZKTJvjSvuGj7fXi+DNYOkUogEVvf5E4FbDNyy4ziQw3MORuZLUOKJShU4?=
 =?us-ascii?Q?IFC/WzpDKLbRNiWxbNhH0yWAe21F+3Mvc+r6AzFi0fID82Q6knrmq5zlu5A2?=
 =?us-ascii?Q?hAHWGMT5rqmRM9XBokW4NQLEdbIjuUWZLAr2adwSKF2CrWNZ+lbiIhAlce3Q?=
 =?us-ascii?Q?flGiTUTBIy3aazGuIccaLb6BYFED6fY47CNHRc6Kun73sHsAC/powLbikyUe?=
 =?us-ascii?Q?4DdKxXbsz8JCT6aAjNrsBmod8pW2cItssOP2US/NzsZ7n41ORgGrECEu/w7A?=
 =?us-ascii?Q?Vm0jTS7AwnXsGjT/VUwKy9FdtbC+il404ab72ucY0PIYYjgvP3pjTE2G2FX6?=
 =?us-ascii?Q?dSNLDWtMjYWDDbeO4tVNbVsIaT/FVEq6nwXTradNkAvObVj4P+mYqIhI0i3u?=
 =?us-ascii?Q?9aq/FIuVss2GtEsUQbXmxPUfYSw58M3sw5kl4j5famwqfmq9zoRtloLzKU+j?=
 =?us-ascii?Q?BOK+wEDGBcYCETnB96rzAcatp9KK2mxgHGxD0cSjRSIC8gwIsw5I+BE6n3P6?=
 =?us-ascii?Q?B5Evy9737O4ahlkEmSv3PH8gPvPZ6pA+MknqoHAOHJw8Vn0ZvUwzOIxQWngj?=
 =?us-ascii?Q?QjWFEle3iie1Cp/VURd+GGLL8pTs5ILKAIid9Iv81uu7WmWIOj1f8eZuJ4K2?=
 =?us-ascii?Q?EhQ7/FTRzh2TuoeO3WHb84o=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f1d61e4-aa9a-4d0f-5b88-08ddee7cab4d
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2025 02:08:57.5361
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fXwvM7PKRLVjfdh/hBg8bMmvyp0O5d4gPhMl4rUh8AZPlFby+y6xQaX0vfx1B30sv5bYWv7QeGasu8Hhoz7Jv/QxpEcB7zfKlg6Rl0veTPJPSPYGcqoWty72CDp/7+bP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB9666

Clean up the code using guard() for spin locks.
Merely code refactoring, and no behavior change.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/renesas/rcar/msiof.c | 26 ++++++++------------------
 1 file changed, 8 insertions(+), 18 deletions(-)

diff --git a/sound/soc/renesas/rcar/msiof.c b/sound/soc/renesas/rcar/msiof.c
index 77e1dadec14d..f5338bbb037c 100644
--- a/sound/soc/renesas/rcar/msiof.c
+++ b/sound/soc/renesas/rcar/msiof.c
@@ -372,10 +372,9 @@ static int msiof_trigger(struct snd_soc_component *component,
 {
 	struct device *dev = component->dev;
 	struct msiof_priv *priv = dev_get_drvdata(dev);
-	unsigned long flags;
 	int ret = -EINVAL;
 
-	spin_lock_irqsave(&priv->lock, flags);
+	guard(spinlock_irqsave)(&priv->lock);
 
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
@@ -392,8 +391,6 @@ static int msiof_trigger(struct snd_soc_component *component,
 		break;
 	}
 
-	spin_unlock_irqrestore(&priv->lock, flags);
-
 	return ret;
 }
 
@@ -404,23 +401,18 @@ static int msiof_hw_params(struct snd_soc_component *component,
 	struct msiof_priv *priv = dev_get_drvdata(component->dev);
 	struct dma_chan *chan = snd_dmaengine_pcm_get_chan(substream);
 	struct dma_slave_config cfg = {};
-	unsigned long flags;
 	int ret;
 
-	spin_lock_irqsave(&priv->lock, flags);
+	guard(spinlock_irqsave)(&priv->lock);
 
 	ret = snd_hwparams_to_dma_slave_config(substream, params, &cfg);
 	if (ret < 0)
-		goto hw_params_out;
+		return ret;
 
 	cfg.dst_addr = priv->phy_addr + SITFDR;
 	cfg.src_addr = priv->phy_addr + SIRFDR;
 
-	ret = dmaengine_slave_config(chan, &cfg);
-hw_params_out:
-	spin_unlock_irqrestore(&priv->lock, flags);
-
-	return ret;
+	return dmaengine_slave_config(chan, &cfg);
 }
 
 static const struct snd_soc_component_driver msiof_component_driver = {
@@ -439,12 +431,10 @@ static irqreturn_t msiof_interrupt(int irq, void *data)
 	struct snd_pcm_substream *substream;
 	u32 sistr;
 
-	spin_lock(&priv->lock);
-
-	sistr = msiof_read(priv, SISTR);
-	msiof_write(priv, SISTR, SISTR_ERR_TX | SISTR_ERR_RX);
-
-	spin_unlock(&priv->lock);
+	scoped_guard(spinlock, &priv->lock) {
+		sistr = msiof_read(priv, SISTR);
+		msiof_write(priv, SISTR, SISTR_ERR_TX | SISTR_ERR_RX);
+	}
 
 	/* overflow/underflow error */
 	substream = priv->substream[SNDRV_PCM_STREAM_PLAYBACK];
-- 
2.43.0

