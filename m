Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA8A466B72
	for <linux-sound@vger.kernel.org>; Thu,  2 Jul 2026 08:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782981935; cv=none; b=RMjUDbLDO7hlYsLKKsPizR8Ue2ooSCM2TdYgIEc5HtCOJemXaO2vS1jCGOC1mA+7i1YPEVB0NXtcasPkgwv8jYt7pxE8Wo+ZmN/iKmTY4yeumPDWCGsSWqyDx+dBHewEkdonpSuc8+XCF/Bk665pY6LPdA7qJrktLzM8VbNx9cQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782981935; c=relaxed/simple;
	bh=Yg2Tdgg2rvnH60uIpl0zMSHAOpQkuajO2/9N2N1OIE4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K80LNWAhK7Q83lBCfWECkl9uvFzNtbpPnTTxh51ZNSOBYSYKva3RXU4kpEmCOmTxEnKCeH9psZ6e09bA6/Fs11SIN38XRFFA0pZPBHYuyh2mnkJR3vAKZHQ2uQIE4vbZTbqDapkCgGuOj6izdheRloSMdUslttHv50y4OENeuxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ryO573so; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ryO573so"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-37dedd62b90so374907a91.1
        for <linux-sound@vger.kernel.org>; Thu, 02 Jul 2026 01:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782981933; x=1783586733; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nO5l0BZEJYRhzDOBjBYV6JTUzttiDF+S0SFOMJl3wEM=;
        b=ryO573sopNa8Y1DGm7BwwT3pL3lsClIqEtGzxQZ5jdLYJWdCEfI9f5fH832jAjQ9v2
         AXbhvsD7aWNyaYkfBDT4qP40cm66IEtWn8WXeqtvaPb+rWUqENXuVhyTxIwSBRe0M3Aj
         fVNrZUd45/nkjnWcnPJAmkI703T0rvJSS2pUOQkEIHIQututhVQVFsb31SZrefMqvx2q
         3CFZZ3wGRxE3xop3C/xkZO8TGBBWLU7MoWfu3DJCxgQqBaaPz++P5prGiAHJbZS7qRiN
         lUGl+KVGgHnwh0RXBFa+dQ5A2oTvW+bjj6QO0QGtedx2HLkm3dujtRMtQRsWzKShrV8K
         Rbvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782981933; x=1783586733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nO5l0BZEJYRhzDOBjBYV6JTUzttiDF+S0SFOMJl3wEM=;
        b=F7V+TLykJ7U3dT7guWaz1kihEgBBfTRBIOYVrJFvefgz7mIgXMEvrO+rCMf3k7BUHN
         MVpg22I3VN34UtO8N2Ir7/PORFbhPGELne1yxwALpjg4sMcWe2xL1n8AGXn7Hl3/4WSP
         cheTZxDNd6wvGB6KlDA7EaQjG0DyyYdnHi4zBS8ZjE/I8F3vXy32fQIF4M43cybKewXW
         m6b/RalLuRvQKcRyRwkIJ8qxiIDjOopMdubwO/IZcY0ssakGNrMZff6HuPp1w360FaAv
         eCUeBXIKgwK6uknhXIxWi5EoI9pNYYdB6XWbm0KTj/9VEaQMoFo5Mn91z9jRErEy8LK2
         Vh0g==
X-Forwarded-Encrypted: i=1; AHgh+Rqo7mF8/LIVKncADJyGX8wIgm7mG9FdL0FHDbCtLiwYTP7GMYWLdKZ4nTqSpz1JksuDNSo30ZgwaPLmxQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxv0iFrzbiy0W6ulqe6QahTWNqjhl8/HJ82IaQAOaRddo8b/2qF
	G1stfjq+OuQVNQApCAFlF89M1M43Ci1A9EPKteQ8iqFBcV4WYrROVRIj
