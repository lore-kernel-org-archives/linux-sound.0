Received: from mail-lr2-f34.google.com (mail-lr2-f34.google.com [74.125.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C635B38736C
	for <linux-sound@vger.kernel.org>; Sun, 27 Sep 2026 06:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790491495; cv=none; b=LAv41kuOxdA/p72b2FDYGyBMP5i+5tUbW61zsHJdFLmbSEKeECWOpIfUPwGwvR7yVs50XxsKytFachHxbDdnumxaWEIaFTy7PJhGzQSzB2Cq0KDImIT42RLUmPOLnPMAPmzvNEyR3k/TTg7gdUBkbRmOejZZNWpuSl2dG/0fYXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790491495; c=relaxed/simple;
	bh=VCSr1QwLPdpGFwkBfnzDNQ4fpsZLhXC9EdlyYTtIq4Q=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=EM29o4oFM8wKYToYGTJcjvgFyQIQcXcEpKMUbw2pXGranRVJbB98ex49TkgUwI7YdsDTJLJySrVH60W+K1fcSEZTPzeKQSeRBqwQYKuoNAknWW/pnXiFY9YxrhQ5yVAJ6wggdDenArn7BYEgpydLHm21cdzolZbIOmvc5wCxxAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cEN1yBLS; arc=none smtp.client-ip=74.125.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cEN1yBLS"
Received: by mail-lr2-f34.google.com with SMTP id 38308e7fff4ca-3a65b23ad72so8612891fa.1
        for <linux-sound@vger.kernel.org>; Sat, 26 Sep 2026 23:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790491492; x=1791096292; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Lq7Q91vQGo/b5qX6wq8BmyvihDyO2qxZ5pfJg2BwbSM=;
        b=cEN1yBLSHZqjSeYVZT25tM6EQlyjKlraomzt6ZMAxg+AEPWX1ltEfe3jpiQXF8yvN+
         LbnrMM8f7lspE+6h/eTYerVo/HoMPa1FRXcarWXXsbSRGrEkw9f8roE5H/38DQzMn/vY
         umZs7ImrCptym3CLX0SEnDGojiLbzeGSJWgD/fiLdMUuGYqhH3ivxseSGO2bgcqoJegB
         t5mspGyxIztMLB5ymI46CMRoyAqk0G0X82QHk79UjXOh1C4INI0wV69ZHgldcuwG5tk0
         JqVjNxo3wu4nT+8VA78S/DN6XXkj0+4KDST7VRtKSwQhzqk3ZynGSWcA6BDclVpSvmCp
         B2Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790491492; x=1791096292;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lq7Q91vQGo/b5qX6wq8BmyvihDyO2qxZ5pfJg2BwbSM=;
        b=VtE76rDnvo2P1GyJeCYKKv/tjferM15lI8jYUAsnP1s+mmqGWwKK6eL+Nv1KY5DKqg
         yyMmR9WbGodo2zzoEsJoRtDTYnbm0T9Q+Z4l6fXGvfEH0L3TBsY7eNtMs80hi7pZJPrs
         /DuKB/dkAu7b6sVBBUQKF4ICy0TNhWDssnVuzprjAyB+paV2P++bo78apk4lVDXZ8bRM
         8plQWvI+NGxckPyiEMTNo8Ta9k1OEJZEa5Dvjo5T8vbL4eSMUy6pYrAFlXZZWrtIpJbM
         9HgO/sHf0abqkZZVO/LiIVybzKnJOvqMP+2sCM2FjFRC4ic7NiM2O5HARs+Alak3loff
         +0Ww==
X-Forwarded-Encrypted: i=1; AKwUvByeK1y3yMLmVW0bfa7i/wIoJvQWpKraGfUUKZr8hRbHg5iApuWydVlcW8UbfdMIzzRcg1+bIlEy07mbzg==@vger.kernel.org
X-Gm-Message-State: AFq9FYJpEUVqJizmardHHYViz/Epue/rc2k2zL/h9lBz7DVXKj7evabd
	2V1zQbhamIFtYkA/h/99OApntiWoPa6SGNt6+BEWQNhHpOVUg4Frbkv+
X-Gm-Gg: AYBFou3KherGbcL15sugmewnYIvuewDVyuPAzufFIG2Xr01S8P9L8FXJp2phTEwLG2F
	lhla6iOBFLkFWP5XggYQV1+M7XTm3fP23ga4SPmxXE87e/WIZ4LM9qhTh0uIhViuQr89GC8z0C0
	KFQAqeCtR/dof6/EspvMh4d6/yCaDR6CoQX5NSk5quSTEn7o22Yt9JKSfQk9jQuGBDJrnsiKuB6
	u4zWTid7yGy+RmZa4kyFX0TEI4WIate6yqw/mgi//7wF7md0Minfi5XoTSX4ZozCHS7KmobsFLI
	GKolyS+rhFR3OjXJbSga7wrKP1FCIiYYpF40DkFeBQXn8hbsGr5b9gfhlahgOJ2nc4TkUIwb/6G
	unNq7fNc5ByoqMDVFGIiWkixmZM5i9FeBFzHAWoy6jtM1hxSz6llNbOJjpW4+Ph+OOGwuwQuKOI
	sb5MYHO7KGsAdUe0t5rx2cOm+MQAzGbSkYZauY82Zo1rPRf7SEtZC4O59PtDq1n8dOAPZ74UdBs
	1Y=
X-Received: by 2002:a05:651c:1990:b0:3a6:3074:122c with SMTP id 38308e7fff4ca-3a63c0b0092mr27274451fa.17.1790491491540;
        Sat, 26 Sep 2026 23:44:51 -0700 (PDT)
Received: from arfa-server.perm ([37.114.244.211])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a64b3a228csm19150511fa.0.2026.09.26.23.44.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 23:44:51 -0700 (PDT)
From: Alireza Feyzabadi Farahani <arfa79lg@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alireza Feyzabadi Farahani <arfa79lg@gmail.com>
Subject: [PATCH v2] selftests: ALSA: Skip timer tests when device is unavailable
Date: Sun, 27 Sep 2026 06:44:30 +0000
Message-Id: <20260927064430.2112688-1-arfa79lg@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When CONFIG_SND is disabled, opening /dev/snd/timer fails and the
userspace timer tests report failures even though the test environment
does not support ALSA timers.

Skip the affected tests when opening the timer device fails because the
device is unavailable. Continue to report unexpected open failures as
test failures.

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=218479
Signed-off-by: Alireza Feyzabadi Farahani <arfa79lg@gmail.com>
---
Changes in v2:
- Limit the change to the timer tests, leaving the PCM and mixer tests
  unchanged, as suggested by Mark Brown.

 tools/testing/selftests/alsa/utimer-test.c | 6 ++++++
 1 file changed, 6 insertions(+)

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
