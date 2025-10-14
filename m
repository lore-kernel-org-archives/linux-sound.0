Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011008.outbound.protection.outlook.com [40.107.74.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23D903093D8
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760415740; cv=fail; b=AGOS3OU9UQ8IwS0SxuWBq/CVfuq87u9MUkpSudogE1eoTfqhN8iqQjMOqiAVEKv+Ro8lIG2PbrAwJ8a3ieg4INmMmGPC6Fs53pSYrOj5FHQo/XjYfnykQc2B4c0BmF+hvMx+o+tADlqaomwhUwtLrWPfVK8WJFPbHflNo8CuU6w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760415740; c=relaxed/simple;
	bh=Ca3sNhgCjTFkBVQef8PwK9xRIyQAku5kRfiaNDTPip4=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=BfTk+KO9LAHI73ONG4qciBvzm2mouKfH3fVvyXQWMfnRibh7j6TiZUZLiiIcYaInnIVAjBI13+HyN51qF7MPcPS/6tJ0DAI47Mk3wS+Kgwa12wxxb642GjpIJ/Kf6o0P0fSdfyoMAY6furumnh0tJFcqTrw6vgLLNujvPSpa9ZQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=YWytqhdG; arc=fail smtp.client-ip=40.107.74.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="YWytqhdG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rlibQOvMX8khdCEC9VxUwPzxZJnnlkqcXQlTI1fd8ZD1/6q4eVsvqg0HJS91qfRrh5ltBSoDCmnCfiFSay15/UvFX8jCZSjapCFkW1SLczh3/9QJLW13Op5LQWje9yuplWSoOdlFSJbwu2Q4rZI+ncFlJgwMquZyFNmwQIVw3XwGrG8NU2DHld/bmslUEf6dDAxw7O3QpUMVLzcXW1DtpZx8J7NsZKVwN8iPV+vsqkg/ZWXuww7iiRhyMkp8YwWSqLjlym4UhjF4bRqRtv07LC348siteoEMjJ4XPhIYI1NqIpuuU8ayT+Maj624phd3WxBnxhSuNOKxtVJFF47Udw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5poBCotnhNnjC/sNB5KIfmRyghFEeQzlUAPFbxXRtnA=;
 b=E7biHUPnHHIjg4nyslQstQMA5IgoL3EIFwQW9b3KarPg9wyL+QnS9FolhB9cWoyz9Gdz8M4EuPzph2ql7nTZUZOjd85nNkCZF+9MwNnb1vj2e98w6PX2CN6cpjmon4iloE0l5zV+Mh7XSEhHudbCbktu3mEYvaE/lHQzpGz5OY4w26N716KIKAparYTe2DXjCuVIDAFR3gOg6xW6XmOnIOjyY9PS5liRYKompinIvBGla6yo8HhwGf7LrdFXAIxxkYR/waRHh63Sem7LJxSCuAkTwk/jQqzVrmRiQ0L45Kj1mH5/0BKbhJ5NclK6CbdoXxCw56ai20YQ/qR27Y7/Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5poBCotnhNnjC/sNB5KIfmRyghFEeQzlUAPFbxXRtnA=;
 b=YWytqhdGOO2LhFr4KB4vvPA7MOpueIWI5H9/t1BN1fvOGHeWMcOIm+YWU0iZVDUn/+QQvmxagspi5AXVHJEbamdHA/DMTFWXi2xg1i6QJ5ZlydcVxQViYC85YhRVawbevjwzQOgxQVprzQ11Wud9Rr3gGvtA6S8YgiCWmqJkIa0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB9449.jpnprd01.prod.outlook.com
 (2603:1096:400:199::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:22:14 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:22:14 +0000
Message-ID: <874is2ru2y.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 044/139] ASoC: codecs: madera: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:22:13 +0000
X-ClientProxiedBy: TYCP286CA0032.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29d::10) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB9449:EE_
X-MS-Office365-Filtering-Correlation-Id: bc34b881-9ed4-4a75-7877-08de0ad9408c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?oG8ELn75SKpJ8BQK6Wf5m+ACQ1T768knRQJ+jGT/Vu+/jENJ5NDZD8b+asCK?=
 =?us-ascii?Q?TYBFICTKDwa18crUDv1dhgWwI8ZhCeORaIiBFDTh3q1RwEKXg1XidE06EpiB?=
 =?us-ascii?Q?RiD3P88Oa1DMKwvSbWB2WfsIgWGgO76d3NMNTXDhuCM0G8In4GHcyr3xrhsk?=
 =?us-ascii?Q?9maqQHpOBSughGQIfSunLiN8MgUzp2eq6sAlUeENfRy5i/KYTV3jx/Ml9d1A?=
 =?us-ascii?Q?yNp8LQizCgajsuNSdO+8u8z6ScYvipmaWe2JshFm8SHJ6Yr2ME8p4XrhcF8C?=
 =?us-ascii?Q?fmIlPNyE/X+g8U+0zge2slFsQ9Etw8CZufch0quAHCKDkEfIYRY5+yTih8l5?=
 =?us-ascii?Q?ATAxWt1X6+5gbeXpPPxIKbUGjoIQRX4wRCQEGjPf+qPQMJieAJtcawlo3GZA?=
 =?us-ascii?Q?wO6zsN6lQDPGoKFcyOR5fmxi6PA6TEiQGs37JmfZ6Oa4VrB8cIRlhEwAATua?=
 =?us-ascii?Q?bkozpzpGNWQxFaLLigHcto1dYjTl5VCexo0A/kzTjwEYRpAgf1j0gWByBycN?=
 =?us-ascii?Q?BLKNyTO0cMePSqZJatSqWem7odTnpeHy1RkXOQDFEk61LR3dHkSOttZmOkdr?=
 =?us-ascii?Q?8fF6wNJp3inyidX+z/KbBcqloE0p2QFcYvDurTWecDPL/vY7vglBnvGJBG2q?=
 =?us-ascii?Q?xoCL8yi8tlp50+pVH8binSEpP3XLSQTEE9BPb5zERmy1lK46yv+u7dSbmi7C?=
 =?us-ascii?Q?7SWK7wIs1CpQt2q9Qjs0OKj9bc7LUTZMxWNGerqSzEtW4pSxLqOMrWbZvAxM?=
 =?us-ascii?Q?Kkw3phU2Mu/udU/kCyTeGHQ/3iAX0lqBFZfFniw+CwZiai/y7IlI/5gI430T?=
 =?us-ascii?Q?UXJRcsvuo1FK1dTHUPSiGy/rp5TceP3sxR9AQpN6T2EUEshjbWFDxLppUngf?=
 =?us-ascii?Q?WnotXKEWJ0WOXfMHXWmu2xTtwURhF8JkzOVZDJ6bOEyqKEVlz5yXIRDie6GA?=
 =?us-ascii?Q?y11nZkbmmF/mCbSGtJVN2hEJkYNCP8v221RPecpNRc/XReTEw4zIbIk2SJYO?=
 =?us-ascii?Q?YxrzM0nmHu3zIng7Dbl46cVj3+SEDwtc7Y8ydQfFJfQV8BVv7jPiU59jzhAf?=
 =?us-ascii?Q?KQO0FaCuXVYpRRhw8GNb51j4eSbVsNJtMCz/enYyKQaEQMMCCxc6HjwrBqLw?=
 =?us-ascii?Q?tTRIklL5ptWBa2H3L0GLdGh0zbqmWV6AntVFazR0C859pMKj96/VEohwpB41?=
 =?us-ascii?Q?L4EffBnsRQzuzYXMGE5NB2ObZ9g8ahnmuRzVszFRr8u3OJISVj6o45xKs34+?=
 =?us-ascii?Q?3udI3JoUXYM1QBLX3m2ExHCvpj95ZeMVY2StW9o0y7YBY7HVcGtyWMHWwJTB?=
 =?us-ascii?Q?ij32XbqJZIkjBo7IeFdZq/jb9aPeffAK8tKLcBhKWrB2KTw/rURNm0UyIoiY?=
 =?us-ascii?Q?welBrdHoiPpKMg6/aQ2MxW74z/Jc1m29kV3CnEWj1yBA6ngNDCBlYnTCpX5p?=
 =?us-ascii?Q?jlJKsoqn7V92yZugrjcI15XXB42QMhTcGJnOZfLV3Q91ryOM3RibdCJ7wtVa?=
 =?us-ascii?Q?uBHzm23OKHFRPp9674QOIvR2sJeshBK8yrl9?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?R7Z4tlEoRgQHRN7l6BU51+TlP9jrmsViezLwXMqfWqKygO2P4Z6A3OTnIf0m?=
 =?us-ascii?Q?yT3Fmi8hbpLgBkoPdzcB5Df9ftoDlKheo04MMwFmokBt1w+KpPR1uFXILp+R?=
 =?us-ascii?Q?mejVJI64i4co8LRY/HKE3kn4f+G184mjGR4GWwau6umgn4PWxTPQbXpde2yU?=
 =?us-ascii?Q?wYCkg7SFjFSRQgLhh445tNW407rWgEgtl/2q/iW6wMqHxfTTD29Q+303m+1p?=
 =?us-ascii?Q?vClWpHI9NA7Zv59FAlfFN8qE/tMzIIj9yy9JO+QPlokrFpxhC+rTnc9VHJb7?=
 =?us-ascii?Q?wMG/NKQc5NeLodzmr5nGWDJGfWw105fBYYaJ9D1uQiOkHUC9kd7CnoDVxe2F?=
 =?us-ascii?Q?RytqmmIV3cSjDLT0rTZIj2HyLIPZvaVgGcXEbViRqv1zyihVRpcgb1DjSnm9?=
 =?us-ascii?Q?YkZOh0L+g8Sa4bU1QwZ70RcwEn8ALSH6dnEW7sUaImkxHyvAqKw4yBX+M4qa?=
 =?us-ascii?Q?6l+10HDrWqFTWrBqQkml7VLO8XHu9wkS/MLadqILTgoJBtJo1P1hNIqSMKQ4?=
 =?us-ascii?Q?yLEJIHfMu11dWVzoM0pIkqgKX1f1ay+ldMiNTo/8DjVV5q7TBhRviRrBi2l+?=
 =?us-ascii?Q?RF+cw7EcYVr5xpeBEJ1cpFHf0XO3FulnBhD2/58qQBlglWofKEKrsURdiPGo?=
 =?us-ascii?Q?Yy5M2fR6CiOxdqq66RA9ZFj8PRCLRhhNDvQ4QcqBAxj8LQky59uFgY/3PeZp?=
 =?us-ascii?Q?niQ/QJPmaJrYE0+3AyoMVHDZrdm1ce4KDf+7Rr/qSCYB/vGwB4cdarTYY9xh?=
 =?us-ascii?Q?/GUD0OFFvsRPbOA23Zds31tOgoMCKDayPKbdyPBoA7c99LccUXmrTlQBysuC?=
 =?us-ascii?Q?wih/fPHC1cmJiKxgD9sI2SgBs7G6QvgfT0EXX8YDzvBcyqNZt/fSP35jVZfk?=
 =?us-ascii?Q?uYQrPmF3g4iRrrqk9QaOhinnfhLjXYSiWOHnBudZFW+nRq4ARqv7aJhqm4C3?=
 =?us-ascii?Q?8U4aPmr/elHvxT/EhoIZy48ve9t9i24Y4dvNTE/DnEXgpwpLw+3SUk7G64xm?=
 =?us-ascii?Q?9pZjstgEfFhLNWZtGeyLAejpjHYNh5//4+FAtNDTER5fP/tYwvT+uJOVpWLg?=
 =?us-ascii?Q?KFI3UeciqeytRm8Hlg4/U7Vy2nlefcWkQdtBwhWUjWncsIMHK/obBGSeWmxC?=
 =?us-ascii?Q?4BtslkuCYSZJKWOEugLA0s4BDzWa5VGq3Bs/+l9wLS4cEQhLBZI+GVp2lxGH?=
 =?us-ascii?Q?uXGGOtRKAy8wogQlQPoDr8RLUPBr/SDw71yYxDilC6+x1iUv80CJePUeVZ0L?=
 =?us-ascii?Q?z8NENg+hBZuwhd0wUjAiEcnHRCrk7iTUMVXA+z80IDkVp4Vp31zJSqJJw5yM?=
 =?us-ascii?Q?2IkHDKROf1aNGGX+h8b7XoH6SL8Qu8FG8fJVluKDKgQ14lwRmSzHe0eA8Pmt?=
 =?us-ascii?Q?LLQ9xXVL6I/7QWYRMSfJu/4zBHLW8l+XXL2qk69/eADrUlZ8Wk5ulYAL1hdw?=
 =?us-ascii?Q?oboaxKJS4rIS1XdGau0Q4JJ77z+RZavy0MsKj8lembrhyRFbYZoUImhwxUYI?=
 =?us-ascii?Q?Y4z0RFhOaIRFk+9L+3uPXaW92od7RCO3rU+/xgpK0ztoqhVhLTfLVQSopB2Z?=
 =?us-ascii?Q?h/fF6CogQw5CUVYaCfDR3Q0XvXXeODJd8MalOzFmObacxW+zlY6Ae8Cl7qxO?=
 =?us-ascii?Q?o6sr6XGp74Rnlis6DHd4+ls=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc34b881-9ed4-4a75-7877-08de0ad9408c
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:22:14.1657
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YTIh6UIVF72KZnWtynEKqS6pG0JlTTbWRNJdgrFU+wQBu643m1lStVitLrbEUhD2SgT89r/sVqa98HQjHcknO5uyCqcAxLkMbVL4aBKc5fljroBSSE2u1V/QVcb9jr2E
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9449

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
 sound/soc/codecs/madera.c | 21 +++++++--------------
 1 file changed, 7 insertions(+), 14 deletions(-)

