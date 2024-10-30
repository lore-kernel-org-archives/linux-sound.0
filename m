Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0141715D5D9
	for <linux-sound@vger.kernel.org>; Wed, 30 Oct 2024 17:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730308711; cv=none; b=PM1fLUgxCyhQsRRXak0IvGtSr73J2bU3eKiW4vzSOChGHsQ+ZahNwBosQoRmRrbqIk1SfZ1E2L8f2uQaRdmltlDZVe58QS2TfcSAUz0LuioWD3U1Z5DUSETCTxbs/16WowuJjOmOg8zQfM1B/GmpQ93tuxiuB5Q0RVxcgU7bEew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730308711; c=relaxed/simple;
	bh=fzeswAr05kka4MXKTkZXL77xtwOFwy7h5ybCY6jL8ao=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JdUVOvvY8RZu6dlo88/W33eTF2UwY7fUAT/xgS6nibvhvRuLWQgUScLZMRMlcD4R+QBcWwfk/uqLUj5Mf4hwS6c2PnPpZda4wVBT6GPjIl9AOd70jPiJ+3UaHUJ5xHHOvfASwwV1qH2gzuGF0MKMWDoBeaVdqNlVkBjusbzqYDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ezg50ooj; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ezg50ooj"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a86e9db75b9so3597266b.1
        for <linux-sound@vger.kernel.org>; Wed, 30 Oct 2024 10:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730308707; x=1730913507; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sheah98uHn3+b0PH3NwvbSD04tYplI9wm4aVxPQ342E=;
        b=Ezg50oojnN5PlTYwCjZDA1tO6hPgxK0PhQJ2sRIROGpEtcSFb2bXgPJWxcMMFGoQPA
         or5d+wzqvzUT6cxu9YKSa+E3qaZASbhHZ6zGGngGQbASzToWrPJwDdgf/vx1FqImEMpc
         cqOXELaqNXBNsNA7DdHyLc5rfS4cDU9YYJYsm4g2iR60HRLZ2aWnk6DpU9PVJiZOS7N/
         EHIfKphH2V8ww4uDw7VNE9QYmbpwtzBHSaXcEdieHgHkR5gsZPA+dRAeGkSN/NoibKlA
         X2OBrGY9T3S60ESLuMEeZlWRuOvvWOZw1xZh1tr0o4TZSyWkrEYc4d1mrkxkvUkFbQqa
         cVeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730308707; x=1730913507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sheah98uHn3+b0PH3NwvbSD04tYplI9wm4aVxPQ342E=;
        b=e0tWKZvPS+jrvgscOMAhpTxQJJxH2uz+BWOQpRYFn8zyPLvPIn1oBgASk5XXC4eoS2
         X8fFiZlfTt6XMvww8Mm0dfvGVnzJFQ5LI0gAzp4ngHiL/Pv6jK02GnNuGwU4lFuPFnMQ
         5H1DglsR76UW2Pp/Pd6HqnIJn/S+ekrPFHmulNUawKNBo6OerIE/04VAkIzMLCML0nde
         ZBw47kj+E14e9ftiuFfI1rzzzh+M5T2u2eqc2uImWi8INSZxBH/zPMp2/d8ellIO8PML
         xiu+GEW8P7T+aAzh4QTG7dlPb9GfmMQfjDd8KvwRS0KBjtLTx2I9adt75fvnk3Y9sMZo
         IFlw==
X-Gm-Message-State: AOJu0YzXCOGX+PT4Y5IJPjWQBoLQQJssNbtVZHP8TDMa0RuzP9V6zgbm
	kSmz7VJLuVB2+5kp5ZtNNGqxMzMcrgQCcv7emiuvnTCbxXuj6ad9
X-Google-Smtp-Source: AGHT+IFFIiuohSyoc4fU2CCDpRj2I0TzSEEripY5LBDbSt/nglfBYlXtzPzFQ9zr6G3qpfaJ7q0eNQ==
X-Received: by 2002:a17:906:6a1d:b0:a99:f91e:4abb with SMTP id a640c23a62f3a-a9e509390fbmr20579066b.27.1730308707061;
        Wed, 30 Oct 2024 10:18:27 -0700 (PDT)
