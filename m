Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 309B32D47F4;
	Sun, 31 May 2026 15:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780242343; cv=pass; b=AfIvFZH+45dXZ0ydMngDzsI379Cg0YqTiHKPfFYtvKzvI0CQ9EwNQ532XEEzOfoGbzL8VAGSo9b5i/qjcUf/YXsaMxHMrY4x02Sho5vqbR5NWQ/F3YYlZCgzsLSI67ymmkiMIWs+/+ipW31lY1ptQ85S7l9byXzUID0WndaOTro=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780242343; c=relaxed/simple;
	bh=v4chQ4bWEewhL90AyUxuFpAo6fLrTGIqTR3j1iLEUDQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=I270Ihlye3/V5oo84PQKw3RI+1NReRO8HMWhaz1vwhXApZVNff7FYitJ4w9MksyIgPnddfyxtVbv92ToklmplPIY7pAiD0AyDb4qpvYDBXxwG45YO2F4T29HxAfqlyTBPSPiZfW9FR76aqEC/IbGLjN/BeCsYa/2g0fWHHc0T7U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=eg9l+LwS; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="eg9l+LwS"
ARC-Seal: i=1; a=rsa-sha256; t=1780242332; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=b1I37pOKEufEZfby4OSFGC1pTs7G1L1PkeN1TtVAfNo0xDG4tJJWiWX94iCc5KvbdMRXeAFtDTtIxhW9MGAjEU/h/Q8QCdNr0Bnf3H+8d6CHwoCN5TyF3LY8F8Pbqt5+ASD7W6vGNBqszj776bsj1rvI//jhSRlwzx6UPk8B5XQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1780242332; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=pX4W4JGyLgklqKK2lQR95N1oDlOWxJGpc1GvmKSm59s=; 
	b=g9LMpE60PFzFWA+VDbqVniyoL5gcJDQXzikuot9yivNto9AOcxBdO48U4PBUjJ/J8+yana4MOwv/DnxdNzf84KkyDIY+U6yzZBqUuwF4N15D3rrko8QcoK+WZUO2xRfbbSzRs48gA6vbWUZifsvueu/zT2a0s9VcCK1b7pK6WwE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1780242332;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=pX4W4JGyLgklqKK2lQR95N1oDlOWxJGpc1GvmKSm59s=;
	b=eg9l+LwSExpk8d9PUl3Xmt409cXVRdtfPuNlvmXhACgFKi0Cj7BucU+pRYV4h94C
	iv5XZ4vVQJcN5XeqEhpgfrhzzGxJZfeismNAcJzn93PJqOzyVqcPAGHlhEnmBZMVNCK
	wTDPbUAcdlnfRw18uv+K4spX18rhThuu+PWaFJnaaOoP1Zp7MnwEllVJJjSDt2y1JS0
	HEtThDJAaZKE3WkSdIDQ/JR7TGstclEuLPhCCPEKlOCpGTplLmHDhBfyO4Zoh48ctn2
	6Ht485DyOGFD6ZKUxrxtR9PN70+REdhORlXNieuOMbPsBaDYo5ZeEyx8WC83jtdBFU/
	gNg6PiMJKw==
Received: by mx.zohomail.com with SMTPS id 1780242330573531.9447806516519;
	Sun, 31 May 2026 08:45:30 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Subject: [PATCH v4 0/3] ALSA: usb-audio: Add
 QUIRK_FLAG_MIXER_GET_CUR_BROKEN
Date: Sun, 31 May 2026 23:45:19 +0800
Message-Id: <20260531-uac-quirk-get-cur-vol-v4-0-ede643dca151@rong.moe>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAI9XHGoC/4XNyw6CMBQE0F8hXXtNe8ujuPI/jAsoV6gPqi00G
 sO/W3RDTIzLSWbOPJknZ8izTfJkjoLxxvYxpKuE6a7qWwLTxMyQY84zLGCsNNxG407Q0gB6dBD
 sGRpeY4laUlHmLG6vjg7m/nZ3+0/2Y30kPczY3OiMH6x7vI+DmHv/PoIADlTKHOtCIGW0dbZv1
 xdLbL4IuETULwQjotJGanVIlcj4FyKXSPkLkRGpG5K5FErpKl0g0zS9ANLFZXNVAQAA
X-Change-ID: 20260527-uac-quirk-get-cur-vol-d0b292c3e796
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: Takashi Iwai <tiwai@suse.de>, Steve Smith <tarkasteve@gmail.com>, 
 linux-sound@vger.kernel.org, linux-doc@vger.kernel.org, 
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

An info message prompting users to check MIXER_GET_CUR_BROKEN for
potential sticky mixers is also added, so that users can learn how to do
some experiments to determine what's going on. If the mixer surprisingly
turns out to be non-sticky, they can submit a patch for a new quirk
table entry.

The Sennheiser MOMENTUM 3 and Edifier MF200 need the quirk flag. Though
their UAC mixers respond to SET_CUR by tuning the volume, the
corresponding GET_CUR methods are somehow stubbed and return constant
values, resulting in them being disabled by the sticky check.

Signed-off-by: Rong Zhang <i@rong.moe>
---
Changes in v4:
- Rebase since a patch improving the error path of the sticky check has
  been applied earlier
  - https://patch.msgid.link/20260531-uac-sticky-error-path-v1-1-12c2329d17ef@rong.moe
- Integrate a follow-up series into this one
  - https://patch.msgid.link/20260531-uac-edifier-mf200-v1-0-be69657c3f87@rong.moe
- Link to v3: https://patch.msgid.link/20260529-uac-quirk-get-cur-vol-v3-0-bde363188ca4@rong.moe

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
Rong Zhang (3):
      ALSA: usb-audio: Add QUIRK_FLAG_MIXER_GET_CUR_BROKEN
      ALSA: usb-audio: Add quirk flag for Sennheiser MOMENTUM 3
      ALSA: usb-audio: Add quirk flag for Edifier MF200

 Documentation/sound/alsa-configuration.rst | 12 ++++++
 sound/usb/mixer.c                          | 60 +++++++++++++++++++++++++-----
 sound/usb/mixer.h                          |  1 +
 sound/usb/quirks.c                         |  5 +++
 sound/usb/usbaudio.h                       | 13 +++++++
 5 files changed, 81 insertions(+), 10 deletions(-)
---
base-commit: f52b1b0506c6a209c10a741d031944d1ed19548c
change-id: 20260527-uac-quirk-get-cur-vol-d0b292c3e796

Thanks,
Rong

