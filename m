Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794912178;
	b=EShVuCx05puXyrFn2yE6rmdQx8HxLwMNBQzJwnYObjW/SoGLkxJSl9Irtq4OR2LgOPFK
	 yYGDJT+Cj6NI2ZyAVLcPCnsOFgsL06g4tRyzL3/b+Y82T6I+2tI1u82f7Cyy23Es7T/l1
	 r+bQLxWoMPZDd9Zr6GMkc26+tc9zwgX/E3F6s2p+ewlzJBFJgD3y26XiRqrS9iYtJIQHK
	 Y3fcEL048GLfk+t62wZJJRPy9qZudNSZ4G94iXYXO2UXko0ygv2k1Dz52XZ1Al+JuN4UZ
	 qxxgWcMDvDbCYZ2FvOIiJwdyqgZgWQDO1Na+vQygQ5PVwW/07N+m1AUuHbSG78Lchrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794912178;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=U7SopeEUa2pillwTN6+8DDNBymjaFoXaDMJYKKpBO1E=;
	b=PLsd98cJTaD5L717vLhe3j1f5VfdCtsw3SvgtUGymzE4jkdv5ooE+bK41DhmfOVeNwlQ
	 3GB2lk0DEmXmyY1m6fCuSPRr++dDXvQbXJ1vKMHSGomZMo3Lmb/vHH4VGpaEqsDHj5d9D
	 i4sszVV4pqfYDuCF20WQDFXOF1Qq66l7EXKNYdZ8i2EYB/mhSQQVdOGKspOwcsIp0gHoq
	 gp77mS/uq3LLMlcMBWXRX8tO0Cp/8dO1BlwsPsvGBByCzBgkJkwPzU56CpJqXQnehaGrc
	 Q5E9fQXqr/sKVESkM6vgdXG0O8sH5P9K2WzhLqya7DERlyyyloLUhF9epIYLH72pVtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Da9aoFN6;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2018606A323
	for <linux-sound@vger.kernel.org>; Tue, 17 Nov 2026 10:42:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2018606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Da9aoFN6
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-36e795af1d4so567848eec.1
        for <linux-sound@vger.kernel.org>; Tue, 17 Nov 2026 02:42:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794912177; x=1795516977; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=U7SopeEUa2pillwTN6+8DDNBymjaFoXaDMJYKKpBO1E=;
        b=Da9aoFN6YS6i7RBLhBqjrBXsNaYG+ifkgQr1kYPFIJw6km5Fv51909jC7gJz0uHoZ6
         wQLMIiWKxzr9Yn4tID1WHZZa91/p4nCA2+OQWfLSicq0JvRb2fTgsAPAL0/JY+JybCwh
         fE+SvWbxl5mK73qh14OhRgDA51QnPFPxr5Ci0CmenYQVR4Vf/L/wrKFknv97SabmJJEV
         CoRR49d03yPNDsq94TvrxwC3yezvZsL9WkHrk7I/OlbNOavUj8EqCxE5mVSON0I3NGpB
         otV2iRh792qZNdXZm2rc8xomEXfC3tlSNT1S/GKxbTUX6w5rVUSeMfo5cv5aYjAiY6HF
         UKZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794912177; x=1795516977;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U7SopeEUa2pillwTN6+8DDNBymjaFoXaDMJYKKpBO1E=;
        b=Ss8y3paMpY87k/A0mfeIcZiBJFc04N/0QFcxvfQBP+l01ICT+y52/Tm4NPH4w/dpax
         j1/7rcacSABY9U+p46CKCjZZFSfNvV9KtIjxqkNe4tMImjdQtc1BGv9wBxXqVgTKOp0W
         fx/mPt1EBu2Th1KgKywbVVgYirU9d6SJXX1Zxwlr1Cq3a+ObjL5231asqLU2Uv6WYLWa
         8LjN/KyrNSbtQQjwAzm0+sseNn4l7jEchlnxCwyhXcsrLjNdqYF4tYRB1cj5zEJla5co
         EiFieTgebpiEU9eI3El0PgM20Bac0LUicgbMoCTS5xlgift6V6tb+FbKwqwDLBeXQ5mE
         BjEw==
