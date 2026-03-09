Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B54E634B197
	for <linux-sound@vger.kernel.org>; Mon,  9 Mar 2026 21:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773093272; cv=none; b=nrAzY788QLlVVYCJ+9XNrtdfAQr7d4tWVOpHySzDUuG6dL3aXtRWgmq7FkMw7Ol7snr2gEW0NRKjblxJQq30xt7hsr+j6sMvLRasB/GPzFBDaQJIu0iNrKt6DOKEt/WhcyoFhjsDeYSaGZ1FA5NxO9ZjgmSMzEBPduRaBhXBwjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773093272; c=relaxed/simple;
	bh=J7xl59Fx58+zXtIX029IHEauG7FA+vlkguBok7F4oUA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FzAQsskrCPLO6mfD4Xy0H2pz4oXaYZQAXQWheX0P74lREs6GuH4qOn8paZ45XpHxSs19UGc/xYR74hSFH2y79YMzltnKrZiAsHDvPUF9Rs0aCHvSDWgXs/xOoBSr2XcAYAFAQiowVPd4KCFmphn5aQ7ARtTF+2TubZt2DRxBdjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LzzL3Ikf; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LzzL3Ikf"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4853e1ce427so14413525e9.3
        for <linux-sound@vger.kernel.org>; Mon, 09 Mar 2026 14:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773093269; x=1773698069; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CQJo3BgcusRLIm3SnX57c68pebl/CK3B8z7Rc9lJ4Ds=;
        b=LzzL3IkfrMijLyqzDN9+uZhUtb7FDvLsfo1UbJwaTUy8ZsaYCpj+Ii3lKLRp3m5YLE
         VXynVl7k40tovoG+w3EJMAuQH602BfzvE7sS1JHRAY7WqV3mbbVo/q8/EeB+qCFvEdnM
         n1HnrSa/1GhTyl4dmPc6wsDQAu27tX6zOXbOKnrivzSka8EQDlmDSY9YGQBX6SrGZE8f
         9+t/NeRHhHJYjSy+OVx4Cvh8CPc/bQMCs11T2BIPrhqZCumDVRqjTdUZbz0Qt4W/Bg2H
         ffP2cBhsIxagXB37qmJ2vPXnjPyRkTSaZdNlnl3L/KE7eNVHsWrsec8hJnjIWl9Y6Srk
         0c1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773093269; x=1773698069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CQJo3BgcusRLIm3SnX57c68pebl/CK3B8z7Rc9lJ4Ds=;
        b=psuIWwTkWfAfFkHv9WsiUs5J/tpYUBjmA03vGNpqE3muMXMDBAN9CmMvZjAjZzFBRE
         v6BtGAHyd31AH2UmQ9GILn4TQMaKXoB1ol5t5iCvxiMlxEeSyfLk4arw86+ylj6WoP0D
         1rKXQ6ZYsAbldUBAVOfX/nUACS3HyKW/uk+izanLdyhBgHAYbQgSfkB7OSd+x4AZpSZA
         nACLbDX6hIW2J2IHz1eRH5Qr9ZphhJpJxnePGkeo/5bwFwgZ8nPyeJ9yKsgvaGlKggT/
         l4k8c8RRsEublpushZxhHkQSMpfppcLfpkPeWxaquIz8z1A1dXFlfhC+jb0q4R9S40S+
         dFyQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3sTeaHFfrzczVRjuZMjZJw/8Sv8gS5omORQrAaues4HXeBO87CFtLp6tRyUP/p0W+dbURc+ctoQ2vdw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5Ztk3ELE6z6g+2aUiZCSLCMh8B0CKOEne+xMYfEUhlhLLbsl+
	/hGjW8w1l/7mzOkMhhHHVZOeZnR/Rgb5pFc0jgGe+PklF2EqHVYpsNU=
X-Gm-Gg: ATEYQzzDJCDT1p1Fcbadil6PcbWS4EqRUPQGY1MxGtwHftA31n5SwR9Zn7xlOTxpTkc
	yTqFgvcDy96CAD3u7iIzKhx0cznD0sQlCk+Tpjh60XSK/atduU++g4hQutl1V6EuomMK54KAx35
	2MxBBg8zAKjzY3Keg3FGwx4fJnZig4cz+tglV35zjScQ/LhEj1jYgrHOhi/Ox5mgEcGtTczPoDH
	LHENPSjjnYNzFUF1TPNOpPjsM27SR+etGEuvH10TmPa06VoS/RB7A5w+GLSjippv9sGgHKz9226
	q0kQkay6Ar3a3AjPCLOAjCf8sKN54jCnH+hbpqh0WW9EKloOaOblGqL6JAaC55UVMxvuZ0/jRbm
	qfsdlsjI3o2lwAp8TUqCR4pNDnQ4U4pVNAuz1h4d+j7F8jBclsuEp+wQFllnOVhFU2a6xiqDxwf
	gqvDHNf+NSpyVbByHfnTXZeKxk41kodHSvO3wizQekSsJPQ/TLubXr7w==
X-Received: by 2002:a05:600c:b93:b0:483:badb:618e with SMTP id 5b1f17b1804b1-48526923941mr208200345e9.8.1773093268946;
        Mon, 09 Mar 2026 14:54:28 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e11:2401:e440:4d43:1ae9:c232:cc4d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541a900easm28183845e9.9.2026.03.09.14.54.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 14:54:28 -0700 (PDT)
From: "matteo.cotifava" <cotifavamatteo@gmail.com>
To: broonie@kernel.org
Cc: cotifavamatteo@gmail.com,
	cujomalainey@chromium.org,
	lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	srini@kernel.org,
	tiwai@suse.com
Subject: [PATCH v2 0/2] ASoC: soc-core: fix use-after-free in close_delayed_work
Date: Mon,  9 Mar 2026 22:54:10 +0100
Message-Id: <20260309215412.545628-1-cotifavamatteo@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <17591222-b9f7-4056-9c13-4a2ccd0788df@sirena.org.uk>
References: <17591222-b9f7-4056-9c13-4a2ccd0788df@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a use-after-free in snd_soc_dapm_stream_event() triggered when a
sound card is unbound while a PCM close delayed work is pending.

As Mark pointed out in v1 review, flush_delayed_work() does handle
pending timers correctly. The actual issue appears to be new work
getting scheduled after the flush: snd_card_disconnect_sync() inside
soc_cleanup_card_resources() can trigger PCM closes which call
snd_soc_dapm_stream_stop(), scheduling new delayed work after the
flush in snd_soc_unbind_card() has already completed. If the timer
fires after soc_remove_link_components() frees the DAPM widgets,
the work accesses freed memory.

v1 -> v2:
- Split into two patches as requested
- Dropped cancel_delayed_work_sync() approach, kept flush as suggested
- Added a flush in soc_cleanup_card_resources() after disconnect_sync
  (so no new work can be scheduled) and before DAIs/widgets are freed

matteo.cotifava (2):
  ASoC: soc-core: drop delayed_work_pending() check before flush
  ASoC: soc-core: flush delayed work before removing DAIs and widgets

 sound/soc/soc-core.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

-- 
2.39.5

