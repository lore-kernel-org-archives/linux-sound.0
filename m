Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF3CA1F16B
	for <linux-sound@vger.kernel.org>; Thu,  2 Jan 2025 22:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.16.231.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735857500; cv=none; b=MXuxmxdkyNj8Dsb3pLLUeczhuRc9BgZWQW3foLLC7uPfJK124ynYAuWnYR1AAwPry0PEbfmxrtqNggIgd2qd27WphS1OSRjYrSaGgZ0CoATaCxUKD2qvAieNl/qzOTT5qlTiGKgKSLzwRnaJvIWnEEIimAMFmjT9Yrm8C2tUBgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735857500; c=relaxed/simple;
	bh=W+Of2hcepTkjbKYZ4jRE2bxUPVCwu4pRdSEuqCzwscw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ilmV9wMgCs92b6cfkfFQRzLuSk36POBCPLDgoLiQO2CBghvF0VirdusO1dZUH2mu2nbNhELv3gzho5G6lw/xMAeqPIzTtxcZSRHogDKjYTHbp/sT/u0pZSf8oP8bano0/ndWVfiO8VxaD/vzuuB51rS2uP17Mr6oMbXgWBdn0Ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu; spf=pass smtp.mailfrom=b4.vu; dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b=UGZjcdve; arc=none smtp.client-ip=203.16.231.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b4.vu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b="UGZjcdve"
Received: by m.b4.vu (Postfix, from userid 1000)
	id E727C646FC16; Fri,  3 Jan 2025 09:08:07 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu E727C646FC16
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1735857487; bh=jEwuSQw+z4Ot5pxW29LmVRYNoPH5tj0nIhOJSUbOWQw=;
	h=Date:From:To:Cc:Subject:From;
	b=UGZjcdvexPBTPEWOw6tyFqyECXnV1UZidsxZYneGkTQENutk2XEMgJ0PIwS4tFhiM
	 gX/RF+aioevfjYgdqitUK9JRxzDfb3uNrv95Hxv0KyXxcYvQdWJ7/cXN9o/5m+hnrY
	 3waB17R8lAKp0L7tEt9zL/YKzblKv0uaABX9v5F8VskWLBBCzMS2vYWjlma3WdaUTY
	 VWqqfe8nETF0gaf1cUf+9nZi4clvC3GX+w8ljJDa7yPjRygDHn4lAShgEBIgCBG+y4
	 Px0syOFrTFS1OM2ejJDC7cr2wQLyGeqk6LW4IFOUSpebu8pGL8uoauafg0KrFcNyjx
	 nhT35LjLVaB/A==
Date: Fri, 3 Jan 2025 09:08:07 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
Subject: [PATCH v3 0/2] ALSA: Add driver for big Scarlett 4th Gen interfaces
Message-ID: <cover.1735855597.git.g@b4.vu>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Takashi,

Static buffers in the ioctl structs didn't seem to be the right way to
go, so I followed the instructions in
Documentation/drivers-api/ioctl.rst and the ioctls now work with
32-bit userspace on 64-bit kernels.

I added suspend/resume handling and all the suspend/resume cases that
I tried now work too.

Regards,
Geoffrey.

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

 MAINTAINERS                 |  10 +-
 include/uapi/sound/fcp.h    |  71 +++
 sound/usb/Makefile          |   1 +
 sound/usb/fcp.c             | 979 ++++++++++++++++++++++++++++++++++++
 sound/usb/fcp.h             |   7 +
 sound/usb/mixer_quirks.c    |   7 +
 sound/usb/mixer_scarlett2.c |   8 +
 7 files changed, 1079 insertions(+), 4 deletions(-)
 create mode 100644 include/uapi/sound/fcp.h
 create mode 100644 sound/usb/fcp.c
 create mode 100644 sound/usb/fcp.h

-- 
2.45.0

