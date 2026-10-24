Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792823453;
	b=PpNs8LLWgE7xrugeNR2lIn6SxYBq2Z3hiwOBdovRxx9JCedCq92wFy0OeMJWzbulgbUk
	 jytIA85GxQa3LfKsQFnTfBz/9uwKM/1/AEMe1yo3/vls0Am6y8Cr62TiiWF4qBkxwtetM
	 lXNvuwx8oKEIY32PA8sMX/gyw2JsOPxpWQSrNvErdfd074udEodfQlIcw7scMFk8Sxib7
	 eMh7wklrL5eUx4WNyk68SgETjclPXmOne0Jp0Wmgse8I0cYHhGTw/GPHC913Nh15LqPvs
	 yICRjwfVrQ4CEFJJwsQJJAzyi3esqB/IHNvmE0tIjcWBYt6ExDkFjC5F74p8Mq1GU2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792823453;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=8XnB2OVJgiBpL6wU+5GDlzriSRdUj0PHVJ7bca8MKzE=;
	b=0HrWg8AV1xmpHYwBMDyOZj2Iz4RHEY6WYRhEPF6FDx97yOXkCoYDFx9BLr4J7JgjmNBf
	 dm4jCxjXHgrCxoCbq90TMbUBStZn7RVcf03NuXexT1GB14Cpevmbi01Phwv8XyYgKAxpu
	 8dUHYgL5T4P3IBsmv4I6j8I8w3/2sGegymUyjEMIGDQQcYoO2aDNUWcBdyrwNZaK3JcuD
	 I1kQrqdaz5oWl9mHOUfMm2/7pkOvRYSsee2sZCPowSGH65iQZ4/p6nMqdGGwu6x998fXa
	 VZH8HjmghsWhXmvGy0PoCGKKXepQnvPPnDTnJ03Wg7bIwwALrdj1Swt+fXrk6SKkhgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rytgpuSP;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C435F606A31E
	for <linux-sound@vger.kernel.org>; Sat, 24 Oct 2026 06:30:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C435F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rytgpuSP
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3adac5c10e3so871782a91.0
        for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 23:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792823452; x=1793428252; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8XnB2OVJgiBpL6wU+5GDlzriSRdUj0PHVJ7bca8MKzE=;
        b=rytgpuSPZUdP2+yGhpFrDujRy1hZigr5iK0kUty7cwQ5Uu08nlSFjj19B5EweoBvVF
         2UuZwzSBEoaKyBoCQ0BKQ7tDHgpHYSugOWIIg9H+vjdmuLlzhgjCTVvBTyoJGxsoPV7Q
         nrQ673rm1rvR8Za9DZbCjmM1377C1s7x1P4dnb4jXzBw/eRx3c6UKYw+HDbdjLKss1Rt
         nXxqkhEn5VireNBeDMgeJNchCPEUGwX8IVuMHh4tRu1TUVYGCS2v+oUalhJMG8DeVjh7
         oSPdlddVXzQZNZLN9fFk0wWaUOvtwUpXN9+xctdLkbtkVKQnp0s3h1okx4RGzWlHIYsT
         0jOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792823452; x=1793428252;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8XnB2OVJgiBpL6wU+5GDlzriSRdUj0PHVJ7bca8MKzE=;
        b=lvhtGYahysnY446iTRamQ/JMJJDbePsvxSgeZnFm9ZuWSDM73Ll4dQZnUNq4kAshsM
         mDGVsFlXSAQQWsk4VwqrgWS4FWRjGDC2C3N1KXO8UrY2F35XzCYVG4cy3JRQ2yWWGcUd
         B3IcGugU+8yk1D2af1tYTEFDxv4HNZRAHhhP+yS4xe4BPifltTBQC6jmPwDeYwNy/qv4
         UH6b8Uo3q3NoRrmTyZ1+/aKhH0HJzh5jDZm88l4xKGrToEAakvqxlVEot66+cGThHW1/
         r6dTHVlagSRCGUclAQzrbgI0wm2eT0HHpBnTH1o+oPucbr1KBq3HfBlz+wGk07cRKGNh
         LuSQ==
