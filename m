Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4864D18C31
	for <linux-sound@vger.kernel.org>; Sun, 29 Dec 2024 22:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.16.231.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735512166; cv=none; b=iJt3Dg4e20hZEaRDWg/1m8B7OHmgLOWNYou8V973CbJdj+c6bmEUTU8rRVd1w5pwAHKz2lwgBlpXR2HijcfXVSSkwPxWSje9Lw4rZLPg5pqZl1am3l5+rMd3nSF1jLrzgtFb6QTml4iF9Ct5F54h1YSn/1VQL2nUj2mvl+Vb2MI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735512166; c=relaxed/simple;
	bh=QCIDK67nb95aAMaxh00pQPrcISdKEfCnTAINq5jH9KA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oI3BrRmFKGzgqjB7YWXn7YC1cnCvLBdVDS0kVEvzmr4u4vVtv5Ow4vydIQfknfoG0bU/3ZOz9nAjjoBSj8wf5TZztdfkJOhXAK5TjKMTWunEQ3NY4Pl1f2/VMe+4Q6cjSA6twrZApmw6FdgDsL4lIFSeI7n4TjQRQF1wOMsjJq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu; spf=pass smtp.mailfrom=b4.vu; dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b=LlCduyT8; arc=none smtp.client-ip=203.16.231.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b4.vu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b="LlCduyT8"
Received: by m.b4.vu (Postfix, from userid 1000)
	id 722C76474951; Mon, 30 Dec 2024 09:12:33 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu 722C76474951
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1735512153; bh=F00jH3d0rI1XyAOvpM5747AZCqxDkad34euItH9GG14=;
	h=Date:From:To:Cc:Subject:From;
	b=LlCduyT8KCzQKclYWdNsS5KnCm3EYTqbZV6gwo+KfC81GKEzY9pWzeK+oLt/RjEDh
	 DOxUj76ZCqboRwKsfM/n7CUIwGpOd0B/0LK9d5u8qdD08ACyKI4DU5ogUJlkvkJ+A0
	 MgmpkZooT/FzGGg1JMsDoM8pyXQfPWBZKnvyDaSXGaZRPI985SLKJTGhKZbB/vzSoY
	 cirqGy6kmfrKzD7qRgerdw9OK0J5RvwtQKxMLCGP9YtTcDLymlvRP75v+rrDbDUHNc
	 i8reFKWXiCKfr4QHbHXDFzvddrBvwSePj47f2GzVD1+HAtBqIAtgIifx60ZSrZSNrO
	 YaDWJp5ZfJxiQ==
Date: Mon, 30 Dec 2024 09:12:33 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
Subject: [RFC PATCH v2 0/2] ALSA: Add driver for big Scarlett 4th Gen
 interfaces
Message-ID: <cover.1735495639.git.g@b4.vu>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Takashi,

Thanks for your feedback on the first version. Appreciate your
comments. I implemented fixes for almost all; I've got a couple of
questions, and I found one thing to fix.

> > +/* Do FCP step 0 */
> > +struct fcp_step0 {
> > +	void     *data;
> > +	uint16_t  size;
> > +};
> > +#define FCP_IOCTL_INIT _IOWR('S', 0x64, struct fcp_step0)
> 
> An ioctl with a pointer has to be handled carefully because you must
> convert it for 32bit compat code.  IOW, it's better to be avoided if
> possible.

For v2, I have changed the structs to have fixed-size data arrays
instead of a pointer, e.g.:

 /* Do FCP step 0 */
 struct fcp_step0 {
-       void     *data;
-       uint16_t  size;
+       uint16_t size;
+       uint8_t  data[FCP_MAX_DATA_SIZE];
 };

However, this approach makes struct fcp_cmd over 2KB which seems
excessive/a lot of copying for each ioctl call?

https://www.kernel.org/doc/html/v6.12/driver-api/ioctl.html suggests:

> 32-bit compat mode
> [...]
> As long as all the rules for data structures are followed, this is
> as easy as setting the .compat_ioctl pointer to a helper function
> such as compat_ptr_ioctl() or blkdev_compat_ptr_ioctl().
> [...]
> Pointers have the same problem, in addition to requiring the use of
> compat_ptr(). The best workaround is to use __u64 in place of
> pointers, which requires a cast to uintptr_t in user space, and the
> use of u64_to_user_ptr() in the kernel to convert it back into a
> user pointer.

Between these two options (fixed arrays vs u64_to_user_ptr), which
would you recommend? Or is there a third approach you had in mind?

> [...other comments noted and addressed...]

> Last but not least, any need for suspend/resume and disconnect
> handling?

I have tested on a laptop, playing audio, getting meter data 20x per
second:

1. suspend then resume
2. suspend, unplug, replug, resume
3. suspend, unplug, power off interface, power on interface, replug,
   resume

Results from testing:
- Cases 1 and 2: Driver remained connected and functioned correctly
- Case 3: Driver remained connected (to my surprise) but the sequence
  numbers were out of sync; I will work on a fix for that.

For disconnect handling, I've disconnected the device (software reset,
USB disconnect, and power off) during testing countless times, and
have not seen any issues. Is there something in particular I should
be looking for?

Thanks again for your feedback.

Regards,
Geoffrey.

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

---
Geoffrey D. Bennett (2):
  ALSA: FCP: Add Focusrite Control Protocol driver
  ALSA: scarlett2: Add device_setup option to use FCP driver

 MAINTAINERS                 |  10 +-
 include/uapi/sound/fcp.h    |  65 +++
 sound/usb/Makefile          |   1 +
 sound/usb/fcp.c             | 837 ++++++++++++++++++++++++++++++++++++
 sound/usb/fcp.h             |   7 +
 sound/usb/mixer_quirks.c    |   7 +
 sound/usb/mixer_scarlett2.c |   8 +
 7 files changed, 931 insertions(+), 4 deletions(-)
 create mode 100644 include/uapi/sound/fcp.h
 create mode 100644 sound/usb/fcp.c
 create mode 100644 sound/usb/fcp.h

-- 
2.45.0

