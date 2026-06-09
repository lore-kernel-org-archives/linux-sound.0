Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FBD041B34C
	for <linux-sound@vger.kernel.org>; Tue,  9 Jun 2026 12:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781009222; cv=none; b=qtdmmfvxPUn0K1WISzpOxGgQV4aS/xj5LsyjZgLA56K/u6zaSCwc8vyUjpLijt5r5vwl3mBEG8QuWdpaQjphmp5WsOXJDg0jrqr8sg5OxF4i7mmOsz7LhPxls4DNYLDNY42ZuzQz+tcKLQ7yNV8mTlYDMkLeu9DRi4/+BWpTCCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781009222; c=relaxed/simple;
	bh=zuslSjBhbtwOo+02kXcRyWg4AlDrGCMRcK6xgfcuovQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Kx6PBa9N+FxXQ9yRM6fhVcCXE44neZgbCAbM9htyaatv9zu90t4BaAR17XFEioKAJtZw5WL6bu6KFdui7Z/TBI0erGqEGshR4FBQUojoFNPgKTDLCgwr2ou8QHUxeEEK0iv7P2IVtXXr1VybakcY5IhCgm6Fqb717644IsKYfRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TGlFOTpE; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TGlFOTpE"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c8585c51f1fso2643616a12.1
        for <linux-sound@vger.kernel.org>; Tue, 09 Jun 2026 05:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781009221; x=1781614021; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3ehwC4+p6kz8win9+9tJOLmuWLTHCo6mGAGt8WUYA5c=;
        b=TGlFOTpEaO77Doo6fMGdC1JhMKsHh3gFRjkzhHy9NIabywGM0wufjbX31wKIwOWUkK
         h9esoXSl9+XbQiFIyxgEXg1wCUuU/FhrcsrlzOWNMRTdzpRITH0/+RGGk1Ddn1g4Bf4p
         9hKY2h3EhOjeaIHgEi19mwevsovkphXGvCvtb2/kJMHMu0zJUrpDay1lrAwk7O9HJ2P6
         lJfY/K55h5bnQq96nyZ5S9Z6r9LE1/FlYu1uuwdV+pjhkhTOyRzVcpz2jLR4tqn+IwLk
         OxRDqUqYWBrZjjYyeP3ZmaNjAygw0f3YTeHZTFeJ7dLdTmj3RJjcg7OG2u0x6VmddtYF
         3Tow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781009221; x=1781614021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3ehwC4+p6kz8win9+9tJOLmuWLTHCo6mGAGt8WUYA5c=;
        b=mxwBO4+T2MUx5G4hP+S5XQbGDIaRKA2HN9yr2TRSSKHTibNRegakYEHGBvjYbeMeqc
         lsVGmoPu3SM0Hxzfx2aEuGzfGJBfAPTuO6TJHz0FeQqFv4sV38PnE3fw2xBSVJtdfyPQ
         lCcxQPQxyxBsxqHoS21asqChIfcAOiTr0T8sXQoQsdwikMCY9OzR1T1ANALVvHNHl6fq
         6rAqyORDAj81NO1mjGYPMSGbZ0xBhaPzzScmgbGlZ5+cwnIj7Fu53iNU0wIeTFnv3NVf
         o/ds/Qkg9cecw6dPJNjhN9n3uSrYF5Z9MF8JNdstFcV8YE+ZcbM/zUWjMHwG2GZUVtSk
         3TLA==
X-Forwarded-Encrypted: i=1; AFNElJ/mY+RHN3KfTwYeNoXaieggdlY06lOsVVmA5xnwujLIRyOWa0taUUzZTbrRoDMO/VtFZZDt5rywtVO1Qg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2HxSVQPPqdKKKje3+HkvC9elxra1L5lC5dlxJ4hi+T1uM7fqK
	YR8uDhz3zkC3BLMQaz19RggE+2THNSrsg2kEE5VmbksErYNMcHJaRrDsZlA+Vy9v
