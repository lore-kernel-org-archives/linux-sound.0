Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LlA57ZY0"
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D443D1
	for <linux-sound@vger.kernel.org>; Thu, 30 Nov 2023 11:36:01 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-548f853fc9eso1513948a12.1
        for <linux-sound@vger.kernel.org>; Thu, 30 Nov 2023 11:36:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701372960; x=1701977760; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7hWM7V+ZExvAnFj1W1dKLDuXcl2XOV1nsx6wXsgycfE=;
        b=LlA57ZY0By8CEXzHXuBeQ04uL5GO/aZApwyHAsC8P37GKbBfaRxfDzemv5odbbUqsM
         6uqdnbaKfubDuvEvQp2KJU5E4rXsj6yefQTWjvxlgIyCm/URHjo4PVikoqzdowm+UMwV
         Vz2JjwvRKfYgM+ekf/uv2DyKHQ65BFXQzwvMS2vewbiiG5YRcOG4r8upudwWw96MIYBS
         +EnyE4Yl0X60FLGz4WE4bVsmqNnKc19YTDUBr9toNDQoulYT2PYcnkVdYvuNILS7nDx9
         cjfE/BqkvZifrvDKDhezlKYJBmLoUcxq6TPzZ9ub+Sw/x10NBUiDbsmMrBXrvpWgCZEe
         F7sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701372960; x=1701977760;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7hWM7V+ZExvAnFj1W1dKLDuXcl2XOV1nsx6wXsgycfE=;
        b=vdUMbAYJ5J0yxiTC1EvI/1lVRogzgOOrDWR4f5wzfIIBKN2vnp8OJX4gQ4+AMPI54I
         JBFAa19Zj9w8RI5NtJ+Ydyf7GG5H3tOXYesUyt2A5fuARY4VSyV/agjHB/AK6HBWVlFW
         8Mw3aa29CWUnxfiv1j8RQs33ywufifTeJAptIbGlLa/qRSGHRof479tjd2C/ANKCS2ao
         FI7HF0IVVrFMNjGfkA8Iu9ah2/swYRWvWbZTWBvbIujHYaQjAHr0c2N7cHl9DUNgmtHD
         Qw7eLj5ww7tmQyrxz3s2K5x7stxLZM/iXX0J0w8H9prXgSl9DdZ9/Ld6Ga6Ubd4itvNl
         P3Sw==
X-Gm-Message-State: AOJu0YyEi5pELT/vHBU272k6X9+jc0BaresFqYBjPf+BEyt5rfHGN9Nr
	0o8Tzo/QGtvo4PduZsy/45uDEj5WubI6wShx8Ga/jQ==
X-Google-Smtp-Source: AGHT+IGG8SW/XcQazf2iyEQkOuHfNKXEzI1KvqtYFQzrb/U6iIkfOpKTu2rQXzzMQj1IPVHwiHZ0mg==
X-Received: by 2002:a17:906:b88f:b0:a19:a1ba:bab7 with SMTP id hb15-20020a170906b88f00b00a19a1babab7mr5512ejb.93.1701367681837;
        Thu, 30 Nov 2023 10:08:01 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.109])
        by smtp.gmail.com with ESMTPSA id y16-20020a170906559000b009a1dbf55665sm926713ejp.161.2023.11.30.10.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 10:08:01 -0800 (PST)
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
Subject: [PATCH v2 1/3] ASoC: qcom: audioreach: Commonize setting channel mappings
Date: Thu, 30 Nov 2023 19:07:56 +0100
Message-Id: <20231130180758.212172-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move code assigning channel mapping values to a common helper function.
This simplifies three out of four cases, with the last case using
incompatible type (uint16_t array instead of uint8_t array).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. New patch
---
 sound/soc/qcom/qdsp6/audioreach.c | 35 ++++++++++++++-----------------
 1 file changed, 16 insertions(+), 19 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index 5974c7929dd3..3db5ff367a29 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -267,6 +267,16 @@ void *audioreach_alloc_apm_cmd_pkt(int pkt_size, uint32_t opcode, uint32_t token
 }
 EXPORT_SYMBOL_GPL(audioreach_alloc_apm_cmd_pkt);
 
+static void audioreach_set_channel_mapping(u8 *ch_map, int num_channels)
+{
+	if (num_channels == 1) {
+		ch_map[0] =  PCM_CHANNEL_L;
+	} else if (num_channels == 2) {
+		ch_map[0] =  PCM_CHANNEL_L;
+		ch_map[1] =  PCM_CHANNEL_R;
+	}
+}
+
 static void apm_populate_container_config(struct apm_container_obj *cfg,
 					  struct audioreach_container *cont)
 {
@@ -864,12 +874,8 @@ static int audioreach_set_compr_media_format(struct media_format *media_fmt_hdr,
 		mp3_cfg->endianness = PCM_LITTLE_ENDIAN;
 		mp3_cfg->num_channels = mcfg->num_channels;
 
-		if (mcfg->num_channels == 1) {
-			mp3_cfg->channel_mapping[0] =  PCM_CHANNEL_L;
-		} else if (mcfg->num_channels == 2) {
-			mp3_cfg->channel_mapping[0] =  PCM_CHANNEL_L;
-			mp3_cfg->channel_mapping[1] =  PCM_CHANNEL_R;
-		}
+		audioreach_set_channel_mapping(mp3_cfg->channel_mapping,
+					       mcfg->num_channels);
 		break;
 	case SND_AUDIOCODEC_AAC:
 		media_fmt_hdr->data_format = DATA_FORMAT_RAW_COMPRESSED;
@@ -1089,13 +1095,8 @@ static int audioreach_pcm_set_media_format(struct q6apm_graph *graph,
 	media_cfg->q_factor = mcfg->bit_width - 1;
 	media_cfg->bits_per_sample = mcfg->bit_width;
 
-	if (num_channels == 1) {
-		media_cfg->channel_mapping[0] = PCM_CHANNEL_L;
-	} else if (num_channels == 2) {
-		media_cfg->channel_mapping[0] = PCM_CHANNEL_L;
-		media_cfg->channel_mapping[1] = PCM_CHANNEL_R;
-
-	}
+	audioreach_set_channel_mapping(media_cfg->channel_mapping,
+				       num_channels);
 
 	rc = q6apm_send_cmd_sync(graph->apm, pkt, 0);
 
@@ -1153,12 +1154,8 @@ static int audioreach_shmem_set_media_format(struct q6apm_graph *graph,
 		cfg->endianness = PCM_LITTLE_ENDIAN;
 		cfg->num_channels = mcfg->num_channels;
 
-		if (mcfg->num_channels == 1)
-			cfg->channel_mapping[0] =  PCM_CHANNEL_L;
-		else if (num_channels == 2) {
-			cfg->channel_mapping[0] =  PCM_CHANNEL_L;
-			cfg->channel_mapping[1] =  PCM_CHANNEL_R;
-		}
+		audioreach_set_channel_mapping(cfg->channel_mapping,
+					       num_channels);
 	} else {
 		rc = audioreach_set_compr_media_format(header, p, mcfg);
 		if (rc) {
-- 
2.34.1

