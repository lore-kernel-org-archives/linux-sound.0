Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B1A4125B2
	for <linux-sound@vger.kernel.org>; Thu, 19 Mar 2026 12:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773924344; cv=none; b=ORrOWlmmu0ik0Qfitx8Be6oE4tsvGNm7TVhdH/fJLUBdBKOEv1empHnJamHqrUvXioeAj/9GOEgBFUpr5Tx/tpL8lzfNYogoSf0TIkqbsUTXCMC3r2KDiGB0JqarBom5ldEyKNFDnbPkpXZB3DOxeLjz4n+X4yXLtF6RhiBxMWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773924344; c=relaxed/simple;
	bh=npgzio354QTzjj1JltRq6t13HnCw5LVC4NF6FChWmgk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WTd2oRR7OeMmvTLT52Ik3f1w4eK0BIMHG5TuEIoQR/4Ah/x8/PZoCkWhIdWgm5GU29wkGuu1t99NzaQycoihaoSZ5CqPiJZoafE4oxejYIs7+clT1pxrDHt0I4ckb5mH6vS7slt0jnyQ64kV5QM6+pI6Ne87hfm6L+z97E/Yg+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=z5PlNb08; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="z5PlNb08"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-486fd5360d4so2731045e9.1
        for <linux-sound@vger.kernel.org>; Thu, 19 Mar 2026 05:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773924341; x=1774529141; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e0BGsXiMwsYOAMmQzfEaNUBl8dGwTDCeUrjR1vlk/xE=;
        b=z5PlNb08YsG19/jtTSqxE5iljvMf/S1HiSncxmQz7aJ3yLF8/ljTtCRbizSy24uHa/
         Y37SC5FbsrqY+VPW0EzP9veTvyfhrR4I6cuvbZo5MNx1bTff/TZT0tXI8VVaWwQ7M6h8
         kGkrTTdGOnaaJVAXK7HA54kpbUnTCoNRTorJKHRj2xYh2tllxrM1EbZlzHXKwI+7eJ7L
         PJ6ednjYsWr4MOHu/rxphp/56ptA3yOAa6Hkd/As6/nwxA09IRsvNBowxrVgypl7qkr7
         irGPmm7YFUZWM+SlL/qd3LdmzTRbsOalrAYFcSs4Jd1c683QLW16nQRbYW77BVrvxt90
         5dAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773924341; x=1774529141;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e0BGsXiMwsYOAMmQzfEaNUBl8dGwTDCeUrjR1vlk/xE=;
        b=JtMaqFZWkMEUtnmSrjr5wCiLz1Om4PAPVVSdydP0KkTWjcBzxsk0zFTwTPeucvK8rG
         WVD7Vryw8eONLDJHS204rDkhZp1qHKpO2f7T2CoJ+KCrv/qO72nCQFtVUjo1sEPPgPnb
         mlK7Y1jDpOXw8g/UEPXpkqfQrwGJT0I2F6hzzGpAe4M1CYwSm0/nEu/WSg83+/cFIz9o
         XQ4At9gYkdK92YPX91iu+hGO6B8uOv8BuMenZc1lu7Q753peINegZELeuq7OyMRX4DyH
         3uEDDwYreJCHRRSlJXHvhExD2uw5zvzHtGx2snSy88mSnte9djH1DWizMfQ2gNYkMLYQ
         Npjw==
X-Forwarded-Encrypted: i=1; AJvYcCXD1nyLSJeNucBX7amNyvQkNK09v8SjaKgiyT08CPlfpf6ASHV7fJrlnDb0VVzs1Goa7dntQ9BDacBhhA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywx5hhkEEcRS+eRuMKrgqLP+Ov3LhlPrcGeJdl50nRZOh5mKqS3
	IXNlAsipGn03JGWrVvbgXmp9PULQh0fd8+GtCasuInkUwU1CFM87dv+WoT2FdhRYHZA5XunbkaG
	eTu8=
