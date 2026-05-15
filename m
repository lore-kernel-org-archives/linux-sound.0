Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70D1830567B
	for <linux-sound@vger.kernel.org>; Fri, 15 May 2026 15:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778860737; cv=none; b=Q5WLEsMpqynUPPJhILcQAe48B1TUMBR510U/RHbfJ/DIzyKWr3wSZyihuVVvCnHv1x+geuj9zDrkaFauXjLzrKvehL5YhXtQuqtVS3B68yPKspTmlqzSz9DSyvCf2QKhX82ClaKEr8DHDMWFrAgUvW5CvXfLM6fAt3DBvBwV/Y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778860737; c=relaxed/simple;
	bh=u8Tav0cqylJ+pHi9DFxQizVTA6tZQVOAI/k51IQzjJA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MwXuWu3llArldoXpH5PrbZnotwn/z1EcI2jRsY1gEaWtEs3+Tj+BtAjm3NCwLIcJ1OBTsRhbrgC81ax5syeBrG2wgREYHWG/aEt5APmbE7lLKi3N/qx2u4oVsKEsqkJg8qBA+DqLBwtJpI/6oymvgs5RTsziyWGOQkLQWQ2Wwno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CNjhBMZg; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CNjhBMZg"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-453903ee4adso8056598f8f.3
        for <linux-sound@vger.kernel.org>; Fri, 15 May 2026 08:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778860735; x=1779465535; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0YtVRaSVOC+Ffu5CtciNUvlhL8M4bYxMfrEUatOU/IY=;
        b=CNjhBMZgfi9mz2J/YEP6yaCC9xkyzmtAlE6Q3Og7LwLcdcmcAsLr/CF3aljPHxjEJ+
         oFLdRjTtHuOrLLVboDzv8/Nrotwyz1v73JuUiOB90cepm8zCghD1DB5t0z3kGLWtEjTV
         ihBrGV2M6WnkQIzfA1liLPqxRAMAHlulrXoFwJxPZuuA0IejmM91Ik1/EBibNrUFTUKM
         JT/EO8rDe2GGIsNXHHSXrJp2jujPAzgYWDp8UvZ86Kc3UtXBd3AlK/v/Za2hVKpFwpd+
         9ghhwvle8TdxXHEnOM9LfUON3te117BltNujSlqs5/JJMVGcImJysgSDAPyC5sLg5g+b
         1vNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778860735; x=1779465535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0YtVRaSVOC+Ffu5CtciNUvlhL8M4bYxMfrEUatOU/IY=;
        b=IrBAb/z4s5KHv6tae3j/OHjSzJdtc5Nk0D8Gr0/bCxWRsGrVn7mqWZVKBlujzhKYIT
         mwHHnm7iK+udkKg/Tn4IeDd040/bubbKiU8/0cV9RvSsVWwC1EUaj+tdVI1ZvIAcTOnd
         hf58mb6hFTyrMXfxWdrO3rFfRWiMm/x8kqTD9916dzA114hQFtNHUSOpeIiaX5bswmmg
         bdahfS8XorSaCs5Rc+OH8VrFoCRvx75cw8o0nrBsPIzY4rAKXewmO0vdVC69v7U0kiHm
         u/ByWg4AB91GAcOi+/XduH/26pB/xziQxI3UCSG68S8U882VapSR79n0Lo2S1cB9++HC
         78Gg==
X-Forwarded-Encrypted: i=1; AFNElJ+RCyK7nzwSBO6vmU+rutTOiGK5tCZkLpDhL2v+0g2ZfVJhQQPv3/mbxi7lAzvpFd8TPOVw1m+uRiCUgQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzK1o0fDeUD961/5R8sOPjis6LdeERnMNnGorvz22agNLfswO64
	MG/vhbAGnaoNL9ao7c5yWi+OOVNAxccIFZ2wie9qLO9PInCw03Ns8fGuelZXTgU=
X-Gm-Gg: Acq92OELEu9pQR1W8c/JmbwzKGH3D6lP1bTHZebp7VyglKoo/mc0Dk/TIdXsJEkwj2+
	BwGzaeg8AHPyJ7Xw9T7KNFq0y0IHg0M6ovWVeeBG0MgiL1KXINrGnM4Xt6nuvCRtqNvBrMgOM5Y
	0Y/G4ztwp7KEQe+YFx5unPzlGKdk23rmvvjvH5XYLenWfEco7Whngbeu9IryM2eO34Z1yKtyR0p
	s4RncCM3TExEnfQC1/Qx32Clf0ehTIbn5ItG+htKl6ThYDvQpY6FtlGiUEOL8SrDjtcZZ/cx5bn
	u6MK1cPZVrJoTeAFC0QdEJjPZmetcafDM1hWWPgxhqk9dN+ac+TzSy3L4qE1V8BXxz16jYfHm19
	ozPdlZ3UmcCnntl1Zj0AVzMeMtKB+ZLu3tioRj2Xn5gy4uRaMrRhckldbXKVKSPH1icyof3vr9A
	bAd1TnVdo/eYiYX7IEc2oBclkyoSCjpsQOrP7MTiYP+HkTNCEouOnXddihDFOpuViZinT/KWtNk
	GNl9i54sitKs7w=
X-Received: by 2002:a5d:5f53:0:b0:43d:73de:abd2 with SMTP id ffacd0b85a97d-45e5c58728cmr6687662f8f.26.1778860734696;
        Fri, 15 May 2026 08:58:54 -0700 (PDT)
Received: from localhost.localdomain ([151.37.230.118])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0a19c2dsm15559431f8f.21.2026.05.15.08.58.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 15 May 2026 08:58:54 -0700 (PDT)
From: Sav <pavone.lawyer@gmail.com>
To: tiwai@suse.de,
	perex@perex.cz
Cc: broonie@kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sav <62543096+dongioia@users.noreply.github.com>
Subject: [PATCH] ALSA: pcm_drm_eld: rate-limit ELD parsing errors
Date: Fri, 15 May 2026 17:58:36 +0200
Message-ID: <20260515155836.58993-1-pavone.lawyer@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <MSG-ID-Takashi>
References: <MSG-ID-Takashi>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sav <62543096+dongioia@users.noreply.github.com>

snd_parse_eld() is the generic helper used by ASoC hdmi-codec, equivalent
to the hdac_hdmi parse path Mark Brown rate-limited in
lkml.kernel.org/lkml/2025/6/13/1380. The same spam shows up here for the
same reason.

When a HDMI sink is not connected (for example a board with two HDMI
outputs and a cable in only one of them), userspace audio servers like
PipeWire keep opening the empty card. snd_parse_eld() then logs

    HDMI: Unknown ELD version 0

on every retry. On rk3588 that easily produces 30+ messages per burst.
A malformed ELD (MNL out of range) hits the same code path. Neither is
worth a separate dev_info() per occurrence; switch both to
dev_info_ratelimited().

Signed-off-by: Sav <62543096+dongioia@users.noreply.github.com>
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

