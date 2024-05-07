Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2306016DEB7
	for <linux-sound@vger.kernel.org>; Tue,  7 May 2024 15:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715097335; cv=none; b=JnwbNVSEvzv10mEpiI2LpAKuGbkFDfFX8/fyeOoSUDsAItVVKBDVTFrNJabGgPrVdL8FYdcAf5jFGQFKa6Q9oTCbINg+bRu/vjpKiMBiVvn/CIUS9wzJxKIYvSUt9/d2YLl5n5L9RCFbrzf/BYBjeynXrHjBWc1/2yoV658mlGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715097335; c=relaxed/simple;
	bh=1Tpy5wthdeEIP98j79dXbFWQf8w3OAq5mBPdkDfHkGY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SEtbP+SH0hDz0zCgASFtjwkDesIyF9vpQSi3SrsuV8mp99y7mX4MNxRQRVnf6TsiA5E5Pw+rVJ5Hg8SOfcJyJjlpW7l21mxbVS0bujfUPjz0QaoXhQjk4rp0RA1fm7eDr2CP5lQ11la7XX0WxHv/YUOgygjlTr5ZZL3s0BGn2V0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rIwKV3TL; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=oSr7lf0o; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rIwKV3TL; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=oSr7lf0o; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rIwKV3TL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="oSr7lf0o";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rIwKV3TL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="oSr7lf0o"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0D26221CE8;
	Tue,  7 May 2024 15:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715097331; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x108V8adf2alhKfRBJ+7Aw9Su5fdq/xAkCUp9NstYb8=;
	b=rIwKV3TL3WpxnovpGNiIo+glA5/JoFdsKjgyDrpVWk15OqiB4ptGlPff665zH2leTiWFQh
	6Q3u7wI9PY1vxddecojPpn8fsLh2f2N0NlpQnJCzGNSWOjddl5QROAvBner86PWeFTXkjH
	Ub7F7DwxG90QqukgpyQgHKRbQSEa/F4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715097331;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x108V8adf2alhKfRBJ+7Aw9Su5fdq/xAkCUp9NstYb8=;
	b=oSr7lf0oztETVU51wXGcpexe3peCKxLGuoWk5EtHDd9QZQsVU3gLpT+NTYw9dimPvS+g3k
	MrJnlHE1wmT25wAQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715097331; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x108V8adf2alhKfRBJ+7Aw9Su5fdq/xAkCUp9NstYb8=;
	b=rIwKV3TL3WpxnovpGNiIo+glA5/JoFdsKjgyDrpVWk15OqiB4ptGlPff665zH2leTiWFQh
	6Q3u7wI9PY1vxddecojPpn8fsLh2f2N0NlpQnJCzGNSWOjddl5QROAvBner86PWeFTXkjH
	Ub7F7DwxG90QqukgpyQgHKRbQSEa/F4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715097331;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x108V8adf2alhKfRBJ+7Aw9Su5fdq/xAkCUp9NstYb8=;
	b=oSr7lf0oztETVU51wXGcpexe3peCKxLGuoWk5EtHDd9QZQsVU3gLpT+NTYw9dimPvS+g3k
	MrJnlHE1wmT25wAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E3F0B13A3C;
	Tue,  7 May 2024 15:55:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id sBBjNvJOOmaNXQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 07 May 2024 15:55:30 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 04/34] ASoC: amd: Use *-y instead of *-objs in Makefile
Date: Tue,  7 May 2024 17:55:08 +0200
Message-ID: <20240507155540.24815-5-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240507155540.24815-1-tiwai@suse.de>
References: <20240507155540.24815-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-6.80 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -6.80
X-Spam-Flag: NO

*-objs suffix is reserved rather for (user-space) host programs while
usually *-y suffix is used for kernel drivers (although *-objs works
for that purpose for now).

Let's correct the old usages of *-objs in Makefiles.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/amd/Makefile         | 12 ++++++------
 sound/soc/amd/acp/Makefile     | 26 +++++++++++++-------------
 sound/soc/amd/ps/Makefile      |  8 ++++----
 sound/soc/amd/raven/Makefile   |  6 +++---
 sound/soc/amd/renoir/Makefile  |  6 +++---
 sound/soc/amd/rpl/Makefile     |  2 +-
 sound/soc/amd/vangogh/Makefile |  8 ++++----
 sound/soc/amd/yc/Makefile      |  6 +++---
 8 files changed, 37 insertions(+), 37 deletions(-)

diff --git a/sound/soc/amd/Makefile b/sound/soc/amd/Makefile
index ebbe49c2bbff..4f89d962cce2 100644
--- a/sound/soc/amd/Makefile
+++ b/sound/soc/amd/Makefile
@@ -1,10 +1,10 @@
 # SPDX-License-Identifier: GPL-2.0-only
