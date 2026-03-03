Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A85CC42EEBD;
	Tue,  3 Mar 2026 19:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772567334; cv=pass; b=fylGDKkSdE01xkJdqqWMjuQb6ii4zBacmr0aVQTj7+rIqDeYarS0ppHWGC6f0xJDIjAF0+al83XPPJPL1XCFPd+43GgOqy8PmprCXxX4VpVHyol5RqttW6CCxrxITs/GbbeYBZeDfanPJO/vKANikzoLaLf9WyDOgHk8cSHGQH8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772567334; c=relaxed/simple;
	bh=k/j1dDb0TiBV30wnb9DVBj+O831fHg6SEj20fhuUzMs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S9/C11B/GpmJwS82pjaeZRoviVngIcpPCtLk3+QRwqBxtpy6iG2m2MGc9EO3CJRUzt05nAFsAgkPgVnbN00gD6n5VRfdwtWK2wMhcKJmSRxlrv5hc33i7m3noH+V8Nph6WkItcowE8d2StU7LuhjJIK7rRyM9dsNiuzbSULiB1M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=YB4g8/Kj; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="YB4g8/Kj"
ARC-Seal: i=1; a=rsa-sha256; t=1772567319; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=UX6LKg1Y84bUd2W/D2GnnKswTubIoMEehjSVCwfzMd1AnzirWE5cuHcJ37U7RkihTQVoIztwgOPfOHsvQuJd7avztmL/baxWnYq0mOeg8pBe2GLisgv/+O64jE6lsGhH3ghoo0kTHkCHsmIAhIUrgBM8YQv/CxYzHvxVWthrKhg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1772567319; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=n4Vn0pbl99xPEiHHtN8VjnR2w8nLax2cHEruMeH3bIU=; 
	b=TBRguYeQLavV4MUxG60OfgnKeaMLAE3VGaITDeOXwMpv4J9VhyZReMFJOShXtUkLHd4yMMPsRmzI1dPnVnq6u1U3aIb5q6+HN25GXrytiTtJ2rT/0mHh365nbhuCbGX93uWTa+dfeK5Nf+KKPr5/KTZhFHPpn51WBybwe4w6opc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772567319;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=n4Vn0pbl99xPEiHHtN8VjnR2w8nLax2cHEruMeH3bIU=;
	b=YB4g8/KjdgrccMje16DtArdtxqF9Is9kY3OEQRL2qDHLw8/XV5n+/7D3a1ozvSfE
	HzEQRSrdjD9ZY9FvEEix5hNSmLRP9YXPxzw8xxV/HGqPeAjkJHLycW035tV7ez8K72o
	vKVM+3QZBiKYCaZX/k7jf+LcF4ABHGMGD1cZ/yxAnNKFb3ey8QBe62aACXVyCDekJRT
	VYwNjbx/cENPhVG7ATrttynG5smWUJbdtwYCGvc4w3FPwYjvvcX7WC09VspS2r58OEc
	0RltZp4JMGwgvgceiwXtQOeAhtnHHmpT0d1SS3yDemKaE1q6K4DKcBJFB1VIyyk/xA/
	3gZWYtqnvw==
Received: by mx.zohomail.com with SMTPS id 1772567318377252.90102794541485;
	Tue, 3 Mar 2026 11:48:38 -0800 (PST)
From: Rong Zhang <i@rong.moe>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Rong Zhang <i@rong.moe>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Cryolitia PukNgae <cryolitia@uniontech.com>,
	Arun Raghavan <arunr@valvesoftware.com>,
	linux-sound@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Icenowy Zheng <uwu@icenowy.me>
Subject: [PATCH v3 8/8] ALSA: usb-audio: Apply linear volume quirk on MV-SILICON devices
Date: Wed,  4 Mar 2026 03:48:03 +0800
Message-ID: <20260303194805.266158-9-i@rong.moe>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260303194805.266158-1-i@rong.moe>
References: <20260303194805.266158-1-i@rong.moe>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

MV-SILICON is a SoC manufacturer producing multifunctional audio SoCs.
Many devices built on top of their SDK share a common quirk that the
Playback and Capture mixers use linear volume with val = 0/4096/1.

