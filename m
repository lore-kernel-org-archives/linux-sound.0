Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F201E7660
	for <linux-sound@vger.kernel.org>; Wed, 11 Mar 2026 20:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773259234; cv=none; b=akbeKF4lHIRHqHSMHz9ZLs9wDRPwT3tjW12nM1jqzztU0C1reK4E1drrKnRuWdpo2qo+GMfJvwh/9iCkxZGAUt8OJx8cU9SFck3+f+2/KEwjcCdL/4RyrRfgOe/bGcr61B9UOSbst3qEeVbPuDvnaRLitoIQEeSgzMlnOcRRLII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773259234; c=relaxed/simple;
	bh=ACv21EToIQ3NVCRczaI+PEDm1EcsdyjZXJrYowQrVzM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dM9801NBiF+lqVQnCrW34KbYtJlHIefgphI8fzH/GVcFHeKqMlMce9PjiZkLJO2sqRPQd/WjGdAKb55HeWzYXfuljoAR5WfGqxnl6mHkXF5TVOoNs/NOHFEkyX9wchqsWXRPszS3aSQnRZoX1L8AiT6qmOcGUIiL0QXFfIhh4Ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jdc+2kVc; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jdc+2kVc"
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-56a857578a8so139665e0c.3
        for <linux-sound@vger.kernel.org>; Wed, 11 Mar 2026 13:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773259232; x=1773864032; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i1r3InFvaXQHSB4+wPzQax9N8XbBVVdha9jMwVwxtnQ=;
        b=Jdc+2kVc2FcxAof7lfdF5EEVWX7CzYGyvQFH/tXsXKLgGWq9GZjA9/V5Nq94vLipXe
         doD5yqF9wFJz0oJKSL/oOAcRljLNlu5wf4gGNdJZPabXHHx+8pyqJ8i5iutu7VVgOAXN
         J9BjnzmmEgc8efDG7ziG0Ohq+d3/ZRQHDBIWMlYLgI3z2l2nWHY5IHRPxDD26PxXKp0t
         OpcDeicEAVp+zHBPbPtnJ0dbqRAPFOXOmbak4Nj8nvpwlA24tWOdwRFxlgdiGlttwD1p
         O4TTjYzjnNBmAXB7XsC4HNvHcZrb596FTv87rUtaW+FbPZbd19ipZC2XgDqFVm4XBU8x
         7Pwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773259232; x=1773864032;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i1r3InFvaXQHSB4+wPzQax9N8XbBVVdha9jMwVwxtnQ=;
        b=mPEBd+thUcWIdwKs0vjrOTJ7sZm+S5yydWJz5pUd1XRqy3oXQZS6FJS2HrxEFon2cK
         BRKb9TrUXqq7Bh87cA95DnJxloVBV7tiUCVgy0+sPSIvZKW4px6FJIbLMCecQO3D5anM
         55ms4QDyATAzGT2cxD98oXTuP+J2DYGlIwbZvINan0y2t2/03tlpAVM2YjAdDDVGOt8L
         jlOCqjzYnoykYjXTrNaS6L92walNSQ0ELKGVSc00xzRp0zKCdWREtxvi/wxT1fTd/Z03
         N9Kw8R6Tj/W7Mj9TiU2G1xkSBFkUuhpsao6IkLrS/lz9lvQMY9COG6LosA32c5J00Gdf
         wZ2A==
X-Gm-Message-State: AOJu0Yz3Q7zM1dPSmKpXYCUqd13AVbMcS4pV9IANCN8JG9mGMZfn7Ity
	BrHwsd+nt7orQFfBQu3CMFynDPGDCHtwdXEfujabvtvG28F4sfB7bv71
