Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95E4C47B413
	for <linux-sound@vger.kernel.org>; Sat, 17 Oct 2026 09:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792229288; cv=pass; b=SwifQB/nltplEmXEvhLcHW1P0xydpebfARX9KmvRU78g7u2aR1eBy89VyKdfc5ybtqoz/6ILfU5XgVnoXkgdnSgQ4gUv1F+qom2htdSFOP+4JsN2XZKLeI5XfpKxLFZEVb+TQHw9HAwk0Nn/HKbTA5/lF8ktg2FKganmeuaZsV4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792229288; c=relaxed/simple;
	bh=2H5qm3mQwTyCr/jOwVVLk+UrxiTCBLhB9wGnQdEy9VY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HXFjNdbaMCVjtGbiSQjGTophw3Um0QPiN5cWInTuEV0ObOoOuUqERdXjNQcEVlpQDng++C7NLjaxowmm5s7jyMIv9S9c7hHg0UKHmVqNv3ih81JoJLNr7D8WiedD4sXohVEaSpcaof1CKqo+mbHpH41Jm3sP2L6IPDWHwh4OF9o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cZz6sypk; arc=pass smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cZz6sypk"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-885cf67963eso5539747b3.0
        for <linux-sound@vger.kernel.org>; Sat, 17 Oct 2026 02:28:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792229285; cv=none;
        d=google.com; s=arc-20260327;
        b=k2lqfPFvv2xE5n0qbkP3ImrKnko8TO2h9UXdRz20/cO5aZjE7CJY33ZT+VRLkTQ06F
         Dosr4B9/WmC7gC+B5D5Ezl8EzrpUoAX5D5okzO0Cg7XMaZQcC6/86zCPzdJmpGgh6b5A
         J51lXmE7F34JeZUxcVlONUC5zFmg2NWFWcJk3oqOY7F2zK0DWSxPyfXOa9pTUDPAf86R
         SLMQ/CJrSKk9iFytK522Tlibxx82QdKOBRtiLQH3lfE2o1PjFq2LawlvFJqkRLCPa0g8
         TkGwzzo6fWWDOeRpjfAp1iJ3xGdTXSy25Ac/rorFbjgOrcVVSVvihyA7s436ttQbQmEm
         QosQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=8Tr1mqEziAjn6zdowZ4/VD4qN5GUNr9OmFmlDrRHG+A=;
        fh=w0XpyKH9GqmtWQkoGv6o78bf2UQ4+fjtbj1db2tz8ho=;
        b=CcPZX35kpABLorbaOI4u9db66rbYFoSuqXtA0BKqETXiYURzLA4NNVV9vGaewsxW0m
         pkC921K47b5lZU+44nmZXFmQQC2LaxGevnwkEGEsZzkvRY42FUfok7CKTWVGsPCa+H7k
         qmKhksU/+pEeY9hogpyafYtHQuSehNsAEjz+X8i3Bm3GUrbBzIcWAtEIx1AUz9Jqazq5
         d4ldW5SD09L3uMCWgRFEdFybJaR2X0l9zmWFZDMfnAArSllnNHXWQKzdp7hNit/21M8G
         hvCbWOVofpeV05vhXYMFtIpnnr50FSimIfx5jhfJNnqR29wLfUjuU7MG6Qlqllcfom5V
         xHvA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792229285; x=1792834085; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8Tr1mqEziAjn6zdowZ4/VD4qN5GUNr9OmFmlDrRHG+A=;
        b=cZz6sypkKdkCKYYDBDICL5Eh1/xZ6FZgOanfwEezMRwX+awgqIcmNt/yaGk8SSQYG2
         v6qpzZbabOapmEiUCHjq7T34Q/vbYijrr0ucDzC61rg5+TKPfLPEqEhdt/cDyCDFNw6p
         5H73+FWSb6cQ7GHrx+iJEBscBoqDjaaBOU2+enD866beLSKND5h7ZtFwQuYpm2kA6l22
         BDTFf9StKWk87yuQd3utl9wRDIiReu/3g4P/SK7dFAw+dNy1w+xqGj/voEHRNg1ZAYe3
         ieM0T4rYk1IMK9wlLNUcS3xQQ2cV4V3NrZ6SOM83q+Gu0Ll3PLnv7mKp9irkdUv91SGE
         oW2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792229285; x=1792834085;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8Tr1mqEziAjn6zdowZ4/VD4qN5GUNr9OmFmlDrRHG+A=;
        b=GnogMNDeowNaBG8bXQYEs01mvZ1eDFeEAWX8qIKd0lYdNkQbN5jkEu9O7xWNYbm6gJ
         d16mVBSmNzRvgbwKAEMWFS2eOP5ZuEmIxTJ8T4TEx/CFKNAeaxRGlz5vbo6vY+L9OpCR
         SAHrPAS9JGjkbuRejtpRHLcYMAvqr+RpIS5IsU7qETCJCTVO6EYGX1GD81UA+WNNP+Il
         wK0PvpHkkAK3O+ATtk5UGfhCKkLB3XJYGAHN6xCqBaVXNEV4q0sQhtrRvuQ/1c0fx3wo
         VTUo1Vf3N+v7cZGmkeB6e9p3QGd1JfrcYJB/hbHTBiXWMIjdbQaRYWV4Xw1CwoYdyxaF
         Vo9Q==
