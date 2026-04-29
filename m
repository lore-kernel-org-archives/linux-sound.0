Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 512BC3FD129
	for <linux-sound@vger.kernel.org>; Wed, 29 Apr 2026 13:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777468816; cv=none; b=SPbMvJYSxFjnfVDqDmgLUf3YBTRoiP8Ugm7H+GP40+gnRA3wGPRDawXpuBBeVc2IWTuwqha0a5N40VaycK7K1bMV5/mLemmi97T4G1iPYTRbu6Dk0D/5Qr7eEXSPj7gYYIN1i9O74/7pj6HB16JiZxLyf9Qa5QH3iu2lP9xaoqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777468816; c=relaxed/simple;
	bh=V+z3lB4+pCRWf3agDWSa+KADY1fFSo/WBirj1hovzuM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=e6rPt0XLgLpPfAnZuVhBjLS6hda6Hy8znedzgKgtZdKo5xt3J4/WIXFLX9T0XCzM/FSzledtsEAWGdrWF/hf6InHefBnPVVKp3zanPiUKM/EFjnXgf5MuSz67HS7iuwDMoRgtjjGOGYyeFwvNMNyzfYTlFpYbARU6PqYzFVZH7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EB1FcybH; arc=none smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EB1FcybH"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-12dbd0f8063so2537912c88.0
        for <linux-sound@vger.kernel.org>; Wed, 29 Apr 2026 06:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777468814; x=1778073614; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=miTiWvSjRX28D9+/gaoocQinz9zlsPUu/gC8XD44ro8=;
        b=EB1FcybHBRKOF8TbvlMHJov0pXbugl6AHmTT0K3xDiSuEaeBlAZe5vm/QDUud+5kr1
         KsHPrE42R6Quey3Gm2P9JEMuMd33hw8GI5GTurZv2QqqQ2scbpowxapkd7rLatJGHwGa
         j2BOE0lc5Nmp2dG/xImqu3q5WyIhYyexVZ2R7QvXMAvEsZMIem//tSAV9IwDo9KPVqsN
         2o+chj3otlH4mxUDcobWzGpS92z6cWvqcaz5BvlfrVVWrf+qJhMWLW4yWPQJ1XAbVKOH
         wVCDEond4VHx4O/fWHaoWIXyVJdpY9i51Hjr/SWm3QFA/kh4kSF9eOZb3Mc+o8JhLnrr
         l61g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777468814; x=1778073614;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=miTiWvSjRX28D9+/gaoocQinz9zlsPUu/gC8XD44ro8=;
        b=Z5gPMDMr6WUhXvm/hCuLkdguvwFpq33lutkMz5etXfaRWG4c4fU3PvBeHLfH+4jIKB
         KBnn7MV2ifIfCW3jvTobAyZc1iz5t2IlMEPr6zTWHhOd+36whOCkkyt2FsM7DxruGVSj
         YXkVmAjvbJgdPMvAECXYl2nBF3f2wVyxo/C71P8s2WcLJRL7P7zbZI/pMeggnlthpCtn
         5ZMF/5rf/lUtFuQtl7IhTI49Eqr7BFKJlojGaVDD/C7ILBGu+rDm5arVKjjoJShr2D8m
         7egHtH6tufcPAc32nClosScs3KMMbFpMyObfcmDLw5rsKtN/RT0bt1VAfV/tvd3LI34D
         ckCw==
X-Forwarded-Encrypted: i=1; AFNElJ+NuAb/BejypIggY/qsj0VTG4vMOJ2yHMG9nKT+GA3h+8ieHPqHy9w7GTij4hHgejwUpWTXa5FC/Ks9dw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywh3VvbTfkTG6oMNNax2n2ijqXpUhvNrvq2pjyp0F9en0McOJ0v
	bd5ufOBZk/FGxMSWwWB0MP/7nv/I426Az03o9S04jhbUZ/wjsGuDbkm9HCxyGB8w
