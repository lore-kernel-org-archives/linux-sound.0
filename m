Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XxOsazn+"
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD04BC4
	for <linux-sound@vger.kernel.org>; Thu, 30 Nov 2023 10:38:34 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2c9ccf36b25so11214011fa.3
        for <linux-sound@vger.kernel.org>; Thu, 30 Nov 2023 10:38:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701369513; x=1701974313; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=07QYxEgyoqmQ3Q1vq77DMefnw2mMccatpZsNXnEAueU=;
        b=XxOsazn+Iu4N+ofc00ZoJEgPik/DYi+QOxZsEOe2cN3vQyQ1lVPr5RAcdT+pEIBxbb
         7YAoEjTin9pI2LU7zyKWFfkgeEY/pFrBjTA5v+8CcxlFzAcgaUypCIPoCJZtY3HELya3
         b0AUShnZU2DNrsRbfbwslYYkJfkXuxlm3m8ToYz7ngqkIBlyQbMw6j3vRx0b4pnq7qYx
         UHZrBcCFMzeSQqSI6XfWLZG+817gDcsZCnheuNzl6pqs4umxO0eMTQIwmN9FRAHd29E6
         bQaG1pLv/4btpDXTN8elqrnAratqkC3bWYW0c/WFUGH3qYmxLLSn7NabeBZLX1w/Arlr
         83gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701369513; x=1701974313;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=07QYxEgyoqmQ3Q1vq77DMefnw2mMccatpZsNXnEAueU=;
        b=vFC+A6XTRwpf7ZSwlt71miqbJsWjHZGFdThhOfQVRXjMdfWqxBFUUeYtGLXbSZ8Ey6
         J9HXWGRcPeQjGhNv3QXHvAR8ULIXMJVbFiYamsS4Z7BcQurNrErWt6V0co6KTyKd9BZm
         np6Kq2FOa8xN4dRlhpEklov73+JZnc6RoNulAnysTakDsX2sXbET0uwyR3eKEfpt1Rmc
         nAmMbjaoMFhGqKwdEFcP6pPsxaaPtPrIQFgK1VP4HxdhSXOgk2CYHhwZ2XwlWoFVrGcu
         W71F0pzzHcDnBHq+0+zsXmGHQ01z/sCvRgtInqQ+E8y94sjs9qDAxHxpL3SR8uygLduQ
         Q9Pw==
X-Gm-Message-State: AOJu0YxfZbtE17B4oc6WRS1BeNzkUa32ERhZcHjkuStFRn4n7KOC97VP
	yHsRdoZnXBgLMmi3/DrJlSWMVTyfYuAsFLf5512KnQ==
X-Google-Smtp-Source: AGHT+IH5RLOmJKYkkr8iZOW9SC+fCUJYFeQDas3VL1+GiBFExPCe+HsuOw/Ti2CQ542OzjVBSw5i4g==
X-Received: by 2002:a17:906:ca2:b0:9fe:3bb6:99fe with SMTP id k2-20020a1709060ca200b009fe3bb699femr80697ejh.2.1701367698155;
        Thu, 30 Nov 2023 10:08:18 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.109])
        by smtp.gmail.com with ESMTPSA id y16-20020a170906559000b009a1dbf55665sm926713ejp.161.2023.11.30.10.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 10:08:17 -0800 (PST)
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
Subject: [PATCH v2 3/3] ASoC: qcom: audioreach: Add 4 channel support
Date: Thu, 30 Nov 2023 19:07:58 +0100
Message-Id: <20231130180758.212172-3-krzysztof.kozlowski@linaro.org>
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

Add support four channel streams.  Map channel 3 and 4 to left/right
surround ("quad(side)" from ffmpeg standard channel list) to match what
is in qdsp6/q6dsp-common.c driver.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. Rebase to avoid duplicate code.

v1:
https://lore.kernel.org/alsa-devel/20231020084919.18628-1-krzysztof.kozlowski@linaro.org/

quad(side):
https://trac.ffmpeg.org/wiki/AudioChannelManipulation#Listchannelnamesandstandardchannellayouts
---
 sound/soc/qcom/qdsp6/audioreach.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index 5c7113d46b6f..5291deac0a0b 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -274,6 +274,11 @@ static void audioreach_set_channel_mapping(u8 *ch_map, int num_channels)
 	} else if (num_channels == 2) {
 		ch_map[0] =  PCM_CHANNEL_FL;
 		ch_map[1] =  PCM_CHANNEL_FR;
+	} else if (num_channels == 4) {
+		ch_map[0] =  PCM_CHANNEL_FL;
+		ch_map[1] =  PCM_CHANNEL_FR;
+		ch_map[2] =  PCM_CHANNEL_LS;
+		ch_map[3] =  PCM_CHANNEL_RS;
 	}
 }
 
@@ -843,6 +848,11 @@ static int audioreach_mfc_set_media_format(struct q6apm_graph *graph,
 	} else if (num_channels == 2) {
 		media_format->channel_mapping[0] = PCM_CHANNEL_FL;
 		media_format->channel_mapping[1] = PCM_CHANNEL_FR;
+	} else if (num_channels == 4) {
+		media_format->channel_mapping[0] = PCM_CHANNEL_FL;
+		media_format->channel_mapping[1] = PCM_CHANNEL_FR;
+		media_format->channel_mapping[2] = PCM_CHANNEL_LS;
+		media_format->channel_mapping[3] = PCM_CHANNEL_RS;
 	}
 
 	rc = q6apm_send_cmd_sync(graph->apm, pkt, 0);
@@ -1063,7 +1073,7 @@ static int audioreach_pcm_set_media_format(struct q6apm_graph *graph,
 	int rc, payload_size;
 	struct gpr_pkt *pkt;
 
-	if (num_channels > 2) {
+	if (num_channels > 4) {
 		dev_err(graph->dev, "Error: Invalid channels (%d)!\n", num_channels);
 		return -EINVAL;
 	}
@@ -1117,7 +1127,7 @@ static int audioreach_shmem_set_media_format(struct q6apm_graph *graph,
 	struct gpr_pkt *pkt;
 	void *p;
 
-	if (num_channels > 2) {
+	if (num_channels > 4) {
 		dev_err(graph->dev, "Error: Invalid channels (%d)!\n", num_channels);
 		return -EINVAL;
 	}
-- 
2.34.1

