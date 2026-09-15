Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C6D63DFC6D
	for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 08:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789461882; cv=none; b=Bqs3EtHerhYkz5O2Nds74nBbd3g04BBjAu4pESOm0PtmiJhEzciuI+Vbo3BEraXoXQ3TiApk+jKCfxiZ1nyO/+P1HW+m2+gjtXHSBQTKAYpMW8sPtSjq5XdgnjQOA3tpvztEwwfhoMfyDFbjQZekv1fhtgnwD2A5mNsJ2Fem+Cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789461882; c=relaxed/simple;
	bh=RJ7NyXIgAY2k+Qq8wg3GdjnBGDCjLOJYLLeRxLlYiMU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uRhqWyy6S7rYFNJmmXS93bYU4j/vtMIZdXYGgYD/sDRKCl1KGs8pqygc0meXKmvL6zMtB4wc2OT0x5YM6pmV0m6IL51o6z7QpxMx4Waiiapqc+ScrqaP25i2Bz9/uQbFiN9kkpr7fUgAWrEzEgjRcqI4S7W0WyyfF444IBWC5fY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gLv2Kmtc; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gLv2Kmtc"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39b2ad83dc6so3071174a91.0
        for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 01:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789461881; x=1790066681; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d0a2co2ZVWH38/vm2oqn2WALPT6cpKDc3QBizBjbTyI=;
        b=gLv2Kmtcy1fsUG13+jGkCGtXUAigX84yvNai6PDVNacfFKChcEHLm4fV1qteVM++M5
         uCpOo6IOzud5fEVNutuDCF0Mt8HQYW2g1tdUz4gT0bOElw7f7FQKWtV3TlLH47Zvjq4w
         5ejAjIXop8qmZnUzeryHYuqtay8rdhmGJzMHrcq6PBXSLAeOGAp+SPGhihjkaUEVigYt
         SWOcN2TPOIztuoXohvBXLqgsC+QNm2FTmLsy6b4RwUQXg/y/Y6+yc/7n9TJw6WXU/30h
         5pSald2rzhO704JFrBevLJIAieif15xR7ifVbQhnriI8uqtiesBs/KXUoiVykqZ4eDJe
         OQmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789461881; x=1790066681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=d0a2co2ZVWH38/vm2oqn2WALPT6cpKDc3QBizBjbTyI=;
        b=VGbt/IKCy/NmSUhDC4/6IQOuhFtkiOiiv3/cGcC6/0p7JOLy3HzBOqiEOfq9mdZFDh
         htVkCvhnudqri/+fNWEUTA7b9O0whPIaC5nW98MwFIcDQJeGqgTiYtPfEJT0xNFwbOxW
         G6LxdLgKCqO8bTVsAoARvGsJC40/sfKNX9Y9VPEPYWhO+p0wa6dgQvpQ8vOcqPz78gGk
         4UXTrn2ObnG0qa3qYGl6g29Ur52hLXMNZGs2G6nkMwMbKx+tgl/SfYV5x8aQ0FbeSYeQ
         DTmWzp6kvIswLbT0HzxI4GZjZZ3UdALZOncQJ00Mh1+PRHynOsQvVbXfJuQqs3s41/ZX
         KDgg==
X-Gm-Message-State: AFuF++nn++tOv30P3FKGDxktwCnAjH88LKrUeyq0PUT+qMZ3Qv54UxqH
	Jbj2oYWrfyarUo1lQIkmsf0X6XizJk/m1buvtW3kDLD+H6l3McMOLbiQ
