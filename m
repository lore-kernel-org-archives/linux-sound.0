Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9861B1C5F0B
	for <linux-sound@vger.kernel.org>; Mon, 13 Jan 2025 19:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.16.231.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736797275; cv=none; b=DlX4iGxaBGaJ7Z0/V2GLbWn6WCVgDdNp+X/vFRjBbD25Q2A+bdAd20NSv/VUs3Wt240MzrgXL5hnXVAy5H3q+/8y7d7Bb673FUXFMVB+YMf1azYFL2Fw0562nB50toAtIixWT7Gfx+w4gtYTL01QfyKmOaXSt4ar/sD0r2RqhNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736797275; c=relaxed/simple;
	bh=/+4BBVVD39uFvt22i+hGwqZts1rVWxpBQo6Wx7QlmjU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bLwr6evAp2N0BCPa4YCyQqguOOOBu8RhEEcnxVXq0roRtEX7pjjEhlO1ZXaaXdS0qpEkl/cEL3BtSeIbc1w0zlamc0m0lyca1xJrC/OMNFGsRKoGMjsb65v7EfjpX182U9Wp+AGebWxXHvOMUlkCOu5JOHnBTDBgzeL37/pcVV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu; spf=pass smtp.mailfrom=b4.vu; dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b=swI9SsR/; arc=none smtp.client-ip=203.16.231.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b4.vu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b="swI9SsR/"
Received: by m.b4.vu (Postfix, from userid 1000)
	id 09E1A649F390; Tue, 14 Jan 2025 06:11:03 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu 09E1A649F390
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1736797263; bh=tAb0Go4GfC1PrHRp4xlQvZtswE80wcTz1uMzdK04fmc=;
	h=Date:From:To:Cc:Subject:From;
	b=swI9SsR/Yon/g7tqkZIYDZQps48rSINPmUFsj6KCwNVBRBrdq7+kmvJqzI8HLi61V
	 BttZHIJQpkZeAq5aiO6mz8ZcI2VfteHNktBX8VGEYuKdUgf9A/Cf9NpWKpsC0jRu9Z
	 Vk2zta90HvAmCzA51cNKiAaNdQRfOKz/GDTZC1/Z13LbLZM42PsmueDn3KpxKonYqy
	 OKBbSjeqn7GdAQu7u76cBE5abiHGq8FYhzwkvuvdw4/KnbGZwIhXJ+wkDFiI5Iin0D
	 xoRXqJ/PRafgOnC6k6aVJERG5C90jCbPBWLfF3HjaPbG/tDkWeJXEsZzgLlD+Da2Yv
	 6fZouUKw/nzhQ==
Date: Tue, 14 Jan 2025 06:11:02 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>, Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
Subject: [PATCH v6 0/2] ALSA: Add driver for big Scarlett 4th Gen interfaces
Message-ID: <cover.1736792486.git.g@b4.vu>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Takashi and Jaroslav,

Thank you both for your reviews. I have addressed all of your comments
below:

On Mon, Jan 13, 2025 at 06:02:58PM +0100, Takashi Iwai wrote:
> This happens only after the suspend, and this is for automatic
> re-initialization, right?

Correct.

> It's a bit scary that such a low-level function itself does
> re-initialization, as fcp_init() will call this function again.
> That said, it's more straightforward if the re-initialization is
> checked and done in the upper level.  (And here check only mixer->urb
> and return error (or spew WARN_ON()).

Fixed.

> Hmm, this special is a special use of TLV in non-standard way, which
> needs definitely documentation.  The use is no longer TLV, just some
> raw read/write of a bulk data for the kcontrol , after all.
>-
> Also, I couldn't figure out what exactly this "meter_labels" stuff
> serves for.  It's not referred from anywhere else than TLV read?

The user-space driver stores meter labels in the Level Meter control's
TLV data so users can determine what each channel of the control
corresponds to.

As the kernel doesn't need to interpret what's stored there, I've
renamed it from meter_labels to the more generic "meter_metadata" in
case future uses are discovered.

> > [...] fcp_ioctl_cmd() [...]
> You can avoid unneeded multiple cast.

Fixed.

On Mon, Jan 13, 2025 at 06:14:03PM +0100, Jaroslav Kysela wrote:
> The data format _must_ be in TLV encapsulation also for such R/W operations.

The user-space driver stores the data in the correct type-length-data
format (with the length a multiple of sizeof(unsigned int)). This is
similar to how sound/control.c read_user_tlv() and replace_user_tlv()
operate.

> So, a new type should be defined. Perhaps, we can define a driver specific
> data type, because the meter levels (and the whole extensions) seem as
> device specific.

Are you thinking like this?

diff --git a/include/uapi/sound/tlv.h b/include/uapi/sound/tlv.h
index b99a2414b53d..965c64796b6a 100644
--- a/include/uapi/sound/tlv.h
+++ b/include/uapi/sound/tlv.h
@@ -18,6 +18,8 @@
 #define SNDRV_CTL_TLVT_CHMAP_VAR       0x102   /* channels freely swappable */
 #define SNDRV_CTL_TLVT_CHMAP_PAIRED    0x103   /* pair-wise swappable */

+#define SNDRV_CTL_TLVT_FCP_METER_METADATA 0x110 /* FCP driver meter metadata */
+
[...]

I was thinking it wouldn't be needed as the kernel doesn't need to
interpret the data I'm storing, and user-created ALSA controls (which
this is very similar to) are free to store whatever they like in the
TLV data anyway?

Thanks again,
Geoffrey.

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
 include/uapi/sound/fcp.h    |  107 ++++
 sound/usb/Makefile          |    1 +
 sound/usb/fcp.c             | 1075 +++++++++++++++++++++++++++++++++++
 sound/usb/fcp.h             |    7 +
 sound/usb/mixer_quirks.c    |    7 +
 sound/usb/mixer_scarlett2.c |    8 +
 7 files changed, 1211 insertions(+), 4 deletions(-)
 create mode 100644 include/uapi/sound/fcp.h
 create mode 100644 sound/usb/fcp.c
 create mode 100644 sound/usb/fcp.h

-- 
2.45.0

