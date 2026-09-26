Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A351E3B8D40
	for <linux-sound@vger.kernel.org>; Sat, 26 Sep 2026 09:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790416769; cv=none; b=eClTHi0YMkmWOWPeVPrAXPT1qJWrYoNccG7CbFNX8HI0GKD1QqLiiw/T2VHn4tkP1A3TojFq5JDNj9OZGPI3cP3JW9HQP5v/Z0v7rn+CLXJ3zKqHofUeczxQx2G9OGaOesPxbuwW9C2jN9GJaFJ965ROaVJwYZMcU1YLz8Qze2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790416769; c=relaxed/simple;
	bh=i9bpAEGVHwsXNKL7VeERnZnRJZ7gmhLKwXwJddo1pws=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=IHRdyk5vi8GuG23EmX1ErDodtG5o+BMGoJ0BqXirKx4lh6ygxPUFR42vn8w+LDTr53KNM1gsEDQvjO5Og6Ffpjn8SieAtVD6y1+YHjfbNXCurkqC1u2K4U0M3aBmRj2GQOl1JjHQ/gIk2CAdKXgF5X7wZ7W644kFO5EGj5OrP18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CFZ77hNq; arc=none smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CFZ77hNq"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b8c7a1aeecso1437244e87.3
        for <linux-sound@vger.kernel.org>; Sat, 26 Sep 2026 02:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790416765; x=1791021565; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aairqCQlQgiewQXylukFVs+L06uHBEYrUeNsgl4jBIo=;
        b=CFZ77hNqdSsTiszi+6s7O9KYSdzC8Rh45z5ixFbG23jhVrWNhkxw5me5PZT6qVjQxF
         vhpDMHJC4A453OzizhVd6hMHd9sCe8alUC/E8WEL2cz4+g76ae+8nHBG/93SjSVfIt4t
         /PnSb7rZgIO/8t8O/Zdqmw7Fum6wWSg4fqIsfSULlC/QkXJBREEKiRi+dqGaRa4GLOye
         7Imhk4b8gUXkZrjt57nr9ozjGVz6FRZvj0j67qNMwqIJROwwlDRn6+jmtPwbEdCRfs2E
         szGA1471hBb3ERpo6mnTKbImmYETlXJm6q5/cmJmMPcQpxnpqlSsJu04yH5fGRQBggas
         8QiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790416765; x=1791021565;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aairqCQlQgiewQXylukFVs+L06uHBEYrUeNsgl4jBIo=;
        b=QtNhKr/2DuX2rAAOzXox7w44W43+VZewfVu3rWHHALlTBUgo+Buhk4g59TpH1PYVKB
         KAMq/RBdbpfDGSjwWkjhqyAhnMevAnNBWZIaWi/kw4VBJTxmsqndw7/ebCCeHh/BvSxa
         W00BGkpBvc+P9aovsSlk7X6wz9TeDWNnXowZA0+w0D0/zAPVdnKhXnBLYKBETv7F5upQ
         dMmvnaVmquVpf1jC3imawgWAv+N5S+tE8HJUY1mUo+HsRhBSggktfz1NMAOBSEmMPbzm
         vVQ9XFWKpfi/ngol8D2OYVhGYdTrTpwxOWnzLq5/eRd/mVpgXLqaERLyGaFu70znvs7v
         hbaQ==
X-Forwarded-Encrypted: i=1; AKwUvBzsNG4m5CJk2w+ZOra17UPAVeRlNl8WJTE2RInwXhKk252RAaKEbLtL+42/HdfnMQ3hZlyCirYmC/zlaQ==@vger.kernel.org
X-Gm-Message-State: AFuF++ndYH/2qPqhcyfn+XftciWBfEaZY/2ojEbcGUwJBStaS4sxPqvW
	iZKG5vVt/03s9XnuYOVD/A9tFAsB16OhEBEeiuSTW/DRwZ3CefjKZHBzhwfcJc8yktmIkw==
X-Gm-Gg: AYBFou0urYaHAkEMZeukDhy77gHwbYiDoU7C3ydnx9owCUXRhz8LC6cOjiuLq61EtwB
	R9ve+dabsfnhC9webDGInkpT9u/TKr7KMsoG01+EdaW52uBtaTkIIc2P+qEA/GL6Wb26o11K/SZ
	N9KUyDxxlm0fgQarZivbO8FcsS7X4CIVJI1hUg7+SquxNkUUDBUnBAttSG1raHhD330mrln3pAM
	bS5XpreG3IX5B/P07/t8tKCxb3TxyQ/Xtk1KCPEPDl/vtcTV+XV/tfzG+ek5qvmyujFZNHajITp
	G56iTHYXi27id7FSWCyuzoLoFL6D4r8FYfWuOkHJQKVedvd09tf1o+Hh6jmvhrQvXQt7qyUmCaP
	yxMw5YXaYpaRpcreuQNHJ8s8VLO7VK93/sudRxW98PSHP/bcKQmja3D0p6EYvsXMDozRe9ofGeE
	W3ZVibyzEeG/zozqdnOTWvguKXw9vPNb5zGvT4nYlGFQiNlz22xYfNhErYUrkEzWhjmSnSxUSe5
	E8=
