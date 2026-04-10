Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09EAD286A7
	for <linux-sound@vger.kernel.org>; Fri, 10 Apr 2026 03:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775793282; cv=none; b=U06ynxuXP7+VUtn7iqmv67tjnBxobqzHafTjOTz88XFKIyb6qvIt4/oODya40BdkDUNh1cvQpPOMq5Uw3biQojzBBXLQQ9YDHzYYZQgbUb2UbelRE7oDpkJBvQ0NAv8k2dexwWkrUNczZuQQjqGwfUJiyOHijrWK+eYwQykeUZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775793282; c=relaxed/simple;
	bh=uLZjCVL90egFhMKIG9W8w6tP76Wt6+sx02EZMg6m+68=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XB/H+dkM1D/f3ISrS5IiDge2sCStBwPgHeYtxmhpEt1Oq5INjvCqgsAB+dXtg+KQLKunbx/HLS6eRT/eqSRfMn8oieZ+oK99KI4hNnc42W2+lyCvAqmKKsJTM4QVrljMjXyJAplJ+lHrOrNu28HBlv4TxhXNSGvxdpsRerdYix8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mzNUVEyh; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mzNUVEyh"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2bd9a485bd6so3347611eec.1
        for <linux-sound@vger.kernel.org>; Thu, 09 Apr 2026 20:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775793280; x=1776398080; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CzhlPyoVy4IxHhj2huf9peZC2TywBEqKX56lgPLsURk=;
        b=mzNUVEyh1IMdHQktyes+wwdSCY8rIYJjNo0lny6HZdHf3uXgQACmVPk1jiaVPdZecy
         H336M4OxvC8vvv6oq2Ik0iFLVZ75yIygQqHvPpt15FF7dECTdOCoO2a54uxXRVdsKtpY
         joc2N9oGhjVzEmkpHsvjDU/1dKifXzIiBFG09ohZLBZJ88RHJmZyQQ4yQnZpUqEQzz8A
         UrNoA/4CLKHHWD30ZBYW1P+hM0SLgsSxcdqGiTfK75GhNxTgX3LXML1dPoWXvMsd9oHl
         oTa3rmNYMoSiSRxfUVwhPNDbRYqSgRX3+lmgJbH7l+gYqDCu7mfhPhs1Q8TlKNFM3cwU
         QZFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775793280; x=1776398080;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CzhlPyoVy4IxHhj2huf9peZC2TywBEqKX56lgPLsURk=;
        b=gmUp3TF85n0lV7TvQfM3PeQWnly3YppCfNhA9Ewzk+5ic3x55oAf+9CA6radSVOZXA
         JzKv+DDO9G+qXQij9gxaRUto9C03BDHQcyzfgtWsldKI5UfJR4uZAPSr90MjTL8IoiSM
         K7vcb3/PNJLvNLJ6g1tRPPBVyFS3gRi8Ixd/brDY2jREa4IzhebcLb/vJgQu04VY1HHd
         pqzkh2kNmG2MIYcWMG4dRWKBrZDEm5MBdMlZLV0o5LtVjQNz3ISDAW9gHepxOMr1/FVt
         nmMS/011VlYoaiMTjp6Ve1Lqrz3fIVxyqvZqAbRoxRu6fQv1jG4Xtips19kf/0RuK5dM
         oEBQ==
X-Gm-Message-State: AOJu0YwaPcPmTq5QudZkYP9oiF15zzeO23pGlf2XB4pcyv1wJB12N57G
	duiHeAdd0TagnGHEKPgGi+TEo+oSSbtE7x8HikhLXqfcxXUo+v8wK9QIjxKR0aqF
