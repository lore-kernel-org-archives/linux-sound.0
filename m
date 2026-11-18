Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794970998;
	b=GflOBUhphL9S+PAx+e5OsxZn7jB+gfX3thwsy05HkQ86x9aB3j9sdk8ZRY+6elU37lsE
	 imaBYlBDPRbYY+KVzVguW5nBFUvgg5qZeeU25tSY7ZlPQJGoH4YMvGORPhQ3yO9yNRw6X
	 A6ImcfTC4LjuO0U15gSvrSPG4UvTPhdMGwSq1631aR8JaheYzeEEGDS/YfB0h2jM4ZsbE
	 zX7FrSjC8cgEIp8ARJfwp66yXxqLWSHH/AcjDZHJQv47591xE9m+kT1sq20Hk6LWvNsYR
	 CHuxPgR0r4q0cvP0Q+Iakb9qtMj2oKICZuqrI2O0ePG9fZYX+MMHZa6bqZCYD4Vj4cA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794970998;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=fBCrL9CwR/iV865OiqbDISOqkewhbQFiFErZ1jt+IXE=;
	b=zuc0NAfCrDi99i+0DxF+SkZufRtPHKAJBd7Yo7FS4PS0H/XK9evTf4YDQIj8VzrIVzZf
	 K/Uamhdg1+elkX1ze6BB9/8Hkw+BaA1eXACF0rwXkxtugapPzKYgEveRY0VLWcUFPk0OA
	 Q+mCtAZpkVpn3A6INzF67e2mz7QWsfZuRcC4ymVg9gYJJOqO9yWFwBlYgB0sJEC/fo1Ij
	 LS6Hpf41XcGuAJEW0FFfOcD22Xn3ZHkYaXFYG5qYYRqh61FQkRU0jv4FGmyRR7oaYmhMV
	 8FXX7cqrtY723X4w6xcEa/eIB9lE8jQEfdV41zgyAUKQPXG016dIny+bd2RPEpmQn2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qXnecXy0;
	arc=none smtp.remote-ip=209.85.161.51
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC16606A31C
	for <linux-sound@vger.kernel.org>; Wed, 18 Nov 2026 03:03:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0DC16606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qXnecXy0
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-71ad5f20016so434128eaf.1
        for <linux-sound@vger.kernel.org>; Tue, 17 Nov 2026 19:03:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794970997; x=1795575797; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fBCrL9CwR/iV865OiqbDISOqkewhbQFiFErZ1jt+IXE=;
        b=qXnecXy0Ip+hPDxnaVuAUCJXtwGSaaE+SIaNciSAm6Wo6Q6JfYZbEFkAZYdi8s//zP
         G+sJWpN9TbnSyak/1ZZTomfA7BJLlGbP9T3A38ESuf8rYZ+Fd/VUR2e7oDM1hRPhu1r6
         DKY6u0Ea+AeKixSm3jAtGsfqxn86lgbUPak76ZPxfbzs+XNA/ROZTHO6HW3r9xQN5kdV
         //sK4ETL5i0jH4a0AAg72FB+xoIT6ebDuMWumUPbqq5igDsHmwXwfiKzGbGLxR48gCeS
         sN+um7RPYFwCHsaVMU4ar0FxmkCQBCe5stGhUTeqbvY1hj1gMUtzTCD2IUbQyYuWIZsi
         da9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794970997; x=1795575797;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fBCrL9CwR/iV865OiqbDISOqkewhbQFiFErZ1jt+IXE=;
        b=b9VdPkfHHNjwaanHigF0A/q9TwHwC+t7j0qsj4jwHVGDaCkY6jDE1HFzlKaxv8Okv3
         KNLnGcHAcUQuSetJ1rrooKCDvxsB20VDkBCIltz6Ow9p1omO6QxoAqjGgoKfl+BjvwHZ
         mowwaiQSB37fPkeOliNur1fY3UWCZzMKXfjfafim1SDuvJ2RYn0TZe/E/TTlSxoqJkkf
         7A3U5rl0W2sXrZsmRsOF5MYW/C0OIKy+2rcbw9pQv+6I4B/xExLT3QfeIZD2Oq8TyUM2
         1bsB3QnpcKsvBt282Wl15Ov6Uf8dB6ZGhF8nJWVouFkONb08bDkRZB/R1R2gME7LNfu3
         6FIA==
