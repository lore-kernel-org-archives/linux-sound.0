Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 782B21A0728;
	Sun, 19 Jul 2026 08:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784450001; cv=none; b=RYwPMPU4EH+L8MbIHLWiqgnfybeob4AHiMBKCXhiXsfyRTk2rCEL+TxL0Qwew7+FiEfF0YybJWq2GkQK+JCyBGheW/8ia11v+HgFS1fNrl1pajumSe3BTQBbT9nKRQQErVAqjwNWBADgZuuc5BZry4xqIsQakDNw7s9VP2C+MqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784450001; c=relaxed/simple;
	bh=CRZtWa6jBA/63jxOBSpI2FCOiPczqcGnY+LBknpacnc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pEOGzAtseiXzKxpCA8pTX26IC7Zmm57LgJf4PFoNCcOWPW7fhT6wOa59EhNQnnklwRY2vBeESdiiAM9sujRc3GEUIOXy6NPMZ7LLHU2iprDZ9ldpHCMH0OS+TXJm86EKQjXdzgWogR5Tp7b4lVLgjjbbQLs5OqkxHyWLYHJk4a0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KSVoK+f6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KSVoK+f6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D7771F000E9;
	Sun, 19 Jul 2026 08:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784450000;
	bh=szj1aY/omdqtH4EtEUFsZN2I0KbR/qyXhWFlR7oDZEE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KSVoK+f6OzellndR4jK9EG5F+WUwoJVbMM+88Lw5gHGI5n1EFYmsrTQOz/kLB0nic
	 0PwQ0OO4XqXE74vAAs1/RXDkxPbz6N4Uo9WoKgUjpOxMkhXvu7RYlICSciJuUzheD7
	 t1Irri9HJkdFH5pwcKY5VjsZxpsO+DuAuaFgPncji0ZclpmykIffkasZLrsW5yAn/B
	 QVz9yUHimVZsgTAQ9UegrXl4R9GoxsGoPdNvTgc3Gzpn0btiDLdXKvHPXl39ENmrLy
	 7HZ6tUpH0chCS4/Sfazj+pJh/BJK1pzhUOY6otb6u9jTuPAeBXBZWACAhVlN3mjXmn
	 nXAJ6Gz+9GJtQ==
Date: Sun, 19 Jul 2026 10:33:15 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Gianluca Boiano <morf3089@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
	"Wang, Sen" <sen@ti.com>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: sound: add Texas Instruments TAS2557
Message-ID: <20260719-furious-wine-tuna-f4acb8@quoll>
References: <20260717233402.414326-1-morf3089@gmail.com>
 <20260717233402.414326-2-morf3089@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260717233402.414326-2-morf3089@gmail.com>

On Sat, Jul 18, 2026 at 01:33:59AM +0200, Gianluca Boiano wrote:
> Document the TAS2557 mono Class-D smart amplifier with an integrated
> DSP for speaker protection. The device is controlled over I2C and
> receives audio over I2S/TDM (ASI). One node can describe either a
> single mono device or, via a two-entry `reg`, a stereo pair sharing
> one bus: the physical device at each `reg` index applies that half
> (DEV_A/DEV_B) of a stereo-tuned firmware image, so no separate
> channel-selection property is needed -- device order in `reg` is
> the only configuration required, matching the convention already
> used by ti,tas2781.yaml/ti,tas2563.yaml for the same TI firmware
> toolchain. `ti,imon-slot-nos`/`ti,vmon-slot-nos` follow the same
> per-index convention for the TDM sense-data slots. `reg` is capped
> at two entries because the uCDSP firmware container only defines
> mono or two-device (DEV_A/DEV_B) types -- there is no third slot to
> extend into regardless of DT shape.
> 
> The on-chip DSP boots from a firmware image generated per speaker
> design with the TI PurePath Console tuning tools; the optional
> firmware-name property selects a board-specific image, shared by
> every device in the group.
> 
> Addresses review from Krzysztof Kozlowski, who questioned a
> per-node channel-selection property (an earlier ti,channel/
> ti,audio-channel design) on the grounds that it doesn't scale and
> isn't how other multi-device TI amplifiers in-tree solve the same
> problem.

This paragraph does not look useful in commit log. This is part of
changelog rather.

> 
> Signed-off-by: Gianluca Boiano <morf3089@gmail.com>
> ---
> Changes in v3:
> - single-node reg-array model (up to two devices), matching
>   ti,tas2781.yaml; drop ti,channel, derive DEV_A/DEV_B from reg order
> - rename ti,imon-slot-no/ti,vmon-slot-no to the plural
>   ti,imon-slot-nos/ti,vmon-slot-nos arrays; firmware-name maxItems: 1
> 
> Changes in v2:
> - add the four mandatory supplies to "required" (Wang Sen)
> 
>  .../devicetree/bindings/sound/ti,tas2557.yaml | 174 ++++++++++++++++++
>  MAINTAINERS                                   |   1 +
>  2 files changed, 175 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

