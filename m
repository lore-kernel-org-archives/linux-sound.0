Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795421785;
	b=mw7xXum8OMvmQQJowcXx5H5CnZSgMongPN7bHCznPTSWmdDW4wPlvYC4eufogp11pmbZ
	 ED9bFmeoTdf0zUEzF8nTYtQZuBbdHaJRkVCjXhbi/rVy0uLep2KN3T/IcbC71EGM0t3FS
	 /3An/gBI7hvf1JLZbEaQjIf3w2TQWYtXhVJVdlIqJ4RpWmNUiklv5VfgZ9Yz5MfEaKrFu
	 v5N0V5eVhMfNnNWjuSJO/XXpAe/L2+GmlrbcTsgxJL7dqBzLL+JsPZsR+cUt4XWW9QiWE
	 ZbMl1vjiAVubnIwJG95U9zWhNSE/PU4xpCTXreXsWOam8KWwFLTI8NZMN+QBt74igZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795421785;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=g8hNu3XEp9H8toI6pO8IxcoYM5oBAj4h71R993Xof8E=;
	b=2wt+JKRoAVBnVwen5a7K2z1SJINWEtKK7v87KJWHmqgstN6h5WffoYeEJjGg9en/I5v4
	 RC40szJWEzJG/b4BzLH68D9IhLLjmcLhO/68mOG8ffyKd7Q00ZI2eMG/4JMxv7vxD9NsI
	 YeOuSu3hhduL/a7euU7h7UPfrDxyooeL5LTKOyrUckey7Wo8TSxRT1ozO7PxoX7T4Flny
	 Pdkcj5BVIjDtP66fvY8Suf7WQQemuwgfxJtz6waujJre2F1VGdYlg2zNyvuNgOmQg80x1
	 HVwPBmo/PH4AUgKMWaXj8gcsxhQYgNcYtGtA5mkBtGXHg0kbHI/+ZtDzanNYUHE87Nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xdJgMCX6;
	arc=none smtp.remote-ip=209.85.210.46
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 797F1606A31E
	for <linux-sound@vger.kernel.org>; Mon, 23 Nov 2026 08:16:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 797F1606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xdJgMCX6
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-85c1135c286so2504155a34.1
        for <linux-sound@vger.kernel.org>; Mon, 23 Nov 2026 00:16:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795421784; x=1796026584; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=g8hNu3XEp9H8toI6pO8IxcoYM5oBAj4h71R993Xof8E=;
        b=xdJgMCX6L+HgSSeh4POsbIr4uvFMi+IZtHWOB4lAjF8rqbDv1UDEE+/ZJuGcI3tZg7
         G/LhbqtRVmmKar9J6hbMy95x7Am/d6/p9etkE7na6MjVxTrU6TK+9YB8FElXtGvRTv94
         rVlpUZ6acrUYf4f7ccQwI9O902BtWKRPF4MK7CuBJLhf2JAoCGbp9BjobDrNHuWWgNNS
         75jRT+gILjcsF2ZuxvEsuO7vEzcINBRAkqPlYre7cx1LCyLoZCv0LmAfYdoUN6FCoHlH
         CEnM84n8B0RL5KbO86ZQoKC0Lv0HBE89uHzT3lUw7Ftz1qy2eGWpqXWkSFVh0/kCdFL7
         PKTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795421784; x=1796026584;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g8hNu3XEp9H8toI6pO8IxcoYM5oBAj4h71R993Xof8E=;
        b=HpRfBXoyP1npcAb/EsHILMjQax21sHclYx6V5r39GL4owTIglOG9uBK7WCO5EOcP0W
         LL6KNdi4Wkfkm8xPVDibL5PXLXy5asB+HYxLdkWjxW725lgIhaD3Wj4kMY3hKZRZgLAj
         vJ67EYUOWPr6F88sM1nMAez2bB1vvsd89RDTmJpYpS6zpQBgydu2YFUkU1JpZr99abJA
         RFE7sE72r/Cnu1dpHSQ5FnsTVAU1faZQMOV/uxf26y7cgLi8Li6Tl4ynpIaOedYRJb1v
         6lp8Sp4UKQm7fH75EYknWORrNvAN5JCTdSgM7Kxt9VLNYjuNhpQ2luXg7ZA4MeOJq3Ku
         YO6w==
