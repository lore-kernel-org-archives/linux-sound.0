Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8F702F0C6A
	for <linux-sound@vger.kernel.org>; Wed, 11 Feb 2026 02:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770775402; cv=none; b=DHbyPFBsqhJGEKOUh/SzoSbIlq6GtJyrMCaOBdx1i7+/kctlF6aJa6POYYC6txg1tkQUH07Cd1BhKaA/Fr7/f1sPDEWRHsCcPDHHrENIT7rnIwZlYFaUsc/dIVUwJC556ayeALVe/ubfcep3J7Q437MVmyCtA+VnHfQZx4KGR5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770775402; c=relaxed/simple;
	bh=5tRJaERsB3MX0Vg1OT71H28pfSmH/MMPXLkF26YbpNw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jubvEDsSCq/X2v8V24U2K3Jb0neq3W8oZfxu6XgL3vyKeDE/HzH2ervLKrX2K1MozDAm6rWSsRlw0m8RyeJW43kSPscM/Lt2Z4jTxPeKEarOOKnBSdGoiP+TQDAe17CUHV6Iw9xMaHfqf+f5x5eFQ84KOq0ogiHNZ8CEfT7YhFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fHx7OwkW; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fHx7OwkW"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-8c655e0ee70so136678085a.3
        for <linux-sound@vger.kernel.org>; Tue, 10 Feb 2026 18:03:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770775400; x=1771380200; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9GnFDrdEkwQYpE8O+rmjepmoD5Aaw7ZEA0lHf8+9NWg=;
        b=fHx7OwkWh8WeczGJdWbCYr9PEbNMyM/M/m8AskEhwf3LpqfKwRhfRpCwBzzNf/wNLQ
         NXw7B7xzF/1Z+REFkjFAqqAN8iwxqze2U5aMCrS/DasF3iiYDZ0OA0lg+RA7+zW5AJR4
         8NNN6A3TxoHDkzr9YWmJPuqBnoFEa2O3eb5RuWynYCnf1EsWYNerS9YDXws7LSaG6JFC
         NwFo4U9Hb5sk21wRtfBz0PiONSG7DsnBf8mtYecg/Me+dMtxGPapmQumE2UjVzbGUlji
         /cxnme4mcneY+pXcVRTzJ4MqsCi+EApnmeEg5sKyuoK7oss8GdW5YCjvIl3dWZoHo6Rq
         4PfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770775400; x=1771380200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9GnFDrdEkwQYpE8O+rmjepmoD5Aaw7ZEA0lHf8+9NWg=;
        b=HSNaKHUHUFxxi1xkdSGMMnNpXs793yxHRkpEfBuBVWbKjzwlSNVRpAyt4Zy70RV4uY
         uJR0pejtkVun6Fdesn4XHgCHgiYKtWSLc0BHSzoVvuCHktw84Rq0xsGwzph6xEp/YdTF
         68XNKm5Z2kA82NSinM7PCNPSdny2BD9yMTWe9elOBnxy6zBYq5sWdwAsIJMLLRp0DXn7
         ODLxOM2KD06SiFEvnd9PDm60ej0Yll/KjE0MYokIpQ4LzLKl5LOalcIF3uMNqavXIPer
         wE11HyRA4I1HDQBtygXz+IOjInPl7OHxByxp4C7WZgtvpbLCezpke4gtfL6zXnbPHojp
         RrvA==
X-Forwarded-Encrypted: i=1; AJvYcCV7ITXu61TGn0QiY/iUw1dh4y2LSq8mXipplynTPY5qFBzmRbPXPZPEdMR6KB0jxGuFrP9NoFdslcEwYw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwoN16YsYobkMM6nEx7wJhSZPy3NOIRdOwG0RKBuxTxVtBRRDoB
	nazsfLlkmfy/PeTnWKn6nIXdytMlpdk0ZPXjoEhpq+FdOv76ApWgLDBi
X-Gm-Gg: AZuq6aJVHbRRlbChV0jkNXTfvl6QBFhcGM3FfvCNwvxMRwJ4W1YSergDrsKstJJC2rS
	HtTz364t5XKfaFifgoFoyNRcylnWUCWVmaL8SgfCUD18dNSoKTojWDcCtQ3XpbXZGUEsvWahvZE
	tuGOTriW5hqOJT5dh4ztIQbBet7UYGzkxzukHElbYnwVd9RvsEFQNOL0YE+pD5bsbPnOw8AVeY8
	nqn+7buJF36mUEWxtFkvoVYn8E9bfs020t+kKqvuQeH8fnoDl+8CMyq7alCKu7PgM3aUX5vTNhH
	jJVMq3iSWmYL1ZkdBVOnTqR+5c0S0HwNIa/CvLvZdUonEuRXgzTm/DnFHTkGJZw3VH907zkv896
	0roQO0G6jp099nXhxfL5QhxUqzvK+WzuWo6PR1Qzl8FudrPh4cJ92k5PhF5Qz2pi1LnxJ1t4mLd
	cKVZLnJxlaThszJIY3/FGnqErjPppMHQve1k7lYEuh4g3svoaJHNc8+GQzhLTrGYo5Jo7ST98v6
	A1KxPDv6f08auw=
