Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795453332;
	b=X5Dcet9cKZHtP+MhCI9zdSJl0VUPlCtBGaroXed+QjnmCpWZSLdtekUwNsJxcNvKg73g
	 gkiRrtlIsAyWFh5fZgTTJO6ynjk7ufgoI12OpkzefizKEEzYwCANsXhhzCmlZgkS7UghJ
	 KSIo0nUX3BWx+f/fQ6h3DdCyLgQsKz+Q0mUSt7PLuNBKZeJv/V+QSufOZGP4IxMp0uyZt
	 p/1/lKTLVPz2lhBLM0i5DKm+zKTEEY0KLWdS4nGyZw+I9tPRKfhaLXLUhwVdhYG4cB6wQ
	 RVXndDLJ6drEZvN5Gx3uvN1TxzdWS7Nwki++i/XonnNYG8LmTVJVevdUgoFB88tRmxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795453332;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=sajfz+VOzkFiN6Z4YSSWje5thArCDnqKYNZzEWbPt78=;
	b=JmpNTQZ0IX5hncnnYnaPATQm24V7r/Un8AzPdW3SKhfn+4YVsJeSk3oIClTvSxeUJa91
	 D7KNKy3HwZ7ahkaJ4pyfaCyHdshUzs1nGN9pn+bHDfCX5JA1Su1sT36lEJi8GswogTLx+
	 f0SxXSZoy+4U5VIPr1MVPbJz2akFabLhmqfDFTLYEWnaxS48mAyhmV7Pxt5FLIlTBZAxL
	 qz5b3mGLHWp5uGDG12HLK1/B/s9B2GvTalG6aDe2jyjO7atizgXFbZ6kEhB63VM31ympO
	 GFlkhJwKbA2xfCMwY7c2h7JwzmNLqJvIlBkUS3JEQjCMkekImEcS0Mo7RNcUXRXxKvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="fhKNW/tQ";
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67CDD606A31A
	for <linux-sound@vger.kernel.org>; Mon, 23 Nov 2026 17:02:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67CDD606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fhKNW/tQ
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1b50a4bd2f3so5198738c88.1
        for <linux-sound@vger.kernel.org>; Mon, 23 Nov 2026 09:02:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795453331; x=1796058131; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sajfz+VOzkFiN6Z4YSSWje5thArCDnqKYNZzEWbPt78=;
        b=fhKNW/tQqtlD+agu91CE51WLKBw09Istmps93yqU4/EEuatbwkm/FfNqORb8WMoZZj
         tSbAabc2t3LO5Z1RWXIG/wkOMJKhNMMm/LK9/1AXB0U/now30ZQuoAooNb5JnjGPTL+Y
         8dCBBKUBwf3M1yCbQH+h5GRh1AO9I95rGyPSq0QcuBVTbYPIMX3TGOHY2ObnSoTgMmjQ
         X7KxR/LGpNkSxwA0VKAw9UCQ+TshlfLRQ/EcdLkSem8jqK5G92b4m0qC3OJ2QfYiCvHK
         F2pkvlXSbk38o0EGA5NmDOwSqlccCZ2onOAQaY+CPTQSkqZbFvu1YZCtRpMpC9OMNRbl
         tkZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795453331; x=1796058131;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sajfz+VOzkFiN6Z4YSSWje5thArCDnqKYNZzEWbPt78=;
        b=zyuxHiTCdVs3uOXvHi7NzcJBet4HfigkPAmEQ2YxPdUYiYnoJZDoHh39Uyjma3RHnX
         uwePbBgiUq+fLUCga7uUGAUtKiw0kNM7PeNWf5nFJqCLolw4ogH9pluQ0h3Nxc2NtydW
         e1tJT6fW8IB4p9WP0In0azmW2NIy7FUDUT8gVXV4j018GqQ/6VDU2jbfc8ZIIjow6W8G
         2juJ0UTuXD1fa1PyyTOw8dNlmqana8fZCVWRMU95HkFb1GVpHX+DYluVXefKDx4PWrFw
         Ogko9vlKko14R5dnjJVWts4/6xMZCD9fWM11Vte7yMqd/Gvfl4UZTJX8ZuUulk3fvtkH
         GjxQ==
X-Forwarded-Encrypted: i=1; AL+hErEdp0Wfh+ahY3BWjy7ssk733mGvFeayCwcH6U8Ijm+wuRj6dRahzrm9quo8L2l5jZJ5nuu5jhYhxHLXYw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+pA6GAYikARTM0rolFjPD0P1uosXSEp5tD0rdHR36DTuLGtleV
	LRxkAyuuFFWSTFkDOcMSrijkg869Jb+mbrwep45l1VP7qGSzQaxGCfE7
