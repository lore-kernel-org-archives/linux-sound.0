Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74DE43876A1
	for <linux-sound@vger.kernel.org>; Fri,  1 May 2026 10:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777631177; cv=none; b=Yftn+bsMUYqYmkraYNvSe+NHy5FyO7Tzfo0Nrafx3bK9+rdYPw6DqcfqkjDaWaAMefWI0G0hokhF4Y5SS4GmJxF6N/fsf/2KH7ifXVSeNuE2zh0p1w5JbIGK2evjfEzQFadh21H4AYJVy9DY2iCyBpsqkoo5xW96uubyIA6B8s0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777631177; c=relaxed/simple;
	bh=RfgrVvknme6vhAOFjjbtHTulvqGle3JEa4VWxijNxXc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nJ49UBUzaBvHWBnY/sAe9e1jL1bZhuZwHwcPd9M6Psjgn3Iq/Q+PYW7UJwJZVsBw44jUs/e64DwmnTIsZm3rp3kl/TL7evfV3VLbxN8GsXZyqdIjqt4Ank6FaPhSleE9w3nmcYmHxT/fm7jQqaqMw0gOVqcmQqJN8CIgo4Y6g7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GSbWxuCB; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GSbWxuCB"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-12c88e5f4aeso1212293c88.0
        for <linux-sound@vger.kernel.org>; Fri, 01 May 2026 03:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777631175; x=1778235975; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XjBFmY6oME3TcUT9msMQ0JkYRg8U/8GzZccCOVqrKM4=;
        b=GSbWxuCBXPTkIyZx83x4CzYLnThWPFB7/IsNQ1foABe1Lj1gkqvMghqWYz4H7MZ7K/
         VI93VynO2oM9kM/SaUclaUZGFfJfApWYKCGgTyQ82buPiYfeSM5wQlEWm5vid8KR0skO
         0BXVoAwgvS1YxjhV2o2IKibpLKl8qQoJ/qXTOjn2QpDsvADyXSJ9YgWQvdUCSZctLr/r
         Ymbmo5xYTfFgyjmH8PicSG4MafHBZ3Ngyi0/2e5ilfc+jX7BkZBqMWg20i/kaKl2E59u
         24RGQStwdrj4/d0v2f6lktq+R2O/32/chz0j2SfPkQGs0tt1hcyAZ6roGdCEis1SXbpz
         TdWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777631175; x=1778235975;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XjBFmY6oME3TcUT9msMQ0JkYRg8U/8GzZccCOVqrKM4=;
        b=DyniZP2goC4Cz9M0yw0X97p/7Q5xnawKkFhIgfYYf+mPOnsritsMZimyS0iKktab3m
         7gzEn5VztfWiY8jDKThcM6gFWtTi3hehb128yR1+4Jofnf0CEred7da8vAoO26zuq7CC
         SYue4GzddshsiyiDOSzFkS2PnhqZh9Kx0aeHTf7ULcpnhOqSvibro0+VwFyFJoX9RCAU
         iY5hfu0vReNDJ8cv9QK7S6blgGdCmOX0e5mWf2RbCHYBqUTfgleOTBvuH0ILYkatZMRt
         F0KTwnozTpku3A0CnUGkmnuxNUA++4P1F5WnmGi0hz+vszl0EjbXlic+MfQY9PQ4BFbn
         vkMg==
X-Forwarded-Encrypted: i=1; AFNElJ8T1xF03Rp91DBGnEpLsw23V0QeqHodPuAXpOlGF96j/rTx7GlrlilY9s0fRVVtyJElg3Qr5ydKwKE39w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzfmhOGOamSt0Afbx8MmkHzHL2//So39lE0KiR+Hb8DMzZYfZ/v
	t2S4V6fGGXD7ESt3CPBckKg92sM9y+zULuX39rHcXnURlDSe9Bd6F1zK
X-Gm-Gg: AeBDietZXdKMd5y88yXftRGwMRcXIh4Ya4hqh5T5VHefiStZcZEeNOnLVnqB5bfGuoc
	VxBI7azSbnzxgJxyOmxTB6zb41wQSYdSwgqMAATkRqXaN0602iUm17I4iC/HqUZusFl11me6S0A
	CyaFGiUyNV+PQ8QxGktjryzpaohgBZ2QGlqQ8x/oOYw1ywKrZuFP7Yxz0jGf/UNS0fWsXB8M7ZD
	NiRMAjLCjhS7er/1Z+7nFSJAY+xSn1Z4C6KPLgW4cjlM2wokxHn68L34Lqu2MLeR3RCDRGIcwia
	PYl26gb7clKKMZTA6aK6UUVH0651RF7BPJpbaSC6ays0ZSR0AkSjTPFDdmbL5TWBKK9Y3zkMukr
	2HoaeT0BfGQPhrKdKaMxjRubNvGhPPISclUK7+KMSzaafxETcDVrj+L3cjbmopv3SKgG9sq9xJx
	wPJZP9tgdkEP1YY4Fh8dREGQ23/Lh/4UVyH01ZJSecC+Dca+I8mo/7pwNJq0MCsiZ0Nz0WWKtS2
	pDmS46/duea
