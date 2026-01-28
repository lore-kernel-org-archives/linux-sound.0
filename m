Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013039.outbound.protection.outlook.com [40.107.159.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A155F1E3DCD;
	Wed, 28 Jan 2026 03:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769569225; cv=fail; b=VY91R6685BaBfNlWrHE8+1ikw6FuyOT6H6bxh5GhMHSjL+1K/cnazer9HqTQpVnHcbk2O5lCeuwG7KPSmREdsEOWiOXyUFgS1ieVv3WWy4ubTkCnPudz9/cA60q2FvORQCW4N8gjT2bF1ggSC+bCaEUdCqTreyGVuHcs5CwhGLM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769569225; c=relaxed/simple;
	bh=3zT6dEbpmypMf85Cu9Cr65ZMVTgtr37cue9RpWR7QTY=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=LEyex75F7GAeWyPoIQyitDkO2gik2B8zOKo8b5+aVPIfsLltJ5c1C48V6ztbSzhLF4G8CIourY7i2eahjfKyTzIlxEW/kmmqyLjylxIsAXxNAyYtPZ9C8Id6h/3iv14evPqUx3noY6OmPwUX2HQCqJvRDRld0rrNaojewjLcYdM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=RUizOFP0; arc=fail smtp.client-ip=40.107.159.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="RUizOFP0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RW2bvZ6af0bfMxH1c6FK9bC4FRGx1wZqLW0d7H+ghDAAN5oDhpJ5iYvMi12A/afMB+LS5eqTrFrdnAs9eqBH6Q4hmYzygFYKiPgo+jSpPTa48WxGU6oz7wQeH0on5hho7Xo/5Hb4a0A0nokwGrfV525Y3YEE0/KNQqAgJN+Z1OqgrYM9TPMtLKvqB9tXxp8mYP31FPGUJ7ecdavtWnROUEokXuky2cmrwxkQag37fe+29gt6She/zjI6HfMRPibdoUu3OReeJUVKm9fQjhebuP8WiNX7GhH6BxCPNy0VT6u9YROxopUTDq6aRf0g8vxhM2rQmhaU9JPVje4veU3n6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OPK/eP4lcpVR2NXxYkb6wJumh3ll1GThPanrGTx1o8w=;
 b=JnilLI8tGLgo90dlN+wVoUeBLD9OHOouLtWjH0VRJC+yhk89CNiiOQU25tfsoQwkqONieELiwJL+zRuLPx2WazAnQD6AFIGyWe+MDUIGo1YN+CQ68iGroZQ+TDjBA6SvhLyxRtUGe5BA5x/TxZXGnWyh12GbpRaDWIMKjHy4rTmQOhN3kirTvNU9+FHS0QI3c4gW49s12EjopblHoX9VMz+VYb8jXW8aWD0V9CeEFukIS/0y9S56zcIcaCPqQ6VuRFCvFdrfSDDFcH5jiaYg/AGQqiBTQlsfSKgfUOnJMyGvR7HEZidzYvEghjNhhGaOqAxLhy5DjCjF8D9zs0dW6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OPK/eP4lcpVR2NXxYkb6wJumh3ll1GThPanrGTx1o8w=;
 b=RUizOFP0hPyqTMrGDIA0a8zFFPmbVxy7wIar945Co8hPXlLNmNdKXacnAhDeN7/xAVbTb8cj/5oLzyTrGAqdiMDZs6QNiiwoE0RRXLuHqe6PY8C1uwCJstYgfby2RgUlGuCnu11ObczKXKr3a4pv1ShG8obCNqqJHdEv3FS9gJYc9b6OfDIWDkeJTuTQuDJCZzObqdJyfXk0W0YCh4WtXNNI06k/4JJANynK4AXYlAc/KLhD+iqSeSGp0cgV4Pe2YLml+bVnqSO1vb7hDbrt0IabAHlaCJIfk9Rh62j1Y2yMjxzw3axowpFLUsPoh2lcB6EuQbVVeEw24CMfxYhqRw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by AM8PR04MB7908.eurprd04.prod.outlook.com (2603:10a6:20b:24c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Wed, 28 Jan
 2026 03:00:20 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b%7]) with mapi id 15.20.9542.010; Wed, 28 Jan 2026
 03:00:20 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	ckeepax@opensource.cirrus.com,
	kuninori.morimoto.gx@renesas.com,
	sebastian.krzyszkowiak@puri.sm,
	brgl@kernel.org,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shengjiu.wang@gmail.com
