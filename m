Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4927D38F924
	for <linux-sound@vger.kernel.org>; Tue, 31 Mar 2026 19:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774985984; cv=none; b=KMnL9XbSBQ4Hmr1D7MKAbK6PLb3FRUiAndY2eaWIpcuSZpPmPsaTjyKYjf2+3EdvrsRhTMVfBu/OCr0r2I+GWJeAG3lVE4IN8j8hni75M2o+HLJgBKWL94nqLrq1n0USUvO3qSRSIKl6cdulISSYdPTeokX2L/Iss9cN0pYxmtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774985984; c=relaxed/simple;
	bh=WAt23p6wWxkOHhZf8zSAdYtlsqgQv1/kNzdA1zObNIk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HQiD6ECYOAPrcVsglZd/4Mn0ORE41KnqgdNR7qFFMV9saEdd7uKRNd/kIErmKbgylYzdgE+IiiZGknhlNlD48vMp2fpvuOeg2858fK0C3A1a86tn9BxwajL5zydiU25C2kt7mK07Bh7LylF17SxXhb25lZ1K2631b+KUD7XCsTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kapqWO13; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kapqWO13"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-509006c070eso45444901cf.0
        for <linux-sound@vger.kernel.org>; Tue, 31 Mar 2026 12:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774985982; x=1775590782; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lu8+HYnN9QA/s0Ocg9WNVxv21EjyZNWyGCNCp1OiYbo=;
        b=kapqWO139NWsWMzQtJxoJk4iUEoKwe8YYRJgQiQonw26bUxkK+ggEpeCKwvDgX9mwL
         JFSXlRAe8TqZlSI5REiGotd9lQGK5/2GODMWX6wY+2Fa3X8mvDlRt8l77kwffjkN3Xhy
         im/3vuit0A80N2z7FU2jVPCl3/5aRGq6AfgkveZHvn29IsThLbonaekFTLbX3XUDaJim
         KT1cIDLbEkfi7XUlc36Wjhw0dVio2OY/7gHaa6WZ08XJLJyCrCo4h0bY5KyovUq27qOB
         9DCp/W4HvOTnvF8tG1ssYYJjZ/5Sd/4L+LRhkZD5JNUlY9XN3AvDiHAUhTIdKyQZ2ez4
         MzLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774985982; x=1775590782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Lu8+HYnN9QA/s0Ocg9WNVxv21EjyZNWyGCNCp1OiYbo=;
        b=HyEQ9cCOk2PFn4hcVKBMORdLnF/moWTkDfCF6BWTqq1387NK0YAA5ouYEJRL+V/1gx
         6FBcX1uwmQ72k8Ve26w7ZgB4+ParRKs/OAtiJSairnDNY01ai43zyXymDVMY87XF08u7
         DqCsS1cnDZkLL2Yy8oGYghOMvFnfQV4iE10kKZ/1JBibk4noSlX8a534FRzU9HHpnbEl
         3xpSe4jvvmwFbQLyogFesYzvLH2dYCWI5L10jxHN/ONX4fOgWls2JrIFejuuc9UClgBT
         +FChtCzl4DFCcmIQKQg2Wp6Q5ppH9EWL9fCTZcAsoHzsW4ranLRaRGenaVNzhszzqQGa
         m2fw==
X-Forwarded-Encrypted: i=1; AJvYcCXzoF0etJM8um0bzuufCiaZRDlVAvThFfD61fXzxoctOFagxHzJMKxcp2rk4ULq0lGY6dCbM2LTFoX/hQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3TCy9p/tJDc++klL8cDfwvagh+4JyVmkPM5hjR7kqH6JTUklh
	9C9i9hV6Q5HMFS+8SMPnkI++c3x/EKXyzHGVX+fyoktHUUql5t9nKJlQ
X-Gm-Gg: ATEYQzziTJBzThmLKTSvtVDZomfVrSTdffjPyjnQbAHWweWamr63MQA3+KTfCvNsIwl
	JF1DbciRrT+z1ErdNsSO8W36gyRhitMsUwJd88FjW4llNehN+ahDIe8/sz33+s7lWgPNlAjImGA
	NNMnuv2rJZVK6XBxxTWDC0Skoq60YL7+HDNgJ6jyuJkTOcT0uCKLoRomaMp1R3+wXcQyEQgrSkX
	rMumMaZttMQ2k362Aq6dBYh2KpQdHiKcmNYu9IWv7+YEhdyLUBYW6wbVGBgPsLqG1r5MOF3XJ2D
	XR5WaMnAu/Y+RjNsd24dkI+6lVVYKXsFYMvMEbmDF9vfKnmtaWyTB4dctEH1blxsMKnsIIIWOXf
	jGPANN4gmDSkw975iCYbIcL+jdwFaGOFqctpPBG/xgnIt3GDEW9CzhcvZbo4kPq3b2WSQbd7LYe
	mm4pnz/jLecECDOkQAeuRpjsmC
X-Received: by 2002:a05:622a:2ce:b0:509:4e59:7f2d with SMTP id d75a77b69052e-50d3bbf691cmr13111461cf.28.1774985982384;
        Tue, 31 Mar 2026 12:39:42 -0700 (PDT)
Received: from localhost ([199.7.157.124])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50bb2e3ed5csm109995381cf.27.2026.03.31.12.39.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 12:39:41 -0700 (PDT)
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
Subject: [PATCH v3 11/15] ASoC: qcom: sm8250: add support for INT0_MI2S_RX and INT3_MI2S_TX
Date: Tue, 31 Mar 2026 15:39:35 -0400
Message-ID: <20260331193939.40636-12-mailingradian@gmail.com>
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

The INT0_MI2S_RX and INT3_MI2S_TX ports on SDM660 can be connected to
the digital and analog WCD codecs. They can be supported with the same
logic for other ports, but just need to be explicitly stated. Add
support for these ports.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 sound/soc/qcom/sm8250.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
index f193d0ba63d0..b8f1c91725df 100644
--- a/sound/soc/qcom/sm8250.c
+++ b/sound/soc/qcom/sm8250.c
@@ -112,6 +112,22 @@ static int sm8250_snd_startup(struct snd_pcm_substream *substream)
 		snd_soc_dai_set_fmt(cpu_dai, fmt);
 		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
 		break;
+	case INT0_MI2S_RX:
+		codec_dai_fmt |= SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S;
+		snd_soc_dai_set_sysclk(cpu_dai,
+			Q6AFE_LPASS_CLK_ID_INT0_MI2S_IBIT,
+			MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
+		snd_soc_dai_set_fmt(cpu_dai, fmt);
+		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
+		break;
+	case INT3_MI2S_TX:
+		codec_dai_fmt |= SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S;
+		snd_soc_dai_set_sysclk(cpu_dai,
+			Q6AFE_LPASS_CLK_ID_INT3_MI2S_IBIT,
+			MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
+		snd_soc_dai_set_fmt(cpu_dai, fmt);
+		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
+		break;
 	default:
 		break;
 	}
-- 
2.53.0

