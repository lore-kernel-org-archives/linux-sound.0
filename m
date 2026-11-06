Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793990433;
	b=VlNIio9KsQbPxYr8m4e6VA/kirkVpWLS/LSrVIPBA3aB+xr8ugyZEwWaq45f5MJk6l89
	 4j+H3S3ITXPLSx1sr1lF4jO0djxggEYjlwi9RKzVoKrZvjZJ435obaFJ1SF2okX7CGHxA
	 MNlT5KM5xdj6jNaFG7BU9MCOuN/gWBXlEXgnUSjWPF0f3t3qtijSH98F87N7wPtK83kq5
	 T+hQaNe012FJb+6i6F6uqI1LQjNfEW9ngp6zRU6Xgi2fYe6KBV15xM87iPijmU5Mabogo
	 A+GtPSaevEOc+AwxzJlstgUm4Sc7zVETsDRx0Ua+hcHunu6Zwds33ZVbeaO4Qa0dejQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793990433;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vYU0Cu9JcID5yAMPzRs7M2je5qmnSyymlx29rhLddj0=;
	b=PYP0hVlniTwaEW1AE5dar6Q1OpaTp7PXOuD6jiCUmvRxcs0/14kYG8ByvlR/QmVHJy5u
	 0Kv0gZktxt1RaAXWtL9ceoK+xjqtjjrTsD6yBtZ52XUau9VQZUks00bpyqDgrXsX9EM0z
	 ePtKWERj8ioIf8R/Cv+03DrNnP1p4BjP18X37wkmLfTIifBRDe/bZ6dtExe47rRfjUDdD
	 2PVGD3rhB/++OquGLSkjPgDSZzuShAbvmx/RkKASiuaDf+DiDGEFN2un7GiXvoyz2wNFE
	 O1mby1tsNLqRGU+MTnGHVi6OpM6WeTVrNy8UVbc9QzposHUxSyt5YFC7rEj/baTSrkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="PvwzG6y/";
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D17B606A32F
	for <linux-sound@vger.kernel.org>; Fri,  6 Nov 2026 18:40:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D17B606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PvwzG6y/
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-15ea896ddc8so1720588c88.0
        for <linux-sound@vger.kernel.org>; Fri, 06 Nov 2026 10:40:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793990432; x=1794595232; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vYU0Cu9JcID5yAMPzRs7M2je5qmnSyymlx29rhLddj0=;
        b=PvwzG6y/YoteN55M2ufyriOBO9fAs1HgQDFd/ZHL5f/c0XP02ly9n/nRbcfNkRJlwk
         5CMXaj19wn40oRxXehlYY6qHL/xY1NAaq16Eua28DKpHbb6dlbL9+4uuGvGorWz6oNZC
         WoyFas5fM5hp3/ZLLiCpZZIVW4YQAMW6+a/rLWLv0FvpUNK8oAN2gF+o81NYA4SF5jE9
         PdB/PA7IYCeKe8JJ01Aar2bCi6n85H4kQ84P01jpWLVDw58Ny3/9fOOQIlMzQWtKtf8g
         R/CT/bkJGlHmm7ZL/mlfQs5bTJOBP+YwkSm5Y48DZKTihiwSOMtA3tSzstdC9SGZtA2Z
         HObw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793990432; x=1794595232;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vYU0Cu9JcID5yAMPzRs7M2je5qmnSyymlx29rhLddj0=;
        b=mWT/hp4VWHb8Y3m8uOUdZTfqoE8NL8t33TIdW+ZyMrstGyHpwZVM5GZ0Sux9ff3+0l
         jMO9CxCoFl/v4sTtszpCoZMv0fqd2Vxpptt9fwN+6SYwgiuWDqIAtOFpocHuLlaUYVX0
         4J8ckyTvRxraGABWdF0BUma8JsCStRxQtlTsB1Edi2+lvZNdw3yykGMDpMVuEQGJK9oi
         UJhOIid810ymcyGdjfNYyCZZV62AlgztzvD9PdFYrgRPWYEyVUzYNjpQGe2C7jPB1IMj
         MV4XfSxWWq0OMNKwuSqiGaeqiWGjdXf92ZG00TEAkcMX2FKHG0n1HlTgKr7Zu/ICcxrZ
         Yfpw==
X-Forwarded-Encrypted: i=1; AKwUvBy8LbVj6BHhXldOLxvRUrPx2Ck+vk1+r/pqxJLqcAf6xtOXhP1/DcpXRKxwjVv5QU+tI6Vyyf+glgt19Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z+oH+fF13WPKMVH1RonZmOzCK9ZxKFOMxQhz4qxtg6EpNfbkS5o
	lmfrdMROHp6fWfsDr/7leuRobVx5GkVGeUfCgA0qQ6iwXjpUIQrsMG0i
