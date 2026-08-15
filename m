Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D34222590
	for <linux-sound@vger.kernel.org>; Sat, 15 Aug 2026 21:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786830587; cv=pass; b=T97IqfQq4NfpnFh3TZkWuw5HzdiRbonUIFLjMZNT7gf+ihy1uSjRnIhCCS/tACvzsOpkoSPL4oey0SNHCPZhs+g+45Z2mGGqLsrPfiaoJGDIs71Dy+ouIbsS0+RnrlB1Hbvr6NMCxzOo0WlhwWqeAemTM1J8qvNMLjfC5IhhuAM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786830587; c=relaxed/simple;
	bh=N+WRXIhPUlKUu+SHdjrtwe6h6JGKi0HIRB3pUT49APY=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DQRr1RD6znstTiT4tqi9WlGUAPrNgjAiyHoWgN2uzd/Fzdss3cggJDRf/LZjMOiSyxbini7cikKrwp42LC2SFTlVQ9h1mb8Lc+sblEDtqkJbkt2vpxZKYODeNF1ztx1oWDNYRaE4L2D2eWCDmhShgxFfrXUMaAd81Ki8MMFpMk0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f4DjqUJv; arc=pass smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f4DjqUJv"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-66c70f05859so3393093d50.1
        for <linux-sound@vger.kernel.org>; Sat, 15 Aug 2026 14:49:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786830585; cv=none;
        d=google.com; s=arc-20260327;
        b=QwZ1BXpomGh5LU1OGtfJkP5gkis047OnbIIzhwVV3Qm70g4MDGh95ZmBe6Nn0H8z4U
         YBuxtFl8ZxBy10eOkz4ZayNCcrhj6HFoquTmmXUal5xWNVheGQx83ZhbWpfcKG9lIlnT
         wQfbql+k8CNfv7oLvbp50WrOGBE+yMFuHc4G6H8CwcW6CXic/SNfnIqZ8mHf/0d4LQ9r
         TyFXBnJGfnepxYLxt+6jyMM5hrBj/uKcXIBJ4CT7QFE3HT+4cj7CGomRAkSaQB3QhT61
         wd5mw1CCUSWnM3Jm7Wm3tYGsLblpekq2VCkXCN5emCW0eU9Cok5TMSJnnl3WVL7Foujg
         jZ5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=0BiwD8sPUqgXhAkIy+YMgazrRCdFHB5CWVQZDyDO1H8=;
        fh=JaEkxonVtwoEJIm+z++62VWVk8hw3ny3fXkOUEfyJX0=;
        b=nfomMN7jUu+GArbVFLNs9l8o2JGq9/jGXGAMz7p0bliVMC1Uel7LtuV+aF9YH7Dte0
         wQicfo/wLvUYj6d8sDy/tdZ2Y3/paBgsOVPtQZb4h/iSGB+TI0Bep2zuD+tYZsSd/ZPM
         Pl6yL8R86Z3OU/Mat7RGsut37UnNoYKzdyPT/kLkEhkFJkZszfd+Z+oDGjdBnyMNtg5c
         d6ivraHOUqPL54/xGbIv5JZ+j7Quo917j7usq3PcXN69Yddpry907IPrkPDZLT5GwViW
         NOgVyTozG0zhUQK0cHWlCzC5k/a+lDZRoZ3NV1p/z3GpJpd/wQZuuY1RvH4d5jqA8bvR
         mlKQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786830585; x=1787435385; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0BiwD8sPUqgXhAkIy+YMgazrRCdFHB5CWVQZDyDO1H8=;
        b=f4DjqUJveP3newT5RmVZjnzf7/8CaAAt5+6bvDUxHm7391I+e1VPMxB0ZOqk2FLW8O
         IGZNRx9FB3TRzBBv90p620i5X8dWpkxB3N64Eh5riqF3mRA8noiIxfU5NmqN5L2pDUcJ
         VWxhPKXtOjNHDwhjWMvMrFTPKOGNHqGiklKO+PUS3VnAumwUXCwRxxrXwCU6wRedpm0w
         7Q5xg8/TzZ3hP5hXc6jxXn/tYubTEgjoa0R/Ya3uKtJI2Z/531ZkM7IFjJG1sNJCSIj5
         MoYE6mhu51fL86jf753kNLP8L8Wt1TkJ9MKOEh58AP0p7Ae+5itRsCCTMhzR6TusD6k6
         76EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786830585; x=1787435385;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0BiwD8sPUqgXhAkIy+YMgazrRCdFHB5CWVQZDyDO1H8=;
        b=jZngMuNhXtTiyzExfXEd1tzRnxjWygMRcfLsEzJmkm6o3tj+Y3+e06gBI1RgXyYJlD
         32XGJnLX1bw1SF8T1rWx/sNw7D3uMDtGZFr4EpiBDN/6Xj0uqGwFnuFBMuIVkDOyYVO8
         xNbMqh08t6WsfADXM4FYbUOamvZ9HyynUMtSHdVmJPKRdI6dZCIQxQDcEKXZnsU90Hg9
         VxtBRn8V3jOdNyqEXGrr+4gdZw+qz+jQ7tSZ3UuRNmY88QsHPGTJxext2r2HMjyVAcYa
         AWnoWiUX9lcTf/4cdzf+NcxGXGzF24sKtjlVMsuRxHD97p/YvpaQNgRl7+sDMq+m21Ud
         fBQw==