X-Gm-Gg: AfdE7cl51nq+0qjcPbsfUHVVp62ILw1RQNcwyE//b+bMkloz83LMjwCM4LueV0bzfjO
	2/RGi6oPXdtzgrC6wH66t8mMIfRsyC2aRV3cJahdEkkIShQMoC4vt0uWKctyH08uwfzKP2xL407
	jnQUZm3/Pkrgz5VxcXghty4YavyVXbCON4zsP+tGYtTI3wT8v1PiPhII7IU5s+o9+UYUsWkBe0T
	AioFUKZaUNRb3nHFKNon3JyqjseJQ3O5xazJZ60bQ6bURhd4fuPvk1KRKVxORz7zhZfZ9CFB+BY
	MO6e/y+cjIGV1JKZOmn+1IEC2meKDz/MOJ/22ys+rn/ghKmIZ4XiiZoqnPFRr4So4O7bnm1KDEb
	KkSrIAYF4u9+FPa2cB+WTrmH8KdmSYs3FjvYLzsxKQ8iFTYzpHk9X08JFvD/Uawr1t/XdeSgCd+
	3o49StLVnhfRWZss+1LmvMYkTI3qa8Dy2NU+TF9+64a0dSA2c=
X-Received: by 2002:a17:90b:4b87:b0:37c:8df2:9f58 with SMTP id 98e67ed59e1d1-3806754f735mr9236343a91.7.1782981933060;
        Thu, 02 Jul 2026 01:45:33 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-380e18fbdb4sm693955a91.17.2026.07.02.01.45.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 01:45:32 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: cassiogabrielcontato@gmail.com,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Kees Cook <kees@kernel.org>,
	Ziqing Chen <chenziqing@xiaomi.com>,
	HariKrishna Sagala <hariconscious@gmail.com>,
	Dan Carpenter <error27@gmail.com>,
	Cen Zhang <zzzccc427@gmail.com>,
	Len Bao <len.bao@gmx.us>,
	HanQuan <eilaimemedsnaimel@gmail.com>,
	Kyle Zeng <kylebot@openai.com>,
	Dewei Meng <mengdewei@cqsoftware.com.cn>,
	Maoyi Xie <maoyixie.tju@gmail.com>,
	Mehul Rao <mehulrao@gmail.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 4/7] ALSA: pcm: Drop redundant nonseekable_open() return check
Date: Thu,  2 Jul 2026 15:44:41 +0700
Message-ID: <20260702084445.519669-5-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260702084445.519669-1-phucduc.bui@gmail.com>
References: <20260702084445.519669-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

nonseekable_open() always returns 0, so the error check is unnecessary.
Remove the dead error handling path.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/core/pcm_native.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 7dc0060617f1..7032f329e827 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -2873,9 +2873,10 @@ static int snd_pcm_open_file(struct file *file,
 static int snd_pcm_playback_open(struct inode *inode, struct file *file)
 {
 	struct snd_pcm *pcm;
-	int err = nonseekable_open(inode, file);
-	if (err < 0)
-		return err;
+	int err;
+
+	nonseekable_open(inode, file);
+
 	pcm = snd_lookup_minor_data(iminor(inode),
 				    SNDRV_DEVICE_TYPE_PCM_PLAYBACK);
 	err = snd_pcm_open(file, pcm, SNDRV_PCM_STREAM_PLAYBACK);
@@ -2887,9 +2888,10 @@ static int snd_pcm_playback_open(struct inode *inode, struct file *file)
 static int snd_pcm_capture_open(struct inode *inode, struct file *file)
 {
 	struct snd_pcm *pcm;
-	int err = nonseekable_open(inode, file);
-	if (err < 0)
-		return err;
+	int err;
+
+	nonseekable_open(inode, file);
+
 	pcm = snd_lookup_minor_data(iminor(inode),
 				    SNDRV_DEVICE_TYPE_PCM_CAPTURE);
 	err = snd_pcm_open(file, pcm, SNDRV_PCM_STREAM_CAPTURE);
-- 
2.43.0

