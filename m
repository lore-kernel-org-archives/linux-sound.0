Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C349B379EE0
	for <linux-sound@vger.kernel.org>; Sun, 12 Jul 2026 21:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783893561; cv=none; b=dp2pnWAuscXBsxAO6hRUaqI98gsdnAxs4esTnsyZWapUSsTkholn2DQMIsJYKsx4ac9MMEJhZ4FJluKPPDWLvPXLlmJ0nQQGBzE0RvOMio9yjgI4EEC2XeKGWxqNCWNOxCyXIhil+eEvaYCcsSpKUWavWuinVt1QTQe67jhTsR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783893561; c=relaxed/simple;
	bh=9oJzgel0+Ojjk7qgwRuqe0Flq4GagETVZYCq6zerQ04=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eXgxsTl6A2NihvesHHeNoiQ1Amm19SgFksvkjPe/vF/GlWXIxw9qjoSucahlESLDCA3lLwtibpiNgTmWoXXKtAVZirUbCWgSpdEUPT4bhXAdyMgrx7GTpQV5jGQxd0d3Sb2rBYKd/B+8Dzv69wLv3sIXWQny7jhGe9w1k0xkDco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hHRnW/Bb; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hHRnW/Bb"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-470174001a0so1456382f8f.0
        for <linux-sound@vger.kernel.org>; Sun, 12 Jul 2026 14:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783893558; x=1784498358; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=toUVoGqBj/b+93u/i/7H79a/d+CKBlHR2qaLarTQYXM=;
        b=hHRnW/BbtEvtpCmrrEBNVCmR5Kb/ObQWFOEyAkwvv0e3mP7ogrjkAFU1j5pD07Gssr
         PkPIbHYE/O/FZH5vx7inrf2jR4paccHh4k8mvOIthjMZu6ea8taqeNmnBPQ2hm5hxbZj
         Ab7rDBViROnivq+7AH8VD/k8zGfQ28Y51zyh6q1UnXAzo1oFxenypEfcHyyqSV+gSz8i
         tOJz1Ree7OYEvQE/ZXQ0k2z3ucFNWV1mQEJ+IDf01zAnhfzbsF/XpCvyIXhq2dEkdd6r
         b78N2yGxBW5sZVdoaDFAIwK3DFcPh0QM2XXOroz+x4DzM+3Y702yxSkXc/9KvPW1LlSp
         cDrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783893558; x=1784498358;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=toUVoGqBj/b+93u/i/7H79a/d+CKBlHR2qaLarTQYXM=;
        b=iJJEgeKr6loPYkn49vsRkWntCc6Q3J0SCTRL79G43mlEIkNzQo7cOjHJl4OwOdaprq
         b5doT1IfUMPWXAITZf4G5twMw6bk3zL++0Oe0vihzWcvzjqJlMohkk7iqFqyWbpUrwf8
         Z0AyxIp6yahKNXEEJtLsTsQRU3aXyT0WBMzLs4lIN5lCreqjsh4khNrutbxx6mVqT5J1
         VO0WGOwdMuOxYVrpGh6GDXaFrLnSl3xnJ+TEQV71rTxCs62w1cty4x31BPARZXasoFmm
         OUw4/9UBVvxZ0mt0bhUuS9Unk1Agovt6l9kRAap2wdLNjlWIZFlxu+1+boLdwWxabu3f
         QNIQ==
X-Gm-Message-State: AOJu0Yy3JQf3ppyah5XRsu37fkhgdeY+gL/pCQi8YHKbb+dehEfPq/j+
	1E8pIzV7UlVT4YrTq0ZNbyf6GX6O/obxMWvAXccvW7xkVpkNuS4i2dRo
X-Gm-Gg: AfdE7cnebR7uHwkiQ81Wq5A/RezcBHC/kNCPYeruk4o71/rsw2WK3OTjEQsVAUkDnem
	+qBVBJTZH+iB9ArmLnFayNXfMwHrMxwi0IdFUBCT0gD0P9X2uDxuFT+vzPkNdE5z6u/KLBZAO/C
	NRTbAwo+3qTdmm2LYqYTikci4QCZBuQqi5cGdu/q921FdfriCk7kO737PZZ9insRFPGYs6QlpjH
	x1ic8Y3SyX1vLQMin2R9qvOyeVh8FxxkAhHqv7h+anUrcbzf+vZODPlEaVsD2c449YKx87j0EVH
	qGE/d6M9SLpncoU6060OzNaPuapxriTk2lfe6ozbH5o4w2ZQr/o4AZp5U0j9RncnhvA3F9hsuB2
	T7HZTGkkl9xNMlagGEr6GDRrzrJpEhYHr6HSa3p01la7yA16gyodmcfboCnSe3VUuucapINfN4F
	z5URqFvrzYpugtDOITylgDaN0VXu+5xYZlp+CqNTxc6qKvI8McSEdDdJ5hs7fb
