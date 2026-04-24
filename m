Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B714327FD74
	for <linux-sound@vger.kernel.org>; Fri, 24 Apr 2026 21:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777067419; cv=none; b=V/fQI87wXEfgMCTgdDWn5SU3X7s+Ao2a+TAQ+H8nBpfySkr157jNgCZe8G7mdfcdabnLJfXe+eDOWIdnFrHQt7A3TRVM2TnmWygvvM05YiIg7yG063681HpyuLzWAelMndWfc4/fzrcfJmShU92zTNln5S9pV4VDaYrzD/2HT4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777067419; c=relaxed/simple;
	bh=sOzXWXjps4JMTmPSEpvaGYrcfzquE0jv7XgocWHMu+o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=QbWtqb5IwAdqC2JBAEEaCGYZ5MHArNTDah0yQnKG9c82Y9SanjY9HO65+OiChl/X9SHEYBiHG0+996rM+3GOVB4JHbtldNEvYGVT1tkN2Y0eg+vrqVCslzvvmocjsW79s8+ewbuP4trrVoZoqdbtC49ARrZnHPf2GWrc8GDkAX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h/frN8ZU; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h/frN8ZU"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2ba9c484e5eso8792329eec.1
        for <linux-sound@vger.kernel.org>; Fri, 24 Apr 2026 14:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777067418; x=1777672218; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=K7c5cn3YaWCRG575DFbshGCJWY8c9pDATtWOqeL7XQQ=;
        b=h/frN8ZUKhdauSPza0lxH0uc96qPoTbHNYWW4VOnuJABqqdIfoxgupMA8cg5m8vUwX
         uxdc9ftaH8DQ1wQWlm32SBd/kxkB1KL7UUhpz5VLvWAoHIKGxqvesZdLZndALDczozxi
         0kmNX1zKzSl7csJEOmGbuWtQ3SwG5Zj5CTmp4NQwaTis1ThEVdJGVwx5ts/ui86SH5o6
         aZ+1kbVAf9XnmtEZ1PLOGLhiY75lylTjloPq1pAKNMkA8neleZGpFdk1++jM0eWVtVr1
         1pc9LpsMvCFVM3z/YUyrJ6vq49mFkAX/O3BGTiRlj65u2Bdysmd2hPtH6cLewn8HzVPe
         +e1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777067418; x=1777672218;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K7c5cn3YaWCRG575DFbshGCJWY8c9pDATtWOqeL7XQQ=;
        b=IQ+z6Do/Yy+9LXb7CLRI/Xi4nFVwkQ4gheQ11dS7qACpVh2CGEDQLhy5xxMDUham0i
         olcd8S6rFdq25iGGjsRYDrSX7drAyixKgW9xYN90rF6PcMlhru4h1fGdg2gpaPgOw3eX
         HkKjTsRNNn0zx9Yd2e9tE6KY2pBbyUn0jhn7asBJmBgTIK1ZzyK2Ty3b01gaR8m+zStX
         YN3/Eg+ONk4fLKpSjGlVHzUB2pctq+uj7mNMYsHFraqnraA+/Hnf4P5nL9hoS9qjonhl
         w0fcah+fi9oiCnzb06pEL/rdYeOF0us9XVh1ZFwdMtc4z7Kq5LDTgsf16VGx4b649Imh
         JyYQ==
X-Gm-Message-State: AOJu0YyBQ7j8XWwtoUaBO3MrHaE8SmM+sL4OFmeNlIc8Qi2T8jMJwmzt
	M2g2dZLCg2H1t57B3TyYcIkK3EN1oeDrv4o3vyMMYrOOsU0RXMpPZOIg
