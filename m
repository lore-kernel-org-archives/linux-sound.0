Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 147FF3FA5F8
	for <linux-sound@vger.kernel.org>; Fri, 14 Aug 2026 07:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786691775; cv=none; b=Jy/Fhb7HZH/cN8KkKEh8rGYlaFUBaWA8ORzlciYDvQDngB4YK2LV3SX+B+ZnIrAoWaNGyFQECOYnrf4kn9bnYJ7Ibx8oUQob1JX9UuGenMf1X6FD0LElRvCppg48aoa09rm6O80BHIsQn08hMjHTFL8Sx+ywYwrtJYq7B1eNbL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786691775; c=relaxed/simple;
	bh=E9CaKmu80WzLNW0pIDgymQDLhH1SIUPZwlcDxrvu310=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=nmUYSQ+4Exgfxa1u1EZIAYNv+iC47YvnLwNst9u6yuJ6VoNGLHO+spYwXm5BTCcLx3gAJK0rrX56KjUw2AGvId/qtSlMlxhIKp7Bk9tZejOp5tXHzjLuY1PE672Hox9qxVaCzfGUQ+B9pLLPs8Cu1Yd+ivoWZOPRauhPyURS0Xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z3RB6I3S; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z3RB6I3S"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-39c7fd45465so5623191fa.1
        for <linux-sound@vger.kernel.org>; Fri, 14 Aug 2026 00:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786691770; x=1787296570; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=blT0MxqalZ5HOlImHasYYT1NLWsOkpcDnw9nq0AxdEo=;
        b=Z3RB6I3S061WDuEjUh/2wicGt0duu2kWt35R1yui13rJBicPB8ObO3IGx2zouLKNz5
         PrcGpx/Wz6sLenuc+7Nb3MxiGtr56Dmih+pI5ObFDMpNi58J0SyIdSa66iub5Xoroc7u
         ioZS3IH6/Ztz44reNJsP7fN9a0eyl+QSzpsAH+cjaqU2P3zDWT7NSLZG5D6epC59dz0M
         Pco2qQRXhTmfZCbvAAeHeXymweznAC/Ykr9Xh4emvO+WPncwUvAzc9YUPGIJKHIAcdgJ
         FhJtzyPOuim6viiNT8pW2wvANIHikF/oVSZs/fdPnGfvKmzT6jQ2ltDWO0hMWak9RM1A
         C47A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786691770; x=1787296570;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=blT0MxqalZ5HOlImHasYYT1NLWsOkpcDnw9nq0AxdEo=;
        b=kvtABiozpk1WMDY67Zc/vzwO3SWOanPC/o+W6WsOHhQ4Gnqjm2IXohDDwEDFZ9Xojo
         3kJ90xp22Hrsfzfo/8/DhZJFBn7HPEOVx557FitcDBulmuckyPj35U5BE071HF0jhY4P
         31ihH5GiutsTom23uzi8JUXFy4YragpuKxfkXB99KfRZ40qLwUQbbCuBy9KwqcZedNto
         ZQgsNUg9N9adZ33N6Pe/vVprsQeWdSHQ/SBE0zQ0aQrC8SnsfgX2WwIzE8mVRweEYp62
         NyRLhr8Ka5F6Cgmsys7cJw9bOEXOVi+9zRueAdathdTrD0s0OEoTZQ614kGQslnv9B6Z
         rhaw==
X-Forwarded-Encrypted: i=1; AHgh+Rrm6K+Jf194dSlZHf2dK4P01WpTPsllFNNeZCHdQtSLrUiGf2+ZEi7/cluvPCqXGoNLY/PaOWKgygkz1A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzSnCg2S8PGqitajJziIhcXYi6Z6efJ/pNTnDVipMMphKDdLXxM
	N+Jql4THis/6O99KRnUah7lQgyMmjZmRWHuk2F/45Sloom2U48Sw2PYm
