Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76BBC33F5B4
	for <linux-sound@vger.kernel.org>; Fri, 10 Apr 2026 20:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775851541; cv=none; b=QPIm1lW+ETiM8zbaDFjBQZajtCaDfirNqeC7iGQu5ef4fCl2HCxYpDYwO5fwF2BpNjkRQNmJC2d/fXuEUb+xhHWBvvkn5mjzoqkqEXtBdxMyeWZiDERf5t+WLOAcjo4glOHy/vEhk72xxKVAS4a59iCMeU7S8VFKUeEnzVUXzCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775851541; c=relaxed/simple;
	bh=jYBaZSk47h49/UqT8e3PRQ67bwmqVz7cqB9iYdCKRk0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KKUUD1xm9RDo5AtelA1atCfajR7hgR7+Alb8dTugt6U/JebhbtNC87BGE2pSzOxm37AAvgGbh9RHBI1sINOe3kxVzbRkFLHD+2AYXPvka8fFvEGobu3fgPY/I5IoF80LeO3YMmOBZkhQzoEx/qQezTsjflwuCe7CIHlqwDgccf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UdcdsVAd; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UdcdsVAd"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2ab077e3f32so12718685ad.3
        for <linux-sound@vger.kernel.org>; Fri, 10 Apr 2026 13:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775851540; x=1776456340; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wy1C3mjVH82pIZr4ZclKeuxKDX447EFpvhR4x2iEAno=;
        b=UdcdsVAd9LXtH6sXNs0AR91bj5d0EqTSFCw0cd5NfuDCY7ss2NWzYH1PGhIoL2fcN/
         aMmWNArWp3dTR0NcBy6RsE5MyObHLDXrizJW7L2OIWwwuSKyTdLN48MhGk9bRJrjlVC0
         9Dsf8cPtvknvCXSAN8yE3M1fjQqj+Mk/9eUCXrfKDnovPVDLMDnTgt0qt7EGq2MhPAdV
         9Ne4nqdxhVgwxID4wNYy/9cRpGxg2l0yvSLVr4ZdJt8PNF/anLVxmUcc7gdmXaIf0GRu
         ZAM642dibiw7+M/Vd2kThHriw2FoKEK65K1ccyenCMosLEGzwYKmh2ceC7IO2uPgB4Gu
         T0UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775851540; x=1776456340;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wy1C3mjVH82pIZr4ZclKeuxKDX447EFpvhR4x2iEAno=;
        b=KExtC0bUpsj1G8t5lFOBNDzCEonTtYmID6Ek1PorQn91K+1nFin+9VZK5ipV17FUc6
         C6Nyyaaq1QgN0zPlGiifBDbDxYIJloibJVrcFpM499711+APtUlJWN+mVCPm/vTOM7Du
         NYU21mZjbQx+HBnqip/Q4coHCcpE2xPNevLEcYxgt4CnCVj+A2Y0Mu/RLabRluDw4/tv
         5ZWxtK6BhRLZBCgIR1U7EiTLDMc+3Ac1n/wlP34xgbzCVnQfKioM/fcanJCAppLibOzr
         xEs7y+GmWPPcrbnT8RonINXQg26L5fs8fHjIYJ06MWDF3ZgT7A93Y6wiqSnpAsG+iIJl
         7F4w==
X-Forwarded-Encrypted: i=1; AJvYcCUkMUSL6c4E9THnGyGIgbKzZBnsPuMvrZbhK3eC6TdW24SMani3AYStKfT6c+WprdwAxmLSpvBRNGygXw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzmFV5Pn88r63Tw137ouFx5b+o0eb/UPshyUBq7Opzz/dzOo4zl
	8vl7UddHr3FjcBTPwF2cezasxYRm3+iOAPBFmUWT8yYUAMOZ3F6uW1ii
X-Gm-Gg: AeBDieu3BM9veX+cbxirTl7aEj/wn6dn/K3v2XxX/5grdnhvqqkznbbl79H4SpAnyUy
	CMRO1KCB1M7tnE0dqqxUem3rJHLTy0/546dEu471pzHKmnwMRxSNczpL8ueP3/6jxdu8ZAgcjvs
	IK5lDiGfAL2LUn3XlrqSGbs4Y8tchIEBBdCUu2KXW/RKL9fGs88T9kc/szMBhNhGjEPFBxoGpJJ
	l+/R8OoPH9rzMeJ3lMwx4pEPqOnh8vETKkH0LaRdL0Q2r+0V+Y2g7Mvc0mFLsRFM6oY7QxjOjNN
	SW3AFIOjnotvUF/Ows6zruAQaL+lkp29q0snHV18UM4XUM16Boih7KbneCr1tfa1kWrlLiSXWL+
	VQtYtV4kzi63DyidKlonl0X8cO8BCby6ytMLFiX+H53rWSMf7wLigP3Y5UFxxnMSWHR7d5Zs12I
	+ekUTvFYcCsFH8+wsSzSg/80BkrFQ8yMRLY9t902U2B4xfGm36H8OH/NhDsm795d5VvrRJk8p/R
	lGbAd5uAVzRgUFhvwA2iq1NKkMaPr8WelmDznxs
