Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792667584;
	b=BR+uAJ8plahPc+/R8jwa6bt0PyDpgj6UhRk8VZ0v2JfHRSXTf62dmz3Ce9unDyNdT4th
	 7YPdCmlAzOS4AorO/6lkMNbmpMW1Ke/GS++lK0UxroJxVGj8hcgqEihWbkLxAMzSe/H7I
	 qc8Rd4GM3P653QlIxFxaSiAQy1wpgWE0XSaposDa5CtbyuC2tq8byk3F6lLLqeRoO1SIg
	 aFrmFgNnkO3siPcA4P9tOCIelHwvDHa/lpiFOWhlAEUQhkVc1+8To3od8Psl9o+OFZgmz
	 rhxy8dus/8+1w1MTFjlNanP78m2obN4VjuQLifxDJQmooNiqfGOiQr5DlCaqqER7eSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792667584;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=plgo1VyyX/ZTHQrDVE4OpEvOdaKz2fz6hhtMI1sePFs=;
	b=TopD5FaMqWQgdhDsUbnVaV6Yvjs/vPqQAa+kwuJVK3YUzF02qF26k3bmRc/khYjEfcZt
	 h6Mv8CJtM0tHCGGAkjF5DsSZa0RGA1GVLWnLCbFJhu2QxEgkwP7OZbt674ws4prqM6I8f
	 kDvb7skBvwWZEhsYG4OhUOOOthswUgv0vj2ZR6h3zn+3JYU1RxhsNyIcjVO0fMdfkG4wk
	 2qp4g1qJx8WDQcqE2g9o5bML1VYH0Ydt5F0VnnzHXmdOC+axf9OHWhFHjE2gY6fo857Ef
	 3HuXsdfz2kuopQNMhdmv/+dQQ6PAe+q5EN8MT0b7nU+gjA/4eEIg6MSnAoIv71PPfUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=i1FPCBui;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E3A606A31E
	for <linux-sound@vger.kernel.org>; Thu, 22 Oct 2026 11:13:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50E3A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=i1FPCBui
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-354ba08cfd1so2946678eec.1
        for <linux-sound@vger.kernel.org>; Thu, 22 Oct 2026 04:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792667583; x=1793272383; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=plgo1VyyX/ZTHQrDVE4OpEvOdaKz2fz6hhtMI1sePFs=;
        b=i1FPCBuizCO26W639eEw/62D3Yu9yo/Y5brUjhFuMmOOnzlweK2N3jaqv8aklxIUOM
         kK1knNxc8zDSAcZL/odfpcGUAz35Ocf1Z7nuGPPkCYBC1LqbdjwGqZ8ijzn9SoY8JMJN
         wHO7xcxmVIoaH0peVVjOD9tFyoMVesdD6TPgCBYe0yu8tlRW751SVRgSKRZBrskpMQzz
         abdB0Eg9xWUOy2J5gi/Tl1fODqUJXOnQ4hblQVF5EFopSsi/4rdEWDMxaspq5m9a6/wf
         SUSNJe+g464Y2WVbCxqdh8dkbhQADAhvfB89rPo/KBdFZfelzIna0cosjVO8B+iODNw5
         0Qww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792667583; x=1793272383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=plgo1VyyX/ZTHQrDVE4OpEvOdaKz2fz6hhtMI1sePFs=;
        b=ZCGbimF86ChGL/CsFaa8ZIsKePEcLV+rZulIZe3cRArp904e8Dq52pA77dPLIgusDe
         Rb935udSivjs9gt8B1EnI3Kbdrta5QD8C5ZhrvMvRnlKiUEOH+lgXXI78eDUl/QEcEn9
         rci5RAnIw+FecVelWtRPXKGeznyIOg2lxPrsYW+mc9/wTd8k15MC6086ffHKtcPSxzCY
         NI+GMK1cWoIKbmOj0W27U3UciAaDgYS9a0TsKq+E1bnx2oerFBDY+R6DBqUKx9P9g+zC
         gBp7R8tEO9Fvx781Ve8vDv1PFPZEdGL4s2XD89yh27/FHCq2PpwBbIcfpUDfucFRrwgT
         5k5A==