X-Gm-Gg: AR+sD12BjE+3v9+JXIIKG2g3C2RMOFyTTuDRuec+q19K5eum5OGep21Yvpiv8wnnN3A
	VhL4a8gW7Bo1Fq7+iqubuSuB1E4f+ZYUH12oQJNg8cymFr+LRpxvwHawTNf2TgHV+Ln34hDVPpj
	OdCo+a/jYTAl99giiEf+YsYFL6KouF7W+JO+RbtyJ3NTFQESosoYb5MqywYvtCeyxzHldzP/3U9
	DA94N++7aDM4sl8fLvcQdTvJ5Yj7+9ymQckFB+dQkxvh0NTCwNpz7gAARYc+Xh82c3FIc1RD6jz
	V8+/Tz343cg2oEeLRnCSDlok2NCdbekouDer847gN+RRqMpsPjDRtmZZDPDsXaIakXL4trzRYFs
	P+N4aCtqJGX06GBl2U174AUXyFhWUIX1jG2PGysB8sobfR9TrqYvzlmCkFP/yjwW+7HPokbS3+k
	K9mwvqRCZywsl11CoJSMUR+oJK2YWVEQ+5RCrsrF9dAS0c05gVy8dFUmikJXP7lHWMtJjhKlrtO
	KjI682TKgWZA+2aK099p64qd8b0jy7laQ==
X-Received: by 2002:a05:651c:30ca:b0:39a:d587:ceaf with SMTP id 38308e7fff4ca-3a132408060mr3033751fa.8.1786691769649;
        Fri, 14 Aug 2026 00:16:09 -0700 (PDT)
Received: from localhost (host-80-73-162-2.rev.as20985.net. [80.73.162.2])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a130cfb752sm4439391fa.29.2026.08.14.00.16.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 00:16:09 -0700 (PDT)
From: Andrey Golovko <andrey.golovko@gmail.com>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: "Holalu Yogendra, Niranjan" <niranjan.hy@ti.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Antoine Monnet <antoine@montane.tech>,
 Robin Everaars <robineveraars@pm.me>,
 Ville Saarinen <wiza@saarinenkoti.fi>,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] ASoC: tas2783-sdw: fix the read-only Control handling
Date: Fri, 14 Aug 2026 09:40:00 +0300
Message-ID: <20260814094000.22118-1-andrey.golovko@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The two read-only Control patches from 13 August, resent together as a
series because the second one depends on the first, and with the change
Mark asked for.

He pointed out that the XU22 Control 0x14 in the read-only list is
SDCA_CTL_XU_FDL_STATUS, which sdca_fdl_process() writes.  He is right,
and the description I gave it - "firmware download status" - reads like
a status the device owns, which it is not.  It is a handshake: the
device sets the bits it owns, and the host writes its response back into
the same Control, keeping the device bits, which is exactly what
sdca_fdl_process() does with response | (status & ~SDCA_CTL_XU_FDLH_MASK).
So it is out of the list in 1/2.

Whether the write is reachable on this device today: the driver
registers no SDCA interrupts and never calls into sdca_fdl.c.  It
downloads its firmware itself, with request_firmware_nowait() and its
own container format in tas2783_fw_ready(), and the machines I have
describe no Smart Amp SDCA function in the BIOS at all, so nothing
populates the interrupt that would drive the state machine.  But the
Function does implement the FDL Controls - the driver lists 0x10 and
0x12 through 0x16 in its defaults - so the state machine is a plausible
thing for this driver to grow, and _regmap_write() answers -EIO for a
register the callback refuses.  That would break the handshake at the
first response.  Not a trap worth planting for one entry in a list.

2/2 still keeps the Control out of the cache, and now says why on its
own: sdca_fdl_process() reads it to see what the device asked for, and a
cached answer would hide the device half of the handshake.  Writable and
volatile, which is the normal shape for a handshake register.

The two are otherwise unchanged.  The behaviour I measured on an ASUS
ProArt PX13 for v1 stands: the calibration data written at probe is byte
for byte what it was before the series, and a read of the PDE23 actual
power state answers 0x0 with the Function powered, where before it
answered the 0x3 placeholder from the defaults.  The only difference in
v2 is that a write to the File Download Status is no longer rejected,
and nothing in the driver issues one.

The questions in 1/2 stand as well: the list is static because
sdca_regmap_writeable() is not available to a driver running its
fallback tables, so it would be good to have it confirmed against the
documentation, and to know whether the read-only Controls were meant to
be in tas2783_reg_default[] at all.

Andrey Golovko (2):
  ASoC: tas2783-sdw: do not treat read-only Controls as writable
  ASoC: tas2783-sdw: do not cache read-only Controls

 sound/soc/codecs/tas2783-sdw.c | 99 +++++++++++++++++++++++-----------
 1 file changed, 68 insertions(+), 31 deletions(-)
