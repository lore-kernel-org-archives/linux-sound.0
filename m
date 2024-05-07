Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDD8114D6EB
	for <linux-sound@vger.kernel.org>; Tue,  7 May 2024 10:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715076138; cv=none; b=Mqw+Q7PS4fBAbhXbUwflel/aZ6ZnWmpemQZ+YxVRie0x3mObGHp3WUMiEq4W+eH0NwNTRd4MmAZTmRAFhYxD03SMLhMZ5hjyO3hl6SrzNArJspv7Gn5rjb0aROYYulteJh+pf8taaeolahyV24o4Mi1UUH71LnGVw2nfN+cVkyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715076138; c=relaxed/simple;
	bh=jxrbP51ApwB+nB6k7droxBtoZKEplqH7fzVFkVtvoqM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZYFzn8Sob4nIaNBkm/5dEvSlq0Mt2UzoFlQ2rt8wR8FfITwo+ejROKSZsQiJdd3T+9qNtw05e6+NJIvsX6MeJhjBfTa2Dc3c17oNvHH/MQQ1kZ64njLSvNnMN5eAP9pG6VyHvxXKaX172NE9PvbJ7A2KjHGrSM9q/z3lnnAHlSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P+9WF2m6; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P+9WF2m6"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a59a64db066so725045266b.3
        for <linux-sound@vger.kernel.org>; Tue, 07 May 2024 03:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715076133; x=1715680933; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Xh7EFY8Q7bV9bAL/jh9gBCI67O6P18pHtiY/L20Df14=;
        b=P+9WF2m6Emwn3JDxXyLaM8QqaHtR/Q3qWaG9wtr8+XBpY6F2Nyf/vFAZra2GRg9zwN
         j381UFzEGFY/E6nqKVEMm55v6rBH6s6BM2TK9R2LT5TtbdE38jVonK4sAUtscUnlHcQx
         xANP19lb8T8eIduQv6PS56zyuSyPJXMGwmhJEQaHq9aLFECScs3UYPUnAeep+pkFTJO/
         TPN3A92qIwS7ChNl1QWciW3H4JwTmzpGfKBMUIZYUttQJbv0kcgV9v/K3DFTG8bk6T2A
         5HJuqxJQxahHcfLg2awFxMwjoCZ9gmpy4Ysic9c/tvRbsYUNmmYbu/ZeY1mV9jtbf63S
         rI5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715076133; x=1715680933;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xh7EFY8Q7bV9bAL/jh9gBCI67O6P18pHtiY/L20Df14=;
        b=JiKMZaOu66/7QS4ZBbbfuUOdD5amOGoMiDNVd9lE64Iihkp/fP52tXQUwSJp3KHN1Z
         7SBaySKffmGuUJC+H5/XR90uqax05/R1adG/lxRXCfbDL0PzDZjHnyzz+cK3+vHPmrX5
         X8DbSVkQgxW/VrGMI6q9T+sk7obHmFLEIZAoQ/w9HVFlJZ00s+c8PZzZSllRI236yiKQ
         1gsXnz/n3yV20DLL53h8AkwZFVGHWGD4YLBqECqnk488gZupTLRSGRfWeUEFcSUU7ov3
         aGnDOvdu8XmF/KXox6zArmPafatjtSly3S6+0jwJJc+sE8tFCcOh13gWCIoTHp4ott+S
         j+KQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxDpHpSGtKl3bfDy/fvWLQM6FwmDIPHrR8J406SfvDl2jytufgEfFWGzBIXo/piOtkanE44EBOF+x8zRRPJqw6mmN4qT/IJrPsH1I=
X-Gm-Message-State: AOJu0YyZIErUKXz0y4fma2QoUq82H0Lk1TQuoOq1ckpbnBLUXwRqmRRY
	Qhe9QDJQpWkxt0HejGhF7OWlfrcwat9UyGfpKsmYl7uSVDo7nIyHR7iXEhht4Ho=
X-Google-Smtp-Source: AGHT+IGdTeYrrvQuiHJ267AFGQGOr/InjQ1hSYK78u1GMZuzU7Nd8dK+zAN8gjqU0ku58bn2t42Wow==
X-Received: by 2002:a17:907:1b06:b0:a59:9a68:7283 with SMTP id mp6-20020a1709071b0600b00a599a687283mr9092604ejc.12.1715076133185;
        Tue, 07 May 2024 03:02:13 -0700 (PDT)
Received: from krzk-bin.. ([178.197.206.169])
        by smtp.gmail.com with ESMTPSA id qy29-20020a170907689d00b00a59adb12790sm3792651ejc.27.2024.05.07.03.02.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 03:02:12 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH] ASoC: qcom: audioreach: Correct mapping of back speakers
Date: Tue,  7 May 2024 12:02:09 +0200
Message-ID: <20240507100209.610436-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Qualcomm DSP, according to downstream sources, expects back speakers to
be mapped as "back", not "surround".  The surround is used only for 8+
speakers configuration.

Reported-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Fixes: 3c5fcb20e07e ("ASoC: qcom: audioreach: Add 4 channel support")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/qcom/qdsp6/audioreach.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index 5291deac0a0b..c655f0213723 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -277,8 +277,8 @@ static void audioreach_set_channel_mapping(u8 *ch_map, int num_channels)
 	} else if (num_channels == 4) {
 		ch_map[0] =  PCM_CHANNEL_FL;
 		ch_map[1] =  PCM_CHANNEL_FR;
-		ch_map[2] =  PCM_CHANNEL_LS;
-		ch_map[3] =  PCM_CHANNEL_RS;
+		ch_map[2] =  PCM_CHANNEL_LB;
+		ch_map[3] =  PCM_CHANNEL_RB;
 	}
 }
 
@@ -851,8 +851,8 @@ static int audioreach_mfc_set_media_format(struct q6apm_graph *graph,
 	} else if (num_channels == 4) {
 		media_format->channel_mapping[0] = PCM_CHANNEL_FL;
 		media_format->channel_mapping[1] = PCM_CHANNEL_FR;
-		media_format->channel_mapping[2] = PCM_CHANNEL_LS;
-		media_format->channel_mapping[3] = PCM_CHANNEL_RS;
+		media_format->channel_mapping[2] = PCM_CHANNEL_LB;
+		media_format->channel_mapping[3] = PCM_CHANNEL_RB;
 	}
 
 	rc = q6apm_send_cmd_sync(graph->apm, pkt, 0);
-- 
2.43.0

