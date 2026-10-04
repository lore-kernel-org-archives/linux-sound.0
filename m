Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DC053F9270
	for <linux-sound@vger.kernel.org>; Sun,  4 Oct 2026 06:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791093933; cv=none; b=YM3hbSqOJGFf+c32RTBNyMnoqLKPjAKLqMql9Sb0hYQkTAgfjj72A/wJYzKDsHeqKLhKz6yJj+3ZnvtAPGxARZcCY+Ik+ywXWoatH7MrMmmOBAhM2hNe7GT27Yb6vMpWZ9wFdjUHvVcZLmzj37JaN16QhgLnjx6ANoYoE5SQMjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791093933; c=relaxed/simple;
	bh=0PoYA2wCuvvrL2s4prwBCoBYU9Ml+9hC3D32pPQSHes=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dV6Xeud77ccpcuxONum9jjoCplEqWbE9ekAEZ8qXYElbiAg1aIt6+/1gw8SvpgTToJvaNTRrLiFtUY3vvY5tgbIHM+PzMyUqFrxQUpP9JOw7q63CCqk0g0hn8xeh3IinSmximPRdluVBtvX2rS6u65nv70SNC+I8gQXEeERYOO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k0UoRaji; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k0UoRaji"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4aa0f1766so343773a12.0
        for <linux-sound@vger.kernel.org>; Sat, 03 Oct 2026 23:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791093931; x=1791698731; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nB/FQkcwt3QBSTG/xH/tXn+vR6SVQzg6Sj+xR8pJscw=;
        b=k0UoRajiRxYN+8yrZVO9bQ2RpJ/RDSnqlFSRz3bPVwHCcKtYPPcE1/aCyMzRL/j18G
         pkpTEkKL8ajzGJDxq5+UZrQOXMjryUldbuw7LOO55V6GT3pDI875/BKVTAjHcwpxx6Rq
         9Ha3v68geB1+7htzpUmuRokriw0PRWsZGhOg4i3nWQMf23JWfwiPWoyR0DHoVN1Ic83a
         Z4ptqcNlrtVidZCIRB3wJSByJ3UBGrO/qxtsaz7AnSk2srTLh+g7+0pJ0nn/DPtwTbxX
         84FYpc2Wg+SD3JM2DP+mw8JUwiXZN9AQRvOBtDYWQ93pqmdFXDKWXAJ1r11syN1Grp3Y
         TGsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791093931; x=1791698731;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nB/FQkcwt3QBSTG/xH/tXn+vR6SVQzg6Sj+xR8pJscw=;
        b=TfEM01xvfU5t8uknCX030p4hw6D4SwZXxRk+fw2/NM6YBPSGD6ZunGTmdbLd/jVIir
         2UTWS0XfRslW5CoKdWh4VostohqRbPdW5MOLg15SxZXFrL/MvpzuZnV4OtfbR4Kdbfw+
         ymWzJpUgQEd0/Ldq/XitBAW0Oc59aesvKcn2njfh3sxL1aqqMKNWISbmc5VMA3mRzgY6
         VrAcIK2Yv8JWZK2LFpvHX/3IuIu/rrCT3p+Gx9N5FBaG+HdQ0pkvLCipEBcWRLjzgX3t
         1qAND463gF+WNYiuIoDXuNh9qsw0M/VnYYngmVoB29Q5HgcsCarJIHeJdL5LOi5mTUM6
         4Wrg==
X-Forwarded-Encrypted: i=1; AKwUvBy8lHKWnFijBM1KyTZuLZyLvcUcPzRGgpdmCMJropT5n2ozIsTD1/B2GJeeO2yv8k/Rm8e188IKspcZwQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYL5JRr+6iAPam0AxmNlLQjUIS7k9oxRpYy31AchdcAjKBRHzMIx
	ZeTJQOpY9Sp9cl1TzsR2kQ05jqv8pFuS7uCqs7IsfF3OZDnZflWB+47G
X-Gm-Gg: AYBFou1hRzIjwne9/rFUrMrsSj9NxAzJat1qupLVZjSiN3ecJTDeIXqMdFZlgrBGrYH
	TAGqp7Zh7XmyRQphrkBdaVje9KU8gCu2e3K02RGdKGvzGmlxTr/uJ8Zd/B+X5NMDmuGQ78qEV+2
	KIChzU1rNpC3UOy14sdH/R50tnRrftIdBu3059Kb405riZ0f+iCpic4xaNqFi4cSgBheqUOEXaB
	jTZKBmiH6MDhnwxM7oME46Vn+26gd8z+sDvR3dpKDq2WsXFcDWIcgbkdJeUIEj8flTgpcbh5/rM
	rx4VN7DxiC1Hj4JeU48RDgzCIZ9tliTYmv5uL4VZbM0aq5wrQDntvTrm5Bv6BUsgxcpUhCVDKVL
	RuepAFwJKWb7t/MuHgGwWw/JCkPlGU9362cxa0lO7yLPdgiArHSekIDFNsbcWDb8n8ATa2B+Blj
	I7kUjMoFgKT4IUCHPp53vxA5PZ8Wi+ThvH9xT5KwYZLVF4PFTOBDb7xLOtURgZQOKsZJC6UBtO0
	/bd3JV+fBeJ7rfEp3bPX03+zHs4SxQACxLiRL0zt3X1Z2z0LXYoeVVhYU1xVeZhGXGpFGG6E/GG
	NbAfZsgiFzyNfRIjw4tgxZjbsrfwKtyCDayOEJnkUX7mYMU=
