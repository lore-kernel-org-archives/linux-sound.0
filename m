Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793984185;
	b=5rpveGUQtZiWIkzsvo4g0zRj9Y/MaH/8/Cuc5yfUx9wRiL9g/gf/gXR2UM9nYicTcpwi
	 rKsAo7kcJTz+w5kWmTxh66IefN7OGjXumtpK64DFcGNTeqk/ygHruSfg9ky1iO2P2yCQv
	 sqSz1kPUL/+96GAwvLP8tpLjTGcr71fg6QU3i0XQICR99ceUy3+vMj+ixDuwwAvl9V4ku
	 uxiA22AICWvSjeR94eF1nLV5+vP0gWEvzYatdOxs8AhBfPbXDVs2k+RalhiR71fDCPl5v
	 a9zdZebUOytdXjOb9oQ/FhtwDzDdrrhgnG8Co9Xj7ENhmJJQxPXMl1oPgrvS6fNA0Fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793984185;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=mildQKcldMkDmSjfhIpmMkbxI9eJlgqNxmqam7PIgl4=;
	b=LO1zCV5KrLGcQ7hhlwXquh0eGqOOGuBkLXOQhKSthC03BU4VJfVBCgpauXBdsRY85qrO
	 GNe+cAfyKdOBiiJmthw+I8Ea1DU7Sz6JAKFumkbycWlFXQp8r60GQZwpLmugly/rwJ66/
	 cefOM4gF/2QTiItJsfvKX209yH2CMWUjiFz7RvEcQ9k+KIdzlPAOQwqRBSDIetgWZ7n4D
	 0n1ZJFcRXI7xsWm1bRKT4Xhaq83FXN5JHi54YCwyjQG/mC86vJdHskfrx6YGEfB379Co8
	 wy3/QRmA9QCAHDn8nkmi13Vh1QvFhtzziP5IverZGobzKHCThkCpFtUlpUbz/ap24pQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZeovEfKr;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B16E8606A326
	for <linux-sound@vger.kernel.org>; Fri,  6 Nov 2026 16:56:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B16E8606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZeovEfKr
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1ae18eb9ad0so1212064c88.1
        for <linux-sound@vger.kernel.org>; Fri, 06 Nov 2026 08:56:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793984184; x=1794588984; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mildQKcldMkDmSjfhIpmMkbxI9eJlgqNxmqam7PIgl4=;
        b=ZeovEfKrzoVohaBy0IJUc4H9KVlLpncflAbI0M/vM/FEX4ib+VS82nn/U9FhwN6R7K
         2Hu1NPaG1TIKN+Po1IGjpPP00oyTmK0BhXmHKEVExcALNk3UPnOMe6hzhBIKsSpJ3NfV
         JC1tydh3s1j1ZtuhsHrLQ6rDeHnTDi7rrVueN9P6IqZWdi8dzMU7FEcWHRmLYH9g3UFm
         Fw9T+UOA3uMeTaF85MjXRIjQ3d/s7NIwwSOzFMRQ3yViMm9OshJ+jo2bu9Y+7dk/sovt
         0Mqz1Ifc7zUdA1Td8+dWcxH++JG4pvkjNa/MygOcsDsBql/jPXNf4Hpuv8AUnhJoSAbU
         dcZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793984184; x=1794588984;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mildQKcldMkDmSjfhIpmMkbxI9eJlgqNxmqam7PIgl4=;
        b=CQSY6qFoU/mWtVJII+9q9F2rRpNpsHGOxkv/rEWRmu7nuGid6HCFzWFztuQMpo0hyN
         fK/2Dg8loVjvnkNvrDw9LYaF/g2Z+5xuB+Dr+/Z3lwGKR0xE+m3QWdohKJI7n5R+fjkJ
         XjHXpKVRJOXF5dcJlhCn5FXPy17Z0fOZZ0UvWBmNtdQ9tAwefrtOEQ3rjVFsw2pvuRyV
         8CALdEZY5n3umSHvRmjkLIQRizv25ua7kz2NBpiDPskI9JaD+ryfG6LtipM2jrlRuPJ0
         LDjvzWLBvIsYcv3easgVrwBR5C9XF1Ee0hbHfCEfYjVH5NEL7WNM/9bPreWDIhSx/iFf
         W2ag==
