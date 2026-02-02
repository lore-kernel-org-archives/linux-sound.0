Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9813309DDB
	for <linux-sound@vger.kernel.org>; Mon,  2 Feb 2026 20:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770065498; cv=none; b=tXBGA5LcivAqJKKPhC2ERTcvU/XRZLnhotqLKfaZSXQSk4K++SFWg+s3cTIzTc9zfjIc5198ru1AwxnAKpNhC1/RjhWJgFugK0CommUKKLUBVzrTSEoK3vJnjxMu8kJLFYIzaiHGnyCVOj+7OVHKO/HS+0z0rxGfhv0AugBR1yQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770065498; c=relaxed/simple;
	bh=lrPmflUSShnL5lchJT3ShCwXQw9pI+EV0fDG59ooVK4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dqaox1j1UixzPYmZnc5U8yuG658PD3bK8phyDgFVA9jTCs02on1AtzvbHuwN9g5u8gEwkRrNV3SIXuX5pn+RU2vOt5+Ke9KY37R75cu/RMGNZbhX3VCI818piofAMQEjWyr293EV9cI95McCtVp2pDuBi5/56K/NLZQCVMGGXeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XHXk9F1E; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XHXk9F1E"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48068127f00so41922165e9.3
        for <linux-sound@vger.kernel.org>; Mon, 02 Feb 2026 12:51:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770065495; x=1770670295; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XHuM2Ewu5I7ey2XjTq+VsEuqQQ+LLPFkgHvxvIjwNLQ=;
        b=XHXk9F1E8Qj7Je4dOdo2DfYEwEQXeb0NMBasxo7xjBh1yjYM7IPLwewN9oXNc8h3te
         rp2VEzyY7cEhsDLa32owwtubgsWv7zFtQsRT+34kfGPrniqPbePQwkYWhTLhxgE2FXVO
         UJYyM3c3OcY6QSE0Ec91Owt8tDXhjfHo4h+CfmI+7kfejHFys14Z0TPez0atgNxq3Oc5
         ti5G9DFQIBMnVja4wnuOQwStERMJMYYUk3o5GT3WIcRwAdjgtOMkHvGh6WtzSJ4eYvAd
         lfqy9VvRBoiTPer3oZqeB8Kav++wezwrZo8gdL8W3PmVTaUR/DaccqClSmnFBW397j53
         wilg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770065495; x=1770670295;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XHuM2Ewu5I7ey2XjTq+VsEuqQQ+LLPFkgHvxvIjwNLQ=;
        b=CKeuYSZp9tooUp7fpjL3Lr/+6l+gSoiVKIagyeT6mh1+XrPxKPZYqWdzttLoGfMt/Z
         cu7ByJc2I1KR79gEZT9rfUZcmjkNffSc6RgA6lOrNQVkauw9b88kCTWDs0io0j9HOpRw
         BgQVHbiR2gRX0ZCIbh6Qf6AhS9zvnnkOEuOL7skJyM7ulBkizhf+f2mNO9qWHjOcTmcP
         SwlS8rflWFwdPRXN70019MwbET8mba9Ho97SHlfbhqn+NmfEIb8/T4x7oUB5u1Sc+I4o
         5M9s7aWspsjEGwU8IZro6xaMAM1T2VVo13kyTa60rnxQt24js8oW+7cCm1aRtlqNrW8D
         GtrQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5C2nlDRAiK47BntrAZ4pT4Fpan9yiAHDnZhAzR8P2f6uhBuBiKrpL+oKzqyqt/PsL7kyNxD/4Zue27A==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywiu0kI22zKhRRezw3/Qc/iK022F6OHl8S3ZQSa2B/Yz+uS46qo
	VSYMcLI/1J4OAJ1bS9tluzp17xEdGRxMhnHgIFfmVLqlzqy3556ICiE0
X-Gm-Gg: AZuq6aJu4nN6tne81m4wiIzeLviecIXjWs1g/0oZ8eh33gH1CEqPlTjlXUPULU0PTJ9
	Kx7S67uvRyq30ydsdNb+djuwCxFICkn3XWREgtgKOzfn5/VVO+RvziM3EYwNxIYdWA3XmaQJX+I
	a7w5DUtmjnVkNGoy+OWCGplay3u2g0iYx4qUBvt5AgPQpKWyKrRvrPPPVIIEorehSdo2NBff3qt
	N5hjSj6vPrLtr2Giv4Pw8torjX1xAHR1wl1Ms7BrAi7ti03XZ4TVBLpk/YNTyv+pKT7CEc8Yk5x
	+/9YyULLzg7U/tggAig+RyE0Nd0CpIo0UoJIZY4jZtm6dKtiNHjhcOTXjPgI6l9/BcQL3Jy9Egx
	NGV5CKHHueBhASZRDtK5znIyOzSL/koiqh0ewh/Fo7KMYizojsjoSEMBEZLCii04en6q2pz+6m/
	Iy6ZI/gt6HIkfBpYi3c0A43yxd2LE=
X-Received: by 2002:a05:600c:8b27:b0:479:1348:c614 with SMTP id 5b1f17b1804b1-482db4997c7mr154604565e9.26.1770065495001;
        Mon, 02 Feb 2026 12:51:35 -0800 (PST)
Received: from debian.powerhub ([2a0a:ef40:e94:5d01:a218:5589:9f9c:4f52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4830512d634sm20815865e9.8.2026.02.02.12.51.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 12:51:34 -0800 (PST)
From: Chris Bainbridge <chris.bainbridge@gmail.com>
To: broonie@kernel.org
Cc: linux-kernel@vger.kernel.org,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	Vijendar.Mukunda@amd.com,
	pierre-louis.bossart@linux.intel.com,
	Chris Bainbridge <chris.bainbridge@gmail.com>
Subject: [PATCH] ASoC: amd: fix memory leak in acp3x pdm dma ops
Date: Mon,  2 Feb 2026 20:50:33 +0000
Message-ID: <20260202205034.7697-1-chris.bainbridge@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes: 4a767b1d039a8 ("ASoC: amd: add acp3x pdm driver dma ops")
Signed-off-by: Chris Bainbridge <chris.bainbridge@gmail.com>
---
 sound/soc/amd/renoir/acp3x-pdm-dma.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/amd/renoir/acp3x-pdm-dma.c b/sound/soc/amd/renoir/acp3x-pdm-dma.c
index 95ac8c680037..a560d06097d5 100644
--- a/sound/soc/amd/renoir/acp3x-pdm-dma.c
+++ b/sound/soc/amd/renoir/acp3x-pdm-dma.c
@@ -301,9 +301,11 @@ static int acp_pdm_dma_close(struct snd_soc_component *component,
 			     struct snd_pcm_substream *substream)
 {
 	struct pdm_dev_data *adata = dev_get_drvdata(component->dev);
+	struct pdm_stream_instance *rtd = substream->runtime->private_data;
 
 	disable_pdm_interrupts(adata->acp_base);
 	adata->capture_stream = NULL;
+	kfree(rtd);
 	return 0;
 }
 
-- 
2.47.3

