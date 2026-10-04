Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 138C03F412D
	for <linux-sound@vger.kernel.org>; Sun,  4 Oct 2026 06:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791093926; cv=none; b=jJLh5dK+aAobFijx/kjWmVcVZvFUUt/lhcIjBW3Ey/7FmGQxN8Nn7+/wtBSlNuNbJSZPeTPorB6DcerBFrrdvPfnEdznIANDUNWLbT1YoyULG5YNvt1J1MpwOk09gd3nGQHT2SjiyPj9EVoXYQKPCOPmtOPCZqB6VWQEj5LgGsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791093926; c=relaxed/simple;
	bh=bOXCUxTyxTWEtFNaPQu+KzP3eRoOn720K7jWZmZOCJk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z+rl5heWBemPtARCpSJrWBsFokBfRdXFDMJYFtwksNHUHOHYZtwBMcedTQ/ijCFXwcOsrCWJiX7lN2J/WV1oeR2Zm5Ny3Xch/70+uIL7Yom7P5LygSc/CQjnhAgdfIGRE9F9E+JOh6hL+0xd83J32Kf+0FOZG2z3uF5eW1f1XXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n/XOLgyK; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n/XOLgyK"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-39b2ad83dc6so458836a91.0
        for <linux-sound@vger.kernel.org>; Sat, 03 Oct 2026 23:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791093923; x=1791698723; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XtOntM+DwPje//4QSDQTMYk+EISPO8l4FquPrYyAROI=;
        b=n/XOLgyKHNvPQVifsUDlKXoe1GSfg97ya+w0BVHztWCaSSBr1FSAZXnWX27F/z8meb
         SBTbi2MQRufRmjZKXfXejG6nyOJZlcTHLwWd/uD0hs/qtWf7b/anr7vHp1M5CHLp8ala
         xE9hRPZsIiSiRNexUvHX7GkrSKwCmBY2Zzy6m9rWnYJNyCwlooskxnowOr/NsXq3F+UV
         ddcxdoA6bZGH0HzVP/udyG0iI8ZuPnrAXzCnsGFWHhBHiVB6Op/Od4zX8aQ8v52jB/MO
         463u8V9g+08jJ9ixw7J/HPlw1tgIvU2Evl3eEUM7TC6VM4Dajt7XhyoVN0aJO33l6JtW
         vfmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791093923; x=1791698723;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XtOntM+DwPje//4QSDQTMYk+EISPO8l4FquPrYyAROI=;
        b=fdFvZ+9orCr4BD49KeRuh2fp1zrBM2952BbBtdLcluQ/QE7LztNXuziWnefxNCikxb
         Oh0zJ4W2U2QQCpjprrJQl4TKjDC3cCHfPfPqNJP+k89WQVih0hdLJX0ZhFXkgGkZke9V
         ytQRTd+0MY+I9II7mwz2PWpCvesD//K/Jgc9quQ/HDpoyz0pTJYWtkubu0tA/gwsLIpV
         No/HIVb92ThH7cuXexARY63yx3MIKPJIne6CnFvBzhWHNN3BSNpDU7yAA3a3sQAF1MNG
         Gji+Yjm+UpnnHxtAHXfHgk3IvhG+4BKtXwn9B/XOHipT9X0mMATDjels7m67uypR4Tjs
         unIw==
X-Forwarded-Encrypted: i=1; AKwUvBy8OEHNlxPrbqbo9Vkxt4XekvzRK24RCbWI+3emgfymLlqdEhVTxe9YCtM4b2BwdQVpkG0HBHnP388vJg==@vger.kernel.org
X-Gm-Message-State: AFq9FYIuVwm1vEiKQ5RhtuGF3fUxJX+gQqyypB2bC4W/5+a3jWRT8HkS
	lsR5s/y2M12atejAK6ZWEpRtQsbFRiickGqTpJHeSVy+Y1FwUGiV6IPN
