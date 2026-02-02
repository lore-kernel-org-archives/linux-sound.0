Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C6C52652B6;
	Mon,  2 Feb 2026 09:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770026078; cv=none; b=TNsJT0QiR2mmL2W5PC/wS/OO0+6fuVF32K8O6HnCyBQbRHgpNgIVItoghpOSeb3vDnwDbsgqZgUfxX5VHaxdmbIK2BbdHpYPaD/VuKGym2D7eRCUPt2ZmMV8JWKH+Pp4hcyFud031GWQYvxP67KK0FqZSS6ZQ5Yz5ClSbRsXKNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770026078; c=relaxed/simple;
	bh=gODq6iCnPw2BLii+0ItBInvfVpvHqO+YY5e/xIPP5/I=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WPO568fAZ0DiHxiN22lZTNfNHVn21hRHOa8d+CVrkU1n5dYsoI9A9kVNgoIn5Ex5OeOjC14hgAqT1yp+rjcNcfn/gj/qgekBfUWfwiQ/T7y5fDx1voumFLOBcKv82DQLYcjvR4Hh2QyVz/Kuugr6ThXwPxDBQCjn2pQECTCjsWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SjTEd310; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SjTEd310"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6B0CC116C6;
	Mon,  2 Feb 2026 09:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770026077;
	bh=gODq6iCnPw2BLii+0ItBInvfVpvHqO+YY5e/xIPP5/I=;
	h=From:To:Cc:Subject:Date:From;
	b=SjTEd310pLkCDYECYtXgEHMshKmcvf2P+2c92IstYG86ZXju5k8TJzYMU7UNDuwcF
	 geCUjNwGsusA6l4VHvWZEUB8oWOKqvvwyXWY4qvrlAP8g/rnB/PSprC07gKtdJoCy3
	 iqtIyjJCLDNGAZraLxAcYeXbylAeUI29jwASY9h3SkCJOoK3Br+ZQlroiy8xxJTT+t
	 6+n7z6foh35ggzQFlu8tSQyJUDYXWEA2e91EjUqdfs1BkB3AQN7boyQKCvXb2YVbG6
	 Xy/EBySf/rXzMcQ4fBjWU8snC4mlb7BFEuuF7j456i3722TEdft2zs8T6iGgwQH74J
	 jEOrczMWpckZA==
From: Arnd Bergmann <arnd@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Oder Chiou <oder_chiou@realtek.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: rt5575: fix SPI dependency
Date: Mon,  2 Feb 2026 10:54:12 +0100
Message-Id: <20260202095432.1234133-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

The rt5575 driver fails to link when SPI support is in a loadable
module but the codec is built-in:

x86_64-linux-ld: vmlinux.o: in function `rt5575_i2c_probe':
rt5575.c:(.text+0x9792ce): undefined reference to `rt5575_spi_get_device'
rt5575.c:(.text+0x979332): undefined reference to `rt5575_spi_fw_load'

Change the symbol in to a 'bool' and add a dependency that rules
out the broken configuration.

Fixes: 420739112e95 ("ASoC: rt5575: Add the codec driver for the ALC5575")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
Alternatively, the main driver could 'depends on SPI_MASTER || !SPI_MASTER',
with the RT5575_SPI support becoming a hidden symbol.
---
 sound/soc/codecs/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index f34d7b510c91..e78ac302da15 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -1801,9 +1801,10 @@ config SND_SOC_RT5575
 	depends on I2C
 
 config SND_SOC_RT5575_SPI
-	tristate "Realtek ALC5575 Codec - SPI"
+	bool "Realtek ALC5575 Codec - SPI"
 	depends on SPI_MASTER && I2C
 	depends on SND_SOC_RT5575
+	depends on SPI_MASTER=y || SND_SOC_RT5575=m
 
 config SND_SOC_RT5616
 	tristate "Realtek RT5616 CODEC"
-- 
2.39.5