X-Received: by 2002:a05:7022:6087:b0:12c:1288:ce63 with SMTP id a92af1059eb24-12decc27261mr2509922c88.13.1777631175407;
        Fri, 01 May 2026 03:26:15 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-87.user3p.v-tal.net.br. [177.4.161.87])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12df84250f1sm2621191c88.11.2026.05.01.03.26.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 03:26:14 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Fri, 01 May 2026 07:22:13 -0300
Subject: [PATCH v3 2/2] ALSA: hda/tas2781: Cancel async firmware request at
 unbind
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260501-alsa-hda-tas2781-fw-callback-teardown-v3-2-8d9f873b97bd@gmail.com>
References: <20260501-alsa-hda-tas2781-fw-callback-teardown-v3-0-8d9f873b97bd@gmail.com>
In-Reply-To: <20260501-alsa-hda-tas2781-fw-callback-teardown-v3-0-8d9f873b97bd@gmail.com>
To: Luis Chamberlain <mcgrof@kernel.org>, 
 Russ Weight <russ.weight@linux.dev>, Danilo Krummrich <dakr@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Takashi Iwai <tiwai@suse.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2250;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=RfgrVvknme6vhAOFjjbtHTulvqGle3JEa4VWxijNxXc=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDJlf6nfs3t1hdLxfZ6JxjNJv/rtrFIIOtf2V/Sp10pM78
 K/Kq/1SHaUsDGJcDLJiiiyrkxZZ7ul6cLU+boUHzBxWJpAhDFycAjCR7nWMDOtPtfhGXW7b8W45
 g+ofHaHW5GzGRwGF346GejO8bLs525nhr/zerSd9wth0XgTE2HGFKTgf2i5qoZSVuugqp+erhKU
 VbAA=
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

TAS2781 HDA I2C and SPI queue RCA firmware loading from component
bind with request_firmware_nowait(). The firmware loader keeps the
callback module pinned and holds a device reference, but the callback
still uses driver-private HDA state.

Component unbind removes controls and DSP state immediately. Later
device removal tears down the TAS2781 private data, including
codec_lock. If the async firmware callback runs after unbind has
started, it can operate on state that is being torn down.

Cancel or synchronize the async firmware request before removing
controls and DSP state. A queued callback is cancelled, and an
already-running callback is allowed to finish before unbind continues.

Fixes: 5be27f1e3ec9 ("ALSA: hda/tas2781: Add tas2781 HDA driver")
Fixes: bb5f86ea50ff ("ALSA: hda/tas2781: Add tas2781 hda SPI driver")
Cc: stable@vger.kernel.org
Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/hda/codecs/side-codecs/tas2781_hda_i2c.c | 3 +++
 sound/hda/codecs/side-codecs/tas2781_hda_spi.c | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c b/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c
index 67240ce184e1..dd1b0cc63ad6 100644
--- a/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c
+++ b/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c
@@ -588,6 +588,9 @@ static void tas2781_hda_unbind(struct device *dev,
 		comp->playback_hook = NULL;
 	}
 
+	request_firmware_nowait_cancel(tas_hda->priv->dev, tas_hda->priv,
+				       tasdev_fw_ready);
+
 	tas2781_hda_remove_controls(tas_hda);
 
 	tasdevice_config_info_remove(tas_hda->priv);
diff --git a/sound/hda/codecs/side-codecs/tas2781_hda_spi.c b/sound/hda/codecs/side-codecs/tas2781_hda_spi.c
index 0e4f3553f273..d243baff95a7 100644
--- a/sound/hda/codecs/side-codecs/tas2781_hda_spi.c
+++ b/sound/hda/codecs/side-codecs/tas2781_hda_spi.c
@@ -750,6 +750,9 @@ static void tas2781_hda_unbind(struct device *dev, struct device *master,
 		comp->playback_hook = NULL;
 	}
 
+	request_firmware_nowait_cancel(tas_priv->dev, tas_priv,
+				       tasdev_fw_ready);
+
 	tas2781_hda_remove_controls(tas_hda);
 
 	tasdevice_config_info_remove(tas_priv);

-- 
2.54.0

