Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702D929DB88
	for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 21:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774647208; cv=none; b=SooD4Wnysg/QwLvw/f2DiUvQJfWbf1QdzevfKMVFp+LiBj/OGhSL8UibnuaNcd5j3qpXp+v5HXpWH5oduryOJktLaa19mQbTafcRrBEg9Z5HlGj0azqim0DeQAnH5CJQujNRfgVYa09CSseYrV739YMrqz9tSv9dVo7wKmThpmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774647208; c=relaxed/simple;
	bh=arVYC6dVPpEhap0+eoUD24vL3wCtAwOKfn8O2nk0kbw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SUk2iUzYN8NhrlnVo5jjRZTRrv1fwLf79ofbd8bZS7WYS3T6qCcMD+aElt2B5B1mRtxdjcx7k1FE2KOsM67KgztjjrIANo7rIAy7U04eYtgRlbTk71VloRLRAyA6ZAwu3kdgI9NQB3Kh5ijAcDKthp46pI+PvPGwmgrMaTpcTpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qMje8q7v; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qMje8q7v"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-439cd6b09f8so1725618f8f.3
        for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 14:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774647205; x=1775252005; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IqKwH+YSoezT2ho+s3YhXUcPh8ZajeRHMGKYmAZuD0E=;
        b=qMje8q7v+5f+T/66AlbOY/4Fd3PARcreecGgeKrjB0CfwpbF74uGX2SnXnST99NpES
         3V/+Z6oYVNA9GNDdjhp4Nl/pCpAU1d/JcAnKTlWQWeNjy7qN5SivEI+C7dgRFqhdJDbF
         aSRZhEfpDRNcMFOjxyLe1M41UCcUlauSQ6SB+K3rm6LugJ0X/QSFua/MOeaHNyIJiYk1
         i35X40SodFxlu/1XQf0iiU82O7DrLXFu/r07RuaPMNkYvMWPqxaIcYALs7yjpP7PFert
         yRS/Q2AXeBTnQd2BHi7aREQfyeEbDGeQ9LbSS2dRR3aYoj9EO+JRm/E0A53Zj4Nh1JrI
         c7WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774647205; x=1775252005;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IqKwH+YSoezT2ho+s3YhXUcPh8ZajeRHMGKYmAZuD0E=;
        b=DhViwF0SS4rZdcQOF/SxKINiJNrpTHGZLOTl8QnB3aglAVEXJIgH4XEVQS1l3mq5Oa
         Wlk9DHty/8KvrN9oCYf7pu2fgU/gHvQ1i9Rf8MRzvAklUv+CbVhP5rGTl6+AIBQpEGix
         M5qmhrimZqpc5BggJXAJkrZ0SxQ3UFr3ArfwmkSnSLmRIfOZWHaq/aMMBPbWiLBJLpQ+
         XrGwVnShcWhd0yiE0/Bk6v7KAQeXU2pZS+tbVjSXV4TKgnzyVLvaP0+hWaoJzZn4WZNw
         CCobrMgaGZuJJ099rvv1zC1MzHrSa4BVpiwt6DvtCQmF3XwkAXRCVidrHqxYjPzj6EiS
         ocUg==
X-Gm-Message-State: AOJu0YwA00ZlCvZ/URVgVeTMCiDclkvpFXRh2cPRftWszDYHrdJZUUkM
	W0e1UWKAdbN/0W8sfbo7i3fi/Xxp0+ZLNmI8KGTVtElIZ6prMrLr3WJ8IzyHJRwMk5U=
X-Gm-Gg: ATEYQzw1PANErjcuTrGLre/9dhhpylRDKUvLSfY7I1nCoyx27X+VR5KUE+bVARY2RL1
	HstWauTjgm9NB2VcbduexURJMkSbHYcfdgmDsVV3WU5ijYBzP3EsCRsOZIzL0xztWAl+sfY5c2/
	skECTHLE9VOF52iKRBHdLIlzmjd3uNxA1N94uuOYDIZxPT+tYB/Q3EWikaAdrhkO5jx8fbNcxrM
	b9lkarEDPT6Fo3oKxnhycUj0i/wLjlhajiFt1jx7CvOGow6WfyWtWcrtMIyuJwaPJjGZS3IH4dR
	+8vNPC0mBrMKlKOYaB7v/0rC0tpJKQGyvdHW+O2jWW9r81TH/VeHL8b8cDUg8aZZ9R9gb0Bv0zZ
	Yn9dClnNNQO1AripZ8znG1UXe82GADekV5nOj794ISMgP1IFYEwghKzo2v6A98W6KNNatdEKA8x
	FjGp36ThQC5c+V8nEWSq/MzSBSXBqJig==
X-Received: by 2002:a5d:584b:0:b0:439:c040:cc8a with SMTP id ffacd0b85a97d-43b9ea4660bmr6472604f8f.32.1774647205400;
        Fri, 27 Mar 2026 14:33:25 -0700 (PDT)
Received: from linux-workstation.lan ([5.133.45.75])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf257b72dsm815579f8f.34.2026.03.27.14.33.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 14:33:25 -0700 (PDT)
From: Phil Willoughby <willerz@gmail.com>
To: linux-sound@vger.kernel.org
Cc: Phil Willoughby <willerz@gmail.com>,
	Yue Wang <yuleopen@gmail.com>
Subject: [PATCH 0/1] Mark NeuralDSP Quad Cortex as not supporting DSD playback
Date: Fri, 27 Mar 2026 21:21:00 +0000
Message-ID: <20260327213318.5338-1-willerz@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

USB Vendor ID 0x152a is owned by a company which produces firmware for other
company's devices. Some of those devices support DSD playback and some do not.

I'm not totally comfortable adding the first ever zero-quirks device entry to
the quirk flags table, but it does appear to have worked.

This patch preserves the current assumption that all of this vendor's devices
will support DSD unless explicitly disabled in this way. I will ask them if
that is a good assumption and if they can give me a list of existing USB pids
and whether they are DSD devices.

Cc: Yue Wang <yuleopen@gmail.com>

Phil Willoughby (1):
  NeuralDSP Quad Cortex isn't a DSD Device

 sound/usb/quirks.c | 2 ++
 1 file changed, 2 insertions(+)

-- 
2.53.0

