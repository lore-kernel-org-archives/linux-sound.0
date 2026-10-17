Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5083356760
	for <linux-sound@vger.kernel.org>; Sat, 17 Oct 2026 07:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792220464; cv=none; b=nPaBA+iBTolTz/lRu1rBfN0lhDzOQTddVI1MEHlCcYa7TqVCm/pUa4o4zfnCgL4EPC6w7IYMh1awyiyk+qcFhDJyhHoTYO/EF7Hhg39y3oPCYhwiIuX9rgX93Fj2f2SnnvQM0u+KIZRZ9JTlwLSHs8M5TOkhXmDFT4JpVtY/TNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792220464; c=relaxed/simple;
	bh=Ykfx0SMB+vs7928mQESl8JU5jg1mVkmDBYjT+l3yM0o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=KlgVugJEUzNw6Q8IkObdyfFEfW8qYkCpdg/obHhpdoTquO2XWctYnrH23KD/DrAmS5aFpHe+OnUryfNW9fOBnP7MxLlLeBcPrdB8bd6CYNI/a2S2TMXlPXiFdALYLomRRn0OaXP7F9z9+HGvLZ/I7VGFDOPBXjwef0lctBsKrRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bLkxDlg1; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bLkxDlg1"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2e5378b281aso2451795ad.2
        for <linux-sound@vger.kernel.org>; Sat, 17 Oct 2026 00:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792220463; x=1792825263; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uqmf/gpLV/7FBGP+y0T4LAW9t6W7h08u10hqCEpMGqo=;
        b=bLkxDlg1LkR4bKJAP1isgQs92bj0EU6H3p0l7yLw2k301V9Z63Qi6zcY1Kw4/uy4dA
         w6HbpzDnLKq0/yIPz6UOr7V5qaYrV7mn2QimNndpQ3PG+I9/9SUOdbfbeRMgtBc1YQLR
         TRI0pKZM2P/VhCLgHf/tksiJjgUr8D/qRlYxZQrGtDQcpBiSMGToHDrGLK4fqm3BC7YC
         7KxptNgNuws6pXKkg63PaJfPZQGyfRc6D5e9LcwkWhh5RnOwR6AegracV6n1je+9Y5b7
         jciR4JPpvcbtIHtiDXVLzmD9nil5s5WCJEKFtWRKEAvaVr2p1eXdCE3hvjFimr2nPFrO
         oXvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792220463; x=1792825263;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uqmf/gpLV/7FBGP+y0T4LAW9t6W7h08u10hqCEpMGqo=;
        b=iwTe2ev9uYW2IPO2KFk8LSyondfdx1G+pVnSQ5x9edixIfctOqRBdMfMdM4EvJPfFg
         oMnzJ+TtoLx98seti0a/W5ycHDwkEoG/q72lhDziVPYAWca6wpKHZuNkpwWMOi+CsTyG
         ZRqZKJAeD4z4y7dBSfiZQTqs6364fDtyP4M5AK6BalwrccKkXl/9TKX333Vm0Bgh2XRa
         L0jP4fttQz7Hj16zAsI8HFgiH1+4e7f+WaauWUAvxu90eEjNJmmw24Jz6HwYBsuQc4jH
         vcFfBG6xKXBcKXqgd0/mUAqgb9FRiFcdTmUWpwq+gXrXTC1maK6xszbYbugH+BBWVPmj
         gnIw==
X-Gm-Message-State: AFq9FYItZ1mcEGo6vEiegGFRC0B16GQFKSTL/wZoNP3LNG/3iPnntPOW
	opqv4JHWdjFXjcW0lbnxihQGn3kPE8hgeqmS3ON8wQd1h73oaAl9q4A9
