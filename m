Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E9F016C439
	for <linux-sound@vger.kernel.org>; Tue,  7 May 2024 15:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715097340; cv=none; b=h/yH489Lt9uTK526wOcYMakHoPxerCGfMx5ktknfVGqrvtk4Zw/qa5gxTPoLgYGnqxcvUFYIK3E7HFICWJPjXya2uCZ2imlpqob54QB0Tlbk77Woj/pZbTaTkYxu6acdb4htKhrlA4UhD/B8vV3fcIHgt0xEtjMOnIgKA/g2imE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715097340; c=relaxed/simple;
	bh=TWJ4zzx2R+r7d5rNKAfsU/EpZ0NfqkPtZpdh+CLdFgc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pd06YQNHYE2B245byKEsQaXjCeN3xyTgjxSoHCINY56Qr8tqD7tH/ycn5z1bd1tS5kQFTfFAkEQ7PI3k0kulHLFY9NNi8VqzgnUbCO8WToHNhQxH0j/ttddV4GL/Vnptff45rQiywbZ4A8J5D105QKIapkvaFxkjfZ08UBPK+1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id EA8F922167;
	Tue,  7 May 2024 15:55:33 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C97D413A3A;
	Tue,  7 May 2024 15:55:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id sF79L/VOOmaNXQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 07 May 2024 15:55:33 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 21/34] ASoC: rockchip: Use *-y instead of *-objs in Makefile
Date: Tue,  7 May 2024 17:55:25 +0200
Message-ID: <20240507155540.24815-22-tiwai@suse.de>
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
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: EA8F922167
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action

*-objs suffix is reserved rather for (user-space) host programs while
usually *-y suffix is used for kernel drivers (although *-objs works
for that purpose for now).

Let's correct the old usages of *-objs in Makefiles.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/rockchip/Makefile | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/soc/rockchip/Makefile b/sound/soc/rockchip/Makefile
index 30c57c0d7660..2ee9c08131d1 100644
--- a/sound/soc/rockchip/Makefile
+++ b/sound/soc/rockchip/Makefile
@@ -1,19 +1,19 @@
 # SPDX-License-Identifier: GPL-2.0
 # ROCKCHIP Platform Support
-snd-soc-rockchip-i2s-objs := rockchip_i2s.o
-snd-soc-rockchip-i2s-tdm-objs := rockchip_i2s_tdm.o
-snd-soc-rockchip-pdm-objs := rockchip_pdm.o
-snd-soc-rockchip-spdif-objs := rockchip_spdif.o
+snd-soc-rockchip-i2s-y := rockchip_i2s.o
+snd-soc-rockchip-i2s-tdm-y := rockchip_i2s_tdm.o
+snd-soc-rockchip-pdm-y := rockchip_pdm.o
+snd-soc-rockchip-spdif-y := rockchip_spdif.o
 
 obj-$(CONFIG_SND_SOC_ROCKCHIP_I2S) += snd-soc-rockchip-i2s.o
 obj-$(CONFIG_SND_SOC_ROCKCHIP_PDM) += snd-soc-rockchip-pdm.o
 obj-$(CONFIG_SND_SOC_ROCKCHIP_SPDIF) += snd-soc-rockchip-spdif.o
 obj-$(CONFIG_SND_SOC_ROCKCHIP_I2S_TDM) += snd-soc-rockchip-i2s-tdm.o
 
-snd-soc-rockchip-max98090-objs := rockchip_max98090.o
-snd-soc-rockchip-rt5645-objs := rockchip_rt5645.o
-snd-soc-rk3288-hdmi-analog-objs := rk3288_hdmi_analog.o
-snd-soc-rk3399-gru-sound-objs := rk3399_gru_sound.o
+snd-soc-rockchip-max98090-y := rockchip_max98090.o
+snd-soc-rockchip-rt5645-y := rockchip_rt5645.o
+snd-soc-rk3288-hdmi-analog-y := rk3288_hdmi_analog.o
+snd-soc-rk3399-gru-sound-y := rk3399_gru_sound.o
 
 obj-$(CONFIG_SND_SOC_ROCKCHIP_MAX98090) += snd-soc-rockchip-max98090.o
 obj-$(CONFIG_SND_SOC_ROCKCHIP_RT5645) += snd-soc-rockchip-rt5645.o
-- 
2.43.0

