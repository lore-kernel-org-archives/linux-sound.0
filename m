Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA113E1207
	for <linux-sound@vger.kernel.org>; Wed,  4 Mar 2026 19:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772654351; cv=none; b=YKF6q3GtxWC1A+D+WHPslEFiPbpdnBHnnxFo40hNYaRpUAZsHabpWJGNxuYNM3Hz5owcALJU/YntUB3rt0lfCz0gLUCnmKYJweUccgP6F6CMh2CrfWfFWXCreQZ2HwAnsQsWTvQvf3LFbQCjgSRW04AlTVY2CHOdokJm5p0xBzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772654351; c=relaxed/simple;
	bh=5tRJaERsB3MX0Vg1OT71H28pfSmH/MMPXLkF26YbpNw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NuhUr8iuDTkzk+cu7l364BimVRyZW05cqAhqyog/bhJVB1YrJ+x+0J/akXDdty/SW/boj4NhRZkCWcHMm5ZVsrYoadmv+M2rDkYTW4JtdqYLPjJeLzDZG3wLls1oBDmrK3uC/eU8m3emQFadH5dE7wrMIUwVnizGvV1cb4aStLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kaMOI3Kn; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kaMOI3Kn"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-506a7bbe9d0so52623791cf.0
        for <linux-sound@vger.kernel.org>; Wed, 04 Mar 2026 11:59:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772654348; x=1773259148; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9GnFDrdEkwQYpE8O+rmjepmoD5Aaw7ZEA0lHf8+9NWg=;
        b=kaMOI3KnzDjkLxitzhxI44KuAXIasesZ2X5XQz6i1rajTrKhvDFZU9ifi0HB7Yee3i
         7gQ0fo+MARz9HfvO+mMVOxdmHnM5nOrFhCRHMmoj1i6bQKYVOEzQOZZUptyMVuYkEiQ0
         hgFdwsI/e7wJ8Z+sfLULeHVqU/P9gXQjonmyRd5H0xMlVBtgYKf5+v+W0A9C6Gpzw2Y4
         zT4EiS4HPn9kILAUZlfzUe6x75+kiZn92G7aurGEdLqHR2t0ZZxbOPLJJMh1mGLUJe54
         EX/OK/oyACEKQy12Qx5I6tFkM/CX2auYCZXuT20avqAzuo6WgRwme0vsHifPqtWH1f4n
         bDQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772654348; x=1773259148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9GnFDrdEkwQYpE8O+rmjepmoD5Aaw7ZEA0lHf8+9NWg=;
        b=Z8e00A0UCZxl60jOHSx4bYGuYIvGTMU2TQZBqpcr4xBQx6+wfmv7cHsgOqCskrQ+Sk
         g6FJ/RhB5UbiF9z+er8cTOwyLtKZbmeMehfR1Cz47C4zHnfUhMSckmUyHPZ/6KpcoJp8
         PuCrwipxi8JiXrsv1hwJ2owqQtUdSmkH1wx9Fpi9IxepMF7VGo5u/YK/umyhQijmZ7fL
         tp59tPBkmQGyR98LpRnqw3CiBQswYQHSLEMIPyyAJCsvW30RTKLUhq/Z8lymugI7kB4Z
         aOClDKTgIIpbMeugoisCALfdECLxDC0QmfoUBAxPP0eH7vEXW46m1OqKeToEAK7Krlip
         9Z/A==
X-Forwarded-Encrypted: i=1; AJvYcCUyi1AcKDiMFNJiSNEVIzQcW4EmIa4dbYZkNNg70oL6MtoCJ5IEX0b1P36i8LlSdhMrwXtA+HH7Q2lg4A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxzLLjLSqB1oipYnT4ipM0Zv0zQ/qxZvhJznqfYH2tUX/ImCw6b
	r5J1hiRhCI0fuIrZ0RhDKPdlerf8gKT0ZCMlUts715/5LF2AVURCIsHh
X-Gm-Gg: ATEYQzxomvYpUyIQrqL5D5ZbTDOgtSyfz5rTX0qRQP4RBSLKK18Hn3M69K6G4f6ET3U
	SQKfVLdivIAfbC4wsFGfiMcXGbqWAOgvu9Euq+rgqHnnNIuviJ4Oa7rZwD2/nEGWXYbplLlr4Gn
	/4jIwKyP59V4gqd98T69uDJf7On1LJZJI40x6OAnXXUU6MZhyPIEdN6LFqJ/iKYUECNQw4HlK9C
	xp/aswO+v8pA1z2pJRByxQN6jFM2oTplTIMXa28XtXMtOdjE2A1ksVE9zwdw2uMcL8d0oLhxZlR
	1KFBhnRFCUAoul7/zf8tCC5gu+akELdMu9qUcuRQHL4BMcSsGlsoItK/dayh6/nAybLIcLuieFG
	mTF0TSAccBHw5ja4BLWuphExfv5dJtubs04zZ4uPy8WBYCyysaDpCq7FS3uWlic/wMpyUklz12I
	kU3w54vLrxU8UYsfrRK1rZeypgTA==
X-Received: by 2002:ac8:7dd0:0:b0:506:9b96:6283 with SMTP id d75a77b69052e-508db3d317bmr35698351cf.66.1772654348492;
        Wed, 04 Mar 2026 11:59:08 -0800 (PST)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-899ebb09772sm99714546d6.12.2026.03.04.11.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 11:59:08 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Nickolay Goppen <setotau@mainlining.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v2 07/11] ASoC: qdsp6: q6afe-dai: add internal mi2s support
Date: Wed,  4 Mar 2026 14:58:11 -0500
Message-ID: <20260304195815.52347-8-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260304195815.52347-1-mailingradian@gmail.com>
References: <20260304195815.52347-1-mailingradian@gmail.com>
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

