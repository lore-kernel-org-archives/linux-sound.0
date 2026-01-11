Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37215268C42;
	Sun, 11 Jan 2026 21:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768167410; cv=none; b=t9Rllk+yXPOj3klMtAl3doIYz3ZEx8yLamDhl9tTYyDsZzK6WALpu9rG5nfBpFE3j51fl03OJEjZV88/zMWmq5SJSaD5qMQv9aw3sUFImgOCWAW3OR1doZomYtRcxmugo1zZ+gktBy90Qh0Roj0OjEUzs78h/oJHqfoFWHdXSpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768167410; c=relaxed/simple;
	bh=yzHufDSAmjhHeJmk9w8TQVb2dLlvp/K/O4FdfAf56cU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bTdj3spAI9QLrskC+200d7SVbfYCS8KHErEMSKOr7JXWZ9+GFk5WwJ8VWran8fz8j6+OGwbImQ7DscSnMn9ZqMfuNR/El0GGRGbnkuJkMLh4bdgyRyB//k0P+WjTj/Ys+d2oJpk5C2K65//Gp4xT6msgHUsieWw1xHAkM+z9uFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tcwJ5tDr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tcwJ5tDr"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C4D8EC4CEF7;
	Sun, 11 Jan 2026 21:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768167409;
	bh=yzHufDSAmjhHeJmk9w8TQVb2dLlvp/K/O4FdfAf56cU=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=tcwJ5tDr6A382gqcyY6gT3pas8VcexA14cKLD2MWxVs5nusttp1lFLnf3c5tzvtHb
	 Wp3X4A+PlENTTrmAeZq9XtUEbGnN5hH68U9vt7Thz/M1abozX1UjO0c1Ao2OIiDfqu
	 cJcBA8UNd1We9N3R/sZTRlnWs6UWB9H+1LWzwz+WUJ2eeWCwztTZLt9nFpKp46LK6/
	 HIo/5CNKkfJnrX6BDQ+5cc0+mnu0TNhznxozHeoCj1GI12EzEcTv4aybEdPimxBUvR
	 3+hcemclY3djBBUTkUTMFSgbLw7H3jqSw6/gx7j1cOTxqL91s9bQkqdqOicg99R0uw
	 k3ObAKA1n+5MA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFDDCD25031;
	Sun, 11 Jan 2026 21:36:49 +0000 (UTC)
From: fenugrec via B4 Relay <devnull+fenugrec.mail.com@kernel.org>
Subject: [PATCH v2 0/2] ALSA: usb-audio: presonus s1810 minor cleanup and
 document
Date: Sun, 11 Jan 2026 16:36:39 -0500
Message-Id: <20260111-preso_clean1-v2-0-44b4e5129a75@mail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WMywrCMBBFf6XM2khm1KCu/A8pksdoB9pGEglKy
 b8bu3d57uWcBTIn4QznboHERbLEuQFtOvCDnR+sJDQG0mQ0olbPxDne/Mh2RoWGHLlwdMGdoCn
 tvMt7zV37xoPkV0yftV7wt/4JFVRaeaYQdmz3B20uk5Vx6+MEfa31C5Q7o7SnAAAA
X-Change-ID: 20260110-preso_clean1-162b2bd8bdb9
To: Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 roy.vegard.ovesen@gmail.com, mickflemm@gmail.com, 
 fenugrec <fenugrec@mail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768167408; l=1149;
 i=fenugrec@mail.com; s=20260110; h=from:subject:message-id;
 bh=yzHufDSAmjhHeJmk9w8TQVb2dLlvp/K/O4FdfAf56cU=;
 b=NS7SnewJkiNsiaE5u3gF9KrKwzjhSkmxkGL+BmXSbd7JtjiE06audx4q7H3IkcDYIY/qQEJO+
 hPFedFvtvGYA8qp0XR/uxL2m8o19S52LLawyK9FJ4JaT1rHLQaF/ckL
X-Developer-Key: i=fenugrec@mail.com; a=ed25519;
 pk=lEWyQQHFuqFAWupzIuoHgEvr9FgSscJjTpmL97lrmOE=
X-Endpoint-Received: by B4 Relay for fenugrec@mail.com/20260110 with
 auth_id=597
X-Original-From: fenugrec <fenugrec@mail.com>
Reply-To: fenugrec@mail.com

patch v2 : apologies, I had missed an __le32 field.

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
Changes in v2:
- fix an overlooked __le32 conversion for .tag and .len fields
- Link to v1: https://lore.kernel.org/r/20260110-preso_clean1-v1-0-ce2dd3ea4506@mail.com

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


