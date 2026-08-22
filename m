Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5787B493631
	for <linux-sound@vger.kernel.org>; Sat, 22 Aug 2026 04:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787373054; cv=none; b=KUiPDvCH3WC5yL83lB8BFtMDpUkEhV2wzw0rYmBpa8SLtSHOsEYzg7CQjTqzJmMU2EK6US4rcExePNv/u+vgmXdIgsRJghaHShInq/hgyr9ilHGYBfvqJOgBJsmSELHAdmWTI9GqLlspmsjq+liynP4icJEZplvO/pZjBag1qgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787373054; c=relaxed/simple;
	bh=rIEhMC6ocx+/cQC8F0UTEb4G1pz7eMu9LoZkrSeeeXQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D+1RisJITdVM+ZaoZv0RaU/u3+84276kmpGviH9FIFnyQl8WR5aVBGk/RPLdRtz6wjQB3ItWYIlKDvt4OMFndGymEHvWpO4PWp+J6sGxe+wsv8DF/fHmQpUWxbr/YyRbYvOsKLU3tWQ5omxnwRGfuMKivN78QoJf1X/DuDj6JHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=frba.utn.edu.ar; spf=pass smtp.mailfrom=frba.utn.edu.ar; dkim=pass (2048-bit key) header.d=frba.utn.edu.ar header.i=@frba.utn.edu.ar header.b=QnACG6ag; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=frba.utn.edu.ar
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=frba.utn.edu.ar
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=frba.utn.edu.ar header.i=@frba.utn.edu.ar header.b="QnACG6ag"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-ca12086c06eso1312959a12.0
        for <linux-sound@vger.kernel.org>; Fri, 21 Aug 2026 21:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=frba.utn.edu.ar; s=google; t=1787373051; x=1787977851; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bDjZ9dUaDMx7+WWOVurUEdBAOnHYCOSOjgu8MtWZNJ4=;
        b=QnACG6agRsYcVN8ntqvNOfktl49qqJFIDbWHCy93mxcuUR+UOMB8f8fK+O37djnQzw
         IQ3cXG/WoII0ixBogv48iByw+jbZ1dN6VCg0laaIGetnYqPJ9gQ6D5uuxVd7ObyU5Xz2
         tl55k0y5RjbRozzM83fZM2ymMMl3CzRi3Ze1Vayg02sT/JvDpcCo8x5taW7MpcVUcO5/
         MTCyf6eBmu9IvBgsLzpjec8vRv0635uh/Pw7W1FtKuAKtcTtrpTmzpZDQ6plnS3epeVU
         RPnC8274wOLOk6L0BxaBrY41k4fWNXLttnxldP5rQ+58/ummjPOzXxlwt7Vd8yNSw2KM
         jbLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787373051; x=1787977851;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bDjZ9dUaDMx7+WWOVurUEdBAOnHYCOSOjgu8MtWZNJ4=;
        b=XrxowrH7OH1wWJuwqfgG3xbfTKMe4hRAU6GI5XujkzKfKDaN5A5z8df2dpOMgR/1GP
         NOrRSR5JwwFemdIlUY0wSXMY7vpWgYFuu0sM9NcZ9fjZkHGtXfRe8ykV2DRyADI4IijO
         KXeQxi2NfEUcJ8oNxgthYAg9ihv6bceoZKdzFBXjH2q8k3fZiEQoqF0kgeCgfXj8fGEM
         RrMYwbX+MnL4Mdb87VmTkgEapCZyKgrA7IgkzV6ungJiJKm7QxHBTRvnjeE169n4Ydvr
         Zg24dq2fftbqGSJVJmKj0gbQEpzoAT/hMjSrqg5bYfjf4EWnkiK7xubdTtdOtBw311Pu
         FKCg==
X-Gm-Message-State: AFuF++mJgytoBRJTYcFDIEKCWyqv4Xxc56H23jSBDcumLkBG8jeM0eEP
	hUurvhUzIq95j9dphyK43rZCqjpZTdY580c/EcfUQvpB8rTQKVUeX3tcxMvpuE1I5a1d2ZV1Mmf
	2v4O8Moj43Q==
