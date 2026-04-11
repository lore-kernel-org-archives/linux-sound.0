Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B7A21B6CE9
	for <linux-sound@vger.kernel.org>; Sat, 11 Apr 2026 04:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775883279; cv=none; b=jhAUhk8VfUUEtCngAOxbJKBf6QnACzR4PpfMPw2d6RHu3UmxsYElTFQX8bs26OxQKiKjmwbrg43svfd47+QCxVLsASHuJi9Wg65ahrF2oNYYGbX/2gEB+5Qg+ik57aBg1FEzjRZe9U2m/OJVAVVzUbVDWATGbAViCQj2oCc/aHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775883279; c=relaxed/simple;
	bh=/6x6AUmNK18hoaugSCgmrIJZxi+Q7GR/56X47uyaEOg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=BeY67ayOAhJoZAZtcsaX8+aRs/Zj7xSqxG1FgQZVMVBIFzMhWRFW+V9MPOuoSbQfY9ZUfVp1SjM2px3/rCRtaf/slhLI2KqbodVN4lQu6+6IKbD3mm448OG/BfK6cQzdQ9vu0e6k8CFlWjz8rNufDilSXwYC51nLh3HI+SfWO9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rU05r43r; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rU05r43r"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2b4520f6b32so2949321eec.0
        for <linux-sound@vger.kernel.org>; Fri, 10 Apr 2026 21:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775883278; x=1776488078; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OOxHvQlp7lc2XE8a+0cTOjTpwROQLigGh80AWYw1kdc=;
        b=rU05r43rygHV4ml+KMt3+GWeKDa7pNHT/InXBzdF+S2VXVEraRysIZZOyfufAwAmfH
         bG0Invd25Qg+GElAaJHE1i959i0DOz2O8IRIqO8ObwkDU8ESzdDs9mleQjZ8aF1rY5h4
         oipc1PhZNVz0KPAKPWErdWTORVMjEga4nusAt5QRMn1wEvmethCbl9S3PtuApXjFjZEA
         0ZVDz3aHGHHog3gVd6POmou6fjqNzwz6B+/A2WgusMGfS5qTgsHCvcnjc0TIwKQfY2Ua
         UoCRLRTxcabUIzWgMAvCzubDGz/exIvv8RS2VzmhyWtoGPWeXKo9d8wVTk63eetTEu4F
         Yi0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775883278; x=1776488078;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OOxHvQlp7lc2XE8a+0cTOjTpwROQLigGh80AWYw1kdc=;
        b=KA76lHZqs2W7iDwPq3+EEndjyBpJGk1JvgNuwfsi8CNmYhnx2KthOqkflfcGWcviNe
         wPGzfoB2Wh92mw6FTpveX6QOrj7xGKhW3WeOf6kv5XuauDTRnBu8jk3VpPKC1NhLmR2f
         AAg2k8qCJkYpA6B8cNbGMihpZMxlHWkIivdqRu9MYUhAXkXkQxfKHvkE64Ue4TyJfYo1
         uASEtVXCydat7m+nW9I0EcKbTm2zkdHM0t8p+b/N2RYuiOrlBn44mD5LCvRbqrgeMl5h
         CPauYho38rLirJQY7YmTuQ5rcCASRGOkaKLPruIR/0N98P55HArSjFfaz2ydXA2Gj4O2
         mXAQ==
X-Gm-Message-State: AOJu0YzEffyLQjIhVfMf0WBedvY5m3HFX64/kta14S5BmX2LIgu1Ghxi
	SlsR/hmimmSZCuKjuCr48TQMsPW23gKHhp88F9zmYMAE9iifjbwPr6MV