X-Gm-Message-State: APuU4Z85fUGAoP6i1stl2DIcSd9yCfRblR5DWUCjQZiYjyMY2VxApQ9A
	3LAAfXeH1fYfwDXoyxAuBizr6ZiDZpYQZcQTB/52pI3ja8NdMUNGaTwZ6WcVOHvSViU=
X-Gm-Gg: AZFdTZfukjoZXeF6kWbpUU3auSy8Rwp/9qLYnGZ/5545NgJ8YmeMdQIpvy+ZNuZPWuJ
	KP3JOQqgzswqe5cYftIp8tOTjCCT1r02y50EX5Q96TiXCWWD3bqd1Z5b7z97nCZW2BI3ryrSt+o
	bdK6I22ehc0QZpjtpsSK2/b36P6M0iT8I/q9JlYqk8gS45PnHntJUPRC6nXbKtPSTC0UJEOocZ0
	FlDnq5rcEk6u5TMJlue44g0xdnhG74HKLJuBW3t4Wk5dcP3/67Bzk3Y489UiOWYCwE/QWIAbKgd
	lzspCOTWBHnjbOjOH/G01MDW0Gu7so5eGh2Tw+Z9O5UJMylShLSU2zrcne3MxetPt+fvDpWe5YE
	eaLrp6wuMhrmJc3VwG1UzhKMHKcBbbRPPd4Rr+Cgz4ei6+0wev0Nhh7YFJRLO4Us+quIGCqN+1q
	JvzVpu8QZVbX64iS25/D24GIGVaqxV5FsTdW2qut3e3gady9bY8gOHyDHptW84dT+R9xdH4i0I7
	aEgXHfV1UyGc2JGp2DKPI7AwcaXP2gi+o0mCMxYtPJwGGUNSLtE8K7L3qGpn+PiaSw3WxtvepBf
	bay4wka43Tq+HZWpK4zkp1yqUg2R3LSZWF4vlNOxMOdpXkDC+Dz69QgT109jMo48OcEUdbfsB/+
	8NCt5iDeO3jSYEPHQf60=
X-Received: by 2002:a05:6830:43a4:b0:862:9239:b5f4 with SMTP id 46e09a7af769-86315a0a4e1mr11670774a34.28.1795421784336;
        Mon, 23 Nov 2026 00:16:24 -0800 (PST)
Received: from OmaDevCom.lan ([155.116.157.152])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-863168dd6e7sm8899375a34.12.2026.11.23.00.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 00:16:23 -0800 (PST)
From: James Barnette <calmasacow@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.de,
	perex@perex.cz,
	James Barnette <calmasacow@gmail.com>
Subject: [PATCH v2] ALSA: usb-audio: Add generic implicit feedback quirk for Elgato XLR Dock
Date: Mon, 23 Nov 2026 02:15:49 -0600
Message-ID: <20261123081549.2237366-1-calmasacow@gmail.com>
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

The Elgato XLR Dock (0fd9:00a6) returns digital silence from its
microphone when the playback stream is started before the capture
stream. Starting capture first works.

Enforcing the generic implicit feedback mode
(quirk_flags=0fd9:00a6:0x20000) fixes it: with the flag set, capture
returned valid data in both start orders, while without it every
playback-first trial captured 0 nonzero samples.

Add a quirk entry for the device.

Suggested-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: James Barnette <calmasacow@gmail.com>
---
v2: resent with git send-email; v1 was whitespace-damaged by my mailer.

 sound/usb/quirks.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index a4eb0d0cd..7bb69d3e4 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -2681,6 +2681,8 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 		   QUIRK_FLAG_FIXED_RATE),
 	DEVICE_FLG(0x0fd9, 0x0008, /* Hauppauge HVR-950Q */
 		   QUIRK_FLAG_SHARE_MEDIA_DEVICE | QUIRK_FLAG_ALIGN_TRANSFER),
+	DEVICE_FLG(0x0fd9, 0x00a6, /* Elgato XLR Dock */
+		   QUIRK_FLAG_GENERIC_IMPLICIT_FB),
 	DEVICE_FLG(0x1038, 0x1294, /* SteelSeries Arctis Pro Wireless */
 		   QUIRK_FLAG_MIXER_PLAYBACK_MIN_MUTE),
 	DEVICE_FLG(0x1101, 0x0003, /* Audioengine D1 */
-- 
2.56.0

