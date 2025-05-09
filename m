Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010059.outbound.protection.outlook.com [52.101.229.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6743A2D
	for <linux-sound@vger.kernel.org>; Fri,  9 May 2025 00:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746750996; cv=fail; b=oIF7itk+u+mnQZvidC4f+R3cohXDRVOssKO3ynE7/ns3aXnAQLctTXQKpyqTM7NYSgIedGS5Gb1yrYV0FBuxyaRd0kB4s1FC/BiVZgWC0nWfhrD3aQeDSNe89Uv19F6YwLudziUfhM3nQhP/xkd2UI9sAmfzF4LDzsoTCk1+QBM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746750996; c=relaxed/simple;
	bh=KavvOqZTmCXSu5USeJ/RM2BUKJhROpgFBb5sjDrFWk8=;
	h=Message-ID:From:Subject:To:Cc:Content-Type:Date:MIME-Version; b=F/E70Rggn1eNyV7QJPnAhdZZnIEgedql6MOHtCnYsfiTCEW6f4CEzydbsml9z4FReV28giap5/0WC4jA8tWGC5AwUocEg9qn+R/aUX27HhZz/ql2PBSwfe/zgtVRiaiFxj62aCDM5iACA29uLykElpR0Lfmxcyc1kbdoKQ3Aw58=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=WCN3p/Yq; arc=fail smtp.client-ip=52.101.229.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="WCN3p/Yq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wW6za8dMlw1XR8ttqtY9MSVSM0cOgnRn7BxF65AYZvibz2z2mHl56n0SRAdYsqaF6JRAn6k4+9DO/6IQeu8pkOv4ttdIEK3NoNy5rZLcvonPXj1vX9DMshN9KkHMniunE+8VYikWFb7Lx0XLC46p2WgklXXOr/3PAA66tmbgl3RisVUAtTeKG96rySt4je1UYrGHq0RuQWYLM1OBjtf6KzrAlRC/yUlcMhKyXxOBNeORJzkIhn27Y5o6M1hUlCDPoKgcQY8K8Khryc1Gkz0vOgeJmFDneiT0GzFXrpM3Viq1ZnF46LKZw4nwuV/TbEh0ORReH3NZVy8SUU0HjMvY7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2GCrdlKhKxtgyaZ6/dcJiB2Hh7CDww4l24uAc2aUcp4=;
 b=oWSZLDGsaN/0U10FPwJr+Bhvv+hia26BhcOhhTYT12d9TXxgK56b5CUrB6YG4ewpntHWOJkYvG+P09LF9s1H9jruFM6Itsbyj2Szxck7CsUgYwXI79MRXZ3GOI9V9BXJxOFhG8QowJustBmcodPiO+/9Uu5Yk0McQ01veO1PLWC2t0gmLO8pPFCZr2/XOOm/SwPNdW00B4UMl/WglpMCz9NzN8fN/qjgnjVO5+kbodJs5xsC0IvBM/dA/iHBSSUAPzCsciDWfHV2KKHGVohEvt/dEZevK8UM2y6omDSo8xNBCf0kAcjcbO47VUTTR2rHPjOnPc0sI8EPCUb9jEliAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2GCrdlKhKxtgyaZ6/dcJiB2Hh7CDww4l24uAc2aUcp4=;
 b=WCN3p/YqVTwLgzSCReZP8jGJ5CVVe0435hYha+7EMEph3YFLNdzmO9DPJ1KhWgcK50YMrW6T8cvWbgeXOFEJpUg6JzXMfNmjA8Ldo3N9pIcs1+knzAOQAfDH6z0ANPB0sZzE+ZV/5Jj8jAC/ffQYMWZivbbH9BZbg9Ussq7GN3o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB11320.jpnprd01.prod.outlook.com
 (2603:1096:400:36f::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.24; Fri, 9 May
 2025 00:36:31 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8722.021; Fri, 9 May 2025
 00:36:31 +0000
Message-ID: <87msbmpqls.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ALSA: wavefront: remove snd_wavefront_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 9 May 2025 00:36:31 +0000
X-ClientProxiedBy: TYCPR01CA0166.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::6) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB11320:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ec5eab5-0706-410b-8a23-08dd8e918b33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zOleiiQVyj68r9Vl2waFKvdeFzFyCG2T7sMwJFCKA3LOSIhZFiSxpy04LQa+?=
 =?us-ascii?Q?BXnUG+WMaA6mPmpUEKgfofxy4Z2SxDi9H5QO52IGk4NBKpYLiKnCF662PHM1?=
 =?us-ascii?Q?biQxBtiFklAPlWuJ3UmwWztgtguS5qmhItmrXWkqIJQAjnppFqcXjheR7TDR?=
 =?us-ascii?Q?CLuxDgGx3ht92YHEH+lNJFeJcbqOtXnczuTz3pdHAEYazD8tOO2e7jTtmyeq?=
 =?us-ascii?Q?xfhZ0PbjpuRlBTbBhWLkNFNNYnA44udzsrp62iJjaYFNINbjLz6SYQuKgi8u?=
 =?us-ascii?Q?aHeE5k0uGpJKgzflZF1v0U0uyRjwjDf0PSsj/8JrjR04byPpCh/ASqER1QqE?=
 =?us-ascii?Q?DoEkUQt378dO4AtyrbN03SrgKi1dylDsgbkSttCR7cbl/7QVl4MpE0l3flDY?=
 =?us-ascii?Q?P20XL3rp2wdX8wsl3ijH84QKNog89Nsu7u32CkkwfAfGYKUD6cM12l6O6f54?=
 =?us-ascii?Q?O/dvxYuql2mQ12REJ4YSFT3bSj6y5ojFhBsYejJ0LtOGfIdKsFWVwTkJ/A/W?=
 =?us-ascii?Q?IRwDUy7J0GICKA+C8heaua3yR1zEILPULixnSn1TI0tThMsyNBxatqxxkX0p?=
 =?us-ascii?Q?x7iOWDKwuEuQ0TIm31AUS26RspQTFJVytQup7VKtR60ziR9TsDDSW3se/DaF?=
 =?us-ascii?Q?9xNKe/tm3bx1PBJn9AECCBpXl828BLTVt9M4T387aQA+GMR4cozpKWJURPwS?=
 =?us-ascii?Q?hxSegX/8DDVMP93WGw7kcdmzEJ75quzOy/td/E21KK7LwU1uBcVzODzmMANW?=
 =?us-ascii?Q?XYQhaJsncar68Qa8D+kXw0A1Upotv8Cm+ZQiU5gOZSM1wgWtJEW+i0kM8i6t?=
 =?us-ascii?Q?rj+Z+Ha7QQVxVhlzMkkqphPIOEfx6uobPxmnuOfJPMWtMBQoQonRhNRwhMtr?=
 =?us-ascii?Q?cseyXmcHJZVuFOW36SThihe0o6M7ICfSy/jl5+Y/Kn6bgoSqU/Tg4blkI2Hm?=
 =?us-ascii?Q?GuM6qrK9GE+zspq9RXj6O4fbhjr2oUXS4K4hIog6sjKJuCeP72ExDVOx3s/g?=
 =?us-ascii?Q?3Vd/vvcdQesHNVQwGYEUEn3gmL1MBRl0dqR0Xz9NYSrieJv6ZoR1PBay+VE4?=
 =?us-ascii?Q?8RksNAdLevHTEDLjelBhUfLVeHwinm3oqYDQ9RnoxszvsdOdABANkc3BmDcF?=
 =?us-ascii?Q?iTCXqfMY95u3yu1juSAXGHDKiL5z1ErndxRyBSr0hfeQgVR5n2I0gryc385B?=
 =?us-ascii?Q?0ltqHK6chwFPCL6y+GcqtHf+QEHuIVbj1IAxsDUd6aeR+mGuQHYIHLRlhvha?=
 =?us-ascii?Q?Qv1B+tsRH+U3I4VdnrHzCa6aOA78+YYkliEJxYTH72WUaD0UqlW2x2jWtnhf?=
 =?us-ascii?Q?b003jpCGuHTsZbDpBUqbEQuNJmQdlkMLEP9ZdHcX9dbGdrU3UwR5mTm359A0?=
 =?us-ascii?Q?qh5o5C4MFXxjuoJZaJNBGBqlqHidXFO7N/qEck+5etoXjG9r0urJSD4CqUSy?=
 =?us-ascii?Q?17jzJohh5D62ykyrRPN3X448zsTF8gokkYrvzI9rfuGcJBQsLJ1okA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?S71+jxXt+pbVsqQFK6388cEtHfYqaOc0oD10r7GTkff9dS1oVktmo3SlZqtY?=
 =?us-ascii?Q?y1dk0bahT4ncXsLzd8Jcqz/ppfIYqy+v1nnLXGjj2gEM0jbOkXVmg1eBZpLe?=
 =?us-ascii?Q?bSky5aCMzAGq4p5b/sjz7kUGDiXR7Xo39bYz89QBXZOp8HgqrqmCSC5OvlKY?=
 =?us-ascii?Q?Q7byJlr/oqudtkhDSidar35CKCBOuDRa9IqI4J+mZa6d8F5rqv8fvyiTbXCU?=
 =?us-ascii?Q?BQ+GZgKWEN0q2gCQ/VnQofVxPYCeDX9uhpjpZEfB1BbswOiRYKyf2jNqrIpE?=
 =?us-ascii?Q?cnosyU1Euyc3mEUhn2bOEW00g1Jp92QAQCjlaDleAvPTUoxAHqF07bSuqVlT?=
 =?us-ascii?Q?GERNy1UTsLmpVaUIyRit+gln1Cal1oOoeGp8/QHQprqT/UprIVX3xXv4UUiq?=
 =?us-ascii?Q?fCdvihujb00MlHaDsMGbA/KqAgqB0JVoWU3V6S5Zc8eAWigYSG0EPAn0fr2b?=
 =?us-ascii?Q?2La1F6fDSMy1vLRz04MJdSHxkQ0erC4eLl+ZMXCj2fXDCpW19M+VeR9j+q91?=
 =?us-ascii?Q?UcQxK4hTQDe0EiQEKiI+FPD/XSF12xUJlNwhdON4mFZs7CnquOWorchXUG/c?=
 =?us-ascii?Q?6FK/BX9UwV2mE0NQAn+8niSP2k07DlQ+UrSdA+zJsqnEwbQZzbtIrPA7bGii?=
 =?us-ascii?Q?YqYtFzdrTX8d+iRms07G2HAIedHLpidyJoTh7TSbgwDIZyIiYJCxPxsq4eQW?=
 =?us-ascii?Q?0rb2xte5CDQpOHZoyq07DvgN9a1f6A9VGljVbzvCJfFWK5yyIWZ2dAId4JoW?=
 =?us-ascii?Q?2vJTZVMiCjK+RaeOLlmfBOvYeBJfVCWxMY+x/eW/JanHTPOrOyZ1oeHej8U6?=
 =?us-ascii?Q?9lCdB32QpmaV0GldaApX3fTpZ1s/5Ey5Z8OnBjHkq6LKEFfzeBCDJiUdJcz9?=
 =?us-ascii?Q?ZNYl2kS213kis2l7dvZI3uhP2Di9nENqXEKM+FLXLcn65OPRdAMyEQ0f2Oxh?=
 =?us-ascii?Q?s6qxSzH5l8+MzKOooZIbIkieolr7WKOgK4c7fOtNLkRTK8xqoJeJGZ5umOdQ?=
 =?us-ascii?Q?va9t8wwyntDdYd9zo5tkYrSWjyhVYYCN2Km0PlcYdALfpQKrHJzcM62JTLl2?=
 =?us-ascii?Q?JmyQMPdESHkVauE/ugkZ7t0XVD7mx4YZkuNTohR0U0rJSevm10gXifC5SC2U?=
 =?us-ascii?Q?R/Bg7LQrJQTVATaRa4VhZeATM1eq6aVS3SzE6ObogrhUMNR+y2yx/4UyOxR6?=
 =?us-ascii?Q?hDpubNq9uvzrs1LHDbNBuS/oWPCOUowhSgsXw3E8mWciUKvLRhNDLeWSue/g?=
 =?us-ascii?Q?36X3Je+JmS+VQ74jtTAuSzIbf/O0+0+3qiyoc0xQut2UnH1qRt43bYzUlfRX?=
 =?us-ascii?Q?U61nRnGt62yUkaLx/I1DmIUMfZVhumLzaZjLF+7/YJtJsQbAuMO3O/0wz2ck?=
 =?us-ascii?Q?VgMCz1cXPiIQsNw1ZkWWRq+ZfjULZUV3xBK6a4Z28uM+ymUGHuOeqtVquPfK?=
 =?us-ascii?Q?O7UAjhodpx7K625OMLwBK+SEHuwqbuVEPFSv8lHa40IYuA+I9RaYIunlfyXO?=
 =?us-ascii?Q?G4KOZQ8DjK4ZJZB+4o3WMkIOMP/iXUJ6qEcSnS39bfVp6jEiMhjN1FVNowF/?=
 =?us-ascii?Q?9/GdoBWophPveRLWQVHMnRe++eKQtFNSUIaCad1nfH1vJE+7LZpJhL2aBIJ2?=
 =?us-ascii?Q?5rH3464DgU5W2qs7Mpw9k2c=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ec5eab5-0706-410b-8a23-08dd8e918b33
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 00:36:31.4700
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RtW1JqJXmR5l4UOvesyBXHJxPeNuMtNJ+IyTH7emsoK9Hakyt92k9QdU5VNqLNUw2LY08NTwvrClUU9ksRp7MORfMUjgbRK/waPfPfKOqRTBzilcPMlS4FMVZsmyhgvK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11320

There is no snd_wavefront_xxx() implementation, and no one is using it.
Let's remove it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/snd_wavefront.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/include/sound/snd_wavefront.h b/include/sound/snd_wavefront.h
index 27f7e8a477c24..30f508a567661 100644
--- a/include/sound/snd_wavefront.h
+++ b/include/sound/snd_wavefront.h
@@ -110,12 +110,8 @@ struct _snd_wavefront_card {
 };
 
 extern void snd_wavefront_internal_interrupt (snd_wavefront_card_t *card);
-extern int  snd_wavefront_detect_irq (snd_wavefront_t *dev) ;
-extern int  snd_wavefront_check_irq (snd_wavefront_t *dev, int irq);
-extern int  snd_wavefront_restart (snd_wavefront_t *dev);
 extern int  snd_wavefront_start (snd_wavefront_t *dev);
 extern int  snd_wavefront_detect (snd_wavefront_card_t *card);
-extern int  snd_wavefront_config_midi (snd_wavefront_t *dev) ;
 extern int  snd_wavefront_cmd (snd_wavefront_t *, int, unsigned char *,
 			       unsigned char *);
 
-- 
2.43.0

