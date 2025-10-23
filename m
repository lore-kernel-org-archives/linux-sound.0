Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A66423D288
	for <linux-sound@vger.kernel.org>; Thu, 23 Oct 2025 07:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761203049; cv=none; b=J61I2q3VyvkPi79pGbmUpzVbTFibEcK3HjMRLJRQV/eAycrRlXA0/QIYH2zOiSpaRRtSuAHEQCmVnVLxxRrXQeuyIH+yDZx7ifZYDtcOFR69cUVFj0dWD6/OWdP3ci8sQ6yBJS5GwdbCn63r6Mb9CC4S9tZyiviFt7kusZLY5I8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761203049; c=relaxed/simple;
	bh=9/wG5C8tf2d4SlOGlsjpQmQI++ChscmD8P2cCyl0g+8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=c026pj8zQtIqYbc2eF6FDkm2fSx31NHwtrQKRQUnd9b+xkMxzc69pjxhX0WqemmpWX8HJxUj9RXsQMu8MFeK5cGz9rGBLNeVBmh7fCxam0jBH6jVxoZXAv40crjVgehaSnnLKEOsFiplSYHo5gNBo86jnBLWtG5Bd67peO0NAuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RY8N5/TE; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RY8N5/TE"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-46e6ba26c50so2981675e9.2
        for <linux-sound@vger.kernel.org>; Thu, 23 Oct 2025 00:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761203045; x=1761807845; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nRQn630rwgoGuh9EbUUNebeySQ4OLO3/MGfSPV3tXsw=;
        b=RY8N5/TEhdr4/G32G1KT7cnbb5aHhcdc9AfPX2+1nKmjIXBM17efsiOoCBX+voDVNB
         AZ5dBNSPap/F7ncytI0H2SWgsS4ODhZb1gIZT86VlxkkD9Ki0GhBUIDHgiy4hlyDRAwD
         YjSy3jZ2ByR2t0RhpP5nGhRRFFWEY4llXdS1kzFBzuyFhi4sAWZGDSoCvhcd1QiOZ1Aa
         hp9sVJZMLJysHxtW1xQ6e0HhLrHrIxMhvfMvUQae59ax3hlGxY4Q9Kq4t1ZTOXIgd+Nc
         Soc5kfgO46mdV6zQWRU9layC6x/Gvws1ObZsRvYiJ6fnZydvxVWBQk0qXYUUPwBUrn0v
         FsLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761203045; x=1761807845;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nRQn630rwgoGuh9EbUUNebeySQ4OLO3/MGfSPV3tXsw=;
        b=Zcyst0KxRtIZE7bXNagwvc4OoNoVTC8vXo23w1XahxDtaqQQrAofiKsErJ3q9q3Nab
         /s1NRpUKoj4LPbb+DF5Lsbzrcht9VgLwqvQXVe5r+EfoDz7PPC51qJWjnawQmibddOhf
         cF3EXqc0+7HPTLz0M9rWT1kpDxfRGd1Hcq2DgpnrQKwTKNlFkgGdYZBK/x98UH6Ue9qq
         i6fFX54Em7gL8FbD8G8dZ4/E2B5Y6mfAhtalT/3EFrNnejsuJsKVe0N5cMCAyxus5KLN
         qaBHNtC4FcrSZD2oWfRkS9SbdDM+4OIe5t5TmVB1wXKlzW4bd80QavRtJiO3fgJUrwf+
         HjpA==
X-Forwarded-Encrypted: i=1; AJvYcCWvHUAsuSF3RBWMGv9H25biDXhdLPxjexqzUGklfl66kRLJEPE87+ICJzJPpkV1uFmHbTxQAgLut4TnxA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8lTlyle1EVCNKeYvtzF1IGMGETRoOnfw8LoMmqzdpumn58rul
	eiVHMtTJwjXlRo/3/AcGPrbNqhjZel/kTYmL5SQ9heLGAnrr5txltwfWEsbqkN0t
X-Gm-Gg: ASbGncuYXBrGLvYLJvZEUaQRoCyqusnb+nPkxmvrdHi6C0VVOwUAOgHyCHqQz40Ribj
	azUGH3La4pxWlXUTvIggMtg6etcbGoBuBUqq0BHSHdq0DtYP5jRtV/uP0NK8mDcL2g+iMHpjniU
	de4xUQc51N+CMRSvj7T/YFPxAtq/P9YkPHgo8cF+/I9BixHUALxaaHn5rjNPdLQWb3mjSsOO1WN
	gR0bm4AUlDpklePGRwE0PXhFTgkuL2NCJH+EPL4djLD7qtTJrO+1oNE4irMIfvSucx9qxB+TD+V
	Qm7U1uTCNsFcGCcSq1UtJuwS93BYzthaZ9F2XT9gRhj+WqcKqx5BrkElxC15hYWA9VDYGjC3/yH
	svHV3mQeiFswOZproed6wAsF/25q7WyzqDId+s6IzkCNLjytVd69u/oMkH7OWTiz4Wn9iLmVkw2
	IdboY5tGXtfkvnBhcV7utM/qlZm5Z+NlBhsgdNXBCwIi7Y3IEzZIDsWQ==
X-Google-Smtp-Source: AGHT+IEE2jIbsK11fXUGnECvWop/d3uobF3Jp2J/r/Q3QogKJT3IBs8YQulCH5YAaWYBoFAlOVlSMg==
X-Received: by 2002:a05:600c:3b03:b0:471:14af:c715 with SMTP id 5b1f17b1804b1-47117874978mr169644785e9.3.1761203045265;
        Thu, 23 Oct 2025 00:04:05 -0700 (PDT)
Received: from sharique-Precision-3640-Tower.hw.mobotix.net ([213.183.84.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475cae924a1sm23347785e9.2.2025.10.23.00.04.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 00:04:04 -0700 (PDT)
From: Sharique Mohammad <sharq0406@gmail.com>
To: broonie@kernel.org
Cc: perex@perex.cz,
	linux-sound@vger.kernel.org,
	lgirdwood@gmail.com,
	Sharique Mohammad <sharq0406@gmail.com>
Subject: [PATCH 4/4] ASoC: max98090/91: fixing a space
Date: Thu, 23 Oct 2025 09:03:47 +0200
Message-Id: <20251023070347.1936838-1-sharq0406@gmail.com>
X-Mailer: git-send-email 2.30.5
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

removed an extra space

Signed-off-by: Sharique Mohammad <sharq0406@gmail.com>

---
 sound/soc/codecs/max98090.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/max98090.c b/sound/soc/codecs/max98090.c
index 03cc6e0fc88d..ef0c4f2ce1b2 100644
--- a/sound/soc/codecs/max98090.c
+++ b/sound/soc/codecs/max98090.c
@@ -2380,7 +2380,7 @@ static struct snd_soc_dai_driver max98090_dai = {
 		.rates = MAX98090_RATES,
 		.formats = MAX98090_FORMATS,
 	},
-	 .ops = &max98090_dai_ops,
+	.ops = &max98090_dai_ops,
 };
 
 static int max98090_probe(struct snd_soc_component *component)
-- 
2.30.5

