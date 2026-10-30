Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793347432;
	b=QGBnPMjy3Y6nR73E0GW54C3fD/jPb75sj3jvoH9h8nUFfi7oI7rdeolfNh2++QWnMFf3
	 PWeCdO2AzUOIknuSXmuBOvwk44F/7SQ9woS7rDzXUY2EjOGxcf7HJ4AsKBoZHm1i5tUqV
	 1dTK54NY5+09aJILviS9SiGiM827+xCtqo/W+dIekl4jKRrJF2benPUn6Aww2ZLMCQMcB
	 shDfaKwaeVWYbbGQX+yBQxoJThWF/iiuJ8snbmpiznxJXTVGZNThYTEHK51SIYVeN097O
	 F3I/gR7kdqw0U8kbbMiSgUspTl+OuyjiBLNzFh6bkn40sSXl1sm7rfGY4MkIq2C0Cxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793347432;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=Q6QB/49NRyPAoCN2vd2BzB0Ebs4MdUiS/1UntiQymG4=;
	b=p5+Tnigf2Avm6f3mewK01OiT9RVJIWLKyAriS+qRXcGf5SLv0MtnNk/b6RZRb2GdJfJf
	 DolF580471BMxZQ/WNC5Syl0Rrq12QEXqfJJFTI/Tn6OCvTDj3VPsgSHRfU+6dXJ5LFko
	 St7Mldne9n6m+rgRnC81OpgUK4I4J/vYS1UHW5y0QYTQNrNCutgC0gNteNPXgxwqP7lZg
	 3Ov2HRdYXOHy5RfAsz/tIGsUmek6Z/voRwWkf98PY7qcdQ8grvR0ZkV9nzJqav8hE2Cmn
	 RHdiXAJSXDJNVS2pxeVIMBwmX0zEpMpW10FefDcSDI0IqnGS/IWR4NFHLrQ9h7xwQhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KXjqaw7G;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C83606A31D
	for <linux-sound@vger.kernel.org>; Fri, 30 Oct 2026 08:03:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2C83606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KXjqaw7G
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3ae702d28c4so190472a91.3
        for <linux-sound@vger.kernel.org>; Fri, 30 Oct 2026 01:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793347431; x=1793952231; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q6QB/49NRyPAoCN2vd2BzB0Ebs4MdUiS/1UntiQymG4=;
        b=KXjqaw7GiZQ1Zenb93UyM8Fd4N32AwQfBcLIv/nMxX3/AvLNLBysoLbH3Y8VMYIB3M
         TrB1hg2jpJ9pfHbvD5wpBNe6Itb+GGs1PmDAHlmOVXLjCh0KSGHmDVPG/3SJuurzF592
         ie2dNkHDFZzOILzA+bTAidoyJggp31NLNmZC0FuvWTMAhlHGmRCnlBKuUng2d5bGUk+d
         x/0g3OQB1TzGUDZ2nMb33YA/IZjjKh7yPTkk1AEsXoTfnydvk5itRVX996GFh/xUWLrl
         7I9rPinvf84UKRlvpkDyg6dSOUCPAWREixcbiYDnWXgaWr+jZgGbfVYsQ/uEARaMc4Mr
         Hsqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793347431; x=1793952231;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q6QB/49NRyPAoCN2vd2BzB0Ebs4MdUiS/1UntiQymG4=;
        b=0ibCitqs1sDp9Pd7qBpnvhkTg282EpJFdy/DLnO45gXBIm0vKsQYKS+KLLyCZlG0aR
         G/Nw1xFxCz8eYkNKhHHjUXJwMko44cdAuVaNA82nKb996cJPa3g6j5pfmeDdj5yZ6qVX
         ue0tOhJQ/FcR8iaDGkQgXDNzJTrsv0x4/R8rnALAEPQfgSlU1Z7BRN0odWYZIZG5+JMZ
         BCU2+HTcBupHurBz2MdzbthsolTzA+ai7YDmVc1jw8boVvLfhj2VW99qbgoqW2BmqlaZ
         yX0S/FDFDAgrn9YLPGjK6Uf1Y6dIyBCIJwGuMKVePDRcllz+y7xWsrwjhQQdrc0fffGB
         Flrw==
X-Gm-Message-State: AFq9FYJamwJYwMPxZ2NvWHVrBMXdUnmnBq/Oj7urQyUN5tRy/CBDf0CK
	9vjYTXF16Bm5D/2LSwm7hAvV17wwbLJgmMEvlJOwMlmA/K+VIotTHjsd
