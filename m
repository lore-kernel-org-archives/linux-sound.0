Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29825395ADA
	for <linux-sound@vger.kernel.org>; Mon, 24 Aug 2026 22:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787612287; cv=none; b=Q1jjBY88mgFCAmcJvKaIEMovPUjXU2RisyuGfE9A0wx0ht4YL+Z0xYwTEQ8uNrCYG6nMjMj/10/SqC2ddRx0TYx4a9kLSKTqBZFqKDuCFr3DqW6/uhRWtpEiHcZYdFZJwvYAZs1Ed9hsMmCNxUPCryM077FgsaU4f8WT5JmlabU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787612287; c=relaxed/simple;
	bh=IyBwhLHd+jE0+iL7FDx6j2pCg2WajLabASjvo+oHiTQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U0zLFnS+0MKI8FCVrJ/a9l5bhgkg141YnEugkg2L8pj71H33FSF7qddyoSZSMLqoVKy454qM4xdygI0+4mnLSaVGdjLENPj4AO99wbYtm2tbld2JHBlHpxC2HabVduqNGucH6yZAo4I5DHYIYZjaknKPDXriq3AqXWTYv044LDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=grPj789C; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="grPj789C"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7f3fd905828so3861385a34.1
        for <linux-sound@vger.kernel.org>; Mon, 24 Aug 2026 15:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787612283; x=1788217083; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=E6W0bPfd+nM/ppVeqdZLGZJn0EkNY7VWXGgGxyZXP6k=;
        b=grPj789CIEx1bVWiUDCtB7lC5FsOYBZRIztYWQu55nx/eRcG/Cr7UwD4pmh7egbW7C
         77PgsCCmOFzvd07kxpFIGEAkBFRbAsdlLutdnqopVARJPiu597BU+3Yz8VGN4X3Rc9DH
         +h9yz9KKx6ZeB/zlJWYh3CBsQh9gZHc9liPuxmvACB0GY/wexM2UGTnB0LhclXWOxrMW
         7ipUbnbPS9DYj36biRuk/AhQjfv5u5BRJ/ftmm9sHMMwI//hvKJ1/gpCvN5J/vS0/SRq
         5bVyQGVlKRNk57w0NmnJp9ktqideKapLhD+qINISsATfABPVNM0ZLUdnPgJIzFrBA6/z
         qKNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787612283; x=1788217083;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E6W0bPfd+nM/ppVeqdZLGZJn0EkNY7VWXGgGxyZXP6k=;
        b=Ho5b5XvwrjUpy5YmYEg+aIMjzOXejjGXJQUh8IbfMys9FtJ7Cj8SObVKSMVj+HYkZj
         +0Nf9tMCGCAn5sIt1Ga/HHH9OhnYmRnPGH5X+Pit1cHKnjKzzWMxeXFSPb0XmyxfDTQR
         uaOhOW6IGg4n9N1Qlp3rpCNeY0TLTo6/BVl8pM53hw+9asUJqP8wA9mJk99x1C4ejx3n
         R9UhH5DMNsVVPNidYbyZx0FJyYwq1JLgerU3U7I4GdILsZ0251BLx7jMQls573JYvTPg
         Fam1B3Srq6RA2nSaF+IBryHsyvbwnwvx0ol+Ba2nMVSrAa+JiabjbGQz/kxR4N3WCOdl
         jcDQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqx621ZDfqO4gR6mgYlJ+2D7LIiH83Rg9ubof64NAwiKJvG5ds5gdv6ZUhL9nkYDEXx4xrXOXvUgrTJ1g==@vger.kernel.org
X-Gm-Message-State: AFuF++kGoQ7Tp6YAGWI/sZIjrQbJ5OIH27QLMQ7UZ6eLd8KYfzPiNuo6
	pY4BjBiGdYE1gLKnSkjtO7hKpV0VHyURGAsXlJfnXmC4cqAh6VjEn4qI
X-Gm-Gg: AR+sD11S8Ojf9XOnuh3/ya8zhIgRERY6JKEg4x5WYBUo7A2CVRTVFKj8+m7pcvmKhtq
	kHnXZIwIILm2+O0u4qNJqcert09DUc02Pv+Q2Wp/Tnh1xiJV4tLhkIkY9Pa5LVmxqO3+YRD9Hcp
	6FKyENHCt2UZnoz/KzPyLJElLayciuW4D5K93E0fUSNmBDqu2+hd7ayyRndlFjqssyKKVxp6B81
	aAdtA7x2pt6npMfVWwRNAzpKu/84Ck8B6rIQvxnS5vXgDkAH145P/pVBvgNICjv7ctehaEPmYl9
	792cyOfCgexoJ9d/lJAAiqxv0RLGDNxFh34PC5bEmC/POaPxPhxRrKs6coiCR9z6WNDwIQ9rLby
	GgNXiE37jrVP4B1myVYL9cwABvEVEBk57Kpe4ys6xe28dk8fEe7pUy/4An9J0dx/yyansOswvTu
	Q9oOvvH1iFT8UOwpmQ3TQcm8fBxqI2maTi0yMawJQYf1FJWi2VA8sZTq9W7j9Ks7zMKxjbcePli
	Qr4eQ==
