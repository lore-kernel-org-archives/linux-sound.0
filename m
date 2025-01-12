Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C735D1BEF90
	for <linux-sound@vger.kernel.org>; Sun, 12 Jan 2025 17:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.16.231.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736702026; cv=none; b=ok9vdp0CRbB/HOSh9sbGzm/6AVcbeblDXb1e0/RcPNn3wgYDuzBYsCQ9Ue/0p9OZ2+7yFDkFCwZ3bQhkD7pXVZRw18903NFkHcb3IyKmBfvbkV558bXyccii7mEir20W1ekQbiWETneTjz6bzfJ2G1RwkDHLjkYTCK6RRwVgjg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736702026; c=relaxed/simple;
	bh=neeegY7ydjRTMkc6rORKW6g12xoIdVhTdPS0Z3mFjm0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XOcI1/TRYyp2FVj/wlMOasnCyEutazpUb0u1uQpdHhFTbyZt+vUh0jZtyUVgsPmXekSdN8eAjdT4gOxgzHPoWd2IsDT+k7Uuwub7wSTGuRcno6VrETNB6e2NtUXHsEC1ULYWNr+o5RUeZlHk2kuJtPx8pAYJ0Bf3hlk9fk3T8sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu; spf=pass smtp.mailfrom=b4.vu; dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b=s7nPFy4z; arc=none smtp.client-ip=203.16.231.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b4.vu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b="s7nPFy4z"
Received: by m.b4.vu (Postfix, from userid 1000)
	id 2122E64A2AC2; Mon, 13 Jan 2025 03:40:04 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu 2122E64A2AC2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1736701804; bh=ROyXCxKmwtB61oeyiaGDFTAMQ9U7hxSTNSe6/U0jaqQ=;
	h=Date:From:To:Cc:Subject:From;
	b=s7nPFy4z6Up35x/Lk+AIzAEUkcxeF5fSDWJNEfixhxo1QCUkyoHZGM9RIOO6BrLsu
	 rToEU7LWjwBf1jwEr6GPKWHH77iPaAAqbix4qnRPRO+/0Y6QYFQuUvp+4q1liFYWxU
	 /qyN77Zq2Z9Gwv4c61jby8kkGYDgs7x66FR6gtYNe1gNNZDboBruK7kHKnb0pP8CPt
	 JdPk3dvphkOinAclkev6oWgZNjAhMH1UQoF39w73bT+bI+i500C+o5Bg3Bj3RTrZJw
	 ws1nvL0smAl9z6kZZvktq0/CEOiLZIgjjanHKqxP8pySz0qdZ6tDSGidugCWpaqKPa
	 DexCXOvC5i1Lw==
Date: Mon, 13 Jan 2025 03:40:04 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
Subject: [PATCH v5 0/2] ALSA: Add driver for big Scarlett 4th Gen interfaces
Message-ID: <cover.1736699490.git.g@b4.vu>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Takashi,

Thank you again for your feedback.

On Fri, Jan 10, 2025 at 06:03:02PM +0100, Takashi Iwai wrote:
> On Sat, 04 Jan 2025 18:12:54 +0100,
> Geoffrey D. Bennett wrote:
[...]
> > +union fcp_init {
> > +>--__u32 version;
> > +>--struct fcp_init_v1 v1;
> > +};
> > +
> > +#define FCP_IOCTL_INIT _IOWR('S', 0x64, union fcp_init)
>-
> I don't think this version and union are needed.
> If you need a different way of initialization, you can provide simply
> a new ioctl, instead of keeping the same ioctl and handles something
> conditionally in a complex way.

Noted and fixed.

> Also, in which situation should the init ioctl be performed?
> And in which situation it shouldn't (must not) be performed?
> Currently the driver seems allowing to run it at any time.  e.g. what
> happens if the init ioctl is called while you're playing or recording
> streams?  The same question is applied to the fcp_cmd, too.

The init must be performed at least once before any commands will
work, but can be safely performed again at any time, including during
playback/recording. Based on my testing, it seems that the control
interface is completely separate from the audio/isochronous transfers.
I've updated the comments to explicitly note that the init ioctl can
be called at any time.

fcp_cmd is expected to be called at any time as well.

> > +>--if (!capable(CAP_SYS_RAWIO))
> > +>-->-------return -EPERM;
>-
> So now you limit the hwdep operation essentially only to root user.
> Is it intended, right?  That is, the hwdep should be accessed only at
> probe time for configuring the stuff (preferably some service or udev
> stuff)?

Correct. During development it was convenient to not have that
restriction, but as you point out there are some risks that way, and
the user-space side of the driver is intended to be automatically
started by udev/systemd, which can run it with CAP_SYS_RAWIO.

FYI, the complete end-to-end setup from kernel driver to user-space
driver (fcp-server from the fcp-support project) (automatically loaded
by udev/systemd) to user-space control app (alsamixer, amixer, or
alsa-scarlett-gui) is working well for me and a few other testers.

The ALSA controls created by the user-space driver are nearly
indistinguishable from those created by the existing scarlett2 driver.
All the expected features (mixing, routing, gain/volume, levels,
firmware updates, etc.) are working well. The current public code for
the user-space driver matches v1 of the kernel side that I previously
submitted. Once we get the ioctls finalised then I'll push the
corresponding user-space side.

> Maybe it'd be helpful to give some "big picture" to indicate how
> things should work.  Also, the more proper documentation should be
> provided for the hwdep interface, too.  The kernel doc in comments
> should be fine, too.

Noted and fixed.

> Last but not least, I don't think we need to split to two patches.
> The second patch merely adds the setup hook, and this can be folded
> into the main patch.

I'm not sure I agree with combining the patches. Here's my reasoning:

Patch 1 adds the new FCP driver which supports the new 4th Gen
16i16/18i16/18i20 interfaces. This patch is complete on its own and
these interfaces don't require patch 2.

Patch 2 is optional and adds the ability (but not the default) to use
the new FCP driver with existing hardware (that is already supported
by the scarlett2 driver). This capability is added through a module
parameter in the scarlett2 driver and is logically separate from the
FCP driver.

But I'm okay to combine them if you still think that would be better.

Regards,
Geoffrey.

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
 sound/usb/fcp.c             | 1044 +++++++++++++++++++++++++++++++++++
 sound/usb/fcp.h             |    7 +
 sound/usb/mixer_quirks.c    |    7 +
 sound/usb/mixer_scarlett2.c |    8 +
 7 files changed, 1180 insertions(+), 4 deletions(-)
 create mode 100644 include/uapi/sound/fcp.h
 create mode 100644 sound/usb/fcp.c
 create mode 100644 sound/usb/fcp.h

-- 
2.45.0

