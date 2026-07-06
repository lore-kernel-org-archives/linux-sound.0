Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011053.outbound.protection.outlook.com [40.107.74.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBD581419A4
	for <linux-sound@vger.kernel.org>; Mon,  6 Jul 2026 02:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783304202; cv=fail; b=QHltO+OfkpYXhcTVXpRDBGxDH76dS7+1MINfdFIlmqSBbs73GLYTEH0U0FpzzfLPKnxE1xvdVL7CZ8/z8rw1ZJc+5PP5ShSjd54AdhFEiM1krtGdwreAY+q5n28YBC4ClY79eFYN585bPpTYHIlr1DOvo3UZ0kwbNcQa2XUr8Hw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783304202; c=relaxed/simple;
	bh=LNYQdGsQDIVcaodRRUwSCGzyP1RN97I+2pnlD9ONB6k=;
	h=Message-ID:From:Subject:To:Content-Type:Date:MIME-Version; b=FIiPUNV7QlstVAmPUmKVFbQO9qRC8Glp8T5bDTErng8g1BE+qxEUX9XkQ9jshL7N+EwqMbuQQAz7y2mj8eKM/wkibrx13Si+XKUE/EgjNI25jshqWfChaxPwWB1nAu1wW6AjipfPOlP2VphhVJ7jAe0CkAWWcePW/HtD8c5kV0g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=aewZ7mnE; arc=fail smtp.client-ip=40.107.74.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="aewZ7mnE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VfpcUrAu6pPPIT0C0uH/8wl8VvHclvK0cOIiJ97qyywJOXs6RoBfeBhDd3noNE4JbVDttJLTwkI3oq6H47rKOvZ2R/Fe+sdSrDQMWTLg1/9/7D2hQi16jP8nPVTOFGDSMvrTUcs3t3y7lGzoGWX0/bv7Ly+Y/JdN9/WAOr3B+l+Tf3ZY3SrjH2qqnZ+3y8xwkydGKvPx1ynSs4SiwrU+v2C6P+zTkHC+pmEo1l0BfKmPSUmq1CGv7UXiRORsaIn09xCUNf3QPM3tfhhGAPMg/LEAt9aleGFIMfWhWiyBvgp7QThj/1tPky+NNRAtXKe+e8i4bmR1e7BcIvnUUBcPVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7cYcrV9y0xZJ1cTo57VjVt1H9EQ8jNkMcMaymXZdUB8=;
 b=qUXG8B3NBmlLTPEJv8lpVjjaaaX3mySfY6VxOcSwODrThNWpJrddvdzTejQ0fYTYDFxFnAWsG+eq93B2Dr501OMfmTen/0UaPDcTTwJJ7zouu34sJLd02u2GVTiifUwxaQC+IKR5CKpk1kQOsEulcl0sRkybgfAoIh18M71IPbug86Ld8wwQpVwOGwgtyg4gkx5s/xogkgSR4IJuB6g8LQRlwC/PanU3pRG2jEYk7/rePQVTi3Kkjd+tdXC9rB2Jxkcr6dYumGIaCv9w2shnTzm9AB6ww7NXVlzAg+NkaKdIcmNy5MOAw2Tfc8aZfLJglkjTvqijseu67djEG6wsgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7cYcrV9y0xZJ1cTo57VjVt1H9EQ8jNkMcMaymXZdUB8=;
 b=aewZ7mnEpzafA9M0zSF0rCxIchYmE+f3qR5QMtOV0CEbjJ6iljErBqdYbgWVJZ1MRpL9ZD9ENfCijD/2LR21xl5HChNcnFL08mXFOPT1tlj2r3Ga1kQrUPjZVD57sSvGbNM2T1R8b/TYKa7GAOxmaM0Z3YAQmk4Pxc7/5T1ln9Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TY7PR01MB18021.jpnprd01.prod.outlook.com (2603:1096:405:39f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Mon, 6 Jul
 2026 02:16:38 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0181.010; Mon, 6 Jul 2026
 02:16:38 +0000
Message-ID: <87h5mcc16h.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH resend] ASoC: codecs: max98090: add missing describe "data" for max98090_set_jack()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 6 Jul 2026 02:16:38 +0000
X-ClientProxiedBy: TYCP286CA0185.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:382::20) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TY7PR01MB18021:EE_
X-MS-Office365-Filtering-Correlation-Id: 2361694d-1b7c-4432-5663-08dedb049c8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|23010399003|11063799006|56012099006|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	G/htDEJbeJJfG+bsN+oz2gKO31mzA/zFabOQQbhQrlxaQLCSmZl9y6kQMUcMK30Iuh+hMCBpfMIk2HhIs1Zbx8Ax59FxkdG8FZ47UXQcpTj7P2UlWdq1W4r7hWEw0yC/AW8p5kL6BNC7vkMIYa8jrXw8KTWHJMFyOAooI1mxpq1Jen9gpqbP9HzUjbSpToif4u2Wovazp4kL+7eb3xorY3xUpRQDcoAo0enIhTKnwQ8iaCCKiTkIOvW6RmWYuOooFLwO+djJ+DSo/5TgsVud1jhI9gez8e0/OtQHSCcu64meFQtP80YayoLAUJ7kBS8CQqbuUQUAqcfr9IsIhZOEYtAXpxaxtTfL27ykKuMaKEziXb+B3UWzoRDcdaEZ/yAXTNGQdBWv/7096Fb89aR+D4nPCrnDCRp+XMaixNCAmIDJVUZjm60gfiFfZ/KgrBz3ZDNWhyww25tVSB09GrxLEPiK0YNNbwOQCArnCupM2hNKvO5WmJslZqryuiNzNfQFuQIo/no73J1W0RmMXdGh/1lpHfOqcMlRGFP/lq8Vq6tnpZq7rWe3nGVJf1av+r7szHYWr6YZdA2pCQiQtd/zmZW65YCUuRgZghdWE78eegnU03yZMAsZ6omqcxTy9QjhQQPX+9s2MiqeIdez0NQNiP/DIUlXWONYh02fxOX/AC7fxBbKnl6aBIeYQkTiJuKVljbBd/jpjK1yjgoOZYpcYC3FqZvKc0s8T0D5USvJTGg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(23010399003)(11063799006)(56012099006)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TtOzE9+KMWz+iMty2jeD36rlQDHnm/EG6FHdhc2VFbtEILeGVUYMiO+NKorG?=
 =?us-ascii?Q?hXHnVRKnJjeqqt1CozdT4dgyiJXKq2gXO1rJQDjt22F84Azxj41NZoeWMetg?=
 =?us-ascii?Q?9hf0H799Tn46xBk8dB6vBBmwLbHL/z6KjM+jjz+XI+d5d18MYfHIkk3HOpKE?=
 =?us-ascii?Q?4efC3H+7f59k2aIClIlxDliNM9Ys0YYSbNJ4+ROl80O251eku4d6vj08OY+i?=
 =?us-ascii?Q?JcUpKTHoayqR0zOoiPth8CVsT3tuFgQHraD3F+VHnNNI0n/he97ypVdNNO2T?=
 =?us-ascii?Q?jw1lJbDsXdeVYFHG0JIZiavH6984ddFr2OuU8ESUX0Qqcm0cB+704pgLgZJh?=
 =?us-ascii?Q?w/sOHLg8So6PeOJ/OYqCs2oF/OfQOxJBi6WUszvOBRHsw5/MSYjMLSw6cnLH?=
 =?us-ascii?Q?tbTBvvigxZKGNlFIVJz7+hHHHzorKjtfCf1GhdOi7mbLQAyYH9VpUhSOiHAw?=
 =?us-ascii?Q?hT9hl7Bn5Hbjzoy72oxVBApkiuSQX5sPSY+O+B/5XiZUCzWqpYgkzQiNjxe0?=
 =?us-ascii?Q?CLBm6KBj63TYKiANGQHCQyOlCPWhIfIVsTcwsTPimp3t2WdFj6cBSMrCVkqd?=
 =?us-ascii?Q?TbsEXPpsxj7kJMXSqv7XlkpqkEiraTlsNycoWpNfQV5+lAkrWou8OL+kS0tu?=
 =?us-ascii?Q?DQwWrk3ncnRFb57PDSoo7qAVQI5l+5VhlqHjBFSBg3Glz9Ubx+2ARqpKJqvu?=
 =?us-ascii?Q?AgbUEc1S6wLXWvoMjZOVpvYaJLMzNHG2HI1gvwjnKF3muILxOr2AbOxzhmFU?=
 =?us-ascii?Q?uLRClffEjW+T+NFKctojDoyxp9SL0g0YalRPqJwRQniEWKZ0wfp6ybIB8Kmb?=
 =?us-ascii?Q?/pdMymwBcc/42e2YGm9/9ta4tdN8bAVxcS5HVta/Sb+Czfi5tstA/KrR+6gi?=
 =?us-ascii?Q?BVZoT4pPKZleVFBZJpkXdQzA0PMV0OB5c4YtyAphR8DNQeoWOLN6muIpwuut?=
 =?us-ascii?Q?oz7YvL8HNoRzDYLFZ5tSLE9fghorp6KB3MvQFzI+3R+StNh6B5qNgLVOOqp3?=
 =?us-ascii?Q?ZUHdFhzggkkO2MUvL019sbDBiroOF7HveL8d8OYHSwe+vkjdk2XpQP2fjHMc?=
 =?us-ascii?Q?3RsSjADNxEkM/e9uFNOdEZZud8xUkmyfjNdvjAY6RWYrRU/KTgfLNqXKhydM?=
 =?us-ascii?Q?oz0/ivuMMNFwyZtUHOJ9cJdj1r4W5xgaXpzzp8UmfQPWz7QjkyxEb6aDQFsG?=
 =?us-ascii?Q?v8xXCSOg/7EAEurV7XvZQqNFkdZQq6BLpWn6TIeavFWt/i+0VbXOy/NulNJF?=
 =?us-ascii?Q?FmKcdAcF7m0PYssSlml7vCGUiDPxr2AIeuBWREDVd4Lreu8TihvGWYnFC2Iz?=
 =?us-ascii?Q?bHoloOR6ZbWRmkYp34moYu8KH8gRMfSsylpPX5uD7bu9mbcXsdW7f2VCu0VB?=
 =?us-ascii?Q?NsoOGHn69nEZO0D8CGOoM7dQihSE2VPyw6YDGHd/sRJm/C7yIe6q65HFvvO6?=
 =?us-ascii?Q?DujB4sgA1GRNYEJ7AVT+BVDD9tsU2/xkJFvWhAV2/20iK9NW00cWIu/qtcSB?=
 =?us-ascii?Q?tVzgO0Up07wBLnoQh5Ze7jHzf2/qpbKGrjJriYQM2KzdeXau66gwjSz1RHzd?=
 =?us-ascii?Q?p3CMtQWge4RIIeXneD3tajcpsw1hdwApt6ks4B66mOuZtVWHOK4weT3kZSw1?=
 =?us-ascii?Q?21MsuwwcUnDrx7c5iLtFXlhEZbLyQsOWTtUCLyFF9llULI/SaIaZ1oIWcYLW?=
 =?us-ascii?Q?I35XdT9oCj31TMshoH+jFdSBjwpKmWvB60JLLKEM+uUIORzhz8aFVngUKOzQ?=
 =?us-ascii?Q?0eJbskzxk3I6UnXcynIEyMo0Gnb0UcoI88u8Mzl/0JoyLE3Q8NL9?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2361694d-1b7c-4432-5663-08dedb049c8b
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 02:16:38.7340
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tg93ceOPkrxm9D0qEEXFkloOWJYPDH2nziJ5YXSyOMv6wRHPCg4HtsUwLiS95ZJBeHTMuYxs0gTqXpKDslXiJSleVLcirXZXBW5x4UOL8NR3lkJZ/ozV0VUfEhLjwG4E
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB18021

"data" is missing. Add it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
- 2 weeks past. Re-send

 sound/soc/codecs/max98090.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/max98090.c b/sound/soc/codecs/max98090.c
index da416329b0384..bccce322ccc3d 100644
--- a/sound/soc/codecs/max98090.c
+++ b/sound/soc/codecs/max98090.c
@@ -2341,6 +2341,7 @@ static irqreturn_t max98090_interrupt(int irq, void *data)
  *
  * @component:  MAX98090 component
  * @jack:   jack to report detection events on
+ * @data: can be used if codec driver need extra data for configuring jack
  *
  * Enable microphone detection via IRQ on the MAX98090.  If GPIOs are
  * being used to bring out signals to the processor then only platform
-- 
2.53.0

