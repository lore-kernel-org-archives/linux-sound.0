Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A4BD36A02C
	for <linux-sound@vger.kernel.org>; Sun, 10 May 2026 08:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778402671; cv=none; b=auuDW6LVxAcSr7yQ443fewQBwZR0k+6y/nuqG4h3hncO1dtkPBxmy4N9E79cblOFviZjrpZ1xvZCFHdttaOHzE4Vc91MmCFp/zSHZd2UNl4Xf2niUM4Y9FpOs4Jr+rlubckd2aLYVM1E7NlsAOktv81hbO9bkKhn638h7EtYr3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778402671; c=relaxed/simple;
	bh=hWWNXcujvCRjXLBYmvogX9Tx7LSARP+jOFk6z3oIOdg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tM8R9Q+B41mndGua2KBqgT5QAXRoamGpucuugaAMXBOBZuGC8yirs6gS1HEffZQSg/oDk8A1tEbd4W9NF6k3QKPEahEUY75w5UN+XmHNiPHS/2EYExd7Cx2h+Vr7aSF4YKYaYAGNguRL6FTHdmtTUY6XecFaj8T12AnplZMdZfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U3OIGi9i; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U3OIGi9i"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-362e30526f8so1588896a91.3
        for <linux-sound@vger.kernel.org>; Sun, 10 May 2026 01:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778402669; x=1779007469; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hjT6LUaCKBBOaTLM4HecbTdAzAOftGZyuLAMAnfg8dY=;
        b=U3OIGi9iF2g714qjCK+4M4635sGX0DgtTBpM0EEJUpyI9Mcso0o7aULhDlLrZjyCg0
         ieF9qbMHb4yRkpxpEG5DtvlGFbNwt6Ap8Vts5W9Tf7okMzgVkhCE0Kl2h3xPuF+1rJ1p
         TWqy1OGQ77NCxQX7tJnevZkA4Z0eHW0glaC9UDHbceCjiDIii9hMpsvakzrtD+GlI8nc
         KhUXQ+CAkUXscCzAA0fCqzhChZA9qp7z6uN9WbePxEZYu+6qh48VeAHsvBtg81DZk5SN
         zonkxqaq6/wBT+cMZxttBtjiegk+oRT6GtsJacYCtbqoschJY94UPlJIr9JepN9y6Loi
         4/cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778402669; x=1779007469;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hjT6LUaCKBBOaTLM4HecbTdAzAOftGZyuLAMAnfg8dY=;
        b=PfrgBghKcwUkEm8Zt9ivgv4KO0UVohAQ7gxsbs0TsPndj8ZvpTN4d6cLeIZ5NWQzdh
         hCWrTVa3VCg+1HFkb/OZT/ufmzp/s43o1faQAIK0HoU9IC1BlhLWMRv1924XI/odZ1lp
         6azDFyUmxEZclLPvOrBOsn95sazPicP1cseGJInZfvrJKGGtYfJl11nqy/+wh2xiuT0u
         a7119xsTQLdE5nY9TajXJiuP2uk/Kso8sY+eTnIbGvzumz5A6AqTtOxANt4G/Kb4kKW5
         KaJJCWj/z4hX6GflZqhwoBGOyTxnBKO1qR4CVoaUx3JTCd0jthLlL+sKSpUO6daNrIpO
         IptA==
X-Forwarded-Encrypted: i=1; AFNElJ+sMECo96eZX/BDnMy7ZTsWgd4hMgg46mfhn/wmkO4AQpr10lqVwy51AnDwdmHE3FZmZZqQJfgnFB2DGg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwdMgFffwtF17uJSA73feb5U+DcMqLNRFsb9iRk8HQVK1FTXduk
	g5B0lHW77sXi1FGmXZ5v+edu5rGtSQoc2mLSHxD5zqRpJJDj7521K/1TuAt3HQ==
