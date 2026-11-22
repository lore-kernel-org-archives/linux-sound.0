Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795325814;
	b=G7t4ojxXkB9Bc/VIHVmDqCAXKU1bqdswmqR4WyFTiQZZyGm7kCrGb4C/NC4HXc5N1Zwg
	 zYGJPeLaXAu52E+uKHUZjZ3goUeozhrw0PAk936zKjOtLj6uC3BrIDigdSZO8cgFScFuw
	 S5dhePtq4fsGBTKQZusT2XnA0Q001qg+QKk9P9oeyr7jJ1m4VIjaF6wG3PKQCfl1OqE/u
	 wxI5GYuXw42xad5gWcEeZ7VomPSh1CKjXD0ZePqtNDH4PsDt4aIaoVIAnIX432R44sy7W
	 jDK/GIZ2nC+FRohsGuQVDjDgTE7GrjAP3w80p1iIsaJkeSXO2YJwFRWC8ZtngBbGckw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795325814;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=YvWsGnCW8qZbvK4V4/hIBem/e7jC3u/wvXY2Jdv8/GI=;
	b=HYf2UvW3w3aI+wzFqKI/ELyhqfW4GNeH0OOJZrmQHrcZxudsQa3dLmMsJ850696QR4ak
	 2BVOtkYGzXcDpsYZisEgY+YHo8G6E2cdvRDXd2p7iocgVfjn1j78AV3NEnP/GsYXtZdbh
	 d5guEoE1IDmSj6ue8YKfoLMH/N+X+GhtBZoC47CSnimY2kkox0KJ+REA29p4opxm8nL0q
	 bWqC6GJ2Rbo3wFCDdb/nMZCmzEluuBhYBJ7pbfZx1LRr4/c+walMZCyECBhbilzyixGWn
	 DZkdQWrJJaJyervtGzma4DkMzNu4xjljuAuwLVRX0YyVOtFXWngCU/AAjthwL2YOjoQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o+QsYWqq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.171
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C467F606A320
	for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 05:36:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C467F606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o+QsYWqq
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-8b4ea3c5afaso14931817b3.1
        for <linux-sound@vger.kernel.org>; Sat, 21 Nov 2026 21:36:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795325813; cv=none;
        d=google.com; s=arc-20260327;
        b=LLeAzPQQpx1KlFx9+Z243qx3Lfoe8JX3kVL3Z+5igJgPGQQgMk1iQU+nVPuqxiwc1i
         +wxt8F6dJqrczdpYoYCL/JmWvob5Aq2nf3bYH1ucn6oUSD6UZHa0I/wHxioWVDyf7rF0
         Nidh77oohh4Do/hEmIQqeVD5jSCCjMRJvNE1oTMndfnsr+DqepDqh1YLGLD/Ds44R+QN
         PAL8Kgb0nDBi0ackt2eQd/9T3HsZfKqXdhCvDgqiDwWVDH9ibHmTkM0FgPpmjdd40sns
         UwdhcJ0TXJdPFgR11Z1GfKPG3ffCsUgd/ghnpTTskaDH+LixT3/SMnSuqF4DYxueotbU
         iqKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=YvWsGnCW8qZbvK4V4/hIBem/e7jC3u/wvXY2Jdv8/GI=;
        fh=5TioDRFO7ovtfWveTjubbs0gggxuwh0JTadV9lo06bI=;
        b=ByCwXPM6IY7CIgk3Jwzc8ogUOp+xrpLPjKqGitxdGljSy0DJC6S31nqZMlJMj3Z331
         BdyEa3hwT1P+8ZsMC3qKoBgolFOMIrqcKrjCq/9zRJuEg3w8dVQa2qIeEPTX4sHeJcbg
         gQygxkHMjueQQWAGVuDuh9XXXRnDfMrsT33gn6ptge6Rhq/hf0Mz+1N1F1GS93q0QZFA
         Zzx+TH4Vrvyj6koy7/sLeCQfBLWva/oWtVnjuGBXnNEg2rOZiDKJ9cc8qVJKYkacDfed
         jSWv9zqsTXlKW2lU65TKIqkxXLClcqnwZ95w+ZQupupXMwJJ9xOmhi0+sY7I8M1BfUNy
         Q4eg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795325813; x=1795930613; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YvWsGnCW8qZbvK4V4/hIBem/e7jC3u/wvXY2Jdv8/GI=;
        b=o+QsYWqqPIL7FnvE/iWZo69xjevPwOu0YwN7BxN2scXByD94H8tWYHTOAvHpLxjLRN
         kHP6vTbWb4j/G9dJcb6CUxb0R4X6lOZj0PLub3iQsEqj+PD34a9MjZcTyCLY1Ua+QpUe
         K2yMJoGsF8GpPEo2wQAEF/xm58e+FcZ4XrnUmRxaFLizeU5+U9F0Enwoao2pvHDZWSSt
         zY9MaRUpmPQcMSwmO9ODAhWqA4qu+QuZ9wjLD/CzkpxXrfvE1ZNmD8F7j6MdUOdpz5tX
         KWsXXbeHmPq0ybxdurjemiMo1nkTlwkIWzuceWAhA5zYHzitJYj01J1Ut/9IpxJBSjDR
         L0rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795325813; x=1795930613;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YvWsGnCW8qZbvK4V4/hIBem/e7jC3u/wvXY2Jdv8/GI=;
        b=MRwoP/76+AuXGbLS64zvprRUR/aoLQdoVIUnfXindnVk8O+dhG1+IKX/alnovsNe3t
         c6hMePCxCM9S+1EQJ+iao1RaX+KNgw0Voq9JX3uRxRCbIbjDK7omUAwCI400FCHyKDJJ
         mRkiIc7ejeLN/vEm1WYvoJ88CWQNcrKqbCTyCiVFukOcm/oN1DOEWBVpDQJkfLBpRSCZ
         b+DgzxLekX3y2ZbPGsnJEteVFaXwrzP71wDAi7TS6EyIqstGmdweMNCcUaDPeg+4HT5h
         58THQqTB5GURQc2GT8nEk5MAANG00gJ5LesreHxbCeqo9MtCgHI+0xrwsM0vLaDGaysd
         qE2Q==
