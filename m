Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 757A13D7A07
	for <linux-sound@vger.kernel.org>; Thu, 27 Aug 2026 23:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787872909; cv=none; b=Ig6bBSz1iQMWPtoLzlvSF/huY9gr42JvszYRXrAG5eBjaJKEnGlBygd4u9TZvj7ZqtfPiJNYu1Hl12t/p8vdJmsU3qRBEtNdYA9zDQz7EfAd9LKrDM8cxqPe2a26Txry0C4mTa+r+RdGowiCiLQHr3ssqjHuW4Bg58KcFSwybz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787872909; c=relaxed/simple;
	bh=kwFHr7vYUkztPHUgL3fZ0gh9BNRap/ndIoscvDQRoHU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iiK6tOtvV62dIOvbd18Vo0m7wnn3A8MCRVKuGMwZFdNWVuB0nHY8+SqIFh+wgZOZzhkIIPLZTqr5kHmE0QpM5HB5ueJ1st4fMiNU8rdCoxN9IGXS2lFz9NUrHu7z253DSH8WBGAhkFoElkcmFwKZXShdgQirZH7bl94IDd8N9EY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yz6Q4ivb; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yz6Q4ivb"
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-495c49f8eccso435467b6e.3
        for <linux-sound@vger.kernel.org>; Thu, 27 Aug 2026 16:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787872907; x=1788477707; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x5bv61JFv0kk4dbR7lVQMiqP/+ARN/3WHPKFmOOMiX0=;
        b=Yz6Q4ivbLLpMNHugMqt0cojrc0IP1Ob4qc+0fQc3ghiKf6OZjoAXdRMv2ESsuleU/A
         NwsxAUEl8N3KyXPOAWfF9aBMym0E3bWhSMiRYbIxbojmxgClKr+rz3hA4UV6zFLCig1D
         yWg0B22riwKGyLecf4hG4RfuE097K33CqMssVyEDtsrmdkyhBgOyBHgK3PpMwGXzYmZM
         jCU+HFXXIsVKwein1GEqyGAgS4F0lii+2mpHqWatk6pHXYJkJszumsgElPg24P/0t47+
         Mk4MEzp5Kcq4134bJPqvRR/ALdzJF3bpjty6+wDnM2f+NFwiT+TYLw5JHv8GpSWxlhsI
         zAXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787872907; x=1788477707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=x5bv61JFv0kk4dbR7lVQMiqP/+ARN/3WHPKFmOOMiX0=;
        b=TXdSBDrTX/OQwJMZiGJzrcQPHKljLoFGL0TKnAASJ8jpFPg6RxQNK0gyx51SWw1kKU
         BF1Bpnk05CTYX0JsYeYFW51+Dhj5eT8JXA+PEfNp2Fab5ihHCYWUPlyh/0SbSb06iwnJ
         8+HSlsBGIjaen72IB7sDLMgqUG00Yv/SNzbUrjqIyt83HBIf+kf32It4ouzOcSVRtjxF
         9BsGTqVrrdO6CCzsBdwei2XfzXYRcj0T3366EdvKB/6jfXodKqVrpNUzlfl/RDNRi3Ij
         47uM3RzxUSjQ+EZVP/N+U4bD+Qqpz8kZs+5iuWSXBkTrhHztlWlvaLLaHOlS0De8N5y/
         9F5g==
X-Forwarded-Encrypted: i=1; AHgh+RrqOF1oT5z/xNBsGf1ICXPKSov+c/WkDWKepv8R3DtLtp+5RJb8jGZHUha6gbx4UVi1FkVdsxRenjY3Ug==@vger.kernel.org
X-Gm-Message-State: AFuF++naQGDa0EVZ7mcCPCwgNeoqWzteNR6NtWiH1lQ66S+Qm49qYWyY
	7FBt1Xb/l0GQpAArXJbButvy8jL8eQTtwI1tPHWqo4NGf6ZSRxsI1Dka
X-Gm-Gg: AR+sD10bebI+0JJy+aPWTMgcQq75uqfj5O1ixewnY2irhoatkn7kbz25q8KWap38R0w
	wBwHJHq747BpN0ZjPrfYLJLvAgawpJhuz8cWljZ5FCdjj6IZKTojmyO5bg0OE61EXb5cQ7O2aM4
	cisUYepYVEEp7t9JcbnD4iKKsLPjHVy70XC07mDYRf1x/coP8iFYrmR1zdEFygmmUMpmCgq4IjW
	fpnm5avGSN1IjLmErNUucCHlWv3Tvnls8KeMm1Nwnv7ePBmqV8gZx4H1A+0lKHROhFnusAjpqCW
	oyjQ1NjOKODMB+bP6nrLvpCSi3/NolJa+YpSQs7wQzc5hte4sdrCAomVfdHncBs2D9MggXCLgLr
	SzjghBlj2Uu6B+sm6nblvnXIeOfE7Ax0iuMceW2zf6MkjhO+ksv3yAO8G+EAiKkR6SuLmfq9vjR
	kgLG0b7x2A4Roq8FO9ky/W1zECrJliNYSgXpQdU7O3nb7/aQ+SuEuM9Skddy9kvwAJAZ+6zQSsI
	f1Z4A==