X-Received: by 2002:a05:6000:310d:b0:477:6da:1b6f with SMTP id ffacd0b85a97d-47f2dc9c5b1mr7058074f8f.23.1783893557852;
        Sun, 12 Jul 2026 14:59:17 -0700 (PDT)
Received: from dam-Legion-Pro-7-16ARX8H.lan (85.130.83.79.rev.sfr.net. [79.83.130.85])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039af67sm89533812f8f.17.2026.07.12.14.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 14:59:17 -0700 (PDT)
From: Damien Laine <damien.laine@gmail.com>
To: shenghao-ding@ti.com,
	kevin-lu@ti.com,
	baojun.xu@ti.com,
	sen@ti.com
Cc: linux-sound@vger.kernel.org,
	tiwai@suse.com,
	Damien Laine <damien.laine@gmail.com>
Subject: tas2781_hda: speakers stay silent after codec runtime resume on Lenovo Legion Pro 7 16ARX8H (recovery requires i2c driver re-probe)
Date: Sun, 12 Jul 2026 23:59:16 +0200
Message-ID: <20260712215916.1872367-1-damien.laine@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

I would like to report a power-management bug in the TAS2781 HDA side-codec
driver, observed on a Lenovo Legion Pro 7 16ARX8H (82WS, AMD, BIOS LPCN62WW),
ALC287 codec + TAS2781 amplifier on I2C (ACPI TIAS2781:00).

Note: this unit has codec SSID 17aa:38a7, for which I just submitted a quirk
patch ("ALSA: hda/realtek: Fix speakers on Legion Pro 7 16ARX8H with codec
SSID 17aa:38a7", Message-ID
<20260712213708.1835469-1-damien.laine@gmail.com>). The issue below is
independent of that quirk; it should equally affect the 17aa:38a8 units where
ALC287_FIXUP_TAS2781_I2C applies out of the box.

Symptoms
--------
With the distro default power_save=1 (Ubuntu 25.10, kernel 7.0.0-27-generic):

1. Speakers work fine after boot (or after a fresh bind of the amp).
2. Leave the codec idle for a moment (e.g. switch the default output to a USB
   interface), so that the HDA codec runtime-suspends.
3. Switch back to the internal speakers: playback streams run without error,
   but the speakers stay completely silent.

Once in that state, recovery is surprisingly hard:
- Toggling "Speaker Force Firmware Load" and restarting playback: no effect.
- Reloading snd_hda_intel (which unbinds/rebinds the component, "bound
  i2c-TIAS2781:00" appears again, mixer controls are recreated): still silent.
- The ONLY reliable recovery is re-probing the I2C driver itself
  (rmmod/modprobe snd_hda_scodec_tas2781_i2c, or unbind/bind on the i2c bus,
  i.e. a full tasdevice reset + firmware reload), then reloading snd_hda_intel.

Setting power_save=0 avoids the issue entirely, which points at the runtime
PM path rather than the codec driver.

Possibly relevant observation in the code
-----------------------------------------
In sound/hda/codecs/side-codecs/tas2781_hda_i2c.c, tas2781_system_resume()
resets the bookkeeping (cur_book/cur_prog/cur_conf = -1), calls
tasdevice_reset() and reloads the program before re-selecting the profile.
tas2781_runtime_resume(), however, only calls tasdevice_prmg_load() with the
stale bookkeeping and performs no reset. If the amp actually loses its state
while the codec is runtime-suspended on this platform, that would match the
symptoms, including the fact that a full re-probe is needed to recover.

One more data point: this unit logs "tas2781_apply_calib: V1 CRC error" at
every firmware load (apparently broken factory calibration in the EFI
variable), in case that interacts with the resume path.

I am happy to test patches on this machine, and can provide full dmesg,
alsa-info, or i2c traces on request.

Best regards,
Damien Laine
