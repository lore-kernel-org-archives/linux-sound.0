Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B823B0AD8
	for <linux-sound@vger.kernel.org>; Sun, 11 Oct 2026 03:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791690920; cv=none; b=IQ6h/vdI/w0uaf97zoVwE1YHLH+KXxw4rw7rS+xDLcm4nTAN3tw6G3LJtwk8oFW8C8+A56urVpmgIruV4lYw5pw/jftjFo5Vvm8xXDe9CYEse+Xvv7VpowSFc2BCxnaUIGJVgP6j/tlEKkZ6sqKXfnRYeWIsGXbr6KmXPxwsNr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791690920; c=relaxed/simple;
	bh=UkSSvCPn665T7qjvHXcBhTS128UxN+1EA30arBtBacU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Oyt2kklMBIIj9u9StP6DFAS1/wje7urwB+LjtPUWvOZ0n8IB2c3NB28YUE2WJT01+kWR/TMgJ+alChl9u1OpI99NdQq4cZM6HH8BfD5Fi+ID1GJmGpCQB/325df1SpLpPNTUl79pbQudBYM5WBkbp+llpxxIN9/afOIxE5m9290=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wc19gO+k; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wc19gO+k"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a018792ab3so7573865e9.0
        for <linux-sound@vger.kernel.org>; Sat, 10 Oct 2026 20:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791690918; x=1792295718; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vaUdEu4koPIKyGQFeZFD5bATRmYQBh/annrTgOkgSHA=;
        b=Wc19gO+k8aTVOUTlF1XS5s4b8hQCgetJ80uxaco1nxt89XhBgYf7hVAXsOk9rfyylM
         vbnO/HTR/ch9YIor7Uao7SVFlEs/EdEpzBRKCcJgSqSBzqfHNyPSUQvQnU597iawVBEw
         s/H3SBiKtTlL4iPUjzrXjcFhw+tM18cc4ylF6EQOEFYL9LJNt844RmhtQnRAHeBxvOBp
         ErH6kFwlXN0srDcPdNlt365E+nMz0omNJOpgdN7iMCT1Wek8NrnciLdjH63ZDdcY9RFb
         IGWuldr0G4VuSAbLvbEgWrzWuu/seAiG4gncxNH3A2v28fwSBGBNufam9vHDcjuTIfT/
         s5Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791690918; x=1792295718;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vaUdEu4koPIKyGQFeZFD5bATRmYQBh/annrTgOkgSHA=;
        b=YfstOCNe+2wujWZ8hQxlkIl0ilLjhD8W21R+FtYH+6X/p9TMSWUVo3L6/8HZbn8Rll
         dnF/OkJVk+MV0EtGrf2eeP7j2u+BEQK1Zhrx12n1uGBTb+1jGa2ZytehWLFiuwOfrk7T
         pPqiiPDpcPoe7vWT+BztH4eE5QWwjCMKzuIj2jqkFrV78odDpak0LbgybbqmRVjrBbE+
         57/luGSuUiDRRhEmg98lYFaufV9LvNFBfCj9xzyDksgSVg+OU2wjdc7pIG2YqoBdBs8c
         rTWUIbX/1NiVfon7CZ3uFD9KLiIW7//WRcOAXY/VrYgOb/U5e8AbKR44uiuSJWfnrjVC
         pmGQ==
X-Forwarded-Encrypted: i=1; AKwUvBzB19KemieFdlo38u3XorVXiT6TvOdnKiL8N+8nbzrhIHu8jUO/mMgsA/rII1AJ3gxyZVQfBZ3dVP8pNQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYK8iSZKzPi0db6A9o6lxe/MvTIrWuz1k9X3xAM9qMPoBC9ZWomr
	jm2YDb7mRJMR64o69kyYqAW9gxUvbe7knO1fwmPJAHWNUl69x1q78xf4
