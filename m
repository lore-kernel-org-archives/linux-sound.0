Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795526809;
	b=m1NnY84bbXmP7Kiie/PkUvVhEZ98uLH/NF6+UCd8y/KeFa+/Z2535Kj5AG3HT+XIF7hC
	 2AqYiKUEU/EBvPRS7HCtlZo38VU1ite0bwjda5wWC/Ilo7/eMS4PGuNTx49tINb8FxVJq
	 Wjry8uZiKH92BAlKCguLaMbwWQ+myxy/q/VJl2/YubOUy6acNq+MzSvwcWKWAUEmI2GgE
	 mPoHQ4sKUBVciQmU7sQC6gMezwDrnQsA7PBrS+NMdl4boGgQzjcgoTD66pvVA1Utnm8rl
	 3+m9Q+ReGQuWS7mGk1GSJam6guRYyeiQttupjv8AsN/fY9NOAdwdTwVIe4z/2kfy39g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795526809;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3f3AaBeTNaldSCyKqp4WR18alxWjuwxY2zF5DyRGK2A=;
	b=SBKWbqB5TAymglMNQCz4Tmth2tHKWZ4sUoMthFWQy5/GvlmjKV28qZTW8MIJBQUvvd/i
	 gcUxrc8xqnyZcc+OhaeOEiS1NOo9+v5PuPFe5/nDbwzvhyHY8j3Rks9s/lAmz/CDigppb
	 WPhdpHCvpuLuSpWqEFIdbB7MhAKcyN/bo+rxQvRxygPvAUMsvTx+yNopoDlbc8JHOFV2c
	 2voSHQtY1+P7BXWNGuqUz7sB9Wh158JpX4Hmu2psNtt4pR/Alm3eyoHbJTev9pD4a5jdg
	 OjC4NQIt76Do0VU4SRz7X68BuV6qOiI7i9N6JFEP93Of5/UuVpnUWelox047RgNUf5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NMHXbzcx;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57950606A321
	for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 13:26:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57950606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NMHXbzcx
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c505b2e1cb9so841834566b.2
        for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 05:26:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795526808; x=1796131608; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3f3AaBeTNaldSCyKqp4WR18alxWjuwxY2zF5DyRGK2A=;
        b=NMHXbzcxhjydnbeWXQC2KMIfmWDOr4eTvaYf6jLtN+q+QVOzfGRwLz5mOC5ChpQGLS
         383/o1oplQ01xOempBZtm2LahhYwEJsR0uLdkdzOiGUBUHdq/nfYtgiTsTWZGbxKpFMP
         3rIUmEzrUroOBvNq+IvtOsivJP/Z63T8QpXvAXyOqr8BqE48XsfivNPclggs0ec0Vv4T
         NOkmDWc7z07eJ3bJx8lbq5Q6BDr5ChpsshZw4rNlRFsJjiH7ciGjuqkZclETTox0dN0g
         D+AZupI1B40tGuQx1VHX3eiQjHkLsfOaDhxziCU6trUstsr5Fq+PZvbz4JQHvYechrsI
         pceQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795526808; x=1796131608;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3f3AaBeTNaldSCyKqp4WR18alxWjuwxY2zF5DyRGK2A=;
        b=vJvCrs0+SOIDaNPDphBwbaLWSM0VDCQU43mUZ/F/3RL5rSet+NB7ILPuqg7dhkiofA
         aLAwS4KRynfUtMcb9oRN+uZLjWexiittv424FlysRkR7IkCviN+lnkYoVfEpEbDhqsR5
         ydCWmmKbeIXvKIjuuRBAyCyiWDpM0U21yYvILWqwAI6eetZRgg45ygAtk7ZsPdhzzg00
         F7yNJ9rKPjkX9ryE9sK4PJcpm5dz7iOUHkI+fB1WRrVtMZF1NggxHdVy7lNN41ZMx1L2
         8Z17UDhj0RissVCOjJ8/PEAFGAxj0QVDyvyQtu0nGfmcX2ManXQJXAq+ZqG5xWmLopgd
         WcDg==
