Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 055BF3A1A26
	for <linux-sound@vger.kernel.org>; Sat,  1 Aug 2026 06:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785564429; cv=none; b=conlA28DbpGx+SydIQUF+8s8oKy5nUw85pZy4AT1OOimQcFBr9NF1IC7c0ajpwTX6xNC2zfCocY9wT0SwvfOEZJBHhjtZsLYkwQFCP6sCgZ+qE5eDbrVKDLU9kUI/Oo1VBH6Xm95TBC1+oWGZNpSSlNXzQsKk+OWxM5oCyzatFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785564429; c=relaxed/simple;
	bh=IHo604GjEFu2C0i4DOUpP6NtZKA9wAW+t4+Q/9HZoMk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=inHB27sVTTW+wUP2CHQmutU6VGSVT64LnFzPIRRp9jz3gzEcYmTtM9GwyHxHG/CCZPSp60R2FJXxoLTvqPwWTm28SGDa5udTSpczrzKlLdlc7Fp8IX2RwxEJxk9egrTU3Gz9ULbxsi/4bUT09t8Irla+vzbOzLW6uIljoRg6AcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pRXkxEsJ; arc=none smtp.client-ip=209.85.160.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pRXkxEsJ"
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-455ee8f529dso359003fac.1
        for <linux-sound@vger.kernel.org>; Fri, 31 Jul 2026 23:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785564427; x=1786169227; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hY1VNQWMZbcTYVOzkOemBoCdeDcj66ehp8AMGX233Z8=;
        b=pRXkxEsJwjFQEf+AZ9+dX1urVKH3C2/6mpDHb17GnxZAD95/ySY8vIy/NVZCLJF9N5
         DzNjGFZpomyj8gdhab3r0VlWtIjef4TGrniFDab0bgsIeWIsDQ9FDDC2GDNhIufP5381
         z/bGbWRLQuzKfpisb8HnB4baYfiq0/4yzJo1GDlg4hutfMGMD9Cl8xuEM5A5OC+v6i+K
         NeuaRkbr8LENIsGdhSeZS1Wal8S+L2CkYPG+DQY3sCi1NhA7nGyCdZPkK4jwfEMvxQjF
         GoYeAbpHVeB+iuqJMzSIPwcuW/CLCgPlMDiElkkmybeBYYU/Cd4PQYy9Se8xnpRqneYb
         kD6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785564427; x=1786169227;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hY1VNQWMZbcTYVOzkOemBoCdeDcj66ehp8AMGX233Z8=;
        b=NXPhH/k6y71cnj53RVdVvJZUBEnHKEPWV8TpQdZ0SvSQphXWGhsdSEJufY7iwKTpCC
         j/LsHz04hlmcukTzpqtyyFz9+3bQ0Si+oWkhIg4l30XBq7mYObvgKNiJww/A88vhpR2n
         mxPtsIfMoZDEnCQ5+vxHAnEo5ozguQlnPc9JJgyw+eUWST3r1XHL/Afbnfzt2xszUhVR
         rC0BumETJ+IiQQIwhbM7oPQL4cEFWEV0vW11xcDq6AUrW4xxA2B+JUvgHops3XGOPUlO
         jPtVYurs8UpGZfIFcWKChbxDr8Z8wb4H7mhjKH5gDs4s6jyHxUSd1pMQIaxFe6LfuWXf
         XQmA==
X-Forwarded-Encrypted: i=1; AHgh+Rqcd9ug2Yo/I5qHko98CCPT4kJUcYOXqxUdmAZEpUUuU95ABiVAgAeaNgnCQSb9hfxgw+Q0FUyJAeBpDg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzE4i/yXZeFq1zgjopRejzDt/7A7skKjZmaY1CzFSu4ubi6xdSH
	/xy8AQ3NYE76290lvJ9XqG/sdGZubshU6/eFJ9F9o7DoySAX5+pLO7Mn
