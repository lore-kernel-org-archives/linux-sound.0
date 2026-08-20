Received: from gx.d.sender-sib.com (gx.d.sender-sib.com [77.32.148.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 412433ACEE3
	for <linux-sound@vger.kernel.org>; Thu, 20 Aug 2026 08:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.32.148.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787215082; cv=none; b=AOFfpWlPre30AALJnt8WGh8J7sl5DHSfxovUsvNKFrXWeUGnDOZOHlC6vdlmANgN5LpaEkjiLzsh8xYjhvc1aybRRf6SgwsGXIsik/qvGGc/JgCdKhOgqvzebk9SIdu1qABezIbts4XDzWjorjnRUHcBYultTdXVzU1Sdo6Oql4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787215082; c=relaxed/simple;
	bh=WkWCfdofhBa/xyWGidhvVSgREVFol2bfvzmw4/hCVKY=;
	h=Cc:From:To:Subject:Message-Id:Date:Mime-Version; b=s/AFM5/fMHTbpOxv9iNd/lBlLyp5R3/yBjBWrGV5/meT0aFnQL2Ux7XGUj8tqETe+1SWnaFHuvhJaHfCBvrgJwPdF7ZV7PodTZrT/07L9Ye4gOvnLyu64WA3AoLm+PGNGdI3+uYFVjM4f2tFb+tEMCpjbVZzmRwhLE0LZU49tbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=outlook.com.au; spf=pass smtp.mailfrom=gx.d.sender-sib.com; dkim=pass (1024-bit key) header.d=brevosend.com header.i=@brevosend.com header.b=LtLGHvUr; arc=none smtp.client-ip=77.32.148.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=outlook.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gx.d.sender-sib.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=brevosend.com header.i=@brevosend.com header.b="LtLGHvUr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=brevosend.com;
 q=dns/txt; s=mail; bh=kn7srHoXkaZsxngVEFiL/AUftNzcyOW4mWabfcraxfs=;
 h=from:subject:date:to:cc:mime-version:content-transfer-encoding:list-unsubscribe:x-csa-complaints:list-unsubscribe-post:message-id:x-sib-id:feedback-id;
        b=LtLGHvUri/bGvDvIBzYuvT16zuLU7sf8svsXPnFZV1eWmjB1ij++s+5B/RQyrQCkd6Q27hipFQSO
        ufeJxWgPQ8gzkQZrDbC8uvBbR393/4M4xYXnfaVkA8ZlvjPIq14LQRc+4cDs+2xJWVzS2cykAOf1
        wWejmx4YaqDTbaqPF8g=
Cc: "Jonathan Corbet" <corbet@lwn.net>,  "Shuah Khan" <skhan@linuxfoundation.org>,  <linux-sound@vger.kernel.org>,  <linux-doc@vger.kernel.org>,  <linux-kernel@vger.kernel.org>,  "Nicholas Johnson" <nicholas.johnson-opensource@outlook.com.au>
From: "Nicholas Johnson" <nicholas.johnson-opensource@outlook.com.au>
X-Mailin-EID: NDgxMTkzNjAyfmxpbnV4LXNvdW5kQHZnZXIua2VybmVsLm9yZ348MjAyNjA4MjAwODM2NDYuMTEzODMtMS1uaWNob2xhcy5qb2huc29uLW9wZW5zb3VyY2VAb3V0bG9vay5jb20uYXU%2Bfmd4LmQuc2VuZGVyLXNpYi5jb20%3D
To: "Jaroslav Kysela" <perex@perex.cz>,"Takashi Iwai" <tiwai@suse.com>
Subject: [RFC PATCH 0/1] ALSA: add PreSonus Quantum PCI driver
Message-Id: <20260820083646.11383-1-nicholas.johnson-opensource@outlook.com.au>
Origin-messageId: <20260820083646.11383-1-nicholas.johnson-opensource@outlook.com.au>
List-Unsubscribe-Post: List-Unsubscribe=One-Click
Feedback-ID: 77.32.148.24:11519862_-1:11519862:Sendinblue
X-CSA-Complaints: csa-complaints@eco.de
Date: Thu, 20 Aug 2026 16:36:45 +0800
X-sib-id: XS24cgimfbmQn2YJM3vucm_624UHg6ySkALZm5Dk9E6Ml7h9WrGpkU7IjZnmUBfzh2Im_jNDyVQu1OZ9S7C8w9UgirNhFavjmXT8U_cDXfJcjuARkcvPCODubguv5dwnxcjBU7BkGQIq3e-40qeoD9RzoW2SLIrsV0aWlAejd5NYSKNppq6084Rw
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: git-send-email 2.53.0


Hi all,

This RFC series adds an ALSA PCI driver for PreSonus Quantum PCIe/Thunderbo=
lt
audio interfaces.

This project is independent and is not affiliated with PreSonus or Fender.

The driver provides playback, capture, raw MIDI, sample-rate control,
clock-source control, XRUN reporting, and surprise-removal handling. It
targets the Quantum PCI family and currently has verified support for the
Quantum 2626.

The implementation keeps the hardware path direct and multichannel, with
the aim of being small, reviewable, and suitable for eventual upstreaming.

I want to thank my best friend, Ju Ern, for lending me the machine used to
develop the driver, and the Asahi Linux project for m1n1 and the tooling
that made the hardware tracing and analysis possible.

Only the verified 2626 device ID is matched by the driver at present.

I am sending this as RFC to gather review and testing before asking for
merge. I would especially appreciate feedback on ALSA integration, device
enumeration, runtime PM/latency handling, and upstream expectations for the
driver.

Thanks,
Nicholas Johnson

Nicholas Johnson (1):
  ALSA: pci: add PreSonus Quantum PCI driver

 Documentation/sound/cards/index.rst           |    1 +
 .../sound/cards/presonus-quantum.rst          |  120 ++
 MAINTAINERS                                   |    6 +
 sound/pci/Kconfig                             |    2 +
 sound/pci/Makefile                            |    1 +
 sound/pci/quantum/Kconfig                     |   19 +
 sound/pci/quantum/Makefile                    |    6 +
 sound/pci/quantum/quantum.h                   |  394 ++++++
 sound/pci/quantum/quantum_dma.c               |  853 ++++++++++++
 sound/pci/quantum/quantum_main.c              | 1148 +++++++++++++++++
 sound/pci/quantum/quantum_midi.c              |  180 +++
 sound/pci/quantum/quantum_mixer.c             |  214 +++
 sound/pci/quantum/quantum_pcm.c               |  609 +++++++++
 sound/pci/quantum/quantum_regs.h              |   52 +
 sound/pci/quantum/quantum_tci.c               |  486 +++++++
 15 files changed, 4091 insertions(+)
 create mode 100644 Documentation/sound/cards/presonus-quantum.rst
 create mode 100644 sound/pci/quantum/Kconfig
 create mode 100644 sound/pci/quantum/Makefile
 create mode 100644 sound/pci/quantum/quantum.h
 create mode 100644 sound/pci/quantum/quantum_dma.c
 create mode 100644 sound/pci/quantum/quantum_main.c
 create mode 100644 sound/pci/quantum/quantum_midi.c
 create mode 100644 sound/pci/quantum/quantum_mixer.c
 create mode 100644 sound/pci/quantum/quantum_pcm.c
 create mode 100644 sound/pci/quantum/quantum_regs.h
 create mode 100644 sound/pci/quantum/quantum_tci.c

--=20
2.50.1 (Apple Git-155)