X-Gm-Gg: AYBFou1AFQJxkgYf27tx1zq0XGUAlYlzOdzgKaPWSv6QrdJk9yGBYhkb4e70Gwas9Cn
	jflZpk/FKGNxyzWtKCCsXmScBK1ZK61x0ueZaft+jIcDVfz29wmDVOMtCWADRlAxh4WMjw7iM10
	FJPwCq1ICTJ39rRzx4gKUpxBtJbJI/DS18tZWROyRG4NmJ+DCf+8l4XsD9ZyJ23h+Gmmv4/6aAr
	ZD83emViD3oXXjvtrOCRlc7YLe7gECU1oPl9Jaky5oiYJIMPFLT32dUBp8R7Lc6dqGTi+oOEBMO
	3wfVRJ9r4Wk/zfGalVNqEfQA3Sg+B0QX3DguQK7VxgU6NZZaXg54EHcGVDGcbqxBouEZvEaue2H
	NYTAxme27xdPD5GbhxiDp0TVEUr88VKXqQ35eeJNtF1XY0rDb4U4W9NVRxdHexiCBhdVG/moSsL
	XKo4aDwB9u5++s7inFoJUysmgRwndQ+p8i0Ti8BE86Gu0GtFtdEABLQR6WsZ89G2bMsjbDYQ3mE
	7skYU07MWPyc1k3lRg/stKcrTw=
X-Received: by 2002:a17:90b:3b92:b0:392:ca3b:370a with SMTP id 98e67ed59e1d1-39debf6b6dbmr12362587a91.2.1789461881008;
        Tue, 15 Sep 2026 01:44:41 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4cf72dbsm34718935eec.3.2026.09.15.01.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:44:40 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Clemens Ladisch <clemens@ladisch.de>
Subject: [PATCH v2 04/23] ALSA: i2c: fix typos in comments
Date: Tue, 15 Sep 2026 14:14:05 +0530
Message-ID: <20260915084424.1007757-5-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260915084424.1007757-1-hemanth.selam@gmail.com>
References: <20260915084424.1007757-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct spelling mistakes in comments. No functional change.

Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 sound/i2c/other/ak4113.c      | 2 +-
 sound/i2c/other/ak4114.c      | 2 +-
 sound/i2c/other/ak4xxx-adda.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/i2c/other/ak4113.c b/sound/i2c/other/ak4113.c
index 6ef5fffda8d7..9405d985a87d 100644
--- a/sound/i2c/other/ak4113.c
+++ b/sound/i2c/other/ak4113.c
@@ -130,7 +130,7 @@ void snd_ak4113_reinit(struct ak4113 *chip)
 	scoped_guard(mutex, &chip->reinit_mutex) {
 		ak4113_init_regs(chip);
 	}
-	/* bring up statistics / event queing */
+	/* bring up statistics / event queuing */
 	if (atomic_dec_and_test(&chip->wq_processing))
 		schedule_delayed_work(&chip->work, HZ / 10);
 }
diff --git a/sound/i2c/other/ak4114.c b/sound/i2c/other/ak4114.c
index 71efb29b6c7c..4c3dbbf8c316 100644
--- a/sound/i2c/other/ak4114.c
+++ b/sound/i2c/other/ak4114.c
@@ -135,7 +135,7 @@ void snd_ak4114_reinit(struct ak4114 *chip)
 	scoped_guard(mutex, &chip->reinit_mutex) {
 		ak4114_init_regs(chip);
 	}
-	/* bring up statistics / event queing */
+	/* bring up statistics / event queuing */
 	if (atomic_dec_and_test(&chip->wq_processing))
 		schedule_delayed_work(&chip->work, HZ / 10);
 }
diff --git a/sound/i2c/other/ak4xxx-adda.c b/sound/i2c/other/ak4xxx-adda.c
index 9dd36b82a6ac..e7410f0f8660 100644
--- a/sound/i2c/other/ak4xxx-adda.c
+++ b/sound/i2c/other/ak4xxx-adda.c
@@ -147,7 +147,7 @@ EXPORT_SYMBOL(snd_akm4xxx_reset);
  * Volume conversion table for non-linear volumes
  * from -63.5dB (mute) to 0dB step 0.5dB
  *
- * Used for AK4524/AK4620 input/ouput attenuation, AK4528, and
+ * Used for AK4524/AK4620 input/output attenuation, AK4528, and
  * AK5365 input attenuation
  */
 static const unsigned char vol_cvt_datt[128] = {
-- 
2.48.1

