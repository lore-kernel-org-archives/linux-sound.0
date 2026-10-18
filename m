Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B5E737CD53
	for <linux-sound@vger.kernel.org>; Sun, 18 Oct 2026 05:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792302911; cv=none; b=K7wOXzLdZcU6wYItPxKS/w28igZvHdcx04nh7wPyNo+pzs6pr+qUPBm2qZEw1e/vMQtpU4D8wdkmWBhZ6L0SBYUo9vlQN8qFSJpM/FIMkcxvibRXhtjCc98M74SINbio34q2oJAOjCNu9OiPFt/cDmP9PSmupy7HoFHYihfAQ9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792302911; c=relaxed/simple;
	bh=NlIYI0wEswgCF4Xpl2k56dNXmbybay1CaLrUqHKTrmY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Bhu46IPR6oNReI2tAvjP2bgfjZvYCPRESYYnQUmw2iHkO4Xs+Tm5VJAZVPu2mTSc4e9O3+TwhGlPgx22GjwnU+Vl0f7JF6sTmrJeqUlIc5gJ8fo1IBBNfGTNAhtIogOcRIOftIilgO01n4FYtSboG+Wbqg4E/IlVUaQ76yTfEoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=blbpO25X; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="blbpO25X"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e987b4a710so9629595ad.1
        for <linux-sound@vger.kernel.org>; Sat, 17 Oct 2026 22:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792302910; x=1792907710; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TkL5krI5HcwcF2aMm7pBYk9h5C6V+6rm4QZatT5Wuo4=;
        b=blbpO25XcHscBdzPhkeCZqnsaZR0F+AXgIWJHrVJjXWapidBvIT4SxDRwoeMt2EEMn
         I8fr1OsaQS6uADjhWJjtZMc0pe/PqGIaFu6NpU/U5AHhO739DCIOlZSfs1IQVgMGW4tI
         SkArGVo5+Lp2egtJpJBGTjT8oWt1mxLoIMrrgo+YQvPpQkmVgoZoTlCi19IVwi2t4KFL
         5UzvieEJvk/O5VGzv2vwytqK0pMENv56jLDYDruRz84on5uGLeRYAs4q6i7aagkxjsti
         s/3RDk3M2hVmNXduocq59SZZ/hnuekcF5NDbi9TznBW3pH1LO0tRbjTsaZVUQmklL7TX
         ps9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792302910; x=1792907710;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TkL5krI5HcwcF2aMm7pBYk9h5C6V+6rm4QZatT5Wuo4=;
        b=oK7mRFsq3+oXyTaxfjCm2BY40WrvojdaphrP+YuaQgUL23X4/6++yYNTsAnz7pYxbq
         lRsUPklVz9Ii+ax/yEGIQdgntcrAkxzWXPhMvgBOnVK9eQupoE24f/QYPXrhhVi4tGHy
         oghD1jvN32cOZUoyqJOHeXI5Ve++PWW5bHJAgMrokyFEWTx9noZF+UhCy+l3fweVdRHG
         I+kLj5KJHvSEZoo3TfFK7Ig2oi/y+Tj4aA8uu/fURYhln7++j9SdvcK4tlCh+FKt/Ska
         zWp9avya+huQEmADaIu9H0AvHRORo7ne3hxQCxxGrBeM9221HfJWzwjdoCfKYA3Ye4OY
         NT9g==
X-Forwarded-Encrypted: i=1; AKwUvByDndg0w3pZrpzY2Sq42YJd7iJYoSwS4Bkp8RW22bmMk6R7wUsL9s6xD7bfKeAfotM82J6cmz+cU+0SBQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYJCq0NvWLxhqdJ7D/ahkfgDwJ6ls62m/PrJbpydcaNP4cq48mfA
	5V9k7ywBMB8ksX6Nai5Ir8NbSDPvIRIy4bDP/8DaLae4OBq0VYm4y0Jz
