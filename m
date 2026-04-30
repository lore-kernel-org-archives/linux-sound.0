Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2DE9274FD0;
	Thu, 30 Apr 2026 20:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777582283; cv=pass; b=dN4ofEeE6YWnuRwqEic+buAZKa5slkemkNuZzGhzda3p9h99g2irvNfZCaxkmDhxT+NtVl7Wl+W3Ard9kGkWU6JLuzeuDxbUsT01yqVOkSp8JukbaPZvpDmZgoi2uOiDX3G+6fhiXxgGM051T8Ng5yrzTyXVd2hzHPBKc9I8zJM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777582283; c=relaxed/simple;
	bh=l9a/SZjbsOvCMQ4lo+YPtUh+FzojdBXr3NjZnbFTUyI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SmHxZLw3qgQeYnYBabUxg0MR6pnoDjL1HtT8Nnqmsibsc7xAskblaUvKVxUHrtTw0FKx4ccWgmdOMCYuDmb01lRT373axetIrMkY9IA/O0uenwNqivnEbTgLwaQuVUwGv04phyc8M0m30XBbmGwtdlJBYF3hJBIl+nja+UrBS4s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=lE89ACgR; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="lE89ACgR"
Received: from monolith (unknown [23.159.216.125])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pav)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4g65tQ5HJczyRl;
	Thu, 30 Apr 2026 23:51:10 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1777582274;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=I2PXZRT1pdsHUQKKde9NybswLkVM35agExES8FoujQc=;
	b=lE89ACgRwRUeZJ1wPd3w+r6SB/Dln7S6rR0/r+TVZtCIOo9V8fXFZlm5Ll1S+8gkk//9WZ
	I+r6d9Sn/0lUvZW6JdQf5xfwnParzkgzswGPFRAsPd6mT/5BrbCMMRNoqK1+ixgSvbyr7p
	sd106/jNqm84W8DzEd+648pnueLQLkI=
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=meesny; cv=none; t=1777582274;
	b=TA6xxG/gJQXCRLzdaCjnxyY+k2aXhiSroj+AYCJqbjNemKAMRZWAaM1dm25llOVwerUNK8
	9g2t9DqaYiHtYmm1BdWba5XIVyCQ02M5L7AfUaTE5oRYd7VYi9BIignroVJ8IlCfvImoGo
	y15vO1JsylOFI10R3YBWQdQS6xPdVVo=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pav smtp.mailfrom=pav@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1777582274;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=I2PXZRT1pdsHUQKKde9NybswLkVM35agExES8FoujQc=;
	b=anBz8lOEuiLmMCHGcWBgCIuyiVxiUj6941hEUNugxXfC6flchp3DkYF3y9fazMqYtSnMpd
	SsIlnThcHHkv0NdF+nqW6F8fQ/uHEqftbSDiFeIZ5yrUr7lvBryDBPW6FELWc9k3pNF3O5
	Yne37BWXvHmd/NQ597mZ8kFAyOOsPx0=
From: Pauli Virtanen <pav@iki.fi>
To: linux-sound@vger.kernel.org
Cc: Pauli Virtanen <pav@iki.fi>,
	perex@perex.cz,
	tiwai@suse.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: usb-audio: add min_mute quirk for Razer Nommo V2 X
Date: Thu, 30 Apr 2026 23:49:50 +0300
Message-ID: <94449577332d14d7974864903825f27e5824ddbc.1777579951.git.pav@iki.fi>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ID 1532:055e Razer USA, Ltd Razer Nommo V2 X
is tested to have muted min playback volume. Apply quirk for that.

Link: https://gitlab.freedesktop.org/pipewire/pipewire/-/work_items/5235
Signed-off-by: Pauli Virtanen <pav@iki.fi>
---
 sound/usb/quirks.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 0b4ecc2c6bcc..f77ff05dff0b 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -2366,6 +2366,8 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 		   QUIRK_FLAG_IGNORE_CTL_ERROR),
 	DEVICE_FLG(0x152a, 0x880a, /* NeuralDSP Quad Cortex */
 		   0), /* Doesn't have the vendor quirk which would otherwise apply */
+	DEVICE_FLG(0x1532, 0x055e, /* Razer Nommo V2 X */
+		   QUIRK_FLAG_MIXER_PLAYBACK_MIN_MUTE),
 	DEVICE_FLG(0x154e, 0x1002, /* Denon DCD-1500RE */
 		   QUIRK_FLAG_ITF_USB_DSD_DAC | QUIRK_FLAG_CTL_MSG_DELAY),
 	DEVICE_FLG(0x154e, 0x1003, /* Denon DA-300USB */
-- 
2.54.0

