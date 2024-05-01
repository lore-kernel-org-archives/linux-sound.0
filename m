Received: from wfout1-smtp.messagingengine.com (wfout1-smtp.messagingengine.com [64.147.123.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC677629E4
	for <linux-sound@vger.kernel.org>; Wed,  1 May 2024 11:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714563293; cv=none; b=fpkvtShMuLEErXzFsASDKuxruJMMMCE9mH2RAAC2Ol2kin1lDp6CPCEYSdy9mSGyPD4btpSrivS9yroHfDETIhuEusVJmY+30XuxSNWUlFC6BAQbEKkDWrKF0cIozUWtH2SAyGcB1wcHedjlTKIIVp2qGQyYRP5fgSORTgUo7jU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714563293; c=relaxed/simple;
	bh=WCmTWgNK9QbDRjUX0Lhb8J0LAdq7qNWgJ1luZbRbFTw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SGgqwcbJxm3Xqh7xZCKNgJP1xAsGt2Eq9oHNn7IlztDjDdgfVYuTS4gvVON9pnhCaPKjHDF3sRh4FaVkclPgyJ8xwZsJVBFVXIaH7gcjxpCZFfB/e9aSrnz2CxYg9y25SERvpdEtsFzjyP4hyq6cv3ity6kjMdwfYIA9EkWMNnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=KZkAuAwa; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=WQDT1cAe; arc=none smtp.client-ip=64.147.123.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="KZkAuAwa";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="WQDT1cAe"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailfout.west.internal (Postfix) with ESMTP id C86191C000E3;
	Wed,  1 May 2024 07:34:50 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Wed, 01 May 2024 07:34:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm3; t=1714563290; x=1714649690; bh=Ys3qwsRWjt
	pSd5vFGNKCQVp3X5FcMqy+VlDp49YYPs4=; b=KZkAuAwag5PQNldZUxgWK4c0er
	vgNjvcEahSB7Avyf5SVJjIFoGoGXZikcKHsr/dyXO0Qc1UP2L5gXKhJKI8WKCSoS
	OuOTqAsgptzHgP08XNTR0Gi7UI++MHmOkiSDoAXPvw7F9AA9bu3eYAvbRaCNiHuN
	ktyF1Bd6vsdaib7WzqEV+dXqenykeNGJ7/y9Xy497I3tod+vG7SiTEcGc+p6siFh
	ybh4z7fiVX6LFGTvzEhkaXidGrD0Nf5b5K5yA8kuN5+V3TVkr1lkjYORLNWHjr9b
	ZX+W9WaDmFyuGlR/c/RYsvs0mcAImGIaNper93Kbv7gt0ic2wc+3mxnYYM9g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1714563290; x=1714649690; bh=Ys3qwsRWjtpSd5vFGNKCQVp3X5Fc
	Mqy+VlDp49YYPs4=; b=WQDT1cAeOWUelw7LsHImlWKJ8pLJIKkH0n1tyqExyFNW
	b8qJLHEwKEM6HxyS6qjGzB4BDBzG4QyGu72lXha53WOs65FA349fARBVJYus0ljp
	hv5yrSDLQ6cc/pvlNInw4q+ZEwTFTGcdIGAchF0mgOo6y+DUZUEkTsuXhd9TqNZI
	Lqh31ZwfIFj0PyeaK39DUr24xWjwJH5CilaZ3f4Q4PU3fBHMZL21nvFDWdXqwG2J
	LO6+0oy+kQjea87cV7LkcNptEWdL3/9NAzqysGMNSN2LJfW+5B3xgXr74tCCXZiU
	UtF38LZjnLXpIAo+CnufdMAku0gxErEJy69QVyn50A==
X-ME-Sender: <xms:2SgyZjtZodkbL0hBSViTPOgnBWS4oDRDpLgPIe4f5YGoCXkJ5ggMaQ>
    <xme:2SgyZkccOFQqcecP2Bs0hXNC4Ggce7Uy-m_m3C7XUQr3XdgbWWoc7wfUMJoiu8xjb
    G1zQVADdD0VbzAhD3s>
X-ME-Received: <xmr:2SgyZmwsIOAO-h1z0NNzNpeDglgKxfzoq0a3qoKp8TtIVL8N1gHm7P8D9uFiJpfyCS_EnBTsZaxMt_J6dUUDPSBmoOqf1Tee_oeSMSh7qYsTthc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdduhedgjeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertd
    ertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghs
    hhhisehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpeeggfehleehje
    eileehveefkefhtdeffedtfeeghfekffetudevjeegkeevhfdvueenucffohhmrghinhep
    khgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:2SgyZiNeDzZvTiM-IF_-B8PAfC4PMWbfRF8W0Ghxi_40DfX9zD4noQ>
    <xmx:2SgyZj9LpjGtopYo2RY8ytUMgaLzacr-n8dtAQnaTberYAZe1KargA>
    <xmx:2SgyZiVAYwyWP7JfnQV8esI_yla6ajoUyK3RukAw7vPUN6TvdWE1tQ>
    <xmx:2SgyZkcfnRzZlGNjyfrAdgTxso_AsCLNrYMbBb4RH0nYNWGJXPegQA>
    <xmx:2igyZmalo2PYi2K2UXDBCG2ngS0WLVm1joZlQpevsDGh_oOgAy3JLH2h>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 1 May 2024 07:34:48 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Cc: perex@perex.cz,
	linux-sound@vger.kernel.org
Subject: [PATCH 0/4] ALSA: pcm: obsolete sync member in runtime structure
Date: Wed,  1 May 2024 20:34:41 +0900
Message-ID: <20240501113445.100817-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Seven years ago, in Linux kernel version 4.13, the data of
snd_pcm_sync_id union is not exposed to user space anymore, by a commit
e11f0f90a626 ("ALSA: pcm: remove SNDRV_PCM_IOCTL1_INFO internal command").
From then, we have received no issued related to it. It means that the
data is neither used by any practical applications nor drivers, thus it
can be removed.

This series of change is to obsolete the usage of the union data
in PCM core function. The kernel API, snd_pcm_set_sync(), is removed.
and the 'sync' member of snd_pcm_runtime structure is removed. Finally,
some notes are added to UAPI header.

The removal of sync field has a side effect for emu10k driver, since p16v
chip code sets the data by hand. Its removal requires any deliberate
discussion, but the calm in seven years would satisfy the condition of
it.


The patch comment sent by Jaroslav[1] refers to the reinvention of the
union data, but as the part of hardware configuration step. If it
proceeds, the UAPI note would be modified simply.

[1] https://lore.kernel.org/linux-sound/20240430161012.4011064-1-perex@perex.cz/

Takashi Sakamoto (4):
  ALSA: pcm: delete snd_pcm_set_sync() in .open callback
  ALSA: pci: emu10k: delete usage of 'struct snd_pcm_runtime.sync'
  ALSA: core: delete sync member from snd_pcm_runtime structure
  ALSA: pcm: add notes to deprecate snd_pcm_sync_id in PCM interface for
    user space

 include/sound/pcm.h                      |  3 ---
 include/uapi/sound/asound.h              |  5 +++--
 sound/core/pcm_lib.c                     | 17 -----------------
 sound/firewire/bebob/bebob_pcm.c         |  1 -
 sound/firewire/dice/dice-pcm.c           |  1 -
 sound/firewire/digi00x/digi00x-pcm.c     |  1 -
 sound/firewire/fireface/ff-pcm.c         |  1 -
 sound/firewire/fireworks/fireworks_pcm.c |  1 -
 sound/firewire/motu/motu-pcm.c           |  1 -
 sound/firewire/oxfw/oxfw-pcm.c           |  1 -
 sound/firewire/tascam/tascam-pcm.c       |  1 -
 sound/isa/wss/wss_lib.c                  |  2 --
 sound/pci/ali5451/ali5451.c              |  1 -
 sound/pci/asihpi/asihpi.c                |  2 --
 sound/pci/ca0106/ca0106_main.c           |  1 -
 sound/pci/echoaudio/echoaudio.c          |  1 -
 sound/pci/emu10k1/p16v.c                 | 11 +----------
 sound/pci/ens1370.c                      |  3 ---
 sound/pci/hda/hda_controller.c           |  1 -
 sound/pci/ice1712/ice1712.c              |  2 --
 sound/pci/ice1712/ice1724.c              |  5 -----
 sound/pci/lx6464es/lx6464es.c            |  1 -
 sound/pci/oxygen/oxygen_pcm.c            |  1 -
 sound/pci/pcxhr/pcxhr.c                  |  1 -
 sound/pci/rme32.c                        |  4 ----
 sound/pci/rme96.c                        |  4 ----
 sound/pci/rme9652/hdsp.c                 |  2 --
 sound/pci/rme9652/hdspm.c                |  1 -
 sound/pci/rme9652/rme9652.c              |  2 --
 sound/pci/sis7019.c                      |  2 --
 sound/pci/trident/trident_main.c         |  2 --
 sound/soc/intel/avs/pcm.c                |  1 -
 sound/soc/intel/skylake/skl-pcm.c        |  1 -
 sound/sparc/cs4231.c                     |  2 --
 34 files changed, 4 insertions(+), 82 deletions(-)

-- 
2.43.0

