Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792842085;
	b=aQgpq0rUeV7NnthxiY3FOLLBI5ssDReWO+sZKXtlb2xG8CAL4BmTRurK87agSepk5Y1W
	 sFRy1A2x66et5I4bAZeRmYR2KS4PYRijaV7dApwhw70KVPutpmy2eo+yHHagaAkfT/22G
	 /0kZ76D+1dDqn9dRKx4HJsLYJbcr7pwHjAWkzt6i86ZXWedEN24D5JbDVltsvvGhbcnqr
	 uIpDBadaH6vnnvxF8GHrTTbeKxxW8VrftMSmx6PJSNQaCa2pLcBzqXEoEwjLOH0oFQs0i
	 eegWmJId9G7RA4bg4GZB0Sr0QMqvKKHXSqyq5mvgvHOfZZ4z8ZNgY2n+t/ldzyIFN/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792842085;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=nUL6W0Nan8tO+oDd4RvDtN/T8g9yBmsnWSek2hObBhw=;
	b=onEY4PCN9FEEcL59tloF+MYYmJgiza6W+iFhk1gmcnLDhXDCk/7bsIAgsiVvBAz+6Bkh
	 SDR5aVMKUKumnxjtdT8sT0F73v9kWT87zYyZF5uYoyLU8mVdv0vq4smzYV8a2hvTiSVbk
	 6RUPs8dA9itnQeQfdNxC6iIo4MkSRAt2+TPsPjyJOw0mZP9c3iQGjhh7tAv63q28+DXtb
	 0prceSgXRjCdBNRrAj4kfdGXA6fwVFTT4cDJBGqXXQhuk7uYrG/QageE4r3azpv54KxKW
	 hBiSOy7PcAsYvK4SJ94Kr85ljNBP2Hmjwtl+cMxKjF/zkKBZT4zQq23scRKYQCNl4iA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ul7mAQjR;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5434A606A31B
	for <linux-sound@vger.kernel.org>; Sat, 24 Oct 2026 11:41:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5434A606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ul7mAQjR
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e9995ce866so14318185ad.0
        for <linux-sound@vger.kernel.org>; Sat, 24 Oct 2026 04:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792842084; x=1793446884; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nUL6W0Nan8tO+oDd4RvDtN/T8g9yBmsnWSek2hObBhw=;
        b=Ul7mAQjR/aGU9E+NkyyFecLFKA7/Laz7UuE1FiMSJFvx4gkI00/WS0f6IgkKUr7orG
         4ISiqwF2rDLYwVvDl68T4u3Qdwi8dQTWXlhd2AONAKMS72qeSp45RsXvU7s8WvftUWEz
         UKsFaR7PGVyttoarVnZUBQidAFPiRThmSOz9ou+Mf0UsYDKj/BrRJwa6CJxMjDWlAr9H
         pToY1Po3jMAq5f5nqFGOHj4JLQALVfdBoX+rQr3mRJOfHH7GDTV3gHT4SE7UZUYYOZ+a
         H+xYUd+926+LRbT/jXqefi3+0EWrfedyl3zWibh7LUx+f2w24Sr0HLhkOqUIALk2Iq9m
         MwbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792842084; x=1793446884;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nUL6W0Nan8tO+oDd4RvDtN/T8g9yBmsnWSek2hObBhw=;
        b=gs4NMLN4itcS9bplvwmd5tf6xgRYWDMnYpaar1QkZ70Bp1f9XwM1wqWlNE9To6bKtK
         mihTskeG1WTNFHtDh5KkiF7ioHxpZGBfVyO4A5VFmcu/KN2iNrYkaxyhC9CnMtHe8KF+
         OV874f65212VnVHzOZiEsBJdKJEnVGKEbUnEjYvyimNeQcUgvJrzWgxUmdFdVmn01v50
         d/PrN5u2qOGYNnEQNP8vjBflOtMIErCTM9EOU1SqKDfe1KV5ghgGVDmBB8JqSrg+ZUqn
         ksEo5PY76dXb1Icg81JEnHlLTB09vVL1E2HNqMcdQLgWFKsTrKR6bi8fmW7/ZXtGyiiE
         578A==
