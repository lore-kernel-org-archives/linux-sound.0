Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A0BB306D3F
	for <linux-sound@vger.kernel.org>; Tue,  7 Jul 2026 18:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783449130; cv=none; b=S9nb+j5hhMgoDZgJ1jeVVQYcqE9dSSbyFIgQZZO4KDBUhHyC8qPB99T+UqC7Gtm18YGRW1SmIdcTN5Ev3Lm8ms21kry/zjiC8WJAoLOUxBtbg7g/PY+L3aHCia62eTjUeMZuetUb3AZeTlOtjtmIBQbIjYw2eumB3wNPouuBBeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783449130; c=relaxed/simple;
	bh=9XHQkl34PtiRvSb3ChZImcvJdGvQt19SQZmM5JYbS+A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cJDg1OF9sryRR5n9vqWhILIhTyIqT1zElXQPk153eTcp9h2ymEhs19/t25WS7awEDFQgwJp1KoAQlZMsQlIxiiF1zZCgk4AqNQHBOrNq59t09f4kVIsNXd3iRTCmsOGZjlrX2/Yq+4d4IPXkYgX7CjjceeZNP4yP+TqcMegQogE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FXgyIsVP; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FXgyIsVP"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2cca0c5799eso24362845ad.0
        for <linux-sound@vger.kernel.org>; Tue, 07 Jul 2026 11:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783449129; x=1784053929; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nl98BK4u9JPRN9mxwdYysSrsI/UxB+SXFXlHLi71pK0=;
        b=FXgyIsVPPG+Bwg8WZh5cDugs9pUhrZhvWj5Ps/eOlF640ACgKLq45RolyOPsGCrBAL
         qiJQJL7UmKQHTyxMaiK0feKd6G/THZoO+yMagMnRTKgenK4D+uGA6uams9+oXPtSSj8l
         4xn7ypv4b95TCT1HpEALOAHQYcHxXDdCZ8sdNqul39NriSxXUe1kyzGCHmsn9xaLZtGE
         62Vs/M4wdCs9cXTSnu9vYcIMDcMlk6z4cuYBGPCf5M0EkTY8pcz8Xplri5MIlgYnn60E
         4NgTTq4acLDKR7IWj6Oz40Zw0c1876C+YsilOa4RrCnT0RqmOZyMi2nW4pD41epB7RsV
         s8Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783449129; x=1784053929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Nl98BK4u9JPRN9mxwdYysSrsI/UxB+SXFXlHLi71pK0=;
        b=XnfjLoKIAYq6IVQOOcnhPOsR4nFgIcNffV0hBm7Q071b328IBx7JcdRpWIi7bY/ygf
         3L9cS98qD2a0nqR6RwX/oW/jZ+/rGOo4dYEhiwtMTYxvR3RmgblvJdNyzjNEaf6TLJPQ
         7S/5XK4befktAsYIJ4EQVwveijkwjsmDU++we3aLrhFNhng5hO6t+bH/fSSfw9ro9DLS
         9jS0X/9lOBK1Jg0IPclTtydru5A6Rec1rNJsVREuDWbEKM0Igm8+gCw3STwrqVHYX3TL
         AE8hhRO9PZVjrEE9zHz5DmT91dNhla7Itiftt69oblyc7Id4pD4XkSHzgJGE9NiJTcuA
         qLVg==
X-Gm-Message-State: AOJu0YzRXTReOlRVoKNkTCkDjF3s4fDHFWqerjS5+AqUiRn/sa0vTqJM
	wcLJWPkgEm/CU8R6tl/CrTwGNRYtWKGU+s3djrF3MVryi5btrC+WBfdN
