Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9651620D507;
	Tue, 14 Jan 2025 21:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736891791; cv=none; b=UDygjnyQboD0LbHVBMtl1saOzMu3loeJ4uJJkH98PcK7pgmOmlxJPj4QM4hScirEGSlNMTZGMOd2mgBT4a6yNmGDWrHxfK5mqeABk/bco2Q6nTfxFs77uzP7DZfZ5VeuboHXxZhKsA+HbD3ockwDcCaZoZmW5D6E58JcEpqzuEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736891791; c=relaxed/simple;
	bh=nfIBIwHCkKNrCsdCggBTfWtterzf3NrcP18emYMCekI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Krn18bC2V7Bf1ifJRBDVBxE4yTWTbZerwqwYl1SutXuUgkk1AkPAAF5f0leDWa8c1Ebgf2d9Ou1y1IY+OqU3dKLnTaFnaT99V8tclO7f1RcUe3il2oFaYOzxE1vz5nvbxdzRYSHsVtoDQPpr9m/SaeFQ8VBay0HJ8uqOGhRnXho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=gRmGXSXR; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="gRmGXSXR"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4361f796586so63118315e9.3;
        Tue, 14 Jan 2025 13:56:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1736891787; x=1737496587; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BIBpBpyOl+m8my/7PkVzx37jn9QibwV+Vb+YTMscE9E=;
        b=gRmGXSXRcLpXCpxCBY4TiJTGAS0dPCcb5m46b4sNWem2YApq1GAzArZUzfVNieCELr
         LEq6CTkI494T4WymLuryct0Y4B5AgZjRUeOWWjPxkjVcQjj2xSPH7jF/T/wRe39CC/6H
         C5g7k1bqZ+5otThgQu8hB+F9Ef7/Ea7vnedsfbJvntf/3z2MHBKsV6yuXPcVpp9kpCSb
         N+vzle7IM5BzQZSfMrlWl4zOTqjz9Qg2X5fUxtLlpnc0msAdZhK8sMVtYMXwhMCjGdhA
         UuB0nckTCQOg6tDYy4BWVT0uRHkTT4MaDUM4Aj1MMI7RX4KsK+B1iuSDTZWqbJA2qaOZ
         r67w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736891787; x=1737496587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BIBpBpyOl+m8my/7PkVzx37jn9QibwV+Vb+YTMscE9E=;
        b=cOKuiXDacOGw37fyRBksQtMt/LXyMGnfGWv7WrEFs6db3siBfu64/3oR0I+uu1soyl
         dCL3zFpGzIB2Fn1JjfJzTkkd7tWApyAz1X8s3Ln+VIWTxvNLCK9HEDiZJ1Eofqr5pcz0
         3Tv7J/ksuV109fUtH1h/Aj2nlrWtF0H1UySNDUfdTsd7ixRF7Yz7mOaBr3ZfevFqoOYI
         x3GUhoNqP4A1waxZwaMtj7hFU916znZzZj/2/xsOunsVmqT6WSiL7GKbciKS4awxZBOA
         poCLh7egHlYeVn7YgTj2hk9BPXRZu6Z5kgTO8DQQ7NJNxmWD3DaeDCY19W71wvFXU9C/
         lmxQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZLMA4Pbkd9njW3naHeGqzJw6jmYHckuipdMkUg9ZbYSeZopehBy7zyKc1gJBiGzSxOdSGrXlTB5ZlfMo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQKAK9DOZB2hTyA88gKZCAMwGMFqeQTppltgMBSC1xxq+kprVh
	dNLXICxh0SZCkVxOQIO6FxnqKp+eH2hMKsKzLdsInPJ4XwNqarOofxlqgiV8
X-Gm-Gg: ASbGnct1GTVYISzouVTaprq4009xYlYTo7KZdotaeP2QUeFaeqZjKL8zqFeKYfrAeHO
	P14atckCpTy2PqRUxStXcA/4KAA/tTZEOsGjM4omIWAkqwpHyLjtQsZnxErm2Oi9uzEv1Pyc+9C
	QVUuRtcRehLhkJuJqOjcmqoSy4LnXSqcvVgeCgoJ8GGm+RSkxRbaZXEHXZArjShf3A4/igD5GsF
	c4ce8nXw5LAch4J4GqqtShMfdKcOYfKLBsmoE65eX2faKJ9F1VIRZCop2sH8hAG9/jrmfuNBCdl
	avGUyNjXUrnrVVs4IEPz0WuE28/UXehzY7ZeHwMVPv388EpTGq342taHXOD8qwNY6HJArXu55Lg
	K/cG7zxvyILEcS+SxXt01Utjf
