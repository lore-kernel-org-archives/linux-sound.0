Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E09222D5436;
	Sat, 22 Aug 2026 18:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787424816; cv=pass; b=sIFFxFZPi4AkcrBMZeRLRcAWtZlXLI8OpkPapor3zMSbQf9j3Bn0WlTEx0rerCSKHKBS7ic905MgzGYHuxpplUCHcghFY36MEZk5as1gFVZPc8qGdbJj6xQ7BhNPguuJckGebPNk9ar/ugIe2/eICE0wUYp7jzFOp/jijRmsve0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787424816; c=relaxed/simple;
	bh=pzIyJLV+giO1eX51T/f5Mgy4rEV6pAN6D+5uITZV+78=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WT1y2eiUSUEt8DlwZb67AiDZWTMv6R/jkbkpkuWZFwXlTUBL3wOKTAcdPvzWbdZsGWDailBUGuW5nFI7mADZ6IS/+5R4C1gk2nLim287julmWGf/MzpU8EG1ACTzhruMDk37DwI/j5vAnHQ40t4cFocdbZwMRSlIaNnBcQvESDg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=mQ5B1drP; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="mQ5B1drP"
ARC-Seal: i=1; a=rsa-sha256; t=1787424773; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=bEPjoqnyV7SKvFzw/1vCUCHcmIXtrgGeIQwndh2tcK+hCMdmFHtfuiQP1pMG+kL0qWkdMPZW+QaXYHebOXEBHPnT4OiNk3y9klO917ZZ1VHmnLZ1ghLJQ6AYDoeDez6qfNnWBwP5RfAdlgBKx/PzSY35Km+6k8XmunPoasndj7U=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1787424773; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=hf8O44JfqGxaW/TpZGF/KACS2NubdfSbktCZrdcD9XM=; 
	b=J2hXVhT3EHySDmobqiCQLfnVMec1m0peUz9iTrtDpvpQFrLlJqSYuGS6C7kIiQmBNcAkxdJ1eqe6Pg8jsQvaSL3GFQuCsGKU2cauNOkMaSkePPuvLdvPDbXWoGv8sFeVRTvlJz8E7kIeHqE9491iLHv0prNGjtG3erXYd53rQQY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1787424773;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=hf8O44JfqGxaW/TpZGF/KACS2NubdfSbktCZrdcD9XM=;
	b=mQ5B1drPo2HBYvppVlzy8qdoAJzrdy9EkIH/OAa1OoMRACYokoo2E0jocB3KcEkJ
	iDT67IaQFgRMwiVno5Knf+M4SViXLlzNT61wQfK1VfiNo7jGZHXHsLzW7bD4p3Z7Dzv
	Er1gKgfsvAFz/c2NF8nQlUKBCiFs0RTTGnAgJwKNU0F85I5GvHssRSgLWdBoOYJg3sI
	qHHmlZ9DtkjqAlIXF+3e5LxR1tjG4HeyOVOI1Q3z6nRyGyQrwqu0tz/JBbuUuCCkgqU
	VOMMVtLgZMJNEnBBlVK5uqVM1lPu+Q7XJx3TspPd7EssztDvKb+clcoRvCPrZKGiXJT
	v7O0Jg+Izg==
Received: by mx.zohomail.com with SMTPS id 17874247706264.015905758761846;
	Sat, 22 Aug 2026 11:52:50 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Subject: [PATCH 0/4] ALSA: usb-audio: Demote the severity of sticky GET_CUR
Date: Sun, 23 Aug 2026 02:52:27 +0800
Message-Id: <20260823-uac-demote-sticky-check-v1-0-a8cbe572edff@rong.moe>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMMQ7CMAxG4atUnvFAQVRwFcTgOH+oqWhRnCJQ1
 bsTYPyG9xZyZIPTqVko42lu01ix3TSkvYxXsMVqCim03U6VZ1GOuE8F7MV0eLP20IHTsY17EZU
 OB6r1IyPZ63c+X/72Odyg5bujdf0AVVncKnsAAAA=
X-Change-ID: bfb273cc-uac-demote-sticky-check-f92d4aaca7e6
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: Takashi Iwai <tiwai@suse.de>, linux-sound@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexander Niemeyer <adventureFAN@gmx.de>, Rong Zhang <i@rong.moe>
X-Mailer: b4 0.17-dev-1f2f7
X-ZohoMailClient: External

Currently, a mixer is disabled when its GET_CUR is sticky, causing
userspace to fall back to soft mixers, unless
QUIRK_FLAG_MIXER_GET_CUR_BROKEN is set. This leads to issues on some
wireless headphones with broken GET_CUR but effective SET_CUR, which use
poorly-performed lossy codecs and are prone to audible distortion at low
volume. They have to set the quirk flag to reeanble the mixer.

Considering that users can always opt into soft mixers if they need it,
i.e., when SET_CUR is stubbed, demote the severity of sticky GET_CUR by
marking GET_CUR as broken and only provide mixer values from the cache.
The mixer itself is still registered.

The default behavior of sticky check now becomes what
QUIRK_FLAG_MIXER_GET_CUR_BROKEN originally does, so the quirk flag is no
longer needed.

On some devices, whether their GET_CUR being sticky depends on whether
hotpluggable components are present. When the hotpluggable components
are missing on probe, their GET_CUR behavior is classified as broken.
Therefore, reverse QUIRK_FLAG_MIXER_GET_CUR_BROKEN as
QUIRK_FLAG_MIXER_GET_CUR_OK, so that it can be set to prevent the
heuristics from gating GET_CUR.

Note that even if the quirk flag is set, init_cur_mix_raw() should still
initialize the mixer value to cval->min, otherwise restoring the bogus
saved value on the first channel could lead to unbalanced channels.

The first user of QUIRK_FLAG_MIXER_GET_CUR_OK is Logitech PRO X
Wireless, whose Playback mixer's GET_CUR somehow becomes broken when the
microphone is detached, so set QUIRK_FLAG_MIXER_GET_CUR_OK to prevent
the mixer behavior from depending on whether the microphone is attached.
The device also needs QUIRK_FLAG_MIXER_PLAYBACK_MIN_MUTE as the minimum
mixer value doesn't work properly.

Reported-by: Alexander Niemeyer <adventureFAN@gmx.de>
Closes: https://msgid.link/6262cbbd-d1f2-4c9d-a1c7-9c5d12636f4b@gmx.de
Closes: https://msgid.link/7984832b-86f6-4934-bfc0-1ed70218973a@gmx.de
Signed-off-by: Rong Zhang <i@rong.moe>
---
Rong Zhang (4):
      ALSA: doc: usb-audio: Add doc for QUIRK_FLAG_ALWAYS_SET_RATE
      ALSA: usb-audio: Demote the severity of sticky GET_CUR
      ALSA: usb-audio: Reverse MIXER_GET_CUR_BROKEN as MIXER_GET_CUR_OK
      ALSA: usb-audio: Add quirk flags for Logitech PRO X Wireless

 Documentation/sound/alsa-configuration.rst | 25 ++++-----
 sound/usb/mixer.c                          | 82 ++++++++++--------------------
 sound/usb/quirks.c                         | 19 +++----
 sound/usb/usbaudio.h                       | 24 ++++-----
 4 files changed, 56 insertions(+), 94 deletions(-)
---
base-commit: 26260251022fbc2f248a3d747a9b2b961b18d2d8
change-id: bfb273cc-uac-demote-sticky-check-f92d4aaca7e6

Thanks,
Rong

