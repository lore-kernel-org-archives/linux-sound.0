Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 426E525C80D
	for <linux-sound@vger.kernel.org>; Sat, 25 Oct 2025 04:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761366622; cv=none; b=VF4KGfHUOiFxnPzias+Gu4+TomW0dvFohsx8FsCOdGkW5SFr3FAyn7MrUH6wdGBGetjnRLFvJy5NKfbRXYQXRfUrQZcuqLWsVScM3ofVw6+ogjZ1Xhe1A6D3uudxe599kZrOv90cGDeeXHjORWN6aBx5bMYc/GYbum6/GggJiwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761366622; c=relaxed/simple;
	bh=uM1zICi2IeNzgDiSdnW52W6bh7sjCXEC60ZWMbk1sEk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mXCUjEe4xNKK8U1Os+TK+eu1fMZPcu8qtb/i1rA8w6uDdYsj3yqk2alqLOXwqF5939xm4dvUilg9oKO0CaaXGHsVUo/k/hOWUziI/aYGlHh6bPbZGkWlQUuneupUykbswgZOpTL5Ew4ZyEInlSaBpkIic9QLrNuIA3d8N5+Qwy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nYTyfUSd; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nYTyfUSd"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-782e93932ffso2230367b3a.3
        for <linux-sound@vger.kernel.org>; Fri, 24 Oct 2025 21:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761366620; x=1761971420; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VKM1l0S1H1voKqVnV3wmOtndsVV1rHqN2zk5FLIUsHQ=;
        b=nYTyfUSdkQ9YjK1mqym09CgvGehUcPGjD9qFUzAkXsnOK3cTlPy6CpXVt8ZcOwnXwl
         oMzwM0mh0eeqeptWXA/mOuoOWq0N0DwdMqxFwXok5LLGnLFq6ZZ6Q6cuVPVvanHuvoQQ
         0CcogXNjcOIywn3hu4eJkgKYIYFd/AM3MmBa7+vaWYr2MHbR3L+ydcMfrQ84/4y9brrH
         5rlm5WHfNxahmwQ1xXu61YLxNevCEAp6yma38/XcICZSrF0T5u/eFz4k2ArXA/LOJxIv
         wGpLXN8xo/h8jyXoK9Qlb4Jqa/hAZH5sHpbqV8TNz7lFffnElOmzBRCXfYh0CaTsO/CM
         5riw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761366620; x=1761971420;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VKM1l0S1H1voKqVnV3wmOtndsVV1rHqN2zk5FLIUsHQ=;
        b=WXBWrpk0uulGtQHOAAdcd0GtoX7Rosu9BRwZD+9/6veGg0xe4PlIudH6JdBeiL+Axy
         mkrTmi8W9yosuM+CLGa88HXK2UsFjTTpKP57ST++N1F6ZPXY/Pez+jDoTTdVvamCv5St
         SaiyS/9rfxyfRFud34tVCQz+BFwowLVc162d0dpVicnbChSrdJ7CJwuX9fhACTIoiPva
         okai4yMMrCZMLrIvu5RyD4xScjTwxdpGz4tS3uuGy0d2DpoZwSyZJKcLju566bT6hlAG
         TcIeUgN4usr7RUY/VHt8xOmjBjKJzbQlHkZo220CQ/7yyO6U+OAskUj8qYV4Ub/uaDi4
         0L6A==
X-Forwarded-Encrypted: i=1; AJvYcCW1nQ+4ShNAYlN7vCrqx2RfRyGU7/4xN0lV+O6fKqpuY7jQaiS4ZiZAplqubeYBFNZ/aBe248I6QTXfXA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3Q2unGV2Z8Fus1xs4wiGnJEqvuYfxf1soDwZBxBZUgeqWfjW8
	7VedF3mO/3zXRLx/GGKsaQh4IpLsCu29NzQcSRj1bkANAuNBM0ZLgEPY
X-Gm-Gg: ASbGncsB/zeB+tUxE80aXsvIQCl6Un+hXTgYeIb4+K61wIvjJnH/tD0iwbpmM/h0wQ6
	FZy1x53G2mveXwuwO9FGiHivfSsOBsDFjuRG4HjQvaFpCglHlStqgh0gMdmXpD40MI0ZR/tme/L
	8nCA1AmzjtyCnS1TxJfjFHOlcF57ofVdEUiZqRdNevOV/uJvkSoNo3T2buGK7mSpo2Ksd6gmVpG
	I2fm4HgfXPP/BNiK+/RxGq+rpPoYaWiDae0H38WIYiAAT+JIIQRjhwwH7a67Rtl5t17sQtsyHQW
	/6blJfqjWeXuD8oa9gC7EJeK+/JKqTmoXMjwBMsGsMMzpEGitJ6qiK8b3+ojyfxjNs/jjssC5oE
	Ip0BY8FDFiLqj847/ubalOWeG5UtaE1DHLMkua71gnp05Eh073YZ2BTrqyGaFHtl1DyltLihA9V
	U=
