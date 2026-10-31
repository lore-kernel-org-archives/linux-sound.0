Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793423679;
	b=EkDzK29rjYMsG+DqaqklAKrxPgFnx8+lCJUX4LtUPYLVsAikLfLwO6APpyWvq4aSNkJL
	 d/+/NO+W6T5wZz9Zk9KVj9Pc2fNlqPv3pcij4jF+T9ycP0Q7VhL1R4/36Waitdsd6dlrU
	 7scA9OEdn1KbBdsp03sRIwPFl6TAuz6M+EhnL35E2BE9zl0Q+Bk121LWHTcSgHJ3rzV5p
	 MGjQztCKcvCUGQqxIJ387cLaliRBFA6xkOxsh3N52Nj61zQwxeTaRvkSz07oDktRBjLnG
	 XL77C4HdkpyqtIyBNjJtMa8Ru7PAP+qNaExaO5gLfW/dViI5Qw7wE5bZvGlODXwm8Bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793423679;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=JV84msgXUJaDxvG1g2Xeu1J3+jfzXhZ4gyQkFLKAo20=;
	b=qeKe7uqiY/ADcCqSMnuX0xS5GWuS6x3wynqg98a5gQglq9LDT6SZHw7wfQlRzp+ljxs/
	 /lSetvNJioC6vYglrsu9Mef4QzFFaDExRzt/UbogT1vT4PhY/Eiri6QXxH6bnKWs8PGHo
	 +3pt8meueJRKxXRcgkLtZXVrd5sXXprwp2v1VVXaLxK2iUy2T7XIh6BLMzPCMlzLXTlpw
	 atgM3E8q0qDO2vAR5db83w0sltPnMWX2ElaHd4gdBiaMDAPtqX1YHq21tAlyfOR6IU0UH
	 gKWMUnH33Ko/oizfwBIuL4n+GSffCPA5SrDnXNeIkiNV+RgyOFuyfHfadPWDOreHtgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ILf6iwf8;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED96606A31E
	for <linux-sound@vger.kernel.org>; Sat, 31 Oct 2026 05:14:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CED96606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ILf6iwf8
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3ac7842c17dso935332a91.3
        for <linux-sound@vger.kernel.org>; Fri, 30 Oct 2026 22:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793423678; x=1794028478; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JV84msgXUJaDxvG1g2Xeu1J3+jfzXhZ4gyQkFLKAo20=;
        b=ILf6iwf8V/VJobhvhGdua6Qwd6lsSYAvzoTQnCNUwG2/1ESqujzI7L/t6oZx7WAe7M
         BtH6QUWd/bR35qMsw0KgMTvkoV7nMRhc9fB9R2LVDJtyjGx0lqjTTgLLbNvkKd6OiUQm
         aElcg+8ZaG2jgg6L6H4UU+g+8OORO8zgb1p/9IdSBvVlOwJRCpAsb6hqvgyPJdvZ8OXm
         QqNno2uRF1rNA7sS0H6DgeSpmrNzoASIFWyMl2D91UTC/1YDaIVPY2+dq4qqQHdt8PYW
         SfS6mHmboeSodbvO91acJ8lgGEoMEsDOJBhkDTI7kwRwsj4zR0Pgrq9t3J+0RlrIAnJR
         PFUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793423678; x=1794028478;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JV84msgXUJaDxvG1g2Xeu1J3+jfzXhZ4gyQkFLKAo20=;
        b=QA86ZSmLWL6WWN7ZLkp4Jr5DvJhpY/3JKY4NjKwxpFgRh/HPquOTS2ZudNHJ2yP8XH
         UnUq5RAdXJbvOFNjWnDkheUeHL0m/XV3KlMk80kp8tjsGmKr0f2QN6yijPjTqL22gdiu
         vWUHp3gJJS+6AA83V/FGUTYeFJI1isvOJEmmInLUvtaU4qJe87w84aD8Ch+7yFcw+2Nn
         oYjWmYgC/aZZMvsAywcyi8UmIh2mZmB0Bc3+eJ4KsROi38PBiWR7egUsBX9V3YajXweZ
         rxALhsEt+GBpYGPyfF7065l2O7c78zuBea7Bv5tWn7qZ/m01RZGQKTNWKdGcdzT+bRFx
         plQw==
X-Gm-Message-State: AFq9FYJD+IxNnoBH/86TFqulZ7afvWxddFNXDvDI5ndUoFuljGCGQ+Cx
	8l1C/ei47nk3t63qBLdYbC9s67EmSVUUyTAS/p2DWiBvGfFp3LYziyWo