X-Gm-Gg: AYBFou2uUhAhkw/lYaF6igKBJcLIxrZH6WgWE7PiiMlfQYBplH4+EF4dtPyOdFOycdT
	3D9hbHQxb+aqqUJSDWrNGVd7KrB+qDt7RJgvaGaBLOI+E6Hr97UihIbhPjYGdGSmyaDqdDReMnT
	+wVzE59XWhC7fbpR44N2uQ/sadEYH9SozIWDDcPN7OOrFwjvGk3j+jltAOXenmWdOZRqK60pjPm
	Die3tP806gN2kt8mvYDtVf+r4Sb+x3JVFpCKc/fxhob4B8F2b4FZix7Xv2qCWAgAKvJVumSm2Pi
	MDg6vo/aVyRafZ43lyLw5mM0NxdNpeAqGRU+pDdN4jdmiMjgZBXuyHq3n8wM7kEa7FWNVR4KOlD
	uoWFTjf16smb44Iv8Qj/dO+jCTSILbCkRwLQxAvuPbkQB2iea+NTrdx6xCi1eB/4h1sN1WK3RI2
	EXBclkq98K6UUmmZ7fhlXYz1MY8F2KdM7i6efb4r7nTPULGta7bvEmKjqv6XdoUztgMWlYhJeq5
	uanpMGo8N/tghYMtnO7iOsJ24/UBAfTFFDg3uujdpuC6vrbwySONK5brnNgkZQ4bi+hiihim/7Z
	TMh6DMa+pduIIKIfFSubM0mjcJobc5IYWn25WSS1JxkvoN0=
X-Received: by 2002:a17:90b:518d:b0:3a4:c725:2870 with SMTP id 98e67ed59e1d1-3a6ce6cbcb4mr6425220a91.14.1791093923604;
        Sat, 03 Oct 2026 23:05:23 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78d4a869esm5844094a91.2.2026.10.03.23.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 23:05:22 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 04 Oct 2026 16:03:33 +1000
Subject: [PATCH v2 06/21] ASoC: ops: Introduce 'snd_soc_deactivate_kctl'
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261004-macaudio-v2-6-7b47ed6335a8@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2196;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=6036NmB8QUKf+p136ljkCWVR3JbqpCuGrzZEQrA339g=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkH3+Rwx8sz1m1usna3nfnR4tO0LfE+T0oVJfZP4egsK
 plgJ3GsYyILgxgXg6WYIsuGJiGP2UZsN/tFKvfCzGFlAhkiLdLAAAQsDHy5iXmlRjpGeqbahnqG
 RjrGOkYMXJwCMNVZkQz/C9fyLi3z/nX80mIZrmcW61+ws4sHvJp/fqnszFv3Z7lMWsLI0N6iMOd
 8mnDj5ZOMB45/1g3fI2oyhUO9dY6N7qZ99/vmcAMA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Martin Povišer <povik+lin@cutebit.org>

The new function can be used to deactivate controls. It is something
a machine driver may call in fixup_controls.

Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 include/sound/soc.h |  2 ++
 sound/soc/soc-ops.c | 34 +++++++++++++++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 553bb7e2be98..973ffaf6f060 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -578,6 +578,8 @@ int snd_soc_put_volsw_sx(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol);
 int snd_soc_limit_volume(struct snd_soc_card *card,
 	const char *name, int max);
+int snd_soc_deactivate_kctl(struct snd_soc_card *card,
+	const char *name, int active);
 int snd_soc_bytes_info(struct snd_kcontrol *kcontrol,
 		       struct snd_ctl_elem_info *uinfo);
 int snd_soc_bytes_get(struct snd_kcontrol *kcontrol,
diff --git a/sound/soc/soc-ops.c b/sound/soc/soc-ops.c
index 142f407e3939..4d799c5e44f1 100644
--- a/sound/soc/soc-ops.c
+++ b/sound/soc/soc-ops.c
@@ -471,6 +471,40 @@ int snd_soc_limit_volume(struct snd_soc_card *card, const char *name, int max)
 }
 EXPORT_SYMBOL_GPL(snd_soc_limit_volume);
 
+/**
+ * snd_soc_deactivate_kctl - Activate/deactivate control matching a name
+ *
+ * @card: where to look for the controls
+ * @name: name
+ * @active: non-zero to activate, zero to deactivate
+ *
+ * Return 0 for success, else error.
+ */
+int snd_soc_deactivate_kctl(struct snd_soc_card *card,
+	const char *name, int active)
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
+		ret = snd_ctl_activate_id(card->snd_card, &kctl->id, active);
+		if (ret < 0)
+			return ret;
+	} else {
+		dev_dbg(card->dev, "Tried to de/activate unknown control '%s'\n",
+			name);
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(snd_soc_deactivate_kctl);
+
 int snd_soc_bytes_info(struct snd_kcontrol *kcontrol,
 		       struct snd_ctl_elem_info *uinfo)
 {

-- 
2.55.0

