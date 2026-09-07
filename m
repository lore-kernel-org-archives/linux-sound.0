Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3FDE370D49
	for <linux-sound@vger.kernel.org>; Mon,  7 Sep 2026 04:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788756819; cv=none; b=c2KsyomGf32yNmeHEYN2hS5vPGzynVpTpBLIC8JELSggDFpN6d3f4JzDuCkXoPuYGoYuPusTm3Stdii/aceNxwBa9f2mAH7D8xWTrVypD+nonGgjRWuFrnTQ2xyEoLp0EurQ93Mf9Djnja4sjyvkVuH1JoODCadJmqFi5T6Kia8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788756819; c=relaxed/simple;
	bh=8YkGCsq2fNUJKevjXfKjv5hISCZUB7uMMneD8i3S8eU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B/LPGashYWBAnnVPD61Ns+XmRK463ozi0b0p2iQLpS64GwVVTnNXC+JXZrbrvcC36N6W6BJfhUCLh59lNhb/rR9Cy+kplA74evmIA4ilDdn6BaKI1b7AvmmpnrVrLSnyaAu6Zn1pBND1pJwfGGox1cW+3jz9jDLUsIqiegFN3yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FJauSSN5; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FJauSSN5"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cc147d86bebso2775126a12.0
        for <linux-sound@vger.kernel.org>; Sun, 06 Sep 2026 21:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788756818; x=1789361618; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0T9FLyWk8KyHCUr0Ih+ry7jYQAl4jMXYRsbzP9s4ccU=;
        b=FJauSSN5c3xjrsd/q9G6KfJ3DlhHUH6Zb4LrIc7k3J/liUuGzd+CD2b8LHz+BQQi8f
         FbbV4uiojDZ+66annPUQzZLcJdjyiDvesaqnYH93FcH5Hkp0ZhEFVV1XT5qoQiB0YVkr
         VU0NcZoNuubuv+j8/vG4WtUFnTh68ehzCIaNHmDl3VuMRQG7NZV8WVvQaRvGL2k2olK7
         YQYgzsQGINjdIcMoGo1kQRgL3kpD4BXj9dDUpHT7yrcK1NJvayWNUD2laBzMU4AxIQRs
         YYcywnXQCMT1Mi8uP4Fv2t3TxaGskLpYRLiw1XVkuSmiqD9QjiJ+vYczYrlSDA8Otz9d
         oTtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788756818; x=1789361618;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0T9FLyWk8KyHCUr0Ih+ry7jYQAl4jMXYRsbzP9s4ccU=;
        b=FqvlzZ/9+LASeaYMtzI2iUAVmQcDT9WJ/P5Y5MVgSswJIBs8cTVncFR4O4gTPkD3lW
         ckpP60nGkgBPgHkzey+5GvzE4mT1S+9Xjerh8uz7RZh3JHrQ4X8JZ+xFuD9ZfcVH5hN3
         lEuZqf4K6LBiFvojuIIvdJGGUOUwTcVL/NNNztbwwqjhiVC9vjWqSti8yjhYym1Q78YZ
         7ijvX6d4nDYxY1ubSaKaLQd8IbwFDtP74W1NMWXLi8lE/o2+bhJUv0LfdsmJwci2KaUs
         V4SlZn0IHeETB/mMnvcpZhrFJ9KmT9Eh2F41byqy75q8/dg49RI48Xhy3GZ55hxoQqv1
         pS0A==
X-Forwarded-Encrypted: i=1; AKwUvByYVCaCbZ/FX1s/Oj4/9ux6XRH/RxKg/xUBMmbYLPgwFY8ft+e54rh/hKXezCKshu0GNuLhlulTdcjEpg==@vger.kernel.org
X-Gm-Message-State: AFuF++mjDo+nmCnhdult3Mx46H+igG/3ZQNM28gGelBJa1LujUOR/M9M
	7pfz1WKLeIk/1ERoBgIc+pNW8nfA+GrZ3xtAM03lpgR2T0WCeyhh1RBI
X-Gm-Gg: AYBFou3kac6kRITU6V4SA8Jwj1bygQ/7HNBOw6n+qHv7IkXn7MgY9loEGzDK6PapzAx
	wI3f87lyArHImq9VqZUs++ZaWR3txYDRF083g2e3o1P8OSLKSaTFqHagfRdv1cYIW+Fdy/3W+rD
	LBLA82ov36Un/z7f0TuekTrUQYas4tQpnuv883rRFzO6DKa3b3yps9aHQ05aDCPQSK5uWguvtHi
	G8NuqcibsQq5g2T1aZ2hDnPcYDQVgeUODmAMIIUPHTkW31GfIj4BRJu5rzBGtzBWgEqXnNMdLfH
	IGgABgIGOh+EWhMF86kXyjemDDXbkxvJTSdVFr5D5HFk8RkqnB4bJV8RNEeXo65jQ3bVU3TCEcJ
	gXCfvloscD8STQSjMW27faoJ7ug03J8rT5RHQKcxXwNAHdeaEMEiV0YnGCDyoXJOjLX2lnwti2v
	1iRLh+BNs3CQH/CqvKOTFqZUHHULH3v9ZHjjTdkOXt4E7Iz4+MbBt0PIpzqH5P9YiI0HfjQKxbz
	jLb8m0q8O+tOlOAb6Bn8I9Q
X-Received: by 2002:a17:90b:35cf:b0:398:9beb:a2bc with SMTP id 98e67ed59e1d1-39b0881d765mr29549079a91.30.1788756817900;
        Sun, 06 Sep 2026 21:53:37 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339af25062sm37923958eec.16.2026.09.06.21.53.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 21:53:37 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Simon Trimmer <simont@opensource.cirrus.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Lee Jones <lee@kernel.org>
Cc: patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v2 0/3] cirrus: fix typos in comments
Date: Mon,  7 Sep 2026 10:23:28 +0530
Message-ID: <20260907045331.16932-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is v2 of the spelling fixes for this tree.

Changes since v1:
The mfd patch now carries the driver name and a capitalised
description in its subject, to match the subsystem convention.

Only comments change; no code is touched.

 drivers/firmware/cirrus/cs_dsp.c | 2 +-
 drivers/mfd/wm831x-auxadc.c      | 2 +-
 sound/soc/codecs/wm8962.c        | 4 ++--
 sound/soc/codecs/wm8996.c        | 2 +-
 sound/soc/codecs/wm_hubs.c       | 2 +-
 5 files changed, 6 insertions(+), 6 deletions(-)