Subject: [PATCH v2] ASoC: wm8962: add .set_tdm_slot callback function
Date: Wed, 28 Jan 2026 10:59:55 +0800
Message-Id: <20260128025955.2562331-1-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0008.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::19) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|AM8PR04MB7908:EE_
X-MS-Office365-Filtering-Correlation-Id: ff835628-009f-4761-79fc-08de5e195f48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|366016|19092799006|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GA+6Kd1e4F8kq9u6VgqxACa63SZQ6eKi9JD3fJuOPC76QFGQj4KUwGg3rywb?=
 =?us-ascii?Q?Jz8wFHnsmf8vBTsxtksLSMCr7fShIGYbBtwRXgb+tbKKkE03luvwJhPjHvKQ?=
 =?us-ascii?Q?jhfRjUCAI9iKRhLQMJETGDm2uvSpUGIKUyu5wj4fefw0W71NMZn4CLSxsCjA?=
 =?us-ascii?Q?pKOKfu6J0q7wKliIxrYPCZNB+ihxYjSgEZ8FU6rVMupqPv+Dz7clplu/Zdnp?=
 =?us-ascii?Q?ISYP1hffwJ7GESJyr9aUPgzuXRHRIHXd/se6hDbAxKeV7NLVIt4wVOIZddJG?=
 =?us-ascii?Q?44tpQRUrfxn2UxHubsANAErO4Jv+cVwOybsLVVOW93qIyiAA/bt1i69SE1Nd?=
 =?us-ascii?Q?JUPG0D+/yvLuCWKlCOyelL0yNUTpnJo8muepOyPOf56+kVHcfmleXSI6MRBF?=
 =?us-ascii?Q?A+fifoUjJb/4MxwLXbueK+laUvBSsBv2ywBYRbVuzICF3+kWF3GeWtwmssWz?=
 =?us-ascii?Q?Ex5qCqQm7JdrKrXHForK2gb6FJLuM6CkGXDmQdaz4rI3hsiazn6TgKI9/HKa?=
 =?us-ascii?Q?04gfYkprxmcu1wAAeqWyIkmL5MYLxPMr4O1d93Np/Unym1dA4MTdNQlNob2i?=
 =?us-ascii?Q?0dftlLZGLaB829zpS9fUxVKirKf5FG5n7bwovkkeNNnv/yJp3QYCCYXF4IrE?=
 =?us-ascii?Q?j56CmBWRanBIl/nWi74WvFrmV02Fv7dtxx6yQpyzB0FjnyqMtV/l6GDWqwm4?=
 =?us-ascii?Q?5OMLEDFbedO1IsxzUe3piWQdQOTYIdl+5yxsQw811wPmAKRMPCaygptedvps?=
 =?us-ascii?Q?8kl1usjTTsv2pfW5aZ0Erfe4RgEjJRo1IR8Zo4f1Q60T0krJL2TlqdJNLxCK?=
 =?us-ascii?Q?BhXKj4cjFV6K5nQggWAs1t2neQL/WGJtQ3AqIR7XViG8/ttznz7h4MWhaQTI?=
 =?us-ascii?Q?JFbSMFiNCnD2+w+PvOfAmOTmhj+asWAj0dL8wp315EdnAWScaEGupfpPHRk3?=
 =?us-ascii?Q?gl36l+hGCakrRcy2Dl2JgV0ClysQ+p5VF144LGyfCVR/hh5RamDU0ScUee5N?=
 =?us-ascii?Q?sG8xYQh2d8R5bmnkq3RoO3Gic5L/4N5//FFsxe59+1lxFwn929RcUfTDgxdm?=
 =?us-ascii?Q?aqE/Rgx00zdtSqSodakYcaQ/hiamsa6HPwtQb6Q1CfrRcWmuc9UiTg4om7zg?=
 =?us-ascii?Q?3nY4SKSXBVQTEHZNQIuM8+tEOPOYcXzFJSg9mqkqxtiQB1Y30JWQaVp5ply5?=
 =?us-ascii?Q?b6lJ2tVUBwy1xvg53AktazQ1jKSv0H3fZqES0oxe2cZfmxOUe7wj43z1S6Bw?=
 =?us-ascii?Q?jFOG342PU2EiLFfMCTJMImIluIXSbhM2PQeUZdUCIOhplxrfWJ41cdi1HRJq?=
 =?us-ascii?Q?YZy1UDvlAgLfucbYvGdV/tcE9d5g1Si78l66wi5iE8DtSy2ZZ97ZItqRB78E?=
 =?us-ascii?Q?9F9AiD1uBF9H9cL3XbWAwKLVQqKDnBKt0rY+Je3eJGThHOyJPBNwztbnd0VG?=
 =?us-ascii?Q?TPZX8blKdKYjBQ7HFMOTuCimWVs83HRzCtVT9Fy680Xm0CUvOwAAsBwjg9j4?=
 =?us-ascii?Q?AsJxxW/Ncsvih0SJZvDNrngfd/NGrMaEnIeH4Rf566vgQ/6YLTggqgUOWafW?=
 =?us-ascii?Q?wjBWQdLBUG9/BnxGKo3OQyVZ7CRHQeZvkB0YqSB/f9bZ8JS6M7CTO6K15TGR?=
 =?us-ascii?Q?JxEo+6r/GmP9d/0gggi5nPzUd00Hys/6vaEfDWdPFn2A?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(19092799006)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yntjjQ9SkKhV+XxrKPHI8WA0l72oqXBQyKWENQ4Ksb501ucHJn5yFmDcQRLu?=
 =?us-ascii?Q?mtinwkjr02Ke9WD4ZgCYoV/cnw560vS0erkF6pr5yAqfpDpNmDdpJ8aFuB39?=
 =?us-ascii?Q?GQpI07mmbx8FCXdCWpwATajzu9CTAeYnc6zLZA6AnM/Z+UsjzqTecZRoouRj?=
 =?us-ascii?Q?CvyOaqb3peCxTeVL/wT3T4nLUw02OPsYtUCpOWqmmCDBCryXt2P3vLxPb4Sr?=
 =?us-ascii?Q?BbW4la+i9U/6Xpc6ysQpONVozaFuBzkx/BeQu8kFO0SJ9lbWF6I9+0M6IcJ8?=
 =?us-ascii?Q?9qlCewKhvtvzDvfhiKGwalB88ZxquvYYcp+Ftlyi16x2bglXpSow6mZfZYGJ?=
 =?us-ascii?Q?KNc/j1NFcQJH+/DrX0Ajh82dEyEVPxRRhA1QVesLecGAbvtVj72idhEUbfka?=
 =?us-ascii?Q?MBmTMI3RFA/phKu4KIEZi49fUkFk31BO5RfJVoFUQKqlqMJGq/2gSMp/+EpE?=
 =?us-ascii?Q?QCM1navCo7/7Yl/V3r+yXucvh2UHgxUFihOn2wQgw+XQGUt0wckXLvt6bjD2?=
 =?us-ascii?Q?YBgtwTe1bcLdDPZXpEkmVBldg/OuclSuYIsTgcKOcl+Wo0QhvDFIVzW4luac?=
 =?us-ascii?Q?GnmIEjq7d0xrE9X0TtcI2hfCvZaOfr9zeGghSx3Wvew0RsHFE+w1sCcF4UWS?=
 =?us-ascii?Q?ynxQSwtfDLeRd+obNMI9NMWg95B2xwiVXEyo0yHtP9Zww5qni8n56CJX6HPQ?=
 =?us-ascii?Q?gXlis7zDZURfYz2k/sipGopS57a3c5Es04tvrpdF+0myTbqmbEvjwhZxPwwp?=
 =?us-ascii?Q?yd/JCWEHSxoJGxGizuBk0e8youkaV4IahvedL2qK9XMVy0aic21jllqWy7Ia?=
 =?us-ascii?Q?Drtl4NpAJetzB711y/YFimWNZNZTqYskPaohh2Vi+BCXRo2Ga8nyPoCyK6pe?=
 =?us-ascii?Q?7Iw/rXz0u7p/RGHaYqQfbc5jyS/Z/jZsPHhP23nPfOGAMG0rWYDFWrKduK0y?=
 =?us-ascii?Q?aif7zV/gTCMLuZOeegFQbdC+3ODAnq76JX7W8w/RcBFYfzzsnabCZOr5hCTr?=
 =?us-ascii?Q?NKnqruykWEI8W1wo5d2CSbyI8SgyJfmictx3zU4tdBxR8Hb/g9In95ryGCWD?=
 =?us-ascii?Q?1vfNhBAd80mCRWhPugsLSAqGW350bP7VmbWU8bZbSaeLZWwzNZMFdXDjP87C?=
 =?us-ascii?Q?2mspdjyKE1S3Zhm8F467qysTvdQaHe6W6A85ZSpc2B+1zoDRyQ8y9RlUkHCA?=
 =?us-ascii?Q?f26l6W52r5dQ7nwm8nd8J0oxCEAdlDzjWRGNwdsZK7dchsYcrVtUCuSw1LlE?=
 =?us-ascii?Q?vPOfMo82E/PD78yr3wIh/uxx5+XMjR/kU4tKRO9sNgqLPdwsXTEN0ibtkhS1?=
 =?us-ascii?Q?x7ILt+JyT0ZNmQbaNSUL6fSt3uzQl7Mrm89B8sHB4UbrbKIfEYwlS6254Wgi?=
 =?us-ascii?Q?YgixkJnVYB+NvFE12IbZLECzxwRZbPg74WPVIJ/TyQyxOzns6llxgKeB37K1?=
 =?us-ascii?Q?z9SPgAoy9sfyOgDj+h4HoUYgGUbsElZIUSgoKuNdVUx/YKre16KE+gUz5H5O?=
 =?us-ascii?Q?fWOISFL1KTY5huye5L5s2mkHCkiHbTLkW9NEaORFBXJroMB40JWqqSzQqtoK?=
 =?us-ascii?Q?vgs1LNYnCxeV4fYEKeuNAisDbfM5DmtEhHUkzIzEYsGYMfzCYAXIrNg2+AQj?=
 =?us-ascii?Q?L7QCxBYaPcyQOqNU1QYEUqgZiv55052PmBFAVwwMmn+Xz8sgHp0aScT9FdV/?=
 =?us-ascii?Q?6sSOhZ2EJs8qhJPvTkFc1+IK/Mfz+jmGBamSNM4bkVmA7ITJjS7oxmg42E7a?=
 =?us-ascii?Q?oPJChWoTeg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff835628-009f-4761-79fc-08de5e195f48
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 03:00:20.5736
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PMExFNQxyLbh+tQmjVLqo9xZmus91lKbkc63ktjs05g4H5HVeI8L3Rzj8dwZ4JipTu+Hk/y7vlFOflPpJDMfcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7908

