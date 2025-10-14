Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010038.outbound.protection.outlook.com [52.101.229.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A90163090F7
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760415715; cv=fail; b=pv9bhKx72v4LPCZzIqtrnwm4h2/U0WbC/bzsNql2se4AMV3FKU4R/zM/SfJb1JfCWOUxhA7HG/1RulRQuiXYfb/H8O4CCVXZDGl2tyuOHa+2kHC/P4G7ANUu93m/R1KTdH1v5xg/EQOOxbVjN7BU6tXL2pfUj0wXyubH9JbcZSg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760415715; c=relaxed/simple;
	bh=7czm2b7ozC/Vf5SOrigi657L8ioc/Q83CVFMQR3JNt4=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=WtMzV114fktjCZurMuqou3TpBvQIt9mnTemK9MsfgMVwjRKjkfGAT7R+ybCGsuFNqLRMeQVdogRGim4kosmLYLzByw5F15UcsBawhFJVIbEfoD0Cg2Rux5YG5qg+Nlau5QQbqYOvRFQK6SVWYmg0r5n1CpWc6ysMId2OCTiJPcY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=iWNoDNWl; arc=fail smtp.client-ip=52.101.229.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="iWNoDNWl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OlLIlBMJrHAnCMKaDqHboVJRbxPYaEw5kBUXIrI9T0ksGaBX1RKd2FlCaKdO1FLoBi7WqOkZsoBmDE6B1dTHzky6lLW9rtffWEakraBp/29J1eoEoRKTBhTcMf282d8kpP0lFbB4ZlHnitCXKFgQ4YkiTYdJJrwWlmkiz3XwzOtjjhWmOq/acd9FpGWIYajRoCtAZXld0y5AnkU768Bm6h+/KU12bKRKuUk1/bPhqnO9D4y4rzAV4e2IeNdtilQEhxe0EabgEWWB9VmfkeX6jAoaoYTeEyjwU19Tmxwyi6fJFkHWP2lA3BLowZoxbmAVQIm7RFyfnF/F1iNr35TWbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CubeOpDa287AXFz3Pogm3nO1Qf3UAMZpEbHMUN7YMFA=;
 b=WOqzUml0OJgwXtjgAZ+I5zdF0Q54heNrmwZl3TcodmaFE9j6qNzan3WOMQpsd/TqQRaIb19E2qH5G4bpkLsZOwsT4+xgKPPWy9NXABpZmujEDewny/WvCblXWN7eXS+oH4rW/QcWk4Dg4qBvhPguyevDv+MyXakoy2BIDqnIAtGnoeLtiw0RML9VPLWHH3YrVJhXKDH7JtzxT3xVnRQAsXHEtyVCPVtPew80wlcNq0QiRexYPz6IC/ScqqpNWwZDBfsJY60nY12rYNqxg8XY8J1/7iSwt/wg9AbM3B+TaRyuglrrzVz+ENNbd00t/S8GG3fZ2qKoC9iA5cNoEvRasw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CubeOpDa287AXFz3Pogm3nO1Qf3UAMZpEbHMUN7YMFA=;
 b=iWNoDNWljmhbMvJl/mzEu8FQdOtZQ6WfzAQjYRtaDPfV3AhCew2H4w8MwEuLJB7L+ctP/6LTJfl/8+7qYT6ofllBt6P5O1yX+yTcpQPc7mZpy5qqPN9G7eHFqsN6hmWe/zNhy7JFGbonp6pi/amFKZ5hQFDkVH+NDk+HVPWjQu8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB12366.jpnprd01.prod.outlook.com
 (2603:1096:405:100::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:21:52 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:21:52 +0000
Message-ID: <87cy6qru3m.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 038/139] ASoC: codecs: fs210x: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:21:51 +0000
X-ClientProxiedBy: TYCP286CA0044.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29d::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB12366:EE_
X-MS-Office365-Filtering-Correlation-Id: 569e51a0-ad0d-4b1f-a1e9-08de0ad9334b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sszHRhoq5tRV4wnAFL50UgJo3y6Ft8WNjBAuAzUnkuhP+dAkHMWiEZqMqzxP?=
 =?us-ascii?Q?KP3Xk1SmecSEIFmeckmv7L/KSvWrPwI4AEFvLTUGSRiwVgdEpRnm260KKW+t?=
 =?us-ascii?Q?HbC+K/Ap1tdnEq+qmYsvaTLM9Xt3plIYHznVaxQSTJhvzmCc9ZjwhBOhYF8j?=
 =?us-ascii?Q?eYl2kCr1wgn5TqD6rFc51eLPxKbNjAiEmVtQttPljHwnALuvk1MDmqzcHmZz?=
 =?us-ascii?Q?v9LoMX0M6Pvn8WKvWQHQQlmrQPtT6sQ7et2EOLd+Cik0seNclJGgL8pCCboC?=
 =?us-ascii?Q?UBFDiF4L7SPPXqyn84SbrSX3kBztXmPESIMOmK+qnFin9EOYCJfovacbNo5G?=
 =?us-ascii?Q?VpAe4SRL1NrX6cIdhJrZm0rJB5G1vnz8P8pchBEGLAUFs4FPW2nXflzg+zUq?=
 =?us-ascii?Q?tPpTm3Mt/qjJ5W8GpasDB7CpBHW3f0TsWKMp21gdvwOFJ5v7KpM8jtQhu+Cb?=
 =?us-ascii?Q?Q/u4VE5X1aJ2H0FSUTejkbtMp+FvxX6hMM23/xKxECHVghLyD2BHKOl4akZP?=
 =?us-ascii?Q?qMMbiKYrlRlBNUP5FCtdj2tYh9pc98LFCp5BiMM3sM2PXMIH1BGdhOuPU15e?=
 =?us-ascii?Q?EKyFP1y5q/nBcJCBOaGbnlrfqnPTF0zzPINK1pLcm7tKSaJNb1vunKT3A5zE?=
 =?us-ascii?Q?xvQmTtQLqQYb6yzKytlQ+Lu9Gyb98yorwaMBAfbHYiuzf25xQENL/+xa3wa5?=
 =?us-ascii?Q?3R8XcnQauPo+3kh/ODhraLhmq2ydal+I0KiD2PRGc2zZY5Pw3lTy4726keNg?=
 =?us-ascii?Q?gjzU4XKAyssg11ke9OkBi5FZor4jJcGPmXn/NQyYRQeelLmFQpFBlr3zgZY8?=
 =?us-ascii?Q?/SudkMu4hZvWhSydgiFjhVHu4XG7QwwvQLs9EduejscWMvA8ED1PA0f5Q9Ah?=
 =?us-ascii?Q?eGVRAk0InrWwSFZs3WZFHob0CNRJ7BZknPaz3KoXYR4HUsrlTXp7+GnAQcut?=
 =?us-ascii?Q?2ypCn9Uor7EiPjwnRPsELzA2dfGo5QesMagHc2RSARdQqfpZyzZsirlbubnv?=
 =?us-ascii?Q?evJPVh2BUywPvyhklyhlw+0/2uHmtAiAaOnKhd5eWKZn0Be0kJE3JrWUVRXY?=
 =?us-ascii?Q?PRWSHP3066p4JV48WNWvg8nlTIyH4OUdA5Vf9oLJT0VLl4cQp2BDHEVeF2Mk?=
 =?us-ascii?Q?vgTTlEu+Lr5AzhT6sDan7X8hx4FopSU/ycywTHETTepzT7Ib13Ld3cjw8xXH?=
 =?us-ascii?Q?zZVY6PNgJa7gKe9UtH/DPHvgtu1h5cxw7pOvp4108lmRNsmWXwPbYYzPdCCi?=
 =?us-ascii?Q?LrJkW3EJa5eyL5n2o0Fsk5FaKoR8fuIn3uuLbo1xroT1XKCFN1fteLXnk2xm?=
 =?us-ascii?Q?6RxsGZWlTYM31HsRXhPm0MxEphbK0irQD7XrOfDdmY2+4g9Es+rNg14QaY+y?=
 =?us-ascii?Q?vfMyqdBiWm6s9dHl//vHJPOtm9lta9OsIDtsRFMSXBlSQFAftBoXdZs5Ujj5?=
 =?us-ascii?Q?Dhi1iQi8ukMR9F5yRUHsQFEaXKHLrBsV9VPILxpocd/jce1sbRkPe5mmtjBW?=
 =?us-ascii?Q?3GotCiq8YUviTMGrX0HEyuTl/qd1JH4yEfus?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?45C1fxKUHwpHjfluE/i5VUtmdkd01Cpcv2Y7gTMzoprTCtg6LuG1rZwnnR+P?=
 =?us-ascii?Q?lh+U+ZFD5zosLXMh8JYrloTRR9iwdUAbveZ6Lis/lRzxvRgjlBIolLAS/zTO?=
 =?us-ascii?Q?4Klvn964BTUM4mmHj/UDp++BaSBw1u6d45ZJGY0TEMrsOn+sFoPTB2CrpUOQ?=
 =?us-ascii?Q?IVbsBXNUhx+wdgUAFUEgLagqLbZTbst3QAzO2WbzqrBWTm8daW25mQTWeFkd?=
 =?us-ascii?Q?/EkV11nczaQJ95qGy3mTKbYPG2+cHwe09eNNPsTYdvveWuK90ZexLiOOBJ+5?=
 =?us-ascii?Q?Ky1Nr7zgKmRbtNL8RLrh/R06B9K8RIHrek3mnE7DGP6kLqjrmkuH6zzMSK6j?=
 =?us-ascii?Q?99Xzz8f2TXmLDUoi0/xqrhHxupbwQbKCBHl+u++sBzVIJ6mzgi50kodLhm6E?=
 =?us-ascii?Q?TfrWMxPyDlCTliXK2npqJYPdBgQ8CKO9hSGNih7TNKM05t+vzYgNSFlepoLm?=
 =?us-ascii?Q?BubGimqUcg6NNeOBzzpDNxIetlLX89L33R2I7nu0ltQUZHXYxnJQ5NGy3cKa?=
 =?us-ascii?Q?sLrNLkWaC3g6ztCuJHo+NoNBUfUBo7jpSk/0ZiWOI4wYiaoyT7hhlz2SsYEJ?=
 =?us-ascii?Q?UJHJ/kQL7Z393W/F7es5yKBGuOWPNBbG5OkP0tfuuzmjecm0pCZj6qfkm2Aq?=
 =?us-ascii?Q?mty3u44/npJyltc/6XZZg0RC7wIJm19cwsIMzRfjZZ/gMSq7AIvGq4piTgkt?=
 =?us-ascii?Q?tQlRmqaOqmnCjBOc8zshgtCi34uDMSiFqxNGTHwrgcttaDbRmcO/KoCyCxzw?=
 =?us-ascii?Q?/dUCHwQz8DPcIPPwVS+Qn+pS+bbiYfD1eh4Pmx6/YEF40M6KZZJ4TTj5Fl2+?=
 =?us-ascii?Q?6LvUM24ef2Jge9AZ3QPQQWkWFcta87ZID+ZA+RspzayxT4653KMKj8a0lZOP?=
 =?us-ascii?Q?Z57TGM8J4i3XnU3rpnRAvlX6/HTWi7dltCjLLbFRS/6s6xN3a/EBJfsTIdLm?=
 =?us-ascii?Q?Pivqo0kRcEaADrUCeeKYijppV9GcIWaHakK4J3/a/KOW7gG2Xn0Bd4PsaVyD?=
 =?us-ascii?Q?I7iNNs6a6Xg2Vq2OyNGDSyRFjiQZtLCgGVm5SEFR1FohHc/YiVABckfENtMb?=
 =?us-ascii?Q?kqKTIkYB0cahIx6+CVOF18y2YXBU/sSod27JttggAJTch78T/wPVXMRt61MI?=
 =?us-ascii?Q?KtI17u1Sivik6x/vUDZhOWAe5c1M8Wz1xxwIjOIdDGu5ceunVcp+6fv8iQ0p?=
 =?us-ascii?Q?AfD/h8k6zGkl2mxmiONcrNnBAXCH/kj/DGCfn2PdrUk7swJEJGlauyfX4BCx?=
 =?us-ascii?Q?DpnaZIfmplAFRqL20aiZkHWfaU/1MI1IRDM/9u5jj39zjKv9d71kFeRtw6g1?=
 =?us-ascii?Q?7cMStqFWYoeKC7oCw6YxFEcwxWzfuO0Cnzv4QunGugocdZTR/PPIq74ITTxe?=
 =?us-ascii?Q?avSLvdOAXhhVcOAj2T8CaX0z35Ya6lHsrT6gQQSWXPHvHgeXrWDz5jx0YvT1?=
 =?us-ascii?Q?Hm0SZVwYkqAhD+Cp56s93R/M1EO3XAEpPP0HKMpLJOBvhNV9GZinpJx5ccZM?=
 =?us-ascii?Q?i6NLaiP2lLM0FQaoi3ljeikyrjnXA7Hrzn51LIWxug32v8tb7u3uvRUbSjcA?=
 =?us-ascii?Q?cwY0loI8fU4y+EloBq67dmf4Le4OKhPWR1fpD8A+JO4joWlHxx37X4IIH32Y?=
 =?us-ascii?Q?DPtPlgsJFtP1D0bpmqCuc+I=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 569e51a0-ad0d-4b1f-a1e9-08de0ad9334b
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:21:51.9420
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pJ43cMQOcLIHVZfM1rLkUzEzedMMXVVTkXxExBjmcmo170iCk9FsSW5OfuUN6Eiy/9ug05XNbJYsk5mmNU0unwvDBeFEHED6pTNv7h2HsScgXKkP+6WlN2acvTH+9j6T
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12366

We have very similar name functions (A)(B). Both gets component from
snd_kcontrol, but (A) is used in callback functions which is registered
through snd_soc_add_component_controls(), (B) is used through
snd_soc_dapm_new_widgets().

	(A) snd_soc_kcontrol_component()
	(B) snd_soc_dapm_kcontrol_component()

(B) is using very picky way to get component but using it is necessary in
ASoC. But (A) is just wrapper function to snd_kcontrol_chip(), and directly
using it without wrapper is very common way on ALSA.
To reduce confusions of similar function, let's use common way on (A).

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/fs210x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/fs210x.c b/sound/soc/codecs/fs210x.c
index e2f85714972d5..e6195b71adadc 100644
--- a/sound/soc/codecs/fs210x.c
+++ b/sound/soc/codecs/fs210x.c
@@ -924,7 +924,7 @@ static int fs210x_get_drvdata_from_kctrl(struct snd_kcontrol *kctrl,
 		return -EINVAL;
 	}
 
-	cmpnt = snd_soc_kcontrol_component(kctrl);
+	cmpnt = snd_kcontrol_chip(kctrl);
 	if (!cmpnt) {
 		pr_err("fs210x: component is null\n");
 		return -EINVAL;
-- 
2.43.0