X-Forwarded-Encrypted: i=1; AKwUvBwwEDy0WsvCyaKvze+wH2YumwMl68wgTXyy/n58WY545HLwJmPTsurljtl4KV4vwnOmILPMO31J0/UlLg==@vger.kernel.org
X-Gm-Message-State: AFq9FYKPrh4wrPLyySpOErkO8+7bYXe5OSF/cuxCqu0uEjdMj45Czk2p
	PZ6du/XhAfk0/l5stVpfY/N1a/bNCmgjhPl90kOsT+lD8V9c3orpIV7Fp25K8mPZx+LwoKoptrW
	82jjBqLaWR7I91ZDRidmwOEwsJ8tre6w=
X-Gm-Gg: AYBFou2sej+wau/TqMylVbnfkr6HjhGfo3dz2MaO3q+imOaCLWBpJIko0Y0nLAgwoVP
	Lb0XUwUSb6chvz/1YBoevXc97VMuKp6OdSLpw42siYbf3nbx4PVFDldtG9Loff0AZ1Gh2Skfo5Q
	Lnh4v7m+Jppjbdr3PbpX774N3WuO97z50zCBDvGwPl6AIVn5vb04oxCXp3xgSkM36JPHM8ANOrw
	6cSDshNkuBWQi8HgSY+A3aMJyf1PlpxD9lkHeUX4KAKRUUD5tq0gVljEcdKltNWL9BWjSsTgIwm
	pR/lRR1ohbx+sLmN1zsdxv3q+XfouAnR+CgGnEkkDe5VpzngotWpFaRT
X-Received: by 2002:a05:690c:d87:b0:8ae:845:5179 with SMTP id
 00721157ae682-8b0f21cc08dmr8632257b3.26.1792229285369; Sat, 17 Oct 2026
 02:28:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <pm-pmb-26d66390a25fec9fad6c-v2-743c9b89c0f0d761eda1@gmail.com> <87ld7w20ok.wl-tiwai@suse.de>
In-Reply-To: <87ld7w20ok.wl-tiwai@suse.de>
From: Cen Zhang <zzzccc427@gmail.com>
Date: Sat, 17 Oct 2026 17:27:54 +0800
X-Gm-Features: AclHuK-uDc95tfKHol5Lz7eVyhe6S5CGzuwxpZyVvBypMH9KDZ7rP4F_swGe3Oo
Message-ID: <CAFRLqsVs8BGNHb8qG6nnrCc=fafMYAmCSDuXDb8uBRBrgJhnEA@mail.gmail.com>
Subject: Re: [PATCH] ALSA: info: Serialize freeing with recursive registration
To: Takashi Iwai <tiwai@suse.de>
Cc: perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, baijiaju1990@gmail.com, jjzuming@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi Takashi,

>
> Does the above crash really happen with unmodified code?
> The PCM oss proc unregister is per card, hence there can't be race
> between register and unregister for the same card.
>
> The hardening itself in the proc code is good, per se (although it's
> doubtful whether we really need a global mutex from the performance
> POV), though.
>
>
> thanks,
>
> Takashi


Thank you for the review. The quoted KASAN report used scheduling
instrumentation
and a small test module that called snd_card_register() on an already registered
dummy card.

But reviewing the source, I found a concrete scenario involving
existing in-tree callers that appears to allow this race.

Consider a registered card with PCM A and its published OSS proc
entry. A later bind of another codec B on the same card can reach
hda_codec_driver_probe(), which calls snd_card_register() when
!bus_probing && card->registered.

At the same time, snd-pcm-oss can be unloaded while the card remains
registered, provided no active OSS references prevent the unload.
alsa_pcm_oss_exit() calls snd_pcm_notify(..., 1), which invokes
n_unregister() for the registered PCM devices and frees their OSS
proc entries.

The interleaving I believe the source permits is:

  HDA codec B probe                  snd-pcm-oss module exit
  -----------------                  -----------------------
  snd_card_register(card)
    snd_device_register_all(card)
    /* PCM register_mutex released */

                                     lock(register_mutex)
                                     n_unregister(PCM A)
                                       snd_info_free_entry(entry)
                                         proc_remove(entry->p)
                                         lock(info_mutex)
                                         entry->p = NULL
                                         unlock(info_mutex)
                                         /* entry still linked */

    lock(snd_card_mutex)
    snd_info_card_register(card)
      snd_info_register(card->proc_root)
        find PCM A's linked entry
        lock(info_mutex)
        recreate proc node with
          entry as private data
        unlock(info_mutex)
    unlock(snd_card_mutex)

                                     unlink entry
                                     kfree(entry)
                                     unlock(register_mutex)

The card-info traversal does not hold the PCM register_mutex, and
OSS notifier removal does not take snd_card_mutex. The parent proc
directories also remain present because the card and PCM A have
not been removed.

This appears to allow the new proc node to retain a pointer to the
freed entry. A subsequent open could then reach alloc_info_private()
with that stale pointer. Please let me know if I have overlooked
another serialization point in this path.

Your point about the global mutex deserves careful consideration. Do you
have any suggestions for a better way to synchronize these paths?

Best regards,
Cen Zhang
