Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794965320;
	b=w5kdUtSvzUDRnH3VaetiNYO8fFIQaq/yOvaoonHI0tlWtpTlYOn9zkWxkpNf2lYVt7wl
	 b4t/OR74P0Upd7bsF4se6E3L8VBTbA60iaqugjWhlv7Xwk4tmSKL3tUDg4cz0FkzDSxGp
	 tUq+fOoySIMELmpI5g7aM207lEbFH47dJkpo0rGXi0S/8LoWqb08K1D/Jem1AYJIl1HNe
	 MNcjTBOvwWd6+PVnPJqzj+yfqTPTmLnVjftRQwKVEILUgQQg29JvkSD44AQ+z+gaR9WMZ
	 cHK5VjupDVJPrpEDP0GnFoGFB4rdR5vjY6fbh9sfIYPyxziAcsz7/g5mTCnZfrxVG1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794965320;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+z7+v9HUS37K0OtITVwcXI81+jSuSCmpbWR0bmORME4=;
	b=sXe+x0YscioAL6wCYmILLGmDZ+6pFcZIfkuRsUgx1Pjl5zT2612BvT7M1NvFGQDxfwkE
	 q5x64iEskdAo84+cZSLHf9UrEOYVbp8jo5t2teKeg27C3cTNx2QpxuDMuuaPfY/oocDg8
	 sFCI00LSSKGl2hfAkH4qIdzbyTteULAdNwgPvV0WMZPw7vJgI1x/XmhkMJFv0/v98/3A7
	 rJHHNnGz3O+3bNXbrruSSt5gaOgw7WYLQ70g8WxmhuidbpKl4grt/ugjFEK0/sjDZ8ePg
	 9/lW94KHM2/6X10kpQ9YRsbQVhV7LQiE4djLzcDz8+qQEOSzX+S37KM+NlgMz/+J79w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="xR5/hu0f";
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C68D606A31C
	for <linux-sound@vger.kernel.org>; Wed, 18 Nov 2026 01:28:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C68D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xR5/hu0f
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3b179528d56so177490a91.3
        for <linux-sound@vger.kernel.org>; Tue, 17 Nov 2026 17:28:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794965319; x=1795570119; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+z7+v9HUS37K0OtITVwcXI81+jSuSCmpbWR0bmORME4=;
        b=xR5/hu0f8IWoVKyhoJtKWBeQF2k86+H/Ayqe/rlSZ/m/MS6AxVfSqK464wVf7pogt9
         CmV3D0TG8oo0iCz6J51v/c0jloOnBJJ+GoK4tySwzuDGJbfPHqBOrFjKPN4H2vG5vSAz
         FEPlOmMNeA+So3ZNSaEX09+fyRXdO7ctFuORzXg/lHYe4wV41Ay5ldkU5K1nkWwYmRer
         PKp9xj9z/O/PPBZDKn7jQhKmgFwiaoFj7ZUxcYwBdi6+nY3VzxQFxnPlbeIMbJ1CiReT
         anUmh5DrinIMRV7cr8piNXIiKJGp6uZt/IPzHBSo62/63K6bWRsQrDyg+lhLLgF0L8uB
         ZjNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794965319; x=1795570119;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+z7+v9HUS37K0OtITVwcXI81+jSuSCmpbWR0bmORME4=;
        b=0FkrrM2ewHMCw3hOuZHPYWxGDqlO5YGHa4GPIoSOeQRYhsrJnDVLLxjIGJhCNGzutt
         WUmynrBqH2E4Qo9gQ1j1FzxCmj+GjLtBBf5IA5sPx3Em/Z1VmdmHQ9qW3aZ2KaReBRcH
         fgvXRHedUykVZgnvyeoX9hc3ymX/ayOJPMjP5OypZ1i8kT2i7ke+pxS61N1owzugTc9M
         A8h5sDWA5ubKPTy/jHrPuQNMBsHCr9ggHej4A9ayEhRlIOdl64axM7dFBd59Q17dnH7j
         +e9dRZwQBv2RAAIDnE87Ir4pJdP3ZpPlg//6Bzdv799oFd5IaJMB5MrV1LOrYYa5sqZI
         771g==
