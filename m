Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3BF32E728
	for <linux-sound@vger.kernel.org>; Tue,  7 Jul 2026 08:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783413958; cv=none; b=hcH1iW5Gth/pPhyBI3hZGJ5rc94RXT5xgC9mirN0UfA7vI73yniWukfkGF1BZaHL5FDQ+VnD3l8fye/+jW0cW4oJCAW3XmBdoco1hGh36UCFzFJOc6iXcBc+w03nArqfADVlCE2N1T3vcZtjuCEWBAJr0M0gujbIxw5X7a4aSZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783413958; c=relaxed/simple;
	bh=db5RJ2tmE6l/dT+o++KtVIbJ/fyYos1+O4TTVJb7K9I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bvcq8bkRWaDCfFZhXuIZ6gdGPQ2IJ2l4rnnwWOcRBAVu3oYIHsIUGGXlM6/WuzuY/QwXothvO5MEwPlPB7VPa5X0H5RlrXswq56ElByZuvQP5u68CI9tgS0agWt0dJegc4Fp9mHXt47Y+jSS7cYSDHOpRUVpeRhYwFzAfJL0+4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iGDo4eqk; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iGDo4eqk"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-384c94c9414so2130492a91.3
        for <linux-sound@vger.kernel.org>; Tue, 07 Jul 2026 01:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783413957; x=1784018757; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b1G/oBUGupjbaXr0RnxijMav+BBz6qUuhO3vayI0gEo=;
        b=iGDo4eqkAntrkFWriu5OPpGEqp6vMWTOuRqvsAof+naIHbgv+CxKn1MA6HKkgz6cEz
         S5Xi1fHXwhsmXrtUvPwGbfFwkAqoKZoLSrnJaMMdlEXgH+Lb+gRNBWXubGZtxGhnAZ/M
         iYq/+6iDY2x1twrwHjmp/wWipmt6WvYbSZUpRoOHpC7nyHdXAbPtQTjHla9tUF/hnMPo
         /8tD18d3CCSso74gSnoh5dSuquo4vsrpZ045tugcZOmGDplg4x9iw40x72i4VUxLkkAM
         jw1VEBXGJEHv4WFFpLxBPJlnNL3BeBj2pH8k5aMfpoKEiDZBxhTCDqcb/414g6w3gNoK
         gEpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783413957; x=1784018757;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=b1G/oBUGupjbaXr0RnxijMav+BBz6qUuhO3vayI0gEo=;
        b=o057TbSli7Sao2yesY0foMES4qDKaWi/Sx1bQ+Z4FTFlBi2CjnCaA6jVi9jlGNr3og
         5Hw3VgazwieS+sCkDcAUZLFVqtX3dKu95RetVZJB7S79k65eUgjpUmY+rRaCMr3bQniD
         oAJ5HSCKYdzpPyOM/HRJuXgrMPe6jS3sg9zPleI6ZGPiKC/AUwIa3kQ1KYYnafg2Dynl
         gkNF0IGqqzD/nmENEStIO8aPnVlDbN9ogzT/xZS8zjZA2RDTQbxc4HcM5C3Og9V6OSif
         91ZnvansBMbQl/FJzNlW9M/D5fdalDil8VPx6GMsoqj/yUfGuEtZlAbRtEjGsFXTzVur
         L/kw==
X-Forwarded-Encrypted: i=1; AHgh+RpB8+SUR63JQ0MCub7kmgiCOCovol/K8v0il/ku/bX0XUl2NXMpuVgjSDGWwtouceUvPwQGTz3iF2KiBA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd9X4lARQgf9FNiFvBQNfTN9r0izq/jA5gVYZktegJDxAskc01
	ugQApH4nxz0L6fpUuheWe9G3PIOoUWdv4AYQp6zPkOzt/vaNf7/Q+8Zp
X-Gm-Gg: AfdE7cmNnZsRC9ILxiafDYXkqCuhDX/IbjCGG+iE962VhDBN1wd3ay9pczaL2TTDHkX
	Heayf+g0N9+Ce2cpA3WtAz8EH1XZKwM40zQx4nl8gez9fIBdQi4sYXW5GIslSWCI7Xo92c1DAUK
	zM8bhLMKWFwy49DaBj9SeKq3rdBFuntmuYTn3pl1xtxh+vfgKTgylyjdXgkoLjD8SSCcrHtz4wq
	qJ3/udtwwQVno30QXMgPWLRu2MJ1WaImwVmH9od8iaBxp0nH6S/kdwakOJxbnQUwoui1rvcdlth
	5QPNQJI1wx+6Yo1EaVlEm1E7Re2rvAd7fhkcxt+naGq2AAMVuhO0xvYNcamtrsaNFD8cTvlQZd1
	3421LbESDIUSrbrUSWepgAd0wXPfO+9wZqQk18kJxmm45MTVH1+lrfUHdhyvc+bh/uTzQ5VMSIv
	UxrkQL+/iRgzql6mNbjmThNt4vRXlnb5cHdr4OrF1j8yEvgMU=
X-Received: by 2002:a17:90b:2712:b0:37e:2505:cde9 with SMTP id 98e67ed59e1d1-38755863957mr3950927a91.13.1783413956659;
        Tue, 07 Jul 2026 01:45:56 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d13fd7bfsm717546a91.6.2026.07.07.01.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 01:45:56 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Cezary Rojewski <cezary.rojewski@intel.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	cassiogabrielcontato@gmail.com
Cc: Kees Cook <kees@kernel.org>,
	Dan Carpenter <error27@gmail.com>,
	Cen Zhang <zzzccc427@gmail.com>,
	Len Bao <len.bao@gmx.us>,
	Mehul Rao <mehulrao@gmail.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 6/6] ALSA: pcm: Return -ENODEV instead of -EFAULT in snd_pcm_open()
Date: Tue,  7 Jul 2026 15:45:06 +0700
Message-ID: <20260707084506.718583-7-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260707084506.718583-1-phucduc.bui@gmail.com>
References: <20260707084506.718583-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

When try_module_get() fails in snd_pcm_open(), the owning module is going
away and the device is no longer usable, so -EFAULT ("bad address") is the
wrong error. Return -ENODEV, matching the other unavailable-device paths
in this function(the NULL pcm check and the card->shutdown check).
This changes the errno reported to userspace on this rare race.
No other behaviour changes.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/core/pcm_native.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 3462cd5275a2..4fe5fab8d096 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -2913,7 +2913,7 @@ static int snd_pcm_open(struct file *file, struct snd_pcm *pcm, int stream)
 	if (err < 0)
 		goto __error1;
 	if (!try_module_get(pcm->card->module)) {
-		err = -EFAULT;
+		err = -ENODEV;
 		goto __error2;
 	}
 	init_waitqueue_entry(&wait, current);
-- 
2.43.0