X-Forwarded-Encrypted: i=1; AL+hErG0SplsNsTmZUq51Co+4HIX0Y8PKwe5ksMGz2dSm22nk6DLwtDasQ5z++kU6wc+/bYY41c87PT+3ZAt5w==@vger.kernel.org
X-Gm-Message-State: APuU4Z8ieiCfWnkCy2FhffAI96iwqxZy+ztuf1MSF4ReVukdxvy5GBdK
	g7PmChdQEu9fEiq2B5CNLu0J4DFMbJmr21TtrMzCMrjf2f8pkiafHyA/lv3lnpJk
X-Gm-Gg: AZFdTZfD9nRhLH65UcSt+Kh0qEeSM99LrOsSC6R+G4fc/xsEsLllzEp3Emv6vYexQua
	prUSS5mrFmuoxx/0lVAEqtW5503FC6Zmt+/YzjJvRUW7hnMvhJa/4y2yYESGfXzgm60rlOzZ7WU
	rDdckONbmZ1zTdgL2rDtqIWXRN1zN8j1Xl6m7Jd9AM+d2nnzHTVczBa1Q5sQzX+oWUuVFEVhuF8
	fK7WNKPi4KLf0GHoPs/EpyOJJ7mXhIVb23Wr2/W6JTsCbsQ2dp8oFW67/aoQOFYo8lfRCVKDORL
	uZleDVP3G0WsqkFKW8gW4SwQOMGAu5kDCa4s8jcvmVwREiX1LvJWLPEMFh4W553Zf8dxynvXtWo
	PGeAlh7Klrb6BJfIV2egE2z6qrcOVrve19IpUu2dH12u2XT+HFhNJKV5cByr/loE5wBFHcONCkD
	MW8CkxahLg20sYskr/rM5/Vty8r4wnbT4SIKo+2L87yYahojIAuXUQ10G3ISFMVoh09KFY+myJM
	26RLTJ6qAZVwLII2oCgHs106AvHw9Jd04z10d6YLZVwXH6Ex+nfejh+rFy5Ux/Zs569enXZJwIb
	xZfBjrSocrW8oUT+1o9lHbB1F1K8o/W/9QCpW0vJTLi9dZhOjBs=
X-Received: by 2002:a05:7300:2146:b0:375:6fed:8e71 with SMTP id 5a478bee46e88-3810e419ea7mr3061483eec.7.1794912176912;
        Tue, 17 Nov 2026 02:42:56 -0800 (PST)
Received: from localhost.localdomain ([103.178.205.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3815045b90esm5069981eec.13.2026.11.17.02.42.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 02:42:56 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: perex@perex.cz,
	tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Subject: [PATCH] ALSA: core: Validate card indices in lookup helpers
Date: Tue, 17 Nov 2026 10:41:54 +0000
Message-ID: <20261117104155.3080-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
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

Return NULL from snd_card_ref() and 0 from snd_card_locked()
when an invalid card index is supplied.

Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
 sound/core/init.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/core/init.c b/sound/core/init.c
index d518cb838777..f79b63c69a49 100644
--- a/sound/core/init.c
+++ b/sound/core/init.c
@@ -384,6 +384,9 @@ struct snd_card *snd_card_ref(int idx)
 {
 	struct snd_card *card;
 
+	if (idx < 0 || idx >= SNDRV_CARDS)
+		return NULL;
+
 	guard(mutex)(&snd_card_mutex);
 	card = snd_cards[idx];
 	if (card)
@@ -395,6 +398,9 @@ EXPORT_SYMBOL_GPL(snd_card_ref);
 /* return non-zero if a card is already locked */
 int snd_card_locked(int card)
 {
+	if (card < 0 || card >= SNDRV_CARDS)
+		return 0;
+
 	guard(mutex)(&snd_card_mutex);
 	return test_bit(card, snd_cards_lock);
 }
-- 
2.55.0

