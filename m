Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB131D8E12
	for <linux-sound@vger.kernel.org>; Thu, 16 Jan 2025 09:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.16.231.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737018178; cv=none; b=tk+NbJrj1JmjNHEAfkD3nSZ1mePLtZSV9ghoe5CwunR27a7YyMyu6JvuAEYJBC0Fe5rXcjHQmlpYwJNe6GzO7VVWrUc7kW+qCNUQBTyfy6CnDPjgYwzE3f/OS/6MjenlfuJRwiL7wcYcX8skE4vQHa05tBCRgT2BSkDCJ9tllGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737018178; c=relaxed/simple;
	bh=RYF1KlpB2XPNmv3TrHKcpco6AP491FQtknt/RRACsQQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RPvLS+X3nyMeRBAXDnyl6JnrVMa/c2kH+FMI3/nnnK2ukEK4QjUnpajw3SmMMd7xu6VNU6z/jIwqKxozsTkOlcoGaHFr1XsDneBzQXAQBYBeqSOE/z8oE/dKdmMuhEGa4HDmA1aQp9QjVzvlAs0xpeAWiqebpzSgkUsWPf3cNZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu; spf=pass smtp.mailfrom=b4.vu; dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b=mEOlhG9r; arc=none smtp.client-ip=203.16.231.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b4.vu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b="mEOlhG9r"
Received: by m.b4.vu (Postfix, from userid 1000)
	id 3027164A5801; Thu, 16 Jan 2025 19:32:46 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu 3027164A5801
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1737018166; bh=6PXthU+J2LtdsOqHC89Tx2DyiUS8W0voNu+938BKQrE=;
	h=Date:From:To:Cc:Subject:From;
	b=mEOlhG9rHiYQQH1ZRUdrqRsgLtX1NsBqnK4ZNju8gbM4GBFiFXfQBk/ytGBxz9Bv2
	 sW0AO7cxTgJspzg5x80mjXgMdh9w9tGXBraRNZOt0fWfdkkXAcRA5VRxf4QHw7hUOu
	 XxqKPmwjRgA9o/puyEVA+6RdSzxzEjEBnf2ltvrS8WRD86+FSLIvi1DHINCuVlA9D7
	 nA4GIAt7C8n38p/oMJayuc8p6r8dT/CAvmVk2PjISFhUXMZLR1L39IDRSQCEs5mXeG
	 7l8CGGdpIJdjzbtInh6vvhzuwrGKv6d1ay9nUdD1iBhmpqxOD3JVimDy9DazYq0YKs
	 LIk5p3UXQ+i6Q==
Date: Thu, 16 Jan 2025 19:32:46 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>, Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
Subject: [PATCH v7 0/2] ALSA: Add driver for big Scarlett 4th Gen interfaces
Message-ID: <cover.1737017960.git.g@b4.vu>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Takashi,

Thanks again for your feedback. You are right on all counts and I
believe that I have updated all as you suggested.

FYI, here's my thinking for this #define's name:

#define SNDRV_CTL_TLVT_LABELS		0x110	/* channel labels */

I started with the driver-specific and vague-purpose name
SNDRV_CTL_TLVT_FCP_METER_METADATA but reconsidered after your
suggestion to use an ioctl() to set it. With the ioctl()
FCP_IOCTL_SET_METER_LABELS, the TLV type should be specific ("labels"
not "metadata"), and I think it doesn't even need to be
driver-specific. There are presumably other cases where a control
element has many channels and it could be useful to have a TLV type to
use to name them.

Regards,
Geoffrey.

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
 sound/usb/fcp.c             | 1121 +++++++++++++++++++++++++++++++++++
 sound/usb/fcp.h             |    7 +
 sound/usb/mixer_quirks.c    |    7 +
 sound/usb/mixer_scarlett2.c |    8 +
 8 files changed, 1272 insertions(+), 4 deletions(-)
 create mode 100644 include/uapi/sound/fcp.h
 create mode 100644 sound/usb/fcp.c
 create mode 100644 sound/usb/fcp.h

-- 
2.45.0

