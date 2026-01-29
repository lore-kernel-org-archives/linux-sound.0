Received: from mail-05.mail-europe.com (mail-05.mail-europe.com [85.9.206.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 573C71E4BE;
	Thu, 29 Jan 2026 14:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.9.206.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769696114; cv=none; b=Mzruy5j2vgY2QMQRsEoDLK5uSVkQ+AIKnhyjDvsvHXOUFYbbZ6Pq0yd8SDeoqmER3y+0S0Z4I3kpJx2tfzlwBioC8MZF01YhvaRefyw+Y+xuuWdiX8Nx1QrOOib0rJW8iARm7k7nnvltN5gRKGe1igUrD7oVQHwHijwuAQPCdak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769696114; c=relaxed/simple;
	bh=lE35BZFKBHFpzacSgUEHTr6IL+e3e+W/32GvvBpHXKY=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=l/aVQ/8uSmNFRbPy8qIpgw3c7INRDfeEwxQNfYAq+j4d92LT6aG92d/3QlPyiv/Kx8A1zqvlrRMf6pADUdRLFxQ8qXFz5tR2WV3mIHSAs0AqVPOqEXQ72P4nobhQVzqaRYMpeMMudlf03uDQoQyLA9emH3MBTJ5w2LDeuedoF+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fau.re; spf=pass smtp.mailfrom=fau.re; dkim=pass (2048-bit key) header.d=fau.re header.i=@fau.re header.b=KhaxzW0a; arc=none smtp.client-ip=85.9.206.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fau.re
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fau.re
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fau.re header.i=@fau.re header.b="KhaxzW0a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fau.re;
	s=protonmail; t=1769696101; x=1769955301;
	bh=Bcq2XzWDfKTwX0nWV5gxxO1pMZFp8rhU5mWXRdo6XXk=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=KhaxzW0akIoKmoP5CThiAJ2E5GM24tdZE1/+O4yNkrigk4Z4aRaiMltPXul9NEdyy
	 uecvRe5sf55iIYDkxYkbR46ukOynipemmkP8MTRDjwrUP2BRZJQ0MbyyXJNj1bGz/y
	 rwV1EZsdTxa68rVmAJtAvfro1yvpPxGmCBGIIvdKM7PsEwrzV0WFtmEJwVgGr9f+Sa
	 WefFH7T9OWV/CbjDwIX331XIZKnRt10Syo/o6xrFTptWyItcmJVSzRwMrDYV/iMGVK
	 NRMBXtPmfeAbDXBSYlPMSMCrVRHUIO2Rlre12htpbWIib6QunoJlJlqIUpcEu/3rt3
	 28FGkEXzv2+Bg==
Date: Thu, 29 Jan 2026 14:14:54 +0000
To: ckeepax@opensource.cirrus.com, mstrozek@opensource.cirrus.com
From: Boris Faure <boris@fau.re>
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev, lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org, patches@opensource.cirrus.com, linux-kernel@vger.kernel.org, Boris Faure <boris@fau.re>
Subject: [PATCH] ASoC: sdca: Fix missing regmap dependencies in Kconfig
Message-ID: <20260129141419.13843-1-boris@fau.re>
Feedback-ID: 104543335:user:proton
X-Pm-Message-ID: 04e9712832867642dfc61419732e49e2e8d89485
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The SDCA modules failed to build with modpost errors:

  ERROR: modpost: "__devm_regmap_init_sdw" [sound/soc/sdca/snd-soc-sdca-cla=
ss.ko] undefined!
  ERROR: modpost: "__devm_regmap_init_sdw_mbq" [sound/soc/sdca/snd-soc-sdca=
-class-function.ko] undefined!

The issue occurs because:
- sdca_class.c calls devm_regmap_init_sdw() which requires REGMAP_SOUNDWIRE
- sdca_class_function.c calls devm_regmap_init_sdw_mbq_cfg() which requires=
 REGMAP_SOUNDWIRE_MBQ

However, the Kconfig didn't select these dependencies, causing the symbols
to be unavailable when the SDCA modules are built.

Fix this by adding:
- select REGMAP_SOUNDWIRE to SND_SOC_SDCA_CLASS
- select REGMAP_SOUNDWIRE_MBQ to SND_SOC_SDCA_CLASS_FUNCTION

This ensures the required regmap drivers are enabled when building SDCA sup=
port.

Configuration after fix:
  CONFIG_SND_SOC_SDCA_CLASS=3Dm
  CONFIG_SND_SOC_SDCA_CLASS_FUNCTION=3Dm
  CONFIG_REGMAP_SOUNDWIRE=3Dm
  CONFIG_REGMAP_SOUNDWIRE_MBQ=3Dm

Signed-off-by: Boris Faure <boris@fau.re>
---
 sound/soc/sdca/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/sdca/Kconfig b/sound/soc/sdca/Kconfig
index fabb69a3450d..87ab2895096c 100644
--- a/sound/soc/sdca/Kconfig
+++ b/sound/soc/sdca/Kconfig
@@ -46,12 +46,14 @@ config SND_SOC_SDCA_CLASS
 =09select SND_SOC_SDCA_FDL
 =09select SND_SOC_SDCA_HID
 =09select SND_SOC_SDCA_IRQ
+=09select REGMAP_SOUNDWIRE
 =09help
 =09  This option enables support for the SDCA Class driver which should
 =09  support any class compliant SDCA part.
=20
 config SND_SOC_SDCA_CLASS_FUNCTION
 =09tristate
+=09select REGMAP_SOUNDWIRE_MBQ
 =09help
 =09  This option enables support for the SDCA Class Function drivers,
 =09  these implement the individual functions of the SDCA Class driver.
--=20
2.52.0