X-Gm-Message-State: AOJu0YyM2VYj3U97E4TtAgWZ7wVZ8VjsEhZkCQMhdCM6gAtuV3zkVTGH
	vDOgQl+jMemxMD0xg4lVSQ3xMDa8dU52OGvxnzBnt+rSwEZgNkvV7b3bX4la0zSeqNipVCO8/hA
	OKCyhDqEd0LFq7h5W+fBeF/w/kxekSy+S2+x7jIk=
X-Gm-Gg: AR+sD1370JH6WpjSlWERLa8ZyApzmuq8eZAAUAagM7lmPHOYvk1bs0JHFeIHpfFqB0n
	zHkC5fZAGIfZFxkB3aGC+TObog2tki+J6Zil8gtSq4TmltOQklwWZH757nctui9dXYmighkUfRY
	prIMao++5OzB9LubF9D9kW+PLqULuCwATFA3ASwAEnpGj2VCEtwqiSapLX54YW0+v7cEdriWjPQ
	RtsXFW//BhPh0JHi5T657mKwboAAIkmvZmrqts4GPiyIdkh5tUHPURxl2g3jqmMYEuqCnC6BllU
	FmSDNiNqmdmyjaQNAqa8uGHacitD2BO5wUvVXZ7qcBE5oaNKPpg4DnqeOGpC9BGvDMuBSlNA9oM
	EEogxHcv16BbPbBXAucPgWwvEwbCeR9Oypw==
X-Received: by 2002:a05:690e:1919:b0:667:b503:4d2c with SMTP id
 956f58d0204a3-66c72c7b4c7mr6047858d50.34.1786830585153; Sat, 15 Aug 2026
 14:49:45 -0700 (PDT)
Received: from 595171893313 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 15 Aug 2026 16:49:44 -0500
Received: from 595171893313 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 15 Aug 2026 16:49:44 -0500
From: Gemayel Lira <gemayellira@gmail.com>
In-Reply-To: <CAD96ZT+SnRnGr4Xd+NJkkVNpj8XrzL3Ete=pRgz05mqxAzbU2w@mail.gmail.com>
References: <CAD96ZT+SnRnGr4Xd+NJkkVNpj8XrzL3Ete=pRgz05mqxAzbU2w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sat, 15 Aug 2026 16:49:44 -0500
X-Gm-Features: AcwNN1Vh1UXUffNE20WOQlk8rrHfVo8m9exbmMInY5AKJlHtitvNy9tQg65hqjE
Message-ID: <CAD96ZTJzEwiNwJm4ujLS4+X_KChi4+_sD0j-m+aE+_9i+eUGcA@mail.gmail.com>
Subject: [PATCH v2] ALSA: hda: cs35l41: Enable VSPK on UX3405CA when ACPI
 leaves GPIO1 unused
To: linux-sound@vger.kernel.org, Takashi Iwai <tiwai@suse.de>, 
	Jaroslav Kysela <perex@perex.cz>
Cc: Stefan Binding <sbinding@opensource.cirrus.com>, alsa-devel@alsa-project.org, 
	patches@opensource.cirrus.com
Content-Type: text/plain; charset="UTF-8"

v1 mapped 10431A63 to generic_dsd_config and INTERNAL boost. Stefan Binding
rejected that: this laptop is external boost, and overriding the ACPI _DSD
as internal can damage the amplifiers. Takashi agreed not to take v1.

v1 also loaded fallback firmware (SPKID: -19). After some S3 resumes the
right amp failed with PM resume -110, then SPI -16 (EBUSY) until reboot.

