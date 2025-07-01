Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010034.outbound.protection.outlook.com [52.101.228.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBBC379EA
	for <linux-sound@vger.kernel.org>; Tue,  1 Jul 2025 00:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751328656; cv=fail; b=EhJFI6iIu/h1KYAWMFoD+zUAlVMVpsi9boMc+ty5QK9xq1Lyp/5XwwDdH1TX7qEoBMlzdNlMLvqPxbk+ZSKtJJBmlntNdgaquZje3aRNOA/teNJzDQoSOn8HWvqlSLD2OieO084P86lw1SHYupuCcctz1mtB4QJs+Fyuwqn0V+M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751328656; c=relaxed/simple;
	bh=V8dEHr0LXg6QC4vEkVup/kwfAPP9uCY0b3NKY6CpO0w=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=oo2xU2zP8iMjIpmN9XBGD347tiP4OJnpiM54oSSSdG+CGn6OzdDf3x/EzyzAkAfwmj0qidZgSl8oCNFg4SpIIDG7dB9jEsxn0yOQPCixBrThyyDFKSViiVvh0+2UFKJZgAtUGDDtSHXs5kGwU5fYBS+PR3a/a1sIqvFDZRm7Ejc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=eEHZuY6K; arc=fail smtp.client-ip=52.101.228.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="eEHZuY6K"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hFUQpVPLXVk0E0Y8rRi8vYeQUs7txtNBzyMZM/LIjckuWpUcag6V0cGp6DQ8mNQSFk6a0m2VFLtBfxjHjFxn3G84XTn5P6+ST9l4rMi7pQnmBFLfUzszmw1+G8LsKX4JnJrRqGaCKtGyaR667Elp4Hl1bw7v9QYrJZUOwNhB9Oy23CmIEQWGLQ/M9QWu2s64odWHSlPHIvezVLhAzxydxEFi8KPmSwNNB3yZGU9eW4Y4J+YCXiuS18+/sqRI14KsPipeVGSSeBcmfHtCJScA86GkzhNFazK+TzcbVNHLf5n6WOhbXn6Ne5uRHPwmSzB+9bR3whFj0Uw8cLfAes1gFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e3Q1tPNaGgAI6OS5CNeDTTgtQeFl1Aw4m6uzmcqT3Io=;
 b=o0LIzR9DvR4DaW53/eszCohnVsEP8W2DC55SeFCiuLXo0B0+BUV7YvPFIZto4zmPYptG9Xw4xgLCkJNDTigz2YJvoak2sRB6r+5zv02a4RPMik4L0XVgjYiP/IP8C9TM5KZzSFO7mYUfccjiZjTLJhEp+IVXzTiBNpi7hJQuzES1ZgfU1pmViHH7eWYPytzli4RugsU9AKaYRskNfTSyoM8l4NPoTCqQo7vTQ4Z16KnFHofKIWQRvHzixV9mXR3e8WNREWJ8zfKp300wtz0d15XBTj4nNBfWnt0TBznyQEj6cC1VC74FlHrM7X8qvL+YaP0fGypBV6JMs15RRL5P7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e3Q1tPNaGgAI6OS5CNeDTTgtQeFl1Aw4m6uzmcqT3Io=;
 b=eEHZuY6KSZS2dEhGYw6OxnD6E6N4ywbqIqcchZKEPwVcj98r1xxaac+bHlHEErOBdvmt6hU9pTwniUOiA58lqvg3vFdfIJMXA7RIl0lx4jVmSxzMMQ//woJWNfJaqbZNHw+GZY4jMjAnNFChD2W+yvWElZG/Yvzln1A+QMcdvQc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS9PR01MB12421.jpnprd01.prod.outlook.com
 (2603:1096:604:2e2::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.32; Tue, 1 Jul
 2025 00:10:51 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8880.021; Tue, 1 Jul 2025
 00:10:51 +0000
Message-ID: <87plekhit0.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 06/11] ASoC: soc-dapm: reordering header definitions
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87y0t8hiue.wl-kuninori.morimoto.gx@renesas.com>
References: <87y0t8hiue.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 1 Jul 2025 00:10:51 +0000
X-ClientProxiedBy: TYCP301CA0006.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:386::15) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS9PR01MB12421:EE_
X-MS-Office365-Filtering-Correlation-Id: fbb6de61-df43-4d27-fb58-08ddb833bd4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JIzdFZa9gRalQwN2ku9PFrbHEw3bIk4cAGyghK95kGZI0pvVTk87gxpxx7yy?=
 =?us-ascii?Q?Ig+/AkMH0DOCh6cvRu0IgA7GsR0Qa1iSZvooogFnmAiB1JmdK9llSrbqgohb?=
 =?us-ascii?Q?8B7cFLqzImTQXHPyVmDn1dU53pdKd9GC6e6tuSyk1jjbDqEiuraUX3jVQyN0?=
 =?us-ascii?Q?tZzD4KQCy11j09DpE65/fz/0hjO6CNTG+/Pc9bMeCr91h+4H6XJ4GbO+Fx2F?=
 =?us-ascii?Q?VndGXkyF2rHFX++ngC8l9Cd7boU75lryLJ8FoxJFKVJaE9FmkmgO+0SwTPS0?=
 =?us-ascii?Q?PsGoX4P3TVcbWSEONiClEr8sS5fwtUHj63BQ159WwwgWZxrJEgu5/IH2yuGu?=
 =?us-ascii?Q?xXG6YiptBC4orFnopvDNxULR3ybgN7/YIbtylhZbCuNAIvDE1mZEKfkVnfiw?=
 =?us-ascii?Q?H2BlDAAhsq4qnP79hDZ2h8f4kKYbKDjdvFuQzi/sYPrW/+hQ3G8IEf8oiM9Y?=
 =?us-ascii?Q?G4TFmWIqd/uDIqrNPe0Q2RA9dsAgq51pWxNfrn6TxQqrBj6f7BtvWz892CSH?=
 =?us-ascii?Q?QtI5/bz5ep+9bSC4pQxYDekVOZP9JN8ydlYHenkZgLWD3yaI5UD4pZq73kBy?=
 =?us-ascii?Q?AEYlnEuu53g0jWumcARvBG0oxbBUOt9nh62DKDqf+ZK4j+VQipZSU5VRSbBw?=
 =?us-ascii?Q?+xUAwqDZkCQKjdhZ4zaxkAQMCUGMQIljU/neunIIhrOyTohWFScmJxSDK59h?=
 =?us-ascii?Q?Ba+kPXw42bU+CNX2KUBUk3N7LnwqZmUqUjlIP7RVu8uajrWVcG6rCKn2knTF?=
 =?us-ascii?Q?gH7gDez11fA8qe3lVH3rOmlg1pr9VuLJNUfpArmfsq9YB/qrRWd+b4u/m1Mv?=
 =?us-ascii?Q?kN2A7Y8tY/g7JsCp1QmHa17bo/QIBvVDCczMz4KUHHF6HUm/JiWZdPLKUUAZ?=
 =?us-ascii?Q?Vsx8dcCg6P8+QYvJrZgWxL+gIYRy1dNH0WDZWIFp0LjawTKflJIMr3jG9s0n?=
 =?us-ascii?Q?ReXKeuKDURq+nFRSm14S7IZnk8Ax1Y1Fr+qOYImdyDuLp7QnHUzxSSemQOr/?=
 =?us-ascii?Q?sIMCAdUmBuN+KQaEseUFU4S7YE+gVzU7DwCMQNsLoPDovgW1tYWuQlqDjDzQ?=
 =?us-ascii?Q?Jgb5x7lHGRUDKJlDtbtDTrt2kLE2AynN14VebQiKXV50F6M9bZr4SzGYndo2?=
 =?us-ascii?Q?KlBQzkcZh1ab3jhpF1+klt3trZK0hMb2juN2jZRKwA/rEPajZeZ9YGxpMt13?=
 =?us-ascii?Q?g+fTHX6JvKUvxIwb3o213IALOIqxrwb61J2jyjAX8OS3N7xwjiV03+nHt7q+?=
 =?us-ascii?Q?mVRRZu4HD4GySfKHFPk74GTMSmxnzMU5ZDtQNXQxC9aq5FGnbmqtmZjFJ899?=
 =?us-ascii?Q?24PSqTZE+K+pCZo4E/teIuoEA0F4Qf3ffYFJ2mw4eGX0R0Vf0ov+ykd/kDDN?=
 =?us-ascii?Q?wBOO4KwnE+s2MFYLrxrep0sy55o7BXE7Xsj7Zah3zgCmR4O6MEIzOablEpSf?=
 =?us-ascii?Q?KvtTl3alJ060ULII9+j9sZAUzXqAgVK8npQcewRCp7fTLPnQU+6+Dg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aw4f5xmRzuK//2nHbHLKod4IDOyPRrnO228lPiiTs14om28ccH2DNJ4aQDbp?=
 =?us-ascii?Q?hyfi6JJGgqvJ5d3GBE8K2DNDn/wDGm0zc4Cmvc/wrNvJRzvXGZYkpqN5fkVb?=
 =?us-ascii?Q?fNsZ8Dssa6ZpZWpJeYcuTfKr3PQjNtAenCmbHICV8EjVV16h+QX6hGLkHIwE?=
 =?us-ascii?Q?0+Z3ath6e3J8vGgyu0jopzXGaNE+bA6HgrBf+7H6qOtmrrEyXTkAmhte+PPz?=
 =?us-ascii?Q?kxsoonT1w8S9CMTegxlmFRCfzo8iYVi2Q7JkxcP8jQck+Po0zNrPgZ6sEN89?=
 =?us-ascii?Q?DAwXDGofGuFWwp7G8M8wXvl9YYERbsxiUgtpgeK0YW4otyfHYpPaP+X2CL84?=
 =?us-ascii?Q?Vm3HObc4CFkvbiHq73xj99+LW0LMp2/gNCw1CgETxijWkFHaQrYmwBYZFeq8?=
 =?us-ascii?Q?9PNy9RLJO9zCWOvzpqpC7PXGnEvHZwJsA38+03dAdsyspTK82Tfkro1PGRWG?=
 =?us-ascii?Q?TcU+pBk+BiNdblHmbBddc1yQqYD3xnXH/qU29hXqvRRG+RG4nThooDI6HAsl?=
 =?us-ascii?Q?9xQCB7J7yYyMNSLM0pa/BYJGP3Jl1CEZV6rNG8JfyP300AarH4Ry09rwdBlo?=
 =?us-ascii?Q?bD8Qy4C6+phG/GHwKJ/Udj1CppS4TsLijdrvITKSdwMbBLQIkzFOy+UB7tlo?=
 =?us-ascii?Q?os8AjHaTmBgivBM8zFDzF5pwEmq5w58zIphVUq3/GHmfygu4CEc1Fw7O+yP2?=
 =?us-ascii?Q?X5/FUTDlseG6ZPYdOJLUZ7BoP4192rFRCbRuihHl4VyT4MtL7iD9emWxX0oz?=
 =?us-ascii?Q?6cX511BBPQrQ7JAJ4Np3nA5vn3XYfLPp9HmApQLhSdEoWhs95DMf+6L26+/g?=
 =?us-ascii?Q?P7Y7wp4hizZ1LkbUc7gneNt3I0hN8Y3XiJlvKshNPTtcEz795/SZvHsCmlRD?=
 =?us-ascii?Q?7n7IJniHIWDoRg5npCYTHbCFU1XfF8PzFQlbq3iR3Srix9mDE3IJKiRtoHxt?=
 =?us-ascii?Q?tM4pUfRd7VrcSsXl1Qv4Hu3HRO5gEuU1Ooti5kEWOuKRPWUKw3c8qmA/OiuZ?=
 =?us-ascii?Q?6esXYxdl9p+9n2HiQQzoodFmd+7BYqrxKWVuSrGQcq6FEHOLV0+vfhjiAy1n?=
 =?us-ascii?Q?EpqRRmJ1EcJpdaDTljIhb4CYCbWiWky/EFDwbfqhf5f013MrWPODMiLHgLjo?=
 =?us-ascii?Q?D6tGcqBeqlzeVy/a2x49kKcL/LFLOANVhbYkO1bcQNmzhAQdjtRFFbWabFtg?=
 =?us-ascii?Q?eF+2q/q+LnD3NSf2uedJle1FDDk/gego9FeObJJZkLHQx6z/7bUDOyi4kAlF?=
 =?us-ascii?Q?UFskrYTMpbMGALDV1EDwxl+Vl/G51OG3Qq+SmlmKYAn1oxM3H+o8DMCKzaKd?=
 =?us-ascii?Q?iAlU2R3zBnQMEtBEt3u63AQHnZcNj2hWaCLz4FhZugplajPMpk62UMB2o0Fd?=
 =?us-ascii?Q?sT94t5pKDvItvaCzSipLsX0FeIr2n9T8g3KZOSmYTg6boVHm3uPVWKTVhmVX?=
 =?us-ascii?Q?2TTpEfBgi4TPleE1ie7K4Tl07hebljQCVG3ucatlPravqvODcTEmW0nODweX?=
 =?us-ascii?Q?VlMAfeVQj//mg+il77gmEgpJQAJB2LM7BEq/FNFdLzDFnAFq5XjS0sbPrnjt?=
 =?us-ascii?Q?PfJxDkLEfSkEywqVHJc0OywPH4m2MWl0R013DXsAsMfw8u5BHT1qB4ifKhnZ?=
 =?us-ascii?Q?C5Zl+ipHJsR/7TnM5a10tW4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbb6de61-df43-4d27-fb58-08ddb833bd4c
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 00:10:51.6775
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K8vrms0EwT0XOl5g4AFLG55OyyvzBUmLMR5ceVwoO/b+VLiKcxct0+A+2eoczrSB9sf+aHCvWAV5dCydHsfduYgBXqUCglq1vceOuTbTdJOY0Und+kJVHApN98ejjnxm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB12421

