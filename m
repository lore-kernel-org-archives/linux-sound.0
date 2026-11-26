Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795689483;
	b=HIkiwhQxmyEaH4lQPplJV8VZnfamYAmpUX6Yq4mHdvBFD2ssB7aBgnkMsm0pBQqWb/YO
	 vAoLdtqLuQ9kSK5cWxD/wm2S2t9Cjbq3pbaoZB6N2U9ermsBMtCX9AgK6Nb55oFKwrPH0
	 UFxmNN6ES/luSZw0DGRGWetdpUk1LyPdG+jAbDqaDkV4guwP4zoyGJq00wc8iPCHvaZkG
	 5v+CAxy9kbBbyvQAiODJG0qP/+SXtgxqPjJ5wFsdukq6f8DB6zIBaYSf89JphfGOTkiJ0
	 ti6BzQy/8B8OEsCfAHVbdv1HOWOSopxLk6HFLSd+KgjCq56Vni7TjPqp35NdG/U8R4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795689483;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=WNHMtOeOE2A38FnJhD72GmJVVL0KvDefcFaN8fCeJcM=;
	b=mNfijtDEnraejyl9t7HLW0d8n7z6L9uNl36y5ZaUrskXszP6xw/UQJHFLluVBrFlp9n3
	 1oxr56ro1tc6azlGJc39QIea+Epot/FAgMiCEPR+GRoinZAgmbsirc2EiSvyuArLiKQb7
	 RjbQG5dHMjYs4DrTTE9TaJ5a+VF6YV19dOcPqTpERM4lITEVm5bgQ/jWzycow4oWTQQVh
	 QqAw4fy/OpI4+zL3KuS7Vq25aP6iER3uHUjrveHCNXjtmB2cpnQS2UUZIcSrYSu2GWcUM
	 nYTKiOzmJoGYko/U589HB9FgoVM1KSO6TCsNMIuD7TKEswXLeWT+ZsxASU0cdeLgUsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uw51CuDv;
	arc=none smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2721606A31E
	for <linux-sound@vger.kernel.org>; Thu, 26 Nov 2026 10:38:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2721606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uw51CuDv
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cde5a7d79b0so3522938a12.2
        for <linux-sound@vger.kernel.org>; Thu, 26 Nov 2026 02:38:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795689482; x=1796294282; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WNHMtOeOE2A38FnJhD72GmJVVL0KvDefcFaN8fCeJcM=;
        b=uw51CuDv8IIVh1o0UAMHIqZ9bdSbg59VfCGMkmhdiSRYFTG2Vv+76CA6LtbSTOeoiU
         x56l6KNkIUrA97M2EysjDqezr6DXn7vsUQYHkrDPC9gJsZgJkJVR0juBLytYQTeOyM6c
         wEFxjHKjbzfKjY5lOiLXKs/tE5HUjri05HD7JhoadzycAZC0TTpho2Rc2VrhIyN0Y4K3
         +8SpwmyUUV8ALNA+rDejT90Zs8OCjkDIwR4gF3/r2NARfl3q4ZGWHPpg1YijXXGLxCjs
         m4lcBId90UkvEgtezG0FXr9+hJ8bhSc0BLjxir9jE8RTcusWKWahw5XpiM9VfbuWRv6K
         8t0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795689482; x=1796294282;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WNHMtOeOE2A38FnJhD72GmJVVL0KvDefcFaN8fCeJcM=;
        b=srOZosTRRo0lIFN1+i9p/lFXbLeLU8461xSA9a2CvUMEQMYykcvELDUTbNKzpaThr0
         OcISzBDSbt6rYuJwZ5c3Aul0ovL7Q2j/ZrtM4PbhCbZbnZmUu1x8rDwDkoxXoddBqy4b
         55fpXZRYmGD4dtQKcg3REkTPCHuvqR4zjLzqXWOMJvJp6sjt+X2CaEhBkleYQ0B02gUE
         K7h/84lR+dPUMdTjq1ZTY6DiK9YHq0XgAWy8YVg86/umKYno7eb9BQ0606jVbfrrJFEK
         cEOKE5zfJjgXmTnMEFgLHXtNj2VztSutZ4v8vV/STBOCCh6YcT50vkS23O7HJrnzGzMB
         A6hg==
X-Forwarded-Encrypted: i=1; AL+hErEL8CPsrv4FJn5HNXRg04UbmVvSMsSa0O/itZ/mo0lHm17PApZW3kktUwQWFjU72PRiQiD8h14SLRV4MQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9zR4Heu1v5B++t3Gaa+QuV9r4cPJc9dmkZryVz8yQ0BWdavxJN
	yzRbsCP4qsrnxfWf75fNI32czp1PUPpqmTBKwZi/y4BI+tdtQrmvMT1Tu98WrqQG
