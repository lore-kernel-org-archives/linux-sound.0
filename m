Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11E113A3816
	for <linux-sound@vger.kernel.org>; Wed,  9 Sep 2026 12:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788958603; cv=none; b=cNKdVcSIzHBIAE5aEJTai0JlWIo7LOIQLAdeRsN0r13XS3BGIlXZjUcYnoLQP7bDIke95EhBX30I27XKrUgeiYxJr2UG6p4A4nPuUoboqfp8zawVfcYShJ6J89uom9PBBzZRuWHw3Qmwoc7J7kc0ylwphDqFFFotLHocsNB5GPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788958603; c=relaxed/simple;
	bh=lsN0XiwlujHd4wYAIXgxFrs6nm46SgZPunzPpVR8ooU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dg+gBbCXEKd1fBD+3GvSkDUy5KFxUkxR4zVL1fTTEORfsaNBDuZLNvgVhE+UEHE0J/6q5UbmUcgYGygBimAavfQCm8bsaJIHHj3txLgizyvVCgDMVVhRP4bVfKqE1q5Wq52WjE6uJxjaTIyS8g4l2M4cnYz3tp64i0a2w+b4I94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r5x55FNQ; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r5x55FNQ"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f62ccdb1so760364f8f.1
        for <linux-sound@vger.kernel.org>; Wed, 09 Sep 2026 05:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788958600; x=1789563400; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fB0D1FkKGt2ZFCz5IZDi2tLOgo9z2TzTEtx144XQJCU=;
        b=r5x55FNQWn/LvCbadEOkIlcxCA6/j/Fq0EbhwmPddzS6WCmi/z/Jh5q5I7y2EAwxDj
         26SilLR/0/UWr9cRby4IZJsuxi61VmlJrIowEj2VIq0bz/Ozet8a2F8jVzhEMOnW9ciF
         i0bMtDpTkTzHEgDr2GYPRc44MSiiC0qCdf2xhyFTnhnlrlO6/Xd/755NjlLr5WUak3FR
         9TQAzZuZsGKeT3LkWLMzhwt2Jc3sc0LPMCZQFepvG5d9eRpaSfwr1B7w4Pgbw27XKk8J
         xU38HwhpW27aY3RfJGbOaMU0TnmG33qDbdSd7ZmXojonlIBQr8qUwLHkIj4yyZKlqYQh
         jL5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788958600; x=1789563400;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fB0D1FkKGt2ZFCz5IZDi2tLOgo9z2TzTEtx144XQJCU=;
        b=c6Gfh8y7NQmG05EjYw66+0TMAX7Kd9WumveLypIf4Yb7ptgBzPQd/D+6Y50bwhvnLD
         M8SG5H25j0Wfrn5YCgg5+5eSrvL4MWPMVMdc1lvCpFKbMY+tF/+bs+AaaFZXappY4h5M
         k8LEKpuOeWfNMmmkAcHvPfAHa9cOFqNnEIrr70rFcw3Bg8EhOBDZBOqbC6dgu3pt5NrT
         47Y3r+JNBY7dbYVTrPGXrXXXf9bsY4emA1wEj5pEXCRjKMtmTqm07u+hq0bzQZY2klFb
         FnUFWajR8rX5s5KVBjWakORg1WxtjhOl/yOihKWU52O/NAK0BYt5GeCwCvwpPJMzpdc8
         RnRA==
X-Forwarded-Encrypted: i=1; AKwUvBzSCeEID8rNAza8EWUVSak617XuiBA781zvSujSZlqb5sBynX5nU+4OzdQoJmRmPCS0e48tbTXXQRNs5A==@vger.kernel.org
X-Gm-Message-State: AFuF++nbqUqlyqvfvSCrr7cgVDKgu59KMGJx7v7xIVJBN2fABw2QjPCn
	qhZXTdln3mmeCIltztpjwRIoXC3GyTNcX8HBmf6wJbiP6pqZinEN0m3Q
X-Gm-Gg: AYBFou0nXerl2JXCHIAsdDrj00DfYxWE0vtxUb+EkRICuIwOp8WVaHRacFcwQVEzgpP
	33oh04T9K6KcNCzwKpmjvQEFAVOFgbmkdu3YybrJ+LZoyrS05+YkRRPYLpMXIEFMwazg4NL9vW+
	mVxbBnsFcGBP/WOTQbgVB+L0DteTOMYtmVk2RneXAH4VQKPo9INXYkxysahhijFyIlH9scZKZh1
	CTm0BVvKLKNRya1EvVmgoHKVZvygdNupUfV22H1pqnaxMKgu+4eFDiy0SeCtMT6tSFpFCuV1Jp2
	a0Cfbqnmo0kUIv/Gd+Hk3x32KA6IS1M1Gi7bp9vuCH2DHNo7ISTzpuuvDi9cl+NKmu6n3tXeRhq
	qqx8dBeKXloP51KkRzm5UD5PsOugfRnqphp7KytLo34r3ev0rXlxxOZ3HOs2lizKksSEn1JziWE
	vRAAu2x6fz1zR/vJ6worsV/MR8ZC7iiYP7/oKZILEF4/UK6hwzY+80sd+YP+9B2hZZAxAp2621J
	3iwSbDPT0dz5rDziujCuYacMoyesnC56VXXuOR26wiaUMeWZ5eg0jZtJXF7fmRUkaLhvPMh7Q==
X-Received: by 2002:a5d:5e09:0:b0:485:a09c:6529 with SMTP id ffacd0b85a97d-485a23c62edmr16611766f8f.5.1788958600108;
        Wed, 09 Sep 2026 05:56:40 -0700 (PDT)
Received: from nixos-office (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885b7bfasm44241663f8f.29.2026.09.09.05.56.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 05:56:39 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
From: julianbraha <julianbraha@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: ckeepax@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	arnd@arndb.de,
	julianbraha <julianbraha@gmail.com>
Subject: [RESEND PATCH] ALSA: ASoC: fix unmet dependency for SND_SOC_DB1200
Date: Wed,  9 Sep 2026 13:56:36 +0100
Message-ID: <20260909125636.3560050-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SND_SOC_DB1200 selects SND_SOC_WM8731_I2C without ensuring its
dependency, I2C is enabled. This causes an unmet dependency when
SND_SOC_DB1200 is enabled without I2C.

Let's add a dependency on I2C, as similar options in this subsystem do.

This unmet dependency was found by kconfirm, a static analysis tool for
Kconfig.

Fixes: 9dc15f81baf2 ("ASoC: wm8731: Factor out the I2C and SPI bus code into separate modules")

Signed-off-by: julianbraha <julianbraha@gmail.com>
---
 sound/soc/au1x/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/au1x/Kconfig b/sound/soc/au1x/Kconfig
index a7630897bc0b..e8986da24d64 100644
--- a/sound/soc/au1x/Kconfig
+++ b/sound/soc/au1x/Kconfig
@@ -55,6 +55,7 @@ config SND_SOC_DB1000
 
 config SND_SOC_DB1200
 	tristate "DB1200/DB1300/DB1550 Audio support"
+	depends on I2C
 	depends on SND_SOC_AU1XPSC
 	select SND_SOC_AU1XPSC_AC97
 	select SND_SOC_AC97_CODEC
-- 
2.55.0

