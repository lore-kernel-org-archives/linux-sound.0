Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED4BD1DDEA
	for <linux-sound@vger.kernel.org>; Sat,  4 Jan 2025 17:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.16.231.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736010692; cv=none; b=Kk3mPbV5wp2VquaEHl2+whYi8q1lpzpmNhBsgDlNzmuzEXkIjsuCg/1WKhXypAbmTATy8e3uuL7UjOlqTvzWgWOn0LkTPZgKRehLfIJIf2v3AoWR7SLHMizj7cNJB2fPPgoCb0A9Tu3JBE4W6SL96DY0QmnaP0EbFE7Kuahyrv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736010692; c=relaxed/simple;
	bh=9EIkKpA1LTsfk558iohA/nrcgqTbHhPPbCeEQ2bI/o0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fjWzLyHfY3QLzcmuEiv+miTb+xjyoKk6N97CDocbiAaNnRp2MH9h97RE1j/5sHZtq9RIBmUNgiwvUhJuPs5Wj4HHshtIvtISJ7ionq7LORS9fglqlGdHODqVWqgjsyoG06lNE8q2Gso1O9aCrymFKFS8lTj5OxBvyR7Oi6sRv50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu; spf=pass smtp.mailfrom=b4.vu; dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b=cK4Ow7he; arc=none smtp.client-ip=203.16.231.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b4.vu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b="cK4Ow7he"
Received: by m.b4.vu (Postfix, from userid 1000)
	id 5F90B649815C; Sun,  5 Jan 2025 03:41:17 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu 5F90B649815C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1736010677; bh=zGG4OZxVGZOdGRtL1I1ktRa5xN+hncfQ7zd70ZaUeBo=;
	h=Date:From:To:Cc:Subject:From;
	b=cK4Ow7heHqozKjxTrX2kZrKLMsf6y9SBl62cw/o+VM+U2OpPtf27Drn6VUVa9Kv0S
	 za+hV4/Ia/DMY5hrK9UeEfOCjxLDy3VWRWgoDQDNbmA8L+ZkgPo+q+SajcoTYH/WWA
	 XZXasim99E7ax3cs7kSz8mFz6VMUWyHzZzql32o+AOD4HtO6MV2MJOEm9+ttZa1C4S
	 IRf0sfTcLQ2C2dVSc2fak9UxRZv1UKxu1ywq3leu1N0bwaOUAJVPJiubNbZs9WUV1T
	 uluyX1YYINFvUnaF09l5AL5GwTBqbGo4iH3OrioXpPUCygpO0rQYcdC2Cq2PJ7VzlQ
	 uFh44FfftDMKA==
Date: Sun, 5 Jan 2025 03:41:17 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
Subject: [PATCH v4 0/2] ALSA: Add driver for big Scarlett 4th Gen interfaces
Message-ID: <cover.1736007881.git.g@b4.vu>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Takashi,

Thanks again for your feedback. Requested changes made.

> Now, considering this implementation again, a fundamental question is
> whether we really should go to this direction or not.
> 
> Usually the driver implements an ioctl per certain limited task
> (except for some debugging purpose).  But we open all doors fully.
> This gives the most flexibility, of course.  OTOH, it has a
> significant risk that every program may screw up your device easily by
> sending some malicious ioctls.

That is a good point. To eliminate that risk and prevent malicious use
entirely, I added a requirement in v4 of having CAP_SYS_RAWIO to use
the hwdep interface. In addition, I have added validation of the flash
commands to prevent the App_Gold flash segment from being accidentally
erased or written to (this segment contains the backup firmware used
when the App_Upgrade segment does not contain a valid firmware image).
I think this way we can have both flexibility and safety.

Regards,
Geoffrey.

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
 include/uapi/sound/fcp.h    |   71 +++
 sound/usb/Makefile          |    1 +
 sound/usb/fcp.c             | 1018 +++++++++++++++++++++++++++++++++++
 sound/usb/fcp.h             |    7 +
 sound/usb/mixer_quirks.c    |    7 +
 sound/usb/mixer_scarlett2.c |    8 +
 7 files changed, 1118 insertions(+), 4 deletions(-)
 create mode 100644 include/uapi/sound/fcp.h
 create mode 100644 sound/usb/fcp.c
 create mode 100644 sound/usb/fcp.h

-- 
2.45.0