This v2 keeps Binding's missing_speaker_id_gpio2 parse of the existing
_DSD (external boost, shared reset, gpio2 = IRQ, speaker-id at CRS index
2). ACPI sets cirrus,gpio1-func to VSPK (1) on the left amp and unused (0)
on the right, so the right channel binds with VSPK: 0 and volume drops
about one second after playback. After parse_acpi, enable VSPK on GPIO1
only when ACPI left it unused. Boost type is unchanged.

Tested: ASUS Zenbook 14 UX3405CA, Ubuntu kernel 7.0.0-27-generic.
Both amps: VSPK: 1, SPKID: 1, firmware
spk-prot-10431a63-spkid1-{l,r}0.bin. One S3 (deep): both amps reloaded
firmware, no -110/-16.

ACPI _DSD (SSDT SPKRAMPS), excerpt:

  cirrus,gpio1-func:  1, 0
  cirrus,gpio2-func:  2, 2
  cirrus,boost-type:  1, 1
  reset-gpios:        shared CRS index 1
  spk-id-gpios:       missing (CRS index 2)

dmesg after this quirk:

  CS35L41 Bound - SSID: 10431A63, BST: 1, VSPK: 1, CH: L, FW EN: 1, SPKID: 1
  CS35L41 Bound - SSID: 10431A63, BST: 1, VSPK: 1, CH: R, FW EN: 1, SPKID: 1

v1: https://lore.kernel.org/linux-sound/CAD96ZT+SnRnGr4Xd+NJkkVNpj8XrzL3Ete=pRgz05mqxAzbU2w@mail.gmail.com/

From c325bb06bb37fd658f0250dc8571b5bb6b2c7dbf Mon Sep 17 00:00:00 2001
From: Gemayel Lira <gemayellira@gmail.com>
Date: Sat, 15 Aug 2026 17:16:18 -0300
Subject: [PATCH v2] ALSA: hda: cs35l41: Enable VSPK on UX3405CA when ACPI leaves
 GPIO1 unused

The ASUS Zenbook 14 UX3405CA (SSID 1043:1A63) already has a valid _DSD
and uses missing_speaker_id_gpio2. ACPI sets cirrus,gpio1-func to VSPK
on the left amplifier and unused on the right, so the right channel
binds with VSPK: 0 and volume drops shortly after playback starts.

After parsing ACPI, enable VSPK on GPIO1 when it was left unused.

Signed-off-by: Gemayel Lira <gemayellira@gmail.com>
---
Changes in v2:
- Do not map 10431A63 to generic_dsd_config / INTERNAL boost. Stefan
  Binding rejected v1: this laptop is external boost, and that override
  can damage the amplifiers.
- Keep missing_speaker_id_gpio2 and enable VSPK only when ACPI left
  GPIO1 unused. Boost type is unchanged.
- v1 loaded fallback firmware (SPKID: -19) and, after some S3 resumes,
  hit PM -110 then SPI -16 (EBUSY) on the right amp. This v2 binds
  SPKID: 1 and official spk-prot-10431a63 firmware.

v1: Message-ID:
<CAD96ZT+SnRnGr4Xd+NJkkVNpj8XrzL3Ete=pRgz05mqxAzbU2w@mail.gmail.com>

 .../hda/codecs/side-codecs/cs35l41_hda_property.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/sound/hda/codecs/side-codecs/cs35l41_hda_property.c
b/sound/hda/codecs/side-codecs/cs35l41_hda_property.c
index 416d7bf..0c09094 100644
--- a/sound/hda/codecs/side-codecs/cs35l41_hda_property.c
+++ b/sound/hda/codecs/side-codecs/cs35l41_hda_property.c
@@ -450,7 +450,20 @@ static int missing_speaker_id_gpio2(struct
cs35l41_hda *cs35l41, struct device *
 		return ret;
 	}

-	return cs35l41_hda_parse_acpi(cs35l41, physdev, id);
+	ret = cs35l41_hda_parse_acpi(cs35l41, physdev, id);
+	if (ret)
+		return ret;
+
+	/*
+	 * ACPI on 10431A63 sets gpio1 to VSPK on the left amp and unused
+	 * on the right, so the right channel binds with VSPK: 0.
+	 */
+	if (cs35l41->hw_cfg.gpio1.func == CS35L41_NOT_USED) {
+		cs35l41->hw_cfg.gpio1.func = CS35l41_VSPK_SWITCH;
+		cs35l41->hw_cfg.gpio1.valid = true;
+	}
+
+	return 0;
 }

 struct cs35l41_prop_model {
-- 
2.53.0
