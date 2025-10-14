Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011065.outbound.protection.outlook.com [40.107.74.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C64C330ACFC
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760415992; cv=fail; b=GSAjIQQ7ck8/0gcN856KnolozOVhD5bQHot5n4GthjduCjBRa0tHuNI6dzSGmdfrlbF6QGvAtY1L7IIJxpJGFKOzNAueW/wWblcwcHSPjMdZSiFt8w/i+lgfedMURzQ9CcU+kumlIkOmnZcn7Lnmhg+NZbDGheYuL1FxDnPtfcw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760415992; c=relaxed/simple;
	bh=2wuUtrIwoDGLeHPpp9hlRmuPolOijyQsXtAlHVDNTdg=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=YVeDOHDoJmwyHMRgo4PHp6yiHsBj1I761NeXvTGsyf1kKc2em8cK55I1OggxiOpkOrNWRX0NNbtZTWiT0UQmZABkcsEvHc2xRbttq0JB+vjn6qcQEJh8rjWCF4tMq9FA/QJrS5JN2ZPCD+t+Bd9P+tdcUPLKRk81SFAcRIS0r44=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=oT/tkSkR; arc=fail smtp.client-ip=40.107.74.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="oT/tkSkR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bWHeFqmfaGkLMiAAQtIaCP0Zl9Y8OOcXOCHcnT3sbIWkproQIdnkPDMq2gHNvVx2VJ5ystDJCqvUmXEwdfG/oo5vKR5jPK/cUI4s65mGt7bF2oe+H2UQWJGAYKdCSp+dcY6nAxs1BVvlqq9s6b2G1ge8nepC55O9cMPTfm7QO2Kv7LMLC3AEvyvrtzEjAyxYdQY7rcsa+wmRRvfSivCaa+05Wos3OBM4M6nsAYFz0c6WPp6ZqaDSPBdMsWKLUh6uDSAKj0TZoDYeUZy5ESWgxPQShN+wv7STwlI0BEZZLQRfQR3QyGsFsZWU4DpOnrVP+/BIFB7QPG/OifQuRipFMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sZ/xqgGAiTP/zmyKNhUDNLeEODL0YDBF7rvvKeSzWy4=;
 b=IDbyIW5+JSyNNNr/EQAcKIOmnA3eW7ftmM13UE1o/wbHetG5zKK83d5yWAdU6IJJWIxWWa3z2ESczYGRqNmWDNydDt8/lzQMhfDdSpEHcW9Z6ppxLiAxUftWXQU7YtFshMuYmY8rBbujB3b60tH2dw8c1eyWKfgi9SaY5GdXtup2KUYn2Ymr7nPDpYd+I+DVysSGzo6JkMYURYqUpSls8WmA5HYSK+IldyDpIEgixHyeMcArE6MfbHZ4LnQfK68TZvhMOvPxporQtx1MKkvfIQ2BLfVAcp2jXyyKoVoNPHhlDsDkwQ7WlVGuHuK1hmK/BYuw80NHYmZlRfdP6ExJ3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sZ/xqgGAiTP/zmyKNhUDNLeEODL0YDBF7rvvKeSzWy4=;
 b=oT/tkSkR8RUvVb3EbZ66e6gLOeoSEG+slUkq50w7a7FHUpIeuY4SbJBrlgt0zdeWU6pnnanPpv2N+3+a74rFYQFRxRPHmc5myiGq+5UKs5LmP04PSk8mZ2LD885sNfVkewSmQ0ReSjNyOXmkn8qSR+ZvJyHL9+BU/HUODnLpo8g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB9955.jpnprd01.prod.outlook.com
 (2603:1096:400:1e3::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:26:28 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:26:28 +0000
Message-ID: <87ecr6nm6j.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 112/139] ASoC: codecs: wm8960: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:26:28 +0000
X-ClientProxiedBy: TYCPR01CA0061.jpnprd01.prod.outlook.com
 (2603:1096:405:2::25) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB9955:EE_
X-MS-Office365-Filtering-Correlation-Id: 20c0c423-0f29-4efd-2754-08de0ad9d855
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zUWoMfBklE2i2gy6xFRa+dvF6O1Zf7xpBkNOu2apruhAKxsvUXgqzkZ8u9Wt?=
 =?us-ascii?Q?YsOecdOwMWN9y6rGMAJ6V3KIVl0GMmMhvpMVoMXMgsIHGqeNSlWOHC5sTklQ?=
 =?us-ascii?Q?LtZyZpCkdnruVgCuCSXidIe1FuTT7SJDCj7wStrb+OFxqOAiJJyIxKJ+evY2?=
 =?us-ascii?Q?4D6nhriU7Nhi5a53xiu11zLEqzrHNxnme85fRO0Y7rj6OIVsYNh8l/1kAbad?=
 =?us-ascii?Q?GN0gtzvrEbrjouLzf5Y0fzPFIC0OCQu4Lm/EwASAT9ZHHaUVx+Jj+zlvIvbD?=
 =?us-ascii?Q?of2nkXED15Ko20UQ2YLs1N9Y7A2mMu8ApYS6JVGJdBNDPurFu/riS4Uw1F2I?=
 =?us-ascii?Q?/LpKb7qODko0mpE3c4+/kqboPROnLx+FAD9UVJbRFLi10iWE+0Y53Mo2+ZjV?=
 =?us-ascii?Q?GhDUFrC+TnRge2H18h3DN3UwhAUUJtviv9wLHRV8n8+KStwVAZn571756xRp?=
 =?us-ascii?Q?C2ShuTGJgisbRerk+6c1CLYcGB0BUsshxSGHYepYRY98vgx3wfujdOLSpjwP?=
 =?us-ascii?Q?e6DKjiZjtU4JFBUqWRwrm8wRn+XunDN5nQYVnBZe91f3aIC0/ZJRBeGvMy24?=
 =?us-ascii?Q?G1R+UcKfGx+9PliKsRqYmThPZ+K6R+XrLwBnEWdA9is6gY/PR7ckbYNKOFS8?=
 =?us-ascii?Q?niivCa+KO0ZkaNZ8HuxQRtbnxsNUut7nETLeDLjSJo77bM8Va6Py9EMNRnXS?=
 =?us-ascii?Q?Ci4oYUcpm9+tYV1xxhF5hR5Eg4WXfA4BeUpEIv++DIFTj/o1IaNj+sqAoR7K?=
 =?us-ascii?Q?LGh30BbQi9DjnUL8AUokm0PdJLDO6heCPExltSAWEnA/IBcOulik/kmlWain?=
 =?us-ascii?Q?2EIF8+RCjjyz3q6hvVtKJwlxvLZrTxXzOnmVMUTxFEixUQB/7OuGVmYaPkbj?=
 =?us-ascii?Q?5oy+B6BabfmZArXtOj31z6kdiAQqzMyG2BhtOiWc89f4lT0fZ3+LY6hAV+sS?=
 =?us-ascii?Q?pbMfzX31P5RGQ5PqMRVeDHdJhYxM0CaqiM38QkRJyfYuhyhrG+hf7cZ7MwEN?=
 =?us-ascii?Q?p4Nj01rvqHQMRo/9KKcSO+77Eh3TG29jSfODE9kgqIsU+wHJ0Ez1qoJDmVPs?=
 =?us-ascii?Q?B+dHHeVPnCmQPVBwlyhMWClPnjtQ5LsbXqpHPVPWAD21ep1meVGA21NQgiIl?=
 =?us-ascii?Q?FSCpb4vkd8/0n/gsBgzEQV+iasgrJ+UVJAaxGQ/bYiPxb2+U+cyzqpLRHotg?=
 =?us-ascii?Q?CEQUgGpjrfsA612LxuFRSB4+YqLPy/l5TbpaAmQ15w6SFA6O3aFZ0gdI/KxD?=
 =?us-ascii?Q?FHJ/7WFZfQxtEuFVKZxMq8cChSzZOAAMzGGqxcupUGkm2AdujahIZ7end8we?=
 =?us-ascii?Q?9cdzeiitks/fmrzFKiUIiGDBfK8R5FIa+PfYbWMZ1YOrsQJ0/iJejwBT/lSr?=
 =?us-ascii?Q?kAz+B0q9uk3suTi6iqqrOpUiDqYsxhO98jaLTIOt9XWFuhuzmKEVW6Up/Mz0?=
 =?us-ascii?Q?pVg7Oe7D91+NLjFrbka3NIrGiSGDhHcAbwg5ewHoeubRxrTWoTwnk1TwoOxh?=
 =?us-ascii?Q?GaOnKEfxgzVvX7r/5VEq2Tifd8cVK5hOaX7s?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LmYjfDwDIxZBu/9mP0q+RX3dGR0fEDg3hFDU8PEEVjygrXghpaO7+O5LLVAR?=
 =?us-ascii?Q?0Yj5YSbyg0smyuYmq5gUFqKg8leqPI8hcShFR4QmiUDpf3TgbpdfpnUtvI5h?=
 =?us-ascii?Q?CHYPlteHuIMPar/xDfFCMdDiN3nzQZLa3ZFFCudold0lFLG5cIs5dnNvloP8?=
 =?us-ascii?Q?ZdrPu/4qf0vqlGW3qjsOp1GCB2iVxGZvANQ7hukbHBl3XioysFFjhB2ziXD3?=
 =?us-ascii?Q?KPROvQgiY0d49/6A6ONIl44vyMnJ73Xhq0jkBBJIOgHQVf3n7fxwo+yGz6RY?=
 =?us-ascii?Q?wVCq7u5Ue0DEutTv/hfgngyc40RiyWVLdPw2ONow9soAuQO9jHSsKuHpBp3e?=
 =?us-ascii?Q?0Jstw7OpLuZQjqYxcs1QRjEZidvXcq3YzxRnhBopxz3E4OQ1iMl1cK2/01xZ?=
 =?us-ascii?Q?iABFh+4G1vOMmOgwRcY4HwYaieLCdSFKlHJ/YfuFrbCva/cJjuvJNLXGSwXG?=
 =?us-ascii?Q?2LGqj6cJFnz5kdPpxBdcy6xScSe6QiGYqbCF4s/RzFhV9gldDCADb/Inw87m?=
 =?us-ascii?Q?G69kkMc0o0OOkKRvNPvBG7ipAzYwX4yG4AtdGbEjzMPfiBObgwcrLHI6dpU9?=
 =?us-ascii?Q?3KnieV0NynM7hTweuZGiDaoDjSvZMiiWDTTow58V/BPlI7fzvpj3T9rPtkv1?=
 =?us-ascii?Q?r2kIOLoLUMIoDRsspGLatDOdJ+koaOsloF+k0CZMDF3rS8BHkB8lYQD+16r9?=
 =?us-ascii?Q?Nry3tv7jgKY+RRiDlUv9jvTADEPFKtgaHofi4CSSymjM4Sjb92cqHaks2Dzo?=
 =?us-ascii?Q?raRASXFqKQZkD7a+DbL8ifR1ZxeHm9EyREsS4G2DhcFtW3dfY+rwsALfBDOs?=
 =?us-ascii?Q?5UrMdtFQEvsAiz9i44AT3u/0xp2xksNn/N0oQuROG83GspyGxuE7kLKqKAjU?=
 =?us-ascii?Q?gMeCJRkjngG3QfhRjtBCHQBbyOZGwlIVYEzXp9sbQG+Qg0iNe7C2j3+dHWHf?=
 =?us-ascii?Q?bAK9p3pZwHuTigy/3+atF3qUBrpSSnT72Nra7qOl4u73OBn4SfNWvHo1hsUi?=
 =?us-ascii?Q?6Nvkz2vzkHYkU+C3IpRLmEXmuGxE67RQ+/97qViN2UkNvykxtitPUY47dC0W?=
 =?us-ascii?Q?ROWq8vpec+Hc2rJfwzqZRAjzm7d7IG8jMS4FCmbWM1lbLck6OE1+IPyJ7WD6?=
 =?us-ascii?Q?iE4IKx5j0hiOidhWol8xSNqxi2AGRDDyRrAD2rCcs0aW7nqSNljbmskkwLzF?=
 =?us-ascii?Q?73EeTKO8Kuhrb3Tg2wdfiLQ1XHSq9gY0Tu62vezcos+suVvSWgI5FwxKEKJb?=
 =?us-ascii?Q?cgqtWGOoxfkPaJOIFn4cDvFY2D+Ia6kS5sY9rqfC3IQbH82BETwvGC10/L0A?=
 =?us-ascii?Q?BAGFo0tZt7f/LcHncqo4pciq75TrbIw9X/PZf0AVpqMAC+wdft92GGYy2mBM?=
 =?us-ascii?Q?3fzIHeELj+0sVdaVvEVWc8TkkAIr1LTcTInPx3KPDDMXGt9+LDszFr0M3A0x?=
 =?us-ascii?Q?ny03CDeiFedwiTcZtW2tPnnOzN/QOKQ3tLCckrzEqs+Tan9yHLse0aD3+ztc?=
 =?us-ascii?Q?27Rl/0gxNYJ7L4LrUKCmm92Q+ZG5V4RWFUfLjOhibuM2F6oQtA3BklooZY09?=
 =?us-ascii?Q?PhWRDSotB5LP1FLbST6yqieSWaoadpl8EoDOMg/cPdBSXSPLNP6WvndfTMRH?=
 =?us-ascii?Q?Gk45ggpUZMKwtDvgOw20dvI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20c0c423-0f29-4efd-2754-08de0ad9d855
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:26:28.7766
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ko6iKDUQztr8+542f/NMFqentbD3PctXJjSizyZUUrTVphdVad8lb64T1VJ3tKHwr94GTXUEaNDnmu6MZMASjnYGxoqozSC6aFH+PLkWy58/aiSWOe2pWoNj35wZxa4X
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9955

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
 sound/soc/codecs/wm8960.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wm8960.c b/sound/soc/codecs/wm8960.c
index e6525b4cedfb2..740c3f7da2a50 100644
--- a/sound/soc/codecs/wm8960.c
+++ b/sound/soc/codecs/wm8960.c
@@ -211,7 +211,7 @@ static int wm8960_set_deemph(struct snd_soc_component *component)
 static int wm8960_get_deemph(struct snd_kcontrol *kcontrol,
 			     struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct wm8960_priv *wm8960 = snd_soc_component_get_drvdata(component);
 
 	ucontrol->value.integer.value[0] = wm8960->deemph;
@@ -221,7 +221,7 @@ static int wm8960_get_deemph(struct snd_kcontrol *kcontrol,
 static int wm8960_put_deemph(struct snd_kcontrol *kcontrol,
 			     struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct wm8960_priv *wm8960 = snd_soc_component_get_drvdata(component);
 	unsigned int deemph = ucontrol->value.integer.value[0];
 
-- 
2.43.0