X-Forwarded-Encrypted: i=1; AL+hErG6OFVT8WTFv6DcNPI46+gBVowihwI8rOHGVQ6T3Ar4MJ+TwVRoAFCbFji1+jLHPEM+2VyyZRdDCMYyMA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+6gqaYKpy8CLX+BFxaL6BNVJNoo4fwboxsPhFqRHNlXAlgJ9WN
	gPe3b5caygmAvFy2a2y4AakDhysq7HFSS1SQ1O2D97ijSp8wQfq0EZxn8bxOiDVS0/HWHP+b
X-Gm-Gg: AZFdTZcb3cmbMl5l1zUI/SjVlmJpnI3vI9oh2EkHno480fFF61WmjbxhGKrEAN24PQF
	F34UMEs/WARzc5ltosGDDub0OPHlosoUx9TLEOV1WXD8doSCxS1qOePKw/oYx5YjCG26PLwsqiv
	IS2QGZDxdjd7FhvkxkaQbIc0axzF4MK9O2r4o61Xz6w/xH9GICoGtANMiFXRTxgFFiHER+gmqqN
	vi4RCEWVANXIqPlDg1UiXyE7ERh33JMYmODddRcKj3TTKqhcklDvADqwuq2B4t69jrk4cApoVkH
	b8kFle9wcDeFBzDoAmCQia3YzeTxIq9OYqTISYOJm+RuS1x6/HMYOqxe/B3TGvYYRhK3T6/R1GT
	0l3CvRV+P1Mnjshdbjr1z6ulJfpPQSWC5zvGoEsxx2bJ7SPkT2Bx26nGPM7CC7Mq36TQN6x4KTH
	MTzCLjLEpbZoc6DGwY9exUUVdrY/baFaPuiJY4I+/vnRNttY4xoQefZ1uBkFPHE/NYgjzts7Ym2
	5cCwx81ElgDv1hjcCFzKm33tqCxWN3VCuUM1qIXTdqKPDcdZVi3yTct111Br0FILqzodRD8/Wda
	J2H20qZz0I33J1E5daB2KpYhENqZx0sFbbSfNslM4RQ8JV1oy/nTAd25
X-Received: by 2002:a17:906:a987:b0:c4d:28ba:f221 with SMTP id a640c23a62f3a-c513acaf7cbmr856096166b.42.1795526807488;
        Tue, 24 Nov 2026 05:26:47 -0800 (PST)
Received: from omarchy ([109.126.5.8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110ba3sm23018898f8f.35.2026.11.24.05.26.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 05:26:46 -0800 (PST)
From: sandrees2007-ctrl <sandrees2007@gmail.com>
To: Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: hda/realtek: Add quirk for Infinix BL51A7H
Date: Tue, 24 Nov 2026 23:26:41 +1000
Message-ID: <20261124132641.79890-1-sandrees2007@gmail.com>
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

The Infinix BL51A7H (Realtek ALC233, SSID 2782:a24a) has its internal
speakers wired to pin 0x1b, but the BIOS pin configuration reports the
speaker on 0x14 and leaves 0x1b disabled.  As a result the analog
output is silent.

Apply the existing ALC233_FIXUP_MEDION_MTL_SPK quirk, which maps pin
0x1b as an internal speaker.  The same quirk is already used for the
related Colorful L1 Plus (2782:a248) and Medion E15443 (2782:4900).

Tested on the Infinix BL51A7H: the internal speakers work after the
quirk.

Signed-off-by: sandrees2007-ctrl <sandrees2007@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index d38be4d..ac35983 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -8816,6 +8816,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x2782, 0xa128, "Positivo N15RPE-S", ALC269_FIXUP_LIMIT_INT_MIC_BOOST),
 	SND_PCI_QUIRK(0x2782, 0xa212, "Lunnen Ground 14", ALC269VC_FIXUP_LUNNEN_GROUND_14),
 	SND_PCI_QUIRK(0x2782, 0xa248, "COLORFUL L1 Plus", ALC233_FIXUP_MEDION_MTL_SPK),
+	SND_PCI_QUIRK(0x2782, 0xa24a, "Infinix BL51A7H", ALC233_FIXUP_MEDION_MTL_SPK),
 	SND_PCI_QUIRK(0x7017, 0x2014, "Star Labs StarFighter", ALC233_FIXUP_STARLABS_STARFIGHTER),
 	SND_PCI_QUIRK(0x8086, 0x2073, "Intel NUC 8 Hades Canyon",
 		      ALC700_FIXUP_INTEL_HADES_CANYON),
-- 
2.56.0

