Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B541336AB56
	for <linux-sound@vger.kernel.org>; Fri,  7 Aug 2026 11:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786102952; cv=none; b=TZop2WUC+75CgCl8TLSGbEVEN4aiX5LybtNwUjWKBE6ccpmidSTSjrfVgsrQH7nmVGe5zPp1YPaht6TubCFUR0oT31rqmX/aGQVakZdKZwchxuR/Q8goG1KUD3Nkb2htkIDvwNgolDwfrVfEyii6narjtulEhfqi/DNMF2RPPi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786102952; c=relaxed/simple;
	bh=CtXcqp2VDcddZCiaeG5iiX9IGilWKe8EeVBviDDfLUQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uzQtGgUriWgaOYkcefS+SM9+j16r18pqwttMlGIVvR7u+TLcy0KQPbIdprADXMUjGorMvyU4TamCTdhRnC5kYVWip/yRjkRnu0C1R8e2JwTZU97CKb5nJ+qydzqkwhcxAF+iKajO6F67tHzn9YLkTa1/cDfkds5QGutD5luIt6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rtLduqUq; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rtLduqUq"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2cc73e322dbso36744365ad.1
        for <linux-sound@vger.kernel.org>; Fri, 07 Aug 2026 04:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786102941; x=1786707741; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O2EtTMxFhhlsCKiXUEwoma4Bxj+FDVYnX2c+BIxaQO0=;
        b=rtLduqUqrqJyaYgdBCR4Bwxo7SEEhUn5JGd+GSUvjhBo7FCfrWB/kaPlriZBGNcG32
         FGTTt6T1gRUbvJLOIwBhxoCK8DkmXvFrCRyjMTqa66XoIMi2F6KtAb6lvpXF97sGaoWw
         sMlDXjXNFBAyuyIfYTUX4b3dTSZVC0/JS8iuwOg+iP01CSm7U4zx5aQWaOhlQtNuDQsU
         ikhk41EHhhnirdyBa/JD2Smn4kxCOhvlDxH8A6OUY28QtEumqg2rUGN5SNiz3QI1KRge
         lnzf5USI/5hdHahr9Jc7/U++s4Nun9aj9LpZn5PtfbZrLMPQN70k/Dw3GPQ6Xko35IlZ
         VP7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786102941; x=1786707741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O2EtTMxFhhlsCKiXUEwoma4Bxj+FDVYnX2c+BIxaQO0=;
        b=Cq27UlYReeU82XlsDMNc/QqNeyUJVAgWDX3wSIHYSAB2DB7js/EbNoh9TEsw64JTk/
         zdpF5b3rMHsO5Et8pq8yTkOHJhCOTe2Epn8Px8coQXGUVaD0Y3+yIYUgh1Lx3KdZYv3h
         ja1xNzmF3r1eCL+HTewINvtocJsyuqN06OmG4qFF6SNHQNtXUxAIHkFsvwfSko8Idrcl
         nIin1PxP8MwZRbLu90mCnlllOoZq+mssgR069B/p0C0DNkiYXM507izKoFg5KfwGCn5A
         4s9VvwUOt2RjX57rKqwv/mZilV//f6+4YepKLC6hn3rZWU7b8ximiNIrSo6AA/mTC/tm
         dPxQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpw6W1doApDakMif9Bwj2Zb4o/CqeDDFfe7BwEQnw6CMFIw6SmfejjJNEjSh4Qr02jrtNKHL6CVOdUuTA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxV0MKAFwttUNQ9tKVBgSYWL7c4u/2GtyYvKoIrAbhGPwnthePP
	U+vNp6mPz1xp93JxIScfFY6tFRXdk0ARgOPsk1d8h068OYh3nuyhmnsi
X-Gm-Gg: AR+sD13TXW4RwixS+RVTBNpvQVLWcT1ZZcJF5kChT8XR+0UZr943bDTTpWiOQVKGtgX
	DXnpiKJt13eJUXZ/4l/+DbISJJvAKrEGhB5iG/obJdRAiKtGxSAUl6mDKQKLq8QDiuXwSobJf8x
	wT6EEr7oXvm/W+muKH1joI/ZlXXpceLzbe7vsQjTQppS/QJxr8F4lehI4d8O+2Ts1gI5gjaMRyM
	kxR7ZaNc1W9Au0k5jUlnk+1izSWAi4M+SqKDFE1PIwzSobP86lMPUc4X9Z+lV9z6WQFgTbxbBC2
	lsENWx/w6p36OwZNP+tfN6vaEM9Oe49vg6wWTEDQmD9UVBwCFeljcffzoCGpZuJjkLfzUED9y9X
	ZHKIyc8lDwzhNdPMJbgBUuxMDnn/iBdOoAfbPmBQhdn05+/P8oKX47CD30CGCg9mGeYR4EtuY5r
	4FL3ItVn0HXkr0MjtUGwHPbrT2GwdPY9yw5ysa9Jaxr8EeKd+T2UcP3qoQMG1hjsKMEWT/oCE6p
	aRrD9HTvAc=
X-Received: by 2002:a05:6a21:685:b0:3b3:1b38:d9c3 with SMTP id adf61e73a8af0-3cb85e99243mr26526592637.4.1786102940555;
        Fri, 07 Aug 2026 04:42:20 -0700 (PDT)
Received: from localhost.localdomain ([72.255.58.127])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315be86d3fcsm6930508eec.4.2026.08.07.04.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 04:42:20 -0700 (PDT)
From: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: Kees Cook <kees@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
Subject: [PATCH 4/7] ALSA: caiaq: replace strlcat() with strscpy()
Date: Fri,  7 Aug 2026 11:41:36 +0000
Message-ID: <20260807114139.1661-5-mahad.ibrahim.dev@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260807114139.1661-1-mahad.ibrahim.dev@gmail.com>
References: <20260807114139.1661-1-mahad.ibrahim.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

usb_make_path() fills cdev->phys with the device path, and "/input0"
was then appended with strlcat().

Take the length of the path with strlen() and write the suffix at
that offset with strscpy(), passing the remaining space in the
buffer.

cdev->phys is NUL-terminated by usb_make_path(), so the offset is
within the array and the size passed to strscpy() is at least one.
The suffix lands in the same place and truncates at the same point.

Signed-off-by: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
---
 sound/usb/caiaq/input.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/usb/caiaq/input.c b/sound/usb/caiaq/input.c
index 8d924330c54c..fd4c80c7530c 100644
--- a/sound/usb/caiaq/input.c
+++ b/sound/usb/caiaq/input.c
@@ -604,14 +604,15 @@ int snd_usb_caiaq_input_init(struct snd_usb_caiaqdev *cdev)
 {
 	struct usb_device *usb_dev = cdev->chip.dev;
 	struct input_dev *input;
-	int i, ret = 0;
+	int i, len, ret = 0;
 
 	input = input_allocate_device();
 	if (!input)
 		return -ENOMEM;
 
 	usb_make_path(usb_dev, cdev->phys, sizeof(cdev->phys));
-	strlcat(cdev->phys, "/input0", sizeof(cdev->phys));
+	len = strlen(cdev->phys);
+	strscpy(cdev->phys + len, "/input0", sizeof(cdev->phys) - len);
 
 	input->name = cdev->product_name;
 	input->phys = cdev->phys;
-- 
2.54.0

