Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011057.outbound.protection.outlook.com [40.107.74.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4DBA36074A
	for <linux-sound@vger.kernel.org>; Wed,  4 Mar 2026 06:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772605438; cv=fail; b=TwpMSfQ2I4aNo+i9brzaKK6P8/QpWXea70Q+uUUSdS+YXASjf4iXsOhpSVW8nDvDnwh7T7p0+JXccyeH+zGQkb+3wf17Mggwzhio/rmtvlZm0FRodrg9Q03xOzacNqlcsAZQ5ujboOFH9jY7LENKo0gAWSN/rd0BXJfBgE1JoPs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772605438; c=relaxed/simple;
	bh=RQtPErvMcVkc+r3790WVh4cYCZ67Rl0ZH00oAcoEPRE=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=hEpoKno6wYQ93P3WKZ7zxJcClO/Ml2Z9RYuyiJAZw8GFIVFH9zXsqBouoxDinne0VzXrix437zLvaWlw8wc98V8OFpIRU/aJi/ofYt/4EWhXPqD0XpVNJaNrhOrW7lgROEAPiRy46w5YuAYr0O0prmTqcJvhxdt5rkQZ+D+qiaI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=GmymHF0P; arc=fail smtp.client-ip=40.107.74.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="GmymHF0P"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LUUyhCmQQAR3way7a4YUtLUyS1TBNk+uBbFbdRnmfjVDfCxPlYc8pJrBDgBzsE5ReyqYI2EhTc++CBXqSiwvIn3KMIXmwCmTIFgGk3piJEm7YnsLVznHuNy3ogUu9JASeUsuvxzwvuygp94gtewtOxXEzwlUPpl1NwhURZt/c5juHcEeZO4WQY/YxAzZ0Lul342hHy0/FykOZ+BBfHOS4ISzf5iem4B7KqE+Dz12RJeABSSkfjBuYCiIhKKP+HLjGvZSi1riX5vnzkFXC8r0Y/CkAOxkZdaEz6BmEfqzaaKpvlzbbIlS2Bym7eRpCxT+cIKEa1RTvJJgLvOfrkFhtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WPBTOGg+01PBm4z6ih/KlPHK9f8TpY5h/DLteENKlBQ=;
 b=iYERB/FWNg+WRaCJMx89nS9wvULkLYXiyqPhuCPdpvnRPDa1GSrUBeYZl/X54M8vyQMWDNk3BC7NGHNMpZv62UDNexJRkeOV+cLZ3tEviCh/p6YSAtWvjOe+cw/xAJTc8Gz63VzCigIH3ORaCIH+uSUeTLKHbbFJyvgqlYOzhZSc0uzJDKSrkw7E5qfK31bLQziUGdMV3B7v24pL9J9xetFjgPKEeZc4e5JrBrIG7vUTKY7wTu3TCcOZ+96Btumq+muxhQzMS7DaC7oDbQRfkLJQy35RrHiOsV1u7vExsAh8PGv4yuyymXvHifUcwtGOAL5dN+Yqc+uHmOHF/w0nIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WPBTOGg+01PBm4z6ih/KlPHK9f8TpY5h/DLteENKlBQ=;
 b=GmymHF0PIeUVwaS/MRzS7NXdvb7AgF+WQabitbrg1np2U04rJxfJ7bxermUYzje4RGULLfWF2Ty+vU/v+vzwBKWwMyX3CaTguVbRJYL/PmXs+FPHnk7Eiz+KQ0yoHLf+lB7OwJT9VCfc8mhBcs37SC4lP5OwbInfiv+11RmeqAo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com (2603:1096:400:ff::13)
 by OS3PR01MB9755.jpnprd01.prod.outlook.com (2603:1096:604:1ed::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Wed, 4 Mar
 2026 06:23:53 +0000
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9]) by TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9%7]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 06:23:53 +0000
Message-ID: <87zf4onmdi.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 22/29] ASoC: sof: name back to pcm_new()/pcm_free()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7fcp10x.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7fcp10x.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 4 Mar 2026 06:23:53 +0000
X-ClientProxiedBy: TYWP286CA0004.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::6) To TYYPR01MB7976.jpnprd01.prod.outlook.com
 (2603:1096:400:ff::13)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB7976:EE_|OS3PR01MB9755:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c4e6e54-2b93-4123-6723-08de79b69ba3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	eRpg7do5wmm1ZWItcajYaNEAA5uCMDmPU+TeOb+FphxYQXks4oyKqCq9fNwnVa/1X1yct+C+smhQcKqH+kJR6YUasJcNBxUFimR61e/XNYRBeevyqGXUWVolyBhKmITEU/rfVrrrL3Xex4suHvJUW+cgMZPFCqbrqLDTd4a8Mba8RG6OD3xKyZ1oiabFuWeV++ADFGPT16DuqVzh1WurfW54rElVH3X8r5wUKgrrhEJiOj2xgOGZRXb6f2cy4sj1LdAs+EEQc8m9afGVpa7nDWszep2HuR3J2NNPq5q9Sx8Ghxq2AeSpD1FAB75dN2QdXLoH13VxWa+OPNcqy5wWroU92B2pv7e3pgglduNmvFAB+T5CD3BEobJyH5QQTb1VShDLzK8pfYxytGBoqCxAqP5jVaM8ESnArRSQpraoc1fneLsGen8e4pVipcItKyfBQzw4ppbzP74neBhNSvT49StHdQBlgkkN0tXg8jn9Q2o5EBPHpjhCsXCogQDO1IoOxM6yWTEKAFgYk0YrFKZ9iXoYLiTQM6biHH1a5dounYS3PVBt3tgp9TzRnG7DI7BtLncmM9QQKiWtLrbzZ/Xf0UXZpn1kTtZ94hEGZyji2THgIha69/8e45cGtdZ9kZrijuoK1I9+3fyJn9yoZ7OfVeKZ/L9hqeQKQc8PF+z7bV9carkrBGyv1co8KU659EpGajSEY/QXF9bsJcah6gS/oWFXoRUjGEWbyXoOCgau0MvGchx8vHnX9mfKJyKVT0TtOG2RfepckanXNWR0PV5ql4pgE5O2u7zJGHCSrTMR92Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7976.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2/lopA9hPr3Ao63zvvuVe1pSI2swSzSCRWkmNQZaWlWbS4dLIgJsghHLxS3o?=
 =?us-ascii?Q?C8erHx7St2Uub6VmT7LiDdOvpc1p8vw/ZpjxHsa3VWu+UmsNKu4WEyrjd7dz?=
 =?us-ascii?Q?CmDsUbd5GmqmoDGxfMCu/yA4xVctLJkSbiST4oLmRunS5Kmzf4xYxQ8niNHL?=
 =?us-ascii?Q?ZZ5tgXh/rfYbJpSw6nvK/yuMNAFs5xifHigay+NvtDSmBrl3EEnPc4NjjH01?=
 =?us-ascii?Q?WS3qbm+WRA4cCRtMul45N4VTXdPHT/rPhHkXSCToLaoS1O9g+M4d6DPyLRX1?=
 =?us-ascii?Q?h/HrCaHoN3ajnQyI7cc7noC4yqW54vflW68LKvMw1wxE4DUkZUlyAP3ZW74M?=
 =?us-ascii?Q?ND67GnKflJX8JFmsjCOBkwdkhVO3ZlHF9GCppWRQYNooQXx8taw4dGd+g3nO?=
 =?us-ascii?Q?GuI+XRGAZzqd3/SGVpUeJbX4J0CMG80swPARBIfqBp4n5Yll7m36i6pDxQZP?=
 =?us-ascii?Q?8FbFs3o7XkwNpNaCsALhTl0MvDx3ESMBkiZrVXmw7Xw2VGYWFvxNtSjmUq3l?=
 =?us-ascii?Q?I3DFiFakz+J2+OfhctkrR0q7AxDnm+bJ2pVhdgsQlwBSiaQdR5ppWJN7tFU/?=
 =?us-ascii?Q?XXsy7jTRpyHSiZjZbx4oe5dlB0i1RE20W1oa1c/Q6RTV3NDqyupDUFHrCwhr?=
 =?us-ascii?Q?gY518IVP75Fffq0ts/ZpE3u4hwx+5zDS5NlPnpyC/C6U6lDYEsw2KRQm4bRT?=
 =?us-ascii?Q?A+cDNCUfR1nLmVqNqOEr4qAwGJd3eHHXpbnkswY67aKkGe5BPpnvhg72YpYU?=
 =?us-ascii?Q?34Wsn8b4RvWKdpM+IjdpJIHO1S0H2ht7RuH7Dm1TvlPicJSBhyFyHHO23fD8?=
 =?us-ascii?Q?ycOmhv1NItg0WXPD2trHYeqQnLYsq8fukL5+pUBsvhQmJspXIezCIuMkn9m/?=
 =?us-ascii?Q?GAMsYYZHIhQrPBVnqInxTrnn5n4fV0OcK41rnSGyJRwvQUZLTlJRgO4FqrSe?=
 =?us-ascii?Q?0+YKQEov0zIeUIXLznbEYvrcCZyrrXQzzm+RuVN2to37OHBDJB/uc4LNSa8z?=
 =?us-ascii?Q?v/wVrQJBtUMQyc2sG4a66e1BVqyeBpCauIYgD7x6WJZs4nj6bmJoZucc+gWY?=
 =?us-ascii?Q?GhHoHgwMUnlpypKc9kpIyBMxn3jEeI/gOl95/qlxaM3TZMsXjcFzXFusWVlA?=
 =?us-ascii?Q?nJBlegqjoLl9KgyQ2HFtTfCsjy7AkjDeaxv9To5FJLFwzLT3WoAdWFvcHuPA?=
 =?us-ascii?Q?M575/ooDhk3OU/s7r6+wUxiCA6x8oGyf2SAlHlmkEClockkCI7ay0aMOfAVf?=
 =?us-ascii?Q?FnI7pJ+TkLhK8nOORgvzdQ5FSFbgbccldaQJLpQSEo9zbEkfD8nWTtxzJhxD?=
 =?us-ascii?Q?18ueYjbT5ip1Te9k11w+4QkQjiJzrs42ZDeteOcH6IsUNTog6Tw9bZEJFNZX?=
 =?us-ascii?Q?WpnZeFfVPmmibY4ZTRb2ozOs7LUaZaeDBD7jZhP85DAKW8m4vJjbWuRqdhgQ?=
 =?us-ascii?Q?X/iKO3m9B/tCLT+fVrtmGgLFJf/ZmDQ2+25oaS2OFtZXJnYV1D4EjUmcPQ+k?=
 =?us-ascii?Q?JRsjeluuVB4CUPPVJN0pLfAGnRO2n1U3hsAJmZpPmlmKeYRrrEjnuqSL7v/T?=
 =?us-ascii?Q?wb/sg+iPjXZw43HSsRZcgDu3K3YUkM3IY5E6PO4nZiXdk+DqUftZrx5fD1Ri?=
 =?us-ascii?Q?XO8FfMP/HdERo0PON24YN8lxDQwkcnbjdWOPnoO7eRsRh3D6nLk9r3XLJyJN?=
 =?us-ascii?Q?wt3snvkVPmknWsjJfRSpZ/KDHaixj3xorGNcweNslskpzBkLVLYW7yDuzOf4?=
 =?us-ascii?Q?qBt77opcOl85x+J0K6lLHsAsIt7VSLLOujOhwmfOoA/m9Fl0uhxW?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c4e6e54-2b93-4123-6723-08de79b69ba3
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7976.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 06:23:53.6469
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2CBsVuWllVEZ/eQHH3GQ3VVaKboYU6ypNn8TTq2p4YQD96wUjpYqrWg6ByNvJSx38wA+hK2y/ULwNVkqiI4wJgWWAYdWzwP8Uc+Xm37yPSQLq6y4NysonV4l8ZKZxjUY
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
 sound/soc/sof/pcm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
index 5b598d0940eb4..02ba0dd18ef51 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -651,7 +651,7 @@ static int sof_pcm_new(struct snd_soc_component *component,
 		return 0;
 	}
 
-	dev_dbg(spcm->scomp->dev, "pcm%u (%s): Entry: pcm_construct\n",
+	dev_dbg(spcm->scomp->dev, "pcm%u (%s): Entry: pcm_new\n",
 		spcm->pcm.pcm_id, spcm->pcm.pcm_name);
 
 	/* do we need to pre-allocate playback audio buffer pages */
@@ -850,7 +850,7 @@ void snd_sof_new_platform_drv(struct snd_sof_dev *sdev)
 	pd->compress_ops = &sof_compressed_ops;
 #endif
 
-	pd->pcm_construct = sof_pcm_new;
+	pd->pcm_new = sof_pcm_new;
 	pd->ignore_machine = drv_name;
 	pd->be_pcm_base = SOF_BE_PCM_BASE;
 	pd->use_dai_pcm_id = true;
-- 
2.43.0