X-Gm-Gg: AfdE7ckQkvRGR9JiJQbkYHi3Io2/XoOZX6+E//kXk6KRABzEY2mh7yJBBxmig7+galO
	1T8gKEwO7zMn00ukLPpavNghXoeiL7sk9vnOsCt/SIjAag6HTuJxkAr8jvb5OAN22+IM23jTun1
	pFmb69SywBvUr/lv+FlnyeudwwZu0/XSmzJKBlbTlH0pBAz7/JBddjiv22eBOK9SqhZrZ+n+JTX
	V3sgm1SjJv394zQeBYohRoZWFxB4SMeCtfBOp1nb5yWt+Dn+/xs8qouXLArU3vOFerBhcz0pUnM
	hfp+t7B0tJBT8rf0tjxYZ7BLhG+5M/IZL48TgRzIFm+rsP7ee2hf+Gg02I4ih82OLm7KzDhXywQ
	5sQTn0MilMTpHI/bM3ga32HxqhljYKabPjLa8l+JZV5ICE68fWvZU0gjrudl8tZ2hGFp5FkChLh
	f4mAoZXC9eDPfhuwR+WOjCdmIV/CV+mxT3RzEqRhIkL4hL5G4=
X-Received: by 2002:a05:6a20:918e:b0:3bf:6011:550 with SMTP id adf61e73a8af0-3c08ed1f378mr7459544637.24.1783449128528;
        Tue, 07 Jul 2026 11:32:08 -0700 (PDT)
Received: from localhost.localdomain ([2802:8010:610c:8c01:940:5638:6c2d:bc2c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174ae6cd9sm11502366eec.31.2026.07.07.11.32.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 11:32:08 -0700 (PDT)
From: Agustin Luzardo <agustinluzardo09@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Agustin Luzardo <agustinluzardo09@gmail.com>
Subject: [PATCH] ALSA: usb-audio: Do not drop per-channel feature controls marked get_cur_broken
Date: Tue,  7 Jul 2026 15:31:33 -0300
Message-ID: <20260707183133.8113-1-agustinluzardo09@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260705184227.113588-1-agustinluzardo09@gmail.com>
References: <20260705184227.113588-1-agustinluzardo09@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a per-channel Feature Unit control (e.g. a stereo PCM Playback
Volume control) hits the sticky-mixer check during get_min_max_with_quirks(),
and the device carries QUIRK_FLAG_MIXER_GET_CUR_BROKEN, the sticky
check marks the control as cval->get_cur_broken and returns -ENXIO
instead of disabling it outright.

However, __build_feature_ctl() does not know about this and treats
any negative return other than -EAGAIN as fatal, discarding the
kcontrol entirely:

	if ((ret < 0 && ret != -EAGAIN) || cval->max <= cval->min) {
		...
		snd_ctl_free_one(kctl);
		return;
	}

For a stereo device where only some channels trip the sticky check,
this silently drops the per-channel (stereo) control while the
master-only control (built separately, without going through the
same channel-specific GET_CUR negotiation) survives. The result is
that the user is left with a single mono/master volume control
instead of the independent per-channel controls the device actually
supports, with no visible error (usb_audio_dbg is typically compiled
out).

This was observed on a Weltrend Semiconductor 040b:0897 device (sold
as the Redragon H510-PRO Wireless headset), which reports a genuine
stereo Feature Unit (bNrChannels = 2, bmaControls with Volume set for
both channels) but ends up exposing only a single-channel "PCM
Playback Volume" control once QUIRK_FLAG_MIXER_GET_CUR_BROKEN is
applied for that device.

Skip the discard when the control was already marked get_cur_broken,
as long as a sane range was otherwise established.

Signed-off-by: Agustin Luzardo <agustinluzardo09@gmail.com>
---
 sound/usb/mixer.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index 0000000..0000000 100644
--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -1970,8 +1970,10 @@ static void __build_feature_ctl(struct usb_mixer_interface *mixer,
 	/* get min/max values */
 	ret = get_min_max_with_quirks(cval, 0, kctl);
 
-	/* skip a bogus volume range */
-	if ((ret < 0 && ret != -EAGAIN) || cval->max <= cval->min) {
+	/* skip a bogus volume range, unless the sticky check already
+	 * marked this control as usable via the driver's cached value
+	 * (QUIRK_FLAG_MIXER_GET_CUR_BROKEN) */
+	if ((ret < 0 && ret != -EAGAIN && !cval->get_cur_broken) ||
+	    cval->max <= cval->min) {
 		usb_audio_dbg(mixer->chip,
 			      "[%d] FU [%s] skipped due to invalid volume\n",
 			      cval->head.id, kctl->id.name);
-- 
2.46.1