X-Forwarded-Encrypted: i=1; AKwUvBxKASySNnKXUtYDM+iKWYZ0njM8YY2h0Ke7+LU+Mpy4hbpR1wN6KqXwKmRkLsCz4Sr3+ut62dWwcOgRpg==@vger.kernel.org
X-Gm-Message-State: AFq9FYLjE+x4mza+Ubpp/Ao7NsPqgc2DXCYAJq+Grxrec0h63qjevbL0
	MRw0F3nh/P7UtA2IRfy2K8GvQlCGfDO9nrSaJVn6550eg20M29dL1MWu92LUfYRUP9o=
X-Gm-Gg: AYBFou09KSz+VN0AfgfYymeJbzxQaXQwCPFW+2VmjvBO5KejGgAfQuRBQZhGR666IO0
	846luzTNbgKdIUnhZBGHL0iG59x6LDQjZpgLExdUQT0cGjBqnlPpZfnzyB7Q27VHPaGTuLaksty
	xhjLKz1dtP/i+qEJsFjYtJnDP5QjpDGT3KI2eLxIYVdhaXHHUsBQAwfG/4H8afRW10VhvqhYnyI
	aNv6oq7C+l6cBfWkztyU3gbajEAPGXtYsiTAdM9t32sZaL2vOXjgwqy4XvFTdLfc6lVUo9dYzfs
	X4q01IMTUX4YoBdQkN+19MhrO8tpvGXod7oRt2TGzygGhfrqwbeAePqe58ttLdVBh10VDcR58Yg
	nsONb3uh901bx8vqLA49fhPhtIrEZXyfRuGYfj12W4FcAggpub6pEdyEtcGBoSEDaRIY0xmdG15
	0qgG9CXCsV39aNRwiRzqYV38T5pQfmrDYhWvF+QQ+0QyJiH3I8iIWr8InFLTE6eP6LKBPNuS8Lv
	g6Q1dBIzTQ8tx9ZO6kwdrU1fJroq3qrHv3Fx2D4Jk6XLsRTq3AzJmlcHAIatA+H8LqAgBhvlKjQ
	+bFLzcXJF+jC7iSt0Ky9ZXatqjxLuD3+iCFUUpDCWyF0NUGFROAoXKQYgrltrk2lbMo=
X-Received: by 2002:a05:693c:401b:b0:369:21a:dce0 with SMTP id 5a478bee46e88-369021ae29dmr2009629eec.6.1792667583112;
        Thu, 22 Oct 2026 04:13:03 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-368ca914bb8sm6369653eec.5.2026.10.22.04.13.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 04:13:02 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: Takashi Iwai <tiwai@suse.com>
Cc: Ivan Orlov <ivan.orlov0322@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Shuah Khan <shuah@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>
Subject: [PATCH 2/3] selftests: ALSA: pcmtest: Test errors from the PCM callbacks
Date: Thu, 22 Oct 2026 20:12:43 +0900
Message-ID: <f1b98dad097550f09e38ee7e90ce30106d89a09d.1792660433.git.sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1792660433.git.sammiee5311@gmail.com>
References: <cover.1792660433.git.sammiee5311@gmail.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver can return an error from its open, hw_params, prepare and
trigger callbacks, controlled by the inject_*_err module parameters.
No test uses them, so nothing checks that these errors reach user space.

Add a test for each callback. It sets the parameter, checks that the
matching call fails with the driver's error, then clears the parameter
and checks that the call succeeds. The trigger test also checks that a
failed start leaves the stream in the PREPARED state. The fixture
teardown clears all parameters, so a failed test does not affect the
next one.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 .../selftests/alsa/test-pcmtest-driver.c      | 89 +++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/tools/testing/selftests/alsa/test-pcmtest-driver.c b/tools/testing/selftests/alsa/test-pcmtest-driver.c
index fc4d12542808..380364ee7924 100644
--- a/tools/testing/selftests/alsa/test-pcmtest-driver.c
+++ b/tools/testing/selftests/alsa/test-pcmtest-driver.c
@@ -5,6 +5,7 @@
  *
  * Copyright 2023 Ivan Orlov <ivan.orlov0322@gmail.com>
  */
+#include <errno.h>
 #include <string.h>
 #include <alsa/asoundlib.h>
 #include "kselftest_harness.h"
@@ -58,6 +59,20 @@ static int read_patterns(void)
 	return 0;
 }
 
