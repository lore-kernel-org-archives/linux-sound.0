Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792687568;
	b=vHfzY0CiON6gXrvScICqhbVnDEypgpqa4to0JP/V4b5nAgIYItBQHz4BrT1pqNTOYiAT
	 O7hY/ffN2q70HtmcMjKLdCACx3vQh+StUrLH4+FJ/CQxSXrbnpMe5wvOMpNVtVEOgMvbg
	 /LaVEFRDpEv6n73qv2ZD596tbMNqr9esP1Dk9aBIwgFyKXvc/3kdCpXEENlDp5YmegHsK
	 P+3OgyIXexvDA1bqHEDhJJU3lHxjT43DGW2rSRc4wOaPQsi7/Bde4B7vvubY3wdQXw0M4
	 N3oOUj3wuTkDMYQzXsQOFoya0NyfMYXOSFMn3VmUEk4EOw3eZD/5ZqECtQQJjNYRfFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792687568;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ulbhMpPNAEqRrIOhtV5MGUC4m/y05Tb2A9NkmVyj/X8=;
	b=w/jFr1svPaFKnkq9cd7kbVymAWV4z836/f7Mqy+pH2AqAE5rizr1RHF0K1BNd9x0R258
	 vR38ZvOAhd1EFDlD+5Hcszh4z2bZzhYHoe2ouJRaxYm8uleCXUFDRlduflLKxivJFMXJd
	 Gv649dcuVvTHrYF6ijKVD772kWGXBbBVuz1UgtTjuffQyxNrqy0Gi3PM4NtUK4q2GNPDp
	 Yk/uTXnUA/xUtI0XwgypJadLlnrUP88+vw5zBNm529fksObYoQITVHS0y3uR4Ggut7vrE
	 ZRcJyZdiX7XFVbxF2nYm9z6P5e3efni4Tm29We35UU/cL0AIPwftpiWDiejRjKLU1Wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=V02IlN5i;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF80606A31A
	for <linux-sound@vger.kernel.org>; Thu, 22 Oct 2026 16:46:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4EF80606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=V02IlN5i
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48c5358fc28so20216f8f.0
        for <linux-sound@vger.kernel.org>; Thu, 22 Oct 2026 09:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792687567; x=1793292367; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ulbhMpPNAEqRrIOhtV5MGUC4m/y05Tb2A9NkmVyj/X8=;
        b=V02IlN5iKRq9f3UIaNYf4qBsqYnr4l/l1KhUDGmkCUKaiS/X9h8h9pTCOlP26lwQBC
         6Ubo3bRbASFVUO4Y7aV5Y64cxTndUcxU/M6oXGrVQ3ELWe570k2A4i3i0PsUFmHqzp4P
         0f3+1STiGrSkfsyvMu+W4LkrN0rmNffD7yVa1JgTHvgfENNl8fAjnlx5rvoEkjZ/vPzP
         Y5dDTjkUxE/rt6PLd0grpYr1GCPmQyJ/xCiy30snNwiYKXfzuWV/+trMSrl2r+h+WmUO
         FTUjZUb39eJzoOFjrJUCip+qBfMpKBe8IjpfrVVVgAt3UtV2J/0G93rbhBm76lZeGdkx
         ZTbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792687567; x=1793292367;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ulbhMpPNAEqRrIOhtV5MGUC4m/y05Tb2A9NkmVyj/X8=;
        b=ASN3VqMMILfBtGEGM98Uc/vBpOBj/Vq4/R11DVo9itf05sDbKZ5JYpNTZro7X2sfxv
         gxtnc/lijxy2taErWwdAzRjVtMu+swtoAY1BHxd7MpWM9blwNzePkaVF7VqTewcUCIjW
         +gHtuUR/hPqN/bdinJHKnIWIWX//U6t16f+4AF/yEGNyAHokCBP2JMKOxmhskXF5/1Nw
         jhNISVnoQmJXKFty5Qv2TQijnos3Fpjmz7P9Q7NqYGBrtS3BThonq0lHlN65pnXPzPE6
         CSdV2xabSBICcUxnGjr19oZxidCVpuKSoB8JdRiF8fljWerF18xJLwKHOgLutQPxqeb+
         uLcA==
X-Forwarded-Encrypted: i=1; AKwUvBwS0nrVRGVJ+eSN9emEGfyE4foK+eK+HdfTgyySNHlWqNeCL70kVyhHuttTcKhY8LpNoT0gwN2+2ya8FQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYLn3Ts2GLO5NsP3y7QMFjy4kp6IUHLg98f2st51SYP70q35wS29
	QHL7O6C8+FTITLdoVk7+eCkdMAjXsajBdwAWjnJbCx6LUhoT539ZTYo=
