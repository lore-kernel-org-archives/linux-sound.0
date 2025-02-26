Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011001.outbound.protection.outlook.com [52.101.125.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0821A194A7C
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533775; cv=fail; b=i6SwntieDgdAXR+Q5ActTMDqT1a3yjhiZSmAO4+bhz6oi91ZGg08cLRfXUAxFxn0E5I+qI0Els5j0ZiZ3LSiaFeVLuvCTc1gqYrhzJan1m7txOGRo/2oRj37Q7JVqbuIYeCbGJUkKr6YMJ4wW1gT9csZ6I1upDMS0ToOI+QVT64=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533775; c=relaxed/simple;
	bh=2yW7VutA/Rgy56ejdo6yDQ1XmtLL7TINJpzG6sgg6iQ=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=iooETHTPguC+oIkS7PiqQ0ep/+CVrzicata/Z8nTpIDEtOMeDNP0INoiYaQL0ntXHVcxWIs3JURfkU6U3f+Rh3JGhmIGDtoIL7DrBmjxsDvrdjSZpUB5LdeFj9HyXn6OtfEFy/JWV79k9SE/BudvzwjVaQFbqLAlp3fBByfs+8g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=LI0oAXgX; arc=fail smtp.client-ip=52.101.125.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="LI0oAXgX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lizUryDUyYhIfzoKHgAFJ6IJzwEI3qQw/8QhfE7AYI/v7DsdEb363T31rMgE18T6rHQrxu9PklvCVAkdQ2DLDklgstMknodDYIBYo4wl0LhQyHGMdQJ4nR/vkpj+AD9VN35bCEzFM2Z4RhdyWGeNqzKTA3VIcrlsS2MpwkOH2p9gzeBpMtkevKaYxpMr9bCixHxALg33w5ZZmno6hohCYrbfkXpuZSNC7ut+XhlelQm+kjrGAODZ1JtKjuf5PQDtqhkK12iE91C5r3tR5Cbuyqx5MB8ufDvjIV4twYnYWxW8EkfNHz9ldN56O7Bm+X1kKQE0mgCvND6nkCA/rZfJ/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SPpHeZVxrJbb/l8aP7SaAUf6lC+HgZGXpNT1/im3RW0=;
 b=JM9WGeXmEaxXEJEp9SfNHMrI7EgBsIkCLeaDeLnvqiqYtmiZZbAlSkg4fanhOzOV68MGShmMgyKYP6CYLnpja6njLpnET3jXzzByrnDoG/l0K+8zfJOHXVEMq8h8kbBtc6mIre9R3AmemC8Yw0G2bW7UmSSnJ6w2QMTDUOZPx8ygYwyWt6aS8BeRnG7TnMcnu2Iuv9oJYQUQwAKxSQnaPms+LI03lQ1dNM+bEhWkG/bDYL7vaCxlGAfd5ll55c3ntgGGZXsm2Hkjqm9wORdba8KJ4wFxDqdeg8xSgTe3NWYArwokN2usjcFtG9nOiPf5iQ+OHpmkKAHbQhREkBYpFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SPpHeZVxrJbb/l8aP7SaAUf6lC+HgZGXpNT1/im3RW0=;
 b=LI0oAXgX7COqCb4UoeF8K3Ug4EGgv6xL4d2l9nufzGWoCLQW6ZVRla5AcHZVeJ5oCYqSVuy1yteg94PMBeWkOo2IxNGMuhsUMokrjBq+jbKJZU2jJpZZ2RtGBSFBhPg174Bb2hQZ/aCHhhpDjnLjwPGHECg+QEaD6FD5CZptejM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB9660.jpnprd01.prod.outlook.com
 (2603:1096:400:232::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Wed, 26 Feb
 2025 01:36:12 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:36:12 +0000
Message-ID: <87ikoxbi7o.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 098/157] ASoC: codec: wm8993: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:36:11 +0000
X-ClientProxiedBy: TYCP286CA0255.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:456::15) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB9660:EE_
X-MS-Office365-Filtering-Correlation-Id: 6de3e8b7-75d5-4608-063e-08dd5605f3a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VC7vcJOoqulEw6Wq6f/AqZGvDolhEqR41iyvmtEy6S63LWLC07RoLSWeJ5Pu?=
 =?us-ascii?Q?wsJ2qdatkY7gDagLhVS+MHr4p4PblKPWSLAvSxGWrIB/b74JOSgvtmaKxkVW?=
 =?us-ascii?Q?lKvAIXt1cO1cDx9loG2wa9542NobiZISXZ+6YMeBmrzD1QdUjdKiou+GxMaH?=
 =?us-ascii?Q?3h5gitiMFXgd0uRZjdSuJBfmOHs9o1Dcke21C3etq9KZc2snxlAssK4s1mHS?=
 =?us-ascii?Q?BODG6Wbk8V4uJADx1lZZD/JJyoN30AYEWEcgqjXjycxZyyJ3+OZxUoDrUvZT?=
 =?us-ascii?Q?GZXPmg48n+FZ6Zrb6yq+iIRRXSj6Nbm3L4Bb3LTVHQPoB3ihCmfUj/6+DOH7?=
 =?us-ascii?Q?+dfGAlS+frZuKYaZ/4mnDQG3k2NHsOv6QZ7Q8/oJwF97Elv2Y7+YUe0KkFX0?=
 =?us-ascii?Q?+8fAwk3hLHhuRnWyL23611pW2uE7YY5IfB7ayxBjZ2hZz28L2p+CfDCbdJqC?=
 =?us-ascii?Q?hSKpvjV89DPaxuPMUV8CXJp4er5nn0gbL/FnCqWsvr25hu52KUxpDg2ijaDY?=
 =?us-ascii?Q?JvgzcSyJk2PZxqY5gnDfO+i7nae2kTzK7BoDKkDsczcqTffcXd9s2yZbh83F?=
 =?us-ascii?Q?A+VJp4xRmPRpqtZ28H/G8akyupxCszV5G/OP71CrdRqgVTziuw3fNrCFm7h/?=
 =?us-ascii?Q?m8pzfWZ5bl2fwBP+n945HCrWO/kMsSWR0zog8XQUj1j2jViaIdrqqLF6mtOJ?=
 =?us-ascii?Q?lxtxsp5uI94lbGwtWvZT69xDvvEqMlIvbgdzmBSOCPgMdZOK3agev58+kOUZ?=
 =?us-ascii?Q?FyytUAm1gY9z/+nQfQ1KJ30cAfGbsmhwxiGFG5tSIbNuvuMx6isvn2Q9N218?=
 =?us-ascii?Q?GS0EddUOq7GhVZpdaunR9kLhYu34q/wmJDo6fqxZhHGlLEULy2FIoE7+4TtB?=
 =?us-ascii?Q?LIdA6aCEn7Zbc026+aiDzk17bXNmJCCAZ1IObL72KfTwKc/11wPdn1/3RSnZ?=
 =?us-ascii?Q?igKAFdlowRju+24NjOhEoag31PJvbazJSmRVXs6uS3tIuGbpwpEr8CmluXrG?=
 =?us-ascii?Q?3Au3V7B5BHJnWIeA+P9TKxryw31+LG4aYhzsycSVSMLXb3AzONV4r8H/z9v1?=
 =?us-ascii?Q?Jytqu5P9oj1QUkvqcpMzfEQLo4nfbZkrQitfIu6sYr3DlpjWe0qswc2x6XEA?=
 =?us-ascii?Q?o6GTDkmoIQLXZe6iXSuHkJLGTSlP6LgFhQmhgYMRIRuQ9zx+VxWDxflWKG4A?=
 =?us-ascii?Q?qBNgvt+Zp266Gg3HxalxRug2QHRCexEOJRG4n7qxjaLkTXuxXmwdZE+OErcS?=
 =?us-ascii?Q?0DV6IiR5Yt8PxPht+ekT+QT1w398v4fCNYGoyjz3OH8JoAw1uQKFe+evfCwj?=
 =?us-ascii?Q?G7OfH6ci8O8JQTGSNDRYbrdzmR79gLlAhGKqKeOpTNIWvrGkGzzCz6qkRUIv?=
 =?us-ascii?Q?9CPAguAVv+AdjNxApKNmg0BMsMy63ZhrylnQWcwOhbSDsSLT4eQCNL8c7GgW?=
 =?us-ascii?Q?DH4ZsD9M5utJIqN+UYVr8bO6pjYhj5yH?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YpvM6/ajQVuzFH4n7jaaSdvRSua0v0Szxe4XDDxEUpe5u7vowR5ELj+xc7Nh?=
 =?us-ascii?Q?4d4lUw1CUBJj2vW/KhaV/WTJbITq/00XRSQ71oaCOeL0qFZ9jfVjNTrsprYK?=
 =?us-ascii?Q?TwuIjcz8miyn9W++WLCU8HsfwdU9XmBV0ERM2dGC/Y+MqcyHpXnKuYHplq1w?=
 =?us-ascii?Q?ncKPOCmau+noZdFS8oafZwxK7W+wWtLGVQAL0UQeljeRjpuwpBgDEbAvVOy4?=
 =?us-ascii?Q?+yiTC67A0XuUJ9TR/n6zhv28ZWx0ZW2miiyQKuBf0p+rfvcWVBEiIswyY1Y2?=
 =?us-ascii?Q?RUl2FR6PoSzAk+NeVUTlKogPT/+x8kr9FRYW1XC4klZ1ahikFoFokzyozgYi?=
 =?us-ascii?Q?KkyljbaYI6KsgHSboxPi0WzgrxiDrK6Lwt4dB3wY1MjFeiuIn6t6oQA6vKUH?=
 =?us-ascii?Q?89wdnrk+bVzMPQJQSQfkIaQYQOovPVP582GcUBo1Vwe1IXIoAR0PdSsPqauB?=
 =?us-ascii?Q?18IezHsq000JU5R8lEQqxRUiunqRfrJirYZcilGQCzTHnyjBgNMDf65SjYDh?=
 =?us-ascii?Q?OwnTn53kYWC4RWd00laoZVPLVgITK48nbZ2DMhmUlyRnTBUjghRTDuAnLYGj?=
 =?us-ascii?Q?dVFjMxIhyQIRIRCCGw8UaTPa0N/Z5TySFbf2xg8ENr5MVZvDXx//BdjE9KS+?=
 =?us-ascii?Q?P9qwuZzEhQyB8xtpVtoiurTREuzE7soV5Zi83zqLVPgjNdIhnD+NtKsrfWLf?=
 =?us-ascii?Q?X6Xks3bwQbF6qy91hHT8nn9DblXIsYmvIaI1kpkAjw6b1lMQIkoEdCrJbYC+?=
 =?us-ascii?Q?cKYNOAuXV4fip80d0Blhb88sATYvoY41wXVkzTJpbcBKg97KCz6InBHz0XJS?=
 =?us-ascii?Q?l2OQ1SHcfRN+plBC2d3yxdh5wzGhRAjzYPAI0bWbhwRfjXIfY9xcfAiS4Ilt?=
 =?us-ascii?Q?32mGHeJgaZUeU59J/uOFz6HjqGCKG7bjsrwZe7/Os6m8h7Xc9weM5IRzoPka?=
 =?us-ascii?Q?sw0hEio0GovvuHWZ7VuGIfm1sM8RuVLA9MiFlM8X+wI28wbuNdD3inroWj42?=
 =?us-ascii?Q?B//sECiqtWJJW43Te/faj+oFf+v1L2mLZ6RB1wRyPp5v5UP0A8gsgBtT9HkQ?=
 =?us-ascii?Q?pgb0D4MF48KOSATt0HVMP9vFI69FsfJTTdFmSC8EZ1NeJU2afxvuD2Bcz0SY?=
 =?us-ascii?Q?CvWT8ASXDS+MtTx6APusMCEVDYYXnT8OK6x/jn2RQ2M3tPldUxxFlCTaB9Xy?=
 =?us-ascii?Q?bCjWARk0P3Qs+wuimtTUac89p7f8NI5b4DdbmCPjMGm2rMgVWquFPV4MmmEa?=
 =?us-ascii?Q?tU47yFkf/zjv7xdEd1FqMq4Nltek8Agsd8wgrzCorwh2mfYEmgH5uQ5oPcE9?=
 =?us-ascii?Q?Mh9uwbkYK8IM/3s0NaIc8l39pRpS8K3qR6whyBm+AJQaV5mvgEZ76f+kznV/?=
 =?us-ascii?Q?YIaFuVVUUqQ0/oY8rZuM18xDGdpTjlUxOKz2FyghZ0UGcX0BPqw4gvDRtA6d?=
 =?us-ascii?Q?hLZXSkvTmTU3Ed/3dDOBq4mdX56vXDyWC7Xah0K1wlwFvguuhjXZPoXm5To5?=
 =?us-ascii?Q?1uFcHmSwFm17X3AukZ9QGiLhfz/KSsLFkyosD+w45rlNHPiW/7YwILvM4GH4?=
 =?us-ascii?Q?nZYJoX0SDMvPHiMz+9DNypMoNImetz5y3J2tDGWv6+DWVlE9x/UgRZ/ZSzW8?=
 =?us-ascii?Q?5GroFtNODU4sM9g9DhgzME0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6de3e8b7-75d5-4608-063e-08dd5605f3a3
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:36:12.0005
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M2lo+ulmuPU9biV5ZdYl3vOjnnflV6NCyWukeouuclPi8wJd0QUpJkMX/ACWMkIHKCmqpjzGLtvYZma9fnWYA1FHqEahy7XTrVqk8Ta1k3SgOJwi4R83jT/HN72SWyOm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9660

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/wm8993.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/wm8993.c b/sound/soc/codecs/wm8993.c
index f257980f9b56..9be4f6cadba3 100644
--- a/sound/soc/codecs/wm8993.c
+++ b/sound/soc/codecs/wm8993.c
@@ -1098,18 +1098,18 @@ static int wm8993_set_dai_fmt(struct snd_soc_dai *dai,
 	aif4 &= ~WM8993_LRCLK_DIR;
 
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		wm8993->master = 0;
 		break;
-	case SND_SOC_DAIFMT_CBS_CFM:
+	case SND_SOC_DAIFMT_CBC_CFP:
 		aif4 |= WM8993_LRCLK_DIR;
 		wm8993->master = 1;
 		break;
-	case SND_SOC_DAIFMT_CBM_CFS:
+	case SND_SOC_DAIFMT_CBP_CFC:
 		aif1 |= WM8993_BCLK_DIR;
 		wm8993->master = 1;
 		break;
-	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_CBP_CFP:
 		aif1 |= WM8993_BCLK_DIR;
 		aif4 |= WM8993_LRCLK_DIR;
 		wm8993->master = 1;
-- 
2.43.0

