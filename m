Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B57137A48B
	for <linux-sound@vger.kernel.org>; Mon, 18 May 2026 02:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779071639; cv=none; b=Pqv4Ao0AlfAvDg/wz/acbbop42PlXer/2gFq+ie6r4kAs4Yny78ApfMabyGO758sMNGpceqUE3NhukZvhK1cv1J3E52skPPYT2On+6hok4bRHzQVmT/ufpuWBeBMNoPvWNF5zECBcIh3W7UK2KNXBZHOft/t1utIxtoxKrqwZpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779071639; c=relaxed/simple;
	bh=fi/a/uOJoXtnLZ/RXy87dm1DpHonxbe+wZjz1l6FJgo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=uVVhj/8EulVZN9LN+/doMImH3MF2FpKSagT8BBe65Anc0Cg1xQw4sn/YCqqw1bz+u4urpwsivcDnQSTvAzNUTT7ZfNfy/HWRYwcBgkcJ5CJdwA48pTvRd4itr4H9vJPkEniV7CRbLauaWPZUdf8E5oTs8aOJuniYEH4RR3+mtgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N3ngeUrj; arc=none smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N3ngeUrj"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1354403c610so4690888c88.0
        for <linux-sound@vger.kernel.org>; Sun, 17 May 2026 19:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779071636; x=1779676436; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Bw8t8YaZd1NRiFwTl5V+lZA7YEM5BcKnKJ686K6uQ2Q=;
        b=N3ngeUrjrfksSTC7+IkUVSWhJijFBPjGCkZA1mM7Goe87nqo15xMYlmwbBSjmA8DhW
         sBNh9mhr3wO/Cf3P49NNRu3pipGOIIC2CD9Csr59nDTQ65OWooXHPL6n3bugXyIgAmIn
         IiXsZ3lwRnMR1rx0qpfXrfRtl2GGoXPvU5WADpVbGuErWnCWForr4zebd9ThjV3mP5MA
         HbMs9X0GhXGlWIsqY8GUzUIVlU6iogK9YIw64GY5HpsgFzWn5ljVmoiQFCVEnsi4D7Do
         pj5B8EeFkIkKg5lEd3ZtLpGObKLOylSiwe8rHuTwGtm/COlrMOgiEJlOWvt6qUzj28Hf
         OjgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779071636; x=1779676436;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bw8t8YaZd1NRiFwTl5V+lZA7YEM5BcKnKJ686K6uQ2Q=;
        b=BMinkEO29QUnaI/6O9e+ku9+vudk5uQsAhx5NpLveDE3CQtv/ZDfUV0TTOaBHT/vnP
         WEOLfaSBOfYkgIuUQgaWAtm9qhDUo/nmBeRcWWVyTgaxERYtSK5g0Qlsrb/8FlfaDong
         fHoxDSsrXFjvy97VuBpzRKb4tbJst+LPinxlQ7QKULStFBp4zxhPB4SCHRiMTuQGukDU
         amwzIFE68BA31Y8wfePK2g1+liZxg6+OMVS2kdMSUlym1S3yRDkKemX8qvTdSi5XRZWZ
         XZYe7Sd2uMesypQreDMeS2xQByGh0XumL5TP4uO3hQFJ4Jz+MYL26/EsEnTZsFGLubL9
         O/DA==
X-Gm-Message-State: AOJu0YyxcQuJymbixwl2yt1tde90MUgAhtIG7tyBjnLjB5wGeuwVdLhB
	Hr6GEPz0U3RR5kBbJuspMZtIhWKWfi1e/zRLPd0+Jbp+G6ha6T54M6WusMotaQ==
X-Gm-Gg: Acq92OHZzoZvmGf6DTggh4u/HhGdF2LvCZXg0zGBtIAjRBEks9L4sZbkdCLYweBPy0A
	HNiHA7eRV697kOOSmc2wsnN1gB19A60SRIQYst+4B1cBeAmtUQZI5K0PJrtFwC1xG+YCoAY4Nzo
	McMWcTV3fmT31lam6Oq8fKeKOB9z+fwlYh+GU9AxzzmHTXMVM3HcSJPEoCh3M7z+ETF2NwcosVN
	12z3kRohzrBKVumkaZXVI4RHY7MDyrdb7+U+ylTaSLUAFPUU1OSHeJhcqJHbN+nZkyMyBwyreDq
	t6uCr1xawb38Dr/knMaH2HUa4Jy8klsXHyFsLdfU0n6osbAiETP0amB3LFXfSb2MXcCDyKYsHUQ
	l9stQZs6EEQeHZFvSbELJ2yi89OHcw/hYCmqKP7e8FQ2+8iDv7uO6FoItz8oHoLusVLQdgZooDt
	cipRi1brx7rXERP0DZWN0FmpKCON7nGu+cO9Oj9y6NtzEg827ebBI1UDwkongbogeVZLpeEkeuF
	w==
X-Received: by 2002:a05:7022:6992:b0:132:83e6:41 with SMTP id a92af1059eb24-13504c5dbb8mr4946752c88.13.1779071636436;
        Sun, 17 May 2026 19:33:56 -0700 (PDT)