X-Gm-Message-State: AFq9FYJUQei6cm25xwNBTwjomZJV9FIc/HeavhoDLqadwTKtJbBrfD0w
	8aK2fl+09RfTUXLjZslf5Soh44JmBPRaT8Ye7eNvvk3NL8ExzYoKjwz5
X-Gm-Gg: AYBFou33vxxvnQuBHj7TYEv+zGKUt4TvVUaZRP1atxo0nXoVA7OhURFkDsIFU7SEGUF
	UDpa8g/e/XR2MnDvwAeC5y9hnjOoiYcOoXQrd7pix80aaUkgalKdxP1bKSip7eXzmfP5h+nkqOG
	40Nd/ETioZ/N35old75UedNVbubotyj3NwitWglHwM6EHzLH4DrUuIJ470RD1grSeHRyMQAxEdE
	hJO/Q/mze29BWm7KI+SsLG00Ghl6NmlEASwm51uFXTqQRY3zA30uRalS5EeeNI9b6vv5x/L+iU5
	bNq/g+Nf6s6k2w20RbemU7axMNuD3r6c5FpzrIjtvm8OqRO+e8k5so260CKQmLBC6OE4jMwll56
	61aCm4nhqEJ9O4ssG6OluRcKapENinVZ43FwcQU48N2iiBxY/PCU759L6qzdIRKMQy6G1w1Ud8T
	fzGn2J9RUp155eg6Ng3pjNfdsiYIRKOv420qbgs/0b2DEf2Ldve1XcIA5G5N73ctAdB5EKu+COr
	rhOOZJlAGPqsb4fslpyRRhIstu3WR9L+b4dif6bj+ToEkyOa8U=
X-Received: by 2002:a17:90b:1652:b0:3ad:68f7:dbcd with SMTP id 98e67ed59e1d1-3adeae80c3fmr1131132a91.55.1792823452016;
        Fri, 23 Oct 2026 23:30:52 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebad6306sm1248371a91.2.2026.10.23.23.30.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 23:30:51 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tiwai@suse.de,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH v3 0/3] ALSA: opl3: Fix sequencer timer and channel lifetimes
Date: Sat, 24 Oct 2026 14:30:42 +0800
Message-Id: <pm-pmb-4552c4e605507d8d9b16-v8-8b61497d9bd754defcda-0@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

OPL3 can receive a fixed-duration note before its timer is initialized,
and the card-owned voice array can retain channel pointers after either
sequencer port has freed its channel set. The delayed-note timer can also
remain queued after the sequencer client has been deleted.

Initialize the timer before publishing ports, key off active voices and
clear their aliases before freeing each channel set, and shut down the
shared timer after client deletion has drained both event producers.

The first two patches address existing initialization and rebind issues
identified by Sashiko. The third closes the shared timer lifetime after
all sequencer ports have been drained.

---
Cen Zhang (3):
  ALSA: opl3: Initialize the timer before publishing a sequencer port
  ALSA: opl3: Clear voice channels before freeing their sets
  ALSA: opl3: Shut down the timer after draining sequencer ports

 sound/drivers/opl3/opl3_midi.c  | 14 ++++++++++++++
 sound/drivers/opl3/opl3_oss.c   |  1 +
 sound/drivers/opl3/opl3_seq.c   | 13 ++++++++-----
 sound/drivers/opl3/opl3_voice.h |  1 +
 4 files changed, 24 insertions(+), 5 deletions(-)

Changes in v3:
- Key off active hardware voices before retiring channel pointers and
  delayed-note state in patch 2, addressing the Sashiko review.
- Move the voice cleanup helper beside snd_opl3_kill_voice() and reuse its
  existing two- and four-operator note handling under voice_lock.
- Keep the code in patches 1 and 3 unchanged.

Link to v1: https://lore.kernel.org/r/pm-pmb-4552c4e605507d8d9b16-v4-213af356c0046331c8ff@gmail.com
Link to v2: https://lore.kernel.org/r/pm-pmb-4552c4e605507d8d9b16-v6-f3fa18aca2c7d18be670-0@gmail.com
