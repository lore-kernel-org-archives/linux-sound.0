Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11D083112AD;
	Mon,  2 Mar 2026 18:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772477963; cv=pass; b=t6tisItl18ZnumSU5l7Qrx7jI2evvsDdZUVNYxQe4hfxfJA6wOMtHBrCyXM6/GNgHOcOoQVOSPhkW3Hyh49VZLSBsgy7hSuM1nNqmuYDmGXSyy7PkEks25mWhYw39bHgOoSjD7qPnWWdf46cx/hKc3B741n6PJ3eZZyVyH04iE4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772477963; c=relaxed/simple;
	bh=5oz5RyO8UYe4dgL8ucCw/EU6FRVkjHzvZ/WHFXpmmwc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=BztWp9YbPh5FUCMCWPIMW246XYXBtA+762+N/pJ8jPEHJNf8HztNq0xpkKBlN1TwWdXqd9b9sw/Wx+yzLU58OheIi00pNNzmIYGOGNRLoVqp+AOjVjEZb6BD/aF1NYaQnc344Ow1tY5SM7enAelXclX6vWW2ffEOIw2/gvYcwMA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=SGCGYHWI; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="SGCGYHWI"
ARC-Seal: i=1; a=rsa-sha256; t=1772477947; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Dx7y5kcVKz4OYTCc4uXz3txnYk3scfYVm2ns6Olr1EDqHI17Yn88tuglMzk56RpXrX9fvOsbwKka9+xeOQdJqFdg4fq2+/kcGEb7iREgRRvZcJwM61frFpW8bFvwUEWBXr0D+6oVqaPllBPUM/r6L6CEd+aYAnb8Xzg7y1fIieE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1772477947; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=M4rWXnAvu5JYVE7JK/3CKDe60QXfYSPSGB88oix38gY=; 
	b=Pl5fF6N7vVYKTMfDdsX/Fwcdv0A0SF9PhE855McbnIFvf3Ha7j2SyYZBgrBYrKqWe0LVa4Fs8v9ueZuHwV86ZJT6pm+qQf3xIbEUwAny2jqLp1BtnrtI5zem+8jGd8uai/tBHUDA/xV9wxyP15leABn5ieVFz6lwutdatvqNhB8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772477947;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=M4rWXnAvu5JYVE7JK/3CKDe60QXfYSPSGB88oix38gY=;
	b=SGCGYHWIxCDbCF0zQC1IWNu54LIuAwz+r656wZOEP13+XXjbSDZ+kAV2Jlu0rV8F
	j/tPNdeP9PXxz/xd3EZOuwcMWl/WPl0NRYEh/egVU5k27o3FtCNfL6pnrUYRt7fflZE
	O6jIBr+8wL8bSer7jhfGJt7rLJ5xZdqTLWwMVxrVQeIL0rqbiHWY9TjyLKL4wlBJ7Qo
	zvV77Xjs6Az3tkyrMq87ICC2XHCf02PPUgI+zxVM5sP4jlzzIZnmi8Kig1Jd/OP9O4T
	62AU0hGSZrF6o74O90hJpfkegRUuOlcQDPABxtLa0UW13dO3cyTVHy0PLchqtmywjGD
	t4gO+qQoiQ==
Received: by mx.zohomail.com with SMTPS id 1772477946377759.5186753675024;
	Mon, 2 Mar 2026 10:59:06 -0800 (PST)
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
Subject: [PATCH v2 0/8] ALSA: usb-audio: Add quirks for linear volume devices and deconflict VID
Date: Tue,  3 Mar 2026 02:58:51 +0800
Message-ID: <20260302185900.427415-1-i@rong.moe>
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

 Documentation/sound/alsa-configuration.rst |   7 ++
 sound/usb/mixer.c                          |  84 ++++++++++++++---
 sound/usb/mixer_quirks.c                   |  56 ++++++++++++
 sound/usb/quirks.c                         | 101 ++++++++++++++++++++-
 sound/usb/usbaudio.h                       |  12 +++
 5 files changed, 242 insertions(+), 18 deletions(-)


base-commit: 11439c4635edd669ae435eec308f4ab8a0804808
-- 
2.51.0

