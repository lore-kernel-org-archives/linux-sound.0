Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010000.outbound.protection.outlook.com [52.101.228.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24125374197
	for <linux-sound@vger.kernel.org>; Wed,  4 Mar 2026 06:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772605372; cv=fail; b=dZaML01BJSjtn+RIbOhnHEkl3G2Wc96FJSWXTd8N++IokTCqIoaeAsho/rK9zJrlj1soB0H92JCMDCfdguJ3pJYlyHK0WrGB0Dn2iD0w94bgJPmPTATtGugId825T4lO5jjkGdJCHCGoop4byTrvSKwZ2bNPzGgszYJjkyeG37I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772605372; c=relaxed/simple;
	bh=sGsplGbtaet8SJP9efQ8kkXK5rbH2kDa6x3afP7fnlo=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=RHFvlk0EYGIUYGkh/E6j0fIZV7cM4aNCTPLuvSYwmp77n5WZTLutGPmFZxVg/GlN+izdMyRbuCFyAMefZQDQfUVM2yhFhVjrNpe03I9Iqni1S7GwzGuQfkw2SSu9oBnOSD+EsEYWph0GbO3HV5GqqHxfz9An9soiGxrE5FxRXEk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=cKRvNAOh; arc=fail smtp.client-ip=52.101.228.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="cKRvNAOh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p6l46Zw8x2aE95+7rs4wB9Xh4oyNQAZ9xLJhhimliR5v3OOTlK4vDoyNJwbmEvBj3cYyQ13QBAXz1LzG//u7o8oIhVk2cqVEoeE97HppVZR6B5TKWirimzbh5XLkT1ifMZTr9av1nmRtJ3Aa8sUfrZk8abul7/PXuxo3P7OPpU3Bl//KIQOkZ3Vz03Y+HzPlf7lnpguBcvUOrKLwCW8ZurdOr/mrgIvvDFi8t4KvEeRpYOjnPZ8OxJdfzwChDwHy6doPMlS+1ey5ZdazafLV1m5opFZt3rW8XwQIHZk6l5IfC14ecLr6XmNRGdcqPy62fpvSFTBbxrkGHQI7t3lTTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gj7omZADvdtncvPoSt8xRBHHSQzBoja3OnItvF6AxKs=;
 b=BfJc5mwlvZCwZKbEqEWi/EdqjUklYZhWZ/+zeuzgdPbjg+KLOfTderBsYmc72hnDp+rFd4Sx65C35jNlodMqGFZ06IMj7wZe2/41rAwflQWvaeHV4M9xYyT0sk+Ahz3ER76Ms+QTAh3EZd2Z1hthcwlYg3d93R3Lu3Ki8Nq+mJcr2pWDiCoutEwVu5aG4S/0Ivut2A28FyVWTEmMMov7m5Zt4NeTn+AB41/UZbxUZw9cRG4nVb75rzbJz51MrhGc0avRiVtWI5MijENSmfyeagdWo3GVzLrUyR03GxpOyy8qzVxyrB42Gr1cHCPEmeKTb+jzCLg3Znn+VOO6ajoiJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gj7omZADvdtncvPoSt8xRBHHSQzBoja3OnItvF6AxKs=;
 b=cKRvNAOhG+hNeJHl03UKhRtC8oj0wlCFH6qcfNv5ZWPXpxtNsEwbGLdVsO/lRHc5MENw1vqyAdg07FtyAj+cUFTznUXXFOo3tl7BwcUVpdmuDk49m//kAJB92GHA6tmt8M5SIYXu8QBPGpzwXOXxY0sPqt5IDiETQ+HRspEV72U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com (2603:1096:400:ff::13)
 by OS3PR01MB9755.jpnprd01.prod.outlook.com (2603:1096:604:1ed::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Wed, 4 Mar
 2026 06:22:49 +0000
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9]) by TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9%7]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 06:22:49 +0000
Message-ID: <87pl5kp0zs.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 04/29] ASoC: atmel: name back to pcm_new()/pcm_free()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7fcp10x.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7fcp10x.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 4 Mar 2026 06:22:48 +0000
X-ClientProxiedBy: OS7PR01CA0185.jpnprd01.prod.outlook.com
 (2603:1096:604:250::11) To TYYPR01MB7976.jpnprd01.prod.outlook.com
 (2603:1096:400:ff::13)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB7976:EE_|OS3PR01MB9755:EE_
