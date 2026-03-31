Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D233A5E7E
	for <linux-sound@vger.kernel.org>; Tue, 31 Mar 2026 19:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774985973; cv=none; b=PAGLfTXpmi1bCDmVEl3rJOEC5rtlc2pd/jrbSul5/xM5Zi4cSWJ7CvuO+5Cu12zB+m5+GdEZ/9m0uJ2z4WSSFrh9esRr8OHWSl2fBc7WJuBbBk3GUC27Uamf6OQbrQoU+0SS6m2p2LUwSU2d4i1tG3gEkvn6gxoYpK2mEMLONyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774985973; c=relaxed/simple;
	bh=I6GOdWlyv80VkD62lfoN9e2XJ3JK8Cex75Bv2RJpnSw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YYmnnQfI9a/7eFam2HbfbCK2E0PvB1BuxtsxGSKRNw53qhF1RuemlU7zUEG56TT6k5PWcgmMQ2zIgrqKfOUunqvTaWtGmvGZE8CK+4CwoiVdF3HGT7QRgttH+2iSavoZoWdaTgQ1fwQyjHaq9xn1YEOn6nSb2ragWF7SeDHh2Pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IumWai8W; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IumWai8W"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-506a7bbe9d0so51102901cf.0
        for <linux-sound@vger.kernel.org>; Tue, 31 Mar 2026 12:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774985970; x=1775590770; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uHV0JqbiQZymbMCtdLcU7ussu4cx/THQpTwsM76Wq7Y=;
        b=IumWai8W4z9pd6QFwSQ4nJUYHui0di0qW3DNh6p7eEF3LxP9Yv6nPx7k+EHstL9YTP
         AeIqW5cvr2Lc/4iuF2ATJwNjrKlTL6z0oX4h8YMPCYPSe/4ERWo7gfHX46m4txyA+s3L
         cUWKZIyE/6XO1mO2n9tXeEincMzHbzfyD3//x4tmRyq8A7eg593gqJk8shZyxsSRJbyb
         twTXoQnYLrW3H5qDvV+RrbD7lcTWe2+9T2ghApebe8fr/+AY3G5muQe26AAJFIOgu8ge
         HzEBGtsFkwrPysBYs+QbNlR+dZCo6JKGhcoLWPnltQT8LLUE8m0DOwWQBGU99/cqZihX
         8DCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774985970; x=1775590770;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uHV0JqbiQZymbMCtdLcU7ussu4cx/THQpTwsM76Wq7Y=;
        b=gwAkcMvcjNR3cd3yiRevYz9VQ4yJeqF5cOIDkIJfluEEi4R2fTYhgrWNFNFbTEkbCZ
         dDgIuEAPaeYSqBGOEXJeJ1EyNHwTtTQb8mHMhlUqr94DFGlGdVZbEFbJtmN8Vj/EKjnl
         aUwngwmx4TW0RAGmBYbexJqnljStjSl5XfxZIUuaa++PG1Ssk3/vqhLvtC8xK3jFCGfJ
         6hCsoJZJNG96fgKE5ep5NIALqvRYZfoHneVns77G21t0JmLTcGkAkJEpM+9VrCC0CfHm
         i6y+6X/C0rdxmG6ZMfNyyG0MQDstrqQ9b2vQXfdkfQygpFk0vZljGzquM8wfml8Oooxx
         REVg==
X-Forwarded-Encrypted: i=1; AJvYcCUM19DH+RipWVVg/jOUyhajzMEB9buCbJfKZ+BkmCamW0nxUfkF8PrhriD7j0Eps5SCPXmJnjQujByssg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyFr94UhA83CLw3QcDwOilEFJTWd+4P8KyRWRVFCfChZZ1HmTtq
	YjZv2rRWfMkAhGILJDK0e4Hrdx3wfq1fvX6p+lHwTV7nT5gb12DejWSL
X-Gm-Gg: ATEYQzzQ5StRloz6X/cPQ7b9Zpjg2YzY5r8V9rDBnUrEHaMjf8c5DlmoFmHM6DY59za
	rSZxLnH9SVNqIttxgeB3641avCQtPuv/gtjZy8V0wVz+Eso752qc+lNFYYCpMZmK/5UCXwLKIV3
	SOXx9jDAO3m5AcBQc1ftoCt7sESbRFvU9mI76G3DeWggwLtzMv/NUhuDRIF/9AxDw7qAzND5Fr9
	1K3NbSujHYn4jCOG1yunlMaiQvfhSdi57jbdTQ6NXGHOqyl2P0fGbR5GeW3SviLxqOumYVODGNg
	lmdRxVZ7H50xH9o1IdjWowLORjkx0Vf1QGcnCpIvuQcu+GP2iTaLyLSn4Xrc8r90LK8CoZdk/A6
	p1KzgSDIuTUwoGC2tyhN+6qUfZI00TLdUKuaZNlS/83lnpdjkIwxHD9rWw5hHHBqUXWVyCPmdKS
	CNpsJ0TqMGV2lAcbovfY1SYFes
X-Received: by 2002:ac8:7d43:0:b0:50b:2f1f:ffd3 with SMTP id d75a77b69052e-50d3bd192fcmr11885061cf.59.1774985969720;
        Tue, 31 Mar 2026 12:39:29 -0700 (PDT)
Received: from localhost ([199.7.157.124])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50bb2dd8b81sm96873221cf.16.2026.03.31.12.39.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 12:39:29 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Nickolay Goppen <setotau@mainlining.org>,
	Adam Skladowski <a39.skl@gmail.com>,
	Vladimir Lypak <vladimir.lypak@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v3 08/15] ASoC: qdsp6: q6afe-dai: add internal mi2s support
Date: Tue, 31 Mar 2026 15:39:32 -0400
Message-ID: <20260331193939.40636-9-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260331193939.40636-1-mailingradian@gmail.com>
References: <20260331193939.40636-1-mailingradian@gmail.com>
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
index a0d21034a626..34ec3bd3ea8c 100644
--- a/sound/soc/qcom/qdsp6/q6afe-dai.c
+++ b/sound/soc/qcom/qdsp6/q6afe-dai.c
@@ -412,6 +412,7 @@ static int q6afe_dai_prepare(struct snd_pcm_substream *substream,
 	case SENARY_MI2S_RX ... SENARY_MI2S_TX:
 	case QUINARY_MI2S_RX ... QUINARY_MI2S_TX:
 	case PRIMARY_MI2S_RX ... QUATERNARY_MI2S_TX:
+	case INT0_MI2S_RX ... INT6_MI2S_TX:
 		rc = q6afe_i2s_port_prepare(dai_data->port[dai->id],
 			       &dai_data->port_config[dai->id].i2s_cfg);
 		if (rc < 0) {
@@ -665,6 +666,21 @@ static const struct snd_soc_dapm_route q6afe_dapm_routes[] = {
 
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
@@ -1011,6 +1027,35 @@ static const struct snd_soc_dapm_widget q6afe_dai_widgets[] = {
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
@@ -1045,6 +1090,7 @@ static void of_q6afe_parse_dai_data(struct device *dev,
 		case SENARY_MI2S_RX ... SENARY_MI2S_TX:
 		case QUINARY_MI2S_RX ... QUINARY_MI2S_TX:
 		case PRIMARY_MI2S_RX ... QUATERNARY_MI2S_TX:
+		case INT0_MI2S_RX ... INT6_MI2S_TX:
 			priv = &data->priv[id];
 			ret = of_property_read_variable_u32_array(node,
 							"qcom,sd-lines",
-- 
2.53.0

