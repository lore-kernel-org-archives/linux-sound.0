Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3333D1E511
	for <linux-sound@vger.kernel.org>; Sun,  1 Feb 2026 23:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769987546; cv=none; b=SZjRV4YwjojbpIzCnsX86S4cC5ohaR7jdUZEh1mYGkrBIxLaPG0tbXGefRBHp1zpEd3zeSu6EJM3PKmyI4hjeB9yWtyEFTonfWg06dlznpXxSNA8hw4PD4boXtVaaI56PTeVDgdehLYYSIehoCkVmlAFzB4jlxlUmLOkimphpho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769987546; c=relaxed/simple;
	bh=Ir/n3613cEPXiFeh5MdHUYsPEPQ3Xk5Gd/tsV0trgTU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=KG+yrbBa05WNcp1D9LnE/+sKtpb/HLBE81yau1wpy7Dwrcy/OeyQGXleU0tX7blS+VJgw54UTR2WN0ayrLqdFnytsP5Feb9VYuzquis+NRPCnBX0f9QZUGsPW33jvlkCNcN+eQ8oXM0SwCHaiVh61QdbTk0Z42600aHF4hRJfFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dionne-riel.com; spf=pass smtp.mailfrom=dionne-riel.com; dkim=pass (2048-bit key) header.d=dionne-riel-com.20230601.gappssmtp.com header.i=@dionne-riel-com.20230601.gappssmtp.com header.b=wIX8roV6; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dionne-riel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dionne-riel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dionne-riel-com.20230601.gappssmtp.com header.i=@dionne-riel-com.20230601.gappssmtp.com header.b="wIX8roV6"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-88a2ad13c24so35074636d6.1
        for <linux-sound@vger.kernel.org>; Sun, 01 Feb 2026 15:12:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dionne-riel-com.20230601.gappssmtp.com; s=20230601; t=1769987544; x=1770592344; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oYMF+76gs5tuHlgkGmkTElasK3KdyxJ830G2kGl/PJY=;
        b=wIX8roV6tpUVha1HQ3t6mSebwtlTBtQpJq5xnQ+dhYYcPeekat07mj+6lfg0jB906R
         wpRGz2yQqu3EmaYFsWyvyMrJOwSNoOIf7LXg7nhgxv4/JKbxdQ2nouxeK2krYO1e5F3H
         8yuMKvgnoMu89Jh8E+h09KuwcE8TvKFRBRprcNcGvhKVIKozkgNY7oUd2urEBEHvobCs
         4OnFjuxES2+S22tCGT7yTkmD9hK172JfVq0UCMcFNYBPnhdI0QlN2q1VCkBnZb3e1vhB
         hY9xLCB58seGOAohQi+PjJLpqvdKoolP2yYexiJ4WTyz1oldkPzdDXnlL8BEPZ1hhPs/
         JC2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769987544; x=1770592344;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oYMF+76gs5tuHlgkGmkTElasK3KdyxJ830G2kGl/PJY=;
        b=kxTWKqzj9z5NQ/nhz1Bj1mNSCnTUHkGdPY0qZrZdHpSgFlq37QhMQ5cEkUm+rqSnpM
         lPWDboU3t2+Ng/t+zfO2xrgaOzndmxViGydf+shtUUqLqXEuO2IAeRQ6hP4V9NP9BVUy
         3ksLUc1p1KD8IB6xXpnDcUhRfMhLiQFQfp4VGYaPuFg8B4E1dKaGrHMboMEvH95oeLHb
         skANAKa9WkGOreDDfCW5XaaByKJ2eqHCxJW13ToULSmzIwH+fkiUoqpFQ36X42VA0s4X
         PBijvoBF5ulQcjlffZI+UP9zzzY3+RrD2b2+boW838HUIT/hKU0Yyk4cVXPTAgzqMpNt
         7L7w==
X-Forwarded-Encrypted: i=1; AJvYcCXLXJfMg53uk0OIxxclTVJnh2y5/Slgr7cZlKLiWSsK3zmDYYJpvvTcTSsKb3AnihKE/+nlU4KVP1/dVw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2RzDl7HkfOGsBSAJ0a9N2CDOjnpGKXF8MKP9aKEhfc+lJtNmW
	oV4QZfggx/yZo+UobMxji09nqCmm8IToem0nx/pyDnioRo1iUPBBy8uufly41ixaLNPLKCd82fg
	eMeI=
X-Gm-Gg: AZuq6aK01cNAuDlH/2tO9YkXa4hdWpoAaS+ApZF7lYvbTIs1B/anX/hBQB2kgrPx9Wv
	R41XfuBboJpa18N1WibDV5b2kXq7CHVQVEZCbGDlTQw7jIkdMCjBlld+qeVY92WZ6US1OuZeg+8
	o3UQURv69vU1uEchMM/m7M0Es4Ax+isozgbSXCKJpv4Dkfh0myQZMnLGlyoL4BRahL1LDSGISLL
	17ys3J8FfjXR9yYfpNmEy94w47JR74U92gjMlsmCZTecdDn4YgaAj6Ve8pEeA6nJSS4woV7l/yG
	rgBFcJRIpI2anytfy2j1XH1b9I3sKNI5C3kEliYme6XUevLA3IIxdNc1zmy5PNzC6I8iCp24wMA
	W/NGqbbK2ECpdCEjlC76nW77SGCy3aurhzxKlU9BFSWL6PsASCHLvmnNI2mT2q3lC7X4ct2pySG
	QkvdwF7k8BvMNPEAFR4/xHq6W9Pm0IwAXldsy2Z2ebKltAbUxX1WyQI8VArAQHSdPmUUsTMk8AP
	ri4
X-Received: by 2002:ad4:5d46:0:b0:882:4c83:af43 with SMTP id 6a1803df08f44-894ea026f11mr125909766d6.42.1769987544033;
        Sun, 01 Feb 2026 15:12:24 -0800 (PST)
Received: from frankgrimes.elk-nominal.ts.net (135-23-195-66.cpe.pppoe.ca. [135.23.195.66])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-894d3740d73sm102537246d6.27.2026.02.01.15.12.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Feb 2026 15:12:23 -0800 (PST)
From: Samuel Dionne-Riel <samuel@dionne-riel.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Samuel Dionne-Riel <samuel@dionne-riel.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] ALSA: hda/realtek: Add quirk for Minisforum V3 SE
Date: Sun,  1 Feb 2026 18:12:13 -0500
Message-ID: <20260201231216.1655154-1-samuel@dionne-riel.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi!

These changes fix audio for the Minisforum V3 SE.

While I didn't tag as RFC, as it might be just fine the way it is, I am
open to suggestions regarding how I implemented the first commit.

The main goal being it uses and exposes a generic name for this specific
fixup, while keeping to a minimal change. As mentioned in the commentary
for that patch, there are a couple other fixup functions that may aim at
applying the same fix, but it's hard to be sure without testing with the
original hardware this fixed.

There are more details about each change in their respective email, in
the commentary past the commit message.

Thank you for your time!

Samuel Dionne-Riel (2):
  ALSA: hda/realtek: Add generic quirk for Bass speaker DAC avoidance
  ALSA: hda/realtek: Add quirk for Minisforum V3 SE

 sound/hda/codecs/realtek/alc269.c | 8 ++++++++
 1 file changed, 8 insertions(+)


base-commit: 63804fed149a6750ffd28610c5c1c98cce6bd377
-- 
2.51.0

