Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FBAA1E487
	for <linux-sound@vger.kernel.org>; Mon,  3 Nov 2025 09:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762161328; cv=none; b=noTy28mA5YB1tbyxmmiWQleb8Na5IAmvZ/7eGW/YcFqsDVGhPD70O9zLIxmWIuRCk7t81EuHw+xQzPdS9tkS+tBuJIP/DWLZk8PRvkHLvhdBdgdf1UrPpOzMy5ksrsF+v9dl6J1/PgbUdrzAXN2c1Du26B+fkRlEa+LJ5bxfj3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762161328; c=relaxed/simple;
	bh=nAXp1G9IdD+nsaZL7wCdYoZ87Y5mDfPQn7QiV131jdI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pYPmELw2pOHbKssgLawQyrIx/daQE9tcXM/27AW0gHW996W/9R0f1lXMvPwGKO9Nb0L8O77jqggd0RHNNndvjKujHaD5erwIrD+trbMwVmmxM6JNKD3U4yFPZCHbmwRas68oY1GSobxQPZuxP1e3HH3w/i6qa7wFKpnYumvneLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k1rUEfKX; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k1rUEfKX"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-47118259fd8so30039955e9.3
        for <linux-sound@vger.kernel.org>; Mon, 03 Nov 2025 01:15:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762161325; x=1762766125; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/ZQ31uBapWn8TpaGSOKFbOT9Vn5ATg+1Zi6kgQOkTsw=;
        b=k1rUEfKXGvMdG3Kq+da4uld6UWBr+smbis1bSSwjR4xWVab5uZiyBmFMV585KiI8gL
         Xd+J3ppAnve2r/Y/KQWjvu6U+aW3b9YnF5fnhHp1c3nqYTJR4ulCrA1pXYrrmD094AF5
         qqcqpASiPAh+YGg6JrazFEOtKdr1rdd4tpXGt/8qoGFrl7xB/RN7++a95/Mh5m38e4Ey
         igceFiBx7Ln6V94b+oSXliztjVDAozNJWzamrMXqmtgGlcMOHSrbzecOVQ/IlnkqN2lH
         2shFsIt0Pq0gN6OJ7D+RvQ0TWKHvbnav1JFkV/DOY89ArAsrCKprnvwNQvnHk4tOSdOb
         wPPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762161325; x=1762766125;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/ZQ31uBapWn8TpaGSOKFbOT9Vn5ATg+1Zi6kgQOkTsw=;
        b=MSU2P6inHtC0jNOhANCx1AgjAx4mwpfutELURhbhvvshK6fu9NlkLpD9bhQc09Myji
         QGm/vVdx6le0FJN6cMv74eY0QKtS7Kxqeyz0RuifsCKZB0JnEkiFFc8CV8B9itEP9+55
         90UQYzzreuoHNkOH/9pmLJFVuP5yqJpxSnQ1D8DyOJZK6co3KUoSsr+N/pIKcHAWnQYD
         Dnx3M0EsCVU8+fmln6Zc0CGc7T2vukaZ4IdD7eQ18RX+cOfEkSNRoKNWLc+xd9BSbPa9
         dfB30LVXUG25fifgGuyP22WBHftsacJi2gfEUYA+rtIUIyw3nHVT9Hw6KTQsSp2Zvib2
         3o+w==
X-Forwarded-Encrypted: i=1; AJvYcCV3iQN6bPjYxEGNsR3JmNyD4q+IzsGpV04Y8uFUDQltkrct3oE60IttcP468+GyTrEjH/oHe0MmfLRaOA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzGsG7UzlBiawyyCEQ54P/2BDKeJ3RuCrj8ave5113oG3f0nsz/
	SnDP1Rlb9LxhXyOgZ6mqKxSNeK3k7cyZQ9NnvKwZoAhrWr9qV80BqXk/
X-Gm-Gg: ASbGncsZCAZWrrrB1+2Ru5sad4VIH/yzb3mRWiV/MZPeH1mY0/yBng5m/PRxjpoijpf
	jSxUSuV42LPfKY/TXyP9bYFgUhV36r9LCce2qJIvMClC/UMcAcCR7RLQqrfpCQUKRE3VzzDg9jl
	/Lb1y34y5gG7k45o79eHLQgZ9ukKOPuxXhlOdkrIMhjtM7FBPTX+D3xFSf95nyRwfMve5g9v4O9
	d6TBwGkwfuqNHYlto1OjAxuLHz9OH2KQJcLM3XO/UsEj8sQ7eRMVMaTflhFXQ91mcuhOAD+Iutg
	UER2LKWJrvUImBfEPnzg3UOHkVv6l/py4DrpXv+WD3k2gPKt/oKDe4A34Bj18UXKsJ1lPz7tMi6
	mGGowcbzSr/GrG9ch6TkdXKjEXUsMILoHMVevf+cWzAoOE9pY7GfKsjwLn/PHWjjIHjmQRaSOB0
	UNxbL0bCrH6N1mx5H6bYV9gVgDFDOk3Gz9C0IXIZxxniZD0PQvMuKCTQ==
