Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792858618;
	b=fqh1mByIxnn6gWRkNq67bqMcgQzt1vxvpnZuNTWXxkVzO7/C5v6SIFoZ0ROs2DtX91Zn
	 5kJci5coFSLyEDzAZ2djeREKj5rxDEPfkJQdwY1TCZgZ1KEOHF1J/NRbopQAiupiz4Et8
	 8ORqlbsSS+zV4TzB1d9XRBI8lco2xNc6uQ+LU/ZwdGlZU9Gyi6u2S65CFIE9WcfpCnCoy
	 sBOiRpvys+VfAgFWwFmHysndSXEqN2825qFAJoGQTtjN2TCnsI4wnOyHqy5R4hFtM04LI
	 KfZNHi/Uu+pPUSlzMNk4t2fyawfQ5v2mzSgZfT+u+5vHquKYU+32o518fn2L5vw73QQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792858618;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=AOGWZcrBZoO7CPXaiikuuyaqjGZKSk1gc081ebM1RZM=;
	b=PpHwKOLQCZp3onhyyPyWTTWzSZ4V+S0ppmnqdlZSllteX5XTD8RrMz1hxndyb6nnDB2E
	 ny6+x7EnT6JAYznkgpn/q2vsZvjkALt25s6PB+6bqrEdm3d2C8lnQw3UEGKTMCs/ZorV7
	 0+T2r92L9REaqF3aBzStmb7QLt6sh57tdDOlH59r/QHCIk/Ex5afNP9JsORua7N1QaZN8
	 0r+uzmgAy/Irw0BrQyzRvBf3IYdYJmIopqyERsRUFBjN8vUZP79pU6ahmcB+vrcU87cxh
	 0ZIehRGsrnf63vSkTYQOlVE+iyRJuuqKfDCDob/A+85mh9Rincgq9efoMod8720d8Eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=asseily.com;
	spf=pass smtp.mailfrom=asseily.com;
	dkim=pass header.d=asseily.com header.i=@asseily.com header.a=rsa-sha256 header.s=google header.b=RAaYSvon;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C048606A31B
	for <linux-sound@vger.kernel.org>; Sat, 24 Oct 2026 16:16:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C048606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=asseily.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asseily.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=asseily.com header.i=@asseily.com header.a=rsa-sha256 header.s=google header.b=RAaYSvon
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a208d93758so19186685e9.3
        for <linux-sound@vger.kernel.org>; Sat, 24 Oct 2026 09:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asseily.com; s=google; t=1792858616; x=1793463416; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AOGWZcrBZoO7CPXaiikuuyaqjGZKSk1gc081ebM1RZM=;
        b=RAaYSvonR4qouJog0CyJbGB6T9+L01g1zbd3cM6gD7yyOlhk1jwBHBZdcBxdGiV5a2
         +Hn6UnzguUG8Dy99BTUnBcOa5rC3EU7VuULinOizOgqi9vHwRLP6f/RBxmc2Wm3gru8z
         hE3PFyKIElmCEdx5WIpTfkBupROGoujMgEgiDPSdNQ7gbwB3jQwTevLS57vhf+UW4ipJ
         BKOY449szzRt0o39Z+wP8M2ueSrkWrP2C2hmWGdLYaoKBJPInR1ba4SPneW6w3jwqPJK
         zHEQAhtuWRToLILi5qKy6qdER5gBCvAW7NnVq1ZhKtAbAgBcZn2qkZh5T0YTAZH0FaI+
         pjtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792858616; x=1793463416;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AOGWZcrBZoO7CPXaiikuuyaqjGZKSk1gc081ebM1RZM=;
        b=0ECHgythZ5sNdscKXuZ5nI2wWORz66hXPWBqdE/9nHuV+l/Yar7UEisOcncq3PWjlf
         ZyJZNCbJ4RCuQCNHK/3CkK3Z2FkbeoNxSP6P5BLDfVs2kSvrZUpZu74Uq/njPq6hGfAq
         1uAA6mg21dZ9NHKQZl24dxtZYxnXOKR2tFNTh4R+AzIOo/IYmIu0/S60hxqciMFuKVzP
         oENMJhAh0oGfHoR/ymQGKMnkW3fDlsKLkouJt/YNptQHBsOoWUszMwCcRC9qRZ1kLq8H
         VG6bcpkTLTo1dDJiDhkfbcv3dk746s5k2GbXcXmFUZoJ9fj9e/Xln6/LIkY8Qq0Cq7Wq
         t6vQ==
X-Gm-Message-State: AFq9FYJsbvUdBFNECqfyoKz4cqU1BhQz8XL1LhgHpGtM4dYRDkRyi4KP
	zbtrNsfXBlDuna4ilaV2ztSX5pmX5TksdS4DP2ew8MUiW3oOfd1WIbVNJW3txbU6f/0=
