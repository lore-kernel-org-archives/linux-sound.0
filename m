Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011007.outbound.protection.outlook.com [40.107.74.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF28C26B741
	for <linux-sound@vger.kernel.org>; Tue, 16 Dec 2025 02:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765851397; cv=fail; b=UMxYhfCAb+fZ2jUxn58af1X/C7zKFjV48z+DqwHLyR2PXk59hGXY7wBel2AHEOSJmGcGzsTKS+nNigP+mZRL3w9ugRshm+W8fZ9qVx5mGJVFkCgLyzI2hlv3kwT/E6r+ERxl+qMlQfnsu5ZgCButFqeYAw3zzVt+AqH/yq4M1Qw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765851397; c=relaxed/simple;
	bh=lKZISXxti+RozwduBZ6HfccpUFVw9U67LOYFp8zO2N4=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=l5zM0Hq8s2k5djp8e/Cw8t18/dwODxUnAAVWBOWEhPbI9K/Vm98qSYaGH6NzS9DnHHYmb7YipcLwktLIJ1lczotX3UB4kOAbGUF+wkPLVLv2umnl1pZv6nE28AdLK8TVBBW+WJOxd+Ui00waFZ8RAYSRihGVsYCMerhmicbhSmg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Q5afZiRX; arc=fail smtp.client-ip=40.107.74.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Q5afZiRX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r5OoatArshW80vwvYAMJ7YbxCT0seVyTIZ3RmgJ7sXtRgR+u4Dpd+A5p/5zxI03/ClO/cJ1rZNhSOHAyjJHQKM7kbpuPC0xeYugXU49D5zTVAf/RMNAOQ8I3Ib6/83tGUHnBM+/5wfytqwqy/VPPtKNiysi62rx3PAINmktVLpVaVBO/QkUcURtmKnoO3wAI0IAUW+YCifX38tAsm3hSY7UXTReNr5oU2oFlTAnsnctnHk4RMkGIeTcFMnncNpOXYQJG+qMDqQu2D93Ms3Xgdj8RKeYnZvGlQ8k1oDELgV8UYFwQtspOgIAj61b7fWvboZbdX4yrzizXooPjIWdwJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AIxXj8XKrUPORH/I7jW5i8kvqTb5NHq3FWMx1MKFYrs=;
 b=aXVsEJ7LyaZyu1vmcT23xSmq6nIHi+hakqCG2KGFANyZmSpH/33jVNUO27wQI+u/G32lpX6njpsr3XsIeMs8HXvTQP0i215oAzizAv/HpDCcBHR8Mx+NxhEEIG4eAiISmejxtx10YwrRo2fUyPWFr+9zDGKcl9n3ruOXsTHP0Rq9jOojJ8xTfKMZ0qwbFyqFy/oozSTugz+oR/ntg82ExRsoJW5JnjeMTzzNzrHmE8TbgmYrl5Rt6P0pdep9nA11ooWaLyw3lmUySzt0fCJNAqRC8NwBSIodjprc+Up6MNA5E1UqCkahTQYbfxLsSVr7ytIKnZCiKlvpUNgIGnHx8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AIxXj8XKrUPORH/I7jW5i8kvqTb5NHq3FWMx1MKFYrs=;
 b=Q5afZiRXkn9Iu8IpONxfjIX35jFXevu272nK4OufGqz1up4q6bFyRbOQIuPwO5kTXzJpP9Sz70leD/kuxXQTSwEVjb/EhIMfbHpxoxF3tZsF9yrykXRzdqc2OqvAaKT55vxVY6xRsehGgRYCe7aQhk5DwzPF1c7KTYmIYIHeyU8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB8637.jpnprd01.prod.outlook.com
 (2603:1096:400:13e::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Tue, 16 Dec
 2025 02:16:29 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9434.001; Tue, 16 Dec 2025
 02:16:29 +0000
Message-ID: <87o6nzrx1e.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 8/8] ASoC: soc-dapm: tidyup function naming
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87zf7jrx52.wl-kuninori.morimoto.gx@renesas.com>
References: <87zf7jrx52.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 16 Dec 2025 02:16:29 +0000
X-ClientProxiedBy: TYCP286CA0065.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::6) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB8637:EE_
X-MS-Office365-Filtering-Correlation-Id: a7cbc483-b725-4ad0-a63b-08de3c491fa5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QVJd9FSliI+UhHbPI6yqbhI2+KQc3NJrQkjAgTGXqokJtGad6kGgF2q3bPza?=
 =?us-ascii?Q?fzqlTOeM154zYjFU3wH3qGK2LGcYHrQ+1/4BHHozuB2aXFp6xW+c46UeM3/Q?=
 =?us-ascii?Q?5HHXBkgfCs02KReDI7K88jdi7EPORTc3lqvFh2aPR5d+ldsVQL8HC5ppkoQY?=
 =?us-ascii?Q?RBJkvfoHTmEOMpY2LWGD6PHRj9XLe2HjF6n+dKUs3v79nuxPGtf2FMbGtPBX?=
 =?us-ascii?Q?9OpCZDzimjpGyPg8q/6pHoCawNJy4YeQ4mhoqZjQy7yOaMzMT0vD+Kcv+ZLP?=
 =?us-ascii?Q?orRN+Q252QfcR4zhhaPUMUz+sNMmoY8zC0YCq+y3+NKSDsmb2K1nJRqOEXiK?=
 =?us-ascii?Q?ztk0N37cMjLWUbLsN/J63rNPGSSKUkzzHXtIVv6jw7CqfjdFCZgiX36Qv+9X?=
 =?us-ascii?Q?JOUZE2xPt+KmTA9PRq5KxTs1lmgvDeiaZMX4p7L8P6tYFvMU7X3pbzes88SC?=
 =?us-ascii?Q?XUt7e5y6y/+PsSvqlTlAJelDXJ9rY0kheWmBbs2StOo/2AEM1sx+5M836z8/?=
 =?us-ascii?Q?60M+2EUpQdJ37bMwzzMamZYFvhRLFi7BJ2wQDheGN684MMz9WLVsv9JZ+Qrs?=
 =?us-ascii?Q?VZPsbe3B1ubhU6HfpKk56wBWg6BOEvbvBQ3PEtNc3utlyhsa5Jy6S7ufbwgm?=
 =?us-ascii?Q?ZERBwl2TJ+SViML/sRF4x0wx6/aE/EMeW7NTldgYEtzyabKzt6U/keOxzCZj?=
 =?us-ascii?Q?k8qPnx3Dr/SQNxEh/rnKEYaWrp3A4MAQDoe4IB+mew8lEMIh964T1e1+M3fD?=
 =?us-ascii?Q?s8xIS3X3JO+9t96QK4D0d1mqhVpy3T8w4TrT862wsASD83fU8FMsPbkvvBSO?=
 =?us-ascii?Q?AFyWYhYEm2l0DTwrfE/pC/wFGvB/sFwdZpHaitYBm3C5yGLnv3gq1N5yq212?=
 =?us-ascii?Q?ydoLTrYlnw39FFXkTHQ0W5gOhdzhouiHJSzakfDa4uOpJn9BDlsbzTB1i+4r?=
 =?us-ascii?Q?zxX+IRmi+0AK3BlIBE0w5Nx15T8j4eHX81Hle9DY6XKQyJWklOw6TdMf9DKS?=
 =?us-ascii?Q?RzU5Iy2AWUDcnCG3kp5FyxlOeJ76sEgnaKu5+6j6lpYI6jAmuoNq/4Lj4J6y?=
 =?us-ascii?Q?3uXHnvxJo2La1H1c3QV1Myp8C/o22FH0FPr6WAXBfCFIILVE2bqVIIZzfrzE?=
 =?us-ascii?Q?409ydcJFkPGxtCHovu2Dxe4BXqi2dEuTo95wKRYzKyZDSqEvYnmmSc3hBtO2?=
 =?us-ascii?Q?osmliMsLnPrSnJywmq4tQ3EwU7vQz4oTwLLCwsYFcjLE45G+Elu9ABRb1cz1?=
 =?us-ascii?Q?rnoGHgpMvShEF/fVEVIxXxgAulmHuhE85aX6PO38Ng0mNGETTYJ9qdNYSvcA?=
 =?us-ascii?Q?LWM1aB9iVRoxVUmwcSWSIv27OkpwdtWOnJJM1RC/lmd3TY5uCMMgm39Lx/8a?=
 =?us-ascii?Q?JXuFTe40GbXjr6zTRgfJlN45TLlc/3ATQsKkOM3mFeguYEFtCjVMKFJmufQ+?=
 =?us-ascii?Q?vCrI9kwcjTdO/pqZ1mayltqyAM3zmKGyOPO6ZKzDfQYeoXgtpiNZrwuaKZBN?=
 =?us-ascii?Q?Jk83snOE8FVoOWxA4iln0Vd3yJNlSzXher8d?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cPUfpSAgsHcVNEaMhX6KHCXIN+/D6VxdaNbNNsybyIoVLFB9JYI1S5eSyEw9?=
 =?us-ascii?Q?tNxoFNjiHYW9L1M419NRc4ONkMC8ls3d6+am7XdIDKwIMRpe3/kgl0a0CPAJ?=
 =?us-ascii?Q?A0TI60WaSdYsT1oSCEy+Z0Gjh2c+zgIgUHeL4XhYo7OgYozZwJZyvCnTK9/v?=
 =?us-ascii?Q?0nuRxACZiyQg2coy3rO0m0iI2veUdxQ7wy1WI94zPFcCFLrgWiCoG+7tO3be?=
 =?us-ascii?Q?Tss3QCod9JZyW50grCIF93HjOdN5lV3MrVkQFjMpQ7JlUJ3sv2RIG3lN0a0W?=
 =?us-ascii?Q?ZB0V7JOxCQUtv4YM9DD2FsoDrgdeDxqOsvA3UxryIK2p2hAl50VmbjNrfGDS?=
 =?us-ascii?Q?PSDzmv+4HXlLRMoUnGoSCXYKV/6P6zSFy5s4HLxZg3WcTdUeWM7MmO3CjGWR?=
 =?us-ascii?Q?Ewom9C3jDlVLBpWlI0hfBYPS3RqALsOblNEbIphb9kWGj81gHBiUEzN10xCX?=
 =?us-ascii?Q?GajdmPc1560QiiJvv/I4cNOKr57xyiMa/IHO5e04Xsf8bfQ7yHTfHMOcYmaT?=
 =?us-ascii?Q?sEV6W3q+xwcZtwhL/6TtN2uExhHhVsOgGZ7agMhFQ1o3liJCbXj4kvmFlOR5?=
 =?us-ascii?Q?q2O2GJIoZ2JK0T0QFEGGYV2OM3TloxEXs8KEcIjnvOrdwTJSUZAfD4a1417F?=
 =?us-ascii?Q?MjOFw1rgB715U5qc0X59CSSrTUcRpXqSJH+VGYkm8mhOY3YJpnIlN+PV5FEz?=
 =?us-ascii?Q?vPB7gaHQbDNS0IPdmyxt2V5dEiwzra6gHrmYz2uwGRj2a33kH/4ChDdOk5dR?=
 =?us-ascii?Q?dNExY93fHSgSabdGFL85zYvEladR3SyNq3doCj3eTS7fhZRz3WgDNxAr4kmX?=
 =?us-ascii?Q?Es0ESIJfyIOFXEsFec8SHeMIxdZkp0UCRDMLtrr/Zfm1taYTTqrNOyQ+4s5a?=
 =?us-ascii?Q?F1QjS1efR981zaP9ZYuHSJjKmXIXfLbe0JP0n3c+X1IhbQlfBKEPum9PqYOl?=
 =?us-ascii?Q?hicaw7nmP/FoRNyKF78dyokI4I0acVXUYgSuK0bbYNIMAciJGSDZjspOifZW?=
 =?us-ascii?Q?It5FgyZf1EtHWWoJvey0bOxS+1u+CBkthfczx6xHf1H3FXoYKK+1RLM5R4dk?=
 =?us-ascii?Q?k9tY3/AIlQ7eVFphnH0VUXuY5bMyEpw6bL2ddwi+b9Gf9mL+RXxeH/Ms8Q7g?=
 =?us-ascii?Q?6sJ8KoFH8T1AeYEmakPw80uZ7VDdjTCb6VbhRGCmQqAIjrcT68L8Y42rSZe5?=
 =?us-ascii?Q?4riQKyBHJIQvXU91UOz7/r6CUuqmbqdBzMHPYinwoSPjatmoqSTnU5grZGL8?=
 =?us-ascii?Q?V/c/kTk3TK/3qqdL/I5aFwjZoxPDGAWzsLiazGR2JeQKjkGWqnSSYjp24oCw?=
 =?us-ascii?Q?Caz9ppj99XfArLKFVJ05VXXwh8bnjbZkzhBgE3JHByS1+GKRcAPs0jLPDMua?=
 =?us-ascii?Q?kA7hrf9+m//zi7EPV9BvheNZz+mcMfO55Ngqo2+ZGnHly7gvHXX5PRlH1bNi?=
 =?us-ascii?Q?VUIQk+AIqThWPg5p0mtsfaV9m6CDEscVXzn1WGdrrs0zn/aw1D6ticYg423m?=
 =?us-ascii?Q?63+8Mhv0Js4miZaPLqbKsivciVQ1PxFIiHQBymE9kjWDok5cWnwVvowxCVUw?=
 =?us-ascii?Q?7Jbmsq5qMLW+RVQHlngQswr1CH+dRaltfVXh3cfsPystiHI3ofBO9zRy2Qxw?=
 =?us-ascii?Q?nPckVzbnFDCgFDJeeqk0300=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7cbc483-b725-4ad0-a63b-08de3c491fa5
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 02:16:29.5934
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GhJg1JN9xqc67QJ8nnyXaqg9c9XA/P+wEo5GgJ46iXmfzcQr6/lVN7gCsOFTIMttwi1NC+tGCFHzn2UZShGFHWKN5uBbEoQYPaO3YyOEDvBuwbvLUrlVoULgRU7CIsod
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8637

