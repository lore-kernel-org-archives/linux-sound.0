Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1081E2882B4
	for <linux-sound@vger.kernel.org>; Tue, 28 Apr 2026 01:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777338012; cv=none; b=o54MxgktT+gb0Wrip+iOx48nmlF9YNXJ9MnDh6Lp9Agwglb4tCWgMlaRdwTzXwq7PDz7UoC8Z0eeRsQXtimBZBE45/r1jUIyh+67PFVWciB3O63K/wPEXHhV29pJvnUofIHVER0CK8obOuXRIq0dNi7ncwvYNxVPegz5cuUfPEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777338012; c=relaxed/simple;
	bh=NZCWf9yjEs/rjPoGS0uiCsWPv06fVvw4MUHTqXCC3po=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gzd/pTenBQEo+ms19MCwUL+9avJ+zp5a0u1Fi0yQ4WOp4Z112+YtoeEAoT6h/ac8YIo1Bz9+T4+2PkoF/L/2Eg3h2JUNFXBW+xFSNfTOcOihZodzH9ZUnrEW8OTcHmDbJwANemT479IswZBNaHxHEIR6gZ0PKsDAEXXasoyO0S8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EWDmdWpZ; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EWDmdWpZ"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-834da62e52dso201568b3a.3
        for <linux-sound@vger.kernel.org>; Mon, 27 Apr 2026 18:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777338010; x=1777942810; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1ExVlBK6yfPF6ChKFqCEfF4LFbrOBgO9xJ9WM36C6VQ=;
        b=EWDmdWpZQOUkbwfuCFw8SEXr/HJaBT1JUE7DusZOLZUpwZsYu90++tNv4vc7g8RXYi
         4STs33sNIu24L7T8tZjgtR68Qa+vwP4fVNGbMRVglD4rdPJSRRSUidvD1uPMlFK0wYk4
         ZvcbrmiiDCOOKnrRjC8xfK4CzeZJDztwG1YIlpTWXoPY9r6b6qHzXzSoWuKe8Rf9eFFk
         tP4e07hrYqsS/qR6ilt3Ww10CgUVdpwehA0frfo4FQPoRhv6GPdwY1dihvLTvDKSRx7o
         tiCV89mxMTc5ObVIecIEGVlxutlVNQfv5Ozrz61FJp4//X5vgsArBhHHTzYRZHvOtJ8Q
         txKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777338010; x=1777942810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1ExVlBK6yfPF6ChKFqCEfF4LFbrOBgO9xJ9WM36C6VQ=;
        b=YxyAZX1Xd4rhDaty6F1Ykga8VQKv00EaOlCgUi7S2Ct8g+4fJRbBVDzq8UXu9OT0eU
         YgryeMV5x5ObOVodQ+ZploGCoVF1mkWZtpJ8AXvrxIOVkJVcbgMD6CyVfNpxpUmzDpgr
         XsCVvGxiNIBxym68Dd7AWBuEHd3gebnCHne/NTip6XoVNJxhKSeHLZC0U6oJ7xRnoj9p
         0iwsaH0Y54JLv0BESMu2V4gOFm+D/h+lTa1xgYXkqCNTG7h3h3qTHIqGuBvyxBR3RZK4
         uLv7mARBFVpwE6bZlzMg39IKyGOf1sEVqw2DKO9LfC0TswyBWIGfYUgPdcsMEZdOqrdM
         oMvw==
X-Forwarded-Encrypted: i=1; AFNElJ+cUTQxw8CUv9Two4OKv6xzx96mCPkRAYX4oFQds2Z+OetymCiLBlclmZbOXqG/bhqndB/1MzoNuNSFNA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwpsjdGJLaW0aIhqqw10+GcjGCkWRH1w/BKjRNrEx49KaqNM5Mk
	1HuRa1mN+3speJQn1vnI3pBBFno57cPLxPwl05yqfVTz3KhoFtKlXUyfXHOMdh+gGqA=
X-Gm-Gg: AeBDietmP6lNNNobRx/2S2hgqCqVr1mgV5ZLAJmzrd9Uw1wyNfK2sI/FdZ8o48DEo0D
	mti5QjkMhzbX5arT50tm24Fa7HkfV/7wKCVQMMj3Lrn4qyzKHCTglukNytRmpN7Gj/x0xWEbH1n
	OW1qpm7bc9HhxdtYOE9CL1resSrzfAEWiIL/KMIJyPHox/XuKjV3Yur0wTDO4IjmXbDVtKJ6dvO
	38kT/L36P1/hK3SqjDLQHh9plcHgNGHLYDFXK7juJ7lkEAgiNs4GBbgTgYLRXEy75/QBoyL3Hxk
	U26R5DkJptxFr5IrfN6xKkMewfuPJ4YJuDmp5ZFXL2VygcK2GNXHLrKRGbrLNqASxGla6Z2+7OH
	PRSbRr584X3WtRpRT2GTS0vAk0ApEtIgcHIGaPFHjVEvTM8Ccv9G+ajBUBgo5qi2DlpEgZ9tw+z
	/3KuPbhcjtJopmou6db6uvSYdViBwOhe1P0YYq4vurbWqyncDGkNFTfAfS9qRKq98qvSQqYh2Ok
	xRzi9fgaZqddHVjK9J1uCTlgZHftzzV4TRQxQEU2/o79SKdGzx3Mns=
X-Received: by 2002:a05:6a00:2191:b0:82c:212a:906a with SMTP id d2e1a72fcca58-834ddbd1f0cmr752937b3a.36.1777338010112;
        Mon, 27 Apr 2026 18:00:10 -0700 (PDT)
Received: from abhinav-victus.tailde2db8.ts.net ([2401:4900:8fce:e883:fb90:df80:4d01:5ac2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834dae2027bsm766279b3a.16.2026.04.27.18.00.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 18:00:09 -0700 (PDT)
From: Abhinav Mahadevan <abhi220204@gmail.com>
To: tiwai@suse.com
Cc: perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Abhinav Mahadevan <abhi220204@gmail.com>
Subject: [PATCH v2] ALSA: usb-audio: Add quirk for PreSonus AudioBox USB
Date: Tue, 28 Apr 2026 06:21:19 +0530
Message-ID: <20260428005433.6326-1-abhi220204@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260410143335.5974-1-abhi220204@gmail.com>
References: <20260410143335.5974-1-abhi220204@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PreSonus AudioBox USB (0x194f:0x0301) only supports S24_3LE
format for both playback and capture. It does not support S16_LE
despite being a USB full-speed device. Add explicit format quirks
for both the playback (interface 2) and capture (interface 3)
interfaces to ensure correct format negotiation.

Signed-off-by: Abhinav Mahadevan <abhi220204@gmail.com>
---

v2: Fix placement -  entry was incorrectly inside a #if 0 disabled block.
Moved to after the #endif /* disabled */.
 
 sound/usb/quirks-table.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/usb/quirks-table.h b/sound/usb/quirks-table.h
index 803e03d4d..4e9cfff40 100644
--- a/sound/usb/quirks-table.h
+++ b/sound/usb/quirks-table.h
@@ -2652,6 +2652,9 @@ YAMAHA_DEVICE(0x7010, "UB99"),
 		}
 	}
 },
+
+#endif /* disabled */
+
 {
 	/*
 	 * The AudioBox USB advertises S24_3LE as the only supported format
@@ -2700,7 +2703,6 @@ YAMAHA_DEVICE(0x7010, "UB99"),
 		}
 	}
 },
-#endif /* disabled */
 
 {
 	/*
-- 
2.43.0

