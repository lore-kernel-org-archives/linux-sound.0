Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F0F1A3157;
	Wed, 11 Feb 2026 05:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770787733; cv=none; b=DuKPfCxuqoG62enjcrrjqpjQvMN/kYMmvpZwDME9w1FnPkBSa0qOIgvHN7hHKg6rl1l7QpML1jgHRKJnw2NUeT296y5lX0CvFdC+BOH0xgOpgpC43D4WLFpjobZIr39O19Qufx/FD4AnN8IPXRBqLE2ZUdQ/cHsr/4Yr2RfKud8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770787733; c=relaxed/simple;
	bh=TAkiIMK4DI4uBVK+3/Ppt2zqAIMTUHf/3UPZkQdd5Ek=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dm6D/ODJ4LgEQTkg8Ir3LecKS2X4c1/vY+y1UXjO3wm63QZTwfEizUX6LvmB4EegHMJumpiArq3Mw4WkQ/5rbN7te9gvUon5ZtRK1+x7o+3whMwVqs2syxpooG8FW6q1lz/LRc/rzVWThNievJiTv13mq5+GJwAINTsypJt4OrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=TvUet5vF; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=g6Kdctyq; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="TvUet5vF";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="g6Kdctyq"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id 87B3CEC0330;
	Wed, 11 Feb 2026 00:28:49 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Wed, 11 Feb 2026 00:28:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm3; t=1770787729; x=1770874129; bh=G1+3OfqilYqpZhvwLHHP9
	6i+MEfztzDD2SNO+N/sZEw=; b=TvUet5vFZobmbLStKO6YA6KFqBxrDHPUXy5Ja
	f3+syfWr2+4JoKtNy2TNWPqt70yuWwZvHj0Uyy86uzMElxMaiRAOQ7y1QDkOtIYF
	1rBzvk4MVKf/OGttz+Vi2mwDJ5ZTB5K0GFms1GAkjyc2d7uUtPJo+Ca75S1Uk54C
	jWsvHahtBDt3Mgo+8ZdtljtNtYrvztnoRoF2sVUSMNaeS5JESjw7gMw8vKhrtExO
	MHh57bD1AKQ/YqyVfqJ4zzH6xpvAm7Brqugj3b7VfRWZOfygTb6QlBNhX9B+0I8K
	/ll1Jqty+yBkWg7ru80sFkKyuuxN+pDreBLTW/iFJ4oxhBR6Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1770787729; x=
	1770874129; bh=G1+3OfqilYqpZhvwLHHP96i+MEfztzDD2SNO+N/sZEw=; b=g
	6KdctyqAYf/Ggl4HDFSMGU/HiBZ+M9L/XGHLcvWZrQHVxxnxY3XFyLhcr7zfUKv0
	1FuS8wzgo3qbdcYnOJXZeBbyplxcGRKxgMGaDwOqdtERnUKatst+Fm/imriXfAvF
	O3VhlMlO3k+ASIITrtrbmmHDzAy1DssPI7f1NRPN3qzjKhtUSkDcLnuGmsFxwyBF
	pNvtY4TPRU3wG45w9rVxSvzDg45rqFiU8bV8T0hiItDiE6xyhDNixzBFo5kM68Ua
	VADwmWZL1AmkZ0XSfhcvzQMALZsqF4zenPfNvL6bjjgAuoBVK6lk7yc/1QrDpjxb
	T52EbmJIKvw0FGXGqqaOg==
X-ME-Sender: <xms:kROMacfYgBwjF73Ns2GoakAReevng74pSFLrNaKKrarQQK4Bc0nzow>
    <xme:kROMaZI1Q97WGA5DelnY-PEGGa5-9y75CbCh_9JuvkHUeJ07xz4cGBotylf6skie8
    8n3VZ0z1bDTdP9Zg3q9UzeRuFDlLDT6SYOERiHZAHPhpNNYVftcT2NJ>
X-ME-Received: <xmr:kROMachxXxHsipXl-i2kNij-y_tPXtVLxlKlgwUuNGLwTglGsGbQ9kPadj6VLOzLVgRTOd6xVSl-jT_gFSCmt7Qdj8-7cAbB>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvtddujeduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpeffhffvvefukfggtggusehttdertddttd
    dvnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhi
    sehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpeetfeeiteefveegvd
    fggeffheetleejkeekleeugeffffdtgfdtteetkeevvddvgfenucffohhmrghinhepkhgv
    rhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjphdpnhgspghrtghp
    thhtohepiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepthhorhhvrghlughsse
    hlihhnuhigqdhfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehlihhnuhigqdhk
    vghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigud
    efleegqdguvghvvghlsehlihhsthhsrdhsohhurhgtvghfohhrghgvrdhnvghtpdhrtghp
    thhtoheplhhinhhugidqshhouhhnugesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtph
    htthhopehjvghnshdrfihikhhlrghnuggvrheslhhinhgrrhhordhorhhgpdhrtghpthht
    ohepjhhgghesnhhvihguihgrrdgtohhm