X-MS-Office365-Filtering-Correlation-Id: 70481a18-c900-493e-3b09-08de79b6753a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	DmTk3WHYe+5AZvBF8LH7yhs63Gx8x/FpknKRlhHewrmYlWlGkC+Vd/1Y3huKuiPW82Ty/aRVtinh/RvZrgWuHmlJA78QO/bXz2/R1lmwXcS1qjbdc+t/E7pZnGaI3vjR3kYK+4t8/gUMJDeqcgiIVZadtLwSeNnHu8E4Xr/N5xyBdCHIg03s80q9qjYBZGTuvabJaTOH6n2O+aRNr56Pm1hfwjC9T25IHFwEBGE7fO7pIj0Jqv82ygx0GuEXzUn7nCBjURzwsp8vKvM2X9WmKdr2nhirWcIyc7saXDO5Eca4Rl3Qp6Nbir5xf0WdnDbkM91Z5Qybr992xfwlKxfG1UHSz0bSU3sguOSrT3hujvhCHlC5e4XSucLzTslsk0dBAVz5urFeUsN1Yr9pX3nRSr399ztVVzBGUfls4oAUMv98Q0e2poc7HBZeEuL0TUd0qL7A/AuJrTvcVQJiaD/Gsn8aiZZ3k8ca78zEOvDoqg1H2fSwx/oT6jTktsbl0morMFaG7ug2IRWcJMdvtKPg0lRzNoo0zj4By0HH6VMT2chc7JZmbahunzL4cyxmNrL+R4/e1DdBYpK4SYYAygfF9QMW3a80KeBJbewjUjaBxR1rTAAFwM0gRnJObZ2Ui25GsyfvY2A5QyOiAXjCSB67c90rJOVhqJBR55cXLxW+naMSb5ldXyx21Pam1u1csWv21/KqA+GV1EBcsbn3P5JvD1R7U2thBZy15lPrAUzyUvc/AGRmOsfgEkHe0GScV88iuHgBq8m25Mpfvjx+agJm41Hh586kLUzQovJ7CN6keE8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7976.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?29eWRgo4T+Vm8qjGS7eo9cWmiKZ2V7bZdDDcVhB90Df2kUa9IOiRd5yBW3m/?=
 =?us-ascii?Q?hmULvKlTQfKlbwekDfzXXgA7DjnE7U+NY1umzEcNpjoPitEAH8xFjBLZYh9Y?=
 =?us-ascii?Q?NpebrkXqoF8m9cOKLHwEQ80DlPco6nxrLtW+SoHMMo6uXf25SS+lxzN7jQ2r?=
 =?us-ascii?Q?iTQt15p2Xz9GuBXxYfeN8FxmCBWIB0DLLtB1+bYkPbuk7pJtqqYA8Goc6z51?=
 =?us-ascii?Q?nraqaOH1g7UgG9sAOHlnIyjUUNXRsBe+KT65AleRZXK2DKLuVXi2OY4q9RG1?=
 =?us-ascii?Q?PeeUmoMEoB1r3qQgXZr78ZJcv0u54F+uIttYXlkuSjH2IM5boksMb8tHLsOp?=
 =?us-ascii?Q?KIy8YImk+DxT3UI6lscH2VgVrJxrO4schOJeL5E0QifmONN6jFFKk9GoSutB?=
 =?us-ascii?Q?3ZJOj0Q5XzKOYZbFNLV9FeOxOGAAYV5J8rXHKkrartbWQYcw6W+zNaEpnjSO?=
 =?us-ascii?Q?/eVzxNYwVo82nHVFXNSSyfHkZqRkGeBRhLBdpC0o4QAvhp1KAdjeDSFe30vx?=
 =?us-ascii?Q?9ArXbJ57sB0MAf2rl+iNDJH4vH5EZednLSuLGqDqOYruIDpHdhE1JQDP5oM/?=
 =?us-ascii?Q?ka2InzNi6UvMa2lFut5ojttN4zhQeDPdpeeZfNzwgHIEOqMhqD5qqP6/Gs9j?=
 =?us-ascii?Q?Y8R9Cg3RmRla3haf3+TOQSPE2vWZSTz6I/jzFqs/QoBwP28Rsc6rtbPrqPpn?=
 =?us-ascii?Q?GyEXCFxoWPM+czaBcP9DthBBJISTt4bv0K8vKavIDGfKMuTSBDN5Nh0uWH9Y?=
 =?us-ascii?Q?XlEBvueeljP8jW4LaqRSutyKvfsUjQml5F28z7expmUrU7Gm9IRffZwVUGt+?=
 =?us-ascii?Q?UCyB2zg48VxXNH+wvLySDlBr5TG5eIfiOVBCpdc3AilRrjA1+WTr3Mdlsy6s?=
 =?us-ascii?Q?WLIdCYeHnfzjMyKCNPIyPlEKlUzKWksgxsHmly6JnlzxACe8DpbPZBawYxYg?=
 =?us-ascii?Q?zSjIadab/xsb+Wg0G4vBs0vLMqxNa/8vIZ1Y0LY+OYqqVqDtEkTb8Fr6/u0m?=
 =?us-ascii?Q?3yTVdVqU9IZa0Qw6XJpDK6E6u69OtahJUpJzo55i9tIRB2wDGf8roFnsB0Wn?=
 =?us-ascii?Q?dMqC7vrTdoopHJgAZCZd3tNCT2/ovjMx2hPASgSHPhyDRIIttA+i0Sw3SqNM?=
 =?us-ascii?Q?2YYwfrPKzSJZHazQ3iHkCSs8HnEna/G3nQnZOhmsDlLvFS23hqw/aaP59C5w?=
 =?us-ascii?Q?Al/pIlZP3yrxvbsBOZED8v2TtrPntCHnVIhIy8o+3I/FyXh0TJQEMN+jtaOd?=
 =?us-ascii?Q?+QtfP9WEGy/aBbPYo/SuLYvjKOJxayPt9nr6ks8uoF+PNWb8vxRJ6frouVkR?=
 =?us-ascii?Q?idjuoZ/YOi4cilaJ0Reh/Ue2LwUcmdyBB0DEWDAGULIzZoDW9s4qSNUX7mhM?=
 =?us-ascii?Q?19WotAp09WalRXvT3m/TL1BNGXuAzs3fGxiQ12/DddrNVz7lHabwtT6nJ2M1?=
 =?us-ascii?Q?9iQghdMJ9fdgE9SkIq4pvqXK3C4gCfeHnBHuVtyG3IL0UD/D/HfZfhVgS14E?=
 =?us-ascii?Q?ewa9uuutf1HzBwT2EF7MQ6ipPyZFSDDdc5KMY24mZbkV1AC/ud2y9/AbsHgl?=
 =?us-ascii?Q?wPveRGrUyAu/Lq7S/u5p86MSDuDK7NK5jFCC3rFgzVstrsvP5RWRTjVyeW/1?=
 =?us-ascii?Q?jjH3VGKX7uzZZ9kOEe0KNsmAxxshrXTqvyxIsvP64P3nnCq0vf+IqABeKLqJ?=
 =?us-ascii?Q?b8XkayIXmjNEaV9V/A//mxKpzwPprRc8Y1/l971BbAqcrfp3nPDsxSYZyXdX?=
 =?us-ascii?Q?tAiSVzqtwJoPJlJqA4pQXIwbVpdEJkAza+dWEXMlO8s6ycJMDLoe?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70481a18-c900-493e-3b09-08de79b6753a
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7976.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 06:22:49.1925
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bpPy6FklcG/BmaNMyvj7I4l6/LuMOiht71PDGmtU+lYktAD5Rkr5SmsbNa1VoDxj3GeZR7pKNcrZQmp95D42FAIb0ZZMrwqT0GctYYusOd0nRCuMQGnAakuH12pk/Qxk
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
 sound/soc/atmel/atmel-pcm-pdc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/atmel/atmel-pcm-pdc.c b/sound/soc/atmel/atmel-pcm-pdc.c
index 1a0c584801f06..374f93fa6e0b0 100644
--- a/sound/soc/atmel/atmel-pcm-pdc.c
+++ b/sound/soc/atmel/atmel-pcm-pdc.c
@@ -316,7 +316,7 @@ static const struct snd_soc_component_driver atmel_soc_platform = {
 	.prepare	= atmel_pcm_prepare,
 	.trigger	= atmel_pcm_trigger,
 	.pointer	= atmel_pcm_pointer,
-	.pcm_construct	= atmel_pcm_new,
+	.pcm_new	= atmel_pcm_new,
 };
 
 int atmel_pcm_pdc_platform_register(struct device *dev)
-- 
2.43.0