X-Gm-Gg: AYBFou1UQgTaZrhbtPCjWBPsT78MeElgdwJP3kqGxLdS9Xy2VQc/df+LHKjgkFwxBzn
	+5g+2ztDPtRyFJKr3tUV5jmN1HTfYFWuAADrZEmQak7xsB520ElCjg9Q+c7Whz4KkN0PHI2wMIe
	j1cwbWKaHgdCfZoZTaKkYlrDDRxhnpTju10xJyYo1m/R9W38JHCO4MnNzkzl6HksQ2iiS0TLk+s
	WtmX+ebLmtwY7FnqPbQLrb+z6jKxLv2JDVmHHjN65cYg25iDFi3zbdt3dql1jcacxy5O9cf/0HZ
	MjiT7ACLu+FY/VC2XeADWvqcKbqtCJCRcjWYRycLN/kh91VKaaNFJA2wTzZJp2gIkwdqkD4jd7m
	0MVeepCnbq6U+gv9ZxgnadglUPFTqtYXeqG/Goz65zBTIFjxvm5q7rgbdFMsb6zsydzzU+nq+Ta
	fhVwA16BaU/xTnL0QShUKUkROQqXbViQRf50Hs2NJcEzjySoz74gLUUrPvi75hgm4ZwT18pMmSg
	XOvRVuTBuHWxeHZh//8kcQ=
X-Received: by 2002:a05:600c:8218:b0:49f:ffdc:939d with SMTP id 5b1f17b1804b1-4a18e49d9f5mr108349205e9.9.1791690917510;
        Sat, 10 Oct 2026 20:55:17 -0700 (PDT)
Received: from LAPTOP-AVI.taile24b5.ts.net ([2a06:c701:4778:c500:e952:dc8f:95c1:823c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf2caf4sm202624345e9.10.2026.10.10.20.55.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 20:55:15 -0700 (PDT)
From: Avi Weiss <thnkslprpt@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Olivier Moysan <olivier.moysan@foss.st.com>
Cc: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Avi Weiss <thnkslprpt@gmail.com>
Subject: [PATCH] ASoC: stm32: spdifrx: fix synchronization state check
Date: Sun, 11 Oct 2026 06:54:59 +0300
Message-ID: <20261011035459.2289403-1-thnkslprpt@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The interrupt handler uses a logical AND to check whether SPDIFRX
was in the SYNC state before clearing errors. Since both SYNC (1)
and ENABLE (3) are nonzero, this also treats ENABLE as SYNC (and
any other non-zero value that might be added).

The logical && basically just converts this to check for != 0.

So errors occurring while SPDIFRX is enabled cause the driver
to retry synch instead of disconnecting the PCM stream.

Fix is to change the logical && to equality (==) and only retry
when exactly in sync state.

Fixes: 0c93c291321f2 ("ASoC: stm32: spdifrx: retry synchronization in sync state")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
 sound/soc/stm/stm32_spdifrx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/stm/stm32_spdifrx.c b/sound/soc/stm/stm32_spdifrx.c
index 0ece547407739..88863dbd05d9b 100644
--- a/sound/soc/stm/stm32_spdifrx.c
+++ b/sound/soc/stm/stm32_spdifrx.c
@@ -720,7 +720,7 @@ static irqreturn_t stm32_spdifrx_isr(int irq, void *devid)
 
 	if (err) {
 		regmap_read(spdifrx->regmap, STM32_SPDIFRX_CR, &cr);
-		sync_state = FIELD_GET(SPDIFRX_CR_SPDIFEN_MASK, cr) &&
+		sync_state = FIELD_GET(SPDIFRX_CR_SPDIFEN_MASK, cr) ==
 			     SPDIFRX_SPDIFEN_SYNC;
 
 		/* SPDIFRX is in STATE_STOP. Disable SPDIFRX to clear errors */

base-commit: 611680f6050a66b84e5cc0af33862a83d1f7a200
-- 
2.43.0

