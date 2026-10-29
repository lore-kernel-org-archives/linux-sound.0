Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793244561;
	b=A9mV3qzzk95ufOpA+8Cu2F9lI6aFAOFk3sNxo68CjyaEJKgNPF5+nUJ7YyK+A8t6rTuo
	 N6godjxm7TGjHFirjkzTSdZRB9J+oClG+Ak3eU7IpscC1ZghENOfYRk1IscThbuD4Ufw+
	 yxZ3/GSE9tk7LIsyAfsTJQV9oVw8uTAcBvxgD4pUGuwpFEu9CvdjdJt/J9fEixP3WLPpU
	 DqKRSCi6E1Baw6VmlGkS1kT89dKNaANnoqxSvnoUQ+QAK2Tnsvmv8ZFM/ulxCq0bm4mvx
	 neQmdohJjYF6pb3RtRj9NvQNGrAupg+lg+7hi6hxOFEDLUN1T7b+VBwPEXRkCFf2rMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793244561;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=r2lP39Zwrg6b6ti0XQBBmhYF5G4i5EE9mhv+bYMknKs=;
	b=1Iz8bEBg8KF/ASAsJOBUjZAwSdYHcV/yPwTvhgq55O3WvBIMu51xO7aHISVYeOB8Uv//
	 o2uwDBXrhPmxX9gPezru79ULaaHXA9reZygBF2MKaIUO8Gq95HGgNdO9XgoackEzJ+y1m
	 ey/gXaTqDlSHdYULxWcbFjPueKJnHcWHHor8yxgB2YwTeeYT/Y2YFDVGcwal8mzKdhSDk
	 6yfEtDNGpxhR0cuyQlkPNBLUeblDA/nnkZkBP7hS1Y8Aw7+TU+QwNRRUQvVc1VpaJrnKW
	 gtnwJPyDpDcdt0XA1H/UO0RGKcfdk927qlFmNshxFVBtDumdCfGMFqM+kS4Z6mnkF+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FkstOb1a;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48AC1606A31C
	for <linux-sound@vger.kernel.org>; Thu, 29 Oct 2026 03:29:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48AC1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FkstOb1a
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2e8246b13cbso14010435ad.2
        for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 20:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793244561; x=1793849361; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=r2lP39Zwrg6b6ti0XQBBmhYF5G4i5EE9mhv+bYMknKs=;
        b=FkstOb1aJBK1v5iT+BgBG1SChsoebhDJbYmMaVbK7CxnJub6cKdGUUcS6KZ4b1YTVQ
         uoHqZQoAM6PBmWyT4P6A+LzgqoOKdOeeM9VOOUURShHlFGUgrQmC48ThDuCNfTicRPf5
         chsj3E7MRuOxuGk584uvzHWlipMxeSmj0OU9UEQw0wRfgWx/Ml1st8hbbN/5MqeCEz38
         7p0LWs8Msp8Eo7ah23s5PCFMJ6ba7p+MUVxeXC6DVpybGoJaGtt7gko/dYiijtIhw3Bc
         Dggio91+CFbf9r20MGFjJkuQWOs1/M15beg5OWX3PMRoU6oRII6oICkv38HWz3WxtBRE
         kr+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793244561; x=1793849361;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r2lP39Zwrg6b6ti0XQBBmhYF5G4i5EE9mhv+bYMknKs=;
        b=lKX6eZ1YWM0j9zPGZkXq9EWr2b2de/XPWjDW9ve45TnKHGMRQbnGhzlc/5OalCRvrh
         ewi3PzmMyR0sx5mUMcIQv6krQL9eBBXX8N/cKyD+ViE7bM08I/Xxhnx6FU2AILltdh6A
         4zSgCN0TRfNCGool0G8si0wKJVwoi+Iuvlrhn5/gDBoVkovmsJUOvNYffjBPwK8rixEs
         S8E3Coa1OOyrdzlKobnylIrmpZnWRfB5SEmVP805qD7VAXkJg5vhP5Me878Tht0Raz7M
         UfE21kZ1bYgF7Kpk0mg3npujdlhBjSRDRJSOt67UTKs6HbZXfDQcTELyoNx0Av22ZzLA
         in1Q==
