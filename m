Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795328358;
	b=tD6T8gQ777YerLfFwk0Dl8AQpIBmsnQC7m2UGCHhH6C8c5pgkP30GVK81YrAxAOAu60z
	 d2EEWnrWP2+WboZpb7sVdBN/LliBoqUXHPk9aCK9z7Ox4go2S1e61I4icC8Y+yz0lzt2i
	 OXU611WOfFXvMBHw3gcaXYgiJgAvpfUZJF4+OdW67z3dxkC/9Dv6K8sb5aNdr6TQcagHd
	 Y4IEvSTzK6jQQ36R/v6TnumvCvDDNxmhZ9j14Z/MnXxwEFtZEhE7kg4XK1IZOMUBcQfh6
	 p6o58FxAjoStcpAEFX4iuLjIP/tKrfDyqfmiqnc99jrmO0xQbNCCIUZLna9/D0oe5Sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795328358;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=i+i5UXNicz+dDMLjLCfQXLU1+yF38ghxKYIXqlpkcYQ=;
	b=YsAqcsk+kv821BiftARqsVXkEPa6kDCQORUcHfn0iUlxakSDIzl9u3JL43kLIjoyjSpJ
	 SVoPKB7JO+gLy+gW83GQK/AFN7rUyC9bXk4B0bW4rC/Osd62mFqV4OwitWENOiCR/YtRs
	 EZ3oRqfQnH6ixkewFiIDq9an6dUQnc2kzFnUMEHlqL0pl8K4sl7F1/j2TPeo6UjuLush4
	 oh2npJBYARrip8sW7Zhz5c5kRJVl3az5m/yCJHzsmT9tR+3Kgrx08KfMp9LJF+EUkQfPI
	 +3uRV+P34EVB2Lb83sRyJC57CluigqaVrPYlVJ4QRNARq6XSIMEWFZScV5ndRU4Vn9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tDvq2gYe;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3338606A320
	for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 06:19:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3338606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tDvq2gYe
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-382f4710a17so3868712eec.0
        for <linux-sound@vger.kernel.org>; Sat, 21 Nov 2026 22:19:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795328357; x=1795933157; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=i+i5UXNicz+dDMLjLCfQXLU1+yF38ghxKYIXqlpkcYQ=;
        b=tDvq2gYegcNsa/8xl4KYzS3V6pHEZwNHJnGrfEEA3O7TRJ2gW8DRlS/QdJ2IqGAQCB
         pnE9domTsFdLnxZOr/neuNNs/7asFBDooFNvfetBXd+kKO5nRRkchnpAf9RCyLQR7RW1
         ImG/XR8PgJtvTeeWD7qgMM8nJlU3oEfHKZ231vdDaL/l5k7tJVl2I2GiOFBJg4TNJLai
         JTwKUD2mqf/05q/V8nv/gywvnPtjJ5OIDKA8HHkoIdZ5K/CHuV+4vmXydufayUvt9Cgd
         KcbyC9CvdqvwJjhfFhmcDtV4Bu6Rp8U0YOWUBuh5WfmFO9tKZs57PPglRbLgAI6qIauN
         z//w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795328357; x=1795933157;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i+i5UXNicz+dDMLjLCfQXLU1+yF38ghxKYIXqlpkcYQ=;
        b=pkCcFjN5WLQnVlYhqW+QWJU78fow6zLK2IreqLAwFCOnkfFleOB/6u6QOP4dGJksPS
         F5eGDsLZlbzHcYAKu4OzTKx73FcCFB03GkjnWnf+z/DVTJVqF5fReepO2sukBPgTouPc
         U7kj2DCbes0ONWWqinnyMMLYYPWth24cOpDaSghoABTn/mMCjEG56jLj9MVykH8kRA7b
         imalIiKcJHJFYa1PILwm8Qr1QzgOPCSbRy+pSrFcV2mg9louWnXhadcjbs5TDJpEU3wq
         a5Ssz8gmltQSk4g4i5k4/aZyIOoM811Mghv/4VcewBo2KEy6b5xc3kgV73odKzMvPsEM
         +T6Q==
X-Gm-Message-State: APuU4Z90U+h841h1Fc7fjSk1ZDV9GB3ntXGTd2tzJZrIS3+dPu5J9MOh
	zVx1R854WlK/xpCzH2CO5Q6sAb64Ogjc5tsbL6fF2fPIYyw0uDKm1plEwFC31Xs3
