Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A37C3FD969
	for <linux-sound@vger.kernel.org>; Tue,  4 Aug 2026 18:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785869680; cv=none; b=lNN9+tcH5/a3TJmVwYORXLgvt7Qc4JJRgRJtWSdPycCcTpXfrUCDf7bxAaZ9dFNyVi0hayloafxH6iM4KeP0rcbSEU0JiiPGUEpNCJypiKIgxP5/0SOQC4337VH40hvqYmQetYmQje98Ml6qRe/VSmsZHIRnAeOiU89OzkzbuSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785869680; c=relaxed/simple;
	bh=DeFg+nDD2x1NjIvUTqI8MnI5N86ecUEvHQCPQQIScos=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LgLqkG4VbzdRxNQFZpwuqRxXKYLxLF4ElYSEB2kjOqy/NKx4PrwAXDpj3ttL1NT+dIZ5QRH9dDIuxXFhoATJvQEQtqh/woyxGrbmT0JivGZvKuhD4avhqjQfd+cwybcl8egPcnr8xgiiUATtS3lQ0rUwnC9AM2eW901Qnj+TpWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f9rG6pdP; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f9rG6pdP"
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-4ab8cb2a6e4so136582b6e.0
        for <linux-sound@vger.kernel.org>; Tue, 04 Aug 2026 11:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785869678; x=1786474478; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lLUA5X7qyIfLS2a5Dgvy6keCVBUPNIR98EytOlHanY0=;
        b=f9rG6pdPR6lpLK+X/vg9cPeb7q3n4Fb8Lv0cusk1xmdYCFbEAlEksVcKY11cyuNkOw
         RHYyQHGpYDVJP9LKubf0pkgUVPvJT3kUrhj1UAU8533CP0n7wNOZtKLsWnqx7CPusoYG
         AizkbPLIGoq/wTGS+6/g9nzfTGXVXVvOrOl4pyn6Td6r2A9QgcMPDPb4oaVxEopzoBUy
         4dzEzWHCNaqjDIfwIuHfbcRg8h0lii4CIoJQtx2UFYXKWgyf50rG019kTBXTSbB0LvV8
         XHpv7fteeV+OxgBc82GqiHPbKe57ncywRIGeLzeJuQEgt3fMGDC0xa94JndUZv6Sopgt
         bshg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785869678; x=1786474478;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lLUA5X7qyIfLS2a5Dgvy6keCVBUPNIR98EytOlHanY0=;
        b=PevdTIceDp+OyxVC12gZdtv+JNU3pvpKVybrv+OPIKlUOiFW5pSa5gqB3rQ9jvcfVU
         AgN2m7soCreN3Y/bksv/fQV1gbb4zvSTVo5xcOVHBVhy81DtqmOdkqJSh0PiAJ7YvGwk
         AnwnR5W8fGFVLG/za9+TsHSdbGN+QX1/gkGe8QH2zjIb5LbZAE3uIZIpujamAxOBleSH
         HMTZaHrxSmNZ1Ia00cTxXmGUgve3L6CHzM4W9e+12Y1Fg1/ZkEnPVZUirzA+qwfK8UjS
         iYNQsneqzJWVW4KrwjMFGeath6vzYpsaNpElQQeWryao9bRFXTnQOfFK81xsezh4qmMv
         YYnw==
X-Forwarded-Encrypted: i=1; AHgh+Rr90KWi8ITH3ABaE6No/MOXXeEIx72DkUEVLVOoHJ753KvSCNlqhqCDecQYkXIpT3xb/wQfI+D64SX02w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzeX4rKVAee2PV88p/rrSY23XftEfaOxDq5NykXegTNscltwSBH
	PSlVF8vsKTlfFT3vlCUdjWFeMlFAIpq2y/T6XXlG3y0RtpQvncsIUB5E