Current soc-dapm is using random naming. Unified as dapm_xxx() for
static functions.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-dapm.c | 318 +++++++++++++++++++++----------------------
 1 file changed, 157 insertions(+), 161 deletions(-)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 07370215ea7cc..c23ccf4a602d1 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -63,10 +63,10 @@ struct snd_soc_dapm_context {
 
 #define DAPM_UPDATE_STAT(widget, val) widget->dapm->card->dapm_stats.val++;
 
-#define SND_SOC_DAPM_DIR_REVERSE(x) ((x == SND_SOC_DAPM_DIR_IN) ? \
+#define DAPM_DIR_REVERSE(x) ((x == SND_SOC_DAPM_DIR_IN) ? \
 	SND_SOC_DAPM_DIR_OUT : SND_SOC_DAPM_DIR_IN)
 
-#define snd_soc_dapm_for_each_direction(dir) \
+#define dapm_for_each_direction(dir) \
 	for ((dir) = SND_SOC_DAPM_DIR_IN; (dir) <= SND_SOC_DAPM_DIR_OUT; \
 		(dir)++)
 
@@ -159,14 +159,14 @@ static void dapm_assert_locked(struct snd_soc_dapm_context *dapm)
 		snd_soc_dapm_mutex_assert_held(dapm);
 }
 
-static void pop_wait(u32 pop_time)
+static void dapm_pop_wait(u32 pop_time)
 {
 	if (pop_time)
 		schedule_timeout_uninterruptible(msecs_to_jiffies(pop_time));
 }
 
 __printf(3, 4)
