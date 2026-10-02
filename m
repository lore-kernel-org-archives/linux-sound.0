Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C90440B0E0
	for <linux-sound@vger.kernel.org>; Fri,  2 Oct 2026 12:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790945598; cv=none; b=m/doiwdLm1dveXDZ3RYc2OSJ/jctRwVHCKZT0jMOZ1uqyNtE2iE6iW1rfskuAWeXwYLyY6KZp7B3tZp+iXeQkEdCg1Ff8bw3I4/WHWDwsQ3OT9xpt6D3B2E2c6s3RWBqiDUXJJuL9BE41WmoORvJXroQ+93/2hlbQP+VH58pgXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790945598; c=relaxed/simple;
	bh=eh5PIscU+wqIvETjjZmIaN8CThOGA5D1j/AP+B7hKxI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dFmubiJcSr95VWhVcmh82MTS3bJDXRBxi9HIrub0n/T3edUmy1bSJZtVRdfLk0LKj2lQBwPbgRR61ldEuop1XATfQTE1eJYbAnMtRWAPEA/uiiw6SJX06L9ApP8we0eFf+Ocas+sAdU35HjO6Q8h2kUx/6SOb+zEoGIp0oiqOJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S5K/5plx; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S5K/5plx"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-4a003bd18e5so74915e9.0
        for <linux-sound@vger.kernel.org>; Fri, 02 Oct 2026 05:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790945594; x=1791550394; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/zdu8MDJvkbwJwm2QasBYaz3WvhkNlsGnwOm8ZhVtx4=;
        b=S5K/5plxjMYH505k8+iX5mdPRHwt6thXeKYUq7KhWHFDLqRijydhTwXk3kLFakfuJu
         lJQ16PdcnL1srILl/weoMvX70PtzLkpKSRM8NfMBhT97CsjZGaTyy3QQHp/Y6int+kDO
         k0oZVVCEK/k+OAcpSvM94DPgtC30Di6lQJulNUvaPT6Jg5bfVObhkCOP0Lz+Ys8Ax/PL
         pFuHHHBdSZaYAiDgYn53vjeFY1X143niS6CZbznV9sPqrpy2CZCF7NGzVXgm7/trMJ1N
         iRJmyAMtMR73McpjpWmEyIzAxjj+dV+t/G2XrvyagPk3XxqOIum5L4IWU5HYPelWJPdb
         xgcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790945594; x=1791550394;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/zdu8MDJvkbwJwm2QasBYaz3WvhkNlsGnwOm8ZhVtx4=;
        b=NhkCsI2Fo++L/WjVbqPS8gizS7zTtAoCo3FQ4wbVz01vE+DWtBINzM9wLynog95TNw
         xz2Pl8PVEQinsoHZhd3gN303Wwv2gmAsQm4AYsVeOni1C4QOncq0wxTGDnJIO+JX/OyC
         Xl/ojAKG345/q71JIQyD4SIz2QCE3OUO5EDveyz+Bq2AKdO46C21aPNSIErb3Ql+dJg/
         xKs9NHbZIm87d0uBNVS9o6I43chCB14bKBMW8V5pdFVGw7P8NEdJGWwfoHxst+6pwlJ/
         sXhAdBlHOiDCLfrTzc6fVsCyxBKRTj8/+d2tGwEbza6M/aEYgwg1dDhfYjpMH3QhCqnk
         jcgg==
X-Gm-Message-State: AFuF++kAg/GR4NfHTYM6inWNvVUoZqDKwYwNJ1T8hc1AvsRQO30b6VP2
	aAqN9CP5dyxAzmKas4qZn9Geni1G2O6ID11gTRe9YGDne9WYyFQhuGFD
X-Gm-Gg: AYBFou106kjl4zxzxrIAr7+wjqkd13DBOx/gXmYNwSNUi1hoGZH6QAP7U3UlR8thNwF
	xdFNE8RRfbZA9fB6mMf5Ni2eeWJiq+gdxvypxu5K/GG2lh2Al+lqdpllFjHbLhg6uPqhVWcNfXZ
	LALhZwi11N5yOmk49whRoeEDPDBye+g2LEtrB1G5XKGIoLDfovz2w+vi1tJItz6436GPZZvz+SW
	blu/sW3bkCvv4le534YcGyUuYDDo8Vv1+ifxlodPyBx8kJ+YuN9rLSUC6/YiMvNa0CqAD+/EAf0
	rdf84TyE6K7w+DqDSwpwguyOKHMDnINAVOXLsHyXdLq2e4nk8PPaoYp+nz75Xpa2Yvw61gJeKIs
	pJKRGd6x5o5bcCW8NWjMW73ZEXHbTF08Nz7mVsV6PV4nmPaeiLutow0Rs56q6yVdYQ1K1Am+DYI
	OL4BV2u+xO3yYUAO1vEU2bFmAFim+dEi87dCrXpRmf4t5ZbkIf3TsP3HEeCNOyFvBPqLGlzfPOU
	XhuB8Pg
X-Received: by 2002:a05:600c:6094:b0:4a0:2488:71cc with SMTP id 5b1f17b1804b1-4a0276b2222mr41860765e9.32.1790945594307;
        Fri, 02 Oct 2026 05:53:14 -0700 (PDT)
Received: from thinkpad.. ([2a01:c844:24b3:f700:590:d876:1636:b79b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b82253e5bsm5054351f8f.1.2026.10.02.05.53.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 05:53:13 -0700 (PDT)
From: Matus Gajdos <matuszpd@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Matus Gajdos <matuszpd@gmail.com>
Subject: [PATCH] ALSA: usb-audio: Add native DSD support for Cambridge Audio streamers
Date: Fri,  2 Oct 2026 14:52:37 +0200
Message-ID: <20261002125237.82188-1-matuszpd@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Cambridge Audio streamer advertises the UAC2 RAW_DATA format on
altsetting 2 of its playback interface, but without the DSD_RAW quirk
flag the driver exposes it only as a SPECIAL format that cannot be
used.

Add QUIRK_FLAG_DSD_RAW for the device (USB ID 22e8:ca10), so the
altsetting is exposed as DSD_U32_BE, enabling native DSD64/128/256
playback.

Tested with: gst-launch-1.0 filesrc location=file.dsf ! \
                            avdemux_dsf ! dsdconvert ! \
                            alsasink device=hw:2,0

Signed-off-by: Matus Gajdos <matuszpd@gmail.com>
---
 sound/usb/quirks.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 38d78b8345f17..6176acc04c6e9 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -2730,6 +2730,8 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 		   QUIRK_FLAG_DSD_RAW),
 	DEVICE_FLG(0x21b4, 0x0232, /* Ayre QX-5 Twenty */
 		   QUIRK_FLAG_DSD_RAW),
+	DEVICE_FLG(0x22e8, 0xca10, /* Cambridge Audio streamers */
+		   QUIRK_FLAG_DSD_RAW),
 	DEVICE_FLG(0x2522, 0x0007, /* LH Labs Geek Out HD Audio 1V5 */
 		   QUIRK_FLAG_SET_IFACE_FIRST),
 	DEVICE_FLG(0x25aa, 0x600b, /* TAE1159 */
-- 
2.43.0

