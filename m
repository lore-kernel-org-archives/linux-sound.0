Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794143058;
	b=3GVmFOyvgSgdXSRnw8qlC1e6Lq/1AeglGUoy6IgFhbL814Gds3Ft6GNLNh81ubbhG23V
	 g8yL3+GgOYrqamgWkjVSnfHZT/+3cfyTKmALaDCfpRYlUK5fCvWVWhuS+21vd4na556M5
	 IXJp6FpVTuL+nYvg6BhnkenXvOL8lciwk9P/LLLJrzKKdlXO1RlbOpN4Zh39aC9+YyxzR
	 DbPZdBYq49nC+yDDx4Ko3LDxEr2suqW/WZWPcPnYqjWzoRV+o0MuVgO2AjXEQ/GzlBmyW
	 g0fFcFwdGPS5JCO3pqK+HJk0K4Wb1vt8+IjKdP+nEZ/ZlpajVSV+vkBIrFvhB4yG1kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794143058;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4MBZrSo4M2t6N6LTFd7oh2D/UR4KwQa3fw9of3KWmhQ=;
	b=OAQ2rwGFxexLR8RFp49oavRrf1EqDu7WTslIcZUczuHgrxPeoAQNZIcy3kYOO1oG+qEl
	 1Kv1xOeCizca9g1FP9swCZ8l1VgRwsnwOeHQPXMRdAA/sVCxyPcGPeQ2F1hfdoE5XILqv
	 mzGHnVmWSnXhi7WLWzAgfoF+I18mnpwjoEUSSECjMwV2hB/cAC70Du8WDxXQOFUGNQbGZ
	 fLoD5xGBnQ38a3dtq9FNvm1JZRmfxbBnmjVtWMHxrFMgXn/4jIOIAOZ1hy5t9K81s0ila
	 4E/YvgVrONGU9xL2MfLXUSLsFhaz5bGyvFn2kRMELudzFlQTHeCBZBKe2jhCpS8WqEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=krqUXuTo;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C972606A326
	for <linux-sound@vger.kernel.org>; Sun,  8 Nov 2026 13:04:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C972606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=krqUXuTo
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1ae18eb9ad0so78711c88.1
        for <linux-sound@vger.kernel.org>; Sun, 08 Nov 2026 05:04:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794143058; x=1794747858; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4MBZrSo4M2t6N6LTFd7oh2D/UR4KwQa3fw9of3KWmhQ=;
        b=krqUXuToA8NftREId/ZTGELYn0LhCa5N64f3JMhNCgce8J/aFGRkH7V6Gccqq0oiBF
         spuf8tNEyPQ/Qgh/fcOLegL5JZemPn0rqWjKDoP9kUb1/2SCuhwWNIFWFle/tgY5NZRr
         vsPo4r3PAARSuETs0mguI3HRnNwesMgXRJDqq7DA5bMrSrJTTepfQFK9E/7IbJ8CxBYz
         8Bv1H8HuZCUdg9JxDW90JlrhCzMTgQ6ba5XyDC0x3MX+gZQHBP1v6WrHIaw8m7c0oY2P
         EK3yxGw8E77XR14edVNauscZR/857P0pNKgIAr3IVfwAmmQTDV4lsX00e412opv2KQ7j
         +3yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794143058; x=1794747858;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4MBZrSo4M2t6N6LTFd7oh2D/UR4KwQa3fw9of3KWmhQ=;
        b=1/iPPa1MbpMl9iJWPnvisMIWK5xBcO9KAU6leNJJa18fCB7siDX8zYJP7UsyFPdN6v
         7nPfvhPPil+Jw2x3ffuE5k5brWSGb5twYvChjWkbJsChM4BwXOAwfAcVKKVF11GJWV6w
         dgiyrquMdeYfRmsaXBzHsQW+4Tvi9ruJDWnu9k3BG7UIwUcCxwoF2z56/8DwNKJbfRF6
         T31FTIuunvINwFI2WodKRLxqSP+/dYpQoHFK3X6X3zScdxu7X/1kpBj3mCO3jboHxszZ
         53BlXp2c9cpI+AnvXtjIocxEgWsYmoi1hosWdS3qP99DJDEw6aZmkzo+GafjzSlXkfBr
         mdow==
X-Forwarded-Encrypted: i=1; AL+hErE7A7xCoIRsFMb1fkGWVCPNlSoveTflNBE8DNOiXNklG47xVvudSDRPNBit2J2Pg0cFgWWv46hajX1VSQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z87oUnDvv/1YlsnHwZQf/Qdb0OR71r/IKaFc6AJJjwlkIiied9u
	jbN7tYUkaGwouDZVIiartgxr1x4904l733t+qmZcyn0MbgzBmpols9le