X-Gm-Gg: ATEYQzwCbV9dpgC1dPcmvDJMswn9Z7iQYjFoI7NnWhFLSoOtyICylS2yhGTdbL4W9Uc
	Ze8lAHm6HqNtGOeFkkFxNQSozsC56vqyoAtFzTmT4TSYx7nbL2a/r19ttoAluQkXTIDruNvupKk
	A7Z6AoJH9kgBLKiEjWZpCN1wpPIPjqyRaylGykUvLzo7LN/AGpAnc2Jg6oE7iL7Ij6pJnGNEsRm
	i1IkAWxLNEdhxOjL1Oo6SAb6TCwDtclC0s56b+0WuLepJ/N5cKWr4fVDFROkg55UuG14zQ/RUF7
	tprtf3PfksMwJJOujxDr3hTlOuVRDuKowE8hU9iKYDFeYo3ilunMZ3sfv0lKWDsWo7S3x620Tu8
	zGwphxUL0kRLajWsS+Kvl40l/d5ThgMRxyBph+DG8DqE9YaHptf75Dd3hQyBu273dJxJ7K9Cd4i
	mLpnkkfDM7yd7O78OP1dU0Uw+Kv0Rdkj8srmIU+kb9geRIlfU4NcQdvy6eFhtU1EBNNM1fTIoL8
	1Y9T1fFfswJZh1tEE6w+40=
X-Received: by 2002:a05:600c:3e0e:b0:485:4eaf:eb14 with SMTP id 5b1f17b1804b1-486f4475054mr111302185e9.21.1773924341468;
        Thu, 19 Mar 2026 05:45:41 -0700 (PDT)
Received: from pickles.copeland.me.uk ([149.40.2.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fd9845a2sm19249455e9.6.2026.03.19.05.45.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 05:45:41 -0700 (PDT)
From: Ben Copeland <ben.copeland@linaro.org>
To: Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shuah Khan <shuah@kernel.org>
Cc: Ivan Orlov <ivan.orlov0322@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Anders Roxell <anders.roxell@linaro.org>,
	linux-sound@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ben Copeland <ben.copeland@linaro.org>
Subject: [PATCH] selftests: ALSA: Skip utimer test when CONFIG_SND_UTIMER is not enabled
Date: Thu, 19 Mar 2026 12:45:21 +0000
Message-ID: <20260319124521.191491-1-ben.copeland@linaro.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The timer_f.utimer test hard-fails with ASSERT_EQ when
SNDRV_TIMER_IOCTL_CREATE returns -1 on kernels without
CONFIG_SND_UTIMER. This causes the entire alsa kselftest suite to
report a failure rather than skipping the unsupported test.

When CONFIG_SND_UTIMER is not enabled, the ioctl is not recognised and
the kernel returns -ENOTTY. If the timer device or subdevice does not
exist, -ENXIO is returned. Skip the test in both cases, but still fail
on any other unexpected error.

Suggested-by: Mark Brown <broonie@kernel.org>
Link: https://lore.kernel.org/linux-kselftest/0e9c25d3-efbd-433b-9fb1-0923010101b9@stanley.mountain/
Signed-off-by: Ben Copeland <ben.copeland@linaro.org>
---
 tools/testing/selftests/alsa/utimer-test.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/alsa/utimer-test.c b/tools/testing/selftests/alsa/utimer-test.c
index d221972cd8fb..1a9ff010cb11 100644
--- a/tools/testing/selftests/alsa/utimer-test.c
+++ b/tools/testing/selftests/alsa/utimer-test.c
@@ -15,6 +15,7 @@
 #include <stdlib.h>
 #include <pthread.h>
 #include <string.h>
+#include <errno.h>
 
 #define FRAME_RATE 8000
 #define PERIOD_SIZE 4410
@@ -52,7 +53,14 @@ FIXTURE_SETUP(timer_f) {
 	timer_dev_fd = open("/dev/snd/timer", O_RDONLY);
 	ASSERT_GE(timer_dev_fd, 0);
 
-	ASSERT_EQ(ioctl(timer_dev_fd, SNDRV_TIMER_IOCTL_CREATE, self->utimer_info), 0);
+	if (ioctl(timer_dev_fd, SNDRV_TIMER_IOCTL_CREATE, self->utimer_info) < 0) {
+		int err = errno;
+
+		close(timer_dev_fd);
+		if (err == ENOTTY || err == ENXIO)
+			SKIP(return, "CONFIG_SND_UTIMER not enabled");
+		ASSERT_EQ(err, 0);
+	}
 	ASSERT_GE(self->utimer_info->fd, 0);
 
 	close(timer_dev_fd);
-- 
2.53.0