X-Gm-Gg: AYBFou3Z+PXw0Wye/1JPwx0piiK3s9OJj1HhInu/FVFlQ1FFum/NA4tmvYykhGPTqhn
	A9ur2C8Z08INAQpTXBuJ7jELTb2qhdWfedm3kVdvdvMc2TNA+Fo+4qStLqqq7kV1HkXnzV+Kh22
	S6KOnj0kkjY+ak6SuuRZpCD+R9mSB9iPCqQk9JRV8yLwZ43RaUTF5+JMnS6kijcHm4TqdijVTdo
	j/5f3Gte9rhf62s3pzdmjJ/FefK/uQk24dby1iAp/H7BgcSHOGoxJXW31/dduH5SaJfm4lIKoiC
	me0rymc7kks1BQgIG2Lt5e2n+Hm/5vf+hKrIHbm7mKrsgW18Iw6QS1u2TG9L1ygkiBAumq7V/OI
	eXJuk1Tp4+h6IOWuXXyXRYRK1K+zdT/fSLWoZgw9HUrG+DKvOg07gEaN4XNqCAqIFgRgfcn2Uq3
	qrZhrjBaDYd8zWA8DZ02qitUZ+FEop6iBMogZosRcVtEKsbgbVj58I3OfZ7LMX/ET/tjYfzEDiX
	q/4O54dzdDqNRkzlsQxtMIbr3C0FwOH4uVkX1dLIJ4x5wFDO6Ds93275iz3tdYNRWnX3P7fW3rM
	E0kp2O1SpEqMbgO2R4/55bwe
X-Received: by 2002:a17:90b:4a83:b0:3ad:b86d:dbad with SMTP id 98e67ed59e1d1-3ae89747e27mr3500938a91.30.1793423678081;
        Fri, 30 Oct 2026 22:14:38 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845df666sm6216305a91.14.2026.10.30.22.14.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 22:14:37 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com,
	thierry.reding@kernel.org,
	jonathanh@nvidia.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	tiwai@suse.de,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH v4 0/5] ALSA: hda: Wait for PCM files on codec teardown
Date: Sat, 31 Oct 2026 13:14:25 +0800
Message-Id: <pm-pmb-a4703edca61d34aa679b-v12-b75145090f6bcd7cf145-0@gmail.com>
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

When an HD-audio codec is unbound while the card stays registered, the
codec remove frees its PCMs while files can still use them, and the
probe and remove of codecs on one bus can run at the same time.

Following Takashi's suggestion on v2, this version fixes both in the
HD-audio layer: patch 1 serializes the codec probe and remove and the
card registration on a bus, and patch 5 makes the codec teardown wait
until the files opened on its PCMs are closed.

Patches 2 and 3 add the file to the card while the PCM minor is looked
up, so that the wait does not miss an open between the lookup and
snd_card_file_add(), and record the device a file was opened for. The
teardown waits only for the files of its own PCMs, because the card
files also include the control device, which a sound server keeps open
for as long as it runs. Patch 4 makes an open fail once its PCM is
disconnected, so that a late open does not get a working stream and
hold off the teardown.

Cen Zhang (5):
  ALSA: hda: Serialize codec probe and remove on the same bus
  ALSA: core: Add the card file while looking up a minor
  ALSA: pcm: Add the file to the card while looking up the minor
  ALSA: pcm: Refuse to open a disconnected PCM
  ALSA: hda: Wait for the files of the codec PCMs before freeing them

 include/sound/core.h               |  7 ++++
 include/sound/hda_codec.h          |  1 +
 include/sound/hdaudio.h            |  1 +
 include/sound/pcm.h                |  1 +
 sound/core/init.c                  | 61 +++++++++++++++++++++++++++---
 sound/core/oss/pcm_oss.c           | 19 +++-------
 sound/core/pcm.c                   |  3 ++
 sound/core/pcm_native.c            | 37 ++++++++----------
 sound/core/sound.c                 | 34 +++++++++++++++++
 sound/core/sound_oss.c             | 21 ++++++++++
 sound/hda/common/bind.c            | 43 +++++++++++++++++++++
 sound/hda/common/sysfs.c           |  2 +-
 sound/hda/controllers/acpi.c       |  2 +-
 sound/hda/controllers/cix-ipbloq.c |  2 +-
 sound/hda/controllers/intel.c      |  2 +-
 sound/hda/controllers/tegra.c      |  2 +-
 sound/hda/core/bus.c               |  1 +
 17 files changed, 193 insertions(+), 46 deletions(-)


base-commit: a4311e9447bbb219044db38897f95be112f46a8a

---
Changes in v4:
- Address the unlocked snd_card_register() callers raised by Sashiko:
  https://sashiko.dev/#/patchset/98644
- Patch 1: add snd_hda_card_register() and use it in the controller probes
  and in the reconfig sysfs knob, so that the card registration is
  serialized with codec probe and remove as well.
- Patch 1: use mutex_lock() and mutex_unlock() in hda_codec_driver_probe()
  instead of mixing guard() with goto.

Link to v1: https://lore.kernel.org/r/pm-pmb-a4703edca61d34aa679b-v6-680f350d78e44f9de7a7@gmail.com
Link to v2: https://lore.kernel.org/r/pm-pmb-a4703edca61d34aa679b-v9-c4f3df026f28aea10fd1-0@gmail.com
Link to v3: https://lore.kernel.org/r/pm-pmb-a4703edca61d34aa679b-v11-d9186d19e8afb48972af-0@gmail.com