X-Gm-Gg: AYBFou3sgBcSfeNiduHyBCM8BGQTgaMERNDuRisnE55NO2zbGqc81FWode5XRIvXbEG
	WQYZNaFfR1aI1n6Y6NrhzrOG7JcESDxHBVI/bLixT5Q2IQ4t35cjQB6X7+S5vv633Q/cMw0HKmG
	7NH3anad5d+u82+YxCGHAZ0+7awlq58G97atZuV2u6JOaIFAkzfCD5yWjr3b/IP1fdFD1k+o2g7
	HC4sOT9Z2dZjauGHMFm/VkPX79j0LeXR6raqynEU/TwaHzuLD83GyEK7gSbXkidjFEPCcM9LxCZ
	OJ2fQfWDKRjpjp1wSfMT0dNlw1t+Av23lGU9Et0DmRp3sI2yOKyHcrq4XWx9gR4v/gWrpbQrhSL
	wsaWAEcXlQuUjamGsiJknpmsh94b8A38FIOl+zTrijwv/mwA4y3cLGOYZQDO9UsVrT3V3EHTdc1
	ixryL0EkbgG/o9r25d4muzXnGuFPdJefIJg9wjzE60BP3otsG7RIeleMaGCP7aocoAV+zCjPZOf
	/dMc8r4WyGX0rHdSvrfWz0xx7Yywhi2hyTeYBiRLLCagSyStjqq/ssVCNFHqBg+fk18oWIA3fRw
	8j3CKBGIlZfADq7YC50Cvyep4IckpmIg+/IXRFuWQQO493x//ZTvXK/S4A==
X-Received: by 2002:a5d:5f95:0:b0:48d:ffce:6cef with SMTP id ffacd0b85a97d-48e263ac3a5mr12539089f8f.0.1792687566645;
        Thu, 22 Oct 2026 09:46:06 -0700 (PDT)
Received: from localhost ([2a02:810d:4a94:b300:7204:b73f:b5ab:d041])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48e25827087sm13154209f8f.21.2026.10.22.09.46.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 09:46:06 -0700 (PDT)
From: Florian Fuchs <fuchsfl@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Cc: Kees Cook <kees@kernel.org>,
	Markus Elfring <elfring@users.sourceforge.net>,
	Adrian McMenamin <adrianmcmenamin@gmail.com>,
	Florian Fuchs <fuchsfl@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: sh: aica: Fix spu_memset() stride
Date: Thu, 22 Oct 2026 18:32:41 +0200
Message-ID: <20261022163241.2504922-1-fuchsfl@gmail.com>
X-Mailer: git-send-email 2.43.0
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

spu_memset() writes one 32-bit word per iteration, but advances the
destination offset by only one byte. spu_reset() calls it with
0x200000 / 4 words to clear the 2 MiB of sound RAM, so:

 - three out of four writel() calls target an unaligned address. The
   SH4 can't do that. Each one traps and is emulated by the unaligned
   access fixup. This call to spu_memset() causes 393216 unaligned
   accesses, visible in /proc/cpu/alignment.
 - the clear covered only about 512 KiB of sound RAM, not 2 MiB.

Advance the offset by the size of the written word, to clear the full
sound RAM using aligned writes.

Fixes: 198de43d758c ("[ALSA] Add ALSA support for the SEGA Dreamcast PCM device")
Signed-off-by: Florian Fuchs <fuchsfl@gmail.com>
---
The patch has been tested on the hardware and sound is also still
working well, the boot is faster by about 4s due to less unaligned
fixups.

Previously: 7.9s to boot:
[    2.900000] AICA AICA: ALSA Driver for Yamaha AICA Super Intelligent Sound Processor
..
[    7.872000] ALSA device list:
[    7.876000]   #1: Yamaha AICA Super Intelligent Sound Processor for SEGA Dreamcast

After: 3.8s to boot:
[    2.892000] AICA AICA: ALSA Driver for Yamaha AICA Super Intelligent Sound Processor
..
[    3.796000] ALSA device list:
[    3.800000]   #1: Yamaha AICA Super Intelligent Sound Processor for SEGA Dreamcast

 sound/sh/aica.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/sh/aica.c b/sound/sh/aica.c
index 078fc7fc08f9..04f80c8c89c0 100644
--- a/sound/sh/aica.c
+++ b/sound/sh/aica.c
@@ -94,7 +94,7 @@ static void spu_memset(u32 toi, u32 what, int length)
 		local_irq_save(flags);
 		writel(what, toi + SPU_MEMORY_BASE);
 		local_irq_restore(flags);
-		toi++;
+		toi += sizeof(what);
 	}
 }
 

base-commit: c1b1c25de0d6008c3fcabc942fba635ea3693c3f
-- 
2.43.0

