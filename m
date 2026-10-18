Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2CB437CD53
	for <linux-sound@vger.kernel.org>; Sun, 18 Oct 2026 05:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792302922; cv=none; b=aHjncXo+N85hiNsB/SXx/rhQ04oLbMU0nwIH6tQ/FtS5VTtoXl24o9A7wuTSPNs8V9x1o9MpfKQ/q1NnF+9AEedl/v2LJxof40Z99xlT6m8by84qaISIMfoG4Md5+SIVozrPZjCfXn5f+Zo6BFEMrT3WhrTrcDKWUsEDiuyrv1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792302922; c=relaxed/simple;
	bh=pAej5M1APY+ovQrNrjQEYPur127GlGnT3Ic0Lw72pJk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bI2VmYryLPO8ZXriXF91Fgo1Sq/ioVRYyiRaxrtg6NpKAjdGItuQ+LrGC5UQZJTlhhh0YzOsWUvCL7FH+mOqf/aeDzbhohz+i3PMbQPx3lr2Vv4BIU7se8I7p1ftmmGYO7CEm4amcLVjpffRw0RZJCCheBQKk50JvZfOWqP2/9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BE8jUXVU; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BE8jUXVU"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2e987b4a710so9630015ad.1
        for <linux-sound@vger.kernel.org>; Sat, 17 Oct 2026 22:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792302920; x=1792907720; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tz6DpUxPfKNPf31EvMRwP84SQ1THxlAVvf/QPE9uAxw=;
        b=BE8jUXVUYrSUaU1vX1vDD9GUzjc7+aE8x4CmYbWE+Y4cEFlSVwhmPOkS8QC90sg81k
         guM32eteKCi3784iF9TCh8LP63EFO/AWKTrW0JSavDkIwNTlZwqOnwp/jGRk88YwJOll
         HTBKaehotNyDvFSWUbJSUu3KmYOMri1NoWKiCO4AGSBTEEToTL5vTFB3RvOO9bMzc0vR
         iDcV7cO1Vlq5f6ZoDXVEEp9dmETH5i18HGoCBEqqSUyFwWOiAp3YaXb5JWNXxBpYFa3m
         HgjwlNLG8iEa8m3rU/2L0jqd24VDm5kW1ee5AnHLzRJSRsJ1WWEhvAaTcpEMua1pKJHE
         Ed9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792302920; x=1792907720;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tz6DpUxPfKNPf31EvMRwP84SQ1THxlAVvf/QPE9uAxw=;
        b=nr13FadjdnVcWmhrSCn6h3EFwwhqP6U5Txpj8/UIJp8AT9g+KGF+IC2IC87YuSVD7X
         +6mCek0WcoMC6UFje/BaZWPKF9eY0rsWwycSi/V6KLJfYfj6zbv7vsnWXYmyebNMgBkR
         1uT7tX4CSn9rE2R4Rfd7/UTWYqcJ7pQAdn3MB22vPJH/2rgqXdGgnEINl83ipYtEGt79
         CA6gzx9+GKs+Y8VNZPuy9dB8Sd31+2vQtIP5fy3+tQG5ISC5fIwlGHYrqlef0yAVAOhi
         ssvu4ncgFWwFZtcFkiRxNRafAm/Y1ctc4WwkyCq359FilVXVuulkc6OM7si1dW0luLr1
         aApg==
X-Forwarded-Encrypted: i=1; AKwUvBwU3l/2YmPSzb269rJ2rPFC0ct+nPyHJK+8YEbiL4VRbl3sV3Dvz+FukTJ+jWhZ/UW7Tu1luVMxSF825A==@vger.kernel.org
X-Gm-Message-State: AFq9FYL9sdy8aadUiXp6WXupA802oYLzMa7Oukn/AnBv0CWD57LXzTnQ
	bNSLNS5XIWwclavgdqRYkrdktXH6qNEys6kxwoKz6eK9Qsz4XrghHYVK
