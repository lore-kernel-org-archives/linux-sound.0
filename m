Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4082E3CF69F
	for <linux-sound@vger.kernel.org>; Sun, 20 Sep 2026 04:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789880220; cv=none; b=JfQxdeu6rW8N4KtETf7Ati75PRwJZZWkC1q8PA+qpDTNlql2/pNNr3RPedKph7g/7CR3f60RIR/SegkVBAbTDK6BfAB9Bpk2g1AcUO7jN/EY+6McFRsXREvzq8p4Ctls3ry7MDlvsiNj2QQpjDRvj4ifRgfo2LTrxlr35UnIOTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789880220; c=relaxed/simple;
	bh=dKaT5/AJvuu/ovhkji/q4clDn7hNGscBb7o5Poe/oV8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g6f2YYBdZfeYIeLfbVUqItwM/c6xu8s+YGn2xw1CzgoX0gBKdjHGfuR1Kue1Wsi2fAq9hB7zDcyo2tIMjaicbHFqeVLC8qwyKgnIF9UL27/snOpZRbw8FCuj8plaeCQj7Y3seikgtdMMw5c9xDWbQcJBNoJSOKq+wYjvfR48Gk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JbzkajnO; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JbzkajnO"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d8fb334e72so17944715ad.1
        for <linux-sound@vger.kernel.org>; Sat, 19 Sep 2026 21:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789880219; x=1790485019; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YuKu80M7pHMVvwxhK5F4M5xUsUReDWNtyKOTcL7spBk=;
        b=JbzkajnOeytAcqGOEJ7BM/U44QtJidYiPmgt4sfzbuF5E0J1O2l7GUeaUaT7VgQRol
         kvN3IFOtHXizagSySZQVgpCCThfqn0xELpSXzRj8RhX+bvX0ABqDl97N33LMM/ZpPfLr
         nIrLDot5ba1BNLZuh3KogUhhDuhypp6Dt/afemk+bG7/bRMDJJM8+cS9uTnYH4vCGkbv
         qDND6lXcGPWsEeQ69DuaNtHV6+fFfwlUCrEqwG1Mn1ZYRDC+A9+RDjUxrTRSkVtBsQjX
         zsl13EpnXNawX1u9qUzdYNcfb8PNGM/VAFeAeHxGzGu0kX1fKT34z++1zmhh5VqmA5qe
         sWGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789880219; x=1790485019;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YuKu80M7pHMVvwxhK5F4M5xUsUReDWNtyKOTcL7spBk=;
        b=NnHdOjFuO7W0ewTPJkvhwAP1WiVjY1dAb+B8LYjnaiq2kdpkR1E15ckmWwUptm48vo
         i5W0a8etVVtk147OLkzka+3qWholB7RTGYS4EA94CJYhD3oUhAWTArT4NyHO8/9M4uk5
         dDYd5t63RQ/of5uwp7DUBKSYrSrdVbhAJiZkbxAAOs0ZCGogA0VUzx6SpJ2k7/s6rE6c
         k4KUKpuzdVssAHamyB81KEXSl7dHQDrFdoxiSe4fqGQHpLyfAMD6s66rIJh3kgzumUTp
         pl07irznjogfpuBiKpsW1+8psKKGfwToQ0yD1AD9+c2XoYaYXIuQw5ZxofR6BNSZw+kc
         xa5A==
X-Forwarded-Encrypted: i=1; AKwUvBwkNVgyinFXMYCoimtN1G6UXxjpEDdHWcvZGUehoWqDqRR89zkKIFCq7mCL7kUeyz/NuWo5jpbantVu6Q==@vger.kernel.org
X-Gm-Message-State: AFuF++n1epyvfpcPpseEBcEL1bAsMJw7ivfV9UD2WSucWPdDI9ugbzx5
	FZJib38GwBZ5RHRbSzHLWnEtRoOnY286jFMpsJvgQPQ1sdtLA+qSNpPu
X-Gm-Gg: AYBFou2OcNQ/OgAmMYtqk9dK05/xVgzPwsgRY4Hq2uUfF5FyiUN5bG+KiEXq9GAffRt
	fp1050lYBa1iUBI1Lj8rTnoesihXSqN20WAPHesMpo0REK3DV/QX81W0EwCoU/fEESySEsyGkXc
	7JjwRpkuWCkCpKePGcRs8Zs7cav15OEhfLEIH82m7CA7NwyiO6gB9OY6UD0LeKxECg0Ov/T1NyU
	6WBUS73gfGXymViEpLnjcFJV+Ew3BlF/yctqqtCzNkisdnMJCL0Yu1lRsYm274ktQRRqBK4RdL4
	CfApR6owvlGuWD/YJsjpxZvo5rkHkfV8pTw/hX1rffUa5fEc7fBmaCGAkUBdxQjFvppBwIG51Qg
	NYU9T5j1y5NC2i2yQSm2Jb+uxAZOi1R1M+IoaMXd+/bdYv7ToXDI9Bux75td8sHGYp0g8eY6u6Q
	aciXBL9eCsNguz0q3fIBEwwQgQDXVqcEy3JEfHc2PBahCr+tkUbVvSRcNIpbPzKv0m5SxPvkhNM
	TGzvh3zkxnWwMCcJDHG2R4b35ZjHqTOS/Ms2UXfSzgPtBTIkPfUFfFLmuQLokWbCP4LWb0nNyxD
	gHSzs1cnrS2UNJKjU+KXY09ldl0BM4jel6tgGz3P18RqA90=