X-Gm-Gg: AYBFou0kUfEN0R4L9ZWVREzNLYggWt26sF4LMCrni+WN+fDSzeQvxvhntk93N6CbS05
	ozVmsx6RQW4fCa8kHsyY/8dgk5DYJRqYvtU6/H0gsLO1PeZtq2v2COqOWLI/yi1qmyVEYsFXBIF
	CqNuOY/tn39zTbp1uFaGaAeFUJ/X7vtGHsE/o18QHM14cpqPUAb3ZUUas/iVhQLmsgz+oCPyFzG
	0EysCsy2Q7PbdvR2IGXKaGNsFgGoVGP8W5FqmjbTxTCjG0Z0DG1br3C8fluhD4DcCSegoPLEPRW
	UftjJ+kL9sBlRG1sofXMPRR3WFPZXG9700Wd8d7j3gIL/ZlECljCzlyWM7OauGR9AlBN3oucnOb
	2qqu3LMyopmjJo2XHSAZXUGus5GQbCpGszWtgQSj+csjPC3+KxFi83He+hcet8/8SZf73meRYT0
	/gXktEB7eGGl1/VWid7wr8/7qxJRBH6xUfy9n0NFt0N2iWXOdqXyPNzNsLLPVrNVN26B6AcDJE4
	THuRRruJgVr5bynIpYK4hdu/mL8kjSe6Owz4SRgMtpRzNCTmG5qGJzNEWABZ1LgB9CNDte3FX5c
	2lk6x7X4cK3hL2PPvZzC3Aj7Ry7TBzbtPM9TqMUA7XMpS/M=
X-Received: by 2002:a17:90b:580c:b0:3a8:337d:228a with SMTP id 98e67ed59e1d1-3acee2768cfmr2702377a91.6.1792302909929;
        Sat, 17 Oct 2026 22:55:09 -0700 (PDT)
Received: from [10.0.70.21] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd0cde4fdsm5511292a91.4.2026.10.17.22.55.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 22:55:09 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 18 Oct 2026 15:53:58 +1000
Subject: [PATCH v3 04/21] ASoC: ops: Introduce 'snd_soc_ctl_activate'
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261018-macaudio-v3-4-abdff7741dea@gmail.com>
References: <20261018-macaudio-v3-0-abdff7741dea@gmail.com>
In-Reply-To: <20261018-macaudio-v3-0-abdff7741dea@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2214;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=eogWKeAPSgLXuvFuxBpm0mCMpQlIZe0f6Gyo195bzv4=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFlX4nlMut3rN7jGTw++yar56Nujo3kPXr314b2V6G32L
 sVitc3hjoksDGJcDJZiiiwbmoQ8Zhux3ewXqdwLM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GukY6xgxcHEKwFRzMTMyHGOoaN6st3+KE4v2kjMP89/dODOtQUhfq3/H9G9JAnm/7jEyfGvpbTO
 UNf+wb7uxRIrgSp3Pjs/Nzff/XjRR/I1lsJ4LEwA=
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
 sound/soc/soc-ops.c | 32 +++++++++++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 553bb7e2be98..7509824a6b2e 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -578,6 +578,8 @@ int snd_soc_put_volsw_sx(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol);
 int snd_soc_limit_volume(struct snd_soc_card *card,
 	const char *name, int max);
+int snd_soc_ctl_activate(struct snd_soc_card *card,
+	const char *name, int active);
 int snd_soc_bytes_info(struct snd_kcontrol *kcontrol,
 		       struct snd_ctl_elem_info *uinfo);
 int snd_soc_bytes_get(struct snd_kcontrol *kcontrol,
diff --git a/sound/soc/soc-ops.c b/sound/soc/soc-ops.c
index 142f407e3939..295056bcc081 100644
--- a/sound/soc/soc-ops.c
+++ b/sound/soc/soc-ops.c
@@ -471,6 +471,38 @@ int snd_soc_limit_volume(struct snd_soc_card *card, const char *name, int max)
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

