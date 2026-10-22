Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792680784;
	b=yeO3i1fHgdD64ehtmkvNjnid1tpBI464GJ/Q1oktASBJL6POR4DiTm417VDWBxnNNx+J
	 ecuv35+0Bfw/mYKIBkv1d9uz9ByvtPDF8IgGNcEz3JtsfvF8ciF0Bjby72+YB9KDU4ag9
	 +zfBdwEMKx3FY6huVTch5FwQx8EvJgisdqoWs/GKPAlO+k/lCsRacFRARHwtBng3RlKv5
	 LUcyM6aN0QKp71PeBwiBoOd3w2CzqdNsL86thKjSEWuydF200llPr3f2MH6oYySH6rObL
	 xfEGipGtkfD5wtX1PpaMt0LMjVE/EUZ4WFB+NLLzUs9D5FPmgBVp6vzOASBvwm1R0Vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792680784;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=erW9orlZqBORYTjT+M88JXzd4Dxh2Crq+t6//rkNNRM=;
	b=REOVVIcpIHII+B5Ltmn7xiYRUxx3CV89bTLeag19zzjYHC+0s8+0sm96+I/Be+LJ6y9o
	 884txc3bh531qzMO9R9I/wIo+y+rZU9eHHvFFm6Vqeuva/rFB3hNPKIrLvpWnbrTybY5K
	 nYJCHUAb6mr7aUTIm+E7ViCC14AEZ7CD8FJmPBCIMhYjN/8kjM+Wqp6qFseGjpsgXM5aE
	 xexrERufOosrx0Y0clmQuMsekgQibxJThfdLycIrZH7gA3bM7fSZKEeit8yOg6vIZZxaQ
	 cvh8yKPvudXHzfe7rquyMGd9XAAsUQGVpjyivzPpPb2mDTSOKd6fiv9aKiIsKWmDKMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fa0SUHcn;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BB05606A319
	for <linux-sound@vger.kernel.org>; Thu, 22 Oct 2026 14:53:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BB05606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fa0SUHcn
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3adac5b29ebso451980a91.2
        for <linux-sound@vger.kernel.org>; Thu, 22 Oct 2026 07:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792680783; x=1793285583; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=erW9orlZqBORYTjT+M88JXzd4Dxh2Crq+t6//rkNNRM=;
        b=fa0SUHcnoB2u5mbE2SSv8H/0b1nFQsuzZyLD3+TeW7sIATt8Dh0A7bYHTB1Ip9U8PK
         HVarkGjVZpn/dFyTItarF/7d9ISBETsgXfuvVkT+O/kPiQtOkDqzVfgwaG1wJ75RCHko
         Xdidld6eriO69rqTYxYrq5kDrNLtZvbRjz8mOZRLuz+8lDsv9Rb1YTJdOrVPppDxyiNA
         uMMWL+KpXbj02/VCiuXIPxpuvFLSG7xW00mMibsnnJmKWH+hlayEp4wADXKW16bnL+i5
         1lff51pKD4zBEW8+RGFJAcEe2VHsFL6mrA0ys7STq52qHImc9oaX96awcf61rcvFXbF4
         7BNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792680783; x=1793285583;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=erW9orlZqBORYTjT+M88JXzd4Dxh2Crq+t6//rkNNRM=;
        b=xNAuoC0AEUjVpRh39qr4GShOUkfxzTBhnVXCOXhu46oL2Z7Rod60JUfokDKs4QhltC
         kugu5BX49TuvM3Zqk1crFJqcw4Gwu2/1RH6UQekyEF/oHcvahZFYJIJR97uW+QEYkJww
         GxmBNHzAOzULPTpIF4UpG9zi4020GtRRPs7pQAkaQH5k0xoQvPcooQrLm4cmRqneTnfd
         GclaHFMFmijmY07IydLA6Shns/M24EtTtGbL28CgDhInec48vwCmnLWssZAltu7jH6NR
         ZGrcsq7TaX0qkxNW2Y41gvMewcFF1oSHEJ/VJJPhKV3i9fBozqmmMmQz+hjqEVCstgEQ
         E4PA==
