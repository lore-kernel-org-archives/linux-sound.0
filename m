Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794147171;
	b=5WSRD3xJrpaGt2Xm8JNuE4zHYTEdrQHgCBIYdvQj2CLomvjImvAtBct3R6y8siEowKw3
	 FBpjsry+Qqi1+hTMFGJIJXcIT+6g7O5GBLGCJOwx/UB1sGgjbEfqQgRfJZsDJwJtt8ILi
	 /78z2FrQqSiPULFTKaJmgFM0ExisbNdEza69c3IKeRnFQKaXEBXvgQXoZgkT6dJXeAYjB
	 xDYi7NhQ+SLdY23y5nXmsGNie5USV3EhoO3d+GVpBEM/aSXmpwY0+4KBbo3wBZyWv58pB
	 d1ahMM4SEndLwAeGbQ7DJncb/19iBaaUgA7myMGa3wQa6AvjlPEqPKAAJD8vtwPWdeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794147171;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=uSSk0bKUkcjcG0gJgABgCHhEs7yY+bzoe8xVb1xTnAg=;
	b=Mpex4BOWS1G4nON2rxlKLuH4KPigwu6IYGzIfj35w13C8sbXM8OT9f0eOtyhzxxOcMg1
	 oTl6nATSg/GO4J1POn8mFzkKtgx6N4ykOKp8vCyCphl0bn3xIRpsi6HBX4PnhzkjOR/rZ
	 chDTwwHjNL+r45vRq8rqXf2JtbKQYfKG/LjF7dO7gLTbmiZG8PCq7Xk2kf5lp67Ft7kQl
	 40kH/sfZCtNtu0ccvDpMCKKLeiBYaKwt173Be9rnPkxf7/4MShhJNBxJuAm4ocew/n73h
	 H0JKMj3/FGj4O0G+Ldu8I3CU5Svr3mjkb0IGgVaV9Jne6by7Bfbx43lGhniojmp/P5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WEbMSuHE;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C9F8606A320
	for <linux-sound@vger.kernel.org>; Sun,  8 Nov 2026 14:12:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C9F8606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WEbMSuHE
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so220768eec.0
        for <linux-sound@vger.kernel.org>; Sun, 08 Nov 2026 06:12:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794147170; x=1794751970; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uSSk0bKUkcjcG0gJgABgCHhEs7yY+bzoe8xVb1xTnAg=;
        b=WEbMSuHES09bwoRhQ7hK4a8ZNXV8IyjAhVxVvjLewgR86byiwrTKX4TgxaWo928caa
         3Gpzhy+gwjrIyMuenvS2DroTwCJM8KoPXsMzbN1jQmgMs+PJzHlxQjnKRja7XcKq5VS4
         qOzWgc8YJsGWDxB4iPzELXhW8hqDnVYaJGjqObZiJ42ZKFb74yOcPth9PhT8hP0INdlZ
         cDYVBGmXmLpIqbx5JF6+EDVyYbJ7TzQLx3gBeBgS4CEUZCwHB75rFWvm+G5YZfJwtJRg
         UN+SWOjTNX8h4JyS2tBWjIKtfDwvcmqLAu9g1+yPg9YWD+9TJ5P8YwOeSMN7RWlxF29i
         r7TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794147170; x=1794751970;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uSSk0bKUkcjcG0gJgABgCHhEs7yY+bzoe8xVb1xTnAg=;
        b=ZuTrsAEiLarq19k2md3ARjoY5J31+jX1ryELya2p5S2maWZKvj4WRuQeKTMGYHGLf7
         cGzGnV724rjqgr026x+MlBUzRaC0jh3FYdIkhqkCoKt9g9OP99TwL2/Ml974x+g5PlDU
         2XEMqCeKeRu/KZUmRlQQbcc8gh7u5iyk1CtxX+xEFnKV/c+ebIk5Di5NY4NNoqvSskAG
         dkgrnyNocmUyH2BlfOFjT+zZin6yjU+JA8HB51lz+yjfiQxaoK24XosYfilUmpuUFQnG
         8BjqQVKLUKV9DuSmPSGg0ScGcxRGcRP4hOZ9Za+CnDX4dslTAiX3vSOxasJ5CX90jLRW
         YvKA==
