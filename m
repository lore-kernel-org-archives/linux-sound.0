Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F0BE3B8D4B
	for <linux-sound@vger.kernel.org>; Tue, 21 Apr 2026 13:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776776603; cv=none; b=OjYRBrepTk0Lm4Pb9wupu4Hy6FhmA2iCAeSuWL83eFOxj/Dx7UoXvZgdk/leTM+FUmphnVu/NyndKl6Ki4ZHiZSqm1nyCCPpdVhBECRw/shU+6+mUkgI8SKYMuDdOCuo1Ke5ADT85IfvwCMN0OvQOb72USB3X5MdRLnaahLXLy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776776603; c=relaxed/simple;
	bh=iJiUvbReoT4x4uCETYAX16I6NQD1wIABfCHxzjQCt34=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=B91uyKHRF/O8huTmj796SuRehojSNCcgWv0My9BJlNUhuGR0tOg4IdUp6iuRfXWPlFr1ABxw0XOO4fXyFGc64yEnA/7VV0Mbt03Pw4/XCBeCEAf5oNTqcH0EhjzbWri3G/HCGdXAFKCDwRoTget5DZh8UxzCmCqbPtwlxb3ndWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D4So+Sjq; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D4So+Sjq"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2d8ffdc31d0so9949192eec.0
        for <linux-sound@vger.kernel.org>; Tue, 21 Apr 2026 06:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776776601; x=1777381401; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RrlnIkmfaLavUxMwyP8T54KIMpBamxkwMLXcyq5lim0=;
        b=D4So+SjqZnw7/g2fr5xcJd3ABQpQHi1kHM+R2b6VqW0xSYYhf00Pl0/s8ojaVNMkoo
         +x1t1RiJt0BL/OnJbfx+06tbqQrSWx5mSZQfN9XMBO/8hrTA3tgMFwPmX8HpiDOCCV7E
         rJfybKhvVAdRXLHaEuPK7FB7NZ7wxc5jeeAQk+HtHekcltCGuQQ/1sTo4H5esvapWmAR
         09S3W4RpdE675hk0AZfxwCuZ03ljgJiX56ut5jBE31NO1hl8JtpvxUppqMvFdHWZ/dvj
         5/v7M/RE0x/pKmm4fEMCW2O0b4PgJfm6P6/1D8aIOvnOOMxmEx6IERsDZ8pXJMhZ3hkm
         j+MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776776601; x=1777381401;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RrlnIkmfaLavUxMwyP8T54KIMpBamxkwMLXcyq5lim0=;
        b=i3TOuNwGBJmGIK6FG5bjQu07xYt75tkF4DxT+n6uVy9LMyarrRk4PwhV//VasNAfRi
         TXhKNZz9/NX9XhOpCAr97z/KZr+kH/9vSBbQ5YksnL8ozrLqaNFIHOSeAVAfNjEvzlHE
         Z/DaMrJW8i+mlRaDZa8aCpX1awQIrkD9mrmhNe2FretFm8mQVPbN5PhNhD7uzQYme29U
         0E5GwgqErVNgNcLC4fYS/yU6ddd9zKKoTg9GibUJEcvWOywRk4DnW9sep+ChSoksweCA
         2qLO2g3ZaJTMKjconZOgxPkH3/ZtwaGoAxjXrgv8O7OAOGTt8gNJbTDpTMbJO17cT5S/
         hhtg==
X-Gm-Message-State: AOJu0YzsfxDiSsOs+cuS2I11vHOG/5viqpibUi+rvtq3eghCc7IZQIRX
	disuzhnedtTkoqURapNmMp3UxLNfW1y16SeYMr6KQBInsZ4dZOgI9xiw
X-Gm-Gg: AeBDievkzh/81b2YdZUuee1eGO9uCCDjLTyLd9n7JqlYSLw0VZZhQB8wfeYc1kA9Tue
	MQjkKQy4AUkzXKO4TqrtsDzv2593wyVALWdAk9oUjWVlxyipHgRA1+26ZnTq/Z1+Xj0MR+dKysq
	KuxvL/K0y0PBIYI6E1UP/OBF0MiC7JyZhhSPWpPfvL1ibSzJ8OwLHt9YOLuv2A2t+mTs5ftzWKS
	qs9t+uiW1OVknNCu+tWWterpnxCeuqUecuJPECRS+bT2ahg1uuhd+MvpwerjMSvBRHsS2Fx4DfC
	GDj289KZD+NaGrdGpetZnQmEnLE0S7F2fyag70Xml7tgN5E6JIhQkHCBsLRZwLo0YWALhzseYxr
	/DzJfYcGdQTz/fxNPjuyS2Fq09zHTnmj2M7VB0EfLFUCfInguO9JcQskfhy/iiXAxNYQ+xEL96J
	Ye0rGrlPl/rJhZzxu+ry3xzTGUkkKnZmehZOArxbOjxQqnsssrPvuJMMlIRZxuoOOaQYPJWE5e1
	amDvC97QbKs