X-Gm-Gg: AeBDieuhrDB5G8CqfYAf2vVITpuGyoc6Ht4q/PshL67VK1j5rHzxHT+BBQciqDVv5/e
	+kPSJ8BMwQ14Ecmyw7Sy2DkZnHTerEBmHf7udkY4jRL/CZxz1oMaY7Vt0T3ENpm7iFFHGLb5WaU
	16uea5onprhk6gZY3/eG4tjS1kLLbjgZ2COLIOxPMGb0B/GaaPRKP/nlf7t0S0q7sdMBH+yhutl
	+uNmq/5sh7G1EB799YVjB6+k4A3t33wynl8vg3osTAdtn8pzz+GjOEOma+uBHQ6lsvb4gVkPVAe
	QXvUixpy6XFfAIRxx9M0es3YJPAlbviUgdftnPppmShXkrYHZ35SbbwFRAxw/yfClr0mazokjee
	8Mu3xg87WhabF0b5Ibbn/s+/HVLYTOhPTYgqvNYGspg5j9dcXs+CtDZ4+HGhezXNepQLV70x6JJ
	bqZASDaTLX2wd0TH3nqPWNFV2WGEfjz4MpNGLLH6mv33gmbiuyJhVOreyjXB5hCx+DcdwEkcYZ3
	23lt7jD2Cnh
X-Received: by 2002:a05:701b:2908:b0:12d:de3e:52c7 with SMTP id a92af1059eb24-12dde3e5305mr1742619c88.43.1777468814248;
        Wed, 29 Apr 2026 06:20:14 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-87.user3p.v-tal.net.br. [177.4.161.87])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12de321df36sm3336852c88.7.2026.04.29.06.20.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 06:20:13 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Subject: [PATCH 0/2] ALSA: usb-audio: Fix stale quirk control caches after
 write failures
Date: Wed, 29 Apr 2026 10:20:00 -0300
Message-Id: <20260429-alsa-usb-quirks-cache-rollback-v1-0-01b35c688b80@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNTQ6CQAxA4auQrm0yjPgTr2JcdEqRygRk6hgSw
 t0ddflt3lvBJKkYXKoVkrzVdBoL6l0F3NN4F9S2GLzzR9fUZ6RohNkCzlnTYMjEvWCaYgzEAzZ
 7cid38J33DCXyTNLp8htcb39bDg/h17cK2/YBE6Q4joIAAAA=
X-Change-ID: 20260418-alsa-usb-quirks-cache-rollback-43a07052f22c
To: Takashi Iwai <tiwai@suse.com>
Cc: Thomas Ebeling <penguins@bollie.de>, 
 Ian Douglas Scott <ian@iandouglasscott.com>, 
 Jaroslav Kysela <perex@perex.cz>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1453;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=V+z3lB4+pCRWf3agDWSa+KADY1fFSo/WBirj1hovzuM=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDJmfWLs0PcQW2ih92uabLqp6NUTi/tcfdbzmxzh3vjCc8
 nN/yNO/HaUsDGJcDLJiiiyrkxZZ7ul6cLU+boUHzBxWJpAhDFycAjCRtwEMfwUYklX2XOfZMTFb
 YV3+TIG6F9snhS+9fm65IfeTLY93lB5k+B8Zymu/nfGZD2tidXsz73+9y8pV9otW5oVPu3zY5Oe
 yL1wA
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

This series fixes stale software cache handling in several usb-audio
mixer quirks.

A number of quirk callbacks update kcontrol->private_value before
issuing vendor or class writes. When such a write fails, the driver can
keep reporting and later replaying a value the device never accepted,
because the corresponding get and resume paths consume the cached state.

- Patch 1 fixes the simple single-write quirk callbacks by restoring the
  previous cache on error.
- Patch 2 fixes the RME Babyface Pro packed-state callbacks by updating
  the cache only after a successful write, since those helpers already
  take explicit arguments and do not need private_value to be updated
  before the USB request.

The split keeps the generic quirk fixes separate from the Babyface Pro
packed-state logic and keeps each patch tied to its own introducing bug.

Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
Cássio Gabriel (2):
      ALSA: usb-audio: Roll back quirk control caches on write errors
      ALSA: usb-audio: Update Babyface Pro control caches only after successful writes

 sound/usb/mixer_quirks.c | 61 +++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 47 insertions(+), 14 deletions(-)
---
base-commit: 7b04e87c2a10db9c65b3133949bbe1b738b6ed7e
change-id: 20260418-alsa-usb-quirks-cache-rollback-43a07052f22c

Best regards,
--  
Cássio Gabriel <cassiogabrielcontato@gmail.com>

