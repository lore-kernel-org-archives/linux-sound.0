Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2AC3375ACE;
	Mon,  2 Mar 2026 18:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772477981; cv=pass; b=Rgpo8B3F1cZIn/3oMehPnSODKFn84IJtS3H7LAk9em/JuY6rQsyT8f9G2Zp06pn+T4Gkurs7RCloS6dkS4BPiLMMfrqSEIQNDr+KhVPOqZCw7chRkYiuh3Gz0xln1Zx4Cdpp6NddBDOGr8jqN4vfBwVe/CwDLx/8njFiCL4n0TA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772477981; c=relaxed/simple;
	bh=jkOYA2NxwZJOVf2xfldlhNIEcy3ntqlXitFNbPnDQ8E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HxQgfnAyR9b//Vdl2NQ/7nKgWVWvFNtCu+3AEpp5oNdc/UPxV7ExMoInyWzqLedCzI6dMhoF36Q9LZEwVVLNQZfg8cPTjpHJB+T1uUhJ/cxqV0QzY4SETgmoJiMNA3/AsDb78JCuhOifhESAKIWfxYMyD4Qlj/b/xOk8KDSVD+c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=L8mofidm; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="L8mofidm"
ARC-Seal: i=1; a=rsa-sha256; t=1772477969; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=UlbTrGcJIoFX6njB8HfmY5d2uKb8PnF3+NbO0Qn5Uabd/XBQy74QHI4tqFA8sx9I46FNP0Pfzwuc6/XQM4QHHqmkdsL1QLNRDijt+S1ZS02FlgdxPEkQLjB59drciaMe1zjZHoWrZazYbf5rDsPRzwIclALta5eaBnzvxfvPjJA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1772477969; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=2vILH0Hgahd9bs8JmMib5OXj/WY5tcMeweFVJlplY/M=; 
	b=IIcqXCYSWGHCAghNdB7nHJB2NOk5niN9SsNMkrniCUltRlPYRXk8wmlRmhR22UrzMuVweckU9Uw6gEXCrKElonqummbdNDd5zNkguEvc0n+FS2KLVTOhn3y6IWXIoY84I5WSxUbqpl2VkLlrCn/LR4hzo3JWGBqFdXoS0s2nBqU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772477969;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=2vILH0Hgahd9bs8JmMib5OXj/WY5tcMeweFVJlplY/M=;
	b=L8mofidmvBt6LwpR9HvBW9spfwRolyEBsnOWHIP/e1lrpG2XWxTaZX3wl3+nAswh
	DTd19LpldtSy3c6e9mWxX8B2zovbZfPZyD/448yC6p9qxrHk2OV+KBxD+C9tAlkpzG8
	1aUojoif0eD8da0b1WPBRrTJvUzX8oP8ZTQMP8tunJwkJ0SWYh+orI2avzvpUtG0UeS
	ybCYknrXeSGEAbSixck2EMBpCmZj057XA57HmpWOvN5GTpahS91SDRjmumdeQGdTq20
	3AMnH/wl86hI672qi/tsaRFFWmsuROvBeYeXBQU7ifSSyzFR3WEi8jiKs95N9pFDMJj
	pyTOOA90Tg==
Received: by mx.zohomail.com with SMTPS id 1772477968532963.3711183766075;
	Mon, 2 Mar 2026 10:59:28 -0800 (PST)
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
Subject: [PATCH v2 7/8] ALSA: usb-audio: Add linear volume quirk for Hotone Audio Pulze Mini
Date: Tue,  3 Mar 2026 02:58:58 +0800
Message-ID: <20260302185900.427415-8-i@rong.moe>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260302185900.427415-1-i@rong.moe>
References: <20260302185900.427415-1-i@rong.moe>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Hotone Audio Pulze Mini is a modeling amplifier with UAC interface. Its
Playback and Capture mixers use linear volume with val = 0/100/1.

Add a quirk table entry matching VID/PID=0x84ef/0x0082 and applying
linear volume quirk flags, so that it can work properly.

Quirky device sample:

  usb 7-1: New USB device found, idVendor=84ef, idProduct=0082, bcdDevice= 1.03
  usb 7-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
  usb 7-1: Product: Pulze Mini
  usb 7-1: Manufacturer: Hotone Audio
  usb 7-1: SerialNumber: 20240807

Signed-off-by: Rong Zhang <i@rong.moe>
---
 sound/usb/quirks.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 1c7ca52c92d08..d907b273a1cc1 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -2438,6 +2438,8 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 		   QUIRK_FLAG_ALIGN_TRANSFER),
 	DEVICE_FLG(0x534d, 0x2109, /* MacroSilicon MS2109 */
 		   QUIRK_FLAG_ALIGN_TRANSFER),
+	DEVICE_FLG(0x84ef, 0x0082, /* Hotone Audio Pulze Mini */
+		   QUIRK_FLAG_MIXER_PLAYBACK_LINEAR_VOL | QUIRK_FLAG_MIXER_CAPTURE_LINEAR_VOL),
 
 	/* Vendor and string descriptor matches */
 	VENDOR_STRING_FLG(0x1235, /* VID conflict with Focusrite Novation */
-- 
2.51.0

