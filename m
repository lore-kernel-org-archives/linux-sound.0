Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B1DF2F0C48
	for <linux-sound@vger.kernel.org>; Fri, 16 Oct 2026 07:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792135901; cv=none; b=Bh/Rn+xuIsDF21HDSFuffwjYDsanyGHz6Pxj3nCp2nBiPkEsQHDGozGd0peA5CDw+xMb0hOWmLQJnl/DTbb1OYXXh40cjLq6WN2thiIZZ6HsOYTlRom3ruwJjYetzodH9NnE15nRQmJNN90ye6N1Zs2IMbf3AOLNS7KcDeIQrJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792135901; c=relaxed/simple;
	bh=/76IJe02EdXM4mdz/9pDPdO7V1TCzMbXefzd6AdsII8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PAaJ+eaP9leOX8QDzJ2AYTBL5Ba2XK0th03aNDL1yMJQu57nnJFdha8N/shkUcuBz83B2BEN/HR5Hg9FjsDYEL1cAXElXPZazTQz5RyyqGNTZqGxjmfdyyuMrpMap2kNHcEc/XoNfHHa4s8Q/ZC4vd/qaiUzCkwgcmoNFH0HFok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s8+91vm+; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s8+91vm+"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c40f29667e6so23951566b.0
        for <linux-sound@vger.kernel.org>; Fri, 16 Oct 2026 00:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792135898; x=1792740698; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4bBzj2wx4cE3EAIQqEi5tliZLOvfzRRscarW3KDFVWU=;
        b=s8+91vm+tbAuekIZwjNm7MyNgSmo+tczz4GjzsnyEZkRkOcF5KjtlFX1Y0O9jmC2Mp
         uqoA5Wylbbh+BLnOF/6U9WC42qL9qILJb/sr/a644xUeSMvvB9iXx0nbRyP/VyOhuyoz
         MPC46sEuVdqSKF9DC2cCesakLxYx9y+eFqH1FAjYel2VTFiGEu9ywFfHlWbA9jdiKgqE
         LEiKhIhSgKMqih6xpdSmzoG8L0Dq8bf3gD14yscUuglEhTjn+1x4Jnz+DXamWtILvQLy
         HDyRZRmLtaTVnxXxD8cy8cLrluYPkEC5mWldTyNFDi1l6r32WpixAr45LocZnGWjRC2Q
         P4fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792135898; x=1792740698;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4bBzj2wx4cE3EAIQqEi5tliZLOvfzRRscarW3KDFVWU=;
        b=V3s06rD0DIxWeM+oGf+RObgWK48YdDvLcP4dFEBLPv54b09rVIHD9FK9HUDFrDQqb5
         8rORJ4ppAKK31lv0tiOX7cjTUtBWq2TBccPMatLmF+SA+CsqyCpaxf/eBIFRrhAlLX5M
         fSnjjYS86H16DuaDxGQS+UNsYPBm+cwAytVJE59SMgK3dfEJXNy9vi3Me/jWZXK6Db4f
         bTv/aQtvRGfFJZ5SPznmimKQy8+Ois/kE5YD5G47WNPUrKbFoYPARmDSxUCmPpUWI7Eq
         4YnAXjnBOJFHGsbAsUdpPBCRKJJGUqzAWLWoRnWjRrMkxmMDhot6Qpe2jhx7vk6gcnJj
         JP3w==
X-Forwarded-Encrypted: i=1; AKwUvBzZVsJ0r57d8SD57dnxGgtDlSfqgb7AgFinplRdmLMW9Lec1V6WZBVRcoLS5NNMWDU8RY0eAoG8V17b+A==@vger.kernel.org
X-Gm-Message-State: AFq9FYLdKBhRctsIjhIwjS34kawXpSx3FKmM9pbeKGbOeo7QenvHkZWF
	juGVYT1LHY+Kt5Hvn3Sre6Cv7G7H7cV9ehvzMhqXi1oZC7jnLJAukxTC
X-Gm-Gg: AYBFou0dm3jFtY5dod58+l/LYZMvAmPSeZIw5HIA1e7L3Tu9MBYZUuZHQqUO/Om5igR
	B7A+wQkgWelA0ErUCEOG9mklUl9HXoL3sBl5PzsBJWNm+qLu3TxW/n6qY8DRd10QIvSoQEHqijA
	MTLo4zl5E2y3v61kONUnsqnUwUbJdP9MFVt7/2WDRcQB9lcxRB7J0t11hoOUWCv3X+ZTMzusYqn
	R9xi1tDfI4ZblFPjMecbsWFiOFN2ixjSaTyI4YwO3N2Lidlv92QdJjC3XY8MYePnKwH5dsZfQuC
	N4sZVAaEtq+dklnbdJG7/gNXZlADnZYtVlliNtOSgweQgNS5F0l5GDr3saQpEPdL9fJnlSKryg8
	T4cTT3dENJ44ZD1dJ3qwR34bLAyA+6w0EtmgrBamznHOm+lNvkYqSaw55krnMQIB5xviQMUe2Zn
	nndRhIkgnd8vblw0vxNRieb7sTeSuo84RO8Zo5TZkzTLebmXh7jD2D5HLO7hDTNvmqaTqS
