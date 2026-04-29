Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 015763FCB2B
	for <linux-sound@vger.kernel.org>; Wed, 29 Apr 2026 13:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777468825; cv=none; b=ogutPGABZ6AX2wJ5wagYWhMZjSQemlr3KIt1d6HUbajNrlo24zCJXqAXC0RnJvYZmxb1QxNnprWR84GDt5HlQJS8xv+zh5Rw4PcQRrsp1eYM2TE+zH1zYvkwE8LmhOZTxgwud4VKP1v5CALPzzJNEzXPhmFIfiWyA3hX73lZKII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777468825; c=relaxed/simple;
	bh=feuCS+Wde8W7EpfVCWxGj5z6QZqJHZ4hcRmQpIJg2Y8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OUGmOHzHIQ1fYkdXnJMrNNMcxp5JuNhTEO8bqU7Md+YL8ioQ+p+o761yLm4GyqiRqC2/RQKggxJqxwVdrkQOovObU5Af9M4xN5ZosCKGRuSZ3FrNHh0Uni6avZv3XCzFlUrgbcOdxCeM4Un2s05yu7APkqWkIIhbfJo1NWB5PZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k2gXbMUj; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k2gXbMUj"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-12c1a170a50so15859407c88.0
        for <linux-sound@vger.kernel.org>; Wed, 29 Apr 2026 06:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777468823; x=1778073623; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=syI6vCyidI7u0qaJd4ZC0RGGlbIolm5pPKH0di9GsB0=;
        b=k2gXbMUjAHIP9ks38qtvQQyWs2hSgZTiskIWCXpVnMz3H1jJiOJQo8xQRRu1mjeANA
         GoiytNp6pASpSH50tNwIOpS8nBto25mpeTgIOhL+gu8Z+9m8GO2kixc3ojTBvuEEIa89
         U5iVAK+2/FTHI3t+TVMlbF+7NlCHm4eGu455n0fe5j0Q9g6VWiKoCyXYK/tVaktWaTdf
         9JJbQSOT5vNsz5YWedSDrBev2J34aItEUL7bVrR9lLScHLUR6QIE1bUcGwR7jwG0OLhN
         5CutsLThTzdwQVRa4VGE2NYB8mkWwna4BmdPiWRhsc5nisc7tvbZ8EUj+Hth3ew9Dd98
         Or9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777468823; x=1778073623;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=syI6vCyidI7u0qaJd4ZC0RGGlbIolm5pPKH0di9GsB0=;
        b=mhxy3x2UZU3eOtOx3D6N4lpQmuDVplQBIv5pTiHc1POYJAKSlxXumendiVX8HGsxOW
         WQUldEUlzcglIOtrA9k/NmiI9erhPNMxJHqAEKvoAtadMm0CJwv5LNqiEjzcPUKS5rji
         KaHwNhu+J9lFe0ql42wqXnLIkWTqo9ZRTjNlZigbh5gcJHYbus2fAEijZDgMaylGul1Q
         8wuB+/DZ1TQkK1kTIQmaj9EJ6hMyx9SO36E2k1yQ5CxBJWXYBpfURiSD0QRQMIlUXumS
         WkWJxMwmb7bRrsAqyq7TbgXu6LQeL6d6WFCOfAw7SnPFnhc4++45d3DQmZxwvjVGYfhi
         OUgQ==
X-Forwarded-Encrypted: i=1; AFNElJ8oCpT4R9q8pNoV8fx5D9zJxUgBVyoiBAKxVRU4FmTpoaOeSqOhE+/evySvr2/qr52YPfktuZ6UX77yvw==@vger.kernel.org
X-Gm-Message-State: AOJu0YznTPA/Z5/cew/LA5Cpo6yLCvShel8BEf4Bclw5o4jubsPLKje/
	zCT+6QPqAAtyXySpEv4hh0kVcuqBuxx5+7kgUfWCCDfhqrmrnUyvKlCpI04RSwBG
X-Gm-Gg: AeBDieu0JkL9pPx2xQ0wKi2fNdiMu7gKrtZxEH7HMPiWTCcVMOxfpfvsX36xRhwYN1l
	kEobIC1ePBFs7aUIyluJHbbitG5nnkNzUymdui3fi0a06vCMWOsEAgSpDDotMX486B4JNt0lr6A
	xGnuf2wCHiB21zT5lCJ4cC3o59oxeLnDPgCKRvdQlOQNxQIzxF2rto0AKWrArLZvWZMOxhxQ/cY
	vH+cbYciwaj/01Aaxv8KOTstb6pQZYZfgPQA+pIiQxOEIhmXx/BustTfXHZCclHFnQUI6KzXDnE
	Eiu9gybeG+o1I/tnVtJF/vr7F2oWQ5xGmSoSzv4Oz9wNM4M0d1yd2j/7w+qSRD5Bf1uwrgeXOj8
	XcoNcTO7EBcS9yKNZOeeM3fsG66ZMqWJBNFNezuMRNYCw0GjUFAbTV/uzq8q+ySHW+RD1gF1Mm5
	nFkyoga6RmqlpDbDJ15bjq1JHrxlazd4Yl0TGWiGXCTzIGwpdJMMMhlm8UURZf33KSIGxnLQmgK
	0sQ0LRi4tcG
