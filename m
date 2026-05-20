Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 187583043B2
	for <linux-sound@vger.kernel.org>; Wed, 20 May 2026 23:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779318867; cv=none; b=tlt3GOSPU1EyGtdv2vDQoe8HMMk2QBY7T2U9nFD3hl1YBYx1UPzq1kY5yv7wmd/q2F+wplYP0su3UQf81s0pjL44s8YeSt4hLAZz+SHTTChmN2EhqnVO6NP8979O+aAgCTl5RixSMzGzrABfDq6hQV+jgSjiGwtxdxH8l9japH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779318867; c=relaxed/simple;
	bh=VxNht73QnyASAppK78BzoiAEviCI7ndvCk3Qjm8xLLM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=forBde0QU5MmGFR0v6qguSLwyLhx4Kf4IQQHjjQ/cJaY9kSMP5ChyDmGdYJxVkSAMVx9iQV7BGEAQmKhCW3tjYWsuoiIGiZ9sbTlRqO8faWxeTbQBXuTgY4umRKoKWBtVmmwMWOiERqgxGbw9vwpe9Luewi57H9QVts7JDVbIRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PKq817WW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PKq817WW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59D281F000E9;
	Wed, 20 May 2026 23:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779318865;
	bh=Z5GF+BGPpdZTbPuC0CJ4bfKEFSzC0/P4Vp4Wh/3f1kQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PKq817WWpOwP5rj+Yepin8pEKwEAZJ8D5DU43Famy5zpvycWyxkdzfEwbycLRuNTC
	 Pe6LQwqfs3uQU84tGQ6lQyVDQ+8MAoNiSMT8yTefxqmWDlycADwUjYCNQ5RWZUqWkj
	 r1/Xtx1B69U5JwBYtuKufwX9wQR03sw0AdQedPm0OqTi6trYLcVIhmOsd+oRuUi3Gg
	 V+aVWTI60d6BUqMImujA7mGTZIlo468tLp7mf8Cb3HLPnABCDPWti8TXvggCP0p2+u
	 xhqnnn30WhHBpKBb651kKX8/EGM1lNIe00pqzh10B/0tS82MLIFB76iiWT5sjxmbVx
	 uf6YK42t5w7BA==
Date: Wed, 20 May 2026 16:14:20 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Zhang Yi <zhangyi@everest-semi.com>, tiwai@suse.com,
	linux-sound@vger.kernel.org, peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com, ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com, ckeepax@opensource.cirrus.com,
	vkoul@kernel.org
Subject: Re: [PATCH v15 3/6] ASoC: es9356-sdca: Add ES9356 SDCA driver
Message-ID: <20260520231420.GE1607511@ax162>
References: <20260514075206.3483-1-zhangyi@everest-semi.com>
 <20260514075206.3483-4-zhangyi@everest-semi.com>
 <20260518224657.GA536765@ax162>
 <22c7d187-b696-4411-99db-3af470f5fcab@linux.dev>
 <20260519162352.GB3527449@ax162>
 <b17f8125-89bf-4032-a166-725be94466d2@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b17f8125-89bf-4032-a166-725be94466d2@sirena.org.uk>

On Tue, May 19, 2026 at 05:30:41PM +0100, Mark Brown wrote:
> On Tue, May 19, 2026 at 09:23:52AM -0700, Nathan Chancellor wrote:
> 
> > Yeah, I realized shortly after sending that suggestion through testing
> > that it would error during the Kconfig stage due to a recursive
> > dependency issue. However, CONFIG_SND_SOC_SDCA is not a user selectable
> > symbol and I only see it selected through
> 
> >   CONFIG_SND_SOC_ACPI_INTEL_MATCH -> CONFIG_SND_SOC_ACPI_INTEL_SDCA_QUIRKS
> 
> > so is it expected that users have to enable a driver that selects
> > CONFIG_SND_SOC_ACPI_INTEL_MATCH to get CONFIG_SND_SOC_SDCA?
> 
> That seems off, it's not like SoundWire is Intel or even x86 specific.
> I would expect either it should be user selectable or the drivers using
> it should select it.  Given that it's a class driver that probably means
> user selectable I think, some devices might need no extra support?

Yeah, just turning it into a user selectable symbol like

diff --git a/sound/soc/sdca/Kconfig b/sound/soc/sdca/Kconfig
index 87ab2895096c..4c0dcb9ff3b9 100644
--- a/sound/soc/sdca/Kconfig
+++ b/sound/soc/sdca/Kconfig
@@ -2,7 +2,7 @@
 menu "SoundWire (SDCA)"
 
 config SND_SOC_SDCA
-	tristate
+	tristate "SDCA core support"
 	depends on ACPI
 	select AUXILIARY_BUS
 	help

--

appears to work for me, in combination with adding

  depends on SND_SOC_SDCA

to the symbol for this driver.

-- 
Cheers,
Nathan