X-Gm-Gg: AeBDieuEw0WtJkYrkze8w9yxY68mIsEpj8ch9y5yF58R217/TcVLySFjI9g1irheJhH
	s2u5fsOtvc81+nsh9fASx6Zfdjdyz1CWvUwZsAEw5iwbVQnbfNZfH+mIS2Y/e0F3QXtyfEpMKJ7
	l03mwFVtItGX40y8lca09fZtix+ZKu7/4YbHeL/yc3SJoPiKoQ2w/jFpzxWwq+iRMVc0vg0RiVB
	m7C7OIcOeBO2HRKoNpQ7AWJ67Z2Z349GhAXpVK9k0Hsld6fKOpikXpqLnWry5zK4+EP5Q/QVapM
	AlL7Se/G/BMARfW8FCiwyyyeR12PMLlFSreAIpkgMvLqcycX5Oj64q4aC8iW65CIECjGDbdgxyd
	IZPm1UMfcbWVLIKnSz4ss1ABaoO37sy0EOhcIgTtxrVoXuhP6+qECa+VYvMm+LmokugXyNC/HJM
	Z/CT7QtxnnHgCwc1YMKxQIW6M2uZo0LhLVpH456PS1ava6bka8yh+udzTanB0m8Udg5MLHPNflo
	mQr4Bswajgxp42YM2ahImk=
X-Received: by 2002:a05:7300:dc88:b0:2be:171c:5048 with SMTP id 5a478bee46e88-2e4646cbd46mr16530489eec.5.1777067417797;
        Fri, 24 Apr 2026 14:50:17 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-87.user3p.v-tal.net.br. [177.4.161.87])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53ac84c38sm34723359eec.13.2026.04.24.14.50.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 14:50:17 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Fri, 24 Apr 2026 18:50:10 -0300
Subject: [PATCH] ALSA: usb-audio: Fix UAC3 cluster descriptor size check
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260424-alsa-usb-uac3-cluster-size-v1-1-99a5808898a3@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQ6CMAwA0F8hPdtkbssg/orx0I0KJQTNyoiR8
 O9OPb7L20E5Cytcmh0yb6LyWCrOpwbSSMvAKH01WGOD8dYjzUpYNGKh5DDNRVfOqPJm9LFr++C
 caQNBDZ6Z7/L65dfb31rixGn9jnAcH0X7XLN+AAAA
X-Change-ID: 20260424-alsa-usb-uac3-cluster-size-4b87d633076a
To: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>, 
 Youngjun Lee <yjjuny.lee@samsung.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1424;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=sOzXWXjps4JMTmPSEpvaGYrcfzquE0jv7XgocWHMu+o=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDJmvn07LfebX8jLij8IECwmd//zJfzcyFpXeKHIs2xbet
 63u9bGvHaUsDGJcDLJiiiyrkxZZ7ul6cLU+boUHzBxWJpAhDFycAjCRvQyMDId3Zmqvd/6j6JUd
 IcgU7M3HUr3qFPv7o4xTG56/KQ8PYmT47xShG2aw9xp3+yXXt7sXzbv0Qrl0wT2ez9nTDUW2PbA
 7xQkA
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

The UAC3 cluster descriptor length check in
snd_usb_get_audioformat_uac3()was added to
make sure that the buffer is large enough for
a struct uac3_cluster_header_descriptor before the
returned data is cast and used.

However, the check uses sizeof(cluster), where cluster
is a pointer, not the size of the descriptor header.
This makes the validation depend on the architecture
pointer size and does not match the intended object size.

Check against sizeof(*cluster) instead.

Fixes: fb4e2a6e8f28 ("ALSA: usb-audio: Fix out-of-bounds read in snd_usb_get_audioformat_uac3()")
Cc: stable@vger.kernel.org
Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/usb/stream.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/usb/stream.c b/sound/usb/stream.c
index 2532bf97e05e..6c51226f771b 100644
--- a/sound/usb/stream.c
+++ b/sound/usb/stream.c
@@ -1003,7 +1003,7 @@ snd_usb_get_audioformat_uac3(struct snd_usb_audio *chip,
 	 * and request Cluster Descriptor
 	 */
 	wLength = le16_to_cpu(hc_header.wLength);
-	if (wLength < sizeof(cluster))
+	if (wLength < sizeof(*cluster))
 		return NULL;
 	cluster = kzalloc(wLength, GFP_KERNEL);
 	if (!cluster)

---
base-commit: 876c495d412ef67bd4d0bdc4b74b0bd3d9f4e890
change-id: 20260424-alsa-usb-uac3-cluster-size-4b87d633076a

Best regards,
--  
Cássio Gabriel <cassiogabrielcontato@gmail.com>