Because header defined randomly, it needs name definitions on top of
soc-dapm.h. it is not needed if definitions are implemented in correct
order.

This patch has big change from change-line point of view, but is
just reordering, nothing changed in meaning.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-dapm.h | 235 ++++++++++++++++++---------------------
 1 file changed, 110 insertions(+), 125 deletions(-)

diff --git a/include/sound/soc-dapm.h b/include/sound/soc-dapm.h
index 6d854c727bca..5aeb0822ce0b 100644
--- a/include/sound/soc-dapm.h
+++ b/include/sound/soc-dapm.h
@@ -16,9 +16,10 @@
 #include <sound/asoc.h>
 
 struct device;
+struct regulator;
+struct soc_enum;
 struct snd_pcm_substream;
 struct snd_soc_pcm_runtime;
-struct soc_enum;
 
 /* widget has no PM register bit */
 #define SND_SOC_NOPM	-1
@@ -399,17 +400,6 @@ struct soc_enum;
 /* regulator widget flags */
 #define SND_SOC_DAPM_REGULATOR_BYPASS	0x1	/* bypass when disabled */
 
-struct snd_soc_dapm_widget;
-enum snd_soc_dapm_type;
-struct snd_soc_dapm_path;
-struct snd_soc_dapm_pin;
-struct snd_soc_dapm_route;
-struct snd_soc_dapm_context;
-struct regulator;
-struct snd_soc_dapm_widget_list;
-struct snd_soc_dapm_update;
-enum snd_soc_dapm_direction;
-
 /*
  * Bias levels
  *
@@ -428,104 +418,6 @@ enum snd_soc_bias_level {
 	SND_SOC_BIAS_ON = 3,
 };
 
-int dapm_regulator_event(struct snd_soc_dapm_widget *w, struct snd_kcontrol *kcontrol, int event);
-int dapm_clock_event(struct snd_soc_dapm_widget *w, struct snd_kcontrol *kcontrol, int event);
-int dapm_pinctrl_event(struct snd_soc_dapm_widget *w, struct snd_kcontrol *kcontrol, int event);
-
-/* dapm controls */
-int snd_soc_dapm_put_volsw(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *ucontrol);
-int snd_soc_dapm_get_volsw(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *ucontrol);
-int snd_soc_dapm_get_enum_double(struct snd_kcontrol *kcontrol,
-	struct snd_ctl_elem_value *ucontrol);
-int snd_soc_dapm_put_enum_double(struct snd_kcontrol *kcontrol,
-	struct snd_ctl_elem_value *ucontrol);
-int snd_soc_dapm_info_pin_switch(struct snd_kcontrol *kcontrol,
-	struct snd_ctl_elem_info *uinfo);
-int snd_soc_dapm_get_pin_switch(struct snd_kcontrol *kcontrol,
-	struct snd_ctl_elem_value *uncontrol);
-int snd_soc_dapm_put_pin_switch(struct snd_kcontrol *kcontrol,
-	struct snd_ctl_elem_value *uncontrol);
-int snd_soc_dapm_get_component_pin_switch(struct snd_kcontrol *kcontrol,
-					  struct snd_ctl_elem_value *uncontrol);
-int snd_soc_dapm_put_component_pin_switch(struct snd_kcontrol *kcontrol,
-					  struct snd_ctl_elem_value *uncontrol);
-int snd_soc_dapm_new_controls(struct snd_soc_dapm_context *dapm,
-	const struct snd_soc_dapm_widget *widget, unsigned int num);
-struct snd_soc_dapm_widget *snd_soc_dapm_new_control(struct snd_soc_dapm_context *dapm,
-		const struct snd_soc_dapm_widget *widget);
-struct snd_soc_dapm_widget *snd_soc_dapm_new_control_unlocked(struct snd_soc_dapm_context *dapm,
-		const struct snd_soc_dapm_widget *widget);
-int snd_soc_dapm_new_dai_widgets(struct snd_soc_dapm_context *dapm, struct snd_soc_dai *dai);
-void snd_soc_dapm_free_widget(struct snd_soc_dapm_widget *w);
-int snd_soc_dapm_link_dai_widgets(struct snd_soc_card *card);
-void snd_soc_dapm_connect_dai_link_widgets(struct snd_soc_card *card);
-
-int snd_soc_dapm_update_dai(struct snd_pcm_substream *substream,
-			    struct snd_pcm_hw_params *params, struct snd_soc_dai *dai);
-int snd_soc_dapm_widget_name_cmp(struct snd_soc_dapm_widget *widget, const char *s);
-
-/* dapm path setup */
-int snd_soc_dapm_new_widgets(struct snd_soc_card *card);
-void snd_soc_dapm_free(struct snd_soc_dapm_context *dapm);
-void snd_soc_dapm_init(struct snd_soc_dapm_context *dapm,
-		       struct snd_soc_card *card, struct snd_soc_component *component);
-int snd_soc_dapm_add_routes(struct snd_soc_dapm_context *dapm,
-			    const struct snd_soc_dapm_route *route, int num);
-int snd_soc_dapm_del_routes(struct snd_soc_dapm_context *dapm,
-			    const struct snd_soc_dapm_route *route, int num);
-void snd_soc_dapm_free_widget(struct snd_soc_dapm_widget *w);
-
-/* dapm events */
-void snd_soc_dapm_stream_event(struct snd_soc_pcm_runtime *rtd, int stream, int event);
-void snd_soc_dapm_stream_stop(struct snd_soc_pcm_runtime *rtd, int stream);
-void snd_soc_dapm_shutdown(struct snd_soc_card *card);
-
-/* external DAPM widget events */
-int snd_soc_dapm_mixer_update_power(struct snd_soc_dapm_context *dapm,
-		struct snd_kcontrol *kcontrol, int connect, struct snd_soc_dapm_update *update);
-int snd_soc_dapm_mux_update_power(struct snd_soc_dapm_context *dapm,
-		struct snd_kcontrol *kcontrol, int mux, struct soc_enum *e,
-		struct snd_soc_dapm_update *update);
-
-/* dapm sys fs - used by the core */
-extern struct attribute *soc_dapm_dev_attrs[];
-void snd_soc_dapm_debugfs_init(struct snd_soc_dapm_context *dapm, struct dentry *parent);
-
-/* dapm audio pin control and status */
-int snd_soc_dapm_enable_pin(struct snd_soc_dapm_context *dapm, const char *pin);
-int snd_soc_dapm_enable_pin_unlocked(struct snd_soc_dapm_context *dapm, const char *pin);
-int snd_soc_dapm_disable_pin(struct snd_soc_dapm_context *dapm, const char *pin);
-int snd_soc_dapm_disable_pin_unlocked(struct snd_soc_dapm_context *dapm, const char *pin);
-int snd_soc_dapm_get_pin_status(struct snd_soc_dapm_context *dapm, const char *pin);
-int snd_soc_dapm_sync(struct snd_soc_dapm_context *dapm);
-int snd_soc_dapm_sync_unlocked(struct snd_soc_dapm_context *dapm);
-int snd_soc_dapm_force_enable_pin(struct snd_soc_dapm_context *dapm, const char *pin);
-int snd_soc_dapm_force_enable_pin_unlocked(struct snd_soc_dapm_context *dapm, const char *pin);
-int snd_soc_dapm_ignore_suspend(struct snd_soc_dapm_context *dapm, const char *pin);
-unsigned int dapm_kcontrol_get_value(const struct snd_kcontrol *kcontrol);
-void dapm_mark_endpoints_dirty(struct snd_soc_card *card);
-
-/*
- * Marks the specified pin as being not connected, disabling it along
- * any parent or child widgets.  At present this is identical to
- * snd_soc_dapm_disable_pin[_unlocked]() but in future it will be extended to do
- * additional things such as disabling controls which only affect
- * paths through the pin.
- */
-#define snd_soc_dapm_nc_pin		snd_soc_dapm_disable_pin
-#define snd_soc_dapm_nc_pin_unlocked	snd_soc_dapm_disable_pin_unlocked
-
-/* dapm path query */
-int snd_soc_dapm_dai_get_connected_widgets(struct snd_soc_dai *dai, int stream,
-	struct snd_soc_dapm_widget_list **list,
-	bool (*custom_stop_condition)(struct snd_soc_dapm_widget *, enum snd_soc_dapm_direction));
-void snd_soc_dapm_dai_free_widgets(struct snd_soc_dapm_widget_list **list);
-
-struct snd_soc_dapm_context *snd_soc_dapm_kcontrol_dapm(struct snd_kcontrol *kcontrol);
-struct snd_soc_dapm_widget *snd_soc_dapm_kcontrol_widget(struct snd_kcontrol *kcontrol);
-
-int snd_soc_dapm_force_bias_level(struct snd_soc_dapm_context *dapm, enum snd_soc_bias_level level);
-
 /* dapm widget types */
 enum snd_soc_dapm_type {
 	snd_soc_dapm_input = 0,		/* input pin */
@@ -717,11 +609,6 @@ struct snd_soc_dapm_widget_list {
 	struct snd_soc_dapm_widget *widgets[] __counted_by(num_widgets);
 };
 
-#define for_each_dapm_widgets(list, i, widget)				\
-	for ((i) = 0;							\
-	     (i) < list->num_widgets && (widget = list->widgets[i]);	\
-	     (i)++)
-
 struct snd_soc_dapm_stats {
 	int power_checks;
 	int path_checks;
@@ -733,6 +620,114 @@ struct snd_soc_dapm_pinctrl_priv {
 	const char *sleep_state;
 };
 
+enum snd_soc_dapm_direction {
+	SND_SOC_DAPM_DIR_IN,
+	SND_SOC_DAPM_DIR_OUT
+};
+
+#define SND_SOC_DAPM_DIR_TO_EP(x) BIT(x)
+
+#define SND_SOC_DAPM_EP_SOURCE	SND_SOC_DAPM_DIR_TO_EP(SND_SOC_DAPM_DIR_IN)
+#define SND_SOC_DAPM_EP_SINK	SND_SOC_DAPM_DIR_TO_EP(SND_SOC_DAPM_DIR_OUT)
+
+int dapm_regulator_event(struct snd_soc_dapm_widget *w, struct snd_kcontrol *kcontrol, int event);
+int dapm_clock_event(struct snd_soc_dapm_widget *w, struct snd_kcontrol *kcontrol, int event);
+int dapm_pinctrl_event(struct snd_soc_dapm_widget *w, struct snd_kcontrol *kcontrol, int event);
+
+/* dapm controls */
+int snd_soc_dapm_put_volsw(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *ucontrol);
+int snd_soc_dapm_get_volsw(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *ucontrol);
+int snd_soc_dapm_get_enum_double(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *ucontrol);
+int snd_soc_dapm_put_enum_double(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *ucontrol);
+int snd_soc_dapm_info_pin_switch(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_info *uinfo);
+int snd_soc_dapm_get_pin_switch(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *uncontrol);
+int snd_soc_dapm_put_pin_switch(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *uncontrol);
+int snd_soc_dapm_get_component_pin_switch(struct snd_kcontrol *kcontrol,
+					  struct snd_ctl_elem_value *uncontrol);
+int snd_soc_dapm_put_component_pin_switch(struct snd_kcontrol *kcontrol,
+					  struct snd_ctl_elem_value *uncontrol);
+int snd_soc_dapm_new_controls(struct snd_soc_dapm_context *dapm,
+	const struct snd_soc_dapm_widget *widget, unsigned int num);
+struct snd_soc_dapm_widget *snd_soc_dapm_new_control(struct snd_soc_dapm_context *dapm,
+		const struct snd_soc_dapm_widget *widget);
+struct snd_soc_dapm_widget *snd_soc_dapm_new_control_unlocked(struct snd_soc_dapm_context *dapm,
+		const struct snd_soc_dapm_widget *widget);
+int snd_soc_dapm_new_dai_widgets(struct snd_soc_dapm_context *dapm, struct snd_soc_dai *dai);
+void snd_soc_dapm_free_widget(struct snd_soc_dapm_widget *w);
+int snd_soc_dapm_link_dai_widgets(struct snd_soc_card *card);
+void snd_soc_dapm_connect_dai_link_widgets(struct snd_soc_card *card);
+
+int snd_soc_dapm_update_dai(struct snd_pcm_substream *substream,
+			    struct snd_pcm_hw_params *params, struct snd_soc_dai *dai);
+int snd_soc_dapm_widget_name_cmp(struct snd_soc_dapm_widget *widget, const char *s);
+
+/* dapm path setup */
+int snd_soc_dapm_new_widgets(struct snd_soc_card *card);
+void snd_soc_dapm_free(struct snd_soc_dapm_context *dapm);
+void snd_soc_dapm_init(struct snd_soc_dapm_context *dapm,
+		       struct snd_soc_card *card, struct snd_soc_component *component);
+int snd_soc_dapm_add_routes(struct snd_soc_dapm_context *dapm,
+			    const struct snd_soc_dapm_route *route, int num);
+int snd_soc_dapm_del_routes(struct snd_soc_dapm_context *dapm,
+			    const struct snd_soc_dapm_route *route, int num);
+void snd_soc_dapm_free_widget(struct snd_soc_dapm_widget *w);
+
+/* dapm events */
+void snd_soc_dapm_stream_event(struct snd_soc_pcm_runtime *rtd, int stream, int event);
+void snd_soc_dapm_stream_stop(struct snd_soc_pcm_runtime *rtd, int stream);
+void snd_soc_dapm_shutdown(struct snd_soc_card *card);
+
+/* external DAPM widget events */
+int snd_soc_dapm_mixer_update_power(struct snd_soc_dapm_context *dapm,
+		struct snd_kcontrol *kcontrol, int connect, struct snd_soc_dapm_update *update);
+int snd_soc_dapm_mux_update_power(struct snd_soc_dapm_context *dapm,
+		struct snd_kcontrol *kcontrol, int mux, struct soc_enum *e,
+		struct snd_soc_dapm_update *update);
+
+/* dapm sys fs - used by the core */
+extern struct attribute *soc_dapm_dev_attrs[];
+void snd_soc_dapm_debugfs_init(struct snd_soc_dapm_context *dapm, struct dentry *parent);
+
+/* dapm audio pin control and status */
+int snd_soc_dapm_enable_pin(struct snd_soc_dapm_context *dapm, const char *pin);
+int snd_soc_dapm_enable_pin_unlocked(struct snd_soc_dapm_context *dapm, const char *pin);
+int snd_soc_dapm_disable_pin(struct snd_soc_dapm_context *dapm, const char *pin);
+int snd_soc_dapm_disable_pin_unlocked(struct snd_soc_dapm_context *dapm, const char *pin);
+int snd_soc_dapm_get_pin_status(struct snd_soc_dapm_context *dapm, const char *pin);
+int snd_soc_dapm_sync(struct snd_soc_dapm_context *dapm);
+int snd_soc_dapm_sync_unlocked(struct snd_soc_dapm_context *dapm);
+int snd_soc_dapm_force_enable_pin(struct snd_soc_dapm_context *dapm, const char *pin);
+int snd_soc_dapm_force_enable_pin_unlocked(struct snd_soc_dapm_context *dapm, const char *pin);
+int snd_soc_dapm_ignore_suspend(struct snd_soc_dapm_context *dapm, const char *pin);
+unsigned int dapm_kcontrol_get_value(const struct snd_kcontrol *kcontrol);
+void dapm_mark_endpoints_dirty(struct snd_soc_card *card);
+
+/*
+ * Marks the specified pin as being not connected, disabling it along
+ * any parent or child widgets.  At present this is identical to
+ * snd_soc_dapm_disable_pin[_unlocked]() but in future it will be extended to do
+ * additional things such as disabling controls which only affect
+ * paths through the pin.
+ */
+#define snd_soc_dapm_nc_pin		snd_soc_dapm_disable_pin
+#define snd_soc_dapm_nc_pin_unlocked	snd_soc_dapm_disable_pin_unlocked
+
+/* dapm path query */
+int snd_soc_dapm_dai_get_connected_widgets(struct snd_soc_dai *dai, int stream,
+	struct snd_soc_dapm_widget_list **list,
+	bool (*custom_stop_condition)(struct snd_soc_dapm_widget *, enum snd_soc_dapm_direction));
+void snd_soc_dapm_dai_free_widgets(struct snd_soc_dapm_widget_list **list);
+
+struct snd_soc_dapm_context *snd_soc_dapm_kcontrol_dapm(struct snd_kcontrol *kcontrol);
+struct snd_soc_dapm_widget *snd_soc_dapm_kcontrol_widget(struct snd_kcontrol *kcontrol);
+
+int snd_soc_dapm_force_bias_level(struct snd_soc_dapm_context *dapm, enum snd_soc_bias_level level);
+
+#define for_each_dapm_widgets(list, i, widget)				\
+	for ((i) = 0;							\
+	     (i) < list->num_widgets && (widget = list->widgets[i]);	\
+	     (i)++)
+
 /**
  * snd_soc_dapm_init_bias_level() - Initialize DAPM bias level
  * @dapm: The DAPM context to initialize
@@ -764,16 +759,6 @@ static inline enum snd_soc_bias_level snd_soc_dapm_get_bias_level(
 	return dapm->bias_level;
 }
 
-enum snd_soc_dapm_direction {
-	SND_SOC_DAPM_DIR_IN,
-	SND_SOC_DAPM_DIR_OUT
-};
-
-#define SND_SOC_DAPM_DIR_TO_EP(x) BIT(x)
-
-#define SND_SOC_DAPM_EP_SOURCE	SND_SOC_DAPM_DIR_TO_EP(SND_SOC_DAPM_DIR_IN)
-#define SND_SOC_DAPM_EP_SINK	SND_SOC_DAPM_DIR_TO_EP(SND_SOC_DAPM_DIR_OUT)
-
 /**
  * snd_soc_dapm_widget_for_each_path - Iterates over all paths in the
  *   specified direction of a widget
-- 
2.43.0

