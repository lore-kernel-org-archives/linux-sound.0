Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011034.outbound.protection.outlook.com [52.101.125.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0373D30ACE8
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760415953; cv=fail; b=azYItsDZQq+2D2p+Ng24xPqjJAm9iVrXXcB9Cg92ZsXv50QoN1f7RByoQqUGps0XNgJzZ9E+uejbf7aXIHh9wJVko1W8Gmf/NCvTHolNDtJL/j/pox+YdQrLiwFksVVbC5kS3d0LrXOQCS1a0LxRwBCmwUcH8NRVeDZtzLxM4Ig=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760415953; c=relaxed/simple;
	bh=h31gKUfSRYMw/kUK0Edth67QBSHCauT7V1Okgag50WU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=jIzLvLvkBzzUE8OcCc6MoGs1lua8XSk08MBXm76sIv79nTrKq3S9CyIpsSZeM0osN6ff/GPR0jeWzk0qWFTQwcnQI39Cxj+i7k796dl9o86hiR7OHazESujSfLO9MRkZ3gu0MZPHZv0irYHhEDgMOSx6JFdRK33hnA/+UqzfRFc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=FJq3C3a2; arc=fail smtp.client-ip=52.101.125.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="FJq3C3a2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FgJnQ1JRw1quCDwVuwY+gJWo1WoLyhM86Sml/5mB8TvxCVP5uMuIVGuvBcS4YLwNsOIlvAi0f2yeEpgZiqNgwPWViho3PjfbV2tywEzbvy8h+xFDh50bKx0YJtSv5DokPb5CouLK3hlfDneviwvTa1bPcqRQIe6vWGYmzu0qxmMq4hWKk7vHBnj7tbep6dnrg3+2iuCcHLwB742nWfPVQhRHct9Z+ErDPuRX6NnHcm3rjuXyTRsTXEdPKuSdADYo4Yh/4y5IGBtME0NsPqtlBE9QbXtNrFBx09n+Wsvvq1A3b1S0mJrxKMj43jUCNvpxSFahow50LkoXqehw6nUkZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=moDLLlt2uN906u1G3Iy9KrbobCvJQ/aSIZ/FGpZ/K/g=;
 b=B1p9oKHRYmIUHu3XyNXZ6D2jrLSVRvxYWwY9Ryah0wX4ndiLcyW2DQOksy/puyP2Sr4doDPQ6y5xfdOI54JwKDDFwgUSiZhcj97IdzYBzf1cZBJMwQtMGkdHrxntkkep0wEYQuiGYvCt5PNek/tO5G3ibIb3jQwFtPbQmR2XuPban7AUdDFHd5tsa7c2ANIJmoXu5C0EoEEWwv1hcfSau0/eaYvDvOyMPhYgw81OfrwM3Bm709j+HNo9/hpWl8DcsSnKqM+uZt5p0oSWMBWmulv47LgJS0tRZwnNV1bLyPCNSbPjkgxfe8DEMaQnSVTVnzCmJrClkwip2YwZ3Vh1EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=moDLLlt2uN906u1G3Iy9KrbobCvJQ/aSIZ/FGpZ/K/g=;
 b=FJq3C3a2U2l7knTASqLPEM9K2fuY1L88Pr5lyNB1zP/p8lukoVVBS6V5PnqOYR/qPzVSQLYypW1eQ6YJqXNVsBxiXhfMArFNkOcNdx1qxGkJ0F0PNc6ZndQH7BeEm8/iPYzV6o0I1zqsVsn75tPuD4pT9AfReQNT5w1dTPoAR5U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB9955.jpnprd01.prod.outlook.com
 (2603:1096:400:1e3::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:25:48 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:25:48 +0000
Message-ID: <87tt02nm7n.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 101/139] ASoC: codecs: wm5102: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:25:48 +0000
X-ClientProxiedBy: TY4P286CA0091.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:369::10) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB9955:EE_
X-MS-Office365-Filtering-Correlation-Id: bd8d3a25-b1d4-487d-ff7d-08de0ad9c089
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cCAfdPFsjyMqw6NUaqA9QdqH0SbxCnbcWst36jpjIXDCVVd/vGvkBN0nrV5a?=
 =?us-ascii?Q?wE4OgHG20qcFfgZ69OVNq5qDN+CWU9iyx1oGWdJJvZrdaGMSaGEOl2cF5NWe?=
 =?us-ascii?Q?5/xTc+azFzI9S2Gr4mB7yYiiktM+PnoGEMLhujkNGCiuOeHqitTY/LMGO0u7?=
 =?us-ascii?Q?o1rNiMXHD7ffqFKEikJTARAXe0Pw9YWsUHoz30RUvOoU62q6+PopK53vfU1x?=
 =?us-ascii?Q?bJUmMfRhax1DYuDwscSg2ymRmYZvVGGonvSULwydrV62h201pbvsfTxwjk5z?=
 =?us-ascii?Q?HywZq9r7P52vmVnXlO9173IWshwitFHLMiRiACitDbaoB4p3qyk3nvPe2dxX?=
 =?us-ascii?Q?73JJoAOu5MGMAIIcKvI5lQZHcK3or1uAwcm2aZuH554UYCnEwzm2GCAH1fJl?=
 =?us-ascii?Q?zmpZETLnNqXCp25n4P87B7bVpp+teyXOMS899E2gVKRlVOZZ8DmO3Dw0BPTU?=
 =?us-ascii?Q?vu4W3OHIBz5QJYw0Il+cTcj19Ys2hlK+VvPQXgA6hPsUJ0ROjiMSlKak/t8S?=
 =?us-ascii?Q?60jgMHOztM5Fx4vCG+U0/osPoTdHZ9D1mhuN2sJdnviUVR6fKdkh/ptNvO/w?=
 =?us-ascii?Q?YY4vueKN3D1QkwLWrcrCZz8xqWFaiM4wmvLKT8BzYxPe1uP27DVam4HHZPu8?=
 =?us-ascii?Q?NFsBFmD221udHndVBiA9ST2VopxMLazhbfAiU1wDwoLLi5UUlOrWTvcFo+Ib?=
 =?us-ascii?Q?VWOVaSMXeNy7iOUju26pBrNsCx4sRN4H/fKpPlTVMDLL0sGGScCiSdfAE73y?=
 =?us-ascii?Q?ePYyZ/C1eTtWQjlR0CqZ3KqPoHI8U2LRbSG+wF4PR+eIju8MuPHrGxxqYXrm?=
 =?us-ascii?Q?oxKhuSD1iwFemZhWHhJo6qQp9xrv0pb7qSNPuul8GUMHapt2EkqqTFhS59oi?=
 =?us-ascii?Q?Fwv2Wwscu3C2+b3DLwgwhMcg+blMuMCqt90VCafqHd6oTVEH0tR6438LKHj2?=
 =?us-ascii?Q?blmr4+qxz3ZaOrP3wTJ0seOqqog3ixEgwB3SS/zSYzwPB1iraeYDdsaGOrBT?=
 =?us-ascii?Q?LjFEwOfZeSEEPAoUAX0+bSmeYVCADrwBH31zh3yPrsUCb/MRomjJ0KRg/tp/?=
 =?us-ascii?Q?604nZFQ8RHBu9Nq4+dNqNJw8Qmbc3SuHQJrchG0npe5zPhLDpDRf8PbIhrYF?=
 =?us-ascii?Q?Xdk2WzRLWc3Mj41dcutcUwmeAuREXGXYaF7+E4SElbEmpDWPZoiNYWoK5sSR?=
 =?us-ascii?Q?o4J2WzqqFK7Ipu7VjH14i+2R9V9t/YqRyehhs0xuBXQ74tZafauYl5CRY+MC?=
 =?us-ascii?Q?3M2NK+TyIcvUFp4OTXffMYKKZ3U8vE7JEeKwx4yAznHVcdcQspst9yaW3uSM?=
 =?us-ascii?Q?v41IIGtdN7TOYzu093btQjHmE/Dpq2cW8XX7VEfx5pp83eryvI1K6fyQ248A?=
 =?us-ascii?Q?4uyTLw86n3Zfkrot2+JzcZ+hoCZbRcl5e2a5apOumT31u7hGAg8sDiSIbNrt?=
 =?us-ascii?Q?9A/Wt5DTuMKr+epOPHgqUT+mrhowUvapPwgejljUUZPYn4Z7xWRelkD1uHI4?=
 =?us-ascii?Q?gGmGfod7AP9dUDPYEV5Bb3RSIj8b/oy0hDhz?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yy0rnNo1pt7hF4LnJ4V3quFVDal4YluLcI5yOliTuYFce8KU7zdBbhRl84Mv?=
 =?us-ascii?Q?Qw3geRdTFhWgC9kVEb+R7arOi0BHKeC0hpFrrmP5sFmp1w/iCrZoesU/alMM?=
 =?us-ascii?Q?GtfScmTe//Nvr+IaWAs+nep13V4VrMXBONnbkt6K+MvYL9GnONXyQ1/wa0pm?=
 =?us-ascii?Q?ux3PVK/cQBnHKhsyCuirTXl2uXcsSUrJWWyCBN7uY7vxjysf1Gpsjma3tm+m?=
 =?us-ascii?Q?aBZP8hxHg3bSLE8oL7fjjIwR5p6vUtq63EYbYFwvP84m8MbUy1duD510VIxU?=
 =?us-ascii?Q?P1GH7wVth5YAjkoApmi1o5sCB3PzcFqiOp5U+bfroGoM+X918nZT6PPU3gwe?=
 =?us-ascii?Q?bYEXqhpxDRqACkXMvOp5OLoP0xTuwB6HpSjqtwLVQc5h71pioJRYtlSsgWe2?=
 =?us-ascii?Q?ZvGR0l1jlcKi3jPZPsniSUFJB921n+WWXZ7ZYhIPsiyXYhk20phHQX8Zv3fi?=
 =?us-ascii?Q?qTAet6DfhAPb4VHg4WVhv61QMCVOTUJjkESrJaDPtAvlhy5MQ3/7bjUW/+w3?=
 =?us-ascii?Q?RquryXMu4bbFmEjAdNBcTvrurCqogznYcKUBSs7qfGAoMT4LzSD3JFT+SY71?=
 =?us-ascii?Q?PwnTJDBJqg+YsHQMQJFDCvzAYzwTvT73zTiI01Z9bd2lQgI7efDdc/0TDZbW?=
 =?us-ascii?Q?UpfNrhLGwFV3e9LLv6IbO9GtQ1xWJ8mACrYkgkLMgDdvfeyAD1oq6BrP5sq2?=
 =?us-ascii?Q?ODgq+029W8rqOGg/lD4E8YALtb8jnfJgCwvu03uC9GpyXOByabR8kIrdRizh?=
 =?us-ascii?Q?KNqwxapJ9vBOv10iUFu8ZdfjNTAYJOSAjhHmM5qPqXfd3MbvybgLOTWzGLYK?=
 =?us-ascii?Q?WVggEVeO3BHwq8ctI1wma7y87ic/oPbfDtCWKxpeBKdfIzaiWaoEcMBXE1Qb?=
 =?us-ascii?Q?8QwOrNBn/rW3DEYWg+X6ChyygC1UD2LaHeBqP+bFFZqcmwJBZNyrCq5Xo/qR?=
 =?us-ascii?Q?NAk4oBMvq/HYhdqUohbmEeXEYXu1bbpv7F6XBXXGzuZM3Wgpbr1bX2Gw11HI?=
 =?us-ascii?Q?lqkjHF3KmdjFDvXcTmVCXzv/gfllmuwUccgr6OrqtNfBdbfB6faMfBwmkzCV?=
 =?us-ascii?Q?dX2gcI/pwAAbG6G1R5KQRpG3W+Bs5mGi9eJgyQgVHZ3HaFERrLH2OXZeaMWO?=
 =?us-ascii?Q?wX+FuS6Sth735m0zUNySWXuNT8+9i/Wk/+bJUOO5ze+D0unNYMEZv/SHgvdA?=
 =?us-ascii?Q?idJX4zFESMlRIqOjPBpW24X8IT4I1UgEml+FZTQzBIuM1wE7OBEwEWT9jyX/?=
 =?us-ascii?Q?MqsV739Zgj28AuDr1JXBXjWRJb9g/cuJGME/RYysnCBmdnH3U8E7+JZ8t1D8?=
 =?us-ascii?Q?eCFE0t8QWBepbRxpADoB8/O6jdtgJsdJ2DJgxYPqGNkjUW4VfVoaUa9Dz70u?=
 =?us-ascii?Q?obI1adFUcqaL59kd9IzySalxo7rUXoOdrfFh+cvOZ9Y7+BEXBiNGtyVcaCPV?=
 =?us-ascii?Q?2dfIlJIj9McZtcrb/rtCw+ss3DfQoCOIu6WnEFBNZZCV36zmGMpBXD0USLQR?=
 =?us-ascii?Q?el4Im66pCduxO6QpQSVdlBS/lLSpada+F8WPVd9uixhqI47/npOo+WOqJwF2?=
 =?us-ascii?Q?9Fy6RGs0UDp7xSQvrG2OSuUJtbtB8P1Rvi+CjUE8oMQOrJ1+LfnIjUDcr7mN?=
 =?us-ascii?Q?lDmjCmPT91sgBwDdONIlzTo=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd8d3a25-b1d4-487d-ff7d-08de0ad9c089
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:25:48.8640
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KxhkvmhDzQ1RqThCriSmq3HLPZkCAYFJXL9/raifeOl7KZOC6+1/8fuR2VDrS/0T7ws8TUo3gpMEyMleqpvu0EijwocT0rRJYaXv31nzLaZMI8du2kmRWQD6ZkVFID9h
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
 sound/soc/codecs/wm5102.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/wm5102.c b/sound/soc/codecs/wm5102.c