diff --git a/sound/soc/codecs/madera.c b/sound/soc/codecs/madera.c
index bc3470cf2c548..057f75bf0053b 100644
--- a/sound/soc/codecs/madera.c
+++ b/sound/soc/codecs/madera.c
@@ -873,8 +873,7 @@ static bool madera_can_change_grp_rate(const struct madera_priv *priv,
 static int madera_adsp_rate_get(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct madera_priv *priv = snd_soc_component_get_drvdata(component);
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
 	unsigned int cached_rate;
@@ -894,8 +893,7 @@ static int madera_adsp_rate_get(struct snd_kcontrol *kcontrol,
 static int madera_adsp_rate_put(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct madera_priv *priv = snd_soc_component_get_drvdata(component);
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
 	const int adsp_num = e->shift_l;
@@ -1054,8 +1052,7 @@ EXPORT_SYMBOL_GPL(madera_set_adsp_clk);
 int madera_rate_put(struct snd_kcontrol *kcontrol,
 		    struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct madera_priv *priv = snd_soc_component_get_drvdata(component);
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
 	unsigned int item = ucontrol->value.enumerated.item[0];
@@ -2163,8 +2160,7 @@ EXPORT_SYMBOL_GPL(madera_output_anc_src);
 int madera_dfc_put(struct snd_kcontrol *kcontrol,
 		   struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct snd_soc_dapm_context *dapm =
 		snd_soc_component_get_dapm(component);
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
@@ -2196,8 +2192,7 @@ int madera_lp_mode_put(struct snd_kcontrol *kcontrol,
 {
 	struct soc_mixer_control *mc =
 		(struct soc_mixer_control *)kcontrol->private_value;
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct snd_soc_dapm_context *dapm =
 		snd_soc_component_get_dapm(component);
 	unsigned int val, mask;
@@ -4742,8 +4737,7 @@ static bool madera_eq_filter_unstable(bool mode, __be16 _a, __be16 _b)
 int madera_eq_coeff_put(struct snd_kcontrol *kcontrol,
 			struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct madera_priv *priv = snd_soc_component_get_drvdata(component);
 	struct madera *madera = priv->madera;
 	struct soc_bytes *params = (void *)kcontrol->private_value;
@@ -4789,8 +4783,7 @@ EXPORT_SYMBOL_GPL(madera_eq_coeff_put);
 int madera_lhpf_coeff_put(struct snd_kcontrol *kcontrol,
 			  struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct madera_priv *priv = snd_soc_component_get_drvdata(component);
 	struct madera *madera = priv->madera;
 	__be16 *data = (__be16 *)ucontrol->value.bytes.data;
-- 
2.43.0

