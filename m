Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B747E35F185
	for <linux-sound@vger.kernel.org>; Fri, 31 Jul 2026 21:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785532397; cv=none; b=u6w5VEKdJbkPg0/WEJmnkxUAoTLYRLspGz3sRdG5o/XMJxJ2T/GIfoJ0fGZ3JdN6iY3ByhYllP4BXbAUGj6NBZ38FB3ESvQ2zCvNCvy8lpL5qPtTDUGZi9UXjzpZkrt70afmHcdb0+CGYhyqRPKuHAvO2HKMnP9WlTiXKUDRFHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785532397; c=relaxed/simple;
	bh=1oG2RWYzF0PwhTrceD8r7XkH/M8rfBdZiXKoiNI6lOM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bC5PspwoYcibHM1ss8hrZ5zG92K2RdGRjR6/BfCmJDrE2cM+aJ1pgnHoS4sAOaqWarSQvVbPd5D3PZHNhUPCAI9p6suCdsTpeQ5xkYgqm2Qq7gINDEXj6P/HJIhTX65KlrA/kBz25izaEJSo7HqoTTsKV+99DIeuNv6jKj65fcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems; spf=pass smtp.mailfrom=starlabs.systems; dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b=s2qcjN6b; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b="s2qcjN6b"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-476a130c138so1839088f8f.0
        for <linux-sound@vger.kernel.org>; Fri, 31 Jul 2026 14:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-systems.20251104.gappssmtp.com; s=20251104; t=1785532392; x=1786137192; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zryLgg2nlXQ0G8Ss+lOQIVsZbJUsYpX9W6/njBVfMXs=;
        b=s2qcjN6bqnJtaZpe2JVmr79ZbRYOPt34EEk+QlFsz2NvkiZV0hqIY7BZp7kIGfRyP3
         w2f5tJq3xhGqFPo6Qshca7ZnELGXzU4yGp5XX6DR8YZ4EvrJfvjW10VBBrQ4QdnMCbAe
         TLfRfp3k050HDE5xtkilsQSM/gS7j1Rz5fWZ1xqPbDkDK38fLUpuUW+hdE4nqfVrE6SX
         c6sNiTwS2AlrOHl5wZtWngebEYJRN/n0JeFMmNSAKBEkCH+f91uJZZc5mKJIptd4T9PI
         nW95fVD8cI/rPRMJ/9swCjocEudgwMTUJAaFmWydchA8zB+FFeStKKZ8HkkJEqd/FCV0
         0e2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785532392; x=1786137192;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zryLgg2nlXQ0G8Ss+lOQIVsZbJUsYpX9W6/njBVfMXs=;
        b=ez1Iq0B8SogZnqTqA9c8JoB28YZ4IkmDIBmYNeAQrSjTs3mKmzFqf+a7LvxwV6cfRb
         2C7X48R8FQpgR9ceaI+NlNAE3KTSQe6rWeRyk43avn7ufPn1k6Vcnbv5Tclenr6UYEBG
         beEYkDp8aRjAk8ePWpTRylCPssvAWhiPPGFR/rHd4IpKLNu65jaOzpFyyrowLhjACXhD
         4JmMeYtidIEMFeYyTfmK5pYr9xSOORImesJyXM8FJu7oTuNGLNQ883JiBYT0JmNrsBfW
         XGeK062FHFA6ciiJ2npO2+uA7hGFjHQ4bohpNv1Yjrl9sB091mMc2iLhgwxms8DVOLRW
         qRqA==
X-Forwarded-Encrypted: i=1; AHgh+RpSzxDEpchNCkMJ2nYLbYd9LMFkZj9NkuI2H2pIVSVsfRwSgA/CAX6eFw/ztXsJiLuDzqTkaFC8nOj15g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyYKGr+LMFJZ9RMNA6GbSk2dPlVku8YIQ06v/RUJXqWFelQgZmf
	N4ch6zK9eFYt4qq9dgIKjlShwPjwv8BOxUf5Vz5tFNzbHlu27tiX9oKbVByhr5EnAA==
