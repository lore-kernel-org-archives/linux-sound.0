Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558D338DC74
	for <linux-sound@vger.kernel.org>; Tue,  8 Sep 2026 07:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788851675; cv=pass; b=hY4WUTBhq3TMH56Brw0J53elYx1wFq4nA/aFHVO3dtJdrZuvHahnQb8M2BjfG8nWa7C2WwFZLLrxLtj0la8/FzCqFazQ2id+z8Z4av0Lw9to1H/8iCul/IgNDI0U1BayBAnDWGEjlrRp62Cx4FYntNPgJg6q3LhtXWfZCWRTUFc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788851675; c=relaxed/simple;
	bh=Lq+H7fjvdiTHCVvY/X7Jqll5FE1PxLN2pbotz7iSVnQ=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=cVobZuCi5nghQRgBgaXvHu4VSsV0Upd/7kNTVCRBk6BFT1pQvmA9L51qLxj1YS0kBY0dTzztddL9PCDL+w0xRA3mHzCLhuH3a3QdZjCgxytfcw+Me3T72oBqyb31mbv5kD3eQWxEMmYGoH05I0Cw9TkawXRTliG0sjuC8HDGCCk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dXP+nvQW; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dXP+nvQW"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f8694aeso58187566b.0
        for <linux-sound@vger.kernel.org>; Tue, 08 Sep 2026 00:14:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788851671; cv=none;
        d=google.com; s=arc-20260327;
        b=PyJJjgSs7FxXX3Ml1NaudokDUwmjY1LZgVG2e19mVGsMlhplwB4/w66piWNX5Jn5mg
         ekbBTNOeWs6viLzbPm+bq4eR2s29ubB7aZK3ByCHlnGmfTG40EsN7QpMBbBwsu0jRVt8
         24V1znJ42tB/lq1d1qjH/3w47LQJT48umGK2/3EYKihXvtP8nKBN8+tyx/eMYSne5mum
         4YCckKcFrR2m9zRab0Q5g1GYnXfi2abaM2/gZ0oG2/XL5dj/kHaJ751psVTKnhRJRmcG
         +jPqKuqYjSjcauyoj4T8xA0LnwhxughOD6doajLkjyonPtQ9efwyxMZEiMFBShJFIgxc
         WKow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=OuSgQaFuMiBT/hyUJUGLeSsyjyCiLEpDuIOnGVlkv+A=;
        fh=aAjySkCCJ0w505SsLN5frkjdB4MN2noKaJ5lPmOKroY=;
        b=QLe2/VNJRtasgjvn+5Nb7YUXHLRgl4VEZlGLa0hRVPGubs5l8TA6Kquox9GWSmsWlF
         4uOd8fbdvCGS8gOUyvmNSTI+rTRrK2eKo+Aigk9MvKHmZ1rPJrnORmocYJ0jBaLq77Mh
         5IsKXBer2bj6R9G9LCFnLe61WOF1WFhW7KjLu87ZtGuwmKuQSQ7thr3wzTlRupBC2pC5
         b7EM9vo6Ou2fN/QTFfRRlxE4jy7SpQe0jtwNJT03tyKt41stmUwWya40K5dXpDshhk62
         ea+BagujNaSe5DSUo/zFSYPovssri136RqQ+Zw633lL+kxwiNUABb/5bklNn9JE8nA1X
         OA7g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788851671; x=1789456471; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OuSgQaFuMiBT/hyUJUGLeSsyjyCiLEpDuIOnGVlkv+A=;
        b=dXP+nvQWQCi1Nlc9zgEjV2CZK+6jb/CpumKshwbTbLV7u730ZTSnr+V7Q/iiVRFu6i
         SkHUavSjIohWK+7DhfQLu9f53QuPPF+FEGCz1azPriRun6+efsBZ75FfpAPHV5VVrlos
         EiWnv3dh9lpsV8+K0jJhu5g6++Lr0YRMUfe8h3GPn0uMLBhRqiN4DGt9hoB124iGOXCf
         /Pd8RtLFttljJT8/hJHsBuc7KqxW+qAEpSYS6ztcuCArMrfw+RlBv3sGg/RhOCaPL/Sy
         j5NbmlJO9zUkqaqD/ErTUVR75a3roGIpJ4kV/FCKD35ORVAEnFthRCh+SIqnuK8JH48t
         0tPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788851671; x=1789456471;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OuSgQaFuMiBT/hyUJUGLeSsyjyCiLEpDuIOnGVlkv+A=;
        b=I/H5nlGEgYFM4MQqBppZVlGWhO+CMXDKmwHEcX/3XKJNB/TpDr2THxpdFGguoLreY1
         A+I6bvVYXi+g2N/wlO2m1ZW8ad+JLDRO5DAj7lD+Swysogfr5jXlPNpwjQFsxeZAH8XK
         afW0N/4Ee9wlE/2SHRqW+SMbVV7xG9QjtRW0d0GjpWixpHQ4ulGOiqni+VlNKx6pKqBN
         lpA3GJ/rdPmw0iksuiiph937WRgDO/bawOXh2OwzbJPRnqTGaiHchdbimy84S4Vng3M5
         oUFJCWLZhCurQVIM6IptlcekIC7RjHtmaau3RDyFp+wdXeV2szY1YB0geh2xKUJXTDpg
         jQ8g==
