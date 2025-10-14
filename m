Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011041.outbound.protection.outlook.com [40.107.74.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3238B309DA0
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760415797; cv=fail; b=N/BRUmd3a8O/8Qpulr6ERjrQxaHTfqH+aCKN6Jxzztl2NkAcPM5dtdWGf19zsd/59/YSGO6n26pn23df93Py++lM5Ad5owoFFZrdw/KhbR7JEFhNuUGr05msOk9Igv5WYSVoimItoV1Lybep1FkacrpN3TtOfOyejmWz+Vp4zu0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760415797; c=relaxed/simple;
	bh=96QMh3IJWOFVOcJP675m4NkkurNZxCpHR93ykfjStCg=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=C/FP3F0KIjkw7Z7FyK53pGRaDR1HkstF3qjcQPaidtdWElT2JPCwrOJir+KAAPQCFlqvIbueDBynj/vSy4VK05SC35hhymEbF/Xv+HUDgOgwZuHJwKoTsSiw64Kb5gTMeooLQ87oksXmUrhvri2/XUFzIa2V4jQgGe8DlYiiPr4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=cawTS7AW; arc=fail smtp.client-ip=40.107.74.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="cawTS7AW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iwaBcoukzsnXoSYCm78wh8kZxlVvihCZtMfj1CGSVafIAgy0i/TBP1cw6ZnGmMgSqjrjKnOlh6gG8PKGLk1blhw8sWWmGx5x6t/ynzEWq6wOomfGm+CiotG9K1TRR9NyDpFG4Z6XfE/M8IP6vOggsKS4nvQKPWr6/ayiY8pNeSOeel+js47Y+huqmd+KX7E6WvDDx2ijJBYH579ik9s7F1ynRgYorEQg+5NUn/yiNSvxSrVKAhGwZE7GNd1qhHC4EWuFwoCgqWesaLqk2II/EMq1JpiPm5FpdYGb9F2sFvq2m6AJjXqa+qovQLarR33xq9UeZDjVpH5TQfPbvRytYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zNsl3+QbrJ76SW2tI5f4j8z9wv0TV9UxMClDkjkYZdM=;
 b=iutu5sFf+BMucwrZm71HthygtFfXExBicT5eLfK+vr1uoiq7pepnP0R0CPJ0/m8lSxvjhigjoXQoxy4EQ7tWEOIAOsZ/5CO0Cykaql7Ny4e6p3ktjwlv+gujke+Jm5KnRauf361w/wRXvgtgJ7RpM08MwUWxMGjE+1KQqOEs1/xbEkJwK7qn+bLriFrWOCSLxzGo3OHuHIUlUn3UhvUSzRe1T+2QWVODvE6S33OT5n4RMgcC3FhBVUZ1xa+ssGGbrrlPgfN80DrUrycvjfxvW1OLS2tnpDJsM3D/9+SmmPMPA+s9WNb1QkiYKMxnt3MgPuebOLjmufwtuw/hwQysIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zNsl3+QbrJ76SW2tI5f4j8z9wv0TV9UxMClDkjkYZdM=;
 b=cawTS7AWHqaafcV0Ja99/uRuLMvUL6dmDwcYOPNP5n8GVWw7/bE07sRFWqO2ybnvBTno6YOFzMXKsib03j0YWY4wWHvjTx1y8UkzaYsm3OCxOeCKVPLPujpR/PiSXz/5R7WeuI4JbjRD9dVS0TKj8rfGOPSZo+UJ7LLBWcigH8Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB8810.jpnprd01.prod.outlook.com
 (2603:1096:604:17f::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:23:12 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:23:12 +0000
Message-ID: <87ikgiqfgv.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 059/139] ASoC: codecs: ntp8835: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:23:12 +0000
X-ClientProxiedBy: TYCPR01CA0181.jpnprd01.prod.outlook.com
 (2603:1096:400:2b0::10) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB8810:EE_
X-MS-Office365-Filtering-Correlation-Id: 725feb00-397a-42b9-bdb0-08de0ad9637d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?46BOws4Vmg1QyHSDDkUmpbNgb4Cgf5yy00AQBk+rAIU0ypjbayOp5uM+pXtD?=
 =?us-ascii?Q?85196w+1oZ0A+hSbpqbzui78PkUJQt73MwHlZ1wJrGrWBhs7WX+FYGJDy+yJ?=
 =?us-ascii?Q?hQJ9tAAmBIGms5O2rfY92sg3fTJIZXqOt4bib9x1Vl+aHVO8y61+NMnr4ms7?=
 =?us-ascii?Q?K5Cr+kwBxwXQNMEn4PZOjD3znMbCeWtdJQ7Q46ymN3jxVJFDkFrXDVnfy7eC?=
 =?us-ascii?Q?YoXLDv5VMVVN0xHqvH9O9LaesJbOkn7JTSkY8qMzx14i6BapeJsNntb+BZdT?=
 =?us-ascii?Q?EdhB3PnK/vVSeTobed6tD/6+OfA7Ys8B0WhkKKOgG4wC/bS1qIE4DFnCS2oz?=
 =?us-ascii?Q?R3FQDW5och1A1YVg/tTzLO/UDBJFenejMJA6XVq1XCreGAFVSTqsVNXcaeXm?=
 =?us-ascii?Q?l+fvuw+tOSjB5Yu8DN7ePW+E1Gz7vXs1nNUWt1xR5n6g1QQmlvXOsWF8Ifsc?=
 =?us-ascii?Q?8JHacur2ClOjz21bj6ogpCtbOCEqqZ+1DGbeutFu10lcxA+ImAp2kw/fkgHq?=
 =?us-ascii?Q?cuR6GwTT7t1C/ERWCh+IjSbj1f4CoRGNBdHLXfmoNfCfM3d6J5vseI9f5Bem?=
 =?us-ascii?Q?/plVi/b0aNwhHDfN+Y+a+8XxLpDurpZ3dk6oPe4qJru7QuHCHvUY2kwLse6I?=
 =?us-ascii?Q?V1Hv4oaY1qu9c8uH0bhUc54vkg7ZKOzS459Gp8z54p26r0LtXSG6/Ys4tccQ?=
 =?us-ascii?Q?o2uqoLHVmKOS/EjHce80hxla8k5wSWiP0C729mqxPD+vYEhufzzjqp0fW1j2?=
 =?us-ascii?Q?9GtgWTnedUKHdu6TL2m5eEONmXzsh+HXpYOiyw3Oa8uQwBIWAKN+ytfNFpYs?=
 =?us-ascii?Q?F7lC4VOxk7VgBSkXSV7S4LJ1S2ffx7K9CahL7mVoYFqmcAiei39fFDD3BL2f?=
 =?us-ascii?Q?+eows47LWLTyGPtzOZD4JqPYdypoy4sOglNAvN2qyW1rqr8qX/uscIt2mW2v?=
 =?us-ascii?Q?CbLtMCObX2gL7ZL2Rs2+eiUNVoRQDPdepVl2gL+/KXx7tR4qgLksbwpjM7K+?=
 =?us-ascii?Q?djbWWiAqJsrDavgB0uHSE6RkDOtouhtQ6x4MegWIfRu2y1muj8tjJmlBjxau?=
 =?us-ascii?Q?PHZExIaeUhIqCYORKH+Idxkv/1OYwN+E5mms6XozOOBQVGt+DNRRlDFRlzEH?=
 =?us-ascii?Q?2nP8jqymgbd00vv64bNN1BoGmq7tOeSgxAii/jTBy4EPC0eURwQWlJIgtgDK?=
 =?us-ascii?Q?BJ5ERCiihneT51fo3/PODI+QArHPOKibIlMjqwebLjhR7ZC3amVaaIZ2aDIn?=
 =?us-ascii?Q?57GKXz8rH8e+TVewRfKdc70JyB0Vk0jvxlTDURc7Mo8bS0ZdvI0M7t0LYwOk?=
 =?us-ascii?Q?irSZQiWrNo+v1cb+fmvSbp09WMB1IL8Y/QhUGmr2ILgZB9WpU2CyqmS83Uj7?=
 =?us-ascii?Q?REjnhFmbBr2sEEDaycyJuU+aHA+OQdXbx9Dov08toD4zBAjSDcN34JizPyCW?=
 =?us-ascii?Q?ir2W9Mpfgxp12uYll+6YVBF0dFV9HmtYXOXcjCmb1Mh02h6OvyH/jd6ruMeg?=
 =?us-ascii?Q?VQsNDEBZjFKE3TMdh2wj8kMuyz8gqUlWx5um?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5gbCAqXbYwZFL1NwYk8eq5Cuxzkhurjwu0hy2B6cOv5jZvY4g2b9hxwfp4Kk?=
 =?us-ascii?Q?D6i7K94IgUuv8szum/3rshatM3kG5rlnWPTO2WHIGMx+oKxawqK7UhzN6vl6?=
 =?us-ascii?Q?PKlSu0RQTqBKwfi05kk4sBm/Fhvte6eIamlQC1P684lpmGPXRjz70iERWSwl?=
 =?us-ascii?Q?ofkC3Qg7gLneFjYmYid0w3eMO0j4dY7w6NxDCvlm7a8HekEVrWO/Am8nvMsH?=
 =?us-ascii?Q?9F/l/wfiIa+wI0N0YETt0WYn3dwu6w8lI3w1pienLPGqnoBGv9xQS+i1cWGr?=
 =?us-ascii?Q?uQrsjiy+AZYP3LbYiNhQlbXVthfJ9R3DIhgXnKsiuneoMkYc1VwsNMtK60yn?=
 =?us-ascii?Q?j6uxILNeq7V30zdVhBVrU75GvizvDC3GYekdstAvGLlKsmu4RTON274tWO1m?=
 =?us-ascii?Q?+tpFvPVdn8uYLCCJHRvY59DmqA5HAD0WDf018f3/BkPQgG7lrZstZxqC0e1w?=
 =?us-ascii?Q?k8y59FjsvS94dTiL6S1NFI4L9D9m9RfEpWBHKkAw5VdEbkfqgb4dWhrVI6iH?=
 =?us-ascii?Q?/mVyxzWKL+Y7BRQtP2nyA0k7NFkZFLLaGScvYUfbJfCk1rjw5bdrgv2unuxe?=
 =?us-ascii?Q?FzGc9FXp3iYnbWdiViJUY02k9uD8jQTfAtCvhtA+lBxME3nAVnYFQyy4cAIA?=
 =?us-ascii?Q?F0xCaf5B05npQ16QKaHwBr2McFPWRb8HgbyKJZLqzBP3mLKI5v0jjYqB3WGd?=
 =?us-ascii?Q?1T1hQasY9uRhqVzK2B0Rh98MoLWmVysUNnwx6KfwAZepxEZ6rizbxiZfaUDp?=
 =?us-ascii?Q?N36fQrIOTlOxfvU334J8yuanxM278LKSdeBkqTsUqYsHNi+ZcAqOrDM8JhpR?=
 =?us-ascii?Q?c8INz8922Q0PTOggFdyJN055ywdzgTR6LOdEjpV0NrV9Z6USCQ58z+2H8sz4?=
 =?us-ascii?Q?/2mPDwaQo0Xt+m1DfYoK9SIGRvcj/tvsA++Wo+olgEDlQV0lxgh8c7pLPQQs?=
 =?us-ascii?Q?3SWpnlbB4nIT1H6NiEvrww8eEkM3M45Tltutq3gqstogQdK3lZTRcBgJ746h?=
 =?us-ascii?Q?DDgRYtAPOCZf6Oei56uvCVph1cEqtIR8oQy7I+FoIMbojWetfCTOwIPU3pTF?=
 =?us-ascii?Q?A5ENF9JTdP0/Wy8Jc6UctFPfqGjyOB8TKg+vHFcCVCE7Y9gWtI9DnljEZ/2C?=
 =?us-ascii?Q?Ug9Unmika0eR+5fqUvmG3WTBH7cvUE9baHc/NS/vrhKJ0xvmHloIroruPq4n?=
 =?us-ascii?Q?He5HWP+TZcF45syEFzy3jjbrsGELEOPMt7kecouyp5sFyNfpQWlRIQrynbRC?=
 =?us-ascii?Q?dPmcXRv6lOYh98ZVOcbukfWWvQOLapkJCSUZ8FkzjlyEaOhBbaodvMaOq+1T?=
 =?us-ascii?Q?DisFYN7kkkXtpRikFDL+bVvFvj4vBBBc2Je8QbDcH4lqaqwuyGER3s9fphfR?=
 =?us-ascii?Q?EG8zI5LuiXgD1ZqLSMsynUMf52FN52uTzM52iWqjKvfZ6IKh22WM7JCTWtmy?=
 =?us-ascii?Q?4ORSYECHePrLPxkXfl38r6i7uhST/B5pu2N1xaz6KYcUwY4E+blJA/wfsv9e?=
 =?us-ascii?Q?0Z8s2CFdS12SUylhXAJG7pTfrEMpGBQmYr2r5Vue2wj4TvWE/CtLNY/Wmdvs?=
 =?us-ascii?Q?8J6rch8AnWet1Ei5d1mGEc1f9Qu7aIPpzJdy3DFxQmReL9kmCwyw2H2fu5jh?=
 =?us-ascii?Q?IJOSVX7XuThN3pPaL0WxIuw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 725feb00-397a-42b9-bdb0-08de0ad9637d
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:23:12.7536
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8O14zZvfTVXG0LeY3cO/51A6F52LV58ZLN0geADfoDSRU0neEelJeqJJ5BqemF335jl27qy3Rbpx6IfsZhW8+YB/gOCDr1Nfq1GWu/842xHZvPIkN6zMvAVT4JOIQHQx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8810

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
 sound/soc/codecs/ntp8835.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/ntp8835.c b/sound/soc/codecs/ntp8835.c
index 2cc4c6395f558..2b93bea11752c 100644
--- a/sound/soc/codecs/ntp8835.c
+++ b/sound/soc/codecs/ntp8835.c
@@ -92,7 +92,7 @@ static int ntp8835_mute_info(struct snd_kcontrol *kcontrol,
 static int ntp8835_mute_get(struct snd_kcontrol *kcontrol,
 			    struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	unsigned int val;
 
 	val = snd_soc_component_read(component, NTP8835_SOFT_MUTE);
@@ -104,7 +104,7 @@ static int ntp8835_mute_get(struct snd_kcontrol *kcontrol,
 static int ntp8835_mute_put(struct snd_kcontrol *kcontrol,
 			    struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	unsigned int val;
 
 	val = ucontrol->value.integer.value[0] ? 0 : 7;
-- 
2.43.0

