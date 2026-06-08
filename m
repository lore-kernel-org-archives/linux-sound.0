Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011045.outbound.protection.outlook.com [52.101.125.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 546E42EACEF
	for <linux-sound@vger.kernel.org>; Mon,  8 Jun 2026 00:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780880297; cv=fail; b=itXnT2Xo0QSenMgbpGkpa93sb01Kp6x7uXBL+dhdgyKosaF+F4V5/0ZsdGxwsQnZCr5lgtDVC4VTyN4xQcdQQC3uMoqZd2mPUEb6gdr3egfWCoJH/VGeGJC8NVv4VyO8qz9T9TEPidszhuprClpzJyHHak9HqMWZV4HTeseB1KA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780880297; c=relaxed/simple;
	bh=ZYmkfv0sTdzTafRKDdI6w4frh5JDAE37e3EJwx+usP8=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Sfx19zq7tTNW4JDpAOxcD5WxXcM7nh1jG1kqENY5kMJAQy8Ya3uJkWYccpjpqqkXUEG87vQbPJkBfCALMYz6uTcayhiTPxoV208OZ2AzvOB3Oju/HoZftbZ82AintA0sug/umW/7PibIr1T2gBofBeSSeAHHMwuZmKpiwGaW620=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=GY3CI84+; arc=fail smtp.client-ip=52.101.125.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="GY3CI84+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FQ+P20JyBpm9sFKl/iXIzSbXbEr5ijKt9vpXUe+BaK8Wr2pM0bjcz/OHWsBMW/lYp2G/ycFD73zsOl9UR9S0s1ad55Wz0yTaunkkYDhfByM+ZURGygNnFPxBoPZQkMxDLRsd4yEZnWA/RQhvS+MmjoIN9XUYwolldEYdwTjSjzwO0BNCDhI9wj+IHcoiFWVL2jvldqLtwJuGfpTmEHYMHMFtqAlTrufwV6herHErDwgzUZFFXV5kfOCazt1pTURfFip68xoYFRFt+Luds0IxZSqVw8Unatim/yHvsDtIryVNFSJllYodkwRVza8lYsmMsBq9/YNRxaySw8G2fu/4XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xWL1wz6YMVzYziM7ji7ZRfr6iS5QWwHscTCFtdU8PAg=;
 b=DvX9vROfgDoTCmwGsvscucvi7ZKCM+vIWFKe+IJT6mWij+vHhUNutk9TWkm2ZMhuaMgqqkucTNuvFRphJjw9tKubEkz2M/9ByXea1e9B2CX2BqIXTSUoUF2GD/JCOLnbGULwTO5/HDzdjbRhi+7kD5VJ/qKYfJfHckMZ6QwFCd9vq9vPxA9eAV0OKImiRfnLU+DmLAbT9uqP/1UTXRHZWkScjkctylubXxjddi/PZPfD3hHUF3apJc2XnLcvHZ4zMXLgCOszFI1XsCp3vNvUvq/wiHKbx64on0x4VCqUb4AQq5EqL2UGri9YjJ+5j+B3Hk+MpXn5etJyfXu13AX5oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xWL1wz6YMVzYziM7ji7ZRfr6iS5QWwHscTCFtdU8PAg=;
 b=GY3CI84+QKKpkfYRR+1Z/2FL4Cv1z/B6hnuCJKcRKr1/bhotbaNeL27hVz5wO25hCEdHc/7h8MZ2sJcGZApAMn3fMni51rGrHWpoyykFFVJxqslKgzg+sGfCLUa5lP7RVwsvkYaQjlFl8NS2JOHlt2O832nbBFzE0rRtQGsFY6g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OSOPR01MB17966.jpnprd01.prod.outlook.com (2603:1096:604:478::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Mon, 8 Jun 2026
 00:58:14 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 00:58:14 +0000
Message-ID: <87mrx5etll.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 7/9] ASoC: renesas: rcar: update auto select format
To: Baojun Xu <baojun.xu@ti.com>,	Geert Uytterhoeven
 <geert+renesas@glider.be>,	Herve Codina <herve.codina@bootlin.com>,
	Jaroslav Kysela <perex@perex.cz>,	Kevin Lu <kevin-lu@ti.com>,	Liam Girdwood
 <lgirdwood@gmail.com>,	linux-sound@vger.kernel.org,	Mark Brown
 <broonie@kernel.org>,	Sen Wang <sen@ti.com>,	Shenghao Ding
 <shenghao-ding@ti.com>,	Support Opensource
 <support.opensource@diasemi.com>,	Takashi Iwai <tiwai@suse.com>,
	=?ISO-8859-1?Q?=22Uwe_Kleine-K=F6nig_=28The_Capable_Hub=29=22?=
 <u.kleine-koenig@baylibre.com>
In-Reply-To: <87wlw9etne.wl-kuninori.morimoto.gx@renesas.com>
References: <87wlw9etne.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 8 Jun 2026 00:58:14 +0000
X-ClientProxiedBy: TYCP286CA0098.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::19) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OSOPR01MB17966:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c616bd6-32f5-4666-8222-08dec4f9050c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|52116014|376014|38350700014|921020|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	f1zPDctac66YdFDYP1HtOI24Yhl5XjDASUZd6xKDkzoBPKUQfkQK7vE7MB7AuWsKsYpSJymVd3gNnanRGgW7kRtB/Ofk244Cgz8p9mT6yTSxcOBkuOrNIarcyj63PNKB/+Cco5b3GIEIgNUtZFMfZZEfPzOaUxIBP3esBzUWuN4TBYv939GkH3WzEkaM0Yk/GZ+xFmlhIJz7aYmfddZ2pSdBpEl+uxBI3qoU6DtYiwxqGUH3bkkRCqkIzd31pMt4LUUmKn6J6R+V3R2o+xoYo+CE/hFS6198tEFjdMAVlqCYmOvL9ZJaZmCqCgKeCZQlmmGq9HHFGTQKdOFmZys6eeRrCNztVKfSCaBJBeONBxgxEt6w7Z5qxeSFsyY23cnHrgH4+H4sUsX2c9vE4TFy+ZAalPZYkj8ta+NVzUvbd/jB19F9ZOsbYKTjmWHR9a3hEj0jrVBdlDaZZNFdZqcY+gvBBRFX+WuZ55UnUNpbu56XafUGimX7J1f5VgWTVVxPInA3EWyo4NGFt6VVPH/37tUzlZ3ER9NUpBlIbmRoXdieMNWqKkOcPcEqilTIQAUcrjy1mSADxJddcmaFCmVoV2KEm4KfdkQoo2O3ypXYDddMklvD86+nUTZS4Uvuj9M4Sx8eCt2E9zwmc/GdHzr3qqIK0MEE4LnuoHOCGsyForaXuF4WknMc5swrBQclUieCUcPhTgqqRK70SjO6AsZuuNOy2p0stbNeBwiBj6yWtNjMNjMZQGWR7ktR4TH6h/1M86F429PaPvHisQY6t0iVEA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(52116014)(376014)(38350700014)(921020)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RLY2E12QQErFZAN8LciqILlzSnCrxRjvcD5kgHm3j9AlZad6+tc+OoWd4gPE?=
 =?us-ascii?Q?3b0ScZayC+9V8P91/NsXuZRKXjtfiWPcQuDUPzQstNaNueSJnsWItqprWjrC?=
 =?us-ascii?Q?h+09g7/zAwmFiSwxELepFpcnQL0j+3menkyt3d+jS+y/7fiqKWe5m3QCSWSx?=
 =?us-ascii?Q?ydmOwembp+TK7axncrmMhMjPoJ0CFmF5ciVTngkMdcWAKQY3xQZy645p6w92?=
 =?us-ascii?Q?PtJHoFmzzUhPno91ZNktlINMtOLTpE9fxabwBSe7hnYRDTCk0odW6Ol2DpPG?=
 =?us-ascii?Q?/I4Ie2bQ3ATwTTf8Qj8ZsAA9X0VGnoSHE6Zmd2SnfvemzTdInMQMvu6ONyC9?=
 =?us-ascii?Q?RPMPXyM4XGtpFVbQNYS7SEflhjv9apXF6Vj4phh0zJMMCo1LeSzI9HNU5Fto?=
 =?us-ascii?Q?6PmLm2MkpHWTkMuM3P1Qpj4XyVM0ie7v3aj3ko+650/N21pdyu0zpm7deNky?=
 =?us-ascii?Q?FlFhARl531rhmh50icX9ZwMX8BeljM2//IjYPh2BrIhV6ZJTzPiTC3kLihx7?=
 =?us-ascii?Q?sc2NIxW8in7AuPxbxmQPRhbL0rroDsdySE3A9b66ycfKAUPaC/Kj6joRQdLX?=
 =?us-ascii?Q?AY/DkT3SWFixYiDdQrLXWzzuBMe1VijZfYbvSUMeSZMEnrnZV5TldJhUEI9S?=
 =?us-ascii?Q?TzsridAQjuKXnTaInFcjbrLCLOVyzVjCS33lyOdwG9SBnFHMj8z9TQ31MvwX?=
 =?us-ascii?Q?v6eDejHgKsOSUuHltMNGC9IpYjA7WDyokQhiCf/ohl4GSJtBT0689n/5kft7?=
 =?us-ascii?Q?7dO19/Hq+Ilqi7xZqvjcCwKviiOWZi3CJQ/SiYKdFNZmOs2iyY7yu4hsz+lh?=
 =?us-ascii?Q?m+GU73F+ltfkdgsDvEK6h95CixhgbdRVenqLYMqaYNx0pF03jI7uBmnaIocJ?=
 =?us-ascii?Q?TSyn/F4QfOSeqGRywjKZZmMIr12/0r78CLoKJ/HCWBtOwdCKMXsECuhjGF/A?=
 =?us-ascii?Q?XSoADH3k+PY4wmRW0Zuq0Zre6J18Y4bFrmnjM9FvsQR9TO1mJQytNBCT+krg?=
 =?us-ascii?Q?IHFReXguHEHCNY3lq3/oSHGZA9mbvM/P1Meh6kaBIk0nsUmQ8/bF64/1Jcdc?=
 =?us-ascii?Q?S+Tt6lPE4ORSLXw9tGK9PtPqCUsHeEFIeJq2PIX7eBTNrY37ZQTNOKrXclJl?=
 =?us-ascii?Q?KEh/BKySuZd+adFNHnoU22hsYUj0W07f9kfZz8rMVjMcRtFPAlad6NyedmVB?=
 =?us-ascii?Q?1lyI3vNlgx8yCrSdmZwB5zt4SZ400nkO6Dy8cSISoN5BllPvsnUL7Dq2FA5E?=
 =?us-ascii?Q?lbMLVn45uUksos3D7zINKFcpGrTib3xHuY3GaKQ+D/kpzJODmlVdv9VXc518?=
 =?us-ascii?Q?i5uq0uue4/r+BAAxsLMydtm0B216pv3y4Gz95iUa4HLm1QeswLN5L5LnNIRZ?=
 =?us-ascii?Q?t5ekCAsJ+IvIB4RrxVHostEYAyHuOpQ2Yv37Ow7Ob6eNGcfPEpiU1YUdNoNU?=
 =?us-ascii?Q?gQjik6uXFqiZuV33AdrCjDT4bRUasUxFXetSIAIxopxNeU4bCjI8PiEjnFsJ?=
 =?us-ascii?Q?xx+ufSUyf7mcGKDlVUpmWU8QJYayp5dw8dcXFJlLuo1V5n8PyH5gxiAB97MY?=
 =?us-ascii?Q?Fp0YkviIV5qUwCAitSiH5iZV88zNDQOQBH6J5M0ERkjnKRsjMIFTXj1xsk37?=
 =?us-ascii?Q?QJYOpxzf6o3IUeA/P0Cl/YDJqmbeDzGe5UcvEVw006kk0oQMo8Xa9VusMcd3?=
 =?us-ascii?Q?WBLbsgExJua8tobT4zV88GZbYFDKhfDt20ka1cCKuhQvdqpDlkyq8eXMnY/G?=
 =?us-ascii?Q?kB8AlHE3P+HhRjyLKjg8a0wnNhLCYfsRJY8EHpl5oghw+tgP+kkn?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c616bd6-32f5-4666-8222-08dec4f9050c
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 00:58:14.5746
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qQ04nDhrcIyMqxtl7pfC+mOdJe6RnKK1JS4ECf+wjSQvxWiYJVLnLrFJBowhgTg7XZFrvuGQBgZ8C3dbBt7VgwzwuTwVKaWwV5d3sWzqgparrePjIQd6WeIxTqw7y2Ph
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSOPR01MB17966

Current auto select format start with the highest priority format and
gradually add lower priority formats one by one, and search matched
format. Like A+X -> A+B+X -> A+B+C+X+Y... (a)

But in this method, we can't handle format if HW has some kind of
patterns, like A+X or B+Y etc (b).

Current drivers are using (a) style, this patch switch to use (b) style.
This is needed before update auto select format method.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/renesas/rcar/core.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/sound/soc/renesas/rcar/core.c b/sound/soc/renesas/rcar/core.c
index 82fbdd550714c..b7954746e9533 100644
--- a/sound/soc/renesas/rcar/core.c
+++ b/sound/soc/renesas/rcar/core.c
@@ -1071,8 +1071,15 @@ static const u64 rsnd_soc_dai_formats[] = {
 	 *
 	 * Supported, but not well tested
 	 */
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
 	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
-	SND_SOC_POSSIBLE_DAIFMT_DSP_B,
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF,
 };
 
 static void rsnd_parse_tdm_split_mode(struct rsnd_priv *priv,
-- 
2.53.0