X-Gm-Gg: AYBFou2PI/4erGMC428APBeQ2n02vSjC9o7PBGt+VUi6QRs0YNRjzDWubuAbOZmJjtu
	HlvF0dAtf2/YM5aoNhbXyxKA6XiR9DDgDxLVvKiKh0s5PgSadh7Oj02RAcfUjOVykykxI9E/E9B
	J1KYEEg3Fw65YCpfrUveOMkNRb9Vg9OId4ZLKSF0tr+djNmxRsBvC9bR6DrWu57IazBRg6yNlHz
	r2cYj4c1D5y4QB2zDaWx8PHiDuR1dzt44C9AI3pI3LJLYZf9PUmwymyx0d8UQp1Sbr5JL0fEqZ2
	hDzJJ6ScNVKs8mWwRLvw4UV0yG1MjXc2FnW8jmfNjL54HHSKGLtdVHMSreeCDZwmZm02hWFNTKa
	3WgYdyICb5Scaizp14NCam8rNv6eeVgQGg8tjpbNv3BRiSM2XrKZSsGgd9ind6KarzXMmTH3Z6k
	p889exfXfh1ycCObGW+v5NIREg96qxzbC9Jp2x2DITykBAN+KJS3e7F8xQx9sFknFD0quBkIu1q
	QHS/5RQehMaIdyY84FBYryQBoW0Fk0Ms6AHjbd3+M4pmBQv/fXVe8hob3ISDmSmZ5tFIpbVqfNd
	rQb8CnptDpBhRrJIj0IJ2FKzoRc5rPINSM+ZVVAhT8/6XYRNITyk
X-Received: by 2002:a05:7022:2206:b0:144:eaa7:2763 with SMTP id a92af1059eb24-1b25d2f7959mr4976305c88.16.1793990432426;
        Fri, 06 Nov 2026 10:40:32 -0800 (PST)
Received: from localhost.localdomain ([103.177.253.113])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4879adsm8622836c88.6.2026.11.06.10.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 10:40:32 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: sreekuttan2156239@gmail.com
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	tiwai@suse.de
Subject: [PATCH v2] ALSA: control: Synchronize LED mode accesses
Date: Fri,  6 Nov 2026 18:39:53 +0000
Message-ID: <20261106183953.2762-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261106180812.5097-1-sreekuttan2156239@gmail.com>
References: <20261106180812.5097-1-sreekuttan2156239@gmail.com>
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

mode_store() updates led->mode while holding
snd_ctl_led_mutex.

However, snd_ctl_led_set_state() and mode_show() read this
field without holding the same mutex.

This can cause a data race when userspace changes the mode
while another path reads it.

Read the mode under snd_ctl_led_mutex in
snd_ctl_led_set_state() and use the local value after
releasing the mutex.

Also protect the mode read in mode_show() with the mutex.

Fixes: cb17fe0045aa ("ALSA: control - add sysfs support to the LED trigger module")
Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
v2:
 - Add the Fixes trailer.

 sound/core/control_led.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/core/control_led.c b/sound/core/control_led.c
index 501387287ae6..044430b2f1a2 100644
--- a/sound/core/control_led.c
+++ b/sound/core/control_led.c
@@ -140,6 +140,7 @@ static void snd_ctl_led_set_state(struct snd_card *card, unsigned int access,
 {
 	struct snd_ctl_led *led;
 	struct snd_ctl_led_ctl *lctl;
+	enum snd_ctl_led_mode mode;
 	int route;
 	bool found;
 
@@ -168,8 +169,9 @@ static void snd_ctl_led_set_state(struct snd_card *card, unsigned int access,
 				UPDATE_ROUTE(route, snd_ctl_led_get(lctl));
 			}
 		}
+		mode = led->mode;
 	}
-	switch (led->mode) {
+	switch (mode) {
 	case MODE_OFF:		route = 1; break;
 	case MODE_ON:		route = 0; break;
 	case MODE_FOLLOW_ROUTE:	if (route >= 0) route ^= 1; break;
@@ -382,6 +384,8 @@ static ssize_t mode_show(struct device *dev,
 	struct snd_ctl_led *led = container_of(dev, struct snd_ctl_led, dev);
 	const char *str = NULL;
 
+	guard(mutex)(&snd_ctl_led_mutex);
+
 	switch (led->mode) {
 	case MODE_FOLLOW_MUTE:	str = "follow-mute"; break;
 	case MODE_FOLLOW_ROUTE:	str = "follow-route"; break;
-- 
2.55.0

