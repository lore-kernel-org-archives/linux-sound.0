Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23AF020897F;
	Fri, 10 Jan 2025 21:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736543268; cv=none; b=FvT5sRXd1PpM8AfF3yC0qUA+gHY8L9vUvi2JjLh2RJRinTGhuxMv6JftyF07UjSV7tvtD6s4qBtjlJnu/xopp17cnNJICMdaN9fWz8FLv7uRlkRAu9nV//McqdP+YXHw/tpt+RCYN1nYI4xj3Yl6tjTpT7EF/FcofPTnGhdnlDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736543268; c=relaxed/simple;
	bh=Ri1eKmrS1UuCk6prwkOqC0I+UVrgyzE29B43kb6OXYg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S0s1QkjExkRVjwnfVEw0q4I31WMkTWI0uaLlvLNKqxJcID8yTdtWxyNVSTO0telxOJF/VvlWbzuG2rZOIfIhlQV+H5Cg3Zh1BfzlF4IQSQQGS3ZziSSU/rJ7VJb2egDqZ4FchfPG880bRQUnF2YxxMR55BTedSfh24hxQP2q3UA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=jZxfsFnm; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="jZxfsFnm"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a9e44654ae3so380556566b.1;
        Fri, 10 Jan 2025 13:07:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1736543265; x=1737148065; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yIZ+oSgurarcRt8vr8zAYXncwg0sc5woPL8Ha/0VWlY=;
        b=jZxfsFnmgxPj9UNeJ6Rs/J/6djlnLKabioXWI3YbITuxPj1qmo42oQGuzeooHeBA8D
         7qHxufHNc/I8B1yRxulkwrAitH3oVJXbxQZFJRfWAWWIsUfucJUwcdd6nNykDKEgiiJY
         5G6gZi2SHE2HorLbUA0k3F/5okdrXq1HvjxaJgKNJR6oKCUVnnKr+33x70DpAqPtcltQ
         68Ok4LtxvEEyhKdbl6ekVDRS4AoAsZuBK83k8vKNeG4P1QDMGNRDGKrLQbVza83KwZni
         U0LPuK4ffOWd3Esfq9aYkIHEMo35K8qSc1tDgeqtV9lCOyPiUuGL/sVoHCF6dIrZSiOc
         4jNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736543265; x=1737148065;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yIZ+oSgurarcRt8vr8zAYXncwg0sc5woPL8Ha/0VWlY=;
        b=afRJTpYsdE4iUfyD2ntkBsU+EyF/NF76P6AKeA+K7tWMDs+bqXI0MkwoJV7O8bY+y3
         SzVny35mEbRsolkU08g9v+9zgjVlovKD37J5JwEK8jATbuEAiSW6gT1ONugWgafyDqcJ
         sLDFi2FunVWEONvtvNrfVth/fvdNZeIt9fH3IOQrG6IWT7I3/DAPt4oNI0sjLpiO43Lh
         +vUFYSDRO+oVfInm1FeFLfIBw96f62GtzizzjoI1TcS9ja83vbUeHl6GZ3RUA5+ZjLj+
         bUGR+QTR4y8twGcdrZnnCifCD7CitXKMT6tRe+8TAOJ5cSm2cXmkKcatiIjypkYiMxvB
         7icw==
X-Forwarded-Encrypted: i=1; AJvYcCW0Zh2q31GwrKUJHHX0RvAaYiMWSYL1lvGpeQihV3KUj5qnClMnF/v3XboDo4OiXNAjJ1AfwUy97+1PAvg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/MTJ35KfisuDYE6coTJzFVLjwg2YUu5eTslPoKmocYBOcA0Tx
	IKFsP5rvWBGm07MjP2nWPUjU5eHbPuvcBRhk2RAnYZ4cHpK+TNI8d0c1Qsjp
X-Gm-Gg: ASbGncvokGWy8KeuC11rgs18/uMOp6/D/mY65S9F3FDX2mrdNQRDKnWeHJhaddLxc1M
	EvUzu2TdncrcQBexJmmZ9AQCEImV8tge31dwuRXHiq67rZsSrsLOthRfl9eInwFP0b2i6BxQUO4
	JWnrNgBuHcqD/xnT3qEL+GqH53W9LJZlsZ6dOhZ/ux8RUA2XlLCZTQLZA4kj6n8XWtC/d5bIKEl
	+ZBXKYe1su2quSKcDavtngPBQIzPwEEwHbnE7Nf3j9W4uPw4QrzyI27eX0ckFfsYiWrlQweRc/q
	ASkSErlffjdgDrO8f4OGqXOvKkEfROmSGE7fJg+9Bsq1JOcTuIO9nTeGxSYoRxuTvN3LrGHSJkR
	/5Exp/UWiTnO+f4ekj6iv7YCP
X-Google-Smtp-Source: AGHT+IGfkZEI61CgIzpYxXU8G4mktTudXEmOYpm0fxUboDfEgHg1ACC7bWH08mfx2wWTHyIwtIbcEQ==
X-Received: by 2002:a17:907:2cc5:b0:aa5:44a8:9ae7 with SMTP id a640c23a62f3a-ab2abdc04b4mr1051516566b.47.1736543265084;
        Fri, 10 Jan 2025 13:07:45 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a02-3100-a97f-2b00-1e86-0bff-fe2f-57b7.310.pool.telefonica.de. [2a02:3100:a97f:2b00:1e86:bff:fe2f:57b7])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-ab2c905e2ebsm207172966b.10.2025.01.10.13.07.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 13:07:44 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-sound@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Cc: s.nawrocki@samsung.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	linux-kernel@vger.kernel.org,
	jbrunet@baylibre.com,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [RFC v2 2/2] ASoC: dapm: add support for preparing streams
Date: Fri, 10 Jan 2025 22:07:30 +0100
Message-ID: <20250110210730.705613-3-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250110210730.705613-1-martin.blumenstingl@googlemail.com>
References: <20250110210730.705613-1-martin.blumenstingl@googlemail.com>
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
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
Changes since v1:
- also call snd_soc_dai_prepare() as suggested by Jerome/Mark for the
  source to keep things symmetrical (this is not strictly necessary
  for the Amlogic Meson SoC as it doesn't implement the .prepare
  callback in the platform drivers - but having it symmetrical means
  less confusion for future platform maintainers)


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
2.47.1

