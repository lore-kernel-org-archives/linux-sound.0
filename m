Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A103C38643D;
	Tue,  3 Mar 2026 19:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772567430; cv=pass; b=O5ib4nquY5+y/b0Jl/kmBMVDyH7rleLD5M5jg24xCBwUIF4iE4uC6l/0gF3mN9WNjVb+I+x0hHkbEWzjbIp+wW8REd8dxlidhdYg3R+6QyHxk1DRegfBAT37N/OlSNvug6iEo4LxHi1xLMkahL2Seae/jfcx7EJSZUSWLmczsz8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772567430; c=relaxed/simple;
	bh=DgCDy76J/msDhB3mPy6eXfxx3MwQApX7KCISfKk1anY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=T/ftU28Cz15ceMC/vNXS9KywyCoxggDv5yX4dglbz6qpi+Wir0Q2aHd0WRSzzR2xz5K7542ZqL7gcGUeved8l6Br8c1Vvou1aXfZUWYl99ocRdFo+RCzpNZvvqdoSaac2q/LZWmoYcybk6aiUPePnWfBUbF+LQjZ6dmcjh87AEQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=dYwAQ6z9; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="dYwAQ6z9"
ARC-Seal: i=1; a=rsa-sha256; t=1772567293; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=eP4l0NDbHn7Jutj+JV475DmQoVlop1OCw+8R3/0jv99ZOPUHvn2belgQrlRs2KdlTzP2bf+FDHr64e54+laYiwykqZWUO5Z3rzIUIpRwsVU0ONwoUl7nyQBG7SM0zy3yifVSnmkEb/MX3AU1M1M58G7QwTtX0tUD5IH0uCJCdpA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1772567293; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Y18qqMZWDPBwIEG3oJSl7DALpFqCPbAAjqKcRfr13ZE=; 
	b=OS6LJTxLMhr1dh40ZDnsthy+lrgc6LD7zIuhIigva596I8Hh0K1xLmYRCprzaM4omPZ6qn40gqFReY8LkagHLKdSmfoGmrQtAsbDMOa9T770L85WRCeFB/S0k1HtU+yF5F1MktHgWsr/Ra1Lnyl6uLqkPoyk9M5s4SxdQZJUjsM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772567293;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Y18qqMZWDPBwIEG3oJSl7DALpFqCPbAAjqKcRfr13ZE=;
	b=dYwAQ6z979U1JabpUetgdmonVBEaFls1tIrAoPh1DZcXWB3KjYSTVndA/9zPgM58
	nAkrJSkCVfJawStLdVAPSwVlLaqTyISRSKE/NMqbfkOhLXPsp2QfR+tZ/Bk2RBj+m4s
	xuvl+Hdj8i93aMj5WqH/DGMWd0b60YR/0XWuWUWSLtq8z55WDiSAqGJz5S/UdoLWZT8
	9Z9PBo/Iz7hInHJdFi89JIG+4nD1SQT3khGXWaDXYVI2LgjmaxWZ/m5PcD7hccVC3Sm
	grqkgFFULvFX9K/vtjUgYAgHJKs5kAJOEtbpJ+Zqcnqs5lH4ABXlJnFVCrYWjqwdXPx
	/MU9Xr81OQ==
Received: by mx.zohomail.com with SMTPS id 1772567292500723.4550315360998;
	Tue, 3 Mar 2026 11:48:12 -0800 (PST)
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
Subject: [PATCH v3 0/8] ALSA: usb-audio: Add quirks for linear volume devices and deconflict VID
Date: Wed,  4 Mar 2026 03:47:55 +0800
Message-ID: <20260303194805.266158-1-i@rong.moe>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Some quirky devices tune their volume by linearly tuning the voltage
level (linear volume). In other words, such devices has a linear TLV
mapping of DECLARE_TLV_DB_LINEAR(scale, TLV_DB_GAIN_MUTE, 0).

The series mainly adds quirk flags MIXER_PLAYBACK_LINEAR_VOL and
MIXER_CAPTURE_LINEAR_VOL to represent this case respectively for
playback and capture mixers. Afterward, apply these quirk flags on them.

Some MV-SILICON devices with these quirks also have another quirk: VID
conflicts with Focusrite Novation (0x1235). Hence, add support for
string-descriptor-based quirk table entries and define an entry for MV-
SILICON to deconflict them.

Some improvements to the logic of volume range checks is also included
in the series to help identify quirky devices with linear volume.

Changes in v3:
- Adopt __free(kfree) on string buffers as it turns out to be able to
  handle ERR_PTR() gracefully (thanks Takashi Iwai)
- Improve readability by replacing the goto pattern with
  `p->usb_string_match && p->usb_string_match->*'. The compiler should
  generate equivalent control paths thanks to the optimizer
- Link to v2: https://lore.kernel.org/r/20260302185900.427415-1-i@rong.moe/

Changes in v2:
- Separate [PATCH v1 6/9] into https://lore.kernel.org/r/20260302173300.322673-1-i@rong.moe/
- Alloc string buffers with kmalloc() instead of on stack (thanks
  Takashi Iwai)
- Get string descriptors in a neater way (ditto)
- Tiny differences compared to Takashi's sugeestion:
  - Use `IS_ERR_OR_NULL() || strcmp()' instead of `!IS_ERR_OR_NULL() &&
    strcmp()', so failure in getting the string descriptor won't
    resulting in quirk flags being applied to irrelevant devices
  - Use trivial goto cleanup patterns instead of `__free(kfree)' as the
    latter can't handle ERR_PTR()
- Tiny differences compared to my previous reply:
  - Use usb_string() as Takashi suggested instead of usb_cache_string(),
    so that we can retrieve the errno and print it out on failure
- Link to v1: https://lore.kernel.org/r/20260301213726.428505-1-i@rong.moe/

Rong Zhang (8):
  Revert "ALSA: usb: Increase volume range that triggers a warning"
  ALSA: usb-audio: Add helper function for volume range checks
  ALSA: usb-audio: Improve volume range checks
  ALSA: usb-audio: Support string-descriptor-based quirk table entry
  ALSA: usb-audio: Deconflict VID between Focusrite Novation &
    MV-SILICON
  ALSA: usb-audio: Add QUIRK_FLAG_MIXER_{PLAYBACK,CAPTURE}_LINEAR_VOL
  ALSA: usb-audio: Add linear volume quirk for Hotone Audio Pulze Mini
  ALSA: usb-audio: Apply linear volume quirk on MV-SILICON devices

 Documentation/sound/alsa-configuration.rst |  7 ++
 sound/usb/mixer.c                          | 84 +++++++++++++++++----
 sound/usb/mixer_quirks.c                   | 56 ++++++++++++++
 sound/usb/quirks.c                         | 85 ++++++++++++++++++++++
 sound/usb/usbaudio.h                       | 12 +++
 5 files changed, 229 insertions(+), 15 deletions(-)


base-commit: 63082d085f52a3c77ef572d71d2d08c642da2a55
-- 
2.53.0

