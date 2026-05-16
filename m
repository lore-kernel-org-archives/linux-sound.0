Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 206B12DF3D1
	for <linux-sound@vger.kernel.org>; Sat, 16 May 2026 14:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778940774; cv=none; b=DQu8E6TRU8xqQ+dIRuoLEYsqlE68kyFnyE6OvD9iRfM2vafy49TWyBqVWkH3W96/jAZxfisB1zh0mCz5E4tdwFQVLblnup+cwJRYLCPvuCsmubjiLa3GSGF5ogaAF5SbRs4N6+NEYrfchX1HHiV1wppPZ9qDK+VijMjBSQ5qd7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778940774; c=relaxed/simple;
	bh=hcsLGAxhbjMjZpoKgFXTz4w/iPdvb0QZuDEWfGI+mQ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FTIf/26Zc2JwR41DIYkUM2+zQy1OYt/yoT4fXHk7vmNIvNgIIottU5aLeO83H0k3l28mbbDGc3Ewp2nb37vnPbpT4V+yFGN56qg10NlU42UZQQauQztle3ok4vUQ888cKcUfnsblEZbBLqc4nKompbdjgFPK7o88kHV9049wfho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DAR1cO6L; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DAR1cO6L"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-488ab2db91aso7562215e9.3
        for <linux-sound@vger.kernel.org>; Sat, 16 May 2026 07:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778940771; x=1779545571; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZgL3UGd7VDVqFQn5084wXxaSRfAbGciwg16JHH7bC3U=;
        b=DAR1cO6LIfPyYqY3l9guyrDV90DAdbT6BjTQqmlpp5ArDJIyklMRie3gkbld1eFMp2
         7TXm9Xz4+4AMLg4o5EkfTLpb5hGXy7aBEfVgeYshGX4v7JD0+YSpBfROR/22NPJqW2rc
         50mLrUiafj0eGeRme/lU+tEVB+M4x3E+dnM1OeavCrjCOVH5DzJHYmdGre0aJir+WLWj
         B8thL6nVRbvP7S2B8Jz363O6TizdQE6vRX4JqVxheHVrtqko0OWoBt3L0S89VmhAgFPu
         ctRANmapxKyrrlvRNjBEpwqqATvJbE8Rm3AvmeNBgxZNGsgJTZ99WIr7PiJVG6pYyy/8
         GAww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778940771; x=1779545571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZgL3UGd7VDVqFQn5084wXxaSRfAbGciwg16JHH7bC3U=;
        b=sG8Cf6BQdz3YgWTJaBVYViuI3J0xA25ydrzbCfb58VK6Xe9q1+spXx5af7fdCum5F1
         RgttPZTXkU9QI2+JgXGkSlk51A4Q59wE5Yn7EGX+ZUYvms/nxf8a8IvzZKirnXXUHtPZ
         bpG/ejHLFlprCulKfj2/vReGLJsunzVc7vPaZ6FZotUprl2NCnuPmgBJAhyLMge/fs4H
         ySICIZyFZ3IqtCn+TgMy0brblF9UzauDAlKTSI1OeyyFIG0uJ7QcsKCr4zcZ2aBUFMOp
         wQm2PyR+lVD9ilGV0PzEdzBvlhNTu2W5UnuLfyEaDNJUTPBWKaBTuphddKOA3OdGM48+
         3brw==
X-Forwarded-Encrypted: i=1; AFNElJ8UT+iRwa7MLEiV4VIrwcIkSfXDttULMoJZ/UQcGjxlqQz1Pa3sKAT5L6fXfUpAvxK2i9dZuk/rCqrTdQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxSKAT8nUYPCUmpILPDfQBZWVjv0MSLS45HE/t6RrBkIZT+enw1
	AeG2/fYTdoG0v+Er6M/HQvlj+8e/LrEjdU71sc9PRLD79dRkFymu4UM=
