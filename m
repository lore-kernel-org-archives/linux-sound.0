Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792984622;
	b=IBiTnUlAFvTCWX8Qw7rW3McH0R9R+KZrtqJ9K7QKdowEnYDLgW+O2ws3kYo5oNN/K/PK
	 gnvitm1Zg79uLGWj+Hh/dYHKfccOrb/jmBeNk+1kVaexG2yJ6FJcUanfb6bPinnvWhwfo
	 jnI2YRAvyG7GZ+CaYxKihb4jjRtfXyyx88efKoTh23o9qg32uqPZbX3ekJ8B9MvjxkwWF
	 ZVNHMQXrpDvlvfLNsUc0UngX/3+I1rT06+LouPZ+4SPFqfRO9bkE9R9BZZnH5YTIRgDtH
	 +K+ouv1XWBS5LF9JExdRJXoYNnJYhuk0TiJqzS9pAht+997Q0Y1bx2jZSREc3SzfQrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792984622;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=NenYAvPhHWZ/46YV8Jd0FVOjzULAh5TeHzIIJT0k+CY=;
	b=BSIgNjfbECurQyoUp4uJuoDZm19poeZXa+7aPW5ZPfe5dBGVkNBwnakKKbb5ZoE8LJ5H
	 9xGSvR2piPnRkGrtzXZ0170jyRpS2PkuARZxWzhybr+JxUzkhbcdjLm6x4SCz/4KaPDc9
	 vk6CmrMS3D9F7/Ri+NOYW2mREmirFjDBx+2V99nRzdgF7sZDeoXeic1Iw2AshYJKCZu9a
	 R1jKQKa9m/NWne+7qEHpFftWruva0rxDE4fqes3RAtxtyhNYbqKzB40LD/78m4bS4hcNj
	 AjaNJXF/DcrJpygVRdCAwTYlAIB1bDECEKsrjqLCFuyd3K/ZUNXvFM6iYw5gKvslz2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="dt/NcDME";
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C24AA606A31A
	for <linux-sound@vger.kernel.org>; Mon, 26 Oct 2026 03:17:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C24AA606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dt/NcDME
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-369f33df08eso1972295eec.0
        for <linux-sound@vger.kernel.org>; Sun, 25 Oct 2026 20:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792984621; x=1793589421; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NenYAvPhHWZ/46YV8Jd0FVOjzULAh5TeHzIIJT0k+CY=;
        b=dt/NcDMEmKOVELO3Q/Q1vfpogzrtSDRawkNZF2nUDqVOK0ZfZbYAtF7bXQUI7ZRuHg
         n2vzRlq8J4S/4KMrkjt4KWJEAhyILUHUo02eIA0SHcCfUlL3Gfc6JDVl7ZEmx0tHc5lt
         ltktK8K/E7TEE7xEgH1I93V4kyXFCs8HiCqpau4Er/jhmT7/n4KSVhSfLpolHh5oC/sM
         xFht5j9RcAid8x9GyoxOj0Bf7p48ar5mGW+QATZtMqMDCBwa4+hTZxO3ZG9LhjLU/vm5
         JRi0Pq06585EogMEZMr12rC/E+AmJky/RRN8tgJWLp9UtBn3EP4Muaks8zIbhZOe+ThT
         0vJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792984621; x=1793589421;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NenYAvPhHWZ/46YV8Jd0FVOjzULAh5TeHzIIJT0k+CY=;
        b=u+nnK+qmienpZN2HmQfbSmRGxCiDtbV+vAn7WHYtzNsatSeZRqGlBIdkPjChPLPg0U
         kE0Vccp1oWKSSNZ5hza3nVOmNBIejYyMiqZweQxhKhEkH5kY/TwfO0buArEoVJH6q9vR
         OERPgTvrKv+pvbW0zoye4vFwvOMIy4oVGukI+vNCzaHFYqoJUBkxZHletFzl/PszTYkN
         hrV2R8y+jnT3vTiJ8WTjsbyj3XBSGpCys7srcCAGidgxBOGt4PIeyXUdbq1Te+fVTjdW
         q03u4wAJo5qPu9E5kgUz/0WJsoDvhMzyxZY0p1jwYVKTmvraBU1mRs3CWHoGV9kg2Ek1
         pd9Q==
X-Forwarded-Encrypted: i=1; AKwUvBy5T82I9WC8OdRpfoani8rRVcsN/S0HhiD6c9uH8FWJX4YaXYBO2NQDGx9kuPWgMLaymD04wOPzMlBdhQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYLg4/6xP0Kd8lisHgcWnT6gVlBANzDziKsqs3aGJDohvpTXCZXt
	VfdMymZBAMzpLgSGRj18cSg/CDmwH377MoROrRijuNlZJhUS8BKiZxz+Q1+EKQ==
