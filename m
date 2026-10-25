Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792970371;
	b=DHXu2Jsn6wKdX2lS8a2CPaFJiq4O8DY/l4USKSVaz57+WRQr2eyGyXnSm1Y2rUvIkj1B
	 LrBK3oRWiQEnM+BHqvWxY8JxhQ4x65FBUfkxoycT6jHl71eHXXiDURQqrcBGC6rlaqAuM
	 ahjAfT+6XGDavOvaJ6EM0NF0XzpJnzfJCJFdiMUb6VhLqVPZGkwCmAm4aEoVrDPCDaJRc
	 0DhePQH/0J4fyolF8R2IZ/q/xv15QQ43Lr/UhJm6jN+4A0OLJs24dFWE5wYVriPiktzM1
	 kO4i3HVwYTt0OF1LPHnEDRPhqP9gqoY2YHBQZ1MSacBqD/SLAIwDgLQPFarOS0PeOzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792970371;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=98JX+qzH39LcxZEAoy/41LxAE7H0jhKnaaOevXX8J/0=;
	b=nxwZvjClMVvMkBnDx9fOgViZxv8hJDS1My5uZ2lTkMvUjadZFMNE3aqP1me2u8VxQyyk
	 XVqZUvqx0WyP7b87DKhjYcVqYKv3FHylyfidieUmBae4cw2/V/QQEnDEBLo6YMRar8hjA
	 W+mqyYV1AQY9cttUwV7l+lDq9zGGBlezmLcDxmcFuPEB1uJwugR0MVorFoeY6mJBRQ+yh
	 xyLsPysgmvmG/O8a43hv+FOl7RO4Z1mCoxmgqQ7HwwJeFKu7v9tiLqcCHXGca4HtWR6Nv
	 3lNIUERowmW+7WFOmeNYEOYFPwButXXbm3n3mo6dNd+01hQ6C0h+h0FgHj2ppSyhyow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IRzWjBZ5;
	arc=none smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D9EC606A31A
	for <linux-sound@vger.kernel.org>; Sun, 25 Oct 2026 23:19:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D9EC606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IRzWjBZ5
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b40fc523faso2608061a12.3
        for <linux-sound@vger.kernel.org>; Sun, 25 Oct 2026 16:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792970370; x=1793575170; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=98JX+qzH39LcxZEAoy/41LxAE7H0jhKnaaOevXX8J/0=;
        b=IRzWjBZ5kqOobrRYzabxpQCI/V/Ct+3DVmtvvjw2X3HjyY0s+ED2mlOkDUd2vzMHPg
         7Nff35K58HafSFcFWtUAATLBbZ1NqhPyIb6AXlOjRZMaiadYo1c659eZ4bDUlOoppgs7
         n3njsvu8bBLXJxkSN+9QV0sxVLyp8vh+dwHtHI7AJFPklMBjWjOHn222QdC4f0fiqMm6
         Gj5hU++G6pRR+tQQOVE+xdiC2bq+l7Gu4K8VdFTWpOxCGqZZrpE4jQYs03iW8hB5MccZ
         UiDUJkDYbP7N+g/3UiInbCtwwrD3AQrzNZ76Z7+urzzpo6Ctv4MrlRMbTpIwVDLmyggU
         c/Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792970370; x=1793575170;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=98JX+qzH39LcxZEAoy/41LxAE7H0jhKnaaOevXX8J/0=;
        b=pM9I4akA+JOcbApOR7xkmbuBB5o1yNsfI6y/AjrGKOJgnCiwhcrXn52T/aDIkmNpF3
         k1hLDr9STH2Pl1ig3i+yolgL6+6ye5GmApkRjLctIFGvNkNAIFoN90lIwaJOZTTCDsPN
         neUr1hHO0rz8Ur+hnI9JQmRYVaOW/J+36NcJmTa60s5XFoKuxvILsZ5uZHZdSrMcAr+5
         yLf1XjZq0j2QiO0No4YJDv8X0OoPRwNuPCOBfSsHOhD7hb1fqyZ4rc/ybt2Pj+SGUIH0
         H9g8HqMBBQRbifJHqHINx4bNM8M1MPmRDvBh2XRbdc9qPN3BRRX+DOkoRtK379e5J3Fi
         EfDQ==