X-Gm-Message-State: AFq9FYLJGQeAbCIQU2WOQxJBC4jcU8hMy/cWF3syrig8rCQVlBlmj7Di
	u2mXJi4tZXGrEsgRvQUsiIWDB+iNqo71RUKWDUBe53aIwFDlyRykCEOO
X-Gm-Gg: AYBFou1dkFFR2tyiLWMlSWR8BGvkZKmSP+3Q2uPdhqlBC/Wxesvpb95ZDVoFD4X6RML
	wEq6uyjYxKKKgYiRF7MSXPKQhALY8VoIH8azOrgoH03W6YpiYCK7/SKhTSbsgVQKPxXeN/wfFRV
	73uHZS9IbEGF8BTFsfSMizCQiUOAPDsHKGALqlybj5VKU/9vJYrEt7WnoXoPElMapuP6cZVApyD
	I2wxQO3EBDtcQgn+iB4b3/jMFGalecL4sSmmKnjzqVMVIbMg681u7iPW+kQqNa9+PcwDSPIDm8p
	FqdOzMuat629UTk6ummy4RlCIwfrxrQFhml0SElrXr8gmXv+RIJNVGMhb6oasEYnIOrAFY8R48K
	ck5wmgrpFbY0ksLNvY9LQABQIIaFPppGMrkXBtjVS3JrziC66ttu4c3IqZWQ9Gp2FdJm4FCpK/U
	cRRpCDnF+6cgTmOf3ofq9rIHiuRaiFeHRITYN70QF/FZWSRmuqMJEPfafeEzfBL97Slv2/Lu5xo
	U/xE7DPzC1zlSLxc+FJQKICw+J4oxYDD/SQzlvinsFLoM7a72w=
X-Received: by 2002:a17:903:3c50:b0:2e9:5b20:1c22 with SMTP id d9443c01a7336-2ea9c0fc9f4mr14713555ad.8.1792842083551;
        Sat, 24 Oct 2026 04:41:23 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea9b14c774sm4738515ad.38.2026.10.24.04.41.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 04:41:23 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tiwai@suse.de,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH v2 0/3] ALSA: pcm: Retain components across codec teardown
Date: Sat, 24 Oct 2026 19:41:13 +0800
Message-Id: <pm-pmb-a4703edca61d34aa679b-v9-c4f3df026f28aea10fd1-0@gmail.com>
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

A pending PCM opener can retain the card without retaining a PCM removed
by codec-only unbind. A late codec probe can also publish PCM devices
before a subsequent registration failure starts cleanup.

Retain native and OSS PCM lookups through file release, close admission
at component disconnect, and drain codec users before probe-error cleanup.
Keep the existing proc rundown outside open_mutex at disconnect, and wait
for PCM references in final cleanup after the lookup gate is closed.

---
Cen Zhang (3):
  ALSA: pcm: Retain components across native minor lookups
  ALSA: pcm: oss: Retain the PCM from minor lookup through release
  ALSA: hda: Drain PCM users before cleaning up a failed codec probe

 include/sound/pcm.h      | 11 ++++++
 sound/core/oss/pcm_oss.c | 20 +++++++----
 sound/core/pcm.c         | 74 ++++++++++++++++++++++++++++++++++++++--
 sound/core/pcm_native.c  | 44 ++++++++++++++++--------
 sound/hda/common/bind.c  |  3 ++
 5 files changed, 128 insertions(+), 24 deletions(-)

Changes in v2:
- Replace the setup-list-only fix with separate native PCM, OSS PCM and HDA
  probe-error lifetime fixes.
- Retain PCM references from minor lookup through file release and roll back
  partially registered minors.
- Rebase onto current for-next while preserving proc rundown outside
  open_mutex at device disconnect.
- Drain codec PCM users before probe-error cleanup removes driver state.
- Describe the native HDA codec sysfs-unbind and PCM cleanup sequence
  explicitly in the core patch.

Link to v1: https://lore.kernel.org/r/pm-pmb-a4703edca61d34aa679b-v6-680f350d78e44f9de7a7@gmail.com