X-Received: by 2002:a17:903:1207:b0:2b2:49a7:a5bd with SMTP id d9443c01a7336-2b2d591d9dcmr47814325ad.1.1775851539751;
        Fri, 10 Apr 2026 13:05:39 -0700 (PDT)
Received: from lord-daniel-VivoBook-ASUSLaptop-K3502ZA-S3502ZA.. ([2405:201:31:d01f:a107:5c92:b303:910a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4dabc08sm39569975ad.5.2026.04.10.13.05.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 13:05:39 -0700 (PDT)
From: Piyush Patle <piyushpatle228@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sheetal <sheetal@nvidia.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] ASoC: tegra210: simplify ADX/AMX byte map get/put logic
Date: Sat, 11 Apr 2026 01:35:21 +0530
Message-ID: <20260410200530.171323-1-piyushpatle228@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Tegra210 ADX and AMX drivers both keep their "Byte Map N" ALSA
control state as a byte-packed u32 map[] array along with a separate
byte_mask[] bitmap. This is because the control range exposed to
userspace is [0, 256], where 256 is the "disabled" sentinel and
does not fit in a byte, so the two arrays have to be cross-checked
on every get()/put().

This series stores each slot as a u16 holding the user-visible
value directly, turning get_byte_map() into a direct return and
put_byte_map() into a compare-and-store. The hardware-facing packed
RAM word and the IN_BYTE_EN / OUT_BYTE_EN enable masks are computed
on the fly inside each write_map_ram() callback, which is the only
place that needs to know the hardware layout. The byte_mask[] field
is kept in the driver struct but allocated dynamically in probe()
using devm_kcalloc() with soc_data->byte_mask_size, and zeroed +
recomputed on each write_map_ram() call.

There is no userspace-visible ABI change. Control declarations,
ranges, initial values and handling of out-of-range writes is
preserved by treating values outside [0, 255] as disabled (256),
matching previous behavior. As a side effect each patch also fixes
a latent bug in put_byte_map() where an enabled-to-enabled value
change was not persisted.

The packed RAM word construction is also updated to ensure the shift
operates on a u32 value, avoiding potential undefined behavior due
to signed integer promotion.

Addresses TODO comments left in tegra210_{adx,amx}_get_byte_map().

Changes since v2:
 - Move byte_mask allocation back to probe() with devm_kcalloc()
   using soc_data->byte_mask_size; revert write_map_ram() to void
   and runtime_resume() to returning 0. Suggested by Jon Hunter.
 - Fix bits_per_mask: use BITS_PER_TYPE(*byte_mask) instead of the
   incorrect BITS_PER_TYPE(*map) * BITS_PER_BYTE. Reported by
   Mark Brown.
 - Drop <linux/slab.h> include (no longer needed without kfree).

Changes since v1:
 - Use dynamic sizing via soc_data->byte_mask_size instead of
   chip-specific constants. Suggested by Sheetal.
 - Replace magic numbers with TEGRA_{ADX,AMX}_SLOTS_PER_WORD
   and use BITS_PER_BYTE / BITS_PER_TYPE(). Suggested by Sheetal.
 - Add <linux/bits.h> include.

Patch 1/2: ASoC: tegra210_adx: simplify byte map get/put logic
Patch 2/2: ASoC: tegra210_amx: simplify byte map get/put logic

Piyush Patle (2):
  ASoC: tegra210_adx: simplify byte map get/put logic
  ASoC: tegra210_amx: simplify byte map get/put logic

 sound/soc/tegra/tegra210_adx.c | 85 ++++++++++++++++++----------------
 sound/soc/tegra/tegra210_adx.h |  5 +-
 sound/soc/tegra/tegra210_amx.c | 82 ++++++++++++++++----------------
 sound/soc/tegra/tegra210_amx.h |  5 +-
 4 files changed, 96 insertions(+), 81 deletions(-)

-- 
2.43.0