X-Google-Smtp-Source: AGHT+IGHdJ+7zpQqfZ0XicmVKdDXij6b1rWkIqZ6JG8RjEy2x9Y2sOpfDqTqJJOoXGbkSvNx1y+syg==
X-Received: by 2002:a05:600c:1553:b0:471:15bb:ad7b with SMTP id 5b1f17b1804b1-477307b5f7cmr119126885e9.6.1762161324561;
        Mon, 03 Nov 2025 01:15:24 -0800 (PST)
Received: from sharique-Precision-3640-Tower.hw.mobotix.net ([213.183.84.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4773c2e674csm142704885e9.4.2025.11.03.01.15.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 01:15:24 -0800 (PST)
From: Sharique Mohammad <sharq0406@gmail.com>
To: broonie@kernel.org
Cc: perex@perex.cz,
	linux-sound@vger.kernel.org,
	lgirdwood@gmail.com,
	Sharique Mohammad <sharq0406@gmail.com>
Subject: [PATCH 1/2] ASoC: max98090/91: adding two virtual Mux widgets for digital mics
Date: Mon,  3 Nov 2025 10:14:47 +0100
Message-Id: <20251103091447.771793-1-sharq0406@gmail.com>
X-Mailer: git-send-email 2.30.5
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The two digital mics M1(primary digital mic) and M2(secondary digital
mic) work independently of one another. It means they could be switched
On or Off independently of one another. To control their On or Off
state, with this patch creating two virtual multiplexer widgets
"DMIC M1 Mux" and "DMIC M2 Mux", with two options "Enable" and "Disable".

Signed-off-by: Sharique Mohammad <sharq0406@gmail.com>
---
 sound/soc/codecs/max98090.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/sound/soc/codecs/max98090.c b/sound/soc/codecs/max98090.c
index 0891ffd0e123..6c3c09236ab4 100644
--- a/sound/soc/codecs/max98090.c
+++ b/sound/soc/codecs/max98090.c
@@ -817,6 +817,16 @@ static SOC_ENUM_SINGLE_VIRT_DECL(dmic_mux_enum, dmic_mux_text);
 static const struct snd_kcontrol_new max98090_dmic_mux =
 	SOC_DAPM_ENUM("DMIC Mux", dmic_mux_enum);
 
+static const char * const dmic_mX_mux_text[] = { "Enable", "Disable" };
+
+static SOC_ENUM_SINGLE_VIRT_DECL(dmic_m1_enum, dmic_mX_mux_text);
+static const struct snd_kcontrol_new max98090_dmic_m1_mux =
+	SOC_DAPM_ENUM("DMIC M1 Mux", dmic_m1_enum);
+
+static SOC_ENUM_SINGLE_VIRT_DECL(dmic_m2_enum, dmic_mX_mux_text);
+static const struct snd_kcontrol_new max98090_dmic_m2_mux =
+	SOC_DAPM_ENUM("DMIC M2 Mux", dmic_m2_enum);
+
 /* LINEA mixer switch */
 static const struct snd_kcontrol_new max98090_linea_mixer_controls[] = {
 	SOC_DAPM_SINGLE("IN1 Switch", M98090_REG_LINE_INPUT_CONFIG,
@@ -1106,6 +1116,9 @@ static const struct snd_soc_dapm_widget max98090_dapm_widgets[] = {
 
 	SND_SOC_DAPM_MUX("DMIC Mux", SND_SOC_NOPM, 0, 0, &max98090_dmic_mux),
 
+	SND_SOC_DAPM_MUX("DMIC M1 Mux", SND_SOC_NOPM, 0, 0,
+		&max98090_dmic_m1_mux),
+
 	SND_SOC_DAPM_PGA_E("MIC1 Input", M98090_REG_MIC1_INPUT_LEVEL,
 		M98090_MIC_PA1EN_SHIFT, 0, NULL, 0, max98090_micinput_event,
 		SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_POST_PMD),
@@ -1242,6 +1255,9 @@ static const struct snd_soc_dapm_widget max98091_dapm_widgets[] = {
 	SND_SOC_DAPM_SUPPLY("DMIC34_HPF", M98090_REG_FILTER_CONFIG,
 		M98090_FLT_DMIC34HPF_SHIFT, 0, NULL, 0),
 
+	SND_SOC_DAPM_MUX("DMIC M2 Mux", SND_SOC_NOPM, 0, 0,
+		&max98090_dmic_m2_mux),
+
 	SND_SOC_DAPM_AIF_OUT("AIFOUT2L", "HiFi Capture", 0,
 		SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_OUT("AIFOUT2R", "HiFi Capture", 0,
-- 
2.30.5