X-Gm-Message-State: AFq9FYKZNsGEl0Vy4Gjzww1q8pwXeEpkMOGMf8y2c/38TEjJ2plvS73O
	K2obqT2n30YPnHipDnhWjePxNEflJpekU3mjHnUB3UPAW84j+UIAQhNj
X-Gm-Gg: AYBFou3sJOqLia7UGHE4vL+2LoE2vd3TIgT8lxyb2xf+4EYTU3j+/WUP1K25QbGqhxr
	m73ZkXblkacF2dOmZOK8gu1+x/XIwQK3JhvAmwJ9ElwYhqk2KAhAxjXM73TdgPguUur3p0RWqTL
	ZKNka81uqjKw6lOFO9h4wL2s8mOvUgz8Wk9GpwLMwvypNPeN3PWAZDwaUf5NndPZzp7YfP8Wc9r
	lWeWXSH/pcxi49AeqqfMzazX5DZBkVbLjpkfXThLcRiv+cK0xC9hvpxk55WGJmM1Qi7dh04hbpo
	KLpEXK4P7FGA+k6nWpKzpNMoaWVU9SyH+dd6EAz97GNtoxvlyBZLoFgtBIjTAULPyz9m8Qh1uVC
	0XNM4+3xmy+K0vQrPLDcM0J6tew+9JbNsRmYBuNProKft7pE0LrmGynNft/cA7bfpEQeMnlEO9e
	VF7QLQm2Vi95dYRsFhJ4OVprb4iohtpY2IGHd+GNXg0a3/ILfoCLW/uGOH9sXyGA/tnNCydwOt/
	sAyMxkdVxytmwDO5mXSPRJdlbgGuGs+sqNL9xfuLqRQMaij9Bnf
X-Received: by 2002:a17:90b:55cc:b0:3a8:185:cf40 with SMTP id 98e67ed59e1d1-3ad86f1bd64mr4828172a91.10.1792680783448;
        Thu, 22 Oct 2026 07:53:03 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada4887669sm4767829a91.2.2026.10.22.07.52.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 07:53:03 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tiwai@suse.de,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH v2 0/3] ALSA: opl3: Fix sequencer timer and channel lifetimes
Date: Thu, 22 Oct 2026 22:52:52 +0800
Message-Id: <pm-pmb-4552c4e605507d8d9b16-v6-f3fa18aca2c7d18be670-0@gmail.com>
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

Initialize the timer before publishing ports, clear voice aliases before
each channel set is freed, and shut down the shared timer after client
deletion has drained both event producers.

The first two patches address existing initialization and rebind issues
identified by Sashiko. The third replaces the earlier native-port-only
timer shutdown with shutdown after all sequencer ports have been drained.

---
Cen Zhang (3):
  ALSA: opl3: Initialize the timer before publishing a sequencer port
  ALSA: opl3: Clear voice channels before freeing their sets
  ALSA: opl3: Shut down the timer after draining sequencer ports

 sound/drivers/opl3/opl3_oss.c   |  1 +
 sound/drivers/opl3/opl3_seq.c   | 25 ++++++++++++++++++++-----
 sound/drivers/opl3/opl3_voice.h |  1 +
 3 files changed, 22 insertions(+), 5 deletions(-)

Changes in v2:
- Split the initialization-order and stale-channel issues into separate
  patches preceding the timer lifetime fix.
- Clear voice channel pointers, state and delayed-note flags under
  voice_lock in both native and OSS port cleanup callbacks.
- Shut down the shared timer after client deletion has drained every port,
  replacing the native-port-only shutdown.

Link to v1: https://lore.kernel.org/r/pm-pmb-4552c4e605507d8d9b16-v4-213af356c0046331c8ff@gmail.com
