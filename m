Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793691663;
	b=SmML+6git+Dl0yBl7xRglkG4R23QFWn5fnLrBIhdwdPDf2+GcXKCEuCeO2cffV5hZ8Nf
	 WVwOcZINXdff+GGA1JDgJwctNgwAda6eAz9DoOuWGyzy+Dp6RqVZWfidFElbTAzazjiKo
	 xltzB/nD+M8n65h8FYz6kAA3FoVdOxaD2IcEvazPiA7o8nCGDN/LSb9qqdZ5Hr6RIdAZo
	 P2q9xoKTgf3IN9kLpjSzXh2Ej/WP6Fh47Q7IVVqIKrYu39WAmCe5CJAPqHLKR30AQdydj
	 srrvvE7MtY+nGJ7Y8wnbFPj6YRQ+kBLokwkTSyEjha6toqUIX4Dd5QEdlD4akb6WaSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793691663;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=AjJneFd6zR9t+WlMczvHbSnCI0cOt38Lz44GPu9SAaQ=;
	b=5jadyUcxKEvJgRsxgeQfI4Vif3Vf+ozcxzxjfxk+QkLq+VNItZmPmQFM0jH7wMkg+bcD
	 yIOVz1JMDkZYM3PRbBV0TgYdJWi4n0oxevWrM2IFkwVEuWG8vDZp1jFrMt3rQjkm+/MYz
	 Ewv2nKZ/CV2lbYqKRoNDkuP6bUjIzyD6licMU8xHhaffwRCdy1RUgPWg4AozXyEzH/xsW
	 7dVAc5NOmZt4OzYj0zkrL6uZ3uXrCeoyqzqcbdd8/VWzDtvi946RTq7NVwF1nj/TOALho
	 C0D0zzxiCJ0J5meyTbXLcCvA2u4ZaJcG0UEq953EWdAsWg9FQvydMd/VJDwNy07b8rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BmE3+R9D;
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D53E4606A32D
	for <linux-sound@vger.kernel.org>; Tue,  3 Nov 2026 07:41:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D53E4606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BmE3+R9D
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2e96502e447so35596755ad.1
        for <linux-sound@vger.kernel.org>; Mon, 02 Nov 2026 23:41:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793691662; x=1794296462; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AjJneFd6zR9t+WlMczvHbSnCI0cOt38Lz44GPu9SAaQ=;
        b=BmE3+R9D7HqptxtYfC8OMh8ZKsocUrxfERskE1xYl1RnDXxVq0IXI9jN3rWWLGUWwt
         YrnoIT71BrQXy7jcnM4diT/CM4gOQoUQM1MC0bBrDkDZ7cNUm4evuiE5ISHG4FQ26kI8
         +cjZpBug06weyGFucE97F4YS6cvZ+UqgUOmJfvXQZolpwSg80KKU7ZlfbJH5Vxrh8s+C
         wgCrXZ5mrBo8dB8tXZ7ehC+xIw4uUyyREobPchgltQaZTSIIFyhT+XQMDlAuJpBbHnoR
         WbOgZyjFGkaqeDpe7nYEX4mDbwoUFtuwaUfPClSHXPACk1yIGoLUeKX5PatocrV9mGz9
         E6hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793691662; x=1794296462;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AjJneFd6zR9t+WlMczvHbSnCI0cOt38Lz44GPu9SAaQ=;
        b=htySkpLQJgRJyB1KSwEk26lJ5KO+FW2xQsHTlctFwjn/3PbMrj+kHN4BRKmp6F3NEw
         w3B+TUyeut5QHbLhWHLQSjJtQr+ZyaL32LoSsU3OBd1V8twPdTEWlVGMbODXLcFm8QAc
         NcT6hS9bxCFoo7CHPQAiN2NGp7yHgua0wYTniEdwM7L3AFog0poqi2Uq5QbpEAMR8/RC
         WBNeGV0vFvwoMnPV3SxKaLV9a3FiqylF8jbK8wSZQgjladPLAPn/y2w87NyupALl5/6b
         azwTrh8T3Rvva4TxvyDEJk3dEpCZO7ipHC6OL+peTf2e6gV1IpAr9QQXd3dAHkqpqKPR
         RsOQ==
X-Forwarded-Encrypted: i=1; AKwUvByDp/nc6B5RWAS+7G1JBfm8mCX6XynO6MP/jmSLRtWfkLWno8KY87YlmcFhJF/SAoZYx30U+u7ygZ6reQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/M/1mEbtngMxH+cc0UYxojFIGMewkpjQ9aFSa5JR9kUDZ/WyUq
	lQHMuFCXLQjkX3EaLSJuI5O7sGMAml2U2INNSRhzldkWmoQd9xSOVuPB