X-Received: by 2002:a05:6820:2016:b0:6ae:4d57:a5fe with SMTP id 006d021491bc7-6b16b4cc8e2mr19026437eaf.20.1787612282982;
        Mon, 24 Aug 2026 15:58:02 -0700 (PDT)
Received: from localhost.localdomain ([2600:1702:4ff0:baa0:5054:ff:fe3d:4ddb])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b17c8328c2sm4983002eaf.4.2026.08.24.15.58.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 15:58:01 -0700 (PDT)
From: Will Porter <mrwillporter@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Cc: Jaroslav Kysela <perex@perex.cz>,
	Oliver Neukum <oneukum@suse.de>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: usb-audio: Complete cleanup after system-resume errors
Date: Mon, 24 Aug 2026 17:57:57 -0500
Message-ID: <20260824225757.26749-1-mrwillporter@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A failed system resume can leave the card unusable until reboot.
usb_audio_resume() jumps to err_out when snd_usb_pcm_resume() or
snd_usb_mixer_resume() fails. The error path skips the out: block, which
restores D0 and decrements chip->num_suspended_intf.

The card stays in SNDRV_CTL_POWER_D3hot, so later control access blocks in
snd_power_ref_and_wait(). USB core logs an interface resume callback error.
It does not retry that callback, so a later callback cannot complete the
skipped cleanup.

usb_audio_suspend() increments num_suspended_intf before returning success.
A system-resume callback must consume the system-suspend count even if a
component resume fails. Otherwise, the stranded count skews later suspend
and resume cycles.

Do not apply this cleanup to runtime-resume errors. Runtime PM can retry
-EAGAIN or -EBUSY without another suspend callback. The count must continue
to describe that suspended interface. Other runtime-resume errors latch
runtime_error in the PM core and do not cause an immediate callback retry.

Both parts of the system-resume error path are longstanding. Commit
88a8516a2128a ("ALSA: usbaudio: implement USB autosuspend") introduced
err_out past the D0 restore. Commit 862b2509d157c ("ALSA: usb-audio: Fix
inconsistent card PM state after resume") later moved
num_suspended_intf-- into the out: block. The error path now skips both
operations.

No third-party code is needed to reach the error path.
snd_usb_mixer_resume() ends in snd_usb_mixer_activate(), which returns the
result of usb_submit_urb() for devices that have a mixer status URB. Its
mixer->private_resume hook can also fail through scarlett2_init_notify().
snd_usb_pcm_resume() issues a SET_CUR request to a UAC3 power domain. It
can return -EPIPE or -EIO when the device stalls the request.

Route a component error through out: only when system_suspend is nonzero.
Continue to return runtime-resume errors through err_out. Later component
resume stages remain skipped. The original error still reaches USB core.
A later transfer can fail if the device did not recover.

I reproduced the system-resume failure on an Audient iD14 MkI with an
out-of-tree diagnostic mixer resume hook. An injected -EIO on the unpatched
core left control readers in uninterruptible sleep in
snd_power_ref_and_wait() until a reboot. With this patch, the same failure
restored control access. A second system suspend and resume also succeeded
after I disabled fault injection.

Assisted-by: Claude:claude-opus-5
Assisted-by: Antigravity:gemini-3.1-pro-high
Assisted-by: Codex:gpt-5.6-sol
Fixes: 88a8516a2128a ("ALSA: usbaudio: implement USB autosuspend")
Fixes: 862b2509d157c ("ALSA: usb-audio: Fix inconsistent card PM state after resume")
Cc: <stable@vger.kernel.org>
Signed-off-by: Will Porter <mrwillporter@gmail.com>
---
 sound/usb/card.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/sound/usb/card.c b/sound/usb/card.c
index 24112e491779..9307da95efbe 100644
--- a/sound/usb/card.c
+++ b/sound/usb/card.c
@@ -1282,8 +1282,11 @@ static int usb_audio_resume(struct usb_interface *intf)
 
 	list_for_each_entry(as, &chip->pcm_list, list) {
 		err = snd_usb_pcm_resume(as);
-		if (err < 0)
-			goto err_out;
+		if (err < 0) {
+			if (!chip->system_suspend)
+				goto err_out;
+			goto out;
+		}
 	}
 
 	/*
@@ -1292,8 +1295,11 @@ static int usb_audio_resume(struct usb_interface *intf)
 	 */
 	list_for_each_entry(mixer, &chip->mixer_list, list) {
 		err = snd_usb_mixer_resume(mixer);
-		if (err < 0)
-			goto err_out;
+		if (err < 0) {
+			if (!chip->system_suspend)
+				goto err_out;
+			goto out;
+		}
 	}
 
 	list_for_each(p, &chip->midi_list) {

base-commit: e72d5659a2606056a0c34af212b46a3275a55bbf
