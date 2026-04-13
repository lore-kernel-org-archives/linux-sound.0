Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35BA01AE877
	for <linux-sound@vger.kernel.org>; Mon, 13 Apr 2026 03:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776052219; cv=none; b=MphAtpSuOzqRpA+DkTel/HUwIzQe4kuxAGWBl/Xku2izO1aNcaG0kCh4n2rL4gYIzNpMN7RzXQ3yHbl713ht/EK9IjrFk8LKnYhcyYBDG1mYAFvIu0BPwI5NPqId0dPAAEKQiXeftnGj6/0KqMHQuBzdpTj26KghvCogP/qhZUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776052219; c=relaxed/simple;
	bh=sUgTRHI/W3UUd+iU8UhxjC6qCu++A+/ABGXJUyI6gHI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HPnfqn/U/UbO0zmoc1HPwEjR6neBdXXY1VFqLHGwaQdH2p93oTyblm34XAladykxXfYYydeULcBpmW0IJQ/7NP5dMN/mH7PUa8Nwk18oqh4DjblCwt1wu5R2nOEP98HL2kGkjkhH3cHNSLzXeGDGK2UjL2hDk5Iffu7YFIXvTUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FzQcat7V; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FzQcat7V"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-356337f058aso2598531a91.2
        for <linux-sound@vger.kernel.org>; Sun, 12 Apr 2026 20:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776052217; x=1776657017; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wxEeQY9im1AmCCM45HxJN6Bh41heW0/mNFDoxVPaN+c=;
        b=FzQcat7V1elonExQrhMM2et6FUpjr1PjOUO7JUOU58aWU4OhCORhvKgFGUyUjqBopE
         yR05auKX+WdZRgo4YR7xdYZBHTf0CMeJXyGACUGJ3COnFH4348tj52lWHtyB1rChXNHn
         GE8cbgWcCM7zfNpFWmjSzoua8zkmCSXg02fd3rrAo+wipXyisCqtqEODSmslgllVobNJ
         bLwie3mKiFg7NzQIkTWJ83MIDa1XG8DO2xHuHs7DqH47Vgsag+8XVBT95fgIApoK8UyN
         RUAnUNkYtg3cJEzIxG43x2JA6XN8t8Wxga2L17MESuBWdCw698pv7R9QbequovqdLd5h
         PScA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776052217; x=1776657017;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wxEeQY9im1AmCCM45HxJN6Bh41heW0/mNFDoxVPaN+c=;
        b=e4n35nTxUy0DYdUnML9u+0EhmDq+OqfRmY97TKnhkZ7iRtnQ8PDrn7nrUR0tkVhlDb
         K+qfgk9ejngrP+dTSKOdtrYm9OHxa0zbe0T+KRS87ysMTnMRJsLalE04iGPDAQUfmuG1
         JhqEgLadvNrzrNf2PJk4C9E+3hPJWguRB3wL63lTFYt26qSa5sdEp/DaLGqRZ9P34Krm
         3EF7Tq36EkMxLmYt3MVWzeeUHwYjvtZqx4sbChOhIOkPt81AAJzcP/DccOU2Mx8cC0vt
         GzjmpBWrl6wWnkgphOZc56PkY8/bAjSAtYRl2khb6k4vQTbLZmxD1CqtcgdzOuAQKeZm
         cv4Q==
X-Gm-Message-State: AOJu0YwOegdHeRqPnFfP2pIjyR6tNMYHwwNErNvhSUQc1RStlHwmNDrt
	JbenjO7QkS20tS6nhPBf+kiH8VUMaA1Iea/60w2Wgr20qnmSKSeXVmxM
X-Gm-Gg: AeBDies9MAYF89Fe+dXRMblAKwh08khdPfl538t+iI34i+6jpjUI9N7OvaqGN2C+B0o
	e7sbuZtL/k7PjSEQ+6ZLhSuLSgvpcbo7C7RzSaI/L+2/BYuhgOX7LSi0j/zmYoYJz3pstTNrsXH
	fMtbl/9oIZbEck+512F1Hhrl5j0/XNt5ag1kKK8QlGnm2vTDwi1H7wdUleRqcwvWu368CKgksFm
	jcbSmNJRtM5ZUdXQLpUX+R5MP9VtCOTLzc3oROkaUcCpQtIS8G6VFVp6OVomAWeXbMa8HqULw3Y
	owgeX4RsD5+2dr5ya0fuVLII0VR8uy8JGomO4PU7Hp/KepInP0MEdY4dN2pm8vGhfGeIZwtusEo
	mvqo2jugqFIHJPaEB8oXXroHi/73SGSCukhBofMGklaisDWhDgjKjIA5E2XeMJ9FPqTHFos2bGN
	08wWnlRfTyGzlJwFCr1hswxWhhSRUVEu7iTtmChqq2oxpj5L/Lf7A1L87hmr3XpdfGqPbFPTFZD
	A==
X-Received: by 2002:a17:90b:4ccf:b0:35e:3aec:718b with SMTP id 98e67ed59e1d1-35e4281c516mr11022514a91.15.1776052217523;
        Sun, 12 Apr 2026 20:50:17 -0700 (PDT)
Received: from localhost.localdomain ([2405:6580:9cc0:8700:96ae:8c3d:9c98:97d9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35e4e2dbf47sm7030644a91.0.2026.04.12.20.50.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 20:50:17 -0700 (PDT)
From: Berk Cem Goksel <berkcgoksel@gmail.com>
To: zonque@gmail.com,
	tiwai@suse.com,
	perex@perex.cz
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	andreyknvl@gmail.com,
	stable@vger.kernel.org,
	Berk Cem Goksel <berkcgoksel@gmail.com>
Subject: [PATCH v2 0/2] ALSA: caiaq: fix UAF, double-free, and USB refcount bugs
Date: Mon, 13 Apr 2026 06:49:39 +0300
Message-Id: <20260413034941.1131465-1-berkcgoksel@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes two bugs in the caiaq USB sound driver, both
reachable via a malformed or malicious USB device using
raw-gadget + dummy_hcd.

Patch 1 adds a missing return after snd_card_free() in setup_card()
when snd_card_register() fails. Without it, execution falls through
to snd_usb_caiaq_control_init() on a freed card (use-after-free),
and the caller then leaves the freed pointer in usb_set_intfdata(),
producing a double-free on disconnect.

Patch 2 takes a proper reference on the parent USB device in
create_card() with usb_get_dev() and drops it with usb_put_dev()
in the private_free callback. It also removes a usb_reset_device()
call from that callback, which was both racing against an
already-freed usb_device and inappropriate in a teardown path.

A related stack out-of-bounds read in init_card() was sent
separately and has already been applied; this series is the
remainder of that investigation.

Tested on 7.0.0-rc5 arm64 with KASAN and lockdep enabled.
Reproducers require CONFIG_USB_RAW_GADGET and CONFIG_USB_DUMMY_HCD
and are available on request.

Changes in v2:
 - Correct "Fixes:" tags on both patches
 - Remove null check before the usb_put_dev() call in card_free()

Berk Cem Goksel (2):
  ALSA: caiaq: fix use-after-free and double-free in setup_card()
  ALSA: caiaq: take a reference on the USB device in create_card()

 sound/usb/caiaq/device.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

-- 
2.34.1