X-Gm-Gg: AR+sD13YIOYV846gXbngw+eMhD3UpND8UX1en+EZXbWxebvXayeC4FBkUTp7s+P8YJe
	YgKjEomlKjb2jWwh2+orfiXDgC7gEROzv5OvrOJJIyglO7a2YxHhnk8VWH0GWw1bWElpblgKKn7
	BuJkJyaDy7Taf86vAxvrlCWFtv4//JnshiKw4I5sLcyD4AQEzKUHdU0H+fwQ5VPQIc3nTH/JcBf
	g09q7M3UXwjdJcYKozdk+CViY0ZhFtbHknQSkTAECS/jCJsjtTWtNI6g1SBZDd3WmmO1KdTDSur
	a4u32FaW4bR1iWCu8czSrGdHsn8bQa3HvLLJk4toGAb2/cTFek0biy8EdW9oPbCf9JEulHECHTo
	Y/mP8N4aoOtEMY/7X797ay1sWiqnoerpK85CEvusLh2sUfXN2A4+yhxN0Hb3NhWVPS/ZP9X3Aam
	TjYmndhlO0c8CFaoSnhn70ap0Rmt4AJhw5zksFJPT+CftuIpHuyfDJ+3gTzq7Qvo70yMGsZdA7N
	FrJW/7EQ/amh+k6XdmfevPVfw==
X-Received: by 2002:a05:6a20:a11f:b0:3c3:89cf:f3a with SMTP id adf61e73a8af0-3cd4ba0546cmr6171255637.5.1787373051607;
        Fri, 21 Aug 2026 21:30:51 -0700 (PDT)
Received: from localhost ([190.192.192.134])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1418619d6e1sm3776632c88.15.2026.08.21.21.30.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 21:30:51 -0700 (PDT)
From: =?UTF-8?q?Federico=20Valent=C3=ADn=20Andrade?= <fandrade@frba.utn.edu.ar>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	kuba@kernel.org,
	alexander.deucher@amd.com,
	=?UTF-8?q?Federico=20Valent=C3=ADn=20Andrade?= <fandrade@frba.utn.edu.ar>
Subject: [PATCH 1/2] ALSA: usb-audio: Skip reading sample rate on M-Audio Venom
Date: Sat, 22 Aug 2026 01:30:32 -0300
Message-ID: <20260822043033.529424-2-fandrade@frba.utn.edu.ar>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260822043033.529424-1-fandrade@frba.utn.edu.ar>
References: <20260822043033.529424-1-fandrade@frba.utn.edu.ar>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The M-Audio Venom (0763:2084) is an USB Audio Class 1 compliant
synth with an integrated audio interface, it does not implement
GET_CUR on SAMPLING_FREQ_CONTROL, hanging up if requested on
endpoint 0.

The first class request issued by the driver after enumeration is
a GET_CUR on endpoint 0x02, freezing the device's USB microcontroller.
Timing out on every transfer afterwards with -ETIMEDOUT, such as
SET_INTERFACE, so neither the mixer nor any streaming interface is set up.

Analyzing a USBPcap capture of the Windows driver I found it never
requests the sampling frequency, as the synth exposes a single
discrete of 44100Hz on both streaming interfaces, thus asking for it
is unnecessary.

So I applied get_sample_rate to avoid this check, and
disable_autosuspend because the synth doesn't come back from being
suspended.

Signed-off-by: Federico Valentín Andrade <fandrade@frba.utn.edu.ar>
---
 sound/usb/quirks.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index f4e1eac639..caa80487f4 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -2334,6 +2334,8 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 		   QUIRK_FLAG_MIXER_GET_CUR_BROKEN | QUIRK_FLAG_GENERIC_IMPLICIT_FB),
 	DEVICE_FLG(0x0763, 0x2081, /* M-Audio Fast Track Ultra */
 		   QUIRK_FLAG_MIXER_GET_CUR_BROKEN | QUIRK_FLAG_GENERIC_IMPLICIT_FB),
+	DEVICE_FLG(0x0763, 0x2084, /* M-Audio Venom */
+		   QUIRK_FLAG_MIXER_GET_SAMPLE_RATE | QUIRK_FLAG_DISABLE_AUTOSUSPEND),
 	DEVICE_FLG(0x07fd, 0x000b, /* MOTU M Series 2nd hardware revision */
 		   QUIRK_FLAG_CTL_MSG_DELAY_1M),
 	DEVICE_FLG(0x08bb, 0x2702, /* LineX FM Transmitter */
-- 
2.55.0