-acp_audio_dma-objs := acp-pcm-dma.o
-snd-soc-acp-da7219mx98357-mach-objs := acp-da7219-max98357a.o
-snd-soc-acp-rt5645-mach-objs := acp-rt5645.o
-snd-soc-acp-es8336-mach-objs := acp-es8336.o
-snd-soc-acp-rt5682-mach-objs := acp3x-rt5682-max9836.o
-snd-acp-config-objs := acp-config.o
+acp_audio_dma-y := acp-pcm-dma.o
+snd-soc-acp-da7219mx98357-mach-y := acp-da7219-max98357a.o
+snd-soc-acp-rt5645-mach-y := acp-rt5645.o
+snd-soc-acp-es8336-mach-y := acp-es8336.o
+snd-soc-acp-rt5682-mach-y := acp3x-rt5682-max9836.o
+snd-acp-config-y := acp-config.o
 
 obj-$(CONFIG_SND_SOC_AMD_ACP) += acp_audio_dma.o
 obj-$(CONFIG_SND_SOC_AMD_CZ_DA7219MX98357_MACH) += snd-soc-acp-da7219mx98357-mach.o
diff --git a/sound/soc/amd/acp/Makefile b/sound/soc/amd/acp/Makefile
index 1fd581a2aa33..b068bf1f920e 100644
--- a/sound/soc/amd/acp/Makefile
+++ b/sound/soc/amd/acp/Makefile
@@ -5,23 +5,23 @@
 # Copyright(c) 2021 Advanced Micro Devices, Inc. All rights reserved.
 
 #common acp driver
-snd-acp-pcm-objs     := acp-platform.o
-snd-acp-i2s-objs     := acp-i2s.o
-snd-acp-pdm-objs     := acp-pdm.o
-snd-acp-legacy-common-objs   := acp-legacy-common.o
-snd-acp-pci-objs     := acp-pci.o
-snd-amd-sdw-acpi-objs := amd-sdw-acpi.o
+snd-acp-pcm-y     := acp-platform.o
+snd-acp-i2s-y     := acp-i2s.o
+snd-acp-pdm-y     := acp-pdm.o
+snd-acp-legacy-common-y   := acp-legacy-common.o
+snd-acp-pci-y     := acp-pci.o
+snd-amd-sdw-acpi-y := amd-sdw-acpi.o
 
 #platform specific driver
-snd-acp-renoir-objs     := acp-renoir.o
-snd-acp-rembrandt-objs  := acp-rembrandt.o
-snd-acp63-objs := acp63.o
-snd-acp70-objs := acp70.o
+snd-acp-renoir-y     := acp-renoir.o
+snd-acp-rembrandt-y  := acp-rembrandt.o
+snd-acp63-y := acp63.o
+snd-acp70-y := acp70.o
 
 #machine specific driver
-snd-acp-mach-objs     := acp-mach-common.o
-snd-acp-legacy-mach-objs     := acp-legacy-mach.o acp3x-es83xx/acp3x-es83xx.o
-snd-acp-sof-mach-objs     := acp-sof-mach.o
+snd-acp-mach-y     := acp-mach-common.o
+snd-acp-legacy-mach-y     := acp-legacy-mach.o acp3x-es83xx/acp3x-es83xx.o
+snd-acp-sof-mach-y     := acp-sof-mach.o
 
 obj-$(CONFIG_SND_SOC_AMD_ACP_PCM) += snd-acp-pcm.o
 obj-$(CONFIG_SND_SOC_AMD_ACP_I2S) += snd-acp-i2s.o
diff --git a/sound/soc/amd/ps/Makefile b/sound/soc/amd/ps/Makefile
index b3c254886fd9..b5efb1c5382c 100644
--- a/sound/soc/amd/ps/Makefile
+++ b/sound/soc/amd/ps/Makefile
@@ -1,9 +1,9 @@
 # SPDX-License-Identifier: GPL-2.0-only
 # Pink Sardine platform Support
-snd-pci-ps-objs := pci-ps.o
-snd-ps-pdm-dma-objs := ps-pdm-dma.o
-snd-soc-ps-mach-objs := ps-mach.o
-snd-ps-sdw-dma-objs := ps-sdw-dma.o
+snd-pci-ps-y := pci-ps.o
+snd-ps-pdm-dma-y := ps-pdm-dma.o
+snd-soc-ps-mach-y := ps-mach.o
+snd-ps-sdw-dma-y := ps-sdw-dma.o
 
 obj-$(CONFIG_SND_SOC_AMD_PS) += snd-pci-ps.o
 obj-$(CONFIG_SND_SOC_AMD_PS) += snd-ps-pdm-dma.o
diff --git a/sound/soc/amd/raven/Makefile b/sound/soc/amd/raven/Makefile
index 62c22b6ed95a..b2ea030cbf25 100644
--- a/sound/soc/amd/raven/Makefile
+++ b/sound/soc/amd/raven/Makefile
@@ -1,8 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0+
 # Raven Ridge platform Support