X-Gm-Gg: Acq92OH7I6uJ2SRaXL/qCYquLOMsNpieuFmX2Ob1anmAyGoK8xczEXq4PLDqOlnr5XY
	HAqhFczmKVDUxUlNa8ZSAX9r/AuO7fMmyBrRQLVWAGZCmreraMzQ9ZTBZ7NjqZdvw+CLELj1NA3
	69jy9WnyYqxHYs5yG4dOyR6Ysc/2mK0Vl1t5SsY/FgQQyitYTBusLxUP9UjM03Y4dICZY3Iw7lJ
	HoUQRr1qQfcFu8aRL+97r1313LGKiuI7AIQsg/gZgnSIaZyppJMO0f95PXB7ydispMu3L9dW354
	1hvOnJcVHLQS1Yp9za1yuThEU+F3O0yQbV9DYopV8VWRVjc2BmD2HiQpK9WGxeCYL7Lz+Y3wIo0
	Sbp3P7Zyyl/Y5OD4nxVs9XYtyOjXCp/qyz5Nq4cEP45e7Zv0x5X9Z7vA8XfbPqAGU94+/muHOy7
	E2sPYS/fIlFrnffi4Xdx0juYxez2stMd02qn5RvvqY37YXftyYMSDan8tUXmbto/t4/IvxhNQai
	xnOObuiH+KS/wWAXxrYQTQisRw=
X-Received: by 2002:a17:902:f650:b0:2bd:2c3a:2a36 with SMTP id d9443c01a7336-2c1eb7476d2mr171953745ad.0.1781009220767;
        Tue, 09 Jun 2026 05:47:00 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16629d40asm204686345ad.64.2026.06.09.05.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 05:46:59 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH 2/4] ASoC: meson: aiu: Validate written enum values
Date: Tue,  9 Jun 2026 21:43:14 +0900
Message-ID: <20260609124317.38046-3-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260609124317.38046-1-sammiee5311@gmail.com>
References: <20260609124317.38046-1-sammiee5311@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The AIU HDMI and internal codec mux put callbacks use the written enum
value with snd_soc_enum_item_to_val() before checking whether the value is
valid for the enumeration.

Reject out-of-range values before converting the enum item, matching the
validation already done by the G12A HDMI and internal codec mux controls.

Fixes: b82b734c0e9a ("ASoC: meson: aiu: add hdmi codec control support")
Fixes: 65816025d461 ("ASoC: meson: aiu: add internal dac codec control support")
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 sound/soc/meson/aiu-acodec-ctrl.c | 3 +++
 sound/soc/meson/aiu-codec-ctrl.c  | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/sound/soc/meson/aiu-acodec-ctrl.c b/sound/soc/meson/aiu-acodec-ctrl.c
index 483772ba69cd..94c5d6533523 100644
--- a/sound/soc/meson/aiu-acodec-ctrl.c
+++ b/sound/soc/meson/aiu-acodec-ctrl.c
@@ -36,6 +36,9 @@ static int aiu_acodec_ctrl_mux_put_enum(struct snd_kcontrol *kcontrol,
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
 	unsigned int mux, changed;
 
+	if (ucontrol->value.enumerated.item[0] >= e->items)
+		return -EINVAL;
+
 	mux = snd_soc_enum_item_to_val(e, ucontrol->value.enumerated.item[0]);
 	changed = snd_soc_component_test_bits(component, e->reg,
 					      CTRL_DIN_LRCLK_SRC,
diff --git a/sound/soc/meson/aiu-codec-ctrl.c b/sound/soc/meson/aiu-codec-ctrl.c
index 396f815077e2..60bb4cdfee52 100644
--- a/sound/soc/meson/aiu-codec-ctrl.c
+++ b/sound/soc/meson/aiu-codec-ctrl.c
@@ -28,6 +28,9 @@ static int aiu_codec_ctrl_mux_put_enum(struct snd_kcontrol *kcontrol,
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
 	unsigned int mux, changed;
 
+	if (ucontrol->value.enumerated.item[0] >= e->items)
+		return -EINVAL;
+
 	mux = snd_soc_enum_item_to_val(e, ucontrol->value.enumerated.item[0]);
 	changed = snd_soc_component_test_bits(component, e->reg,
 					      CTRL_DATA_SEL,
-- 
2.43.0