X-Received: by 2002:a05:6808:150e:b0:4b2:8ee8:8a38 with SMTP id 5614622812f47-4b397c60b17mr3111465b6e.0.1787872907205;
        Thu, 27 Aug 2026 16:21:47 -0700 (PDT)
Received: from localhost.localdomain ([2600:1702:4ff0:baa0:5054:ff:fe3d:4ddb])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b38fbfe089sm1589553b6e.14.2026.08.27.16.21.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 16:21:45 -0700 (PDT)
From: Will Porter <mrwillporter@gmail.com>
To: Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	"Geoffrey D. Bennett" <g@b4.vu>,
	Asahi Lina <lina@asahilina.net>,
	Chris J Arges <chris.j.arges@canonical.com>,
	Nick Kossifidis <mickflemm@gmail.com>,
	Detlef Urban <onkel@paraair.de>,
	Roy Vegard Ovesen <roy.vegard.ovesen@gmail.com>,
	fenugrec <fenugrec@mail.com>,
	Frederic Popp <frederic.l.popp@t-online.de>,
	=?UTF-8?q?C=C3=A1ssio=20Gabriel?= <cassiogabrielcontato@gmail.com>,
	Shipei Qu <qu@darknavy.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Will Porter <mrwillporter@gmail.com>
Subject: [PATCH 0/6] ALSA: usb-audio: guard device-specific control transfers
Date: Thu, 27 Aug 2026 18:21:37 -0500
Message-ID: <20260827232143.149197-1-mrwillporter@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260824230302.27965-1-mrwillporter@gmail.com>
References: <20260824230302.27965-1-mrwillporter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Takashi confirmed that hardware access through usb_ctl_msg() should hold
snd_usb_lock, and suggested guarding scarlett2_usb() as the central point
for Scarlett2. This series adds that protection to the six device-specific
paths identified by the RFC audit.

Each guard covers a complete synchronous USB transaction. The guards are
outside private data and USB mutexes when a resume callback could affect
lock ordering.

FCP holds one reference across its complete initialization sequence so
runtime suspend cannot intervene between step zero, notification-URB setup,
and the two initialization commands.

Scarlett2 uses a dedicated unguarded helper only for the suspend-time config
save. That call already runs inside the USB suspend callback. The guarded
path covers normal controls and hwdep operations. The series does not claim
to hold a PM reference across Scarlett2's asynchronous flash-erase interval.

The affected devices were unavailable for runtime testing. I reproduced the
failure mechanism with an Audient iD14 MkI mixer path before the RFC. I then
built the complete sound/usb/ directory with the configuration from the
running x86-64 distribution kernel (7.2.0-ogc4.1.fc44.x86_64):

  make olddefconfig
  make -j4 W=1 sound/usb/

All six changed objects compiled without warnings, and the build linked
sound/usb/snd-usb-audio.o. The series also passes scripts/checkpatch.pl
--strict with no errors, warnings, or checks.

Link: https://lore.kernel.org/r/20260824230302.27965-1-mrwillporter@gmail.com

Will Porter (6):
  ALSA: usb-audio: Add PM guard to Studio 1810c controls
  ALSA: usb-audio: Add PM guards to US-16x08 transfers
  ALSA: usb-audio: Add PM guard to Scarlett meter reads
  ALSA: usb-audio: Guard Scarlett2 protocol transfers
  ALSA: usb-audio: Add PM guards to RME Digiface controls
  ALSA: usb-audio: Guard FCP protocol transfers

 sound/usb/fcp.c             |  8 ++++++++
 sound/usb/mixer_quirks.c    |  8 ++++++++
 sound/usb/mixer_s1810c.c    |  8 ++++++++
 sound/usb/mixer_scarlett.c  |  4 ++++
 sound/usb/mixer_scarlett2.c | 36 ++++++++++++++++++++++++++++++------
 sound/usb/mixer_us16x08.c   |  7 +++++++
 6 files changed, 65 insertions(+), 6 deletions(-)


base-commit: 58c1c30074a8d1179e17a0188cd695b2f416bf75
-- 
2.47.3