X-Forwarded-Encrypted: i=1; AL+hErG3Z4qH/jYa6f/mUja/EWGzJoJTm7n4xO4yJziZTxs/QyqRuoObpO3Yow+8Lrx4Q++R4yzQGntEeVjtmw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+/MqmnZlpenz54LmaRRr9uLh8RjXKQAQVr1ID/ZBvBtN2eXwQl
	QrbiaCvDy7s/RWV0tgKr6kLrrcofxh1cEAOeOfWLqAb7kf7QTZhgUTov
X-Gm-Gg: AYBFou33ZadMVMwFT24mb3LrYsDljeanxtUNt3ls9CQilG8eJEVSAWnpYZzn+fE/BMF
	oFQh/HWGf2Zns6ixNrsvnieVRmsE3EDxCx32Qmuk+7J//iy2J7ieGa4w23xlzKgnf49tIP2bMpy
	3JioZEjUYPhIoicMda01144vx+EWH7P1LIxOUkXCpsGeQfNF8hrf02USwqdpP+lAa/xBty7rJmX
	QkVwI997jnQZPeBh9hpPnNDPf4bHCbwVWVSdMr1Z5OVIAkgbkemxo5thyYeJwrdekkpY8wltgiJ
	oUyXO3vi33h+p6aOVmUzZSICxSOfTtYnTLRQJpPoWMf8Yq5DMrSiokJRehHFa+FeXt6Xncfw8bv
	EgU+4o5LVjkZmmzXJTiZNH5/U0pvI2FAAYLX0j/pm9o5GcG75cwghmTrUTLRtLT15BBv/JqKGoA
	B/xqflUNosd7bthq9lCunUmT6aVo+KuJmjkZyaXLbq1Aj0Zy/z38J/Ry88Hu8vPxT+9E0A6q2aV
	9BEmQbzGC+gHh/8DlpUSS+QNyKOgJgXnpBQMfrKa+bMNcGmVwqKnDAOhJakq3BVDz44PVLQoLyS
	A8LJVDCpztZiB8Q0NEnY7lmzziW3+vuR4m9bIaMax1d/LDkKhEc=
X-Received: by 2002:a05:7301:231e:b0:351:29c8:643 with SMTP id 5a478bee46e88-37256bf5b4amr2999631eec.18.1794147170185;
        Sun, 08 Nov 2026 06:12:50 -0800 (PST)
Received: from localhost.localdomain ([103.177.253.80])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37265619774sm6081353eec.8.2026.11.08.06.12.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 06:12:49 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: tiwai@suse.de,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Subject: [PATCH] ALSA: control: Validate element info in compat ioctl
Date: Sun,  8 Nov 2026 14:12:19 +0000
Message-ID: <20261108141219.7655-1-sreekuttan2156239@gmail.com>
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

The compat ioctl code calls the control's info callback directly
in get_ctl_type() to get the element type and count.

Unlike the normal control info path, this code does not validate
the information returned by the callback.

The compat read and write handlers use the returned type and
count to access fixed-size value buffers and calculate copy
sizes.

An invalid type or an element count larger than the supported
limit can cause these handlers to access memory outside the
expected buffer boundaries.

Call snd_ctl_check_elem_info() after the info callback to
validate the returned type and count before using them.

This keeps the compat ioctl path from using invalid control
metadata when accessing its value buffers.

Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
 sound/core/control_compat.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/core/control_compat.c b/sound/core/control_compat.c
index 87f7ad5ab739..cad00d4aa204 100644
--- a/sound/core/control_compat.c
+++ b/sound/core/control_compat.c
@@ -183,6 +183,10 @@ static int get_ctl_type(struct snd_card *card, struct snd_ctl_elem_id *id,
 	info->id = *id;
 	err = kctl->info(kctl, info);
 	if (err >= 0) {
+		err = snd_ctl_check_elem_info(card, info);
+		if (err < 0)
+			return err;
+
 		err = info->type;
 		*countp = info->count;
 	}
-- 
2.55.0