X-Received: by 2002:a17:907:7213:b0:c31:6bd8:b13e with SMTP id a640c23a62f3a-c31a9fd33d1mr1849990366b.11.1792135898225;
        Fri, 16 Oct 2026 00:31:38 -0700 (PDT)
Received: from keen.lan ([212.75.99.75])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4090dd125csm44471366b.26.2026.10.16.00.31.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 00:31:37 -0700 (PDT)
From: =?UTF-8?q?Piotr=20Gli=C5=BAniewicz?= <p.glizniewicz@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: Torsten Schenk <torsten.schenk@zoho.com>,
	linux-sound@vger.kernel.org,
	=?UTF-8?q?Piotr=20Gli=C5=BAniewicz?= <p.glizniewicz@gmail.com>
Subject: [PATCH 2/3] ALSA: 6fire: add a playback channel map
Date: Fri, 16 Oct 2026 09:31:31 +0200
Message-ID: <20261016073132.109288-3-p.glizniewicz@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261016073132.109288-1-p.glizniewicz@gmail.com>
References: <20261016073132.109288-1-p.glizniewicz@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The driver registers no "Playback Channel Map" control, so a program
that needs the speaker position of each playback channel has to assume
an order; speaker-test, for example, assumes FL FR RL RR FC LFE for 6
channels. Channel n of the PCM goes to Line Out n, and the manual of
the card assigns Line Out 1 to 6 to front left and right, centre and
subwoofer, and rear left and right.

Add a playback channel map in the order of the manual,
FL FR FC LFE RL RR. A stream with 2 to 5 channels gets the first
positions of the list. A 1-channel stream gets MONO, as in every
1-channel entry of a channel map in sound/; the card plays it on Line
Out 1 only. The map has an entry for every channel count from 1 to 6,
because reading the control fails with -EINVAL for a count without an
entry.

Tested on a DMX 6Fire USB with kernel 7.2.10: during playback with 1,
3, 5 and 6 channels the control reads MONO, FL FR FC, FL FR FC LFE RL
and FL FR FC LFE RL RR, and the "Front Center" test of
speaker-test -c 6 played on Line Out 3.

Assisted-by: LLM
Signed-off-by: Piotr Gliźniewicz <p.glizniewicz@gmail.com>
---
 sound/usb/6fire/pcm.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/sound/usb/6fire/pcm.c b/sound/usb/6fire/pcm.c
index 0285d79ac..d99395229 100644
--- a/sound/usb/6fire/pcm.c
+++ b/sound/usb/6fire/pcm.c
@@ -612,6 +612,28 @@ static void usb6fire_pcm_free(struct pcm_runtime *rt)
 	kfree(rt);
 }
 
+/*
+ * playback channel map: channel n goes to analog output n, which the
+ * manual of the card assigns to FL FR FC LFE RL RR for n = 1..6; a
+ * 1-channel stream is MONO, as in snd_pcm_std_chmaps, and plays on
+ * analog output 1 only
+ */
+static const struct snd_pcm_chmap_elem usb6fire_pcm_chmaps[] = {
+	{ .channels = 1, .map = { SNDRV_CHMAP_MONO } },
+	{ .channels = 2, .map = { SNDRV_CHMAP_FL, SNDRV_CHMAP_FR } },
+	{ .channels = 3, .map = { SNDRV_CHMAP_FL, SNDRV_CHMAP_FR,
+				  SNDRV_CHMAP_FC } },
+	{ .channels = 4, .map = { SNDRV_CHMAP_FL, SNDRV_CHMAP_FR,
+				  SNDRV_CHMAP_FC, SNDRV_CHMAP_LFE } },
+	{ .channels = 5, .map = { SNDRV_CHMAP_FL, SNDRV_CHMAP_FR,
+				  SNDRV_CHMAP_FC, SNDRV_CHMAP_LFE,
+				  SNDRV_CHMAP_RL } },
+	{ .channels = 6, .map = { SNDRV_CHMAP_FL, SNDRV_CHMAP_FR,
+				  SNDRV_CHMAP_FC, SNDRV_CHMAP_LFE,
+				  SNDRV_CHMAP_RL, SNDRV_CHMAP_RR } },
+	{ }
+};
+
 int usb6fire_pcm_init(struct sfire_chip *chip)
 {
 	int i;
@@ -665,6 +687,14 @@ int usb6fire_pcm_init(struct sfire_chip *chip)
 	rt->instance = pcm;
 
 	chip->pcm = rt;
+
+	/* on error, rt is freed with the card */
+	ret = snd_pcm_add_chmap_ctls(pcm, SNDRV_PCM_STREAM_PLAYBACK,
+			usb6fire_pcm_chmaps, OUT_N_CHANNELS, 0, NULL);
+	if (ret < 0) {
+		dev_err(&chip->dev->dev, "cannot add channel map.\n");
+		return ret;
+	}
 	return 0;
 
  error:
-- 
2.56.0

