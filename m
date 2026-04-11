Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBEC02FD1A5
	for <linux-sound@vger.kernel.org>; Sat, 11 Apr 2026 18:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775931294; cv=none; b=fjohL87JG1o6T7vxU1voog2yCFkAVW2afeUYUIdMtjwhf4SXU9QOQqtidRGni+5Le1N/vWcpkGgS+MxjRqyMHz0vIgIcORGxHLxkQ2XBEjxLlqK0mERjiCeVe16RSZr8xPKv9Hzp8V44v+bMKbF/uFcGYTHxpfo9GKArDL2/mdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775931294; c=relaxed/simple;
	bh=KRE7tYreIueZw6rmcr+y4K+R4NsRdi42nDjO15fcPxQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=I7IDexVGfEpMGqN9FD2Fnz9/61NtBZk/KfxquejliXT9tRzTGotQv5WQXmQTK2MEVbheXgOjoIgQoIvSVqWFa9HT4m0zuxsVKM/deHeuhCLPdbuD9wkOvW9HJ9eFPqPzQkZnlL0BYl8s7UyaeXP5NeJrxE5mM+8utzusTY/xE8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XeaIbMui; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XeaIbMui"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2d78e5d275aso991283eec.0
        for <linux-sound@vger.kernel.org>; Sat, 11 Apr 2026 11:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775931291; x=1776536091; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ix1eKmfU+sfayUmCasr21ZTIa0EdvtzRO9/JzVxx9yM=;
        b=XeaIbMuih7I0cQJ+imLTPf3VD5zJgCdUVMX3LFF3xooQPRJNrWad0qUf8um5QfjpGR
         fUDkn12QKkBeIUL65zDpgZ9pJP+Bch9irpDfIjwEuKjk+Igwo9FEn3cGE0suZGAOTTWm
         IOX11oBaCH3VumMWINEnpw/hwnw+XTQMIzanOU/4xsYOdMWcNyTxEocuHdiQ0cqgUClP
         JZBk9tTZGi09Uk4yWx/VKDDY+c6Gp0+Zb3c0M9vlEcAJjpCQzBsIIlMVV8jCMzYtxGn9
         Tdv89wS7FYcjbwvdDXeJTzg4eh0+TAyg1LKLQY9BhVC+bKpFpa/6iApJniZgETWKQnwE
         UVWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775931291; x=1776536091;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ix1eKmfU+sfayUmCasr21ZTIa0EdvtzRO9/JzVxx9yM=;
        b=oBypWJLeqyQ5TyS84pZP+lGzb3sNoV3tnhi/2GIiUANJrMSFGl1cxsJ9xeqWfpaf59
         38xa/BOP8usM5qgdr1wynJ6+nZbAwbeASMHHkO9iteQfsQqOBVb3aSYD4ljbMc8s/9FA
         pg6x4X4YqPIdVcqT1xJIH1OUzXpOWK7XYxuE7wZthZhKqvGto8PON9QbfT8wkJM+L84v
         8TbCuhrB02FvUXU8Zl1Q8ZqnSl5lmQRNEjYtT+usw+lOy+SS507oEZK/7zChWDzJaqL/
         fRWOWtL7YF5bk+56NEOHKZhNgh0z1qJp5Rw3LlR/deB0Ulprfb/ZgPRDiMuObrixEkiE
         6wmA==
X-Gm-Message-State: AOJu0YyRzRo3/bZcZiCKcYbHDyMt4wEBBknw9NS842WooDT6a7AkIF3b
	DLBuBPOmi8EJo0rY2F4RoGTE7eOyhBXqCO0Wie3LjcV+Tvb9KayHKHQKtDXUZdtv