X-Gm-Gg: AR+sD136D6crjtnGhr6Ct/vQvApFAdZ+C+LDhli2StLf+gOBIrxJvQuWNoa18KOmdp9
	1MSgZFOxezJ5qluaQWd9MsuGk9eTIzmu5QQ0OQYjljwkViFcrYkvS2DG6pzrXoImSujkf114PjG
	MfTFcrmNlqbXmDtfQZuMa/BIvIm0n5tRSDvTTK3cM2L9z12bXP6/MoChnoyfkSE/KDv104yhtnN
	cJCOQHZaX6xCaYFqH/iEwhxsoyze7HJx4eo2DiDOZuRmYtuHddOw+M9iiZDmNmVZAtN0/SNY6Eb
	xhRk+e4deRGYr+0loltYATx7Npjgrv+tJlzCwWdvV4QiY9yQ2QLJ3dkYTVAQ3mRHKVuOAYo8MGp
	XgfYcPIbRJnrN3zKoq6nlLGJ+tzLmDu9dc7Kqg8hHrs2mPxEPFhejqcsSUJ5/fcAHUie7xQ35WC
	0RVGcz6MdG2+urGPlWf6AvdZL9zKZMH1n9pGKDavaAFCnKeUypfEZfvXYRARHlH5ZnnRLmy3jtS
	E6xF01gRVmTqfCMLw==
X-Received: by 2002:a05:6871:a86d:b0:447:7605:ed4f with SMTP id 586e51a60fabf-459057af577mr5369428fac.6.1785564426687;
        Fri, 31 Jul 2026 23:07:06 -0700 (PDT)
Received: from u-ThinkPad-X1-Extreme-Gen-4i ([192.3.12.183])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-458f664d812sm3473404fac.9.2026.07.31.23.07.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 23:07:06 -0700 (PDT)
From: Aaron Ma <mapengyu@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Zhang Heng <zhangheng@kylinos.cn>,
	Kailang Yang <kailang@realtek.com>,
	Damien Dagorn <damien.dagorn29@gmail.com>,
	Aaron Ma <mapengyu@gmail.com>,
	Bob Song <songxiebing@kylinos.cn>,
	marco_giunta@outlook.it
Subject: [PATCH 3/3] ALSA: hda/realtek: Rename headphone jack kcontrol on Legion machines
Date: Sat,  1 Aug 2026 14:06:30 +0800
Message-ID: <20260801060630.2768318-3-mapengyu@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260801060630.2768318-1-mapengyu@gmail.com>
References: <20260801060630.2768318-1-mapengyu@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Lenovo Legion machines pairing an ALC287 codec with two AW88399
smart amplifiers report the headphone and headset functions in the
same jack group. With a kcontrol named "Headphone Jack", GNOME
treats them as two candidate devices of one port group and prompts
the user to choose between them on every plug event.

Rename the control to "Dock Headphone Jack", following the ThinkPad
naming convention, so the jack is presented as a distinct port and no
selection dialog appears.

Signed-off-by: Aaron Ma <mapengyu@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 42fcdfe54225a..83bb74c94b785 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -3280,15 +3280,26 @@ static const struct snd_pcm_chmap_elem aw88399_pcm_quad_chmaps[] = {
 static void aw88399_fixup_i2c_two(struct hda_codec *cdc, const struct hda_fixup *fix, int action)
 {
 	struct alc_spec *spec = cdc->spec;
+	struct snd_ctl_elem_id id = {
+		.iface = SNDRV_CTL_ELEM_IFACE_CARD,
+	};
+	struct snd_kcontrol *kctl;
 
 	if (action == HDA_FIXUP_ACT_PRE_PROBE)
 		spec->gen.suppress_auto_mic = 1;
 
 	comp_generic_fixup(cdc, action, "i2c", "AWDZ8399", "-%s:00-aw88399-hda.%d", 2);
 	/* the second speaker pair is full-range rear, not LFE */
-	if (action == HDA_FIXUP_ACT_BUILD)
+	if (action == HDA_FIXUP_ACT_BUILD) {
 		spec->gen.pcm_rec[0]->stream[SNDRV_PCM_STREAM_PLAYBACK].chmap =
 			aw88399_pcm_quad_chmaps;
+
+		strscpy(id.name, "Headphone Jack", sizeof(id.name));
+		kctl = snd_ctl_find_id(cdc->card, &id);
+		if (kctl)
+			snd_ctl_rename(cdc->card, kctl,
+				       "Dock Headphone Jack");
+	}
 }
 
 static void cs35l41_fixup_i2c_two(struct hda_codec *cdc, const struct hda_fixup *fix, int action)
-- 
2.53.0