Received: from [192.168.1.18] (177-4-162-74.user3p.v-tal.net.br. [177.4.162.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cc33a618sm19439714c88.12.2026.05.17.19.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 19:33:56 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Sun, 17 May 2026 23:33:49 -0300
Subject: [PATCH] ALSA: ctxfi: Keep line/mic notification controls per mixer
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260517-alsa-ctxfi-mixer-kctls-v1-1-6e4f81f6b658@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMywqDMBCF4VeRWXcgCUWlryIucpnYab2UTCyC+
 O5GXH4czr+DUGISeFU7JPqz8DIX6EcF/m3ngZBDMRhlavU0LdpRLPq8RcaJN0r49XkUjMo1Qdu
 gmzZCOf8SxTJf4a6/Lav7kM9XDY7jBNxuYT56AAAA
X-Change-ID: 20260428-alsa-ctxfi-mixer-kctls-f0b7d1ad178f
To: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3566;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=fi/a/uOJoXtnLZ/RXy87dm1DpHonxbe+wZjz1l6FJgo=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDFlcVZPSLqY3xT58eSLtz+dZL9/uPXDR/dKEZwaMIof3/
 loidT3Fv6OUhUGMi0FWTJFlddIiyz1dD67Wx63wgJnDygQyhIGLUwAmwnuBkWHuxarWmxn6v/sE
 vA2fb4k/HqxSftZ6U4zTga//Zhqt++nO8Fcm3PT+9j/qeX859WcwrepKWGd3IFRfg0n+rY2713y
 Br2wA
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

ctxfi stores the Line Capture Switch and Mic Capture Switch controls in
a file-scope kctls[] array so do_line_mic_switch() can notify the
opposite control when the shared line/mic input selection changes.

That storage is shared by all ctxfi cards. If more than one X-Fi card is
present, a later card can overwrite the pointers saved by an earlier one.
A control update on one card can then use another card's kcontrol object
for snd_ctl_notify(). If that other card is removed, the saved pointer can
also become stale.

Store those notification targets in struct ct_mixer instead. The mixer is
per-card state and matches the lifetime of the controls created for that
card.

Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/pci/ctxfi/ctmixer.c | 17 +++++++----------
 sound/pci/ctxfi/ctmixer.h |  3 +++
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/sound/pci/ctxfi/ctmixer.c b/sound/pci/ctxfi/ctmixer.c
index 50ab69aca2fa..9abe1d53c3c5 100644
--- a/sound/pci/ctxfi/ctmixer.c
+++ b/sound/pci/ctxfi/ctmixer.c
@@ -221,10 +221,6 @@ ct_mixer_recording_select(struct ct_mixer *mixer, enum CT_AMIXER_CTL type);
 static void
 ct_mixer_recording_unselect(struct ct_mixer *mixer, enum CT_AMIXER_CTL type);
 
-/* FIXME: this static looks like it would fail if more than one card was */
-/* installed. */
-static struct snd_kcontrol *kctls[2] = {NULL};
-
 static enum CT_AMIXER_CTL get_amixer_index(enum CTALSA_MIXER_CTL alsa_index)
 {
 	switch (alsa_index) {
@@ -481,17 +477,18 @@ static struct snd_kcontrol_new mic_source_ctl = {
 static void
 do_line_mic_switch(struct ct_atc *atc, enum CTALSA_MIXER_CTL type)
 {
+	struct ct_mixer *mixer = atc->mixer;
 
 	if (MIXER_LINEIN_C_S == type) {
 		atc->select_line_in(atc);
-		set_switch_state(atc->mixer, MIXER_MIC_C_S, 0);
+		set_switch_state(mixer, MIXER_MIC_C_S, 0);
 		snd_ctl_notify(atc->card, SNDRV_CTL_EVENT_MASK_VALUE,
-							&kctls[1]->id);
+			       &mixer->line_mic_kctls[1]->id);
 	} else if (MIXER_MIC_C_S == type) {
 		atc->select_mic_in(atc);
-		set_switch_state(atc->mixer, MIXER_LINEIN_C_S, 0);
+		set_switch_state(mixer, MIXER_LINEIN_C_S, 0);
 		snd_ctl_notify(atc->card, SNDRV_CTL_EVENT_MASK_VALUE,
-							&kctls[0]->id);
+			       &mixer->line_mic_kctls[0]->id);
 	}
 }
 
@@ -778,9 +775,9 @@ ct_mixer_kcontrol_new(struct ct_mixer *mixer, struct snd_kcontrol_new *new)
 
 	switch (new->private_value) {
 	case MIXER_LINEIN_C_S:
-		kctls[0] = kctl; break;
+		mixer->line_mic_kctls[0] = kctl; break;
 	case MIXER_MIC_C_S:
-		kctls[1] = kctl; break;
+		mixer->line_mic_kctls[1] = kctl; break;
 	default:
 		break;
 	}
diff --git a/sound/pci/ctxfi/ctmixer.h b/sound/pci/ctxfi/ctmixer.h
index dd23d227aeb5..0c0963bba99c 100644
--- a/sound/pci/ctxfi/ctmixer.h
+++ b/sound/pci/ctxfi/ctmixer.h
@@ -17,6 +17,8 @@
 #include "ctatc.h"
 #include "ctresource.h"
 
+struct snd_kcontrol;
+
 #define INIT_VOL	0x1c00
 
 enum MIXER_PORT_T {
@@ -42,6 +44,7 @@ struct ct_mixer {
 	struct ct_atc *atc;
 
 	struct sum **sums;		/* sum resources for signal collection */
+	struct snd_kcontrol *line_mic_kctls[2]; /* line/mic capture switch controls */
 	unsigned int switch_state; /* A bit-map to indicate state of switches */
 
 	int (*get_output_ports)(struct ct_mixer *mixer, enum MIXER_PORT_T type,

---
base-commit: 910e9f1bc3bc96e6d067c405ba30d69c4feff46e
change-id: 20260428-alsa-ctxfi-mixer-kctls-f0b7d1ad178f

Best regards,
--  
Cássio Gabriel <cassiogabrielcontato@gmail.com>