X-Received: by 2002:a05:7300:2d15:b0:2e7:5737:8364 with SMTP id 5a478bee46e88-2e75746d9c9mr7148510eec.15.1776776599207;
        Tue, 21 Apr 2026 06:03:19 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-87.user3p.v-tal.net.br. [177.4.161.87])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53d2cfc1dsm18294986eec.22.2026.04.21.06.03.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 06:03:18 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Tue, 21 Apr 2026 10:03:06 -0300
Subject: [PATCH] ALSA: pcmtest: Fix resource leaks in module init error
 paths
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260421-alsa-pcmtest-init-unwind-v1-1-03fe0c423dbb@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQrCMAyA4VcZORtoq0z0VcRD18QtonE03RTG3
 t3qjt/h/xcwzsIG52aBzLOYvLTC7xpIQ9SeUagaggutO/gTxodFHNOzsBUUlYKTvkUJj8l15B1
 R2BPUfMx8k89/fblutqm7cyq/H6zrF3njQXB8AAAA
X-Change-ID: 20260419-alsa-pcmtest-init-unwind-7c0bd10dd23d
To: Ivan Orlov <ivan.orlov0322@gmail.com>, Takashi Iwai <tiwai@suse.com>, 
 Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1841;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=iJiUvbReoT4x4uCETYAX16I6NQD1wIABfCHxzjQCt34=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDJnPSydf0ytp2nGW4dzbD1Mu39Xof/5ujeldHWsp1/OHt
 ldsuaP7sKOUhUGMi0FWTJFlddIiyz1dD67Wx63wgJnDygQyhIGLUwAmoujFyLAmo0Fg3mNPqReV
 f5j/X9WJPxE5l8X6hKpeSXCnsemSlwcZ/sfrpew5oPbg5TGX44LaMxKjzjIvc7M4f71vZ+BBO+V
 mbQYA
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

pcmtest allocates its pattern buffers and creates its debugfs tree
before registering the platform device and driver, but mod_init()
does not release those resources when a later init step fails.

As a result, a debugfs directory creation failure leaks the pattern
buffers, while platform_device_register() and
platform_driver_register() failures leave both the pattern buffers
and the debugfs tree behind. The recent fix for failed device
registration only dropped the embedded device reference.

Add the missing cleanup for the debugfs tree and pattern buffers in
the remaining module init error paths.

Fixes: 315a3d57c64c ("ALSA: Implement the new Virtual PCM Test Driver")
Cc: stable@vger.kernel.org
Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/drivers/pcmtest.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/sound/drivers/pcmtest.c b/sound/drivers/pcmtest.c
index 20ceb9082fa9..fe31ff1e5b3c 100644
--- a/sound/drivers/pcmtest.c
+++ b/sound/drivers/pcmtest.c
@@ -754,15 +754,24 @@ static int __init mod_init(void)
 
 	err = init_debug_files(buf_allocated);
 	if (err)
-		return err;
+		goto err_free_patterns;
 	err = platform_device_register(&pcmtst_pdev);
 	if (err) {
 		platform_device_put(&pcmtst_pdev);
-		return err;
+		goto err_clear_debug;
 	}
 	err = platform_driver_register(&pcmtst_pdrv);
-	if (err)
+	if (err) {
 		platform_device_unregister(&pcmtst_pdev);
+		goto err_clear_debug;
+	}
+
+	return 0;
+
+err_clear_debug:
+	clear_debug_files();
+err_free_patterns:
+	free_pattern_buffers();
 	return err;
 }
 

---
base-commit: 0396822571d079e2f275cca8446f653e6ac0e9f2
change-id: 20260419-alsa-pcmtest-init-unwind-7c0bd10dd23d

Best regards,
--  
Cássio Gabriel <cassiogabrielcontato@gmail.com>