X-Received: by 2002:ac2:4646:0:b0:5b6:67b3:9f74 with SMTP id 2adb3069b0e04-5b8df0d4463mr2426298e87.5.1790416765142;
        Sat, 26 Sep 2026 02:59:25 -0700 (PDT)
Received: from arfa-server.perm ([37.114.244.211])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8e6ae5fbdsm1157522e87.14.2026.09.26.02.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 02:59:24 -0700 (PDT)
From: Alireza Feyzabadi Farahani <arfa79lg@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alireza Feyzabadi Farahani <arfa79lg@gmail.com>
Subject: [PATCH] selftests: ALSA: Skip tests when devices are unavailable
Date: Sat, 26 Sep 2026 09:57:56 +0000
Message-Id: <20260926095756.2051290-1-arfa79lg@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A kernel built without CONFIG_SND exposes no ALSA devices. In that
environment, the mixer and PCM tests currently report success with a
zero-test plan, while the userspace timer tests fail when opening
/dev/snd/timer. Neither result accurately describes an unsupported test
environment.

Report KSFT_SKIP when no sound cards are detected and when the timer
device is unavailable. Keep the PCM missing-card failures when a matching
hardware configuration says that a card should exist, and continue to
fail timer opens for unexpected errors.

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=218479
Signed-off-by: Alireza Feyzabadi Farahani <arfa79lg@gmail.com>
---
 tools/testing/selftests/alsa/mixer-test.c  | 2 ++
 tools/testing/selftests/alsa/pcm-test.c    | 2 ++
 tools/testing/selftests/alsa/utimer-test.c | 6 ++++++
 3 files changed, 10 insertions(+)

diff --git a/tools/testing/selftests/alsa/mixer-test.c b/tools/testing/selftests/alsa/mixer-test.c
index 6edffcd6f..ab70645d5 100644
--- a/tools/testing/selftests/alsa/mixer-test.c
+++ b/tools/testing/selftests/alsa/mixer-test.c
@@ -1378,6 +1378,8 @@ int main(void)
 	ksft_print_header();
 
 	find_controls();
+	if (!card_list)
+		ksft_exit_skip("No sound cards detected\n");
 
 	ksft_set_plan(num_controls * TESTS_PER_CONTROL);
 
diff --git a/tools/testing/selftests/alsa/pcm-test.c b/tools/testing/selftests/alsa/pcm-test.c
index ee04ccef7..de07de650 100644
--- a/tools/testing/selftests/alsa/pcm-test.c
+++ b/tools/testing/selftests/alsa/pcm-test.c
@@ -613,6 +613,8 @@ int main(void)
 	conf_load();
 
 	find_pcms();
+	if (!card_list && !conf_cards)
+		ksft_exit_skip("No sound cards detected\n");
 
 	for (conf = conf_cards; conf; conf = conf->next)
 		if (conf->card < 0)
diff --git a/tools/testing/selftests/alsa/utimer-test.c b/tools/testing/selftests/alsa/utimer-test.c
index 1a9ff010c..07aeaa777 100644
--- a/tools/testing/selftests/alsa/utimer-test.c
+++ b/tools/testing/selftests/alsa/utimer-test.c
@@ -51,6 +51,9 @@ FIXTURE_SETUP(timer_f) {
 	self->utimer_info->resolution = (NANO / FRAME_RATE * PERIOD_SIZE);
 
 	timer_dev_fd = open("/dev/snd/timer", O_RDONLY);
+	if (timer_dev_fd < 0 &&
+	    (errno == ENOENT || errno == ENODEV || errno == ENXIO))
+		SKIP(return, "ALSA timer device unavailable");
 	ASSERT_GE(timer_dev_fd, 0);
 
 	if (ioctl(timer_dev_fd, SNDRV_TIMER_IOCTL_CREATE, self->utimer_info) < 0) {
@@ -156,6 +159,9 @@ TEST(wrong_timers_test) {
 	};
 
 	timer_dev_fd = open("/dev/snd/timer", O_RDONLY);
+	if (timer_dev_fd < 0 &&
+	    (errno == ENOENT || errno == ENODEV || errno == ENXIO))
+		SKIP(return, "ALSA timer device unavailable");
 	ASSERT_GE(timer_dev_fd, 0);
 
 	utimer_fd = ioctl(timer_dev_fd, SNDRV_TIMER_IOCTL_CREATE, &wrong_timer);
-- 
2.34.1

