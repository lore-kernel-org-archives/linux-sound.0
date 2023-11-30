Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C6y6irdv"
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5FC9133
	for <linux-sound@vger.kernel.org>; Thu, 30 Nov 2023 10:45:31 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-332f4ad27d4so826355f8f.2
        for <linux-sound@vger.kernel.org>; Thu, 30 Nov 2023 10:45:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701369930; x=1701974730; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AC9X+I2DWGil+KYfObDh0oa4Sp4cVvyRNcYSz6qi/GY=;
        b=C6y6irdvw6cjTYuqtdLXCQgyoBcNF6fIUXpVv8KX1Jvqj5vSRwBqTk4/x0c6ZywjmO
         ANrA7DiLT2Pi7FyaK3JB+wsVlkO9FzQoPfA7xu0tT3ks8iAHGSLZ7dl4PVxp5nxGqUXK
         6Zs4SIEf7Fuz4xGiAfjQ3mG7y2roBL3HQMFBPWFMBxge4DbD938ejhDgM13cmA28mAZj
         Dmu5iWvl14/UpNWIpC96ZxPpdzpDcbHzIlq/PB0JoVVDoajIdeG54j7kDrwCi8rENE3/
         5T/UYR5/8F74LkhpJ+fUkyttcdmJ5nJofXNP+SsTx8zxKS7xNeUpXcnyfcrUcJDorNs0
         MUSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701369930; x=1701974730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AC9X+I2DWGil+KYfObDh0oa4Sp4cVvyRNcYSz6qi/GY=;
        b=RJCFb/rN4CCKk9vCeDSNiSO9kkAbLIhrMNxFJ0MUREqHps5EA1+/+hLTHG7bIiPbXV
         0+KuK/XMF8tIzhyt501oNfSs8Z9OGZ9VhqZHNHovny7aq8+IEtde5YqVnG1GRHQrZf3Z
         lV5d+QyndfHMA6NSaX+cG2tryRnRNLlh+UrcfyeIZieDN+vnaOSVPgmNZV8TSx6Dw4Qr
         g81EAlP8mrmFV91sSnxL1Dcj3VfYnZuygW7fNLwbI2dUIC+jZiheRzzPBh0zQY3N8EoM
         DezprAyoraW7RMomOrjHVVUTDc3H7KBJ8KYvQ9BWT3BhZkizDcrz32ukTtbj6/NU4pub
         FXnw==
X-Gm-Message-State: AOJu0YxnYR/YWUzEJzs/V5jYXP8k02g5V127eAIvEHyTp7ox4I7BTg9e
	ttdV9YqDAvWcmLGCxKcJHC0tjEnaEKr0lY75WuF3YQ==
X-Google-Smtp-Source: AGHT+IFvub3SCGtusk+ZqhsrvxJgXcKJ9ivYgKET4m1jBYY5pnBV8bUXpwvzJHOJT7A45CaynCXmxA==
X-Received: by 2002:adf:fdcc:0:b0:333:2fd2:68fa with SMTP id i12-20020adffdcc000000b003332fd268famr12459wrs.141.1701367693588;
        Thu, 30 Nov 2023 10:08:13 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.109])
        by smtp.gmail.com with ESMTPSA id y16-20020a170906559000b009a1dbf55665sm926713ejp.161.2023.11.30.10.08.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 10:08:13 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 2/3] ASoC: qcom: audioreach: drop duplicate channel defines
Date: Thu, 30 Nov 2023 19:07:57 +0100
Message-Id: <20231130180758.212172-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231130180758.212172-1-krzysztof.kozlowski@linaro.org>
References: <20231130180758.212172-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

q6apm.h header already defines channel mapping values, so drop
duplicated devices from audioreach.h.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. New patch
---
 sound/soc/qcom/qdsp6/audioreach.c | 12 ++++++------
 sound/soc/qcom/qdsp6/audioreach.h |  2 --
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index 3db5ff367a29..5c7113d46b6f 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -270,10 +270,10 @@ EXPORT_SYMBOL_GPL(audioreach_alloc_apm_cmd_pkt);
 static void audioreach_set_channel_mapping(u8 *ch_map, int num_channels)
 {
 	if (num_channels == 1) {
-		ch_map[0] =  PCM_CHANNEL_L;
+		ch_map[0] =  PCM_CHANNEL_FL;
 	} else if (num_channels == 2) {
-		ch_map[0] =  PCM_CHANNEL_L;
-		ch_map[1] =  PCM_CHANNEL_R;
+		ch_map[0] =  PCM_CHANNEL_FL;
+		ch_map[1] =  PCM_CHANNEL_FR;
 	}
 }
 
@@ -839,10 +839,10 @@ static int audioreach_mfc_set_media_format(struct q6apm_graph *graph,
 	media_format->num_channels = cfg->num_channels;
 
 	if (num_channels == 1) {
-		media_format->channel_mapping[0] = PCM_CHANNEL_L;
+		media_format->channel_mapping[0] = PCM_CHANNEL_FL;
 	} else if (num_channels == 2) {
-		media_format->channel_mapping[0] = PCM_CHANNEL_L;
-		media_format->channel_mapping[1] = PCM_CHANNEL_R;
+		media_format->channel_mapping[0] = PCM_CHANNEL_FL;
+		media_format->channel_mapping[1] = PCM_CHANNEL_FR;
 	}
 
 	rc = q6apm_send_cmd_sync(graph->apm, pkt, 0);
diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
index e38111ffd7b9..2c82917b7162 100644
--- a/sound/soc/qcom/qdsp6/audioreach.h
+++ b/sound/soc/qcom/qdsp6/audioreach.h
@@ -158,8 +158,6 @@ struct param_id_enc_bitrate_param {
 
 #define MEDIA_FMT_ID_PCM	0x09001000
 #define MEDIA_FMT_ID_MP3	0x09001009
-#define PCM_CHANNEL_L		1
-#define PCM_CHANNEL_R		2
 #define SAMPLE_RATE_48K		48000
 #define BIT_WIDTH_16		16
 
-- 
2.34.1

