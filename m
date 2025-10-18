Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E056A19DF4D
	for <linux-sound@vger.kernel.org>; Sat, 18 Oct 2025 14:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760796052; cv=none; b=qrJZ61gq9Vr7l/5l0ptWoiE4iQexYizar/P61yxFxCZHziB9tUfpE5oYcSHoePy8OYbmIy+mgdkSMjAKIxZa8YpDSdbbTcKBKQEehXmHtXEQJcoGy35ZMtW9M4QYmJlt/a7IbUu0GiWi40Bax5M9u6lcTeOkjnK8hLZSECFqO+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760796052; c=relaxed/simple;
	bh=w/abTjPT68vrDV4+HADcoA6kNtxBghm3muxos6BMjl8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=kFED6McIZ/XiGH91vDRH8HSokNNAjpGGXs7ZRsE72r0YZPG3yQQhlXTR40Dgov1gTkTbDAvio6XPVInwh3ke1qXQg9FGP1CsnsZPfg5keKClX0Bc8oGZtrLHLMSPvYuOxOfNmU3n27LSjzbd++LxGYSHRhXIoP42Z8Z9VNhNjIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZheAypVp; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZheAypVp"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-87dcb1dd50cso11532956d6.3
        for <linux-sound@vger.kernel.org>; Sat, 18 Oct 2025 07:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760796050; x=1761400850; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4BLZrU095MUBr0UdU2dvThEkdCh7BSBjKfzcFLerCTw=;
        b=ZheAypVpxJ6j238uhLlOOfFdlWpvNaHM+D/ydI6vsAI28vFAkDShfm2Npyr4OMFeHl
         aP0hct5Yg7JYbwCvCUk+tZ5cCC4bX0fmNC7iwxN+o7UYgKi29m0gZbNb1q4gu4oU2bPm
         0ZJkuL8ajM/Rr2VXek5bZ0ddRzALMih9oVKoiQ42OR5mVhbuHyd09QRZ6szGyPMUxaHG
         SDK1LUlgVSPMY8AuSQZqLiI4fwVBAnjmzDgRWJEhdpJRuiJgCQB9epN9wQyaU4ADFqd/
         p7dzf8rUtuRVpUc4xyks56oRPQrY5fn/VpUbB1IzMxT7XKf9asZ05FEufCvBxklpJ2La
         vy6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760796050; x=1761400850;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4BLZrU095MUBr0UdU2dvThEkdCh7BSBjKfzcFLerCTw=;
        b=jvG8nBwvOSDfR7kItcRZc0c5U6SR2/snJGF+yXmf3z3huDbItpzrRZODDcijfWhDrH
         ok20Ual5TbcMInUx7pZD4mnBV/6X9iWH50OF2i2Q0oucCnSIAkx25vADr9JRl8ETtuVD
         +cw2269zmPzJQBQNjtmGp9ugVRgGQEoGChEfluWKk07L6xbJBFwDoxPXQUlj5SlWecfM
         fRVHAnJnqH0XAqdIapMJg9YqDZxkGQYRBjA9QuTLvoAecVrTRXYgFDrnDSCMyNwH1Ze2
         ooVV7/UEyHQxNWJPsk0YgCZHwGsPn+HTx2+aAtWooYGtTPTWaN+77DEcdNQFpMhj/Yz8
         u9xg==
X-Gm-Message-State: AOJu0YzaNV4ZBrER3OvnnODcxzyBNl2HBO1JImWWERVIhVXebbVLtSBP
	7MdJPZrGIbvQCd9YsZw7HDZSYBUN/6bvCYwFqQ5z75N7CObML8yTzdEtNgZpoWwoJ9iuV3wzUtE
	yiHCMIOgw7ljtaxZ0wn6MnvbbNFBoJmY/LS5jVyA=
X-Gm-Gg: ASbGnctGCqjOIvhuj6o/hMHlg57x4+s+XF0E4zyKb9/YbeYzWqK7nLQnMy12b9Kpzpc
	9AMbH2z9aEu6tbJPy17+IODqV6Wz1NElSKhIhxUnYEoTjgMXjd4ipQwT84mHfkopsrBJhN/sMvl
	FqUvRr1d7mj0yqi1o9aft6yHWIorIhmefOaV9qi5+OnKbw+/Q0jsPxi+guVs8UnRjZ1qWMaCxg8
	vxGnOUz0S2F03V8UD0wmKNi+OanRmjsejmIFaUko1ZvCD9zc76mA+ct0h7ffAd/sj7oXw==
X-Google-Smtp-Source: AGHT+IGfpaRASfGqzS8HybnldWUVLkj8f8ZpZphjfJr8pn1CmAH2u6hW6GZ+ykCNi+wMUGA3NQNs3sY9niBeiWlFDDg=
X-Received: by 2002:a05:6214:4e83:b0:87c:21b0:79db with SMTP id
 6a1803df08f44-87c21b0807bmr88040776d6.67.1760796049539; Sat, 18 Oct 2025
 07:00:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: J-Donald Tournier <jdtournier@gmail.com>
Date: Sat, 18 Oct 2025 15:00:38 +0100
X-Gm-Features: AS18NWAZQuxXkRqCrpXDrHA73y3fTDU4k3DvOCehAEGLyWLZ-18rPKHg4l3KE8g
Message-ID: <CAHgym8KzzwL_TWXEPa=-BQmo=uCaC8vbKm95v48roe0BbwRiKw@mail.gmail.com>
Subject: [PATCH] ALSA: hda/realtek: Add quirk for Lenovo Yoga 7 2-in-1 14AKP10
To: Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

This laptop requires the same quirk as Lenovo Yoga9 14IAP7 for
fixing the bass speaker problems.

Use HDA_CODEC_QUIRK to match on the codec SSID to avoid conflict with
the Lenovo Legion Slim 7 16IRH8, which has the same PCI SSID.
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c
b/sound/hda/codecs/realtek/alc269.c
index 214eb9df6ef8..93fa4b888fef 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7078,6 +7078,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
        SND_PCI_QUIRK(0x17aa, 0x38a9, "Thinkbook 16P",
ALC287_FIXUP_MG_RTKC_CSAMP_CS35L41_I2C_THINKPAD),
        SND_PCI_QUIRK(0x17aa, 0x38ab, "Thinkbook 16P",
ALC287_FIXUP_MG_RTKC_CSAMP_CS35L41_I2C_THINKPAD),
        SND_PCI_QUIRK(0x17aa, 0x38b4, "Legion Slim 7 16IRH8",
ALC287_FIXUP_CS35L41_I2C_2),
+       HDA_CODEC_QUIRK(0x17aa, 0x391c, "Lenovo Yoga 7 2-in-1
14AKP10", ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN),
        SND_PCI_QUIRK(0x17aa, 0x38b5, "Legion Slim 7 16IRH8",
ALC287_FIXUP_CS35L41_I2C_2),
        SND_PCI_QUIRK(0x17aa, 0x38b6, "Legion Slim 7 16APH8",
ALC287_FIXUP_CS35L41_I2C_2),
        SND_PCI_QUIRK(0x17aa, 0x38b7, "Legion Slim 7 16APH8",
ALC287_FIXUP_CS35L41_I2C_2),
--
2.51.1.dirty
