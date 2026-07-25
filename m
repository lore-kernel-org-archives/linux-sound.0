Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1DB13F1ACF
	for <linux-sound@vger.kernel.org>; Sat, 25 Jul 2026 16:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784995455; cv=none; b=ccnxCNQ5MgtOGWEeudLwxFZIKn94wdMjlrJ+u/P+MSec1Uf6tfNCpyOdVzpqItU99tUVks+/kOxEym8jIVBLq/vpjQdBQxtTcbMwwhnRIySED7aX7pSs4v+b3fG0P/maW50GtmAO0T3Iu8Cr2EPfSDRYd5fvEhEMkaWXg/Vgj8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784995455; c=relaxed/simple;
	bh=zSmOjxn8ULveJ+lMJcvNWB+cSgHcSxEvHI8t1Z2/yB4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kzlu++xY5/O29gAUqhS5YGEmAuUiBOQ3pwSd7OxDWabrBToYtZgYrzPchUPm417TrWXdlYlsLel01Gjw8utWvnkKQc7WqlstQdp/5FM1jiUR95yeQuoTl1MwTjh7tQaSZcifEwOhg4Yx5qM0l5QVqiHJWrmr77745Ml1MDEJJDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dfTH0T6f; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dfTH0T6f"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-84e04df8c46so1482328b3a.2
        for <linux-sound@vger.kernel.org>; Sat, 25 Jul 2026 09:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784995451; x=1785600251; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fCIpNFMmztMRNldJRGuASxbV3OV81s/VD+lhHDbCviQ=;
        b=dfTH0T6fRRv1BBAUn+6mDNFnl4r59w3LAsq6RqJYFdNJO2ThudJM0BEYD1J9PaiThQ
         1Db/elGY0DcclYd1Yei3sJXwvumJcf03MDvVp+RDhOblkwTjtL4OM9Zej8xKawjTRAas
         9ImAqr20Xo8FZLZQmWPFKuVgAkiIQ1BTN8bQfwD/nnrv2jvBFEXv13D95p5MDwghjukH
         vjKqFCSbiFocNJlJDbs0RD6A3pj3x8Feo2arM/NzcDxuucq5NtsTfvRAVj5hKPzZ6ZR4
         lrcyn4eYf/d7nYWtb6E01QGNeMu9mTeaa3jH1Ns+VLY1ydVrMWXhBmeJmW7EeVVPDaW3
         g9lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784995451; x=1785600251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fCIpNFMmztMRNldJRGuASxbV3OV81s/VD+lhHDbCviQ=;
        b=n2QEQOvTWqiuuLgcaCF8+KD5r3VbVuaLjpQcl1IeZtGfwV63PkR5im5YYtjYCNEKqC
         5ZjbQv0Ds0Ix2DmOQAwlX20TrzOOf8669zeuICtn9mGMkxOsOxyxZKY8J0moGS2zUTO3
         Hjr3cLBk1GfHYSG0P83oQoRlWJBK8Imkhk5ME+Go3cObq9jr9LrBhn6AB3qxt5n4bMKc
         nehspRog5nLNYQmll1OsmpPbHMEq+DARJmXUXoKGBvxNobpgUYLSjXleXMC0byHW/xTm
         0f2laYFePy3m+MfMi37iHsB073dBaO7NuB3ts6q2lqyP4g8wPpLu1Em+oBlGIcFDqdi4
         cq/Q==
X-Forwarded-Encrypted: i=1; AHgh+RqkSddufBpoI3V346vin/w8EqMBnob3ughCAoZMoZqn4ri6FS79noN6XaO1jDXVU3h9jQSvgyo6Sd43jw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7emcb1hJgQasJpiVpK8+IeoEqBwrsZhJqj9uSYvksNo7k87b1
	2uY/fC9bi+hnvYWlbcoiT8M9qf0gurmw/gg3P1t00tJegfLQI56upkkI
X-Gm-Gg: AR+sD12jmM+gaBPpeaFniZ6ked+w7EigiRMzZiGkoR8mqcfXex9KVXdXdH++ihMlxZ/
	8cBU2vQfEqK93Rvu90kojqxLNZc1qq4x4Z7FLBtwjsdcEGYlhsJR21l97EXKUASqsWRSvX8y+CW
	dBpn5BZcKUiq/HtWqVXoLxbYJDU+pUBNivxgdfcZpAH2+Bslp7P9NiLunBG5ZUOGlsEA4z465Ap
	mJ6O671HtTdxkKpUlTt+48f44VcGC8edY7n52l5gUNP7zrkyRuOkIPksbIuf4UNw37jj/CfTtjO
	7+1HoDuX0rVRdO2eSlvN+skQ4fhFvTf9dO4QDHRuskDDvyoE5RntGrzLHoU3b78PcdTLqOx6BUi
	S9N2fqTiHL4wOP+PORUYZrYBRg3pn9KhZMS/go/IiXcOnN+eyTe5UjzZuWiaUVN2YWmRUgfbx
X-Received: by 2002:a05:6a00:10c6:b0:846:1698:638b with SMTP id d2e1a72fcca58-84e5946f4cemr2066101b3a.27.1784995451530;
        Sat, 25 Jul 2026 09:04:11 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e5341d8f0sm1171554b3a.44.2026.07.25.09.04.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 09:04:10 -0700 (PDT)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	sound-open-firmware@alsa-project.org,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH v2 4/4] ASoC: SOF: Intel: remove conditional return with no effect
Date: Sun, 26 Jul 2026 01:03:43 +0900
Message-ID: <20260725160344.916838-5-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260725160344.916838-1-ekffu200098@gmail.com>
References: <20260725160344.916838-1-ekffu200098@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Both branches of the check return the same value, so the check has
no effect. Remove it and return the value directly.

This is the result of running the Coccinelle script from
scripts/coccinelle/misc/cond_return_no_effect.cocci.

Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
---
 sound/soc/sof/intel/hda-dsp.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dsp.c b/sound/soc/sof/intel/hda-dsp.c
index e9f092f082a1..b9b2bdff4ccb 100644
--- a/sound/soc/sof/intel/hda-dsp.c
+++ b/sound/soc/sof/intel/hda-dsp.c
@@ -1114,11 +1114,7 @@ static int hda_dsp_s5_quirk(struct snd_sof_dev *sdev)
 	usleep_range(500, 1000);
 
 	/* Restore state for shutdown, back to reset */
-	ret = hda_dsp_ctrl_link_reset(sdev, true);
-	if (ret < 0)
-		return ret;
-
-	return ret;
+	return hda_dsp_ctrl_link_reset(sdev, true);
 }
 
 int hda_dsp_shutdown_dma_flush(struct snd_sof_dev *sdev)
-- 
2.43.0