X-Google-Smtp-Source: AGHT+IH1+RTIHsrE+vTasbshXKRaZEajmGfhAz2kicVYW+YLEriTzlE1yRcHESQS3J/h2jMF+SFSYQ==
X-Received: by 2002:a05:600c:1d1d:b0:434:fec5:4ed1 with SMTP id 5b1f17b1804b1-436e26e1f7cmr225829625e9.26.1736891787190;
        Tue, 14 Jan 2025 13:56:27 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a02-3100-aca8-de00-1e86-0bff-fe2f-57b7.310.pool.telefonica.de. [2a02:3100:aca8:de00:1e86:bff:fe2f:57b7])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38bddbf50a2sm5483918f8f.43.2025.01.14.13.56.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 13:56:26 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-sound@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Cc: s.nawrocki@samsung.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	linux-kernel@vger.kernel.org,
	jbrunet@baylibre.com,
	ckeepax@opensource.cirrus.com,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v3 2/2] ASoC: dapm: add support for preparing streams
Date: Tue, 14 Jan 2025 22:56:17 +0100
Message-ID: <20250114215617.336105-3-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250114215617.336105-1-martin.blumenstingl@googlemail.com>
References: <20250114215617.336105-1-martin.blumenstingl@googlemail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Codec driver can implement .hw_params and/or .prepare from struct
snd_soc_dai_ops. For codec-to-codec links only the former (.hw_params)
callback has been called.

On platforms like Amlogic Meson8/8b/8m2 the SoC's sound card
(sound/soc/meson/gx-card.c) uses a codec-to-codec link for the HDMI
codec output because further digital routing is required after the
backend. The new DRM HDMI (audio) codec framework (which internally
uses sound/soc/codecs/hdmi-codec.c) relies on the .prepare callback
of the hdmi-codec to be called. Implement calls to
snd_soc_dai_prepare() so the .prepare callback is called. In this
case the mandatory part is the call to prepare the sink (which is
the hdmi-codec on those platforms). Also call snd_soc_dai_prepare()
for the source to stay consistent with the rest of the code (even
though it's not strictly necessary to make the DRM HDMI codec
framework work on Amlogic Meson8/8b/8m2).

For platforms or sound cards without a codec-to-codec link with
additional parameters (which applies to most hardware) this changes
nothing as the .prepare callback is already called via
snd_pcm_do_prepare() (as well as dpcm_fe_dai_prepare() and
dpcm_be_dai_prepare()) on those.

Suggested-by: Jerome Brunet <jbrunet@baylibre.com>
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
Changes in v1 -> v2:
- also call snd_soc_dai_prepare() as suggested by Jerome/Mark for the
  source to keep things symmetrical (this is not strictly necessary
  for the Amlogic Meson SoC as it doesn't implement the .prepare
  callback in the platform drivers - but having it symmetrical means
  less confusion for future platform maintainers)
  
Changes in v2 -> v3:
- add Reviewed-by from Charles and Jerome (thank you!)


 sound/soc/soc-dapm.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 99521c784a9b..ebb181aac7b7 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -4013,6 +4013,18 @@ static int snd_soc_dai_link_event(struct snd_soc_dapm_widget *w,
 		break;
 
 	case SND_SOC_DAPM_POST_PMU:
+		snd_soc_dapm_widget_for_each_source_path(w, path) {
+			source = path->source->priv;
+
+			snd_soc_dai_prepare(source, substream);
+		}
+
+		snd_soc_dapm_widget_for_each_sink_path(w, path) {
+			sink = path->sink->priv;
+
+			snd_soc_dai_prepare(sink, substream);
+		}
+
 		snd_soc_dapm_widget_for_each_sink_path(w, path) {
 			sink = path->sink->priv;
 
-- 
2.48.0

