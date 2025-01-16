Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F41B915666B
	for <linux-sound@vger.kernel.org>; Thu, 16 Jan 2025 17:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.16.231.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737049633; cv=none; b=RoVaodkPS5S+yfg/6ypTiGSSffJbbS7juXuS9ZISAghdGE2lpWB4csTue465BsqgeAN97w2YVWxkEQ0tV4ut6Twikkg51f0ev7Rf01rC/et/LYSB1Puau/4l1Q52FobNjxgZdyXVX3MPubPGBQA3XjGSuENMortumn0S/Isfe4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737049633; c=relaxed/simple;
	bh=ClLe8WUBFSokU8DWM5ldq69tVDrRAFWMV2ncro2/cOY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Zl+fFuEAyNogJ3qQrPaeF6lAjyas+TV2rdIvnnl25eszrJgI/Ai49zR2p50mF6MJQDZpdxzWBGXtZHbW/eRzn0rtqmHaBDj8XmCc5XjVCVkhN/KGw1mVGgk8ns49JJYBt/8QqWHhyOms10l7mwEKHhwXa3BdJRGSBEXsJyqZUNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu; spf=pass smtp.mailfrom=b4.vu; dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b=YW3Lgs4N; arc=none smtp.client-ip=203.16.231.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b4.vu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b="YW3Lgs4N"
Received: by m.b4.vu (Postfix, from userid 1000)
	id D925D64A5806; Fri, 17 Jan 2025 04:17:07 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu D925D64A5806
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1737049627; bh=DIEdA6/2VH3AYRhNi+nUrn4oNaQiqHgIlza62isR0EE=;
	h=Date:From:To:Cc:Subject:From;
	b=YW3Lgs4NNrfQlepWUirI75RahLE9mJLuW1HSSFSeH0KBs4SIvRV8ip36zuZ39V1qC
	 45sipD4iKvjzhvPPkyyHSgagZi4dLqF1l6jgLtFN91ldxaJEcgJGJfw9QgE6aKwLD2
	 aE0K8CzKBv2eOokgdvd2DAtigwuxj2Sr0zVdJULn2k5mcZvT+/+L77sZ5jjZl2kfNG
	 5xE0EBKJjt/l29ujDTr8s+lTaP4Nbp8l9UimieAd+il1j4kOmJ+7ia1ruDYBIgKPo5
	 h95tTChaMLBIbVlBjoQzFVfh6iZenZL6+gyYJuT45UbrW9Tumw8aya4XrZhXjWguqO
	 P5f3ymJMGHiQA==
Date: Fri, 17 Jan 2025 04:17:07 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>, Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
Subject: [PATCH v8 0/2] ALSA: Add driver for big Scarlett 4th Gen interfaces
Message-ID: <cover.1737048528.git.g@b4.vu>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Takashi,

Thanks again! All changes from your feedback on v7 incorporated in v8.

Regards,
Geoffrey.

---
Changes in v8:
- Rename SNDRV_CTL_TLVT_LABELS to SNDRV_CTL_TLVT_FCP_CHANNEL_LABELS
- Make meter levels buffer persistent rather than allocate/free each
  time
- Add data protection to fcp_meter_tlv_callback()
- Set private->step* and co after allocation of the buffer
- Use ALIGN() rather than open-coding it

---
Changes in v7:
- Add #define SNDRV_CTL_TLVT_LABELS for channel labels
- Add ioctl for setting meter labels and remove TLV write support
- Simplify reinit handling
- Remove more unnecessary casts
- Add #define FCP_SEGMENT_APP_GOLD to remove hardcoded value

---
Changes in v6:
- Move re-initialisation out of fcp_usb() so it's clear there's no
  infinite recursion
- Update theory of operation and clarify the use of meter TLV metadata
- Rename meter_labels to meter_metadata for clarity
- Remove unnecessary casts in fcp_ioctl_cmd()

---
Changes in v5:
- Remove version/union complexity from init ioctl
- Add documentation to clarify ioctl usage and big picture

---
Changes in v4:
- Use variable-length data arrays in ioctl structs instead of pointers
- Add CAP_SYS_RAWIO requirement to hwdep interface
- Add validation of flash commands to prevent accidental bricking due
  to erasing/writing the App_Gold segment
- Refactor URB cleanup

---
Changes in v3:
- Update ioctl structs and add ioctl_compat op to work with 32-bit
  userspace on 64-bit kernels
- Update driver to do all init steps so it can re-init after
  suspend/resume
- Add version field to init ioctl for future compatibility
- Improve error messages when unexpected response data is received

---
Changes in v2 as per Takashi's feedback:
- Use fixed-size data arrays instead of pointers in ioctl structs
- Define notify struct outside of struct fcp_dev
- Use u8/u16 types without __ prefix
- Use cleanup.h for code simplification
- Add init flag to ensure FCP_IOCTL_INIT is called before
  FCP_IOCTL_CMD and FCP_IOCTL_SET_METER_MAP
- Do not destroy/recreate the meter control (the number of channels is
  now fixed when it is created)

Geoffrey D. Bennett (2):
  ALSA: FCP: Add Focusrite Control Protocol driver
  ALSA: scarlett2: Add device_setup option to use FCP driver

 MAINTAINERS                 |   10 +-
 include/uapi/sound/fcp.h    |  120 ++++
 include/uapi/sound/tlv.h    |    2 +
 sound/usb/Makefile          |    1 +
 sound/usb/fcp.c             | 1134 +++++++++++++++++++++++++++++++++++
 sound/usb/fcp.h             |    7 +
 sound/usb/mixer_quirks.c    |    7 +
 sound/usb/mixer_scarlett2.c |    8 +
 8 files changed, 1285 insertions(+), 4 deletions(-)
 create mode 100644 include/uapi/sound/fcp.h
 create mode 100644 sound/usb/fcp.c
 create mode 100644 sound/usb/fcp.h

-- 
2.45.0