X-Received: by 2002:a17:903:32d2:b0:2dd:7ab0:7313 with SMTP id d9443c01a7336-2ddb1c17059mr113999215ad.18.1789880218740;
        Sat, 19 Sep 2026 21:56:58 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17d712dsm16026765ad.64.2026.09.19.21.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 21:56:58 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 20 Sep 2026 14:53:51 +1000
Subject: [PATCH 12/28] ASoC: ops: Introduce 'soc_set_enum_kctl'
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260920-macaudio-v1-12-741cc20a74e5@gmail.com>
References: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
In-Reply-To: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Ulf Hansson <ulfh@kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>, 
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, 
 Lars-Peter Clausen <lars@metafoo.de>, Vinod Koul <vkoul@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 James Calligeros <jcalligeros99@gmail.com>, 
 James Schulman <james.schulman@cirrus.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com, 
 Takashi Iwai <tiwai@suse.de>, linux-mediatek@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3075;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=ALw7GM6BAIc0MHLkA2EcsPFMi9t4wRSGpPulB3kFXSk=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnr0xWYKk3fyLwPOWP4bnLrx6JZ3MlXbuismZzzpHTX6
 3LxGCfTjoksDGJcDJZiiiwbmoQ8Zhux3ewXqdwLM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GukY6xgxcHEKwFTf7GBk2PQ34GexV8erhzy3oqqqFix1cXzjEnblC8NqE4dtJQfP9TH891WtZX0
 Tk7ag3Txt7df9e//ssZq+ujZri9HMeyxeITUFvAA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Martin Povišer <povik+lin@cutebit.org>

The new function is to be used to set enumerated controls to desired
values -- either a single control or many controls in bulk by pattern.
It is something a machine driver may call in fixup_controls.

Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 include/sound/soc.h |  2 +
 sound/soc/soc-ops.c | 70 +++++++++++++++++++++++++
 2 files changed, 72 insertions(+)

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
index d35e24df891b..dc27d1c409ab 100644
--- a/sound/soc/soc-ops.c
+++ b/sound/soc/soc-ops.c
@@ -550,6 +550,76 @@ int snd_soc_deactivate_kctl(struct snd_soc_card *card,
 }
 EXPORT_SYMBOL_GPL(snd_soc_deactivate_kctl);
 
+static int soc_set_enum_kctl(struct snd_kcontrol *kctl, const char *strval)
+{
+	struct snd_ctl_elem_value value;
+	struct snd_ctl_elem_info info;
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
+		if (!strcmp(strval, info.value.enumerated.name))
+			break;
+	}
+
+	if (sel == info.value.enumerated.items)
+		return -EINVAL;
+
+	for (i = 0; i < info.count; i++)
+		value.value.enumerated.item[i] = sel;
+
+	return kctl->put(kctl, &value);
+}
+
+/**
+ * snd_soc_set_enum_kctl - Set enumerated controls matching a pattern
+ *
+ * @card: where to look for the controls
+ * @name: name pattern
+ * @value: string value to set the controls to
+ *
+ * Return number of matching and set controls on success, else error.
+ * No controls need to match.
+ */
+int snd_soc_set_enum_kctl(struct snd_soc_card *card,
+	const char *name, const char *value)
+{
+	struct snd_kcontrol *kctl;
+	int hits = 0;
+	int ret;
+
+	/* Sanity check for name */
+	if (unlikely(!name))
+		return -EINVAL;
+
+	list_for_each_entry(kctl, &card->snd_card->controls, list) {
+		if (!soc_control_matches(kctl, name))
+			continue;
+
+		ret = soc_set_enum_kctl(kctl, value);
+		if (ret < 0)
+			return ret;
+		hits++;
+	}
+
+	if (!hits)
+		return -EINVAL;
+
+	return hits;
+}
+EXPORT_SYMBOL_GPL(snd_soc_set_enum_kctl);
+
 int snd_soc_bytes_info(struct snd_kcontrol *kcontrol,
 		       struct snd_ctl_elem_info *uinfo)
 {

-- 
2.55.0

