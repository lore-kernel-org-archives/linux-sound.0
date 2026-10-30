Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793382524;
	b=1xyWkPDmgpF1NT8UgeKm5hyOjld/4hss5h4WxRMv+3K922FTFHlEB2UsSGFDwo//M8f0
	 f8ad1z1M9CKDbUZElW+ZSKVShxP4v3eWgBmXhr0S04Fe/einaAtBRc5fs008SAYDNhP4C
	 IRj3j1elmXMoGa7FjPIl/KFLkYI9Gqs00K+xMat1QV3+Mp+nII/E17rbnVWvzxUxUHOst
	 Cq/J46xFLaNnJZFKNkqE8aaQ4lkWfyX1a2bNk6i2lIn8y42jyU9G/1Sg2K46dLw5LSLW2
	 FzOjA13hIOZdlwbcmMJ8IOokEVFS9MrekH7LlX9j74hQCG7WYK69nm2G4QGbmDwk/HA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793382524;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=lvTI4kYswy8nJRdl9QxlU0eMLqhgVMDUC7UVIheEm08=;
	b=VKnfVrquimd9ChhLU8HSQId51hDTKjxzywcP/qgaO/Knqa8BXMDyoTPDiN9JoWymljyf
	 duCzTcQQfEaHqOXQJC/TTPv+notE/ikadhLZet4WdrcDIOym3n1kN3k/eq/ZgEfy2xbcS
	 N6mnWixx45KmzEW06W9SjoKj/aBOR0QF7P8qRTOrRQPl+cGcduuEmei5Z1AtdAB26J6qI
	 7C/Y/nuCT+NelUKJU3Ye0RKCYw/UIYgMnO768ilTFoLttokJbLjZGyI09JQHf4GtDKt/j
	 e/76wdYQZMg8wu6JYNselySRGOWGzDd0LCMHvyAnSSv5VfPkjcB30AsJ5eSov79SpIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xePqTgOQ;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA2DA60A2606
	for <linux-sound@vger.kernel.org>; Fri, 30 Oct 2026 17:48:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA2DA60A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xePqTgOQ
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso9280925e9.1
        for <linux-sound@vger.kernel.org>; Fri, 30 Oct 2026 10:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793382522; x=1793987322; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lvTI4kYswy8nJRdl9QxlU0eMLqhgVMDUC7UVIheEm08=;
        b=xePqTgOQXy02kKEI5qIDlow66ax495Fx8PTmPoBZcHAWs9rNUPtCQjj/g5lZIUOxl9
         CvIPRIpwpjBo3NA25bLyr5QMbBLEDgtqTPc21i0SBg5e86v/2Sg17AXCafHcuMhvZrlf
         ZjLi+Rvx/ynNBK9AbWxggIDpdyy4m6cMgynThIlDEvE0Ul4b87vBdgz4sbzZDIdurH6T
         gfIHT7OD4GCyEPkL5Sqrpn+8VgmK4VPx3cYWMB0JddZjAlFnbLfD3+SkN+xO2BA7qBUk
         dbJjUL/ouuvLA7cYZAg8nuAt7SNCECTNmPkKus2kgF7xMAm5AOWh7XeZGPOSOCwiAmeb
         /+vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793382522; x=1793987322;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lvTI4kYswy8nJRdl9QxlU0eMLqhgVMDUC7UVIheEm08=;
        b=gHXm6VXuRs6N05OOEdWGtw3srfvZZLE9iGkE0dREHTUaXgEXK4wjhWevmcDn46Q9iI
         8qoxoX8Bmti3o3NeYmJwm8S8TbUATwCnaHDpyPPr/+IpLIBnrEZVEYDo1DBca4utJ4se
         RcUnkZ+NJMGy3agfPfxD+pt8FoARRA0qHW7p8+iD0AJRETN3DVutY2cg6Ri6nkII0nLu
         ssptR8yGJAPA/kz0YOBt0kDi+8SDUtOjuMSN/28pD71YnBw70Lp00DGpTPT2rB5u2COV
         YsiXnEHEjL4f+7meLRPOwtNdOydo/CMp86Txy5G17dL1o173sAxKCJdn2MMHCdI97Ymi
         LTRA==