+static int set_param(const char *name, int value)
+{
+	char path[128];
+	FILE *f;
+
+	sprintf(path, "/sys/module/snd_pcmtest/parameters/%s", name);
+	f = fopen(path, "w");
+	if (!f)
+		return -1;
+	fprintf(f, "%d", value);
+
+	return fclose(f) ? -1 : 0;
+}
+
 static int get_test_results(char *debug_name)
 {
 	int result;
@@ -141,6 +156,10 @@ FIXTURE(pcmtest) {
 };
 
 FIXTURE_TEARDOWN(pcmtest) {
+	set_param("inject_open_err", 0);
+	set_param("inject_hwpars_err", 0);
+	set_param("inject_prepare_err", 0);
+	set_param("inject_trigger_err", 0);
 }
 
 FIXTURE_SETUP(pcmtest) {
@@ -343,4 +362,74 @@ TEST_F(pcmtest, reset_ioctl) {
 	snd_pcm_close(handle);
 }
 
+/*
+ * Here we check that an error from each PCM callback reaches user space. The driver returns
+ * the error while the matching 'inject_*_err' parameter is set, and works again once it is
+ * cleared.
+ */
+TEST_F(pcmtest, open_err) {
+	snd_pcm_t *handle;
+	char pcm_name[32];
+
+	sprintf(pcm_name, "hw:%d,0,0", self->card);
+
+	ASSERT_EQ(set_param("inject_open_err", 1), 0);
+	ASSERT_EQ(snd_pcm_open(&handle, pcm_name, SND_PCM_STREAM_PLAYBACK, 0), -EBUSY);
+
+	ASSERT_EQ(set_param("inject_open_err", 0), 0);
+	ASSERT_EQ(snd_pcm_open(&handle, pcm_name, SND_PCM_STREAM_PLAYBACK, 0), 0);
+	snd_pcm_close(handle);
+}
+
+TEST_F(pcmtest, hw_params_err) {
+	snd_pcm_t *handle;
+	char pcm_name[32];
+
+	snd_pcm_hw_params_alloca(&self->hwparams);
+	sprintf(pcm_name, "hw:%d,0,0", self->card);
+	ASSERT_EQ(snd_pcm_open(&handle, pcm_name, SND_PCM_STREAM_PLAYBACK, 0), 0);
+	ASSERT_EQ(snd_pcm_hw_params_any(handle, self->hwparams), 0);
+
+	ASSERT_EQ(set_param("inject_hwpars_err", 1), 0);
+	ASSERT_EQ(snd_pcm_hw_params(handle, self->hwparams), -EBUSY);
+
+	ASSERT_EQ(set_param("inject_hwpars_err", 0), 0);
+	ASSERT_EQ(snd_pcm_hw_params(handle, self->hwparams), 0);
+	snd_pcm_close(handle);
+}
+
+TEST_F(pcmtest, prepare_err) {
+	snd_pcm_t *handle;
+
+	snd_pcm_sw_params_alloca(&self->swparams);
+	snd_pcm_hw_params_alloca(&self->hwparams);
+	ASSERT_EQ(setup_handle(&handle, self->swparams, self->hwparams, &self->params,
+			       self->card, SND_PCM_STREAM_PLAYBACK), 0);
+
+	ASSERT_EQ(set_param("inject_prepare_err", 1), 0);
+	ASSERT_EQ(snd_pcm_prepare(handle), -EINVAL);
+
+	ASSERT_EQ(set_param("inject_prepare_err", 0), 0);
+	ASSERT_EQ(snd_pcm_prepare(handle), 0);
+	snd_pcm_close(handle);
+}
+
+TEST_F(pcmtest, trigger_err) {
+	snd_pcm_t *handle;
+
+	snd_pcm_sw_params_alloca(&self->swparams);
+	snd_pcm_hw_params_alloca(&self->hwparams);
+	ASSERT_EQ(setup_handle(&handle, self->swparams, self->hwparams, &self->params,
+			       self->card, SND_PCM_STREAM_CAPTURE), 0);
+
+	ASSERT_EQ(set_param("inject_trigger_err", 1), 0);
+	ASSERT_EQ(snd_pcm_start(handle), -EINVAL);
+	ASSERT_EQ(snd_pcm_state(handle), SND_PCM_STATE_PREPARED);
+
+	ASSERT_EQ(set_param("inject_trigger_err", 0), 0);
+	ASSERT_EQ(snd_pcm_start(handle), 0);
+	ASSERT_EQ(snd_pcm_state(handle), SND_PCM_STATE_RUNNING);
+	snd_pcm_close(handle);
+}
+
 TEST_HARNESS_MAIN
-- 
2.43.0

