Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E83773CC31F;
	Tue, 26 May 2026 21:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779832416; cv=none; b=szfJEqgCQi4xu3qMoDsWbOEbkdVtCdhR4lYIZFJDvOcVzjrD0kKh9+Y2xOf1y1RFSejkOWQ4rX32vfOvSUxcxljFiemNQZspIOmHTfR++DKzat7LDhskBhdstkWopAVGWIW3BMWCwCqVz5M90juyvmdcRntWJ1SGeuqqAc++504=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779832416; c=relaxed/simple;
	bh=wxtQMS4sMOUfUYyKDXmeLXjShHXn4HRb+u3wa8yEZV0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XTvTTuCmYZU8DTwn6IgSVRgmO6sV38S+kz5uoaYuk3HMRoQAiLu/8/jN4K2NH8JDTbLELLGuBcMw3NbVyL76ArkbhjyyVqE3qqnsJjSWwe4H4pRmPfda7YRYufYWRLYTxOQXZ/oQgAsUPn0V8unyOrqQyPD/iUkCE/K7g1jUmy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lni8mO2n; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lni8mO2n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32CB41F00A3C;
	Tue, 26 May 2026 21:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779832414;
	bh=QUc6ePmIQO4+BD7qyFDyswNSHGsluQfa84RM8olo+Y0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Lni8mO2nZ0WH153px137J4kx4wZ20m+8PtIc6kRlv0oGuKyMs9p4jO8F4N2uC24Qq
	 c/GUwnSc5kmYohlbp5klCGyiwFtJXyz6/a9AItu0VeBg9emDEl8Drxs3urOquJcNwv
	 MgFw1Gd1mN89AL7lo5bLktQWiobMxs08NuxwcOE6fKd3XKvtc+uHPMdmamFRNLmQpK
	 DOj8izOaVri727zMbwDkD8QCS6RPPExLQsTvtP0X2lexgskRqGaxN6MLtEuKTVyskW
	 5O7ILUjMAFOQ2Qizva86cc7KcKazNitsFXfoE3oTimi7H4O6dUEdUdyX7i0g3J86i8
	 7oGyQRitbN10A==
From: Nathan Chancellor <nathan@kernel.org>
Date: Tue, 26 May 2026 14:53:14 -0700
Subject: [PATCH 3/3] ASoC: es9356-sdca: Depend on CONFIG_SND_SOC_SDCA
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-es9356-dep-fixes-v1-3-39ac16f43d54@kernel.org>
References: <20260526-es9356-dep-fixes-v1-0-39ac16f43d54@kernel.org>
In-Reply-To: <20260526-es9356-dep-fixes-v1-0-39ac16f43d54@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Maciej Strozek <mstrozek@opensource.cirrus.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Zhang Yi <zhangyi@everest-semi.com>, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org, 
 Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1032; i=nathan@kernel.org;
 h=from:subject:message-id; bh=wxtQMS4sMOUfUYyKDXmeLXjShHXn4HRb+u3wa8yEZV0=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFliYsGTdB2+fm+LWFF6Ns724radvIano15bybafSxXf2
 hTZNEe0o5SFQYyLQVZMkaX6sepxQ8M5ZxlvnJoEM4eVCWQIAxenAEzE2YyR4eWzVy2Xr3e3VOry
 fr5ucGmZdZHrd4HI1CfRU35v4U+am8bI8Kh8bXPinus3f7od/LklRphlW/qD8vd9myYEH1zhu7u
 ajQ8A
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

When building without CONFIG_SND_SOC_SDCA, there is an error at link
time when building the es9356-sdca driver:

  ERROR: modpost: "sdca_asoc_q78_get_volsw" [sound/soc/codecs/snd-soc-es9356.ko] undefined!
  ERROR: modpost: "sdca_asoc_q78_put_volsw" [sound/soc/codecs/snd-soc-es9356.ko] undefined!

Add an explicit dependency on CONFIG_SND_SOC_SDCA to ensure these
symbols are always present when building the driver.

Fixes: 5d9cb740cd38 ("ASoC: es9356-sdca: Add ES9356 SDCA driver")
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 sound/soc/codecs/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 9b6c7c7533bb..a7e3ee80485a 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -1302,6 +1302,7 @@ config SND_SOC_ES8389
 
 config SND_SOC_ES9356
 	tristate "Everest Semi ES9356 CODEC SDW"
+	depends on SND_SOC_SDCA
 	depends on SOUNDWIRE
 	select REGMAP_SOUNDWIRE
 	select REGMAP_SOUNDWIRE_MBQ

-- 
2.54.0