X-Gm-Message-State: AFuF++lduNPFnlzeUgU9DBsXT89GndoKd57S+CHJWg8QEBpHylxZPK3J
	3w7i1JFdHz8Giim6GrI8OrlZIg8w+ViK3JPFWfL/hLvWjveB6vUtWyrKuOe3AiW8xZjoH+GhKJY
	lmJvlQy3yF4ZmvwVQtuCoMLV0YrZKDuIq8z+5n1Y=
X-Gm-Gg: AYBFou2wOJyHu3qkxKf+RYlSSfTWAF9q4FM83+iUkh4fY28Tsj/K2wfDoZAsxHHt35Z
	HE3UL0lk7F9JYBA9iWVmkOINu46eEutbH+eHKdbHXsRmGrs2NFgh2nY9kULvYC8Vj/7qf0bLqKV
	qPeWPnOEMUe3jloKLVmmxMSF1am1xisO9uvjl5H8WyZqPVWdCKwTNCehHJyDUTtw4VzhtpftsfP
	VMVCmWz2yjC4+iTU/3n4gNbHwlD3p3HOMuMMcPPVFgdsRe9lU0xeKbH/kAaHc2hhTNFodF84nsB
	ya51Oh0Q9sagds1R5lAnLv4OMSZcqhig3mLx9/tHAhMVBg==
X-Received: by 2002:a17:907:84e:b0:c25:35cd:fdb2 with SMTP id
 a640c23a62f3a-c29042fd596mr217529266b.7.1788851670960; Tue, 08 Sep 2026
 00:14:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Eirik Kvalheim <eirikkva@gmail.com>
Date: Tue, 8 Sep 2026 09:14:19 +0200
X-Gm-Features: AcwNN1WO73osviuaxZ-N4IDuSlvhLJP0Kjj-WG4guc7OGxE-CaFJYmH-wI-2-uo
Message-ID: <CAKwi-_QqvHSDFnt3A71RRZRyaWPAOWArZBHVHffE8znQw+B8+g@mail.gmail.com>
Subject: Jabra Evolve2 30 SE (0b0e:0e36) needs QUIRK_FLAG_MIXER_GET_CUR_BROKEN
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.de
Content-Type: text/plain; charset="UTF-8"

Hi,

Note up front: this report was researched and written by Claude Code (an AI
coding agent) on my behalf, on my machine. I have read it, reproduced the
behaviour and verified the fix myself, and I am happy to run any further tests
or try patches.

The sticky-mixer heuristic disables the playback volume control on a Jabra
Evolve2 30 SE, leaving the headset stuck at roughly -48 dB and effectively
inaudible. This looks like the same shape as the SteelSeries Arctis Nova 5
issue fixed in commit 0663d1df8d28 ("ALSA: usb-audio: Fix mixer regression on
SteelSeries Arctis Nova 5").

Device:  0b0e:0e36  GN Netcom Jabra Evolve2 30 SE
Kernel:  7.1.9-arch1-2 x86_64 (Arch Linux)

On every hotplug the driver logs:

  usb 3-6: 2:0: sticky mixer values (-12288/3072/1024 => 3072), disabling
  usb 3-6: check MIXER_GET_CUR_BROKEN if you believe the mixer is non-sticky

and the volume control is then absent entirely:

  numid=7,iface=MIXER,name='Speaker Playback Switch'
  (no 'Speaker Playback Volume')

-12288 in 1/256 dB units is -48 dB, so the headset's internal amplifier is
pinned near minimum with no control left to raise it. Userspace volume at 100%
is then just software gain into a nearly-muted amplifier, which is what the
symptom sounds like. Note the third value in the triple differs run to run
(3072, -12287, -1023, 1 across reboots), so the readback looks unstable rather
than genuinely sticky.

Interestingly a cold boot with the headset already attached was unaffected,
which masked this for a while - only hotplug/re-enumeration triggered it.

With the quirk applied:

  options snd-usb-audio quirk_flags=0b0e:0e36:MIXER_GET_CUR_BROKEN

the driver instead logs

  usb 3-6: 2:0: broken mixer GET_CUR (-12288/3072/1024 => 1)

the control comes back

  numid=8,iface=MIXER,name='Speaker Playback Volume'

and the headset behaves correctly. This has been verified across hotplug,
simulated re-enumeration via the USB authorized toggle, and a clean reboot.

The quirk table currently has one Jabra entry (0b0e:0349, Jabra 550a,
QUIRK_FLAG_CTL_MSG_DELAY_1M) and nothing for 0e36. Suggested addition, in the
same form as the Arctis Nova 5 fix:

--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@
+ DEVICE_FLG(0x0b0e, 0x0e36, /* Jabra Evolve2 30 SE */
+   QUIRK_FLAG_MIXER_GET_CUR_BROKEN),

I have not sent this as a formal patch because I did not want to add a
Signed-off-by for work an agent drafted; if you would prefer it as a proper
patch submission, say the word and I will send one under my own sign-off.

One small documentation note while I am here: Documentation (the ALSA
configuration guide) describes bit 30 as "mixer_get_cur_ok" and the kernel's
own log message points at MIXER_GET_CUR_BROKEN. The string the parser actually
accepts is MIXER_GET_CUR_BROKEN - passing MIXER_GET_CUR_OK gives
"snd_usb_audio: unknown flag MIXER_GET_CUR_OK while parsing param quirk_flags".
The doc wording may be worth a look.

Thanks,
Eirik Kvalheim
