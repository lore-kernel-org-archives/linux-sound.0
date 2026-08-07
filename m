Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A82432E60
	for <linux-sound@vger.kernel.org>; Fri,  7 Aug 2026 11:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786102929; cv=none; b=IMHdGwSl3o32PyQTkFIdARbNtNF69GymL/puDX9PqNO2FvJnnxEKIkQ2aUzFcTeKW5CixPZykZ0itZN3wQdckTIPukhgN47fHoTTxKtZ4MMevmAuAFdTR7Sdm8RVsmPltWcTuosB6zGjSbRKVZNxG/JLIa0Bn4Kv/28FjcBNq0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786102929; c=relaxed/simple;
	bh=uRyyS/TQ18/0MK0AkpWhg1pICp38gYZjbegYgr16Da4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B1ffwWK1QqePDZEQ4kKdOOW0xlmfB2cUnGgnQBOQr3IYTH+yPXCLIYnX+HP8gGcNjbNYxNNlYFhBwPIBovX7h7ifWoJY4DcHOMUHSUA7BdEGglTZhHHkwnA3FwtPt9ZyiL8Y1NpbZv28tO+Up8Dy2FcPBwFNwXk0Gx6Rhogs5Bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U8LLYONH; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U8LLYONH"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c9cf07d2df6so2528081a12.2
        for <linux-sound@vger.kernel.org>; Fri, 07 Aug 2026 04:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786102915; x=1786707715; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=okl/jiYNOrs7smS8pdiskAh43Nj4LGwoWWGMcsJQsDA=;
        b=U8LLYONHGzjCLjLP5WoTh6tkwr4OPuBoKuNLimhHoss3GkzFf8fMe4pyGyDaY44Wse
         l99elXcryFnTqhWo6t62fFrA9u+OdbxBEPkLFCStpoHNqBI5QBz5c3qOW2HMFgh9dJwZ
         9Yp9XmxaZXY+5+nhqdQTidPkc/FeMgX6kUiEwl51Q0gJ8nkoQo1y3aaMtd01F/KfsL7X
         3t9Gxhmv91eqIjRgSWEljmCYVX+2lp9FqJPS2mnp1ZHA9PsEfTbF+mAAUr/JyT9xWHjP
         s8FLT91XPba2QntbaWjSML9Iy6r5Dtbz/t9SBP+53Ggu/Pj/c2wDDUvdHTfJ/uciweux
         ix8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786102915; x=1786707715;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=okl/jiYNOrs7smS8pdiskAh43Nj4LGwoWWGMcsJQsDA=;
        b=rDAQBbS0QNAGc9uqQ/37xQVvX+TtLrduBpGg9GC6COkCpob3hKOs9xZHYG2fh6abxo
         WfXCYJDS3Xk10NhsAUw/j/LSKE7zEK32DK5OPOL/mpQXwf7FOoNkeI+IDp7Hl+3MyOLY
         QQhTAlqun7DiJMhgVhphXW9Fqy3rH5ljaLYQQpyp5sMCDl8PzGR++pzLxfssfpIXoS0K
         N8WCMEyIckUXbU+aNBmZnSluMkML9WXMKKRSX9obo1B5FkMUiIq5T8oiTpY4WvnjzFKh
         XFHt4MAdy+JGWdjru/RFQmwiqQkPO+1plwvKbMN5a7qKRq75tM+qRZS93zB59qQylnY8
         S/aQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr34px1pzRu+XSUFKQ/fvtGB/FHr7Lrs4XYSJKiC6rOwU3lNQrgCWBDBnJeF3M3/iQrMeIhEIABNfWz8g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzRZszcG6nOylB00YcaoGQ/znAHJlgcmToyevUqPxobEsuCKXeP
	Jh7My2cpjzv/pI9Hm6YemDgYVCKRRYlbnHaNuh378lcZv8KsO7o8LbBF2TCH/T79
X-Gm-Gg: AR+sD112OfdDWJMpPjy+Yce7cjLgdlyvkjysOXE18E1fs5gS2zErff0ihWrt/wmEfpr
	TV4tWbU6YLM6l5pf16pb7l3Jy9BXheAG+6yOgbtqV0U5O7xKaz5U8G2HSwUtzuA51ymL7HicShF
	A+LG+FgAYTwEAtFwzB7ZIcYXbDhrex1DC1R8LWQg1udJ12Hx5ETRWJW101iDE2w8vjYWGC9FsCi
	SLq8p27gk+CudsYPh8YoOYNfDyXc79k2w9V2dEY/VRh+23TioBFbkRZLSoOSSRrS2hXC/23+Uw9
	H1++G7AVPwgwr/szlfqKIvEBo3Dj40ziaXcgGv/hZjGo2MbgeH2GWQmL4PqEQZsdnLFnsZ9cgpI
	6exDcWdCeX9bHwFxtgbClpqzcTS0RXXKp66vi2NtcpD/LHj0WsHX5/Q+e36uADsx0dAeLKhmiUS
	sD7q2D65aIZRxeFvX8k8kgnCHUnMHM7KI+tflS/+ndXMb6ltlzb9rvwD9T1GX3+leCW8mkLmBVN
	y/mYVSRyuw=
X-Received: by 2002:a05:6a21:697:b0:3c3:c3fb:2473 with SMTP id adf61e73a8af0-3cb85e736ecmr28994685637.20.1786102914636;
        Fri, 07 Aug 2026 04:41:54 -0700 (PDT)
Received: from localhost.localdomain ([72.255.58.127])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315be86d3fcsm6930508eec.4.2026.08.07.04.41.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 04:41:54 -0700 (PDT)
From: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: Kees Cook <kees@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
Subject: [PATCH 0/7] ALSA: remove remaining strlcat() users under sound/
Date: Fri,  7 Aug 2026 11:41:32 +0000
Message-ID: <20260807114139.1661-1-mahad.ibrahim.dev@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

strlcat() is deprecated and slated for removal once its remaining
users are converted.  This series converts the sound/ users outside
of ASoC.

Each site is converted to an explicit offset plus a bounded copy:
strscpy() where the appended text has no format specifiers, and
scnprintf() where it does or where the resulting length is needed.

After this series the only remaining strlcat() user under sound/ is
sound/soc/codecs/wm_adsp_fw_find_test.c, which goes via ASoC.

Build-tested with allmodconfig and boot-tested on x86_64.

The generated strings were checked against the pre-patch code in a
userspace harness for empty, whitespace-padded, exact-fit and
oversized inputs, and came out identical.  No audio hardware was
available here, so the drivers themselves have not been exercised at
runtime.

Mahad Ibrahim (7):
  ALSA: ump: replace strlcat() with strscpy()
  ALSA: ac97: replace strlcat() with scnprintf()
  ALSA: cmipci: replace strlcat() with strscpy()
  ALSA: caiaq: replace strlcat() with strscpy()
  ALSA: usb-audio: replace strlcat() with append_ctl_name()
  ALSA: hiface: replace strlcat() with scnprintf()
  ALSA: usb-audio: replace strlcat() in longname construction

 sound/core/ump.c            |  7 +++++--
 sound/pci/ac97/ac97_codec.c |  8 ++++----
 sound/pci/cmipci.c          |  8 ++++++--
 sound/usb/caiaq/input.c     |  5 +++--
 sound/usb/card.c            | 27 +++++++++++++++++----------
 sound/usb/hiface/chip.c     |  4 ++--
 sound/usb/mixer.c           |  8 ++++++--
 7 files changed, 43 insertions(+), 24 deletions(-)

-- 
2.54.0

