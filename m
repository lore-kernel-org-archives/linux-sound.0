Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0C039525B
	for <linux-sound@vger.kernel.org>; Tue,  7 Apr 2026 15:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775575384; cv=none; b=bPPgZw3Fy+2H768eyf7gjXe/a05vCVSk+i8IgfZvQ1HiLVtYPGGh+bITYwuuIkwqu0bvxdhFOKfqZAmNrUbrXnbLOzacvEgdLBmHtKgqj+8KvitLKpUHObEKfoVoWfHq6SLoJ1GsMX9UcY637Javfr4jEfWNJWZyVRiqKqd2Z0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775575384; c=relaxed/simple;
	bh=7xAcDnoANfMkOUa7FJYaAqTecKkJ2vwObNlw5tVE+Fg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OifWeFGAZrKsF/297mttfy/jGwfQk5f/nKTks4h3Gku8pdfOHs9oo/VADwe6xXd3QmpOTYTxMCCNG1UfQhEX8ep7YQ+RrOdiah5q7tLL/qATeOBCZZZuB0nlNT5TYIqmT2xnblhMcVm4br59P8AgFzRhNEdSmukU0DH1gUHK6Fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RlSnmqKD; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RlSnmqKD"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-126ea4e9694so691161c88.1
        for <linux-sound@vger.kernel.org>; Tue, 07 Apr 2026 08:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775575378; x=1776180178; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Hl4daJZMSgxL92hhxEtQIBTFDs61/QkM57gia4RaYw0=;
        b=RlSnmqKDur+GMesIAnXW+wTA0+wq5FfbsC7A++u4TVcAoBf8uBOpNqMFQEQx0f1fjq
         2esGcb3KA+HhYSUKBD1PU7CKSHT2V47yrhlbG3u6YYtFlA8asNGVG9FbqxJM2Ebh/Q+0
         a5++eTAhBMJrL6oHV+SAaCyWo2f26mQZj6AoPkcQ2/iAogJ/eLtIV2UKxoj7GpxNu3dM
         B7V+MgKPldj3a5oZ4tsHRKhkD1ZvJqKDJf0158cvwxIZyPtr+95BZomSDdtvSFWLLS8+
         mBbUXAf8REW0y5SvxsxFrneB30w8c2KUhdcIUkCrY/vGILCLH6GAnZYl1685rwQzCGTN
         mUdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775575378; x=1776180178;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hl4daJZMSgxL92hhxEtQIBTFDs61/QkM57gia4RaYw0=;
        b=lHR9wmTvOGK15/7JJyoNa/hYkFCuMjyQHp+449zwUn6WLt9PoM0P39YT6kf81NDysS
         BDYhtGOM8wrBh3VOXrydPug3MC5mUrChCZ46PZOIFKABQC0hRf9BabsDQsMCnlo29wS8
         K3OvOrJ8n4mPVQtkmznmUy+K9yTTjoumLvHyv7RnFsdJLDT2nEAdyIqsDO77FB43Evkz
         oC4yess6yavDHPc3vJLeOLp9s/0HZsJwm/w9bvUqFQYmll9aUp/7/fIRKmS2ckj3rhnY
         OeumK43XR+Su2iR1K0YupUJDepKsSvOwNiIwB42Ca0OVFYi73ydldfC3ZWLIoFRoauGz
         qGIA==
X-Gm-Message-State: AOJu0YwnoqN6xqfHIw+QenaICWEGfaeEUYRfffJNUSCRdqVW1TXrRwf/
	eDqu/McTUT22nBcqoFjBt6WynxQ9xbfn59vgnNwF/8EnPBODn/vARtEY