X-Gm-Message-State: APuU4Z/KCslf4HB9UmFssTHur7K0Y0npTrfGxBFiDy9DEZYw5qs8ZqGg
	MDsZG27q4EbycRAT++pRa7D+Mp/5f9bfGIRrIydQW1ooX2Jr71E+/HpYEovExIWncxc=
X-Gm-Gg: AYBFou1XmROnkJELdwxZUu3NOqxrIByRbWIR+gGUJ3OOJfHbezxNwKTG/RknhXIxKhR
	JxefM82TVEpfVxUbLO15IdhPi4jqJNEPUBwQqUia0tmvMRTqCB4lcezWffD4K0ysgcBFoq9EU57
	9Z6lXqvYoghdp0Kd3IKljEOKfsy+2VP7BlUTdZrj3PNcr/9Au59ZKs24tj3kgfec8aXxCkx9fI3
	S/gRGG4GJaa9dGLNCtD+sl4y4klZsG8ne6bEEvhQchU0yeVr/fXisEyjIOVZExpmiGl5OyUSaqh
	Z3A+K6AUXQHhk2qZT16H234X45ntbL27Y5sJ4TPESLAwjVYuMJ8+LTonyeJyCZpu1+QKpA4tMmL
	Ry3+X2dPv6tHNn4W2cbeD6C3Cauh1ZH2vXcemE9ME68duob2kriCtx9xJRS/6wEWlsVD8pzIb0U
	E76tGjMbaiT/MLlMc+YDWbNEl+hES/VHs5MMUcKp4aG9hkhdsnfMpmTZglsGYvpU+HiJ4ZnbQxJ
	xpNePTqib9uzMX4YtrfooSyw2qq+HbGI0IwySkoZFHDYVmlJxJjX3A2Fr2xcneo4IspVz2ofrAZ
	gE1gSHfFWf0WbQetQrR4S/cp5cfjWpABqQ==
X-Received: by 2002:a05:6820:7086:20b0:71a:f259:6359 with SMTP id 006d021491bc7-71b1886e678mr734618eaf.90.1794970996915;
        Tue, 17 Nov 2026 19:03:16 -0800 (PST)
Received: from Mirai ([2605:59c0:ab5a:b514:93f7:7281:8837:e771])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b18fbb9a8sm933520eaf.0.2026.11.17.19.03.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 19:03:16 -0800 (PST)
From: Dustin Tacy <tacydustin@gmail.com>
To: linux-sound@vger.kernel.org
Cc: perex@perex.cz,
	tiwai@suse.com,
	Dustin Tacy <tacydustin@gmail.com>
Subject: [PATCH] ALSA: hda/realtek: Add mute LED quirk for HP OMEN 15t-ek000
Date: Tue, 17 Nov 2026 21:02:54 -0600
Message-ID: <20261118030254.29314-1-tacydustin@gmail.com>
X-Mailer: git-send-email 2.56.1
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

HP OMEN 15t-ek000 with PCI subsystem ID 103c:878a uses an ALC245 codec.
The mute LED requires a quirk to work.
Enabling ALC245_FIXUP_HP_MUTE_LED_COEFBIT on this SSID.
Verified on my HP Omen 15t-ek000.

Signed-off-by: Dustin Tacy <tacydustin@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 96fa8c2782bb..d5e91a35a61c 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7779,6 +7779,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8786, "HP OMEN 15", ALC285_FIXUP_HP_MUTE_LED),
 	SND_PCI_QUIRK(0x103c, 0x8787, "HP OMEN 15", ALC285_FIXUP_HP_MUTE_LED),
 	SND_PCI_QUIRK(0x103c, 0x8788, "HP OMEN 15", ALC285_FIXUP_HP_MUTE_LED),
+	SND_PCI_QUIRK(0x103c, 0x878a, "HP OMEN 15t-ek000", ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
 	SND_PCI_QUIRK(0x103c, 0x87b2, "HP Pavilion Gaming Laptop 15-ec1xxx", ALC285_FIXUP_HP_MUTE_LED),
 	SND_PCI_QUIRK(0x103c, 0x87b7, "HP Laptop 14-fq0xxx", ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
 	SND_PCI_QUIRK(0x103c, 0x87c8, "HP", ALC287_FIXUP_HP_GPIO_LED),

base-commit: 63fdb511c27afcebce797e3db580b3534ddfa639
-- 
2.56.1