X-Gm-Gg: AYBFou3uwaL/RYJDVzTlPKLp2nlIcFSeIfCiaOAKJ/kTmSpLY66V2j5dTwPuAn5Jrib
	XgKO+mGC+BPhnUhmiYoozqRMiPbApQkevROQ17w/dVsamOlNY0n1+PA6GGA3K6aZzBS4LAnhLFb
	NPZssqIY7w01SVMF4NT5e9TW1F474DIhKFo5fw09f+czD3+OkSgmx74YSw2M6iRC6TqmSuXjw2m
	uvNw1cFxWDrXkuj7eoOdqB1bXhVZdKZoC+3lgxIOHbdrio7OqGGbTgfmz44m+I8Ro3YVwGZ4Qw8
	ZoShz7Wse8s6ktRobM5zRIF67G5vQowejiftEbG+H2I3sGu5l6zBPuq7PQQ4Kc26FeXjfoeihE6
	PaR6kuFmIM5AhPXPgqq/8mOwOYN+Kru3uHLniqzj87sDZmqOF01m6ax6vBkvk1tjZek40jLqq2K
	0VjPZrx/J0gOzt/b6eBC51ikrEbcRjq69LPT1OICXM0q0Cqp/uScQxCVvn7GExrcY01PNxpoTOU
	IvZeCHDDXcWFLDOVxBfGPgdHd5EQBJ3ge4K7y3jT/8mAnB0no7sCjyjyxABL6VjIXWo6w==
X-Received: by 2002:a05:600c:4688:b0:4a1:e69d:90e8 with SMTP id 5b1f17b1804b1-4a35aca5a1amr34062485e9.22.1792858615676;
        Sat, 24 Oct 2026 09:16:55 -0700 (PDT)
Received: from localhost.localdomain ([178.135.21.173])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a30e11bsm78516845e9.1.2026.10.24.09.16.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 09:16:55 -0700 (PDT)
From: Karl Asseily <karl@asseily.com>
To: broonie@kernel.org,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Karl Asseily <karl@asseily.com>
Subject: [PATCH] ASoC: es9039q2m: Document the FIR coefficient payload format
Date: Sat, 24 Oct 2026 19:16:34 +0300
Message-ID: <20261024161635.12956-1-karl@asseily.com>
X-Mailer: git-send-email 2.47.3
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

The programmable FIR controls are TLV byte controls whose payload is the
raw coefficient data, with no type/length header. Nothing in the driver
says so, and the in-tree precedents differ - wm_adsp takes raw data, SOF
expects a header of its own - so user space is left to guess.

The driver cannot catch a wrong guess either.
snd_soc_bytes_tlv_callback() clamps the byte count to .max before
calling .put, and .max is exactly the size es9039_fir_put() checks for,
so an over-long write with a header in front is cut to a valid length
and loads the header as the first taps.

Document the format at the control definition. No functional change.

Link: https://lore.kernel.org/all/CA+gvwbqrav5C9e=9Jx1i31nrEZGDko73tAAhGzzexeRa1f72LQ@mail.gmail.com/
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Karl Asseily <karl@asseily.com>
---
 sound/soc/codecs/es9039q2m.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/sound/soc/codecs/es9039q2m.c b/sound/soc/codecs/es9039q2m.c
index 4e9f86cb7..bf206bf95 100644
--- a/sound/soc/codecs/es9039q2m.c
+++ b/sound/soc/codecs/es9039q2m.c
@@ -632,6 +632,20 @@ static struct es9039_fir_ctl es9039_fir4x = {
 	.stage_4x = true,
 };
 
+/*
+ * The FIR coefficient controls take raw coefficients and nothing else:
+ * tlv[] carries taps * ES9039_COEFF_BYTES bytes with no type/length header.
+ * snd_soc_bytes_tlv_callback() passes the user pointer to .put unchanged,
+ * so a header would be loaded as coefficients. wm_adsp uses the same
+ * convention and SOF embeds a header of its own, so the choice is stated
+ * here rather than left to be inferred.
+ *
+ * The driver cannot enforce it. The callback clamps the count it passes on
+ * to .max, which is exactly taps * ES9039_COEFF_BYTES, so the size check in
+ * es9039_fir_put() can only reject a short write. An over-long one - a
+ * header followed by a full coefficient set - arrives truncated to .max,
+ * passes the check, and loads the header words as the first taps.
+ */
 #define ES9039_FIR(xname, xctl)						\
 {									\
 	.iface	= SNDRV_CTL_ELEM_IFACE_MIXER,				\
-- 
2.47.3