X-Gm-Gg: AYBFou3z5/0sByC8yUyPKATzO/F3idh1FWO/3p3HDBtvZb9TTdaHgvizE6W+9cmzCtc
	LoJOdrTr26Im8KcPnhm1l5nHkrTgvY4AUbeT5khdqYtMchp/qQdDHp2dhyhIoZyE97mk5fsBsXH
	X3xmkuhmRXnAr4v3Sx5Tz8TxkMm+kFQKPsoQIg0XQDhx6a4w1C23g01/amjaN6oIa/o9zEz3mb7
	tbMoIVvduELbwKY7nFPbODU7dR6asnuQZ5t1GvCNEkaLVZAB3DAaAfDdalnC13uJncgMnLG6i1+
	+SUU9hAepgjKa/41rNfJYD1OZOKsl8z+5FrbqFQKQjAgnY1bZ92cZetXxuJIpRgZmbwy3SMipMA
	NcROlFekjBC3oZ5C6xI/f2CiTSviLA+80a6XXdCYHL3I9uXpfijFvFB+ofnAV4oeJQUShjPzU1x
	62xsLUfy3HF10IMeVm74IY7KdaBz3ijhVLtR8TLV9VbIGeQVclfqnzbBDP0CK3ZR/kBfCIUQje9
	BO1tE33dGkL/x4BXNLYp8ceH/QFnCmHmSX645nnvXusCG3NCySEPFVf68GtBkxqxlyZulHxQdor
	rRfi3n0JQU+OGYQPJmSss6jWo4gI0ESgtTlQDjrcpYz5QQ==
X-Received: by 2002:a17:90b:45:b0:3ab:330d:6e47 with SMTP id 98e67ed59e1d1-3aceefbd753mr2885259a91.10.1792302920286;
        Sat, 17 Oct 2026 22:55:20 -0700 (PDT)
Received: from [10.0.70.21] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd0cde4fdsm5511292a91.4.2026.10.17.22.55.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 22:55:19 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 18 Oct 2026 15:53:59 +1000
Subject: [PATCH v3 05/21] ASoC: ops: Introduce 'soc_set_enum_kctl'
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261018-macaudio-v3-5-abdff7741dea@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3004;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=GZ5WTNP4gDv2fMsvOJFicRig6JxdLlKhDpR9KaPgb0k=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFlX4nns2I888NrlJOEYp5zy95Ev3+q6ib9LRNYacS84a
 5t9Zfe0joksDGJcDJZiiiwbmoQ8Zhux3ewXqdwLM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GukY6xgxcHEKwFTvCWFkWCxXzaS0z37mFxPX29cvbV8b+vXXzNjLEmc0okyPp3zKEWT4Z7tj19H
 +1VtPxDLUiq1XsKle16VzhXVbnHEHo1uyiOx5LgA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Martin Povišer <povik+lin@cutebit.org>

The new function is to be used to set enumerated controls to desired
values. It is something a machine driver may call in fixup_controls.

Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 include/sound/soc.h |  2 +
 sound/soc/soc-ops.c | 67 +++++++++++++++++++++++++
 2 files changed, 69 insertions(+)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 7509824a6b2e..dcfd706a73ad 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -580,6 +580,8 @@ int snd_soc_limit_volume(struct snd_soc_card *card,
 	const char *name, int max);
 int snd_soc_ctl_activate(struct snd_soc_card *card,
 	const char *name, int active);
+int snd_soc_set_enum_kctl(struct snd_soc_card *card,
+	const char *name, const char *strval);
 int snd_soc_bytes_info(struct snd_kcontrol *kcontrol,
 		       struct snd_ctl_elem_info *uinfo);
 int snd_soc_bytes_get(struct snd_kcontrol *kcontrol,
diff --git a/sound/soc/soc-ops.c b/sound/soc/soc-ops.c
index 295056bcc081..149a094112d2 100644
--- a/sound/soc/soc-ops.c
+++ b/sound/soc/soc-ops.c
@@ -503,6 +503,73 @@ int snd_soc_ctl_activate(struct snd_soc_card *card,
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

