Received: from fhigh-b5-smtp.messagingengine.com (fhigh-b5-smtp.messagingengine.com [202.12.124.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C45955B1EB;
	Sat, 20 Jun 2026 08:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781943056; cv=none; b=kp6feEYHoA7YkWmbMQY/ysV+f7xWIg2rzCnO0s3m4VR1jiWIUAZtf64+IjPl4HNLhqD8iHtiVewMJONuQxB/Iq2TdKzcaguSyOgqzJ6SXrCJ36vYUXt78fxmEgi21psBI7yfaSv3ehguDRCHig+skQ67HallWHqMGYqiNz95e+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781943056; c=relaxed/simple;
	bh=Zq2UmGM5Ra4APBhA/QoiwqlF5T9whC6JyK07U2qZAW0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EEuUUewu6xagiWgC/BnsYhCAGPTgSRu9EoHCoaOlM+fkITuDyFpB6JwIH+Mr4nipdMIPyDQ4IjOSA2K7iDP9HlBP2NVewciSUYKyuQxFQwIcroEv6/RdvfFtjsh54HqamPagNWVO8/0SrZLrHkzxvWSzDDDUWHy7vxWsByubp0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=m+J/79Nv; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=RVQ5NFva; arc=none smtp.client-ip=202.12.124.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="m+J/79Nv";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="RVQ5NFva"
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfhigh.stl.internal (Postfix) with ESMTP id B7BEA7A0061;
	Sat, 20 Jun 2026 04:10:51 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Sat, 20 Jun 2026 04:10:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:message-id:mime-version
	:reply-to:subject:subject:to:to; s=fm1; t=1781943051; x=
	1782029451; bh=rEHmbo5/RVBquoJVNN9AM9JPGnKf3khxU97nLffzuDQ=; b=m
	+J/79Nv1H4dRRT3lA615G12+fDKWsZcp9aSskmvbJtqA0F39j7iTMXUqLDH8rYzd
	W/NehO9+WU6PeicSdt0fR4JcGLYgDiaPdhxnRnkwWfI9AeNBzZG/Q7/vZn1RY4t0
	Nzz7ivhiwCZ8cZ9tK1IZHPoMrlvVo3QmaZES65ZXBebJORoWFCdt4QkV6VNcIfQv
	ARMX3c1wlM2arJ65A/TGzwi+MejYTyQNruwNJDX1kAivaLkn66XW/NV2EcKk6+ol
	xCxNLjXAXp+zyHc5liprIPtX/TXZnNk+EQA3q6ScysOHXQFg36ZPNRfrlCCfk4Sz
	s5iBPVtVxGFN6EmTF25fw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1781943051; x=1782029451; bh=rEHmbo5/RVBquoJVNN9AM9JPGnKf
	3khxU97nLffzuDQ=; b=RVQ5NFvamIS2M9kkJY0sDYDn+rY3lRiT8yww5vSMuulC
	POSefWwoX/EUhA1WCmHsGNo/cUPxZiurbihpplJiiTEfPqF7dcn7R9lgpy+grhd0
	unqxOhPYTxMM/aWegt6JiXae4pne/Lgb6SV/PtNPN1Hb45KvkdXUCVrnEvc+29RE
	9tlIPd+GRfG4oUnoBPccVln4/0QGXFUtfc9bjLCECeqVg0nHPLX+BLnbQpgijw8a
	zm33Nw9C44OKYIIbGNiHzNYi6paSOQngYTTYNzzhmoZ3TJxJhPbaX/6/pK6tXsdf
	v0fOgaAGvRjVqQ5Vjqh9JAZs0yx0H5e4N4rL9goGLw==
X-ME-Sender: <xms:Cks2alQRPnv6GkB1aV1lZpUvS-SCV5qUwZ7e0gW2vio-npWrPk1oRQ>
    <xme:Cks2aqMmBV1PDh8-TmaLj23b3SYjOv-1KLWJ62HiqOAewi_8_CXLM8v1Zl06WPW7J
    oqRMyRa_Avog2MdSaH-owTkEJKxfly6v6qCd22MiCI19zwz3hqRM9Y>
X-ME-Received: <xmr:Cks2auX4FrxrVDwnh_9_tkOU2ClVIrk7--Z4PfT6-AJ2dmpexe7-WBYLYdB9uovB_mbOu5N1RGe9LYMwfG1S-ciZObxznw>
X-ME-Proxy-Cause: dmFkZTEfqDsxJIn8ijSBb/fQINR52UZwSeDYc2O7YpXNWLVx6BDI7vh8Zg5NXHc043I+yP
    PlpVF8YwPqKahWVJVlxyHjjyufPCFtEgjO8nfTBOCULeI0JZGS1pWbAsXHjcMB4sI2k2ph
    fwA0RqTMOq/yiEvPHvyCInOtmEfjoYNDz0HyLXtmSLef+x8/DY7udKlK1DQYfohWKzzPSW
    f5HDg7zXMJAjFbzJDROQuGULVeyIOrI2oPVkTgWXmZ+bcdX9GQLWrvRPodV+HDtb3YkjT6
    TvixzG+AgbdJtQ52eZkrT3CioWV5/R/AKfAsyGFZgN3UxCdtMG5x0/fDy7xG6+fLxBa9hH
    iz714l05OcHovNinjycvIASYT3HqOt6Zi9jtYU35TVKWNnnB2R43IECXvdRETsfZf66TsB
    L7RbACuG589+JNi8/FPzNzAM21rbUUPWfh5u6mk6RqffD+jYio08Ehbc8ohHa9x9WDGLUV
    lHa3D1ml2wkXd8OnzrlHqiCjq6UF2v575F1rS9pKGPC8pOSznLHHU+PnjQxDCUX/YqCXDZ
    2iJWc9BTrNB+3TZiFIKZdh1YrXsFL4uRLC1RotBrmELwdLgO1QSA2QAB25mIvDu6Bif+Zo
    RpNz1cI+wQXHWCf3PDKjD81o3UbUP/wsPq4b+q8uVgVYhjFUBND8nFPNGVAQ
X-ME-Proxy: <xmx:Cks2aheert389NfI5j4tfFZ8F95Fe2aL2JXutYPUdQoFn6QNUWlGLg>
    <xmx:Cks2aquMqJdPixdMo9wqFrJBQMsKn1e0AUuNJIuzopEkivPW58dCFw>
    <xmx:Cks2ag-xan40wwxBM4XNemXhEt5Tv--AesYltfnGK_zrsFK6BYaxUA>
    <xmx:Cks2al2aah9nMQljjo9Tv3b9YwPaju93eNkRGZviFbOY_-aAw5-G-A>
    <xmx:C0s2ahNrYmsC_0bGmDv_R1z7Ofh_-LMhqFgZ8j8HVD4oDqHu2L-5nUf0>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 20 Jun 2026 04:10:49 -0400 (EDT)
Date: Sat, 20 Jun 2026 17:10:47 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, linux1394-devel@lists.sourceforge.net,
	linux-sound@vger.kernel.org
Subject: [GIT PULL] firewire updates for v7.2
Message-ID: <20260620081047.GA304347@sakamocchi.jp>
Mail-Followup-To: torvalds@linux-foundation.org,
	linux-kernel@vger.kernel.org, linux1394-devel@lists.sourceforge.net,
	linux-sound@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ieee1394/linux1394.git tags/firewire-updates-7.2

for you to fetch changes up to e954726de56963754c8ac9d9e76b3f59d12fef17:

  firewire: core: Open-code topology list walk (2026-06-13 11:10:23 +0900)

----------------------------------------------------------------
firewire updates for v7.2

This update includes the following changes.

Unit drivers have been able to assign an arbitrary value in the mod_device
entry, which is typed as kernel_ulong_t. While storing the pointer value
is legitimate, conversion back to a pointer has been performed without
preserving const qualifier. Uwe Kleine-König introduced an union to
provide safer and more robust conversions, as part of the ongoing CHERI
enhancement work for ARM and RISC-V architectures. This update includes
changes in the sound subsystem, since the conversion pattern is widely
used in ALSA firewire stack.

The userspace applications can request the core function to perform
isochronous resource management procedures. Dingsoul reported
reference-count leak when these procedures are processed in workqueue
contexts. This update refactors the relevant code paths following a divide
and conquer approach. Consequently, it became clear that the issue still
remain only in the path when userspace applications delegate automatic
resource reallocation after bus resets to the core. In practice, the leak
is rarely triggered, and a complete fix is still in progress.

----------------------------------------------------------------
Kaitao Cheng (1):
      firewire: core: Open-code topology list walk

Takashi Sakamoto (14):
      firewire: core: code refactoring for early return at client resource allocation
      firewire: core: code refactoring to queue work item for iso_resource
      firewire: core: code refactoring for helper function to fill iso_resource parameters
      firewire: core: split functions for iso_resource once operation
      firewire: core: code cleanup to remove old implementations for once operation
      firewire: core: append _auto suffix for non-once iso resource operations
      firewire: core: code cleanup for iso resource auto creation
      firewire: core: reduce critical section duration in pre-processing of isoc resource management in cdev
      firewire: core: use switch statement for post-processing of isoc resource management in cdev
      firewire: core: refactor notification type determination after isoc resource management in cdev
      firewire: core: move allocation/reallocation paths into specific branch after isoc resource management in cdev
      firewire: core: minor code refactoring for case-dependent parameters of iso resources management
      firewire: core: rename member name for channel mask of isoc resource
      firewire: core: cancel using delayed work for iso_resource_once management

Uwe Kleine-König (The Capable Hub) (2):
      firewire: Simplify storing pointers in device id struct
      ALSA: firewire: Make use of ieee1394's .driver_data_ptr

 drivers/firewire/core-cdev.c     | 361 ++++++++++++++++++++++++---------------
 drivers/firewire/core-topology.c |   4 +-
 include/linux/mod_devicetable.h  |   5 +-
 sound/firewire/dice/dice.c       |  34 ++--
 sound/firewire/fireface/ff.c     |  12 +-
 sound/firewire/motu/motu.c       |   6 +-
 sound/firewire/oxfw/oxfw.c       |   4 +-
 7 files changed, 254 insertions(+), 172 deletions(-)