X-Gm-Message-State: APuU4Z+oifOMGwu9grVdq0+lMJ8tx8AE2CpWbsi2uesZC1ILe65rlXPm
	CQ/sYhKEVFTvGrpIwEVVTp5YJc7eBDCWgRPD1fKndhZfhOjaM6xmq86lSxv6gnS1L5JEbUZIYO5
	pvNIYATmUkZ8hfj+3/LSLddIrmPw6AEoj0uGi
X-Gm-Gg: AZFdTZcUTwnOjg9kobpOpegS8KuuEHtobBNeadCYBXzYx3HBlUPc36KSsuk6gqE95Ty
	VPPBeWL+L5iCaq5OgOtmuHbN65iz23ZzxpSj2WqDZtCqAB3rCRigMbe1oIjNePfpnaOUo2H9Hza
	YcvG8N1YHuVtDSgqDW4LB35+eyxI22PFd/JDDJBuwXBJJPPecwHHsbClhFANYW/o+8baqbV7Mnj
	S7kOWI8wVmFJBaz99fbVgaFruu5q8nc8oxkiCJfIkLHfodASSppVoSpuhh/Ys5IutTMClv2+TW1
	Ad20GIt89T/+ppEMlL9WWFF5J9W+ljgAjEiscwiEouDzIHJkWdpaScmX1vwGmOi4sx/cabKtXuB
	2S95v3PQ6lsv7adffGOvZidjH07GCTlTz0Vhg7fNEM29VR3BZDwz4Hria2vjFmMbkbtw2O7trg6
	dCJnrCmN18qJQCTDm9Peap5sBN
X-Received: by 2002:a05:690c:a08e:10b0:8b3:90db:a83c with SMTP id
 00721157ae682-8b52043c59bmr21818907b3.35.1795325812734; Sat, 21 Nov 2026
 21:36:52 -0800 (PST)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: James Barnette <calmasacow@gmail.com>
Date: Sat, 21 Nov 2026 23:36:41 -0600
X-Gm-Features: Aa3M54qJ9HYoPyIBuEzJxYVOOMthbUczOoIZJlUQCxXirFjBUQF2cOzGnRs8ZW0
Message-ID: <CAOUQ8cqsxCyU5DuHmvixd4cu6UFBfr1f+iXtK7HWfmo7HB=xsQ@mail.gmail.com>
Subject: [PATCH] ALSA: usb-audio: Add generic implicit feedback quirk for
 Elgato XLR Dock
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.de, perex@perex.cz
Content-Type: text/plain; charset="UTF-8"

The Elgato XLR Dock (0fd9:00a6) returns digital silence from its
microphone when the playback stream is started before the capture
stream. Starting capture first works.

Enforcing the generic implicit feedback mode
(quirk_flags=0fd9:00a6:0x20000) fixes it: with the flag set, capture
returned valid data in both start orders, while without it every
playback-first trial captured 0 nonzero samples.

Add a quirk entry for the device.

Suggested-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: James Barnette <calmasacow@gmail.com>
---
Tested on the Elgato XLR Dock with kernel 7.2.15-1-omarchy.

sound/usb/quirks.c | 2 ++
1 file changed, 2 insertions(+)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index a4eb0d0cd..7bb69d3e4 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -2681,6 +2681,8 @@ static const struct usb_audio_quirk_flags_table
quirk_flags_table[] = {
QUIRK_FLAG_FIXED_RATE),
DEVICE_FLG(0x0fd9, 0x0008, /* Hauppauge HVR-950Q */
QUIRK_FLAG_SHARE_MEDIA_DEVICE | QUIRK_FLAG_ALIGN_TRANSFER),
+ DEVICE_FLG(0x0fd9, 0x00a6, /* Elgato XLR Dock */
+ QUIRK_FLAG_GENERIC_IMPLICIT_FB),
DEVICE_FLG(0x1038, 0x1294, /* SteelSeries Arctis Pro Wireless */
QUIRK_FLAG_MIXER_PLAYBACK_MIN_MUTE),
DEVICE_FLG(0x1101, 0x0003, /* Audioengine D1 */
-- 
2.56.0