index 9fc7a8325724f..4f5b4b85c2fe9 100644
--- a/sound/soc/codecs/wm5102.c
+++ b/sound/soc/codecs/wm5102.c
@@ -664,7 +664,7 @@ static int wm5102_adsp_power_ev(struct snd_soc_dapm_widget *w,
 static int wm5102_out_comp_coeff_get(struct snd_kcontrol *kcontrol,
 				     struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct arizona *arizona = dev_get_drvdata(component->dev->parent);
 
 	mutex_lock(&arizona->dac_comp_lock);
@@ -678,7 +678,7 @@ static int wm5102_out_comp_coeff_get(struct snd_kcontrol *kcontrol,
 static int wm5102_out_comp_coeff_put(struct snd_kcontrol *kcontrol,
 				     struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct arizona *arizona = dev_get_drvdata(component->dev->parent);
 	uint16_t dac_comp_coeff = get_unaligned_be16(ucontrol->value.bytes.data);
 	int ret = 0;
@@ -696,7 +696,7 @@ static int wm5102_out_comp_coeff_put(struct snd_kcontrol *kcontrol,
 static int wm5102_out_comp_switch_get(struct snd_kcontrol *kcontrol,
 				      struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct arizona *arizona = dev_get_drvdata(component->dev->parent);
 
 	mutex_lock(&arizona->dac_comp_lock);
@@ -709,7 +709,7 @@ static int wm5102_out_comp_switch_get(struct snd_kcontrol *kcontrol,
 static int wm5102_out_comp_switch_put(struct snd_kcontrol *kcontrol,
 				      struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct arizona *arizona = dev_get_drvdata(component->dev->parent);
 	struct soc_mixer_control *mc = (struct soc_mixer_control *)kcontrol->private_value;
 	int ret = 0;
-- 
2.43.0