-static void pop_dbg(struct device *dev, u32 pop_time, const char *fmt, ...)
+static void dapm_pop_dbg(struct device *dev, u32 pop_time, const char *fmt, ...)
 {
 	va_list args;
 	char *buf;
@@ -240,7 +240,7 @@ static void dapm_mark_dirty(struct snd_soc_dapm_widget *w, const char *reason)
 static __always_inline void dapm_widget_invalidate_paths(
 	struct snd_soc_dapm_widget *w, enum snd_soc_dapm_direction dir)
 {
-	enum snd_soc_dapm_direction rdir = SND_SOC_DAPM_DIR_REVERSE(dir);
+	enum snd_soc_dapm_direction rdir = DAPM_DIR_REVERSE(dir);
 	struct snd_soc_dapm_widget *node;
 	struct snd_soc_dapm_path *p;
 	LIST_HEAD(list);
@@ -387,7 +387,7 @@ struct dapm_kcontrol_data {
 	struct snd_soc_dapm_widget_list *wlist;
 };
 
-static unsigned int soc_dapm_read(struct snd_soc_dapm_context *dapm, int reg)
+static unsigned int dapm_read(struct snd_soc_dapm_context *dapm, int reg)
 {
 	if (!dapm->component)
 		return -EIO;
@@ -407,7 +407,7 @@ static void dapm_set_mixer_path_status(struct snd_soc_dapm_path *p, int i,
 		unsigned int shift = mc->shift;
 		unsigned int max = mc->max;
 		unsigned int mask = (1 << fls(max)) - 1;
-		unsigned int val = soc_dapm_read(p->sink->dapm, reg);
+		unsigned int val = dapm_read(p->sink->dapm, reg);
 
 		/*
 		 * The nth_path argument allows this function to know
@@ -423,7 +423,7 @@ static void dapm_set_mixer_path_status(struct snd_soc_dapm_path *p, int i,
 		 */
 		if (snd_soc_volsw_is_stereo(mc) && nth_path > 0) {
 			if (reg != mc->rreg)
-				val = soc_dapm_read(p->sink->dapm, mc->rreg);
+				val = dapm_read(p->sink->dapm, mc->rreg);
 			val = (val >> mc->rshift) & mask;
 		} else {
 			val = (val >> shift) & mask;
@@ -455,7 +455,7 @@ static int dapm_connect_mux(struct snd_soc_dapm_context *dapm,
 	if (e->reg != SND_SOC_NOPM) {
 		unsigned int val;
 
-		val = soc_dapm_read(dapm, e->reg);
+		val = dapm_read(dapm, e->reg);
 		val = (val >> e->shift_l) & e->mask;
 		item = snd_soc_enum_val_to_item(e, val);
 	} else {
@@ -543,7 +543,7 @@ static void dapm_update_widget_flags(struct snd_soc_dapm_widget *w)
 		break;
 	case snd_soc_dapm_line:
 		ep = 0;
-		snd_soc_dapm_for_each_direction(dir) {
+		dapm_for_each_direction(dir) {
 			if (!list_empty(&w->edges[dir]))
 				ep |= SND_SOC_DAPM_DIR_TO_EP(dir);
 		}
@@ -555,7 +555,7 @@ static void dapm_update_widget_flags(struct snd_soc_dapm_widget *w)
 	w->is_ep = ep;
 }
 
-static int snd_soc_dapm_check_dynamic_path(
+static int dapm_check_dynamic_path(
 	struct snd_soc_dapm_context *dapm,
 	struct snd_soc_dapm_widget *source, struct snd_soc_dapm_widget *sink,
 	const char *control)
@@ -601,7 +601,7 @@ static int snd_soc_dapm_check_dynamic_path(
 	return 0;
 }
 
-static int snd_soc_dapm_add_path(
+static int dapm_add_path(
 	struct snd_soc_dapm_context *dapm,
 	struct snd_soc_dapm_widget *wsource, struct snd_soc_dapm_widget *wsink,
 	const char *control,
@@ -634,7 +634,7 @@ static int snd_soc_dapm_add_path(
 		return -EINVAL;
 	}
 
-	ret = snd_soc_dapm_check_dynamic_path(dapm, wsource, wsink, control);
+	ret = dapm_check_dynamic_path(dapm, wsource, wsink, control);
 	if (ret)
 		return ret;
 
@@ -686,10 +686,10 @@ static int snd_soc_dapm_add_path(
 
 	list_add(&path->list, &dapm->card->paths);
 
-	snd_soc_dapm_for_each_direction(dir)
+	dapm_for_each_direction(dir)
 		list_add(&path->list_node[dir], &path->node[dir]->edges[dir]);
 
-	snd_soc_dapm_for_each_direction(dir) {
+	dapm_for_each_direction(dir) {
 		dapm_update_widget_flags(path->node[dir]);
 		dapm_mark_dirty(path->node[dir], "Route added");
 	}
@@ -797,10 +797,10 @@ static int dapm_kcontrol_data_alloc(struct snd_soc_dapm_widget *widget,
 				goto err_data;
 			}
 
-			snd_soc_dapm_add_path(widget->dapm, data->widget,
-					      widget, NULL, NULL);
+			dapm_add_path(widget->dapm, data->widget,
+				      widget, NULL, NULL);
 		} else if (e->reg != SND_SOC_NOPM) {
-			data->value = soc_dapm_read(widget->dapm, e->reg) &
+			data->value = dapm_read(widget->dapm, e->reg) &
 				      (e->mask << e->shift_l);
 		}
 		break;
@@ -980,14 +980,14 @@ static void dapm_reset(struct snd_soc_card *card)
 	}
 }
 
-static const char *soc_dapm_prefix(struct snd_soc_dapm_context *dapm)
+static const char *dapm_prefix(struct snd_soc_dapm_context *dapm)
 {
 	if (!dapm->component)
 		return NULL;
 	return dapm->component->name_prefix;
 }
 
-static int soc_dapm_update_bits(struct snd_soc_dapm_context *dapm,
+static int dapm_update_bits(struct snd_soc_dapm_context *dapm,
 	int reg, unsigned int mask, unsigned int value)
 {
 	if (!dapm->component)
@@ -996,7 +996,7 @@ static int soc_dapm_update_bits(struct snd_soc_dapm_context *dapm,
 					     mask, value);
 }
 
-static int soc_dapm_test_bits(struct snd_soc_dapm_context *dapm,
+static int dapm_test_bits(struct snd_soc_dapm_context *dapm,
 	int reg, unsigned int mask, unsigned int value)
 {
 	if (!dapm->component)
@@ -1004,7 +1004,7 @@ static int soc_dapm_test_bits(struct snd_soc_dapm_context *dapm,
 	return snd_soc_component_test_bits(dapm->component, reg, mask, value);
 }
 
-static void soc_dapm_async_complete(struct snd_soc_dapm_context *dapm)
+static void dapm_async_complete(struct snd_soc_dapm_context *dapm)
 {
 	if (dapm->component)
 		snd_soc_component_async_complete(dapm->component);
@@ -1175,7 +1175,7 @@ static int dapm_create_or_share_kcontrol(struct snd_soc_dapm_widget *w,
 	const char *name;
 	int ret = 0;
 
-	prefix = soc_dapm_prefix(dapm);
+	prefix = dapm_prefix(dapm);
 	if (prefix)
 		prefix_len = strlen(prefix) + 1;
 	else
@@ -1295,10 +1295,10 @@ static int dapm_new_mixer(struct snd_soc_dapm_widget *w)
 
 			data = snd_kcontrol_chip(w->kcontrols[i]);
 			if (data->widget)
-				snd_soc_dapm_add_path(data->widget->dapm,
-						      data->widget,
-						      path->source,
-						      NULL, NULL);
+				dapm_add_path(data->widget->dapm,
+					      data->widget,
+					      path->source,
+					      NULL, NULL);
 		}
 	}
 
@@ -1402,7 +1402,7 @@ static int dapm_new_dai_link(struct snd_soc_dapm_widget *w)
  * the ALSA card - when we are suspending the ALSA state for the card
  * is set to D3.
  */
-static int snd_soc_dapm_suspend_check(struct snd_soc_dapm_widget *widget)
+static int dapm_suspend_check(struct snd_soc_dapm_widget *widget)
 {
 	struct device *dev = snd_soc_dapm_to_dev(widget->dapm);
 	int level = snd_power_get_state(widget->dapm->card->snd_card);
@@ -1454,10 +1454,10 @@ static int dapm_widget_list_create(struct snd_soc_dapm_widget_list **list,
  * widget and all widgets that can be reached via incoming or outcoming paths
  * from the widget.
  */
-static void invalidate_paths_ep(struct snd_soc_dapm_widget *widget,
+static void dapm_invalidate_paths_ep(struct snd_soc_dapm_widget *widget,
 	enum snd_soc_dapm_direction dir)
 {
-	enum snd_soc_dapm_direction rdir = SND_SOC_DAPM_DIR_REVERSE(dir);
+	enum snd_soc_dapm_direction rdir = DAPM_DIR_REVERSE(dir);
 	struct snd_soc_dapm_path *path;
 
 	widget->endpoints[dir] = -1;
@@ -1471,7 +1471,7 @@ static void invalidate_paths_ep(struct snd_soc_dapm_widget *widget,
 
 		if (path->connect) {
 			path->walking = 1;
-			invalidate_paths_ep(path->node[dir], dir);
+			dapm_invalidate_paths_ep(path->node[dir], dir);
 			path->walking = 0;
 		}
 	}
@@ -1484,7 +1484,7 @@ static void invalidate_paths_ep(struct snd_soc_dapm_widget *widget,
  * generic function and at the same time the fast path of the specialized
  * functions is significantly smaller than the generic function.
  */
-static __always_inline int is_connected_ep(struct snd_soc_dapm_widget *widget,
+static __always_inline int dapm_is_connected_ep(struct snd_soc_dapm_widget *widget,
 	struct list_head *list, enum snd_soc_dapm_direction dir,
 	int (*fn)(struct snd_soc_dapm_widget *, struct list_head *,
 		  bool (*custom_stop_condition)(struct snd_soc_dapm_widget *,
@@ -1492,7 +1492,7 @@ static __always_inline int is_connected_ep(struct snd_soc_dapm_widget *widget,
 	bool (*custom_stop_condition)(struct snd_soc_dapm_widget *,
 				      enum snd_soc_dapm_direction))
 {
-	enum snd_soc_dapm_direction rdir = SND_SOC_DAPM_DIR_REVERSE(dir);
+	enum snd_soc_dapm_direction rdir = DAPM_DIR_REVERSE(dir);
 	struct snd_soc_dapm_path *path;
 	int con = 0;
 
@@ -1511,7 +1511,7 @@ static __always_inline int is_connected_ep(struct snd_soc_dapm_widget *widget,
 	}
 
 	if ((widget->is_ep & SND_SOC_DAPM_DIR_TO_EP(dir)) && widget->connected) {
-		widget->endpoints[dir] = snd_soc_dapm_suspend_check(widget);
+		widget->endpoints[dir] = dapm_suspend_check(widget);
 		return widget->endpoints[dir];
 	}
 
@@ -1547,13 +1547,13 @@ static __always_inline int is_connected_ep(struct snd_soc_dapm_widget *widget,
  * direction as an arguments, it should return true if widgets from that point
  * in the graph onwards should not be added to the widget list.
  */
-static int is_connected_output_ep(struct snd_soc_dapm_widget *widget,
+static int dapm_is_connected_output_ep(struct snd_soc_dapm_widget *widget,
 	struct list_head *list,
 	bool (*custom_stop_condition)(struct snd_soc_dapm_widget *i,
 				      enum snd_soc_dapm_direction))
 {
-	return is_connected_ep(widget, list, SND_SOC_DAPM_DIR_OUT,
-			is_connected_output_ep, custom_stop_condition);
+	return dapm_is_connected_ep(widget, list, SND_SOC_DAPM_DIR_OUT,
+			dapm_is_connected_output_ep, custom_stop_condition);
 }
 
 /*
@@ -1565,13 +1565,13 @@ static int is_connected_output_ep(struct snd_soc_dapm_widget *widget,
  * direction as an arguments, it should return true if the walk should be
  * stopped and false otherwise.
  */
-static int is_connected_input_ep(struct snd_soc_dapm_widget *widget,
+static int dapm_is_connected_input_ep(struct snd_soc_dapm_widget *widget,
 	struct list_head *list,
 	bool (*custom_stop_condition)(struct snd_soc_dapm_widget *i,
 				      enum snd_soc_dapm_direction))
 {
-	return is_connected_ep(widget, list, SND_SOC_DAPM_DIR_IN,
-			is_connected_input_ep, custom_stop_condition);
+	return dapm_is_connected_ep(widget, list, SND_SOC_DAPM_DIR_IN,
+			dapm_is_connected_input_ep, custom_stop_condition);
 }
 
 /**
@@ -1607,12 +1607,12 @@ int snd_soc_dapm_dai_get_connected_widgets(struct snd_soc_dai *dai, int stream,
 	snd_soc_dapm_mutex_lock(card);
 
 	if (stream == SNDRV_PCM_STREAM_PLAYBACK) {
-		invalidate_paths_ep(w, SND_SOC_DAPM_DIR_OUT);
-		paths = is_connected_output_ep(w, &widgets,
+		dapm_invalidate_paths_ep(w, SND_SOC_DAPM_DIR_OUT);
+		paths = dapm_is_connected_output_ep(w, &widgets,
 				custom_stop_condition);
 	} else {
-		invalidate_paths_ep(w, SND_SOC_DAPM_DIR_IN);
-		paths = is_connected_input_ep(w, &widgets,
+		dapm_invalidate_paths_ep(w, SND_SOC_DAPM_DIR_IN);
+		paths = dapm_is_connected_input_ep(w, &widgets,
 				custom_stop_condition);
 	}
 
@@ -1645,7 +1645,7 @@ int snd_soc_dapm_regulator_event(struct snd_soc_dapm_widget *w,
 	struct device *dev = snd_soc_dapm_to_dev(w->dapm);
 	int ret;
 
-	soc_dapm_async_complete(w->dapm);
+	dapm_async_complete(w->dapm);
 
 	if (SND_SOC_DAPM_EVENT_ON(event)) {
 		if (w->on_val & SND_SOC_DAPM_REGULATOR_BYPASS) {
@@ -1705,7 +1705,7 @@ int snd_soc_dapm_clock_event(struct snd_soc_dapm_widget *w,
 	if (!w->clk)
 		return -EIO;
 
-	soc_dapm_async_complete(w->dapm);
+	dapm_async_complete(w->dapm);
 
 	if (SND_SOC_DAPM_EVENT_ON(event)) {
 		return clk_prepare_enable(w->clk);
@@ -1740,8 +1740,8 @@ static int dapm_generic_check_power(struct snd_soc_dapm_widget *w)
 
 	DAPM_UPDATE_STAT(w, power_checks);
 
-	in = is_connected_input_ep(w, NULL, NULL);
-	out = is_connected_output_ep(w, NULL, NULL);
+	in  = dapm_is_connected_input_ep(w, NULL, NULL);
+	out = dapm_is_connected_output_ep(w, NULL, NULL);
 	return out != 0 && in != 0;
 }
 
@@ -1864,9 +1864,9 @@ static void dapm_seq_check_event(struct snd_soc_card *card,
 	if (w->event && (w->event_flags & event)) {
 		int ret;
 
-		pop_dbg(dev, card->pop_time, "pop test : %s %s\n",
+		dapm_pop_dbg(dev, card->pop_time, "pop test : %s %s\n",
 			w->name, ev_name);
-		soc_dapm_async_complete(w->dapm);
+		dapm_async_complete(w->dapm);
 		trace_snd_soc_dapm_widget_event_start(w, event);
 		ret = w->event(w, NULL, event);
 		trace_snd_soc_dapm_widget_event_done(w, event);
@@ -1901,7 +1901,7 @@ static void dapm_seq_run_coalesced(struct snd_soc_card *card,
 		else
 			value |= w->off_val << w->shift;
 
-		pop_dbg(dev, card->pop_time,
+		dapm_pop_dbg(dev, card->pop_time,
 			"pop test : Queue %s: reg=0x%x, 0x%x/0x%x\n",
 			w->name, reg, value, mask);
 
@@ -1915,11 +1915,11 @@ static void dapm_seq_run_coalesced(struct snd_soc_card *card,
 		 * same register.
 		 */
 
-		pop_dbg(dev, card->pop_time,
+		dapm_pop_dbg(dev, card->pop_time,
 			"pop test : Applying 0x%x/0x%x to %x in %dms\n",
 			value, mask, reg, card->pop_time);
-		pop_wait(card->pop_time);
-		soc_dapm_update_bits(dapm, reg, mask, value);
+		dapm_pop_wait(card->pop_time);
+		dapm_update_bits(dapm, reg, mask, value);
 	}
 
 	list_for_each_entry(w, pending, power_list) {
@@ -1973,7 +1973,7 @@ static void dapm_seq_run(struct snd_soc_card *card,
 			}
 
 			if (cur_dapm && w->dapm != cur_dapm)
-				soc_dapm_async_complete(cur_dapm);
+				dapm_async_complete(cur_dapm);
 
 			INIT_LIST_HEAD(&pending);
 			cur_sort = -1;
@@ -2034,7 +2034,7 @@ static void dapm_seq_run(struct snd_soc_card *card,
 	}
 
 	for_each_card_dapms(card, d)
-		soc_dapm_async_complete(d);
+		dapm_async_complete(d);
 }
 
 static void dapm_widget_update(struct snd_soc_card *card, struct snd_soc_dapm_update *update)
@@ -2062,14 +2062,14 @@ static void dapm_widget_update(struct snd_soc_card *card, struct snd_soc_dapm_up
 	if (!w)
 		return;
 
-	ret = soc_dapm_update_bits(w->dapm, update->reg, update->mask,
+	ret = dapm_update_bits(w->dapm, update->reg, update->mask,
 		update->val);
 	if (ret < 0)
 		dev_err(dev, "ASoC: %s DAPM update failed: %d\n",
 			w->name, ret);
 
 	if (update->has_second_set) {
-		ret = soc_dapm_update_bits(w->dapm, update->reg2,
+		ret = dapm_update_bits(w->dapm, update->reg2,
 					   update->mask2, update->val2);
 		if (ret < 0)
 			dev_err(dev,
@@ -2384,9 +2384,9 @@ static int dapm_power_widgets(struct snd_soc_card *card, int event,
 			return ret;
 	}
 
-	pop_dbg(card->dev, card->pop_time,
+	dapm_pop_dbg(card->dev, card->pop_time,
 		"DAPM sequencing finished, waiting %dms\n", card->pop_time);
-	pop_wait(card->pop_time);
+	dapm_pop_wait(card->pop_time);
 
 	trace_snd_soc_dapm_done(card, event);
 
@@ -2395,7 +2395,7 @@ static int dapm_power_widgets(struct snd_soc_card *card, int event,
 
 #ifdef CONFIG_DEBUG_FS
 
-static const char * const snd_soc_dapm_type_name[] = {
+static const char * const dapm_type_name[] = {
 	[snd_soc_dapm_input]            = "input",
 	[snd_soc_dapm_output]           = "output",
 	[snd_soc_dapm_mux]              = "mux",
@@ -2448,7 +2448,7 @@ static ssize_t dapm_widget_power_read_file(struct file *file,
 	struct snd_soc_dapm_path *p = NULL;
 	const char *c_name;
 
-	BUILD_BUG_ON(ARRAY_SIZE(snd_soc_dapm_type_name) != SND_SOC_DAPM_TYPE_COUNT);
+	BUILD_BUG_ON(ARRAY_SIZE(dapm_type_name) != SND_SOC_DAPM_TYPE_COUNT);
 
 	buf = kmalloc(PAGE_SIZE, GFP_KERNEL);
 	if (!buf)
@@ -2456,13 +2456,13 @@ static ssize_t dapm_widget_power_read_file(struct file *file,
 
 	snd_soc_dapm_mutex_lock_root(w->dapm);
 
-	/* Supply widgets are not handled by is_connected_{input,output}_ep() */
+	/* Supply widgets are not handled by dapm_is_connected_{input,output}_ep() */
 	if (w->is_supply) {
 		in = 0;
 		out = 0;
 	} else {
-		in = is_connected_input_ep(w, NULL, NULL);
-		out = is_connected_output_ep(w, NULL, NULL);
+		in  = dapm_is_connected_input_ep(w, NULL, NULL);
+		out = dapm_is_connected_output_ep(w, NULL, NULL);
 	}
 
 	ret = scnprintf(buf, PAGE_SIZE, "%s: %s%s  in %d out %d",
@@ -2482,10 +2482,10 @@ static ssize_t dapm_widget_power_read_file(struct file *file,
 				w->active ? "active" : "inactive");
 
 	ret += scnprintf(buf + ret, PAGE_SIZE - ret, " widget-type %s\n",
-			 snd_soc_dapm_type_name[w->id]);
+			 dapm_type_name[w->id]);
 
-	snd_soc_dapm_for_each_direction(dir) {
-		rdir = SND_SOC_DAPM_DIR_REVERSE(dir);
+	dapm_for_each_direction(dir) {
+		rdir = DAPM_DIR_REVERSE(dir);
 		snd_soc_dapm_widget_for_each_path(w, dir, p) {
 			if (p->connected && !p->connected(p->source, p->sink))
 				continue;
@@ -2612,13 +2612,13 @@ static inline void dapm_debugfs_cleanup(struct snd_soc_dapm_context *dapm)
 #endif
 
 /*
- * soc_dapm_connect_path() - Connects or disconnects a path
+ * dapm_connect_path() - Connects or disconnects a path
  * @path: The path to update
  * @connect: The new connect state of the path. True if the path is connected,
  *  false if it is disconnected.
  * @reason: The reason why the path changed (for debugging only)
  */
-static void soc_dapm_connect_path(struct snd_soc_dapm_path *path,
+static void dapm_connect_path(struct snd_soc_dapm_path *path,
 	bool connect, const char *reason)
 {
 	if (path->connect == connect)
@@ -2631,10 +2631,10 @@ static void soc_dapm_connect_path(struct snd_soc_dapm_path *path,
 }
 
 /* test and update the power status of a mux widget */
-static int soc_dapm_mux_update_power(struct snd_soc_card *card,
-				     struct snd_kcontrol *kcontrol,
-				     struct snd_soc_dapm_update *update,
-				     int mux, struct soc_enum *e)
+static int dapm_mux_update_power(struct snd_soc_card *card,
+				 struct snd_kcontrol *kcontrol,
+				 struct snd_soc_dapm_update *update,
+				 int mux, struct soc_enum *e)
 {
 	struct snd_soc_dapm_path *path;
 	int found = 0;
@@ -2651,7 +2651,7 @@ static int soc_dapm_mux_update_power(struct snd_soc_card *card,
 		else
 			connect = false;
 
-		soc_dapm_connect_path(path, connect, "mux update");
+		dapm_connect_path(path, connect, "mux update");
 	}
 
 	if (found)
@@ -2668,7 +2668,7 @@ int snd_soc_dapm_mux_update_power(struct snd_soc_dapm_context *dapm,
 	int ret;
 
 	snd_soc_dapm_mutex_lock(card);
-	ret = soc_dapm_mux_update_power(card, kcontrol, update, mux, e);
+	ret = dapm_mux_update_power(card, kcontrol, update, mux, e);
 	snd_soc_dapm_mutex_unlock(card);
 	if (ret > 0)
 		snd_soc_dpcm_runtime_update(card);
@@ -2677,10 +2677,10 @@ int snd_soc_dapm_mux_update_power(struct snd_soc_dapm_context *dapm,
 EXPORT_SYMBOL_GPL(snd_soc_dapm_mux_update_power);
 
 /* test and update the power status of a mixer or switch widget */
-static int soc_dapm_mixer_update_power(struct snd_soc_card *card,
-				       struct snd_kcontrol *kcontrol,
-				       struct snd_soc_dapm_update *update,
-				       int connect, int rconnect)
+static int dapm_mixer_update_power(struct snd_soc_card *card,
+				   struct snd_kcontrol *kcontrol,
+				   struct snd_soc_dapm_update *update,
+				   int connect, int rconnect)
 {
 	struct snd_soc_dapm_path *path;
 	int found = 0;
@@ -2712,9 +2712,9 @@ static int soc_dapm_mixer_update_power(struct snd_soc_card *card,
 		 * channel.
 		 */
 		if (found && rconnect >= 0)
-			soc_dapm_connect_path(path, rconnect, "mixer update");
+			dapm_connect_path(path, rconnect, "mixer update");
 		else
-			soc_dapm_connect_path(path, connect, "mixer update");
+			dapm_connect_path(path, connect, "mixer update");
 		found = 1;
 	}
 
@@ -2732,7 +2732,7 @@ int snd_soc_dapm_mixer_update_power(struct snd_soc_dapm_context *dapm,
 	int ret;
 
 	snd_soc_dapm_mutex_lock(card);
-	ret = soc_dapm_mixer_update_power(card, kcontrol, update, connect, -1);
+	ret = dapm_mixer_update_power(card, kcontrol, update, connect, -1);
 	snd_soc_dapm_mutex_unlock(card);
 	if (ret > 0)
 		snd_soc_dpcm_runtime_update(card);
@@ -2862,7 +2862,7 @@ void snd_soc_dapm_free_widget(struct snd_soc_dapm_widget *w)
 	 * While removing the path, remove reference to it from both
 	 * source and sink widgets so that path is removed only once.
 	 */
-	snd_soc_dapm_for_each_direction(dir) {
+	dapm_for_each_direction(dir) {
 		snd_soc_dapm_widget_for_each_path_safe(w, dir, p, next_p)
 			dapm_free_path(p);
 	}
@@ -2899,7 +2899,7 @@ static struct snd_soc_dapm_widget *dapm_find_widget(
 	struct snd_soc_dapm_widget *fallback = NULL;
 	char prefixed_pin[80];
 	const char *pin_name;
-	const char *prefix = soc_dapm_prefix(dapm);
+	const char *prefix = dapm_prefix(dapm);
 
 	if (prefix) {
 		snprintf(prefixed_pin, sizeof(prefixed_pin), "%s %s",
@@ -2929,8 +2929,8 @@ static struct snd_soc_dapm_widget *dapm_find_widget(
  * returns 1 when the value has been updated, 0 when unchanged, or a negative
  * error code; called from kcontrol put callback
  */
-static int __snd_soc_dapm_set_pin(struct snd_soc_dapm_context *dapm,
-				  const char *pin, int status)
+static int __dapm_set_pin(struct snd_soc_dapm_context *dapm,
+			  const char *pin, int status)
 {
 	struct snd_soc_dapm_widget *w = dapm_find_widget(dapm, pin, true);
 	struct device *dev = snd_soc_dapm_to_dev(dapm);
@@ -2958,13 +2958,13 @@ static int __snd_soc_dapm_set_pin(struct snd_soc_dapm_context *dapm,
 }
 
 /*
- * similar as __snd_soc_dapm_set_pin(), but returns 0 when successful;
+ * similar as __dapm_set_pin(), but returns 0 when successful;
  * called from several API functions below
  */
-static int snd_soc_dapm_set_pin(struct snd_soc_dapm_context *dapm,
+static int dapm_set_pin(struct snd_soc_dapm_context *dapm,
 				const char *pin, int status)
 {
-	int ret = __snd_soc_dapm_set_pin(dapm, pin, status);
+	int ret = __dapm_set_pin(dapm, pin, status);
 
 	return ret < 0 ? ret : 0;
 }
@@ -3032,9 +3032,9 @@ static int dapm_update_dai_chan(struct snd_soc_dapm_path *p,
 		p->source->name, p->sink->name);
 
 	if (w->channel < channels)
-		soc_dapm_connect_path(p, true, "dai update");
+		dapm_connect_path(p, true, "dai update");
 	else
-		soc_dapm_connect_path(p, false, "dai update");
+		dapm_connect_path(p, false, "dai update");
 
 	return 0;
 }
@@ -3112,7 +3112,7 @@ static int snd_soc_dapm_add_route(struct snd_soc_dapm_context *dapm,
 	unsigned int source_ref = 0;
 	int ret;
 
-	prefix = soc_dapm_prefix(dapm);
+	prefix = dapm_prefix(dapm);
 	if (prefix) {
 		snprintf(prefixed_sink, sizeof(prefixed_sink), "%s %s",
 			 prefix, route->sink);
@@ -3181,7 +3181,7 @@ static int snd_soc_dapm_add_route(struct snd_soc_dapm_context *dapm,
 	dapm->wcache_sink	= wsink;
 	dapm->wcache_source	= wsource;
 
-	ret = snd_soc_dapm_add_path(dapm, wsource, wsink, route->control,
+	ret = dapm_add_path(dapm, wsource, wsink, route->control,
 		route->connected);
 err:
 	if (ret)
@@ -3211,7 +3211,7 @@ static int snd_soc_dapm_del_route(struct snd_soc_dapm_context *dapm,
 		return -EINVAL;
 	}
 
-	prefix = soc_dapm_prefix(dapm);
+	prefix = dapm_prefix(dapm);
 	if (prefix) {
 		snprintf(prefixed_sink, sizeof(prefixed_sink), "%s %s",
 			 prefix, route->sink);
@@ -3365,7 +3365,7 @@ int snd_soc_dapm_new_widgets(struct snd_soc_card *card)
 
 		/* Read the initial power state from the device */
 		if (w->reg >= 0) {
-			val = soc_dapm_read(w->dapm, w->reg);
+			val = dapm_read(w->dapm, w->reg);
 			val = val >> w->shift;
 			val &= w->mask;
 			if (val == w->on_val)
@@ -3409,11 +3409,11 @@ int snd_soc_dapm_get_volsw(struct snd_kcontrol *kcontrol,
 
 	snd_soc_dapm_mutex_lock(dapm);
 	if (dapm_kcontrol_is_powered(kcontrol) && reg != SND_SOC_NOPM) {
-		reg_val = soc_dapm_read(dapm, reg);
+		reg_val = dapm_read(dapm, reg);
 		val = (reg_val >> shift) & mask;
 
 		if (reg != mc->rreg)
-			reg_val = soc_dapm_read(dapm, mc->rreg);
+			reg_val = dapm_read(dapm, mc->rreg);
 
 		if (snd_soc_volsw_is_stereo(mc))
 			rval = (reg_val >> mc->rshift) & mask;
@@ -3497,12 +3497,12 @@ int snd_soc_dapm_put_volsw(struct snd_kcontrol *kcontrol,
 		val = val << shift;
 		rval = rval << mc->rshift;
 
-		reg_change = soc_dapm_test_bits(dapm, reg, mask << shift, val);
+		reg_change = dapm_test_bits(dapm, reg, mask << shift, val);
 
 		if (snd_soc_volsw_is_stereo(mc))
-			reg_change |= soc_dapm_test_bits(dapm, mc->rreg,
-							 mask << mc->rshift,
-							 rval);
+			reg_change |= dapm_test_bits(dapm, mc->rreg,
+						     mask << mc->rshift,
+						     rval);
 	}
 
 	if (change || reg_change) {
@@ -3519,7 +3519,7 @@ int snd_soc_dapm_put_volsw(struct snd_kcontrol *kcontrol,
 			update.val = val;
 			pupdate = &update;
 		}
-		ret = soc_dapm_mixer_update_power(card, kcontrol, pupdate, connect, rconnect);
+		ret = dapm_mixer_update_power(card, kcontrol, pupdate, connect, rconnect);
 	}
 
 	snd_soc_dapm_mutex_unlock(card);
@@ -3549,7 +3549,7 @@ int snd_soc_dapm_get_enum_double(struct snd_kcontrol *kcontrol,
 
 	snd_soc_dapm_mutex_lock(dapm);
 	if (e->reg != SND_SOC_NOPM && dapm_kcontrol_is_powered(kcontrol)) {
-		reg_val = soc_dapm_read(dapm, e->reg);
+		reg_val = dapm_read(dapm, e->reg);
 	} else {
 		reg_val = snd_soc_dapm_kcontrol_get_value(kcontrol);
 	}
@@ -3606,7 +3606,7 @@ int snd_soc_dapm_put_enum_double(struct snd_kcontrol *kcontrol,
 	change = dapm_kcontrol_set_value(kcontrol, val);
 
 	if (e->reg != SND_SOC_NOPM)
-		reg_change = soc_dapm_test_bits(dapm, e->reg, mask, val);
+		reg_change = dapm_test_bits(dapm, e->reg, mask, val);
 
 	if (change || reg_change) {
 		if (reg_change) {
@@ -3616,7 +3616,7 @@ int snd_soc_dapm_put_enum_double(struct snd_kcontrol *kcontrol,
 			update.val = val;
 			pupdate = &update;
 		}
-		ret = soc_dapm_mux_update_power(card, kcontrol, pupdate, item[0], e);
+		ret = dapm_mux_update_power(card, kcontrol, pupdate, item[0], e);
 	}
 
 	snd_soc_dapm_mutex_unlock(card);
@@ -3699,14 +3699,14 @@ int snd_soc_dapm_get_component_pin_switch(struct snd_kcontrol *kcontrol,
 }
 EXPORT_SYMBOL_GPL(snd_soc_dapm_get_component_pin_switch);
 
-static int __snd_soc_dapm_put_pin_switch(struct snd_soc_dapm_context *dapm,
-					 const char *pin,
-					 struct snd_ctl_elem_value *ucontrol)
+static int __dapm_put_pin_switch(struct snd_soc_dapm_context *dapm,
+				 const char *pin,
+				 struct snd_ctl_elem_value *ucontrol)
 {
 	int ret;
 
 	snd_soc_dapm_mutex_lock(dapm);
-	ret = __snd_soc_dapm_set_pin(dapm, pin, !!ucontrol->value.integer.value[0]);
+	ret = __dapm_set_pin(dapm, pin, !!ucontrol->value.integer.value[0]);
 	snd_soc_dapm_mutex_unlock(dapm);
 
 	snd_soc_dapm_sync(dapm);
@@ -3730,7 +3730,7 @@ int snd_soc_dapm_put_pin_switch(struct snd_kcontrol *kcontrol,
 	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
 	const char *pin = (const char *)kcontrol->private_value;
 
-	return __snd_soc_dapm_put_pin_switch(dapm, pin, ucontrol);
+	return __dapm_put_pin_switch(dapm, pin, ucontrol);
 }
 EXPORT_SYMBOL_GPL(snd_soc_dapm_put_pin_switch);
 
@@ -3750,7 +3750,7 @@ int snd_soc_dapm_put_component_pin_switch(struct snd_kcontrol *kcontrol,
 	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	const char *pin = (const char *)kcontrol->private_value;
 
-	return __snd_soc_dapm_put_pin_switch(dapm, pin, ucontrol);
+	return __dapm_put_pin_switch(dapm, pin, ucontrol);
 }
 EXPORT_SYMBOL_GPL(snd_soc_dapm_put_component_pin_switch);
 
@@ -3763,7 +3763,7 @@ snd_soc_dapm_new_control_unlocked(struct snd_soc_dapm_context *dapm,
 	struct snd_soc_dapm_widget *w;
 	int ret = -ENOMEM;
 
-	w = dapm_cnew_widget(widget, soc_dapm_prefix(dapm));
+	w = dapm_cnew_widget(widget, dapm_prefix(dapm));
 	if (!w)
 		goto cnew_failed;
 
@@ -3878,7 +3878,7 @@ snd_soc_dapm_new_control_unlocked(struct snd_soc_dapm_context *dapm,
 	/* see for_each_card_widgets */
 	list_add_tail(&w->list, &dapm->card->widgets);
 
-	snd_soc_dapm_for_each_direction(dir) {
+	dapm_for_each_direction(dir) {
 		INIT_LIST_HEAD(&w->edges[dir]);
 		w->endpoints[dir] = -1;
 	}
@@ -3951,9 +3951,8 @@ int snd_soc_dapm_new_controls(struct snd_soc_dapm_context *dapm,
 }
 EXPORT_SYMBOL_GPL(snd_soc_dapm_new_controls);
 
-static int
-snd_soc_dai_link_event_pre_pmu(struct snd_soc_dapm_widget *w,
-			       struct snd_pcm_substream *substream)
+static int dapm_dai_link_event_pre_pmu(struct snd_soc_dapm_widget *w,
+				       struct snd_pcm_substream *substream)
 {
 	struct device *dev = snd_soc_dapm_to_dev(w->dapm);
 	struct snd_soc_dapm_path *path;
@@ -4068,8 +4067,8 @@ snd_soc_dai_link_event_pre_pmu(struct snd_soc_dapm_widget *w,
 	return 0;
 }
 
-static int snd_soc_dai_link_event(struct snd_soc_dapm_widget *w,
-				  struct snd_kcontrol *kcontrol, int event)
+static int dapm_dai_link_event(struct snd_soc_dapm_widget *w,
+			       struct snd_kcontrol *kcontrol, int event)
 {
 	struct snd_soc_dapm_path *path;
 	struct snd_soc_dai *source, *sink;
@@ -4082,7 +4081,7 @@ static int snd_soc_dai_link_event(struct snd_soc_dapm_widget *w,
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
-		ret = snd_soc_dai_link_event_pre_pmu(w, substream);
+		ret = dapm_dai_link_event_pre_pmu(w, substream);
 		if (ret < 0)
 			goto out;
 
@@ -4160,8 +4159,8 @@ static int snd_soc_dai_link_event(struct snd_soc_dapm_widget *w,
 	return ret;
 }
 
-static int snd_soc_dapm_dai_link_get(struct snd_kcontrol *kcontrol,
-			  struct snd_ctl_elem_value *ucontrol)
+static int dapm_dai_link_get(struct snd_kcontrol *kcontrol,
+			     struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_soc_dapm_widget *w = snd_kcontrol_chip(kcontrol);
 	struct snd_soc_pcm_runtime *rtd = w->priv;
@@ -4171,8 +4170,8 @@ static int snd_soc_dapm_dai_link_get(struct snd_kcontrol *kcontrol,
 	return 0;
 }
 
-static int snd_soc_dapm_dai_link_put(struct snd_kcontrol *kcontrol,
-			  struct snd_ctl_elem_value *ucontrol)
+static int dapm_dai_link_put(struct snd_kcontrol *kcontrol,
+			     struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_soc_dapm_widget *w = snd_kcontrol_chip(kcontrol);
 	struct snd_soc_pcm_runtime *rtd = w->priv;
@@ -4192,11 +4191,10 @@ static int snd_soc_dapm_dai_link_put(struct snd_kcontrol *kcontrol,
 	return 1;
 }
 
-static void
-snd_soc_dapm_free_kcontrol(struct snd_soc_card *card,
-			unsigned long *private_value,
-			int num_c2c_params,
-			const char **w_param_text)
+static void dapm_free_kcontrol(struct snd_soc_card *card,
+			       unsigned long *private_value,
+			       int num_c2c_params,
+			       const char **w_param_text)
 {
 	int count;
 
@@ -4211,7 +4209,7 @@ snd_soc_dapm_free_kcontrol(struct snd_soc_card *card,
 }
 
 static struct snd_kcontrol_new *
-snd_soc_dapm_alloc_kcontrol(struct snd_soc_card *card,
+dapm_alloc_kcontrol(struct snd_soc_card *card,
 			char *link_name,
 			const struct snd_soc_pcm_stream *c2c_params,
 			int num_c2c_params, const char **w_param_text,
@@ -4222,8 +4220,8 @@ snd_soc_dapm_alloc_kcontrol(struct snd_soc_card *card,
 	};
 	struct snd_kcontrol_new kcontrol_dai_link[] = {
 		SOC_ENUM_EXT(NULL, w_param_enum[0],
-			     snd_soc_dapm_dai_link_get,
-			     snd_soc_dapm_dai_link_put),
+			     dapm_dai_link_get,
+			     dapm_dai_link_put),
 	};
 	struct snd_kcontrol_new *kcontrol_news;
 	const struct snd_soc_pcm_stream *config = c2c_params;
@@ -4274,14 +4272,14 @@ snd_soc_dapm_alloc_kcontrol(struct snd_soc_card *card,
 	return kcontrol_news;
 
 outfree_w_param:
-	snd_soc_dapm_free_kcontrol(card, private_value, num_c2c_params, w_param_text);
+	dapm_free_kcontrol(card, private_value, num_c2c_params, w_param_text);
+
 	return NULL;
 }
 
-static struct snd_soc_dapm_widget *
-snd_soc_dapm_new_dai(struct snd_soc_card *card,
-		     struct snd_pcm_substream *substream,
-		     char *id)
+static struct snd_soc_dapm_widget *dapm_new_dai(struct snd_soc_card *card,
+						struct snd_pcm_substream *substream,
+						char *id)
 {
 	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
@@ -4311,10 +4309,10 @@ snd_soc_dapm_new_dai(struct snd_soc_card *card,
 			goto param_fail;
 
 		num_kcontrols = 1;
-		kcontrol_news = snd_soc_dapm_alloc_kcontrol(card, link_name,
-							    rtd->dai_link->c2c_params,
-							    rtd->dai_link->num_c2c_params,
-							    w_param_text, &private_value);
+		kcontrol_news = dapm_alloc_kcontrol(card, link_name,
+						    rtd->dai_link->c2c_params,
+						    rtd->dai_link->num_c2c_params,
+						    w_param_text, &private_value);
 		if (!kcontrol_news)
 			goto param_fail;
 	}
@@ -4323,7 +4321,7 @@ snd_soc_dapm_new_dai(struct snd_soc_card *card,
 	template.reg		= SND_SOC_NOPM;
 	template.id		= snd_soc_dapm_dai_link;
 	template.name		= link_name;
-	template.event		= snd_soc_dai_link_event;
+	template.event		= dapm_dai_link_event;
 	template.event_flags	= SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
 				  SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD;
 	template.kcontrol_news	= kcontrol_news;
@@ -4343,7 +4341,7 @@ snd_soc_dapm_new_dai(struct snd_soc_card *card,
 
 outfree_kcontrol_news:
 	devm_kfree(card->dev, (void *)template.kcontrol_news);
-	snd_soc_dapm_free_kcontrol(card, &private_value,
+	dapm_free_kcontrol(card, &private_value,
 				   rtd->dai_link->num_c2c_params, w_param_text);
 param_fail:
 	devm_kfree(card->dev, link_name);
@@ -4457,7 +4455,7 @@ int snd_soc_dapm_link_dai_widgets(struct snd_soc_card *card)
 				sink = dai_w;
 			}
 			dev_dbg(dai->dev, "%s -> %s\n", src->name, sink->name);
-			snd_soc_dapm_add_path(w->dapm, src, sink, NULL, NULL);
+			dapm_add_path(w->dapm, src, sink, NULL, NULL);
 		}
 	}
 
@@ -4478,11 +4476,11 @@ static void dapm_connect_dai_routes(struct snd_soc_dapm_context *dapm,
 		sink_dai->component->name, sink->name);
 
 	if (dai) {
-		snd_soc_dapm_add_path(dapm, src, dai, NULL, NULL);
+		dapm_add_path(dapm, src, dai, NULL, NULL);
 		src = dai;
 	}
 
-	snd_soc_dapm_add_path(dapm, src, sink, NULL, NULL);
+	dapm_add_path(dapm, src, sink, NULL, NULL);
 }
 
 static void dapm_connect_dai_pair(struct snd_soc_card *card,
@@ -4516,8 +4514,8 @@ static void dapm_connect_dai_pair(struct snd_soc_card *card,
 		/* special handling for [Codec2Codec] */
 		if (dai_link->c2c_params && !rtd->c2c_widget[stream]) {
 			struct snd_pcm_substream *substream = rtd->pcm->streams[stream].substream;
-			struct snd_soc_dapm_widget *dai = snd_soc_dapm_new_dai(card, substream,
-									       widget_name[stream]);
+			struct snd_soc_dapm_widget *dai = dapm_new_dai(card, substream,
+								       widget_name[stream]);
 
 			if (IS_ERR(dai))
 				continue;
@@ -4531,8 +4529,7 @@ static void dapm_connect_dai_pair(struct snd_soc_card *card,
 	}
 }
 
-static void soc_dapm_dai_stream_event(struct snd_soc_dai *dai, int stream,
-	int event)
+static void dapm_dai_stream_event(struct snd_soc_dai *dai, int stream, int event)
 {
 	struct snd_soc_dapm_widget *w;
 
@@ -4600,14 +4597,13 @@ void snd_soc_dapm_connect_dai_link_widgets(struct snd_soc_card *card)
 	}
 }
 
-static void soc_dapm_stream_event(struct snd_soc_pcm_runtime *rtd, int stream,
-	int event)
+static void dapm_stream_event(struct snd_soc_pcm_runtime *rtd, int stream, int event)
 {
 	struct snd_soc_dai *dai;
 	int i;
 
 	for_each_rtd_dais(rtd, i, dai)
-		soc_dapm_dai_stream_event(dai, stream, event);
+		dapm_dai_stream_event(dai, stream, event);
 
 	dapm_power_widgets(rtd->card, event, NULL);
 }
@@ -4629,7 +4625,7 @@ void snd_soc_dapm_stream_event(struct snd_soc_pcm_runtime *rtd, int stream,
 	struct snd_soc_card *card = rtd->card;
 
 	snd_soc_dapm_mutex_lock(card);
-	soc_dapm_stream_event(rtd, stream, event);
+	dapm_stream_event(rtd, stream, event);
 	snd_soc_dapm_mutex_unlock(card);
 }
 
@@ -4672,7 +4668,7 @@ EXPORT_SYMBOL_GPL(snd_soc_dapm_stream_stop);
 int snd_soc_dapm_enable_pin_unlocked(struct snd_soc_dapm_context *dapm,
 				   const char *pin)
 {
-	return snd_soc_dapm_set_pin(dapm, pin, 1);
+	return dapm_set_pin(dapm, pin, 1);
 }
 EXPORT_SYMBOL_GPL(snd_soc_dapm_enable_pin_unlocked);
 
@@ -4693,7 +4689,7 @@ int snd_soc_dapm_enable_pin(struct snd_soc_dapm_context *dapm, const char *pin)
 
 	snd_soc_dapm_mutex_lock(dapm);
 
-	ret = snd_soc_dapm_set_pin(dapm, pin, 1);
+	ret = dapm_set_pin(dapm, pin, 1);
 
 	snd_soc_dapm_mutex_unlock(dapm);
 
@@ -4789,7 +4785,7 @@ EXPORT_SYMBOL_GPL(snd_soc_dapm_force_enable_pin);
 int snd_soc_dapm_disable_pin_unlocked(struct snd_soc_dapm_context *dapm,
 				    const char *pin)
 {
-	return snd_soc_dapm_set_pin(dapm, pin, 0);
+	return dapm_set_pin(dapm, pin, 0);
 }
 EXPORT_SYMBOL_GPL(snd_soc_dapm_disable_pin_unlocked);
 
@@ -4810,7 +4806,7 @@ int snd_soc_dapm_disable_pin(struct snd_soc_dapm_context *dapm,
 
 	snd_soc_dapm_mutex_lock(dapm);
 
-	ret = snd_soc_dapm_set_pin(dapm, pin, 0);
+	ret = dapm_set_pin(dapm, pin, 0);
 
 	snd_soc_dapm_mutex_unlock(dapm);
 
@@ -4896,7 +4892,7 @@ void snd_soc_dapm_init(struct snd_soc_dapm_context *dapm,
 	list_add(&dapm->list, &card->dapm_list);
 }
 
-static void soc_dapm_shutdown_dapm(struct snd_soc_dapm_context *dapm)
+static void dapm_shutdown(struct snd_soc_dapm_context *dapm)
 {
 	struct snd_soc_card *card = dapm->card;
 	struct snd_soc_dapm_widget *w;
@@ -4941,13 +4937,13 @@ void snd_soc_dapm_shutdown(struct snd_soc_card *card)
 
 	for_each_card_dapms(card, dapm) {
 		if (dapm != card_dapm) {
-			soc_dapm_shutdown_dapm(dapm);
+			dapm_shutdown(dapm);
 			if (dapm->bias_level == SND_SOC_BIAS_STANDBY)
 				snd_soc_dapm_set_bias_level(dapm, SND_SOC_BIAS_OFF);
 		}
 	}
 
-	soc_dapm_shutdown_dapm(card_dapm);
+	dapm_shutdown(card_dapm);
 	if (card_dapm->bias_level == SND_SOC_BIAS_STANDBY)
 		snd_soc_dapm_set_bias_level(card_dapm, SND_SOC_BIAS_OFF);
 }
-- 
2.43.0