X-Forwarded-Encrypted: i=1; AKwUvBy0afdtayfB3FtA3iqeNk05YPsXpQeERyvAOpdSxLs+mxaFRQK+gm4YGNcBOor2gkicEG6XYyKF4U9Bvw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJX5wFyTTDanam4+6IJZhDRXs2ZsEy63JXXK8rT0J2HwikGkPtF
	NEdtNpIJqWbpfb6WxGvAJhwSGGAmpwOSkm54SJeYQ4/kO8AcHvGyVEc=
X-Gm-Gg: AYBFou0CB/OG4VdeD59X1yznMGVrMbmZ263G3G7BaNJ6fak55TcvT1mwf+9YOjKjw0e
	NhFWCVb5L+5dMG1eEpzuGhi5Rz0I/ZTYjTuaHojgK/NrYlPUoBLgbB8Gm6cDT1rmA5jJbRSYlN9
	LC0/NSWPTb42nIQ1s2bIHOKoCqWERhkUqmfXAx9KjksuE/F1BnV2f8rbm3lBnbcU3QRveDO1loS
	11X7C2PBS+qPDW7jgi5a449CgXxnBKMfPsJlPCSfl9ucrsL7ri5GTVzRZq6Z9U7ax4Pfl3Feazx
	8X5SdV5SFs0YaoAYnrnGRSTG86HHtVzpsd1gNN6TA3SaiONoK5PeL1xkBKZuiymX0mOHTmtCS1f
	Ip/Dei2uEpkZnztP/fmWPh5rarGyeY4ChCGxl8jFdPnd1A9if2P5IPcI+0CjoGchQPHOJYlISaD
	am47F88YbPC7FChbFTsn9SNVPlX0r4SuPywQFvLyUZ6dMRtrDccfGaUFD7heao+IRG4y2A0LtWg
	cCzAm2qKhgQ1IeIFkqqoZkd7JLzm5QZTrq7AWBwPPWFgioDWIdS+oexKkjwE1b80t1NttKTZ1Pe
	hH39mbpeBhOzlq/fHfmjgq35wQy6cCwb
X-Received: by 2002:a05:600c:524d:b0:49f:e772:6ddf with SMTP id 5b1f17b1804b1-4ac18993ca7mr71817565e9.32.1793382522110;
        Fri, 30 Oct 2026 10:48:42 -0700 (PDT)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b8e5f4sm4492926f8f.40.2026.10.30.10.48.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 10:48:41 -0700 (PDT)
From: Tristan Madani <tristmd@gmail.com>
X-Google-Original-From: Tristan Madani <tristan@talencesecurity.com>
To: Mark Brown <broonie@kernel.org>,
	Oder Chiou <oder_chiou@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Bard Liao <bardliao@realtek.com>,
	Misael Lopez Cruz <misael.lopez@ti.com>,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH v5 3/4] ASoC: twl6040: cancel headset jack work on component removal
Date: Fri, 30 Oct 2026 17:48:36 +0000
Message-ID: <20261030174837.1839402-4-tristan@talencesecurity.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261030174837.1839402-1-tristan@talencesecurity.com>
References: <20261030174837.1839402-1-tristan@talencesecurity.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The twl6040 codec driver initializes a delayed work for headset jack
detection (hs_jack.work) but the component remove callback only frees
the plug IRQ without cancelling the pending work.

Free the IRQ first so that the threaded handler cannot schedule new
work, then cancel any residual queued work synchronously.  This
ordering prevents the race where the handler fires between a cancel
and the free_irq, re-arming the work after it was drained.

Fixes: a2d2362edf9f ("ASoC: twl6040: Add jack support for headset and handset")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
 sound/soc/codecs/twl6040.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/twl6040.c b/sound/soc/codecs/twl6040.c
index 650836f9615fb..826bde1a9ba46 100644
--- a/sound/soc/codecs/twl6040.c
+++ b/sound/soc/codecs/twl6040.c
@@ -1136,6 +1136,7 @@ static void twl6040_remove(struct snd_soc_component *component)
 	struct twl6040_data *priv = snd_soc_component_get_drvdata(component);
 
 	free_irq(priv->plug_irq, component);
+	cancel_delayed_work_sync(&priv->hs_jack.work);
 }
 
 static const struct snd_soc_component_driver soc_component_dev_twl6040 = {
-- 
2.47.3