X-Gm-Message-State: AFq9FYIr8dWIIUNW4zgUGv+51CdC76y91NsgoXiqQ9Qg1hTpsCk87f5o
	6gl4nWe8RYgE1JjJPzuyFHBXk06LaaitfmYVNgGXfYeH/Rde59Z3dinr
X-Gm-Gg: AYBFou3PGQoP9S3N1e9wErODjClq1Tez/hozmGBpSr8VPQVd77UsQQ31qzv9uLXs/U6
	gJz/63qnAMoaMM3D0scbLU3SmfONjjepRSbAxZe1vGI3sZ7gu7x9hb+0Xv7mL3+ueWAwYyIgyhY
	bdYufwZtfJwQgCk4UsNZiMHnHDJEoO2vt2BrBSyMG3oMIxIopNpElhqjln19/D3FfV0U8EszhS6
	zzK1atu/Nz5QIZdW/9P7Ergg4MC7GpA6vo7YFqdsS1ZU0Y6ChXpUnTPtmyxyHPDs/Jj7QXy+wA7
	tmGpWZyRlhj2WQmcTH7QZ9uU9D2XYhYkhBfyPyTChbiyye0pIShJgNalEonccq4TvFtsrLmOzZt
	MLdU1P1eRQ9t0uuQ+Gu2XBmDw8Hi57Dr1Fo8lPp5vNw1LtIVChfbp8X/HmhyVO/iru44CK5gUQX
	tQM/DeCZOI+uE82Uij3YjpvS9uw9xeKnbOXmH5lv28rQv/BqjYtt1IoPmAtzfB7o70+W6PHvq6Q
	ksf/M6w1yuQKVD4u/siJE/2zef/JDgiN842oj0WVz8ynNyQcg7obBJ+uHvQ48NrXQy4WgCXQVBR
	kDm87/dJXGgRnXkMG+ID3Zr447JWlLnBZIXClm88/8qF3q3i8jLnMs8pM1hkZ5SIxuJWXKix9gr
	ezCmzs2ieYiJcbR4HITR4oqw=
X-Received: by 2002:a17:90b:1343:b0:3a7:ab31:2f4f with SMTP id 98e67ed59e1d1-3ae58228c39mr3338365a91.28.1793244560629;
        Wed, 28 Oct 2026 20:29:20 -0700 (PDT)
Received: from kic-machine.localdomain (122-117-151-175.hinet-ip.hinet.net. [122.117.151.175])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae57a56a1dsm2828318a91.4.2026.10.28.20.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 20:29:20 -0700 (PDT)
From: Kuangyi Chiang <ki.chiang65@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ki.chiang65@gmail.com
Subject: [PATCH] ALSA: usb-audio: Add delay quirk for HIK camera
Date: Thu, 29 Oct 2026 11:28:56 +0800
Message-Id: <20261029032856.7100-1-ki.chiang65@gmail.com>
X-Mailer: git-send-email 2.25.1
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

Audio control requests that set the volume sometimes time out on the
HIK 1080P Camera (2bdf:0280).

Adding a 1ms delay between control messages avoids the issue. Apply
QUIRK_FLAG_CTL_MSG_DELAY_1M for this device.

Signed-off-by: Kuangyi Chiang <ki.chiang65@gmail.com>
---
 sound/usb/quirks.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index a54fabc..d2920bd 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -2532,6 +2532,8 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 		   QUIRK_FLAG_GENERIC_IMPLICIT_FB),
 	DEVICE_FLG(0x2b73, 0x0047, /* AlphaTheta EUPHONIA */
 		   QUIRK_FLAG_PLAYBACK_FIRST | QUIRK_FLAG_GENERIC_IMPLICIT_FB),
+	DEVICE_FLG(0x2bdf, 0x0280, /* HIK 1080P Camera */
+		   QUIRK_FLAG_CTL_MSG_DELAY_1M),
 	DEVICE_FLG(0x2d95, 0x8011, /* VIVO USB-C HEADSET */
 		   QUIRK_FLAG_CTL_MSG_DELAY_1M),
 	DEVICE_FLG(0x2d95, 0x8021, /* VIVO USB-C-XE710 HEADSET */
-- 
2.25.1