Received: from yaro.. (adlk52.neoplus.adsl.tpnet.pl. [79.185.14.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9e214152adsm207582866b.92.2024.10.30.10.18.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 10:18:26 -0700 (PDT)
From: =?UTF-8?q?Jaros=C5=82aw=20Janik?= <jaroslaw.janik@gmail.com>
To: Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	=?UTF-8?q?Jaros=C5=82aw=20Janik?= <jaroslaw.janik@gmail.com>
Subject: [PATCH 2/2] Revert "ALSA: hda/generic: Add a helper to mute speakers at suspend/shutdown"
Date: Wed, 30 Oct 2024 18:18:13 +0100
Message-Id: <20241030171813.18941-3-jaroslaw.janik@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241030171813.18941-1-jaroslaw.janik@gmail.com>
References: <20241030171813.18941-1-jaroslaw.janik@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This reverts commit 6cd23b26b348fa52c88e1adf9c0e48d68e13f95e.

snd_hda_gen_shutup_speakers() no longer has users in the kernel; revert
a commit that introduced it then.

Signed-off-by: Jarosław Janik <jaroslaw.janik@gmail.com>
---
 sound/pci/hda/hda_generic.c | 63 -------------------------------------
 sound/pci/hda/hda_generic.h |  1 -
 2 files changed, 64 deletions(-)

diff --git a/sound/pci/hda/hda_generic.c b/sound/pci/hda/hda_generic.c
index b34d84fedcc8..e4accb70ecf4 100644
--- a/sound/pci/hda/hda_generic.c
+++ b/sound/pci/hda/hda_generic.c
@@ -4955,69 +4955,6 @@ void snd_hda_gen_stream_pm(struct hda_codec *codec, hda_nid_t nid, bool on)
 }
 EXPORT_SYMBOL_GPL(snd_hda_gen_stream_pm);
 
-/* forcibly mute the speaker output without caching; return true if updated */
-static bool force_mute_output_path(struct hda_codec *codec, hda_nid_t nid)
-{
-	if (!nid)
-		return false;
-	if (!nid_has_mute(codec, nid, HDA_OUTPUT))
-		return false; /* no mute, skip */
-	if (snd_hda_codec_amp_read(codec, nid, 0, HDA_OUTPUT, 0) &
-	    snd_hda_codec_amp_read(codec, nid, 1, HDA_OUTPUT, 0) &
-	    HDA_AMP_MUTE)
-		return false; /* both channels already muted, skip */
-
-	/* direct amp update without caching */
-	snd_hda_codec_write(codec, nid, 0, AC_VERB_SET_AMP_GAIN_MUTE,
-			    AC_AMP_SET_OUTPUT | AC_AMP_SET_LEFT |
-			    AC_AMP_SET_RIGHT | HDA_AMP_MUTE);
-	return true;
-}
-
-/**
- * snd_hda_gen_shutup_speakers - Forcibly mute the speaker outputs
- * @codec: the HDA codec
- *
- * Forcibly mute the speaker outputs, to be called at suspend or shutdown.
- *
- * The mute state done by this function isn't cached, hence the original state
- * will be restored at resume.
- *
- * Return true if the mute state has been changed.
- */
-bool snd_hda_gen_shutup_speakers(struct hda_codec *codec)
-{
-	struct hda_gen_spec *spec = codec->spec;
-	const int *paths;
-	const struct nid_path *path;
-	int i, p, num_paths;
-	bool updated = false;
-
-	/* if already powered off, do nothing */
-	if (!snd_hdac_is_power_on(&codec->core))
-		return false;
-
-	if (spec->autocfg.line_out_type == AUTO_PIN_SPEAKER_OUT) {
-		paths = spec->out_paths;
-		num_paths = spec->autocfg.line_outs;
-	} else {
-		paths = spec->speaker_paths;
-		num_paths = spec->autocfg.speaker_outs;
-	}
-
-	for (i = 0; i < num_paths; i++) {
-		path = snd_hda_get_path_from_idx(codec, paths[i]);
-		if (!path)
-			continue;
-		for (p = 0; p < path->depth; p++)
-			if (force_mute_output_path(codec, path->path[p]))
-				updated = true;
-	}
-
-	return updated;
-}
-EXPORT_SYMBOL_GPL(snd_hda_gen_shutup_speakers);
-
 /**
  * snd_hda_gen_parse_auto_config - Parse the given BIOS configuration and
  * set up the hda_gen_spec
diff --git a/sound/pci/hda/hda_generic.h b/sound/pci/hda/hda_generic.h
index 9612afaa61c2..9201c852173f 100644
--- a/sound/pci/hda/hda_generic.h
+++ b/sound/pci/hda/hda_generic.h
@@ -352,6 +352,5 @@ int snd_hda_gen_add_mute_led_cdev(struct hda_codec *codec,
 int snd_hda_gen_add_micmute_led_cdev(struct hda_codec *codec,
 				     int (*callback)(struct led_classdev *,
 						     enum led_brightness));
-bool snd_hda_gen_shutup_speakers(struct hda_codec *codec);
 
 #endif /* __SOUND_HDA_GENERIC_H */
-- 
2.39.5