The slot_width can be different with the params_width(), for example,
DSP_A mode, slot_width = 32, but data format is S16_LE, if the word
length is configured to be 16, there is no sound on the right speaker.

So add .set_tdm_slot() callback function to configure the slot_width and
update the word length according to slot_width in hw_params().

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
Changes in v2:
- remove the check in tdm_slot() function.
- use slots / 2 for tdm_slots, as external is one slot one channel, but
  internal is one slot two channels.

 sound/soc/codecs/wm8962.c | 35 +++++++++++++++++++++++++++++++----
 1 file changed, 31 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/wm8962.c b/sound/soc/codecs/wm8962.c
index bff864467416..8d2435bf44ea 100644
--- a/sound/soc/codecs/wm8962.c
+++ b/sound/soc/codecs/wm8962.c
@@ -85,6 +85,8 @@ struct wm8962_priv {
 
 	int irq;
 	bool master_flag;
+	int tdm_width;
+	int tdm_slots;
 };
 
 /* We can't use the same notifier block for more than one supply and
@@ -2612,6 +2614,19 @@ static int wm8962_set_bias_level(struct snd_soc_component *component,
 	return 0;
 }
 
+static int wm8962_set_tdm_slot(struct snd_soc_dai *dai, unsigned int tx_mask,
+			       unsigned int rx_mask, int slots, int slot_width)
+{
+	struct snd_soc_component *component = dai->component;
+	struct wm8962_priv *wm8962 = snd_soc_component_get_drvdata(component);
+
+	wm8962->tdm_width = slot_width;
+	/* External is one slot one channel, but internal is one slot two channels */
+	wm8962->tdm_slots = slots / 2;
+
+	return 0;
+}
+
 static const struct {
 	int rate;
 	int reg;
@@ -2639,10 +2654,21 @@ static int wm8962_hw_params(struct snd_pcm_substream *substream,
 	int i;
 	int aif0 = 0;
 	int adctl3 = 0;
+	int width;
+
+	if (wm8962->tdm_width && wm8962->tdm_slots) {
+		wm8962->bclk = snd_soc_calc_bclk(params_rate(params),
+						 wm8962->tdm_width,
+						 params_channels(params),
+						 wm8962->tdm_slots);
+		width = wm8962->tdm_width;
+	} else {
+		wm8962->bclk = snd_soc_params_to_bclk(params);
+		width = params_width(params);
 
-	wm8962->bclk = snd_soc_params_to_bclk(params);
-	if (params_channels(params) == 1)
-		wm8962->bclk *= 2;
+		if (params_channels(params) == 1)
+			wm8962->bclk *= 2;
+	}
 
 	wm8962->lrclk = params_rate(params);
 
@@ -2660,7 +2686,7 @@ static int wm8962_hw_params(struct snd_pcm_substream *substream,
 	if (wm8962->lrclk % 8000 == 0)
 		adctl3 |= WM8962_SAMPLE_RATE_INT_MODE;
 
-	switch (params_width(params)) {
+	switch (width) {
 	case 16:
 		break;
 	case 20:
@@ -3039,6 +3065,7 @@ static const struct snd_soc_dai_ops wm8962_dai_ops = {
 	.hw_params = wm8962_hw_params,
 	.set_sysclk = wm8962_set_dai_sysclk,
 	.set_fmt = wm8962_set_dai_fmt,
+	.set_tdm_slot = wm8962_set_tdm_slot,
 	.mute_stream = wm8962_mute,
 	.no_capture_mute = 1,
 };
-- 
2.34.1

