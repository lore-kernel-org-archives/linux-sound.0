Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD05376A0A
	for <linux-sound@vger.kernel.org>; Mon,  3 Aug 2026 10:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785752876; cv=none; b=KoIUXI69Vt6j0xx5kaHUVen5bBJooyqUEV9MV5U26rCQFyXFsWKLugbx8h5UIuWaZvQr9/cWSb/6eBcY+WGaEVBQhNwNhDmhnmVbi/wdQnOo5MdToF5cf4tZ0byky9ipH+H7tpw9efOCMUuccgiAqWDOVHiXcGXntKL7YeoYMow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785752876; c=relaxed/simple;
	bh=X68RKm/9fdeJwXEccZVR7JzpOmiWJ0q9ptWoak6vqn4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tBG6XIE+0R6a0kB6XAu/Aoyp+40vuRBxshTzZxbl7JBFSn1A2n/3yvmlnA4CRAhLOT7ipQ38eiz+ISlxfZBr+UvDr8LLQJDuFENStwQlF1LpKHXxJTAPXRuUBYpECLxJcvXLvNH44cRM821KArKY6CriUzUgdLmXRilgLJIMfHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ww3nvx5e; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ww3nvx5e"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38deea72eebso2999924a91.1
        for <linux-sound@vger.kernel.org>; Mon, 03 Aug 2026 03:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785752874; x=1786357674; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uahr6llljMVmHn8uPxQ6S4E36Neg0W5xSCU9DZat0tY=;
        b=Ww3nvx5e9W8EKLgkbnq/wtE/XNvlRAYKpVUc1TD/9q5rNwK7xti8i72ISQc0TUyXVI
         2b7tCb0Tg7zW7mco2tyCGHni/6FsDPnhwDu8ReFAo8IPJkMl0inNzJrLFBHCX4win+Cs
         eDx9CC9WbpIL1REhzYpH98OxvfJtUr0fiLxdCyvXKAabmEQCJt8lXBBcPn9NZRRjEQyi
         kYFqO6eW67jUO+T8hQCzwjF/eJWYWhV829CbGQS5qdF7jHI7wZ0hCcaOm38bW/RCsfdu
         gvvVTdXsgdlOBYeuSb7ldcuxoRs9lKbCtuhCC5u87lsilml4UuDIECQ7/tCGsFj3RlAo
         SGZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785752874; x=1786357674;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uahr6llljMVmHn8uPxQ6S4E36Neg0W5xSCU9DZat0tY=;
        b=fKBH3jMCtq3xNnAQvq8TMbDtzbhVut6EvfWaRfBdNfC5i0PNnGYtH950IjEk1yULu1
         UYOQOIOX2FBnUnJjSDO8Wx1NJEfXSkDkS9gXJ+hFzq7fIOL9nJTtyzcwMLfpmMPxG39W
         YVlHZ4iUjTR52Bv/Dbx7Dx6kKlIoT4KCxfMDawgqhnGGy2kz+Clx/ivcHoeyVcmWSb+/
         46kAiD3eZEgfUr8kf4IQ11/mqGjecK4aII7z7aS1qBgGD/kdoT8AE3QH4cwzWapEJvXg
         u8uWzHN47FJHukwP/dKVcIMwUw7rXwCTYGfyys1A2JY/Lu200X9Uq6iBP5N8ynmhOIve
         YM7g==
X-Gm-Message-State: AOJu0YyewqjP1/BqlR5kkABfJA7MMuTiniCX+7qvPu4fgjG/WQv+6S3D
	UdQ3QmGEBpuL+h2Lv+osfWAMfHOROeNCztkhHGpHGVbFAZ0Kaw1zLxZk
X-Gm-Gg: AR+sD10Dq8INzTpAUS4vwJdTytjKnSMuBirSuomZbtzwZrYVuEtcpbp3vtTXCxZ/JT/
	iP+RheSGzj8DvceTBgDOn43hmQSjnO3VRvH/C3yCQ7kNl6h501ZpiDWhiZ22NWsEzFW1Nr00G1t
	uezy4tMHAKDPOh4qBwinNYJlIIn4HdQRjgo9WNE1yGPqxk/Ca/60ecy1vD52iyTgT6NU7JvdC6G
	x70GdGXnoyp3cVxJiLvQE3Kdxinh/rODBE1jA6UUr2U5excqye3pnlWkJkJHd3QCAHp2sh8GJ6w
	a3rZJQXHph+vlRJT8j+FRlPE9aoEJ9AFUtMAFxHkpoPOqMUaWiuDGz+jiGLzc74hymSOG7IC+Rv
	Ee39Eb5Gd6oJDZhirZLAAZfy7bD5o05nUp/wFTuqqdcnc9bONArfECYFTazuqVwDiqB1648ByKs
	11O9otNboh9aD5EP5O7PxNQsZvrNX19UF5GTeSXEYVUCbEMPlyuGkZCAXirGzky7FQOL/37mNCa
	WvOqtITsIm405+pVYEnjUilbdNbIz2Gr5FzUMfFAVO449PTtBZ8ckGxmKyRj3D/5xw6uGjs1t5i
	qTqu
X-Received: by 2002:a17:90b:2e52:b0:37f:9ce1:cdb2 with SMTP id 98e67ed59e1d1-38fbc57a2f4mr8498915a91.32.1785752874309;
        Mon, 03 Aug 2026 03:27:54 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb2d19f7fsm3742924a91.17.2026.08.03.03.27.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 03:27:53 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH] ASoC: core: add snd_BUG_ON() check in devm_snd_soc_register_card()
Date: Mon,  3 Aug 2026 17:27:39 +0700
Message-ID: <20260803102739.55569-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

card is dereferenced immediately, so passing NULL results in a NULL
pointer dereference. A NULL dev is silently accepted, defeating the
documented automatic-unregistration semantics of this devm variant.

Add snd_BUG_ON() checks on both arguments to catch API misuse early.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/soc-devres.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/soc-devres.c b/sound/soc/soc-devres.c
index 718165ba84ac..3e946196022a 100644
--- a/sound/soc/soc-devres.c
+++ b/sound/soc/soc-devres.c
@@ -59,6 +59,9 @@ EXPORT_SYMBOL_GPL(devm_snd_soc_register_component);
  */
 int devm_snd_soc_register_card(struct device *dev, struct snd_soc_card *card)
 {
+	if (snd_BUG_ON(!dev || !card))
+		return -EINVAL;
+
 	card->devres_dev = dev;
 	return snd_soc_register_card(card);
 }
-- 
2.43.0