X-Gm-Gg: AYBFou2QGM8Tsgud5h60cjtU9OejcehA7nbl0JUFUsuIE84IWwP8YwuRRaZ0HlREwsV
	nNR4eS/eLR9KAymeeUjteOtajvxqNhLtne6sry3rn7Di/D9xc0F4ZpbnTpN87ufSDp3lNCLfZFC
	Z8nX2NLzwSnSHy+j+s6Hd8c8n9MVzzZWDM16UDurY7r14XGo7Ykf7ghGiAbe/DXPax2sOy5JWNi
	GhHPH3XvTIwugkhBxusrvZNENCH1kSBz2fqsVXd/b6vDs9gaUD4BqawhuXTtf28VgWtSW8q6XAa
	SbEzEXdL4iVlQR/hBHfh3ie3fKElj8wIoFDVBHjD2iiyYUwyelB14rS67V/r+hJrhMZJkVL8gt5
	G9eLcIt0wnzqX0OIZ+HdmNf1LpY//GFQwwemnmy4UjpjE2CaTK4P7kaCQ4c3ccTuyoKCRZc2tV8
	AV3pZsYs0hUcd2RVleXTbC/Cr0HFM/MItNm85o07+/V8GpTSGtl8aQHj4R4VlrskshJoeE2Mpwo
	nQI/5Y4mr3JbV8aWWwkyyS+0MpCIPs5hqtSvuj/RwIqPMLF1R0wuhlCGwqorm9QU8f4jbTRRT88
	TARN0SeiVibEGa2/QpbUdjQKngV7ttUeoF+WSnpTXfG3CkG4brcKmLzxflukw+zp4K1ne3GqprI
	ZUAxjDzjrYSER
X-Received: by 2002:a05:7301:10c3:b0:35f:2858:aa4b with SMTP id 5a478bee46e88-369e8660376mr12281630eec.30.1792984620819;
        Sun, 25 Oct 2026 20:17:00 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec864fsm25485942eec.24.2026.10.25.20.16.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 20:17:00 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: tiwai@suse.com
Cc: ivan.orlov0322@gmail.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>
Subject: [PATCH] ALSA: pcmtest: Reject invalid fill_mode values
Date: Mon, 26 Oct 2026 12:16:55 +0900
Message-ID: <20261026031655.2699561-1-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
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

The fill_block() function handles only fill_mode 0 (random) and 1
(pattern). With any other value it writes nothing and does not move the
buffer position. A capture stream then gets no data, and a read fails
with -EIO after the timeout. Nothing in the kernel log says why.

Check the value in a set callback, so a bad value is rejected both when
the module is loaded and when the parameter is written.

Fixes: 315a3d57c64c ("ALSA: Implement the new Virtual PCM Test Driver")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 sound/drivers/pcmtest.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/sound/drivers/pcmtest.c b/sound/drivers/pcmtest.c
index d1b0dff56cd9..422fdb10f237 100644
--- a/sound/drivers/pcmtest.c
+++ b/sound/drivers/pcmtest.c
@@ -72,13 +72,32 @@ static u8 playback_capture_test;
 static u8 ioctl_reset_test;
 static struct dentry *driver_debug_dir;
 
+static int fill_mode_set(const char *val, const struct kernel_param *kp)
+{
+	short mode;
+	int err;
+
+	err = kstrtos16(val, 0, &mode);
+	if (err)
+		return err;
+	if (mode != FILL_MODE_RAND && mode != FILL_MODE_PAT)
+		return -EINVAL;
+	fill_mode = mode;
+	return 0;
+}
+
+static const struct kernel_param_ops fill_mode_ops = {
+	.set = fill_mode_set,
+	.get = param_get_short,
+};
+
 module_param(index, int, 0444);
 MODULE_PARM_DESC(index, "Index value for pcmtest soundcard");
 module_param(id, charp, 0444);
 MODULE_PARM_DESC(id, "ID string for pcmtest soundcard");
 module_param(enable, bool, 0444);
 MODULE_PARM_DESC(enable, "Enable pcmtest soundcard.");
-module_param(fill_mode, short, 0600);
+module_param_cb(fill_mode, &fill_mode_ops, &fill_mode, 0600);
 MODULE_PARM_DESC(fill_mode, "Buffer fill mode: rand(0) or pattern(1)");
 module_param(inject_delay, int, 0600);
 MODULE_PARM_DESC(inject_delay, "Inject delays during playback/capture (in jiffies)");
-- 
2.43.0

