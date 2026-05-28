Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 366232E7367;
	Thu, 28 May 2026 18:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779993548; cv=pass; b=qTpo2MKQr/USN4PuO8+nuw1WAFiBMvDzqv2KkAx9agrLNqkk5cfD8qq5vLIDyciGAXwl1el2Rcur4uSud+HEcp7VQYNiGv6OTpfa8YfPIuumGSAp9n2xQryCAVSBJX9FB/CS/YnM2aV+PzT5SP391R2g3cxSFlK882JerXKxUfI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779993548; c=relaxed/simple;
	bh=QFY5jsE/vGWbgNEdERv1dxFAjVmBvoEya3oPzBjWGQQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TCEX6m9fSPI2/u0ZM8wK8kjeHLi2FXw5+bRunNnxAgFQ9iGthk/+BTaxWST+VCYq+0Qk8PPsjTT+AQGcIV90SK3ngf0kptLF7lQYvZ5xqhuaqIRmjvXdhKFHpiiGfapHP5yv7Hw9zmkYxLcHfR6Lwbog2y3MKsW/sl1N9MwVNKE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=A2kCwTnt; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="A2kCwTnt"
ARC-Seal: i=1; a=rsa-sha256; t=1779993542; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=W4ika/1ptbmr9ixyD+agWAUWKed8n8OZcnhi+1Y715hIfow0XqIUqDPcVRSMhxTNRW63HdA0oBFCewWVaKmNt2q9u1l7W3U65qMiTX+VuzoG/I4CglkwersIRRulnAFc4QbOpxKWF4bvOf2DULw6i0dZMkrPz4MoXKK6zUs+NVg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1779993542; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ujwy7UcHr4Nwq2E0dxrl11pXS6hhydD+5+0jqAytz5U=; 
	b=Yq3mlN7w5YBXrq6DOZgbRGNn0LuYQ8BPI3o9BbHRHFfQjkpaEQC/rl7Jht8qqcPmEpeJSE1QSb43Xzz2nfDj0PcWIsbo5OOVtUjVOsbrhekq+ugh1U85ICIomAXNqTbKV6QazqacZH04+QydSjQbMXhW+tybHpFPX3ZpD2a3K10=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1779993542;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=ujwy7UcHr4Nwq2E0dxrl11pXS6hhydD+5+0jqAytz5U=;
	b=A2kCwTntOJ7FM3Xp+g99Rz/2tF28QyEkV7vvabH5S52ZmaTTPjtwOAoxLFo79Sow
	SLJKB8M8gsgxZTK6xhoRh8A3/dTf6OZuz+iLDm8PUYba9Cn1wvetjpqzHHAUXiFWGAH
	kB9/A+h6QtY1jkWf/egee0p9wmKln2L0t9VcF/KEHJPPBTag05irvuyT9Kd6SquBE03
	5ZcfkjATuFJWcKxKBEcNBJHUc0bot1wtv5MLhw1+BU+dh4ryxpMf4UHi36NbFok34mt
	PtRkSGiX19QJaMXmgQLddfIArOpY51FtQMmhXnXZYZg0tDfiP/ugTPwC7nKr2wSTiWL
	RtcvwtuafQ==
Received: by mx.zohomail.com with SMTPS id 1779993540719871.4951969302729;
	Thu, 28 May 2026 11:39:00 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Subject: [PATCH v3 0/2] ALSA: usb-audio: Add
 QUIRK_FLAG_MIXER_GET_CUR_BROKEN for Sennheiser MOMENTUM 3
Date: Fri, 29 May 2026 02:38:54 +0800
Message-Id: <20260529-uac-quirk-get-cur-vol-v3-0-bde363188ca4@rong.moe>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL6LGGoC/4WNyw6CMBBFf4V07Zgy5VFc+R/GBZQB6oNqC42G8
 O8W3LAxLk9y7zkTc2Q1OXaIJmbJa6dNH0DsIqa6sm8JdB2YIceMp5jDWCp4jtpeoaUB1GjBmxv
 UvMIClaC8yFj4Piw1+rV6T+cvu7G6kBoW2bLotBuMfa9hHy+7fw0fAwcqRIZVHiOldLSmb/d3Q
 2xJeNxK5C8JBolMaqFkk8g45RvJPM8f0qduwxABAAA=