X-Received: by 2002:a05:7022:e98d:b0:127:366f:8bb7 with SMTP id a92af1059eb24-12de2a4b858mr1514450c88.25.1777468822679;
        Wed, 29 Apr 2026 06:20:22 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-87.user3p.v-tal.net.br. [177.4.161.87])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12de321df36sm3336852c88.7.2026.04.29.06.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 06:20:22 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Wed, 29 Apr 2026 10:20:02 -0300
Subject: [PATCH 2/2] ALSA: usb-audio: Update Babyface Pro control caches
 only after successful writes
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260429-alsa-usb-quirks-cache-rollback-v1-2-01b35c688b80@gmail.com>
References: <20260429-alsa-usb-quirks-cache-rollback-v1-0-01b35c688b80@gmail.com>
In-Reply-To: <20260429-alsa-usb-quirks-cache-rollback-v1-0-01b35c688b80@gmail.com>
To: Takashi Iwai <tiwai@suse.com>
Cc: Thomas Ebeling <penguins@bollie.de>, 
 Ian Douglas Scott <ian@iandouglasscott.com>, 
 Jaroslav Kysela <perex@perex.cz>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1885;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=feuCS+Wde8W7EpfVCWxGj5z6QZqJHZ4hcRmQpIJg2Y8=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDJmfWLtajwc095kkiQt6yG67uunhz0dcbCv2ZizvXpO19
 ZT3g+UpHaUsDGJcDLJiiiyrkxZZ7ul6cLU+boUHzBxWJpAhDFycAjAR2ceMDC/O8VfwN3XZpQQv
 m6kTe0jx7U7lwL3c7yqd/X2fOal3rmZkWLNdozE37vv6Tb0bz216FvG7dNOFcpHFTvM2TJFztZj
 EwQkA
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

snd_bbfpro_ctl_put() and snd_bbfpro_vol_put()
cache the requested packed control state in
kcontrol->private_value before issuing the USB write.

Their get and resume paths use that cached value directly,
so a failed write can leave the driver reporting and later
replaying a setting the hardware never accepted.

Update the cached state only after a successful USB write.

Fixes: 3e8f3bd04716 ("ALSA: usb-audio: RME Babyface Pro mixer patch")
Cc: stable@vger.kernel.org
Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/usb/mixer_quirks.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
index 229be55e9158..99975c3240a5 100644
--- a/sound/usb/mixer_quirks.c
+++ b/sound/usb/mixer_quirks.c
@@ -3027,12 +3027,14 @@ static int snd_bbfpro_ctl_put(struct snd_kcontrol *kcontrol,
 	if (val == old_value)
 		return 0;
 
+	err = snd_bbfpro_ctl_update(mixer, reg, idx, val);
+	if (err < 0)
+		return err;
+
 	kcontrol->private_value = reg
 		| ((idx & SND_BBFPRO_CTL_IDX_MASK) << SND_BBFPRO_CTL_IDX_SHIFT)
 		| ((val & SND_BBFPRO_CTL_VAL_MASK) << SND_BBFPRO_CTL_VAL_SHIFT);
-
-	err = snd_bbfpro_ctl_update(mixer, reg, idx, val);
-	return err < 0 ? err : 1;
+	return 1;
 }
 
 static int snd_bbfpro_ctl_resume(struct usb_mixer_elem_list *list)
@@ -3217,11 +3219,13 @@ static int snd_bbfpro_vol_put(struct snd_kcontrol *kcontrol,
 
 	new_val = uvalue & SND_BBFPRO_MIXER_VAL_MASK;
 
+	err = snd_bbfpro_vol_update(mixer, idx, new_val);
+	if (err < 0)
+		return err;
+
 	kcontrol->private_value = idx
 		| (new_val << SND_BBFPRO_MIXER_VAL_SHIFT);
-
-	err = snd_bbfpro_vol_update(mixer, idx, new_val);
-	return err < 0 ? err : 1;
+	return 1;
 }
 
 static int snd_bbfpro_vol_resume(struct usb_mixer_elem_list *list)

-- 
2.54.0

