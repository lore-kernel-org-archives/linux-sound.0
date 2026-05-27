Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0A6A3290A0;
	Wed, 27 May 2026 18:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779908232; cv=pass; b=Xs7DjEwD5WhBd4YlnDX0HA4SHCUqWf+180WTLLufxP+uF634Id9HiYv/teXnmCMRfVRVoi9VLasnsggv/PYcEodp1cOYMyFoDHlwyM40Zfw5s81G790M8C83bg2X7oVSrS0bukVN7ezOY73WkfOIN9Y71B8nndIDU1Xs3rjYjoU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779908232; c=relaxed/simple;
	bh=kWBM4OX/Wwe0KACWWVvbk4dA81c5BLTTs5UZfdQiM8I=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=KiRJhz1o57yzpb49atUjiuAE+X+XtMq8A7qqXSrhoyixSZpmbz4BKjCQq9lD/WlhIOea9JgAnveEzMjqDPujeWDt2sV25UrFXWVu0upRIHyzy1YJymix2bk3SBTGC5MsPbJSUY/PTzXkLpFnPXrgtB8l+cYC9/ohb+40iW5Ogtc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=gXe3Cc2K; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="gXe3Cc2K"
ARC-Seal: i=1; a=rsa-sha256; t=1779908224; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=PT7wT2hJ10fXgQkfoLr3T6mx46XLrrvcc2FebWL2dlkMiPOjWMIf5DfzfFGKhHJdQuScVgX81ZbBS+Vk3aqa7JqQ83hsaOpJVZuVMr5yOiM8y942fDA1fd9SdzUf32e11NNScSEbwMA3tWUng2A4ht5Z1I1aZ1UwDZCNvSznQzM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1779908224; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=51aPK0a/s3+COkJJ4jOk3HeogNRfFppGJCUjkIlL3b4=; 
	b=NqqA7kTu4PwKDsqYx3W3cA+wivJSCM5JvX/m4JywjVUcK1WoQHXxduAR243fbHCqe/NF+Dax2hPJv7Iq3r+VMPG/rlbIyFh9NufP2K5byxkXrlAvg1litEogU0jbzLp+cJr8WVdXxreKO4tTQ3oBDfZdTy2FdAVmduo6c8bitZI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1779908224;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=51aPK0a/s3+COkJJ4jOk3HeogNRfFppGJCUjkIlL3b4=;
	b=gXe3Cc2KH8QRxCUpx/OVPul4JtibAbdTY1MQEmujuG1vcoIxad39lQ/4bj7tc47Y
	6o4RF7l8hOiJpWGC/BfeIDeGr753hHA1h9sLbTBV+eCsmTkPp1aVR6uNaxayLNp44g9
	iCRYeQ0UdAgdQW27vU9ucvVvYTACNLtM+WAP3y3aOYVg+hiIvyvADB2esDAIFLjSbuU
	TQxNY9U4xIszZGZoBpoXEHPxMmYyma0pXm5et6BfJWJ+pBoj3z197xXLgi+A/gE78lC
	jl/Ggd21Wop3yxXSAFQYOx2kesX4vM5zYYC636u0tfTpxP8z0kEXT/hc/Dq+WGV9AcY
	FXTuB8ox8g==
Received: by mx.zohomail.com with SMTPS id 1779908222700158.67998164125754;
	Wed, 27 May 2026 11:57:02 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Subject: [PATCH v2 0/2] ALSA: usb-audio: Add
 QUIRK_FLAG_MIXER_GET_CUR_BROKEN for Sennheiser MOMENTUM 3
Date: Thu, 28 May 2026 02:56:26 +0800
Message-Id: <20260528-uac-quirk-get-cur-vol-v2-0-84d3c8f48150@rong.moe>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFo+F2oC/4WNSw6CQBAFr2J6bZuhCRBceQ/DAoYW2g+jPcxEQ
 7i7gAdwWUm9ehN4VmEPx90EylG8uGEB2u/A9vXQMUq7MJCh3GRUYKgtvoLoDTse0QbF6O7YmoZ
 KsikXZQ7L9ql8kffWPVc/9qG5sh3X2Gr04kenn+04Jqv37yMmaJDLNKemSIgzPqkbusPDMVTzP
 H8Bq055LMsAAAA=
X-Change-ID: 20260527-uac-quirk-get-cur-vol-d0b292c3e796
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: Rong Zhang <i@rong.moe>, linux-sound@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
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

To: Jaroslav Kysela <perex@perex.cz>
To: Takashi Iwai <tiwai@suse.com>
To: Jonathan Corbet <corbet@lwn.net>
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-sound@vger.kernel.org
Cc: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Rong Zhang (2):
      ALSA: usb-audio: Add QUIRK_FLAG_MIXER_GET_CUR_BROKEN
      ALSA: usb-audio: Add quirk flag for Sennheiser MOMENTUM 3

 Documentation/sound/alsa-configuration.rst | 12 ++++++++++++
 sound/usb/mixer.c                          | 17 +++++++++++++++--
 sound/usb/mixer.h                          |  1 +
 sound/usb/quirks.c                         |  3 +++
 sound/usb/usbaudio.h                       | 13 +++++++++++++
 5 files changed, 44 insertions(+), 2 deletions(-)
---
base-commit: 72d8bf668954678bfae8f7296b4b1c01990bcdc2
change-id: 20260527-uac-quirk-get-cur-vol-d0b292c3e796

Thanks,
Rong

