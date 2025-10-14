Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011032.outbound.protection.outlook.com [52.101.125.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EEBB3081BB
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760415636; cv=fail; b=ZaMLHNQXrxrpV93WgcY/NgkiBCcGaxRlM76F78e7r5lvkIV3qMMfzOon9YOQ57AE5xQfaPONgNU37sNJCj3GdR+NI/voXU+1psasUirFveqlNPdsWC+q+U+9IFrcW0SJaOM1o6ppV2aQz9B4tWzqi+/G8gZWEyXxaaGUYstNLtM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760415636; c=relaxed/simple;
	bh=4MNfOfmOAE57HMUsPXar89T3EAgvyWY7ue1APYO/71A=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=rBtkQE+jF0Q8VizuyJUATFLdnDnrcj8+lgJ1/n5WsqaawQX2gLioFd8WzG7+ilqleoiJZxjCmFfjykcvKJkhKy+t1xBIWiDHNGNS9FGRAzp08XKHQRTmPNCqsoraCYKF8YDas2gHHWKVEYZuxH8yqFuxj23zb3AFcqUzWSbPsqM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ZhM/M2rX; arc=fail smtp.client-ip=52.101.125.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ZhM/M2rX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nRv9n4+I/CxOo1qxQHDnoC3Vgae12ednA0FRlyQyJH6t+Xy/AE3XRb5aEHMt54GNOJE+rrEfjgU+FNkGRYhe+Fbb/bCWSLHHGc1lDAsaYlhSiF1n4SnJamxxfz8xcgkgRXwBXwp1sGfkHm8qLjGqk1HWK8GmDQgApsDedgqIInfstUPnQo3qUpdqLt6Ltq0u3dI+9iGX8SY2fTUBumGafmiIF9MEhSupepp0uvsNYQoPSLGfi6sp+u+bLtt0okxG1CoYYF7WtviqocB0OR+Rq51PEFWEN0WaIhrM7kCWX5sHHuK9U37I1G3l+QXUoNlB//6G11w9Xf9bjDMZEXZTmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ctdh9MjDKk7ikBoKgponO4c/yJ7gBinN912U48stdxs=;
 b=lOGb2eq9/Pn1buT4vGl35CIGQcy6cRtvZTstkGMjXWeJjXfm1BKEX1qDvF91WXzbjT7BjFxr464XLjfKbSZ0kLJoEb+rfqko6nRqNADRbtz/PnghVnKWRosx0e2gN4mDMEWMupTnab5XtWotHUoOpo3SYrX3SPjxM/uthIoiHN5fGeofiXPWw4fs24qglnLPQfDzi1o7yUG0ssrHrMzS+pDl1PoVoo0kbNo3iDq5N5Fcoscgxju49otbmh8Qgejd3pDx9NXAMdEWZySzQW/b4NzTsVqtHN1M70RaeEUH05f+5Mi2E8ug9hgCdVIqzAjAbf1mwD2iUIe0FdN4PcvPzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ctdh9MjDKk7ikBoKgponO4c/yJ7gBinN912U48stdxs=;
 b=ZhM/M2rXqTSGcJaULuRhn8EWdG3eL9D1Yna4M81TV316ab943w0BsYpJZQWQnJ5SxqY3yqN0b4pWKzYDCBFSzVI3tkS/jhCwb5/9TNqsrFutsZR3bgUWn8/f94lfs237FqU3JMEOjZ/f29TYW+P21gVaP4Dlz2IjNDKjxhwjxjo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB13923.jpnprd01.prod.outlook.com
 (2603:1096:405:1fb::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:20:31 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:20:31 +0000
Message-ID: <877bwyt8q8.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 017/139] ASoC: codecs: cros_ec: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:20:31 +0000
X-ClientProxiedBy: TYCP301CA0037.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:380::9) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB13923:EE_
X-MS-Office365-Filtering-Correlation-Id: d210b10f-74cf-4957-3913-08de0ad9037f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uVzkmo2+g5HOGR8xshd2g0BpNAcKJ/231oqYUMxKYYauxcQkgrLGXTQ/Xbhk?=
 =?us-ascii?Q?STUK737knjuoEk6RO+xG2VUa/NPF+yFAs/2K6rmDcx/5rncJTWbhXoYcOGA/?=
 =?us-ascii?Q?VvMkJATrEaGXaIXGSWrj9ZQcgJ+BvhinslVr37aja6aoco2hDGnkIjagN9Sv?=
 =?us-ascii?Q?J0nKIg7f49XO21KH+J0LaQZayTIGvTpvWPilEt3SjW7pTzN8Ri64NqI8MLPG?=
 =?us-ascii?Q?XS6rxlR6qywuhEoTvMG0QfrZRjVy/T3cbcOKsffZm4637P9/hkIOTMlO2aE/?=
 =?us-ascii?Q?BPFq2HT3+U3XdVFaqA1iS8e2mDctP/K/AnxRSW+h1WzBSaMHvjqjNU0Q8Vwt?=
 =?us-ascii?Q?oBMFgwWxJiV21F5xXKJMFnJTJMgIvB7LbBB1yqZeXse7A9z8Tf+tOATvo9/w?=
 =?us-ascii?Q?36xHfNSMFaXF4Db2G17g+WIx3ZXQL1Vk5YG0UJaeJ15KrNNlc83leN/Lmx3P?=
 =?us-ascii?Q?dkw7QfFI3sTDpuIzIVbYgn9o3QFxZr13bjtJ0rmjE1zyG7pbSs7TC17bt5Uv?=
 =?us-ascii?Q?yBDHM33V3espFnHI3fwL+YcJ1By2O3uVKNCinb/Kc6XDt4wXy3F36qWK1b9x?=
 =?us-ascii?Q?iDILAftE83rVOLo3DlND4S+kmJNPyiNT9XZjornaHfKj5vYm2yZ6M4osz6UJ?=
 =?us-ascii?Q?hvsFjn8OwS5JNwTs/N5TKrillf7Aggen3vk3UyLQsNb9W4EHP7C4e56OpUqu?=
 =?us-ascii?Q?+xr70750WceNy/FTGio+3sexma4L6yz/hYdafFOVtfIqPZCpVS/1qSt1B1Uv?=
 =?us-ascii?Q?Tx92J5oAm+/aPypYBsRFnAmLKYzqNcgVyg1AnYik0bXx7xfLTiwo2bmIu1dA?=
 =?us-ascii?Q?k3HYUrft24XPU1hWeqO7k+PEF2hB4aClDVUhcxTl+D0ukbHzf4E2atTSxx9T?=
 =?us-ascii?Q?p5Sb13LQAXQ6x4f2+ywtho4zOyz9m1D0KusgKEHSA+M5OCXImAGTFD91xiFZ?=
 =?us-ascii?Q?VQOFPEDBf0Y0BSDTurvaoDmeQsfMuZbRWhFKK6yJHL1DkuVbQgiLMagaU5+x?=
 =?us-ascii?Q?tgqLexKgueU0ZklkctaR62QiAj5DIMemqPMMZxJVC4iEFlvd7lE3R2AOswFy?=
 =?us-ascii?Q?rHohJHa+HsWyJmxvGmzIFdB4BKLv+t+Iq2v9AYQGBh6XZTKADvRU6PfqV6Yc?=
 =?us-ascii?Q?IMTVPZyHsd/oVH14yarN8bvdtWqLnGUqEnIL9eM561riSUT0d8KjDmndC2QG?=
 =?us-ascii?Q?wtzj+uqSKaRX/FhOX7LKkrcpeyD4c9qqZfpV+5f54GY9mgQBEqnP2GVm3NYH?=
 =?us-ascii?Q?2yb36IufAut/M+E81Mwk719qtLd1AiWDB/6sp4YCwhDFu1q5e3bZStSwoyGT?=
 =?us-ascii?Q?mjphIjLexiEb9DQEDBY8GRKGdW/iFa23/PEb4XVlzY2oFcbzHTuYp7YiRu1Y?=
 =?us-ascii?Q?WJ55OFQCxQ6gjug0SWrguc82eAR/ahzaWZnVeQO1cnKySW29cesuefleut30?=
 =?us-ascii?Q?LkoLlkK96+5NM5IY4CgYp+SCLoWlRwnhB0wrggGBXfw9YhOjt79Nt9VcSp/a?=
 =?us-ascii?Q?G7+QH0ffWlEL5CpIASoXYqf6GWhNCl6OfCAQ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NLDMN3KTBjhko676w5Om9m8w3ThXmtMwfzopZS2SRqMtLkqRyJRtYy0yFmgf?=
 =?us-ascii?Q?Bk0GHvNC8ZILUqW8MtytR7vNzVC64XdE5bB7edRKFpr+DbPzQrM1DAkqfSmN?=
 =?us-ascii?Q?fuxRlM2Ya4KL+jZInt8B7y7fL5pli06s1Y6RaVc0WxmoG/H1ncPhIjWjse03?=
 =?us-ascii?Q?qCja4HwkMuNMQIhmEd+SIBB2Wzksjd0+r10Gk6wHaSLmII2/+PCwZO8QdcGe?=
 =?us-ascii?Q?k9fH2qOKhGL9wDjxBoUb2K3s0Z90cMsTJ5Vor3sQFb/Ly1Uo2R7n0IyK9eS6?=
 =?us-ascii?Q?iv1nb4xhLyiT6EaCryJMzUr+ZxacJrvUaKdsXHtTwN/Z607e4is3rBt8+tSL?=
 =?us-ascii?Q?2jsSWQtSGkUAbrYYs3Zo4aCjZw+b/meT1MC9qAEx99j9sah+d9ly3CzQcTJI?=
 =?us-ascii?Q?FGhT9StxCba2uHo/Qw+IxsWFnaSKeajD+h+weoUC8X/RmeTgJTDIkOg/ANCz?=
 =?us-ascii?Q?Z4Xmuf7O5fa4ASqhfohoZrtAmrBoNkiWGxCDuJVqrePHmHejn40MWSx6Zjba?=
 =?us-ascii?Q?396EILbjQBTKegYO1ZFXe/633iP0N+DaD6JBOyc07KV04rS6NhfLArGKLXC4?=
 =?us-ascii?Q?uEAbHdByD31w2FDyFE9bgMFa54pDJNpbKCn25w5JCP8uttVl9q0ESVXWgea1?=
 =?us-ascii?Q?1UybM9H/nFmsyyd0BT0+MglenmZMCS8ekNvQaH3olfsQWAZPY9OYMUNkhaoe?=
 =?us-ascii?Q?ueunyLD3cBfKXAPKXfsCWp4oytnpdggSagvl1Hm2dUyz4EVv6LnTeGiT4T5Y?=
 =?us-ascii?Q?5zTtQ/NsvYzHHhmoQKjyT9B0U884PiemQqXuKokN5FFklkeLAoyQe89aQ3sf?=
 =?us-ascii?Q?WqevHbHQc8p55rlmM+JpIW4RajOE2fBcVkSu8LWksw3mZdcjH3LfHJ992UEY?=
 =?us-ascii?Q?HnRsRLoHAflYbJUnb42V2Ld+s8li6TbvoS7eqj08SRuh3fwteocnT0dGZw5y?=
 =?us-ascii?Q?Lhq6Zn8TAH07ZtGe6ScbqId+lBRnAUPQQCB5pD7WUWQiIRyh5y8xdLKUJYTE?=
 =?us-ascii?Q?DbQ2wK0dwot35m1572rZlBBJ0fKpb1/3CEOBOX9YQOc0PvScSP4QCTpGeRa0?=
 =?us-ascii?Q?UneEP0mRAQn9vRT0K5hs8ug+6X3lsX0C99lsv701ia8e+u0t4DJmWfOTj8VO?=
 =?us-ascii?Q?ph7QuRf9iHGyuG8QJmWZDQ2vR3fr9QyKUXlB5DimOoXDYNmMSBOTZ6B50pkF?=
 =?us-ascii?Q?Vs2WwMoVXGxdk22Aa8HqpV8H+vkVo0lA/7v6T91J88QkWcwXMkmSLFYm7Wmf?=
 =?us-ascii?Q?9gkGxmYmQH+A1m4dV1EuidMz1N/l7b15Jbhk5m0C3DVP7qVLXbu0s5FWngHc?=
 =?us-ascii?Q?cwcPrN1GXAgwVE7L91c49Rc+QXWvY6Dps8pQhhv45fZrF8euWDM8yXqMvMHT?=
 =?us-ascii?Q?mjHipHqAUZc090oEBYsHmzuCzyc0AAwkHdK2oR5eODGXTu5n9HGHFXEsSk/9?=
 =?us-ascii?Q?b+dIoFNiLevEiCNMTeJDJ5Cn0AjHwYFLY+NYVU0RB8rSy/xp8b31tlV9OiPv?=
 =?us-ascii?Q?uwi0wGcJHbhtC6tZTm2gzbUQzhUd214XXO+6g1gtJ5tuZwtaz5TWKrIlM0mY?=
 =?us-ascii?Q?/cRUV8eLoS9KuUAQNOB3cvuPSQlydeftVvdhy1IbbtNw2dwKYGt0/e9eVCuF?=
 =?us-ascii?Q?VpZ/e71C8NwczuHjE6HsgWM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d210b10f-74cf-4957-3913-08de0ad9037f
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:20:31.7588
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Eh4Jj2abD8WeiWm41e5/unZy9ypAzyohSO+Dh9nmcADNJj9HQAD8RYDNH+SAHZ4XJ8ZpIuvg4IlMAsG/hmI/pk1smamj/k5CMzTaZb0bLEjUW3kualUaPFrw2xios45f
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB13923

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
 sound/soc/codecs/cros_ec_codec.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/cros_ec_codec.c b/sound/soc/codecs/cros_ec_codec.c
