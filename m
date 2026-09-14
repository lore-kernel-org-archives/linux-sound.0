Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F831422541
	for <linux-sound@vger.kernel.org>; Mon, 14 Sep 2026 09:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789379585; cv=none; b=gKwyd735ScUK2mNfHEjH+O02dCaz1LmJPUU/FnM7RY1osBJ7tbo7OEGSMS4Kwk+lQhXyjeZYlPP6iggNGtxeLISRRMxjfjURohZRNqTTL4VqGLGNErNV+4mfv9AssL+qGbpCveGn8wGVne3BgZ7aXng9/omQNCXQSFXUyOl3OXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789379585; c=relaxed/simple;
	bh=bbJxaZw0nqbXoP9Gq36ywZ6uqMw8KPddc4gTbU2zp5k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=azJRcDE0saHpNs2OQn8fEFTghRLi9wBP93UKhiQForjwQOMUrkewoO32W/SudniZ6P4GnHLF3moc1NAIF2OX0F+48hwwwoOBaEytrGlvlk0tnx5pBxW7Q321VwtoiaPTSrx0+9GUwwSC8rBg9+nixfa7a7GyhH7MmbGLFO9Fj84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UOES9j3l; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UOES9j3l"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2d715f4a587so43613455ad.2
        for <linux-sound@vger.kernel.org>; Mon, 14 Sep 2026 02:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789379583; x=1789984383; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Aj1vcWXrcKSXfio8K4yMPUPDskRmlK7J40zfCx4DedU=;
        b=UOES9j3lTK6hBJMf4IP8dPkvqtNWowWe/CSkhDEDr8RwGWsYwwjP7xjufXetmnGs1N
         fAMeZyFo2Rpt5XM4InSjc2uJ50TyKw2qHwwhHy2uN5BnqB4iy/JWv7x9mP1jRocqt+Zy
         HIjb88pKswIdKcMi/idkZm29j03PQbKX+B/k6VILcQp5DHyePPMavyVCGeskwKIUVdhO
         Y3gZ15D/Hyf2K3btZctZkRMkGz3lh9JbBUDa9jz1iFqoozQvITQPUZGXVxb/AtKDdX/s
         g9XV0cF9j0U6H1rYk8nh1vnTzJKPpwwFDC/u2RTw4MYmvPqNmr+CuMP0aRN+dB/mjhfx
         OvZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789379583; x=1789984383;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Aj1vcWXrcKSXfio8K4yMPUPDskRmlK7J40zfCx4DedU=;
        b=Wwj7/Hn7TfmHy+a0czMLZA/RrhYdhv0VHOWEwGE2lwhgfiCrpgJ1GG1ZneGtNWLmcl
         Dcw4PZO+EI4qPPTC2ASGM3Usb78N3+Hm6AK+/gcxhY/ivNVNbpsQ+l9wh9KE69vfZGHN
         gsQ/G5b2HkPqNzKOG1LzdLsmg+68rXuca3wz5mh1u/U1L+X9+n98swD1vn/KtD2qLl6Q
         iBXqRPVQPo79leNTo1UMNrCQrrPoGoD27GBywSAo83PsvvTdqbCYAj+7OpeVIVjY9gPs
         Q/nMX/7o+baarALTyA/ODqxPo2RkOrKzL/TisoebkEiCRwWI10wtjC2IIA7rY70+MKVp
         XYCQ==
X-Forwarded-Encrypted: i=1; AKwUvBwJmS4FPeGm4eKaYE6edz66uEF0PB3WfcpxEauL+HjZdpdVsZyNGqSdpWki2j0O/dFFljW/kAOaza8hhA==@vger.kernel.org
X-Gm-Message-State: AFuF++kyP8PW4cLB5Yj8Cvgt9FmD9Utmn7u6m2u6gpYtrKzV4Unnz2dq
	n0gfJKmw+BaBuoVhmclMkmHkJxSU3leFHX7PpqbGwXBNpmoVhzRW1RK/
X-Gm-Gg: AYBFou2vjxQGCg1HZea7pp6UHM8u+7wckYfNjw/T16rmzH4lmnbbGE2X7MUlDdG1EPd
	en/waHlTM3FviYI6V0Rpi8F+yRKxvJShCIRRccuPGiNkUlV/C0Vc4HDqwunCZjtUtX1clxiBilm
	tLSGsNSoyfxkPjavK8432L2PI1SCjvc+DNN4xuEkDFpWfxQAbLSpp+ISJbwSWRngkARWakPivY+
	5fHRCMF9QTUKPj9qV6oVCRj6RxGoEsDDiF8a3fxPH5tytxFLYjU17w4hgKyps2DA1lZ08Qg7DVk
	qBY8KRSO8ZO8vE7QdF0FUZZ5YoflA6ey9o3NNlACu48UtgXENInOKtUFcC/FUWiCsgBtYF3/1he
	7Ny0lTJkmkH18ZwfT/Y/+MoyiHQJd8WukP6ic9ewnPkL75O1p/pdpRrEIaXJ4IAb7MzYDj3uc9E
	pumlyArGMzXDk919jd3p9DJ3KWWKVTXDNhHuGzFqblznx1q+No2/sNz+pb/5mPSdlZRV5l32j4w
	X3npKnpwjFdkQhI+0bN7J0sOCOSKjPtmhECjqUMCjzGzBOgi8DtBTxvXax1NCF5FUZoIE4WPi2P
	2YqiltVrMMq7Ga42
X-Received: by 2002:a17:90b:1b01:b0:39d:e213:9dd3 with SMTP id 98e67ed59e1d1-39debf6cf03mr3857903a91.1.1789379583175;
        Mon, 14 Sep 2026 02:53:03 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d95091214sm21129174a91.3.2026.09.14.02.53.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 02:53:02 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	cassiogabrielcontato@gmail.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Cen Zhang <zzzccc427@gmail.com>,
	Yilin Zhang <yilinzhang@moonshot.ai>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH] ALSA: pcm: Simplify success check in snd_pcm_open_file()
Date: Mon, 14 Sep 2026 16:52:48 +0700
Message-ID: <20260914095248.33391-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

snd_pcm_open_file() returns zero on success and a negative error code
on failure. Use !err to check for a successful return instead of
checking for a non-negative value.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/core/pcm_native.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 62324282fcae..000e926a1e6a 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -2930,7 +2930,7 @@ static int snd_pcm_open(struct file *file, struct snd_pcm *pcm, int stream)
 	mutex_lock(&pcm->open_mutex);
 	while (1) {
 		err = snd_pcm_open_file(file, pcm, stream);
-		if (err >= 0)
+		if (!err)
 			break;
 		if (err == -EAGAIN) {
 			if (file->f_flags & O_NONBLOCK) {
-- 
2.43.0

