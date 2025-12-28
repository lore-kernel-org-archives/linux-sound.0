Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA9778F26;
	Sun, 28 Dec 2025 19:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766948747; cv=none; b=q2GTufsKN5Naz0fO9H0mURwTT1DSITmGzg+oGpcEPHUSwCZo9nQxru8DCtHBAXx9TbG++CNwUwv0JnFDVbiy1HrNe7HZN8f6IXEsq7zBeaGs856AQJSSvCuFh/H5ZT3eB3gxI1fZPq0E/c3go10OCBknTGMOLYT+SNCvJ9lGTqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766948747; c=relaxed/simple;
	bh=yIW1itpfq4CSXu2sfksEkTZjz7bdgnyASehkn9CC0VI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Gx+9CcKzoW2IQ88TdfpEefrjVtvCVZ8kItAZnIKu7aERBCsyIXBJX4blyXZlA7SS1bfL+7yRRiUgJ4VQbivSYhtrC/+04LFRhuD03Cx/xqoP/mAhOMJV5RZ3D0F9tWza1jGQDQac3tQ048NNpu27/dh3RKfKtN0S5Z/9hBfTiEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=mIpOGMon; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="mIpOGMon"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=J7ghhVjA2vNps27YFwg2duyej4YGtF2xHyL5LlKeuoY=; b=mIpOGMonqc5rADNZW/N075uvH+
	KzLfqLOPTOgk//kebaOwlv0sCQGDeKGilvP2qizEwj6xaBHQQUqWiXOWk7Q4IHrV+yvFDor4ON8yg
	9wfiYgANfAq5Zu7uqfG3v3Bo8RgMOwEEvGe1fivymm15HLpq+Cqb/h9fOaR4ZhuF0rer/jUyYQS9G
	9dEN39pp1j4SEpy2EMTCo4u7dX+JW24PEg4SxOFkrQm3bRQqU7/U6dZc3rV914Ydk8WCudQDOTCpe
	VSSabY17iEWd03GUnktWL7O3Qm5ErjZQS1XcJeon/5HMkeZSNIwPCehIn9oQVlMzV2xNBX3DasQOc
	zCVWxjnQ==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZw5G-00000002y1a-3uQp;
	Sun, 28 Dec 2025 19:05:42 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH] ASoC: amd: drop unused Kconfig symbols
Date: Sun, 28 Dec 2025 11:05:42 -0800
Message-ID: <20251228190542.2482910-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the dangling Kconfig references to CLK_FIXED_FCH since they
are not used anywhere else in the kernel source tree.

Fixes: 281ddf62f551 ("ASoC: amd: Kconfig: Select fch clock support with machine driver")
Fixes: d4c750f2c7d4 ("ASoC: amd: acp: Add generic machine driver support for ACP cards")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: linux-sound@vger.kernel.org
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>

 sound/soc/amd/Kconfig     |    2 --
 sound/soc/amd/acp/Kconfig |    1 -
 2 files changed, 3 deletions(-)

--- linux-next-20251219.orig/sound/soc/amd/acp/Kconfig
+++ linux-next-20251219/sound/soc/amd/acp/Kconfig
@@ -104,7 +104,6 @@ config SND_AMD_ASOC_ACP70
 config SND_SOC_AMD_MACH_COMMON
 	tristate
 	depends on X86 && PCI && I2C
-	select CLK_FIXED_FCH
 	select SND_SOC_RT5682_I2C
 	select SND_SOC_DMIC
 	select SND_SOC_RT1019
--- linux-next-20251219.orig/sound/soc/amd/Kconfig
+++ linux-next-20251219/sound/soc/amd/Kconfig
@@ -8,7 +8,6 @@ config SND_SOC_AMD_ACP
 
 config SND_SOC_AMD_CZ_DA7219MX98357_MACH
 	tristate "AMD CZ support for DA7219, RT5682 and MAX9835"
-	select CLK_FIXED_FCH
 	select SND_SOC_DA7219
 	select SND_SOC_RT5682_I2C
 	select SND_SOC_MAX98357A
@@ -45,7 +44,6 @@ config SND_SOC_AMD_ACP3x
 
 config SND_SOC_AMD_RV_RT5682_MACH
 	tristate "AMD RV support for RT5682"
-	select CLK_FIXED_FCH
 	select SND_SOC_RT5682_I2C
 	select SND_SOC_MAX98357A
 	select SND_SOC_CROS_EC_CODEC
