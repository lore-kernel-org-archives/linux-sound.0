Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794930007;
	b=lBMsya9Rzn3j/xDEqEx/zdbMnvVmkDJ5LRU4o1lQsRwENbZUIxaMYN1IEUaLzqdbHwuG
	 XFmE6M7T4zerSadejynLnIIpyBS3ErxkG361hI8B8YBSEBnyY+1NCxOCdRza73sZps22I
	 x7kPvCkRGSrR0YWC7zlTMWrGWcKbohCQVlmfm85tW2Dszsyq1oYuS1xqljeAYOrjZ1ZQM
	 hB4gyMaxPSP/AozeUWWiisZFnXzTH3D3v1iJE+pFeZsticBahHvMNQ0TM4f5B0Z+VIlB5
	 77hfW7TpSOKldacv4jW5VRQ3FEqmI0kgkCOa2sISgn05lqAy5v/Z36CSNyg1xP1Gvmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794930007;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Unj9HOPE9r4xn1Fl/kApFZLZDm7bfKMcYAzdh+ABMHA=;
	b=ACyCObAPCTzd6pTY1fqQWhlq8H9PKFQ4DuJlL5r9jdhZqCdDxbHXJtGMU2aEUevBJiKc
	 mF/nNmsXqc1uRbOQepANU+EGzrtcXZDCvqjgikfPeElSfmfRUg5Rm0uSouCFbSLUIFK1i
	 C8JUCGCW2gJ89g5Ui4uuEqB8aw807ScCT2Aq4ex2oGJX+fHDYQLMYGn6jso9G4DdRwE5U
	 yJp/5DzzMVgYkbWVXnB9QRAhdDBgPLlR6o4WX6s/J000MfrNzzDWqDo6ZWalst2Eigowu
	 YHu47+v2cXmYEAeZb4YBSiK/Zt1w2NAyVLeIejFuA5xRiuwYngPWeF8tDHuNtv5Znuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="qnui/jmQ";
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E3A606A31C
	for <linux-sound@vger.kernel.org>; Tue, 17 Nov 2026 15:40:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67E3A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qnui/jmQ
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso28414eec.0
        for <linux-sound@vger.kernel.org>; Tue, 17 Nov 2026 07:40:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794930006; x=1795534806; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Unj9HOPE9r4xn1Fl/kApFZLZDm7bfKMcYAzdh+ABMHA=;
        b=qnui/jmQ7ZBK2yUhzkT7buTqD6BP6tFQgtLPtN1Dzk4Zd7TJuQ+gsudAo4zOzJp5Sx
         hNZl5Ruen+SJ5tBnYnNGrDLqdMOeDZNDMpmcMTg4wsMoMsxwrfRJxxkqdP1qPJQidMPw
         9/wkIZHk7+IqkVBVFuDgCUyaPrWJ8FsdKMAbgUH+1gnRvlCOFqEZvhXD9aciHr/isyJz
         KaTxc8bOR9OHVjNgH8TOyTM+KZ2otNUsnG/L6Xl5HYpLduTi/3LCMfzrGvEXqiQhGU3e
         gK+gMIBC1/Pdl3YscP/oMH0SD7SEw015l1JAjoXWMyF4HEPbGlsqxw1POjINuyUwS/1D
         icdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794930006; x=1795534806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Unj9HOPE9r4xn1Fl/kApFZLZDm7bfKMcYAzdh+ABMHA=;
        b=P946hPABQ35EE9KcwktsBroE1HP+nlaWLB36Pr9gsoJ+AfKlkioSuaIOxVIcSEMvmN
         pbNwWyyGzKgdi9d+0+6g2EmZ+mHJgwYfXU4/0PIzSzJz1f4qhNutzE8HvGdui4geJpZe
         tDY3PCg4JQVPb69hkY+Jt3TTgr7ZMTHnsAApIG1ANpehXVEqEEOTz3TOebwt+DDfOtJs
         Z5gnsaPMJhqnPz1xLJTc+aXKWqEWJIjekQ9s4PxXeHqnfOKKZ5ZckwQ0eizipK9Vh8GV
         5Qkcq5EsKnvuYSM02m3kvBR0rOGHQp3UPQGVMWoUL/HttNeczHIJU8CuO3C0vt/7FwLp
         dHcg==