X-Gm-Gg: Acq92OHya5PXq879pzhd4oOPK90ZyjJWV3xzP09teEIHXAsU4BRob0bdImEHrn6RDqm
	+0eOWg1c9NNoF+GJOQGgbCK8cSMWgijakwcYISR9XMAIvg+8WPBw8EhIfArhVut5541WZ5JcbY+
	FQhJeuQ7+LlKJo4EWNdWc+ztRDqnO3oyyFBZD1FGfYRDzgW7lgtNGVRVAP7pmxdfoCPuQYqSAGP
	2SA7q4uchUOkZAWXyjLIyNAEu0fxlG10pbSzWUKyauHOR2sK44FYBTV7g1Gb2S30Ynt7FgrcNpT
	9aPwrPpgavjyRCpEwud2SjDodsyZTr+5P+ahdKG/Xdo/oHVXwMbQs3pvCOzIIRCr+CssRYE1J0s
	I/yuxDdg6ylQKavkrFsOAQ4g9kjpwMF02ubOnQientLtz4yW9FTjPTpzF9zBTGJoKGweJ5grC84
	ImTdXbDpame6Wix6zEaM6Oz5vBbC0S6SWJ15WHhgsKL8gxp9/rRgF0GSEl/g==
X-Received: by 2002:a17:903:1ab0:b0:2b2:4ffc:a7c4 with SMTP id d9443c01a7336-2ba798c0a22mr174893865ad.24.1778402669575;
        Sun, 10 May 2026 01:44:29 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d3ffa0sm70471005ad.25.2026.05.10.01.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 01:44:29 -0700 (PDT)
From: phucduc.bui@gmail.com
To: kuninori.morimoto.gx@renesas.com
Cc: broonie@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	geert+renesas@glider.be,
	krzk+dt@kernel.org,
	lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-sound@vger.kernel.org,
	magnus.damm@gmail.com,
	perex@perex.cz,
	robh@kernel.org,
	tiwai@suse.com,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 10/10] ASoC: renesas: fsi: Add SPU clock control in hw_startup/shutdown
Date: Sun, 10 May 2026 15:43:03 +0700
Message-ID: <20260510084303.122426-11-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260510084303.122426-1-phucduc.bui@gmail.com>
References: <20260510084303.122426-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Enable and disable the SPU clock in fsi_hw_startup() and
fsi_hw_shutdown() to ensure the clock is active while the
driver accesses hardware registers.

Previously, the SPU clock was enabled by the bootloader and
remained active during operation. However, after adding the
SPU clock to the device tree, it is disabled automatically
once the system initialization completes.

As a result, register accesses may occur while the clock is
disabled, which can lead to system hangs. Manage the SPU
clock explicitly in the driver to ensure correct behavior.

Suggested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/renesas/fsi.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
index c3ac8b30f342..5307085c0615 100644
--- a/sound/soc/renesas/fsi.c
+++ b/sound/soc/renesas/fsi.c
@@ -1579,6 +1579,19 @@ static int fsi_hw_startup(struct fsi_priv *fsi,
 			  struct device *dev)
 {
 	u32 data = 0;
+	int ret;
+
+	/* enable spu clock */
+	if (fsi->master->clk_spu) {
+		scoped_guard(spinlock_irqsave, &fsi->master->lock) {
+			if (fsi->master->spu_count == 0) {
+				ret = clk_enable(fsi->master->clk_spu);
+				if (ret < 0)
+					return ret;
+			}
+				fsi->master->spu_count++;
+		}
+	}
 
 	/* clock setting */
 	if (fsi_is_clk_master(fsi))
@@ -1636,6 +1649,12 @@ static int fsi_hw_shutdown(struct fsi_priv *fsi,
 	/* stop master clock */
 	if (fsi_is_clk_master(fsi))
 		return fsi_clk_disable(dev, fsi);
+	if (fsi->master->clk_spu) {
+		scoped_guard(spinlock_irqsave, &fsi->master->lock) {
+			if (--fsi->master->spu_count == 0)
+				clk_disable(fsi->master->clk_spu);
+		}
+	}
 
 	return 0;
 }
-- 
2.43.0