X-Change-ID: 20260527-uac-quirk-get-cur-vol-d0b292c3e796
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-sound@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Rong Zhang <i@rong.moe>
X-Mailer: b4 0.16-dev-d5d98
X-ZohoMailClient: External

Since commit 86aa1ea1f15c ("ALSA: usb-audio: Do not expose sticky
mixers"), the UAC mixer core utilizes volume SET_CUR and GET_CUR to
identify devices with sticky mixers. Unfortunately, even though most
devices with sticky GET_CUR also have corresponding sticky SET_CUR,
which I actually met more since the commit had been merged, there is
also a rare case that some devices may have volume mixers that responds
to SET_CUR properly but with its GET_CUR stubbed. This cause the sticky
check to consider the mixer to be sticky and unnecessarily disable it.

As the sticky check can't distinguish between sticky mixers and working
SET_CUR but broken GET_CUR, add QUIRK_FLAG_MIXER_GET_CUR_BROKEN to tell
that the device should fall into the second category when GET_CUR
returns a constant value. In this case, the sticky check becomes
non-fatal and only disables GET_CUR instead of the whole mixer. The
current volume will then be provided by the internal cache that stores
the last set volume.

The Sennheiser MOMENTUM 3 needs the quirk flag. Though its UAC mixer
works fine and precisely corresponds to the reported dB range, the
mixer's volume GET_CUR method is somehow stubbed and returns a constant
value (15dB), resulting in it being disabled by the sticky check.

Signed-off-by: Rong Zhang <i@rong.moe>
---
Changes in v3:
- Make the log less noisy (thanks Takashi Iwai)
- Do not propagate mixer values written by sanity checks when GET_CUR is
  broken, nor restore the garbage backed-up value. Instead, rely on
  init_cur_mix_raw() to initialize the mixer properly
- Gate cache invalidation as well, so that the current volume is always
  available to userspace
- Update the comment of check_sticky_volume_control()
- Link to v2: https://patch.msgid.link/20260528-uac-quirk-get-cur-vol-v2-0-84d3c8f48150@rong.moe

Changes in v2:
- Turn the approach into a less radical one
  - Rename the quirk flag to QUIRK_FLAG_MIXER_GET_CUR_BROKEN
  - Add a flag `get_cur_broken' to `struct usb_mixer_elem_info'
  - When the sticky check fails, check quirk flags. Gate further GET_CUR
    by setting `cval->get_cur_broken' if QUIRK_FLAG_MIXER_GET_CUR_BROKEN
    is set, otherwise disable the mixer as usual
  - The quirk flag still applies to all mixers, but as long as a mixer
    makes the sticky check happy, it won't be affected at all. Only
    those mixers with constant GET_CUR values will have their GET_CUR
    gated. I assume the impact is minimal, since it's very unlikely a
    device would have sticky mixers (broken SET_CUR) along with mixers
    with working SET_CUR but broken GET_CUR at the same time
- Link to v1: https://patch.msgid.link/20260527-uac-quirk-get-cur-vol-v1-0-e9362b712e5e@rong.moe

---
Rong Zhang (2):
      ALSA: usb-audio: Add QUIRK_FLAG_MIXER_GET_CUR_BROKEN
      ALSA: usb-audio: Add quirk flag for Sennheiser MOMENTUM 3

 Documentation/sound/alsa-configuration.rst | 12 +++++++
 sound/usb/mixer.c                          | 58 ++++++++++++++++++++++++------
 sound/usb/mixer.h                          |  1 +
 sound/usb/quirks.c                         |  3 ++
 sound/usb/usbaudio.h                       | 13 +++++++
 5 files changed, 77 insertions(+), 10 deletions(-)
---
base-commit: 17065203e1bc7e7f2786998d532cd93a06265156
change-id: 20260527-uac-quirk-get-cur-vol-d0b292c3e796

Thanks,
Rong