X-Gm-Gg: AYBFou1Gm7UXYo2RzejuNnvvR3cf4bVwX9H0ZNODhupt3XfVqeit11J4811BLwFbFiN
	9TPS1Mf+0jGIAtFIn/ASayqDupQs/VOTUdxIoEhGKj5ISbHZ/utuo2C+G3BJJ6Q+BNfg3XqOKeS
	oKVVFFV0GIwCloXNDhudH4y9ncaI2YKw1uL/WwmlJl+jx0bEiiYrxQSuDe5YpnfeKVAAfN/TJNw
	YtaStFg7WUKQMhEn9FSrG7whcaCPOSMPkylJFbd64gBPMaZxe6uurvo9wSCPvwFewt6T/qF5Asf
	Cdx+GdvjNiROhRpte7ouYPpQV6Soesn3psURAYWWTfsKO21HRz8+Ke7wCCOGM09cboBPRRD8Z2i
	DqDxOCb8d8w/7KISSlTPRcwiiASErY7ZiZtwYLZCp6xTnpWDZN03rG2tjPFJsEfMChuqU02+aSc
	kfwsWdyzWmGs5KkF4WEIwYY1CtJXS7UpvVzR8WaC4E0Piv/7jooRTdHmcYfzIeBQh7AdUHpKPTu
	RXxpTXO2FYoia5m60CYgbcehJE4tDdK2MpA9ObUeQhFjzVZ4wtBIMjw5BgkmIpzaZssnJO5DmFj
	w9ahL4dFr/BPVhH5EFjGVTd/
X-Received: by 2002:a17:90b:3881:b0:3ad:5c64:c7a0 with SMTP id 98e67ed59e1d1-3ae89814e7dmr1181473a91.38.1793347431081;
        Fri, 30 Oct 2026 01:03:51 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae84577911sm3073035a91.7.2026.10.30.01.03.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 01:03:50 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tiwai@suse.de,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH v3 0/5] ALSA: hda: Wait for PCM files on codec teardown
Date: Fri, 30 Oct 2026 16:03:38 +0800
Message-Id: <pm-pmb-a4703edca61d34aa679b-v11-d9186d19e8afb48972af-0@gmail.com>
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
HD-audio layer: patch 1 serializes the codec probe and remove on a bus,
and patch 5 makes the codec teardown wait until the files opened on its
PCMs are closed.

Patches 2 and 3 add the file to the card while the PCM minor is looked
up, so that the wait does not miss an open between the lookup and
snd_card_file_add(), and record the device a file was opened for. The
teardown waits only for the files of its own PCMs, because the card
files also include the control device, which a sound server keeps open
for as long as it runs. Patch 4 makes an open fail once its PCM is
disconnected, so that a late open does not get a working stream and
hold off the teardown.

---
Cen Zhang (5):
  ALSA: hda: Serialize codec probe and remove on the same bus
  ALSA: core: Add the card file while looking up a minor
  ALSA: pcm: Add the file to the card while looking up the minor
  ALSA: pcm: Refuse to open a disconnected PCM
  ALSA: hda: Wait for the files of the codec PCMs before freeing them

 include/sound/core.h     |  7 +++++
 include/sound/hdaudio.h  |  1 +
 include/sound/pcm.h      |  1 +
 sound/core/init.c        | 61 ++++++++++++++++++++++++++++++++++++----
 sound/core/oss/pcm_oss.c | 19 ++++---------
 sound/core/pcm.c         |  3 ++
 sound/core/pcm_native.c  | 37 ++++++++++--------------
 sound/core/sound.c       | 34 ++++++++++++++++++++++
 sound/core/sound_oss.c   | 21 ++++++++++++++
 sound/hda/common/bind.c  | 24 ++++++++++++++++
 sound/hda/core/bus.c     |  1 +
 11 files changed, 168 insertions(+), 41 deletions(-)


base-commit: a4311e9447bbb219044db38897f95be112f46a8a
-- 
2.43.0

Changes in v3:
- Fix the codec teardown in the HD-audio layer as suggested by Takashi,
  instead of retaining the PCM in the PCM core: serialize the codec probe
  and remove on a bus, and wait for the files opened on the codec PCMs
  before freeing them.
- Add the card file while looking up the PCM minor, so that the wait cannot
  miss an open, and wait only for the files of the codec PCMs instead of all
  files of the card.
- Refuse to open a disconnected PCM.
- Drop the Assisted-by tag, which has been removed from the documentation
  and checkpatch.

Link to v1: https://lore.kernel.org/r/pm-pmb-a4703edca61d34aa679b-v6-680f350d78e44f9de7a7@gmail.com
Link to v2: https://lore.kernel.org/r/pm-pmb-a4703edca61d34aa679b-v9-c4f3df026f28aea10fd1-0@gmail.com
