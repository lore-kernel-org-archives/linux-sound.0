Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1864455177
	for <linux-sound@vger.kernel.org>; Thu,  3 Sep 2026 11:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788434880; cv=none; b=IF1kOb1wKGSJsyyXRmG3GBYDOuffEWmtRscKJ1YiagkrRDlZ0KW3w6Y+YPfMoXoiIZglaJ19KXN8Zo/etcN/JJe3VLhqJYrfCxsUd5xGym9wUmUcDb4nVGncV1I5ECDBucpn2AyLTWoXmuHHn+vHy7/51E93IMSyPWo2vs3Y5Fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788434880; c=relaxed/simple;
	bh=6ZiigvaTWfMfxyXpdAmeZRNmql3dKQaEnwrRx6I6TCA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EWs2aZVIy4fbUOASTiNlfJgnVVyPCI7z3DLRrOhbGw7nTzOZ7kYGh2DJZj+lqP15gNJPbvFl5IexL40br4KF8YzOLT374lfTAXzjHB74nAhOq9NZqrHZNYQjg8daMmFNSYD8HsiozRuSD1Zc/PZPftulfol70gr5RTIJjEM5zvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=buu1OXg5; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="buu1OXg5"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-84e04df8c46so3186655b3a.2
        for <linux-sound@vger.kernel.org>; Thu, 03 Sep 2026 04:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788434876; x=1789039676; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LelVyfkIJElVaV96Bx2ole6PtnzRp3ZrnXJtU0M/fEY=;
        b=buu1OXg5sqBorZ6VY/VWFV+0Qs2OlKZEAgVY/ZXdbSmk3y2d3oi47rko9C+Pk3rK20
         uPHk8/ANEsBXFQiLCfUdlYpxC0W0Z6TBkB4tzbClJqzB2NwAj+/tuOX6utb7fNCAMrVh
         dz77fo78uT4gwlk5dhtWQAW/eeY97rjULYTFX3nwFaBDYAYJcTEeQ3SOL00BbY/2UQRF
         e8JPYrxAl3xqDMAHGluF6JnxYsp3EF4rGeRBklAJW5J3cYOwmXMUQ6NzW/G4XRQv4unG
         gRIynOtfkRMaFF8b9hLriB7gwK5SMWWAabq4++RLPJ+hnDvYOxeyCeon3CHbacyA4+s3
         F8YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788434876; x=1789039676;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LelVyfkIJElVaV96Bx2ole6PtnzRp3ZrnXJtU0M/fEY=;
        b=dpnpvLliRFSwBs/pVPoOh7GvxUfyL0cWbzNNO6lnbZXgUmkPwQI8pMGaXletQGKw6g
         v1xx7XX7ZQQNqiEl5f7b11AtBYatk1xirKzAZ3mbqdnuCKW+esBjlGbNl2MXodNSLyRy
         +jO+9NNgci6+TxaJDZCWpFXrMmO6O59+x/MhxvUkWRMqnkA5E0DOaEsWgsILHbhIGzs5
         /7H4dUqvge/EMFQJ+EcIluQxrQ8sWvCeaXHTyzAVhNlpbzw2ltpcgbRljEtNuFltRzZu
         4Rfx26v7h6A4nTz8TIPXGak6S2cexjGjCWuaWT9GQbLFKNI7j22su2MeMXEALD/aoOvQ
         iyRQ==
X-Forwarded-Encrypted: i=1; AKwUvByFRm75fZroGc9O83eEqafUezWjFWB/PfVn/Ra2in1nWL2kCakggWDscfPQ75yL1ixkTKnniNbJoATtIg==@vger.kernel.org
X-Gm-Message-State: AFuF++kdg+0E+5KuoL4p6bErNBY2LngVk7YkOw9iq2UBB2JoSI38OLq5
	HyFf9QPuNo8XnEBmK9wC0YKwnOsq+j38o+WT9gNniXIWmFWgDZryZRO5
X-Gm-Gg: AYBFou1EiR9v2Dj347cynsrBvLHAn/RdCkNpVo7pymJHZW3xeQewmFn3iOEaM/hsSzS
	1uBVDTkUWcl70IhdEKJsN+BmBn7oa7KVO8e6kFSyHhcdxf2VOYA3UwWQXfAuzuM4fuzdHe0/yxG
	WYvSnIKCchCeVctEl/0AX3w27aRGe4hFWOMrbazN4Af7IJgyOyEdSnXmYrSzrn8ZLkK7P4pclh+
	ZtjkiL/SbM5uJ/LIHGVtCxMkXhDLax6cjOcAGA9Qm9jq92hPuwVIwfKQZfYg+igpUcs/mFkQjuw
	O7NAU0yqaE3Dvas19wpKO5J5WBs0/JEP3mgLRQmlU3TdS8fA1KGk+kcbkOIeiN8CJg0UFJAzR2c
	4BY5kFMT4p6lbFMI17l72FQGvaAoT1/t+zgyIYM21I+aNibW25D6U/N7EiVYOYn5OMx0DtPAnTJ
	b+4yowpLGxxQs1BQdBkYSu5/u2SYqWCp6vknva4H++XEga++adsm3rgFRfMgO99l529x0VJhQMc
	e7/tOU9GFWpVkNZ7UNhgKiPxxMYNNL02pWYhLG4M5KdRQYWhC1XihmJ0dZtpvAIBzGy8DUrXbC4
	xLnlF0SDAdc6ThE=
X-Received: by 2002:a05:6a21:339f:b0:3b3:216b:2743 with SMTP id adf61e73a8af0-3d9afa068f5mr18626130637.4.1788434875933;
        Thu, 03 Sep 2026 04:27:55 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc43d467134sm856084a12.30.2026.09.03.04.27.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 04:27:55 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Sugar Zhang <sugar.zhang@rock-chips.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 1/2] ASoC: rockchip: rockchip_sai: Handle runtime PM resume failures in set_fmt
Date: Thu,  3 Sep 2026 18:27:38 +0700
Message-ID: <20260903112739.373621-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

rockchip_sai_set_fmt() calls pm_runtime_get_sync() before accessing
hardware registers, but ignores its return value.
If the runtime resume fails, the function continues to perform register
accesses while the device state is undefined.
Replace pm_runtime_get_sync() with pm_runtime_resume_and_get() and
return early on failure to avoid unpowered register accesses.

Fixes: cc78d1eaabad ("ASoC: rockchip: add Serial Audio Interface (SAI) driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/rockchip/rockchip_sai.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/rockchip/rockchip_sai.c b/sound/soc/rockchip/rockchip_sai.c
index 30b5e71d0937..264a99e618a5 100644
--- a/sound/soc/rockchip/rockchip_sai.c
+++ b/sound/soc/rockchip/rockchip_sai.c
@@ -487,7 +487,9 @@ static int rockchip_sai_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	unsigned long flags;
 	int ret = 0;
 
-	pm_runtime_get_sync(dai->dev);
+	ret = pm_runtime_resume_and_get(dai->dev);
+	if (ret)
+		return ret;
 
 	mask = SAI_CKR_MSS_MASK;
 	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
-- 
2.43.0