X-Gm-Gg: AZFdTZfvx+Pr9L1xMFYUWAUik28MsoTJqrbXLk9+W9f5/hkVDSrifdhCsccgTNrKJvy
	UnuAx6xyIUwUiBNZZDiwZp/qI26xlUk29ZPicawuLK8PLq8bxiHBLqeZNo+Xkk6CdhTQUE9jvn4
	tGNJlZVbwq1ESaSnrGeO9/+GmvnCa4xg0P7Zp2PGQIyIUFGN+UKdGUHwmufhQdHMu3fsEQyx4YQ
	2BB0Afg8L/clOUWj7T6VVhtW8kfYgPImGjx76pFp1/IrXVig9HGdSc0IwIoscIi3TG6vvtymSOP
	y4eBcDiYOMhWadw+qv1G/Ldtv76ojbUQ3mRdr+PSHkwilbL02SN3rJDCCELPamFFGY1AX45n3Bu
	+Y8uE93fl+lON6AN9wOBnrvubiVY+e1YTFZPJOvyl6dHgGVP4NVd0VHQ70+21+WahprXbvRXvQD
	rXPb28Brr9SzxnHSM8H5XYEXOeQojwAQoYOWTYebzoMqIBv1YqvA4u+WIZMjKyNcRUFLJpqx8RI
	dSVn3rXfElYDsQAqDfN7+tHw9V4mASTW4Hqd5YPy87yP8iYVF/84SpKABqtVZKXVLBxUmk0Y1y9
	B3jhjPv26BngKE9dTbL51ZfIHhdei3hHqdsXDtfM8r1uJi8i0Lhjma4vnYugjet35nXDWZm1IXB
	p0OQ00lbwrlR/ToXfgMeDx1wLUbpvKEA=
X-Received: by 2002:a17:90b:2f8f:b0:3b3:bd07:665b with SMTP id 98e67ed59e1d1-3b41c9325b1mr19483392a91.40.1795689481744;
        Thu, 26 Nov 2026 02:38:01 -0800 (PST)
Received: from DESKTOP-TPPBPA1 (36-226-201-204.dynamic-ip.hinet.net. [36.226.201.204])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b420e1307csm31181694a91.7.2026.11.26.02.37.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 02:38:01 -0800 (PST)
From: Roy <rongh7426@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Roy <rongh7426@gmail.com>
Subject: [PATCH] ASoC: hdmi-codec: Clear the parsed ELD on unplug
Date: Thu, 26 Nov 2026 18:37:57 +0800
Message-ID: <20261126103757.655758-1-rongh7426@gmail.com>
X-Mailer: git-send-email 2.51.1.windows.1
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

When the sink goes away, plugged_cb() clears the raw ELD but leaves
hcp->eld_parsed as it was. The eld#N procfs file prints eld_parsed, so
after an unplug it keeps showing the monitor that was last connected
until something is plugged in again.

On a Raspberry Pi 5 (vc4 HDMI), forcing the connector off through
/sys/class/drm/card1-HDMI-A-1/status leaves /proc/asound/card0/eld#0
at:

  monitor_name		WaveShare
  eld_version		[0x2] CEA-861D or below
  sad_count		1

Clear eld_parsed together with the raw ELD, as hdmi_codec_startup()
already does when it finds an empty ELD. eld_parsed is only used for the
procfs file and the log message in plugged_cb(), so nothing else
changes.

Tested on a Raspberry Pi 5 (Raspberry Pi OS kernel 6.18.39, with this
change applied to its snd-soc-hdmi-codec module), forcing HDMI-A-1 off
and back on twice:
- before: eld#0 still shows WaveShare after each unplug
- after: eld#0 shows an empty ELD (eld_version [0x0], sad_count 0) after
  each unplug and WaveShare again after each replug
- HDMI audio playback still works

This change and its description were written with the help of an AI
coding assistant (Claude); the testing above was done on real hardware.

Fixes: 0ecd24a6d8b2 ("ASoC: hdmi-codec: dump ELD through procfs")
Signed-off-by: Roy <rongh7426@gmail.com>
---
 sound/soc/codecs/hdmi-codec.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/hdmi-codec.c b/sound/soc/codecs/hdmi-codec.c
index bc59da2..ff4fa9f 100644
--- a/sound/soc/codecs/hdmi-codec.c
+++ b/sound/soc/codecs/hdmi-codec.c
@@ -973,6 +973,7 @@ static void plugged_cb(struct device *dev, bool plugged)
 	} else {
 		hdmi_codec_jack_report(hcp, 0);
 		memset(hcp->eld, 0, sizeof(hcp->eld));
+		memset(&hcp->eld_parsed, 0, sizeof(hcp->eld_parsed));
 	}
 }
 
-- 
2.51.1.windows.1