-snd-pci-acp3x-objs	:= pci-acp3x.o
-snd-acp3x-pcm-dma-objs	:= acp3x-pcm-dma.o
-snd-acp3x-i2s-objs	:= acp3x-i2s.o
+snd-pci-acp3x-y		:= pci-acp3x.o
+snd-acp3x-pcm-dma-y	:= acp3x-pcm-dma.o
+snd-acp3x-i2s-y		:= acp3x-i2s.o
 obj-$(CONFIG_SND_SOC_AMD_ACP3x)	 += snd-pci-acp3x.o
 obj-$(CONFIG_SND_SOC_AMD_ACP3x)	 += snd-acp3x-pcm-dma.o
 obj-$(CONFIG_SND_SOC_AMD_ACP3x)	 += snd-acp3x-i2s.o
diff --git a/sound/soc/amd/renoir/Makefile b/sound/soc/amd/renoir/Makefile
index 4a82690aec16..76b4a9c3e24f 100644
--- a/sound/soc/amd/renoir/Makefile
+++ b/sound/soc/amd/renoir/Makefile
@@ -1,8 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0+
 # Renoir platform Support
-snd-rn-pci-acp3x-objs	:= rn-pci-acp3x.o
-snd-acp3x-pdm-dma-objs	:= acp3x-pdm-dma.o
-snd-acp3x-rn-objs	:= acp3x-rn.o
+snd-rn-pci-acp3x-y	:= rn-pci-acp3x.o
+snd-acp3x-pdm-dma-y	:= acp3x-pdm-dma.o
+snd-acp3x-rn-y		:= acp3x-rn.o
 obj-$(CONFIG_SND_SOC_AMD_RENOIR)	+= snd-rn-pci-acp3x.o
 obj-$(CONFIG_SND_SOC_AMD_RENOIR)	+= snd-acp3x-pdm-dma.o
 obj-$(CONFIG_SND_SOC_AMD_RENOIR_MACH)	+= snd-acp3x-rn.o
diff --git a/sound/soc/amd/rpl/Makefile b/sound/soc/amd/rpl/Makefile
index 11a33a05e94b..a3825c5be4e7 100644
--- a/sound/soc/amd/rpl/Makefile
+++ b/sound/soc/amd/rpl/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0+
 # RPL platform Support
-snd-rpl-pci-acp6x-objs	:= rpl-pci-acp6x.o
+snd-rpl-pci-acp6x-y	:= rpl-pci-acp6x.o
 
 obj-$(CONFIG_SND_SOC_AMD_RPL_ACP6x) += snd-rpl-pci-acp6x.o
diff --git a/sound/soc/amd/vangogh/Makefile b/sound/soc/amd/vangogh/Makefile
index c9e53e04e247..7eae82faa392 100644
--- a/sound/soc/amd/vangogh/Makefile
+++ b/sound/soc/amd/vangogh/Makefile
@@ -1,9 +1,9 @@
 # SPDX-License-Identifier: GPL-2.0+
 # Vangogh platform Support
-snd-pci-acp5x-objs	:= pci-acp5x.o
-snd-acp5x-i2s-objs	:= acp5x-i2s.o
-snd-acp5x-pcm-dma-objs	:= acp5x-pcm-dma.o
-snd-soc-acp5x-mach-objs := acp5x-mach.o
+snd-pci-acp5x-y		:= pci-acp5x.o
+snd-acp5x-i2s-y		:= acp5x-i2s.o
+snd-acp5x-pcm-dma-y	:= acp5x-pcm-dma.o
+snd-soc-acp5x-mach-y	:= acp5x-mach.o
 
 obj-$(CONFIG_SND_SOC_AMD_ACP5x) += snd-pci-acp5x.o
 obj-$(CONFIG_SND_SOC_AMD_ACP5x)	+= snd-acp5x-i2s.o
diff --git a/sound/soc/amd/yc/Makefile b/sound/soc/amd/yc/Makefile
index dc2974440388..7a0a3a410b2d 100644
--- a/sound/soc/amd/yc/Makefile
+++ b/sound/soc/amd/yc/Makefile
@@ -1,8 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0+
 # Yellow Carp platform Support
-snd-pci-acp6x-objs	:= pci-acp6x.o
-snd-acp6x-pdm-dma-objs	:= acp6x-pdm-dma.o
-snd-soc-acp6x-mach-objs := acp6x-mach.o
+snd-pci-acp6x-y		:= pci-acp6x.o
+snd-acp6x-pdm-dma-y	:= acp6x-pdm-dma.o
+snd-soc-acp6x-mach-y	:= acp6x-mach.o
 
 obj-$(CONFIG_SND_SOC_AMD_ACP6x) += snd-pci-acp6x.o
 obj-$(CONFIG_SND_SOC_AMD_ACP6x) += snd-acp6x-pdm-dma.o
-- 
2.43.0