X-Forwarded-Encrypted: i=1; AL+hErGII8tliDYJwk/DySF5oWK9SC2r68kPB6RPpIw4jtlaVpr9JUFsi5+slrG6Jk0JiRwtesmBVsHs3HOipQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+XVwNNNbVXawnhVi+TVq7kSc8WN48akWjjmVG/zmcjDO8iwAsw
	YkXzuRtzYGJPQEOvNLecirHAmzYzVxnM/XGF4w/FkpgvLCVH72vKNzXX
X-Gm-Gg: AZFdTZfPJzUdnqo4GPF5Jf9rcoNFrVbuKcsqv1HtBfZdba7yLqBOZAmzsbsbbI73jK8
	tQBtY7Sf8HCPRz1r5sC1TPtFuz+tgnQegqF+gc99zgqceCguNW+jodmj/f/CD4i0UDjd3F5i6Ox
	d9REZynOgbG24szLh/PwOjvNzyixYgRAqgc+T3E8CPwQ7LxGJ+iMvRROBhydY4YVBqTAPYSR6Tc
	kWLLRIbeEhZFpyxSt950r61neg9htXyhPM+ea5yczCdN2X42BNWN0YSsZkBfi1n0X6rLNjiWQBC
	bTkymQomy4h+thiYE4LuvH7/ba0wXCNUU7B6R98MFJTTzPm4Ax9zi1mNDClP9gV8bnyTidE10fS
	ZNap7Mg5o86DCLOSjjNH/aLG5RRHn9Lmx1pd6udMaRALYeJB3YprQ6yQVbeKVLCSdUXRyO0iRAS
	X/59aRPasKC1lxSOnZBYztrFA/o8GqOxVrpX4ihBMSe3MGLJI1wUvLIZuyvpLKH5HTkX/QGGbTS
	kjW37/nbtXcAYcciTCkP9eR+ATawcF7MlljuOasR3aZ2ZeMHSZ5fbjZ9KlvQT5fVqXXJ5xL332K
	kzcbZrcGEbotEi0V8pu+0OlYC5WP1dfMDBDXMtjVctFjLpv6DMHrdGxc4mF9eKrJUBJKeAo0emt
	vnrZlNMW+Xnn0KpX7sEsuXf/HpDuKig/JaMlRK3hg
X-Received: by 2002:a17:90b:5605:b0:3ad:3e8:12 with SMTP id 98e67ed59e1d1-3b3d07d472dmr793547a91.48.1794965318556;
        Tue, 17 Nov 2026 17:28:38 -0800 (PST)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d56ab352sm281808a91.2.2026.11.17.17.28.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 17:28:37 -0800 (PST)
From: HyeongJun An <sammiee5311@gmail.com>
To: Takashi Iwai <tiwai@suse.com>
Cc: Ivan Orlov <ivan.orlov0322@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>
Subject: [PATCH] MAINTAINERS: Add myself as a reviewer for the virtual PCM test driver
Date: Wed, 18 Nov 2026 10:28:30 +0900
Message-ID: <20261118012830.3117724-1-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I added the control fault injection to pcmtest and several checks to
its selftest. Add myself as a reviewer so that I see changes to the
driver and the test.

Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
I asked Ivan by mail on 2026-11-13 and have not heard back. He is on Cc.

 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index fee9d090b280..e3d1e140373c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -29131,6 +29131,7 @@ F:	fs/vboxsf/*
 
 VIRTUAL PCM TEST DRIVER
 M:	Ivan Orlov <ivan.orlov0322@gmail.com>
+R:	HyeongJun An <sammiee5311@gmail.com>
 L:	linux-sound@vger.kernel.org
 S:	Maintained
 F:	Documentation/sound/cards/pcmtest.rst
-- 
2.43.0

