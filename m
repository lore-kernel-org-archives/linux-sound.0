Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 168E535CB7B;
	Tue, 19 May 2026 20:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779223101; cv=none; b=NpRCaeUAcbrKsMN1fkzvsIMaLGpoIR4ILnYAb0CsokgelywNM/J5bWW+5OUIQzHwpppsFC1AHVaNoY9v/oZhi/mIT4ELznBvQrrKUEC35SsS5BWARHTzv8XdPH98jQ5CyTB2zQN6z54YESMs6C7OCJDqwMoRfYOUJpuzvZALScA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779223101; c=relaxed/simple;
	bh=AbF4hUyxJaerisyyOGNy1t90aNjMUnyAqK7LgZKcbRc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=JGOkDnEkHo5uzXGOsvidBxXBLQQ2i2HH20pF3e7rCKETjl131A3UWWLMpq3kV24J+bv8bv9yQSmDcVrRlHgsTGoPk4uly/A0AwXxZFWEK3MHqYDNXefcI3fnfHI9gkgtncKjT3bI/N6gi7jMNBDsF/GnUBSUBy6to/NWoRnHKIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FQw0kDUT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FQw0kDUT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97B1B1F000E9;
	Tue, 19 May 2026 20:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779223099;
	bh=clxwfLO5YlC84E9N2mWrz3AKVjnuUlv/1cGIqvrWkaQ=;
	h=From:To:Cc:Subject:Date;
	b=FQw0kDUT+AZ1+TxCndLiIpGJuS/6RRjFBDrYMkLNEDOYAR8qN7nmR3/b2eTJlZLYl
	 CwyVy3aVqHBP/1R2OEiwOsHsod8j8FnV6zx8dJSDbTquAii0rhu6aI6MhX/7t1YAJk
	 BeB9zRNxRBSrQY4q9L3isqOvqA1hveRPTcHrh0iGGnvq8ZFXpghZ7dzVBG1NhYbrdg
	 rk6/1wIg06QSdsnzSjf5NsWLZEDDNv6D3Iq98g96r2cu1sBoIDdGVdQTWQPucynQOE
	 14Cs4thF4M+WZ7wQYNJkxtHtny+ak7/J6BYRiBd4FcU9f1sWU78pfU6Lz7DtMyTuNN
	 lozrIEBQWH3Nw==
From: Arnd Bergmann <arnd@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Zhang Yi <zhangyi@everest-semi.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: es9356-sdca: add SND_SOC_SDCA dependencies
Date: Tue, 19 May 2026 22:37:55 +0200
Message-Id: <20260519203815.1342154-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

Without this, the driver fails to link:

x86_64-linux-ld: sound/soc/codecs/es9356.o:(.rodata+0x4208): undefined reference to `sdca_asoc_q78_put_volsw'

Fixes: 5d9cb740cd38 ("ASoC: es9356-sdca: Add ES9356 SDCA driver")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 sound/soc/codecs/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 5fdd0334c355..25294f3c7bc0 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -1303,6 +1303,7 @@ config SND_SOC_ES8389
 config SND_SOC_ES9356
         tristate "Everest Semi ES9356 CODEC SDW"
         depends on SOUNDWIRE
+	depends on SND_SOC_SDCA
         select REGMAP_SOUNDWIRE
         select REGMAP_SOUNDWIRE_MBQ
 
-- 
2.39.5

