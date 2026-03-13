Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D13B37F74F
	for <linux-sound@vger.kernel.org>; Fri, 13 Mar 2026 19:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773428523; cv=none; b=F8kd4qrRmdEcn3CZdynbdNxLfuQ5LS2JwzLRtwR+6d1Q/WE57KOl7gvxDXLpbhC2q3h+njIfq6hnXTSBu+NahTpSozw1rl7/aXMqR4E8CLEhHBVNIfiEXBoOYPjoBp0O68uGWUhTzYNciKPeH4UNBE+iK0W1LwGtEZwNQk+hljw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773428523; c=relaxed/simple;
	bh=eE1UA0pUxgGkw+6Gkhk+S2zsfYG6rBTRjix5aEi4x3o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OBgmoQbH26hz22maYmf7HaIjNpcKpxtPyp3uq29KDprm5Zo4Jyt63wAhHFsyu4L6ITSi+BvPQTCahYyeZjr3I2aWCwJV/htS2RqBQk84+KT03tYQ4DEZcZri1idpnEfHP1IJFDmP5zGf5PWhId5+CUstNpmNU+E+DUUTdWFX8kM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=myromyro.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=myromyro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-439b7c2788dso1608635f8f.1
        for <linux-sound@vger.kernel.org>; Fri, 13 Mar 2026 12:02:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773428518; x=1774033318;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N5PoPxLHzzOgQ4aQhfpRnXF2/cZz8Pig0x53dO4TF14=;
        b=DbgA3WYRFjRZ6+yCsxjVX6aLwqXO/njAGBHSXB9ZBvF8a5tvbB4pI3XV5pUwAqXm9S
         KETZNvAeN6qm51nMdSzlAwZ37QhOIQrbNebWz6ygTCh4toPUlUSvQu+tAxPGBlVhrTi2
         x2Mra/KwyLvrywZq+ZbJGFIkKgPkxktjyrbXXKAG7pcbKfvcl99FFjRuBETipvsRC1Y5
         cFTiqnc5l4FibnZGUn8Bh68DFTon5ea+AEqrsA56iZJkgn2lrSl5mfXp35xH4clljEsf
         +zf2lwbtRtcmllyfDRHTO7DtLvGheJeJvCxCfml/BJW7vCG9uaKx5ahMEaxioov5g8RO
         wjww==
X-Forwarded-Encrypted: i=1; AJvYcCVdxcys8+k1gEd63Aldo2kYdPqZaxh1MEXOVlYOCkSANVKOV/U4yZyvtNZH7oykeSMQJ3v6kYWi0YB3Eg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyMynAJNkoDE+aI4dhOaBaOO7HjsA42czlcDJwPSb9atJrWQzut
	9cE4ruhFMfsQJL7DicZ1lYimNbJRuxe4v59VbHvROOnYYl52xDvEKPR2
X-Gm-Gg: ATEYQzzZtFIYOiN7FbpssVS2CeLq9EtzDh60lvHetmA7/hkg1zHvYpOrD6m8qTxJfw7
	UdjIf4DIs/v1F6cPI9XG9QRRKRF2/wsjAGq0qPmgSKmjSZ/jv2I6QDCf1PIVXnHseKyPSG+ensf
	3lSdfdBmo8NSgxtr01v9pkbu9BRermlUdtG7t5uTFIsxqbhV+t/TmfmTgT/pJwaCla2N9PWMTVF
	hJilkDDwEz9JA2mKoUGPYU2pwPgQnLimUc8yqRgtHnG36xhdlvlUdw7xVEwyKw7ZWzWOHhyhz69
	NRRAJz3J2f/38BByV0nVghuxk4FQ+YOZuyaxA6kNd7htSqHnJgmFE+oLjC+z+h1Qa4EXT3+PqsH
	hwkVBg15aw1SjLVu9vFPQsgZwldnfPVQyJhMZ3vatjTDpKoAFGtw0MX95l1vjfB+G02XxxJ6hhP
	zcQ7jiqRuszjcbwuyVtqyrzyFgNUK9ATYpHZaROCZYf3L3BET5jxiUncW85hZHYE6/Bbj9btDa/
	ZN+TEUfaqFfvACcp/Ti
X-Received: by 2002:a05:6000:1886:b0:439:cb1f:44f9 with SMTP id ffacd0b85a97d-43a04dc3422mr8326692f8f.47.1773428517972;
        Fri, 13 Mar 2026 12:01:57 -0700 (PDT)
Received: from x250.speedport.ip (p200300c65f1d6aa7fd1524d9ec6263af.dip0.t-ipconnect.de. [2003:c6:5f1d:6aa7:fd15:24d9:ec62:63af])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe1b287dsm18811273f8f.17.2026.03.13.12.01.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 12:01:57 -0700 (PDT)
From: Myroslav Demchenko <myro@myromyro.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: corbet@lwn.net,
	skhan@linuxfoundation.org,
	linux-sound@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mirademche@gmail.com,
	Myroslav Demchenko <myro@myromyro.com>
Subject: [PATCH] docs: sound: clarify PulseAudio and PipeWire configuration description
Date: Fri, 13 Mar 2026 13:01:40 +0100
Message-ID: <20260313120140.45022-1-myro@myromyro.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Modern sound servers such as PulseAudio and PipeWire support dynamic
configuration, so this feature is rarely needed today. However, it
was useful in the past when audio setups relied on static configuration.

Signed-off-by: Myroslav Demchenko <myro@myromyro.com>
---
 Documentation/sound/alsa-configuration.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/sound/alsa-configuration.rst b/Documentation/sound/alsa-configuration.rst
index 55b845d38236..a3d8da5a3f6c 100644
--- a/Documentation/sound/alsa-configuration.rst
+++ b/Documentation/sound/alsa-configuration.rst
@@ -142,9 +142,9 @@ in primary usage, and people would like to assign it as the first
 appearing card. They can do it by specifying "index=1,0" module
 parameter, which will swap the assignment slots.
 
-Today, with the sound backend like PulseAudio and PipeWire which
-supports dynamic configuration, it's of little use, but that was a
-help for static configuration in the past.
+Today, sound servers such as PulseAudio and PipeWire support dynamic
+configuration, so this feature is rarely needed. However, it was
+useful in the past when audio setups relied on static configuration.
 
 Module snd-adlib
 ----------------
-- 
2.53.0

