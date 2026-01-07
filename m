Received: from relay12.grserver.gr (relay12.grserver.gr [88.99.38.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E33292D9782;
	Wed,  7 Jan 2026 09:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.99.38.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767778358; cv=none; b=fDCWhTSguNqM9qa0kzRDUfmLXSDATMv81xLBg8j6j10aiAngSkOLxmyJED+JNaFzL65KcrV93s5I/dtcYqcCwttatpWVXC06QxMm3EnC6/0f5MEm7/aDP6yruOQSAE8NR+KRliN4Ll5XbKfrmsO9JzqwxYFFt83Vpm+Ri+50cf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767778358; c=relaxed/simple;
	bh=Lv+817fGo6NCMbn0so4oC05Xk/aKuXby/SytRt8XtaE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cYbPt1D8alpkBeoskz+WcXykDSYstaWAR3mNeXeNoTth1XGA8rcxyEq6w+mi5hPmqK1TAsHPjkNUWjUecVl4B6i4S7mYucmZycSzbeWmG0+6ko76RLPndZpbGpxoPoAkafTRecya+Opsi3e4L6F6YDP+fne3qmMnScWdZcm4s6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=a9f/rksl; arc=none smtp.client-ip=88.99.38.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="a9f/rksl"
Received: from relay12 (localhost [127.0.0.1])
	by relay12.grserver.gr (Proxmox) with ESMTP id CD720BDADB;
	Wed,  7 Jan 2026 11:32:25 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay12.grserver.gr (Proxmox) with ESMTPS id 195B0BDAA9;
	Wed,  7 Jan 2026 11:32:24 +0200 (EET)
Received: from antheas-z13 (unknown [IPv6:2a02:2149:8a28:c200:d3b7:ad8f:8409:f496])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id E966C202461;
	Wed,  7 Jan 2026 11:32:22 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1767778343;
	bh=LLgDhuaVM/fZgjSS/Fk6VDadJhAiPpmdkN7aqgVYqiQ=; h=From:To:Subject;
	b=a9f/rksleGIpIDximLTcEN2O7jFDHSIZIlmpFsuCWIvNajEevsGR3OsXbcZkLgoOf
	 uOQNDQR+3S9DjNrsicsTXb7321toULB7X1Rn34q1bjPJm6zUsfqPFEsH0Z2/vrNLTg
	 P5jYE4hP1ibkrTeZo+ndBnn3+IgD1Xthp8D2cRKVTB4UZAYlxH0FN1gJNhlnKVawrD
	 1p1Fgag062VcY8TjqAYuY02blSLQ/ayLEv1wv8Pvk8Zkmde8+MQyriSVsYrjluOorp
	 mTQIkGlF38ZVglfflcTaW8iyN/NhFGMfbGZ2fPiLb+XhTpcgCHFsJJsAj70eBM7L0s
	 2oSYniLwNLUlw==
Authentication-Results: linux3247.grserver.gr;
	spf=pass (sender IP is 2a02:2149:8a28:c200:d3b7:ad8f:8409:f496) smtp.mailfrom=lkml@antheas.dev smtp.helo=antheas-z13
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
From: Antheas Kapenekakis <lkml@antheas.dev>
To: Shenghao Ding <shenghao-ding@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	matthew.schwartz@linux.dev,
	Antheas Kapenekakis <lkml@antheas.dev>
Subject: [PATCH v1] ALSA: hda/tas2781: Prevent throwing away custom
 calibration addresses
Date: Wed,  7 Jan 2026 11:31:34 +0200
Message-ID: <20260107093134.583873-1-lkml@antheas.dev>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <176777834377.631754.17229081706721839465@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

The V2 UEFI spec for per-device calibration data in TAS allows for
manufacturers to specify up to five custom calibration register
addresses and values to optimize per-device in factory.

A basic description of the spec is found in a comment in function
tas2781_apply_calib(). However, currently, for the condition of
p->dspbin_typ != TASDEV_BASIC, if custom calibration addresses have been
provided by the manufacturer, they are ignored and the ones listed in
firmware are used.

In case the manufacturer chose to change different registers other than
the default ones (r0, invr0, r0_low, pow, tlimit), this causes the
UEFI calibration data to scratch different registers and cause the
firmware to misbehave. This is true in the Xbox ROG Ally X, for one of
the firmwares, where it pops and has audio dropouts after the
calibration data is applied.

Therefore, add a new bool to indicate that UEFI supplied custom
calibration addresses, and if so, use them regardless of dspbin_typ.

Link: https://lore.kernel.org/all/CAGwozwFQKoQgo_Q=qdr-FTD+uoVWA8AtHyDmKwTOV4ZU6+F3SQ@mail.gmail.com/
Reported-by: Matthew Schwartz <matthew.schwartz@linux.dev>
Closes: https://lore.kernel.org/all/0ba100d0-9b6f-4a3b-bffa-61abe1b46cd5@linux.dev/
Co-developed-by: Matthew Schwartz <matthew.schwartz@linux.dev>
Signed-off-by: Matthew Schwartz <matthew.schwartz@linux.dev>
Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>

---
@Matt: can you kindly verify this patch works for you?

Then verify your sign-off for the coby tag. If you would rather a
different acknowledgment tag (e.g., tested-by or suggested-by), lmk

Thanks.
Antheas
---
 sound/hda/codecs/side-codecs/tas2781_hda.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/hda/codecs/side-codecs/tas2781_hda.c b/sound/hda/codecs/side-codecs/tas2781_hda.c
index 96e6d82dc69e..6efdf0a3442b 100644
--- a/sound/hda/codecs/side-codecs/tas2781_hda.c
+++ b/sound/hda/codecs/side-codecs/tas2781_hda.c
@@ -64,6 +64,7 @@ static void tas2781_apply_calib(struct tasdevice_priv *p)
 		TASDEVICE_REG(0, 0x18, 0x7c),
 	};
 	unsigned int crc, oft, node_num;
+	bool custom_addr = false;
 	unsigned char *buf;
 	int i, j, k, l;
 
@@ -104,6 +105,7 @@ static void tas2781_apply_calib(struct tasdevice_priv *p)
 		for (j = 0, k = 0; j < node_num; j++) {
 			oft = j * 6 + 3;
 			if (tmp_val[oft] == TASDEV_UEFI_CALI_REG_ADDR_FLG) {
+				custom_addr = true;
 				for (i = 0; i < TASDEV_CALIB_N; i++) {
 					buf = &data[(oft + i + 1) * 4];
 					cali_reg[i] = TASDEVICE_REG(buf[1],
@@ -151,7 +153,7 @@ static void tas2781_apply_calib(struct tasdevice_priv *p)
 		}
 	}
 
-	if (p->dspbin_typ == TASDEV_BASIC) {
+	if (custom_addr || p->dspbin_typ == TASDEV_BASIC) {
 		r->r0_reg = cali_reg[0];
 		r->invr0_reg = cali_reg[1];
 		r->r0_low_reg = cali_reg[2];

base-commit: 9ace4753a5202b02191d54e9fdf7f9e3d02b85eb
-- 
2.52.0


