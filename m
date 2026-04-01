Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD8238B142;
	Wed,  1 Apr 2026 09:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775034155; cv=pass; b=NQA9xamQnXbF0AYr3q9+exIFXMSLgoLdLyFV+7HsQixVppBeCRFme4Fpsq5z9l+iRGthXkhuc0iig8eqrHTvkwNCuGVo3dzsg8OM0faO20HLkE4R1BysxjzHVUtPMhMLUqD/FPANgRUJCZhi6VvCSrzH1YvEG7Zk8+zbXhsVQKY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775034155; c=relaxed/simple;
	bh=K6Gi1Ck1Qr/clVUDQxOvABGJu0HRgnLpCocGwvMdBCI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aSEYwHgZ8PW2iXl8EtdNFzIDpnjWwO2vx7aNpwc8z6p+dmAUILt7rakkOBqrXVNnHftRuZs0qBFYWrToXvE87APG3bjQYBC7oq3eAfRpTN9wjQjSuaxhqCkkVBEovuUa3GJuHRlJzFyeukCDP8u7d6ZbA2POy1ADN3EIh54s6v0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=harin.net; spf=pass smtp.mailfrom=harin.net; dkim=pass (2048-bit key) header.d=harin.net header.i=me@harin.net header.b=Yc8h8X+T; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=harin.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=harin.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=harin.net header.i=me@harin.net header.b="Yc8h8X+T"
ARC-Seal: i=1; a=rsa-sha256; t=1775034140; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=oKlKB2GJk2TSBmYzn9p7WqZjyDBZMvN+DomAU5HSnbPnVaqYqhpimTVfxB0RiY0x0+t5rgQxwHjZXSIVkI8gnfp3H1Xl5urq1V4Dd5qYP1w5J0TN/tEZFTvHFhxsFTvPGMgPzd4HOcyV0QlTVG4PAtY1tpPd9xqoHJ7P77b9HJM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1775034140; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=xfjYP2WutljmYRtOpxzQvdtKxhE8LEAoaArgChOLlyM=; 
	b=Z+ULuXZPOGBOhxGKEpqhmYRo6FbUUokuZYrrNs6O2IlPpfYm23nhzvoccKMtlqtZmYPUI9+Ao/+m54bFQswUb6O014NgmP/MTH83jy0q+Wrn7U8dll4XZFXHcEVr2XaMpHvSdh37u7Nq3D70/8dQUhNl1AjqSujF+8NLuseWYoo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=harin.net;
	spf=pass  smtp.mailfrom=me@harin.net;
	dmarc=pass header.from=<me@harin.net>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1775034140;
	s=zmail; d=harin.net; i=me@harin.net;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=xfjYP2WutljmYRtOpxzQvdtKxhE8LEAoaArgChOLlyM=;
	b=Yc8h8X+TMv6mbBTr4lqLQpEgvx3yVHkPsX0Q3hNjxVpGfZg5nQk4fNti+lWWBFQQ
	9YHCkuWx3P7/HYup6EfGCaqL2Axzqu5EWsNnytPuFl4JcSdqYW89NKWN+5nYra8G19V
	BwmwpWeayWWKSi0NX6r0V48NvJvjFtLgyaFJOVLYhi6iE7XnrCoqhF9bN/PQ3ycxNum
	+OgQbbvnq8zeF5oopbPQvoRL3xx0fpVmU458Ju/fX8yVyrBLJbBgoauQ2gqBncDSedb
	k/NWxNcozRuKjHRuNdyslVc1+yjYjNmOZZaH80UZWlaKCyqzInIxny5ptqdLKQV8xn1
	qTE3rVRjTw==
Received: by mx.zohomail.com with SMTPS id 1775034138153898.5891784700062;
	Wed, 1 Apr 2026 02:02:18 -0700 (PDT)
From: Harin Lee <me@harin.net>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Harin Lee <me@harin.net>
Subject: [PATCH v2 0/3] ALSA: ctxfi: Clean up DAIO resource allocation
Date: Wed,  1 Apr 2026 18:01:56 +0900
Message-ID: <20260401090159.2404387-1-me@harin.net>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Clean up the resource allocation in atc_get_resources() and related
functions, on top of the recent SPDIFI1 fixes.

The earlier refactoring introduced a kernel crash on hw20k2, where
daio_device_index() returned -EINVAL for the SPDIFI1 type and the
value was used as an unsigned array offset. On my development system
(64G memory), this did not manifest as a crash, making the bug
difficult to catch during testing.

Tested on the real hw20k2 hardware with mem=8G to verify the original
crash and confirm these patches.

Changes in v2:
 - Add atc_spdif_in_type() helper to avoid ternary operators in
   multiple places
 - Rewrite the SPDIFI type skip condition as explicit model checks

Harin Lee (3):
  ALSA: ctxfi: Rename SPDIFI1 to SPDIFI_BAY
  ALSA: ctxfi: Use correct DAIO type for da_desc
  ALSA: ctxfi: Precompute SRC allocation loop bound

 sound/pci/ctxfi/ctatc.c  | 31 ++++++++++++++++---------------
 sound/pci/ctxfi/ctdaio.c |  5 ++---
 sound/pci/ctxfi/ctdaio.h |  2 +-
 3 files changed, 19 insertions(+), 19 deletions(-)

-- 
2.53.0

