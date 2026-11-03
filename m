Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793691654;
	b=bdLVvBvjFH6zI1rEVIrxqMusU3llGjDEA3iaDqP0SQ0kKuhgm6EUnkpy092Uw6cIZ7wG
	 KiHXmo80tqjgGzAE3/+bh3Ic4MwSXANoNWN+OBdjdS1ZY0ujmbDE6pNF/I1GSXdP4xQ6A
	 Ej5JZbU9OfSQFPDsg5Q5ZAePJLgwadSs89EN4Ax12HVCTIekaDdkxLIQ5koUk4pUKKzIm
	 rPbcecVHU+MYFaVHzMOOrJ1LguarqDn8qeYYrmTgl/HdYrnF5FGBrd+vXYiS3lN7jI8zN
	 +aD1Pl6Fx+cOInnqhK/rl9VdjFCuFG8ASO4Mr87M0Xb+C1/HMsXCoGL6CtjTraBG83g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793691654;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=OisQAWFcfOsetcPoB+5k+VxAvdJWHk9io3oDzNMx+0U=;
	b=jnW02pvmGF2veD9TRLxrLa/b83gfgnVaXVOGhsPZvbaa6qwazA2jcVEwaIXUq9q/1IzM
	 Q3a6DLyId3k4UUoPzj4jtfaCNOE3wZj85FxW+qlPaCb627ns5U3QdiwVP6AjGegpKCsCa
	 dKPMf2JUb/X2N3MvnhBnDkSFjFk3vut9jSgXZ1TVsarIFFRbQIc4yKh+p+RPECDJNnEjj
	 bZ0ZG/YJBW7QXeA3/iH9drRmN0VeLxaN0Vy1iCJ+fBmlOXtu6/ganwZyIajM+VO25rsdz
	 yzcKqp8UlKFaxO/knJBkfjC2tiJ/yNSycHmAnpuQ10LvEhfV6FFNOlPCJLxFNHNtgIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JYsZINop;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50EF3606A324
	for <linux-sound@vger.kernel.org>; Tue,  3 Nov 2026 07:40:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50EF3606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JYsZINop
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2e942864693so21864585ad.1
        for <linux-sound@vger.kernel.org>; Mon, 02 Nov 2026 23:40:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793691654; x=1794296454; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OisQAWFcfOsetcPoB+5k+VxAvdJWHk9io3oDzNMx+0U=;
        b=JYsZINopGAhJD2XdEHbK/2MLYlw2VflxRBMN9jc/T5vq4t3tl+DTLqNY/4pMuEkaJw
         1n2vhIVksD8VbMn1YoZR3tZn9ZGM8ZkJHje1vvsj+dz5o9hf+WBic4Dgd4iMvEjgOtom
         lO8+Bvgzfhsj4SYLVsAjRsPtJL/MmoYpaJNhCs+e7J+rIAcuVysHMsc3Y3Lr6w8M7W6Y
         8EQ+C0JVnEmJ4K2zoBwjZVSaN1oK6mTv2rvqQskFD/XTTlmE5hQlKVEwikveEeRah6UB
         /+c0oeAvBO3dpiy0ZmY/cb1pKVrx6zkVyeQYrtqLRQGBI2UlR5PLaAHdvAjcjdwiIoHV
         /apA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793691654; x=1794296454;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OisQAWFcfOsetcPoB+5k+VxAvdJWHk9io3oDzNMx+0U=;
        b=nzA9S83Qoco68/6luikiGNuUZYd7RkgCTDTGV6yaT9CJOsKNGB2wjU5X7kdrWX9fh7
         fDmAZ7ywIhnEPJUYKQkAgF7ltdOyGfb9K0p9JBQSx1mI0XW6KAQXpSegc474LnOqhagr
         V1vm8fLq/MK1u7FfNm1/yU0em006zFFLjKuFNv1RBripfIqw90A0zfq1sw3jLbUKvl5p
         QmklUFaCRlQ5f2PeZXsqR7Oz2aTwb6QnAeWFj6bL0oqKVeVyHDY6pCobsgZN0BiX8VAX
         GZIOgPn1lZo5vE+TV0OEt/0lMz0zOov0xtPZpihfcAf8JTGA6D0XWPb3ZRhxy7ctF5MJ
         bHEw==
X-Forwarded-Encrypted: i=1; AKwUvBzi3MgfajywVYheIGrY8q8uCh+8YPTsQH7leaxIN+kzO+Hcnrdh+Z5DXf3NCbhjR3GI7K80J56+35cduQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9MCq/Qx/k7kJUs6UTCk+g/opO1NqDQIyLKsyiewTf1bAtAHHoc
	lV95AD59iRfz0fhZTqB2DeVCNG+55K/wWR7pxaiGD6jOL2QJ9jfif+My
