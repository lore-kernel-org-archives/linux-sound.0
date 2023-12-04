Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oaxeCEda"
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 863A59C
	for <linux-sound@vger.kernel.org>; Mon,  4 Dec 2023 04:47:43 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-54c846da5e9so1632562a12.3
        for <linux-sound@vger.kernel.org>; Mon, 04 Dec 2023 04:47:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701694062; x=1702298862; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ziVbN5ZTP69p6FxRTQ/DrNWjlcr9menHHHhzgnVhU0=;
        b=oaxeCEdai59i2UFpX60wj06AWKEDDInfc+sS6P/buF+nKMxpHtCcGsOvMzr3t1DVUi
         mx/PEgtgzSoMLJ+jeVRDBWCtDE9+tDmstiWpi2EfTb9j4miy5OSmpBx6X2AWbjKqNpWG
         ZbM8OODMkuvE5yNutRRs9NvBm8q9OKyrcVDVDeOGYfxyT5y1UIjFPz4ZNackzTc7qXW8
         adS4yOJMxN8BcmpoaPlrdEDnMWN+aVy2QZdTDccTFWI+PSGXm5mehX3NqXrNLn/QJxZ2
         lwUsAZcuZ7W4YjdVuIkaA7/BtDoO6sOFa0VrjKuDZRauepryWj86Hqn/BailDq+8A154
         0Avw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701694062; x=1702298862;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+ziVbN5ZTP69p6FxRTQ/DrNWjlcr9menHHHhzgnVhU0=;
        b=MLIBC8Jt7H3N7aGAEvTa0QtsPUpfgyakvId2vfatr71ukazy5lnZs4Xr51ZrEKL7Ie
         VxBfyA4wG0U88XcifCk+XYbdxFZifYrqxgh9WQoCA+81t50Il4YWS/JIQ/rtCZNuPaVz
         wtDhSCVtXvK8/Gp0x1aXBH8RhcbBfaF5fyV1bYJcZFJCdhVgHBM9zxfry4XhlGdl8yWO
         UtFPI6Ioq2BWyASv3WnTKjHTXWxAo9T3oUI8tRdrs2y7fcGW8lYwMcnvPGsN6RCsfBdi
         vvDVO5KCHvCotK3K85pP2535U343Zv5XxVRKB8bk9vRirR1+tnjR/mJmvu1Yx7EyP6zU
         8B8A==
X-Gm-Message-State: AOJu0YwPiJS3OcBgOGAY6I7vBLlahHiip7lhY2pEQ2rgqTEQA9txPmkv
	thBfpFSTKpQAVrXnbE0MM+ue1w==
X-Google-Smtp-Source: AGHT+IHApXDdpr226FRyb9j61M1tzyPuEc1Ds/nq5f9VgF00NIL9sLCBQAy4dDG6sIZWA3NbhrjkNA==
X-Received: by 2002:a50:d59a:0:b0:54c:4837:903c with SMTP id v26-20020a50d59a000000b0054c4837903cmr3836618edi.52.1701694062023;
        Mon, 04 Dec 2023 04:47:42 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id dc15-20020a056402310f00b0054ced65bd26sm457017edb.41.2023.12.04.04.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 04:47:41 -0800 (PST)
From: srinivas.kandagatla@linaro.org
To: broonie@kernel.org,
	alsa-devel@alsa-project.org
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	johan+linaro@kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 1/2] ASoC: ops: add correct range check for limiting volume
Date: Mon,  4 Dec 2023 12:47:35 +0000
Message-Id: <20231204124736.132185-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231204124736.132185-1-srinivas.kandagatla@linaro.org>
References: <20231204124736.132185-1-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

Volume can have ranges that start with negative values, ex: -84dB to
+40dB. Apply correct range check in snd_soc_limit_volume before setting
the platform_max. Without this patch, for example setting a 0dB limit on
a volume range of -84dB to +40dB would fail.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/soc-ops.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/soc-ops.c b/sound/soc/soc-ops.c
index 55b009d3c681..2d25748ca706 100644
--- a/sound/soc/soc-ops.c
+++ b/sound/soc/soc-ops.c
@@ -661,7 +661,7 @@ int snd_soc_limit_volume(struct snd_soc_card *card,
 	kctl = snd_soc_card_get_kcontrol(card, name);
 	if (kctl) {
 		struct soc_mixer_control *mc = (struct soc_mixer_control *)kctl->private_value;
-		if (max <= mc->max) {
+		if (max <= mc->max - mc->min) {
 			mc->platform_max = max;
 			ret = 0;
 		}
-- 
2.25.1