X-Received: by 2002:a05:620a:22e5:b0:8ca:fe5c:ea6d with SMTP id af79cd13be357-8cafe5cec8emr1558801185a.59.1770775400534;
        Tue, 10 Feb 2026 18:03:20 -0800 (PST)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cb2b0e1d72sm11282585a.18.2026.02.10.18.03.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 18:03:20 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Johan Hovold <johan@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Nickolay Goppen <setotau@mainlining.org>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH 07/10] ASoC: qdsp6: q6afe-dai: add internal mi2s support
Date: Tue, 10 Feb 2026 21:02:59 -0500
Message-ID: <20260211020302.2674-8-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260211020302.2674-1-mailingradian@gmail.com>
References: <20260211020302.2674-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the internal MI2S ports found on the SDM660 internal sound card.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 sound/soc/qcom/qdsp6/q6afe-dai.c | 46 ++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/q6afe-dai.c b/sound/soc/qcom/qdsp6/q6afe-dai.c
index 0f47aadaabe1..dfe964b1a341 100644
--- a/sound/soc/qcom/qdsp6/q6afe-dai.c
+++ b/sound/soc/qcom/qdsp6/q6afe-dai.c
@@ -411,6 +411,7 @@ static int q6afe_dai_prepare(struct snd_pcm_substream *substream,
 		break;
 	case QUINARY_MI2S_RX ... QUINARY_MI2S_TX:
 	case PRIMARY_MI2S_RX ... QUATERNARY_MI2S_TX:
+	case INT0_MI2S_RX ... INT6_MI2S_TX:
 		rc = q6afe_i2s_port_prepare(dai_data->port[dai->id],
 			       &dai_data->port_config[dai->id].i2s_cfg);
 		if (rc < 0) {
@@ -662,6 +663,21 @@ static const struct snd_soc_dapm_route q6afe_dapm_routes[] = {
 
 	/* USB playback AFE port receives data for playback, hence use the RX port */
 	{"USB Playback", NULL, "USB_RX"},
+
+	{"INT0 MI2S Playback", NULL, "INT0_MI2S_RX"},
+	{"INT0_MI2S_TX", NULL, "INT0 MI2S Capture"},
+	{"INT1 MI2S Playback", NULL, "INT1_MI2S_RX"},
+	{"INT1_MI2S_TX", NULL, "INT1 MI2S Capture"},
+	{"INT2 MI2S Playback", NULL, "INT2_MI2S_RX"},
+	{"INT2_MI2S_TX", NULL, "INT2 MI2S Capture"},
+	{"INT3 MI2S Playback", NULL, "INT3_MI2S_RX"},
+	{"INT3_MI2S_TX", NULL, "INT3 MI2S Capture"},
+	{"INT4 MI2S Playback", NULL, "INT4_MI2S_RX"},
+	{"INT4_MI2S_TX", NULL, "INT4 MI2S Capture"},
+	{"INT5 MI2S Playback", NULL, "INT5_MI2S_RX"},
+	{"INT5_MI2S_TX", NULL, "INT5 MI2S Capture"},
+	{"INT6 MI2S Playback", NULL, "INT6_MI2S_RX"},
+	{"INT6_MI2S_TX", NULL, "INT6 MI2S Capture"},
 };
 
 static int msm_dai_q6_dai_probe(struct snd_soc_dai *dai)
@@ -1006,6 +1022,35 @@ static const struct snd_soc_dapm_widget q6afe_dai_widgets[] = {
 		0, SND_SOC_NOPM, 0, 0),
 
 	SND_SOC_DAPM_AIF_IN("USB_RX", NULL, 0, SND_SOC_NOPM, 0, 0),
+
+	SND_SOC_DAPM_AIF_IN("INT0_MI2S_RX", "NULL",
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("INT0_MI2S_TX", "NULL",
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("INT1_MI2S_RX", "NULL",
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("INT1_MI2S_TX", "NULL",
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("INT2_MI2S_RX", "NULL",
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("INT2_MI2S_TX", "NULL",
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("INT3_MI2S_RX", "NULL",
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("INT3_MI2S_TX", "NULL",
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("INT4_MI2S_RX", "NULL",
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("INT4_MI2S_TX", "NULL",
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("INT5_MI2S_RX", "NULL",
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("INT5_MI2S_TX", "NULL",
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("INT6_MI2S_RX", "NULL",
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("INT6_MI2S_TX", "NULL",
+		0, SND_SOC_NOPM, 0, 0),
 };
 
 static const struct snd_soc_component_driver q6afe_dai_component = {
@@ -1039,6 +1084,7 @@ static void of_q6afe_parse_dai_data(struct device *dev,
 		/* MI2S specific properties */
 		case QUINARY_MI2S_RX ... QUINARY_MI2S_TX:
 		case PRIMARY_MI2S_RX ... QUATERNARY_MI2S_TX:
+		case INT0_MI2S_RX ... INT6_MI2S_TX:
 			priv = &data->priv[id];
 			ret = of_property_read_variable_u32_array(node,
 							"qcom,sd-lines",
-- 
2.53.0

