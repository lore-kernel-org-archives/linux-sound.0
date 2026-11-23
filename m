Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795396464;
	b=hNLc9KR2nZ8NyUEJzFsrLog4wN7RzSWGOyFJWy7ylZBohYjB4BvvtUR0wV3wgOB+YZiR
	 kiBLR/4ThXpZaSieGG0xHNKUc6tYeZAUykgOFJe3zYmQpvycFrF2AAZBlHOF9mUjvM/BA
	 Z/Ep76/tBiiPnU9Lja64D0jZnyBp1j5PF9s42BgFeNLenwMNr/UeI2xTvS8L3oGeRrPCZ
	 hdeC4se9QzX5f3bvU9RH+jRH/cGN4AM2LmowTqc2OC0X0GRGv2Iulxo6Vl4s0DJ2B+RgX
	 tk//dOqx89SrbY+VBDcBBX2HT8f4YJAiqT6R0xYnCiZOJFBiIOUF243stPzX9kiIqSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795396464;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=CHXXmkVwlU35isuKQoqN5mwPu5Ltu0MHi54EypRJlu0=;
	b=FNFafeotVGfk71bOPIiH3X6JtuWfvf/oAH4seBHSViUJak4C04kGX7MSZAT1WFndGnx5
	 T9/lpXskP6m9m6p8mV2knqTodRfC97HYaw9yiZ5+LZwwEgfl/2DhR6ekMJLr2ieV3wO3M
	 fjfJjN6hSBUMaeyBh8Sj0f9Dlq6h7iGsHGd5wQdlocpQ73i4SvGr2IJedEG/14fQbm2Rv
	 WDVkwGRZbeOyNm4RcOOvFLlDc+E57UH+XHSVNDCGrhcariPjn1ZCggUyscvCVLs17TJjL
	 n2w9KQG40X8GuSHVPJwoazIz31ERSvZjZi+kiuG4wzzfu5WCI207/ayfuN2v2LhezEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lLYfZxYM;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BA11606A33A
	for <linux-sound@vger.kernel.org>; Mon, 23 Nov 2026 01:14:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BA11606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lLYfZxYM
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4a358881793so1334019f8f.0
        for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 17:14:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795396462; x=1796001262; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CHXXmkVwlU35isuKQoqN5mwPu5Ltu0MHi54EypRJlu0=;
        b=lLYfZxYMSWmA1kHYYVmuloqDhwWyKpx9LPpB+YnK6yqlB4mSQb+5Hcpwr3kS5Rhzbn
         qISBeMDJC0bUkBW6N1b3qVISFlGRiAeSHrxg3qSnGKzIRAayoEFzuw6zw3z5SZ3IUZCO
         Cxb7SEcv6Zbqy3KF1ctTkGA8MmIB3MgaNPZIflb+43G/b0jAblyNdwvWt7fW1ycS6OiC
         cJ9ULSCo4wW8wmN2sE6o6CUVYbsUavY9pB3coDVMEHG4JIQw83wWyK1AqokgK6GqjtQz
         ESRspAsHGyGiRCDu6cDyR1DV1JOs1wows42eauZ5Z7f5QToolN1t7kNBfNxfJTnUGPuM
         hqmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795396462; x=1796001262;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CHXXmkVwlU35isuKQoqN5mwPu5Ltu0MHi54EypRJlu0=;
        b=AhjNVlM+iC9xJAdB8ya6L79BVg14dqtCnCHUgJxBy4ek1WiL4Eaf9SgwkCk58DncAD
         LRd1a9QI+ovPbrwFpsBiMbGD73mj8Xk6ZvJM7CysyFnmzpszMxxovhYqIkTaMGQ1fBDA
         veqbJRKl109DFJp4tcpob+Mj3VU1NSgM1n5LU6Zu7B/L8XJK9nsS6zyPB2EWxEHssmvq
         UmKquSCFCtCjTvJxMvTrghEvgcrcePD7Oya+j6Gfk2EA8A1A/Ywv/v9dE6zL1eIILFjF
         MfzOM2S6InkO/2dSgVFOX0zKdDN1ueWZJ1fksi3WDWb5t90BZzsiKeykge35QrVn/hCR
         ja7w==
