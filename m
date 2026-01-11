Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 988AE274B28;
	Sun, 11 Jan 2026 00:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768089612; cv=none; b=HVH14nKltLQ7Yg70iYM/PAiihSSbuvFgUwcrxzrkLbMDHWW+CvcOMwLF0oQlOUQ8C3FnHfnQMubz595uXrR6aEXm5QxJghjsmyW5oxzDTzJ/dbaQJgOtQ45ibAX+LPt1vtI6mFBPrQ5YCoesTxl9CjbskxlZxDyqdddwYRowRaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768089612; c=relaxed/simple;
	bh=H4N9PsBGEJPo4IAeq0qKuUDWqwRsGooNAVwhlwSdv3Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FDxwHeFbLjbl08C0jICxhguwC600lTss21yIKiY972k420yAf6Ugfd0aJ8bx6dsWwDUVOciSZLVcVwob+thKvd9fcd1J2P61Tq7XIvBvplDjFtyCruGeQmhq8zYXmPkS3FXVYQT+t80683rWfWj4OaJeGjkYgCQqUvDtfS9lSZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cDE+an4d; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cDE+an4d"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 41FC6C16AAE;
	Sun, 11 Jan 2026 00:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768089612;
	bh=H4N9PsBGEJPo4IAeq0qKuUDWqwRsGooNAVwhlwSdv3Y=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=cDE+an4dGR5zGlicM0RbCbZV2YGO5+pQFJonysBYSju2bcj2eEhhK/3WG0h0a/1ZY
	 jY1si3YmG1WGKAwumVo/SAmc6rrmYVSKI+2zA2Z6FucGFb4b97luWDO+nPX5xTtR2L
	 yhSOq7rBj+pP6buKRSC09mBI6gtoUxXrel3kP2duYxXAYNg3qOKMtNJnAYw9H6XAV+
	 N+ZNHhS5D/vHLMr4tCMUA55ldRq6jjQ34BETfnglWPEM+lC0gYwtFz2oZ745Qnr+bp
	 O06yXTFmLM4nknhs1FTwLzSz+d1eSHAWkjE7Hymd4UwPA2ddUYM5O8EDKcmpCDDEQP
	 LdG+RoSpY4ghw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B04FD2502F;
	Sun, 11 Jan 2026 00:00:12 +0000 (UTC)
From: fenugrec via B4 Relay <devnull+fenugrec.mail.com@kernel.org>
Subject: [PATCH 0/2] ALSA: usb-audio: presonus s1810 minor cleanup and
 document
Date: Sat, 10 Jan 2026 19:00:02 -0500
Message-Id: <20260110-preso_clean1-v1-0-ce2dd3ea4506@mail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MWwqAIBAAryL7neD6IdVVIsLHVguhoRCBePekz
 2GYqVAoMxWYRYVMDxdOsQMOAvxp40GSQ2fQShuFqOSdqaTNX2QjSjTaaRdGF9wEPely5/ffLWt
 rH2Bv/0JeAAAA
X-Change-ID: 20260110-preso_clean1-162b2bd8bdb9
To: Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 roy.vegard.ovesen@gmail.com, fenugrec <fenugrec@mail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768089611; l=917;
 i=fenugrec@mail.com; s=20260110; h=from:subject:message-id;
 bh=H4N9PsBGEJPo4IAeq0qKuUDWqwRsGooNAVwhlwSdv3Y=;
 b=sRBThhzhd4AEjrhXoBisahm0ALdhRUUg3Gm8f+O9n147AezVgh4S9tfaUiHzT3D9+AbLq7PKQ
 Ld0cQQEyDuXAgRKB5egQRlVaZnBIPTm9yqZkpl74Mh2+ZsB51Uh+NaX
X-Developer-Key: i=fenugrec@mail.com; a=ed25519;
 pk=lEWyQQHFuqFAWupzIuoHgEvr9FgSscJjTpmL97lrmOE=
X-Endpoint-Received: by B4 Relay for fenugrec@mail.com/20260110 with
 auth_id=597
X-Original-From: fenugrec <fenugrec@mail.com>
Reply-To: fenugrec@mail.com

- Use __le32 fields for structures sent/received over USB
 Addresses a comment from when this driver was initially merged:
  https://lore.kernel.org/all/s5hd0agcjw1.wl-tiwai@suse.de/

- Document constants and protocol details common to the Studio 1810 and
1824c devices

Except for a hypothetical big-endian platform (which I cannot test) where the first
commit would make a difference, both these should have no functional
change.

Signed-off-by: fenugrec <fenugrec@mail.com>
---
fenugrec (2):
      ALSA: usb-audio: presonus s18xx uses little-endian
      ALSA: usb-audio: clean up presonus s1810 consts

 sound/usb/mixer_s1810c.c | 224 ++++++++++++++++++++++++++++-------------------
 1 file changed, 134 insertions(+), 90 deletions(-)
---
base-commit: 7d0a66e4bb9081d75c82ec4957c50034cb0ea449
change-id: 20260110-preso_clean1-162b2bd8bdb9

Best regards,
-- 
fenugrec <fenugrec@mail.com>