X-Gm-Gg: AeBDiesTJBFOVRk40xlH6dePi6+IwimDaBZ/yVo6koGYqRW3KfWkCJ422m4OLI+/mKh
	v3y4CJwVXeGyP84cwfdY0zrOOiF5qrOXLGyBUswA0XY4MhSZ6JSkIPc6lX1sCy7cr4UZ0NUf4xC
	ygL38e5U566dywzHxm5aE3Fh1yYrP7qKQR6x/vapx3scThGNhGPVYKu7JuoKzX6q4BeZxi8JZjl
	rgYsOlsbZSFJdNet5ifVscI1tvBZ35mLnzE7u7CGVgLf+S/eF+Xq+80SKjBPF0SxBI77p9JjDvc
	s1nGJbsWwfWLjDlOX6Gc6lDHRBQuzeWAz0Wq1dejHF8uO0E+BmSEubcY+oYuW0FiqajpfjNxF8U
	c3uwsEdN0cDgk8cMyTr8Q87wrHlBKTM0N6e29QzaPwV7HAaEAPLdRu/BLI193L+SsSEDTEb4New
	uEr3egBSZwlqIzZgq9e6PR8zjp33EoSlISH1xiBp+4wq+KGyyV85YraToO/vrTPxnIoXUkO+iux
	AWm
X-Received: by 2002:a05:7300:a287:b0:2c6:cdb3:bd5e with SMTP id 5a478bee46e88-2d5891766demr4685746eec.28.1775931290712;
        Sat, 11 Apr 2026 11:14:50 -0700 (PDT)
Received: from [192.168.1.18] (177-4-160-195.user3p.v-tal.net.br. [177.4.160.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d55faa5257sm9627404eec.9.2026.04.11.11.14.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 11:14:50 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Subject: [PATCH v2 0/2] ALSA: sscape: add suspend/resume support
Date: Sat, 11 Apr 2026 15:14:39 -0300
Message-Id: <20260411-alsa-sscape-pm-v2-0-aeb5682e14b0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/12NQQ6CMBBFr0K6dkwLCNWV9zAs6jDAGKCkg0RDu
 LuArly+5P33ZyUUmERdolkFmljY9yvEh0hh4/qagMuVVazjTKc6B9eKAxF0A8HQQZpYazLEipD
 UOhoCVfzag7fiy/K8PwjHrbIZDcvow3t/nMzm/eLG/McnAxoSfbLl2drcJu5ad47bI/pOFcuyf
 ACTAZ6XvgAAAA==
X-Change-ID: 20260407-alsa-sscape-pm-438816ccfece
To: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2085;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=KRE7tYreIueZw6rmcr+y4K+R4NsRdi42nDjO15fcPxQ=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDJm3+qfPkFVSW5v+aOlu81Lp2oMu06YJ7hc4lXLB5/XrR
 c/P22t/6ChlYRDjYpAVU2RZnbTIck/Xg6v1cSs8YOawMoEMYeDiFICJsH9l+M2+Pf3AL62HhgwR
 drdOrLlkr8X2P6qSoyXN99ySk2XnZl5n+MNRxfR35pufysnbdzxILPmUv/XirI4PPz407JMPdkh
 MnM4JAA==
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
Changes in v2:
- Change host_write_unsafe() and host_write_ctrl_unsafe() to return bool
- Document the helper return semantics in the function comments
- Rewrite sscape_restore_midi_state() to use the same chained-success
  style as sscape_midi_put()
- Link to v1: https://patch.msgid.link/20260411-alsa-sscape-pm-v1-0-3058d988783a@gmail.com

---
Cássio Gabriel (2):
      ALSA: sscape: Cache per-card resources for board reinitialization
      ALSA: sscape: Add suspend and resume support

 sound/isa/sscape.c | 327 +++++++++++++++++++++++++++++++++++++----------------
 1 file changed, 232 insertions(+), 95 deletions(-)
---
base-commit: c58742258cf31132b1cb7141acfcf6a49b4cffe3
change-id: 20260407-alsa-sscape-pm-438816ccfece

Best regards,
--  
Cássio Gabriel <cassiogabrielcontato@gmail.com>