X-Gm-Gg: AYBFou13rCdkUSUHzqk/FETIkridenU9yXGD3/fG7j6Fcz5y8Z51BEelz1THul+76RW
	8bBVSzY2ObSL3fW7C9jeQHW5WoN8dPEuavgvFFbbfvZw5ZNm1EsvxeYAA07DoWsMOYjDWMHv92P
	2r2I57RgjqPJRc2I1CRIYafFkgfUSoYP17mhwpmIzKxtRTQPDNzGuPDV6hGUK755HS/h9BmphAC
	/JX0JB5r3JuLvGeMtYjvB/n1p277F5PnWmsLXTxO8b7d5RCUQ1rkWL4BZWihzp1bf24HqPtSb4e
	ml4sMKVQg7eVF44l03AMrbZp2sBrtT2BjS0A/oo5K6LoqJomWxDIBWTRW6G/VF7zwOfhYqlV5s+
	WXFnIZTywkgivuBiHj6OlVXvJK6PKklEcABPTzK2deOE36sSBMZ6H5dxkwqg3kaMseHoWCr69LF
	Is3T3klXu86/k18fZisEHUH7Z8iuewiVI3qZeLETb7lytJosE+oO2g63pSC84Td4jL6AW2AyO9q
	CioSMGhNY+wFXsPsJ1mrQiRIyHqSeg25qNHVL5i+TJwRXGw/l6nL/qvQRdqMJOZqXp/qeN6X+wn
	YuK7Fnd4AXTK1TUxYOYPbW49lijyOKoWoDNRBL3rISo4PyxLUlamSLmuItFZUcHDnK2GbhtQn9G
	soBj9ONsZlqzZqEgvPhPIPxNzaqkE3a3g5Tf3yEWtibAp1QVlVCMb+9w4xzrBm78xEk0GWCcUow
	fmIgw=
X-Received: by 2002:a17:90b:48d0:b0:3ac:80de:44e8 with SMTP id 98e67ed59e1d1-3ae8983c697mr9569540a91.43.1793691662194;
        Mon, 02 Nov 2026 23:41:02 -0800 (PST)
Received: from [192.168.2.34] ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c903d0dsm2956769a91.12.2026.11.02.23.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:41:01 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 03 Nov 2026 17:39:54 +1000
Subject: [PATCH v4 06/22] ASoC: ops: Introduce 'soc_set_enum_kctl'
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
Message-Id: <20261103-macaudio-v4-6-637484efe46d@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3032;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=ZOqi03cyyWOVQz9j7HJ4ZmFw5Ix5rcoCeApwbxKDnBA=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkv+8+VbzVZeGCSGtuf7T8lO1l2PZw9+d9pc6Off7xS+
 a//rXq4v2MiC4MYF4OlmCLLhiYhj9lGbDf7RSr3wsxhZQIZIi3SwAAELAx8uYl5pUY6Rnqm2oZ6
 hkY6xjpGDFycAjDVv1YzMuwxlZYSjtp//6Xdd/vzhn+UEiaI2Nl8Foy+FXurk6WcZxvD/9CgyNx
 P55mtvLP3dn/MKNAJ7Dd4zuef8XD7uayGQ/n3eAA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Martin Povišer <povik+lin@cutebit.org>

The new function is to be used to set enumerated controls to desired
values. It is something a machine driver may call in fixup_controls.

Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 include/sound/soc.h |  2 ++
 sound/soc/soc-ops.c | 67 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 69 insertions(+)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index fbef941157ee..c77119f92dd3 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -567,6 +567,8 @@ int snd_soc_limit_volume(struct snd_soc_card *card,
 	const char *name, int max);
 int snd_soc_ctl_activate(struct snd_soc_card *card,
 	const char *name, int active);
+int snd_soc_set_enum_kctl(struct snd_soc_card *card,
+	const char *name, const char *value);
 int snd_soc_bytes_info(struct snd_kcontrol *kcontrol,
 		       struct snd_ctl_elem_info *uinfo);
 int snd_soc_bytes_get(struct snd_kcontrol *kcontrol,
diff --git a/sound/soc/soc-ops.c b/sound/soc/soc-ops.c
index 1d60e290e40e..1cd7f1caefe4 100644
--- a/sound/soc/soc-ops.c
+++ b/sound/soc/soc-ops.c
@@ -505,6 +505,73 @@ int snd_soc_ctl_activate(struct snd_soc_card *card,
 }
 EXPORT_SYMBOL_GPL(snd_soc_ctl_activate);
 
+static int soc_set_enum_kctl(struct snd_kcontrol *kctl, const char *value)
+{
+	int sel, i, ret;
+
+	struct snd_ctl_elem_value *evalue __free(kfree) = kzalloc_obj(*evalue);
+	if (!evalue)
+		return -ENOMEM;
+
+	struct snd_ctl_elem_info *info __free(kfree) = kzalloc_obj(*info);
+	if (!info)
+		return -ENOMEM;
+
+	info->id = evalue->id = kctl->id;
+
+	ret = kctl->info(kctl, info);
+	if (ret < 0)
+		return ret;
+
+	if (!kctl->put)
+		return -EINVAL;
+
+	if (info->type != SNDRV_CTL_ELEM_TYPE_ENUMERATED)
+		return -EINVAL;
+
+	for (sel = 0; sel < info->value.enumerated.items; sel++) {
+		info->value.enumerated.item = sel;
+		ret = kctl->info(kctl, info);
+		if (ret < 0)
+			return ret;
+
+		if (!strcmp(value, info->value.enumerated.name))
+			break;
+	}
+
+	if (sel == info->value.enumerated.items)
+		return -ENOENT;
+
+	for (i = 0; i < info->count; i++)
+		evalue->value.enumerated.item[i] = sel;
+
+	return kctl->put(kctl, evalue);
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
+			  const char *name, const char *value)
+{
+	struct snd_kcontrol *kctl;
+
+	kctl = snd_soc_card_get_kcontrol(card, name);
+	if (!kctl) {
+		dev_dbg(card->dev, "Tried to set unknown control '%s' to '%s'\n", name, value);
+		return -EINVAL;
+	}
+
+	return soc_set_enum_kctl(kctl, value);
+}
+EXPORT_SYMBOL_GPL(snd_soc_set_enum_kctl);
+
 int snd_soc_bytes_info(struct snd_kcontrol *kcontrol,
 		       struct snd_ctl_elem_info *uinfo)
 {

-- 
2.56.0