The SDK seems to always report "MV-SILICON" for manufacturer string.
Hence, match it so that we don't need to define quirk table entries
separately for each devices. The "val = 0/4096/1" pattern is also
checked against before applying the quirk, in order that the quirk won't
accidentally break unseen variants.

Quirky device samples:

  usb 7-1: New USB device found, idVendor=1235, idProduct=0003, bcdDevice= 1.00
  usb 7-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
  usb 7-1: Product: G1
  usb 7-1: Manufacturer: MV-SILICON
  usb 7-1: SerialNumber: 20190808

  usb 7-1: New USB device found, idVendor=1235, idProduct=0003, bcdDevice= 1.00
  usb 7-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
  usb 7-1: Product: mvsilicon B1 usb audio
  usb 7-1: Manufacturer: MV-SILICON
  usb 7-1: SerialNumber: 20190808

  usb 5-1.4: New USB device found, idVendor=8888, idProduct=1719, bcdDevice= 1.00
  usb 5-1.4: New USB device strings: Mfr=1, Product=2, SerialNumber=3
  usb 5-1.4: Product: HF310 USB Audio
  usb 5-1.4: Manufacturer: MV-SILICON
  usb 5-1.4: SerialNumber: 20190808

  usb 7-1: New USB device found, idVendor=2717, idProduct=5086, bcdDevice= 1.00
  usb 7-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
  usb 7-1: Product: Redmi 电脑音箱
  usb 7-1: Manufacturer: MV-SILICON
  usb 7-1: SerialNumber: 20190808

  usb 2-1.2: New USB device found, idVendor=3142, idProduct=a601, bcdDevice= 1.00
  usb 2-1.2: New USB device strings: Mfr=1, Product=2, SerialNumber=3
  usb 2-1.2: Product: fifine Microphone
  usb 2-1.2: Manufacturer: MV-SILICON
  usb 2-1.2: SerialNumber: 20190808
  * https://forum.ubuntu-it.org/viewtopic.php?t=659345

Signed-off-by: Rong Zhang <i@rong.moe>
---
 sound/usb/mixer_quirks.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
index 539044c0c644..e97814dc9025 100644
--- a/sound/usb/mixer_quirks.c
+++ b/sound/usb/mixer_quirks.c
@@ -4588,6 +4588,24 @@ static void snd_dragonfly_quirk_db_scale(struct usb_mixer_interface *mixer,
 	}
 }
 
+static void snd_usb_mv_silicon_quirks(struct usb_mixer_interface *mixer,
+				      struct usb_mixer_elem_info *cval,
+				      struct snd_kcontrol *kctl)
+{
+	if (cval->min == 0 && cval->max == 4096 && cval->res == 1) {
+		/* The final effects will be printed later. */
+		usb_audio_info(mixer->chip, "applying MV-SILICON quirks (0/4096/1 variant)\n");
+
+		/* Respect MIN_MUTE set by module parameters. */
+		if (!(mixer->chip->quirk_flags & QUIRK_FLAG_MIXER_PLAYBACK_MIN_MUTE))
+			mixer->chip->quirk_flags |= QUIRK_FLAG_MIXER_PLAYBACK_LINEAR_VOL;
+		if (!(mixer->chip->quirk_flags & QUIRK_FLAG_MIXER_CAPTURE_MIN_MUTE))
+			mixer->chip->quirk_flags |= QUIRK_FLAG_MIXER_CAPTURE_LINEAR_VOL;
+	} else {
+		usb_audio_dbg(mixer->chip, "not applying MV-SILICON quirks on unknown variant");
+	}
+}
+
 /*
  * Some Plantronics headsets have control names that don't meet ALSA naming
  * standards. This function fixes nonstandard source names. By the time
@@ -4664,6 +4682,10 @@ void snd_usb_mixer_fu_apply_quirk(struct usb_mixer_interface *mixer,
 		break;
 	}
 
+	if (cval->control == UAC_FU_VOLUME &&
+	    !strncmp(mixer->chip->card->longname, "MV-SILICON", 10))
+		snd_usb_mv_silicon_quirks(mixer, cval, kctl);
+
 	/* lowest playback value is muted on some devices */
 	if (mixer->chip->quirk_flags & QUIRK_FLAG_MIXER_PLAYBACK_MIN_MUTE)
 		if (strstr(kctl->id.name, "Playback")) {
-- 
2.53.0