X-Gm-Gg: AZFdTZeZF8gKU4GZcaunWZP8W4nJfIgRz43phrsXew97pGnvbII2hPnYxqNTVOydG4i
	uZBGpFmG/kL53Wrgc9BEc3394OgmCqdT5BebTTZ39lCP2sZ8nYAJHlVGZP+dJI1DdqK/Dzojtuy
	fKh73uiLGaFQ66MeRWy3xpg3vkOOmKDZvJyKpW3nLQk3V1zwWVDVbTJ49XvS+WHQOHxfLj2AtzU
	zHq3uoWLawzPCIHBs3RYgWbJOVN1HcMpUfvg11tDkCgdxQfckaehlovHNuEQLUnrOSw4AmK9FV3
	NeJEHtb0UBx2307rZfuvgAP6Ga/yR7XydsRbXjBIvv2KAZtP4nsZ/qHiy1DIk6OEq7d/t680guh
	+krkbrOUxUufroAFh1EswULTKpR9qa7v/P5B36LFAhNKStDC1yaNRRziSBPh3t9AWRLaloUKvzr
	ZfuwbHbTEkQuAu6M0JvfWY9eoq1l4U5iefnYRx++WbugvifkKVSozF4zooCF7J2QqX2Qgj0FJxR
	dOcRTzpqG3cXCx+Jbt5/LpAC981i3+nRdhNTTUqsWEqaSbPTflBsX4Ml8qZO3X7/spBbohe+len
	yMHEfGUYG/IrLFZ/CxU6CsTunOapedMPVj4dWX3RFwuCxVCAsBtiM/K4o7yokDycWCr4/IVuBsI
	c2OKiyco6ynRIAOxK4U/zOUJja+iJzO/dZz4TgobrOglVzvVQ+MLZkXN3+G8u0g6rc8jDcQCu5T
	i0zBgbBFS1Fk15NWZG+CS5IseLaCZA12eSQNoO+i/YyqA=
X-Received: by 2002:a05:7022:b902:b0:1a5:9abb:fdd7 with SMTP id a92af1059eb24-1b556877a2bmr11038677c88.9.1795453331420;
        Mon, 23 Nov 2026 09:02:11 -0800 (PST)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556840494sm30163645c88.12.2026.11.23.09.02.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 09:02:10 -0800 (PST)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnav Kapoor <kapoorarnav43@gmail.com>
Subject: [PATCH] ALSA: hda: reject invalid values in the IEC958 switch put callbacks
Date: Mon, 23 Nov 2026 22:32:01 +0530
Message-ID: <20261123170203.243633-1-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

snd_hda_spdif_out_switch_put(), snd_hda_spdif_in_switch_put() and
spdif_share_sw_put() treat any non-zero value as "on", so writes of
values outside 0..1, such as 2, -1 or INT_MAX, to these boolean
controls succeed instead of being rejected. snd_hda_mixer_amp_switch_put()
in the same file already returns -EINVAL for them.

Check the value in the same way before taking spdif_mutex.

Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
---
Tested on a Lenovo V14 G2 ITL (Tiger Lake, SOF, 3 Intel HDMI
converters, 7.0.14-based kernel) with raw SNDRV_CTL_IOCTL_ELEM_WRITE calls
on the three "IEC958 Playback Switch" controls. Stock: 2, -1 and INT_MAX
are all accepted and read back as 1. With this patch applied to the 7.0.14
snd-hda-codec module, all nine invalid writes fail with -EINVAL and leave
the value unchanged, 0 and 1 still work, and the card comes up as before
(no new messages in dmesg).
The SPDIF in and shared switches don't exist on this machine, so those
two hunks are build-tested only (W=1).

 sound/hda/common/codec.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/sound/hda/common/codec.c b/sound/hda/common/codec.c
index 51189e305ece..0470f4e085f7 100644
--- a/sound/hda/common/codec.c
+++ b/sound/hda/common/codec.c
@@ -2353,6 +2353,9 @@ static int snd_hda_spdif_out_switch_put(struct snd_kcontrol *kcontrol,
 
 	if (WARN_ON(codec->spdif_out.used <= idx))
 		return -EINVAL;
+	if (ucontrol->value.integer.value[0] < 0 ||
+	    ucontrol->value.integer.value[0] > 1)
+		return -EINVAL;
 	guard(mutex)(&codec->spdif_mutex);
 	spdif = snd_array_elem(&codec->spdif_out, idx);
 	nid = spdif->nid;
@@ -2557,9 +2560,11 @@ static int spdif_share_sw_put(struct snd_kcontrol *kcontrol,
 {
 	struct hda_codec *codec = snd_kcontrol_chip(kcontrol);
 	struct hda_multi_out *mout = (void *)kcontrol->private_value;
-	bool val = !!ucontrol->value.integer.value[0];
+	long val = ucontrol->value.integer.value[0];
 	int change;
 
+	if (val < 0 || val > 1)
+		return -EINVAL;
 	guard(mutex)(&codec->spdif_mutex);
 	change = mout->share_spdif != val;
 	mout->share_spdif = val;
@@ -2632,9 +2637,11 @@ static int snd_hda_spdif_in_switch_put(struct snd_kcontrol *kcontrol,
 {
 	struct hda_codec *codec = snd_kcontrol_chip(kcontrol);
 	hda_nid_t nid = kcontrol->private_value;
-	unsigned int val = !!ucontrol->value.integer.value[0];
+	long val = ucontrol->value.integer.value[0];
 	int change;
 
+	if (val < 0 || val > 1)
+		return -EINVAL;
 	guard(mutex)(&codec->spdif_mutex);
 	change = codec->spdif_in_enable != val;
 	if (change) {

base-commit: 11ef0d515100259c7979f5b4c61b6ea97c6cdc27
-- 
2.53.0