X-Gm-Gg: AR+sD12vmz4UhMpvcF/U6DqhDMdh2c6yZEtjJP75qo63uAxAMXV0W5pajvRvAw3Hd5V
	mUK7hxkPa6Tu71HJbOh+qx4dd0qTttGiWd3SB7mU6VkBu2Lc7mm9JwH2AJP3eqNlItLmEAHt7zN
	IviH86pF/1Ks70zexdNjXa2YhKTvQ/8+7odXHQmfpPcR11Wmr0HuC//MRQuEsBypU/iinpmKPPs
	fHxjDx8R5NSLVIK8RTksew5koriJqg33jEkLhaDEcQsEZ7hN0C51fseVZ3Sor5tMlcESRBmvqFo
	Kl4SO/VdNmvriDCMIhv3W1kDLpOUVYt/ivyitOUlhORT+Zys6pkaxC8mlVRE3stYpnUPgVo1jbg
	SUUYh1prO+22Daa1TzzN6Ldvk5Exdy3RFynyf8GxXFZsYeJKIA7ZeYCSraOgyfoNneBEN72qjZo
	kSonRvtuKPspBLgAcAnkDSCQdyG+6ytPe4BN1N7ooh4b45//Q7L3vo9/DdsazFuX/hqcmX0BQ4C
	Gal7XM70lEcadTFCIlF0qW0kA==
X-Received: by 2002:a05:6000:2997:10b0:47f:9404:80d7 with SMTP id ffacd0b85a97d-47fd72fa16emr1658820f8f.46.1785532391408;
        Fri, 31 Jul 2026 14:13:11 -0700 (PDT)
Received: from horizon ([217.155.46.38])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd45a0c8bsm9524142f8f.34.2026.07.31.14.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 14:13:10 -0700 (PDT)
From: Sean Rhodes <sean@starlabs.systems>
To: linux-kernel@vger.kernel.org
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Zhang Heng <zhangheng@kylinos.cn>,
	Kailang Yang <kailang@realtek.com>,
	Damien Dagorn <damien.dagorn29@gmail.com>,
	Sean Rhodes <sean@starlabs.systems>,
	Chris Chiu <chris.chiu@canonical.com>,
	Lei Huang <huanglei@kylinos.cn>,
	Eric Naim <dnaim@cachyos.org>,
	linux-sound@vger.kernel.org
Subject: [PATCH 1/2] ALSA: hda/realtek: Limit Star Labs internal mic boost
Date: Fri, 31 Jul 2026 22:13:08 +0100
Message-ID: <be87292613b24150d6321adac102b4b25d00e9e6.1785532385.git.sean@starlabs.systems>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The 30 dB internal mic boost is too high for laptops, especially with fans. Limit Star Labs internal mic boost to 10 dB.

Signed-off-by: Sean Rhodes <sean@starlabs.systems>
---
 sound/hda/codecs/realtek/alc269.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 379e1458f4ac..42756a3f3f8e 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -4188,6 +4188,7 @@ enum {
 	ALC245_FIXUP_CLEVO_NOISY_MIC,
 	ALC269_FIXUP_VAIO_VJFH52_MIC_NO_PRESENCE,
 	ALC233_FIXUP_MEDION_MTL_SPK,
+	ALC269_FIXUP_STARLABS_LIMIT_INT_MIC_BOOST,
 	ALC233_FIXUP_STARLABS_STARFIGHTER,
 	ALC294_FIXUP_BASS_SPEAKER_15,
 	ALC283_FIXUP_DELL_HP_RESUME,
@@ -6725,6 +6726,10 @@ static const struct hda_fixup alc269_fixups[] = {
 			{ }
 		},
 	},
+	[ALC269_FIXUP_STARLABS_LIMIT_INT_MIC_BOOST] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc269_fixup_limit_int_mic_boost,
+	},
 	[ALC233_FIXUP_STARLABS_STARFIGHTER] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc233_fixup_starlabs_starfighter,
@@ -8099,6 +8104,7 @@ static const struct hda_quirk alc269_fixup_vendor_tbl[] = {
 	SND_PCI_QUIRK_VENDOR(0x104d, "Sony VAIO", ALC269_FIXUP_SONY_VAIO),
 	SND_PCI_QUIRK_VENDOR(0x17aa, "Lenovo XPAD", ALC269_FIXUP_LENOVO_XPAD_ACPI),
 	SND_PCI_QUIRK_VENDOR(0x19e5, "Huawei Matebook", ALC255_FIXUP_MIC_MUTE_LED),
+	SND_PCI_QUIRK_VENDOR(0x2145, "Star Labs", ALC269_FIXUP_STARLABS_LIMIT_INT_MIC_BOOST),
 	{}
 };
 