X-Received: by 2002:a17:90b:1c10:b0:3a0:3673:dbc0 with SMTP id 98e67ed59e1d1-3a6ced24dffmr7196757a91.49.1791093930602;
        Sat, 03 Oct 2026 23:05:30 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78d4a869esm5844094a91.2.2026.10.03.23.05.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 23:05:30 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 04 Oct 2026 16:03:34 +1000
Subject: [PATCH v2 07/21] ASoC: ops: Introduce 'soc_set_enum_kctl'
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261004-macaudio-v2-7-7b47ed6335a8@gmail.com>
References: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
In-Reply-To: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
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
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2980;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=V04jnN0BX/eExW8BMvJ1EKB7GQ8dS9/fHjbsufpPsJ0=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkH3+SeP9XEmjx/guFTlbP/bIJ2rTjL/WTnSfEZCmw/P
 y19vanFrmMiC4MYF4OlmCLLhiYhj9lGbDf7RSr3wsxhZQIZIi3SwAAELAx8uYl5pUY6Rnqm2oZ6
 hkY6xjpGDFycAjDVoe8Z/vuePN21q59JkvO12slnkrwfTh72P6jFlRZ0v4Vx55PDL4wZ/grlryn
 T7nH77WnauePd1ue/z2nyi7CuluJMFOmuXr8gghsA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Martin Povišer <povik+lin@cutebit.org>

The new function is to be used to set enumerated controls to desired
values. It is something a machine driver may call in fixup_controls.

Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 include/sound/soc.h |  2 +
 sound/soc/soc-ops.c | 69 +++++++++++++++++++++++++
 2 files changed, 71 insertions(+)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 973ffaf6f060..f356b553227d 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -580,6 +580,8 @@ int snd_soc_limit_volume(struct snd_soc_card *card,
 	const char *name, int max);
 int snd_soc_deactivate_kctl(struct snd_soc_card *card,
 	const char *name, int active);
+int snd_soc_set_enum_kctl(struct snd_soc_card *card,
+	const char *name, const char *strval);
 int snd_soc_bytes_info(struct snd_kcontrol *kcontrol,
 		       struct snd_ctl_elem_info *uinfo);
 int snd_soc_bytes_get(struct snd_kcontrol *kcontrol,
diff --git a/sound/soc/soc-ops.c b/sound/soc/soc-ops.c
index 4d799c5e44f1..b1eb74e24193 100644
--- a/sound/soc/soc-ops.c
+++ b/sound/soc/soc-ops.c
@@ -505,6 +505,75 @@ int snd_soc_deactivate_kctl(struct snd_soc_card *card,
 }
 EXPORT_SYMBOL_GPL(snd_soc_deactivate_kctl);
 
+static int soc_set_enum_kctl(struct snd_kcontrol *kctl, const char *value)
+{
+	struct snd_ctl_elem_value evalue = { 0 };
+	struct snd_ctl_elem_info info = { 0 };
+	int sel, i, ret;
+
+	ret = kctl->info(kctl, &info);
+	if (ret < 0)
+		return ret;
+
+	if (info.type != SNDRV_CTL_ELEM_TYPE_ENUMERATED)
+		return -EINVAL;
+
+	for (sel = 0; sel < info.value.enumerated.items; sel++) {
+		info.value.enumerated.item = sel;
+		ret = kctl->info(kctl, &info);
+		if (ret < 0)
+			return ret;
+
+		if (!strcmp(value, info.value.enumerated.name))
+			break;
+	}
+
+	if (sel == info.value.enumerated.items)
+		return -EINVAL;
+
+	for (i = 0; i < info.count; i++)
+		evalue.value.enumerated.item[i] = sel;
+
+	if (kctl->put)
+		return kctl->put(kctl, &evalue);
+	else
+		return -EINVAL;
+}
+
+/**
+ * snd_soc_set_enum_kctl - Set enumerated control matching a name
+ *
+ * @card: where to look for the controls
+ * @name: name
+ * @value: string value to set the controls to
+ *
+ * Return 0 on success, else error.
+ */
+int snd_soc_set_enum_kctl(struct snd_soc_card *card,
+	const char *name, const char *value)
+{
+	struct snd_kcontrol *kctl;
+	int ret = -EINVAL;
+
+	/* Sanity check for name */
+	if (unlikely(!name))
+		return -EINVAL;
+
+	kctl = snd_soc_card_get_kcontrol(card, name);
+
+	if (kctl) {
+		ret = soc_set_enum_kctl(kctl, value);
+		if (ret)
+			return ret;
+	} else {
+		dev_dbg(card->dev, "Tried to set unknown control '%s' to '%s'\n",
+			name, value);
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(snd_soc_set_enum_kctl);
+
 int snd_soc_bytes_info(struct snd_kcontrol *kcontrol,
 		       struct snd_ctl_elem_info *uinfo)
 {

-- 
2.55.0

