Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iho0R8V4"
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57D9CA7
	for <linux-sound@vger.kernel.org>; Mon,  4 Dec 2023 04:47:42 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-54b545ec229so5609808a12.0
        for <linux-sound@vger.kernel.org>; Mon, 04 Dec 2023 04:47:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701694061; x=1702298861; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/S3g4FV/iGDfW3ps7M4rheJELxKDhQrVaKwMBGZuxiY=;
        b=iho0R8V4dHCjwJmpDKGNd5AnLXsuvWNnn7+xJ3iFTKtPHQA0wSzH3ruu6r3tza5vA0
         wRhZEx9cRYqWrkECLQP4JOpCBe4z4YaqaJUs+Z+/w7AQ6nOk5JcR6xBAKuR9F8Zsbw9B
         MU7M1fyjqrvTjMSoaXz34oxsIlLo7nMapygMfAN4C95khaSvjAjBDxlwm8ylfWSF6tZJ
         oW/GQ3Qmj2MixJKgBXGweRL5Bmqtj7+T3aWIoehcfzF0OU2rK0Ow51cfCl9+SAiz7P5K
         SAopvEq//xEOhNg/o6QxQDxqwhb99N+TIUcg1SzXACP0Q8Rzz6XaC/Ok/0Ye/lhSmcOu
         8A9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701694061; x=1702298861;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/S3g4FV/iGDfW3ps7M4rheJELxKDhQrVaKwMBGZuxiY=;
        b=qra7nrPhWIUcCR7gf+n/1bdmO7MntI/t0hPzg2Uygz81msLSwwrL9Qi0A6xY8u1wwz
         qwazRgOPiI7iys3f279fUDfIbgHkVhsr7sJDHwYhamHZEWUN3y5p4+R3RHLV6ut4Vtch
         hOcQqQx1gmQp32tf580q+B8b5L0adRqAmJE0llFtyrS3OoVCZqAjqOGfbXDAf2POFrQC
         fp2u7MeQBpPn3KsCnaFpePgmF1J6xLKlQJi1tFMuitJtNkITt1OZ17Aqz7rVVGLDdDPu
         pgS8cedjNUylk0XLy56pTTTWh00WN5xgqKqJlORypeZWU2yJLsJrKprZAZhDaOv63Yaz
         g4QA==
X-Gm-Message-State: AOJu0Yyhu0ux2801L0+toTupSj2atFl57XnxqLJEYhzsX4CGXMmHrhbl
	FPm8Q6lkW/LOmoIgsmd8Zob7QA==
X-Google-Smtp-Source: AGHT+IF7lYKcq8TAJsw65A/PZFXqqONqGeNcKTt6yJrGmPFcJBo/4G1hXhQpgMC4aF1Y++2UOozUiA==
X-Received: by 2002:a50:d799:0:b0:54c:4837:a665 with SMTP id w25-20020a50d799000000b0054c4837a665mr2965090edi.82.1701694060814;
        Mon, 04 Dec 2023 04:47:40 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id dc15-20020a056402310f00b0054ced65bd26sm457017edb.41.2023.12.04.04.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 04:47:40 -0800 (PST)
From: srinivas.kandagatla@linaro.org
To: broonie@kernel.org,
	alsa-devel@alsa-project.org
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	johan+linaro@kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 0/2] ASoC: qcom: Limit Digital gains on speaker
Date: Mon,  4 Dec 2023 12:47:34 +0000
Message-Id: <20231204124736.132185-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

Limit the speaker digital gains to 0dB so that the users will not damage them.
Currently there is a limit in UCM, but this does not stop the user form
changing the digital gains from command line. So limit this in driver
which makes the speakers more safer without active speaker protection in
place.

Apart from this there is also a range check fix in snd_soc_limit_volume
to allow setting this limit correctly.

Tested on Lenovo X13s.

Srinivas Kandagatla (2):
  ASoC: ops: add correct range check for limiting volume
  ASoC: qcom: sc8280xp: Limit speaker digital volumes

 sound/soc/qcom/sc8280xp.c | 17 +++++++++++++++++
 sound/soc/soc-ops.c       |  2 +-
 2 files changed, 18 insertions(+), 1 deletion(-)

-- 
2.25.1