X-Gm-Gg: AYBFou0tFDumjILSA6rJDl5ASVUF76GL7/ox3l4eOha3i7sLsClG04IQOgjIFsFiT8O
	k8ydkSJM8hCVrDEwjEiux1UzxZeHJU8IvHtQcbKvwb1zK1amQBOrw5Va2WZ7zYPJ9JgELhO1bmn
	XzPlo9YZ0YZ4n8v8W2CBeGOw1waPkxmzonRNbKP9MAmk5BgQHV0ta70lkkM+euspEsZzfomL9wL
	ohe1HnYrGa2+wcPs8OoD/M1GK5KVCkG4lSHLOAlrR8ikcM8sqFLaX4wQ5znyZUvVVKa/rH9qIiI
	CzS6hIXSLeqOCBFuGqIYjR2mnXjMxpGDydasspzPX/9Qn1JauFCLtg7TokIsWoVtQiWaReg97ZE
	RAj5SbtwTCm9iI5RCSJaRviYT5ZKpA8VF2L2ekFWBTlE96Rexv0OBr50WvVqKvOIJe2p2mBTTk3
	yeO/77aSNn0C/861P7UR2j+9LcNQCY3WxPB7s10ZVPCPRPFEupqEEtLQ2s7XfVkxvvAxQNvbcLn
	ozq1n2h+C4BRQGQwOUGfe3fEjoYje5donRVtGATDmjeUJsEwZ4SpBBTM/4iOg+UmCOkcjdgRACr
	GHNccH0jNopwq+ClJWwdrj7xam8PlSfTitKtQYUT3WBlVt0xQdpwKR0=
X-Received: by 2002:a05:7022:3b84:b0:164:4e36:f956 with SMTP id a92af1059eb24-1b39fe876bemr2336578c88.16.1794143057605;
        Sun, 08 Nov 2026 05:04:17 -0800 (PST)
Received: from prts ([103.156.242.195])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3755e936bsm6603194c88.6.2026.11.08.05.04.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 05:04:17 -0800 (PST)
From: Xinyu Wei <xinyuwei1024@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Takashi Iwai <tiwai@suse.com>
Cc: Xinyu Wei <xinyuwei1024@gmail.com>
Subject: [PATCH 2/2] ALSA: usb-audio: fix the format bits of the Steinberg UR22C
Date: Sun,  8 Nov 2026 21:03:03 +0800
Message-ID: <20261108130303.387288-3-xinyuwei1024@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261108130303.387288-1-xinyuwei1024@gmail.com>
References: <20261108130303.387288-1-xinyuwei1024@gmail.com>
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

In configuration 2 of the Steinberg UR22C (0499:172f), the capture
AS_GENERAL descriptor reports bmFormats = 0xffffffff, causing the driver
to advertise U8, S32_LE, FLOAT_LE, MU_LAW, A_LAW and SPECIAL even though
the hardware only supports 32-bit PCM (S32_LE).

Because playback is implicit-feedback synced to the capture endpoint
(0x81 on interface 2), hw_rule_format() restricts playback to the active
capture stream's format.  If capture is opened first with a non-S32_LE
format such as FLOAT_LE, the intersection with playback's S32_LE-only
format mask is empty and playback fails to open with -EINVAL.

Clamp bmFormats to UAC2 PCM (1) in parse_audio_format_i_type() when
chip->usb_id is 0499:172f and format == 0xffffffff, matching the
existing DS4201 workaround below it.

Signed-off-by: Xinyu Wei <xinyuwei1024@gmail.com>
---
 sound/usb/format.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/usb/format.c b/sound/usb/format.c
index 4830f9f93..7ca2b5d5c 100644
--- a/sound/usb/format.c
+++ b/sound/usb/format.c
@@ -57,6 +57,11 @@ static u64 parse_audio_format_i_type(struct snd_usb_audio *chip,
 		sample_width = fmt->bBitResolution;
 		sample_bytes = fmt->bSubslotSize;
 
+		/* Steinberg UR22C workaround: config 2 capture sets 0xffffffff */
+		if (chip->usb_id == USB_ID(0x0499, 0x172f) &&
+		    format == 0xffffffff)
+			format = 1;
+
 		if (format & UAC2_FORMAT_TYPE_I_RAW_DATA) {
 			pcm_formats |= SNDRV_PCM_FMTBIT_SPECIAL;
 			/* flag potentially raw DSD capable altsettings */
-- 
2.56.0

