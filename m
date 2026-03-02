Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E9C376BF1;
	Mon,  2 Mar 2026 18:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772477987; cv=pass; b=D9PVoXZromv5iPmLSqFOocjSEz/UAtAMfb5pQjLi0gvEUa1f82DFCuLA7A/C2nxS/OQ9fzBGtwMyCCKAP+2xyfjSK33mFW4T1m0bsNWv+Z213kzQdi1LlM7CNEG2f230jS9+1xt0Wq3T5/nW0hz4c3+Uf5QxP+4fN5Mjaz8v9f4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772477987; c=relaxed/simple;
	bh=A5QVI4sc3toPzsBJ0eGEdjAvm937Zw+ZKOz9Z1bfWys=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=utS0wAkYvZo3n4/Yh37CORoZkybvEGi4GFapltAuX18Wmr2PaXAODdCD7An5bi5afhrww7ZNMkV9hIibO2hdJV3CV4fzLD3xwbEnMGOs/zV/F0btTQTHSjzHRlfV2SuVfbeFQg6+T/6eEZ4/xP7dNWXNpSewB2JeT71ievWCudg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=FFSLnSat; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="FFSLnSat"
ARC-Seal: i=1; a=rsa-sha256; t=1772477973; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=eaiAJK7NBboKKuN0DtvG+kkCaWfGG7qD0q+SN42lX/MlM4uEbzWqjQy4V4p/A1P2M8ME+0ZTW8y9C1H21JyKPY/P0l8/tIyfOSni6mwAXPA8D2C/ew4lbKRUE4Vv1yTY7I1+tneNxh8orHPMKWRPwUKyytYDY9JMx1VnbdJCOoU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1772477973; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=/BvEQBitzjedx/UMLrqh7LvNZcltcVro9BjyKn24tic=; 
	b=fmxJkiADteJ9o8fcYJ3/gxy32GUShA5QRC5vzRFbYOn5hnj3aze52rl1SqjNZexqIwICNSzvcWn/rBETyh2u3Fj7KtYCF9NboI6psY5uMDfnY80QJSx6Z1zrNceJWQOHkzlVE5KTeiX/Jk2hi+GB6bOJWxVQEEkT33He4h9r9t8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772477973;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=/BvEQBitzjedx/UMLrqh7LvNZcltcVro9BjyKn24tic=;
	b=FFSLnSatLUDtf3zAdZ1oTXigGelOFhP09EVndbNIBBavC1XNrL0EeTDP62xZO9pw
	+dwSP7imHZwOi1Yf9QP8w4i6Swj3vhATUwVup3W6XrSxWe8iAxJDm9I9tpcpLIqUSyQ
	FhkKzgwwHY9r78gajCXFyGD/uHl+waZscJ+AL90VBC0rNz4SGXXMDkmlSVJEq/gWxpn
	OC8UyA944a9cVELcE2LTH/JYXjHphxoVv0emqlucUhFr8O7iQV4iUHwMbuHoTW01CoP
	2e3yntSX9F2ao40ASwA0MkiPcFiyo9haD5bPt72x7zfctQIBLCQ+Z9v+2UOQg9vtul+
	jxjHNWzWbQ==
Received: by mx.zohomail.com with SMTPS id 1772477972008652.7818658540505;
	Mon, 2 Mar 2026 10:59:32 -0800 (PST)
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
Subject: [PATCH v2 8/8] ALSA: usb-audio: Apply linear volume quirk on MV-SILICON devices
Date: Tue,  3 Mar 2026 02:58:59 +0800
Message-ID: <20260302185900.427415-9-i@rong.moe>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260302185900.427415-1-i@rong.moe>
References: <20260302185900.427415-1-i@rong.moe>
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
index 539044c0c6440..e97814dc90259 100644
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
2.51.0

