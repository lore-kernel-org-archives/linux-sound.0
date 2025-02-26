Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010033.outbound.protection.outlook.com [52.101.228.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5827518FC8C
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533664; cv=fail; b=Onhv2Axs4a70JQK8KpHUw4YUEyYRjWBIy2/xUEKT5oOnCJzcQ/+yG3YM9t8yasHRVTx5hm9JXGF5pMoPOGvc2/661iu2BAkm0UMqulW2/I1fi9/108PIKPUhTY4XwbQNXRRfHe63IbN7AI/5FQFwsTbpMpxB1fYqCmv0NAjcqCY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533664; c=relaxed/simple;
	bh=CJLT7i8vr/nk6P/8MT+l/ryZ8G6hQ4M54j7WojbBSmI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=D2cbTQ9/+j9eXsLnfwmqfQT+yHmSFQO652o+jQ94FQiiy/h9yY8bPsASwi0qidE2EXrVQvPpNmOG0wwDKtD/u1NHyAJCnUQgIA0eHZTZxKHkZOdgwXzpkTxo9duaiQlaw+oQdBT87Tnq8E4VQzyoA7Gm8ogpvlyYyOkTtFoQy4E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=IH+5vFZ4; arc=fail smtp.client-ip=52.101.228.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="IH+5vFZ4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M6bVKORGI5o1+RjmURxO57yebxUtd5Avc1dM1QGw4OCWqqPQzgX+Xfso9/V3cx1GOBaS1kAy+HlZ2kusG/5Ztkuq+NlWde5xpr7xkknOaRaSPjGD/Yzut9mYiY7mTm8/kji58QhByqtVgQy9CuC7Ni3Nzb2YFpAFzM+UEZ1VRnO1gWqRYiWBC08wkMp7cH1xjdtg/sb1GAw5k44+3Xv/0EA7nDapmocIqqgUDzkXwEbZczVfCrz6jDOv/ooooOWy5Biuv5K4gaoMB4BFrQx0X3WBU31ULWMC5YTjuAzlsSIAcOxfRUY6dZm2zCOLpeHd50/FznpLiPOMrKdfHEISAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VjR8H+yOPZBwRyEzjyD1WrT7/BktIesG8X1b3R/wk50=;
 b=KkQrLDmpzULlab8YEzupEkz7ZGsQCTkQSU/sfTNQULIlPT6GHRjdHutvlrBvwbkIREzu/DgVkpWKVF9L3g5VkXz+CFnABoFZMJXL5CHjDBm+LXkb8qJWkdMJThn1xAGQntd05EfczkUdHUlkWSw0ffeo1XhgMKFMnL8UvZpPinRAR4VYNOeKIJWbtRUOJf9z2XDUI1yiIsJ234qks4P8rpOWfGwpYRX4wUZSx+/H1mfltGgz1MPCy0+egjEenFdhRvGfY9bTP4f/APwz+KADx4uvwrfK5HrCyL51Y2sM8dYXvZCEkPSkRcnntwCjIn77568T/N6uUhIRJwmGrZoFYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VjR8H+yOPZBwRyEzjyD1WrT7/BktIesG8X1b3R/wk50=;
 b=IH+5vFZ49ty16I1rQVBYdkJOXYtT7E9UY7u+rddStOZJ+pqgYjk30CZiOo0gDEN1FQHvtkNwRN5oO3qCz9z4UyrdxjLa9OgqNl0tYY0WOEESZStZMrsZuVjdxdcGgZn1wVfqqJKePM68UyeNFQkKQ0s1qtwNVx8oB4c7aiv7FJk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB10414.jpnprd01.prod.outlook.com
 (2603:1096:400:246::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Wed, 26 Feb
 2025 01:34:21 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:34:21 +0000
Message-ID: <87r03lcwv6.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 067/157] ASoC: codec: wm8350: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:34:21 +0000
X-ClientProxiedBy: TYCP286CA0219.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::15) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB10414:EE_
X-MS-Office365-Filtering-Correlation-Id: 1eb2c81a-fa67-4f2d-3be6-08dd5605b1b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LsGOOLrrWc/ivxfSPEBFvWK43NG9rKGczE+lylzti8k1y/+oqwvVETRZJudF?=
 =?us-ascii?Q?iaQplk3ZWN+S6AQMJB2hHQ6qJ7iTIyIJTPI8UdgO9nj6zyn9Ofjl6VCjV8c2?=
 =?us-ascii?Q?CGIAe0kC4YTkxUqGX44Ig68UEgPaQzp6Pv0kQX/5lpvEacp0ZKlx/qVAd76b?=
 =?us-ascii?Q?OVxY1IK3YoUj+AxluqhNb82aik1ywfA6I+ovvMt2JWE2iH2eZKUSEOiZq3z2?=
 =?us-ascii?Q?QYhF7UxaWUuxaGU0bOLUgKHt7M83aiKirCjBWVZvOol2557jgEOVAFuuMgM4?=
 =?us-ascii?Q?sWKtR28IugDIIsGEm1Un8xu8LDMWGHPr1sp3zTTXGzGm4ZhsCdL7P9KUYRxd?=
 =?us-ascii?Q?I9rSu+4ZUYiW0Y9nnEQohU6mlvAzwQ9vGVK7178lhT4ZUtGwo11gSCfK1TSy?=
 =?us-ascii?Q?hS1713Z6l4GfHrTHPAn6o6iRFbMWIJQzsrtZk/h7AvzYPC+PUU8++glmDH0X?=
 =?us-ascii?Q?aRBz+E+g+Gwbco4HcptBG1j4pFdlfOmFap7jbSlltzmi4rgV9jKIKWBCdpeZ?=
 =?us-ascii?Q?zunSB3F9dPZGdTmknO5TgT7tXMxcf1IdoFIB8sExcqAIP0O9Y7ecXFVhk9Qm?=
 =?us-ascii?Q?UdAmfTuwr5U1hnKYyp4Jsk9srVoEak+c8T6P+3ktXbyChsSOrVfgv6dFF03a?=
 =?us-ascii?Q?F6qR1Egb+lAv2qeOkTrox+SXSxbY0Fm2HBJkFXGuqFGPpisDW2Iy0gXPhP/+?=
 =?us-ascii?Q?WgA+wGT1bdl/PaKOE3osnsKlj3tFVFlyp7r3L51PsIRYwh990cKRWq2XFZK5?=
 =?us-ascii?Q?Hg2MBjWa9hpMP07dDDMsbrsQp8CxEpe8QTn0a8QnkPY0oyhH+Z/vBeinEAZ8?=
 =?us-ascii?Q?hDOrbXORI4g8QfM+29vC8aMiQNaeA8eUrTsXqkB9kqbiVnrXEIJAexRIR0dO?=
 =?us-ascii?Q?UZgx7cSXvNtDBkwzIiixCFkxaRX0bZfLi+rjU+g53A3bpK3dqqAfzqUx+8ph?=
 =?us-ascii?Q?uSGSnheBdXV3gZn5A/DieW4YJSkttkzWIIxL+Of23lXEwfvLlP6nHMHrE6h6?=
 =?us-ascii?Q?9MBa6I0F6DmJvZ15Y2ztI9p/RwCcNFKPErMfZNVVt+43m3T2zf/kybQmcHAL?=
 =?us-ascii?Q?ByKDHNRoUUGyHvVY0bXNLNYduH1IFlUtFhhE8I1gafLFdC/rUAJZyjebZ6H2?=
 =?us-ascii?Q?CuTCnctCRI+fT2HoNiEKnj8oDHV/5Jof2FGtvS8yRPhCms7oxAk3DNtx9PIf?=
 =?us-ascii?Q?LV07nttKXpbX4wwoKb8JCW2t+t3V85yKSEcM+SgXw+GrzFYQhuhUrfV5a3xm?=
 =?us-ascii?Q?SOAfMzHnP4E+BOoTTUpw95DOKE/ETh7v0BizouzYGsX2XFd6NDcAaPj9U/wv?=
 =?us-ascii?Q?0nsaluBIDfHJ37UwU6/h78R5SXAoGNWs3AoChsLDznqIaZL6+2yzEfX20fyW?=
 =?us-ascii?Q?TKbkLpoRTGJvq23UNXkbCPNTVWnYE6nVWIs/VGYlmknD7ka+r/Y2NwfUVZS6?=
 =?us-ascii?Q?j+6RqqXuaUF5SsIabRCXSov2FfAL8MXX?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?67Raf2oqp6HTIDSYoM1t488KRgK7VS4c4Alo6I1kY4sg9C17ipJiFPjwwK8J?=
 =?us-ascii?Q?H0eFAc9lefZIQfAAGlpiTPxJniTt7zGuuhWj5i5bhabQzbNY5Huz0sKsTdDh?=
 =?us-ascii?Q?YfaMYyGmwqwXIFURXlZvebubCrCwMYRXiZyrqvhQwtC2vSv3z2lx5Kl8oIDm?=
 =?us-ascii?Q?IBwCwG3emdoF3Nmc8MGPANoAFIC9pZpCH/HZbeowbZgd7gMKQj1/LMaDmlZx?=
 =?us-ascii?Q?L8d8dXCjls0FsNBuZBUqVqn+yw/MC7y2N4JKpBT6VQmCRX466H2crUHqlgAw?=
 =?us-ascii?Q?1HELSjZidcFUit5NxT1u2Y39OlnrTa3c6mf6E4Eu67Zg9Qe3TFVtPDnPLmGV?=
 =?us-ascii?Q?U11xXlV2zWbKeMGDdtMF4dyxRG5KqW46pUCcAL9f0XLzlx0jrq929MVMl66+?=
 =?us-ascii?Q?cGxZ300G9oTSDcVhXgM0d2FnT21wiTzQduTBa9yyeZMO3LZRPHQhE596VHIb?=
 =?us-ascii?Q?z3LRsK2GfJWeJ43egQUR3FAK87WfqFrqKhbnI1zsfl4ZAFmAQEITnNWgqQ76?=
 =?us-ascii?Q?LsS7Qei24OsoxCUGDhYzJYPP1V6Kal1Xna6tWdWD++sCryx3zjgLuUfQxca8?=
 =?us-ascii?Q?0Pl0/A5tiOWoQ0ZyOEjh2RTZK0qJ4TYeiP9O36+UoOQxgMI3S520u6KAcRDR?=
 =?us-ascii?Q?zhKtAOt+5Z+IDC2yX7iS/G+gYewxbYoRGkEq2ROvl7hLDJkoomRfuxmBzQsW?=
 =?us-ascii?Q?mQEXNToQkrrykn8Weu+jAxufV/WU0XkJbKAqs1pLQzf/lp0mdqkzihtz5hwu?=
 =?us-ascii?Q?NEpGjzjSQ4R+6DWYX0i8/ZEgPVIWQ9J7RzX80QStnnOkPtqeAMKPwViO0/Jq?=
 =?us-ascii?Q?EvXezEjVojWm79cfJjIXrKOSpTLlmyF9Cg1Wj9/x5IVsW48R4ZThRG2t4tyx?=
 =?us-ascii?Q?Fab73NJtFEhRTSvroLf/vRUTNCRXY6pS+29POXhMAgk8UJc2585Iix4w2apz?=
 =?us-ascii?Q?8uoY91v+HUvVNVMUkh1Djzbb6tPfeRMxsCN7FKy3uNfEhPzzqruE+dkZyuwK?=
 =?us-ascii?Q?Yd9thj9ZMOotAa/vUg61ieHG6K2tvHZnlx83lATDF6sgSF5wWdL0GewNduDN?=
 =?us-ascii?Q?lB9TdC+QObkj6z9rF1lPtbexwjmRT7sfJZuhm2PevRmvF31HfehjpNugSYzx?=
 =?us-ascii?Q?ZlthALlXZwT+giydNrBlKi+Y8JwvSLiZ2wwrXBblO/Zum43n29RnzMLsTyzi?=
 =?us-ascii?Q?m49zY38ozWA/hG2XEMSgQPYceuWhR8LCIYfsocY1U4IAQ+I6ydpgZFTfw28f?=
 =?us-ascii?Q?sp3iyACCTG99MLVJm1I2U51I1TKStg9zVRynSR9QwQCTkEbkc3wDCLg/p9iy?=
 =?us-ascii?Q?906cY9UGjzN4Mgpn4OJST1FyfUy6AB7riJzWX3FIdGvDzBmQS6EmfQ1AlHBL?=
 =?us-ascii?Q?7FEXousL23q/0ax1pHGdqjjLdeGYoigN4NlK5is75JQAOUZAgqNQN9H0ypO6?=
 =?us-ascii?Q?t96kxKIL7GMlv7jBO8nleNvG1a2GLE9LSn4QmfM/KpvTAcCA49vhpqUFawv5?=
 =?us-ascii?Q?zFeqz/KWuDCa7DWlB9l5MtlmA5ZTVWXZ0RBER+hfvwZ8PA9MMSIwBn8g/VKk?=
 =?us-ascii?Q?VcQiVUgL2MgfT2V1okctqwBRD7bXx0duG22qIw/TLHl/no9IrhmgHE1LKz6A?=
 =?us-ascii?Q?DIAsxKz0baBsZd0CMd/PvHA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1eb2c81a-fa67-4f2d-3be6-08dd5605b1b3
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:34:21.3763
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eYYnDPCi5lw/62aGlWUWgGNLKvzQ+aFZe4/Fr0tmd6NYuv8+XiC+OpYKrX1on7MpHKqT+LtbfftlkD/mMMCAIeT59ZtIiKmhND6OjBBSwNQglVx7688iUicDXaJ7THl5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10414

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/wm8350.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wm8350.c b/sound/soc/codecs/wm8350.c
index 66bd281095e1..b1fe6f4e0c10 100644
--- a/sound/soc/codecs/wm8350.c
+++ b/sound/soc/codecs/wm8350.c
@@ -846,12 +846,12 @@ static int wm8350_set_dai_fmt(struct snd_soc_dai *codec_dai, unsigned int fmt)
 
 	/* set master/slave audio interface */
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_CBP_CFP:
 		master |= WM8350_BCLK_MSTR;
 		dac_lrc |= WM8350_DACLRC_ENA;
 		adc_lrc |= WM8350_ADCLRC_ENA;
 		break;
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		break;
 	default:
 		return -EINVAL;
-- 
2.43.0