X-Gm-Gg: AeBDiesqlTgJPvh73GWyx8+bQiXW5HHTDmRWSmIkLozjkVwrnMS7xhDXjGLVZE1P9pj
	OA/seHZUYyl1/RiGSykRQYIFOn2NUjdU+HgWyWvUUszZHtJloTHKIj9BSovZzkZaeNIQav9iaB8
	Un6mKfLgBnyf6GN2+pD58fMQhpc/Sj2a6nEtkDWDOP7Q0QwksXkMG//su/npuxg5iRzIw7TY9Yc
	UKtKBytq2Om23hDCeBiQoxh+qwB7J3/fJfkwh+u4pQV7ucO6absHuJVi6cCtfcnXouCBsLkFol8
	KRqCuteHwLRJUyPWLIZej7CBhSxzhpaGNK8lL50hAA/qmqGwSlolbL8ti6M/gT5Vftvox2T+4LA
	urz6XADhGUAxEqwsnOJ3aMij1vZQfQ5SUNom2pRNMj14c8AKk5XPhBewaW1M2bTnqIZuhSpHgJF
	bN/j1pZd/qIaK5ttsWfyxuil26SbasON2mRIwWo7Ob3CrTG2dp9wgzADm/JOjKr4sw4/1xNHt3B
	agj
X-Received: by 2002:a05:7022:221c:b0:128:d438:cad with SMTP id a92af1059eb24-12bfb74c7ecmr10016569c88.18.1775575377652;
        Tue, 07 Apr 2026 08:22:57 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-167.user3p.v-tal.net.br. [177.4.161.167])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12bed93f861sm20628473c88.0.2026.04.07.08.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 08:22:57 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Subject: [PATCH 0/3] ALSA: add suspend/resume support for InterWave ISA
 cards
Date: Tue, 07 Apr 2026 12:22:48 -0300
Message-Id: <20260407-alsa-interwave-pm-v1-0-80da1151f59c@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBA0avIrB2YBg3YqxQX0Yw60qaSsVYQ7
 27U5Vv8v4FyFFZ4ZhtEXkTlGxIeeQbt4ELPKD4ZDBlLBVl0b3UoYeb4dwvj9EFLlSkr3/iODKR
 uitzJej1f9W39NSO38zmCfT8Aza/4cHUAAAA=
X-Change-ID: 20260406-alsa-interwave-pm-609259dbdf02
To: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1561;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=7xAcDnoANfMkOUa7FJYaAqTecKkJ2vwObNlw5tVE+Fg=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDJlXFf1OdU/6s/vb13l/agPeVztYFP0PDrBYesL79+8XD
 Cab/29P7ShlYRDjYpAVU2RZnbTIck/Xg6v1cSs8YOawMoEMYeDiFICJWGxlZDh3ZUfcy72mrxgP
 T2b4Mq3xz+rUfbbx0v7Sz17GPk2IiznCyHDqTshrbXet413n01d98mB43/O0KGxpw4ptpr+N627
 +v80OAA==
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

This 3-patch series wires up suspend and resume support for the
InterWave ISA drivers and their PnP front-end around the shared
GUS PM helpers.

The first patch moves the remaining standalone
snd_tea6330t_detect() EXPORT_SYMBOL() declaration next to its
function definition as a requested small cleanup.

The second patch adds a small TEA6330T helper so the InterWave STB
variant can restore its cached external mixer state after resume.

The third patch adds ISA and PnP PM callbacks to snd-interwave and
restores the remaining InterWave-specific state that the generic GUS
resume path does not cover, including the GF1 board registers and the
detected memory layout.

The resume path intentionally does not rerun probe-time DRAM/ROM
detection. As with the shared GUS PM support, this does not guarantee
preservation of sample RAM contents across suspend.

Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
Cássio Gabriel (3):
      ALSA: tea6330t: move snd_tea6330t_detect() EXPORT_SYMBOL
      ALSA: tea6330t: add mixer state restore helper
      ALSA: interwave: add ISA and PnP suspend and resume callbacks

 include/sound/tea6330t.h  |   1 +
 sound/i2c/tea6330t.c      |  41 ++++++++++-
 sound/isa/gus/interwave.c | 178 +++++++++++++++++++++++++++++++++++++++-------
 3 files changed, 191 insertions(+), 29 deletions(-)
---
base-commit: e051f09ba003f8b93dda4a8d55a1bff797235c0b
change-id: 20260406-alsa-interwave-pm-609259dbdf02

Best regards,
--  
Cássio Gabriel <cassiogabrielcontato@gmail.com>