X-Forwarded-Encrypted: i=1; AL+hErFDfehMroJxwNW9U92pmQ+cSYTd0XTlv4vIlKH0LIDgAAqmytMB62pmDDiAMlrMPrD57gMfXe/P5WbhBA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+AramBdjbrDzre533hXyXE04WFC2zSyb9ii9bRVFArp46zvxoT
	MpuNJUH1isDOobxPypqWDokJFWoipHDNMUCZWpWoCUuG/dwvNfDJUjO4z+W43w==
X-Gm-Gg: AZFdTZc1SoKOxonsg2G20lKHyer02aw3OVTdBUdaI2xPY1XcTonw6ZwFt06OJKuw1Jl
	z7kSnQcv6xo7omN7I77bI0gVPfFqDN3OF4PPIOjoKD5uBk0Ova1eGDdco9d+hB/kzD3D1Yzy2Pc
	cK8Hj+tmQjS9bxgq8tAjRJVhtk05VparG+6XmPSPR+TTTrvEY4E3nrkElrmPl2tWG4j2nUcr6QN
	0ftInCaO6q4JZLJpKU6EVDyMKtmOcI2AXV33YV5QPSrRW6U0A5n1xeh+QV+vI5Nnpu7lmyIfuuz
	6AIaf7CJU562T+WNVCMtnamUw0kpKKpIGhwbjn93Tc6gUiJR9OpXbos22GDpzb7NR9p1fRKda6n
	OvqwIl6lbAwX4dT5/HWOGY+Oj2CzIInAhnqEEsZJ98PvG0u642+vqMLjcnFicivyrVcla94FGFC
	Pq/SsgokI43kaUIZ1ZnKFlWNU1r/JRM+SKkrQibibosWMl0nV58uoQj4a7IPCAqqQt4BA83WzFv
	gl1m9LWN0R3duZU92T6QIB3BTb/6d9uCWjVFAF8vTfNFsB9YSqzctYj6JlIIUZUGHqNMwhMQkBl
	ufw2VMWpkFdIwb0MUQLlmGznApOJ/GhJ+zb8HA==
X-Received: by 2002:adf:e009:0:10b0:4a9:2728:fdfc with SMTP id ffacd0b85a97d-4abb4c7af34mr12900963f8f.28.1795396462348;
        Sun, 22 Nov 2026 17:14:22 -0800 (PST)
Received: from unknown.m0rf30.ray ([2a02:b027:11:deba:33a1:e72c:924d:d172])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4ab6a67f281sm18046903f8f.22.2026.11.22.17.14.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 17:14:21 -0800 (PST)
From: Gianluca Boiano <morf3089@gmail.com>
To: Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: usb-audio: Enable native DSD for Fosi Audio DS2
Date: Mon, 23 Nov 2026 02:14:01 +0100
Message-ID: <20261123011401.1545242-1-morf3089@gmail.com>
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

The Fosi Audio DS2 (USB ID 262a:0001, Savitech controller with a
Cirrus Logic CS43131 DAC) exposes a UAC2 RAW_DATA playback altsetting
(altset 4, bmFormats 0x80000000, 32-bit subslot), but ALSA reports it
as SPECIAL without the DSD_RAW quirk, preventing native DSD playback.

Add the device to the quirk flags table with QUIRK_FLAG_DSD_RAW, as
already done for the ddHiFi TC44C (262a:9302) using the same vendor's
controller. With the quirk enabled, altset 4 is exposed as DSD_U32_BE
and stereo DSD64, DSD128 and DSD256 streams (88200, 176400 and 352800
frames/s) play through it.

Tested using snd-usb-audio quirk_flags=262a:0001:DSD_RAW on
Linux 7.3.5.

Signed-off-by: Gianluca Boiano <morf3089@gmail.com>
---
 sound/usb/quirks.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index a4eb0d0cd..7b359a568 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -2801,6 +2801,8 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 		   QUIRK_FLAG_SET_IFACE_FIRST),
 	DEVICE_FLG(0x25aa, 0x600b, /* TAE1159 */
 		   QUIRK_FLAG_FORCE_IFACE_RESET | QUIRK_FLAG_IFACE_DELAY),
+	DEVICE_FLG(0x262a, 0x0001, /* Fosi Audio DS2 */
+		   QUIRK_FLAG_DSD_RAW),
 	DEVICE_FLG(0x262a, 0x9302, /* ddHiFi TC44C */
 		   QUIRK_FLAG_DSD_RAW),
 	DEVICE_FLG(0x2772, 0x0502, /* Musical Fidelity M6s DAC */
-- 
2.56.1

