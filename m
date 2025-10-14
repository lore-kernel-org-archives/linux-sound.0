Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011025.outbound.protection.outlook.com [52.101.125.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B6D3093A6
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760415723; cv=fail; b=bmreCiMlxxUuFoQ27pRUqu6oS/nSd5+bKLod8SqAzrVWERNuMhWfvuGPliL7Xjyvx60W79xDDlT0BKnDqB0dFnl+TmN8WkbUlfBcoG4K7CYnOmqHn7tNmp23o6nOzkCKUtGwUo50Zvbm3kKx1SzpORXjrV1hjJpI64E6D9Gscso=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760415723; c=relaxed/simple;
	bh=emOGYKPrVDm1C49Oyoew5DqBKavmOCeMaVRmWZZUnhk=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=jSJFMJ33vfEav8rw7v0aDpba+hFcirHcwtV3U2IpvY6QAwaSpqwVQFQ8aajQM/SLerBAQbbUIaIWNPVlnNO4tFaroU/28Wocx3j6PRPZrqA+0OhF/ZSpEIJrP/sr0Bqmz7cPmGokZhTJPbXZE9Bx0NJky+dU2ER+PumI/kHpvxM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=LsolnSlo; arc=fail smtp.client-ip=52.101.125.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="LsolnSlo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YFzRhhYPUyNE0FGw9jULZ74oUW/97h6w9EWrWrbY9u0qwECsduDZaCs1MAsYqbUpDC1eqhscINimOUEAJL8Tdx9NfWnwTH8H6crmQRdMYvF4J+MG38SRUuKehYBQi8n1upWWda2Mx3w8dQkPJEeVgMKBhj1Xa0Nt8aBSRJQtrH1DDkV8lW7j+Zf4/bRccaNit8FUSyanoC8C1TUEgVvRj4I5ttifQEqk82MZUOsJ/s8Mt7XkjerZw3UPhp9ywP7Ugt4rBljaV/3btnUw8aEsveudZN0tXEgomKwFRhqHE5ELaVKSvT4yn41LsmAR2Mespl9jO/HmmluDvlG7C5gZVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L7fWEyahcgCrjF4ZTr5d6l9ZWnOP0LYO8prnXw6YqRM=;
 b=NOwONEO6mHFNXbefqAeiNrJ4Xb9M71CEZCH1+AniHzO71qdk/tZCHhmvmxcuShy8L0SJ/6f5pBKMhSaw4BgN4NyVJ8dXAvpfwfvtcoc1AFUi9IJy/+uOdxQbXwZRKCNB55ndotH//IERihyNzRrjMeyWZC1ZVrg5d3c8QATYgGDVLfPHIt5A4f9nEoRPuc3jhyWw3VM595LVzMkVqecS5WAIkgMT4jaNLD5AsSeaJVMbx+YiR2jMw/ueKSPyWM1f+jHC6BgjvXAmXawZ3i+nJdP6YBV39iubDi2ziiZRS0UuasSMsaMV24IvBrTJv0TaDDdYGC+90Si9UJhXqR47Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L7fWEyahcgCrjF4ZTr5d6l9ZWnOP0LYO8prnXw6YqRM=;
 b=LsolnSloxeHGmzQOBcopR00sOxS9h/X0YChd/82cidpbF8A2FObhzD8x/C1Jidz2aO9o9ViBdm0ZVg03/5LGeR4SJfQ+5RkBNDz5Iw4yNM2UwBqMRtoNYeZUoPRZmXsHJDcz76nmIvpjVqHS2vDfAI0fPlYiAmCIJ5xCwLWa++4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB12366.jpnprd01.prod.outlook.com
 (2603:1096:405:100::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:21:59 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:21:59 +0000
Message-ID: <87a51uru3d.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 040/139] ASoC: codecs: lpass-rx-macro: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:21:59 +0000
X-ClientProxiedBy: TYCP286CA0118.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::11) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB12366:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a7e9eca-caa4-4951-9b6c-08de0ad937a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zb5dDCAJEims3rN2Kz1z6prRdGr/3sZMvoV6niMeJqzDfLRCMq6v9oDUr3Pc?=
 =?us-ascii?Q?sjzI460Rgkwkvpf2vjDHYwagc+9xSgw0kLv0bbvCEn1a2qbTK6VDyYFrI3fk?=
 =?us-ascii?Q?ugfr1jlFWRnCq3eMBIsj7HqaE+0oZOKe93T04kHieSbuo72huk7BT9sWbSfI?=
 =?us-ascii?Q?OAsil1E8QtJ0/CRhWkaTbsUulznQ9yXmIZvGBXHoOOnREuQFUmX8Mgfg6jJM?=
 =?us-ascii?Q?1amtoZWrWZLYKMy28v2phT1vTxze2PQNJx2ywTjovNbiEGVA5qQX5JJ4LxL8?=
 =?us-ascii?Q?W7LlR0IuBqRsP7xRVUJCMHIRWTQokKxKEUCzD40DnRxMK9oAoWOqGbZI2+zw?=
 =?us-ascii?Q?OGvd0oBcul1wMdvd9RfcSy69MHRVj4vLLSI2cSuQD0zfx2xqWU73tXAl1r4w?=
 =?us-ascii?Q?zuZjIP1pw+Efi8dnSRQAZvtjsEqWwFb77SS3LjPXGF9D2osCl5xtZoeY6Jzz?=
 =?us-ascii?Q?2OodxBzrdZuBWjUvy1kw6gIe6HPedv/vugUmoiiCRC1UCfhTFgE7iRXmY1ep?=
 =?us-ascii?Q?d00aHuAp4RyveJ2DUBWiNEDn19mWTCw8QTRFH0Pcf6lCZ9AEUemqFJOVT2eT?=
 =?us-ascii?Q?NKpiZlpHTINWZ/cXJJcUuXHx/1z8teG0QjwdD2EYy6TuRuKhpZq1//oeaRYx?=
 =?us-ascii?Q?338XaDauSnGwVo+VzlI6vDkAK65xTpDDwN0IVbqDOOfnSg9LEbX5wPcsw+d9?=
 =?us-ascii?Q?Cqah3SCwPIfe9uEzKxyth8Fxs9cbVp4WhFFScKlrtyHqCvbGaxJt0yiaACyI?=
 =?us-ascii?Q?L+208RGIRDKLGWxaTjr/KeccGIfSqzyeiiL7A16Ol0q0gCKh8K/yzJU3wz06?=
 =?us-ascii?Q?RX6pwfelPFDrCIhpYFN6cqE9Y44nqiRcXWg0bynuIlOA+KZo4QZunsWNZAQW?=
 =?us-ascii?Q?1mWzzDidSHLQHSL4JnvJA/SLfx9MT5Vjy6qaf0qBxq0AoTfrxEhprIdqo1YI?=
 =?us-ascii?Q?STTaFzMaC3KvoRXoJn9KFvVPY4CN8wWwIoTUf9KTD9CVSz1VKzOpdC3sb0v0?=
 =?us-ascii?Q?Ru4eEwKceHLEm1BZR+N8mxwZFgPCyT8gj9q3AS5kjfIGiSc//4v6UdbxMMzt?=
 =?us-ascii?Q?fORWPA6cCp30ybnIlxHd3g6xRIqI9k9Z4xGJtpgoEvbH28kl6Edo2mC31bpj?=
 =?us-ascii?Q?eH9O2aA+VEdsD/t7KeIebGJft52mMO2iGWIqBKBle13s/t7y3oelcwJjlclL?=
 =?us-ascii?Q?WOovsgumI1ak61L5Mw+EJl+J72hej7zMvOP0m0fFuHgoXXkrtxSWYtycpyHR?=
 =?us-ascii?Q?XxGYLKQZkzT0+aKIwz3xzX/kEk2wuCHW1yDpFo5G3250znzluK8U5r05BvZR?=
 =?us-ascii?Q?99Dvai+H0UECJf0LvdjjvNLcvUTo7jnOCAloPb1G2wvYgGu7P+44gKWS8aM5?=
 =?us-ascii?Q?0Opc9f9R4XD51kxXQq0z1MEMxWpUJVcsYx1wt0In7WYNu9f1/5HOaZ+KnHf/?=
 =?us-ascii?Q?CYXAPfqF+yV++FydJe9tlRH6WXqp0GiAfhbsP2EH0ihVnYVlyfAHU5D7oKn2?=
 =?us-ascii?Q?uZOtiWPAWg+y6ytbOic2/8X1hWEKvxkDcoyE?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wFh/1K9Rf/gVq1zFhmFHSwNW0DbuMUWoqT9mbAdz1dhWH9A4tbIdI3k+BGS/?=
 =?us-ascii?Q?ch1LzV3VYER3fI747YJKPdvABEQNdZPY4H9NwRyK9rSHYRzxJo68EQR/JglJ?=
 =?us-ascii?Q?4AvpvhHTanRhWwm6W+RPm83KvrL1g6AjUjwgicvfd3oh8iDS/IkwIr86SOzZ?=
 =?us-ascii?Q?d02sC7LsT361qvrwl0qhokDNiEVJ2+sMwOxAdpd7/xKS3H0gNcnijEvuVrpv?=
 =?us-ascii?Q?B9i4EhSTk5Drd/tDVWD0T+vX5Vp4ZDs2KkYwnhLofxo1o1443BgR+e5UQNmn?=
 =?us-ascii?Q?E7AZ/GFDPBLjaDxkC1/ePYa71uNYYBNlDIMCCMCJSd7YKG6LCYyvWUMNOMt+?=
 =?us-ascii?Q?l0pukob2+m8GcKYzKezOP/w8eRbcor0CSeYV9zYTqBeRz0i9340gqcrRfk0q?=
 =?us-ascii?Q?40G+O47KcRdI+MRyD/lD36nfs/qPyGpMt9PQF4PMtzu3cNL0vdxTGf1Eomb1?=
 =?us-ascii?Q?zsfIXw6gk6QSWZyrmAKH8MIEakwdJP5g1O2vtIfIv7oUay3/uGkdQi6qP7UL?=
 =?us-ascii?Q?LOO8x/+b/v01ubCIhumKmgQ2jFg6RGZcvJo96l/J5OSY6yFxA84AVBLnmuqR?=
 =?us-ascii?Q?KzE3SoY7/jqBQJE/KL1gGTrL1B+j/wCAIZ/IKDYpsVQ1IMp3lYpmRlT/QCoV?=
 =?us-ascii?Q?eoEeqXh8ymPuHJrVkNYTm3URWkBWF4+IqzNZePgzP21l03+sLzobygsQFQaE?=
 =?us-ascii?Q?OaL/XXl0ZWozjqwbr4zWyvWzKD/yeGgooR8anPzTF21DnfC5fm6r/4S77U0B?=
 =?us-ascii?Q?iK6utpzRoUKaJFtTmcyNJl69m4jM1s37rE1mEMa1KgKL754jaeASKjJxUGPg?=
 =?us-ascii?Q?enoo89y6VLGt3k/h+88RdP7AzoAarQDQl6KjaAzDScuCGVZqxvPnR6s09zhN?=
 =?us-ascii?Q?T2Z7u8E3IymeUDVsuAdtWoLN3VBXdjNJzA/eAMRyrO9XmYupoA7KcJOR3TVp?=
 =?us-ascii?Q?cEX9MC+GAAQZ4SeDiuHS1EBZiXePte/KPOHw/q0sAsXl6pgAb/M6vdnb+ip5?=
 =?us-ascii?Q?xKK1ojdkPqSOpxzfa0BQZUK83T92ZQM8JmsKpkGqlD2iwnK8IJwoTu0myvy4?=
 =?us-ascii?Q?77sp479hJVtjlwHR+dgzniELYVGNhJz5FjYiV0DxKa28zUYBCSIgo7YsuL+g?=
 =?us-ascii?Q?8BpQpWGgZDHPqTRWqqm2FzStXAqHiELmSjdwXXvNoIK41TL4YwV3M0M+oNXy?=
 =?us-ascii?Q?AW/opPdgh7PYQh9T/DHextWXtFkPO7QFc2pswc9/WsK6Accbvqlba6Dzt2pZ?=
 =?us-ascii?Q?y0mn0WnNsy1R2xcRLC2RIfzywYSL5ie/AAAMurFx7Y3jKDj5u1WpPzZSsz39?=
 =?us-ascii?Q?u/Q+sZQMj11VfdLYE1Ov92Xhit0FNscN7LzdCqvCtw1BcdBS5CrQSfL1Tt3K?=
 =?us-ascii?Q?jWuCV4s+P7qEWiDL31ElatKFSpPh+qwyTRVXL3xjt9ErIiDUMiW5vG7CPM7b?=
 =?us-ascii?Q?N4IhF89XZqiIHIViyHL3CSbQRiY7TWsWxnNx1vHtowKhh7IoyDtfpxkPHgmV?=
 =?us-ascii?Q?dbPTAfOzo8pGNs7pGu7rLO9K6XsL6jmmQTlfHomgG6XZCXarwR1qd/1Eg/2g?=
 =?us-ascii?Q?Oni9Z4ktOwLny2h3P5SUgwmOMkGtRQ0b+8NreZTlJPV0xNc6vVAcjP+cnx/s?=
 =?us-ascii?Q?GpSltd6JYCMnYlXps36/yxY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a7e9eca-caa4-4951-9b6c-08de0ad937a5
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:21:59.2388
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ck4VdJgqWczXvKDQUS+ghPbt6fP/mM+CnjTX0zqjGJynSZrmL8JM16dDQLxI6xOjEprr1kvugbxhVB+j8KI0ITy4HO/oHhLhb4s/FBF/AnXKFDyKYk2KQqK7xNgY1oa+
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
 sound/soc/codecs/lpass-rx-macro.c | 31 ++++++++++++++-----------------
 1 file changed, 14 insertions(+), 17 deletions(-)

diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index a8fc842cc94ef..9053c93bd44c5 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -2434,8 +2434,7 @@ static void rx_macro_hd2_control(struct snd_soc_component *component,
 static int rx_macro_get_compander(struct snd_kcontrol *kcontrol,
 			       struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component =
-				snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	int comp = ((struct soc_mixer_control *) kcontrol->private_value)->shift;
 	struct rx_macro *rx = snd_soc_component_get_drvdata(component);
 
@@ -2446,7 +2445,7 @@ static int rx_macro_get_compander(struct snd_kcontrol *kcontrol,
 static int rx_macro_set_compander(struct snd_kcontrol *kcontrol,
 			       struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	int comp = ((struct soc_mixer_control *)  kcontrol->private_value)->shift;
 	int value = ucontrol->value.integer.value[0];
 	struct rx_macro *rx = snd_soc_component_get_drvdata(component);
@@ -2548,7 +2547,7 @@ static const struct snd_kcontrol_new rx_macro_rx5_mux =
 static int rx_macro_get_ear_mode(struct snd_kcontrol *kcontrol,
 			       struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct rx_macro *rx = snd_soc_component_get_drvdata(component);
 
 	ucontrol->value.integer.value[0] = rx->is_ear_mode_on;
@@ -2558,7 +2557,7 @@ static int rx_macro_get_ear_mode(struct snd_kcontrol *kcontrol,
 static int rx_macro_put_ear_mode(struct snd_kcontrol *kcontrol,
 			       struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct rx_macro *rx = snd_soc_component_get_drvdata(component);
 
 	rx->is_ear_mode_on = (!ucontrol->value.integer.value[0] ? false : true);
@@ -2568,7 +2567,7 @@ static int rx_macro_put_ear_mode(struct snd_kcontrol *kcontrol,
 static int rx_macro_get_hph_hd2_mode(struct snd_kcontrol *kcontrol,
 			       struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct rx_macro *rx = snd_soc_component_get_drvdata(component);
 
 	ucontrol->value.integer.value[0] = rx->hph_hd2_mode;
@@ -2578,7 +2577,7 @@ static int rx_macro_get_hph_hd2_mode(struct snd_kcontrol *kcontrol,
 static int rx_macro_put_hph_hd2_mode(struct snd_kcontrol *kcontrol,
 			       struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct rx_macro *rx = snd_soc_component_get_drvdata(component);
 
 	rx->hph_hd2_mode = ucontrol->value.integer.value[0];
@@ -2588,7 +2587,7 @@ static int rx_macro_put_hph_hd2_mode(struct snd_kcontrol *kcontrol,
 static int rx_macro_get_hph_pwr_mode(struct snd_kcontrol *kcontrol,
 			       struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct rx_macro *rx = snd_soc_component_get_drvdata(component);
 
 	ucontrol->value.enumerated.item[0] = rx->hph_pwr_mode;
@@ -2598,7 +2597,7 @@ static int rx_macro_get_hph_pwr_mode(struct snd_kcontrol *kcontrol,
 static int rx_macro_put_hph_pwr_mode(struct snd_kcontrol *kcontrol,
 			       struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct rx_macro *rx = snd_soc_component_get_drvdata(component);
 
 	rx->hph_pwr_mode = ucontrol->value.enumerated.item[0];
@@ -2608,7 +2607,7 @@ static int rx_macro_put_hph_pwr_mode(struct snd_kcontrol *kcontrol,
 static int rx_macro_soft_clip_enable_get(struct snd_kcontrol *kcontrol,
 					  struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct rx_macro *rx = snd_soc_component_get_drvdata(component);
 
 	ucontrol->value.integer.value[0] = rx->is_softclip_on;
@@ -2619,7 +2618,7 @@ static int rx_macro_soft_clip_enable_get(struct snd_kcontrol *kcontrol,
 static int rx_macro_soft_clip_enable_put(struct snd_kcontrol *kcontrol,
 					  struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct rx_macro *rx = snd_soc_component_get_drvdata(component);
 
 	rx->is_softclip_on = ucontrol->value.integer.value[0];
@@ -2630,7 +2629,7 @@ static int rx_macro_soft_clip_enable_put(struct snd_kcontrol *kcontrol,
 static int rx_macro_aux_hpf_mode_get(struct snd_kcontrol *kcontrol,
 					  struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct rx_macro *rx = snd_soc_component_get_drvdata(component);
 
 	ucontrol->value.integer.value[0] = rx->is_aux_hpf_on;
@@ -2641,7 +2640,7 @@ static int rx_macro_aux_hpf_mode_get(struct snd_kcontrol *kcontrol,
 static int rx_macro_aux_hpf_mode_put(struct snd_kcontrol *kcontrol,
 					  struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct rx_macro *rx = snd_soc_component_get_drvdata(component);
 
 	rx->is_aux_hpf_on = ucontrol->value.integer.value[0];
@@ -2930,8 +2929,7 @@ static int rx_macro_put_iir_band_audio_mixer(
 					struct snd_kcontrol *kcontrol,
 					struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component =
-			snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct wcd_iir_filter_ctl *ctl =
 			(struct wcd_iir_filter_ctl *)kcontrol->private_value;
 	struct soc_bytes_ext *params = &ctl->bytes_ext;
@@ -2959,8 +2957,7 @@ static int rx_macro_put_iir_band_audio_mixer(
 static int rx_macro_get_iir_band_audio_mixer(struct snd_kcontrol *kcontrol,
 				    struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component =
-			snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct wcd_iir_filter_ctl *ctl =
 			(struct wcd_iir_filter_ctl *)kcontrol->private_value;
 	struct soc_bytes_ext *params = &ctl->bytes_ext;
-- 
2.43.0