X-Gm-Message-State: AFq9FYLGDqQT6OFdDcH+qj3VxnJkWOPIbWnTJm35R/SwgKO+vu1FVkUZ
	hLz7p4U/0ojfUB9QY04LtJMfbOoVTee2qky9kZ6PXvQQnHklNkCH0l54
X-Gm-Gg: AYBFou3ptGv23SfnicQvoZOY8Yqwin40x0LYF6tJurgmv5lYJA8vJG7aGQ7IWC+6R1f
	ulwRj8bUW+bW3zFtYhd4XZX2qX+/7utDKpKztlVnj6GJ0mYfF/ozJJar8Fs07LZD+sWrMduNEku
	pt1P5ck/fRJOizUi+Zw+uqDyxRF0MojEJ0592jI580H9xFUm4w+gg/BUnUKy+jQGIBEh3CACXCD
	ylBkvI8r/aJIp2hXaxzTxL5kFFiHY/148H9KPlqxatb5UJKigW5f2C9aENzA0EAgA4Dz718lBCF
	2/CVZZn3rtxdRe1Q7IFRSDPXOjQmQnx7GrQ+1H+kwpKwL+rk0ioc/rJ9tT1k+pwvsVjuSRXV0Ud
	bq5rnWM8twxFO9Xq8cDoqL5TG0Pw1c282JQlw9XYgOV6xQLm8aCUaTtEO+5tXx8+myYbmqBTyxh
	91FoDJKXJQPYt8skWc/T6OdFRooBFz/iXVqj3J1N9SgozSzsmWwNYzNkijQMm3wlT1Ql3r8RMli
	SoxOC1RSymZgDu6Uzwg9r49OpiNZ3spNZo5lMlVPpEtRPsP1MfF7Vug
X-Received: by 2002:a05:6402:4405:b0:6b4:1629:b1aa with SMTP id 4fb4d7f45d1cf-6b442a87d34mr7302224a12.2.1792970369657;
        Sun, 25 Oct 2026 16:19:29 -0700 (PDT)
Received: from arch-pc.lan ([185.141.180.16])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b44598480dsm2776514a12.24.2026.10.25.16.19.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 16:19:29 -0700 (PDT)
From: Denis Kulikov <dar1knessx@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Denis Kulikov <dar1knessx@gmail.com>
Subject: [PATCH] ALSA: usb-audio: Rate-limit URB submission error at stream start
Date: Mon, 26 Oct 2026 02:18:49 +0300
Message-ID: <20261025231849.148149-1-dar1knessx@gmail.com>
X-Mailer: git-send-email 2.56.0
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

When two USB audio devices share a USB 2.0 hub (here a headset and a
microphone), there may not be enough isochronous bandwidth to start the
second stream, and usb_submit_urb() fails with -ENOSPC. PipeWire keeps
retrying to start the stream every ~20 ms, and every attempt logs

  usb 2-1.1: cannot submit urb 0, error -28: not enough bandwidth

On my desktop this was printed up to 94 times per second and flooded
the kernel log.

Use usb_audio_err_ratelimited() for this message, as commit
2db2be5607c4 ("ALSA: usb-audio: Rate limit usb_set_interface error
reporting") already did for a neighbouring message in the same file.

Tested on that desktop (X79, Linux 7.3) with the headset and the
microphone on one hub, starting playback and capture on both for 20
seconds: the stock snd-usb-audio module printed the message 580 times,
the patched one printed it 50 times and suppressed the rest.

Signed-off-by: Denis Kulikov <dar1knessx@gmail.com>
---
 sound/usb/endpoint.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/usb/endpoint.c b/sound/usb/endpoint.c
index 9c844c55a..8dd0b3525 100644
--- a/sound/usb/endpoint.c
+++ b/sound/usb/endpoint.c
@@ -1642,9 +1642,9 @@ int snd_usb_endpoint_start(struct snd_usb_endpoint *ep)
 			err = -ENODEV;
 		if (err < 0) {
 			if (!atomic_read(&ep->chip->shutdown))
-				usb_audio_err(ep->chip,
-					      "cannot submit urb %d, error %d: %s\n",
-					      i, err, usb_error_string(err));
+				usb_audio_err_ratelimited(ep->chip,
+							  "cannot submit urb %d, error %d: %s\n",
+							  i, err, usb_error_string(err));
 			goto __error;
 		}
 		set_bit(i, &ep->active_mask);
-- 
2.56.0