X-Gm-Gg: AeBDieuxbNEmxaSuIe5gTfJ+s+hxtiI3FKh58NRu/lj/uD3ghtV16kEhEDpuQ6R7dyi
	3BZSBJdhdwd4NgSvqN+XeA+yLfaW9TU+v5BOIHSiVwfhSD+phBN5Lv9Onz9hycXeSlJzKMmqYLF
	coKlFUwjSf3rR1S9GGOWaWZG4q0GrXvpECtJDnoeM4ztV6KyI4F/QYGJW9AZdh9o1zwuM+TR0rp
	Q8avAabjSBw4CPmjIvmwK6SH3WQh0E60Y1xQJNRCkn881ELT3iKNLhUjvO/6bO07U3vWhx0GkUt
	gDrCYMX3LlA4KkT7wG00/wcTrQ1pvcblxNfbph4eBCBHepPZyvH3TR5/cnRBm/NCs+TZygOGJGN
	8A59OT2axbAOMG24/O5GCrKqUrclhiMHSp+HHua5nBv6Ei+JKoGdWL1Zetcthp/qIYo1aQdXNcx
	8038aGho4VZ76N4XnMriWwBrqeKGR82ZRJtAwv7RF1lu7qYADDpVoQMQ5wOQ+tXi/Zf7ig8Gq6g
	qqa
X-Received: by 2002:a05:7300:3723:b0:2d4:afb3:7b00 with SMTP id 5a478bee46e88-2d58a2a1bfbmr1070447eec.28.1775793279924;
        Thu, 09 Apr 2026 20:54:39 -0700 (PDT)
Received: from [192.168.1.18] (177-4-160-195.user3p.v-tal.net.br. [177.4.160.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d5632a2a06sm2495371eec.30.2026.04.09.20.54.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 20:54:39 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Subject: [PATCH 0/2] ALSA: sc6000: fix board configuration state and resume
 handling
Date: Fri, 10 Apr 2026 00:54:31 -0300
Message-Id: <20260410-alsa-sc6000-pm-v1-0-4d9e95493d26@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDQAxA0atI1gaiDEq9SukijhkbUSsTLQXx7
 k51+Rb/72ASVQyabIcoXzX9zAlFnoF/89wLapcMJZUVOaqRR2M0XxERLhO60BX0YA7kAqRoiRL
 0dw2fr9u2tYP49X+B4zgBp15BRnIAAAA=
X-Change-ID: 20260407-alsa-sc6000-pm-4fd109aaf04f
To: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>, 
 Krzysztof Helt <krzysztof.h1@poczta.fm>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1773;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=uLZjCVL90egFhMKIG9W8w6tP76Wt6+sx02EZMg6m+68=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDJk3Smq+OelbVohtko/mfr2YNSlF4Gz46ROvE2dEfkjJn
 maYpunSUcrCIMbFICumyLI6aZHlnq4HV+vjVnjAzGFlAhnCwMUpABO55s/wP6Nq0rvoKzUr3pud
 /WfwLP/IjwumZ5Nz5q/jrvm22O5yQSvDP10RY8O/CfPD/+mcO7u951Pd7ukBlmXpmncXH+KY+z9
 9HyMA
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

The SC-6000 driver has to program board-level DSP routing before the
WSS codec can operate correctly. Today that setup has two related
problems.

First, the probe path may auto-select IRQ and DMA resources, but the
SC-6000 soft configuration is still derived from the raw module
parameter arrays. When irq=auto or dma=auto is used, the WSS codec can
be created with the selected live resources while the board itself is
programmed with unresolved values.

Second, the driver still lacks suspend/resume support. The WSS layer can
save and restore codec registers, but the SC-6000-specific DSP routing
and MSS initialization are done only during probe and are not replayed
after resume.

This series fixes the probe-time resource mismatch first and then reuses
that cached board state to restore the hardware on resume. Keeping the
board programming in a shared helper also keeps the old/new DSP split in
one place so probe and resume cannot drift apart.

- Patch 1 stores the computed SC-6000 board state in card-private data and
builds it from the live resources selected at probe time.
- Patch 2 wires ISA suspend/resume callbacks and restores the cached
board setup before the WSS codec resume path runs.

Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
Cássio Gabriel (2):
      ALSA: sc6000: Keep the programmed board state in card-private data
      ALSA: sc6000: Restore board setup across suspend

 sound/isa/sc6000.c | 193 ++++++++++++++++++++++++++++++++++++-----------------
 1 file changed, 132 insertions(+), 61 deletions(-)
---
base-commit: 4c468a99786e2cf41bf7b2c95064472e99a6776f
change-id: 20260407-alsa-sc6000-pm-4fd109aaf04f

Best regards,
--  
Cássio Gabriel <cassiogabrielcontato@gmail.com>