X-Gm-Gg: AYBFou3thndfGnF/KA9/jMOiNWQMoR2VnACivbzbES6+MxdxHNEeQ+nuo1pnKh1hEu7
	UN+cBhGxZq4AktmDmS54yX7Do4Hm9/wUtP2gn6wiH5Zmkbi9y1ZHiLwNhKA0tG/jVNVxagsfx4a
	dya2jclmEKvrUQ0kVW2UEGTm/cwQP8GRjMhdOfLahSsUL2SCqu09sh1/ZKUu6afRJkOu9pUIQHm
	mHij6uX8C9V+MYgCWfk0Y+zCrGh0IFjj2uGQhZ0DdkhiKU2iiZNlsVGLgUeeMjKFkA8JKM8R+o0
	tXPq1BU3d4og2Fe829RXi2QXy5SMg/O1K9U2qKWFuscRvfRFrOBVYvW3z6a71ZQsgz89xjG7QFy
	Qd6sXTmvfux9LZnoZgpP8UQ6GFyIuhU+xI3U0sZ/hIYEi1ruK6tM9uKv5Iw17ZQZScz9eV4QLtw
	E+kgNGmkLPixBFnCU6rLU8gbK8zLCF+9S/oAVewYaBT0HGRK4lteu9kMydgjaDT4Jnjjstr8400
	Y91422WsqmRTd8gkwzFooJVRvGCcOdae6j3nZX0BPDa7pF44exqCga141Gaucs2510O56k6jXvV
	F+oO9OkdLWkMNc4F57CfMtycfPiXErA1xaS2Hgu5CuiZLKC5WkgOc9AUU8Lt1Auw9I03iINUY1w
	nr+O2zlwsQX/dJXQTKMdi+rcEo/iWa2R6PG9Yn+4C8szov4qamPWJUIin4U2kAAjFRZr0VkKC/u
	o2we1++swl7u4qMq5+2NXeCI4O
X-Received: by 2002:a17:90a:ec88:b0:3ac:7556:8eec with SMTP id 98e67ed59e1d1-3ae89817e67mr10390517a91.39.1793691653576;
        Mon, 02 Nov 2026 23:40:53 -0800 (PST)
Received: from [192.168.2.34] ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c903d0dsm2956769a91.12.2026.11.02.23.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:40:53 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 03 Nov 2026 17:39:53 +1000
Subject: [PATCH v4 05/22] ASoC: ops: Introduce 'snd_soc_ctl_activate'
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261103-macaudio-v4-5-637484efe46d@gmail.com>
References: <20261103-macaudio-v4-0-637484efe46d@gmail.com>
In-Reply-To: <20261103-macaudio-v4-0-637484efe46d@gmail.com>
To: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 James Calligeros <jcalligeros99@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2221;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=5hdczG9NEn27ni3LRkyWf48VrrSCYHeqmgsUnxw+t7c=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkv+8/m/vxd8mT2w9wzJq9zHr7fds5GpJlvk/hZ7rBVm
 d+O7vvj3TGRhUGMi8FSTJFlQ5OQx2wjtpv9IpV7YeawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyMdYx0jBi5OAZhqp05GhrWvelleP2jLfaEW47KL67PTlYtSmlO89EQ8JZyOOl2/pcfI0MSmciz
 Bue742WSjd8f01zrYWO2W/i56zGoSMydD2E0OPgA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Martin Povišer <povik+lin@cutebit.org>

This function mirrors wraps the sound/core 'snd_ctl_activate_id'
for ASoC. Machine drivers may call it to lock down kcontrols
during fixup_controls.

Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 include/sound/soc.h |  2 ++
 sound/soc/soc-ops.c | 32 ++++++++++++++++++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index f6b98324f346..fbef941157ee 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -565,6 +565,8 @@ int snd_soc_put_volsw_sx(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol);
 int snd_soc_limit_volume(struct snd_soc_card *card,
 	const char *name, int max);
+int snd_soc_ctl_activate(struct snd_soc_card *card,
+	const char *name, int active);
 int snd_soc_bytes_info(struct snd_kcontrol *kcontrol,
 		       struct snd_ctl_elem_info *uinfo);
 int snd_soc_bytes_get(struct snd_kcontrol *kcontrol,
diff --git a/sound/soc/soc-ops.c b/sound/soc/soc-ops.c
index 497ea82c1778..1d60e290e40e 100644
--- a/sound/soc/soc-ops.c
+++ b/sound/soc/soc-ops.c
@@ -473,6 +473,38 @@ int snd_soc_limit_volume(struct snd_soc_card *card, const char *name, int max)
 }
 EXPORT_SYMBOL_GPL(snd_soc_limit_volume);
 
+/**
+ * snd_soc_ctl_activate - Activate/deactivate a control matching a name
+ *
+ * @card: where to look for the control
+ * @name: name
+ * @active: zero to deactivate, nonzero to activate
+ *
+ * Return: 0 if unchanged, 1 if changed, or a negative error code on failure.
+ */
+int snd_soc_ctl_activate(struct snd_soc_card *card,
+			 const char *name, int active)
+{
+	struct snd_kcontrol *kctl;
+	int ret = -EINVAL;
+
+	if (!name)
+		return ret;
+
+	kctl = snd_soc_card_get_kcontrol(card, name);
+
+	if (kctl) {
+		ret = snd_ctl_activate_id(card->snd_card, &kctl->id, active);
+		if (ret < 0)
+			return ret;
+	} else {
+		dev_dbg(card->dev, "Tried to de/activate unknown control '%s'\n", name);
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(snd_soc_ctl_activate);
+
 int snd_soc_bytes_info(struct snd_kcontrol *kcontrol,
 		       struct snd_ctl_elem_info *uinfo)
 {

-- 
2.56.0