X-Gm-Gg: AeBDietk6thMu3Tu3U2OXfPgh17+2/LDHTbe73iabwH/G3PLBRlQ1+fAvuFD2a8+yij
	1mOaWDK2n/bFEp9zqkU+BTgXF1G4FUvdFEm4H9WV9NUuCD0iwMjSKemBgrVN7c6Ij/YFub0bRKm
	k16/VeHYTQpj7+fU9EN52TSlRx1klLay0N72UOiYUNY50YgCdSXFukYImDX0Ei/frsNL/Y71ATK
	Y5kGuEdwsuEqHmaQxCJELXln6lbuSV1ulLVFKRRaeQTRpkaUr5tXXIDrYOTfAsrWMnFfw7W5h65
	SA4FkYPwvT880xEo+MfACYpE7f0fXg4eOahwRoll2uw2Je7w6uCl70NbU1guM9yfryJxgwvfEuZ
	fTpiF6nVwZczcQCQObZa227nvLUjIoOFA2qZYnJI+oTcMIuTZFHznRXSbvKr0SZv55g7AeTi9kl
	7sA7DraTCVNEk0HCH+229dsgVshMzx5YWbCgmr7EjbDo74rtkzP5v7S3lqA7iIJH5zPAJHfa4x3
	YBp
X-Received: by 2002:a05:693c:2c84:b0:2c5:d833:a4f3 with SMTP id 5a478bee46e88-2d58907b4admr3614838eec.18.1775883277634;
        Fri, 10 Apr 2026 21:54:37 -0700 (PDT)
Received: from [192.168.1.18] (177-4-160-195.user3p.v-tal.net.br. [177.4.160.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d561bde68bsm7378754eec.17.2026.04.10.21.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 21:54:37 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Subject: [PATCH 0/2] ALSA: sscape: add suspend/resume support
Date: Sat, 11 Apr 2026 01:54:28 -0300
Message-Id: <20260411-alsa-sscape-pm-v1-0-3058d988783a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMSwqDQBBF0a1IjVPQfjDiViSDtnwmFaI2XYkI4
 t7tJMMzuHcnQ1QYtdlOEauaLnNCfslIHn6+g3VIpsIVtavclf3LPJuJD+AwcVU2TV6LjBBQikL
 EqNtv2N3+tk//hLy/FzqOEyOsAldyAAAA
X-Change-ID: 20260407-alsa-sscape-pm-438816ccfece
To: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1730;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=/6x6AUmNK18hoaugSCgmrIJZxi+Q7GR/56X47uyaEOg=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDJk3r3Bd5TT8GFB+2fUXQ4beN3beuXLe324XPv5/T52/9
 j2nRH5hRykLgxgXg6yYIsvqpEWWe7oeXK2PW+EBM4eVCWQIAxenAExkVQEjw3cenUPxi08dtCv4
 n/u8avfvJeJvFK8ln975LPAIt4SJgBwjw62Vdo+T192OSkvlixLjOvDoD3Mv18RnmZJdNwL4LPd
 zsAIA
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

The SoundScape driver does more during probe than a plain WSS bring-up.
It programs board-specific gate-array routing and, on non-VIVO boards,
loads MIDI firmware and restores MIDI state before the MPU-401 side is
usable. The driver still lacks suspend and resume callbacks, so that
probe-time state is not restored after a system sleep cycle.

Generic WSS power management is not sufficient here because it only
restores codec state. SoundScape resume also needs to restore the board
routing, and on non-VIVO boards it needs to reinitialize the MIDI side
when it was successfully enabled at probe time.

- Patch 1 stores the resolved per-card resources in struct soundscape,
  factors the board reinitialization path into a helper, and reuses the
  MIDI state programming sequence.
- Patch 2 adds ISA and ISA-PnP PM callbacks, reapplies the board
  configuration on resume, restores the non-VIVO MIDI firmware and MIDI
  state when applicable, and keeps the WSS side available even if MIDI
  restoration fails.

The board restore path also replays the OPUS AD1845 activation step used
during detection so that resume matches the existing bring-up sequence
more closely.

Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
Cássio Gabriel (2):
      ALSA: sscape: Cache per-card resources for board reinitialization
      ALSA: sscape: Add suspend and resume support

 sound/isa/sscape.c | 303 ++++++++++++++++++++++++++++++++++++++---------------
 1 file changed, 218 insertions(+), 85 deletions(-)
---
base-commit: ddd3315ee2dab1d547f99fcd90a3f533d6688730
change-id: 20260407-alsa-sscape-pm-438816ccfece

Best regards,
--  
Cássio Gabriel <cassiogabrielcontato@gmail.com>

