Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2121613B2A5
	for <linux-sound@vger.kernel.org>; Wed, 25 Dec 2024 21:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.16.231.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735162160; cv=none; b=L4Agh1bENDSd0hgbfvwRe8YmslB218U74DARb/WWyzueub6C4gCpVHyKlFB6uOKh2nzZW5Q5BLDzGVwl2o9LWBjdrEpQMLAOc7aAs8UdmgBduQr25/Rloe4jYBp0gla2K2jtir1fdJgSmSHNHM/Mp0lCMXISTXVRP+7HPmH4G70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735162160; c=relaxed/simple;
	bh=RXf5Z7A1XToQja4rzmI+6RB+KTefOBBoNdmM2F+JKN4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aJQIEGNQUN7I0U2XyXmak/MrM709PfGbi0/0v7shdAcE/RYjE1i7ReOhRpLY3mnDIFmZh1w8eMXJA+Sfybhk35gRf1hVbQbflA/hDWDcacXP1w7JMbQ/BoYG+E6g/2IixXHK+zPp3PZZWRht9UbVbIR15+HiBV8zBAyzHJTySTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu; spf=pass smtp.mailfrom=b4.vu; dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b=eWy/GPHJ; arc=none smtp.client-ip=203.16.231.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b4.vu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b="eWy/GPHJ"
Received: by m.b4.vu (Postfix, from userid 1000)
	id 4DA53643E76B; Thu, 26 Dec 2024 07:53:06 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu 4DA53643E76B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1735161786; bh=Ub+y8gADJUuGdmy1xpvJIg5GPd7bEGHJ3VDb7Y2T9CU=;
	h=Date:From:To:Cc:Subject:From;
	b=eWy/GPHJe/wie5c06gjwoQFn2vIgJ7Y8dJhNhKN/134uHQOjvQIUzQiSQugDzOTIw
	 Amh6zGLDqU/2XQNdz6Nhud0kpz1jNP0PSn9mA/c6BpOj+Ou0QmsfOGK90WdCx2pmfG
	 nZfOKAouHstzghu2ogbvphstRscF8Re/ptfL6gknpWJQVHwbN78M6uwksm1esSxy/V
	 Hav8xbze+uSaFZseDNHnuGLcdpkcn34Ga+TDeByrAXNH75hmeIVpyNlA2qCsXDxdfN
	 xR6foTcwIaLj1W96DYdP6/7oxjB28aCtz33EiEO4elVNDj6NIH63sQFSnpM4glhAo6
	 pE2TsyEz8Xxsw==
Date: Thu, 26 Dec 2024 07:53:06 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
Subject: [PATCH 0/2] ALSA: Add driver for big Scarlett 4th Gen interfaces
Message-ID: <cover.1735159288.git.g@b4.vu>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Takashi,

Merry Christmas!

This patch series introduces a new Focusrite Control Protocol (FCP)
driver that provides equivalent functionality to the existing
Scarlett2 driver, but splits the implementation between a minimal
kernel driver and a user-space component. My initial user-space
implementation supports the new Scarlett 4th Gen 16i16, 18i16, and
18i20 interfaces, but the new FCP kernel driver can be used with any
device supported by the Scarlett2 driver (as an opt-in).

With these new interfaces, I started out by trying to extend the
existing Scarlett2 driver but found that that wasn't practical. The
control locations (struct scarlett2_config offset field) have
previously varied between firmware versions (which is why I added the
"Minimum Firmware Version" requirement for previous 4th Gen and
Vocaster devices), and the situation was worse with the new 4th Gen
devices, with every new firmware version moving the controls.

While the device provides a map indicating control locations,
implementing the required JSON parsing in the kernel isn't feasible,
necessitating a user-space implementation.

The new approach in the FCP driver significantly improves both
maintainability and paves the way for future enhancements:

Firstly, the kernel component of the FCP driver is <10% the size of
the Scarlett2 driver, with the obvious maintainability advantages;
cloc reports:

File                            blank     comment        code
sound/usb/mixer_scarlett2.c      1765         852        7152
sound/usb/fcp.c                   174          64         645

Secondly, changes that aren't feasible to implement in the kernel due
to backward compatibility constraints will be able to be implemented
in user-space, with end-users easily able to choose an older version
of the controls if needed. For example:

1) The largest interface has >500 ALSA controls just for the matrix
mixer (one control for each entry in the N×M matrix). This would be
better done as N controls with M values each, especially since the
device supports writing a row (all input gains for one mixer output)
at a time.

2) Similarly, the mux table entries have a control per entry, but
they're all written at once, so it would be better to have a single
ALSA control for the whole mux table.

3) The interfaces have 3 independent mux tables (one per sample rate
48kHz, 96kHz, 192kHz), but supporting them isn't feasible in Scarlett2
due to backward compatibility constraints.

4) Users of the Scarlett2 driver frequently request higher-level
controls like stereo-linking, pan, mute, and solo. These would be very
challenging to implement in the kernel while maintaining backward
compatibility to the existing controls, but again, it's easy to have
configurable controls in user-space.

I did consider the alternative of a small user-space helper that just
reads the map (this is the direction I was heading with my previous
commit 9930c26 ALSA: scarlett2: Add support for device map retrieval)
and uploads the offsets to the driver, but this would add even more
complexity to the driver while gaining none of the possible benefits
of a user-space implementation. Since user-space implementation is
unavoidable, moving as much functionality there as possible provides
the cleanest and most maintainable solution.

Hence, I present for your consideration the following patches:

1) The new FCP driver implementation, handling only the essential
kernel-space components (base protocol and level meter)

2) An option enabling Scarlett2-supported devices to use the FCP
driver, providing an opt-in migration path forward

The accompanying user-space implementation is available at:
https://github.com/geoffreybennett/fcp-support

Thanks,
Geoffrey.

Geoffrey D. Bennett (2):
  ALSA: FCP: Add Focusrite Control Protocol driver
  ALSA: scarlett2: Add device_setup option to use FCP driver

 MAINTAINERS                 |  10 +-
 include/uapi/sound/fcp.h    |  59 +++
 sound/usb/Makefile          |   1 +
 sound/usb/fcp.c             | 883 ++++++++++++++++++++++++++++++++++++
 sound/usb/fcp.h             |   7 +
 sound/usb/mixer_quirks.c    |   7 +
 sound/usb/mixer_scarlett2.c |   8 +
 7 files changed, 971 insertions(+), 4 deletions(-)
 create mode 100644 include/uapi/sound/fcp.h
 create mode 100644 sound/usb/fcp.c
 create mode 100644 sound/usb/fcp.h

-- 
2.45.0