X-Gm-Gg: Acq92OHQg9eYuPjYD+02nf5dI/I9PYBQAheBQt2pgt26l0At1jPz/jIPSnWdbqGDNKt
	AFuNESUsnfbr941h+wi8hTB0+eDzvr9IIZR3XIFixjlh0F3uLHhmOix4WeOPN49l9xyuFqi4fsT
	LC26IiAmgSRwimnfXcoNi25JczDmls7PTB03ahB6zaXVhAlpQ8T3PtZq56VIaafK149buXdup+V
	Ye5qH9j6P3UMzkVUMQtNqWoAVWiIi7axCXhx/i1HV3ogkSZIwqsOpFCWVQIXKaG4RxQg04HzwQU
	ck/MDerbZzimgKQgOi1ukDulMw4I/vKctxTpXoQuZjEZ3oKd9o16at3QJkD4X9sPzDszbLmqLpd
	9Q6SNNkA7mdkqyHDZ/NLzilkI4Fz6dbhJHgdJHdeRzSbPfGD57GwNDPFjBr4sgAogWzcSkfdEo+
	qaA5Mg5YdZs9HDdtVeDiSxhmgTl9e6+cGZmer1HoQUgPlzcIYJ0ImTk5Vh9IYCI897WP6rFVEmt
	BDx4WS4DIAH2iyV9wt5kaMj3Q==
X-Received: by 2002:a05:600c:4fc9:b0:48f:d612:3c40 with SMTP id 5b1f17b1804b1-48fe60e47bfmr105695115e9.7.1778940771277;
        Sat, 16 May 2026 07:12:51 -0700 (PDT)
Received: from localhost.localdomain ([151.37.109.153])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe4c88e5asm136799475e9.6.2026.05.16.07.12.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 16 May 2026 07:12:50 -0700 (PDT)
From: Francesco Saverio Pavone <pavone.lawyer@gmail.com>
To: tiwai@suse.de
Cc: perex@perex.cz,
	broonie@kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND] ALSA: pcm_drm_eld: rate-limit ELD parsing errors
Date: Sat, 16 May 2026 16:12:44 +0200
Message-ID: <20260516141244.21801-1-pavone.lawyer@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <87zf1zy22e.wl-tiwai@suse.de>
References: <87zf1zy22e.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Mirror of Mark Brown's ASoC: hdac_hdmi rate-limit patch (commit
[lkml.kernel.org/lkml/2025/6/13/1380]) for the generic snd_parse_eld()
helper used by ASoC hdmi-codec.

When a HDMI sink is disconnected (e.g. a board with two HDMI outputs and
only one cable), userspace audio servers like PipeWire keep probing the
disconnected card and trigger:

    HDMI: Unknown ELD version 0

at every probe — easily 30+ messages per burst on rk3588. The same
applies to malformed ELD (MNL out of range). Both conditions are
expected when no sink is attached; rate-limit the dev_info() so the
kernel ring buffer does not fill up.

Signed-off-by: Francesco Saverio Pavone <pavone.lawyer@gmail.com>
---
 sound/core/pcm_drm_eld.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/core/pcm_drm_eld.c b/sound/core/pcm_drm_eld.c
index cb2eebaac85f..1941ee520063 100644
--- a/sound/core/pcm_drm_eld.c
+++ b/sound/core/pcm_drm_eld.c
@@ -334,7 +334,7 @@ int snd_parse_eld(struct device *dev, struct snd_parsed_hdmi_eld *e,
 	e->eld_ver = GRAB_BITS(buf, 0, 3, 5);
 	if (e->eld_ver != ELD_VER_CEA_861D &&
 	    e->eld_ver != ELD_VER_PARTIAL) {
-		dev_info(dev, "HDMI: Unknown ELD version %d\n", e->eld_ver);
+		dev_info_ratelimited(dev, "HDMI: Unknown ELD version %d\n", e->eld_ver);
 		goto out_fail;
 	}
 
@@ -357,7 +357,7 @@ int snd_parse_eld(struct device *dev, struct snd_parsed_hdmi_eld *e,
 	e->product_id	  = get_unaligned_le16(buf + 18);
 
 	if (mnl > ELD_MAX_MNL) {
-		dev_info(dev, "HDMI: MNL is reserved value %d\n", mnl);
+		dev_info_ratelimited(dev, "HDMI: MNL is reserved value %d\n", mnl);
 		goto out_fail;
 	} else if (ELD_FIXED_BYTES + mnl > size) {
 		dev_info(dev, "HDMI: out of range MNL %d\n", mnl);
-- 
2.54.0

