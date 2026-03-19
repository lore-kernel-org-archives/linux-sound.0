Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F285629ACC5
	for <linux-sound@vger.kernel.org>; Thu, 19 Mar 2026 14:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773930739; cv=none; b=Hv8/h9Xdpml+tH1oXuLtkIZMvtw+Py6UoMdN45G1DihNNbEMjuzPAd+IDJjiwwga9fQYDNBa7TuQVm82Jkmc6/dulaDjMAyKhHO4Tk+iKXTjqkOJkPhC3HZc/MkM7Lgcj97voN5rQqtE5d+fWBqJAsrvAha2Lf0JnSYOXs7BSZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773930739; c=relaxed/simple;
	bh=8+V92aYaNVQeBqIth2ohXx1sjqlla6Cfs2ZkFcsdnms=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mQIR0HFx2Q7ROD9qB44fN63hHaoJqrfouMa6MVv0AQtPb3f8xw3vOZHn9FHxjQheuY8Mz8aAOgUTZHxD5WZWLKSxMGaDREMa2+DDkQuA+0ViJMcFL9FTxopGtCgI6j5pp7s3lo455/BwchBNUIyJ13Av7inFLX1ZJ89suNYDFdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UXtZs42V; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UXtZs42V"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-667f8794e97so1938940a12.2
        for <linux-sound@vger.kernel.org>; Thu, 19 Mar 2026 07:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773930736; x=1774535536; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=THAfndf5/RR95Rr410RC35AjX9OltSgHKOi8PHHZPkw=;
        b=UXtZs42V9n9ZOqkZ8T0gVHY3x4AqHjVtwY1kCeRxdKiPSU9JUhUin/Gajvuh17jvcW
         Tf+62vlH/gzeRQ46rg3xa4x25hdvuNlr71G3CTLV0jg9m+nHVaIxwMSqBm+zmNyNkSJN
         N42aG45T0gbrv53Lr5uC2DsIrCIDy/K6Wqj1wndXDWOpPCGBxlZnDorKylrtoIO6KIGe
         cbUXRT/aUPmhE5H6q0rqpQ7XsZfpYLl3RpYHSP8KhZBz2cKE79cSIOY6CIe6lY1Y8cKk
         XVcjCIoi7m9otAG3nPpfvqnq1RBzSeO2SWhS7KUn0grmFVkj1fi9c73iK9a8v3unBERT
         0hEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773930736; x=1774535536;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=THAfndf5/RR95Rr410RC35AjX9OltSgHKOi8PHHZPkw=;
        b=BwekCnIE1GqOBzUh9rZ2naIFeLyJzVEoCkrIMF2Sk9zhA/NrRxHNqv4TQYsVFSk1qW
         bI/n3C+PWzYTIfdOimb1IP6w3RqUSa36Zl1/fgeKzarHxrtPZk/CgHO/fU1wItHFhY5p
         d+9DhYBNoanEyVeJ67A+5deaz77eJRzlKDbPCmFAgbzDGuMK6tJWub/JTWN1W72hFRwQ
         6AhQmOkm7YoLw7GP3BjvkW8JYRgU46R5kTcZsmSrUSWuMXYVwRKTgwA9BbMOzgZ4RVJm
         VKteos7Y1ETvSl6NX7CokD1f4fZvW3Ld7Z1p6e6Y637VV0UvL71Xj/H24iGz66SD5X8/
         D8hg==
X-Gm-Message-State: AOJu0YwznnLkaULZlx8asmHhYCPAcStVcgcVYrVACq/hBzRFbpq/x3Y4
	yEhwkGNul5cUAS2Ep4Cp2lwNTWhBOroLeiuhbmevzSQL8kZyBEZqSUQAxgvaxD+S
X-Gm-Gg: ATEYQzwAkCda8gB38IYEW+m4+mkIUavxUYGRIsBbbHvWiCRT06hPn2R+pyVW1nVjpnC
	1Ge9L51XmrzTviQdivoc2iYvBTu/z2MmKmE6qb6GEq6oEsSSNsj88z3WSByD/7r4LQzW6FX0bbp
	nheU5Iio2DMyvrWTOiLtg7r+4khUBm2XnJV7f36Wf4HRKSqRx8a45NBHN4HpHsIZ1R/7AYv+TGY
	M3sXFuaTO/OQFPebtHlhHxDTqJR5rrEQxaRT7nStAwvJf2DeeJpEgHpVgvQKGK20eo6oR9l+GF5
	lVsjsOXdpMq6TqP6a7SYvqJjzbLRjhabO+Qo3y+2iu6cGB04ax6poRTobYaKfgOfS5R77iNWbpN
	3qvPRbVsZQI0b8CUZCsYzQsMDSzu3Jb4sX0kyo8UrwT0r20JUGUU50PMBnyMwFbRQLBt8t5ZzYx
	59WwSOsaK1rnFXA3AEesbAnM6JSTtRIQ==
X-Received: by 2002:a05:6402:540f:b0:668:368b:38d3 with SMTP id 4fb4d7f45d1cf-668368b3cf7mr2894969a12.12.1773930735531;
        Thu, 19 Mar 2026 07:32:15 -0700 (PDT)
Received: from linux-workstation.lan ([5.133.45.75])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-667b12adac3sm3620051a12.29.2026.03.19.07.32.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 07:32:15 -0700 (PDT)
From: Phil Willoughby <willerz@gmail.com>
To: linux-sound@vger.kernel.org
Cc: Phil Willoughby <willerz@gmail.com>
Subject: [PATCH 0/1] ALSA:usb-audio: Disable Arturia Audiofuse 16Rig
Date: Thu, 19 Mar 2026 14:32:11 +0000
Message-ID: <20260319143212.149090-1-willerz@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I am working on properly supporting this device, and I have published that
work in progress here:

Link: https://github.com/WillerZ/arturia-af16rig-driver

I intend to continue working on this driver, test it fully with all the
sample rates & clock sources that the device supports, and then contribute
the necessary changes back to the mainline kernel. This will take at least
several weeks because I need to source additional hardware to do that
testing.

Because the device has 32 input channels we will need the patch to support
that merged before it can be properly supported.

This patch chain prevents snd-usb-audio from claiming the device.

This is necessary because the startup sequence of snd-usb-audio puts the
Arturia Audiofuse 16Rig into an invalid state from which it cannot be
recovered other than by disconnecting the external power; even the
front-panel on/off switch stops working.

Phil Willoughby (1):
  ALSA:usb-audio: Disable Arturia Audiofuse 16Rig

 sound/usb/quirks-table.h | 7 +++++++
 1 file changed, 7 insertions(+)


base-commit: b3c48fa1fb397b490101785ddd87caf2e5513a66
-- 
2.53.0