X-Forwarded-Encrypted: i=1; AKwUvBwfHaHGAFC/M6m14jwZCct/hecA8SNEnJXYexF7dXHrqipiAGLWT45RWleZ/KPRoLvj4e7XpbgzE/JNAw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9vbehrfe8+lBUGBZpC259n0Ke5IXUpVVfRVkb2GVjBKd/5fOgZ
	iSC3VLXSdotTRQ/Q+CB7nBWgktPKtZVWc66fSZSAizadHdv7BNv3FVyQ
X-Gm-Gg: AYBFou0XMejayFDOf5nYmEQMdEQa8nSYYxRJDZcDhC1O6XX4mrjgt6JuWvJ0OxSllEO
	SZbPoXHUop5HyvTPjmt7qhV7c44HxnAggH4BbkouBOh/5lqruqKOY0/6GTM10Qxjt2g0UPN+Vwz
	N3N9sVZR5+2ZLYu0ForzXvMPWiNlD0RXGWgV3zQtPo5qmylu5uVXaBNCogXoU0c8H3Ox2gtBBaE
	1KjusPVY6LmHf/7bbYt+th7QRuYgm0hNTO+AFzBWeOEuuusPWngGrJ54+srq3CvTEaCHgK9Gtzo
	CcVeCZcLarKSJftM44IafM8U7+ymG7viWeZMT4NDXpPUcLwwq2/JycMP71g9edlaJHbtD16SiO/
	dgXjX45pgks1DkirJTvc6ofV3OiEesuvQoPYEqU+lzVedx04KWak8Yo9eBaxMEQ9MgBiv7mEy/1
	BQNCPlKqMVaMHca7yHpsrT71byKoEQgJGEQ2qJ4uklUcA7ZKZRQ3xvWwQgWfOk9vBVDun6NAjnI
	DhmWhP4hR9lulgUF+1oNLVfPOP+pVZjJBQZ9nUG4l/gZV8vY3dbnd3/E9/lgYrKNM6PNG538kz0
	dAUpH3OwRpI9g3R1ekkhi9LYT4f4t7Mb3gCcUYLJcQI8vOzJs9pd
X-Received: by 2002:a05:7022:96:b0:1ae:b906:7733 with SMTP id a92af1059eb24-1b25d329fc2mr3326367c88.23.1793984183585;
        Fri, 06 Nov 2026 08:56:23 -0800 (PST)
Received: from localhost.localdomain ([103.177.253.113])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4df114sm7329756c88.18.2026.11.06.08.56.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 08:56:23 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com,
	tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Subject: [PATCH] ALSA: control: Trim whitespace from sysfs input
Date: Fri,  6 Nov 2026 16:55:31 +0000
Message-ID: <20261106165531.4074-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
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

The attach and detach sysfs interfaces receive input from
userspace.

When userspace writes a value using echo, the input normally
ends with a newline character.

The parser does not remove this newline in all input formats.
For example, a bare numeric ID can be treated as a control name,
and an unquoted name= field can include the newline.

Trim leading and trailing whitespace before parsing the input.

This keeps spaces inside mixer control names unchanged.

Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
 sound/core/control_led.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/core/control_led.c b/sound/core/control_led.c
index 501387287ae6..a640e7835ce2 100644
--- a/sound/core/control_led.c
+++ b/sound/core/control_led.c
@@ -518,6 +518,11 @@ static ssize_t set_led_id(struct snd_ctl_led_card *led_card, const char *buf, si
 
 	if (strscpy(buf2, buf, sizeof(buf2)) < 0)
 		return -E2BIG;
+
+	s = strim(buf2);
+	if (s != buf2)
+		memmove(buf2, s, strlen(s) + 1);
+
 	memset(&id, 0, sizeof(id));
 	id.iface = SNDRV_CTL_ELEM_IFACE_MIXER;
 	s = buf2;
-- 
2.55.0

