Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5628D3B19A3;
	Wed,  8 Apr 2026 18:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775673202; cv=pass; b=MMxf5UXPA9M8DDMkRG6mX91PA8KkmLg8DjAKO9IibeHhvJmpL7ojDYwECmahCEM0tY1zhFhMQc83IvbmKmv+Fp5x62Q/eeA956lblg4vUPrjKDpBlCh11SfQRYifcloWXU9AgKAavdfkKmKD0l4elvF13nLtDGRS0d50EO+z/sk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775673202; c=relaxed/simple;
	bh=quliLQjJM2E2OgYvwCE4l8TgBV4DWvVexcm8vy8EjP0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JZ10MthSwyPz6ZJV6zIU9xFOD1Jg+ohW2VUF/PDzX48PrkMrhMGw8PSO07VsNrxXUiTZllgnNVcObep9Cjhl4Tfe+dbYnZU3qpJeMzj4wRG+658EJvEDEgP5iek5fzx58J1OLSU6IuyiRlmzMj080Gxg15j71/9Mv5Ccsi3LhMA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=qpew1LW+; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="qpew1LW+"
ARC-Seal: i=1; a=rsa-sha256; t=1775673197; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=TDgZPksp48XaLaYe7lp5jTmDDiV9JnffSCjfNTNks3jGsLnfkug8Bbqn6yk9lrbh6lISsKni1gRMc/8aLxEG+yYFUhHXAyV9Zo0pWNGM9pRMxDso5HQDhdbfSS8kP62h/xx3R/y+VsUeSVM+5B+ucejbnqEt/sstaliBIHhDmLg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1775673197; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=l6nJmgHs0o3+4wbNwQhPjKEkvbobXBer1IjDZIve/BI=; 
	b=cKaD1ricYVYTcdx6fOhj8L456FtlsDjlx7HFnxK5nLms2ZpgPP4PRFgl3fgPyXZTzZ+IimnyZvxvwQgOO+gfGrwCqVM44WBQ3IcQfIwB879LvTGYyIbXyuOU1g2hPfqugK8oj8bOt/KlGenaddF5izpeFIzdorj4qOM/ig7byXQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1775673197;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=l6nJmgHs0o3+4wbNwQhPjKEkvbobXBer1IjDZIve/BI=;
	b=qpew1LW+0+Z0bMFG4JqDVc+tdMvC8Sj4SKJ//Zzewmb293NRtzG6h+v4jpDcS/YT
	jTjzZmH5lIxtJ/fReRt29i6p6JXXWXgnTpxSpilASWg3doCljrVuCYmsbzgKvdA6KfL
	8f6QsO9R8Szf5kdoigicMVtHQlNJyI69bWiL0mS1biuuiA68rwEZM3stjZ5A1J93H7w
	KlVj0HXhpNh/PWWpPXkqx8RbnPP3I2mFE16aFySdgq61dAJzn3scNNrJq0kJfcMtyqz
	SSak1Mn0IDSu9Gke8/KUcIcPYXzU3XChYv0oGWfFMVzeKKHZTPSzIFRoBpbvYGTS1FJ
	5clqjtdyjA==
Received: by mx.zohomail.com with SMTPS id 1775673196898370.7490234954432;
	Wed, 8 Apr 2026 11:33:16 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Thu, 09 Apr 2026 02:33:05 +0800
Subject: [PATCH 1/2] ALSA: usb-audio: Add quirk flags for Feaulle Rainbow
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-feaulle-rainbow-v1-1-09179e09000d@rong.moe>
References: <20260409-feaulle-rainbow-v1-0-09179e09000d@rong.moe>
In-Reply-To: <20260409-feaulle-rainbow-v1-0-09179e09000d@rong.moe>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Icenowy Zheng <uwu@icenowy.me>, Rong Zhang <i@rong.moe>
X-Mailer: b4 0.16-dev-7777e
X-ZohoMailClient: External

Feaulle Rainbow is a wired USB-C dynamic in-ear monitor (IEM) featuring
active noise cancellation (ANC).

The supported sample rates are 48000Hz and 96000Hz at 16bit or 24bit,
but it does not support reading the current sample rate and results in
an error message printed to kmsg. Set QUIRK_FLAG_GET_SAMPLE_RATE to skip
the sample rate check.

Its playback mixer reports val = -15360/0/128. Setting -15360 (-60dB)
mutes the playback, so QUIRK_FLAG_MIXER_PLAYBACK_MIN_MUTE is needed.

Add a quirk table entry matching VID/PID=0x0e0b/0xfa01 and applying
the mentioned quirk flags, so that it can work properly.

Quirky device sample:

  usb 7-1: New USB device found, idVendor=0e0b, idProduct=fa01, bcdDevice= 1.00
  usb 7-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
  usb 7-1: Product: Feaulle Rainbow
  usb 7-1: Manufacturer: Generic
  usb 7-1: SerialNumber: 20210726905926

Signed-off-by: Rong Zhang <i@rong.moe>
---
 sound/usb/quirks.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 48acd8dac689..f73d5d01726e 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -2337,6 +2337,8 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 		   QUIRK_FLAG_MIXER_PLAYBACK_MIN_MUTE),
 	DEVICE_FLG(0x0d8c, 0x0014, /* C-Media */
 		   QUIRK_FLAG_CTL_MSG_DELAY_1M | QUIRK_FLAG_MIXER_PLAYBACK_MIN_MUTE),
+	DEVICE_FLG(0x0e0b, 0xfa01, /* Feaulle Rainbow */
+		   QUIRK_FLAG_GET_SAMPLE_RATE | QUIRK_FLAG_MIXER_PLAYBACK_MIN_MUTE),
 	DEVICE_FLG(0x0ecb, 0x205c, /* JBL Quantum610 Wireless */
 		   QUIRK_FLAG_FIXED_RATE),
 	DEVICE_FLG(0x0ecb, 0x2069, /* JBL Quantum810 Wireless */

-- 
2.53.0