X-Gm-Gg: AR+sD10xGbYjsIKYFD7DrWAADkJJK30CNSE416YVk3GMUAK2etL3ybDLbTmFDVDd5+Y
	zUpCM1T2Rjt8zGOvNnD0oXZa8MzckhkuwEMr4i/2ktP66r8um5qpBRbTpVtlh+ahbxKEl2lGWqc
	zZ8VoWUwoiRTPbJsktcO21eyBnlCW+pIapeV0iH0Kez2alO9N5ANieX0rALWSsBUTy02+pwcYf0
	7CoeEqtKda580fMTN9ddUsUG4r8dyh3s0u1vwOmC8QGdqDDSSFESHNr32Go5EWx+2e8FR/64mlB
	NKxmfLj1Q/jlrpaHseWhLP0SfW4Caq1nlOln3iiYHFkgDndJN3NnLhb5lFJqbxNN3g6SX/f5lze
	XwoybLVvv++z/XQR/61oTrctcK2VnWlKEN80snes3/7jCqM4DDBtlcSpB4WjrqzpQhrWeTPa8H9
	h+TOFIO1mAUhT02B+Q7VDfb0K6ncGHw64UDf4jUBwsZ6dJsCA=
X-Received: by 2002:a05:6808:1984:b0:4ab:32ea:95f6 with SMTP id 5614622812f47-4afae09eff9mr440182b6e.13.1785869678110;
        Tue, 04 Aug 2026 11:54:38 -0700 (PDT)
Received: from pc-i7 ([192.3.12.183])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4afae458389sm178119b6e.2.2026.08.04.11.54.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 11:54:36 -0700 (PDT)
From: Aaron Ma <mapengyu@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	marco_giunta@outlook.it
Cc: Zhang Heng <zhangheng@kylinos.cn>,
	Kailang Yang <kailang@realtek.com>,
	Damien Dagorn <damien.dagorn29@gmail.com>,
	Bob Song <songxiebing@kylinos.cn>,
	Lei Huang <huanglei@kylinos.cn>,
	Sean Rhodes <sean@starlabs.systems>
Subject: [PATCH v2 1/2] ALSA: hda/realtek: Fix headset mic on Legion AW88399 laptops
Date: Wed,  5 Aug 2026 02:53:24 +0800
Message-ID: <20260804185325.22861-1-mapengyu@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ALC287 codec on Lenovo Legion AW88399 laptops does not mark
the combo-jack microphone as a headset mic, so the HDA parser
treats it as a plain microphone. The headset microphone route
and inline headset buttons are therefore unavailable.

Enable Realtek headset mode without treating the jack as a
headphone microphone, and enable headset jack button handling.
Suppress automatic microphone selection so the internal microphone
remains selectable while a headset is connected.

The existing 0x1d override is redundant: firmware already marks
that pin unused, and the override triggers a "SKU not ready
0x411111f0" warning. Drop it.

Signed-off-by: Aaron Ma <mapengyu@gmail.com>
---
Changes in v2:
- Based on the original 1/3 (df2538d54b3c0 "Use AW88399 I2C fixup
  chain on Legion machines"): reworked to enable headset-mic mode
  and inline buttons.

 sound/hda/codecs/realtek/alc269.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index f7877127e0e49..30d71575bac3b 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -3276,21 +3276,19 @@ static void aw88399_fixup_i2c_two(struct hda_codec *cdc, const struct hda_fixup
 static void alc287_fixup_legion_16iax10h_aw88399(struct hda_codec *codec,
 						 const struct hda_fixup *fix, int action)
 {
-	static const struct hda_pintbl pincfgs[] = {
-		{ 0x1d, 0x411111f0 }, /* unused bogus pin */
-		{ }
-	};
-
 	/*
 	 * Force DAC 0x02 for the bass speaker 0x17, as the default 0x06 lacks volume controls.
 	 */
 	static const hda_nid_t conn[] = { 0x02 };
+	struct alc_spec *spec = codec->spec;
 
 	alc269_fixup_limit_int_mic_boost(codec, fix, action);
+	alc_fixup_headset_mode_no_hp_mic(codec, fix, action);
+	alc_fixup_headset_jack(codec, fix, action);
 
 	switch (action) {
 	case HDA_FIXUP_ACT_PRE_PROBE:
-		snd_hda_apply_pincfgs(codec, pincfgs);
+		spec->gen.suppress_auto_mic = 1;
 		snd_hda_override_conn_list(codec, 0x17, ARRAY_SIZE(conn), conn);
 		break;
 	}
-- 
2.53.0