X-Gm-Gg: AYBFou3LO60DwStgZ1XZvwGSoznd6jZPedGR7ySXUApezdzbolHkqoUrVjB9yTBN+Hf
	Y6y6EV5Bt1uIuArtqACTsMh00v/sR/vXj3i/xhnB8JdK6sC7/dgUjNC4Yj8EDHSfiKC8gBPreGV
	budkotlADNDeCFT8zlPeo0KedDP2CQdTEmmsqVCWQtiy6pDFEG6xCdXA2+58+8Plc4N84KaKuEb
	Fmt3EgS7LmWQPyZDpo9QLMCDD8jIaEeYp41JjKQ5Xo8jpOibGuyISzPB6Zxzx81ze5X8yi6Klom
	XLafJqq10GGm5XdOmZytJfQHK+u5BtEZCI7nY8pVUwf40qkzPWqb0yVDtTYD33j2E+WigXBLCWV
	zPqGlgxQHhodhpdE3M2AmwuVpl8YtfzKqDD+V7Wq3NxoLmm4JZOd3H0FxyT2JYzSPrwSnv4dejI
	BDFPwLy+6Ev0hg3x0b0RJB+IjdCd/0ZWlL9Tz8NarZmm+B5E6qfgOh3VrTtZlHO1TmDA==
X-Received: by 2002:a17:903:37cc:b0:2e9:8bd4:577d with SMTP id d9443c01a7336-2e9a6a0a794mr19030945ad.37.1792220462827;
        Sat, 17 Oct 2026 00:01:02 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e804e80sm19807695ad.23.2026.10.17.00.01.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 00:01:02 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH] ALSA: jack: Protect the index scan against control removal
Date: Sat, 17 Oct 2026 15:00:58 +0800
Message-Id: <pm-pmb-f08c844bb1163c8d4fa1-v2-2f3c99e40f90134846ee@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

A control found during a jack-name index scan must remain alive until
snd_ctl_find_id() finishes comparing its ID and count. However,
get_available_index() calls it without holding card->controls_rwsem.
With CONFIG_SND_CTL_FAST_LOOKUP enabled, the lookup loads a raw control
pointer from ctl_hash and dereferences it in elem_id_matches() without
any lock that excludes removal.

This can happen when a jack is created while a different jack owner on
the same card removes an existing control with the same name and index.
For example, probe and unbind of different HDA codecs can reach these
paths on a shared card if their generated jack names match.
The codec device locks do not serialize operations on different
codecs. The unbind path can free the control during the index scan:

  Codec A: probe                  Codec B: unbind
  --------------                  ---------------
  get_available_index()
    snd_ctl_find_id()
      kctl = xa_load(...)
                                  hda_codec_driver_remove()
                                    snd_hda_codec_cleanup_for_unbind()
                                      snd_hda_jack_tbl_clear()
                                        snd_device_free()
                                          __snd_device_free()
                                            snd_jack_dev_free()
                                              snd_ctl_remove()
                                                snd_ctl_remove_locked()
                                                  __snd_ctl_remove()
                                                    snd_ctl_free_one()
                                                      kfree(kctl)
      elem_id_matches(kctl, ...)
        read freed id/count -> UAF

Hold controls_rwsem for read across the index scan so removal cannot
free a control until the lookup has finished using it. Release the lock
when get_available_index() returns, before the caller adds the new
control under the write lock.

Fixes: 38ea4c3dc306 ("ALSA: control: Optimize locking for look-up")
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
Assisted-by: LLM

---

diff --git a/sound/core/ctljack.c b/sound/core/ctljack.c
index 6b6ab34fbde89a6551eb634ce13c66922770d0e5..36700fda79f3c027e84bad416c4dcc3d5da1c6bd 100644
--- a/sound/core/ctljack.c
+++ b/sound/core/ctljack.c
@@ -38,6 +38,7 @@ static int get_available_index(struct snd_card *card, const char *name)
 	sid.iface = SNDRV_CTL_ELEM_IFACE_CARD;
 	strscpy(sid.name, name, sizeof(sid.name));
 
+	guard(rwsem_read)(&card->controls_rwsem);
 	while (snd_ctl_find_id(card, &sid)) {
 		sid.index++;
 		/* reset numid; otherwise snd_ctl_find_id() hits this again */
