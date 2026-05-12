Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010013.outbound.protection.outlook.com [52.101.228.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9816221FCD
	for <linux-sound@vger.kernel.org>; Tue, 12 May 2026 00:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778546867; cv=fail; b=Ta286vRMvcoYrRtqvF8OJcMUS8pEKk6vD7XEBTEnhzE2+/26WTBff3jr+yPfBprQ/yxG/TbpYlcFYm2NF3ctsonmZ0N7O8gMQISzQPNNqE2rk2Som2L6C+AKSVvBICMhwl8DJXU4EtvjN5SqSRe61zsR2fw4Q8kQPAtQ5jrz4xY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778546867; c=relaxed/simple;
	bh=RLZog/JziZNdZdXf9xcLOM9ygiTPwMK0WCS3jV7f7L0=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=ayhy1W01/GYVEoyrh3V92Ro+1NHkca5cg1oKC3wHbEej6AOpdDaYogCzwvWaN/RjxvXmLWrH3HFIVk4k5VbXmZcxksS9MQB5z+0G6+ZBJR3oNXOrdJPNW2Xu4K/kQCwDZRfivmygQQ8J55eR2309kTL0vPAkn+/cioH1c2+ex+I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=oFFxtjQw; arc=fail smtp.client-ip=52.101.228.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="oFFxtjQw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=guOHKTu6Ts0VOkPKUhYML1pNSuBr9FUHbv8pmgPfoLCdNTYnHSQl2j+2ZckGQwqoPXj0IUvOAcWA4nGsKfqPC59jnOAinJ0nDIOTxa83vKrCqLHaY8PDRWDkcKtc0lbeCouqONjwca75OJqboDan7+CoOCL69kAjX2awrDWQb4Q4D9z6pr9XvPKio56S8QK8/SALUB6YcHLD1WDoFu/tKdCLRHxPh6vv1rCBD1mccCB5mSHLpijOooK33kNK87rLVS3ObF+7UkJbmXTPd19Bs1uGY2w4dbFVe64A5wXFQupaYZx2M/kqbyx46vMelnecfdDF5IxUjRAQ2/UimMVv8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R5Q4XVgb8pZh2sg0WnssdyozqNocRlTwBuKl52jRqZg=;
 b=ketFm/fFAKpC9n6JvDaxKL9NnkPEho2Rm0pwZOLZe+IlmZkYYZDmlgTAHlP8VvUqIG8IVpMQVmhD0bfZaXZcpkX7ItmWmzfjVCUvf4L5VtqSRJ/y2LWcFDdpEimSxpzqoIZxyLd3enT85y7VeMoN7qqo7eubS9I/5GSLYI8KRBdVXmDnbdhvdb/e5v3sEgYzuxqE9tDxcf+rzyIdf+VYgAFQ2xGUFnHE03vCHy/OpJDcwqWrIM4+tpD0eDYxRQ7+DnXsy5ALSWUOAr1sg6H6OeT7ZFL3PztTjL9QFitcEBsbSp/PerVR04tVyswGxcot7Aq5llmDsggA9Dc8Y54dPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R5Q4XVgb8pZh2sg0WnssdyozqNocRlTwBuKl52jRqZg=;
 b=oFFxtjQwu3DCTykHPYNrkA3GmFfXU/74s8/Lgdmizug8UIU7cgvVQfXEsAc9eK+DT4tD+eFdaqBiPbpwPbNMaJfXC4NQzLtsw95D4W0lZd5zPoELTpNqbLmoE9ICrVm2r87PVXNHZESz7c8J4awU805NFlzP6gnicWVXLBfzZKk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TY7PR01MB14421.jpnprd01.prod.outlook.com (2603:1096:405:245::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 00:47:43 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 00:47:43 +0000
Message-ID: <87v7ctwj0w.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH RFC v3 1/2] ASoC: ti: ams-delta: Stop (ab)using card->pop_time
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
In-Reply-To: <87wlx9wj1h.wl-kuninori.morimoto.gx@renesas.com>
References: <87wlx9wj1h.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 12 May 2026 00:47:43 +0000
X-ClientProxiedBy: TY4P286CA0050.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:36e::19) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TY7PR01MB14421:EE_
X-MS-Office365-Filtering-Correlation-Id: 5db52532-0823-4f02-0f6c-08deafc013e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|56012099003|38350700014|3023799003|11063799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	jnI4sM6kGGsyWA4lINJhTL6QveiI7mvcbLRDGakK07Tc/QqZMDDvDHdjyHbQLr4Kz+BCdnsiXUMX3LH39ki1K5OUbNqiMaWg7/FLj78eCB3ORFAdFrM46zhCse+9IZ3UUyFGUcUnzFNrRlftxtJYyPP/hsXiWdMz2lGG/6Omko+Ft+KpcDuZ2IEpwouP+5yKUkDLr5WBCRGQujCFcBiEDwBlRaBvAcfgxWRunJrMdCULXuomd9bcEqV9tD92LbTBQb/r23qPK430+yAQWYel+KJV8i+Phl272VEV/rJ5W2Ttuj+Fk1AskIOIH6oBb2t01EQXS4DxMCIP3Nf40VzlV6eNo9eDHAfdxPuETmENZV69X97zE3qMZ2L9PFzpjvBKMUtoiTnb6Hmh/xSx+0qbMqSwp1x9pShdn70+3yDrpqKD6UxsotxosFgjpMMV6RD1fSybEVuz4TRwZj7orRlmtBKu96zChFn2PRW99irfdNH/VzhSyEtoSnrK5rSk6qtlVFk1xQlx3MQYnHieYHEvhA40JEPIG49zcEI8F9sIY+P4ge1SQGD1MBIpvS5yhNxxB5EyTU0TVlII3jnwfhYXFNyb+t6L+loU2Mwg/eeeapnWEC7IyGD/oDoQwJeQVDv2HAj7RhN2aCfXN7EB/8kPSkI/uIox4SJMp+VfWGlUINO8OECQCrwfV3h4M5upOJQFpQVjBAoLBRBfA5SlhGuzqL/cnlUcPk65R/m5WqkloZd1C/1gNOGSbQFxQgA239/G
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(56012099003)(38350700014)(3023799003)(11063799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?o2HQ9RW+pQjOIKdptsPkPFMYzY5tS8Jpds61bucnq3dVK93QZ//9SNCo9Lhq?=
 =?us-ascii?Q?V13zqKN55ddl9qpNAv0f03to/nmc86NLoe8OKTY2i++2aUKI0NYAmllKmSlF?=
 =?us-ascii?Q?ItKNaWe7mtfQdJ+Rlg3g24sINJ4Qr+y+oW+Pbrlb3PPCjcNFyE0olnisVMeG?=
 =?us-ascii?Q?s8Ca0uj/9BPlsgvEcuZS+w98aViEfxnPXmPd7GFeUYbEd81nvYXg4B36oWzg?=
 =?us-ascii?Q?BomopPXmLnlAUSp/nGhKe7Z28G+L9e5QelmK4+R1SpL5vH5iTXOLbnPglnU7?=
 =?us-ascii?Q?09TPxJg3bROn2DJKnGIK3FKrViAk4rTS7fsNLAgqhIon5imEoNgl3VtSxKbq?=
 =?us-ascii?Q?UrTbzFcTeHXxw4grngyxJE0c8J5/ZuVwp/vuPscEVWlXh90a12mF3RDrVhxI?=
 =?us-ascii?Q?alsYEHMNfIXtGMeUlWQoejygbMp9d8ePL33Z8q6xOKuMoUATfeztpLvVRxmp?=
 =?us-ascii?Q?RQ61xrjvTxBW7Mp61nX62iSg5UWPKgBd2k0h9Wx54mPQ9AbJAI4u9rNsBM9U?=
 =?us-ascii?Q?xWtHI1TK5yCNMpYdPiwh6+1cl8ALAzvudcdCN+Mt74EifJU5KsPQmYn+2KpJ?=
 =?us-ascii?Q?TIrw1Znj3xeVI8+d2Xpjp2iB9/bWLBdOWSwpdwMvD6NFZH+XntwLMvvdCBxJ?=
 =?us-ascii?Q?o0km197SvhOnJBNIlBdnDmfSXgnmhKYJ0WmlFuRQsiLtOEj4rIDnrBTFM922?=
 =?us-ascii?Q?RuDwgEQXfCAS32wPL0qPRXIf169KX0YmPzTYbelkhe44NXdZXIPkjAGrK7Vz?=
 =?us-ascii?Q?V9FbhIfmQmgi8iHsDMp097HedoQ7uxslavLiMgJrXU00a/YKfViqX+DK4F+T?=
 =?us-ascii?Q?DGq/TAYNf8NdmBJVTGoElA74gAHwJJq5ul+ikc6B/U5DHDNgA0QXt1X1mZX+?=
 =?us-ascii?Q?p+kMjYnp6QrZicH+6cZ6cwha/cuMtstYm8DmNS1bMRWa4jHrN186BuepgXT2?=
 =?us-ascii?Q?iHWAKpJf/0CC2u7Jd/SGczEnIQqYHwcVFxZ8zo40LXTrNhIT0GYZVZK8jcJV?=
 =?us-ascii?Q?wG6R1kS0Vf2mxlsIAtXn7JAk4MKOjftEcVWtZME/9PrgAukXAdK8SeHHrIW3?=
 =?us-ascii?Q?P1qUcEaoofpvnuBh0VQ5bcboBSDswp1K0oswWZ9iS+Vx6ReL0m983dSUL+Z2?=
 =?us-ascii?Q?tleZkPmGN9QMS7L+7zTbno7bi2S79zeQslL2gNQ9viOFJIbK6+3zuB5vUN0D?=
 =?us-ascii?Q?c+MGU5RlNCh2zwsOc4e3lIeVy/DJSAM1/O9pBzW62I1xoxzng7W5LgDQ9UD8?=
 =?us-ascii?Q?9xtTmi5tOJA5tcpcjlZb92XFpNWL0BKbJeLFv76pl2qv78/Y9S7L2Dgn6B4t?=
 =?us-ascii?Q?KlF1xacN4xZLsHJgBHSQYlvmG6qVcHQWmkL3UV8k2YGGb3nQlzGpt9cgyTbn?=
 =?us-ascii?Q?o6DkqAc99KvlbfR9/D2bs4CduaPxsX7qcxPQJxdtiQxptuANDnywYeq8w06V?=
 =?us-ascii?Q?D6ch9ieKBOeD5aj6pETjXKQtHYLy0ZBefeUQ2Ph5AcD9G0OeQKEorEhv89Aq?=
 =?us-ascii?Q?LMAHvzjahF+OmmrEXBkWy8dJ65WYEvSxp8LlEdNPb6behG/Hls77Z3UVM+KR?=
 =?us-ascii?Q?00WcDzVlPMJ6Aw/1miaD3FZRqfCERf2W+LcER4UELUQhyfKpD6WnW7QrhyP4?=
 =?us-ascii?Q?U21lVjkFlGFaVgpNAN8wR1tNGqH320R6emkJJxXPhyfZgrZpTFhd+9u56jTm?=
 =?us-ascii?Q?+61oMsc+25tH5NbGyHmdmorYOwni/LWL/skaLskEKo92or65ItWHr7k8hrEC?=
 =?us-ascii?Q?acobWJQdEn1k7ki9VgqKqELe+yvtLxQHN6OtuLr9gVecmgLzCpOr?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5db52532-0823-4f02-0f6c-08deafc013e3
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 00:47:43.6695
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iH9hIb3dajIXBKWAidUusQJgNj5+wmkc2YFCynGR7rNjhQ4upFvO6b9rEaQkO9kSLu3PUD1h9g6EQoMwBvX6V09rmRzuWykph2iBL79knbDb95BiSGng4//9nZ6OJxkL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB14421

From: Janusz Krzysztofik <jmkrzyszt@gmail.com>

A flag is needed that tells the card driver if the codec has been
initialized successfully over the modem's line discipline.  Initially,
codec->hw_write was used as the flag, but it was then dropped and the
flag function associated with card->pop_time, already managed by the
codec driver for diagnostic purposes.  Since now the card->pop_time is
going to be killed, stop abusing foreign fields in favor of an own one.

Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/cx20442.c |  8 ++++++--
 sound/soc/codecs/cx20442.h |  5 +++++
 sound/soc/ti/ams-delta.c   | 21 ++++++++++++---------
 3 files changed, 23 insertions(+), 11 deletions(-)

diff --git a/sound/soc/codecs/cx20442.c b/sound/soc/codecs/cx20442.c
index c0dc69ce4d0e7..3a1455b79cd32 100644
--- a/sound/soc/codecs/cx20442.c
+++ b/sound/soc/codecs/cx20442.c
@@ -236,7 +236,8 @@ static int v253_open(struct tty_struct *tty)
 /* Line discipline .close() */
 static void v253_close(struct tty_struct *tty)
 {
-	struct snd_soc_component *component = tty->disc_data;
+	struct cx20442_codec *codec = tty->disc_data;
+	struct snd_soc_component *component = codec->component;
 	struct cx20442_priv *cx20442;
 
 	tty->disc_data = NULL;
@@ -248,6 +249,7 @@ static void v253_close(struct tty_struct *tty)
 
 	/* Prevent the codec driver from further accessing the modem */
 	cx20442->tty = NULL;
+	codec->ready = false;
 	component->card->pop_time = 0;
 }
 
@@ -261,7 +263,8 @@ static void v253_hangup(struct tty_struct *tty)
 static void v253_receive(struct tty_struct *tty, const u8 *cp, const u8 *fp,
 			 size_t count)
 {
-	struct snd_soc_component *component = tty->disc_data;
+	struct cx20442_codec *codec = tty->disc_data;
+	struct snd_soc_component *component = codec->component;
 	struct cx20442_priv *cx20442;
 
 	if (!component)
@@ -274,6 +277,7 @@ static void v253_receive(struct tty_struct *tty, const u8 *cp, const u8 *fp,
 
 		/* Set up codec driver access to modem controls */
 		cx20442->tty = tty;
+		codec->ready = true;
 		component->card->pop_time = 1;
 	}
 }
diff --git a/sound/soc/codecs/cx20442.h b/sound/soc/codecs/cx20442.h
index bb897bcb24869..78ab1eab083e7 100644
--- a/sound/soc/codecs/cx20442.h
+++ b/sound/soc/codecs/cx20442.h
@@ -8,6 +8,11 @@
 #ifndef _CX20442_CODEC_H
 #define _CX20442_CODEC_H
 
+struct cx20442_codec {
+	struct snd_soc_component *component;
+	bool ready;
+};
+
 extern struct tty_ldisc_ops v253_ops;
 
 #endif
diff --git a/sound/soc/ti/ams-delta.c b/sound/soc/ti/ams-delta.c
index 6dd0d051a757e..61252359d5cb2 100644
--- a/sound/soc/ti/ams-delta.c
+++ b/sound/soc/ti/ams-delta.c
@@ -93,7 +93,7 @@ static unsigned short ams_delta_audio_agc;
  * Used for passing a codec structure pointer
  * from the board initialization code to the tty line discipline.
  */
-static struct snd_soc_component *cx20442_codec;
+static struct cx20442_codec cx20442_codec;
 
 static int ams_delta_set_audio_mode(struct snd_kcontrol *kcontrol,
 					struct snd_ctl_elem_value *ucontrol)
@@ -105,7 +105,7 @@ static int ams_delta_set_audio_mode(struct snd_kcontrol *kcontrol,
 	int pin, changed = 0;
 
 	/* Refuse any mode changes if we are not able to control the codec. */
-	if (!cx20442_codec->card->pop_time)
+	if (!cx20442_codec.ready)
 		return -EUNATCH;
 
 	if (ucontrol->value.enumerated.item[0] >= control->items)
@@ -280,14 +280,14 @@ static int cx81801_open(struct tty_struct *tty)
 {
 	int ret;
 
-	if (!cx20442_codec)
+	if (!cx20442_codec.component)
 		return -ENODEV;
 
 	/*
 	 * Pass the codec structure pointer for use by other ldisc callbacks,
 	 * both the card and the codec specific parts.
 	 */
-	tty->disc_data = cx20442_codec;
+	tty->disc_data = &cx20442_codec;
 
 	ret = v253_ops.open(tty);
 
@@ -300,9 +300,12 @@ static int cx81801_open(struct tty_struct *tty)
 /* Line discipline .close() */
 static void cx81801_close(struct tty_struct *tty)
 {
-	struct snd_soc_component *component = tty->disc_data;
+	struct snd_soc_component *component = cx20442_codec.component;
 	struct snd_soc_dapm_context *dapm;
 
+	if (WARN_ON(tty->disc_data != &cx20442_codec))
+		return;
+
 	timer_delete_sync(&cx81801_timer);
 
 	/* Prevent the hook switch from further changing the DAPM pins */
@@ -339,14 +342,14 @@ static void cx81801_hangup(struct tty_struct *tty)
 static void cx81801_receive(struct tty_struct *tty, const u8 *cp, const u8 *fp,
 			    size_t count)
 {
-	struct snd_soc_component *component = tty->disc_data;
+	struct snd_soc_component *component = cx20442_codec.component;
 	const unsigned char *c;
 	int apply, ret;
 
-	if (!component)
+	if (WARN_ON(tty->disc_data != &cx20442_codec))
 		return;
 
-	if (!component->card->pop_time) {
+	if (!cx20442_codec.ready) {
 		/* First modem response, complete setup procedure */
 
 		/* Initialize timer used for config pulse generation */
@@ -467,7 +470,7 @@ static int ams_delta_cx20442_init(struct snd_soc_pcm_runtime *rtd)
 	/* Codec is ready, now add/activate board specific controls */
 
 	/* Store a pointer to the codec structure for tty ldisc use */
-	cx20442_codec = snd_soc_rtd_to_codec(rtd, 0)->component;
+	cx20442_codec.component = snd_soc_rtd_to_codec(rtd, 0)->component;
 
 	/* Add hook switch - can be used to control the codec from userspace
 	 * even if line discipline fails */
-- 
2.43.0