X-Google-Smtp-Source: AGHT+IHnxtIhiuCO0WxN5X1kEHXzwK1hnW/lH3LtDeMQqk+92JN/kd97ffteykynOMj24ZQ8sJlSGw==
X-Received: by 2002:a05:6a00:2e1f:b0:7a2:7df5:5bb2 with SMTP id d2e1a72fcca58-7a27df562dfmr7690599b3a.10.1761366620399;
        Fri, 24 Oct 2025 21:30:20 -0700 (PDT)
Received: from gmail.com ([49.37.171.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a414066d0esm910393b3a.43.2025.10.24.21.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 21:30:19 -0700 (PDT)
From: hariconscious@gmail.com
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: khalid@kernel.org,
	shuah@kernel.org,
	david.hunter.linux@gmail.com,
	kuninori.morimoto.gx@renesas.com,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HariKrishna Sagala <hariconscious@gmail.com>
Subject: [PATCH] ASoC: codec: wm8400: replace printk() calls with dev_*() device aware logging
Date: Sat, 25 Oct 2025 10:00:11 +0530
Message-ID: <20251025043011.598300-1-hariconscious@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: HariKrishna Sagala <hariconscious@gmail.com>

Replace direct printk() calls with the appropriate dev_*() logging
APIs.Use dev_err, dev_warn, dev_info, or dev_dbg to reflect the correct
severity level. Pass the canonical struct device pointer so logs
include device context and become traceable to specific hardware
instances.Improve log clarity, make messages filterable by device
and align the driver with kernel logging conventions to aid
debugging and maintenance.

Signed-off-by: HariKrishna Sagala <hariconscious@gmail.com>
---

This patch replaces direct printk() calls with the dev_*() logging APIs.
The change uses dev_err/dev_warn/dev_info/dev_dbg and converts messages 
to dev_*() where applicable. Note that this file already uses dev_*() 
logging in other sections and the patch makes the remaining calls 
consistent with those existing usages. I have verified compilation with 
the configs "CONFIG_COMPILE_TEST","CONFIG_MFD_WM8400" enabled and booted.
Runtime testing is requested to confirm logging output, device prefixes 
and that there are no regressions.Please report any failures or unexpected 
log behavior and I will update the patch accordingly.

 sound/soc/codecs/wm8400.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/wm8400.c b/sound/soc/codecs/wm8400.c
index 5ad6d5b63ffc..d716775cedc2 100644
--- a/sound/soc/codecs/wm8400.c
+++ b/sound/soc/codecs/wm8400.c
@@ -318,6 +318,7 @@ static int outmixer_event (struct snd_soc_dapm_widget *w,
 	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
 	struct soc_mixer_control *mc =
 		(struct soc_mixer_control *)kcontrol->private_value;
+	struct wm8400_priv *wm8400 = snd_soc_component_get_drvdata(component);
 	u32 reg_shift = mc->shift;
 	int ret = 0;
 	u16 reg;
@@ -326,7 +327,7 @@ static int outmixer_event (struct snd_soc_dapm_widget *w,
 	case WM8400_SPEAKER_MIXER | (WM8400_LDSPK << 8) :
 		reg = snd_soc_component_read(component, WM8400_OUTPUT_MIXER1);
 		if (reg & WM8400_LDLO) {
-			printk(KERN_WARNING
+			dev_warn(wm8400->wm8400->dev,
 			"Cannot set as Output Mixer 1 LDLO Set\n");
 			ret = -1;
 		}
@@ -334,7 +335,7 @@ static int outmixer_event (struct snd_soc_dapm_widget *w,
 	case WM8400_SPEAKER_MIXER | (WM8400_RDSPK << 8):
 		reg = snd_soc_component_read(component, WM8400_OUTPUT_MIXER2);
 		if (reg & WM8400_RDRO) {
-			printk(KERN_WARNING
+			dev_warn(wm8400->wm8400->dev,
 			"Cannot set as Output Mixer 2 RDRO Set\n");
 			ret = -1;
 		}
@@ -342,7 +343,7 @@ static int outmixer_event (struct snd_soc_dapm_widget *w,
 	case WM8400_OUTPUT_MIXER1 | (WM8400_LDLO << 8):
 		reg = snd_soc_component_read(component, WM8400_SPEAKER_MIXER);
 		if (reg & WM8400_LDSPK) {
-			printk(KERN_WARNING
+			dev_warn(wm8400->wm8400->dev,
 			"Cannot set as Speaker Mixer LDSPK Set\n");
 			ret = -1;
 		}
@@ -350,7 +351,7 @@ static int outmixer_event (struct snd_soc_dapm_widget *w,
 	case WM8400_OUTPUT_MIXER2 | (WM8400_RDRO << 8):
 		reg = snd_soc_component_read(component, WM8400_SPEAKER_MIXER);
 		if (reg & WM8400_RDSPK) {
-			printk(KERN_WARNING
+			dev_warn(wm8400->wm8400->dev,
 			"Cannot set as Speaker Mixer RDSPK Set\n");
 			ret = -1;
 		}

base-commit: 6548d364a3e850326831799d7e3ea2d7bb97ba08
-- 
2.43.0

