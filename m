Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11A7F1DFDE
	for <linux-sound@vger.kernel.org>; Mon, 22 Jun 2026 00:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782087136; cv=none; b=BdxX9Ipc3qkVjsBnZCq31QdOhpTqW+6MAaiAbLCfOHqCaGoBlbewNAtl+SxwJZfpl9TnTKdfLau9Fgl/BAQODLNO8CflikAUNdE6iDZaxbnWkvdqiuaN7oCdkJrdTzXK/HgLZB7treLD62+b0vm8Ot6aK9QNkdjfawrXZuBkcz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782087136; c=relaxed/simple;
	bh=roMPaYzQuN84DgAoGzr38yj3W+IMH5nxRejgA5BUsbA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e7E533/0fb2rpThx2WCpekvLwUMpLnWeP5Kh1iB1WXUNovWJVWjWTP7xAitGGjitW/RbTU6y6e4WOobZ/TDlzYqB9HQRxhr2coxCHBx6hky2Ai6ZlT0i/0xyUoFMs+FUA+yWtrHIS8RES8DbnDPtIHfi2VJPmG3do4Jra0UqDNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ExEQG0nd; arc=none smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ExEQG0nd"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-662bf1dab83so4361396d50.3
        for <linux-sound@vger.kernel.org>; Sun, 21 Jun 2026 17:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782087134; x=1782691934; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=86l1LHf81Z0/emObwIkbmKWODVzsklNtm70+8mvUbzM=;
        b=ExEQG0ndpyqHFB2GUC98BUKwyvAWsxACqm7if3gntk7GEODlhCd80bwgezm9wI/cX1
         QcuZuZ9V8yhSHBmEaapc9nShI6I67HpXvdywJm+M47SILmsV41Lj1kyXh/LxDr0pq1i9
         SRz/k594STdKkSX3jMxBezKrhIvCk0p2T/tea0/Qa00HO317+Ae4f1SeAJNXuPYtaOPi
         UR04S3nedIJoPwTzbSv6w2qXIcWknphhnt8XUuiOPdo/dj4b0tJLueIgojjA9fSvbCRU
         7WKL+5eCyM8cioadS2vL4FhCVk8ogQOyIQnNmXTWQCdusSQ/jw1TjgovRumv7rSYgBEB
         6InQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782087134; x=1782691934;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=86l1LHf81Z0/emObwIkbmKWODVzsklNtm70+8mvUbzM=;
        b=ZNHtk4kjErYXcI9Y3MuHROgR1UaWhbiD/SK/TexIv3rCilZRy1HCYa7TQsLbhYPIbt
         DYjukYy4bvapDa8QX52RdO2Kchrs0VSeCVMZiaVs559hEBygFyO6d/UP2tmVjlqsZDAZ
         S/k6TdqELsksVjbqrZYJwt2G1al4oX0QLUIaV/wI72zFGxkvMrUqw0UfyYSfyz8gZH7y
         Z7dU/C/IZWWpgktO/gsue6vlW2m4nFZVaNpnkDQI3d/Eol7nptng+2aW+adEt4CU0A7c
         MEZrjmq+TjeqzY+leJS4Oz5SE3jjxrXLcYRa5dKNPwy8/iKMIrKUu/940B/SAGlhNHbD
         HOlw==
X-Gm-Message-State: AOJu0YwtlFFcrrdYypRQUgb0ZRIvRaJVxoREXA63VaDle2D7DcsQG7AD
	wYcRt3iJmwvxPFGHjHtEEn3Nzj4uEPwp2GRtC8Wkfpf/L27x40iVt6El
X-Gm-Gg: AfdE7ckSXnV2dylC9Ar+eLiNBpETVU2QaRwt2+JIrIG1iwxfm+yS9YsiCGwwhjcm0ez
	PF/hEs9PheVJMC6QI4pPa2CYGkPem1LkEyUJHbzEa4wbamR7nTZYUpgkj5uAF5g8TgvtwwcJXxv
	oYLHTiwh3KYHiwcW2JVB62jjov/hPH1HDC0fz4WaMsTeuuhqMy9KOqnUQ8FjoAyfkVPTvMIRklE
	ErFnv2sl1vdijVDjxiz5Q654ANG18Uh4+Z6DO/mjISGkHQwHcMiUtQWzqSobCpejjzaVzWMXR0E
	7O8mTG2Lj56dB+jommUasynXVViNeR8MEzeV9hcMEYzqhRxUYKxW/ygxKOmwwwEt3N19U3pgG/s
	ZMs93SHb1v8LBcvrRSAzzk90dPMUG2+4oaozANpWPP5a3uDR7bHKjhBv0hZ6cQ5SHrUj7VFnyWw
	1K
X-Received: by 2002:a05:690e:d44:b0:662:ebb0:36fa with SMTP id 956f58d0204a3-662fc7b6412mr11922117d50.20.1782087134092;
        Sun, 21 Jun 2026 17:12:14 -0700 (PDT)
Received: from yogi ([98.97.8.71])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66314b6cdb3sm2907468d50.8.2026.06.21.17.12.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 17:12:12 -0700 (PDT)
From: Chris Aherin <chrisaherin@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chris Aherin <chrisaherin@gmail.com>
Subject: [PATCH] ALSA: hda/realtek: Add quirk for Lenovo Yoga 7 16IAP7
Date: Sun, 21 Jun 2026 19:12:10 -0500
Message-ID: <20260622001210.20553-1-chrisaherin@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Yoga 7 16IAP7 (board LNVNB161216, codec SSID 17aa:386a) has pin
complex 0x17 (bass speakers) wrongly reported as unconnected, causing
only one of four speaker pins (0x14) to be configured and resulting in
mono/tinny audio.

SOF corrupts the PCI subsystem ID to 17aa:0000, preventing SND_PCI_QUIRK
from matching. HDA_CODEC_QUIRK is used instead, which matches against
codec->core.subsystem_id read directly from the HDA codec register and
unaffected by the SOF bug.

Applies ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN, the same fixup used for
the Yoga 7 14IAL7, which corrects pin 0x17's default configuration and
enables both speaker pairs.

Signed-off-by: Chris Aherin <chrisaherin@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 2df491335..c83c1654e 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7755,6 +7755,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x17aa, 0x3865, "Lenovo 13X", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x17aa, 0x3866, "Lenovo 13X", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x17aa, 0x3869, "Lenovo Yoga7 14IAL7", ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN),
+	HDA_CODEC_QUIRK(0x17aa, 0x386a, "Lenovo Yoga 7 16IAP7", ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN),
 	HDA_CODEC_QUIRK(0x17aa, 0x386e, "Legion Y9000X 2022 IAH7", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x17aa, 0x386e, "Yoga Pro 7 14ARP8", ALC285_FIXUP_SPEAKER2_TO_DAC1),
 	HDA_CODEC_QUIRK(0x17aa, 0x38a8, "Legion Pro 7 16ARX8H", ALC287_FIXUP_TAS2781_I2C), /* this must match before PCI SSID 17aa:386f below */
-- 
2.54.0

