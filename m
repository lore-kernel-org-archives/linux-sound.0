Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB7CB30B51E;
	Sun,  1 Mar 2026 21:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772401077; cv=pass; b=MAxfRjL5fpzsq6StWXngFkmywyunw19gOaarCEKgkLtRGXGTjb8SgAefG2u4LGtwEIIYOmuD+AsGk7mf4/9eNUX1iatiIJwPYvxNj0Tz4V6uIMpJJNOFN9Tva2rvWOpKCbjL/EtL4ohsguAwmjiz/Ddub59BTx2dOc4qsPkHimI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772401077; c=relaxed/simple;
	bh=NM9WorNUTYDvCgYuvOhOMqaKRtpEaQHw3gE18Ca9y7g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=QTtiIPfS7LdtpD2DbtrARnQ/KXcBCzChITgDXGW0knO+NcU0kmQqPg5FUSti2D7C2PK+YiSXDRsx4iFxBAI80GusAM4v3XwfBTp08FOEyHGSkh9QiXcgbAZiY70MbmCYb/23mXvRFtl4gDpL1W8hp4BIcSLTfGqrRqeB4tnGPf8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=ArknmnUm; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="ArknmnUm"
ARC-Seal: i=1; a=rsa-sha256; t=1772401054; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=AiHFJU/EEtfKo3kaCZGflgaiCW6Y7PMuP4Iflj5uxXPkos7WY1B3uHjLYeWIaeV2ZnCyiAVGNpl9WFweNLq59P/iOe+7S9gJ0evnM/fZ4hc/boZXUbqvwzOgl27/lKnjnehmBJOCrIdEG7bAl13xYqcDtR+nyrQD7S8phMgtCwo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1772401054; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=YpXMZafJrVbcV4K0q7QwGW+t1sRBWv49tZIj9kK7sRE=; 
	b=ni65CoLSPMx5t53krg6E16Fe72C+8Ok3/vnjpDObWxS3Pu0NYi55kCkwfmQvbhm6AqVkZ8TCt5XWJ1kaFDi6gbhStNd7Wff0lauFby2mMg0QY32zSbLvaSLmsADLiZUPb5CIqZf6/uprIn045t/84/MKexYdAeGrJSOE9upUBkg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772401054;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=YpXMZafJrVbcV4K0q7QwGW+t1sRBWv49tZIj9kK7sRE=;
	b=ArknmnUmoNm2C2w0H+sSucaxMkThaULNIDk6dVpbowaCsFfuO+lanZvaeJyu4WQk
	NhettPPI9BUBgwBTlf7IwTl8IgNbhZxS21FaW1Jf1aA6O4AOScJClkQazN0GFUVSYh5
	gebgkSpRZOtVDf7T78v1Jx7wwh9zkFqBwjAzLyXSEcb9burxdJiPl/VqXK9WZd4UTwp
	r6/fmUAotCPvTY56+31Jipy2QkrXCh5qJ6UMPd8YvG4w6LA2Msp1NHuw7eLKqaLOgsR
	hQ5C0nFFbABrfrrrr8eEH7moaz7Y+k7rvbkiwygXQpeOoZwPIppVi2bfD1ZpQ0c9jCd
	H4BiWKOspQ==
Received: by mx.zohomail.com with SMTPS id 1772401053004351.32865877097856;
	Sun, 1 Mar 2026 13:37:33 -0800 (PST)
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
Subject: [PATCH 0/9] ALSA: usb-audio: Add quirks for linear volume devices and deconflict VID
Date: Mon,  2 Mar 2026 05:37:16 +0800
Message-ID: <20260301213726.428505-1-i@rong.moe>
X-Mailer: git-send-email 2.51.0
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

Rong Zhang (9):
  Revert "ALSA: usb: Increase volume range that triggers a warning"
  ALSA: usb-audio: Add helper function for volume range checks
  ALSA: usb-audio: Improve volume range checks
  ALSA: usb-audio: Support string-descriptor-based quirk table entry
  ALSA: usb-audio: Deconflict VID between Focusrite Novation &
    MV-SILICON
  ALSA: doc: Add doc for QUIRK_FLAG_SKIP_IFACE_SETUP of snd-usb-audio
  ALSA: usb-audio: Add QUIRK_FLAG_MIXER_{PLAYBACK,CAPTURE}_LINEAR_VOL
  ALSA: usb-audio: Add linear volume quirk for Hotone Audio Pulze Mini
  ALSA: usb-audio: Apply linear volume quirk on MV-SILICON devices

 Documentation/sound/alsa-configuration.rst | 11 +++
 sound/usb/mixer.c                          | 84 ++++++++++++++++----
 sound/usb/mixer_quirks.c                   | 56 ++++++++++++++
 sound/usb/quirks.c                         | 89 ++++++++++++++++++++++
 sound/usb/usbaudio.h                       | 12 +++
 5 files changed, 237 insertions(+), 15 deletions(-)


base-commit: 39c633261414f12cb533a8b802ee57e2d2e3c482
-- 
2.51.0

