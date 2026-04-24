Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B2523AB28C
	for <linux-sound@vger.kernel.org>; Fri, 24 Apr 2026 11:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777029694; cv=none; b=Cs3tsXwmZ6myLxwNXVUgMVmu29Y4DXktvHXnvgU2WF0yySQA/H5Bq69EzecMQCEw82c0+OuBtzglu1Nyur2YbEVk8jIRRntfcOAgDO+s+aibFePwtPaZv5bn3v199l1C/jH1DbAcpSYORGJ4zwNfXqfi/5vMeOUSpErZszcRF8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777029694; c=relaxed/simple;
	bh=b49CYPyXZSrk+jmQ8Cm0VKXMjEnzRwFtBgZ5g5pW+1s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=baeWQ/+lF66jEcPHtoWYr0GbO/XaiPT6XmSu/OGPp4G+TWp4wG3aMm84XyA2+kCc6E0rqJuvsZoJWsjk7dH5Jk3VVupICXCU5EpUOqo21RqI2bkL1gxWWq1Z0i0b/3QituWv0PrVZTjMrOIYlJu1FyeLV32O8RjdTlZYxbuEO+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ltzIxOT9; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ltzIxOT9"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-505a1789a27so38530941cf.3
        for <linux-sound@vger.kernel.org>; Fri, 24 Apr 2026 04:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777029692; x=1777634492; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UN8Csv0zNcXBJYRBa+x5U5wyxmo3h4IS5Nfd6Ui5Mw4=;
        b=ltzIxOT9/XJARLwr1kDmfhvyA7tDnIlcfHLAgC4olMakPOAMPZE4s5Kno4b2DgN/Kz
         InbJR57PjHHD6Diy+ldru8q2re0CiPRtO7hcOcWuQYf0Iu3vg1oYIwqbcilXXh/mtu+l
         2TJHBxC+LQsedn1GBkcLnQ+qA1ifTLxphXRpC8/mn600xgFeT0QuJ5WgeiNrwTJ2VTVl
         a0gz9px9aY8mwOgVwH6bKTb3vw/zpXd8/h83pgPazR5W6Da3SRRxxYQRM8p9t4XEc0oE
         jmv9jPR5kdPHvqPZLmVI+29p/RAwACqc0o+EDkKpXKeUTUtjgXRWBYuBTLGlDzRN9aEE
         /HaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777029692; x=1777634492;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UN8Csv0zNcXBJYRBa+x5U5wyxmo3h4IS5Nfd6Ui5Mw4=;
        b=Z3Ific2WKQHk0++0dAQz9h0cLQEgO6nyVkt+ziQmk1JT8xtOlGKMjHYNzYuI44Plit
         RT+biiNftZ8FWUFuY2KmgdJLb5H/mX6GSHpkdxXEECaDYe03D8CYv8rT9CjYhujcJ7Sy
         75DzuPHW0xswnja1z3FKl5ee/JPUWpda/6lGXNYVFb2ApxMHC9bNCk2+3UKARb7Q8VJB
         aF0lJMHAwJiKyNkjFF3Uz0VmfSXgODW0Efo0b8Z48gRKLkHFrpDyoJMVgJnlC1hInjf6
         RkOC41d2hAktWwdfomG6OiUqxjdTsEoGIg2GnfA2li6tlfsqXkkpnMXqOx6SP2RiPiiw
         43vQ==
X-Gm-Message-State: AOJu0Yz8Z6MGbxDCuR6BkgMstONiT6FVzevxtx4RRs9/BjkH8qEWz2Ek
	6PyH77IyVBTyXXxJ34aFZQWgXdT9IVEpMrl7KCpu8IaYQgZi7k0R+Ig5VVS+kTFOGnY=