X-Gm-Gg: ATEYQzziYxLz3EsyLk+5DZoBdmGretAp0RgktFjWeqYbqJQ4qvgjCNIG10jEvuScjIo
	qfJPt7N9ZVd3Mrr5eX1IzrBPjPE6CB24XHTpXzlyY/Muwf2tcE4q+iLEs8DX7Nhtbde2KgG+VcL
	NjUMyYZZU+7eeruy1cF0/zn0eAaZUM8C4nJoQ0Si6KdWkS7BXwevaSk/oycio5B2ukaaxVsyi8A
	6qtPCfa3aq/iXqQVgw8BTdmqgngSn8VppnGfYhH4wgqoHJPziizBBezr99vmz+SjtTrk2uv73vS
	80Y8bhCysd8Bp98tnTRg4AY6ZTxJUnI/z8L5ZH345Ec9yGVSDOF62p9VJnTfNxV14zc1l+NVK2m
	7EBVM9Y0AVxiMSNUR1x0V7rQby/k//mr7Hrj9GibcXNP9HCt5ebcPjudGKUkuMOWPWQ/obw7QwD
	oDblgJ8xQSAEme344ysq909XPnX4QDxNZwW+UGdXNSr16J75atIvCYozev1V+B6nFJ6+3onEpUt
	8DxMRg=
X-Received: by 2002:a05:6122:508:b0:55b:9c3f:55f with SMTP id 71dfb90a1353d-56b476778eamr1273567e0c.18.1773259231967;
        Wed, 11 Mar 2026 13:00:31 -0700 (PDT)
Received: from ortodist (177-4-162-212.user3p.v-tal.net.br. [177.4.162.212])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56b4634177esm1534327e0c.6.2026.03.11.13.00.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 13:00:31 -0700 (PDT)
From: =?UTF-8?q?C=C3=A1ssio=20Gabriel?= <cassiogabrielcontato@gmail.com>
To: tiwai@suse.com,
	perex@perex.cz,
	broonie@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-sound@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?C=C3=A1ssio=20Gabriel?= <cassiogabrielcontato@gmail.com>
Subject: [PATCH] ALSA: usb-audio: map UAC3 front wide channels in convert_chmap_v3()
Date: Wed, 11 Mar 2026 17:00:10 -0300
Message-ID: <20260311200010.103710-1-cassiogabrielcontato@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

convert_chmap_v3() translates UAC3 channel relationship values into
ALSA channel-map positions.

UAC3_CH_FRONT_WIDE_LEFT and UAC3_CH_FRONT_WIDE_RIGHT currently fall
back to SNDRV_CHMAP_UNKNOWN, although ALSA already provides matching
channel-map positions via SNDRV_CHMAP_FLW and SNDRV_CHMAP_FRW.

Map these two UAC3 positions to their ALSA equivalents and update the
comment to clarify that unsupported UAC3 channel relationships remain
reported as SNDRV_CHMAP_UNKNOWN.

No functional change for other channel relationships.

Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/usb/stream.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/usb/stream.c b/sound/usb/stream.c
index d38c39e28f38..2532bf97e05e 100644
--- a/sound/usb/stream.c
+++ b/sound/usb/stream.c
@@ -366,6 +366,8 @@ snd_pcm_chmap_elem *convert_chmap_v3(struct uac3_cluster_header_descriptor
 			/*
 			 * TODO: this conversion is not complete, update it
 			 * after adding UAC3 values to asound.h
+			 * NOTE: not all UAC3 channel relationship have a
+			 * direct ALSA chmap equivalent.
 			 */
 			switch (is->bChRelationship) {
 			case UAC3_CH_MONO:
@@ -390,6 +392,12 @@ snd_pcm_chmap_elem *convert_chmap_v3(struct uac3_cluster_header_descriptor
 			case UAC3_CH_FRONT_RIGHT_OF_CENTER:
 				map = SNDRV_CHMAP_FRC;
 				break;
+			case UAC3_CH_FRONT_WIDE_LEFT:
+				map = SNDRV_CHMAP_FLW;
+				break;
+			case UAC3_CH_FRONT_WIDE_RIGHT:
+				map = SNDRV_CHMAP_FRW;
+				break;
 			case UAC3_CH_SIDE_LEFT:
 				map = SNDRV_CHMAP_SL;
 				break;
-- 
2.53.0