X-Gm-Gg: AZFdTZcuC4kIdJsVjnNS4gCFexi5O5CewrEkOOP7rhJfCD8yQ+8xi9sxaeIc2H62kcg
	bbZPt2lBcst/Yo5S2/vPKnMWoWpS3jhaUWDSLUxOGIYVgavLP8+JX36YbNFYC8ZtvUpOG4edZka
	P07LIuznkfPj9Smd02tJyeZ9w7sOsFSsMZFr2VtlCD9VE89AI3GuGc615KblF1FPkN/dC2K9LxL
	2sh6p5ZCka/gBOY87M4TwRNyVZ8zWfkGbrcORtju7vr/yil+fC8EefWlhqQOcc86ZJPBaw6pSnb
	m2L10KLXfAt5Tr3J2cHpwEQl+RPGS1QNB9nrumwk81jD3IfplyN1wNTd3cvDCWBHTVGm+6RpZyF
	fraghAVDKTs4Z/l70nYq8QFzm1vInsJQMsDtGawSuPCcL15hHtHAFvvjmfIes6p08F9+80nSSdF
	uCIUovZROcdMtEG5Rdboafy/uIpxjyEgpJgvx/Y1aFz6Tir5EZskqxvhOXGiam342QKLZZArw2/
	wf4/p7TmL9o4mZpkCTeLllp8o+OWma5s+y6uYBya2XFDEnZHheH3OqU6BfCkaYQVF/iRQfvu/sg
	kJkWSo3JLQ9TAk5C9N4e3Wc9f27tn5onOKFpuwCMfEVS7HcPQ3Ggt+f3jUodnpCkdkCm
X-Received: by 2002:a05:7300:bf11:b0:36a:15cb:30bf with SMTP id 5a478bee46e88-3856fe5971amr9132677eec.13.1795328356540;
        Sat, 21 Nov 2026 22:19:16 -0800 (PST)
Received: from hp-envy ([2407:7000:b098:4a00::6])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm21993624eec.16.2026.11.21.22.19.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 22:19:16 -0800 (PST)
From: Parmjot Singh <parmjotsinghrobot@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sbinding@opensource.cirrus.com,
	Parmjot Singh <parmjotsinghrobot@gmail.com>
Subject: [PATCH] ALSA: hda/realtek: Enable mute LEDs on HP Envy x360 15-ew0xxx
Date: Sun, 22 Nov 2026 19:19:08 +1300
Message-ID: <20261122061908.130239-1-parmjotsinghrobot@gmail.com>
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

The HP ENVY x360 2-in-1 Laptop 15-ew0xxx (103c:8a2a) has speaker and
mic mute LEDs that are left unconfigured by the existing two-amplifier
quirk. On its ALC245 codec the speaker LED uses coefficient 0x0b bits
3:2 and the mic LED uses active-low GPIO 2.

Select the existing combined CS35L41 I2C and x360 mute LED fixup for
this board. On an equivalent Arch Linux 7.2.14 backport, both physical
LEDs responded, both native ALSA LED triggers followed the onboard
mixer switches, and both CS35L41 amps loaded their protection firmware.

Codex helped trace the ALSA LED controls, prepare the change and
write the commit message. The LEDs were verified on the laptop.

Fixes: aa8e3ef4fe53 ("ALSA: hda/realtek: Add quirks for various HP ENVY models")
Cc: stable@vger.kernel.org
Signed-off-by: Parmjot Singh <parmjotsinghrobot@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index a6b5e89..76c06d1 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7871,7 +7871,8 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8a26, "HP Victus 16-d1xxx (MB 8A26)", ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
 	SND_PCI_QUIRK(0x103c, 0x8a28, "HP Envy 13", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8a29, "HP Envy 15", ALC287_FIXUP_CS35L41_I2C_2),
-	SND_PCI_QUIRK(0x103c, 0x8a2a, "HP Envy 15", ALC287_FIXUP_CS35L41_I2C_2),
+	SND_PCI_QUIRK(0x103c, 0x8a2a, "HP ENVY x360 2-in-1 Laptop 15-ew0xxx",
+		      ALC287_FIXUP_CS35L41_I2C_2_HP_MUTE_LEDS),
 	SND_PCI_QUIRK(0x103c, 0x8a2b, "HP Envy 15", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8a2c, "HP Envy 16", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8a2d, "HP Envy 16", ALC287_FIXUP_CS35L41_I2C_2),

base-commit: 0dfd513a15573ffa21710f77c2926c3cbb81a7ed
-- 
2.56.0

