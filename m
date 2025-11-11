Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011071.outbound.protection.outlook.com [40.107.74.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 075612153FB
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762821142; cv=fail; b=niIwPHFX9cAucTFGx5rMstbfx/9+fIgavonmmNKzZ2OMXhjtiqdxQYy1iK9dskDYn6EACLnDdiDuCHcYqIEB2uxjbM19FATjXjhflDFgqSi5d+2hRup6kAvsCquGigBxbbAQrk1hGhlh4w0jvV5eIhV+5nqClZtVYCnT2hc8Ibs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762821142; c=relaxed/simple;
	bh=q443bBCym+Sj33L3pT8xLUqprGDwO6+SUdlXSiBRem4=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=DPmj7yvLNTFDkzXgZX3GDjIjS9X+6wva/POhJMwDDRbQW8TNZRcmfjJzpNHjr9miS+v3DoitJOiirVLBa+kQ3E7tV9iEJ7FU2AfacbxGfQpMJnCICtpVfrsjU/8aHd+REsNx1m7U0aG9SVYRzfqVs/nLFghkq885S+flIP1VYqw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=fbMMNgcJ; arc=fail smtp.client-ip=40.107.74.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="fbMMNgcJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=omBMhsouJNwbutFVs2cDVjSriWrWSeNe23Q9NQt3EzG73Actt9WObIcI8NrPgg9vFdXrqnRISpmYDN8K7PjNE3Ol9YWujyx3Qznw2Xz/JXBjm30rnQhprb7STMM39QHt5RdRLLvdDXZoULJ8hwfu9Ji/o8Zp1xa1qhMTV9jj38C5WdFKXNo4CNXsrds67gvf0IPPYMnE7dco3RJKrnqtRAd7YrWEMfCteNMAxkXkCU++LOudZ4wkK0zpVaBR4zeRbThqQfUvnFfwIplsQIqkwR/1G7cdnjRumEz8A66Ft2iLFpVXK4qd3033av4FvEPLaNxYbUIQfEsbwZgQASh/GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W2kkKnE2dIt/fmrKCuvBgfuVNCew5jaxb1Ohjrs6oyU=;
 b=Odt9+T2UNx4ILv5dYpaF1ysk9cbWZHlNIEsjnALR7Wc2Iz5tE3GD4+59xlgyYngoNzIxAUW/4D/n5/rlzXbyGffXfCRNU8HW99NxbHZIxaRaLYqzgFWq5Ks2qfcDRc43TnpZAE5FXjgghFou1AeVYrU1cWIAzHBtVM02Qxfd6Y6Ajwo63PGahn3B3UfFHZTTzPsb+K/IwL3oxsXtawhmqSQ32R5jRdbYPkbIKD0odGMQHcqYN4ATgydjDbTwMHPMdpCyGotALmhHwXOnhENJ0y0eNFoOm/sZ0rfg9QSPBa6Ky9eM3v4tbn84A6fovuR/7/hKncdRARBY0TUU1zRhiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W2kkKnE2dIt/fmrKCuvBgfuVNCew5jaxb1Ohjrs6oyU=;
 b=fbMMNgcJCdBY8SeGzBuULoH9uwetUdR3FRU8bRTEj+CsNkmVHxQE0ytFjKyihc1bu7njBQkqq3hBa4k/uMmzwqXGoBTBH+jii4rrhYoXCTtLE9tCtETvpLC/yQQg22hmrybggfVeAozOzr6v2O49e+u8UTtqAQ7QnMDKR12KSS0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB9810.jpnprd01.prod.outlook.com
 (2603:1096:400:222::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:32:19 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:32:19 +0000
Message-ID: <87y0odwgrw.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 209/292] ASoC: intel: boards: bytcht_es8316: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:32:19 +0000
X-ClientProxiedBy: TYCPR01CA0159.jpnprd01.prod.outlook.com
 (2603:1096:400:2b1::15) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB9810:EE_
X-MS-Office365-Filtering-Correlation-Id: 25abad48-017c-464d-313b-08de20b9c5fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WYwMm7rL5v2dtvjqUyYA5OKQKG+LXHAQhbwUWazvvPXmB7R9nN7a3cvyHVKc?=
 =?us-ascii?Q?mMhxiFDjROKUjv4ISvoVjhHjuHOEs4O8Woga2PwE4UnbnOPd/8XAiYr6iJtV?=
 =?us-ascii?Q?gWvcxOUJBJS/RsaCNcWlNT8C0vgQlk9E1isoUOCMFFu/4ZYHRTiYsBF1rONt?=
 =?us-ascii?Q?pZCVARvCaiFJwy4oC11J4HY0K6MZANJY28am+jLYoEwMt3Fon3Ex48MQRoLv?=
 =?us-ascii?Q?YKmOkHerY19rqyQVQzSSCEiz7pPFSdJ2eLWZrypjPX2sSSp+5qGBo0FzLUly?=
 =?us-ascii?Q?gu3tpKLIibcQnnvJsWxumls1/d6n3m8yn/23HhSjmnStBhrFGEGAegrOzeY2?=
 =?us-ascii?Q?tUh6NJzDLMhq9S/a8gQYHgTtha0Tv5sciau7buYkCFPtxmR80ABHF9uQbEnO?=
 =?us-ascii?Q?K9/cU0nS32plfh7Ag8Cpr71wXG6a8oj+UTInj6rnwlR8ZtDyoS4PSJ0n1KIg?=
 =?us-ascii?Q?9d8UyVT/upWTVT5QA/QvParIwXlQMgvIDHc9fxnuG1hQza9MhIfz6LFWKkEU?=
 =?us-ascii?Q?CY5VexmRCNUt9VDJ4k070QYqfHqD70Thhke1VSZYkO1DIxt/YNZZHdaeeeBg?=
 =?us-ascii?Q?BoeYcZk+lt9lINVt2hw3OjMlhB0H4vnL2S01ILYXadTTBa3iO52KQicUT8E2?=
 =?us-ascii?Q?JfBd+D1zH5FCmjYyw1XOS1uB2jrmFTGx+ZsRTBVcEVIuGJ7JnORcja7Yp/ji?=
 =?us-ascii?Q?ZNXH4vYHEk1X4g/Trqnzj9BA14UI0UE64Nl82pzxGh/U9GoBHvs67BvqgXu9?=
 =?us-ascii?Q?S81vCgN8l8Z1U8O5sZcvLedfPH5iFF7NSYFk+onmueH7Su1ASf/vvjxhhb7V?=
 =?us-ascii?Q?w2D48vyUsGt3pId1OiXLMs2i3luj15jKo1UjL698rnN0gvybV1QfcWsqZe3k?=
 =?us-ascii?Q?jKlwTVg66HPAIn1alT1oEEl9ALlC4FmnjZKJXvygqfC3XyK0i5YSllPJRYkG?=
 =?us-ascii?Q?YqI94PyGR6cyEiI1QX0rex4tWnFMP8LufWFS1CYTsqIL1Gow1+lC35mkpM4M?=
 =?us-ascii?Q?6+3cl7pGjJbL6si4JV1mh7BS45IW2sbaa6gWWDVZFA8DzPUD+Q99H9Sz6I1Z?=
 =?us-ascii?Q?HIFPpdkC3kKB+3+hEhF/X9wVC6JRmGWsHwk4mfq4tDpcNBOAFQUy3ptpZ6Ei?=
 =?us-ascii?Q?fsmxyU8xdZ+DInM9nnt12xQILBPCYz13+Sl6XiQpDD0K70Ow+4E3sACfCfd9?=
 =?us-ascii?Q?j8FvdGz8LWvUpmZ9LA+SyR6/PsW3m1nWF2U5R7ab88XIxBjI+kGQv6Oy+lZW?=
 =?us-ascii?Q?u+Ze13LziYum93bcHiJI9uQoQebjpvux5kpYXfDXkOXU8W1Uz51BLOEunosj?=
 =?us-ascii?Q?xUNJ6lmfrJcx1d56eQWw5WjZQkNoydHRDbYmFMXTf4WCbSvxSnfyj8W51hdt?=
 =?us-ascii?Q?+8YjSrDtbhqqsGd0EegN7HwPSed+uL0gdL8HMZOt1CNc5JGxLqw6FZZl+bJa?=
 =?us-ascii?Q?01C1DyJfXg5UIjvXWNNnMcj4TYltDXiKIhnPsJ+g+2O2JnbTXzFdU1zWAurH?=
 =?us-ascii?Q?aQkOVS5TlghOz5luXXt6EZj7uoklX1poSvRh?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?npJoP4W0D4l4mEhbY5kGeefdQ5zbDBm/2tJBzBcxcSU2O+AYo72JEBc1f113?=
 =?us-ascii?Q?xvMrZ9kMS+8nS67o/UMi3qMar6D8K+cLNVAv6QKkt59UR04fdrKl2s8sL1aU?=
 =?us-ascii?Q?FHjdXr/c8IWG0idTf5rdkShNowa4whM53Puqf5j2OjkqjQVV3yUd4nWvOCkC?=
 =?us-ascii?Q?1ATymOBhucPh8/RXU1YxQATjYKXstXWH7+sH+HjaJvQt+MXcKsDQPiXuPivo?=
 =?us-ascii?Q?WIulw88z7nKTG6w8w4CLmgQtFbs3Dz/elxzBlXg+ESUcJML/6prui46L2d3E?=
 =?us-ascii?Q?P8lu2/IY6mJ/hM5lAZIYNiJqrVg0FmRaqRGI8895pTlEg0SOChHV+75Qke+e?=
 =?us-ascii?Q?0FFAiTMtUFQ6SxuDzr+ofa0/gpj7IDudnqahI+TmRXtDsmsaVHFVolgL1Dcd?=
 =?us-ascii?Q?/wSZ/w10yvfp0NvopsEGHEK/GY9QI+7AXEui8CbMhJmzdipyVlphaBY1Iw5h?=
 =?us-ascii?Q?UetgWb1Y3+CCqOEkhUtpizJJaNDzVNMqfiwBW0sOlnDDS6r5U+i/LPpNRWcC?=
 =?us-ascii?Q?joC3jCicGdwAfe9X0zu6jtedWvR+QxNEMR2Otobt+v2TtiZzJSFaf0YWXxq/?=
 =?us-ascii?Q?jRqEzWkVXijpEvOkNprr2Ccic/7M/VnotqISxtYZQ63Ii9LQo8UnqokqVK1M?=
 =?us-ascii?Q?h2EhYsobA4NVYH1gm1xMbfYMBkIQfZkcvuuWt4Xq6f7ZJuox703H8PV6Qc+P?=
 =?us-ascii?Q?j7rs9DpGR3Q98yDe2XXufEBe34tE2xKzTwTbLZOC/EmrCwZZc+ZDbolBuNz/?=
 =?us-ascii?Q?SHWUFVvXTZyJ1JWe1sYJvgs9HvyEuG+BtF1VQlwD7046xmwMq0hAXdtAEanH?=
 =?us-ascii?Q?h1sOy+RQGtg59B0RCXG9+rVrCt+AlzZa/XLqsdxBg7KlcnYBycliMndaduJl?=
 =?us-ascii?Q?SozC+Elm1+lL4q4RedCvUbVZ4tMEoQulVXMDC/Jqrk9a5NS7dauufTn/YeUl?=
 =?us-ascii?Q?13z2q3Qw7ehL57G6MfXYLybVdE4xcH458Z/6jXwqi3pnYqRn1Lx+7pnTNy7M?=
 =?us-ascii?Q?yWyrp5M4JidW0sJ8TueicXxGydsBhZC53sbRobappCShPELYUBTWVkiqFASi?=
 =?us-ascii?Q?JXF20fAXhPZcLP2zAHEje3rsrIfQl4WI3G8RK8P8hxnTzBJygtXiKcKj9AJb?=
 =?us-ascii?Q?G/pRkVhmclbrzYeVQN51vJlD8s6KU1rOqHjMumkXTmP2WymdQiaXwBm6UeJ6?=
 =?us-ascii?Q?zvvBS/lOYod3UaotcilEDxxyTfQtOh1BAcDhMLfkZMKYloaqNTjI2TQtE0ry?=
 =?us-ascii?Q?gWuf+5EpwelnOW90NDGO8qaEKD+6XiCTeQroBF9gXVxPEGP78ce23S0wP93B?=
 =?us-ascii?Q?3462WSIHBfctLnHnBu2qaddtPHWNRtx//towR5GvWYD4OR9tr67H3EyjvVeb?=
 =?us-ascii?Q?H7g/2ykkoL/Yo/LVI+qExxETRUNyYupEO1FwxfYo4CoM6NNtTwibWjDa2iaX?=
 =?us-ascii?Q?SeRfYel6bIIE6KyqNUH4qFF8TYt2DJrBJSn/DspGjqRClFHvcJ6kxN2etUMD?=
 =?us-ascii?Q?/thf3ajr3GQSsVGHXCwD9RN7Oi4gV1Z3n2eHoigOuC5HoY0h52a5UQAWDqd0?=
 =?us-ascii?Q?mBa3OaxVMWUWh5ksMaI9VVTEHEiIEXqXKw6vp996JBaP5jeB9kr+Vymw6DuM?=
 =?us-ascii?Q?iSqCCoMBA/X3dBdJzXZwwkI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25abad48-017c-464d-313b-08de20b9c5fa
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:32:19.6966
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vKaGk6BrDwaMEpQr0cmVQFA2+8Xs2J2Ra/6+vfPVuaKwbpCgYg6qUk6vdTaSa3rEFXyJSYvxgFon4jM+kRZNpq5A0rNIHsDxto+cOyETe7xnb033jx+VSCKuC44G0EIO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB9810

This patch converts below functions.

dapm->dev					-> snd_soc_dapm_to_dev()
dapm->card					-> snd_soc_dapm_to_card()
dapm->component					-> snd_soc_dapm_to_component()

dapm_kcontrol_get_value()			-> snd_soc_dapm_kcontrol_get_value()

snd_soc_component_enable_pin()			-> snd_soc_dapm_enable_pin()
snd_soc_component_enable_pin_unlocked()		-> snd_soc_dapm_enable_pin_unlocked()
snd_soc_component_disable_pin()			-> snd_soc_dapm_disable_pin()
snd_soc_component_disable_pin_unlocked()	-> snd_soc_dapm_disable_pin_unlocked()
snd_soc_component_nc_pin()			-> snd_soc_dapm_nc_pin()
snd_soc_component_nc_pin_unlocked()		-> snd_soc_dapm_nc_pin_unlocked()
snd_soc_component_get_pin_status()		-> snd_soc_dapm_get_pin_status()
snd_soc_component_force_enable_pin()		-> snd_soc_dapm_force_enable_pin()
snd_soc_component_force_enable_pin_unlocked()	-> snd_soc_dapm_force_enable_pin_unlocked()
snd_soc_component_force_bias_level()		-> snd_soc_dapm_force_bias_level()
snd_soc_component_get_bias_level()		-> snd_soc_dapm_get_bias_level()
snd_soc_component_init_bias_level()		-> snd_soc_dapm_init_bias_level()
snd_soc_component_get_dapm()			-> snd_soc_component_to_dapm()

snd_soc_dapm_kcontrol_component()		-> snd_soc_dapm_kcontrol_to_component()
snd_soc_dapm_kcontrol_widget()			-> snd_soc_dapm_kcontrol_to_widget()
snd_soc_dapm_kcontrol_dapm()			-> snd_soc_dapm_kcontrol_to_dapm()
snd_soc_dapm_np_pin()				-> snd_soc_dapm_disable_pin()

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/intel/boards/bytcht_es8316.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/sound/soc/intel/boards/bytcht_es8316.c b/sound/soc/intel/boards/bytcht_es8316.c
index 3b5f63112237e..192e2a394ff3d 100644
--- a/sound/soc/intel/boards/bytcht_es8316.c
+++ b/sound/soc/intel/boards/bytcht_es8316.c
@@ -89,7 +89,7 @@ static void log_quirks(struct device *dev)
 static int byt_cht_es8316_speaker_power_event(struct snd_soc_dapm_widget *w,
 	struct snd_kcontrol *kcontrol, int event)
 {
-	struct snd_soc_card *card = w->dapm->card;
+	struct snd_soc_card *card = snd_soc_dapm_to_card(w->dapm);
 	struct byt_cht_es8316_private *priv = snd_soc_card_get_drvdata(card);
 
 	if (SND_SOC_DAPM_EVENT_ON(event))
@@ -174,12 +174,13 @@ static int byt_cht_es8316_init(struct snd_soc_pcm_runtime *runtime)
 {
 	struct snd_soc_component *codec = snd_soc_rtd_to_codec(runtime, 0)->component;
 	struct snd_soc_card *card = runtime->card;
+	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
 	struct byt_cht_es8316_private *priv = snd_soc_card_get_drvdata(card);
 	const struct snd_soc_dapm_route *custom_map;
 	int num_routes;
 	int ret;
 
-	card->dapm.idle_bias = false;
+	snd_soc_dapm_set_idle_bias(dapm, false);
 
 	switch (BYT_CHT_ES8316_MAP(quirk)) {
 	case BYT_CHT_ES8316_INTMIC_IN1_MAP:
@@ -192,7 +193,7 @@ static int byt_cht_es8316_init(struct snd_soc_pcm_runtime *runtime)
 		num_routes = ARRAY_SIZE(byt_cht_es8316_intmic_in2_map);
 		break;
 	}
-	ret = snd_soc_dapm_add_routes(&card->dapm, custom_map, num_routes);
+	ret = snd_soc_dapm_add_routes(dapm, custom_map, num_routes);
 	if (ret)
 		return ret;
 
@@ -203,7 +204,7 @@ static int byt_cht_es8316_init(struct snd_soc_pcm_runtime *runtime)
 		custom_map = byt_cht_es8316_ssp2_map;
 		num_routes = ARRAY_SIZE(byt_cht_es8316_ssp2_map);
 	}
-	ret = snd_soc_dapm_add_routes(&card->dapm, custom_map, num_routes);
+	ret = snd_soc_dapm_add_routes(dapm, custom_map, num_routes);
 	if (ret)
 		return ret;
 
-- 
2.43.0

