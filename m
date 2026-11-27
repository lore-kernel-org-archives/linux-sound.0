Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=141.14.17.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795791759;
	b=CFxUPGzuGokid3OWbtWMeBQGdyd+5pj/AfPTIkYMAbr4l5vxObJgR8Hy7rzhlRTpHC9X
	 xUk4ltPvA4PV7fwJjNzb2z9Nn16zz/m4KzpAMNxOPXl5adqxaNd5rMOfz57pBs4HTc1vF
	 4eaATymS+8z1VNeyV/v+gAF9Wj6ycLb3mfZhWHK4gmFZgZ3zkl0sPVt3hQ4SK2mAxiwhU
	 xMlyHCJKWHDjGpB9JFOc6YRJXaE3B9GrAHJBYBR/2Uk31PbHtYnM91f0eY+Yl0BykflaG
	 ytpGv+6IYGvaOfYedC+HoKjMxWUOnY0Q2yaLzbEZG330Bn0aHeAMvfMsxAlC7hNK/Pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795791759;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:DKIM-Signature;
	bh=BLefJJCMTPwvzLyIbDX2Q4Lv9aLiY+ySW5snVDkb/HE=;
	b=plfi/IFVy1DSr7+sTBf1HpPypQifHeIZJ8YOU0XebGlYorymMq0Oe7or7IVa6DG9db2u
	 v0i6JIEvx+l9fDli2/bhwFSJWMWLr36vfJgvAVczI0NMvI0QDxdSrhCIaD01+LVAZQwPn
	 xLI8PECLi41ayz0ZxtHEe0R0JSvmg0c6NYHc5qk83FwYshFccFE0iTHsFmCV3PT/mKtiW
	 j2HJ2ij/5eW0IxKjdIvzU5Vq50Pit2Cx3NxWVbQ6jhwohug4CDW7MJUV+mreRcuhplDsH
	 rbghYuieTfFKfuHVsM2a+s9B3uXKA+WMJGF2MyIERFKP9JOIQL+PWxMl1Be9KiCQh7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=molgen.mpg.de;
	spf=pass smtp.mailfrom=molgen.mpg.de;
	dkim=pass header.d=molgen.mpg.de header.i=@molgen.mpg.de header.a=rsa-sha256 header.s=20260906 header.b=RmIJXozt;
	arc=none smtp.remote-ip=141.14.17.11
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 378A6606A31C;
	Fri, 27 Nov 2026 15:02:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 378A6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=molgen.mpg.de header.i=@molgen.mpg.de header.a=rsa-sha256 header.s=20260906 header.b=RmIJXozt
Received: from abreu.molgen.mpg.de (g44.guest.molgen.mpg.de [141.14.220.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 166D04C442F94A;
	Fri, 27 Nov 2026 16:02:06 +0100 (CET)
From: Paul Menzel <pmenzel@molgen.mpg.de>
To: Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: Paul Menzel <pmenzel@molgen.mpg.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] soundwire: Suspend and resume asynchronously
Date: Fri, 27 Nov 2026 16:00:55 +0100
Message-ID: <20261127150101.48880-1-pmenzel@molgen.mpg.de>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=molgen.mpg.de; s=20260906; 
	t=1795791727; 
	h=from:from:subject:date:message-id:mime-version:content-type:content-transfer-encoding; 
	bh=BLefJJCMTPwvzLyIbDX2Q4Lv9aLiY+ySW5snVDkb/HE=; 
	b=RmIJXoztTAvuJD5JVTj6J2MqsvQtyguELAh2yb/gQIqjst4G+/NWPcG7DKM1a9pOuXHkqBmouh4e
	LkSHyF6YevmdxBLhMXoOhrMWPp7xb6VOkRDR7riGDhBOZe73c2KF0WxakZ+WUaYs3sqAJ4o+Gzu1pc
	Rvi5yzMfJknAzoSmX4/SKoCW/Kpo9BEQrIo0FNeTPrvE3UDH+81SgiHOaICLTdCg0ya64F22K3IiO4
	qz4dWZpuT8MUUh71GUB0uM99PVbJGcCEuXBNyi8GhgdE+9vXEzHgdmjZJWfVAI5YHedQRJXYq7U9CY
	0Dc0A7Yd3CXDcjW+zy0ssM5k9JsA60dQ==

On system resume, the SoundWire devices are resumed synchronously, so the
codecs on different links wait for each other’s re-enumeration, and the
whole audio subtree waits for every synchronous device before it in
dpm_list. On a Dell XPS 9315 (Alder Lake, SOF, RT1316 on link 2, RT714 on
link 3), the four resume callbacks run one after the other, in one cycle:

    soundwire_intel.link.2     2.2 ms
    sdw:0:2:025d:1316:01      16.3 ms
    soundwire_intel.link.3     2.2 ms
    sdw:0:3:025d:0714:01       9.9 ms

Their span is 28.9 ms. With both patches, the callbacks overlap, and the
span drops to 17.1 ms (median of five s2idle cycles each, sleepgraph with
the device callback trace events). It is on the critical path of the resume
with the panel on, right behind SOF, which waits for i915 through its
device link.

Patch 1 marks the generic manager and peripheral devices, patch 2 the Intel
link devices. The SHIM registers are shared by the links; patch 2 explains
why the multi-link SYNC arm and SYNCGO sequence in intel_start_bus()
tolerates two links interleaving. It is the part I am least sure about, so
please check it. The second link’s power-up waits on shim_lock, so in 49 of
50 traced cycles the start-up was serial anyway; in one cycle both links
were armed before the first SYNCGO, and the bus came up fine. If you
prefer, I can serialize intel_start_bus() across links instead; it takes
about 0.1 ms per link.

Not tested: AMD and Qualcomm managers, and peripherals of other codec
drivers. Patch 1 changes the ordering against synchronous devices that are
neither descendants nor device-link consumers of the peripherals. The
WCD93xx codecs have device links. The deferred resume work of the ASoC card
can now run while a codec still waits for its re-initialization; with the
RT1316 and RT715 SDCA drivers, its register writes then end up in the
regmap cache, which the codec syncs afterwards. I checked the other drivers
only by reading the code. Suspend is now asynchronous as well, which I did
not measure.

Tested on the Dell XPS 9315 with 7.4-rc4, these and unrelated resume
patches: 50 s2idle cycles, each followed by 1 s of playback to the RT1316
and 1 s of capture from the RT714 (non-zero samples), with no errors in the
log; also 30 resume stress cycles in an earlier run. The series is based on
soundwire/next and only compile-tested there (W=1).

The analysis, the patches and the messages were drafted with
claude-opus-5-5 (Claude Code), asked to cut the s2idle resume time of the
laptop, see Documentation/process/generated-content.rst.

Paul Menzel (2):
  soundwire: Suspend and resume managers and peripherals asynchronously
  soundwire: intel: Suspend and resume the links asynchronously

 drivers/soundwire/intel_init.c | 3 +++
 drivers/soundwire/master.c     | 3 +++
 drivers/soundwire/slave.c      | 6 ++++++
 3 files changed, 12 insertions(+)


base-commit: d9ea256ee889f3db9f0bd07ce5d114ce92e31b4f
-- 
2.54.0

