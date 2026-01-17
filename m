Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE38013C8EA;
	Sat, 17 Jan 2026 14:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768660110; cv=none; b=UbFRAWn1w8/uBv+OiRsjdrYbz48FgFBITRevJqz9lmwOx2URgePeI2VtI8dqBRXBFMN+JL0jzrSDXQJb87swZPUYCkeM3YzTBzIxOrpAZlf3VSTK7S6+nJETaiPE540TEaFXlNHqb2lOo51e3gIJH7CO9/xSjJ02p/f8TbDg8Ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768660110; c=relaxed/simple;
	bh=aR8PqHX/8PnLjQejIKfGWMlmrb2xdlVvm/gNTEWfFfg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Kfk+6DN0tKeh6c6/qKVnh4bMNdHA0e38l/PlVjA3BEUT5KdFQvpQr0+z1hmPf8ktSZtMCl+rxVmAbI/qJRHyyCWWMdQzg3ZiUOcLlRQ1I2eQ6wZlsHtQs3aQJUPKenM+YqIOgXUxGG7L0Hkq9R2tec3l3k+xqQlShAUF89L7Z0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=YHhYN5lF; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=RHgh3uCx; arc=none smtp.client-ip=202.12.124.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="YHhYN5lF";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="RHgh3uCx"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 2B7621D00318;
	Sat, 17 Jan 2026 09:28:27 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Sat, 17 Jan 2026 09:28:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm2; t=1768660107; x=1768746507; bh=VxGIvxEnlM
	yLJw1AXQ5i8GRHQcqLmhfOwo0BLQWHxO4=; b=YHhYN5lFu9zBO4pkoKnrLOKxAE
	XpGXfFVlW/VvjP7FvQ5ns6tqpIfY2MHyBaY3KFEVjlAabPLE9N9HJ4qs2Vpbr0TJ
	/zVYA4Q6CYashcrHmsjBRgHNPmKrRd7Qzt4tR8iAr5BwDp6xOBtUji/skhmTepGr
	ja1D9H5D2Y4rQJA+J+SjNTISSImnszRMKpHA8NKqxJKp0npRcvOBbFTyAKUNmDne
	d7Noo2k/8netQtAdYzGnzRHz8CJ9yH4wJTVF/MyljnQtS8I2ot7G/s0r8lrxB4U7
	vJ4C2knLRzoELc731Glvd1EXzvDtxn5cTLocuOCwHWdkQtyw5tqbezFNIH5g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1768660107; x=1768746507; bh=VxGIvxEnlMyLJw1AXQ5i8GRHQcqLmhfOwo0
	BLQWHxO4=; b=RHgh3uCxHyeOP37dKg67w8RTU3d7/FkvLvGEXWuWyLsN7xCzdMM
	u4RUy0hClbQPmUbkhZjR6Bg1hWeCHrArPFoRZWU2bHhlcLmyNGOBjo/y4YPXDQID
	QhWo7W9gyLImtdzme5KU4ZbOI0llDJkRETHSnaBYSBjwUvd8UY00Qy3SeDkGJ5wQ
	RehzKQxOWvr7xs0rnTb6JqlvcE/Ph6letQ/ipG7aqZzmETDMO1yYFBqbmad/IqFW
	El15cSzd62dVk0+autlOd4bfPBBMuEfA8VBiyGU5/32T+M7njIfEB59IO6tbRwdD
	7naqJeXQo5tlRuiNFqP8ik+n0E4R9k8S/FQ==
X-ME-Sender: <xms:ipxraRCZCstn2JcGULe4Yh_V0MFpJB0TuWymPfQJlfTTJ4rP0YmMSw>
    <xme:ipxrafoMWf4C-8kkAAAoj7gSYgIdsD01VeZlUbhPAfJURfAgL2eiJH62pDxvFcio8
    U7soAwVyXHNIvWK9VrtYGs732oPJcmdyqKhD_rrOW8z0d4MlRSlwA>
X-ME-Received: <xmr:ipxraUgs3n16poBmY9xiXM16vdq0n66nfrTtaZ0_-7F895h-m4d0SelgjA3zmcW8clvdsAzq9cy7EZT7PB85b6sNcMll5JPzyQ__nPlyxjS5bA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddufedvtdehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertdertd
    dtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhi
    sehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpeffvdeuleffveekud
    fhteejudffgefhtedtgfeutdfgvdfgueefudehveehveekkeenucevlhhushhtvghrufhi
    iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrg
    hmohgttghhihdrjhhppdhnsggprhgtphhtthhopeefpdhmohguvgepshhmthhpohhuthdp
    rhgtphhtthhopehlihhnuhigudefleegqdguvghvvghlsehlihhsthhsrdhsohhurhgtvg
    hfohhrghgvrdhnvghtpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdr
    khgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqshhouhhnugesvhhgvghrrd
    hkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:ipxraUBL8NiS7o5bDDQvuaqqpPIsEmoKvUSwKJ6u3rlleSc1EdF2FA>
    <xmx:ipxraRGY1Y6G3gIJobvKoUmBWeIjciGR6VUBu6IwH0ufkirn7Qgz4A>
    <xmx:ipxraUITXX7CVspNI-LQ1e7dpdScGK_evM69aCrwoG4Kb0FUcWEbYg>
    <xmx:ipxradm0BxcN1cSO9osiRvRFitSRQtunP3uKW_qWt01dbM3Ca8z1sg>
    <xmx:i5xraenPVQBee2bP7KxQz9RtASRisJ92JXFs6w8Z1hL_jEUySU6amXy9>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 17 Jan 2026 09:28:25 -0500 (EST)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: [PATCH 0/9] firewire: core: add fw_iso_context() variant with configurable isoc header size
Date: Sat, 17 Jan 2026 23:28:13 +0900
Message-ID: <20260117142823.440811-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Currently ALSA IEC 61883-1/6 packet streaming engine provides the maximum
PCM buffer size constraints to drivers for audio and music units in
IEEE 1394 bus, due to hard-coded size of isochronous context header for
1394 OHCI IR context.

The limitation is inconvenient a bit, and this patchset removes it by
allowing the drivers to configure the size of isochronous context
header.

To sound subsystem maintainer, I'd like to send the last patch to
mainline in my side.

Takashi Sakamoto (9):
  firewire: core: add function variants for isochronous context creation
  firewire: ohci: refactor isoc single-channel state using a union
  firewire: ohci: code refactoring to use union for isoc multiple
    channel state
  firewire: ohci: use cleanup helper for isoc context header allocation
  firewire: core: add flags member for isochronous context structure
  firewire: ohci: allocate isoc context header by kvmalloc()
  firewire: core: provide isoc header buffer size outside card driver
  firewire: core: add fw_iso_context_create() variant with header
    storage size
  ALSA: firewire: remove PCM buffer size constraint from isoc context
    header

 drivers/firewire/core-card.c  |   4 +-
 drivers/firewire/core-cdev.c  |  30 ++--------
 drivers/firewire/core-iso.c   |  16 ++---
 drivers/firewire/core.h       |  13 +++-
 drivers/firewire/ohci.c       | 110 +++++++++++++++++++---------------
 include/linux/firewire.h      |  33 ++++++++--
 sound/firewire/amdtp-stream.c |  31 +++-------
 7 files changed, 125 insertions(+), 112 deletions(-)


base-commit: a4cd9860fa085f0d04d2065f4c151fcde9fcdf4a
-- 
2.51.0