X-Gm-Gg: AeBDievppEVBBbNv5faGVH8zTB4Ykezcvpz9M+CLDV9o25ztIldc/9Pt7tC5F7xdtNk
	c/VsQZEYpMMwQB9yPSyF2Qsac1EZ4tfgZg3KPzAc73mg8BPM8of6FyCmarjlV0L6LfgPyuhjR+K
	zLXQvayfXoIuVw+SjVee3AA/GbNVfsiKfKwnwNw/ZEEK6ox0LJQt94rGNzNEuJfm2N2gQ0p7aH7
	8sFhRfrLN4cwK0+u72XuFOX8f++oAhfbohSL+1S1ij9y5RHT3IvyQrHOOwy6/4K+nO3CRFmzemp
	zQ383inTir0YzRSF02JLxAKOhja6CSJTwZrJU1UDE4hyYBa+P7TdWpDowrW1QILzJCPIY1Q1lEt
	2E1sYPZ2IljjHSML8HxvAM1Gp511/ON3Ora0UrV9NBJn4umFHoSgh4GekQIKno7dAyk0rGG240L
	lUD2vu8M7MFkneNy/nIekwrPmk2OUQ0tzLg2Nin74=
X-Received: by 2002:a05:622a:4c8:b0:50d:83d7:686a with SMTP id d75a77b69052e-50e36c08b20mr468048751cf.40.1777029691978;
        Fri, 24 Apr 2026 04:21:31 -0700 (PDT)
Received: from qyx596-laptop ([67.215.248.117])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50e392e351esm182339871cf.7.2026.04.24.04.21.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 04:21:31 -0700 (PDT)
From: Yuxuan Qiu <yuxuanqiu596@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yuxuan Qiu <yuxuanqiu596@gmail.com>
Subject: [PATCH] ALSA: hda/realtek: enable mute LED support on ThinkBook 16p
Date: Fri, 24 Apr 2026 19:21:07 +0800
Message-ID: <20260424112107.22206-1-yuxuanqiu596@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On ThinkBook 16p systems the platform mute LED is present and
bound to the audio-mute trigger, but it does not react to Master
mute changes.

The affected fixup chain sets up the DAC routing, but does not enable
vmaster mute LED handling. Because of that, the generic HDA code does
not mark Master Playback Switch with SNDRV_CTL_ELEM_ACCESS_SPK_LED,
and the audio-mute trigger never receives speaker mute updates.

Add a ThinkBook-specific wrapper around alc287_fixup_bind_dacs() and
enable spec->gen.vmaster_mute_led during PRE_PROBE. This keeps the
existing DAC binding logic unchanged while allowing the normal generic
LED path to drive the mute LED.

Signed-off-by: Yuxuan Qiu <yuxuanqiu596@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index b33f42576..b79a58079 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -3694,6 +3694,17 @@ static void alc287_fixup_lenovo_thinkpad_with_alc1318(struct hda_codec *codec,
 	spec->power_hook = alc287_s4_power_gpio3_default;
 	spec->gen.pcm_playback_hook = alc287_alc1318_playback_pcm_hook;
 }
+
+static void alc287_fixup_tb_vmaster_led(struct hda_codec *codec,
+					const struct hda_fixup *fix, int action)
+{
+	struct alc_spec *spec = codec->spec;
+
+	if (action == HDA_FIXUP_ACT_PRE_PROBE)
+		spec->gen.vmaster_mute_led = 1;
+
+	alc287_fixup_bind_dacs(codec, fix, action);
+}
 /* GPIO2: mute led GPIO3: micmute led */
 static void alc245_tas2781_spi_hp_fixup_muteled(struct hda_codec *codec,
 					  const struct hda_fixup *fix, int action)
@@ -6447,7 +6458,7 @@ static const struct hda_fixup alc269_fixups[] = {
 	},
 	[ALC287_FIXUP_MG_RTKC_CSAMP_CS35L41_I2C_THINKPAD] = {
 		.type = HDA_FIXUP_FUNC,
-		.v.func = alc287_fixup_bind_dacs,
+		.v.func = alc287_fixup_tb_vmaster_led,
 		.chained = true,
 		.chain_id = ALC287_FIXUP_CS35L41_I2C_2_THINKPAD_ACPI,
 	},
-- 
2.53.0

