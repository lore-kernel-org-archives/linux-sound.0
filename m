Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D53C32F99B0
	for <linux-sound@vger.kernel.org>; Thu, 20 Nov 2025 19:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763666152; cv=none; b=rjGZiEIWEbqldlAT01S3bBeu2f9Z9O/D4A1Hb1vPm2wunvxx+EyQL0fVnswlmZIgyefBxzqkimy63ty0mep4O+K3SZ9j5R9ehxGasHVbHrHSApDm7ZMz2CNOtff5DCp2ERTEb/VOCbz886AxXJTVbNdJxbFCC/Soy1L7TyVZM60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763666152; c=relaxed/simple;
	bh=NwM5rIrfFxgkVs5rajXxbT58iIHPheAe/b8Yf/vNCjY=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=tGdQ+/hSyFNRuhm5/FBBXLGKVQ/ql8pOvix/FG8D5HAt6gelzQ1ZxU/W0N8PXFvOVe3w+Nz+t4Ijamx8Ne7H149MhmSDmQAXI1r8Hp1alf/V8BMwspjK8wZc/dth3X+QrCkW+esDz7C5nVRB186ZncAbIqOzU51GBXx/KbvN7gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fBPDcaMd; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fBPDcaMd"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5957d7e0bf3so2252466e87.0
        for <linux-sound@vger.kernel.org>; Thu, 20 Nov 2025 11:15:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763666149; x=1764270949; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qthUO4tVKtigvhXSVtNfRoPuzQd6nHQfAYOQw6ZhUG4=;
        b=fBPDcaMd5HLThE29//AOIR5xGPisEpBHgWhmq4uPfD1qHz6G5phKkXQ/3psUudJu3k
         yWeAQfnz8xG6dIbmWgzsZNfsM79oT4w/0oO4PcxfiV7dkxMe4jLy+Rkdwa0FSNx+3NnZ
         YuDnED4HId9enRGo5trLLRah0aZ5jKO8ZC73M0BSNxW9wzGcNUrELhMjI3fwISMqvZhZ
         aqWj0/tLJphX1KLh+ZgkxpQ/J2iHnr3GZVP7N6VDJ/aUEU3AKtq+7QAN5Y5TUL+JWxid
         6Dufebbm6/BCKB1Uq/G89jWXreY8l/9qbjLVhvHMLzITEZp3ad7JV6KNFMzH2qcqDtAK
         YntA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763666149; x=1764270949;
        h=cc:to:subject:message-id:date:mime-version:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qthUO4tVKtigvhXSVtNfRoPuzQd6nHQfAYOQw6ZhUG4=;
        b=ikLybKmwuoVs+HUP7w1w9RPhlyHqMQvc74Xq83HDXP7XGn78ApPkP824b45MzzjnH8
         ToZt7L60yriRp4TutBHys43rb38IaYkQGnDK9qYF3jkugYfyYVeKe9GVqSrQgGJRsT/A
         CA81DclJb6z5IWmQSL1RY3+OZzuVTmGpVp6cpFzl8Aa5+egby5Lb1VmRhp7s3tBygLhE
         /NOmkFTFknBzQm7eZtpomUl+L7lrUnpthpMl2q/MYpw+m0KyI3zZAA5XHB5SFOxjTPRY
         s6R+NvAr31ZQDaMpIdHVW9tNTdW+sSqTFLM0buYUJxfINzIZJbspQync+cU/mVTd1+N9
         KLeA==
X-Gm-Message-State: AOJu0YwDDNUMfEhm7cYaTIcvQutJdJoXkcpzMj/l0mcyCbDd4UUUX0G8
	swZ+tErKuqhmds97ImZEciJkOiClU+3gh+mhH+kkdyBWNSlq9hd3A3keV/qwdpaZZiVDkWkNJdo
	q0agA2FFUQkl+mh18Mh/h0uV6bGXGLlE=
X-Gm-Gg: ASbGnctkjQaYvM3n4014DWmKuDkXdAhzWH2YdP+A8AdmE6+2knPoOmzJbW8NLRT4qYO
	I6HBz6HZXcYDb9//ABaytKBaUaHRZc3YxcfSzxiPbdTSKzEW351CXZz2n0Ql7sMBjyw6fmgOPCh
	kjLg4bqMEdDUvXrrm3kGVcaPrJBptDalZHl+oR5MHZljamJsa8R+2GEiymVOkg78y0yc+EFrjb+
	FK02zC1W8a5cqcY9ks6sBvnJULslddce8sqeewvONJVR8DhC+xwiDki8uBIqPyEH6S+dlPwlg==
X-Google-Smtp-Source: AGHT+IH6enpoZjRKCKKVBZN6wiFzU+sGbc+0t6h5/JZolh/GhJivmI2PdSPxrz8eCZbc3oskW86tCVAns1ntSU199SY=
X-Received: by 2002:a05:6512:3e04:b0:595:7fda:d381 with SMTP id
 2adb3069b0e04-5969e9d308emr1215107e87.3.1763666148742; Thu, 20 Nov 2025
 11:15:48 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 20 Nov 2025 11:15:47 -0800
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 20 Nov 2025 11:15:47 -0800
From: Ilyas Gasanov <torso.nafi@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 20 Nov 2025 11:15:47 -0800
X-Gm-Features: AWmQ_bnL_b-6SGab9gq0K7s5J6qS3y9JPRk-Gm6LrpS6Nxgh5JJ00YxA06YEYb0
Message-ID: <CAEo2pzvpEXYZzpLXesDp=wvQJ7VN8yaVZZDkCMvFzKySaezf_A@mail.gmail.com>
Subject: [PATCH] ALSA: hda/realtek: Add quirk for HP ProBook 450 G8
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, alsa-devel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

My laptop, HP ProBook 450 G8 (32M40EA), has Realtek ALC236 codec on its
integrated sound card, and uses GPIO pins 0x2 and 0x1 for speaker mute
and mic mute LEDs correspondingly, as found out by me through hda-verb
invocations. This matches the GPIO masks used by the
alc236_fixup_hp_gpio_led() function.

PCI subsystem vendor and device IDs happen to be 0x103c and 0x8a75,
which has not been covered in the ALC2xx driver code yet.

Signed-off-by: Ilyas Gasanov <torso.nafi@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c
b/sound/hda/codecs/realtek/alc269.c
index 6748057e6a14..10c83cd3460e 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -6590,6 +6590,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8a4f, "HP Victus 15-fa0xxx (MB 8A4F)",
ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
 	SND_PCI_QUIRK(0x103c, 0x8a6e, "HP EDNA 360", ALC287_FIXUP_CS35L41_I2C_4),
 	SND_PCI_QUIRK(0x103c, 0x8a74, "HP ProBook 440 G8 Notebook PC",
ALC236_FIXUP_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x8a75, "HP ProBook 450 G8 Notebook PC",
ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8a78, "HP Dev One",
ALC285_FIXUP_HP_LIMIT_INT_MIC_BOOST),
 	SND_PCI_QUIRK(0x103c, 0x8aa0, "HP ProBook 440 G9 (MB 8A9E)",
ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8aa3, "HP ProBook 450 G9 (MB 8AA1)",
ALC236_FIXUP_HP_GPIO_LED),
-- 
2.51.0
