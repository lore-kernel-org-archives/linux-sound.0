Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A630175551
	for <linux-sound@vger.kernel.org>; Tue, 30 Apr 2024 14:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714486189; cv=none; b=ATvocmWIFJ+XAsNVXkwvVEvDMw8jyVWocYlexFU5Qr+GgjPWNSp/Wt9pw9cAcdnTX69BBgHgDb87XSBgjuo+/W0dLRTdpx02TGqDFtyZrVTDTxZnwQAZkc2f4lVrBlfgQQVysAakXYf1fr9JFSclQP2FZUisTP7Di5UidNk7dig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714486189; c=relaxed/simple;
	bh=H0WsvqNTNFr7LXN1miq+Dc39F6X1tipdPUEwPS+odes=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AgaA90swgMwolZzKd0D9d5HsUUOfKxcor5xdQ3OD+SvSQN8nnMn/j+otLCgS+JMyCvU5bcP+u0+lEFIYsCzEsibeiBjjKjFHnCg3bMYle3NWqcOhg+NmsKrQq6MEesNNY0d5j0uDUFU/0PICILfpoGACoOjXehWEHAAD1cuY0xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Vy0gf/uC; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Vy0gf/uC"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-56c5d05128dso5188672a12.0
        for <linux-sound@vger.kernel.org>; Tue, 30 Apr 2024 07:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714486185; x=1715090985; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2Nsi+kUuVlRwO+YscLsuVmpvv08E0sHrgn4SKq3ugFM=;
        b=Vy0gf/uCQQNMY5LLcLc0s/sAyGwjc8uF8nN/dKcpiINfVxJWqZTZ2hf4ZNaelIEmHv
         pklWqDJ07V2BTfnI1giEIA7OV5fCPnki633c/J6fzG/puQeU9HtNjbPH2bGmdhGXkbPc
         a9LqLgdcsK27aEp5ZLeR30jD4HWPyeVmdAqpuLIM9d0wLHYiDs+bJJFl37/7doawo7ZF
         X7d6hBN6OJtp1IEH8RpmoYaHY4Bc838JexYVpIlsMt+ima09UMV0zKif4yJIGikWRX3q
         4FWKdUZgD7qO5ZpuItY1VhvHx6Tr4+NvmMLo9/b/iQEgh0J4aFcRahJPpQ10DCZS+baM
         Fqxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714486185; x=1715090985;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2Nsi+kUuVlRwO+YscLsuVmpvv08E0sHrgn4SKq3ugFM=;
        b=TVKSNJpYA9TwhA15p3/2yfG1+16mReWH2qzeS3lYcac42yR59+D2VcfvcMcpQdWFyr
         LAUM4ojwecTy6TNkqydh04WpemMSjcJtyfKnaEZxHVNDSpVSN2+3HBQwwKEoygUNXs9N
         YYF4bFID7L99C+XddldlqvgX2HQaqDCt9ZfJV+X1nq4cyOkc7QeDiVj14Hjzb0Y0xrBu
         8N2gV1L4NosjdW9F2VAPoxWc+uZAa9cfsFEvwm7j0jZCO7qfojKbdiwEYWovp3azJYT/
         s+tq6BoNdhu3KyIH0ERoVMAUOtpY2lEgIWITFS0NzUWpJ5wB9dR/U6c0sA7s4MqQIhbX
         EQkA==
X-Forwarded-Encrypted: i=1; AJvYcCVElUwUawGUzCL3oR4Pgjb/vkhwxlfOzSsayP4DaDAsDNW66SM2AI3OeRkKpsNj+iXsS5ZiECxhX+wmS5seiRRcBoZg9UrBaBAYSso=
X-Gm-Message-State: AOJu0Yz/U0MkWrLkfNmHzgVDfTLr5dtYvhc75X84+9SELd2fu4fqa/2X
	6pxlBzNcGYj7A52IXrl0K4UoUVlHGXWYuPOWH3XXXZ9THZR+WCoX1usN24jcYHw=
X-Google-Smtp-Source: AGHT+IFuH8UYbDq0eMy7k1NlmKVhLCy/QuY8vFKH9q5oSoeR+NsuI6ndua2QXKK/R5zCiNJG8FrWhQ==
X-Received: by 2002:a17:906:4a8d:b0:a59:40b8:e235 with SMTP id x13-20020a1709064a8d00b00a5940b8e235mr71722eju.71.1714486185598;
        Tue, 30 Apr 2024 07:09:45 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id a14-20020a1709062b0e00b00a58bcb55704sm6050092ejg.165.2024.04.30.07.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 07:09:45 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] ASoC: use inline function for type safety in snd_soc_substream_to_rtd()
Date: Tue, 30 Apr 2024 16:09:38 +0200
Message-ID: <20240430140938.328088-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A common pattern in sound drivers is getting 'struct snd_soc_pcm_runtime'
from 'struct snd_pcm_substream' opaque pointer private_data field with
snd_soc_substream_to_rtd().  However 'private_data' appears in several
other structures as well, including 'struct snd_compr_stream'.  The
field might not hold the same type for every structure, although seems
the case at least for 'struct snd_compr_stream', so code can easily make
a mistake by using macro for wrong structures.

Switch from macro to inline function, so such mistake will be build-time
detectable.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 include/sound/soc.h | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 2a1b6c198547..cacaa92487a0 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -1215,8 +1215,12 @@ struct snd_soc_pcm_runtime {
 /* see soc_new_pcm_runtime()  */
 #define snd_soc_rtd_to_cpu(rtd, n)   (rtd)->dais[n]
 #define snd_soc_rtd_to_codec(rtd, n) (rtd)->dais[n + (rtd)->dai_link->num_cpus]
-#define snd_soc_substream_to_rtd(substream) \
-	(struct snd_soc_pcm_runtime *)snd_pcm_substream_chip(substream)
+
+static inline struct snd_soc_pcm_runtime *
+snd_soc_substream_to_rtd(const struct snd_pcm_substream *substream)
+{
+	return substream->private_data;
+}
 
 #define for_each_rtd_components(rtd, i, component)			\
 	for ((i) = 0, component = NULL;					\
-- 
2.43.0