X-Forwarded-Encrypted: i=1; AL+hErGd5jfVeeMzAgib65JQrNYHhBiYT9Fp9+jje228/wNURfADAFXIoOMaBwL7hjLTmUWCKGLq/ZWHcJJLEg==@vger.kernel.org
X-Gm-Message-State: APuU4Z++m9SCuoWdpph8r1hrA0SnKmpKr4MaGQisJmB19ncR5plT0KMM
	/puBXucw6gIoR0y6rRkZ/njAN6qN4xRBZD5KwTTOraEhyOOtIFRMq1tf
X-Gm-Gg: AZFdTZem1cxp0OvqZDRYJBj0basMdK5WPP/SmQ6eSlj/TXkQGwaFfe5KMFC/H95W00d
	FlK8eVfoqwRMaA0GFPFWrJyS6xowIqImzYahI5e+k8zA+jfbtLn6cacjRoiEn4nXMTQZedbxpwC
	VO/5/9mJj3LjnWU0VL9fCjLW4w44D0aGl9FblLkKu1Gww2/lj6ltgozKqJnhk1DVpe+o1CwBz66
	ktN05EemgsHKJhkTHnBH717R2xDGdBmi15fUxanwkYiUTzXoVFCBdsKKR+QAPGcxVqcGn+ZIrsM
	9kSDYGtxzwAZf4FwLlSoou0xkIMxJCuAW1t2zKwdIaVYyJGDKVtQwln3YW8Lu57GB5cfM9Hu/ip
	badl3NgSWyAdbXz2GTXPUr1i6o4EtHwBN7XRWTP1dOr0QAlbLiTH5qThj0vZOdhxPg9KgUFcg3T
	AHk4LUK0Abf2toCKDVgYaEshttqLPPEIFFZMeUuYnOo2BFOrR9CN1xkflKq+7+w3YNLN+6noRvN
	rusVPQeRGcLqNTDImq3mq97m7lSRKGLxQ7bLk/04zKa4D65vmF9jNXXYesP1IXwnpDLriqf2UJV
	gIb0BPZKqjW211Zeneh0PjUrcepzGYD1+g2HtC+/D8IL/i/+ZJo=
X-Received: by 2002:a05:7300:e10f:b0:381:ccd2:f6be with SMTP id 5a478bee46e88-381ccd303d5mr2073471eec.21.1794930006414;
        Tue, 17 Nov 2026 07:40:06 -0800 (PST)
Received: from localhost.localdomain ([103.178.205.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3815045b90esm6542980eec.13.2026.11.17.07.40.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 07:40:06 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	sreekuttan2156239@gmail.com
Subject: [PATCH v2] ALSA: core: Validate card indices in lookup helpers
Date: Tue, 17 Nov 2026 15:39:31 +0000
Message-ID: <20261117153931.2784-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <87se0zxzyt.wl-tiwai@suse.de>
References: <87se0zxzyt.wl-tiwai@suse.de>
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

Ensure card indices are within the valid range before accessing
the card array or lock bitmap in snd_card_ref() and
snd_card_locked().

This prevents out-of-range indices from causing invalid memory
accesses in these lookup helpers. It also protects against
invalid indices passed by existing or future callers.

Warn about invalid card indices and return NULL from
snd_card_ref() and 0 from snd_card_locked() when an
invalid card index is supplied.

Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
v2:
 - Add WARN_ON() to report invalid card indices, as suggested by Takashi Iwai.

 sound/core/init.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/core/init.c b/sound/core/init.c
index d518cb838777..343c06d714c2 100644
--- a/sound/core/init.c
+++ b/sound/core/init.c
@@ -384,6 +384,9 @@ struct snd_card *snd_card_ref(int idx)
 {
 	struct snd_card *card;
 
+	if (WARN_ON(idx < 0 || idx >= SNDRV_CARDS))
+		return NULL;
+
 	guard(mutex)(&snd_card_mutex);
 	card = snd_cards[idx];
 	if (card)
@@ -395,6 +398,9 @@ EXPORT_SYMBOL_GPL(snd_card_ref);
 /* return non-zero if a card is already locked */
 int snd_card_locked(int card)
 {
+	if (WARN_ON(card < 0 || card >= SNDRV_CARDS))
+		return 0;
+
 	guard(mutex)(&snd_card_mutex);
 	return test_bit(card, snd_cards_lock);
 }
-- 
2.55.0