X-ME-Proxy: <xmx:kROMaXQmC3ndl7UVWLn5hrTsNNhBezdJhHK-J-vuh7EZe3RPXzYDdg>
    <xmx:kROMaWVzf4R80jgPrfLDgt1T3sHOlnVbM3yLBaTI9ns58LmlJDK_7Q>
    <xmx:kROMaTROvHGVLMxwmCTfPAls0y8qNfuKan_35SgomiWyG66NW-iEBA>
    <xmx:kROMaYnYFBPDFAgQCy8ZHjV11dfeAgpTJrY8r3PMoSR2wfAN5Cjx8A>
    <xmx:kROMaf4jA2Gywmivjeb_sShFrVVUcrE6PKls24FASuWE2T_0vFdNvidT>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 11 Feb 2026 00:28:47 -0500 (EST)
Date: Wed, 11 Feb 2026 14:28:45 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, linux1394-devel@lists.sourceforge.net,
	linux-sound@vger.kernel.org, jens.wiklander@linaro.org,
	jgg@nvidia.com
Subject: [GIT PULL] firewire updates for 7.0-rc1
Message-ID: <20260211052845.GA155338@workstation.local>
Mail-Followup-To: torvalds@linux-foundation.org,
	linux-kernel@vger.kernel.org, linux1394-devel@lists.sourceforge.net,
	linux-sound@vger.kernel.org, jens.wiklander@linaro.org,
	jgg@nvidia.com
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,
(C.C.ed to linux-sound, Jens Wiklander, and Jason Gunthorpe)

Please pull firewire changes for 7.0. It includes the following changes:

 - Refactor page allocation dedicated to 1394 OHCI IR/IT/AR DMA contexts
 - Allocate variable-sized buffer for isochronous context header
   - Including a small change in sound subsystem

This subsystem has been a long-standing, single user of dma_alloc_pages().
Recently, TEE subsystem added usage in a commit
ab09dd6d9201 ("tee: add tee_shm_alloc_dma_mem()"), and it still remains.
I think the kernel API can be avoided in direct calls and encapsulated for
the convenience of DMA mapping layer developers.


Thanks

Takashi Sakamoto
(on a national holiday in Japan)

---

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ieee1394/linux1394.git tags/firewire-updates-7.0

for you to fetch changes up to 6b617317e5bc95e9962a712314ae0c4b7a4d5cc3:

  ALSA: firewire: remove PCM buffer size constraint from isoc context header (2026-01-18 17:18:48 +0900)

----------------------------------------------------------------
firewire updates for v7.0

This update includes the following changes.

 - Refactor page allocation dedicated to 1394 OHCI IR/IT/AR DMA contexts

   Although 1394 OHCI specification does not impose any restriction on
   the memory size dedicated to these DMA contexts, 1394 OHCI PCI driver
   allocates pages for convenience when mapping them into either kernel
   space or userspace VMA. The driver previously used dma_alloc_pages()
   for both page allocation and mapping creation, even though this kernel
   API is rarely used. Following discussions questioning the page-oriented
   kernel API in the DMA layer, the driver has been refactored to avoid
   using this API. In addition, the use of private members in the
   allocated pages has been removed following long-standing concern.

 - Allocate variable-sized buffer for isochronous context header

   1394 OHCI PCI driver previously allocated a single page for isochronous
   context header. As a result, the buffer size for the header was fixed
   to PAGE_SIZE, which imposed a limitation on IEC 61883-1/6 packet
   streaming engine. Consequently, the ALSA PCM devices provided by
   drivers for audio and music units in IEEE 1394 bus were constrained in
   the maximum size of buffer period (64 ms in most cases). This limitation
   is resolved by dynamically allocating the header buffer with an
   arbitrary size.

----------------------------------------------------------------
Takashi Sakamoto (18):
      firewire: core: move private function declaration from public header to internal header
      firewire: core: use mutex instead of spinlock for client isochronous context
      firewire: core: code refactoring with cleanup function for isoc pages
      firewire: core: use common kernel API to allocate and release a batch of pages
      firewire: core: stop using page private to store DMA mapping address
      firewire: ohci: use MAX macro to guarantee minimum count of pages for AR contexts
      firewire: ohci: split page allocation from dma mapping
      firewire: ohci: stop using page private to store DMA mapping address
      firewire: ohci: fix index of pages for dma address to 1394 OHCI IT context
      firewire: core: add function variants for isochronous context creation
      firewire: ohci: refactor isoc single-channel state using a union
      firewire: ohci: code refactoring to use union for isoc multiple channel state
      firewire: ohci: use cleanup helper for isoc context header allocation
      firewire: core: add flags member for isochronous context structure
      firewire: ohci: allocate isoc context header by kvmalloc()
      firewire: core: provide isoc header buffer size outside card driver
      firewire: core: add fw_iso_context_create() variant with header storage size
      ALSA: firewire: remove PCM buffer size constraint from isoc context header

 drivers/firewire/core-card.c  |   4 +-
 drivers/firewire/core-cdev.c  |  71 +++++--------
 drivers/firewire/core-iso.c   | 102 +++++++++---------
 drivers/firewire/core.h       |  14 ++-
 drivers/firewire/ohci.c       | 234 ++++++++++++++++++++++++------------------
 include/linux/firewire.h      |  36 +++++--
 sound/firewire/amdtp-stream.c |  31 ++----
 7 files changed, 266 insertions(+), 226 deletions(-)