index 937c8cec682ac..f78a85b89d955 100644
--- a/sound/soc/codecs/cros_ec_codec.c
+++ b/sound/soc/codecs/cros_ec_codec.c
@@ -108,8 +108,7 @@ static int send_ec_host_command(struct cros_ec_device *ec_dev, uint32_t cmd,
 static int dmic_get_gain(struct snd_kcontrol *kcontrol,
 			 struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct cros_ec_codec_priv *priv =
 		snd_soc_component_get_drvdata(component);
 	struct ec_param_ec_codec_dmic p;
@@ -140,8 +139,7 @@ static int dmic_get_gain(struct snd_kcontrol *kcontrol,
 static int dmic_put_gain(struct snd_kcontrol *kcontrol,
 			 struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct cros_ec_codec_priv *priv =
 		snd_soc_component_get_drvdata(component);
 	struct soc_mixer_control *control =
@@ -633,7 +631,7 @@ static void wov_copy_work(struct work_struct *w)
 static int wov_enable_get(struct snd_kcontrol *kcontrol,
 			  struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *c = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *c = snd_kcontrol_chip(kcontrol);
 	struct cros_ec_codec_priv *priv = snd_soc_component_get_drvdata(c);
 
 	ucontrol->value.integer.value[0] = priv->wov_enabled;
@@ -643,7 +641,7 @@ static int wov_enable_get(struct snd_kcontrol *kcontrol,
 static int wov_enable_put(struct snd_kcontrol *kcontrol,
 			  struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *c = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *c = snd_kcontrol_chip(kcontrol);
 	struct cros_ec_codec_priv *priv = snd_soc_component_get_drvdata(c);
 	int enabled = ucontrol->value.integer.value[0];
 	struct ec_param_ec_codec_wov p;
-- 
2.43.0

